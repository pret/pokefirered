#include "global.h"
#include "save.h"
#include "decompress.h"
#include "overworld.h"
#include "load_save.h"
#include "task.h"
#include "link.h"
#include "save_failed_screen.h"
#include "fieldmap.h"
#include "pokemon_storage_system.h"
#include "gba/flash_internal.h"

static u8 HandleWriteSector(u16 sectorId, const struct SaveSectorLocation *locations);
static u8 TryWriteSector(u8 sectorNum, u8 *data);
static u8 HandleReplaceSector(u16 sectorId, const struct SaveSectorLocation *locations);
static u8 CopySaveSlotData(u16 sectorId, const struct SaveSectorLocation *locations);
static u8 GetSaveValidStatus(const struct SaveSectorLocation *locations);
static u8 ReadFlashSector(u8 sectorId, struct SaveSector *sector);
static u16 CalculateChecksum(void *data, u16 size);

/*
 * Sector Layout:
 *
 * Sectors 0 - 13:      Save Slot 1
 * Sectors 14 - 27:     Save Slot 2
 * Sectors 28 - 29:     Hall of Fame
 * Sectors 30 - 31:     Trainer Tower
 *
 * There are two save slots for saving the player's game data. We alternate between
 * them each time the game is saved, so that if the current save slot is corrupt,
 * we can load the previous one. We also rotate the sectors in each save slot
 * so that the same data is not always being written to the same sector. This
 * might be done to reduce wear on the flash memory, but I'm not sure, since all
 * 14 sectors get written anyway.
 *
 * See SECTOR_ID_* constants in save.h
 */

// (u8 *)structure was removed from the first statement of the macro in Emerald
// and Fire Red/Leaf Green. This is because malloc is used to allocate addresses
// so storing the raw addresses should not be done in the offsets information.
#define SAVEBLOCK_CHUNK(structure, chunkNum)                                   \
{                                                                              \
    chunkNum * SECTOR_DATA_SIZE,                                               \
    sizeof(structure) >= chunkNum * SECTOR_DATA_SIZE ?                         \
    min(sizeof(structure) - chunkNum * SECTOR_DATA_SIZE, SECTOR_DATA_SIZE) : 0 \
}

struct
{
    u16 offset;
    u16 size;
} static const sSaveSlotLayout[NUM_SECTORS_PER_SLOT] =
{
    SAVEBLOCK_CHUNK(struct SaveBlock2, 0), // SECTOR_ID_SAVEBLOCK2

    SAVEBLOCK_CHUNK(struct SaveBlock1, 0), // SECTOR_ID_SAVEBLOCK1_START
    SAVEBLOCK_CHUNK(struct SaveBlock1, 1),
    SAVEBLOCK_CHUNK(struct SaveBlock1, 2),
    SAVEBLOCK_CHUNK(struct SaveBlock1, 3), // SECTOR_ID_SAVEBLOCK1_END

    SAVEBLOCK_CHUNK(struct PokemonStorage, 0), // SECTOR_ID_PKMN_STORAGE_START
    SAVEBLOCK_CHUNK(struct PokemonStorage, 1),
    SAVEBLOCK_CHUNK(struct PokemonStorage, 2),
    SAVEBLOCK_CHUNK(struct PokemonStorage, 3),
    SAVEBLOCK_CHUNK(struct PokemonStorage, 4),
    SAVEBLOCK_CHUNK(struct PokemonStorage, 5),
    SAVEBLOCK_CHUNK(struct PokemonStorage, 6),
    SAVEBLOCK_CHUNK(struct PokemonStorage, 7),
    SAVEBLOCK_CHUNK(struct PokemonStorage, 8), // SECTOR_ID_PKMN_STORAGE_END
};

// These will produce an error if a save struct is larger than the space
// alloted for it in the flash.
STATIC_ASSERT(sizeof(struct SaveBlock2) <= SECTOR_DATA_SIZE, SaveBlock2FreeSpace);
STATIC_ASSERT(sizeof(struct SaveBlock1) <= SECTOR_DATA_SIZE * (SECTOR_ID_SAVEBLOCK1_END - SECTOR_ID_SAVEBLOCK1_START + 1), SaveBlock1FreeSpace);
STATIC_ASSERT(sizeof(struct PokemonStorage) <= SECTOR_DATA_SIZE * (SECTOR_ID_PKMN_STORAGE_END - SECTOR_ID_PKMN_STORAGE_START + 1), PokemonStorageFreeSpace);

// Sector num to begin writing save data. Sectors are rotated each time the game is saved. (possibly to avoid wear on flash memory?)
COMMON_DATA u16 gLastWrittenSector = 0;
COMMON_DATA u32 gLastSaveCounter = 0;
COMMON_DATA u16 gLastKnownGoodSector = 0;
COMMON_DATA u32 gDamagedSaveSectors = 0;
COMMON_DATA u32 gSaveCounter = 0;
COMMON_DATA struct SaveSector *gSaveDataBufferPtr = NULL; // the pointer is in fast IWRAM but points to the slower EWRAM.
COMMON_DATA u16 gIncrementalSectorId = 0;
COMMON_DATA u16 gSaveUnusedVar = 0;
COMMON_DATA u16 gSaveFileStatus = 0;
COMMON_DATA void (*gGameContinueCallback)(void) = NULL;
COMMON_DATA struct SaveSectorLocation gRamSaveSectorLocations[NUM_SECTORS_PER_SLOT] = {0};
COMMON_DATA u16 gSaveAttemptStatus = 0;

EWRAM_DATA struct SaveSector gSaveDataBuffer = {0};
EWRAM_DATA u32 gSaveUnusedVar2 = 0;

void ClearSaveData(void)
{
    u16 i;

    for (i = 0; i < SECTORS_COUNT; i++)
        EraseFlashSector(i);
}

void Save_ResetSaveCounters(void)
{
    gSaveCounter = 0;
    gLastWrittenSector = 0;
    gDamagedSaveSectors = 0;
}

static bool32 SetDamagedSectorBits(u8 op, u8 sectorNum)
{
    bool32 retVal = FALSE;

    switch (op)
    {
    case ENABLE:
        gDamagedSaveSectors |= (1 << sectorNum);
        break;
    case DISABLE:
        gDamagedSaveSectors &= ~(1 << sectorNum);
        break;
    case CHECK: // unused
        if (gDamagedSaveSectors & (1 << sectorNum))
            retVal = TRUE;
        break;
    }

    return retVal;
}

static u8 WriteSaveSectorOrSlot(u16 sectorId, const struct SaveSectorLocation *locations)
{
    u32 status;
    u16 i;

    gSaveDataBufferPtr = &gSaveDataBuffer;

    if (sectorId != FULL_SAVE_SLOT)  // write single sector
        status = HandleWriteSector(sectorId, locations);

    else  // write all sectors
    {
        gLastKnownGoodSector = gLastWrittenSector; // backup the current written sector before attempting to write.
        gLastSaveCounter = gSaveCounter;
        gLastWrittenSector++;
        gLastWrittenSector %= NUM_SECTORS_PER_SLOT; // array count save sector locations
        gSaveCounter++;
        status = SAVE_STATUS_OK;

        for (i = 0; i < NUM_SECTORS_PER_SLOT; i++)
            HandleWriteSector(i, locations);

        // Check for any bad sectors
        if (gDamagedSaveSectors != 0) // skip the damaged sector.
        {
            status = SAVE_STATUS_ERROR;
            gLastWrittenSector = gLastKnownGoodSector;
            gSaveCounter = gLastSaveCounter;
        }
    }

    return status;
}

static u8 HandleWriteSector(u16 sectorId, const struct SaveSectorLocation *locations)
{
    u16 i;
    u16 sectorNum;
    u8 *data;
    u16 size;

    sectorNum = gLastWrittenSector + sectorId;
    sectorNum %= NUM_SECTORS_PER_SLOT;
    sectorNum += NUM_SECTORS_PER_SLOT * (gSaveCounter % NUM_SAVE_SLOTS);

    data = locations[sectorId].data;
    size = locations[sectorId].size;

    // clear buffer
    for (i = 0; i < SECTOR_SIZE; i++)
        ((char *)gSaveDataBufferPtr)[i] = 0;

    // fill buffer with save data
    gSaveDataBufferPtr->id = sectorId;
    gSaveDataBufferPtr->signature = SECTOR_SIGNATURE;
    gSaveDataBufferPtr->counter = gSaveCounter;

    for (i = 0; i < size; i++)
        gSaveDataBufferPtr->data[i] = data[i];

    gSaveDataBufferPtr->checksum = CalculateChecksum(data, size);
    return TryWriteSector(sectorNum, gSaveDataBufferPtr->data);
}

static u8 HandleWriteSectorNBytes(u8 sectorId, u8 *data, u16 size)
{
    u16 i;
    struct SaveSector *sector = &gSaveDataBuffer;

    for (i = 0; i < SECTOR_SIZE; i++)
        ((char *)sector)[i] = 0;

    sector->signature = SECTOR_SIGNATURE;

    for (i = 0; i < size; i++)
        sector->data[i] = data[i];

    sector->id = CalculateChecksum(data, size); // though this appears to be incorrect, it might be some sector checksum instead of a whole save checksum and only appears to be relevent to HOF data, if used.
    return TryWriteSector(sectorId, sector->data);
}

static u8 TryWriteSector(u8 sectorNum, u8 *data)
{
    if (ProgramFlashSectorAndVerify(sectorNum, data)) // is damaged?
    {
        SetDamagedSectorBits(ENABLE, sectorNum); // set damaged sector bits.
        return SAVE_STATUS_ERROR;
    }
    else
    {
        SetDamagedSectorBits(DISABLE, sectorNum); // unset damaged sector bits. it's safe now.
        return SAVE_STATUS_OK;
    }
}

static u32 RestoreSaveBackupVarsAndIncrement(const struct SaveSectorLocation *locations)
{
    gSaveDataBufferPtr = &gSaveDataBuffer;
    gLastKnownGoodSector = gLastWrittenSector;
    gLastSaveCounter = gSaveCounter;
    gLastWrittenSector++;
    gLastWrittenSector %= NUM_SECTORS_PER_SLOT;
    gSaveCounter++;
    gIncrementalSectorId = 0;
    gDamagedSaveSectors = 0;
    return 0;
}

static u32 RestoreSaveBackupVars(const struct SaveSectorLocation *locations)
{
    gSaveDataBufferPtr = &gSaveDataBuffer;
    gLastKnownGoodSector = gLastWrittenSector;
    gLastSaveCounter = gSaveCounter;
    gIncrementalSectorId = 0;
    gDamagedSaveSectors = 0;
    return 0;
}

static u8 HandleWriteIncrementalSector(u16 numSectors, const struct SaveSectorLocation *locations)
{
    u8 status;

    if (gIncrementalSectorId < numSectors - 1)
    {
        status = SAVE_STATUS_OK;
        HandleWriteSector(gIncrementalSectorId, locations);
        gIncrementalSectorId++;
        if (gDamagedSaveSectors)
        {
            status = SAVE_STATUS_ERROR;
            gLastWrittenSector = gLastKnownGoodSector;
            gSaveCounter = gLastSaveCounter;
        }
    }
    else
        status = SAVE_STATUS_ERROR;

    return status;
}

static u8 HandleReplaceSectorAndVerify(u16 sectorId, const struct SaveSectorLocation *locations)
{
    u8 status = SAVE_STATUS_OK;

    HandleReplaceSector(sectorId - 1, locations);

    if (gDamagedSaveSectors)
    {
        status = SAVE_STATUS_ERROR;
        gLastWrittenSector = gLastKnownGoodSector;
        gSaveCounter = gLastSaveCounter;
    }
    return status;
}

static u8 HandleReplaceSector(u16 sectorId, const struct SaveSectorLocation *locations)
{
    u16 i;
    u16 sectorNum;
    u8 *data;
    u16 size;
    u8 status;

    sectorNum = gLastWrittenSector + sectorId;
    sectorNum %= NUM_SECTORS_PER_SLOT;
    sectorNum += NUM_SECTORS_PER_SLOT * (gSaveCounter % NUM_SAVE_SLOTS);

    data = locations[sectorId].data;
    size = locations[sectorId].size;

    // clear buffer
    for (i = 0; i < SECTOR_SIZE; i++)
        ((char *)gSaveDataBufferPtr)[i] = 0;

    // fill buffer with save data
    gSaveDataBufferPtr->id = sectorId;
    gSaveDataBufferPtr->signature = SECTOR_SIGNATURE;
    gSaveDataBufferPtr->counter = gSaveCounter;
    for (i = 0; i < size; i++)
        gSaveDataBufferPtr->data[i] = data[i];

    gSaveDataBufferPtr->checksum = CalculateChecksum(data, size);

    // erase old save data
    EraseFlashSector(sectorNum);

    status = SAVE_STATUS_OK;

    // write new save data, excluding the signature and counter fields
    for (i = 0; i < SECTOR_SIGNATURE_OFFSET; i++)
    {
        if (ProgramFlashByte(sectorNum, i, gSaveDataBufferPtr->data[i]))
        {
            status = SAVE_STATUS_ERROR;
            break;
        }
    }

    if (status == SAVE_STATUS_ERROR)
    {
        SetDamagedSectorBits(ENABLE, sectorNum);
        return SAVE_STATUS_ERROR;
    }
    else
    {
        status = SAVE_STATUS_OK;

        // write signature (skipping the first byte) and counter fields
        // the first signature byte skipped is instead written in WriteSectorSignatureByte
        for (i = 0; i < SECTOR_SIZE - (SECTOR_SIGNATURE_OFFSET + 1); i++)
        {
            if (ProgramFlashByte(sectorNum, SECTOR_SIGNATURE_OFFSET + 1 + i, ((u8 *)gSaveDataBufferPtr)[SECTOR_SIGNATURE_OFFSET + 1 + i]))
            {
                status = SAVE_STATUS_ERROR;
                break;
            }
        }

        if (status == SAVE_STATUS_ERROR)
        {
            SetDamagedSectorBits(ENABLE, sectorNum);
            return SAVE_STATUS_ERROR;
        }
        else
        {
            SetDamagedSectorBits(DISABLE, sectorNum);
            return SAVE_STATUS_OK;
        }
    }
}

static u8 CopySectorSignatureByte(u16 sectorId, const struct SaveSectorLocation *locations)
{
    u16 sector;

    sector = gLastWrittenSector + sectorId - 1;
    sector %= NUM_SECTORS_PER_SLOT;
    sector += NUM_SECTORS_PER_SLOT * (gSaveCounter % NUM_SAVE_SLOTS);

    if (ProgramFlashByte(sector, SECTOR_SIGNATURE_OFFSET, ((u8 *)gSaveDataBufferPtr)[SECTOR_SIGNATURE_OFFSET]))
    {
        // sector is damaged, so enable the bit in gDamagedSaveSectors and restore the last written sector and save counter.
        SetDamagedSectorBits(ENABLE, sector);
        gLastWrittenSector = gLastKnownGoodSector;
        gSaveCounter = gLastSaveCounter;
        return SAVE_STATUS_ERROR;
    }
    else
    {
        SetDamagedSectorBits(DISABLE, sector);
        return SAVE_STATUS_OK;
    }
}

static u8 WriteSectorSignatureByte(u16 sectorId, const struct SaveSectorLocation *locations)
{
    u16 sector;

    sector = gLastWrittenSector + sectorId - 1;
    sector %= NUM_SECTORS_PER_SLOT;
    sector += NUM_SECTORS_PER_SLOT * (gSaveCounter % NUM_SAVE_SLOTS);

    // write only the first byte of the signature, which was skipped in HandleReplaceSector
    if (ProgramFlashByte(sector, SECTOR_SIGNATURE_OFFSET, SECTOR_SIGNATURE & 0xFF))
    {
        // sector is damaged, so enable the bit in gDamagedSaveSectors and restore the last written sector and save counter.
        SetDamagedSectorBits(ENABLE, sector);
        gLastWrittenSector = gLastKnownGoodSector;
        gSaveCounter = gLastSaveCounter;
        return SAVE_STATUS_ERROR;
    }
    else
    {
        SetDamagedSectorBits(DISABLE, sector);
        return SAVE_STATUS_OK;
    }
}

static u8 TryLoadSaveSlot(u16 sectorId, const struct SaveSectorLocation *locations)
{
    u8 status;
    gSaveDataBufferPtr = &gSaveDataBuffer;
    if (sectorId != FULL_SAVE_SLOT)
        status = SAVE_STATUS_ERROR;

    else
    {
        status = GetSaveValidStatus(locations);
        CopySaveSlotData(FULL_SAVE_SLOT, locations);
    }

    return status;
}

// sectorId is unused. All sectors in the save slot are read and copied.
static u8 CopySaveSlotData(u16 sectorId, const struct SaveSectorLocation *locations)
{
    u16 i;
    u16 checksum;
    u16 sector = NUM_SECTORS_PER_SLOT * (gSaveCounter % NUM_SAVE_SLOTS);
    u16 id;

    for (i = 0; i < NUM_SECTORS_PER_SLOT; i++)
    {
        ReadFlashSector(i + sector, gSaveDataBufferPtr);
        id = gSaveDataBufferPtr->id;
        if (id == 0)
            gLastWrittenSector = i;

        checksum = CalculateChecksum(gSaveDataBufferPtr->data, locations[id].size);
        if (gSaveDataBufferPtr->signature == SECTOR_SIGNATURE && gSaveDataBufferPtr->checksum == checksum)
        {
            u16 j;
            for (j = 0; j < locations[id].size; j++)
                locations[id].data[j] = gSaveDataBufferPtr->data[j];
        }
    }

    return SAVE_STATUS_OK;
}

static u8 GetSaveValidStatus(const struct SaveSectorLocation *locations)
{
    u16 sector;
    bool8 signatureValid;
    u16 checksum;
    u32 slot1saveCounter = 0;
    u32 slot2saveCounter = 0;
    u8 slot1Status;
    u8 slot2Status;
    u32 validSectors;
    const u32 ALL_SECTORS = (1 << NUM_SECTORS_PER_SLOT) - 1;  // bitmask of all saveblock sectors

    // check save slot 1.
    validSectors = 0;
    signatureValid = FALSE;
    for (sector = 0; sector < NUM_SECTORS_PER_SLOT; sector++)
    {
        ReadFlashSector(sector, gSaveDataBufferPtr);
        if (gSaveDataBufferPtr->signature == SECTOR_SIGNATURE)
        {
            signatureValid = TRUE;
            checksum = CalculateChecksum(gSaveDataBufferPtr->data, locations[gSaveDataBufferPtr->id].size);
            if (gSaveDataBufferPtr->checksum == checksum)
            {
                slot1saveCounter = gSaveDataBufferPtr->counter;
                validSectors |= 1 << gSaveDataBufferPtr->id;
            }
        }
    }

    if (signatureValid)
    {
        if (validSectors == ALL_SECTORS)
            slot1Status = SAVE_STATUS_OK;
        else
            slot1Status = SAVE_STATUS_ERROR;
    }
    else
        slot1Status = SAVE_STATUS_EMPTY;

    // check save slot 2.
    validSectors = 0;
    signatureValid = FALSE;
    for (sector = 0; sector < NUM_SECTORS_PER_SLOT; sector++)
    {
        ReadFlashSector(NUM_SECTORS_PER_SLOT + sector, gSaveDataBufferPtr);
        if (gSaveDataBufferPtr->signature == SECTOR_SIGNATURE)
        {
            signatureValid = TRUE;
            checksum = CalculateChecksum(gSaveDataBufferPtr->data, locations[gSaveDataBufferPtr->id].size);
            if (gSaveDataBufferPtr->checksum == checksum)
            {
                slot2saveCounter = gSaveDataBufferPtr->counter;
                validSectors |= 1 << gSaveDataBufferPtr->id;
            }
        }
    }

    if (signatureValid)
    {
        if (validSectors == ALL_SECTORS)
            slot2Status = SAVE_STATUS_OK;
        else
            slot2Status = SAVE_STATUS_ERROR;
    }
    else
        slot2Status = SAVE_STATUS_EMPTY;

    if (slot1Status == SAVE_STATUS_OK && slot2Status == SAVE_STATUS_OK)
    {
        // Choose counter of the most recent save file
        if ((slot1saveCounter == -1 && slot2saveCounter == 0) || (slot1saveCounter == 0 && slot2saveCounter == -1))
        {
            if ((unsigned)(slot1saveCounter + 1) < (unsigned)(slot2saveCounter + 1))
                gSaveCounter = slot2saveCounter;
            else
                gSaveCounter = slot1saveCounter;
        }
        else
        {
            if (slot1saveCounter < slot2saveCounter)
                gSaveCounter = slot2saveCounter;
            else
                gSaveCounter = slot1saveCounter;
        }
        return SAVE_STATUS_OK;
    }

    if (slot1Status == SAVE_STATUS_OK)
    {
        gSaveCounter = slot1saveCounter;
        if (slot2Status == SAVE_STATUS_ERROR)
            return SAVE_STATUS_ERROR;
        else
            return SAVE_STATUS_OK;
    }

    if (slot2Status == SAVE_STATUS_OK)
    {
        gSaveCounter = slot2saveCounter;
        if (slot1Status == SAVE_STATUS_ERROR)
            return SAVE_STATUS_ERROR;
        else
            return SAVE_STATUS_OK;
    }

    if (slot1Status == SAVE_STATUS_EMPTY && slot2Status == SAVE_STATUS_EMPTY)
    {
        gSaveCounter = 0;
        gLastWrittenSector = 0;
        return SAVE_STATUS_EMPTY;
    }

    gSaveCounter = 0;
    gLastWrittenSector = 0;
    return SAVE_STATUS_INVALID;
}

static u8 TryLoadSaveSector(u8 sectorId, u8 *data, u16 size)
{
    u16 i;
    struct SaveSector *sector = &gSaveDataBuffer;

    ReadFlashSector(sectorId, sector);
    if (sector->signature == SECTOR_SIGNATURE)
    {
        u16 checksum = CalculateChecksum(sector->data, size);
        if (sector->id == checksum)
        {
            for (i = 0; i < size; i++)
                data[i] = sector->data[i];

            return SAVE_STATUS_OK;
        }
        else
            return SAVE_STATUS_INVALID;

    }
    else
        return SAVE_STATUS_EMPTY;
}

static u8 ReadFlashSector(u8 sectorId, struct SaveSector *sector)
{
    ReadFlash(sectorId, 0, sector->data, SECTOR_SIZE);
    return 1;
}

static u16 CalculateChecksum(void *data, u16 size)
{
    u16 i;
    u32 checksum = 0;

    for (i = 0; i < (size / 4); i++)
    {
        // checksum += *(u32 *)data++;
        // For compatibility with modern gcc, these statements were separated.
        checksum += *(u32 *)data;
        data += 4;
    }

    return ((checksum >> 16) + checksum);
}

static void UpdateSaveAddresses(void)
{
    int i = 0;

    gRamSaveSectorLocations[i].data = (void *)(gSaveBlock2Ptr) + sSaveSlotLayout[i].offset;
    gRamSaveSectorLocations[i].size = sSaveSlotLayout[i].size;

    for (i = SECTOR_ID_SAVEBLOCK1_START; i <= SECTOR_ID_SAVEBLOCK1_END; i++)
    {
        gRamSaveSectorLocations[i].data = (void *)(gSaveBlock1Ptr) + sSaveSlotLayout[i].offset;
        gRamSaveSectorLocations[i].size = sSaveSlotLayout[i].size;
    }

    for (/*i = SECTOR_ID_PKMN_STORAGE_START*/; i <= SECTOR_ID_PKMN_STORAGE_END; i++) // do not initialize here to ensure matching
    {
        gRamSaveSectorLocations[i].data = (void *)(gPokemonStoragePtr) + sSaveSlotLayout[i].offset;
        gRamSaveSectorLocations[i].size = sSaveSlotLayout[i].size;
    }
}

u8 HandleSavingData(u8 saveType)
{
    u8 i;
    u32 *backupPtr = gMain.vblankCounter1;
    u8 *tempAddr;

    gMain.vblankCounter1 = NULL;
    UpdateSaveAddresses();
    switch (saveType)
    {
    case SAVE_HALL_OF_FAME_ERASE_BEFORE: // Unused
        for (i = SECTOR_ID_HOF_1; i < SECTORS_COUNT; i++)
            EraseFlashSector(i);
        // fallthrough
    case SAVE_HALL_OF_FAME:
        if (GetGameStat(GAME_STAT_ENTERED_HOF) < 999)
            IncrementGameStat(GAME_STAT_ENTERED_HOF);
        tempAddr = gDecompressionBuffer;
        HandleWriteSectorNBytes(SECTOR_ID_HOF_1, tempAddr, SECTOR_DATA_SIZE);
        HandleWriteSectorNBytes(SECTOR_ID_HOF_2, tempAddr + SECTOR_DATA_SIZE, SECTOR_DATA_SIZE);
        // fallthrough
    case SAVE_NORMAL:
    default:
        SaveSerializedGame();
        WriteSaveSectorOrSlot(FULL_SAVE_SLOT, gRamSaveSectorLocations);
        break;
    case SAVE_LINK:
        SaveSerializedGame();
        // only SaveBlock2 and SaveBlock1 (ignores storage in PC)
        for(i = SECTOR_ID_SAVEBLOCK2; i <= SECTOR_ID_SAVEBLOCK1_END; i++)
            WriteSaveSectorOrSlot(i, gRamSaveSectorLocations);
        break;
    case SAVE_EREADER: // unused
        SaveSerializedGame();
        // only SaveBlock2
        WriteSaveSectorOrSlot(SECTOR_ID_SAVEBLOCK2, gRamSaveSectorLocations);
        break;
    case SAVE_OVERWRITE_DIFFERENT_FILE:
        for (i = SECTOR_ID_HOF_1; i < SECTORS_COUNT; i++)
            EraseFlashSector(i);
        SaveSerializedGame();
        WriteSaveSectorOrSlot(FULL_SAVE_SLOT, gRamSaveSectorLocations);
        break;
    }
    gMain.vblankCounter1 = backupPtr;
    return 0;
}

u8 TrySavingData(u8 saveType)
{
    if (gFlashMemoryPresent != TRUE)
    {
        gSaveAttemptStatus = SAVE_STATUS_ERROR;
        return SAVE_STATUS_ERROR;
    }

    HandleSavingData(saveType);
    if (!gDamagedSaveSectors)
    {
        gSaveAttemptStatus = SAVE_STATUS_OK;
        return SAVE_STATUS_OK;
    }
    else
    {
        DoSaveFailedScreen(saveType);
        gSaveAttemptStatus = SAVE_STATUS_ERROR;
        return SAVE_STATUS_ERROR;
    }
}

bool8 LinkFullSave_Init(void)
{
    if (gFlashMemoryPresent != TRUE)
        return TRUE;

    UpdateSaveAddresses();
    SaveSerializedGame();
    RestoreSaveBackupVarsAndIncrement(gRamSaveSectorLocations);
    return FALSE;
}

bool8 LinkFullSave_WriteSector(void) 
{
    u8 status = HandleWriteIncrementalSector(NUM_SECTORS_PER_SLOT, gRamSaveSectorLocations);
    if (gDamagedSaveSectors)
        DoSaveFailedScreen(SAVE_NORMAL);

    if (status == SAVE_STATUS_ERROR)
        return TRUE;
    else
        return FALSE;
}

bool8 LinkFullSave_ReplaceLastSector(void)
{
    HandleReplaceSectorAndVerify(NUM_SECTORS_PER_SLOT, gRamSaveSectorLocations);
    if (gDamagedSaveSectors)
        DoSaveFailedScreen(SAVE_NORMAL);

    return FALSE;
}

bool8 LinkFullSave_SetLastSectorSignature(void)
{
    CopySectorSignatureByte(NUM_SECTORS_PER_SLOT, gRamSaveSectorLocations);
    if (gDamagedSaveSectors)
        DoSaveFailedScreen(SAVE_NORMAL);

    return FALSE;
}

bool8 WriteSaveBlock2(void)
{
    if (gFlashMemoryPresent != TRUE)
        return TRUE;

    UpdateSaveAddresses();
    SaveSerializedGame();
    RestoreSaveBackupVars(gRamSaveSectorLocations);

    // Because RestoreSaveBackupVars is called immediately prior,
    // gIncrementalSectorId will always be 0 (SECTOR_ID_SAVEBLOCK2) at this point,
    // so this function only saves the first sector (SECTOR_ID_SAVEBLOCK2)
    HandleReplaceSectorAndVerify(gIncrementalSectorId + 1, gRamSaveSectorLocations);
    return FALSE;
}

// Used in conjunction with WriteSaveBlock2 to write both for certain link saves.
// This is called repeatedly in a task, writing one sector of SaveBlock1 each time it is called.
// Returns TRUE when all sectors of SaveBlock1 have been written.
bool8 WriteSaveBlock1Sector(void)
{
    u8 finished = FALSE;
    u16 sectorId = ++gIncrementalSectorId;
    if (sectorId <= SECTOR_ID_SAVEBLOCK1_END)
    {
        HandleReplaceSectorAndVerify(gIncrementalSectorId + 1, gRamSaveSectorLocations);
        WriteSectorSignatureByte(sectorId, gRamSaveSectorLocations);
    }
    else
    {
        WriteSectorSignatureByte(sectorId, gRamSaveSectorLocations);
        finished = TRUE;
    }
    if (gDamagedSaveSectors)
        DoSaveFailedScreen(SAVE_LINK);

    return finished;
}

u8 LoadGameSave(u8 saveType)
{
    u8 result;

    if (gFlashMemoryPresent != TRUE)
    {
        gSaveFileStatus = SAVE_STATUS_NO_FLASH;
        return SAVE_STATUS_ERROR;
    }

    UpdateSaveAddresses();
    switch (saveType)
    {
    case SAVE_NORMAL:
    default:
        result = TryLoadSaveSlot(FULL_SAVE_SLOT, gRamSaveSectorLocations);
        LoadSerializedGame();
        gSaveFileStatus = result;
        gGameContinueCallback = NULL;
        break;
    case SAVE_HALL_OF_FAME:
        result = TryLoadSaveSector(SECTOR_ID_HOF_1, gDecompressionBuffer, SECTOR_DATA_SIZE);
        if (result == SAVE_STATUS_OK)
            result = TryLoadSaveSector(SECTOR_ID_HOF_2, gDecompressionBuffer + SECTOR_DATA_SIZE, SECTOR_DATA_SIZE);
        break;
    }

    return result;
}

u32 TryReadSpecialSaveSector(u8 sectorId, u8 *dst)
{
    s32 i;
    s32 size;
    u8 *savData;

    if (sectorId != SECTOR_ID_TRAINER_TOWER_1 && sectorId != SECTOR_ID_TRAINER_TOWER_2)
        return SAVE_STATUS_ERROR;

    ReadFlash(sectorId, 0, (u8 *)&gSaveDataBuffer, SECTOR_SIZE);
    if (*(u32 *)(&gSaveDataBuffer.data[0]) != SPECIAL_SECTOR_SENTINEL)
        return SAVE_STATUS_ERROR;

    // copies whole save sector except the counter field
    i = 0;
    size = SECTOR_COUNTER_OFFSET - 1;
    savData = &gSaveDataBuffer.data[4]; // to skip past SPECIAL_SECTOR_SENTINEL
    for (; i <= size; i++)
        dst[i] = savData[i];

    return SAVE_STATUS_OK;
}

u32 TryWriteSpecialSaveSector(u8 sector, u8 *src)
{
    s32 i;
    s32 size;
    u8 *savData;
    void *savDataBuffer;

    if (sector != SECTOR_ID_TRAINER_TOWER_1 && sector != SECTOR_ID_TRAINER_TOWER_2)
        return SAVE_STATUS_ERROR;

    savDataBuffer = &gSaveDataBuffer;
    *(u32 *)(savDataBuffer) = SPECIAL_SECTOR_SENTINEL;

    // copies whole save sector except the counter field
    i = 0;
    size = SECTOR_COUNTER_OFFSET - 1;
    savData = &gSaveDataBuffer.data[4]; // to skip past SPECIAL_SECTOR_SENTINEL
    for (; i <= size; i++)
        savData[i] = src[i];

    if (ProgramFlashSectorAndVerify(sector, savDataBuffer) != 0)
        return SAVE_STATUS_ERROR;

    return SAVE_STATUS_OK;
}

void Task_LinkFullSave(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        gSoftResetDisabled = TRUE;
        gTasks[taskId].data[0] = 1;
        break;
    case 1:
        SetLinkStandbyCallback();
        gTasks[taskId].data[0] = 2;
        break;
    case 2:
        if (IsLinkTaskFinished())
        {
            SaveMapView();
            gTasks[taskId].data[0] = 3;
        }
        break;
    case 3:
        SetContinueGameWarpStatusToDynamicWarp();
        LinkFullSave_Init();
        gTasks[taskId].data[0] = 4;
        break;
    case 4:
        if (++gTasks[taskId].data[1] == 5)
        {
            gTasks[taskId].data[1] = 0;
            gTasks[taskId].data[0] = 5;
        }
        break;
    case 5:
        if (LinkFullSave_WriteSector())
            gTasks[taskId].data[0] = 6;
        else
            gTasks[taskId].data[0] = 4;
        break;
    case 6:
        LinkFullSave_ReplaceLastSector();
        gTasks[taskId].data[0] = 7;
        break;
    case 7:
        ClearContinueGameWarpStatus2();
        SetLinkStandbyCallback();
        gTasks[taskId].data[0] = 8;
        break;
    case 8:
        if (IsLinkTaskFinished())
        {
            LinkFullSave_SetLastSectorSignature();
            gTasks[taskId].data[0] = 9;
        }
        break;
    case 9:
        SetLinkStandbyCallback();
        gTasks[taskId].data[0] = 10;
        break;
    case 10:
        if (IsLinkTaskFinished())
            gTasks[taskId].data[0]++;
        break;
    case 11:
        if (++gTasks[taskId].data[1] > 5)
        {
            gSoftResetDisabled = FALSE;
            DestroyTask(taskId);
        }
        break;
    }
}
