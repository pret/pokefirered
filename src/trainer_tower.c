#include "global.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "malloc.h"
#include "save.h"
#include "string_util.h"
#include "event_data.h"
#include "random.h"
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

struct UnkStruct_203F458
{
    /* 0x0000 */ u8 filler_0000[0x1F0C];
};

struct UnkStruct_203F45C
{
    /* 0x00 */ u8 unk_00[11];
    /* 0x0B */ u8 filler_0B[49];
    /* 0x3C */ u8 unk_3C;
    /* 0x3D */ u8 unk_3D;
};

EWRAM_DATA struct UnkStruct_203F458 * gUnknown_203F458 = NULL;
EWRAM_DATA struct UnkStruct_203F45C * gUnknown_203F45C = NULL;

void sub_815D96C(void);
void sub_815DC8C(void);  // setup
void sub_815DD2C(void);  // teardown
void sub_815DD44(void);
void sub_815DF54(void);
void sub_815E160(void);
void sub_815E1C0(void);
void sub_815E1F0(void);
void sub_815E218(void);
void sub_815E28C(void);
void sub_815E394(void);
void sub_815E408(void);
void sub_815E4B0(void);
void sub_815E56C(void);
void sub_815E5C4(void);
void sub_815E5F0(void);
void sub_815E658(void);
void sub_815E720(void);
void sub_815E88C(void);
void sub_815E8B4(void);
void sub_815E8CC(void);
void sub_815E908(void);
void sub_815E948(void);
void sub_815E9C8(void);

extern const struct UnkStruct_8479D34 gUnknown_8479D34[15];
extern void (*const gUnknown_847A230[])(void);

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

void sub_815D8F8(void) // fakematching
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

void sub_815D96C(void)
{
    u8 i, j;
    const u8 * flags;
    u16 rval;

    for (i = 0; i < 15; i++)
    {
        rval = Random() % 100;
        if (rval >= 90)
            flags = gUnknown_8479D34[i].flags1;
        else if (rval >= 60)
            flags = gUnknown_8479D34[i].flags2;
        else
            flags = gUnknown_8479D34[i].flags3;
        for (j = 0; j < 8; j++)
        {
            if (flags[j] != 0xFF)
                FlagClear(FLAG_TRAINER_TOWER_START + flags[j]);
        }
    }
}

void sub_815D9E8(void)
{
    sub_815DC8C();
    gUnknown_847A230[gSpecialVar_0x8004]();
    sub_815DD2C();
}

u8 sub_815DA10(void)
{
    return gFacilityClassToTrainerClass[gUnknown_203F45C->unk_3D];
}

void sub_815DA28(u8 * dest)
{
    StringCopyN(dest, gUnknown_203F45C->unk_00, 11);
}

u8 sub_815DA3C(void)
{
    return gFacilityClassToPicIndex[gUnknown_203F45C->unk_3D];
}
