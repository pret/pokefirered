#include "global.h"
#include "gflib.h"
#include "task.h"
#include "menu.h"
#include "menu_helpers.h"
#include "new_menu_helpers.h"
#include "link.h"
#include "overworld.h"
#include "mail_data.h"
#include "field_specials.h"
#include "constants/songs.h"
#include "constants/items.h"
#include "constants/maps.h"

static EWRAM_DATA const struct YesNoFuncTable *gUnknown_20399C8 = NULL;
static EWRAM_DATA TaskFunc gUnknown_20399CC = NULL;
static EWRAM_DATA u8 gUnknown_20399D0 = {0};

static void Task_ContinueTaskAfterMessagePrints(u8 taskId);

void DisplayMessageAndContinueTask(u8 taskId, u8 windowId, u16 tileNum, u8 paletteNum, u8 fontId, u8 textSpeed, const u8 *string, void *taskFunc)
{
    gUnknown_20399D0 = windowId;
    DrawDialogFrameWithCustomTileAndPalette(windowId, TRUE, tileNum, paletteNum);

    if (string != gStringVar4)
        StringExpandPlaceholders(gStringVar4, string);

    gTextFlags.canABSpeedUpPrint = 1;
    AddTextPrinterParameterized2(windowId, fontId, gStringVar4, textSpeed, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
    gUnknown_20399CC = taskFunc;
    gTasks[taskId].func = Task_ContinueTaskAfterMessagePrints;
}

bool16 RunTextPrinters_CheckActive(u8 textPrinterId)
{
    RunTextPrinters();
    return IsTextPrinterActive(textPrinterId);
}

static void Task_ContinueTaskAfterMessagePrints(u8 taskId)
{
    if (!RunTextPrinters_CheckActive(gUnknown_20399D0))
        gUnknown_20399CC(taskId);
}

static void Task_CallYesOrNoCallback(u8 taskId)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case 0:
        PlaySE(SE_SELECT);
        gTasks[taskId].func = gUnknown_20399C8->yesFunc;
        break;
    case 1:
    case MENU_B_PRESSED:
        PlaySE(SE_SELECT);
        gTasks[taskId].func = gUnknown_20399C8->noFunc;
        break;
    }
}

void CreateYesNoMenuWithCallbacks(u8 taskId, const struct WindowTemplate *template, u8 fontId, u8 left, u8 top, u16 tileStart, u8 palette, const struct YesNoFuncTable *yesNo)
{
    CreateYesNoMenu(template, fontId, left, top, tileStart, palette, 0);
    gUnknown_20399C8 = yesNo;
    gTasks[taskId].func = Task_CallYesOrNoCallback;
}

u8 GetLRKeysState(void)
{
    if (gSaveBlock2Ptr->optionsButtonMode == OPTIONS_BUTTON_MODE_LR)
    {
        if (JOY_NEW(L_BUTTON))
            return 1;
        if (JOY_NEW(R_BUTTON))
            return 2;
    }
    return 0;
}

u8 GetLRKeysPressedAndHeld(void)
{
    if (gSaveBlock2Ptr->optionsButtonMode == OPTIONS_BUTTON_MODE_LR)
    {
        if (JOY_REPT(L_BUTTON))
            return 1;
        if (JOY_REPT(R_BUTTON))
            return 2;
    }
    return 0;
}

bool8 itemid_link_can_give_berry(u16 itemId)
{
    if (itemId != ITEM_ENIGMA_BERRY)
        return TRUE;
    else if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(TRADE_CENTER)
              && gSaveBlock1Ptr->location.mapNum == MAP_NUM(TRADE_CENTER))
        return FALSE;
    else if (InUnionRoom() != TRUE)
        return TRUE;
    else
        return FALSE;
}

bool8 CanWriteMailHere(u16 itemId)
{
    if (IsUpdateLinkStateCBActive() != TRUE && InUnionRoom() != TRUE)
        return TRUE;
    else if (ItemIsMail(itemId) != TRUE)
        return TRUE;
    else
        return FALSE;
}

bool8 MenuHelpers_LinkSomething(void)
{
    if (IsUpdateLinkStateCBActive() == TRUE || gReceivedRemoteLinkPlayers == 1)
        return TRUE;
    else
        return FALSE;
}

bool8 MenuHelpers_CallLinkSomething(void)
{
    if (!MenuHelpers_LinkSomething())
        return FALSE;
    else
        return (u8)Overworld_LinkRecvQueueLengthMoreThan2();
}

bool8 sub_80BF748(void)
{
    if (MenuHelpers_CallLinkSomething() == TRUE)
        return TRUE;
    else if (LinkRecvQueueLengthMoreThan2() != TRUE)
        return FALSE;
    else
        return TRUE;
}

void SetVBlankHBlankCallbacksToNull(void)
{
    SetVBlankCallback(NULL);
    SetHBlankCallback(NULL);
}

void ResetVramOamAndBgCntRegs(void)
{
    ResetAllBgsCoordinatesAndBgCntRegs();
    CpuFill16(0, (void *) VRAM, VRAM_SIZE);
    CpuFill32(0, (void *) OAM, OAM_SIZE);
    CpuFill16(0, (void *) PLTT, PLTT_SIZE);
}

void ResetAllBgsCoordinatesAndBgCntRegs(void)
{
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    SetGpuReg(REG_OFFSET_BG3CNT, 0);
    SetGpuReg(REG_OFFSET_BG2CNT, 0);
    SetGpuReg(REG_OFFSET_BG1CNT, 0);
    SetGpuReg(REG_OFFSET_BG0CNT, 0);
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
}

bool8 AdjustQuantityAccordingToDPadInput(s16 *quantity_p, u16 qmax)
{
    s16 valBefore = (*quantity_p);

    if (JOY_REPT(DPAD_ANY) == DPAD_UP)
    {
        (*quantity_p)++;
        if ((*quantity_p) > qmax)
            (*quantity_p) = 1;

        if ((*quantity_p) == valBefore)
        {
            return FALSE;
        }
        else
        {
            PlaySE(SE_SELECT);
            return TRUE;
        }
    }
    else if (JOY_REPT(DPAD_ANY) == DPAD_DOWN)
    {
        (*quantity_p)--;
        if ((*quantity_p) <= 0)
            (*quantity_p) = qmax;
        if ((*quantity_p) == valBefore)
        {
            return FALSE;
        }
        else
        {
            PlaySE(SE_SELECT);
            return TRUE;
        }
    }
    else if (JOY_REPT(DPAD_ANY) == DPAD_RIGHT)
    {
        (*quantity_p) += 10;
        if ((*quantity_p) > qmax)
            (*quantity_p) = qmax;
        if ((*quantity_p) == valBefore)
        {
            return FALSE;
        }
        else
        {
            PlaySE(SE_SELECT);
            return TRUE;
        }
    }
    else if (JOY_REPT(DPAD_ANY) == DPAD_LEFT)
    {
        (*quantity_p) -= 10;
        if ((*quantity_p) <= 0)
            (*quantity_p) = 1;
        if ((*quantity_p) == valBefore)
        {
            return FALSE;
        }
        else
        {
            PlaySE(SE_SELECT);
            return TRUE;
        }
    }
    return FALSE;
}

u8 GetDialogBoxFontId(void)
{
    if (ContextNpcGetTextColor() == NPC_TEXT_COLOR_MALE)
        return FONT_4;
    else
        return FONT_5;
}
