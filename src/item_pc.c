#include "global.h"
#include "gflib.h"
#include "data.h"
#include "decompress.h"
#include "graphics.h"
#include "help_system.h"
#include "item.h"
#include "item_menu.h"
#include "item_menu_icons.h"
#include "list_menu.h"
#include "item_pc.h"
#include "item_use.h"
#include "menu.h"
#include "menu_helpers.h"
#include "menu_indicators.h"
#include "new_menu_helpers.h"
#include "party_menu.h"
#include "pc_screen_effect.h"
#include "scanline_effect.h"
#include "strings.h"
#include "task.h"
#include "text_window.h"
#include "constants/items.h"
#include "constants/quest_log.h"
#include "constants/songs.h"

struct ItemPcResources
{
    MainCallback savedCallback;
    u8 moveModeOrigPos;
    u8 itemMenuIconSlot;
    u8 maxShowed;
    u8 nItems;
    u8 scrollIndicatorArrowPairId;
    u16 withdrawQuantitySubmenuCursorPos;
    s16 data[3];
};

struct ItemPcStaticResources
{
    MainCallback savedCallback;
    u16 scroll;
    u16 row;
    u8 initialized;
};

static EWRAM_DATA struct ItemPcResources * sStateDataPtr = NULL;
static EWRAM_DATA u8 * sBg1TilemapBuffer = NULL;
static EWRAM_DATA struct ListMenuItem * sListMenuItems = NULL;
static EWRAM_DATA u8 * sUnusedStringAllocation = NULL;
static EWRAM_DATA struct ItemPcStaticResources sListMenuState = {};
static EWRAM_DATA u8 sSubmenuWindowIds[3] = {};

extern const struct CompressedSpriteSheet gBagSwapSpriteSheet;
extern const struct CompressedSpritePalette gBagSwapSpritePalette;

static void ItemPc_RunSetup(void);
static bool8 ItemPc_DoGfxSetup(void);
static void ItemPc_FadeAndBail(void);
static void Task_ItemPcWaitFadeAndBail(u8 taskId);
static bool8 ItemPc_InitBgs(void);
static bool8 ItemPc_LoadGraphics(void);
static bool8 ItemPc_AllocateResourcesForListMenu(void);
static void ItemPc_BuildListMenuTemplate(void);
static void ItemPc_MoveCursorFunc(s32 itemIndex, bool8 onInit, struct ListMenu * list);
static void ItemPc_ItemPrintFunc(u8 windowId, u32 itemId, u8 y);
static void ItemPc_PrintOrRemoveCursorAt(u8 y, u8 state);
static void ItemPc_PrintWithdrawItem(void);
static void ItemPc_PlaceTopMenuScrollIndicatorArrows(void);
static void ItemPc_SetCursorPosition(void);
static void ItemPc_FreeResources(void);
static void Task_ItemPcTurnOff2(u8 taskId);
static u16 ItemPc_GetItemIdBySlotId(u16 itemIndex);
static u16 ItemPc_GetItemQuantityBySlotId(u16 itemIndex);
static void ItemPc_CountPcItems(void);
static void ItemPc_SetScrollPosition(void);
static void Task_ItemPcMain(u8 taskId);
static void ItemPc_MoveItemModeInit(u8 taskId, s16 pos);
static void Task_ItemPcMoveItemModeRun(u8 taskId);
static void ItemPc_InsertItemIntoNewSlot(u8 taskId, u32 pos);
static void ItemPc_MoveItemModeCancel(u8 taskId, u32 pos);
static void Task_ItemPcSubmenuInit(u8 taskId);
static void Task_ItemPcSubmenuRun(u8 taskId);
static void Task_ItemPcWithdraw(u8 taskId);
static void ItemPc_DoWithdraw(u8 taskId);
static void Task_ItemPcWaitButtonAndFinishWithdrawMultiple(u8 taskId);
static void Task_ItemPcWaitButtonWithdrawMultipleFailed(u8 taskId);
static void Task_ItemPcCleanUpWithdraw(u8 taskId);
static void ItemPc_WithdrawMultipleInitWindow(u16 slotId);
static void Task_ItemPcHandleWithdrawMultiple(u8 taskId);
static void Task_ItemPcGive(u8 taskId);
static void ItemPc_CB2_SwitchToPartyMenu(void);
static void ItemPc_CB2_ReturnFromPartyMenu(void);
static void gTask_ItemPcWaitButtonAndExitSubmenu(u8 taskId);
static void Task_ItemPcCancel(u8 taskId);
static void ItemPc_InitWindows(void);
static void ItemPc_AddTextPrinterParameterized(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed, u8 colorIdx);
static void ItemPc_SetBorderStyleOnWindow(u8 windowId);
static u8 ItemPc_GetOrCreateSubwindow(u8 idx);
static void ItemPc_DestroySubwindow(u8 idx);
static void ItemPc_PrintOnWindow5WithContinueTask(u8 taskId, const u8 * str, TaskFunc taskFunc);

static const struct BgTemplate sBgTemplates[2] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 31,
        .priority = 0
    }, {
        .bg = 1,
        .charBaseIndex = 3,
        .mapBaseIndex = 30,
        .priority = 1
    }
};

static const struct MenuAction sItemPcSubmenuOptions[] = {
    {gText_Withdraw,          {.void_u8 = Task_ItemPcWithdraw}},
    {gOtherText_Give,         {.void_u8 = Task_ItemPcGive}},
    {gFameCheckerText_Cancel, {.void_u8 = Task_ItemPcCancel}}
};

static const u8 sTextColors[][3] = {
    {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GRAY},
    {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_LIGHT_GRAY},
    {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_LIGHT_GRAY, TEXT_COLOR_DARK_GRAY},
    {TEXT_COLOR_TRANSPARENT, TEXT_DYNAMIC_COLOR_1, TEXT_COLOR_DARK_GRAY}
};

static const struct WindowTemplate sWindowTemplates[] = {
    {
        .bg = 0,
        .tilemapLeft = 7,
        .tilemapTop = 1,
        .width = 19,
        .height = 12,
        .paletteNum = 15,
        .baseBlock = 0x02bf
    }, {
        .bg = 0,
        .tilemapLeft = 5,
        .tilemapTop = 14,
        .width = 25,
        .height = 6,
        .paletteNum = 13,
        .baseBlock = 0x0229
    }, {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 5,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x0215
    }, {
        .bg = 0,
        .tilemapLeft = 24,
        .tilemapTop = 15,
        .width = 5,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x0201
    }, {
        .bg = 0,
        .tilemapLeft = 22,
        .tilemapTop = 13,
        .width = 7,
        .height = 6,
        .paletteNum = 15,
        .baseBlock = 0x01d7
    }, {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 15,
        .width = 26,
        .height = 4,
        .paletteNum = 11,
        .baseBlock = 0x016f
    }, DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sSubwindowTemplates[] = {
    {
        .bg = 0,
        .tilemapLeft = 6,
        .tilemapTop = 15,
        .width = 14,
        .height = 4,
        .paletteNum = 12,
        .baseBlock = 0x0137
    }, {
        .bg = 0,
        .tilemapLeft = 6,
        .tilemapTop = 15,
        .width = 16,
        .height = 4,
        .paletteNum = 12,
        .baseBlock = 0x0137
    }, {
        .bg = 0,
        .tilemapLeft = 6,
        .tilemapTop = 15,
        .width = 23,
        .height = 4,
        .paletteNum = 12,
        .baseBlock = 0x009b
    }
};

void ItemPc_Init(u8 kind, MainCallback callback)
{
    u8 i;

    if (kind >= 2)
    {
        SetMainCallback2(callback);
        return;
    }
    if ((sStateDataPtr = Alloc(sizeof(struct ItemPcResources))) == NULL)
    {
        SetMainCallback2(callback);
        return;
    }
    if (kind != 1)
    {
        sListMenuState.savedCallback = callback;
        sListMenuState.scroll = sListMenuState.row = 0;
    }
    sStateDataPtr->moveModeOrigPos = 0xFF;
    sStateDataPtr->itemMenuIconSlot = 0;
    sStateDataPtr->scrollIndicatorArrowPairId = 0xFF;
    sStateDataPtr->savedCallback = 0;
    for (i = 0; i < 3; i++)
    {
        sStateDataPtr->data[i] = 0;
    }
    SetMainCallback2(ItemPc_RunSetup);
}

static void ItemPc_MainCB(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    DoScheduledBgTilemapCopiesToVram();
    UpdatePaletteFade();
}

static void ItemPc_VBlankCB(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void ItemPc_RunSetup(void)
{
    while (1)
    {
        if (ItemPc_DoGfxSetup() == TRUE)
            break;
        if (MenuHelpers_IsLinkActive() == TRUE)
            break;
    }
}

static bool8 ItemPc_DoGfxSetup(void)
{
    u8 taskId;
    switch (gMain.state)
    {
    case 0:
        SetVBlankHBlankCallbacksToNull();
        ClearScheduledBgCopiesToVram();
        gMain.state++;
        break;
    case 1:
        ScanlineEffect_Stop();
        gMain.state++;
        break;
    case 2:
        FreeAllSpritePalettes();
        gMain.state++;
        break;
    case 3:
        ResetPaletteFade();
        gMain.state++;
        break;
    case 4:
        ResetSpriteData();
        gMain.state++;
        break;
    case 5:
        ResetItemMenuIconState();
        gMain.state++;
        break;
    case 6:
        ResetTasks();
        gMain.state++;
        break;
    case 7:
        if (ItemPc_InitBgs())
        {
            sStateDataPtr->data[0] = 0;
            gMain.state++;
        }
        else
        {
            ItemPc_FadeAndBail();
            return TRUE;
        }
        break;
    case 8:
        if (ItemPc_LoadGraphics() == TRUE)
            gMain.state++;
        break;
    case 9:
        ItemPc_InitWindows();
        gMain.state++;
        break;
    case 10:
        ItemPc_CountPcItems();
        ItemPc_SetCursorPosition();
        ItemPc_SetScrollPosition();
        gMain.state++;
        break;
    case 11:
        if (ItemPc_AllocateResourcesForListMenu())
            gMain.state++;
        else
        {
            ItemPc_FadeAndBail();
            return TRUE;
        }
        break;
    case 12:
        ItemPc_BuildListMenuTemplate();
        gMain.state++;
        break;
    case 13:
        ItemPc_PrintWithdrawItem();
        gMain.state++;
        break;
    case 14:
        CreateSwapLine();
        gMain.state++;
        break;
    case 15:
        taskId = CreateTask(Task_ItemPcMain, 0);
        gTasks[taskId].data[0] = ListMenuInit(&gMultiuseListMenuTemplate, sListMenuState.scroll, sListMenuState.row);
        gMain.state++;
        break;
    case 16:
        ItemPc_PlaceTopMenuScrollIndicatorArrows();
        gMain.state++;
        break;
    case 17:
        SetHelpContext(HELPCONTEXT_PLAYERS_PC_ITEMS);
        gMain.state++;
        break;
    case 18:
        if (sListMenuState.initialized == 1)
        {
            BlendPalettes(PALETTES_ALL, 16, RGB_BLACK);
        }
        gMain.state++;
        break;
    case 19:
        if (sListMenuState.initialized == 1)
        {
            BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        }
        else
        {
            BeginPCScreenEffect_TurnOn(0, 0, 0);
            ItemPc_SetInitializedFlag(TRUE);
            PlaySE(SE_PC_LOGIN);
        }
        gMain.state++;
        break;
    case 20:
        if (IsActiveOverworldLinkBusy() != TRUE)
            gMain.state++;
        break;
    default:
        SetVBlankCallback(ItemPc_VBlankCB);
        SetMainCallback2(ItemPc_MainCB);
        return TRUE;
    }
    return FALSE;
}

static void ItemPc_FadeAndBail(void)
{
    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
    CreateTask(Task_ItemPcWaitFadeAndBail, 0);
    SetVBlankCallback(ItemPc_VBlankCB);
    SetMainCallback2(ItemPc_MainCB);
}

static void Task_ItemPcWaitFadeAndBail(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(sListMenuState.savedCallback);
        ItemPc_FreeResources();
        DestroyTask(taskId);
    }
}

static bool8 ItemPc_InitBgs(void)
{
    ResetAllBgsCoordinatesAndBgCntRegs();
    sBg1TilemapBuffer = Alloc(0x800);
    if (sBg1TilemapBuffer == NULL)
        return FALSE;
    memset(sBg1TilemapBuffer, 0, 0x800);
    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, sBgTemplates, NELEMS(sBgTemplates));
    SetBgTilemapBuffer(1, sBg1TilemapBuffer);
    ScheduleBgCopyTilemapToVram(1);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
    SetGpuReg(REG_OFFSET_BLDCNT , 0);
    ShowBg(0);
    ShowBg(1);
    return TRUE;
}

static bool8 ItemPc_LoadGraphics(void)
{
    switch (sStateDataPtr->data[0])
    {
    case 0:
        ResetTempTileDataBuffers();
        DecompressAndCopyTileDataToVram(1, gItemPcTiles, 0, 0, 0);
        sStateDataPtr->data[0]++;
        break;
    case 1:
        if (FreeTempTileDataBuffersIfPossible() != TRUE)
        {
            LZDecompressWram(gItemPcTilemap, sBg1TilemapBuffer);
            sStateDataPtr->data[0]++;
        }
        break;
    case 2:
        LoadCompressedPalette(gItemPcBgPals, BG_PLTT_ID(0), 3 * PLTT_SIZE_4BPP);
        sStateDataPtr->data[0]++;
        break;
    case 3:
        LoadCompressedSpriteSheet(&gBagSwapSpriteSheet);
        sStateDataPtr->data[0]++;
        break;
    default:
        LoadCompressedSpritePalette(&gBagSwapSpritePalette);
        sStateDataPtr->data[0] = 0;
        return TRUE;
    }
    return FALSE;
}

#define try_alloc(ptr__, size) ({ \
    void ** ptr = (void **)&(ptr__);             \
    *ptr = Alloc(size);                 \
    if (*ptr == NULL)                   \
    {                                   \
        ItemPc_FreeResources();                  \
        ItemPc_FadeAndBail();                  \
        return FALSE;                   \
    }                                   \
})

static bool8 ItemPc_AllocateResourcesForListMenu(void)
{
    try_alloc(sListMenuItems, sizeof(struct ListMenuItem) * (PC_ITEMS_COUNT + 1));
    try_alloc(sUnusedStringAllocation, 14 * (PC_ITEMS_COUNT + 1));
    return TRUE;
}

static void ItemPc_BuildListMenuTemplate(void)
{
    u16 i;

    for (i = 0; i < sStateDataPtr->nItems; i++)
    {
        sListMenuItems[i].label = ItemId_GetName(gSaveBlock1Ptr->pcItems[i].itemId);
        sListMenuItems[i].index = i;
    }
    sListMenuItems[i].label = gFameCheckerText_Cancel;
    sListMenuItems[i].index = -2;

    gMultiuseListMenuTemplate.items = sListMenuItems;
    gMultiuseListMenuTemplate.totalItems = sStateDataPtr->nItems + 1;
    gMultiuseListMenuTemplate.windowId = 0;
    gMultiuseListMenuTemplate.header_X = 0;
    gMultiuseListMenuTemplate.item_X = 9;
    gMultiuseListMenuTemplate.cursor_X = 1;
    gMultiuseListMenuTemplate.lettersSpacing = 1;
    gMultiuseListMenuTemplate.itemVerticalPadding = 2;
    gMultiuseListMenuTemplate.upText_Y = 2;
    gMultiuseListMenuTemplate.maxShowed = sStateDataPtr->maxShowed;
    gMultiuseListMenuTemplate.fontId = FONT_NORMAL;
    gMultiuseListMenuTemplate.cursorPal = 2;
    gMultiuseListMenuTemplate.fillValue = 0;
    gMultiuseListMenuTemplate.cursorShadowPal = 3;
    gMultiuseListMenuTemplate.moveCursorFunc = ItemPc_MoveCursorFunc;
    gMultiuseListMenuTemplate.itemPrintFunc = ItemPc_ItemPrintFunc;
    gMultiuseListMenuTemplate.scrollMultiple = 0;
    gMultiuseListMenuTemplate.cursorKind = 0;
}

static void ItemPc_MoveCursorFunc(s32 itemIndex, bool8 onInit, struct ListMenu * list)
{
    u16 itemId;
    const u8 * desc;
    if (onInit != TRUE)
        PlaySE(SE_SELECT);

    if (sStateDataPtr->moveModeOrigPos == 0xFF)
    {
        DestroyItemMenuIcon(sStateDataPtr->itemMenuIconSlot ^ 1);
        if (itemIndex != -2)
        {
            itemId = ItemPc_GetItemIdBySlotId(itemIndex);
            CreateItemMenuIcon(itemId, sStateDataPtr->itemMenuIconSlot);
            if (ItemId_GetPocket(itemId) == POCKET_TM_CASE)
                desc = gMoveNames[ItemIdToBattleMoveId(itemId)];
            else
                desc = ItemId_GetDescription(itemId);
        }
        else
        {
            CreateItemMenuIcon(ITEMS_COUNT, sStateDataPtr->itemMenuIconSlot);
            desc = gText_ReturnToPC;
        }
        sStateDataPtr->itemMenuIconSlot ^= 1;
        FillWindowPixelBuffer(1, 0);
        ItemPc_AddTextPrinterParameterized(1, FONT_NORMAL, desc, 0, 3, 2, 0, 0, 3);
    }
}

static void ItemPc_ItemPrintFunc(u8 windowId, u32 itemId, u8 y)
{
    if (sStateDataPtr->moveModeOrigPos != 0xFF)
    {
        if (sStateDataPtr->moveModeOrigPos == (u8)itemId)
            ItemPc_PrintOrRemoveCursorAt(y, 2);
        else
            ItemPc_PrintOrRemoveCursorAt(y, 0xFF);
    }
    if (itemId != -2)
    {
        u16 quantity = ItemPc_GetItemQuantityBySlotId(itemId);
        ConvertIntToDecimalStringN(gStringVar1, quantity, STR_CONV_MODE_RIGHT_ALIGN, 3);
        StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
        ItemPc_AddTextPrinterParameterized(windowId, FONT_SMALL, gStringVar4, 110, y, 0, 0, 0xFF, 1);
    }
}

static void ItemPc_PrintOrRemoveCursor(u8 listMenuId, u8 colorIdx)
{
    ItemPc_PrintOrRemoveCursorAt(ListMenuGetYCoordForPrintingArrowCursor(listMenuId), colorIdx);
}

static void ItemPc_PrintOrRemoveCursorAt(u8 y, u8 colorIdx)
{
    if (colorIdx == 0xFF)
    {
        u8 maxWidth = GetFontAttribute(FONT_NORMAL, FONTATTR_MAX_LETTER_WIDTH);
        u8 maxHeight = GetFontAttribute(FONT_NORMAL, FONTATTR_MAX_LETTER_HEIGHT);
        FillWindowPixelRect(0, 0, 0, y, maxWidth, maxHeight);
    }
    else
    {
        ItemPc_AddTextPrinterParameterized(0, FONT_NORMAL, gText_SelectorArrow2, 0, y, 0, 0, 0, colorIdx);
    }
}

static void ItemPc_PrintWithdrawItem(void)
{
    ItemPc_AddTextPrinterParameterized(2, FONT_SMALL, gText_WithdrawItem, 0, 1, 0, 1, 0, 0);
}

static void ItemPc_PlaceTopMenuScrollIndicatorArrows(void)
{
    sStateDataPtr->scrollIndicatorArrowPairId = AddScrollIndicatorArrowPairParameterized(2, 128, 8, 104, sStateDataPtr->nItems - sStateDataPtr->maxShowed + 1, 110, 110, &sListMenuState.scroll);
}

static void ItemPc_PlaceWithdrawQuantityScrollIndicatorArrows(void)
{
    sStateDataPtr->withdrawQuantitySubmenuCursorPos = 1;
    sStateDataPtr->scrollIndicatorArrowPairId = AddScrollIndicatorArrowPairParameterized(2, 212, 120, 152, 2, 110, 110, &sStateDataPtr->withdrawQuantitySubmenuCursorPos);
}

static void ItemPc_RemoveScrollIndicatorArrowPair(void)
{
    if (sStateDataPtr->scrollIndicatorArrowPairId != 0xFF)
    {
        RemoveScrollIndicatorArrowPair(sStateDataPtr->scrollIndicatorArrowPairId);
        sStateDataPtr->scrollIndicatorArrowPairId = 0xFF;
    }
}

static void ItemPc_SetCursorPosition(void)
{
    if (sListMenuState.scroll != 0 && sListMenuState.scroll + sStateDataPtr->maxShowed > sStateDataPtr->nItems + 1)
        sListMenuState.scroll = (sStateDataPtr->nItems + 1) - sStateDataPtr->maxShowed;
    if (sListMenuState.scroll + sListMenuState.row >= sStateDataPtr->nItems + 1)
    {
        if (sStateDataPtr->nItems + 1 < 2)
            sListMenuState.row = 0;
        else
            sListMenuState.row = sStateDataPtr->nItems;
    }
}

#define try_free(ptr) ({        \
    void ** ptr__ = (void **)&(ptr);   \
    if (*ptr__ != NULL)                \
        Free(*ptr__);                  \
})

static void ItemPc_FreeResources(void)
{
    try_free(sStateDataPtr);
    try_free(sBg1TilemapBuffer);
    try_free(sListMenuItems);
    try_free(sUnusedStringAllocation);
    FreeAllWindowBuffers();
}

static void Task_ItemPcTurnOff1(u8 taskId)
{
    if (sListMenuState.initialized == 1)
    {
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
    }
    else
    {
        BeginPCScreenEffect_TurnOff(0, 0, 0);
        PlaySE(SE_PC_OFF);
    }
    gTasks[taskId].func = Task_ItemPcTurnOff2;
}

static void Task_ItemPcTurnOff2(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (!gPaletteFade.active && !IsPCScreenEffectRunning_TurnOff())
    {
        DestroyListMenuTask(data[0], &sListMenuState.scroll, &sListMenuState.row);
        if (sStateDataPtr->savedCallback != NULL)
            SetMainCallback2(sStateDataPtr->savedCallback);
        else
            SetMainCallback2(sListMenuState.savedCallback);
        ItemPc_RemoveScrollIndicatorArrowPair();
        ItemPc_FreeResources();
        DestroyTask(taskId);
    }
}

static u8 ItemPc_GetCursorPosition(void)
{
    return sListMenuState.scroll + sListMenuState.row;
}

static u16 ItemPc_GetItemIdBySlotId(u16 idx)
{
    return gSaveBlock1Ptr->pcItems[idx].itemId;
}

static u16 ItemPc_GetItemQuantityBySlotId(u16 idx)
{
    return GetPcItemQuantity(&gSaveBlock1Ptr->pcItems[idx].quantity);
}

static void ItemPc_CountPcItems(void)
{
    u16 i;

    ItemPcCompaction();
    sStateDataPtr->nItems = 0;
    for (i = 0; i < PC_ITEMS_COUNT; sStateDataPtr->nItems++, i++)
    {
        if (gSaveBlock1Ptr->pcItems[i].itemId == ITEM_NONE)
            break;
    }
    sStateDataPtr->maxShowed = sStateDataPtr->nItems + 1 <= 6 ? sStateDataPtr->nItems + 1 : 6;
}

static void ItemPc_SetScrollPosition(void)
{
    u8 i;

    if (sListMenuState.row > 3)
    {
        for (i = 0; i <= sListMenuState.row - 3; sListMenuState.row--, sListMenuState.scroll++, i++)
        {
            if (sListMenuState.scroll + sStateDataPtr->maxShowed == sStateDataPtr->nItems + 1)
                break;
        }
    }
}

static void ItemPc_SetMessageWindowPalette(int palIdx)
{
    SetBgTilemapPalette(1, 0, 14, 30, 6, palIdx + 1);
    ScheduleBgCopyTilemapToVram(1);
}

void ItemPc_SetInitializedFlag(bool8 flag)
{
    sListMenuState.initialized = flag;
}

static void Task_ItemPcMain(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u16 scroll;
    u16 row;
    s32 input;

    if (!gPaletteFade.active && !IsPCScreenEffectRunning_TurnOn())
    {
        if (JOY_NEW(SELECT_BUTTON))
        {
            ListMenuGetScrollAndRow(data[0], &scroll, &row);
            if (scroll + row != sStateDataPtr->nItems)
            {
                PlaySE(SE_SELECT);
                ItemPc_MoveItemModeInit(taskId, scroll + row);
                return;
            }
        }
        input = ListMenu_ProcessInput(data[0]);
        ListMenuGetScrollAndRow(data[0], &sListMenuState.scroll, &sListMenuState.row);
        switch (input)
        {
        case -1:
            break;
        case -2:
            PlaySE(SE_SELECT);
            ItemPc_SetInitializedFlag(FALSE);
            gTasks[taskId].func = Task_ItemPcTurnOff1;
            break;
        default:
            PlaySE(SE_SELECT);
            ItemPc_SetMessageWindowPalette(1);
            ItemPc_RemoveScrollIndicatorArrowPair();
            data[1] = input;
            data[2] = ItemPc_GetItemQuantityBySlotId(input);
            ItemPc_PrintOrRemoveCursor(data[0], 2);
            gTasks[taskId].func = Task_ItemPcSubmenuInit;
            break;
        }
    }
}

static void ItemPc_ReturnFromSubmenu(u8 taskId)
{
    ItemPc_SetMessageWindowPalette(0);
    ItemPc_PlaceTopMenuScrollIndicatorArrows();
    gTasks[taskId].func = Task_ItemPcMain;
}

static void ItemPc_MoveItemModeInit(u8 taskId, s16 pos)
{
    s16 * data = gTasks[taskId].data;

    ListMenuSetTemplateField(data[0], LISTFIELD_CURSORKIND, 1);
    data[1] = pos;
    sStateDataPtr->moveModeOrigPos = pos;
    StringCopy(gStringVar1, ItemId_GetName(ItemPc_GetItemIdBySlotId(data[1])));
    StringExpandPlaceholders(gStringVar4, gOtherText_WhereShouldTheStrVar1BePlaced);
    FillWindowPixelBuffer(1, 0x00);
    ItemPc_AddTextPrinterParameterized(1, FONT_NORMAL, gStringVar4, 0, 3, 2, 3, 0, 0);
    UpdateSwapLinePos(-32, ListMenuGetYCoordForPrintingArrowCursor(data[0]));
    SetSwapLineInvisibility(FALSE);
    ItemPc_PrintOrRemoveCursor(data[0], 2);
    gTasks[taskId].func = Task_ItemPcMoveItemModeRun;
}

static void Task_ItemPcMoveItemModeRun(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    ListMenu_ProcessInput(data[0]);
    ListMenuGetScrollAndRow(data[0], &sListMenuState.scroll, &sListMenuState.row);
    UpdateSwapLinePos(-32, ListMenuGetYCoordForPrintingArrowCursor(data[0]));
    if (JOY_NEW(A_BUTTON | SELECT_BUTTON))
    {
        PlaySE(SE_SELECT);
        sStateDataPtr->moveModeOrigPos = 0xFF;
        ItemPc_InsertItemIntoNewSlot(taskId, sListMenuState.scroll + sListMenuState.row);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        sStateDataPtr->moveModeOrigPos = 0xFF;
        ItemPc_MoveItemModeCancel(taskId, sListMenuState.scroll + sListMenuState.row);
    }
}

static void ItemPc_InsertItemIntoNewSlot(u8 taskId, u32 pos)
{
    s16 * data = gTasks[taskId].data;
    if (data[1] == pos || data[1] == pos - 1)
        ItemPc_MoveItemModeCancel(taskId, pos);
    else
    {
        MoveItemSlotInList(gSaveBlock1Ptr->pcItems, data[1], pos);
        DestroyListMenuTask(data[0], &sListMenuState.scroll, &sListMenuState.row);
        if (data[1] < pos)
            sListMenuState.row--;
        ItemPc_BuildListMenuTemplate();
        data[0] = ListMenuInit(&gMultiuseListMenuTemplate, sListMenuState.scroll, sListMenuState.row);
        SetSwapLineInvisibility(TRUE);
        gTasks[taskId].func = Task_ItemPcMain;
    }
}

static void ItemPc_MoveItemModeCancel(u8 taskId, u32 pos)
{
    s16 * data = gTasks[taskId].data;

    DestroyListMenuTask(data[0], &sListMenuState.scroll, &sListMenuState.row);
    if (data[1] < pos)
        sListMenuState.row--;
    ItemPc_BuildListMenuTemplate();
    data[0] = ListMenuInit(&gMultiuseListMenuTemplate, sListMenuState.scroll, sListMenuState.row);
    SetSwapLineInvisibility(TRUE);
    gTasks[taskId].func = Task_ItemPcMain;
}

static void Task_ItemPcSubmenuInit(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u8 windowId;

    ItemPc_SetBorderStyleOnWindow(4);
    windowId = ItemPc_GetOrCreateSubwindow(0);
    PrintTextArray(4, FONT_NORMAL, 8, 2, GetFontAttribute(FONT_NORMAL, FONTATTR_MAX_LETTER_HEIGHT) + 2, 3, sItemPcSubmenuOptions);
    Menu_InitCursor(4, FONT_NORMAL, 0, 2, GetFontAttribute(FONT_NORMAL, FONTATTR_MAX_LETTER_HEIGHT) + 2, 3, 0);
    CopyItemName(ItemPc_GetItemIdBySlotId(data[1]), gStringVar1);
    StringExpandPlaceholders(gStringVar4, gText_Var1IsSelected);
    ItemPc_AddTextPrinterParameterized(windowId, FONT_NORMAL, gStringVar4, 0, 2, 1, 0, 0, 1);
    ScheduleBgCopyTilemapToVram(0);
    gTasks[taskId].func = Task_ItemPcSubmenuRun;
}

static void Task_ItemPcSubmenuRun(u8 taskId)
{
    s8 input = Menu_ProcessInputNoWrapAround();
    switch (input)
    {
    case -1:
        PlaySE(SE_SELECT);
        Task_ItemPcCancel(taskId);
        break;
    case -2:
        break;
    default:
        PlaySE(SE_SELECT);
        sItemPcSubmenuOptions[input].func.void_u8(taskId);
    }
}

static void Task_ItemPcWithdraw(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    ClearStdWindowAndFrameToTransparent(4, FALSE);
    ItemPc_DestroySubwindow(0);
    ClearWindowTilemap(4);
    data[8] = 1;
    if (ItemPc_GetItemQuantityBySlotId(data[1]) == 1)
    {
        PutWindowTilemap(0);
        ScheduleBgCopyTilemapToVram(0);
        ItemPc_DoWithdraw(taskId);
    }
    else
    {
        PutWindowTilemap(0);
        ItemPc_WithdrawMultipleInitWindow(data[1]);
        ItemPc_PlaceWithdrawQuantityScrollIndicatorArrows();
        gTasks[taskId].func = Task_ItemPcHandleWithdrawMultiple;
    }
}

static void ItemPc_DoWithdraw(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u16 itemId = ItemPc_GetItemIdBySlotId(data[1]);
    u8 windowId;

    if (AddBagItem(itemId, data[8]) == TRUE)
    {
        ItemUse_SetQuestLogEvent(QL_EVENT_WITHDREW_ITEM_PC, NULL, itemId, 0xFFFF);
        CopyItemName(itemId, gStringVar1);
        ConvertIntToDecimalStringN(gStringVar2, data[8], STR_CONV_MODE_LEFT_ALIGN, 3);
        StringExpandPlaceholders(gStringVar4, gText_WithdrewQuantItem);
        windowId = ItemPc_GetOrCreateSubwindow(2);
        AddTextPrinterParameterized(windowId, FONT_NORMAL, gStringVar4, 0, 2, 0, NULL);
        gTasks[taskId].func = Task_ItemPcWaitButtonAndFinishWithdrawMultiple;
    }
    else
    {
        windowId = ItemPc_GetOrCreateSubwindow(2);
        AddTextPrinterParameterized(windowId, FONT_NORMAL, gText_NoMoreRoomInBag, 0, 2, 0, NULL);
        gTasks[taskId].func = Task_ItemPcWaitButtonWithdrawMultipleFailed;
    }
}

static void Task_ItemPcWaitButtonAndFinishWithdrawMultiple(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u16 itemId;

    if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        itemId = ItemPc_GetItemIdBySlotId(data[1]);
        RemovePCItem(itemId, data[8]);
        ItemPcCompaction();
        Task_ItemPcCleanUpWithdraw(taskId);
    }
}

static void Task_ItemPcWaitButtonWithdrawMultipleFailed(u8 taskId)
{
    if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        Task_ItemPcCleanUpWithdraw(taskId);
    }
}

static void Task_ItemPcCleanUpWithdraw(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    ItemPc_DestroySubwindow(2);
    PutWindowTilemap(1);
    DestroyListMenuTask(data[0], &sListMenuState.scroll, &sListMenuState.row);
    ItemPc_CountPcItems();
    ItemPc_SetCursorPosition();
    ItemPc_BuildListMenuTemplate();
    data[0] = ListMenuInit(&gMultiuseListMenuTemplate, sListMenuState.scroll, sListMenuState.row);
    ScheduleBgCopyTilemapToVram(0);
    ItemPc_ReturnFromSubmenu(taskId);
}

static void ItemPc_WithdrawMultipleInitWindow(u16 slotId)
{
    u16 itemId = ItemPc_GetItemIdBySlotId(slotId);

    CopyItemName(itemId, gStringVar1);
    StringExpandPlaceholders(gStringVar4, gText_WithdrawHowMany);
    AddTextPrinterParameterized(ItemPc_GetOrCreateSubwindow(1), FONT_NORMAL, gStringVar4, 0, 2, 0, NULL);
    ConvertIntToDecimalStringN(gStringVar1, 1, STR_CONV_MODE_LEADING_ZEROS, 3);
    StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
    ItemPc_SetBorderStyleOnWindow(3);
    ItemPc_AddTextPrinterParameterized(3, FONT_SMALL, gStringVar4, 8, 10, 1, 0, 0, 1);
    ScheduleBgCopyTilemapToVram(0);
}

static void UpdateWithdrawQuantityDisplay(s16 quantity)
{
    FillWindowPixelRect(3, PIXEL_FILL(1), 10, 10, 28, 12);
    ConvertIntToDecimalStringN(gStringVar1, quantity, STR_CONV_MODE_LEADING_ZEROS, 3);
    StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
    ItemPc_AddTextPrinterParameterized(3, FONT_SMALL, gStringVar4, 8, 10, 1, 0, 0, 1);
}

static void Task_ItemPcHandleWithdrawMultiple(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (AdjustQuantityAccordingToDPadInput(&data[8], data[2]) == TRUE)
        UpdateWithdrawQuantityDisplay(data[8]);
    else if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        ItemPc_DestroySubwindow(1);
        ClearWindowTilemap(3);
        PutWindowTilemap(0);
        ItemPc_PrintOrRemoveCursor(data[0], 1);
        ScheduleBgCopyTilemapToVram(0);
        ItemPc_RemoveScrollIndicatorArrowPair();
        ItemPc_DoWithdraw(taskId);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        ClearStdWindowAndFrameToTransparent(3, FALSE);
        ItemPc_DestroySubwindow(1);
        ClearWindowTilemap(3);
        PutWindowTilemap(0);
        PutWindowTilemap(1);
        ItemPc_PrintOrRemoveCursor(data[0], 1);
        ScheduleBgCopyTilemapToVram(0);
        ItemPc_RemoveScrollIndicatorArrowPair();
        ItemPc_ReturnFromSubmenu(taskId);
    }
}

static void Task_ItemPcGive(u8 taskId)
{
    if (CalculatePlayerPartyCount() == 0)
    {
        ClearStdWindowAndFrameToTransparent(4, FALSE);
        ItemPc_DestroySubwindow(0);
        ClearWindowTilemap(4);
        PutWindowTilemap(0);
        ItemPc_PrintOnWindow5WithContinueTask(taskId, gText_ThereIsNoPokemon, gTask_ItemPcWaitButtonAndExitSubmenu);
    }
    else
    {
        sStateDataPtr->savedCallback = ItemPc_CB2_SwitchToPartyMenu;
        Task_ItemPcTurnOff1(taskId);
    }
}

static void ItemPc_CB2_SwitchToPartyMenu(void)
{
    InitPartyMenu(0, 0, 6, 0, 6, Task_HandleChooseMonInput, ItemPc_CB2_ReturnFromPartyMenu);
    gPartyMenu.bagItem = ItemPc_GetItemIdBySlotId(ItemPc_GetCursorPosition());
}

static void ItemPc_CB2_ReturnFromPartyMenu(void)
{
    ItemPc_Init(1, NULL);
}

static void gTask_ItemPcWaitButtonAndExitSubmenu(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        ClearDialogWindowAndFrameToTransparent(5, FALSE);
        ClearWindowTilemap(5);
        PutWindowTilemap(1);
        ItemPc_PrintOrRemoveCursor(data[0], 1);
        ScheduleBgCopyTilemapToVram(0);
        ItemPc_ReturnFromSubmenu(taskId);
    }
}

static void Task_ItemPcCancel(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    ClearStdWindowAndFrameToTransparent(4, FALSE);
    ItemPc_DestroySubwindow(0);
    ClearWindowTilemap(4);
    PutWindowTilemap(0);
    PutWindowTilemap(1);
    ItemPc_PrintOrRemoveCursor(data[0], 1);
    ScheduleBgCopyTilemapToVram(0);
    ItemPc_ReturnFromSubmenu(taskId);
}

static void ItemPc_InitWindows(void)
{
    u8 i;

    InitWindows(sWindowTemplates);
    DeactivateAllTextPrinters();
    LoadUserWindowGfx(0, 0x3C0, BG_PLTT_ID(14));
    LoadStdWindowGfx(0, 0x3A3, BG_PLTT_ID(12));
    LoadMenuMessageWindowGfx(0, 0x3AC, BG_PLTT_ID(11));
    LoadPalette(GetTextWindowPalette(2), BG_PLTT_ID(13), PLTT_SIZE_4BPP);
    LoadPalette(gStandardMenuPalette, BG_PLTT_ID(15), PLTT_SIZE_4BPP);
    for (i = 0; i < 3; i++)
    {
        FillWindowPixelBuffer(i, 0x00);
        PutWindowTilemap(i);
    }
    ScheduleBgCopyTilemapToVram(0);
    for (i = 0; i < 3; i++)
        sSubmenuWindowIds[i] = 0xFF;
}

static void unused_ItemPc_AddTextPrinterParameterized(u8 windowId, const u8 * string, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed)
{
    struct TextPrinterTemplate template;

    template.currentChar = string;
    template.windowId = windowId;
    template.fontId = FONT_NORMAL_COPY_2;
    template.x = x;
    template.y = y;
    template.currentX = x;
    template.currentY = y;
    template.fgColor = 2;
    template.bgColor = 0;
    template.shadowColor = 3;
    template.unk = GetFontAttribute(FONT_NORMAL_COPY_2, FONTATTR_UNKNOWN);
    template.letterSpacing = letterSpacing + GetFontAttribute(FONT_NORMAL_COPY_2, FONTATTR_LETTER_SPACING);
    template.lineSpacing = lineSpacing + GetFontAttribute(FONT_NORMAL_COPY_2, FONTATTR_LINE_SPACING);
    AddTextPrinter(&template, speed, NULL);
}

static void ItemPc_AddTextPrinterParameterized(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed, u8 colorIdx)
{
    AddTextPrinterParameterized4(windowId, fontId, x, y, letterSpacing, lineSpacing, sTextColors[colorIdx], speed, str);
}

static void ItemPc_SetBorderStyleOnWindow(u8 windowId)
{
    DrawStdFrameWithCustomTileAndPalette(windowId, FALSE, 0x3C0, 14);
}

static u8 ItemPc_GetOrCreateSubwindow(u8 idx)
{
    if (sSubmenuWindowIds[idx] == 0xFF)
    {
        sSubmenuWindowIds[idx] = AddWindow(&sSubwindowTemplates[idx]);
        DrawStdFrameWithCustomTileAndPalette(sSubmenuWindowIds[idx], TRUE, 0x3A3, 12);
    }

    return sSubmenuWindowIds[idx];
}

static void ItemPc_DestroySubwindow(u8 idx)
{
    ClearStdWindowAndFrameToTransparent(sSubmenuWindowIds[idx], FALSE);
    ClearWindowTilemap(sSubmenuWindowIds[idx]); // redundant
    RemoveWindow(sSubmenuWindowIds[idx]);
    sSubmenuWindowIds[idx] = 0xFF;
}

static u8 ItemPc_GetSubwindow(u8 idx)
{
    return sSubmenuWindowIds[idx];
}

static void ItemPc_PrintOnWindow5WithContinueTask(u8 taskId, const u8 * str, TaskFunc taskFunc)
{
    DisplayMessageAndContinueTask(taskId, 5, 0x3AC, 0x0B, FONT_NORMAL, GetTextSpeedSetting(), str, taskFunc);
    ScheduleBgCopyTilemapToVram(0);
}
