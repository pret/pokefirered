#include "global.h"
#include "shop.h"
#include "menu.h"
#include "data.h"
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
#include "strings.h"
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
#include "event_data.h"
#include "constants/songs.h"
#include "constants/items.h"
#include "constants/game_stat.h"

#define t0 data[0]
#define tItemCount data[1]
#define tX data[4]
#define tItemId data[5]
#define tListTaskId data[7]

enum
{
    MART_TYPE_REGULAR = 0,
    MART_TYPE_TMHM,
    MART_TYPE_DECOR,
    MART_TYPE_DECOR2,
};

// RAM symbols
// Function Declarations
// Data Definitions

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
    //INCOMPLETE
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


EWRAM_DATA struct ShopData gShopData = {0};
EWRAM_DATA u8 gUnknown_2039950 = 0;    //sShopMenuWindowId

EWRAM_DATA u16 (*gUnknown_2039954)[0x400] = {0};    //gShopTilemapBuffers
EWRAM_DATA u16 (*gUnknown_2039958)[0x400] = {0};
EWRAM_DATA u16 (*gUnknown_203995C)[0x400] = {0};
EWRAM_DATA u16 (*gUnknown_2039960)[0x400] = {0};
/*
EWRAM_DATA struct ShopTilemapBuffers *gUnknown_2039954 = 0;    //gShopTilemapBuffers
EWRAM_DATA struct ShopTilemapBuffers *gUnknown_2039958 = 0;
EWRAM_DATA struct ShopTilemapBuffers *gUnknown_203995C = 0;
EWRAM_DATA struct ShopTilemapBuffers *gUnknown_2039960 = 0;
*/
EWRAM_DATA struct ListMenuItem *gUnknown_2039964 = {0};
EWRAM_DATA u8 (*gUnknown_2039968)[13] = {0};    //item strings

EWRAM_DATA s16 gUnknown_20398B4[MAP_OBJECTS_COUNT][4] = {0};    //sViewportMapObjects
EWRAM_DATA struct MartHistory gUnknown_203996C = {0};

EWRAM_DATA u8 gUnknown_2039984 = 0;

//Function Declarations
static u8 sub_809AAB0(u8 a0);
static u8 sub_809AB7C(bool32 a0);
static void sub_809ABD8(const u16 *items);
static void sub_809AC04(MainCallback callback);
static void sub_809AC10(u8 taskId);
static void sub_809AC5C(u8 taskId);
static void sub_809AC98(u8 taskId);
static void sub_809ACD4(void);
static void sub_809ACF8(u8 taskId);
static void sub_809AD24(void);
static void sub_809AD40(u8 taskId);
static void sub_809AD74(void);
static void sub_809AD8C(u8 taskId);
static void sub_809ADC0(u8 taskId);    //ShowShopMenuAfterExitingBuyOrSellMenu
static void sub_809ADE4(void);
static void sub_809AE00(void);
static void sub_809AE14(void);
static bool8 sub_809AF6C(void);
static void sub_809AFD0(void);    //BuyMenuInitBgs
static void sub_809B080(void);
static void sub_809B10C(bool32 a0);
static void sub_809B15C(void);    //BuyMenuDrawGraphics();
static bool8 sub_809B188(void);    //BuyMenuBuildListMenuTemplate
static void sub_809B300(struct ListMenuItem *list, u16 index, u8* dst);
static void sub_809B320(s32 item, bool8 onInit, struct ListMenu *list);
static void sub_809B408(u8 windowId, s32 itemId, u8 y);
static void sub_809B494(s32 item);
static void sub_809B57C(u8 listTaskId, u8 a1);
static void sub_809B59C(u8 y, u8 a1);
static void sub_809B604(void);
static void sub_809B670(void);
static void sub_809B690(void);
static void sub_809B6FC(void);
static void sub_809B73C(void);
static void sub_809B764(void);
static void sub_809B778(void);
static void sub_809B850(s16 x, s16 y, const u16 *src, u8 metatileLayerType);
static void sub_809B904(u16 *dest, s16 offset1, s16 offset2, const u16 *src);
static void sub_809B92C(void);
static void sub_809BA40(void);
static void sub_809BAFC(void);
static void sub_809BB44(u8 taskId);
static void sub_809BBC0(u8 taskId);
static void sub_809BCA0(u8 taskId);
static void sub_809BD8C(u8 taskId);
static void sub_809BE90(u8 taskId);
static void sub_809BEA4(u8 taskId);
static void sub_809BF0C(u8 taskId);
static void sub_809BF68(u8 taskId);
static void sub_809BF98(u8 taskId);
static void sub_809C004(u8 taskId);
static void sub_809C04C(u8 taskId);
static void nullsub_52(u8 taskId);
static void nullsub_53(void);
static void sub_809C138(void);

// new file?
static void sub_809C334(u8 taskId);
static void sub_809C500(u8 taskId);
static void sub_809C640(u8 taskId);

// external defines
extern u8 MapGridGetMetatileLayerTypeAt(s16 x, s16 y);
extern u16 BagGetQuantityByItemId(u16 item);

//Data Definitions
/*
extern const struct MenuAction gUnknown_83DF09C[];
extern const struct YesNoFuncTable gUnknown_83DF0B4[];
extern const struct WindowTemplate gUnknown_83DF0BC[];
extern const struct BgTemplate gUnknown_83DF0C4[];
extern const u16 gUnknown_83DF0D4[];
extern const u16 gUnknown_83DF0DA[];
extern const u16 gUnknown_83DF0E0[];
extern const u16 gUnknown_83DF0E6[];
extern const u16 gUnknown_83DF0EC[];
extern const u16 gUnknown_83DF0F2[];
extern const u16 gUnknown_83DF0F8[];
*/

//graphics
extern const u32 gUnknown_8E85DC8[];    //gBuyMenuFrame_Gfx[];
extern const u32 gUnknown_8E85EFC[];    //gBuyMenuFrame_Tilemap
extern const u32 gUnknown_8E86038[];    //gBuyMenuFrame_TmHmTilemap
extern const u32 gUnknown_8E86170[];    //gBuyMenuFrame_Pal


static const struct MenuAction gUnknown_83DF09C[] =    // sShopMenuActions_BuySellQuit
{
    {gText_ShopBuy, {.void_u8 = sub_809AC5C}},
    {gText_ShopSell, {.void_u8 = sub_809AC98}},
    {gText_ShopQuit, {.void_u8 = sub_809ACF8}}
};

static const struct YesNoFuncTable gUnknown_83DF0B4[] =    //sShopMenuActions_BuyQuit
{
    sub_809BEA4,         //Task_HandleShopMenuBuy,
    sub_809BF98            //Task_HandleShopMenuQuit
};

static const struct WindowTemplate gUnknown_83DF0BC[] =     //sShopMenuWindowTemplates
{
    {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 1,
        .width = 12,
        .height = 6,
        .paletteNum = 15,
        .baseBlock = 8
    }
};    

static const struct BgTemplate gUnknown_83DF0C4[] =     //sShopBuyMenuBgTemplates
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

static const u16 gUnknown_83DF0D4[] = {0x0308, 0x030a, 0x02d0};
static const u16 gUnknown_83DF0DA[] = {0x0309, 0x030b, 0x02d1};
static const u16 gUnknown_83DF0E0[] = {0x0310, 0x0312, 0x02d8};
static const u16 gUnknown_83DF0E6[] = {0x0311, 0x0313, 0x02d9};
static const u16 gUnknown_83DF0EC[] = {0x02e3, 0x0316, 0x0314};
static const u16 gUnknown_83DF0F2[] = {0x02e4, 0x0317, 0x0315};
static const u16 gUnknown_83DF0F8[] = {0x02eb, 0x031e, 0x031c};


// Functions
// CreateShopMenu
static u8 sub_809AAB0(u8 a0)
{
    gShopData.martType = sub_809AB7C(a0) & 0xF;
    gShopData.selectedRow = 0;
    if (!(ContextNpcGetTextColor()))
        gShopData.unk16_4 = 4;
    else
        gShopData.unk16_4 = 5;
    
    gUnknown_2039950 = AddWindow(gUnknown_83DF0BC);        //sShopMenuWindowTemplates
    SetStdWindowBorderStyle(gUnknown_2039950, 0);
    PrintTextArray(gUnknown_2039950, 2, GetMenuCursorDimensionByFont(2, 0), 2, 16, 3, gUnknown_83DF09C);
    Menu_InitCursor(gUnknown_2039950, 2, 0, 2, 16, 3, 0);
    PutWindowTilemap(gUnknown_2039950);
    CopyWindowToVram(gUnknown_2039950, 1);
    return CreateTask(sub_809AC10, 8);
}

static u8 sub_809AB7C(u32 a0)
{    
    u16 retVal, i;
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

//SetShopItemsForSale
static void sub_809ABD8(const u16 *items) //I really don't know what GameFreak was thinking here..
{    
    struct ShopData *mart;
    //u16 i;

    mart = &gShopData;
    mart->itemList = items;
    mart->itemCount = 0;

    //i = 0;
    if (mart->itemList[0] == 0)
        return;

    do {
        ++gShopData.itemCount;
        //i = gShopData.itemCount;
    //} while (mart->itemList[i]);
    } while (mart->itemList[gShopData.itemCount]);
}

//SetShopMenuCallback
static void sub_809AC04(MainCallback callback)
{
    gShopData.callback = callback;
}

//Task_ShopMenu
static void sub_809AC10(u8 taskId)
{
    s8 input = Menu_ProcessInputNoWrapAround();
    
    switch (input)
    {
    case MENU_NOTHING_CHOSEN:
        break;
    case MENU_B_PRESSED:
        PlaySE(SE_SELECT);
        sub_809ACF8(taskId);
        break;
    default:
        gUnknown_83DF09C[Menu_GetCursorPos()].func.void_u8(taskId);
        break;
    }
}

//Task_HandleShopMenuBuy
static void sub_809AC5C(u8 taskId)
{
    SetWordTaskArg(taskId, 0xE, (u32)sub_809AE14);
    fade_screen(1, 0);
    gTasks[taskId].func = sub_809AD40;
}

//Task_HandleShopMenuSell
static void sub_809AC98(u8 taskId)
{
    SetWordTaskArg(taskId, 0xE, (u32)sub_809ACD4);
    fade_screen(1, 0);
    gTasks[taskId].func = sub_809AD40;    
}

//CB2_GoToSellMenu
static void sub_809ACD4(void)
{
    sub_8107DB4(2, POCKET_POKE_BALLS, CB2_ReturnToField);
    gFieldCallback = sub_809AD74;
}

//Task_HandleShopMenuQuit
static void sub_809ACF8(u8 taskId)
{
    sub_809AD24();
    sub_809C138();
    DestroyTask(taskId);
    if (gShopData.callback != 0)
        gShopData.callback();
}

static void sub_809AD24(void)
{
    ClearStdWindowAndFrameToTransparent(gUnknown_2039950, 2);
    RemoveWindow(gUnknown_2039950);
}

//Task_GoToBuyOrSellMenu
static void sub_809AD40(u8 taskId)
{
    if (gPaletteFade.active)
        return;
    SetMainCallback2((void *)GetWordTaskArg(taskId, 0xE));
    FreeAllWindowBuffers();
    DestroyTask(taskId);
}

//MapPostLoadHook_ReturnToShopMenu
static void sub_809AD74(void)
{
    sub_807DC00();
    CreateTask(sub_809AD8C, 8);
}

//Task_ReturnToShopMenu
static void sub_809AD8C(u8 taskId)
{
    if (field_weather_is_fade_finished() != TRUE)
        return;
    DisplayItemMessageOnField(taskId, sub_809B56C(), gText_CanIHelpWithAnythingElse, sub_809ADC0);
}

//ShowShopMenuAfterExitingBuyOrSellMenu
static void sub_809ADC0(u8 taskId)
{
    sub_809AAB0(gShopData.martType);
    DestroyTask(taskId);
}

//CB2_BuyMenu
static void sub_809ADE4(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    DoScheduledBgTilemapCopiesToVram();
}

//VBlankCB_BuyMenu
static void sub_809AE00(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

//CB2_InitBuyMenu
static void sub_809AE14(void)
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
        if ((!(sub_809AF6C())) || (!(sub_809B188())))
            return;
        sub_809AFD0();
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 0x20, 0x20);
        FillBgTilemapBufferRect_Palette0(1, 0, 0, 0, 0x20, 0x20);
        FillBgTilemapBufferRect_Palette0(2, 0, 0, 0, 0x20, 0x20);
        FillBgTilemapBufferRect_Palette0(3, 0, 0, 0, 0x20, 0x20);
        BuyMenuInitWindows(gShopData.martType);
        sub_809B080();
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
        sub_809B15C();    //BuyMenuDrawGraphics();
        sub_809B690();    //BuyMenuAddScrollIndicatorArrows();
        taskId = CreateTask(sub_809BBC0, 8);
        gTasks[taskId].tListTaskId = ListMenuInit(&gMultiuseListMenuTemplate, 0, 0);
        BlendPalettes(0xFFFFFFFF, 0x10, RGB_BLACK);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, RGB_BLACK);
        SetVBlankCallback(sub_809AE00);
        SetMainCallback2(sub_809ADE4);
        break;
    }
}

//InitShopData
static bool8 sub_809AF6C(void)
{
    gUnknown_2039954 = Alloc(sizeof(*gUnknown_2039954));
    if (gUnknown_2039954 == 0)
        goto CANCEL;
    gUnknown_2039958 = Alloc(sizeof(*gUnknown_2039958));
    if (gUnknown_2039958 == 0)
        goto CANCEL;
    gUnknown_203995C = Alloc(sizeof(*gUnknown_203995C));
    if (gUnknown_203995C == 0)
        goto CANCEL;
    gUnknown_2039960 = Alloc(sizeof(*gUnknown_2039960));
    if (gUnknown_2039960 == 0)
        goto CANCEL;
    return TRUE;
    
    CANCEL:
    sub_809B604();
    sub_809B670();
    return FALSE;
}

#ifdef NONMATCHING
//BuyMenuInitBgs
// this matches but adjusts offsets const for some reason...
static void sub_809AFD0(void)
{
    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, gUnknown_83DF0C4, 4);    //NELEMS(gUnknown_83DF0C4));
    SetBgTilemapBuffer(1, gUnknown_2039958);
    SetBgTilemapBuffer(2, gUnknown_2039960);
    SetBgTilemapBuffer(3, gUnknown_203995C);
    SetGpuReg(0x10, 0);
    SetGpuReg(0x12, 0);
    SetGpuReg(0x14, 0);
    SetGpuReg(0x16, 0);
    SetGpuReg(0x18, 0);
    SetGpuReg(0x1A, 0);
    SetGpuReg(0x1C, 0);
    SetGpuReg(0x1E, 0);
    SetGpuReg(0x50, 0);
    SetGpuReg(0, 0x1040);
    ShowBg(0);
    ShowBg(1);
    ShowBg(2);    
}
#else
NAKED
static void sub_809AFD0(void)
{
    asm_unified("\tpush {lr}\n"
                "\tmovs r0, 0\n"
                "\tbl ResetBgsAndClearDma3BusyFlags\n"
                "\tldr r1, _0809B070 @ =gUnknown_83DF0C4\n"
                "\tmovs r0, 0\n"
                "\tmovs r2, 0x4\n"
                "\tbl InitBgsFromTemplates\n"
                "\tldr r0, _0809B074 @ =gUnknown_2039958\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x1\n"
                "\tbl SetBgTilemapBuffer\n"
                "\tldr r0, _0809B078 @ =gUnknown_2039960\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x2\n"
                "\tbl SetBgTilemapBuffer\n"
                "\tldr r0, _0809B07C @ =gUnknown_203995C\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x3\n"
                "\tbl SetBgTilemapBuffer\n"
                "\tmovs r0, 0x10\n"
                "\tmovs r1, 0\n"
                "\tbl SetGpuReg\n"
                "\tmovs r0, 0x12\n"
                "\tmovs r1, 0\n"
                "\tbl SetGpuReg\n"
                "\tmovs r0, 0x14\n"
                "\tmovs r1, 0\n"
                "\tbl SetGpuReg\n"
                "\tmovs r0, 0x16\n"
                "\tmovs r1, 0\n"
                "\tbl SetGpuReg\n"
                "\tmovs r0, 0x18\n"
                "\tmovs r1, 0\n"
                "\tbl SetGpuReg\n"
                "\tmovs r0, 0x1A\n"
                "\tmovs r1, 0\n"
                "\tbl SetGpuReg\n"
                "\tmovs r0, 0x1C\n"
                "\tmovs r1, 0\n"
                "\tbl SetGpuReg\n"
                "\tmovs r0, 0x1E\n"
                "\tmovs r1, 0\n"
                "\tbl SetGpuReg\n"
                "\tmovs r0, 0x50\n"
                "\tmovs r1, 0\n"
                "\tbl SetGpuReg\n"
                "\tmovs r1, 0x82\n"
                "\tlsls r1, 5\n"
                "\tmovs r0, 0\n"
                "\tbl SetGpuReg\n"
                "\tmovs r0, 0\n"
                "\tbl ShowBg\n"
                "\tmovs r0, 0x1\n"
                "\tbl ShowBg\n"
                "\tmovs r0, 0x2\n"
                "\tbl ShowBg\n"
                "\tmovs r0, 0x3\n"
                "\tbl ShowBg\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_0809B070: .4byte gUnknown_83DF0C4\n"
                "_0809B074: .4byte gUnknown_2039958\n"
                "_0809B078: .4byte gUnknown_2039960\n"
                "_0809B07C: .4byte gUnknown_203995C\n");
}
#endif

//BuyMenuDecompressBgGraphics
static void sub_809B080(void)
{
    void* pal;
    DecompressAndCopyTileDataToVram(1, gUnknown_8E85DC8, 0x480, 0x3DC, 0);
    if ((gShopData.martType) != MART_TYPE_TMHM)
        LZDecompressWram(gUnknown_8E85EFC, gUnknown_2039954);    //gBuyMenuFrame_Tilemap
    else
        LZDecompressWram(gUnknown_8E86038, gUnknown_2039954);    //gBuyMenuFrame_TmHmTilemap
    pal = Alloc(0x40);
    LZDecompressWram(gUnknown_8E86170, pal);
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
        SetBgRectPal(1, 0, 0xE, 0x1E, 6, v);
    else
        SetBgRectPal(1, 0, 0xC, 0x1E, 8, v);
    ScheduleBgCopyTilemapToVram(1);
}

//BuyMenuDrawGraphics
static void sub_809B15C(void)
{
    sub_809B764();
    sub_809BAFC();
    BuyMenuDrawMoneyBox();
    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(1);
    ScheduleBgCopyTilemapToVram(2);
    ScheduleBgCopyTilemapToVram(3);
}

//BuyMenuBuildListMenuTemplate
static bool8 sub_809B188(void)
{
    u16 i;
    u16 v;
    struct ListMenuItem **list = &gUnknown_2039964;
    struct ShopData *mart = &gShopData;
    *list = Alloc((gShopData.itemCount + 1) * sizeof(*gUnknown_2039964));
    if (gUnknown_2039964 == 0)
        goto FREE_MEMORY;
    
    gUnknown_2039968 = Alloc((gShopData.itemCount + 1) * sizeof(*gUnknown_2039968));
    if (gUnknown_2039968 == 0)
    {
        FREE_MEMORY:
        sub_809B604();
        sub_809B670();
        return FALSE;
    }
    
    i = 0;
    if (i >= mart->itemCount)
        goto ADD_CANCEL;
    
    for (i = 0; i < mart->itemCount; i++)
    {
        sub_809B300(&gUnknown_2039964[i], mart->itemList[i], gUnknown_2039968[i]);    //PokeMartWriteNameAndIdAt(u16 a0, u16 a1, u8* a2)
    }
    
    ADD_CANCEL:
    StringCopy(gUnknown_2039968[i], gFameCheckerText_Cancel);
    gUnknown_2039964[i].label = gUnknown_2039968[i];    
    gUnknown_2039964[i].index = -2;
    gMultiuseListMenuTemplate.items = gUnknown_2039964;
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
    gMultiuseListMenuTemplate.cursorPal = GetFontAttribute(2, 5);
    gMultiuseListMenuTemplate.cursorShadowPal = GetFontAttribute(2, 7);
    gMultiuseListMenuTemplate.moveCursorFunc = sub_809B320;
    gMultiuseListMenuTemplate.itemPrintFunc = sub_809B408;
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

//PokeMartWriteNameAndIdAt
static void sub_809B300(struct ListMenuItem *list, u16 index, u8* dst)
{
    CopyItemName(index, dst);
    list->label = dst;
    list->index = index;
}

//BuyMenuPrintItemDescriptionAndShowItemIcon
static void sub_809B320(s32 item, bool8 onInit, struct ListMenu *list)
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
        sub_809B494(item);
        BuyMenuPrint(5, 2, description, 2, 3, 1, 0, 0, 0);
    }
}

//BuyMenuPrintPriceInList
#ifdef NONMATCHING    //this function was written very strangely..
static void sub_809B408(u8 windowId, s32 item, u8 y)
{
    u32 len;
    u8* loc;

    if (item != INDEX_CANCEL)
    {
        ConvertIntToDecimalStringN(gStringVar1, itemid_get_market_price(item), 0, NUM_CHARS_PRICE);
        
        //len = StringLength(gStringVar1);
        len = 4 - StringLength(gStringVar1);
        //len = NUM_CHARS_PRICE - len;
        loc = gStringVar4;
        
        while (len != 0)
        {
            loc[4-len] = 0;
            *loc++; 
            len--;
        }
        StringExpandPlaceholders(loc, gText_PokedollarVar1);
        BuyMenuPrint(windowId, 1, gStringVar4, 0x69, y, 0, 0, TEXT_SPEED_FF, 1);
    }
}
#else
NAKED
static void sub_809B408(u8 windowId, s32 item, u8 y)
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


/*===================================
MATCHED/TESTED UP UNTIL HERE
===================================*/

//LoadTmHmNameInMart
static void sub_809B494(s32 item)
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

//GetMartUnk16_4
u8 sub_809B56C(void)
{
    return gShopData.unk16_4;
}

//BuyMenuPrintCursor
static void sub_809B57C(u8 listTaskId, u8 a1)
{
    sub_809B59C(ListMenuGetYCoordForPrintingArrowCursor(listTaskId), a1);
}

static void sub_809B59C(u8 y, u8 a1)
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

//BuyMenuFreeMemory
static void sub_809B604(void)
{
    if (gUnknown_2039954 != 0)
        Free(gUnknown_2039954);
    
    if (gUnknown_2039958 != 0)
        Free(gUnknown_2039958);
    
    if (gUnknown_203995C != 0)
        Free(gUnknown_203995C);
    
    if (gUnknown_2039960 != 0)
        Free(gUnknown_2039960);
    
    if (gUnknown_2039964 != 0)
        Free(gUnknown_2039964);
    
    if (gUnknown_2039968 != 0)
        Free(gUnknown_2039968);
    
    FreeAllWindowBuffers();        
}

//SetShopExitCallback
static void sub_809B670(void)
{
    gFieldCallback = sub_809AD74;
    SetMainCallback2(CB2_ReturnToField);
}


//BuyMenuAddScrollIndicatorArrows
static void sub_809B690(void)
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

//BuyQuantityAddScrollIndicatorArrows
static void sub_809B6FC(void)
{
    gShopData.unk18 = 1;
    gShopData.unk16_11 = AddScrollIndicatorArrowPairParameterized(SCROLL_ARROW_UP, 0x98, 0x48, 0x68, 2, 0x6E, 0x6E, &gShopData.unk18);
}

//BuyMenuRemoveScrollIndicatorArrows
static void sub_809B73C(void)
{
    if ((gShopData.unk16_11) == 0x1F)
        return;
    
    RemoveScrollIndicatorArrowPair(gShopData.unk16_11);
    gShopData.unk16_11 = 0x1F;
}

static void sub_809B764(void)
{
    sub_809B92C();
    sub_809BA40();
    sub_809B778();
}

//BuyMenuDrawMapBg
static void sub_809B778(void)
{    
    s16 i;
    s16 j;
    s16 x;
    s16 y;
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
                sub_809B850(i, j, (u16*)mapData->primaryTileset->metatiles + metatile * 8, metatileLayerType);
            }
            else
            {
                sub_809B850(i, j, (u16*)mapData->secondaryTileset->metatiles + ((metatile - NUM_METATILES_IN_PRIMARY) * 8), metatileLayerType);
            }
        }
    }
}

//BuyMenuDrawMapMetatile
static void sub_809B850(s16 x, s16 y, const u16 *src, u8 metatileLayerType)
{
    u16 offset1 = x * 2;
    u16 offset2 = ((y << 0x16) + 0x400000) >> 0x10;

    switch (metatileLayerType)
    {
    case 0:
        sub_809B904(*gUnknown_2039960, offset1, offset2, src);
        sub_809B904(*gUnknown_2039958, offset1, offset2, src + 4);
        break;
    case 1:
        sub_809B904(*gUnknown_203995C, offset1, offset2, src);
        sub_809B904(*gUnknown_2039960, offset1, offset2, src + 4);
        break;
    case 2:
        sub_809B904(*gUnknown_203995C, offset1, offset2, src);
        sub_809B904(*gUnknown_2039958, offset1, offset2, src + 4);
        break;
    }
}

//BuyMenuDrawMapMetatileLayer
static void sub_809B904(u16 *dest, s16 offset1, s16 offset2, const u16 *src)
{
    // This function draws a whole 2x2 metatile.
    dest[offset1 + offset2] = src[0]; // top left
    dest[offset1 + offset2 + 1] = src[1]; // top right
    dest[offset1 + offset2 + 32] = src[2]; // bottom left
    dest[offset1 + offset2 + 33] = src[3]; // bottom right
}


// BuyMenuCollectEventObjectData(void)
#ifdef NONMATCHING
static void sub_809B92C(void)
{
    s16 facingX;
    s16 facingY;
    u8 y;
    u8 x;
    u8 num = 0;
    u8 z;

    GetXYCoordsOneStepInFrontOfPlayer(&facingX, &facingY);
    z = PlayerGetZCoord();
    
    for (y = 0; y < MAP_OBJECTS_COUNT; y++)
        gUnknown_20398B4[y].eventObjId = MAP_OBJECTS_COUNT;
    
    for (y = 0; y < 5; y++)
    {
        for (x = 0; x < 7; x++)
        {
            u8 eventObjId = GetFieldObjectIdByXYZ(facingX - 4 + x, facingY - 2 + y, z);
            if (eventObjId != MAP_OBJECTS_COUNT)
            {
                gUnknown_20398B4[num].eventObjId = eventObjId;
                gUnknown_20398B4[num].x = x;
                gUnknown_20398B4[num].y = y;
                //gUnknown_20398B4[num].layerType = MapGridGetMetatileLayerTypeAt(facingX - 4 + x, facingY - 2 + y);

                switch (gMapObjects[eventObjId].facingDirection)
                {
                    case DIR_SOUTH:
                        gUnknown_20398B4[num].animNum = 0;
                        break;
                    case DIR_NORTH:
                        gUnknown_20398B4[num].animNum = 1;
                        break;
                    case DIR_WEST:
                        gUnknown_20398B4[num].animNum = 2;
                        break;
                    case DIR_EAST:
                    default:
                        gUnknown_20398B4[num].animNum = 3;
                        break;
                }
                num++;
            }
        }
    }
}
#else
NAKED
static void sub_809B92C(void)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x8\n"
                "\tmovs r0, 0\n"
                "\tmov r9, r0\n"
                "\tmov r4, sp\n"
                "\tadds r4, 0x2\n"
                "\tmov r0, sp\n"
                "\tadds r1, r4, 0\n"
                "\tbl GetXYCoordsOneStepInFrontOfPlayer\n"
                "\tbl PlayerGetZCoord\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tstr r0, [sp, 0x4]\n"
                "\tmovs r5, 0\n"
                "\tldr r2, _0809B9DC @ =gUnknown_20398B4\n"
                "\tmovs r1, 0x10\n"
                "_0809B958:\n"
                "\tlsls r0, r5, 3\n"
                "\tadds r0, r2\n"
                "\tstrh r1, [r0]\n"
                "\tadds r0, r5, 0x1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r5, r0, 24\n"
                "\tcmp r5, 0xF\n"
                "\tbls _0809B958\n"
                "\tmovs r5, 0\n"
                "\tldr r6, _0809B9E0 @ =gUnknown_20398BA\n"
                "\tsubs r1, r6, 0x6\n"
                "\tmov r8, r1\n"
                "_0809B970:\n"
                "\tmovs r4, 0\n"
                "\tadds r2, r5, 0x1\n"
                "\tmov r10, r2\n"
                "_0809B976:\n"
                "\tmov r1, sp\n"
                "\tldr r3, _0809B9E4 @ =0x0000fffd\n"
                "\tadds r0, r3, 0\n"
                "\tldrh r1, [r1]\n"
                "\tadds r0, r1\n"
                "\tadds r0, r4\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tldr r2, _0809B9E8 @ =0x0000fffe\n"
                "\tadds r1, r2, 0\n"
                "\tmov r3, sp\n"
                "\tldrh r3, [r3, 0x2]\n"
                "\tadds r1, r3\n"
                "\tadds r1, r5\n"
                "\tlsls r1, 16\n"
                "\tlsrs r1, 16\n"
                "\tldr r2, [sp, 0x4]\n"
                "\tbl GetFieldObjectIdByXYZ\n"
                "\tlsls r0, 24\n"
                "\tlsrs r3, r0, 24\n"
                "\tcmp r3, 0x10\n"
                "\tbeq _0809BA1C\n"
                "\tmov r0, r9\n"
                "\tlsls r2, r0, 3\n"
                "\tmov r1, r8\n"
                "\tadds r0, r2, r1\n"
                "\tmovs r7, 0\n"
                "\tstrh r3, [r0]\n"
                "\tmov r0, r8\n"
                "\tadds r0, 0x2\n"
                "\tadds r0, r2, r0\n"
                "\tstrh r4, [r0]\n"
                "\tldr r1, _0809B9EC @ =gUnknown_20398B8\n"
                "\tadds r0, r2, r1\n"
                "\tstrh r5, [r0]\n"
                "\tldr r1, _0809B9F0 @ =gMapObjects\n"
                "\tlsls r0, r3, 3\n"
                "\tadds r0, r3\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r1\n"
                "\tldrb r0, [r0, 0x18]\n"
                "\tlsls r0, 28\n"
                "\tlsrs r0, 28\n"
                "\tcmp r0, 0x2\n"
                "\tbeq _0809BA00\n"
                "\tcmp r0, 0x2\n"
                "\tbgt _0809B9F4\n"
                "\tcmp r0, 0x1\n"
                "\tbeq _0809B9FA\n"
                "\tb _0809BA0C\n"
                "\t.align 2, 0\n"
                "_0809B9DC: .4byte gUnknown_20398B4\n"
                "_0809B9E0: .4byte gUnknown_20398BA\n"
                "_0809B9E4: .4byte 0x0000fffd\n"
                "_0809B9E8: .4byte 0x0000fffe\n"
                "_0809B9EC: .4byte gUnknown_20398B8\n"
                "_0809B9F0: .4byte gMapObjects\n"
                "_0809B9F4:\n"
                "\tcmp r0, 0x3\n"
                "\tbeq _0809BA06\n"
                "\tb _0809BA0C\n"
                "_0809B9FA:\n"
                "\tadds r0, r2, r6\n"
                "\tstrh r7, [r0]\n"
                "\tb _0809BA12\n"
                "_0809BA00:\n"
                "\tadds r1, r2, r6\n"
                "\tmovs r0, 0x1\n"
                "\tb _0809BA10\n"
                "_0809BA06:\n"
                "\tadds r1, r2, r6\n"
                "\tmovs r0, 0x2\n"
                "\tb _0809BA10\n"
                "_0809BA0C:\n"
                "\tadds r1, r2, r6\n"
                "\tmovs r0, 0x3\n"
                "_0809BA10:\n"
                "\tstrh r0, [r1]\n"
                "_0809BA12:\n"
                "\tmov r0, r9\n"
                "\tadds r0, 0x1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tmov r9, r0\n"
                "_0809BA1C:\n"
                "\tadds r0, r4, 0x1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r4, r0, 24\n"
                "\tcmp r4, 0x6\n"
                "\tbls _0809B976\n"
                "\tmov r2, r10\n"
                "\tlsls r0, r2, 24\n"
                "\tlsrs r5, r0, 24\n"
                "\tcmp r5, 0x4\n"
                "\tbls _0809B970\n"
                "\tadd sp, 0x8\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n");
}
#endif

//BuyMenuDrawEventObjects
static void sub_809BA40(void)
{
    u8 i;
    u8 spriteId;
    const struct MapObjectGraphicsInfo *graphicsInfo;

    for (i = 0; i < MAP_OBJECTS_COUNT; i++)
    {
        if (gUnknown_20398B4[i][EVENT_OBJ_ID] == MAP_OBJECTS_COUNT)
            continue;

        graphicsInfo = GetFieldObjectGraphicsInfo(gMapObjects[gUnknown_20398B4[i][EVENT_OBJ_ID]].graphicsId);        
        spriteId = AddPseudoEventObject(
            gMapObjects[gUnknown_20398B4[i][EVENT_OBJ_ID]].graphicsId,
            SpriteCallbackDummy,
            (((u16)gUnknown_20398B4[i][X_COORD] << 0x14) + 0xFFF80000) >> 0x10,
            (u16)gUnknown_20398B4[i][Y_COORD] * 16 + 48 - graphicsInfo->height / 2,
            2);
        StartSpriteAnim(&gSprites[spriteId], gUnknown_20398B4[i][ANIM_NUM]);
    }
}

static void sub_809BAFC(void)
{
    s16 i;

    u16 *dst = *gUnknown_2039958;
    u16 *src = *gUnknown_2039954;

    for (i = 0; i < 0x400; i++)
    {
        if (src[i] == 0)
            continue;
        dst[i] = src[i] + 0xb3dc;
    }
}

//BuyMenuPrintItemQuantityAndPrice
static void sub_809BB44(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    
    FillWindowPixelBuffer(3, PIXEL_FILL(1));
    PrintMoneyAmount(3, 0x36, 0xA, gShopData.itemPrice, TEXT_SPEED_FF);
    ConvertIntToDecimalStringN(gStringVar1, tItemCount, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
    BuyMenuPrint(3, 0, gStringVar4, 2, 0xA, 0, 0, 0, 1);
}

//Task_BuyMenu
static void sub_809BBC0(u8 taskId)
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
            sub_809C004(taskId);
            break;
        default:
            PlaySE(SE_SELECT);
            tItemId = itemId;
            ClearWindowTilemap(5);
            sub_809B73C();
            sub_809B57C(tListTaskId, 2);
            sub_809B10C(1);
            gShopData.itemPrice = itemid_get_market_price(itemId);
            if (!IsEnoughMoney(&gSaveBlock1Ptr->money, gShopData.itemPrice))
            {
                BuyMenuDisplayMessage(taskId, gText_YouDontHaveMoney, sub_809BF98);
            }
            else
            {
                CopyItemName(itemId, gStringVar1);
                BuyMenuDisplayMessage(taskId, gText_Var1CertainlyHowMany, sub_809BCA0);
            }
        }
    }
}

//Task_BuyHowManyDialogueInit
static void sub_809BCA0(u8 taskId)
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
    sub_809BB44(taskId);
    ScheduleBgCopyTilemapToVram(0);
    maxQuantity = GetMoney(&gSaveBlock1Ptr->money) / itemid_get_market_price(tItemId);
    if (maxQuantity > 99)
        gShopData.maxQuantity = (u8)99;
    else
        gShopData.maxQuantity = (u8)maxQuantity;
    
    if (maxQuantity != 1)
        sub_809B6FC();
    
    gTasks[taskId].func = sub_809BD8C;    
}

//Task_BuyHowManyDialogueHandleInput
static void sub_809BD8C(u8 taskId)
{
    s16 *data = gTasks[taskId].data;


    if (AdjustQuantityAccordingToDPadInput(&tItemCount, gShopData.maxQuantity) == TRUE)
    {
        gShopData.itemPrice = itemid_get_market_price(tItemId) * tItemCount;
        sub_809BB44(taskId);
    }
    else
    {
        if (JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            sub_809B73C();
            ClearStdWindowAndFrameToTransparent(3, 0);
            ClearStdWindowAndFrameToTransparent(1, 0);
            ClearWindowTilemap(3);
            ClearWindowTilemap(1);
            PutWindowTilemap(4);
            CopyItemName(tItemId, gStringVar1);
            ConvertIntToDecimalStringN(gStringVar2, tItemCount, STR_CONV_MODE_LEFT_ALIGN, 2);
            ConvertIntToDecimalStringN(gStringVar3, gShopData.itemPrice, STR_CONV_MODE_LEFT_ALIGN, 8);
            BuyMenuDisplayMessage(taskId, gText_Var1AndYouWantedVar2, sub_809BE90);
        }
        else if (JOY_NEW(B_BUTTON))
        {            
            PlaySE(SE_SELECT);
            sub_809B73C();
            ClearStdWindowAndFrameToTransparent(3, 0);
            ClearStdWindowAndFrameToTransparent(1, 0);
            ClearWindowTilemap(3);
            ClearWindowTilemap(1);
            sub_809BF98(taskId);
        }
    }
}

//CreateBuyMenuConfirmPurchaseWindow
static void sub_809BE90(u8 taskId)
{
    BuyMenuConfirmPurchase(taskId, gUnknown_83DF0B4);    //sShopBuyMenuYesNoWindowTemplates
}

//BuyMenuTryMakePurchase
static void sub_809BEA4(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    PutWindowTilemap(4);
    if (AddBagItem(tItemId, tItemCount) == TRUE)
    {
        BuyMenuDisplayMessage(taskId, gText_HereYouGoThankYou, sub_809BF0C);
        nullsub_52(taskId);
        sub_809C09C(tItemId, tItemCount, 1);
    }
    else
    {
        BuyMenuDisplayMessage(taskId, gText_NoMoreRoomForThis, sub_809BF98);
    }
}

//BuyMenuSubtractMoney
static void sub_809BF0C(u8 taskId)
{
    IncrementGameStat(GAME_STAT_SHOPPED);
    RemoveMoney(&gSaveBlock1Ptr->money, gShopData.itemPrice);
    PlaySE(SE_SHOP);
    PrintMoneyAmountInMoneyBox(0, GetMoney(&gSaveBlock1Ptr->money), 0);
    gTasks[taskId].func = sub_809BF68;
}

//Task_ReturnToItemListAfterItemPurchase
static void sub_809BF68(u8 taskId)
{
    if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        sub_809BF98(taskId);
    }
}

//BuyMenuReturnToItemList
static void sub_809BF98(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    ClearDialogWindowAndFrameToTransparent(2, 0);
    sub_809B57C(tListTaskId, 1);
    sub_809B10C(0);
    PutWindowTilemap(4);
    PutWindowTilemap(5);
    if (gShopData.martType == MART_TYPE_TMHM)
        PutWindowTilemap(6);
    
    ScheduleBgCopyTilemapToVram(0);
    sub_809B690();
    gTasks[taskId].func = sub_809BBC0;
}

//ExitBuyMenu
static void sub_809C004(u8 taskId)
{
    gFieldCallback = sub_809AD74;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
    gTasks[taskId].func = sub_809C04C;
}

//Task_ExitBuyMenu
static void sub_809C04C(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    
    if (!gPaletteFade.active)
    {
        DestroyListMenuTask(tListTaskId, 0, 0);
        sub_809B604();
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
void sub_809C09C(u16 item, u16 quantity, u8 a2)
{
    struct Purchase *tmp;
    
    if (gUnknown_203996C.unkA == a2)
    {
        tmp = &gUnknown_203996C;
    }
    else
    {
        if (gUnknown_203996C.unk16 == a2)
        {
            tmp = &gUnknown_203996C + 12;
        }
        else
        {
            tmp = &gUnknown_203996C + 12;
            if (gUnknown_203996C.unkA == 0)
            {
                tmp = &gUnknown_203996C;
                gUnknown_203996C.unkA = a2;
            }
        }
    }
    if (tmp->unk4 != 0)
    {
        gUnknown_203996C.unk9 = 1;
    }
    
    gUnknown_203996C.unk4 = item;
    if (gUnknown_203996C.unk6 <= 998)
    {
        gUnknown_203996C.unk6 += item;
        if (item > 999)
            gUnknown_203996C.unk6 = 999;
    }
    if (gUnknown_203996C.unk0 < 999998)
    {
        gUnknown_203996C.unk0 += ((s16)itemid_get_market_price(item) >> (quantity-1))*quantity;
        if (gUnknown_203996C.unk0 > 999999)
            gUnknown_203996C.unk0 = 999999;
    }    
}
#else
NAKED
void sub_809C09C(u16 item, u16 quantity, u8 a2)
{
    asm_unified("\tpush {r4-r6,lr}\n"
                "\tlsls r0, 16\n"
                "\tlsrs r3, r0, 16\n"
                "\tlsls r1, 16\n"
                "\tlsrs r6, r1, 16\n"
                "\tlsls r2, 24\n"
                "\tlsrs r5, r2, 24\n"
                "\tldr r1, _0809C0B8 @ =gUnknown_203996C\n"
                "\tldrb r2, [r1, 0xA]\n"
                "\tcmp r2, r5\n"
                "\tbne _0809C0BC\n"
                "\tadds r4, r1, 0\n"
                "\tb _0809C0D4\n"
                "\t.align 2, 0\n"
                "_0809C0B8: .4byte gUnknown_203996C\n"
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

//RecordQuestLogItemPurchase
static void sub_809C138(void)
{
    struct MartHistory *history = &gUnknown_203996C;
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
    sub_809ABD8(itemsForSale);
    sub_809AAB0(MART_TYPE_REGULAR);
    sub_809AC04(EnableBothScriptContexts);
    nullsub_53();
    memset(&gUnknown_203996C, 0, sizeof(struct MartHistory));
    gUnknown_203996C.unk8 = gMapHeader.regionMapSectionId;
    gUnknown_203996C.unk14 = gMapHeader.regionMapSectionId;
}

void CreateDecorationShop1Menu(const u16 *itemsForSale)
{
    sub_809ABD8(itemsForSale);
    sub_809AAB0(MART_TYPE_DECOR);
    sub_809AC04(EnableBothScriptContexts);
}

void CreateDecorationShop2Menu(const u16 *itemsForSale)
{
    sub_809ABD8(itemsForSale);
    sub_809AAB0(MART_TYPE_DECOR2);
    sub_809AC04(EnableBothScriptContexts);
}




///////////////////////the following functions belong??////////////////////////////

#ifdef NONMATCHING
void sub_809C1D8(u8 taskId, const u16* a1, u16 a2)
{
    
}
#else
NAKED
void sub_809C1D8(u8 taskId, const u16* a1, u16 a2)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x10\n"
                "\tmov r9, r1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tlsls r2, 16\n"
                "\tlsrs r2, 16\n"
                "\tmov r10, r2\n"
                "\tldr r2, _0809C26C @ =gTasks\n"
                "\tlsls r1, r0, 2\n"
                "\tadds r1, r0\n"
                "\tlsls r1, 3\n"
                "\tadds r1, r2\n"
                "\tldrh r0, [r1, 0x10]\n"
                "\tsubs r0, 0x1\n"
                "\tlsls r0, 16\n"
                "\tlsrs r5, r0, 16\n"
                "\tldrh r0, [r1, 0x12]\n"
                "\tsubs r0, 0x1\n"
                "\tlsls r0, 16\n"
                "\tlsrs r3, r0, 16\n"
                "\tldrh r4, [r1, 0xA]\n"
                "\tmovs r2, 0xC\n"
                "\tldrsh r0, [r1, r2]\n"
                "\tcmp r0, 0\n"
                "\tbne _0809C29C\n"
                "\tmovs r2, 0\n"
                "\tlsls r5, 16\n"
                "\tstr r5, [sp, 0xC]\n"
                "\tlsls r0, r3, 16\n"
                "\tlsls r1, r4, 16\n"
                "\tasrs r0, 16\n"
                "\tstr r0, [sp]\n"
                "\tasrs r1, 16\n"
                "\tstr r1, [sp, 0x4]\n"
                "\tlsls r0, r1, 1\n"
                "\tmov r1, r9\n"
                "\tadds r7, r0, r1\n"
                "_0809C22C:\n"
                "\tmovs r4, 0\n"
                "\tlsls r2, 16\n"
                "\tmov r8, r2\n"
                "\tasrs r0, r2, 16\n"
                "\tldr r2, [sp]\n"
                "\tadds r6, r2, r0\n"
                "_0809C238:\n"
                "\tldr r0, [sp, 0xC]\n"
                "\tasrs r1, r0, 16\n"
                "\tlsls r4, 16\n"
                "\tasrs r0, r4, 16\n"
                "\tadds r5, r1, r0\n"
                "\tadds r0, r5, 0\n"
                "\tadds r1, r6, 0\n"
                "\tbl MapGridGetMetatileIdAt\n"
                "\tmovs r2, 0\n"
                "\tldrsh r1, [r7, r2]\n"
                "\tlsls r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r1, r0\n"
                "\tbne _0809C280\n"
                "\tldr r0, [sp, 0x4]\n"
                "\tcmp r0, 0x2\n"
                "\tbeq _0809C270\n"
                "\tldrh r0, [r7, 0x2]\n"
                "\tmov r2, r10\n"
                "\torrs r2, r0\n"
                "\tadds r0, r5, 0\n"
                "\tadds r1, r6, 0\n"
                "\tbl MapGridSetMetatileIdAt\n"
                "\tb _0809C280\n"
                "\t.align 2, 0\n"
                "_0809C26C: .4byte gTasks\n"
                "_0809C270:\n"
                "\tmov r1, r9\n"
                "\tldrh r0, [r1]\n"
                "\tmov r2, r10\n"
                "\torrs r2, r0\n"
                "\tadds r0, r5, 0\n"
                "\tadds r1, r6, 0\n"
                "\tbl MapGridSetMetatileIdAt\n"
                "_0809C280:\n"
                "\tmovs r2, 0x80\n"
                "\tlsls r2, 9\n"
                "\tadds r0, r4, r2\n"
                "\tlsrs r4, r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r0, 0x2\n"
                "\tble _0809C238\n"
                "\tadds r0, r2, 0\n"
                "\tadd r0, r8\n"
                "\tlsrs r2, r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r0, 0x2\n"
                "\tble _0809C22C\n"
                "\tb _0809C324\n"
                "_0809C29C:\n"
                "\tmovs r2, 0\n"
                "\tlsls r5, 16\n"
                "\tstr r5, [sp, 0xC]\n"
                "\tlsls r0, r3, 16\n"
                "\tlsls r1, r4, 16\n"
                "\tasrs r0, 16\n"
                "\tstr r0, [sp, 0x8]\n"
                "\tasrs r7, r1, 16\n"
                "_0809C2AC:\n"
                "\tmovs r4, 0\n"
                "\tlsls r2, 16\n"
                "\tmov r8, r2\n"
                "\tasrs r0, r2, 16\n"
                "\tldr r1, [sp, 0x8]\n"
                "\tadds r6, r1, r0\n"
                "_0809C2B8:\n"
                "\tldr r2, [sp, 0xC]\n"
                "\tasrs r1, r2, 16\n"
                "\tlsls r4, 16\n"
                "\tasrs r0, r4, 16\n"
                "\tadds r5, r1, r0\n"
                "\tadds r0, r5, 0\n"
                "\tadds r1, r6, 0\n"
                "\tbl MapGridGetMetatileIdAt\n"
                "\tmovs r1, 0x2\n"
                "\tsubs r1, r7\n"
                "\tlsls r1, 1\n"
                "\tadd r1, r9\n"
                "\tmovs r2, 0\n"
                "\tldrsh r1, [r1, r2]\n"
                "\tlsls r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r1, r0\n"
                "\tbne _0809C30A\n"
                "\tcmp r7, 0x2\n"
                "\tbeq _0809C2FA\n"
                "\tmovs r0, 0x1\n"
                "\tsubs r0, r7\n"
                "\tlsls r0, 1\n"
                "\tadd r0, r9\n"
                "\tldrh r0, [r0]\n"
                "\tmov r2, r10\n"
                "\torrs r2, r0\n"
                "\tadds r0, r5, 0\n"
                "\tadds r1, r6, 0\n"
                "\tbl MapGridSetMetatileIdAt\n"
                "\tb _0809C30A\n"
                "_0809C2FA:\n"
                "\tmov r1, r9\n"
                "\tldrh r0, [r1, 0x4]\n"
                "\tmov r2, r10\n"
                "\torrs r2, r0\n"
                "\tadds r0, r5, 0\n"
                "\tadds r1, r6, 0\n"
                "\tbl MapGridSetMetatileIdAt\n"
                "_0809C30A:\n"
                "\tmovs r2, 0x80\n"
                "\tlsls r2, 9\n"
                "\tadds r0, r4, r2\n"
                "\tlsrs r4, r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r0, 0x2\n"
                "\tble _0809C2B8\n"
                "\tadds r0, r2, 0\n"
                "\tadd r0, r8\n"
                "\tlsrs r2, r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r0, 0x2\n"
                "\tble _0809C2AC\n"
                "_0809C324:\n"
                "\tadd sp, 0x10\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n");
}
#endif

static void sub_809C334(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 v1;
    
    data[3] = 1;
    switch (data[0])
    {
    case 0:
        sub_809C1D8(taskId, gUnknown_83DF0D4, 0);
        break;
    case 1:
        sub_809C1D8(taskId, gUnknown_83DF0DA, 0);
        break;
    case 2:
        sub_809C1D8(taskId, gUnknown_83DF0E0, 0xC00);
        break;
    case 3:
        sub_809C1D8(taskId, gUnknown_83DF0E6, 0);
        break;
    case 4:
        sub_809C1D8(taskId, gUnknown_83DF0EC, 0xC00);
        break;
    case 5:
        sub_809C1D8(taskId, gUnknown_83DF0F2, 0);
        break;
    case 6:
        sub_809C1D8(taskId, gUnknown_83DF0F8, 0);
    default:
        break;
    }
    data[0] = (data[0] + 1) & 7;
    v1 = data[0] & 7;
    //ldrh r5, [r4] instead mov r5, r0 somehow 
    if (v1 == 0)
    {
        DrawWholeMapView();
        data[1] = (data[1] + 1) % 3;
        data[3] = v1;
    }
}

static u8 sub_809C3FC(u16 a0)
{
    u8 taskId;
    s16 *data;

    taskId = CreateTask(sub_809C334, 0);
    data = gTasks[taskId].data;
    PlayerGetDestCoords(&tX, &tItemId);
    t0 = 0;
    tItemCount = 0;
    data[2] = a0;
    sub_809C334(taskId);
    return taskId;
}

void sub_809C448(u8 a0)
{
    u8 taskId;
    
    taskId = sub_809C3FC(a0);
    gUnknown_2039984 = taskId;
}

void sub_809C460(void)
{
    DestroyTask(gUnknown_2039984);
}

bool8 sub_809C474(void)
{    
    if (gTasks[gUnknown_2039984].data[3] == 0)
    {
        if (gTasks[gUnknown_2039984].data[1] != 2)
            return TRUE;
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

// special 0x1b5 - creates a tile animaiton one block left two-four up the player
void sub_809C4A8(void)
{
    u8 taskId;
    s16 *data;
    
    taskId = CreateTask(sub_809C500, 0);

    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 0;

    data = gTasks[taskId].data;
    PlayerGetDestCoords(&data[2], &data[3]);
    if (gSpecialVar_0x8004 == 0)
    {
        gTasks[taskId].data[2] += 6;
        gTasks[taskId].data[3] -= 5;
    }
    else
    {
        gTasks[taskId].data[2]--;
        gTasks[taskId].data[3] -= 5;
    }    
}

static void sub_809C500(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    
    if (data[0] == 0)
    {
        if ((data[1] & 1) == 0)
        {
            MapGridSetMetatileIdAt(data[2], data[3], 0xEB5);
            MapGridSetMetatileIdAt(data[2], data[3] + 2, 0xEB7);
        }
        else
        {
            MapGridSetMetatileIdAt(data[2], data[3], 0xEB6);
            MapGridSetMetatileIdAt(data[2], data[3] + 2, 0xEB8);
        }
        CurrentMapDrawMetatileAt(data[2], data[3]);
        CurrentMapDrawMetatileAt(data[2], data[3] + 2);
    }
    
    data[0]++;
    if (data[0] != 0x10)
        return;
    data[0] = 0;
    
    data[0] == 0;
    data[1]++;
    if (data[1] != 0xD)
        return;
    
    MapGridSetMetatileIdAt(data[2], data[3], 0xE8A);
    MapGridSetMetatileIdAt(data[2], data[3] + 2, 0xE96);
    CurrentMapDrawMetatileAt(data[2], data[3]);
    CurrentMapDrawMetatileAt(data[2], data[3] + 2);
    DestroyTask(taskId);
}

// special 0x1B7 - creates a tile animation two-six blocks right from the top-left corner of the screen
void sub_809C5FC(void)
{
    u8 taskId;
    s16 *data;
    
    taskId = CreateTask(sub_809C640, 0);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 0;

    data = gTasks[taskId].data;
    PlayerGetDestCoords(&data[2], &data[3]);
    gTasks[taskId].data[2] += 4;
    gTasks[taskId].data[3] -= 5;
}

static void sub_809C640(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    
    if (data[0] == 0)
    {
        if (data[1] != 0)
        {
            MapGridSetMetatileIdAt(data[2], data[3], 0xE85);
            MapGridSetMetatileIdAt(data[2], data[3] + 1, 0xEB4);
            CurrentMapDrawMetatileAt(data[2], data[3]);
            CurrentMapDrawMetatileAt(data[2], data[3] + 1);
            if (data[1] == 4)
            {
                DestroyTask(taskId);
                return;
            }
            data[2]--;
        }
        MapGridSetMetatileIdAt(data[2], data[3], 0xEB9);
        MapGridSetMetatileIdAt(data[2], data[3] + 1, 0xEBA);
        CurrentMapDrawMetatileAt(data[2], data[3]);
        CurrentMapDrawMetatileAt(data[2], data[3] + 1);
    }
    data[0]++;
    if (data[0] == 4)
    {
        data[0] = 0;
        data[1]++;
    }
}
