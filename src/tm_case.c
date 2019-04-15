#include "global.h"
#include "malloc.h"
#include "bg.h"
#include "decompress.h"
#include "gpu_regs.h"
#include "palette.h"
#include "graphics.h"
#include "task.h"
#include "text.h"
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
#include "string_util.h"
#include "party_menu.h"
#include "data2.h"
#include "scanline_effect.h"
#include "sound.h"
#include "strings.h"
#include "tm_case.h"
#include "menu_indicators.h"
#include "constants/items.h"
#include "constants/songs.h"

struct UnkStruct_203B10C
{
    void (* unk_00)(void);
    u8 unk_04;
    u8 unk_05;
    u8 unk_06;
    u16 unk_08;
    u16 unk_0a;
};

struct UnkStruct_203B118
{
    void (* unk_00)(void);
    u8 unk_04;
    u8 unk_05;
    u8 unk_06;
    u8 unk_07;
    u8 unk_08;
    u16 unk_0a;
    const u8 * unk_0c;
    u8 unk_10;
    s16 unk_12;
    u8 filler_14[8];
};

struct UnkStruct_203B11C
{
    struct ItemSlot bagPocket_TMHM[BAG_TMHM_COUNT];
    struct ItemSlot bagPocket_KeyItems[BAG_KEYITEMS_COUNT];
    u16 unk_160;
    u16 unk_162;
};

static EWRAM_DATA struct UnkStruct_203B10C gUnknown_203B10C = {};
static EWRAM_DATA struct UnkStruct_203B118 * gUnknown_203B118 = NULL;
static EWRAM_DATA struct UnkStruct_203B11C * gUnknown_203B11C = NULL;
static EWRAM_DATA void * gUnknown_203B120 = NULL; // tilemap buffer
static EWRAM_DATA struct ListMenuItem * gUnknown_203B124 = NULL;
static EWRAM_DATA u8 (* gUnknown_203B128)[29] = NULL;
static EWRAM_DATA u16 * gUnknown_203B12C = NULL;

static void sub_8131894(void);
static bool8 sub_81318C0(void);
static void sub_8131A8C(void);
static void sub_8131AB8(void);
static bool8 sub_8131B20(void);
static void sub_8131C10(void);
static void sub_8131C50(void);
static void GetTMNumberAndMoveString(u8 * dest, u16 itemId);
static void sub_8131E18(s32 itemIndex, bool8 onInit, struct ListMenu *list);
static void sub_8131E68(u8 windowId, s32 itemId, u8 y);
static void sub_8131F0C(s32 itemIndex);
static void sub_8131FB0(u8 a0, u8 a1);
static void sub_8132018(void);
static void sub_81320BC(void);
static void sub_8132120(void);
static void sub_8132170(void);
static void sub_813226C(u8 taskId);
static void sub_81322D4(u8 taskId);
static void SelectTMAction_FromFieldBag(u8 taskId);
static void sub_8132568(u8 taskId);
static void sub_81325F0(u8 taskId);
static void sub_813265C(u8 taskId);
static void sub_81326F8(u8 taskId);
static void sub_8132714(u8 taskId);
static void sub_8132758(u8 taskId);
static void sub_8132780(u8 taskId);
static void sub_81327FC(u8 taskId);
static void sub_8132868(u8 taskId);
static void sub_81328B8(u8 taskId);
static void SelectTMAction_FromSellMenu(u8 taskId);
static void sub_81329C4(u8 taskId);
static void sub_8132A34(u8 taskId);
static void sub_8132A48(u8 taskId);
static void sub_8132AAC(u8 taskId);
static void sub_8132B5C(s16 quantity, s32 value);
static void sub_8132BC8(u8 taskId);
static void sub_8132CAC(u8 taskId);
static void sub_8132D34(u8 taskId);
static void sub_8132E0C(u8 taskId);
static void sub_8132F20(u8 taskId);
static void sub_8132F60(u8 taskId);
static void sub_8133244(void);
static void sub_81332EC(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed, u8 colorIdx);
static void sub_8133354(u8 windowId);
static void sub_8133368(u8 windowId);
static void sub_813337C(u8 taskId, u8 windowId, const u8 * str, TaskFunc func);
static void sub_81333C4(void);
static void sub_8133404(void);
static void sub_8133444(u16 itemId);
static void sub_81335B0(u8 windowId, u8 x, u8 y);
static void sub_81335E0(void);
static void sub_8133604(u8 taskId, const TaskFunc * ptrs);
static u8 sub_8133630(u8 * a0, u8 a1);
static void sub_8133664(u8 * a0);
static u8 sub_813368C(u16 itemId);
static void sub_8133714(struct Sprite * sprite, u8 var);
static void sub_8133730(u8 type);
static void sub_8133790(struct Sprite * sprite, u8 var);
static void sub_81337E4(u8 a0, u16 itemId);
static void sub_8133810(struct Sprite * sprite);
static void sub_81338A8(void);

static const struct BgTemplate gUnknown_8463134[] = {
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

static void (*const gUnknown_8463140[])(u8 taskId) = {
    SelectTMAction_FromFieldBag,
    sub_8132868,
    SelectTMAction_FromSellMenu,
    sub_81328B8
};

static const struct MenuAction gUnknown_8463150[] = {
    {gUnknown_84161A0, sub_81325F0},
    {gUnknown_84161B2, sub_813265C},
    {gUnknown_84161C8, sub_81327FC},
};

static const u8 gUnknown_8463168[] = {0, 1, 2};
static const u8 gUnknown_846316B[] = {1, 2, 0};
static const TaskFunc gUnknown_8463170[] = {sub_8132CAC, sub_8132A48};

static const u8 gUnknown_8463178[] = _("{CLEAR_TO 18}");
static const u8 gUnknown_846317C[] = _(" ");

static ALIGNED(4) const u16 gUnknown_8463180[] = {RGB(8, 8, 8), RGB(30, 16, 6)};

static const struct TextColor gUnknown_8463184[] = {
    {0, 1, 2},
    {0, 2, 3},
    {0, 3, 6},
    {0, 14, 10}
};

static const struct WindowTemplate gUnknown_8463190[] = {
    {0x00, 0x0a, 0x01, 0x13, 0x0a, 0x0f, 0x0081},
    {0x00, 0x0c, 0x0c, 0x12, 0x08, 0x0a, 0x013f},
    {0x01, 0x05, 0x0f, 0x0f, 0x04, 0x0d, 0x01f9},
    {0x00, 0x00, 0x01, 0x0a, 0x02, 0x0f, 0x0235},
    {0x00, 0x01, 0x0d, 0x05, 0x06, 0x0c, 0x0249},
    {0x00, 0x07, 0x0d, 0x05, 0x06, 0x0c, 0x0267},
    {0x01, 0x02, 0x0f, 0x1a, 0x04, 0x0b, 0x0285},
    {0x01, 0x11, 0x09, 0x0c, 0x04, 0x0f, 0x02ed},
    {0x01, 0x01, 0x01, 0x08, 0x03, 0x0d, 0x031d},
    DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate gUnknown_84631E0 = {0x01, 0x15, 0x09, 0x06, 0x04, 0x0f, 0x0335};

static const struct WindowTemplate gUnknown_84631E8[] = {
    {0x01, 0x16, 0x0d, 0x07, 0x06, 0x0f, 0x01cf},
    {0x01, 0x16, 0x0f, 0x07, 0x04, 0x0f, 0x01cf}
};

static const struct OamData gOamData_84631F8 = {
    .size = 2,
    .priority = 2
};

static const union AnimCmd gUnknown_8463200[] = {
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_8463208[] = {
    ANIMCMD_FRAME(16, 0),
    ANIMCMD_END
};

static const union AnimCmd *const gUnknown_8463210[] = {
    gUnknown_8463200,
    gUnknown_8463208
};

static const struct CompressedSpriteSheet gUnknown_8463218 = {
    (const void *)gUnknown_8E84D90,
    0x400,
    400
};

static const struct SpriteTemplate gUnknown_8463220 = {
    400,
    400,
    &gOamData_84631F8,
    gUnknown_8463210,
    NULL,
    gDummySpriteAffineAnimTable,
    SpriteCallbackDummy
};

static const u16 gUnknown_8463238[] = {
    0x000,
    0x090,
    0x080,
    0x0c0,
    0x060,
    0x050,
    0x0b0,
    0x0a0,
    0x0e0,
    0x000,
    0x010,
    0x020,
    0x030,
    0x040,
    0x0d0,
    0x070,
    0x100,
    0x0f0
};

void InitTMCase(u8 a0, void (* a1)(void), u8 a2)
{
    sub_8131A8C();
    gUnknown_203B118 = Alloc(sizeof(struct UnkStruct_203B118));
    gUnknown_203B118->unk_00 = 0;
    gUnknown_203B118->unk_08 = 0xFF;
    gUnknown_203B118->unk_07 = 0xFF;
    if (a0 != 5)
        gUnknown_203B10C.unk_04 = a0;
    if (a1 != NULL)
        gUnknown_203B10C.unk_00 = a1;
    if (a2 != 0xFF)
        gUnknown_203B10C.unk_05 = a2;
    gTextFlags.flag_2 = FALSE;
    SetMainCallback2(sub_8131894);
}

static void sub_8131864(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    do_scheduled_bg_tilemap_copies_to_vram();
    UpdatePaletteFade();
}

static void sub_8131880(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void sub_8131894(void)
{
    while (1)
    {
        if (sub_80BF72C() == TRUE)
            break;
        if (sub_81318C0() == TRUE)
            break;
        if (sub_80BF708() == TRUE)
            break;
    }
}

static bool8 sub_81318C0(void)
{
    u8 taskId;

    switch (gMain.state)
    {
    case 0:
        sub_80BF768();
        clear_scheduled_bg_copies_to_vram();
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
        sub_8131AB8();
        gUnknown_203B118->unk_12 = 0;
        gMain.state++;
        break;
    case 7:
        sub_8133244();
        gMain.state++;
        break;
    case 8:
        if (sub_8131B20())
            gMain.state++;
        break;
    case 9:
        sub_809A5E4(&gBagPockets[POCKET_TM_CASE - 1]);
        gMain.state++;
        break;
    case 10:
        sub_81320BC();
        sub_8132120();
        sub_8132170();
        gMain.state++;
        break;
    case 11:
        sub_8133404();
        gMain.state++;
        break;
    case 12:
        sub_8131C10();
        sub_8131C50();
        gMain.state++;
        break;
    case 13:
        sub_81333C4();
        gMain.state++;
        break;
    case 14:
        if (gUnknown_203B10C.unk_04 == 4)
            taskId = CreateTask(sub_8132F20, 0);
        else
            taskId = CreateTask(sub_81322D4, 0);
        gTasks[taskId].data[0] = ListMenuInit(&gUnknown_3005E70, gUnknown_203B10C.unk_0a, gUnknown_203B10C.unk_08);
        gMain.state++;
        break;
    case 15:
        sub_8132018();
        gMain.state++;
        break;
    case 16:
        gUnknown_203B118->unk_04 = sub_813368C(sub_809A798(POCKET_TM_CASE, gUnknown_203B10C.unk_0a + gUnknown_203B10C.unk_08));
        gMain.state++;
        break;
    case 17:
        BlendPalettes(0xFFFFFFFF, 16, 0);
        gMain.state++;
        break;
    case 18:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        gMain.state++;
        break;
    default:
        SetVBlankCallback(sub_8131880);
        SetMainCallback2(sub_8131864);
        return TRUE;
    }

    return FALSE;
}

static void sub_8131A8C(void)
{
    gUnknown_203B118 = NULL;
    gUnknown_203B120 = NULL;
    gUnknown_203B124 = NULL;
    gUnknown_203B128 = NULL;
    gUnknown_203B12C = NULL;
}

static void sub_8131AB8(void)
{
    void ** ptr;
    sub_80BF7C8();
    ptr = &gUnknown_203B120;
    *ptr = AllocZeroed(0x800);
    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, gUnknown_8463134, NELEMS(gUnknown_8463134));
    SetBgTilemapBuffer(2, *ptr);
    schedule_bg_copy_tilemap_to_vram(1);
    schedule_bg_copy_tilemap_to_vram(2);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    ShowBg(0);
    ShowBg(1);
    ShowBg(2);
}

static bool8 sub_8131B20(void)
{
    switch (gUnknown_203B118->unk_12)
    {
    case 0:
        reset_temp_tile_data_buffers();
        decompress_and_copy_tile_data_to_vram(1, gUnknown_8E845D8, 0, 0, 0);
        gUnknown_203B118->unk_12++;
        break;
    case 1:
        if (free_temp_tile_data_buffers_if_possible() != TRUE)
        {
            LZDecompressWram(gUnknown_8E84A24, gUnknown_203B120);
            gUnknown_203B118->unk_12++;
        }
        break;
    case 2:
        LZDecompressWram(gUnknown_8E84B70, GetBgTilemapBuffer(1));
        gUnknown_203B118->unk_12++;
        break;
    case 3:
        if (gSaveBlock2Ptr->playerGender == MALE)
            LoadCompressedPalette(gUnknown_8E84CB0, 0, 0x80);
        else
            LoadCompressedPalette(gUnknown_8E84D20, 0, 0x80);
        gUnknown_203B118->unk_12++;
        break;
    case 4:
        LoadCompressedObjectPic(&gUnknown_8463218);
        gUnknown_203B118->unk_12++;
        break;
    default:
        sub_81338A8();
        gUnknown_203B118->unk_12 = 0;
        return TRUE;
    }

    return FALSE;
}

static void sub_8131C10(void)
{
    struct BagPocket * pocket = &gBagPockets[POCKET_TM_CASE - 1];
    gUnknown_203B124 = Alloc((pocket->capacity + 1) * sizeof(struct ListMenuItem));
    gUnknown_203B128 = Alloc(gUnknown_203B118->unk_06 * 29);
}

static void sub_8131C50(void)
{
    struct BagPocket * pocket = &gBagPockets[POCKET_TM_CASE - 1];
    u16 i;

    for (i = 0; i < gUnknown_203B118->unk_06; i++)
    {
        GetTMNumberAndMoveString(gUnknown_203B128[i], pocket->itemSlots[i].itemId);
        gUnknown_203B124[i].unk_00 = gUnknown_203B128[i];
        gUnknown_203B124[i].unk_04 = i;
    }
    gUnknown_203B124[i].unk_00 = gUnknown_84166DB;
    gUnknown_203B124[i].unk_04 = -2;
    gUnknown_3005E70.items = gUnknown_203B124;
    gUnknown_3005E70.totalItems = gUnknown_203B118->unk_06 + 1;
    gUnknown_3005E70.windowId = 0;
    gUnknown_3005E70.header_X = 0;
    gUnknown_3005E70.item_X = 8;
    gUnknown_3005E70.cursor_X = 0;
    gUnknown_3005E70.lettersSpacing = 0;
    gUnknown_3005E70.itemVerticalPadding = 2;
    gUnknown_3005E70.upText_Y = 2;
    gUnknown_3005E70.maxShowed = gUnknown_203B118->unk_05;
    gUnknown_3005E70.fontId = 2;
    gUnknown_3005E70.cursorPal = 2;
    gUnknown_3005E70.fillValue = 0;
    gUnknown_3005E70.cursorShadowPal = 3;
    gUnknown_3005E70.moveCursorFunc = sub_8131E18;
    gUnknown_3005E70.itemPrintFunc = sub_8131E68;
    gUnknown_3005E70.cursorKind = 0;
    gUnknown_3005E70.scrollMultiple = 0;
}

static void GetTMNumberAndMoveString(u8 * dest, u16 itemId)
{
    StringCopy(gStringVar4, gUnknown_84166FF);
    if (itemId >= ITEM_HM01)
    {
        StringAppend(gStringVar4, gUnknown_8463178);
        StringAppend(gStringVar4, gUnknown_8416226);
        ConvertIntToDecimalStringN(gStringVar1, itemId - ITEM_HM01 + 1, STR_CONV_MODE_LEADING_ZEROS, 1);
        StringAppend(gStringVar4, gStringVar1);
    }
    else
    {
        StringAppend(gStringVar4, gUnknown_8416226);
        ConvertIntToDecimalStringN(gStringVar1, itemId - ITEM_TM01 + 1, STR_CONV_MODE_LEADING_ZEROS, 2);
        StringAppend(gStringVar4, gStringVar1);
    }
    StringAppend(gStringVar4, gUnknown_846317C);
    StringAppend(gStringVar4, gUnknown_8416703);
    StringAppend(gStringVar4, gMoveNames[ItemIdToBattleMoveId(itemId)]);
    StringCopy(dest, gStringVar4);
}

static void sub_8131E18(s32 itemIndex, bool8 onInit, struct ListMenu *list)
{
    u16 itemId;

    if (itemIndex == -2)
        itemId = 0;
    else
        itemId = sub_809A798(POCKET_TM_CASE, itemIndex);

    if (onInit != TRUE)
    {
        PlaySE(SE_SELECT);
        sub_81337E4(gUnknown_203B118->unk_04, itemId);
    }
    sub_8131F0C(itemIndex);
    sub_8133444(itemId);
}

static void sub_8131E68(u8 windowId, s32 itemId, u8 y)
{
    if (itemId != -2)
    {
        if (!itemid_is_unique(sub_809A798(POCKET_TM_CASE, itemId)))
        {
            ConvertIntToDecimalStringN(gStringVar1, sub_809A7B4(POCKET_TM_CASE, itemId), STR_CONV_MODE_RIGHT_ALIGN, 3);
            StringExpandPlaceholders(gStringVar4, gUnknown_84162B9);
            sub_81332EC(windowId, 0, gStringVar4, 0x7E, y, 0, 0, 0xFF, 1);
        }
        else
        {
            sub_81335B0(windowId, 8, y);
        }
    }
}

static void sub_8131F0C(s32 itemIndex)
{
    const u8 * str;
    if (itemIndex != -2)
    {
        str = ItemId_GetDescription(sub_809A798(POCKET_TM_CASE, itemIndex));
    }
    else
    {
        str = gUnknown_84166E1;
    }
    FillWindowPixelBuffer(1, 0);
    sub_81332EC(1, 2, str, 2, 3, 1, 0, 0, 0);
}

static void sub_8131F64(s32 a0)
{
    sub_80F6B08(2, 0, 12, 30, 8, 2 * a0 + 1);
    schedule_bg_copy_tilemap_to_vram(2);
}

static void sub_8131F90(u8 a0, u8 a1)
{
    sub_8131FB0(ListMenuGetYCoordForPrintingArrowCursor(a0), a1);
}

static void sub_8131FB0(u8 a0, u8 a1)
{
    if (a1 == 0xFF)
    {
        FillWindowPixelRect(0, 0, 0, a0, GetFontAttribute(2, 0), GetFontAttribute(2, 1));
        CopyWindowToVram(0, 2);
    }
    else
    {
        sub_81332EC(0, 2, gFameCheckerText_ListMenuCursor, 0, a0, 0, 0, 0, a1);
    }
}

static void sub_8132018(void)
{
    gUnknown_203B118->unk_08 = AddScrollIndicatorArrowPairParametrized(2, 0xA0, 0x08, 0x58, gUnknown_203B118->unk_06 - gUnknown_203B118->unk_05 + 1, 0x6E, 0x6E, &gUnknown_203B10C.unk_0a);
}

static void sub_8132054(void)
{
    gUnknown_203B118->unk_0a = 1;
    gUnknown_203B118->unk_08 = AddScrollIndicatorArrowPairParametrized(2, 0x98, 0x48, 0x68, 2, 0x6E, 0x6E, &gUnknown_203B118->unk_0a);
}

static void sub_813208C(void)
{
    if (gUnknown_203B118->unk_08 != 0xFF)
    {
        RemoveScrollIndicatorArrowPair(gUnknown_203B118->unk_08);
        gUnknown_203B118->unk_08 = 0xFF;
    }
}

void ResetTMCaseCursorPos(void)
{
    gUnknown_203B10C.unk_08 = 0;
    gUnknown_203B10C.unk_0a = 0;
}

static void sub_81320BC(void)
{
    struct BagPocket * pocket = &gBagPockets[POCKET_TM_CASE - 1];
    u16 i;

    sub_809A584(pocket->itemSlots, pocket->capacity);
    gUnknown_203B118->unk_06 = 0;
    for (i = 0; i < pocket->capacity; i++)
    {
        if (pocket->itemSlots[i].itemId == ITEM_NONE)
            break;
        gUnknown_203B118->unk_06++;
    }
    gUnknown_203B118->unk_05 = min(gUnknown_203B118->unk_06 + 1, 5);
}

static void sub_8132120(void)
{
    if (gUnknown_203B10C.unk_0a != 0)
    {
        if (gUnknown_203B10C.unk_0a + gUnknown_203B118->unk_05 > gUnknown_203B118->unk_06 + 1)
            gUnknown_203B10C.unk_0a = gUnknown_203B118->unk_06 + 1 - gUnknown_203B118->unk_05;
    }
    if (gUnknown_203B10C.unk_0a + gUnknown_203B10C.unk_08 >= gUnknown_203B118->unk_06 + 1)
    {
        if (gUnknown_203B118->unk_06 + 1 < 2)
            gUnknown_203B10C.unk_08 = 0;
        else
            gUnknown_203B10C.unk_08 = gUnknown_203B118->unk_06;
    }
}

static void sub_8132170(void)
{
    u8 i;
    if (gUnknown_203B10C.unk_08 > 3)
    {
        for (i = 0; i <= gUnknown_203B10C.unk_08 - 3 && gUnknown_203B10C.unk_0a + gUnknown_203B118->unk_05 != gUnknown_203B118->unk_06 + 1; i++)
        {
            do {} while (0);
            gUnknown_203B10C.unk_08--;
            gUnknown_203B10C.unk_0a++;
        }
    }
}

static void sub_81321D4(void)
{
    if (gUnknown_203B118 != NULL)
        Free(gUnknown_203B118);
    if (gUnknown_203B120 != NULL)
        Free(gUnknown_203B120);
    if (gUnknown_203B124 != NULL)
        Free(gUnknown_203B124);
    if (gUnknown_203B128 != NULL)
        Free(gUnknown_203B128);
    if (gUnknown_203B12C != NULL)
        Free(gUnknown_203B12C);
    FreeAllWindowBuffers();
}

static void sub_8132230(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, -2, 0, 16, RGB_BLACK);
    gTasks[taskId].func = sub_813226C;
}

static void sub_813226C(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (!gPaletteFade.active)
    {
        sub_810713C(data[0], &gUnknown_203B10C.unk_0a, &gUnknown_203B10C.unk_08);
        if (gUnknown_203B118->unk_00 != NULL)
            SetMainCallback2(gUnknown_203B118->unk_00);
        else
            SetMainCallback2(gUnknown_203B10C.unk_00);
        sub_813208C();
        sub_81321D4();
        DestroyTask(taskId);
    }
}

static void sub_81322D4(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    s32 input;

    if (!gPaletteFade.active)
    {
        if (sub_80BF72C() != TRUE)
        {
            input = ListMenuHandleInput(data[0]);
            get_coro_args_x18_x1A(data[0], &gUnknown_203B10C.unk_0a, &gUnknown_203B10C.unk_08);
            if (JOY_NEW(SELECT_BUTTON) && gUnknown_203B10C.unk_05 == 1)
            {
                PlaySE(SE_SELECT);
                gSpecialVar_ItemId = ITEM_NONE;
                sub_8132230(taskId);
            }
            else
            {
                switch (input)
                {
                case -1:
                    break;
                case -2:
                    PlaySE(SE_SELECT);
                    gSpecialVar_ItemId = 0;
                    sub_8132230(taskId);
                    break;
                default:
                    PlaySE(SE_SELECT);
                    sub_8131F64(1);
                    sub_813208C();
                    sub_8131F90(data[0], 2);
                    data[1] = input;
                    data[2] = sub_809A7B4(POCKET_TM_CASE, input);
                    gSpecialVar_ItemId = sub_809A798(POCKET_TM_CASE, input);
                    gTasks[taskId].func = gUnknown_8463140[gUnknown_203B10C.unk_04];
                    break;
                }
            }
        }
    }
}

static void sub_81323E4(u8 taskId)
{
    sub_8131F64(0);
    sub_8132018();
    gTasks[taskId].func = sub_81322D4;
}

static void SelectTMAction_FromFieldBag(u8 taskId)
{
    u8 * strbuf;
    sub_8133368(2);
    if (!sub_80BF708() && InUnionRoom() != TRUE)
    {
        sub_8133630(&gUnknown_203B118->unk_07, 0);
        gUnknown_203B118->unk_0c = gUnknown_8463168;
        gUnknown_203B118->unk_10 = 3;
    }
    else
    {
        sub_8133630(&gUnknown_203B118->unk_07, 1);
        gUnknown_203B118->unk_0c = gUnknown_846316B;
        gUnknown_203B118->unk_10 = 2;
    }
    AddItemMenuActionTextPrinters(gUnknown_203B118->unk_07, 2, GetMenuCursorDimensionByFont(2, 0), 2, 0, GetFontAttribute(2, 1) + 2, gUnknown_203B118->unk_10, gUnknown_8463150, gUnknown_203B118->unk_0c);
    ProgramAndPlaceMenuCursorOnWindow(gUnknown_203B118->unk_07, 2, 0, 2, GetFontAttribute(2, 1) + 2, gUnknown_203B118->unk_10, 0);
    strbuf = Alloc(256);
    GetTMNumberAndMoveString(strbuf, gSpecialVar_ItemId);
    StringAppend(strbuf, gUnknown_8416301);
    sub_81332EC(2, 2, strbuf, 0, 2, 1, 0, 0, 1);
    Free(strbuf);
    if (itemid_is_unique(gSpecialVar_ItemId))
    {
        sub_81335B0(2, 0, 2);
        CopyWindowToVram(2, 2);
    }
    schedule_bg_copy_tilemap_to_vram(0);
    schedule_bg_copy_tilemap_to_vram(1);
    gTasks[taskId].func = sub_8132568;
}

static void sub_8132568(u8 taskId)
{
    s8 input;

    if (sub_80BF72C() != TRUE)
    {
        input = ProcessMenuInputNoWrapAround();
        switch (input)
        {
        case -1:
            PlaySE(SE_SELECT);
            gUnknown_8463150[gUnknown_203B118->unk_0c[gUnknown_203B118->unk_10 - 1]].func.void_u8(taskId);
            break;
        case -2:
            break;
        default:
            PlaySE(SE_SELECT);
            gUnknown_8463150[gUnknown_203B118->unk_0c[input]].func.void_u8(taskId);
            break;
        }
    }
}

static void sub_81325F0(u8 taskId)
{
    sub_8133664(&gUnknown_203B118->unk_07);
    sub_810F4D8(2, 0);
    ClearWindowTilemap(2);
    PutWindowTilemap(0);
    schedule_bg_copy_tilemap_to_vram(0);
    schedule_bg_copy_tilemap_to_vram(1);
    if (CalculatePlayerPartyCount() == 0)
    {
        sub_81326F8(taskId);
    }
    else
    {
        gUnknown_3005E98 = sub_8125B40;
        gUnknown_203B118->unk_00 = sub_8124C8C;
        sub_8132230(taskId);
    }
}

static void sub_813265C(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u16 itemId = sub_809A798(POCKET_TM_CASE, data[1]);
    sub_8133664(&gUnknown_203B118->unk_07);
    sub_810F4D8(2, 0);
    ClearWindowTilemap(2);
    PutWindowTilemap(1);
    PutWindowTilemap(4);
    PutWindowTilemap(5);
    schedule_bg_copy_tilemap_to_vram(0);
    schedule_bg_copy_tilemap_to_vram(1);
    if (!itemid_is_unique(itemId))
    {
        if (CalculatePlayerPartyCount() == 0)
        {
            sub_81326F8(taskId);
        }
        else
        {
            gUnknown_203B118->unk_00 = sub_8126EDC;
            sub_8132230(taskId);
        }
    }
    else
    {
        sub_8132714(taskId);
    }
}

static void sub_81326F8(u8 taskId)
{
    sub_813337C(taskId, 2, gUnknown_841632A, sub_8132758);
}

static void sub_8132714(u8 taskId)
{
    CopyItemName(gSpecialVar_ItemId, gStringVar1);
    StringExpandPlaceholders(gStringVar4, gUnknown_841635E);
    sub_813337C(taskId, 2, gStringVar4, sub_8132758);
}

static void sub_8132758(u8 taskId)
{
    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        sub_8132780(taskId);
    }
}

static void sub_8132780(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    sub_810713C(data[0], &gUnknown_203B10C.unk_0a, &gUnknown_203B10C.unk_08);
    data[0] = ListMenuInit(&gUnknown_3005E70, gUnknown_203B10C.unk_0a, gUnknown_203B10C.unk_08);
    sub_8131F90(data[0], 1);
    sub_810F260(6, 0);
    ClearWindowTilemap(6);
    PutWindowTilemap(1);
    PutWindowTilemap(4);
    PutWindowTilemap(5);
    schedule_bg_copy_tilemap_to_vram(0);
    schedule_bg_copy_tilemap_to_vram(1);
    sub_81323E4(taskId);
}

static void sub_81327FC(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    sub_8133664(&gUnknown_203B118->unk_07);
    sub_810F4D8(2, 0);
    ClearWindowTilemap(2);
    PutWindowTilemap(0);
    sub_8131F90(data[0], 1);
    PutWindowTilemap(1);
    PutWindowTilemap(4);
    PutWindowTilemap(5);
    schedule_bg_copy_tilemap_to_vram(0);
    schedule_bg_copy_tilemap_to_vram(1);
    sub_81323E4(taskId);
}

static void sub_8132868(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (!itemid_is_unique(sub_809A798(POCKET_TM_CASE, data[1])))
    {
        gUnknown_203B118->unk_00 = c2_8123744;
        sub_8132230(taskId);
    }
    else
    {
        sub_8132714(taskId);
    }
}

static void sub_81328B8(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (!itemid_is_unique(sub_809A798(POCKET_TM_CASE, data[1])))
    {
        gUnknown_203B118->unk_00 = sub_808CE60;
        sub_8132230(taskId);
    }
    else
    {
        sub_8132714(taskId);
    }
}

static void SelectTMAction_FromSellMenu(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (itemid_get_market_price(gSpecialVar_ItemId) == 0)
    {
        CopyItemName(gSpecialVar_ItemId, gStringVar1);
        StringExpandPlaceholders(gStringVar4, gUnknown_84168F1);
        sub_813337C(taskId, sub_80BF8E4(), gStringVar4, sub_8132780);
    }
    else
    {
        data[8] = 1;
        if (data[2] == 1)
        {
            sub_81335E0();
            sub_81329C4(taskId);
        }
        else
        {
            if (data[2] > 99)
                data[2] = 99;
            CopyItemName(gSpecialVar_ItemId, gStringVar1);
            StringExpandPlaceholders(gStringVar4, gUnknown_8416911);
            sub_813337C(taskId, sub_80BF8E4(), gStringVar4, sub_8132AAC);
        }
    }
}

static void sub_81329C4(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    ConvertIntToDecimalStringN(gStringVar3, itemid_get_market_price(sub_809A798(POCKET_TM_CASE, data[1])) / 2 * data[8], STR_CONV_MODE_LEFT_ALIGN, 6);
    StringExpandPlaceholders(gStringVar4, gUnknown_8416936);
    sub_813337C(taskId, sub_80BF8E4(), gStringVar4, sub_8132A34);
}

static void sub_8132A34(u8 taskId)
{
    sub_8133604(taskId, gUnknown_8463170);
}

static void sub_8132A48(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    sub_810F4D8(8, 0);
    sub_810F260(6, 0);
    PutWindowTilemap(0);
    PutWindowTilemap(1);
    PutWindowTilemap(3);
    PutWindowTilemap(4);
    PutWindowTilemap(5);
    schedule_bg_copy_tilemap_to_vram(0);
    schedule_bg_copy_tilemap_to_vram(1);
    sub_8131F90(data[0], 1);
    sub_81323E4(taskId);
}

static void sub_8132AAC(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    sub_8133354(7);
    ConvertIntToDecimalStringN(gStringVar1, 1, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringExpandPlaceholders(gStringVar4, gUnknown_84162B9);
    sub_81332EC(7, 0, gStringVar4, 4, 10, 1, 0, 0, 1);
    sub_8132B5C(1, itemid_get_market_price(sub_809A798(POCKET_TM_CASE, data[1])) / 2 * data[8]);
    sub_81335E0();
    sub_8132054();
    schedule_bg_copy_tilemap_to_vram(0);
    schedule_bg_copy_tilemap_to_vram(1);
    gTasks[taskId].func = sub_8132BC8;
}

static void sub_8132B5C(s16 quantity, s32 amount)
{
    FillWindowPixelBuffer(7, 0x11);
    ConvertIntToDecimalStringN(gStringVar1, quantity, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringExpandPlaceholders(gStringVar4, gUnknown_84162B9);
    sub_81332EC(7, 0, gStringVar4, 4, 10, 1, 0, 0, 1);
    PrintMoneyAmount(7, 0x38, 0x0A, amount, 0);
}

static void sub_8132BC8(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (sub_80BF848(&data[8], data[2]) == 1)
    {
        sub_8132B5C(data[8], itemid_get_market_price(sub_809A798(POCKET_TM_CASE, data[1])) / 2 * data[8]);
    }
    else if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        sub_810F4D8(7, 0);
        schedule_bg_copy_tilemap_to_vram(0);
        schedule_bg_copy_tilemap_to_vram(1);
        sub_813208C();
        sub_81329C4(taskId);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        sub_810F4D8(7, 0);
        sub_810F4D8(8, 0);
        sub_810F260(6, 0);
        PutWindowTilemap(3);
        PutWindowTilemap(0);
        PutWindowTilemap(1);
        schedule_bg_copy_tilemap_to_vram(0);
        schedule_bg_copy_tilemap_to_vram(1);
        sub_813208C();
        sub_8131F90(data[0], 1);
        sub_81323E4(taskId);
    }
}

static void sub_8132CAC(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    PutWindowTilemap(0);
    schedule_bg_copy_tilemap_to_vram(0);
    CopyItemName(gSpecialVar_ItemId, gStringVar1);
    ConvertIntToDecimalStringN(gStringVar3, itemid_get_market_price(sub_809A798(POCKET_TM_CASE, data[1])) / 2 * data[8], STR_CONV_MODE_LEFT_ALIGN, 6);
    StringExpandPlaceholders(gStringVar4, gUnknown_8416959);
    sub_813337C(taskId, 2, gStringVar4, sub_8132D34);
}

static void sub_8132D34(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    PlaySE(0xF8);
    RemoveBagItem(gSpecialVar_ItemId, data[8]);
    AddMoney(&gSaveBlock1Ptr->money, itemid_get_market_price(gSpecialVar_ItemId) / 2 * data[8]);
    sub_809C09C(gSpecialVar_ItemId, data[8], 2);
    sub_810713C(data[0], &gUnknown_203B10C.unk_0a, &gUnknown_203B10C.unk_08);
    sub_81320BC();
    sub_8132120();
    sub_8131C50();
    data[0] = ListMenuInit(&gUnknown_3005E70, gUnknown_203B10C.unk_0a, gUnknown_203B10C.unk_08);
    sub_8131F90(data[0], 2);
    PrintMoneyAmountInMoneyBox(8, GetMoney(&gSaveBlock1Ptr->money), 0);
    gTasks[taskId].func = sub_8132E0C;
}

static void sub_8132E0C(u8 taskId)
{
    if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        sub_810F4D8(8, 0);
        sub_810F260(6, 0);
        PutWindowTilemap(1);
        PutWindowTilemap(3);
        PutWindowTilemap(4);
        PutWindowTilemap(5);
        sub_8132780(taskId);
    }
}

void PokeDude_InitTMCase(void)
{
    gUnknown_203B11C = AllocZeroed(sizeof(*gUnknown_203B11C));
    memcpy(gUnknown_203B11C->bagPocket_TMHM, gSaveBlock1Ptr->bagPocket_TMHM, sizeof(gSaveBlock1Ptr->bagPocket_TMHM));
    memcpy(gUnknown_203B11C->bagPocket_KeyItems, gSaveBlock1Ptr->bagPocket_KeyItems, sizeof(gSaveBlock1Ptr->bagPocket_KeyItems));
    gUnknown_203B11C->unk_160 = gUnknown_203B10C.unk_08;
    gUnknown_203B11C->unk_162 = gUnknown_203B10C.unk_0a;
    ClearItemSlots(gSaveBlock1Ptr->bagPocket_TMHM, NELEMS(gSaveBlock1Ptr->bagPocket_TMHM));
    ClearItemSlots(gSaveBlock1Ptr->bagPocket_KeyItems, NELEMS(gSaveBlock1Ptr->bagPocket_KeyItems));
    ResetTMCaseCursorPos();
    AddBagItem(ITEM_TM01, 1);
    AddBagItem(ITEM_TM03, 1);
    AddBagItem(ITEM_TM09, 1);
    AddBagItem(ITEM_TM35, 1);
    InitTMCase(4, sub_815ABFC, 0);
}

static void sub_8132F20(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (!gPaletteFade.active)
    {
        data[8] = 0;
        data[9] = 0;
        gTasks[taskId].func = sub_8132F60;
    }
}

static void sub_8132F60(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (JOY_NEW(B_BUTTON))
    {
        if (data[8] < 21)
        {
            data[8] = 21;
            sub_815AC20();
        }
    }

    switch (data[8])
    {
    case 0:
        BeginNormalPaletteFade(0xFFFF8405, 4, 0, 6, 0);
        sub_8131F64(1);
        data[8]++;
        break;
    case 1:
    case 11:
        if (!gPaletteFade.active)
        {
            data[9]++;
            if (data[9] > 0x65)
            {
                data[9] = 0;
                data[8]++;
            }
        }
        break;
    case 2:
    case 3:
    case 4:
    case 12:
    case 13:
    case 14:
        if (data[9] == 0)
        {
            gMain.newKeys = 0;
            gMain.newAndRepeatedKeys = DPAD_DOWN;
            ListMenuHandleInput(data[0]);
        }
        data[9]++;
        if (data[9] > 0x65)
        {
            data[9] = 0;
            data[8]++;
        }
        break;
    case 5:
    case 6:
    case 7:
    case 15:
    case 16:
    case 17:
        if (data[9] == 0)
        {
            gMain.newKeys = 0;
            gMain.newAndRepeatedKeys = DPAD_UP;
            ListMenuHandleInput(data[0]);
        }
        data[9]++;
        if (data[9] > 0x65)
        {
            data[9] = 0;
            data[8]++;
        }
        break;
    case 8:
        sub_8131F64(1);
        sub_813337C(taskId, 4, gUnknown_841C587, 0);
        gTasks[taskId].func = sub_8132F60;
        data[8]++;
        break;
    case 9:
    case 19:
        RunTextPrinters();
        if (!IsTextPrinterActive(6))
            data[8]++;
        break;
    case 10:
        if (JOY_NEW(A_BUTTON | B_BUTTON))
        {
            sub_8131F64(0);
            BeginNormalPaletteFade(0x00000400, 0, 6, 0, 0);
            sub_810F260(6, 0);
            schedule_bg_copy_tilemap_to_vram(1);
            data[8]++;
        }
        break;
    case 18:
        sub_8131F64(1);
        sub_813337C(taskId, 4, gUnknown_841C693, 0);
        gTasks[taskId].func = sub_8132F60;
        data[8]++;
        break;
    case 20:
        if (JOY_NEW(A_BUTTON | B_BUTTON))
            data[8]++;
        break;
    case 21:
        if (!gPaletteFade.active)
        {
            memcpy(gSaveBlock1Ptr->bagPocket_TMHM, gUnknown_203B11C->bagPocket_TMHM, sizeof(gSaveBlock1Ptr->bagPocket_TMHM));
            memcpy(gSaveBlock1Ptr->bagPocket_KeyItems, gUnknown_203B11C->bagPocket_KeyItems, sizeof(gSaveBlock1Ptr->bagPocket_KeyItems));
            sub_810713C(data[0], NULL, NULL);
            gUnknown_203B10C.unk_08 = gUnknown_203B11C->unk_160;
            gUnknown_203B10C.unk_0a = gUnknown_203B11C->unk_162;
            Free(gUnknown_203B11C);
            CpuFastCopy(gPlttBufferFaded, gPlttBufferUnfaded, 0x400);
            sub_8108CF0();
            BeginNormalPaletteFade(0xFFFFFFFF, -2, 0, 16, 0);
            data[8]++;
        }
        break;
    default:
        if (!gPaletteFade.active)
        {
            SetMainCallback2(gUnknown_203B10C.unk_00);
            sub_813208C();
            sub_81321D4();
            DestroyTask(taskId);
        }
        break;
    }
}

static void sub_8133244(void)
{
    u8 i;

    InitWindows(gUnknown_8463190);
    DeactivateAllTextPrinters();
    sub_815001C(0, 0x5B, 0xE0);
    sub_814FEAC(0, 0x64, 0xB0);
    sub_814FF2C(0, 0x78, 0xD0);
    LoadPalette(gUnknown_841F408, 0xF0, 0x20);
    LoadPalette(gUnknown_841F408, 0xA0, 0x20);
    LoadPalette(gUnknown_8463180, 0xF6, 0x04);
    LoadPalette(gUnknown_8463180, 0xD6, 0x04);
    sub_8107D38(0xc0, 0x01);
    for (i = 0; i < 9; i++)
        FillWindowPixelBuffer(i, 0x00);
    PutWindowTilemap(0);
    PutWindowTilemap(1);
    PutWindowTilemap(3);
    PutWindowTilemap(4);
    PutWindowTilemap(5);
    schedule_bg_copy_tilemap_to_vram(0);
}

static void sub_81332EC(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed, u8 colorIdx)
{
    AddTextPrinterParametrized2(windowId, fontId, x, y, letterSpacing, lineSpacing, &gUnknown_8463184[colorIdx], speed, str);
}

static void sub_8133354(u8 windowId)
{
    SetWindowBorderStyle(windowId, FALSE, 0x5B, 0x0E);
}

static void sub_8133368(u8 windowId)
{
    SetWindowBorderStyle(windowId, FALSE, 0x78, 0x0D);
}

static void sub_813337C(u8 taskId, u8 windowId, const u8 * str, TaskFunc func)
{
    DisplayMessageAndContinueTask(taskId, 6, 0x64, 0x0B, windowId, GetTextSpeedSetting(), str, func);
    schedule_bg_copy_tilemap_to_vram(1);
}

static void sub_81333C4(void)
{
    u32 distance = 72 - GetStringWidth(1, gUnknown_84166D3, 0);
    box_print(3, 1, distance / 2, 1, &gUnknown_8463184[0], 0, gUnknown_84166D3);
}

static void sub_8133404(void)
{
    sub_8107D68(4, 19, 0, 0);
    sub_8107D68(4, 20, 0, 12);
    sub_8107D68(4, 21, 0, 24);
    sub_8107D68(4, 22, 0, 36);
    CopyWindowToVram(4, 2);
}

static void sub_8133444(u16 itemId)
{
    u8 i;
    u16 move;
    const u8 * str;

    FillWindowPixelRect(5, 0, 0, 0, 40, 48);
    if (itemId == ITEM_NONE)
    {
        for (i = 0; i < 4; i++)
        {
            sub_81332EC(5, 3, gUnknown_8416213, 7, 12 * i, 0, 0, 0xFF, 3);
        }
        CopyWindowToVram(5, 2);
    }
    else
    {
        move = ItemIdToBattleMoveId(itemId);
        sub_8107D68(5, gBattleMoves[move].type + 1, 0, 0);
        if (gBattleMoves[move].power < 2)
            str = gUnknown_8416213;
        else
        {
            ConvertIntToDecimalStringN(gStringVar1, gBattleMoves[move].power, STR_CONV_MODE_RIGHT_ALIGN, 3);
            str = gStringVar1;
        }
        sub_81332EC(5, 3, str, 7, 12, 0, 0, 0xFF, 3);
        if (gBattleMoves[move].accuracy == 0)
            str = gUnknown_8416213;
        else
        {
            ConvertIntToDecimalStringN(gStringVar1, gBattleMoves[move].accuracy, STR_CONV_MODE_RIGHT_ALIGN, 3);
            str = gStringVar1;
        }
        sub_81332EC(5, 3, str, 7, 24, 0, 0, 0xFF, 3);
        ConvertIntToDecimalStringN(gStringVar1, gBattleMoves[move].pp, STR_CONV_MODE_RIGHT_ALIGN, 3);
        sub_81332EC(5, 3, gStringVar1, 7, 36, 0, 0, 0xFF, 3);
        CopyWindowToVram(5, 2);
    }
}

static void sub_81335B0(u8 windowId, u8 x, u8 y)
{
    BlitBitmapToWindow(windowId, gUnknown_8E99118, x, y, 16, 12);
}

static void sub_81335E0(void)
{
    PrintMoneyAmountInMoneyBoxWithBorder(8, 0x78, 0xD, GetMoney(&gSaveBlock1Ptr->money));
}

static void sub_8133604(u8 taskId, const TaskFunc *ptrs)
{
    sub_80BF5D0(taskId, &gUnknown_84631E0, 2, 0, 2, 0x5B, 0x0E, ptrs);
}

static u8 sub_8133630(u8 * a0, u8 a1)
{
    if (*a0 == 0xFF)
    {
        *a0 = AddWindow(&gUnknown_84631E8[a1]);
        sub_8133354(*a0);
        schedule_bg_copy_tilemap_to_vram(0);
    }
    return *a0;
}

static void sub_8133664(u8 * a0)
{
    sub_810F4D8(*a0, FALSE);
    ClearWindowTilemap(*a0);
    RemoveWindow(*a0);
    schedule_bg_copy_tilemap_to_vram(0);
    *a0 = 0xFF;
}

static u8 sub_813368C(u16 itemId)
{
    u8 spriteId = CreateSprite(&gUnknown_8463220, 0x29, 0x2E, 0);
    u8 r5;
    if (itemId == ITEM_NONE)
    {
        sub_8133790(&gSprites[spriteId], 0xFF);
        return spriteId;
    }
    else
    {
        r5 = itemId - 33;
        sub_8133714(&gSprites[spriteId], r5);
        sub_8133730(gBattleMoves[ItemIdToBattleMoveId(itemId)].type);
        sub_8133790(&gSprites[spriteId], r5);
        return spriteId;
    }
}

static void sub_8133714(struct Sprite * sprite, u8 idx)
{
    if (idx >= 50)
        StartSpriteAnim(sprite, 1);
    else
        StartSpriteAnim(sprite, 0);
}

static void sub_8133730(u8 type)
{
    u8 palIndex = IndexOfSpritePaletteTag(400) << 4;
    LoadPalette(gUnknown_203B12C + gUnknown_8463238[type], 0x100 | palIndex, 0x20);
    if (gUnknown_203B10C.unk_04 == 4)
    {
        BlendPalettes(1 << (0x10 + palIndex), 4, RGB_BLACK);
    }
}

static void sub_8133790(struct Sprite * sprite, u8 var)
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

static void sub_81337E4(u8 spriteId, u16 itemId)
{
    gSprites[spriteId].data[0] = itemId;
    gSprites[spriteId].data[1] = 0;
    gSprites[spriteId].callback = sub_8133810;
}

static void sub_8133810(struct Sprite * sprite)
{
    switch (sprite->data[1])
    {
    case 0:
        if (sprite->pos2.y >= 20)
        {
            if (sprite->data[0] != ITEM_NONE)
            {
                sprite->data[1]++;
                sub_8133730(gBattleMoves[ItemIdToBattleMoveId(sprite->data[0])].type);
                sprite->data[0] -= ITEM_TM01;
                sub_8133714(sprite, sprite->data[0]);
                sub_8133790(sprite, sprite->data[0]);
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

static void sub_81338A8(void)
{
    struct SpritePalette spritePalette;

    gUnknown_203B12C = Alloc(0x110 * sizeof(u16));
    LZDecompressWram(gUnknown_8E84F20, gUnknown_203B12C);
    LZDecompressWram(gUnknown_8E85068, gUnknown_203B12C + 0x100);
    spritePalette.data = gUnknown_203B12C + 0x110;
    spritePalette.tag = 400;
    LoadSpritePalette(&spritePalette);
}
