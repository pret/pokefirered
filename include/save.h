#ifndef GUARD_SAVE_H
#define GUARD_SAVE_H

#include "global.h"

#define NUM_SECTORS 32 // defined in agb_flash but not in a header

#define SAVE_STATUS_EMPTY 0
#define SAVE_STATUS_OK 1
#define SAVE_STATUS_INVALID  2
#define SAVE_STATUS_NO_FLASH 4
#define SAVE_STATUS_ERROR 0xFF

enum
{
    SAVE_NORMAL,
    SAVE_LINK,
    SAVE_EREADER,
    SAVE_HALL_OF_FAME,
    SAVE_OVERWRITE_DIFFERENT_FILE,
    SAVE_HALL_OF_FAME_ERASE_BEFORE, // unused
};

struct SaveBlockChunk
{
    u8 *data;
    u16 size;
};

struct SaveSection
{
    u8 data[0xFF4];
    u16 id;
    u16 checksum;
    u32 signature;
    u32 counter;
}; // size is 0x1000

// headless save section?
struct UnkSaveSection
{
    u8 data[0xFF4];
    u32 signature;
}; // size is 0xFF8

struct SaveSectionOffsets
{
    u16 toAdd;
    u16 size;
};

// Emerald changes this definition to be the sectors per slot.
#define NUM_SECTORS_PER_SAVE_SLOT 14  // Number of sectors occupied by a save slot

#define UNKNOWN_CHECK_VALUE 0x8012025

#define SECTOR_SAVE1(n)  (n)
#define SECTOR_SAVE2(n)  ((n) + NUM_SECTORS_PER_SAVE_SLOT)
#define SECTOR_HOF(n)    ((n) + 2 * NUM_SECTORS_PER_SAVE_SLOT)
#define SECTOR_TTOWER(n) ((n) + 2 * NUM_SECTORS_PER_SAVE_SLOT + 2)

// SetSectorDamagedStatus states
enum
{
    ENABLE,
    DISABLE,
    CHECK // unused
};

extern u16 gFirstSaveSector;
extern u32 gPrevSaveCounter;
extern u16 gLastKnownGoodSector;
extern u32 gDamagedSaveSectors;
extern u32 gSaveCounter;
extern struct SaveSection *gFastSaveSection; // the pointer is in fast IWRAM but may sometimes point to the slower EWRAM.
extern u16 gUnknown_3005398;
extern u16 gSaveUnusedVar;
extern u16 gSaveFileStatus;
extern void (*gGameContinueCallback)(void);
extern struct SaveBlockChunk gRamSaveSectionLocations[0xE];
extern u16 gSaveSucceeded;

extern struct SaveSection gSaveDataBuffer;

void ClearSaveData(void);
void Save_ResetSaveCounters(void);
bool32 SetSectorDamagedStatus(u8 op, u8 bit);
u8 save_write_to_flash(u16 a1, const struct SaveBlockChunk *location);
u8 HandleWriteSector(u16 a1, const struct SaveBlockChunk *location);
u8 HandleWriteSectorNBytes(u8 sector, u8 *data, u16 size);
u8 TryWriteSector(u8 sector, u8 *data);
u32 RestoreSaveBackupVarsAndIncrement(const struct SaveBlockChunk *location);
u32 RestoreSaveBackupVars(const struct SaveBlockChunk *location);
u8 sub_80D9AA4(u16 a1, const struct SaveBlockChunk *location);
u8 sub_80D9B04(u16 a1, const struct SaveBlockChunk *location);
u8 ClearSaveData_2(u16 a1, const struct SaveBlockChunk *location);
u8 sav12_xor_get(u16 a1, const struct SaveBlockChunk *location);
u8 sub_80D9D88(u16 a1, const struct SaveBlockChunk *location);
u8 sub_80D9E14(u16 a1, const struct SaveBlockChunk *location);
u8 sub_80D9E54(u16 a1, const struct SaveBlockChunk *location);
u8 GetSaveValidStatus(const struct SaveBlockChunk *location);
u8 sub_80DA120(u8 a1, u8 *data, u16 size);
u8 DoReadFlashWholeSection(u8 sector, struct SaveSection *section);
u16 CalculateChecksum(void *data, u16 size);
void UpdateSaveAddresses(void);
u8 HandleSavingData(u8 saveType);
u8 TrySavingData(u8 saveType);
u8 SaveGame_AfterLinkTrade(void);
bool8 AfterLinkTradeSaveFailed(void);
u8 ClearSaveAfterLinkTradeSaveFailure(void);
u8 sub_80DA434(void);
u8 sub_80DA45C(void);
bool8 sub_80DA4A0(void);
u8 Save_LoadGameData(u8 saveType);
u32 TryCopySpecialSaveSection(u8 sector, u8 *dst);
u32 TryWriteSpecialSaveSection(u8 sector, u8 *src);
void Task_LinkSave(u8 taskId);

#endif // GUARD_SAVE_H
