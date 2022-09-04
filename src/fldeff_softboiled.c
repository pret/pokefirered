#include "global.h"
#include "gflib.h"
#include "party_menu.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "constants/songs.h"

static void Task_SoftboiledRestoreHealth(u8 taskId);
static void Task_DisplayHPRestoredMessage(u8 taskId);
static void Task_FinishSoftboiled(u8 taskId);
static void CantUseSoftboiledOnMon(u8 taskId);

extern const u8 gText_CantBeUsedOnPkmn[];
extern const u8 gText_PkmnHPRestoredByVar2[];

bool8 SetUpFieldMove_SoftBoiled(void)
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
    gPartyMenu.action = PARTY_ACTION_SOFTBOILED;
    gPartyMenu.slotId2 = gPartyMenu.slotId;
    AnimatePartySlot(GetCursorSelectionMonId(), 1);
    DisplayPartyMenuStdMessage(PARTY_MSG_USE_ON_WHICH_MON);
    gTasks[taskId].func = Task_HandleChooseMonInput;
}

void Task_TryUseSoftboiledOnPartyMon(u8 taskId)
{
    u8 userPartyId = gPartyMenu.slotId;
    u8 recipientPartyId = gPartyMenu.slotId2;
    u16 curHp;

    if (recipientPartyId > PARTY_SIZE)
    {
        gPartyMenu.action = PARTY_ACTION_CHOOSE_MON;
        DisplayPartyMenuStdMessage(PARTY_MSG_CHOOSE_MON);
        gTasks[taskId].func = Task_HandleChooseMonInput;
    }
    else
    {
        curHp = GetMonData(&gPlayerParty[recipientPartyId], MON_DATA_HP);
        if (curHp == 0
            || userPartyId == recipientPartyId
            || GetMonData(&gPlayerParty[recipientPartyId], MON_DATA_MAX_HP) == curHp)
            CantUseSoftboiledOnMon(taskId);
        else
        {
            PlaySE(SE_USE_ITEM);
            PartyMenuModifyHP(taskId, userPartyId, -1, GetMonData(&gPlayerParty[userPartyId], MON_DATA_MAX_HP) / 5, Task_SoftboiledRestoreHealth);
        }
    }
}

static void Task_SoftboiledRestoreHealth(u8 taskId)
{
    PlaySE(SE_USE_ITEM);
    PartyMenuModifyHP(taskId, gPartyMenu.slotId2, 1, GetMonData(&gPlayerParty[gPartyMenu.slotId], MON_DATA_MAX_HP) / 5, Task_DisplayHPRestoredMessage);
}

static void Task_DisplayHPRestoredMessage(u8 taskId)
{
    GetMonNickname(&gPlayerParty[gPartyMenu.slotId2], gStringVar1);
    StringExpandPlaceholders(gStringVar4, gText_PkmnHPRestoredByVar2);
    DisplayPartyMenuMessage(gStringVar4, FALSE);
    ScheduleBgCopyTilemapToVram(2);
    gTasks[taskId].func = Task_FinishSoftboiled;
}

static void Task_FinishSoftboiled(u8 taskId)
{
    if (IsPartyMenuTextPrinterActive() != TRUE)
    {
        gPartyMenu.action = PARTY_ACTION_CHOOSE_MON;
        AnimatePartySlot(gPartyMenu.slotId, 0);
        gPartyMenu.slotId = gPartyMenu.slotId2;
        AnimatePartySlot(gPartyMenu.slotId2, 1);
        ClearStdWindowAndFrameToTransparent(6, 0);
        ClearWindowTilemap(6);
        DisplayPartyMenuStdMessage(PARTY_MSG_CHOOSE_MON);
        gTasks[taskId].func = Task_HandleChooseMonInput;
    }
}

static void Task_ChooseNewMonForSoftboiled(u8 taskId)
{
    if (IsPartyMenuTextPrinterActive() != TRUE)
    {
        DisplayPartyMenuStdMessage(PARTY_MSG_USE_ON_WHICH_MON);
        gTasks[taskId].func = Task_HandleChooseMonInput;
    }
}

static void CantUseSoftboiledOnMon(u8 taskId)
{
    PlaySE(SE_SELECT);
    DisplayPartyMenuMessage(gText_CantBeUsedOnPkmn, FALSE);
    ScheduleBgCopyTilemapToVram(2);
    gTasks[taskId].func = Task_ChooseNewMonForSoftboiled;
}
