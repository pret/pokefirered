#include "global.h"
#include "gflib.h"
#include "graphics.h"
#include "m4a.h"
#include "scanline_effect.h"
#include "task.h"
#include "new_menu_helpers.h"
#include "event_data.h"
#include "help_system.h"
#include "menu_indicators.h"
#include "overworld.h"
#include "strings.h"
#include "menu.h"
#include "pokedex_screen.h"
#include "data.h"
#include "pokedex.h"
#include "trainer_pokemon_sprites.h"
#include "constants/songs.h"

struct PokedexScreenData
{
    u8 field_00;
    u8 field_01;
    u8 field_02[4];
    u32 field_08;
    u32 field_0C;
    u16 field_10;
    u16 field_12;
    u8 field_14;
    u8 field_15;
    u8 field_16;
    u8 field_17;
    u16 field_18[4];
    u8 field_20[4];
    u8 field_24[4];
    u8 field_28;
    u8 field_29;
    u8 field_2A;
    u8 field_2B;
    u8 field_2C;
    u8 field_2D;
    u8 field_2E;
    u8 field_2F;
    u32 field_30;
    u16 field_34;
    u16 field_36;
    u16 field_38;
    u16 field_3A;
    u16 field_3C;
    u16 field_3E;
    u8 field_40;
    u8 field_41;
    u8 field_42;
    struct ListMenuItem * field_44;
    u16 field_48;
    u8 field_4A[0x10];
    u16 field_5A;
    u16 * field_5C;
    u8 field_60;
    u8 field_61;
    u16 field_62;
    u8 field_64;
    u16 field_66;
    u16 field_68;
    u16 field_6A;
    u16 field_6C;
};

struct PokedexScreenWindowGfx
{
    const u16 * map;
    const u16 * pal;
};

struct PokedexCategoryPage
{
    const u16 * species;
    u8 count;
};

EWRAM_DATA struct PokedexScreenData * gUnknown_203ACF0 = NULL;

static void sub_810287C(u8 taskId);
static void sub_8102C28(void);
static void sub_8102F80(u8 taskId);
static void sub_810317C(void);
static void sub_8103238(u8 taskId);
static void sub_810345C(void);
static u16 sub_8103518(u8 a0);
static void sub_8103924(const struct ListMenuTemplate * a0, u8 a1);
static u8 sub_81039F0(void);
static void sub_8103988(u8 a0);
static void sub_8103AC8(u8 taskId);
static u8 sub_8104234(void);
static int sub_8104284(void);
static void sub_81042EC(u8 taskId);
static bool32 sub_8104664(u8 a0);
void sub_81047B0(u8 *windowId_p);
void sub_81047C8(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 colorIdx);
static void sub_810491C(u8 windowId, u8 fontId, u16 num, u8 x, u8 y, u8 colorIdx);
void sub_8104A34(u8 windowId, u8 fontId, u16 species, u8 x, u8 y);
static u16 sub_8104BBC(u8 caseId, bool8 whichDex);
void sub_8104C2C(const u8 *src);
void sub_8104E90(void);
bool8 sub_8104F0C(bool8 a0);
void sub_8105058(u8 a0);
void sub_8105178(u8 a0, u8 a1, u8 a2);
static bool8 sub_81052D0(u8 a0);
void sub_8105594(u8 a0, u8 a1);
void sub_8105E1C(u8 a0);
void sub_8106014(void);
void sub_810603C(void);
bool8 sub_8106838(u8 category, u8 a1);
u8 sub_81068A0(u8 a0);
void sub_810699C(u8 category);
bool8 sub_8106A20(u16 a0);
void sub_81067C0(void);
void sub_81068DC(u8 category, u8 a1);
u8 sub_8106AF8(u16 a0);
void sub_8106B34(void);
void sub_8106E78(const u8 *a0, s32 a1);
static void sub_8102EC0(s32 itemIndex, bool8 onInit, struct ListMenu *list);
static void sub_8102F48(u8 windowId, s32 itemId, u8 y);
static void sub_8103A40(u8 windowId, s32 itemId, u8 y);

#include "data/pokemon_graphics/footprint_table.h"

const u8 gUnknown_8440124[] = INCBIN_U8("graphics/pokedex/unk_8440124.bin.lz");
const u8 gUnknown_8440274[] = INCBIN_U8("graphics/pokedex/unk_8440274.4bpp.lz");
const u8 gUnknown_84403AC[] = INCBIN_U8("graphics/pokedex/unk_84403AC.4bpp.lz");
const u16 gUnknown_84404C8[] = INCBIN_U16("graphics/pokedex/unk_84404C8.gbapal");

const u16 gUnknown_84406C8[] = {
    RGB(24, 22, 17), RGB(26, 24, 20),
    RGB(26, 20, 15), RGB(27, 23, 19),
    RGB(28, 18, 15), RGB(28, 22, 19),
    RGB(30, 16, 13), RGB(29, 21, 18),
    RGB(28, 18, 15), RGB(28, 22, 19),
    RGB(26, 20, 15), RGB(27, 23, 19)
};

const u16 gUnknown_84406E0[] = INCBIN_U16("graphics/pokedex/unk_84406E0.gbapal");
const u16 gUnknown_84408E0[] = INCBIN_U16("graphics/pokedex/unk_84408E0.bin.lz");
const u16 gUnknown_8440BD8[] = INCBIN_U16("graphics/pokedex/unk_8440BD8.bin.lz");
const u32 gUnknown_8440EF0[] = INCBIN_U32("graphics/pokedex/unk_8440EF0.bin.lz");
const u16 gUnknown_844112C[] = INCBIN_U16("graphics/pokedex/unk_844112C.bin.lz");
const u16 gUnknown_84414BC[] = INCBIN_U16("graphics/pokedex/unk_84414BC.bin.lz");
const u32 gUnknown_8441808[] = INCBIN_U32("graphics/pokedex/unk_8441808.bin.lz");
const u16 gUnknown_8441A40[] = INCBIN_U16("graphics/pokedex/unk_8441A40.bin.lz");
const u16 gUnknown_8441D54[] = INCBIN_U16("graphics/pokedex/unk_8441D54.bin.lz");
const u16 gUnknown_8442004[] = INCBIN_U16("graphics/pokedex/unk_8442004.bin.lz");
const u16 gUnknown_844223C[] = INCBIN_U16("graphics/pokedex/unk_844223C.bin.lz");
const u16 gUnknown_84424E4[] = INCBIN_U16("graphics/pokedex/unk_84424E4.bin.lz");
const u16 gUnknown_8442838[] = INCBIN_U16("graphics/pokedex/unk_8442838.bin.lz");
const u16 gUnknown_8442BC0[] = INCBIN_U16("graphics/pokedex/unk_8442BC0.bin.lz");
const u16 gUnknown_8442EF8[] = INCBIN_U16("graphics/pokedex/unk_8442EF8.bin.lz");
const u16 gUnknown_844318C[] = INCBIN_U16("graphics/pokedex/unk_844318C.bin.lz");
const u16 gUnknown_8443420[] = INCBIN_U16("graphics/pokedex/unk_8443420.gbapal");
const u16 gUnknown_8443440[] = INCBIN_U16("graphics/pokedex/unk_8443440.gbapal");
const u16 gUnknown_8443460[] = INCBIN_U16("graphics/pokedex/unk_8443460.gbapal");
const u16 gUnknown_8443480[] = INCBIN_U16("graphics/pokedex/unk_8443480.gbapal");
const u16 gUnknown_84434A0[] = INCBIN_U16("graphics/pokedex/unk_84434A0.gbapal");
const u16 gUnknown_84434C0[] = INCBIN_U16("graphics/pokedex/unk_84434C0.gbapal");
const u16 gUnknown_84434E0[] = INCBIN_U16("graphics/pokedex/unk_84434E0.gbapal");
const u16 gUnknown_8443500[] = INCBIN_U16("graphics/pokedex/unk_8443500.gbapal");
const u16 gUnknown_8443520[] = INCBIN_U16("graphics/pokedex/unk_8443520.gbapal");
const u16 gUnknown_8443540[] = INCBIN_U16("graphics/pokedex/unk_8443540.gbapal");
const u16 gUnknown_8443560[] = INCBIN_U16("graphics/pokedex/unk_8443560.gbapal");
const u16 gUnknown_8443580[] = INCBIN_U16("graphics/pokedex/unk_8443580.gbapal");
const u16 gUnknown_84435A0[] = INCBIN_U16("graphics/pokedex/unk_84435A0.gbapal");
const u16 gUnknown_84435C0[] = INCBIN_U16("graphics/pokedex/unk_84435C0.gbapal");
const u16 gUnknown_84435E0[] = INCBIN_U16("graphics/pokedex/unk_84435E0.gbapal");
const u8 gUnknown_8443600[] = INCBIN_U8("graphics/pokedex/unk_8443600.4bpp");
const u32 gUnknown_8443620[] = INCBIN_U32("graphics/pokedex/unk_8443620.bin.lz");
const u32 gUnknown_8443910[] = INCBIN_U32("graphics/pokedex/unk_8443910.bin.lz");
const u32 gUnknown_8443988[] = INCBIN_U32("graphics/pokedex/unk_8443988.bin.lz");
const u32 gUnknown_84439FC[] = INCBIN_U32("graphics/pokedex/unk_84439FC.bin.lz");
const u32 gUnknown_8443A78[] = INCBIN_U32("graphics/pokedex/unk_8443A78.bin.lz");
const u32 gUnknown_8443AF8[] = INCBIN_U32("graphics/pokedex/unk_8443AF8.bin.lz");
const u32 gUnknown_8443BB0[] = INCBIN_U32("graphics/pokedex/unk_8443BB0.bin.lz");
const u32 gUnknown_8443C54[] = INCBIN_U32("graphics/pokedex/unk_8443C54.bin.lz");
const u16 gUnknown_8443D00[] = INCBIN_U16("graphics/pokedex/unk_8443D00.4bpp");

#include "data/pokemon/pokedex_orders.h"

static const u8 gExpandedPlaceholder_PokedexDescription[] = _("");

#include "data/pokemon/pokedex_text.h"
#include "data/pokemon/pokedex_entries.h"

static const struct BgTemplate sUnknown_8451EBC[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 5,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x0000
    },
    {
        .bg = 1,
        .charBaseIndex = 2,
        .mapBaseIndex = 4,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x0000
    },
    {
        .bg = 2,
        .charBaseIndex = 2,
        .mapBaseIndex = 6,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x0000
    },
    {
        .bg = 3,
        .charBaseIndex = 0,
        .mapBaseIndex = 7,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x0000
    },
};

static const struct WindowTemplate sUnknown_8451ECC[] = {
    {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 0,
        .width = 30,
        .height = 2,
        .paletteNum = 15,
        .baseBlock = 0x03c4
    },
    {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 18,
        .width = 30,
        .height = 2,
        .paletteNum = 15,
        .baseBlock = 0x0388
    },
    {
        .bg = 255,
        .tilemapLeft = 0,
        .tilemapTop = 0,
        .width = 0,
        .height = 0,
        .paletteNum = 0,
        .baseBlock = 0x0000
    },
};

static const struct PokedexScreenData sUnknown_8451EE4 = {
    .field_10 = 1,
    .field_14 = -1,
    .field_15 = -1,
    .field_16 = -1,
    .field_18 = {-1, -1, -1, -1},
    .field_20 = {-1, -1, -1, -1},
    .field_24 = {-1, -1, -1, -1},
    .field_40 = -1, 
    .field_4A = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
    .field_60 = -1, 
    .field_61 = -1,
};


static const struct WindowTemplate sUnknown_8451F54 = {
   .bg = 1,
   .tilemapLeft = 1,
   .tilemapTop = 2,
   .width = 20,
   .height = 16,
   .paletteNum = 0,
   .baseBlock = 0x0008
 };

static const struct WindowTemplate sUnknown_8451F5C = {
   .bg = 1,
   .tilemapLeft = 21,
   .tilemapTop = 11,
   .width = 8,
   .height = 6,
   .paletteNum = 1,
   .baseBlock = 0x0148
 };

static const struct WindowTemplate sUnknown_8451F64 = {
   .bg = 1,
   .tilemapLeft = 21,
   .tilemapTop = 2,
   .width = 9,
   .height = 9,
   .paletteNum = 0,
   .baseBlock = 0x0178
 };

static const struct ListMenuItem sUnknown_8451F6C[] = {
    {gText_PokemonList, -3},
    {gText_NumericalMode, 9},
    {gText_PokemonHabitats, -3},
    {gText_DexCategory_GrasslandPkmn, 0},
    {gText_DexCategory_ForestPkmn, 1},
    {gText_DexCategory_WatersEdgePkmn, 2},
    {gText_DexCategory_SeaPkmn, 3},
    {gText_DexCategory_CavePkmn, 4},
    {gText_DexCategory_MountainPkmn, 5},
    {gText_DexCategory_RoughTerrainPkmn, 6},
    {gText_DexCategory_UrbanPkmn, 7},
    {gText_DexCategory_RarePkmn, 8},
    {gText_Search, -3},
    {gText_AToZMode, 10},
    {gText_TypeMode, 11},
    {gText_LightestMode, 12},
    {gText_SmallestMode, 13},
    {gText_PokedexOther, -3},
    {gText_ClosePokedex, -2},
};

static const struct ListMenuTemplate sUnknown_8452004 = {
    .items = sUnknown_8451F6C,
    .moveCursorFunc = sub_8102EC0,
    .itemPrintFunc = sub_8102F48,
    .totalItems = NELEMS(sUnknown_8451F6C), 
    .maxShowed = 9,
    .windowId = 0, 
    .header_X = 0, 
    .item_X = 12, 
    .cursor_X = 4,
    .upText_Y = 2,
    .cursorPal = 1,
    .fillValue = 0,
    .cursorShadowPal = 3,
    .lettersSpacing = 1,
    .itemVerticalPadding = 0,
    .scrollMultiple = 0,
    .fontId = 2,
    .cursorKind = 0,
};

static const struct ListMenuItem sUnknown_845201C[] = {
    {gText_PokemonList, -3},
    {gText_NumericalModeKanto, 9},
    {gText_NumericalModeNational, 14},
    {gText_PokemonHabitats, -3},
    {gText_DexCategory_GrasslandPkmn, 0},
    {gText_DexCategory_ForestPkmn, 1},
    {gText_DexCategory_WatersEdgePkmn, 2},
    {gText_DexCategory_SeaPkmn, 3},
    {gText_DexCategory_CavePkmn, 4},
    {gText_DexCategory_MountainPkmn, 5},
    {gText_DexCategory_RoughTerrainPkmn, 6},
    {gText_DexCategory_UrbanPkmn, 7},
    {gText_DexCategory_RarePkmn, 8},
    {gText_Search, -3},
    {gText_AToZMode, 10},
    {gText_TypeMode, 11},
    {gText_LightestMode, 12},
    {gText_SmallestMode, 13},
    {gText_PokedexOther, -3},
    {gText_ClosePokedex, -2},
};

static const struct ListMenuTemplate sUnknown_84520BC = {
    .items = sUnknown_845201C,
    .moveCursorFunc = sub_8102EC0,
    .itemPrintFunc = sub_8102F48,
    .totalItems = NELEMS(sUnknown_845201C),
    .maxShowed = 9,
    .windowId = 0, 
    .header_X = 0, 
    .item_X = 12, 
    .cursor_X = 4,
    .upText_Y = 2,
    .cursorPal = 1,
    .fillValue = 0,
    .cursorShadowPal = 3,
    .lettersSpacing = 1,
    .itemVerticalPadding = 0,
    .scrollMultiple = 0,
    .fontId = 2,
    .cursorKind = 0,
};

static const struct ScrollArrowsTemplate sUnknown_84520D4 = {
    .firstArrowType = 2, 
    .firstX = 200, 
    .firstY = 19, 
    .secondArrowType = 3, 
    .secondX = 200, 
    .secondY = 141,
    .fullyUpThreshold = 0, 
    .fullyDownThreshold = 10, 
    .tileTag = 2000, 
    .palTag = 0xFFFF,
    .palNum = 1
};

static const struct ScrollArrowsTemplate sUnknown_84520E4 = {
    .firstArrowType = 2, 
    .firstX = 200, 
    .firstY = 19, 
    .secondArrowType = 3, 
    .secondX = 200, 
    .secondY = 141,
    .fullyUpThreshold = 0, 
    .fullyDownThreshold = 11, 
    .tileTag = 2000, 
    .palTag = 0xFFFF,
    .palNum = 1
};


static const struct PokedexScreenWindowGfx sUnknown_84520F4[] = {
    {.map = gUnknown_84414BC, .pal = gUnknown_84434A0},
    {.map = gUnknown_844112C, .pal = gUnknown_8443480},
    {.map = gUnknown_8442838, .pal = gUnknown_8443580},
    {.map = gUnknown_8442004, .pal = gUnknown_8443520},
    {.map = gUnknown_84408E0, .pal = gUnknown_8443420},
    {.map = gUnknown_8441A40, .pal = gUnknown_84434E0},
    {.map = gUnknown_84424E4, .pal = gUnknown_8443560},
    {.map = gUnknown_8440BD8, .pal = gUnknown_8443440},
    {.map = gUnknown_8441D54, .pal = gUnknown_8443500},
    {.map = gUnknown_844223C, .pal = gUnknown_8443540},
    {.map = gUnknown_8E9C16C, .pal = gUnknown_8E9C14C},
    {.map = gUnknown_8442BC0, .pal = gUnknown_84435A0},
    {.map = gUnknown_8442EF8, .pal = gUnknown_84435C0},
    {.map = gUnknown_844318C, .pal = gUnknown_84435E0},
    {.map = gUnknown_844223C, .pal = gUnknown_8443540},
};

static const struct WindowTemplate sUnknown_845216C = {
    .bg = 1,
    .tilemapLeft = 2,
    .tilemapTop = 2,
    .width = 23,
    .height = 16,
    .paletteNum = 0,
    .baseBlock = 0x0008
};

static const struct ListMenuTemplate sUnknown_8452174 = {
    .items = sUnknown_8451F6C,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .itemPrintFunc = sub_8103A40,
    .totalItems = 0, 
    .maxShowed = 9,
    .windowId = 0, 
    .header_X = 0, 
    .item_X = 56, 
    .cursor_X = 4,
    .upText_Y = 2,
    .cursorPal = 1,
    .fillValue = 0,
    .cursorShadowPal = 3,
    .lettersSpacing = 1,
    .itemVerticalPadding = 0,
    .scrollMultiple = 1,
    .fontId = 2,
    .cursorKind = 0,
};

static const struct ListMenuWindowRect sUnknown_845218C = {
    .x = 0, 
    .y = 0, 
    .width = 5, 
    .height = 16, 
    .palNum = 0,
};

// Unused
static const u8 gUnknown_8452194[] = {
    0x05, 0x00, 0x02, 0x10, 0x01, 0x00, 0x00, 0x00, 
    0x07, 0x00, 0x08, 0x10, 0x00, 0x00, 0x00, 0x00, 
    0x0f, 0x00, 0x08, 0x10, 0x02, 0x00, 0x00, 0x00, 
    0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00
};

static const struct ScrollArrowsTemplate sUnknown_84521B4 = {
    .firstArrowType = 2, 
    .firstX = 200, 
    .firstY = 19, 
    .secondArrowType = 3, 
    .secondX = 200, 
    .secondY = 141,
    .fullyUpThreshold = 0, 
    .fullyDownThreshold = 0, 
    .tileTag = 2000, 
    .palTag = 0xFFFF,
    .palNum = 1,
};

static const struct WindowTemplate sUnknown_84521C4 = {
    .bg = 2,
    .tilemapLeft = 0,
    .tilemapTop = 0,
    .width = 8,
    .height = 8,
    .paletteNum = 0,
    .baseBlock = 0x0000
};

static const struct WindowTemplate sUnknown_84521CC = {
    .bg = 1,
    .tilemapLeft = 0,
    .tilemapTop = 0,
    .width = 8,
    .height = 5,
    .paletteNum = 0,
    .baseBlock = 0x0000
};

const struct WindowTemplate gUnknown_84521D4 = {
    .bg = 1,
    .tilemapLeft = 19,
    .tilemapTop = 3,
    .width = 8,
    .height = 8,
    .paletteNum = 9,
    .baseBlock = 0x01a8
};

const struct WindowTemplate gUnknown_84521DC = {
    .bg = 1,
    .tilemapLeft = 2,
    .tilemapTop = 3,
    .width = 13,
    .height = 8,
    .paletteNum = 0,
    .baseBlock = 0x01e8
};

const struct WindowTemplate gUnknown_84521E4 = {
    .bg = 1,
    .tilemapLeft = 0,
    .tilemapTop = 11,
    .width = 30,
    .height = 7,
    .paletteNum = 0,
    .baseBlock = 0x0250
};

const struct WindowTemplate gUnknown_84521EC = {
    .bg = 2,
    .tilemapLeft = 1,
    .tilemapTop = 2,
    .width = 4,
    .height = 4,
    .paletteNum = 10,
    .baseBlock = 0x01a8
};

const struct WindowTemplate gUnknown_84521F4 = {
    .bg = 2,
    .tilemapLeft = 5,
    .tilemapTop = 2,
    .width = 8,
    .height = 3,
    .paletteNum = 0,
    .baseBlock = 0x01b8
};

const struct WindowTemplate gUnknown_84521FC = {
    .bg = 2,
    .tilemapLeft = 2,
    .tilemapTop = 7,
    .width = 10,
    .height = 2,
    .paletteNum = 0,
    .baseBlock = 0x01d0
};

const struct WindowTemplate gUnknown_8452204 = {
    .bg = 2,
    .tilemapLeft = 18,
    .tilemapTop = 2,
    .width = 10,
    .height = 2,
    .paletteNum = 0,
    .baseBlock = 0x01e4
};

const struct WindowTemplate gUnknown_845220C = {
    .bg = 2,
    .tilemapLeft = 5,
    .tilemapTop = 5,
    .width = 8,
    .height = 2,
    .paletteNum = 11,
    .baseBlock = 0x01f8
};

const struct WindowTemplate gUnknown_8452214 = {
    .bg = 2,
    .tilemapLeft = 17,
    .tilemapTop = 4,
    .width = 12,
    .height = 9,
    .paletteNum = 0,
    .baseBlock = 0x0208
};

static const struct WindowTemplate sUnknown_845221C = {
    .bg = 2,
    .tilemapLeft = 13,
    .tilemapTop = 4,
    .width = 4,
    .height = 3,
    .paletteNum = 0,
    .baseBlock = 0x0274
};

static const struct WindowTemplate sUnknown_8452224 = {
    .bg = 2,
    .tilemapLeft = 13,
    .tilemapTop = 7,
    .width = 4,
    .height = 3,
    .paletteNum = 0,
    .baseBlock = 0x0280
};

static const struct WindowTemplate sUnknown_845222C = {
    .bg = 2,
    .tilemapLeft = 13,
    .tilemapTop = 10,
    .width = 4,
    .height = 3,
    .paletteNum = 0,
    .baseBlock = 0x028c
};

static const struct WindowTemplate sUnknown_8452234 = {
    .bg = 2,
    .tilemapLeft = 13,
    .tilemapTop = 13,
    .width = 4,
    .height = 4,
    .paletteNum = 0,
    .baseBlock = 0x0298
};

static const struct WindowTemplate sUnknown_845223C = {
    .bg = 2,
    .tilemapLeft = 17,
    .tilemapTop = 13,
    .width = 4,
    .height = 4,
    .paletteNum = 0,
    .baseBlock = 0x02a8
};

static const struct WindowTemplate sUnknown_8452244 = {
    .bg = 2,
    .tilemapLeft = 21,
    .tilemapTop = 13,
    .width = 4,
    .height = 4,
    .paletteNum = 0,
    .baseBlock = 0x02b8
};

static const struct WindowTemplate sUnknown_845224C = {
    .bg = 2,
    .tilemapLeft = 25,
    .tilemapTop = 13,
    .width = 4,
    .height = 4,
    .paletteNum = 0,
    .baseBlock = 0x02c8
};

struct {
    const struct WindowTemplate * window;
    const u32 * tilemap;
} const gUnknown_8452254[] = {
    {&sUnknown_845221C, gUnknown_8443910},
    {&sUnknown_8452224, gUnknown_8443988},
    {&sUnknown_845222C, gUnknown_84439FC},
    {&sUnknown_8452234, gUnknown_8443A78},
    {&sUnknown_845223C, gUnknown_8443AF8},
    {&sUnknown_8452244, gUnknown_8443BB0},
    {&sUnknown_845224C, gUnknown_8443C54},
};

static const u16 sUnknown_845228C[] = INCBIN_U16("graphics/pokedex/unk_845228C.bin");

static const u8 sUnknown_845230C[][4] = {
    {0x0b, 0x03, 0x0b, 0x0b},
};

static const u8 sUnknown_8452310[][4] = {
    {0x03, 0x03, 0x0b, 0x03},
    {0x12, 0x09, 0x0a, 0x0b},
};

static const u8 sUnknown_8452318[][4] = {
    {0x01, 0x02, 0x09, 0x02},
    {0x0b, 0x09, 0x03, 0x0b},
    {0x15, 0x03, 0x15, 0x0b}
};

static const u8 sUnknown_8452324[][4] = {
    {0x00, 0x02, 0x06, 0x03},
    {0x07, 0x0a, 0x00, 0x0c},
    {0x0f, 0x0a, 0x16, 0x0b},
    {0x16, 0x02, 0x0f, 0x04}
};

const u8 (*const gUnknown_8452334[])[4] = {
    sUnknown_845230C,
    sUnknown_8452310,
    sUnknown_8452318,
    sUnknown_8452324,
};

static const u8 * const sDexCategoryNamePtrs[] = {
    gText_DexCategory_GrasslandPkmn,
    gText_DexCategory_ForestPkmn,
    gText_DexCategory_WatersEdgePkmn,
    gText_DexCategory_SeaPkmn,
    gText_DexCategory_CavePkmn,
    gText_DexCategory_MountainPkmn,
    gText_DexCategory_RoughTerrainPkmn,
    gText_DexCategory_UrbanPkmn,
    gText_DexCategory_RarePkmn,
};

const u16 gUnknown_8452368[] = INCBIN_U16("graphics/pokedex/unk_8452368.gbapal");

static const u8 sUnknown_8452388[][30] = {
    {
        0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 
        0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 
        0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e
    }, {
        0x05, 0x0b, 0x11, 0x17, 0x1d, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 
        0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 
        0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e
    }, {
        0x02, 0x05, 0x08, 0x0b, 0x0e, 0x11, 0x14, 0x17, 0x1a, 0x1d, 
        0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 
        0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e
    }, {
        0x02, 0x03, 0x05, 0x07, 0x09, 0x0b, 0x0d, 0x0f, 0x11, 0x13, 
        0x15, 0x17, 0x19, 0x1b, 0x1d, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 
        0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e
    }, {
        0x02, 0x04, 0x05, 0x07, 0x08, 0x0a, 0x0b, 0x0d, 0x0e, 0x10, 
        0x11, 0x13, 0x14, 0x16, 0x17, 0x19, 0x1a, 0x1c, 0x1d, 0x1e, 
        0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e
    }, {
        0x01, 0x02, 0x03, 0x04, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 
        0x0d, 0x0f, 0x10, 0x11, 0x13, 0x14, 0x15, 0x17, 0x18, 0x19, 
        0x1b, 0x1c, 0x1d, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e
    }, {
        0x01, 0x02, 0x03, 0x04, 0x05, 0x07, 0x08, 0x09, 0x0a, 0x0b, 
        0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x14, 0x15, 0x16, 
        0x17, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1e, 0x1e, 0x1e
    }, {
        0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0b, 
        0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x15, 0x16, 
        0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1e, 0x1e
    }, {
        0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 
        0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 
        0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e
    }, {
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 
        0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 
        0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d
    },
};

static const struct ScrollArrowsTemplate sUnknown_84524B4 = {
    .firstArrowType = 0, 
    .firstX = 16, 
    .firstY = 80, 
    .secondArrowType = 1, 
    .secondX = 224, 
    .secondY = 80,
    .fullyUpThreshold = 0, 
    .fullyDownThreshold = 0, 
    .tileTag = 2000, 
    .palTag = 0xFFFF,
    .palNum = 1,
};

const struct CursorStruct gUnknown_84524C4 = {
    .left = 0, 
    .top = 160,
    .rowWidth = 64, 
    .rowHeight = 40, 
    .tileTag = 2002, 
    .palTag = 0xFFFF,
    .palNum = 4,
};

#include "data/pokemon/pokedex_categories.h"

void sub_81024C0(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_81024D4(void)
{
    if (!gPaletteFade.active || IsDma3ManagerBusyWithBgCopy())
    {
        RunTasks();
        RunTextPrinters();
        AnimateSprites();
        BuildOamBuffer();
    }
    else
    {
        UpdatePaletteFade();
    }
}

void sub_810250C(void)
{
    bool8 natDex;
    u8 taskId;

    natDex = IsNationalPokedexEnabled();
    m4aSoundVSyncOff();
    SetVBlankCallback(NULL);
    ResetPaletteFade();
    ResetSpriteData();
    ResetTasks();
    ScanlineEffect_Stop();
    ResetBgsAndClearDma3BusyFlags(TRUE);
    InitBgsFromTemplates(0, sUnknown_8451EBC, NELEMS(sUnknown_8451EBC));
    SetBgTilemapBuffer(3, (u16*)Alloc(BG_SCREEN_SIZE));
    SetBgTilemapBuffer(2, (u16*)Alloc(BG_SCREEN_SIZE));
    SetBgTilemapBuffer(1, (u16*)Alloc(BG_SCREEN_SIZE));
    SetBgTilemapBuffer(0, (u16*)Alloc(BG_SCREEN_SIZE));
    if (natDex)
        DecompressAndLoadBgGfxUsingHeap(3, (void*)gUnknown_84403AC, BG_SCREEN_SIZE, 0, 0);
    else
        DecompressAndLoadBgGfxUsingHeap(3, (void*)gUnknown_8440274, BG_SCREEN_SIZE, 0, 0);
    InitWindows(sUnknown_8451ECC);
    DeactivateAllTextPrinters();
    m4aSoundVSyncOn();
    SetVBlankCallback(sub_81024C0);
    EnableInterrupts(INTR_FLAG_VBLANK);
    taskId = CreateTask(sub_810287C, 0);
    gUnknown_203ACF0 = Alloc(sizeof(struct PokedexScreenData));
    *gUnknown_203ACF0 = sUnknown_8451EE4;
    gUnknown_203ACF0->field_00 = taskId;
    gUnknown_203ACF0->field_44 = Alloc(NATIONAL_DEX_COUNT * sizeof(struct ListMenuItem));
    gUnknown_203ACF0->field_6A = sub_8104BBC(0, 1);
    gUnknown_203ACF0->field_6C = sub_8104BBC(1, 1);
    gUnknown_203ACF0->field_66 = sub_8104BBC(0, 0);
    gUnknown_203ACF0->field_68 = sub_8104BBC(1, 0);
    sub_8072474(0x80);
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
    gPaletteFade.bufferTransferDisabled = TRUE;
    if (natDex)
        LoadPalette(gUnknown_84406E0, 0, 0x200);
    else
        LoadPalette(gUnknown_84404C8, 0, 0x200);
    FillBgTilemapBufferRect(3, 0x001, 0, 0, 32, 32, 0);
    FillBgTilemapBufferRect(2, 0x000, 0, 0, 32, 32, 0x11);
    FillBgTilemapBufferRect(1, 0x000, 0, 0, 32, 32, 0x11);
    FillBgTilemapBufferRect(0, 0x0003, 0, 0, 32, 2, 0xF);
    FillBgTilemapBufferRect(0, 0x0000, 0, 2, 32, 16, 0x11);
    FillBgTilemapBufferRect(0, 0x003, 0, 18, 32, 2, 0xF);
}

void CB2_OpenPokedexFromStartMenu(void)
{
    sub_810250C();
    ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY, 0);
    SetMainCallback2(sub_81024D4);
    SetHelpContext(HELPCONTEXT_POKEDEX);
}

#define FREE_IF_NOT_NULL(ptr0) ({ void * ptr = (ptr0); if (ptr) Free(ptr); })

bool8 sub_8102798(void)
{
    switch (gMain.state)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        gMain.state++;
        return FALSE;
    case 1:
        if (!gPaletteFade.active)
            gMain.state = 2;
        else
            UpdatePaletteFade();
        return FALSE;
    case 2:
        FREE_IF_NOT_NULL(gUnknown_203ACF0->field_44);
        FREE_IF_NOT_NULL(gUnknown_203ACF0);
        FreeAllWindowBuffers();
        FREE_IF_NOT_NULL(GetBgTilemapBuffer(0));
        FREE_IF_NOT_NULL(GetBgTilemapBuffer(1));
        FREE_IF_NOT_NULL(GetBgTilemapBuffer(2));
        FREE_IF_NOT_NULL(GetBgTilemapBuffer(3));
        sub_807249C();
        break;
    }
    return TRUE;
}

void sub_8102858(void)
{
    if (sub_8102798())
    {
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);
        SetMainCallback2(CB2_ReturnToFieldWithOpenMenu);
    }
}

static void sub_810287C(u8 taskId)
{
    int i;
    switch (gUnknown_203ACF0->field_01)
    {
    case 0:
        gUnknown_203ACF0->field_08 = 0;
        for (i = 0; i < 9; i++)
            gUnknown_203ACF0->field_08 |= (sub_81068A0(i) << i);
        gUnknown_203ACF0->field_01 = 2;
        break;
    case 1:
        RemoveScrollIndicatorArrowPair(gUnknown_203ACF0->field_60);
        sub_81047B0(&gUnknown_203ACF0->field_14);
        sub_81047B0(&gUnknown_203ACF0->field_15);
        sub_81047B0(&gUnknown_203ACF0->field_16);
        SetMainCallback2(sub_8102858);
        DestroyTask(taskId);
        break;
    case 2:
        sub_8102C28();
        gUnknown_203ACF0->field_01 = 3;
        break;
    case 3:
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(0);
        gUnknown_203ACF0->field_01 = 4;
        break;
    case 4:
        ShowBg(3);
        ShowBg(2);
        ShowBg(1);
        ShowBg(0);
        if (gPaletteFade.bufferTransferDisabled)
        {
            gPaletteFade.bufferTransferDisabled = FALSE;
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0, RGB_WHITEALPHA);
        }
        else
            BeginNormalPaletteFade(0xFFFF7FFF, 0, 16, 0, RGB_WHITEALPHA);
        gUnknown_203ACF0->field_01 = 5;
        break;
    case 5:
        ListMenuGetScrollAndRow(gUnknown_203ACF0->field_17, &gUnknown_203ACF0->field_62, NULL);
        if (IsNationalPokedexEnabled())
            gUnknown_203ACF0->field_60 = AddScrollIndicatorArrowPair(&sUnknown_84520E4, &gUnknown_203ACF0->field_62);
        else
            gUnknown_203ACF0->field_60 = AddScrollIndicatorArrowPair(&sUnknown_84520D4, &gUnknown_203ACF0->field_62);
        gUnknown_203ACF0->field_01 = 6;
        break;
    case 6:
        gUnknown_203ACF0->field_0C = ListMenu_ProcessInput(gUnknown_203ACF0->field_17);
        ListMenuGetScrollAndRow(gUnknown_203ACF0->field_17, &gUnknown_203ACF0->field_62, NULL);
        if (JOY_NEW(A_BUTTON))
        {
            switch (gUnknown_203ACF0->field_0C)
            {
            case LIST_CANCEL:
                gUnknown_203ACF0->field_01 = 1;
                break;
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
                if (sub_81068A0(gUnknown_203ACF0->field_0C))
                {
                    RemoveScrollIndicatorArrowPair(gUnknown_203ACF0->field_60);
                    gUnknown_203ACF0->field_28 = gUnknown_203ACF0->field_0C;
                    BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
                    gUnknown_203ACF0->field_01 = 7;
                }
                break;
            case 9:
            case 14:
                RemoveScrollIndicatorArrowPair(gUnknown_203ACF0->field_60);
                gUnknown_203ACF0->field_42 = gUnknown_203ACF0->field_0C - 9;
                BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
                gUnknown_203ACF0->field_01 = 9;
                break;
            case 10:
            case 11:
            case 12:
            case 13:
                RemoveScrollIndicatorArrowPair(gUnknown_203ACF0->field_60);
                gUnknown_203ACF0->field_42 = gUnknown_203ACF0->field_0C - 9;
                gUnknown_203ACF0->field_38 = gUnknown_203ACF0->field_3A = 0;
                BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
                gUnknown_203ACF0->field_01 = 8;
                break;
            }
            break;
        }
        if (JOY_NEW(B_BUTTON))
        {
            gUnknown_203ACF0->field_01 = 1;
        }
        break;
    case 7:
        DestroyListMenuTask(gUnknown_203ACF0->field_17, &gUnknown_203ACF0->field_12, &gUnknown_203ACF0->field_10);
        FillBgTilemapBufferRect_Palette0(1, 0, 0, 0, 32, 20);
        CopyBgTilemapBufferToVram(1);
        sub_81047B0(&gUnknown_203ACF0->field_14);
        sub_81047B0(&gUnknown_203ACF0->field_15);
        sub_81047B0(&gUnknown_203ACF0->field_16);
        gUnknown_203ACF0->field_2B = 0;
        gUnknown_203ACF0->field_2D = 0;
        gUnknown_203ACF0->field_2F = 0;
        gTasks[taskId].func = sub_8103AC8;
        gUnknown_203ACF0->field_01 = 0;
        break;
    case 8:
        DestroyListMenuTask(gUnknown_203ACF0->field_17, &gUnknown_203ACF0->field_12, &gUnknown_203ACF0->field_10);
        HideBg(1);
        sub_81047B0(&gUnknown_203ACF0->field_14);
        sub_81047B0(&gUnknown_203ACF0->field_15);
        sub_81047B0(&gUnknown_203ACF0->field_16);
        gTasks[taskId].func = sub_8103238;
        gUnknown_203ACF0->field_01 = 0;
        break;
    case 9:
        DestroyListMenuTask(gUnknown_203ACF0->field_17, &gUnknown_203ACF0->field_12, &gUnknown_203ACF0->field_10);
        HideBg(1);
        sub_81047B0(&gUnknown_203ACF0->field_14);
        sub_81047B0(&gUnknown_203ACF0->field_15);
        sub_81047B0(&gUnknown_203ACF0->field_16);
        gTasks[taskId].func = sub_8102F80;
        gUnknown_203ACF0->field_01 = 0;
        break;
    }
}

static void sub_8102C28(void)
{
    struct ListMenuTemplate listMenuTemplate;
    FillBgTilemapBufferRect(3, 0x00E, 0, 0, 30, 20, 0x00);
    FillBgTilemapBufferRect(2, 0x000, 0, 0, 30, 20, 0x11);
    FillBgTilemapBufferRect(1, 0x000, 0, 0, 30, 20, 0x11);
    gUnknown_203ACF0->field_14 = AddWindow(&sUnknown_8451F54);
    gUnknown_203ACF0->field_15 = AddWindow(&sUnknown_8451F5C);
    gUnknown_203ACF0->field_16 = AddWindow(&sUnknown_8451F64);
    if (IsNationalPokedexEnabled())
    {
        listMenuTemplate = sUnknown_84520BC;
        listMenuTemplate.windowId = gUnknown_203ACF0->field_14;
        gUnknown_203ACF0->field_17 = ListMenuInit(&listMenuTemplate, gUnknown_203ACF0->field_12, gUnknown_203ACF0->field_10);
        FillWindowPixelBuffer(gUnknown_203ACF0->field_16, PIXEL_FILL(0));
        sub_81047C8(gUnknown_203ACF0->field_16, 0, gText_Seen, 0, 2, 0);
        sub_81047C8(gUnknown_203ACF0->field_16, 0, gText_Kanto, 8, 13, 0);
        sub_810491C(gUnknown_203ACF0->field_16, 0, gUnknown_203ACF0->field_66, 52, 13, 2);
        sub_81047C8(gUnknown_203ACF0->field_16, 0, gText_National, 8, 24, 0);
        sub_810491C(gUnknown_203ACF0->field_16, 0, gUnknown_203ACF0->field_6A, 52, 24, 2);
        sub_81047C8(gUnknown_203ACF0->field_16, 0, gText_Owned, 0, 37, 0);
        sub_81047C8(gUnknown_203ACF0->field_16, 0, gText_Kanto, 8, 48, 0);
        sub_810491C(gUnknown_203ACF0->field_16, 0, gUnknown_203ACF0->field_68, 52, 48, 2);
        sub_81047C8(gUnknown_203ACF0->field_16, 0, gText_National, 8, 59, 0);
        sub_810491C(gUnknown_203ACF0->field_16, 0, gUnknown_203ACF0->field_6C, 52, 59, 2);
    }
    else
    {
        listMenuTemplate = sUnknown_8452004;
        listMenuTemplate.windowId = gUnknown_203ACF0->field_14;
        gUnknown_203ACF0->field_17 = ListMenuInit(&listMenuTemplate, gUnknown_203ACF0->field_12, gUnknown_203ACF0->field_10);
        FillWindowPixelBuffer(gUnknown_203ACF0->field_16, PIXEL_FILL(0));
        sub_81047C8(gUnknown_203ACF0->field_16, 1, gText_Seen, 0, 9, 0);
        sub_810491C(gUnknown_203ACF0->field_16, 1, gUnknown_203ACF0->field_66, 32, 21, 2);
        sub_81047C8(gUnknown_203ACF0->field_16, 1, gText_Owned, 0, 37, 0);
        sub_810491C(gUnknown_203ACF0->field_16, 1, gUnknown_203ACF0->field_68, 32, 49, 2);
    }
    FillWindowPixelBuffer(0, PIXEL_FILL(15));
    sub_8106E78(gText_PokedexTableOfContents, 1);
    FillWindowPixelBuffer(1, PIXEL_FILL(15));
    sub_8104C2C(gText_PickOK);
    PutWindowTilemap(0);
    CopyWindowToVram(0, COPYWIN_GFX);
    PutWindowTilemap(1);
    CopyWindowToVram(1, COPYWIN_GFX);
    PutWindowTilemap(gUnknown_203ACF0->field_16);
    CopyWindowToVram(gUnknown_203ACF0->field_16, COPYWIN_GFX);
}

static void sub_8102EC0(s32 itemIndex, bool8 onInit, struct ListMenu *list)
{
    if (!onInit)
        PlaySE(SE_SELECT);
    if (itemIndex == LIST_CANCEL)
    {
        CopyToWindowPixelBuffer(gUnknown_203ACF0->field_15, gUnknown_8440EF0, 0x000, 0x000);
        LoadPalette(gUnknown_8443460, 0x10, 0x20);
    }
    else
    {
        CopyToWindowPixelBuffer(gUnknown_203ACF0->field_15, sUnknown_84520F4[itemIndex].map, 0x000, 0x000);
        LoadPalette(sUnknown_84520F4[itemIndex].pal, 0x10, 0x20);
    }
    PutWindowTilemap(gUnknown_203ACF0->field_15);
    CopyWindowToVram(gUnknown_203ACF0->field_15, COPYWIN_GFX);
}

static void sub_8102F48(u8 windowId, s32 itemId, u8 y)
{
    u32 itemId_ = itemId;
    if (itemId_ > 8 || gUnknown_203ACF0->field_08 & (1 << itemId_))
        ListMenuOverrideSetColors(1, 0, 3);
    else
        ListMenuOverrideSetColors(10, 0, 11);
}

static void sub_8102F80(u8 taskId)
{
    switch (gUnknown_203ACF0->field_01)
    {
    case 0:
        ListMenuLoadStdPalAt(0x10, 0);
        ListMenuLoadStdPalAt(0x20, 1);
        gUnknown_203ACF0->field_48 = sub_8103518(gUnknown_203ACF0->field_42);
        gUnknown_203ACF0->field_01 = 2;
        break;
    case 1:
        sub_8103988(gUnknown_203ACF0->field_42);
        HideBg(1);
        sub_81047B0(&gUnknown_203ACF0->field_40);
        gTasks[taskId].func = sub_810287C;
        gUnknown_203ACF0->field_01 = 0;
        break;
    case 2:
        sub_810317C();
        gUnknown_203ACF0->field_01 = 3;
        break;
    case 3:
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(1);
        gUnknown_203ACF0->field_01 = 4;
        break;
    case 4:
        ShowBg(1);
        BeginNormalPaletteFade(0xFFFF7FFF, 0, 16, 0, RGB_WHITEALPHA);
        gUnknown_203ACF0->field_01 = 5;
        break;
    case 5:
        ListMenuGetScrollAndRow(gUnknown_203ACF0->field_17, &gUnknown_203ACF0->field_62, NULL);
        gUnknown_203ACF0->field_60 = sub_81039F0();
        gUnknown_203ACF0->field_01 = 6;
        break;
    case 6:
        gUnknown_203ACF0->field_30 = ListMenu_ProcessInput(gUnknown_203ACF0->field_41);
        ListMenuGetScrollAndRow(gUnknown_203ACF0->field_17, &gUnknown_203ACF0->field_62, NULL);
        if (JOY_NEW(A_BUTTON))
        {
            if ((gUnknown_203ACF0->field_30 >> 16) & 1)
            {
                gUnknown_203ACF0->field_5A = gUnknown_203ACF0->field_30;
                RemoveScrollIndicatorArrowPair(gUnknown_203ACF0->field_60);
                BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
                gUnknown_203ACF0->field_01 = 7;
            }
        }
        else if (JOY_NEW(B_BUTTON))
        {
            RemoveScrollIndicatorArrowPair(gUnknown_203ACF0->field_60);
            BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
            gUnknown_203ACF0->field_01 = 1;
        }
        break;
    case 7:
        sub_8103988(gUnknown_203ACF0->field_42);
        FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 0, 32, 20);
        CopyBgTilemapBufferToVram(1);
        sub_81047B0(&gUnknown_203ACF0->field_40);
        gTasks[taskId].func = sub_81042EC;
        gUnknown_203ACF0->field_01 = 0;
        break;
    }
}

static void sub_810317C(void)
{
    struct ListMenuTemplate template;
    FillBgTilemapBufferRect(3, 0x00E, 0, 0, 30, 20, 0x00);
    FillBgTilemapBufferRect(1, 0x000, 0, 0, 32, 32, 0x11);
    gUnknown_203ACF0->field_40 = AddWindow(&sUnknown_845216C);
    template = sUnknown_8452174;
    template.items = gUnknown_203ACF0->field_44;
    template.windowId = gUnknown_203ACF0->field_40;
    template.totalItems = gUnknown_203ACF0->field_48;
    sub_8103924(&template, gUnknown_203ACF0->field_42);
    FillWindowPixelBuffer(0, PIXEL_FILL(15));
    sub_8106E78(gText_PokemonListNoColor, 1);
    FillWindowPixelBuffer(1, PIXEL_FILL(15));
    sub_8104C2C(gText_PickOKExit);
    CopyWindowToVram(0, COPYWIN_GFX);
    CopyWindowToVram(1, COPYWIN_GFX);
}

static void sub_8103238(u8 taskId)
{
    switch (gUnknown_203ACF0->field_01)
    {
    case 0:
        ListMenuLoadStdPalAt(0x10, 0);
        ListMenuLoadStdPalAt(0x20, 1);
        gUnknown_203ACF0->field_48 = sub_8103518(gUnknown_203ACF0->field_42);
        gUnknown_203ACF0->field_01 = 2;
        break;
    case 1:
        sub_8103988(gUnknown_203ACF0->field_42);
        HideBg(1);
        sub_81047B0(&gUnknown_203ACF0->field_40);
        gTasks[taskId].func = sub_810287C;
        gUnknown_203ACF0->field_01 = 0;
        break;
    case 2:
        sub_810345C();
        gUnknown_203ACF0->field_01 = 3;
        break;
    case 3:
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(1);
        gUnknown_203ACF0->field_01 = 4;
        break;
    case 4:
        ShowBg(1);
        BeginNormalPaletteFade(0xFFFF7FFF, 0, 16, 0, RGB_WHITEALPHA);
        gUnknown_203ACF0->field_01 = 5;
        break;
    case 5:
        ListMenuGetScrollAndRow(gUnknown_203ACF0->field_17, &gUnknown_203ACF0->field_62, NULL);
        gUnknown_203ACF0->field_60 = sub_81039F0();
        gUnknown_203ACF0->field_01 = 6;
        break;
    case 6:
        gUnknown_203ACF0->field_30 = ListMenu_ProcessInput(gUnknown_203ACF0->field_41);
        ListMenuGetScrollAndRow(gUnknown_203ACF0->field_17, &gUnknown_203ACF0->field_62, NULL);
        if (JOY_NEW(A_BUTTON))
        {
            if (((gUnknown_203ACF0->field_30 >> 16) & 1) && !sub_8106A20(gUnknown_203ACF0->field_30))
            {
                RemoveScrollIndicatorArrowPair(gUnknown_203ACF0->field_60);
                BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
                gUnknown_203ACF0->field_01 = 7;
            }
        }
        else if (JOY_NEW(B_BUTTON))
        {
            RemoveScrollIndicatorArrowPair(gUnknown_203ACF0->field_60);
            BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
            gUnknown_203ACF0->field_01 = 1;
        }
        break;
    case 7:
        sub_8103988(gUnknown_203ACF0->field_42);
        FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 0, 32, 20);
        CopyBgTilemapBufferToVram(1);
        sub_81047B0(&gUnknown_203ACF0->field_40);
        gUnknown_203ACF0->field_2F = 1;
        gTasks[taskId].func = sub_8103AC8;
        gUnknown_203ACF0->field_01 = 0;
        break;
    }
}

static void sub_810345C(void)
{
    struct ListMenuTemplate template;
    FillBgTilemapBufferRect(3, 0x00E, 0, 0, 30, 20, 0x00);
    FillBgTilemapBufferRect(1, 0x000, 0, 0, 32, 32, 0x11);
    gUnknown_203ACF0->field_40 = AddWindow(&sUnknown_845216C);
    template = sUnknown_8452174;
    template.items = gUnknown_203ACF0->field_44;
    template.windowId = gUnknown_203ACF0->field_40;
    template.totalItems = gUnknown_203ACF0->field_48;
    sub_8103924(&template, gUnknown_203ACF0->field_42);
    FillWindowPixelBuffer(0, PIXEL_FILL(15));
    sub_8106E78(gText_SearchNoColor, 1);
    FillWindowPixelBuffer(1, PIXEL_FILL(15));
    sub_8104C2C(gText_PickOKExit);
    CopyWindowToVram(0, COPYWIN_GFX);
    CopyWindowToVram(1, COPYWIN_GFX);
}

static u16 sub_8103518(u8 a0)
{
    s32 max_n = IsNationalPokedexEnabled() ? NATIONAL_DEX_COUNT : KANTO_DEX_COUNT;
    u16 ndex_num;
    u16 ret = NATIONAL_DEX_NONE;
    s32 i;
    bool8 caught;
    bool8 seen;

    switch (a0)
    {
    default:
    case 0:
        for (i = 0; i < KANTO_DEX_COUNT; i++)
        {
            ndex_num = i + 1;
            seen = sub_8104AB0(ndex_num, FLAG_GET_SEEN, 0);
            caught = sub_8104AB0(ndex_num, FLAG_GET_CAUGHT, 0);
            if (seen)
            {
                gUnknown_203ACF0->field_44[i].label = gSpeciesNames[NationalPokedexNumToSpecies(ndex_num)];
                ret = ndex_num;
            }
            else
            {
                gUnknown_203ACF0->field_44[i].label = gText_5Dashes;
            }
            gUnknown_203ACF0->field_44[i].index = (caught << 17) + (seen << 16) + NationalPokedexNumToSpecies(ndex_num);
        }
        break;
    case 1:
        for (i = 0; i < SPECIES_CHIMECHO; i++)
        {
            ndex_num = gPokedexOrder_Alphabetical[i];
            if (ndex_num <= max_n)
            {
                seen = sub_8104AB0(ndex_num, FLAG_GET_SEEN, 0);
                caught = sub_8104AB0(ndex_num, FLAG_GET_CAUGHT, 0);
                if (seen)
                {
                    gUnknown_203ACF0->field_44[ret].label = gSpeciesNames[NationalPokedexNumToSpecies(ndex_num)];
                    gUnknown_203ACF0->field_44[ret].index = (caught << 17) + (seen << 16) + NationalPokedexNumToSpecies(ndex_num);
                    ret++;
                }
            }
        }
        break;
    case 2:
        for (i = 0; i < NUM_SPECIES - 1; i++)
        {
            ndex_num = SpeciesToNationalPokedexNum(gPokedexOrder_Type[i]);
            if (ndex_num <= max_n)
            {
                seen = sub_8104AB0(ndex_num, FLAG_GET_SEEN, 0);
                caught = sub_8104AB0(ndex_num, FLAG_GET_CAUGHT, 0);
                if (caught)
                {
                    gUnknown_203ACF0->field_44[ret].label = gSpeciesNames[NationalPokedexNumToSpecies(ndex_num)];
                    gUnknown_203ACF0->field_44[ret].index = (caught << 17) + (seen << 16) + NationalPokedexNumToSpecies(ndex_num);
                    ret++;
                }
            }
        }
        break;
    case 3:
        for (i = 0; i < NATIONAL_DEX_COUNT; i++)
        {
            ndex_num = gPokedexOrder_Weight[i];
            if (ndex_num <= max_n)
            {
                seen = sub_8104AB0(ndex_num, FLAG_GET_SEEN, 0);
                caught = sub_8104AB0(ndex_num, FLAG_GET_CAUGHT, 0);
                if (caught)
                {
                    gUnknown_203ACF0->field_44[ret].label = gSpeciesNames[NationalPokedexNumToSpecies(ndex_num)];
                    gUnknown_203ACF0->field_44[ret].index = (caught << 17) + (seen << 16) + NationalPokedexNumToSpecies(ndex_num);
                    ret++;
                }
            }
        }
        break;
    case 4:
        for (i = 0; i < NATIONAL_DEX_COUNT; i++)
        {
            ndex_num = gPokedexOrder_Height[i];
            if (ndex_num <= max_n)
            {
                seen = sub_8104AB0(ndex_num, FLAG_GET_SEEN, 0);
                caught = sub_8104AB0(ndex_num, FLAG_GET_CAUGHT, 0);
                if (caught)
                {
                    gUnknown_203ACF0->field_44[ret].label = gSpeciesNames[NationalPokedexNumToSpecies(ndex_num)];
                    gUnknown_203ACF0->field_44[ret].index = (caught << 17) + (seen << 16) + NationalPokedexNumToSpecies(ndex_num);
                    ret++;
                }
            }
        }
        break;
    case 5:
        for (i = 0; i < NATIONAL_DEX_COUNT; i++)
        {
            ndex_num = i + 1;
            seen = sub_8104AB0(ndex_num, FLAG_GET_SEEN, 0);
            caught = sub_8104AB0(ndex_num, FLAG_GET_CAUGHT, 0);
            if (seen)
            {
                gUnknown_203ACF0->field_44[i].label = gSpeciesNames[NationalPokedexNumToSpecies(ndex_num)];
                ret = ndex_num;
            }
            else
            {
                gUnknown_203ACF0->field_44[i].label = gText_5Dashes;
            }
            gUnknown_203ACF0->field_44[i].index = (caught << 17) + (seen << 16) + NationalPokedexNumToSpecies(ndex_num);
        }
        break;
    }
    return ret;
}

static void sub_8103924(const struct ListMenuTemplate * template, u8 a1)
{
    switch (a1)
    {
    default:
    case 0:
        gUnknown_203ACF0->field_41 = ListMenuInitInRect(template, &sUnknown_845218C, gUnknown_203ACF0->field_36, gUnknown_203ACF0->field_34);
        break;
    case 1:
    case 2:
    case 3:
    case 4:
        gUnknown_203ACF0->field_41 = ListMenuInitInRect(template, &sUnknown_845218C, gUnknown_203ACF0->field_3A, gUnknown_203ACF0->field_38);
        break;
    case 5:
        gUnknown_203ACF0->field_41 = ListMenuInitInRect(template, &sUnknown_845218C, gUnknown_203ACF0->field_3E, gUnknown_203ACF0->field_3C);
        break;
    }
}

static void sub_8103988(u8 a0)
{
    switch (a0)
    {
    default:
    case 0:
        DestroyListMenuTask(gUnknown_203ACF0->field_41, &gUnknown_203ACF0->field_36, &gUnknown_203ACF0->field_34);
        break;
    case 1:
    case 2:
    case 3:
    case 4:
        DestroyListMenuTask(gUnknown_203ACF0->field_41, &gUnknown_203ACF0->field_3A, &gUnknown_203ACF0->field_38);
        break;
    case 5:
        DestroyListMenuTask(gUnknown_203ACF0->field_41, &gUnknown_203ACF0->field_3E, &gUnknown_203ACF0->field_3C);
        break;
    }
}

static u8 sub_81039F0(void)
{
    struct ScrollArrowsTemplate template = sUnknown_84521B4;
    if (gUnknown_203ACF0->field_48 > sUnknown_8452174.maxShowed)
        template.fullyDownThreshold = gUnknown_203ACF0->field_48 - sUnknown_8452174.maxShowed;
    else
        template.fullyDownThreshold = 0;
    return AddScrollIndicatorArrowPair(&template, &gUnknown_203ACF0->field_62);
}

struct PokedexListItem
{
    u16 species;
    bool8 seen:1;
    bool8 caught:1;
};

static void sub_8103A40(u8 windowId, s32 itemId, u8 y)
{
    u32 itemId_ = itemId;
    u16 species = itemId_;
    bool8 seen = (itemId_ >> 16) & 1;  // not used but required to match
    bool8 caught = (itemId_ >> 17) & 1;
    u8 type1;
    sub_8104A34(gUnknown_203ACF0->field_40, 0, species, 12, y);
    if (caught)
    {
        BlitMoveInfoIcon(gUnknown_203ACF0->field_40, 0, 0x28, y);
        type1 = gBaseStats[species].type1;
        BlitMoveInfoIcon(gUnknown_203ACF0->field_40, type1 + 1, 0x78, y);
        if (type1 != gBaseStats[species].type2)
            BlitMoveInfoIcon(gUnknown_203ACF0->field_40, gBaseStats[species].type2 + 1, 0x98, y);
    }
}

static void sub_8103AC8(u8 taskId)
{
    int r4;
    u8 *ptr;
    switch (gUnknown_203ACF0->field_01)
    {
    case 0:
        HideBg(3);
        HideBg(2);
        HideBg(1);
        sub_810699C(gUnknown_203ACF0->field_28);
        if (gUnknown_203ACF0->field_2B < gUnknown_203ACF0->field_29)
            gUnknown_203ACF0->field_2B = gUnknown_203ACF0->field_29;
        gUnknown_203ACF0->field_01 = 2;
        break;
    case 1:
        sub_8104E90();
        HideBg(2);
        HideBg(1);
        switch (gUnknown_203ACF0->field_2F)
        {
        case 0:
        default:
            gTasks[taskId].func = sub_810287C;
            break;
        case 1:
            gTasks[taskId].func = sub_8103238;
            break;
        }
        gUnknown_203ACF0->field_01 = 0;
        break;
    case 2:
        sub_8104F0C(0);
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        sub_8105058(0xFF);
        gUnknown_203ACF0->field_01 = 3;
        break;
    case 3:
        BeginNormalPaletteFade(0xFFFF7FFF, 0, 16, 0, RGB_WHITEALPHA);
        ShowBg(3);
        ShowBg(2);
        ShowBg(1);
        gUnknown_203ACF0->field_01 = 4;
        break;
    case 4:
        gUnknown_203ACF0->field_60 = sub_8104234();
        gUnknown_203ACF0->field_61 = ListMenuAddCursorObjectInternal(&gUnknown_84524C4, 0);
        gUnknown_203ACF0->field_01 = 5;
        break;
    case 5:
        sub_8105058(gUnknown_203ACF0->field_2D);
        sub_8105178(gUnknown_203ACF0->field_61, gUnknown_203ACF0->field_2D, gUnknown_203ACF0->field_2C);
        gUnknown_203ACF0->field_62 = gUnknown_203ACF0->field_2B;
        r4 = 0;
        if (JOY_NEW(A_BUTTON) && sub_8104AB0(gUnknown_203ACF0->field_18[gUnknown_203ACF0->field_2D], FLAG_GET_SEEN, 1))
        {
            RemoveScrollIndicatorArrowPair(gUnknown_203ACF0->field_60);
            ListMenuRemoveCursorObject(gUnknown_203ACF0->field_61, 0);
            gUnknown_203ACF0->field_01 = 12;
            break;
        }
        if (!JOY_HELD(R_BUTTON) && JOY_REPT(DPAD_LEFT))
        {
            if (gUnknown_203ACF0->field_2D != 0)
            {
                gUnknown_203ACF0->field_2D--;
                PlaySE(SE_SELECT);
                break;
            }
            else
                r4 = 1;
        }
        if (!JOY_HELD(R_BUTTON) && JOY_REPT(DPAD_RIGHT))
        {
            if (gUnknown_203ACF0->field_2D < gUnknown_203ACF0->field_2C - 1)
            {
                gUnknown_203ACF0->field_2D++;
                PlaySE(SE_SELECT);
                break;
            }
            else
                r4 = 2;
        }
        if (r4 == 0)
            r4 = sub_8104284();
        switch (r4)
        {
        case 0:
            break;
        case 1:
            while (gUnknown_203ACF0->field_2B > gUnknown_203ACF0->field_29)
            {
                gUnknown_203ACF0->field_2B--;
                if (sub_8106838(gUnknown_203ACF0->field_28, gUnknown_203ACF0->field_2B))
                {
                    gUnknown_203ACF0->field_01 = 8;
                    break;
                }
            }
            if (gUnknown_203ACF0->field_01 != 8)
                gUnknown_203ACF0->field_01 = 6;
            break;
        case 2:
            while (gUnknown_203ACF0->field_2B < gUnknown_203ACF0->field_2A - 1)
            {
                gUnknown_203ACF0->field_2B++;
                if (sub_8106838(gUnknown_203ACF0->field_28, gUnknown_203ACF0->field_2B))
                {
                    gUnknown_203ACF0->field_01 = 10;
                    break;
                }
            }
            if (gUnknown_203ACF0->field_01 != 10)
                gUnknown_203ACF0->field_01 = 6;
            break;
        }
        if (JOY_NEW(B_BUTTON))
        {
            gUnknown_203ACF0->field_01 = 6;
        }
        break;
    case 6:
    case 7:
        RemoveScrollIndicatorArrowPair(gUnknown_203ACF0->field_60);
        ListMenuRemoveCursorObject(gUnknown_203ACF0->field_61, 0);
        BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
        gUnknown_203ACF0->field_01 = 1;
        break;
    case 8:
    case 10:
        sub_8104E90();
        sub_8105058(0xFF);
        ListMenuUpdateCursorObject(gUnknown_203ACF0->field_61, 0, 0xA0, 0);
        gUnknown_203ACF0->field_2E = 0;
        gUnknown_203ACF0->field_02[0] = 0;
        gUnknown_203ACF0->field_01++;
        break;
    case 9:
        if (sub_81052D0(0))
        {
            gUnknown_203ACF0->field_2D = gUnknown_203ACF0->field_2C - 1;
            gUnknown_203ACF0->field_01 = 5;
        }
        break;
    case 11:
        if (sub_81052D0(1))
        {
            gUnknown_203ACF0->field_2D = 0;
            gUnknown_203ACF0->field_01 = 5;
        }
        break;
    case 12:
        gUnknown_203ACF0->field_5A = gUnknown_203ACF0->field_18[gUnknown_203ACF0->field_2D];
        PlaySE(SE_SELECT);
        gUnknown_203ACF0->field_01 = 14;
        break;
    case 13:
        sub_8106014();
        gUnknown_203ACF0->field_01 = 4;
        break;
    case 14:
        sub_8105E1C(0);
        gUnknown_203ACF0->field_01 = 15;
        break;
    case 15:
        gUnknown_203ACF0->field_02[0] = 0;
        gUnknown_203ACF0->field_02[1] = 0;
        gUnknown_203ACF0->field_01++;
        // fallthrough
    case 16:
        if (gUnknown_203ACF0->field_02[1] < 6)
        {
            if (gUnknown_203ACF0->field_02[0])
            {
                sub_8105594(0, gUnknown_203ACF0->field_02[1]);
                CopyBgTilemapBufferToVram(0);
                gUnknown_203ACF0->field_02[0] = 4;
                gUnknown_203ACF0->field_02[1]++;
            }
            else
            {
                gUnknown_203ACF0->field_02[0]--;
            }
        }
        else
        {
            FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 2, 30, 16);
            CopyBgTilemapBufferToVram(3);
            CopyBgTilemapBufferToVram(2);
            CopyBgTilemapBufferToVram(1);
            CopyBgTilemapBufferToVram(0);
            PlayCry2(gUnknown_203ACF0->field_5A, 0, 125, 10);
            gUnknown_203ACF0->field_02[0] = 0;
            gUnknown_203ACF0->field_01 = 17;
        }
        break;
    case 17:
        if (JOY_NEW(A_BUTTON))
        {
            sub_8106014();
            FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 2, 30, 16);
            CopyBgTilemapBufferToVram(1);
            gUnknown_203ACF0->field_01 = 21;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            gUnknown_203ACF0->field_01 = 18;
        }
        else
        {
            sub_8106B34();
        }
        break;
    case 18:
        sub_8104F0C(0);
        sub_8105594(0, 6);
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(0);
        gUnknown_203ACF0->field_01 = 19;
        break;
    case 19:
        gUnknown_203ACF0->field_02[0] = 0;
        gUnknown_203ACF0->field_02[1] = 6;
        gUnknown_203ACF0->field_01++;
        // fallthrough
    case 20:
        if (gUnknown_203ACF0->field_02[1])
        {
            if (gUnknown_203ACF0->field_02[0])
            {
                gUnknown_203ACF0->field_02[1]--;
                FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 2, 30, 16);
                sub_8105594(0, gUnknown_203ACF0->field_02[1]);
                CopyBgTilemapBufferToVram(0);
                gUnknown_203ACF0->field_02[0] = 1;
            }
            else
                gUnknown_203ACF0->field_02[0]--;
        }
        else
        {
            FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 2, 30, 16);
            CopyBgTilemapBufferToVram(0);
            gUnknown_203ACF0->field_01 = 13;
        }
        break;
    case 21:
        sub_810603C();
        gUnknown_203ACF0->field_01 = 22;
        break;
    case 22:
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(0);
        gUnknown_203ACF0->field_01 = 23;
        break;
    case 23:
        if (JOY_NEW(A_BUTTON))
        {
            FillBgTilemapBufferRect_Palette0(2, 0x000, 0, 2, 30, 16);
            FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 2, 30, 16);
            FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 2, 30, 16);
            CopyBgTilemapBufferToVram(2);
            CopyBgTilemapBufferToVram(1);
            CopyBgTilemapBufferToVram(0);
            gUnknown_203ACF0->field_01 = 26;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            FillBgTilemapBufferRect_Palette0(2, 0x000, 0, 2, 30, 16);
            FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 2, 30, 16);
            FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 2, 30, 16);
            CopyBgTilemapBufferToVram(2);
            CopyBgTilemapBufferToVram(1);
            CopyBgTilemapBufferToVram(0);
            gUnknown_203ACF0->field_01 = 24;
        }
        else
        {
            sub_8106B34();
        }
        break;
    case 24:
        sub_81067C0();
        gUnknown_203ACF0->field_01 = 25;
        break;
    case 25:
        sub_8105E1C(0);
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(0);
        gUnknown_203ACF0->field_01 = 17;
        break;
    case 26:
        sub_81067C0();
        gUnknown_203ACF0->field_01 = 18;
        break;
    }
}

static u8 sub_8104234(void)
{
    struct ScrollArrowsTemplate template = sUnknown_84524B4;
    template.fullyUpThreshold = gUnknown_203ACF0->field_29;
    template.fullyDownThreshold = gUnknown_203ACF0->field_2A - 1;
    gUnknown_203ACF0->field_62 = gUnknown_203ACF0->field_2B;
    return AddScrollIndicatorArrowPair(&template, &gUnknown_203ACF0->field_62);
}

static int sub_8104284(void)
{
    switch (gSaveBlock2Ptr->optionsButtonMode)
    {
    case OPTIONS_BUTTON_MODE_L_EQUALS_A:
        // Using the JOY_HELD and JOY_NEW macros here does not match!
        if ((gMain.heldKeys & R_BUTTON) && (gMain.newKeys & DPAD_LEFT))
            return 1;
        else if ((gMain.heldKeys & R_BUTTON) && (gMain.newKeys & DPAD_RIGHT))
            return 2;
        else
            return 0;
    case OPTIONS_BUTTON_MODE_LR:
        if (gMain.newKeys & L_BUTTON)
            return 1;
        else if (gMain.newKeys & R_BUTTON)
            return 2;
        else
            return 0;
    case OPTIONS_BUTTON_MODE_HELP:
    default:
        return 0;
    }
}

static void sub_81042EC(u8 taskId)
{
    switch (gUnknown_203ACF0->field_01)
    {
    case 0:
        HideBg(3);
        HideBg(2);
        HideBg(1);
        gUnknown_203ACF0->field_01 = 2;
        break;
    case 1:
        HideBg(2);
        HideBg(1);
        gTasks[taskId].func = sub_8102F80;
        gUnknown_203ACF0->field_01 = 0;
        break;
    case 2:
        gUnknown_203ACF0->field_2C = 1;
        sub_8105E1C(0);
        gUnknown_203ACF0->field_01 = 3;
        break;
    case 3:
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(0);
        PlayCry2(gUnknown_203ACF0->field_5A, 0, 125, 10);
        gUnknown_203ACF0->field_01 = 4;
        break;
    case 4:
        BeginNormalPaletteFade(0xFFFF7FFF, 0, 16, 0, RGB_WHITEALPHA);
        ShowBg(3);
        ShowBg(2);
        ShowBg(1);
        gUnknown_203ACF0->field_01 = 5;
        break;
    case 5:
        if (JOY_NEW(A_BUTTON))
        {
            sub_8106014();
            FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 2, 30, 16);
            CopyBgTilemapBufferToVram(1);
            gUnknown_203ACF0->field_01 = 7;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            sub_8106014();
            BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
            gUnknown_203ACF0->field_01 = 1;
        }
        else if (JOY_NEW(DPAD_UP) && sub_8104664(1))
        {
            sub_8106014();
            BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
            gUnknown_203ACF0->field_01 = 6;
        }
        else if (JOY_NEW(DPAD_DOWN) && sub_8104664(0))
        {
            sub_8106014();
            BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
            gUnknown_203ACF0->field_01 = 6;
        }
        else
        {
            sub_8106B34();
        }
        break;
    case 6:
        HideBg(2);
        HideBg(1);
        gUnknown_203ACF0->field_5A = gUnknown_203ACF0->field_30;
        gUnknown_203ACF0->field_01 = 2;
        break;
    case 7:
        sub_810603C();
        gUnknown_203ACF0->field_01 = 8;
        break;
    case 8:
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(0);
        gUnknown_203ACF0->field_01 = 9;
        break;
    case 9:
        if (JOY_NEW(A_BUTTON))
        {
            BeginNormalPaletteFade(0xFFFF7FFF, 0, 0, 16, RGB_WHITEALPHA);
            gUnknown_203ACF0->field_01 = 12;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            FillBgTilemapBufferRect_Palette0(2, 0x000, 0, 2, 30, 16);
            FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 2, 30, 16);
            FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 2, 30, 16);
            CopyBgTilemapBufferToVram(2);
            CopyBgTilemapBufferToVram(1);
            CopyBgTilemapBufferToVram(0);
            gUnknown_203ACF0->field_01 = 10;
        }
        else
        {
            sub_8106B34();
        }
        break;
    case 10:
        sub_81067C0();
        gUnknown_203ACF0->field_01 = 11;
        break;
    case 11:
        sub_8105E1C(0);
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(0);
        gUnknown_203ACF0->field_01 = 5;
        break;
    case 12:
        sub_81067C0();
        FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 2, 30, 16);
        CopyBgTilemapBufferToVram(0);
        gUnknown_203ACF0->field_01 = 1;
        break;
    }
}

static bool32 sub_8104664(u8 a0)
{
    int r3;
    u16 *r6, *r12;

    switch (gUnknown_203ACF0->field_42)
    {
    default:
    case 0:
        r12 = &gUnknown_203ACF0->field_36;
        r6 = &gUnknown_203ACF0->field_34;
        break;
    case 1:
    case 2:
    case 3:
    case 4:
        r12 = &gUnknown_203ACF0->field_3A;
        r6 = &gUnknown_203ACF0->field_38;
        break;
    case 5:
        r12 = &gUnknown_203ACF0->field_3E;
        r6 = &gUnknown_203ACF0->field_3C;
        break;
    }

    r3 = *r12 + *r6;
    if (a0)
    {
        if (r3 == 0)
            return FALSE;

        r3--;
        while (r3 >= 0) //Should be while (--r3 >= 0) without the r3-- in the body or before the while at all, but this is needed to match.
        {
            if ((gUnknown_203ACF0->field_44[r3].index >> 16) & 1)
            {
                break;
            }
            r3--;
        }

        if (r3 < 0)
        {
            return FALSE;
        }
    }
    else
    {
        if (r3 == gUnknown_203ACF0->field_48 - 1)
        {
            return FALSE;
        }

        r3++;
        while (r3 < gUnknown_203ACF0->field_48) //Should be while (++r3 < gUnknown_203ACF0->field_48) without the r3++ in the body or before the while at all, but this is needed to match.
        {
            if ((gUnknown_203ACF0->field_44[r3].index >> 16) & 1)
                break;
            r3++;
        }
        if (r3 >= gUnknown_203ACF0->field_48)
        {
            return FALSE;
        }
    }
    gUnknown_203ACF0->field_30 = gUnknown_203ACF0->field_44[r3].index;

    if (gUnknown_203ACF0->field_48 > 9)
    {
        if (r3 < 4)
        {
            *r12 = 0;
            *r6 = r3;
        }
        else if (r3 >= (gUnknown_203ACF0->field_48 - 4))
        {
            *r12 = (gUnknown_203ACF0->field_48 - 9);
            *r6 = r3 + 9 - (gUnknown_203ACF0->field_48);
        }
        else
        {
            *r12 = r3 - 4;
            *r6 = 4;
        }
    }
    else
    {
		*r12 = 0;
		*r6 = r3;
	}
	return TRUE;
}

void sub_81047B0(u8 *windowId_p)
{
    if (*windowId_p != 0xFF)
    {
        RemoveWindow(*windowId_p);
        *windowId_p = 0xFF;
    }
}

void sub_81047C8(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 colorIdx)
{
    u8 textColor[3];
    switch (colorIdx)
    {
    case 0:
        textColor[0] = 0;
        textColor[1] = 1;
        textColor[2] = 3;
        break;
    case 1:
        textColor[0] = 0;
        textColor[1] = 5;
        textColor[2] = 1;
        break;
    case 2:
        textColor[0] = 0;
        textColor[1] = 15;
        textColor[2] = 14;
        break;
    case 3:
        textColor[0] = 0;
        textColor[1] = 11;
        textColor[2] = 1;
        break;
    case 4:
        textColor[0] = 0;
        textColor[1] = 1;
        textColor[2] = 2;
        break;
    }
    AddTextPrinterParameterized4(windowId, fontId, x, y, fontId == 0 ? 0 : 1, 0, textColor, -1, str);
}

void sub_8104880(u8 windowId, u8 fontId, u16 num, u8 x, u8 y, u8 colorIdx)
{
    u8 buff[4];
    buff[0] = (num / 100) + CHAR_0;
    buff[1] = ((num %= 100) / 10) + CHAR_0;
    buff[2] = (num % 10) + CHAR_0;
    buff[3] = EOS;
    sub_81047C8(windowId, fontId, buff, x, y, colorIdx);
}

static void sub_810491C(u8 windowId, u8 fontId, u16 num, u8 x, u8 y, u8 colorIdx)
{
    u8 buff[4];
    int i;
    buff[0] = (num / 100) + CHAR_0;
    buff[1] = ((num %= 100) / 10) + CHAR_0;
    buff[2] = (num % 10) + CHAR_0;
    buff[3] = EOS;
    for (i = 0; i < 3; i++)
    {
        if (buff[i] != CHAR_0)
            break;
        buff[i] = CHAR_SPACE;
    }
    sub_81047C8(windowId, fontId, buff, x, y, colorIdx);
}

u32 sub_81049CC(int species)
{
    switch (species)
    {
    case SPECIES_SPINDA:
        return gSaveBlock2Ptr->pokedex.spindaPersonality;
    case SPECIES_UNOWN:
        return gSaveBlock2Ptr->pokedex.unownPersonality;
    default:
        return 0;
    }
}

void sub_81049FC(u8 windowId, u16 species, u16 paletteOffset)
{
    LoadMonPicInWindow(species, 8, sub_81049CC(species), TRUE, paletteOffset >> 4, windowId);
}

void sub_8104A34(u8 windowId, u8 fontId, u16 species, u8 x, u8 y)
{
    u16 dexNum = SpeciesToNationalPokedexNum(species);
    sub_81047C8(windowId, fontId, gText_PokedexNo, x, y, 0);
    sub_8104880(windowId, fontId, dexNum, x + 9, y, 0);
}

s8 sub_8104AB0(u16 nationalDexNo, u8 caseId, bool8 indexIsSpecies)
{
    u8 index;
    u8 bit;
    u8 mask;
    s8 retVal;

    if (indexIsSpecies)
        nationalDexNo = SpeciesToNationalPokedexNum(nationalDexNo);

    nationalDexNo--;
    index = nationalDexNo / 8;
    bit = nationalDexNo % 8;
    mask = 1 << bit;
    retVal = 0;
    switch (caseId)
    {
    case FLAG_GET_SEEN:
        if (gSaveBlock2Ptr->pokedex.seen[index] & mask)
        {
            if ((gSaveBlock2Ptr->pokedex.seen[index] & mask) == (gSaveBlock1Ptr->seen1[index] & mask)
                && (gSaveBlock2Ptr->pokedex.seen[index] & mask) == (gSaveBlock1Ptr->seen2[index] & mask))
                retVal = 1;
        }
        break;
    case FLAG_GET_CAUGHT:
        if (gSaveBlock2Ptr->pokedex.owned[index] & mask)
        {
            if ((gSaveBlock2Ptr->pokedex.owned[index] & mask) == (gSaveBlock2Ptr->pokedex.seen[index] & mask)
                && (gSaveBlock2Ptr->pokedex.owned[index] & mask) == (gSaveBlock1Ptr->seen1[index] & mask)
                && (gSaveBlock2Ptr->pokedex.owned[index] & mask) == (gSaveBlock1Ptr->seen2[index] & mask))
                retVal = 1;
        }
        break;
    case FLAG_SET_SEEN:
        gSaveBlock2Ptr->pokedex.seen[index] |= mask;
        gSaveBlock1Ptr->seen1[index] |= mask;
        gSaveBlock1Ptr->seen2[index] |= mask;
        break;
    case FLAG_SET_CAUGHT:
        gSaveBlock2Ptr->pokedex.owned[index] |= mask;
        break;
    }
    return retVal;
}

static u16 sub_8104BBC(u8 caseId, bool8 whichDex)
{
    u16 count = 0;
    u16 i;

    switch (whichDex)
    {
    case 0: // Kanto
        for (i = 0; i < KANTO_DEX_COUNT; i++)
        {
            if (sub_8104AB0(i + 1, caseId, FALSE))
                count++;
        }
        break;
    case 1: // National
        for (i = 0; i < NATIONAL_DEX_COUNT; i++)
        {
            if (sub_8104AB0(i + 1, caseId, FALSE))
                count++;

        }
        break;
    }
    return count;
}

void sub_8104C2C(const u8 *src)
{
    sub_81047C8(1, 0, src, 236 - GetStringWidth(0, src, 0), 2, 4);
}

bool8 sub_8104C64(u16 a0, u8 a1, u8 a2)
{
    struct WindowTemplate template;
    a2--;
    CopyToBgTilemapBufferRect_ChangePalette(3, sUnknown_845228C, gUnknown_8452334[a2][a1][0], gUnknown_8452334[a2][a1][1], 8, 8, a1 + 5);
    if (gUnknown_203ACF0->field_20[a1] == 0xFF)
    {
        template = sUnknown_84521C4;
        template.tilemapLeft = gUnknown_8452334[a2][a1][0];
        template.tilemapTop = gUnknown_8452334[a2][a1][1];
        template.paletteNum = a1 + 1;
        template.baseBlock = a1 * 64 + 8;
        gUnknown_203ACF0->field_20[a1] = AddWindow(&template);
        FillWindowPixelBuffer(gUnknown_203ACF0->field_20[a1], PIXEL_FILL(0));
        sub_81049FC(gUnknown_203ACF0->field_20[a1], a0, a1 * 16 + 16);
        PutWindowTilemap(gUnknown_203ACF0->field_20[a1]);
        CopyWindowToVram(gUnknown_203ACF0->field_20[a1], COPYWIN_GFX);
    }
    else
        PutWindowTilemap(gUnknown_203ACF0->field_20[a1]);

    if (gUnknown_203ACF0->field_24[a1] == 0xFF)
    {
        if (a0 != SPECIES_NONE)
        {
            template = sUnknown_84521CC;
            template.tilemapLeft = gUnknown_8452334[a2][a1][2];
            template.tilemapTop = gUnknown_8452334[a2][a1][3];
            template.baseBlock = a1 * 40 + 0x108;
            gUnknown_203ACF0->field_24[a1] = AddWindow(&template);
            CopyToWindowPixelBuffer(gUnknown_203ACF0->field_24[a1], gUnknown_8440124, 0, 0);
            sub_8104A34(gUnknown_203ACF0->field_24[a1], 0, a0, 12, 0);
            sub_81047C8(gUnknown_203ACF0->field_24[a1], 2, gSpeciesNames[a0], 2, 13, 0);
            if (sub_8104AB0(a0, FLAG_GET_CAUGHT, TRUE))
                BlitBitmapRectToWindow(gUnknown_203ACF0->field_24[a1], gUnknown_8443600, 0, 0, 8, 8, 2, 3, 8, 8);
            PutWindowTilemap(gUnknown_203ACF0->field_24[a1]);
            CopyWindowToVram(gUnknown_203ACF0->field_24[a1], COPYWIN_GFX);
        }
    }
    else
        PutWindowTilemap(gUnknown_203ACF0->field_24[a1]);

    return TRUE;
}

void sub_8104E90(void)
{
    int i;
    for (i = 0; i < 4; i++)
    {
        sub_81047B0(&gUnknown_203ACF0->field_20[i]);
        sub_81047B0(&gUnknown_203ACF0->field_24[i]);
    }
}

void sub_8104EC0(u8 unused, u16 a1, u16 a2, u8 unused2, u8 unused3)
{
    u8 buffer[30];
    u8 *ptr = StringCopy(buffer, gText_Page);
    ptr = ConvertIntToDecimalStringN(ptr, a1, STR_CONV_MODE_RIGHT_ALIGN, 2);
    *ptr++ = CHAR_SLASH;
    ptr = ConvertIntToDecimalStringN(ptr, a2, STR_CONV_MODE_RIGHT_ALIGN, 2);
    sub_8106E78(buffer, 2);
}

bool8 sub_8104F0C(bool8 a0)
{
    FillBgTilemapBufferRect_Palette0(3, 2, 0, 0, 30, 20);
    FillBgTilemapBufferRect_Palette0(2, 0, 0, 0, 32, 20);
    FillBgTilemapBufferRect_Palette0(1, 0, 0, 0, 32, 20);
    sub_81068DC(gUnknown_203ACF0->field_28, gUnknown_203ACF0->field_2B);
    FillWindowPixelBuffer(0, PIXEL_FILL(15));
    if (a0)
    {
        sub_8106E78(sDexCategoryNamePtrs[gUnknown_203ACF0->field_28], 1);
    }
    else
    {
        sub_8106E78(sDexCategoryNamePtrs[gUnknown_203ACF0->field_28], 0);
        sub_8104EC0(0, sub_8106AF8(gUnknown_203ACF0->field_2B), sub_8106AF8(gUnknown_203ACF0->field_2A - 1), 160, 2);
    }
    CopyWindowToVram(0, COPYWIN_GFX);
    FillWindowPixelBuffer(1, PIXEL_FILL(15));
    if (!a0)
        sub_8104C2C(gText_PickFlipPageCheckCancel);
    CopyWindowToVram(1, COPYWIN_GFX);
    if (gUnknown_203ACF0->field_18[0] != 0xFFFF)
        sub_8104C64(gUnknown_203ACF0->field_18[0], 0, gUnknown_203ACF0->field_2C);
    if (gUnknown_203ACF0->field_18[1] != 0xFFFF)
        sub_8104C64(gUnknown_203ACF0->field_18[1], 1, gUnknown_203ACF0->field_2C);
    if (gUnknown_203ACF0->field_18[2] != 0xFFFF)
        sub_8104C64(gUnknown_203ACF0->field_18[2], 2, gUnknown_203ACF0->field_2C);
    if (gUnknown_203ACF0->field_18[3] != 0xFFFF)
        sub_8104C64(gUnknown_203ACF0->field_18[3], 3, gUnknown_203ACF0->field_2C);
    return FALSE;
}

void sub_8105058(u8 a0)
{
    int i;
    u32 r7;

    if (a0 == 0xFF)
    {
        for (i = 0; i < 4; i++)
        {
            LoadPalette(&gUnknown_84406C8[0], 0x52 + 0x10 * i, 2);
            LoadPalette(&gUnknown_84406C8[1], 0x58 + 0x10 * i, 2);
        }
        LoadPalette(&gUnknown_84406C8[0], 0x141, 2);
        gUnknown_203ACF0->field_2E = 0;
    }
    else
    {
        gUnknown_203ACF0->field_2E++;
        if (gUnknown_203ACF0->field_2E == 16)
            gUnknown_203ACF0->field_2E = 0;
        r7 = gUnknown_203ACF0->field_2E >> 2;
        for (i = 0; i < 4; i++)
        {
            if (i == a0)
            {
                LoadPalette(&gUnknown_84406C8[2 * r7 + 2], 0x52 + 0x10 * i, 2);
                LoadPalette(&gUnknown_84406C8[2 * r7 + 3], 0x58 + 0x10 * i, 2);
            }
            else
            {
                LoadPalette(&gUnknown_84406C8[0], 0x52 + 0x10 * i, 2);
                LoadPalette(&gUnknown_84406C8[1], 0x58 + 0x10 * i, 2);
            }
        }
        LoadPalette(&gUnknown_84406C8[2 * r7 + 2], 0x141, 2);
    }
}

void sub_8105178(u8 a0, u8 a1, u8 a2)
{
    a2--;
    ListMenuUpdateCursorObject(a0, gUnknown_8452334[a2][a1][2] * 8, gUnknown_8452334[a2][a1][3] * 8, 0);
}

bool8 sub_81051AC(const u16 *a0, u8 a1, u16 *a2, u8 a3)
{
    int i;
    const u16 *src = &a0[a1];
    u16 *dst = &a2[a3];
    for (i = 0; i < 20; i++)
    {
        *dst = *src;
        dst += 32;
        src += 32;
    }
    return FALSE;
}

bool8 sub_81051D0(u16 a0, u16 *a1, u8 a2)
{
    int i;
    u16 *dst = &a1[a2];
    for (i = 0; i < 20; i++)
    {
        *dst = a0;
        dst += 32;
    }
    return FALSE;
}

bool8 sub_81051F0(u8 a0)
{
    int i;
    int r4;
    u16 *bg1buff = GetBgTilemapBuffer(1);
    u16 *bg2buff = GetBgTilemapBuffer(2);
    u16 *bg3buff = GetBgTilemapBuffer(3);
    u16 *sp04 = gUnknown_203ACF0->field_5C + 0x800;
    u16 *sp08 = gUnknown_203ACF0->field_5C + 0x400;
    u16 *sp0C = gUnknown_203ACF0->field_5C + 0x000;
    for (i = 0; i < 30; i++)
    {
        r4 = sUnknown_8452388[a0][i];
        if (r4 == 30)
        {
            sub_81051D0(0x000, bg1buff, i);
            sub_81051D0(0x000, bg2buff, i);
            sub_81051D0(0x00C, bg3buff, i);
        }
        else
        {
            sub_81051AC(sp04, r4, bg1buff, i);
            sub_81051AC(sp08, r4, bg2buff, i);
            sub_81051AC(sp0C, r4, bg3buff, i);
        }
    }
    CopyBgTilemapBufferToVram(1);
    CopyBgTilemapBufferToVram(2);
    CopyBgTilemapBufferToVram(3);
    return FALSE;
}

static bool8 sub_81052D0(u8 a0)
{
    u16 r4;
    if (IsNationalPokedexEnabled())
        r4 = gUnknown_84406E0[7];
    else
        r4 = gUnknown_84404C8[7];
    switch (gUnknown_203ACF0->field_02[0])
    {
    case 0:
        gUnknown_203ACF0->field_5C = Alloc(3 * BG_SCREEN_SIZE);
        if (a0)
            gUnknown_203ACF0->field_02[0] = 6;
        else
            gUnknown_203ACF0->field_02[0] = 2;
        break;
    case 1:
        Free(gUnknown_203ACF0->field_5C);
        return TRUE;
    case 2:
        BeginNormalPaletteFade(0x00007FFF, 0, 0, 16, r4);
        gUnknown_203ACF0->field_02[0]++;
        break;
    case 3:
        FillBgTilemapBufferRect_Palette0(3, 0x00C, 0, 0, 30, 20);
        FillBgTilemapBufferRect_Palette0(2, 0x000, 0, 0, 32, 20);
        FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 0, 32, 20);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(3);
        gUnknown_203ACF0->field_02[0]++;
        break;
    case 4:
        BeginNormalPaletteFade(0x00007FFF, 0, 0, 0, r4);
        sub_8104F0C(FALSE);
        CpuFastCopy(GetBgTilemapBuffer(3), &gUnknown_203ACF0->field_5C[0 * BG_SCREEN_SIZE / 2], BG_SCREEN_SIZE);
        CpuFastCopy(GetBgTilemapBuffer(2), &gUnknown_203ACF0->field_5C[1 * BG_SCREEN_SIZE / 2], BG_SCREEN_SIZE);
        CpuFastCopy(GetBgTilemapBuffer(1), &gUnknown_203ACF0->field_5C[2 * BG_SCREEN_SIZE / 2], BG_SCREEN_SIZE);
        FillBgTilemapBufferRect_Palette0(3, 0x00C, 0, 0, 30, 20);
        FillBgTilemapBufferRect_Palette0(2, 0x000, 0, 0, 32, 20);
        FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 0, 32, 20);
        
        gUnknown_203ACF0->field_02[1] = 0;
        gUnknown_203ACF0->field_02[0]++;
        PlaySE(SE_BALL_TRAY_ENTER);
        break;
    case 5:
        if (gUnknown_203ACF0->field_02[1] < 10)
        {
            sub_81051F0(gUnknown_203ACF0->field_02[1]);
            gUnknown_203ACF0->field_02[1]++;
        }
        else
        {
            gUnknown_203ACF0->field_02[0] = 1;
        }
        break;
    case 6:
        CpuFastCopy(GetBgTilemapBuffer(3), &gUnknown_203ACF0->field_5C[0 * BG_SCREEN_SIZE / 2], BG_SCREEN_SIZE);
        CpuFastCopy(GetBgTilemapBuffer(2), &gUnknown_203ACF0->field_5C[1 * BG_SCREEN_SIZE / 2], BG_SCREEN_SIZE);
        CpuFastCopy(GetBgTilemapBuffer(1), &gUnknown_203ACF0->field_5C[2 * BG_SCREEN_SIZE / 2], BG_SCREEN_SIZE);

        gUnknown_203ACF0->field_02[1] = 9;
        gUnknown_203ACF0->field_02[0]++;
        PlaySE(SE_BALL_TRAY_ENTER);
        break;
    case 7:
        if (gUnknown_203ACF0->field_02[1] != 0)
        {
            sub_81051F0(gUnknown_203ACF0->field_02[1]);
            gUnknown_203ACF0->field_02[1]--;
        }
        else
        {
            sub_81051F0(gUnknown_203ACF0->field_02[0]);
            BeginNormalPaletteFade(0x00007FFF, 0, 16, 16, r4);
            gUnknown_203ACF0->field_02[0]++;
        }
        break;
    case 8:
        gPaletteFade.bufferTransferDisabled = TRUE;
        sub_8104F0C(FALSE);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(3);
        gUnknown_203ACF0->field_02[0]++;
        break;
    case 9:
        gPaletteFade.bufferTransferDisabled = FALSE;
        BeginNormalPaletteFade(0x00007FFF, 0, 16, 0, r4);
        gUnknown_203ACF0->field_02[0] = 1;
        break;
    }
    return FALSE;
}
