#include "global.h"
#include "malloc.h"
#include "bg.h"
#include "decompress.h"
#include "gpu_regs.h"
#include "palette.h"
#include "text.h"
#include "berry_pouch.h"
#include "item_menu.h"
#include "menu_helpers.h"
#include "new_menu_helpers.h"
#include "scanline_effect.h"
#include "item_menu_icons.h"
#include "list_menu.h"
#include "graphics.h"
#include "berry.h"
#include "item.h"
#include "item_use.h"
#include "party_menu.h"
#include "strings.h"
#include "string_util.h"
#include "sound.h"
#include "link.h"
#include "money.h"
#include "shop.h"
#include "menu.h"
#include "menu_indicators.h"
#include "pokemon_storage_system.h"
#include "constants/items.h"
#include "constants/songs.h"

struct BerryPouchStruct_203F36C
{
    void (*unk_000)(void);
    u16 unk_004;
    u8 unk_006;
    u8 unk_007;
    u8 unk_008;
    u8 unk_009;
    u8 filler_00a[2];
    u8 unk_00C[BG_SCREEN_SIZE];
    s16 unk_80C[4];
};

struct BerryPouchStruct_203F370
{
    void (*savedCallback)(void);
    u8 unk_04;
    u8 unk_05;
    u8 filler_06[2];
    u16 unk_08;
    u16 unk_0A;
};

enum
{
    BP_ACTION_USE = 0,
    BP_ACTION_TOSS,
    BP_ACTION_GIVE,
    BP_ACTION_EXIT,
    BP_ACTION_DUMMY
};

EWRAM_DATA struct BerryPouchStruct_203F36C *gUnknown_203F36C = NULL;
EWRAM_DATA struct BerryPouchStruct_203F370 gUnknown_203F370 = {};
EWRAM_DATA struct ListMenuItem *gUnknown_203F37C = NULL;
EWRAM_DATA u8 *gUnknown_203F380 = NULL;
EWRAM_DATA const u8 *gUnknown_203F384 = NULL;
EWRAM_DATA u8 gUnknown_203F388 = 0;
ALIGNED(4) EWRAM_DATA u8 gUnknown_203F38C[14] = {};
ALIGNED(4) EWRAM_DATA u8 gUnknown_203F39C = 0;

void sub_813CE30(void);
bool8 sub_813CE5C(void);
void sub_813D00C(void);
void sub_813D048(u8 taskId);
void sub_813D07C(void);
bool8 sub_813D0E4(void);
bool8 sub_813D1C0(void);
void sub_813D204(void);
void sub_813D31C(u8 * dest, u16 itemId);
void sub_813D3C0(s32 itemIndex, bool8 onInit, struct ListMenu *list);
void sub_813D430(u8 windowId, s32 itemId, u8 y);
void sub_813D4D0(u8 y, u8 colorIdx);
void sub_813D538(s32 itemIndex);
void sub_813D5BC(void);
void sub_813D6A4(void);
void sub_813D6F4(void);
void sub_813D754(void);
void sub_813D7CC(void);
void sub_813D844(u8 taskId);
void sub_813D8AC(void);
void sub_813DA68(u8 taskId);
void sub_813DD74(u8 taskId);
void sub_813DDA0(u8 taskId);
void sub_813DE0C(u8 taskId);
void sub_813DEBC(u8 taskId);
void sub_813DF54(u8 taskId);
void sub_813DFC8(u8 taskId);
void sub_813E010(u8 taskId);
void sub_813E0DC(u8 taskId);
void sub_813E164(u8 taskId);
void sub_813E200(u8 taskId);
void sub_813E274(u8 taskId);
void sub_813E290(u8 taskId);
void sub_813E320(u8 taskId);
void sub_813E37C(u8 taskId);
void sub_813E3FC(u8 taskId);
void sub_813E428(u8 taskId);
void sub_813E4E4(u8 taskId);
void sub_813E554(u8 taskId);
void sub_813E568(u8 taskId);
void sub_813E5B8(u8 taskId);
void sub_813E668(s32 price);
void sub_813E690(u8 taskId);
void sub_813E768(u8 taskId);
void sub_813E7F0(u8 taskId);
void sub_813E8D4(u8 taskId);
void sub_813E910(void);
void sub_813E9A0(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed, u8 colorIdx);
u8 sub_813EA08(u8);
void sub_813EA98(u8);
void sub_813EACC(u8);
u8 sub_813EB10(u8);
void sub_813EB7C(u8 taskId, const struct YesNoFuncTable * ptrs);
void sub_813EBA8(u8 taskId, const struct YesNoFuncTable * ptrs);
void sub_813EBD4(void);
void sub_813EC08(void);
void sub_813EC28(void);

static const struct BgTemplate gUnknown_846434C[] = {
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
        .charBaseIndex = 3,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x000
    }, {
        .bg = 2,
        .charBaseIndex = 0,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }
};

const TaskFunc gUnknown_8464358[] = {
    sub_813DD74,
    sub_813E37C,
    sub_813E428,
    sub_813E3FC,
    sub_813DD74
};

const struct YesNoFuncTable gUnknown_846436C = {
    .yesFunc = sub_813E0DC,
    .noFunc  = sub_813DFC8
};

const struct YesNoFuncTable gUnknown_8464374 = {
    .yesFunc = sub_813E768,
    .noFunc  = sub_813E568
};

const struct MenuAction gUnknown_846437C[] = {
    {gOtherText_Use,  sub_813DE0C},
    {gOtherText_Toss, sub_813DEBC},
    {gOtherText_Give, sub_813E200},
    {gOtherText_Exit, sub_813E320},
    {gString_Dummy,   NULL}
};

const u8 gUnknown_84643A4[] = {
    BP_ACTION_USE,
    BP_ACTION_GIVE,
    BP_ACTION_TOSS,
    BP_ACTION_EXIT
};

const u8 gUnknown_84643A8[] = {
    BP_ACTION_GIVE,
    BP_ACTION_EXIT,
    BP_ACTION_DUMMY,
    BP_ACTION_DUMMY
};

const u8 gUnknown_84643AC[] = {
    BP_ACTION_EXIT,
    BP_ACTION_DUMMY,
    BP_ACTION_DUMMY,
    BP_ACTION_DUMMY
};

const u8 gUnknown_84643B0[] = {
    BP_ACTION_USE,
    BP_ACTION_TOSS,
    BP_ACTION_EXIT,
    BP_ACTION_DUMMY
};

const u8 gUnknown_84643B4[] = _(" ");

const struct WindowTemplate gUnknown_84643B8[] = {
    {
        .bg = 0,
        .tilemapLeft = 11,
        .tilemapTop = 1,
        .width = 18,
        .height = 14,
        .paletteNum = 15,
        .baseBlock = 0x027
    }, {
        .bg = 0,
        .tilemapLeft = 5,
        .tilemapTop = 16,
        .width = 25,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x123
    }, {
        .bg = 2,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 9,
        .height = 2,
        .paletteNum = 15,
        .baseBlock = 0x187
    }, DUMMY_WIN_TEMPLATE
};

const struct WindowTemplate gUnknown_84643D8[] = {
    {
        .bg = 0x02,
        .tilemapLeft = 0x18,
        .tilemapTop = 0x0f,
        .width = 0x05,
        .height = 0x04,
        .paletteNum = 0x0f,
        .baseBlock = 0x1d1
    }, {
        .bg = 0x02,
        .tilemapLeft = 0x11,
        .tilemapTop = 0x09,
        .width = 0x0c,
        .height = 0x04,
        .paletteNum = 0x0f,
        .baseBlock = 0x1d1
    }, {
        .bg = 0x02,
        .tilemapLeft = 0x01,
        .tilemapTop = 0x01,
        .width = 0x08,
        .height = 0x03,
        .paletteNum = 0x0c,
        .baseBlock = 0x201
    }, {
        .bg = 0x02,
        .tilemapLeft = 0x17,
        .tilemapTop = 0x0f,
        .width = 0x06,
        .height = 0x04,
        .paletteNum = 0x0f,
        .baseBlock = 0x219
    }, {
        .bg = 0x02,
        .tilemapLeft = 0x15,
        .tilemapTop = 0x09,
        .width = 0x06,
        .height = 0x04,
        .paletteNum = 0x0f,
        .baseBlock = 0x219
    }, {
        .bg = 0x02,
        .tilemapLeft = 0x02,
        .tilemapTop = 0x0f,
        .width = 0x1a,
        .height = 0x04,
        .paletteNum = 0x0f,
        .baseBlock = 0x231
    }, {
        .bg = 0x02,
        .tilemapLeft = 0x06,
        .tilemapTop = 0x0f,
        .width = 0x0e,
        .height = 0x04,
        .paletteNum = 0x0c,
        .baseBlock = 0x231
    }, {
        .bg = 0x02,
        .tilemapLeft = 0x06,
        .tilemapTop = 0x0f,
        .width = 0x0f,
        .height = 0x04,
        .paletteNum = 0x0c,
        .baseBlock = 0x269
    }, {
        .bg = 0x02,
        .tilemapLeft = 0x06,
        .tilemapTop = 0x0f,
        .width = 0x10,
        .height = 0x04,
        .paletteNum = 0x0c,
        .baseBlock = 0x2a5
    }, {
        .bg = 0x02,
        .tilemapLeft = 0x06,
        .tilemapTop = 0x0f,
        .width = 0x17,
        .height = 0x04,
        .paletteNum = 0x0c,
        .baseBlock = 0x2e5
    }, {
        .bg = 0x02,
        .tilemapLeft = 0x16,
        .tilemapTop = 0x11,
        .width = 0x07,
        .height = 0x02,
        .paletteNum = 0x0f,
        .baseBlock = 0x199
    }, {
        .bg = 0x02,
        .tilemapLeft = 0x16,
        .tilemapTop = 0x0f,
        .width = 0x07,
        .height = 0x04,
        .paletteNum = 0x0f,
        .baseBlock = 0x199
    }, {
        .bg = 0x02,
        .tilemapLeft = 0x16,
        .tilemapTop = 0x0d,
        .width = 0x07,
        .height = 0x06,
        .paletteNum = 0x0f,
        .baseBlock = 0x199
    }, {
        .bg = 0x02,
        .tilemapLeft = 0x16,
        .tilemapTop = 0x0b,
        .width = 0x07,
        .height = 0x08,
        .paletteNum = 0x0f,
        .baseBlock = 0x199
    }
};

const u8 gUnknown_8464448[][3] = {
    { 0, 1, 2 },
    { 0, 2, 3 },
    { 0, 3, 2 }
};

const struct OamData gOamData_8464454 = {
    .affineMode = ST_OAM_AFFINE_NORMAL,
    .shape = ST_OAM_SQUARE,
    .size = ST_OAM_SIZE_3,
    .priority = 1
};

const union AnimCmd gSpriteAnims_846445C[] = {
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_8464464[] = {
    gSpriteAnims_846445C
};

const union AffineAnimCmd gSpriteAffineAnims_8464468[] = {
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd gSpriteAffineAnims_8464478[] = {
    AFFINEANIMCMD_FRAME(0, 0, -2, 2),
    AFFINEANIMCMD_FRAME(0, 0,  2, 4),
    AFFINEANIMCMD_FRAME(0, 0, -2, 4),
    AFFINEANIMCMD_FRAME(0, 0,  2, 2),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_84644A0[] = {
    gSpriteAffineAnims_8464468,
    gSpriteAffineAnims_8464478
};

const struct CompressedSpriteSheet gUnknown_84644A8 = {
    gUnknown_8E8560C, 0x800, 100
};

const struct CompressedSpritePalette gUnknown_84644B0 = {
    gUnknown_8E85C1C, 100
};

const struct SpriteTemplate gUnknown_84644B8 = {
    100, 100, &gOamData_8464454, gSpriteAnimTable_8464464, NULL, gSpriteAffineAnimTable_84644A0, SpriteCallbackDummy
};

void InitBerryPouch(u8 a0, void (*savedCallback)(void), u8 a2)
{
    u8 i;

    gUnknown_203F36C = Alloc(sizeof(struct BerryPouchStruct_203F36C));
    if (gUnknown_203F36C == NULL)
    {
        SetMainCallback2(savedCallback);
    }
    else
    {
        if (a0 != 6)
            gUnknown_203F370.unk_04 = a0;
        if (a2 != 0xFF)
            gUnknown_203F370.unk_05 = a2;
        if (savedCallback != NULL)
            gUnknown_203F370.savedCallback = savedCallback;
        gUnknown_203F36C->unk_000 = NULL;
        gUnknown_203F36C->unk_009 = 0;
        gUnknown_203F36C->unk_006 = 0xFF;
        for (i = 0; i < 4; i++)
            gUnknown_203F36C->unk_80C[i] = 0;
        gTextFlags.autoScroll = FALSE;
        gSpecialVar_ItemId = ITEM_NONE;
        SetMainCallback2(sub_813CE30);
    }
}

void sub_813CE00(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    DoScheduledBgTilemapCopiesToVram();
    UpdatePaletteFade();
}

void sub_813CE1C(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_813CE30(void)
{
    while (1)
    {
        if (sub_80BF72C() == TRUE)
            break;
        if (sub_813CE5C() == TRUE)
            break;
        if (MenuHelpers_LinkSomething() == TRUE)
            break;
    }
}

bool8 sub_813CE5C(void)
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
        if (!MenuHelpers_LinkSomething())
            ResetTasks();
        gMain.state++;
        break;
    case 7:
        sub_813D07C();
        gUnknown_203F36C->unk_80C[0] = 0;
        gMain.state++;
        break;
    case 8:
        if (sub_813D0E4())
            gMain.state++;
        break;
    case 9:
        sub_813E910();
        gMain.state++;
        break;
    case 10:
        sub_813D8AC();
        sub_813D6F4();
        sub_813D754();
        gMain.state++;
        break;
    case 11:
        if (!sub_813D1C0())
        {
            sub_813D00C();
            return TRUE;
        }
        gMain.state++;
        break;
    case 12:
        sub_813D204();
        gMain.state++;
        break;
    case 13:
        sub_813D6A4();
        gMain.state++;
        break;
    case 14:
        taskId = CreateTask(sub_813DA68, 0);
        gTasks[taskId].data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gUnknown_203F370.unk_0A, gUnknown_203F370.unk_08);
        gTasks[taskId].data[8] = 0;
        gMain.state++;
        break;
    case 15:
        sub_813EC08();
        gMain.state++;
        break;
    case 16:
        sub_813D5BC();
        gMain.state++;
        break;
    case 17:
        BlendPalettes(0xFFFFFFFF, 16, RGB_BLACK);
        gMain.state++;
        break;
    case 18:
        BeginNormalPaletteFade(0xFFFFFFFF, -2, 16, 0, RGB_BLACK);
        gMain.state++;
        break;
    default:
        SetVBlankCallback(sub_813CE1C);
        SetMainCallback2(sub_813CE00);
        return TRUE;
    }

    return FALSE;
}

void sub_813D00C(void)
{
    BeginNormalPaletteFade(0xFFFFFFFF, -2, 0, 16, RGB_BLACK);
    CreateTask(sub_813D048, 0);
    SetVBlankCallback(sub_813CE1C);
    SetMainCallback2(sub_813CE00);
}

void sub_813D048(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(gUnknown_203F370.savedCallback);
        sub_813D7CC();
        DestroyTask(taskId);
    }
}

void sub_813D07C(void)
{
    ResetAllBgsCoordinatesAndBgCntRegs();
    memset(gUnknown_203F36C->unk_00C, 0, BG_SCREEN_SIZE);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, gUnknown_846434C, NELEMS(gUnknown_846434C));
    SetBgTilemapBuffer(1, gUnknown_203F36C->unk_00C);
    ScheduleBgCopyTilemapToVram(1);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
    ShowBg(0);
    ShowBg(1);
    ShowBg(2);
}

bool8 sub_813D0E4(void)
{
    switch (gUnknown_203F36C->unk_80C[0])
    {
    case 0:
        ResetTempTileDataBuffers();
        DecompressAndCopyTileDataToVram(1, gUnknown_8E859D0, 0, 0, 0);
        gUnknown_203F36C->unk_80C[0]++;
        break;
    case 1:
        if (FreeTempTileDataBuffersIfPossible() != TRUE)
        {
            LZDecompressWram(gUnknown_8E85C44, gUnknown_203F36C->unk_00C);
            gUnknown_203F36C->unk_80C[0]++;
        }
        break;
    case 2:
        LoadCompressedPalette(gUnknown_8E85BA4, 0, 0x60);
        if (gSaveBlock2Ptr->playerGender != MALE)
            LoadCompressedPalette(gUnknown_8E85BF4, 0, 0x20);
        gUnknown_203F36C->unk_80C[0]++;
        break;
    case 3:
        LoadCompressedSpriteSheet(&gUnknown_84644A8);
        gUnknown_203F36C->unk_80C[0]++;
        break;
    default:
        LoadCompressedSpritePalette(&gUnknown_84644B0);
        gUnknown_203F36C->unk_80C[0] = 0;
        return TRUE;
    }

    return FALSE;
}

bool8 sub_813D1C0(void)
{
    gUnknown_203F37C = Alloc(NUM_BERRIES * sizeof(struct ListMenuItem));
    if (gUnknown_203F37C == NULL)
        return FALSE;
    gUnknown_203F380 = Alloc(gUnknown_203F36C->unk_007 * 27);
    if (gUnknown_203F380 == NULL)
        return FALSE;
    return TRUE;
}

void sub_813D204(void)
{
    u16 i;
    struct BagPocket *pocket = &gBagPockets[POCKET_BERRY_POUCH - 1];
    for (i = 0; i < gUnknown_203F36C->unk_007; i++)
    {
        sub_813D31C(&gUnknown_203F380[i * 27], pocket->itemSlots[i].itemId);
        gUnknown_203F37C[i].label = &gUnknown_203F380[i * 27];
        gUnknown_203F37C[i].index = i;
    }
    gUnknown_203F37C[i].label = gText_Close;
    gUnknown_203F37C[i].index = i;
    gMultiuseListMenuTemplate.items = gUnknown_203F37C;
    if (gUnknown_203F370.unk_04 != 5)
        gMultiuseListMenuTemplate.totalItems = gUnknown_203F36C->unk_007 + 1;
    else
        gMultiuseListMenuTemplate.totalItems = gUnknown_203F36C->unk_007;
    gMultiuseListMenuTemplate.windowId = 0;
    gMultiuseListMenuTemplate.header_X = 0;
    gMultiuseListMenuTemplate.item_X = 9;
    gMultiuseListMenuTemplate.cursor_X = 1;
    gMultiuseListMenuTemplate.lettersSpacing = 0;
    gMultiuseListMenuTemplate.itemVerticalPadding = 2;
    gMultiuseListMenuTemplate.upText_Y = 2;
    gMultiuseListMenuTemplate.maxShowed = gUnknown_203F36C->unk_008;
    gMultiuseListMenuTemplate.fontId = 2;
    gMultiuseListMenuTemplate.cursorPal = 2;
    gMultiuseListMenuTemplate.fillValue = 0;
    gMultiuseListMenuTemplate.cursorShadowPal = 3;
    gMultiuseListMenuTemplate.moveCursorFunc = sub_813D3C0;
    gMultiuseListMenuTemplate.itemPrintFunc = sub_813D430;
    gMultiuseListMenuTemplate.cursorKind = 0;
    gMultiuseListMenuTemplate.scrollMultiple = 0;
}

void sub_813D31C(u8 * dest, u16 itemId)
{
    StringCopy(gStringVar4, gText_FontSize0);
    StringAppend(gStringVar4, gOtherText_UnkF9_08_Clear_01);
    ConvertIntToDecimalStringN(gStringVar1, itemId - FIRST_BERRY_INDEX + 1, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringAppend(gStringVar4, gStringVar1);
    CopyItemName(itemId, gStringVar1);
    StringAppend(gStringVar4, gUnknown_84643B4);
    StringAppend(gStringVar4, gText_FontSize2);
    StringAppend(gStringVar4, gStringVar1);
    StringCopy(dest, gStringVar4);
}

void sub_813D39C(s16 a0, u8 *dest)
{
    StringCopy(dest, &gUnknown_203F380[a0 * 27]);
}

void sub_813D3C0(s32 itemIndex, bool8 onInit, struct ListMenu *list)
{
    if (onInit != TRUE)
    {
        PlaySE(SE_W287B);
        sub_813EC28();
    }
    DestroyItemMenuIcon(gUnknown_203F36C->unk_009 ^ 1);
    if (gUnknown_203F36C->unk_007 != itemIndex)
        sub_80989A0(BagGetItemIdByPocketPosition(POCKET_BERRY_POUCH, itemIndex), gUnknown_203F36C->unk_009);
    else
        sub_80989A0(ITEM_N_A, gUnknown_203F36C->unk_009);
    gUnknown_203F36C->unk_009 ^= 1;
    sub_813D538(itemIndex);
}

void sub_813D430(u8 windowId, s32 itemId, u8 y)
{
    u16 unused;
    u16 itemQuantity;
    if (itemId != -2 && gUnknown_203F36C->unk_007 != itemId)
    {
        unused = BagGetItemIdByPocketPosition(POCKET_BERRY_POUCH, itemId);
        itemQuantity = BagGetQuantityByPocketPosition(POCKET_BERRY_POUCH, itemId);
        ConvertIntToDecimalStringN(gStringVar1, itemQuantity, STR_CONV_MODE_RIGHT_ALIGN, 3);
        StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
        sub_813E9A0(windowId, 0, gStringVar4, 110, y, 0, 0, 0xFF, 1);
    }
}

void sub_813D4B0(u8 taskId, u8 colorIdx)
{
    sub_813D4D0(ListMenuGetYCoordForPrintingArrowCursor(taskId), colorIdx);
}

void sub_813D4D0(u8 y, u8 colorIdx)
{
    u8 width;
    u8 height;
    if (colorIdx == 0xFF)
    {
        width = GetMenuCursorDimensionByFont(2, 0);
        height = GetMenuCursorDimensionByFont(2, 1);
        FillWindowPixelRect(0, 0, 1, y, width, height);
        CopyWindowToVram(0, 2);
    }
    else
    {
        sub_813E9A0(0, 2, gFameCheckerText_ListMenuCursor, 1, y, 0, 0, 0, colorIdx);
    }
}

void sub_813D538(s32 itemIdx)
{
    const u8 *str;
    if (itemIdx != gUnknown_203F36C->unk_007)
        str = ItemId_GetDescription(BagGetItemIdByPocketPosition(POCKET_BERRY_POUCH, itemIdx));
    else
        str = gUnknown_8416716;
    FillWindowPixelBuffer(1, PIXEL_FILL(0));
    sub_813E9A0(1, 2, str, 0, 2, 2, 0, 0, 0);
}

void sub_813D594(s32 pal)
{
    SetBgRectPal(1, 0, 16, 30, 4, pal + 1);
    ScheduleBgCopyTilemapToVram(1);
}

void sub_813D5BC(void)
{
    if (gUnknown_203F370.unk_04 != 5)
        gUnknown_203F36C->unk_006 = AddScrollIndicatorArrowPairParameterized(2, 160, 8, 120, gUnknown_203F36C->unk_007 - gUnknown_203F36C->unk_008 + 1, 110, 110, &gUnknown_203F370.unk_0A);
    else
        gUnknown_203F36C->unk_006 = AddScrollIndicatorArrowPairParameterized(2, 160, 8, 120, gUnknown_203F36C->unk_007 - gUnknown_203F36C->unk_008, 110, 110, &gUnknown_203F370.unk_0A);
}

void sub_813D614(void)
{
    gUnknown_203F36C->unk_004 = 1;
    gUnknown_203F36C->unk_006 = AddScrollIndicatorArrowPairParameterized(2, 212, 120, 152, 2, 110, 110, &gUnknown_203F36C->unk_004);
}

void sub_813D64C(void)
{
    gUnknown_203F36C->unk_004 = 1;
    gUnknown_203F36C->unk_006 = AddScrollIndicatorArrowPairParameterized(2, 152, 72, 104, 2, 110, 110, &gUnknown_203F36C->unk_004);
}

void sub_813D684(void)
{
    if (gUnknown_203F36C->unk_006 != 0xFF)
    {
        RemoveScrollIndicatorArrowPair(gUnknown_203F36C->unk_006);
        gUnknown_203F36C->unk_006 = 0xFF;
    }
}

void sub_813D6A4(void)
{
    u32 slack = 72 - GetStringWidth(1, gUnknown_841670A, 0);
    sub_813E9A0(2, 1, gUnknown_841670A, slack / 2, 1, 0, 0, 0, 0);
}

void sub_813D6E4(void)
{
    gUnknown_203F370.unk_08 = 0;
    gUnknown_203F370.unk_0A = 0;
}

void sub_813D6F4(void)
{
    s32 r2;
    if (gUnknown_203F370.unk_04 != 5)
        r2 = gUnknown_203F36C->unk_007 + 1;
    else
        r2 = gUnknown_203F36C->unk_007;
    if (gUnknown_203F370.unk_0A != 0 && gUnknown_203F370.unk_0A + gUnknown_203F36C->unk_008 > r2)
        gUnknown_203F370.unk_0A = r2 - gUnknown_203F36C->unk_008;
    if (gUnknown_203F370.unk_0A + gUnknown_203F370.unk_08 >= r2)
    {
        if (r2 == 0 || r2 == 1)
            gUnknown_203F370.unk_08 = 0;
        else
            gUnknown_203F370.unk_08 = r2 - 1;
    }
}

void sub_813D754(void)
{
    u8 lim;
    u8 i;
    if (gUnknown_203F370.unk_04 != 5)
        lim = gUnknown_203F36C->unk_007 + 1;
    else
        lim = gUnknown_203F36C->unk_007;
    if (gUnknown_203F370.unk_08 > 4)
    {
        for (i = 0; i <= gUnknown_203F370.unk_08 - 4; gUnknown_203F370.unk_08--, gUnknown_203F370.unk_0A++, i++)
        {
            if (gUnknown_203F370.unk_0A + gUnknown_203F36C->unk_008 == lim)
                break;
        }
    }
}

void sub_813D7CC(void)
{
    if (gUnknown_203F36C != NULL)
        Free(gUnknown_203F36C);
    if (gUnknown_203F37C != NULL)
        Free(gUnknown_203F37C);
    if (gUnknown_203F380 != NULL)
        Free(gUnknown_203F380);
    FreeAllWindowBuffers();
}

void BerryPouch_StartFadeToExitCallback(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, -2, 0, 16, RGB_BLACK);
    gTasks[taskId].func = sub_813D844;
}

void sub_813D844(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    if (!gPaletteFade.active)
    {
        DestroyListMenuTask(data[0], &gUnknown_203F370.unk_0A, &gUnknown_203F370.unk_08);
        if (gUnknown_203F36C->unk_000 != NULL)
            SetMainCallback2(gUnknown_203F36C->unk_000);
        else
            SetMainCallback2(gUnknown_203F370.savedCallback);
        sub_813D684();
        sub_813D7CC();
        DestroyTask(taskId);
    }
}

void sub_813D8AC(void)
{
    u16 i;
    u32 r2;
    struct BagPocket *pocket = &gBagPockets[POCKET_BERRY_POUCH - 1];
    SortAndCompactBagPocket(pocket);
    gUnknown_203F36C->unk_007 = 0;
    for (i = 0; i < pocket->capacity; i++)
    {
        if (pocket->itemSlots[i].itemId == ITEM_NONE)
            break;
        gUnknown_203F36C->unk_007++;
    }
    if (gUnknown_203F370.unk_04 != 5)
        r2 = gUnknown_203F36C->unk_007 + 1;
    else
        r2 = gUnknown_203F36C->unk_007;
    if (r2 > 7)
        gUnknown_203F36C->unk_008 = 7;
    else
        gUnknown_203F36C->unk_008 = r2;
}

void BerryPouch_SetExitCallback(void (*callback)(void))
{
    gUnknown_203F36C->unk_000 = callback;
}

void sub_813D940(u8 taskId, const u8 * str)
{
    s16 * data = gTasks[taskId].data;
    u8 windowId = sub_813EA08(8);
    u8 windowId2;
    sub_813D39C(data[1], gStringVar1);
    StringExpandPlaceholders(gStringVar4, str);
    sub_813E9A0(windowId, 2, gStringVar4, 0, 2, 1, 2, 0, 1);
    windowId2 = sub_813EA08(0);
    ConvertIntToDecimalStringN(gStringVar1, 1, STR_CONV_MODE_LEADING_ZEROS, 3);
    StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
    sub_813E9A0(windowId2, 0, gStringVar4, 4, 10, 1, 0, 0, 1);
}

void sub_813D9F8(u8 whichWindow, s16 quantity, u8 ndigits)
{
    u8 windowId = sub_813EB10(whichWindow);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    ConvertIntToDecimalStringN(gStringVar1, quantity, STR_CONV_MODE_LEADING_ZEROS, ndigits);
    StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
    sub_813E9A0(windowId, 0, gStringVar4, 4, 10, 1, 0, 0, 1);
}

void sub_813DA68(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    s32 menuInput;
    if (!gPaletteFade.active && sub_80BF72C() != TRUE)
    {
        menuInput = ListMenu_ProcessInput(data[0]);
        ListMenuGetScrollAndRow(data[0], &gUnknown_203F370.unk_0A, &gUnknown_203F370.unk_08);
        if (JOY_NEW(SELECT_BUTTON) && gUnknown_203F370.unk_05 == 1)
        {
            PlaySE(SE_SELECT);
            gSpecialVar_ItemId = 0;
            BerryPouch_StartFadeToExitCallback(taskId);
        }
        else
        {
            switch (menuInput)
            {
            case -1:
                return;
            case -2:
                if (gUnknown_203F370.unk_04 != 5)
                {
                    PlaySE(SE_SELECT);
                    gSpecialVar_ItemId = 0;
                    BerryPouch_StartFadeToExitCallback(taskId);
                }
                break;
            default:
                PlaySE(SE_SELECT);
                if (gUnknown_203F370.unk_04 == 5)
                {
                    gSpecialVar_ItemId = BagGetItemIdByPocketPosition(POCKET_BERRY_POUCH, menuInput);
                    BerryPouch_StartFadeToExitCallback(taskId);
                }
                else if (menuInput == gUnknown_203F36C->unk_007)
                {
                    gSpecialVar_ItemId = 0;
                    BerryPouch_StartFadeToExitCallback(taskId);
                }
                else
                {
                    sub_813D684();
                    sub_813D594(1);
                    sub_813D4B0(data[0], 2);
                    data[1] = menuInput;
                    data[2] = BagGetQuantityByPocketPosition(POCKET_BERRY_POUCH, menuInput);
                    gSpecialVar_ItemId = BagGetItemIdByPocketPosition(POCKET_BERRY_POUCH, menuInput);
                    gTasks[taskId].func = gUnknown_8464358[gUnknown_203F370.unk_04];
                }
                break;
            }
        }
    }
}

void sub_813DBB4(u8 taskId)
{
    sub_813D594(0);
    sub_813D5BC();
    gTasks[taskId].func = sub_813DA68;
}

void sub_813DBE4(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u8 windowId;
    u8 windowId2;

    if (gUnknown_203F370.unk_04 == 4)
    {
        gUnknown_203F384 = gUnknown_84643B0;
        gUnknown_203F388 = 3;
    }
    else if (MenuHelpers_LinkSomething() == TRUE || InUnionRoom() == TRUE)
    {
        if (!sub_80BF6A8(gSpecialVar_ItemId))
        {
            gUnknown_203F384 = gUnknown_84643AC;
            gUnknown_203F388 = 1;
        }
        else
        {
            gUnknown_203F384 = gUnknown_84643A8;
            gUnknown_203F388 = 2;
        }
    }
    else
    {
        gUnknown_203F384 = gUnknown_84643A4;
        gUnknown_203F388 = 4;
    }
    windowId = sub_813EA08(gUnknown_203F388 + 9);
    AddItemMenuActionTextPrinters(windowId, 2, GetMenuCursorDimensionByFont(2, 0), 2, GetFontAttribute(2, FONTATTR_LETTER_SPACING), GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT) + 2, gUnknown_203F388, gUnknown_846437C, gUnknown_203F384);
    Menu_InitCursor(windowId, 2, 0, 2, GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT) + 2, gUnknown_203F388, 0);
    windowId2 = sub_813EA08(6);
    sub_813D39C(data[1], gStringVar1);
    StringExpandPlaceholders(gStringVar4, gOtherText_StrVar1);
    sub_813E9A0(windowId2, 2, gStringVar4, 0, 2, 1, 2, 0, 1);
}

void sub_813DD74(u8 taskId)
{
    sub_813DBE4(taskId);
    gTasks[taskId].func = sub_813DDA0;
}

void sub_813DDA0(u8 taskId)
{
    s8 input;
    if (sub_80BF72C() != TRUE)
    {
        input = Menu_ProcessInputNoWrapAround();
        switch (input)
        {
        case -2:
            break;
        case -1:
            PlaySE(SE_SELECT);
            gUnknown_846437C[BP_ACTION_EXIT].func.void_u8(taskId);
            break;
        default:
            PlaySE(SE_SELECT);
            gUnknown_846437C[gUnknown_203F384[input]].func.void_u8(taskId);
            break;
        }
    }
}

void sub_813DE0C(u8 taskId)
{
    sub_813EA98(gUnknown_203F388 + 9);
    sub_813EA98(6);
    PutWindowTilemap(0);
    PutWindowTilemap(1);
    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(2);
    if (gUnknown_203F370.unk_04 == 4)
    {
        if (ItemId_GetBattleFunc(gSpecialVar_ItemId) == NULL)
            FieldUseFunc_OakStopsYou(taskId);
        else
            ItemId_GetBattleFunc(gSpecialVar_ItemId)(taskId);
    }
    else if (CalculatePlayerPartyCount() == 0 && ItemId_GetType(gSpecialVar_ItemId) == 1)
        sub_813E274(taskId);
    else
        ItemId_GetFieldFunc(gSpecialVar_ItemId)(taskId);
}

void sub_813DEBC(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    ClearWindowTilemap(sub_813EB10(gUnknown_203F388 + 9));
    ClearWindowTilemap(sub_813EB10(6));
    sub_813EA98(gUnknown_203F388 + 9);
    sub_813EA98(6);
    PutWindowTilemap(0);
    data[8] = 1;
    if (data[2] == 1)
        sub_813DF54(taskId);
    else
    {
        sub_813D940(taskId, gUnknown_84163DB);
        sub_813D614();
        gTasks[taskId].func = sub_813E010;
    }
}

void sub_813DF54(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    ConvertIntToDecimalStringN(gStringVar2, data[8], STR_CONV_MODE_LEFT_ALIGN, 3);
    StringExpandPlaceholders(gStringVar4, gUnknown_8416409);
    sub_813E9A0(sub_813EA08(7), 2, gStringVar4, 0, 2, 1, 2, 0, 1);
    sub_813EB7C(taskId, &gUnknown_846436C);
}

void sub_813DFC8(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    sub_813EA98(7);
    PutWindowTilemap(1);
    PutWindowTilemap(0);
    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(2);
    sub_813D4B0(data[0], 1);
    sub_813DBB4(taskId);
}

void sub_813E010(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    if (AdjustQuantityAccordingToDPadInput(&data[8], data[2]) == TRUE)
        sub_813D9F8(0, data[8], 3);
    else if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        ClearWindowTilemap(sub_813EB10(8));
        sub_813EA98(8);
        sub_813EA98(0);
        ScheduleBgCopyTilemapToVram(0);
        ScheduleBgCopyTilemapToVram(2);
        sub_813D684();
        sub_813DF54(taskId);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        sub_813EA98(8);
        sub_813EA98(0);
        PutWindowTilemap(0);
        PutWindowTilemap(1);
        ScheduleBgCopyTilemapToVram(0);
        ScheduleBgCopyTilemapToVram(2);
        sub_813D4B0(data[0], 1);
        sub_813D684();
        sub_813DBB4(taskId);
    }
}

void sub_813E0DC(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    sub_813EA98(7);
    sub_813D39C(data[1], gStringVar1);
    ConvertIntToDecimalStringN(gStringVar2, data[8], STR_CONV_MODE_LEFT_ALIGN, 3);
    StringExpandPlaceholders(gStringVar4, gUnknown_84163F4);
    sub_813E9A0(sub_813EA08(9), 2, gStringVar4, 0, 2, 1, 2, 0, 1);
    gTasks[taskId].func = sub_813E164;
}

void sub_813E164(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        RemoveBagItem(gSpecialVar_ItemId, data[8]);
        sub_813EA98(9);
        DestroyListMenuTask(data[0], &gUnknown_203F370.unk_0A, &gUnknown_203F370.unk_08);
        sub_813D8AC();
        sub_813D6F4();
        sub_813D204();
        data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gUnknown_203F370.unk_0A, gUnknown_203F370.unk_08);
        PutWindowTilemap(1);
        ScheduleBgCopyTilemapToVram(0);
        sub_813D4B0(data[0], 1);
        sub_813DBB4(taskId);
    }
}

void sub_813E200(u8 taskId)
{
    sub_813EA98(gUnknown_203F388 + 9);
    sub_813EA98(6);
    PutWindowTilemap(0);
    PutWindowTilemap(1);
    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(2);
    if (CalculatePlayerPartyCount() == 0)
        sub_813E274(taskId);
    else
    {
        gUnknown_203F36C->unk_000 = sub_8126EDC;
        gTasks[taskId].func = BerryPouch_StartFadeToExitCallback;
    }
}

void sub_813E274(u8 taskId)
{
    DisplayItemMessageInBerryPouch(taskId, 2, gText_ThereIsNoPokemon, sub_813E290);
}

void sub_813E290(u8 taskId)
{
    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        sub_813E2B8(taskId);
    }
}

void sub_813E2B8(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    sub_813EACC(5);
    DestroyListMenuTask(data[0], &gUnknown_203F370.unk_0A, &gUnknown_203F370.unk_08);
    sub_813D8AC();
    sub_813D6F4();
    sub_813D204();
    data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gUnknown_203F370.unk_0A, gUnknown_203F370.unk_08);
    ScheduleBgCopyTilemapToVram(0);
    sub_813D4B0(data[0], 1);
    sub_813DBB4(taskId);
}

void sub_813E320(u8 taskId)
{
    sub_813EA98(gUnknown_203F388 + 9);
    sub_813EA98(6);
    PutWindowTilemap(0);
    PutWindowTilemap(1);
    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(2);
    sub_813D4B0(gTasks[taskId].data[0], 1);
    sub_813DBB4(taskId);
}

void sub_813E37C(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u16 itemId = BagGetItemIdByPocketPosition(POCKET_BERRY_POUCH, data[1]);
    if (!sub_80BF6A8(itemId))
    {
        CopyItemName(itemId, gStringVar1);
        StringExpandPlaceholders(gStringVar4, gUnknown_8416374);
        DisplayItemMessageInBerryPouch(taskId, 2, gStringVar4, sub_813E290);
    }
    else
    {
        gUnknown_203F36C->unk_000 = c2_8123744;
        gTasks[taskId].func = BerryPouch_StartFadeToExitCallback;
    }
}

void sub_813E3FC(u8 taskId)
{
    gUnknown_203F36C->unk_000 = sub_808CE60;
    gTasks[taskId].func = BerryPouch_StartFadeToExitCallback;
}

void sub_813E428(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    if (itemid_get_market_price(gSpecialVar_ItemId) == 0)
    {
        CopyItemName(gSpecialVar_ItemId, gStringVar1);
        StringExpandPlaceholders(gStringVar4, gText_OhNoICantBuyThat);
        DisplayItemMessageInBerryPouch(taskId, sub_80BF8E4(), gStringVar4, sub_813E2B8);
    }
    else
    {
        data[8] = 1;
        if (data[2] == 1)
        {
            sub_813EBD4();
            sub_813E4E4(taskId);
        }
        else
        {
            if (data[2] > 99)
                data[2] = 99;
            CopyItemName(gSpecialVar_ItemId, gStringVar1);
            StringExpandPlaceholders(gStringVar4, gText_HowManyWouldYouLikeToSell);
            DisplayItemMessageInBerryPouch(taskId, sub_80BF8E4(), gStringVar4, sub_813E5B8);
        }
    }
}

void sub_813E4E4(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    ConvertIntToDecimalStringN(gStringVar3, itemid_get_market_price(BagGetItemIdByPocketPosition(POCKET_BERRY_POUCH, data[1])) / 2 * data[8], STR_CONV_MODE_LEFT_ALIGN, 6);
    StringExpandPlaceholders(gStringVar4, gText_ICanPayThisMuch_WouldThatBeOkay);
    DisplayItemMessageInBerryPouch(taskId, sub_80BF8E4(), gStringVar4, sub_813E554);
}

void sub_813E554(u8 taskId)
{
    sub_813EBA8(taskId, &gUnknown_8464374);
}

void sub_813E568(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    sub_813EA98(2);
    sub_813EACC(5);
    PutWindowTilemap(2);
    PutWindowTilemap(0);
    PutWindowTilemap(1);
    ScheduleBgCopyTilemapToVram(0);
    sub_813D4B0(data[0], 1);
    sub_813DBB4(taskId);
}

void sub_813E5B8(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u8 windowId = sub_813EA08(1);
    ConvertIntToDecimalStringN(gStringVar1, 1, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
    sub_813E9A0(windowId, 0, gStringVar4, 4, 10, 1, 0, 0xFF, 1);
    sub_813E668(itemid_get_market_price(BagGetItemIdByPocketPosition(POCKET_BERRY_POUCH, data[1])) / 2 * data[8]);
    sub_813EBD4();
    sub_813D64C();
    gTasks[taskId].func = sub_813E690;
}

void sub_813E668(s32 price)
{
    PrintMoneyAmount(sub_813EB10(1), 56, 10, price, 0);
}

void sub_813E690(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    if (AdjustQuantityAccordingToDPadInput(&data[8], data[2]) == TRUE)
    {
        sub_813D9F8(1, data[8], 2);
        sub_813E668(itemid_get_market_price(BagGetItemIdByPocketPosition(POCKET_BERRY_POUCH, data[1])) / 2 * data[8]);
    }
    else if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        sub_813EA98(1);
        PutWindowTilemap(0);
        ScheduleBgCopyTilemapToVram(0);
        sub_813D684();
        sub_813E4E4(taskId);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        sub_813EA98(1);
        sub_813EA98(2);
        sub_813EACC(5);
        PutWindowTilemap(2);
        PutWindowTilemap(0);
        PutWindowTilemap(1);
        ScheduleBgCopyTilemapToVram(0);
        sub_813D684();
        sub_813D4B0(data[0], 1);
        sub_813DBB4(taskId);
    }
}

void sub_813E768(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    PutWindowTilemap(0);
    ScheduleBgCopyTilemapToVram(0);
    CopyItemName(gSpecialVar_ItemId, gStringVar1);
    ConvertIntToDecimalStringN(gStringVar3, itemid_get_market_price(BagGetItemIdByPocketPosition(POCKET_BERRY_POUCH, data[1])) / 2 * data[8], STR_CONV_MODE_LEFT_ALIGN, 6);
    StringExpandPlaceholders(gStringVar4, gText_TurnedOverItemsWorthYen);
    DisplayItemMessageInBerryPouch(taskId, 2, gStringVar4, sub_813E7F0);
}

void sub_813E7F0(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    PlaySE(SE_CASHIER);
    RemoveBagItem(gSpecialVar_ItemId, data[8]);
    AddMoney(&gSaveBlock1Ptr->money, itemid_get_market_price(gSpecialVar_ItemId) / 2 * data[8]);
    sub_809C09C(gSpecialVar_ItemId, data[8], 2);
    DestroyListMenuTask(data[0], &gUnknown_203F370.unk_0A, &gUnknown_203F370.unk_08);
    sub_813D8AC();
    sub_813D6F4();
    sub_813D204();
    data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gUnknown_203F370.unk_0A, gUnknown_203F370.unk_08);
    sub_813D4B0(data[0], 2);
    PrintMoneyAmountInMoneyBox(sub_813EB10(2), GetMoney(&gSaveBlock1Ptr->money), 0);
    gTasks[taskId].func = sub_813E8D4;
}

void sub_813E8D4(u8 taskId)
{
    if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        sub_813EA98(2);
        PutWindowTilemap(2);
        sub_813E2B8(taskId);
    }
}
