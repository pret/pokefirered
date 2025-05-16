#include "global.h"
#include "gflib.h"
#include "task.h"
#include "util.h"
#include "decompress.h"
#include "trade.h"
#include "link.h"
#include "link_rfu.h"
#include "mystery_gift.h"
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

// Values for signaling to/from the link partner
enum {
    STATUS_NONE,
    STATUS_READY,
    STATUS_CANCEL,
};

enum {
    GFXTAG_LINK_MON_GLOW = 5550,
    PALTAG_LINK_MON,
    GFXTAG_LINK_MON_SHADOW,
    TAG_UNUSED,
    GFXTAG_CABLE_END,
    PALTAG_GBA,
    GFXTAG_GBA_SCREEN,
    GFXTAG_POKEBALL,
    PALTAG_POKEBALL,
};

struct InGameTrade {
    /*0x00*/ u8 nickname[POKEMON_NAME_LENGTH + 1];
    /*0x0C*/ u16 species;
    /*0x0E*/ u8 ivs[NUM_STATS];
    /*0x14*/ u8 abilityNum;
    /*0x18*/ u32 otId;
    /*0x1C*/ u8 conditions[CONTEST_CATEGORIES_COUNT];
    /*0x24*/ u32 personality;
    /*0x28*/ u16 heldItem;
    /*0x2A*/ u8 mailNum;
    /*0x2B*/ u8 otName[11];
    /*0x36*/ u8 otGender;
    /*0x37*/ u8 sheen;
    /*0x38*/ u16 requestedSpecies;
};

struct {
    /*0x00*/ struct Pokemon tempMon; // Used as a temp variable when swapping Pokémon
    /*0x64*/ u32 timer;
    /*0x68*/ u32 monPersonalities[2];
    /*0x70*/ u8 filler_70[2];
    /*0x72*/ u8 playerFinishStatus;
    /*0x73*/ u8 partnerFinishStatus;
    /*0x74*/ u16 linkData[10];
    /*0x88*/ u8 linkTimeoutCheck1;
    /*0x89*/ u8 linkTimeoutCheck2;
    /*0x8A*/ u16 linkTimeoutTimer;
    /*0x8C*/ u16 neverRead_8C;
    /*0x8E*/ u8 monSpriteIds[2];
    /*0x90*/ u8 connectionSpriteId1; // Multi-purpose sprite ids used during the transfer sequence
    /*0x91*/ u8 connectionSpriteId2;
    /*0x92*/ u8 cableEndSpriteId;
    /*0x93*/ u8 scheduleLinkTransfer;
    /*0x94*/ u16 state;
    /*0x96*/ u8 filler_96[0xD2 - 0x96];
    /*0xD2*/ u8 releasePokeballSpriteId;
    /*0xD3*/ u8 bouncingPokeballSpriteId;
    /*0xD4*/ u16 bg2texX;
    /*0xD6*/ u16 bg2texY;
    /*0xD8*/ u16 neverRead_D8;
    /*0xDA*/ u16 neverRead_DA;
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
    /*0xF0*/ u16 monSpecies[2];
    /*0xF4*/ u16 cachedMapMusic;
    /*0xF6*/ u8 unk_F6;
    /*0xF8*/ struct QuestLogEvent_Traded questLogData;
    /*0x104*/ u8 textColor[3];
    /*0x107*/ u8 filler_107[1];
    /*0x108*/ bool8 isCableTrade;
    /*0x109*/ u8 win0left;
    /*0x10A*/ u8 win0top;
    /*0x10B*/ u8 win0right;
    /*0x10C*/ u8 win0bottom;
} static EWRAM_DATA * sTradeAnim = NULL;

static void SpriteCB_LinkMonGlow(struct Sprite *sprite);
static void SpriteCB_LinkMonGlowWireless(struct Sprite *sprite);
static void SpriteCB_LinkMonShadow(struct Sprite *sprite);
static void SpriteCB_CableEndSending(struct Sprite *sprite);
static void SpriteCB_CableEndReceiving(struct Sprite *sprite);
static void SpriteCB_GbaScreen(struct Sprite *sprite);
static void TradeAnimInit_LoadGfx(void);
static void CB2_InGameTrade(void);
static void SetTradeSequenceBgGpuRegs(u8 idx);
static void LoadTradeGbaSpriteGfx(void);
static void TradeBufferOTnameAndNicknames(void);
static u8 DoTradeAnim(void);
static u8 DoTradeAnim_Cable(void);
static u8 DoTradeAnim_Wireless(void);
static void SpriteCB_BouncingPokeball(struct Sprite *sprite);
static void SpriteCB_BouncingPokeballDepart(struct Sprite *sprite);
static void SpriteCB_BouncingPokeballDepartEnd(struct Sprite *sprite);
static void SpriteCB_BouncingPokeballArrive(struct Sprite *sprite);
static void BufferInGameTradeMonName(void);
static void GetInGameTradeMail(struct Mail * mail, const struct InGameTrade * inGameTrade);
static void CB2_UpdateLinkTrade(void);
static void CB2_WaitTradeComplete(void);
static void CB2_SaveAndEndTrade(void);
static void CB2_FreeTradeAnim(void);
static void Task_InGameTrade(u8 taskId);
static void CheckPartnersMonForRibbons(void);
static void Task_AnimateWirelessSignal(u8 taskId);
static void Task_OpenCenterWhiteColumn(u8 taskId);
static void Task_CloseCenterWhiteColumn(u8 taskId);

static const u16 sPokeball_Pal[]                    = INCBIN_U16("graphics/trade/pokeball.gbapal");
static const u8 sPokeball_Gfx[]                     = INCBIN_U8("graphics/trade/pokeball.4bpp");
static const u8 sPokeballSymbol_Gfx[]               = INCBIN_U8("graphics/trade/pokeball_symbol.8bpp"); // Unused
static const u16 sCableCloseup_Map[]                = INCBIN_U16("graphics/trade/cable_closeup_map.bin");
static const u16 sPokeballSymbol_Map[]              = INCBIN_U16("graphics/trade/pokeball_symbol_map.bin");
static const u16 sUnusedPal1[]                      = INCBIN_U16("graphics/trade/unused1.gbapal");
static const u16 sGba_Pal[]                         = INCBIN_U16("graphics/trade/gba.gbapal");
static const u16 sShadowPalette[]                   = INCBIN_U16("graphics/trade/shadow.gbapal");
static const u16 sBlackPalette[]                    = INCBIN_U16("graphics/trade/black.gbapal");
static const u16 sLinkMon_Pal[]                     = INCBIN_U16("graphics/trade/link_mon.gbapal");
static const u8 sLinkMonGlow_Gfx[]                  = INCBIN_U8("graphics/trade/link_mon_glow.4bpp");
static const u8 sLinkMonShadow_Gfx[]                = INCBIN_U8("graphics/trade/link_mon_shadow.4bpp");
static const u8 sCableEnd_Gfx[]                     = INCBIN_U8("graphics/trade/cable_end.4bpp");
static const u8 sGbaScreen_Gfx[]                    = INCBIN_U8("graphics/trade/gba_screen.4bpp");
const u16 gTradeOrHatchMonShadowTilemap[]           = INCBIN_U16("graphics/trade/shadow_map.bin");
static const u8 sGbaAffine_Gfx[]                    = INCBIN_U8("graphics/trade/gba_affine.8bpp");
static const u8 sEmptyGfx[64]                       = {};
static const u8 sGbaAffineMapCable[]                = INCBIN_U8("graphics/trade/gba_affine_map_cable.bin");
static const u8 sGbaAffineMapWireless[]             = INCBIN_U8("graphics/trade/gba_affine_map_wireless.bin");
static const u16 sGbaMapWireless[]                  = INCBIN_U16("graphics/trade/gba_map_wireless.bin");
static const u16 sGbaMapCable[]                     = INCBIN_U16("graphics/trade/gba_map_cable.bin");
static const u32 sWirelessCloseup_Map[]             = INCBIN_U32("graphics/trade/wireless_signal_closeup.bin.lz");
static const u16 sWirelessSignalAnimPals_Outbound[] = INCBIN_U16("graphics/trade/wireless_signal_send.gbapal");
static const u16 sWirelessSignalAnimPals_Inbound[]  = INCBIN_U16("graphics/trade/wireless_signal_receive.gbapal");
static const u16 sWirelessSignalAnimPals_Off[]      = INCBIN_U16("graphics/trade/black.gbapal");
static const u32 sWirelessSignal4bpp[]              = INCBIN_U32("graphics/trade/wireless_signal.4bpp.lz");
static const u32 sWirelessSignalTilemap[]           = INCBIN_U32("graphics/trade/wireless_signal.bin.lz");

static const struct OamData sOamData_Pokeball = {
    .affineMode = ST_OAM_AFFINE_NORMAL,
    .shape = SPRITE_SHAPE(16x16),
    .size = SPRITE_SIZE(16x16)
};

static const union AnimCmd sAnim_Pokeball_SpinOnce[] = {
    ANIMCMD_FRAME( 0, 3),
    ANIMCMD_FRAME( 4, 3),
    ANIMCMD_FRAME( 8, 3),
    ANIMCMD_FRAME(12, 3),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(20, 3),
    ANIMCMD_FRAME(24, 3),
    ANIMCMD_FRAME(28, 3),
    ANIMCMD_FRAME(32, 3),
    ANIMCMD_FRAME(36, 3),
    ANIMCMD_FRAME(40, 3),
    ANIMCMD_FRAME(44, 3),
    ANIMCMD_LOOP(1),
    ANIMCMD_FRAME( 0, 3),
    ANIMCMD_END
};

static const union AnimCmd sAnim_Pokeball_SpinTwice[] = {
    ANIMCMD_FRAME( 0, 3),
    ANIMCMD_FRAME( 4, 3),
    ANIMCMD_FRAME( 8, 3),
    ANIMCMD_FRAME(12, 3),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(20, 3),
    ANIMCMD_FRAME(24, 3),
    ANIMCMD_FRAME(28, 3),
    ANIMCMD_FRAME(32, 3),
    ANIMCMD_FRAME(36, 3),
    ANIMCMD_FRAME(40, 3),
    ANIMCMD_FRAME(44, 3),
    ANIMCMD_LOOP(2),
    ANIMCMD_FRAME( 0, 3),
    ANIMCMD_END
};

static const union AnimCmd *const sAnims_Pokeball[] = {
    sAnim_Pokeball_SpinOnce,
    sAnim_Pokeball_SpinTwice
};

static const union AffineAnimCmd sAffineAnim_Pokeball_Normal[] = {
    AFFINEANIMCMD_FRAME(0, 0, 0, 1),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_Pokeball_Squish[] = {
    AFFINEANIMCMD_FRAME(-8, 0, 0, 20),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_Pokeball_Unsquish[] = {
    AFFINEANIMCMD_FRAME(96, 256, 0, 0),
    AFFINEANIMCMD_FRAME(0, 0, 0, 5),
    AFFINEANIMCMD_FRAME(8, 0, 0, 20),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const sAffineAnims_Pokeball[] = {
    sAffineAnim_Pokeball_Normal,
    sAffineAnim_Pokeball_Squish,
    sAffineAnim_Pokeball_Unsquish
};

static const struct SpriteSheet sPokeBallSpriteSheet = {
    .data = sPokeball_Gfx,
    .size = sizeof(sPokeball_Gfx),
    .tag = GFXTAG_POKEBALL
};

static const struct SpritePalette sTradeBallSpritePal = {
    .data = sPokeball_Pal,
    .tag = PALTAG_POKEBALL
};

static const struct SpriteTemplate sSpriteTemplate_Pokeball = {
    .tileTag = GFXTAG_POKEBALL,
    .paletteTag = PALTAG_POKEBALL,
    .oam = &sOamData_Pokeball,
    .anims = sAnims_Pokeball,
    .affineAnims = sAffineAnims_Pokeball,
    .callback = SpriteCB_BouncingPokeball
};

static const struct OamData sOamData_LinkMonGlow = {
    .affineMode = ST_OAM_AFFINE_NORMAL,
    .objMode = ST_OAM_OBJ_BLEND,
    .shape = SPRITE_SHAPE(32x32),
    .size = SPRITE_SIZE(32x32),
    .priority = 1
};

static const union AnimCmd sAnim_LinkMonGlow[] = {
    ANIMCMD_FRAME(0, 5, .hFlip = TRUE, .vFlip = TRUE), // ? The graphic is a perfect circle, no need to flip
    ANIMCMD_END
};

static const union AnimCmd *const sAnims_LinkMonGlow[] = {
    sAnim_LinkMonGlow
};

static const union AffineAnimCmd sAffineAnim_LinkMonGlow[] = {
    AFFINEANIMCMD_FRAME(-10, -10, 0, 5),
    AFFINEANIMCMD_FRAME( 10,  10, 0, 5),
    AFFINEANIMCMD_JUMP(0)
};

static const union AffineAnimCmd *const sAffineAnims_LinkMonGlow[] = {
    sAffineAnim_LinkMonGlow
};

static const struct SpriteSheet sSpriteSheet_LinkMonGlow = {
    .data = sLinkMonGlow_Gfx,
    .size = sizeof(sLinkMonGlow_Gfx),
    .tag = GFXTAG_LINK_MON_GLOW
};

static const struct SpritePalette sSpritePalette_LinkMon = {
    .data = sLinkMon_Pal,
    .tag = PALTAG_LINK_MON
};

static const struct SpritePalette sSpritePalette_Gba = {
    .data = sGba_Pal,
    .tag = PALTAG_GBA
};

static const struct SpriteTemplate sSpriteTemplate_LinkMonGlow = {
    .tileTag = GFXTAG_LINK_MON_GLOW,
    .paletteTag = PALTAG_LINK_MON,
    .oam = &sOamData_LinkMonGlow,
    .anims = sAnims_LinkMonGlow,
    .affineAnims = sAffineAnims_LinkMonGlow,
    .callback = SpriteCB_LinkMonGlow
};

static const struct OamData sOamData_LinkMonShadow = {
    .shape = SPRITE_SHAPE(16x32),
    .size = SPRITE_SIZE(16x32),
    .priority = 1
};

static const union AnimCmd sAnim_LinkMonShadow_Big[] = {
    ANIMCMD_FRAME(0, 5, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_END
};

static const union AnimCmd sAnim_LinkMonShadow_Small[] = {
    ANIMCMD_FRAME(8, 5, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_END
};

enum {
    ANIM_LINKMON_BIG,
    ANIM_LINKMON_SMALL,
};

static const union AnimCmd *const sAnims_LinkMonShadow[] = {
    [ANIM_LINKMON_BIG]   = sAnim_LinkMonShadow_Big,
    [ANIM_LINKMON_SMALL] = sAnim_LinkMonShadow_Small,
};

static const struct SpriteSheet sSpriteSheet_LinkMonShadow = {
    .data = sLinkMonShadow_Gfx,
    .size = 0x300,
    .tag = GFXTAG_LINK_MON_SHADOW
};

static const struct SpriteTemplate sSpriteTemplate_LinkMonShadow = {
    .tileTag = GFXTAG_LINK_MON_SHADOW,
    .paletteTag = PALTAG_LINK_MON,
    .oam = &sOamData_LinkMonShadow,
    .anims = sAnims_LinkMonShadow,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_LinkMonShadow
};

static const struct OamData sOamData_CableEnd = {
    .shape = SPRITE_SHAPE(16x32),
    .size = SPRITE_SIZE(16x32),
    .priority = 1
};

static const union AnimCmd sAnim_CableEnd[] = {
    ANIMCMD_FRAME(0, 10),
    ANIMCMD_END
};

static const union AnimCmd *const sAnims_CableEnd[] = {
    sAnim_CableEnd
};

static const struct SpriteSheet sSpriteSheet_CableEnd = {
    .data = sCableEnd_Gfx,
    .size = 0x100,
    .tag = GFXTAG_CABLE_END
};

static const struct SpriteTemplate sSpriteTemplate_CableEnd = {
    .tileTag = GFXTAG_CABLE_END,
    .paletteTag = PALTAG_GBA,
    .oam = &sOamData_CableEnd,
    .anims = sAnims_CableEnd,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_CableEndSending
};

static const struct OamData sOamData_GbaScreen = {
    .shape = SPRITE_SHAPE(64x32),
    .size = SPRITE_SIZE(64x32),
    .priority = 1
};

static const union AnimCmd sAnim_GbaScreen_Long[] = {
    ANIMCMD_FRAME( 0, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(32, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(64, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(96, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(64, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(32, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME( 0, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_LOOP(8),
    ANIMCMD_END
};

static const union AnimCmd sAnim_GbaScreen_Short[] = {
    ANIMCMD_FRAME( 0, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(32, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(64, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(96, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(64, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME(32, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_FRAME( 0, 2, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_LOOP(2),
    ANIMCMD_END
};

static const union AnimCmd *const sAnims_GbaScreen_Long[] = {
    sAnim_GbaScreen_Long
};

static const union AnimCmd *const sAnims_GbaScreen_Short[] = {
    sAnim_GbaScreen_Short
};

static const struct SpriteSheet sTradeGBAScreenSpriteSheet = {
    .data = sGbaScreen_Gfx,
    .size = sizeof(sGbaScreen_Gfx),
    .tag = GFXTAG_GBA_SCREEN
};

static const struct SpriteTemplate sSpriteTemplate_GbaScreenFlash_Long = {
    .tileTag = GFXTAG_GBA_SCREEN,
    .paletteTag = PALTAG_GBA,
    .oam = &sOamData_GbaScreen,
    .anims = sAnims_GbaScreen_Long,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_GbaScreen
};

static const struct SpriteTemplate sSpriteTemplate_GbaScreenFlash_Short = {
    .tileTag = GFXTAG_GBA_SCREEN,
    .paletteTag = PALTAG_GBA,
    .oam = &sOamData_GbaScreen,
    .anims = sAnims_GbaScreen_Short,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_GbaScreen
};

static const u16 sLinkMonShadow_Pal[] = {
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

static const union AffineAnimCmd sAffineAnim_CrossingMonPic[] = {
    AFFINEANIMCMD_FRAME(-0x100,  0x100, 0, 0),
    AFFINEANIMCMD_JUMP(0)
};

static const union AffineAnimCmd *const sAffineAnims_CrossingMonPics[] = {
    sAffineAnim_CrossingMonPic
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

static void SpriteCB_LinkMonGlow(struct Sprite *sprite)
{
    if (++sprite->data[0] == 10)
    {
        PlaySE(SE_BALL);
        sprite->data[0] = 0;
    }
}

static void SpriteCB_LinkMonGlowWireless(struct Sprite *sprite)
{
    if (!sprite->invisible && ++sprite->data[0] == 10)
    {
        PlaySE(SE_M_SWAGGER2);
        sprite->data[0] = 0;
    }
}

// Palette flash for trade glow core
static void SpriteCB_LinkMonShadow(struct Sprite *sprite)
{
    if (sprite->data[1] == 0)
    {
        if (++sprite->data[0] == 12)
            sprite->data[0] = 0;
        LoadPalette(&sLinkMonShadow_Pal[sprite->data[0]], OBJ_PLTT_ID2(sprite->oam.paletteNum) + 4, PLTT_SIZEOF(1));
    }
}

// Move cable down offscreen
static void SpriteCB_CableEndSending(struct Sprite *sprite)
{
    sprite->data[0]++;
    sprite->y2++;

    if (sprite->data[0] == 10)
        DestroySprite(sprite);
}

// Move cable up onscreen
static void SpriteCB_CableEndReceiving(struct Sprite *sprite)
{
    sprite->data[0]++;
    sprite->y2--;

    if (sprite->data[0] == 10)
        DestroySprite(sprite);
}

static void SpriteCB_GbaScreen(struct Sprite *sprite)
{
    if (++sprite->data[0] == 15)
    {
        PlaySE(SE_M_MINIMIZE);
        sprite->data[0] = 0;
    }
}

static void SetTradeBGAffine(void)
{
    struct BgAffineDstData affine;
    DoBgAffineSet(&affine, sTradeAnim->bg2texX * 0x100, sTradeAnim->bg2texY * 0x100, sTradeAnim->bg2srcX, sTradeAnim->bg2srcY, sTradeAnim->sXY, sTradeAnim->sXY, sTradeAnim->bg2alpha);
    SetGpuReg(REG_OFFSET_BG2PA, affine.pa);
    SetGpuReg(REG_OFFSET_BG2PB, affine.pb);
    SetGpuReg(REG_OFFSET_BG2PC, affine.pc);
    SetGpuReg(REG_OFFSET_BG2PD, affine.pd);
    SetGpuReg(REG_OFFSET_BG2X, affine.dx);
    SetGpuReg(REG_OFFSET_BG2Y, affine.dy);
}

static void SetTradeGpuRegs(void)
{
    u16 dispcnt;

    SetGpuReg(REG_OFFSET_BG1VOFS, sTradeAnim->bg1vofs);
    SetGpuReg(REG_OFFSET_BG1HOFS, sTradeAnim->bg1hofs);

    dispcnt = GetGpuReg(REG_OFFSET_DISPCNT);
    if ((dispcnt & 7) == DISPCNT_MODE_0)
    {
        SetGpuReg(REG_OFFSET_BG2VOFS, sTradeAnim->bg2vofs);
        SetGpuReg(REG_OFFSET_BG2HOFS, sTradeAnim->bg2hofs);
    }
    else
    {
        SetTradeBGAffine();
    }
}

static void VBlankCB_TradeAnim(void)
{
    SetTradeGpuRegs();
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void ClearLinkTimeoutTimer(void)
{
    sTradeAnim->linkTimeoutTimer = 0;
    sTradeAnim->linkTimeoutCheck1 = 0;
    sTradeAnim->linkTimeoutCheck2 = 0;
}

static void CheckLinkTimeout(void)
{
    if (sTradeAnim->linkTimeoutCheck1 == sTradeAnim->linkTimeoutCheck2)
        sTradeAnim->linkTimeoutTimer++;
    else
        sTradeAnim->linkTimeoutTimer = 0;

    if (sTradeAnim->linkTimeoutTimer > 300)
    {
        CloseLink();
        SetMainCallback2(CB2_LinkError);
        sTradeAnim->linkTimeoutTimer = 0;
        sTradeAnim->linkTimeoutCheck2 = 0;
        sTradeAnim->linkTimeoutCheck1 = 0;
    }

    sTradeAnim->linkTimeoutCheck2 = sTradeAnim->linkTimeoutCheck1;
}

static u32 TradeGetMultiplayerId(void)
{
    if (gReceivedRemoteLinkPlayers)
        return GetMultiplayerId();
    return 0;
}

static void LoadTradeMonPic(u8 whichParty, u8 state)
{
    int pos = 0;
    struct Pokemon * mon = NULL;
    u16 species;
    u32 personality;

    if (whichParty == TRADE_PLAYER)
    {
        mon = &gPlayerParty[gSelectedTradeMonPositions[TRADE_PLAYER]];
        pos = B_POSITION_OPPONENT_LEFT;
    }

    if (whichParty == TRADE_PARTNER)
    {
        mon = &gEnemyParty[gSelectedTradeMonPositions[TRADE_PARTNER] % PARTY_SIZE];
        pos = B_POSITION_OPPONENT_RIGHT;
    }

    switch (state)
    {
    case 0:
        // Load graphics
        species = GetMonData(mon, MON_DATA_SPECIES_OR_EGG);
        personality = GetMonData(mon, MON_DATA_PERSONALITY);

        if (whichParty == TRADE_PLAYER)
            HandleLoadSpecialPokePic(&gMonFrontPicTable[species], gMonSpritesGfxPtr->sprites[1], species, personality);
        else
            HandleLoadSpecialPokePic_DontHandleDeoxys(&gMonFrontPicTable[species], gMonSpritesGfxPtr->sprites[whichParty * 2 + 1], species, personality);

        LoadCompressedSpritePalette(GetMonSpritePalStruct(mon));
        sTradeAnim->monSpecies[whichParty] = species;
        sTradeAnim->monPersonalities[whichParty] = personality;
        break;
    case 1:
        // Create sprite
        SetMultiuseSpriteTemplateToPokemon(GetMonSpritePalStruct(mon)->tag, pos);
        sTradeAnim->monSpriteIds[whichParty] = CreateSprite(&gMultiuseSpriteTemplate, 120, 60, 6);
        gSprites[sTradeAnim->monSpriteIds[whichParty]].invisible = TRUE;
        gSprites[sTradeAnim->monSpriteIds[whichParty]].callback = SpriteCallbackDummy;
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
            gLinkType = LINKTYPE_TRADE_DISCONNECTED;
            CloseLink();
        }
        sTradeAnim = AllocZeroed(sizeof(*sTradeAnim));
        AllocateMonSpritesGfx();
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();
        SetVBlankCallback(VBlankCB_TradeAnim);
        TradeAnimInit_LoadGfx();
        ClearLinkTimeoutTimer();
        gMain.state++;
        sTradeAnim->neverRead_8C = 0;
        sTradeAnim->state = 0;
        sTradeAnim->isLinkTrade = TRUE;
        sTradeAnim->bg2texX = 64;
        sTradeAnim->bg2texY = 64;
        sTradeAnim->neverRead_D8 = 0;
        sTradeAnim->neverRead_DA = 0;
        sTradeAnim->bg2srcX = DISPLAY_WIDTH / 2;
        sTradeAnim->bg2srcY = DISPLAY_HEIGHT / 2;
        sTradeAnim->sXY = 256;
        sTradeAnim->bg2alpha = 0;
        break;
    case 1:
        if (!gReceivedRemoteLinkPlayers)
        {
            sTradeAnim->isCableTrade = TRUE;
            OpenLink();
            gMain.state++;
            sTradeAnim->timer = 0;
        }
        else
        {
            gMain.state = 4;
        }
        break;
    case 2:
        if (++sTradeAnim->timer > 60)
        {
            sTradeAnim->timer = 0;
            gMain.state++;
        }
        break;
    case 3:
        if (IsLinkMaster())
        {
            if (GetLinkPlayerCount_2() >= GetSavedPlayerCount())
            {
                if (++sTradeAnim->timer > 30)
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
        if (gReceivedRemoteLinkPlayers == TRUE && IsLinkPlayerDataExchangeComplete() == TRUE)
            gMain.state++;
        break;
    case 5:
        sTradeAnim->playerFinishStatus = 0;
        sTradeAnim->partnerFinishStatus = 0;
        sTradeAnim->scheduleLinkTransfer = 0;
        LoadTradeMonPic(TRADE_PLAYER, 0);
        gMain.state++;
        break;
    case 6:
        LoadTradeMonPic(TRADE_PLAYER, 1);
        gMain.state++;
        break;
    case 7:
        LoadTradeMonPic(TRADE_PARTNER, 0);
        gMain.state++;
        break;
    case 8:
        LoadTradeMonPic(TRADE_PARTNER, 1);
        LinkTradeDrawWindow();
        gMain.state++;
        break;
    case 9:
        LoadTradeGbaSpriteGfx();
        LoadSpriteSheet(&sPokeBallSpriteSheet);
        LoadSpritePalette(&sTradeBallSpritePal);
        gMain.state++;
        break;
    case 10:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        ShowBg(0);
        sTradeAnim->questLogData.speciesSent = GetMonData(&gPlayerParty[gSelectedTradeMonPositions[TRADE_PLAYER]], MON_DATA_SPECIES_OR_EGG);
        sTradeAnim->questLogData.speciesReceived = GetMonData(&gEnemyParty[gSelectedTradeMonPositions[TRADE_PARTNER] % PARTY_SIZE], MON_DATA_SPECIES_OR_EGG);
        memcpy(sTradeAnim->questLogData.partnerName, gLinkPlayers[GetMultiplayerId() ^ 1].name, PLAYER_NAME_LENGTH);
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
            SetMainCallback2(CB2_UpdateLinkTrade);
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
    InitBgsFromTemplates(0, sBgTemplates, ARRAY_COUNT(sBgTemplates));
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
    LoadCompressedPalette(gBattleInterface_Textbox_Pal, BG_PLTT_ID(0), PLTT_SIZE_4BPP);
    InitWindows(sTradeMessageWindowTemplates);
    // ... and doing the same load again
    DecompressAndLoadBgGfxUsingHeap(0, gBattleInterface_Textbox_Gfx, 0, 0, 0);
    LZDecompressWram(gBattleInterface_Textbox_Tilemap, gDecompressionBuffer);
    CopyToBgTilemapBuffer(0, gDecompressionBuffer, BG_SCREEN_SIZE, 0);
    LoadCompressedPalette(gBattleInterface_Textbox_Pal, BG_PLTT_ID(0), PLTT_SIZE_4BPP);
}

static void CB2_InitInGameTrade(void)
{
    u8 otName[11];

    switch (gMain.state)
    {
    case 0:
        gSelectedTradeMonPositions[TRADE_PLAYER] = gSpecialVar_0x8005;
        gSelectedTradeMonPositions[TRADE_PARTNER] = PARTY_SIZE;
        StringCopy(gLinkPlayers[0].name, gSaveBlock2Ptr->playerName);
        GetMonData(&gEnemyParty[0], MON_DATA_OT_NAME, otName);
        StringCopy(gLinkPlayers[1].name, otName);
        sTradeAnim = AllocZeroed(sizeof(*sTradeAnim));
        AllocateMonSpritesGfx();
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();
        SetVBlankCallback(VBlankCB_TradeAnim);
        TradeAnimInit_LoadGfx();
        sTradeAnim->isLinkTrade = FALSE;
        sTradeAnim->neverRead_8C = 0;
        sTradeAnim->state = 0;
        sTradeAnim->bg2texX = 64;
        sTradeAnim->bg2texY = 64;
        sTradeAnim->neverRead_D8 = 0;
        sTradeAnim->neverRead_DA = 0;
        sTradeAnim->bg2srcX = DISPLAY_WIDTH / 2;
        sTradeAnim->bg2srcY = DISPLAY_HEIGHT / 2;
        sTradeAnim->sXY = 256;
        sTradeAnim->bg2alpha = 0;
        sTradeAnim->timer = 0;
        gMain.state = 5;
        break;
    case 5:
        LoadTradeMonPic(TRADE_PLAYER, 0);
        gMain.state++;
        break;
    case 6:
        LoadTradeMonPic(TRADE_PLAYER, 1);
        gMain.state++;
        break;
    case 7:
        LoadTradeMonPic(TRADE_PARTNER, 0);
        ShowBg(0);
        gMain.state++;
        break;
    case 8:
        LoadTradeMonPic(TRADE_PARTNER, 1);
        FillWindowPixelBuffer(0, PIXEL_FILL(15));
        PutWindowTilemap(0);
        CopyWindowToVram(0, COPYWIN_FULL);
        gMain.state++;
        break;
    case 9:
        LoadTradeGbaSpriteGfx();
        LoadSpriteSheet(&sPokeBallSpriteSheet);
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
        SetMainCallback2(CB2_InGameTrade);
        break;
    }

    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void UpdatePokedexForReceivedMon(u8 partyIdx)
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

static void TryEnableNationalDexFromLinkPartner(void)
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
    if (playerMail != MAIL_NONE)
        ClearMailStruct(&gSaveBlock1Ptr->mail[playerMail]);

    SWAP(*playerMon, *partnerMon, sTradeAnim->tempMon);

    // By default, a Pokemon received from a trade will have 70 Friendship.
    // Eggs use Friendship to track egg cycles, so don't set this on Eggs.
    friendship = 70;
    if (!GetMonData(playerMon, MON_DATA_IS_EGG))
        SetMonData(playerMon, MON_DATA_FRIENDSHIP, &friendship);

    // Associate your partner's mail with the Pokemon they sent over.
    if (partnerMail != MAIL_NONE)
        GiveMailToMon2(playerMon, &gLinkPartnerMail[partnerMail]);

    UpdatePokedexForReceivedMon(playerPartyIdx);
    if (gReceivedRemoteLinkPlayers)
        TryEnableNationalDexFromLinkPartner();
}

static void HandleLinkDataSend(void)
{
    switch (sTradeAnim->scheduleLinkTransfer)
    {
    case 1:
        if (IsLinkTaskFinished())
        {
            SendBlock(BitmaskAllOtherLinkPlayers(), sTradeAnim->linkData, sizeof(sTradeAnim->linkData));
            sTradeAnim->scheduleLinkTransfer++;
        }
        // fallthrough
    case 2:
        sTradeAnim->scheduleLinkTransfer = 0;
        break;
    }
}

static void CB2_InGameTrade(void)
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
        sTradeAnim->bg2vofs = 0;
        sTradeAnim->bg2hofs = 0xB4;
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON);
        SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(2) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(18) | BGCNT_TXT512x256);
        LoadPalette(gTradeGba2_Pal, BG_PLTT_ID(1), 3 * PLTT_SIZE_4BPP);
        DmaCopyLarge16(3, gTradeGba_Gfx, (void *)BG_CHAR_ADDR(1), 0x1420, 0x1000);
        DmaCopy16Defvars(3, gTradeOrHatchMonShadowTilemap, (void *)BG_SCREEN_ADDR(18), 0x1000);
        break;
    case 1:
        sTradeAnim->bg1hofs = 0;
        sTradeAnim->bg1vofs = 0x15C;
        SetGpuReg(REG_OFFSET_BG1VOFS, 0x15C);
        SetGpuReg(REG_OFFSET_BG1CNT, BGCNT_PRIORITY(2) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(5) | BGCNT_TXT256x512);
        SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(2) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(18) | BGCNT_TXT256x512);
        if (sTradeAnim->isCableTrade)
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
        sTradeAnim->bg1vofs = 0;
        sTradeAnim->bg1hofs = 0;
        if (!sTradeAnim->isCableTrade)
        {
            SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_OBJ_ON);
            LZ77UnCompVram(sWirelessCloseup_Map, (void *)BG_SCREEN_ADDR(5));
            BlendPalettes(0x000000008, 0x10, RGB_BLACK);
        }
        else
        {
            SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_OBJ_ON);
            DmaCopy16Defvars(3, sCableCloseup_Map, (void *)BG_SCREEN_ADDR(5), 0x800);
            BlendPalettes(0x00000001, 0x10, RGB_BLACK);
        }
        break;
    case 3:
        LoadPalette(sWirelessSignalAnimPals_Off, BG_PLTT_ID(3), PLTT_SIZE_4BPP);
        LZ77UnCompVram(sWirelessSignal4bpp, BG_CHAR_ADDR(1));
        LZ77UnCompVram(sWirelessSignalTilemap, BG_SCREEN_ADDR(18));
        sTradeAnim->bg2vofs = 0x50;
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON);
        break;
    case 4:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG2_ON | DISPCNT_OBJ_ON);
        SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(3) | BGCNT_CHARBASE(1) | BGCNT_256COLOR | BGCNT_SCREENBASE(18) | BGCNT_AFF128x128);
        sTradeAnim->bg2texX = 0x40;
        sTradeAnim->bg2texY = 0x5C;
        sTradeAnim->sXY = 0x20;
        sTradeAnim->bg2Zoom = 0x400;
        sTradeAnim->bg2alpha = 0;
        DmaCopyLarge16(3, sGbaAffine_Gfx, (void *)BG_CHAR_ADDR(1), 0x2840, 0x1000);
        if (sTradeAnim->isCableTrade)
        {
            DmaCopy16Defvars(3, sGbaAffineMapCable, (void *)BG_SCREEN_ADDR(18), 0x100);
        }
        else
        {
            DmaCopy16Defvars(3, sGbaAffineMapWireless, (void *)BG_SCREEN_ADDR(18), 0x100);
        }
        break;
    case 5:
        sTradeAnim->bg1vofs = 0;
        sTradeAnim->bg1hofs = 0;
        break;
    case 6:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG2_ON | DISPCNT_OBJ_ON);
        SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(3) | BGCNT_CHARBASE(1) | BGCNT_256COLOR | BGCNT_SCREENBASE(18) | BGCNT_TXT256x256);
        sTradeAnim->bg2texX = 0x40;
        sTradeAnim->bg2texY = 0x5C;
        sTradeAnim->sXY = 0x100;
        sTradeAnim->bg2Zoom = 0x80;
        sTradeAnim->bg2srcX = 0x78;
        sTradeAnim->bg2srcY = 0x50;
        sTradeAnim->bg2alpha = 0;
        DmaCopyLarge16(3, sGbaAffine_Gfx, BG_CHAR_ADDR(1), 0x2840, 0x1000);
        if (sTradeAnim->isCableTrade)
        {
            DmaCopy16Defvars(3, sGbaAffineMapCable, (void *)BG_SCREEN_ADDR(18), 0x100);
        }
        else
        {
            DmaCopy16Defvars(3, sGbaAffineMapWireless, (void *)BG_SCREEN_ADDR(18), 0x100);
        }
        break;
    case 7:
        sTradeAnim->bg2vofs = 0;
        sTradeAnim->bg2hofs = 0;
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(2) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(18) | BGCNT_TXT512x256);
        LoadPalette(gTradeGba2_Pal, BG_PLTT_ID(1), 3 * PLTT_SIZE_4BPP);
        DmaCopyLarge16(3, gTradeGba_Gfx, (void *)BG_CHAR_ADDR(1), 0x1420, 0x1000);
        DmaCopy16Defvars(3, gTradeOrHatchMonShadowTilemap, (void *)BG_SCREEN_ADDR(18), 0x1000);
        break;
    }
}

static void LoadTradeGbaSpriteGfx(void)
{
    LoadSpriteSheet(&sSpriteSheet_LinkMonGlow);
    LoadSpriteSheet(&sSpriteSheet_LinkMonShadow);
    LoadSpriteSheet(&sSpriteSheet_CableEnd);
    LoadSpriteSheet(&sTradeGBAScreenSpriteSheet);
    LoadSpritePalette(&sSpritePalette_LinkMon);
    LoadSpritePalette(&sSpritePalette_Gba);
}

static void TradeBufferOTnameAndNicknames(void)
{
    u8 nickname[20];
    u8 mpId;
    const struct InGameTrade * inGameTrade;
    if (sTradeAnim->isLinkTrade)
    {
        mpId = GetMultiplayerId();
        StringCopy(gStringVar1, gLinkPlayers[mpId ^ 1].name);
        GetMonData(&gEnemyParty[gSelectedTradeMonPositions[TRADE_PARTNER] % PARTY_SIZE], MON_DATA_NICKNAME, nickname);
        StringCopy_Nickname(gStringVar3, nickname);
        GetMonData(&gPlayerParty[gSelectedTradeMonPositions[TRADE_PLAYER]], MON_DATA_NICKNAME, nickname);
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

// returns TRUE if it finished a link trade, FALSE if it finished an in-game trade or if sequence is still going
static bool8 DoTradeAnim(void)
{
    if (sTradeAnim->isCableTrade)
        return DoTradeAnim_Cable();
    else
        return DoTradeAnim_Wireless();
}

// Below are the states for the main switch in DoTradeAnim_Cable and DoTradeAnim_Wireless
// When DoTradeAnim_Wireless has a unique version of a state used by DoTradeAnim_Cable, it adds the below modifier
#define STATE_WIRELESS 100
enum {
    STATE_START,
    STATE_MON_SLIDE_IN,
    // 2-9 unused
    STATE_SEND_MSG = 10,
    STATE_BYE_BYE,
    STATE_POKEBALL_DEPART,
    STATE_POKEBALL_DEPART_WAIT,
    STATE_FADE_OUT_TO_GBA_SEND,
    // 15-19 unused
    STATE_WAIT_FADE_OUT_TO_GBA_SEND = 20,
    STATE_FADE_IN_TO_GBA_SEND,
    STATE_WAIT_FADE_IN_TO_GBA_SEND,
    STATE_GBA_ZOOM_OUT,
    STATE_GBA_FLASH_SEND,
    STATE_GBA_STOP_FLASH_SEND,
    STATE_PAN_AWAY_GBA,
    STATE_CREATE_LINK_MON_LEAVING,
    STATE_LINK_MON_TRAVEL_OUT,
    STATE_FADE_OUT_TO_CROSSING,
    STATE_WAIT_FADE_OUT_TO_CROSSING,
    STATE_FADE_IN_TO_CROSSING,
    STATE_WAIT_FADE_IN_TO_CROSSING,
    STATE_CROSSING_LINK_MONS_ENTER,
    STATE_CROSSING_BLEND_WHITE_1,
    STATE_CROSSING_BLEND_WHITE_2,
    STATE_CROSSING_BLEND_WHITE_3,
    STATE_CROSSING_CREATE_MON_PICS,
    STATE_CROSSING_MON_PICS_MOVE,
    STATE_CROSSING_LINK_MONS_EXIT,
    STATE_CREATE_LINK_MON_ARRIVING,
    STATE_FADE_OUT_TO_GBA_RECV,
    STATE_WAIT_FADE_OUT_TO_GBA_RECV,
    STATE_LINK_MON_TRAVEL_IN,
    STATE_PAN_TO_GBA,
    STATE_DESTROY_LINK_MON,
    STATE_LINK_MON_ARRIVED_DELAY,
    STATE_MOVE_GBA_TO_CENTER,
    STATE_GBA_FLASH_RECV,
    STATE_UNUSED,
    STATE_GBA_STOP_FLASH_RECV,
    STATE_GBA_ZOOM_IN,
    STATE_FADE_OUT_TO_NEW_MON,
    // 53-59 unused
    STATE_WAIT_FADE_OUT_TO_NEW_MON = 60,
    STATE_FADE_IN_TO_NEW_MON,
    STATE_WAIT_FADE_IN_TO_NEW_MON,
    STATE_POKEBALL_ARRIVE,
    STATE_FADE_POKEBALL_TO_NORMAL,
    STATE_POKEBALL_ARRIVE_WAIT,
    STATE_SHOW_NEW_MON,
    STATE_NEW_MON_MSG,
    STATE_TAKE_CARE_OF_MON,
    STATE_AFTER_NEW_MON_DELAY,
    STATE_CHECK_RIBBONS,
    STATE_END_LINK_TRADE,
    STATE_TRY_EVOLUTION,
    STATE_FADE_OUT_END,
    STATE_WAIT_FADE_OUT_END,
    // Special states
    STATE_GBA_FLASH_SEND_WIRELESS = STATE_GBA_FLASH_SEND + STATE_WIRELESS,
    STATE_GBA_STOP_FLASH_SEND_WIRELESS,
    STATE_WAIT_WIRELESS_SIGNAL_SEND,
    STATE_PAN_TO_GBA_WIRELESS = STATE_PAN_TO_GBA + STATE_WIRELESS,
    STATE_DESTROY_LINK_MON_WIRELESS,
    STATE_WAIT_WIRELESS_SIGNAL_RECV,
    STATE_DELAY_FOR_MON_ANIM = 167,
    STATE_LINK_MON_TRAVEL_OFFSCREEN = 200,
    STATE_WAIT_FOR_MON_CRY = 267,
};

static bool8 DoTradeAnim_Cable(void)
{
    u16 evoTarget;

    switch (sTradeAnim->state)
    {
    case STATE_START:
        gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].invisible = FALSE;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].x2 = -180;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].y2 = gMonFrontPicCoords[sTradeAnim->monSpecies[TRADE_PLAYER]].y_offset;
        sTradeAnim->state++;
        sTradeAnim->cachedMapMusic = GetCurrentMapMusic();
        PlayNewMapMusic(MUS_EVOLUTION);
        break;
    case STATE_MON_SLIDE_IN:
        if (sTradeAnim->bg2hofs > 0)
        {
            // Sliding
            gSprites[sTradeAnim->monSpriteIds[0]].x2 += 3;
            sTradeAnim->bg2hofs -= 3;
        }
        else
        {
            // Pokémon has arrived onscreen
            gSprites[sTradeAnim->monSpriteIds[0]].x2 = 0;
            sTradeAnim->bg2hofs = 0;
            sTradeAnim->state = STATE_SEND_MSG;
        }
        break;
    case STATE_SEND_MSG:
        StringExpandPlaceholders(gStringVar4, gText_XWillBeSentToY);
        DrawTextOnTradeWindow(0, gStringVar4, 0);

        if (sTradeAnim->monSpecies[TRADE_PLAYER] != SPECIES_EGG)
            PlayCry_Normal(sTradeAnim->monSpecies[TRADE_PLAYER], 0);

        sTradeAnim->state = STATE_BYE_BYE;
        sTradeAnim->timer = 0;
        break;
    case STATE_BYE_BYE:
        if (++sTradeAnim->timer == 80)
        {
            sTradeAnim->releasePokeballSpriteId = CreateTradePokeballSprite(sTradeAnim->monSpriteIds[TRADE_PLAYER], gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].oam.paletteNum, 120, 32, 2, 1, 0x14, 0xfffff);
            sTradeAnim->state++;
            StringExpandPlaceholders(gStringVar4, gText_ByeByeVar1);
            DrawTextOnTradeWindow(0, gStringVar4, 0);
        }
        break;
    case STATE_POKEBALL_DEPART:
        if (gSprites[sTradeAnim->releasePokeballSpriteId].callback == SpriteCallbackDummy)
        {
            sTradeAnim->bouncingPokeballSpriteId = CreateSprite(&sSpriteTemplate_Pokeball, 120, 32, 0);
            gSprites[sTradeAnim->bouncingPokeballSpriteId].callback = SpriteCB_BouncingPokeballDepart;
            DestroySprite(&gSprites[sTradeAnim->releasePokeballSpriteId]);
            sTradeAnim->state++;
        }
        break;
    case STATE_POKEBALL_DEPART_WAIT:
        // The game waits here for the sprite to finish its animation sequence.
        break;
    case STATE_FADE_OUT_TO_GBA_SEND:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        sTradeAnim->state = STATE_WAIT_FADE_OUT_TO_GBA_SEND;
        break;
    case STATE_WAIT_FADE_OUT_TO_GBA_SEND:
        if (!gPaletteFade.active)
        {
            SetTradeSequenceBgGpuRegs(4);
            FillWindowPixelBuffer(0, PIXEL_FILL(15));
            CopyWindowToVram(0, COPYWIN_FULL);
            sTradeAnim->state++;
        }
        break;
    case STATE_FADE_IN_TO_GBA_SEND:
        BeginNormalPaletteFade(PALETTES_ALL, -1, 16, 0, RGB_BLACK);
        sTradeAnim->state++;
        break;
    case STATE_WAIT_FADE_IN_TO_GBA_SEND:
        if (!gPaletteFade.active)
            sTradeAnim->state = STATE_GBA_ZOOM_OUT;
        break;
    case STATE_GBA_ZOOM_OUT:
        if (sTradeAnim->bg2Zoom > 0x100)
        {
            sTradeAnim->bg2Zoom -= 0x34;
        }
        else
        {
            SetTradeSequenceBgGpuRegs(1);
            sTradeAnim->bg2Zoom = 0x80;
            sTradeAnim->state++;
            sTradeAnim->timer = 0;
        }
        sTradeAnim->sXY = 0x8000 / sTradeAnim->bg2Zoom;
        break;
    case STATE_GBA_FLASH_SEND:
        if (++sTradeAnim->timer > 20)
        {
            SetTradeBGAffine();
            sTradeAnim->connectionSpriteId2 = CreateSprite(&sSpriteTemplate_GbaScreenFlash_Long, 120, 80, 0);
            sTradeAnim->state++;
        }
        break;
    case STATE_GBA_STOP_FLASH_SEND:
        if (gSprites[sTradeAnim->connectionSpriteId2].animEnded)
        {
            DestroySprite(&gSprites[sTradeAnim->connectionSpriteId2]);
            SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_EFFECT_BLEND |
                                         BLDCNT_TGT2_BG1 |
                                         BLDCNT_TGT2_BG2);
            SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(12, 4));
            sTradeAnim->state++;
        }
        break;
    case STATE_PAN_AWAY_GBA:
        if (--sTradeAnim->bg1vofs == 316)
            sTradeAnim->state++;

        if (sTradeAnim->bg1vofs == 328)
            sTradeAnim->cableEndSpriteId = CreateSprite(&sSpriteTemplate_CableEnd, 128, 65, 0);
        break;
    case STATE_CREATE_LINK_MON_LEAVING:
        sTradeAnim->connectionSpriteId1 = CreateSprite(&sSpriteTemplate_LinkMonGlow, 128, 80, 3);
        sTradeAnim->connectionSpriteId2 = CreateSprite(&sSpriteTemplate_LinkMonShadow, 128, 80, 0);
        StartSpriteAnim(&gSprites[sTradeAnim->connectionSpriteId2], ANIM_LINKMON_SMALL);
        sTradeAnim->state++;
        break;
    case STATE_LINK_MON_TRAVEL_OUT:
        if ((sTradeAnim->bg1vofs -= 2) == 166)
            sTradeAnim->state = STATE_LINK_MON_TRAVEL_OFFSCREEN;
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_1 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG1_ON |
                                      DISPCNT_OBJ_ON);
        break;
    case STATE_LINK_MON_TRAVEL_OFFSCREEN:
        gSprites[sTradeAnim->connectionSpriteId1].y -= 2;
        gSprites[sTradeAnim->connectionSpriteId2].y -= 2;
        if (gSprites[sTradeAnim->connectionSpriteId1].y < -8)
            sTradeAnim->state = STATE_FADE_OUT_TO_CROSSING;
        break;
    case STATE_FADE_OUT_TO_CROSSING:
        BeginNormalPaletteFade(PALETTES_ALL, -1, 0, 16, RGB_BLACK);
        sTradeAnim->state = STATE_WAIT_FADE_OUT_TO_CROSSING;
        break;
    case STATE_WAIT_FADE_OUT_TO_CROSSING:
        if (!gPaletteFade.active)
        {
            DestroySprite(&gSprites[sTradeAnim->connectionSpriteId1]);
            DestroySprite(&gSprites[sTradeAnim->connectionSpriteId2]);
            SetTradeSequenceBgGpuRegs(2);
            sTradeAnim->state++;
        }
        break;
    case STATE_FADE_IN_TO_CROSSING:
        BeginNormalPaletteFade(PALETTES_ALL, -1, 16, 0, RGB_BLACK);
        sTradeAnim->connectionSpriteId1 = CreateSprite(&sSpriteTemplate_LinkMonShadow, 111, 170, 0);
        sTradeAnim->connectionSpriteId2 = CreateSprite(&sSpriteTemplate_LinkMonShadow, 129, -10, 0);
        sTradeAnim->state++;
        break;
    case STATE_WAIT_FADE_IN_TO_CROSSING:
        if (!gPaletteFade.active)
        {
            PlaySE(SE_WARP_OUT);
            sTradeAnim->state++;
        }
        gSprites[sTradeAnim->connectionSpriteId1].y2 -= 3;
        gSprites[sTradeAnim->connectionSpriteId2].y2 += 3;
        break;
    case STATE_CROSSING_LINK_MONS_ENTER:
        gSprites[sTradeAnim->connectionSpriteId1].y2 -= 3;
        gSprites[sTradeAnim->connectionSpriteId2].y2 += 3;
        if (gSprites[sTradeAnim->connectionSpriteId1].y2 <= -90)
        {
            gSprites[sTradeAnim->connectionSpriteId1].data[1] = 1;
            gSprites[sTradeAnim->connectionSpriteId2].data[1] = 1;
            sTradeAnim->state++;
        }
        break;
    case STATE_CROSSING_BLEND_WHITE_1:
        BlendPalettes(0x1, 16, RGB_WHITEALPHA);
        sTradeAnim->state++;
        break;
    case STATE_CROSSING_BLEND_WHITE_2:
        BlendPalettes(0x1, 0, RGB_WHITEALPHA);
        sTradeAnim->state++;
        break;
    case STATE_CROSSING_BLEND_WHITE_3:
        BlendPalettes(0x1, 16, RGB_WHITEALPHA);
        sTradeAnim->state++;
        break;
    case STATE_CROSSING_CREATE_MON_PICS:
        if (!IsMonSpriteNotFlipped(sTradeAnim->monSpecies[TRADE_PLAYER]))
        {
            gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].affineAnims = sAffineAnims_CrossingMonPics;
            gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].oam.affineMode = ST_OAM_AFFINE_DOUBLE;
            CalcCenterToCornerVec(&gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]], SPRITE_SHAPE(64x64), SPRITE_SIZE(64x64), ST_OAM_AFFINE_DOUBLE);
            StartSpriteAffineAnim(&gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]], 0);
        }
        else
        {
            StartSpriteAffineAnim(&gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]], 0);
        }
        StartSpriteAffineAnim(&gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]], 0);
        gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].x = 60;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]].x = 180;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].y = 192;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]].y = -32;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].invisible = FALSE;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]].invisible = FALSE;
        sTradeAnim->state++;
        break;
    case STATE_CROSSING_MON_PICS_MOVE:
        gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].y2 -= 3;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]].y2 += 3;
        if (gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].y2 < -DISPLAY_HEIGHT
         && gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].y2 >= -DISPLAY_HEIGHT - 3)
        {
            PlaySE(SE_WARP_IN);
        }
        if (gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].y2 < -222)
        {
            gSprites[sTradeAnim->connectionSpriteId1].data[1] = 0;
            gSprites[sTradeAnim->connectionSpriteId2].data[1] = 0;
            sTradeAnim->state++;
            gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].invisible = TRUE;
            gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]].invisible = TRUE;
            BlendPalettes(0x1, 0, RGB_WHITEALPHA);
        }
        break;
    case STATE_CROSSING_LINK_MONS_EXIT:
        gSprites[sTradeAnim->connectionSpriteId1].y2 -= 3;
        gSprites[sTradeAnim->connectionSpriteId2].y2 += 3;
        if (gSprites[sTradeAnim->connectionSpriteId1].y2 <= -222)
        {
            BeginNormalPaletteFade(PALETTES_ALL, -1, 0, 16, RGB_BLACK);
            sTradeAnim->state++;
            DestroySprite(&gSprites[sTradeAnim->connectionSpriteId1]);
            DestroySprite(&gSprites[sTradeAnim->connectionSpriteId2]);
        }
        break;
    case STATE_CREATE_LINK_MON_ARRIVING:
        if (!gPaletteFade.active)
        {
            sTradeAnim->state++;
            SetTradeSequenceBgGpuRegs(1);
            sTradeAnim->bg1vofs = 166;
            sTradeAnim->connectionSpriteId1 = CreateSprite(&sSpriteTemplate_LinkMonGlow, 128, -20, 3);
            sTradeAnim->connectionSpriteId2 = CreateSprite(&sSpriteTemplate_LinkMonShadow, 128, -20, 0);
            StartSpriteAnim(&gSprites[sTradeAnim->connectionSpriteId2], ANIM_LINKMON_SMALL);
        }
        break;
    case STATE_FADE_OUT_TO_GBA_RECV:
        BeginNormalPaletteFade(PALETTES_ALL, -1, 16, 0, RGB_BLACK);
        sTradeAnim->state++;
        break;
    case STATE_WAIT_FADE_OUT_TO_GBA_RECV:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG1_ON |
                                      DISPCNT_OBJ_ON);
        if (!gPaletteFade.active)
            sTradeAnim->state++;
        break;
    case STATE_LINK_MON_TRAVEL_IN:
        gSprites[sTradeAnim->connectionSpriteId1].y2 += 3;
        gSprites[sTradeAnim->connectionSpriteId2].y2 += 3;
        if (gSprites[sTradeAnim->connectionSpriteId1].y2 + gSprites[sTradeAnim->connectionSpriteId1].y == 64)
            sTradeAnim->state++;
        break;
    case STATE_PAN_TO_GBA:
        if ((sTradeAnim->bg1vofs += 2) > 316)
        {
            sTradeAnim->bg1vofs = 316;
            sTradeAnim->state++;
        }
        break;
    case STATE_DESTROY_LINK_MON:
        DestroySprite(&gSprites[sTradeAnim->connectionSpriteId1]);
        DestroySprite(&gSprites[sTradeAnim->connectionSpriteId2]);
        sTradeAnim->state++;
        sTradeAnim->timer = 0;
        break;
    case STATE_LINK_MON_ARRIVED_DELAY:
        if (++sTradeAnim->timer == 10)
            sTradeAnim->state++;
        break;
    case STATE_MOVE_GBA_TO_CENTER:
        if (++sTradeAnim->bg1vofs > 348)
        {
            sTradeAnim->bg1vofs = 348;
            sTradeAnim->state++;
        }
        if (sTradeAnim->bg1vofs == 328 && sTradeAnim->isCableTrade)
        {
            sTradeAnim->cableEndSpriteId = CreateSprite(&sSpriteTemplate_CableEnd, 128, 65, 0);
            gSprites[sTradeAnim->cableEndSpriteId].callback = SpriteCB_CableEndReceiving;
        }
        break;
    case STATE_GBA_FLASH_RECV:
        sTradeAnim->connectionSpriteId2 = CreateSprite(&sSpriteTemplate_GbaScreenFlash_Long, 120, 80, 0);
        sTradeAnim->state = STATE_GBA_STOP_FLASH_RECV;
        break;
    case STATE_GBA_STOP_FLASH_RECV:
        if (gSprites[sTradeAnim->connectionSpriteId2].animEnded)
        {
            DestroySprite(&gSprites[sTradeAnim->connectionSpriteId2]);
            SetTradeSequenceBgGpuRegs(6);
            sTradeAnim->state++;
            PlaySE(SE_M_SAND_ATTACK);
        }
        break;
    case STATE_GBA_ZOOM_IN:
        if (sTradeAnim->bg2Zoom < 0x400)
        {
            sTradeAnim->bg2Zoom += 0x34;
        }
        else
        {
            sTradeAnim->bg2Zoom = 0x400;
            sTradeAnim->state++;
        }
        sTradeAnim->sXY = 0x8000 / sTradeAnim->bg2Zoom;
        break;
    case STATE_FADE_OUT_TO_NEW_MON:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        sTradeAnim->state = STATE_WAIT_FADE_OUT_TO_NEW_MON;
        break;

    case STATE_WAIT_FADE_OUT_TO_NEW_MON:
        if (!gPaletteFade.active)
        {
            SetTradeSequenceBgGpuRegs(5);
            SetTradeSequenceBgGpuRegs(7);
            gPaletteFade.bufferTransferDisabled = TRUE;
            sTradeAnim->state++;
        }
        break;
    case STATE_FADE_IN_TO_NEW_MON:
        gPaletteFade.bufferTransferDisabled = FALSE;
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        sTradeAnim->state++;
        break;
    case STATE_WAIT_FADE_IN_TO_NEW_MON:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG2_ON |
                                      DISPCNT_OBJ_ON);
        if (!gPaletteFade.active)
        {
            sTradeAnim->state++;
        }
        break;
    case STATE_POKEBALL_ARRIVE:
        sTradeAnim->bouncingPokeballSpriteId = CreateSprite(&sSpriteTemplate_Pokeball, 120, -8, 0);
        gSprites[sTradeAnim->bouncingPokeballSpriteId].data[3] = 74;
        gSprites[sTradeAnim->bouncingPokeballSpriteId].callback = SpriteCB_BouncingPokeballArrive;
        StartSpriteAnim(&gSprites[sTradeAnim->bouncingPokeballSpriteId], 1);
        StartSpriteAffineAnim(&gSprites[sTradeAnim->bouncingPokeballSpriteId], 2);
        BlendPalettes(1 << (16 + gSprites[sTradeAnim->bouncingPokeballSpriteId].oam.paletteNum), 16, RGB_WHITEALPHA);
        sTradeAnim->state++;
        sTradeAnim->timer = 0;
        break;
    case STATE_FADE_POKEBALL_TO_NORMAL:
        BeginNormalPaletteFade(1 << (16 + gSprites[sTradeAnim->bouncingPokeballSpriteId].oam.paletteNum), 1, 16, 0, RGB_WHITEALPHA);
        sTradeAnim->state++;
        break;
    case STATE_POKEBALL_ARRIVE_WAIT:
        if (gSprites[sTradeAnim->bouncingPokeballSpriteId].callback == SpriteCallbackDummy)
        {
            HandleLoadSpecialPokePic(&gMonFrontPicTable[sTradeAnim->monSpecies[TRADE_PARTNER]],
                                      gMonSpritesGfxPtr->sprites[B_POSITION_OPPONENT_RIGHT],
                                      sTradeAnim->monSpecies[TRADE_PARTNER],
                                      sTradeAnim->monPersonalities[TRADE_PARTNER]);
            sTradeAnim->state++;
        }
        break;
    case STATE_SHOW_NEW_MON:
        gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]].x = 120;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]].y = gMonFrontPicCoords[sTradeAnim->monSpecies[TRADE_PARTNER]].y_offset + 60;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]].x2 = 0;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]].y2 = 0;
        StartSpriteAnim(&gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]], 0);
        CreatePokeballSpriteToReleaseMon(sTradeAnim->monSpriteIds[TRADE_PARTNER], gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]].oam.paletteNum, 120, 84, 2, 1, 20, 0xFFFFF);
        FreeSpriteOamMatrix(&gSprites[sTradeAnim->bouncingPokeballSpriteId]);
        DestroySprite(&gSprites[sTradeAnim->bouncingPokeballSpriteId]);
        sTradeAnim->state++;
        break;
    case STATE_NEW_MON_MSG:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG0_ON |
                                      DISPCNT_BG2_ON |
                                      DISPCNT_OBJ_ON);
        StringExpandPlaceholders(gStringVar4, gText_XSentOverY);
        DrawTextOnTradeWindow(0, gStringVar4, 0);
        sTradeAnim->state = STATE_DELAY_FOR_MON_ANIM;
        sTradeAnim->timer = 0;
        break;
    case STATE_DELAY_FOR_MON_ANIM:
        if (++sTradeAnim->timer > 60)
        {
            if (sTradeAnim->monSpecies[TRADE_PARTNER] != SPECIES_EGG)
                PlayCry_Normal(sTradeAnim->monSpecies[TRADE_PARTNER], 0);
            sTradeAnim->state = STATE_WAIT_FOR_MON_CRY;
            sTradeAnim->timer = 0;
        }
        break;
    case STATE_WAIT_FOR_MON_CRY:
        if (IsCryFinished())
            sTradeAnim->state = STATE_TAKE_CARE_OF_MON;
        break;
    case STATE_TAKE_CARE_OF_MON:
        if (++sTradeAnim->timer == 10)
            PlayFanfare(MUS_EVOLVED);

        if (sTradeAnim->timer == 250)
        {
            sTradeAnim->state++;
            StringExpandPlaceholders(gStringVar4, gText_TakeGoodCareOfX);
            DrawTextOnTradeWindow(0, gStringVar4, 0);
            sTradeAnim->timer = 0;
        }
        break;
    case STATE_AFTER_NEW_MON_DELAY:
        if (++sTradeAnim->timer == 60)
            sTradeAnim->state++;
        break;
    case STATE_CHECK_RIBBONS:
        CheckPartnersMonForRibbons();
        sTradeAnim->state++;
        break;
    case STATE_END_LINK_TRADE:
        if (sTradeAnim->isLinkTrade)
            return TRUE;
        else if (JOY_NEW(A_BUTTON))
            sTradeAnim->state++;
        break;
    case STATE_TRY_EVOLUTION: // Only if in-game trade, link trades use CB2_TryLinkTradeEvolution
        TradeMons(gSpecialVar_0x8005, 0);
        gCB2_AfterEvolution = CB2_InGameTrade;
        evoTarget = GetEvolutionTargetSpecies(&gPlayerParty[gSelectedTradeMonPositions[TRADE_PLAYER]], EVO_MODE_TRADE, ITEM_NONE);
        if (evoTarget != SPECIES_NONE)
            TradeEvolutionScene(&gPlayerParty[gSelectedTradeMonPositions[TRADE_PLAYER]], evoTarget, sTradeAnim->monSpriteIds[1], gSelectedTradeMonPositions[TRADE_PLAYER]);
        sTradeAnim->state++;
        break;
    case STATE_FADE_OUT_END:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        sTradeAnim->state++;
        break;
    case STATE_WAIT_FADE_OUT_END:
        if (!gPaletteFade.active)
        {
            PlayNewMapMusic(sTradeAnim->cachedMapMusic);
            if (sTradeAnim)
            {
                FreeAllWindowBuffers();
                Free(GetBgTilemapBuffer(3));
                Free(GetBgTilemapBuffer(1));
                Free(GetBgTilemapBuffer(0));
                FreeMonSpritesGfx();
                FREE_AND_SET_NULL(sTradeAnim);
            }
            SetMainCallback2(CB2_ReturnToField);
            BufferInGameTradeMonName();
            HelpSystem_Enable();
        }
        break;
    }
    return FALSE;
}

// Task data for Task_AnimateWirelessSignal
#define tIdx               data[0]
#define tCounter           data[1]
#define tSignalComingBack  data[2]

static bool8 DoTradeAnim_Wireless(void)
{
    u16 evoTarget;

    switch (sTradeAnim->state)
    {
    case STATE_START:
        gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].invisible = FALSE;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].x2 = -180;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].y2 = gMonFrontPicCoords[sTradeAnim->monSpecies[TRADE_PLAYER]].y_offset;
        sTradeAnim->state++;
        sTradeAnim->cachedMapMusic = GetCurrentMapMusic();
        PlayNewMapMusic(MUS_EVOLUTION);
        break;
    case STATE_MON_SLIDE_IN:
        if (sTradeAnim->bg2hofs > 0)
        {
            gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].x2 += 3;
            sTradeAnim->bg2hofs -= 3;
        }
        else
        {
            gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].x2 = 0;
            sTradeAnim->bg2hofs = 0;
            sTradeAnim->state = STATE_SEND_MSG;
        }
        break;
    case STATE_SEND_MSG:
        StringExpandPlaceholders(gStringVar4, gText_XWillBeSentToY);
        DrawTextOnTradeWindow(0, gStringVar4, 0);

        if (sTradeAnim->monSpecies[TRADE_PLAYER] != SPECIES_EGG)
            PlayCry_Normal(sTradeAnim->monSpecies[TRADE_PLAYER], 0);

        sTradeAnim->state = STATE_BYE_BYE;
        sTradeAnim->timer = 0;
        break;
    case STATE_BYE_BYE:
        if (++sTradeAnim->timer == 80)
        {
            sTradeAnim->releasePokeballSpriteId = CreateTradePokeballSprite(sTradeAnim->monSpriteIds[TRADE_PLAYER], gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].oam.paletteNum, 120, 32, 2, 1, 0x14, 0xfffff);
            sTradeAnim->state++;
            StringExpandPlaceholders(gStringVar4, gText_ByeByeVar1);
            DrawTextOnTradeWindow(0, gStringVar4, 0);
        }
        break;
    case STATE_POKEBALL_DEPART:
        if (gSprites[sTradeAnim->releasePokeballSpriteId].callback == SpriteCallbackDummy)
        {
            sTradeAnim->bouncingPokeballSpriteId = CreateSprite(&sSpriteTemplate_Pokeball, 120, 32, 0);
            gSprites[sTradeAnim->bouncingPokeballSpriteId].callback = SpriteCB_BouncingPokeballDepart;
            DestroySprite(&gSprites[sTradeAnim->releasePokeballSpriteId]);
            sTradeAnim->state++;
        }
        break;
    case STATE_POKEBALL_DEPART_WAIT:
        // The game waits here for the sprite to finish its animation sequence.
        break;
    case STATE_FADE_OUT_TO_GBA_SEND:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        sTradeAnim->state = STATE_WAIT_FADE_OUT_TO_GBA_SEND;
        break;
    case STATE_WAIT_FADE_OUT_TO_GBA_SEND:
        if (!gPaletteFade.active)
        {
            SetTradeSequenceBgGpuRegs(4);
            FillWindowPixelBuffer(0, PIXEL_FILL(15));
            CopyWindowToVram(0, COPYWIN_FULL);
            sTradeAnim->state++;
        }
        break;
    case STATE_FADE_IN_TO_GBA_SEND:
        BeginNormalPaletteFade(PALETTES_ALL, -1, 16, 0, RGB_BLACK);
        sTradeAnim->state++;
        break;
    case STATE_WAIT_FADE_IN_TO_GBA_SEND:
        if (!gPaletteFade.active)
            sTradeAnim->state = STATE_GBA_ZOOM_OUT;
        break;
    case STATE_GBA_ZOOM_OUT:
        if (sTradeAnim->bg2Zoom > 0x100)
        {
            sTradeAnim->bg2Zoom -= 0x34;
        }
        else
        {
            SetTradeSequenceBgGpuRegs(1);
            sTradeAnim->bg2Zoom = 0x80;
            sTradeAnim->state = STATE_GBA_FLASH_SEND_WIRELESS;
            sTradeAnim->timer = 0;
        }
        sTradeAnim->sXY = 0x8000 / sTradeAnim->bg2Zoom;
        break;
    case STATE_GBA_FLASH_SEND_WIRELESS:
        if (++sTradeAnim->timer > 20)
        {
            SetTradeSequenceBgGpuRegs(3);
            sTradeAnim->connectionSpriteId2 = CreateSprite(&sSpriteTemplate_GbaScreenFlash_Short, 120, 80, 0);
            sTradeAnim->state++;
        }
        break;
    case STATE_GBA_STOP_FLASH_SEND_WIRELESS:
        if (gSprites[sTradeAnim->connectionSpriteId2].animEnded)
        {
            DestroySprite(&gSprites[sTradeAnim->connectionSpriteId2]);
            SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG1 |
                                         BLDCNT_TGT1_OBJ |
                                         BLDCNT_EFFECT_BLEND |
                                         BLDCNT_TGT2_BG2);
            SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(16, 4));
            
            // Start wireless signal effect
            CreateTask(Task_AnimateWirelessSignal, 5);
            sTradeAnim->state++;
        }
        break;
    case STATE_WAIT_WIRELESS_SIGNAL_SEND:
        if (!FuncIsActiveTask(Task_AnimateWirelessSignal))
            sTradeAnim->state = STATE_PAN_AWAY_GBA;
        break;
    case STATE_PAN_AWAY_GBA:
        if (--sTradeAnim->bg1vofs == 316)
            sTradeAnim->state++;
        break;
    case STATE_CREATE_LINK_MON_LEAVING:
        sTradeAnim->connectionSpriteId1 = CreateSprite(&sSpriteTemplate_LinkMonGlow, 120, 80, 3);
        gSprites[sTradeAnim->connectionSpriteId1].callback = SpriteCB_LinkMonGlowWireless;
        sTradeAnim->connectionSpriteId2 = CreateSprite(&sSpriteTemplate_LinkMonShadow, 120, 80, 0);
        StartSpriteAnim(&gSprites[sTradeAnim->connectionSpriteId2], ANIM_LINKMON_SMALL);
        sTradeAnim->state++;
        break;
    case STATE_LINK_MON_TRAVEL_OUT:
        if ((sTradeAnim->bg1vofs -= 3) == 166)
            sTradeAnim->state = STATE_LINK_MON_TRAVEL_OFFSCREEN;

        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_1 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG1_ON |
                                      DISPCNT_OBJ_ON);
        break;
    case STATE_LINK_MON_TRAVEL_OFFSCREEN:
        gSprites[sTradeAnim->connectionSpriteId1].y -= 2;
        gSprites[sTradeAnim->connectionSpriteId2].y -= 2;
        if (gSprites[sTradeAnim->connectionSpriteId1].y < -8)
            sTradeAnim->state = STATE_FADE_OUT_TO_CROSSING;
        break;
    case STATE_FADE_OUT_TO_CROSSING:
        BeginNormalPaletteFade(PALETTES_ALL, -1, 0, 16, RGB_BLACK);
        sTradeAnim->state = STATE_WAIT_FADE_OUT_TO_CROSSING;
        break;
    case STATE_WAIT_FADE_OUT_TO_CROSSING:
        if (!gPaletteFade.active)
        {
            DestroySprite(&gSprites[sTradeAnim->connectionSpriteId1]);
            DestroySprite(&gSprites[sTradeAnim->connectionSpriteId2]);
            SetTradeSequenceBgGpuRegs(2);
            sTradeAnim->state++;
        }
        break;
    case STATE_FADE_IN_TO_CROSSING:
        BeginNormalPaletteFade(PALETTES_ALL, -1, 16, 0, RGB_BLACK);
        sTradeAnim->connectionSpriteId1 = CreateSprite(&sSpriteTemplate_LinkMonShadow, 111, 170, 0);
        sTradeAnim->connectionSpriteId2 = CreateSprite(&sSpriteTemplate_LinkMonShadow, 129, -10, 0);
        sTradeAnim->state++;
        break;
    case STATE_WAIT_FADE_IN_TO_CROSSING:
        if (!gPaletteFade.active)
        {
            PlaySE(SE_WARP_OUT);
            sTradeAnim->state++;
        }
        gSprites[sTradeAnim->connectionSpriteId1].y2 -= 3;
        gSprites[sTradeAnim->connectionSpriteId2].y2 += 3;
        break;
    case STATE_CROSSING_LINK_MONS_ENTER:
        gSprites[sTradeAnim->connectionSpriteId1].y2 -= 3;
        gSprites[sTradeAnim->connectionSpriteId2].y2 += 3;
        if (gSprites[sTradeAnim->connectionSpriteId1].y2 <= -90)
        {
            gSprites[sTradeAnim->connectionSpriteId1].data[1] = 1;
            gSprites[sTradeAnim->connectionSpriteId2].data[1] = 1;
            sTradeAnim->state++;
            CreateTask(Task_OpenCenterWhiteColumn, 5);
        }
        break;
    case STATE_CROSSING_BLEND_WHITE_1:
        BlendPalettes(0x8, 16, RGB_WHITEALPHA);
        sTradeAnim->state++;
        break;
    case STATE_CROSSING_BLEND_WHITE_2:
        BlendPalettes(0x8, 16, RGB_WHITEALPHA);
        sTradeAnim->state++;
        break;
    case STATE_CROSSING_BLEND_WHITE_3:
        BlendPalettes(0x8, 16, RGB_WHITEALPHA);
        sTradeAnim->state++;
        break;
    case STATE_CROSSING_CREATE_MON_PICS:
        if (!IsMonSpriteNotFlipped(sTradeAnim->monSpecies[TRADE_PLAYER]))
        {
            gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].affineAnims = sAffineAnims_CrossingMonPics;
            gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].oam.affineMode = ST_OAM_AFFINE_DOUBLE;
            CalcCenterToCornerVec(&gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]], SPRITE_SHAPE(64x64), SPRITE_SIZE(64x64), ST_OAM_AFFINE_DOUBLE);
            StartSpriteAffineAnim(&gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]], 0);
        }
        else
        {
            StartSpriteAffineAnim(&gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]], 0);
        }
        StartSpriteAffineAnim(&gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]], 0);
        gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].x = 40;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]].x = 200;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].y = 192;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]].y = -32;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].invisible = FALSE;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]].invisible = FALSE;
        sTradeAnim->state++;
        break;
    case STATE_CROSSING_MON_PICS_MOVE:
        gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].y2 -= 3;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]].y2 += 3;
        if (gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].y2 < -DISPLAY_HEIGHT
         && gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].y2 >= -DISPLAY_HEIGHT - 3)
        {
            PlaySE(SE_WARP_IN);
        }
        if (gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].y2 < -222)
        {
            gSprites[sTradeAnim->connectionSpriteId1].data[1] = 0;
            gSprites[sTradeAnim->connectionSpriteId2].data[1] = 0;
            sTradeAnim->state++;
            gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]].invisible = TRUE;
            gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]].invisible = TRUE;
            CreateTask(Task_CloseCenterWhiteColumn, 5);
        }
        break;
    case STATE_CROSSING_LINK_MONS_EXIT:
        gSprites[sTradeAnim->connectionSpriteId1].y2 -= 3;
        gSprites[sTradeAnim->connectionSpriteId2].y2 += 3;
        if (gSprites[sTradeAnim->connectionSpriteId1].y2 <= -222)
        {
            BeginNormalPaletteFade(PALETTES_ALL, -1, 0, 16, RGB_BLACK);
            sTradeAnim->state++;
            DestroySprite(&gSprites[sTradeAnim->connectionSpriteId1]);
            DestroySprite(&gSprites[sTradeAnim->connectionSpriteId2]);
        }
        break;
    case STATE_CREATE_LINK_MON_ARRIVING:
        if (!gPaletteFade.active)
        {
            sTradeAnim->state++;
            SetTradeSequenceBgGpuRegs(1);
            sTradeAnim->bg1vofs = 166;
            SetTradeSequenceBgGpuRegs(3);
            sTradeAnim->bg2vofs = 412;
            sTradeAnim->connectionSpriteId1 = CreateSprite(&sSpriteTemplate_LinkMonGlow, 120, -20, 3);
            gSprites[sTradeAnim->connectionSpriteId1].callback = SpriteCB_LinkMonGlowWireless;
            sTradeAnim->connectionSpriteId2 = CreateSprite(&sSpriteTemplate_LinkMonShadow, 120, -20, 0);
            StartSpriteAnim(&gSprites[sTradeAnim->connectionSpriteId2], 1);
        }
        break;
    case STATE_FADE_OUT_TO_GBA_RECV:
        BeginNormalPaletteFade(PALETTES_ALL, -1, 16, 0, RGB_BLACK);
        sTradeAnim->state++;
        break;
    case STATE_WAIT_FADE_OUT_TO_GBA_RECV:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG1_ON |
                                      DISPCNT_OBJ_ON);
        if (!gPaletteFade.active)
            sTradeAnim->state++;
        break;
    case STATE_LINK_MON_TRAVEL_IN:
        gSprites[sTradeAnim->connectionSpriteId1].y2 += 4;
        gSprites[sTradeAnim->connectionSpriteId2].y2 += 4;
        if (gSprites[sTradeAnim->connectionSpriteId1].y2 + gSprites[sTradeAnim->connectionSpriteId1].y == 64)
        {
            sTradeAnim->state = STATE_PAN_TO_GBA_WIRELESS;
            sTradeAnim->timer = 0;
        }
        break;
    case STATE_PAN_TO_GBA_WIRELESS:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG1_ON |
                                      DISPCNT_BG2_ON |
                                      DISPCNT_OBJ_ON);
        sTradeAnim->bg1vofs += 3;
        sTradeAnim->bg2vofs += 3;
        if (++sTradeAnim->timer == 10)
        {
            u8 taskId = CreateTask(Task_AnimateWirelessSignal, 5);
            gTasks[taskId].tSignalComingBack = TRUE;
        }
        if (sTradeAnim->bg1vofs > 316)
        {
            sTradeAnim->bg1vofs = 316;
            sTradeAnim->state++;
        }
        break;
    case STATE_DESTROY_LINK_MON_WIRELESS:
        DestroySprite(&gSprites[sTradeAnim->connectionSpriteId1]);
        DestroySprite(&gSprites[sTradeAnim->connectionSpriteId2]);
        sTradeAnim->state++;
        sTradeAnim->timer = 0;
        break;
    case STATE_WAIT_WIRELESS_SIGNAL_RECV:
        if (!FuncIsActiveTask(Task_AnimateWirelessSignal))
        {
            sTradeAnim->state = STATE_LINK_MON_ARRIVED_DELAY;
            sTradeAnim->timer = 0;
        }
        break;
    case STATE_LINK_MON_ARRIVED_DELAY:
        if (++sTradeAnim->timer == 10)
            sTradeAnim->state++;
        break;
    case STATE_MOVE_GBA_TO_CENTER:
        if (++sTradeAnim->bg1vofs > 348)
        {
            sTradeAnim->bg1vofs = 348;
            sTradeAnim->state++;
        }
        break;
    case STATE_GBA_FLASH_RECV:
        sTradeAnim->connectionSpriteId2 = CreateSprite(&sSpriteTemplate_GbaScreenFlash_Long, 120, 80, 0);
        sTradeAnim->state = STATE_GBA_STOP_FLASH_RECV;
        break;
    case STATE_GBA_STOP_FLASH_RECV:
        if (gSprites[sTradeAnim->connectionSpriteId2].animEnded)
        {
            DestroySprite(&gSprites[sTradeAnim->connectionSpriteId2]);
            SetTradeSequenceBgGpuRegs(6);
            sTradeAnim->state++;
            PlaySE(SE_M_SAND_ATTACK);
        }
        break;
    case STATE_GBA_ZOOM_IN:
        if (sTradeAnim->bg2Zoom < 0x400)
        {
            sTradeAnim->bg2Zoom += 0x34;
        }
        else
        {
            sTradeAnim->bg2Zoom = 0x400;
            sTradeAnim->state++;
        }
        sTradeAnim->sXY = 0x8000 / sTradeAnim->bg2Zoom;
        break;
    case STATE_FADE_OUT_TO_NEW_MON:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        sTradeAnim->state = 60;
        break;
    case STATE_WAIT_FADE_OUT_TO_NEW_MON:
        if (!gPaletteFade.active)
        {
            SetTradeSequenceBgGpuRegs(5);
            SetTradeSequenceBgGpuRegs(7);
            gPaletteFade.bufferTransferDisabled = TRUE;
            sTradeAnim->state++;
        }
        break;
    case STATE_FADE_IN_TO_NEW_MON:
        gPaletteFade.bufferTransferDisabled = FALSE;
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        sTradeAnim->state++;
        break;
    case STATE_WAIT_FADE_IN_TO_NEW_MON:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG2_ON |
                                      DISPCNT_OBJ_ON);
        if (!gPaletteFade.active)
            sTradeAnim->state++;
        break;
    case STATE_POKEBALL_ARRIVE:
        sTradeAnim->bouncingPokeballSpriteId = CreateSprite(&sSpriteTemplate_Pokeball, 120, -8, 0);
        gSprites[sTradeAnim->bouncingPokeballSpriteId].data[3] = 74;
        gSprites[sTradeAnim->bouncingPokeballSpriteId].callback = SpriteCB_BouncingPokeballArrive;
        StartSpriteAnim(&gSprites[sTradeAnim->bouncingPokeballSpriteId], 1);
        StartSpriteAffineAnim(&gSprites[sTradeAnim->bouncingPokeballSpriteId], 2);
        BlendPalettes(1 << (16 + gSprites[sTradeAnim->bouncingPokeballSpriteId].oam.paletteNum), 16, RGB_WHITEALPHA);
        sTradeAnim->state++;
        sTradeAnim->timer = 0;
        break;
    case STATE_FADE_POKEBALL_TO_NORMAL:
        BeginNormalPaletteFade(1 << (16 + gSprites[sTradeAnim->bouncingPokeballSpriteId].oam.paletteNum), 1, 16, 0, RGB_WHITEALPHA);
        sTradeAnim->state++;
        break;
    case STATE_POKEBALL_ARRIVE_WAIT:
        if (gSprites[sTradeAnim->bouncingPokeballSpriteId].callback == SpriteCallbackDummy)
        {
            HandleLoadSpecialPokePic(&gMonFrontPicTable[sTradeAnim->monSpecies[TRADE_PARTNER]],
                                     gMonSpritesGfxPtr->sprites[B_POSITION_OPPONENT_RIGHT],
                                     sTradeAnim->monSpecies[TRADE_PARTNER],
                                     sTradeAnim->monPersonalities[TRADE_PARTNER]);
            sTradeAnim->state++;
        }
        break;
    case STATE_SHOW_NEW_MON:
        gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]].x = 120;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]].y = gMonFrontPicCoords[sTradeAnim->monSpecies[TRADE_PARTNER]].y_offset + 60;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]].x2 = 0;
        gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]].y2 = 0;
        StartSpriteAnim(&gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]], 0);
        CreatePokeballSpriteToReleaseMon(sTradeAnim->monSpriteIds[TRADE_PARTNER], gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]].oam.paletteNum, 120, 84, 2, 1, 20, 0xFFFFF);
        FreeSpriteOamMatrix(&gSprites[sTradeAnim->bouncingPokeballSpriteId]);
        DestroySprite(&gSprites[sTradeAnim->bouncingPokeballSpriteId]);
        sTradeAnim->state++;
        break;
    case STATE_NEW_MON_MSG:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG0_ON |
                                      DISPCNT_BG2_ON |
                                      DISPCNT_OBJ_ON);
        StringExpandPlaceholders(gStringVar4, gText_XSentOverY);
        DrawTextOnTradeWindow(0, gStringVar4, 0);
        sTradeAnim->state = STATE_DELAY_FOR_MON_ANIM;
        sTradeAnim->timer = 0;
        break;
    case STATE_DELAY_FOR_MON_ANIM:
        if (++sTradeAnim->timer > 60)
        {
            if (sTradeAnim->monSpecies[TRADE_PARTNER] != SPECIES_EGG)
                PlayCry_Normal(sTradeAnim->monSpecies[TRADE_PARTNER], 0);
            sTradeAnim->state = STATE_WAIT_FOR_MON_CRY;
            sTradeAnim->timer = 0;
        }
        break;
    case STATE_WAIT_FOR_MON_CRY:
        if (IsCryFinished())
            sTradeAnim->state = STATE_TAKE_CARE_OF_MON;
        break;
    case STATE_TAKE_CARE_OF_MON:
        if (++sTradeAnim->timer == 10)
            PlayFanfare(MUS_EVOLVED);

        if (sTradeAnim->timer == 250)
        {
            sTradeAnim->state++;
            StringExpandPlaceholders(gStringVar4, gText_TakeGoodCareOfX);
            DrawTextOnTradeWindow(0, gStringVar4, 0);
            sTradeAnim->timer = 0;
        }
        break;
    case STATE_AFTER_NEW_MON_DELAY:
        if (++sTradeAnim->timer == 60)
            sTradeAnim->state++;
        break;
    case STATE_CHECK_RIBBONS:
        CheckPartnersMonForRibbons();
        sTradeAnim->state++;
        break;
    case STATE_END_LINK_TRADE:
        if (sTradeAnim->isLinkTrade)
            return TRUE;
        else if (JOY_NEW(A_BUTTON))
            sTradeAnim->state++;
        break;
    case STATE_TRY_EVOLUTION: // Only if in-game trade, link trades use CB2_TryLinkTradeEvolution
        TradeMons(gSpecialVar_0x8005, 0);
        gCB2_AfterEvolution = CB2_InGameTrade;
        evoTarget = GetEvolutionTargetSpecies(&gPlayerParty[gSelectedTradeMonPositions[TRADE_PLAYER]], EVO_MODE_TRADE, ITEM_NONE);
        if (evoTarget != SPECIES_NONE)
            TradeEvolutionScene(&gPlayerParty[gSelectedTradeMonPositions[TRADE_PLAYER]], evoTarget, sTradeAnim->monSpriteIds[TRADE_PARTNER], gSelectedTradeMonPositions[TRADE_PLAYER]);
        sTradeAnim->state++;
        break;
    case STATE_FADE_OUT_END:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        sTradeAnim->state++;
        break;
    case STATE_WAIT_FADE_OUT_END:
        if (!gPaletteFade.active)
        {
            PlayNewMapMusic(sTradeAnim->cachedMapMusic);
            if (sTradeAnim)
            {
                FreeAllWindowBuffers();
                Free(GetBgTilemapBuffer(3));
                Free(GetBgTilemapBuffer(1));
                Free(GetBgTilemapBuffer(0));
                FreeMonSpritesGfx();
                FREE_AND_SET_NULL(sTradeAnim);
            }
            SetMainCallback2(CB2_ReturnToField);
            BufferInGameTradeMonName();
            HelpSystem_Enable();
        }
        break;
    }
    return FALSE;
}

// Try to evolve a Pokémon received in a link trade
// In-game trades resolve evolution during the trade sequence, in STATE_TRY_EVOLUTION
static void CB2_TryLinkTradeEvolution(void)
{
    u16 evoSpecies;
    switch (gMain.state)
    {
    case 0:
        gMain.state = 4;
        gSoftResetDisabled = TRUE;
        break;
    case 4:
        gCB2_AfterEvolution = CB2_SaveAndEndTrade;
        evoSpecies = GetEvolutionTargetSpecies(&gPlayerParty[gSelectedTradeMonPositions[TRADE_PLAYER]], EVO_MODE_TRADE, 0);
        if (evoSpecies != SPECIES_NONE)
            TradeEvolutionScene(&gPlayerParty[gSelectedTradeMonPositions[TRADE_PLAYER]], evoSpecies, sTradeAnim->monSpriteIds[TRADE_PARTNER], gSelectedTradeMonPositions[TRADE_PLAYER]);
        else
            SetMainCallback2(CB2_SaveAndEndTrade);
        gSelectedTradeMonPositions[TRADE_PLAYER] = 0xFF;
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
    TradeGetMultiplayerId(); // no effect call, ret val ignored
    recvStatus = GetBlockReceivedStatus();
    if (recvStatus & (1 << 0))
    {
        if (gBlockRecvBuffer[0][0] == LINKCMD_CONFIRM_FINISH_TRADE)
            SetMainCallback2(CB2_TryLinkTradeEvolution);
        if (gBlockRecvBuffer[0][0] == LINKCMD_READY_FINISH_TRADE)
            sTradeAnim->playerFinishStatus = STATUS_READY;
        ResetBlockReceivedFlag(0);
    }
    if (recvStatus & (1 << 1))
    {
        if (gBlockRecvBuffer[1][0] == LINKCMD_READY_FINISH_TRADE)
            sTradeAnim->partnerFinishStatus = STATUS_READY;
        ResetBlockReceivedFlag(1);
    }
}

static void SpriteCB_BouncingPokeball(struct Sprite *sprite)
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

static void SpriteCB_BouncingPokeballDepart(struct Sprite *sprite)
{
    sprite->y2 += sTradeBallVerticalVelocityTable[sprite->data[0]];
    if (sprite->data[0] == 22)
        PlaySE(SE_BALL_BOUNCE_1);
    if (++sprite->data[0] == 44)
    {
        PlaySE(SE_M_MEGA_KICK);
        sprite->callback = SpriteCB_BouncingPokeballDepartEnd;
        sprite->data[0] = 0;
        BeginNormalPaletteFade(1 << (sprite->oam.paletteNum + 16), -1, 0, 16, RGB_WHITEALPHA);
    }
}

static void SpriteCB_BouncingPokeballDepartEnd(struct Sprite *sprite)
{
    if (sprite->data[1] == 20)
        StartSpriteAffineAnim(sprite, 1);
    if (++sprite->data[1] > 20)
    {
        sprite->y2 -= sTradeBallVerticalVelocityTable[sprite->data[0]];
        if (++sprite->data[0] == 23)
        {
            DestroySprite(sprite);
            sTradeAnim->state = 14;
        }
    }
}

static void SpriteCB_BouncingPokeballArrive(struct Sprite *sprite)
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
        if (++sprite->data[0] == 108)
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
    CreateMon(tradeMon, inGameTrade->species, level, USE_RANDOM_IVS, TRUE, inGameTrade->personality, TRUE, inGameTrade->otId);
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

static void CB2_UpdateLinkTrade(void)
{
    if (DoTradeAnim() == TRUE)
    {
        DestroySprite(&gSprites[sTradeAnim->monSpriteIds[TRADE_PLAYER]]);
        FreeSpriteOamMatrix(&gSprites[sTradeAnim->monSpriteIds[TRADE_PARTNER]]);
        TradeMons(gSelectedTradeMonPositions[TRADE_PLAYER], gSelectedTradeMonPositions[TRADE_PARTNER] % PARTY_SIZE);
        sTradeAnim->linkData[0] = LINKCMD_READY_FINISH_TRADE;
        sTradeAnim->scheduleLinkTransfer = 1;
        SetMainCallback2(CB2_WaitTradeComplete);
    }
    HandleLinkDataSend();
    HandleLinkDataReceive();
    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void CB2_WaitTradeComplete(void)
{
    u8 mpId = TradeGetMultiplayerId();
    HandleLinkDataReceive();
    if (mpId == 0
        && sTradeAnim->playerFinishStatus == STATUS_READY
        && sTradeAnim->partnerFinishStatus == STATUS_READY)
    {
        sTradeAnim->linkData[0] = LINKCMD_CONFIRM_FINISH_TRADE;
        SendBlock(BitmaskAllOtherLinkPlayers(), sTradeAnim->linkData, sizeof(sTradeAnim->linkData));
        sTradeAnim->playerFinishStatus = STATUS_CANCEL;
        sTradeAnim->partnerFinishStatus = STATUS_CANCEL;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void CB2_SaveAndEndTrade(void)
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
        sTradeAnim->timer = 0;
        break;
    case 100:
        if (++sTradeAnim->timer > 180)
        {
            gMain.state = 101;
            sTradeAnim->timer = 0;
        }
        if (IsLinkTaskFinished())
            gMain.state = 2;
        break;
    case 101:
        if (IsLinkTaskFinished())
            gMain.state = 2;
        break;
    case 2:
        gMain.state = 50;
        StringExpandPlaceholders(gStringVar4, gText_SavingDontTurnOffThePower2);
        DrawTextOnTradeWindow(0, gStringVar4, 0);
        break;
    case 50:
        if (InUnionRoom())
        {
            SetQuestLogEvent(QL_EVENT_LINK_TRADED_UNION, (void *)&sTradeAnim->questLogData);
        }
        else
        {
            SetQuestLogEvent(QL_EVENT_LINK_TRADED, (void *)&sTradeAnim->questLogData);
            IncrementGameStat(GAME_STAT_POKEMON_TRADES);
        }
        if (gWirelessCommType)
            MysteryGift_TryIncrementStat(CARD_STAT_NUM_TRADES, gLinkPlayers[GetMultiplayerId() ^ 1].trainerId);
        SetContinueGameWarpStatusToDynamicWarp();
        LinkFullSave_Init();
        gMain.state++;
        sTradeAnim->timer = 0;
        break;
    case 51:
        if (++sTradeAnim->timer == 5)
            gMain.state++;
        break;
    case 52:
        if (LinkFullSave_WriteSector())
        {
            ClearContinueGameWarpStatus2();
            gMain.state = 4;
        }
        else
        {
            // Save isn't finished, delay again
            sTradeAnim->timer = 0;
            gMain.state = 51;
        }
        break;
    case 4:
        LinkFullSave_ReplaceLastSector();
        gMain.state = 40;
        sTradeAnim->timer = 0;
        break;
    case 40:
        if (++sTradeAnim->timer > 50)
        {
            if (GetMultiplayerId() == 0)
                sTradeAnim->timer = Random() % 30;
            else
                sTradeAnim->timer = 0;
            gMain.state = 41;
        }
        break;
    case 41:
        if (sTradeAnim->timer == 0)
        {
            SetLinkStandbyCallback();
            gMain.state = 42;
        }
        else
        {
            sTradeAnim->timer--;
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
        if (++sTradeAnim->timer > 60)
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
                SetLinkStandbyCallback();
            else
                SetCloseLinkCallback();
            gMain.state++;
        }
        break;
    case 9:
        if (gWirelessCommType && gMain.savedCallback == CB2_StartCreateTradeMenu)
        {
            if (IsLinkRfuTaskFinished())
            {
                gSoftResetDisabled = FALSE;
                SetMainCallback2(CB2_FreeTradeAnim);
            }
        }
        else if (!gReceivedRemoteLinkPlayers)
        {
            gSoftResetDisabled = FALSE;
            SetMainCallback2(CB2_FreeTradeAnim);
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

static void CB2_FreeTradeAnim(void)
{
    if (!gPaletteFade.active)
    {
        FreeAllWindowBuffers();
        Free(GetBgTilemapBuffer(3));
        Free(GetBgTilemapBuffer(1));
        Free(GetBgTilemapBuffer(0));
        FreeMonSpritesGfx();
        FREE_AND_SET_NULL(sTradeAnim);
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
    CreateTask(Task_InGameTrade, 10);
    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
    HelpSystem_Disable();
}

static void Task_InGameTrade(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(CB2_InitInGameTrade);
        gFieldCallback = FieldCB_ContinueScriptHandleMusic;
        DestroyTask(taskId);
    }
}

static void CheckPartnersMonForRibbons(void)
{
    u8 numRibbons = 0;
    u8 i;
    for (i = 0; i < (MON_DATA_UNUSED_RIBBONS - MON_DATA_CHAMPION_RIBBON); i++)
        numRibbons += GetMonData(&gEnemyParty[gSelectedTradeMonPositions[TRADE_PARTNER] % PARTY_SIZE], MON_DATA_CHAMPION_RIBBON + i);

    if (numRibbons != 0)
        FlagSet(FLAG_SYS_RIBBON_GET);
}

void LoadTradeAnimGfx(void)
{
    TradeAnimInit_LoadGfx();
}

void DrawTextOnTradeWindow(u8 windowId, const u8 *str, s8 speed)
{
    FillWindowPixelBuffer(windowId, PIXEL_FILL(15));
    sTradeAnim->textColor[0] = 15;
    sTradeAnim->textColor[1] = 1;
    sTradeAnim->textColor[2] = 6;
    AddTextPrinterParameterized4(windowId, FONT_NORMAL, 0, 2, 0, 2, sTradeAnim->textColor, speed, str);
    CopyWindowToVram(windowId, COPYWIN_FULL);
}

static void Task_AnimateWirelessSignal(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 paletteIdx = 16 * sWirelessSignalAnimParams[tIdx][0];

    if (!tSignalComingBack)
    {
        if (paletteIdx == 0x100)
            LoadPalette(sWirelessSignalAnimPals_Off, BG_PLTT_ID(3), PLTT_SIZE_4BPP);
        else
            LoadPalette(&sWirelessSignalAnimPals_Outbound[paletteIdx], BG_PLTT_ID(3), PLTT_SIZE_4BPP);
    }
    else
    {
        if (paletteIdx == 0x100)
            LoadPalette(sWirelessSignalAnimPals_Off, BG_PLTT_ID(3), PLTT_SIZE_4BPP);
        else
            LoadPalette(&sWirelessSignalAnimPals_Inbound[paletteIdx], BG_PLTT_ID(3), PLTT_SIZE_4BPP);
    }

    if (sWirelessSignalAnimParams[tIdx][0] == 0 && tCounter == 0)
        PlaySE(SE_M_HEAL_BELL);

    if (tCounter == sWirelessSignalAnimParams[tIdx][1])
    {
        tIdx++;
        tCounter = 0;
        if (sWirelessSignalAnimParams[tIdx][1] == 0xFF)
            DestroyTask(taskId);
    }
    else
    {
        tCounter++;
    }
}

#undef tIdx
#undef tCounter
#undef tSignalComingBack

static void Task_OpenCenterWhiteColumn(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (data[0] == 0)
    {
        sTradeAnim->win0left = sTradeAnim->win0right = DISPLAY_WIDTH / 2;
        sTradeAnim->win0top = 0;
        sTradeAnim->win0bottom = DISPLAY_HEIGHT;
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_OBJ);
        SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG0 |
                                    WININ_WIN0_BG1 |
                                    WININ_WIN0_OBJ);
    }

    SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE2(sTradeAnim->win0left, sTradeAnim->win0right));
    SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE2(sTradeAnim->win0top, sTradeAnim->win0bottom));

    data[0]++;
    sTradeAnim->win0left -= 5;
    sTradeAnim->win0right += 5;

    if (sTradeAnim->win0left < 80)
        DestroyTask(taskId);
}

static void Task_CloseCenterWhiteColumn(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (data[0] == 0)
    {
        sTradeAnim->win0left = 80;
        sTradeAnim->win0right = DISPLAY_WIDTH - 80;
        SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_OBJ);
        SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG0 |
                                    WININ_WIN0_BG1 |
                                    WININ_WIN0_OBJ);
    }

    SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE2(sTradeAnim->win0left, sTradeAnim->win0right));
    SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE2(sTradeAnim->win0top, sTradeAnim->win0bottom));

    if (sTradeAnim->win0left != DISPLAY_WIDTH / 2)
    {
        data[0]++;
        sTradeAnim->win0left += 5;
        sTradeAnim->win0right -= 5;

        if (sTradeAnim->win0left > DISPLAY_WIDTH / 2 - 5)
            BlendPalettes(0x8, 0, RGB_WHITEALPHA);
    }
    else
    {
        ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        DestroyTask(taskId);
    }
}
