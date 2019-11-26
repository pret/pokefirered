#include "global.h"
#include "shop.h"
#include "menu.h"
#include "data.h"
#include "graphics.h"
#include "strings.h"
#include "list_menu.h"
#include "new_menu_helpers.h"
#include "party_menu.h"
#include "window.h"
#include "field_specials.h"
#include "field_weather.h"
#include "field_camera.h"
#include "task.h"
#include "text.h"
#include "item.h"
#include "item_menu.h"
#include "main.h"
#include "sound.h"
#include "string_util.h"
#include "overworld.h"
#include "window.h"
#include "palette.h"
#include "field_fadetransition.h"
#include "scanline_effect.h"
#include "item_menu_icons.h"
#include "bg.h"
#include "gpu_regs.h"
#include "malloc.h"
#include "decompress.h"
#include "menu_indicators.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "field_map_obj.h"
#include "money.h"
#include "quest_log.h"
#include "script.h"
#include "constants/songs.h"
#include "constants/items.h"
#include "constants/game_stat.h"

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
    EVENT_OBJ_ID,
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
    /*0x0C*/ u16 unkC;
    /*0x0E*/ u8 unkE[6];
    /*0x14*/ u8 unk14;
    /*0x15*/ u8 unk15;
    /*0x16*/ u8 unk16;
    /*0x17*/ u8 unk17;
}; /* size = 0x18 */

static EWRAM_DATA s16 sViewportMapObjects[MAP_OBJECTS_COUNT][4] = {0};
EWRAM_DATA struct ShopData gShopData = {0};
static EWRAM_DATA u8 sShopMenuWindowId = 0;
EWRAM_DATA u16 (*gShopTilemapBuffer1)[0x400] = {0};
EWRAM_DATA u16 (*gShopTilemapBuffer2)[0x400] = {0};
EWRAM_DATA u16 (*gShopTilemapBuffer3)[0x400] = {0};
EWRAM_DATA u16 (*gShopTilemapBuffer4)[0x400] = {0};
EWRAM_DATA struct ListMenuItem *sShopMenuListMenu = {0};
static EWRAM_DATA u8 (*sShopMenuItemStrings)[13] = {0};
EWRAM_DATA struct MartHistory gShopMenuHistory = {0};

//Function Declarations
static u8 CreateShopMenu(u8 a0);
static u8 GetMartTypeFromItemList(bool32 a0);
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
static void sub_809B10C(bool32 a0);
static void BuyMenuDrawGraphics(void);
static bool8 BuyMenuBuildListMenuTemplate(void);
static void PokeMartWriteNameAndIdAt(struct ListMenuItem *list, u16 index, u8* dst);
static void BuyMenuPrintItemDescriptionAndShowItemIcon(s32 item, bool8 onInit, struct ListMenu *list);
static void BuyMenuPrintPriceInList(u8 windowId, s32 itemId, u8 y);
static void LoadTmHmNameInMart(s32 item);
static void BuyMenuPrintCursor(u8 listTaskId, u8 a1);
static void BuyMenuPrintCursorAtYPosition(u8 y, u8 a1);
static void BuyMenuFreeMemory(void);
static void SetShopExitCallback(void);
static void BuyMenuAddScrollIndicatorArrows(void);
static void BuyQuantityAddScrollIndicatorArrows(void);
static void BuyMenuRemoveScrollIndicatorArrows(void);
static void sub_809B764(void);
static void BuyMenuDrawMapBg(void);
static void BuyMenuDrawMapMetatile(s16 x, s16 y, const u16 *src, u8 metatileLayerType);
static void BuyMenuDrawMapMetatileLayer(u16 *dest, s16 offset1, s16 offset2, const u16 *src);
static void BuyMenuCollectEventObjectData(void);
static void BuyMenuDrawEventObjects(void);
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
static void nullsub_52(u8 taskId);
static void nullsub_53(void);
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
    gShopData.martType = GetMartTypeFromItemList(a0) & 0xF;
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
    CopyWindowToVram(sShopMenuWindowId, 1);
    return CreateTask(Task_ShopMenu, 8);
}

static bool8 GetMartTypeFromItemList(bool32 a0)
{    
    u16 i;
    
    if (a0)
        return (u8)a0;
    goto MAIN;
    
    RETURN_1:
    return 1;

    MAIN:
    i = 0;
    if (i >= gShopData.itemCount)
        goto RETURN_0;
    else if (gShopData.itemList[0] == 0)
        goto RETURN_0;

    while (gShopData.itemList[i] != 0)
    {
        if (ItemId_GetPocket(gShopData.itemList[i]) == POCKET_TM_CASE)
            goto RETURN_1;
        ++i;
        if (i >= gShopData.itemCount)
            goto RETURN_0;
        else if (gShopData.itemList[i] == 0)
            goto RETURN_0;
    }
    
    RETURN_0:
    return 0;
}

static void SetShopItemsForSale(const u16 *items)
{    
    struct ShopData *mart;

    mart = &gShopData;
    mart->itemList = items;
    mart->itemCount = 0;
    if (mart->itemList[0] == 0)
        return;

    do
    {
        ++gShopData.itemCount;
    } while (mart->itemList[gShopData.itemCount]);
}

static void SetShopMenuCallback(MainCallback callback)
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
    fade_screen(1, 0);
    gTasks[taskId].func = Task_GoToBuyOrSellMenu;
}

static void Task_HandleShopMenuSell(u8 taskId)
{
    SetWordTaskArg(taskId, 0xE, (u32)CB2_GoToSellMenu);
    fade_screen(1, 0);
    gTasks[taskId].func = Task_GoToBuyOrSellMenu;    
}

static void CB2_GoToSellMenu(void)
{
    GoToBagMenu(2, POCKET_POKE_BALLS, CB2_ReturnToField);
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
    sub_807DC00();
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
        if ((!(InitShopData())) || (!(BuyMenuBuildListMenuTemplate())))
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
        goto CANCEL;
    
    gShopTilemapBuffer2 = Alloc(sizeof(*gShopTilemapBuffer2));
    if (gShopTilemapBuffer2 == NULL)
        goto CANCEL;
    
    gShopTilemapBuffer3 = Alloc(sizeof(*gShopTilemapBuffer3));
    if (gShopTilemapBuffer3 == NULL)
        goto CANCEL;
    
    gShopTilemapBuffer4 = Alloc(sizeof(*gShopTilemapBuffer4));
    if (gShopTilemapBuffer4 == NULL)
        goto CANCEL;
    return TRUE;
    
    CANCEL:
    BuyMenuFreeMemory();
    SetShopExitCallback();
    return FALSE;
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

static void sub_809B10C(bool32 a0)
{
    u8 v;
    
    if (a0 == FALSE)
        v = 0xB;
    else 
        v = 6;
    
    if ((gShopData.martType) != MART_TYPE_TMHM)
        SetBgTilemapPalette(1, 0, 0xE, 0x1E, 6, v);
    else
        SetBgTilemapPalette(1, 0, 0xC, 0x1E, 8, v);
    
    ScheduleBgCopyTilemapToVram(1);
}

static void BuyMenuDrawGraphics(void)
{
    sub_809B764();
    BuyMenuCopyTilemapData();
    BuyMenuDrawMoneyBox();
    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(1);
    ScheduleBgCopyTilemapToVram(2);
    ScheduleBgCopyTilemapToVram(3);
}

static bool8 BuyMenuBuildListMenuTemplate(void)
{
    u16 i, v;
    struct ListMenuItem **list = &sShopMenuListMenu;
    struct ShopData *mart = &gShopData;
    
    *list = Alloc((gShopData.itemCount + 1) * sizeof(*sShopMenuListMenu));
    if (sShopMenuListMenu == NULL)
        goto FREE_MEMORY;
    
    sShopMenuItemStrings = Alloc((gShopData.itemCount + 1) * sizeof(*sShopMenuItemStrings));
    if (sShopMenuItemStrings == NULL)
    {
        FREE_MEMORY:
        BuyMenuFreeMemory();
        SetShopExitCallback();
        return FALSE;
    }
    
    i = 0;
    if (i >= mart->itemCount)
        goto ADD_CANCEL;
    
    for (i = 0; i < mart->itemCount; i++)
    {
        PokeMartWriteNameAndIdAt(&sShopMenuListMenu[i], mart->itemList[i], sShopMenuItemStrings[i]);
    }
    
    ADD_CANCEL:
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

#ifdef NONMATCHING
// As simple as this seems, I could not get the while loop to use the correct registers. It should pad the front of gStringVar4 with 0 based on the length of gStringVar1.
static void BuyMenuPrintPriceInList(u8 windowId, s32 item, u8 y)
{
    u32 len, x;
    u8 *loc;

    if (item != INDEX_CANCEL)
    {
        ConvertIntToDecimalStringN(gStringVar1, itemid_get_market_price(item), 0, 4);
        len = 4 - StringLength(gStringVar1);
        loc = gStringVar4;
        x = len - 1;
        if (x > 0)
        {
            while (len != 0)
            {    
                *loc = 0;
                loc++;
                len--;
            }
        }
        StringExpandPlaceholders(loc, gText_PokedollarVar1);
        BuyMenuPrint(windowId, 1, gStringVar4, 0x69, y, 0, 0, TEXT_SPEED_FF, 1);
    }
}
#else
NAKED
static void BuyMenuPrintPriceInList(u8 windowId, s32 item, u8 y)
{
    asm_unified("\tpush {r4-r6,lr}\n"
                "\tsub sp, 0x14\n"
                "\tlsls r0, 24\n"
                "\tlsrs r6, r0, 24\n"
                "\tlsls r2, 24\n"
                "\tlsrs r5, r2, 24\n"
                "\tmovs r0, 0x2\n"
                "\tnegs r0, r0\n"
                "\tcmp r1, r0\n"
                "\tbeq _0809B480\n"
                "\tldr r4, _0809B488 @ =gStringVar1\n"
                "\tlsls r0, r1, 16\n"
                "\tlsrs r0, 16\n"
                "\tbl itemid_get_market_price\n"
                "\tadds r1, r0, 0\n"
                "\tlsls r1, 16\n"
                "\tlsrs r1, 16\n"
                "\tadds r0, r4, 0\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0x4\n"
                "\tbl ConvertIntToDecimalStringN\n"
                "\tadds r0, r4, 0\n"
                "\tbl StringLength\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tmovs r1, 0x4\n"
                "\tsubs r1, r0\n"
                "\tldr r2, _0809B48C @ =gStringVar4\n"
                "\tadds r0, r1, 0\n"
                "\tsubs r1, 0x1\n"
                "\tcmp r0, 0\n"
                "\tbeq _0809B45C\n"
                "\tmovs r3, 0\n"
                "_0809B450:\n"
                "\tstrb r3, [r2]\n"
                "\tadds r2, 0x1\n"
                "\tadds r0, r1, 0\n"
                "\tsubs r1, 0x1\n"
                "\tcmp r0, 0\n"
                "\tbne _0809B450\n"
                "_0809B45C:\n"
                "\tldr r1, _0809B490 @ =gText_PokedollarVar1\n"
                "\tadds r0, r2, 0\n"
                "\tbl StringExpandPlaceholders\n"
                "\tldr r2, _0809B48C @ =gStringVar4\n"
                "\tstr r5, [sp]\n"
                "\tmovs r0, 0\n"
                "\tstr r0, [sp, 0x4]\n"
                "\tstr r0, [sp, 0x8]\n"
                "\tmovs r0, 0xFF\n"
                "\tstr r0, [sp, 0xC]\n"
                "\tmovs r0, 0x1\n"
                "\tstr r0, [sp, 0x10]\n"
                "\tadds r0, r6, 0\n"
                "\tmovs r1, 0\n"
                "\tmovs r3, 0x69\n"
                "\tbl BuyMenuPrint\n"
                "_0809B480:\n"
                "\tadd sp, 0x14\n"
                "\tpop {r4-r6}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t_0809B488: .4byte gStringVar1\n"
                "\t_0809B48C: .4byte gStringVar4\n"
                "\t_0809B490: .4byte gText_PokedollarVar1\n");
}
#endif

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
        CopyWindowToVram(4, 2);
    }
    else
    {
        BuyMenuPrint(4, 2, gFameCheckerText_ListMenuCursor, 1, y, 0, 0, 0, a1);
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

static void sub_809B764(void)
{
    BuyMenuCollectEventObjectData();
    BuyMenuDrawEventObjects();
    BuyMenuDrawMapBg();
}

static void BuyMenuDrawMapBg(void)
{    
    s16 i, j, x, y;
    const struct MapData *mapData;
    u16 metatile;
    u8 metatileLayerType;

    mapData = gMapHeader.mapData;
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
                BuyMenuDrawMapMetatile(i, j, (u16*)mapData->primaryTileset->metatiles + metatile * 8, metatileLayerType);
            }
            else
            {
                BuyMenuDrawMapMetatile(i, j, (u16*)mapData->secondaryTileset->metatiles + ((metatile - NUM_METATILES_IN_PRIMARY) * 8), metatileLayerType);
            }
        }
    }
}

static void BuyMenuDrawMapMetatile(s16 x, s16 y, const u16 *src, u8 metatileLayerType)
{
    u16 offset1 = x * 2;
    u16 offset2 = ((y << 0x16) + 0x400000) >> 0x10;

    switch (metatileLayerType)
    {
    case 0:
        BuyMenuDrawMapMetatileLayer(*gShopTilemapBuffer4, offset1, offset2, src);
        BuyMenuDrawMapMetatileLayer(*gShopTilemapBuffer2, offset1, offset2, src + 4);
        break;
    case 1:
        BuyMenuDrawMapMetatileLayer(*gShopTilemapBuffer3, offset1, offset2, src);
        BuyMenuDrawMapMetatileLayer(*gShopTilemapBuffer4, offset1, offset2, src + 4);
        break;
    case 2:
        BuyMenuDrawMapMetatileLayer(*gShopTilemapBuffer3, offset1, offset2, src);
        BuyMenuDrawMapMetatileLayer(*gShopTilemapBuffer2, offset1, offset2, src + 4);
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

static void BuyMenuCollectEventObjectData(void)
{
    s16 facingX, facingY;
    u8 x, y, z;
    u8 num = 0;

    GetXYCoordsOneStepInFrontOfPlayer(&facingX, &facingY);
    z = PlayerGetZCoord();
    
    for (y = 0; y < MAP_OBJECTS_COUNT; y++)
        sViewportMapObjects[y][EVENT_OBJ_ID] = MAP_OBJECTS_COUNT;
    
    for (y = 0; y < 5; y++)
    {
        for (x = 0; x < 7; x++)
        {
            u8 eventObjId = GetFieldObjectIdByXYZ(facingX - 3 + x, facingY - 2 + y, z);
            if (eventObjId != MAP_OBJECTS_COUNT)
            {
                sViewportMapObjects[num][EVENT_OBJ_ID] = eventObjId;
                sViewportMapObjects[num][X_COORD] = x;
                sViewportMapObjects[num][Y_COORD] = y;

                switch (gMapObjects[eventObjId].facingDirection)
                {
                    case DIR_SOUTH:
                        sViewportMapObjects[num][ANIM_NUM] = 0;
                        break;
                    case DIR_NORTH:
                        sViewportMapObjects[num][ANIM_NUM] = 1;
                        break;
                    case DIR_WEST:
                        sViewportMapObjects[num][ANIM_NUM] = 2;
                        break;
                    case DIR_EAST:
                    default:
                        sViewportMapObjects[num][ANIM_NUM] = 3;
                        break;
                }
                num++;
            }
        }
    }
}

static void BuyMenuDrawEventObjects(void)
{
    u8 i, spriteId;
    const struct MapObjectGraphicsInfo *graphicsInfo;

    for (i = 0; i < MAP_OBJECTS_COUNT; i++)
    {
        if (sViewportMapObjects[i][EVENT_OBJ_ID] == MAP_OBJECTS_COUNT)
            continue;

        graphicsInfo = GetFieldObjectGraphicsInfo(gMapObjects[sViewportMapObjects[i][EVENT_OBJ_ID]].graphicsId);        
        spriteId = AddPseudoEventObject(
            gMapObjects[sViewportMapObjects[i][EVENT_OBJ_ID]].graphicsId,
            SpriteCallbackDummy,
            (u16)sViewportMapObjects[i][X_COORD] * 16 - 8,
            (u16)sViewportMapObjects[i][Y_COORD] * 16 + 48 - graphicsInfo->height / 2,
            2);
        StartSpriteAnim(&gSprites[spriteId], sViewportMapObjects[i][ANIM_NUM]);
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
            sub_809B10C(1);
            gShopData.itemPrice = itemid_get_market_price(itemId);
            if (!IsEnoughMoney(&gSaveBlock1Ptr->money, gShopData.itemPrice))
            {
                BuyMenuDisplayMessage(taskId, gText_YouDontHaveMoney, BuyMenuReturnToItemList);
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
        nullsub_52(taskId);
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
    if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        BuyMenuReturnToItemList(taskId);
    }
}

static void BuyMenuReturnToItemList(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    ClearDialogWindowAndFrameToTransparent(2, 0);
    BuyMenuPrintCursor(tListTaskId, 1);
    sub_809B10C(0);
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
        DestroyListMenuTask(tListTaskId, 0, 0);
        BuyMenuFreeMemory();
        SetMainCallback2(CB2_ReturnToField);
        DestroyTask(taskId);
    }
}

static void nullsub_52(u8 taskId)
{
}

static void nullsub_53(void)
{
}

#ifdef NONMATCHING
// couldn't get registers to match. It should store an address into r4 (what tmp wants to be), and load/store from there, eg. ldrh r0, [r4,#4]. Which indicates an array inside the MartHistory struct, except data sizes are not consistent.
void RecordItemPurchase(u16 item, u16 quantity, u8 a2)
{
    struct MartHistory *tmp;
    
    if (gShopMenuHistory.unkA == a2)
    {
        tmp = &gShopMenuHistory;
    }
    else
    {
        if (gShopMenuHistory.unk16 == a2)
        {
            tmp = &gShopMenuHistory + 12;
        }
        else
        {
            tmp = &gShopMenuHistory + 12;
            if (gShopMenuHistory.unkA == 0)
            {
                tmp = &gShopMenuHistory;
                gShopMenuHistory.unkA = a2;
            }
        }
    }
    
    if (tmp->unk4 != 0)
    {
        gShopMenuHistory.unk9 = 1;
    }
    
    gShopMenuHistory.unk4 = item;
    if (gShopMenuHistory.unk6 <= 998)
    {
        gShopMenuHistory.unk6 += item;
        if (item > 999)
            gShopMenuHistory.unk6 = 999;
    }
    
    if (gShopMenuHistory.unk0 < 999998)
    {
        gShopMenuHistory.unk0 += ((s16)itemid_get_market_price(item) >> (quantity-1))*quantity;
        if (gShopMenuHistory.unk0 > 999999)
            gShopMenuHistory.unk0 = 999999;
    }    
}
#else
NAKED
void RecordItemPurchase(u16 item, u16 quantity, u8 a2)
{
    asm_unified("\tpush {r4-r6,lr}\n"
                "\tlsls r0, 16\n"
                "\tlsrs r3, r0, 16\n"
                "\tlsls r1, 16\n"
                "\tlsrs r6, r1, 16\n"
                "\tlsls r2, 24\n"
                "\tlsrs r5, r2, 24\n"
                "\tldr r1, _0809C0B8 @ =gShopMenuHistory\n"
                "\tldrb r2, [r1, 0xA]\n"
                "\tcmp r2, r5\n"
                "\tbne _0809C0BC\n"
                "\tadds r4, r1, 0\n"
                "\tb _0809C0D4\n"
                "\t.align 2, 0\n"
                "_0809C0B8: .4byte gShopMenuHistory\n"
                "_0809C0BC:\n"
                "\tldrb r0, [r1, 0x16]\n"
                "\tcmp r0, r5\n"
                "\tbne _0809C0C8\n"
                "\tadds r4, r1, 0\n"
                "\tadds r4, 0xC\n"
                "\tb _0809C0D4\n"
                "_0809C0C8:\n"
                "\tadds r4, r1, 0\n"
                "\tadds r4, 0xC\n"
                "\tcmp r2, 0\n"
                "\tbne _0809C0D2\n"
                "\tadds r4, r1, 0\n"
                "_0809C0D2:\n"
                "\tstrb r5, [r4, 0xA]\n"
                "_0809C0D4:\n"
                "\tldrh r0, [r4, 0x4]\n"
                "\tcmp r0, 0\n"
                "\tbeq _0809C0DE\n"
                "\tmovs r0, 0x1\n"
                "\tstrb r0, [r4, 0x9]\n"
                "_0809C0DE:\n"
                "\tstrh r3, [r4, 0x4]\n"
                "\tldrh r1, [r4, 0x6]\n"
                "\tldr r0, _0809C128 @ =0x000003e6\n"
                "\tcmp r1, r0\n"
                "\tbhi _0809C0F8\n"
                "\tadds r0, r6, r1\n"
                "\tstrh r0, [r4, 0x6]\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tldr r1, _0809C12C @ =0x000003e7\n"
                "\tcmp r0, r1\n"
                "\tbls _0809C0F8\n"
                "\tstrh r1, [r4, 0x6]\n"
                "_0809C0F8:\n"
                "\tldr r1, [r4]\n"
                "\tldr r0, _0809C130 @ =0x000f423e\n"
                "\tcmp r1, r0\n"
                "\tbhi _0809C120\n"
                "\tadds r0, r3, 0\n"
                "\tbl itemid_get_market_price\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tsubs r1, r5, 0x1\n"
                "\tasrs r0, r1\n"
                "\tadds r1, r0, 0\n"
                "\tmuls r1, r6\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, r1\n"
                "\tstr r0, [r4]\n"
                "\tldr r1, _0809C134 @ =0x000f423f\n"
                "\tcmp r0, r1\n"
                "\tbls _0809C120\n"
                "\tstr r1, [r4]\n"
                "_0809C120:\n"
                "\tpop {r4-r6}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_0809C128: .4byte 0x000003e6\n"
                "_0809C12C: .4byte 0x000003e7\n"
                "_0809C130: .4byte 0x000f423e\n"
                "_0809C134: .4byte 0x000f423f\n");
}
#endif

static void RecordQuestLogItemPurchase(void)
{
    struct MartHistory *history = &gShopMenuHistory;
    u16 v;

    v = history->unkA;
    if (v != 0)
        sub_8113550(v + 0x24, (const u16*)history);
    
    v = history->unk16;
    if (v != 0)
    {
        v += 0x24;
        sub_8113550(v, (const u16*)&history->unkC);
    }
}

void CreatePokemartMenu(const u16 *itemsForSale)
{    
    SetShopItemsForSale(itemsForSale);
    CreateShopMenu(MART_TYPE_REGULAR);
    SetShopMenuCallback(EnableBothScriptContexts);
    nullsub_53();
    memset(&gShopMenuHistory, 0, sizeof(struct MartHistory));
    gShopMenuHistory.unk8 = gMapHeader.regionMapSectionId;
    gShopMenuHistory.unk14 = gMapHeader.regionMapSectionId;
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

