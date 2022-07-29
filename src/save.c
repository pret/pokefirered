#include "global.h"
#include "save.h"
#include "decompress.h"
#include "overworld.h"
#include "load_save.h"
#include "task.h"
#include "link.h"
#include "save_failed_screen.h"
#include "fieldmap.h"
#include "gba/flash_internal.h"

#define FILE_SIGNATURE 0x08012025  // signature value to determine if a sector is in use

#define TOTAL_FLASH_SECTORS 32

// Divide save blocks into individual chunks to be written to flash sectors

// Each 4 KiB flash sector contains 3968 bytes of actual data followed by a 128 byte footer
#define SECTOR_DATA_SIZE 3968
#define SECTOR_FOOTER_SIZE 128

/*
 * Sector Layout:
 *
 * Sectors 0 - 13:      Save Slot 1
 * Sectors 14 - 27:     Save Slot 2
 * Sectors 28 - 29:     Hall of Fame
 * Sector 30:           e-Reader/Mystery Gift Stuff (note: e-Reader is deprecated in Emerald US)
 * Sector 31:           Recorded Battle
 *
 * There are two save slots for saving the player's game data. We alternate between
 * them each time the game is saved, so that if the current save slot is corrupt,
 * we can load the previous one. We also rotate the sectors in each save slot
 * so that the same data is not always being written to the same sector. This
 * might be done to reduce wear on the flash memory, but I'm not sure, since all
 * 14 sectors get written anyway.
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

const struct SaveSectionOffsets gSaveSectionOffsets[] =
{
    SAVEBLOCK_CHUNK(gSaveBlock2, 0),

    SAVEBLOCK_CHUNK(gSaveBlock1, 0),
    SAVEBLOCK_CHUNK(gSaveBlock1, 1),
    SAVEBLOCK_CHUNK(gSaveBlock1, 2),
    SAVEBLOCK_CHUNK(gSaveBlock1, 3),

    SAVEBLOCK_CHUNK(gPokemonStorage, 0),
    SAVEBLOCK_CHUNK(gPokemonStorage, 1),
    SAVEBLOCK_CHUNK(gPokemonStorage, 2),
    SAVEBLOCK_CHUNK(gPokemonStorage, 3),
    SAVEBLOCK_CHUNK(gPokemonStorage, 4),
    SAVEBLOCK_CHUNK(gPokemonStorage, 5),
    SAVEBLOCK_CHUNK(gPokemonStorage, 6),
    SAVEBLOCK_CHUNK(gPokemonStorage, 7),
    SAVEBLOCK_CHUNK(gPokemonStorage, 8)
};

// Sector num to begin writing save data. Sectors are rotated each time the game is saved. (possibly to avoid wear on flash memory?)
u16 gFirstSaveSector;
u32 gPrevSaveCounter;
u16 gLastKnownGoodSector;
u32 gDamagedSaveSectors;
u32 gSaveCounter;
struct SaveSection *gFastSaveSection; // the pointer is in fast IWRAM but may sometimes point to the slower EWRAM.
u16 gUnknown_3005398;
u16 gSaveUnusedVar;
u16 gSaveFileStatus;
void (*gGameContinueCallback)(void);
struct SaveBlockChunk gRamSaveSectionLocations[0xE];
u16 gSaveSucceeded;

EWRAM_DATA struct SaveSection gSaveDataBuffer = {0};
EWRAM_DATA u32 gSaveUnusedVar2 = 0;

void ClearSaveData(void)
{
    u16 i;

    for (i = 0; i < NUM_SECTORS; i++)
        EraseFlashSector(i);
}

void Save_ResetSaveCounters(void)
{
    gSaveCounter = 0;
    gFirstSaveSector = 0;
    gDamagedSaveSectors = 0;
}

bool32 SetSectorDamagedStatus(u8 op, u8 sectorNum)
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

// If chunkId is 0xFFFF, this function will write all of the chunks pointed to by 'chunks'.
// Otherwise, it will write a single chunk with the given 'chunkId'.
u8 save_write_to_flash(u16 chunkId, const struct SaveBlockChunk *chunks)
{
    u32 retVal;
    u16 i;

    gFastSaveSection = &gSaveDataBuffer;

    if (chunkId != 0xFFFF)  // write single chunk
    {
        retVal = HandleWriteSector(chunkId, chunks);
    }
    else  // write all chunks
    {
        gLastKnownGoodSector = gFirstSaveSector; // backup the current written sector before attempting to write.
        gPrevSaveCounter = gSaveCounter;
        gFirstSaveSector++;
        gFirstSaveSector %= NUM_SECTORS_PER_SAVE_SLOT; // array count save sector locations
        gSaveCounter++;
        retVal = SAVE_STATUS_OK;

        for (i = 0; i < NUM_SECTORS_PER_SAVE_SLOT; i++)
            HandleWriteSector(i, chunks);

        // Check for any bad sectors
        if (gDamagedSaveSectors != 0) // skip the damaged sector.
        {
            retVal = SAVE_STATUS_ERROR;
            gFirstSaveSector = gLastKnownGoodSector;
            gSaveCounter = gPrevSaveCounter;
        }
    }

    return retVal;
}

u8 HandleWriteSector(u16 chunkId, const struct SaveBlockChunk *chunks)
{
    u16 i;
    u16 sectorNum;
    u8 *chunkData;
    u16 chunkSize;

    // select sector number
    sectorNum = chunkId + gFirstSaveSector;
    sectorNum %= NUM_SECTORS_PER_SAVE_SLOT;
    // select save slot
    sectorNum += NUM_SECTORS_PER_SAVE_SLOT * (gSaveCounter % 2);

    chunkData = chunks[chunkId].data;
    chunkSize = chunks[chunkId].size;

    // clear save section.
    for (i = 0; i < sizeof(struct SaveSection); i++)
        ((char *)gFastSaveSection)[i] = 0;

    gFastSaveSection->id = chunkId;
    gFastSaveSection->signature = FILE_SIGNATURE;
    gFastSaveSection->counter = gSaveCounter;

    for (i = 0; i < chunkSize; i++)
        gFastSaveSection->data[i] = chunkData[i];

    gFastSaveSection->checksum = CalculateChecksum(chunkData, chunkSize);
    return TryWriteSector(sectorNum, gFastSaveSection->data);
}

u8 HandleWriteSectorNBytes(u8 sector, u8 *data, u16 size)
{
    u16 i;
    struct SaveSection *section = &gSaveDataBuffer;

    for (i = 0; i < sizeof(struct SaveSection); i++)
        ((char *)section)[i] = 0;

    section->signature = FILE_SIGNATURE;

    for (i = 0; i < size; i++)
        section->data[i] = data[i];

    section->id = CalculateChecksum(data, size); // though this appears to be incorrect, it might be some sector checksum instead of a whole save checksum and only appears to be relevent to HOF data, if used.
    return TryWriteSector(sector, section->data);
}

u8 TryWriteSector(u8 sectorNum, u8 *data)
{
    if (ProgramFlashSectorAndVerify(sectorNum, data) != 0) // is damaged?
    {
        SetSectorDamagedStatus(ENABLE, sectorNum); // set damaged sector bits.
        return SAVE_STATUS_ERROR;
    }
    else
    {
        SetSectorDamagedStatus(DISABLE, sectorNum); // unset damaged sector bits. it's safe now.
        return SAVE_STATUS_OK;
    }
}

u32 RestoreSaveBackupVarsAndIncrement(const struct SaveBlockChunk *chunk) // chunk is unused
{
    gFastSaveSection = &gSaveDataBuffer;
    gLastKnownGoodSector = gFirstSaveSector;
    gPrevSaveCounter = gSaveCounter;
    gFirstSaveSector++;
    gFirstSaveSector %= NUM_SECTORS_PER_SAVE_SLOT;
    gSaveCounter++;
    gUnknown_3005398 = 0;
    gDamagedSaveSectors = 0;
    return 0;
}

u32 RestoreSaveBackupVars(const struct SaveBlockChunk *chunk) // chunk is unused
{
    gFastSaveSection = &gSaveDataBuffer;
    gLastKnownGoodSector = gFirstSaveSector;
    gPrevSaveCounter = gSaveCounter;
    gUnknown_3005398 = 0;
    gDamagedSaveSectors = 0;
    return 0;
}

u8 sub_80D9AA4(u16 a1, const struct SaveBlockChunk *chunk)
{
    u8 retVal;

    if (gUnknown_3005398 < a1 - 1)
    {
        retVal = SAVE_STATUS_OK;
        HandleWriteSector(gUnknown_3005398, chunk);
        gUnknown_3005398++;
        if (gDamagedSaveSectors)
        {
            retVal = SAVE_STATUS_ERROR;
            gFirstSaveSector = gLastKnownGoodSector;
            gSaveCounter = gPrevSaveCounter;
        }
    }
    else
    {
        retVal = SAVE_STATUS_ERROR;
    }

    return retVal;
}

u8 sub_80D9B04(u16 a1, const struct SaveBlockChunk *chunk)
{
    u8 retVal = SAVE_STATUS_OK;

    ClearSaveData_2(a1 - 1, chunk);

    if (gDamagedSaveSectors)
    {
        retVal = SAVE_STATUS_ERROR;
        gFirstSaveSector = gLastKnownGoodSector;
        gSaveCounter = gPrevSaveCounter;
    }
    return retVal;
}

u8 ClearSaveData_2(u16 chunkId, const struct SaveBlockChunk *chunks)
{
    u16 i;
    u16 sector;
    u8 *data;
    u16 size;
    u8 status;

    // select sector number
    sector = chunkId + gFirstSaveSector;
    sector %= NUM_SECTORS_PER_SAVE_SLOT;
    // select save slot
    sector += NUM_SECTORS_PER_SAVE_SLOT * (gSaveCounter % 2);

    data = chunks[chunkId].data;
    size = chunks[chunkId].size;

    // clear temp save section.
    for (i = 0; i < sizeof(struct SaveSection); i++)
        ((char *)gFastSaveSection)[i] = 0;

    gFastSaveSection->id = chunkId;
    gFastSaveSection->signature = FILE_SIGNATURE;
    gFastSaveSection->counter = gSaveCounter;

    // set temp section's data.
    for (i = 0; i < size; i++)
        gFastSaveSection->data[i] = data[i];

    // calculate checksum.
    gFastSaveSection->checksum = CalculateChecksum(data, size);

    EraseFlashSector(sector);

    status = SAVE_STATUS_OK;

    for (i = 0; i < sizeof(struct UnkSaveSection); i++)
    {
        if (ProgramFlashByte(sector, i, gFastSaveSection->data[i]))
        {
            status = SAVE_STATUS_ERROR;
            break;
        }
    }

    if (status == SAVE_STATUS_ERROR)
    {
        SetSectorDamagedStatus(ENABLE, sector);
        return SAVE_STATUS_ERROR;
    }
    else
    {
        status = SAVE_STATUS_OK;

        for (i = 0; i < 7; i++)
        {
            if (ProgramFlashByte(sector, 0xFF9 + i, ((u8 *)gFastSaveSection)[0xFF9 + i]))
            {
                status = SAVE_STATUS_ERROR;
                break;
            }
        }

        if (status == SAVE_STATUS_ERROR)
        {
            SetSectorDamagedStatus(ENABLE, sector);
            return SAVE_STATUS_ERROR;
        }
        else
        {
            SetSectorDamagedStatus(DISABLE, sector);
            return SAVE_STATUS_OK;
        }
    }
}

u8 sav12_xor_get(u16 a1, const struct SaveBlockChunk *chunk)
{
    u16 sector;

    // select sector number
    sector = a1 + gFirstSaveSector - 1;
    sector %= NUM_SECTORS_PER_SAVE_SLOT;
    // select save slot
    sector += NUM_SECTORS_PER_SAVE_SLOT * (gSaveCounter % 2);

    if (ProgramFlashByte(sector, sizeof(struct UnkSaveSection), ((u8 *)gFastSaveSection)[sizeof(struct UnkSaveSection)]))
    {
        // sector is damaged, so enable the bit in gDamagedSaveSectors and restore the last written sector and save counter.
        SetSectorDamagedStatus(ENABLE, sector);
        gFirstSaveSector = gLastKnownGoodSector;
        gSaveCounter = gPrevSaveCounter;
        return SAVE_STATUS_ERROR;
    }
    else
    {
        SetSectorDamagedStatus(DISABLE, sector);
        return SAVE_STATUS_OK;
    }
}

u8 sub_80D9D88(u16 a1, const struct SaveBlockChunk *chunk)
{
    u16 sector;

    sector = a1 + gFirstSaveSector - 1;
    sector %= NUM_SECTORS_PER_SAVE_SLOT;
    sector += NUM_SECTORS_PER_SAVE_SLOT * (gSaveCounter % 2);

    if (ProgramFlashByte(sector, sizeof(struct UnkSaveSection), 0x25))
    {
        // sector is damaged, so enable the bit in gDamagedSaveSectors and restore the last written sector and save counter.
        SetSectorDamagedStatus(ENABLE, sector);
        gFirstSaveSector = gLastKnownGoodSector;
        gSaveCounter = gPrevSaveCounter;
        return SAVE_STATUS_ERROR;
    }
    else
    {
        SetSectorDamagedStatus(DISABLE, sector);
        return SAVE_STATUS_OK;
    }
}

u8 sub_80D9E14(u16 a1, const struct SaveBlockChunk *chunk)
{
    u8 retVal;
    gFastSaveSection = &gSaveDataBuffer;
    if (a1 != 0xFFFF)
    {
        retVal = SAVE_STATUS_ERROR;
    }
    else
    {
        retVal = GetSaveValidStatus(chunk);
        sub_80D9E54(0xFFFF, chunk);
    }

    return retVal;
}

u8 sub_80D9E54(u16 a1, const struct SaveBlockChunk *chunks)
{
    u16 i;
    u16 checksum;
    u16 sector = NUM_SECTORS_PER_SAVE_SLOT * (gSaveCounter % 2);
    u16 id;

    for (i = 0; i < NUM_SECTORS_PER_SAVE_SLOT; i++)
    {
        DoReadFlashWholeSection(i + sector, gFastSaveSection);
        id = gFastSaveSection->id;
        if (id == 0)
            gFirstSaveSector = i;
        checksum = CalculateChecksum(gFastSaveSection->data, chunks[id].size);
        if (gFastSaveSection->signature == FILE_SIGNATURE
         && gFastSaveSection->checksum == checksum)
        {
            u16 j;
            for (j = 0; j < chunks[id].size; j++)
                chunks[id].data[j] = gFastSaveSection->data[j];
        }
    }

    return 1;
}

u8 GetSaveValidStatus(const struct SaveBlockChunk *chunks)
{
    u16 sector;
    bool8 signatureValid;
    u16 checksum;
    u32 slot1saveCounter = 0;
    u32 slot2saveCounter = 0;
    u8 slot1Status;
    u8 slot2Status;
    u32 validSectors;
    const u32 ALL_SECTORS = (1 << NUM_SECTORS_PER_SAVE_SLOT) - 1;  // bitmask of all saveblock sectors

    // check save slot 1.
    validSectors = 0;
    signatureValid = FALSE;
    for (sector = 0; sector < NUM_SECTORS_PER_SAVE_SLOT; sector++)
    {
        DoReadFlashWholeSection(sector, gFastSaveSection);
        if (gFastSaveSection->signature == FILE_SIGNATURE)
        {
            signatureValid = TRUE;
            checksum = CalculateChecksum(gFastSaveSection->data, chunks[gFastSaveSection->id].size);
            if (gFastSaveSection->checksum == checksum)
            {
                slot1saveCounter = gFastSaveSection->counter;
                validSectors |= 1 << gFastSaveSection->id;
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
    {
        slot1Status = SAVE_STATUS_EMPTY;
    }

    // check save slot 2.
    validSectors = 0;
    signatureValid = FALSE;
    for (sector = 0; sector < NUM_SECTORS_PER_SAVE_SLOT; sector++)
    {
        DoReadFlashWholeSection(NUM_SECTORS_PER_SAVE_SLOT + sector, gFastSaveSection);
        if (gFastSaveSection->signature == FILE_SIGNATURE)
        {
            signatureValid = TRUE;
            checksum = CalculateChecksum(gFastSaveSection->data, chunks[gFastSaveSection->id].size);
            if (gFastSaveSection->checksum == checksum)
            {
                slot2saveCounter = gFastSaveSection->counter;
                validSectors |= 1 << gFastSaveSection->id;
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
    {
        slot2Status = SAVE_STATUS_EMPTY;
    }

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
        gFirstSaveSector = 0;
        return SAVE_STATUS_EMPTY;
    }

    gSaveCounter = 0;
    gFirstSaveSector = 0;
    return 2;
}

u8 sub_80DA120(u8 sector, u8 *data, u16 size)
{
    u16 i;
    struct SaveSection *section = &gSaveDataBuffer;

    DoReadFlashWholeSection(sector, section);
    if (section->signature == FILE_SIGNATURE)
    {
        u16 checksum = CalculateChecksum(section->data, size);
        if (section->id == checksum)
        {
            for (i = 0; i < size; i++)
                data[i] = section->data[i];
            return SAVE_STATUS_OK;
        }
        else
        {
            return SAVE_STATUS_INVALID;
        }
    }
    else
    {
        return SAVE_STATUS_EMPTY;
    }
}

u8 DoReadFlashWholeSection(u8 sector, struct SaveSection *section)
{
    ReadFlash(sector, 0, section->data, sizeof(struct SaveSection));
    return 1;
}

u16 CalculateChecksum(void *data, u16 size)
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

void UpdateSaveAddresses(void)
{
    int i = 0;

    gRamSaveSectionLocations[i].data = (void*)(gSaveBlock2Ptr) + gSaveSectionOffsets[i].toAdd;
    gRamSaveSectionLocations[i].size = gSaveSectionOffsets[i].size;

    for (i = 1; i < 5; i++)
    {
        gRamSaveSectionLocations[i].data = (void*)(gSaveBlock1Ptr) + gSaveSectionOffsets[i].toAdd;
        gRamSaveSectionLocations[i].size = gSaveSectionOffsets[i].size;
    }

    for (i = 5; i < 14; i++)
    {
        gRamSaveSectionLocations[i].data = (void*)(gPokemonStoragePtr) + gSaveSectionOffsets[i].toAdd;
        gRamSaveSectionLocations[i].size = gSaveSectionOffsets[i].size;

        i++;i--; // needed to match
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
    case SAVE_HALL_OF_FAME_ERASE_BEFORE: // deletes HOF before overwriting HOF completely. unused
        for (i = 0xE * 2 + 0; i < 32; i++)
            EraseFlashSector(i);
        // fallthrough
    case SAVE_HALL_OF_FAME: // hall of fame.
        if (GetGameStat(GAME_STAT_ENTERED_HOF) < 999)
            IncrementGameStat(GAME_STAT_ENTERED_HOF);
        tempAddr = gDecompressionBuffer;
        HandleWriteSectorNBytes(0x1C, tempAddr, 0xF80);
        HandleWriteSectorNBytes(0x1D, tempAddr + 0xF80, 0xF80);
        // fallthrough
    case SAVE_NORMAL: // normal save. also called by overwriting your own save.
    default:
        SaveSerializedGame();
        save_write_to_flash(0xFFFF, gRamSaveSectionLocations);
        break;
    case SAVE_LINK: // _081532C4
        SaveSerializedGame();
        for(i = 0; i < 5; i++)
            save_write_to_flash(i, gRamSaveSectionLocations);
        break;
    case SAVE_EREADER:
        SaveSerializedGame();
        save_write_to_flash(0, gRamSaveSectionLocations);
        break;
    case SAVE_OVERWRITE_DIFFERENT_FILE:
        for (i = (0xE * 2 + 0); i < 32; i++)
            EraseFlashSector(i); // erase HOF.
        SaveSerializedGame();
        save_write_to_flash(0xFFFF, gRamSaveSectionLocations);
        break;
    }
    gMain.vblankCounter1 = backupPtr;
    return 0;
}

u8 TrySavingData(u8 saveType)
{
    if(gFlashMemoryPresent == TRUE)
    {
        HandleSavingData(saveType);
        if(gDamagedSaveSectors)
            DoSaveFailedScreen(saveType);
        else
            goto OK; // really?
    }
    gSaveSucceeded = 0xFF;
    return 0xFF;

OK:
    gSaveSucceeded = 1;
    return 1;
}

u8 SaveGame_AfterLinkTrade(void)
{
    if (gFlashMemoryPresent != TRUE)
        return 1;
    UpdateSaveAddresses();
    SaveSerializedGame();
    RestoreSaveBackupVarsAndIncrement(gRamSaveSectionLocations);
    return 0;
}

bool8 AfterLinkTradeSaveFailed(void) 
{
    u8 retVal = sub_80D9AA4(0xE, gRamSaveSectionLocations);
    if (gDamagedSaveSectors)
        DoSaveFailedScreen(SAVE_NORMAL);
    if (retVal == SAVE_STATUS_ERROR)
        return 1;
    else
        return 0;
}

u8 ClearSaveAfterLinkTradeSaveFailure(void)
{
    sub_80D9B04(0xE, gRamSaveSectionLocations);
    if (gDamagedSaveSectors)
        DoSaveFailedScreen(SAVE_NORMAL);
    return 0;
}

u8 sub_80DA434(void)
{
    sav12_xor_get(0xE, gRamSaveSectionLocations);
    if (gDamagedSaveSectors)
        DoSaveFailedScreen(SAVE_NORMAL);
    return 0;
}

u8 sub_80DA45C(void)
{
    if (gFlashMemoryPresent != TRUE)
        return 1;

    UpdateSaveAddresses();
    SaveSerializedGame();
    RestoreSaveBackupVars(gRamSaveSectionLocations);
    sub_80D9B04(gUnknown_3005398 + 1, gRamSaveSectionLocations);
    return 0;
}

bool8 sub_80DA4A0(void)
{
    u8 retVal = FALSE;
    u16 val = ++gUnknown_3005398;
    if (val <= 4)
    {
        sub_80D9B04(gUnknown_3005398 + 1, gRamSaveSectionLocations);
        sub_80D9D88(val, gRamSaveSectionLocations);
    }
    else
    {
        sub_80D9D88(val, gRamSaveSectionLocations);
        retVal = TRUE;
    }
    if (gDamagedSaveSectors)
        DoSaveFailedScreen(SAVE_LINK);
    return retVal;
}

u8 Save_LoadGameData(u8 saveType)
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
        result = sub_80D9E14(0xFFFF, gRamSaveSectionLocations);
        LoadSerializedGame();
        gSaveFileStatus = result;
        gGameContinueCallback = 0;
        break;
    case SAVE_HALL_OF_FAME:
        result = sub_80DA120(SECTOR_HOF(0), gDecompressionBuffer, 0xF80);
        if (result == SAVE_STATUS_OK)
            result = sub_80DA120(SECTOR_HOF(1), gDecompressionBuffer + 0xF80, 0xF80);
        break;
    }

    return result;
}

u32 TryCopySpecialSaveSection(u8 sector, u8 *dst)
{
    s32 i;
    s32 size;
    u8 *savData;

    if (sector != SECTOR_TTOWER(0) && sector != SECTOR_TTOWER(1))
        return 0xFF;
    ReadFlash(sector, 0, (u8 *)&gSaveDataBuffer, sizeof(struct SaveSection));
    if (*(u32 *)(&gSaveDataBuffer.data[0]) != 0xB39D)
        return 0xFF;
    // copies whole save section except u32 counter
    i = 0;
    size = 0xFFB;
    savData = &gSaveDataBuffer.data[4];
    for (; i <= size; i++)
        dst[i] = savData[i];
    return 1;
}

u32 TryWriteSpecialSaveSection(u8 sector, u8 *src)
{
    s32 i;
    s32 size;
    u8 *savData;
    void* savDataBuffer;

    if (sector != SECTOR_TTOWER(0) && sector != SECTOR_TTOWER(1))
        return 0xFF;

    savDataBuffer = &gSaveDataBuffer;
    *(u32 *)(savDataBuffer) = 0xB39D;

    // copies whole save section except u32 counter
    i = 0;
    size = 0xFFB;
    savData = &gSaveDataBuffer.data[4];
    for (; i <= size; i++)
        savData[i] = src[i];
    if (ProgramFlashSectorAndVerify(sector, savDataBuffer) != 0)
        return 0xFF;
    return 1;
}

void Task_LinkSave(u8 taskId)
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
        SaveGame_AfterLinkTrade();
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
        if (AfterLinkTradeSaveFailed())
            gTasks[taskId].data[0] = 6;
        else
            gTasks[taskId].data[0] = 4;
        break;
    case 6:
        ClearSaveAfterLinkTradeSaveFailure();
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
            sub_80DA434();
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
