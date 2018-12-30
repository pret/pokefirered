#include "global.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "malloc.h"
#include "save.h"
#include "event_data.h"
#include "cereader_tool.h"

struct UnkStruct_8479D34
{
    s8 mapGroup;
    s8 mapNum;
    u8 filler[2];
    u8 flags1[8];
    u8 flags2[8];
    u8 flags3[8];
};

extern const struct UnkStruct_8479D34 gUnknown_8479D34[15];

void sub_815D96C(void);

bool32 sub_815D7BC(void * dest, void * buffer)
{
    if (TryCopySpecialSaveSection(30, buffer) != 1)
        return FALSE;
    memcpy(dest + 0x000, buffer, 0xF88);

    if (TryCopySpecialSaveSection(31, buffer) != 1)
        return FALSE;
    memcpy(dest + 0xF88, buffer, 0xF80);

    if (!sub_815D6B4(dest))
        return FALSE;
    return TRUE;
}

bool32 sub_815D80C(void * dest)
{
    void * buffer = AllocZeroed(0x1000);
    bool32 success = sub_815D7BC(dest, buffer);
    Free(buffer);
    return success;
}

bool32 sub_815D834(void)
{
    // Stubbed out?
    return FALSE;
}

void sub_815D838(void)
{
    u8 i, j;

    for (i = 0; i < 15; i++)
    {
        const u8 * flags1 = gUnknown_8479D34[i].flags1;
        const u8 * flags2 = gUnknown_8479D34[i].flags2;
        const u8 * flags3 = gUnknown_8479D34[i].flags3;
        for (j = 0; j < 8; j++)
        {
            if (flags1[j] != 0xFF)
                FlagSet(FLAG_TRAINER_TOWER_START + flags1[j]);
            if (flags2[j] != 0xFF)
                FlagSet(FLAG_TRAINER_TOWER_START + flags2[j]);
            if (flags3[j] != 0xFF)
                FlagSet(FLAG_TRAINER_TOWER_START + flags3[j]);
        }
    }
}

void sub_815D8C8(void)
{
    u16 var = VarGet(VAR_0x4023);
    if (var < 1500) {
        VarSet(VAR_0x4023, var + 1);
    }
}

void sub_815D8F8(void)
{
    u8 i;
    register u32 found_map asm("r4") = 0xFF;
    for (i = 0; i < 15; i++)
    {
        if (gUnknown_8479D34[i].mapGroup == gSaveBlock1Ptr->location.mapGroup && gUnknown_8479D34[i].mapNum == gSaveBlock1Ptr->location.mapNum)
            found_map = i;
    }

    if (found_map == 0xFF)
        return;
    if (VarGet(VAR_0x4023) >= 1500)
    {
        VarSet(VAR_0x4023, 0);
        sub_815D838();
        sub_815D96C();
    }
}
