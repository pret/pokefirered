#include "global.h"
#include "bg.h"
#include "strings.h"
#include "window.h"

/*static*/ void sub_8150C78(void);
/*static*/ void sub_8150CBC(void);
/*static*/ void sub_8150CF4(void);
/*static*/ void sub_8150D7C(void);
/*static*/ void sub_8150DA4(void);
/*static*/ void sub_8150FDC(void);
/*static*/ void sub_8151198(void);
/*static*/ void sub_81512B4(void);
/*static*/ void sub_8151488(void);
/*static*/ void sub_81514F0(void);
/*static*/ void sub_815159C(void);
/*static*/ void sub_8150F40(void);
/*static*/ void sub_8150E68(void);
/*static*/ void sub_815109C(void);
/*static*/ void sub_8150FC4(void);
/*static*/ void nullsub_97(struct Sprite *sprite);
/*static*/ void sub_81543E8(struct Sprite *sprite);
/*static*/ void sub_8154A2C(void);
/*static*/ void sub_8154B34(void);
/*static*/ void sub_8154F80(void);
/*static*/ void sub_81556E0(void);
/*static*/ void sub_8155A78(void);
/*static*/ void sub_8155B4C(void);
/*static*/ void sub_8155C2C(void);
/*static*/ void sub_8155C80(void);
/*static*/ void unused_0(void);
/*static*/ void nullsub_98(void);

// const rom data
/*static*/ const u8 sUnknown_8471F50[5][5][11] =
{
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0},
    },
    {
        {0, 1, 2, 3, 4, 5, 6, 3, 8, 9, 0},
        {0, 1, 2, 5, 6, 3, 4, 5, 8, 9, 0},
    },
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 2, 9, 0},
        {0, 1, 4, 5, 6, 7, 2, 3, 4, 9, 0},
        {0, 1, 6, 7, 2, 3, 4, 5, 6, 9, 0},
    },
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 8, 1, 0},
        {0, 3, 4, 5, 6, 7, 8, 1, 2, 3, 0},
        {0, 5, 6, 7, 8, 1, 2, 3, 4, 5, 0},
        {0, 7, 8, 1, 2, 3, 4, 5, 6, 7, 0},
    },
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0},
        {2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2},
        {4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4},
        {6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6},
        {8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8},
    },
};

/*static*/ const u8 sUnknown_8472063[5][5][3] =
{
    {
        {4, 5, 6},
    },
    {
        {3, 4, 5},
        {5, 6, 3},
    },
    {
        {4, 5, 6},
        {6, 7, 2},
        {2, 3, 4},
    },
    {
        {3, 4, 5},
        {5, 6, 7},
        {7, 8, 1},
        {1, 2, 3},
    },
    {
        {4, 5, 6},
        {6, 7, 8},
        {8, 9, 0},
        {0, 1, 2},
        {2, 3, 4},
    },
};

/*static*/ const u8 sUnknown_84720AE[5][5][3] =
{
    {
        {1, 0, 1},
    },
    {
        {1, 0, 1},
        {0, 1, 0},
    },
    {
        {2, 0, 1},
        {0, 1, 2},
        {1, 2, 0},
    },
    {
        {3, 0, 1},
        {0, 1, 2},
        {1, 2, 3},
        {2, 3, 0},
    },
    {
        {4, 0, 1},
        {0, 1, 2},
        {1, 2, 3},
        {2, 3, 4},
        {3, 4, 0},
    },
};

ALIGNED(4)
/*static*/ const u8 sUnknown_84720FC[5][11] =
{
    {9, 9, 9, 9, 1, 1, 1, 9, 9, 9, 9},
    {9, 9, 9, 0, 0, 1, 1, 0, 9, 9, 9},
    {9, 9, 2, 2, 0, 0, 1, 1, 1, 9, 9},
    {9, 3, 3, 0, 0, 1, 1, 2, 2, 3, 9},
    {3, 3, 4, 4, 0, 0, 1, 1, 2, 2, 3},
};

/*static*/ const u8 sUnknown_8472133[5][5] =
{
    {5},
    {4, 6},
    {3, 5, 7},
    {2, 4, 6, 8},
    {1, 3, 5, 6, 9},
};

// Duplicate and unused gfx. Feel free to remove.
/*static*/ const u32 sDuplicateGfx[] = INCBIN_U32("graphics/link_games/dodrioberry_bg1.gbapal",
                                     "graphics/link_games/dodrioberry_bg2.gbapal",
                                     "graphics/link_games/dodrioberry_pkmn.gbapal",
                                     "graphics/link_games/dodrioberry_shiny.gbapal",
                                     "graphics/link_games/dodrioberry_status.gbapal",
                                     "graphics/link_games/dodrioberry_berrysprites.gbapal",
                                     "graphics/link_games/dodrioberry_berrysprites.4bpp.lz",
                                     "graphics/link_games/dodrioberry_platform.gbapal",
                                     "graphics/link_games/dodrioberry_bg1.4bpp.lz",
                                     "graphics/link_games/dodrioberry_bg2.4bpp.lz",
                                     "graphics/link_games/dodrioberry_status.4bpp.lz",
                                     "graphics/link_games/dodrioberry_platform.4bpp.lz",
                                     "graphics/link_games/dodrioberry_pkmn.4bpp.lz",
                                     "graphics/link_games/dodrioberry_bg1.bin.lz",
                                     "graphics/link_games/dodrioberry_bg2right.bin.lz",
                                     "graphics/link_games/dodrioberry_bg2left.bin.lz");

/*static*/ const u8 sUnknown_847553C[][3] =
{
    {40, 24, 13},
    {32, 19, 10},
    {22, 13, 7},
};

ALIGNED(4)
/*static*/ const u8 sUnknown_8475548[] = {8, 5, 8, 11, 15};

ALIGNED(4)
/*static*/ const u8 sUnknown_8475550[] = {5, 10, 20, 30, 50, 70, 100};

ALIGNED(4)
/*static*/ const u8 sUnknown_8475558[][10] =
{
    {15, 16, 17, 18, 19, 19, 18, 17, 16, 15},
    {20, 21, 22, 23, 24, 25, 26, 27, 28, 29},
    {30, 31, 32, 33, 34, 34, 33, 32, 31, 30},
};

/*static*/ void (*const sUnknown_8475578[])(void) =
{
    sub_8150C78,
    sub_8150CBC,
    sub_8150CF4,
    sub_8150D7C,
    sub_8150DA4,
    sub_8150FDC,
    sub_8151198,
    sub_81512B4,
    sub_8151488,
    sub_81514F0,
    sub_815159C,
    sub_8150F40
};

/*static*/ void (*const sUnknown_84755A8[])(void) =
{
    sub_8150C78,
    sub_8150CBC,
    sub_8150CF4,
    sub_8150D7C,
    sub_8150E68,
    sub_815109C,
    sub_8151198,
    sub_81512B4,
    sub_8151488,
    sub_81514F0,
    sub_815159C,
    sub_8150FC4
};

/*static*/ const s16 sUnknown_84755D8[] = {10, 30, 50, 50};

// Data related to printing saved results.
/*static*/ const struct WindowTemplate sUnknown_84755E0 =
{
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 28,
    .height = 11,
    .paletteNum = 15,
    .baseBlock = 1,
};

/*static*/ const u8 *const sUnknown_84755E8[] = {gText_BerryPickingRecords, gText_BerriesPicked, gText_BestScore, gText_BerriesInRowFivePlayers};
/*static*/ const u8 sUnknown_84755F8[] = {4, 7, 4};

ALIGNED(4)
/*static*/ const u8 sUnknown_84755FC[][2] = {{24}, {40}, {56}};
/*static*/ const u8 sUnknown_8475602[][2] = {{24}, {40}, {70}};

// Debug functions?
/*static*/ const u16 sUnknown_8475608[][4] =
{
    {9999, 0, 90, 9999},
    {9999, 9999, 70, 9999},
    {9999, 0, 9999, 0},
    {9999, 9999, 60, 0},
    {9999, 9999, 9999, 0},
};

/*static*/ const u8 sUnknown_8475630[] = _("あいうえおかき");
/*static*/ const u8 sUnknown_8475638[] = _("ABCDEFG");
/*static*/ const u8 sUnknown_8475640[] = _("0123456");

/*static*/ const u8 *const sUnknown_8475648[] =
{
    sUnknown_8475630,
    sUnknown_8475630,
    sUnknown_8475630,
    sUnknown_8475638,
    sUnknown_8475640
};

// Large chunk of data
/*static*/ const struct BgTemplate sUnknown_847565C[] =
{
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0
    },
    {
        .bg = 1,
        .charBaseIndex = 2,
        .mapBaseIndex = 12,
        .screenSize = 1,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0
    },
    {
        .bg = 2,
        .charBaseIndex = 2,
        .mapBaseIndex = 14,
        .screenSize = 1,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0
    },
    {
        .bg = 3,
        .charBaseIndex = 3,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0
    },
};

// Unknown unreferenced data, feel free to remove.
/*static*/ const u32 sUnused[] = {255, 0};

/*static*/ const struct WindowTemplate sUnknown_8475674[] =
{
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 28,
        .height = 3,
        .paletteNum = 13,
        .baseBlock = 0x13,
    },
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 6,
        .width = 28,
        .height = 13,
        .paletteNum = 13,
        .baseBlock = 0x67,
    }
};

/*static*/ const struct WindowTemplate sUnknown_8475684 =
{
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 6,
    .width = 28,
    .height = 7,
    .paletteNum = 13,
    .baseBlock = 0x67,
};

/*static*/ const struct WindowTemplate sUnknown_847568C[] =
{
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 8,
        .width = 19,
        .height = 3,
        .paletteNum = 13,
        .baseBlock = 0x13,
    },
    {
        .bg = 0,
        .tilemapLeft = 22,
        .tilemapTop = 7,
        .width = 6,
        .height = 4,
        .paletteNum = 13,
        .baseBlock = 0x4C,
    }
};

/*static*/ const struct WindowTemplate sUnknown_847569C =
{
    .bg = 0,
    .tilemapLeft = 4,
    .tilemapTop = 6,
    .width = 22,
    .height = 5,
    .paletteNum = 13,
    .baseBlock = 0x13,
};

/*static*/ const struct WindowTemplate sUnknown_84756A4 =
{
    .bg = 0,
    .tilemapLeft = 5,
    .tilemapTop = 8,
    .width = 19,
    .height = 3,
    .paletteNum = 13,
    .baseBlock = 0x13,
};

// This is an unused copy of the tables from the top of the file. Feel free to remove.
/*static*/ const u8 sDuplicateArray[] =
{
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 3, 8, 9, 0, 0, 1, 2, 5, 6, 3, 4, 5, 8, 9, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 2, 9,
    0, 0, 1, 4, 5, 6, 7, 2, 3, 4, 9, 0, 0, 1, 6, 7, 2, 3, 4, 5, 6, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 1, 0, 0, 3, 4, 5, 6, 7, 8, 1, 2, 3, 0, 0, 5, 6, 7, 8, 1, 2, 3, 4, 5, 0, 0, 7,
    8, 1, 2, 3, 4, 5, 6, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 2, 3, 4, 5, 6, 7, 8, 9, 0,
    1, 2, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8, 4, 5, 6, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 4, 5, 5, 6, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 6, 6, 7, 2, 2, 3, 4, 0, 0, 0, 0, 0, 0,
    3, 4, 5, 5, 6, 7, 7, 8, 1, 1, 2, 3, 0, 0, 0, 4, 5, 6, 6, 7, 8, 8, 9, 0, 0, 1, 2, 2, 3, 4, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 1, 0, 1, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0, 3, 0, 1, 0, 1,
    2, 1, 2, 3, 2, 3, 0, 0, 0, 0, 4, 0, 1, 0, 1, 2, 1, 2, 3, 2, 3, 4, 3, 4, 0, 0, 0, 0, 9, 9, 9, 9, 1, 1, 1, 9, 9, 9, 9, 9,
    9, 9, 0, 0, 1, 1, 0, 9, 9, 9, 9, 9, 2, 2, 0, 0, 1, 1, 1, 9, 9, 9, 3, 3, 0, 0, 1, 1, 2, 2, 3, 9, 3, 3, 4, 4, 0, 0, 1, 1,
    2, 2, 3, 5, 0, 0, 0, 0, 4, 6, 0, 0, 0, 3, 5, 7, 0, 0, 2, 4, 6, 8, 0, 1, 3, 5, 6, 9
};

/*static*/ const u16 sDodrioBerryBgPal1[] = INCBIN_U16("graphics/link_games/dodrioberry_bg1.gbapal",
                                            "graphics/link_games/dodrioberry_bg2.gbapal");
/*static*/ const u16 sDodrioBerryPkmnPal[] = INCBIN_U16("graphics/link_games/dodrioberry_pkmn.gbapal");
/*static*/ const u16 sDodrioBerryShinyPal[] = INCBIN_U16("graphics/link_games/dodrioberry_shiny.gbapal");
/*static*/ const u16 sDodrioBerryStatusPal[] = INCBIN_U16("graphics/link_games/dodrioberry_status.gbapal");
/*static*/ const u16 sDodrioBerrySpritesPal[] = INCBIN_U16("graphics/link_games/dodrioberry_berrysprites.gbapal");
/*static*/ const u32 sDodrioBerrySpritesGfx[] = INCBIN_U32("graphics/link_games/dodrioberry_berrysprites.4bpp.lz");
/*static*/ const u16 sDodrioBerryPlatformPal[] = INCBIN_U16("graphics/link_games/dodrioberry_platform.gbapal");
/*static*/ const u32 sDodrioBerryBgGfx1[] = INCBIN_U32("graphics/link_games/dodrioberry_bg1.4bpp.lz");
/*static*/ const u32 sDodrioBerryBgGfx2[] = INCBIN_U32("graphics/link_games/dodrioberry_bg2.4bpp.lz");
/*static*/ const u32 sDodrioBerryStatusGfx[] = INCBIN_U32("graphics/link_games/dodrioberry_status.4bpp.lz");
/*static*/ const u32 sDodrioBerryPlatformGfx[] = INCBIN_U32("graphics/link_games/dodrioberry_platform.4bpp.lz");
/*static*/ const u32 sDodrioBerryPkmnGfx[] = INCBIN_U32("graphics/link_games/dodrioberry_pkmn.4bpp.lz");
/*static*/ const u32 sDodrioBerryBgTilemap1[] = INCBIN_U32("graphics/link_games/dodrioberry_bg1.bin.lz");
/*static*/ const u32 sDodrioBerryBgTilemap2Right[] = INCBIN_U32("graphics/link_games/dodrioberry_bg2right.bin.lz");
/*static*/ const u32 sDodrioBerryBgTilemap2Left[] = INCBIN_U32("graphics/link_games/dodrioberry_bg2left.bin.lz");

/*static*/ const struct OamData sOamData_8478C98 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x64),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x64),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0
};

/*static*/ const struct OamData sOamData_8478CA0 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0
};

/*static*/ const struct OamData sOamData_8478CA8 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0
};

/*static*/ const struct OamData sOamData_8478CB0 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x32),
    .tileNum = 0,
    .priority = 3,
    .paletteNum = 0,
    .affineParam = 0
};

/*static*/ const union AnimCmd sSpriteAnim_8478CB8[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

/*static*/ const union AnimCmd sSpriteAnim_8478CC0[] =
{
    ANIMCMD_FRAME(64, 20),
    ANIMCMD_JUMP(0)
};

/*static*/ const union AnimCmd sSpriteAnim_8478CC8[] =
{
    ANIMCMD_FRAME(128, 20),
    ANIMCMD_JUMP(0)
};

/*static*/ const union AnimCmd sSpriteAnim_8478CD0[] =
{
    ANIMCMD_FRAME(192, 20),
    ANIMCMD_JUMP(0)
};

/*static*/ const union AnimCmd sSpriteAnim_8478CD8[] =
{
    ANIMCMD_FRAME(256, 20),
    ANIMCMD_JUMP(0)
};

/*static*/ const union AnimCmd *const sSpriteAnimTable_8478CE0[] =
{
    sSpriteAnim_8478CB8,
    sSpriteAnim_8478CC0,
    sSpriteAnim_8478CC8,
    sSpriteAnim_8478CD0,
    sSpriteAnim_8478CD8
};

/*static*/ const union AnimCmd sSpriteAnim_8478CF4[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

/*static*/ const union AnimCmd sSpriteAnim_8478CFC[] =
{
    ANIMCMD_FRAME(4, 20),
    ANIMCMD_JUMP(0)
};

/*static*/ const union AnimCmd sSpriteAnim_8478D04[] =
{
    ANIMCMD_FRAME(8, 20),
    ANIMCMD_JUMP(0)
};

/*static*/ const union AnimCmd *const sSpriteAnimTable_8478D0C[] =
{
    sSpriteAnim_8478CF4,
    sSpriteAnim_8478CFC,
    sSpriteAnim_8478D04
};

/*static*/ const union AnimCmd sSpriteAnim_8478D18[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

/*static*/ const union AnimCmd sSpriteAnim_8478D20[] =
{
    ANIMCMD_FRAME(4, 20),
    ANIMCMD_JUMP(0)
};

/*static*/ const union AnimCmd sSpriteAnim_8478D28[] =
{
    ANIMCMD_FRAME(8, 20),
    ANIMCMD_JUMP(0)
};

/*static*/ const union AnimCmd sSpriteAnim_8478D30[] =
{
    ANIMCMD_FRAME(12, 20),
    ANIMCMD_JUMP(0)
};

/*static*/ const union AnimCmd sSpriteAnim_8478D38[] =
{
    ANIMCMD_FRAME(16, 20),
    ANIMCMD_JUMP(0)
};

/*static*/ const union AnimCmd sSpriteAnim_8478D40[] =
{
    ANIMCMD_FRAME(20, 20),
    ANIMCMD_JUMP(0)
};

/*static*/ const union AnimCmd sSpriteAnim_8478D48[] =
{
    ANIMCMD_FRAME(24, 20),
    ANIMCMD_JUMP(0)
};

/*static*/ const union AnimCmd sSpriteAnim_8478D50[] =
{
    ANIMCMD_FRAME(28, 20),
    ANIMCMD_JUMP(0)
};

/*static*/ const union AnimCmd sSpriteAnim_8478D58[] =
{
    ANIMCMD_FRAME(32, 20),
    ANIMCMD_JUMP(0)
};

/*static*/ const union AnimCmd *const sSpriteAnimTable_8478D60[] =
{
    sSpriteAnim_8478D18,
    sSpriteAnim_8478D20,
    sSpriteAnim_8478D28,
    sSpriteAnim_8478D30,
    sSpriteAnim_8478D38,
    sSpriteAnim_8478D40,
    sSpriteAnim_8478D48,
    sSpriteAnim_8478D50,
    sSpriteAnim_8478D58
};

/*static*/ const union AnimCmd sSpriteAnim_8478D84[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

/*static*/ const union AnimCmd *const sSpriteAnimTable_8478D8C[] =
{
    sSpriteAnim_8478D84
};

// These are declared inside pokeemerald's sub_80283A8
const struct SpritePalette gUnknown_8478D90 = {sDodrioBerryPkmnPal, 0};
const struct SpritePalette gUnknown_8478D98 = {sDodrioBerryShinyPal, 1};

// These are declared inside pokeemerald's sub_8028734
const struct SpritePalette gUnknown_8478DA0 = {sDodrioBerryStatusPal, 2};
const struct SpriteTemplate gUnknown_8478DA8 =
        {
            .tileTag = 1,
            .paletteTag = 2,
            .oam = &sOamData_8478CA0,
            .anims = sSpriteAnimTable_8478D0C,
            .images = NULL,
            .affineAnims = gDummySpriteAffineAnimTable,
            .callback = nullsub_97,
        };

// Unknown unused data, feel free to remove.
/*static*/ const u8 sUnused2[] = {0xCD, 0x37, 0x38, 0x39, 0x3A, 0x3B, 0x3C, 0x3D, 0x3E, 0xF4, 0x0, 0x0};

// This is declared inside pokeemerald's sub_8028A34
const struct SpritePalette gUnknown_8478DCC = {sDodrioBerrySpritesPal, 3};

/*static*/ const s16 sUnknown_8478DD4[] = {88, 128, 168, 208};

// These are declared inside pokeemerald's sub_8028A88
const struct SpriteTemplate gUnknown_8478DDC =
    {
        .tileTag = 2,
        .paletteTag = 3,
        .oam = &sOamData_8478CA8,
        .anims = sSpriteAnimTable_8478D60,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    };
const struct SpriteTemplate gUnknown_8478DF4 =
    {
        .tileTag = 2,
        .paletteTag = 3,
        .oam = &sOamData_8478CA0,
        .anims = sSpriteAnimTable_8478D60,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    };

// This is declared inside pokeemerald's sub_8028CF4
/*static*/ const u8 gUnknown_8478E0C[] = {30, 20};

/*static*/ const s16 gUnknown_8478E0E[][2] = {{230, 55}, {30, 74}};

// These are declared inside pokeemerald's sub_8028D44
const struct SpritePalette gUnknown_8478E18 = {sDodrioBerryPlatformPal, 6};
const struct SpriteTemplate gUnknown_8478E20 =
    {
        .tileTag = 5,
        .paletteTag = 6,
        .oam = &sOamData_8478CB0,
        .anims = sSpriteAnimTable_8478D8C,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = sub_81543E8,
    };

struct WinCoords
{
    u8 left;
    u8 top;
};

/*static*/ const u8 sUnknown_8478E38[][3] =
{
    {1, 2, 3},
    {1, 4, 5},
    {1, 8, 9},
    {1, 6, 7},
};

/*static*/ const struct WinCoords sUnknown_8478E44[] = {{12, 6}};
/*static*/ const struct WinCoords sUnknown_8478E48[] = {{9, 10}, {15, 6}};
/*static*/ const struct WinCoords sUnknown_8478E50[] = {{12, 6}, {18, 10}, {6, 10}};
/*static*/ const struct WinCoords sUnknown_8478E5C[] = {{9, 10}, {15, 6}, {21, 10}, {3, 6}};
/*static*/ const struct WinCoords sUnknown_8478E6C[] = {{12, 6}, {18, 10}, {23, 6}, {1, 6}, {6, 10}};

/*static*/ const struct WinCoords *const sUnknown_8478E80[] =
{
    sUnknown_8478E44,
    sUnknown_8478E48,
    sUnknown_8478E50,
    sUnknown_8478E5C,
    sUnknown_8478E6C,
};

/*static*/ const u8 *const sUnknown_8478E94[] =
{
    gText_1Colon,
    gText_2Colon,
    gText_3Colon,
    gText_4Colon,
    gText_5Colon,
};

/*static*/ const u16 sUnknown_8478EA8[] = {92, 132, 172, 212};
/*static*/ const u16 sUnknown_8478EB0[] = {30, 45, 60, 75, 90};
/*static*/ const u16 sUnknown_8478EBA[] = {12, 28, 44, 60, 76};

struct
{
    u8 id;
    void (*func)(void);
} const gUnknown_8478EC4[] =
{
    {0, sub_8154A2C},
    {1, sub_8154B34},
    {2, sub_8154F80},
    {3, sub_81556E0},
    {4, sub_8155A78},
    {5, sub_8155B4C},
    {6, sub_8155C2C},
    {7, sub_8155C80},
    {8, unused_0},
    {9, nullsub_98},
};

// This is declared inside pokeemerald's sub_80296A8
const u8 gUnknown_8478F14[5] = {0, 1, 2, 3, 4};
