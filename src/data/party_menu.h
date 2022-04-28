static const struct BgTemplate sPartyMenuBgTemplates[] =
{
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0
    },
    {
        .bg = 1,
        .charBaseIndex = 0,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0
    },
    {
        .bg = 2,
        .charBaseIndex = 0,
        .mapBaseIndex = 28,
        .screenSize = 1,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0
    },
};

enum
{
    PARTY_BOX_LEFT_COLUMN,
    PARTY_BOX_RIGHT_COLUMN,
};

static const struct PartyMenuBoxInfoRects sPartyBoxInfoRects[] =
{
    [PARTY_BOX_LEFT_COLUMN] = 
    {
        BlitBitmapToPartyWindow_LeftColumn, 
        {
            // The below are the x, y, width, and height for each of the following info
            24, 11, 40, 13, // Nickname
            32, 20, 32,  8, // Level
            64, 20,  8,  8, // Gender
            38, 36, 24,  8, // HP
            53, 36, 24,  8, // Max HP
            24, 35, 48,  3  // HP bar
        }, 
        12, 34, 64, 16      // Description text (e.g. NO USE)
    },
    [PARTY_BOX_RIGHT_COLUMN] = 
    {
        BlitBitmapToPartyWindow_RightColumn, 
        {
             // The below are the x, y, width, and height for each of the following info
             22,  3, 40, 13, // Nickname
             32, 12, 32,  8, // Level
             64, 12,  8,  8, // Gender
            102, 12, 24,  8, // HP
            117, 12, 24,  8, // Max HP
             88, 10, 48,  3  // HP bar
        }, 
        77, 4, 64, 16        // Description text
    },
};

static const u8 sPartyMenuSpriteCoords[PARTY_LAYOUT_COUNT][PARTY_SIZE][4 * 2] =
{
    [PARTY_LAYOUT_SINGLE] = 
    {
        { 16,  40,  20,  50,  56,  52,  16,  34},
        {104,  18, 108,  28, 144,  27, 102,  25},
        {104,  42, 108,  52, 144,  51, 102,  49},
        {104,  66, 108,  76, 144,  75, 102,  73},
        {104,  90, 108, 100, 144,  99, 102,  97},
        {104, 114, 108, 124, 144, 123, 102, 121},
    },
    [PARTY_LAYOUT_DOUBLE] = 
    {
        { 16,  24,  20,  34,  56,  36,  16,  18},
        { 16,  80,  20,  90,  56,  92,  16,  74},
        {104,  18, 108,  28, 144,  27, 102,  25},
        {104,  50, 108,  60, 144,  59, 102,  57},
        {104,  82, 108,  92, 144,  91, 102,  89},
        {104, 114, 108, 124, 144, 123, 102, 121},
    },
    [PARTY_LAYOUT_MULTI] = 
    {
        { 16,  24,  20,  34,  56,  36,  16,  18},
        { 16,  80,  20,  90,  56,  92,  16,  74},
        {104,  26, 106,  36, 144,  35, 102,  33},
        {104,  50, 106,  60, 144,  59, 102,  57},
        {104,  82, 106,  92, 144,  91, 102,  89},
        {104, 106, 106, 116, 144, 115, 102, 113},
    },
    [PARTY_LAYOUT_MULTI_SHOWCASE] = 
    {
        { 16,  32,  20,  42,  56,  44,  16,  26},
        {104,  34, 106,  44, 144,  43, 102,  41},
        {104,  58, 106,  68, 144,  67, 102,  65},
        { 16, 104,  20, 114,  56, 116,  16,  98},
        {104, 106, 106, 116, 144, 115, 102, 113},
        {104, 130, 106, 140, 144, 139, 102, 137},
    },
};

static const u32 sConfirmButton_Tilemap[] = INCBIN_U32("graphics/interface/party_menu_confirm_button.bin");
static const u32 sCancelButton_Tilemap[] = INCBIN_U32("graphics/interface/party_menu_cancel_button.bin");

static const u8 sFontColorTable[][3] =
{
    {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_LIGHT_GRAY, TEXT_COLOR_DARK_GRAY},  // Default
    {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_WHITE,      TEXT_COLOR_GREEN},      // Unused
    {TEXT_COLOR_TRANSPARENT, TEXT_DYNAMIC_COLOR_2,  TEXT_DYNAMIC_COLOR_3},  // Gender symbol
    {TEXT_COLOR_WHITE,       TEXT_COLOR_DARK_GRAY,  TEXT_COLOR_LIGHT_GRAY}, // Selection actions
    {TEXT_COLOR_WHITE,       TEXT_COLOR_BLUE,       TEXT_COLOR_LIGHT_BLUE}, // Field moves
    {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_WHITE,      TEXT_COLOR_DARK_GRAY},  // Unused
};

static const struct WindowTemplate sSinglePartyMenuWindowTemplate[] =
{
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 3,
        .width = 10,
        .height = 7,
        .paletteNum = 3,
        .baseBlock = 0x63,
    },
    {
        .bg = 0,
        .tilemapLeft = 12,
        .tilemapTop = 1,
        .width = 18,
        .height = 3,
        .paletteNum = 4,
        .baseBlock = 0xA9,
    },
    {
        .bg = 0,
        .tilemapLeft = 12,
        .tilemapTop = 4,
        .width = 18,
        .height = 3,
        .paletteNum = 5,
        .baseBlock = 0xDF,
    },
    {
        .bg = 0,
        .tilemapLeft = 12,
        .tilemapTop = 7,
        .width = 18,
        .height = 3,
        .paletteNum = 6,
        .baseBlock = 0x115,
    },
    {
        .bg = 0,
        .tilemapLeft = 12,
        .tilemapTop = 10,
        .width = 18,
        .height = 3,
        .paletteNum = 7,
        .baseBlock = 0x14B,
    },
    {
        .bg = 0,
        .tilemapLeft = 12,
        .tilemapTop = 13,
        .width = 18,
        .height = 3,
        .paletteNum = 8,
        .baseBlock = 0x181,
    },
    {
        .bg = 2,
        .tilemapLeft = 1,
        .tilemapTop = 15,
        .width = 28,
        .height = 4,
        .paletteNum = 14,
        .baseBlock = 0x1DF,
    },
    DUMMY_WIN_TEMPLATE,
};

static const struct WindowTemplate sDoublePartyMenuWindowTemplate[] =
{
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 10,
        .height = 7,
        .paletteNum = 3,
        .baseBlock = 0x63,
    },
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 8,
        .width = 10,
        .height = 7,
        .paletteNum = 4,
        .baseBlock = 0xA9,
    },
    {
        .bg = 0,
        .tilemapLeft = 12,
        .tilemapTop = 1,
        .width = 18,
        .height = 3,
        .paletteNum = 5,
        .baseBlock = 0xEF,
    },
    {
        .bg = 0,
        .tilemapLeft = 12,
        .tilemapTop = 5,
        .width = 18,
        .height = 3,
        .paletteNum = 6,
        .baseBlock = 0x125,
    },
    {
        .bg = 0,
        .tilemapLeft = 12,
        .tilemapTop = 9,
        .width = 18,
        .height = 3,
        .paletteNum = 7,
        .baseBlock = 0x15B,
    },
    {
        .bg = 0,
        .tilemapLeft = 12,
        .tilemapTop = 13,
        .width = 18,
        .height = 3,
        .paletteNum = 8,
        .baseBlock = 0x191,
    },
    {
        .bg = 2,
        .tilemapLeft = 1,
        .tilemapTop = 15,
        .width = 28,
        .height = 4,
        .paletteNum = 14,
        .baseBlock = 0x1DF,
    },
    DUMMY_WIN_TEMPLATE,
};

static const struct WindowTemplate sMultiPartyMenuWindowTemplate[] =
{
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 10,
        .height = 7,
        .paletteNum = 3,
        .baseBlock = 0x63,
    },
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 8,
        .width = 10,
        .height = 7,
        .paletteNum = 4,
        .baseBlock = 0xA9,
    },
    {
        .bg = 0,
        .tilemapLeft = 12,
        .tilemapTop = 2,
        .width = 18,
        .height = 3,
        .paletteNum = 5,
        .baseBlock = 0xEF,
    },
    {
        .bg = 0,
        .tilemapLeft = 12,
        .tilemapTop = 5,
        .width = 18,
        .height = 3,
        .paletteNum = 6,
        .baseBlock = 0x125,
    },
    {
        .bg = 0,
        .tilemapLeft = 12,
        .tilemapTop = 9,
        .width = 18,
        .height = 3,
        .paletteNum = 7,
        .baseBlock = 0x15B,
    },
    {
        .bg = 0,
        .tilemapLeft = 12,
        .tilemapTop = 12,
        .width = 18,
        .height = 3,
        .paletteNum = 8,
        .baseBlock = 0x191,
    },
    {
        .bg = 2,
        .tilemapLeft = 1,
        .tilemapTop = 15,
        .width = 28,
        .height = 4,
        .paletteNum = 14,
        .baseBlock = 0x1DF,
    },
    DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sShowcaseMultiPartyMenuWindowTemplate[] =
{
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 2,
        .width = 10,
        .height = 7,
        .paletteNum = 3,
        .baseBlock = 0x63,
    },
    {
        .bg = 0,
        .tilemapLeft = 12,
        .tilemapTop = 3,
        .width = 18,
        .height = 3,
        .paletteNum = 5,
        .baseBlock = 0xA9,
    },
    {
        .bg = 0,
        .tilemapLeft = 12,
        .tilemapTop = 6,
        .width = 18,
        .height = 3,
        .paletteNum = 6,
        .baseBlock = 0xDF,
    },
    {
        .bg = 2,
        .tilemapLeft = 1,
        .tilemapTop = 11,
        .width = 10,
        .height = 7,
        .paletteNum = 4,
        .baseBlock = 0x115,
    },
    {
        .bg = 2,
        .tilemapLeft = 12,
        .tilemapTop = 12,
        .width = 18,
        .height = 3,
        .paletteNum = 7,
        .baseBlock = 0x16B,
    },
    {
        .bg = 2,
        .tilemapLeft = 12,
        .tilemapTop = 15,
        .width = 18,
        .height = 3,
        .paletteNum = 8,
        .baseBlock = 0x1A1,
    },
    DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sCancelButtonWindowTemplate =
{
    .bg = 0,
    .tilemapLeft = 24,
    .tilemapTop = 17,
    .width = 6,
    .height = 2,
    .paletteNum = 3,
    .baseBlock = 0x1C7,
};

static const struct WindowTemplate sMultiCancelButtonWindowTemplate =
{
    .bg = 0,
    .tilemapLeft = 24,
    .tilemapTop = 18,
    .width = 6,
    .height = 2,
    .paletteNum = 3,
    .baseBlock = 0x1C7,
};

static const struct WindowTemplate sConfirmButtonWindowTemplate =
{
    .bg = 0,
    .tilemapLeft = 24,
    .tilemapTop = 16,
    .width = 6,
    .height = 2,
    .paletteNum = 3,
    .baseBlock = 0x1D3,
};

static const struct WindowTemplate sDefaultPartyMsgWindowTemplate =
{
    .bg = 2,
    .tilemapLeft = 1,
    .tilemapTop = 17,
    .width = 21,
    .height = 2,
    .paletteNum = 15,
    .baseBlock = 0x24F,
};

static const struct WindowTemplate sDoWhatWithMonMsgWindowTemplate =
{
    .bg = 2,
    .tilemapLeft = 1,
    .tilemapTop = 17,
    .width = 16,
    .height = 2,
    .paletteNum = 15,
    .baseBlock = 0x279,
};

static const struct WindowTemplate sDoWhatWithItemMsgWindowTemplate =
{
    .bg = 2,
    .tilemapLeft = 1,
    .tilemapTop = 17,
    .width = 19,
    .height = 2,
    .paletteNum = 15,
    .baseBlock = 0x299,
};

static const struct WindowTemplate sDoWhatWithMailMsgWindowTemplate =
{
    .bg = 2,
    .tilemapLeft = 1,
    .tilemapTop = 17,
    .width = 16,
    .height = 2,
    .paletteNum = 15,
    .baseBlock = 0x299,
};

static const struct WindowTemplate sWhichMoveMsgWindowTemplate =
{
    .bg = 2,
    .tilemapLeft = 1,
    .tilemapTop = 17,
    .width = 15,
    .height = 2,
    .paletteNum = 15,
    .baseBlock = 0x299,
};

static const struct WindowTemplate sItemGiveTakeWindowTemplate =
{
    .bg = 2,
    .tilemapLeft = 22,
    .tilemapTop = 13,
    .width = 7,
    .height = 6,
    .paletteNum = 14,
    .baseBlock = 0x373,
};

static const struct WindowTemplate sMailReadTakeWindowTemplate =
{
    .bg = 2,
    .tilemapLeft = 19,
    .tilemapTop = 13,
    .width = 10,
    .height = 6,
    .paletteNum = 14,
    .baseBlock = 0x373,
};

static const struct WindowTemplate sMoveSelectWindowTemplate =
{
    .bg = 2,
    .tilemapLeft = 18,
    .tilemapTop = 11,
    .width = 11,
    .height = 8,
    .paletteNum = 14,
    .baseBlock = 0x2BF,
};

static const struct WindowTemplate sPartyMenuYesNoWindowTemplate =
{
    .bg = 2,
    .tilemapLeft = 21,
    .tilemapTop = 9,
    .width = 6,
    .height = 4,
    .paletteNum = 14,
    .baseBlock = 0x2BF,
};

static const struct WindowTemplate sLevelUpStatsWindowTemplate =
{
    .bg = 2,
    .tilemapLeft = 19,
    .tilemapTop = 1,
    .width = 10,
    .height = 11,
    .paletteNum = 14,
    .baseBlock = 0x2BF,
};

static const struct WindowTemplate sWindowTemplate_FirstBattleOakVoiceover =
{
    .bg = 2,
    .tilemapLeft = 2,
    .tilemapTop = 15,
    .width = 26,
    .height = 4,
    .paletteNum = 14,
    .baseBlock = 0x1DF,
};

static const struct WindowTemplate gUnknown_845A178 =
{
    .bg = 2,
    .tilemapLeft = 0,
    .tilemapTop = 13,
    .width = 18,
    .height = 3,
    .paletteNum = 12,
    .baseBlock = 0x373,
};

static const u8 sMainSlotTileNums[] =
{
    24, 25, 25, 25, 25, 25, 25, 25, 25, 26,
    32, 33, 33, 33, 33, 33, 33, 33, 33, 34,
    32, 33, 33, 33, 33, 33, 33, 33, 33, 34,
    32, 33, 33, 33, 33, 33, 33, 33, 33, 34,
    40, 59, 60, 58, 58, 58, 58, 58, 58, 61,
    15, 16, 16, 16, 16, 16, 16, 16, 16, 17,
    46, 47, 47, 47, 47, 47, 47, 47, 47, 48,
};

static const u8 sMainSlotTileNums_Egg[] =
{
    24, 25, 25, 25, 25, 25, 25, 25, 25, 26,
    32, 33, 33, 33, 33, 33, 33, 33, 33, 34,
    32, 33, 33, 33, 33, 33, 33, 33, 33, 34,
    32, 33, 33, 33, 33, 33, 33, 33, 33, 34,
    40, 41, 41, 41, 41, 41, 41, 41, 41, 42,
    15, 16, 16, 16, 16, 16, 16, 16, 16, 17,
    46, 47, 47, 47, 47, 47, 47, 47, 47, 48,
};

static const u8 sOtherSlotsTileNums[] =
{
    43, 44, 44, 44, 44, 44, 44, 44, 44, 44,
    44, 44, 44, 44, 44, 44, 44, 45, 49, 33,
    33, 33, 33, 33, 33, 33, 33, 52, 53, 51,
    51, 51, 51, 51, 51, 54, 55, 56, 56, 56,
    56, 56, 56, 56, 56, 56, 56, 56, 56, 56,
    56, 56, 56, 57,
};

static const u8 sOtherSlotsTileNums_Egg[] =
{
    43, 44, 44, 44, 44, 44, 44, 44, 44, 44,
    44, 44, 44, 44, 44, 44, 44, 45, 49, 33,
    33, 33, 33, 33, 33, 33, 33, 33, 33, 33,
    33, 33, 33, 33, 33, 50, 55, 56, 56, 56,
    56, 56, 56, 56, 56, 56, 56, 56, 56, 56,
    56, 56, 56, 57,
};

static const u8 sEmptySlotTileNums[] = 
{
    21, 22, 22, 22, 22, 22, 22, 22, 22, 22,
    22, 22, 22, 22, 22, 22, 22, 23, 30,  0,
     0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
     0,  0,  0,  0,  0, 31, 37, 38, 38, 38,
    38, 38, 38, 38, 38, 38, 38, 38, 38, 38,
    38, 38, 38, 39,
};

static const u8 sGenderPalOffsets[] = {11, 12};

static const u8 sHPBarPalOffsets[] = {9, 10};

static const u8 sPartyBoxPalOffsets1[] = {4, 5, 6};

static const u8 sPartyBoxPalOffsets2[] = {1, 7, 8};

static const u8 sGenderMalePalIds[] = {59, 60};

static const u8 sGenderFemalePalIds[] = {75, 76};

static const u8 sHPBarGreenPalIds[] = {57, 58};

static const u8 sHPBarYellowPalIds[] = {73, 74};

static const u8 sHPBarRedPalIds[] = {89, 90};

static const u8 sPartyBoxEmptySlotPalIds1[] = {52, 53, 54};

static const u8 sPartyBoxMultiPalIds1[] = {68, 69, 70};

static const u8 sPartyBoxFaintedPalIds1[] = {84, 85, 86};

static const u8 sPartyBoxCurrSelectionPalIds1[] = {116, 117, 118};

static const u8 sPartyBoxCurrSelectionMultiPalIds[] = {132, 133, 134};

static const u8 sPartyBoxCurrSelectionFaintedPalIds[] = {148, 149, 150};

static const u8 sPartyBoxSelectedForActionPalIds1[] = {100, 101, 102};

static const u8 sPartyBoxEmptySlotPalIds2[] = {49, 55, 56};

static const u8 sPartyBoxMultiPalIds2[] = {65, 71, 72};

static const u8 sPartyBoxFaintedPalIds2[] = {81, 87, 88};

static const u8 sPartyBoxCurrSelectionPalIds2[] = {97, 103, 104};

static const u8 sPartyBoxSelectedForActionPalIds2[] = {161, 167, 168};

static const u8 *const sActionStringTable[] =
{
    [PARTY_MSG_CHOOSE_MON]             = gText_ChoosePokemon,
    [PARTY_MSG_CHOOSE_MON_OR_CANCEL]   = gText_ChoosePokemonCancel,
    [PARTY_MSG_CHOOSE_MON_AND_CONFIRM] = gText_ChoosePokemonConfirm,
    [PARTY_MSG_MOVE_TO_WHERE]          = gText_MoveToWhere,
    [PARTY_MSG_TEACH_WHICH_MON]        = gText_TeachWhichPokemon,
    [PARTY_MSG_USE_ON_WHICH_MON]       = gText_UseOnWhichPokemon,
    [PARTY_MSG_GIVE_TO_WHICH_MON]      = gText_GiveToWhichPokemon,
    [PARTY_MSG_NOTHING_TO_CUT]         = gText_NothingToCut,
    [PARTY_MSG_CANT_SURF_HERE]         = gText_CantSurfHere,
    [PARTY_MSG_ALREADY_SURFING]        = gText_AlreadySurfing,
    [PARTY_MSG_CURRENT_TOO_FAST]       = gText_CurrentIsTooFast,
    [PARTY_MSG_ENJOY_CYCLING]          = gText_EnjoyCycling,
    [PARTY_MSG_ALREADY_IN_USE]         = gText_InUseAlready_PM,
    [PARTY_MSG_CANT_USE_HERE]          = gText_CantUseHere,
    [PARTY_MSG_NO_MON_FOR_BATTLE]      = gText_NoPokemonForBattle,
    [PARTY_MSG_CHOOSE_MON_2]           = gText_ChoosePokemon2,
    [PARTY_MSG_NOT_ENOUGH_HP]          = gText_NotEnoughHp,
    [PARTY_MSG_THREE_MONS_ARE_NEEDED]  = gText_ThreePkmnAreNeeded,
    [PARTY_MSG_TWO_MONS_ARE_NEEDED]    = gText_TwoPokemonAreNeeded,
    [PARTY_MSG_MONS_CANT_BE_SAME]      = gText_PokemonCantBeSame,
    [PARTY_MSG_NO_SAME_HOLD_ITEMS]     = gText_NoIdenticalHoldItems,
    [PARTY_MSG_UNUSED]                 = gString_Dummy,
    [PARTY_MSG_DO_WHAT_WITH_MON]       = gText_DoWhatWithPokemon,
    [PARTY_MSG_RESTORE_WHICH_MOVE]     = gText_RestoreWhichMove,
    [PARTY_MSG_BOOST_PP_WHICH_MOVE]    = gText_BoostPp,
    [PARTY_MSG_DO_WHAT_WITH_ITEM]      = gText_DoWhatWithItem,
    [PARTY_MSG_DO_WHAT_WITH_MAIL]      = gText_DoWhatWithMail,
};

static const u8 *const sDescriptionStringTable[] =
{
    [PARTYBOX_DESC_NO_USE]     = gText_NoUse,
    [PARTYBOX_DESC_ABLE_3]     = gText_Able,
    [PARTYBOX_DESC_FIRST]      = gText_First_PM,
    [PARTYBOX_DESC_SECOND]     = gText_Second_PM,
    [PARTYBOX_DESC_THIRD]      = gText_Third_PM,
    [PARTYBOX_DESC_ABLE]       = gText_Able2,
    [PARTYBOX_DESC_NOT_ABLE]   = gText_NotAble,
    [PARTYBOX_DESC_ABLE_2]     = gText_Able3,
    [PARTYBOX_DESC_NOT_ABLE_2] = gText_NotAble2,
    [PARTYBOX_DESC_LEARNED]    = gText_Learned,
};

static const u8 *const sHMDescriptionTable[] =
{
    gText_LightUpDarkness,
    gText_CutATreeOrGrass,
    gText_FlyToAKnownTown,
    gText_MoveHeavyBoulders,
    gText_TravelOnWater,
    gText_ShatterACrackedRock,
    gText_ClimbAWaterfall,
    gText_ReturnToAHealingSpot,
    gText_EscapeFromHere,
    gText_ShareHp,
    gText_ShareHp,
    gText_LureWildPokemon,
};

static const u32 sHeldItemGfx[] = INCBIN_U32("graphics/interface/hold_icons.4bpp");
static const u16 sHeldItemPalette[] = INCBIN_U16("graphics/interface/hold_icons.gbapal");

static const struct OamData sOamData_HeldItem =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = SPRITE_SHAPE(8x8),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(8x8),
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sSpriteAnim_HeldItem[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_HeldMail[] =
{
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_HeldItem[] =
{
    sSpriteAnim_HeldItem,
    sSpriteAnim_HeldMail,
};

static const struct SpriteSheet sSpriteSheet_HeldItem =
{
    sHeldItemGfx, sizeof(sHeldItemGfx), 0xD750
};

static const struct SpritePalette sSpritePalette_HeldItem =
{
    sHeldItemPalette, 0xD750
};

static const struct SpriteTemplate sSpriteTemplate_HeldItem =
{
    0xD750,
    0xD750,
    &sOamData_HeldItem,
    sSpriteAnimTable_HeldItem,
    NULL,
    gDummySpriteAffineAnimTable,
    SpriteCallbackDummy,
};

static const struct OamData sOamData_MenuPokeball =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = SPRITE_SHAPE(32x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x32),
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sPokeballAnim_Closed[] =
{
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END
};

static const union AnimCmd sPokeballAnim_Open[] =
{
    ANIMCMD_FRAME(16, 0),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_MenuPokeball[] =
{
    sPokeballAnim_Closed,
    sPokeballAnim_Open,
};

static const struct CompressedSpriteSheet sSpriteSheet_MenuPokeball =
{
    gPartyMenuPokeball_Gfx, 0x400, 0x04b0
};

static const struct CompressedSpritePalette sSpritePalette_MenuPokeball =
{
    gPartyMenuPokeball_Pal, 0x04b0
};

// Used for the pokeball sprite on each party slot / Cancel button
static const struct SpriteTemplate sSpriteTemplate_MenuPokeball =
{
    .tileTag = 0x04b0,
    .paletteTag = 0x04b0,
    .oam = &sOamData_MenuPokeball,
    .anims = sSpriteAnimTable_MenuPokeball,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct OamData sOamData_MenuPokeballSmall =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sSmallPokeballAnim_Closed[] =
{
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END
};

static const union AnimCmd sSmallPokeballAnim_Open[] =
{
    ANIMCMD_FRAME(4, 0),
    ANIMCMD_END
};

static const union AnimCmd sSmallPokeballAnim_Blank1[] =
{
    ANIMCMD_FRAME(8, 0),
    ANIMCMD_END
};

static const union AnimCmd sSmallPokeballAnim_Blank2[] =
{
    ANIMCMD_FRAME(12, 0),
    ANIMCMD_END
};

static const union AnimCmd sSmallPokeballAnim_Blank3[] =
{
    ANIMCMD_FRAME(16, 0),
    ANIMCMD_END
};

static const union AnimCmd sSmallPokeballAnim_Blank4[] =
{
    ANIMCMD_FRAME(20, 0),
    ANIMCMD_END
};

// The blanks below are never used. See SpriteCB_BounceConfirmCancelButton, where they were intended to be used
static const union AnimCmd *const sSpriteAnimTable_MenuPokeballSmall[] =
{
    sSmallPokeballAnim_Closed,
    sSmallPokeballAnim_Open,
    sSmallPokeballAnim_Blank1,
    sSmallPokeballAnim_Blank2,
    sSmallPokeballAnim_Blank3,
    sSmallPokeballAnim_Blank4,
};

static const struct CompressedSpriteSheet sSpriteSheet_MenuPokeballSmall =
{
    gPartyMenuPokeballSmall_Gfx, 0x0300, 0x04b1
};

// Used for the pokeball sprite next to Cancel and Confirm when both are present, otherwise sSpriteTemplate_MenuPokeball is used
static const struct SpriteTemplate sSpriteTemplate_MenuPokeballSmall =
{
    .tileTag = 1201,
    .paletteTag = 1200,
    .oam = &sOamData_MenuPokeballSmall,
    .anims = sSpriteAnimTable_MenuPokeballSmall,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct OamData sOamData_StatusCondition =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = SPRITE_SHAPE(32x8),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x8),
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sSpriteAnim_StatusPoison[] =
{
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_StatusParalyzed[] =
{
    ANIMCMD_FRAME(4, 0),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_StatusSleep[] =
{
    ANIMCMD_FRAME(8, 0),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_StatusFrozen[] =
{
    ANIMCMD_FRAME(12, 0),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_StatusBurn[] =
{
    ANIMCMD_FRAME(16, 0),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_StatusPokerus[] =
{
    ANIMCMD_FRAME(20, 0),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_StatusFaint[] =
{
    ANIMCMD_FRAME(24, 0),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_Blank[] =
{
    ANIMCMD_FRAME(28, 0),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteTemplate_StatusCondition[] =
{
    sSpriteAnim_StatusPoison,
    sSpriteAnim_StatusParalyzed,
    sSpriteAnim_StatusSleep,
    sSpriteAnim_StatusFrozen,
    sSpriteAnim_StatusBurn,
    sSpriteAnim_StatusPokerus,
    sSpriteAnim_StatusFaint,
    sSpriteAnim_Blank,
};

static const struct CompressedSpriteSheet sSpriteSheet_StatusIcons =
{
    gStatusGfx_Icons, 0x400, 1202
};

static const struct CompressedSpritePalette sSpritePalette_StatusIcons =
{
    gStatusPal_Icons, 1202
};

static const struct SpriteTemplate sSpriteTemplate_StatusIcons =
{
    .tileTag = 1202,
    .paletteTag = 1202,
    .oam = &sOamData_StatusCondition,
    .anims = sSpriteTemplate_StatusCondition,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const bool8 sMultiBattlePartnersPartyMask[PARTY_SIZE + 2] = 
{
    FALSE, 
    TRUE, 
    FALSE, 
    FALSE, 
    TRUE, 
    TRUE, 
    FALSE,
};

static const u16 sTMHMMoves_Duplicate[] =
{
    MOVE_FOCUS_PUNCH,
    MOVE_DRAGON_CLAW,
    MOVE_WATER_PULSE,
    MOVE_CALM_MIND,
    MOVE_ROAR,
    MOVE_TOXIC,
    MOVE_HAIL,
    MOVE_BULK_UP,
    MOVE_BULLET_SEED,
    MOVE_HIDDEN_POWER,
    MOVE_SUNNY_DAY,
    MOVE_TAUNT,
    MOVE_ICE_BEAM,
    MOVE_BLIZZARD,
    MOVE_HYPER_BEAM,
    MOVE_LIGHT_SCREEN,
    MOVE_PROTECT,
    MOVE_RAIN_DANCE,
    MOVE_GIGA_DRAIN,
    MOVE_SAFEGUARD,
    MOVE_FRUSTRATION,
    MOVE_SOLAR_BEAM,
    MOVE_IRON_TAIL,
    MOVE_THUNDERBOLT,
    MOVE_THUNDER,
    MOVE_EARTHQUAKE,
    MOVE_RETURN,
    MOVE_DIG,
    MOVE_PSYCHIC,
    MOVE_SHADOW_BALL,
    MOVE_BRICK_BREAK,
    MOVE_DOUBLE_TEAM,
    MOVE_REFLECT,
    MOVE_SHOCK_WAVE,
    MOVE_FLAMETHROWER,
    MOVE_SLUDGE_BOMB,
    MOVE_SANDSTORM,
    MOVE_FIRE_BLAST,
    MOVE_ROCK_TOMB,
    MOVE_AERIAL_ACE,
    MOVE_TORMENT,
    MOVE_FACADE,
    MOVE_SECRET_POWER,
    MOVE_REST,
    MOVE_ATTRACT,
    MOVE_THIEF,
    MOVE_STEEL_WING,
    MOVE_SKILL_SWAP,
    MOVE_SNATCH,
    MOVE_OVERHEAT,
    MOVE_CUT,
    MOVE_FLY,
    MOVE_SURF,
    MOVE_STRENGTH,
    MOVE_FLASH,
    MOVE_ROCK_SMASH,
    MOVE_WATERFALL,
    MOVE_DIVE,
};

enum
{
    MENU_SUMMARY,
    MENU_NICKNAME,
    MENU_SWITCH,
    MENU_CANCEL1,
    MENU_ITEM,
    MENU_GIVE,
    MENU_TAKE_ITEM,
    MENU_MAIL,
    MENU_TAKE_MAIL,
    MENU_READ,
    MENU_CANCEL2,
    MENU_SHIFT,
    MENU_SEND_OUT,
    MENU_ENTER,
    MENU_NO_ENTRY,
    MENU_STORE,
    MENU_REGISTER,
    MENU_TRADE1,
    MENU_TRADE2,
    MENU_FIELD_MOVES,
};

static struct
{
    const u8 *text;
    TaskFunc func;
} const sCursorOptions[] =
{
    [MENU_SUMMARY] = {gText_Summary5, CursorCB_Summary},
    [MENU_NICKNAME] = {gText_Nickname, CursorCB_Nickname},
    [MENU_SWITCH] = {gText_Switch2, CursorCB_Switch},
    [MENU_CANCEL1] = {gFameCheckerText_Cancel, CursorCB_Cancel1},
    [MENU_ITEM] = {gText_Item, CursorCB_Item},
    [MENU_GIVE] = {gOtherText_Give, CursorCB_Give},
    [MENU_TAKE_ITEM] = {gText_Take, CursorCB_TakeItem},
    [MENU_MAIL] = {gText_Mail, CursorCB_Mail},
    [MENU_TAKE_MAIL] = {gText_Take2, CursorCB_TakeMail},
    [MENU_READ] = {gText_Read2, CursorCB_Read},
    [MENU_CANCEL2] = {gFameCheckerText_Cancel, CursorCB_Cancel2},
    [MENU_SHIFT] = {gText_Shift, CursorCB_SendMon},
    [MENU_SEND_OUT] = {gText_SendOut, CursorCB_SendMon},
    [MENU_ENTER] = {gText_Enter, CursorCB_Enter},
    [MENU_NO_ENTRY] = {gText_NoEntry, CursorCB_NoEntry},
    [MENU_STORE] = {gText_Store, CursorCB_Store},
    [MENU_REGISTER] = {gText_Register, CursorCB_Register},
    [MENU_TRADE1] = {gText_Trade4, CursorCB_Trade1},
    [MENU_TRADE2] = {gText_Trade4, CursorCB_Trade2},
    [MENU_FIELD_MOVES + FIELD_MOVE_FLASH] = {gMoveNames[MOVE_FLASH], CursorCB_FieldMove},
    [MENU_FIELD_MOVES + FIELD_MOVE_CUT] = {gMoveNames[MOVE_CUT], CursorCB_FieldMove},
    [MENU_FIELD_MOVES + FIELD_MOVE_FLY] = {gMoveNames[MOVE_FLY], CursorCB_FieldMove},
    [MENU_FIELD_MOVES + FIELD_MOVE_STRENGTH] = {gMoveNames[MOVE_STRENGTH], CursorCB_FieldMove},
    [MENU_FIELD_MOVES + FIELD_MOVE_SURF] = {gMoveNames[MOVE_SURF], CursorCB_FieldMove},
    [MENU_FIELD_MOVES + FIELD_MOVE_ROCK_SMASH] = {gMoveNames[MOVE_ROCK_SMASH], CursorCB_FieldMove},
    [MENU_FIELD_MOVES + FIELD_MOVE_WATERFALL] = {gMoveNames[MOVE_WATERFALL], CursorCB_FieldMove},
    [MENU_FIELD_MOVES + FIELD_MOVE_TELEPORT] = {gMoveNames[MOVE_TELEPORT], CursorCB_FieldMove},
    [MENU_FIELD_MOVES + FIELD_MOVE_DIG] = {gMoveNames[MOVE_DIG], CursorCB_FieldMove},
    [MENU_FIELD_MOVES + FIELD_MOVE_MILK_DRINK] = {gMoveNames[MOVE_MILK_DRINK], CursorCB_FieldMove},
    [MENU_FIELD_MOVES + FIELD_MOVE_SOFT_BOILED] = {gMoveNames[MOVE_SOFT_BOILED], CursorCB_FieldMove},
    [MENU_FIELD_MOVES + FIELD_MOVE_SWEET_SCENT] = {gMoveNames[MOVE_SWEET_SCENT], CursorCB_FieldMove},
};

static const u8 sPartyMenuAction_SummarySwitchCancel[] = {MENU_SUMMARY, MENU_SWITCH, MENU_CANCEL1};
static const u8 sPartyMenuAction_ShiftSummaryCancel[] = {MENU_SHIFT, MENU_SUMMARY, MENU_CANCEL1};
static const u8 sPartyMenuAction_SendOutSummaryCancel[] = {MENU_SEND_OUT, MENU_SUMMARY, MENU_CANCEL1};
static const u8 sPartyMenuAction_SummaryCancel[] = {MENU_SUMMARY, MENU_CANCEL1};
static const u8 sPartyMenuAction_EnterSummaryCancel[] = {MENU_ENTER, MENU_SUMMARY, MENU_CANCEL1};
static const u8 sPartyMenuAction_NoEntrySummaryCancel[] = {MENU_NO_ENTRY, MENU_SUMMARY, MENU_CANCEL1};
static const u8 sPartyMenuAction_StoreSummaryCancel[] = {MENU_STORE, MENU_SUMMARY, MENU_CANCEL1};
static const u8 sPartyMenuAction_GiveTakeItemCancel[] = {MENU_GIVE, MENU_TAKE_ITEM, MENU_CANCEL2};
static const u8 sPartyMenuAction_ReadTakeMailCancel[] = {MENU_READ, MENU_TAKE_MAIL, MENU_CANCEL2};
static const u8 sPartyMenuAction_RegisterSummaryCancel[] = {MENU_REGISTER, MENU_SUMMARY, MENU_CANCEL1};
static const u8 sPartyMenuAction_TradeSummaryCancel1[] = {MENU_TRADE1, MENU_SUMMARY, MENU_CANCEL1};
static const u8 sPartyMenuAction_TradeSummaryCancel2[] = {MENU_TRADE2, MENU_SUMMARY, MENU_CANCEL1};

// IDs for the action lists that appear when a party mon is selected
enum
{
    ACTIONS_NONE,
    ACTIONS_SWITCH,
    ACTIONS_SHIFT,
    ACTIONS_SEND_OUT,
    ACTIONS_ENTER,
    ACTIONS_NO_ENTRY,
    ACTIONS_STORE,
    ACTIONS_SUMMARY_ONLY,
    ACTIONS_ITEM,
    ACTIONS_MAIL,
    ACTIONS_REGISTER,
    ACTIONS_TRADE,
    ACTIONS_SPIN_TRADE,
};

static const u8 *const sPartyMenuActions[] =
{
    [ACTIONS_NONE]          = NULL,
    [ACTIONS_SWITCH]        = sPartyMenuAction_SummarySwitchCancel,
    [ACTIONS_SHIFT]         = sPartyMenuAction_ShiftSummaryCancel,
    [ACTIONS_SEND_OUT]      = sPartyMenuAction_SendOutSummaryCancel,
    [ACTIONS_ENTER]         = sPartyMenuAction_EnterSummaryCancel,
    [ACTIONS_NO_ENTRY]      = sPartyMenuAction_NoEntrySummaryCancel,
    [ACTIONS_STORE]         = sPartyMenuAction_StoreSummaryCancel,
    [ACTIONS_SUMMARY_ONLY]  = sPartyMenuAction_SummaryCancel,
    [ACTIONS_ITEM]          = sPartyMenuAction_GiveTakeItemCancel,
    [ACTIONS_MAIL]          = sPartyMenuAction_ReadTakeMailCancel,
    [ACTIONS_REGISTER]      = sPartyMenuAction_RegisterSummaryCancel,
    [ACTIONS_TRADE]         = sPartyMenuAction_TradeSummaryCancel1,
    [ACTIONS_SPIN_TRADE]    = sPartyMenuAction_TradeSummaryCancel2,
};

static const u8 sPartyMenuActionCounts[] =
{
    [ACTIONS_NONE]          = 0,
    [ACTIONS_SWITCH]        = NELEMS(sPartyMenuAction_SummarySwitchCancel),
    [ACTIONS_SHIFT]         = NELEMS(sPartyMenuAction_ShiftSummaryCancel),
    [ACTIONS_SEND_OUT]      = NELEMS(sPartyMenuAction_SendOutSummaryCancel),
    [ACTIONS_ENTER]         = NELEMS(sPartyMenuAction_EnterSummaryCancel),
    [ACTIONS_NO_ENTRY]      = NELEMS(sPartyMenuAction_NoEntrySummaryCancel),
    [ACTIONS_STORE]         = NELEMS(sPartyMenuAction_StoreSummaryCancel),
    [ACTIONS_SUMMARY_ONLY]  = NELEMS(sPartyMenuAction_SummaryCancel),
    [ACTIONS_ITEM]          = NELEMS(sPartyMenuAction_GiveTakeItemCancel),
    [ACTIONS_MAIL]          = NELEMS(sPartyMenuAction_ReadTakeMailCancel),
    [ACTIONS_REGISTER]      = NELEMS(sPartyMenuAction_RegisterSummaryCancel),
    [ACTIONS_TRADE]         = NELEMS(sPartyMenuAction_TradeSummaryCancel1),
    [ACTIONS_SPIN_TRADE]    = NELEMS(sPartyMenuAction_TradeSummaryCancel2),
};

static const u16 sFieldMoves[] =
{
    MOVE_FLASH, MOVE_CUT, MOVE_FLY, MOVE_STRENGTH, MOVE_SURF, MOVE_ROCK_SMASH, MOVE_WATERFALL, MOVE_TELEPORT,
    MOVE_DIG, MOVE_MILK_DRINK, MOVE_SOFT_BOILED, MOVE_SWEET_SCENT, FIELD_MOVE_END // this may be misuse of enum. same in emerald
};

static struct
{
    bool8 (*fieldMoveFunc)(void);
    u8 msgId;
} const sFieldMoveCursorCallbacks[] =
{
    [FIELD_MOVE_FLASH]        = {SetUpFieldMove_Flash,       PARTY_MSG_CANT_USE_HERE},
    [FIELD_MOVE_CUT]          = {SetUpFieldMove_Cut,         PARTY_MSG_NOTHING_TO_CUT},
    [FIELD_MOVE_FLY]          = {SetUpFieldMove_Fly,         PARTY_MSG_CANT_USE_HERE},
    [FIELD_MOVE_STRENGTH]     = {SetUpFieldMove_Strength,    PARTY_MSG_CANT_USE_HERE},
    [FIELD_MOVE_SURF]         = {SetUpFieldMove_Surf,        PARTY_MSG_CANT_SURF_HERE},
    [FIELD_MOVE_ROCK_SMASH]   = {SetUpFieldMove_RockSmash,   PARTY_MSG_CANT_USE_HERE},
    [FIELD_MOVE_WATERFALL]    = {SetUpFieldMove_Waterfall,   PARTY_MSG_CANT_USE_HERE},
    [FIELD_MOVE_TELEPORT]     = {SetUpFieldMove_Teleport,    PARTY_MSG_CANT_USE_HERE},
    [FIELD_MOVE_DIG]          = {SetUpFieldMove_Dig,         PARTY_MSG_CANT_USE_HERE},
    [FIELD_MOVE_MILK_DRINK]   = {SetUpFieldMove_SoftBoiled,  PARTY_MSG_NOT_ENOUGH_HP},
    [FIELD_MOVE_SOFT_BOILED]  = {SetUpFieldMove_SoftBoiled,  PARTY_MSG_NOT_ENOUGH_HP},
    [FIELD_MOVE_SWEET_SCENT]  = {SetUpFieldMove_SweetScent,  PARTY_MSG_CANT_USE_HERE},
};

static const u8 *const sUnionRoomTradeMessages[] =
{
    [UR_TRADE_MSG_NOT_MON_PARTNER_WANTS - 1]       = gText_NotPkmnOtherTrainerWants,
    [UR_TRADE_MSG_NOT_EGG - 1]                     = gText_ThatIsntAnEgg,
    [UR_TRADE_MSG_MON_CANT_BE_TRADED_1 - 1]        = gText_PkmnCantBeTradedNow,
    [UR_TRADE_MSG_MON_CANT_BE_TRADED_2 - 1]        = gText_PkmnCantBeTradedNow,
    [UR_TRADE_MSG_PARTNERS_MON_CANT_BE_TRADED - 1] = gText_OtherTrainersPkmnCantBeTraded,
    [UR_TRADE_MSG_EGG_CANT_BE_TRADED -1]           = gText_EggCantBeTradedNow,
    [UR_TRADE_MSG_PARTNER_CANT_ACCEPT_MON - 1]     = gText_OtherTrainerCantAcceptPkmn,
    [UR_TRADE_MSG_CANT_TRADE_WITH_PARTNER_1 - 1]   = gText_CantTradeWithTrainer,
    [UR_TRADE_MSG_CANT_TRADE_WITH_PARTNER_2 - 1]   = gText_CantTradeWithTrainer,
};

static const u16 sTMHMMoves[] =
{
    MOVE_FOCUS_PUNCH,
    MOVE_DRAGON_CLAW,
    MOVE_WATER_PULSE,
    MOVE_CALM_MIND,
    MOVE_ROAR,
    MOVE_TOXIC,
    MOVE_HAIL,
    MOVE_BULK_UP,
    MOVE_BULLET_SEED,
    MOVE_HIDDEN_POWER,
    MOVE_SUNNY_DAY,
    MOVE_TAUNT,
    MOVE_ICE_BEAM,
    MOVE_BLIZZARD,
    MOVE_HYPER_BEAM,
    MOVE_LIGHT_SCREEN,
    MOVE_PROTECT,
    MOVE_RAIN_DANCE,
    MOVE_GIGA_DRAIN,
    MOVE_SAFEGUARD,
    MOVE_FRUSTRATION,
    MOVE_SOLAR_BEAM,
    MOVE_IRON_TAIL,
    MOVE_THUNDERBOLT,
    MOVE_THUNDER,
    MOVE_EARTHQUAKE,
    MOVE_RETURN,
    MOVE_DIG,
    MOVE_PSYCHIC,
    MOVE_SHADOW_BALL,
    MOVE_BRICK_BREAK,
    MOVE_DOUBLE_TEAM,
    MOVE_REFLECT,
    MOVE_SHOCK_WAVE,
    MOVE_FLAMETHROWER,
    MOVE_SLUDGE_BOMB,
    MOVE_SANDSTORM,
    MOVE_FIRE_BLAST,
    MOVE_ROCK_TOMB,
    MOVE_AERIAL_ACE,
    MOVE_TORMENT,
    MOVE_FACADE,
    MOVE_SECRET_POWER,
    MOVE_REST,
    MOVE_ATTRACT,
    MOVE_THIEF,
    MOVE_STEEL_WING,
    MOVE_SKILL_SWAP,
    MOVE_SNATCH,
    MOVE_OVERHEAT,
    MOVE_CUT,
    MOVE_FLY,
    MOVE_SURF,
    MOVE_STRENGTH,
    MOVE_FLASH,
    MOVE_ROCK_SMASH,
    MOVE_WATERFALL,
    MOVE_DIVE,
};
