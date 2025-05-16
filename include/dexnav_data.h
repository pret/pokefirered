#ifndef GUARD_DEXNAV_DATA_H
#define GUARD_DEXNAV_DATA_H

#include "global.h"

// DEFINES
#define TILE_SIZE 32

#define TOOL_COUNT 2
#define priv0 gTasks[taskId].data[0]

#define CPUFSCPY 0
#define CPUFSSET 1
#define CPUModeFS(size, mode) ((size >> 2) | (mode << 24))

#define SCANSTART_X 0
#define SCANSTART_Y 0
#define SCANSIZE_X 12
#define SCANSIZE_Y 12

#define ICON_PAL_TAG 0xDAC0
#define ICON_GFX_TAG 0xD75A
#define SELECTION_CURSOR_TAG 0x200

#define ICONX 0x10
#define ICONY 0x92

#define ICONX 0x10
#define ICONY 0x92

#define NUM_LAND_MONS 12
#define NUM_WATER_MONS 5

#define LAND_ROW_LENGTH (6 * 2)
#define LAND_FIRST_ROW_LAST_INDEX (5 * 2)
#define LAND_SECOND_ROW_LAST_INDEX (LAND_FIRST_ROW_LAST_INDEX + LAND_ROW_LENGTH)
#define LAND_SECOND_ROW_FIRST_INDEX (6 * 2)
#define WATER_ROW_LAST_INDEX (4 * 2)
#define ROW_MON_LENGTH 2

extern const u8 gMoveNames[][13];

enum DexNavMessages
{
	MESSAGE_INVALID,
	MESSAGE_CHOOSE_MON,
	MESSAGE_REGISTERED,
	MESSAGE_NO_DATA,
	MESSAGE_TOO_DARK,
};

enum BGs
{
	BG_TEXT,
	BG_UNUSED_1,
	BG_UNUSED_2,
	BG_BACKGROUND,
};

enum
{
	WIN_SPECIES,
	WIN_SEARCH_LEVEL,
	WIN_LEVEL_BONUS,
	WIN_HIDDEN_ABILITY,
	WIN_MESSAGE,
	WIN_WATER,
	WIN_LAND,
	WIN_MAP_NAME,
	WIN_INSTRUCTIONS,
	DEXNAV_WINDOW_COUNT,
};

static const struct WindowTemplate sDexNavWinTemplates[DEXNAV_WINDOW_COUNT + 1] =
{
	[WIN_SPECIES] =
	{
        .bg = BG_TEXT,
        .tilemapLeft = 21,
        .tilemapTop = 5,
        .width = 9,
        .height = 2,
        .paletteNum = 15,
        .baseBlock = 1,
	},
	[WIN_SEARCH_LEVEL] =
    {
        .bg = BG_TEXT,
        .tilemapLeft = 21,
        .tilemapTop = 8,
        .width = 9,
        .height = 2,
        .paletteNum = 15,
        .baseBlock = 19,
    },
	[WIN_LEVEL_BONUS] =
    {
        .bg = BG_TEXT,
        .tilemapLeft = 21,
        .tilemapTop = 10,
        .width = 9,
        .height = 3,
        .paletteNum = 15,
        .baseBlock = 64,
    },
	[WIN_HIDDEN_ABILITY] =
    {
        .bg = BG_TEXT,
        .tilemapLeft = 21,
        .tilemapTop = 15,
        .width = 12,
        .height = 3,
        .paletteNum = 15,
        .baseBlock = 91,
    },
	[WIN_MESSAGE] =
    {
        .bg = BG_TEXT,
        .tilemapLeft = 18,
        .tilemapTop = 18,
        .width = 13,
        .height = 3,
        .paletteNum = 15,
        .baseBlock = 127,
    },
	[WIN_WATER] =
	{
        .bg = BG_TEXT,
        .tilemapLeft = 1,
        .tilemapTop = 2,
        .width = 19,
        .height = 3,
        .paletteNum = 15,
        .baseBlock = 208,
	},
	[WIN_LAND] =
	{
        .bg = BG_TEXT,
        .tilemapLeft = 1,
        .tilemapTop = 9,
        .width = 19,
        .height = 3,
        .paletteNum = 15,
        .baseBlock = 265,
	},
	[WIN_MAP_NAME] =
	{
        .bg = BG_TEXT,
        .tilemapLeft = 0,
        .tilemapTop = 18,
        .width = 12,
        .height = 3,
        .paletteNum = 15,
        .baseBlock = 322,
	},
	[WIN_INSTRUCTIONS] =
	{
        .bg = BG_TEXT,
        .tilemapLeft = 15,
        .tilemapTop = 0,
        .width = 20,
        .height = 2,
        .paletteNum = 15,
        .baseBlock = 358,
	},
    DUMMY_WIN_TEMPLATE
};

static const struct BgTemplate sDexNavBgTemplates[] =
{
    [BG_TEXT] =
	{
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0,
    },
	[BG_UNUSED_1] =
    {
        .bg = 1,
        .charBaseIndex = 1,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0,
    },
	[BG_UNUSED_2] =
    {
        .bg = 2,
        .charBaseIndex = 2,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0,
    },
	[BG_BACKGROUND] =
    {
        .bg = 3,
        .charBaseIndex = 3,
        .mapBaseIndex = 28,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0,
    },
};

static const struct OamData sCursorOam =
{
	.affineMode = ST_OAM_AFFINE_OFF,
	.objMode = ST_OAM_OBJ_NORMAL,
	.shape = SPRITE_SHAPE(32x32),
	.size = SPRITE_SIZE(32x32),
	.priority = 0, //Above other sprites
};

static const struct OamData sCapturedAllPokemonSymbolOam =
{
	.affineMode = ST_OAM_AFFINE_OFF,
	.objMode = ST_OAM_OBJ_NORMAL,
	.shape = SPRITE_SHAPE(8x8),
	.size = SPRITE_SIZE(8x8),
	.priority = 2,
};

static const struct OamData sNoDataIconOam =
{
	.affineMode = ST_OAM_AFFINE_OFF,
	.objMode = ST_OAM_OBJ_NORMAL,
	.shape = SPRITE_SHAPE(32x32),
	.size = SPRITE_SIZE(32x32),
	.priority = 2,
};

void SpriteCB_GUICursor(struct Sprite* sprite);
static const struct SpriteTemplate sGUICursorTemplate =
{
	.tileTag = SELECTION_CURSOR_TAG,
	.paletteTag = SELECTION_CURSOR_TAG,
	.oam = &sCursorOam,
	.anims = gDummySpriteAnimTable,
	.images = NULL,
	.affineAnims = gDummySpriteAffineAnimTable,
	.callback = SpriteCB_GUICursor,
};

static const struct SpriteTemplate sCapturedAllPokemonSymbolTemplate =
{
	.tileTag = 0xFDF2,
	.paletteTag = SELECTION_CURSOR_TAG,
	.oam = &sCapturedAllPokemonSymbolOam,
	.anims = gDummySpriteAnimTable,
	.images = NULL,
	.affineAnims = gDummySpriteAffineAnimTable,
	.callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate sNoDataIconTemplate =
{
	.tileTag = ICON_GFX_TAG,
	.paletteTag = ICON_PAL_TAG,
	.oam = &sNoDataIconOam,
	.anims = gDummySpriteAnimTable,
	.images = NULL,
	.affineAnims = gDummySpriteAffineAnimTable,
	.callback = SpriteCallbackDummy,
};

static const struct CompressedSpriteSheet sCursorSpriteSheet = {DexNavCursorTiles, (32 * 32) / 2, SELECTION_CURSOR_TAG};
static const struct CompressedSpritePalette sCursorSpritePalette = {DexNavCursorPal, SELECTION_CURSOR_TAG};
static const struct CompressedSpriteSheet sCapturedAllPokemonSpriteSheet = {gInterfaceGfx_CapturedAllPokemonTiles, (8 * 8) / 2, 0xFDF2}; //Tag is from Mega Evo and not in use
static const struct CompressedSpriteSheet sNoDataIconSpriteSheet = {gInterfaceGfx_DexNavNoDataSymbolTiles, (32 * 32) / 2, ICON_GFX_TAG};

struct TextColor
{
    u8 colors[3][4];
};

static const u8 sDexNav_BlackText[3] = {0, 2, 3};
static const u8 sDexNav_WhiteText[3] = {0, 1, 2};

#define rgb5(r, g, b) (u16)((r >> 3) | ((g >> 3) << 5) | ((b >> 3) << 10))
static const u16 sDexNavGuiTextPal[] =
{
	rgb5(255, 0, 255), rgb5(255, 255, 255), rgb5(0, 0, 0), rgb5(160, 160, 160),
	rgb5(208, 208, 208), rgb5(76, 154, 38), rgb5(102, 194, 66), rgb5(168, 75, 76),
	rgb5(224, 114, 75), rgb5(180, 124, 41), rgb5(241, 188, 60), rgb5(255, 0, 255),
	rgb5(255, 0, 255), rgb5(255, 0, 255), rgb5(255, 133, 200), rgb5(64, 200, 248)
};

static const s16 sCursorPositionsLand[] =
{
    24 + 24 * 0, 104,
    24 + 24 * 1, 104,
    24 + 24 * 2, 104,
    24 + 24 * 3, 104,
    24 + 24 * 4, 104,
    24 + 24 * 5, 104,
    24 + 24 * 0, 104 + 22,
    24 + 24 * 1, 104 + 22,
    24 + 24 * 2, 104 + 22,
    24 + 24 * 3, 104 + 22,
    24 + 24 * 4, 104 + 22,
    24 + 24 * 5, 104 + 22,
};

static const s16 sCursorPositionsWater[] =
{
    24 + 30 * 0, 48,
    24 + 30 * 1, 48,
    24 + 30 * 2, 48,
    24 + 30 * 3, 48,
    24 + 30 * 4, 48,
};

enum FieldMessages
{
	FIELD_MSG_NOT_IN_AREA, 
	FIELD_MSG_LOOK_IN_OTHER_SPOT,
	FIELD_MSG_TOO_DARK,
	FIELD_MSG_GOT_AWAY,
	FIELD_MSG_LOST_SIGNAL,
	FIELD_MSG_SNEAK_NEXT_TIME,
};



//64x32 oam with second highest priority
static const struct OamData sBlackBarOAM =
{
	.affineMode = ST_OAM_AFFINE_DOUBLE,
	.objMode = ST_OAM_OBJ_NORMAL,
	.shape = SPRITE_SHAPE(64x32),
	.size = SPRITE_SIZE(64x32),
	.priority = 1, //Above almost everything
};

static const struct OamData sSightOam =
{
	.affineMode = ST_OAM_AFFINE_OFF,
	.objMode = ST_OAM_OBJ_NORMAL,
	.shape = SPRITE_SHAPE(16x8),
	.size = SPRITE_SIZE(16x8),
	.priority = 0, //Above everything
};

static const struct OamData sBButtonOam =
{
	.affineMode = ST_OAM_AFFINE_OFF,
	.objMode = ST_OAM_OBJ_NORMAL,
	.shape = SPRITE_SHAPE(32x8),
	.size = SPRITE_SIZE(32x8),
	.priority = 0, //Above everything
};

//64x32 oam with highest priority
static const struct OamData sFontOAM =
{
	.affineMode = ST_OAM_AFFINE_OFF,
	.objMode = ST_OAM_OBJ_NORMAL,
	.shape = SPRITE_SHAPE(64x32),
	.size = SPRITE_SIZE(64x32),
	.priority = 0, //Above everything
};

//8x8 oam with highest priority
static const struct OamData sHeldItemOam =
{
	.affineMode = ST_OAM_AFFINE_OFF,
	.objMode = ST_OAM_OBJ_NORMAL,
	.shape = SPRITE_SHAPE(8x8),
	.size = SPRITE_SIZE(8x8),
	.priority = 0, //Above everything
};

static const union AnimCmd sAnimCmdSight0[] =
{
	ANIMCMD_FRAME(0, 1),
	ANIMCMD_END
};

static const union AnimCmd sAnimCmdSight1[] =
{
	ANIMCMD_FRAME(2, 1),
	ANIMCMD_END
};

static const union AnimCmd sAnimCmdSight2[] =
{
	ANIMCMD_FRAME(4, 1),
	ANIMCMD_END
};

static const union AnimCmd *const sAnimCmdTable_Sight[] =
{
	sAnimCmdSight0,
	sAnimCmdSight1,
	sAnimCmdSight2,
};

static const union AffineAnimCmd sSpriteAffineAnim_DexNavBar[] =
{
	AFFINEANIMCMD_FRAME(256, 0, 0, 1), //Double sprite width
	AFFINEANIMCMD_END,
};

static const union AffineAnimCmd* const sSpriteAffineAnimTable_DexNavBar[] =
{
	sSpriteAffineAnim_DexNavBar,
};

static const struct SpriteTemplate sBlackBarTemplate =
{
	.tileTag = 0xFDF1,
	.paletteTag = 0x8472,
	.oam = &sBlackBarOAM,
	.anims = gDummySpriteAnimTable,
	.images = NULL,
	.affineAnims = sSpriteAffineAnimTable_DexNavBar,
	.callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate sSightTemplate =
{
	.tileTag = 0x5424,
	.paletteTag = 0x8472,
	.oam = &sSightOam,
	.anims = sAnimCmdTable_Sight,
	.images = NULL,
	.affineAnims = gDummySpriteAffineAnimTable,
	.callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate sBButtonTemplate =
{
	.tileTag = 0x5425,
	.paletteTag = 0x8472,
	.oam = &sBButtonOam,
	.anims = gDummySpriteAnimTable,
	.images = NULL,
	.affineAnims = gDummySpriteAffineAnimTable,
	.callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate sMoveCanvasTemplate =
{
	.tileTag = 0x4736,
	.paletteTag = 0x8472,
	.oam = &sFontOAM,
	.anims = gDummySpriteAnimTable,
	.images = NULL,
	.affineAnims = gDummySpriteAffineAnimTable,
	.callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate sAbilityCanvasTemplate =
{
	.tileTag = 0x1EE7,
	.paletteTag = 0x8472,
	.oam = &sFontOAM,
	.anims = gDummySpriteAnimTable,
	.images = NULL,
	.affineAnims = gDummySpriteAffineAnimTable,
	.callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate sStarLitTemplate =
{
	.tileTag = 0x61,
	.paletteTag = 0x8472,
	.oam = &sHeldItemOam,
	.anims = gDummySpriteAnimTable,
	.images = NULL,
	.affineAnims = gDummySpriteAffineAnimTable,
	.callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate sStarDullTemplate =
{
	.tileTag = 0x2613,
	.paletteTag = 0x8472,
	.oam = &sHeldItemOam,
	.anims = gDummySpriteAnimTable,
	.images = NULL,
	.affineAnims = gDummySpriteAffineAnimTable,
	.callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate sHeldItemTemplate =
{
	.tileTag = 0x8472,
	.paletteTag = 0x8472,
	.oam = &sHeldItemOam,
	.anims = gDummySpriteAnimTable,
	.images = NULL,
	.affineAnims = gDummySpriteAffineAnimTable,
	.callback = SpriteCallbackDummy,
};

static const u32 sHeldItemGfx[] = INCBIN_U32("graphics/dexnav/dexnav_held_icons.4bpp");
static const u16 sDexNavHudPalette[] = INCBIN_U16("graphics/dexnav/dexnav_stars.gbapal");

static const struct CompressedSpriteSheet sBlackBarTiles = {DexNavBarTiles, (64 * 32) / 2, 0xFDF1};
static const struct CompressedSpriteSheet sSightSpriteSheet = {DexNavSightTiles, (16 * 8 * 3) / 2, 0x5424};
static const struct CompressedSpriteSheet sBButtonSpriteSheet = {DexNavBButtonTiles, (32 * 8) / 2, 0x5425};
static const struct CompressedSpriteSheet sMoveCanvasSpriteSheet = {gInterfaceGfx_emptyTiles, (64 * 32) / 2, 0x4736};
static const struct CompressedSpriteSheet sAbilityCanvasSpriteSheet = {gInterfaceGfx_emptyTiles, (64 * 32) / 2, 0x1EE7};
static const struct SpriteSheet sStarLitSpriteSheet = {&gInterfaceGfx_dexnavStarsTiles[19 * 4 * 32], (8 * 8) / 2, 0x61}; //19 tiles per row, stars are on the 4th row. 1 tile is 32 bytes. Hence 19 * 4 *32
static const struct SpriteSheet sStarDullSpriteSheet = {&gInterfaceGfx_dexnavStarsTiles[((19 * 4) + 1)*32], (8 * 8) / 2, 0x2613};
static const struct SpriteSheet sHeldItemSpriteSheet = {sHeldItemGfx, (8 * 16) / 2, 0x8472};
static const struct SpritePalette sHeldItemSpritePalette = {sDexNavHudPalette, 0x8472};

#endif // GUARD_DEXNAV_DATA_H