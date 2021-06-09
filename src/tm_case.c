#include "global.h"
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
#include "tm_case.h"
#include "menu_indicators.h"
#include "constants/items.h"
#include "constants/songs.h"

#define TM_CASE_TM_TAG 400

struct TMCaseStaticResources
{
    void (* savedCallback)(void);
    u8 tmCaseMenuType;
    bool8 selectToExit;
    u8 filler_06[2];
    u16 selectedRow;
    u16 scrollOffset;
};

struct TMCaseDynamicResources
{
    void (* savedCallback)(void);
    u8 tmSpriteId;
    u8 maxTMsShown;
    u8 numTMs;
    u8 contextMenuWindowId;
    u8 scrollIndicatorArrowPairId;
    u16 currItem;
    const u8 * menuActionIndices;
    u8 numMenuActions;
    s16 seqId;
    u8 filler_14[8];
};

struct PokedudePackBackup
{
    struct ItemSlot bagPocket_TMHM[BAG_TMHM_COUNT];
    struct ItemSlot bagPocket_KeyItems[BAG_KEYITEMS_COUNT];
    u16 tmCaseSelectedRow;
    u16 tmCaseScrollOffset;
};

static EWRAM_DATA struct TMCaseStaticResources sTMCaseStaticResources = {};
static EWRAM_DATA struct TMCaseDynamicResources * sTMCaseDynamicResources = NULL;
static EWRAM_DATA struct PokedudePackBackup * sPokedudePackBackup = NULL;
static EWRAM_DATA void * sTilemapBuffer = NULL; // tilemap buffer
static EWRAM_DATA struct ListMenuItem * sListMenuItemsBuffer = NULL;

// Move names are 13 characters, including EOS.
// The text control prefix for HMs occupies an
// additional 16 characters, for a worst case
// item length of 29.
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
static void TMCase_MoveCursorFunc(s32 itemIndex, bool8 onInit, struct ListMenu *list);
static void TMCase_ItemPrintFunc(u8 windowId, s32 itemId, u8 y);
static void TMCase_MoveCursor_UpdatePrintedDescription(s32 itemIndex);
static void PrintListMenuCursorAt_WithColorIdx(u8 y, u8 colorIdx);
static void CreateTMCaseScrollIndicatorArrowPair_Main(void);
static void TMCaseSetup_GetTMCount(void);
static void TMCaseSetup_InitListMenuPositions(void);
static void TMCaseSetup_UpdateVisualMenuOffset(void);
static void Task_FadeOutAndCloseTMCase(u8 taskId);
static void Task_TMCaseMain(u8 taskId);
static void Task_SelectTMAction_FromFieldBag(u8 taskId);
static void Task_TMContextMenu_HandleInput(u8 taskId);
static void TMHMContextMenuAction_Use(u8 taskId);
static void TMHMContextMenuAction_Give(u8 taskId);
static void PrintError_ThereIsNoPokemon(u8 taskId);
static void PrintError_ItemCantBeHeld(u8 taskId);
static void Task_WaitButtonAfterErrorPrint(u8 taskId);
static void Subtask_CloseContextMenuAndReturnToMain(u8 taskId);
static void TMHMContextMenuAction_Exit(u8 taskId);
static void Task_SelectTMAction_FromPartyGive(u8 taskId);
static void Task_SelectTMAction_FromStoragePC(u8 taskId);
static void Task_SelectTMAction_FromSellMenu(u8 taskId);
static void Task_AskConfirmSaleWithAmount(u8 taskId);
static void Task_PlaceYesNoBox(u8 taskId);
static void Task_SaleOfTMsCanceled(u8 taskId);
static void Task_InitQuantitySelectUI(u8 taskId);
static void SellTM_PrintQuantityAndSalePrice(s16 quantity, s32 value);
static void Task_QuantitySelect_HandleInput(u8 taskId);
static void Task_PrintSaleConfirmedText(u8 taskId);
static void Task_DoSaleOfTMs(u8 taskId);
static void Task_AfterSale_ReturnToList(u8 taskId);
static void Task_TMCaseDude1(u8 taskId);
static void Task_TMCaseDude_Playback(u8 taskId);
static void InitWindowTemplatesAndPals(void);
static void AddTextPrinterParameterized_ColorByIndex(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed, u8 colorIdx);
static void TMCase_SetWindowBorder1(u8 windowId);
static void TMCase_SetWindowBorder2(u8 windowId);
static void TMCase_PrintMessageWithFollowupTask(u8 taskId, u8 fontId, const u8 * str, TaskFunc func);
static void PrintStringTMCaseOnWindow3(void);
static void DrawMoveInfoUIMarkers(void);
static void TMCase_MoveCursor_UpdatePrintedTMInfo(u16 itemId);
static void PlaceHMTileInWindow(u8 windowId, u8 x, u8 y);
static void HandlePrintMoneyOnHand(void);
static void HandleCreateYesNoMenu(u8 taskId, const struct YesNoFuncTable * ptrs);
static u8 AddTMContextMenu(u8 * winId_p, u8 ctxId);
static void RemoveTMContextMenu(u8 * winId_p);
static u8 CreateTMSprite(u16 itemId);
static void SetTMSpriteAnim(struct Sprite * sprite, u8 var);
static void TintTMSpriteByType(u8 type);
static void UpdateTMSpritePosition(struct Sprite * sprite, u8 var);
static void InitSelectedTMSpriteData(u8 a0, u16 itemId);
static void SpriteCB_MoveTMSpriteInCase(struct Sprite * sprite);
static void LoadTMTypePalettes(void);

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

static void (*const sSelectTMActionTasks[])(u8 taskId) = {
    [TMCASE_FROMFIELD]            = Task_SelectTMAction_FromFieldBag,
    [TMCASE_FROMPARTYGIVE]        = Task_SelectTMAction_FromPartyGive,
    [TMCASE_FROMMARTSELL]         = Task_SelectTMAction_FromSellMenu,
    [TMCASE_FROMPOKEMONSTORAGEPC] = Task_SelectTMAction_FromStoragePC
};

enum
{
    TMCASE_ACTION_USE,
    TMCASE_ACTION_GIVE,
    TMCASE_ACTION_EXIT,
};

static const struct MenuAction sMenuActions_UseGiveExit[] = {
    [TMCASE_ACTION_USE]  = {gOtherText_Use,  TMHMContextMenuAction_Use },
    [TMCASE_ACTION_GIVE] = {gOtherText_Give, TMHMContextMenuAction_Give},
    [TMCASE_ACTION_EXIT] = {gOtherText_Exit, TMHMContextMenuAction_Exit},
};

static const u8 sMenuActionIndices_Field[] = {
    TMCASE_ACTION_USE,
    TMCASE_ACTION_GIVE,
    TMCASE_ACTION_EXIT
};

static const u8 sMenuActionIndices_UnionRoom[] = {
    TMCASE_ACTION_GIVE,
    TMCASE_ACTION_EXIT
};

static const struct YesNoFuncTable sYesNoFuncTable = {
    Task_PrintSaleConfirmedText,
    Task_SaleOfTMsCanceled
};

static const u8 sText_ClearTo18[] = _("{CLEAR_TO 18}");
static const u8 sText_SingleSpace[] = _(" ");

// Overloads hues 6-7 of bg pal slots 10 and 13
// Used for the list menu and "TMXX is selected" windows.
static ALIGNED(4) const u16 sHMIconPals[] = {RGB(8, 8, 8), RGB(30, 16, 6)};

enum {
    TMCASE_COL_WHITE,
    TMCASE_COL_DKGRAY,
    TMCASE_COL_LTGRAY,
    TMCASE_COL_DYNAMIC,
    TMCASE_COL_HIDE = 0xFF,
};

enum {
    TMCASE_WIN_LISTMENU,
    TMCASE_WIN_ITEMDESC,
    TMCASE_WIN_TMXXISSELECTED,
    TMCASE_WIN_HEADER,
    TMCASE_WIN_MOVEINFOICONS,
    TMCASE_WIN_MOVEINFOTEXT,
    TMCASE_WIN_MSGBOX,
    TMCASE_WIN_SALECOUNTANDPRICE,
    TMCASE_WIN_PLAYERMONEY,
    TMCASE_WIN_COUNT,
};

enum
{
    TMCASE_CTX_LINK,
    TMCASE_CTX_NOLINK,
};

// Main task
#define tListMenuId            data[0]
#define tSelectedTMIdx         data[1]
#define tSelectedTMQuantity    data[2]
#define tSaleQuantity          data[8]

// Pokedude
#define tDudeState             data[8]
#define tDudeTimer             data[9]

// Sprite
#define sItemId                data[0]
#define sState                 data[1]

static const u8 sTextColors[][3] = {
    [TMCASE_COL_WHITE]   = {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GRAY},
    [TMCASE_COL_DKGRAY]  = {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_LIGHT_GRAY},
    [TMCASE_COL_LTGRAY]  = {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_LIGHT_GRAY, TEXT_COLOR_GREEN},
    [TMCASE_COL_DYNAMIC] = {TEXT_COLOR_TRANSPARENT, TEXT_DYNAMIC_COLOR_5, TEXT_DYNAMIC_COLOR_1}
};

static const struct WindowTemplate sWindowTemplates[] = {
    [TMCASE_WIN_LISTMENU] = {
        .bg = 0,
        .tilemapLeft = 10,
        .tilemapTop = 1,
        .width = 19,
        .height = 10,
        .paletteNum = 0xf,
        .baseBlock = 0x081
    },
    [TMCASE_WIN_ITEMDESC] = {
        .bg = 0,
        .tilemapLeft = 12,
        .tilemapTop = 12,
        .width = 18,
        .height = 8,
        .paletteNum = 0xa,
        .baseBlock = 0x13f
    },
    [TMCASE_WIN_TMXXISSELECTED] = {
        .bg = 1,
        .tilemapLeft = 5,
        .tilemapTop = 15,
        .width = 15,
        .height = 4,
        .paletteNum = 0xd,
        .baseBlock = 0x1f9
    },
    [TMCASE_WIN_HEADER] = {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 1,
        .width = 10,
        .height = 2,
        .paletteNum = 0xf,
        .baseBlock = 0x235
    },
    [TMCASE_WIN_MOVEINFOICONS] = {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 13,
        .width = 5,
        .height = 6,
        .paletteNum = 0xc,
        .baseBlock = 0x249
    },
    [TMCASE_WIN_MOVEINFOTEXT] = {
        .bg = 0,
        .tilemapLeft = 7,
        .tilemapTop = 13,
        .width = 5,
        .height = 6,
        .paletteNum = 0xc,
        .baseBlock = 0x267
    },
    [TMCASE_WIN_MSGBOX] = {
        .bg = 1,
        .tilemapLeft = 2,
        .tilemapTop = 15,
        .width = 26,
        .height = 4,
        .paletteNum = 0xb,
        .baseBlock = 0x285
    },
    [TMCASE_WIN_SALECOUNTANDPRICE] = {
        .bg = 1,
        .tilemapLeft = 17,
        .tilemapTop = 9,
        .width = 12,
        .height = 4,
        .paletteNum = 0xf,
        .baseBlock = 0x2ed
    },
    [TMCASE_WIN_PLAYERMONEY] = {
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
    .paletteNum = 0xf,
    .baseBlock = 0x335
};

static const struct WindowTemplate sTMContextWindowTemplates[] = {
    {
        .bg = 1,
        .tilemapLeft = 22,
        .tilemapTop = 13,
        .width = 7,
        .height = 6,
        .paletteNum = 0xf,
        .baseBlock = 0x1cf
    },
    {
        .bg = 1,
        .tilemapLeft = 22,
        .tilemapTop = 15,
        .width = 7,
        .height = 4,
        .paletteNum = 0xf,
        .baseBlock = 0x01cf
    }
};

static const struct OamData sTMSpriteOamData = {
    .size = 2,
    .priority = 2
};

static const union AnimCmd sTMSpriteAnim0[] = {
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END
};

static const union AnimCmd sTMSpriteAnim1[] = {
    ANIMCMD_FRAME(16, 0),
    ANIMCMD_END
};

static const union AnimCmd *const sTMSpriteAnims[] = {
    sTMSpriteAnim0,
    sTMSpriteAnim1
};

static const struct CompressedSpriteSheet sTMSpriteSheet = {
    (const void *)gTMCase_TMSpriteGfx,
    0x400,
    TM_CASE_TM_TAG
};

static const struct SpriteTemplate sTMSpriteTemplate = {
    TM_CASE_TM_TAG,
    TM_CASE_TM_TAG,
    &sTMSpriteOamData,
    sTMSpriteAnims,
    NULL,
    gDummySpriteAffineAnimTable,
    SpriteCallbackDummy
};

static const u16 sTMSpritePaletteOffsetByType[] = {
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

void InitTMCase(u8 type, void (* callback)(void), u8 selectToCancel)
{
    ResetBufferPointers_NoFree();
    sTMCaseDynamicResources = Alloc(sizeof(struct TMCaseDynamicResources));
    sTMCaseDynamicResources->savedCallback = NULL;
    sTMCaseDynamicResources->scrollIndicatorArrowPairId = 0xFF;
    sTMCaseDynamicResources->contextMenuWindowId = 0xFF;
    if (type != TMCASE_NA)
        sTMCaseStaticResources.tmCaseMenuType = type;
    if (callback != NULL)
        sTMCaseStaticResources.savedCallback = callback;
    if (selectToCancel != 0xFF)
        sTMCaseStaticResources.selectToExit = selectToCancel;
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
        if (MenuHelpers_CallLinkSomething() == TRUE)
            break;
        if (DoSetUpTMCaseUI() == TRUE)
            break;
        if (MenuHelpers_LinkSomething() == TRUE)
            break;
    }
}

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
        DrawMoveInfoUIMarkers();
        gMain.state++;
        break;
    case 12:
        CreateTMCaseListMenuBuffers();
        InitTMCaseListMenuItems();
        gMain.state++;
        break;
    case 13:
        PrintStringTMCaseOnWindow3();
        gMain.state++;
        break;
    case 14:
        if (sTMCaseStaticResources.tmCaseMenuType == TMCASE_FROMBATTLE)
            taskId = CreateTask(Task_TMCaseDude1, 0);
        else
            taskId = CreateTask(Task_TMCaseMain, 0);
        gTasks[taskId].tListMenuId = ListMenuInit(&gMultiuseListMenuTemplate, sTMCaseStaticResources.scrollOffset, sTMCaseStaticResources.selectedRow);
        gMain.state++;
        break;
    case 15:
        CreateTMCaseScrollIndicatorArrowPair_Main();
        gMain.state++;
        break;
    case 16:
        sTMCaseDynamicResources->tmSpriteId = CreateTMSprite(BagGetItemIdByPocketPosition(POCKET_TM_CASE, sTMCaseStaticResources.scrollOffset + sTMCaseStaticResources.selectedRow));
        gMain.state++;
        break;
    case 17:
        BlendPalettes(0xFFFFFFFF, 16, RGB_BLACK);
        gMain.state++;
        break;
    case 18:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
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
    *ptr = AllocZeroed(BG_SCREEN_SIZE);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, sBGTemplates, NELEMS(sBGTemplates));
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
        DecompressAndCopyTileDataToVram(1, gTmCaseGraphics_Tiles, 0, 0, 0);
        sTMCaseDynamicResources->seqId++;
        break;
    case 1:
        if (FreeTempTileDataBuffersIfPossible() != TRUE)
        {
            LZDecompressWram(gTmCaseGraphics_Bg2Map, sTilemapBuffer);
            sTMCaseDynamicResources->seqId++;
        }
        break;
    case 2:
        LZDecompressWram(gTmCaseGraphics_Bg1Map, GetBgTilemapBuffer(1));
        sTMCaseDynamicResources->seqId++;
        break;
    case 3:
        if (gSaveBlock2Ptr->playerGender == MALE)
            LoadCompressedPalette(gTmCaseGraphics_MalePals, 0, 0x80);
        else
            LoadCompressedPalette(gTmCaseGraphics_FemalePals, 0, 0x80);
        sTMCaseDynamicResources->seqId++;
        break;
    case 4:
        LoadCompressedSpriteSheet(&sTMSpriteSheet);
        sTMCaseDynamicResources->seqId++;
        break;
    default:
        LoadTMTypePalettes();
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
    gMultiuseListMenuTemplate.totalItems = sTMCaseDynamicResources->numTMs + 1;
    gMultiuseListMenuTemplate.windowId = TMCASE_WIN_LISTMENU;
    gMultiuseListMenuTemplate.header_X = 0;
    gMultiuseListMenuTemplate.item_X = 8;
    gMultiuseListMenuTemplate.cursor_X = 0;
    gMultiuseListMenuTemplate.lettersSpacing = 0;
    gMultiuseListMenuTemplate.itemVerticalPadding = 2;
    gMultiuseListMenuTemplate.upText_Y = 2;
    gMultiuseListMenuTemplate.maxShowed = sTMCaseDynamicResources->maxTMsShown;
    gMultiuseListMenuTemplate.fontId = 2;
    gMultiuseListMenuTemplate.cursorPal = TEXT_COLOR_DARK_GRAY;
    gMultiuseListMenuTemplate.fillValue = TEXT_COLOR_TRANSPARENT;
    gMultiuseListMenuTemplate.cursorShadowPal = TEXT_COLOR_LIGHT_GRAY;
    gMultiuseListMenuTemplate.moveCursorFunc = TMCase_MoveCursorFunc;
    gMultiuseListMenuTemplate.itemPrintFunc = TMCase_ItemPrintFunc;
    gMultiuseListMenuTemplate.cursorKind = 0;
    gMultiuseListMenuTemplate.scrollMultiple = LIST_NO_MULTIPLE_SCROLL;
}

static void GetTMNumberAndMoveString(u8 * dest, u16 itemId)
{
    StringCopy(gStringVar4, gText_FontSize0);
    if (itemId >= ITEM_HM01)
    {
        StringAppend(gStringVar4, sText_ClearTo18);
        StringAppend(gStringVar4, gText_TMShop_No);
        ConvertIntToDecimalStringN(gStringVar1, itemId - ITEM_HM01 + 1, STR_CONV_MODE_LEADING_ZEROS, 1);
        StringAppend(gStringVar4, gStringVar1);
    }
    else
    {
        StringAppend(gStringVar4, gText_TMShop_No);
        ConvertIntToDecimalStringN(gStringVar1, itemId - ITEM_TM01 + 1, STR_CONV_MODE_LEADING_ZEROS, 2);
        StringAppend(gStringVar4, gStringVar1);
    }
    StringAppend(gStringVar4, sText_SingleSpace);
    StringAppend(gStringVar4, gText_FontSize2);
    StringAppend(gStringVar4, gMoveNames[ItemIdToBattleMoveId(itemId)]);
    StringCopy(dest, gStringVar4);
}

static void TMCase_MoveCursorFunc(s32 itemIndex, bool8 onInit, struct ListMenu *list)
{
    u16 itemId;

    if (itemIndex == LIST_CANCEL)
        itemId = ITEM_NONE;
    else
        itemId = BagGetItemIdByPocketPosition(POCKET_TM_CASE, itemIndex);

    if (onInit != TRUE)
    {
        PlaySE(SE_SELECT);
        InitSelectedTMSpriteData(sTMCaseDynamicResources->tmSpriteId, itemId);
    }
    TMCase_MoveCursor_UpdatePrintedDescription(itemIndex);
    TMCase_MoveCursor_UpdatePrintedTMInfo(itemId);
}

static void TMCase_ItemPrintFunc(u8 windowId, s32 itemId, u8 y)
{
    if (itemId != LIST_CANCEL)
    {
        if (!itemid_is_unique(BagGetItemIdByPocketPosition(POCKET_TM_CASE, itemId)))
        {
            ConvertIntToDecimalStringN(gStringVar1, BagGetQuantityByPocketPosition(POCKET_TM_CASE, itemId), STR_CONV_MODE_RIGHT_ALIGN, 3);
            StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
            AddTextPrinterParameterized_ColorByIndex(windowId, 0, gStringVar4, 0x7E, y, 0, 0, TEXT_SPEED_FF, TMCASE_COL_DKGRAY);
        }
        else
        {
            PlaceHMTileInWindow(windowId, 8, y);
        }
    }
}

static void TMCase_MoveCursor_UpdatePrintedDescription(s32 itemIndex)
{
    const u8 * str;
    if (itemIndex != LIST_CANCEL)
    {
        str = ItemId_GetDescription(BagGetItemIdByPocketPosition(POCKET_TM_CASE, itemIndex));
    }
    else
    {
        str = gText_TMCaseWillBePutAway;
    }
    FillWindowPixelBuffer(TMCASE_WIN_ITEMDESC, PIXEL_FILL(0));
    AddTextPrinterParameterized_ColorByIndex(TMCASE_WIN_ITEMDESC, 2, str, 2, 3, 1, 0, TEXT_SPEED_INSTANT, TMCASE_COL_WHITE);
}

static void FillBG2BottomThirdWithLightColor(s32 colorIdx)
{
    SetBgTilemapPalette(2, 0, 12, 30, 8, 2 * colorIdx + 1);
    ScheduleBgCopyTilemapToVram(2);
}

static void PrintListMenuCursorByID_WithColorIdx(u8 listTaskId, u8 colorIdx)
{
    PrintListMenuCursorAt_WithColorIdx(ListMenuGetYCoordForPrintingArrowCursor(listTaskId), colorIdx);
}

static void PrintListMenuCursorAt_WithColorIdx(u8 y, u8 colorIdx)
{
    if (colorIdx == 0xFF)
    {
        FillWindowPixelRect(TMCASE_WIN_LISTMENU, PIXEL_FILL(0), 0, y, GetFontAttribute(2, FONTATTR_MAX_LETTER_WIDTH), GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT));
        CopyWindowToVram(TMCASE_WIN_LISTMENU, COPYWIN_GFX);
    }
    else
    {
        AddTextPrinterParameterized_ColorByIndex(TMCASE_WIN_LISTMENU, 2, gText_SelectorArrow2, 0, y, 0, 0, TEXT_SPEED_INSTANT, colorIdx);
    }
}

static void CreateTMCaseScrollIndicatorArrowPair_Main(void)
{
    sTMCaseDynamicResources->scrollIndicatorArrowPairId = AddScrollIndicatorArrowPairParameterized(2, 0xA0, 0x08, 0x58, sTMCaseDynamicResources->numTMs - sTMCaseDynamicResources->maxTMsShown + 1, 0x6E, 0x6E, &sTMCaseStaticResources.scrollOffset);
}

static void CreateTMCaseScrollIndicatorArrowPair_SellQuantitySelect(void)
{
    sTMCaseDynamicResources->currItem = 1;
    sTMCaseDynamicResources->scrollIndicatorArrowPairId = AddScrollIndicatorArrowPairParameterized(2, 0x98, 0x48, 0x68, 2, 0x6E, 0x6E, &sTMCaseDynamicResources->currItem);
}

static void RemoveTMCaseScrollIndicatorArrowPair(void)
{
    if (sTMCaseDynamicResources->scrollIndicatorArrowPairId != 0xFF)
    {
        RemoveScrollIndicatorArrowPair(sTMCaseDynamicResources->scrollIndicatorArrowPairId);
        sTMCaseDynamicResources->scrollIndicatorArrowPairId = 0xFF;
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
        for (i = 0; i <= sTMCaseStaticResources.selectedRow - 3; sTMCaseStaticResources.selectedRow--, sTMCaseStaticResources.scrollOffset++, i++)
        {
            if (sTMCaseStaticResources.scrollOffset + sTMCaseDynamicResources->maxTMsShown == sTMCaseDynamicResources->numTMs + 1)
                break;
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
    BeginNormalPaletteFade(0xFFFFFFFF, -2, 0, 16, RGB_BLACK);
    gTasks[taskId].func = Task_FadeOutAndCloseTMCase;
}

static void Task_FadeOutAndCloseTMCase(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (!gPaletteFade.active)
    {
        DestroyListMenuTask(tListMenuId, &sTMCaseStaticResources.scrollOffset, &sTMCaseStaticResources.selectedRow);
        if (sTMCaseDynamicResources->savedCallback != NULL)
            SetMainCallback2(sTMCaseDynamicResources->savedCallback);
        else
            SetMainCallback2(sTMCaseStaticResources.savedCallback);
        RemoveTMCaseScrollIndicatorArrowPair();
        DestroyTMCaseBuffers();
        DestroyTask(taskId);
    }
}

static void Task_TMCaseMain(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    s32 input;

    if (!gPaletteFade.active)
    {
        if (MenuHelpers_CallLinkSomething() != TRUE)
        {
            input = ListMenu_ProcessInput(tListMenuId);
            ListMenuGetScrollAndRow(tListMenuId, &sTMCaseStaticResources.scrollOffset, &sTMCaseStaticResources.selectedRow);
            if (JOY_NEW(SELECT_BUTTON) && sTMCaseStaticResources.selectToExit == TRUE)
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
                    FillBG2BottomThirdWithLightColor(TMCASE_COL_DKGRAY);
                    RemoveTMCaseScrollIndicatorArrowPair();
                    PrintListMenuCursorByID_WithColorIdx(tListMenuId, TMCASE_COL_LTGRAY);
                    tSelectedTMIdx = input;
                    tSelectedTMQuantity = BagGetQuantityByPocketPosition(POCKET_TM_CASE, input);
                    gSpecialVar_ItemId = BagGetItemIdByPocketPosition(POCKET_TM_CASE, input);
                    gTasks[taskId].func = sSelectTMActionTasks[sTMCaseStaticResources.tmCaseMenuType];
                    break;
                }
            }
        }
    }
}

static void Subtask_ReturnToTMCaseMain(u8 taskId)
{
    FillBG2BottomThirdWithLightColor(TMCASE_COL_WHITE);
    CreateTMCaseScrollIndicatorArrowPair_Main();
    gTasks[taskId].func = Task_TMCaseMain;
}

static void Task_SelectTMAction_FromFieldBag(u8 taskId)
{
    u8 * strbuf;
    TMCase_SetWindowBorder2(TMCASE_WIN_TMXXISSELECTED);
    if (!MenuHelpers_LinkSomething() && InUnionRoom() != TRUE)
    {
        AddTMContextMenu(&sTMCaseDynamicResources->contextMenuWindowId, TMCASE_CTX_LINK);
        sTMCaseDynamicResources->menuActionIndices = sMenuActionIndices_Field;
        sTMCaseDynamicResources->numMenuActions = NELEMS(sMenuActionIndices_Field);
    }
    else
    {
        AddTMContextMenu(&sTMCaseDynamicResources->contextMenuWindowId, TMCASE_CTX_NOLINK);
        sTMCaseDynamicResources->menuActionIndices = sMenuActionIndices_UnionRoom;
        sTMCaseDynamicResources->numMenuActions = NELEMS(sMenuActionIndices_UnionRoom);
    }
    AddItemMenuActionTextPrinters(sTMCaseDynamicResources->contextMenuWindowId, 2, GetMenuCursorDimensionByFont(2, FONTATTR_MAX_LETTER_WIDTH), 2, 0, GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT) + 2, sTMCaseDynamicResources->numMenuActions, sMenuActions_UseGiveExit, sTMCaseDynamicResources->menuActionIndices);
    Menu_InitCursor(sTMCaseDynamicResources->contextMenuWindowId, 2, 0, 2, GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT) + 2, sTMCaseDynamicResources->numMenuActions, 0);
    strbuf = Alloc(256);
    GetTMNumberAndMoveString(strbuf, gSpecialVar_ItemId);
    StringAppend(strbuf, gText_Var1IsSelected + 2); // +2 skips over the stringvar
    AddTextPrinterParameterized_ColorByIndex(TMCASE_WIN_TMXXISSELECTED, 2, strbuf, 0, 2, 1, 0, TEXT_SPEED_INSTANT, TMCASE_COL_DKGRAY);
    Free(strbuf);
    if (itemid_is_unique(gSpecialVar_ItemId))
    {
        PlaceHMTileInWindow(TMCASE_WIN_TMXXISSELECTED, 0, 2);
        CopyWindowToVram(TMCASE_WIN_TMXXISSELECTED, COPYWIN_GFX);
    }
    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(1);
    gTasks[taskId].func = Task_TMContextMenu_HandleInput;
}

static void Task_TMContextMenu_HandleInput(u8 taskId)
{
    s8 input;

    if (MenuHelpers_CallLinkSomething() != TRUE)
    {
        input = Menu_ProcessInputNoWrapAround();
        switch (input)
        {
        case MENU_B_PRESSED:
            PlaySE(SE_SELECT);
            sMenuActions_UseGiveExit[sTMCaseDynamicResources->menuActionIndices[sTMCaseDynamicResources->numMenuActions - 1]].func.void_u8(taskId);
            break;
        case MENU_NOTHING_CHOSEN:
            break;
        default:
            PlaySE(SE_SELECT);
            sMenuActions_UseGiveExit[sTMCaseDynamicResources->menuActionIndices[input]].func.void_u8(taskId);
            break;
        }
    }
}

static void TMHMContextMenuAction_Use(u8 taskId)
{
    RemoveTMContextMenu(&sTMCaseDynamicResources->contextMenuWindowId);
    ClearStdWindowAndFrameToTransparent(TMCASE_WIN_TMXXISSELECTED, FALSE);
    ClearWindowTilemap(TMCASE_WIN_TMXXISSELECTED);
    PutWindowTilemap(TMCASE_WIN_LISTMENU);
    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(1);
    if (CalculatePlayerPartyCount() == 0)
    {
        PrintError_ThereIsNoPokemon(taskId);
    }
    else
    {
        gItemUseCB = ItemUseCB_TMHM;
        sTMCaseDynamicResources->savedCallback = CB2_ShowPartyMenuForItemUse;
        Task_BeginFadeOutFromTMCase(taskId);
    }
}

static void TMHMContextMenuAction_Give(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u16 itemId = BagGetItemIdByPocketPosition(POCKET_TM_CASE, tSelectedTMIdx);
    RemoveTMContextMenu(&sTMCaseDynamicResources->contextMenuWindowId);
    ClearStdWindowAndFrameToTransparent(TMCASE_WIN_TMXXISSELECTED, FALSE);
    ClearWindowTilemap(TMCASE_WIN_TMXXISSELECTED);
    PutWindowTilemap(TMCASE_WIN_ITEMDESC);
    PutWindowTilemap(TMCASE_WIN_MOVEINFOICONS);
    PutWindowTilemap(TMCASE_WIN_MOVEINFOTEXT);
    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(1);
    if (!itemid_is_unique(itemId))
    {
        if (CalculatePlayerPartyCount() == 0)
        {
            PrintError_ThereIsNoPokemon(taskId);
        }
        else
        {
            sTMCaseDynamicResources->savedCallback = CB2_ChooseMonToGiveItem;
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
    TMCase_PrintMessageWithFollowupTask(taskId, 2, gText_ThereIsNoPokemon, Task_WaitButtonAfterErrorPrint);
}

static void PrintError_ItemCantBeHeld(u8 taskId)
{
    CopyItemName(gSpecialVar_ItemId, gStringVar1);
    StringExpandPlaceholders(gStringVar4, gText_ItemCantBeHeld);
    TMCase_PrintMessageWithFollowupTask(taskId, 2, gStringVar4, Task_WaitButtonAfterErrorPrint);
}

static void Task_WaitButtonAfterErrorPrint(u8 taskId)
{
    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        Subtask_CloseContextMenuAndReturnToMain(taskId);
    }
}

static void Subtask_CloseContextMenuAndReturnToMain(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    DestroyListMenuTask(tListMenuId, &sTMCaseStaticResources.scrollOffset, &sTMCaseStaticResources.selectedRow);
    tListMenuId = ListMenuInit(&gMultiuseListMenuTemplate, sTMCaseStaticResources.scrollOffset, sTMCaseStaticResources.selectedRow);
    PrintListMenuCursorByID_WithColorIdx(tListMenuId, TMCASE_COL_DKGRAY);
    ClearDialogWindowAndFrameToTransparent(TMCASE_WIN_MSGBOX, FALSE);
    ClearWindowTilemap(TMCASE_WIN_MSGBOX);
    PutWindowTilemap(TMCASE_WIN_ITEMDESC);
    PutWindowTilemap(TMCASE_WIN_MOVEINFOICONS);
    PutWindowTilemap(TMCASE_WIN_MOVEINFOTEXT);
    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(1);
    Subtask_ReturnToTMCaseMain(taskId);
}

static void TMHMContextMenuAction_Exit(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    RemoveTMContextMenu(&sTMCaseDynamicResources->contextMenuWindowId);
    ClearStdWindowAndFrameToTransparent(TMCASE_WIN_TMXXISSELECTED, FALSE);
    ClearWindowTilemap(TMCASE_WIN_TMXXISSELECTED);
    PutWindowTilemap(TMCASE_WIN_LISTMENU);
    PrintListMenuCursorByID_WithColorIdx(tListMenuId, TMCASE_COL_DKGRAY);
    PutWindowTilemap(TMCASE_WIN_ITEMDESC);
    PutWindowTilemap(TMCASE_WIN_MOVEINFOICONS);
    PutWindowTilemap(TMCASE_WIN_MOVEINFOTEXT);
    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(1);
    Subtask_ReturnToTMCaseMain(taskId);
}

static void Task_SelectTMAction_FromPartyGive(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (!itemid_is_unique(BagGetItemIdByPocketPosition(POCKET_TM_CASE, tSelectedTMIdx)))
    {
        sTMCaseDynamicResources->savedCallback = CB2_GiveHoldItem;
        Task_BeginFadeOutFromTMCase(taskId);
    }
    else
    {
        PrintError_ItemCantBeHeld(taskId);
    }
}

static void Task_SelectTMAction_FromStoragePC(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (!itemid_is_unique(BagGetItemIdByPocketPosition(POCKET_TM_CASE, tSelectedTMIdx)))
    {
        sTMCaseDynamicResources->savedCallback = CB2_ReturnToPokeStorage;
        Task_BeginFadeOutFromTMCase(taskId);
    }
    else
    {
        PrintError_ItemCantBeHeld(taskId);
    }
}

static void Task_SelectTMAction_FromSellMenu(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (itemid_get_market_price(gSpecialVar_ItemId) == 0)
    {
        CopyItemName(gSpecialVar_ItemId, gStringVar1);
        StringExpandPlaceholders(gStringVar4, gText_OhNoICantBuyThat);
        TMCase_PrintMessageWithFollowupTask(taskId, GetDialogBoxFontId(), gStringVar4, Subtask_CloseContextMenuAndReturnToMain);
    }
    else
    {
        tSaleQuantity = 1;
        if (tSelectedTMQuantity == 1)
        {
            HandlePrintMoneyOnHand();
            Task_AskConfirmSaleWithAmount(taskId);
        }
        else
        {
            if (tSelectedTMQuantity > 99)
                tSelectedTMQuantity = 99;
            CopyItemName(gSpecialVar_ItemId, gStringVar1);
            StringExpandPlaceholders(gStringVar4, gText_HowManyWouldYouLikeToSell);
            TMCase_PrintMessageWithFollowupTask(taskId, GetDialogBoxFontId(), gStringVar4, Task_InitQuantitySelectUI);
        }
    }
}

static void Task_AskConfirmSaleWithAmount(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    ConvertIntToDecimalStringN(gStringVar3, itemid_get_market_price(BagGetItemIdByPocketPosition(POCKET_TM_CASE, tSelectedTMIdx)) / 2 * tSaleQuantity, STR_CONV_MODE_LEFT_ALIGN, 6);
    StringExpandPlaceholders(gStringVar4, gText_ICanPayThisMuch_WouldThatBeOkay);
    TMCase_PrintMessageWithFollowupTask(taskId, GetDialogBoxFontId(), gStringVar4, Task_PlaceYesNoBox);
}

static void Task_PlaceYesNoBox(u8 taskId)
{
    HandleCreateYesNoMenu(taskId, &sYesNoFuncTable);
}

static void Task_SaleOfTMsCanceled(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    ClearStdWindowAndFrameToTransparent(TMCASE_WIN_PLAYERMONEY, FALSE);
    ClearDialogWindowAndFrameToTransparent(TMCASE_WIN_MSGBOX, FALSE);
    PutWindowTilemap(TMCASE_WIN_LISTMENU);
    PutWindowTilemap(TMCASE_WIN_ITEMDESC);
    PutWindowTilemap(TMCASE_WIN_HEADER);
    PutWindowTilemap(TMCASE_WIN_MOVEINFOICONS);
    PutWindowTilemap(TMCASE_WIN_MOVEINFOTEXT);
    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(1);
    PrintListMenuCursorByID_WithColorIdx(tListMenuId, TMCASE_COL_DKGRAY);
    Subtask_ReturnToTMCaseMain(taskId);
}

static void Task_InitQuantitySelectUI(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    TMCase_SetWindowBorder1(TMCASE_WIN_SALECOUNTANDPRICE);
    ConvertIntToDecimalStringN(gStringVar1, 1, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
    AddTextPrinterParameterized_ColorByIndex(TMCASE_WIN_SALECOUNTANDPRICE, 0, gStringVar4, 4, 10, 1, 0, TEXT_SPEED_INSTANT, 1);
    SellTM_PrintQuantityAndSalePrice(1, itemid_get_market_price(BagGetItemIdByPocketPosition(POCKET_TM_CASE, tSelectedTMIdx)) / 2 * tSaleQuantity);
    HandlePrintMoneyOnHand();
    CreateTMCaseScrollIndicatorArrowPair_SellQuantitySelect();
    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(1);
    gTasks[taskId].func = Task_QuantitySelect_HandleInput;
}

static void SellTM_PrintQuantityAndSalePrice(s16 quantity, s32 amount)
{
    FillWindowPixelBuffer(TMCASE_WIN_SALECOUNTANDPRICE, PIXEL_FILL(1));
    ConvertIntToDecimalStringN(gStringVar1, quantity, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
    AddTextPrinterParameterized_ColorByIndex(TMCASE_WIN_SALECOUNTANDPRICE, 0, gStringVar4, 4, 10, 1, 0, TEXT_SPEED_INSTANT, TMCASE_COL_DKGRAY);
    PrintMoneyAmount(TMCASE_WIN_SALECOUNTANDPRICE, 0x38, 0x0A, amount, TEXT_SPEED_INSTANT);
}

static void Task_QuantitySelect_HandleInput(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (AdjustQuantityAccordingToDPadInput(&tSaleQuantity, tSelectedTMQuantity) == TRUE)
    {
        SellTM_PrintQuantityAndSalePrice(tSaleQuantity, itemid_get_market_price(BagGetItemIdByPocketPosition(POCKET_TM_CASE, tSelectedTMIdx)) / 2 * tSaleQuantity);
    }
    else if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        ClearStdWindowAndFrameToTransparent(TMCASE_WIN_SALECOUNTANDPRICE, FALSE);
        ScheduleBgCopyTilemapToVram(0);
        ScheduleBgCopyTilemapToVram(1);
        RemoveTMCaseScrollIndicatorArrowPair();
        Task_AskConfirmSaleWithAmount(taskId);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        ClearStdWindowAndFrameToTransparent(TMCASE_WIN_SALECOUNTANDPRICE, FALSE);
        ClearStdWindowAndFrameToTransparent(TMCASE_WIN_PLAYERMONEY, FALSE);
        ClearDialogWindowAndFrameToTransparent(TMCASE_WIN_MSGBOX, FALSE);
        PutWindowTilemap(TMCASE_WIN_HEADER);
        PutWindowTilemap(TMCASE_WIN_LISTMENU);
        PutWindowTilemap(TMCASE_WIN_ITEMDESC);
        ScheduleBgCopyTilemapToVram(0);
        ScheduleBgCopyTilemapToVram(1);
        RemoveTMCaseScrollIndicatorArrowPair();
        PrintListMenuCursorByID_WithColorIdx(tListMenuId, TMCASE_COL_DKGRAY);
        Subtask_ReturnToTMCaseMain(taskId);
    }
}

static void Task_PrintSaleConfirmedText(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    PutWindowTilemap(TMCASE_WIN_LISTMENU);
    ScheduleBgCopyTilemapToVram(0);
    CopyItemName(gSpecialVar_ItemId, gStringVar1);
    ConvertIntToDecimalStringN(gStringVar3, itemid_get_market_price(BagGetItemIdByPocketPosition(POCKET_TM_CASE, tSelectedTMIdx)) / 2 * tSaleQuantity, STR_CONV_MODE_LEFT_ALIGN, 6);
    StringExpandPlaceholders(gStringVar4, gText_TurnedOverItemsWorthYen);
    TMCase_PrintMessageWithFollowupTask(taskId, 2, gStringVar4, Task_DoSaleOfTMs);
}

static void Task_DoSaleOfTMs(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    PlaySE(SE_SHOP);
    RemoveBagItem(gSpecialVar_ItemId, tSaleQuantity);
    AddMoney(&gSaveBlock1Ptr->money, itemid_get_market_price(gSpecialVar_ItemId) / 2 * tSaleQuantity);
    RecordItemPurchase(gSpecialVar_ItemId, tSaleQuantity, QL_SHOPACTION_SELL);
    DestroyListMenuTask(tListMenuId, &sTMCaseStaticResources.scrollOffset, &sTMCaseStaticResources.selectedRow);
    TMCaseSetup_GetTMCount();
    TMCaseSetup_InitListMenuPositions();
    InitTMCaseListMenuItems();
    tListMenuId = ListMenuInit(&gMultiuseListMenuTemplate, sTMCaseStaticResources.scrollOffset, sTMCaseStaticResources.selectedRow);
    PrintListMenuCursorByID_WithColorIdx(tListMenuId, TMCASE_COL_LTGRAY);
    PrintMoneyAmountInMoneyBox(TMCASE_WIN_PLAYERMONEY, GetMoney(&gSaveBlock1Ptr->money), TEXT_SPEED_INSTANT);
    gTasks[taskId].func = Task_AfterSale_ReturnToList;
}

static void Task_AfterSale_ReturnToList(u8 taskId)
{
    if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        ClearStdWindowAndFrameToTransparent(TMCASE_WIN_PLAYERMONEY, FALSE);
        ClearDialogWindowAndFrameToTransparent(TMCASE_WIN_MSGBOX, FALSE);
        PutWindowTilemap(TMCASE_WIN_ITEMDESC);
        PutWindowTilemap(TMCASE_WIN_HEADER);
        PutWindowTilemap(TMCASE_WIN_MOVEINFOICONS);
        PutWindowTilemap(TMCASE_WIN_MOVEINFOTEXT);
        Subtask_CloseContextMenuAndReturnToMain(taskId);
    }
}

void Pokedude_InitTMCase(void)
{
    sPokedudePackBackup = AllocZeroed(sizeof(*sPokedudePackBackup));
    memcpy(sPokedudePackBackup->bagPocket_TMHM, gSaveBlock1Ptr->bagPocket_TMHM, sizeof(gSaveBlock1Ptr->bagPocket_TMHM));
    memcpy(sPokedudePackBackup->bagPocket_KeyItems, gSaveBlock1Ptr->bagPocket_KeyItems, sizeof(gSaveBlock1Ptr->bagPocket_KeyItems));
    sPokedudePackBackup->tmCaseSelectedRow = sTMCaseStaticResources.selectedRow;
    sPokedudePackBackup->tmCaseScrollOffset = sTMCaseStaticResources.scrollOffset;
    ClearItemSlots(gSaveBlock1Ptr->bagPocket_TMHM, NELEMS(gSaveBlock1Ptr->bagPocket_TMHM));
    ClearItemSlots(gSaveBlock1Ptr->bagPocket_KeyItems, NELEMS(gSaveBlock1Ptr->bagPocket_KeyItems));
    ResetTMCaseCursorPos();
    AddBagItem(ITEM_TM01, 1);
    AddBagItem(ITEM_TM03, 1);
    AddBagItem(ITEM_TM09, 1);
    AddBagItem(ITEM_TM35, 1);
    InitTMCase(TMCASE_FROMBATTLE, CB2_ReturnToTeachyTV, FALSE);
}

static void Task_TMCaseDude1(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (!gPaletteFade.active)
    {
        tDudeState = 0;
        tDudeTimer = 0;
        gTasks[taskId].func = Task_TMCaseDude_Playback;
    }
}

static void Task_TMCaseDude_Playback(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (JOY_NEW(B_BUTTON))
    {
        if (tDudeState < 21)
        {
            tDudeState = 21;
            SetTeachyTvControllerModeToResume();
        }
    }

    switch (tDudeState)
    {
    case 0:
        BeginNormalPaletteFade(~0x7BFA, 4, 0, 6, RGB_BLACK);
        FillBG2BottomThirdWithLightColor(TMCASE_COL_DKGRAY);
        tDudeState++;
        break;
    case 1:
    case 11:
        if (!gPaletteFade.active)
        {
            tDudeTimer++;
            if (tDudeTimer > 101)
            {
                tDudeTimer = 0;
                tDudeState++;
            }
        }
        break;
    case 2:
    case 3:
    case 4:
    case 12:
    case 13:
    case 14:
        if (tDudeTimer == 0)
        {
            gMain.newKeys = 0;
            gMain.newAndRepeatedKeys = DPAD_DOWN;
            ListMenu_ProcessInput(tListMenuId);
        }
        tDudeTimer++;
        if (tDudeTimer > 101)
        {
            tDudeTimer = 0;
            tDudeState++;
        }
        break;
    case 5:
    case 6:
    case 7:
    case 15:
    case 16:
    case 17:
        if (tDudeTimer == 0)
        {
            gMain.newKeys = 0;
            gMain.newAndRepeatedKeys = DPAD_UP;
            ListMenu_ProcessInput(tListMenuId);
        }
        tDudeTimer++;
        if (tDudeTimer > 101)
        {
            tDudeTimer = 0;
            tDudeState++;
        }
        break;
    case 8:
        FillBG2BottomThirdWithLightColor(TMCASE_COL_DKGRAY);
        TMCase_PrintMessageWithFollowupTask(taskId, 4, gPokedudeText_TMTypes, NULL);
        gTasks[taskId].func = Task_TMCaseDude_Playback;
        tDudeState++;
        break;
    case 9:
    case 19:
        RunTextPrinters();
        if (!IsTextPrinterActive(TMCASE_WIN_MSGBOX))
            tDudeState++;
        break;
    case 10:
        if (JOY_NEW(A_BUTTON | B_BUTTON))
        {
            FillBG2BottomThirdWithLightColor(TMCASE_COL_WHITE);
            BeginNormalPaletteFade(0x00000400, 0, 6, 0, RGB_BLACK);
            ClearDialogWindowAndFrameToTransparent(TMCASE_WIN_MSGBOX, FALSE);
            ScheduleBgCopyTilemapToVram(1);
            tDudeState++;
        }
        break;
    case 18:
        FillBG2BottomThirdWithLightColor(TMCASE_COL_DKGRAY);
        TMCase_PrintMessageWithFollowupTask(taskId, 4, gPokedudeText_ReadTMDescription, NULL);
        gTasks[taskId].func = Task_TMCaseDude_Playback; // this function
        tDudeState++;
        break;
    case 20:
        if (JOY_NEW(A_BUTTON | B_BUTTON))
            tDudeState++;
        break;
    case 21:
        if (!gPaletteFade.active)
        {
            memcpy(gSaveBlock1Ptr->bagPocket_TMHM, sPokedudePackBackup->bagPocket_TMHM, sizeof(gSaveBlock1Ptr->bagPocket_TMHM));
            memcpy(gSaveBlock1Ptr->bagPocket_KeyItems, sPokedudePackBackup->bagPocket_KeyItems, sizeof(gSaveBlock1Ptr->bagPocket_KeyItems));
            DestroyListMenuTask(tListMenuId, NULL, NULL);
            sTMCaseStaticResources.selectedRow = sPokedudePackBackup->tmCaseSelectedRow;
            sTMCaseStaticResources.scrollOffset = sPokedudePackBackup->tmCaseScrollOffset;
            Free(sPokedudePackBackup);
            CpuFastCopy(gPlttBufferFaded, gPlttBufferUnfaded, PLTT_SIZE);
            CB2_SetUpReshowBattleScreenAfterMenu();
            BeginNormalPaletteFade(0xFFFFFFFF, -2, 0, 16, RGB_BLACK);
            tDudeState++;
        }
        break;
    default:
        if (!gPaletteFade.active)
        {
            SetMainCallback2(sTMCaseStaticResources.savedCallback);
            RemoveTMCaseScrollIndicatorArrowPair();
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
    TextWindow_SetUserSelectedFrame(TMCASE_WIN_LISTMENU, 0x5B, 0xE0);
    TextWindow_LoadResourcesStdFrame0(TMCASE_WIN_LISTMENU, 0x64, 0xB0);
    TextWindow_SetStdFrame0_WithPal(TMCASE_WIN_LISTMENU, 0x78, 0xD0);
    LoadPalette(gTMCaseMainWindowPalette, 0xF0, 0x20);
    LoadPalette(gTMCaseMainWindowPalette, 0xA0, 0x20);
    LoadPalette(sHMIconPals, 0xF6, 0x04);
    LoadPalette(sHMIconPals, 0xD6, 0x04);
    ListMenuLoadStdPalAt(0xc0, 0x01);
    for (i = TMCASE_WIN_LISTMENU; i < TMCASE_WIN_COUNT; i++)
        FillWindowPixelBuffer(i, PIXEL_FILL(0));
    PutWindowTilemap(TMCASE_WIN_LISTMENU);
    PutWindowTilemap(TMCASE_WIN_ITEMDESC);
    PutWindowTilemap(TMCASE_WIN_HEADER);
    PutWindowTilemap(TMCASE_WIN_MOVEINFOICONS);
    PutWindowTilemap(TMCASE_WIN_MOVEINFOTEXT);
    ScheduleBgCopyTilemapToVram(0);
}

static void AddTextPrinterParameterized_ColorByIndex(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed, u8 colorIdx)
{
    AddTextPrinterParameterized4(windowId, fontId, x, y, letterSpacing, lineSpacing, sTextColors[colorIdx], speed, str);
}

static void TMCase_SetWindowBorder1(u8 windowId)
{
    DrawStdFrameWithCustomTileAndPalette(windowId, FALSE, 0x5B, 0x0E);
}

static void TMCase_SetWindowBorder2(u8 windowId)
{
    DrawStdFrameWithCustomTileAndPalette(windowId, FALSE, 0x78, 0x0D);
}

static void TMCase_PrintMessageWithFollowupTask(u8 taskId, u8 fontId, const u8 * str, TaskFunc func)
{
    DisplayMessageAndContinueTask(taskId, TMCASE_WIN_MSGBOX, 0x64, 0x0B, fontId, GetTextSpeedSetting(), str, func);
    ScheduleBgCopyTilemapToVram(1);
}

static void PrintStringTMCaseOnWindow3(void)
{
    AddTextPrinterParameterized3(TMCASE_WIN_HEADER, 1, PRINT_X_CENTER_ALIGN(gText_TMCase, 0, 72, 1, 0), 1, sTextColors[TMCASE_COL_WHITE], TEXT_SPEED_INSTANT, gText_TMCase);
}

static void DrawMoveInfoUIMarkers(void)
{
    BlitMoveInfoIcon(TMCASE_WIN_MOVEINFOICONS, MOVEICON_TYPEICON, 0, 0);
    BlitMoveInfoIcon(TMCASE_WIN_MOVEINFOICONS, MOVEICON_POWER, 0, 12);
    BlitMoveInfoIcon(TMCASE_WIN_MOVEINFOICONS, MOVEICON_ACCURACY, 0, 24);
    BlitMoveInfoIcon(TMCASE_WIN_MOVEINFOICONS, MOVEICON_PP, 0, 36);
    CopyWindowToVram(TMCASE_WIN_MOVEINFOICONS, COPYWIN_GFX);
}

static void TMCase_MoveCursor_UpdatePrintedTMInfo(u16 itemId)
{
    u8 i;
    u16 move;
    const u8 * str;

    FillWindowPixelRect(TMCASE_WIN_MOVEINFOTEXT, 0, 0, 0, 40, 48);
    if (itemId == ITEM_NONE)
    {
        for (i = 0; i < 4; i++)
        {
            AddTextPrinterParameterized_ColorByIndex(TMCASE_WIN_MOVEINFOTEXT, 3, gText_ThreeHyphens, 7, 12 * i, 0, 0, TEXT_SPEED_FF, TMCASE_COL_DYNAMIC);
        }
        CopyWindowToVram(TMCASE_WIN_MOVEINFOTEXT, COPYWIN_GFX);
    }
    else
    {
        move = ItemIdToBattleMoveId(itemId);
        BlitMoveInfoIcon(TMCASE_WIN_MOVEINFOTEXT, MOVEICON_TYPE(gBattleMoves[move].type), 0, 0);
        if (gBattleMoves[move].power < 2)
            str = gText_ThreeHyphens;
        else
        {
            ConvertIntToDecimalStringN(gStringVar1, gBattleMoves[move].power, STR_CONV_MODE_RIGHT_ALIGN, TMCASE_COL_DYNAMIC);
            str = gStringVar1;
        }
        AddTextPrinterParameterized_ColorByIndex(TMCASE_WIN_MOVEINFOTEXT, 3, str, 7, 12, 0, 0, TEXT_SPEED_FF, TMCASE_COL_DYNAMIC);
        if (gBattleMoves[move].accuracy == 0)
            str = gText_ThreeHyphens;
        else
        {
            ConvertIntToDecimalStringN(gStringVar1, gBattleMoves[move].accuracy, STR_CONV_MODE_RIGHT_ALIGN, 3);
            str = gStringVar1;
        }
        AddTextPrinterParameterized_ColorByIndex(TMCASE_WIN_MOVEINFOTEXT, 3, str, 7, 24, 0, 0, TEXT_SPEED_FF, TMCASE_COL_DYNAMIC);
        ConvertIntToDecimalStringN(gStringVar1, gBattleMoves[move].pp, STR_CONV_MODE_RIGHT_ALIGN, 3);
        AddTextPrinterParameterized_ColorByIndex(TMCASE_WIN_MOVEINFOTEXT, 3, gStringVar1, 7, 36, 0, 0, TEXT_SPEED_FF, TMCASE_COL_DYNAMIC);
        CopyWindowToVram(5, COPYWIN_GFX);
    }
}

static void PlaceHMTileInWindow(u8 windowId, u8 x, u8 y)
{
    BlitBitmapToWindow(windowId, gTmCase_HMBitmapIcon, x, y, 16, 12);
}

static void HandlePrintMoneyOnHand(void)
{
    PrintMoneyAmountInMoneyBoxWithBorder(TMCASE_WIN_PLAYERMONEY, 0x78, 0xD, GetMoney(&gSaveBlock1Ptr->money));
}

static void HandleCreateYesNoMenu(u8 taskId, const struct YesNoFuncTable *ptrs)
{
    CreateYesNoMenuWithCallbacks(taskId, &sYesNoWindowTemplate, 2, 0, 2, 0x5B, 0x0E, ptrs);
}

static u8 AddTMContextMenu(u8 * winId_p, u8 ctxId)
{
    if (*winId_p == 0xFF)
    {
        *winId_p = AddWindow(&sTMContextWindowTemplates[ctxId]);
        TMCase_SetWindowBorder1(*winId_p);
        ScheduleBgCopyTilemapToVram(0);
    }
    return *winId_p;
}

static void RemoveTMContextMenu(u8 * winId_p)
{
    ClearStdWindowAndFrameToTransparent(*winId_p, FALSE);
    ClearWindowTilemap(*winId_p);
    RemoveWindow(*winId_p);
    ScheduleBgCopyTilemapToVram(0);
    *winId_p = 0xFF;
}

static u8 CreateTMSprite(u16 itemId)
{
    u8 spriteId = CreateSprite(&sTMSpriteTemplate, 0x29, 0x2E, 0);
    u8 r5;
    if (itemId == ITEM_NONE)
    {
        UpdateTMSpritePosition(&gSprites[spriteId], 0xFF);
        return spriteId;
    }
    else
    {
        r5 = itemId - ITEM_TM01;
        SetTMSpriteAnim(&gSprites[spriteId], r5);
        TintTMSpriteByType(gBattleMoves[ItemIdToBattleMoveId(itemId)].type);
        UpdateTMSpritePosition(&gSprites[spriteId], r5);
        return spriteId;
    }
}

static void SetTMSpriteAnim(struct Sprite * sprite, u8 idx)
{
    if (idx >= 50)
        StartSpriteAnim(sprite, 1);
    else
        StartSpriteAnim(sprite, 0);
}

static void TintTMSpriteByType(u8 type)
{
    u8 palIndex = IndexOfSpritePaletteTag(TM_CASE_TM_TAG) << 4;
    LoadPalette(sTMSpritePaletteBuffer + sTMSpritePaletteOffsetByType[type], 0x100 | palIndex, 0x20);
    if (sTMCaseStaticResources.tmCaseMenuType == TMCASE_FROMBATTLE)
    {
        BlendPalettes(1 << (0x10 + palIndex), 4, RGB_BLACK);
    }
}

static void UpdateTMSpritePosition(struct Sprite * sprite, u8 var)
{
    s32 x, y;
    if (var == 0xFF)
    {
        x = 0x1B;
        y = 0x36;
        sprite->pos2.y = 0x14;
    }
    else
    {
        if (var >= 50)
            var -= 50;
        else
            var += 8;
        x = 0x29 - (((0xE00 * var) / 58) >> 8);
        y = 0x2E + (((0x800 * var) / 58) >> 8);
    }
    sprite->pos1.x = x;
    sprite->pos1.y = y;
}

static void InitSelectedTMSpriteData(u8 spriteId, u16 itemId)
{
    gSprites[spriteId].sItemId = itemId;
    gSprites[spriteId].sState = 0;
    gSprites[spriteId].callback = SpriteCB_MoveTMSpriteInCase;
}

static void SpriteCB_MoveTMSpriteInCase(struct Sprite * sprite)
{
    switch (sprite->sState)
    {
    case 0:
        if (sprite->pos2.y >= 20)
        {
            if (sprite->sItemId != ITEM_NONE)
            {
                sprite->sState++;
                TintTMSpriteByType(gBattleMoves[ItemIdToBattleMoveId(sprite->sItemId)].type);
                sprite->sItemId -= ITEM_TM01;
                SetTMSpriteAnim(sprite, sprite->sItemId);
                UpdateTMSpritePosition(sprite, sprite->sItemId);
            }
            else
                sprite->callback = SpriteCallbackDummy;
        }
        else
        {
            sprite->pos2.y += 10;
        }
        break;
    case 1:
        if (sprite->pos2.y <= 0)
            sprite->callback = SpriteCallbackDummy;
        else
            sprite->pos2.y -= 10;
    }
}

static void LoadTMTypePalettes(void)
{
    struct SpritePalette spritePalette;

    sTMSpritePaletteBuffer = Alloc(0x110 * sizeof(u16));
    LZDecompressWram(gTMCase_TMSpritePalsByType1, sTMSpritePaletteBuffer);
    LZDecompressWram(gTMCase_TMSpritePalsByType2, sTMSpritePaletteBuffer + 0x100);
    spritePalette.data = sTMSpritePaletteBuffer + 0x110;
    spritePalette.tag = TM_CASE_TM_TAG;
    LoadSpritePalette(&spritePalette);
}

#undef tListMenuId
#undef tSelectedTMIdx
#undef tSelectedTMQuantity
#undef tSaleQuantity
#undef tDudeState
#undef tDudeTimer
#undef sItemId
#undef sState
