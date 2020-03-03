#include "global.h"
#include "gflib.h"
#include "battle_anim.h"
#include "berry_crush.h"
#include "decompress.h"
#include "digit_obj_util.h"
#include "graphics.h"
#include "item_menu_icons.h"
#include "link.h"
#include "link_rfu.h"
#include "math_util.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "scanline_effect.h"
#include "script.h"
#include "strings.h"
#include "text_window.h"
#include "trig.h"
#include "constants/items.h"
#include "constants/songs.h"

static void sub_814DEC0(struct BerryCrushGame_138 * arg0, u16 arg1);
static void sub_814DF44(u8 windowId, u8 left, u8 colorId, const u8 *string);
static void sub_814DFA4(struct BerryCrushGame * sp0C, u8 sp10, u8 sp14, u8 r3);
static void sub_814E32C(struct BerryCrushGame * r8);
static void Task_ShowBerryCrushRankings(u8 r4);
static void sub_814EAD4(struct BerryCrushGame_138 * r4, u16 r1);
static void sub_814EB38(struct BerryCrushGame * r5);
static void sub_814EBB0(struct BerryCrushGame * r6);
static void sub_814EC80(struct BerryCrushGame * r6);
static void sub_814ECE0(struct BerryCrushGame * r6);
static void sub_814EF10(struct BerryCrushGame * r5);
static void sub_814EFD0(struct Sprite * sprite);
static void sub_814EFFC(struct Sprite * sprite);
static void sub_814F044(struct Sprite * sprite);
static void sub_814F0D8(struct Sprite * sprite);

static const struct BgTemplate gUnknown_846E3CC[] = {
    {
        .bg = 0,
        .charBaseIndex = 2,
        .mapBaseIndex = 15,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x0000
    }, {
        .bg = 1,
        .charBaseIndex = 0,
        .mapBaseIndex = 13,
        .screenSize = 2,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x0000
    }, {
        .bg = 2,
        .charBaseIndex = 0,
        .mapBaseIndex = 12,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x0000
    }, {
        .bg = 3,
        .charBaseIndex = 0,
        .mapBaseIndex = 11,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x0000
    }
};

static const u8 sBerryCrushTextColorTable[][3] = {
    {
        TEXT_COLOR_WHITE,
        TEXT_COLOR_DARK_GREY,
        TEXT_COLOR_LIGHT_GREY
    }, {
        TEXT_COLOR_TRANSPARENT,
        TEXT_COLOR_WHITE,
        TEXT_COLOR_DARK_GREY
    }, {
        TEXT_COLOR_TRANSPARENT,
        TEXT_COLOR_LIGHT_GREY,
        TEXT_COLOR_RED
    }, {
        TEXT_COLOR_WHITE,
        TEXT_COLOR_BLUE,
        TEXT_COLOR_LIGHT_BLUE
    }, {
        TEXT_COLOR_WHITE,
        TEXT_COLOR_GREEN,
        TEXT_COLOR_LIGHT_GREEN
    }, {
        TEXT_COLOR_WHITE,
        TEXT_COLOR_RED,
        TEXT_COLOR_LIGHT_RED
    }
};

static const struct WindowTemplate gUnknown_846E3F0 = {
    .bg = 0,
    .tilemapLeft = 3,
    .tilemapTop = 4,
    .width = 24,
    .height = 13,
    .paletteNum = 0xF,
    .baseBlock = 0x001
};

static const struct WindowTemplate gUnknown_846E3F8[] = {
    {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 0,
        .width = 9,
        .height = 2,
        .paletteNum = 0x8,
        .baseBlock = 0x3ed
    }, {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 3,
        .width = 9,
        .height = 2,
        .paletteNum = 0x8,
        .baseBlock = 0x3db
    }, {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 6,
        .width = 9,
        .height = 2,
        .paletteNum = 0x8,
        .baseBlock = 0x3c9
    }, {
        .bg = 0,
        .tilemapLeft = 21,
        .tilemapTop = 3,
        .width = 9,
        .height = 2,
        .paletteNum = 0x8,
        .baseBlock = 0x3b7
    }, {
        .bg = 0,
        .tilemapLeft = 21,
        .tilemapTop = 6,
        .width = 9,
        .height = 2,
        .paletteNum = 0x8,
        .baseBlock = 0x3a5
    }, DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate gUnknown_846E428[] = {
    {
        .bg = 0,
        .tilemapLeft = 4,
        .tilemapTop = 2,
        .width = 22,
        .height = 16,
        .paletteNum = 0xF,
	    .baseBlock = 0x001
    }, {
        .bg = 0,
        .tilemapLeft = 4,
        .tilemapTop = 2,
        .width = 22,
        .height = 16,
        .paletteNum = 0xF,
	    .baseBlock = 0x001
    }, {
        .bg = 0,
        .tilemapLeft = 3,
        .tilemapTop = 2,
        .width = 24,
        .height = 16,
        .paletteNum = 0xF,
	    .baseBlock = 0x001
    }, DUMMY_WIN_TEMPLATE
};

static const u8 gUnknown_846E448[][4] = {
    {  6,  8,  9, 11 },
    { 12, 14, 15, 16}
};

static const u32 gUnknown_846E450[] = {
    50000000, 
    25000000, 
    12500000, 
     6250000, 
     3125000, 
     1562500, 
      781250, 
      390625
};

static const u16 gUnknown_846E470[] = INCBIN_U16("graphics/link_games/unk_846E4D0.gbapal");
static const u16 gUnknown_846E490[] = INCBIN_U16("graphics/link_games/unk_846E7FC.gbapal");
static const u16 gUnknown_846E4B0[] = INCBIN_U16("graphics/link_games/unk_846ECC4.gbapal");

static const u32 gUnknown_846E4D0[] = INCBIN_U32("graphics/link_games/unk_846E4D0.4bpp.lz");
static const u32 gUnknown_846E7FC[] = INCBIN_U32("graphics/link_games/unk_846E7FC.4bpp.lz");
static const u32 gUnknown_846EB78[] = INCBIN_U32("graphics/link_games/unk_846EB78.4bpp.lz");
static const u32 gUnknown_846ECC4[] = INCBIN_U32("graphics/link_games/unk_846ECC4.4bpp.lz");

static const u32 gBerryCrushGrinderTopTilemap[] = INCBIN_U32("graphics/link_games/unk_846ED90.bin.lz");
static const u32 gBerryCrushContainerCapTilemap[] = INCBIN_U32("graphics/link_games/unk_846EEC0.bin.lz");
static const u32 gBerryCrushBackgroundTilemap[] = INCBIN_U32("graphics/link_games/unk_846F058.bin.lz");

static const u8 gUnknown_846F280[][5] = {
    {1, 3},
    {0, 1, 3},
    {1, 3, 2, 4},
    {0, 1, 3, 2, 4}
};

static const struct BerryCrushGame_138_C gUnknown_846F294[] = {
    {0x00, 0x00, 0x00, 0x0000, 0xfff0, 0x0000, 0x0000},
    {0x01, 0x00, 0x03, 0xffe4, 0xfffc, 0xffe8, 0x0010},
    {0x02, 0x00, 0x06, 0xfff0, 0x0014, 0xfff8, 0x0010},
    {0x03, 0x14, 0x03, 0x001c, 0xfffc, 0x0020, 0xfff8},
    {0x04, 0x14, 0x06, 0x0010, 0x0014, 0x0010, 0xfff8}
};

static const s8 gUnknown_846F2D0[][2] = {
    {0x00, 0x00},
    {0xff, 0x00},
    {0x01, 0x01}
};

static const s8 gUnknown_846F2D6[][2] = {
    {0x00, 0x00},
    {0xf0, 0xfc},
    {0x10, 0xfc},
    {0xf8, 0xfe},
    {0x08, 0xfe},
    {0xe8, 0xf8},
    {0x18, 0xf8},
    {0xe0, 0xf4},
    {0x20, 0xf4},
    {0xd8, 0xf0},
    {0x28, 0xf0}
};

static const u16 gUnknown_846F2EC[] = {
    5, 6, 7, 8, 9
};

static const struct CompressedSpriteSheet gUnknown_846F2F8[] = {
    {gUnknown_846E4D0, 0x0800, 1},
    {gUnknown_846E7FC, 0x0e00, 2},
    {gUnknown_846EB78, 0x0700, 3},
    {gUnknown_846ECC4, 0x02c0, 4},
    {}
};

static const struct SpritePalette gUnknown_846F320[] = {
    {gUnknown_846E470, 1},
    {gUnknown_846E490, 2},
    {gUnknown_846E4B0, 4},
    {}
};

static const union AnimCmd gUnknown_846F340[] = {
    ANIMCMD_FRAME(0x00, 0),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846F348[] = {
    ANIMCMD_FRAME(0x00, 4),
    ANIMCMD_FRAME(0x10, 4),
    ANIMCMD_FRAME(0x20, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846F358[] = {
    ANIMCMD_FRAME(0x30, 2),
    ANIMCMD_FRAME(0x40, 2),
    ANIMCMD_FRAME(0x50, 2),
    ANIMCMD_FRAME(0x60, 2),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846F36C[] = {
    ANIMCMD_FRAME(0x00, 2),
    ANIMCMD_FRAME(0x04, 2),
    ANIMCMD_FRAME(0x08, 2),
    ANIMCMD_FRAME(0x0c, 2),
    ANIMCMD_FRAME(0x10, 2),
    ANIMCMD_FRAME(0x14, 2),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd gUnknown_846F388[] = {
    ANIMCMD_FRAME(0x18, 4),
    ANIMCMD_FRAME(0x1c, 4),
    ANIMCMD_FRAME(0x20, 4),
    ANIMCMD_FRAME(0x24, 4),
    ANIMCMD_FRAME(0x28, 4),
    ANIMCMD_FRAME(0x2c, 4),
    ANIMCMD_FRAME(0x30, 4),
    ANIMCMD_FRAME(0x34, 4),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd gUnknown_846F3AC[] = {
    ANIMCMD_FRAME(0x14, 0),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846F3B4[] = {
    ANIMCMD_FRAME(0x00, 0),
    ANIMCMD_END
};

static const union AffineAnimCmd gUnknown_846F3BC[] = {
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_FRAME(0, 0, 2, 1),
    AFFINEANIMCMD_JUMP(1)
};

static const union AffineAnimCmd gUnknown_846F3D4[] = {
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_FRAME(0, 0, -2, 1),
    AFFINEANIMCMD_JUMP(1)
};

static const union AnimCmd *const gUnknown_846F3EC[] = {
    gUnknown_846F340
};

static const union AnimCmd *const gUnknown_846F3F0[] = {
    gUnknown_846F348,
    gUnknown_846F358
};

static const union AnimCmd *const gUnknown_846F3F8[] = {
    gUnknown_846F36C,
    gUnknown_846F388
};

static const union AnimCmd *const gUnknown_846F400[] = {
    gUnknown_846F3AC
};

static const union AnimCmd *const gUnknown_846F404[] = {
    gUnknown_846F3B4
};

static const union AffineAnimCmd *const gUnknown_846F408[] = {
    gUnknown_846F3BC,
    gUnknown_846F3D4
};


static const struct SpriteTemplate gUnknown_846F410 = {
    .tileTag = 1,
    .paletteTag = 1,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gUnknown_846F3EC,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct SpriteTemplate gUnknown_846F428 = {
    .tileTag = 2,
    .paletteTag = 2,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gUnknown_846F3F0,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_814EFD0
};

static const struct SpriteTemplate gUnknown_846F440 = {
    .tileTag = 3,
    .paletteTag = 2,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gUnknown_846F3F8,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct SpriteTemplate gUnknown_846F458 = {
    .tileTag = 4,
    .paletteTag = 4,
    .oam = &gOamData_AffineOff_ObjNormal_8x16,
    .anims = gUnknown_846F400,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct SpriteTemplate gUnknown_846F470 = {
    .tileTag = 5,
    .paletteTag = 5,
    .oam = &gOamData_AffineDouble_ObjNormal_32x32,
    .anims = gUnknown_846F404,
    .affineAnims = gUnknown_846F408,
    .callback = SpriteCallbackDummy
};

static const struct DigitObjUtilTemplate gUnknown_846F488[] = {
    {
        .strConvMode = 1,
        .shape = SPRITE_SHAPE(8x16),
        .size = SPRITE_SIZE(8x16),
        .priority = 0,
        .oamCount = 2,
        .xDelta = 8,
        .x = 156,
        .y = 0,
        .spriteSheet = {.compressed = &gUnknown_846F2F8[3]},
        .spritePal = &gUnknown_846F320[2],
    }, {
        .strConvMode = 0,
        .shape = SPRITE_SHAPE(8x16),
        .size = SPRITE_SIZE(8x16),
        .priority = 0,
        .oamCount = 2,
        .xDelta = 8,
        .x = 180,
        .y = 0,
        .spriteSheet = {.compressed = &gUnknown_846F2F8[3]},
        .spritePal = &gUnknown_846F320[2],
    }, {
        .strConvMode = 0,
        .shape = SPRITE_SHAPE(8x16),
        .size = SPRITE_SIZE(8x16),
        .priority = 0,
        .oamCount = 2,
        .xDelta = 8,
        .x = 204,
        .y = 0,
        .spriteSheet = {.compressed = &gUnknown_846F2F8[3]},
        .spritePal = &gUnknown_846F320[2],
    }
};

static const u8 *const gUnknown_846F4B8[] = {
    gText_SpaceTimes,
    gText_XDotY,
    gText_StrVar1Berry,
    gText_NeatnessRankings,
    gText_CooperativeRankings,
    gText_PressingPowerRankings
};

int sub_814D5C8(void)
{
    struct BerryCrushGame * var0 = sub_814B6F0();
    if (!var0)
        return -1;

    switch (var0->unkC)
    {
    case 0:
        SetVBlankCallback(NULL);
        SetHBlankCallback(NULL);
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        ScanlineEffect_Stop();
        ResetTempTileDataBuffers();
        break;
    case 1:
        CpuFill16(0, (void *)OAM, OAM_SIZE);
        gReservedSpritePaletteCount = 0;
        DigitObjUtil_Init(3);
        break;
    case 2:
        ResetPaletteFade();
        ResetSpriteData();
        FreeAllSpritePalettes();
        break;
    case 3:
        ResetBgsAndClearDma3BusyFlags(0);
        InitBgsFromTemplates(0, gUnknown_846E3CC, NELEMS(gUnknown_846E3CC));
        SetBgTilemapBuffer(1, var0->unk1C0);
        SetBgTilemapBuffer(2, var0->unk21C0);
        SetBgTilemapBuffer(3, var0->unk31C0);
        ChangeBgX(0, 0, 0);
        ChangeBgY(0, 0, 0);
        ChangeBgX(2, 0, 0);
        ChangeBgY(2, 0, 0);
        ChangeBgX(3, 0, 0);
        ChangeBgY(3, 0, 0);
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        break;
    case 4:
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 32, 32);
        FillBgTilemapBufferRect_Palette0(1, 0, 0, 0, 32, 64);
        FillBgTilemapBufferRect_Palette0(2, 0, 0, 0, 32, 32);
        FillBgTilemapBufferRect_Palette0(3, 0, 0, 0, 32, 32);
        break;
    case 5:
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(3);
        DecompressAndCopyTileDataToVram(1, gUnknown_8EAFFC0, 0, 0, 0);
        break;
    case 6:
        if (FreeTempTileDataBuffersIfPossible())
            return 0;

        InitStandardTextBoxWindows();
        ResetBg0();
        sub_814EB38(var0);
        sub_814EBB0(var0);
        gPaletteFade.bufferTransferDisabled = TRUE;
        break;
    case 7:
        LoadPalette(gUnknown_8EAFEA0, 0, 0x180);
        CopyToBgTilemapBuffer(1, gBerryCrushGrinderTopTilemap, 0, 0);
        CopyToBgTilemapBuffer(2, gBerryCrushContainerCapTilemap, 0, 0);
        CopyToBgTilemapBuffer(3, gBerryCrushBackgroundTilemap, 0, 0);
        sub_814EC80(var0);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(3);
        break;
    case 8:
        LoadWirelessStatusIndicatorSpriteGfx();
        CreateWirelessStatusIndicatorSprite(0,  0);
        sub_814ECE0(var0);
        SetGpuReg(REG_OFFSET_BG1VOFS, -gSpriteCoordOffsetY);
        ChangeBgX(1, 0, 0);
        ChangeBgY(1, 0, 0);
        break;
    case 9:
        gPaletteFade.bufferTransferDisabled = FALSE;
        BlendPalettes(0xFFFFFFFF, 16, RGB_BLACK);
        ShowBg(0);
        ShowBg(1);
        ShowBg(2);
        ShowBg(3);
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJ_ON | DISPCNT_OBJ_1D_MAP);
        sub_814B914();
        var0->unkC = 0;
        return 1;
    }

    var0->unkC++;
    return 0;
}

int sub_814D888(void)
{
    struct BerryCrushGame * var0 = sub_814B6F0();
    if (!var0)
        return -1;

    switch (var0->unkC)
    {
    case 0:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 1:
        if (!IsLinkTaskFinished())
            return 0;
        // fall through. The original author forgot to use "break" here
        // because this will call BeginNormalPaletteFade() twice.
    case 2:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        UpdatePaletteFade();
        break;
    case 3:
        if (UpdatePaletteFade())
            return 0;
        break;
    case 4:
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 32, 32);
        FillBgTilemapBufferRect_Palette0(1, 0, 0, 0, 32, 32);
        FillBgTilemapBufferRect_Palette0(2, 0, 0, 0, 32, 32);
        FillBgTilemapBufferRect_Palette0(3, 0, 0, 0, 32, 32);
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(3);
        break;
    case 5:
        FreeAllWindowBuffers();
        HideBg(0);
        UnsetBgTilemapBuffer(0);
        HideBg(1);
        UnsetBgTilemapBuffer(1);
        HideBg(2);
        UnsetBgTilemapBuffer(2);
        HideBg(3);
        UnsetBgTilemapBuffer(3);
        ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJ_ON | DISPCNT_OBJ_1D_MAP);
        break;
    case 6:
        DestroyWirelessStatusIndicatorSprite();
        sub_814EF10(var0);
        DigitObjUtil_Teardown();
        break;
    case 7:
        var0->unkC = 0;
        return 1;
    }

    var0->unkC++;
    return 0;
}

int sub_814D9CC(struct BerryCrushGame * arg0)
{
    gSpriteCoordOffsetY = arg0->unk2A + arg0->unk2C;
    SetGpuReg(REG_OFFSET_BG1VOFS, -gSpriteCoordOffsetY);
    if (arg0->unk12 == 7)
    {
        sub_814EAD4(&arg0->unk138, arg0->unk28);
    }

    return 0;
}

void sub_814DA04(struct BerryCrushGame * arg0)
{
    arg0->unk2A = -104;
    arg0->unk2C = 0;
    gSpriteCoordOffsetX = 0;
    gSpriteCoordOffsetY = -104;
}

void sub_814DA24(struct BerryCrushGame * arg0, struct BerryCrushGame_138 * arg1)
{
    u8 i;
    u8 spriteId;
    s16 var0, var1;
    s16 *data;
    int var3;
    s16 var5;
    u32 var6;

    for (i = 0; i < arg0->unk9; i++)
    {
        spriteId = AddItemIconObjectWithCustomObjectTemplate(
            &gUnknown_846F470,
            gUnknown_846F2EC[i],
            gUnknown_846F2EC[i],
            arg0->unk68.as_four_players.others[i].unk0 + FIRST_BERRY_INDEX);
        arg1->unk38[i] = &gSprites[spriteId];
        arg1->unk38[i]->oam.priority = 3;
        arg1->unk38[i]->affineAnimPaused = TRUE;
        arg1->unk38[i]->pos1.x = arg1->unkC[i]->unk8 + 120;
        arg1->unk38[i]->pos1.y = -16;
        data = arg1->unk38[i]->data;
        var5 = 512;
        data[1] = var5;
        data[2] = 32;
        data[7] = 112;
        var0 = arg1->unkC[i]->unkA - arg1->unkC[i]->unk8;
        var3 = var0;
        if (var0 < 0)
            var3 += 3;

        data[6] = var3 >> 2;
        var0 *= 128;
        var6 = var5 + 32;
        var6 = var6 / 2;
        var1 = sub_80D8B40(7, 0x3F80, var6);
        data[0] = (u16)arg1->unk38[i]->pos1.x * 128;
        data[3] = sub_80D8B40(7, var0, var1);
        var1 = sub_80D8ABC(7, var1, 85);
        data[4] = 0;
        data[5] = sub_80D8B40(7, 0x3F80, var1);
        data[7] |= 0x8000;
        if (arg1->unkC[i]->unk8 < 0)
            StartSpriteAffineAnim(arg1->unk38[i], 1);
    }
}

void sub_814DB84(struct Sprite * sprite)
{
    s16 *data = sprite->data;

    data[1] += data[2];
    sprite->pos2.y += data[1] >> 8;
    if (data[7] & 0x8000)
    {
        sprite->data[0] += data[3];
        data[4] += data[5];
        sprite->pos2.x = Sin(data[4] >> 7, data[6]);
        if ((data[7] & 0x8000) && (data[4] >> 7) > 126)
        {
            sprite->pos2.x = 0;
            data[7] &= 0x7FFF;
        }
    }

    sprite->pos1.x = data[0] >> 7;
    if (sprite->pos1.y + sprite->pos2.y >= (data[7] & 0x7FFF))
    {
        sprite->callback = SpriteCallbackDummy;
        FreeSpriteOamMatrix(sprite);
        DestroySprite(sprite);
    }
}

void sub_814DC24(struct BerryCrushGame * arg0, UNUSED struct BerryCrushGame_138 * arg1)
{
    u8 i;
    for (i = 0; i < arg0->unk9; i++)
    {
        FreeSpritePaletteByTag(gUnknown_846F2EC[i]);
        FreeSpriteTilesByTag(gUnknown_846F2EC[i]);
    }
}

void sub_814DC5C(struct BerryCrushGame * arg0, struct BerryCrushGame_138 * arg1)
{
    u8 sp4;
    struct BerryCrushGame_4E * var4E;
    u8 i;
    u16 var, var2;

    sp4 = 0;
    var4E = &arg0->unk40.unkE;
    for (i = 0; i < arg0->unk9; i++)
    {
        var = var4E->unkA >> (i * 3);
        var &= 7;
        if (var)
        {
            sp4++;
            if (var & 0x4)
                StartSpriteAnim(arg1->unk24[i], 1);
            else
                StartSpriteAnim(arg1->unk24[i], 0);

            arg1->unk24[i]->invisible = FALSE;
            arg1->unk24[i]->animPaused = FALSE;
            arg1->unk24[i]->pos2.x = gUnknown_846F2D0[(var % 4) - 1][0];
            arg1->unk24[i]->pos2.y = gUnknown_846F2D0[(var % 4) - 1][1];
        }
    }

    if (sp4 == 0)
    {
        arg0->unk25_2 = 0;
    }
    else
    {
        var = (u8)(arg0->unk28 % 3);
        var2 = var;
        for (i = 0; i < var4E->unkC * 2 + 3; i++)
        {
            if (arg1->unk4C[i]->invisible)
            {
                arg1->unk4C[i]->callback = sub_814F0D8;
                arg1->unk4C[i]->pos1.x = gUnknown_846F2D6[i][0] + 120;
                arg1->unk4C[i]->pos1.y = gUnknown_846F2D6[i][1] + 136 - (var * 4);
                arg1->unk4C[i]->pos2.x = gUnknown_846F2D6[i][0] + (gUnknown_846F2D6[i][0] / (var2 * 4));
                arg1->unk4C[i]->pos2.y = gUnknown_846F2D6[i][1];
                if (var4E->unk4_1)
                    StartSpriteAnim(arg1->unk4C[i], 1);
                else
                    StartSpriteAnim(arg1->unk4C[i], 0);

                var++;
                if (var > 3)
                    var = 0;
            }
        }

        if (arg0->unk25_2)
        {
            arg0->unk25_2 = 0;
        }
        else
        {
            if (sp4 == 1)
                PlaySE(SE_TOY_DANGO);
            else
                PlaySE(SE_TOY_KABE);

            arg0->unk25_2 = 1;
        }
    }
}

bool32 sub_814DE50(struct BerryCrushGame * arg0, struct BerryCrushGame_138 * arg1)
{
    u8 i;

    for (i = 0; i < arg0->unk9; i++)
    {
        if (!arg1->unk24[i]->invisible)
            return FALSE;
    }

    for (i = 0; i < 11; i++)
    {
        if (!arg1->unk4C[i]->invisible)
            return FALSE;
    }

    if (arg0->unk2C != 0)
        arg0->unk2C = 0;

    return TRUE;
}

static void sub_814DEC0(struct BerryCrushGame_138 * arg0, u16 arg1)
{
    u8 i = 0;
    u32 r7 = 0;
    s16 r3 = 0;

    arg0->unk4 = arg1 / 3600;
    arg0->unk6 = (arg1 % 3600) / 60;
    r3 = sub_80D8AA0((arg1 % 60) << 8, 4);

    for (i = 0; i < 8; i++)
    {
        if ((r3 >> (7 - i)) & 1)
            r7 += gUnknown_846E450[i];
    }

    arg0->unk8 = r7 / 1000000;
}

static void sub_814DF44(u8 windowId, u8 left, u8 colorId, const u8 *string)
{
    left = (left * 4) - (GetStringWidth(2, string, -1) / 2u);
    AddTextPrinterParameterized3(windowId, 2, left, 0, sBerryCrushTextColorTable[colorId], 0, string);
}

#ifdef NONMATCHING
static void sub_814DFA4(struct BerryCrushGame * sp0C, u8 sp10, u8 sp14, u8 sp18)
{
    u8 r8;
    u8 sp1C;
    u8 sp20;
    u8 r2;
    s32 r3;
    u8 r7;
    struct BerryCrushGame_68_x * sp24 = &sp0C->unk68.as_four_players;
    for (r8 = 0, sp1C = 0, sp20 = 0; r8 < sp0C->unk9; r8++)
    {
        // sp10<<2 --> sp28
        // &sp0C->unk138.unk82 --> sp2C
        DynamicPlaceholderTextUtil_Reset();
        switch (sp10)
        {
        case 0:
            sp1C = sp0C->unk68.as_five_players.unk1C[0].unk4.as_2d_bytes[sp10][r8];
            if (r8 != 0 && sp24->unk00.unk0C[sp10][r8] != sp24->unk00.unk0C[sp10][r8 - 1])
            {
                sp20 = r8;
            }
            ConvertIntToDecimalStringN(gStringVar1, sp24->unk00.unk0C[sp10][r8], STR_CONV_MODE_RIGHT_ALIGN, 4);
            r7 = sp14 - GetStringWidth(2, gUnknown_846F4B8[sp10], -1) - 4;
            AddTextPrinterParameterized3(sp0C->unk138.unk82, 2, r7, sp18 + 14 * r8, sBerryCrushTextColorTable[0], 0, gUnknown_846F4B8[sp10]);
            AddTextPrinterParameterized3(sp0C->unk138.unk82, 2, r7 - 24, sp18 + 14 * r8, sBerryCrushTextColorTable[0], 0, gStringVar1);
            break;
        case 1:
            sp1C = sp0C->unk68.as_five_players.unk1C[0].unk4.as_2d_bytes[sp10][r8];
            if (r8 != 0 && sp24->unk00.unk0C[sp10][r8] != sp24->unk00.unk0C[sp10][r8 - 1])
            {
                sp20 = r8;
            }
            ConvertIntToDecimalStringN(gStringVar1, sp24->unk00.unk0C[sp10][r8], STR_CONV_MODE_LEFT_ALIGN, 3);
            r3 = 0;
            r7 = sp24->unk00.unk0C[sp10][r8] & 15;
            for (r2 = 0; r2 < 4; r2++)
            {
                if ((r7 >> (3 - r2)) & 1)
                    r3 += gUnknown_846E450[r2];
            }
            r7 = r3 / 1000000;
            ConvertIntToDecimalStringN(gStringVar2, r7, STR_CONV_MODE_LEADING_ZEROS, 2);
            StringExpandPlaceholders(gStringVar4, gUnknown_846F4B8[sp10]);
            r2 = sp14 - GetStringWidth(2, gStringVar4, 0) - 4;
            AddTextPrinterParameterized3(sp0C->unk138.unk82, 2, r2, sp18 + 14 * r8, sBerryCrushTextColorTable[0], 0, gStringVar4);
            break;
        case 2:
            sp1C = r8;
            sp20 = r8;
            r2 = sp0C->unk68.as_five_players.unk1C[r8].unk14[8];
            if (r2 >= LAST_BERRY_INDEX - FIRST_BERRY_INDEX)
                r2 = 0;
            StringCopy(gStringVar1, gBerries[r2].name);
            StringExpandPlaceholders(gStringVar4, gUnknown_846F4B8[sp10]);
            r2 = sp14 - GetStringWidth(2, gStringVar4, -1) - 4;
            AddTextPrinterParameterized3(sp0C->unk138.unk82, 2, r2, sp18 + 14 * r8, sBerryCrushTextColorTable[0], 0, gStringVar4);
            break;
        }
        if (sp1C == sp0C->unk8)
            StringCopy(gStringVar3, gText_1_ClrLtGryShdwBlk_Dynamic0);
        else
            StringCopy(gStringVar3, gText_1_Dynamic0);
        gStringVar3[0] = sp20 + CHAR_1;
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, sp0C->unk68.as_five_players.unk1C[sp1C].unk14);
        DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gStringVar3);
        AddTextPrinterParameterized3(sp0C->unk138.unk82, 2, 4, sp18 + 14 * r8, sBerryCrushTextColorTable[0], 0, gStringVar4);
    }
}
#else
NAKED
static void sub_814DFA4(struct BerryCrushGame * sp0C, u8 sp10, u8 sp14, u8 r3)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x38\n"
                "\tstr r0, [sp, 0xC]\n"
                "\tlsls r1, 24\n"
                "\tlsrs r1, 24\n"
                "\tstr r1, [sp, 0x10]\n"
                "\tlsls r2, 24\n"
                "\tlsrs r2, 24\n"
                "\tstr r2, [sp, 0x14]\n"
                "\tlsls r3, 24\n"
                "\tlsrs r3, 24\n"
                "\tstr r3, [sp, 0x18]\n"
                "\tmovs r0, 0\n"
                "\tmov r8, r0\n"
                "\tmovs r1, 0\n"
                "\tstr r1, [sp, 0x1C]\n"
                "\tmovs r2, 0\n"
                "\tstr r2, [sp, 0x20]\n"
                "\tldr r4, [sp, 0xC]\n"
                "\tadds r4, 0x68\n"
                "\tstr r4, [sp, 0x24]\n"
                "\tldr r0, [sp, 0xC]\n"
                "\tldrb r0, [r0, 0x9]\n"
                "\tcmp r8, r0\n"
                "\tbcc _0814DFE0\n"
                "\tb _0814E30C\n"
                "_0814DFE0:\n"
                "\tldr r1, [sp, 0x10]\n"
                "\tlsls r1, 2\n"
                "\tstr r1, [sp, 0x28]\n"
                "\tmovs r4, 0xDD\n"
                "\tlsls r4, 1\n"
                "\tldr r2, [sp, 0xC]\n"
                "\tadds r4, r2, r4\n"
                "\tstr r4, [sp, 0x2C]\n"
                "_0814DFF0:\n"
                "\tbl DynamicPlaceholderTextUtil_Reset\n"
                "\tldr r0, [sp, 0x10]\n"
                "\tcmp r0, 0x1\n"
                "\tbeq _0814E0E4\n"
                "\tcmp r0, 0x1\n"
                "\tbgt _0814E00A\n"
                "\tcmp r0, 0\n"
                "\tbeq _0814E01A\n"
                "\tmov r1, r8\n"
                "\tlsls r1, 3\n"
                "\tmov r9, r1\n"
                "\tb _0814E0C8\n"
                "_0814E00A:\n"
                "\tldr r0, [sp, 0x10]\n"
                "\tcmp r0, 0x2\n"
                "\tbne _0814E012\n"
                "\tb _0814E200\n"
                "_0814E012:\n"
                "\tmov r1, r8\n"
                "\tlsls r1, 3\n"
                "\tmov r9, r1\n"
                "\tb _0814E0C8\n"
                "_0814E01A:\n"
                "\tldr r0, [sp, 0x24]\n"
                "\tadds r0, 0x20\n"
                "\tadd r0, r8\n"
                "\tldrb r0, [r0]\n"
                "\tstr r0, [sp, 0x1C]\n"
                "\tmov r0, r8\n"
                "\tlsls r3, r0, 1\n"
                "\tldr r2, [sp, 0x24]\n"
                "\tadds r2, 0xC\n"
                "\tcmp r0, 0\n"
                "\tbeq _0814E048\n"
                "\tadds r0, r2, r3\n"
                "\tmov r1, r8\n"
                "\tsubs r1, 0x1\n"
                "\tlsls r1, 1\n"
                "\tadds r1, r2, r1\n"
                "\tldrh r0, [r0]\n"
                "\tldrh r1, [r1]\n"
                "\tcmp r0, r1\n"
                "\tbeq _0814E048\n"
                "\tmov r4, r8\n"
                "\tadds r1, r4, 0\n"
                "\tstr r1, [sp, 0x20]\n"
                "_0814E048:\n"
                "\tldr r1, [sp, 0x28]\n"
                "\tldr r4, [sp, 0x10]\n"
                "\tadds r0, r1, r4\n"
                "\tlsls r0, 1\n"
                "\tadds r0, r3, r0\n"
                "\tadds r0, r2, r0\n"
                "\tldrh r1, [r0]\n"
                "\tldr r0, _0814E0D8 @ =gStringVar1\n"
                "\tmovs r2, 0x1\n"
                "\tmovs r3, 0x4\n"
                "\tbl ConvertIntToDecimalStringN\n"
                "\tldr r0, _0814E0DC @ =gUnknown_846F4B8\n"
                "\tldr r1, [sp, 0x28]\n"
                "\tadds r0, r1, r0\n"
                "\tldr r5, [r0]\n"
                "\tmovs r0, 0x2\n"
                "\tadds r1, r5, 0\n"
                "\tmovs r2, 0x1\n"
                "\tnegs r2, r2\n"
                "\tbl GetStringWidth\n"
                "\tldr r2, [sp, 0x14]\n"
                "\tsubs r0, r2, r0\n"
                "\tsubs r0, 0x4\n"
                "\tlsls r0, 24\n"
                "\tlsrs r7, r0, 24\n"
                "\tldr r4, [sp, 0x2C]\n"
                "\tldrb r0, [r4]\n"
                "\tmov r1, r8\n"
                "\tlsls r6, r1, 3\n"
                "\tsubs r4, r6, r1\n"
                "\tlsls r4, 1\n"
                "\tldr r2, [sp, 0x18]\n"
                "\tadds r4, r2, r4\n"
                "\tlsls r4, 24\n"
                "\tlsrs r4, 24\n"
                "\tldr r1, _0814E0E0 @ =sBerryCrushTextColorTable\n"
                "\tstr r1, [sp]\n"
                "\tmovs r2, 0\n"
                "\tstr r2, [sp, 0x4]\n"
                "\tstr r5, [sp, 0x8]\n"
                "\tmovs r1, 0x2\n"
                "\tadds r2, r7, 0\n"
                "\tadds r3, r4, 0\n"
                "\tbl AddTextPrinterParameterized3\n"
                "\tldr r1, [sp, 0x2C]\n"
                "\tldrb r0, [r1]\n"
                "\tadds r2, r7, 0\n"
                "\tsubs r2, 0x18\n"
                "\tlsls r2, 24\n"
                "\tlsrs r2, 24\n"
                "\tldr r1, _0814E0E0 @ =sBerryCrushTextColorTable\n"
                "\tstr r1, [sp]\n"
                "\tmovs r1, 0\n"
                "\tstr r1, [sp, 0x4]\n"
                "\tldr r1, _0814E0D8 @ =gStringVar1\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tmovs r1, 0x2\n"
                "\tadds r3, r4, 0\n"
                "\tbl AddTextPrinterParameterized3\n"
                "\tmov r9, r6\n"
                "_0814E0C8:\n"
                "\tldr r6, [sp, 0x20]\n"
                "\tadds r6, 0xA2\n"
                "\tldr r2, [sp, 0x1C]\n"
                "\tlsls r5, r2, 5\n"
                "\tmovs r4, 0x1\n"
                "\tadd r4, r8\n"
                "\tmov r10, r4\n"
                "\tb _0814E27E\n"
                "\t.align 2, 0\n"
                "_0814E0D8: .4byte gStringVar1\n"
                "_0814E0DC: .4byte gUnknown_846F4B8\n"
                "_0814E0E0: .4byte sBerryCrushTextColorTable\n"
                "_0814E0E4:\n"
                "\tldr r0, [sp, 0x24]\n"
                "\tadd r0, r8\n"
                "\tadds r0, 0x28\n"
                "\tldrb r0, [r0]\n"
                "\tstr r0, [sp, 0x1C]\n"
                "\tmov r0, r8\n"
                "\tlsls r3, r0, 1\n"
                "\tldr r2, [sp, 0x24]\n"
                "\tadds r2, 0xC\n"
                "\tcmp r0, 0\n"
                "\tbeq _0814E116\n"
                "\tadds r0, r3, 0\n"
                "\tadds r0, 0xA\n"
                "\tadds r0, r2, r0\n"
                "\tmov r4, r8\n"
                "\tlsls r1, r4, 1\n"
                "\tadds r1, 0x8\n"
                "\tadds r1, r2, r1\n"
                "\tldrh r0, [r0]\n"
                "\tldrh r1, [r1]\n"
                "\tcmp r0, r1\n"
                "\tbeq _0814E116\n"
                "\tmov r1, r8\n"
                "\tadds r0, r1, 0\n"
                "\tstr r0, [sp, 0x20]\n"
                "_0814E116:\n"
                "\tldr r0, [sp, 0x28]\n"
                "\tldr r1, [sp, 0x10]\n"
                "\tadds r4, r0, r1\n"
                "\tlsls r4, 1\n"
                "\tadds r4, r3, r4\n"
                "\tadds r4, r2, r4\n"
                "\tldrh r1, [r4]\n"
                "\tlsrs r1, 4\n"
                "\tldr r0, _0814E1E4 @ =gStringVar1\n"
                "\tmovs r2, 0x1\n"
                "\tmovs r3, 0x3\n"
                "\tbl ConvertIntToDecimalStringN\n"
                "\tmovs r3, 0\n"
                "\tldrb r0, [r4]\n"
                "\tmovs r7, 0xF\n"
                "\tands r7, r0\n"
                "\tmovs r2, 0\n"
                "\tldr r4, [sp, 0x10]\n"
                "\tlsls r4, 2\n"
                "\tstr r4, [sp, 0x34]\n"
                "\tmov r0, r8\n"
                "\tlsls r0, 3\n"
                "\tmov r9, r0\n"
                "\tldr r1, [sp, 0x14]\n"
                "\tsubs r1, 0x4\n"
                "\tstr r1, [sp, 0x30]\n"
                "\tldr r6, [sp, 0x20]\n"
                "\tadds r6, 0xA2\n"
                "\tldr r4, [sp, 0x1C]\n"
                "\tlsls r5, r4, 5\n"
                "\tmovs r0, 0x1\n"
                "\tadd r0, r8\n"
                "\tmov r10, r0\n"
                "\tmovs r1, 0x1\n"
                "\tmov r12, r1\n"
                "\tldr r4, _0814E1E8 @ =gUnknown_846E450\n"
                "_0814E160:\n"
                "\tmovs r0, 0x3\n"
                "\tsubs r1, r0, r2\n"
                "\tadds r0, r7, 0\n"
                "\tasrs r0, r1\n"
                "\tmov r1, r12\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _0814E178\n"
                "\tlsls r0, r2, 2\n"
                "\tadds r0, r4\n"
                "\tldr r0, [r0]\n"
                "\tadds r3, r0\n"
                "_0814E178:\n"
                "\tadds r0, r2, 0x1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r2, r0, 24\n"
                "\tcmp r2, 0x3\n"
                "\tbls _0814E160\n"
                "\tadds r0, r3, 0\n"
                "\tldr r1, _0814E1EC @ =1000000\n"
                "\tbl __udivsi3\n"
                "\tlsls r0, 24\n"
                "\tlsrs r7, r0, 24\n"
                "\tldr r0, _0814E1F0 @ =gStringVar2\n"
                "\tadds r1, r7, 0\n"
                "\tmovs r2, 0x2\n"
                "\tmovs r3, 0x2\n"
                "\tbl ConvertIntToDecimalStringN\n"
                "\tldr r0, _0814E1F4 @ =gUnknown_846F4B8\n"
                "\tldr r2, [sp, 0x34]\n"
                "\tadds r0, r2, r0\n"
                "\tldr r1, [r0]\n"
                "\tldr r0, _0814E1F8 @ =gStringVar4\n"
                "\tbl StringExpandPlaceholders\n"
                "\tmovs r0, 0x2\n"
                "\tldr r1, _0814E1F8 @ =gStringVar4\n"
                "\tmovs r2, 0\n"
                "\tbl GetStringWidth\n"
                "\tadds r2, r0, 0\n"
                "\tldr r4, [sp, 0x30]\n"
                "\tsubs r2, r4, r2\n"
                "\tlsls r2, 24\n"
                "\tlsrs r2, 24\n"
                "\tldr r1, [sp, 0x2C]\n"
                "\tldrb r0, [r1]\n"
                "\tmov r4, r9\n"
                "\tmov r1, r8\n"
                "\tsubs r3, r4, r1\n"
                "\tlsls r3, 1\n"
                "\tldr r4, [sp, 0x18]\n"
                "\tadds r3, r4, r3\n"
                "\tlsls r3, 24\n"
                "\tlsrs r3, 24\n"
                "\tldr r1, _0814E1FC @ =sBerryCrushTextColorTable\n"
                "\tstr r1, [sp]\n"
                "\tmovs r4, 0\n"
                "\tstr r4, [sp, 0x4]\n"
                "\tldr r1, _0814E1F8 @ =gStringVar4\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tmovs r1, 0x2\n"
                "\tbl AddTextPrinterParameterized3\n"
                "\tb _0814E27E\n"
                "\t.align 2, 0\n"
                "_0814E1E4: .4byte gStringVar1\n"
                "_0814E1E8: .4byte gUnknown_846E450\n"
                "_0814E1EC: .4byte 1000000\n"
                "_0814E1F0: .4byte gStringVar2\n"
                "_0814E1F4: .4byte gUnknown_846F4B8\n"
                "_0814E1F8: .4byte gStringVar4\n"
                "_0814E1FC: .4byte sBerryCrushTextColorTable\n"
                "_0814E200:\n"
                "\tmov r2, r8\n"
                "\tstr r2, [sp, 0x1C]\n"
                "\tmov r0, r8\n"
                "\tadds r4, r0, 0\n"
                "\tstr r4, [sp, 0x20]\n"
                "\tlsls r5, r0, 5\n"
                "\tldr r1, [sp, 0xC]\n"
                "\tadds r0, r1, r5\n"
                "\tadds r0, 0xA4\n"
                "\tldrb r2, [r0]\n"
                "\tcmp r2, 0x2B\n"
                "\tbls _0814E21A\n"
                "\tmovs r2, 0\n"
                "_0814E21A:\n"
                "\tlsls r1, r2, 3\n"
                "\tsubs r1, r2\n"
                "\tlsls r1, 2\n"
                "\tldr r0, _0814E294 @ =gBerries\n"
                "\tadds r1, r0\n"
                "\tldr r0, _0814E298 @ =gStringVar1\n"
                "\tbl StringCopy\n"
                "\tldr r0, _0814E29C @ =gUnknown_846F4B8\n"
                "\tldr r1, [r0, 0x8]\n"
                "\tldr r0, _0814E2A0 @ =gStringVar4\n"
                "\tbl StringExpandPlaceholders\n"
                "\tmovs r0, 0x2\n"
                "\tldr r1, _0814E2A0 @ =gStringVar4\n"
                "\tmovs r2, 0x1\n"
                "\tnegs r2, r2\n"
                "\tbl GetStringWidth\n"
                "\tadds r2, r0, 0\n"
                "\tldr r4, [sp, 0x14]\n"
                "\tsubs r2, r4, r2\n"
                "\tsubs r2, 0x4\n"
                "\tlsls r2, 24\n"
                "\tlsrs r2, 24\n"
                "\tldr r1, [sp, 0x2C]\n"
                "\tldrb r0, [r1]\n"
                "\tmov r1, r8\n"
                "\tlsls r4, r1, 3\n"
                "\tsubs r3, r4, r1\n"
                "\tlsls r3, 1\n"
                "\tldr r1, [sp, 0x18]\n"
                "\tadds r3, r1, r3\n"
                "\tlsls r3, 24\n"
                "\tlsrs r3, 24\n"
                "\tldr r1, _0814E2A4 @ =sBerryCrushTextColorTable\n"
                "\tstr r1, [sp]\n"
                "\tmovs r1, 0\n"
                "\tstr r1, [sp, 0x4]\n"
                "\tldr r1, _0814E2A0 @ =gStringVar4\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tmovs r1, 0x2\n"
                "\tbl AddTextPrinterParameterized3\n"
                "\tmov r9, r4\n"
                "\tmov r6, r8\n"
                "\tadds r6, 0xA2\n"
                "\tmovs r2, 0x1\n"
                "\tadd r2, r8\n"
                "\tmov r10, r2\n"
                "_0814E27E:\n"
                "\tldr r0, [sp, 0x1C]\n"
                "\tldr r4, [sp, 0xC]\n"
                "\tldrb r4, [r4, 0x8]\n"
                "\tcmp r0, r4\n"
                "\tbne _0814E2B0\n"
                "\tldr r0, _0814E2A8 @ =gStringVar3\n"
                "\tldr r1, _0814E2AC @ =gText_1_ClrLtGryShdwBlk_Dynamic0\n"
                "\tbl StringCopy\n"
                "\tb _0814E2B8\n"
                "\t.align 2, 0\n"
                "_0814E294: .4byte gBerries\n"
                "_0814E298: .4byte gStringVar1\n"
                "_0814E29C: .4byte gUnknown_846F4B8\n"
                "_0814E2A0: .4byte gStringVar4\n"
                "_0814E2A4: .4byte sBerryCrushTextColorTable\n"
                "_0814E2A8: .4byte gStringVar3\n"
                "_0814E2AC: .4byte gText_1_ClrLtGryShdwBlk_Dynamic0\n"
                "_0814E2B0:\n"
                "\tldr r0, _0814E31C @ =gStringVar3\n"
                "\tldr r1, _0814E320 @ =gText_1_Dynamic0\n"
                "\tbl StringCopy\n"
                "_0814E2B8:\n"
                "\tldr r4, _0814E31C @ =gStringVar3\n"
                "\tstrb r6, [r4]\n"
                "\tadds r1, r5, 0\n"
                "\tadds r1, 0x98\n"
                "\tldr r0, [sp, 0xC]\n"
                "\tadds r1, r0, r1\n"
                "\tmovs r0, 0\n"
                "\tbl DynamicPlaceholderTextUtil_SetPlaceholderPtr\n"
                "\tldr r0, _0814E324 @ =gStringVar4\n"
                "\tadds r1, r4, 0\n"
                "\tbl DynamicPlaceholderTextUtil_ExpandPlaceholders\n"
                "\tldr r1, [sp, 0x2C]\n"
                "\tldrb r0, [r1]\n"
                "\tmov r2, r9\n"
                "\tmov r4, r8\n"
                "\tsubs r3, r2, r4\n"
                "\tlsls r3, 1\n"
                "\tldr r1, [sp, 0x18]\n"
                "\tadds r3, r1, r3\n"
                "\tlsls r3, 24\n"
                "\tlsrs r3, 24\n"
                "\tldr r2, _0814E328 @ =sBerryCrushTextColorTable\n"
                "\tstr r2, [sp]\n"
                "\tmovs r4, 0\n"
                "\tstr r4, [sp, 0x4]\n"
                "\tldr r1, _0814E324 @ =gStringVar4\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tmovs r1, 0x2\n"
                "\tmovs r2, 0x4\n"
                "\tbl AddTextPrinterParameterized3\n"
                "\tmov r2, r10\n"
                "\tlsls r0, r2, 24\n"
                "\tlsrs r0, 24\n"
                "\tmov r8, r0\n"
                "\tldr r4, [sp, 0xC]\n"
                "\tldrb r4, [r4, 0x9]\n"
                "\tcmp r8, r4\n"
                "\tbcs _0814E30C\n"
                "\tb _0814DFF0\n"
                "_0814E30C:\n"
                "\tadd sp, 0x38\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_0814E31C: .4byte gStringVar3\n"
                "_0814E320: .4byte gText_1_Dynamic0\n"
                "_0814E324: .4byte gStringVar4\n"
                "_0814E328: .4byte sBerryCrushTextColorTable");
}
#endif

static void sub_814E32C(struct BerryCrushGame * r8)
{
    u8 r10 = 0;
    u8 r6 = 0;
    u32 sp0C = 0;
    union BerryCrushGame_68 *sp10 = &r8->unk68;
    u8 r7 = GetWindowAttribute(r8->unk138.unk82, WINDOW_HEIGHT) * 8 - 42;

    sub_814DEC0(&r8->unk138, sp10->as_four_players.unk00.unk04);
    AddTextPrinterParameterized3(r8->unk138.unk82, 2, 2, r7, sBerryCrushTextColorTable[0], 0, gText_TimeColon);

    r6 = 190 - (u8)GetStringWidth(2, gText_SpaceSec, 0);
    AddTextPrinterParameterized3(r8->unk138.unk82, 2, r6, r7, sBerryCrushTextColorTable[0], 0, gText_SpaceSec);

    r6 -= 32;
    ConvertIntToDecimalStringN(gStringVar1, r8->unk138.unk6, STR_CONV_MODE_LEADING_ZEROS, 2);
    ConvertIntToDecimalStringN(gStringVar2, r8->unk138.unk8, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringExpandPlaceholders(gStringVar4, gText_XDotY2);
    AddTextPrinterParameterized3(r8->unk138.unk82, 2, r6, r7, sBerryCrushTextColorTable[0], 0, gStringVar4);

    r6 -= (u8)GetStringWidth(2, gText_SpaceMin, 0) + 3;
    AddTextPrinterParameterized3(r8->unk138.unk82, 2, r6, r7, sBerryCrushTextColorTable[0], 0, gText_SpaceMin);

    r6 -= 9;
    ConvertIntToDecimalStringN(gStringVar1, r8->unk138.unk4, STR_CONV_MODE_LEADING_ZEROS, 1);
    StringExpandPlaceholders(gStringVar4, gText_StrVar1);
    AddTextPrinterParameterized3(r8->unk138.unk82, 2, r6, r7, sBerryCrushTextColorTable[0], 0, gStringVar4);

    r7 += 14;
    AddTextPrinterParameterized3(r8->unk138.unk82, 2, 2, r7, sBerryCrushTextColorTable[0], 0, gText_PressingSpeed);

    r6 = 190 - (u8)GetStringWidth(2, gText_TimesPerSec, 0);
    AddTextPrinterParameterized3(r8->unk138.unk82, 3, r6, r7, sBerryCrushTextColorTable[0], 0, gText_TimesPerSec);

    for (r10 = 0; r10 < 8; ++r10)
        if (((u8)r8->unk16 >> (7 - r10)) & 1)
            sp0C += *(r10 + gUnknown_846E450); // It's accessed in a different way here for unknown reason
    ConvertIntToDecimalStringN(gStringVar1, r8->unk16 >> 8, STR_CONV_MODE_RIGHT_ALIGN, 3);
    ConvertIntToDecimalStringN(gStringVar2, sp0C / 1000000, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringExpandPlaceholders(gStringVar4, gText_XDotY3);
    r6 -= 38;
    if (r8->unk25_1)
        AddTextPrinterParameterized3(r8->unk138.unk82, 2, r6, r7, sBerryCrushTextColorTable[5], 0, gStringVar4);
    else
        AddTextPrinterParameterized3(r8->unk138.unk82, 2, r6, r7, sBerryCrushTextColorTable[0], 0, gStringVar4);

    r7 += 14;
    AddTextPrinterParameterized3(r8->unk138.unk82, 2, 2, r7, sBerryCrushTextColorTable[0], 0, gText_Silkiness);

    ConvertIntToDecimalStringN(gStringVar1, sp10->as_four_players.unk00.unk08, STR_CONV_MODE_RIGHT_ALIGN, 3);
    StringExpandPlaceholders(gStringVar4, gText_Var1Percent);
    r6 = 190 - (u8)GetStringWidth(2, gStringVar4, 0);
    AddTextPrinterParameterized3(r8->unk138.unk82, 2, r6, r7, sBerryCrushTextColorTable[0], 0, gStringVar4);
}

bool32 sub_814E644(struct BerryCrushGame * r4, struct BerryCrushGame_138 * r6)
{
    u8 r5;
    struct WindowTemplate template;

    switch (r6->unk80)
    {
    case 0:
        r5 = r4->unk9 - 2;
        sub_814EB04(r6);
        memcpy(&template, &gUnknown_846E428[r4->unk12 - 11], sizeof(struct WindowTemplate));
        if (r4->unk12 == 13)
            template.height = gUnknown_846E448[1][r5];
        else
            template.height = gUnknown_846E448[0][r5];
        r6->unk82 = AddWindow(&template);
        break;
    case 1:
        PutWindowTilemap(r6->unk82);
        FillWindowPixelBuffer(r6->unk82, PIXEL_FILL(0));
        break;
    case 2:
        TextWindow_SetStdFrame0_WithPal(r6->unk82, 0x21D, 0xD0);
        DrawStdFrameWithCustomTileAndPalette(r6->unk82, 0, 541, 13);
        break;
    case 3:
        r5 = r4->unk9 - 2;
        switch (r4->unk12)
        {
        case 11:
            sub_814DF44(r6->unk82, 22, 3, gText_PressesRankings);
            sub_814DFA4(r4, 0, 0xB0, 8 * gUnknown_846E448[0][r5] - r4->unk9 * 14);
            r6->unk80 = 5;
            return FALSE;
        case 12:
            sub_814DF44(r6->unk82, 22, 4, gUnknown_846F4B8[r4->unk68.as_five_players.unk1C[0].unk4.as_2d_bytes[0][7] + 3]);
            sub_814DFA4(r4, 1, 0xB0, 8 * gUnknown_846E448[0][r5] - r4->unk9 * 14);
            r6->unk80 = 5;
            return FALSE;
        case 13:
            sub_814DF44(r6->unk82, 24, 3, gText_CrushingResults);
            sub_814DFA4(r4, 2, 0xC0, 0x10);
            break;
        }
        break;
    case 4:
        sub_814E32C(r4);
        break;
    case 5:
        CopyWindowToVram(r6->unk82, 3);
        r6->unk80 = 0;
        return TRUE;
    }
    ++r6->unk80;
    return FALSE;
}

void sub_814E80C(struct BerryCrushGame * r4)
{
    ClearStdWindowAndFrameToTransparent(r4->unk138.unk82, 1);
    RemoveWindow(r4->unk138.unk82);
    sub_814EBB0(r4);
}

static void Task_ShowBerryCrushRankings(u8 taskId)
{
    u8 i = 0, j, xPos, yPos;
    u32 score = 0;
    s16 *data = gTasks[taskId].data;
    u8 *str;

    switch (data[0])
    {
    case 0:
        data[1] = AddWindow(&gUnknown_846E3F0);
        PutWindowTilemap(data[1]);
        FillWindowPixelBuffer(data[1], PIXEL_FILL(0));
        TextWindow_SetStdFrame0_WithPal(data[1], 0x21D, 0xD0);
        DrawStdFrameWithCustomTileAndPalette(data[1], 0, 0x21D, 0xD);
        break;
    case 1:
        xPos = 96 - GetStringWidth(2, gText_BerryCrush2, -1) / 2u;
        AddTextPrinterParameterized3(
            data[1],
            2,
            xPos,
            2,
            sBerryCrushTextColorTable[3],
            0,
            gText_BerryCrush2
        );
        xPos = 96 - GetStringWidth(2, gText_PressingSpeedRankings, -1) / 2u;
        AddTextPrinterParameterized3(
            data[1],
            2,
            xPos,
            18,
            sBerryCrushTextColorTable[3],
            0,
            gText_PressingSpeedRankings
        );
        yPos = 42;
        for (i = 0; i < 4; ++i)
        {
            ConvertIntToDecimalStringN(gStringVar1, i + 2, STR_CONV_MODE_LEFT_ALIGN, 1);
            StringExpandPlaceholders(gStringVar4, gText_Var1Players);
            AddTextPrinterParameterized3(
                data[1],
                2,
                4,
                yPos,
                sBerryCrushTextColorTable[0],
                0,
                gStringVar4
            );
            for (j = 0; j < 8; ++j)
            {
                if (((data[i + 2] & 0xFF) >> (7 - j)) & 1)
                    score += gUnknown_846E450[j];
            }
            ConvertIntToDecimalStringN(gStringVar1, (u16)data[i + 2] >> 8, STR_CONV_MODE_RIGHT_ALIGN, 3);
            ConvertIntToDecimalStringN(gStringVar2, score / 1000000, STR_CONV_MODE_LEADING_ZEROS, 2);
            str = StringExpandPlaceholders(gStringVar4, gText_XDotY3);
            *str++ = CHAR_SPACE;
            StringCopy(str, gText_TimesPerSec);
            xPos = 192 - (u8)GetStringWidth(3, gStringVar4, 0);
            AddTextPrinterParameterized3(
                data[1],
                3,
                xPos,
                yPos,
                sBerryCrushTextColorTable[0],
                0,
                gStringVar4
            );
            yPos += 14;
            score = 0;
        }
        CopyWindowToVram(data[1], 3);
        break;
    case 2:
        if (gMain.newKeys & (A_BUTTON | B_BUTTON))
            break;
        else
            return;
    case 3:
        ClearStdWindowAndFrameToTransparent(data[1], 1);
        ClearWindowTilemap(data[1]);
        RemoveWindow(data[1]);
        DestroyTask(taskId);
        EnableBothScriptContexts();
        ScriptContext2_Disable();
        data[0] = 0;
        return;
    }
    ++data[0];
}

void ShowBerryCrushRankings(void)
{
    u8 taskId;

    ScriptContext2_Enable();
    taskId = CreateTask(Task_ShowBerryCrushRankings, 0);
    gTasks[taskId].data[2] = gSaveBlock2Ptr->berryCrush.berryCrushResults[0];
    gTasks[taskId].data[3] = gSaveBlock2Ptr->berryCrush.berryCrushResults[1];
    gTasks[taskId].data[4] = gSaveBlock2Ptr->berryCrush.berryCrushResults[2];
    gTasks[taskId].data[5] = gSaveBlock2Ptr->berryCrush.berryCrushResults[3];
}

static void sub_814EAD4(struct BerryCrushGame_138 * r4, u16 r1)
{
    sub_814DEC0(r4, r1);
    DigitObjUtil_PrintNumOn(0, r4->unk4);
    DigitObjUtil_PrintNumOn(1, r4->unk6);
    DigitObjUtil_PrintNumOn(2, r4->unk8);
}

void sub_814EB04(struct BerryCrushGame_138 * r0)
{
    r0->unk78[0]->invisible = TRUE;
    r0->unk78[1]->invisible = TRUE;
    DigitObjUtil_HideOrShow(2, 1);
    DigitObjUtil_HideOrShow(1, 1);
    DigitObjUtil_HideOrShow(0, 1);
}

static void sub_814EB38(struct BerryCrushGame * r5)
{
    u8 r6;

    for (r6 = 0; r6 < r5->unk9; ++r6)
    {
        r5->unk138.unkC[r6] = &gUnknown_846F294[gUnknown_846F280[r5->unk9 - 2][r6]];
        r5->unk138.unk83[r6] = AddWindow(&gUnknown_846E3F8[r5->unk138.unkC[r6]->unk0]);
        PutWindowTilemap(r5->unk138.unk83[r6]);
        FillWindowPixelBuffer(r5->unk138.unk83[r6], 0);
    }
}

static void sub_814EBB0(struct BerryCrushGame * r6)
{
    u8 r7, r2;
    u8 *r4;

    for (r7 = 0; r7 < r6->unk9; ++r7)
    {
        PutWindowTilemap(r6->unk138.unk83[r7]);
        if (r7 == r6->unk8)
        {
            AddTextPrinterParameterized4(
                r6->unk138.unk83[r7],
                2,
                36 - GetStringWidth(2, PLAYER_UNK14(r6, r7), 0) / 2u,
                1,
                0,
                0,
                sBerryCrushTextColorTable[1],
                0,
                PLAYER_UNK14(r6, r7)
            );
        }
        else
        {
            AddTextPrinterParameterized4(
                r6->unk138.unk83[r7],
                2,
                36 - GetStringWidth(2, PLAYER_UNK14(r6, r7), 0) / 2u,
                1,
                0,
                0,
                sBerryCrushTextColorTable[2],
                0,
                PLAYER_UNK14(r6, r7)
            );
        }
        CopyWindowToVram(r6->unk138.unk83[r7], 3);
    }
    CopyBgTilemapBufferToVram(0);
}

static void sub_814EC80(struct BerryCrushGame * r6)
{
    u8 r5 = 0;
    const u32 *r0 = gUnknown_8EB0ADC;
#ifndef NONMATCHING // r4, r5, r6 register roulette
    register u8 *r4 asm("r4") = gDecompressionBuffer;
    register u32 r0_ asm("r0");
#else
    u8 *r4 = gDecompressionBuffer;
    u32 r0_;
#endif

    LZ77UnCompWram(r0, r4);
    for (; r5 < r6->unk9; ++r5)
    {
        r0_ = r6->unk138.unkC[r5]->unk0;
        CopyToBgTilemapBufferRect(
            3,
            &r4[r0_ * 40],
            r6->unk138.unkC[r5]->unk1,
            r6->unk138.unkC[r5]->unk2,
            10,
            2
        );
    }
    CopyBgTilemapBufferToVram(3);
}

static void sub_814ECE0(struct BerryCrushGame * r6)
{
    u8 r5 = 0;
    u8 r2;

    r6->unk2A = -104;
    r6->unk2C = 0;
    gSpriteCoordOffsetX = 0;
    gSpriteCoordOffsetY = -104;
    for (; r5 < 4; ++r5)
        LoadCompressedSpriteSheet(&gUnknown_846F2F8[r5]);
    LoadSpritePalettes(gUnknown_846F320);
    r2 = CreateSprite(&gUnknown_846F410, 120, 88, 5);
    r6->unk138.unk20 = &gSprites[r2];
    r6->unk138.unk20->oam.priority = 3;
    r6->unk138.unk20->coordOffsetEnabled = TRUE;
    r6->unk138.unk20->animPaused = TRUE;
    for (r5 = 0; r5 < r6->unk9; ++r5)
    {
        r2 = CreateSprite(
            &gUnknown_846F428,
            r6->unk138.unkC[r5]->unk4 + 120,
            r6->unk138.unkC[r5]->unk6 + 32,
            0
        );
        r6->unk138.unk24[r5] = &gSprites[r2];
        r6->unk138.unk24[r5]->oam.priority = 1;
        r6->unk138.unk24[r5]->invisible = TRUE;
        r6->unk138.unk24[r5]->coordOffsetEnabled = TRUE;
        r6->unk138.unk24[r5]->animPaused = TRUE;
    }
    for (r5 = 0; r5 < NELEMS(r6->unk138.unk4C); ++r5)
    {
        r2 = CreateSprite(
            &gUnknown_846F440,
            gUnknown_846F2D6[r5][0] + 120,
            gUnknown_846F2D6[r5][1] + 136,
            6
        );
        r6->unk138.unk4C[r5] = &gSprites[r2];
        r6->unk138.unk4C[r5]->oam.priority = 3;
        r6->unk138.unk4C[r5]->invisible = TRUE;
        r6->unk138.unk4C[r5]->animPaused = TRUE;
        r6->unk138.unk4C[r5]->data[0] = r5;
    }
    for (r5 = 0; r5 < NELEMS(r6->unk138.unk78); ++r5)
    {
        r2 = CreateSprite(
            &gUnknown_846F458,
            24 * r5 + 176,
            8,
            0
        );
        r6->unk138.unk78[r5] = &gSprites[r2];
        r6->unk138.unk78[r5]->oam.priority = 0;
        r6->unk138.unk78[r5]->invisible = FALSE;
        r6->unk138.unk78[r5]->animPaused = FALSE;
    }
    DigitObjUtil_CreatePrinter(0, 0, &gUnknown_846F488[0]);
    DigitObjUtil_CreatePrinter(1, 0, &gUnknown_846F488[1]);
    DigitObjUtil_CreatePrinter(2, 0, &gUnknown_846F488[2]);
    if (r6->unk12 == 1)
        sub_814EB04(&r6->unk138);
}

static void sub_814EF10(struct BerryCrushGame * r5)
{
    u8 r4 = 0;

    FreeSpriteTilesByTag(4);
    FreeSpriteTilesByTag(3);
    FreeSpriteTilesByTag(2);
    FreeSpriteTilesByTag(1);
    FreeSpritePaletteByTag(4);
    FreeSpritePaletteByTag(2);
    FreeSpritePaletteByTag(1);
    for (; r4 < NELEMS(r5->unk138.unk78); ++r4)
        DestroySprite(r5->unk138.unk78[r4]);
    DigitObjUtil_DeletePrinter(2);
    DigitObjUtil_DeletePrinter(1);
    DigitObjUtil_DeletePrinter(0);
    for (r4 = 0; r4 < NELEMS(r5->unk138.unk4C); ++r4)
        DestroySprite(r5->unk138.unk4C[r4]);
    for (r4 = 0; r4 < r5->unk9; ++r4)
        DestroySprite(r5->unk138.unk24[r4]);
    if (r5->unk138.unk20->inUse)
        DestroySprite(r5->unk138.unk20);
}

static void sub_814EFD0(struct Sprite * sprite)
{
    if (sprite->animEnded)
    {
        sprite->invisible = TRUE;
        sprite->animPaused = TRUE;
    }
}

static void sub_814EFFC(struct Sprite * sprite)
{
    u8 r1 = 0;
    SpriteCallback r5 = SpriteCallbackDummy;

    for (; r1 < NELEMS(sprite->data); ++r1)
        sprite->data[r1] = 0;
    sprite->pos2.x = 0;
    sprite->pos2.y = 0;
    sprite->invisible = TRUE;
    sprite->animPaused = TRUE;
    sprite->callback = r5;
}

static void sub_814F044(struct Sprite * sprite)
{
    s16 *r4 = sprite->data;

    r4[1] += r4[2];
    sprite->pos2.y += r4[1] >> 8;
    if (r4[7] & 0x8000)
    {
        sprite->data[0] += r4[3];
        r4[4] += r4[5];
        sprite->pos2.x = Sin(r4[4] >> 7, r4[6]);
        if (r4[7] & 0x8000 && r4[4] >> 7 > 126)
        {
            sprite->pos2.x = 0;
            r4[7] &= 0x7FFF;
        }
    }
    sprite->pos1.x = r4[0] >> 7;
    if (sprite->pos1.y + sprite->pos2.y > (r4[7] & 0x7FFF))
        sprite->callback = sub_814EFFC;
}

static void sub_814F0D8(struct Sprite * sprite)
{
    s16 *r7 = sprite->data;
    s16 r4, r5;
    s32 r2;
    u32 r8 = 0;

    r2 = 640;
    r7[1] = r2;
    r7[2] = 32;
    r7[7] = 168;
    r4 = sprite->pos2.x * 128;
    r5 = sub_80D8B40(7, (168 - sprite->pos1.y) << 7, (r2 + 32) >> 1);
    sprite->data[0] = sprite->pos1.x << 7;
    r7[3] = sub_80D8B40(7, r4, r5);
    r2 = sub_80D8ABC(7, r5, 85);
    r7[4] = r8;
    r7[5] = sub_80D8B40(7, 0x3F80, r2);
    r7[6] = sprite->pos2.x / 4;
    r7[7] |= 0x8000;
    sprite->pos2.y = r8;
    sprite->pos2.x = r8;
    sprite->callback = sub_814F044;
    sprite->animPaused = FALSE;
    sprite->invisible = FALSE;
}
