#include "global.h"
#include "gflib.h"
#include "m4a.h"
#include "task.h"
#include "scanline_effect.h"
#include "libgcnmultiboot.h"
#include "new_menu_helpers.h"
#include "link.h"
#include "menu.h"
#include "save.h"
#include "new_game.h"
#include "title_screen.h"
#include "decompress.h"
#include "util.h"
#include "trig.h"
#include "constants/songs.h"
#include "constants/sound.h"

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
    struct Sprite *gengarBackSpriteArray[4];
    u8 filler_0038[0x4];
    u8 gamefreakLogoArtSpriteTiles[0x400];
    u8 gamefreakTextBitmap[0x400];
    u8 filler_083C[0x2080];
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
static void SpriteCB_TrailingSparkles(struct Sprite *sprite);
static void SpriteCB_TrailingSparkles2(struct Sprite *sprite);
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
#if REVISION >= 1
static void Rev1_GameFreakScene_CreatePresentsText(void);
#else
#define Rev1_GameFreakScene_CreatePresentsText()
#endif

extern const u32 gMultiBootProgram_PokemonColosseum_Start[];

static const u16 sCopyrightGraphicsPal[] = INCBIN_U16("graphics/intro/unk_8402260.gbapal");
static const u8 sCopyrightGraphicsTiles[] = INCBIN_U8("graphics/intro/unk_8402280.4bpp.lz");
static const u8 sCopyrightGraphicsMap[] = INCBIN_U8("graphics/intro/unk_84024E4.bin.lz");
static const u16 sBg3Pal_GameFreakPresents[] = INCBIN_U16("graphics/intro/unk_8402630.gbapal");
static const u8 sBg3Tiles_GameFreakPresents[] = INCBIN_U8("graphics/intro/unk_8402650.4bpp.lz");
static const u8 sBg3Map_GameFreakPresents[] = INCBIN_U8("graphics/intro/unk_8402668.bin.lz");
static const u16 sSpritePals_GameFreakPresents[] = INCBIN_U16("graphics/intro/unk_840270C.gbapal");
static const u8 sBlit_GameFreakText[] = INCBIN_U8("graphics/intro/unk_840272C.4bpp.lz");
static const u32 sSpriteTiles_GameFreakLogoArt[] = INCBIN_U32("graphics/intro/unk_84028F8.4bpp.lz");
static const u16 sSpritePals_LargeStar[] = INCBIN_U16("graphics/intro/unk_8402A64.gbapal");
static const u32 sSpriteTiles_LargeStar[] = INCBIN_U32("graphics/intro/unk_8402A64.4bpp.lz");
static const u16 sSpritePals_Sparkles[] = INCBIN_U16("graphics/intro/unk_8402ADC.gbapal");
static const u32 sSpriteTiles_TrailingSparkles[] = INCBIN_U32("graphics/intro/unk_8402ADC.4bpp.lz");
static const u32 sSpriteTiles_RevealGameFreakTextSparkles[] = INCBIN_U32("graphics/intro/unk_8402B2C.4bpp.lz");
static const u32 sSpriteTiles_PresentsText[] = INCBIN_U32("graphics/intro/unk_8402CD4.4bpp.lz");
static const u16 sBg0Pal_FightScene1[] = INCBIN_U16("graphics/intro/unk_8402D34.gbapal");
static const u8 sBg0Tiles_FightScene1[] = INCBIN_U8("graphics/intro/unk_8402D54.4bpp.lz");
static const u8 sBg0Map_FightScene1[] = INCBIN_U8("graphics/intro/unk_8403FE8.bin.lz");
static const u16 sBg1Pal_FightScene1[] = INCBIN_U16("graphics/intro/unk_84048CC.gbapal");
static const u8 sBg1Tiles_FightScene1[] = INCBIN_U8("graphics/intro/unk_84048EC.4bpp.lz");
static const u8 sBg1Map_FightScene1[] = INCBIN_U8("graphics/intro/unk_8404F7C.bin.lz");
static const u16 sBg3Pal_FightScene2[] = INCBIN_U16("graphics/intro/unk_84053B4.gbapal");
static const u8 sBg3Tiles_FightScene2[] = INCBIN_U8("graphics/intro/unk_8405414.4bpp.lz");
static const u8 sBg3Map_FightScene2[] = INCBIN_U8("graphics/intro/unk_8405890.bin.lz");
static const u16 sBg0Pal_FightScene2[] = INCBIN_U16("graphics/intro/unk_8405B08.gbapal");
static const u8 sBg0Tiles_FightScene2[] = INCBIN_U8("graphics/intro/unk_8405B28.4bpp.lz");
static const u8 sBg0Map_FightScene2[] = INCBIN_U8("graphics/intro/unk_8405CDC.bin.lz");
static const u16 sSpritePals_Gengar[] = INCBIN_U16("graphics/intro/unk_8405DA4.gbapal");
static const u8 sBg2Tiles_FightScene2[] = INCBIN_U8("graphics/intro/unk_8405DC4.4bpp.lz");
static const u8 sBg2Map_FightScene2[] = INCBIN_U8("graphics/intro/unk_840644C.bin.lz");
static const u16 sBg1Pal_FightScene2[] = INCBIN_U16("graphics/intro/unk_8406634.gbapal");
static const u8 sBg1Tiles_FightScene2[] = INCBIN_U8("graphics/intro/unk_8406654.4bpp.lz");
static const u8 sBg1Map_FightScene2[] = INCBIN_U8("graphics/intro/unk_84071D0.bin.lz");
static const u16 sBg1Pal_FightScene3[] = INCBIN_U16("graphics/intro/unk_8407430.gbapal");
static const u8 sBg1Tiles_FightScene3[] = INCBIN_U8("graphics/intro/unk_8407470.4bpp.lz");
static const u8 sBg1Map_FightScene3[] = INCBIN_U8("graphics/intro/unk_8407A50.bin.lz");
static const u8 sBg0Tiles_FightScene3[] = INCBIN_U8("graphics/intro/unk_8407B9C.4bpp.lz");
static const u8 sBg0Map_FightScene3[] = INCBIN_U8("graphics/intro/unk_8408D98.bin.lz");
static const u32 sSpriteTiles_GengarStatic[] = INCBIN_U32("graphics/intro/unk_840926C.4bpp.lz");
static const u16 sSpritePals_Nidorino[] = INCBIN_U16("graphics/intro/unk_84096AC.gbapal");
static const u32 sSpriteTiles_NidorinoStatic[] = INCBIN_U32("graphics/intro/unk_84096CC.4bpp.lz");
static const u16 sSpritePals_Grass[] = INCBIN_U16("graphics/intro/unk_8409A1C.gbapal");
static const u32 sSpriteTiles_Grass[] = INCBIN_U32("graphics/intro/unk_8409A3C.4bpp.lz");
static const u32 sSpriteTiles_GengarBack[] = INCBIN_U32("graphics/intro/unk_8409D20.4bpp.lz");
static const u32 sSpriteTiles_NidorinoAnim[] = INCBIN_U32("graphics/intro/unk_840A3E4.4bpp.lz");
static const u16 sSpritePals_GengarSwipe[] = INCBIN_U16("graphics/intro/unk_840B834.gbapal");
static const u16 sSpritePals_NidorinoRecoilDust[] = INCBIN_U16("graphics/intro/unk_840B854.gbapal");
static const u32 sSpriteTiles_GengarSwipe[] = INCBIN_U32("graphics/intro/unk_840B874.4bpp.lz");
static const u32 sSpriteTiles_NidorinoRecoilDust[] = INCBIN_U32("graphics/intro/unk_840BAE0.4bpp.lz");

static const struct BgTemplate sBgTemplates_GameFreakScene[] = {
    {
        .bg = 3,
        .charBaseIndex = 3,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x000
    }, {
        .bg = 2,
        .charBaseIndex = 3,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x010
    }
};

static const struct BgTemplate sBgTemplates_FightScene1[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 28,
        .screenSize = 2,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }, {
        .bg = 1,
        .charBaseIndex = 1,
        .mapBaseIndex = 30,
        .screenSize = 2,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }
};

static const struct BgTemplate sBgTemplates_FightScene2[] = {
    {
        .bg = 3,
        .charBaseIndex = 1,
        .mapBaseIndex = 30,
        .screenSize = 2,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x000
    }, {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }, {
        .bg = 2,
        .charBaseIndex = 3,
        .mapBaseIndex = 27,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x000
    }, {
        .bg = 1,
        .charBaseIndex = 2,
        .mapBaseIndex = 28,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x000
    }
};

static const struct BgTemplate sBgTemplates_FightScene3[] = {
	{
	    .bg = 1,
	    .charBaseIndex = 0,
	    .mapBaseIndex = 29,
	    .screenSize = 0,
	    .paletteMode = 0,
	    .priority = 1,
	    .baseTile = 0x000
    }, {
	    .bg = 0,
	    .charBaseIndex = 1,
	    .mapBaseIndex = 30,
	    .screenSize = 2,
	    .paletteMode = 0,
	    .priority = 0,
	    .baseTile = 0x000
	}
};

static const struct WindowTemplate sWindowTemplate[] = {
	{
	    .bg = 2,
	    .tilemapLeft = 6,
	    .tilemapTop = 4,
	    .width = 18,
	    .height = 9,
	    .paletteNum = 0xD,
	    .baseBlock = 0x000
    }, DUMMY_WIN_TEMPLATE
};

static const u8 sGengarBackSpritePos2UpdateMods[][2] = {
	{0x3f, 0x3f},
	{0x00, 0x3f},
	{0x3f, 0x00},
	{0x00, 0x00}
};

static const struct CompressedSpriteSheet sSpriteSheets_GameFreakScene[] = {
	{sSpriteTiles_LargeStar, 0x0080, 0},
	{sSpriteTiles_TrailingSparkles, 0x0080, 1},
	{sSpriteTiles_RevealGameFreakTextSparkles, 0x0800, 2},
	{sSpriteTiles_GameFreakLogoArt, 0x0400, 3},
	{sSpriteTiles_PresentsText, 0x0100, 4}
};

static const struct SpritePalette sSpritePalettes_GameFreakScene[] = {
	{sSpritePals_LargeStar, 0},
	{sSpritePals_Sparkles, 1},
	{sSpritePals_GameFreakPresents, 3},
	{0}
};

static const struct Coords16 sTrailingSparkleCoords[] = {
	{0x0048, 0x0050},
	{0x0088, 0x004a},
	{0x00a8, 0x0050},
	{0x0078, 0x0050},
	{0x0068, 0x0056},
	{0x0058, 0x004a},
	{0x00b8, 0x004a},
	{0x0038, 0x0056},
	{0x0098, 0x0056}
};

static const struct OamData gOamData_840BC2C = {
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

static const struct OamData gOamData_840BC34 = {
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

static const union AnimCmd gAnimCmd_840BC3C[] = {
	ANIMCMD_FRAME(0, 4),
	ANIMCMD_FRAME(1, 4),
	ANIMCMD_FRAME(2, 4),
	ANIMCMD_FRAME(3, 4),
	ANIMCMD_JUMP(0)
};

static const union AnimCmd gAnimCmd_840BC50[] = {
	ANIMCMD_FRAME(0, 4),
	ANIMCMD_FRAME(1, 4),
	ANIMCMD_FRAME(2, 4),
	ANIMCMD_FRAME(3, 4),
	ANIMCMD_END
};

static const union AnimCmd *const gAnimCmdTable_840BC64[] = {
	gAnimCmd_840BC3C,
	gAnimCmd_840BC50
};

static const struct SpriteTemplate sSpriteTemplate_LargeStar = {
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gOamData_840BC2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_LargeStar
};

static const struct SpriteTemplate sSpriteTemplate_TrailingSparkles = {
    .tileTag = 1,
    .paletteTag = 1,
    .oam = &gOamData_840BC34,
    .anims = gAnimCmdTable_840BC64,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_TrailingSparkles
};

static const struct OamData gOamData_840BC9C = {
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

static const union AnimCmd gAnimCmd_840BCA4[] = {
	ANIMCMD_FRAME(0, 8),
	ANIMCMD_FRAME(16, 8),
	ANIMCMD_FRAME(32, 8),
	ANIMCMD_FRAME(48, 8),
	ANIMCMD_END
};

static const union AnimCmd *const gAnimCmdTable_840BCB8[] = {
	gAnimCmd_840BCA4
};

static const struct SpriteTemplate sSpriteTemplate_RevealGameFreakTextSparkles = {
    .tileTag = 2,
    .paletteTag = 1,
    .oam = &gOamData_840BC9C,
    .anims = gAnimCmdTable_840BCB8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_RevealGameFreakTextSparkles
};

static const struct OamData gOamData_840BCD4 = {
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
    .tileTag = 3,
    .paletteTag = 3,
    .oam = &gOamData_840BCD4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData gOamData_840BCF4 = {
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
    .tileTag = 4,
    .paletteTag = 3,
    .oam = &gOamData_840BCF4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData gOamData_840BD14 = {
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

static const union AnimCmd gAnimCmd_840BD1C[] = {
	ANIMCMD_FRAME(0, 1),
	ANIMCMD_END
};

static const union AnimCmd gAnimCmd_840BD24[] = {
	ANIMCMD_FRAME(64, 1),
	ANIMCMD_END
};

static const union AnimCmd gAnimCmd_840BD2C[] = {
	ANIMCMD_FRAME(128, 1),
	ANIMCMD_END
};

static const union AnimCmd gAnimCmd_840BD34[] = {
	ANIMCMD_FRAME(192, 1),
	ANIMCMD_END
};

static const union AnimCmd gAnimCmd_840BD3C[] = {
	ANIMCMD_FRAME(256, 1),
	ANIMCMD_END
};

static const union AnimCmd *const sAnimTable_NidorinoAnim[] = {
	gAnimCmd_840BD1C,
	gAnimCmd_840BD24,
	gAnimCmd_840BD2C,
	gAnimCmd_840BD34,
	gAnimCmd_840BD3C
};

static const union AffineAnimCmd gAffineAnimCmd_840BD58[] = {
	AFFINEANIMCMD_FRAME(256, 256, 0, 0),
	AFFINEANIMCMD_END
};

static const union AffineAnimCmd gAffineAnimCmd_840BD68[] = {
	AFFINEANIMCMD_FRAME(256, 256, 0, 0),
	AFFINEANIMCMD_FRAME(32, 32, 0, 8),
	AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const sAffineAnimTable_NidorinoAnim[] = {
	gAffineAnimCmd_840BD58,
	gAffineAnimCmd_840BD68
};

static const struct SpriteTemplate sSpriteTemplate_NidorinoAnim = {
    .tileTag = 5,
    .paletteTag = 7,
    .oam = &gOamData_840BD14,
    .anims = sAnimTable_NidorinoAnim,
    .images = NULL,
    .affineAnims = sAffineAnimTable_NidorinoAnim,
    .callback = SpriteCallbackDummy
};

static const struct OamData gOamData_840BDA0 = {
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

static const struct SpriteTemplate sSpriteTemplate_NidorinoStatic = {
    .tileTag = 7,
    .paletteTag = 7,
    .oam = &gOamData_840BDA0,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct SpriteTemplate sSpriteTemplate_GengarStatic = {
    .tileTag = 6,
    .paletteTag = 6,
    .oam = &gOamData_840BDA0,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData gOamData_840BDD8 = {
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

static const union AnimCmd gAnimCmds_840BDE0[] = {
	ANIMCMD_FRAME(0, 0),
	ANIMCMD_END
};

static const union AnimCmd gAnimCmds_840BDE8[] = {
	ANIMCMD_FRAME(32, 4),
	ANIMCMD_FRAME(0, 4),
	ANIMCMD_END
};

static const union AnimCmd *const gAnimCmdTable_840BDF4[] = {
	gAnimCmds_840BDE0,
	gAnimCmds_840BDE8
};

static const struct SpriteTemplate sSpriteTemplate_Grass = {
    .tileTag = 8,
    .paletteTag = 8,
    .oam = &gOamData_840BDD8,
    .anims = gAnimCmdTable_840BDF4,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData gOamData_840BE14 = {
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

static const union AnimCmd gAnimCmd_840BE1C[] = {
	ANIMCMD_FRAME(0, 0),
	ANIMCMD_END
};

static const union AnimCmd gAnimCmd_840BE24[] = {
	ANIMCMD_FRAME(64, 0),
	ANIMCMD_END
};

static const union AnimCmd gAnimCmd_840BE2C[] = {
	ANIMCMD_FRAME(96, 0),
	ANIMCMD_END
};

static const union AnimCmd gAnimCmd_840BE34[] = {
	ANIMCMD_FRAME(160, 0),
	ANIMCMD_END
};

static const union AnimCmd *const gAnimCmdTable_840BE3C[] = {
	gAnimCmd_840BE1C,
	gAnimCmd_840BE24,
	gAnimCmd_840BE2C,
	gAnimCmd_840BE34
};

static const struct SpriteTemplate sSpriteTemplate_GengarBack = {
    .tileTag = 9,
    .paletteTag = 6,
    .oam = &gOamData_840BE14,
    .anims = gAnimCmdTable_840BE3C,
    .images = NULL,
    .affineAnims = sAffineAnimTable_NidorinoAnim,
    .callback = SpriteCallbackDummy
};

static const struct OamData gOamData_840BE64 = {
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

static const union AnimCmd gAnimCmd_840BE6C[] = {
	ANIMCMD_FRAME(0, 8),
	ANIMCMD_FRAME(32, 4),
	ANIMCMD_END
};

static const union AnimCmd gAnimCmd_840BE78[] = {
	ANIMCMD_FRAME(64, 8),
	ANIMCMD_FRAME(72, 4),
	ANIMCMD_END
};

static const union AnimCmd *const gAnimCmdTable_840BE84[] = {
	gAnimCmd_840BE6C,
	gAnimCmd_840BE78
};

static const struct SpriteTemplate sSpriteTemplate_GengarSwipe = {
    .tileTag = 10,
    .paletteTag = 10,
    .oam = &gOamData_840BE64,
    .anims = gAnimCmdTable_840BE84,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_GengarSwipe
};

static const struct OamData gOamData_840BEA4 = {
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

static const union AnimCmd gAnimCmd_840BEAC[] = {
	ANIMCMD_FRAME(0, 10),
	ANIMCMD_FRAME(4, 10),
	ANIMCMD_FRAME(8, 10),
	ANIMCMD_FRAME(12, 8),
	ANIMCMD_END
};

static const union AnimCmd *const gAnimCmdTable_840BEC0[] = {
	gAnimCmd_840BEAC
};

static const struct SpriteTemplate sSpriteTemplate_NidorinoRecoilDust = {
    .tileTag = 11,
    .paletteTag = 11,
    .oam = &gOamData_840BEA4,
    .anims = gAnimCmdTable_840BEC0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_NidorinoRecoilDust
};

static const struct CompressedSpriteSheet sFightSceneSpriteSheets[] = {
	{sSpriteTiles_GengarStatic, 0x0800, 6},
	{sSpriteTiles_NidorinoStatic, 0x0800, 7},
	{sSpriteTiles_NidorinoAnim, 0x2800, 5},
	{sSpriteTiles_Grass, 0x0800, 8},
	{sSpriteTiles_GengarBack, 0x1800, 9},
	{sSpriteTiles_GengarSwipe, 0x0a00, 10},
	{sSpriteTiles_NidorinoRecoilDust, 0x0200, 11}
};

// POTENTIAL UB
// This array is passed to LoadSpritePalettes in LoadFightSceneSpriteTilesAndPals.
// LoadSpritePalettes uses a {0} entry to signal end of array.
// Because such an entry is absent in this case, the function
// continues reading into the next .rodata section.
static const struct SpritePalette sFightSceneSpritePalettes[] = {
	{sSpritePals_Gengar, 6},
	{sSpritePals_Nidorino, 7},
	{sSpritePals_Grass, 8},
	{sSpritePals_GengarSwipe, 10},
	{sSpritePals_NidorinoRecoilDust, 11},
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

static void load_copyright_graphics(u16 charBase, u16 screenBase, u16 palOffset)
{
    LZ77UnCompVram(sCopyrightGraphicsTiles, (void *)BG_VRAM + charBase);
    LZ77UnCompVram(sCopyrightGraphicsMap, (void *)BG_VRAM + screenBase);
    LoadPalette(sCopyrightGraphicsPal, palOffset, 0x20);
}

static void SerialCb_CopyrightScreen(void)
{
    GameCubeMultiBoot_HandleSerialInterrupt(&sGcmb);
}

static bool8 RunCopyrightScreen(void)
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
        load_copyright_graphics(0 * BG_CHAR_SIZE, 7 * BG_SCREEN_SIZE, 0);
        ScanlineEffect_Stop();
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, 0xFFFF);
        SetGpuReg(REG_OFFSET_BG0CNT, BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_16COLOR | BGCNT_SCREENBASE(7));
        EnableInterrupts(INTR_FLAG_VBLANK);
        SetVBlankCallback(VBlankCB_Copyright);
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON);
        SetSerialCallback(SerialCb_CopyrightScreen);
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
                    // Gc6e
                    if (*((u32 *)0x020000AC) == 0x65366347)
                    {
                        CpuCopy16(gMultiBootProgram_PokemonColosseum_Start, (void *)EWRAM_START, 0x28000);
                        *((u32 *)0x020000AC) = 0x65366347;
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

void c2_copyright_1(void)
{
    if (!RunCopyrightScreen())
    {
        ResetMenuAndMonGlobals();
        Save_ResetSaveCounters();
        Save_LoadGameData(SAVE_NORMAL);
        if (gSaveFileStatus == SAVE_STATUS_EMPTY || gSaveFileStatus == SAVE_STATUS_INVALID)
            Sav2_ClearSetDefault();
        SetPokemonCryStereo(gSaveBlock2Ptr->optionsSound);
    }
}

void CB2_CopyrightScreen(void)
{
    RunCopyrightScreen();
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
        LoadPalette(sBg3Pal_GameFreakPresents, 0x00, 0x20);
        DecompressAndCopyTileDataToVram(3, sBg3Tiles_GameFreakPresents, 0, 0, 0);
        DecompressAndCopyTileDataToVram(3, sBg3Map_GameFreakPresents, 0, 0, 1);
        LoadPalette(sSpritePals_GameFreakPresents, 0xD0, 0x20);
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
        InitWindows(sWindowTemplate);
        LZ77UnCompWram(sBlit_GameFreakText, this->gamefreakTextBitmap);
        LZ77UnCompWram(sSpriteTiles_GameFreakLogoArt, this->gamefreakLogoArtSpriteTiles);
        FillBgTilemapBufferRect(2, 0x000, 0, 0, 32, 32, 0x11);
        FillWindowPixelBuffer(0, PIXEL_FILL(0));
        BlitBitmapToWindow(0, this->gamefreakTextBitmap, 0, 40, 144, 16);
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
        this->data[5]++;
        if (this->data[5] >= 40)
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
        this->data[5]++;
        if (this->data[5] > 50)
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
            BlitBitmapToWindow(0, this->gamefreakLogoArtSpriteTiles, 0x38, 0x06, 0x20, 0x40);
            BlitBitmapToWindow(0, this->gamefreakTextBitmap, 0x00, 0x28, 0x90, 0x10);
            CopyWindowToVram(0, COPYWIN_GFX);
            this->state++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            DestroySprite(this->gameFreakLogoArtSprite);
            Rev1_GameFreakScene_CreatePresentsText();
            this->data[5] = 0;
            this->state++;
        }
        break;
    case 4:
        this->data[5]++;
        if (this->data[5] > 90)
        {
            SetGpuRegBits(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG2);
            StartBlendTask(16, 0, 0, 16, 20, 0);
            this->state++;
        }
        break;
    case 5:
        if (!IsBlendTaskActive())
        {
            HideBg(2);
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
        this->data[5]++;
        if (this->data[5] > 20)
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
        LoadPalette(sBg0Pal_FightScene1, 0x10, 0x20);
        LoadPalette(sBg1Pal_FightScene1, 0x20, 0x20);
        BlendPalettes(0x00000006, 0x10, RGB_WHITE);
        InitBgsFromTemplates(0, sBgTemplates_FightScene1, NELEMS(sBgTemplates_FightScene1));
        DecompressAndCopyTileDataToVram(1, sBg1Tiles_FightScene1, 0, 0, 0);
        DecompressAndCopyTileDataToVram(1, sBg1Map_FightScene1, 0, 0, 1);
        ShowBg(1);
        HideBg(0);
        HideBg(2);
        HideBg(3);
        LoadFightSceneSpriteTilesAndPals();
        SetVBlankCallback(VBlankCB_Intro);
        this->state++;
        break;
    case 1:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            DecompressAndCopyTileDataToVram(0, sBg0Tiles_FightScene1, 0, 0, 0);
            DecompressAndCopyTileDataToVram(0, sBg0Map_FightScene1, 0, 0, 1);
            ResetBgPositions();
            ShowBg(1);
            this->state++;
        }
        break;
    case 2:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            ShowBg(0);
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

    data[0]++;
    if (data[0] > 5)
    {
        data[0] = 0;
        data[1]++;
        if (data[1] > 2)
            data[1] = 0;
        ChangeBgY(0, data[1] << 15, 0);
    }
    if (data[2])
    {
        data[3] += 0x120;
        ChangeBgY(0, data[3], 2);
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

    data[0]++;
    if (data[0] > 3)
    {
        data[0] = 0;
        if (data[1] < 2)
            data[1]++;
        ChangeBgY(1, data[1] << 15, 0);
    }
}

static void IntroCB_FightScene2(struct IntroSequenceData * this)
{
    switch (this->state)
    {
    case 0:
        BlendPalettes(0xFFFFFFFE, 16, RGB_WHITE);
        InitBgsFromTemplates(0, sBgTemplates_FightScene2, NELEMS(sBgTemplates_FightScene2));
        DecompressAndCopyTileDataToVram(3, sBg3Tiles_FightScene2, 0, 0, 0);
        DecompressAndCopyTileDataToVram(3, sBg3Map_FightScene2, 0, 0, 1);
        ShowBg(3);
        this->state++;
        break;
    case 1:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            SetVBlankCallback(NULL);
            LoadPalette(sBg3Pal_FightScene2, 0x10, 0x60);
            LoadPalette(sSpritePals_Gengar, 0x50, 0x20);
            LoadPalette(sBg1Pal_FightScene2, 0x60, 0x20);
            BlendPalettes(0xFFFFFFFE, 16, RGB_WHITE);
            DecompressAndCopyTileDataToVram(0, sBg0Tiles_FightScene2, 0, 0, 0);
            DecompressAndCopyTileDataToVram(0, sBg0Map_FightScene2, 0, 0, 1);
            DecompressAndCopyTileDataToVram(1, sBg1Tiles_FightScene2, 0, 0, 0);
            DecompressAndCopyTileDataToVram(1, sBg1Map_FightScene2, 0, 0, 1);
            DecompressAndCopyTileDataToVram(2, sBg2Tiles_FightScene2, 0, 0, 0);
            DecompressAndCopyTileDataToVram(2, sBg2Map_FightScene2, 0, 0, 1);
            ResetBgPositions();
            ShowBg(0);
            HideBg(1);
            HideBg(2);
            ChangeBgY(2, 0x0001CE00, 0);
            ChangeBgY(1, 0x00002800, 0);
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
        this->data[5]++;
        if (this->data[5] >= 60)
        {
            this->data[5] = 0;
            DestroyTask(FindTaskIdByFunc(Task_FightScene2_CameraHorizPanEffect));
            DestroyStaticMonSprites(this);
            CreateTask(Task_FightScene2_CameraVertPanEffect, 0);
            ChangeBgY(3, 0x00010000, 0);
            HideBg(0);
            ShowBg(3);
            ShowBg(1);
            ShowBg(2);
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
        this->data[5]++;
        if (this->data[5] >= 60)
        {
            DestroyTask(FindTaskIdByFunc(Task_FightScene2_CameraVertPanEffect));
            SetIntroCB(this, IntroCB_FightScene3);
        }
        break;
    }
}

static void Task_FightScene2_CameraHorizPanEffect(u8 taskId)
{
    ChangeBgX(3, 0x0E0, 2);
    ChangeBgX(0, 0x110, 1);
}

static void Task_FightScene2_CameraVertPanEffect(u8 taskId)
{
    ChangeBgY(2, 0x020, 1);
    ChangeBgY(1, 0x024, 2);
}

static void CreateMonStaticSprites(struct IntroSequenceData * this)
{
    u8 spriteId;

    this->gengarStaticSprite = NULL;
    this->nidorinoStaticSprite = NULL;

    spriteId = CreateSprite(&sSpriteTemplate_NidorinoStatic, 168, 80, 11);
    if (spriteId != MAX_SPRITES)
        this->nidorinoStaticSprite = &gSprites[spriteId];

    spriteId = CreateSprite(&sSpriteTemplate_GengarStatic, 72, 80, 12);
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
        LoadPalette(sBg1Pal_FightScene3, 0x10, 0x40);
        LoadPalette(sSpritePals_Gengar, 0x50, 0x20);
        BlendPalettes(0xFFFFFFFE, 16, RGB_WHITE);
        InitBgsFromTemplates(0, sBgTemplates_FightScene3, NELEMS(sBgTemplates_FightScene3));
        DecompressAndCopyTileDataToVram(1, sBg1Tiles_FightScene3, 0, 0, 0);
        DecompressAndCopyTileDataToVram(1, sBg1Map_FightScene3, 0, 0, 1);
        ShowBg(1);
        HideBg(0);
        HideBg(2);
        HideBg(3);
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
            DecompressAndCopyTileDataToVram(0, sBg0Tiles_FightScene3, 0, 0, 0);
            DecompressAndCopyTileDataToVram(0, sBg0Map_FightScene3, 0, 0, 1);
            gUnknown_203AB00 = 4;
            gUnknown_203AB02 = 52;
            ChangeBgX(0, 0x00001800, 0);
            ChangeBgY(0, 0x0001F000, 0);
            this->state++;
        }
        break;
    case 2:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            BlendPalettes(0xFFFFFFFE, 0, RGB_WHITE);
            ShowBg(0);
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
        this->data[5]++;
        if (this->data[5] == 16)
            CreateGrassSprite(this);
        if (!IsNidorinoAnimSpriteSlideInRunning(this) && !FuncIsActiveTask(Task_FightScene3_Bg0Scroll))
            SetIntroCB(this, IntroCB_FightScene4);
        break;
    }
}

static void Task_FightScene3_Bg1Scroll(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0)
        ChangeBgX(1, 0x400, 2);
    else
        ChangeBgX(1, 0x020, 2);
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
        data[1]++;
        if (data[1] >= 30)
        {
            data[1] = 0;
            data[2] ^= 1;
            ChangeBgY(0, (data[2] << 15) + 0x1F000, 0);
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
        this->data[5]++;
        if (this->data[5] > 30)
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
        this->data[5]++;
        if (this->data[5] > 30)
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
        this->data[5]++;
        if (this->data[5] > 16)
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
        this->data[5]++;
        if (this->data[5] > 20)
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
        HideBg(0);
        this->data[5] = 0;
        this->state++;
        break;
    case 12:
        this->data[5]++;
        if (this->data[5] == 48)
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
        this->data[5]++;
        if (this->data[5] > 8)
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
        this->data[5]++;
        if (this->data[5] > 60)
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
    for (i = 0; i < 4; i++)
    {
        int x = (i & 1) * 48 + 49;
        int y = (i / 2) * 64 + 72;
        u8 spriteId = CreateSprite(&sSpriteTemplate_GengarBack, x, y, 8);
        if (spriteId != MAX_SPRITES)
        {
            StartSpriteAnim(&gSprites[spriteId], i);
            this->gengarBackSpriteArray[i] = &gSprites[spriteId];
            if (i & 1)
                this->gengarBackSpriteArray[i]->oam.shape = ST_OAM_V_RECTANGLE;
            FightScene_CalcCenterToCornerVec(this->gengarBackSpriteArray[i]);
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

    for (i = 0; i < 4; i++)
    {
        StartSpriteAffineAnim(this->gengarBackSpriteArray[i], 1);
        this->gengarBackSpriteArray[i]->callback = SpriteCB_DummyButNotDummy;
        obj_pos2_update_enable(this->gengarBackSpriteArray[i], sGengarBackSpritePos2UpdateMods[i][0], sGengarBackSpritePos2UpdateMods[i][1]);
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
    {
        LoadCompressedSpriteSheet(&sSpriteSheets_GameFreakScene[i]);
    }
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
    spriteId = CreateSprite(&sSpriteTemplate_LargeStar, 0xF8, 0x37, 0);
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
    sYmod++;
    if (sYmod > 3)
        sYmod = -3;
    x += xMod;
    y += yMod;
    if (x >= 1 && x <= 0xEF)
    {
        spriteId = CreateSprite(&sSpriteTemplate_TrailingSparkles, x, y, 1);
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
        spriteId = CreateSprite(&sSpriteTemplate_TrailingSparkles, sTrailingSparkleCoords[r6].x, sTrailingSparkleCoords[r6].y, 2);
        StartSpriteAnim(&gSprites[spriteId], 1);
        gSprites[spriteId].callback = SpriteCB_TrailingSparkles2;
        gSprites[spriteId].data[1] = sTrailingSparkleCoords[r6].y << 4;
        gSprites[spriteId].data[2] = 120;
        gSprites[spriteId].data[3] = data[1];
        if (gSprites[spriteId].data[3] < 0)
            gSprites[spriteId].data[3] = 1;
        data[0]++;
        if (data[0] >= NELEMS(sTrailingSparkleCoords))
        {
            data[1]++;
            if (data[1] > 1)
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
        CreateSprite(&sSpriteTemplate_RevealGameFreakTextSparkles, sTrailingSparkleCoords[r2].x, sTrailingSparkleCoords[r2].y, 3);
        data[2]++;
        if (data[2] > 8)
            DestroyTask(taskId);
    }
    data[0]++;
    if (data[0] > 9)
        data[0] = 0;
}

static struct Sprite *CreateGameFreakLogoArtSprite(void)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_GameFreakLogoArt, 120, 70, 4);
    return &gSprites[spriteId];
}

#if REVISION >= 1
static void Rev1_GameFreakScene_CreatePresentsText(void)
{
    int i;
    for (i = 0; i < 2; i++)
    {
        gSprites[CreateSprite(&sSpriteTemplate_PresentsText, 0x68 + 32 * i, 0x6c, 5)].oam.tileNum += i * 4;
    }
}
#endif

static void FightScene4_StartGengarAttack(struct IntroSequenceData * this)
{
    u8 taskId;
    this->gengarAttackLanded = FALSE;
    taskId = CreateTask(Task_FightScene4_GengarAttack, 4);
    SetWordTaskArg(taskId, 5, (uintptr_t)this);
    gTasks[taskId].data[3] = 64;
    gTasks[taskId].data[4] = GetBgX(0);
}

static void FightScene4_ApplyGengarAnim(int a, int b, int c, int d)
{
    ChangeBgY(0, (a << 15) + 0x1F000, 0);
    ChangeBgX(0, d, 0);
    ChangeBgX(0, b << 8, 2);
    ChangeBgY(0, c << 8, 2);
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
        data[1]++;
        if (data[1] > 15)
        {
            data[1] = 0;
            data[0]++;
        }
        break;
    case 2:
        data[1]++;
        if (data[1] == 14)
            ((struct IntroSequenceData *)GetWordTaskArg(taskId, 5))->gengarAttackLanded = TRUE;
        if (data[1] > 15)
        {
            data[1] = 0;
            data[0]++;
        }
        break;
    case 3:
        data[3] += 8;
        data[1]++;
        if (data[1] == 4)
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
        data[1]++;
        if (data[1] > 3)
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
        data[2]++;
        if (data[2] > 39 && data[1] > 16)
            data[1] -= 16;
        gUnknown_203AB30 = ChangeBgX(0, data[1], 1);
        if (gUnknown_203AB30 >= 0x8000)
            ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        if (gUnknown_203AB30 >= 0xEF00)
        {
            ChangeBgX(0, 0xEF00, 0);
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
        v = v * 1103515245 + 24691;
        StoreWordInTwoHalfwords(&sprite->data[6], v);
        v >>= 16;
        GameFreakScene_TrailingSparklesGen(sprite->x, sprite->y + sprite->y2, v);
    }
    if (sprite->x < -8)
        DestroySprite(sprite);
}

static void SpriteCB_TrailingSparkles(struct Sprite *sprite)
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

static void SpriteCB_TrailingSparkles2(struct Sprite *sprite)
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
        sprite->data[4]++;
        if (sprite->data[4] > 50)
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
    u8 spriteId = CreateSprite(&sSpriteTemplate_NidorinoAnim, 0, 0, 9);
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
    sprite->data[4]++;
    if (sprite->data[4] >= 40)
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
        sprite->data[1]++;
        if (sprite->data[1] > 8)
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
        sprite->data[2]++;
        if (sprite->data[2] > 1)
        {
            sprite->data[2] = 0;
            sprite->y2 = sprite->y2 == 0 ? 1 : 0;
        }
        sprite->data[1]++;
        if (sprite->data[1] > 48)
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
            sprite->data[6] *= 1103515245;
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
        {
            StartSpriteHopToPosAnim(sprite, gUnknown_203AB0A, -sprite->x2, 4);
        }
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
            seed *= 1103515245;
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
    data[7]++;
    if (data[7] > 1)
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
        sprite->data[6]++;
        if (sprite->data[6] > 4)
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
        sprite->data[6]++;
        if (sprite->data[6] > 4)
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
        sprite->data[1]++;
        if (sprite->data[1] & 1)
        {
            sprite->data[2]++;
            if (sprite->data[2] & 1)
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
