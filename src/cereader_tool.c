#include "global.h"
#include "util.h"
#include "save.h"
#include "malloc.h"
#include "cereader_tool.h"

u8 sub_815D654(void)
{
    return (gSaveBlock1Ptr->unkArray[0].unk9 + 1) % 256;
}

static bool32 ValidateTrainerTowerTrainer(struct TrainerTowerFloor * floor)
{
    if (floor->floorIdx < 1 || floor->floorIdx > 8)
        return FALSE;
    if (floor->challengeType > 2)
        return FALSE;
    if (CalcByteArraySum((const u8 *)floor, offsetof(typeof(*floor), checksum)) != floor->checksum)
        return FALSE;
    return TRUE;
}

bool32 ValidateTrainerTowerData(struct EReaderTrainerHillSet * ttdata)
{
    u32 count = ttdata->count;
    s32 i;
    if (count < 1 || count > 8)
        return FALSE;
    for (i = 0; i < count; i++)
    {
        if (!ValidateTrainerTowerTrainer(&ttdata->floors[i]))
            return FALSE;
    }
    if (CalcByteArraySum((const u8 *)ttdata->floors, count * sizeof(ttdata->floors[0])) != ttdata->checksum)
        return FALSE;
    return TRUE;
}

#define SEC30_SIZE  (offsetof(struct EReaderTrainerHillSet, floors[4]))
#define SEC31_SIZE  (sizeof(struct EReaderTrainerHillSet) - SEC30_SIZE)

static bool32 CEReaderTool_SaveTrainerTower_r(struct EReaderTrainerHillSet * ttdata, u8 * buffer)
{
    AGB_ASSERT_EX(ttdata->dummy == 0, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/cereader_tool.c", 198);
    AGB_ASSERT_EX(ttdata->id == 0, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/cereader_tool.c", 199)

    memset(buffer, 0, 0x1000);
    memcpy(buffer, ttdata, SEC30_SIZE);
    buffer[1] = sub_815D654();
    if (TryWriteSpecialSaveSection(SECTOR_TTOWER(0), buffer) != TRUE)
        return FALSE;
    memset(buffer, 0, 0x1000);
    memcpy(buffer, (u8 *)ttdata + SEC30_SIZE, SEC31_SIZE);
    if (TryWriteSpecialSaveSection(SECTOR_TTOWER(1), buffer) != TRUE)
        return FALSE;
    return TRUE;
}

bool32 CEReaderTool_SaveTrainerTower(struct EReaderTrainerHillSet * ttdata)
{
    u8 * buffer = AllocZeroed(0x1000);
    bool32 result = CEReaderTool_SaveTrainerTower_r(ttdata, buffer);
    Free(buffer);
    return result;
}

static bool32 CEReaderTool_LoadTrainerTower_r(struct EReaderTrainerHillSet * ttdata, void * buffer)
{
    if (TryCopySpecialSaveSection(SECTOR_TTOWER(0), buffer) != 1)
        return FALSE;
    memcpy(ttdata + 0x000, buffer, SEC30_SIZE);

    if (TryCopySpecialSaveSection(SECTOR_TTOWER(1), buffer) != 1)
        return FALSE;
    memcpy((u8 *)ttdata + SEC30_SIZE, buffer, SEC31_SIZE);

    if (!ValidateTrainerTowerData(ttdata))
        return FALSE;
    return TRUE;
}

bool32 CEReaderTool_LoadTrainerTower(struct EReaderTrainerHillSet * ttdata)
{
    void * buffer = AllocZeroed(0x1000);
    bool32 success = CEReaderTool_LoadTrainerTower_r(ttdata, buffer);
    Free(buffer);
    return success;
}
