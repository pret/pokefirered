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

#define NUM_TRADED_GIFT_RIBBONS 11

struct TradeMenuResources
{
    /*0x0000*/ u8 bg2hofs;
    /*0x0001*/ u8 bg3hofs;
    /*0x0002*/ u8 filler_2[0x28 - 2];
    /*0x0028*/ u8 partyIcons[2][PARTY_SIZE];
    /*0x0034*/ u8 tradeMenuCursorSpriteIdx;
    /*0x0035*/ u8 tradeMenuCursorPosition;
    /*0x0036*/ u8 partyCounts[2];
    /*0x0038*/ bool8 tradeMenuOptionsActive[13];
    /*0x0045*/ bool8 battleableFlags[2][PARTY_SIZE];
    /*0x0051*/ bool8 eggFlags[2][PARTY_SIZE];
    /*0x005D*/ u8 hpBarLevels[2][PARTY_SIZE];
    /*0x0069*/ u8 state;
    /*0x006A*/ u8 filler_6A[0x6F - 0x6A];
    /*0x006F*/ u8 tradeMenuCBnum;
    /*0x0070*/ u8 unk_70;
    /*0x0072*/ u16 cursorStartTile;
    /*0x0074*/ u8 menuRedrawState[2];
    /*0x0076*/ u8 menuRedrawCursorPos[2];
    /*0x0078*/ u8 unk_78;
    /*0x0079*/ u8 unk_79;
    /*0x007A*/ u8 unk_7A;
    /*0x007B*/ u8 unk_7B;
    /*0x007C*/ u8 filler_7C[0x7E - 0x7C];
    /*0x007E*/ u8 otherPlayerCursorPosition;
    /*0x0080*/ u16 linkData[20];
    /*0x00A8*/ u8 loadUISpritesState;
    /*0x00A9*/ u8 giftRibbons[NUM_TRADED_GIFT_RIBBONS];
    /*0x00B4*/ u8 filler_B4[0x8D0-0xB4];
    /*0x08D0*/ struct {
        bool8 active;
        u16 delay;
        u8 kind;
    } cron[4];
    /*0x08F0*/ u16 tilemapBuffer[BG_SCREEN_SIZE / 2];
};

enum TradeStatusMsg
{
    TRADESTATMSG_COMMSTANDBY = 0,
    TRADESTATMSG_CANCELED,
    TRADESTATMSG_ONLYMON,
    TRADESTATMSG_ONLYMON2,
    TRADESTATMSG_WAITINGFORFRIEND,
    TRADESTATMSG_FRIENDWANTSTOTRADE,
    TRADESTATMSG_YOURMONCANTBETRADED,
    TRADESTATMSG_EGGCANTBETRADED,
    TRADESTATMSG_PARTNERMONCANTBETRADED
};

static EWRAM_DATA u8 *sSpriteTextTileBuffer = NULL;
static EWRAM_DATA u8 *sSpriteTextTilePtrs[14] = {};
EWRAM_DATA struct Mail gLinkPartnerMail[6] = {};
EWRAM_DATA u8 gSelectedTradeMonPositions[2] = {0};
static EWRAM_DATA struct TradeMenuResources * sTradeMenuResourcesPtr = NULL;

static void CB2_ReturnFromLinkTrade2(void);
static void VblankCB_Trade(void);
static void CB2_TradeMenu(void);
static void LoadTradeBackgroundGfxAndPals(u8 state);
static void SetTradeMenuOptionActiveFlags(void);
static u8 shedinja_maker_maybe(void);
static void CB1_HandleBlockReceive(void);
static void RunTradeMenuCallback(void);
static void SignalRedrawTradeMenus(u8 a0);
static void HandleRedrawTradeMenuOnSide(u8 side);
static u8 GetNicknameStringWidthByPartyAndMonIdx(u8 *str, u8 whichParty, u8 partyIdx);
static void BuildMovesString(u8 *str, u8 whichParty, u8 partyIdx);
static void PrintPartyNicknames(u8 side);
static void PrintLevelAndGenderDirectlyOnVram(u8 a0, u8 partyIdx, u8 a2, u8 a3, u8 a4, u8 a5);
static void PrintPartyLevelsAndGendersDirectlyOnVram(u8 side);
static void PrintTradePartnerPartyNicknames(void);
static void RedrawPartyWindow(u8 a0);
static void TradeMenuAction_Summary(u8 taskId);
static void TradeMenuAction_Trade(u8 taskId);
static void ScheduleLinkTaskWithDelay(u16 delay, u8 kind);
static void RunScheduledLinkTasks(void);
static void PrintTradeErrorOrStatusMessage(u8 strIdx);
static bool8 LoadUISprites(void);
static void RenderTextToVramViaBuffer(const u8 *name, u8 *a1, u8 unused);
static void ComputePartyTradeableFlags(u8 side);
static void ComputePartyHPBarLevels(u8 side);
static void SetMonIconsAnimByHPBarLevel(void);
static void CopyGiftRibbonsToSav1(void);
static u32 TestWhetherSelectedMonCanBeTraded(struct Pokemon * party, int partyCount, int cursorPos);

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

static const struct OamData gOamData_8261C30 = {
    .shape = SPRITE_SHAPE(32x16),
    .size = SPRITE_SIZE(32x16),
    .priority = 1
};

static const struct OamData gOamData_8261C38 = {
    .shape = SPRITE_SHAPE(64x32),
    .size = SPRITE_SIZE(64x32),
    .priority = 1
};

static const union AnimCmd gSpriteAnim_8261C40[] = {
    ANIMCMD_FRAME(0x00, 5),
    ANIMCMD_END
};

static const union AnimCmd gSpriteAnim_8261C48[] = {
    ANIMCMD_FRAME(0x20, 5),
    ANIMCMD_END
};

static const union AnimCmd *const gSpriteAnimTable_8261C50[] = {
    gSpriteAnim_8261C40,
    gSpriteAnim_8261C48
};

static const struct SpriteSheet sTradeButtons_SpriteSheet = {
    gTradeButtons_Gfx,
    0x800,
    300
};

static const struct SpritePalette sTradeButtons_SpritePal = {
    gTradeButtons_Pal,
    2345
};


static const union AnimCmd gSpriteAnim_8261C68[] = {
    ANIMCMD_FRAME(0x00, 5),
    ANIMCMD_END
};

static const union AnimCmd gSpriteAnim_8261C70[] = {
    ANIMCMD_FRAME(0x08, 5),
    ANIMCMD_END
};

static const union AnimCmd gSpriteAnim_8261C78[] = {
    ANIMCMD_FRAME(0x10, 5),
    ANIMCMD_END
};

static const union AnimCmd gSpriteAnim_8261C80[] = {
    ANIMCMD_FRAME(0x18, 5),
    ANIMCMD_END
};

static const union AnimCmd gSpriteAnim_8261C88[] = {
    ANIMCMD_FRAME(0x20, 5),
    ANIMCMD_END
};

static const union AnimCmd gSpriteAnim_8261C90[] = {
    ANIMCMD_FRAME(0x28, 5),
    ANIMCMD_END
};

static const union AnimCmd *const gSpriteAnimTable_8261C98[] = {
    gSpriteAnim_8261C68,
    gSpriteAnim_8261C70,
    gSpriteAnim_8261C78,
    gSpriteAnim_8261C80,
    gSpriteAnim_8261C88,
    gSpriteAnim_8261C90
};

static const struct SpriteTemplate sSpriteTemplate_TradeButtons = {
    .tileTag = 300,
    .paletteTag = 2345,
    .oam = &gOamData_8261C38,
    .anims = gSpriteAnimTable_8261C50,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct SpriteTemplate sSpriteTemplate_Text = {
    .tileTag = 200,
    .paletteTag = 4925,
    .oam = &gOamData_8261C30,
    .anims = gSpriteAnimTable_8261C98,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const u16 sTradeTextPal[] = INCBIN_U16("graphics/trade/text.gbapal");

static const struct SpritePalette sSpritePalette_Text = {
    sTradeTextPal,
    4925
};

#define DIR_UP    0
#define DIR_DOWN  1
#define DIR_LEFT  2
#define DIR_RIGHT 3

static const u8 sCursorMoveDestinations[][4][6] = {
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

static const u8 sTradeMonSpriteCoords[][2] = {
    {0x01, 0x05},
    {0x08, 0x05},
    {0x01, 0x0a},
    {0x08, 0x0a},
    {0x01, 0x0f},
    {0x08, 0x0f},

    {0x10, 0x05},
    {0x17, 0x05},
    {0x10, 0x0a},
    {0x17, 0x0a},
    {0x10, 0x0f},
    {0x17, 0x0f},

    {0x17, 0x12},
};

static const u8 sTradeMenuGenderLevelPrintCoords[][2][2] = {
    {
        {0x05, 0x04},
        {0x0c, 0x04},
    },
    {
        {0x05, 0x09},
        {0x0c, 0x09},
    },
    {
        {0x05, 0x0e},
        {0x0c, 0x0e}
    },
    {
        {0x14, 0x04},
        {0x1b, 0x04},
    },
    {
        {0x14, 0x09},
        {0x1b, 0x09},
    },
    {
        {0x14, 0x0e},
        {0x1b, 0x0e},
    },
};

static const u8 sTradeMenuGenderLevelWindowCoords[][2][2] = {
    {
        {0x01, 0x03},
        {0x08, 0x03},
    },
    {
        {0x01, 0x08},
        {0x08, 0x08},
    },
    {
        {0x01, 0x0d},
        {0x08, 0x0d}
    },
    {
        {0x10, 0x03},
        {0x17, 0x03},
    },
    {
        {0x10, 0x08},
        {0x17, 0x08},
    },
    {
        {0x10, 0x0d},
        {0x17, 0x0d},
    },
};

static const u8 sTradeUnknownSpriteCoords[][4] = {
    {0x3c, 0x09, 0xb4, 0x09},
    {0x30, 0x09, 0xa8, 0x09}
};

static const u8 gUnknown_8261E92[] = {
    0x00, 0x0e, 0x0f, 0x1d,
    0x03, 0x05, 0x03, 0x07,
    0x12, 0x05, 0x12, 0x07,
    0x08, 0x07, 0x16, 0x0c,
    0x08, 0x07, 0x16, 0x0c,
    0x06, 0x07, 0x18, 0x0c,
    0x06, 0x07, 0x18, 0x0c,
    0x08, 0x07, 0x16, 0x0c,
    0x07, 0x07, 0x17, 0x0c
};

const u8 sText_Dummy[] = _("");
const u8 sText_ClrWhtHltTranspShdwDrkGry[] = _("{COLOR WHITE}{HIGHLIGHT TRANSPARENT}{SHADOW DARK_GRAY}");
const u8 gText_MaleSymbol4[] = _("♂");
const u8 gText_FemaleSymbol4[] = _("♀");
const u8 gText_GenderlessSymbol[] = _("");
const u8 sText_Dummy2[] = _("");
const u8 sText_Newline[] = _("\n");
const u8 sText_Slash[] = _("/");

enum TradeUIText
{
    TRADEUITEXT_CANCEL = 0,
    TRADEUITEXT_CHOOSE,
    TRADEUITEXT_SUMMARY,
    TRADEUITEXT_TRADE,
    TRADEUITEXT_ASKCANCEL,
    TRADEUITEXT_PRESSBTOEXIT
};

static const u8 *const sTradeUITextPtrs[] = {
    gTradeText_Cancel,
    gTradeText_ChooseAPokemon,
    gTradeText_Summary,
    gTradeText_Trade,
    gTradeText_CancelTrade,
    gTradeText_PressBButtonToExit
};

static const struct MenuAction sMenuAction_SummaryTrade[] = {
    {gUnknown_841E10A, { .void_u8 = TradeMenuAction_Summary }},
    {gUnknown_841E112, { .void_u8 = TradeMenuAction_Trade }}
};

static const u8 *const sTradeErrorOrStatusMessagePtrs[] = {
    gUnknown_841E118, // Communication standby
    gUnknown_841E145, // The trade has been canceled.
    gUnknown_841E16B, // That's your only POKéMON for battle
    gUnknown_8417094, // That's your only POKéMON for battle
    gUnknown_841E199, // Waiting for your friend to finish
    gUnknown_841E1C5, // Your friend wants to trade POKéMON
    gText_PkmnCantBeTradedNow, // That POKéMON can't be traded now
    gText_EggCantBeTradedNow, // An EGG can't be traded now
    gText_OtherTrainersPkmnCantBeTraded  // The other TRAINER's POKéMON can't be traded now
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

static const u8 gUnknown_8261FCC[][13] = {
    _("かいめの そうしん"),
    _("かいめの じゅしん"),
    _("ポケモンアイコンセット"),
    _("OBJテキストセット"),
    _("セルセット"),
    _("OBJテキストADD"),
    _("システムメッセージADD"),
    _("はいけいセット")
};

static const u8 gJPText_Shedinja[] = _("ヌケニン");
static const u8 gUnknown_8262039[] = _("こうかんせいりつ     ");
static const u8 gUnknown_8262047[] = _("だめだたらしいよ     ");

static const u8 gUnknown_8262055[][2] = {
    { 4,  3},
    {19,  3}
};

static void InitTradeMenuResources(void)
{
    int i;
    static u16 dummy;

    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
    ResetPaletteFade();
    gPaletteFade.bufferTransferDisabled = TRUE;
    SetVBlankCallback(VblankCB_Trade);
    LoadPalette(gTMCaseMainWindowPalette, 0xF0, 0x14);
    LoadPalette(gTMCaseMainWindowPalette, 0xD0, 0x14);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, sBgTemplates, NELEMS(sBgTemplates));
    SetBgTilemapBuffer(1, sTradeMenuResourcesPtr->tilemapBuffer);
    if (InitWindows(sWindowTemplates))
    {
        DeactivateAllTextPrinters();
        dummy = 590; // ?
        for (i = 0; i < NELEMS(sWindowTemplates) - 1; i++)
        {
            ClearWindowTilemap(i);
            FillWindowPixelBuffer(i, PIXEL_FILL(0));
        }
        FillBgTilemapBufferRect(0, 0, 0, 0, 30, 20, 0xF);
        TextWindow_SetStdFrame0_WithPal(0, 0x014, 0xC0);
        TextWindow_SetUserSelectedFrame(2, 0x001, 0xE0);
        LoadMonIconPalettes();
        sTradeMenuResourcesPtr->state = 0;
        sTradeMenuResourcesPtr->tradeMenuCBnum = 0;
        sTradeMenuResourcesPtr->unk_70 = 0;
        sTradeMenuResourcesPtr->menuRedrawState[0] = 0;
        sTradeMenuResourcesPtr->menuRedrawState[1] = 0;
        sTradeMenuResourcesPtr->unk_7A = 0;
        sTradeMenuResourcesPtr->unk_7B = 0;
        sTradeMenuResourcesPtr->loadUISpritesState = 0;
    }
}

void CB2_ReturnFromLinkTrade(void)
{
    SetMainCallback2(CB2_ReturnFromLinkTrade2);
}

static void CB2_ReturnFromLinkTrade2(void)
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
        sTradeMenuResourcesPtr = AllocZeroed(sizeof(*sTradeMenuResourcesPtr));
        InitTradeMenuResources();
        sSpriteTextTileBuffer = AllocZeroed(0xE00);

        for (i = 0; i < 14; i++)
        {
            sSpriteTextTilePtrs[i] = &sSpriteTextTileBuffer[i * 256];
        }

        gMain.state++;
        break;
    case 1:
        gPaletteFade.bufferTransferDisabled = FALSE;

        for (i = 0; i < PARTY_SIZE; i++)
        {
            CreateMon(&gEnemyParty[i], SPECIES_NONE, 0, 0x20, FALSE, 0, OT_ID_PLAYER_ID, 0);
        }

        PrintTradeErrorOrStatusMessage(TRADESTATMSG_COMMSTANDBY);
        ShowBg(0);

        if (!gReceivedRemoteLinkPlayers)
        {
            gLinkType = 0x1122;
            sTradeMenuResourcesPtr->loadUISpritesState = 0;

            if (gWirelessCommType)
            {
                SetWirelessCommType1();
                OpenLink();
                LinkRfu_CreateIdleTask();
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
        sTradeMenuResourcesPtr->loadUISpritesState++;
        if (sTradeMenuResourcesPtr->loadUISpritesState > 11)
        {
            sTradeMenuResourcesPtr->loadUISpritesState = 0;
            gMain.state++;
        }
        break;
    case 3:
        if (GetLinkPlayerCount_2() >= GetSavedPlayerCount())
        {
            if (IsLinkMaster())
            {
                if (++sTradeMenuResourcesPtr->loadUISpritesState > 30)
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
            LinkRfu_DestroyIdleTask();
            CalculatePlayerPartyCount();
            gMain.state++;
            sTradeMenuResourcesPtr->loadUISpritesState = 0;
            if (gWirelessCommType)
            {
                ToggleLMANlinkRecovery(TRUE);
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
        if (shedinja_maker_maybe())
        {
            CopyGiftRibbonsToSav1();
            gMain.state++;
        }
        break;
    case 7:
        CalculateEnemyPartyCount();
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        sTradeMenuResourcesPtr->partyCounts[0] = gPlayerPartyCount;
        sTradeMenuResourcesPtr->partyCounts[1] = gEnemyPartyCount;

        for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[0]; i++)
        {
            struct Pokemon * mon = &gPlayerParty[i];
            sTradeMenuResourcesPtr->partyIcons[0][i] = CreateMonIcon(GetMonData(mon, MON_DATA_SPECIES2),
                                                                SpriteCB_MonIcon,
                                                                (sTradeMonSpriteCoords[i][0] * 8) + 14,
                                                                (sTradeMonSpriteCoords[i][1] * 8) - 12,
                                                                1,
                                                                GetMonData(mon, MON_DATA_PERSONALITY),
                                                                TRUE);
        }

        for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[1]; i++)
        {
            struct Pokemon * mon = &gEnemyParty[i];
            sTradeMenuResourcesPtr->partyIcons[1][i] = CreateMonIcon(GetMonData(mon, MON_DATA_SPECIES2, NULL),
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
        DrawHeldItemIconsForTrade(sTradeMenuResourcesPtr->partyCounts, sTradeMenuResourcesPtr->partyIcons[0], 0);
        gMain.state++;
        break;
    case 9:
        DrawHeldItemIconsForTrade(sTradeMenuResourcesPtr->partyCounts, sTradeMenuResourcesPtr->partyIcons[0], 1);
        gMain.state++;
        break;
    case 10:
        DrawTextWindowAndBufferTiles(gSaveBlock2Ptr->playerName, sSpriteTextTilePtrs[0], 0, 0, gDecompressionBuffer, 3);
        id = GetMultiplayerId();
        DrawTextWindowAndBufferTiles(gLinkPlayers[id ^ 1].name, sSpriteTextTilePtrs[3], 0, 0, gDecompressionBuffer, 3);
        DrawTextWindowAndBufferTiles(sTradeUITextPtrs[TRADEUITEXT_CANCEL], sSpriteTextTilePtrs[6], 0, 0, gDecompressionBuffer, 2);
        RenderTextToVramViaBuffer(sTradeUITextPtrs[TRADEUITEXT_CHOOSE], sSpriteTextTilePtrs[8], 24);
        gMain.state++;
        sTradeMenuResourcesPtr->loadUISpritesState = 0;
        break;
    case 11:
        if (LoadUISprites())
            gMain.state++;
        break;
    case 12:
        name = gSaveBlock2Ptr->playerName;
        width = GetStringWidth(FONT_1, name, 0);
        xPos = (56 - width) / 2;
        for (i = 0; i < 3; i++)
        {
            temp = sSpriteTemplate_Text;
            temp.tileTag += i;
            CreateSprite(&temp, xPos + sTradeUnknownSpriteCoords[LANGUAGE_ENGLISH - 1][0] + (i * 32), sTradeUnknownSpriteCoords[LANGUAGE_ENGLISH - 1][1], 1);
        }
        id = GetMultiplayerId();
        name = gLinkPlayers[id ^ 1].name;
        width = GetStringWidth(FONT_1, name, 0);
        xPos = (56 - width) / 2;
        for (i = 0; i < 3; i++)
        {
            temp = sSpriteTemplate_Text;
            temp.tileTag += i + 3;
            CreateSprite(&temp, xPos + sTradeUnknownSpriteCoords[LANGUAGE_ENGLISH - 1][2] + (i * 32), sTradeUnknownSpriteCoords[LANGUAGE_ENGLISH - 1][3], 1);
        }
        gMain.state++;
        break;
    case 13:
        temp = sSpriteTemplate_Text;
        temp.tileTag += 6;
        CreateSprite(&temp, 215, 151, 1);
        temp = sSpriteTemplate_Text;
        temp.tileTag += 7;
        CreateSprite(&temp, 247, 151, 1);

        for (i = 0; i < PARTY_SIZE; i++)
        {
            temp = sSpriteTemplate_Text;
            temp.tileTag += i + 8;
            CreateSprite(&temp, (i * 32) + 24, 150, 1);
        }

        sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx = CreateSprite(&sSpriteTemplate_TradeButtons, sTradeMonSpriteCoords[0][0] * 8 + 32, sTradeMonSpriteCoords[0][1] * 8, 2);
        sTradeMenuResourcesPtr->tradeMenuCursorPosition = 0;
        gMain.state++;
        rbox_fill_rectangle(0);
        break;
    case 14:
        ComputePartyTradeableFlags(0);
        PrintPartyNicknames(0);
        sTradeMenuResourcesPtr->bg2hofs = 0;
        sTradeMenuResourcesPtr->bg3hofs = 0;
        SetTradeMenuOptionActiveFlags();
        gMain.state++;
        PlayBGM(MUS_GAME_CORNER);
        break;
    case 15:
        ComputePartyTradeableFlags(1);
        PrintPartyNicknames(1);
        gMain.state++;
        // fallthrough
    case 16:
        LoadTradeBackgroundGfxAndPals(0);
        gMain.state++;
        break;
    case 17:
        LoadTradeBackgroundGfxAndPals(1);
        gMain.state++;
        break;
    case 18:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        gMain.state++;
        break;
    case 19:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
        LoadTradeBackgroundGfxAndPals(2);
        gMain.state++;
        break;
    case 20:
        ComputePartyHPBarLevels(0);
        gMain.state++;
        break;
    case 21:
        ComputePartyHPBarLevels(1);
        SetMonIconsAnimByHPBarLevel();
        gMain.state++;
        break;
    case 22:
        if (!gPaletteFade.active)
        {
            gMain.callback1 = CB1_HandleBlockReceive;
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
        InitTradeMenuResources();
        gMain.state++;
        break;
    case 1:
        gMain.state++;
        sTradeMenuResourcesPtr->loadUISpritesState = 0;
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
        sTradeMenuResourcesPtr->partyCounts[0] = gPlayerPartyCount;
        sTradeMenuResourcesPtr->partyCounts[1] = gEnemyPartyCount;
        ClearWindowTilemap(0);
        PrintPartyNicknames(0);
        PrintPartyNicknames(1);
        for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[0]; i++)
        {
            sTradeMenuResourcesPtr->partyIcons[0][i] = CreateMonIcon(
                GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2, NULL),
                SpriteCB_MonIcon,
                sTradeMonSpriteCoords[i][0] * 8 + 14,
                sTradeMonSpriteCoords[i][1] * 8 - 12,
                1,
                GetMonData(&gPlayerParty[i], MON_DATA_PERSONALITY),
                TRUE
            );
        }
        for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[1]; i++)
        {
            sTradeMenuResourcesPtr->partyIcons[1][i] = CreateMonIcon(
                GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2, NULL),
                SpriteCB_MonIcon,
                sTradeMonSpriteCoords[i + 6][0] * 8 + 14,
                sTradeMonSpriteCoords[i + 6][1] * 8 - 12,
                1,
                GetMonData(&gEnemyParty[i], MON_DATA_PERSONALITY),
                FALSE
            );
        }
        gMain.state++;
        break;
    case 8:
        LoadHeldItemIcons();
        DrawHeldItemIconsForTrade(sTradeMenuResourcesPtr->partyCounts, sTradeMenuResourcesPtr->partyIcons[0], 0);
        gMain.state++;
        break;
    case 9:
        DrawHeldItemIconsForTrade(sTradeMenuResourcesPtr->partyCounts, sTradeMenuResourcesPtr->partyIcons[0], 1);
        gMain.state++;
        break;
    case 10:
        DrawTextWindowAndBufferTiles(gSaveBlock2Ptr->playerName, sSpriteTextTilePtrs[0], 0, 0, gDecompressionBuffer, 3);
        id = GetMultiplayerId();
        DrawTextWindowAndBufferTiles(gLinkPlayers[id ^ 1].name, sSpriteTextTilePtrs[3], 0, 0, gDecompressionBuffer, 3);
        DrawTextWindowAndBufferTiles(sTradeUITextPtrs[TRADEUITEXT_CANCEL], sSpriteTextTilePtrs[6], 0, 0, gDecompressionBuffer, 2);
        RenderTextToVramViaBuffer(sTradeUITextPtrs[TRADEUITEXT_CHOOSE], sSpriteTextTilePtrs[8], 24);
        gMain.state++;
        sTradeMenuResourcesPtr->loadUISpritesState = 0;
        break;
    case 11:
        if (LoadUISprites())
        {
            gMain.state++;
        }
        break;
    case 12:
        name = gSaveBlock2Ptr->playerName;
        width = GetStringWidth(FONT_1, name, 0);
        xPos = (56 - width) / 2;
        for (i = 0; i < 3; i++)
        {
            temp = sSpriteTemplate_Text;
            temp.tileTag += i;
            CreateSprite(&temp, xPos + sTradeUnknownSpriteCoords[LANGUAGE_ENGLISH - 1][0] + (i * 32), sTradeUnknownSpriteCoords[LANGUAGE_ENGLISH - 1][1], 1);
        }
        id = GetMultiplayerId();
        name = gLinkPlayers[id ^ 1].name;
        width = GetStringWidth(FONT_1, name, 0);
        xPos = (56 - width) / 2;
        for (i = 0; i < 3; i++)
        {
            temp = sSpriteTemplate_Text;
            temp.tileTag += i + 3;
            CreateSprite(&temp, xPos + sTradeUnknownSpriteCoords[LANGUAGE_ENGLISH - 1][2] + (i * 32), sTradeUnknownSpriteCoords[LANGUAGE_ENGLISH - 1][3], 1);
        }
        gMain.state++;
        break;
    case 13:
        temp = sSpriteTemplate_Text;
        temp.tileTag += 6;
        CreateSprite(&temp, 215, 151, 1);
        temp = sSpriteTemplate_Text;
        temp.tileTag += 7;
        CreateSprite(&temp, 247, 151, 1);

        for (i = 0; i < PARTY_SIZE; i++)
        {
            temp = sSpriteTemplate_Text;
            temp.tileTag += i + 8;
            CreateSprite(&temp, (i * 32) + 24, 150, 1);
        }

        if (sTradeMenuResourcesPtr->tradeMenuCursorPosition < 6)
            sTradeMenuResourcesPtr->tradeMenuCursorPosition = GetLastViewedMonIndex();
        else
            sTradeMenuResourcesPtr->tradeMenuCursorPosition = GetLastViewedMonIndex() + 6;

        sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx = CreateSprite(&sSpriteTemplate_TradeButtons, sTradeMonSpriteCoords[sTradeMenuResourcesPtr->tradeMenuCursorPosition][0] * 8 + 32, sTradeMonSpriteCoords[sTradeMenuResourcesPtr->tradeMenuCursorPosition][1] * 8, 2);
        gMain.state = 16;
        break;
    case 16:
        LoadTradeBackgroundGfxAndPals(0);
        gMain.state++;
        break;
    case 17:
        LoadTradeBackgroundGfxAndPals(1);
        sTradeMenuResourcesPtr->bg2hofs = 0;
        sTradeMenuResourcesPtr->bg3hofs = 0;
        SetTradeMenuOptionActiveFlags();
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
        LoadTradeBackgroundGfxAndPals(2);
        gMain.state++;
        break;
    case 20:
        gMain.state++;
        break;
    case 21:
        SetMonIconsAnimByHPBarLevel();
        gMain.state++;
        break;
    case 22:
        if (!gPaletteFade.active)
        {
            SetMainCallback2(CB2_TradeMenu);
        }
        break;
    }

    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void VblankCB_Trade(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void TradeMenuCB_9(void)
{
    if (++sTradeMenuResourcesPtr->loadUISpritesState >= 16)
    {
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        sTradeMenuResourcesPtr->tradeMenuCBnum = 10;
    }
}

static void TradeMenuCB_10(void)
{
    if (!gPaletteFade.active)
    {
        gSelectedTradeMonPositions[0] = sTradeMenuResourcesPtr->tradeMenuCursorPosition;
        gSelectedTradeMonPositions[1] = sTradeMenuResourcesPtr->otherPlayerCursorPosition;
        if (gWirelessCommType != 0)
        {
            sTradeMenuResourcesPtr->tradeMenuCBnum = 16;
        }
        else
        {
            Link_StartSend5FFFwithParam(32);
            sTradeMenuResourcesPtr->tradeMenuCBnum = 13;
        }
    }
}

static void TradeMenuCB_13(void)
{
    gMain.savedCallback = CB2_ReturnFromLinkTrade;
    if (gWirelessCommType != 0)
    {
        if (IsLinkRfuTaskFinished())
        {
            Free(sSpriteTextTileBuffer);
            FreeAllWindowBuffers();
            Free(sTradeMenuResourcesPtr);
            gMain.callback1 = NULL;
            DestroyWirelessStatusIndicatorSprite();
            SetMainCallback2(CB2_InitTradeAnim_LinkTrade);
        }
    }
    else
    {
        if (!gReceivedRemoteLinkPlayers)
        {
            Free(sSpriteTextTileBuffer);
            FreeAllWindowBuffers();
            Free(sTradeMenuResourcesPtr);
            gMain.callback1 = NULL;
            SetMainCallback2(CB2_InitTradeAnim_LinkTrade);
        }
    }
}

static void CB2_TradeMenu(void)
{
    RunTradeMenuCallback();
    RunScheduledLinkTasks();
    HandleRedrawTradeMenuOnSide(0);
    HandleRedrawTradeMenuOnSide(1);
    SetGpuReg(REG_OFFSET_BG2HOFS, sTradeMenuResourcesPtr->bg2hofs++);
    SetGpuReg(REG_OFFSET_BG3HOFS, sTradeMenuResourcesPtr->bg3hofs--);
    RunTextPrinters_CheckPrinter0Active();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void LoadTradeBackgroundGfxAndPals(u8 state)
{
    int i;

    switch (state)
    {
    case 0:
        LoadPalette(gTradeMenu_Pal, 0x00, 0x60);
        LoadBgTiles(1, gTradeMenu_Gfx, 0x1280, 0);
        CopyToBgTilemapBufferRect_ChangePalette(1, gUnknown_8E9E9FC, 0, 0, 32, 20, 0);
        LoadBgTilemap(2, sTradeStripesBG2Tilemap, 0x800, 0);
        break;
    case 1:
        LoadBgTilemap(3, sTradeStripesBG3Tilemap, 0x800, 0);
        PrintPartyLevelsAndGendersDirectlyOnVram(0);
        PrintPartyLevelsAndGendersDirectlyOnVram(1);
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

static void SetTradeMenuOptionActiveFlags(void)
{
    int i;
    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (i < sTradeMenuResourcesPtr->partyCounts[0])
        {
            gSprites[sTradeMenuResourcesPtr->partyIcons[0][i]].invisible = FALSE;
            sTradeMenuResourcesPtr->tradeMenuOptionsActive[i] = TRUE;
        }
        else
        {
            sTradeMenuResourcesPtr->tradeMenuOptionsActive[i] = FALSE;
        }
        if (i < sTradeMenuResourcesPtr->partyCounts[1])
        {
            gSprites[sTradeMenuResourcesPtr->partyIcons[1][i]].invisible = FALSE;
            sTradeMenuResourcesPtr->tradeMenuOptionsActive[i + 6] = TRUE;
        }
        else
        {
            sTradeMenuResourcesPtr->tradeMenuOptionsActive[i + 6] = FALSE;
        }
    }
    sTradeMenuResourcesPtr->tradeMenuOptionsActive[12] = TRUE;
}

static void Trade_Memcpy(void *dest, const void *src, size_t size)
{
    int i;
    char *_dest = dest;
    const char *_src = src;
    for (i = 0; i < size; i++)
        _dest[i] = _src[i];
}

static bool8 shedinja_maker_maybe(void)
{
    u8 id = GetMultiplayerId();
    int i;
    struct Pokemon * mon;

    switch (sTradeMenuResourcesPtr->state)
    {
    case 0:
        Trade_Memcpy(gBlockSendBuffer, &gPlayerParty[0], 2 * sizeof(struct Pokemon));
        sTradeMenuResourcesPtr->state++;
        sTradeMenuResourcesPtr->loadUISpritesState = 0;
        break;
    case 1:
        if (IsLinkTaskFinished())
        {
            if (GetBlockReceivedStatus() == 0)
            {
                sTradeMenuResourcesPtr->state++;
            }
            else
            {
                ResetBlockReceivedFlags();
                sTradeMenuResourcesPtr->state++;
            }
        }
        break;
    case 3:
        if (id == 0)
        {
            Link_PrepareCmd0xCCCC_Rfu0xA100(1);
        }
        sTradeMenuResourcesPtr->state++;
        break;
    case 4:
        if (GetBlockReceivedStatus() == 3)
        {
            Trade_Memcpy(&gEnemyParty[0], gBlockRecvBuffer[id ^ 1], 2 * sizeof(struct Pokemon));
            ResetBlockReceivedFlags();
            sTradeMenuResourcesPtr->state++;
        }
        break;
    case 5:
        Trade_Memcpy(gBlockSendBuffer, &gPlayerParty[2], 2 * sizeof(struct Pokemon));
        sTradeMenuResourcesPtr->state++;
        break;
    case 7:
        if (id == 0)
        {
            Link_PrepareCmd0xCCCC_Rfu0xA100(1);
        }
        sTradeMenuResourcesPtr->state++;
        break;
    case 8:
        if (GetBlockReceivedStatus() == 3)
        {
            Trade_Memcpy(&gEnemyParty[2], gBlockRecvBuffer[id ^ 1], 2 * sizeof(struct Pokemon));
            ResetBlockReceivedFlags();
            sTradeMenuResourcesPtr->state++;
        }
        break;
    case 9:
        Trade_Memcpy(gBlockSendBuffer, &gPlayerParty[4], 2 * sizeof(struct Pokemon));
        sTradeMenuResourcesPtr->state++;
        break;
    case 11:
        if (id == 0)
        {
            Link_PrepareCmd0xCCCC_Rfu0xA100(1);
        }
        sTradeMenuResourcesPtr->state++;
        break;
    case 12:
        if (GetBlockReceivedStatus() == 3)
        {
            Trade_Memcpy(&gEnemyParty[4], gBlockRecvBuffer[id ^ 1], 2 * sizeof(struct Pokemon));
            ResetBlockReceivedFlags();
            sTradeMenuResourcesPtr->state++;
        }
        break;
    case 13:
        Trade_Memcpy(gBlockSendBuffer, gSaveBlock1Ptr->mail, PARTY_SIZE * sizeof(struct Mail) + 4); // why the extra 4 bytes?
        sTradeMenuResourcesPtr->state++;
        break;
    case 15:
        if (id == 0)
        {
            Link_PrepareCmd0xCCCC_Rfu0xA100(3);
        }
        sTradeMenuResourcesPtr->state++;
        break;
    case 16:
        if (GetBlockReceivedStatus() == 3)
        {
            Trade_Memcpy(gLinkPartnerMail, gBlockRecvBuffer[id ^ 1], PARTY_SIZE * sizeof(struct Mail));
            ResetBlockReceivedFlags();
            sTradeMenuResourcesPtr->state++;
        }
        break;
    case 17:
        Trade_Memcpy(gBlockSendBuffer, gSaveBlock1Ptr->giftRibbons, NUM_TRADED_GIFT_RIBBONS);
        sTradeMenuResourcesPtr->state++;
        break;
    case 19:
        if (id == 0)
        {
            Link_PrepareCmd0xCCCC_Rfu0xA100(4);
        }
        sTradeMenuResourcesPtr->state++;
        break;
    case 20:
        if (GetBlockReceivedStatus() == 3)
        {
            Trade_Memcpy(sTradeMenuResourcesPtr->giftRibbons, gBlockRecvBuffer[id ^ 1], NUM_TRADED_GIFT_RIBBONS);
            ResetBlockReceivedFlags();
            sTradeMenuResourcesPtr->state++;
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

                    if (!StringCompareWithoutExtCtrlCodes(name, gJPText_Shedinja))
                    {
                        SetMonData(mon, MON_DATA_NICKNAME, gSpeciesNames[SPECIES_SHEDINJA]);
                    }
                }
            }
        }
        return TRUE;
    case 2:
    case 6:
    case 10:
    case 14:
    case 18:
        sTradeMenuResourcesPtr->loadUISpritesState++;
        if (sTradeMenuResourcesPtr->loadUISpritesState > 10)
        {
            sTradeMenuResourcesPtr->loadUISpritesState = 0;
            sTradeMenuResourcesPtr->state++;
        }
        break;
    }
    return FALSE;
}

static void PrintIsThisTradeOkay(void)
{
    RenderTextToVramViaBuffer(gText_IsThisTradeOkay, (u8 *)OBJ_VRAM0 + sTradeMenuResourcesPtr->cursorStartTile * 32, 0x18);
}

static void Master_HandleBlockReceivedStatus(u8 mpId, u8 blockReceivedFlags)
{
    if (blockReceivedFlags & 1)
    {
        switch (gBlockRecvBuffer[0][0])
        {
        case 0xEEAA:
            sTradeMenuResourcesPtr->unk_78 = 2;
            break;
        case 0xAABB:
            sTradeMenuResourcesPtr->unk_78 = 1;
            break;
        case 0xBBBB:
            sTradeMenuResourcesPtr->unk_7A = 1;
            break;
        case 0xBBCC:
            sTradeMenuResourcesPtr->unk_7A = 2;
            break;
        }
        ResetBlockReceivedFlag(0);
    }

    if (blockReceivedFlags & 2)
    {
        switch (gBlockRecvBuffer[1][0])
        {
        case 0xEEAA:
            sTradeMenuResourcesPtr->unk_79 = 2;
            break;
        case 0xAABB:
            sTradeMenuResourcesPtr->otherPlayerCursorPosition = gBlockRecvBuffer[1][1] + 6;
            sTradeMenuResourcesPtr->unk_79 = 1;
            break;
        case 0xBBBB:
            sTradeMenuResourcesPtr->unk_7B = 1;
            break;
        case 0xBBCC:
            sTradeMenuResourcesPtr->unk_7B = 2;
            break;
        }
        ResetBlockReceivedFlag(1);
    }
}

static void Slave_HandleBlockReceivedStatus(u8 mpId, u8 blockReceivedFlags)
{
    if (blockReceivedFlags & 1)
    {
        switch (gBlockRecvBuffer[0][0])
        {
        case 0xEEBB:
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
            PrintTradeErrorOrStatusMessage(TRADESTATMSG_WAITINGFORFRIEND);
            sTradeMenuResourcesPtr->tradeMenuCBnum = 11;
            break;
        case 0xEECC:
            PrintTradeErrorOrStatusMessage(TRADESTATMSG_FRIENDWANTSTOTRADE);
            sTradeMenuResourcesPtr->tradeMenuCBnum = 8;
            break;
        case 0xDDDD:
            sTradeMenuResourcesPtr->otherPlayerCursorPosition = gBlockRecvBuffer[0][1] + 6;
            rbox_fill_rectangle(0);
            SignalRedrawTradeMenus(sTradeMenuResourcesPtr->tradeMenuCursorPosition);
            SignalRedrawTradeMenus(sTradeMenuResourcesPtr->otherPlayerCursorPosition);
            sTradeMenuResourcesPtr->tradeMenuCBnum = 7;
            break;
        case 0xCCDD:
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
            sTradeMenuResourcesPtr->tradeMenuCBnum = 10;
            break;
        case 0xDDEE:
            PrintTradeErrorOrStatusMessage(TRADESTATMSG_CANCELED);
            sTradeMenuResourcesPtr->tradeMenuCBnum = 8;
        }
        ResetBlockReceivedFlag(0);
    }

    if (blockReceivedFlags & 2)
        ResetBlockReceivedFlag(1);
}

static void Master_HandleCommunication(void)
{
    if (sTradeMenuResourcesPtr->unk_78 && sTradeMenuResourcesPtr->unk_79)
    {
        if (sTradeMenuResourcesPtr->unk_78 == 1 && sTradeMenuResourcesPtr->unk_79 == 1)
        {
            sTradeMenuResourcesPtr->tradeMenuCBnum = 6;
            sTradeMenuResourcesPtr->linkData[0] = 0xDDDD;
            sTradeMenuResourcesPtr->linkData[1] = sTradeMenuResourcesPtr->tradeMenuCursorPosition;
            ScheduleLinkTaskWithDelay(5, 0);
            sTradeMenuResourcesPtr->unk_78 = sTradeMenuResourcesPtr->unk_79 = 0;
        }
        else if (sTradeMenuResourcesPtr->unk_78 == 1 && sTradeMenuResourcesPtr->unk_79 == 2)
        {
            PrintTradeErrorOrStatusMessage(TRADESTATMSG_CANCELED);
            sTradeMenuResourcesPtr->linkData[0] = 0xEECC;
            sTradeMenuResourcesPtr->linkData[1] = 0;
            ScheduleLinkTaskWithDelay(5, 0);
            sTradeMenuResourcesPtr->unk_7A = sTradeMenuResourcesPtr->unk_7B = 0;
            sTradeMenuResourcesPtr->unk_78 = sTradeMenuResourcesPtr->unk_79 = 0;
            sTradeMenuResourcesPtr->tradeMenuCBnum = 8;
        }
        else if (sTradeMenuResourcesPtr->unk_78 == 2 && sTradeMenuResourcesPtr->unk_79 == 1)
        {
            PrintTradeErrorOrStatusMessage(TRADESTATMSG_FRIENDWANTSTOTRADE);
            sTradeMenuResourcesPtr->linkData[0] = 0xDDEE;
            sTradeMenuResourcesPtr->linkData[1] = 0;
            ScheduleLinkTaskWithDelay(5, 0);
            sTradeMenuResourcesPtr->unk_7A = sTradeMenuResourcesPtr->unk_7B = 0;
            sTradeMenuResourcesPtr->unk_78 = sTradeMenuResourcesPtr->unk_79 = 0;
            sTradeMenuResourcesPtr->tradeMenuCBnum = 8;
        }
        else if (sTradeMenuResourcesPtr->unk_78 == 2 && sTradeMenuResourcesPtr->unk_79 == 2)
        {
            sTradeMenuResourcesPtr->linkData[0] = 0xEEBB;
            sTradeMenuResourcesPtr->linkData[1] = 0;
            ScheduleLinkTaskWithDelay(5, 0);
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
            sTradeMenuResourcesPtr->unk_78 = sTradeMenuResourcesPtr->unk_79 = 0;
            sTradeMenuResourcesPtr->tradeMenuCBnum = 11;
        }
    }

    if (sTradeMenuResourcesPtr->unk_7A && sTradeMenuResourcesPtr->unk_7B)
    {
        if (sTradeMenuResourcesPtr->unk_7A == 1 && sTradeMenuResourcesPtr->unk_7B == 1)
        {
            sTradeMenuResourcesPtr->linkData[0] = 0xCCDD;
            sTradeMenuResourcesPtr->linkData[1] = 0;
            ScheduleLinkTaskWithDelay(5, 0);
            sTradeMenuResourcesPtr->unk_7A = 0;
            sTradeMenuResourcesPtr->unk_7B = 0;
            sTradeMenuResourcesPtr->tradeMenuCBnum = 9;
        }

        if (sTradeMenuResourcesPtr->unk_7A == 2 || sTradeMenuResourcesPtr->unk_7B == 2)
        {
            PrintTradeErrorOrStatusMessage(TRADESTATMSG_CANCELED);
            sTradeMenuResourcesPtr->linkData[0] = 0xDDEE;
            sTradeMenuResourcesPtr->linkData[1] = 0;
            ScheduleLinkTaskWithDelay(5, 0);
            sTradeMenuResourcesPtr->unk_7A = 0;
            sTradeMenuResourcesPtr->unk_7B = 0;
            sTradeMenuResourcesPtr->tradeMenuCBnum = 8;
        }
    }
}

static void CB1_HandleBlockReceive(void)
{
    u8 mpId = GetMultiplayerId();
    u8 status;
    if ((status = GetBlockReceivedStatus()))
    {
        if (mpId == 0)
            Master_HandleBlockReceivedStatus(mpId, status);
        else
            Slave_HandleBlockReceivedStatus(mpId, status);
    }
    if (mpId == 0)
        Master_HandleCommunication();
}

static u8 TradeMenuGetNewCursorLocation(u8 oldPosition, u8 direction)
{
    int i;
    u8 newPosition = 0;

    for (i = 0; i < 6; i++)
    {
    if (sTradeMenuResourcesPtr->tradeMenuOptionsActive[sCursorMoveDestinations[oldPosition][direction][i]] == TRUE)
        {
            newPosition = sCursorMoveDestinations[oldPosition][direction][i];
            break;
        }
    }

    return newPosition;
}


static void TradeMenuMoveCursor(u8 *tradeMenuCursorPosition, u8 direction)
{
    u8 newPosition = TradeMenuGetNewCursorLocation(*tradeMenuCursorPosition, direction);

    if (newPosition == 12) // CANCEL
    {
        StartSpriteAnim(&gSprites[sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx], 1);
        gSprites[sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx].x = 224;
        gSprites[sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx].y = 160;
    }
    else
    {
        StartSpriteAnim(&gSprites[sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx], 0);
        gSprites[sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx].x = sTradeMonSpriteCoords[newPosition][0] * 8 + 32;
        gSprites[sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx].y = sTradeMonSpriteCoords[newPosition][1] * 8;
    }

    if (*tradeMenuCursorPosition != newPosition)
    {
        PlaySE(SE_SELECT);
    }

    *tradeMenuCursorPosition = newPosition;
}

static void CommunicatePlayerSelectedMonForTrade(void)
{
    PrintTradeErrorOrStatusMessage(TRADESTATMSG_COMMSTANDBY);
    sTradeMenuResourcesPtr->tradeMenuCBnum = 5;

    if (GetMultiplayerId() == 1)
    {
        sTradeMenuResourcesPtr->linkData[0] = 0xAABB;
        sTradeMenuResourcesPtr->linkData[1] = sTradeMenuResourcesPtr->tradeMenuCursorPosition;
        SendBlock(BitmaskAllOtherLinkPlayers(), sTradeMenuResourcesPtr->linkData, 20);
    }
    else
    {
        sTradeMenuResourcesPtr->unk_78 = 1;
    }
}

static void TradeMenuCB_0(void)
{
    int i;

    if (JOY_REPT(DPAD_UP))
    {
        TradeMenuMoveCursor(&sTradeMenuResourcesPtr->tradeMenuCursorPosition, 0);
    }
    else if (JOY_REPT(DPAD_DOWN))
    {
        TradeMenuMoveCursor(&sTradeMenuResourcesPtr->tradeMenuCursorPosition, 1);
    }
    else if (JOY_REPT(DPAD_LEFT))
    {
        TradeMenuMoveCursor(&sTradeMenuResourcesPtr->tradeMenuCursorPosition, 2);
    }
    else if (JOY_REPT(DPAD_RIGHT))
    {
        TradeMenuMoveCursor(&sTradeMenuResourcesPtr->tradeMenuCursorPosition, 3);
    }

    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);

        if (sTradeMenuResourcesPtr->tradeMenuCursorPosition < 6) // PlayerParty
        {
            DrawTextBorderOuter(1, 1, 14);
            FillWindowPixelBuffer(1, PIXEL_FILL(1));
            UnionRoomAndTradeMenuPrintOptions(1, FONT_3, 16, 2, sMenuAction_SummaryTrade);
            Menu_InitCursor(1, FONT_3, 0, 0, 16, 2, 0);
            PutWindowTilemap(1);
            CopyWindowToVram(1, COPYWIN_FULL);
            sTradeMenuResourcesPtr->tradeMenuCBnum = 1;
        }
        else if (sTradeMenuResourcesPtr->tradeMenuCursorPosition < 12)
        {
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
            sTradeMenuResourcesPtr->tradeMenuCBnum = 2;
        }
        else if (sTradeMenuResourcesPtr->tradeMenuCursorPosition == 12)
        {
            CreateYesNoMenu(&sWindowTemplate_YesNo, FONT_3, 0, 2, 0x001, 14, 0);
            sTradeMenuResourcesPtr->tradeMenuCBnum = 4;
            RenderTextToVramViaBuffer(sTradeUITextPtrs[TRADEUITEXT_ASKCANCEL], (void *)OBJ_VRAM0 + sTradeMenuResourcesPtr->cursorStartTile * 32, 24);
        }
    }
    if (JOY_NEW(R_BUTTON))
    {
        for (i = 0; i < 10; i++)
            sTradeMenuResourcesPtr->linkData[i] = i;
        SendBlock(BitmaskAllOtherLinkPlayers(), sTradeMenuResourcesPtr->linkData, 20);
    }
}

static void RedrawChooseAPokemonWindow(void)
{
    PrintTradePartnerPartyNicknames();
    sTradeMenuResourcesPtr->tradeMenuCBnum = 0;
    gSprites[sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx].invisible = FALSE;
    RenderTextToVramViaBuffer(sTradeUITextPtrs[TRADEUITEXT_CHOOSE], (void *)OBJ_VRAM0 + sTradeMenuResourcesPtr->cursorStartTile * 32, 24);
}

static void TradeMenuCB_1(void)
{
    switch (Menu_ProcessInputNoWrapAround())
    {
    case MENU_B_PRESSED:
        PlaySE(SE_SELECT);
        RedrawChooseAPokemonWindow();
        break;
    case MENU_NOTHING_CHOSEN:
        break;
    case 0: // SUMMARY
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        sTradeMenuResourcesPtr->tradeMenuCBnum = 2;
        break;
    case 1: // Trade
        switch (TestWhetherSelectedMonCanBeTraded(gPlayerParty, gPlayerPartyCount, sTradeMenuResourcesPtr->tradeMenuCursorPosition))
        {
        case 0: // Can trade
            CommunicatePlayerSelectedMonForTrade();
            gSprites[sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx].invisible = TRUE;
            break;
        case 1: // Don't have enough alive mons
            ScheduleLinkTaskWithDelay(3, 3);
            sTradeMenuResourcesPtr->tradeMenuCBnum = 8;
            break;
        case 2: // Player lacks national dex
        case 4: // Partner lacks national dex
            ScheduleLinkTaskWithDelay(3, 6);
            sTradeMenuResourcesPtr->tradeMenuCBnum = 8;
            break;
        case 3: // Player lacks national dex (egg)
        case 5: // Partner lacks national dex (egg)
            ScheduleLinkTaskWithDelay(3, 7);
            sTradeMenuResourcesPtr->tradeMenuCBnum = 8;
            break;
        }
        break;
    }
}

static void TradeMenuCB_15(void)
{
    if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        RedrawChooseAPokemonWindow();
    }
}

static void TradeMenuCB_2(void)
{
    if (!gPaletteFade.active)
    {
        if (sTradeMenuResourcesPtr->tradeMenuCursorPosition < 6)
            ShowPokemonSummaryScreen(gPlayerParty, sTradeMenuResourcesPtr->tradeMenuCursorPosition, sTradeMenuResourcesPtr->partyCounts[0] - 1, CB2_ReturnToTradeMenuFromSummary, PSS_MODE_TRADE);
        else
            ShowPokemonSummaryScreen(gEnemyParty, sTradeMenuResourcesPtr->tradeMenuCursorPosition - 6, sTradeMenuResourcesPtr->partyCounts[1] - 1, CB2_ReturnToTradeMenuFromSummary, PSS_MODE_TRADE);
        FreeAllWindowBuffers();
    }
}

static u8 PlayerHasEnoughPokemonToTrade_HandleMewDeoxys(u8 *flags, u8 partyCount, u8 cursorPos)
{
    s32 i;
    u16 species;
    u8 count = 0;
    for (i = 0; i < partyCount; i++)
    {
        if (cursorPos != i)
            count += flags[i];
    }
    species = GetMonData(&gEnemyParty[sTradeMenuResourcesPtr->otherPlayerCursorPosition % 6], MON_DATA_SPECIES);
    if ((species == SPECIES_DEOXYS || species == SPECIES_MEW) && !GetMonData(&gEnemyParty[sTradeMenuResourcesPtr->otherPlayerCursorPosition % 6], MON_DATA_EVENT_LEGAL))
        return 2;
    if (count != 0)
        count = 1;
    return count;
}

static void CommunicateWhetherMonCanBeTraded(void)
{
    int i;
    u8 arr[12];

    for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[0]; i++)
    {
        arr[i] = sTradeMenuResourcesPtr->battleableFlags[0][i];
    }

    switch (PlayerHasEnoughPokemonToTrade_HandleMewDeoxys(arr, sTradeMenuResourcesPtr->partyCounts[0], sTradeMenuResourcesPtr->tradeMenuCursorPosition))
    {
    case 0:
        ScheduleLinkTaskWithDelay(3, 3);
        sTradeMenuResourcesPtr->linkData[0] = 0xBBCC;
        ScheduleLinkTaskWithDelay(180, 0);
        break;
    case 1:
        ScheduleLinkTaskWithDelay(3, 1);
        sTradeMenuResourcesPtr->linkData[0] = 0xBBBB;
        if (IsLinkTaskFinished())
        {
            SendBlock(BitmaskAllOtherLinkPlayers(), sTradeMenuResourcesPtr->linkData, 20);
        }
        break;
    case 2:
        ScheduleLinkTaskWithDelay(3, 8);
        sTradeMenuResourcesPtr->linkData[0] = 0xBBCC;
        ScheduleLinkTaskWithDelay(180, 0);
        break;
    }
}

static void TradeMenuCB_3(void)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case 0:
        CommunicateWhetherMonCanBeTraded();
        sTradeMenuResourcesPtr->tradeMenuCBnum = 100;
        PutWindowTilemap(17);
        break;
    case 1:
    case MENU_B_PRESSED:
        ScheduleLinkTaskWithDelay(3, 1);
        if (IsLinkTaskFinished())
        {
            sTradeMenuResourcesPtr->linkData[0] = 0xBBCC;
            SendBlock(BitmaskAllOtherLinkPlayers(), sTradeMenuResourcesPtr->linkData, 20);
        }
        sTradeMenuResourcesPtr->tradeMenuCBnum = 100;
        PutWindowTilemap(17);
        break;
    }
}

static void CommitWindows(void)
{
    int i;

    for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[1] - 4; i++)
    {
        PutWindowTilemap(i + 12);
        CopyWindowToVram(i + 12, COPYWIN_MAP);
    }
}

static void TradeMenuCB_4(void)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case 0:
        PrintTradeErrorOrStatusMessage(TRADESTATMSG_WAITINGFORFRIEND);
        sTradeMenuResourcesPtr->linkData[0] = 0xEEAA;
        sTradeMenuResourcesPtr->linkData[1] = 0;
        ScheduleLinkTaskWithDelay(5, 0);
        gSprites[sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx].invisible = TRUE;
        sTradeMenuResourcesPtr->tradeMenuCBnum = 100;
        CommitWindows();
        break;
    case 1:
    case MENU_B_PRESSED:
        PlaySE(SE_SELECT);
        RedrawChooseAPokemonWindow();
        break;
    }
}

static void TradeMenuCB_6(void)
{
    if (GetMultiplayerId() == 0)
    {
        rbox_fill_rectangle(0);
        SignalRedrawTradeMenus(sTradeMenuResourcesPtr->tradeMenuCursorPosition);
        SignalRedrawTradeMenus(sTradeMenuResourcesPtr->otherPlayerCursorPosition);
    }
    sTradeMenuResourcesPtr->tradeMenuCBnum = 7;
}

static void TradeMenuCB_7(void)
{
    if (sTradeMenuResourcesPtr->menuRedrawState[0] == 5 && sTradeMenuResourcesPtr->menuRedrawState[1] == 5)
    {
        PrintIsThisTradeOkay();
        sTradeMenuResourcesPtr->tradeMenuCBnum = 14;
    }
}

static void TradeMenuCB_14(void)
{
    sTradeMenuResourcesPtr->loadUISpritesState++;

    if (sTradeMenuResourcesPtr->loadUISpritesState > 120)
    {
        CreateYesNoMenu(&sWindowTemplate_YesNo, FONT_3, 0, 2, 1, 14, 0);
        sTradeMenuResourcesPtr->loadUISpritesState = 0;
        sTradeMenuResourcesPtr->tradeMenuCBnum = 3;
    }
}

static void TradeMenuCB_8(void)
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

        RedrawPartyWindow(0);
        RedrawPartyWindow(1);
        sTradeMenuResourcesPtr->tradeMenuCBnum = 0;
        gSprites[sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx].invisible = FALSE;
    }
}

static void TradeMenuCB_11(void)
{
    if (!gPaletteFade.active)
    {
        if (gWirelessCommType)
        {
            SetLinkStandbyCallback();
        }
        else
        {
            Link_StartSend5FFFwithParam(12);
        }

        sTradeMenuResourcesPtr->tradeMenuCBnum = 12;
    }
}

static void TradeMenuCB_12(void)
{
    if (gWirelessCommType)
    {
        if (IsLinkTaskFinished())
        {
            Free(sSpriteTextTileBuffer);
            Free(sTradeMenuResourcesPtr);
            FreeAllWindowBuffers();
            DestroyWirelessStatusIndicatorSprite();
            SetMainCallback2(CB2_ReturnToFieldFromMultiplayer);
        }
    }
    else
    {
        if (!gReceivedRemoteLinkPlayers)
        {
            Free(sSpriteTextTileBuffer);
            Free(sTradeMenuResourcesPtr);
            FreeAllWindowBuffers();
            SetMainCallback2(CB2_ReturnToFieldFromMultiplayer);
        }
    }
}

static void TradeMenuCB_16(void)
{
    if (!ToggleLMANlinkRecovery(FALSE))
    {
        SetLinkStandbyCallback();
        sTradeMenuResourcesPtr->tradeMenuCBnum = 13;
    }
}

static void RunTradeMenuCallback(void)
{
    switch (sTradeMenuResourcesPtr->tradeMenuCBnum)
    {
    case 0:
        TradeMenuCB_0();
        break;
    case 1:
        TradeMenuCB_1();
        break;
    case 2:
        TradeMenuCB_2();
        break;
    case 3:
        TradeMenuCB_3();
        break;
    case 4:
        TradeMenuCB_4();
        break;
    case 5:
        // nop
        break;
    case 6:
        TradeMenuCB_6();
        break;
    case 7:
        TradeMenuCB_7();
        break;
    case 8:
        TradeMenuCB_8();
        break;
    case 9:
        TradeMenuCB_9();
        break;
    case 10:
        TradeMenuCB_10();
        break;
    case 11:
        TradeMenuCB_11();
        break;
    case 12:
        TradeMenuCB_12();
        break;
    case 13:
        TradeMenuCB_13();
        break;
    case 14:
        TradeMenuCB_14();
        break;
    case 15:
        TradeMenuCB_15();
        break;
    case 16:
        TradeMenuCB_16();
        break;
    }
}

static void SignalRedrawTradeMenus(u8 monIdx)
{
    u8 whichParty = monIdx / PARTY_SIZE;

    if (sTradeMenuResourcesPtr->menuRedrawState[whichParty] == 0)
    {
        sTradeMenuResourcesPtr->menuRedrawState[whichParty] = 1;
        sTradeMenuResourcesPtr->menuRedrawCursorPos[whichParty] = monIdx;
    }
}

static void HandleRedrawTradeMenuOnSide(u8 side)
{
    s8 nameStringWidth;
    u8 nickname[20];
    u8 movesString[56];
    u8 i;
    u8 partyIdx;
    u8 whichParty;
    u8 monIdx = sTradeMenuResourcesPtr->menuRedrawCursorPos[side];

    whichParty = 1;
    if (sTradeMenuResourcesPtr->menuRedrawCursorPos[side] < PARTY_SIZE)
        whichParty = 0;
    partyIdx = monIdx % PARTY_SIZE;
    nameStringWidth = 0;

    switch (sTradeMenuResourcesPtr->menuRedrawState[side])
    {
    case 1:
        for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[side]; i++)
        {
            gSprites[sTradeMenuResourcesPtr->partyIcons[0][i + (whichParty * PARTY_SIZE)]].invisible = TRUE;
        }

        for (i = 0; i < 6; i++)
        {
            ClearWindowTilemap(i + (side * 6 + 2));
        }

        gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]].invisible = FALSE;
        gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]].data[0] = 20;
        gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]].data[2] = (sTradeMonSpriteCoords[whichParty * PARTY_SIZE][0] + sTradeMonSpriteCoords[whichParty * PARTY_SIZE + 1][0]) / 2 * 8 + 14;
        gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]].data[4] = (sTradeMonSpriteCoords[whichParty * PARTY_SIZE][1] * 8) - 12;
        StoreSpriteCallbackInData6(&gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]], SpriteCB_MonIcon);
        sTradeMenuResourcesPtr->menuRedrawState[side]++;
        StartSpriteLinearTranslationFromCurrentPos(&gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]]);
        CopyToBgTilemapBufferRect_ChangePalette(1, sTradePartyBoxTilemap, side * 15, 0, 15, 17, 0);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(0);

        if (whichParty == 0)
            PrintTradePartnerPartyNicknames();
        break;
    case 2:
        if (gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]].callback == SpriteCB_MonIcon)
            sTradeMenuResourcesPtr->menuRedrawState[side] = 3;
        break;
    case 3:
        CopyToBgTilemapBufferRect_ChangePalette(1, sTradeMovesBoxTilemap, whichParty * 15, 0, 15, 17, 0);
        CopyBgTilemapBufferToVram(1);
        gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]].x = (sTradeMonSpriteCoords[whichParty * PARTY_SIZE][0] + sTradeMonSpriteCoords[whichParty * PARTY_SIZE + 1][0]) / 2 * 8 + 14;
        gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]].y = (sTradeMonSpriteCoords[whichParty * PARTY_SIZE][1] * 8) - 12;
        gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]].x2 = 0;
        gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]].y2 = 0;
        nameStringWidth = GetNicknameStringWidthByPartyAndMonIdx(nickname, whichParty, partyIdx);
        AddTextPrinterParameterized3((side * 2) + 14, FONT_0, (80 - nameStringWidth) / 2, 4, sTextColor_PartyMonNickname, 0, nickname);
        BuildMovesString(movesString, whichParty, partyIdx);
        AddTextPrinterParameterized4((side * 2) + 15, FONT_1, 0, 0, 0, 0, sTextColor_PartyMonNickname, 0, movesString);
        PutWindowTilemap((side * 2) + 14);
        CopyWindowToVram((side * 2) + 14, COPYWIN_FULL);
        PutWindowTilemap((side * 2) + 15);
        CopyWindowToVram((side * 2) + 15, COPYWIN_FULL);
        sTradeMenuResourcesPtr->menuRedrawState[side]++;
        break;
    case 4:
        PrintLevelAndGenderDirectlyOnVram(side, partyIdx, gUnknown_8262055[side][0] + 4, gUnknown_8262055[side][1] + 1, gUnknown_8262055[side][0], gUnknown_8262055[side][1]);
        sTradeMenuResourcesPtr->menuRedrawState[side]++;
        break;
    }
}

static u8 GetNicknameStringWidthByPartyAndMonIdx(u8 *dest, u8 whichParty, u8 partyIdx)
{
    u8 nickname[POKEMON_NAME_LENGTH];
    if (whichParty == 0)
        GetMonData(&gPlayerParty[partyIdx], MON_DATA_NICKNAME, nickname);
    else
        GetMonData(&gEnemyParty[partyIdx], MON_DATA_NICKNAME, nickname);
    StringCopy_Nickname(dest, nickname);
    return GetStringWidth(FONT_0, dest, GetFontAttribute(FONT_0, FONTATTR_LETTER_SPACING));
}

static void BuildMovesString(u8 *movesString, u8 whichParty, u8 whichMon)
{
    u16 moves[MAX_MON_MOVES];
    u16 i;

    if (!sTradeMenuResourcesPtr->eggFlags[whichParty][whichMon])
    {
        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            if (!whichParty)
            {
                moves[i] = GetMonData(&gPlayerParty[whichMon], i + MON_DATA_MOVE1, NULL);
            }
            else
            {
                moves[i] = GetMonData(&gEnemyParty[whichMon], i + MON_DATA_MOVE1, NULL);
            }
        }

        StringCopy(movesString, sText_Dummy);

        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            if (moves[i] != MOVE_NONE)
            {
                StringAppend(movesString, gMoveNames[moves[i]]);
            }

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
    xPos = (64u - GetStringWidth(FONT_0, str, GetFontAttribute(FONT_0, FONTATTR_LETTER_SPACING))) / 2;
    AddTextPrinterParameterized3(windowId, FONT_0, xPos, 4, sTextColor_PartyMonNickname, speed, str);
    PutWindowTilemap(windowId);
    CopyWindowToVram(windowId, COPYWIN_FULL);
}

static void PrintPartyNicknames(u8 whichParty)
{
    u8 buff[20];
    u8 nickname[30];
    struct Pokemon * party = whichParty == 0 ? gPlayerParty : gEnemyParty;
    u8 i;
    for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[whichParty]; i++)
    {
        GetMonData(&party[i], MON_DATA_NICKNAME, buff);
        StringCopy_Nickname(nickname, buff);
        PrintPartyMonNickname(whichParty, i, nickname);
    }
}

static void PrintLevelAndGenderDirectlyOnVram(u8 whichParty, u8 monIdx, u8 x, u8 y, u8 winLeft, u8 winTop)
{
    u8 level;
    u32 tileNum;
    u8 gender;
    u8 nickname[12];

    CopyToBgTilemapBufferRect_ChangePalette(1, gTradeMenuMonBox_Tilemap, winLeft, winTop, 6, 3, 0);
    CopyBgTilemapBufferToVram(1);

    if (whichParty == 0)
        level = GetMonData(&gPlayerParty[monIdx], MON_DATA_LEVEL, NULL);
    else
        level = GetMonData(&gEnemyParty[monIdx], MON_DATA_LEVEL, NULL);

    if (sTradeMenuResourcesPtr->eggFlags[whichParty][monIdx] == 0)
    {
        if (level / 10 != 0)
            sTradeMenuResourcesPtr->tilemapBuffer[x + (y * 32)] = (level / 10) + 0x60;

        sTradeMenuResourcesPtr->tilemapBuffer[x + (y * 32) + 1] = (level % 10) + 0x70;
    }
    else
    {
        sTradeMenuResourcesPtr->tilemapBuffer[x + (y * 32) - 32] = sTradeMenuResourcesPtr->tilemapBuffer[x + (y * 32) - 33];
        sTradeMenuResourcesPtr->tilemapBuffer[x + (y * 32) - 31] = sTradeMenuResourcesPtr->tilemapBuffer[x + (y * 32) - 36] | 0x400;
    }

    if (sTradeMenuResourcesPtr->eggFlags[whichParty][monIdx])
    {
        tileNum = 0x480;
    }
    else
    {
        if (whichParty == 0)
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
            tileNum = !NameHasGenderSymbol(nickname, MON_MALE) ? 0x84 : 0x83;
            break;
        case MON_FEMALE:
            tileNum = !NameHasGenderSymbol(nickname, MON_FEMALE) ? 0x85 : 0x83;
            break;
        default:
            tileNum = 0x83;
            break;
        }
    }
    sTradeMenuResourcesPtr->tilemapBuffer[(y - 1) * 32 + x + 1] = tileNum;
}

static void PrintPartyLevelsAndGendersDirectlyOnVram(u8 whichParty)
{
    s32 i;
    for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[whichParty]; i++)
    {
        const u8 (*drawCoords)[2];
        const u8 (*winCoords)[2];
        u32 r0 = 3 * whichParty;
        const u8 (*drawCoords_p)[2][2] = sTradeMenuGenderLevelPrintCoords;
        drawCoords = drawCoords_p[r0];
        winCoords = sTradeMenuGenderLevelWindowCoords[r0];

        PrintLevelAndGenderDirectlyOnVram(
            whichParty,
            i,
            drawCoords[i][0],
            drawCoords[i][1],
            winCoords[i][0],
            winCoords[i][1]
        );
    }
}

static void ShowTradePartyMonIcons(u8 whichParty)
{
    int i;

    for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[whichParty]; i++)
    {
        gSprites[sTradeMenuResourcesPtr->partyIcons[whichParty][i]].invisible = FALSE;
        gSprites[sTradeMenuResourcesPtr->partyIcons[whichParty][i]].x = sTradeMonSpriteCoords[(whichParty * PARTY_SIZE) + i][0] * 8 + 14;
        gSprites[sTradeMenuResourcesPtr->partyIcons[whichParty][i]].y = sTradeMonSpriteCoords[(whichParty * PARTY_SIZE) + i][1] * 8 - 12;
        gSprites[sTradeMenuResourcesPtr->partyIcons[whichParty][i]].x2 = 0;
        gSprites[sTradeMenuResourcesPtr->partyIcons[whichParty][i]].y2 = 0;
    }
}

static void PrintTradePartnerPartyNicknames(void)
{
    rbox_fill_rectangle(1);
    PrintPartyNicknames(1);
}

static void RedrawPartyWindow(u8 whichParty)
{
    CopyToBgTilemapBufferRect_ChangePalette(1, sTradePartyBoxTilemap, 15 * whichParty, 0, 15, 17, 0);
    CopyBgTilemapBufferToVram(1);
    PrintPartyLevelsAndGendersDirectlyOnVram(whichParty);
    PrintPartyNicknames(whichParty);
    ShowTradePartyMonIcons(whichParty);
    RenderTextToVramViaBuffer(sTradeUITextPtrs[TRADEUITEXT_CHOOSE], (void *)OBJ_VRAM0 + 32 * sTradeMenuResourcesPtr->cursorStartTile, 24);
    sTradeMenuResourcesPtr->menuRedrawState[whichParty] = 0;
}

static void TradeMenuAction_Summary(u8 taskId)
{
    FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
    CopyBgTilemapBufferToVram(0);
}

static void TradeMenuAction_Trade(u8 taskId)
{
    FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
    CopyBgTilemapBufferToVram(0);
}

static void ScheduleLinkTaskWithDelay(u16 delay, u8 kind)
{
    int i;
    for (i = 0; i < 4; i++)
    {
        if (!sTradeMenuResourcesPtr->cron[i].active)
        {
            sTradeMenuResourcesPtr->cron[i].delay = delay;
            sTradeMenuResourcesPtr->cron[i].kind = kind;
            sTradeMenuResourcesPtr->cron[i].active = TRUE;
            break;
        }
    }
}

static void RunScheduledLinkTasks(void)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        if (sTradeMenuResourcesPtr->cron[i].active)
        {
            if (sTradeMenuResourcesPtr->cron[i].delay != 0)
            {
                sTradeMenuResourcesPtr->cron[i].delay--;
            }
            else
            {
                switch (sTradeMenuResourcesPtr->cron[i].kind)
                {
                case 0:
                    SendBlock(BitmaskAllOtherLinkPlayers(), sTradeMenuResourcesPtr->linkData, 20);
                    break;
                case 1:
                    PrintTradeErrorOrStatusMessage(TRADESTATMSG_COMMSTANDBY);
                    break;
                case 2:
                    PrintTradeErrorOrStatusMessage(TRADESTATMSG_ONLYMON);
                    break;
                case 3:
                case 4:
                case 5:
                    PrintTradeErrorOrStatusMessage(TRADESTATMSG_ONLYMON2);
                    break;
                case 6:
                    PrintTradeErrorOrStatusMessage(TRADESTATMSG_YOURMONCANTBETRADED);
                    break;
                case 7:
                    PrintTradeErrorOrStatusMessage(TRADESTATMSG_EGGCANTBETRADED);
                    break;
                case 8:
                    PrintTradeErrorOrStatusMessage(TRADESTATMSG_PARTNERMONCANTBETRADED);
                    break;
                }
                sTradeMenuResourcesPtr->cron[i].active = FALSE;
            }
        }
    }
}

static void PrintTradeErrorOrStatusMessage(u8 idx)
{
    FillWindowPixelBuffer(0, PIXEL_FILL(1));
    AddTextPrinterParameterized(0, FONT_3, sTradeErrorOrStatusMessagePtrs[idx], 0, 2, 0xFF, NULL);
    DrawTextBorderOuter(0, 0x014, 12);
    PutWindowTilemap(0);
    CopyWindowToVram(0, COPYWIN_FULL);
}

static bool8 LoadUISprites(void)
{
    struct SpriteSheet sheet;

    if (sTradeMenuResourcesPtr->loadUISpritesState < 14)
    {
        sheet.data = sSpriteTextTilePtrs[sTradeMenuResourcesPtr->loadUISpritesState];
        sheet.size = 0x100;
        sheet.tag = 200 + sTradeMenuResourcesPtr->loadUISpritesState;
    }

    switch (sTradeMenuResourcesPtr->loadUISpritesState)
    {
    case 0 ... 7:
        LoadSpriteSheet(&sheet);
        sTradeMenuResourcesPtr->loadUISpritesState++;
        break;
    case 8:
        sTradeMenuResourcesPtr->cursorStartTile = LoadSpriteSheet(&sheet);
        sTradeMenuResourcesPtr->loadUISpritesState++;
        break;
    case 9 ... 13:
        LoadSpriteSheet(&sheet);
        sTradeMenuResourcesPtr->loadUISpritesState++;
        break;
    case 14:
        LoadSpritePalette(&sSpritePalette_Text);
        sTradeMenuResourcesPtr->loadUISpritesState++;
        break;
    case 15:
        LoadSpritePalette(&sTradeButtons_SpritePal);
        sTradeMenuResourcesPtr->loadUISpritesState++;
        break;
    case 16:
        LoadSpriteSheet(&sTradeButtons_SpriteSheet);
        sTradeMenuResourcesPtr->loadUISpritesState++;
        break;
    case 17:
        sTradeMenuResourcesPtr->loadUISpritesState = 0;
        return TRUE;
    }

    return FALSE;
}

static void RenderTextToVramViaBuffer(const u8 *name, u8 *dest, u8 unused)
{
    DrawTextWindowAndBufferTiles(name, dest, 0, 0, gDecompressionBuffer, 6);
}

static void ComputePartyTradeableFlags(u8 who)
{
    int i;

    switch (who)
    {
    case 0:
        for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[who]; i++)
        {
            if (GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG) == TRUE)
            {
                sTradeMenuResourcesPtr->battleableFlags[who][i] = FALSE;
                sTradeMenuResourcesPtr->eggFlags[who][i] = TRUE;
            }
            else if (GetMonData(&gPlayerParty[i], MON_DATA_HP) == 0)
            {
                sTradeMenuResourcesPtr->battleableFlags[who][i] = FALSE;
                sTradeMenuResourcesPtr->eggFlags[who][i] = FALSE;
            }
            else
            {
                sTradeMenuResourcesPtr->battleableFlags[who][i] = TRUE;
                sTradeMenuResourcesPtr->eggFlags[who][i] = FALSE;
            }
        }
        break;
    case 1:
        for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[who]; i++)
        {
            if (GetMonData(&gEnemyParty[i], MON_DATA_IS_EGG) == TRUE)
            {
                sTradeMenuResourcesPtr->battleableFlags[who][i] = FALSE;
                sTradeMenuResourcesPtr->eggFlags[who][i] = TRUE;
            }
            else if (GetMonData(&gEnemyParty[i], MON_DATA_HP) == 0)
            {
                sTradeMenuResourcesPtr->battleableFlags[who][i] = FALSE;
                sTradeMenuResourcesPtr->eggFlags[who][i] = FALSE;
            }
            else
            {
                sTradeMenuResourcesPtr->battleableFlags[who][i] = TRUE;
                sTradeMenuResourcesPtr->eggFlags[who][i] = FALSE;
            }
        }
        break;
    }
}

static void ComputePartyHPBarLevels(u8 who)
{
    u16 i, curHp, maxHp;

    switch (who)
    {
    case 0:
        for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[0]; i++)
        {
            curHp = GetMonData(&gPlayerParty[i], MON_DATA_HP);
            maxHp = GetMonData(&gPlayerParty[i], MON_DATA_MAX_HP);
            sTradeMenuResourcesPtr->hpBarLevels[0][i] = GetHPBarLevel(curHp, maxHp);
        }
        break;
    case 1:
        for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[1]; i++)
        {
            curHp = GetMonData(&gEnemyParty[i], MON_DATA_HP);
            maxHp = GetMonData(&gEnemyParty[i], MON_DATA_MAX_HP);
            sTradeMenuResourcesPtr->hpBarLevels[1][i] = GetHPBarLevel(curHp, maxHp);
        }
        break;
    }
}

static void SetMonIconsAnimByHPBarLevel(void)
{
    int i, j;
    for (i = 0; i < 2; i++)
    {
        for (j = 0; j < sTradeMenuResourcesPtr->partyCounts[i]; j++)
        {
            SetPartyHPBarSprite(&gSprites[sTradeMenuResourcesPtr->partyIcons[i][j]], 4 - sTradeMenuResourcesPtr->hpBarLevels[i][j]);
        }
    }
}

static void CopyGiftRibbonsToSav1(void)
{
    int i;
    for (i = 0; i < 11; i++)
    {
        if (gSaveBlock1Ptr->giftRibbons[i] == 0 && sTradeMenuResourcesPtr->giftRibbons[i] != 0)
            gSaveBlock1Ptr->giftRibbons[i] = sTradeMenuResourcesPtr->giftRibbons[i];
    }
}

static u32 TestWhetherSelectedMonCanBeTraded(struct Pokemon * party, int partyCount, int cursorPos)
{
    int i, sum;
    struct LinkPlayer * player;
    int species[6];
    int species2[6];

    for (i = 0; i < partyCount; i++)
    {
        species2[i] = GetMonData(&party[i], MON_DATA_SPECIES2);
        species[i] = GetMonData(&party[i], MON_DATA_SPECIES);
    }

    if (!IsNationalPokedexEnabled())
    {
        if (species2[cursorPos] > SPECIES_MEW)
        {
            return 2;
        }
        if (species2[cursorPos] == SPECIES_NONE)
        {
            return 3;
        }
    }

    player = &gLinkPlayers[GetMultiplayerId() ^ 1];
    if ((player->version & 0xFF) != VERSION_RUBY &&
        (player->version & 0xFF) != VERSION_SAPPHIRE)
    {
        if ((player->progressFlagsCopy & 0xF) == 0)
        {
            if (species2[cursorPos] == SPECIES_EGG)
            {
                return 5;
            }

            if (species2[cursorPos] > SPECIES_MEW)
            {
                return 4;
            }
        }
    }

    if (species[cursorPos] == SPECIES_DEOXYS || species[cursorPos] == SPECIES_MEW)
    {
        if (!GetMonData(&party[cursorPos], MON_DATA_EVENT_LEGAL))
        {
            return 4;
        }
    }

    for (i = 0; i < partyCount; i++)
    {
        if (species2[i] == SPECIES_EGG)
        {
            species2[i] = SPECIES_NONE;
        }
    }

    for (sum = 0, i = 0; i < partyCount; i++)
    {
        if (i != cursorPos)
        {
            sum += species2[i];
        }
    }

    if (sum != 0)
    {
        return 0;
    }
    else
    {
        return 1;
    }
}

s32 Trade_CalcLinkPlayerCompatibilityParam(void)
{
    s32 val;
    u16 version;

    if (gReceivedRemoteLinkPlayers)
    {
        val = 0;
        version = (gLinkPlayers[GetMultiplayerId() ^ 1].version & 0xFF);

        if (version == VERSION_FIRE_RED || version == VERSION_LEAF_GREEN)
        {
            // this value could actually be anything 0 or less
            val = 0;
        }
        else if (version == VERSION_RUBY || version == VERSION_SAPPHIRE)
        {
            val = 1;
        }
        else
        {
            val = 2;
        }

        if (val > 0)
        {
            if (gLinkPlayers[GetMultiplayerId()].progressFlagsCopy & 0xF0)
            {
                if (val == 2)
                {
                    if (gLinkPlayers[GetMultiplayerId() ^ 1].progressFlagsCopy & 0xF0)
                    {
                        return 0;
                    }
                    else
                    {
                        return 2;
                    }
                }
            }
            else
            {
                return 1;
            }
        }
    }
    return 0;
}

static bool32 IsDeoxysOrMewUntradable(u16 species, bool8 isEventLegal)
{
    if (species == SPECIES_DEOXYS || species == SPECIES_MEW)
    {
        if (!isEventLegal)
            return TRUE;
    }
    return FALSE;
}

int GetUnionRoomTradeMessageId(struct GFtgtGnameSub playerSub, struct GFtgtGnameSub partnerSub, u16 species1, u16 species2, u8 type, u16 species3, u8 isEventLegal)
{
    u8 playerHasNationalDex = playerSub.hasNationalDex;
    u8 playerIsChampion = playerSub.isChampion;
    u8 partnerHasNationalDex = partnerSub.hasNationalDex;
    u8 partnerIsChampion = partnerSub.isChampion;
    u8 partnerVersion = partnerSub.version;
    bool8 isNotFRLG;

    if (partnerVersion == VERSION_FIRE_RED || partnerVersion == VERSION_LEAF_GREEN)
    {
        isNotFRLG = FALSE;
    }
    else
    {
        isNotFRLG = TRUE;
    }
    if (isNotFRLG)
    {
        if (!playerIsChampion)
        {
            return 8;
        }
        else if (!partnerIsChampion)
        {
            return 9;
        }
    }

    if (IsDeoxysOrMewUntradable(species3, isEventLegal))
    {
        return 4;
    }

    if (species2 == SPECIES_EGG)
    {
        if (species1 != species2)
        {
            return 2;
        }
    }
    else
    {
        if (gBaseStats[species1].type1 != type && gBaseStats[species1].type2 != type)
        {
            return 1;
        }
    }

    if (species1 == SPECIES_EGG && species1 != species2)
    {
        return 3;
    }

    if (!playerHasNationalDex)
    {
        if (species1 == SPECIES_EGG)
        {
            return 6;
        }

        if (species1 > SPECIES_MEW)
        {
            return 4;
        }

        if (species2 > SPECIES_MEW)
        {
            return 5;
        }
    }

    if (!partnerHasNationalDex && species1 > SPECIES_MEW)
    {
        return 7;
    }

    return 0;
}

int CanRegisterMonForTradingBoard(struct GFtgtGnameSub playerSub, u16 species2, u16 species, u8 isEventLegal)
{
    u8 canTradeEggAndNational = playerSub.hasNationalDex;

    if (IsDeoxysOrMewUntradable(species, isEventLegal))
    {
        return 1;
    }

    if (canTradeEggAndNational)
    {
        return 0;
    }

    if (species2 == SPECIES_EGG)
    {
        return 2;
    }

    if (species2 > SPECIES_MEW && species2 != SPECIES_EGG)
    {
        return 1;
    }

    return 0;
}
