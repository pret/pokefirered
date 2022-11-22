#include "global.h"
#include "gflib.h"
#include "task.h"
#include "util.h"
#include "decompress.h"
#include "trade.h"
#include "link.h"
#include "link_rfu.h"
#include "mevent.h"
#include "graphics.h"
#include "strings.h"
#include "menu.h"
#include "data.h"
#include "battle.h"
#include "script.h"
#include "event_data.h"
#include "mail.h"
#include "mail_data.h"
#include "pokeball.h"
#include "evolution_scene.h"
#include "overworld.h"
#include "field_fadetransition.h"
#include "quest_log.h"
#include "help_system.h"
#include "new_menu_helpers.h"
#include "pokedex.h"
#include "save.h"
#include "load_save.h"
#include "random.h"
#include "trade_scene.h"
#include "constants/items.h"
#include "constants/easy_chat.h"
#include "constants/songs.h"
#include "constants/region_map_sections.h"
#include "constants/moves.h"

#define TAG_GLOW1_TILES      5550
#define TAG_GLOW_PAL         5551
#define TAG_GLOW2_TILES      5552
#define TAG_UNUSED_5553      5553
#define TAG_CABLE_END_TILES  5554
#define TAG_GBA_PAL          5555
#define TAG_GBA_SCREEN_TILES 5556
#define TAG_BALL_TILES       5557
#define TAG_BALL_PAL         5558

struct InGameTrade {
    /*0x00*/ u8 nickname[POKEMON_NAME_LENGTH + 1];
    /*0x0C*/ u16 species;
    /*0x0E*/ u8 ivs[NUM_STATS];
    /*0x14*/ u8 abilityNum;
    /*0x18*/ u32 otId;
    /*0x1C*/ u8 conditions[5];
    /*0x24*/ u32 personality;
    /*0x28*/ u16 heldItem;
    /*0x2A*/ u8 mailNum;
    /*0x2B*/ u8 otName[11];
    /*0x36*/ u8 otGender;
    /*0x37*/ u8 sheen;
    /*0x38*/ u16 requestedSpecies;
};

struct TradeAnimationResources {
    /*0x00*/ struct Pokemon mon;
    /*0x64*/ u32 timer;
    /*0x68*/ u32 monPersonalities[2];
    /*0x70*/ u8 filler_70[2];
    /*0x72*/ u8 tradeStatus1;
    /*0x73*/ u8 tradeStatus2;
    /*0x74*/ u16 linkData[10];
    /*0x88*/ u8 linkTimeoutCheck1;
    /*0x89*/ u8 linkTimeoutCheck2;
    /*0x8A*/ u16 linkTimeoutTimer;
    /*0x8C*/ u16 unk_8C;
    /*0x8E*/ u8 pokePicSpriteIdxs[2];
    /*0x90*/ u8 tradeGlow1SpriteId;
    /*0x91*/ u8 gbaScreenSpriteId;
    /*0x92*/ u8 linkCableEndSpriteId;
    /*0x93*/ u8 scheduleLinkTransfer;
    /*0x94*/ u16 state;
    /*0x96*/ u8 filler_96[0xD2 - 0x96];
    /*0xD2*/ u8 pokeballSpriteId;
    /*0xD3*/ u8 pokeballSpriteId2;
    /*0xD4*/ u16 bg2texX;
    /*0xD6*/ u16 bg2texY;
    /*0xD8*/ u16 unk_D8;
    /*0xDA*/ u16 unk_DA;
    /*0xDC*/ u16 bg2srcX;
    /*0xDE*/ u16 bg2srcY;
    /*0xE0*/ s16 bg1vofs;
    /*0xE2*/ s16 bg1hofs;
    /*0xE4*/ s16 bg2vofs;
    /*0xE6*/ s16 bg2hofs;
    /*0xE8*/ u16 sXY;
    /*0xEA*/ u16 bg2Zoom;
    /*0xEC*/ u16 bg2alpha;
    /*0xEE*/ bool8 isLinkTrade;
    /*0xF0*/ u16 tradeSpecies[2];
    /*0xF4*/ u16 cachedMapMusic;
    /*0xF6*/ u8 unk_F6;
    /*0xF8*/ u16 monSpecies[2];
    /*0xFC*/ u8 linkPartnerName[7];
    /*0x103*/ u8 filler_103[1];
    /*0x104*/ u8 textColor[3];
    /*0x107*/ u8 filler_107[1];
    /*0x108*/ bool8 isCableTrade;
    /*0x109*/ u8 win0left;
    /*0x10A*/ u8 win0top;
    /*0x10B*/ u8 win0right;
    /*0x10C*/ u8 win0bottom;
};

static EWRAM_DATA struct TradeAnimationResources * sTradeData = NULL;

static void SpriteCB_TradeGlowCable(struct Sprite *sprite);
static void SpriteCB_TradeGlowWireless(struct Sprite *sprite);
static void SpriteCB_TradeGlowCore(struct Sprite *sprite);
static void SpriteCB_GameLinkCableEnd_Outbound(struct Sprite *sprite);
static void SpriteCB_GameLinkCableEnd_Inbound(struct Sprite *sprite);
static void SpriteCB_TradeGBAScreen(struct Sprite *sprite);
static void TradeAnimInit_LoadGfx(void);
static void CB2_RunTradeAnim_InGameTrade(void);
static void SetTradeSequenceBgGpuRegs(u8 idx);
static void LoadTradeGbaSpriteGfx(void);
static void TradeBufferOTnameAndNicknames(void);
static u8 DoTradeAnim(void);
static u8 DoTradeAnim_Cable(void);
static u8 DoTradeAnim_Wireless(void);
static void SpriteCB_TradePokeball_Default(struct Sprite *sprite);
static void SpriteCB_TradePokeball_Outbound(struct Sprite *sprite);
static void SpriteCB_TradePokeball_Outbound2(struct Sprite *sprite);
static void SpriteCB_TradePokeball_Inbound(struct Sprite *sprite);
static void BufferInGameTradeMonName(void);
static void GetInGameTradeMail(struct Mail * mail, const struct InGameTrade * inGameTrade);
static void CB2_RunTradeAnim_LinkTrade(void);
static void CB2_WaitAndAckTradeComplete(void);
static void CB2_HandleTradeEnded(void);
static void LinkTrade_TearDownAssets(void);
static void Task_WaitFadeAndStartInGameTradeAnim(u8 taskId);
static void CheckPartnersMonForRibbons(void);
static void Task_AnimateWirelessSignal(u8 taskId);
static void Task_OpenCenterWhiteColumn(u8 taskId);
static void Task_CloseCenterWhiteColumn(u8 taskId);

static const u16 sTradeBallPalette[] = INCBIN_U16("graphics/trade/ball.gbapal");
static const u8 sTradeBallTiles[] = INCBIN_U8("graphics/trade/ball.4bpp");
static const u8 sPokeballSymbolTiles[] = INCBIN_U8("graphics/trade/pokeball_symbol.8bpp");
static const u16 sCableCloseupMap[] = INCBIN_U16("graphics/trade/cable_closeup_map.bin");
static const u16 sPokeballSymbolMap[] = INCBIN_U16("graphics/trade/pokeball_symbol_map.bin");
static const u16 sUnref_083308C0[] = INCBIN_U16("graphics/trade/unknown_3308C0.gbapal");
static const u16 sTradeGbaPal[] = INCBIN_U16("graphics/trade/gba.gbapal");
static const u16 sShadowPalette[] = INCBIN_U16("graphics/trade/shadow.gbapal");
static const u16 sBlackPalette[] = INCBIN_U16("graphics/trade/black.gbapal");
static const u16 sTradeGlowPal[] = INCBIN_U16("graphics/trade/misc.gbapal");
static const u8 sTradeGlow1Tiles[] = INCBIN_U8("graphics/trade/glow1.4bpp");
static const u8 sTradeGlow2Tiles[] = INCBIN_U8("graphics/trade/glow2.4bpp");
static const u8 sTradeCableEndTiles[] = INCBIN_U8("graphics/trade/cable_end.4bpp");
static const u8 sTradeGBAScreenTiles[] = INCBIN_U8("graphics/trade/gba_screen.4bpp");
const u16 gTradeOrHatchMonShadowTilemap[] = INCBIN_U16("graphics/trade/shadow_map.bin");
static const u8 sGbaAffineTiles[] = INCBIN_U8("graphics/trade/gba_affine.8bpp");
static const u8 sFiller_08335760[64] = {};
static const u8 sGbaAffineMapCable[] = INCBIN_U8("graphics/trade/gba_affine_map_cable.bin");
static const u8 sGbaAffineMapWireless[] = INCBIN_U8("graphics/trade/gba_affine_map_wireless.bin");
static const u16 sGbaMapWireless[] = INCBIN_U16("graphics/trade/gba_map_wireless.bin");
static const u16 sGbaMapCable[] = INCBIN_U16("graphics/trade/gba_map_cable.bin");
static const u32 sWirelessCloseupMap[] = INCBIN_U32("graphics/trade/unknown_3379A0.bin.lz");
static const u16 sWirelessSignalAnimPals_Outbound[] = INCBIN_U16("graphics/trade/wireless_signal_send.gbapal");
static const u16 sWirelessSignalAnimPals_Inbound[] = INCBIN_U16("graphics/trade/wireless_signal_receive.gbapal");
static const u16 sWirelessSignalAnimPals_Off[] = INCBIN_U16("graphics/trade/black.gbapal");
static const u32 sWirelessSignal4bpp[] = INCBIN_U32("graphics/trade/wireless_signal.4bpp.lz");
static const u32 sWirelessSignalTilemap[] = INCBIN_U32("graphics/trade/wireless_signal.bin.lz");

static const struct OamData gOamData_826CD00 = {
    .affineMode = ST_OAM_AFFINE_NORMAL,
    .shape = SPRITE_SHAPE(16x16),
    .size = SPRITE_SIZE(16x16)
};

static const union AnimCmd gAnimCmd_826CD08[] = {
    ANIMCMD_FRAME(0x00, 3),
    ANIMCMD_FRAME(0x04, 3),
    ANIMCMD_FRAME(0x08, 3),
    ANIMCMD_FRAME(0x0c, 3),
    ANIMCMD_FRAME(0x10, 3),
    ANIMCMD_FRAME(0x14, 3),
    ANIMCMD_FRAME(0x18, 3),
    ANIMCMD_FRAME(0x1c, 3),
    ANIMCMD_FRAME(0x20, 3),
    ANIMCMD_FRAME(0x24, 3),
    ANIMCMD_FRAME(0x28, 3),
    ANIMCMD_FRAME(0x2c, 3),
    ANIMCMD_LOOP(1),
    ANIMCMD_FRAME(0x00, 3),
    ANIMCMD_END
};

static const union AnimCmd gAnimCmd_826CD44[] = {
    ANIMCMD_FRAME(0x00, 3),
    ANIMCMD_FRAME(0x04, 3),
    ANIMCMD_FRAME(0x08, 3),
    ANIMCMD_FRAME(0x0c, 3),
    ANIMCMD_FRAME(0x10, 3),
    ANIMCMD_FRAME(0x14, 3),
    ANIMCMD_FRAME(0x18, 3),
    ANIMCMD_FRAME(0x1c, 3),
    ANIMCMD_FRAME(0x20, 3),
    ANIMCMD_FRAME(0x24, 3),
    ANIMCMD_FRAME(0x28, 3),
    ANIMCMD_FRAME(0x2c, 3),
    ANIMCMD_LOOP(2),
    ANIMCMD_FRAME(0x00, 3),
    ANIMCMD_END
};

static const union AnimCmd *const gSpriteAnimTable_826CD80[] = {
    gAnimCmd_826CD08,
    gAnimCmd_826CD44
};

static const union AffineAnimCmd gAffineAnimCmd_826CD88[] = {
    AFFINEANIMCMD_FRAME(0, 0, 0, 1),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd gAffineAnimCmd_826CD98[] = {
    AFFINEANIMCMD_FRAME(-8, 0, 0, 20),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd gAffineAnimCmd_826CDA8[] = {
    AFFINEANIMCMD_FRAME(96, 256, 0, 0),
    AFFINEANIMCMD_FRAME(0, 0, 0, 5),
    AFFINEANIMCMD_FRAME(8, 0, 0, 20),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const gSpriteAffineAnimTable_826CDC8[] = {
    gAffineAnimCmd_826CD88,
    gAffineAnimCmd_826CD98,
    gAffineAnimCmd_826CDA8
};

static const struct SpriteSheet sTradeBallSpriteSheet = {
    sTradeBallTiles,
    0x600,
    TAG_BALL_TILES
};

static const struct SpritePalette sTradeBallSpritePal = {
    sTradeBallPalette,
    TAG_BALL_PAL
};

static const struct SpriteTemplate sTradePokeballSpriteTemplate = {
    .tileTag = TAG_BALL_TILES,
    .paletteTag = TAG_BALL_PAL,
    .oam = &gOamData_826CD00,
    .anims = gSpriteAnimTable_826CD80,
    .affineAnims = gSpriteAffineAnimTable_826CDC8,
    .callback = SpriteCB_TradePokeball_Default
};

static const struct OamData gOamData_826CDFC = {
    .affineMode = ST_OAM_AFFINE_NORMAL,
    .objMode = ST_OAM_OBJ_BLEND,
    .shape = SPRITE_SHAPE(32x32),
    .size = SPRITE_SIZE(32x32),
    .priority = 1
};

static const union AnimCmd gAnimCmd_826CE04[] = {
    ANIMCMD_FRAME(0, 5, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_END
};

static const union AnimCmd *const gSpriteAnimTable_826CE0C[] = {
    gAnimCmd_826CE04
};

static const union AffineAnimCmd gAffineAnimCmd_826CE10[] = {
    AFFINEANIMCMD_FRAME(-10, -10, 0, 5),
    AFFINEANIMCMD_FRAME( 10,  10, 0, 5),
    AFFINEANIMCMD_JUMP(0)
};

static const union AffineAnimCmd *const gSpriteAffineAnimTable_826CE28[] = {
    gAffineAnimCmd_826CE10
};

static const struct SpriteSheet sTradeGlow1SpriteSheet = {
    sTradeGlow1Tiles,
    0x200,
    TAG_GLOW1_TILES
};

static const struct SpritePalette sTradeGlowSpritePal = {
    sTradeGlowPal,
    TAG_GLOW_PAL
};

static const struct SpritePalette sTradeGbaSpritePal = {
    sTradeGbaPal,
    TAG_GBA_PAL
};

static const struct SpriteTemplate sTradeGlow1SpriteTemplate = {
    .tileTag = TAG_GLOW1_TILES,
    .paletteTag = TAG_GLOW_PAL,
    .oam = &gOamData_826CDFC,
    .anims = gSpriteAnimTable_826CE0C,
    .affineAnims = gSpriteAffineAnimTable_826CE28,
    .callback = SpriteCB_TradeGlowCable
};

static const struct OamData gOamData_826CE5C = {
    .shape = SPRITE_SHAPE(16x32),
    .size = SPRITE_SIZE(16x32),
    .priority = 1
};

static const union AnimCmd gAnimCmd_826CE64[] = {
    ANIMCMD_FRAME(0, 5, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_END
};

static const union AnimCmd gAnimCmd_826CE6C[] = {
    ANIMCMD_FRAME(8, 5, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_END
};

static const union AnimCmd *const gSpriteAnimTable_826CE74[] = {
    gAnimCmd_826CE64,
    gAnimCmd_826CE6C
};

static const struct SpriteSheet sTradeGlow2SpriteSheet = {
    sTradeGlow2Tiles,
    0x300,
    TAG_GLOW2_TILES
};

static const struct SpriteTemplate sGlowBallSpriteTemplate = {
    .tileTag = TAG_GLOW2_TILES,
    .paletteTag = TAG_GLOW_PAL,
    .oam = &gOamData_826CE5C,
    .anims = gSpriteAnimTable_826CE74,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_TradeGlowCore
};

static const struct OamData gOamData_826CE9C = {
    .shape = SPRITE_SHAPE(16x32),
    .size = SPRITE_SIZE(16x32),
    .priority = 1
};

static const union AnimCmd gAnimCmd_826CEA4[] = {
    ANIMCMD_FRAME(0, 10),
    ANIMCMD_END
};

static const union AnimCmd *const gSpriteAnimTable_826CEAC[] = {
    gAnimCmd_826CEA4
};

static const struct SpriteSheet sTradeCableEndSpriteSheet = {
    sTradeCableEndTiles,
    0x100,
    TAG_CABLE_END_TILES
};

static const struct SpriteTemplate sGameLinkCableEndSpriteTemplate = {
    .tileTag = TAG_CABLE_END_TILES,
    .paletteTag = TAG_GBA_PAL,
    .oam = &gOamData_826CE9C,
    .anims = gSpriteAnimTable_826CEAC,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_GameLinkCableEnd_Outbound
};

static const struct OamData gOamData_826CED0 = {
    .shape = SPRITE_SHAPE(64x32),
    .size = SPRITE_SIZE(64x32),
    .priority = 1
};

static const union AnimCmd gAnimCmd_826CED8[] = {
    ANIMCMD_FRAME(0x00, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(0x20, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(0x40, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(0x60, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(0x40, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(0x20, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(0x00, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_LOOP(8),
    ANIMCMD_END
};

static const union AnimCmd gAnimCmd_826CEFC[] = {
    ANIMCMD_FRAME(0x00, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(0x20, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(0x40, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(0x60, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(0x40, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(0x20, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(0x00, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_LOOP(2),
    ANIMCMD_END
};

static const union AnimCmd *const gSpriteAnimTable_826CF20[] = {
    gAnimCmd_826CED8
};

static const union AnimCmd *const gSpriteAnimTable_826CF24[] = {
    gAnimCmd_826CEFC
};

static const struct SpriteSheet sTradeGBAScreenSpriteSheet = {
    sTradeGBAScreenTiles,
    0x1000,
    TAG_GBA_SCREEN_TILES
};

static const struct SpriteTemplate sTradeGBAScreenSpriteTemplate1 = {
    .tileTag = TAG_GBA_SCREEN_TILES,
    .paletteTag = TAG_GBA_PAL,
    .oam = &gOamData_826CED0,
    .anims = gSpriteAnimTable_826CF20,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_TradeGBAScreen
};

static const struct SpriteTemplate sTradeGBAScreenSpriteTemplate2 = {
    .tileTag = TAG_GBA_SCREEN_TILES,
    .paletteTag = TAG_GBA_PAL,
    .oam = &gOamData_826CED0,
    .anims = gSpriteAnimTable_826CF24,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_TradeGBAScreen
};

static const u16 sTradeGlow2PaletteAnimTable[] = {
    RGB(18, 24, 31),
    RGB(18, 24, 31),
    RGB(18, 24, 31),
    RGB(31, 31, 31),
    RGB(31, 31, 31),
    RGB(31, 31, 31),
    RGB(18, 24, 31),
    RGB(18, 24, 31),
    RGB(18, 24, 31),
    RGB(31, 31, 31),
    RGB(31, 31, 31),
    RGB(31, 31, 31)
};

static const union AffineAnimCmd gAffineAnimCmd_826CF78[] = {
    AFFINEANIMCMD_FRAME(-0x100,  0x100, 0, 0),
    AFFINEANIMCMD_JUMP(0)
};

static const union AffineAnimCmd *const sSpriteAffineAnimTable_PlayerPokePicAlt[] = {
    gAffineAnimCmd_826CF78
};

#include "data/ingame_trades.h"

static const struct WindowTemplate sTradeMessageWindowTemplates[] = {
    {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 15,
        .width = 26,
        .height = 4,
        .paletteNum = 0,
        .baseBlock = 0x040
    }, DUMMY_WIN_TEMPLATE
};

const struct WindowTemplate gTradeEvolutionSceneYesNoWindowTemplate = {
    .bg = 0,
    .tilemapLeft = 21,
    .tilemapTop = 9,
    .width = 6,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x0bc
};

static const struct BgTemplate sBgTemplates[] = {
    {
        .bg = 0,
        .charBaseIndex = 3,
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
        .priority = 2,
        .baseTile = 0x000
    }, {
        .bg = 2,
        .charBaseIndex = 1,
        .mapBaseIndex = 18,
        .screenSize = 1,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x000
    }, {
        .bg = 3,
        .charBaseIndex = 0,
        .mapBaseIndex = 6,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x000
    }
};

static const s8 sTradeBallVerticalVelocityTable[] = {
     0,  0,  1,  0,
     1,  0,  1,  1,
     1,  1,  2,  2,
     2,  2,  3,  3,
     3,  3,  4,  4,
     4,  4, -4, -4,
    -4, -3, -3, -3,
    -3, -2, -2, -2,
    -2, -1, -1, -1,
    -1,  0, -1,  0,
    -1,  0,  0,  0,
     0,  0,  1,  0,
     1,  0,  1,  1,
     1,  1,  2,  2,
     2,  2,  3,  3,
     3,  3,  4,  4,
     4,  4, -4, -3,
    -3, -2, -2, -1,
    -1, -1,  0, -1,
     0,  0,  0,  0,
     0,  0,  1,  0,
     1,  1,  1,  2,
     2,  3,  3,  4,
    -4, -3, -2, -1,
    -1, -1,  0,  0,
     0,  0,  1,  0,
     1,  1,  2,  3
};

static const u8 sWirelessSignalAnimParams[][2] = {
    {0,  1},
    {1,  1},
    {2,  1},
    {3,  1},
    {4,  1},
    {5,  2},
    {6,  2},
    {7,  2},
    {8,  2},
    {9,  2},
    {10, 3},
    {11, 3},
    {12, 3},
    {13, 4},
    {14, 5},
    {15, 2},
    {0,  1},
    {1,  1},
    {2,  1},
    {3,  1},
    {4,  1},
    {5,  2},
    {6,  2},
    {7,  2},
    {8,  2},
    {9,  2},
    {10, 3},
    {11, 3},
    {12, 3},
    {13, 4},
    {14, 5},
    {16, 1},
    {16, -1}
};

// Sprite callback for link cable trade glow
static void SpriteCB_TradeGlowCable(struct Sprite *sprite)
{
    sprite->data[0]++;
    if (sprite->data[0] == 10)
    {
        PlaySE(SE_BALL);
        sprite->data[0] = 0;
    }
}

// Sprite callback for wireless trade glow
static void SpriteCB_TradeGlowWireless(struct Sprite *sprite)
{
    if (!sprite->invisible)
    {
        sprite->data[0]++;
        if (sprite->data[0] == 10)
        {
            PlaySE(SE_M_SWAGGER2);
            sprite->data[0] = 0;
        }
    }
}

// Palette flash for trade glow core
static void SpriteCB_TradeGlowCore(struct Sprite *sprite)
{
    if (sprite->data[1] == 0)
    {
        sprite->data[0]++;
        if (sprite->data[0] == 12)
            sprite->data[0] = 0;
        LoadPalette(&sTradeGlow2PaletteAnimTable[sprite->data[0]], 16 * (sprite->oam.paletteNum + 16) + 4, 2);
    }
}

// Move down for 10 frames
static void SpriteCB_GameLinkCableEnd_Outbound(struct Sprite *sprite)
{
    sprite->data[0]++;
    sprite->y2++;
    if (sprite->data[0] == 10)
        DestroySprite(sprite);
}

// Move up for 10 frames
static void SpriteCB_GameLinkCableEnd_Inbound(struct Sprite *sprite)
{
    sprite->data[0]++;
    sprite->y2--;
    if (sprite->data[0] == 10)
        DestroySprite(sprite);
}

// Play a sound every 15 frames
static void SpriteCB_TradeGBAScreen(struct Sprite *sprite)
{
    sprite->data[0]++;
    if (sprite->data[0] == 15)
    {
        PlaySE(SE_M_MINIMIZE);
        sprite->data[0] = 0;
    }
}

static void SetTradeBGAffine(void)
{
    struct BgAffineDstData affine;
    DoBgAffineSet(&affine, sTradeData->bg2texX * 0x100, sTradeData->bg2texY * 0x100, sTradeData->bg2srcX, sTradeData->bg2srcY, sTradeData->sXY, sTradeData->sXY, sTradeData->bg2alpha);
    SetGpuReg(REG_OFFSET_BG2PA, affine.pa);
    SetGpuReg(REG_OFFSET_BG2PB, affine.pb);
    SetGpuReg(REG_OFFSET_BG2PC, affine.pc);
    SetGpuReg(REG_OFFSET_BG2PD, affine.pd);
    SetGpuReg(REG_OFFSET_BG2X, affine.dx);
    SetGpuReg(REG_OFFSET_BG2Y, affine.dy);
}

static void TradeAnim_UpdateBgRegs(void)
{
    u16 dispcnt;

    SetGpuReg(REG_OFFSET_BG1VOFS, sTradeData->bg1vofs);
    SetGpuReg(REG_OFFSET_BG1HOFS, sTradeData->bg1hofs);

    dispcnt = GetGpuReg(REG_OFFSET_DISPCNT);
    if ((dispcnt & 7) == DISPCNT_MODE_0)
    {
        SetGpuReg(REG_OFFSET_BG2VOFS, sTradeData->bg2vofs);
        SetGpuReg(REG_OFFSET_BG2HOFS, sTradeData->bg2hofs);
    }
    else
    {
        SetTradeBGAffine();
    }
}

static void VBlankCB_TradeAnim(void)
{
    TradeAnim_UpdateBgRegs();
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void InitLinkTimeoutTracker(void)
{
    sTradeData->linkTimeoutTimer = 0;
    sTradeData->linkTimeoutCheck1 = 0;
    sTradeData->linkTimeoutCheck2 = 0;
}

static void CheckLinkTimeout(void)
{
    if (sTradeData->linkTimeoutCheck1 == sTradeData->linkTimeoutCheck2)
        sTradeData->linkTimeoutTimer++;
    else
        sTradeData->linkTimeoutTimer = 0;

    if (sTradeData->linkTimeoutTimer > 300)
    {
        CloseLink();
        SetMainCallback2(CB2_LinkError);
        sTradeData->linkTimeoutTimer = 0;
        sTradeData->linkTimeoutCheck2 = 0;
        sTradeData->linkTimeoutCheck1 = 0;
    }

    sTradeData->linkTimeoutCheck2 = sTradeData->linkTimeoutCheck1;
}

static u32 GetMultiplayerIdOfLinkTrade(void)
{
    if (gReceivedRemoteLinkPlayers)
        return GetMultiplayerId();
    return 0;
}

static void LoadTradeMonPic(u8 whichParty, u8 action)
{
    int pos = 0;
    struct Pokemon * mon = NULL;
    u16 species;
    u32 personality;

    if (whichParty == 0)
    {
        mon = &gPlayerParty[gSelectedTradeMonPositions[0]];
        pos = 1;
    }

    /*else*/ if (whichParty == 1)
    {
        mon = &gEnemyParty[gSelectedTradeMonPositions[1] % PARTY_SIZE];
        pos = 3;
    }

    switch (action)
    {
    case 0:
        // Load graphics
        species = GetMonData(mon, MON_DATA_SPECIES2);
        personality = GetMonData(mon, MON_DATA_PERSONALITY);

        if (whichParty == 0)
            HandleLoadSpecialPokePic(&gMonFrontPicTable[species], gMonSpritesGfxPtr->sprites[1], species, personality);
        else
            HandleLoadSpecialPokePic_DontHandleDeoxys(&gMonFrontPicTable[species], gMonSpritesGfxPtr->sprites[whichParty * 2 + 1], species, personality);

        LoadCompressedSpritePalette(GetMonSpritePalStruct(mon));
        sTradeData->tradeSpecies[whichParty] = species;
        sTradeData->monPersonalities[whichParty] = personality;
        break;
    case 1:
        // Create sprite
        SetMultiuseSpriteTemplateToPokemon(GetMonSpritePalStruct(mon)->tag, pos);
        sTradeData->pokePicSpriteIdxs[whichParty] = CreateSprite(&gMultiuseSpriteTemplate, 120, 60, 6);
        gSprites[sTradeData->pokePicSpriteIdxs[whichParty]].invisible = TRUE;
        gSprites[sTradeData->pokePicSpriteIdxs[whichParty]].callback = SpriteCallbackDummy;
        break;
    }
}

void CB2_LinkTrade(void)
{
    switch (gMain.state)
    {
    case 0:
        if (!gReceivedRemoteLinkPlayers)
        {
            gLinkType = 0x1144;
            CloseLink();
        }
        sTradeData = AllocZeroed(sizeof(struct TradeAnimationResources));
        AllocateMonSpritesGfx();
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();
        SetVBlankCallback(VBlankCB_TradeAnim);
        TradeAnimInit_LoadGfx();
        InitLinkTimeoutTracker();
        gMain.state++;
        sTradeData->unk_8C = 0;
        sTradeData->state = 0;
        sTradeData->isLinkTrade = TRUE;
        sTradeData->bg2texX = 64;
        sTradeData->bg2texY = 64;
        sTradeData->unk_D8 = 0;
        sTradeData->unk_DA = 0;
        sTradeData->bg2srcX = 120;
        sTradeData->bg2srcY = 80;
        sTradeData->sXY = 256;
        sTradeData->bg2alpha = 0;
        break;
    case 1:
        if (!gReceivedRemoteLinkPlayers)
        {
            sTradeData->isCableTrade = TRUE;
            OpenLink();
            gMain.state++;
            sTradeData->timer = 0;
        }
        else
        {
            gMain.state = 4;
        }
        break;
    case 2:
        sTradeData->timer++;
        if (sTradeData->timer > 60)
        {
            sTradeData->timer = 0;
            gMain.state++;
        }
        break;
    case 3:
        if (IsLinkMaster())
        {
            if (GetLinkPlayerCount_2() >= GetSavedPlayerCount())
            {
                sTradeData->timer++;
                if (sTradeData->timer > 30)
                {
                    CheckShouldAdvanceLinkState();
                    gMain.state++;
                }
            }
            else
            {
                CheckLinkTimeout();
            }
        }
        else
        {
            gMain.state++;
        }
        break;
    case 4:
        CheckLinkTimeout();
        if (gReceivedRemoteLinkPlayers == 1 && IsLinkPlayerDataExchangeComplete() == 1)
        {
            gMain.state++;
        }
        break;
    case 5:
        sTradeData->tradeStatus1 = 0;
        sTradeData->tradeStatus2 = 0;
        sTradeData->scheduleLinkTransfer = 0;
        LoadTradeMonPic(0, 0);
        gMain.state++;
        break;
    case 6:
        LoadTradeMonPic(0, 1);
        gMain.state++;
        break;
    case 7:
        LoadTradeMonPic(1, 0);
        gMain.state++;
        break;
    case 8:
        LoadTradeMonPic(1, 1);
        LinkTradeDrawWindow();
        gMain.state++;
        break;
    case 9:
        LoadTradeGbaSpriteGfx();
        LoadSpriteSheet(&sTradeBallSpriteSheet);
        LoadSpritePalette(&sTradeBallSpritePal);
        gMain.state++;
        break;
    case 10:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        ShowBg(0);
        sTradeData->monSpecies[0] = GetMonData(&gPlayerParty[gSelectedTradeMonPositions[0]], MON_DATA_SPECIES2);
        sTradeData->monSpecies[1] = GetMonData(&gEnemyParty[gSelectedTradeMonPositions[1] % 6], MON_DATA_SPECIES2);
        memcpy(sTradeData->linkPartnerName, gLinkPlayers[GetMultiplayerId() ^ 1].name, 7);
        gMain.state++;
        break;
    case 11:
        InitTradeSequenceBgGpuRegs();
        TradeBufferOTnameAndNicknames();
        gMain.state++;
        break;
    case 12:
        if (!gPaletteFade.active)
        {
            if (gWirelessCommType != 0)
            {
                LoadWirelessStatusIndicatorSpriteGfx();
                CreateWirelessStatusIndicatorSprite(0, 0);
            }
            SetMainCallback2(CB2_RunTradeAnim_LinkTrade);
        }
        break;
    }
    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void InitTradeSequenceBgGpuRegs(void)
{
    SetTradeSequenceBgGpuRegs(5);
    SetTradeSequenceBgGpuRegs(0);
}

void LinkTradeDrawWindow(void)
{
    FillWindowPixelBuffer(0, PIXEL_FILL(15));
    PutWindowTilemap(0);
    CopyWindowToVram(0, COPYWIN_FULL);
}

static void TradeAnimInit_LoadGfx(void)
{
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, sBgTemplates, NELEMS(sBgTemplates));
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    SetBgTilemapBuffer(0, Alloc(BG_SCREEN_SIZE));
    SetBgTilemapBuffer(1, Alloc(BG_SCREEN_SIZE));
    SetBgTilemapBuffer(3, Alloc(BG_SCREEN_SIZE));
    DeactivateAllTextPrinters();
    // Doing the graphics load...
    DecompressAndLoadBgGfxUsingHeap(0, gBattleInterface_Textbox_Gfx, 0, 0, 0);
    LZDecompressWram(gBattleInterface_Textbox_Tilemap, gDecompressionBuffer);
    CopyToBgTilemapBuffer(0, gDecompressionBuffer, BG_SCREEN_SIZE, 0);
    LoadCompressedPalette(gBattleInterface_Textbox_Pal, 0x000, 0x20);
    InitWindows(sTradeMessageWindowTemplates);
    // ... and doing the same load again
    DecompressAndLoadBgGfxUsingHeap(0, gBattleInterface_Textbox_Gfx, 0, 0, 0);
    LZDecompressWram(gBattleInterface_Textbox_Tilemap, gDecompressionBuffer);
    CopyToBgTilemapBuffer(0, gDecompressionBuffer, BG_SCREEN_SIZE, 0);
    LoadCompressedPalette(gBattleInterface_Textbox_Pal, 0x000, 0x20);
}

static void CB2_InitTradeAnim_InGameTrade(void)
{
    u8 otName[11];

    switch (gMain.state)
    {
    case 0:
        gSelectedTradeMonPositions[0] = gSpecialVar_0x8005;
        gSelectedTradeMonPositions[1] = 6;
        StringCopy(gLinkPlayers[0].name, gSaveBlock2Ptr->playerName);
        GetMonData(&gEnemyParty[0], MON_DATA_OT_NAME, otName);
        StringCopy(gLinkPlayers[1].name, otName);
        sTradeData = AllocZeroed(sizeof(*sTradeData));
        AllocateMonSpritesGfx();
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();
        SetVBlankCallback(VBlankCB_TradeAnim);
        TradeAnimInit_LoadGfx();
        sTradeData->isLinkTrade = FALSE;
        sTradeData->unk_8C = 0;
        sTradeData->state = 0;
        sTradeData->bg2texX = 64;
        sTradeData->bg2texY = 64;
        sTradeData->unk_D8 = 0;
        sTradeData->unk_DA = 0;
        sTradeData->bg2srcX = 120;
        sTradeData->bg2srcY = 80;
        sTradeData->sXY = 256;
        sTradeData->bg2alpha = 0;
        sTradeData->timer = 0;
        gMain.state = 5;
        break;
    case 5:
        LoadTradeMonPic(0, 0);
        gMain.state++;
        break;
    case 6:
        LoadTradeMonPic(0, 1);
        gMain.state++;
        break;
    case 7:
        LoadTradeMonPic(1, 0);
        ShowBg(0);
        gMain.state++;
        break;
    case 8:
        LoadTradeMonPic(1, 1);
        FillWindowPixelBuffer(0, PIXEL_FILL(15));
        PutWindowTilemap(0);
        CopyWindowToVram(0, COPYWIN_FULL);
        gMain.state++;
        break;
    case 9:
        LoadTradeGbaSpriteGfx();
        LoadSpriteSheet(&sTradeBallSpriteSheet);
        LoadSpritePalette(&sTradeBallSpritePal);
        gMain.state++;
        break;
    case 10:
        ShowBg(0);
        gMain.state++;
        break;
    case 11:
        SetTradeSequenceBgGpuRegs(5);
        SetTradeSequenceBgGpuRegs(0);
        TradeBufferOTnameAndNicknames();
        gMain.state++;
        break;
    case 12:
        SetMainCallback2(CB2_RunTradeAnim_InGameTrade);
        break;
    }

    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void ReceivedMonSetPokedexFlags(u8 partyIdx)
{
    struct Pokemon * mon = &gPlayerParty[partyIdx];

    if (!GetMonData(mon, MON_DATA_IS_EGG))
    {
        u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
        u32 personality = GetMonData(mon, MON_DATA_PERSONALITY, NULL);
        species = SpeciesToNationalPokedexNum(species);
        GetSetPokedexFlag(species, FLAG_SET_SEEN);
        HandleSetPokedexFlag(species, FLAG_SET_CAUGHT, personality);
    }
}

static void RS_TryEnableNationalPokedex(void)
{
    u8 mpId = GetMultiplayerId();
    // Originally in Ruby but commented out
    /*if (gLinkPlayers[mpId ^ 1].lp_field_2 == 0x8000)
        EnableNationalPokedex();*/
}

static void TradeMons(u8 playerPartyIdx, u8 partnerPartyIdx)
{
    u8 friendship;

    // Get whether the offered Pokemon have mail
    struct Pokemon * playerMon = &gPlayerParty[playerPartyIdx];
    u16 playerMail = GetMonData(playerMon, MON_DATA_MAIL);

    struct Pokemon * partnerMon = &gEnemyParty[partnerPartyIdx];
    u16 partnerMail = GetMonData(partnerMon, MON_DATA_MAIL);

    // The mail attached to the sent Pokemon no longer exists in your file.
    if (playerMail != 0xFF)
        ClearMailStruct(&gSaveBlock1Ptr->mail[playerMail]);

    // This is where the actual trade happens!!
    sTradeData->mon = *playerMon;
    *playerMon = *partnerMon;
    *partnerMon = sTradeData->mon;

    // By default, a Pokemon received from a trade will have 70 Friendship.
    friendship = 70;
    if (!GetMonData(playerMon, MON_DATA_IS_EGG))
        SetMonData(playerMon, MON_DATA_FRIENDSHIP, &friendship);

    // Associate your partner's mail with the Pokemon they sent over.
    if (partnerMail != 0xFF)
        GiveMailToMon2(playerMon, &gLinkPartnerMail[partnerMail]);

    ReceivedMonSetPokedexFlags(playerPartyIdx);
    if (gReceivedRemoteLinkPlayers)
        RS_TryEnableNationalPokedex();
}

static void HandleLinkDataSend(void)
{
    switch (sTradeData->scheduleLinkTransfer)
    {
    case 1:
        if (IsLinkTaskFinished())
        {
            SendBlock(BitmaskAllOtherLinkPlayers(), sTradeData->linkData, 20);
            sTradeData->scheduleLinkTransfer++;
        }
    case 2:
        sTradeData->scheduleLinkTransfer = 0;
        break;
    }
}

static void CB2_RunTradeAnim_InGameTrade(void)
{
    DoTradeAnim();
    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void SetTradeSequenceBgGpuRegs(u8 state)
{
    switch (state)
    {
    case 0:
        sTradeData->bg2vofs = 0;
        sTradeData->bg2hofs = 0xB4;
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON);
        SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(2) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(18) | BGCNT_TXT512x256);
        LoadPalette(gTradeGba2_Pal, 0x10, 0x60);
        DmaCopyLarge16(3, gTradeGba_Gfx, (void *)BG_CHAR_ADDR(1), 0x1420, 0x1000);
        DmaCopy16Defvars(3, gTradeOrHatchMonShadowTilemap, (void *)BG_SCREEN_ADDR(18), 0x1000);
        break;
    case 1:
        sTradeData->bg1hofs = 0;
        sTradeData->bg1vofs = 0x15C;
        SetGpuReg(REG_OFFSET_BG1VOFS, 0x15C);
        SetGpuReg(REG_OFFSET_BG1CNT, BGCNT_PRIORITY(2) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(5) | BGCNT_TXT256x512);
        SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(2) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(18) | BGCNT_TXT256x512);
        if (sTradeData->isCableTrade)
        {
            DmaCopy16Defvars(3, sGbaMapCable, (void *)BG_SCREEN_ADDR(5), 0x1000);
        }
        else
        {
            DmaCopy16Defvars(3, sGbaMapWireless, (void *)BG_SCREEN_ADDR(5), 0x1000);
        }
        DmaCopyLarge16(3, gTradeGba_Gfx, (void *)BG_CHAR_ADDR(0), 0x1420, 0x1000);
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_OBJ_ON);
        break;
    case 2:
        sTradeData->bg1vofs = 0;
        sTradeData->bg1hofs = 0;
        if (!sTradeData->isCableTrade)
        {
            SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_OBJ_ON);
            LZ77UnCompVram(sWirelessCloseupMap, (void *)BG_SCREEN_ADDR(5));
            BlendPalettes(0x000000008, 0x10, RGB_BLACK);
        }
        else
        {
            SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_OBJ_ON);
            DmaCopy16Defvars(3, sCableCloseupMap, (void *)BG_SCREEN_ADDR(5), 0x800);
            BlendPalettes(0x00000001, 0x10, RGB_BLACK);
        }
        break;
    case 3:
        LoadPalette(sWirelessSignalAnimPals_Off, 0x30, 0x20);
        LZ77UnCompVram(sWirelessSignal4bpp, BG_CHAR_ADDR(1));
        LZ77UnCompVram(sWirelessSignalTilemap, BG_SCREEN_ADDR(18));
        sTradeData->bg2vofs = 0x50;
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON);
        break;
    case 4:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG2_ON | DISPCNT_OBJ_ON);
        SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(3) | BGCNT_CHARBASE(1) | BGCNT_256COLOR | BGCNT_SCREENBASE(18) | BGCNT_AFF128x128);
        sTradeData->bg2texX = 0x40;
        sTradeData->bg2texY = 0x5C;
        sTradeData->sXY = 0x20;
        sTradeData->bg2Zoom = 0x400;
        sTradeData->bg2alpha = 0;
        DmaCopyLarge16(3, sGbaAffineTiles, (void *)BG_CHAR_ADDR(1), 0x2840, 0x1000);
        if (sTradeData->isCableTrade)
        {
            DmaCopy16Defvars(3, sGbaAffineMapCable, (void *)BG_SCREEN_ADDR(18), 0x100);
        }
        else
        {
            DmaCopy16Defvars(3, sGbaAffineMapWireless, (void *)BG_SCREEN_ADDR(18), 0x100);
        }
        break;
    case 5:
        sTradeData->bg1vofs = 0;
        sTradeData->bg1hofs = 0;
        break;
    case 6:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG2_ON | DISPCNT_OBJ_ON);
        SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(3) | BGCNT_CHARBASE(1) | BGCNT_256COLOR | BGCNT_SCREENBASE(18) | BGCNT_TXT256x256);
        sTradeData->bg2texX = 0x40;
        sTradeData->bg2texY = 0x5C;
        sTradeData->sXY = 0x100;
        sTradeData->bg2Zoom = 0x80;
        sTradeData->bg2srcX = 0x78;
        sTradeData->bg2srcY = 0x50;
        sTradeData->bg2alpha = 0;
        DmaCopyLarge16(3, sGbaAffineTiles, BG_CHAR_ADDR(1), 0x2840, 0x1000);
        if (sTradeData->isCableTrade)
        {
            DmaCopy16Defvars(3, sGbaAffineMapCable, (void *)BG_SCREEN_ADDR(18), 0x100);
        }
        else
        {
            DmaCopy16Defvars(3, sGbaAffineMapWireless, (void *)BG_SCREEN_ADDR(18), 0x100);
        }
        break;
    case 7:
        sTradeData->bg2vofs = 0;
        sTradeData->bg2hofs = 0;
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(2) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(18) | BGCNT_TXT512x256);
        LoadPalette(gTradeGba2_Pal, 0x10, 0x60);
        DmaCopyLarge16(3, gTradeGba_Gfx, (void *)BG_CHAR_ADDR(1), 0x1420, 0x1000);
        DmaCopy16Defvars(3, gTradeOrHatchMonShadowTilemap, (void *)BG_SCREEN_ADDR(18), 0x1000);
        break;
    }
}

static void LoadTradeGbaSpriteGfx(void)
{
    LoadSpriteSheet(&sTradeGlow1SpriteSheet);
    LoadSpriteSheet(&sTradeGlow2SpriteSheet);
    LoadSpriteSheet(&sTradeCableEndSpriteSheet);
    LoadSpriteSheet(&sTradeGBAScreenSpriteSheet);
    LoadSpritePalette(&sTradeGlowSpritePal);
    LoadSpritePalette(&sTradeGbaSpritePal);
}

static void TradeBufferOTnameAndNicknames(void)
{
    u8 nickname[20];
    u8 mpId;
    const struct InGameTrade * inGameTrade;
    if (sTradeData->isLinkTrade)
    {
        mpId = GetMultiplayerId();
        StringCopy(gStringVar1, gLinkPlayers[mpId ^ 1].name);
        GetMonData(&gEnemyParty[gSelectedTradeMonPositions[1] % 6], MON_DATA_NICKNAME, nickname);
        StringCopy_Nickname(gStringVar3, nickname);
        GetMonData(&gPlayerParty[gSelectedTradeMonPositions[0]], MON_DATA_NICKNAME, nickname);
        StringCopy_Nickname(gStringVar2, nickname);
    }
    else
    {
        inGameTrade = &sInGameTrades[gSpecialVar_0x8004];
        StringCopy(gStringVar1, inGameTrade->otName);
        StringCopy_Nickname(gStringVar3, inGameTrade->nickname);
        GetMonData(&gPlayerParty[gSpecialVar_0x8005], MON_DATA_NICKNAME, nickname);
        StringCopy_Nickname(gStringVar2, nickname);
    }
}

static bool8 DoTradeAnim(void)
{
    if (sTradeData->isCableTrade)
        return DoTradeAnim_Cable();
    else
        return DoTradeAnim_Wireless();
}

static bool8 DoTradeAnim_Cable(void)
{
    u16 evoTarget;

    switch (sTradeData->state)
    {
    case 0:
        gSprites[sTradeData->pokePicSpriteIdxs[0]].invisible = FALSE;
        gSprites[sTradeData->pokePicSpriteIdxs[0]].x2 = -180;
        gSprites[sTradeData->pokePicSpriteIdxs[0]].y2 = gMonFrontPicCoords[sTradeData->tradeSpecies[0]].y_offset;
        sTradeData->state++;
        sTradeData->cachedMapMusic = GetCurrentMapMusic();
        PlayNewMapMusic(MUS_EVOLUTION);
        break;
    case 1:
        if (sTradeData->bg2hofs > 0)
        {
            gSprites[sTradeData->pokePicSpriteIdxs[0]].x2 += 3;
            sTradeData->bg2hofs -= 3;
        }
        else
        {
            gSprites[sTradeData->pokePicSpriteIdxs[0]].x2 = 0;
            sTradeData->bg2hofs = 0;
            sTradeData->state = 10;
        }
        break;
    case 10:
        StringExpandPlaceholders(gStringVar4, gText_XWillBeSentToY);
        DrawTextOnTradeWindow(0, gStringVar4, 0);

        if (sTradeData->tradeSpecies[0] != SPECIES_EGG)
        {
            PlayCry_Normal(sTradeData->tradeSpecies[0], 0);
        }

        sTradeData->state = 11;
        sTradeData->timer = 0;
        break;
    case 11:
        if (++sTradeData->timer == 80)
        {
            sTradeData->pokeballSpriteId = CreateTradePokeballSprite(sTradeData->pokePicSpriteIdxs[0], gSprites[sTradeData->pokePicSpriteIdxs[0]].oam.paletteNum, 120, 32, 2, 1, 0x14, 0xfffff);
            sTradeData->state++;
            StringExpandPlaceholders(gStringVar4, gText_ByeByeVar1);
            DrawTextOnTradeWindow(0, gStringVar4, 0);
        }
        break;
    case 12:
        if (gSprites[sTradeData->pokeballSpriteId].callback == SpriteCallbackDummy)
        {
            sTradeData->pokeballSpriteId2 = CreateSprite(&sTradePokeballSpriteTemplate, 120, 32, 0);
            gSprites[sTradeData->pokeballSpriteId2].callback = SpriteCB_TradePokeball_Outbound;
            DestroySprite(&gSprites[sTradeData->pokeballSpriteId]);
            sTradeData->state++;
        }
        break;
    case 13:
        // The game waits here for the sprite to finish its animation sequence.
        break;
    case 14:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        sTradeData->state = 20;
        break;
    case 20:
        if (!gPaletteFade.active)
        {
            SetTradeSequenceBgGpuRegs(4);
            FillWindowPixelBuffer(0, PIXEL_FILL(15));
            CopyWindowToVram(0, COPYWIN_FULL);
            sTradeData->state++;
        }
        break;
    case 21:
        BeginNormalPaletteFade(PALETTES_ALL, -1, 16, 0, RGB_BLACK);
        sTradeData->state++;
        break;
    case 22:
        if (!gPaletteFade.active)
        {
            sTradeData->state = 23;
        }
        break;
    case 23:
        if (sTradeData->bg2Zoom > 0x100)
        {
            sTradeData->bg2Zoom -= 0x34;
        }
        else
        {
            SetTradeSequenceBgGpuRegs(1);
            sTradeData->bg2Zoom = 0x80;
            sTradeData->state++;
            sTradeData->timer = 0;
        }
        sTradeData->sXY = 0x8000 / sTradeData->bg2Zoom;
        break;
    case 24:
        if (++sTradeData->timer > 20)
        {
            SetTradeBGAffine();
            sTradeData->gbaScreenSpriteId = CreateSprite(&sTradeGBAScreenSpriteTemplate1, 120, 80, 0);
            sTradeData->state++;
        }
        break;
    case 25:
        if (gSprites[sTradeData->gbaScreenSpriteId].animEnded)
        {
            DestroySprite(&gSprites[sTradeData->gbaScreenSpriteId]);
            SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_EFFECT_BLEND |
                                         BLDCNT_TGT2_BG1 |
                                         BLDCNT_TGT2_BG2);
            SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(12, 4));
            sTradeData->state++;
        }
        break;
    case 26:
        if (--sTradeData->bg1vofs == 316)
        {
            sTradeData->state++;
        }
        if (sTradeData->bg1vofs == 328)
        {
            sTradeData->linkCableEndSpriteId = CreateSprite(&sGameLinkCableEndSpriteTemplate, 128, 65, 0);
        }
        break;
    case 27:
        sTradeData->tradeGlow1SpriteId = CreateSprite(&sTradeGlow1SpriteTemplate, 128, 80, 3);
        sTradeData->gbaScreenSpriteId = CreateSprite(&sGlowBallSpriteTemplate, 128, 80, 0);
        StartSpriteAnim(&gSprites[sTradeData->gbaScreenSpriteId], 1);
        sTradeData->state++;
        break;
    case 28:
        if ((sTradeData->bg1vofs -= 2) == 166)
        {
            sTradeData->state = 200;
        }
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_1 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG1_ON |
                                      DISPCNT_OBJ_ON);
        break;
    case 200:
        gSprites[sTradeData->tradeGlow1SpriteId].y -= 2;
        gSprites[sTradeData->gbaScreenSpriteId].y -= 2;
        if (gSprites[sTradeData->tradeGlow1SpriteId].y < -8)
        {
            sTradeData->state = 29;
        }
        break;
    case 29:
        BeginNormalPaletteFade(PALETTES_ALL, -1, 0, 16, RGB_BLACK);
        sTradeData->state = 30;
        break;
    case 30:
        if (!gPaletteFade.active)
        {
            DestroySprite(&gSprites[sTradeData->tradeGlow1SpriteId]);
            DestroySprite(&gSprites[sTradeData->gbaScreenSpriteId]);
            SetTradeSequenceBgGpuRegs(2);
            sTradeData->state++;
        }
        break;
    case 31:
        BeginNormalPaletteFade(PALETTES_ALL, -1, 16, 0, RGB_BLACK);
        sTradeData->tradeGlow1SpriteId = CreateSprite(&sGlowBallSpriteTemplate, 111, 170, 0);
        sTradeData->gbaScreenSpriteId = CreateSprite(&sGlowBallSpriteTemplate, 129, -10, 0);
        sTradeData->state++;
        break;
    case 32:
        if (!gPaletteFade.active)
        {
            PlaySE(SE_WARP_OUT);
            sTradeData->state++;
        }
        gSprites[sTradeData->tradeGlow1SpriteId].y2 -= 3;
        gSprites[sTradeData->gbaScreenSpriteId].y2 += 3;
        break;
    case 33:
        gSprites[sTradeData->tradeGlow1SpriteId].y2 -= 3;
        gSprites[sTradeData->gbaScreenSpriteId].y2 += 3;
        if (gSprites[sTradeData->tradeGlow1SpriteId].y2 <= -90)
        {
            gSprites[sTradeData->tradeGlow1SpriteId].data[1] = 1;
            gSprites[sTradeData->gbaScreenSpriteId].data[1] = 1;
            sTradeData->state++;
        }
        break;
    case 34:
        BlendPalettes(0x1, 16, RGB_WHITEALPHA);
        sTradeData->state++;
        break;
    case 35:
        BlendPalettes(0x1, 0, RGB_WHITEALPHA);
        sTradeData->state++;
        break;
    case 36:
        BlendPalettes(0x1, 16, RGB_WHITEALPHA);
        sTradeData->state++;
        break;
    case 37:
        if (!IsPokeSpriteNotFlipped(sTradeData->tradeSpecies[0]))
        {
            gSprites[sTradeData->pokePicSpriteIdxs[0]].affineAnims = sSpriteAffineAnimTable_PlayerPokePicAlt;
            gSprites[sTradeData->pokePicSpriteIdxs[0]].oam.affineMode = ST_OAM_AFFINE_DOUBLE;
            CalcCenterToCornerVec(&gSprites[sTradeData->pokePicSpriteIdxs[0]], 0, 3, 3);
            StartSpriteAffineAnim(&gSprites[sTradeData->pokePicSpriteIdxs[0]], 0);
        }
        else
        {
            StartSpriteAffineAnim(&gSprites[sTradeData->pokePicSpriteIdxs[0]], 0);
        }
        StartSpriteAffineAnim(&gSprites[sTradeData->pokePicSpriteIdxs[1]], 0);
        gSprites[sTradeData->pokePicSpriteIdxs[0]].x = 60;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].x = 180;
        gSprites[sTradeData->pokePicSpriteIdxs[0]].y = 192;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].y = -32;
        gSprites[sTradeData->pokePicSpriteIdxs[0]].invisible = FALSE;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].invisible = FALSE;
        sTradeData->state++;
        break;
    case 38:
        gSprites[sTradeData->pokePicSpriteIdxs[0]].y2 -= 3;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].y2 += 3;
        if (gSprites[sTradeData->pokePicSpriteIdxs[0]].y2 < -160 && gSprites[sTradeData->pokePicSpriteIdxs[0]].y2 >= -163)
        {
            PlaySE(SE_WARP_IN);
        }
        if (gSprites[sTradeData->pokePicSpriteIdxs[0]].y2 < -222)
        {
            gSprites[sTradeData->tradeGlow1SpriteId].data[1] = 0;
            gSprites[sTradeData->gbaScreenSpriteId].data[1] = 0;
            sTradeData->state++;
            gSprites[sTradeData->pokePicSpriteIdxs[0]].invisible = TRUE;
            gSprites[sTradeData->pokePicSpriteIdxs[1]].invisible = TRUE;
            BlendPalettes(0x1, 0, RGB_WHITEALPHA);
        }
        break;
    case 39:
        gSprites[sTradeData->tradeGlow1SpriteId].y2 -= 3;
        gSprites[sTradeData->gbaScreenSpriteId].y2 += 3;
        if (gSprites[sTradeData->tradeGlow1SpriteId].y2 <= -222)
        {
            BeginNormalPaletteFade(PALETTES_ALL, -1, 0, 16, RGB_BLACK);
            sTradeData->state++;
            DestroySprite(&gSprites[sTradeData->tradeGlow1SpriteId]);
            DestroySprite(&gSprites[sTradeData->gbaScreenSpriteId]);
        }
        break;
    case 40:
        if (!gPaletteFade.active)
        {
            sTradeData->state++;
            SetTradeSequenceBgGpuRegs(1);
            sTradeData->bg1vofs = 166;
            sTradeData->tradeGlow1SpriteId = CreateSprite(&sTradeGlow1SpriteTemplate, 128, -20, 3);
            sTradeData->gbaScreenSpriteId = CreateSprite(&sGlowBallSpriteTemplate, 128, -20, 0);
            StartSpriteAnim(&gSprites[sTradeData->gbaScreenSpriteId], 1);
        }
        break;
    case 41:
        BeginNormalPaletteFade(PALETTES_ALL, -1, 16, 0, RGB_BLACK);
        sTradeData->state++;
        break;
    case 42:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG1_ON |
                                      DISPCNT_OBJ_ON);
        if (!gPaletteFade.active)
        {
            sTradeData->state++;
        }
        break;
    case 43:
        gSprites[sTradeData->tradeGlow1SpriteId].y2 += 3;
        gSprites[sTradeData->gbaScreenSpriteId].y2 += 3;
        if (gSprites[sTradeData->tradeGlow1SpriteId].y2 + gSprites[sTradeData->tradeGlow1SpriteId].y == 64)
        {
            sTradeData->state++;
        }
        break;
    case 44:
        if ((sTradeData->bg1vofs += 2) > 316)
        {
            sTradeData->bg1vofs = 316;
            sTradeData->state++;
        }
        break;
    case 45:
        DestroySprite(&gSprites[sTradeData->tradeGlow1SpriteId]);
        DestroySprite(&gSprites[sTradeData->gbaScreenSpriteId]);
        sTradeData->state++;
        sTradeData->timer = 0;
        break;
    case 46:
        if (++sTradeData->timer == 10)
        {
            sTradeData->state++;
        }
        break;
    case 47:
        if (++sTradeData->bg1vofs > 348)
        {
            sTradeData->bg1vofs = 348;
            sTradeData->state++;
        }
        if (sTradeData->bg1vofs == 328 && sTradeData->isCableTrade)
        {
            sTradeData->linkCableEndSpriteId = CreateSprite(&sGameLinkCableEndSpriteTemplate, 128, 65, 0);
            gSprites[sTradeData->linkCableEndSpriteId].callback = SpriteCB_GameLinkCableEnd_Inbound;
        }
        break;
    case 48:
        sTradeData->gbaScreenSpriteId = CreateSprite(&sTradeGBAScreenSpriteTemplate1, 120, 80, 0);
        sTradeData->state = 50;
        break;
    case 50:
        if (gSprites[sTradeData->gbaScreenSpriteId].animEnded)
        {
            DestroySprite(&gSprites[sTradeData->gbaScreenSpriteId]);
            SetTradeSequenceBgGpuRegs(6);
            sTradeData->state++;
            PlaySE(SE_M_SAND_ATTACK);
        }
        break;
    case 51:
        if (sTradeData->bg2Zoom < 0x400)
        {
            sTradeData->bg2Zoom += 0x34;
        }
        else
        {
            sTradeData->bg2Zoom = 0x400;
            sTradeData->state++;
        }
        sTradeData->sXY = 0x8000 / sTradeData->bg2Zoom;
        break;
    case 52:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        sTradeData->state = 60;
        break;

    case 60:
        if (!gPaletteFade.active)
        {
            SetTradeSequenceBgGpuRegs(5);
            SetTradeSequenceBgGpuRegs(7);
            gPaletteFade.bufferTransferDisabled = TRUE;
            sTradeData->state++;
        }
        break;
    case 61:
        gPaletteFade.bufferTransferDisabled = FALSE;
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        sTradeData->state++;
        break;
    case 62:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG2_ON |
                                      DISPCNT_OBJ_ON);
        if (!gPaletteFade.active)
        {
            sTradeData->state++;
        }
        break;
    case 63:
        sTradeData->pokeballSpriteId2 = CreateSprite(&sTradePokeballSpriteTemplate, 120, -8, 0);
        gSprites[sTradeData->pokeballSpriteId2].data[3] = 74;
        gSprites[sTradeData->pokeballSpriteId2].callback = SpriteCB_TradePokeball_Inbound;
        StartSpriteAnim(&gSprites[sTradeData->pokeballSpriteId2], 1);
        StartSpriteAffineAnim(&gSprites[sTradeData->pokeballSpriteId2], 2);
        BlendPalettes(1 << (16 + gSprites[sTradeData->pokeballSpriteId2].oam.paletteNum), 16, RGB_WHITEALPHA);
        sTradeData->state++;
        sTradeData->timer = 0;
        break;
    case 64:
        BeginNormalPaletteFade(1 << (16 + gSprites[sTradeData->pokeballSpriteId2].oam.paletteNum), 1, 16, 0, RGB_WHITEALPHA);
        sTradeData->state++;
        break;
    case 65:
        if (gSprites[sTradeData->pokeballSpriteId2].callback == SpriteCallbackDummy)
        {
            HandleLoadSpecialPokePic(&gMonFrontPicTable[sTradeData->tradeSpecies[1]], gMonSpritesGfxPtr->sprites[3], sTradeData->tradeSpecies[1], sTradeData->monPersonalities[1]);
            sTradeData->state++;
        }
        break;
    case 66:
        gSprites[sTradeData->pokePicSpriteIdxs[1]].x = 120;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].y = gMonFrontPicCoords[sTradeData->tradeSpecies[1]].y_offset + 60;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].x2 = 0;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].y2 = 0;
        StartSpriteAnim(&gSprites[sTradeData->pokePicSpriteIdxs[1]], 0);
        CreatePokeballSpriteToReleaseMon(sTradeData->pokePicSpriteIdxs[1], gSprites[sTradeData->pokePicSpriteIdxs[1]].oam.paletteNum, 120, 84, 2, 1, 20, 0xFFFFF);
        FreeSpriteOamMatrix(&gSprites[sTradeData->pokeballSpriteId2]);
        DestroySprite(&gSprites[sTradeData->pokeballSpriteId2]);
        sTradeData->state++;
        break;
    case 67:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG0_ON |
                                      DISPCNT_BG2_ON |
                                      DISPCNT_OBJ_ON);
        StringExpandPlaceholders(gStringVar4, gText_XSentOverY);
        DrawTextOnTradeWindow(0, gStringVar4, 0);
        sTradeData->state = 167;
        sTradeData->timer = 0;
        break;
        // 167 and 267 are extra cases added in for animations
    case 167:
        if (++sTradeData->timer > 60)
        {
            if (sTradeData->tradeSpecies[1] != SPECIES_EGG)
            {
                PlayCry_Normal(sTradeData->tradeSpecies[1], 0);
            }
            sTradeData->state = 267;
            sTradeData->timer = 0;
        }
        break;
    case 267:
        if (IsCryFinished())
        {
            sTradeData->state = 68;
        }
        break;
    case 68:
        if (++sTradeData->timer == 10)
        {
            PlayFanfare(MUS_EVOLVED);
        }
        if (sTradeData->timer == 250)
        {
            sTradeData->state++;
            StringExpandPlaceholders(gStringVar4, gText_TakeGoodCareOfX);
            DrawTextOnTradeWindow(0, gStringVar4, 0);
            sTradeData->timer = 0;
        }
        break;
    case 69:
        if (++sTradeData->timer == 60)
        {
            sTradeData->state++;
        }
        break;
    case 70:
        CheckPartnersMonForRibbons();
        sTradeData->state++;
        break;
    case 71:
        if (sTradeData->isLinkTrade)
        {
            return TRUE;
        }
        else if (JOY_NEW(A_BUTTON))
        {
            sTradeData->state++;
        }
        break;
    case 72: // Only if in-game trade
        TradeMons(gSpecialVar_0x8005, 0);
        gCB2_AfterEvolution = CB2_RunTradeAnim_InGameTrade;
        evoTarget = GetEvolutionTargetSpecies(&gPlayerParty[gSelectedTradeMonPositions[0]], EVO_MODE_TRADE, ITEM_NONE);
        if (evoTarget != SPECIES_NONE)
        {
            TradeEvolutionScene(&gPlayerParty[gSelectedTradeMonPositions[0]], evoTarget, sTradeData->pokePicSpriteIdxs[1], gSelectedTradeMonPositions[0]);
        }
        sTradeData->state++;
        break;
    case 73:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        sTradeData->state++;
        break;
    case 74:
        if (!gPaletteFade.active)
        {
            PlayNewMapMusic(sTradeData->cachedMapMusic);
            if (sTradeData)
            {
                FreeAllWindowBuffers();
                Free(GetBgTilemapBuffer(3));
                Free(GetBgTilemapBuffer(1));
                Free(GetBgTilemapBuffer(0));
                FreeMonSpritesGfx();
                FREE_AND_SET_NULL(sTradeData);
            }
            SetMainCallback2(CB2_ReturnToField);
            BufferInGameTradeMonName();
            HelpSystem_Enable();
        }
        break;
    }
    return FALSE;
}

static bool8 DoTradeAnim_Wireless(void)
{
    u16 evoTarget;

    switch (sTradeData->state)
    {
    case 0:
        gSprites[sTradeData->pokePicSpriteIdxs[0]].invisible = FALSE;
        gSprites[sTradeData->pokePicSpriteIdxs[0]].x2 = -180;
        gSprites[sTradeData->pokePicSpriteIdxs[0]].y2 = gMonFrontPicCoords[sTradeData->tradeSpecies[0]].y_offset;
        sTradeData->state++;
        sTradeData->cachedMapMusic = GetCurrentMapMusic();
        PlayNewMapMusic(MUS_EVOLUTION);
        break;
    case 1:
        if (sTradeData->bg2hofs > 0)
        {
            gSprites[sTradeData->pokePicSpriteIdxs[0]].x2 += 3;
            sTradeData->bg2hofs -= 3;
        }
        else
        {
            gSprites[sTradeData->pokePicSpriteIdxs[0]].x2 = 0;
            sTradeData->bg2hofs = 0;
            sTradeData->state = 10;
        }
        break;
    case 10:
        StringExpandPlaceholders(gStringVar4, gText_XWillBeSentToY);
        DrawTextOnTradeWindow(0, gStringVar4, 0);

        if (sTradeData->tradeSpecies[0] != SPECIES_EGG)
        {
            PlayCry_Normal(sTradeData->tradeSpecies[0], 0);
        }

        sTradeData->state = 11;
        sTradeData->timer = 0;
        break;
    case 11:
        if (++sTradeData->timer == 80)
        {
            sTradeData->pokeballSpriteId = CreateTradePokeballSprite(sTradeData->pokePicSpriteIdxs[0], gSprites[sTradeData->pokePicSpriteIdxs[0]].oam.paletteNum, 120, 32, 2, 1, 0x14, 0xfffff);
            sTradeData->state++;
            StringExpandPlaceholders(gStringVar4, gText_ByeByeVar1);
            DrawTextOnTradeWindow(0, gStringVar4, 0);
        }
        break;
    case 12:
        if (gSprites[sTradeData->pokeballSpriteId].callback == SpriteCallbackDummy)
        {
            sTradeData->pokeballSpriteId2 = CreateSprite(&sTradePokeballSpriteTemplate, 120, 32, 0);
            gSprites[sTradeData->pokeballSpriteId2].callback = SpriteCB_TradePokeball_Outbound;
            DestroySprite(&gSprites[sTradeData->pokeballSpriteId]);
            sTradeData->state++;
        }
        break;
    case 13:
        // The game waits here for the sprite to finish its animation sequence.
        break;
    case 14:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        sTradeData->state = 20;
        break;
    case 20:
        if (!gPaletteFade.active)
        {
            SetTradeSequenceBgGpuRegs(4);
            FillWindowPixelBuffer(0, PIXEL_FILL(15));
            CopyWindowToVram(0, COPYWIN_FULL);
            sTradeData->state++;
        }
        break;
    case 21:
        BeginNormalPaletteFade(PALETTES_ALL, -1, 16, 0, RGB_BLACK);
        sTradeData->state++;
        break;
    case 22:
        if (!gPaletteFade.active)
        {
            sTradeData->state = 23;
        }
        break;
    case 23:
        if (sTradeData->bg2Zoom > 0x100)
        {
            sTradeData->bg2Zoom -= 0x34;
        }
        else
        {
            SetTradeSequenceBgGpuRegs(1);
            sTradeData->bg2Zoom = 0x80;
            sTradeData->state = 124;
            sTradeData->timer = 0;
        }
        sTradeData->sXY = 0x8000 / sTradeData->bg2Zoom;
        break;
    case 124:
        if (++sTradeData->timer > 20)
        {
            SetTradeSequenceBgGpuRegs(3);
            sTradeData->gbaScreenSpriteId = CreateSprite(&sTradeGBAScreenSpriteTemplate2, 120, 80, 0);
            sTradeData->state++;
        }
        break;
    case 125:
        if (gSprites[sTradeData->gbaScreenSpriteId].animEnded)
        {
            DestroySprite(&gSprites[sTradeData->gbaScreenSpriteId]);
            SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG1 |
                                         BLDCNT_TGT1_OBJ |
                                         BLDCNT_EFFECT_BLEND |
                                         BLDCNT_TGT2_BG2);
            SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(16, 4));
            CreateTask(Task_AnimateWirelessSignal, 5);
            sTradeData->state++;
        }
        break;
    case 126:
        if (!FuncIsActiveTask(Task_AnimateWirelessSignal))
        {
            sTradeData->state = 26;
        }
        break;
    case 26:
        if (--sTradeData->bg1vofs == 316)
        {
            sTradeData->state++;
        }
        break;
    case 27:
        sTradeData->tradeGlow1SpriteId = CreateSprite(&sTradeGlow1SpriteTemplate, 120, 80, 3);
        gSprites[sTradeData->tradeGlow1SpriteId].callback = SpriteCB_TradeGlowWireless;
        sTradeData->gbaScreenSpriteId = CreateSprite(&sGlowBallSpriteTemplate, 120, 80, 0);
        StartSpriteAnim(&gSprites[sTradeData->gbaScreenSpriteId], 1);
        sTradeData->state++;
        break;
    case 28:
        if ((sTradeData->bg1vofs -= 3) == 166)
        {
            sTradeData->state = 200;
        }
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_1 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG1_ON |
                                      DISPCNT_OBJ_ON);
        break;
    case 200:
        gSprites[sTradeData->tradeGlow1SpriteId].y -= 2;
        gSprites[sTradeData->gbaScreenSpriteId].y -= 2;
        if (gSprites[sTradeData->tradeGlow1SpriteId].y < -8)
        {
            sTradeData->state = 29;
        }
        break;
    case 29:
        BeginNormalPaletteFade(PALETTES_ALL, -1, 0, 16, RGB_BLACK);
        sTradeData->state = 30;
        break;
    case 30:
        if (!gPaletteFade.active)
        {
            DestroySprite(&gSprites[sTradeData->tradeGlow1SpriteId]);
            DestroySprite(&gSprites[sTradeData->gbaScreenSpriteId]);
            SetTradeSequenceBgGpuRegs(2);
            sTradeData->state++;
        }
        break;
    case 31:
        BeginNormalPaletteFade(PALETTES_ALL, -1, 16, 0, RGB_BLACK);
        sTradeData->tradeGlow1SpriteId = CreateSprite(&sGlowBallSpriteTemplate, 111, 170, 0);
        sTradeData->gbaScreenSpriteId = CreateSprite(&sGlowBallSpriteTemplate, 129, -10, 0);
        sTradeData->state++;
        break;
    case 32:
        if (!gPaletteFade.active)
        {
            PlaySE(SE_WARP_OUT);
            sTradeData->state++;
        }
        gSprites[sTradeData->tradeGlow1SpriteId].y2 -= 3;
        gSprites[sTradeData->gbaScreenSpriteId].y2 += 3;
        break;
    case 33:
        gSprites[sTradeData->tradeGlow1SpriteId].y2 -= 3;
        gSprites[sTradeData->gbaScreenSpriteId].y2 += 3;
        if (gSprites[sTradeData->tradeGlow1SpriteId].y2 <= -90)
        {
            gSprites[sTradeData->tradeGlow1SpriteId].data[1] = 1;
            gSprites[sTradeData->gbaScreenSpriteId].data[1] = 1;
            sTradeData->state++;
            CreateTask(Task_OpenCenterWhiteColumn, 5);
        }
        break;
    case 34:
        BlendPalettes(0x8, 16, RGB_WHITEALPHA);
        sTradeData->state++;
        break;
    case 35:
        BlendPalettes(0x8, 16, RGB_WHITEALPHA);
        sTradeData->state++;
        break;
    case 36:
        BlendPalettes(0x8, 16, RGB_WHITEALPHA);
        sTradeData->state++;
        break;
    case 37:
        if (!IsPokeSpriteNotFlipped(sTradeData->tradeSpecies[0]))
        {
            gSprites[sTradeData->pokePicSpriteIdxs[0]].affineAnims = sSpriteAffineAnimTable_PlayerPokePicAlt;
            gSprites[sTradeData->pokePicSpriteIdxs[0]].oam.affineMode = ST_OAM_AFFINE_DOUBLE;
            CalcCenterToCornerVec(&gSprites[sTradeData->pokePicSpriteIdxs[0]], 0, 3, 3);
            StartSpriteAffineAnim(&gSprites[sTradeData->pokePicSpriteIdxs[0]], 0);
        }
        else
        {
            StartSpriteAffineAnim(&gSprites[sTradeData->pokePicSpriteIdxs[0]], 0);
        }
        StartSpriteAffineAnim(&gSprites[sTradeData->pokePicSpriteIdxs[1]], 0);
        gSprites[sTradeData->pokePicSpriteIdxs[0]].x = 40;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].x = 200;
        gSprites[sTradeData->pokePicSpriteIdxs[0]].y = 192;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].y = -32;
        gSprites[sTradeData->pokePicSpriteIdxs[0]].invisible = FALSE;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].invisible = FALSE;
        sTradeData->state++;
        break;
    case 38:
        gSprites[sTradeData->pokePicSpriteIdxs[0]].y2 -= 3;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].y2 += 3;
        if (gSprites[sTradeData->pokePicSpriteIdxs[0]].y2 < -160 && gSprites[sTradeData->pokePicSpriteIdxs[0]].y2 >= -163)
        {
            PlaySE(SE_WARP_IN);
        }
        if (gSprites[sTradeData->pokePicSpriteIdxs[0]].y2 < -222)
        {
            gSprites[sTradeData->tradeGlow1SpriteId].data[1] = 0;
            gSprites[sTradeData->gbaScreenSpriteId].data[1] = 0;
            sTradeData->state++;
            gSprites[sTradeData->pokePicSpriteIdxs[0]].invisible = TRUE;
            gSprites[sTradeData->pokePicSpriteIdxs[1]].invisible = TRUE;
            CreateTask(Task_CloseCenterWhiteColumn, 5);
        }
        break;
    case 39:
        gSprites[sTradeData->tradeGlow1SpriteId].y2 -= 3;
        gSprites[sTradeData->gbaScreenSpriteId].y2 += 3;
        if (gSprites[sTradeData->tradeGlow1SpriteId].y2 <= -222)
        {
            BeginNormalPaletteFade(PALETTES_ALL, -1, 0, 16, RGB_BLACK);
            sTradeData->state++;
            DestroySprite(&gSprites[sTradeData->tradeGlow1SpriteId]);
            DestroySprite(&gSprites[sTradeData->gbaScreenSpriteId]);
        }
        break;
    case 40:
        if (!gPaletteFade.active)
        {
            sTradeData->state++;
            SetTradeSequenceBgGpuRegs(1);
            sTradeData->bg1vofs = 166;
            SetTradeSequenceBgGpuRegs(3);
            sTradeData->bg2vofs = 412;
            sTradeData->tradeGlow1SpriteId = CreateSprite(&sTradeGlow1SpriteTemplate, 120, -20, 3);
            gSprites[sTradeData->tradeGlow1SpriteId].callback = SpriteCB_TradeGlowWireless;
            sTradeData->gbaScreenSpriteId = CreateSprite(&sGlowBallSpriteTemplate, 120, -20, 0);
            StartSpriteAnim(&gSprites[sTradeData->gbaScreenSpriteId], 1);
        }
        break;
    case 41:
        BeginNormalPaletteFade(PALETTES_ALL, -1, 16, 0, RGB_BLACK);
        sTradeData->state++;
        break;
    case 42:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG1_ON |
                                      DISPCNT_OBJ_ON);
        if (!gPaletteFade.active)
        {
            sTradeData->state++;
        }
        break;
    case 43:
        gSprites[sTradeData->tradeGlow1SpriteId].y2 += 4;
        gSprites[sTradeData->gbaScreenSpriteId].y2 += 4;
        if (gSprites[sTradeData->tradeGlow1SpriteId].y2 + gSprites[sTradeData->tradeGlow1SpriteId].y == 64)
        {
            sTradeData->state = 144;
            sTradeData->timer = 0;
        }
        break;
    case 144:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG1_ON |
                                      DISPCNT_BG2_ON |
                                      DISPCNT_OBJ_ON);
        sTradeData->bg1vofs += 3;
        sTradeData->bg2vofs += 3;
        if (++sTradeData->timer == 10)
        {
            u8 taskId = CreateTask(Task_AnimateWirelessSignal, 5);
            gTasks[taskId].data[2] = TRUE;
        }
        if (sTradeData->bg1vofs > 316)
        {
            sTradeData->bg1vofs = 316;
            sTradeData->state++;
        }
        break;
    case 145:
        DestroySprite(&gSprites[sTradeData->tradeGlow1SpriteId]);
        DestroySprite(&gSprites[sTradeData->gbaScreenSpriteId]);
        sTradeData->state++;
        sTradeData->timer = 0;
        break;
    case 146:
        if (!FuncIsActiveTask(Task_AnimateWirelessSignal))
        {
            sTradeData->state = 46;
            sTradeData->timer = 0;
        }
        break;
    case 46:
        if (++sTradeData->timer == 10)
        {
            sTradeData->state++;
        }
        break;
    case 47:
        if (++sTradeData->bg1vofs > 348)
        {
            sTradeData->bg1vofs = 348;
            sTradeData->state++;
        }
        break;
    case 48:
        sTradeData->gbaScreenSpriteId = CreateSprite(&sTradeGBAScreenSpriteTemplate1, 120, 80, 0);
        sTradeData->state = 50;
        break;
    case 50:
        if (gSprites[sTradeData->gbaScreenSpriteId].animEnded)
        {
            DestroySprite(&gSprites[sTradeData->gbaScreenSpriteId]);
            SetTradeSequenceBgGpuRegs(6);
            sTradeData->state++;
            PlaySE(SE_M_SAND_ATTACK);
        }
        break;
    case 51:
        if (sTradeData->bg2Zoom < 0x400)
        {
            sTradeData->bg2Zoom += 0x34;
        }
        else
        {
            sTradeData->bg2Zoom = 0x400;
            sTradeData->state++;
        }
        sTradeData->sXY = 0x8000 / sTradeData->bg2Zoom;
        break;
    case 52:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        sTradeData->state = 60;
        break;

    case 60:
        if (!gPaletteFade.active)
        {
            SetTradeSequenceBgGpuRegs(5);
            SetTradeSequenceBgGpuRegs(7);
            gPaletteFade.bufferTransferDisabled = TRUE;
            sTradeData->state++;
        }
        break;
    case 61:
        gPaletteFade.bufferTransferDisabled = FALSE;
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        sTradeData->state++;
        break;
    case 62:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG2_ON |
                                      DISPCNT_OBJ_ON);
        if (!gPaletteFade.active)
        {
            sTradeData->state++;
        }
        break;
    case 63:
        sTradeData->pokeballSpriteId2 = CreateSprite(&sTradePokeballSpriteTemplate, 120, -8, 0);
        gSprites[sTradeData->pokeballSpriteId2].data[3] = 74;
        gSprites[sTradeData->pokeballSpriteId2].callback = SpriteCB_TradePokeball_Inbound;
        StartSpriteAnim(&gSprites[sTradeData->pokeballSpriteId2], 1);
        StartSpriteAffineAnim(&gSprites[sTradeData->pokeballSpriteId2], 2);
        BlendPalettes(1 << (16 + gSprites[sTradeData->pokeballSpriteId2].oam.paletteNum), 16, RGB_WHITEALPHA);
        sTradeData->state++;
        sTradeData->timer = 0;
        break;
    case 64:
        BeginNormalPaletteFade(1 << (16 + gSprites[sTradeData->pokeballSpriteId2].oam.paletteNum), 1, 16, 0, RGB_WHITEALPHA);
        sTradeData->state++;
        break;
    case 65:
        if (gSprites[sTradeData->pokeballSpriteId2].callback == SpriteCallbackDummy)
        {
            HandleLoadSpecialPokePic(&gMonFrontPicTable[sTradeData->tradeSpecies[1]], gMonSpritesGfxPtr->sprites[3], sTradeData->tradeSpecies[1], sTradeData->monPersonalities[1]);
            sTradeData->state++;
        }
        break;
    case 66:
        gSprites[sTradeData->pokePicSpriteIdxs[1]].x = 120;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].y = gMonFrontPicCoords[sTradeData->tradeSpecies[1]].y_offset + 60;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].x2 = 0;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].y2 = 0;
        StartSpriteAnim(&gSprites[sTradeData->pokePicSpriteIdxs[1]], 0);
        CreatePokeballSpriteToReleaseMon(sTradeData->pokePicSpriteIdxs[1], gSprites[sTradeData->pokePicSpriteIdxs[1]].oam.paletteNum, 120, 84, 2, 1, 20, 0xFFFFF);
        FreeSpriteOamMatrix(&gSprites[sTradeData->pokeballSpriteId2]);
        DestroySprite(&gSprites[sTradeData->pokeballSpriteId2]);
        sTradeData->state++;
        break;
    case 67:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG0_ON |
                                      DISPCNT_BG2_ON |
                                      DISPCNT_OBJ_ON);
        StringExpandPlaceholders(gStringVar4, gText_XSentOverY);
        DrawTextOnTradeWindow(0, gStringVar4, 0);
        sTradeData->state = 167;
        sTradeData->timer = 0;
        break;
        // 167 and 267 are extra cases added in for animations
    case 167:
        if (++sTradeData->timer > 60)
        {
            if (sTradeData->tradeSpecies[1] != SPECIES_EGG)
            {
                PlayCry_Normal(sTradeData->tradeSpecies[1], 0);
            }
            sTradeData->state = 267;
            sTradeData->timer = 0;
        }
        break;
    case 267:
        if (IsCryFinished())
        {
            sTradeData->state = 68;
        }
        break;
    case 68:
        if (++sTradeData->timer == 10)
        {
            PlayFanfare(MUS_EVOLVED);
        }
        if (sTradeData->timer == 250)
        {
            sTradeData->state++;
            StringExpandPlaceholders(gStringVar4, gText_TakeGoodCareOfX);
            DrawTextOnTradeWindow(0, gStringVar4, 0);
            sTradeData->timer = 0;
        }
        break;
    case 69:
        if (++sTradeData->timer == 60)
        {
            sTradeData->state++;
        }
        break;
    case 70:
        CheckPartnersMonForRibbons();
        sTradeData->state++;
        break;
    case 71:
        if (sTradeData->isLinkTrade)
        {
            return TRUE;
        }
        else if (JOY_NEW(A_BUTTON))
        {
            sTradeData->state++;
        }
        break;
    case 72: // Only if in-game trade
        TradeMons(gSpecialVar_0x8005, 0);
        gCB2_AfterEvolution = CB2_RunTradeAnim_InGameTrade;
        evoTarget = GetEvolutionTargetSpecies(&gPlayerParty[gSelectedTradeMonPositions[0]], EVO_MODE_TRADE, ITEM_NONE);
        if (evoTarget != SPECIES_NONE)
        {
            TradeEvolutionScene(&gPlayerParty[gSelectedTradeMonPositions[0]], evoTarget, sTradeData->pokePicSpriteIdxs[1], gSelectedTradeMonPositions[0]);
        }
        sTradeData->state++;
        break;
    case 73:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        sTradeData->state++;
        break;
    case 74:
        if (!gPaletteFade.active)
        {
            PlayNewMapMusic(sTradeData->cachedMapMusic);
            if (sTradeData)
            {
                FreeAllWindowBuffers();
                Free(GetBgTilemapBuffer(3));
                Free(GetBgTilemapBuffer(1));
                Free(GetBgTilemapBuffer(0));
                FreeMonSpritesGfx();
                FREE_AND_SET_NULL(sTradeData);
            }
            SetMainCallback2(CB2_ReturnToField);
            BufferInGameTradeMonName();
            HelpSystem_Enable();
        }
        break;
    }
    return FALSE;
}

static void CB2_TryEvolveAfterTrade(void)
{
    u16 evoSpecies;
    switch (gMain.state)
    {
    case 0:
        gMain.state = 4;
        gSoftResetDisabled = TRUE;
        break;
    case 4:
        gCB2_AfterEvolution = CB2_HandleTradeEnded;
        evoSpecies = GetEvolutionTargetSpecies(&gPlayerParty[gSelectedTradeMonPositions[0]], EVO_MODE_TRADE, 0);
        if (evoSpecies != SPECIES_NONE)
            TradeEvolutionScene(&gPlayerParty[gSelectedTradeMonPositions[0]], evoSpecies, sTradeData->pokePicSpriteIdxs[1], gSelectedTradeMonPositions[0]);
        else
            SetMainCallback2(CB2_HandleTradeEnded);
        gSelectedTradeMonPositions[0] = 0xFF;
        break;
    }
    if (!HasLinkErrorOccurred())
        RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void HandleLinkDataReceive(void)
{
    u8 recvStatus;
    GetMultiplayerIdOfLinkTrade();
    recvStatus = GetBlockReceivedStatus();
    if (recvStatus & (1 << 0))
    {
        if (gBlockRecvBuffer[0][0] == 0xDCBA)
            SetMainCallback2(CB2_TryEvolveAfterTrade);
        if (gBlockRecvBuffer[0][0] == 0xABCD)
            sTradeData->tradeStatus1 = 1;
        ResetBlockReceivedFlag(0);
    }
    if (recvStatus & (1 << 1))
    {
        if (gBlockRecvBuffer[1][0] == 0xABCD)
            sTradeData->tradeStatus2 = 1;
        ResetBlockReceivedFlag(1);
    }
}

static void SpriteCB_TradePokeball_Default(struct Sprite *sprite)
{
    sprite->y += sprite->data[0] / 10;
    sprite->data[5] += sprite->data[1];
    sprite->x = sprite->data[5] / 10;
    if (sprite->y > 76)
    {
        sprite->y = 76;
        sprite->data[0] = -(sprite->data[0] * sprite->data[2]) / 100;
        sprite->data[3]++;
    }
    if (sprite->x == 120)
        sprite->data[1] = 0;
    sprite->data[0] += sprite->data[4];
    if (sprite->data[3] == 4)
    {
        sprite->data[7] = 1;
        sprite->callback = SpriteCallbackDummy;
    }
}

static void SpriteCB_TradePokeball_Outbound(struct Sprite *sprite)
{
    sprite->y2 += sTradeBallVerticalVelocityTable[sprite->data[0]];
    if (sprite->data[0] == 22)
        PlaySE(SE_BALL_BOUNCE_1);
    sprite->data[0]++;
    if (sprite->data[0] == 44)
    {
        PlaySE(SE_M_MEGA_KICK);
        sprite->callback = SpriteCB_TradePokeball_Outbound2;
        sprite->data[0] = 0;
        BeginNormalPaletteFade(1 << (sprite->oam.paletteNum + 16), -1, 0, 16, RGB_WHITEALPHA);
    }
}

static void SpriteCB_TradePokeball_Outbound2(struct Sprite *sprite)
{
    if (sprite->data[1] == 20)
        StartSpriteAffineAnim(sprite, 1);
    sprite->data[1]++;
    if (sprite->data[1] > 20)
    {
        sprite->y2 -= sTradeBallVerticalVelocityTable[sprite->data[0]];
        sprite->data[0]++;
        if (sprite->data[0] == 23)
        {
            DestroySprite(sprite);
            sTradeData->state = 14;
        }
    }
}

static void SpriteCB_TradePokeball_Inbound(struct Sprite *sprite)
{
    if (sprite->data[2] == 0)
    {
        sprite->y += 4;
        if (sprite->y > sprite->data[3])
        {
            sprite->data[2]++;
            sprite->data[0] = 22;
            PlaySE(SE_BALL_BOUNCE_1);
        }
    }
    else
    {
        if (sprite->data[0] == 66)
            PlaySE(SE_BALL_BOUNCE_2);
        if (sprite->data[0] == 92)
            PlaySE(SE_BALL_BOUNCE_3);
        if (sprite->data[0] == 107)
            PlaySE(SE_BALL_BOUNCE_4);
        sprite->y2 += sTradeBallVerticalVelocityTable[sprite->data[0]];
        sprite->data[0]++;
        if (sprite->data[0] == 108)
            sprite->callback = SpriteCallbackDummy;
    }
}

u16 GetInGameTradeSpeciesInfo(void)
{
    // Populates gStringVar1 with the name of the requested species and
    // gStringVar2 with the name of the offered species.
    // Returns the requested species.
    const struct InGameTrade * inGameTrade = &sInGameTrades[gSpecialVar_0x8004];
    StringCopy(gStringVar1, gSpeciesNames[inGameTrade->requestedSpecies]);
    StringCopy(gStringVar2, gSpeciesNames[inGameTrade->species]);
    return inGameTrade->requestedSpecies;
}

static void BufferInGameTradeMonName(void)
{
    // Populates gStringVar1 with the nickname of the sent Pokemon and
    // gStringVar2 with the name of the offered species.
    u8 nickname[30];
    const struct InGameTrade * inGameTrade = &sInGameTrades[gSpecialVar_0x8004];
    GetMonData(&gPlayerParty[gSpecialVar_0x8005], MON_DATA_NICKNAME, nickname);
    StringCopy_Nickname(gStringVar1, nickname);
    StringCopy(gStringVar2, gSpeciesNames[inGameTrade->species]);
}

static void CreateInGameTradePokemonInternal(u8 playerSlot, u8 inGameTradeIdx)
{
    const struct InGameTrade * inGameTrade = &sInGameTrades[inGameTradeIdx];
    u8 level = GetMonData(&gPlayerParty[playerSlot], MON_DATA_LEVEL);
    struct Mail mail;
    u8 metLocation = METLOC_IN_GAME_TRADE;
    struct Pokemon * tradeMon = &gEnemyParty[0];
    u8 mailNum;
    CreateMon(tradeMon, inGameTrade->species, level, 32, TRUE, inGameTrade->personality, TRUE, inGameTrade->otId);
    SetMonData(tradeMon, MON_DATA_HP_IV, &inGameTrade->ivs[0]);
    SetMonData(tradeMon, MON_DATA_ATK_IV, &inGameTrade->ivs[1]);
    SetMonData(tradeMon, MON_DATA_DEF_IV, &inGameTrade->ivs[2]);
    SetMonData(tradeMon, MON_DATA_SPEED_IV, &inGameTrade->ivs[3]);
    SetMonData(tradeMon, MON_DATA_SPATK_IV, &inGameTrade->ivs[4]);
    SetMonData(tradeMon, MON_DATA_SPDEF_IV, &inGameTrade->ivs[5]);
    SetMonData(tradeMon, MON_DATA_NICKNAME, inGameTrade->nickname);
    SetMonData(tradeMon, MON_DATA_OT_NAME, inGameTrade->otName);
    SetMonData(tradeMon, MON_DATA_OT_GENDER, &inGameTrade->otGender);
    SetMonData(tradeMon, MON_DATA_ABILITY_NUM, &inGameTrade->abilityNum);
    SetMonData(tradeMon, MON_DATA_BEAUTY, &inGameTrade->conditions[1]);
    SetMonData(tradeMon, MON_DATA_CUTE, &inGameTrade->conditions[2]);
    SetMonData(tradeMon, MON_DATA_COOL, &inGameTrade->conditions[0]);
    SetMonData(tradeMon, MON_DATA_SMART, &inGameTrade->conditions[3]);
    SetMonData(tradeMon, MON_DATA_TOUGH, &inGameTrade->conditions[4]);
    SetMonData(tradeMon, MON_DATA_SHEEN, &inGameTrade->sheen);
    SetMonData(tradeMon, MON_DATA_MET_LOCATION, &metLocation);
    mailNum = 0;
    if (inGameTrade->heldItem != ITEM_NONE)
    {
        if (ItemIsMail(inGameTrade->heldItem))
        {
            GetInGameTradeMail(&mail, inGameTrade);
            gLinkPartnerMail[0] = mail;
            SetMonData(tradeMon, MON_DATA_MAIL, &mailNum);
            SetMonData(tradeMon, MON_DATA_HELD_ITEM, &inGameTrade->heldItem);
        }
        else
        {
            SetMonData(tradeMon, MON_DATA_HELD_ITEM, &inGameTrade->heldItem);
        }
    }
    CalculateMonStats(&gEnemyParty[0]);
}

static void GetInGameTradeMail(struct Mail * mail, const struct InGameTrade * inGameTrade)
{
    int i;
    for (i = 0; i < MAIL_WORDS_COUNT; i++)
        mail->words[i] = sInGameTradeMailMessages[inGameTrade->mailNum][i];
    StringCopy(mail->playerName, inGameTrade->otName);
    mail->trainerId[0] = inGameTrade->otId >> 24;
    mail->trainerId[1] = inGameTrade->otId >> 16;
    mail->trainerId[2] = inGameTrade->otId >> 8;
    mail->trainerId[3] = inGameTrade->otId;
    mail->species = inGameTrade->species;
    mail->itemId = inGameTrade->heldItem;
}

u16 GetTradeSpecies(void)
{
    if (GetMonData(&gPlayerParty[gSpecialVar_0x8005], MON_DATA_IS_EGG))
        return SPECIES_NONE;
    else
        return GetMonData(&gPlayerParty[gSpecialVar_0x8005], MON_DATA_SPECIES);
}

void CreateInGameTradePokemon(void)
{
    CreateInGameTradePokemonInternal(gSpecialVar_0x8005, gSpecialVar_0x8004);
}

static void CB2_RunTradeAnim_LinkTrade(void)
{
    if (DoTradeAnim() == TRUE)
    {
        DestroySprite(&gSprites[sTradeData->pokePicSpriteIdxs[0]]);
        FreeSpriteOamMatrix(&gSprites[sTradeData->pokePicSpriteIdxs[1]]);
        TradeMons(gSelectedTradeMonPositions[0], gSelectedTradeMonPositions[1] % 6);
        sTradeData->linkData[0] = 0xABCD;
        sTradeData->scheduleLinkTransfer = 1;
        SetMainCallback2(CB2_WaitAndAckTradeComplete);
    }
    HandleLinkDataSend();
    HandleLinkDataReceive();
    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void CB2_WaitAndAckTradeComplete(void)
{
    u8 mpId = GetMultiplayerIdOfLinkTrade();
    HandleLinkDataReceive();
    if (mpId == 0 && sTradeData->tradeStatus1 == 1 && sTradeData->tradeStatus2 == 1)
    {
        sTradeData->linkData[0] = 0xDCBA;
        SendBlock(BitmaskAllOtherLinkPlayers(), sTradeData->linkData, 20);
        sTradeData->tradeStatus1 = 2;
        sTradeData->tradeStatus2 = 2;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void CB2_HandleTradeEnded(void)
{
    switch (gMain.state)
    {
    case 0:
        gMain.state++;
        StringExpandPlaceholders(gStringVar4, gText_CommunicationStandby5);
        DrawTextOnTradeWindow(0, gStringVar4, 0);
        break;
    case 1:
        SetLinkStandbyCallback();
        gMain.state = 100;
        sTradeData->timer = 0;
        break;
    case 100:
        if (++sTradeData->timer > 180)
        {
            gMain.state = 101;
            sTradeData->timer = 0;
        }
        if (IsLinkTaskFinished())
        {
            gMain.state = 2;
        }
        break;
    case 101:
        if (IsLinkTaskFinished())
        {
            gMain.state = 2;
        }
        break;
    case 2:
        gMain.state = 50;
        StringExpandPlaceholders(gStringVar4, gText_SavingDontTurnOffThePower2);
        DrawTextOnTradeWindow(0, gStringVar4, 0);
        break;
    case 50:
        if (InUnionRoom())
        {
            SetQuestLogEvent(QL_EVENT_LINK_TRADED_UNION, sTradeData->monSpecies);
        }
        else
        {
            SetQuestLogEvent(QL_EVENT_LINK_TRADED, sTradeData->monSpecies);
            IncrementGameStat(GAME_STAT_POKEMON_TRADES);
        }
        if (gWirelessCommType)
            MysteryGift_TryIncrementStat(CARD_STAT_NUM_TRADES, gLinkPlayers[GetMultiplayerId() ^ 1].trainerId);
        SetContinueGameWarpStatusToDynamicWarp();
        LinkFullSave_Init();
        gMain.state++;
        sTradeData->timer = 0;
        break;
    case 51:
        if (++sTradeData->timer == 5)
        {
            gMain.state++;
        }
        break;
    case 52:
        if (LinkFullSave_WriteSector())
        {
            ClearContinueGameWarpStatus2();
            gMain.state = 4;
        }
        else
        {
            sTradeData->timer = 0;
            gMain.state = 51;
        }
        break;
    case 4:
        LinkFullSave_ReplaceLastSector();
        gMain.state = 40;
        sTradeData->timer = 0;
        break;
    case 40:
        if (++sTradeData->timer > 50)
        {
            if (GetMultiplayerId() == 0)
            {
                sTradeData->timer = Random() % 30;
            }
            else
            {
                sTradeData->timer = 0;
            }
            gMain.state = 41;
        }
        break;
    case 41:
        if (sTradeData->timer == 0)
        {
            SetLinkStandbyCallback();
            gMain.state = 42;
        }
        else
        {
            sTradeData->timer--;
        }
        break;
    case 42:
        if (IsLinkTaskFinished())
        {
            LinkFullSave_SetLastSectorSignature();
            gMain.state = 5;
        }
        break;
    case 5:
        if (++sTradeData->timer > 60)
        {
            gMain.state++;
            SetLinkStandbyCallback();
        }
        break;
    case 6:
        if (IsLinkTaskFinished())
        {
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
            gMain.state ++;
        }
        break;
    case 7:
        if (!gPaletteFade.active)
        {
            FadeOutBGM(3);
            gMain.state++;
        }
        break;
    case 8:
        if (IsBGMStopped() == TRUE)
        {
            if (gWirelessCommType && gMain.savedCallback == CB2_StartCreateTradeMenu)
            {
                SetLinkStandbyCallback();
            }
            else
            {
                SetCloseLinkCallback();
            }
            gMain.state++;
        }
        break;
    case 9:
        if (gWirelessCommType && gMain.savedCallback == CB2_StartCreateTradeMenu)
        {
            if (IsLinkRfuTaskFinished())
            {
                gSoftResetDisabled = FALSE;
                SetMainCallback2(LinkTrade_TearDownAssets);
            }
        }
        else if (!gReceivedRemoteLinkPlayers)
        {
            gSoftResetDisabled = FALSE;
            SetMainCallback2(LinkTrade_TearDownAssets);
        }
        break;
    }
    if (!HasLinkErrorOccurred())
    {
        RunTasks();
    }
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void LinkTrade_TearDownAssets(void)
{
    if (!gPaletteFade.active)
    {
        FreeAllWindowBuffers();
        Free(GetBgTilemapBuffer(3));
        Free(GetBgTilemapBuffer(1));
        Free(GetBgTilemapBuffer(0));
        FreeMonSpritesGfx();
        FREE_AND_SET_NULL(sTradeData);
        if (gWirelessCommType != 0)
            DestroyWirelessStatusIndicatorSprite();
        SetMainCallback2(gMain.savedCallback);
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void DoInGameTradeScene(void)
{
    LockPlayerFieldControls();
    CreateTask(Task_WaitFadeAndStartInGameTradeAnim, 10);
    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
    HelpSystem_Disable();
}

static void Task_WaitFadeAndStartInGameTradeAnim(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(CB2_InitTradeAnim_InGameTrade);
        gFieldCallback = FieldCB_ContinueScriptHandleMusic;
        DestroyTask(taskId);
    }
}

static void CheckPartnersMonForRibbons(void)
{
    u8 nRibbons = 0;
    u8 i;
    for (i = 0; i < 12; i++)
    {
        nRibbons += GetMonData(&gEnemyParty[gSelectedTradeMonPositions[1] % 6], MON_DATA_CHAMPION_RIBBON + i);
    }
    if (nRibbons != 0)
        FlagSet(FLAG_SYS_RIBBON_GET);
}

void LoadTradeAnimGfx(void)
{
    TradeAnimInit_LoadGfx();
}

void DrawTextOnTradeWindow(u8 windowId, const u8 *str, s8 speed)
{
    FillWindowPixelBuffer(windowId, PIXEL_FILL(15));
    sTradeData->textColor[0] = 15;
    sTradeData->textColor[1] = 1;
    sTradeData->textColor[2] = 6;
    AddTextPrinterParameterized4(windowId, FONT_NORMAL, 0, 2, 0, 2, sTradeData->textColor, speed, str);
    CopyWindowToVram(windowId, COPYWIN_FULL);
}

static void Task_AnimateWirelessSignal(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 r2 = 16 * sWirelessSignalAnimParams[data[0]][0];
    if (data[2] == 0)
    {
        if (r2 == 0x100)
            LoadPalette(sWirelessSignalAnimPals_Off, 0x30, 0x20);
        else
            LoadPalette(&sWirelessSignalAnimPals_Outbound[r2], 0x30, 0x20);
    }
    else
    {
        if (r2 == 0x100)
            LoadPalette(sWirelessSignalAnimPals_Off, 0x30, 0x20);
        else
            LoadPalette(&sWirelessSignalAnimPals_Inbound[r2], 0x30, 0x20);
    }
    if (sWirelessSignalAnimParams[data[0]][0] == 0 && data[1] == 0)
        PlaySE(SE_M_HEAL_BELL);
    if (data[1] == sWirelessSignalAnimParams[data[0]][1])
    {
        data[0]++;
        data[1] = 0;
        if (sWirelessSignalAnimParams[data[0]][1] == 0xFF)
            DestroyTask(taskId);
    }
    else
        data[1]++;
}

static void Task_OpenCenterWhiteColumn(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (data[0] == 0)
    {
        sTradeData->win0left = sTradeData->win0right = 120;
        sTradeData->win0top = 0;
        sTradeData->win0bottom = 160;
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_OBJ);
        SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG0 |
                                    WININ_WIN0_BG1 |
                                    WININ_WIN0_OBJ);
    }

    SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE2(sTradeData->win0left, sTradeData->win0right));
    SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE2(sTradeData->win0top, sTradeData->win0bottom));

    data[0]++;
    sTradeData->win0left -= 5;
    sTradeData->win0right += 5;

    if (sTradeData->win0left < 80)
    {
        DestroyTask(taskId);
    }
}

static void Task_CloseCenterWhiteColumn(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (data[0] == 0)
    {
        sTradeData->win0left = 80;
        sTradeData->win0right = 160;
        SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_OBJ);
        SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG0 |
                                    WININ_WIN0_BG1 |
                                    WININ_WIN0_OBJ);
    }

    SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE2(sTradeData->win0left, sTradeData->win0right));
    SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE2(sTradeData->win0top, sTradeData->win0bottom));

    if (sTradeData->win0left != 120)
    {
        data[0]++;
        sTradeData->win0left += 5;
        sTradeData->win0right -= 5;

        if (sTradeData->win0left >= 116)
            BlendPalettes(0x8, 0, RGB_WHITEALPHA);
    }
    else
    {
        ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        DestroyTask(taskId);
    }
}
