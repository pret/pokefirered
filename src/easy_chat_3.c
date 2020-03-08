#include "global.h"
#include "gflib.h"
#include "data_8479668.h"
#include "decompress.h"
#include "easy_chat.h"
#include "graphics.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "strings.h"
#include "text_window.h"

struct Unk203A11C
{
    u16 unk0;
    u16 windowId;
    u16 unk4;
    u8 unk6;
    u8 unk7;
    s8 unk8;
    u8 unk9;
    u8 unkA[0xC1];
    u8 unkCC[0x200];
    u16 unk2CE;
    int unk2D0;
    int unk2D4;
    struct Sprite *unk2D8;
    struct Sprite *unk2DC;
    struct Sprite *unk2E0;
    struct Sprite *unk2E4;
    struct Sprite *unk2E8;
    struct Sprite *unk2EC;
    struct Sprite *unk2F0;
    struct Sprite *unk2F4;
    struct Sprite *unk2F8;
    struct Sprite *unk2FC;
    u16 unk300[BG_SCREEN_SIZE / 2];
    u16 unkB00[BG_SCREEN_SIZE / 2];
};

struct EasyChatPhraseFrameDimensions
{
    u8 left;
    u8 top;
    u8 width;
    u8 height;
};

EWRAM_DATA struct Unk203A11C *gUnknown_203ACEC = NULL;

bool8 sub_8100258(void);
bool8 sub_8100290(void);
bool8 sub_8100374(void);
bool8 sub_81003A8(void);
bool8 sub_81003EC(void);
bool8 sub_8100430(void);
bool8 sub_8100474(void);
bool8 sub_81004B8(void);
bool8 sub_81004F4(void);
bool8 sub_81005C0(void);
bool8 sub_8100660(void);
bool8 sub_8100720(void);
bool8 sub_810072C(void);
bool8 sub_8100774(void);
bool8 sub_81007D0(void);
bool8 sub_8100890(void);
bool8 sub_810093C(void);
bool8 sub_81009F8(void);
bool8 sub_8100A04(void);
bool8 sub_8100A78(void);
bool8 sub_8100AE8(void);
bool8 sub_8100B70(void);
bool8 sub_8100BF4(void);
void sub_8100C5C(void);
void sub_8100CBC(void);
void sub_8100D24(void);
void sub_8100DC4(u8 windowId, u8 fontId, const u8 *str, u8 left, u8 top, u8 speed, u8 bg, u8 fg, u8 shadow);
void sub_8100E34(void);
void sub_8100E7C(u8 a0);
void sub_8100F18(u8 initialCursorPos);
void sub_8100F44(void);
void sub_8100FDC(void);
void sub_8101100(u16 *buffer);
void sub_81012CC(void);
void sub_81012E0(u32 a0);
void sub_810131C(void);
void sub_810133C(void);
void PrintEasyChatKeyboardText(void);
void sub_81013DC(void);
void sub_81013EC(void);
void sub_8101410(void);
void sub_8101434(void);
void sub_8101478(void);
void sub_81014AC(u8 a0, u8 a1);
void sub_8101558(u8 a0, u8 a1);
void sub_81015BC(void);
void sub_81015D4(int a0);
bool8 sub_81016AC(void);
void sub_81016E4(u8 a0);
void sub_8101830(int left, int top, int width, int height);
void sub_810198C(void);
void sub_81019B0(s16 a0, u8 a1);
bool8 sub_8101A10(void);
s32 sub_8101A48(void);
void sub_8101A5C(u8 left, u8 top, u8 right, u8 bottom);
void sub_8101A90(void);
void sub_8101AC4(void);
void sub_8101B20(struct Sprite * sprite);
void sub_8101B58(u8 x, u8 y);
void sub_8101B88(void);
void sub_8101BA8(void);
void sub_8101BC0(void);
void sub_8101C48(void);
void sub_8101C80(void);
void sub_8101CE4(s8 a0, s8 a1);
void sub_8101D9C(s8 a0, s8 a1);
void sub_8101E80(void);
void sub_8101ED4(struct Sprite * sprite);
void sub_8101F04(void);
void sub_8101F40(u8 x, u8 y);
void sub_8101F80(void);
void sub_8101FAC(void);
bool8 sub_8102018(void);
void sub_81020AC(void);
bool8 sub_81020D0(void);
void sub_810215C(void);
void sub_8102178(void);
bool8 sub_81021B8(void);
void sub_81021D4(void);
void sub_810224C(void);
void sub_81022B0(void);
void sub_81022E0(int a0);
void sub_8102320(void);
void sub_8102394(void);
void sub_81023F8(void);
void sub_8102428(void);

const u16 gUnknown_843F3B8[] = INCBIN_U16("graphics/link_rfu/unk_843F3F8.gbapal");
const u16 gUnknown_843F3D8[] = INCBIN_U16("graphics/link_rfu/unk_8E9BD28.gbapal");
const u16 gUnknown_843F3F8[] = INCBIN_U16("graphics/link_rfu/unk_843F3F8.4bpp");
const u16 gUnknown_843F418[] = INCBIN_U16("graphics/link_rfu/unk_843F418.4bpp");
const u16 gUnknown_843F518[] = INCBIN_U16("graphics/link_rfu/unk_843F518.4bpp");
const u16 gUnknown_843F618[] = INCBIN_U16("graphics/link_rfu/unk_843F638.gbapal");
const u32 gUnknown_843F638[] = INCBIN_U32("graphics/link_rfu/unk_843F638.4bpp.lz");
const u16 gUnknown_843F76C[] = INCBIN_U16("graphics/link_rfu/unk_843F76C.gbapal");
const u16 gUnknown_843F78C[] = INCBIN_U16("graphics/link_rfu/unk_843F78C.gbapal");
const u32 gUnknown_843F7AC[] = INCBIN_U32("graphics/link_rfu/unk_843F7AC.4bpp.lz");

const u16 gUnknown_843F874[] = {
    RGB( 0,  0,  0),
    RGB( 0,  0,  0),
    RGB( 7, 25, 31),
    RGB(21, 21, 29)
};

const u16 gUnknown_843F87C[] = {
    RGB( 0,  0,  0),
    RGB(31, 31, 31),
    RGB(12, 12, 12),
    RGB(27, 26, 27),
    RGB( 8, 17,  9)
};

const struct EasyChatPhraseFrameDimensions sPhraseFrameDimensions[] = {
    {
        .left = 0x03,
        .top = 0x04,
        .width = 0x18,
        .height = 0x04
    }, {
        .left = 0x01,
        .top = 0x04,
        .width = 0x1b,
        .height = 0x04
    }, {
        .left = 0x03,
        .top = 0x00,
        .width = 0x18,
        .height = 0x0a
    }, {
        .left = 0x06,
        .top = 0x06,
        .width = 0x12,
        .height = 0x04
    }, {
        .left = 0x10,
        .top = 0x04,
        .width = 0x09,
        .height = 0x02
    }, {
        .left = 0x0e,
        .top = 0x04,
        .width = 0x12,
        .height = 0x04
    }
};

const struct BgTemplate sEasyChatBgTemplates[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 28,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0,
    }, {
        .bg = 1,
        .charBaseIndex = 3,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0,
    }, {
        .bg = 2,
        .charBaseIndex = 0,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x80,
    }, {
        .bg = 3,
        .charBaseIndex = 2,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0,
    }
};

const struct WindowTemplate sEasyChatWindowTemplates[] = {
    {
        .bg = 1,
        .tilemapLeft = 7,
        .tilemapTop = 0,
        .width = 16,
        .height = 2,
        .paletteNum = 10,
        .baseBlock = 0x10,
    },
    {
        .bg = 0,
        .tilemapLeft = 4,
        .tilemapTop = 15,
        .width = 22,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0xA,
    },
    {
        .bg = 2,
        .tilemapLeft = 1,
        .tilemapTop = 0,
        .width = 28,
        .height = 32,
        .paletteNum = 3,
        .baseBlock = 0,
    },
    DUMMY_WIN_TEMPLATE,
};

const struct WindowTemplate sEasyChatYesNoWindowTemplate = {
    .bg = 0,
    .tilemapLeft = 22,
    .tilemapTop = 9,
    .width = 5,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x062
};

const u8 gUnknown_843F8D8[] = _("{UNDERSCORE}");
const u8 sText_Clear17[] = _("{CLEAR 17}");

const u8 *const sEasyChatKeyboardText[] = {
    gUnknown_847A8D8,
    gUnknown_847A8FA,
    gUnknown_847A913,
    gUnknown_847A934
};

const struct SpriteSheet sEasyChatSpriteSheets[] = {
    {gUnknown_843F3F8, 0x0020, 0},
    {gUnknown_843F418, 0x0100, 2},
    {gUnknown_843F518, 0x0100, 3},
    {}
};

const struct SpritePalette sEasyChatSpritePalettes[] = {
    {gUnknown_843F3B8, 0},
    {gUnknown_843F3D8, 1},
    {gUnknown_8E99F24, 2},
    {gUnknown_843F618, 3},
    {}
};

const struct CompressedSpriteSheet gUnknown_843F938[] = {
    {gUnknown_843F638, 0x0800, 5},
    {gUnknown_8E9BD28, 0x1000, 1},
    {gUnknown_8E99F44, 0x0800, 6},
    {gUnknown_8E9A168, 0x1000, 4}
};

const u8 gUnknown_843F958[] = {
     0,
    12,
    24,
    56,
    68,
    80,
    92
};

const struct OamData gUnknown_843F960 = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .bpp = ST_OAM_4BPP,
    .mosaic = FALSE,
    .shape = SPRITE_SHAPE(8x8),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(8x8),
    .tileNum = 0x000,
    .priority = 3,
    .paletteNum = 0
};

const struct SpriteTemplate gUnknown_843F968 = {
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gUnknown_843F960,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_8101B20
};

const struct OamData gUnknown_843F980 = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .bpp = ST_OAM_4BPP,
    .mosaic = FALSE,
    .shape = SPRITE_SHAPE(64x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x32),
    .tileNum = 0x000,
    .priority = 1,
    .paletteNum = 0
};

const union AnimCmd gUnknown_843F988[] = {
    ANIMCMD_FRAME(0x00, 0),
    ANIMCMD_END
};

const union AnimCmd gUnknown_843F990[] = {
    ANIMCMD_FRAME(0x20, 0),
    ANIMCMD_END
};

const union AnimCmd gUnknown_843F998[] = {
    ANIMCMD_FRAME(0x40, 0),
    ANIMCMD_END
};

const union AnimCmd gUnknown_843F9A0[] = {
    ANIMCMD_FRAME(0x60, 0),
    ANIMCMD_END
};

const union AnimCmd *const gUnknown_843F9A8[] = {
    gUnknown_843F988,
    gUnknown_843F990,
    gUnknown_843F998,
    gUnknown_843F9A0
};

const struct SpriteTemplate gUnknown_843F9B8 = {
    .tileTag = 1,
    .paletteTag = 1,
    .oam = &gUnknown_843F980,
    .anims = gUnknown_843F9A8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_8101B20
};

const struct OamData gUnknown_843F9D0 = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .bpp = ST_OAM_4BPP,
    .mosaic = FALSE,
    .shape = SPRITE_SHAPE(64x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x32),
    .tileNum = 0x000,
    .priority = 1,
    .paletteNum = 0
};

const union AnimCmd gUnknown_843F9D8[] = {
    ANIMCMD_FRAME(0x60, 0),
    ANIMCMD_END
};

const union AnimCmd gUnknown_843F9E0[] = {
    ANIMCMD_FRAME(0x40, 4),
    ANIMCMD_FRAME(0x20, 4),
    ANIMCMD_END
};

const union AnimCmd gUnknown_843F9EC[] = {
    ANIMCMD_FRAME(0x40, 4),
    ANIMCMD_FRAME(0x00, 4),
    ANIMCMD_END
};

const union AnimCmd gUnknown_843F9F8[] = {
    ANIMCMD_FRAME(0x40, 4),
    ANIMCMD_FRAME(0x60, 0),
    ANIMCMD_END
};

const union AnimCmd gUnknown_843FA04[] = {
    ANIMCMD_FRAME(0x40, 4),
    ANIMCMD_END
};

const union AnimCmd *const gUnknown_843FA0C[] = {
    gUnknown_843F9D8,
    gUnknown_843F9E0,
    gUnknown_843F9EC,
    gUnknown_843F9F8,
    gUnknown_843FA04
};

const struct SpriteTemplate gUnknown_843FA20 = {
    .tileTag = 4,
    .paletteTag = 2,
    .oam = &gUnknown_843F9D0,
    .anims = gUnknown_843FA0C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

const struct OamData gUnknown_843FA38 = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x64),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x64),
    .tileNum = 0x000,
    .priority = 3,
    .paletteNum = 0
};

const struct SpriteTemplate gUnknown_843FA40 = {
    .tileTag = 6,
    .paletteTag = 2,
    .oam = &gUnknown_843FA38,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

const struct OamData gUnknown_843FA58 = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x8),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x8),
    .tileNum = 0x000,
    .priority = 1,
    .paletteNum = 0
};

const struct OamData gUnknown_843FA60 = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0x000,
    .priority = 1,
    .paletteNum = 0
};

const union AnimCmd gUnknown_843FA68[] = {
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_843FA70[] = {
    ANIMCMD_FRAME(4, 0),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_843FA78[] = {
    gUnknown_843FA68,
    gUnknown_843FA70,
};

const struct SpriteTemplate gUnknown_843FA80 = {
    .tileTag = 3,
    .paletteTag = 2,
    .oam = &gUnknown_843FA58,
    .anims = gUnknown_843FA78,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

const struct SpriteTemplate gUnknown_843FA98 = {
    .tileTag = 2,
    .paletteTag = 2,
    .oam = &gUnknown_843FA60,
    .anims = gUnknown_843FA78,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

bool8 sub_80FFF80(void)
{
    if (!sub_8100BF4())
        return FALSE;
    else
        return TRUE;
}

bool8 sub_80FFF98(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        ResetBgsAndClearDma3BusyFlags(0);
        InitBgsFromTemplates(0, sEasyChatBgTemplates, NELEMS(sEasyChatBgTemplates));
        SetBgTilemapBuffer(3, gUnknown_203ACEC->unkB00);
        SetBgTilemapBuffer(1, gUnknown_203ACEC->unk300);
        InitWindows(sEasyChatWindowTemplates);
        DeactivateAllTextPrinters();
        sub_8100CBC();
        sub_8100C5C();
        CpuFastFill(0, (void *)VRAM + 0x1000000, 0x400);
        break;
    case 1:
        DecompressAndLoadBgGfxUsingHeap(3, gEasyChatWindow_Gfx, 0, 0, 0);
        CopyToBgTilemapBuffer(3, gEasyChatWindow_Tilemap, 0, 0);
        sub_8100F44();
        sub_8102428();
        CopyBgTilemapBufferToVram(3);
        break;
    case 2:
        sub_8101100(gUnknown_203ACEC->unk300);
        DecompressAndLoadBgGfxUsingHeap(1, gUnknown_843F7AC, 0, 0, 0);
        CopyBgTilemapBufferToVram(1);
        break;
    case 3:
        sub_8100D24();
        sub_8100E34();
        sub_8100FDC();
        sub_81012CC();
        break;
    case 4:
        sub_8101A90();
        sub_8101AC4();
        break;
    case 5:
        if (IsDma3ManagerBusyWithBgCopy())
        {
            return TRUE;
        }
        else
        {
            sub_8101A5C(0, 0, 0, 0);
            SetGpuReg(REG_OFFSET_WININ, WIN_RANGE(0, 63));
            SetGpuReg(REG_OFFSET_WINOUT, WIN_RANGE(0, 59));
            ShowBg(3);
            ShowBg(1);
            ShowBg(2);
            ShowBg(0);
            sub_81021D4();
            sub_8102320();
        }
        break;
    default:
        return FALSE;
    }

    gUnknown_203ACEC->unk0++;
    return TRUE;
}

void sub_810011C(void)
{
    if (gUnknown_203ACEC)
        Free(gUnknown_203ACEC);
}

void sub_8100134(u16 arg0)
{
    gUnknown_203ACEC->unk4 = arg0;
    gUnknown_203ACEC->unk0 = 0;
    sub_810014C();
}

bool8 sub_810014C(void)
{
    switch (gUnknown_203ACEC->unk4)
    {
    case 0:  return FALSE;
    case 1:  return sub_8100258();
    case 2:  return sub_8100290();
    case 3:  return sub_8100374();
    case 4:  return sub_8100430();
    case 5:  return sub_81003A8();
    case 6:  return sub_81003EC();
    case 7:  return sub_8100474();
    case 8:  return sub_81004B8();
    case 9:  return sub_81004F4();
    case 10: return sub_81005C0();
    case 11: return sub_81007D0();
    case 12: return sub_8100890();
    case 13: return sub_810093C();
    case 14: return sub_8100720();
    case 15: return sub_810072C();
    case 16: return sub_8100774();
    case 17: return sub_81009F8();
    case 18: return sub_8100A78();
    case 19: return sub_8100A04();
    case 20: return sub_8100B70();
    case 21: return sub_8100AE8();
    case 22: return sub_8100660();
    default: return FALSE;
    }
}

bool8 sub_8100258(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8100FDC();
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_8100290(void)
{
    u8 i;
    u16 *ecWordBuffer;
    u16 *ecWord;
    u8 frameId;
    u8 cursorColumn, cursorRow, numColumns;
    s16 var1;
    int stringWidth;
    int trueStringWidth;
    int var2;
    u8 str[64];

    ecWordBuffer = GetEasyChatWordBuffer();
    frameId = GetEasyChatScreenFrameId();
    cursorColumn = GetMainCursorColumn();
    cursorRow = GetMainCursorRow();
    numColumns = GetNumColumns();
    ecWord = &ecWordBuffer[cursorRow * numColumns];
    var1 = 8 * sPhraseFrameDimensions[frameId].left + 13;
    for (i = 0; i < cursorColumn; i++)
    {
        if (*ecWord == 0xFFFF)
        {
            stringWidth = GetStringWidth(1, gUnknown_843F8D8, 0) * 7;
        }
        else
        {
            CopyEasyChatWord(str, *ecWord);
            stringWidth = GetStringWidth(1, str, 0);
        }

        trueStringWidth = stringWidth + 17;
        var1 += trueStringWidth;
        ecWord++;
    }

    var2 = 8 * (sPhraseFrameDimensions[frameId].top + cursorRow * 2 + 1) + 1;
    sub_8101B58(var1, var2);
    return FALSE;
}

bool8 sub_8100374(void)
{
    u8 xOffset;
    switch (GetMainCursorColumn())
    {
    case 0:
        xOffset = 28;
        break;
    case 1:
        xOffset = 115;
        break;
    case 2:
        xOffset = 191;
        break;
    default:
        return FALSE;
    }
    sub_8101B58(xOffset, 97);
    return FALSE;
}

bool8 sub_81003A8(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101B88();
        sub_8100E7C(2);
        sub_8100F18(1);
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_81003EC(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101B88();
        sub_8100E7C(3);
        sub_8100F18(0);
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_8100430(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101B88();
        sub_8100E7C(1);
        sub_8100F18(1);
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_8100474(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101BA8();
        sub_8100E7C(0);
        ShowBg(0);
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_81004B8(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101BA8();
        sub_8100E7C(0);
        sub_8100FDC();
        gUnknown_203ACEC->unk0++;
        // Fall through
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_81004F4(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101B88();
        HideBg(0);
        sub_8101A5C(0, 0, 0, 0);
        sub_810131C();
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_81015D4(0);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy() && !sub_81016AC())
            gUnknown_203ACEC->unk0++;
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_8101FAC();
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 4:
        if (!sub_8102018())
        {
            sub_8101BC0();
            sub_81022E0(0);
            sub_810224C();
            gUnknown_203ACEC->unk0++;
            return FALSE;
        }
        break;
    default:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_81005C0(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101C48();
        sub_81020AC();
        sub_81022B0();
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        if (sub_81020D0() == TRUE)
            break;

        sub_81015D4(1);
        gUnknown_203ACEC->unk0++;
        // Fall through
    case 2:
        if (!sub_81016AC())
            gUnknown_203ACEC->unk0++;
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_8101BA8();
            ShowBg(0);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 4:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_8100660(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101C48();
        sub_81022B0();
        sub_810215C();
        sub_81015D4(5);
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        if (!sub_81016AC() && !sub_81021B8())
        {
            sub_810131C();
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_81015D4(6);
            sub_8102178();
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 3:
        if (!sub_81016AC() && !sub_81021B8())
        {
            sub_810224C();
            sub_8101BC0();
            gUnknown_203ACEC->unk0++;
            return FALSE;
        }
        break;
    case 4:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_8100720(void)
{
    sub_8101C80();
    return FALSE;
}

bool8 sub_810072C(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_81019B0(1, 2);
        gUnknown_203ACEC->unk0++;
        // Fall through
    case 1:
        if (!sub_8101A10())
        {
            sub_8101C80();
            sub_810224C();
            return FALSE;
        }
        break;
    }

    return TRUE;
}

bool8 sub_8100774(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_81019B0(-1, 2);
        gUnknown_203ACEC->unk0++;
        // Fall through
    case 1:
        if (!sub_8101A10())
        {
            sub_810224C();
            gUnknown_203ACEC->unk0++;
            return FALSE;
        }
        break;
    case 2:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_81007D0(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101C48();
        sub_81020AC();
        sub_81022B0();
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        if (!sub_81020D0())
        {
            sub_81015BC();
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_81015D4(2);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 3:
        if (!sub_81016AC())
        {
            sub_81012E0(2);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_8101E80();
            sub_81022E0(1);
            sub_810224C();
            sub_8102394();
            gUnknown_203ACEC->unk0++;
            return FALSE;
        }
        break;
    case 5:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_8100890(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8100FDC();
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        sub_8101F80();
        sub_81022B0();
        sub_81023F8();
        sub_81015BC();
        gUnknown_203ACEC->unk0++;
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_81015D4(3);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 3:
        if (!sub_81016AC())
        {
            ShowBg(0);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_8101BA8();
            gUnknown_203ACEC->unk0++;
            return FALSE;
        }
        break;
    case 5:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_810093C(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101F80();
        sub_81022B0();
        sub_81023F8();
        sub_81015BC();
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_81015D4(4);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 2:
        if (!sub_81016AC())
        {
            sub_810131C();
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_8101FAC();
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 4:
        if (!sub_8102018())
        {
            sub_8101BC0();
            sub_81022E0(0);
            sub_810224C();
            gUnknown_203ACEC->unk0++;
            return FALSE;
        }
        break;
    }

    return TRUE;
}

bool8 sub_81009F8(void)
{
    sub_8101F04();
    return FALSE;
}

bool8 sub_8100A04(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_81013EC();
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_81019B0(1, 2);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 2:
        if (!sub_8101A10())
        {
            sub_8101F04();
            sub_810224C();
            sub_8102394();
            gUnknown_203ACEC->unk0++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_8100A78(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101410();
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_81019B0(-1, 2);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 2:
        if (!sub_8101A10())
        {
            sub_810224C();
            sub_8102394();
            gUnknown_203ACEC->unk0++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_8100AE8(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101434();
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            s16 var0 = sub_80FFE48() - sub_8101A48();
            sub_81019B0(var0, 4);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 2:
        if (!sub_8101A10())
        {
            sub_8101F04();
            sub_810224C();
            sub_8102394();
            gUnknown_203ACEC->unk0++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_8100B70(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101478();
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            s16 var0 = sub_80FFE48() - sub_8101A48();
            sub_81019B0(var0, 4);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 2:
        if (!sub_8101A10())
        {
            sub_810224C();
            sub_8102394();
            gUnknown_203ACEC->unk0++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_8100BF4(void)
{
    gUnknown_203ACEC = Alloc(sizeof(*gUnknown_203ACEC));
    if (!gUnknown_203ACEC)
        return FALSE;

    gUnknown_203ACEC->unk0 = 0;
    gUnknown_203ACEC->unk2D8 = NULL;
    gUnknown_203ACEC->unk2DC = NULL;
    gUnknown_203ACEC->unk2E0 = NULL;
    gUnknown_203ACEC->unk2E4 = NULL;
    gUnknown_203ACEC->unk2E8 = NULL;
    gUnknown_203ACEC->unk2EC = NULL;
    gUnknown_203ACEC->unk2F0 = NULL;
    gUnknown_203ACEC->unk2F4 = NULL;
    gUnknown_203ACEC->unk2F8 = NULL;
    gUnknown_203ACEC->unk2FC = NULL;
    return TRUE;
}

void sub_8100C5C(void)
{
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON);
}

void sub_8100CBC(void)
{
    ResetPaletteFade();
    LoadPalette(gEasyChatMode_Pal, 0, 32);
    LoadPalette(gUnknown_843F76C,  1 * 16, 32);
    LoadPalette(gUnknown_843F78C,  4 * 16, 32);
    LoadPalette(gUnknown_843F874, 10 * 16, 8);
    LoadPalette(gUnknown_843F87C, 11 * 16, 10);
    LoadPalette(gUnknown_843F87C, 15 * 16, 10);
    LoadPalette(gUnknown_843F87C,  3 * 16, 10);
}

void sub_8100D24(void)
{
    int xOffset;
    const u8 *titleText = GetTitleText();
    if (!titleText)
        return;

    xOffset = (128 - GetStringWidth(1, titleText, 0)) / 2u;
    FillWindowPixelBuffer(0, PIXEL_FILL(0));
    sub_8100DC4(0, 1, titleText, xOffset, 0, TEXT_SPEED_FF, TEXT_COLOR_TRANSPARENT, TEXT_COLOR_DARK_GREY, TEXT_COLOR_LIGHT_GREY);
    PutWindowTilemap(0);
    CopyWindowToVram(0, 3);
}

void sub_8100D84(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 speed, void (*callback)(struct TextPrinterTemplate *, u16))
{
    if (fontId == 1) y += 2;
    AddTextPrinterParameterized(windowId, fontId, str, x, y, speed, callback);
}

void sub_8100DC4(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 speed, u8 bg, u8 fg, u8 shadow)
{
    u8 color[3];
    if (fontId == 1) y += 2;
    color[0] = bg;
    color[1] = fg;
    color[2] = shadow;
    AddTextPrinterParameterized3(windowId, fontId, x, y, color, speed, str);
}

void sub_8100E34(void)
{
    FillBgTilemapBufferRect(0, 0, 0, 0, 32, 20, 17);
    TextWindow_SetUserSelectedFrame(1, 1, 0xE0);
    DrawTextBorderOuter(1, 1, 14);
    sub_8100E7C(0);
    PutWindowTilemap(1);
    CopyBgTilemapBufferToVram(0);
}

void sub_8100E7C(u8 arg0)
{
    const u8 *text2 = NULL;
    const u8 *text1 = NULL;
    switch (arg0)
    {
    case 0:
        GetEasyChatInstructionsText(&text1, &text2);
        break;
    case 2:
        sub_80FFDC8(&text1, &text2);
        break;
    case 3:
        GetEasyChatConfirmText(&text1, &text2);
        break;
    case 1:
        GetEasyChatConfirmDeletionText(&text1, &text2);
        break;
    }

    FillWindowPixelBuffer(1, PIXEL_FILL(1));
    if (text1)
        sub_8100D84(1, 1, text1, 0, 0, TEXT_SPEED_FF, NULL);

    if (text2)
        sub_8100D84(1, 1, text2, 0, 16, TEXT_SPEED_FF, NULL);

    CopyWindowToVram(1, 3);
}

void sub_8100F18(u8 initialCursorPos)
{
    CreateYesNoMenu(&sEasyChatYesNoWindowTemplate, 1, 0, 2, 0x001, 14, initialCursorPos);
}

void sub_8100F44(void)
{
    u8 frameId;
    struct WindowTemplate template;

    frameId = GetEasyChatScreenFrameId();
    template.bg = 3;
    template.tilemapLeft = sPhraseFrameDimensions[frameId].left;
    template.tilemapTop = sPhraseFrameDimensions[frameId].top;
    template.width = sPhraseFrameDimensions[frameId].width;
    template.height = sPhraseFrameDimensions[frameId].height;
    template.paletteNum = 11;
    template.baseBlock = 0x060;
    gUnknown_203ACEC->windowId = AddWindow(&template);
    PutWindowTilemap(gUnknown_203ACEC->windowId);
}

void sub_8100FDC(void)
{
    u16 *ecWord;
    u8 numColumns, numRows;
    u8 *str;
    u8 frameId;
    int i, j, k;

    ecWord = GetEasyChatWordBuffer();
    numColumns = GetNumColumns();
    numRows = GetNumRows();
    frameId = GetEasyChatScreenFrameId();
    FillWindowPixelBuffer(gUnknown_203ACEC->windowId, PIXEL_FILL(1));
    for (i = 0; i < numRows; i++)
    {
        str = gUnknown_203ACEC->unkA;
        str[0] = EOS;
        str = StringAppend(str, sText_Clear17);
        for (j = 0; j < numColumns; j++)
        {
            if (*ecWord != 0xFFFF)
            {
                str = CopyEasyChatWord(str, *ecWord);
                ecWord++;
            }
            else
            {
                str = WriteColorChangeControlCode(str, 0, TEXT_COLOR_RED);
                ecWord++;
                for (k = 0; k < 7; k++)
                {
                    *str++ = CHAR_EXTRA_EMOJI;
                    *str++ = 9;
                }

                str = WriteColorChangeControlCode(str, 0, TEXT_COLOR_DARK_GREY);
            }

            str = StringAppend(str, sText_Clear17);
            if (frameId == 2)
            {
                if (j == 0 && i == 4)
                    break;
            }
        }

        *str = EOS;
        sub_8100D84(gUnknown_203ACEC->windowId, 1, gUnknown_203ACEC->unkA, 0, i * 16, TEXT_SPEED_FF, NULL);
    }

    CopyWindowToVram(gUnknown_203ACEC->windowId, 3);
}

void sub_8101100(u16 *tilemap)
{
    u8 frameId;
    int right, bottom;
    int x, y;

    frameId = GetEasyChatScreenFrameId();
    CpuFastFill(0, tilemap, BG_SCREEN_SIZE);
    if (frameId == 2)
    {
        right = sPhraseFrameDimensions[frameId].left + sPhraseFrameDimensions[frameId].width;
        bottom = sPhraseFrameDimensions[frameId].top + sPhraseFrameDimensions[frameId].height;
        for (y = sPhraseFrameDimensions[frameId].top; y < bottom; y++)
        {
            x = sPhraseFrameDimensions[frameId].left - 1;
            tilemap[y * 32 + x] = 0x1005;
            x++;
            for (; x < right; x++)
                tilemap[y * 32 + x] = 0x1000;

            tilemap[y* 32 + x] = 0x1007;
        }
    }
    else
    {
        y = sPhraseFrameDimensions[frameId].top - 1;
        x = sPhraseFrameDimensions[frameId].left - 1;
        right = sPhraseFrameDimensions[frameId].left + sPhraseFrameDimensions[frameId].width;
        bottom = sPhraseFrameDimensions[frameId].top + sPhraseFrameDimensions[frameId].height;
        tilemap[y * 32 + x] = 0x1001;
        x++;
        for (; x < right; x++)
            tilemap[y * 32 + x] = 0x1002;

        tilemap[y * 32 + x] = 0x1003;
        y++;
        for (; y < bottom; y++)
        {
            x = sPhraseFrameDimensions[frameId].left - 1;
            tilemap[y * 32 + x] = 0x1005;
            x++;
            for (; x < right; x++)
                tilemap[y * 32 + x] = 0x1000;

            tilemap[y* 32 + x] = 0x1007;
        }

        x = sPhraseFrameDimensions[frameId].left - 1;
        tilemap[y * 32 + x] = 0x1009;
        x++;
        for (; x < right; x++)
            tilemap[y * 32 + x] = 0x100A;

        tilemap[y * 32 + x] = 0x100B;
    }
}

void sub_81012CC(void)
{
    PutWindowTilemap(2);
    CopyBgTilemapBufferToVram(2);
}

void sub_81012E0(u32 arg0)
{
    sub_810198C();
    FillWindowPixelBuffer(2, PIXEL_FILL(1));
    switch (arg0)
    {
    case 0:
        sub_810133C();
        break;
    case 1:
        PrintEasyChatKeyboardText();
        break;
    case 2:
        sub_81013DC();
        break;
    }

    CopyWindowToVram(2, 2);
}

void sub_810131C(void)
{
    if (!sub_80FFE1C())
        sub_81012E0(0);
    else
        sub_81012E0(1);
}

void sub_810133C(void)
{
    int i;
    int x, y;

    i = 0;
    y = 96;
    while (1)
    {
        for (x = 0; x < 2; x++)
        {
            u8 groupId = GetSelectedGroupByIndex(i++);
            if (groupId == EC_NUM_GROUPS)
            {
                sub_81019B0(sub_80FFE28(), 0);
                return;
            }

            sub_8100D84(2, 1, GetEasyChatWordGroupName(groupId), x * 84 + 10, y, TEXT_SPEED_FF, NULL);
        }

        y += 16;
    }
}

void PrintEasyChatKeyboardText(void)
{
    u32 i;

    for (i = 0; i < NELEMS(sEasyChatKeyboardText); i++)
        sub_8100D84(2, 1, sEasyChatKeyboardText[i], 10, 96 + i * 16, TEXT_SPEED_FF, NULL);
}

void sub_81013DC(void)
{
    sub_81014AC(0, 4);
}

void sub_81013EC(void)
{
    u8 var0 = sub_80FFE48() + 3;
    sub_8101558(var0, 1);
    sub_81014AC(var0, 1);
}

void sub_8101410(void)
{
    u8 var0 = sub_80FFE48();
    sub_8101558(var0, 1);
    sub_81014AC(var0, 1);
}

void sub_8101434(void)
{
    u8 var0 = sub_80FFE48();
    u8 var1 = var0 + 4;
    u8 var2 = sub_80FFE54() + 1;
    if (var1 > var2)
        var1 = var2;

    if (var0 < var1)
    {
        u8 var3 = var1 - var0;
        sub_8101558(var0, var3);
        sub_81014AC(var0, var3);
    }
}

void sub_8101478(void)
{
    u8 var0 = sub_80FFE48();
    u8 var1 = sub_8101A48();
    if (var0 < var1)
    {
        u8 var2 = var1 - var0;
        sub_8101558(var0, var2);
        sub_81014AC(var0, var2);
    }
}

void sub_81014AC(u8 arg0, u8 arg1)
{
    int i, j;
    u16 easyChatWord;
    u8 *str;
    int y;
    u8 y_;
    int var0;

    var0 = arg0 * 2;
    y = (arg0 * 16 + 96) & 0xFF;

    for (i = 0; i < arg1; i++)
    {
        for (j = 0; j < 2; j++)
        {
            // FIXME: Dumb trick needed to match
            y_ = y << 18 >> 18;
            easyChatWord = GetDisplayedWordByIndex(var0++);
            if (easyChatWord != 0xFFFF)
            {

                CopyEasyChatWordPadded(gUnknown_203ACEC->unkCC, easyChatWord, 0);

                sub_8100D84(2, 1, gUnknown_203ACEC->unkCC, (j * 13 + 3) * 8, y_, TEXT_SPEED_FF, NULL);
            }
        }
        y += 16;

    }

    CopyWindowToVram(2, 2);
}

void sub_8101558(u8 arg0, u8 arg1)
{
    int y;
    int var0;
    int var1;
    int var2;

    y = (arg0 * 16 + 96) & 0xFF;
    var2 = arg1 * 16;
    var0 = y + var2;
    if (var0 > 255)
    {
        var1 = var0 - 256;
        var2 = 256 - y;
    }
    else
    {
        var1 = 0;
    }

    FillWindowPixelRect(2, PIXEL_FILL(1), 0, y, 224, var2);
    if (var1)
        FillWindowPixelRect(2, PIXEL_FILL(1), 0, 0, 224, var1);
}

void sub_81015BC(void)
{
    FillWindowPixelBuffer(2, PIXEL_FILL(1));
    CopyWindowToVram(2, 2);
}

void sub_81015D4(int arg0)
{
    switch (arg0)
    {
    case 0:
        gUnknown_203ACEC->unk6 = 0;
        gUnknown_203ACEC->unk7 = 10;
        break;
    case 1:
        gUnknown_203ACEC->unk6 = 9;
        gUnknown_203ACEC->unk7 = 0;
        break;
    case 2:
        gUnknown_203ACEC->unk6 = 11;
        gUnknown_203ACEC->unk7 = 17;
        break;
    case 3:
        gUnknown_203ACEC->unk6 = 17;
        gUnknown_203ACEC->unk7 = 0;
        break;
    case 4:
        gUnknown_203ACEC->unk6 = 17;
        gUnknown_203ACEC->unk7 = 10;
        break;
    case 5:
        gUnknown_203ACEC->unk6 = 18;
        gUnknown_203ACEC->unk7 = 22;
        break;
    case 6:
        gUnknown_203ACEC->unk6 = 22;
        gUnknown_203ACEC->unk7 = 18;
        break;
    }

    gUnknown_203ACEC->unk8 = gUnknown_203ACEC->unk6 < gUnknown_203ACEC->unk7 ? 1 : -1;
}

bool8 sub_81016AC(void)
{
    u8 var0, var1;
    if (gUnknown_203ACEC->unk6 == gUnknown_203ACEC->unk7)
        return FALSE;

    gUnknown_203ACEC->unk6 += gUnknown_203ACEC->unk8;
    sub_81016E4(gUnknown_203ACEC->unk6);
    var0 = gUnknown_203ACEC->unk6;
    var1 = gUnknown_203ACEC->unk7;
    return (var0 ^ var1) > 0;
}

void sub_81016E4(u8 arg0)
{
    FillBgTilemapBufferRect_Palette0(1, 0, 0, 10, 30, 10);
    switch (arg0)
    {
    case 0:
        break;
    case 1:
        sub_8101830(11, 14, 3, 2);
        break;
    case 2:
        sub_8101830(9, 14, 7, 2);
        break;
    case 3:
        sub_8101830(7, 14, 11, 2);
        break;
    case 4:
        sub_8101830(5, 14, 15, 2);
        break;
    case 5:
        sub_8101830(3, 14, 19, 2);
        break;
    case 6:
        sub_8101830(1, 14, 23, 2);
        break;
    case 11:
        sub_8101830(1, 10, 24, 10);
        break;
    case 12:
        sub_8101830(1, 10, 25, 10);
        break;
    case 13:
        sub_8101830(1, 10, 26, 10);
        break;
    case 14:
        sub_8101830(1, 10, 27, 10);
        break;
    case 15:
        sub_8101830(1, 10, 28, 10);
        break;
    case 16:
        sub_8101830(1, 10, 29, 10);
        break;
    case 17:
        sub_8101830(0, 10, 30, 10);
        break;
    case 10:
    case 18:
        sub_8101830(1, 10, 23, 10);
        break;
    case 9:
    case 19:
        sub_8101830(1, 11, 23, 8);
        break;
    case 8:
    case 20:
        sub_8101830(1, 12, 23, 6);
        break;
    case 7:
    case 21:
        sub_8101830(1, 13, 23, 4);
        break;
    case 22:
        sub_8101830(1, 14, 23, 2);
        break;
    }

    CopyBgTilemapBufferToVram(1);
}

void sub_8101830(int left, int top, int width, int height)
{
    u16 *tilemap;
    int right;
    int bottom;
    int x, y;

    tilemap = gUnknown_203ACEC->unk300;
    right = left + width - 1;
    bottom = top + height - 1;
    x = left;
    y = top;
    tilemap[y * 32 + x] = 0x4001;
    x++;
    for (; x < right; x++)
        tilemap[y * 32 + x] = 0x4002;

    tilemap[y * 32 + x] = 0x4003;
    y++;
    for (; y < bottom; y++)
    {
        tilemap[y * 32 + left] = 0x4005;
        x = left + 1;
        for (; x < right; x++)
            tilemap[y * 32 + x] = 0x4000;

        tilemap[y * 32 + x] = 0x4007;
    }

    tilemap[y * 32 + left] = 0x4009;
    x = left + 1;
    for (; x < right; x++)
        tilemap[y * 32 + x] = 0x400A;

    tilemap[y * 32 + x] = 0x400B;
    sub_8101A5C((left + 1) * 8, (top + 1) * 8, (width - 2) * 8, (height - 2) * 8);
}

void sub_810198C(void)
{
    ChangeBgY(2, 0x800, 0);
    gUnknown_203ACEC->unk2CE = 0;
}

void sub_81019B0(s16 arg0, u8 arg1)
{
    int bgY;
    s16 var0;

    bgY = GetBgY(2);
    gUnknown_203ACEC->unk2CE += arg0;
    var0 = arg0 * 16;
    bgY += var0 << 8;
    if (arg1)
    {
        gUnknown_203ACEC->unk2D0 = bgY;
        gUnknown_203ACEC->unk2D4 = arg1 * 256;
        if (var0 < 0)
            gUnknown_203ACEC->unk2D4 = -gUnknown_203ACEC->unk2D4;
    }
    else
    {
        ChangeBgY(2, bgY, 0);
    }
}

bool8 sub_8101A10(void)
{
    int bgY;

    bgY = GetBgY(2);
    if (bgY == gUnknown_203ACEC->unk2D0)
    {
        return FALSE;
    }
    else
    {
        ChangeBgY(2, gUnknown_203ACEC->unk2D4, 1);
        return TRUE;
    }
}

int sub_8101A48(void)
{
    return gUnknown_203ACEC->unk2CE;
}

void sub_8101A5C(u8 left, u8 top, u8 width, u8 height)
{
    u16 horizontalDimensions = WIN_RANGE(left, left + width);
    u16 verticalDimensions = WIN_RANGE(top, top + height);
    SetGpuReg(REG_OFFSET_WIN0H, horizontalDimensions);
    SetGpuReg(REG_OFFSET_WIN0V, verticalDimensions);
}

void sub_8101A90(void)
{
    u32 i;

    LoadSpriteSheets(sEasyChatSpriteSheets);
    LoadSpritePalettes(sEasyChatSpritePalettes);
    for (i = 0; i < NELEMS(gUnknown_843F938); i++)
        LoadCompressedSpriteSheet(&gUnknown_843F938[i]);
}

void sub_8101AC4(void)
{
    u8 frameId = GetEasyChatScreenFrameId();
    s16 x = sPhraseFrameDimensions[frameId].left * 8 + 13;
    s16 y = (sPhraseFrameDimensions[frameId].top + 1) * 8 + 1;
    u8 spriteId = CreateSprite(&gUnknown_843F968, x, y, 2);
    gUnknown_203ACEC->unk2D8 = &gSprites[spriteId];
    gSprites[spriteId].data[1] = 1;
}

void sub_8101B20(struct Sprite *sprite)
{
    if (sprite->data[1])
    {
        if (++sprite->data[0] > 2)
        {
            sprite->data[0] = 0;
            if (++sprite->pos2.x > 0)
                sprite->pos2.x = -6;
        }
    }
}

void sub_8101B58(u8 x, u8 y)
{
    gUnknown_203ACEC->unk2D8->pos1.x = x;
    gUnknown_203ACEC->unk2D8->pos1.y = y;
    gUnknown_203ACEC->unk2D8->pos2.x = 0;
    gUnknown_203ACEC->unk2D8->data[0] = 0;
}

void sub_8101B88(void)
{
    gUnknown_203ACEC->unk2D8->data[0] = 0;
    gUnknown_203ACEC->unk2D8->data[1] = 0;
    gUnknown_203ACEC->unk2D8->pos2.x = 0;
}

void sub_8101BA8(void)
{
    gUnknown_203ACEC->unk2D8->data[1] = 1;
}

void sub_8101BC0(void)
{
    u8 spriteId = CreateSprite(&gUnknown_843F9B8, 0, 0, 3);
    gUnknown_203ACEC->unk2DC = &gSprites[spriteId];
    gUnknown_203ACEC->unk2DC->pos2.x = 32;

    spriteId = CreateSprite(&gUnknown_843F9B8, 0, 0, 3);
    gUnknown_203ACEC->unk2E0 = &gSprites[spriteId];
    gUnknown_203ACEC->unk2E0->pos2.x = -32;

    gUnknown_203ACEC->unk2DC->hFlip = 1;
    sub_8101C80();
}

void sub_8101C48(void)
{
    DestroySprite(gUnknown_203ACEC->unk2DC);
    gUnknown_203ACEC->unk2DC = NULL;
    DestroySprite(gUnknown_203ACEC->unk2E0);
    gUnknown_203ACEC->unk2E0 = NULL;
}

void sub_8101C80(void)
{
    u8 var0;
    u8 var1;

    if (gUnknown_203ACEC->unk2DC && gUnknown_203ACEC->unk2E0)
    {
        sub_80FFE08(&var0, &var1);
        if (!sub_80FFE1C())
            sub_8101CE4(var0, var1);
        else
            sub_8101D9C(var0, var1);
    }
}

void sub_8101CE4(s8 arg0, s8 arg1)
{
    if (arg0 != -1)
    {
        StartSpriteAnim(gUnknown_203ACEC->unk2DC, 0);
        gUnknown_203ACEC->unk2DC->pos1.x = arg0 * 84 + 58;
        gUnknown_203ACEC->unk2DC->pos1.y = arg1 * 16 + 96;

        StartSpriteAnim(gUnknown_203ACEC->unk2E0, 0);
        gUnknown_203ACEC->unk2E0->pos1.x = arg0 * 84 + 58;
        gUnknown_203ACEC->unk2E0->pos1.y = arg1 * 16 + 96;
    }
    else
    {
        StartSpriteAnim(gUnknown_203ACEC->unk2DC, 1);
        gUnknown_203ACEC->unk2DC->pos1.x = 216;
        gUnknown_203ACEC->unk2DC->pos1.y = arg1 * 16 + 112;

        StartSpriteAnim(gUnknown_203ACEC->unk2E0, 1);
        gUnknown_203ACEC->unk2E0->pos1.x = 216;
        gUnknown_203ACEC->unk2E0->pos1.y = arg1 * 16 + 112;
    }
}

void sub_8101D9C(s8 arg0, s8 arg1)
{
    int anim;
    int x, y;

    if (arg0 != -1)
    {
        y = arg1 * 16 + 96;
        x = 32;
        if (arg0 == 6 && arg1 == 0)
        {
            x = 157;
            anim = 2;
        }
        else
        {
            x += gUnknown_843F958[arg0 < NELEMS(gUnknown_843F958) ? arg0 : 0];
            anim = 3;
        }

        StartSpriteAnim(gUnknown_203ACEC->unk2DC, anim);
        gUnknown_203ACEC->unk2DC->pos1.x = x;
        gUnknown_203ACEC->unk2DC->pos1.y = y;

        StartSpriteAnim(gUnknown_203ACEC->unk2E0, anim);
        gUnknown_203ACEC->unk2E0->pos1.x = x;
        gUnknown_203ACEC->unk2E0->pos1.y = y;
    }
    else
    {
        StartSpriteAnim(gUnknown_203ACEC->unk2DC, 1);
        gUnknown_203ACEC->unk2DC->pos1.x = 216;
        gUnknown_203ACEC->unk2DC->pos1.y = arg1 * 16 + 112;

        StartSpriteAnim(gUnknown_203ACEC->unk2E0, 1);
        gUnknown_203ACEC->unk2E0->pos1.x = 216;
        gUnknown_203ACEC->unk2E0->pos1.y = arg1 * 16 + 112;
    }
}

void sub_8101E80(void)
{
    u8 spriteId = CreateSprite(&gUnknown_843F968, 0, 0, 4);
    gUnknown_203ACEC->unk2E4 = &gSprites[spriteId];
    gUnknown_203ACEC->unk2E4->callback = sub_8101ED4;
    gUnknown_203ACEC->unk2E4->oam.priority = 2;
    sub_8101F04();
}

void sub_8101ED4(struct Sprite *sprite)
{
    if (++sprite->data[0] > 2)
    {
        sprite->data[0] = 0;
        if (++sprite->pos2.x > 0)
            sprite->pos2.x = -6;
    }
}

void sub_8101F04(void)
{
    s8 var0, var1;
    u8 x, y;

    sub_80FFE34(&var0, &var1);
    x = var0 * 13 + 3;
    y = var1 * 2 + 11;
    sub_8101F40(x, y);
}

void sub_8101F40(u8 x, u8 y)
{
    if (gUnknown_203ACEC->unk2E4)
    {
        gUnknown_203ACEC->unk2E4->pos1.x = x * 8 + 4;
        gUnknown_203ACEC->unk2E4->pos1.y = (y + 1) * 8 + 1;
        gUnknown_203ACEC->unk2E4->pos2.x = 0;
        gUnknown_203ACEC->unk2E4->data[0] = 0;
    }
}

void sub_8101F80(void)
{
    if (gUnknown_203ACEC->unk2E4)
    {
        DestroySprite(gUnknown_203ACEC->unk2E4);
        gUnknown_203ACEC->unk2E4 = NULL;
    }
}

void sub_8101FAC(void)
{
    u8 spriteId = CreateSprite(&gUnknown_843FA40, 208, 128, 6);
    gUnknown_203ACEC->unk2E8 = &gSprites[spriteId];
    gUnknown_203ACEC->unk2E8->pos2.x = -64;

    spriteId = CreateSprite(&gUnknown_843FA20, 208, 80, 5);
    gUnknown_203ACEC->unk2EC = &gSprites[spriteId];
    gUnknown_203ACEC->unk9 = 0;
}

bool8 sub_8102018(void)
{
    switch (gUnknown_203ACEC->unk9)
    {
    default:
        return FALSE;
    case 0:
        gUnknown_203ACEC->unk2E8->pos2.x += 8;
        if (gUnknown_203ACEC->unk2E8->pos2.x >= 0)
        {
            gUnknown_203ACEC->unk2E8->pos2.x = 0;
            if (!sub_80FFE1C())
                StartSpriteAnim(gUnknown_203ACEC->unk2EC, 1);
            else
                StartSpriteAnim(gUnknown_203ACEC->unk2EC, 2);

            gUnknown_203ACEC->unk9++;
        }
        break;
    case 1:
        if (gUnknown_203ACEC->unk2EC->animEnded)
        {
            gUnknown_203ACEC->unk9 = 2;
            return FALSE;
        }
    }

    return TRUE;
}

void sub_81020AC(void)
{
    gUnknown_203ACEC->unk9 = 0;
    StartSpriteAnim(gUnknown_203ACEC->unk2EC, 3);
}

bool8 sub_81020D0(void)
{
    switch (gUnknown_203ACEC->unk9)
    {
    default:
        return FALSE;
    case 0:
        if (gUnknown_203ACEC->unk2EC->animEnded)
            gUnknown_203ACEC->unk9 = 1;
        break;
    case 1:
        gUnknown_203ACEC->unk2E8->pos2.x -= 8;
        if (gUnknown_203ACEC->unk2E8->pos2.x <= -64)
        {
            DestroySprite(gUnknown_203ACEC->unk2EC);
            DestroySprite(gUnknown_203ACEC->unk2E8);
            gUnknown_203ACEC->unk2EC = NULL;
            gUnknown_203ACEC->unk2E8 = NULL;
            gUnknown_203ACEC->unk9++;
            return FALSE;
        }
    }

    return TRUE;
}

void sub_810215C(void)
{
    StartSpriteAnim(gUnknown_203ACEC->unk2EC, 4);
}

void sub_8102178(void)
{
    if (!sub_80FFE1C())
        StartSpriteAnim(gUnknown_203ACEC->unk2EC, 1);
    else
        StartSpriteAnim(gUnknown_203ACEC->unk2EC, 2);
}

bool8 sub_81021B8(void)
{
    return !gUnknown_203ACEC->unk2EC->animEnded;
}

void sub_81021D4(void)
{
    u8 spriteId = CreateSprite(&gUnknown_843FA98, 96, 80, 0);
    if (spriteId != MAX_SPRITES)
        gUnknown_203ACEC->unk2F0 = &gSprites[spriteId];

    spriteId = CreateSprite(&gUnknown_843FA98, 96, 156, 0);
    if (spriteId != MAX_SPRITES)
    {
        gUnknown_203ACEC->unk2F4 = &gSprites[spriteId];
        gUnknown_203ACEC->unk2F4->vFlip = 1;
    }

    sub_81022B0();
}

void sub_810224C(void)
{
    gUnknown_203ACEC->unk2F0->invisible = !sub_80FFE64();
    gUnknown_203ACEC->unk2F4->invisible = !sub_80FFE98();
}

void sub_81022B0(void)
{
    gUnknown_203ACEC->unk2F0->invisible = TRUE;
    gUnknown_203ACEC->unk2F4->invisible = TRUE;
}

void sub_81022E0(int arg0)
{
    if (!arg0)
    {
        gUnknown_203ACEC->unk2F0->pos1.x = 96;
        gUnknown_203ACEC->unk2F4->pos1.x = 96;
    }
    else
    {
        gUnknown_203ACEC->unk2F0->pos1.x = 120;
        gUnknown_203ACEC->unk2F4->pos1.x = 120;
    }
}

void sub_8102320(void)
{
    u8 spriteId = CreateSprite(&gUnknown_843FA80, 220, 84, 1);
    if (spriteId != MAX_SPRITES)
        gUnknown_203ACEC->unk2F8 = &gSprites[spriteId];

    spriteId = CreateSprite(&gUnknown_843FA80, 220, 156, 1);
    if (spriteId != MAX_SPRITES)
    {
        gUnknown_203ACEC->unk2FC = &gSprites[spriteId];
        StartSpriteAnim(gUnknown_203ACEC->unk2FC, 1);
    }

    sub_81023F8();
}

void sub_8102394(void)
{
    gUnknown_203ACEC->unk2F8->invisible = !sub_80FFE64();
    gUnknown_203ACEC->unk2FC->invisible = !sub_80FFE98();
}

void sub_81023F8(void)
{
    gUnknown_203ACEC->unk2F8->invisible = TRUE;
    gUnknown_203ACEC->unk2FC->invisible = TRUE;
}

void sub_8102428(void)
{
    u16 windowId;
    struct WindowTemplate template;
    template.bg = 3;
    template.tilemapLeft = 4;
    template.tilemapTop = 11;
    template.width = 24;
    template.height = 2;
    template.paletteNum = 11;
    template.baseBlock = 0x030;
    windowId = AddWindow(&template);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    sub_8100D84(windowId, 1, gUnknown_841EE2B, 0, 0, 0, NULL);
    PutWindowTilemap(windowId);
}
