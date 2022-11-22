#include "global.h"
#include "gflib.h"
#include "item.h"
#include "task.h"
#include "menu_indicators.h"
#include "new_menu_helpers.h"
#include "strings.h"
#include "menu.h"
#include "mail.h"
#include "mail_data.h"
#include "help_system.h"
#include "overworld.h"
#include "script.h"
#include "mailbox_pc.h"
#include "player_pc.h"
#include "field_weather.h"
#include "event_scripts.h"
#include "field_fadetransition.h"
#include "item_menu.h"
#include "item_pc.h"
#include "party_menu.h"
#include "constants/items.h"
#include "constants/songs.h"
#include "constants/field_weather.h"

#define PC_ITEM_ID  0
#define PC_QUANTITY 1
#define NEW_GAME_PC_ITEMS(i, type) (((u16 *)gNewGamePCItems + type)[i * 2])

#define tCount          data[2]
#define tPageItems      data[4]
#define tItemPcParam    data[6]
#define tWindowId       data[10]
#define tListMenuTaskId data[11]

static EWRAM_DATA const u8 *sItemOrder = NULL;
static EWRAM_DATA u8 sTopMenuItemCount = 0;
EWRAM_DATA struct PlayerPCItemPageStruct gPlayerPcMenuManager = {};

#define SELECTED_MAIL (gSaveBlock1Ptr->mail[PC_MAIL_NUM(gPlayerPcMenuManager.cursorPos) + gPlayerPcMenuManager.itemsAbove])

static void Task_DrawPlayerPcTopMenu(u8 taskId);
static void Task_TopMenuHandleInput(u8 taskId);
static void Task_PlayerPcItemStorage(u8 taskId);
static void Task_PlayerPcMailbox(u8 taskId);
static void Task_PlayerPcTurnOff(u8 taskId);
static void Task_CreateItemStorageSubmenu(u8 taskId, u8 cursorPos);
static void PrintStringOnWindow0WithDialogueFrame(const u8 *str);
static void Task_TopMenu_ItemStorageSubmenu_HandleInput(u8 taskId);
static void Task_PlayerPcDepositItem(u8 taskId);
static void Task_DepositItem_WaitFadeAndGoToBag(u8 taskId);
static void CB2_ReturnFromDepositMenu(void);
static void Task_PlayerPcWithdrawItem(u8 taskId);
static void CB2_ReturnFromWithdrawMenu(void);
static void Task_WithdrawItemBeginFade(u8 taskId);
static void Task_PlayerPcCancel(u8 taskId);
static void Task_SetPageItemVars(u8 taskId);
static u8 CountPCMail(void);
static void PCMailCompaction(void);
static void Task_DrawMailboxPcMenu(u8 taskId);
static void Task_MailboxPcHandleInput(u8 taskId);
static void Task_PrintWhatToDoWithSelectedMail(u8 taskId);
static void Task_DestroyMailboxPcViewAndCancel(u8 taskId);
static void Task_DrawMailSubmenu(u8 taskId);
static void Task_MailSubmenuHandleInput(u8 taskId);
static void Task_PlayerPcReadMail(u8 taskId);
static void Task_WaitFadeAndReadSelectedMail(u8 taskId);
static void CB2_SetCbToReturnToMailbox(void);
static void Task_PlayerPcMoveMailToBag(u8 taskId);
static void Task_DrawYesNoMenuToConfirmMoveToBag(u8 taskId);
static void Task_MoveToBagYesNoMenuHandleInput(u8 taskId);
static void Task_TryPutMailInBag_DestroyMsgIfSuccessful(u8 taskId);
static void Task_DeclinedMoveMailToBag(u8 taskId);
static void Task_PlayerPcGiveMailToMon(u8 taskId);
static void Task_WaitFadeAndGoToPartyMenu(u8 taskId);
static void Task_Error_NoPokemon(u8 taskId);
static void Task_PlayerPcExitMailSubmenu(u8 taskId);

static const u8 *const sItemStorageActionDescriptionPtrs[] = {
    gText_TakeOutItemsFromThePC,
    gText_StoreItemsInThePC,
    gText_GoBackToThePreviousMenu
};

static const struct MenuAction sMenuActions_TopMenu[] = {
    {gText_ItemStorage, Task_PlayerPcItemStorage},
    {gText_Mailbox, Task_PlayerPcMailbox},
    {gText_TurnOff, Task_PlayerPcTurnOff}
};

static const u8 sItemOrder_BedroomPC[] = { 0, 1, 2 };
static const u8 sItemOrder_PlayerPC[] = { 0, 1, 2 };

static const struct MenuAction sMenuActions_ItemPc[] = {
    {gText_WithdrawItem2, Task_PlayerPcWithdrawItem},
    {gText_DepositItem2, Task_PlayerPcDepositItem},
    {gFameCheckerText_Cancel, Task_PlayerPcCancel}
};

static const struct ItemSlot gNewGamePCItems[] = {
    { ITEM_POTION, 1 },
    { ITEM_NONE,   0 }
};

static const struct MenuAction sMenuActions_MailSubmenu[] = {
    {gOtherText_Read, Task_PlayerPcReadMail},
    {gOtherText_MoveToBag, Task_PlayerPcMoveMailToBag},
    {gOtherText_Give2, Task_PlayerPcGiveMailToMon},
    {gOtherText_Exit, Task_PlayerPcExitMailSubmenu}
};

static const struct WindowTemplate sWindowTemplate_TopMenu_3Items = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 13,
    .height = 6,
    .paletteNum = 15,
    .baseBlock = 0x008
};

static const struct WindowTemplate sWindowTemplate_TopMenu_4Items = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 13,
    .height = 8,
    .paletteNum = 15,
    .baseBlock = 0x008
};

static const struct WindowTemplate sWindowTemplate_ItemStorageSubmenu = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 14,
    .height = 6,
    .paletteNum = 15,
    .baseBlock = 0x008
};

void NewGameInitPCItems(void)
{
    u8 i;

    for (i = 0, ClearPCItemSlots(); NEW_GAME_PC_ITEMS(i, PC_ITEM_ID) && NEW_GAME_PC_ITEMS(i, PC_QUANTITY) &&
                                    AddPCItem(NEW_GAME_PC_ITEMS(i, PC_ITEM_ID), NEW_GAME_PC_ITEMS(i, PC_QUANTITY)) == TRUE; i++)
        ;
}

void BedroomPC(void)
{
    u8 taskId;

    gPlayerPcMenuManager.notInRoom = FALSE;
    BackupHelpContext();
    sItemOrder = sItemOrder_BedroomPC;
    sTopMenuItemCount = 3;
    taskId = CreateTask(TaskDummy, 0);
    DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_WhatWouldYouLikeToDo, Task_DrawPlayerPcTopMenu);
}

void PlayerPC(void)
{
    u8 taskId;

    gPlayerPcMenuManager.notInRoom = TRUE;
    BackupHelpContext();
    sItemOrder = sItemOrder_PlayerPC;
    sTopMenuItemCount = 3;
    taskId = CreateTask(TaskDummy, 0);
    DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_WhatWouldYouLikeToDo, Task_DrawPlayerPcTopMenu);
}

static void Task_DrawPlayerPcTopMenu(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (sTopMenuItemCount == 3)
        tWindowId = AddWindow(&sWindowTemplate_TopMenu_3Items);
    else
        tWindowId = AddWindow(&sWindowTemplate_TopMenu_4Items);
    SetStdWindowBorderStyle(tWindowId, 0);
    AddItemMenuActionTextPrinters(tWindowId, FONT_NORMAL, GetMenuCursorDimensionByFont(FONT_NORMAL, 0), 2, GetFontAttribute(FONT_NORMAL, FONTATTR_LETTER_SPACING), 16, sTopMenuItemCount, sMenuActions_TopMenu, sItemOrder);
    Menu_InitCursor(tWindowId, FONT_NORMAL, 0, 2, 16, sTopMenuItemCount, 0);
    ScheduleBgCopyTilemapToVram(0);
    gTasks[taskId].func = Task_TopMenuHandleInput;
}

static void Task_TopMenuHandleInput(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    s8 input = Menu_ProcessInputNoWrapAround();
    switch (input)
    {
    case -2:
        break;
    case -1:
        PlaySE(SE_SELECT);
        ClearStdWindowAndFrameToTransparent(tWindowId, FALSE);
        ClearWindowTilemap(tWindowId);
        RemoveWindow(tWindowId);
        ScheduleBgCopyTilemapToVram(0);
        gTasks[taskId].func = Task_PlayerPcTurnOff;
        break;
    default:
        ClearStdWindowAndFrameToTransparent(tWindowId, FALSE);
        ClearWindowTilemap(tWindowId);
        RemoveWindow(tWindowId);
        ScheduleBgCopyTilemapToVram(0);
        gTasks[taskId].func = sMenuActions_TopMenu[sItemOrder[input]].func.void_u8;
        break;
    }
}

static void Task_ReturnToTopMenu(u8 taskId)
{
    RestoreHelpContext();
    DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_WhatWouldYouLikeToDo, Task_DrawPlayerPcTopMenu);
}

static void Task_PlayerPcItemStorage(u8 taskId)
{
    Task_CreateItemStorageSubmenu(taskId, FALSE);
    gTasks[taskId].func = Task_TopMenu_ItemStorageSubmenu_HandleInput;
}

static void Task_PlayerPcMailbox(u8 taskId)
{
    gPlayerPcMenuManager.count = CountPCMail();
    if (gPlayerPcMenuManager.count == 0)
    {
        DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_TheresNoMailHere, Task_ReturnToTopMenu);
    }
    else
    {
        gPlayerPcMenuManager.itemsAbove = 0;
        gPlayerPcMenuManager.cursorPos = 0;
        PCMailCompaction();
        Task_SetPageItemVars(taskId);
        if (gPlayerPcMenuManager.notInRoom == FALSE)
            SetHelpContext(HELPCONTEXT_BEDROOM_PC_MAILBOX);
        else
            SetHelpContext(HELPCONTEXT_PLAYERS_PC_MAILBOX);
        if (MailboxPC_InitBuffers(gPlayerPcMenuManager.count) == TRUE)
        {
            ClearDialogWindowAndFrame(0, FALSE);
            Task_DrawMailboxPcMenu(taskId);
            gTasks[taskId].func = Task_MailboxPcHandleInput;
        }
        else
        {
            DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_TheresNoMailHere, Task_ReturnToTopMenu);
        }
    }
}

static void Task_PlayerPcTurnOff(u8 taskId)
{
    if (gPlayerPcMenuManager.notInRoom == FALSE)
        ScriptContext_SetupScript(EventScript_PalletTown_PlayersHouse_2F_ShutDownPC);
    else
        ScriptContext_Enable();
    DestroyTask(taskId);
}

static void Task_CreateItemStorageSubmenu(u8 taskId, u8 cursorPos)
{
    s16 *data = gTasks[taskId].data;
    if (gPlayerPcMenuManager.notInRoom == FALSE)
        SetHelpContext(HELPCONTEXT_BEDROOM_PC_ITEMS);
    else
        SetHelpContext(HELPCONTEXT_PLAYERS_PC_ITEMS);
    tWindowId = AddWindow(&sWindowTemplate_ItemStorageSubmenu);
    SetStdWindowBorderStyle(tWindowId, FALSE);
    PrintTextArray(tWindowId, FONT_NORMAL, GetMenuCursorDimensionByFont(FONT_NORMAL, 0), 2, 16, 3, sMenuActions_ItemPc);
    Menu_InitCursor(tWindowId, FONT_NORMAL, 0, 2, 16, 3, cursorPos);
    ScheduleBgCopyTilemapToVram(0);
    PrintStringOnWindow0WithDialogueFrame(sItemStorageActionDescriptionPtrs[cursorPos]);
}

static void PrintStringOnWindow0WithDialogueFrame(const u8 *str)
{
    DrawDialogueFrame(0, FALSE);
    AddTextPrinterParameterized(0, FONT_NORMAL, str, 0, 1, 0, NULL);
}

static void Task_TopMenu_ItemStorageSubmenu_HandleInput(u8 taskId)
{
    if (JOY_REPT(DPAD_UP))
    {
        if (Menu_GetCursorPos() != 0)
        {
            PlaySE(SE_SELECT);
            Menu_MoveCursor(-1);
            PrintStringOnWindow0WithDialogueFrame(sItemStorageActionDescriptionPtrs[Menu_GetCursorPos()]);
        }
    }
    else if (JOY_REPT(DPAD_DOWN))
    {
        if (Menu_GetCursorPos() != 2)
        {
            PlaySE(SE_SELECT);
            Menu_MoveCursor(+1);
            PrintStringOnWindow0WithDialogueFrame(sItemStorageActionDescriptionPtrs[Menu_GetCursorPos()]);
        }
    }
    else if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        sMenuActions_ItemPc[Menu_GetCursorPos()].func.void_u8(taskId);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        sMenuActions_ItemPc[2].func.void_u8(taskId);
    }
}

static void Task_DepositItem_WaitFadeAndGoToBag(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        CleanupOverworldWindowsAndTilemaps();
        GoToBagMenu(ITEMMENULOCATION_ITEMPC, OPEN_BAG_ITEMS, CB2_ReturnToField);
        gFieldCallback = CB2_ReturnFromDepositMenu;
        DestroyTask(taskId);
    }
}

static void Task_PlayerPcDepositItem(u8 taskId)
{
    gTasks[taskId].func = Task_DepositItem_WaitFadeAndGoToBag;
    FadeScreen(FADE_TO_BLACK, 0);
}

static void Task_ReturnToItemStorageSubmenu(u8 taskId)
{
    if (IsWeatherNotFadingIn() == TRUE)
        gTasks[taskId].func = Task_TopMenu_ItemStorageSubmenu_HandleInput;
}

static void CB2_ReturnFromDepositMenu(void)
{
    u8 taskId;
    LoadStdWindowFrameGfx();
    DrawDialogueFrame(0, TRUE);
    taskId = CreateTask(Task_ReturnToItemStorageSubmenu, 0);
    Task_CreateItemStorageSubmenu(taskId, 1);
    FadeInFromBlack();
}

static void Task_PlayerPcWithdrawItem(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    tCount = CountItemsInPC();
    if (tCount != 0)
    {
        tItemPcParam = 0;
        gTasks[taskId].func = Task_WithdrawItemBeginFade;
        gFieldCallback = CB2_ReturnFromWithdrawMenu;
    }
    else
    {
        ClearStdWindowAndFrameToTransparent(tWindowId, FALSE);
        ClearWindowTilemap(tWindowId);
        RemoveWindow(tWindowId);
        DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_ThereAreNoItems, Task_PlayerPcItemStorage);
    }
}

static void CB2_ReturnFromWithdrawMenu(void)
{
    u8 taskId;
    LoadStdWindowFrameGfx();
    DrawDialogueFrame(0, TRUE);
    taskId = CreateTask(Task_ReturnToItemStorageSubmenu, 0);
    Task_CreateItemStorageSubmenu(taskId, 0);
    FadeInFromBlack();
}

static void Task_WithdrawItem_WaitFadeAndGoToItemStorage(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!gPaletteFade.active)
    {
        CleanupOverworldWindowsAndTilemaps();
        ItemPc_Init(tItemPcParam, CB2_ReturnToField);
        DestroyTask(taskId);
    }
}

static void Task_WithdrawItemBeginFade(u8 taskId)
{
    gTasks[taskId].func = Task_WithdrawItem_WaitFadeAndGoToItemStorage;
    ItemPc_SetInitializedFlag(FALSE);
    FadeScreen(FADE_TO_BLACK, 0);
}

static void Task_PlayerPcCancel(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    ClearStdWindowAndFrameToTransparent(tWindowId, FALSE);
    ClearWindowTilemap(tWindowId);
    CopyWindowToVram(tWindowId, COPYWIN_MAP);
    RemoveWindow(tWindowId);
    Task_ReturnToTopMenu(taskId);
}

static void Task_SetPageItemVars(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (tCount >= 8)
        tPageItems = 8;
    else
        tPageItems = tCount + 1;
    if (gPlayerPcMenuManager.count >= 8)
        gPlayerPcMenuManager.pageItems = 8;
    else
        gPlayerPcMenuManager.pageItems = gPlayerPcMenuManager.count + 1;
}

static u8 CountPCMail(void)
{
    u8 count = 0;
    u8 i;

    for (i = PC_MAIL_NUM(0); i < MAIL_COUNT; i++)
    {
        if (gSaveBlock1Ptr->mail[i].itemId != ITEM_NONE)
            count++;
    }
    return count;
}

static void PCMailCompaction(void)
{
    u8 i;
    u8 j;
    for (i = PC_MAIL_NUM(0); i < MAIL_COUNT - 1; i++)
    {
        for (j = i + 1; j < MAIL_COUNT; j++)
        {
            if (gSaveBlock1Ptr->mail[i].itemId == ITEM_NONE)
            {
                struct Mail mail = gSaveBlock1Ptr->mail[i];
                gSaveBlock1Ptr->mail[i] = gSaveBlock1Ptr->mail[j];
                gSaveBlock1Ptr->mail[j] = mail;
            }
        }
    }
}

static void Task_DrawMailboxPcMenu(u8 taskId)
{
    u8 windowId = MailboxPC_GetAddWindow(0);
    s32 width = GetStringWidth(FONT_NORMAL, gText_Mailbox, 0);
    MailboxPC_GetAddWindow(1);
    AddTextPrinterParameterized(windowId, FONT_NORMAL, gText_Mailbox, (80 - width) / 2, 2, 0, NULL);
    ScheduleBgCopyTilemapToVram(0);
    gTasks[taskId].tListMenuTaskId = MailboxPC_InitListMenu(&gPlayerPcMenuManager);
    MailboxPC_AddScrollIndicatorArrows(&gPlayerPcMenuManager);
}

static void Task_MailboxPcHandleInput(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    s32 input;
    if (!gPaletteFade.active)
    {
        input = ListMenu_ProcessInput(tListMenuTaskId);
        ListMenuGetScrollAndRow(tListMenuTaskId, &gPlayerPcMenuManager.cursorPos, &gPlayerPcMenuManager.itemsAbove);
        switch (input)
        {
        case -1:
            break;
        case -2:
            PlaySE(SE_SELECT);
            RemoveScrollIndicatorArrowPair(gPlayerPcMenuManager.scrollIndicatorId);
            Task_DestroyMailboxPcViewAndCancel(taskId);
            break;
        default:
            PlaySE(SE_SELECT);
            MailboxPC_RemoveWindow(0);
            MailboxPC_RemoveWindow(1);
            DestroyListMenuTask(tListMenuTaskId, &gPlayerPcMenuManager.cursorPos, &gPlayerPcMenuManager.itemsAbove);
            ScheduleBgCopyTilemapToVram(0);
            RemoveScrollIndicatorArrowPair(gPlayerPcMenuManager.scrollIndicatorId);
            gTasks[taskId].func = Task_PrintWhatToDoWithSelectedMail;
            break;
        }
    }
}

static void Task_PrintWhatToDoWithSelectedMail(u8 taskId)
{
    s32 length;
    s32 i;
    u8 *ptr;
    StringCopy(gStringVar1, SELECTED_MAIL.playerName);
    length = StringLength(gStringVar1);
    if (length > 5)
    {
        for (ptr = gStringVar1 + length - 1; ptr >= gStringVar1; ptr--)
        {
            if (*ptr)
                break;
            *ptr = EOS;
        }
    }
    else
    {
        ConvertInternationalString(gStringVar1, LANGUAGE_JAPANESE);
    }
    StringExpandPlaceholders(gStringVar4, gText_WhatWouldYouLikeToDoWithPlayersMail);
    DisplayItemMessageOnField(taskId, FONT_NORMAL, gStringVar4, Task_DrawMailSubmenu);
}

static void Task_DestroyMailboxPcViewAndCancel(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    MailboxPC_RemoveWindow(0);
    MailboxPC_RemoveWindow(1);
    DestroyListMenuTask(tListMenuTaskId, NULL, NULL);
    ScheduleBgCopyTilemapToVram(0);
    MailboxPC_DestroyListMenuBuffer();
    Task_ReturnToTopMenu(taskId);
}

static void Task_DrawMailSubmenu(u8 taskId)
{
    u8 windowId = MailboxPC_GetAddWindow(2);
    PrintTextArray(windowId, FONT_NORMAL, GetMenuCursorDimensionByFont(FONT_NORMAL, 0), 2, 16, 4, sMenuActions_MailSubmenu);
    Menu_InitCursor(windowId, FONT_NORMAL, 0, 2, 16, 4, 0);
    ScheduleBgCopyTilemapToVram(0);
    gTasks[taskId].func = Task_MailSubmenuHandleInput;
}

static void Task_MailSubmenuHandleInput(u8 taskId)
{
    s8 input = Menu_ProcessInput_other();
    switch (input)
    {
    case -1:
        PlaySE(SE_SELECT);
        Task_PlayerPcExitMailSubmenu(taskId);
        break;
    case -2:
        break;
    default:
        PlaySE(SE_SELECT);
        sMenuActions_MailSubmenu[input].func.void_u8(taskId);
        break;
    }
}

static void Task_PlayerPcReadMail(u8 taskId)
{
    FadeScreen(FADE_TO_BLACK, 0);
    gTasks[taskId].func = Task_WaitFadeAndReadSelectedMail;
}

static void Task_WaitFadeAndReadSelectedMail(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        MailboxPC_DestroyListMenuBuffer();
        CleanupOverworldWindowsAndTilemaps();
        ReadMail(&SELECTED_MAIL, CB2_SetCbToReturnToMailbox, 1);
        DestroyTask(taskId);
    }
}

static void Task_WaitFadeAndReturnToMailboxPcInputHandler(u8 taskId)
{
    if (IsWeatherNotFadingIn() == TRUE)
        gTasks[taskId].func = Task_MailboxPcHandleInput;
}

static void CB2_ReturnToMailbox(void)
{
    u8 taskId;
    if (gPlayerPcMenuManager.notInRoom == FALSE)
        SetHelpContext(HELPCONTEXT_BEDROOM_PC_MAILBOX);
    else
        SetHelpContext(HELPCONTEXT_PLAYERS_PC_MAILBOX);
    LoadStdWindowFrameGfx();
    taskId = CreateTask(Task_WaitFadeAndReturnToMailboxPcInputHandler, 0);
    if (MailboxPC_InitBuffers(gPlayerPcMenuManager.count) == TRUE)
        Task_DrawMailboxPcMenu(taskId);
    else
        DestroyTask(taskId);
    FadeInFromBlack();
}

static void CB2_SetCbToReturnToMailbox(void)
{
    gFieldCallback = CB2_ReturnToMailbox;
    SetMainCallback2(CB2_ReturnToField);
}

static void Task_PlayerPcMoveMailToBag(u8 taskId)
{
    DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_MessageWillBeLost, Task_DrawYesNoMenuToConfirmMoveToBag);
}

static void Task_DrawYesNoMenuToConfirmMoveToBag(u8 taskId)
{
    DisplayYesNoMenuDefaultYes();
    gTasks[taskId].func = Task_MoveToBagYesNoMenuHandleInput;
}

static void Task_MoveToBagYesNoMenuHandleInput(u8 taskId)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case -2:
        break;
    case 0:
        Task_TryPutMailInBag_DestroyMsgIfSuccessful(taskId);
        break;
    case -1:
        PlaySE(SE_SELECT);
        // fallthrough
    case 1:
        Task_DeclinedMoveMailToBag(taskId);
        break;
    }
}

static void Task_TryPutMailInBag_DestroyMsgIfSuccessful(u8 taskId)
{
    struct Mail * mail = &SELECTED_MAIL;
    if (!AddBagItem(mail->itemId, 1))
    {
        DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_BagIsFull, Task_PlayerPcExitMailSubmenu);
    }
    else
    {
        DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_MailReturnedToBagMessageErased, Task_PlayerPcExitMailSubmenu);
        ClearMailStruct(mail);
        PCMailCompaction();
        gPlayerPcMenuManager.count--;
        if (gPlayerPcMenuManager.count < gPlayerPcMenuManager.pageItems + gPlayerPcMenuManager.cursorPos)
        {
            if (gPlayerPcMenuManager.cursorPos != 0)
                gPlayerPcMenuManager.cursorPos--;
        }
        Task_SetPageItemVars(taskId);
    }
}

static void Task_DeclinedMoveMailToBag(u8 taskId)
{
    Task_PlayerPcExitMailSubmenu(taskId);
}

static void Task_PlayerPcGiveMailToMon(u8 taskId)
{
    if (CalculatePlayerPartyCount() == 0)
    {
        Task_Error_NoPokemon(taskId);
    }
    else
    {
        FadeScreen(FADE_TO_BLACK, 0);
        gTasks[taskId].func = Task_WaitFadeAndGoToPartyMenu;
    }
}

static void Task_WaitFadeAndGoToPartyMenu(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        MailboxPC_DestroyListMenuBuffer();
        CleanupOverworldWindowsAndTilemaps();
        ChooseMonToGiveMailFromMailbox();
        DestroyTask(taskId);
    }
}

static void CB2_ReturnToMailboxPc_UpdateScrollVariables(void)
{
    u8 taskId;
    u8 count;
    if (gPlayerPcMenuManager.notInRoom == FALSE)
        SetHelpContext(HELPCONTEXT_BEDROOM_PC_MAILBOX);
    else
        SetHelpContext(HELPCONTEXT_PLAYERS_PC_MAILBOX);
    taskId = CreateTask(Task_WaitFadeAndReturnToMailboxPcInputHandler, 0);
    count = gPlayerPcMenuManager.count;
    gPlayerPcMenuManager.count = CountPCMail();
    PCMailCompaction();
    if (count != gPlayerPcMenuManager.count)
    {
        if (gPlayerPcMenuManager.count < gPlayerPcMenuManager.pageItems + gPlayerPcMenuManager.cursorPos)
        {
            if (gPlayerPcMenuManager.cursorPos != 0)
                gPlayerPcMenuManager.cursorPos--;
        }
    }
    Task_SetPageItemVars(taskId);
    LoadStdWindowFrameGfx();
    if (MailboxPC_InitBuffers(gPlayerPcMenuManager.count) == TRUE)
        Task_DrawMailboxPcMenu(taskId);
    else
        DestroyTask(taskId);
    FadeInFromBlack();
}

void Mailbox_ReturnToMailListAfterDeposit(void)
{
    gFieldCallback = CB2_ReturnToMailboxPc_UpdateScrollVariables;
    SetMainCallback2(CB2_ReturnToField);
}

static void Task_Error_NoPokemon(u8 taskId)
{
    DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_ThereIsNoPokemon, Task_PlayerPcExitMailSubmenu);
}

static void Task_RedrawPlayerPcMailboxAndSetUpInputHandler(u8 taskId)
{
    ClearDialogWindowAndFrame(0, FALSE);
    Task_DrawMailboxPcMenu(taskId);
    ScheduleBgCopyTilemapToVram(0);
    gTasks[taskId].func = Task_MailboxPcHandleInput;
}

static void Task_PlayerPcExitMailSubmenu(u8 taskId)
{
    MailboxPC_RemoveWindow(2);
    ScheduleBgCopyTilemapToVram(0);
    gTasks[taskId].func = Task_RedrawPlayerPcMailboxAndSetUpInputHandler;
}

#undef tListMenuTaskId
#undef tWindowId
#undef tItemPcParam
#undef tPageItems
#undef tCount
