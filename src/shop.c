#include "global.h"
#include "gflib.h"
#include "shop.h"
#include "menu.h"
#include "data.h"
#include "graphics.h"
#include "strings.h"
#include "list_menu.h"
#include "new_menu_helpers.h"
#include "party_menu.h"
#include "field_specials.h"
#include "field_weather.h"
#include "task.h"
#include "item.h"
#include "item_menu.h"
#include "overworld.h"
#include "field_fadetransition.h"
#include "scanline_effect.h"
#include "item_menu_icons.h"
#include "decompress.h"
#include "menu_indicators.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "event_object_movement.h"
#include "money.h"
#include "quest_log.h"
#include "script.h"
#include "constants/songs.h"
#include "constants/items.h"
#include "constants/game_stat.h"
#include "constants/field_weather.h"

#define tItemCount data[1]
#define tItemId data[5]
#define tListTaskId data[7]

// mart types
enum
{
    MART_TYPE_REGULAR = 0,
    MART_TYPE_TMHM,
    MART_TYPE_DECOR,
    MART_TYPE_DECOR2,
};

// shop view window NPC info enum
enum
{
    OBJECT_EVENT_ID,
    X_COORD,
    Y_COORD,
    ANIM_NUM
};

struct ShopData
{
    /*0x00*/ void (*callback)(void);
    /*0x04*/ const u16 *itemList;
    /*0x08*/ u32 itemPrice;
    /*0x0C*/ u16 selectedRow;
    /*0x0E*/ u16 scrollOffset;
    /*0x10*/ u16 itemCount;
    /*0x12*/ u16 field12;
    /*0x14*/ u16 maxQuantity;
    /*0x16*/ u16 martType:4;    // 0x1 if tm list
             u16 unk16_4:5;
             u16 itemSlot:2;
             u16 unk16_11:5;
    /*0x18*/ u16 unk18;
};

struct MartHistory
{
    /*0x00*/ u32 unk0;
    /*0x04*/ u16 unk4;
    /*0x06*/ u16 unk6;
    /*0x08*/ u8 unk8;
    /*0x09*/ u8 unk9;
    /*0x0A*/ u8 unkA;
    /*0x0B*/ u8 unkB;
}; /* size = 12 */

static EWRAM_DATA s16 sViewportObjectEvents[OBJECT_EVENTS_COUNT][4] = {0};
EWRAM_DATA struct ShopData gShopData = {0};
static EWRAM_DATA u8 sShopMenuWindowId = 0;
EWRAM_DATA u16 (*gShopTilemapBuffer1)[0x400] = {0};
EWRAM_DATA u16 (*gShopTilemapBuffer2)[0x400] = {0};
EWRAM_DATA u16 (*gShopTilemapBuffer3)[0x400] = {0};
EWRAM_DATA u16 (*gShopTilemapBuffer4)[0x400] = {0};
EWRAM_DATA struct ListMenuItem *sShopMenuListMenu = {0};
static EWRAM_DATA u8 (*sShopMenuItemStrings)[13] = {0};
EWRAM_DATA struct MartHistory gShopMenuHistory[2] = {0};

//Function Declarations
static u8 CreateShopMenu(u8 a0);
static u8 GetMartTypeFromItemList(u32 a0);
static void SetShopItemsForSale(const u16 *items);
static void SetShopMenuCallback(MainCallback callback);
static void Task_ShopMenu(u8 taskId);
static void Task_HandleShopMenuBuy(u8 taskId);
static void Task_HandleShopMenuSell(u8 taskId);
static void CB2_GoToSellMenu(void);
static void Task_HandleShopMenuQuit(u8 taskId);
static void ClearShopMenuWindow(void);
static void Task_GoToBuyOrSellMenu(u8 taskId);
static void MapPostLoadHook_ReturnToShopMenu(void);
static void Task_ReturnToShopMenu(u8 taskId);
static void ShowShopMenuAfterExitingBuyOrSellMenu(u8 taskId);
static void CB2_BuyMenu(void);
static void VBlankCB_BuyMenu(void);
static void CB2_InitBuyMenu(void);
static bool8 InitShopData(void);
static void BuyMenuInitBgs(void);
static void BuyMenuDecompressBgGraphics(void);
static void RecolorItemDescriptionBox(bool32 a0);
static void BuyMenuDrawGraphics(void);
static bool8 BuyMenuBuildListMenuTemplate(void);
static void PokeMartWriteNameAndIdAt(struct ListMenuItem *list, u16 index, u8* dst);
static void BuyMenuPrintItemDescriptionAndShowItemIcon(s32 item, bool8 onInit, struct ListMenu *list);
static void BuyMenuPrintPriceInList(u8 windowId, u32 itemId, u8 y);
static void LoadTmHmNameInMart(s32 item);
static void BuyMenuPrintCursor(u8 listTaskId, u8 a1);
static void BuyMenuPrintCursorAtYPosition(u8 y, u8 a1);
static void BuyMenuFreeMemory(void);
static void SetShopExitCallback(void);
static void BuyMenuAddScrollIndicatorArrows(void);
static void BuyQuantityAddScrollIndicatorArrows(void);
static void BuyMenuRemoveScrollIndicatorArrows(void);
static void BuyMenuDrawMapView(void);
static void BuyMenuDrawMapBg(void);
static void BuyMenuDrawMapMetatile(s16 x, s16 y, const u16 *src, u8 metatileLayerType);
static void BuyMenuDrawMapMetatileLayer(u16 *dest, s16 offset1, s16 offset2, const u16 *src);
static void BuyMenuCollectObjectEventData(void);
static void BuyMenuDrawObjectEvents(void);
static void BuyMenuCopyTilemapData(void);
static void BuyMenuPrintItemQuantityAndPrice(u8 taskId);
static void Task_BuyMenu(u8 taskId);
static void Task_BuyHowManyDialogueInit(u8 taskId);
static void Task_BuyHowManyDialogueHandleInput(u8 taskId);
static void CreateBuyMenuConfirmPurchaseWindow(u8 taskId);
static void BuyMenuTryMakePurchase(u8 taskId);
static void BuyMenuSubtractMoney(u8 taskId);
static void Task_ReturnToItemListAfterItemPurchase(u8 taskId);
static void BuyMenuReturnToItemList(u8 taskId);
static void ExitBuyMenu(u8 taskId);
static void Task_ExitBuyMenu(u8 taskId);
static void DebugFunc_PrintPurchaseDetails(u8 taskId);
static void DebugFunc_PrintShopMenuHistoryBeforeClearMaybe(void);
static void RecordQuestLogItemPurchase(void);

static const struct MenuAction sShopMenuActions_BuySellQuit[] =
{
    {gText_ShopBuy, {.void_u8 = Task_HandleShopMenuBuy}},
    {gText_ShopSell, {.void_u8 = Task_HandleShopMenuSell}},
    {gText_ShopQuit, {.void_u8 = Task_HandleShopMenuQuit}}
};

static const struct YesNoFuncTable sShopMenuActions_BuyQuit[] =
{
    BuyMenuTryMakePurchase,
    BuyMenuReturnToItemList
};

static const struct WindowTemplate sShopMenuWindowTemplate =
{
    .bg = 0,
    .tilemapLeft = 2,
    .tilemapTop = 1,
    .width = 12,
    .height = 6,
    .paletteNum = 15,
    .baseBlock = 8
};    

static const struct BgTemplate sShopBuyMenuBgTemplates[4] =
{
    {
        .bg = 0,
        .charBaseIndex = 2,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0
    },
    {
        .bg = 1,
        .charBaseIndex = 0,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0
    },
    {
        .bg = 2,
        .charBaseIndex = 0,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0
    },
    {
        .bg = 3,
        .charBaseIndex = 0,
        .mapBaseIndex = 28,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0
    }
};

// Functions
static u8 CreateShopMenu(u8 a0)
{
    gShopData.martType = GetMartTypeFromItemList(a0);
    gShopData.selectedRow = 0;
    if (ContextNpcGetTextColor() == 0)
        gShopData.unk16_4 = 4;
    else
        gShopData.unk16_4 = 5;
    
    sShopMenuWindowId = AddWindow(&sShopMenuWindowTemplate);
    SetStdWindowBorderStyle(sShopMenuWindowId, 0);
    PrintTextArray(sShopMenuWindowId, 2, GetMenuCursorDimensionByFont(2, 0), 2, 16, 3, sShopMenuActions_BuySellQuit);
    Menu_InitCursor(sShopMenuWindowId, 2, 0, 2, 16, 3, 0);
    PutWindowTilemap(sShopMenuWindowId);
    CopyWindowToVram(sShopMenuWindowId, COPYWIN_MAP);
    return CreateTask(Task_ShopMenu, 8);
}

static u8 GetMartTypeFromItemList(u32 a0)
{    
    u16 i;
    
    if (a0)
        return a0;
    
    for (i = 0; i < gShopData.itemCount && gShopData.itemList[i] != 0; i++)
    {
        if (ItemId_GetPocket(gShopData.itemList[i]) == POCKET_TM_CASE)
            return 1;
    }
    return 0;
}

static void SetShopItemsForSale(const u16 *items)
{    
    gShopData.itemList = items;
    gShopData.itemCount = 0;
    if (gShopData.itemList[0] == 0)
        return;

    while (gShopData.itemList[gShopData.itemCount])
    {
        ++gShopData.itemCount;
    }
}

static void SetShopMenuCallback(void (*callback)(void))
{
    gShopData.callback = callback;
}

static void Task_ShopMenu(u8 taskId)
{
    s8 input = Menu_ProcessInputNoWrapAround();
    
    switch (input)
    {
    case MENU_NOTHING_CHOSEN:
        break;
    case MENU_B_PRESSED:
        PlaySE(SE_SELECT);
        Task_HandleShopMenuQuit(taskId);
        break;
    default:
        sShopMenuActions_BuySellQuit[Menu_GetCursorPos()].func.void_u8(taskId);
        break;
    }
}

static void Task_HandleShopMenuBuy(u8 taskId)
{
    SetWordTaskArg(taskId, 0xE, (u32)CB2_InitBuyMenu);
    FadeScreen(FADE_TO_BLACK, 0);
    gTasks[taskId].func = Task_GoToBuyOrSellMenu;
}

static void Task_HandleShopMenuSell(u8 taskId)
{
    SetWordTaskArg(taskId, 0xE, (u32)CB2_GoToSellMenu);
    FadeScreen(FADE_TO_BLACK, 0);
    gTasks[taskId].func = Task_GoToBuyOrSellMenu;    
}

static void CB2_GoToSellMenu(void)
{
    GoToBagMenu(ITEMMENULOCATION_SHOP, OPEN_BAG_LAST, CB2_ReturnToField);
    gFieldCallback = MapPostLoadHook_ReturnToShopMenu;
}

static void Task_HandleShopMenuQuit(u8 taskId)
{
    ClearShopMenuWindow();
    RecordQuestLogItemPurchase();
    DestroyTask(taskId);
    if (gShopData.callback != NULL)
        gShopData.callback();
}

static void ClearShopMenuWindow(void)
{
    ClearStdWindowAndFrameToTransparent(sShopMenuWindowId, 2);
    RemoveWindow(sShopMenuWindowId);
}

static void Task_GoToBuyOrSellMenu(u8 taskId)
{
    if (gPaletteFade.active)
        return;
    
    SetMainCallback2((void *)GetWordTaskArg(taskId, 0xE));
    FreeAllWindowBuffers();
    DestroyTask(taskId);
}

static void MapPostLoadHook_ReturnToShopMenu(void)
{
    FadeInFromBlack();
    CreateTask(Task_ReturnToShopMenu, 8);
}

static void Task_ReturnToShopMenu(u8 taskId)
{
    if (IsWeatherNotFadingIn() != TRUE)
        return;
    
    DisplayItemMessageOnField(taskId, GetMartUnk16_4(), gText_CanIHelpWithAnythingElse, ShowShopMenuAfterExitingBuyOrSellMenu);
}

static void ShowShopMenuAfterExitingBuyOrSellMenu(u8 taskId)
{
    CreateShopMenu(gShopData.martType);
    DestroyTask(taskId);
}

static void CB2_BuyMenu(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    DoScheduledBgTilemapCopiesToVram();
}

static void VBlankCB_BuyMenu(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void CB2_InitBuyMenu(void)
{
    u8 taskId;
    
    switch (gMain.state)
    {
    case 0:
        SetVBlankHBlankCallbacksToNull();
        CpuFastFill(0, (void *)OAM, 0x400);
        ScanlineEffect_Stop();
        ResetTempTileDataBuffers();
        FreeAllSpritePalettes();
        ResetPaletteFade();
        ResetSpriteData();
        ResetTasks();
        ClearScheduledBgCopiesToVram();
        ResetItemMenuIconState();
        if (!(InitShopData()) || !(BuyMenuBuildListMenuTemplate()))
            return;
        BuyMenuInitBgs();
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 0x20, 0x20);
        FillBgTilemapBufferRect_Palette0(1, 0, 0, 0, 0x20, 0x20);
        FillBgTilemapBufferRect_Palette0(2, 0, 0, 0, 0x20, 0x20);
        FillBgTilemapBufferRect_Palette0(3, 0, 0, 0, 0x20, 0x20);
        BuyMenuInitWindows(gShopData.martType);
        BuyMenuDecompressBgGraphics();
        gMain.state++;
        break;
    case 1:
        if (FreeTempTileDataBuffersIfPossible())
            return;
        gMain.state++;
        break;
    default:
        gShopData.selectedRow = 0;
        gShopData.scrollOffset = 0;
        BuyMenuDrawGraphics();
        BuyMenuAddScrollIndicatorArrows();
        taskId = CreateTask(Task_BuyMenu, 8);
        gTasks[taskId].tListTaskId = ListMenuInit(&gMultiuseListMenuTemplate, 0, 0);
        BlendPalettes(0xFFFFFFFF, 0x10, RGB_BLACK);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, RGB_BLACK);
        SetVBlankCallback(VBlankCB_BuyMenu);
        SetMainCallback2(CB2_BuyMenu);
        break;
    }
}

static bool8 InitShopData(void)
{
    gShopTilemapBuffer1 = Alloc(sizeof(*gShopTilemapBuffer1));
    if (gShopTilemapBuffer1 == NULL)
    {
        BuyMenuFreeMemory();
        SetShopExitCallback();
        return FALSE;        
    }
    
    gShopTilemapBuffer2 = Alloc(sizeof(*gShopTilemapBuffer2));
    if (gShopTilemapBuffer2 == NULL)
    {
        BuyMenuFreeMemory();
        SetShopExitCallback();
        return FALSE;        
    }
    
    gShopTilemapBuffer3 = Alloc(sizeof(*gShopTilemapBuffer3));
    if (gShopTilemapBuffer3 == NULL)
    {
        BuyMenuFreeMemory();
        SetShopExitCallback();
        return FALSE;
    }
    
    gShopTilemapBuffer4 = Alloc(sizeof(*gShopTilemapBuffer4));
    if (gShopTilemapBuffer4 == NULL)
    {
        BuyMenuFreeMemory();
        SetShopExitCallback();
        return FALSE;        
    }
    
    return TRUE;
}

static void BuyMenuInitBgs(void)
{
    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, sShopBuyMenuBgTemplates, NELEMS(sShopBuyMenuBgTemplates));
    SetBgTilemapBuffer(1, gShopTilemapBuffer2);
    SetBgTilemapBuffer(2, gShopTilemapBuffer4);
    SetBgTilemapBuffer(3, gShopTilemapBuffer3);
    SetGpuReg(REG_OFFSET_BG0HOFS, DISPCNT_MODE_0);
    SetGpuReg(REG_OFFSET_BG0VOFS, DISPCNT_MODE_0);
    SetGpuReg(REG_OFFSET_BG1HOFS, DISPCNT_MODE_0);
    SetGpuReg(REG_OFFSET_BG1VOFS, DISPCNT_MODE_0);
    SetGpuReg(REG_OFFSET_BG2HOFS, DISPCNT_MODE_0);
    SetGpuReg(REG_OFFSET_BG2VOFS, DISPCNT_MODE_0);
    SetGpuReg(REG_OFFSET_BG3HOFS, DISPCNT_MODE_0);
    SetGpuReg(REG_OFFSET_BG3VOFS, DISPCNT_MODE_0);
    SetGpuReg(REG_OFFSET_BLDCNT, DISPCNT_MODE_0);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_ON | DISPCNT_OBJ_1D_MAP);
    ShowBg(0);
    ShowBg(1);
    ShowBg(2);
    ShowBg(3);
}

static void BuyMenuDecompressBgGraphics(void)
{
    void* pal;
    
    DecompressAndCopyTileDataToVram(1, gBuyMenuFrame_Gfx, 0x480, 0x3DC, 0);
    if ((gShopData.martType) != MART_TYPE_TMHM)
        LZDecompressWram(gBuyMenuFrame_Tilemap, gShopTilemapBuffer1);
    else
        LZDecompressWram(gBuyMenuFrame_TmHmTilemap, gShopTilemapBuffer1);
    
    pal = Alloc(0x40);
    LZDecompressWram(gBuyMenuFrame_Pal, pal);
    LoadPalette(pal, 0xB0, 0x20);
    LoadPalette(pal + 0x20, 0x60, 0x20);
    Free(pal);
}

static void RecolorItemDescriptionBox(bool32 a0)
{
    u8 paletteNum;
    
    if (a0 == FALSE)
        paletteNum = 0xB;
    else 
        paletteNum = 0x6;
    
    if ((gShopData.martType) != MART_TYPE_TMHM)
        SetBgTilemapPalette(1, 0, 14, 30, 6, paletteNum);
    else
        SetBgTilemapPalette(1, 0, 12, 30, 8, paletteNum);
    
    ScheduleBgCopyTilemapToVram(1);
}

static void BuyMenuDrawGraphics(void)
{
    BuyMenuDrawMapView();
    BuyMenuCopyTilemapData();
    BuyMenuDrawMoneyBox();
    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(1);
    ScheduleBgCopyTilemapToVram(2);
    ScheduleBgCopyTilemapToVram(3);
}

bool8 BuyMenuBuildListMenuTemplate(void)
{
    u16 i, v;
    
    sShopMenuListMenu = Alloc((gShopData.itemCount + 1) * sizeof(*sShopMenuListMenu));
    if (sShopMenuListMenu == NULL
     || (sShopMenuItemStrings = Alloc((gShopData.itemCount + 1) * sizeof(*sShopMenuItemStrings))) == NULL)
    {
        BuyMenuFreeMemory();
        SetShopExitCallback();
        return FALSE;
    }
        
    for (i = 0; i < gShopData.itemCount; i++)
    {
        PokeMartWriteNameAndIdAt(&sShopMenuListMenu[i], gShopData.itemList[i], sShopMenuItemStrings[i]);
    }
    StringCopy(sShopMenuItemStrings[i], gFameCheckerText_Cancel);
    sShopMenuListMenu[i].label = sShopMenuItemStrings[i];    
    sShopMenuListMenu[i].index = -2;
    gMultiuseListMenuTemplate.items = sShopMenuListMenu;
    gMultiuseListMenuTemplate.totalItems = gShopData.itemCount + 1;
    gMultiuseListMenuTemplate.windowId = 4;
    gMultiuseListMenuTemplate.header_X = 0;
    gMultiuseListMenuTemplate.item_X = 9;
    gMultiuseListMenuTemplate.cursor_X = 1;
    gMultiuseListMenuTemplate.lettersSpacing = 0;
    gMultiuseListMenuTemplate.itemVerticalPadding = 2;
    gMultiuseListMenuTemplate.upText_Y = 2;
    gMultiuseListMenuTemplate.fontId = 2;
    gMultiuseListMenuTemplate.fillValue = 0;
    gMultiuseListMenuTemplate.cursorPal = GetFontAttribute(2, FONTATTR_COLOR_FOREGROUND);
    gMultiuseListMenuTemplate.cursorShadowPal = GetFontAttribute(2, FONTATTR_COLOR_SHADOW);
    gMultiuseListMenuTemplate.moveCursorFunc = BuyMenuPrintItemDescriptionAndShowItemIcon;
    gMultiuseListMenuTemplate.itemPrintFunc = BuyMenuPrintPriceInList;
    gMultiuseListMenuTemplate.scrollMultiple = 0;
    gMultiuseListMenuTemplate.cursorKind = 0;
    
    if (gShopData.martType == MART_TYPE_TMHM)
        v = 5;
    else
        v = 6;
    
    if ((gShopData.itemCount + 1) > v)
        gMultiuseListMenuTemplate.maxShowed = v;
    else
        gMultiuseListMenuTemplate.maxShowed = gShopData.itemCount + 1;
    
    gShopData.field12 = gMultiuseListMenuTemplate.maxShowed;
    return TRUE;
}

static void PokeMartWriteNameAndIdAt(struct ListMenuItem *list, u16 index, u8* dst)
{
    CopyItemName(index, dst);
    list->label = dst;
    list->index = index;
}

static void BuyMenuPrintItemDescriptionAndShowItemIcon(s32 item, bool8 onInit, struct ListMenu *list)
{
    const u8 *description;
    
    if (onInit != TRUE)
        PlaySE(SE_SELECT);

    if (item != INDEX_CANCEL)
        description = ItemId_GetDescription(item);
    else
        description = gText_QuitShopping;
    
    FillWindowPixelBuffer(5, PIXEL_FILL(0));
    if (gShopData.martType != 1)
    {
        DestroyItemMenuIcon(gShopData.itemSlot ^ 1);
        if (item != INDEX_CANCEL)
            CreateItemMenuIcon(item, gShopData.itemSlot);
        else
            CreateItemMenuIcon(ITEM_N_A, gShopData.itemSlot);
        
        gShopData.itemSlot ^= 1;
        BuyMenuPrint(5, 2, description, 0, 3, 2, 1, 0, 0);
    }
    else //TM Mart
    {
        FillWindowPixelBuffer(6, PIXEL_FILL(0));
        LoadTmHmNameInMart(item);
        BuyMenuPrint(5, 2, description, 2, 3, 1, 0, 0, 0);
    }
}

static void BuyMenuPrintPriceInList(u8 windowId, u32 item, u8 y)
{
    s32 x;
    u8 *loc;

    if (item != INDEX_CANCEL)
    {
        ConvertIntToDecimalStringN(gStringVar1, itemid_get_market_price(item), 0, 4);
        x = 4 - StringLength(gStringVar1);
        loc = gStringVar4;
        while (x-- != 0)
            *loc++ = 0;
        StringExpandPlaceholders(loc, gText_PokedollarVar1);
        BuyMenuPrint(windowId, 0, gStringVar4, 0x69, y, 0, 0, TEXT_SPEED_FF, 1);
    }
}

static void LoadTmHmNameInMart(s32 item)
{
    if (item != INDEX_CANCEL)
    {
        ConvertIntToDecimalStringN(gStringVar1, item - ITEM_DEVON_SCOPE, 2, 2);
        StringCopy(gStringVar4, gOtherText_UnkF9_08_Clear_01);
        StringAppend(gStringVar4, gStringVar1);
        BuyMenuPrint(6, 0, gStringVar4, 0, 0, 0, 0, TEXT_SPEED_FF, 1);
        StringCopy(gStringVar4, gMoveNames[ItemIdToBattleMoveId(item)]);
        BuyMenuPrint(6, 2, gStringVar4, 0, 0x10, 0, 0, 0, 1);
    }
    else
    {
        BuyMenuPrint(6, 0, gText_ThreeHyphens, 0, 0, 0, 0, TEXT_SPEED_FF, 1);
        BuyMenuPrint(6, 2, gText_SevenHyphens, 0, 0x10, 0, 0, 0, 1);
    }
}

u8 GetMartUnk16_4(void)
{
    return gShopData.unk16_4;
}

static void BuyMenuPrintCursor(u8 listTaskId, u8 a1)
{
    BuyMenuPrintCursorAtYPosition(ListMenuGetYCoordForPrintingArrowCursor(listTaskId), a1);
}

static void BuyMenuPrintCursorAtYPosition(u8 y, u8 a1)
{
    if (a1 == 0xFF)
    {
        FillWindowPixelRect(4, 0, 1, y, GetFontAttribute(2, FONTATTR_MAX_LETTER_WIDTH), GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT));
        CopyWindowToVram(4, COPYWIN_GFX);
    }
    else
    {
        BuyMenuPrint(4, 2, gText_SelectorArrow2, 1, y, 0, 0, 0, a1);
    }
}

static void BuyMenuFreeMemory(void)
{
    if (gShopTilemapBuffer1 != NULL)
        Free(gShopTilemapBuffer1);
    
    if (gShopTilemapBuffer2 != NULL)
        Free(gShopTilemapBuffer2);
    
    if (gShopTilemapBuffer3 != NULL)
        Free(gShopTilemapBuffer3);
    
    if (gShopTilemapBuffer4 != NULL)
        Free(gShopTilemapBuffer4);
    
    if (sShopMenuListMenu != NULL)
        Free(sShopMenuListMenu);
    
    if (sShopMenuItemStrings != NULL)
        Free(sShopMenuItemStrings);
    
    FreeAllWindowBuffers();        
}

static void SetShopExitCallback(void)
{
    gFieldCallback = MapPostLoadHook_ReturnToShopMenu;
    SetMainCallback2(CB2_ReturnToField);
}


static void BuyMenuAddScrollIndicatorArrows(void)
{
    if (gShopData.martType != MART_TYPE_TMHM)
    {
        gShopData.unk16_11 = AddScrollIndicatorArrowPairParameterized(SCROLL_ARROW_UP, 160, 8, 104, 
            (gShopData.itemCount - gShopData.field12) + 1, 110, 110, &gShopData.scrollOffset);
    }
    else
    {
        gShopData.unk16_11 = AddScrollIndicatorArrowPairParameterized(SCROLL_ARROW_UP, 160, 8, 88, 
            (gShopData.itemCount - gShopData.field12) + 1, 110, 110, &gShopData.scrollOffset);
    }
}

static void BuyQuantityAddScrollIndicatorArrows(void)
{
    gShopData.unk18 = 1;
    gShopData.unk16_11 = AddScrollIndicatorArrowPairParameterized(SCROLL_ARROW_UP, 0x98, 0x48, 0x68, 2, 0x6E, 0x6E, &gShopData.unk18);
}

static void BuyMenuRemoveScrollIndicatorArrows(void)
{
    if ((gShopData.unk16_11) == 0x1F)
        return;
    
    RemoveScrollIndicatorArrowPair(gShopData.unk16_11);
    gShopData.unk16_11 = 0x1F;
}

static void BuyMenuDrawMapView(void)
{
    BuyMenuCollectObjectEventData();
    BuyMenuDrawObjectEvents();
    BuyMenuDrawMapBg();
}

static void BuyMenuDrawMapBg(void)
{    
    s16 i, j, x, y;
    const struct MapLayout *mapLayout;
    u16 metatile;
    u8 metatileLayerType;

    mapLayout = gMapHeader.mapLayout;
    GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
    x -= 2;
    y -= 3;

    for (j = 0; j < 10; j++)
    {
        for (i = 0; i < 5; i++)
        {
            metatile = MapGridGetMetatileIdAt(x + i, y + j);
            metatileLayerType = MapGridGetMetatileLayerTypeAt(x + i, y + j);

            if (metatile < NUM_METATILES_IN_PRIMARY)
            {
                BuyMenuDrawMapMetatile(i, j, (u16*)mapLayout->primaryTileset->metatiles + metatile * 8, metatileLayerType);
            }
            else
            {
                BuyMenuDrawMapMetatile(i, j, (u16*)mapLayout->secondaryTileset->metatiles + ((metatile - NUM_METATILES_IN_PRIMARY) * 8), metatileLayerType);
            }
        }
    }
}

static void BuyMenuDrawMapMetatile(s16 x, s16 y, const u16 *src, u8 metatileLayerType)
{
    u16 offset1 = x * 2;
    u16 offset2 = y * 64 + 64;

    switch (metatileLayerType)
    {
    case 0:
        BuyMenuDrawMapMetatileLayer(*gShopTilemapBuffer4, offset1, offset2, src);
        BuyMenuDrawMapMetatileLayer(*gShopTilemapBuffer2, offset1, offset2, src + 4);
        break;
	case 1:
        BuyMenuDrawMapMetatileLayer(*gShopTilemapBuffer3, offset1, offset2, src);
        BuyMenuDrawMapMetatileLayer(*gShopTilemapBuffer2, offset1, offset2, src + 4);
        break;
    case 2:
        BuyMenuDrawMapMetatileLayer(*gShopTilemapBuffer3, offset1, offset2, src);
        BuyMenuDrawMapMetatileLayer(*gShopTilemapBuffer4, offset1, offset2, src + 4);
        break;
    }
}

static void BuyMenuDrawMapMetatileLayer(u16 *dest, s16 offset1, s16 offset2, const u16 *src)
{
    dest[offset1 + offset2] = src[0]; // top left
    dest[offset1 + offset2 + 1] = src[1]; // top right
    dest[offset1 + offset2 + 32] = src[2]; // bottom left
    dest[offset1 + offset2 + 33] = src[3]; // bottom right
}

static void BuyMenuCollectObjectEventData(void)
{
    s16 facingX, facingY;
    u8 x, y, z;
    u8 num = 0;

    GetXYCoordsOneStepInFrontOfPlayer(&facingX, &facingY);
    z = PlayerGetZCoord();
    
    for (y = 0; y < OBJECT_EVENTS_COUNT; y++)
        sViewportObjectEvents[y][OBJECT_EVENT_ID] = OBJECT_EVENTS_COUNT;
    
    for (y = 0; y < 5; y++)
    {
        for (x = 0; x < 7; x++)
        {
            u8 eventObjId = GetObjectEventIdByXYZ(facingX - 3 + x, facingY - 2 + y, z);
            if (eventObjId != OBJECT_EVENTS_COUNT)
            {
                sViewportObjectEvents[num][OBJECT_EVENT_ID] = eventObjId;
                sViewportObjectEvents[num][X_COORD] = x;
                sViewportObjectEvents[num][Y_COORD] = y;

                switch (gObjectEvents[eventObjId].facingDirection)
                {
                    case DIR_SOUTH:
                        sViewportObjectEvents[num][ANIM_NUM] = 0;
                        break;
                    case DIR_NORTH:
                        sViewportObjectEvents[num][ANIM_NUM] = 1;
                        break;
                    case DIR_WEST:
                        sViewportObjectEvents[num][ANIM_NUM] = 2;
                        break;
                    case DIR_EAST:
                    default:
                        sViewportObjectEvents[num][ANIM_NUM] = 3;
                        break;
                }
                num++;
            }
        }
    }
}

static void BuyMenuDrawObjectEvents(void)
{
    u8 i, spriteId;
    const struct ObjectEventGraphicsInfo *graphicsInfo;

    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (sViewportObjectEvents[i][OBJECT_EVENT_ID] == OBJECT_EVENTS_COUNT)
            continue;

        graphicsInfo = GetObjectEventGraphicsInfo(gObjectEvents[sViewportObjectEvents[i][OBJECT_EVENT_ID]].graphicsId);        
        spriteId = AddPseudoObjectEvent(
            gObjectEvents[sViewportObjectEvents[i][OBJECT_EVENT_ID]].graphicsId,
            SpriteCallbackDummy,
            (u16)sViewportObjectEvents[i][X_COORD] * 16 - 8,
            (u16)sViewportObjectEvents[i][Y_COORD] * 16 + 48 - graphicsInfo->height / 2,
            2);
        StartSpriteAnim(&gSprites[spriteId], sViewportObjectEvents[i][ANIM_NUM]);
    }
}

static void BuyMenuCopyTilemapData(void)
{
    s16 i;
    u16 *dst = *gShopTilemapBuffer2;
    u16 *src = *gShopTilemapBuffer1;

    for (i = 0; i < 0x400; i++)
    {
        if (src[i] == 0)
            continue;
        dst[i] = src[i] + 0xb3dc;
    }
}

static void BuyMenuPrintItemQuantityAndPrice(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    
    FillWindowPixelBuffer(3, PIXEL_FILL(1));
    PrintMoneyAmount(3, 0x36, 0xA, gShopData.itemPrice, TEXT_SPEED_FF);
    ConvertIntToDecimalStringN(gStringVar1, tItemCount, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
    BuyMenuPrint(3, 0, gStringVar4, 2, 0xA, 0, 0, 0, 1);
}

static void Task_BuyMenu(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (!gPaletteFade.active)
    {
        s32 itemId = ListMenu_ProcessInput(tListTaskId);
        ListMenuGetScrollAndRow(tListTaskId, &gShopData.scrollOffset, &gShopData.selectedRow);
        switch (itemId)
        {
        case LIST_NOTHING_CHOSEN:
            break;
        case LIST_CANCEL:
            PlaySE(SE_SELECT);
            ExitBuyMenu(taskId);
            break;
        default:
            PlaySE(SE_SELECT);
            tItemId = itemId;
            ClearWindowTilemap(5);
            BuyMenuRemoveScrollIndicatorArrows();
            BuyMenuPrintCursor(tListTaskId, 2);
            RecolorItemDescriptionBox(1);
            gShopData.itemPrice = itemid_get_market_price(itemId);
            if (!IsEnoughMoney(&gSaveBlock1Ptr->money, gShopData.itemPrice))
            {
                BuyMenuDisplayMessage(taskId, gText_YouDontHaveMoney, BuyMenuReturnToItemList);
            }
	    else if (ItemId_GetPocket(itemId) == POCKET_TM_CASE && CheckBagHasItem(itemId, 1))
	    {
		BuyMenuDisplayMessage(taskId, gText_YouAlreadyHaveThis, BuyMenuReturnToItemList);
	    }
            else
            {
                CopyItemName(itemId, gStringVar1);
                BuyMenuDisplayMessage(taskId, gText_Var1CertainlyHowMany, Task_BuyHowManyDialogueInit);
            }
            break;
        }
    }
}

static void Task_BuyHowManyDialogueInit(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 quantityInBag = BagGetQuantityByItemId(tItemId);
    u16 maxQuantity;
    
    BuyMenuQuantityBoxThinBorder(1, 0);
    ConvertIntToDecimalStringN(gStringVar1, quantityInBag, STR_CONV_MODE_RIGHT_ALIGN, 3);
    StringExpandPlaceholders(gStringVar4, gText_InBagVar1);
    BuyMenuPrint(1, 2, gStringVar4, 0, 2, 0, 0, 0, 1);
    tItemCount = 1;
    BuyMenuQuantityBoxNormalBorder(3, 0);
    BuyMenuPrintItemQuantityAndPrice(taskId);
    ScheduleBgCopyTilemapToVram(0);
    maxQuantity = GetMoney(&gSaveBlock1Ptr->money) / itemid_get_market_price(tItemId);
    if (maxQuantity > 99)
        gShopData.maxQuantity = 99;
    else
        gShopData.maxQuantity = (u8)maxQuantity;
    
    if (maxQuantity != 1)
        BuyQuantityAddScrollIndicatorArrows();
    
    gTasks[taskId].func = Task_BuyHowManyDialogueHandleInput;    
}

static void Task_BuyHowManyDialogueHandleInput(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (AdjustQuantityAccordingToDPadInput(&tItemCount, gShopData.maxQuantity) == TRUE)
    {
        gShopData.itemPrice = itemid_get_market_price(tItemId) * tItemCount;
        BuyMenuPrintItemQuantityAndPrice(taskId);
    }
    else
    {
        if (JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            BuyMenuRemoveScrollIndicatorArrows();
            ClearStdWindowAndFrameToTransparent(3, 0);
            ClearStdWindowAndFrameToTransparent(1, 0);
            ClearWindowTilemap(3);
            ClearWindowTilemap(1);
            PutWindowTilemap(4);
            CopyItemName(tItemId, gStringVar1);
            ConvertIntToDecimalStringN(gStringVar2, tItemCount, STR_CONV_MODE_LEFT_ALIGN, 2);
            ConvertIntToDecimalStringN(gStringVar3, gShopData.itemPrice, STR_CONV_MODE_LEFT_ALIGN, 8);
            BuyMenuDisplayMessage(taskId, gText_Var1AndYouWantedVar2, CreateBuyMenuConfirmPurchaseWindow);
        }
        else if (JOY_NEW(B_BUTTON))
        {            
            PlaySE(SE_SELECT);
            BuyMenuRemoveScrollIndicatorArrows();
            ClearStdWindowAndFrameToTransparent(3, 0);
            ClearStdWindowAndFrameToTransparent(1, 0);
            ClearWindowTilemap(3);
            ClearWindowTilemap(1);
            BuyMenuReturnToItemList(taskId);
        }
    }
}

static void CreateBuyMenuConfirmPurchaseWindow(u8 taskId)
{
    BuyMenuConfirmPurchase(taskId, sShopMenuActions_BuyQuit);
}

static void BuyMenuTryMakePurchase(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    PutWindowTilemap(4);
    if (AddBagItem(tItemId, tItemCount) == TRUE)
    {
        BuyMenuDisplayMessage(taskId, gText_HereYouGoThankYou, BuyMenuSubtractMoney);
        DebugFunc_PrintPurchaseDetails(taskId);
        RecordItemPurchase(tItemId, tItemCount, 1);
    }
    else
    {
        BuyMenuDisplayMessage(taskId, gText_NoMoreRoomForThis, BuyMenuReturnToItemList);
    }
}

static void BuyMenuSubtractMoney(u8 taskId)
{
    IncrementGameStat(GAME_STAT_SHOPPED);
    RemoveMoney(&gSaveBlock1Ptr->money, gShopData.itemPrice);
    PlaySE(SE_SHOP);
    PrintMoneyAmountInMoneyBox(0, GetMoney(&gSaveBlock1Ptr->money), 0);
    gTasks[taskId].func = Task_ReturnToItemListAfterItemPurchase;
}

static void Task_ReturnToItemListAfterItemPurchase(u8 taskId)
{
	s16 *data = gTasks[taskId].data;
	
	if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
	{
		PlaySE(SE_SELECT);
		if (ItemId_GetPocket(data->tItemId) == POCKET_TM_CASE && data->tItemCount >= 10 && AddBagItem(ITEM_PREMIER_BALL, data->tItemCount / 10))
		{
			if (data->tItemCount >= 20)
				BuyMenuDisplayMessage(taskId, gText_ThrowInPremierBalls, BuyMenuReturnToItemList);
			else
				BuyMenuDisplayMessage(taskId, gText_ThrowInPremierBall, BuyMenuReturnToItemList);
		}
		else
			BuyMenuReturnToItemList(taskId);
	}
}

static void BuyMenuReturnToItemList(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    ClearDialogWindowAndFrameToTransparent(2, 0);
    BuyMenuPrintCursor(tListTaskId, 1);
    RecolorItemDescriptionBox(0);
    PutWindowTilemap(4);
    PutWindowTilemap(5);
    if (gShopData.martType == MART_TYPE_TMHM)
        PutWindowTilemap(6);
    
    ScheduleBgCopyTilemapToVram(0);
    BuyMenuAddScrollIndicatorArrows();
    gTasks[taskId].func = Task_BuyMenu;
}

static void ExitBuyMenu(u8 taskId)
{
    gFieldCallback = MapPostLoadHook_ReturnToShopMenu;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
    gTasks[taskId].func = Task_ExitBuyMenu;
}

static void Task_ExitBuyMenu(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    
    if (!gPaletteFade.active)
    {
        DestroyListMenuTask(tListTaskId, NULL, NULL);
        BuyMenuFreeMemory();
        SetMainCallback2(CB2_ReturnToField);
        DestroyTask(taskId);
    }
}

static void DebugFunc_PrintPurchaseDetails(u8 taskId)
{
}

static void DebugFunc_PrintShopMenuHistoryBeforeClearMaybe(void)
{
}

void RecordItemPurchase(u16 item, u16 quantity, u8 a2)
{
    struct MartHistory *history;
    
    if (gShopMenuHistory[0].unkA == a2)
    {
        history = &gShopMenuHistory[0];
    }
    else if (gShopMenuHistory[1].unkA == a2)
    {
        history = &gShopMenuHistory[1];
    }
    else
    {
        if (gShopMenuHistory[0].unkA == 0)
            history = &gShopMenuHistory[0];
        else
            history = &gShopMenuHistory[1];
        history->unkA = a2;
    }
    
    if (history->unk4 != 0)
    {
        history->unk9 = 1;
    }
    
    history->unk4 = item;
    if (history->unk6 < 999)
    {
        history->unk6 += quantity;
        if (history->unk6 > 999)
            history->unk6 = 999;
    }
    
    if (history->unk0 < 999999)
    {
        history->unk0 += (itemid_get_market_price(item) >> (a2 - 1)) * quantity;
        if (history->unk0 > 999999)
            history->unk0 = 999999;
    }    
}

static void RecordQuestLogItemPurchase(void)
{
    u16 v;

    v = gShopMenuHistory[0].unkA;
    if (v != 0)
        SetQuestLogEvent(v + QL_EVENT_USED_POKEMART, (const u16 *)&gShopMenuHistory[0]);
    
    v = gShopMenuHistory[1].unkA;
    if (v != 0)
        SetQuestLogEvent(v + QL_EVENT_USED_POKEMART, (const u16 *)&gShopMenuHistory[1]);
}

void CreatePokemartMenu(const u16 *itemsForSale)
{    
    SetShopItemsForSale(itemsForSale);
    CreateShopMenu(MART_TYPE_REGULAR);
    SetShopMenuCallback(EnableBothScriptContexts);
    DebugFunc_PrintShopMenuHistoryBeforeClearMaybe();
    memset(&gShopMenuHistory, 0, sizeof(gShopMenuHistory));
    gShopMenuHistory[0].unk8 = gMapHeader.regionMapSectionId;
    gShopMenuHistory[1].unk8 = gMapHeader.regionMapSectionId;
}

void CreateDecorationShop1Menu(const u16 *itemsForSale)
{
    SetShopItemsForSale(itemsForSale);
    CreateShopMenu(MART_TYPE_DECOR);
    SetShopMenuCallback(EnableBothScriptContexts);
}

void CreateDecorationShop2Menu(const u16 *itemsForSale)
{
    SetShopItemsForSale(itemsForSale);
    CreateShopMenu(MART_TYPE_DECOR2);
    SetShopMenuCallback(EnableBothScriptContexts);
}

