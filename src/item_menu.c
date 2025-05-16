#include "global.h"
#include "gflib.h"
#include "bag.h"
#include "battle_controllers.h"
#include "berry_pouch.h"
#include "decompress.h"
#include "event_scripts.h"
#include "event_object_movement.h"
#include "field_player_avatar.h"
#include "graphics.h"
#include "help_system.h"
#include "item.h"
#include "item_menu.h"
#include "item_menu_icons.h"
#include "item_use.h"
#include "link.h"
#include "list_menu.h"
#include "load_save.h"
#include "mail_data.h"
#include "map_name_popup.h"
#include "menu.h"
#include "menu_indicators.h"
#include "money.h"
#include "new_menu_helpers.h"
#include "overworld.h"
#include "party_menu.h"
#include "pokemon_storage_system.h"
#include "scanline_effect.h"
#include "script.h"
#include "shop.h"
#include "strings.h"
#include "teachy_tv.h"
#include "tm_case.h"
#include "constants/items.h"
#include "constants/songs.h"
#include "constants/quest_log.h"

#define FREE_IF_SET(ptr) ({ if (ptr) Free(ptr); })

struct BagMenuAlloc
{
    MainCallback exitCB;
    u8 itemOriginalLocation;
    u8 pocketSwitchMode:4;
    u8 itemMenuIcon:2;
    u8 inhibitItemDescriptionPrint:2;
    u16 contextMenuSelectedItem;
    u8 pocketScrollArrowsTask;
    u8 pocketSwitchArrowsTask;
    u8 nItems[NUM_BAG_POCKETS_NO_CASES];
    u8 maxShowed[NUM_BAG_POCKETS_NO_CASES];
    u8 data[4];
};

struct BagSlots
{
    struct ItemSlot bagPocket_Items[BAG_ITEMS_COUNT];
    struct ItemSlot bagPocket_KeyItems[BAG_KEYITEMS_COUNT];
    struct ItemSlot bagPocket_PokeBalls[BAG_POKEBALLS_COUNT];
    u16 itemsAbove[NUM_BAG_POCKETS_NO_CASES];
    u16 cursorPos[NUM_BAG_POCKETS_NO_CASES];
    u16 registeredItem;
    u16 pocket;
};

EWRAM_DATA struct BagStruct gBagMenuState = {};
static EWRAM_DATA struct BagMenuAlloc * sBagMenuDisplay = NULL;
static EWRAM_DATA void *sBagBgTilemapBuffer = NULL;
static EWRAM_DATA struct ListMenuItem * sListMenuItems = NULL;
static EWRAM_DATA u8 (*sListMenuItemStrings)[19] = NULL;
static EWRAM_DATA u8 sContextMenuItemsBuffer[4] = {};
static EWRAM_DATA const u8 *sContextMenuItemsPtr = NULL;
static EWRAM_DATA u8 sContextMenuNumItems = 0;
static EWRAM_DATA struct BagSlots * sBackupPlayerBag = NULL;
EWRAM_DATA u16 gSpecialVar_ItemId = ITEM_NONE;

static void CB2_OpenBagMenu(void);
static bool8 LoadBagMenuGraphics(void);
static void FadeOutOfBagMenu(void);
static void Task_WaitFadeOutOfBagMenu(u8 taskId);
static void NullBagMenuBufferPtrs(void);
static bool8 BagMenuInitBgsAndAllocTilemapBuffer(void);
static bool8 DoLoadBagGraphics(void);
static u8 CreateBagInputHandlerTask(u8 location);
static bool8 TryAllocListMenuBuffers(void);
static void Bag_BuildListMenuTemplate(u8 pocket);
static void BagListMenuGetItemNameColored(u8 *dest, u16 itemId);
static void BagListMenuMoveCursorFunc(s32 itemIndex, bool8 onInit, struct ListMenu *list);
static void BagListMenuItemPrintFunc(u8 windowId, u32 itemId, u8 y);
static void bag_menu_print_cursor(u8 y, u8 colorIdx);
static void PrintBagPocketName(void);
static void PrintItemDescriptionOnMessageWindow(s32 itemIndex);
static void CreatePocketScrollArrowPair(void);
static void CreatePocketSwitchArrowPair(void);
static void BagDestroyPocketSwitchArrowPair(void);
static void CalculateInitialCursorPosAndItemsAbove(void);
static void UpdatePocketScrollPositions(void);
static void DestroyBagMenuResources(void);
static void Task_ItemMenu_WaitFadeAndSwitchToExitCallback(u8 taskId);
static void Task_AnimateWin0v(u8 taskId);
static void ShowBagOrBeginWin0OpenTask(void);
static void All_CalculateNItemsAndMaxShowed(void);
static void Task_BagMenu_HandleInput(u8 taskId);
static void Task_ItemContextMenuByLocation(u8 taskId);
static void Bag_FillMessageBoxWithPalette(u32 a0);
static u8 ProcessPocketSwitchInput(u8 taskId, u8 pocketId);
static void SwitchPockets(u8 taskId, s16 direction, bool16 a2);
static void Task_AnimateSwitchPockets(u8 taskId);
static void BeginMovingItemInPocket(u8 taskId, s16 itemIndex);
static void Task_MoveItemInPocket_HandleInput(u8 taskId);
static void ExecuteMoveItemInPocket(u8 taskId, u32 itemIndex);
static void AbortMovingItemInPocket(u8 taskId, u32 itemIndex);
static void DrawItemListRow(u8 row);
static void Task_ItemContext_FieldOrBattle(u8 taskId);
static void Task_FieldItemContextMenuHandleInput(u8 taskId);
static void Task_ItemMenuAction_Use(u8 taskId);
static void Task_ItemMenuAction_Toss(u8 taskId);
static void Task_ConfirmTossItems(u8 taskId);
static void Task_TossItem_No(u8 taskId);
static void Task_SelectQuantityToToss(u8 taskId);
static void Task_TossItem_Yes(u8 taskId);
static void Task_WaitAB_RedrawAndReturnToBag(u8 taskId);
static void Task_ItemMenuAction_ToggleSelect(u8 taskId);
static void Task_ItemMenuAction_Give(u8 taskId);
static void Task_PrintThereIsNoPokemon(u8 taskId);
static void Task_ItemMenuAction_Cancel(u8 taskId);
static void Task_PrintItemCantBeHeld(u8 taskId);
static void Task_WaitAButtonAndCloseContextMenu(u8 taskId);
static void Task_ItemMenuAction_BattleUse(u8 taskId);
static void Task_ItemContext_FieldGive(u8 taskId);
static void GoToTMCase_Give(void);
static void GoToBerryPouch_Give(void);
static void ReturnToBagMenuFromSubmenu_Give(void);
static void Task_ItemContext_PcBoxGive(u8 taskId);
static void GoToTMCase_PCBox(void);
static void GoToBerryPouch_PCBox(void);
static void ReturnToBagMenuFromSubmenu_PCBox(void);
static void Task_ItemContext_Sell(u8 taskId);
static void GoToTMCase_Sell(void);
static void GoToBerryPouch_Sell(void);
static void ReturnToBagMenuFromSubmenu_Sell(void);
static void Task_PrintSaleConfirmationText(u8 taskId);
static void Task_ShowSellYesNoMenu(u8 taskId);
static void Task_SellItem_No(u8 taskId);
static void Task_InitSaleQuantitySelectInterface(u8 taskId);
static void UpdateSalePriceDisplay(s32 price);
static void Task_SelectQuantityToSell(u8 taskId);
static void Task_SellItem_Yes(u8 taskId);
static void Task_FinalizeSaleToShop(u8 taskId);
static void Task_WaitPressAB_AfterSell(u8 taskId);
static void Task_ItemContext_Deposit(u8 taskId);
static void Task_SelectQuantityToDeposit(u8 taskId);
static void Task_TryDoItemDeposit(u8 taskId);
static bool8 BagIsTutorial(void);
static void Task_Bag_OldManTutorial(u8 taskId);
static void Task_Pokedude_FadeFromBag(u8 taskId);
static void Task_Pokedude_WaitFadeAndExitBag(u8 taskId);
static void Task_Bag_TeachyTvRegister(u8 taskId);
static void Task_Bag_TeachyTvCatching(u8 taskId);
static void Task_Bag_TeachyTvStatus(u8 taskId);
static void Task_Bag_TeachyTvTMs(u8 taskId);

static const struct BgTemplate sBgTemplates[2] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }, {
        .bg = 1,
        .charBaseIndex = 3,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x000
    }
};

static const u8 *const sPocketNames[] = {
    gText_Items2,
    gText_KeyItems2,
    gText_PokeBalls2
};

#define LIST_TILES_WIDTH  18
#define LIST_TILES_HEIGHT 12

static const u16 sItemListTilemap[LIST_TILES_WIDTH * LIST_TILES_HEIGHT] = INCBIN_U16("graphics/item_menu/list.bin");

static const struct MenuAction sItemMenuContextActions[] = {
    [ITEMMENUACTION_USE] = {gOtherText_Use, {.void_u8 = Task_ItemMenuAction_Use}},
    [ITEMMENUACTION_TOSS] = {gOtherText_Toss, {.void_u8 = Task_ItemMenuAction_Toss}},
    [ITEMMENUACTION_REGISTER] = {gOtherText_Register, {.void_u8 = Task_ItemMenuAction_ToggleSelect}},
    [ITEMMENUACTION_GIVE] = {gOtherText_Give, {.void_u8 = Task_ItemMenuAction_Give}},
    [ITEMMENUACTION_CANCEL] = {gFameCheckerText_Cancel, {.void_u8 = Task_ItemMenuAction_Cancel}},
    [ITEMMENUACTION_BATTLE_USE] = {gOtherText_Use, {.void_u8 = Task_ItemMenuAction_BattleUse}},
    [ITEMMENUACTION_CHECK] = {gOtherText_Check, {.void_u8 = Task_ItemMenuAction_Use}},
    [ITEMMENUACTION_OPEN] = {gOtherText_Open, {.void_u8 = Task_ItemMenuAction_Use}},
    [ITEMMENUACTION_OPEN_BERRIES] = {gOtherText_Open, {.void_u8 = Task_ItemMenuAction_BattleUse}},
    [ITEMMENUACTION_WALK] = {gOtherText_Walk, {.void_u8 = Task_ItemMenuAction_Use}},
    [ITEMMENUACTION_DESELECT] = {gOtherText_Deselect, {.void_u8 = Task_ItemMenuAction_ToggleSelect}},
    [ITEMMENUACTION_DUMMY] = {gString_Dummy, {.void_u8 = NULL}}
};

static const u8 sContextMenuItems_Field[][4] = {
    {
        ITEMMENUACTION_USE,
        ITEMMENUACTION_GIVE,
        ITEMMENUACTION_TOSS,
        ITEMMENUACTION_CANCEL
    }, {
        ITEMMENUACTION_USE,
        ITEMMENUACTION_REGISTER,
        ITEMMENUACTION_CANCEL,
        ITEMMENUACTION_DUMMY
    }, {
        ITEMMENUACTION_GIVE,
        ITEMMENUACTION_TOSS,
        ITEMMENUACTION_CANCEL,
        ITEMMENUACTION_DUMMY
    }
};

static const u8 sContextMenuItems_CheckGiveTossCancel[] = {
    ITEMMENUACTION_CHECK,
    ITEMMENUACTION_GIVE,
    ITEMMENUACTION_TOSS,
    ITEMMENUACTION_CANCEL
};

static const u8 sContextMenuItems_GiveIfNotKeyItemPocket[][2] = {
    {
        ITEMMENUACTION_GIVE,
        ITEMMENUACTION_CANCEL
    }, {
        ITEMMENUACTION_CANCEL,
        ITEMMENUACTION_DUMMY
    }, {
        ITEMMENUACTION_GIVE,
        ITEMMENUACTION_CANCEL
    }
};

static const u8 sContextMenuItems_Open[] = {
    ITEMMENUACTION_OPEN,
    ITEMMENUACTION_CANCEL
};

static const u8 sContextMenuItems_BattleUse[] = {
    ITEMMENUACTION_BATTLE_USE,
    ITEMMENUACTION_CANCEL
};

static const u8 sContextMenuItems_Cancel[] = {
    ITEMMENUACTION_CANCEL,
    ITEMMENUACTION_DUMMY
};

static const TaskFunc sItemContextTaskFuncs[] = {
    [ITEMMENULOCATION_FIELD]  = Task_ItemContext_FieldOrBattle,
    [ITEMMENULOCATION_PARTY]  = Task_ItemContext_FieldGive,
    [ITEMMENULOCATION_SHOP]   = Task_ItemContext_Sell,
    [ITEMMENULOCATION_ITEMPC] = Task_ItemContext_Deposit,
    [ITEMMENULOCATION_PCBOX]  = Task_ItemContext_PcBoxGive,
    [ITEMMENULOCATION_BATTLE] = Task_ItemContext_FieldOrBattle,
    [ITEMMENULOCATION_OLD_MAN] = NULL
};

static const struct YesNoFuncTable sYesNoMenu_Toss = {
    Task_TossItem_Yes,
    Task_TossItem_No
};

static const struct YesNoFuncTable sYesNoMenu_Sell = {
    Task_SellItem_Yes,
    Task_SellItem_No
};

static const u8 sListItemTextColor_RegularItem[] = _("{COLOR_HIGHLIGHT_SHADOW DARK_GRAY TRANSPARENT LIGHT_GRAY}");

static const u8 sListItemTextColor_TmCase_BerryPouch[] = _("{COLOR_HIGHLIGHT_SHADOW BLUE TRANSPARENT LIGHT_BLUE}");

static const struct ScrollArrowsTemplate sPocketSwitchArrowPairTemplate = {
    .firstArrowType = SCROLL_ARROW_LEFT,
    .firstX = 8,
    .firstY = 72,
    .secondArrowType = SCROLL_ARROW_RIGHT,
    .secondX = 72,
    .secondY = 72,
    .fullyUpThreshold = 0,
    .fullyDownThreshold = 2,
    .tileTag = 111,
    .palTag = 111,
    .palNum = 0,
};

static const u8 sBlit_SelectButton[] = INCBIN_U8("graphics/interface/select_button.4bpp");

#define tSwitchDir     data[11]
#define tSwitchCounter data[12]
#define tSwitchState   data[13]

void GoToBagMenu(u8 location, u8 pocket, MainCallback bagCallback)
{
    u8 i;

    NullBagMenuBufferPtrs();
    sBagMenuDisplay = Alloc(sizeof(struct BagMenuAlloc));
    if (sBagMenuDisplay == NULL)
        SetMainCallback2(bagCallback);
    else
    {
        if (location != ITEMMENULOCATION_LAST)
            gBagMenuState.location = location;
        if (bagCallback != NULL)
            gBagMenuState.bagCallback = bagCallback;
        sBagMenuDisplay->exitCB = NULL;
        sBagMenuDisplay->itemOriginalLocation = 0xFF;
        sBagMenuDisplay->itemMenuIcon = 0;
        sBagMenuDisplay->inhibitItemDescriptionPrint = FALSE;
        sBagMenuDisplay->pocketScrollArrowsTask = TASK_NONE;
        sBagMenuDisplay->pocketSwitchArrowsTask = TASK_NONE;
        if (location == ITEMMENULOCATION_ITEMPC)
            sBagMenuDisplay->pocketSwitchMode = 1;
        else if (location == ITEMMENULOCATION_OLD_MAN)
            sBagMenuDisplay->pocketSwitchMode = 2;
        else
            sBagMenuDisplay->pocketSwitchMode = 0;
        for (i = 0; i < 4; i++)
        {
            sBagMenuDisplay->data[i] = 0;
        }
        if (pocket == OPEN_BAG_ITEMS || pocket == OPEN_BAG_KEYITEMS || pocket == OPEN_BAG_POKEBALLS)
            gBagMenuState.pocket = pocket;
        gTextFlags.autoScroll = FALSE;
        gSpecialVar_ItemId = ITEM_NONE;
        SetMainCallback2(CB2_OpenBagMenu);
    }
}

void CB2_BagMenuFromStartMenu(void)
{
    GoToBagMenu(ITEMMENULOCATION_FIELD, OPEN_BAG_LAST, CB2_ReturnToFieldWithOpenMenu);
}

void CB2_BagMenuFromBattle(void)
{
    GoToBagMenu(ITEMMENULOCATION_BATTLE, OPEN_BAG_LAST, SetCB2ToReshowScreenAfterMenu2);
}

static void CB2_BagMenuRun(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    DoScheduledBgTilemapCopiesToVram();
    UpdatePaletteFade();
}

static void VBlankCB_BagMenuRun(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void CB2_OpenBagMenu(void)
{
    while (1)
    {
        if (IsActiveOverworldLinkBusy() == TRUE)
            break;
        if (LoadBagMenuGraphics() == TRUE)
            break;
        if (MenuHelpers_IsLinkActive() == TRUE)
            break;
    }
}

static bool8 LoadBagMenuGraphics(void)
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
        gPaletteFade.bufferTransferDisabled = TRUE;
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
        if (!MenuHelpers_IsLinkActive())
        {
            ResetTasks();
        }
        gMain.state++;
        break;
    case 7:
        if (BagMenuInitBgsAndAllocTilemapBuffer())
        {
            sBagMenuDisplay->data[0] = 0;
            gMain.state++;
        }
        else
        {
            FadeOutOfBagMenu();
            return TRUE;
        }
        break;
    case 8:
        if (DoLoadBagGraphics() == TRUE)
            gMain.state++;
        break;
    case 9:
        InitBagWindows();
        gMain.state++;
        break;
    case 10:
        All_CalculateNItemsAndMaxShowed();
        CalculateInitialCursorPosAndItemsAbove();
        UpdatePocketScrollPositions();
        gMain.state++;
        break;
    case 11:
        if (!TryAllocListMenuBuffers())
        {
            FadeOutOfBagMenu();
            return TRUE;
        }
        gMain.state++;
        break;
    case 12:
        Bag_BuildListMenuTemplate(gBagMenuState.pocket);
        gMain.state++;
        break;
    case 13:
        if (gBagMenuState.location != ITEMMENULOCATION_ITEMPC)
            PrintBagPocketName();
        else
            BagDrawDepositItemTextBox();
        gMain.state++;
        break;
    case 14:
        taskId = CreateBagInputHandlerTask(gBagMenuState.location);
        gTasks[taskId].data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gBagMenuState.cursorPos[gBagMenuState.pocket], gBagMenuState.itemsAbove[gBagMenuState.pocket]);
        gTasks[taskId].data[3] = 0;
        gTasks[taskId].data[8] = 0;
        gMain.state++;
        break;
    case 15:
        CreateBagSprite(gBagMenuState.pocket);
        gMain.state++;
        break;
    case 16:
        CreatePocketScrollArrowPair();
        CreatePocketSwitchArrowPair();
        gMain.state++;
        break;
    case 17:
        CreateSwapLine();
        gMain.state++;
        break;
    case 18:
        ShowBagOrBeginWin0OpenTask();
        gMain.state++;
        break;
    case 19:
        if (gBagMenuState.location == ITEMMENULOCATION_ITEMPC)
            SetHelpContext(HELPCONTEXT_PLAYERS_PC_ITEMS);
        else
            SetHelpContext(HELPCONTEXT_BAG);
        gPaletteFade.bufferTransferDisabled = FALSE;
        gMain.state++;
        break;
    default:
        SetVBlankCallback(VBlankCB_BagMenuRun);
        SetMainCallback2(CB2_BagMenuRun);
        return TRUE;
    }
    return FALSE;
}

static void FadeOutOfBagMenu(void)
{
    BeginNormalPaletteFade(PALETTES_ALL, -2, 0, 16, RGB_BLACK);
    CreateTask(Task_WaitFadeOutOfBagMenu, 0);
    SetVBlankCallback(VBlankCB_BagMenuRun);
    SetMainCallback2(CB2_BagMenuRun);
}

static void Task_WaitFadeOutOfBagMenu(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(gBagMenuState.bagCallback);
        DestroyBagMenuResources();
        DestroyTask(taskId);
    }
}

static void NullBagMenuBufferPtrs(void)
{
    sBagMenuDisplay = NULL;
    sBagBgTilemapBuffer = NULL;
    sListMenuItems = NULL;
    sListMenuItemStrings = NULL;
}

static bool8 BagMenuInitBgsAndAllocTilemapBuffer(void)
{
    void **buff;
    ResetAllBgsCoordinatesAndBgCntRegs();
    buff = &sBagBgTilemapBuffer;
    *buff = Alloc(0x800);
    if (*buff == NULL)
        return FALSE;
    memset(*buff, 0, 0x800);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, sBgTemplates, NELEMS(sBgTemplates));
    SetBgTilemapBuffer(1, *buff);
    ScheduleBgCopyTilemapToVram(1);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON);
    ShowBg(0);
    ShowBg(1);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    return TRUE;
}

static bool8 DoLoadBagGraphics(void)
{
    switch (sBagMenuDisplay->data[0])
    {
    case 0:
        ResetTempTileDataBuffers();
        DecompressAndCopyTileDataToVram(1, gBagBg_Gfx, 0, 0, 0);
        sBagMenuDisplay->data[0]++;
        break;
    case 1:
        if (FreeTempTileDataBuffersIfPossible() != TRUE)
        {
            if (gBagMenuState.location != ITEMMENULOCATION_ITEMPC)
                LZDecompressWram(gBagBg_Tilemap, sBagBgTilemapBuffer);
            else
                LZDecompressWram(gBagBg_ItemPC_Tilemap, sBagBgTilemapBuffer);
            sBagMenuDisplay->data[0]++;
        }
        break;
    case 2:
        LoadCompressedPalette(gBagBgPalette, BG_PLTT_ID(0), 3 * PLTT_SIZE_4BPP);
        if (!BagIsTutorial() && gSaveBlock2Ptr->playerGender != MALE)
            LoadCompressedPalette(gBagBgPalette_FemaleOverride, BG_PLTT_ID(0), PLTT_SIZE_4BPP);
        sBagMenuDisplay->data[0]++;
        break;
    case 3:
        if (BagIsTutorial() == TRUE || gSaveBlock2Ptr->playerGender == MALE)
            LoadCompressedSpriteSheet(&gSpriteSheet_BagMale);
        else
            LoadCompressedSpriteSheet(&gSpriteSheet_BagFemale);
        sBagMenuDisplay->data[0]++;
        break;
    case 4:
        LoadCompressedSpritePalette(&gSpritePalette_Bag);
        sBagMenuDisplay->data[0]++;
        break;
    case 5:
        LoadCompressedSpriteSheet(&gBagSwapSpriteSheet);
        sBagMenuDisplay->data[0]++;
        break;
    default:
        LoadCompressedSpritePalette(&gBagSwapSpritePalette);
        sBagMenuDisplay->data[0] = 0;
        return TRUE;
    }

    return FALSE;
}

static u8 CreateBagInputHandlerTask(u8 location)
{
    switch (location)
    {
    case ITEMMENULOCATION_OLD_MAN:
        return CreateTask(Task_Bag_OldManTutorial, 0);
    case ITEMMENULOCATION_TTVSCR_REGISTER:
        return CreateTask(Task_Bag_TeachyTvRegister, 0);
    case ITEMMENULOCATION_TTVSCR_TMS:
        return CreateTask(Task_Bag_TeachyTvTMs, 0);
    case ITEMMENULOCATION_TTVSCR_STATUS:
        return CreateTask(Task_Bag_TeachyTvStatus, 0);
    case ITEMMENULOCATION_TTVSCR_CATCHING:
        return CreateTask(Task_Bag_TeachyTvCatching, 0);
    default:
        return CreateTask(Task_BagMenu_HandleInput, 0);
    }
}

static bool8 TryAllocListMenuBuffers(void)
{
    // The items pocket has the highest capacity, + 1 for CANCEL
    sListMenuItems = Alloc((BAG_ITEMS_COUNT + 1) * sizeof(struct ListMenuItem));
    if (sListMenuItems == NULL)
        return FALSE;
    sListMenuItemStrings = Alloc((BAG_ITEMS_COUNT + 1) * sizeof(*sListMenuItemStrings));
    if (sListMenuItemStrings == NULL)
        return FALSE;
    return TRUE;
}

static void Bag_BuildListMenuTemplate(u8 pocket)
{
    u16 i;
    struct BagPocket * bagPocket = &gBagPockets[pocket];
    for (i = 0; i < sBagMenuDisplay->nItems[pocket]; i++)
    {
        BagListMenuGetItemNameColored(sListMenuItemStrings[i], bagPocket->itemSlots[i].itemId);
        sListMenuItems[i].label = sListMenuItemStrings[i];
        sListMenuItems[i].index = i;
    }
    StringCopy(sListMenuItemStrings[i], sListItemTextColor_RegularItem);
    StringAppend(sListMenuItemStrings[i], gFameCheckerText_Cancel);
    sListMenuItems[i].label = sListMenuItemStrings[i];
    sListMenuItems[i].index = i;
    gMultiuseListMenuTemplate.items = sListMenuItems;
    gMultiuseListMenuTemplate.totalItems = sBagMenuDisplay->nItems[pocket] + 1;
    gMultiuseListMenuTemplate.windowId = 0;
    gMultiuseListMenuTemplate.header_X = 0;
    gMultiuseListMenuTemplate.item_X = 9;
    gMultiuseListMenuTemplate.cursor_X = 1;
    gMultiuseListMenuTemplate.lettersSpacing = 0;
    gMultiuseListMenuTemplate.itemVerticalPadding = 2;
    gMultiuseListMenuTemplate.upText_Y = 2;
    gMultiuseListMenuTemplate.maxShowed = sBagMenuDisplay->maxShowed[pocket];
    gMultiuseListMenuTemplate.fontId = FONT_NORMAL;
    gMultiuseListMenuTemplate.cursorPal = 2;
    gMultiuseListMenuTemplate.fillValue = 0;
    gMultiuseListMenuTemplate.cursorShadowPal = 3;
    gMultiuseListMenuTemplate.moveCursorFunc = BagListMenuMoveCursorFunc;
    gMultiuseListMenuTemplate.itemPrintFunc = BagListMenuItemPrintFunc;
    gMultiuseListMenuTemplate.cursorKind = 0;
    gMultiuseListMenuTemplate.scrollMultiple = 0;
}

static void BagListMenuGetItemNameColored(u8 *dest, u16 itemId)
{
    if (itemId == ITEM_TM_CASE || itemId == ITEM_BERRY_POUCH)
        StringCopy(dest, sListItemTextColor_TmCase_BerryPouch);
    else
        StringCopy(dest, sListItemTextColor_RegularItem);
    StringAppend(dest, ItemId_GetName(itemId));
}

static void BagListMenuMoveCursorFunc(s32 itemIndex, bool8 onInit, struct ListMenu *list)
{
    if (onInit != TRUE)
    {
        PlaySE(SE_BAG_CURSOR);
        ShakeBagSprite();
    }
    if (sBagMenuDisplay->itemOriginalLocation == 0xFF)
    {
        DestroyItemMenuIcon(sBagMenuDisplay->itemMenuIcon ^ 1);
        if (sBagMenuDisplay->nItems[gBagMenuState.pocket] != itemIndex)
            CreateItemMenuIcon(BagGetItemIdByPocketPosition(gBagMenuState.pocket + 1, itemIndex), sBagMenuDisplay->itemMenuIcon);
        else
            CreateItemMenuIcon(ITEMS_COUNT, sBagMenuDisplay->itemMenuIcon);
        sBagMenuDisplay->itemMenuIcon ^= 1;
        if (!sBagMenuDisplay->inhibitItemDescriptionPrint)
            PrintItemDescriptionOnMessageWindow(itemIndex);
    }
}

static void BagListMenuItemPrintFunc(u8 windowId, u32 itemId, u8 y)
{
    u16 bagItemId;
    u16 bagItemQuantity;
    if (sBagMenuDisplay->itemOriginalLocation != 0xFF)
    {
        if (sBagMenuDisplay->itemOriginalLocation == (u8)itemId)
            bag_menu_print_cursor(y, 2);
        else
            bag_menu_print_cursor(y, 0xFF);
    }
    if (itemId != -2 && sBagMenuDisplay->nItems[gBagMenuState.pocket] != itemId)
    {
        bagItemId = BagGetItemIdByPocketPosition(gBagMenuState.pocket + 1, itemId);
        bagItemQuantity = BagGetQuantityByPocketPosition(gBagMenuState.pocket + 1, itemId);
        if (gBagMenuState.pocket != POCKET_KEY_ITEMS - 1 && ItemId_GetImportance(bagItemId) == 0)
        {
            ConvertIntToDecimalStringN(gStringVar1, bagItemQuantity, STR_CONV_MODE_RIGHT_ALIGN, 3);
            StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
            BagPrintTextOnWindow(windowId, FONT_SMALL, gStringVar4, 0x6e, y, 0, 0, 0xFF, 1);
        }
        else if (gSaveBlock1Ptr->registeredItem != ITEM_NONE && gSaveBlock1Ptr->registeredItem == bagItemId)
        {
            BlitBitmapToWindow(windowId, sBlit_SelectButton, 0x70, y, 0x18, 0x10);
        }
    }
}

static void bag_menu_print_cursor_(u8 taskId, u8 colorIdx)
{
    bag_menu_print_cursor(ListMenuGetYCoordForPrintingArrowCursor(taskId), colorIdx);
}

static void bag_menu_print_cursor(u8 y, u8 colorIdx)
{
    if (colorIdx == 0xFF)
    {
        FillWindowPixelRect(0, PIXEL_FILL(0), 1, y, GetMenuCursorDimensionByFont(FONT_NORMAL, 0), GetMenuCursorDimensionByFont(FONT_NORMAL, 1));
    }
    else
    {
        BagPrintTextOnWindow(0, FONT_NORMAL, gText_SelectorArrow2, 1, y, 0, 0, 0, colorIdx);
    }
}

static void PrintBagPocketName(void)
{
    FillWindowPixelBuffer(2, PIXEL_FILL(0));
    BagPrintTextOnWin1CenteredColor0(sPocketNames[gBagMenuState.pocket], gBagMenuState.pocket);
}

static void PrintItemDescriptionOnMessageWindow(s32 itemIndex)
{
    const u8 *description;
    if (itemIndex != sBagMenuDisplay->nItems[gBagMenuState.pocket])
        description = ItemId_GetDescription(BagGetItemIdByPocketPosition(gBagMenuState.pocket + 1, itemIndex));
    else
        description = gText_CloseBag;
    FillWindowPixelBuffer(1, PIXEL_FILL(0));
    BagPrintTextOnWindow(1, FONT_NORMAL, description, 0, 3, 2, 0, 0, 0);
}

static void CreatePocketScrollArrowPair(void)
{
    sBagMenuDisplay->pocketScrollArrowsTask = AddScrollIndicatorArrowPairParameterized(
        SCROLL_ARROW_UP,
        160,
        8,
        104,
        sBagMenuDisplay->nItems[gBagMenuState.pocket] - sBagMenuDisplay->maxShowed[gBagMenuState.pocket] + 1,
        110,
        110,
        &gBagMenuState.cursorPos[gBagMenuState.pocket]
    );
}

static void CreatePocketSwitchArrowPair(void)
{
    if (sBagMenuDisplay->pocketSwitchMode != 1)
    {
        sBagMenuDisplay->pocketSwitchArrowsTask = AddScrollIndicatorArrowPair(&sPocketSwitchArrowPairTemplate, &gBagMenuState.pocket);
    }
}

static void CreatePocketScrollArrowPair_SellQuantity(void)
{
    sBagMenuDisplay->contextMenuSelectedItem = 1;
    sBagMenuDisplay->pocketScrollArrowsTask = AddScrollIndicatorArrowPairParameterized(
        SCROLL_ARROW_UP,
        152,
        72,
        104,
        2,
        110,
        110,
        &sBagMenuDisplay->contextMenuSelectedItem
    );
}

static void CreateArrowPair_QuantitySelect(void)
{
    sBagMenuDisplay->contextMenuSelectedItem = 1;
    sBagMenuDisplay->pocketScrollArrowsTask = AddScrollIndicatorArrowPairParameterized(
        SCROLL_ARROW_UP,
        212,
        120,
        152,
        2,
        110,
        110,
        &sBagMenuDisplay->contextMenuSelectedItem
    );
}

static void BagDestroyPocketScrollArrowPair(void)
{
    if (sBagMenuDisplay->pocketScrollArrowsTask != 0xFF)
    {
        RemoveScrollIndicatorArrowPair(sBagMenuDisplay->pocketScrollArrowsTask);
        sBagMenuDisplay->pocketScrollArrowsTask = 0xFF;
    }
    BagDestroyPocketSwitchArrowPair();
}

static void BagDestroyPocketSwitchArrowPair(void)
{
    if (sBagMenuDisplay->pocketSwitchArrowsTask != 0xFF)
    {
        RemoveScrollIndicatorArrowPair(sBagMenuDisplay->pocketSwitchArrowsTask);
        sBagMenuDisplay->pocketSwitchArrowsTask = 0xFF;
    }
}

void ResetBagCursorPositions(void)
{
    u8 i;
    gBagMenuState.pocket = POCKET_ITEMS - 1;
    gBagMenuState.bagOpen = FALSE;
    for (i = 0; i < NUM_BAG_POCKETS_NO_CASES; i++)
    {
        gBagMenuState.itemsAbove[i] = 0;
        gBagMenuState.cursorPos[i] = 0;
    }
}

void PocketCalculateInitialCursorPosAndItemsAbove(u8 pocketId)
{
    if (gBagMenuState.cursorPos[pocketId] != 0 && gBagMenuState.cursorPos[pocketId] + sBagMenuDisplay->maxShowed[pocketId] > sBagMenuDisplay->nItems[pocketId] + 1)
    {
        gBagMenuState.cursorPos[pocketId] = (sBagMenuDisplay->nItems[pocketId] + 1) - sBagMenuDisplay->maxShowed[pocketId];
    }
    if (gBagMenuState.cursorPos[pocketId] + gBagMenuState.itemsAbove[pocketId] >= sBagMenuDisplay->nItems[pocketId] + 1)
    {
        if (sBagMenuDisplay->nItems[pocketId] + 1 < 2)
            gBagMenuState.itemsAbove[pocketId] = 0;
        else
            gBagMenuState.itemsAbove[pocketId] = sBagMenuDisplay->nItems[pocketId];
    }
}

static void CalculateInitialCursorPosAndItemsAbove(void)
{
    u8 i;
    for (i = 0; i < NUM_BAG_POCKETS_NO_CASES; i++)
    {
        PocketCalculateInitialCursorPosAndItemsAbove(i);
    }
}

static void UpdatePocketScrollPositions(void)
{
    u8 i;
    u8 j;

    for (i = 0; i < NUM_BAG_POCKETS_NO_CASES; i++)
    {
        if (gBagMenuState.itemsAbove[i] > 3)
        {
            for (j = 0; j <= gBagMenuState.itemsAbove[i] - 3; gBagMenuState.itemsAbove[i]--, gBagMenuState.cursorPos[i]++, j++)
            {
                if (gBagMenuState.cursorPos[i] + sBagMenuDisplay->maxShowed[i] == sBagMenuDisplay->nItems[i] + 1)
                    break;
            }
        }
    }
}

static void DestroyBagMenuResources(void)
{
    FREE_IF_SET(sBagMenuDisplay);
    FREE_IF_SET(sBagBgTilemapBuffer);
    FREE_IF_SET(sListMenuItems);
    FREE_IF_SET(sListMenuItemStrings);
    FreeAllWindowBuffers();
}

void ItemMenu_StartFadeToExitCallback(u8 taskId)
{
    BeginNormalPaletteFade(PALETTES_ALL, -2, 0, 16, RGB_BLACK);
    gTasks[taskId].func = Task_ItemMenu_WaitFadeAndSwitchToExitCallback;
}

static void Task_ItemMenu_WaitFadeAndSwitchToExitCallback(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!gPaletteFade.active && FuncIsActiveTask(Task_AnimateWin0v) != TRUE)
    {
        DestroyListMenuTask(data[0], &gBagMenuState.cursorPos[gBagMenuState.pocket], &gBagMenuState.itemsAbove[gBagMenuState.pocket]);
        if (sBagMenuDisplay->exitCB != NULL)
            SetMainCallback2(sBagMenuDisplay->exitCB);
        else
            SetMainCallback2(gBagMenuState.bagCallback);
        BagDestroyPocketScrollArrowPair();
        DestroyBagMenuResources();
        DestroyTask(taskId);
    }
}

static void ShowBagOrBeginWin0OpenTask(void)
{
    u16 paldata = RGB_BLACK;
    u8 taskId;

    SetBackdropFromPalette(&paldata);
    SetGpuReg(REG_OFFSET_WININ, 0);
    SetGpuReg(REG_OFFSET_WINOUT, WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR);
    BlendPalettes(PALETTES_ALL, 16, RGB_BLACK);
    BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
    if (gBagMenuState.bagOpen == TRUE)
    {
        SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(0, DISPLAY_WIDTH));
        SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(0, 0));
    }
    else
    {
        SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(0, DISPLAY_WIDTH));
        SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(0, DISPLAY_HEIGHT));
        taskId = CreateTask(Task_AnimateWin0v, 0);
        gTasks[taskId].data[0] = 192;
        gTasks[taskId].data[1] = -16;
        gBagMenuState.bagOpen = TRUE;
    }
}

void Bag_BeginCloseWin0Animation(void)
{

    u8 taskId = CreateTask(Task_AnimateWin0v, 0);
    gTasks[taskId].data[0] = -16;
    gTasks[taskId].data[1] =  16;
    gBagMenuState.bagOpen = FALSE;
}

void CB2_SetUpReshowBattleScreenAfterMenu(void)
{
    gBagMenuState.bagOpen = FALSE;
}

static void Task_AnimateWin0v(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    data[0] += data[1];
    if (data[0] > 160)
        SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(0, 160));
    else
        SetGpuReg(REG_OFFSET_WIN0V, data[0]);
    if ((data[1] == 16 && data[0] == 160) || (data[1] == -16 && data[0] == 0))
        DestroyTask(taskId);
}

void MoveItemSlotInList(struct ItemSlot * itemSlots_, u32 from, u32 to_)
{
    // dumb assignments needed to match
    struct ItemSlot *itemSlots = itemSlots_;
    u32 to = to_;

    if (from != to)
    {
        s16 i, count;
        struct ItemSlot firstSlot = itemSlots[from];

        if (to > from)
        {
            to--;
            for (i = from, count = to; i < count; i++)
                itemSlots[i] = itemSlots[i + 1];
        }
        else
        {
            for (i = from, count = to; i > count; i--)
                itemSlots[i] = itemSlots[i - 1];
        }
        itemSlots[to] = firstSlot;
    }
}

void Pocket_CalculateNItemsAndMaxShowed(u8 pocketId)
{
    u16 i;
    struct BagPocket * pocket = &gBagPockets[pocketId];
    BagPocketCompaction(pocket->itemSlots, pocket->capacity);
    sBagMenuDisplay->nItems[pocketId] = 0;
    for (i = 0; i < pocket->capacity; i++)
    {
        if (pocket->itemSlots[i].itemId == ITEM_NONE)
            break;
        sBagMenuDisplay->nItems[pocketId]++;
    }
    if (sBagMenuDisplay->nItems[pocketId] + 1 > 6)
        sBagMenuDisplay->maxShowed[pocketId] = 6;
    else
        sBagMenuDisplay->maxShowed[pocketId] = sBagMenuDisplay->nItems[pocketId] + 1;
}

static void All_CalculateNItemsAndMaxShowed(void)
{
    u8 i;
    for (i = 0; i < NUM_BAG_POCKETS_NO_CASES; i++)
        Pocket_CalculateNItemsAndMaxShowed(i);
}

void DisplayItemMessageInBag(u8 taskId, u8 fontId, const u8 * string, TaskFunc followUpFunc)
{
    s16 *data = gTasks[taskId].data;
    data[10] = OpenBagWindow(5);
    FillWindowPixelBuffer(data[10], PIXEL_FILL(1));
    DisplayMessageAndContinueTask(taskId, data[10], 0x06D, 0x0D, fontId, GetTextSpeedSetting(), string, followUpFunc);
    ScheduleBgCopyTilemapToVram(0);
}

void ItemMenu_SetExitCallback(MainCallback cb)
{
    sBagMenuDisplay->exitCB = cb;
}

static u8 GetSelectedItemIndex(u8 pocket)
{
    return gBagMenuState.cursorPos[pocket] + gBagMenuState.itemsAbove[pocket];
}

static void Task_BagMenu_HandleInput(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 cursorPos;
    u16 itemsAbove;
    s32 input;

    if (gPaletteFade.active)
        return;
    if (FuncIsActiveTask(Task_AnimateWin0v) == TRUE)
        return;
    if (IsActiveOverworldLinkBusy() == TRUE)
        return;
    switch (ProcessPocketSwitchInput(taskId, gBagMenuState.pocket))
    {
    case 1:
        SwitchPockets(taskId, -1, FALSE);
        return;
    case 2:
        SwitchPockets(taskId,  1, FALSE);
        return;
    default:
        if (JOY_NEW(SELECT_BUTTON) && gBagMenuState.location == ITEMMENULOCATION_FIELD)
        {
            ListMenuGetScrollAndRow(data[0], &cursorPos, &itemsAbove);
            if (cursorPos + itemsAbove != sBagMenuDisplay->nItems[gBagMenuState.pocket])
            {
                PlaySE(SE_SELECT);
                BeginMovingItemInPocket(taskId, cursorPos + itemsAbove);
                return;
            }
        }
        break;
    }
    input = ListMenu_ProcessInput(data[0]);
    ListMenuGetScrollAndRow(data[0], &gBagMenuState.cursorPos[gBagMenuState.pocket], &gBagMenuState.itemsAbove[gBagMenuState.pocket]);
    switch (input)
    {
    case LIST_NOTHING_CHOSEN:
        return;
    case LIST_CANCEL:
        PlaySE(SE_SELECT);
        gSpecialVar_ItemId = ITEM_NONE;
        Bag_BeginCloseWin0Animation();
        gTasks[taskId].func = ItemMenu_StartFadeToExitCallback;
        break;
    default:
        PlaySE(SE_SELECT);
        if (input == sBagMenuDisplay->nItems[gBagMenuState.pocket])
        {
            gSpecialVar_ItemId = ITEM_NONE;
            Bag_BeginCloseWin0Animation();
            gTasks[taskId].func = ItemMenu_StartFadeToExitCallback;
        }
        else
        {
            BagDestroyPocketScrollArrowPair();
            bag_menu_print_cursor_(data[0], 2);
            data[1] = input;
            data[2] = BagGetQuantityByPocketPosition(gBagMenuState.pocket + 1, input);
            gSpecialVar_ItemId = BagGetItemIdByPocketPosition(gBagMenuState.pocket + 1, input);
            gTasks[taskId].func = Task_ItemContextMenuByLocation;
        }
        break;
    }
}

static void Task_ItemContextMenuByLocation(u8 taskId)
{
    Bag_FillMessageBoxWithPalette(1);
    sItemContextTaskFuncs[gBagMenuState.location](taskId);
}

static void Task_RedrawArrowsAndReturnToBagMenuSelect(u8 taskId)
{
    Bag_FillMessageBoxWithPalette(0);
    CreatePocketScrollArrowPair();
    CreatePocketSwitchArrowPair();
    gTasks[taskId].func = Task_BagMenu_HandleInput;
}

static void Bag_FillMessageBoxWithPalette(u32 a0)
{
    SetBgTilemapPalette(1, 0, 14, 30, 6, a0 + 1);
    ScheduleBgCopyTilemapToVram(1);
}

static u8 ProcessPocketSwitchInput(u8 taskId, u8 pocketId)
{
    u8 lrState;
    if (sBagMenuDisplay->pocketSwitchMode != 0)
        return 0;
    lrState = GetLRKeysPressed();
    if (JOY_NEW(DPAD_LEFT) || lrState == MENU_L_PRESSED)
    {
        if (pocketId == POCKET_ITEMS - 1)
            return 0;
        PlaySE(SE_BAG_POCKET);
        return 1;
    }
    if (JOY_NEW(DPAD_RIGHT) || lrState == MENU_R_PRESSED)
    {
        if (pocketId >= POCKET_POKE_BALLS - 1)
            return 0;
        PlaySE(SE_BAG_POCKET);
        return 2;
    }
    return 0;
}

static void SwitchPockets(u8 taskId, s16 direction, bool16 a2)
{
    s16 *data = gTasks[taskId].data;
    tSwitchState = 0;
    tSwitchCounter = 0;
    tSwitchDir = direction;
    if (!a2)
    {
        ClearWindowTilemap(0);
        ClearWindowTilemap(1);
        ClearWindowTilemap(2);
        DestroyListMenuTask(data[0], &gBagMenuState.cursorPos[gBagMenuState.pocket], &gBagMenuState.itemsAbove[gBagMenuState.pocket]);
        ScheduleBgCopyTilemapToVram(0);
        DestroyItemMenuIcon(sBagMenuDisplay->itemMenuIcon ^ 1);
        BagDestroyPocketScrollArrowPair();
    }
    FillBgTilemapBufferRect_Palette0(1, 0x02D, 11, 1, 18, 12);
    ScheduleBgCopyTilemapToVram(1);
    SetBagVisualPocketId(gBagMenuState.pocket + direction);
    SetTaskFuncWithFollowupFunc(taskId, Task_AnimateSwitchPockets, gTasks[taskId].func);
}

static void Task_AnimateSwitchPockets(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!MenuHelpers_IsLinkActive() && !BagIsTutorial())
    {
        switch (ProcessPocketSwitchInput(taskId, gBagMenuState.pocket + tSwitchDir))
        {
        case 1:
            gBagMenuState.pocket += tSwitchDir;
            SwitchTaskToFollowupFunc(taskId);
            SwitchPockets(taskId, -1, TRUE);
            return;
        case 2:
            gBagMenuState.pocket += tSwitchDir;
            SwitchTaskToFollowupFunc(taskId);
            SwitchPockets(taskId,  1, TRUE);
            return;
        }
    }
    switch (tSwitchState)
    {
    case 0:
        // Animate the item list being revealed from the bottom row up
        if (tSwitchCounter != SHRT_MAX)
        {
            tSwitchCounter++;
            DrawItemListRow(tSwitchCounter);
            if (tSwitchCounter == LIST_TILES_HEIGHT)
                tSwitchCounter = SHRT_MAX;
        }
        if (tSwitchCounter == SHRT_MAX)
            tSwitchState++;
        break;
    case 1:
        gBagMenuState.pocket += tSwitchDir;
        PrintBagPocketName();
        Bag_BuildListMenuTemplate(gBagMenuState.pocket);
        data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gBagMenuState.cursorPos[gBagMenuState.pocket], gBagMenuState.itemsAbove[gBagMenuState.pocket]);
        PutWindowTilemap(1);
        PutWindowTilemap(2);
        ScheduleBgCopyTilemapToVram(0);
        CreatePocketScrollArrowPair();
        CreatePocketSwitchArrowPair();
        SwitchTaskToFollowupFunc(taskId);
        break;
    }
}

static void BeginMovingItemInPocket(u8 taskId, s16 itemIndex)
{
    u16 itemsAbove;
    u16 cursorPos;
    s16 *data = gTasks[taskId].data;
    ListMenuGetScrollAndRow(data[0], &cursorPos, &itemsAbove);
    ListMenuSetTemplateField(data[0], LISTFIELD_CURSORKIND, 1);
    data[1] = itemIndex;
    sBagMenuDisplay->itemOriginalLocation = itemIndex;
    StringCopy(gStringVar1, ItemId_GetName(BagGetItemIdByPocketPosition(gBagMenuState.pocket + 1, data[1])));
    StringExpandPlaceholders(gStringVar4, gOtherText_WhereShouldTheStrVar1BePlaced);
    FillWindowPixelBuffer(1, PIXEL_FILL(0));
    BagPrintTextOnWindow(1, FONT_NORMAL, gStringVar4, 0, 3, 2, 0, 0, 0);
    UpdateSwapLinePos(0, ListMenuGetYCoordForPrintingArrowCursor(data[0]));
    SetSwapLineInvisibility(FALSE);
    BagDestroyPocketSwitchArrowPair();
    bag_menu_print_cursor_(data[0], 2);
    gTasks[taskId].func = Task_MoveItemInPocket_HandleInput;
}

static void Task_MoveItemInPocket_HandleInput(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    s32 input;
    u16 itemsAbove;
    u16 cursorPos;
    if (IsActiveOverworldLinkBusy() == TRUE)
        return;
    input = ListMenu_ProcessInput(data[0]);
    ListMenuGetScrollAndRow(data[0], &gBagMenuState.cursorPos[gBagMenuState.pocket], &gBagMenuState.itemsAbove[gBagMenuState.pocket]);
    UpdateSwapLinePos(0, ListMenuGetYCoordForPrintingArrowCursor(data[0]));
    if (JOY_NEW(SELECT_BUTTON))
    {
        PlaySE(SE_SELECT);
        sBagMenuDisplay->itemOriginalLocation = 0xFF;
        ListMenuGetScrollAndRow(data[0], &cursorPos, &itemsAbove);
        ExecuteMoveItemInPocket(taskId, cursorPos + itemsAbove);
        return;
    }
    switch (input)
    {
    case LIST_NOTHING_CHOSEN:
        return;
    case LIST_CANCEL:
        PlaySE(SE_SELECT);
        sBagMenuDisplay->itemOriginalLocation = 0xFF;
        ListMenuGetScrollAndRow(data[0], &cursorPos, &itemsAbove);
        AbortMovingItemInPocket(taskId, cursorPos + itemsAbove);
        break;
    default:
        PlaySE(SE_SELECT);
        sBagMenuDisplay->itemOriginalLocation = 0xFF;
        ExecuteMoveItemInPocket(taskId, input);
        break;
    }
}

static void ExecuteMoveItemInPocket(u8 taskId, u32 itemIndex)
{
    s16 *data = gTasks[taskId].data;
    if (data[1] == itemIndex || data[1] == itemIndex - 1)
    {
        AbortMovingItemInPocket(taskId, itemIndex);
    }
    else
    {
        MoveItemSlotInList(gBagPockets[gBagMenuState.pocket].itemSlots, data[1], itemIndex);
        DestroyListMenuTask(data[0], &gBagMenuState.cursorPos[gBagMenuState.pocket], &gBagMenuState.itemsAbove[gBagMenuState.pocket]);
        if (data[1] < itemIndex)
            gBagMenuState.itemsAbove[gBagMenuState.pocket]--;
        Bag_BuildListMenuTemplate(gBagMenuState.pocket);
        data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gBagMenuState.cursorPos[gBagMenuState.pocket], gBagMenuState.itemsAbove[gBagMenuState.pocket]);
        SetSwapLineInvisibility(TRUE);
        CreatePocketSwitchArrowPair();
        gTasks[taskId].func = Task_BagMenu_HandleInput;
    }
}

static void AbortMovingItemInPocket(u8 taskId, u32 itemIndex)
{
    s16 *data = gTasks[taskId].data;
    DestroyListMenuTask(data[0], &gBagMenuState.cursorPos[gBagMenuState.pocket], &gBagMenuState.itemsAbove[gBagMenuState.pocket]);
    if (data[1] < itemIndex)
        gBagMenuState.itemsAbove[gBagMenuState.pocket]--;
    Bag_BuildListMenuTemplate(gBagMenuState.pocket);
    data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gBagMenuState.cursorPos[gBagMenuState.pocket], gBagMenuState.itemsAbove[gBagMenuState.pocket]);
    SetSwapLineInvisibility(TRUE);
    CreatePocketSwitchArrowPair();
    gTasks[taskId].func = Task_BagMenu_HandleInput;
}

static void InitQuantityToTossOrDeposit(u16 cursorPos, const u8 *str)
{
    u8 r4;
    u8 r5 = ShowBagWindow(6, 2);
    CopyItemName(BagGetItemIdByPocketPosition(gBagMenuState.pocket + 1, cursorPos), gStringVar1);
    StringExpandPlaceholders(gStringVar4, str);
    BagPrintTextOnWindow(r5, FONT_NORMAL, gStringVar4, 0, 2, 1, 0, 0, 1);
    r4 = ShowBagWindow(0, 0);
    ConvertIntToDecimalStringN(gStringVar1, 1, STR_CONV_MODE_LEADING_ZEROS, 3);
    StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
    BagPrintTextOnWindow(r4, FONT_SMALL, gStringVar4, 4, 10, 1, 0, 0, 1);
    CreateArrowPair_QuantitySelect();
}

static void UpdateQuantityToTossOrDeposit(s16 value, u8 ndigits)
{
    u8 r6 = GetBagWindow(0);
    FillWindowPixelBuffer(r6, PIXEL_FILL(1));
    ConvertIntToDecimalStringN(gStringVar1, value, STR_CONV_MODE_LEADING_ZEROS, ndigits);
    StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
    BagPrintTextOnWindow(r6, FONT_SMALL, gStringVar4, 4, 10, 1, 0, 0, 1);
}

// row of 0 is the bottom row in the list, up to LIST_TILES_HEIGHT at the top
static void DrawItemListRow(u8 row)
{
    CopyToBgTilemapBufferRect(1, &sItemListTilemap[(LIST_TILES_HEIGHT - row) * LIST_TILES_WIDTH], 11, 1 + LIST_TILES_HEIGHT - row, LIST_TILES_WIDTH, 1);
    ScheduleBgCopyTilemapToVram(1);
}

static void OpenContextMenu(u8 taskId)
{
    u8 r6;
    u8 r4;
    switch (gBagMenuState.location)
    {
    case ITEMMENULOCATION_BATTLE:
    case ITEMMENULOCATION_TTVSCR_STATUS:
        if (gSpecialVar_ItemId == ITEM_BERRY_POUCH)
        {
            sContextMenuItemsBuffer[0] = ITEMMENUACTION_OPEN_BERRIES;
            sContextMenuItemsBuffer[1] = ITEMMENUACTION_CANCEL;
            sContextMenuItemsPtr = sContextMenuItemsBuffer;
            sContextMenuNumItems = 2;
        }
        else if (ItemId_GetBattleUsage(gSpecialVar_ItemId))
        {
            sContextMenuItemsPtr = sContextMenuItems_BattleUse;
            sContextMenuNumItems = 2;
        }
        else
        {
            sContextMenuItemsPtr = sContextMenuItems_Cancel;
            sContextMenuNumItems = 1;
        }
        break;
    case ITEMMENULOCATION_OLD_MAN:
    case ITEMMENULOCATION_TTVSCR_CATCHING:
        sContextMenuItemsPtr = sContextMenuItems_BattleUse;
        sContextMenuNumItems = 2;
        break;
    default:
        if (MenuHelpers_IsLinkActive() == TRUE || InUnionRoom() == TRUE)
        {
            if (gSpecialVar_ItemId == ITEM_TM_CASE || gSpecialVar_ItemId == ITEM_BERRY_POUCH)
            {
                sContextMenuItemsPtr = sContextMenuItems_Open;
                sContextMenuNumItems = 2;
            }
            else
            {
                if (gBagMenuState.pocket == POCKET_KEY_ITEMS - 1)
                    sContextMenuNumItems = 1;
                else
                    sContextMenuNumItems = 2;
                sContextMenuItemsPtr = sContextMenuItems_GiveIfNotKeyItemPocket[gBagMenuState.pocket];
            }
        }
        else
        {
            switch (gBagMenuState.pocket)
            {
            case OPEN_BAG_ITEMS:
                sContextMenuNumItems = 4;
                if (ItemIsMail(gSpecialVar_ItemId) == TRUE)
                    sContextMenuItemsPtr = sContextMenuItems_CheckGiveTossCancel;
                else
                    sContextMenuItemsPtr = sContextMenuItems_Field[gBagMenuState.pocket];
                break;
            case OPEN_BAG_KEYITEMS:
                sContextMenuItemsPtr = sContextMenuItemsBuffer;
                sContextMenuNumItems = 3;
                sContextMenuItemsBuffer[2] = ITEMMENUACTION_CANCEL;
                if (gSaveBlock1Ptr->registeredItem == gSpecialVar_ItemId)
                    sContextMenuItemsBuffer[1] = ITEMMENUACTION_DESELECT;
                else
                    sContextMenuItemsBuffer[1] = ITEMMENUACTION_REGISTER;
                if (gSpecialVar_ItemId == ITEM_TM_CASE || gSpecialVar_ItemId == ITEM_BERRY_POUCH)
                    sContextMenuItemsBuffer[0] = ITEMMENUACTION_OPEN;
                else if (gSpecialVar_ItemId == ITEM_BICYCLE && TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_ACRO_BIKE | PLAYER_AVATAR_FLAG_MACH_BIKE))
                    sContextMenuItemsBuffer[0] = ITEMMENUACTION_WALK;
                else
                    sContextMenuItemsBuffer[0] = ITEMMENUACTION_USE;
                break;
            case OPEN_BAG_POKEBALLS:
                sContextMenuItemsPtr = sContextMenuItems_Field[gBagMenuState.pocket];
                sContextMenuNumItems = 3;
                break;
            }
        }
    }
    r6 = ShowBagWindow(10, sContextMenuNumItems - 1);
    AddItemMenuActionTextPrinters(
        r6,
        FONT_NORMAL,
        GetMenuCursorDimensionByFont(FONT_NORMAL, 0),
        2,
        GetFontAttribute(FONT_NORMAL, FONTATTR_LETTER_SPACING),
        GetFontAttribute(FONT_NORMAL, FONTATTR_MAX_LETTER_HEIGHT) + 2,
        sContextMenuNumItems,
        sItemMenuContextActions,
        sContextMenuItemsPtr
    );
    Menu_InitCursor(r6, FONT_NORMAL, 0, 2, GetFontAttribute(FONT_NORMAL, FONTATTR_MAX_LETTER_HEIGHT) + 2, sContextMenuNumItems, 0);
    r4 = ShowBagWindow(6, 0);
    CopyItemName(gSpecialVar_ItemId, gStringVar1);
    StringExpandPlaceholders(gStringVar4, gText_Var1IsSelected);
    BagPrintTextOnWindow(r4, FONT_NORMAL, gStringVar4, 0, 2, 1, 0, 0, 1);
}

static void Task_ItemContext_FieldOrBattle(u8 taskId)
{
    OpenContextMenu(taskId);
    gTasks[taskId].func = Task_FieldItemContextMenuHandleInput;
}

static void Task_FieldItemContextMenuHandleInput(u8 taskId)
{
    s8 input;
    if (IsActiveOverworldLinkBusy() != TRUE)
    {
        input = Menu_ProcessInputNoWrapAround();
        switch (input)
        {
        case -1:
            PlaySE(SE_SELECT);
            sItemMenuContextActions[ITEMMENUACTION_CANCEL].func.void_u8(taskId);
            break;
        case -2:
            break;
        default:
            PlaySE(SE_SELECT);
            sItemMenuContextActions[sContextMenuItemsPtr[input]].func.void_u8(taskId);
            break;
        }
    }
}

static void Task_ItemMenuAction_Use(u8 taskId)
{
    if (ItemId_GetFieldFunc(gSpecialVar_ItemId) != NULL)
    {
        HideBagWindow(10);
        HideBagWindow(6);
        PutWindowTilemap(0);
        PutWindowTilemap(1);
        ScheduleBgCopyTilemapToVram(0);
        if (CalculatePlayerPartyCount() == 0 && ItemId_GetType(gSpecialVar_ItemId) == ITEM_TYPE_PARTY_MENU)
            Task_PrintThereIsNoPokemon(taskId);
        else
            ItemId_GetFieldFunc(gSpecialVar_ItemId)(taskId);
    }
}

static void Task_ItemMenuAction_Toss(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    ClearWindowTilemap(GetBagWindow(10));
    ClearWindowTilemap(GetBagWindow(6));
    HideBagWindow(10);
    HideBagWindow(6);
    PutWindowTilemap(0);
    data[8] = 1;
    if (data[2] == 1)
    {
        Task_ConfirmTossItems(taskId);
    }
    else
    {
        InitQuantityToTossOrDeposit(data[1], gText_TossOutHowManyStrVar1s);
        gTasks[taskId].func = Task_SelectQuantityToToss;
    }
}

static void Task_ConfirmTossItems(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    ConvertIntToDecimalStringN(gStringVar2, data[8], STR_CONV_MODE_LEFT_ALIGN, 3);
    StringExpandPlaceholders(gStringVar4, gText_ThrowAwayStrVar2OfThisItemQM);
    BagPrintTextOnWindow(ShowBagWindow(6, 1), FONT_NORMAL, gStringVar4, 0, 2, 1, 0, 0, 1);
    BagCreateYesNoMenuBottomRight(taskId, &sYesNoMenu_Toss);
}

static void Task_TossItem_No(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    HideBagWindow(6);
    PutWindowTilemap(1);
    ScheduleBgCopyTilemapToVram(0);
    bag_menu_print_cursor_(data[0], 1);
    Task_RedrawArrowsAndReturnToBagMenuSelect(taskId);
}

static void Task_SelectQuantityToToss(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (AdjustQuantityAccordingToDPadInput(&data[8], data[2]) == TRUE)
    {
        UpdateQuantityToTossOrDeposit(data[8], 3);
    }
    else if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        ClearWindowTilemap(GetBagWindow(6));
        HideBagWindow(6);
        HideBagWindow(0);
        ScheduleBgCopyTilemapToVram(0);
        BagDestroyPocketScrollArrowPair();
        Task_ConfirmTossItems(taskId);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        HideBagWindow(6);
        HideBagWindow(0);
        PutWindowTilemap(0);
        PutWindowTilemap(1);
        ScheduleBgCopyTilemapToVram(0);
        bag_menu_print_cursor_(data[0], 1);
        BagDestroyPocketScrollArrowPair();
        Task_RedrawArrowsAndReturnToBagMenuSelect(taskId);
    }
}

static void Task_TossItem_Yes(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    HideBagWindow(6);
    CopyItemName(BagGetItemIdByPocketPosition(gBagMenuState.pocket + 1, data[1]), gStringVar1);
    ConvertIntToDecimalStringN(gStringVar2, data[8], STR_CONV_MODE_LEFT_ALIGN, 3);
    StringExpandPlaceholders(gStringVar4, gText_ThrewAwayStrVar2StrVar1s);
    BagPrintTextOnWindow(ShowBagWindow(6, 3), FONT_NORMAL, gStringVar4, 0, 2, 1, 0, 0, 1);
    gTasks[taskId].func = Task_WaitAB_RedrawAndReturnToBag;
}

static void Task_WaitAB_RedrawAndReturnToBag(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        RemoveBagItem(gSpecialVar_ItemId, data[8]);
        HideBagWindow(6);
        DestroyListMenuTask(data[0], &gBagMenuState.cursorPos[gBagMenuState.pocket], &gBagMenuState.itemsAbove[gBagMenuState.pocket]);
        Pocket_CalculateNItemsAndMaxShowed(gBagMenuState.pocket);
        PocketCalculateInitialCursorPosAndItemsAbove(gBagMenuState.pocket);
        Bag_BuildListMenuTemplate(gBagMenuState.pocket);
        data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gBagMenuState.cursorPos[gBagMenuState.pocket], gBagMenuState.itemsAbove[gBagMenuState.pocket]);
        PutWindowTilemap(1);
        ScheduleBgCopyTilemapToVram(0);
        bag_menu_print_cursor_(data[0], 1);
        Task_RedrawArrowsAndReturnToBagMenuSelect(taskId);
    }
}

static void Task_ItemMenuAction_ToggleSelect(u8 taskId)
{
    u16 itemId;
    s16 *data = gTasks[taskId].data;
    itemId = BagGetItemIdByPocketPosition(gBagMenuState.pocket + 1, data[1]);
    if (gSaveBlock1Ptr->registeredItem == itemId)
        gSaveBlock1Ptr->registeredItem = ITEM_NONE;
    else
        gSaveBlock1Ptr->registeredItem = itemId;

    DestroyListMenuTask(data[0], &gBagMenuState.cursorPos[gBagMenuState.pocket], &gBagMenuState.itemsAbove[gBagMenuState.pocket]);
    Bag_BuildListMenuTemplate(gBagMenuState.pocket);
    data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gBagMenuState.cursorPos[gBagMenuState.pocket], gBagMenuState.itemsAbove[gBagMenuState.pocket]);
    CopyWindowToVram(0, COPYWIN_MAP);
    Task_ItemMenuAction_Cancel(taskId);
}

static void Task_ItemMenuAction_Give(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 itemId = BagGetItemIdByPocketPosition(gBagMenuState.pocket + 1, data[1]);
    HideBagWindow(10);
    HideBagWindow(6);
    PutWindowTilemap(0);
    PutWindowTilemap(1);
    CopyWindowToVram(0, COPYWIN_MAP);
    if (!IsWritingMailAllowed(itemId))
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_CantWriteMailHere, Task_WaitAButtonAndCloseContextMenu);
    else if (ItemId_GetImportance(itemId) == 0)
    {
        if (CalculatePlayerPartyCount() == 0)
        {
            Task_PrintThereIsNoPokemon(taskId);
        }
        else
        {
            sBagMenuDisplay->exitCB = CB2_ChooseMonToGiveItem;
            gTasks[taskId].func = ItemMenu_StartFadeToExitCallback;
        }
    }
    else
        Task_PrintItemCantBeHeld(taskId);
}

static void Task_PrintThereIsNoPokemon(u8 taskId)
{
    DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_ThereIsNoPokemon, Task_WaitAButtonAndCloseContextMenu);
}

static void Task_PrintItemCantBeHeld(u8 taskId)
{
    CopyItemName(gSpecialVar_ItemId, gStringVar1);
    StringExpandPlaceholders(gStringVar4, gText_ItemCantBeHeld);
    DisplayItemMessageInBag(taskId, FONT_NORMAL, gStringVar4, Task_WaitAButtonAndCloseContextMenu);
}

static void Task_WaitAButtonAndCloseContextMenu(u8 taskId)
{
    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        Task_ReturnToBagFromContextMenu(taskId);
    }
}

void Task_ReturnToBagFromContextMenu(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    CloseBagWindow(5);
    DestroyListMenuTask(data[0], &gBagMenuState.cursorPos[gBagMenuState.pocket], &gBagMenuState.itemsAbove[gBagMenuState.pocket]);
    Pocket_CalculateNItemsAndMaxShowed(gBagMenuState.pocket);
    PocketCalculateInitialCursorPosAndItemsAbove(gBagMenuState.pocket);
    Bag_BuildListMenuTemplate(gBagMenuState.pocket);
    data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gBagMenuState.cursorPos[gBagMenuState.pocket], gBagMenuState.itemsAbove[gBagMenuState.pocket]);
    ScheduleBgCopyTilemapToVram(0);
    bag_menu_print_cursor_(data[0], 1);
    Task_RedrawArrowsAndReturnToBagMenuSelect(taskId);
}

static void Task_UnusedReturnToBag(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 itemsAbove;
    u16 cursorPos;
    ListMenuGetScrollAndRow(data[0], &cursorPos, &itemsAbove);
    PrintItemDescriptionOnMessageWindow(cursorPos + itemsAbove);
    PutWindowTilemap(0);
    ScheduleBgCopyTilemapToVram(0);
    bag_menu_print_cursor_(data[0], 1);
    Task_RedrawArrowsAndReturnToBagMenuSelect(taskId);
}

static void Task_ItemMenuAction_Cancel(u8 taskId)
{
    HideBagWindow(10);
    HideBagWindow(6);
    PutWindowTilemap(0);
    PutWindowTilemap(1);
    ScheduleBgCopyTilemapToVram(0);
    bag_menu_print_cursor_(gTasks[taskId].data[0], 1);
    Task_RedrawArrowsAndReturnToBagMenuSelect(taskId);
}

static void Task_ItemMenuAction_BattleUse(u8 taskId)
{
    if (ItemId_GetBattleFunc(gSpecialVar_ItemId) != NULL)
    {
        HideBagWindow(10);
        HideBagWindow(6);
        PutWindowTilemap(0);
        PutWindowTilemap(1);
        CopyWindowToVram(0, COPYWIN_MAP);
        ItemId_GetBattleFunc(gSpecialVar_ItemId)(taskId);
    }
}

static void Task_ItemContext_FieldGive(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 itemId = BagGetItemIdByPocketPosition(gBagMenuState.pocket + 1, data[1]);
    if (!IsWritingMailAllowed(itemId))
    {
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_CantWriteMailHere, Task_WaitAButtonAndCloseContextMenu);
    }
    else if (itemId == ITEM_TM_CASE)
    {
        ItemMenu_SetExitCallback(GoToTMCase_Give);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else if (itemId == ITEM_BERRY_POUCH)
    {
        ItemMenu_SetExitCallback(GoToBerryPouch_Give);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else if (gBagMenuState.pocket != POCKET_KEY_ITEMS - 1 && ItemId_GetImportance(itemId) == 0)
    {
        Bag_BeginCloseWin0Animation();
        gTasks[taskId].func = ItemMenu_StartFadeToExitCallback;
    }
    else
    {
        Task_PrintItemCantBeHeld(taskId);
    }
}

static void GoToTMCase_Give(void)
{
    InitTMCase(TMCASE_GIVE_PARTY, ReturnToBagMenuFromSubmenu_Give, FALSE);
}

static void GoToBerryPouch_Give(void)
{
    InitBerryPouch(BERRYPOUCH_FROMPARTYGIVE, ReturnToBagMenuFromSubmenu_Give, FALSE);
}

static void ReturnToBagMenuFromSubmenu_Give(void)
{
    CB2_SelectBagItemToGive();
}

static void Task_ItemContext_PcBoxGive(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 itemId = BagGetItemIdByPocketPosition(gBagMenuState.pocket + 1, data[1]);
    if (ItemIsMail(itemId) == TRUE)
    {
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_CantWriteMailHere, Task_WaitAButtonAndCloseContextMenu);
    }
    else if (itemId == ITEM_TM_CASE)
    {
        ItemMenu_SetExitCallback(GoToTMCase_PCBox);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else if (itemId == ITEM_BERRY_POUCH)
    {
        ItemMenu_SetExitCallback(GoToBerryPouch_PCBox);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else if (gBagMenuState.pocket != POCKET_KEY_ITEMS - 1 && ItemId_GetImportance(itemId) == 0)
    {
        Bag_BeginCloseWin0Animation();
        gTasks[taskId].func = ItemMenu_StartFadeToExitCallback;
    }
    else
    {
        Task_PrintItemCantBeHeld(taskId);
    }
}

static void GoToTMCase_PCBox(void)
{
    InitTMCase(TMCASE_GIVE_PC, ReturnToBagMenuFromSubmenu_PCBox, FALSE);
}

static void GoToBerryPouch_PCBox(void)
{
    InitBerryPouch(BERRYPOUCH_FROMPOKEMONSTORAGEPC, ReturnToBagMenuFromSubmenu_PCBox, FALSE);
}

static void ReturnToBagMenuFromSubmenu_PCBox(void)
{
    GoToBagMenu(ITEMMENULOCATION_PCBOX, OPEN_BAG_LAST, CB2_ReturnToPokeStorage);
}

static void Task_ItemContext_Sell(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (gSpecialVar_ItemId == ITEM_TM_CASE)
    {
        ItemMenu_SetExitCallback(GoToTMCase_Sell);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else if (gSpecialVar_ItemId == ITEM_BERRY_POUCH)
    {
        ItemMenu_SetExitCallback(GoToBerryPouch_Sell);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else if (ItemId_GetPrice(gSpecialVar_ItemId) == 0)
    {
        CopyItemName(gSpecialVar_ItemId, gStringVar1);
        StringExpandPlaceholders(gStringVar4, gText_OhNoICantBuyThat);
        DisplayItemMessageInBag(taskId, GetDialogBoxFontId(), gStringVar4, Task_ReturnToBagFromContextMenu);
    }
    else
    {
        data[8] = 1;
        if (data[2] == 1)
        {
            BagPrintMoneyAmount();
            Task_PrintSaleConfirmationText(taskId);
        }
        else
        {
            if (data[2] > 99)
                data[2] = 99;
            CopyItemName(gSpecialVar_ItemId, gStringVar1);
            StringExpandPlaceholders(gStringVar4, gText_HowManyWouldYouLikeToSell);
            DisplayItemMessageInBag(taskId, GetDialogBoxFontId(), gStringVar4, Task_InitSaleQuantitySelectInterface);
        }
    }
}

static void GoToTMCase_Sell(void)
{
    InitTMCase(TMCASE_SELL, ReturnToBagMenuFromSubmenu_Sell, FALSE);
}

static void GoToBerryPouch_Sell(void)
{
    InitBerryPouch(BERRYPOUCH_FROMMARTSELL, ReturnToBagMenuFromSubmenu_Sell, FALSE);
}

static void ReturnToBagMenuFromSubmenu_Sell(void)
{
    GoToBagMenu(ITEMMENULOCATION_SHOP, OPEN_BAG_LAST, CB2_ReturnToField);
}

static void Task_PrintSaleConfirmationText(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    ConvertIntToDecimalStringN(gStringVar3, ItemId_GetPrice(BagGetItemIdByPocketPosition(gBagMenuState.pocket + 1, data[1])) / 2 * data[8], STR_CONV_MODE_LEFT_ALIGN, 6);
    StringExpandPlaceholders(gStringVar4, gText_ICanPayThisMuch_WouldThatBeOkay);
    DisplayItemMessageInBag(taskId, GetDialogBoxFontId(), gStringVar4, Task_ShowSellYesNoMenu);
}

static void Task_ShowSellYesNoMenu(u8 taskId)
{
    BagCreateYesNoMenuTopRight(taskId, &sYesNoMenu_Sell);
}

static void Task_SellItem_No(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    HideBagWindow(2);
    CloseBagWindow(5);
    PutWindowTilemap(2);
    PutWindowTilemap(0);
    PutWindowTilemap(1);
    ScheduleBgCopyTilemapToVram(0);
    bag_menu_print_cursor_(data[0], 1);
    Task_RedrawArrowsAndReturnToBagMenuSelect(taskId);
}

static void Task_InitSaleQuantitySelectInterface(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u8 r4 = ShowBagWindow(0, 1);
    ConvertIntToDecimalStringN(gStringVar1, 1, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
    BagPrintTextOnWindow(r4, FONT_SMALL, gStringVar4, 4, 10, 1, 0, 0xFF, 1);
    UpdateSalePriceDisplay(ItemId_GetPrice(BagGetItemIdByPocketPosition(gBagMenuState.pocket + 1, data[1])) / 2 * data[8]);
    BagPrintMoneyAmount();
    CreatePocketScrollArrowPair_SellQuantity();
    gTasks[taskId].func = Task_SelectQuantityToSell;
}

static void UpdateSalePriceDisplay(s32 amount)
{
    PrintMoneyAmount(GetBagWindow(0), 56, 10, amount, 0);
}

static void Task_SelectQuantityToSell(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (AdjustQuantityAccordingToDPadInput(&data[8], data[2]) == TRUE)
    {
        UpdateQuantityToTossOrDeposit(data[8], 2);
        UpdateSalePriceDisplay(ItemId_GetPrice(BagGetItemIdByPocketPosition(gBagMenuState.pocket + 1, data[1])) / 2 * data[8]);
    }
    else if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        HideBagWindow(0);
        PutWindowTilemap(0);
        ScheduleBgCopyTilemapToVram(0);
        BagDestroyPocketScrollArrowPair();
        Task_PrintSaleConfirmationText(taskId);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        HideBagWindow(0);
        HideBagWindow(2);
        CloseBagWindow(5);
        PutWindowTilemap(2);
        PutWindowTilemap(0);
        PutWindowTilemap(1);
        ScheduleBgCopyTilemapToVram(0);
        BagDestroyPocketScrollArrowPair();
        bag_menu_print_cursor_(data[0], 1);
        Task_RedrawArrowsAndReturnToBagMenuSelect(taskId);
    }
}

static void Task_SellItem_Yes(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    PutWindowTilemap(0);
    ScheduleBgCopyTilemapToVram(0);
    CopyItemName(gSpecialVar_ItemId, gStringVar1);
    ConvertIntToDecimalStringN(gStringVar3, ItemId_GetPrice(BagGetItemIdByPocketPosition(gBagMenuState.pocket + 1, data[1])) / 2 * data[8], STR_CONV_MODE_LEFT_ALIGN, 6);
    StringExpandPlaceholders(gStringVar4, gText_TurnedOverItemsWorthYen);
    DisplayItemMessageInBag(taskId, FONT_NORMAL, gStringVar4, Task_FinalizeSaleToShop);
}

static void Task_FinalizeSaleToShop(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    PlaySE(SE_SHOP);
    RemoveBagItem(gSpecialVar_ItemId, data[8]);
    AddMoney(&gSaveBlock1Ptr->money, ItemId_GetPrice(gSpecialVar_ItemId) / 2 * data[8]);
    RecordItemTransaction(gSpecialVar_ItemId, data[8], QL_EVENT_SOLD_ITEM - QL_EVENT_USED_POKEMART);
    DestroyListMenuTask(data[0], &gBagMenuState.cursorPos[gBagMenuState.pocket], &gBagMenuState.itemsAbove[gBagMenuState.pocket]);
    Pocket_CalculateNItemsAndMaxShowed(gBagMenuState.pocket);
    PocketCalculateInitialCursorPosAndItemsAbove(gBagMenuState.pocket);
    sBagMenuDisplay->inhibitItemDescriptionPrint = TRUE;
    Bag_BuildListMenuTemplate(gBagMenuState.pocket);
    data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gBagMenuState.cursorPos[gBagMenuState.pocket], gBagMenuState.itemsAbove[gBagMenuState.pocket]);
    bag_menu_print_cursor_(data[0], 2);
    BagDrawTextBoxOnWindow(GetBagWindow(2));
    PrintMoneyAmountInMoneyBox(GetBagWindow(2), GetMoney(&gSaveBlock1Ptr->money), 0);
    gTasks[taskId].func = Task_WaitPressAB_AfterSell;
}

static void Task_WaitPressAB_AfterSell(u8 taskId)
{
    if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        HideBagWindow(2);
        PutWindowTilemap(2);
        sBagMenuDisplay->inhibitItemDescriptionPrint = FALSE;
        Task_ReturnToBagFromContextMenu(taskId);
    }
}

static void Task_ItemContext_Deposit(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    data[8] = 1;
    if (data[2] == 1)
    {
        Task_TryDoItemDeposit(taskId);
    }
    else
    {
        InitQuantityToTossOrDeposit(data[1], gText_DepositHowManyStrVars1);
        gTasks[taskId].func = Task_SelectQuantityToDeposit;
    }
}

static void Task_SelectQuantityToDeposit(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (AdjustQuantityAccordingToDPadInput(&data[8], data[2]) == TRUE)
    {
        UpdateQuantityToTossOrDeposit(data[8], 3);
    }
    else if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        ClearWindowTilemap(GetBagWindow(6));
        HideBagWindow(6);
        HideBagWindow(0);
        ScheduleBgCopyTilemapToVram(0);
        BagDestroyPocketScrollArrowPair();
        Task_TryDoItemDeposit(taskId);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        HideBagWindow(6);
        HideBagWindow(0);
        PutWindowTilemap(1);
        ScheduleBgCopyTilemapToVram(0);
        bag_menu_print_cursor_(data[0], 1);
        BagDestroyPocketScrollArrowPair();
        Task_RedrawArrowsAndReturnToBagMenuSelect(taskId);
    }
}

static void Task_TryDoItemDeposit(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (AddPCItem(gSpecialVar_ItemId, data[8]) == TRUE)
    {
        ItemUse_SetQuestLogEvent(QL_EVENT_DEPOSITED_ITEM_PC, 0, gSpecialVar_ItemId, 0xFFFF);
        CopyItemName(gSpecialVar_ItemId, gStringVar1);
        ConvertIntToDecimalStringN(gStringVar2, data[8], STR_CONV_MODE_LEFT_ALIGN, 3);
        StringExpandPlaceholders(gStringVar4, gText_DepositedStrVar2StrVar1s);
        BagPrintTextOnWindow(ShowBagWindow(6, 3), FONT_NORMAL, gStringVar4, 0, 2, 1, 0, 0, 1);
        gTasks[taskId].func = Task_WaitAB_RedrawAndReturnToBag;
    }
    else
    {
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_NoRoomToStoreItems, Task_WaitAButtonAndCloseContextMenu);
    }
}

bool8 UseRegisteredKeyItemOnField(void)
{
    u8 taskId;
    if (InUnionRoom() == TRUE)
        return FALSE;
    DismissMapNamePopup();
    ChangeBgY(0, 0, 0);
    if (gSaveBlock1Ptr->registeredItem != ITEM_NONE)
    {
        if (CheckBagHasItem(gSaveBlock1Ptr->registeredItem, 1) == TRUE)
        {
            LockPlayerFieldControls();
            FreezeObjectEvents();
            HandleEnforcedLookDirectionOnPlayerStopMoving();
            StopPlayerAvatar();
            gSpecialVar_ItemId = gSaveBlock1Ptr->registeredItem;
            taskId = CreateTask(ItemId_GetFieldFunc(gSaveBlock1Ptr->registeredItem), 8);
            gTasks[taskId].data[3] = 1;
            return TRUE;
        }
        gSaveBlock1Ptr->registeredItem = ITEM_NONE;
    }
    ScriptContext_SetupScript(EventScript_BagItemCanBeRegistered);
    return TRUE;
}

static bool8 BagIsTutorial(void)
{
    if (
        gBagMenuState.location == ITEMMENULOCATION_OLD_MAN 
     || gBagMenuState.location == ITEMMENULOCATION_TTVSCR_CATCHING 
     || gBagMenuState.location == ITEMMENULOCATION_TTVSCR_STATUS 
     || gBagMenuState.location == ITEMMENULOCATION_TTVSCR_REGISTER 
     || gBagMenuState.location == ITEMMENULOCATION_TTVSCR_TMS
    )
        return TRUE;
    return FALSE;
}

static void BackUpPlayerBag(void)
{
    u32 i;
    sBackupPlayerBag = AllocZeroed(sizeof(struct BagSlots));
    memcpy(sBackupPlayerBag->bagPocket_Items, gSaveBlock1Ptr->bagPocket_Items, BAG_ITEMS_COUNT * sizeof(struct ItemSlot));
    memcpy(sBackupPlayerBag->bagPocket_KeyItems, gSaveBlock1Ptr->bagPocket_KeyItems, BAG_KEYITEMS_COUNT * sizeof(struct ItemSlot));
    memcpy(sBackupPlayerBag->bagPocket_PokeBalls, gSaveBlock1Ptr->bagPocket_PokeBalls, BAG_POKEBALLS_COUNT * sizeof(struct ItemSlot));
    sBackupPlayerBag->registeredItem = gSaveBlock1Ptr->registeredItem;
    sBackupPlayerBag->pocket = gBagMenuState.pocket;
    for (i = 0; i < NUM_BAG_POCKETS_NO_CASES; i++)
    {
        sBackupPlayerBag->itemsAbove[i] = gBagMenuState.itemsAbove[i];
        sBackupPlayerBag->cursorPos[i] = gBagMenuState.cursorPos[i];
    }
    ClearItemSlots(gSaveBlock1Ptr->bagPocket_Items, BAG_ITEMS_COUNT);
    ClearItemSlots(gSaveBlock1Ptr->bagPocket_KeyItems, BAG_KEYITEMS_COUNT);
    ClearItemSlots(gSaveBlock1Ptr->bagPocket_PokeBalls, BAG_POKEBALLS_COUNT);
    gSaveBlock1Ptr->registeredItem = ITEM_NONE;
    ResetBagCursorPositions();
}

static void RestorePlayerBag(void)
{
    u32 i;
    memcpy(gSaveBlock1Ptr->bagPocket_Items, sBackupPlayerBag->bagPocket_Items, BAG_ITEMS_COUNT * sizeof(struct ItemSlot));
    memcpy(gSaveBlock1Ptr->bagPocket_KeyItems, sBackupPlayerBag->bagPocket_KeyItems, BAG_KEYITEMS_COUNT * sizeof(struct ItemSlot));
    memcpy(gSaveBlock1Ptr->bagPocket_PokeBalls, sBackupPlayerBag->bagPocket_PokeBalls, BAG_POKEBALLS_COUNT * sizeof(struct ItemSlot));
    gSaveBlock1Ptr->registeredItem = sBackupPlayerBag->registeredItem;
    gBagMenuState.pocket = sBackupPlayerBag->pocket;
    for (i = 0; i < NUM_BAG_POCKETS_NO_CASES; i++)
    {
        gBagMenuState.itemsAbove[i] = sBackupPlayerBag->itemsAbove[i];
        gBagMenuState.cursorPos[i] = sBackupPlayerBag->cursorPos[i];
    }
    Free(sBackupPlayerBag);
}

void InitOldManBag(void)
{
    BackUpPlayerBag();
    AddBagItem(ITEM_POTION, 1);
    AddBagItem(ITEM_POKE_BALL, 1);
    GoToBagMenu(ITEMMENULOCATION_OLD_MAN, OPEN_BAG_ITEMS, SetCB2ToReshowScreenAfterMenu2);
}

static void Task_Bag_OldManTutorial(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!gPaletteFade.active)
    {
        switch (data[8])
        {
        case 102:
        case 204:
            PlaySE(SE_BAG_POCKET);
            SwitchPockets(taskId, 1, FALSE);
            break;
        case 306:
            PlaySE(SE_SELECT);
            bag_menu_print_cursor_(data[0], 2);
            Bag_FillMessageBoxWithPalette(1);
            gSpecialVar_ItemId = ITEM_POKE_BALL;
            OpenContextMenu(taskId);
            break;
        case 408:
            PlaySE(SE_SELECT);
            HideBagWindow(10);
            HideBagWindow(6);
            PutWindowTilemap(0);
            PutWindowTilemap(1);
            CopyWindowToVram(0, COPYWIN_MAP);
            DestroyListMenuTask(data[0], NULL, NULL);
            RestorePlayerBag();
            Bag_BeginCloseWin0Animation();
            gTasks[taskId].func = Task_Pokedude_FadeFromBag;
            return;
        }
        data[8]++;
    }
}

static void Task_Pokedude_FadeFromBag(u8 taskId)
{
    BeginNormalPaletteFade(PALETTES_ALL, -2, 0, 16, RGB_BLACK);
    gTasks[taskId].func = Task_Pokedude_WaitFadeAndExitBag;
}

static void Task_Pokedude_WaitFadeAndExitBag(u8 taskId)
{
    if (!gPaletteFade.active && FuncIsActiveTask(Task_AnimateWin0v) != TRUE)
    {
        if (sBagMenuDisplay->exitCB != NULL)
            SetMainCallback2(sBagMenuDisplay->exitCB);
        else
            SetMainCallback2(gBagMenuState.bagCallback);
        BagDestroyPocketScrollArrowPair();
        DestroyBagMenuResources();
        DestroyTask(taskId);
    }
}

void InitPokedudeBag(u8 a0)
{
    MainCallback cb2;
    u8 location;
    BackUpPlayerBag();
    AddBagItem(ITEM_POTION, 1);
    AddBagItem(ITEM_ANTIDOTE, 1);
    AddBagItem(ITEM_TEACHY_TV, 1);
    AddBagItem(ITEM_TM_CASE, 1);
    AddBagItem(ITEM_POKE_BALL, 5);
    AddBagItem(ITEM_GREAT_BALL, 1);
    AddBagItem(ITEM_NEST_BALL, 1);
    switch (a0)
    {
    default:
        cb2 = CB2_ReturnToTeachyTV;
        location = a0;
        break;
    case 7:
        cb2 = SetCB2ToReshowScreenAfterMenu2;
        location = ITEMMENULOCATION_TTVSCR_STATUS;
        break;
    case 8:
        cb2 = SetCB2ToReshowScreenAfterMenu2;
        location = ITEMMENULOCATION_TTVSCR_CATCHING;
        break;
    }
    GoToBagMenu(location, OPEN_BAG_ITEMS, cb2);
}

static bool8 Task_BButtonInterruptTeachyTv(u8 taskId)
{
    if (JOY_NEW(B_BUTTON))
    {
        RestorePlayerBag();
        SetTeachyTvControllerModeToResume();
        sBagMenuDisplay->exitCB = CB2_ReturnToTeachyTV;
        gTasks[taskId].func = Task_Pokedude_FadeFromBag;
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

static void Task_Bag_TeachyTvRegister(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!gPaletteFade.active && Task_BButtonInterruptTeachyTv(taskId) != TRUE)
    {
        switch (data[8])
        {
        case 102:
            PlaySE(SE_BAG_POCKET);
            SwitchPockets(taskId, 1, FALSE);
            break;
        case 204:
            PlaySE(SE_SELECT);
            bag_menu_print_cursor_(data[0], 2);
            Bag_FillMessageBoxWithPalette(1);
            gSpecialVar_ItemId = ITEM_TEACHY_TV;
            OpenContextMenu(taskId);
            break;
        case 306:
            PlaySE(SE_SELECT);
            Menu_MoveCursorNoWrapAround(1);
            break;
        case 408:
            PlaySE(SE_SELECT);
            gSaveBlock1Ptr->registeredItem = gSpecialVar_ItemId;
            HideBagWindow(10);
            HideBagWindow(6);
            PutWindowTilemap(0);
            PutWindowTilemap(1);
            DestroyListMenuTask(data[0], &gBagMenuState.cursorPos[gBagMenuState.pocket], &gBagMenuState.itemsAbove[gBagMenuState.pocket]);
            Bag_BuildListMenuTemplate(gBagMenuState.pocket);
            data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gBagMenuState.cursorPos[gBagMenuState.pocket], gBagMenuState.itemsAbove[gBagMenuState.pocket]);
            Bag_FillMessageBoxWithPalette(0);
            bag_menu_print_cursor_(data[0], 1);
            CopyWindowToVram(0, COPYWIN_MAP);
            break;
        case 510:
        case 612:
            gMain.newKeys = 0;
            gMain.newAndRepeatedKeys = DPAD_DOWN;
            ListMenu_ProcessInput(data[0]);
            break;
        case 714:
            PlaySE(SE_SELECT);
            DestroyListMenuTask(data[0], NULL, NULL);
            RestorePlayerBag();
            Bag_BeginCloseWin0Animation();
            gTasks[taskId].func = Task_Pokedude_FadeFromBag;
            return;
        }
        data[8]++;
    }
}

static void Task_Bag_TeachyTvCatching(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!gPaletteFade.active)
    {
        if (Task_BButtonInterruptTeachyTv(taskId) == TRUE)
        {
            FreeRestoreBattleData();
            LoadPlayerParty();
            return;
        }
        switch (data[8])
        {
        case 102:
        case 204:
            PlaySE(SE_BAG_POCKET);
            SwitchPockets(taskId, 1, FALSE);
            break;
        case 306:
        case 408:
            gMain.newKeys = 0;
            gMain.newAndRepeatedKeys = DPAD_DOWN;
            ListMenu_ProcessInput(data[0]);
            break;
        case 510:
        case 612:
            gMain.newKeys = 0;
            gMain.newAndRepeatedKeys = DPAD_UP;
            ListMenu_ProcessInput(data[0]);
            break;
        case 714:
            PlaySE(SE_SELECT);
            bag_menu_print_cursor_(data[0], 2);
            Bag_FillMessageBoxWithPalette(1);
            gSpecialVar_ItemId = ITEM_POKE_BALL;
            OpenContextMenu(taskId);
            break;
        case 816:
            PlaySE(SE_SELECT);
            HideBagWindow(10);
            HideBagWindow(6);
            PutWindowTilemap(0);
            PutWindowTilemap(1);
            CopyWindowToVram(0, COPYWIN_MAP);
            DestroyListMenuTask(data[0], NULL, NULL);
            RestorePlayerBag();
            Bag_BeginCloseWin0Animation();
            gTasks[taskId].func = Task_Pokedude_FadeFromBag;
            return;
        }
        data[8]++;
    }
}

static void Task_Bag_TeachyTvStatus(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!gPaletteFade.active)
    {
        if (Task_BButtonInterruptTeachyTv(taskId) == TRUE)
        {
            FreeRestoreBattleData();
            LoadPlayerParty();
            return;
        }
        switch (data[8])
        {
        case 102:
            gMain.newKeys = 0;
            gMain.newAndRepeatedKeys = DPAD_DOWN;
            ListMenu_ProcessInput(data[0]);
            break;
        case 204:
            PlaySE(SE_SELECT);
            bag_menu_print_cursor_(data[0], 2);
            Bag_FillMessageBoxWithPalette(1);
            gSpecialVar_ItemId = ITEM_ANTIDOTE;
            OpenContextMenu(taskId);
            break;
        case 306:
            PlaySE(SE_SELECT);
            HideBagWindow(10);
            HideBagWindow(6);
            PutWindowTilemap(0);
            PutWindowTilemap(1);
            CopyWindowToVram(0, COPYWIN_MAP);
            DestroyListMenuTask(data[0], NULL, NULL);
            RestorePlayerBag();
            gItemUseCB = ItemUseCB_MedicineStep;
            ItemMenu_SetExitCallback(Pokedude_ChooseMonForInBattleItem);
            gTasks[taskId].func = Task_Pokedude_FadeFromBag;
            return;
        }
        data[8]++;
    }
}

static void Task_Bag_TeachyTvTMs(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!gPaletteFade.active && Task_BButtonInterruptTeachyTv(taskId) != TRUE)
    {
        switch (data[8])
        {
        case 102:
            PlaySE(SE_BAG_POCKET);
            SwitchPockets(taskId, 1, 0);
            break;
        case 204:
            gMain.newKeys = 0;
            gMain.newAndRepeatedKeys = DPAD_DOWN;
            ListMenu_ProcessInput(data[0]);
            break;
        case 306:
            PlaySE(SE_SELECT);
            bag_menu_print_cursor_(data[0], 2);
            Bag_FillMessageBoxWithPalette(1);
            gSpecialVar_ItemId = ITEM_TM_CASE;
            OpenContextMenu(taskId);
            break;
        case 408:
            PlaySE(SE_SELECT);
            HideBagWindow(10);
            HideBagWindow(6);
            PutWindowTilemap(0);
            PutWindowTilemap(1);
            CopyWindowToVram(0, COPYWIN_MAP);
            DestroyListMenuTask(data[0], NULL, NULL);
            RestorePlayerBag();
            sBagMenuDisplay->exitCB = Pokedude_InitTMCase;
            gTasks[taskId].func = Task_Pokedude_FadeFromBag;
            return;
        }
        data[8]++;
    }
}
