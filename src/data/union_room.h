static const u8 *const sLinkGroupActivityNameTexts[] = {
    [ACTIVITY_NONE]            = gText_UR_EmptyString,
    [ACTIVITY_BATTLE_SINGLE]   = gText_UR_SingleBattle,
    [ACTIVITY_BATTLE_DOUBLE]   = gText_UR_DoubleBattle,
    [ACTIVITY_BATTLE_MULTI]    = gText_UR_MultiBattle,
    [ACTIVITY_TRADE]           = gText_UR_PokemonTrades,
    [ACTIVITY_CHAT]            = gText_UR_Chat,
    [ACTIVITY_WONDER_CARD_DUP] = gText_UR_WonderCards,
    [ACTIVITY_WONDER_NEWS_DUP] = gText_UR_WonderNews,
    [ACTIVITY_CARD]            = gText_UR_Cards,
    [ACTIVITY_POKEMON_JUMP]    = gText_UR_PokemonJump,
    [ACTIVITY_BERRY_CRUSH]     = gText_UR_BerryCrush,
    [ACTIVITY_BERRY_PICK]      = gText_UR_BerryPicking,
    [ACTIVITY_SEARCH]          = gText_UR_Search,
    [ACTIVITY_SPIN_TRADE]      = gText_UR_SpinTrade,
    [ACTIVITY_ITEM_TRADE]      = gText_UR_ItemTrade,
    [ACTIVITY_RECORD_CORNER]   = gText_UR_EmptyString,
    [ACTIVITY_BERRY_BLENDER]   = gText_UR_EmptyString,
    [ACTIVITY_ACCEPT]          = gText_UR_EmptyString,
    [ACTIVITY_DECLINE]         = gText_UR_EmptyString,
    [ACTIVITY_NPCTALK]         = gText_UR_EmptyString,
    [ACTIVITY_PLYRTALK]        = gText_UR_EmptyString,
    [ACTIVITY_WONDER_CARD]     = gText_UR_WonderCards,
    [ACTIVITY_WONDER_NEWS]     = gText_UR_WonderNews
};

static const struct WindowTemplate sWindowTemplate_BButtonCancel = {
    .bg = 0,
    .tilemapLeft = 0,
    .tilemapTop = 0,
    .width = 30,
    .height = 2,
    .paletteNum = 15,
    .baseBlock = 0x008
};

// Minimum and maximum number of players for a link group
// A minimum of 0 means the min and max are equal
#define LINK_GROUP_CAPACITY(min, max)(((min) << 12) | ((max) << 8))
#define GROUP_MAX(capacity)(capacity & 0x0F)
#define GROUP_MIN(capacity)(capacity >> 4)
#define GROUP_MIN2(capacity)(capacity & 0xF0) // Unnecessary to have both, but needed to match

static const u32 sLinkGroupToActivityAndCapacity[] = {
    [LINK_GROUP_SINGLE_BATTLE] = ACTIVITY_BATTLE_SINGLE     | LINK_GROUP_CAPACITY(0, 2),
    [LINK_GROUP_DOUBLE_BATTLE] = ACTIVITY_BATTLE_DOUBLE     | LINK_GROUP_CAPACITY(0, 2),
    [LINK_GROUP_MULTI_BATTLE]  = ACTIVITY_BATTLE_MULTI      | LINK_GROUP_CAPACITY(0, 4),
    [LINK_GROUP_TRADE]         = ACTIVITY_TRADE             | LINK_GROUP_CAPACITY(0, 2),
    [LINK_GROUP_POKEMON_JUMP]  = ACTIVITY_POKEMON_JUMP      | LINK_GROUP_CAPACITY(2, 5),
    [LINK_GROUP_BERRY_CRUSH]   = ACTIVITY_BERRY_CRUSH       | LINK_GROUP_CAPACITY(2, 5),
    [LINK_GROUP_BERRY_PICKING] = ACTIVITY_BERRY_PICK        | LINK_GROUP_CAPACITY(3, 5),
    [LINK_GROUP_WONDER_CARD]   = ACTIVITY_SPIN_TRADE        | LINK_GROUP_CAPACITY(3, 5),
    [LINK_GROUP_WONDER_NEWS]   = ACTIVITY_ITEM_TRADE        | LINK_GROUP_CAPACITY(3, 5)
};

static const struct WindowTemplate sWindowTemplate_List_PossibleGroupMembers = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 3,
    .width = 13,
    .height = 10,
    .paletteNum = 15,
    .baseBlock = 0x044
};

static const struct WindowTemplate sWindowTemplate_NumPlayerMode = {
    .bg = 0,
    .tilemapLeft = 16,
    .tilemapTop = 3,
    .width = 7,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x0C6
};

const struct ListMenuItem sListMenuItems_PossibleGroupMembers[] = {
    {gText_UR_EmptyString, 0},
    {gText_UR_EmptyString, 1},
    {gText_UR_EmptyString, 2},
    {gText_UR_EmptyString, 3},
    {gText_UR_EmptyString, 4}
};

static const struct ListMenuTemplate sListMenuTemplate_PossibleGroupMembers = {
    .items = sListMenuItems_PossibleGroupMembers,
    .moveCursorFunc = NULL,
    .itemPrintFunc = ItemPrintFunc_PossibleGroupMembers,
    .totalItems = ARRAY_COUNT(sListMenuItems_PossibleGroupMembers),
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
    .fontId = FONT_NORMAL,
    .cursorKind = 1
};

static const struct WindowTemplate sWindowTemplate_GroupList = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 3,
    .width = 17,
    .height = 10,
    .paletteNum = 15,
    .baseBlock = 0x044
};

static const struct WindowTemplate sWindowTemplate_PlayerNameAndId = {
    .bg = 0,
    .tilemapLeft = 20,
    .tilemapTop = 3,
    .width = 7,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x0EE
};

static const struct ListMenuItem sListMenuItems_UnionRoomGroups[] = {
    {gText_UR_EmptyString,  0},
    {gText_UR_EmptyString,  1},
    {gText_UR_EmptyString,  2},
    {gText_UR_EmptyString,  3},
    {gText_UR_EmptyString,  4},
    {gText_UR_EmptyString,  5},
    {gText_UR_EmptyString,  6},
    {gText_UR_EmptyString,  7},
    {gText_UR_EmptyString,  8},
    {gText_UR_EmptyString,  9},
    {gText_UR_EmptyString, 10},
    {gText_UR_EmptyString, 11},
    {gText_UR_EmptyString, 12},
    {gText_UR_EmptyString, 13},
    {gText_UR_EmptyString, 14},
    {gText_UR_EmptyString, 15}
};

static const struct ListMenuTemplate sListMenuTemplate_UnionRoomGroups = {
    .items = sListMenuItems_UnionRoomGroups,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .itemPrintFunc = ListMenuItemPrintFunc_UnionRoomGroups,
    .totalItems = ARRAY_COUNT(sListMenuItems_UnionRoomGroups),
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
    .fontId = FONT_NORMAL,
    .cursorKind = 0
};

static const struct WindowTemplate sWindowTemplate_InviteToActivity = {
    .bg = 0,
    .tilemapLeft = 20,
    .tilemapTop = 6,
    .width = 8,
    .height = 7,
    .paletteNum = 15,
    .baseBlock = 0x001
};

static const struct ListMenuItem sListMenuItems_InviteToActivity[] = {
    {gText_UR_Greetings, ACTIVITY_CARD | LINK_GROUP_CAPACITY(0, 2)},
    {gText_UR_Battle,    ACTIVITY_BATTLE_SINGLE | IN_UNION_ROOM | LINK_GROUP_CAPACITY(0, 2)},
    {gText_UR_Chat2,     ACTIVITY_CHAT | IN_UNION_ROOM | LINK_GROUP_CAPACITY(0, 2)},
    {gText_UR_Exit,      ACTIVITY_NONE | IN_UNION_ROOM }
};

static const struct ListMenuTemplate sListMenuTemplate_InviteToActivity = {
    .items = sListMenuItems_InviteToActivity,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .itemPrintFunc = NULL,
    .totalItems = ARRAY_COUNT(sListMenuItems_InviteToActivity),
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
    .fontId = FONT_NORMAL,
    .cursorKind = 0
};

static const struct WindowTemplate sWindowTemplate_RegisterForTrade = {
    .bg = 0,
    .tilemapLeft = 18,
    .tilemapTop = 8,
    .width = 11,
    .height = 5,
    .paletteNum = 15,
    .baseBlock = 0x001
};

static const struct ListMenuItem sListMenuItems_RegisterForTrade[] = {
    {gText_Register,  1},
    {gText_UR_Info,   2},
    {gText_UR_Exit,   3}
};

static const struct ListMenuTemplate sListMenuTemplate_RegisterForTrade = {
    .items = sListMenuItems_RegisterForTrade,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .itemPrintFunc = NULL,
    .totalItems = ARRAY_COUNT(sListMenuItems_RegisterForTrade),
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
    .fontId = FONT_NORMAL,
    .cursorKind = 0
};

static const struct WindowTemplate sWindowTemplate_TypeNames = {
    .bg = 0,
    .tilemapLeft = 20,
    .tilemapTop = 2,
    .width = 9,
    .height = 11,
    .paletteNum = 15,
    .baseBlock = 0x001
};

static const struct ListMenuItem sListMenuItems_TypeNames[NUMBER_OF_MON_TYPES] = {
    { gTypeNames[TYPE_NORMAL],   TYPE_NORMAL         },
    { gTypeNames[TYPE_FIRE],     TYPE_FIRE           },
    { gTypeNames[TYPE_WATER],    TYPE_WATER          },
    { gTypeNames[TYPE_ELECTRIC], TYPE_ELECTRIC       },
    { gTypeNames[TYPE_GRASS],    TYPE_GRASS          },
    { gTypeNames[TYPE_ICE],      TYPE_ICE            },
    { gTypeNames[TYPE_GROUND],   TYPE_GROUND         },
    { gTypeNames[TYPE_ROCK],     TYPE_ROCK           },
    { gTypeNames[TYPE_FLYING],   TYPE_FLYING         },
    { gTypeNames[TYPE_PSYCHIC],  TYPE_PSYCHIC        },
    { gTypeNames[TYPE_FIGHTING], TYPE_FIGHTING       },
    { gTypeNames[TYPE_POISON],   TYPE_POISON         },
    { gTypeNames[TYPE_BUG],      TYPE_BUG            },
    { gTypeNames[TYPE_GHOST],    TYPE_GHOST          },
    { gTypeNames[TYPE_DRAGON],   TYPE_DRAGON         },
    { gTypeNames[TYPE_STEEL],    TYPE_STEEL          },
    { gTypeNames[TYPE_DARK],     TYPE_DARK           },
    { gText_UR_Exit,             NUMBER_OF_MON_TYPES }
};

static const struct ListMenuTemplate sListMenuTemplate_TypeNames = {
    .items = sListMenuItems_TypeNames,
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
    .fontId = FONT_NORMAL,
    .cursorKind = 0
};

static const struct WindowTemplate sWindowTemplate_TradingBoardHeader = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 28,
    .height = 2,
    .paletteNum = 13,
    .baseBlock = 0x001
};

static const struct WindowTemplate sWindowTemplate_TradingBoardMain = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 5,
    .width = 28,
    .height = 10,
    .paletteNum = 13,
    .baseBlock = 0x039
};

static const struct ListMenuItem sListMenuItems_TradeBoard[] = {
    {gText_UR_EmptyString, -3},
    {gText_UR_EmptyString, 0},
    {gText_UR_EmptyString, 1},
    {gText_UR_EmptyString, 2},
    {gText_UR_EmptyString, 3},
    {gText_UR_EmptyString, 4},
    {gText_UR_EmptyString, 5},
    {gText_UR_EmptyString, 6},
    {gText_UR_EmptyString, 7},
    {gText_UR_Exit2, 8}
};

static const struct ListMenuTemplate sListMenuTemplate_TradeBoard = {
    .items = sListMenuItems_TradeBoard,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .itemPrintFunc = TradeBoardListMenuItemPrintFunc,
    .totalItems = ARRAY_COUNT(sListMenuItems_TradeBoard),
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
    .fontId = FONT_NORMAL,
    .cursorKind = 0
};

static const struct WindowTemplate sWindowTemplate_Unused = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 5,
    .width = 28,
    .height = 10,
    .paletteNum = 13,
    .baseBlock = 0x039
};

static const struct ListMenuItem sListMenuItems_Unused[] = {
    {gText_UR_EmptyString,  0},
    {gText_UR_EmptyString,  1},
    {gText_UR_EmptyString,  2},
    {gText_UR_EmptyString,  3},
    {gText_UR_EmptyString,  4},
    {gText_UR_EmptyString,  5},
    {gText_UR_EmptyString,  6},
    {gText_UR_EmptyString,  7},
    {gText_UR_EmptyString,  8},
    {gText_UR_EmptyString,  9},
    {gText_UR_EmptyString, 10},
    {gText_UR_EmptyString, 11},
    {gText_UR_EmptyString, 12},
    {gText_UR_EmptyString, 13},
    {gText_UR_EmptyString, 14},
    {gText_UR_EmptyString, 15}
};

static const struct ListMenuTemplate sListMenuTemplate_Unused = {
    .items = sListMenuItems_Unused,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .itemPrintFunc = ItemPrintFunc_Unused,
    .totalItems = ARRAY_COUNT(sListMenuItems_Unused),
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
    .fontId = FONT_NORMAL,
    .cursorKind = 0
};

static const struct RfuPlayerData sRfuPlayerData_Dummy = {};

ALIGNED(4) static const u8 sAcceptedActivityIds_SingleBattle[] = {ACTIVITY_BATTLE_SINGLE, 0xFF};
ALIGNED(4) static const u8 sAcceptedActivityIds_DoubleBattle[] = {ACTIVITY_BATTLE_DOUBLE, 0xFF};
ALIGNED(4) static const u8 sAcceptedActivityIds_MultiBattle[] = {ACTIVITY_BATTLE_MULTI, 0xFF};
ALIGNED(4) static const u8 sAcceptedActivityIds_Trade[] = {ACTIVITY_TRADE, 0xFF};
ALIGNED(4) static const u8 sAcceptedActivityIds_PokemonJump[] = {ACTIVITY_POKEMON_JUMP, 0xFF};
ALIGNED(4) static const u8 sAcceptedActivityIds_BerryCrush[] = {ACTIVITY_BERRY_CRUSH, 0xFF};
ALIGNED(4) static const u8 sAcceptedActivityIds_BerryPicking[] = {ACTIVITY_BERRY_PICK, 0xFF};
ALIGNED(4) static const u8 sAcceptedActivityIds_WonderCard[] = {ACTIVITY_WONDER_CARD, 0xFF};
ALIGNED(4) static const u8 sAcceptedActivityIds_WonderNews[] = {ACTIVITY_WONDER_NEWS, 0xFF};
ALIGNED(4) static const u8 sAcceptedActivityIds_Resume[] = {
    IN_UNION_ROOM | ACTIVITY_NONE,
    IN_UNION_ROOM | ACTIVITY_BATTLE_SINGLE,
    IN_UNION_ROOM | ACTIVITY_TRADE,
    IN_UNION_ROOM | ACTIVITY_CHAT,
    IN_UNION_ROOM | ACTIVITY_CARD,
    IN_UNION_ROOM | ACTIVITY_ACCEPT,
    IN_UNION_ROOM | ACTIVITY_DECLINE,
    IN_UNION_ROOM | ACTIVITY_NPCTALK,
    IN_UNION_ROOM | ACTIVITY_PLYRTALK,
    0xFF
};
ALIGNED(4) static const u8 sAcceptedActivityIds_Init[] = {ACTIVITY_SEARCH, 0xFF};
ALIGNED(4) static const u8 sAcceptedActivityIds_Unk11[] = {
    ACTIVITY_BATTLE_SINGLE,
    ACTIVITY_BATTLE_DOUBLE,
    ACTIVITY_BATTLE_MULTI,
    ACTIVITY_TRADE,
    ACTIVITY_POKEMON_JUMP,
    ACTIVITY_BERRY_CRUSH,
    ACTIVITY_BERRY_PICK,
    ACTIVITY_WONDER_CARD,
    ACTIVITY_WONDER_NEWS,
    ACTIVITY_SPIN_TRADE,
    0xFF
};
ALIGNED(4) static const u8 sAcceptedActivityIds_Unk12[] = {
    ACTIVITY_BATTLE_SINGLE,
    ACTIVITY_BATTLE_DOUBLE,
    ACTIVITY_BATTLE_MULTI,
    ACTIVITY_TRADE,
    ACTIVITY_BERRY_CRUSH,
    0xFF
};

static const u8 *const sAcceptedActivityIds[NUM_LINK_GROUP_TYPES] = {
    [LINK_GROUP_SINGLE_BATTLE]     = sAcceptedActivityIds_SingleBattle,
    [LINK_GROUP_DOUBLE_BATTLE]     = sAcceptedActivityIds_DoubleBattle,
    [LINK_GROUP_MULTI_BATTLE]      = sAcceptedActivityIds_MultiBattle,
    [LINK_GROUP_TRADE]             = sAcceptedActivityIds_Trade,
    [LINK_GROUP_POKEMON_JUMP]      = sAcceptedActivityIds_PokemonJump,
    [LINK_GROUP_BERRY_CRUSH]       = sAcceptedActivityIds_BerryCrush,
    [LINK_GROUP_BERRY_PICKING]     = sAcceptedActivityIds_BerryPicking,
    [LINK_GROUP_WONDER_CARD]       = sAcceptedActivityIds_WonderCard,
    [LINK_GROUP_WONDER_NEWS]       = sAcceptedActivityIds_WonderNews,
    [LINK_GROUP_UNION_ROOM_RESUME] = sAcceptedActivityIds_Resume,
    [LINK_GROUP_UNION_ROOM_INIT]   = sAcceptedActivityIds_Init,
    [LINK_GROUP_UNK_11]            = sAcceptedActivityIds_Unk11,
    [LINK_GROUP_UNK_12]            = sAcceptedActivityIds_Unk12,
};

static const u8 sLinkGroupToURoomActivity[] = {
    [LINK_GROUP_SINGLE_BATTLE] = ACTIVITY_BATTLE_SINGLE,
    [LINK_GROUP_DOUBLE_BATTLE] = ACTIVITY_BATTLE_DOUBLE,
    [LINK_GROUP_MULTI_BATTLE]  = ACTIVITY_BATTLE_MULTI,
    [LINK_GROUP_TRADE]         = ACTIVITY_TRADE,
    [LINK_GROUP_POKEMON_JUMP]  = ACTIVITY_POKEMON_JUMP,
    [LINK_GROUP_BERRY_CRUSH]   = ACTIVITY_BERRY_CRUSH,
    [LINK_GROUP_BERRY_PICKING] = ACTIVITY_BERRY_PICK,
    [LINK_GROUP_WONDER_CARD]   = ACTIVITY_WONDER_CARD,
    [LINK_GROUP_WONDER_NEWS]   = ACTIVITY_WONDER_NEWS
};

// Unused
static const u8 sDotSeparatedValues[] = _("{DYNAMIC 00}·{DYNAMIC 01}");
