#include "global.h"
#include "party_menu.h"
#include "sound.h"
#include "string_util.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "constants/songs.h"
#include "fldeff.h"

static void sub_80E57E8(u8 taskId);
static void sub_80E583C(u8 taskId);
static void sub_80E58A0(u8 taskId);
static void sub_80E5934(u8 taskId);

extern const u8 gUnknown_84169F8[];
extern const u8 gText_PkmnHPRestoredByVar2[];

bool8 hm_prepare_dive_probably(void)
{
    u16 maxHp = GetMonData(&gPlayerParty[GetCursorSelectionMonId()], MON_DATA_MAX_HP);
    u16 curHp = GetMonData(&gPlayerParty[GetCursorSelectionMonId()], MON_DATA_HP);

    if (curHp > maxHp / 5)
        return TRUE;
    else
        return FALSE;
}

void ChooseMonForSoftboiled(u8 taskId)
{
    gPartyMenu.unkB = 10;
    gPartyMenu.unkA = gPartyMenu.unk9;
    AnimatePartySlot(GetCursorSelectionMonId(), 1);
    DisplayPartyMenuStdMessage(5);
    gTasks[taskId].func = Task_HandleChooseMonInput;
}

void sub_80E5724(u8 taskId)
{
    u8 r8 = gPartyMenu.unk9;
    u8 r5 = gPartyMenu.unkA;
    u16 curHp;
    s16 delta;

    if (r5 > 6)
    {
        gPartyMenu.unkB = 0;
        DisplayPartyMenuStdMessage(0);
        gTasks[taskId].func = Task_HandleChooseMonInput;
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
            PartyMenuModifyHP(taskId, r8, -1, GetMonData(&gPlayerParty[r8], MON_DATA_MAX_HP) / 5, sub_80E57E8);
        }
    }
}

static void sub_80E57E8(u8 taskId)
{
    PlaySE(SE_KAIFUKU);
    PartyMenuModifyHP(taskId, gPartyMenu.unkA, 1, GetMonData(&gPlayerParty[gPartyMenu.unk9], MON_DATA_MAX_HP) / 5, sub_80E583C);
}

static void sub_80E583C(u8 taskId)
{
    GetMonNickname(&gPlayerParty[gPartyMenu.unkA], gStringVar1);
    StringExpandPlaceholders(gStringVar4, gText_PkmnHPRestoredByVar2);
    DisplayPartyMenuMessage(gStringVar4, 0);
    ScheduleBgCopyTilemapToVram(2);
    gTasks[taskId].func = sub_80E58A0;
}

static void sub_80E58A0(u8 taskId)
{
    if (IsPartyMenuTextPrinterActive() != TRUE)
    {
        gPartyMenu.unkB = 0;
        AnimatePartySlot(gPartyMenu.unk9, 0);
        gPartyMenu.unk9 = gPartyMenu.unkA;
        AnimatePartySlot(gPartyMenu.unkA, 1);
        ClearStdWindowAndFrameToTransparent(6, 0);
        ClearWindowTilemap(6);
        DisplayPartyMenuStdMessage(0);
        gTasks[taskId].func = Task_HandleChooseMonInput;
    }
}

static void sub_80E5900(u8 taskId)
{
    if (IsPartyMenuTextPrinterActive() != TRUE)
    {
        DisplayPartyMenuStdMessage(5);
        gTasks[taskId].func = Task_HandleChooseMonInput;
    }
}

static void sub_80E5934(u8 taskId)
{
    PlaySE(SE_SELECT);
    DisplayPartyMenuMessage(gUnknown_84169F8, 0);
    ScheduleBgCopyTilemapToVram(2);
    gTasks[taskId].func = sub_80E5900;
}
