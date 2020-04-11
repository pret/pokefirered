#include "global.h"
#include "gflib.h"
#include "battle_anim.h"
#include "berry.h"
#include "berry_crush.h"
#include "decompress.h"
#include "digit_obj_util.h"
#include "dynamic_placeholder_text_util.h"
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

static const struct BgTemplate sBgTemplates[] = {
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

static const struct CompressedSpriteSheet sSpriteSheets[] = {
    {gUnknown_846E4D0, 0x0800, 1},
    {gUnknown_846E7FC, 0x0e00, 2},
    {gUnknown_846EB78, 0x0700, 3},
    {gUnknown_846ECC4, 0x02c0, 4},
    {}
};

static const struct SpritePalette sSpritePals[] = {
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

static const struct DigitObjUtilTemplate sDigitObjTemplates[] = {
    {
        .strConvMode = 1,
        .shape = SPRITE_SHAPE(8x16),
        .size = SPRITE_SIZE(8x16),
        .priority = 0,
        .oamCount = 2,
        .xDelta = 8,
        .x = 156,
        .y = 0,
        .spriteSheet = {.compressed = &sSpriteSheets[3]},
        .spritePal = &sSpritePals[2],
    }, {
        .strConvMode = 0,
        .shape = SPRITE_SHAPE(8x16),
        .size = SPRITE_SIZE(8x16),
        .priority = 0,
        .oamCount = 2,
        .xDelta = 8,
        .x = 180,
        .y = 0,
        .spriteSheet = {.compressed = &sSpriteSheets[3]},
        .spritePal = &sSpritePals[2],
    }, {
        .strConvMode = 0,
        .shape = SPRITE_SHAPE(8x16),
        .size = SPRITE_SIZE(8x16),
        .priority = 0,
        .oamCount = 2,
        .xDelta = 8,
        .x = 204,
        .y = 0,
        .spriteSheet = {.compressed = &sSpriteSheets[3]},
        .spritePal = &sSpritePals[2],
    }
};

static const u8 *const sBCRankingHeaders[] = {
    gText_SpaceTimes,
    gText_XDotY,
    gText_StrVar1Berry,
    gText_NeatnessRankings,
    gText_CooperativeRankings,
    gText_PressingPowerRankings
};

int BerryCrush_InitBgs(void)
{
    struct BerryCrushGame * game = GetBerryCrushGame();
    if (game == NULL)
        return -1;

    switch (game->cmdState)
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
        ResetBgsAndClearDma3BusyFlags(FALSE);
        InitBgsFromTemplates(0, sBgTemplates, NELEMS(sBgTemplates));
        SetBgTilemapBuffer(1, game->bg1Buffer);
        SetBgTilemapBuffer(2, game->bg2Buffer);
        SetBgTilemapBuffer(3, game->bg3Buffer);
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
        sub_814EB38(game);
        sub_814EBB0(game);
        gPaletteFade.bufferTransferDisabled = TRUE;
        break;
    case 7:
        LoadPalette(gUnknown_8EAFEA0, 0, 0x180);
        CopyToBgTilemapBuffer(1, gBerryCrushGrinderTopTilemap, 0, 0);
        CopyToBgTilemapBuffer(2, gBerryCrushContainerCapTilemap, 0, 0);
        CopyToBgTilemapBuffer(3, gBerryCrushBackgroundTilemap, 0, 0);
        sub_814EC80(game);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(3);
        break;
    case 8:
        LoadWirelessStatusIndicatorSpriteGfx();
        CreateWirelessStatusIndicatorSprite(0,  0);
        sub_814ECE0(game);
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
        BerryCrush_SetVBlankCallback();
        game->cmdState = 0;
        return 1;
    }

    game->cmdState++;
    return 0;
}

int BerryCrush_TeardownBgs(void)
{
    struct BerryCrushGame * var0 = GetBerryCrushGame();
    if (!var0)
        return -1;

    switch (var0->cmdState)
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
        var0->cmdState = 0;
        return 1;
    }

    var0->cmdState++;
    return 0;
}

int sub_814D9CC(struct BerryCrushGame * game)
{
    gSpriteCoordOffsetY = game->unk2A + game->unk2C;
    SetGpuReg(REG_OFFSET_BG1VOFS, -gSpriteCoordOffsetY);
    if (game->unk12 == 7)
    {
        sub_814EAD4(&game->unk138, game->unk28);
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

    for (i = 0; i < arg0->playerCount; i++)
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
    for (i = 0; i < arg0->playerCount; i++)
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
    for (i = 0; i < arg0->playerCount; i++)
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

    for (i = 0; i < arg0->playerCount; i++)
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

static void sub_814DFA4(struct BerryCrushGame * game, u8 command, u8 x, u8 y)
{
    u8 i = 0;
    u8 linkPlayerId = 0;
    u8 linkIdToPrint = 0;
    u8 j;
    s32 score;
    u8 realX;
    union BerryCrushGame_68 * bcPlayers = &game->unk68;
    s32 realX2;

    for (; i < game->playerCount; i++)
    {
        DynamicPlaceholderTextUtil_Reset();
        switch (command)
        {
        case 0:
            linkPlayerId = bcPlayers->as_five_players.players[0].unk4.as_2d_bytes[command][i];
            if (i != 0 && bcPlayers->as_four_players.unk00.unk0C[command][i] != bcPlayers->as_four_players.unk00.unk0C[command][i - 1])
            {
                linkIdToPrint = i;
            }
            ConvertIntToDecimalStringN(gStringVar1, bcPlayers->as_four_players.unk00.unk0C[command][i], STR_CONV_MODE_RIGHT_ALIGN, 4);
            realX = x - GetStringWidth(2, sBCRankingHeaders[command], -1) - 4;
            AddTextPrinterParameterized3(game->unk138.unk82, 2, realX, y + 14 * i, sBerryCrushTextColorTable[0], 0, sBCRankingHeaders[command]);
            AddTextPrinterParameterized3(game->unk138.unk82, 2, realX - 24, y + 14 * i, sBerryCrushTextColorTable[0], 0, gStringVar1);
            break;
        case 1:
            linkPlayerId = bcPlayers->as_five_players.players[0].unk4.as_2d_bytes[command][i];
            if (i != 0 && bcPlayers->as_four_players.unk00.unk0C[command][i] != bcPlayers->as_four_players.unk00.unk0C[command][i - 1])
            {
                linkIdToPrint = i;
            }
            ConvertIntToDecimalStringN(gStringVar1, bcPlayers->as_four_players.unk00.unk0C[command][i] >> 4, STR_CONV_MODE_RIGHT_ALIGN, 3);
            score = 0;
            realX = bcPlayers->as_four_players.unk00.unk0C[command][i] & 15;
            for (j = 0; j < 4; j++)
            {
                if ((realX >> (3 - j)) & 1)
                    score += gUnknown_846E450[j];
            }
            realX = score / 1000000u;
            ConvertIntToDecimalStringN(gStringVar2, realX, STR_CONV_MODE_LEADING_ZEROS, 2);
            StringExpandPlaceholders(gStringVar4, sBCRankingHeaders[command]);
            realX2 = x - 4;
            AddTextPrinterParameterized3(game->unk138.unk82, 2, realX2 - GetStringWidth(2, gStringVar4, 0), y + 14 * i, sBerryCrushTextColorTable[0], 0, gStringVar4);
            break;
        case 2:
            linkPlayerId = i;
            linkIdToPrint = i;
            j = game->unk68.as_five_players.players[i].unk14[12];
            if (j >= LAST_BERRY_INDEX - FIRST_BERRY_INDEX + 2)
                j = 0;
            StringCopy(gStringVar1, gBerries[j].name);
            StringExpandPlaceholders(gStringVar4, sBCRankingHeaders[command]);
            AddTextPrinterParameterized3(game->unk138.unk82, 2, x - GetStringWidth(2, gStringVar4, -1) - 4, y + 14 * i, sBerryCrushTextColorTable[0], 0, gStringVar4);
            break;
        }
        if (linkPlayerId == game->localId)
            StringCopy(gStringVar3, gText_1_ClrLtGryShdwBlk_Dynamic0);
        else
            StringCopy(gStringVar3, gText_1_Dynamic0);
        gStringVar3[0] = linkIdToPrint + CHAR_1;
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, BERRYCRUSH_PLAYER_NAME(game, linkPlayerId));
        DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gStringVar3);
        AddTextPrinterParameterized3(game->unk138.unk82, 2, 4, y + 14 * i, sBerryCrushTextColorTable[0], 0, gStringVar4);
    }
}

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
        r5 = r4->playerCount - 2;
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
        r5 = r4->playerCount - 2;
        switch (r4->unk12)
        {
        case 11:
            sub_814DF44(r6->unk82, 22, 3, gText_PressesRankings);
            sub_814DFA4(r4, 0, 0xB0, 8 * gUnknown_846E448[0][r5] - r4->playerCount * 14);
            r6->unk80 = 5;
            return FALSE;
        case 12:
            sub_814DF44(r6->unk82, 22, 4, sBCRankingHeaders[r4->unk68.as_five_players.players[0].unk4.as_2d_bytes[0][7] + 3]);
            sub_814DFA4(r4, 1, 0xB0, 8 * gUnknown_846E448[0][r5] - r4->playerCount * 14);
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
        CopyWindowToVram(r6->unk82, COPYWIN_BOTH);
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
        CopyWindowToVram(data[1], COPYWIN_BOTH);
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

static void sub_814EB38(struct BerryCrushGame * game)
{
    u8 i;

    for (i = 0; i < game->playerCount; ++i)
    {
        game->unk138.unkC[i] = &gUnknown_846F294[gUnknown_846F280[game->playerCount - 2][i]];
        game->unk138.unk83[i] = AddWindow(&gUnknown_846E3F8[game->unk138.unkC[i]->unk0]);
        PutWindowTilemap(game->unk138.unk83[i]);
        FillWindowPixelBuffer(game->unk138.unk83[i], PIXEL_FILL(0));
    }
}

static void sub_814EBB0(struct BerryCrushGame * game)
{
    u8 i;

    for (i = 0; i < game->playerCount; ++i)
    {
        PutWindowTilemap(game->unk138.unk83[i]);
        if (i == game->localId)
        {
            AddTextPrinterParameterized4(
                game->unk138.unk83[i],
                2,
                36 - GetStringWidth(2, BERRYCRUSH_PLAYER_NAME(game, i), 0) / 2u,
                1,
                0,
                0,
                sBerryCrushTextColorTable[1],
                0,
                BERRYCRUSH_PLAYER_NAME(game, i)
            );
        }
        else
        {
            AddTextPrinterParameterized4(
                game->unk138.unk83[i],
                2,
                36 - GetStringWidth(2, BERRYCRUSH_PLAYER_NAME(game, i), 0) / 2u,
                1,
                0,
                0,
                sBerryCrushTextColorTable[2],
                0,
                BERRYCRUSH_PLAYER_NAME(game, i)
            );
        }
        CopyWindowToVram(game->unk138.unk83[i], COPYWIN_BOTH);
    }
    CopyBgTilemapBufferToVram(0);
}

static void sub_814EC80(struct BerryCrushGame * game)
{
    u8 i = 0;
    const u32 *r0 = gUnknown_8EB0ADC;
#ifndef NONMATCHING // r4, i, game register roulette
    register u8 *r4 asm("r4") = gDecompressionBuffer;
    register u32 r0_ asm("r0");
#else
    u8 *r4 = gDecompressionBuffer;
    u32 r0_;
#endif

    LZ77UnCompWram(r0, r4);
    for (; i < game->playerCount; ++i)
    {
        r0_ = game->unk138.unkC[i]->unk0;
        CopyToBgTilemapBufferRect(
            3,
            &r4[r0_ * 40],
            game->unk138.unkC[i]->unk1,
            game->unk138.unkC[i]->unk2,
            10,
            2
        );
    }
    CopyBgTilemapBufferToVram(3);
}

static void sub_814ECE0(struct BerryCrushGame * game)
{
    u8 i = 0;
    u8 spriteId;

    game->unk2A = -104;
    game->unk2C = 0;
    gSpriteCoordOffsetX = 0;
    gSpriteCoordOffsetY = -104;
    for (; i < 4; ++i)
        LoadCompressedSpriteSheet(&sSpriteSheets[i]);
    LoadSpritePalettes(sSpritePals);
    spriteId = CreateSprite(&gUnknown_846F410, 120, 88, 5);
    game->unk138.unk20 = &gSprites[spriteId];
    game->unk138.unk20->oam.priority = 3;
    game->unk138.unk20->coordOffsetEnabled = TRUE;
    game->unk138.unk20->animPaused = TRUE;
    for (i = 0; i < game->playerCount; ++i)
    {
        spriteId = CreateSprite(
            &gUnknown_846F428,
            game->unk138.unkC[i]->unk4 + 120,
            game->unk138.unkC[i]->unk6 + 32,
            0
        );
        game->unk138.unk24[i] = &gSprites[spriteId];
        game->unk138.unk24[i]->oam.priority = 1;
        game->unk138.unk24[i]->invisible = TRUE;
        game->unk138.unk24[i]->coordOffsetEnabled = TRUE;
        game->unk138.unk24[i]->animPaused = TRUE;
    }
    for (i = 0; i < NELEMS(game->unk138.unk4C); ++i)
    {
        spriteId = CreateSprite(
            &gUnknown_846F440,
            gUnknown_846F2D6[i][0] + 120,
            gUnknown_846F2D6[i][1] + 136,
            6
        );
        game->unk138.unk4C[i] = &gSprites[spriteId];
        game->unk138.unk4C[i]->oam.priority = 3;
        game->unk138.unk4C[i]->invisible = TRUE;
        game->unk138.unk4C[i]->animPaused = TRUE;
        game->unk138.unk4C[i]->data[0] = i;
    }
    for (i = 0; i < NELEMS(game->unk138.unk78); ++i)
    {
        spriteId = CreateSprite(
            &gUnknown_846F458,
            24 * i + 176,
            8,
            0
        );
        game->unk138.unk78[i] = &gSprites[spriteId];
        game->unk138.unk78[i]->oam.priority = 0;
        game->unk138.unk78[i]->invisible = FALSE;
        game->unk138.unk78[i]->animPaused = FALSE;
    }
    DigitObjUtil_CreatePrinter(0, 0, &sDigitObjTemplates[0]);
    DigitObjUtil_CreatePrinter(1, 0, &sDigitObjTemplates[1]);
    DigitObjUtil_CreatePrinter(2, 0, &sDigitObjTemplates[2]);
    if (game->unk12 == 1)
        sub_814EB04(&game->unk138);
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
    for (r4 = 0; r4 < r5->playerCount; ++r4)
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
