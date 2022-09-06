#include "global.h"
#include "gflib.h"
#include "m4a.h"
#include "task.h"
#include "scanline_effect.h"
#include "libgcnmultiboot.h"
#include "new_menu_helpers.h"
#include "link.h"
#include "menu.h"
#include "random.h"
#include "save.h"
#include "new_game.h"
#include "title_screen.h"
#include "decompress.h"
#include "util.h"
#include "trig.h"
#include "constants/songs.h"
#include "constants/sound.h"

/*
    The intro is grouped into the following scenes
    - Copyright screen
    - GF Logo
    Scene 1. Brief close up shot of grass
    Scene 2. A panning wide shot followed by a close-up of Gengar/Nidorino
    Scene 3. A fight between Gengar/Nidorino

    After this it progresses to the title screen
*/

enum {
    GFXTAG_STAR,
    GFXTAG_SPARKLES_SMALL,
    GFXTAG_SPARKLES_BIG,
    GFXTAG_GF_LOGO,
    GFXTAG_PRESENTS,
    GFXTAG_SCENE3_NIDORINO,
    GFXTAG_SCENE2_GENGAR,
    GFXTAG_SCENE2_NIDORINO,
    GFXTAG_SCENE3_GRASS,
    GFXTAG_SCENE3_GENGAR,
    GFXTAG_SCENE3_SWIPE,
    GFXTAG_SCENE3_RECOIL_DUST,
};

enum {
    PALTAG_STAR,
    PALTAG_SPARKLES,
    PALTAG_UNUSED_2,
    PALTAG_GF,
    PALTAG_UNUSED_4,
    PALTAG_UNUSED_5,
    PALTAG_GENGAR,
    PALTAG_NIDORINO,
    PALTAG_SCENE3_GRASS,
    PALTAG_UNUSED_9,
    PALTAG_SCENE3_SWIPE,
    PALTAG_SCENE3_RECOIL_DUST,
};

// Background IDs for Game Freak logo scene
enum {
    BG_GF_TEXT_LOGO = 2,
    BG_GF_BACKGROUND   
};


// Background IDs for Scene 1
enum {
    BG_SCENE1_GRASS,
    BG_SCENE1_BACKGROUND,
    BG_SCENE1_UNUSED1,
    BG_SCENE1_UNUSED2
};

// Background IDs for Scene 2
enum {
    BG_SCENE2_PLANTS,
    BG_SCENE2_NIDORINO,
    BG_SCENE2_GENGAR,
    BG_SCENE2_BACKGROUND // Bg for wide shot on upper half, close up on lower half
};

// Background IDs for Scene 3
enum {
    BG_SCENE3_GENGAR,
    BG_SCENE3_BACKGROUND,
    BG_SCENE3_UNUSED1,
    BG_SCENE3_UNUSED2
};

#define NUM_GENGAR_BACK_SPRITES 4

#define COLOSSEUM_GAME_CODE 0x65366347 // "Gc6e" in ASCII

struct IntroSequenceData;

typedef void (*IntroCallback)(struct IntroSequenceData *);

struct IntroSequenceData
{
    IntroCallback callback;
    u8 state;
    u8 taskId;
    bool8 gengarAttackLanded;
    u16 data[6];
    struct Sprite *gameFreakLogoArtSprite;
    struct Sprite *nidorinoAnimSprite;
    struct Sprite *gengarStaticSprite;
    struct Sprite *nidorinoStaticSprite;
    struct Sprite *grassSprite;
    struct Sprite *gengarBackSprites[NUM_GENGAR_BACK_SPRITES];
    u8 unused0[4];
    u8 gameFreakLogoGfx[0x400];
    u8 gameFreakTextGfx[0x400];
    u8 unused1[0x2080];
}; // size: 0x28BC

static EWRAM_DATA struct GcmbStruct sGcmb = {0};
static EWRAM_DATA u16 gUnknown_203AB00 = 0;
static EWRAM_DATA u16 gUnknown_203AB02 = 0;
static EWRAM_DATA u16 gUnknown_203AB04 = 0;
static EWRAM_DATA u16 gUnknown_203AB06 = 0;
static EWRAM_DATA u16 gUnknown_203AB08 = 0;
static EWRAM_DATA u16 gUnknown_203AB0A = 0;
static EWRAM_DATA u16 gUnknown_203AB0C = 0;
static EWRAM_DATA u16 sLargeStarXSpeed = 0;
static EWRAM_DATA u16 sLargeStarYSpeed = 0;
static EWRAM_DATA u16 sTrailingSparklesXmodMask = 0;
static EWRAM_DATA u16 sUnusedVarRelatedToGameFreakStars = 0;
static EWRAM_DATA u16 sTrailingSparklesSpawnRate = 0;
static EWRAM_DATA u16 sTrailingSparklesFlickerStartTime = 0;
static EWRAM_DATA u16 sTrailingSparklesDestroySpriteTime = 0;
static EWRAM_DATA u16 sTrailingSparklesGravityShift = 0;
static EWRAM_DATA u16 sTrailingSparklesXspeed = 0;
static EWRAM_DATA u16 sTrailingSparklesYspeed = 0;
static EWRAM_DATA u16 sTrailingSparklesXprecision = 0;
static EWRAM_DATA u16 sTrailingSparklesYprecision = 0;

static void CB2_SetUpIntro(void);
static void CB2_Intro(void);
static void VBlankCB_Intro(void);
static void Intro_ResetGpuRegs(void);
static void StartIntroSequence(void);
static void Task_CallIntroCallback(u8 taskId);
static void SetIntroCB(struct IntroSequenceData * ptr, IntroCallback cb);
static void IntroCB_Init(struct IntroSequenceData * ptr);
static void IntroCB_OpenWin1ToTheaterDimensions(struct IntroSequenceData * ptr);
static void IntroCB_GameFreakStar(struct IntroSequenceData * ptr);
static void IntroCB_GameFreakScene_RevealGameFreakText(struct IntroSequenceData * ptr);
static void IntroCB_GameFreakScene_CreateGameFreakLogo(struct IntroSequenceData * ptr);
static void IntroCB_FightScene(struct IntroSequenceData * ptr);
static void Task_FightScene1_GrassyFieldAnim(u8 taskId);
static void FightScene1_SignalEndGrassyFieldAnim(void);
static void Task_FightScene1_ZoomEffect(u8 taskId);
static void IntroCB_FightScene2(struct IntroSequenceData * ptr);
static void Task_FightScene2_CameraHorizPanEffect(u8 taskId);
static void Task_FightScene2_CameraVertPanEffect(u8 taskId);
static void CreateMonStaticSprites(struct IntroSequenceData * ptr);
static void DestroyStaticMonSprites(struct IntroSequenceData * ptr);
static void IntroCB_FightScene3(struct IntroSequenceData * ptr);
static void FightScene3_StartBg1Scroll(void);
static void Task_FightScene3_ForestBgScroll(u8 taskId);
static void CreateGrassSprite(struct IntroSequenceData * ptr);
static void SpriteCB_Grass(struct Sprite *sprite);
static void IntroCB_FightScene4(struct IntroSequenceData * ptr);
static void CreateGengarBackSprite(struct IntroSequenceData * ptr);
static void FightScene4_StartNidorinoAffineAnim(struct IntroSequenceData * ptr);
static void FightScene4_StartGengarAffineAnim(struct IntroSequenceData * ptr);
static void IntroCB_CleanUp(struct IntroSequenceData * ptr);
static void GameFreakScene_LoadGfxCreateStar(void);
static void GameFreakScene_StartTrailingSparkleSpawner(void);
static void Task_GameFreakScene_TrailingSparkleSpawner(u8 taskId);
static void GameFreakScene_StartRevealGameFreakTextSparklesSpawner(void);
static void Task_RevealGameFreakTextSparklesSpawner(u8 taskId);
static struct Sprite *CreateGameFreakLogoArtSprite(void);
static void FightScene4_StartGengarAttack(struct IntroSequenceData * ptr);
static void Task_FightScene4_GengarAttack(u8 taskId);
static void FightScene4_CreateGengarSwipeSprites(void);
static void SpriteCB_GengarSwipe(struct Sprite *sprite);
static void Task_FightScene3_Bg0Scroll(u8 taskId);
static void SpriteCB_LargeStar(struct Sprite *sprite);
static void SpriteCB_SparklesSmall(struct Sprite *sprite);
static void SpriteCB_SparklesSmall2(struct Sprite *sprite);
static void SpriteCB_RevealGameFreakTextSparkles(struct Sprite *sprite);
static void CreateNidorinoAnimSprite(struct IntroSequenceData * ptr);
static void StartNidorinoAnimSpriteSlideIn(struct Sprite *sprite, s16 x0, s16 x1, u16 speed);
static void SpriteCB_NidorinoAnimSpriteSlideIn(struct Sprite *sprite);
static bool32 IsNidorinoAnimSpriteSlideInRunning(struct IntroSequenceData * ptr);
static void FightScene4_NidorinoRearsUp(struct IntroSequenceData * ptr);
static void SpriteCB_NidorinoRearsUp(struct Sprite *sprite);
static void FightScene4_StartNidorinoRecoilAnim(struct IntroSequenceData * ptr);
static void SpriteCB_NidorinoRecoil(struct Sprite *sprite);
static bool8 FightScene4_NidorinoAnimIsRunning(struct IntroSequenceData * ptr);
static void CreateNidorinoRecoilDustSprites(s16 a1, s16 a2, s16 a3);
static void SpriteCB_NidorinoRecoilDust(struct Sprite *sprite);
static void StartSpriteHopToPosAnim(struct Sprite *sprite, u16 a1, s16 a2, u8 a3);
static void SpriteCB_HopToPos(struct Sprite *sprite);
static void StartNidorinoAnim_LaunchSelfAtGengarAnim(struct IntroSequenceData * ptr);
static void SpriteCB_NidorinoAnim_LaunchSelfAtGengar(struct Sprite *sprite);
static void LoadFightSceneSpriteTilesAndPals(void);
static void CreateGameFreakPresentsText(void);

extern const u32 gMultiBootProgram_PokemonColosseum_Start[];

static const u16 sCopyright_Pal[] = INCBIN_U16("graphics/intro/copyright.gbapal");
static const u8 sCopyright_Gfx[] = INCBIN_U8("graphics/intro/copyright.4bpp.lz");
static const u8 sCopyright_Map[] = INCBIN_U8("graphics/intro/copyright.bin.lz");

// Game Freak
static const u16 sGameFreakBg_Pal[]   = INCBIN_U16("graphics/intro/game_freak/bg.gbapal");
static const u8 sGameFreakBg_Gfx[]    = INCBIN_U8( "graphics/intro/game_freak/bg.4bpp.lz");
static const u8 sGameFreakBg_Map[]    = INCBIN_U8( "graphics/intro/game_freak/bg.bin.lz");
static const u16 sGameFreakLogo_Pal[] = INCBIN_U16("graphics/intro/game_freak/logo.gbapal");
static const u8 sGameFreakText_Gfx[]  = INCBIN_U8( "graphics/intro/game_freak/game_freak.4bpp.lz");
static const u32 sGameFreakLogo_Gfx[] = INCBIN_U32("graphics/intro/game_freak/logo.4bpp.lz");
static const u16 sStar_Pal[]          = INCBIN_U16("graphics/intro/game_freak/star.gbapal");
static const u32 sStar_Gfx[]          = INCBIN_U32("graphics/intro/game_freak/star.4bpp.lz");
static const u16 sSparkles_Pal[]      = INCBIN_U16("graphics/intro/game_freak/sparkles.gbapal");
static const u32 sSparklesSmall_Gfx[] = INCBIN_U32("graphics/intro/game_freak/sparkles_small.4bpp.lz");
static const u32 sSparklesBig_Gfx[]   = INCBIN_U32("graphics/intro/game_freak/sparkles_big.4bpp.lz");
static const u32 sPresents_Gfx[]      = INCBIN_U32("graphics/intro/game_freak/presents.4bpp.lz");

// Scene 1 (Grass close up)
static const u16 sScene1_Grass_Pal[] = INCBIN_U16("graphics/intro/scene_1/grass.gbapal");
static const u8 sScene1_Grass_Gfx[]  = INCBIN_U8( "graphics/intro/scene_1/grass.4bpp.lz");
static const u8 sScene1_Grass_Map[]  = INCBIN_U8( "graphics/intro/scene_1/grass.bin.lz");
static const u16 sScene1_Bg_Pal[]    = INCBIN_U16("graphics/intro/scene_1/bg.gbapal");
static const u8 sScene1_Bg_Gfx[]     = INCBIN_U8( "graphics/intro/scene_1/bg.4bpp.lz");
static const u8 sScene1_Bg_Map[]     = INCBIN_U8( "graphics/intro/scene_1/bg.bin.lz");

// Scenes 2 and 3 (Gengar and Nidorino)
static const u16 sScene2_Bg_Pal[]            = INCBIN_U16("graphics/intro/scene_2/bg.gbapal");
static const u8 sScene2_Bg_Gfx[]             = INCBIN_U8( "graphics/intro/scene_2/bg.4bpp.lz");
static const u8 sScene2_Bg_Map[]             = INCBIN_U8( "graphics/intro/scene_2/bg.bin.lz");
static const u16 sScene2_Plants_Pal[]        = INCBIN_U16("graphics/intro/scene_2/plants.gbapal"); // Unused
static const u8 sScene2_Plants_Gfx[]         = INCBIN_U8( "graphics/intro/scene_2/plants.4bpp.lz");
static const u8 sScene2_Plants_Map[]         = INCBIN_U8( "graphics/intro/scene_2/plants.bin.lz");
static const u16 sGengar_Pal[]               = INCBIN_U16("graphics/intro/gengar.gbapal"); // Used by multiple scenes
static const u8 sScene2_GengarClose_Gfx[]    = INCBIN_U8( "graphics/intro/scene_2/gengar_close.4bpp.lz");
static const u8 sScene2_GengarClose_Map[]    = INCBIN_U8( "graphics/intro/scene_2/gengar_close.bin.lz");
static const u16 sScene2_NidorinoClose_Pal[] = INCBIN_U16("graphics/intro/scene_2/nidorino_close.gbapal");
static const u8 sScene2_NidorinoClose_Gfx[]  = INCBIN_U8( "graphics/intro/scene_2/nidorino_close.4bpp.lz");
static const u8 sScene2_NidorinoClose_Map[]  = INCBIN_U8( "graphics/intro/scene_2/nidorino_close.bin.lz");
static const u16 sScene3_Bg_Pal[]            = INCBIN_U16("graphics/intro/scene_3/bg.gbapal");
static const u8 sScene3_Bg_Gfx[]             = INCBIN_U8( "graphics/intro/scene_3/bg.4bpp.lz"); // give -width 16
static const u8 sScene3_Bg_Map[]             = INCBIN_U8( "graphics/intro/scene_3/bg.bin.lz");
static const u8 sScene3_GengarAnim_Gfx[]     = INCBIN_U8( "graphics/intro/scene_3/gengar_anim.4bpp.lz");
static const u8 sScene3_GengarAnim_Map[]     = INCBIN_U8( "graphics/intro/scene_3/gengar_anim.bin.lz");
static const u32 sScene2_Gengar_Gfx[]        = INCBIN_U32("graphics/intro/scene_2/gengar.4bpp.lz");
static const u16 sNidorino_Pal[]             = INCBIN_U16("graphics/intro/nidorino.gbapal"); // Used by multiple scenes
static const u32 sScene2_Nidorino_Gfx[]      = INCBIN_U32("graphics/intro/scene_2/nidorino.4bpp.lz");
static const u16 sScene3_Grass_Pal[]         = INCBIN_U16("graphics/intro/scene_3/grass.gbapal");
static const u32 sScene3_Grass_Gfx[]         = INCBIN_U32("graphics/intro/scene_3/grass.4bpp.lz");
static const u32 sScene3_GengarStatic_Gfx[]  = INCBIN_U32("graphics/intro/scene_3/gengar_static.4bpp.lz");
static const u32 sScene3_Nidorino_Gfx[]      = INCBIN_U32("graphics/intro/scene_3/nidorino.4bpp.lz");
static const u16 sScene3_Swipe_Pal[]         = INCBIN_U16("graphics/intro/scene_3/swipe.gbapal");
static const u16 sScene3_RecoilDust_Pal[]    = INCBIN_U16("graphics/intro/scene_3/recoil_dust.gbapal");
static const u32 sScene3_Swipe_Gfx[]         = INCBIN_U32("graphics/intro/scene_3/swipe.4bpp.lz");
static const u32 sScene3_RecoilDust_Gfx[]    = INCBIN_U32("graphics/intro/scene_3/recoil_dust.4bpp.lz");

static const struct BgTemplate sBgTemplates_GameFreakScene[] = {
    {
        .bg = BG_GF_BACKGROUND,
        .charBaseIndex = 3,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x000
    }, {
        .bg = BG_GF_TEXT_LOGO,
        .charBaseIndex = 3,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x010
    }
};

static const struct BgTemplate sBgTemplates_Scene1[] = {
    {
        .bg = BG_SCENE1_GRASS,
        .charBaseIndex = 0,
        .mapBaseIndex = 28,
        .screenSize = 2,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }, {
        .bg = BG_SCENE1_BACKGROUND,
        .charBaseIndex = 1,
        .mapBaseIndex = 30,
        .screenSize = 2,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }
};

static const struct BgTemplate sBgTemplates_Scene2[] = {
    {
        .bg = BG_SCENE2_BACKGROUND,
        .charBaseIndex = 1,
        .mapBaseIndex = 30,
        .screenSize = 2,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x000
    }, {
        .bg = BG_SCENE2_PLANTS,
        .charBaseIndex = 0,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }, {
        .bg = BG_SCENE2_GENGAR,
        .charBaseIndex = 3,
        .mapBaseIndex = 27,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x000
    }, {
        .bg = BG_SCENE2_NIDORINO,
        .charBaseIndex = 2,
        .mapBaseIndex = 28,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x000
    }
};

static const struct BgTemplate sBgTemplates_Scene3[] = {
	{
	    .bg = BG_SCENE3_BACKGROUND,
	    .charBaseIndex = 0,
	    .mapBaseIndex = 29,
	    .screenSize = 0,
	    .paletteMode = 0,
	    .priority = 1,
	    .baseTile = 0x000
    }, {
	    .bg = BG_SCENE3_GENGAR,
	    .charBaseIndex = 1,
	    .mapBaseIndex = 30,
	    .screenSize = 2,
	    .paletteMode = 0,
	    .priority = 0,
	    .baseTile = 0x000
	}
};

static const struct WindowTemplate sWindowTemplate_GameFreakTextLogo[] = {
	{
	    .bg = BG_GF_TEXT_LOGO,
	    .tilemapLeft = 6,
	    .tilemapTop = 4,
	    .width = 18,
	    .height = 9,
	    .paletteNum = 0xD,
	    .baseBlock = 0x000
    }, DUMMY_WIN_TEMPLATE
};

static const u8 sGengarBackSpritePos2UpdateMods[NUM_GENGAR_BACK_SPRITES][2] = {
	{0x3f, 0x3f},
	{0x00, 0x3f},
	{0x3f, 0x00},
	{0x00, 0x00}
};

static const struct CompressedSpriteSheet sSpriteSheets_GameFreakScene[] = {
    {sStar_Gfx,          0x80,  GFXTAG_STAR},
    {sSparklesSmall_Gfx, 0x80,  GFXTAG_SPARKLES_SMALL},
    {sSparklesBig_Gfx,   0x800, GFXTAG_SPARKLES_BIG},
    {sGameFreakLogo_Gfx, 0x400, GFXTAG_GF_LOGO},
    {sPresents_Gfx,      0x100, GFXTAG_PRESENTS}
};

static const struct SpritePalette sSpritePalettes_GameFreakScene[] = {
	{sStar_Pal,          PALTAG_STAR},
	{sSparkles_Pal,      PALTAG_SPARKLES},
	{sGameFreakLogo_Pal, PALTAG_GF},
	{0}
};

static const struct Coords16 sTrailingSparkleCoords[] = {
	{ 72,  80},
	{136,  74},
	{168,  80},
	{120,  80},
	{104,  86},
	{ 88,  74},
	{184,  74},
	{ 56,  86},
	{152,  86}
};

static const struct OamData sOam_Star = {
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .matrixNum = 0,
    .size = ST_OAM_SIZE_1,
    .tileNum = 0x000,
    .priority = 2,
    .paletteNum = 0
};

static const struct OamData sOam_SparklesSmall = {
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .matrixNum = 0,
    .size = ST_OAM_SIZE_0,
    .tileNum = 0x000,
    .priority = 2,
    .paletteNum = 0
};

static const union AnimCmd sAnim_SparklesSmall_0[] = {
	ANIMCMD_FRAME(0, 4),
	ANIMCMD_FRAME(1, 4),
	ANIMCMD_FRAME(2, 4),
	ANIMCMD_FRAME(3, 4),
	ANIMCMD_JUMP(0)
};

static const union AnimCmd sAnim_SparklesSmall_1[] = {
	ANIMCMD_FRAME(0, 4),
	ANIMCMD_FRAME(1, 4),
	ANIMCMD_FRAME(2, 4),
	ANIMCMD_FRAME(3, 4),
	ANIMCMD_END
};

static const union AnimCmd *const sAnims_SparklesSmall[] = {
	sAnim_SparklesSmall_0,
	sAnim_SparklesSmall_1
};

static const struct SpriteTemplate sSpriteTemplate_Star = {
    .tileTag = GFXTAG_STAR,
    .paletteTag = PALTAG_STAR,
    .oam = &sOam_Star,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_LargeStar
};

static const struct SpriteTemplate sSpriteTemplate_SparklesSmall = {
    .tileTag = GFXTAG_SPARKLES_SMALL,
    .paletteTag = PALTAG_SPARKLES,
    .oam = &sOam_SparklesSmall,
    .anims = sAnims_SparklesSmall,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_SparklesSmall
};

static const struct OamData sOam_SparklesBig = {
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .matrixNum = 0,
    .size = ST_OAM_SIZE_2,
    .tileNum = 0x000,
    .priority = 2,
    .paletteNum = 0
};

static const union AnimCmd sAnim_SparklesBig[] = {
	ANIMCMD_FRAME(0, 8),
	ANIMCMD_FRAME(16, 8),
	ANIMCMD_FRAME(32, 8),
	ANIMCMD_FRAME(48, 8),
	ANIMCMD_END
};

static const union AnimCmd *const sAnims_SparklesBig[] = {
	sAnim_SparklesBig
};

static const struct SpriteTemplate sSpriteTemplate_SparklesBig = {
    .tileTag = GFXTAG_SPARKLES_BIG,
    .paletteTag = PALTAG_SPARKLES,
    .oam = &sOam_SparklesBig,
    .anims = sAnims_SparklesBig,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_RevealGameFreakTextSparkles
};

static const struct OamData sOam_GameFreakLogo = {
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_BLEND,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_V_RECTANGLE,
    .matrixNum = 0,
    .size = ST_OAM_SIZE_3,
    .tileNum = 0x000,
    .priority = 3,
    .paletteNum = 0
};

static const struct SpriteTemplate sSpriteTemplate_GameFreakLogoArt = {
    .tileTag = GFXTAG_GF_LOGO,
    .paletteTag = PALTAG_GF,
    .oam = &sOam_GameFreakLogo,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOam_PresentsText = {
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_BLEND,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_H_RECTANGLE,
    .matrixNum = 0,
    .size = ST_OAM_SIZE_1,
    .tileNum = 0x000,
    .priority = 3,
    .paletteNum = 0
};

static const struct SpriteTemplate sSpriteTemplate_PresentsText = {
    .tileTag = GFXTAG_PRESENTS,
    .paletteTag = PALTAG_GF,
    .oam = &sOam_PresentsText,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOam_Scene3_Nidorino = {
    .affineMode = ST_OAM_AFFINE_DOUBLE,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .matrixNum = 0,
    .size = ST_OAM_SIZE_3,
    .tileNum = 0x000,
    .priority = 1,
    .paletteNum = 0
};

static const union AnimCmd sAnim_Scene3_Nidorino_0[] = {
	ANIMCMD_FRAME(0, 1),
	ANIMCMD_END
};

static const union AnimCmd sAnim_Scene3_Nidorino_1[] = {
	ANIMCMD_FRAME(64, 1),
	ANIMCMD_END
};

static const union AnimCmd sAnim_Scene3_Nidorino_2[] = {
	ANIMCMD_FRAME(128, 1),
	ANIMCMD_END
};

static const union AnimCmd sAnim_Scene3_Nidorino_3[] = {
	ANIMCMD_FRAME(192, 1),
	ANIMCMD_END
};

static const union AnimCmd sAnim_Scene3_Nidorino_4[] = {
	ANIMCMD_FRAME(256, 1),
	ANIMCMD_END
};

static const union AnimCmd *const sAnims_Scene3_Nidorino[] = {
	sAnim_Scene3_Nidorino_0,
	sAnim_Scene3_Nidorino_1,
	sAnim_Scene3_Nidorino_2,
	sAnim_Scene3_Nidorino_3,
	sAnim_Scene3_Nidorino_4
};

static const union AffineAnimCmd sAffineAnim_Scene3_Mons_0[] = {
	AFFINEANIMCMD_FRAME(256, 256, 0, 0),
	AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_Scene3_Mons_1[] = {
	AFFINEANIMCMD_FRAME(256, 256, 0, 0),
	AFFINEANIMCMD_FRAME(32, 32, 0, 8),
	AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const sAffineAnims_Scene3_Mons[] = {
	sAffineAnim_Scene3_Mons_0,
	sAffineAnim_Scene3_Mons_1
};

static const struct SpriteTemplate sSpriteTemplate_Scene3_Nidorino = {
    .tileTag = GFXTAG_SCENE3_NIDORINO,
    .paletteTag = PALTAG_NIDORINO,
    .oam = &sOam_Scene3_Nidorino,
    .anims = sAnims_Scene3_Nidorino,
    .images = NULL,
    .affineAnims = sAffineAnims_Scene3_Mons,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOam_Scene2_Mons = {
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .matrixNum = 0,
    .size = ST_OAM_SIZE_3,
    .tileNum = 0x000,
    .priority = 1,
    .paletteNum = 0
};

static const struct SpriteTemplate sSpriteTemplate_Scene2_Nidorino = {
    .tileTag = GFXTAG_SCENE2_NIDORINO,
    .paletteTag = PALTAG_NIDORINO,
    .oam = &sOam_Scene2_Mons,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct SpriteTemplate sSpriteTemplate_Scene2_Gengar = {
    .tileTag = GFXTAG_SCENE2_GENGAR,
    .paletteTag = PALTAG_GENGAR,
    .oam = &sOam_Scene2_Mons,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOam_Grass = {
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_H_RECTANGLE,
    .matrixNum = 0,
    .size = ST_OAM_SIZE_3,
    .tileNum = 0x000,
    .priority = 0,
    .paletteNum = 0
};

static const union AnimCmd sAnim_Grass_0[] = {
	ANIMCMD_FRAME(0, 0),
	ANIMCMD_END
};

static const union AnimCmd sAnim_Grass_1[] = {
	ANIMCMD_FRAME(32, 4),
	ANIMCMD_FRAME(0, 4),
	ANIMCMD_END
};

static const union AnimCmd *const sAnims_Grass[] = {
	sAnim_Grass_0,
	sAnim_Grass_1
};

static const struct SpriteTemplate sSpriteTemplate_Grass = {
    .tileTag = GFXTAG_SCENE3_GRASS,
    .paletteTag = PALTAG_SCENE3_GRASS,
    .oam = &sOam_Grass,
    .anims = sAnims_Grass,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOam_Scene3_Gengar = {
    .affineMode = ST_OAM_AFFINE_DOUBLE,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .matrixNum = 0,
    .size = ST_OAM_SIZE_3,
    .tileNum = 0x000,
    .priority = 1,
    .paletteNum = 0
};

static const union AnimCmd sAnim_Scene3_Gengar_0[] = {
	ANIMCMD_FRAME(0, 0),
	ANIMCMD_END
};

static const union AnimCmd sAnim_Scene3_Gengar_1[] = {
	ANIMCMD_FRAME(64, 0),
	ANIMCMD_END
};

static const union AnimCmd sAnim_Scene3_Gengar_2[] = {
	ANIMCMD_FRAME(96, 0),
	ANIMCMD_END
};

static const union AnimCmd sAnim_Scene3_Gengar_3[] = {
	ANIMCMD_FRAME(160, 0),
	ANIMCMD_END
};

static const union AnimCmd *const sAnims_Scene3_Gengar[NUM_GENGAR_BACK_SPRITES] = {
	sAnim_Scene3_Gengar_0,
	sAnim_Scene3_Gengar_1,
	sAnim_Scene3_Gengar_2,
	sAnim_Scene3_Gengar_3
};

static const struct SpriteTemplate sSpriteTemplate_Scene3_Gengar = {
    .tileTag = GFXTAG_SCENE3_GENGAR,
    .paletteTag = PALTAG_GENGAR,
    .oam = &sOam_Scene3_Gengar,
    .anims = sAnims_Scene3_Gengar,
    .images = NULL,
    .affineAnims = sAffineAnims_Scene3_Mons,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOam_Swipe = {
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_V_RECTANGLE,
    .matrixNum = 0,
    .size = ST_OAM_SIZE_3,
    .tileNum = 0x000,
    .priority = 1,
    .paletteNum = 0
};

static const union AnimCmd sAnim_Swipe_0[] = {
	ANIMCMD_FRAME(0, 8),
	ANIMCMD_FRAME(32, 4),
	ANIMCMD_END
};

static const union AnimCmd sAnim_Swipe_1[] = {
	ANIMCMD_FRAME(64, 8),
	ANIMCMD_FRAME(72, 4),
	ANIMCMD_END
};

static const union AnimCmd *const sAnims_Swipe[] = {
	sAnim_Swipe_0,
	sAnim_Swipe_1
};

static const struct SpriteTemplate sSpriteTemplate_GengarSwipe = {
    .tileTag = GFXTAG_SCENE3_SWIPE,
    .paletteTag = PALTAG_SCENE3_SWIPE,
    .oam = &sOam_Swipe,
    .anims = sAnims_Swipe,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_GengarSwipe
};

static const struct OamData sOam_RecoilDust = {
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .matrixNum = 0,
    .size = ST_OAM_SIZE_1,
    .tileNum = 0x000,
    .priority = 1,
    .paletteNum = 0
};

static const union AnimCmd sAnim_RecoilDust[] = {
	ANIMCMD_FRAME(0, 10),
	ANIMCMD_FRAME(4, 10),
	ANIMCMD_FRAME(8, 10),
	ANIMCMD_FRAME(12, 8),
	ANIMCMD_END
};

static const union AnimCmd *const sAnims_RecoilDust[] = {
	sAnim_RecoilDust
};

static const struct SpriteTemplate sSpriteTemplate_NidorinoRecoilDust = {
    .tileTag = GFXTAG_SCENE3_RECOIL_DUST,
    .paletteTag = PALTAG_SCENE3_RECOIL_DUST,
    .oam = &sOam_RecoilDust,
    .anims = sAnims_RecoilDust,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_NidorinoRecoilDust
};

static const struct CompressedSpriteSheet sFightSceneSpriteSheets[] = {
	{sScene2_Gengar_Gfx,       0x800,  GFXTAG_SCENE2_GENGAR},
	{sScene2_Nidorino_Gfx,     0x800,  GFXTAG_SCENE2_NIDORINO},
	{sScene3_Nidorino_Gfx,     0x2800, GFXTAG_SCENE3_NIDORINO},
	{sScene3_Grass_Gfx,        0x800,  GFXTAG_SCENE3_GRASS},
	{sScene3_GengarStatic_Gfx, 0x1800, GFXTAG_SCENE3_GENGAR},
	{sScene3_Swipe_Gfx,        0xA00,  GFXTAG_SCENE3_SWIPE},
	{sScene3_RecoilDust_Gfx,   0x200,  GFXTAG_SCENE3_RECOIL_DUST}
};

// POTENTIAL UB
// This array is passed to LoadSpritePalettes in LoadFightSceneSpriteTilesAndPals.
// LoadSpritePalettes uses a {0} entry to signal end of array.
// Because such an entry is absent in this case, the function
// continues reading into the next .rodata section.
static const struct SpritePalette sFightSceneSpritePalettes[] = {
	{sGengar_Pal, PALTAG_GENGAR},
	{sNidorino_Pal, PALTAG_NIDORINO},
	{sScene3_Grass_Pal, PALTAG_SCENE3_GRASS},
	{sScene3_Swipe_Pal, PALTAG_SCENE3_SWIPE},
	{sScene3_RecoilDust_Pal, PALTAG_SCENE3_RECOIL_DUST},
#ifdef BUGFIX
    {0}
#endif
};

static void VBlankCB_Copyright(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void CB2_WaitFadeBeforeSetUpIntro(void)
{
    if (!UpdatePaletteFade())
        SetMainCallback2(CB2_SetUpIntro);
}

static void LoadCopyrightGraphics(u16 charBase, u16 screenBase, u16 palOffset)
{
    LZ77UnCompVram(sCopyright_Gfx, (void *)BG_VRAM + charBase);
    LZ77UnCompVram(sCopyright_Map, (void *)BG_VRAM + screenBase);
    LoadPalette(sCopyright_Pal, palOffset, 0x20);
}

static void SerialCB_CopyrightScreen(void)
{
    GameCubeMultiBoot_HandleSerialInterrupt(&sGcmb);
}

static bool8 SetUpCopyrightScreen(void)
{
    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(NULL);
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        SetGpuReg(REG_OFFSET_BLDY, 0);
        ((vu16*)PLTT)[0] = RGB_WHITE;
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        SetGpuReg(REG_OFFSET_BG0HOFS, 0);
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
        DmaFill16(3, 0, VRAM, VRAM_SIZE);
        DmaFill32(3, 0, OAM, OAM_SIZE);
        DmaFill16(3, 0, PLTT + sizeof(vu16), PLTT_SIZE - sizeof(vu16));
        ResetPaletteFade();
        LoadCopyrightGraphics(0 * BG_CHAR_SIZE, 7 * BG_SCREEN_SIZE, 0);
        ScanlineEffect_Stop();
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_WHITEALPHA);
        SetGpuReg(REG_OFFSET_BG0CNT, BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_16COLOR | BGCNT_SCREENBASE(7));
        EnableInterrupts(INTR_FLAG_VBLANK);
        SetVBlankCallback(VBlankCB_Copyright);
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON);
        SetSerialCallback(SerialCB_CopyrightScreen);
        GameCubeMultiBoot_Init(&sGcmb);
        // fallthrough
    default:
        UpdatePaletteFade();
        gMain.state++;
        GameCubeMultiBoot_Main(&sGcmb);
        break;
    case 140:
        GameCubeMultiBoot_Main(&sGcmb);
        if (sGcmb.gcmb_field_2 != 1)
        {
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
            gMain.state++;
        }
        break;
    case 141:
        if (!UpdatePaletteFade())
        {
            gMain.state++;
            if (sGcmb.gcmb_field_2 != 0)
            {
                if (sGcmb.gcmb_field_2 == 2)
                {
                    if (*(u32 *)(EWRAM_START + 0xAC) == COLOSSEUM_GAME_CODE)
                    {
                        CpuCopy16(gMultiBootProgram_PokemonColosseum_Start, (void *)EWRAM_START, 0x28000);
                        *(u32 *)(EWRAM_START + 0xAC) = COLOSSEUM_GAME_CODE;
                    }
                    GameCubeMultiBoot_ExecuteProgram(&sGcmb);
                }
            }
            else
            {
                GameCubeMultiBoot_Quit();
                SetSerialCallback(SerialCB);
            }
            return FALSE;
        }
        break;
    case 142:
        ResetSerial();
        SetMainCallback2(CB2_WaitFadeBeforeSetUpIntro);
        break;
    }
    return TRUE;
}

void CB2_InitCopyrightScreenAfterBootup(void)
{
    if (!SetUpCopyrightScreen())
    {
        ResetMenuAndMonGlobals();
        Save_ResetSaveCounters();
        LoadGameSave(SAVE_NORMAL);
        if (gSaveFileStatus == SAVE_STATUS_EMPTY || gSaveFileStatus == SAVE_STATUS_INVALID)
            Sav2_ClearSetDefault();
        SetPokemonCryStereo(gSaveBlock2Ptr->optionsSound);
    }
}

void CB2_InitCopyrightScreenAfterTitleScreen(void)
{
    SetUpCopyrightScreen();
}

static void CB2_SetUpIntro(void)
{
    switch (gMain.state)
    {
    default:
        gMain.state = 0;
        // fallthrough
    case 0:
        SetVBlankCallback(NULL);
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        InitHeap(gHeap, HEAP_SIZE);
        ResetTasks();
        ResetSpriteData();
        ResetPaletteFade();
        ResetTempTileDataBuffers();
        Intro_ResetGpuRegs();
        DmaFill16(3, 0, VRAM, VRAM_SIZE);
        DmaFill32(3, 0, OAM, OAM_SIZE);
        DmaFill16(3, 0, PLTT, PLTT_SIZE);
        FillPalette(RGB_BLACK, 0, 0x400);
        ResetBgsAndClearDma3BusyFlags(FALSE);
        InitBgsFromTemplates(0, sBgTemplates_GameFreakScene, NELEMS(sBgTemplates_GameFreakScene));
        break;
    case 1:
        LoadPalette(sGameFreakBg_Pal, 0x00, 0x20);
        DecompressAndCopyTileDataToVram(BG_GF_BACKGROUND, sGameFreakBg_Gfx, 0, 0, 0);
        DecompressAndCopyTileDataToVram(BG_GF_BACKGROUND, sGameFreakBg_Map, 0, 0, 1);
        LoadPalette(sGameFreakLogo_Pal, 0xD0, 0x20);
        break;
    case 2:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            StartIntroSequence();
            BlendPalettes(PALETTES_ALL, 16, RGB_BLACK);
            SetMainCallback2(CB2_Intro);
            SetVBlankCallback(VBlankCB_Intro);
        }
        return;
    }
    gMain.state++;
}

static void CB2_Intro(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void VBlankCB_Intro(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void Intro_ResetGpuRegs(void)
{
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY, 0);
    SetGpuReg(REG_OFFSET_BG0HOFS, 0);
    SetGpuReg(REG_OFFSET_BG0VOFS, 0);
    SetGpuReg(REG_OFFSET_BG1HOFS, 0);
    SetGpuReg(REG_OFFSET_BG1VOFS, 0);
    SetGpuReg(REG_OFFSET_BG2HOFS, 0);
    SetGpuReg(REG_OFFSET_BG2VOFS, 0);
    SetGpuReg(REG_OFFSET_BG3HOFS, 0);
    SetGpuReg(REG_OFFSET_BG3VOFS, 0);
    SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
}

static void StartIntroSequence(void)
{
    struct IntroSequenceData * ptr = Alloc(sizeof(struct IntroSequenceData));
    SetIntroCB(ptr, IntroCB_Init);
    ptr->taskId = CreateTask(Task_CallIntroCallback, 3);
    SetWordTaskArg(ptr->taskId, 0, (uintptr_t)ptr);
}

static void SetIntroCB(struct IntroSequenceData * ptr, IntroCallback cb)
{
    ptr->callback = cb;
    ptr->state = 0;
}

static void Task_CallIntroCallback(u8 taskId)
{
    struct IntroSequenceData * ptr = (void *)GetWordTaskArg(taskId, 0);
    if (JOY_NEW(A_BUTTON | START_BUTTON | SELECT_BUTTON) && ptr->callback != IntroCB_CleanUp)
        SetIntroCB(ptr, IntroCB_CleanUp);
    ptr->callback(ptr);
}

static void IntroCB_Init(struct IntroSequenceData * this)
{
    switch (this->state)
    {
    case 0:
        InitWindows(sWindowTemplate_GameFreakTextLogo);
        LZ77UnCompWram(sGameFreakText_Gfx, this->gameFreakTextGfx);
        LZ77UnCompWram(sGameFreakLogo_Gfx, this->gameFreakLogoGfx);
        FillBgTilemapBufferRect(BG_GF_TEXT_LOGO, 0x000, 0, 0, 32, 32, 0x11);
        FillWindowPixelBuffer(0, PIXEL_FILL(0));
        BlitBitmapToWindow(0, this->gameFreakTextGfx, 0, 40, 144, 16);
        PutWindowTilemap(0);
        CopyWindowToVram(0, COPYWIN_FULL);
        this->state++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetIntroCB(this, IntroCB_OpenWin1ToTheaterDimensions);
        break;
    }
}

static void IntroCB_OpenWin1ToTheaterDimensions(struct IntroSequenceData * this)
{
    switch (this->state)
    {
    case 0:
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN1_ON);
        SetGpuReg(REG_OFFSET_WININ, 0x3F00);
        SetGpuReg(REG_OFFSET_WINOUT, 0x0000);
        SetGpuReg(REG_OFFSET_WIN1H, 0x00F0);
        SetGpuReg(REG_OFFSET_WIN1V, 0x0000);
        this->data[5] = 0;
        this->state++;
        break;
    case 1:
        ShowBg(3);
        BlendPalettes(PALETTES_ALL, 0x00, RGB_BLACK);
        this->state++;
        break;
    case 2:
        this->data[5] += 8;
        if (this->data[5] >= 0x30)
            this->data[5] = 0x30;
        SetGpuReg(REG_OFFSET_WIN1V, ((0x50 - this->data[5]) << 8) | (0x50 + this->data[5]));
        if (this->data[5] == 0x30)
            SetIntroCB(this, IntroCB_GameFreakStar);
        break;
    }
}

static void IntroCB_GameFreakStar(struct IntroSequenceData * this)
{
    switch (this->state)
    {
    case 0:
        PlaySE(MUS_GAME_FREAK);
        GameFreakScene_LoadGfxCreateStar();
        this->data[5] = 0;
        this->state++;
        break;
    case 1:
        this->data[5]++;
        if (this->data[5] == 30)
        {
            GameFreakScene_StartTrailingSparkleSpawner();
            this->data[5] = 0;
            this->state++;
        }
        break;
    case 2:
        this->data[5]++;
        if (this->data[5] == 90)
            SetIntroCB(this, IntroCB_GameFreakScene_RevealGameFreakText);
        break;
    }
}

static void IntroCB_GameFreakScene_RevealGameFreakText(struct IntroSequenceData * this)
{
    switch (this->state)
    {
    case 0:
        GameFreakScene_StartRevealGameFreakTextSparklesSpawner();
        this->data[5] = 0;
        this->state++;
        break;
    case 1:
        if (++this->data[5] >= 40)
            this->state++;
        break;
    case 2:
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG2 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD);
        StartBlendTask(0, 16, 16, 0, 48, 0);
        this->state++;
        break;
    case 3:
        ShowBg(2);
        this->state++;
        break;
    case 4:
        if (!IsBlendTaskActive())
        {
            SetGpuReg(REG_OFFSET_BLDCNT, 0);
            this->data[5] = 0;
            this->state++;
        }
        break;
    case 5:
        if (++this->data[5] > 50)
            SetIntroCB(this, IntroCB_GameFreakScene_CreateGameFreakLogo);
        break;
    }
}

static void IntroCB_GameFreakScene_CreateGameFreakLogo(struct IntroSequenceData * this)
{
    switch (this->state)
    {
    case 0:
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_OBJ | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD);
        StartBlendTask(0, 16, 16, 0, 16, 0);
        this->data[0] = 0;
        this->data[1] = 16;
        this->data[5] = 0;
        this->state++;
        break;
    case 1:
        this->gameFreakLogoArtSprite = CreateGameFreakLogoArtSprite();
        this->state++;
        break;
    case 2:
        if (!IsBlendTaskActive())
        {
            BlitBitmapToWindow(0, this->gameFreakLogoGfx, 0x38, 0x06, 0x20, 0x40);
            BlitBitmapToWindow(0, this->gameFreakTextGfx, 0x00, 0x28, 0x90, 0x10);
            CopyWindowToVram(0, COPYWIN_GFX);
            this->state++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            DestroySprite(this->gameFreakLogoArtSprite);
        #if REVISION >= 1
            CreateGameFreakPresentsText();
        #endif
            this->data[5] = 0;
            this->state++;
        }
        break;
    case 4:
        if (++this->data[5] > 90)
        {
            SetGpuRegBits(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG2);
            StartBlendTask(16, 0, 0, 16, 20, 0);
            this->state++;
        }
        break;
    case 5:
        if (!IsBlendTaskActive())
        {
            HideBg(BG_GF_TEXT_LOGO);
            this->state++;
        }
        break;
    case 6:
        ResetSpriteData();
        FreeAllSpritePalettes();
        this->data[5] = 0;
        this->state++;
        break;
    case 7:
        if (++this->data[5] > 20)
        {
            SetGpuReg(REG_OFFSET_BLDCNT, 0);
            SetIntroCB(this, IntroCB_FightScene);
        }
        break;
    }
}

static void IntroCB_FightScene(struct IntroSequenceData * this)
{
    switch (this->state)
    {
    case 0:
        SetVBlankCallback(NULL);
        LoadPalette(sScene1_Grass_Pal, 0x10, 0x20);
        LoadPalette(sScene1_Bg_Pal, 0x20, 0x20);
        BlendPalettes(0x00000006, 0x10, RGB_WHITE);
        InitBgsFromTemplates(0, sBgTemplates_Scene1, NELEMS(sBgTemplates_Scene1));
        DecompressAndCopyTileDataToVram(BG_SCENE1_BACKGROUND, sScene1_Bg_Gfx, 0, 0, 0);
        DecompressAndCopyTileDataToVram(BG_SCENE1_BACKGROUND, sScene1_Bg_Map, 0, 0, 1);
        ShowBg(BG_SCENE1_BACKGROUND);
        HideBg(BG_SCENE1_GRASS);
        HideBg(BG_SCENE1_UNUSED1);
        HideBg(BG_SCENE1_UNUSED2);
        LoadFightSceneSpriteTilesAndPals();
        SetVBlankCallback(VBlankCB_Intro);
        this->state++;
        break;
    case 1:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            DecompressAndCopyTileDataToVram(BG_SCENE1_GRASS, sScene1_Grass_Gfx, 0, 0, 0);
            DecompressAndCopyTileDataToVram(BG_SCENE1_GRASS, sScene1_Grass_Map, 0, 0, 1);
            ResetBgPositions();
            ShowBg(BG_SCENE1_BACKGROUND);
            this->state++;
        }
        break;
    case 2:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            ShowBg(BG_SCENE1_GRASS);
            CreateTask(Task_FightScene1_GrassyFieldAnim, 0);
            BeginNormalPaletteFade(0x00000006, -2, 16, 0, RGB_WHITE);
            this->state++;
        }
        break;
    case 3:
        if (!gPaletteFade.active)
        {
            m4aSongNumStart(MUS_INTRO_FIGHT);
            this->data[5] = 0;
            this->state++;
        }
        break;
    case 4:
        this->data[5]++;
        if (this->data[5] == 20)
        {
            CreateTask(Task_FightScene1_ZoomEffect, 0);
            FightScene1_SignalEndGrassyFieldAnim();
        }
        if (this->data[5] >= 30)
        {
            BlendPalettes(0xFFFFFFFE, 16, RGB_WHITE);
            DestroyTask(FindTaskIdByFunc(Task_FightScene1_GrassyFieldAnim));
            DestroyTask(FindTaskIdByFunc(Task_FightScene1_ZoomEffect));
            SetIntroCB(this, IntroCB_FightScene2);
        }
        break;
    case 5:
        if (!gPaletteFade.active)
        {
            DestroyTask(FindTaskIdByFunc(Task_FightScene1_GrassyFieldAnim));
            DestroyTask(FindTaskIdByFunc(Task_FightScene1_ZoomEffect));
            SetIntroCB(this, IntroCB_FightScene2);
        }
        break;
    }
}

static void Task_FightScene1_GrassyFieldAnim(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (++data[0] > 5)
    {
        data[0] = 0;
        if (++data[1] > 2)
            data[1] = 0;
        ChangeBgY(BG_SCENE1_GRASS, data[1] << 15, 0);
    }
    if (data[2])
    {
        data[3] += 0x120;
        ChangeBgY(BG_SCENE1_GRASS, data[3], 2);
    }
}

static void FightScene1_SignalEndGrassyFieldAnim(void)
{
    u8 taskId = FindTaskIdByFunc(Task_FightScene1_GrassyFieldAnim);
    gTasks[taskId].data[2] = TRUE;
}

static void Task_FightScene1_ZoomEffect(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (++data[0] > 3)
    {
        data[0] = 0;
        if (data[1] < 2)
            data[1]++;
        ChangeBgY(BG_SCENE1_BACKGROUND, data[1] << 15, 0);
    }
}

static void IntroCB_FightScene2(struct IntroSequenceData * this)
{
    switch (this->state)
    {
    case 0:
        BlendPalettes(0xFFFFFFFE, 16, RGB_WHITE);
        InitBgsFromTemplates(0, sBgTemplates_Scene2, NELEMS(sBgTemplates_Scene2));
        DecompressAndCopyTileDataToVram(BG_SCENE2_BACKGROUND, sScene2_Bg_Gfx, 0, 0, 0);
        DecompressAndCopyTileDataToVram(BG_SCENE2_BACKGROUND, sScene2_Bg_Map, 0, 0, 1);
        ShowBg(BG_SCENE2_BACKGROUND);
        this->state++;
        break;
    case 1:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            SetVBlankCallback(NULL);
            LoadPalette(sScene2_Bg_Pal, 0x10, 0x60);
            LoadPalette(sGengar_Pal, 0x50, 0x20);
            LoadPalette(sScene2_NidorinoClose_Pal, 0x60, 0x20);
            BlendPalettes(0xFFFFFFFE, 16, RGB_WHITE);
            DecompressAndCopyTileDataToVram(BG_SCENE2_PLANTS, sScene2_Plants_Gfx, 0, 0, 0);
            DecompressAndCopyTileDataToVram(BG_SCENE2_PLANTS, sScene2_Plants_Map, 0, 0, 1);
            DecompressAndCopyTileDataToVram(BG_SCENE2_NIDORINO, sScene2_NidorinoClose_Gfx, 0, 0, 0);
            DecompressAndCopyTileDataToVram(BG_SCENE2_NIDORINO, sScene2_NidorinoClose_Map, 0, 0, 1);
            DecompressAndCopyTileDataToVram(BG_SCENE2_GENGAR, sScene2_GengarClose_Gfx, 0, 0, 0);
            DecompressAndCopyTileDataToVram(BG_SCENE2_GENGAR, sScene2_GengarClose_Map, 0, 0, 1);
            ResetBgPositions();
            ShowBg(BG_SCENE2_PLANTS);
            HideBg(BG_SCENE2_NIDORINO); // Hide bgs for scene 3
            HideBg(BG_SCENE2_GENGAR);
            ChangeBgY(BG_SCENE2_GENGAR, 0x0001CE00, 0);
            ChangeBgY(BG_SCENE2_NIDORINO, 0x00002800, 0);
            CreateTask(Task_FightScene2_CameraHorizPanEffect, 0);
            CreateMonStaticSprites(this);
            BlendPalettes(0xFFFFFFFE, 16, RGB_WHITE);
            SetVBlankCallback(VBlankCB_Intro);
            this->state++;
        }
        break;
    case 2:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            BeginNormalPaletteFade(0xFFFFFFFE, -2, 16, 0, RGB_WHITE);
            this->state++;
        }
        break;
    case 3:
        if (!gPaletteFade.active)
        {
            this->data[5] = 0;
            this->state++;
        }
        break;
    case 4:
        if (++this->data[5] >= 60)
        {
            this->data[5] = 0;
            DestroyTask(FindTaskIdByFunc(Task_FightScene2_CameraHorizPanEffect));
            DestroyStaticMonSprites(this);
            CreateTask(Task_FightScene2_CameraVertPanEffect, 0);
            ChangeBgY(BG_SCENE2_BACKGROUND, 0x00010000, 0); // Move background from upper half (wide shot) to lower half (close up)
            HideBg(BG_SCENE2_PLANTS);
            ShowBg(BG_SCENE2_BACKGROUND);
            ShowBg(BG_SCENE2_NIDORINO);
            ShowBg(BG_SCENE2_GENGAR);
            this->state++;
        }
        break;
    case 5:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            this->data[5] = 0;
            this->state++;
        }
        break;
    case 6:
        if (++this->data[5] >= 60)
        {
            DestroyTask(FindTaskIdByFunc(Task_FightScene2_CameraVertPanEffect));
            SetIntroCB(this, IntroCB_FightScene3);
        }
        break;
    }
}

static void Task_FightScene2_CameraHorizPanEffect(u8 taskId)
{
    ChangeBgX(BG_SCENE2_BACKGROUND, 0x0E0, 2);
    ChangeBgX(BG_SCENE2_PLANTS, 0x110, 1);
}

static void Task_FightScene2_CameraVertPanEffect(u8 taskId)
{
    ChangeBgY(BG_SCENE2_GENGAR, 0x020, 1);
    ChangeBgY(BG_SCENE2_NIDORINO, 0x024, 2);
}

static void CreateMonStaticSprites(struct IntroSequenceData * this)
{
    u8 spriteId;

    this->gengarStaticSprite = NULL;
    this->nidorinoStaticSprite = NULL;

    spriteId = CreateSprite(&sSpriteTemplate_Scene2_Nidorino, 168, 80, 11);
    if (spriteId != MAX_SPRITES)
        this->nidorinoStaticSprite = &gSprites[spriteId];

    spriteId = CreateSprite(&sSpriteTemplate_Scene2_Gengar, 72, 80, 12);
    if (spriteId != MAX_SPRITES)
        this->gengarStaticSprite = &gSprites[spriteId];
}

static void DestroyStaticMonSprites(struct IntroSequenceData * this)
{
    if (this->gengarStaticSprite != NULL)
        DestroySprite(this->gengarStaticSprite);
    if (this->nidorinoStaticSprite != NULL)
        DestroySprite(this->nidorinoStaticSprite);
}

static void IntroCB_FightScene3(struct IntroSequenceData * this)
{
    switch (this->state)
    {
    case 0:
        LoadPalette(sScene3_Bg_Pal, 0x10, 0x40);
        LoadPalette(sGengar_Pal, 0x50, 0x20);
        BlendPalettes(0xFFFFFFFE, 16, RGB_WHITE);
        InitBgsFromTemplates(0, sBgTemplates_Scene3, NELEMS(sBgTemplates_Scene3));
        DecompressAndCopyTileDataToVram(BG_SCENE3_BACKGROUND, sScene3_Bg_Gfx, 0, 0, 0);
        DecompressAndCopyTileDataToVram(BG_SCENE3_BACKGROUND, sScene3_Bg_Map, 0, 0, 1);
        ShowBg(BG_SCENE3_BACKGROUND);
        HideBg(BG_SCENE3_GENGAR);
        HideBg(BG_SCENE3_UNUSED1);
        HideBg(BG_SCENE3_UNUSED2);
        ResetBgPositions();
        this->state++;
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        SetGpuRegBits(REG_OFFSET_WININ, 0x12);
        ClearGpuRegBits(REG_OFFSET_WININ, 0x01);
        SetGpuRegBits(REG_OFFSET_WINOUT, 0x00);
        SetGpuReg(REG_OFFSET_WIN0V, 0x2080);
        SetGpuReg(REG_OFFSET_WIN0H, 0x0078);
        break;
    case 1:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            DecompressAndCopyTileDataToVram(BG_SCENE3_GENGAR, sScene3_GengarAnim_Gfx, 0, 0, 0);
            DecompressAndCopyTileDataToVram(BG_SCENE3_GENGAR, sScene3_GengarAnim_Map, 0, 0, 1);
            gUnknown_203AB00 = 4;
            gUnknown_203AB02 = 52;
            ChangeBgX(BG_SCENE3_GENGAR, 0x00001800, 0);
            ChangeBgY(BG_SCENE3_GENGAR, 0x0001F000, 0);
            this->state++;
        }
        break;
    case 2:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            BlendPalettes(0xFFFFFFFE, 0, RGB_WHITE);
            ShowBg(BG_SCENE3_GENGAR);
            CreateTask(Task_FightScene3_ForestBgScroll, 0);
            CreateNidorinoAnimSprite(this);
            StartNidorinoAnimSpriteSlideIn(this->nidorinoAnimSprite, 0, 0xB4, 0x34);
            CreateTask(Task_FightScene3_Bg0Scroll, 0);
            FightScene3_StartBg1Scroll();
            this->data[5] = 0;
            this->state++;
        }
        break;
    case 3:
        if (++this->data[5] == 16)
            CreateGrassSprite(this);
        if (!IsNidorinoAnimSpriteSlideInRunning(this) && !FuncIsActiveTask(Task_FightScene3_Bg0Scroll))
            SetIntroCB(this, IntroCB_FightScene4);
        break;
    }
}

static void Task_FightScene3_Bg1Scroll(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0)
        ChangeBgX(BG_SCENE3_BACKGROUND, 0x400, 2);
    else
        ChangeBgX(BG_SCENE3_BACKGROUND, 0x020, 2);
}

static void FightScene3_StartBg1Scroll(void)
{
    CreateTask(Task_FightScene3_Bg1Scroll, 0);
}

static void FightScene3_SlowBg1Scroll(void)
{
    u8 taskId = FindTaskIdByFunc(Task_FightScene3_Bg1Scroll);
    gTasks[taskId].data[0] = 1;
}

static void Task_FightScene3_ForestBgScroll(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    if (data[0] == 0)
    {
        if (++data[1] >= 30)
        {
            data[1] = 0;
            data[2] ^= 1;
            ChangeBgY(BG_SCENE3_GENGAR, (data[2] << 15) + 0x1F000, 0);
        }
    }
}

static void FightScene3_PauseForestBgScroll(void)
{
    u8 taskId = FindTaskIdByFunc(Task_FightScene3_ForestBgScroll);
    gTasks[taskId].data[0] = 1;
}

static void FightScene3_ResumeForestBgScroll(void)
{
    u8 taskId = FindTaskIdByFunc(Task_FightScene3_ForestBgScroll);
    gTasks[taskId].data[0] = 0;
}

static bool8 FightScene3_GetForestBgScrollState(void)
{
    u8 taskId = FindTaskIdByFunc(Task_FightScene3_ForestBgScroll);
    return gTasks[taskId].data[2];
}

static void CreateGrassSprite(struct IntroSequenceData * this)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_Grass, 296, 112, 7);
    if (spriteId != MAX_SPRITES)
    {
        this->grassSprite = &gSprites[spriteId];
        this->grassSprite->callback = SpriteCB_Grass;
    }
    else
        this->grassSprite = NULL;
}

static void SpriteCB_Grass(struct Sprite *sprite)
{
    s16 * data = sprite->data;

    switch (data[0])
    {
    case 0:
        data[1] = sprite->x << 5;
        data[2] = 160;
        data[0]++;
        // fallthrough
    case 1:
        data[1] -= data[2];
        sprite->x = data[1] >> 5;
        if (sprite->x <= 52)
        {
            FightScene3_SlowBg1Scroll();
            data[0]++;
        }
        break;
    case 2:
        data[1] -= 32;
        sprite->x = data[1] >> 5;
        if (sprite->x <= -32)
        {
            sprite->invisible = TRUE;
            sprite->data[0]++;
            DestroySprite(sprite);
        }
        break;
    }
}

static void IntroCB_FightScene4(struct IntroSequenceData * this)
{
    switch (this->state)
    {
    case 0:
        this->data[5] = 0;
        this->state++;
        break;
    case 1:
        if (++this->data[5] > 30)
        {
            FightScene4_NidorinoRearsUp(this);
            this->state++;
        }
        break;
    case 2:
        if (!FightScene4_NidorinoAnimIsRunning(this))
        {
            this->data[5] = 0;
            this->state++;
        }
        break;
    case 3:
        if (++this->data[5] > 30)
        {
            FightScene3_PauseForestBgScroll();
            FightScene4_StartGengarAttack(this);
            this->data[5] = 0;
            this->state++;
        }
        break;
    case 4:
        if (this->gengarAttackLanded)
        {
            FightScene4_StartNidorinoRecoilAnim(this);
            this->state++;
        }
        break;
    case 5:
        if (!FightScene4_NidorinoAnimIsRunning(this))
        {
            FightScene3_ResumeForestBgScroll();
            this->data[5] = 0;
            this->state++;
        }
        break;
    case 6:
        if (++this->data[5] > 16)
        {
            StartSpriteHopToPosAnim(this->nidorinoAnimSprite, 8, 12, 5);
            this->state++;
        }
        break;
    case 7:
        if (!FightScene4_NidorinoAnimIsRunning(this))
        {
            StartSpriteHopToPosAnim(this->nidorinoAnimSprite, 8, 12, 5);
            this->state++;
        }
        break;
    case 8:
        if (!FightScene4_NidorinoAnimIsRunning(this))
        {
            this->data[5] = 0;
            this->state++;
        }
        break;
    case 9:
        if (++this->data[5] > 20)
        {
            StartNidorinoAnim_LaunchSelfAtGengarAnim(this);
            this->data[5] = 0;
            this->state++;
        }
        break;
    case 10:
        if (!FightScene3_GetForestBgScrollState())
        {
            FightScene3_PauseForestBgScroll();
            CreateGengarBackSprite(this);
            this->state++;
        }
        break;
    case 11:
        HideBg(BG_SCENE3_GENGAR);
        this->data[5] = 0;
        this->state++;
        break;
    case 12:
        if (++this->data[5] == 48)
            BeginNormalPaletteFade(0x00000006, 2, 0, 16, RGB_WHITE);
        if (this->data[5] > 120)
        {
            FightScene4_StartNidorinoAffineAnim(this);
            FightScene4_StartGengarAffineAnim(this);
            this->state++;
            this->data[5] = 0;
        }
        break;
    case 13:
        if (++this->data[5] > 8)
        {
            CpuFill16(RGB_WHITE, gPlttBufferUnfaded + 16, 64);
            BeginNormalPaletteFade(0xFFFFFFFE, -2, 0, 16, RGB_BLACK);
            this->state++;
        }
        break;
    case 14:
        if (!gPaletteFade.active)
        {
            this->data[5] = 0;
            this->state++;
        }
        break;
    case 15:
        if (++this->data[5] > 60)
            SetIntroCB(this, IntroCB_CleanUp);
        break;
    default:
        if (JOY_NEW(R_BUTTON))
        {
            BlendPalettes(0xFFFF0064, 0, RGB_WHITE);
            this->nidorinoAnimSprite->x2 = 0;
            this->nidorinoAnimSprite->x = 0xB4;
            this->state = 1;
            this->data[5] = 30;
        }
        break;
    }
}

static void FightScene_CalcCenterToCornerVec(struct Sprite *sprite)
{
    CalcCenterToCornerVec(sprite, sprite->oam.shape, sprite->oam.size, sprite->oam.affineMode);
}

static void CreateGengarBackSprite(struct IntroSequenceData * this)
{
    int i;

    // Not using a subsprite table for this
    for (i = 0; i < NUM_GENGAR_BACK_SPRITES; i++)
    {
        int x = (i & 1) * 48 + 49;
        int y = (i / 2) * 64 + 72;
        u8 spriteId = CreateSprite(&sSpriteTemplate_Scene3_Gengar, x, y, 8);
        if (spriteId != MAX_SPRITES)
        {
            StartSpriteAnim(&gSprites[spriteId], i);
            this->gengarBackSprites[i] = &gSprites[spriteId];
            if (i & 1)
                this->gengarBackSprites[i]->oam.shape = ST_OAM_V_RECTANGLE;
            FightScene_CalcCenterToCornerVec(this->gengarBackSprites[i]);
        }
    }
}

static void FightScene4_StartNidorinoAffineAnim(struct IntroSequenceData * this)
{
    this->nidorinoAnimSprite->x += this->nidorinoAnimSprite->x2;
    this->nidorinoAnimSprite->y += this->nidorinoAnimSprite->y2;
    obj_pos2_update_enable(this->nidorinoAnimSprite, 0, 0x2A);
    this->nidorinoAnimSprite->callback = SpriteCallbackDummy;
    StartSpriteAffineAnim(this->nidorinoAnimSprite, 1);
}

static void SpriteCB_DummyButNotDummy(struct Sprite *sprite)
{
}

static void FightScene4_StartGengarAffineAnim(struct IntroSequenceData * this)
{
    int i;

    for (i = 0; i < NUM_GENGAR_BACK_SPRITES; i++)
    {
        StartSpriteAffineAnim(this->gengarBackSprites[i], 1);
        this->gengarBackSprites[i]->callback = SpriteCB_DummyButNotDummy;
        obj_pos2_update_enable(this->gengarBackSprites[i], sGengarBackSpritePos2UpdateMods[i][0], sGengarBackSpritePos2UpdateMods[i][1]);
    }
}

static void IntroCB_CleanUp(struct IntroSequenceData * this)
{
    switch (this->state)
    {
    case 0:
        FillPalette(RGB_BLACK, 0, 0x400);
        this->state++;
        break;
    case 1:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            DestroyTask(this->taskId);
            Free(this);
            DisableInterrupts(INTR_FLAG_HBLANK);
            SetHBlankCallback(NULL);
            SetMainCallback2(CB2_InitTitleScreen);
        }
        break;
    }
}

static void GameFreakScene_LoadGfxCreateStar(void)
{
    int i;
    u8 spriteId;
    static EWRAM_DATA u32 sTrailingSparklesRngSeed = 0;

    for (i = 0; i < NELEMS(sSpriteSheets_GameFreakScene); i++)
        LoadCompressedSpriteSheet(&sSpriteSheets_GameFreakScene[i]);
    LoadSpritePalettes(sSpritePalettes_GameFreakScene);
    sLargeStarXSpeed = 0x60;
    sLargeStarYSpeed = 0x10;
    sTrailingSparklesXmodMask = 0x07;
    sUnusedVarRelatedToGameFreakStars = 5;
    sTrailingSparklesSpawnRate = 8;
    sTrailingSparklesFlickerStartTime = 90;
    sTrailingSparklesDestroySpriteTime = 120;
    sTrailingSparklesXspeed = 1;
    sTrailingSparklesYspeed = 1;
    sTrailingSparklesXprecision = 5;
    sTrailingSparklesYprecision = 5;
    if (sTrailingSparklesRngSeed == 0)
        sTrailingSparklesRngSeed = 354128453;
    spriteId = CreateSprite(&sSpriteTemplate_Star, 0xF8, 0x37, 0);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].data[0] = 0xF80;
        gSprites[spriteId].data[1] = 0x370;
        gSprites[spriteId].data[2] = sLargeStarXSpeed;
        gSprites[spriteId].data[3] = sLargeStarYSpeed;
        StoreWordInTwoHalfwords((u16 *)&gSprites[spriteId].data[6], sTrailingSparklesRngSeed);
    }
}

static void GameFreakScene_TrailingSparklesGen(s16 x, s16 y, u16 a2)
{
    static EWRAM_DATA s16 sYmod = 0;

    u8 spriteId;
    s16 xMod = (a2 & sTrailingSparklesXmodMask) + 2;
    s16 yMod = sYmod;
    if (++sYmod > 3)
        sYmod = -3;
    x += xMod;
    y += yMod;
    if (x > 0 && x < DISPLAY_WIDTH)
    {
        spriteId = CreateSprite(&sSpriteTemplate_SparklesSmall, x, y, 1);
        if (spriteId != MAX_SPRITES)
        {
            gSprites[spriteId].data[0] = x << sTrailingSparklesXprecision;
            gSprites[spriteId].data[1] = y << sTrailingSparklesYprecision;
            gSprites[spriteId].data[2] = sTrailingSparklesXspeed * xMod;
            gSprites[spriteId].data[3] = sTrailingSparklesYspeed * yMod;
        }
    }
}

static void GameFreakScene_StartTrailingSparkleSpawner(void)
{
    CreateTask(Task_GameFreakScene_TrailingSparkleSpawner, 1);
}

static void Task_GameFreakScene_TrailingSparkleSpawner(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u8 r6;
    u8 spriteId;

    data[2]++, data[3]++;
    if (data[2] > 6)
    {
        data[2] = 0;
        r6 = data[0];
        spriteId = CreateSprite(&sSpriteTemplate_SparklesSmall, sTrailingSparkleCoords[r6].x, sTrailingSparkleCoords[r6].y, 2);
        StartSpriteAnim(&gSprites[spriteId], 1);
        gSprites[spriteId].callback = SpriteCB_SparklesSmall2;
        gSprites[spriteId].data[1] = sTrailingSparkleCoords[r6].y << 4;
        gSprites[spriteId].data[2] = 120;
        gSprites[spriteId].data[3] = data[1];
        if (gSprites[spriteId].data[3] < 0)
            gSprites[spriteId].data[3] = 1;
        if (++data[0] >= NELEMS(sTrailingSparkleCoords))
        {
            if (++data[1] > 1)
                DestroyTask(taskId);
            else
                data[0] = 0;
        }
    }
}

static void GameFreakScene_StartRevealGameFreakTextSparklesSpawner(void)
{
    CreateTask(Task_RevealGameFreakTextSparklesSpawner, 2);
}

static void Task_RevealGameFreakTextSparklesSpawner(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u8 r2;

    if (data[0] == 0)
    {
        r2 = data[1];
        data[1] += 4;
        if (data[1] >= NELEMS(sTrailingSparkleCoords))
            data[1] -= NELEMS(sTrailingSparkleCoords);
        CreateSprite(&sSpriteTemplate_SparklesBig, sTrailingSparkleCoords[r2].x, sTrailingSparkleCoords[r2].y, 3);
        if (++data[2] > 8)
            DestroyTask(taskId);
    }
    if (++data[0] > 9)
        data[0] = 0;
}

static struct Sprite *CreateGameFreakLogoArtSprite(void)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_GameFreakLogoArt, 120, 70, 4);
    return &gSprites[spriteId];
}

#if REVISION >= 1
static void CreateGameFreakPresentsText(void)
{
    int i;
    for (i = 0; i < 2; i++)
        gSprites[CreateSprite(&sSpriteTemplate_PresentsText, 0x68 + 32 * i, 0x6c, 5)].oam.tileNum += i * 4;
}
#endif

static void FightScene4_StartGengarAttack(struct IntroSequenceData * this)
{
    u8 taskId;
    this->gengarAttackLanded = FALSE;
    taskId = CreateTask(Task_FightScene4_GengarAttack, 4);
    SetWordTaskArg(taskId, 5, (uintptr_t)this);
    gTasks[taskId].data[3] = 64;
    gTasks[taskId].data[4] = GetBgX(BG_SCENE3_GENGAR);
}

static void FightScene4_ApplyGengarAnim(int a, int b, int c, int d)
{
    ChangeBgY(BG_SCENE3_GENGAR, (a << 15) + 0x1F000, 0);
    ChangeBgX(BG_SCENE3_GENGAR, d, 0);
    ChangeBgX(BG_SCENE3_GENGAR, b << 8, 2);
    ChangeBgY(BG_SCENE3_GENGAR, c << 8, 2);
}

static void Task_FightScene4_GengarAttack(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    int b, c;
    int angle;
    switch (data[0])
    {
    case 0:
        data[7] = 2;
        data[1] = 0;
        data[8] = 6;
        data[9] = 32;
        data[0]++;
        break;
    case 1:
        data[3] -= 2;
        if (++data[1] > 15)
        {
            data[1] = 0;
            data[0]++;
        }
        break;
    case 2:
        if (++data[1] == 14)
            ((struct IntroSequenceData *)GetWordTaskArg(taskId, 5))->gengarAttackLanded = TRUE;
        if (data[1] > 15)
        {
            data[1] = 0;
            data[0]++;
        }
        break;
    case 3:
        data[3] += 8;
        if (++data[1] == 4)
        {
            FightScene4_CreateGengarSwipeSprites();
            data[8] = 32;
            data[9] = 48;
            data[7] = 3;
        }
        if (data[1] > 7)
        {
            data[1] = 0;
            data[0]++;
        }
        break;
    case 4:
        data[3] -= 8;
        if (++data[1] > 3)
        {
            data[7] = 0;
            data[3] = 64;
            data[1] = 0;
            data[0]++;
        }
        break;
    case 5:
        DestroyTask(taskId);
        return;
    }
    angle = data[3];
    b = -((gSineTable[angle + 0x40] * data[9]) >> 8);
    c = data[8] - ((gSineTable[angle] * data[8]) >> 8);
    FightScene4_ApplyGengarAnim(data[7], b, c, data[4]);
}

static void FightScene4_CreateGengarSwipeSprites(void)
{
    u8 spriteId;
    
    spriteId = CreateSprite(&sSpriteTemplate_GengarSwipe, 132,  78, 6);
    spriteId = CreateSprite(&sSpriteTemplate_GengarSwipe, 132, 118, 6);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].oam.shape = ST_OAM_H_RECTANGLE;
        gSprites[spriteId].oam.size = ST_OAM_SIZE_2;
        FightScene_CalcCenterToCornerVec(&gSprites[spriteId]);
        StartSpriteAnim(&gSprites[spriteId], 1);
    }
}

static void SpriteCB_GengarSwipe(struct Sprite *sprite)
{
    sprite->invisible ^= TRUE;
    if (sprite->animEnded)
        DestroySprite(sprite);
}

static void Task_FightScene3_Bg0Scroll(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    static EWRAM_DATA u32 gUnknown_203AB30 = 0;

    switch (data[0])
    {
    case 0:
        data[1] = 0x400;
        data[0]++;
        // fallthrough
    case 1:
        if (++data[2] > 39 && data[1] > 16)
            data[1] -= 16;
        gUnknown_203AB30 = ChangeBgX(BG_SCENE3_GENGAR, data[1], 1);
        if (gUnknown_203AB30 >= 0x8000)
            ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        if (gUnknown_203AB30 >= 0xEF00)
        {
            ChangeBgX(BG_SCENE3_GENGAR, 0xEF00, 0);
            DestroyTask(taskId);
        }
        break;
    }
}

static void SpriteCB_LargeStar(struct Sprite *sprite)
{
    unsigned v;
    sprite->data[0] -= sprite->data[2];
    sprite->data[1] += sprite->data[3];
    sprite->data[4] += 48;
    sprite->x = sprite->data[0] >> 4;
    sprite->y = sprite->data[1] >> 4;
    sprite->y2 = gSineTable[(sprite->data[4] >> 4) + 0x40] >> 5;
    sprite->data[5]++;
    if (sprite->data[5] % sTrailingSparklesSpawnRate)
    {
        LoadWordFromTwoHalfwords(&sprite->data[6], &v);
        v = ISO_RANDOMIZE1(v);
        StoreWordInTwoHalfwords(&sprite->data[6], v);
        v >>= 16;
        GameFreakScene_TrailingSparklesGen(sprite->x, sprite->y + sprite->y2, v);
    }
    if (sprite->x < -8)
        DestroySprite(sprite);
}

static void SpriteCB_SparklesSmall(struct Sprite *sprite)
{
    u32 v;

    sprite->data[0] += sprite->data[2];
    sprite->data[1] += sprite->data[3];
    sprite->data[4]++;
    sprite->data[5] += sprite->data[4];
    sprite->data[7]++;
    sprite->x = (u16)sprite->data[0] >> sTrailingSparklesXprecision;
    sprite->y = sprite->data[1] >> sTrailingSparklesYprecision;
    if (sTrailingSparklesGravityShift && sprite->data[3] < 0)
        sprite->y2 = sprite->data[5] >> sTrailingSparklesGravityShift;
    if (sprite->data[7] > sTrailingSparklesFlickerStartTime)
    {
        sprite->invisible = !sprite->invisible;
        if (sprite->data[7] > sTrailingSparklesDestroySpriteTime)
            DestroySprite(sprite);
    }
    if (sprite->y + sprite->y2 < 0 || sprite->y + sprite->y2 > 160)
        DestroySprite(sprite);
}

static void SpriteCB_SparklesSmall2(struct Sprite *sprite)
{
    if (sprite->data[2])
    {
        sprite->data[2]--;
        sprite->data[1]++;
        sprite->y = sprite->data[1] >> 4;
        if (sprite->y > 0x56)
        {
            sprite->y = 0x4A;
            sprite->data[1] = 0x4A0;
        }
        if (sprite->animEnded)
        {
            if (sprite->data[0] == 0)
            {
                sprite->x += 26;
                if (sprite->x > 188)
                {
                    sprite->x = 376 - sprite->x;
                    sprite->data[0] = 1;
                }
            }
            else
            {
                sprite->x -= 26;
                if (sprite->x < 52)
                {
                    sprite->x = 104 - sprite->x;
                    sprite->data[0] = 0;
                }
            }
            StartSpriteAnim(sprite, 1);
        }
    }
    else
    {
        if (sprite->data[3])
            DestroySprite(sprite);
        if (sprite->animEnded)
            StartSpriteAnim(sprite, 0);
        sprite->data[1] += 4;
        sprite->y = sprite->data[1] >> 4;
        if (++sprite->data[4] > 50)
            DestroySprite(sprite);
    }
}

static void SpriteCB_RevealGameFreakTextSparkles(struct Sprite *sprite)
{
    if (sprite->animEnded)
        DestroySprite(sprite);
}

static void CreateNidorinoAnimSprite(struct IntroSequenceData * this)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_Scene3_Nidorino, 0, 0, 9);
    this->nidorinoAnimSprite = &gSprites[spriteId];
}

static void StartNidorinoAnimSpriteSlideIn(struct Sprite *sprite, s16 x0, s16 x1, u16 speed)
{
    sprite->data[0] = x0 << 4;
    sprite->data[1] = ((x1 - x0) << 4) / speed;
    sprite->data[2] = speed;
    sprite->data[3] = x1;
    sprite->data[4] = 0;
    sprite->x = x0;
    sprite->y = 100;
    sprite->callback = SpriteCB_NidorinoAnimSpriteSlideIn;
}

static void SpriteCB_NidorinoAnimSpriteSlideIn(struct Sprite *sprite)
{
    if (++sprite->data[4] >= 40)
    {
        if (sprite->data[1] > 1)
            sprite->data[1]--;
    }
    sprite->data[0] += sprite->data[1];
    sprite->x = sprite->data[0] >> 4;
    if (sprite->x >= sprite->data[3])
    {
        sprite->x = sprite->data[3];
        sprite->callback = SpriteCallbackDummy;
    }
}

static bool32 IsNidorinoAnimSpriteSlideInRunning(struct IntroSequenceData * ptr)
{
    return ptr->nidorinoAnimSprite->callback == SpriteCB_NidorinoAnimSpriteSlideIn ? TRUE : FALSE;
}

static void FightScene4_NidorinoRearsUp(struct IntroSequenceData * ptr)
{
    StartSpriteAnim(ptr->nidorinoAnimSprite, 2);
    ptr->nidorinoAnimSprite->data[0] = 0;
    ptr->nidorinoAnimSprite->data[1] = 0;
    ptr->nidorinoAnimSprite->y2 = 3;
    ptr->nidorinoAnimSprite->callback = SpriteCB_NidorinoRearsUp;
}

static void SpriteCB_NidorinoRearsUp(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (++sprite->data[1] > 8)
        {
            StartSpriteAnim(sprite, 1);
            sprite->y2 = 0;
            sprite->data[0]++;
        }
        break;
    case 1:
        PlayCry_ByMode(SPECIES_NIDORINO, 0x3F, CRY_MODE_DOUBLES);
        sprite->data[1] = 0;
        sprite->data[0]++;
        break;
    case 2:
        if (++sprite->data[2] > 1)
        {
            sprite->data[2] = 0;
            sprite->y2 = sprite->y2 == 0 ? 1 : 0;
        }
        if (++sprite->data[1] > 48)
        {
            StartSpriteAnim(sprite, 0);
            sprite->y2 = 0;
            sprite->callback = SpriteCallbackDummy;
        }
        break;
    }
}

static void FightScene4_StartNidorinoRecoilAnim(struct IntroSequenceData * ptr)
{
    gUnknown_203AB0A = 16;
    gUnknown_203AB04 = 3;
    gUnknown_203AB08 = 5;
    gUnknown_203AB06 = 0;
    StartSpriteAnim(ptr->nidorinoAnimSprite, 2);
    ptr->nidorinoAnimSprite->data[0] = 0;
    ptr->nidorinoAnimSprite->data[1] = 0;
    ptr->nidorinoAnimSprite->data[2] = 0;
    ptr->nidorinoAnimSprite->data[3] = 0;
    ptr->nidorinoAnimSprite->data[4] = 0;
    ptr->nidorinoAnimSprite->data[7] = 40;
    ptr->nidorinoAnimSprite->callback = SpriteCB_NidorinoRecoil;
}

static void SpriteCB_NidorinoRecoil(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->data[1]++;
        if (sprite->data[1] > 4)
        {
            StartSpriteAnim(sprite, 3);
            sprite->data[0]++;
        }
        break;
    case 1:
        sprite->data[2] += sprite->data[7];
        sprite->data[3] += 8;
        sprite->x2 = sprite->data[2] >> 4;
        sprite->y2 = -((gSineTable[sprite->data[3]] * gUnknown_203AB04) >> gUnknown_203AB08);
        sprite->data[5]++;
        if (sprite->data[5] > gUnknown_203AB06)
        {
            sprite->data[5] = 0;
            sprite->data[7]--;
        }
        sprite->data[4]++;
        if (sprite->data[4] > 15)
        {
            StartSpriteAnim(sprite, 2);
            sprite->data[1] = 0;
            sprite->data[6] = 0x4757;
            sprite->data[7] = 28;
            sprite->data[0]++;
        }
        break;
    case 2:
        sprite->data[2] += sprite->data[7];
        sprite->x2 = sprite->data[2] >> 4;
        sprite->data[1]++;
        if (sprite->data[1] > 6)
        {
            CreateNidorinoRecoilDustSprites(sprite->x + sprite->x2, sprite->y + sprite->y2, sprite->data[6]);
            sprite->data[6] *= RAND_MULT;
        }
        if (sprite->data[1] > 12)
        {
            StartSpriteAnim(sprite, 0);
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 3:
        sprite->data[1]++;
        if (sprite->data[1] > 16)
            StartSpriteHopToPosAnim(sprite, gUnknown_203AB0A, -sprite->x2, 4);
        break;
    }
}

static bool8 FightScene4_NidorinoAnimIsRunning(struct IntroSequenceData * ptr)
{
    return ptr->nidorinoAnimSprite->callback == SpriteCallbackDummy ? FALSE : TRUE;
}

static void CreateNidorinoRecoilDustSprites(s16 x, s16 y, s16 seed)
{
    int i;
    u8 spriteId;

    for (i = 0; i < 2; i++)
    {
        spriteId = CreateSprite(&sSpriteTemplate_NidorinoRecoilDust, x - 22, y + 24, 10);
        if (spriteId != MAX_SPRITES)
        {
            gSprites[spriteId].data[3] = (seed % 13) + 8;
            gSprites[spriteId].data[4] = seed % 3;
            gSprites[spriteId].data[7] = i;
            seed *= RAND_MULT;
        }
    }
}

static void SpriteCB_NidorinoRecoilDust(struct Sprite *sprite)
{
    s16 * data = sprite->data;

    switch (sprite->data[0])
    {
    case 0:
        data[1] = sprite->x << 4;
        data[2] = sprite->y << 4;
        sprite->data[0]++;
        // fallthrough
    case 1:
        data[1] -= data[3];
        data[2] += data[4];
        sprite->x = data[1] >> 4;
        sprite->y = data[2] >> 4;
        if (sprite->animEnded)
            DestroySprite(sprite);
        break;
    }
    if (++data[7] > 1)
    {
        data[7] = 0;
        sprite->invisible ^= TRUE;
    }
}

static void StartSpriteHopToPosAnim(struct Sprite *sprite, u16 a1, s16 a2, u8 a3)
{
    sprite->data[0] = 0;
    sprite->data[1] = a1;
    sprite->data[2] = sprite->x2 << 4;
    sprite->data[3] = (a2 << 4) / a1;
    sprite->data[4] = 0;
    sprite->data[5] = 0x800 / a1;
    sprite->data[6] = 0;
    sprite->data[7] = a3;
    StartSpriteAnim(sprite, 2);
    sprite->callback = SpriteCB_HopToPos;
}

static void SpriteCB_HopToPos(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (++sprite->data[6] > 4)
        {
            StartSpriteAnim(sprite, 3);
            sprite->data[6] = 0;
            sprite->data[0]++;
        }
        break;
    case 1:
        sprite->data[1]--;
        if (sprite->data[1])
        {
            sprite->data[2] += sprite->data[3];
            sprite->data[4] += sprite->data[5];
            sprite->x2 = sprite->data[2] >> 4;
            sprite->y2 = -(gSineTable[sprite->data[4] >> 4] >> sprite->data[7]);
        }
        else
        {
            sprite->x2 = (u16)sprite->data[2] >> 4;
            sprite->y2 = 0;
            StartSpriteAnim(sprite, 2);
            if (sprite->data[7] == 5)
                sprite->callback = SpriteCallbackDummy;
            else
            {
                sprite->data[6] = 0;
                sprite->data[0]++;
            }
        }
        break;
    case 2:
        if (++sprite->data[6] > 4)
        {
            StartSpriteAnim(sprite, 0);
            sprite->callback = SpriteCallbackDummy;
        }
        break;
    }
}

static void StartNidorinoAnim_LaunchSelfAtGengarAnim(struct IntroSequenceData * ptr)
{
    ptr->nidorinoAnimSprite->data[0] = 0;
    ptr->nidorinoAnimSprite->data[1] = 0;
    ptr->nidorinoAnimSprite->data[2] = 0;
    ptr->nidorinoAnimSprite->data[3] = 0;
    ptr->nidorinoAnimSprite->data[4] = 0;
    ptr->nidorinoAnimSprite->data[5] = 0;
    ptr->nidorinoAnimSprite->x += ptr->nidorinoAnimSprite->x2;
    ptr->nidorinoAnimSprite->x2 = 0;
    gUnknown_203AB0C = 0x24;
    gUnknown_203AB06 = 0x28;
    gUnknown_203AB04 = 0x03;
    gUnknown_203AB08 = 0x04;
    ptr->nidorinoAnimSprite->data[7] = 36;
    StartSpriteAnim(ptr->nidorinoAnimSprite, 2);
    ptr->nidorinoAnimSprite->callback = SpriteCB_NidorinoAnim_LaunchSelfAtGengar;
}

static void SpriteCB_NidorinoAnim_LaunchSelfAtGengar(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (++sprite->data[1] & 1)
        {
            if (++sprite->data[2] & 1)
                sprite->x2++;
            else
                sprite->x2--;
        }
        if (sprite->data[1] > 17)
        {
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 1:
        if (++sprite->data[1] >= gUnknown_203AB06)
        {
            StartSpriteAnim(sprite, 4);
            sprite->data[1] = 0;
            sprite->data[2] = 0;
            sprite->data[0]++;
        }
        break;
    case 2:
        sprite->data[1] += sprite->data[7];
        sprite->x2 = -(sprite->data[1] >> 4);
        sprite->y2 = -((gSineTable[sprite->data[1] >> 4] * gUnknown_203AB04) >> gUnknown_203AB08);
        sprite->data[2]++;
        if (sprite->data[7] > 12)
            sprite->data[7]--;
        if ((sprite->data[1] >> 4) > 0x3F)
            sprite->callback = SpriteCallbackDummy;
        break;
    }
}

static void LoadFightSceneSpriteTilesAndPals(void)
{
    int i;
    
    for (i = 0; i < NELEMS(sFightSceneSpriteSheets); i++)
    {
        LoadCompressedSpriteSheet(&sFightSceneSpriteSheets[i]);
    }
    // sFightSceneSpritePalettes is not properly terminated, so this
    // call exhibits undefined behavior.
    LoadSpritePalettes(sFightSceneSpritePalettes);
}
