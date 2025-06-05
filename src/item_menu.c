#include "global.h"
#include "gflib.h"
#include "battle.h"
#include "battle_controllers.h"
#include "battle_main.h"
#include "berry_pouch.h"
#include "decompress.h"
#include "event_scripts.h"
#include "event_object_movement.h"
#include "field_player_avatar.h"
#include "graphics.h"
#include "help_system.h"
#include "item.h"
#include "item_icon.h"
#include "item_menu.h"
#include "item_menu_icons.h"
#include "item_use.h"
#include "link.h"
#include "list_menu.h"
#include "load_save.h"
#include "mail.h"
#include "map_name_popup.h"
#include "menu.h"
#include "money.h"
#include "overworld.h"
#include "party_menu.h"
#include "pokemon_storage_system.h"
#include "scanline_effect.h"
#include "script.h"
#include "shop.h"
#include "strings.h"
#include "teachy_tv.h"
#include "text_window.h"
#include "tm_case.h"
#include "constants/items.h"
#include "constants/quest_log.h"
#include "constants/songs.h"

#define FREE_IF_SET(ptr) ({ if (ptr) Free(ptr); })

// The buffer for the bag item list needs to be large enough to hold the maximum
// number of item slots that could fit in a single pocket, + 1 for Cancel.
// This constant picks the max of the existing pocket sizes.
// By default, the largest pocket is BAG_TMHM_COUNT at 64.
#define MAX_POCKET_ITEMS  ((max(BAG_TMHM_COUNT,              \
                            max(BAG_BERRIES_COUNT,           \
                            max(BAG_ITEMS_COUNT,             \
                            max(BAG_KEYITEMS_COUNT,          \
                                BAG_POKEBALLS_COUNT))))) + 1)

// Up to 6 item slots can be visible at a time
#define MAX_ITEMS_SHOWN 6

enum {
    SWITCH_POCKET_NONE,
    SWITCH_POCKET_LEFT,
    SWITCH_POCKET_RIGHT
};

enum PocketSwitchMode
{
    SWITCHMODE_NORMAL,
    SWITCHMODE_PC,
    SWITCHMODE_OLDMAN
};

struct BagBackup
{
    struct ItemSlot bagPocket_Items[BAG_ITEMS_COUNT];
    struct ItemSlot bagPocket_KeyItems[BAG_KEYITEMS_COUNT];
    struct ItemSlot bagPocket_PokeBalls[BAG_POKEBALLS_COUNT];
    u16 cursorPosition[NUM_BAG_POCKETS_NO_CASES];
    u16 scrollPosition[NUM_BAG_POCKETS_NO_CASES];
    u16 registeredItem;
    u16 pocket;
};

static EWRAM_DATA struct BagMenu *gBagMenu = NULL;
EWRAM_DATA struct BagPosition gBagPosition = {0};
static EWRAM_DATA struct ListBuffer1 *sListBuffer1 = 0;
static EWRAM_DATA struct ListBuffer2 *sListBuffer2 = 0;
static EWRAM_DATA u8 sContextMenuItemsBuffer[4] = {};
static EWRAM_DATA const u8 *sContextMenuItemsPtr = NULL;
static EWRAM_DATA u8 sContextMenuNumItems = 0;
static EWRAM_DATA struct BagBackup *sBackupPlayerBag = NULL;
EWRAM_DATA u16 gSpecialVar_ItemId = ITEM_NONE;

static void CB2_Bag(void);
static bool8 SetupBagMenu(void);
static void NullBagMenuBufferPtrs(void);
static void BagMenu_InitBGs(void);
static bool8 LoadBagMenu_Graphics(void);
static u8 CreateBagInputHandlerTask(u8 location);
static void AllocateBagItemListBuffers(void);
static void LoadBagItemListBuffers(u8 pocket);
static void BagListMenuGetItemNameColored(u8 *dest, u16 itemId);
static void BagMenu_MoveCursorCallback(s32 itemIndex, bool8 onInit, struct ListMenu *list);
static void BagMenu_ItemPrintCallback(u8 windowId, u32 itemId, u8 y);
static void BagMenu_PrintCursorAtPos(u8 y, u8 colorIdx);
static void PrintBagPocketName(void);
static void PrintItemDescription(s32 itemIndex);
static void CreatePocketScrollArrowPair(void);
static void CreatePocketSwitchArrowPair(void);
static void DestroyPocketSwitchArrowPair(void);
static void InitPocketListPositions(void);
static void InitPocketScrollPositions(void);
static void DestroyBagMenuResources(void);
static void Task_CloseBagMenu(u8 taskId);
static u8 AddItemMessageWindow(u8);
static void Task_AnimateWin0v(u8 taskId);
static void ShowBagOrBeginWin0OpenTask(void);
static void UpdatePocketItemLists(void);
static void Task_BagMenu_HandleInput(u8 taskId);
static void Task_ItemContextMenuByLocation(u8 taskId);
static void Bag_FillMessageBoxWithPalette(u32 a0);
static u8 ProcessPocketSwitchInput(u8 taskId, u8 pocketId);
static void SwitchBagPocket(u8 taskId, s16 direction, bool16 a2);
static void Task_AnimateSwitchPockets(u8 taskId);
static void StartItemSwap(u8 taskId);
static void Task_HandleSwappingItemsInput(u8 taskId);
static void ExecuteMoveItemInPocket(u8 taskId, u32 itemIndex);
static void AbortMovingItemInPocket(u8 taskId, u32 itemIndex);
static void DrawItemListRow(u8 row);
static void Task_ItemContext_Normal(u8 taskId);
static void Task_FieldItemContextMenuHandleInput(u8 taskId);
static void Task_ItemMenuAction_Use(u8 taskId);
static void Task_ItemMenuAction_Toss(u8 taskId);
static void Task_ConfirmTossItems(u8 taskId);
static void Task_TossItem_No(u8 taskId);
static void Task_SelectQuantityToToss(u8 taskId);
static void Task_TossItem_Yes(u8 taskId);
static void Task_WaitAB_RedrawAndReturnToBag(u8 taskId);
static void ItemMenu_Register(u8 taskId);
static void Task_ItemMenuAction_Give(u8 taskId);
static void Task_PrintThereIsNoPokemon(u8 taskId);
static void ItemMenu_Cancel(u8 taskId);
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
static bool32 IsTutorialBag(void);
static void Task_Bag_OldManTutorial(u8 taskId);
static void Task_Pokedude_FadeFromBag(u8 taskId);
static void Task_Pokedude_WaitFadeAndExitBag(u8 taskId);
static void Task_Bag_TeachyTvRegister(u8 taskId);
static void Task_Bag_TeachyTvCatching(u8 taskId);
static void Task_Bag_TeachyTvStatus(u8 taskId);
static void Task_Bag_TeachyTvTMs(u8 taskId);
static void RemoveContextWindow(void);

enum {
    ACTION_USE,
    ACTION_TOSS,
    ACTION_REGISTER,
    ACTION_GIVE,
    ACTION_CANCEL,
    ACTION_BATTLE_USE,
    ACTION_CHECK,
    ACTION_OPEN,
    ACTION_OPEN_BERRIES,
    ACTION_WALK,
    ACTION_DESELECT,
    ACTION_DUMMY,
};

// Item list ID for toSwapPos to indicate an item is not currently being swapped
#define NOT_SWAPPING 0xFF

struct ListBuffer1 {
    struct ListMenuItem subBuffers[MAX_POCKET_ITEMS];
};

struct ListBuffer2 {
    u8 name[MAX_POCKET_ITEMS][max(ITEM_NAME_LENGTH, MOVE_NAME_LENGTH) + 15];
};

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

static const u8 *const gPocketNamesStringsTable[] = {
    [ITEMS_POCKET] = COMPOUND_STRING("ITEMS"),
    [KEYITEMS_POCKET] = COMPOUND_STRING("KEY ITEMS"),
    [BALLS_POCKET] = COMPOUND_STRING("POKé BALLS"),
};

#define LIST_TILES_WIDTH  18
#define LIST_TILES_HEIGHT 12

static const u16 sItemListTilemap[LIST_TILES_WIDTH * LIST_TILES_HEIGHT] = INCBIN_U16("graphics/item_menu/list.bin");

static const struct MenuAction sItemMenuContextActions[] = {
    [ACTION_USE] = {gOtherText_Use, {.void_u8 = Task_ItemMenuAction_Use}},
    [ACTION_TOSS] = {gOtherText_Toss, {.void_u8 = Task_ItemMenuAction_Toss}},
    [ACTION_REGISTER] = {gOtherText_Register, {.void_u8 = ItemMenu_Register}},
    [ACTION_GIVE] = {gOtherText_Give, {.void_u8 = Task_ItemMenuAction_Give}},
    [ACTION_CANCEL] = {gFameCheckerText_Cancel, {.void_u8 = ItemMenu_Cancel}},
    [ACTION_BATTLE_USE] = {gOtherText_Use, {.void_u8 = Task_ItemMenuAction_BattleUse}},
    [ACTION_CHECK] = {gOtherText_Check, {.void_u8 = Task_ItemMenuAction_Use}},
    [ACTION_OPEN] = {gOtherText_Open, {.void_u8 = Task_ItemMenuAction_Use}},
    [ACTION_OPEN_BERRIES] = {gOtherText_Open, {.void_u8 = Task_ItemMenuAction_BattleUse}},
    [ACTION_WALK] = {gOtherText_Walk, {.void_u8 = Task_ItemMenuAction_Use}},
    [ACTION_DESELECT] = {gOtherText_Deselect, {.void_u8 = ItemMenu_Register}},
    [ACTION_DUMMY] = {gString_Dummy, {.void_u8 = NULL}}
};



static const u8 sContextMenuItems_Field[][4] = {
    [ITEMS_POCKET] =
    {
        ACTION_USE,
        ACTION_GIVE,
        ACTION_TOSS,
        ACTION_CANCEL
    },
    [KEYITEMS_POCKET] =
    {
        ACTION_USE,
        ACTION_REGISTER,
        ACTION_CANCEL,
        ACTION_DUMMY
    },
    [BALLS_POCKET] =
    {
        ACTION_GIVE,
        ACTION_TOSS,
        ACTION_CANCEL,
        ACTION_DUMMY
    }
};

static const u8 sContextMenuItems_CheckGiveTossCancel[] = {
    ACTION_CHECK,
    ACTION_GIVE,
    ACTION_TOSS,
    ACTION_CANCEL
};

static const u8 sContextMenuItems_GiveIfNotKeyItemPocket[][2] = {
    [ITEMS_POCKET] =
    {
        ACTION_GIVE,
        ACTION_CANCEL
    },
    [KEYITEMS_POCKET] =
    {
        ACTION_CANCEL,
        ACTION_DUMMY
    },
    [BALLS_POCKET] =
    {
        ACTION_GIVE,
        ACTION_CANCEL
    }
};

static const u8 sContextMenuItems_Open[] = {
    ACTION_OPEN,
    ACTION_CANCEL
};

static const u8 sContextMenuItems_BattleUse[] = {
    ACTION_BATTLE_USE,
    ACTION_CANCEL
};

static const u8 sContextMenuItems_Cancel[] = {
    ACTION_CANCEL,
    ACTION_DUMMY
};

static const TaskFunc sItemContextTaskFuncs[] = {
    [ITEMMENULOCATION_FIELD]  = Task_ItemContext_Normal,
    [ITEMMENULOCATION_PARTY]  = Task_ItemContext_FieldGive,
    [ITEMMENULOCATION_SHOP]   = Task_ItemContext_Sell,
    [ITEMMENULOCATION_ITEMPC] = Task_ItemContext_Deposit,
    [ITEMMENULOCATION_PCBOX]  = Task_ItemContext_PcBoxGive,
    [ITEMMENULOCATION_BATTLE] = Task_ItemContext_Normal,
    [ITEMMENULOCATION_BERRY_TREE_MULCH] = Task_ItemContext_Normal,
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


static const u16 sBagWindowPalF[] = INCBIN_U16("graphics/item_menu/bag_window_pal.gbapal");

static const u8 sTextColors[][3] = {
    {0, 1, 2},
    {0, 2, 3},
    {0, 3, 2},
    {0, 8, 9}
};

static const struct WindowTemplate sDefaultBagWindows[] = {
    {
        .bg = 0,
        .tilemapLeft = 11,
        .tilemapTop = 1,
        .width = 18,
        .height = 12,
        .paletteNum = 15,
        .baseBlock = 0x008a
    }, {
        .bg = 0,
        .tilemapLeft = 5,
        .tilemapTop = 14,
        .width = 25,
        .height = 6,
        .paletteNum = 15,
        .baseBlock = 0x0162
    }, {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 9,
        .height = 2,
        .paletteNum = 15,
        .baseBlock = 0x01f8
    }, DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sDefaultBagWindowsDeposit[] = {
    {
        .bg = 0,
        .tilemapLeft = 11,
        .tilemapTop = 1,
        .width = 18,
        .height = 12,
        .paletteNum = 15,
        .baseBlock = 0x008a
    }, {
        .bg = 0,
        .tilemapLeft = 5,
        .tilemapTop = 14,
        .width = 25,
        .height = 6,
        .paletteNum = 15,
        .baseBlock = 0x0162
    }, {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 8,
        .height = 2,
        .paletteNum = 12,
        .baseBlock = 0x01f8
    }, DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sWindowTemplates[] = {
    [ITEMWIN_0] =
    {
        .bg = 0,
        .tilemapLeft = 24,
        .tilemapTop = 15,
        .width = 5,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x242
    },
    [ITEMWIN_1] =
    {
        .bg = 0,
        .tilemapLeft = 17,
        .tilemapTop = 9,
        .width = 12,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x242
    },
    [ITEMWIN_2] =
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 8,
        .height = 3,
        .paletteNum = 12,
        .baseBlock = 0x272
    },
    [ITEMWIN_YESNO_BOTTOMRIGHT] =
    {
        .bg = 0,
        .tilemapLeft = 23,
        .tilemapTop = 15,
        .width = 6,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x28a
    },
    [ITEMWIN_YESNO_TOPRIGHT] =
    {
        .bg = 0,
        .tilemapLeft = 21,
        .tilemapTop = 9,
        .width = 6,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x28a
    },
    [ITEMWIN_MESSAGE] =
    {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 15,
        .width = 26,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x2a2
    },
    [ITEMWIN_6] =
    {
        .bg = 0,
        .tilemapLeft = 6,
        .tilemapTop = 15,
        .width = 14,
        .height = 4,
        .paletteNum = 12,
        .baseBlock = 0x2a2
    },
    [ITEMWIN_7] =
    {
        .bg = 0,
        .tilemapLeft = 6,
        .tilemapTop = 15,
        .width = 15,
        .height = 4,
        .paletteNum = 12,
        .baseBlock = 0x2da
    },
    [ITEMWIN_8] =
    {
        .bg = 0,
        .tilemapLeft = 6,
        .tilemapTop = 15,
        .width = 16,
        .height = 4,
        .paletteNum = 12,
        .baseBlock = 0x316
    },
    [ITEMWIN_9] =
    {
        .bg = 0,
        .tilemapLeft = 6,
        .tilemapTop = 15,
        .width = 23,
        .height = 4,
        .paletteNum = 12,
        .baseBlock = 0x356
    },
    [ITEMWIN_1x1] =
    {
        .bg = 0,
        .tilemapLeft = 22,
        .tilemapTop = 17,
        .width = 7,
        .height = 2,
        .paletteNum = 15,
        .baseBlock = 0x20a
    },
    [ITEMWIN_1x2] =
    {
        .bg = 0,
        .tilemapLeft = 22,
        .tilemapTop = 15,
        .width = 7,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x20a
    },
    [ITEMWIN_1x3] =
    {
        .bg = 0,
        .tilemapLeft = 22,
        .tilemapTop = 13,
        .width = 7,
        .height = 6,
        .paletteNum = 15,
        .baseBlock = 0x20a
    },
    [ITEMWIN_1x4] =
    {
        .bg = 0,
        .tilemapLeft = 22,
        .tilemapTop = 11,
        .width = 7,
        .height = 8,
        .paletteNum = 15,
        .baseBlock = 0x20a
    }
};

static const struct ListMenuTemplate sItemListMenu =
{
    .items = NULL,
    .moveCursorFunc = BagMenu_MoveCursorCallback,
    .itemPrintFunc = BagMenu_ItemPrintCallback,
    .totalItems = 0,
    .maxShowed = 0,
    .windowId = 0,
    .header_X = 0,
    .item_X = 9,
    .cursor_X = 1,
    .upText_Y = 2,
    .cursorPal = 2,
    .fillValue = 0,
    .cursorShadowPal = 3,
    .lettersSpacing = 0,
    .itemVerticalPadding = 2,
    .scrollMultiple = LIST_NO_MULTIPLE_SCROLL,
    .fontId = FONT_NORMAL,
    .cursorKind = CURSOR_BLACK_ARROW,
};

#define tSwitchDir     data[11]
#define tSwitchCounter data[12]
#define tSwitchState   data[13]

void GoToBagMenu(u8 location, u8 pocket, MainCallback exitCallback)
{
    NullBagMenuBufferPtrs();
    gBagMenu = Alloc(sizeof(*gBagMenu));
    if (gBagMenu == NULL)
        SetMainCallback2(exitCallback);
    else
    {
        if (location != ITEMMENULOCATION_LAST)
            gBagPosition.location = location;
        if (exitCallback != NULL)
            gBagPosition.exitCallback = exitCallback;
        gBagMenu->newScreenCallback = NULL;
        gBagMenu->toSwapPos = NOT_SWAPPING;
        gBagMenu->itemIconSlot = 0;
        gBagMenu->inhibitItemDescriptionPrint = FALSE;
        gBagMenu->pocketScrollArrowsTask = TASK_NONE;
        gBagMenu->pocketSwitchArrowsTask = TASK_NONE;
        if (location == ITEMMENULOCATION_ITEMPC)
            gBagMenu->pocketSwitchMode = SWITCHMODE_PC;
        else if (location == ITEMMENULOCATION_OLD_MAN)
            gBagMenu->pocketSwitchMode = SWITCHMODE_OLDMAN;
        else
            gBagMenu->pocketSwitchMode = SWITCHMODE_NORMAL;
        if (pocket == ITEMS_POCKET || pocket == KEYITEMS_POCKET || pocket == BALLS_POCKET)
            gBagPosition.pocket = pocket;
        gTextFlags.autoScroll = FALSE;
        gSpecialVar_ItemId = ITEM_NONE;
        memset(gBagMenu->windowIds, WINDOW_NONE, sizeof(gBagMenu->windowIds));
        SetMainCallback2(CB2_Bag);
    }
}

void CB2_BagMenuFromStartMenu(void)
{
    GoToBagMenu(ITEMMENULOCATION_FIELD, NUM_BAG_POCKETS_NO_CASES, CB2_ReturnToFieldWithOpenMenu);
}

void CB2_BagMenuFromBattle(void)
{
    GoToBagMenu(ITEMMENULOCATION_BATTLE, NUM_BAG_POCKETS_NO_CASES, CB2_SetUpReshowBattleScreenAfterMenu2);
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

#define tListTaskId        data[0]
#define tListPosition      data[1]
#define tQuantity          data[2]
#define tNeverRead         data[3]
#define tItemCount         data[8]
#define tMsgWindowId       data[10]
#define tPocketSwitchDir   data[11]
#define tPocketSwitchTimer data[12]
#define tPocketSwitchState data[13]

static void CB2_Bag(void)
{
    while (1)
    {
        if (IsActiveOverworldLinkBusy() == TRUE)
            break;
        if (SetupBagMenu() == TRUE)
            break;
        if (MenuHelpers_IsLinkActive() == TRUE)
            break;
    }
}

static bool8 SetupBagMenu(void)
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
            ResetTasks();
        gMain.state++;
        break;
    case 7:
        BagMenu_InitBGs();
        gBagMenu->graphicsLoadState = 0;
        gMain.state++;
        break;
    case 8:
        if (!LoadBagMenu_Graphics())
            break;
        gMain.state++;
        break;
    case 9:
        LoadBagMenuTextWindows();
        gMain.state++;
        break;
    case 10:
        UpdatePocketItemLists();
        InitPocketListPositions();
        InitPocketScrollPositions();
        gMain.state++;
        break;
    case 11:
        AllocateBagItemListBuffers();
        gMain.state++;
        break;
    case 12:
        LoadBagItemListBuffers(gBagPosition.pocket);
        gMain.state++;
        break;
    case 13:
        if (gBagPosition.location != ITEMMENULOCATION_ITEMPC)
            PrintBagPocketName();
        else
            BagDrawDepositItemTextBox();
        gMain.state++;
        break;
    case 14:
        taskId = CreateBagInputHandlerTask(gBagPosition.location);
        gTasks[taskId].data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gBagPosition.scrollPosition[gBagPosition.pocket], gBagPosition.cursorPosition[gBagPosition.pocket]);
        gTasks[taskId].data[3] = 0;
        gTasks[taskId].data[8] = 0;
        gMain.state++;
        break;
    case 15:
        AddBagVisualSprite(gBagPosition.pocket);
        gMain.state++;
        break;
    case 16:
        CreatePocketScrollArrowPair();
        CreatePocketSwitchArrowPair();
        gMain.state++;
        break;
    case 17:
        CreateItemMenuSwapLine();
        gMain.state++;
        break;
    case 18:
        ShowBagOrBeginWin0OpenTask();
        gMain.state++;
        break;
    case 19:
        if (gBagPosition.location == ITEMMENULOCATION_ITEMPC)
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

static void NullBagMenuBufferPtrs(void)
{
    gBagMenu = NULL;
}

static void BagMenu_InitBGs(void)
{
    ResetAllBgsCoordinatesAndBgCntRegs();
    memset(gBagMenu->tilemapBuffer, 0, sizeof(gBagMenu->tilemapBuffer));
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, sBgTemplates, NELEMS(sBgTemplates));
    SetBgTilemapBuffer(1, gBagMenu->tilemapBuffer);
    ScheduleBgCopyTilemapToVram(1);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON);
    ShowBg(0);
    ShowBg(1);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
}

static bool8 LoadBagMenu_Graphics(void)
{
    switch (gBagMenu->graphicsLoadState)
    {
    case 0:
        ResetTempTileDataBuffers();
        DecompressAndCopyTileDataToVram(1, gBagBg_Gfx, 0, 0, 0);
        gBagMenu->graphicsLoadState++;
        break;
    case 1:
        if (FreeTempTileDataBuffersIfPossible() != TRUE)
        {
            if (gBagPosition.location != ITEMMENULOCATION_ITEMPC)
                DecompressDataWithHeaderWram(gBagBg_Tilemap, gBagMenu->tilemapBuffer);
            else
                DecompressDataWithHeaderWram(gBagBg_ItemPC_Tilemap, gBagMenu->tilemapBuffer);
            gBagMenu->graphicsLoadState++;
        }
        break;
    case 2:
        LoadPalette(gBagBgPalette, BG_PLTT_ID(0), 3 * PLTT_SIZE_4BPP);
        if (!IsTutorialBag() && gSaveBlock2Ptr->playerGender != MALE)
            LoadPalette(gBagBgPalette_FemaleOverride, BG_PLTT_ID(0), PLTT_SIZE_4BPP);
        gBagMenu->graphicsLoadState++;
        break;
    case 3:
        if (IsTutorialBag() == TRUE || gSaveBlock2Ptr->playerGender == MALE)
            LoadCompressedSpriteSheet(&gSpriteSheet_BagMale);
        else
            LoadCompressedSpriteSheet(&gSpriteSheet_BagFemale);
        gBagMenu->graphicsLoadState++;
        break;
    case 4:
        LoadSpritePalette(&gSpritePalette_Bag);
        gBagMenu->graphicsLoadState++;
        break;
    case 5:
        LoadCompressedSpriteSheet(&gBagSwapSpriteSheet);
        gBagMenu->graphicsLoadState++;
        break;
    default:
        LoadSpritePalette(&gBagSwapSpritePalette);
        gBagMenu->graphicsLoadState = 0;
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

static void AllocateBagItemListBuffers(void)
{
    sListBuffer1 = Alloc(sizeof(*sListBuffer1));
    sListBuffer2 = Alloc(sizeof(*sListBuffer2));
}

static void LoadBagItemListBuffers(u8 pocketId)
{
    u16 i;
    struct BagPocket *pocket = &gBagPockets[pocketId];
    struct ListMenuItem *subBuffer;

    if (!gBagMenu->hideCloseBagText)
    {
        for (i = 0; i < gBagMenu->numItemStacks[pocketId] - 1; i++)
        {
            BagListMenuGetItemNameColored(sListBuffer2->name[i], pocket->itemSlots[i].itemId);
            subBuffer = sListBuffer1->subBuffers;
            subBuffer[i].name = sListBuffer2->name[i];
            subBuffer[i].id = i;
        }
        StringCopy(sListBuffer2->name[i], sListItemTextColor_RegularItem);
        StringAppend(sListBuffer2->name[i], gFameCheckerText_Cancel);
        subBuffer = sListBuffer1->subBuffers;
        subBuffer[i].name = sListBuffer2->name[i];
        subBuffer[i].id = LIST_CANCEL;
    }
    else
    {
        for (i = 0; i < gBagMenu->numItemStacks[pocketId]; i++)
        {
            BagListMenuGetItemNameColored(sListBuffer2->name[i], pocket->itemSlots[i].itemId);
            subBuffer = sListBuffer1->subBuffers;
            subBuffer[i].name = sListBuffer2->name[i];
            subBuffer[i].id = i;
        }
    }

    gMultiuseListMenuTemplate = sItemListMenu;
    gMultiuseListMenuTemplate.items = sListBuffer1->subBuffers;
    gMultiuseListMenuTemplate.totalItems = gBagMenu->numItemStacks[pocketId];
    gMultiuseListMenuTemplate.maxShowed = gBagMenu->numShownItems[pocketId];
}

static void BagListMenuGetItemNameColored(u8 *dest, u16 itemId)
{
    u8* end;
    if (itemId == ITEM_TM_CASE || itemId == ITEM_BERRY_POUCH)
        StringCopy(dest, sListItemTextColor_TmCase_BerryPouch);
    else
        StringCopy(dest, sListItemTextColor_RegularItem);
    
    end = StringAppend(dest, GetItemName(itemId));
    PrependFontIdToFit(dest, end, FONT_NARROW, 61);
}

static void BagMenu_MoveCursorCallback(s32 itemIndex, bool8 onInit, struct ListMenu *list)
{
    if (onInit != TRUE)
    {
        PlaySE(SE_BAG_CURSOR);
        ShakeBagSprite();
    }
    if (gBagMenu->toSwapPos == NOT_SWAPPING)
    {
        RemoveBagItemIconSprite(gBagMenu->itemIconSlot ^ 1);
        if (itemIndex != LIST_CANCEL)
            AddBagItemIconSprite(BagGetItemIdByPocketPosition(gBagPosition.pocket + 1, itemIndex), gBagMenu->itemIconSlot);
        else
            AddBagItemIconSprite(ITEMS_COUNT, gBagMenu->itemIconSlot);
        gBagMenu->itemIconSlot ^= 1;
        if (!gBagMenu->inhibitItemDescriptionPrint)
            PrintItemDescription(itemIndex);
    }
}

static void BagMenu_ItemPrintCallback(u8 windowId, u32 itemIndex, u8 y)
{
    u16 itemId;
    u16 itemQuantity;


    if (itemIndex == LIST_CANCEL)
        return;

    if (gBagMenu->toSwapPos != NOT_SWAPPING)
    {
        if (gBagMenu->toSwapPos == (u8)itemIndex)
            BagMenu_PrintCursorAtPos(y, 2);
        else
            BagMenu_PrintCursorAtPos(y, 0xFF);
    }

    itemId = BagGetItemIdByPocketPosition(gBagPosition.pocket + 1, itemIndex);
    itemQuantity = BagGetQuantityByPocketPosition(gBagPosition.pocket + 1, itemIndex);

    if (gBagPosition.pocket != KEYITEMS_POCKET && GetItemImportance(itemId) == FALSE)
    {
        ConvertIntToDecimalStringN(gStringVar1, itemQuantity, STR_CONV_MODE_RIGHT_ALIGN, MAX_ITEM_DIGITS);
        StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
        BagPrintTextOnWindow(windowId, FONT_SMALL, gStringVar4, 110, y, 0, 0, TEXT_SKIP_DRAW, 1);
    }
    else if (gSaveBlock1Ptr->registeredItem != ITEM_NONE && gSaveBlock1Ptr->registeredItem == itemId)
    {
        BlitBitmapToWindow(windowId, sBlit_SelectButton, 112, y, 24, 16);
    }
}

static void BagMenu_PrintCursor(u8 listTaskId, u8 colorIndex)
{
    BagMenu_PrintCursorAtPos(ListMenuGetYCoordForPrintingArrowCursor(listTaskId), colorIndex);
}

static void BagMenu_PrintCursorAtPos(u8 y, u8 colorIdx)
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
    BagPrintTextOnWin1CenteredColor0(gPocketNamesStringsTable[gBagPosition.pocket], gBagPosition.pocket);
}

static void PrintItemDescription(s32 itemIndex)
{
    const u8 *str;
    
    if (itemIndex != LIST_CANCEL)
    {
        str = GetItemDescription(BagGetItemIdByPocketPosition(gBagPosition.pocket + 1, itemIndex));
    }
    else
    {
        str = gText_CloseBag;
    }
    FillWindowPixelBuffer(1, PIXEL_FILL(0));
    BagPrintTextOnWindow(1, FONT_NORMAL, str, 0, 3, 2, 0, 0, 0);
}

static void CreatePocketScrollArrowPair(void)
{
    gBagMenu->pocketScrollArrowsTask = AddScrollIndicatorArrowPairParameterized(
        SCROLL_ARROW_UP,
        160,
        8,
        104,
        gBagMenu->numItemStacks[gBagPosition.pocket] - gBagMenu->numShownItems[gBagPosition.pocket] + 1,
        110,
        110,
        &gBagPosition.scrollPosition[gBagPosition.pocket]
    );
}

static void CreatePocketSwitchArrowPair(void)
{
    if (gBagMenu->pocketSwitchMode != SWITCHMODE_PC)
    {
        gBagMenu->pocketSwitchArrowsTask = AddScrollIndicatorArrowPair(&sPocketSwitchArrowPairTemplate, &gBagPosition.pocket);
    }
}

static void CreatePocketScrollArrowPair_SellQuantity(void)
{
    gBagMenu->contextMenuSelectedItem = 1;
    gBagMenu->pocketScrollArrowsTask = AddScrollIndicatorArrowPairParameterized(
        SCROLL_ARROW_UP,
        152,
        72,
        104,
        2,
        110,
        110,
        &gBagMenu->contextMenuSelectedItem
    );
}

static void CreateArrowPair_QuantitySelect(void)
{
    gBagMenu->contextMenuSelectedItem = 1;
    gBagMenu->pocketScrollArrowsTask = AddScrollIndicatorArrowPairParameterized(
        SCROLL_ARROW_UP,
        212,
        120,
        152,
        2,
        110,
        110,
        &gBagMenu->contextMenuSelectedItem
    );
}

static void BagDestroyPocketScrollArrowPair(void)
{
    if (gBagMenu->pocketScrollArrowsTask != TASK_NONE)
    {
        RemoveScrollIndicatorArrowPair(gBagMenu->pocketScrollArrowsTask);
        gBagMenu->pocketScrollArrowsTask = TASK_NONE;
    }
    DestroyPocketSwitchArrowPair();
}

static void DestroyPocketSwitchArrowPair(void)
{
    if (gBagMenu->pocketSwitchArrowsTask != TASK_NONE)
    {
        RemoveScrollIndicatorArrowPair(gBagMenu->pocketSwitchArrowsTask);
        gBagMenu->pocketSwitchArrowsTask = TASK_NONE;
    }
}

void ResetBagScrollPositions(void)
{
    gBagPosition.pocket = ITEMS_POCKET;
    gBagPosition.bagOpen = FALSE;
    memset(gBagPosition.cursorPosition, 0, sizeof(gBagPosition.cursorPosition));
    memset(gBagPosition.scrollPosition, 0, sizeof(gBagPosition.scrollPosition));
}

void UpdatePocketListPosition(u8 pocketId)
{
    SetCursorWithinListBounds(&gBagPosition.scrollPosition[pocketId], &gBagPosition.cursorPosition[pocketId], gBagMenu->numShownItems[pocketId], gBagMenu->numItemStacks[pocketId]);
}

static void InitPocketListPositions(void)
{
    u8 i;
    for (i = 0; i < NUM_BAG_POCKETS_NO_CASES; i++)
        UpdatePocketListPosition(i);
}

static void InitPocketScrollPositions(void)
{
    u8 i;
    for (i = 0; i < NUM_BAG_POCKETS_NO_CASES; i++)
        SetCursorScrollWithinListBounds(&gBagPosition.scrollPosition[i], &gBagPosition.cursorPosition[i], gBagMenu->numShownItems[i], gBagMenu->numItemStacks[i], MAX_ITEMS_SHOWN);
}

static void DestroyBagMenuResources(void)
{
    FREE_IF_SET(gBagMenu);
    FreeAllWindowBuffers();
}

void Task_FadeAndCloseBagMenu(u8 taskId)
{
    BeginNormalPaletteFade(PALETTES_ALL, -2, 0, 16, RGB_BLACK);
    gTasks[taskId].func = Task_CloseBagMenu;
}

static void Task_CloseBagMenu(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!gPaletteFade.active && FuncIsActiveTask(Task_AnimateWin0v) != TRUE)
    {
        DestroyListMenuTask(data[0], &gBagPosition.scrollPosition[gBagPosition.pocket], &gBagPosition.cursorPosition[gBagPosition.pocket]);
        if (gBagMenu->newScreenCallback != NULL)
            SetMainCallback2(gBagMenu->newScreenCallback);
        else
            SetMainCallback2(gBagPosition.exitCallback);
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
    if (gBagPosition.bagOpen == TRUE)
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
        gBagPosition.bagOpen = TRUE;
    }
}

void Bag_BeginCloseWin0Animation(void)
{

    u8 taskId = CreateTask(Task_AnimateWin0v, 0);
    gTasks[taskId].data[0] = -16;
    gTasks[taskId].data[1] =  16;
    gBagPosition.bagOpen = FALSE;
}

void SetBagOpenFalse(void)
{
    gBagPosition.bagOpen = FALSE;
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

void UpdatePocketItemList(u8 pocketId)
{
    u16 i;
    struct BagPocket* pocket = &gBagPockets[pocketId];

    CompactItemsInBagPocket(pocket);

    gBagMenu->numItemStacks[pocketId] = 0;

    for (i = 0; i < pocket->capacity && pocket->itemSlots[i].itemId; i++)
        gBagMenu->numItemStacks[pocketId]++;

    if (!gBagMenu->hideCloseBagText)
        gBagMenu->numItemStacks[pocketId]++;

    if (gBagMenu->numItemStacks[pocketId] > MAX_ITEMS_SHOWN)
        gBagMenu->numShownItems[pocketId] = MAX_ITEMS_SHOWN;
    else
        gBagMenu->numShownItems[pocketId] = gBagMenu->numItemStacks[pocketId];
}

static void UpdatePocketItemLists(void)
{
    u8 i;
    for (i = 0; i < NUM_BAG_POCKETS_NO_CASES; i++)
        UpdatePocketItemList(i);
}

void DisplayItemMessage(u8 taskId, u8 fontId, const u8 *str, void (*callback)(u8 taskId))
{
    s16 *data = gTasks[taskId].data;
    tMsgWindowId = AddItemMessageWindow(ITEMWIN_MESSAGE);
    FillWindowPixelBuffer(tMsgWindowId, PIXEL_FILL(1));
    DisplayMessageAndContinueTask(taskId, tMsgWindowId, 0x06D, 13, fontId, GetPlayerTextSpeedDelay(), str, callback);
    ScheduleBgCopyTilemapToVram(sWindowTemplates[ITEMWIN_MESSAGE].bg);
}

void ItemMenu_SetExitCallback(MainCallback cb)
{
    gBagMenu->newScreenCallback = cb;
}

static void Task_BagMenu_HandleInput(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 *scrollPos = &gBagPosition.scrollPosition[gBagPosition.pocket];
    u16 *cursorPos = &gBagPosition.cursorPosition[gBagPosition.pocket];
    s32 listPosition;

    if (gPaletteFade.active)
        return;
    if (FuncIsActiveTask(Task_AnimateWin0v) == TRUE)
        return;
    if (IsActiveOverworldLinkBusy() == TRUE)
        return;
    switch (ProcessPocketSwitchInput(taskId, gBagPosition.pocket))
    {
    case SWITCH_POCKET_LEFT:
        SwitchBagPocket(taskId, MENU_CURSOR_DELTA_LEFT, FALSE);
        return;
    case SWITCH_POCKET_RIGHT:
        SwitchBagPocket(taskId, MENU_CURSOR_DELTA_RIGHT, FALSE);
        return;
    default:
        if (JOY_NEW(SELECT_BUTTON) && gBagPosition.location == ITEMMENULOCATION_FIELD)
        {
            if ((*scrollPos + *cursorPos) != gBagMenu->numItemStacks[gBagPosition.pocket] - 1)
            {
                PlaySE(SE_SELECT);
                StartItemSwap(taskId);
                return;
            }
        }
        break;
    }

    listPosition = ListMenu_ProcessInput(tListTaskId);
    ListMenuGetScrollAndRow(tListTaskId, scrollPos, cursorPos);
    switch (listPosition)
    {
    case LIST_NOTHING_CHOSEN:
        return;
    case LIST_CANCEL:
        PlaySE(SE_SELECT);
        gSpecialVar_ItemId = ITEM_NONE;
        Bag_BeginCloseWin0Animation();
        gTasks[taskId].func = Task_FadeAndCloseBagMenu;
        break;
    default:
        PlaySE(SE_SELECT);
        if (listPosition == gBagMenu->numItemStacks[gBagPosition.pocket])
        {
            gSpecialVar_ItemId = ITEM_NONE;
            Bag_BeginCloseWin0Animation();
            gTasks[taskId].func = Task_FadeAndCloseBagMenu;
        }
        else
        {
            BagDestroyPocketScrollArrowPair();
            BagMenu_PrintCursor(tListTaskId, 2);
            tListPosition = listPosition;
            tQuantity = BagGetQuantityByPocketPosition(gBagPosition.pocket + 1, listPosition);
            gSpecialVar_ItemId = BagGetItemIdByPocketPosition(gBagPosition.pocket + 1, listPosition);
            gTasks[taskId].func = Task_ItemContextMenuByLocation;
        }
        break;
    }
}

static void Task_ItemContextMenuByLocation(u8 taskId)
{
    Bag_FillMessageBoxWithPalette(1);
    sItemContextTaskFuncs[gBagPosition.location](taskId);
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
    if (gBagMenu->pocketSwitchMode != SWITCHMODE_NORMAL)
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

static void SwitchBagPocket(u8 taskId, s16 deltaBagPocketId, bool16 skipEraseList)
{
    s16 *data = gTasks[taskId].data;
    tSwitchState = 0;
    tSwitchCounter = 0;
    tSwitchDir = deltaBagPocketId;
    if (!skipEraseList)
    {
        ClearWindowTilemap(0);
        ClearWindowTilemap(1);
        ClearWindowTilemap(2);
        DestroyListMenuTask(data[0], &gBagPosition.scrollPosition[gBagPosition.pocket], &gBagPosition.cursorPosition[gBagPosition.pocket]);
        ScheduleBgCopyTilemapToVram(0);
        RemoveBagItemIconSprite(gBagMenu->itemIconSlot ^ 1);
        BagDestroyPocketScrollArrowPair();
    }
    FillBgTilemapBufferRect_Palette0(1, 0x02D, 11, 1, 18, 12);
    ScheduleBgCopyTilemapToVram(1);
    SetBagVisualPocketId(gBagPosition.pocket + deltaBagPocketId);
    SetTaskFuncWithFollowupFunc(taskId, Task_AnimateSwitchPockets, gTasks[taskId].func);
}

static void Task_AnimateSwitchPockets(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!MenuHelpers_IsLinkActive() && !IsTutorialBag())
    {
        switch (ProcessPocketSwitchInput(taskId, gBagPosition.pocket + tSwitchDir))
        {
        case 1:
            gBagPosition.pocket += tSwitchDir;
            SwitchTaskToFollowupFunc(taskId);
            SwitchBagPocket(taskId, -1, TRUE);
            return;
        case 2:
            gBagPosition.pocket += tSwitchDir;
            SwitchTaskToFollowupFunc(taskId);
            SwitchBagPocket(taskId,  1, TRUE);
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
        gBagPosition.pocket += tSwitchDir;
        PrintBagPocketName();
        LoadBagItemListBuffers(gBagPosition.pocket);
        data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gBagPosition.scrollPosition[gBagPosition.pocket], gBagPosition.cursorPosition[gBagPosition.pocket]);
        PutWindowTilemap(1);
        PutWindowTilemap(2);
        ScheduleBgCopyTilemapToVram(0);
        CreatePocketScrollArrowPair();
        CreatePocketSwitchArrowPair();
        SwitchTaskToFollowupFunc(taskId);
        break;
    }
}

static void StartItemSwap(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    ListMenuSetTemplateField(tListTaskId, LISTFIELD_CURSORKIND, 1);
    tListPosition = gBagPosition.scrollPosition[gBagPosition.pocket] + gBagPosition.cursorPosition[gBagPosition.pocket];
    gBagMenu->toSwapPos = tListPosition;
    StringCopy(gStringVar1, GetItemName(BagGetItemIdByPocketPosition(gBagPosition.pocket + 1, data[1])));
    StringExpandPlaceholders(gStringVar4, gText_MoveVar1Where);
    FillWindowPixelBuffer(1, PIXEL_FILL(0));
    BagPrintTextOnWindow(1, FONT_NORMAL, gStringVar4, 0, 3, 2, 0, 0, 0);
    UpdateItemMenuSwapLinePos(ListMenuGetYCoordForPrintingArrowCursor(data[0]));
    SetItemMenuSwapLineInvisibility(FALSE);
    DestroyPocketSwitchArrowPair();
    BagMenu_PrintCursor(data[0], 2);
    gTasks[taskId].func = Task_HandleSwappingItemsInput;
}

static void Task_HandleSwappingItemsInput(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    s32 input;
    u16 itemsAbove;
    u16 cursorPos;
    if (IsActiveOverworldLinkBusy() == TRUE)
        return;
    input = ListMenu_ProcessInput(data[0]);
    ListMenuGetScrollAndRow(data[0], &gBagPosition.scrollPosition[gBagPosition.pocket], &gBagPosition.cursorPosition[gBagPosition.pocket]);
    UpdateItemMenuSwapLinePos(ListMenuGetYCoordForPrintingArrowCursor(data[0]));
    if (JOY_NEW(SELECT_BUTTON))
    {
        PlaySE(SE_SELECT);
        gBagMenu->toSwapPos = NOT_SWAPPING;
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
        gBagMenu->toSwapPos = NOT_SWAPPING;
        ListMenuGetScrollAndRow(data[0], &cursorPos, &itemsAbove);
        AbortMovingItemInPocket(taskId, cursorPos + itemsAbove);
        break;
    default:
        PlaySE(SE_SELECT);
        gBagMenu->toSwapPos = NOT_SWAPPING;
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
        MoveItemSlotInList(gBagPockets[gBagPosition.pocket].itemSlots, data[1], itemIndex);
        DestroyListMenuTask(data[0], &gBagPosition.scrollPosition[gBagPosition.pocket], &gBagPosition.cursorPosition[gBagPosition.pocket]);
        if (data[1] < itemIndex)
            gBagPosition.cursorPosition[gBagPosition.pocket]--;
        LoadBagItemListBuffers(gBagPosition.pocket);
        data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gBagPosition.scrollPosition[gBagPosition.pocket], gBagPosition.cursorPosition[gBagPosition.pocket]);
        SetItemMenuSwapLineInvisibility(TRUE);
        CreatePocketSwitchArrowPair();
        gTasks[taskId].func = Task_BagMenu_HandleInput;
    }
}

static void AbortMovingItemInPocket(u8 taskId, u32 itemIndex)
{
    s16 *data = gTasks[taskId].data;
    DestroyListMenuTask(data[0], &gBagPosition.scrollPosition[gBagPosition.pocket], &gBagPosition.cursorPosition[gBagPosition.pocket]);
    if (data[1] < itemIndex)
        gBagPosition.cursorPosition[gBagPosition.pocket]--;
    LoadBagItemListBuffers(gBagPosition.pocket);
    data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gBagPosition.scrollPosition[gBagPosition.pocket], gBagPosition.cursorPosition[gBagPosition.pocket]);
    SetItemMenuSwapLineInvisibility(TRUE);
    CreatePocketSwitchArrowPair();
    gTasks[taskId].func = Task_BagMenu_HandleInput;
}

static void InitQuantityToTossOrDeposit(u16 cursorPos, const u8 *str)
{
    u8 r4;
    u8 r5 = ShowBagWindow(ITEMWIN_8);
    CopyItemName(BagGetItemIdByPocketPosition(gBagPosition.pocket + 1, cursorPos), gStringVar1);
    StringExpandPlaceholders(gStringVar4, str);
    BagPrintTextOnWindow(r5, FONT_NORMAL, gStringVar4, 0, 2, 1, 0, 0, 1);
    r4 = ShowBagWindow(ITEMWIN_0);
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
    switch (gBagPosition.location)
    {
    case ITEMMENULOCATION_BATTLE:
    case ITEMMENULOCATION_TTVSCR_STATUS:
        if (gSpecialVar_ItemId == ITEM_BERRY_POUCH)
        {
            sContextMenuItemsBuffer[0] = ACTION_OPEN_BERRIES;
            sContextMenuItemsBuffer[1] = ACTION_CANCEL;
            sContextMenuItemsPtr = sContextMenuItemsBuffer;
            sContextMenuNumItems = 2;
        }
        else if (GetItemBattleUsage(gSpecialVar_ItemId))
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
                if (gBagPosition.pocket == KEYITEMS_POCKET)
                    sContextMenuNumItems = 1;
                else
                    sContextMenuNumItems = 2;
                sContextMenuItemsPtr = sContextMenuItems_GiveIfNotKeyItemPocket[gBagPosition.pocket];
            }
        }
        else
        {
            switch (gBagPosition.pocket)
            {
            case ITEMS_POCKET:
                sContextMenuNumItems = 4;
                if (ItemIsMail(gSpecialVar_ItemId) == TRUE)
                    sContextMenuItemsPtr = sContextMenuItems_CheckGiveTossCancel;
                else
                    sContextMenuItemsPtr = sContextMenuItems_Field[gBagPosition.pocket];
                break;
            case KEYITEMS_POCKET:
                sContextMenuItemsPtr = sContextMenuItemsBuffer;
                sContextMenuNumItems = 3;
                sContextMenuItemsBuffer[2] = ACTION_CANCEL;
                if (gSaveBlock1Ptr->registeredItem == gSpecialVar_ItemId)
                    sContextMenuItemsBuffer[1] = ACTION_DESELECT;
                else
                    sContextMenuItemsBuffer[1] = ACTION_REGISTER;
                if (gSpecialVar_ItemId == ITEM_TM_CASE || gSpecialVar_ItemId == ITEM_BERRY_POUCH)
                    sContextMenuItemsBuffer[0] = ACTION_OPEN;
                else if (gSpecialVar_ItemId == ITEM_BICYCLE && TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_ACRO_BIKE | PLAYER_AVATAR_FLAG_MACH_BIKE))
                    sContextMenuItemsBuffer[0] = ACTION_WALK;
                else
                    sContextMenuItemsBuffer[0] = ACTION_USE;
                break;
            case BALLS_POCKET:
                sContextMenuItemsPtr = sContextMenuItems_Field[gBagPosition.pocket];
                sContextMenuNumItems = 3;
                break;
            }
        }
    }
    r6 = ShowBagWindow(ITEMWIN_1x1 + sContextMenuNumItems - 1);
    PrintMenuActionTexts(
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
    InitMenuNormal(r6, FONT_NORMAL, 0, 2, GetFontAttribute(FONT_NORMAL, FONTATTR_MAX_LETTER_HEIGHT) + 2, sContextMenuNumItems, 0);
    r4 = ShowBagWindow(ITEMWIN_6);
    CopyItemName(gSpecialVar_ItemId, gStringVar1);
    StringExpandPlaceholders(gStringVar4, gText_Var1IsSelected);
    BagPrintTextOnWindow(r4, FONT_NORMAL, gStringVar4, 0, 2, 1, 0, 0, 1);
}

static void Task_ItemContext_Normal(u8 taskId)
{
    OpenContextMenu(taskId);
    gTasks[taskId].func = Task_FieldItemContextMenuHandleInput;
}

static void Task_FieldItemContextMenuHandleInput(u8 taskId)
{
    s8 input;
    if (IsActiveOverworldLinkBusy() != TRUE)
    {
        input = Menu_ProcessInputNoWrap();
        switch (input)
        {
        case -1:
            PlaySE(SE_SELECT);
            sItemMenuContextActions[ACTION_CANCEL].func.void_u8(taskId);
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
    if (GetItemFieldFunc(gSpecialVar_ItemId) != NULL)
    {
        RemoveContextWindow();
        BagMenu_RemoveWindow(ITEMWIN_6);
        PutWindowTilemap(0);
        PutWindowTilemap(1);
        ScheduleBgCopyTilemapToVram(0);
        if (CalculatePlayerPartyCount() == 0 && GetItemType(gSpecialVar_ItemId) == ITEM_USE_PARTY_MENU)
            Task_PrintThereIsNoPokemon(taskId);
        else
            GetItemFieldFunc(gSpecialVar_ItemId)(taskId);
    }
}

static void Task_ItemMenuAction_Toss(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    ClearWindowTilemap(GetBagWindow(10));
    ClearWindowTilemap(GetBagWindow(ITEMWIN_6));
    RemoveContextWindow();
    BagMenu_RemoveWindow(ITEMWIN_6);
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
    BagPrintTextOnWindow(ShowBagWindow(ITEMWIN_7), FONT_NORMAL, gStringVar4, 0, 2, 1, 0, 0, 1);
    BagMenu_YesNo(taskId, ITEMWIN_YESNO_BOTTOMRIGHT, &sYesNoMenu_Toss);
}

static void Task_TossItem_No(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    BagMenu_RemoveWindow(ITEMWIN_7);
    PutWindowTilemap(1);
    ScheduleBgCopyTilemapToVram(0);
    BagMenu_PrintCursor(data[0], 1);
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
        ClearWindowTilemap(GetBagWindow(ITEMWIN_8));
        BagMenu_RemoveWindow(ITEMWIN_8);
        BagMenu_RemoveWindow(ITEMWIN_0);
        ScheduleBgCopyTilemapToVram(0);
        BagDestroyPocketScrollArrowPair();
        Task_ConfirmTossItems(taskId);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        BagMenu_RemoveWindow(ITEMWIN_8);
        BagMenu_RemoveWindow(ITEMWIN_0);
        PutWindowTilemap(0);
        PutWindowTilemap(1);
        ScheduleBgCopyTilemapToVram(0);
        BagMenu_PrintCursor(data[0], 1);
        BagDestroyPocketScrollArrowPair();
        Task_RedrawArrowsAndReturnToBagMenuSelect(taskId);
    }
}

static void Task_TossItem_Yes(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    BagMenu_RemoveWindow(ITEMWIN_7);
    CopyItemName(BagGetItemIdByPocketPosition(gBagPosition.pocket + 1, data[1]), gStringVar1);
    ConvertIntToDecimalStringN(gStringVar2, data[8], STR_CONV_MODE_LEFT_ALIGN, 3);
    StringExpandPlaceholders(gStringVar4, gText_ThrewAwayStrVar2StrVar1s);
    BagPrintTextOnWindow(ShowBagWindow(ITEMWIN_9), FONT_NORMAL, gStringVar4, 0, 2, 1, 0, 0, 1);
    gTasks[taskId].func = Task_WaitAB_RedrawAndReturnToBag;
}

static void Task_WaitAB_RedrawAndReturnToBag(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        RemoveBagItem(gSpecialVar_ItemId, data[8]);
        BagMenu_RemoveWindow(ITEMWIN_9);
        DestroyListMenuTask(data[0], &gBagPosition.scrollPosition[gBagPosition.pocket], &gBagPosition.cursorPosition[gBagPosition.pocket]);
        UpdatePocketItemList(gBagPosition.pocket);
        UpdatePocketListPosition(gBagPosition.pocket);
        LoadBagItemListBuffers(gBagPosition.pocket);
        data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gBagPosition.scrollPosition[gBagPosition.pocket], gBagPosition.cursorPosition[gBagPosition.pocket]);
        PutWindowTilemap(1);
        ScheduleBgCopyTilemapToVram(0);
        BagMenu_PrintCursor(data[0], 1);
        Task_RedrawArrowsAndReturnToBagMenuSelect(taskId);
    }
}

static void ItemMenu_Register(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 *scrollPos = &gBagPosition.scrollPosition[gBagPosition.pocket];
    u16 *cursorPos = &gBagPosition.cursorPosition[gBagPosition.pocket];

    if (gSaveBlock1Ptr->registeredItem == gSpecialVar_ItemId)
        gSaveBlock1Ptr->registeredItem = ITEM_NONE;
    else
        gSaveBlock1Ptr->registeredItem = gSpecialVar_ItemId;

    DestroyListMenuTask(tListTaskId, scrollPos, cursorPos);
    LoadBagItemListBuffers(gBagPosition.pocket);
    tListTaskId = ListMenuInit(&gMultiuseListMenuTemplate, *scrollPos, *cursorPos);
    ScheduleBgCopyTilemapToVram(0);
    ItemMenu_Cancel(taskId);
}

static void Task_ItemMenuAction_Give(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 itemId = BagGetItemIdByPocketPosition(gBagPosition.pocket + 1, data[1]);
    RemoveContextWindow();
    BagMenu_RemoveWindow(ITEMWIN_6);
    PutWindowTilemap(0);
    PutWindowTilemap(1);
    CopyWindowToVram(0, COPYWIN_MAP);
    if (!IsWritingMailAllowed(itemId))
        DisplayItemMessage(taskId, FONT_NORMAL, gText_CantWriteMailHere, Task_WaitAButtonAndCloseContextMenu);
    else if (GetItemImportance(itemId) == 0)
    {
        if (CalculatePlayerPartyCount() == 0)
        {
            Task_PrintThereIsNoPokemon(taskId);
        }
        else
        {
            gBagMenu->newScreenCallback = CB2_ChooseMonToGiveItem;
            gTasks[taskId].func = Task_FadeAndCloseBagMenu;
        }
    }
    else
        Task_PrintItemCantBeHeld(taskId);
}

static void Task_PrintThereIsNoPokemon(u8 taskId)
{
    DisplayItemMessage(taskId, FONT_NORMAL, gText_ThereIsNoPokemon, Task_WaitAButtonAndCloseContextMenu);
}

static void Task_PrintItemCantBeHeld(u8 taskId)
{
    CopyItemName(gSpecialVar_ItemId, gStringVar1);
    StringExpandPlaceholders(gStringVar4, gText_ItemCantBeHeld);
    DisplayItemMessage(taskId, FONT_NORMAL, gStringVar4, Task_WaitAButtonAndCloseContextMenu);
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
    CloseBagWindow(ITEMWIN_MESSAGE);
    DestroyListMenuTask(data[0], &gBagPosition.scrollPosition[gBagPosition.pocket], &gBagPosition.cursorPosition[gBagPosition.pocket]);
    UpdatePocketItemList(gBagPosition.pocket);
    UpdatePocketListPosition(gBagPosition.pocket);
    LoadBagItemListBuffers(gBagPosition.pocket);
    data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gBagPosition.scrollPosition[gBagPosition.pocket], gBagPosition.cursorPosition[gBagPosition.pocket]);
    ScheduleBgCopyTilemapToVram(0);
    BagMenu_PrintCursor(data[0], 1);
    Task_RedrawArrowsAndReturnToBagMenuSelect(taskId);
}

static void ItemMenu_Cancel(u8 taskId)
{
    RemoveContextWindow();
    BagMenu_RemoveWindow(ITEMWIN_6);
    PutWindowTilemap(0);
    PutWindowTilemap(1);
    ScheduleBgCopyTilemapToVram(0);
    BagMenu_PrintCursor(gTasks[taskId].data[0], 1);
    Task_RedrawArrowsAndReturnToBagMenuSelect(taskId);
}

static void RemoveContextWindow(void)
{
    if (sContextMenuNumItems == 1)
        BagMenu_RemoveWindow(ITEMWIN_1x1);
    else if (sContextMenuNumItems == 2)
        BagMenu_RemoveWindow(ITEMWIN_1x2);
    else if (sContextMenuNumItems == 4)
        BagMenu_RemoveWindow(ITEMWIN_1x4);
    else
        BagMenu_RemoveWindow(ITEMWIN_1x3);
}

static void Task_ItemMenuAction_BattleUse(u8 taskId)
{
    // Safety check
    u16 type = GetItemType(gSpecialVar_ItemId);
    if (!GetItemBattleUsage(gSpecialVar_ItemId))
        return;

    RemoveContextWindow();
    BagMenu_RemoveWindow(ITEMWIN_6);
    PutWindowTilemap(0);
    PutWindowTilemap(1);
    CopyWindowToVram(0, COPYWIN_MAP);   

    if (type == ITEM_USE_BAG_MENU) {
        ItemUseInBattle_BagMenu(taskId);
    }
    else if (type == ITEM_USE_PARTY_MENU) {
        ItemUseInBattle_PartyMenu(taskId);
    }
    else if (type == ITEM_USE_PARTY_MENU_MOVES) {
        ItemUseInBattle_PartyMenuChooseMove(taskId);
    }
}

static void Task_ItemContext_FieldGive(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 itemId = BagGetItemIdByPocketPosition(gBagPosition.pocket + 1, data[1]);
    if (!IsWritingMailAllowed(itemId))
    {
        DisplayItemMessage(taskId, FONT_NORMAL, gText_CantWriteMailHere, Task_WaitAButtonAndCloseContextMenu);
    }
    else if (itemId == ITEM_TM_CASE)
    {
        ItemMenu_SetExitCallback(GoToTMCase_Give);
        Task_FadeAndCloseBagMenu(taskId);
    }
    else if (itemId == ITEM_BERRY_POUCH)
    {
        ItemMenu_SetExitCallback(GoToBerryPouch_Give);
        Task_FadeAndCloseBagMenu(taskId);
    }
    else if (gBagPosition.pocket != POCKET_KEY_ITEMS - 1 && GetItemImportance(itemId) == 0)
    {
        Bag_BeginCloseWin0Animation();
        gTasks[taskId].func = Task_FadeAndCloseBagMenu;
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
    u16 itemId = BagGetItemIdByPocketPosition(gBagPosition.pocket + 1, data[1]);
    if (ItemIsMail(itemId) == TRUE)
    {
        DisplayItemMessage(taskId, FONT_NORMAL, gText_CantWriteMailHere, Task_WaitAButtonAndCloseContextMenu);
    }
    else if (itemId == ITEM_TM_CASE)
    {
        ItemMenu_SetExitCallback(GoToTMCase_PCBox);
        Task_FadeAndCloseBagMenu(taskId);
    }
    else if (itemId == ITEM_BERRY_POUCH)
    {
        ItemMenu_SetExitCallback(GoToBerryPouch_PCBox);
        Task_FadeAndCloseBagMenu(taskId);
    }
    else if (gBagPosition.pocket != POCKET_KEY_ITEMS - 1 && GetItemImportance(itemId) == 0)
    {
        Bag_BeginCloseWin0Animation();
        gTasks[taskId].func = Task_FadeAndCloseBagMenu;
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
    GoToBagMenu(ITEMMENULOCATION_PCBOX, NUM_BAG_POCKETS_NO_CASES, CB2_ReturnToPokeStorage);
}

static void Task_ItemContext_Sell(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (gSpecialVar_ItemId == ITEM_TM_CASE)
    {
        ItemMenu_SetExitCallback(GoToTMCase_Sell);
        Task_FadeAndCloseBagMenu(taskId);
    }
    else if (gSpecialVar_ItemId == ITEM_BERRY_POUCH)
    {
        ItemMenu_SetExitCallback(GoToBerryPouch_Sell);
        Task_FadeAndCloseBagMenu(taskId);
    }
    else if (GetItemPrice(gSpecialVar_ItemId) == 0)
    {
        CopyItemName(gSpecialVar_ItemId, gStringVar1);
        StringExpandPlaceholders(gStringVar4, gText_OhNoICantBuyThat);
        DisplayItemMessage(taskId, GetDialogBoxFontId(), gStringVar4, Task_ReturnToBagFromContextMenu);
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
            DisplayItemMessage(taskId, GetDialogBoxFontId(), gStringVar4, Task_InitSaleQuantitySelectInterface);
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
    GoToBagMenu(ITEMMENULOCATION_SHOP, NUM_BAG_POCKETS_NO_CASES, CB2_ReturnToField);
}

#define ITEM_SELL_FACTOR ((I_SELL_VALUE_FRACTION >= GEN_9) ? 4 : 2)

static void Task_PrintSaleConfirmationText(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    ConvertIntToDecimalStringN(gStringVar3, (GetItemPrice(BagGetItemIdByPocketPosition(gBagPosition.pocket + 1, data[1])) / ITEM_SELL_FACTOR) * data[8], STR_CONV_MODE_LEFT_ALIGN, 6);
    StringExpandPlaceholders(gStringVar4, gText_ICanPayThisMuch_WouldThatBeOkay);
    DisplayItemMessage(taskId, GetDialogBoxFontId(), gStringVar4, Task_ShowSellYesNoMenu);
}

static void Task_ShowSellYesNoMenu(u8 taskId)
{
    BagMenu_YesNo(taskId, ITEMWIN_YESNO_TOPRIGHT, &sYesNoMenu_Sell);
}

static void Task_SellItem_No(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    BagMenu_RemoveWindow(ITEMWIN_2);
    CloseBagWindow(ITEMWIN_MESSAGE);
    PutWindowTilemap(2);
    PutWindowTilemap(0);
    PutWindowTilemap(1);
    ScheduleBgCopyTilemapToVram(0);
    BagMenu_PrintCursor(data[0], 1);
    Task_RedrawArrowsAndReturnToBagMenuSelect(taskId);
}

static void Task_InitSaleQuantitySelectInterface(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u8 r4 = ShowBagWindow(ITEMWIN_1);
    ConvertIntToDecimalStringN(gStringVar1, 1, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
    BagPrintTextOnWindow(r4, FONT_SMALL, gStringVar4, 4, 10, 1, 0, 0xFF, 1);
    UpdateSalePriceDisplay((GetItemPrice(BagGetItemIdByPocketPosition(gBagPosition.pocket + 1, data[1])) / ITEM_SELL_FACTOR) * data[8]);
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
        UpdateSalePriceDisplay((GetItemPrice(BagGetItemIdByPocketPosition(gBagPosition.pocket + 1, data[1])) / ITEM_SELL_FACTOR) * data[8]);
    }
    else if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        BagMenu_RemoveWindow(ITEMWIN_1);
        PutWindowTilemap(0);
        ScheduleBgCopyTilemapToVram(0);
        BagDestroyPocketScrollArrowPair();
        Task_PrintSaleConfirmationText(taskId);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        BagMenu_RemoveWindow(ITEMWIN_1);
        BagMenu_RemoveWindow(ITEMWIN_2);
        CloseBagWindow(ITEMWIN_MESSAGE);
        PutWindowTilemap(2);
        PutWindowTilemap(0);
        PutWindowTilemap(1);
        ScheduleBgCopyTilemapToVram(0);
        BagDestroyPocketScrollArrowPair();
        BagMenu_PrintCursor(data[0], 1);
        Task_RedrawArrowsAndReturnToBagMenuSelect(taskId);
    }
}

static void Task_SellItem_Yes(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    PutWindowTilemap(0);
    ScheduleBgCopyTilemapToVram(0);
    CopyItemName(gSpecialVar_ItemId, gStringVar1);
    ConvertIntToDecimalStringN(gStringVar3, (GetItemPrice(BagGetItemIdByPocketPosition(gBagPosition.pocket + 1, data[1])) / ITEM_SELL_FACTOR) * data[8], STR_CONV_MODE_LEFT_ALIGN, 6);
    StringExpandPlaceholders(gStringVar4, gText_TurnedOverItemsWorthYen);
    DisplayItemMessage(taskId, FONT_NORMAL, gStringVar4, Task_FinalizeSaleToShop);
}

static void Task_FinalizeSaleToShop(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    PlaySE(SE_SHOP);
    RemoveBagItem(gSpecialVar_ItemId, data[8]);
    AddMoney(&gSaveBlock1Ptr->money, (GetItemPrice(gSpecialVar_ItemId) / ITEM_SELL_FACTOR) * data[8]);
    RecordItemTransaction(gSpecialVar_ItemId, data[8], QL_EVENT_SOLD_ITEM - QL_EVENT_USED_POKEMART);
    DestroyListMenuTask(data[0], &gBagPosition.scrollPosition[gBagPosition.pocket], &gBagPosition.cursorPosition[gBagPosition.pocket]);
    UpdatePocketItemList(gBagPosition.pocket);
    UpdatePocketListPosition(gBagPosition.pocket);
    gBagMenu->inhibitItemDescriptionPrint = TRUE;
    LoadBagItemListBuffers(gBagPosition.pocket);
    data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gBagPosition.scrollPosition[gBagPosition.pocket], gBagPosition.cursorPosition[gBagPosition.pocket]);
    BagMenu_PrintCursor(data[0], 2);
    BagDrawTextBoxOnWindow(GetBagWindow(ITEMWIN_2));
    PrintMoneyAmountInMoneyBox(GetBagWindow(ITEMWIN_2), GetMoney(&gSaveBlock1Ptr->money), 0);
    gTasks[taskId].func = Task_WaitPressAB_AfterSell;
}

static void Task_WaitPressAB_AfterSell(u8 taskId)
{
    if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        BagMenu_RemoveWindow(ITEMWIN_2);
        PutWindowTilemap(2);
        gBagMenu->inhibitItemDescriptionPrint = FALSE;
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
        ClearWindowTilemap(GetBagWindow(ITEMWIN_8));
        BagMenu_RemoveWindow(ITEMWIN_8);
        BagMenu_RemoveWindow(ITEMWIN_0);
        ScheduleBgCopyTilemapToVram(0);
        BagDestroyPocketScrollArrowPair();
        Task_TryDoItemDeposit(taskId);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        BagMenu_RemoveWindow(ITEMWIN_8);
        BagMenu_RemoveWindow(ITEMWIN_0);
        PutWindowTilemap(1);
        ScheduleBgCopyTilemapToVram(0);
        BagMenu_PrintCursor(data[0], 1);
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
        BagPrintTextOnWindow(ShowBagWindow(ITEMWIN_9), FONT_NORMAL, gStringVar4, 0, 2, 1, 0, 0, 1);
        gTasks[taskId].func = Task_WaitAB_RedrawAndReturnToBag;
    }
    else
    {
        DisplayItemMessage(taskId, FONT_NORMAL, gText_NoRoomToStoreItems, Task_WaitAButtonAndCloseContextMenu);
    }
}

#define tIsFieldUse data[3]

bool8 UseRegisteredKeyItemOnField(void)
{
    u8 taskId;
    if (InUnionRoom() == TRUE)
        return FALSE;
    HideMapNamePopUpWindow();
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
            taskId = CreateTask(GetItemFieldFunc(gSaveBlock1Ptr->registeredItem), 8);
            gTasks[taskId].tIsFieldUse = TRUE;
            return TRUE;
        }
        gSaveBlock1Ptr->registeredItem = ITEM_NONE;
    }
    ScriptContext_SetupScript(EventScript_BagItemCanBeRegistered);
    return TRUE;
}

#undef tIsFieldUse

static bool32 IsTutorialBag(void)
{
    if (
        gBagPosition.location == ITEMMENULOCATION_OLD_MAN 
     || gBagPosition.location == ITEMMENULOCATION_TTVSCR_CATCHING 
     || gBagPosition.location == ITEMMENULOCATION_TTVSCR_STATUS 
     || gBagPosition.location == ITEMMENULOCATION_TTVSCR_REGISTER 
     || gBagPosition.location == ITEMMENULOCATION_TTVSCR_TMS
    )
        return TRUE;
    return FALSE;
}

static void PrepareBagForTutorial(void)
{
    u32 i;
    sBackupPlayerBag = AllocZeroed(sizeof(*sBackupPlayerBag));
    memcpy(sBackupPlayerBag->bagPocket_Items, gSaveBlock1Ptr->bagPocket_Items, sizeof(gSaveBlock1Ptr->bagPocket_Items));
    memcpy(sBackupPlayerBag->bagPocket_KeyItems, gSaveBlock1Ptr->bagPocket_KeyItems, sizeof(gSaveBlock1Ptr->bagPocket_KeyItems));
    memcpy(sBackupPlayerBag->bagPocket_PokeBalls, gSaveBlock1Ptr->bagPocket_PokeBalls, sizeof(gSaveBlock1Ptr->bagPocket_PokeBalls));
    sBackupPlayerBag->registeredItem = gSaveBlock1Ptr->registeredItem;
    sBackupPlayerBag->pocket = gBagPosition.pocket;
    for (i = 0; i < NUM_BAG_POCKETS_NO_CASES; i++)
    {
        sBackupPlayerBag->cursorPosition[i] = gBagPosition.cursorPosition[i];
        sBackupPlayerBag->scrollPosition[i] = gBagPosition.scrollPosition[i];
    }
    ClearItemSlots(gSaveBlock1Ptr->bagPocket_Items, BAG_ITEMS_COUNT);
    ClearItemSlots(gSaveBlock1Ptr->bagPocket_KeyItems, BAG_KEYITEMS_COUNT);
    ClearItemSlots(gSaveBlock1Ptr->bagPocket_PokeBalls, BAG_POKEBALLS_COUNT);
    gSaveBlock1Ptr->registeredItem = ITEM_NONE;
    ResetBagScrollPositions();
}

static void RestorePlayerBag(void)
{
    u32 i;
    memcpy(gSaveBlock1Ptr->bagPocket_Items, sBackupPlayerBag->bagPocket_Items, BAG_ITEMS_COUNT * sizeof(struct ItemSlot));
    memcpy(gSaveBlock1Ptr->bagPocket_KeyItems, sBackupPlayerBag->bagPocket_KeyItems, BAG_KEYITEMS_COUNT * sizeof(struct ItemSlot));
    memcpy(gSaveBlock1Ptr->bagPocket_PokeBalls, sBackupPlayerBag->bagPocket_PokeBalls, BAG_POKEBALLS_COUNT * sizeof(struct ItemSlot));
    gSaveBlock1Ptr->registeredItem = sBackupPlayerBag->registeredItem;
    gBagPosition.pocket = sBackupPlayerBag->pocket;
    for (i = 0; i < NUM_BAG_POCKETS_NO_CASES; i++)
    {
        gBagPosition.cursorPosition[i] = sBackupPlayerBag->cursorPosition[i];
        gBagPosition.scrollPosition[i] = sBackupPlayerBag->scrollPosition[i];
    }
    Free(sBackupPlayerBag);
}

void InitOldManBag(void)
{
    PrepareBagForTutorial();
    AddBagItem(ITEM_POTION, 1);
    AddBagItem(ITEM_POKE_BALL, 1);
    GoToBagMenu(ITEMMENULOCATION_OLD_MAN, ITEMS_POCKET, CB2_SetUpReshowBattleScreenAfterMenu2);
}

#define tFrameCounter data[8]

static void Task_Bag_OldManTutorial(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!gPaletteFade.active)
    {
        switch (tFrameCounter)
        {
        case 102:
        case 204:
            PlaySE(SE_BAG_POCKET);
            SwitchBagPocket(taskId, 1, FALSE);
            break;
        case 306:
            PlaySE(SE_SELECT);
            BagMenu_PrintCursor(data[0], 2);
            Bag_FillMessageBoxWithPalette(1);
            gSpecialVar_ItemId = ITEM_POKE_BALL;
            OpenContextMenu(taskId);
            break;
        case 408:
            PlaySE(SE_SELECT);
            RemoveContextWindow();
            BagMenu_RemoveWindow(ITEMWIN_6);
            PutWindowTilemap(0);
            PutWindowTilemap(1);
            CopyWindowToVram(0, COPYWIN_MAP);
            DestroyListMenuTask(data[0], NULL, NULL);
            RestorePlayerBag();
            Bag_BeginCloseWin0Animation();
            gTasks[taskId].func = Task_Pokedude_FadeFromBag;
            return;
        }
        tFrameCounter++;
    }
}

#undef tFrameCounter

static void Task_Pokedude_FadeFromBag(u8 taskId)
{
    BeginNormalPaletteFade(PALETTES_ALL, -2, 0, 16, RGB_BLACK);
    gTasks[taskId].func = Task_Pokedude_WaitFadeAndExitBag;
}

static void Task_Pokedude_WaitFadeAndExitBag(u8 taskId)
{
    if (!gPaletteFade.active && FuncIsActiveTask(Task_AnimateWin0v) != TRUE)
    {
        if (gBagMenu->newScreenCallback != NULL)
            SetMainCallback2(gBagMenu->newScreenCallback);
        else
            SetMainCallback2(gBagPosition.exitCallback);
        BagDestroyPocketScrollArrowPair();
        DestroyBagMenuResources();
        DestroyTask(taskId);
    }
}

void InitPokedudeBag(u8 a0)
{
    MainCallback cb2;
    u8 location;
    PrepareBagForTutorial();
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
    case ITEMMENULOCATION_TTVSCR_STATUS:
        cb2 = CB2_SetUpReshowBattleScreenAfterMenu2;
        location = ITEMMENULOCATION_TTVSCR_STATUS;
        break;
    case ITEMMENULOCATION_TTVSCR_CATCHING:
        cb2 = CB2_SetUpReshowBattleScreenAfterMenu2;
        location = ITEMMENULOCATION_TTVSCR_CATCHING;
        break;
    }
    GoToBagMenu(location, ITEMS_POCKET, cb2);
}

static bool8 Task_BButtonInterruptTeachyTv(u8 taskId)
{
    if (JOY_NEW(B_BUTTON))
    {
        RestorePlayerBag();
        SetTeachyTvControllerModeToResume();
        gBagMenu->newScreenCallback = CB2_ReturnToTeachyTV;
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
            SwitchBagPocket(taskId, 1, FALSE);
            break;
        case 204:
            PlaySE(SE_SELECT);
            BagMenu_PrintCursor(data[0], 2);
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
            RemoveContextWindow();
            BagMenu_RemoveWindow(ITEMWIN_6);
            PutWindowTilemap(0);
            PutWindowTilemap(1);
            DestroyListMenuTask(data[0], &gBagPosition.scrollPosition[gBagPosition.pocket], &gBagPosition.cursorPosition[gBagPosition.pocket]);
            LoadBagItemListBuffers(gBagPosition.pocket);
            data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gBagPosition.scrollPosition[gBagPosition.pocket], gBagPosition.cursorPosition[gBagPosition.pocket]);
            Bag_FillMessageBoxWithPalette(0);
            BagMenu_PrintCursor(data[0], 1);
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
            SwitchBagPocket(taskId, 1, FALSE);
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
            BagMenu_PrintCursor(data[0], 2);
            Bag_FillMessageBoxWithPalette(1);
            gSpecialVar_ItemId = ITEM_POKE_BALL;
            OpenContextMenu(taskId);
            break;
        case 816:
            PlaySE(SE_SELECT);
            RemoveContextWindow();
            BagMenu_RemoveWindow(ITEMWIN_6);
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
            BagMenu_PrintCursor(data[0], 2);
            Bag_FillMessageBoxWithPalette(1);
            gSpecialVar_ItemId = ITEM_ANTIDOTE;
            OpenContextMenu(taskId);
            break;
        case 306:
            PlaySE(SE_SELECT);
            RemoveContextWindow();
            BagMenu_RemoveWindow(ITEMWIN_6);
            PutWindowTilemap(0);
            PutWindowTilemap(1);
            CopyWindowToVram(0, COPYWIN_MAP);
            DestroyListMenuTask(data[0], NULL, NULL);
            RestorePlayerBag();
            gItemUseCB = ItemUseCB_BattleScript;
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
            SwitchBagPocket(taskId, 1, 0);
            break;
        case 204:
            gMain.newKeys = 0;
            gMain.newAndRepeatedKeys = DPAD_DOWN;
            ListMenu_ProcessInput(data[0]);
            break;
        case 306:
            PlaySE(SE_SELECT);
            BagMenu_PrintCursor(data[0], 2);
            Bag_FillMessageBoxWithPalette(1);
            gSpecialVar_ItemId = ITEM_TM_CASE;
            OpenContextMenu(taskId);
            break;
        case 408:
            PlaySE(SE_SELECT);
            RemoveContextWindow();
            BagMenu_RemoveWindow(ITEMWIN_6);
            PutWindowTilemap(0);
            PutWindowTilemap(1);
            CopyWindowToVram(0, COPYWIN_MAP);
            DestroyListMenuTask(data[0], NULL, NULL);
            RestorePlayerBag();
            gBagMenu->newScreenCallback = Pokedude_InitTMCase;
            gTasks[taskId].func = Task_Pokedude_FadeFromBag;
            return;
        }
        data[8]++;
    }
}

// Choosing berry to plant
void CB2_ChooseBerry(void)
{
    // probably bugged
    InitBerryPouch(BERRYPOUCH_FROMBERRYTREE, CB2_ReturnToFieldContinueScript, FALSE);
}

// Choosing mulch to use
void CB2_ChooseMulch(void)
{
    GoToBagMenu(ITEMMENULOCATION_BERRY_TREE_MULCH, ITEMS_POCKET, CB2_ReturnToFieldContinueScript);
}
void LoadBagMenuTextWindows(void)
{
    u8 i;

    if (gBagPosition.location != ITEMMENULOCATION_ITEMPC)
        InitWindows(sDefaultBagWindows);
    else
        InitWindows(sDefaultBagWindowsDeposit);
    DeactivateAllTextPrinters();
    LoadUserWindowBorderGfx(0, 0x64, BG_PLTT_ID(14));
    LoadMessageBoxGfx(0, 0x6D, BG_PLTT_ID(13));
    LoadStdWindowGfx(0, 0x81, BG_PLTT_ID(12));
    LoadPalette(sBagWindowPalF, BG_PLTT_ID(15), sizeof(sBagWindowPalF));
    for (i = 0; i < 3; i++)
    {
        FillWindowPixelBuffer(i, 0x00);
        PutWindowTilemap(i);
    }
    ScheduleBgCopyTilemapToVram(0);
}

void BagPrintTextOnWindow(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed, u8 colorIdx)
{
    AddTextPrinterParameterized4(windowId, fontId, x, y, letterSpacing, lineSpacing, sTextColors[colorIdx], speed, str);
}

void BagPrintTextOnWin1CenteredColor0(const u8 * str, u8 unused)
{
    u32 x = 0x48 - GetStringWidth(FONT_NORMAL_COPY_1, str, 0);
    AddTextPrinterParameterized3(2, FONT_NORMAL_COPY_1, x / 2, 1, sTextColors[0], 0, str);
}

void BagDrawDepositItemTextBox(void)
{
    u32 x;
    DrawStdFrameWithCustomTileAndPalette(2, FALSE, 0x081, 12);
    x = 0x40 - GetStringWidth(FONT_SMALL, gText_DepositItem, 0);
    AddTextPrinterParameterized(2, FONT_SMALL, gText_DepositItem, x / 2, 1, 0, NULL);
}

u32 ShowBagWindow(u32 whichWindow)
{
    if (gBagMenu->windowIds[whichWindow] == WINDOW_NONE)
    {
        gBagMenu->windowIds[whichWindow] = AddWindow(&sWindowTemplates[whichWindow]);
        switch (whichWindow)
        {
            case ITEMWIN_6:
            case ITEMWIN_7:
            case ITEMWIN_8:
            case ITEMWIN_9:
                DrawStdFrameWithCustomTileAndPalette(gBagMenu->windowIds[whichWindow], FALSE, 0x081, 12);
                break;
            default:
                DrawStdFrameWithCustomTileAndPalette(gBagMenu->windowIds[whichWindow], FALSE, 0x064, 14);
                break;
        }
        ScheduleBgCopyTilemapToVram(0);
    }
    return gBagMenu->windowIds[whichWindow];
}

void BagMenu_RemoveWindow(u8 whichWindow)
{
    u8 *windowId = &gBagMenu->windowIds[whichWindow];
    
    if (*windowId != WINDOW_NONE)
    {
        ClearStdWindowAndFrameToTransparent(gBagMenu->windowIds[whichWindow], FALSE);
        ClearWindowTilemap(gBagMenu->windowIds[whichWindow]);
        RemoveWindow(gBagMenu->windowIds[whichWindow]);
        ScheduleBgCopyTilemapToVram(0);
        *windowId = WINDOW_NONE;
    }
}

static u8 AddItemMessageWindow(u8 windowType)
{
    u8 *windowId = &gBagMenu->windowIds[windowType];
    if (*windowId == WINDOW_NONE)
        *windowId = AddWindow(&sWindowTemplates[windowType]);
    return *windowId;
}

void CloseBagWindow(u8 whichWindow)
{
    if (gBagMenu->windowIds[whichWindow] != WINDOW_NONE)
    {
        ClearDialogWindowAndFrameToTransparent(gBagMenu->windowIds[whichWindow], FALSE);
        ClearWindowTilemap(gBagMenu->windowIds[whichWindow]);
        RemoveWindow(gBagMenu->windowIds[whichWindow]);
        PutWindowTilemap(1);
        ScheduleBgCopyTilemapToVram(0);
        gBagMenu->windowIds[whichWindow] = WINDOW_NONE;
    }
}

u8 GetBagWindow(u8 whichWindow)
{
    return gBagMenu->windowIds[whichWindow];
}

void BagMenu_YesNo(u8 taskId, u8 windowType, const struct YesNoFuncTable *funcTable)
{
    CreateYesNoMenuWithCallbacks(taskId, &sWindowTemplates[windowType], FONT_NORMAL, 0, 2, 0x064, 14, funcTable);
}

void BagPrintMoneyAmount(void)
{
    PrintMoneyAmountInMoneyBoxWithBorder(ShowBagWindow(ITEMWIN_2), 0x081, 0x0C, GetMoney(&gSaveBlock1Ptr->money));
}

void BagDrawTextBoxOnWindow(u8 windowId)
{
    DrawTextBorderOuter(windowId, 0x064, 14);
}

