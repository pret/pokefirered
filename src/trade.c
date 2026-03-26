#include "global.h"
#include "gflib.h"
#include "task.h"
#include "decompress.h"
#include "text_window.h"
#include "pokemon_icon.h"
#include "graphics.h"
#include "link.h"
#include "link_rfu.h"
#include "cable_club.h"
#include "data.h"
#include "strings.h"
#include "menu.h"
#include "overworld.h"
#include "battle_anim.h"
#include "party_menu.h"
#include "daycare.h"
#include "event_data.h"
#include "battle_interface.h"
#include "pokemon_summary_screen.h"
#include "pokemon_storage_system.h"
#include "new_menu_helpers.h"
#include "trade_scene.h"
#include "constants/songs.h"
#include "constants/moves.h"
#include "constants/trade.h"

// IDs for CallTradeMenuFunc
enum {
    CB_MAIN_MENU,
    CB_SELECTED_MON,
    CB_SHOW_MON_SUMMARY,
    CB_CONFIRM_TRADE_PROMPT,
    CB_CANCEL_TRADE_PROMPT,
    CB_READY_WAIT, // Equivalent to CB_IDLE
    CB_SET_SELECTED_MONS,
    CB_PRINT_IS_THIS_OKAY,
    CB_HANDLE_TRADE_CANCELED,
    CB_FADE_TO_START_TRADE,
    CB_WAIT_TO_START_TRADE,
    CB_INIT_EXIT_CANCELED_TRADE,
    CB_EXIT_CANCELED_TRADE,
    CB_START_LINK_TRADE,
    CB_INIT_CONFIRM_TRADE_PROMPT,
    CB_UNUSED_CLOSE_MSG,
    CB_WAIT_TO_START_RFU_TRADE,
    CB_IDLE = 100,
};

// Indexes for sActionTexts
enum {
    TEXT_CANCEL,
    TEXT_CHOOSE_MON,
    TEXT_SUMMARY,
    TEXT_TRADE,
    TEXT_CANCEL_TRADE,
    TEXT_PRESS_B_TO_EXIT,
};

// Indexes for sMessages
enum {
    MSG_STANDBY,
    MSG_CANCELED,
    MSG_ONLY_MON1,
    MSG_ONLY_MON2,
    MSG_WAITING_FOR_FRIEND,
    MSG_FRIEND_WANTS_TO_TRADE,
    MSG_MON_CANT_BE_TRADED,
    MSG_EGG_CANT_BE_TRADED,
    MSG_FRIENDS_MON_CANT_BE_TRADED,
};

// IDs for QueueAction
enum {
    QUEUE_SEND_DATA,
    QUEUE_STANDBY,
    QUEUE_ONLY_MON1,
    QUEUE_ONLY_MON2,
    QUEUE_UNUSED1, // Presumably intended for MSG_WAITING_FOR_FRIEND
    QUEUE_UNUSED2, // Presumably intended for MSG_FRIEND_WANTS_TO_TRADE
    QUEUE_MON_CANT_BE_TRADED,
    QUEUE_EGG_CANT_BE_TRADED,
    QUEUE_FRIENDS_MON_CANT_BE_TRADED,
};

#define QUEUE_DELAY_MSG   3
#define QUEUE_DELAY_DATA  5

#define GFXTAG_MENU_TEXT       200 // Used as a base tag in CB2_CreateTradeMenu and CB2_ReturnToTradeMenuFromSummary
#define GFXTAG_CURSOR          300
#define GFXTAG_LINK_MON_GLOW   5550
#define GFXTAG_LINK_MON_SHADOW 5552
#define GFXTAG_CABLE_END       5554
#define GFXTAG_GBA_SCREEN      5556
#define GFXTAG_POKEBALL        5557

#define PALTAG_CURSOR    2345
#define PALTAG_MENU_TEXT 4925
#define PALTAG_LINK_MON  5551
#define PALTAG_GBA       5555
#define PALTAG_POKEBALL  5558

// The following tags are offsets from GFXTAG_MENU_TEXT
// They're looped over in CB2_CreateTradeMenu and CB2_ReturnToTradeMenuFromSummary
// and used as indexes into sMenuTextTileBuffers
enum {
    GFXTAG_PLAYER_NAME_L,
    GFXTAG_PLAYER_NAME_M,
    GFXTAG_PLAYER_NAME_R,
    GFXTAG_PARTNER_NAME_L,
    GFXTAG_PARTNER_NAME_M,
    GFXTAG_PARTNER_NAME_R,
    GFXTAG_CANCEL_L,
    GFXTAG_CANCEL_R,
    GFXTAG_CHOOSE_PKMN_L,
    GFXTAG_CHOOSE_PKMN_M,
    GFXTAG_CHOOSE_PKMN_R,
    GFXTAG_CHOOSE_PKMN_EMPTY_1, // 6 sprites to cover the full bottom bar, but only first 3 are needed
    GFXTAG_CHOOSE_PKMN_EMPTY_2,
    GFXTAG_CHOOSE_PKMN_EMPTY_3,
    NUM_MENU_TEXT_SPRITES
};
#define NUM_PLAYER_NAME_SPRITES (1 + GFXTAG_PLAYER_NAME_R - GFXTAG_PLAYER_NAME_L)
#define NUM_PARTNER_NAME_SPRITES (1 + GFXTAG_PARTNER_NAME_R - GFXTAG_PARTNER_NAME_L)
#define NUM_CHOOSE_PKMN_SPRITES (1 + GFXTAG_CHOOSE_PKMN_EMPTY_3 - GFXTAG_CHOOSE_PKMN_L)

enum {
    CURSOR_ANIM_NORMAL,
    CURSOR_ANIM_ON_CANCEL,
};

// Values for signaling to/from the link partner
enum {
    STATUS_NONE,
    STATUS_READY,
    STATUS_CANCEL,
};

// Checked to confirm DrawSelectedMonScreen has reached final state
#define DRAW_SELECTED_FINISH 5

static EWRAM_DATA u8 *sMenuTextTileBuffer = NULL;
static EWRAM_DATA u8 *sMenuTextTileBuffers[NUM_MENU_TEXT_SPRITES] = {};
EWRAM_DATA struct Mail gLinkPartnerMail[PARTY_SIZE] = {};
EWRAM_DATA u8 gSelectedTradeMonPositions[2] = {0};
static EWRAM_DATA struct {
    u8 bg2hofs;
    u8 bg3hofs;
    u8 filler_2[38];
    u8 partySpriteIds[2][PARTY_SIZE];
    u8 cursorSpriteId;
    u8 cursorPosition;
    u8 partyCounts[2];
    bool8 optionsActive[PARTY_SIZE * 2 + 1];
    bool8 isLiveMon[2][PARTY_SIZE];
    bool8 isEgg[2][PARTY_SIZE];
    u8 hpBarLevels[2][PARTY_SIZE];
    u8 bufferPartyState;
    u8 filler_6A[5];
    u8 callbackId;
    u8 unk_70; // Never read
    u16 bottomTextTileStart;
    u8 drawSelectedMonState[2];
    u8 selectedMonIdx[2];
    u8 playerSelectStatus;
    u8 partnerSelectStatus;
    u8 playerConfirmStatus;
    u8 partnerConfirmStatus;
    u8 filler_7C[2];
    u8 partnerCursorPosition;
    u16 linkData[20];
    u8 timer;
    u8 giftRibbons[GIFT_RIBBONS_COUNT];
    u8 filler_B4[0x81C];
    struct {
        bool8 active;
        u16 delay;
        u8 actionId;
    } queuedActions[4];
    u16 tilemapBuffer[BG_SCREEN_SIZE / 2];
} * sTradeMenu = NULL;

static void CB2_CreateTradeMenu(void);
static void VBlankCB_TradeMenu(void);
static void CB2_TradeMenu(void);
static void LoadTradeBgGfx(u8 state);
static void SetActiveMenuOptions(void);
static u8 BufferTradeParties(void);
static void CB1_UpdateLink(void);
static void RunTradeMenuCallback(void);
static void SetSelectedMon(u8 cursorPosition);
static void DrawSelectedMonScreen(u8 side);
static u8 GetMonNicknameWidth(u8 *str, u8 whichParty, u8 partyIdx);
static void BufferMovesString(u8 *str, u8 whichParty, u8 partyIdx);
static void PrintPartyNicknames(u8 side);
static void PrintLevelAndGender(u8 whichParty, u8 monIdx, u8 x, u8 y, u8 winLeft, u8 winTop);
static void PrintPartyLevelsAndGenders(u8 side);
static void PrintTradePartnerPartyNicknames(void);
static void RedrawPartyWindow(u8 whichParty);
static void Task_DrawSelectionSummary(u8 taskId);
static void Task_DrawSelectionTrade(u8 taskId);
static void QueueAction(u16 delay, u8 actionId);
static void DoQueuedActions(void);
static void PrintTradeMessage(u8 strIdx);
static bool8 LoadUISpriteGfx(void);
static void DrawBottomRowText(const u8 *name, u8 *dest, u8 unused);
static void ComputePartyTradeableFlags(u8 side);
static void ComputePartyHPBarLevels(u8 side);
static void SetTradePartyHPBarSprites(void);
static void SaveTradeGiftRibbons(void);
static u32 CanTradeSelectedMon(struct Pokemon * party, int partyCount, int cursorPos);

static const size_t sSizesAndOffsets[] = {
    sizeof(struct SaveBlock2),
    sizeof(struct SaveBlock1),
    sizeof(struct MapLayout),
    0x530, // unk
    0x34, // unk
    sizeof(struct Mail),
    sizeof(struct Pokemon),
    0x528 // unk
};

static const u16 sTradeMovesBoxTilemap[] = INCBIN_U16("graphics/trade/moves_box_map.bin");
static const u16 sTradePartyBoxTilemap[] = INCBIN_U16("graphics/trade/party_box_map.bin");
static const u8 sTradeStripesBG2Tilemap[] = INCBIN_U8("graphics/trade/stripes_bg2_map.bin");
static const u8 sTradeStripesBG3Tilemap[] = INCBIN_U8("graphics/trade/stripes_bg3_map.bin");

static const struct OamData sOamData_MenuText = {
    .shape = SPRITE_SHAPE(32x16),
    .size = SPRITE_SIZE(32x16),
    .priority = 1
};

static const struct OamData sOamData_Cursor = {
    .shape = SPRITE_SHAPE(64x32),
    .size = SPRITE_SIZE(64x32),
    .priority = 1
};

static const union AnimCmd sAnim_Cursor_Normal[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnim_Cursor_OnCancel[] = {
    ANIMCMD_FRAME(32, 5),
    ANIMCMD_END
};

static const union AnimCmd *const sAnims_Cursor[] = {
    [CURSOR_ANIM_NORMAL]    = sAnim_Cursor_Normal,
    [CURSOR_ANIM_ON_CANCEL] = sAnim_Cursor_OnCancel
};

static const struct SpriteSheet sCursor_SpriteSheet = {
    .data = gTradeCursor_Gfx,
    .size = 0x800,
    .tag = GFXTAG_CURSOR
};

static const struct SpritePalette sCursor_SpritePalette = {
    .data = gTradeCursor_Pal,
    .tag = PALTAG_CURSOR
};


static const union AnimCmd sAnim_MenuText_0[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnim_MenuText_1[] = {
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnim_MenuText_2[] = {
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnim_MenuText_3[] = {
    ANIMCMD_FRAME(24, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnim_MenuText_4[] = {
    ANIMCMD_FRAME(32, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnim_MenuText_5[] = {
    ANIMCMD_FRAME(40, 5),
    ANIMCMD_END
};

// These anims are not used
static const union AnimCmd *const sAnims_MenuText[] = {
    sAnim_MenuText_0,
    sAnim_MenuText_1,
    sAnim_MenuText_2,
    sAnim_MenuText_3,
    sAnim_MenuText_4,
    sAnim_MenuText_5,
};

static const struct SpriteTemplate sSpriteTemplate_Cursor = {
    .tileTag = GFXTAG_CURSOR,
    .paletteTag = PALTAG_CURSOR,
    .oam = &sOamData_Cursor,
    .anims = sAnims_Cursor,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct SpriteTemplate sSpriteTemplate_MenuText = {
    .tileTag = GFXTAG_MENU_TEXT,
    .paletteTag = PALTAG_MENU_TEXT,
    .oam = &sOamData_MenuText,
    .anims = sAnims_MenuText,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const u16 sMenuText_Pal[] = INCBIN_U16("graphics/trade/text.gbapal");
static const struct SpritePalette sSpritePalette_MenuText = {
    .data = sMenuText_Pal,
    .tag = PALTAG_MENU_TEXT
};

#define DIR_UP    0
#define DIR_DOWN  1
#define DIR_LEFT  2
#define DIR_RIGHT 3

// This is used to determine the next mon to select when the D-Pad is
// pressed in a given direction.
// Note that the mons are laid out like this.
// 0-5 are the player's party and 6-11 are the trading partner's party.
// 12 is the cancel button.
//  0  1  6  7
//  2  3  8  9
//  4  5 10 11
//          12
// 1st array is the current positions
// 2nd array is directions of input
// 3rd array is the next positions to go to (unoccupied spaces are skipped over)
static const u8 sCursorMoveDestinations[(PARTY_SIZE * 2) + 1][4][PARTY_SIZE] = {
    // Player's party
    [0] = {
        [DIR_UP]    = { 4,  2, 12, 12,  0,  0},
        [DIR_DOWN]  = { 2,  4, 12, 12,  0,  0},
        [DIR_LEFT]  = { 7,  6,  1,  0,  0,  0},
        [DIR_RIGHT] = { 1,  6,  7,  0,  0,  0}
    },
    [1] = {
        [DIR_UP]    = { 5,  3, 12, 12,  0,  0},
        [DIR_DOWN]  = { 3,  5, 12, 12,  0,  0},
        [DIR_LEFT]  = { 0,  7,  6,  1,  0,  0},
        [DIR_RIGHT] = { 6,  7,  0,  1,  0,  0}
    },
    [2] = {
        [DIR_UP]    = { 0,  0,  0,  0,  0,  0},
        [DIR_DOWN]  = { 4,  0,  0,  0,  0,  0},
        [DIR_LEFT]  = { 9,  8,  7,  6,  0,  0},
        [DIR_RIGHT] = { 3,  1,  0,  0,  0,  0}
    },
    [3] = {
        [DIR_UP]    = { 1,  1,  1,  1,  0,  0},
        [DIR_DOWN]  = { 5,  1,  1,  1,  0,  0},
        [DIR_LEFT]  = { 2,  9,  8,  7,  0,  0},
        [DIR_RIGHT] = { 8,  9,  6,  6,  0,  0}
    },
    [4] = {
        [DIR_UP]    = { 2,  2,  2,  2,  0,  0},
        [DIR_DOWN]  = { 0,  0,  0,  0,  0,  0},
        [DIR_LEFT]  = {11, 10,  9,  8,  7,  6},
        [DIR_RIGHT] = { 5,  3,  1,  0,  0,  0}
    },
    [5] = {
        [DIR_UP]    = { 3,  3,  3,  3,  0,  0},
        [DIR_DOWN]  = { 1,  1,  1,  1,  0,  0},
        [DIR_LEFT]  = { 4,  4,  4,  4,  0,  0},
        [DIR_RIGHT] = {10,  8,  6,  0,  0,  0}
    },
    // Partner's party
    [6] = {
        [DIR_UP]    = {10,  8, 12,  0,  0,  0},
        [DIR_DOWN]  = { 8, 10, 12,  0,  0,  0},
        [DIR_LEFT]  = { 1,  0,  0,  0,  0,  0},
        [DIR_RIGHT] = { 7,  0,  1,  0,  0,  0}
    },
    [7] = {
        [DIR_UP]    = {12,  0,  0,  0,  0,  0},
        [DIR_DOWN]  = { 9, 12,  0,  0,  0,  0},
        [DIR_LEFT]  = { 6,  0,  0,  0,  0,  0},
        [DIR_RIGHT] = { 0,  0,  0,  0,  0,  0}
    },
    [8] = {
        [DIR_UP]    = { 6,  0,  0,  0,  0,  0},
        [DIR_DOWN]  = {10,  6,  0,  0,  0,  0},
        [DIR_LEFT]  = { 3,  2,  1,  0,  0,  0},
        [DIR_RIGHT] = { 9,  7,  0,  0,  0,  0}
    },
    [9] = {
        [DIR_UP]    = { 7,  0,  0,  0,  0,  0},
        [DIR_DOWN]  = {11, 12,  0,  0,  0,  0},
        [DIR_LEFT]  = { 8,  0,  0,  0,  0,  0},
        [DIR_RIGHT] = { 2,  1,  0,  0,  0,  0}
    },
    [10] = {
        [DIR_UP]    = { 8,  0,  0,  0,  0,  0},
        [DIR_DOWN]  = { 6,  0,  0,  0,  0,  0},
        [DIR_LEFT]  = { 5,  4,  3,  2,  1,  0},
        [DIR_RIGHT] = {11,  9,  7,  0,  0,  0}
    },
    [11] = {
        [DIR_UP]    = { 9,  0,  0,  0,  0,  0},
        [DIR_DOWN]  = {12,  0,  0,  0,  0,  0},
        [DIR_LEFT]  = {10,  0,  0,  0,  0,  0},
        [DIR_RIGHT] = { 4,  2,  0,  0,  0,  0}
    },
    // Cancel
    [12] = {
        [DIR_UP]    = {11,  9,  7,  6,  0,  0},
        [DIR_DOWN]  = { 7,  6,  0,  0,  0,  0},
        [DIR_LEFT]  = {12,  0,  0,  0,  0,  0},
        [DIR_RIGHT] = {12,  0,  0,  0,  0,  0}
    }
};

#define COL0_X 1
#define COL1_X 8
#define COL2_X 16
#define COL3_X 23
#define ROW0_Y 5
#define ROW1_Y 10
#define ROW2_Y 15
#define ROW3_Y 18

static const u8 sTradeMonSpriteCoords[(PARTY_SIZE * 2) + 1][2] = {
    [TRADE_PLAYER] =
        {COL0_X, ROW0_Y},
        {COL1_X, ROW0_Y},
        {COL0_X, ROW1_Y},
        {COL1_X, ROW1_Y},
        {COL0_X, ROW2_Y},
        {COL1_X, ROW2_Y},
    [TRADE_PARTNER * PARTY_SIZE] =
        {COL2_X, ROW0_Y},
        {COL3_X, ROW0_Y},
        {COL2_X, ROW1_Y},
        {COL3_X, ROW1_Y},
        {COL2_X, ROW2_Y},
        {COL3_X, ROW2_Y},
    // Cancel
    {COL3_X, ROW3_Y},
};

static const u8 sTradeMonLevelCoords[PARTY_SIZE * 2][2] = {
    [TRADE_PLAYER] =
        { 5,  4},
        {12,  4},
        { 5,  9},
        {12,  9},
        { 5, 14},
        {12, 14},
    [TRADE_PARTNER * PARTY_SIZE] =
        {20,  4},
        {27,  4},
        {20,  9},
        {27,  9},
        {20, 14},
        {27, 14},
};

static const u8 sTradeMonBoxCoords[PARTY_SIZE * 2][2] = {
    [TRADE_PLAYER] =
        { 1,  3},
        { 8,  3},
        { 1,  8},
        { 8,  8},
        { 1, 13},
        { 8, 13},
    [TRADE_PARTNER * PARTY_SIZE] =
        {16,  3},
        {23,  3},
        {16,  8},
        {23,  8},
        {16, 13},
        {23, 13},
};

// x,y offset for player name, x/y offset for partner name
static const u8 sPlayerNameCoords[][4] = {
    {60, 9, 180, 9}, // Unused. For JP characters?
    {48, 9, 168, 9},
};

static const u8 sUnusedCoords[][2] =
{
    { 0, 14},
    {15, 29},
    { 3,  5},
    { 3,  7},
    {18,  5},
    {18,  7},
    { 8,  7},
    {22, 12},
    { 8,  7},
    {22, 12},
    { 6,  7},
    {24, 12},
    { 6,  7},
    {24, 12},
    { 8,  7},
    {22, 12},
    { 7,  7},
    {23, 12}
};

static const u8 sText_Dummy[] = _("");
static const u8 sText_ClrWhtHltTranspShdwDrkGry[] = _("{COLOR WHITE}{HIGHLIGHT TRANSPARENT}{SHADOW DARK_GRAY}");
const u8 gText_MaleSymbol4[] = _("♂");
const u8 gText_FemaleSymbol4[] = _("♀");
const u8 gText_GenderlessSymbol[] = _("");
static const u8 sText_Dummy2[] = _("");
static const u8 sText_Newline[] = _("\n");
static const u8 sText_Slash[] = _("/");

static const u8 *const sActionTexts[] = {
    [TEXT_CANCEL]          = gTradeText_Cancel,
    [TEXT_CHOOSE_MON]      = gTradeText_ChooseAPokemon,
    [TEXT_SUMMARY]         = gTradeText_Summary, // Unused, sMenuAction_SummaryTrade is used instead
    [TEXT_TRADE]           = gTradeText_Trade,   // Unused, sMenuAction_SummaryTrade is used instead
    [TEXT_CANCEL_TRADE]    = gText_CancelTrade,
    [TEXT_PRESS_B_TO_EXIT] = gTradeText_PressBButtonToExit // Unused
};

static const struct MenuAction sMenuAction_SummaryTrade[] = {
    {gText_TradeAction_Summary, { .void_u8 = Task_DrawSelectionSummary }},
    {gText_TradeAction_Trade, { .void_u8 = Task_DrawSelectionTrade }}
};

static const u8 *const sMessages[] = {
    [MSG_STANDBY]                    = gText_Trade_CommunicationStandby,
    [MSG_CANCELED]                   = gText_TradeHasBeenCanceled,
    [MSG_ONLY_MON1]                  = gText_Trade_OnlyPkmnForBattle,
    [MSG_ONLY_MON2]                  = gText_OnlyPkmnForBattle, // Same as above but without color formatting
    [MSG_WAITING_FOR_FRIEND]         = gText_WaitingForFriendToFinish,
    [MSG_FRIEND_WANTS_TO_TRADE]      = gText_FriendWantsToTrade,
    [MSG_MON_CANT_BE_TRADED]         = gText_PkmnCantBeTradedNow, 
    [MSG_EGG_CANT_BE_TRADED]         = gText_EggCantBeTradedNow,
    [MSG_FRIENDS_MON_CANT_BE_TRADED] = gText_OtherTrainersPkmnCantBeTraded
};

static const u8 sTextColor_PartyMonNickname[] = { TEXT_COLOR_TRANSPARENT, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GRAY };

static const struct BgTemplate sBgTemplates[] = {
    {
        .bg = 0,
        .charBaseIndex = 2,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }, {
        .bg = 1,
        .charBaseIndex = 0,
        .mapBaseIndex = 5,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x000
    }, {
        .bg = 2,
        .charBaseIndex = 0,
        .mapBaseIndex = 6,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x000
    }, {
        .bg = 3,
        .charBaseIndex = 0,
        .mapBaseIndex = 7,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x000
    }
};

static const struct WindowTemplate sWindowTemplates[] = {
    {
        .bg = 0,
        .tilemapLeft = 4,
        .tilemapTop = 7,
        .width = 22,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x01e
    }, {
        .bg = 0,
        .tilemapLeft = 17,
        .tilemapTop = 15,
        .width = 12,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x076
    }, {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 5,
        .width = 8,
        .height = 2,
        .paletteNum = 13,
        .baseBlock = 0x0a6
    }, {
        .bg = 0,
        .tilemapLeft = 7,
        .tilemapTop = 5,
        .width = 8,
        .height = 2,
        .paletteNum = 13,
        .baseBlock = 0x0b6
    }, {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 10,
        .width = 8,
        .height = 2,
        .paletteNum = 13,
        .baseBlock = 0x0c6
    }, {
        .bg = 0,
        .tilemapLeft = 7,
        .tilemapTop = 10,
        .width = 8,
        .height = 2,
        .paletteNum = 13,
        .baseBlock = 0x0d6
    }, {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 15,
        .width = 8,
        .height = 2,
        .paletteNum = 13,
        .baseBlock = 0x0e6
    }, {
        .bg = 0,
        .tilemapLeft = 7,
        .tilemapTop = 15,
        .width = 8,
        .height = 2,
        .paletteNum = 13,
        .baseBlock = 0x0f6
    }, {
        .bg = 0,
        .tilemapLeft = 15,
        .tilemapTop = 5,
        .width = 8,
        .height = 2,
        .paletteNum = 13,
        .baseBlock = 0x106
    }, {
        .bg = 0,
        .tilemapLeft = 22,
        .tilemapTop = 5,
        .width = 8,
        .height = 2,
        .paletteNum = 13,
        .baseBlock = 0x116
    }, {
        .bg = 0,
        .tilemapLeft = 15,
        .tilemapTop = 10,
        .width = 8,
        .height = 2,
        .paletteNum = 13,
        .baseBlock = 0x126
    }, {
        .bg = 0,
        .tilemapLeft = 22,
        .tilemapTop = 10,
        .width = 8,
        .height = 2,
        .paletteNum = 13,
        .baseBlock = 0x136
    }, {
        .bg = 0,
        .tilemapLeft = 15,
        .tilemapTop = 15,
        .width = 8,
        .height = 2,
        .paletteNum = 13,
        .baseBlock = 0x146
    }, {
        .bg = 0,
        .tilemapLeft = 22,
        .tilemapTop = 15,
        .width = 8,
        .height = 2,
        .paletteNum = 13,
        .baseBlock = 0x156
    }, {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 5,
        .width = 14,
        .height = 2,
        .paletteNum = 13,
        .baseBlock = 0x166
    }, {
        .bg = 0,
        .tilemapLeft = 3,
        .tilemapTop = 8,
        .width = 11,
        .height = 8,
        .paletteNum = 15,
        .baseBlock = 0x182
    }, {
        .bg = 0,
        .tilemapLeft = 17,
        .tilemapTop = 5,
        .width = 14,
        .height = 2,
        .paletteNum = 15,
        .baseBlock = 0x1da
    }, {
        .bg = 0,
        .tilemapLeft = 18,
        .tilemapTop = 8,
        .width = 11,
        .height = 8,
        .paletteNum = 15,
        .baseBlock = 0x1f6
    }, DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sWindowTemplate_YesNo = {
    .bg = 0,
    .tilemapLeft = 21,
    .tilemapTop = 13,
    .width = 6,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x24e
};

static const u8 sDebug_Messages[][13] = {
    _("かいめの そうしん"), // "xth communication sent"
    _("かいめの じゅしん"), // "xth communication received"
    _("ポケモンアイコンセット"), // "pokemon icon set"
    _("OBJテキストセット"), // "OBJ text set"
    _("セルセット"), // "cell set"
    _("OBJテキストADD"), // "OBJ text ADD"
    _("システムメッセージADD"), // "system message ADD"
    _("はいけいセット"), // "background set"
};

static const u8 sText_ShedinjaJP[] = _("ヌケニン");

static const u8 sDebug_TradeResultTexts[][14] = {
    _("こうかんせいりつ     "), // "trade successful"
    _("だめだたらしいよ     "), // "it seems like it didn't work"
};

// Position of level/gender when just the pokemon to trade are displayed
static const u8 sSelectedMonLevelGenderCoords[][2] = {
    [TRADE_PLAYER]  = { 4,  3},
    [TRADE_PARTNER] = {19,  3}
};

static void InitTradeMenu(void)
{
    static u16 dummy;

    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
    ResetPaletteFade();

    gPaletteFade.bufferTransferDisabled = TRUE;

    SetVBlankCallback(VBlankCB_TradeMenu);
    LoadPalette(gStandardMenuPalette, BG_PLTT_ID(15), PLTT_SIZEOF(10));
    LoadPalette(gStandardMenuPalette, BG_PLTT_ID(13), PLTT_SIZEOF(10));
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, sBgTemplates, ARRAY_COUNT(sBgTemplates));
    SetBgTilemapBuffer(1, sTradeMenu->tilemapBuffer);

    if (InitWindows(sWindowTemplates))
    {
        int i;
        DeactivateAllTextPrinters();
        dummy = 590; // ?
        for (i = 0; i < ARRAY_COUNT(sWindowTemplates) - 1; i++)
        {
            ClearWindowTilemap(i);
            FillWindowPixelBuffer(i, PIXEL_FILL(0));
        }
        FillBgTilemapBufferRect(0, 0, 0, 0, 30, 20, 15);
        LoadStdWindowGfx(0, 0x014, BG_PLTT_ID(12));
        LoadUserWindowGfx(2, 0x001, BG_PLTT_ID(14));
        LoadMonIconPalettes();
        sTradeMenu->bufferPartyState = 0;
        sTradeMenu->callbackId = CB_MAIN_MENU;
        sTradeMenu->unk_70 = 0;
        sTradeMenu->drawSelectedMonState[TRADE_PLAYER] = 0;
        sTradeMenu->drawSelectedMonState[TRADE_PARTNER] = 0;
        sTradeMenu->playerConfirmStatus = STATUS_NONE;
        sTradeMenu->partnerConfirmStatus = STATUS_NONE;
        sTradeMenu->timer = 0;
    }
}

void CB2_StartCreateTradeMenu(void)
{
    SetMainCallback2(CB2_CreateTradeMenu);
}

static void CB2_CreateTradeMenu(void)
{
    int i;
    struct SpriteTemplate temp;
    u8 id;
    s32 width;
    u32 xPos;
    u8 *name;

    switch (gMain.state)
    {
    case 0:
        sTradeMenu = AllocZeroed(sizeof(*sTradeMenu));
        InitTradeMenu();
        sMenuTextTileBuffer = AllocZeroed(NUM_MENU_TEXT_SPRITES * 256);

        for (i = 0; i < NUM_MENU_TEXT_SPRITES; i++)
            sMenuTextTileBuffers[i] = &sMenuTextTileBuffer[i * 256];

        gMain.state++;
        break;
    case 1:
        gPaletteFade.bufferTransferDisabled = FALSE;

        for (i = 0; i < PARTY_SIZE; i++)
            CreateMon(&gEnemyParty[i], SPECIES_NONE, 0, USE_RANDOM_IVS, FALSE, 0, OT_ID_PLAYER_ID, 0);

        PrintTradeMessage(MSG_STANDBY);
        ShowBg(0);

        if (!gReceivedRemoteLinkPlayers)
        {
            gLinkType = LINKTYPE_TRADE_CONNECTING;
            sTradeMenu->timer = 0;

            if (gWirelessCommType)
            {
                SetWirelessCommType1();
                OpenLink();
                CreateTask_RfuIdle();
            }
            else
            {
                OpenLink();
                gMain.state++;
            }
            if (gWirelessCommType == 0)
                CreateTask(Task_WaitForLinkPlayerConnection, 1);
        }
        else
        {
            gMain.state = 4;
        }
        break;
    case 2:
        sTradeMenu->timer++;
        if (sTradeMenu->timer > 11)
        {
            sTradeMenu->timer = 0;
            gMain.state++;
        }
        break;
    case 3:
        if (GetLinkPlayerCount_2() >= GetSavedPlayerCount())
        {
            if (IsLinkMaster())
            {
                if (++sTradeMenu->timer > 30)
                {
                    CheckShouldAdvanceLinkState();
                    gMain.state++;
                }
            }
            else
            {
                gMain.state++;
            }
        }
        break;
    case 4:
        if (gReceivedRemoteLinkPlayers == TRUE && IsLinkPlayerDataExchangeComplete() == TRUE)
        {
            DestroyTask_RfuIdle();
            CalculatePlayerPartyCount();
            gMain.state++;
            sTradeMenu->timer = 0;
            if (gWirelessCommType)
            {
                Rfu_SetLinkRecovery(TRUE);
                SetLinkStandbyCallback();
            }
        }
        break;
    case 5:
        if (gWirelessCommType)
        {
            if (IsLinkRfuTaskFinished())
            {
                gMain.state++;
                LoadWirelessStatusIndicatorSpriteGfx();
                CreateWirelessStatusIndicatorSprite(0, 0);
            }
        }
        else
        {
            gMain.state++;
        }
        break;
    case 6:
        if (BufferTradeParties())
        {
            SaveTradeGiftRibbons();
            gMain.state++;
        }
        break;
    case 7:
        CalculateEnemyPartyCount();
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        sTradeMenu->partyCounts[TRADE_PLAYER] = gPlayerPartyCount;
        sTradeMenu->partyCounts[TRADE_PARTNER] = gEnemyPartyCount;

        for (i = 0; i < sTradeMenu->partyCounts[TRADE_PLAYER]; i++)
        {
            struct Pokemon * mon = &gPlayerParty[i];
            sTradeMenu->partySpriteIds[TRADE_PLAYER][i] = CreateMonIcon(GetMonData(mon, MON_DATA_SPECIES_OR_EGG),
                                                                SpriteCB_MonIcon,
                                                                (sTradeMonSpriteCoords[i][0] * 8) + 14,
                                                                (sTradeMonSpriteCoords[i][1] * 8) - 12,
                                                                1,
                                                                GetMonData(mon, MON_DATA_PERSONALITY),
                                                                TRUE);
        }

        for (i = 0; i < sTradeMenu->partyCounts[TRADE_PARTNER]; i++)
        {
            struct Pokemon * mon = &gEnemyParty[i];
            sTradeMenu->partySpriteIds[TRADE_PARTNER][i] = CreateMonIcon(GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL),
                                                                SpriteCB_MonIcon,
                                                                (sTradeMonSpriteCoords[i + PARTY_SIZE][0] * 8) + 14,
                                                                (sTradeMonSpriteCoords[i + PARTY_SIZE][1] * 8) - 12,
                                                                1,
                                                                GetMonData(mon, MON_DATA_PERSONALITY),
                                                                FALSE);
        }
        gMain.state++;
        break;
    case 8:
        LoadHeldItemIcons();
        DrawHeldItemIconsForTrade(sTradeMenu->partyCounts, sTradeMenu->partySpriteIds[0], TRADE_PLAYER);
        gMain.state++;
        break;
    case 9:
        DrawHeldItemIconsForTrade(sTradeMenu->partyCounts, sTradeMenu->partySpriteIds[0], TRADE_PARTNER);
        gMain.state++;
        break;
    case 10:
        DrawTextWindowAndBufferTiles(gSaveBlock2Ptr->playerName, sMenuTextTileBuffers[GFXTAG_PLAYER_NAME_L], 0, 0, gDecompressionBuffer, 3);
        id = GetMultiplayerId();
        DrawTextWindowAndBufferTiles(gLinkPlayers[id ^ 1].name, sMenuTextTileBuffers[GFXTAG_PARTNER_NAME_L], 0, 0, gDecompressionBuffer, 3);
        DrawTextWindowAndBufferTiles(sActionTexts[TEXT_CANCEL], sMenuTextTileBuffers[GFXTAG_CANCEL_L], 0, 0, gDecompressionBuffer, 2);
        DrawBottomRowText(sActionTexts[TEXT_CHOOSE_MON], sMenuTextTileBuffers[GFXTAG_CHOOSE_PKMN_L], 24);
        gMain.state++;
        sTradeMenu->timer = 0;
        break;
    case 11:
        if (LoadUISpriteGfx())
            gMain.state++;
        break;
    case 12:
        // Create player's name text sprites
        name = gSaveBlock2Ptr->playerName;
        width = GetStringWidth(FONT_NORMAL_COPY_1, name, 0);
        xPos = (56 - width) / 2;
        for (i = 0; i < NUM_PLAYER_NAME_SPRITES; i++)
        {
            temp = sSpriteTemplate_MenuText;
            temp.tileTag += i + GFXTAG_PLAYER_NAME_L;
            CreateSprite(&temp, xPos + sPlayerNameCoords[1][0] + (i * 32), sPlayerNameCoords[1][1], 1);
        }

        // Create partner's name text sprites
        id = GetMultiplayerId();
        name = gLinkPlayers[id ^ 1].name;
        width = GetStringWidth(FONT_NORMAL_COPY_1, name, 0);
        xPos = (56 - width) / 2;
        for (i = 0; i < NUM_PARTNER_NAME_SPRITES; i++)
        {
            temp = sSpriteTemplate_MenuText;
            temp.tileTag += i + GFXTAG_PARTNER_NAME_L;
            CreateSprite(&temp, xPos + sPlayerNameCoords[1][2] + (i * 32), sPlayerNameCoords[1][3], 1);
        }
        gMain.state++;
        break;
    case 13:
        // Create Cancel text sprites
        temp = sSpriteTemplate_MenuText;
        temp.tileTag += GFXTAG_CANCEL_L;
        CreateSprite(&temp, 215, 151, 1);
        temp = sSpriteTemplate_MenuText;
        temp.tileTag += GFXTAG_CANCEL_R;
        CreateSprite(&temp, 215 + 32, 151, 1);

        // Create Choose a Pokémon text sprites (only 3 are needed, other 3 are empty)
        for (i = 0; i < NUM_CHOOSE_PKMN_SPRITES; i++)
        {
            temp = sSpriteTemplate_MenuText;
            temp.tileTag += i + GFXTAG_CHOOSE_PKMN_L;
            CreateSprite(&temp, (i * 32) + 24, 150, 1);
        }

        sTradeMenu->cursorSpriteId = CreateSprite(&sSpriteTemplate_Cursor, sTradeMonSpriteCoords[0][0] * 8 + 32, sTradeMonSpriteCoords[0][1] * 8, 2);
        sTradeMenu->cursorPosition = 0;
        gMain.state++;
        rbox_fill_rectangle(0);
        break;
    case 14:
        ComputePartyTradeableFlags(TRADE_PLAYER);
        PrintPartyNicknames(TRADE_PLAYER);
        sTradeMenu->bg2hofs = 0;
        sTradeMenu->bg3hofs = 0;
        SetActiveMenuOptions();
        gMain.state++;
        PlayBGM(MUS_GAME_CORNER);
        break;
    case 15:
        ComputePartyTradeableFlags(TRADE_PARTNER);
        PrintPartyNicknames(TRADE_PARTNER);
        gMain.state++;
        // fallthrough
    case 16:
        LoadTradeBgGfx(0);
        gMain.state++;
        break;
    case 17:
        LoadTradeBgGfx(1);
        gMain.state++;
        break;
    case 18:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        gMain.state++;
        break;
    case 19:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
        LoadTradeBgGfx(2);
        gMain.state++;
        break;
    case 20:
        ComputePartyHPBarLevels(TRADE_PLAYER);
        gMain.state++;
        break;
    case 21:
        ComputePartyHPBarLevels(TRADE_PARTNER);
        SetTradePartyHPBarSprites();
        gMain.state++;
        break;
    case 22:
        if (!gPaletteFade.active)
        {
            gMain.callback1 = CB1_UpdateLink;
            SetMainCallback2(CB2_TradeMenu);
        }
        break;
    }

    RunTextPrinters();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void CB2_ReturnToTradeMenuFromSummary(void)
{
    int i;
    struct SpriteTemplate temp;
    u8 id;
    s32 width;
    u32 xPos;
    u8 *name;

    switch (gMain.state)
    {
    case 0:
        InitTradeMenu();
        gMain.state++;
        break;
    case 1:
        gMain.state++;
        sTradeMenu->timer = 0;
        break;
    case 2:
        gMain.state++;
        break;
    case 3:
        gMain.state++;
        break;
    case 4:
        CalculatePlayerPartyCount();
        gMain.state++;
        break;
    case 5:
        if (gWirelessCommType != 0)
        {
            LoadWirelessStatusIndicatorSpriteGfx();
            CreateWirelessStatusIndicatorSprite(0, 0);
        }
        gMain.state++;
        break;
    case 6:
        gMain.state++;
        break;
    case 7:
        CalculateEnemyPartyCount();
        sTradeMenu->partyCounts[TRADE_PLAYER] = gPlayerPartyCount;
        sTradeMenu->partyCounts[TRADE_PARTNER] = gEnemyPartyCount;
        ClearWindowTilemap(0);
        PrintPartyNicknames(TRADE_PLAYER);
        PrintPartyNicknames(TRADE_PARTNER);
        for (i = 0; i < sTradeMenu->partyCounts[TRADE_PLAYER]; i++)
        {
            sTradeMenu->partySpriteIds[TRADE_PLAYER][i] = CreateMonIcon(
                GetMonData(&gPlayerParty[i], MON_DATA_SPECIES_OR_EGG, NULL),
                SpriteCB_MonIcon,
                sTradeMonSpriteCoords[i][0] * 8 + 14,
                sTradeMonSpriteCoords[i][1] * 8 - 12,
                1,
                GetMonData(&gPlayerParty[i], MON_DATA_PERSONALITY),
                TRUE
            );
        }
        for (i = 0; i < sTradeMenu->partyCounts[TRADE_PARTNER]; i++)
        {
            sTradeMenu->partySpriteIds[TRADE_PARTNER][i] = CreateMonIcon(
                GetMonData(&gEnemyParty[i], MON_DATA_SPECIES_OR_EGG, NULL),
                SpriteCB_MonIcon,
                sTradeMonSpriteCoords[i + PARTY_SIZE][0] * 8 + 14,
                sTradeMonSpriteCoords[i + PARTY_SIZE][1] * 8 - 12,
                1,
                GetMonData(&gEnemyParty[i], MON_DATA_PERSONALITY),
                FALSE
            );
        }
        gMain.state++;
        break;
    case 8:
        LoadHeldItemIcons();
        DrawHeldItemIconsForTrade(sTradeMenu->partyCounts, sTradeMenu->partySpriteIds[0], TRADE_PLAYER);
        gMain.state++;
        break;
    case 9:
        DrawHeldItemIconsForTrade(sTradeMenu->partyCounts, sTradeMenu->partySpriteIds[0], TRADE_PARTNER);
        gMain.state++;
        break;
    case 10:
        DrawTextWindowAndBufferTiles(gSaveBlock2Ptr->playerName, sMenuTextTileBuffers[GFXTAG_PLAYER_NAME_L], 0, 0, gDecompressionBuffer, 3);
        id = GetMultiplayerId();
        DrawTextWindowAndBufferTiles(gLinkPlayers[id ^ 1].name, sMenuTextTileBuffers[GFXTAG_PARTNER_NAME_L], 0, 0, gDecompressionBuffer, 3);
        DrawTextWindowAndBufferTiles(sActionTexts[TEXT_CANCEL], sMenuTextTileBuffers[GFXTAG_CANCEL_L], 0, 0, gDecompressionBuffer, 2);
        DrawBottomRowText(sActionTexts[TEXT_CHOOSE_MON], sMenuTextTileBuffers[GFXTAG_CHOOSE_PKMN_L], 24);
        gMain.state++;
        sTradeMenu->timer = 0;
        break;
    case 11:
        if (LoadUISpriteGfx())
            gMain.state++;
        break;
    case 12:
        // Create player's name text sprites
        name = gSaveBlock2Ptr->playerName;
        width = GetStringWidth(FONT_NORMAL_COPY_1, name, 0);
        xPos = (56 - width) / 2;
        for (i = 0; i < NUM_PLAYER_NAME_SPRITES; i++)
        {
            temp = sSpriteTemplate_MenuText;
            temp.tileTag += i + GFXTAG_PLAYER_NAME_L;
            CreateSprite(&temp, xPos + sPlayerNameCoords[1][0] + (i * 32), sPlayerNameCoords[1][1], 1);
        }

        // Create partner's name text sprites
        id = GetMultiplayerId();
        name = gLinkPlayers[id ^ 1].name;
        width = GetStringWidth(FONT_NORMAL_COPY_1, name, 0);
        xPos = (56 - width) / 2;
        for (i = 0; i < NUM_PARTNER_NAME_SPRITES; i++)
        {
            temp = sSpriteTemplate_MenuText;
            temp.tileTag += i + GFXTAG_PARTNER_NAME_L;
            CreateSprite(&temp, xPos + sPlayerNameCoords[1][2] + (i * 32), sPlayerNameCoords[1][3], 1);
        }
        gMain.state++;
        break;
    case 13:
        // Create Cancel text sprites
        temp = sSpriteTemplate_MenuText;
        temp.tileTag += GFXTAG_CANCEL_L;
        CreateSprite(&temp, 215, 151, 1);
        temp = sSpriteTemplate_MenuText;
        temp.tileTag += GFXTAG_CANCEL_R;
        CreateSprite(&temp, 215 + 32, 151, 1);

        // Create Choose a Pokémon text sprites
        for (i = 0; i < NUM_CHOOSE_PKMN_SPRITES; i++)
        {
            temp = sSpriteTemplate_MenuText;
            temp.tileTag += i + GFXTAG_CHOOSE_PKMN_L;
            CreateSprite(&temp, (i * 32) + 24, 150, 1);
        }

        if (sTradeMenu->cursorPosition < PARTY_SIZE)
            sTradeMenu->cursorPosition = GetLastViewedMonIndex();
        else
            sTradeMenu->cursorPosition = GetLastViewedMonIndex() + PARTY_SIZE;

        sTradeMenu->cursorSpriteId = CreateSprite(&sSpriteTemplate_Cursor,
                                                  sTradeMonSpriteCoords[sTradeMenu->cursorPosition][0] * 8 + 32,
                                                  sTradeMonSpriteCoords[sTradeMenu->cursorPosition][1] * 8, 2);
        gMain.state = 16;
        break;
    case 16:
        LoadTradeBgGfx(0);
        gMain.state++;
        break;
    case 17:
        LoadTradeBgGfx(1);
        sTradeMenu->bg2hofs = 0;
        sTradeMenu->bg3hofs = 0;
        SetActiveMenuOptions();
        gMain.state++;
        break;
    case 18:
        gPaletteFade.bufferTransferDisabled = FALSE;
        BlendPalettes(PALETTES_ALL, 16, RGB_BLACK);
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        gMain.state++;
        break;
    case 19:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
        LoadTradeBgGfx(2);
        gMain.state++;
        break;
    case 20:
        gMain.state++;
        break;
    case 21:
        SetTradePartyHPBarSprites();
        gMain.state++;
        break;
    case 22:
        if (!gPaletteFade.active)
            SetMainCallback2(CB2_TradeMenu);
        break;
    }

    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void VBlankCB_TradeMenu(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void CB_FadeToStartTrade(void)
{
    if (++sTradeMenu->timer >= 16)
    {
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        sTradeMenu->callbackId = CB_WAIT_TO_START_TRADE;
    }
}

static void CB_WaitToStartTrade(void)
{
    if (!gPaletteFade.active)
    {
        gSelectedTradeMonPositions[TRADE_PLAYER] = sTradeMenu->cursorPosition;
        gSelectedTradeMonPositions[TRADE_PARTNER] = sTradeMenu->partnerCursorPosition;
        if (gWirelessCommType != 0)
        {
            sTradeMenu->callbackId = CB_WAIT_TO_START_RFU_TRADE;
        }
        else
        {
            SetCloseLinkCallbackAndType(32);
            sTradeMenu->callbackId = CB_START_LINK_TRADE;
        }
    }
}

static void CB_StartLinkTrade(void)
{
    gMain.savedCallback = CB2_StartCreateTradeMenu;
    if (gWirelessCommType != 0)
    {
        // Wireless Link Trade
        if (IsLinkRfuTaskFinished())
        {
            Free(sMenuTextTileBuffer);
            FreeAllWindowBuffers();
            Free(sTradeMenu);
            gMain.callback1 = NULL;
            DestroyWirelessStatusIndicatorSprite();
            SetMainCallback2(CB2_LinkTrade);
        }
    }
    else
    {
        // Cable Link Trade
        if (!gReceivedRemoteLinkPlayers)
        {
            Free(sMenuTextTileBuffer);
            FreeAllWindowBuffers();
            Free(sTradeMenu);
            gMain.callback1 = NULL;
            SetMainCallback2(CB2_LinkTrade);
        }
    }
}

static void CB2_TradeMenu(void)
{
    RunTradeMenuCallback();
    DoQueuedActions();

    // As long as drawSelectedMonState is 0, these do nothing
    DrawSelectedMonScreen(TRADE_PLAYER);
    DrawSelectedMonScreen(TRADE_PARTNER);

    SetGpuReg(REG_OFFSET_BG2HOFS, sTradeMenu->bg2hofs++);
    SetGpuReg(REG_OFFSET_BG3HOFS, sTradeMenu->bg3hofs--);
    RunTextPrinters_CheckPrinter0Active();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void LoadTradeBgGfx(u8 state)
{
    int i;

    switch (state)
    {
    case 0:
        LoadPalette(gTradeMenu_Pal, BG_PLTT_ID(0), 3 * PLTT_SIZE_4BPP);
        LoadBgTiles(1, gTradeMenu_Gfx, 0x1280, 0);
        CopyToBgTilemapBufferRect_ChangePalette(1, gTradeMenu_Tilemap, 0, 0, 32, 20, 0);
        LoadBgTilemap(2, sTradeStripesBG2Tilemap, 0x800, 0);
        break;
    case 1:
        LoadBgTilemap(3, sTradeStripesBG3Tilemap, 0x800, 0);
        PrintPartyLevelsAndGenders(TRADE_PLAYER);
        PrintPartyLevelsAndGenders(TRADE_PARTNER);
        CopyBgTilemapBufferToVram(1);
        break;
    case 2:
        for (i = 0; i < 4; i++)
        {
            // BG0 and BG1 coords only
            SetGpuReg(REG_OFFSET_BG0HOFS + 2 * i, 0);
        }
        ShowBg(0);
        ShowBg(1);
        ShowBg(2);
        ShowBg(3);
        break;
    }
}

// Determine (based on party counts) where the main menu cursor can go
static void SetActiveMenuOptions(void)
{
    int i;
    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (i < sTradeMenu->partyCounts[TRADE_PLAYER])
        {
            // Present player pokemon
            gSprites[sTradeMenu->partySpriteIds[TRADE_PLAYER][i]].invisible = FALSE;
            sTradeMenu->optionsActive[i] = TRUE;
        }
        else
        {
            // Absent player pokemon
            sTradeMenu->optionsActive[i] = FALSE;
        }

        if (i < sTradeMenu->partyCounts[TRADE_PARTNER])
        {
            // Present partner pokemon
            gSprites[sTradeMenu->partySpriteIds[TRADE_PARTNER][i]].invisible = FALSE;
            sTradeMenu->optionsActive[i + PARTY_SIZE] = TRUE;
        }
        else
        {
            // Absent partner pokemon
            sTradeMenu->optionsActive[i + PARTY_SIZE] = FALSE;
        }
    }

    // Cancel is always active
    sTradeMenu->optionsActive[PARTY_SIZE * 2] = TRUE;
}

static void Trade_Memcpy(void *dest, const void *src, size_t size)
{
    int i;
    u8 *_dest = dest;
    const u8 *_src = src;
    for (i = 0; i < size; i++)
        _dest[i] = _src[i];
}

static bool8 BufferTradeParties(void)
{
    u8 id = GetMultiplayerId();
    int i;
    struct Pokemon * mon;

    switch (sTradeMenu->bufferPartyState)
    {
    case 0:
        // The parties are sent in pairs rather than all at once
        Trade_Memcpy(gBlockSendBuffer, &gPlayerParty[0], 2 * sizeof(struct Pokemon));
        sTradeMenu->bufferPartyState++;
        sTradeMenu->timer = 0;
        break;
    case 1:
        if (IsLinkTaskFinished())
        {
            if (GetBlockReceivedStatus() == 0)
            {
                sTradeMenu->bufferPartyState++;
            }
            else
            {
                ResetBlockReceivedFlags();
                sTradeMenu->bufferPartyState++;
            }
        }
        break;
    case 3:
        if (id == 0)
            SendBlockRequest(BLOCK_REQ_SIZE_200);
        sTradeMenu->bufferPartyState++;
        break;
    case 4:
        if (GetBlockReceivedStatus() == 3)
        {
            Trade_Memcpy(&gEnemyParty[0], gBlockRecvBuffer[id ^ 1], 2 * sizeof(struct Pokemon));
            ResetBlockReceivedFlags();
            sTradeMenu->bufferPartyState++;
        }
        break;
    case 5:
        Trade_Memcpy(gBlockSendBuffer, &gPlayerParty[2], 2 * sizeof(struct Pokemon));
        sTradeMenu->bufferPartyState++;
        break;
    case 7:
        if (id == 0)
            SendBlockRequest(BLOCK_REQ_SIZE_200);
        sTradeMenu->bufferPartyState++;
        break;
    case 8:
        if (GetBlockReceivedStatus() == 3)
        {
            Trade_Memcpy(&gEnemyParty[2], gBlockRecvBuffer[id ^ 1], 2 * sizeof(struct Pokemon));
            ResetBlockReceivedFlags();
            sTradeMenu->bufferPartyState++;
        }
        break;
    case 9:
        Trade_Memcpy(gBlockSendBuffer, &gPlayerParty[4], 2 * sizeof(struct Pokemon));
        sTradeMenu->bufferPartyState++;
        break;
    case 11:
        if (id == 0)
            SendBlockRequest(BLOCK_REQ_SIZE_200);
        sTradeMenu->bufferPartyState++;
        break;
    case 12:
        if (GetBlockReceivedStatus() == 3)
        {
            Trade_Memcpy(&gEnemyParty[4], gBlockRecvBuffer[id ^ 1], 2 * sizeof(struct Pokemon));
            ResetBlockReceivedFlags();
            sTradeMenu->bufferPartyState++;
        }
        break;
    case 13:
        Trade_Memcpy(gBlockSendBuffer, gSaveBlock1Ptr->mail, PARTY_SIZE * sizeof(struct Mail) + 4); // why the extra 4 bytes?
        sTradeMenu->bufferPartyState++;
        break;
    case 15:
        if (id == 0)
            SendBlockRequest(BLOCK_REQ_SIZE_220);
        sTradeMenu->bufferPartyState++;
        break;
    case 16:
        if (GetBlockReceivedStatus() == 3)
        {
            Trade_Memcpy(gLinkPartnerMail, gBlockRecvBuffer[id ^ 1], PARTY_SIZE * sizeof(struct Mail));
            ResetBlockReceivedFlags();
            sTradeMenu->bufferPartyState++;
        }
        break;
    case 17:
        Trade_Memcpy(gBlockSendBuffer, gSaveBlock1Ptr->giftRibbons, sizeof(sTradeMenu->giftRibbons));
        sTradeMenu->bufferPartyState++;
        break;
    case 19:
        if (id == 0)
            SendBlockRequest(BLOCK_REQ_SIZE_40);
        sTradeMenu->bufferPartyState++;
        break;
    case 20:
        if (GetBlockReceivedStatus() == 3)
        {
            Trade_Memcpy(sTradeMenu->giftRibbons, gBlockRecvBuffer[id ^ 1], sizeof(sTradeMenu->giftRibbons));
            ResetBlockReceivedFlags();
            sTradeMenu->bufferPartyState++;
        }
        break;
    case 21:
        for (i = 0, mon = gEnemyParty; i < PARTY_SIZE; mon++, i++)
        {
            u8 name[POKEMON_NAME_LENGTH + 1];
            u16 species = GetMonData(mon, MON_DATA_SPECIES);

            if (species != SPECIES_NONE)
            {
                if (species == SPECIES_SHEDINJA && GetMonData(mon, MON_DATA_LANGUAGE) != LANGUAGE_JAPANESE)
                {
                    GetMonData(mon, MON_DATA_NICKNAME, name);

                    if (!StringCompareWithoutExtCtrlCodes(name, sText_ShedinjaJP))
                        SetMonData(mon, MON_DATA_NICKNAME, gSpeciesNames[SPECIES_SHEDINJA]);
                }
            }
        }
        return TRUE;
    // Delay until next state
    case 2:
    case 6:
    case 10:
    case 14:
    case 18:
        sTradeMenu->timer++;
        if (sTradeMenu->timer > 10)
        {
            sTradeMenu->timer = 0;
            sTradeMenu->bufferPartyState++;
        }
        break;
    }
    return FALSE;
}

static void PrintIsThisTradeOkay(void)
{
    DrawBottomRowText(gText_IsThisTradeOkay, (u8 *)OBJ_VRAM0 + sTradeMenu->bottomTextTileStart * 32, 0x18);
}

static void Leader_ReadLinkBuffer(u8 mpId, u8 status)
{
    if (status & 1)
    {
        switch (gBlockRecvBuffer[0][0])
        {
        case LINKCMD_REQUEST_CANCEL:
            sTradeMenu->playerSelectStatus = STATUS_CANCEL;
            break;
        case LINKCMD_READY_TO_TRADE:
            sTradeMenu->playerSelectStatus = STATUS_READY;
            break;
        case LINKCMD_INIT_BLOCK:
            sTradeMenu->playerConfirmStatus = STATUS_READY;
            break;
        case LINKCMD_READY_CANCEL_TRADE:
            sTradeMenu->playerConfirmStatus = STATUS_CANCEL;
            break;
        }
        ResetBlockReceivedFlag(0);
    }

    if (status & 2)
    {
        switch (gBlockRecvBuffer[1][0])
        {
        case LINKCMD_REQUEST_CANCEL:
            sTradeMenu->partnerSelectStatus = STATUS_CANCEL;
            break;
        case LINKCMD_READY_TO_TRADE:
            sTradeMenu->partnerCursorPosition = gBlockRecvBuffer[1][1] + PARTY_SIZE;
            sTradeMenu->partnerSelectStatus = STATUS_READY;
            break;
        case LINKCMD_INIT_BLOCK:
            sTradeMenu->partnerConfirmStatus = STATUS_READY;
            break;
        case LINKCMD_READY_CANCEL_TRADE:
            sTradeMenu->partnerConfirmStatus = STATUS_CANCEL;
            break;
        }
        ResetBlockReceivedFlag(1);
    }
}

static void Follower_ReadLinkBuffer(u8 mpId, u8 status)
{
    if (status & 1)
    {
        switch (gBlockRecvBuffer[0][0])
        {
        case LINKCMD_BOTH_CANCEL_TRADE:
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
            PrintTradeMessage(MSG_WAITING_FOR_FRIEND);
            sTradeMenu->callbackId = CB_INIT_EXIT_CANCELED_TRADE;
            break;
        case LINKCMD_PARTNER_CANCEL_TRADE:
            PrintTradeMessage(MSG_FRIEND_WANTS_TO_TRADE);
            sTradeMenu->callbackId = CB_HANDLE_TRADE_CANCELED;
            break;
        case LINKCMD_SET_MONS_TO_TRADE:
            sTradeMenu->partnerCursorPosition = gBlockRecvBuffer[0][1] + PARTY_SIZE;
            rbox_fill_rectangle(0);
            SetSelectedMon(sTradeMenu->cursorPosition);
            SetSelectedMon(sTradeMenu->partnerCursorPosition);
            sTradeMenu->callbackId = CB_PRINT_IS_THIS_OKAY;
            break;
        case LINKCMD_START_TRADE:
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
            sTradeMenu->callbackId = CB_WAIT_TO_START_TRADE;
            break;
        case LINKCMD_PLAYER_CANCEL_TRADE:
            PrintTradeMessage(MSG_CANCELED);
            sTradeMenu->callbackId = CB_HANDLE_TRADE_CANCELED;
        }
        ResetBlockReceivedFlag(0);
    }

    if (status & 2)
        ResetBlockReceivedFlag(1);
}

#define QueueLinkData(linkCmd, cursorPosition) \
{ \
    sTradeMenu->linkData[0] = (linkCmd); \
    sTradeMenu->linkData[1] = (cursorPosition); \
    QueueAction(QUEUE_DELAY_DATA, QUEUE_SEND_DATA); \
}

static void Leader_HandleCommunication(void)
{
    if (sTradeMenu->playerSelectStatus != STATUS_NONE
     && sTradeMenu->partnerSelectStatus != STATUS_NONE)
    {
        if (sTradeMenu->playerSelectStatus == STATUS_READY
         && sTradeMenu->partnerSelectStatus == STATUS_READY)
        {
            // Both players have selected a pokemon to trade 
            sTradeMenu->callbackId = CB_SET_SELECTED_MONS;
            QueueLinkData(LINKCMD_SET_MONS_TO_TRADE, sTradeMenu->cursorPosition);
            sTradeMenu->playerSelectStatus = sTradeMenu->partnerSelectStatus = STATUS_NONE;
        }
        else if (sTradeMenu->playerSelectStatus == STATUS_READY
              && sTradeMenu->partnerSelectStatus == STATUS_CANCEL)
        {
            // The player has selected a pokemon to trade,
            // but the partner has selected Cancel
            PrintTradeMessage(MSG_CANCELED);
            QueueLinkData(LINKCMD_PARTNER_CANCEL_TRADE, 0);
            sTradeMenu->playerConfirmStatus = sTradeMenu->partnerConfirmStatus = STATUS_NONE;
            sTradeMenu->playerSelectStatus = sTradeMenu->partnerSelectStatus = STATUS_NONE;
            sTradeMenu->callbackId = CB_HANDLE_TRADE_CANCELED;
        }
        else if (sTradeMenu->playerSelectStatus == STATUS_CANCEL
              && sTradeMenu->partnerSelectStatus == STATUS_READY)
        {
            // The partner has selected a pokemon to trade,
            // but the player has selected cancel
            PrintTradeMessage(MSG_FRIEND_WANTS_TO_TRADE);
            QueueLinkData(LINKCMD_PLAYER_CANCEL_TRADE, 0);
            sTradeMenu->playerConfirmStatus = sTradeMenu->partnerConfirmStatus = STATUS_NONE;
            sTradeMenu->playerSelectStatus = sTradeMenu->partnerSelectStatus = STATUS_NONE;
            sTradeMenu->callbackId = CB_HANDLE_TRADE_CANCELED;
        }
        else if (sTradeMenu->playerSelectStatus == STATUS_CANCEL
              && sTradeMenu->partnerSelectStatus == STATUS_CANCEL)
        {
            // Both players have selected Cancel
            QueueLinkData(LINKCMD_BOTH_CANCEL_TRADE, 0);
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
            sTradeMenu->playerSelectStatus = sTradeMenu->partnerSelectStatus = STATUS_NONE;
            sTradeMenu->callbackId = CB_INIT_EXIT_CANCELED_TRADE;
        }
    }

    if (sTradeMenu->playerConfirmStatus != STATUS_NONE
     && sTradeMenu->partnerConfirmStatus != STATUS_NONE)
    {
        if (sTradeMenu->playerConfirmStatus == STATUS_READY
         && sTradeMenu->partnerConfirmStatus == STATUS_READY)
        {
            // Both players have confirmed the trade
            QueueLinkData(LINKCMD_START_TRADE, 0);
            sTradeMenu->playerConfirmStatus = STATUS_NONE;
            sTradeMenu->partnerConfirmStatus = STATUS_NONE;
            sTradeMenu->callbackId = CB_FADE_TO_START_TRADE;
        }

        if (sTradeMenu->playerConfirmStatus == STATUS_CANCEL
         || sTradeMenu->partnerConfirmStatus == STATUS_CANCEL)
        {
            // One of the players has decided not to confirm the trade,
            // or the trade was not allowed.
            PrintTradeMessage(MSG_CANCELED);
            QueueLinkData(LINKCMD_PLAYER_CANCEL_TRADE, 0);
            sTradeMenu->playerConfirmStatus = STATUS_NONE;
            sTradeMenu->partnerConfirmStatus = STATUS_NONE;
            sTradeMenu->callbackId = CB_HANDLE_TRADE_CANCELED;
        }
    }
}

static void CB1_UpdateLink(void)
{
    u8 mpId = GetMultiplayerId();
    u8 status;

    if ((status = GetBlockReceivedStatus()))
    {
        if (mpId == 0)
            Leader_ReadLinkBuffer(mpId, status);
        else
            Follower_ReadLinkBuffer(mpId, status);
    }
    if (mpId == 0)
        Leader_HandleCommunication();
}

static u8 GetNewCursorPosition(u8 oldPosition, u8 direction)
{
    int i;
    u8 newPosition = 0;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (sTradeMenu->optionsActive[sCursorMoveDestinations[oldPosition][direction][i]] == TRUE)
        {
            newPosition = sCursorMoveDestinations[oldPosition][direction][i];
            break;
        }
    }

    return newPosition;
}


static void TradeMenuMoveCursor(u8 *cursorPosition, u8 direction)
{
    u8 newPosition = GetNewCursorPosition(*cursorPosition, direction);

    if (newPosition == PARTY_SIZE * 2) // CANCEL
    {
        StartSpriteAnim(&gSprites[sTradeMenu->cursorSpriteId], CURSOR_ANIM_ON_CANCEL);
        gSprites[sTradeMenu->cursorSpriteId].x = DISPLAY_WIDTH - 16;
        gSprites[sTradeMenu->cursorSpriteId].y = DISPLAY_HEIGHT;
    }
    else
    {
        StartSpriteAnim(&gSprites[sTradeMenu->cursorSpriteId], CURSOR_ANIM_NORMAL);
        gSprites[sTradeMenu->cursorSpriteId].x = sTradeMonSpriteCoords[newPosition][0] * 8 + 32;
        gSprites[sTradeMenu->cursorSpriteId].y = sTradeMonSpriteCoords[newPosition][1] * 8;
    }

    if (*cursorPosition != newPosition)
        PlaySE(SE_SELECT);

    *cursorPosition = newPosition;
}

static void SetReadyToTrade(void)
{
    PrintTradeMessage(MSG_STANDBY);
    sTradeMenu->callbackId = CB_READY_WAIT;

    if (GetMultiplayerId() == 1)
    {
        // Communicate to the link leader that we're ready to trade
        sTradeMenu->linkData[0] = LINKCMD_READY_TO_TRADE;
        sTradeMenu->linkData[1] = sTradeMenu->cursorPosition;
        SendBlock(BitmaskAllOtherLinkPlayers(), sTradeMenu->linkData, 20);
    }
    else
    {
        // We are the link leader, no communication necessary
        sTradeMenu->playerSelectStatus = STATUS_READY;
    }
}

static void CB_ProcessMenuInput(void)
{
    int i;

    if (JOY_REPT(DPAD_UP))
        TradeMenuMoveCursor(&sTradeMenu->cursorPosition, DIR_UP);
    else if (JOY_REPT(DPAD_DOWN))
        TradeMenuMoveCursor(&sTradeMenu->cursorPosition, DIR_DOWN);
    else if (JOY_REPT(DPAD_LEFT))
        TradeMenuMoveCursor(&sTradeMenu->cursorPosition, DIR_LEFT);
    else if (JOY_REPT(DPAD_RIGHT))
        TradeMenuMoveCursor(&sTradeMenu->cursorPosition, DIR_RIGHT);

    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);

        if (sTradeMenu->cursorPosition < PARTY_SIZE)
        {
            // Selected pokemon in player's party
            DrawTextBorderOuter(1, 1, 14);
            FillWindowPixelBuffer(1, PIXEL_FILL(1));
            PrintMenuTable(1, FONT_NORMAL_COPY_2, 16, ARRAY_COUNT(sMenuAction_SummaryTrade), sMenuAction_SummaryTrade);
            Menu_InitCursor(1, FONT_NORMAL_COPY_2, 0, 0, 16, 2, 0);
            PutWindowTilemap(1);
            CopyWindowToVram(1, COPYWIN_FULL);
            sTradeMenu->callbackId = CB_SELECTED_MON;
        }
        else if (sTradeMenu->cursorPosition < PARTY_SIZE * 2)
        {
            // Selected pokemon in partner's party
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
            sTradeMenu->callbackId = CB_SHOW_MON_SUMMARY;
        }
        else if (sTradeMenu->cursorPosition == PARTY_SIZE * 2)
        {
            // Selected Cancel
            CreateYesNoMenu(&sWindowTemplate_YesNo, FONT_NORMAL_COPY_2, 0, 2, 0x001, 14, 0);
            sTradeMenu->callbackId = CB_CANCEL_TRADE_PROMPT;
            DrawBottomRowText(sActionTexts[TEXT_CANCEL_TRADE], (void *)OBJ_VRAM0 + sTradeMenu->bottomTextTileStart * 32, 24);
        }
    }

    // This option is unavailable in Emerald
    if (JOY_NEW(R_BUTTON))
    {
        for (i = 0; i < 10; i++)
            sTradeMenu->linkData[i] = i;
        SendBlock(BitmaskAllOtherLinkPlayers(), sTradeMenu->linkData, 20);
    }
}

static void RedrawChooseAPokemonWindow(void)
{
    PrintTradePartnerPartyNicknames();
    sTradeMenu->callbackId = CB_MAIN_MENU;
    gSprites[sTradeMenu->cursorSpriteId].invisible = FALSE;
    DrawBottomRowText(sActionTexts[TEXT_CHOOSE_MON], (void *)OBJ_VRAM0 + sTradeMenu->bottomTextTileStart * 32, 24);
}

static void CB_ProcessSelectedMonInput(void)
{
    switch (Menu_ProcessInputNoWrapAround())
    {
    case MENU_B_PRESSED:
        PlaySE(SE_SELECT);
        RedrawChooseAPokemonWindow();
        break;
    case MENU_NOTHING_CHOSEN:
        break;
    case 0: // Summary
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        sTradeMenu->callbackId = CB_SHOW_MON_SUMMARY;
        break;
    case 1: // Trade
        switch (CanTradeSelectedMon(gPlayerParty, gPlayerPartyCount, sTradeMenu->cursorPosition))
        {
        case CAN_TRADE_MON:
            SetReadyToTrade();
            gSprites[sTradeMenu->cursorSpriteId].invisible = TRUE;
            break;
        case CANT_TRADE_LAST_MON:
            QueueAction(QUEUE_DELAY_MSG, QUEUE_ONLY_MON2);
            sTradeMenu->callbackId = CB_HANDLE_TRADE_CANCELED;
            break;
        case CANT_TRADE_NATIONAL:
        case CANT_TRADE_INVALID_MON:
            QueueAction(QUEUE_DELAY_MSG, QUEUE_MON_CANT_BE_TRADED);
            sTradeMenu->callbackId = CB_HANDLE_TRADE_CANCELED;
            break;
        case CANT_TRADE_EGG_YET:
        case CANT_TRADE_PARTNER_EGG_YET:
            QueueAction(QUEUE_DELAY_MSG, QUEUE_EGG_CANT_BE_TRADED);
            sTradeMenu->callbackId = CB_HANDLE_TRADE_CANCELED;
            break;
        }
        break;
    }
}

static void CB_ChooseMonAfterButtonPress(void)
{
    if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        RedrawChooseAPokemonWindow();
    }
}

static void CB_ShowTradeMonSummaryScreen(void)
{
    if (!gPaletteFade.active)
    {
        if (sTradeMenu->cursorPosition < PARTY_SIZE)
            ShowPokemonSummaryScreen(gPlayerParty, sTradeMenu->cursorPosition, sTradeMenu->partyCounts[0] - 1, CB2_ReturnToTradeMenuFromSummary, PSS_MODE_TRADE);
        else
            ShowPokemonSummaryScreen(gEnemyParty, sTradeMenu->cursorPosition - PARTY_SIZE, sTradeMenu->partyCounts[1] - 1, CB2_ReturnToTradeMenuFromSummary, PSS_MODE_TRADE);
        FreeAllWindowBuffers();
    }
}

static u8 CheckValidityOfTradeMons(u8 *aliveMons, u8 playerPartyCount, u8 cursorPos)
{
    s32 i;
    u16 partnerSpecies;
    u8 hasLiveMon = 0;

    // Make sure mon to be traded isn't player's last alive mon
    for (i = 0; i < playerPartyCount; i++)
    {
        if (cursorPos != i)
            hasLiveMon += aliveMons[i];
    }

    // Partner cant trade illegitimate Deoxys or Mew
    partnerSpecies = GetMonData(&gEnemyParty[sTradeMenu->partnerCursorPosition % PARTY_SIZE], MON_DATA_SPECIES);
    if ((partnerSpecies == SPECIES_DEOXYS || partnerSpecies == SPECIES_MEW)
        && !GetMonData(&gEnemyParty[sTradeMenu->partnerCursorPosition % PARTY_SIZE], MON_DATA_MODERN_FATEFUL_ENCOUNTER))
        return PARTNER_MON_INVALID;

    if (hasLiveMon != 0)
        hasLiveMon = BOTH_MONS_VALID;

    return hasLiveMon; // PLAYER_MON_INVALID or BOTH_MONS_VALID
}

static void CommunicateWhetherMonCanBeTraded(void)
{
    int i;
    u8 aliveMons[PARTY_SIZE * 2];

    for (i = 0; i < sTradeMenu->partyCounts[TRADE_PLAYER]; i++)
        aliveMons[i] = sTradeMenu->isLiveMon[TRADE_PLAYER][i];

    switch (CheckValidityOfTradeMons(aliveMons, sTradeMenu->partyCounts[0], sTradeMenu->cursorPosition))
    {
    case PLAYER_MON_INVALID:
        QueueAction(QUEUE_DELAY_MSG, QUEUE_ONLY_MON2);
        sTradeMenu->linkData[0] = LINKCMD_READY_CANCEL_TRADE;
        QueueAction(180, QUEUE_SEND_DATA);
        break;
    case BOTH_MONS_VALID:
        QueueAction(QUEUE_DELAY_MSG, QUEUE_STANDBY);
        sTradeMenu->linkData[0] = LINKCMD_INIT_BLOCK;
        if (IsLinkTaskFinished())
            SendBlock(BitmaskAllOtherLinkPlayers(), sTradeMenu->linkData, 20);
        break;
    case PARTNER_MON_INVALID:
        QueueAction(QUEUE_DELAY_MSG, QUEUE_FRIENDS_MON_CANT_BE_TRADED);
        sTradeMenu->linkData[0] = LINKCMD_READY_CANCEL_TRADE;
        QueueAction(180, QUEUE_SEND_DATA);
        break;
    default:
        // Both pokemon are valid to trade
        break;
    }
}

static void CB_ProcessConfirmTradeInput(void)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case 0: // YES, Confirm selection
        CommunicateWhetherMonCanBeTraded();
        sTradeMenu->callbackId = CB_IDLE;
        PutWindowTilemap(17);
        break;
    case 1: // NO, Cancel Trade
    case MENU_B_PRESSED:
        QueueAction(QUEUE_DELAY_MSG, QUEUE_STANDBY);
        if (IsLinkTaskFinished())
        {
            sTradeMenu->linkData[0] = LINKCMD_READY_CANCEL_TRADE;
            SendBlock(BitmaskAllOtherLinkPlayers(), sTradeMenu->linkData, 20);
        }
        sTradeMenu->callbackId = CB_IDLE;
        PutWindowTilemap(17);
        break;
    }
}

// Only when choosing Yes to cancel, when No is chosen all are redrawn anyway
static void RestoreNicknamesCoveredByYesNo(void)
{
    int i;

    for (i = 0; i < sTradeMenu->partyCounts[1] - 4; i++)
    {
        PutWindowTilemap(i + PARTY_SIZE * 2);
        CopyWindowToVram(i + PARTY_SIZE * 2, COPYWIN_MAP);
    }
}

static void CB_ProcessCancelTradeInput(void)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case 0: // YES, Cancel
        PrintTradeMessage(MSG_WAITING_FOR_FRIEND);
        QueueLinkData(LINKCMD_REQUEST_CANCEL, 0);
        gSprites[sTradeMenu->cursorSpriteId].invisible = TRUE;
        sTradeMenu->callbackId = CB_IDLE;
        RestoreNicknamesCoveredByYesNo();
        break;
    case 1: // NO, Continue
    case MENU_B_PRESSED:
        PlaySE(SE_SELECT);
        RedrawChooseAPokemonWindow();
        break;
    }
}

static void CB_SetSelectedMons(void)
{
    if (GetMultiplayerId() == 0)
    {
        rbox_fill_rectangle(0);
        SetSelectedMon(sTradeMenu->cursorPosition);
        SetSelectedMon(sTradeMenu->partnerCursorPosition);
    }
    sTradeMenu->callbackId = CB_PRINT_IS_THIS_OKAY;
}

static void CB_PrintIsThisTradeOkay(void)
{
    if (sTradeMenu->drawSelectedMonState[TRADE_PLAYER] == DRAW_SELECTED_FINISH
     && sTradeMenu->drawSelectedMonState[TRADE_PARTNER] == DRAW_SELECTED_FINISH)
    {
        PrintIsThisTradeOkay();
        sTradeMenu->callbackId = CB_INIT_CONFIRM_TRADE_PROMPT;
    }
}

static void CB_InitConfirmTradePrompt(void)
{
    sTradeMenu->timer++;
    if (sTradeMenu->timer > 120)
    {
        CreateYesNoMenu(&sWindowTemplate_YesNo, FONT_NORMAL_COPY_2, 0, 2, 1, 14, 0);
        sTradeMenu->timer = 0;
        sTradeMenu->callbackId = CB_CONFIRM_TRADE_PROMPT;
    }
}

static void CB_HandleTradeCanceled(void)
{
    int i;

    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        rbox_fill_rectangle(0);
        rbox_fill_rectangle(1);

        for (i = 0; i < 4; i++)
        {
            FillWindowPixelBuffer(i + 14, PIXEL_FILL(0));
            rbox_fill_rectangle(i + 14);
        }

        RedrawPartyWindow(TRADE_PLAYER);
        RedrawPartyWindow(TRADE_PARTNER);
        sTradeMenu->callbackId = CB_MAIN_MENU;
        gSprites[sTradeMenu->cursorSpriteId].invisible = FALSE;
    }
}

static void CB_InitExitCanceledTrade(void)
{
    if (!gPaletteFade.active)
    {
        if (gWirelessCommType)
            SetLinkStandbyCallback();
        else
            SetCloseLinkCallbackAndType(12);

        sTradeMenu->callbackId = CB_EXIT_CANCELED_TRADE;
    }
}

static void CB_ExitCanceledTrade(void)
{
    if (gWirelessCommType)
    {
        if (IsLinkTaskFinished())
        {
            Free(sMenuTextTileBuffer);
            Free(sTradeMenu);
            FreeAllWindowBuffers();
            DestroyWirelessStatusIndicatorSprite();
            SetMainCallback2(CB2_ReturnToFieldFromMultiplayer);
        }
    }
    else
    {
        if (!gReceivedRemoteLinkPlayers)
        {
            Free(sMenuTextTileBuffer);
            Free(sTradeMenu);
            FreeAllWindowBuffers();
            SetMainCallback2(CB2_ReturnToFieldFromMultiplayer);
        }
    }
}

static void CB_WaitToStartRfuTrade(void)
{
    if (!Rfu_SetLinkRecovery(FALSE))
    {
        SetLinkStandbyCallback();
        sTradeMenu->callbackId = CB_START_LINK_TRADE;
    }
}

static void RunTradeMenuCallback(void)
{
    switch (sTradeMenu->callbackId)
    {
    case CB_MAIN_MENU:
        CB_ProcessMenuInput();
        break;
    case CB_SELECTED_MON:
        CB_ProcessSelectedMonInput();
        break;
    case CB_SHOW_MON_SUMMARY:
        CB_ShowTradeMonSummaryScreen();
        break;
    case CB_CONFIRM_TRADE_PROMPT:
        CB_ProcessConfirmTradeInput();
        break;
    case CB_CANCEL_TRADE_PROMPT:
        CB_ProcessCancelTradeInput();
        break;
    case CB_READY_WAIT:
        // nop
        break;
    case CB_SET_SELECTED_MONS:
        CB_SetSelectedMons();
        break;
    case CB_PRINT_IS_THIS_OKAY:
        CB_PrintIsThisTradeOkay();
        break;
    case CB_HANDLE_TRADE_CANCELED:
        CB_HandleTradeCanceled();
        break;
    case CB_FADE_TO_START_TRADE:
        CB_FadeToStartTrade();
        break;
    case CB_WAIT_TO_START_TRADE:
        CB_WaitToStartTrade();
        break;
    case CB_INIT_EXIT_CANCELED_TRADE:
        CB_InitExitCanceledTrade();
        break;
    case CB_EXIT_CANCELED_TRADE:
        CB_ExitCanceledTrade();
        break;
    case CB_START_LINK_TRADE:
        CB_StartLinkTrade();
        break;
    case CB_INIT_CONFIRM_TRADE_PROMPT:
        CB_InitConfirmTradePrompt();
        break;
    case CB_UNUSED_CLOSE_MSG:
        CB_ChooseMonAfterButtonPress();
        break;
    case CB_WAIT_TO_START_RFU_TRADE:
        CB_WaitToStartRfuTrade();
        break;
    }
    // CB_IDLE is nop
}

static void SetSelectedMon(u8 cursorPosition)
{
    // cursorPosition 0-5 are the player's mons, 6-11 are the partner's
    u8 whichParty = cursorPosition / PARTY_SIZE;

    if (sTradeMenu->drawSelectedMonState[whichParty] == 0)
    {
        // Start the animation to display just the selected
        // pokemon in the middle of the screen
        sTradeMenu->drawSelectedMonState[whichParty] = 1;
        sTradeMenu->selectedMonIdx[whichParty] = cursorPosition;
    }
}

static void DrawSelectedMonScreen(u8 whichParty)
{
    s8 nameStringWidth;
    u8 nickname[20];
    u8 movesString[56];
    u8 i;
    u8 partyIdx;
    u8 selectedMonParty;
    u8 selectedMonIdx = sTradeMenu->selectedMonIdx[whichParty];

    selectedMonParty = TRADE_PARTNER;
    if (sTradeMenu->selectedMonIdx[whichParty] < PARTY_SIZE)
        selectedMonParty = TRADE_PLAYER;
    partyIdx = selectedMonIdx % PARTY_SIZE;
    nameStringWidth = 0;

    switch (sTradeMenu->drawSelectedMonState[whichParty])
    {
    default:
        // Idle while state is 0, and once it reaches the final state (DRAW_SELECTED_FINISH)
        break;
    case 1:
        // Erase the rest of the party
        for (i = 0; i < sTradeMenu->partyCounts[whichParty]; i++)
            gSprites[sTradeMenu->partySpriteIds[selectedMonParty][i]].invisible = TRUE;
        for (i = 0; i < PARTY_SIZE; i++)
            ClearWindowTilemap(i + (whichParty * PARTY_SIZE + 2));

        // Re-display the selected pokemon
        gSprites[sTradeMenu->partySpriteIds[selectedMonParty][partyIdx]].invisible = FALSE;

        // Move the selected pokemon to the center
        gSprites[sTradeMenu->partySpriteIds[selectedMonParty][partyIdx]].data[0] = 20;
        gSprites[sTradeMenu->partySpriteIds[selectedMonParty][partyIdx]].data[2] = (sTradeMonSpriteCoords[selectedMonParty * PARTY_SIZE][0]
                                                                                  + sTradeMonSpriteCoords[selectedMonParty * PARTY_SIZE + 1][0]) / 2 * 8 + 14;
        gSprites[sTradeMenu->partySpriteIds[selectedMonParty][partyIdx]].data[4] = (sTradeMonSpriteCoords[selectedMonParty * PARTY_SIZE][1] * 8) - 12;
        StoreSpriteCallbackInData6(&gSprites[sTradeMenu->partySpriteIds[selectedMonParty][partyIdx]], SpriteCB_MonIcon);
        sTradeMenu->drawSelectedMonState[whichParty]++;
        Trade_MoveSelectedMonToTarget(&gSprites[sTradeMenu->partySpriteIds[selectedMonParty][partyIdx]]);
        
        CopyToBgTilemapBufferRect_ChangePalette(1, sTradePartyBoxTilemap, whichParty * 15, 0, 15, 17, 0);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(0);

        if (selectedMonParty == TRADE_PLAYER)
            PrintTradePartnerPartyNicknames();
        break;
    case 2:
        // Wait for the selected pokemon's sprite to move to the correct position
        if (gSprites[sTradeMenu->partySpriteIds[selectedMonParty][partyIdx]].callback == SpriteCB_MonIcon)
            sTradeMenu->drawSelectedMonState[whichParty] = 3;
        break;
    case 3:
        // Redisplay the bg box
        CopyToBgTilemapBufferRect_ChangePalette(1, sTradeMovesBoxTilemap, selectedMonParty * 15, 0, 15, 17, 0);
        CopyBgTilemapBufferToVram(1);

        // Finalize the selected pokemon's position
        gSprites[sTradeMenu->partySpriteIds[selectedMonParty][partyIdx]].x = (sTradeMonSpriteCoords[selectedMonParty * PARTY_SIZE][0]
                                                                            + sTradeMonSpriteCoords[selectedMonParty * PARTY_SIZE + 1][0]) / 2 * 8 + 14;
        gSprites[sTradeMenu->partySpriteIds[selectedMonParty][partyIdx]].y = (sTradeMonSpriteCoords[selectedMonParty * PARTY_SIZE][1] * 8) - 12;
        gSprites[sTradeMenu->partySpriteIds[selectedMonParty][partyIdx]].x2 = 0;
        gSprites[sTradeMenu->partySpriteIds[selectedMonParty][partyIdx]].y2 = 0;

        // Print selected pokemon's name and moves
        nameStringWidth = GetMonNicknameWidth(nickname, selectedMonParty, partyIdx);
        AddTextPrinterParameterized3((whichParty * 2) + 14, FONT_SMALL, (80 - nameStringWidth) / 2, 4, sTextColor_PartyMonNickname, 0, nickname);
        BufferMovesString(movesString, selectedMonParty, partyIdx);
        AddTextPrinterParameterized4((whichParty * 2) + 15, FONT_NORMAL_COPY_1, 0, 0, 0, 0, sTextColor_PartyMonNickname, 0, movesString);
        PutWindowTilemap((whichParty * 2) + 14);
        CopyWindowToVram((whichParty * 2) + 14, COPYWIN_FULL);
        PutWindowTilemap((whichParty * 2) + 15);
        CopyWindowToVram((whichParty * 2) + 15, COPYWIN_FULL);

        sTradeMenu->drawSelectedMonState[whichParty]++;
        break;
    case 4:
        PrintLevelAndGender(whichParty, partyIdx,
            sSelectedMonLevelGenderCoords[whichParty][0] + 4,
            sSelectedMonLevelGenderCoords[whichParty][1] + 1,
            sSelectedMonLevelGenderCoords[whichParty][0],
            sSelectedMonLevelGenderCoords[whichParty][1]);
        sTradeMenu->drawSelectedMonState[whichParty]++;
        break;
    }
}

static u8 GetMonNicknameWidth(u8 *dest, u8 whichParty, u8 partyIdx)
{
    u8 nickname[POKEMON_NAME_LENGTH];
    if (whichParty == TRADE_PLAYER)
        GetMonData(&gPlayerParty[partyIdx], MON_DATA_NICKNAME, nickname);
    else
        GetMonData(&gEnemyParty[partyIdx], MON_DATA_NICKNAME, nickname);
    StringCopy_Nickname(dest, nickname);
    return GetStringWidth(FONT_SMALL, dest, GetFontAttribute(FONT_SMALL, FONTATTR_LETTER_SPACING));
}

static void BufferMovesString(u8 *movesString, u8 whichParty, u8 partyIdx)
{
    u16 moves[MAX_MON_MOVES];
    u16 i;

    if (!sTradeMenu->isEgg[whichParty][partyIdx])
    {
        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            if (whichParty == TRADE_PLAYER)
                moves[i] = GetMonData(&gPlayerParty[partyIdx], i + MON_DATA_MOVE1, NULL);
            else
                moves[i] = GetMonData(&gEnemyParty[partyIdx], i + MON_DATA_MOVE1, NULL);
        }

        StringCopy(movesString, sText_Dummy);

        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            if (moves[i] != MOVE_NONE)
                StringAppend(movesString, gMoveNames[moves[i]]);

            StringAppend(movesString, sText_Newline);
        }
    }
    else
    {
        StringCopy(movesString, sText_Dummy);
        StringAppend(movesString, gText_4Qmark);
    }
}

static void PrintPartyMonNickname(u8 whichParty, u8 windowId, const u8 *str)
{
    u8 xPos;
    s8 speed;
    windowId += (whichParty * PARTY_SIZE) + 2;
    speed = 0;
    xPos = (64u - GetStringWidth(FONT_SMALL, str, GetFontAttribute(FONT_SMALL, FONTATTR_LETTER_SPACING))) / 2;
    AddTextPrinterParameterized3(windowId, FONT_SMALL, xPos, 4, sTextColor_PartyMonNickname, speed, str);
    PutWindowTilemap(windowId);
    CopyWindowToVram(windowId, COPYWIN_FULL);
}

static void PrintPartyNicknames(u8 whichParty)
{
    u8 buff[20];
    u8 nickname[30];
    struct Pokemon * party = (whichParty == TRADE_PLAYER) ? gPlayerParty : gEnemyParty;
    u8 i;
    for (i = 0; i < sTradeMenu->partyCounts[whichParty]; i++)
    {
        GetMonData(&party[i], MON_DATA_NICKNAME, buff);
        StringCopy_Nickname(nickname, buff);
        PrintPartyMonNickname(whichParty, i, nickname);
    }
}

static void PrintLevelAndGender(u8 whichParty, u8 monIdx, u8 x, u8 y, u8 winLeft, u8 winTop)
{
    u8 level;
    u32 symbolTile;
    u8 gender;
    u8 nickname[POKEMON_NAME_LENGTH];

    CopyToBgTilemapBufferRect_ChangePalette(1, gTradeMenuMonBox_Tilemap, winLeft, winTop, 6, 3, 0);
    CopyBgTilemapBufferToVram(1);

    if (whichParty == TRADE_PLAYER)
        level = GetMonData(&gPlayerParty[monIdx], MON_DATA_LEVEL, NULL);
    else
        level = GetMonData(&gEnemyParty[monIdx], MON_DATA_LEVEL, NULL);

    if (!sTradeMenu->isEgg[whichParty][monIdx])
    {
        if (level / 10 != 0)
            sTradeMenu->tilemapBuffer[x + (y * 32)] = (level / 10) + 0x60;

        sTradeMenu->tilemapBuffer[x + (y * 32) + 1] = (level % 10) + 0x70;
    }
    else
    {
        sTradeMenu->tilemapBuffer[x + (y * 32) - 32] = sTradeMenu->tilemapBuffer[x + (y * 32) - 33];
        sTradeMenu->tilemapBuffer[x + (y * 32) - 31] = sTradeMenu->tilemapBuffer[x + (y * 32) - 36] | 0x400;
    }

    if (sTradeMenu->isEgg[whichParty][monIdx])
    {
        symbolTile = 0x480;
    }
    else
    {
        if (whichParty == TRADE_PLAYER)
        {
            gender = GetMonGender(&gPlayerParty[monIdx]);
            GetMonData(&gPlayerParty[monIdx], MON_DATA_NICKNAME, nickname);
        }
        else
        {
            gender = GetMonGender(&gEnemyParty[monIdx]);
            GetMonData(&gEnemyParty[monIdx], MON_DATA_NICKNAME, nickname);
        }

        switch (gender)
        {
        case MON_MALE:
            symbolTile = !NameHasGenderSymbol(nickname, MON_MALE) ? 0x84 : 0x83;
            break;
        case MON_FEMALE:
            symbolTile = !NameHasGenderSymbol(nickname, MON_FEMALE) ? 0x85 : 0x83;
            break;
        default:
            symbolTile = 0x83;
            break;
        }
    }
    sTradeMenu->tilemapBuffer[(y - 1) * 32 + x + 1] = symbolTile;
}

static void PrintPartyLevelsAndGenders(u8 whichParty)
{
    s32 i;
    for (i = 0; i < sTradeMenu->partyCounts[whichParty]; i++)
    {
        s32 j = i + PARTY_SIZE * whichParty;
        PrintLevelAndGender(
            whichParty,
            i,
            sTradeMonLevelCoords[j][0],
            sTradeMonLevelCoords[j][1],
            sTradeMonBoxCoords[j][0],
            sTradeMonBoxCoords[j][1]
        );
    }
}

static void ShowTradePartyMonIcons(u8 whichParty)
{
    int i;

    for (i = 0; i < sTradeMenu->partyCounts[whichParty]; i++)
    {
        gSprites[sTradeMenu->partySpriteIds[whichParty][i]].invisible = FALSE;
        gSprites[sTradeMenu->partySpriteIds[whichParty][i]].x = sTradeMonSpriteCoords[(whichParty * PARTY_SIZE) + i][0] * 8 + 14;
        gSprites[sTradeMenu->partySpriteIds[whichParty][i]].y = sTradeMonSpriteCoords[(whichParty * PARTY_SIZE) + i][1] * 8 - 12;
        gSprites[sTradeMenu->partySpriteIds[whichParty][i]].x2 = 0;
        gSprites[sTradeMenu->partySpriteIds[whichParty][i]].y2 = 0;
    }
}

static void PrintTradePartnerPartyNicknames(void)
{
    rbox_fill_rectangle(1);
    PrintPartyNicknames(1);
}

// Returning to the party selection screen from the "is this trade ok?" screen
static void RedrawPartyWindow(u8 whichParty)
{
    CopyToBgTilemapBufferRect_ChangePalette(1, sTradePartyBoxTilemap, 15 * whichParty, 0, 15, 17, 0);
    CopyBgTilemapBufferToVram(1);
    PrintPartyLevelsAndGenders(whichParty);
    PrintPartyNicknames(whichParty);
    ShowTradePartyMonIcons(whichParty);
    DrawBottomRowText(sActionTexts[TEXT_CHOOSE_MON], (void *)OBJ_VRAM0 + 32 * sTradeMenu->bottomTextTileStart, 24);
    sTradeMenu->drawSelectedMonState[whichParty] = 0;
}

static void Task_DrawSelectionSummary(u8 taskId)
{
    FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
    CopyBgTilemapBufferToVram(0);
}

static void Task_DrawSelectionTrade(u8 taskId)
{
    FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
    CopyBgTilemapBufferToVram(0);
}

static void QueueAction(u16 delay, u8 actionId)
{
    int i;
    for (i = 0; i < (int)ARRAY_COUNT(sTradeMenu->queuedActions); i++)
    {
        // Find first available spot
        if (!sTradeMenu->queuedActions[i].active)
        {
            sTradeMenu->queuedActions[i].delay = delay;
            sTradeMenu->queuedActions[i].actionId = actionId;
            sTradeMenu->queuedActions[i].active = TRUE;
            break;
        }
    }
}

static void DoQueuedActions(void)
{
    int i;

    for (i = 0; i < (int)ARRAY_COUNT(sTradeMenu->queuedActions); i++)
    {
        if (sTradeMenu->queuedActions[i].active)
        {
            if (sTradeMenu->queuedActions[i].delay != 0)
            {
                sTradeMenu->queuedActions[i].delay--;
            }
            else
            {
                switch (sTradeMenu->queuedActions[i].actionId)
                {
                case QUEUE_SEND_DATA:
                    SendBlock(BitmaskAllOtherLinkPlayers(), sTradeMenu->linkData, 20);
                    break;
                case QUEUE_STANDBY:
                    PrintTradeMessage(MSG_STANDBY);
                    break;
                case QUEUE_ONLY_MON1:
                    PrintTradeMessage(MSG_ONLY_MON1);
                    break;
                case QUEUE_ONLY_MON2:
                case QUEUE_UNUSED1:
                case QUEUE_UNUSED2:
                    PrintTradeMessage(MSG_ONLY_MON2);
                    break;
                case QUEUE_MON_CANT_BE_TRADED:
                    PrintTradeMessage(MSG_MON_CANT_BE_TRADED);
                    break;
                case QUEUE_EGG_CANT_BE_TRADED:
                    PrintTradeMessage(MSG_EGG_CANT_BE_TRADED);
                    break;
                case QUEUE_FRIENDS_MON_CANT_BE_TRADED:
                    PrintTradeMessage(MSG_FRIENDS_MON_CANT_BE_TRADED);
                    break;
                }
                sTradeMenu->queuedActions[i].active = FALSE;
            }
        }
    }
}

static void PrintTradeMessage(u8 messageId)
{
    FillWindowPixelBuffer(0, PIXEL_FILL(1));
    AddTextPrinterParameterized(0, FONT_NORMAL_COPY_2, sMessages[messageId], 0, 2, TEXT_SKIP_DRAW, NULL);
    DrawTextBorderOuter(0, 0x014, 12);
    PutWindowTilemap(0);
    CopyWindowToVram(0, COPYWIN_FULL);
}

static bool8 LoadUISpriteGfx(void)
{
    struct SpriteSheet sheet;

    if (sTradeMenu->timer < NUM_MENU_TEXT_SPRITES)
    {
        sheet.data = sMenuTextTileBuffers[sTradeMenu->timer];
        sheet.size = 0x100;
        sheet.tag = GFXTAG_MENU_TEXT + sTradeMenu->timer;
    }

    switch (sTradeMenu->timer)
    {
    case GFXTAG_PLAYER_NAME_L:
    case GFXTAG_PLAYER_NAME_M:
    case GFXTAG_PLAYER_NAME_R:
    case GFXTAG_PARTNER_NAME_L:
    case GFXTAG_PARTNER_NAME_M:
    case GFXTAG_PARTNER_NAME_R:
    case GFXTAG_CANCEL_L:
    case GFXTAG_CANCEL_R:
        LoadSpriteSheet(&sheet);
        sTradeMenu->timer++;
        break;
    case GFXTAG_CHOOSE_PKMN_L:
        sTradeMenu->bottomTextTileStart = LoadSpriteSheet(&sheet);
        sTradeMenu->timer++;
        break;
    case GFXTAG_CHOOSE_PKMN_M:
    case GFXTAG_CHOOSE_PKMN_R:
    case GFXTAG_CHOOSE_PKMN_EMPTY_1:
    case GFXTAG_CHOOSE_PKMN_EMPTY_2:
    case GFXTAG_CHOOSE_PKMN_EMPTY_3:
        LoadSpriteSheet(&sheet);
        sTradeMenu->timer++;
        break;
    case NUM_MENU_TEXT_SPRITES:
        LoadSpritePalette(&sSpritePalette_MenuText);
        sTradeMenu->timer++;
        break;
    case NUM_MENU_TEXT_SPRITES + 1:
        LoadSpritePalette(&sCursor_SpritePalette);
        sTradeMenu->timer++;
        break;
    case NUM_MENU_TEXT_SPRITES + 2:
        LoadSpriteSheet(&sCursor_SpriteSheet);
        sTradeMenu->timer++;
        break;
    case NUM_MENU_TEXT_SPRITES + 3:
        sTradeMenu->timer = 0;
        return TRUE;
    }

    return FALSE;
}

static void DrawBottomRowText(const u8 *name, u8 *dest, u8 unused)
{
    DrawTextWindowAndBufferTiles(name, dest, 0, 0, gDecompressionBuffer, 6);
}

static void ComputePartyTradeableFlags(u8 whichParty)
{
    int i;

    switch (whichParty)
    {
    case TRADE_PLAYER:
        for (i = 0; i < sTradeMenu->partyCounts[whichParty]; i++)
        {
            if (GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG) == TRUE)
            {
                sTradeMenu->isLiveMon[whichParty][i] = FALSE;
                sTradeMenu->isEgg[whichParty][i] = TRUE;
            }
            else if (GetMonData(&gPlayerParty[i], MON_DATA_HP) == 0)
            {
                sTradeMenu->isLiveMon[whichParty][i] = FALSE;
                sTradeMenu->isEgg[whichParty][i] = FALSE;
            }
            else
            {
                sTradeMenu->isLiveMon[whichParty][i] = TRUE;
                sTradeMenu->isEgg[whichParty][i] = FALSE;
            }
        }
        break;
    case TRADE_PARTNER:
        for (i = 0; i < sTradeMenu->partyCounts[whichParty]; i++)
        {
            if (GetMonData(&gEnemyParty[i], MON_DATA_IS_EGG) == TRUE)
            {
                sTradeMenu->isLiveMon[whichParty][i] = FALSE;
                sTradeMenu->isEgg[whichParty][i] = TRUE;
            }
            else if (GetMonData(&gEnemyParty[i], MON_DATA_HP) == 0)
            {
                sTradeMenu->isLiveMon[whichParty][i] = FALSE;
                sTradeMenu->isEgg[whichParty][i] = FALSE;
            }
            else
            {
                sTradeMenu->isLiveMon[whichParty][i] = TRUE;
                sTradeMenu->isEgg[whichParty][i] = FALSE;
            }
        }
        break;
    }
}

static void ComputePartyHPBarLevels(u8 whichParty)
{
    u16 i, curHp, maxHp;

    switch (whichParty)
    {
    case TRADE_PLAYER:
        for (i = 0; i < sTradeMenu->partyCounts[TRADE_PLAYER]; i++)
        {
            curHp = GetMonData(&gPlayerParty[i], MON_DATA_HP);
            maxHp = GetMonData(&gPlayerParty[i], MON_DATA_MAX_HP);
            sTradeMenu->hpBarLevels[TRADE_PLAYER][i] = GetHPBarLevel(curHp, maxHp);
        }
        break;
    case TRADE_PARTNER:
        for (i = 0; i < sTradeMenu->partyCounts[TRADE_PARTNER]; i++)
        {
            curHp = GetMonData(&gEnemyParty[i], MON_DATA_HP);
            maxHp = GetMonData(&gEnemyParty[i], MON_DATA_MAX_HP);
            sTradeMenu->hpBarLevels[TRADE_PARTNER][i] = GetHPBarLevel(curHp, maxHp);
        }
        break;
    }
}

static void SetTradePartyHPBarSprites(void)
{
    int i, j;
    for (i = 0; i < 2; i++)
    {
        for (j = 0; j < sTradeMenu->partyCounts[i]; j++)
            SetPartyHPBarSprite(&gSprites[sTradeMenu->partySpriteIds[i][j]], 4 - sTradeMenu->hpBarLevels[i][j]);
    }
}

static void SaveTradeGiftRibbons(void)
{
    int i;
    for (i = 0; i < (int)ARRAY_COUNT(sTradeMenu->giftRibbons); i++)
    {
        if (gSaveBlock1Ptr->giftRibbons[i] == 0 && sTradeMenu->giftRibbons[i] != 0)
            gSaveBlock1Ptr->giftRibbons[i] = sTradeMenu->giftRibbons[i];
    }
}

static u32 CanTradeSelectedMon(struct Pokemon * playerParty, int partyCount, int monIdx)
{
    int i, numMonsLeft;
    struct LinkPlayer * partner;
    int species[PARTY_SIZE];
    int species2[PARTY_SIZE];

    for (i = 0; i < partyCount; i++)
    {
        species2[i] = GetMonData(&playerParty[i], MON_DATA_SPECIES_OR_EGG);
        species[i] = GetMonData(&playerParty[i], MON_DATA_SPECIES);
    }

    // Cant trade Eggs or non-Kanto mons if player doesn't have National Dex
    if (!IsNationalPokedexEnabled())
    {
        // See comment below
    #ifdef BUGFIX
        if (species2[monIdx] == SPECIES_EGG)
            return CANT_TRADE_EGG_YET;
    #endif

        if (species2[monIdx] > KANTO_SPECIES_END)
            return CANT_TRADE_NATIONAL;

        // This is meant to be SPECIES_EGG. There are obviously no circumstances
        // where you're allowed to trade SPECIES_NONE, so it wouldn't make sense to
        // only check this if the National Dex is missing. SPECIES_EGG will accidentally
        // be handled instead by the conditional above. Both of these problems are fixed in Emerald.
    #ifndef BUGFIX
        if (species2[monIdx] == SPECIES_NONE)
            return CANT_TRADE_EGG_YET;
    #endif
    }

    partner = &gLinkPlayers[GetMultiplayerId() ^ 1];
    if ((partner->version & 0xFF) != VERSION_RUBY &&
        (partner->version & 0xFF) != VERSION_SAPPHIRE)
    {
        // Does partner not have National Dex
        if (!(partner->progressFlagsCopy & 0xF))
        {
            if (species2[monIdx] == SPECIES_EGG)
                return CANT_TRADE_PARTNER_EGG_YET;

            if (species2[monIdx] > KANTO_SPECIES_END)
                return CANT_TRADE_INVALID_MON;
        }
    }

    if (species[monIdx] == SPECIES_DEOXYS || species[monIdx] == SPECIES_MEW)
    {
        if (!GetMonData(&playerParty[monIdx], MON_DATA_MODERN_FATEFUL_ENCOUNTER))
            return CANT_TRADE_INVALID_MON;
    }

    // Make Eggs not count for numMonsLeft
    for (i = 0; i < partyCount; i++)
    {
        if (species2[i] == SPECIES_EGG)
            species2[i] = SPECIES_NONE;
    }

    // Count alive mons in party, excluding selected trade mon
    for (numMonsLeft = 0, i = 0; i < partyCount; i++)
    {
        if (i != monIdx)
            numMonsLeft += species2[i];
    }

    if (numMonsLeft != 0)
        return CAN_TRADE_MON;
    else
        return CANT_TRADE_LAST_MON;
}

s32 GetGameProgressForLinkTrade(void)
{
    s32 versionId; // 0: FRLG, 1: RS, 2: Emerald (or anything else)
    u16 version;

    if (gReceivedRemoteLinkPlayers)
    {
        versionId = 0;
        version = (gLinkPlayers[GetMultiplayerId() ^ 1].version & 0xFF);

        if (version == VERSION_FIRE_RED || version == VERSION_LEAF_GREEN)
            versionId = 0;
        else if (version == VERSION_RUBY || version == VERSION_SAPPHIRE)
            versionId = 1;
        else
            versionId = 2;

        // If trading with RSE, both players must have progessed the story enough
        if (versionId > 0)
        {
            // Has player finished the Sevii Islands
            if (gLinkPlayers[GetMultiplayerId()].progressFlagsCopy & 0xF0)
            {
                if (versionId == 2)
                {
                    // Is RSE partner champion
                    if (gLinkPlayers[GetMultiplayerId() ^ 1].progressFlagsCopy & 0xF0)
                        return TRADE_BOTH_PLAYERS_READY;
                    else
                        return TRADE_PARTNER_NOT_READY;
                }
            }
            else
            {
                return TRADE_PLAYER_NOT_READY;
            }
        }
    }
    return TRADE_BOTH_PLAYERS_READY;
}

static bool32 IsDeoxysOrMewUntradable(u16 species, bool8 isModernFatefulEncounter)
{
    if (species == SPECIES_DEOXYS || species == SPECIES_MEW)
    {
        if (!isModernFatefulEncounter)
            return TRUE;
    }
    return FALSE;
}

int GetUnionRoomTradeMessageId(struct RfuGameCompatibilityData player, struct RfuGameCompatibilityData partner, u16 playerSpecies2, u16 partnerSpecies, u8 requestedType, u16 playerSpecies, bool8 isModernFatefulEncounter)
{
    bool8 playerHasNationalDex = player.hasNationalDex;
    bool8 playerCanLinkNationally = player.canLinkNationally;
    bool8 partnerHasNationalDex = partner.hasNationalDex;
    bool8 partnerCanLinkNationally = partner.canLinkNationally;
    u8 partnerVersion = partner.version;
    bool8 isNotFRLG;

    if (partnerVersion == VERSION_FIRE_RED || partnerVersion == VERSION_LEAF_GREEN)
        isNotFRLG = FALSE;
    else
        isNotFRLG = TRUE;

    // If partner is not using FRLG, both players must have progressed the story
    // to a certain point (becoming champion in RSE, finishing the Sevii islands in FRLG)
    if (isNotFRLG)
    {
        if (!playerCanLinkNationally)
            return UR_TRADE_MSG_CANT_TRADE_WITH_PARTNER_1;
        else if (!partnerCanLinkNationally)
            return UR_TRADE_MSG_CANT_TRADE_WITH_PARTNER_2;
    }

    // Cannot trade illegitimate Deoxys/Mew
    if (IsDeoxysOrMewUntradable(playerSpecies, isModernFatefulEncounter))
        return UR_TRADE_MSG_MON_CANT_BE_TRADED_2;

    if (partnerSpecies == SPECIES_EGG)
    {
        // If partner is trading an Egg then the player must also be trading an Egg
        if (playerSpecies2 != partnerSpecies)
            return UR_TRADE_MSG_NOT_EGG;
    }
    else
    {
        // Player's Pokémon must be of the type the partner requested
        if (gSpeciesInfo[playerSpecies2].types[0] != requestedType
         && gSpeciesInfo[playerSpecies2].types[1] != requestedType)
            return UR_TRADE_MSG_NOT_MON_PARTNER_WANTS;
    }

    // If the player is trading an Egg then the partner must also be trading an Egg
    // Odd that this wasn't checked earlier, as by this point we know either the partner doesn't have an Egg or that both do.
    if (playerSpecies2 == SPECIES_EGG && playerSpecies2 != partnerSpecies)
        return UR_TRADE_MSG_MON_CANT_BE_TRADED_1;

    // If the player doesn't have the National Dex then Eggs and non-Kanto Pokémon can't be traded
    if (!playerHasNationalDex)
    {
        if (playerSpecies2 == SPECIES_EGG)
            return UR_TRADE_MSG_EGG_CANT_BE_TRADED;

        if (playerSpecies2 > KANTO_SPECIES_END)
            return UR_TRADE_MSG_MON_CANT_BE_TRADED_2;

        if (partnerSpecies > KANTO_SPECIES_END)
            return UR_TRADE_MSG_PARTNERS_MON_CANT_BE_TRADED;
    }

    // If the partner doesn't have the National Dex then the player's offer has to be a Kanto Pokémon
    if (!partnerHasNationalDex && playerSpecies2 > KANTO_SPECIES_END)
        return UR_TRADE_MSG_PARTNER_CANT_ACCEPT_MON;

    // Trade is allowed
    return UR_TRADE_MSG_NONE;
}

int CanRegisterMonForTradingBoard(struct RfuGameCompatibilityData player, u16 species2, u16 species, bool8 isModernFatefulEncounter)
{
    bool8 hasNationalDex = player.hasNationalDex;

    if (IsDeoxysOrMewUntradable(species, isModernFatefulEncounter))
        return CANT_REGISTER_MON;

    if (hasNationalDex)
        return CAN_REGISTER_MON;

    // Eggs can only be traded if the player has the National Dex
    if (species2 == SPECIES_EGG)
        return CANT_REGISTER_EGG;

    if (species2 > KANTO_SPECIES_END && species2 != SPECIES_EGG)
        return CANT_REGISTER_MON;

    return CAN_REGISTER_MON;
}
