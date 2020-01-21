extern const u8 gUnknown_84571AC[];
extern const u8 gUnknown_8459344[];
extern const u8 gUnknown_845934C[];
extern const u8 gUnknown_8459354[];
extern const u8 gUnknown_8459360[];
extern const u8 gUnknown_8459368[];
extern const u8 gUnknown_8459370[];
extern const u8 gUnknown_8459394[];
extern const u8 gUnknown_84593A4[];
extern const u8 gUnknown_84593B4[];
extern const u8 gUnknown_84593C4[];
extern const u8 gUnknown_84593D4[];
extern const u8 gUnknown_84593E4[];
extern const u8 gUnknown_84593F4[];
extern const u8 gUnknown_84593DC[];
extern const u8 gUnknown_8459400[];
extern const u8 gUnknown_8459410[];
extern const u8 gUnknown_845941C[];
extern const u8 gUnknown_845942C[];
extern const u8 gUnknown_8459434[];
extern const u8 gUnknown_8459440[];

#define _8456CD8(a, b) ((a) | ((b) << 8))

static const u8 *const gUnknown_8456C74[] = {
    gUnknown_84571AC,
    gUnknown_8459394,
    gUnknown_84593A4,
    gUnknown_84593B4,
    gUnknown_84593C4,
    gUnknown_84593D4,
    gUnknown_84593E4,
    gUnknown_84593F4,
    gUnknown_84593DC,
    gUnknown_8459400,
    gUnknown_8459410,
    gUnknown_845941C,
    gUnknown_845942C,
    gUnknown_8459434,
    gUnknown_8459440,
    gUnknown_84571AC,
    gUnknown_84571AC,
    gUnknown_84571AC,
    gUnknown_84571AC,
    gUnknown_84571AC,
    gUnknown_84571AC,
    gUnknown_84593E4,
    gUnknown_84593F4
};

static const struct WindowTemplate gUnknown_8456CD0 = {
    .bg = 0,
    .tilemapLeft = 0,
    .tilemapTop = 0,
    .width = 30,
    .height = 2,
    .paletteNum = 0xF,
    .baseBlock = 0x008
};

static const u32 gUnknown_8456CD8[] = {
    _8456CD8( 1,  2),
    _8456CD8( 2,  2),
    _8456CD8( 3,  4),
    _8456CD8( 4,  2),
    _8456CD8( 9, 37),
    _8456CD8(10, 37),
    _8456CD8(11, 53),
    _8456CD8(13, 53),
    _8456CD8(14, 53)
};

static const struct WindowTemplate gUnknown_8456CFC = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 3,
    .width = 13,
    .height = 10,
    .paletteNum = 15,
    .baseBlock = 0x044
};

static const struct WindowTemplate gUnknown_8456D04 = {
    .bg = 0,
    .tilemapLeft = 16,
    .tilemapTop = 3,
    .width = 7,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x0C6
};

const struct ListMenuItem gUnknown_8456D0C[] = {
    {gUnknown_84571AC, 0},
    {gUnknown_84571AC, 1},
    {gUnknown_84571AC, 2},
    {gUnknown_84571AC, 3},
    {gUnknown_84571AC, 4}
};

static const struct ListMenuTemplate gUnknown_8456D34 = {
    .items = gUnknown_8456D0C,
    .moveCursorFunc = NULL,
    .itemPrintFunc = sub_81164C8,
    .totalItems = 5,
    .maxShowed = 5,
    .windowId = 0,
    .header_X = 0,
    .item_X = 1,
    .cursor_X = 0,
    .upText_Y = 0,
    .cursorPal = 2,
    .fillValue = 1,
    .cursorShadowPal = 3,
    .lettersSpacing = 0,
    .itemVerticalPadding = 2,
    .scrollMultiple = LIST_NO_MULTIPLE_SCROLL,
    .fontId = 2,
    .cursorKind = 1
};

static const struct WindowTemplate gUnknown_8456D4C = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 3,
    .width = 17,
    .height = 10,
    .paletteNum = 15,
    .baseBlock = 0x044
};

static const struct WindowTemplate gUnknown_8456D54 = {
    .bg = 0,
    .tilemapLeft = 20,
    .tilemapTop = 3,
    .width = 7,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x0EE
};

static const struct ListMenuItem gUnknown_8456D5C[] = {
    {gUnknown_84571AC,  0},
    {gUnknown_84571AC,  1},
    {gUnknown_84571AC,  2},
    {gUnknown_84571AC,  3},
    {gUnknown_84571AC,  4},
    {gUnknown_84571AC,  5},
    {gUnknown_84571AC,  6},
    {gUnknown_84571AC,  7},
    {gUnknown_84571AC,  8},
    {gUnknown_84571AC,  9},
    {gUnknown_84571AC, 10},
    {gUnknown_84571AC, 11},
    {gUnknown_84571AC, 12},
    {gUnknown_84571AC, 13},
    {gUnknown_84571AC, 14},
    {gUnknown_84571AC, 15}
};

static const struct ListMenuTemplate gUnknown_8456DDC = {
    .items = gUnknown_8456D5C,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .itemPrintFunc = sub_8116F94,
    .totalItems = 16,
    .maxShowed = 5,
    .windowId = 0,
    .header_X = 0,
    .item_X = 8,
    .cursor_X = 0,
    .upText_Y = 0,
    .cursorPal = 2,
    .fillValue = 1,
    .cursorShadowPal = 3,
    .lettersSpacing = 0,
    .itemVerticalPadding = 2,
    .scrollMultiple = LIST_MULTIPLE_SCROLL_DPAD,
    .fontId = 2,
    .cursorKind = 0
};

static const struct WindowTemplate gUnknown_8456DF4 = {
    .bg = 0,
    .tilemapLeft = 20,
    .tilemapTop = 6,
    .width = 8,
    .height = 7,
    .paletteNum = 15,
    .baseBlock = 0x001
};

static const struct ListMenuItem gUnknown_8456DFC[] = {
    {gUnknown_8459354,  _8456CD8( 8, 2)},
    {gUnknown_8459344,  _8456CD8(65, 2)},
    {gUnknown_845934C,  _8456CD8(69, 2)},
    {gUnknown_8459360,  _8456CD8(64, 0)}
};

static const struct ListMenuTemplate gUnknown_8456E1C = {
    .items = gUnknown_8456DFC,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .itemPrintFunc = NULL,
    .totalItems = 4,
    .maxShowed = 4,
    .windowId = 0,
    .header_X = 0,
    .item_X = 8,
    .cursor_X = 0,
    .upText_Y = 0,
    .cursorPal = 2,
    .fillValue = 1,
    .cursorShadowPal = 3,
    .lettersSpacing = 1,
    .itemVerticalPadding = 0,
    .scrollMultiple = LIST_NO_MULTIPLE_SCROLL,
    .fontId = 2,
    .cursorKind = 0
};

static const struct WindowTemplate gUnknown_8456E34 = {
    .bg = 0,
    .tilemapLeft = 18,
    .tilemapTop = 8,
    .width = 11,
    .height = 5,
    .paletteNum = 15,
    .baseBlock = 0x001
};

static const struct ListMenuItem gUnknown_8456E3C[] = {
    {gText_Register,   1},
    {gUnknown_8459370, 2},
    {gUnknown_8459360, 3}
};

static const struct ListMenuTemplate gUnknown_8456E54 = {
    .items = gUnknown_8456E3C,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .itemPrintFunc = NULL,
    .totalItems = 3,
    .maxShowed = 3,
    .windowId = 0,
    .header_X = 0,
    .item_X = 8,
    .cursor_X = 0,
    .upText_Y = 0,
    .cursorPal = 2,
    .fillValue = 1,
    .cursorShadowPal = 3,
    .lettersSpacing = 1,
    .itemVerticalPadding = 0,
    .scrollMultiple = LIST_NO_MULTIPLE_SCROLL,
    .fontId = 2,
    .cursorKind = 0
};

static const struct WindowTemplate gUnknown_8456E6C = {
    .bg = 0,
    .tilemapLeft = 20,
    .tilemapTop = 2,
    .width = 9,
    .height = 11,
    .paletteNum = 15,
    .baseBlock = 0x001
};

static const struct ListMenuItem gUnknown_8456E74[] = {
    {gTypeNames[TYPE_NORMAL],     TYPE_NORMAL},
    {gTypeNames[TYPE_FIRE],         TYPE_FIRE},
    {gTypeNames[TYPE_WATER],       TYPE_WATER},
    {gTypeNames[TYPE_ELECTRIC], TYPE_ELECTRIC},
    {gTypeNames[TYPE_GRASS],       TYPE_GRASS},
    {gTypeNames[TYPE_ICE],           TYPE_ICE},
    {gTypeNames[TYPE_GROUND],     TYPE_GROUND},
    {gTypeNames[TYPE_ROCK],         TYPE_ROCK},
    {gTypeNames[TYPE_FLYING],     TYPE_FLYING},
    {gTypeNames[TYPE_PSYCHIC],   TYPE_PSYCHIC},
    {gTypeNames[TYPE_FIGHTING], TYPE_FIGHTING},
    {gTypeNames[TYPE_POISON],     TYPE_POISON},
    {gTypeNames[TYPE_BUG],           TYPE_BUG},
    {gTypeNames[TYPE_GHOST],       TYPE_GHOST},
    {gTypeNames[TYPE_DRAGON],     TYPE_DRAGON},
    {gTypeNames[TYPE_STEEL],       TYPE_STEEL},
    {gTypeNames[TYPE_DARK],         TYPE_DARK},
    {gUnknown_8459360,           NUMBER_OF_MON_TYPES}
};

static const struct ListMenuTemplate gUnknown_8456F04 = {
    .items = gUnknown_8456E74,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .itemPrintFunc = NULL,
    .totalItems = NUMBER_OF_MON_TYPES,
    .maxShowed = 6,
    .windowId = 0,
    .header_X = 0,
    .item_X = 8,
    .cursor_X = 0,
    .upText_Y = 2,
    .cursorPal = 2,
    .fillValue = 1,
    .cursorShadowPal = 3,
    .lettersSpacing = 1,
    .itemVerticalPadding = 0,
    .scrollMultiple = LIST_NO_MULTIPLE_SCROLL,
    .fontId = 2,
    .cursorKind = 0
};

static const struct WindowTemplate gUnknown_8456F1C = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 28,
    .height = 2,
    .paletteNum = 13,
    .baseBlock = 0x001
};

static const struct WindowTemplate gUnknown_8456F24 = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 5,
    .width = 28,
    .height = 10,
    .paletteNum = 13,
    .baseBlock = 0x039
};

static const struct ListMenuItem gUnknown_8456F2C[] = {
    {gUnknown_84571AC, -3},
    {gUnknown_84571AC, 0},
    {gUnknown_84571AC, 1},
    {gUnknown_84571AC, 2},
    {gUnknown_84571AC, 3},
    {gUnknown_84571AC, 4},
    {gUnknown_84571AC, 5},
    {gUnknown_84571AC, 6},
    {gUnknown_84571AC, 7},
    {gUnknown_8459368, 8}
};

static const struct ListMenuTemplate gUnknown_8456F7C = {
    .items = gUnknown_8456F2C,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .itemPrintFunc = sub_811ACA4,
    .totalItems = 10,
    .maxShowed = 5,
    .windowId = 0,
    .header_X = 0,
    .item_X = 12,
    .cursor_X = 0,
    .upText_Y = 2,
    .cursorPal = 14,
    .fillValue = 15,
    .cursorShadowPal = 13,
    .lettersSpacing = 1,
    .itemVerticalPadding = 1,
    .scrollMultiple = LIST_NO_MULTIPLE_SCROLL,
    .fontId = 2,
    .cursorKind = 0
};

static const struct WindowTemplate gUnknown_8456F94 = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 5,
    .width = 28,
    .height = 10,
    .paletteNum = 13,
    .baseBlock = 0x039
};

static const struct ListMenuItem gUnknown_8456F9C[] = {
    {gUnknown_84571AC,  0},
    {gUnknown_84571AC,  1},
    {gUnknown_84571AC,  2},
    {gUnknown_84571AC,  3},
    {gUnknown_84571AC,  4},
    {gUnknown_84571AC,  5},
    {gUnknown_84571AC,  6},
    {gUnknown_84571AC,  7},
    {gUnknown_84571AC,  8},
    {gUnknown_84571AC,  9},
    {gUnknown_84571AC, 10},
    {gUnknown_84571AC, 11},
    {gUnknown_84571AC, 12},
    {gUnknown_84571AC, 13},
    {gUnknown_84571AC, 14},
    {gUnknown_84571AC, 15}
};

static const struct ListMenuTemplate gUnknown_845701C = {
    .items = gUnknown_8456F9C,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .itemPrintFunc = nullsub_92,
    .totalItems = 16,
    .maxShowed = 4,
    .windowId = 0,
    .header_X = 0,
    .item_X = 8,
    .cursor_X = 1,
    .upText_Y = 0,
    .cursorPal = 2,
    .fillValue = 1,
    .cursorShadowPal = 3,
    .lettersSpacing = 1,
    .itemVerticalPadding = 0,
    .scrollMultiple = LIST_MULTIPLE_SCROLL_DPAD,
    .fontId = 2,
    .cursorKind = 0
};

static const struct UnkStruct_Shared gUnknown_8457034 = {};

// starts at gUnknown_082F0474 in pokeemerald, union link groups

ALIGNED(4) static const u8 gUnknown_845704C[] = {0x01, 0xFF};
ALIGNED(4) static const u8 gUnknown_8457050[] = {0x02, 0xFF};
ALIGNED(4) static const u8 gUnknown_8457054[] = {0x03, 0xFF};
ALIGNED(4) static const u8 gUnknown_8457058[] = {0x04, 0xFF};
ALIGNED(4) static const u8 gUnknown_845705C[] = {0x09, 0xFF};
ALIGNED(4) static const u8 gUnknown_8457060[] = {0x0A, 0xFF};
ALIGNED(4) static const u8 gUnknown_8457064[] = {0x0B, 0xFF};
ALIGNED(4) static const u8 gUnknown_8457068[] = {0x15, 0xFF};
ALIGNED(4) static const u8 gUnknown_845706C[] = {0x16, 0xFF};
ALIGNED(4) static const u8 gUnknown_8457070[] = {0x40, 0x41, 0x44, 0x45, 0x48, 0x51, 0x52, 0x53, 0x54, 0xFF};
ALIGNED(4) static const u8 gUnknown_845707C[] = {0x0C, 0xFF};
ALIGNED(4) static const u8 gUnknown_8457080[] = {0x01, 0x02, 0x03, 0x04, 0x09, 0x0A, 0x0B, 0x15, 0x16, 0x0D, 0xFF};
ALIGNED(4) static const u8 gUnknown_845708C[] = {0x01, 0x02, 0x03, 0x04, 0x0A, 0xFF};

static const u8 *const gUnknown_8457094[] = {
    gUnknown_845704C,
    gUnknown_8457050,
    gUnknown_8457054,
    gUnknown_8457058,
    gUnknown_845705C,
    gUnknown_8457060,
    gUnknown_8457064,
    gUnknown_8457068,
    gUnknown_845706C,
    gUnknown_8457070,
    gUnknown_845707C,
    gUnknown_8457080,
    gUnknown_845708C
};

static const u8 gUnknown_84570C8[] = {0x01, 0x02, 0x03, 0x04, 0x09, 0x0A, 0x0B, 0x15, 0x16, 0xF7, 0x00, 0xAF, 0xF7, 0x01, 0xFF, 0x00};

extern const u8 gUnknown_84571B0[];
extern const u8 gUnknown_84571B4[];
extern const u8 gUnknown_84571B8[];
extern const u8 gUnknown_84571E0[];
extern const u8 gUnknown_8457234[];
extern const u8 gUnknown_8457264[];
extern const u8 *const gUnknown_845742C[][5];
extern const u8 gUnknown_845747C[];
extern const u8 gUnknown_84574A0[];
extern const u8 gUnknown_84574C4[];
extern const u8 gUnknown_84574EC[];
extern const u8 gUnknown_8457514[];
extern const u8 gUnknown_8457530[];
extern const u8 gUnknown_8457554[];
extern const u8 *const gUnknown_8457608[];
extern const u8 gUnknown_8457610[];
extern const u8 *const gUnknown_845767C[];
extern const u8 gUnknown_84576AC[];
extern const u8 gUnknown_84576C4[];
extern const u8 gUnknown_8457700[];
extern const u8 gUnknown_845771C[];
extern const u8 *const gUnknown_8457754[];
extern const u8 gUnknown_845777C[];
extern const u8 gUnknown_84577BC[];
extern const u8 gUnknown_84577F8[];
extern const u8 *const gUnknown_8457838[];
extern const u8 gUnknown_84578BC[];
extern const u8 *const gUnknown_8457A34[];
extern const u8 *const gUnknown_8457B04[][2];
extern const u8 *const gUnknown_8457BCC[];
extern const u8 *const gUnknown_8457C20[];
extern const u8 gUnknown_8457C48[];
extern const u8 gUnknown_8457CA4[];
extern const u8 gUnknown_8457CF8[];
extern const u8 gUnknown_8457D44[];
extern const u8 gUnknown_8457DB8[];
extern const u8 gUnknown_8457E0C[];
extern const u8 gUnknown_8457E28[];
extern const u8 gUnknown_8457E44[];
extern const u8 gUnknown_8457E60[];
extern const u8 *const gUnknown_8457F80[][2];
extern const u8 gUnknown_8457F90[];
extern const u8 *const gUnknown_84580F4[][4];
extern const u8 *const gUnknown_8458230[][2][3];
extern const u8 *const gUnknown_8458314[];
extern const u8 *const gUnknown_84583B4[];
extern const u8 *const gUnknown_845842C[];
extern const u8 gUnknown_8458434[];
extern const u8 gUnknown_845847C[];
extern const u8 gUnknown_84584C0[];
extern const u8 *const gUnknown_8458548[];
extern const u8 *const gUnknown_84585E8[];
extern const u8 *const gUnknown_8458758[2][4];
extern const u8 *const gUnknown_84588BC[2][4];
extern const u8 *const gUnknown_84589AC[2][2];
extern const u8 *const gUnknown_8458A78[2][4];
extern const u8 gUnknown_8458A98[];
extern const u8 gUnknown_8458AB8[];
extern const u8 gUnknown_8458B44[];
extern const u8 gUnknown_8458CD4[];
extern const u8 gUnknown_8458D1C[];
extern const u8 gUnknown_8458D54[];
extern const u8 gUnknown_8458D78[];
extern const u8 gUnknown_8458D9C[];
extern const u8 gUnknown_8458DBC[];
extern const u8 gUnknown_8458DE8[];
extern const u8 gUnknown_8458E10[];
extern const u8 gUnknown_8458E70[];
extern const u8 gUnknown_8458ED0[];
extern const u8 gUnknown_8458F04[];
extern const u8 gUnknown_8458F9C[];
extern const u8 gUnknown_8458FBC[];
extern const u8 gUnknown_8458FC8[];
extern const u8 gUnknown_8458FE4[];
extern const u8 gUnknown_84591DC[];
extern const u8 *const gUnknown_84591B8[];
extern const u8 gUnknown_8459238[];
extern const u8 gUnknown_8459250[];
extern const u8 gUnknown_845928C[];
extern const u8 *const gUnknown_845933C[];
extern const u8 gUnknown_8459378[];
extern const u8 *const gUnknown_84594B0[];
extern const u8 gUnknown_84594C4[];
extern const u8 gUnknown_8459504[];
extern const u8 *const gUnknown_8459580[];
extern const u8 gUnknown_8459588[];

#undef _8456CD8
