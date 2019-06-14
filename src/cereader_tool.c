#include "global.h"
#include "util.h"
#include "save.h"
#include "malloc.h"
#include "cereader_tool.h"

u8 sub_815D654(void)
{
    return (gSaveBlock1Ptr->unkArray[0].unk9 + 1) % 256;
}

static bool32 ValidateTrainerTowerTrainer(struct TrainerTowerTrainer * trainer)
{
    if (trainer->unk_001 < 1 || trainer->unk_001 > 8)
        return FALSE;
    if (trainer->unk_002 > 2)
        return FALSE;
    if (CalcByteArraySum((const u8 *)trainer, offsetof(typeof(*trainer), checksum)) != trainer->checksum)
        return FALSE;
    return TRUE;
}

bool32 ValidateTrainerTowerData(struct TrainerTowerData * ttdata)
{
    u32 count = ttdata->count;
    s32 i;
    if (count < 1 || count > 8)
        return FALSE;
    for (i = 0; i < count; i++)
    {
        if (!ValidateTrainerTowerTrainer(&ttdata->trainers[i]))
            return FALSE;
    }
    if (CalcByteArraySum((const u8 *)ttdata->trainers, count * sizeof(ttdata->trainers[0])) != ttdata->checksum)
        return FALSE;
    return TRUE;
}

#define SEC30_SIZE  (offsetof(struct TrainerTowerData, trainers[4]))
#define SEC31_SIZE  (sizeof(struct TrainerTowerData) - SEC30_SIZE)

static bool32 CEReaderTool_SaveTrainerTower_r(struct TrainerTowerData * ttdata, u8 * buffer)
{
    AGB_ASSERT_EX(ttdata->dummy == 0, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/cereader_tool.c", 198);
    AGB_ASSERT_EX(ttdata->id == 0, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/cereader_tool.c", 199)

    memset(buffer, 0, 0x1000);
    memcpy(buffer, ttdata, SEC30_SIZE);
    buffer[1] = sub_815D654();
    if (TryWriteSpecialSaveSection(30, buffer) != TRUE)
        return FALSE;
    memset(buffer, 0, 0x1000);
    memcpy(buffer, (u8 *)ttdata + SEC30_SIZE, SEC31_SIZE);
    if (TryWriteSpecialSaveSection(31, buffer) != TRUE)
        return FALSE;
    return TRUE;
}

bool32 CEReaderTool_SaveTrainerTower(struct TrainerTowerData * ttdata)
{
    u8 * buffer = AllocZeroed(0x1000);
    bool32 result = CEReaderTool_SaveTrainerTower_r(ttdata, buffer);
    Free(buffer);
    return result;
}

static bool32 CEReaderTool_LoadTrainerTower_r(struct TrainerTowerData * ttdata, void * buffer)
{
    if (TryCopySpecialSaveSection(30, buffer) != 1)
        return FALSE;
    memcpy(ttdata + 0x000, buffer, SEC30_SIZE);

    if (TryCopySpecialSaveSection(31, buffer) != 1)
        return FALSE;
    memcpy((u8 *)ttdata + SEC30_SIZE, buffer, SEC31_SIZE);

    if (!ValidateTrainerTowerData(ttdata))
        return FALSE;
    return TRUE;
}

bool32 CEReaderTool_LoadTrainerTower(struct TrainerTowerData * ttdata)
{
    void * buffer = AllocZeroed(0x1000);
    bool32 success = CEReaderTool_LoadTrainerTower_r(ttdata, buffer);
    Free(buffer);
    return success;
}
