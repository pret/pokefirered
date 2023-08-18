#include "global.h"
#include "tm_case.h"
#include "gflib.h"
#include "decompress.h"
#include "graphics.h"
#include "task.h"
#include "text_window.h"
#include "menu.h"
#include "menu_helpers.h"
#include "new_menu_helpers.h"
#include "list_menu.h"
#include "item.h"
#include "item_menu.h"
#include "link.h"
#include "money.h"
#include "shop.h"
#include "teachy_tv.h"
#include "pokemon_storage_system.h"
#include "party_menu.h"
#include "data.h"
#include "scanline_effect.h"
#include "strings.h"
#include "menu_indicators.h"
#include "constants/items.h"
#include "constants/songs.h"
#include "constants/quest_log.h"

// Any item in the TM Case with nonzero importance is considered an HM
#define IS_HM(itemId) (ItemId_GetImportance(itemId) != 0)

#define TAG_SCROLL_ARROW 110

enum {
    WIN_LIST,
    WIN_DESCRIPTION,
    WIN_SELECTED_MSG,
    WIN_TITLE,
    WIN_MOVE_INFO_LABELS,
    WIN_MOVE_INFO,
    WIN_MESSAGE,
    WIN_SELL_QUANTITY,
    WIN_MONEY,
};

// Window IDs for the context menu that opens when a TM/HM is selected
enum {
    WIN_USE_GIVE_EXIT,
    WIN_GIVE_EXIT,
};

// IDs for the actions in the context menu
enum {
    ACTION_USE,
    ACTION_GIVE,
    ACTION_EXIT
};

enum {
    COLOR_LIGHT,
    COLOR_DARK,
    COLOR_CURSOR_SELECTED,
    COLOR_MOVE_INFO,
    COLOR_CURSOR_ERASE = 0xFF
};

// Base position for TM/HM disc sprite
#define DISC_BASE_X 41
#define DISC_BASE_Y 46

#define DISC_CASE_DISTANCE 20 // The total number of pixels a disc travels vertically in/out of the case
#define DISC_Y_MOVE 10 // The number of pixels a disc travels vertically per movement step

#define TAG_DISC 400

#define DISC_HIDDEN 0xFF // When no TM/HM is selected, hide the disc sprite

enum {
    ANIM_TM,
    ANIM_HM,
};

// The "static" resources are preserved even if the TM case is exited. This is
// useful for when its left temporarily (e.g. going to the party menu to teach a TM)
// but also to preserve the selected item when the TM case is fully closed.
static EWRAM_DATA struct {
    void (* exitCallback)(void);
    u8 menuType;
    bool8 allowSelectClose;
    u8 unused;
    u16 selectedRow;
    u16 scrollOffset;
} sTMCaseStaticResources = {};

// The "dynamic" resources will be reset any time the TM case is exited, even temporarily.
static EWRAM_DATA struct {
    void (* nextScreenCallback)(void);
    u8 discSpriteId;
    u8 maxTMsShown;
    u8 numTMs;
    u8 contextMenuWindowId;
    u8 scrollArrowsTaskId;
    u16 currItem;
    const u8 * menuActionIndices;
    u8 numMenuActions;
    s16 seqId;
    u8 unused[8];
} * sTMCaseDynamicResources = NULL;

// Save the player's bag state when the Pokedude's bag is being shown
static EWRAM_DATA struct {
    struct ItemSlot bagPocket_TMHM[BAG_TMHM_COUNT];
    struct ItemSlot bagPocket_KeyItems[BAG_KEYITEMS_COUNT];
    u16 selectedRow;
    u16 scrollOffset;
} * sPokedudeBagBackup = NULL;

static EWRAM_DATA void *sTilemapBuffer = NULL;
static EWRAM_DATA struct ListMenuItem * sListMenuItemsBuffer = NULL;
static EWRAM_DATA u8 (* sListMenuStringsBuffer)[29] = NULL;
static EWRAM_DATA u16 * sTMSpritePaletteBuffer = NULL;

static void CB2_SetUpTMCaseUI_Blocking(void);
static bool8 DoSetUpTMCaseUI(void);
static void ResetBufferPointers_NoFree(void);
static void LoadBGTemplates(void);
static bool8 HandleLoadTMCaseGraphicsAndPalettes(void);
static void CreateTMCaseListMenuBuffers(void);
static void InitTMCaseListMenuItems(void);
static void GetTMNumberAndMoveString(u8 * dest, u16 itemId);
static void List_MoveCursorFunc(s32 itemIndex, bool8 onInit, struct ListMenu *list);
static void List_ItemPrintFunc(u8 windowId, u32 itemId, u8 y);
static void PrintDescription(s32 itemIndex);
static void PrintMoveInfo(u16 itemId);
static void PrintListCursorAtRow(u8 y, u8 colorIdx);
static void CreateListScrollArrows(void);
static void TMCaseSetup_GetTMCount(void);
static void TMCaseSetup_InitListMenuPositions(void);
static void TMCaseSetup_UpdateVisualMenuOffset(void);
static void Task_FadeOutAndCloseTMCase(u8 taskId);
static void Task_HandleListInput(u8 taskId);
static void Task_SelectedTMHM_Field(u8 taskId);
static void Task_ContextMenu_HandleInput(u8 taskId);
static void Action_Use(u8 taskId);
static void Action_Give(u8 taskId);
static void PrintError_ThereIsNoPokemon(u8 taskId);
static void PrintError_ItemCantBeHeld(u8 taskId);
static void Task_WaitButtonAfterErrorPrint(u8 taskId);
static void CloseMessageAndReturnToList(u8 taskId);
static void Action_Exit(u8 taskId);
static void Task_SelectedTMHM_GiveParty(u8 taskId);
static void Task_SelectedTMHM_GivePC(u8 taskId);
static void Task_SelectedTMHM_Sell(u8 taskId);
static void Task_AskConfirmSaleWithAmount(u8 taskId);
static void Task_PlaceYesNoBox(u8 taskId);
static void Task_SaleOfTMsCanceled(u8 taskId);
static void Task_InitQuantitySelectUI(u8 taskId);
static void SellTM_PrintQuantityAndSalePrice(s16 quantity, s32 value);
static void Task_QuantitySelect_HandleInput(u8 taskId);
static void Task_PrintSaleConfirmedText(u8 taskId);
static void Task_DoSaleOfTMs(u8 taskId);
static void Task_AfterSale_ReturnToList(u8 taskId);
static void Task_Pokedude_Start(u8 taskId);
static void Task_Pokedude_Run(u8 taskId);
static void InitWindowTemplatesAndPals(void);
static void TMCase_Print(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed, u8 colorIdx);
static void TMCase_SetWindowBorder1(u8 windowId);
static void TMCase_SetWindowBorder2(u8 windowId);
static void PrintMessageWithFollowupTask(u8 taskId, u8 fontId, const u8 * str, TaskFunc func);
static void PrintTitle(void);
static void DrawMoveInfoLabels(void);
static void PlaceHMTileInWindow(u8 windowId, u8 x, u8 y);
static void PrintPlayersMoney(void);
static void HandleCreateYesNoMenu(u8 taskId, const struct YesNoFuncTable * ptrs);
static u8 AddContextMenu(u8 * windowId, u8 windowIndex);
static void RemoveContextMenu(u8 * windowId);
static u8 CreateDiscSprite(u16 itemId);
static void SetDiscSpriteAnim(struct Sprite *sprite, u8 tmIdx);
static void TintDiscpriteByType(u8 type);
static void SetDiscSpritePosition(struct Sprite *sprite, u8 tmIdx);
static void SwapDisc(u8 spriteId, u16 itemId);
static void SpriteCB_SwapDisc(struct Sprite *sprite);
static void LoadDiscTypePalettes(void);

static const struct BgTemplate sBGTemplates[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x000
    }, {
        .bg = 1,
        .charBaseIndex = 0,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }, {
        .bg = 2,
        .charBaseIndex = 0,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x000
    }
};

// The list of functions to run when a TM/HM is selected.
// What happens when one is selected depends on how the player arrived at the TM case
static void (*const sSelectTMActionTasks[])(u8 taskId) = {
    [TMCASE_FIELD]      = Task_SelectedTMHM_Field,
    [TMCASE_GIVE_PARTY] = Task_SelectedTMHM_GiveParty,
    [TMCASE_SELL]       = Task_SelectedTMHM_Sell,
    [TMCASE_GIVE_PC]    = Task_SelectedTMHM_GivePC
};

static const struct MenuAction sMenuActions[] = {
    [ACTION_USE]  = {gOtherText_Use,  Action_Use },
    [ACTION_GIVE] = {gOtherText_Give, Action_Give},
    [ACTION_EXIT] = {gOtherText_Exit, Action_Exit},
};

static const u8 sMenuActionIndices_Field[] = {ACTION_USE, ACTION_GIVE, ACTION_EXIT};
static const u8 sMenuActionIndices_UnionRoom[] = {ACTION_GIVE, ACTION_EXIT};

static const struct YesNoFuncTable sYesNoFuncTable = {Task_PrintSaleConfirmedText, Task_SaleOfTMsCanceled};

static const u8 sText_ClearTo18[] = _("{CLEAR_TO 18}");
static const u8 sText_SingleSpace[] = _(" ");

static ALIGNED(4) const u16 sPal3Override[] = {RGB(8, 8, 8), RGB(30, 16, 6)};

static const u8 sTextColors[][3] = {
    [COLOR_LIGHT] = {0, 1, 2},
    [COLOR_DARK] = {0, 2, 3},
    [COLOR_CURSOR_SELECTED] = {0, 3, 6},
    [COLOR_MOVE_INFO] = {0, 14, 10},
};

static const struct WindowTemplate sWindowTemplates[] = {
    [WIN_LIST] = {
        .bg = 0,
        .tilemapLeft = 10,
        .tilemapTop = 1,
        .width = 19,
        .height = 10,
        .paletteNum = 15,
        .baseBlock = 0x081
    },
    [WIN_DESCRIPTION] = {
        .bg = 0,
        .tilemapLeft = 12,
        .tilemapTop = 12,
        .width = 18,
        .height = 8,
        .paletteNum = 10,
        .baseBlock = 0x13f
    },
    [WIN_SELECTED_MSG] = {
        .bg = 1,
        .tilemapLeft = 5,
        .tilemapTop = 15,
        .width = 15,
        .height = 4,
        .paletteNum = 13,
        .baseBlock = 0x1f9
    },
    [WIN_TITLE] = {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 1,
        .width = 10,
        .height = 2,
        .paletteNum = 15,
        .baseBlock = 0x235
    },
    [WIN_MOVE_INFO_LABELS] = {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 13,
        .width = 5,
        .height = 6,
        .paletteNum = 12,
        .baseBlock = 0x249
    },
    [WIN_MOVE_INFO] = {
        .bg = 0,
        .tilemapLeft = 7,
        .tilemapTop = 13,
        .width = 5,
        .height = 6,
        .paletteNum = 12,
        .baseBlock = 0x267
    },
    [WIN_MESSAGE] = {
        .bg = 1,
        .tilemapLeft = 2,
        .tilemapTop = 15,
        .width = 26,
        .height = 4,
        .paletteNum = 11,
        .baseBlock = 0x285
    },
    [WIN_SELL_QUANTITY] = {
        .bg = 1,
        .tilemapLeft = 17,
        .tilemapTop = 9,
        .width = 12,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x2ed
    },
    [WIN_MONEY] = {
        .bg = 1,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 8,
        .height = 3,
        .paletteNum = 13,
        .baseBlock = 0x31d
    },
    DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sYesNoWindowTemplate = {
    .bg = 1,
    .tilemapLeft = 21,
    .tilemapTop = 9,
    .width = 6,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x335
};

static const struct WindowTemplate sWindowTemplates_ContextMenu[] = {
    [WIN_USE_GIVE_EXIT] = {
        .bg = 1,
        .tilemapLeft = 22,
        .tilemapTop = 13,
        .width = 7,
        .height = 6,
        .paletteNum = 15,
        .baseBlock = 0x1cf
    },
    [WIN_GIVE_EXIT] = {
        .bg = 1,
        .tilemapLeft = 22,
        .tilemapTop = 15,
        .width = 7,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x1cf
    },
};

static const struct OamData sTMSpriteOamData = {
    .size = 2,
    .priority = 2
};

static const union AnimCmd sAnim_TM[] = {
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END
};

static const union AnimCmd sAnim_HM[] = {
    ANIMCMD_FRAME(16, 0),
    ANIMCMD_END
};

static const union AnimCmd *const sAnims_Disc[] = {
    [ANIM_TM] = sAnim_TM,
    [ANIM_HM] = sAnim_HM
};

static const struct CompressedSpriteSheet sSpriteSheet_Disc = {
    .data = gTMCaseDisc_Gfx,
    .size = 0x400,
    .tag = TAG_DISC
};

static const struct SpriteTemplate sSpriteTemplate_Disc = {
    .tileTag = TAG_DISC,
    .paletteTag = TAG_DISC,
    .oam = &sTMSpriteOamData,
    .anims = sAnims_Disc,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const u16 sTMSpritePaletteOffsetByType[NUMBER_OF_MON_TYPES] = {
    [TYPE_NORMAL]   = 0x000,
    [TYPE_FIRE]     = 0x010,
    [TYPE_WATER]    = 0x020,
    [TYPE_GRASS]    = 0x030,
    [TYPE_ELECTRIC] = 0x040,
    [TYPE_ROCK]     = 0x050,
    [TYPE_GROUND]   = 0x060,
    [TYPE_ICE]      = 0x070,
    [TYPE_FLYING]   = 0x080,
    [TYPE_FIGHTING] = 0x090,
    [TYPE_GHOST]    = 0x0a0,
    [TYPE_BUG]      = 0x0b0,
    [TYPE_POISON]   = 0x0c0,
    [TYPE_PSYCHIC]  = 0x0d0,
    [TYPE_STEEL]    = 0x0e0,
    [TYPE_DARK]     = 0x0f0,
    [TYPE_DRAGON]   = 0x100
};

void InitTMCase(u8 type, void (* exitCallback)(void), bool8 allowSelectClose)
{
    ResetBufferPointers_NoFree();
    sTMCaseDynamicResources = Alloc(sizeof(*sTMCaseDynamicResources));
    sTMCaseDynamicResources->nextScreenCallback = NULL;
    sTMCaseDynamicResources->scrollArrowsTaskId = TASK_NONE;
    sTMCaseDynamicResources->contextMenuWindowId = WINDOW_NONE;
    if (type != TMCASE_REOPENING)
        sTMCaseStaticResources.menuType = type;
    if (exitCallback != NULL)
        sTMCaseStaticResources.exitCallback = exitCallback;
    if (allowSelectClose != TMCASE_KEEP_PREV)
        sTMCaseStaticResources.allowSelectClose = allowSelectClose;
    gTextFlags.autoScroll = FALSE;
    SetMainCallback2(CB2_SetUpTMCaseUI_Blocking);
}

static void CB2_Idle(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    DoScheduledBgTilemapCopiesToVram();
    UpdatePaletteFade();
}

static void VBlankCB_Idle(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void CB2_SetUpTMCaseUI_Blocking(void)
{
    while (1)
    {
        if (IsActiveOverworldLinkBusy() == TRUE)
            break;
        if (DoSetUpTMCaseUI() == TRUE)
            break;
        if (MenuHelpers_IsLinkActive() == TRUE)
            break;
    }
}

#define tListTaskId       data[0]
#define tSelection        data[1]
#define tQuantityOwned    data[2]
#define tQuantitySelected data[8]

#define tPokedudeState data[8] // Re-used
#define tPokedudeTimer data[9]

static bool8 DoSetUpTMCaseUI(void)
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
        ResetTasks();
        gMain.state++;
        break;
    case 6:
        LoadBGTemplates();
        sTMCaseDynamicResources->seqId = 0;
        gMain.state++;
        break;
    case 7:
        InitWindowTemplatesAndPals();
        gMain.state++;
        break;
    case 8:
        if (HandleLoadTMCaseGraphicsAndPalettes())
            gMain.state++;
        break;
    case 9:
        SortPocketAndPlaceHMsFirst(&gBagPockets[POCKET_TM_CASE - 1]);
        gMain.state++;
        break;
    case 10:
        TMCaseSetup_GetTMCount();
        TMCaseSetup_InitListMenuPositions();
        TMCaseSetup_UpdateVisualMenuOffset();
        gMain.state++;
        break;
    case 11:
        DrawMoveInfoLabels();
        gMain.state++;
        break;
    case 12:
        CreateTMCaseListMenuBuffers();
        InitTMCaseListMenuItems();
        gMain.state++;
        break;
    case 13:
        PrintTitle();
        gMain.state++;
        break;
    case 14:
        if (sTMCaseStaticResources.menuType == TMCASE_POKEDUDE)
            taskId = CreateTask(Task_Pokedude_Start, 0);
        else
            taskId = CreateTask(Task_HandleListInput, 0);
        gTasks[taskId].tListTaskId = ListMenuInit(&gMultiuseListMenuTemplate, sTMCaseStaticResources.scrollOffset, sTMCaseStaticResources.selectedRow);
        gMain.state++;
        break;
    case 15:
        CreateListScrollArrows();
        gMain.state++;
        break;
    case 16:
        sTMCaseDynamicResources->discSpriteId = CreateDiscSprite(BagGetItemIdByPocketPosition(POCKET_TM_CASE, sTMCaseStaticResources.scrollOffset + sTMCaseStaticResources.selectedRow));
        gMain.state++;
        break;
    case 17:
        BlendPalettes(PALETTES_ALL, 16, 0);
        gMain.state++;
        break;
    case 18:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        gMain.state++;
        break;
    default:
        SetVBlankCallback(VBlankCB_Idle);
        SetMainCallback2(CB2_Idle);
        return TRUE;
    }

    return FALSE;
}

static void ResetBufferPointers_NoFree(void)
{
    sTMCaseDynamicResources = NULL;
    sTilemapBuffer = NULL;
    sListMenuItemsBuffer = NULL;
    sListMenuStringsBuffer = NULL;
    sTMSpritePaletteBuffer = NULL;
}

static void LoadBGTemplates(void)
{
    void ** ptr;
    ResetAllBgsCoordinatesAndBgCntRegs();
    ptr = &sTilemapBuffer;
    *ptr = AllocZeroed(0x800);
    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, sBGTemplates, ARRAY_COUNT(sBGTemplates));
    SetBgTilemapBuffer(2, *ptr);
    ScheduleBgCopyTilemapToVram(1);
    ScheduleBgCopyTilemapToVram(2);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    ShowBg(0);
    ShowBg(1);
    ShowBg(2);
}

static bool8 HandleLoadTMCaseGraphicsAndPalettes(void)
{
    switch (sTMCaseDynamicResources->seqId)
    {
    case 0:
        ResetTempTileDataBuffers();
        DecompressAndCopyTileDataToVram(1, gTMCase_Gfx, 0, 0, 0);
        sTMCaseDynamicResources->seqId++;
        break;
    case 1:
        if (FreeTempTileDataBuffersIfPossible() != TRUE)
        {
            LZDecompressWram(gTMCaseMenu_Tilemap, sTilemapBuffer);
            sTMCaseDynamicResources->seqId++;
        }
        break;
    case 2:
        LZDecompressWram(gTMCase_Tilemap, GetBgTilemapBuffer(1));
        sTMCaseDynamicResources->seqId++;
        break;
    case 3:
        if (gSaveBlock2Ptr->playerGender == MALE)
            LoadCompressedPalette(gTMCaseMenu_Male_Pal, BG_PLTT_ID(0), 4 * PLTT_SIZE_4BPP);
        else
            LoadCompressedPalette(gTMCaseMenu_Female_Pal, BG_PLTT_ID(0), 4 * PLTT_SIZE_4BPP);
        sTMCaseDynamicResources->seqId++;
        break;
    case 4:
        LoadCompressedSpriteSheet(&sSpriteSheet_Disc);
        sTMCaseDynamicResources->seqId++;
        break;
    default:
        LoadDiscTypePalettes();
        sTMCaseDynamicResources->seqId = 0;
        return TRUE;
    }

    return FALSE;
}

static void CreateTMCaseListMenuBuffers(void)
{
    struct BagPocket * pocket = &gBagPockets[POCKET_TM_CASE - 1];
    sListMenuItemsBuffer = Alloc((pocket->capacity + 1) * sizeof(struct ListMenuItem));
    sListMenuStringsBuffer = Alloc(sTMCaseDynamicResources->numTMs * 29);
}

static void InitTMCaseListMenuItems(void)
{
    struct BagPocket * pocket = &gBagPockets[POCKET_TM_CASE - 1];
    u16 i;

    for (i = 0; i < sTMCaseDynamicResources->numTMs; i++)
    {
        GetTMNumberAndMoveString(sListMenuStringsBuffer[i], pocket->itemSlots[i].itemId);
        sListMenuItemsBuffer[i].label = sListMenuStringsBuffer[i];
        sListMenuItemsBuffer[i].index = i;
    }
    sListMenuItemsBuffer[i].label = gText_Close;
    sListMenuItemsBuffer[i].index = LIST_CANCEL;

    gMultiuseListMenuTemplate.items = sListMenuItemsBuffer;
    gMultiuseListMenuTemplate.totalItems = sTMCaseDynamicResources->numTMs + 1; // +1 for Cancel
    gMultiuseListMenuTemplate.windowId = WIN_LIST;
    gMultiuseListMenuTemplate.header_X = 0;
    gMultiuseListMenuTemplate.item_X = 8;
    gMultiuseListMenuTemplate.cursor_X = 0;
    gMultiuseListMenuTemplate.lettersSpacing = 0;
    gMultiuseListMenuTemplate.itemVerticalPadding = 2;
    gMultiuseListMenuTemplate.upText_Y = 2;
    gMultiuseListMenuTemplate.maxShowed = sTMCaseDynamicResources->maxTMsShown;
    gMultiuseListMenuTemplate.fontId = FONT_NORMAL;
    gMultiuseListMenuTemplate.cursorPal = 2;
    gMultiuseListMenuTemplate.fillValue = 0;
    gMultiuseListMenuTemplate.cursorShadowPal = 3;
    gMultiuseListMenuTemplate.moveCursorFunc = List_MoveCursorFunc;
    gMultiuseListMenuTemplate.itemPrintFunc = List_ItemPrintFunc;
    gMultiuseListMenuTemplate.cursorKind = 0;
    gMultiuseListMenuTemplate.scrollMultiple = 0;
}

static void GetTMNumberAndMoveString(u8 * dest, u16 itemId)
{
    StringCopy(gStringVar4, gText_FontSmall);
    if (itemId >= ITEM_HM01)
    {
        StringAppend(gStringVar4, sText_ClearTo18);
        StringAppend(gStringVar4, gText_NumberClear01);
        ConvertIntToDecimalStringN(gStringVar1, itemId - ITEM_HM01 + 1, STR_CONV_MODE_LEADING_ZEROS, 1);
        StringAppend(gStringVar4, gStringVar1);
    }
    else
    {
        StringAppend(gStringVar4, gText_NumberClear01);
        ConvertIntToDecimalStringN(gStringVar1, itemId - ITEM_TM01 + 1, STR_CONV_MODE_LEADING_ZEROS, 2);
        StringAppend(gStringVar4, gStringVar1);
    }
    StringAppend(gStringVar4, sText_SingleSpace);
    StringAppend(gStringVar4, gText_FontNormal);
    StringAppend(gStringVar4, gMoveNames[ItemIdToBattleMoveId(itemId)]);
    StringCopy(dest, gStringVar4);
}

static void List_MoveCursorFunc(s32 itemIndex, bool8 onInit, struct ListMenu *list)
{
    u16 itemId;

    if (itemIndex == LIST_CANCEL)
        itemId = ITEM_NONE;
    else
        itemId = BagGetItemIdByPocketPosition(POCKET_TM_CASE, itemIndex);

    if (onInit != TRUE)
    {
        PlaySE(SE_SELECT);
        SwapDisc(sTMCaseDynamicResources->discSpriteId, itemId);
    }
    PrintDescription(itemIndex);
    PrintMoveInfo(itemId);
}

static void List_ItemPrintFunc(u8 windowId, u32 itemIndex, u8 y)
{
    if (itemIndex != LIST_CANCEL)
    {
        if (!IS_HM(BagGetItemIdByPocketPosition(POCKET_TM_CASE, itemIndex)))
        {
            ConvertIntToDecimalStringN(gStringVar1, BagGetQuantityByPocketPosition(POCKET_TM_CASE, itemIndex), STR_CONV_MODE_RIGHT_ALIGN, 3);
            StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
            TMCase_Print(windowId, FONT_SMALL, gStringVar4, 126, y, 0, 0, TEXT_SKIP_DRAW, COLOR_DARK);
        }
        else
        {
            PlaceHMTileInWindow(windowId, 8, y);
        }
    }
}

static void PrintDescription(s32 itemIndex)
{
    const u8 * str;
    if (itemIndex != LIST_CANCEL)
        str = ItemId_GetDescription(BagGetItemIdByPocketPosition(POCKET_TM_CASE, itemIndex));
    else
        str = gText_TMCaseWillBePutAway;
    FillWindowPixelBuffer(WIN_DESCRIPTION, 0);
    TMCase_Print(WIN_DESCRIPTION, FONT_NORMAL, str, 2, 3, 1, 0, 0, COLOR_LIGHT);
}

// Darkens (or subsequently lightens) the blue bg tiles around the description window when a TM/HM is selected.
// shade=0: lighten, shade=1: darken
static void SetDescriptionWindowShade(s32 shade)
{
    SetBgTilemapPalette(2, 0, 12, 30, 8, 2 * shade + 1);
    ScheduleBgCopyTilemapToVram(2);
}

static void PrintListCursor(u8 listTaskId, u8 colorIdx)
{
    PrintListCursorAtRow(ListMenuGetYCoordForPrintingArrowCursor(listTaskId), colorIdx);
}

static void PrintListCursorAtRow(u8 y, u8 colorIdx)
{
    if (colorIdx == COLOR_CURSOR_ERASE)
    {
        // Never used. Would erase cursor (but also a portion of the list text)
        FillWindowPixelRect(WIN_LIST, 0, 0, y, GetFontAttribute(FONT_NORMAL, FONTATTR_MAX_LETTER_WIDTH), GetFontAttribute(FONT_NORMAL, FONTATTR_MAX_LETTER_HEIGHT));
        CopyWindowToVram(WIN_LIST, COPYWIN_GFX);
    }
    else
    {
        TMCase_Print(WIN_LIST, FONT_NORMAL, gText_SelectorArrow2, 0, y, 0, 0, 0, colorIdx);
    }
}

static void CreateListScrollArrows(void)
{
    sTMCaseDynamicResources->scrollArrowsTaskId = AddScrollIndicatorArrowPairParameterized(SCROLL_ARROW_UP,
                                                                                           160, 8, 88,
                                                                                           sTMCaseDynamicResources->numTMs - sTMCaseDynamicResources->maxTMsShown + 1,
                                                                                           TAG_SCROLL_ARROW, TAG_SCROLL_ARROW,
                                                                                           &sTMCaseStaticResources.scrollOffset);
}

static void CreateQuantityScrollArrows(void)
{
    sTMCaseDynamicResources->currItem = 1;
    sTMCaseDynamicResources->scrollArrowsTaskId = AddScrollIndicatorArrowPairParameterized(SCROLL_ARROW_UP,
                                                                                           152, 72, 104,
                                                                                           2,
                                                                                           TAG_SCROLL_ARROW, TAG_SCROLL_ARROW,
                                                                                           &sTMCaseDynamicResources->currItem);
}

static void RemoveScrollArrows(void)
{
    if (sTMCaseDynamicResources->scrollArrowsTaskId != TASK_NONE)
    {
        RemoveScrollIndicatorArrowPair(sTMCaseDynamicResources->scrollArrowsTaskId);
        sTMCaseDynamicResources->scrollArrowsTaskId = TASK_NONE;
    }
}

void ResetTMCaseCursorPos(void)
{
    sTMCaseStaticResources.selectedRow = 0;
    sTMCaseStaticResources.scrollOffset = 0;
}

static void TMCaseSetup_GetTMCount(void)
{
    struct BagPocket * pocket = &gBagPockets[POCKET_TM_CASE - 1];
    u16 i;

    BagPocketCompaction(pocket->itemSlots, pocket->capacity);
    sTMCaseDynamicResources->numTMs = 0;
    for (i = 0; i < pocket->capacity; i++)
    {
        if (pocket->itemSlots[i].itemId == ITEM_NONE)
            break;
        sTMCaseDynamicResources->numTMs++;
    }
    sTMCaseDynamicResources->maxTMsShown = min(sTMCaseDynamicResources->numTMs + 1, 5);
}

static void TMCaseSetup_InitListMenuPositions(void)
{
    if (sTMCaseStaticResources.scrollOffset != 0)
    {
        if (sTMCaseStaticResources.scrollOffset + sTMCaseDynamicResources->maxTMsShown > sTMCaseDynamicResources->numTMs + 1)
            sTMCaseStaticResources.scrollOffset = sTMCaseDynamicResources->numTMs + 1 - sTMCaseDynamicResources->maxTMsShown;
    }
    if (sTMCaseStaticResources.scrollOffset + sTMCaseStaticResources.selectedRow >= sTMCaseDynamicResources->numTMs + 1)
    {
        if (sTMCaseDynamicResources->numTMs + 1 < 2)
            sTMCaseStaticResources.selectedRow = 0;
        else
            sTMCaseStaticResources.selectedRow = sTMCaseDynamicResources->numTMs;
    }
}

static void TMCaseSetup_UpdateVisualMenuOffset(void)
{
    u8 i;
    if (sTMCaseStaticResources.selectedRow > 3)
    {
        for (i = 0; i <= sTMCaseStaticResources.selectedRow - 3 && sTMCaseStaticResources.scrollOffset + sTMCaseDynamicResources->maxTMsShown != sTMCaseDynamicResources->numTMs + 1; i++)
        {
            do {} while (0);
            sTMCaseStaticResources.selectedRow--;
            sTMCaseStaticResources.scrollOffset++;
        }
    }
}

static void DestroyTMCaseBuffers(void)
{
    if (sTMCaseDynamicResources != NULL)
        Free(sTMCaseDynamicResources);
    if (sTilemapBuffer != NULL)
        Free(sTilemapBuffer);
    if (sListMenuItemsBuffer != NULL)
        Free(sListMenuItemsBuffer);
    if (sListMenuStringsBuffer != NULL)
        Free(sListMenuStringsBuffer);
    if (sTMSpritePaletteBuffer != NULL)
        Free(sTMSpritePaletteBuffer);
    FreeAllWindowBuffers();
}

static void Task_BeginFadeOutFromTMCase(u8 taskId)
{
    BeginNormalPaletteFade(PALETTES_ALL, -2, 0, 16, RGB_BLACK);
    gTasks[taskId].func = Task_FadeOutAndCloseTMCase;
}

static void Task_FadeOutAndCloseTMCase(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (!gPaletteFade.active)
    {
        DestroyListMenuTask(tListTaskId, &sTMCaseStaticResources.scrollOffset, &sTMCaseStaticResources.selectedRow);
        if (sTMCaseDynamicResources->nextScreenCallback != NULL)
            SetMainCallback2(sTMCaseDynamicResources->nextScreenCallback);
        else
            SetMainCallback2(sTMCaseStaticResources.exitCallback);
        RemoveScrollArrows();
        DestroyTMCaseBuffers();
        DestroyTask(taskId);
    }
}

static void Task_HandleListInput(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    s32 input;

    if (!gPaletteFade.active)
    {
        if (IsActiveOverworldLinkBusy() != TRUE)
        {
            input = ListMenu_ProcessInput(tListTaskId);
            ListMenuGetScrollAndRow(tListTaskId, &sTMCaseStaticResources.scrollOffset, &sTMCaseStaticResources.selectedRow);
            if (JOY_NEW(SELECT_BUTTON) && sTMCaseStaticResources.allowSelectClose == TRUE)
            {
                PlaySE(SE_SELECT);
                gSpecialVar_ItemId = ITEM_NONE;
                Task_BeginFadeOutFromTMCase(taskId);
            }
            else
            {
                switch (input)
                {
                case LIST_NOTHING_CHOSEN:
                    break;
                case LIST_CANCEL:
                    PlaySE(SE_SELECT);
                    gSpecialVar_ItemId = ITEM_NONE;
                    Task_BeginFadeOutFromTMCase(taskId);
                    break;
                default:
                    PlaySE(SE_SELECT);
                    SetDescriptionWindowShade(1);
                    RemoveScrollArrows();
                    PrintListCursor(tListTaskId, COLOR_CURSOR_SELECTED);
                    tSelection = input;
                    tQuantityOwned = BagGetQuantityByPocketPosition(POCKET_TM_CASE, input);
                    gSpecialVar_ItemId = BagGetItemIdByPocketPosition(POCKET_TM_CASE, input);
                    gTasks[taskId].func = sSelectTMActionTasks[sTMCaseStaticResources.menuType];
                    break;
                }
            }
        }
    }
}

static void ReturnToList(u8 taskId)
{
    SetDescriptionWindowShade(0);
    CreateListScrollArrows();
    gTasks[taskId].func = Task_HandleListInput;
}

// When a TM/HM in the list is selected in the field, create a context
// menu with a list of actions that can be taken.
static void Task_SelectedTMHM_Field(u8 taskId)
{
    u8 * strbuf;
    
    // Create context window
    TMCase_SetWindowBorder2(WIN_SELECTED_MSG);
    if (!MenuHelpers_IsLinkActive() && InUnionRoom() != TRUE)
    {
        // Regular TM/HM context menu
        AddContextMenu(&sTMCaseDynamicResources->contextMenuWindowId, WIN_USE_GIVE_EXIT);
        sTMCaseDynamicResources->menuActionIndices = sMenuActionIndices_Field;
        sTMCaseDynamicResources->numMenuActions = ARRAY_COUNT(sMenuActionIndices_Field);
    }
    else
    {
        // In Union Room, "Use" is removed from the context menu
        AddContextMenu(&sTMCaseDynamicResources->contextMenuWindowId, WIN_GIVE_EXIT);
        sTMCaseDynamicResources->menuActionIndices = sMenuActionIndices_UnionRoom;
        sTMCaseDynamicResources->numMenuActions = ARRAY_COUNT(sMenuActionIndices_UnionRoom);
    }

    // Print context window actions
    AddItemMenuActionTextPrinters(sTMCaseDynamicResources->contextMenuWindowId,
                                  FONT_NORMAL,
                                  GetMenuCursorDimensionByFont(FONT_NORMAL, 0),
                                  2,
                                  0,
                                  GetFontAttribute(FONT_NORMAL, FONTATTR_MAX_LETTER_HEIGHT) + 2,
                                  sTMCaseDynamicResources->numMenuActions,
                                  sMenuActions,
                                  sTMCaseDynamicResources->menuActionIndices);

    Menu_InitCursor(sTMCaseDynamicResources->contextMenuWindowId, FONT_NORMAL, 0, 2, GetFontAttribute(FONT_NORMAL, FONTATTR_MAX_LETTER_HEIGHT) + 2, sTMCaseDynamicResources->numMenuActions, 0);
    
    // Print label text next to the context window
    strbuf = Alloc(256);
    GetTMNumberAndMoveString(strbuf, gSpecialVar_ItemId);
    StringAppend(strbuf, gText_Var1IsSelected + 2); // +2 skips over the stringvar
    TMCase_Print(WIN_SELECTED_MSG, FONT_NORMAL, strbuf, 0, 2, 1, 0, 0, COLOR_DARK);
    Free(strbuf);
    if (IS_HM(gSpecialVar_ItemId))
    {
        PlaceHMTileInWindow(WIN_SELECTED_MSG, 0, 2);
        CopyWindowToVram(WIN_SELECTED_MSG, COPYWIN_GFX);
    }

    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(1);
    gTasks[taskId].func = Task_ContextMenu_HandleInput;
}

static void Task_ContextMenu_HandleInput(u8 taskId)
{
    s8 input;

    if (IsActiveOverworldLinkBusy() != TRUE)
    {
        input = Menu_ProcessInputNoWrapAround();
        switch (input)
        {
        case MENU_B_PRESSED:
            // Run last action in list (Exit)
            PlaySE(SE_SELECT);
            sMenuActions[sTMCaseDynamicResources->menuActionIndices[sTMCaseDynamicResources->numMenuActions - 1]].func.void_u8(taskId);
            break;
        case MENU_NOTHING_CHOSEN:
            break;
        default:
            PlaySE(SE_SELECT);
            sMenuActions[sTMCaseDynamicResources->menuActionIndices[input]].func.void_u8(taskId);
            break;
        }
    }
}

static void Action_Use(u8 taskId)
{
    RemoveContextMenu(&sTMCaseDynamicResources->contextMenuWindowId);
    ClearStdWindowAndFrameToTransparent(WIN_SELECTED_MSG, FALSE);
    ClearWindowTilemap(WIN_SELECTED_MSG);
    PutWindowTilemap(WIN_LIST);
    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(1);
    if (CalculatePlayerPartyCount() == 0)
    {
        PrintError_ThereIsNoPokemon(taskId);
    }
    else
    {
        // Chose a TM/HM to use, exit TM case for party menu
        gItemUseCB = ItemUseCB_TMHM;
        sTMCaseDynamicResources->nextScreenCallback = CB2_ShowPartyMenuForItemUse;
        Task_BeginFadeOutFromTMCase(taskId);
    }
}

static void Action_Give(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u16 itemId = BagGetItemIdByPocketPosition(POCKET_TM_CASE, tSelection);
    RemoveContextMenu(&sTMCaseDynamicResources->contextMenuWindowId);
    ClearStdWindowAndFrameToTransparent(WIN_SELECTED_MSG, FALSE);
    ClearWindowTilemap(WIN_SELECTED_MSG);
    PutWindowTilemap(WIN_DESCRIPTION);
    PutWindowTilemap(WIN_MOVE_INFO_LABELS);
    PutWindowTilemap(WIN_MOVE_INFO);
    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(1);
    if (!IS_HM(itemId))
    {
        if (CalculatePlayerPartyCount() == 0)
        {
            PrintError_ThereIsNoPokemon(taskId);
        }
        else
        {
            sTMCaseDynamicResources->nextScreenCallback = CB2_ChooseMonToGiveItem;
            Task_BeginFadeOutFromTMCase(taskId);
        }
    }
    else
    {
        PrintError_ItemCantBeHeld(taskId);
    }
}

static void PrintError_ThereIsNoPokemon(u8 taskId)
{
    PrintMessageWithFollowupTask(taskId, FONT_NORMAL, gText_ThereIsNoPokemon, Task_WaitButtonAfterErrorPrint);
}

static void PrintError_ItemCantBeHeld(u8 taskId)
{
    CopyItemName(gSpecialVar_ItemId, gStringVar1);
    StringExpandPlaceholders(gStringVar4, gText_ItemCantBeHeld);
    PrintMessageWithFollowupTask(taskId, FONT_NORMAL, gStringVar4, Task_WaitButtonAfterErrorPrint);
}

static void Task_WaitButtonAfterErrorPrint(u8 taskId)
{
    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        CloseMessageAndReturnToList(taskId);
    }
}

static void CloseMessageAndReturnToList(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    DestroyListMenuTask(tListTaskId, &sTMCaseStaticResources.scrollOffset, &sTMCaseStaticResources.selectedRow);
    tListTaskId = ListMenuInit(&gMultiuseListMenuTemplate, sTMCaseStaticResources.scrollOffset, sTMCaseStaticResources.selectedRow);
    PrintListCursor(tListTaskId, COLOR_DARK);
    ClearDialogWindowAndFrameToTransparent(WIN_MESSAGE, FALSE);
    ClearWindowTilemap(WIN_MESSAGE);
    PutWindowTilemap(WIN_DESCRIPTION);
    PutWindowTilemap(WIN_MOVE_INFO_LABELS);
    PutWindowTilemap(WIN_MOVE_INFO);
    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(1);
    ReturnToList(taskId);
}

static void Action_Exit(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    RemoveContextMenu(&sTMCaseDynamicResources->contextMenuWindowId);
    ClearStdWindowAndFrameToTransparent(WIN_SELECTED_MSG, FALSE);
    ClearWindowTilemap(WIN_SELECTED_MSG);
    PutWindowTilemap(WIN_LIST);
    PrintListCursor(tListTaskId, COLOR_DARK);
    PutWindowTilemap(WIN_DESCRIPTION);
    PutWindowTilemap(WIN_MOVE_INFO_LABELS);
    PutWindowTilemap(WIN_MOVE_INFO);
    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(1);
    ReturnToList(taskId);
}

static void Task_SelectedTMHM_GiveParty(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (!IS_HM(BagGetItemIdByPocketPosition(POCKET_TM_CASE, tSelection)))
    {
        sTMCaseDynamicResources->nextScreenCallback = CB2_GiveHoldItem;
        Task_BeginFadeOutFromTMCase(taskId);
    }
    else
    {
        // Can't hold "important" items (e.g. key items)
        PrintError_ItemCantBeHeld(taskId);
    }
}

static void Task_SelectedTMHM_GivePC(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (!IS_HM(BagGetItemIdByPocketPosition(POCKET_TM_CASE, tSelection)))
    {
        sTMCaseDynamicResources->nextScreenCallback = CB2_ReturnToPokeStorage;
        Task_BeginFadeOutFromTMCase(taskId);
    }
    else
    {
        // Can't hold "important" items (e.g. key items)
        PrintError_ItemCantBeHeld(taskId);
    }
}

static void Task_SelectedTMHM_Sell(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (ItemId_GetPrice(gSpecialVar_ItemId) == 0)
    {
        // Can't sell TM/HMs with no price (by default this is just the HMs)
        CopyItemName(gSpecialVar_ItemId, gStringVar1);
        StringExpandPlaceholders(gStringVar4, gText_OhNoICantBuyThat);
        PrintMessageWithFollowupTask(taskId, GetDialogBoxFontId(), gStringVar4, CloseMessageAndReturnToList);
    }
    else
    {
        tQuantitySelected = 1;
        if (tQuantityOwned == 1)
        {
            PrintPlayersMoney();
            Task_AskConfirmSaleWithAmount(taskId);
        }
        else
        {
            if (tQuantityOwned > 99)
                tQuantityOwned = 99;
            CopyItemName(gSpecialVar_ItemId, gStringVar1);
            StringExpandPlaceholders(gStringVar4, gText_HowManyWouldYouLikeToSell);
            PrintMessageWithFollowupTask(taskId, GetDialogBoxFontId(), gStringVar4, Task_InitQuantitySelectUI);
        }
    }
}

static void Task_AskConfirmSaleWithAmount(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    ConvertIntToDecimalStringN(gStringVar3, ItemId_GetPrice(BagGetItemIdByPocketPosition(POCKET_TM_CASE, tSelection)) / 2 * tQuantitySelected, STR_CONV_MODE_LEFT_ALIGN, 6);
    StringExpandPlaceholders(gStringVar4, gText_ICanPayThisMuch_WouldThatBeOkay);
    PrintMessageWithFollowupTask(taskId, GetDialogBoxFontId(), gStringVar4, Task_PlaceYesNoBox);
}

static void Task_PlaceYesNoBox(u8 taskId)
{
    HandleCreateYesNoMenu(taskId, &sYesNoFuncTable);
}

static void Task_SaleOfTMsCanceled(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    ClearStdWindowAndFrameToTransparent(WIN_MONEY, FALSE);
    ClearDialogWindowAndFrameToTransparent(WIN_MESSAGE, FALSE);
    PutWindowTilemap(WIN_LIST);
    PutWindowTilemap(WIN_DESCRIPTION);
    PutWindowTilemap(WIN_TITLE);
    PutWindowTilemap(WIN_MOVE_INFO_LABELS);
    PutWindowTilemap(WIN_MOVE_INFO);
    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(1);
    PrintListCursor(tListTaskId, COLOR_DARK);
    ReturnToList(taskId);
}

static void Task_InitQuantitySelectUI(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    TMCase_SetWindowBorder1(WIN_SELL_QUANTITY);
    ConvertIntToDecimalStringN(gStringVar1, 1, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
    TMCase_Print(WIN_SELL_QUANTITY, FONT_SMALL, gStringVar4, 4, 10, 1, 0, 0, COLOR_DARK);
    SellTM_PrintQuantityAndSalePrice(1, ItemId_GetPrice(BagGetItemIdByPocketPosition(POCKET_TM_CASE, tSelection)) / 2 * tQuantitySelected);
    PrintPlayersMoney();
    CreateQuantityScrollArrows();
    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(1);
    gTasks[taskId].func = Task_QuantitySelect_HandleInput;
}

static void SellTM_PrintQuantityAndSalePrice(s16 quantity, s32 amount)
{
    FillWindowPixelBuffer(WIN_SELL_QUANTITY, 0x11);
    ConvertIntToDecimalStringN(gStringVar1, quantity, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
    TMCase_Print(WIN_SELL_QUANTITY, FONT_SMALL, gStringVar4, 4, 10, 1, 0, 0, COLOR_DARK);
    PrintMoneyAmount(WIN_SELL_QUANTITY, 0x38, 0x0A, amount, 0);
}

static void Task_QuantitySelect_HandleInput(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (AdjustQuantityAccordingToDPadInput(&tQuantitySelected, tQuantityOwned) == 1)
    {
        SellTM_PrintQuantityAndSalePrice(tQuantitySelected, ItemId_GetPrice(BagGetItemIdByPocketPosition(POCKET_TM_CASE, tSelection)) / 2 * tQuantitySelected);
    }
    else if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        ClearStdWindowAndFrameToTransparent(WIN_SELL_QUANTITY, FALSE);
        ScheduleBgCopyTilemapToVram(0);
        ScheduleBgCopyTilemapToVram(1);
        RemoveScrollArrows();
        Task_AskConfirmSaleWithAmount(taskId);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        ClearStdWindowAndFrameToTransparent(WIN_SELL_QUANTITY, FALSE);
        ClearStdWindowAndFrameToTransparent(WIN_MONEY, FALSE);
        ClearDialogWindowAndFrameToTransparent(WIN_MESSAGE, FALSE);
        PutWindowTilemap(WIN_TITLE);
        PutWindowTilemap(WIN_LIST);
        PutWindowTilemap(WIN_DESCRIPTION);
        ScheduleBgCopyTilemapToVram(0);
        ScheduleBgCopyTilemapToVram(1);
        RemoveScrollArrows();
        PrintListCursor(tListTaskId, COLOR_DARK);
        ReturnToList(taskId);
    }
}

static void Task_PrintSaleConfirmedText(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    PutWindowTilemap(WIN_LIST);
    ScheduleBgCopyTilemapToVram(0);
    CopyItemName(gSpecialVar_ItemId, gStringVar1);
    ConvertIntToDecimalStringN(gStringVar3, ItemId_GetPrice(BagGetItemIdByPocketPosition(POCKET_TM_CASE, tSelection)) / 2 * tQuantitySelected, STR_CONV_MODE_LEFT_ALIGN, 6);
    StringExpandPlaceholders(gStringVar4, gText_TurnedOverItemsWorthYen);
    PrintMessageWithFollowupTask(taskId, FONT_NORMAL, gStringVar4, Task_DoSaleOfTMs);
}

static void Task_DoSaleOfTMs(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    PlaySE(SE_SHOP);
    RemoveBagItem(gSpecialVar_ItemId, tQuantitySelected);
    AddMoney(&gSaveBlock1Ptr->money, ItemId_GetPrice(gSpecialVar_ItemId) / 2 * tQuantitySelected);
    RecordItemTransaction(gSpecialVar_ItemId, tQuantitySelected, QL_EVENT_SOLD_ITEM - QL_EVENT_USED_POKEMART);
    DestroyListMenuTask(tListTaskId, &sTMCaseStaticResources.scrollOffset, &sTMCaseStaticResources.selectedRow);
    TMCaseSetup_GetTMCount();
    TMCaseSetup_InitListMenuPositions();
    InitTMCaseListMenuItems();
    tListTaskId = ListMenuInit(&gMultiuseListMenuTemplate, sTMCaseStaticResources.scrollOffset, sTMCaseStaticResources.selectedRow);
    PrintListCursor(tListTaskId, COLOR_CURSOR_SELECTED);
    PrintMoneyAmountInMoneyBox(WIN_MONEY, GetMoney(&gSaveBlock1Ptr->money), 0);
    gTasks[taskId].func = Task_AfterSale_ReturnToList;
}

static void Task_AfterSale_ReturnToList(u8 taskId)
{
    if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        ClearStdWindowAndFrameToTransparent(WIN_MONEY, FALSE);
        ClearDialogWindowAndFrameToTransparent(WIN_MESSAGE, FALSE);
        PutWindowTilemap(WIN_DESCRIPTION);
        PutWindowTilemap(WIN_TITLE);
        PutWindowTilemap(WIN_MOVE_INFO_LABELS);
        PutWindowTilemap(WIN_MOVE_INFO);
        CloseMessageAndReturnToList(taskId);
    }
}

void Pokedude_InitTMCase(void)
{
    sPokedudeBagBackup = AllocZeroed(sizeof(*sPokedudeBagBackup));
    memcpy(sPokedudeBagBackup->bagPocket_TMHM, gSaveBlock1Ptr->bagPocket_TMHM, sizeof(gSaveBlock1Ptr->bagPocket_TMHM));
    memcpy(sPokedudeBagBackup->bagPocket_KeyItems, gSaveBlock1Ptr->bagPocket_KeyItems, sizeof(gSaveBlock1Ptr->bagPocket_KeyItems));
    sPokedudeBagBackup->selectedRow = sTMCaseStaticResources.selectedRow;
    sPokedudeBagBackup->scrollOffset = sTMCaseStaticResources.scrollOffset;
    ClearItemSlots(gSaveBlock1Ptr->bagPocket_TMHM, ARRAY_COUNT(gSaveBlock1Ptr->bagPocket_TMHM));
    ClearItemSlots(gSaveBlock1Ptr->bagPocket_KeyItems, ARRAY_COUNT(gSaveBlock1Ptr->bagPocket_KeyItems));
    ResetTMCaseCursorPos();
    AddBagItem(ITEM_TM01, 1);
    AddBagItem(ITEM_TM03, 1);
    AddBagItem(ITEM_TM09, 1);
    AddBagItem(ITEM_TM35, 1);
    InitTMCase(TMCASE_POKEDUDE, CB2_ReturnToTeachyTV, 0);
}

static void Task_Pokedude_Start(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (!gPaletteFade.active)
    {
        tPokedudeState = 0;
        tPokedudeTimer = 0;
        gTasks[taskId].func = Task_Pokedude_Run;
    }
}

#define POKEDUDE_INPUT_DELAY 101

static void Task_Pokedude_Run(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (JOY_NEW(B_BUTTON))
    {
        if (tPokedudeState < 21)
        {
            tPokedudeState = 21;
            SetTeachyTvControllerModeToResume();
        }
    }

    switch (tPokedudeState)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFF8405, 4, 0, 6, 0);
        SetDescriptionWindowShade(1);
        tPokedudeState++;
        break;
    case 1:
    case 11:
        if (!gPaletteFade.active)
        {
            if (++tPokedudeTimer > POKEDUDE_INPUT_DELAY)
            {
                tPokedudeTimer = 0;
                tPokedudeState++;
            }
        }
        break;
    case 2:
    case 3:
    case 4:
    case 12:
    case 13:
    case 14:
        if (tPokedudeTimer == 0)
        {
            gMain.newKeys = 0;
            gMain.newAndRepeatedKeys = DPAD_DOWN;
            ListMenu_ProcessInput(tListTaskId);
        }
        if (++tPokedudeTimer > POKEDUDE_INPUT_DELAY)
        {
            tPokedudeTimer = 0;
            tPokedudeState++;
        }
        break;
    case 5:
    case 6:
    case 7:
    case 15:
    case 16:
    case 17:
        if (tPokedudeTimer == 0)
        {
            gMain.newKeys = 0;
            gMain.newAndRepeatedKeys = DPAD_UP;
            ListMenu_ProcessInput(tListTaskId);
        }
        if (++tPokedudeTimer > POKEDUDE_INPUT_DELAY)
        {
            tPokedudeTimer = 0;
            tPokedudeState++;
        }
        break;
    case 8:
        SetDescriptionWindowShade(1);
        PrintMessageWithFollowupTask(taskId, FONT_MALE, gPokedudeText_TMTypes, NULL);
        gTasks[taskId].func = Task_Pokedude_Run;
        tPokedudeState++;
        break;
    case 9:
    case 19:
        RunTextPrinters();
        if (!IsTextPrinterActive(WIN_MESSAGE))
            tPokedudeState++;
        break;
    case 10:
        if (JOY_NEW(A_BUTTON | B_BUTTON))
        {
            SetDescriptionWindowShade(0);
            BeginNormalPaletteFade(0x00000400, 0, 6, 0, 0);
            ClearDialogWindowAndFrameToTransparent(WIN_MESSAGE, FALSE);
            ScheduleBgCopyTilemapToVram(1);
            tPokedudeState++;
        }
        break;
    case 18:
        SetDescriptionWindowShade(1);
        PrintMessageWithFollowupTask(taskId, FONT_MALE, gPokedudeText_ReadTMDescription, NULL);
        gTasks[taskId].func = Task_Pokedude_Run; // this function
        tPokedudeState++;
        break;
    case 20:
        if (JOY_NEW(A_BUTTON | B_BUTTON))
            tPokedudeState++;
        break;
    case 21:
        if (!gPaletteFade.active)
        {
            // Restore the player's bag
            memcpy(gSaveBlock1Ptr->bagPocket_TMHM, sPokedudeBagBackup->bagPocket_TMHM, sizeof(gSaveBlock1Ptr->bagPocket_TMHM));
            memcpy(gSaveBlock1Ptr->bagPocket_KeyItems, sPokedudeBagBackup->bagPocket_KeyItems, sizeof(gSaveBlock1Ptr->bagPocket_KeyItems));
            DestroyListMenuTask(tListTaskId, NULL, NULL);
            sTMCaseStaticResources.selectedRow = sPokedudeBagBackup->selectedRow;
            sTMCaseStaticResources.scrollOffset = sPokedudeBagBackup->scrollOffset;
            Free(sPokedudeBagBackup);
            CpuFastCopy(gPlttBufferFaded, gPlttBufferUnfaded, PLTT_SIZE);
            CB2_SetUpReshowBattleScreenAfterMenu();
            BeginNormalPaletteFade(PALETTES_ALL, -2, 0, 16, 0);
            tPokedudeState++;
        }
        break;
    default:
        if (!gPaletteFade.active)
        {
            SetMainCallback2(sTMCaseStaticResources.exitCallback);
            RemoveScrollArrows();
            DestroyTMCaseBuffers();
            DestroyTask(taskId);
        }
        break;
    }
}

static void InitWindowTemplatesAndPals(void)
{
    u8 i;

    InitWindows(sWindowTemplates);
    DeactivateAllTextPrinters();
    LoadUserWindowGfx(0, 0x5B, BG_PLTT_ID(14));
    LoadMenuMessageWindowGfx(0, 0x64, BG_PLTT_ID(11));
    LoadStdWindowGfx(0, 0x78, BG_PLTT_ID(13));
    LoadPalette(gStandardMenuPalette, BG_PLTT_ID(15), PLTT_SIZE_4BPP);
    LoadPalette(gStandardMenuPalette, BG_PLTT_ID(10), PLTT_SIZE_4BPP);
    LoadPalette(sPal3Override, BG_PLTT_ID(15) + 6, sizeof(sPal3Override));
    LoadPalette(sPal3Override, BG_PLTT_ID(13) + 6, sizeof(sPal3Override));
    ListMenuLoadStdPalAt(BG_PLTT_ID(12), 1);
    for (i = 0; i < ARRAY_COUNT(sWindowTemplates) - 1; i++)
        FillWindowPixelBuffer(i, 0x00);
    PutWindowTilemap(WIN_LIST);
    PutWindowTilemap(WIN_DESCRIPTION);
    PutWindowTilemap(WIN_TITLE);
    PutWindowTilemap(WIN_MOVE_INFO_LABELS);
    PutWindowTilemap(WIN_MOVE_INFO);
    ScheduleBgCopyTilemapToVram(0);
}

static void TMCase_Print(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed, u8 colorIdx)
{
    AddTextPrinterParameterized4(windowId, fontId, x, y, letterSpacing, lineSpacing, sTextColors[colorIdx], speed, str);
}

static void TMCase_SetWindowBorder1(u8 windowId)
{
    DrawStdFrameWithCustomTileAndPalette(windowId, FALSE, 0x5B, 14);
}

static void TMCase_SetWindowBorder2(u8 windowId)
{
    DrawStdFrameWithCustomTileAndPalette(windowId, FALSE, 0x78, 13);
}

static void PrintMessageWithFollowupTask(u8 taskId, u8 fontId, const u8 * str, TaskFunc func)
{
    DisplayMessageAndContinueTask(taskId, WIN_MESSAGE, 0x64, 0x0B, fontId, GetTextSpeedSetting(), str, func);
    ScheduleBgCopyTilemapToVram(1);
}

static void PrintTitle(void)
{
    u32 distance = 72 - GetStringWidth(FONT_NORMAL_COPY_1, gText_TMCase, 0);
    AddTextPrinterParameterized3(WIN_TITLE, FONT_NORMAL_COPY_1, distance / 2, 1, sTextColors[COLOR_LIGHT], 0, gText_TMCase);
}

static void DrawMoveInfoLabels(void)
{
    BlitMenuInfoIcon(WIN_MOVE_INFO_LABELS, MENU_INFO_ICON_TYPE, 0, 0);
    BlitMenuInfoIcon(WIN_MOVE_INFO_LABELS, MENU_INFO_ICON_POWER, 0, 12);
    BlitMenuInfoIcon(WIN_MOVE_INFO_LABELS, MENU_INFO_ICON_ACCURACY, 0, 24);
    BlitMenuInfoIcon(WIN_MOVE_INFO_LABELS, MENU_INFO_ICON_PP, 0, 36);
    CopyWindowToVram(WIN_MOVE_INFO_LABELS, COPYWIN_GFX);
}

static void PrintMoveInfo(u16 itemId)
{
    u8 i;
    u16 move;
    const u8 * str;

    FillWindowPixelRect(WIN_MOVE_INFO, 0, 0, 0, 40, 48);
    if (itemId == ITEM_NONE)
    {
        for (i = 0; i < 4; i++)
            TMCase_Print(WIN_MOVE_INFO, FONT_NORMAL_COPY_2, gText_ThreeHyphens, 7, 12 * i, 0, 0, TEXT_SKIP_DRAW, COLOR_MOVE_INFO);
        CopyWindowToVram(WIN_MOVE_INFO, COPYWIN_GFX);
    }
    else
    {
        // Draw type icon
        move = ItemIdToBattleMoveId(itemId);
        BlitMenuInfoIcon(WIN_MOVE_INFO, gBattleMoves[move].type + 1, 0, 0);

        // Print power
        if (gBattleMoves[move].power < 2)
            str = gText_ThreeHyphens;
        else
        {
            ConvertIntToDecimalStringN(gStringVar1, gBattleMoves[move].power, STR_CONV_MODE_RIGHT_ALIGN, 3);
            str = gStringVar1;
        }
        TMCase_Print(WIN_MOVE_INFO, FONT_NORMAL_COPY_2, str, 7, 12, 0, 0, TEXT_SKIP_DRAW, COLOR_MOVE_INFO);

        // Print accuracy
        if (gBattleMoves[move].accuracy == 0)
            str = gText_ThreeHyphens;
        else
        {
            ConvertIntToDecimalStringN(gStringVar1, gBattleMoves[move].accuracy, STR_CONV_MODE_RIGHT_ALIGN, 3);
            str = gStringVar1;
        }
        TMCase_Print(WIN_MOVE_INFO, FONT_NORMAL_COPY_2, str, 7, 24, 0, 0, TEXT_SKIP_DRAW, COLOR_MOVE_INFO);

        // Print PP
        ConvertIntToDecimalStringN(gStringVar1, gBattleMoves[move].pp, STR_CONV_MODE_RIGHT_ALIGN, 3);
        TMCase_Print(WIN_MOVE_INFO, FONT_NORMAL_COPY_2, gStringVar1, 7, 36, 0, 0, TEXT_SKIP_DRAW, COLOR_MOVE_INFO);

        CopyWindowToVram(WIN_MOVE_INFO, COPYWIN_GFX);
    }
}

static void PlaceHMTileInWindow(u8 windowId, u8 x, u8 y)
{
    BlitBitmapToWindow(windowId, gTMCaseHM_Gfx, x, y, 16, 12);
}

static void PrintPlayersMoney(void)
{
    PrintMoneyAmountInMoneyBoxWithBorder(WIN_MONEY, 120, 13, GetMoney(&gSaveBlock1Ptr->money));
}

static void HandleCreateYesNoMenu(u8 taskId, const struct YesNoFuncTable *ptrs)
{
    CreateYesNoMenuWithCallbacks(taskId, &sYesNoWindowTemplate, FONT_NORMAL, 0, 2, 91, 14, ptrs);
}

static u8 AddContextMenu(u8 * windowId, u8 windowIndex)
{
    if (*windowId == WINDOW_NONE)
    {
        *windowId = AddWindow(&sWindowTemplates_ContextMenu[windowIndex]);
        TMCase_SetWindowBorder1(*windowId);
        ScheduleBgCopyTilemapToVram(0);
    }
    return *windowId;
}

static void RemoveContextMenu(u8 * windowId)
{
    ClearStdWindowAndFrameToTransparent(*windowId, FALSE);
    ClearWindowTilemap(*windowId);
    RemoveWindow(*windowId);
    ScheduleBgCopyTilemapToVram(0);
    *windowId = WINDOW_NONE;
}

static u8 CreateDiscSprite(u16 itemId)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_Disc, DISC_BASE_X, DISC_BASE_Y, 0);
    u8 tmIdx;
    if (itemId == ITEM_NONE)
    {
        SetDiscSpritePosition(&gSprites[spriteId], DISC_HIDDEN);
        return spriteId;
    }
    else
    {
        tmIdx = itemId - ITEM_TM01;
        SetDiscSpriteAnim(&gSprites[spriteId], tmIdx);
        TintDiscpriteByType(gBattleMoves[ItemIdToBattleMoveId(itemId)].type);
        SetDiscSpritePosition(&gSprites[spriteId], tmIdx);
        return spriteId;
    }
}

static void SetDiscSpriteAnim(struct Sprite *sprite, u8 tmIdx)
{
    if (tmIdx >= NUM_TECHNICAL_MACHINES)
        StartSpriteAnim(sprite, ANIM_HM);
    else
        StartSpriteAnim(sprite, ANIM_TM);
}

static void TintDiscpriteByType(u8 type)
{
    u8 palOffset = PLTT_ID(IndexOfSpritePaletteTag(TAG_DISC));
    LoadPalette(sTMSpritePaletteBuffer + sTMSpritePaletteOffsetByType[type], OBJ_PLTT_OFFSET + palOffset, PLTT_SIZE_4BPP);
    if (sTMCaseStaticResources.menuType == TMCASE_POKEDUDE)
        BlendPalettes(1 << (16 + palOffset), 4, RGB_BLACK);
}

static void SetDiscSpritePosition(struct Sprite *sprite, u8 tmIdx)
{
    s32 x, y;
    if (tmIdx == DISC_HIDDEN)
    {
        x = 27;
        y = 54;
        sprite->y2 = DISC_CASE_DISTANCE;
    }
    else
    {
        if (tmIdx >= NUM_TECHNICAL_MACHINES)
            tmIdx -= NUM_TECHNICAL_MACHINES;
        else
            tmIdx += NUM_HIDDEN_MACHINES;

        x = DISC_BASE_X - Q_24_8_TO_INT(Q_24_8(14 * tmIdx) / (NUM_TECHNICAL_MACHINES + NUM_HIDDEN_MACHINES));
        y = DISC_BASE_Y + Q_24_8_TO_INT(Q_24_8(8 * tmIdx) / (NUM_TECHNICAL_MACHINES + NUM_HIDDEN_MACHINES));
    }
    sprite->x = x;
    sprite->y = y;
}

#define sItemId  data[0]
#define sState   data[1]

static void SwapDisc(u8 spriteId, u16 itemId)
{
    gSprites[spriteId].sItemId = itemId;
    gSprites[spriteId].sState = 0;
    gSprites[spriteId].callback = SpriteCB_SwapDisc;
}

static void SpriteCB_SwapDisc(struct Sprite *sprite)
{
    switch (sprite->sState)
    {
    case 0:
        // Lower old disc back into case
        if (sprite->y2 >= DISC_CASE_DISTANCE)
        {
            // Old disc is hidden, set up new disc
            if (sprite->sItemId != ITEM_NONE)
            {
                sprite->sState++;
                TintDiscpriteByType(gBattleMoves[ItemIdToBattleMoveId(sprite->sItemId)].type);
                sprite->sItemId -= ITEM_TM01;
                SetDiscSpriteAnim(sprite, sprite->sItemId);
                SetDiscSpritePosition(sprite, sprite->sItemId);
            }
            else
                sprite->callback = SpriteCallbackDummy;
        }
        else
        {
            sprite->y2 += DISC_Y_MOVE;
        }
        break;
    case 1:
        // Raise new disc out of case
        if (sprite->y2 <= 0)
            sprite->callback = SpriteCallbackDummy;
        else
            sprite->y2 -= DISC_Y_MOVE;
    }
}

// - 1 excludes TYPE_MYSTERY
#define NUM_DISC_COLORS ((NUMBER_OF_MON_TYPES - 1) * 16)

static void LoadDiscTypePalettes(void)
{
    struct SpritePalette spritePalette;

    sTMSpritePaletteBuffer = Alloc(NUM_DISC_COLORS * sizeof(u16));
    LZDecompressWram(gTMCaseDiscTypes1_Pal, sTMSpritePaletteBuffer); // Decompress the first 16
    LZDecompressWram(gTMCaseDiscTypes2_Pal, sTMSpritePaletteBuffer + 0x100); // Decompress the rest (Only 17 total, this is just Dragon type)
    spritePalette.data = sTMSpritePaletteBuffer + NUM_DISC_COLORS;
    spritePalette.tag = TAG_DISC;
    LoadSpritePalette(&spritePalette);
}
