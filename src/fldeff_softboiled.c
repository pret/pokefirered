#include "global.h"
#include "party_menu.h"
#include "sound.h"
#include "string_util.h"
#include "menu.h"
#include "constants/songs.h"
#include "fldeff.h"

static void sub_80E57E8(u8 taskId);
static void sub_80E583C(u8 taskId);
static void sub_80E58A0(u8 taskId);
static void sub_80E5934(u8 taskId);

extern const u8 gUnknown_84169F8[];
extern const u8 gUnknown_8416F27[];

bool8 hm_prepare_dive_probably(void)
{
    u16 maxHp = GetMonData(&gPlayerParty[GetCursorSelectionMonId()], MON_DATA_MAX_HP);
    u16 curHp = GetMonData(&gPlayerParty[GetCursorSelectionMonId()], MON_DATA_HP);

    if (curHp > maxHp / 5)
        return TRUE;
    else
        return FALSE;
}

void sub_80E56DC(u8 taskId)
{
    gUnknown_203B0A0.unkB = 10;
    gUnknown_203B0A0.unkA = gUnknown_203B0A0.unk9;
    sub_811F818(GetCursorSelectionMonId(), 1);
    sub_8121D0C(5);
    gTasks[taskId].func = sub_811FB28;
}

void sub_80E5724(u8 taskId)
{
    u8 r8 = gUnknown_203B0A0.unk9;
    u8 r5 = gUnknown_203B0A0.unkA;
    u16 curHp;
    s16 delta;

    if (r5 > 6)
    {
        gUnknown_203B0A0.unkB = 0;
        sub_8121D0C(0);
        gTasks[taskId].func = sub_811FB28;
    }
    else
    {
        curHp = GetMonData(&gPlayerParty[r5], MON_DATA_HP);
        if (curHp == 0 || r8 == r5 || GetMonData(&gPlayerParty[r5], MON_DATA_MAX_HP) == curHp)
        {
            sub_80E5934(taskId);
        }
        else
        {
            PlaySE(SE_KAIFUKU);
            sub_8120760(taskId, r8, -1, GetMonData(&gPlayerParty[r8], MON_DATA_MAX_HP) / 5, sub_80E57E8);
        }
    }
}

static void sub_80E57E8(u8 taskId)
{
    PlaySE(SE_KAIFUKU);
    sub_8120760(taskId, gUnknown_203B0A0.unkA, 1, GetMonData(&gPlayerParty[gUnknown_203B0A0.unk9], MON_DATA_MAX_HP) / 5, sub_80E583C);
}

static void sub_80E583C(u8 taskId)
{
    GetMonNickname(&gPlayerParty[gUnknown_203B0A0.unkA], gStringVar1);
    StringExpandPlaceholders(gStringVar4, gUnknown_8416F27);
    sub_81202F8(gStringVar4, 0);
    ScheduleBgCopyTilemapToVram(2);
    gTasks[taskId].func = sub_80E58A0;
}

static void sub_80E58A0(u8 taskId)
{
    if (sub_8120370() != TRUE)
    {
        gUnknown_203B0A0.unkB = 0;
        sub_811F818(gUnknown_203B0A0.unk9, 0);
        gUnknown_203B0A0.unk9 = gUnknown_203B0A0.unkA;
        sub_811F818(gUnknown_203B0A0.unkA, 1);
        ClearMenuWindow(6, 0);
        ClearWindowTilemap(6);
        sub_8121D0C(0);
        gTasks[taskId].func = sub_811FB28;
    }
}

static void sub_80E5900(u8 taskId)
{
    if (sub_8120370() != TRUE)
    {
        sub_8121D0C(5);
        gTasks[taskId].func = sub_811FB28;
    }
}

static void sub_80E5934(u8 taskId)
{
    PlaySE(SE_SELECT);
    sub_81202F8(gUnknown_84169F8, 0);
    ScheduleBgCopyTilemapToVram(2);
    gTasks[taskId].func = sub_80E5900;
}
