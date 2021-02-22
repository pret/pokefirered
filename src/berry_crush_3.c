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

static void FramesToMinSec(struct BerryCrushGame_138 * arg0, u16 arg1);
static void PrintTextCentered(u8 windowId, u8 left, u8 colorId, const u8 *string);
static void PrintBerryCrushResultWindow(struct BerryCrushGame * sp0C, u8 sp10, u8 sp14, u8 r3);
static void sub_814E32C(struct BerryCrushGame * r8);
static void Task_ShowBerryCrushRankings(u8 r4);
static void BerryCrush_PrintTimeOnSprites(struct BerryCrushGame_138 * r4, u16 r1);
static void sub_814EB38(struct BerryCrushGame * r5);
static void sub_814EBB0(struct BerryCrushGame * r6);
static void sub_814EC80(struct BerryCrushGame * r6);
static void sub_814ECE0(struct BerryCrushGame * r6);
static void sub_814EF10(struct BerryCrushGame * r5);
static void SpriteCB_BerryCrushImpact(struct Sprite * sprite);
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

static const struct WindowTemplate sWindowTemplate_BerryCrushRankings = {
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

static const u32 sPressingSpeedConversionTable[] = {
    // Decimal point is vertically aligned with the pixel
    // directly between the >< below.
    50000000, // 50
    25000000, // 25
    12500000, // 12.5
     6250000, //  6.25
     3125000, //  3.125
     1562500, //  1.5625
      781250, //  0.78125
      390625  //  0.390625
};

static const u16 sBerryCrushCorePal[] = INCBIN_U16("graphics/link_games/unk_846E4D0.gbapal");
static const u16 sBerryCrushImpactAndSparklesPal[] = INCBIN_U16("graphics/link_games/unk_846E7FC.gbapal");
static const u16 sBerryCrushTImerPal[] = INCBIN_U16("graphics/link_games/unk_846ECC4.gbapal");

static const u32 sBerryCrushCoreTiles[] = INCBIN_U32("graphics/link_games/unk_846E4D0.4bpp.lz");
static const u32 sBerryCrushImpactTiles[] = INCBIN_U32("graphics/link_games/unk_846E7FC.4bpp.lz");
static const u32 sBerryCrushPowderSparklesTiles[] = INCBIN_U32("graphics/link_games/unk_846EB78.4bpp.lz");
static const u32 sBerryCrushTimerTiles[] = INCBIN_U32("graphics/link_games/unk_846ECC4.4bpp.lz");

static const u32 gBerryCrushGrinderTopTilemap[] = INCBIN_U32("graphics/link_games/unk_846ED90.bin.lz");
static const u32 gBerryCrushContainerCapTilemap[] = INCBIN_U32("graphics/link_games/unk_846EEC0.bin.lz");
static const u32 gBerryCrushBackgroundTilemap[] = INCBIN_U32("graphics/link_games/unk_846F058.bin.lz");

static const u8 gUnknown_846F280[][5] = {
    {1, 3},
    {0, 1, 3},
    {1, 3, 2, 4},
    {0, 1, 3, 2, 4}
};

static const struct BerryCrushPlayerSeatCoords gUnknown_846F294[] = {
    {0, 0, 0, 0, -16, 0, 0},
    {1, 0, 3, -28, -4, -24, 16},
    {2, 0, 6, -16, 20, -8, 16},
    {3, 20, 3, 28, -4, 32, -8},
    {4, 20, 6, 16, 20, 16, -8}
};

static const s8 gUnknown_846F2D0[][2] = {
    { 0,  0},
    {-1,  0},
    { 1,  1}
};

static const s8 gUnknown_846F2D6[][2] = {
    {  0,   0},
    {-16,  -4},
    { 16,  -4},
    { -8,  -2},
    {  8,  -2},
    {-24,  -8},
    { 24,  -8},
    {-32, -12},
    { 32, -12},
    {-40, -16},
    { 40, -16}
};

static const u16 sPlayerBerrySpriteTags[] = {
    5, 6, 7, 8, 9
};

static const struct CompressedSpriteSheet sSpriteSheets[] = {
    {sBerryCrushCoreTiles, 0x0800, 1},
    {sBerryCrushImpactTiles, 0x0e00, 2},
    {sBerryCrushPowderSparklesTiles, 0x0700, 3},
    {sBerryCrushTimerTiles, 0x02c0, 4},
    {}
};

static const struct SpritePalette sSpritePals[] = {
    {sBerryCrushCorePal, 1},
    {sBerryCrushImpactAndSparklesPal, 2},
    {sBerryCrushTImerPal, 4},
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

static const union AnimCmd *const sAnimTable_BerryCrushCore[] = {
    gUnknown_846F340
};

static const union AnimCmd *const sAnimTable_BerryCrushImpact[] = {
    gUnknown_846F348,
    gUnknown_846F358
};

static const union AnimCmd *const sAnimTable_BerryCrushPowderSparkles[] = {
    gUnknown_846F36C,
    gUnknown_846F388
};

static const union AnimCmd *const sAnimTable_BerryCrushTimer[] = {
    gUnknown_846F3AC
};

static const union AnimCmd *const gUnknown_846F404[] = {
    gUnknown_846F3B4
};

static const union AffineAnimCmd *const gUnknown_846F408[] = {
    gUnknown_846F3BC,
    gUnknown_846F3D4
};


static const struct SpriteTemplate sSpriteTemplate_BerryCrushCore = {
    .tileTag = 1,
    .paletteTag = 1,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sAnimTable_BerryCrushCore,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct SpriteTemplate sSpriteTemplate_BerryCrushImpact = {
    .tileTag = 2,
    .paletteTag = 2,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sAnimTable_BerryCrushImpact,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_BerryCrushImpact
};

static const struct SpriteTemplate sSpriteTemplate_BerryCrushPowderSparkles = {
    .tileTag = 3,
    .paletteTag = 2,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = sAnimTable_BerryCrushPowderSparkles,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct SpriteTemplate sSpriteTemplate_BerryCrushTimer = {
    .tileTag = 4,
    .paletteTag = 4,
    .oam = &gOamData_AffineOff_ObjNormal_8x16,
    .anims = sAnimTable_BerryCrushTimer,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct SpriteTemplate sSpriteTemplate_PlayerBerry = {
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
        SetBgTilemapBuffer(1, game->spritesManager.unk88[0]);
        SetBgTilemapBuffer(2, game->spritesManager.unk88[2]);
        SetBgTilemapBuffer(3, game->spritesManager.unk88[3]);
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
    gSpriteCoordOffsetY = game->depth + game->vibration;
    SetGpuReg(REG_OFFSET_BG1VOFS, -gSpriteCoordOffsetY);
    if (game->gameState == 7)
    {
        BerryCrush_PrintTimeOnSprites(&game->spritesManager, game->timer);
    }

    return 0;
}

void sub_814DA04(struct BerryCrushGame * game)
{
    game->depth = -104;
    game->vibration = 0;
    gSpriteCoordOffsetX = 0;
    gSpriteCoordOffsetY = -104;
}

void BerryCrush_CreateBerrySprites(struct BerryCrushGame * game, struct BerryCrushGame_138 * spritesManager)
{
    u8 i;
    u8 spriteId;
    s16 var0, var1;
    s16 *data;
    int var3;
    s16 var5;
    u32 var6;

    for (i = 0; i < game->playerCount; i++)
    {
        spriteId = AddItemIconObjectWithCustomObjectTemplate(
            &sSpriteTemplate_PlayerBerry,
            sPlayerBerrySpriteTags[i],
            sPlayerBerrySpriteTags[i],
            game->unk98[i].berryId + FIRST_BERRY_INDEX);
        spritesManager->berrySprites[i] = &gSprites[spriteId];
        spritesManager->berrySprites[i]->oam.priority = 3;
        spritesManager->berrySprites[i]->affineAnimPaused = TRUE;
        spritesManager->berrySprites[i]->pos1.x = spritesManager->seatCoords[i]->unk8 + 120;
        spritesManager->berrySprites[i]->pos1.y = -16;
        data = spritesManager->berrySprites[i]->data;
        var5 = 512;
        data[1] = var5;
        data[2] = 32;
        data[7] = 112;
        var0 = spritesManager->seatCoords[i]->unkA - spritesManager->seatCoords[i]->unk8;
        var3 = var0;
        if (var0 < 0)
            var3 += 3;

        data[6] = var3 >> 2;
        var0 *= 128;
        var6 = var5 + 32;
        var6 = var6 / 2;
        var1 = MathUtil_Div16Shift(7, 0x3F80, var6);
        data[0] = (u16)spritesManager->berrySprites[i]->pos1.x * 128;
        data[3] = MathUtil_Div16Shift(7, var0, var1);
        var1 = MathUtil_Mul16Shift(7, var1, 85);
        data[4] = 0;
        data[5] = MathUtil_Div16Shift(7, 0x3F80, var1);
        data[7] |= 0x8000;
        if (spritesManager->seatCoords[i]->unk8 < 0)
            StartSpriteAffineAnim(spritesManager->berrySprites[i], 1);
    }
}

void SpriteCB_DropBerryIntoCrusher(struct Sprite * sprite)
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

void BerryCrushFreeBerrySpriteGfx(struct BerryCrushGame * arg0, UNUSED struct BerryCrushGame_138 * arg1)
{
    u8 i;
    for (i = 0; i < arg0->playerCount; i++)
    {
        FreeSpritePaletteByTag(sPlayerBerrySpriteTags[i]);
        FreeSpriteTilesByTag(sPlayerBerrySpriteTags[i]);
    }
}

void sub_814DC5C(struct BerryCrushGame * game, struct BerryCrushGame_138 * manager)
{
    u8 sp4;
    struct BerryCrushGame_4E * var4E;
    u8 i;
    u16 var, var2;

    sp4 = 0;
    var4E = (struct BerryCrushGame_4E *)&game->recvCmd;
    for (i = 0; i < game->playerCount; i++)
    {
        var = var4E->unkA >> (i * 3);
        var &= 7;
        if (var)
        {
            sp4++;
            if (var & 0x4)
                StartSpriteAnim(manager->impactSprites[i], 1);
            else
                StartSpriteAnim(manager->impactSprites[i], 0);

            manager->impactSprites[i]->invisible = FALSE;
            manager->impactSprites[i]->animPaused = FALSE;
            manager->impactSprites[i]->pos2.x = gUnknown_846F2D0[(var % 4) - 1][0];
            manager->impactSprites[i]->pos2.y = gUnknown_846F2D0[(var % 4) - 1][1];
        }
    }

    if (sp4 == 0)
    {
        game->unk25_2 = 0;
    }
    else
    {
        var = (u8)(game->timer % 3);
        var2 = var;
        for (i = 0; i < var4E->unkC * 2 + 3; i++)
        {
            if (manager->sparkleSprites[i]->invisible)
            {
                manager->sparkleSprites[i]->callback = sub_814F0D8;
                manager->sparkleSprites[i]->pos1.x = gUnknown_846F2D6[i][0] + 120;
                manager->sparkleSprites[i]->pos1.y = gUnknown_846F2D6[i][1] + 136 - (var * 4);
                manager->sparkleSprites[i]->pos2.x = gUnknown_846F2D6[i][0] + (gUnknown_846F2D6[i][0] / (var2 * 4));
                manager->sparkleSprites[i]->pos2.y = gUnknown_846F2D6[i][1];
                if (var4E->unk4_1)
                    StartSpriteAnim(manager->sparkleSprites[i], 1);
                else
                    StartSpriteAnim(manager->sparkleSprites[i], 0);

                var++;
                if (var > 3)
                    var = 0;
            }
        }

        if (game->unk25_2)
        {
            game->unk25_2 = 0;
        }
        else
        {
            if (sp4 == 1)
                PlaySE(SE_MUD_BALL);
            else
                PlaySE(SE_BREAKABLE_DOOR);

            game->unk25_2 = 1;
        }
    }
}

bool32 sub_814DE50(struct BerryCrushGame * arg0, struct BerryCrushGame_138 * arg1)
{
    u8 i;

    for (i = 0; i < arg0->playerCount; i++)
    {
        if (!arg1->impactSprites[i]->invisible)
            return FALSE;
    }

    for (i = 0; i < 11; i++)
    {
        if (!arg1->sparkleSprites[i]->invisible)
            return FALSE;
    }

    if (arg0->vibration != 0)
        arg0->vibration = 0;

    return TRUE;
}

static void FramesToMinSec(struct BerryCrushGame_138 * manager, u16 frames)
{
    u8 i = 0;
    u32 fractionalFrames = 0;
    s16 r3 = 0;

    manager->minutes = frames / 3600;
    manager->secondsInt = (frames % 3600) / 60;
    r3 = MathUtil_Mul16((frames % 60) << 8, 4);

    for (i = 0; i < 8; i++)
    {
        if ((r3 >> (7 - i)) & 1)
            fractionalFrames += sPressingSpeedConversionTable[i];
    }

    manager->secondsFrac = fractionalFrames / 1000000;
}

static void PrintTextCentered(u8 windowId, u8 left, u8 colorId, const u8 *string)
{
    left = (left * 4) - (GetStringWidth(2, string, -1) / 2u);
    AddTextPrinterParameterized3(windowId, 2, left, 0, sBerryCrushTextColorTable[colorId], 0, string);
}

static void PrintBerryCrushResultWindow(struct BerryCrushGame * game, u8 command, u8 x, u8 y)
{
    u8 i = 0;
    u8 linkPlayerId = 0;
    u8 linkIdToPrint = 0;
    u8 j;
    s32 score;
    u8 realX;
    struct BerryCrushGame_68 * bcPlayers = &game->unk68;
    s32 realX2;

    for (; i < game->playerCount; i++)
    {
        DynamicPlaceholderTextUtil_Reset();
        switch (command)
        {
        case 0:
            // Number of presses
            linkPlayerId = bcPlayers->unk20[command][i];
            if (i != 0 && bcPlayers->unk20[command][i] != bcPlayers->unk20[command][i - 1])
            {
                linkIdToPrint = i;
            }
            ConvertIntToDecimalStringN(gStringVar1, bcPlayers->unk0C[command][i], STR_CONV_MODE_RIGHT_ALIGN, 4);
            realX = x - GetStringWidth(2, sBCRankingHeaders[command], -1) - 4;
            AddTextPrinterParameterized3(game->spritesManager.unk82, 2, realX, y + 14 * i, sBerryCrushTextColorTable[0], 0, sBCRankingHeaders[command]);
            AddTextPrinterParameterized3(game->spritesManager.unk82, 2, realX - 24, y + 14 * i, sBerryCrushTextColorTable[0], 0, gStringVar1);
            break;
        case 1:
            // Neatness
            linkPlayerId = bcPlayers->unk20[command][i];
            if (i != 0 && bcPlayers->unk0C[command][i] != bcPlayers->unk0C[command][i - 1])
            {
                linkIdToPrint = i;
            }
            ConvertIntToDecimalStringN(gStringVar1, bcPlayers->unk0C[command][i] >> 4, STR_CONV_MODE_RIGHT_ALIGN, 3);
            score = 0;
            realX = bcPlayers->unk0C[command][i] & 15;
            for (j = 0; j < 4; j++)
            {
                if ((realX >> (3 - j)) & 1)
                    score += sPressingSpeedConversionTable[j];
            }
            realX = score / 1000000u;
            ConvertIntToDecimalStringN(gStringVar2, realX, STR_CONV_MODE_LEADING_ZEROS, 2);
            StringExpandPlaceholders(gStringVar4, sBCRankingHeaders[command]);
            realX2 = x - 4;
            AddTextPrinterParameterized3(game->spritesManager.unk82, 2, realX2 - GetStringWidth(2, gStringVar4, 0), y + 14 * i, sBerryCrushTextColorTable[0], 0, gStringVar4);
            break;
        case 2:
            // Berry names
            linkPlayerId = i;
            linkIdToPrint = i;
            j = game->unk98[i].berryId;
            if (j >= LAST_BERRY_INDEX - FIRST_BERRY_INDEX + 2)
                j = 0;
            StringCopy(gStringVar1, gBerries[j].name);
            StringExpandPlaceholders(gStringVar4, sBCRankingHeaders[command]);
            AddTextPrinterParameterized3(game->spritesManager.unk82, 2, x - GetStringWidth(2, gStringVar4, -1) - 4, y + 14 * i, sBerryCrushTextColorTable[0], 0, gStringVar4);
            break;
        }
        if (linkPlayerId == game->localId)
            StringCopy(gStringVar3, gText_1_ClrLtGryShdwBlk_Dynamic0);
        else
            StringCopy(gStringVar3, gText_1_Dynamic0);
        gStringVar3[0] = linkIdToPrint + CHAR_1;
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, BERRYCRUSH_PLAYER_NAME(game, linkPlayerId));
        DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gStringVar3);
        AddTextPrinterParameterized3(game->spritesManager.unk82, 2, 4, y + 14 * i, sBerryCrushTextColorTable[0], 0, gStringVar4);
    }
}

static void sub_814E32C(struct BerryCrushGame * game)
{
    u8 i = 0;
    u8 x = 0;
    u32 score = 0;
    struct BerryCrushGame_68 *players = &game->unk68;
    u8 y = GetWindowAttribute(game->spritesManager.unk82, WINDOW_HEIGHT) * 8 - 42;

    FramesToMinSec(&game->spritesManager, players->time);
    AddTextPrinterParameterized3(game->spritesManager.unk82, 2, 2, y, sBerryCrushTextColorTable[0], 0, gText_TimeColon);

    x = 190 - (u8)GetStringWidth(2, gText_SpaceSec, 0);
    AddTextPrinterParameterized3(game->spritesManager.unk82, 2, x, y, sBerryCrushTextColorTable[0], 0, gText_SpaceSec);

    x -= 32;
    ConvertIntToDecimalStringN(gStringVar1, game->spritesManager.secondsInt, STR_CONV_MODE_LEADING_ZEROS, 2);
    ConvertIntToDecimalStringN(gStringVar2, game->spritesManager.secondsFrac, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringExpandPlaceholders(gStringVar4, gText_XDotY2);
    AddTextPrinterParameterized3(game->spritesManager.unk82, 2, x, y, sBerryCrushTextColorTable[0], 0, gStringVar4);

    x -= (u8)GetStringWidth(2, gText_SpaceMin, 0) + 3;
    AddTextPrinterParameterized3(game->spritesManager.unk82, 2, x, y, sBerryCrushTextColorTable[0], 0, gText_SpaceMin);

    x -= 9;
    ConvertIntToDecimalStringN(gStringVar1, game->spritesManager.minutes, STR_CONV_MODE_LEADING_ZEROS, 1);
    StringExpandPlaceholders(gStringVar4, gText_StrVar1);
    AddTextPrinterParameterized3(game->spritesManager.unk82, 2, x, y, sBerryCrushTextColorTable[0], 0, gStringVar4);

    y += 14;
    AddTextPrinterParameterized3(game->spritesManager.unk82, 2, 2, y, sBerryCrushTextColorTable[0], 0, gText_PressingSpeed);

    x = 190 - (u8)GetStringWidth(2, gText_TimesPerSec, 0);
    AddTextPrinterParameterized3(game->spritesManager.unk82, 3, x, y, sBerryCrushTextColorTable[0], 0, gText_TimesPerSec);

    for (i = 0; i < 8; ++i)
        if (((u8)game->pressingSpeed >> (7 - i)) & 1)
            score += *(i + sPressingSpeedConversionTable); // It's accessed in a different way here for unknown reason
    ConvertIntToDecimalStringN(gStringVar1, game->pressingSpeed >> 8, STR_CONV_MODE_RIGHT_ALIGN, 3);
    ConvertIntToDecimalStringN(gStringVar2, score / 1000000, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringExpandPlaceholders(gStringVar4, gText_XDotY3);
    x -= 38;
    if (game->unk25_1)
        AddTextPrinterParameterized3(game->spritesManager.unk82, 2, x, y, sBerryCrushTextColorTable[5], 0, gStringVar4);
    else
        AddTextPrinterParameterized3(game->spritesManager.unk82, 2, x, y, sBerryCrushTextColorTable[0], 0, gStringVar4);

    y += 14;
    AddTextPrinterParameterized3(game->spritesManager.unk82, 2, 2, y, sBerryCrushTextColorTable[0], 0, gText_Silkiness);

    ConvertIntToDecimalStringN(gStringVar1, players->unk08, STR_CONV_MODE_RIGHT_ALIGN, 3);
    StringExpandPlaceholders(gStringVar4, gText_Var1Percent);
    x = 190 - (u8)GetStringWidth(2, gStringVar4, 0);
    AddTextPrinterParameterized3(game->spritesManager.unk82, 2, x, y, sBerryCrushTextColorTable[0], 0, gStringVar4);
}

bool32 sub_814E644(struct BerryCrushGame * game, struct BerryCrushGame_138 * spriteManager)
{
    u8 playerCountMinus2;
    struct WindowTemplate template;

    switch (spriteManager->unk80)
    {
    case 0:
        playerCountMinus2 = game->playerCount - 2;
        BerryCrush_HideTimerSprites(spriteManager);
        memcpy(&template, &gUnknown_846E428[game->gameState - 11], sizeof(struct WindowTemplate));
        if (game->gameState == 13)
            template.height = gUnknown_846E448[1][playerCountMinus2];
        else
            template.height = gUnknown_846E448[0][playerCountMinus2];
        spriteManager->unk82 = AddWindow(&template);
        break;
    case 1:
        PutWindowTilemap(spriteManager->unk82);
        FillWindowPixelBuffer(spriteManager->unk82, PIXEL_FILL(0));
        break;
    case 2:
        TextWindow_SetStdFrame0_WithPal(spriteManager->unk82, 0x21D, 0xD0);
        DrawStdFrameWithCustomTileAndPalette(spriteManager->unk82, FALSE, 541, 13);
        break;
    case 3:
        playerCountMinus2 = game->playerCount - 2;
        switch (game->gameState)
        {
        case 11:
            PrintTextCentered(spriteManager->unk82, 22, 3, gText_PressesRankings);
            PrintBerryCrushResultWindow(game, 0, 0xB0, 8 * gUnknown_846E448[0][playerCountMinus2] - game->playerCount * 14);
            spriteManager->unk80 = 5;
            return FALSE;
        case 12:
            PrintTextCentered(spriteManager->unk82, 22, 4, sBCRankingHeaders[game->unk68.unk20[0][7] + 3]);
            PrintBerryCrushResultWindow(game, 1, 0xB0, 8 * gUnknown_846E448[0][playerCountMinus2] - game->playerCount * 14);
            spriteManager->unk80 = 5;
            return FALSE;
        case 13:
            PrintTextCentered(spriteManager->unk82, 24, 3, gText_CrushingResults);
            PrintBerryCrushResultWindow(game, 2, 0xC0, 0x10);
            break;
        }
        break;
    case 4:
        sub_814E32C(game);
        break;
    case 5:
        CopyWindowToVram(spriteManager->unk82, COPYWIN_BOTH);
        spriteManager->unk80 = 0;
        return TRUE;
    }
    ++spriteManager->unk80;
    return FALSE;
}

void sub_814E80C(struct BerryCrushGame * game)
{
    ClearStdWindowAndFrameToTransparent(game->spritesManager.unk82, 1);
    RemoveWindow(game->spritesManager.unk82);
    sub_814EBB0(game);
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
        data[1] = AddWindow(&sWindowTemplate_BerryCrushRankings);
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
                    score += sPressingSpeedConversionTable[j];
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

static void BerryCrush_PrintTimeOnSprites(struct BerryCrushGame_138 * manager, u16 frames)
{
    FramesToMinSec(manager, frames);
    DigitObjUtil_PrintNumOn(0, manager->minutes);
    DigitObjUtil_PrintNumOn(1, manager->secondsInt);
    DigitObjUtil_PrintNumOn(2, manager->secondsFrac);
}

void BerryCrush_HideTimerSprites(struct BerryCrushGame_138 * manager)
{
    manager->timerSprites[0]->invisible = TRUE;
    manager->timerSprites[1]->invisible = TRUE;
    DigitObjUtil_HideOrShow(2, 1);
    DigitObjUtil_HideOrShow(1, 1);
    DigitObjUtil_HideOrShow(0, 1);
}

static void sub_814EB38(struct BerryCrushGame * game)
{
    u8 i;

    for (i = 0; i < game->playerCount; ++i)
    {
        game->spritesManager.seatCoords[i] = &gUnknown_846F294[gUnknown_846F280[game->playerCount - 2][i]];
        game->spritesManager.unk83[i] = AddWindow(&gUnknown_846E3F8[game->spritesManager.seatCoords[i]->unk0]);
        PutWindowTilemap(game->spritesManager.unk83[i]);
        FillWindowPixelBuffer(game->spritesManager.unk83[i], PIXEL_FILL(0));
    }
}

static void sub_814EBB0(struct BerryCrushGame * game)
{
    u8 i;

    for (i = 0; i < game->playerCount; ++i)
    {
        PutWindowTilemap(game->spritesManager.unk83[i]);
        if (i == game->localId)
        {
            AddTextPrinterParameterized4(
                game->spritesManager.unk83[i],
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
                game->spritesManager.unk83[i],
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
        CopyWindowToVram(game->spritesManager.unk83[i], COPYWIN_BOTH);
    }
    CopyBgTilemapBufferToVram(0);
}

static void sub_814EC80(struct BerryCrushGame * game)
{
    u8 i = 0;
    u8 *r4;

    LZ77UnCompWram(gUnknown_8EB0ADC, gDecompressionBuffer);
    
    for (r4 = gDecompressionBuffer; i < game->playerCount; ++i)
    {
        CopyToBgTilemapBufferRect(
            3,
            &r4[game->spritesManager.seatCoords[i]->unk0 * 40],
            game->spritesManager.seatCoords[i]->unk1,
            game->spritesManager.seatCoords[i]->unk2,
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

    game->depth = -104;
    game->vibration = 0;
    gSpriteCoordOffsetX = 0;
    gSpriteCoordOffsetY = -104;
    for (; i < 4; ++i)
        LoadCompressedSpriteSheet(&sSpriteSheets[i]);
    LoadSpritePalettes(sSpritePals);
    spriteId = CreateSprite(&sSpriteTemplate_BerryCrushCore, 120, 88, 5);
    game->spritesManager.coreSprite = &gSprites[spriteId];
    game->spritesManager.coreSprite->oam.priority = 3;
    game->spritesManager.coreSprite->coordOffsetEnabled = TRUE;
    game->spritesManager.coreSprite->animPaused = TRUE;
    for (i = 0; i < game->playerCount; ++i)
    {
        spriteId = CreateSprite(
            &sSpriteTemplate_BerryCrushImpact,
            game->spritesManager.seatCoords[i]->unk4 + 120,
            game->spritesManager.seatCoords[i]->unk6 + 32,
            0
        );
        game->spritesManager.impactSprites[i] = &gSprites[spriteId];
        game->spritesManager.impactSprites[i]->oam.priority = 1;
        game->spritesManager.impactSprites[i]->invisible = TRUE;
        game->spritesManager.impactSprites[i]->coordOffsetEnabled = TRUE;
        game->spritesManager.impactSprites[i]->animPaused = TRUE;
    }
    for (i = 0; i < NELEMS(game->spritesManager.sparkleSprites); ++i)
    {
        spriteId = CreateSprite(
            &sSpriteTemplate_BerryCrushPowderSparkles,
            gUnknown_846F2D6[i][0] + 120,
            gUnknown_846F2D6[i][1] + 136,
            6
        );
        game->spritesManager.sparkleSprites[i] = &gSprites[spriteId];
        game->spritesManager.sparkleSprites[i]->oam.priority = 3;
        game->spritesManager.sparkleSprites[i]->invisible = TRUE;
        game->spritesManager.sparkleSprites[i]->animPaused = TRUE;
        game->spritesManager.sparkleSprites[i]->data[0] = i;
    }
    for (i = 0; i < NELEMS(game->spritesManager.timerSprites); ++i)
    {
        spriteId = CreateSprite(
            &sSpriteTemplate_BerryCrushTimer,
            24 * i + 176,
            8,
            0
        );
        game->spritesManager.timerSprites[i] = &gSprites[spriteId];
        game->spritesManager.timerSprites[i]->oam.priority = 0;
        game->spritesManager.timerSprites[i]->invisible = FALSE;
        game->spritesManager.timerSprites[i]->animPaused = FALSE;
    }
    DigitObjUtil_CreatePrinter(0, 0, &sDigitObjTemplates[0]);
    DigitObjUtil_CreatePrinter(1, 0, &sDigitObjTemplates[1]);
    DigitObjUtil_CreatePrinter(2, 0, &sDigitObjTemplates[2]);
    if (game->gameState == 1)
            BerryCrush_HideTimerSprites(&game->spritesManager);
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
    for (; r4 < NELEMS(r5->spritesManager.timerSprites); ++r4)
        DestroySprite(r5->spritesManager.timerSprites[r4]);
    DigitObjUtil_DeletePrinter(2);
    DigitObjUtil_DeletePrinter(1);
    DigitObjUtil_DeletePrinter(0);
    for (r4 = 0; r4 < NELEMS(r5->spritesManager.sparkleSprites); ++r4)
        DestroySprite(r5->spritesManager.sparkleSprites[r4]);
    for (r4 = 0; r4 < r5->playerCount; ++r4)
        DestroySprite(r5->spritesManager.impactSprites[r4]);
    if (r5->spritesManager.coreSprite->inUse)
        DestroySprite(r5->spritesManager.coreSprite);
}

static void SpriteCB_BerryCrushImpact(struct Sprite * sprite)
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
    r5 = MathUtil_Div16Shift(7, (168 - sprite->pos1.y) << 7, (r2 + 32) >> 1);
    sprite->data[0] = sprite->pos1.x << 7;
    r7[3] = MathUtil_Div16Shift(7, r4, r5);
    r2 = MathUtil_Mul16Shift(7, r5, 85);
    r7[4] = r8;
    r7[5] = MathUtil_Div16Shift(7, 0x3F80, r2);
    r7[6] = sprite->pos2.x / 4;
    r7[7] |= 0x8000;
    sprite->pos2.y = r8;
    sprite->pos2.x = r8;
    sprite->callback = sub_814F044;
    sprite->animPaused = FALSE;
    sprite->invisible = FALSE;
}
