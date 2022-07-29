#include "global.h"
#include "sprite.h"
#include "task.h"
#include "overworld.h"
#include "malloc.h"
#include "palette.h"
#include "trig.h"
#include "random.h"
#include "sound.h"
#include "decompress.h"
#include "gpu_regs.h"
#include "battle_transition.h"
#include "field_effect.h"
#include "field_weather.h"
#include "field_camera.h"
#include "trainer_pokemon_sprites.h"
#include "scanline_effect.h"
#include "event_object_movement.h"
#include "constants/songs.h"

typedef bool8 (*TransitionStateFunc)(struct Task *task);
typedef bool8 (*TransitionSpriteCallback)(struct Sprite *sprite);

struct TransitionData
{
    vu8 vblankDma;
    u16 winIn;
    u16 winOut;
    u16 win0H;
    u16 win0V;
    u16 win1H; // not used
    u16 win1V;
    u16 bldCnt;
    u16 bldAlpha;
    u16 bldY;
    s16 bg123HOfs;
    s16 bg123VOfs;
    s16 bg0HOfsOpponent;
    s16 bg0HOfsPlayer;
    s16 bg0VOfs;
    s16 unused_1E;
    s16 counter;
    s16 unused_22;
    s16 data[11]; // for multiple purposes
};

static EWRAM_DATA struct TransitionData *sTransitionStructPtr = NULL;

static bool8 BT_Phase1_FadeOut(struct Task *task);
static bool8 BT_Phase1_FadeIn(struct Task *task);
static bool8 BT_Phase2BlackDoodles_Init(struct Task *task);
static bool8 BT_Phase2BlackDoodles_InitSingleBrush(struct Task *task);
static bool8 BT_Phase2BlackDoodles_DrawSingleBrush(struct Task *task);
static bool8 BT_Phase2BlackDoodles_IsDone(struct Task *task);
static bool8 BT_Phase2BlackDoodles_NextBrush(struct Task *task);
static bool8 BT_Phase2GridSquares_LoadGfx(struct Task *task);
static bool8 BT_Phase2GridSquares_UpdateTileset(struct Task *task);
static bool8 BT_Phase2GridSquares_IsDone(struct Task *task);
static bool8 BT_Phase2WhiteFadeInStripes_Init(struct Task *task);
static bool8 BT_Phase2WhiteFadeInStripes_SetupSprites(struct Task *task);
static bool8 BT_Phase2WhiteFadeInStripes_IsWhiteFadeDone(struct Task *task);
static bool8 BT_Phase2WhiteFadeInStripes_Stop(struct Task *task);
static bool8 BT_Phase2WhiteFadeInStripes_IsDone(struct Task *task);
static bool8 BT_Phase2SlicedScreen_Init(struct Task *task);
static bool8 BT_Phase2SlicedScreen_UpdateOffsets(struct Task *task);
static bool8 BT_Phase2SlicedScreen_End(struct Task *task);
static bool8 BT_Phase2Mugshot_Init(struct Task *task);
static bool8 BT_Phase2Mugshot_LoadGfx(struct Task *task);
static bool8 BT_Phase2Mugshot_VsBarsSlideIn(struct Task *task);
static bool8 BT_Phase2Mugshot_StartSpriteSlide(struct Task *task);
static bool8 BT_Phase2Mugshot_WaitForOpponentInPlace(struct Task *task);
static bool8 BT_Phase2Mugshot_WaitForPlayerInPlace(struct Task *task);
static bool8 BT_Phase2Mugshot_ExpandWhiteBand(struct Task *task);
static bool8 BT_Phase2Mugshot_StartBlackFade(struct Task *task);
static bool8 BT_Phase2Mugshot_WaitForBlackFade(struct Task *task);
static bool8 BT_Phase2Mugshot_End(struct Task *task);
static bool8 BT_Phase2AntiClockwiseSpiral_Init(struct Task *task);
static bool8 BT_Phase2AntiClockwiseSpiral_Update(struct Task *task);
static bool8 BT_Phase2BlackWaveToRight_Init(struct Task *task);
static bool8 BT_Phase2BlackWaveToRight_UpdateWave(struct Task *task);
static bool8 BT_Phase2BlackWaveToRight_End(struct Task *task);
static bool8 BT_Phase2FullScreenWave_Init(struct Task *task);
static bool8 BT_Phase2FullScreenWave_UpdateWave(struct Task *task);
static bool8 BT_Phase2ClockwiseBlackFade_Init(struct Task *task);
static bool8 BT_Phase2ClockwiseBlackFade_Step1(struct Task *task);
static bool8 BT_Phase2ClockwiseBlackFade_Step2(struct Task *task);
static bool8 BT_Phase2ClockwiseBlackFade_Step3(struct Task *task);
static bool8 BT_Phase2ClockwiseBlackFade_Step4(struct Task *task);
static bool8 BT_Phase2ClockwiseBlackFade_Step5(struct Task *task);
static bool8 BT_Phase2ClockwiseBlackFade_End(struct Task *task);
static bool8 BT_Phase2SlidingPokeballs_LoadBgGfx(struct Task *task);
static bool8 BT_Phase2SlidingPokeballs_SetupFldeffArgs(struct Task *task);
static bool8 BT_Phase2SlidingPokeballs_IsDone(struct Task *task);
static bool8 BT_Phase2BigPokeball_Init(struct Task *task);
static bool8 BT_Phase2BigPokeball_LoadTilemapAndWave(struct Task *task);
static bool8 BT_Phase2BigPokeball_UpdateWave1IncEva(struct Task *task);
static bool8 BT_Phase2BigPokeball_UpdateWave2DecEvb(struct Task *task);
static bool8 BT_Phase2BigPokeball_UpdateWave3(struct Task *task);
static bool8 BT_Phase2BigPokeball_CircleEffect(struct Task *task);
static bool8 BT_Phase2HorizontalCorrugate_Init(struct Task *task);
static bool8 BT_Phase2HorizontalCorrugate_UpdateWave(struct Task *task);
static bool8 BT_Phase2DistortedWave_InitWave(struct Task *task);
static bool8 BT_Phase2DistortedWave_UpdateWave(struct Task *task);
static bool8 BT_Phase2Blur_InitBgMosaic(struct Task *task);
static bool8 BT_Phase2Blur_Anim(struct Task *task);
static bool8 BT_Phase2Blur_IsDone(struct Task *task);
static bool8 BT_Phase1Blink(struct Task *task);
static bool8 BT_WaitForPhase1(struct Task *task);
static bool8 BT_Phase2LaunchAnimTask(struct Task *task);
static bool8 BT_WaitForPhase2(struct Task *task);

static void BT_Phase2Blur(u8 taskId);
static void BT_Phase2DistortedWave(u8 taskId);
static void BT_Phase2HorizontalCorrugate(u8 taskId);
static void BT_Phase2BigPokeball(u8 taskId);
static void BT_Phase2SlidingPokeballs(u8 taskId);
static void BT_Phase2ClockwiseBlackFade(u8 taskId);
static void BT_Phase2FullScreenWave(u8 taskId);
static void BT_Phase2BlackWaveToRight(u8 taskId);
static void BT_Phase2SlicedScreen(u8 taskId);
static void BT_Phase2WhiteFadeInStripes(u8 taskId);
static void BT_Phase2GridSquares(u8 taskId);
static void BT_Phase2BlackDoodles(u8 taskId);
static void BT_Phase2StartLoreleiMugshot(u8 taskId);
static void BT_Phase2StartBrunoMugshot(u8 taskId);
static void BT_Phase2StartAgathaMugshot(u8 taskId);
static void BT_Phase2StartLanceMugshot(u8 taskId);
static void BT_Phase2StartBlueMugshot(u8 taskId);
static void BT_Phase2AntiClockwiseSpiral(u8 taskId);
static void BT_Phase1Task(u8 taskId);
static void BT_Phase2Mugshot(u8 taskId);
static void BT_Phase1SubTask(u8 taskId);

static void SpriteCB_BT_Phase2Mugshots(struct Sprite *sprite);
static void SpriteCB_BT_Phase2SlidingPokeballs(struct Sprite *sprite);
static void SpriteCB_BT_Phase2WhiteFadeInStripes(struct Sprite *sprite);

static bool8 BT_Phase2MugshotsSpriteFuncs_Wait(struct Sprite *sprite);
static bool8 BT_Phase2MugshotsSpriteFuncs_InitParams(struct Sprite *sprite);
static bool8 BT_Phase2MugshotsSpriteFuncs_SlideSpriteIn(struct Sprite *sprite);
static bool8 BT_Phase2MugshotsSpriteFuncs_DecelerateSprite(struct Sprite *sprite);
static bool8 BT_Phase2MugshotsSpriteFuncs_DecelerateSprite2(struct Sprite *sprite);

static void VBCB_BT_Phase2DistortedWave(void);
static void HBCB_BT_Phase2DistortedWave(void);
static void VBCB_BT_Phase2HorizontalCorrugate(void);
static void HBCB_BT_Phase2HorizontalCorrugate(void);
static void VBCB_BT_Phase2BigPokeball1(void);
static void VBCB_BT_Phase2BigPokeball2(void);
static void HBCB_BT_Phase2BigPokeball(void);
static void VBCB_BT_Phase2ClockwiseBlackFade(void);
static void VBCB_BT_Phase2FullScreenWave(void);
static void HBCB_BT_Phase2FullScreenWave(void);
static void VBCB_BT_Phase2BlackWaveToRight(void);
static void VBCB_BT_Phase2AntiClockwiseBlackFade(void);
static void VBCB_BT_Phase2Mugshot1_Slide(void);
static void VBCB_BT_Phase2Mugshot2_WhiteFade(void);
static void HBCB_BT_Phase2Mugshot(void);
static void VBCB_BT_Phase2SlicedScreen(void);
static void HBCB_BT_Phase2SlicedScreen(void);
static void VBCB_BT_Phase2WhiteFadeInStripes1(void);
static void VBCB_BT_Phase2WhiteFadeInStripes2(void);
static void HBCB_BT_Phase2WhiteFadeInStripes(void);
static void VBCB_BT_Phase2BlackDoodles(void);

static void BT_LaunchTask(u8 transitionId);
static void BT_TaskMain(u8 taskId);
static void BT_InitCtrlBlk(void);
static void BT_CreatePhase1SubTask(s16 fadeOutDelay, s16 fadeInDelay, s16 blinkTimes, s16 fadeOutSpeed, s16 fadeInSpeed);
static bool8 BT_IsPhase1Done(void);
static void BT_VBSyncOamAndPltt(void);
static void BT_GetBg0TilesetBase(u16 **tilesetPtr);
static void BT_GetBg0TilemapAndTilesetBase(u16 **tilemapPtr, u16 **tilesetPtr);
static void BT_LoadWaveIntoBuffer(s16 *buffer, s16 offset, s16 theta, s16 frequency, s16 amplitude, s16 bufSize);
static void BT_GenerateCircle(s16 *buffer, s16 x, s16 y, s16 radius);
static void BT_BlendPalettesToBlack(void);
static void BT_DiagonalSegment_InitParams(s16 *data, s16 startPtX, s16 startPtY, s16 endPtX, s16 endPtY, s16 stepX, s16 stepY);
static bool8 BT_DiagonalSegment_ComputePointOnSegment(s16 *data, bool8 checkBoundary1, bool8 checkBoundary2);
static void BT_SetSpriteAsOpponentOrPlayer(s16 spriteId, bool16 value);
static void BT_StartSpriteSlide(s16 spriteId);
static s16 BT_IsSpriteSlideFinished(s16 spriteId);
static void BT_Phase2Mugshots_CreateSprites(struct Task *task);

static const u32 sBigPokeballTileset[] = INCBIN_U32("graphics/battle_transitions/big_pokeball_tileset.4bpp");
static const u32 sSlidingPokeballTilemap[] = INCBIN_U32("graphics/battle_transitions/sliding_pokeball_tilemap.bin");
static const u8 sSpriteImage_SlidingPokeball[] = INCBIN_U8("graphics/battle_transitions/sliding_pokeball.4bpp");
static const u32 sVsBarTileset[] = INCBIN_U32("graphics/battle_transitions/vsbar_tileset.4bpp");
static const u8 sSpriteImage_UnusedBrendan[] = INCBIN_U8("graphics/battle_transitions/unused_brendan.4bpp");
static const u8 sSpriteImage_UnusedLass[] = INCBIN_U8("graphics/battle_transitions/unused_lass.4bpp");
static const u32 sGridSquareTileset[] = INCBIN_U32("graphics/battle_transitions/grid_square_tileset.4bpp");

static const TaskFunc sBT_Phase1Tasks[] =
{
    BT_Phase1Task,
    BT_Phase1Task,
    BT_Phase1Task,
    BT_Phase1Task,
    BT_Phase1Task,
    BT_Phase1Task,
    BT_Phase1Task,
    BT_Phase1Task,
    BT_Phase1Task,
    BT_Phase1Task,
    BT_Phase1Task,
    BT_Phase1Task,
    BT_Phase1Task,
    BT_Phase1Task,
    BT_Phase1Task,
    BT_Phase1Task,
    BT_Phase1Task,
    BT_Phase1Task,
};

static const TaskFunc sBT_Phase2Tasks[] =
{
    [B_TRANSITION_BLUR]                  = BT_Phase2Blur,
    [B_TRANSITION_DISTORTED_WAVE]        = BT_Phase2DistortedWave,
    [B_TRANSITION_HORIZONTAL_CORRUGATE]  = BT_Phase2HorizontalCorrugate,
    [B_TRANSITION_BIG_POKEBALL]          = BT_Phase2BigPokeball,
    [B_TRANSITION_SLIDING_POKEBALLS]     = BT_Phase2SlidingPokeballs,
    [B_TRANSITION_CLOCKWISE_BLACKFADE]   = BT_Phase2ClockwiseBlackFade,
    [B_TRANSITION_FULLSCREEN_WAVE]       = BT_Phase2FullScreenWave,
    [B_TRANSITION_BLACK_WAVE_TO_RIGHT]   = BT_Phase2BlackWaveToRight,
    [B_TRANSITION_SLICED_SCREEN]         = BT_Phase2SlicedScreen,
    [B_TRANSITION_WHITEFADE_IN_STRIPES]  = BT_Phase2WhiteFadeInStripes,
    [B_TRANSITION_GRID_SQUARES]          = BT_Phase2GridSquares,
    [B_TRANSITION_BLACK_DOODLES]         = BT_Phase2BlackDoodles,
    [B_TRANSITION_LORELEI]               = BT_Phase2StartLoreleiMugshot,
    [B_TRANSITION_BRUNO]                 = BT_Phase2StartBrunoMugshot,
    [B_TRANSITION_AGATHA]                = BT_Phase2StartAgathaMugshot,
    [B_TRANSITION_LANCE]                 = BT_Phase2StartLanceMugshot,
    [B_TRANSITION_BLUE]                  = BT_Phase2StartBlueMugshot,
    [B_TRANSITION_ANTI_CLOCKWISE_SPIRAL] = BT_Phase2AntiClockwiseSpiral,
};

static const TransitionStateFunc sBT_MainPhases[] =
{
    BT_Phase1Blink,
    BT_WaitForPhase1,
    BT_Phase2LaunchAnimTask,
    BT_WaitForPhase2,
};

static const TransitionStateFunc sBT_Phase2BlurFuncs[] =
{
    BT_Phase2Blur_InitBgMosaic,
    BT_Phase2Blur_Anim,
    BT_Phase2Blur_IsDone,
};

static const TransitionStateFunc sBT_Phase2DistortedWaveFuncs[] =
{
    BT_Phase2DistortedWave_InitWave,
    BT_Phase2DistortedWave_UpdateWave,
};

static const TransitionStateFunc sBT_Phase2HorizontalCorrugateFuncs[] =
{
    BT_Phase2HorizontalCorrugate_Init,
    BT_Phase2HorizontalCorrugate_UpdateWave,
};

static const TransitionStateFunc sBT_Phase2BigPokeballFuncs[] =
{
    BT_Phase2BigPokeball_Init,
    BT_Phase2BigPokeball_LoadTilemapAndWave,
    BT_Phase2BigPokeball_UpdateWave1IncEva,
    BT_Phase2BigPokeball_UpdateWave2DecEvb,
    BT_Phase2BigPokeball_UpdateWave3,
    BT_Phase2BigPokeball_CircleEffect,
};

static const TransitionStateFunc sBT_Phase2SlidingPokeballsFuncs[] =
{
    BT_Phase2SlidingPokeballs_LoadBgGfx,
    BT_Phase2SlidingPokeballs_SetupFldeffArgs,
    BT_Phase2SlidingPokeballs_IsDone,
};

static const s16 gUnknown_83FA400[] = { -16, 256 };

static const s16 gUnknown_83FA404[] = { 0, 16, 32, 8, 24 };

static const s16 gUnknown_83FA40E[] = { 8, -8 };

static const TransitionStateFunc sBT_Phase2ClockwiseBlackFadeFuncs[] =
{
    BT_Phase2ClockwiseBlackFade_Init,
    BT_Phase2ClockwiseBlackFade_Step1,
    BT_Phase2ClockwiseBlackFade_Step2,
    BT_Phase2ClockwiseBlackFade_Step3,
    BT_Phase2ClockwiseBlackFade_Step4,
    BT_Phase2ClockwiseBlackFade_Step5,
    BT_Phase2ClockwiseBlackFade_End,
};

static const TransitionStateFunc sBT_Phase2FullScreenWaveFuncs[] =
{
    BT_Phase2FullScreenWave_Init,
    BT_Phase2FullScreenWave_UpdateWave,
};

static const TransitionStateFunc sBT_Phase2BlackWaveToRightFuncs[] =
{
    BT_Phase2BlackWaveToRight_Init,
    BT_Phase2BlackWaveToRight_UpdateWave,
    BT_Phase2BlackWaveToRight_End,
};
static const s16 gUnknown_83FA444[] =
{
    0x0, 0x26E,
    0x100, 0x69,
    0x0, -0x69,
    -0x100, -0x266E,
    0x0, 0x26E,
    0x100, 0x69,
    0x0, -0x69,
    -0x100, -0x266E,
};

static const TransitionStateFunc sBT_Phase2AntiClockwiseSpiralFuncs[] =
{
    BT_Phase2AntiClockwiseSpiral_Init,
    BT_Phase2AntiClockwiseSpiral_Update,
};

static const TransitionStateFunc sBT_Phase2MugshotFuncs[] =
{
    BT_Phase2Mugshot_Init,
    BT_Phase2Mugshot_LoadGfx,
    BT_Phase2Mugshot_VsBarsSlideIn,
    BT_Phase2Mugshot_StartSpriteSlide,
    BT_Phase2Mugshot_WaitForOpponentInPlace,
    BT_Phase2Mugshot_WaitForPlayerInPlace,
    BT_Phase2Mugshot_ExpandWhiteBand,
    BT_Phase2Mugshot_StartBlackFade,
    BT_Phase2Mugshot_WaitForBlackFade,
    BT_Phase2Mugshot_End,
};

static const u8 sMugshotsTrainerPicIDsTable[MUGSHOTS_COUNT] =
{
    // TODO: document these with macro
    0x70, 0x71, 0x72, 0x73, 0x7D
};

static const s16 sMugshotsOpponentRotationScales[MUGSHOTS_COUNT][2] =
{
    {0x200, 0x200},
    {0x200, 0x200},
    {0x200, 0x200},
    {0x200, 0x200},
    {0x200, 0x200},
};

static const s16 sMugshotsOpponentCoords[MUGSHOTS_COUNT][2] =
{
    { -8, 0 },
    { -10, 0 },
    { 0, 0 },
    { -32, 0 },
    { 0, 0 },
};

static const TransitionSpriteCallback sBT_Phase2MugshotSpriteFuncs[] =
{
    BT_Phase2MugshotsSpriteFuncs_Wait,
    BT_Phase2MugshotsSpriteFuncs_InitParams,
    BT_Phase2MugshotsSpriteFuncs_SlideSpriteIn,
    BT_Phase2MugshotsSpriteFuncs_DecelerateSprite,
    BT_Phase2MugshotsSpriteFuncs_Wait,
    BT_Phase2MugshotsSpriteFuncs_DecelerateSprite2, // not used
    BT_Phase2MugshotsSpriteFuncs_Wait,
};

static const s16 sMugShotSlideVelocity[] = { 12, -12 };

static const s16 sMugShotSlideDeceleration[] = { -1, 1 };

static const TransitionStateFunc sBT_Phase2SlicedScreenFuncs[] =
{
    BT_Phase2SlicedScreen_Init,
    BT_Phase2SlicedScreen_UpdateOffsets,
    BT_Phase2SlicedScreen_End,
};

static const TransitionStateFunc sBT_Phase2WhiteFadeInStripesFuncs[] =
{
    BT_Phase2WhiteFadeInStripes_Init,
    BT_Phase2WhiteFadeInStripes_SetupSprites,
    BT_Phase2WhiteFadeInStripes_IsWhiteFadeDone,
    BT_Phase2WhiteFadeInStripes_Stop,
    BT_Phase2WhiteFadeInStripes_IsDone,
};

static const u16 sWhiteStripeDelay[] = { 0, 9, 15, 6, 12, 3 };
    
static const TransitionStateFunc sBT_Phase2GridSquaresFuncs[] =
{
    BT_Phase2GridSquares_LoadGfx,
    BT_Phase2GridSquares_UpdateTileset,
    BT_Phase2GridSquares_IsDone,
};

static const TransitionStateFunc sBT_Phase2BlackDoodlesFuncs[] =
{
    BT_Phase2BlackDoodles_Init,
    BT_Phase2BlackDoodles_InitSingleBrush,
    BT_Phase2BlackDoodles_DrawSingleBrush,
    BT_Phase2BlackDoodles_IsDone,
    BT_Phase2BlackDoodles_NextBrush,
};

static const s16 sBlackDoodlesSegments[][5] =
{
    { 0x38, 0x00, 0x00, 0xA0, 0 },
    { 0x68, 0xA0, 0xF0, 0x58, 1 },
    { 0xF0, 0x48, 0x38, 0x00, 1 },
    { 0x00, 0x20, 0x90, 0xA0, 0 },
    { 0x90, 0xA0, 0xB8, 0x00, 1 },
    { 0x38, 0x00, 0xA8, 0xA0, 0 },
    { 0xA8, 0xA0, 0x30, 0x00, 1 },
};

static const s16 sBlackDoodlesDelay[] = { 1, 1, 1, 1, 1, 1, 0 };

static const TransitionStateFunc sBT_Phase1FadeFuncs[] =
{
    BT_Phase1_FadeOut,
    BT_Phase1_FadeIn,
};

static const struct SpriteFrameImage sSpriteImageTable_SlidingPokeball[] =
{
    {
        .data = sSpriteImage_SlidingPokeball, 
        .size = 0x200,
    },
};

static const union AnimCmd sSpriteAnim_SlidingPokeball[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

static const union AnimCmd *const sSpriteAnimTable_SlidingPokeball[] = { sSpriteAnim_SlidingPokeball };

static const union AffineAnimCmd sSpriteAffineAnim_SlidingPokeball1[] =
{
    AFFINEANIMCMD_FRAME(0, 0, -4, 1),
    AFFINEANIMCMD_JUMP(0),
};

static const union AffineAnimCmd sSpriteAffineAnim_SlidingPokeball2[] =
{
    AFFINEANIMCMD_FRAME(0, 0, 4, 1),
    AFFINEANIMCMD_JUMP(0),
};

static const union AffineAnimCmd *const sSpriteAffineAnimTable_SlidingPokeball[] =
{
    sSpriteAffineAnim_SlidingPokeball1,
    sSpriteAffineAnim_SlidingPokeball2,
};

static const struct SpriteTemplate sSpriteTemplate_SlidingPokeball =
{
    .tileTag = TAG_NONE,
    .paletteTag = 0x1009,
    .oam = &gObjectEventBaseOam_32x32,
    .anims = sSpriteAnimTable_SlidingPokeball,
    .images = sSpriteImageTable_SlidingPokeball,
    .affineAnims = sSpriteAffineAnimTable_SlidingPokeball,
    .callback = SpriteCB_BT_Phase2SlidingPokeballs,
};

static const struct OamData sOamData_Unused =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = SPRITE_SHAPE(64x64),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x64),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

static const struct SpriteFrameImage sSpriteImageTable_UnusedBrendan[] =
{
    {
        .data = sSpriteImage_UnusedBrendan,
        .size = 0x800,
    },
};

static const struct SpriteFrameImage sSpriteImageTable_UnusedLass[] =
{
    {
        .data = sSpriteImage_UnusedLass,
        .size = 0x800,
    },
};

static const union AnimCmd sSpriteAnim_Unused[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

static const union AnimCmd *const sSpriteAnimTable_Unused[] = { sSpriteAnim_Unused };

static const struct SpriteTemplate sSpriteTemplateTable_Unused[] =
{
    {
        .tileTag = TAG_NONE,
        .paletteTag = 0x100A,
        .oam = &sOamData_Unused,
        .anims = sSpriteAnimTable_Unused,
        .images = sSpriteImageTable_UnusedBrendan,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_BT_Phase2Mugshots,
    },
    {
        .tileTag = TAG_NONE,
        .paletteTag = 0x100A,
        .oam = &sOamData_Unused,
        .anims = sSpriteAnimTable_Unused,
        .images = sSpriteImageTable_UnusedLass,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_BT_Phase2Mugshots,
    },
};

// this palette is shared by big pokeball and sliding pokeball
static const u16 sSlidingPokeballBigPokeballPalette[] = INCBIN_U16("graphics/battle_transitions/sliding_pokeball.gbapal");

const struct SpritePalette sSpritePalette_SlidingPokeball =
{
    .data = sSlidingPokeballBigPokeballPalette,
    .tag = 0x1009,
};

static const u16 sVsBarLoreleiPalette[] = INCBIN_U16("graphics/battle_transitions/lorelei_bg.gbapal");
static const u16 sVsBarBrunoPalette[] = INCBIN_U16("graphics/battle_transitions/bruno_bg.gbapal");
static const u16 sVsBarAgathaPalette[] = INCBIN_U16("graphics/battle_transitions/agatha_bg.gbapal");
static const u16 sVsBarLancePalette[] = INCBIN_U16("graphics/battle_transitions/lance_bg.gbapal");
static const u16 sVsBarBluePalette[] = INCBIN_U16("graphics/battle_transitions/blue_bg.gbapal");
static const u16 sVsBarMalePlayerPalette[] = INCBIN_U16("graphics/battle_transitions/red_bg.gbapal");
static const u16 sVsBarFemalePlayerPalette[] = INCBIN_U16("graphics/battle_transitions/green_bg.gbapal");

static const u16 *const sVsBarOpponentPalettes[MUGSHOTS_COUNT] =
{
    sVsBarLoreleiPalette,
    sVsBarBrunoPalette,
    sVsBarAgathaPalette,
    sVsBarLancePalette,
    sVsBarBluePalette,
};

static const u16 *const sVsBarPlayerPalettes[] =
{
    sVsBarMalePlayerPalette,
    sVsBarFemalePlayerPalette,
};

static const u16 sUnusedTrainerPalette[] = INCBIN_U16("graphics/battle_transitions/unused_trainer.gbapal");

static const struct SpritePalette sSpritePalette_UnusedTrainer =
{
    .data = sUnusedTrainerPalette, 
    .tag = 0x100A,
};

static const u16 sBigPokeballTilemap[] = INCBIN_U16("graphics/battle_transitions/big_pokeball_tilemap.bin");
static const u16 sVsBarTilemap[] = INCBIN_U16("graphics/battle_transitions/vsbar_tilemap.bin");

void BT_StartOnField(u8 transitionId)
{
    sTransitionStructPtr = AllocZeroed(sizeof(struct TransitionData));
    gMain.callback2 = CB2_OverworldBasic;
    BT_LaunchTask(transitionId);
}

// not used
static void BT_StartWithoutAlloc(u8 transitionId)
{
    BT_LaunchTask(transitionId);
}

#define tState          data[0]
#define tTransitionId   data[1]
#define tTransitionDone data[15]

bool8 BT_IsDone(void)
{
    u8 taskId = FindTaskIdByFunc(BT_TaskMain);
    if (gTasks[taskId].tTransitionDone)
    {
        BT_InitCtrlBlk();
        FREE_AND_SET_NULL(sTransitionStructPtr);
        DestroyTask(taskId);
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

static void BT_LaunchTask(u8 transitionId)
{
    u8 taskId = CreateTask(BT_TaskMain, 2);
    gTasks[taskId].tTransitionId = transitionId;
}

static void BT_TaskMain(u8 taskId)
{
    while (sBT_MainPhases[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 BT_Phase1Blink(struct Task *task)
{
    SetWeatherScreenFadeOut();
    CpuCopy32(gPlttBufferFaded, gPlttBufferUnfaded, 0x400);
    if (sBT_Phase1Tasks[task->tTransitionId] != NULL)
    {
        CreateTask(sBT_Phase1Tasks[task->tTransitionId], 4);
        ++task->tState;
        return FALSE;
    }
    else
    {
        task->tState = 2;
        return TRUE;
    }
}

static bool8 BT_WaitForPhase1(struct Task *task)
{
    if (FindTaskIdByFunc(sBT_Phase1Tasks[task->tTransitionId]) == TAIL_SENTINEL)
    {
        ++task->tState;
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

static bool8 BT_Phase2LaunchAnimTask(struct Task *task)
{
    CreateTask(sBT_Phase2Tasks[task->tTransitionId], 0);
    ++task->tState;
    return FALSE;
}

static bool8 BT_WaitForPhase2(struct Task *task)
{
    task->tTransitionDone = FALSE;
    if (FindTaskIdByFunc(sBT_Phase2Tasks[task->tTransitionId]) == TAIL_SENTINEL)
        task->tTransitionDone = TRUE;
    return FALSE;
}

static void BT_Phase1Task(u8 taskId)
{
    if (!gTasks[taskId].tState)
    {
        ++gTasks[taskId].tState;
        BT_CreatePhase1SubTask(0, 0, 2, 2, 2);
    }
    else if (BT_IsPhase1Done())
    {
        DestroyTask(taskId);
    }
}

#define tInterval data[1]
#define tMosaicSize data[2]

static void BT_Phase2Blur(u8 taskId)
{
    while (sBT_Phase2BlurFuncs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 BT_Phase2Blur_InitBgMosaic(struct Task *task)
{
    SetGpuReg(REG_OFFSET_MOSAIC, 0);
    SetGpuRegBits(REG_OFFSET_BG1CNT, BGCNT_MOSAIC);
    SetGpuRegBits(REG_OFFSET_BG2CNT, BGCNT_MOSAIC);
    SetGpuRegBits(REG_OFFSET_BG3CNT, BGCNT_MOSAIC);
    ++task->tState;
    return TRUE;
}

static bool8 BT_Phase2Blur_Anim(struct Task *task)
{
    if (task->tInterval)
    {
        --task->tInterval;
    }
    else
    {
        task->tInterval = 2;
        if (++task->tMosaicSize == 10)
            BeginNormalPaletteFade(PALETTES_ALL, -1, 0, 0x10, RGB_BLACK);
        // The mosaic size argument is shared by HSIZE and VSIZE
        SetGpuReg(REG_OFFSET_MOSAIC, (task->tMosaicSize & 0xF) + ((task->tMosaicSize & 0xF) << 4));
        if (task->tMosaicSize > 14)
            ++task->tState;
    }
    return FALSE;
}

static bool8 BT_Phase2Blur_IsDone(struct Task *task)
{
    if (!gPaletteFade.active)
        DestroyTask(FindTaskIdByFunc(BT_Phase2Blur));
    return FALSE;
}

#undef tInterval
#undef tMosaicSize

#define tTheta data[1]
#define tAmplitude data[2]

static void BT_Phase2DistortedWave(u8 taskId)
{
    while (sBT_Phase2DistortedWaveFuncs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 BT_Phase2DistortedWave_InitWave(struct Task *task)
{
    BT_InitCtrlBlk();
    ScanlineEffect_Clear();
    BeginNormalPaletteFade(PALETTES_ALL, 4, 0, 0x10, RGB_BLACK);
    BT_LoadWaveIntoBuffer(gScanlineEffectRegBuffers[1], sTransitionStructPtr->bg123HOfs, 0, 2, 0, 160);
    SetVBlankCallback(VBCB_BT_Phase2DistortedWave);
    SetHBlankCallback(HBCB_BT_Phase2DistortedWave);
    EnableInterrupts(INTR_FLAG_VBLANK | INTR_FLAG_HBLANK);
    ++task->tState;
    return FALSE;
}

static bool8 BT_Phase2DistortedWave_UpdateWave(struct Task *task)
{
    sTransitionStructPtr->vblankDma = FALSE;
    task->tTheta += 4;
    task->tAmplitude += 8;
    BT_LoadWaveIntoBuffer(gScanlineEffectRegBuffers[0], sTransitionStructPtr->bg123HOfs, task->tTheta, 2, task->tAmplitude, 160);
    if (!gPaletteFade.active)
        DestroyTask(FindTaskIdByFunc(BT_Phase2DistortedWave));
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}

static void VBCB_BT_Phase2DistortedWave(void)
{
    BT_VBSyncOamAndPltt();
    if (sTransitionStructPtr->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
}

static void HBCB_BT_Phase2DistortedWave(void)
{
    s16 offset = gScanlineEffectRegBuffers[1][REG_VCOUNT];
    
    REG_BG1HOFS = offset;
    REG_BG2HOFS = offset;
    REG_BG3HOFS = offset;
}

static void BT_Phase2HorizontalCorrugate(u8 taskId)
{
    while (sBT_Phase2HorizontalCorrugateFuncs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 BT_Phase2HorizontalCorrugate_Init(struct Task *task)
{
    BT_InitCtrlBlk();
    ScanlineEffect_Clear();
    BeginNormalPaletteFade(PALETTES_ALL, 4, 0, 0x10, RGB_BLACK);
    memset(gScanlineEffectRegBuffers[1], sTransitionStructPtr->bg123VOfs, 320);
    SetVBlankCallback(VBCB_BT_Phase2HorizontalCorrugate);
    SetHBlankCallback(HBCB_BT_Phase2HorizontalCorrugate);
    EnableInterrupts(INTR_FLAG_VBLANK | INTR_FLAG_HBLANK);
    ++task->tState;
    return FALSE;
}

static bool8 BT_Phase2HorizontalCorrugate_UpdateWave(struct Task *task)
{
    u8 i;
    u16 theta, amplitude;

    sTransitionStructPtr->vblankDma = FALSE;
    theta = task->tTheta;
    amplitude = task->tAmplitude >> 8;
    task->tTheta += 4224;
    task->tAmplitude += 384;
    for (i = 0; i < 160; ++i, theta += 4224)
        gScanlineEffectRegBuffers[0][i] = sTransitionStructPtr->bg123VOfs + Sin(theta / 256, amplitude);
    if (!gPaletteFade.active)
        DestroyTask(FindTaskIdByFunc(BT_Phase2HorizontalCorrugate));
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}

static void VBCB_BT_Phase2HorizontalCorrugate(void)
{
    BT_VBSyncOamAndPltt();
    if (sTransitionStructPtr->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
}

static void HBCB_BT_Phase2HorizontalCorrugate(void)
{
    s16 offset = gScanlineEffectRegBuffers[1][REG_VCOUNT];
    
    REG_BG1VOFS = offset;
    REG_BG2VOFS = offset;
    REG_BG3VOFS = offset;
}

#undef tTheta
#undef tAmplitude

#define tEvb data[1]
#define tEva data[2]
#define tInterval data[3]
#define tTheta data[4]
#define tAmplitude data[5]

static void BT_Phase2BigPokeball(u8 taskId)
{
    while (sBT_Phase2BigPokeballFuncs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 BT_Phase2BigPokeball_Init(struct Task *task)
{
    u16 i, *tilemapAddr, *tilesetAddr;

    BT_InitCtrlBlk();
    ScanlineEffect_Clear();
    task->tEvb = 16;
    task->tEva = 0;
    task-> tTheta = 0;
    task-> tAmplitude = 0x4000;
    sTransitionStructPtr->winIn = WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR;
    sTransitionStructPtr->winOut = 0;
    sTransitionStructPtr->win0H = WIN_RANGE(0, 0xF0);
    sTransitionStructPtr->win0V = WIN_RANGE(0, 0xA0);
    sTransitionStructPtr->bldCnt = BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD;
    sTransitionStructPtr->bldAlpha = (task->tEvb << 8) | task->tEva;
    for (i = 0; i < 160; ++i)
        gScanlineEffectRegBuffers[1][i] = 0xF0;
    SetVBlankCallback(VBCB_BT_Phase2BigPokeball1);
    BT_GetBg0TilemapAndTilesetBase(&tilemapAddr, &tilesetAddr);
    CpuFill16(0, tilemapAddr, 0x800);
    CpuCopy16(sBigPokeballTileset, tilesetAddr, 0x580);
    LoadPalette(sSlidingPokeballBigPokeballPalette, 0xF0, 0x20);
    ++task->tState;
    return FALSE;
}

static bool8 BT_Phase2BigPokeball_LoadTilemapAndWave(struct Task *task)
{
    s16 i, j;
    u16 *tilemapAddr, *tilesetAddr;
    const u16 *BigPokeballMap = sBigPokeballTilemap;

    BT_GetBg0TilemapAndTilesetBase(&tilemapAddr, &tilesetAddr);
    for (i = 0; i < 20; ++i)
        for (j = 0; j < 30; ++j, ++BigPokeballMap)
            tilemapAddr[i * 32 + j] = *BigPokeballMap | 0xF000; // use palette #15
    BT_LoadWaveIntoBuffer(gScanlineEffectRegBuffers[0], 0, task->tTheta, 132, task->tAmplitude, 160);
    ++task->tState;
    return TRUE;
}

static bool8 BT_Phase2BigPokeball_UpdateWave1IncEva(struct Task *task)
{
    sTransitionStructPtr->vblankDma = FALSE;
    if (task->tInterval == 0 || --task->tInterval == 0)
    {
        ++task->tEva;
        task->tInterval = 1; // Broken logic. This makes the condition always TRUE. 
    }
    sTransitionStructPtr->bldAlpha = BLDALPHA_BLEND(task->tEva, task->tEvb);
    // Increment eva until it reaches 50% coeff
    if (task->tEva > 15)
        ++task->tState;
    task->tTheta += 12;
    task->tAmplitude -= 384;
    // Assign a very high frequency value so that 2 adjacent values in gScanlineEffectRegBuffers[0] will have different sign. 
    BT_LoadWaveIntoBuffer(gScanlineEffectRegBuffers[0], 0, task->tTheta, 132, task->tAmplitude >> 8, 160);
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}

static bool8 BT_Phase2BigPokeball_UpdateWave2DecEvb(struct Task *task)
{
    sTransitionStructPtr->vblankDma = FALSE;
    if (task->tInterval == 0 || --task->tInterval == 0)
    {
        --task->tEvb;
        task->tInterval = 2;
    }
    sTransitionStructPtr->bldAlpha = (task->tEvb << 8) | task->tEva;
    if (!task->tEvb)
        ++task->tState;
    if (task->tAmplitude > 0)
    {
        task->tTheta += 12;
        task->tAmplitude -= 384;
    }
    else
    {
        task->tAmplitude = 0;
    }
    BT_LoadWaveIntoBuffer(gScanlineEffectRegBuffers[0], 0, task->tTheta, 132, task->tAmplitude >> 8, 160);
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}

#undef tEvb
#undef tEva
#undef tInterval

#define tRadius data[1]
#define tDeltaRadius data[2]
#define tKeepVBCB data[3]

static bool8 BT_Phase2BigPokeball_UpdateWave3(struct Task *task)
{
    sTransitionStructPtr->vblankDma = FALSE;
    if (task->tAmplitude > 0)
    {
        task->tTheta += 12;
        task->tAmplitude -= 384;
    }
    else
    {
        task->tAmplitude = 0;
    }
    BT_LoadWaveIntoBuffer(gScanlineEffectRegBuffers[0], 0, task->tTheta, 132, task->tAmplitude >> 8, 160);
    if (task->tAmplitude <= 0)
    {
        ++task->tState;
        task->tRadius = 160;
        task->tDeltaRadius = 256;
        task->tKeepVBCB = 0;
    }
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}

static bool8 BT_Phase2BigPokeball_CircleEffect(struct Task *task)
{
    sTransitionStructPtr->vblankDma = FALSE;
    if (task->tDeltaRadius < 2048)
        task->tDeltaRadius += 256;
    if (task->tRadius)
    {
        task->tRadius -= (task->tDeltaRadius >> 8);
        if (task->tRadius < 0)
            task->tRadius = 0;
    }
    BT_GenerateCircle(gScanlineEffectRegBuffers[0], 120, 80, task->tRadius);
    if (task->tRadius == 0)
    {
        DmaStop(0);
        BT_BlendPalettesToBlack();
        DestroyTask(FindTaskIdByFunc(BT_Phase2BigPokeball));
    }
    if (task->tKeepVBCB == 0)
    {
        ++task->tKeepVBCB;
        SetVBlankCallback(VBCB_BT_Phase2BigPokeball2);
    }
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}

static void BT_VBStopDma0SyncSrcBufferSetLcdRegs(void)
{
    DmaStop(0);
    BT_VBSyncOamAndPltt();
    if (sTransitionStructPtr->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
    SetGpuReg(REG_OFFSET_WININ, sTransitionStructPtr->winIn);
    SetGpuReg(REG_OFFSET_WINOUT, sTransitionStructPtr->winOut);
    SetGpuReg(REG_OFFSET_WIN0V, sTransitionStructPtr->win0V);
    SetGpuReg(REG_OFFSET_BLDCNT, sTransitionStructPtr->bldCnt);
    SetGpuReg(REG_OFFSET_BLDALPHA, sTransitionStructPtr->bldAlpha);
}

static void VBCB_BT_Phase2BigPokeball1(void)
{
    BT_VBStopDma0SyncSrcBufferSetLcdRegs();
    DmaSet(0, gScanlineEffectRegBuffers[1], &REG_BG0HOFS, ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_16BIT | DMA_SRC_INC | DMA_DEST_FIXED) << 16) | 1);
}

static void VBCB_BT_Phase2BigPokeball2(void)
{
    BT_VBStopDma0SyncSrcBufferSetLcdRegs();
    DmaSet(0, gScanlineEffectRegBuffers[1], &REG_WIN0H, ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_16BIT | DMA_SRC_INC | DMA_DEST_FIXED) << 16) | 1);
}

#undef tRadius
#undef tDeltaRadius
#undef tKeepVBCB
#undef tTheta
#undef tAmplitude

// TODO: Document this effect after knowing more about field effects. 
static void BT_Phase2SlidingPokeballs(u8 taskId)
{
    while (sBT_Phase2SlidingPokeballsFuncs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 BT_Phase2SlidingPokeballs_LoadBgGfx(struct Task *task)
{
    u16 *tilemapAddr, *tilesetAddr;

    BT_GetBg0TilemapAndTilesetBase(&tilemapAddr, &tilesetAddr);
    CpuCopy16(sSlidingPokeballTilemap, tilesetAddr, 0x40);
    CpuFill32(0, tilemapAddr, 0x800);
    LoadPalette(sSlidingPokeballBigPokeballPalette, 0xF0, 0x20);
    ++task->tState;
    return FALSE;
}

static bool8 BT_Phase2SlidingPokeballs_SetupFldeffArgs(struct Task *task)
{
    s16 i, rand;
    s16 arr0[NELEMS(gUnknown_83FA400)];
    s16 arr1[NELEMS(gUnknown_83FA404)];

    memcpy(arr0, gUnknown_83FA400, sizeof(gUnknown_83FA400));
    memcpy(arr1, gUnknown_83FA404, sizeof(gUnknown_83FA404));
    rand = Random() & 1;
    for (i = 0; i <= 4; ++i, rand ^= 1)
    {
        gFieldEffectArguments[0] = arr0[rand];      // x
        gFieldEffectArguments[1] = (i * 32) + 16;   // y
        gFieldEffectArguments[2] = rand;
        gFieldEffectArguments[3] = arr1[i];
        FieldEffectStart(FLDEFF_POKEBALL);
    }
    ++task->tState;
    return FALSE;
}

static bool8 BT_Phase2SlidingPokeballs_IsDone(struct Task *task)
{
    if (!FieldEffectActiveListContains(FLDEFF_POKEBALL))
    {
        BT_BlendPalettesToBlack();
        DestroyTask(FindTaskIdByFunc(BT_Phase2SlidingPokeballs));
    }
    return FALSE;
}

bool8 FldEff_Pokeball(void)
{
    u8 spriteId = CreateSpriteAtEnd(&sSpriteTemplate_SlidingPokeball, gFieldEffectArguments[0], gFieldEffectArguments[1], 0);
    
    gSprites[spriteId].oam.priority = 0;
    gSprites[spriteId].oam.affineMode = 1;
    gSprites[spriteId].data[0] = gFieldEffectArguments[2];
    gSprites[spriteId].data[1] = gFieldEffectArguments[3];
    gSprites[spriteId].data[2] = -1;
    InitSpriteAffineAnim(&gSprites[spriteId]);
    StartSpriteAffineAnim(&gSprites[spriteId], gFieldEffectArguments[2]);
    return FALSE;
}

#define SOME_VRAM_STORE(ptr, posY, posX, toStore)                       \
{                                                                       \
    u32 index = (posY) * 32 + posX;                                     \
    ptr[index] = toStore;                                               \
}

static void SpriteCB_BT_Phase2SlidingPokeballs(struct Sprite *sprite)
{
    s16 arr0[NELEMS(gUnknown_83FA40E)];

    memcpy(arr0, gUnknown_83FA40E, sizeof(gUnknown_83FA40E));
    if (sprite->data[1])
    {
        --sprite->data[1];
    }
    else
    {
        if ((u16)sprite->x <= 240)
        {
            s16 posX = sprite->x >> 3;
            s16 posY = sprite->y >> 3;

            if (posX != sprite->data[2])
            {
                u16 *ptr;

                sprite->data[2] = posX;
                ptr = (u16 *)BG_SCREEN_ADDR((GetGpuReg(REG_OFFSET_BG0CNT) >> 8) & 0x1F);
                SOME_VRAM_STORE(ptr, posY - 2, posX, 0xF001);
                SOME_VRAM_STORE(ptr, posY - 1, posX, 0xF001);
                SOME_VRAM_STORE(ptr, posY - 0, posX, 0xF001);
                SOME_VRAM_STORE(ptr, posY + 1, posX, 0xF001);
            }
        }
        sprite->x += arr0[sprite->data[0]];
        if (sprite->x < -15 || sprite->x > 255)
            FieldEffectStop(sprite, FLDEFF_POKEBALL);
    }
}

#define trStartPtX data[0]
#define trStartPtY data[1]
#define trCurrentPtX data[2]
#define trCurrentPtY data[3]
#define trEndPtX data[4]
#define trEndPtY data[5]

static void BT_Phase2ClockwiseBlackFade(u8 taskId)
{
    while (sBT_Phase2ClockwiseBlackFadeFuncs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 BT_Phase2ClockwiseBlackFade_Init(struct Task *task)
{
    u16 i;

    BT_InitCtrlBlk();
    ScanlineEffect_Clear();
    sTransitionStructPtr->winIn = 0;
    sTransitionStructPtr->winOut = WINOUT_WIN01_BG_ALL | WINOUT_WIN01_OBJ | WINOUT_WIN01_CLR;
    sTransitionStructPtr->win0H = WIN_RANGE(0xF0, 0xF1);
    sTransitionStructPtr->win0V = WIN_RANGE(0, 0xA0);
    for (i = 0; i < 160; ++i)
        gScanlineEffectRegBuffers[1][i] = WIN_RANGE(0xF3, 0xF4);
    SetVBlankCallback(VBCB_BT_Phase2ClockwiseBlackFade);
    sTransitionStructPtr->trEndPtX = 120;
    ++task->tState;
    return TRUE;
}

static bool8 BT_Phase2ClockwiseBlackFade_Step1(struct Task *task)
{
    sTransitionStructPtr->vblankDma = FALSE;
    BT_DiagonalSegment_InitParams(sTransitionStructPtr->data, 120, 80, sTransitionStructPtr->trEndPtX, -1, 1, 1);
    do
    {
        gScanlineEffectRegBuffers[0][sTransitionStructPtr->trCurrentPtY] = WIN_RANGE(0x78, sTransitionStructPtr->trCurrentPtX + 1);
    }
    while (!BT_DiagonalSegment_ComputePointOnSegment(sTransitionStructPtr->data, TRUE, TRUE));

    sTransitionStructPtr->trEndPtX += 32;
    if (sTransitionStructPtr->trEndPtX >= 240)
    {
        sTransitionStructPtr->trEndPtY = 0;
        ++task->tState;
    }
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}

static bool8 BT_Phase2ClockwiseBlackFade_Step2(struct Task *task)
{
    s16 left, right;
    vu8 finished = FALSE;

    sTransitionStructPtr->vblankDma = FALSE;
    BT_DiagonalSegment_InitParams(sTransitionStructPtr->data, 120, 80, 240, sTransitionStructPtr->trEndPtY, 1, 1);
    while (TRUE)
    {
        left = 120;
        right = sTransitionStructPtr->trCurrentPtX + 1;
        if (sTransitionStructPtr->trEndPtY >= 80)
        {
            left = sTransitionStructPtr->trCurrentPtX;
            right = 240;
        }
        gScanlineEffectRegBuffers[0][sTransitionStructPtr->trCurrentPtY] = WIN_RANGE2(left, right);
        if (finished)
            break;
        finished = BT_DiagonalSegment_ComputePointOnSegment(sTransitionStructPtr->data, TRUE, TRUE);
    }
    sTransitionStructPtr->trEndPtY += 16;
    if (sTransitionStructPtr->trEndPtY >= 160)
    {
        sTransitionStructPtr->trEndPtX = 240;
        ++task->tState;
    }
    else
    {
        while (sTransitionStructPtr->trCurrentPtY < sTransitionStructPtr->trEndPtY)
            gScanlineEffectRegBuffers[0][++sTransitionStructPtr->trCurrentPtY] = WIN_RANGE2(left, right);
    }
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}

static bool8 BT_Phase2ClockwiseBlackFade_Step3(struct Task *task)
{
    sTransitionStructPtr->vblankDma = FALSE;
    BT_DiagonalSegment_InitParams(sTransitionStructPtr->data, 120, 80, sTransitionStructPtr->trEndPtX, 160, 1, 1);
    do
    {
        gScanlineEffectRegBuffers[0][sTransitionStructPtr->trCurrentPtY] = (sTransitionStructPtr->trCurrentPtX << 8) | 0xF0;
    }
    while (!BT_DiagonalSegment_ComputePointOnSegment(sTransitionStructPtr->data, TRUE, TRUE));
    sTransitionStructPtr->trEndPtX -= 32;
    if (sTransitionStructPtr->trEndPtX <= 0)
    {
        sTransitionStructPtr->trEndPtY = 160;
        ++task->tState;
    }
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}

/*
 * BUG: The following 2 functions are incorrect. The animation after 
 * the rotation angle reaches 1.5π will not be displayed. 
 *
 * There're 2 problems which need to be solved in order to correct the logic. 
 * 1. With current setup, nothing is displayed inside WIN0 and everything
 * is displayed outside WIN0. Thus, if the rotation angle is > 1.5π, it
 * won't be able to handle the situation. 
 * 2. The programmer sometimes swapped the place of left and right boundary
 * of WIN0 (see variables left and right), which will sometimes cause right
 * to be smaller than left. In this way, garbage data will be written to WIN0H. 
 */
static bool8 BT_Phase2ClockwiseBlackFade_Step4(struct Task *task)
{
    s16 right, left;
    u16 win0H;
    vu8 finished = FALSE;

    sTransitionStructPtr->vblankDma = FALSE;
    BT_DiagonalSegment_InitParams(sTransitionStructPtr->data, 120, 80, 0, sTransitionStructPtr->trEndPtY, 1, 1);
    while (TRUE)
    {
        right = (gScanlineEffectRegBuffers[0][sTransitionStructPtr->trCurrentPtY]) & 0xFF;
        left = sTransitionStructPtr->trCurrentPtX;
        if (sTransitionStructPtr->trEndPtY <= 80)
        {
            left = 120;
            right = sTransitionStructPtr->trCurrentPtX;
        }
        win0H = WIN_RANGE2(left, right);
        gScanlineEffectRegBuffers[0][sTransitionStructPtr->trCurrentPtY] = win0H;
        if (finished)
            break;
        finished = BT_DiagonalSegment_ComputePointOnSegment(sTransitionStructPtr->data, TRUE, TRUE);
    }
    sTransitionStructPtr->trEndPtY -= 16;
    if (sTransitionStructPtr->trEndPtY <= 0)
    {
        sTransitionStructPtr->trEndPtX = 0;
        ++task->tState;
    }
    else
    {
        while (sTransitionStructPtr->trCurrentPtY > sTransitionStructPtr->trEndPtY)
            gScanlineEffectRegBuffers[0][--sTransitionStructPtr->trCurrentPtY] = WIN_RANGE2(left, right);
    }
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}

static bool8 BT_Phase2ClockwiseBlackFade_Step5(struct Task *task)
{
    s16 left, right;

    sTransitionStructPtr->vblankDma = FALSE;
    BT_DiagonalSegment_InitParams(sTransitionStructPtr->data, 120, 80, sTransitionStructPtr->trEndPtX, 0, 1, 1);
    do
    {
        left = 120;
        right = sTransitionStructPtr->trCurrentPtX;
        if (sTransitionStructPtr->trCurrentPtX >= 120)
        {
            left = 0;
            right = 240;
        }
        gScanlineEffectRegBuffers[0][sTransitionStructPtr->trCurrentPtY] = WIN_RANGE2(left, right);
    }
    while (!BT_DiagonalSegment_ComputePointOnSegment(sTransitionStructPtr->data, TRUE, TRUE));
    sTransitionStructPtr->trEndPtX += 32;
    if (sTransitionStructPtr->trCurrentPtX > 120)
        ++task->tState;
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}

static bool8 BT_Phase2ClockwiseBlackFade_End(struct Task *task)
{
    DmaStop(0);
    BT_BlendPalettesToBlack();
    DestroyTask(FindTaskIdByFunc(BT_Phase2ClockwiseBlackFade));
    return FALSE;
}

static void VBCB_BT_Phase2ClockwiseBlackFade(void)
{
    DmaStop(0);
    BT_VBSyncOamAndPltt();
    if (sTransitionStructPtr->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
    SetGpuReg(REG_OFFSET_WININ, sTransitionStructPtr->winIn);
    SetGpuReg(REG_OFFSET_WINOUT, sTransitionStructPtr->winOut);
    SetGpuReg(REG_OFFSET_WIN0V, sTransitionStructPtr->win0V);
    SetGpuReg(REG_OFFSET_WIN0H, gScanlineEffectRegBuffers[1][0]);
    DmaSet(0, gScanlineEffectRegBuffers[1], &REG_WIN0H, ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_16BIT | DMA_SRC_INC | DMA_DEST_FIXED) << 16) | 1);
}

#undef trStartPtX
#undef trStartPtY
#undef trCurrentPtX
#undef trCurrentPtY
#undef trEndPtX
#undef trEndPtY

#define tTheta data[1]
#define tAmplitude data[2]
#define tDelayForFade data[3]
#define tStartFade data[4]

static void BT_Phase2FullScreenWave(u8 taskId)
{
    while (sBT_Phase2FullScreenWaveFuncs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 BT_Phase2FullScreenWave_Init(struct Task *task)
{
    u8 i;

    BT_InitCtrlBlk();
    ScanlineEffect_Clear();
    for (i = 0; i < 160; ++i)
        gScanlineEffectRegBuffers[1][i] = sTransitionStructPtr->bg123VOfs;
    SetVBlankCallback(VBCB_BT_Phase2FullScreenWave);
    SetHBlankCallback(HBCB_BT_Phase2FullScreenWave);
    EnableInterrupts(INTR_FLAG_HBLANK);
    ++task->tState;
    return TRUE;
}

static bool8 BT_Phase2FullScreenWave_UpdateWave(struct Task *task)
{
    u8 i;
    s16 amplitude;
    u16 theta, frequency;

    sTransitionStructPtr->vblankDma = FALSE;
    amplitude = task->tAmplitude >> 8;
    theta = task->tTheta;
    frequency = 384;
    task->tTheta += 0x400;
    if (task->tAmplitude <= 0x1FFF)
        task->tAmplitude += 384;
    for (i = 0; i < 160; ++i, theta += frequency)
    {
        s16 var = theta >> 8;
        
        ++var;
        --var;
        gScanlineEffectRegBuffers[0][i] = sTransitionStructPtr->bg123VOfs + Sin(var, amplitude);
    }
    if (++task->tDelayForFade == 41)
    {
        ++task->tStartFade;
        BeginNormalPaletteFade(PALETTES_ALL, -8, 0, 0x10, RGB_BLACK);
    }
    if (task->tStartFade && !gPaletteFade.active)
        DestroyTask(FindTaskIdByFunc(BT_Phase2FullScreenWave));
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}

static void VBCB_BT_Phase2FullScreenWave(void)
{
    BT_VBSyncOamAndPltt();
    if (sTransitionStructPtr->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
}

static void HBCB_BT_Phase2FullScreenWave(void)
{
    s16 offset = gScanlineEffectRegBuffers[1][REG_VCOUNT];
    
    REG_BG1VOFS = offset;
    REG_BG2VOFS = offset;
    REG_BG3VOFS = offset;
}

#undef tTheta
#undef tAmplitude
#undef tDelayForFade
#undef tStartFade

#define tOffset data[1]
#define tTheta data[2]

static void BT_Phase2BlackWaveToRight(u8 taskId)
{
    while (sBT_Phase2BlackWaveToRightFuncs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 BT_Phase2BlackWaveToRight_Init(struct Task *task)
{
    u8 i;

    BT_InitCtrlBlk();
    ScanlineEffect_Clear();
    sTransitionStructPtr->winIn = WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR;
    sTransitionStructPtr->winOut = 0;
    sTransitionStructPtr->win0H = WIN_RANGE(0, 0xF0);
    sTransitionStructPtr->win0V = WIN_RANGE(0, 0xA0);
    for (i = 0; i < 160; ++i)
        gScanlineEffectRegBuffers[1][i] = WIN_RANGE(0, 0xF2);
    SetVBlankCallback(VBCB_BT_Phase2BlackWaveToRight);
    ++task->tState;
    return TRUE;
}

static bool8 BT_Phase2BlackWaveToRight_UpdateWave(struct Task *task)
{
    u8 i, theta;
    u16 *winVal;
    bool8 nextFunc;

    sTransitionStructPtr->vblankDma = FALSE;
    winVal = gScanlineEffectRegBuffers[0];
    theta = task->tTheta;
    task->tTheta += 16;
    task->tOffset += 8;
    for (i = 0, nextFunc = TRUE; i < 160; ++i, theta += 4, ++winVal)
    {
        s16 left = task->tOffset + Sin(theta, 40);
        if (left < 0)
            left = 0;
        if (left > 240)
            left = 240;
        *winVal = WIN_RANGE(left, 0xF1);
        if (left < 240)
            nextFunc = FALSE;
    }
    if (nextFunc)
        ++task->tState;
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}

static bool8 BT_Phase2BlackWaveToRight_End(struct Task *task)
{
    DmaStop(0);
    BT_BlendPalettesToBlack();
    DestroyTask(FindTaskIdByFunc(BT_Phase2BlackWaveToRight));
    return FALSE;
}

static void VBCB_BT_Phase2BlackWaveToRight(void)
{
    DmaStop(0);
    BT_VBSyncOamAndPltt();
    if (sTransitionStructPtr->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
    SetGpuReg(REG_OFFSET_WININ, sTransitionStructPtr->winIn);
    SetGpuReg(REG_OFFSET_WINOUT, sTransitionStructPtr->winOut);
    SetGpuReg(REG_OFFSET_WIN0V, sTransitionStructPtr->win0V);
    DmaSet(0, gScanlineEffectRegBuffers[1], &REG_WIN0H, ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_SRC_INC | DMA_DEST_FIXED) << 16) | 1);
}

#undef tOffset
#undef tTheta

// Unused

static void BT_Phase2AntiClockwiseSpiral(u8 taskId)
{
    while (sBT_Phase2AntiClockwiseSpiralFuncs[gTasks[taskId].tState](&gTasks[taskId]));
}

static void BT_AntiClockwiseSpiral_DoUpdateFrame(s16 initRadius, s16 deltaAngleMax, u8 offsetMaybe)
{
    u8 theta = 0;
    s16 i, amplitude1, amplitude2;
    s16 y1, x1, y2, x2;

    for (i = 320; i < 960; ++i)
        gScanlineEffectRegBuffers[1][i] = 120;

    for (i = 0; i < (deltaAngleMax * 16); ++i, ++theta)
    {
        amplitude1 = initRadius + (theta >> 3);
        if ((theta >> 3) != ((theta + 1) >> 3))
        {
            amplitude2 = amplitude1 + 1;
        }
        else
        {
            amplitude2 = amplitude1;
        }

        y1 = 80 - Sin(theta, amplitude1);
        x1 = Cos(theta, amplitude1) + 120;
        y2 = 80 - Sin(theta + 1, amplitude2);
        x2 = Cos(theta + 1, amplitude2) + 120;

        if (y1 < 0 && y2 < 0)
            continue;
        if (y1 > 159 && y2 > 159)
            continue;

        if (y1 < 0)
            y1 = 0;
        if (y1 > 159)
            y1 = 159;
        if (x1 < 0)
            x1 = 0;
        if (x1 > 255)
            x1 = 255;
        if (y2 < 0)
            y2 = 0;
        if (y2 > 159)
            y2 = 159;
        if (x2 < 0)
            x2 = 0;
        if (x2 > 255)
            x2 = 255;

        y2 -= y1;

        if (theta >= 64 && theta < 192)
        {
            gScanlineEffectRegBuffers[1][y1 + 320] = x1;

            if (y2 == 0)
                continue;

            x2 -= x1;
            if (x2 < -1 && x1 > 1)
                --x1;
            else if (x2 > 1 && x1 < 255)
                ++x1;

            if (y2 < 0)
                for (; y2 < 0; y2++)
                    gScanlineEffectRegBuffers[1][y1 + y2 + 320] = x1;
            else
                for (; y2 > 0; y2--)
                    gScanlineEffectRegBuffers[1][y1 + y2 + 320] = x1;
        }
        else
        {
            gScanlineEffectRegBuffers[1][y1 + 480] = x1;

            if (y2 == 0)
                continue;

            x2 -= x1;
            if (x2 < -1 && x1 > 1)
                --x1;
            else if (x2 > 1 && x1 < 255)
                ++x1;

            if (y2 < 0)
                for (; y2 < 0; y2++)
                    gScanlineEffectRegBuffers[1][y1 + y2 + 480] = x1;
            else
                for (; y2 > 0; y2--)
                    gScanlineEffectRegBuffers[1][y1 + y2 + 480] = x1;
        }
    }

    if (offsetMaybe == 0 || deltaAngleMax % 4 == 0)
    {
        for (i = 0; i < 160; i++)
        {
            gScanlineEffectRegBuffers[1][i * 2 + offsetMaybe] = gScanlineEffectRegBuffers[1][i + 320] << 8 | gScanlineEffectRegBuffers[1][i + 480];
        }
        return;
    }

    y1 = Sin(deltaAngleMax * 16, initRadius + (deltaAngleMax << 1));

    switch (deltaAngleMax / 4)
    {
    case 0:
        if (y1 > 80)
            y1 = 80;
        for (i = y1; i > 0; i--)
        {
            sTransitionStructPtr->data[2] = x1 = ((i * gUnknown_83FA444[deltaAngleMax]) >> 8) + 120;
            if (x1 < 0 || x1 > 255)
                continue;
            sTransitionStructPtr->bg123HOfs = 400 - i;
            sTransitionStructPtr->data[10] = gScanlineEffectRegBuffers[1][400 - i];
            if (gScanlineEffectRegBuffers[1][560 - i] < x1)
                gScanlineEffectRegBuffers[1][560 - i] = 120;
            else if (gScanlineEffectRegBuffers[1][400 - i] < x1)
                gScanlineEffectRegBuffers[1][400 - i] = x1;
        }
        break;
    case 1:
        if (y1 > 80)
            y1 = 80;
        for (i = y1; i > 0; i--)
        {
            sTransitionStructPtr->data[2] = x1 = ((i * gUnknown_83FA444[deltaAngleMax]) >> 8) + 120;
            if (x1 < 0 || x1 > 255)
                continue;
            sTransitionStructPtr->bg123HOfs = 400 - i;
            sTransitionStructPtr->data[10] = gScanlineEffectRegBuffers[1][400 - i];
            if (gScanlineEffectRegBuffers[1][400 - i] < x1)
                gScanlineEffectRegBuffers[1][400 - i] = x1;
        }
        break;
    case 2:
        if (y1 < -79)
            y1 = -79;
        for (i = y1; i <= 0; i++)
        {
            sTransitionStructPtr->data[2] = x1 = ((i * gUnknown_83FA444[deltaAngleMax]) >> 8) + 120;
            if (x1 < 0 || x1 > 255)
                continue;
            sTransitionStructPtr->bg123HOfs = 560 - i;
            sTransitionStructPtr->data[10] = gScanlineEffectRegBuffers[1][560 - i];
            if (gScanlineEffectRegBuffers[1][400 - i] >= x1)
                gScanlineEffectRegBuffers[1][400 - i] = 120;
            else if (gScanlineEffectRegBuffers[1][560 - i] > x1)
                gScanlineEffectRegBuffers[1][560 - i] = x1;
        }
        break;
    case 3:
        if (y1 < -79)
            y1 = -79;
        for (i = y1; i <= 0; i++)
        {
            sTransitionStructPtr->data[2] = x1 = ((i * gUnknown_83FA444[deltaAngleMax]) >> 8) + 120;
            if (x1 < 0 || x1 > 255)
                continue;
            sTransitionStructPtr->bg123HOfs = 560 - i;
            sTransitionStructPtr->data[10] = gScanlineEffectRegBuffers[1][560 - i];
            if (gScanlineEffectRegBuffers[1][560 - i] > x1)
                gScanlineEffectRegBuffers[1][560 - i] = x1;
        }
        break;
    default:
        break;
    }

    for (i = 0; i < 160; i++)
    {
        gScanlineEffectRegBuffers[1][i * 2 + offsetMaybe] = (gScanlineEffectRegBuffers[1][i + 320] << 8) | gScanlineEffectRegBuffers[1][i + 480];
    }
}

static bool8 BT_Phase2AntiClockwiseSpiral_Init(struct Task *task)
{
    BT_InitCtrlBlk();
    ScanlineEffect_Clear();
    sTransitionStructPtr->winIn = 0;
    sTransitionStructPtr->winOut = WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR;
    sTransitionStructPtr->win0H = WIN_RANGE(0x78, 0x78);
    sTransitionStructPtr->win0V = WIN_RANGE(0x30, 0x70);
    sTransitionStructPtr->win1V = WIN_RANGE(0x10, 0x90);
    sTransitionStructPtr->counter = 0;
    BT_AntiClockwiseSpiral_DoUpdateFrame(0, 0, 0);
    BT_AntiClockwiseSpiral_DoUpdateFrame(0, 0, 1);
    DmaCopy16(3, gScanlineEffectRegBuffers[1], gScanlineEffectRegBuffers[0], 640);
    SetVBlankCallback(VBCB_BT_Phase2AntiClockwiseBlackFade);
    ++task->tState;
    task->data[1] = 0;
    task->data[2] = 0;
    return FALSE;
}

static bool8 BT_Phase2AntiClockwiseSpiral_Update(struct Task *task)
{
    s16 win_top, win_bottom;

    BT_AntiClockwiseSpiral_DoUpdateFrame(task->data[2], task->data[1], 1);
    sTransitionStructPtr->vblankDma |= TRUE;
    if (++task->data[1] == 17)
    {
        BT_AntiClockwiseSpiral_DoUpdateFrame(task->data[2], 16, 0);
        win_top = 48 - task->data[2];
        if (win_top < 0)
            win_top = 0;
        win_bottom = task->data[2] + 112;
        if (win_bottom > 255)
            win_bottom = 255;
        sTransitionStructPtr->win0V = win_top | win_bottom; // UB: win_top should be shifted
        task->data[2] += 32;
        task->data[1] = 0;
        BT_AntiClockwiseSpiral_DoUpdateFrame(task->data[2], 0, 1);
        win_top = 48 - task->data[2];
        if (win_top < 0)
            win_top = 0;
        win_bottom = task->data[2] + 112;
        if (win_bottom > 255)
            win_bottom = 255;
        sTransitionStructPtr->win1V = win_top | win_bottom; // UB: win_top should be shifted
        sTransitionStructPtr->vblankDma |= TRUE;
        if (task->data[2] > 159)
        {
            sTransitionStructPtr->counter = 1;
            BT_BlendPalettesToBlack();
        }
    }
    return FALSE;
}

static void VBCB_BT_Phase2AntiClockwiseBlackFade(void)
{
    DmaStop(0);
    BT_VBSyncOamAndPltt();
    if (sTransitionStructPtr->counter)
    {
        DestroyTask(FindTaskIdByFunc(BT_Phase2AntiClockwiseSpiral));
    }
    else
    {
        if (sTransitionStructPtr->vblankDma)
        {
            DmaCopy16(3, gScanlineEffectRegBuffers[1], gScanlineEffectRegBuffers[0], 640);
            sTransitionStructPtr->vblankDma = FALSE;
        }
        SetGpuReg(REG_OFFSET_WININ, sTransitionStructPtr->winIn);
        SetGpuReg(REG_OFFSET_WINOUT, sTransitionStructPtr->winOut);
        SetGpuReg(REG_OFFSET_WIN0V, sTransitionStructPtr->win0V);
        SetGpuReg(REG_OFFSET_WIN1V, sTransitionStructPtr->win1V);
        SetGpuReg(REG_OFFSET_WIN0H, gScanlineEffectRegBuffers[0][0]);
        SetGpuReg(REG_OFFSET_WIN1H, gScanlineEffectRegBuffers[0][1]);
        DmaSet(0, gScanlineEffectRegBuffers[0], &REG_WIN0H, ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_32BIT | DMA_SRC_INC | DMA_DEST_FIXED) << 16) | 1);
    }
}

#define tTheta data[1]
#define tbg0HOfsOpponent data[2]
#define tbg0HOfsPlayer data[3]
#define tCounter data[3]
#define tHalfBandwidth data[4]
#define tOpponentSpriteId data[13]
#define tPlayerSpriteId data[14]
#define tWhichMugshot data[15]

#define spState data[0]
#define spSpeed data[1]
#define spAbsAcc data[2]
#define sphasSlideFinished data[6]
#define spOpponentOrPlayer data[7]

static void BT_Phase2StartLoreleiMugshot(u8 taskId)
{
    gTasks[taskId].tWhichMugshot = MUGSHOT_LORELEI;
    BT_Phase2Mugshot(taskId);
}

static void BT_Phase2StartBrunoMugshot(u8 taskId)
{
    gTasks[taskId].tWhichMugshot = MUGSHOT_BRUNO;
    BT_Phase2Mugshot(taskId);
}

static void BT_Phase2StartAgathaMugshot(u8 taskId)
{
    gTasks[taskId].tWhichMugshot = MUGSHOT_AGATHA;
    BT_Phase2Mugshot(taskId);
}

static void BT_Phase2StartLanceMugshot(u8 taskId)
{
    gTasks[taskId].tWhichMugshot = MUGSHOT_LANCE;
    BT_Phase2Mugshot(taskId);
}

static void BT_Phase2StartBlueMugshot(u8 taskId)
{
    gTasks[taskId].tWhichMugshot = MUGSHOT_BLUE;
    BT_Phase2Mugshot(taskId);
}

static void BT_Phase2Mugshot(u8 taskId)
{
    while (sBT_Phase2MugshotFuncs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 BT_Phase2Mugshot_Init(struct Task *task)
{
    u8 i;

    BT_InitCtrlBlk();
    ScanlineEffect_Clear();
    BT_Phase2Mugshots_CreateSprites(task);
    task->tTheta = 0;
    task->tbg0HOfsOpponent = 1;
    task->tbg0HOfsPlayer = 239;
    sTransitionStructPtr->winIn = WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR;
    sTransitionStructPtr->winOut = WININ_WIN0_BG1 | WININ_WIN0_BG2 | WININ_WIN0_BG3 | WININ_WIN0_OBJ | WININ_WIN0_CLR;
    sTransitionStructPtr->win0V = WIN_RANGE(0, 0xA0);
    for (i = 0; i < 160; ++i)
        gScanlineEffectRegBuffers[1][i] = WIN_RANGE(0xF0, 0xF1);
    SetVBlankCallback(VBCB_BT_Phase2Mugshot1_Slide);
    ++task->tState;
    return FALSE;
}

static bool8 BT_Phase2Mugshot_LoadGfx(struct Task *task)
{
    s16 i, j;
    u16 *tilemapAddr, *tilesetAddr;
    const u16 *mugshotsMap = sVsBarTilemap;
    
    BT_GetBg0TilemapAndTilesetBase(&tilemapAddr, &tilesetAddr);
    CpuCopy16(sVsBarTileset, tilesetAddr, 0x1E0);
    LoadPalette(sVsBarOpponentPalettes[task->tWhichMugshot], 0xF0, 0x20);
    LoadPalette(sVsBarPlayerPalettes[gSaveBlock2Ptr->playerGender], 0xFA, 0xC);
    for (i = 0; i < 20; ++i)
        for (j = 0; j < 32; ++j, ++mugshotsMap)
            tilemapAddr[i * 32 + j] = *mugshotsMap | 0xF000; // use palette #15
    EnableInterrupts(INTR_FLAG_HBLANK);
    SetHBlankCallback(HBCB_BT_Phase2Mugshot);
    ++task->tState;
    return FALSE;
}

static bool8 BT_Phase2Mugshot_VsBarsSlideIn(struct Task *task)
{
    u8 i, theta;
    u16 *winVal;
    s16 value;
    s32 mergedBg0hOfs;

    sTransitionStructPtr->vblankDma = FALSE;

    winVal = gScanlineEffectRegBuffers[0];
    theta = task->tTheta;
    task->tTheta += 0x10;
    for (i = 0; i < 80; ++i, ++winVal, theta += 0x10)
    {
        value = task->tbg0HOfsOpponent + Sin(theta, 0x10);
        if (value < 0)
            value = 1;
        if (value > 0xF0)
            value = 0xF0;
        *winVal = value;
    }
    for (; i < 160; ++i, ++winVal, theta += 0x10)
    {
        value = task->tCounter - Sin(theta, 0x10);
        if (value < 0)
            value = 0;
        if (value > 0xEF)
            value = 0xEF;
        *winVal = (value << 8) | (0xF0);
    }
    task->tbg0HOfsOpponent += 8;
    task->tCounter -= 8;
    if (task->tbg0HOfsOpponent > 0xF0)
        task->tbg0HOfsOpponent = 0xF0;
    if (task->tCounter < 0)
        task->tCounter = 0;
    mergedBg0hOfs = *(s32 *)(&task->tbg0HOfsOpponent);
    if (mergedBg0hOfs == 0x00F0)
        ++task->tState;
    sTransitionStructPtr->bg0HOfsOpponent -= 8;
    sTransitionStructPtr->bg0HOfsPlayer += 8;
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}

static bool8 BT_Phase2Mugshot_StartSpriteSlide(struct Task *task)
{
    u8 i;
    u16 *winVal;

    sTransitionStructPtr->vblankDma = FALSE;
    for (i = 0, winVal = gScanlineEffectRegBuffers[0]; i < 160; ++i, ++winVal)
        *winVal = 0xF0;
    ++task->tState;
    task->tTheta = 0;
    task->tbg0HOfsOpponent = 0;
    task->tbg0HOfsPlayer = 0;
    sTransitionStructPtr->bg0HOfsOpponent -= 8;
    sTransitionStructPtr->bg0HOfsPlayer += 8;
    BT_SetSpriteAsOpponentOrPlayer(task->tOpponentSpriteId, FALSE);
    BT_SetSpriteAsOpponentOrPlayer(task->tPlayerSpriteId, TRUE);
    BT_StartSpriteSlide(task->tOpponentSpriteId);
    PlaySE(SE_MUGSHOT);
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}

static bool8 BT_Phase2Mugshot_WaitForOpponentInPlace(struct Task *task)
{
    sTransitionStructPtr->bg0HOfsOpponent -= 8;
    sTransitionStructPtr->bg0HOfsPlayer += 8;
    if (BT_IsSpriteSlideFinished(task->tOpponentSpriteId))
    {
        ++task->tState;
        BT_StartSpriteSlide(task->tPlayerSpriteId);
    }
    return FALSE;
}

static bool8 BT_Phase2Mugshot_WaitForPlayerInPlace(struct Task *task)
{
    sTransitionStructPtr->bg0HOfsOpponent -= 8;
    sTransitionStructPtr->bg0HOfsPlayer += 8;
    if (BT_IsSpriteSlideFinished(task->tPlayerSpriteId))
    {
        sTransitionStructPtr->vblankDma = FALSE;
        SetVBlankCallback(NULL);
        DmaStop(0);
        memset(gScanlineEffectRegBuffers[0], 0, 320);
        memset(gScanlineEffectRegBuffers[1], 0, 320);
        SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(0, 0xF0));
        SetGpuReg(REG_OFFSET_BLDY, 0);
        ++task->tState;
        task->tCounter = 0;
        task->tHalfBandwidth = 0;
        sTransitionStructPtr->bldCnt = BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_LIGHTEN;
        SetVBlankCallback(VBCB_BT_Phase2Mugshot2_WhiteFade);
    }
    return FALSE;
}

static bool8 BT_Phase2Mugshot_ExpandWhiteBand(struct Task *task)
{
    bool32 nextFunc;

    sTransitionStructPtr->vblankDma = FALSE;
    nextFunc = TRUE;
    sTransitionStructPtr->bg0HOfsOpponent -= 8;
    sTransitionStructPtr->bg0HOfsPlayer += 8;
    if (task->tHalfBandwidth < 80)
        task->tHalfBandwidth += 2;
    if (task->tHalfBandwidth > 80)
        task->tHalfBandwidth = 80;
    if (++task->tCounter & 1)
    {
        s16 i;

        for (i = 0, nextFunc = FALSE; i <= task->tHalfBandwidth; ++i)
        {
            s16 y1 = 80 - i;
            s16 y2 = 80 + i;

            if (gScanlineEffectRegBuffers[0][y1] <= 15)
            {
                nextFunc = TRUE;
                ++gScanlineEffectRegBuffers[0][y1];
            }
            if (gScanlineEffectRegBuffers[0][y2] <= 15)
            {
                nextFunc = TRUE;
                ++gScanlineEffectRegBuffers[0][y2];
            }
        }
    }
    if (task->tHalfBandwidth == 80 && !nextFunc)
        ++task->tState;
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}

static bool8 BT_Phase2Mugshot_StartBlackFade(struct Task *task)
{
    sTransitionStructPtr->vblankDma = FALSE;
    BlendPalettes(PALETTES_ALL, 0x10, RGB_WHITE);
    sTransitionStructPtr->bldCnt = BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_DARKEN;
    task->tCounter = 0;
    ++task->tState;
    return TRUE;
}

static bool8 BT_Phase2Mugshot_WaitForBlackFade(struct Task *task)
{
    sTransitionStructPtr->vblankDma = FALSE;
    ++task->tCounter;
    memset(gScanlineEffectRegBuffers[0], task->tCounter, 320);
    if (task->tCounter > 15)
        ++task->tState;
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}

static bool8 BT_Phase2Mugshot_End(struct Task *task)
{
    DmaStop(0);
    BT_BlendPalettesToBlack();
    DestroyTask(FindTaskIdByFunc(task->func));
    return FALSE;
}

static void VBCB_BT_Phase2Mugshot1_Slide(void)
{
    DmaStop(0);
    BT_VBSyncOamAndPltt();
    if (sTransitionStructPtr->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
    SetGpuReg(REG_OFFSET_BG0VOFS, sTransitionStructPtr->bg0VOfs);
    SetGpuReg(REG_OFFSET_WININ, sTransitionStructPtr->winIn);
    SetGpuReg(REG_OFFSET_WINOUT, sTransitionStructPtr->winOut);
    SetGpuReg(REG_OFFSET_WIN0V, sTransitionStructPtr->win0V);
    DmaSet(0, gScanlineEffectRegBuffers[1], &REG_WIN0H, ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_SRC_INC | DMA_DEST_FIXED) << 16) | 1);
}

static void VBCB_BT_Phase2Mugshot2_WhiteFade(void)
{
    DmaStop(0);
    BT_VBSyncOamAndPltt();
    if (sTransitionStructPtr->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
    SetGpuReg(REG_OFFSET_BLDCNT, sTransitionStructPtr->bldCnt);
    DmaSet(0, gScanlineEffectRegBuffers[1], &REG_BLDY, ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_SRC_INC | DMA_DEST_FIXED) << 16) | 1);
}

static void HBCB_BT_Phase2Mugshot(void)
{
    if (REG_VCOUNT < 80)
        REG_BG0HOFS = sTransitionStructPtr->bg0HOfsOpponent;
    else
        REG_BG0HOFS = sTransitionStructPtr->bg0HOfsPlayer;
}


static void BT_Phase2Mugshots_CreateSprites(struct Task *task)
{
    struct Sprite *opponentSprite, *playerSprite;
    s16 mugshotId;

    gReservedSpritePaletteCount = 10;
    mugshotId = task->tWhichMugshot;
    task->tOpponentSpriteId = CreateTrainerSprite(sMugshotsTrainerPicIDsTable[mugshotId], sMugshotsOpponentCoords[mugshotId][0] - 32, sMugshotsOpponentCoords[mugshotId][1] + 42, 0, gDecompressionBuffer);
    task->tPlayerSpriteId = CreateTrainerSprite(PlayerGenderToFrontTrainerPicId_Debug(gSaveBlock2Ptr->playerGender, TRUE), 272, 106, 0, gDecompressionBuffer);
    gReservedSpritePaletteCount = 12;
    opponentSprite = &gSprites[task->tOpponentSpriteId];
    playerSprite = &gSprites[task->tPlayerSpriteId];
    opponentSprite->callback = SpriteCB_BT_Phase2Mugshots;
    playerSprite->callback = SpriteCB_BT_Phase2Mugshots;
    opponentSprite->oam.affineMode = 3;
    playerSprite->oam.affineMode = 3;
    opponentSprite->oam.matrixNum = AllocOamMatrix();
    playerSprite->oam.matrixNum = AllocOamMatrix();
    opponentSprite->oam.shape = 1;
    playerSprite->oam.shape = 1;
    opponentSprite->oam.size = 3;
    playerSprite->oam.size = 3;
    CalcCenterToCornerVec(opponentSprite, 1, 3, 3);
    CalcCenterToCornerVec(playerSprite, 1, 3, 3);
    SetOamMatrixRotationScaling(opponentSprite->oam.matrixNum, sMugshotsOpponentRotationScales[mugshotId][0], sMugshotsOpponentRotationScales[mugshotId][1], 0);
    SetOamMatrixRotationScaling(playerSprite->oam.matrixNum, -512, 512, 0);
}

static void SpriteCB_BT_Phase2Mugshots(struct Sprite *sprite)
{
    while (sBT_Phase2MugshotSpriteFuncs[sprite->spState](sprite));
}

static bool8 BT_Phase2MugshotsSpriteFuncs_Wait(struct Sprite *sprite)
{
    return FALSE;
}

static bool8 BT_Phase2MugshotsSpriteFuncs_InitParams(struct Sprite *sprite)
{
    s16 arr0[2];
    s16 arr1[2];

    memcpy(arr0, sMugShotSlideVelocity, sizeof(sMugShotSlideVelocity));
    memcpy(arr1, sMugShotSlideDeceleration, sizeof(sMugShotSlideDeceleration));
    ++sprite->spState;
    sprite->spSpeed = arr0[sprite->spOpponentOrPlayer];
    sprite->spAbsAcc = arr1[sprite->spOpponentOrPlayer];
    return TRUE;
}

static bool8 BT_Phase2MugshotsSpriteFuncs_SlideSpriteIn(struct Sprite *sprite)
{
    sprite->x += sprite->spSpeed;
    if (sprite->spOpponentOrPlayer && sprite->x < 133)
        ++sprite->spState;
    else if (!sprite->spOpponentOrPlayer && sprite->x > 103)
        ++sprite->spState;
    return FALSE;
}

static bool8 BT_Phase2MugshotsSpriteFuncs_DecelerateSprite(struct Sprite *sprite)
{
    sprite->spSpeed += sprite->spAbsAcc;
    sprite->x += sprite->spSpeed;
    if (sprite->spSpeed == 0)
    {
        ++sprite->spState;
        sprite->spAbsAcc = -sprite->spAbsAcc;
        sprite->sphasSlideFinished = 1;
    }
    return FALSE;
}

// not used
static bool8 BT_Phase2MugshotsSpriteFuncs_DecelerateSprite2(struct Sprite *sprite)
{
    sprite->spSpeed += sprite->spAbsAcc;
    sprite->x += sprite->spSpeed;
    if (sprite->x < -31 || sprite->x > 271)
        ++sprite->spState;
    return FALSE;
}

static void BT_SetSpriteAsOpponentOrPlayer(s16 spriteId, bool16 value)
{
    gSprites[spriteId].spOpponentOrPlayer = value;
}

static void BT_StartSpriteSlide(s16 spriteId)
{
    ++gSprites[spriteId].spState;
}

static s16 BT_IsSpriteSlideFinished(s16 spriteId)
{
    return gSprites[spriteId].sphasSlideFinished;
}

#undef tTheta
#undef tbg0HOfsOpponent
#undef tbg0HOfsPlayer
#undef tCounter
#undef tHalfBandwidth
#undef tOpponentSpriteId
#undef tPlayerSpriteId
#undef tWhichMugshot

#undef spState
#undef spSpeed
#undef spAbsAcc
#undef sphasSlideFinished
#undef spOpponentOrPlayer

#define tSpeed data[1]
#define tAcc data[2]
#define tJerk data[3]

static void BT_Phase2SlicedScreen(u8 taskId)
{
    while (sBT_Phase2SlicedScreenFuncs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 BT_Phase2SlicedScreen_Init(struct Task *task)
{
    u16 i;

    BT_InitCtrlBlk();
    ScanlineEffect_Clear();
    task->tAcc = 256;
    task->tJerk = 1;
    sTransitionStructPtr->winIn = WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR;
    sTransitionStructPtr->winOut = 0;
    sTransitionStructPtr->win0V = WIN_RANGE(0, 0xA0);
    for (i = 0; i < 160; ++i)
    {
        gScanlineEffectRegBuffers[1][i] = sTransitionStructPtr->bg123HOfs;
        gScanlineEffectRegBuffers[1][160 + i] = 0xF0;
    }
    EnableInterrupts(INTR_FLAG_HBLANK);
    SetVBlankCallback(VBCB_BT_Phase2SlicedScreen);
    SetHBlankCallback(HBCB_BT_Phase2SlicedScreen);
    ++task->tState;
    return TRUE;
}

static bool8 BT_Phase2SlicedScreen_UpdateOffsets(struct Task *task)
{
    u16 i;

    sTransitionStructPtr->vblankDma = FALSE;
    task->tSpeed += (task->tAcc >> 8);
    if (task->tSpeed > 0xF0)
        task->tSpeed = 0xF0;
    if (task->tAcc <= 0xFFF)
        task->tAcc += task->tJerk;
    if (task->tJerk < 128)
        task->tJerk <<= 1;
    for (i = 0; i < 160; ++i)
    {
        u16 *ofsBuffer = &gScanlineEffectRegBuffers[0][i];
        u16 *win0HBuffer = &gScanlineEffectRegBuffers[0][i + 160];
        if (i & 1)
        {
            *ofsBuffer = sTransitionStructPtr->bg123HOfs + task->tSpeed;
            *win0HBuffer = 0xF0 - task->tSpeed;
        }
        else
        {
            *ofsBuffer = sTransitionStructPtr->bg123HOfs - task->tSpeed;
            *win0HBuffer = WIN_RANGE(task->tSpeed, 0xF1);
        }
    }
    if (task->tSpeed > 0xEF)
        ++task->tState;
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}

static bool8 BT_Phase2SlicedScreen_End(struct Task *task)
{
    DmaStop(0);
    BT_BlendPalettesToBlack();
    DestroyTask(FindTaskIdByFunc(BT_Phase2SlicedScreen));
    return FALSE;
}

static void VBCB_BT_Phase2SlicedScreen(void)
{
    DmaStop(0);
    BT_VBSyncOamAndPltt();
    SetGpuReg(REG_OFFSET_WININ, sTransitionStructPtr->winIn);
    SetGpuReg(REG_OFFSET_WINOUT, sTransitionStructPtr->winOut);
    SetGpuReg(REG_OFFSET_WIN0V, sTransitionStructPtr->win0V);
    if (sTransitionStructPtr->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 640);
    DmaSet(0, &gScanlineEffectRegBuffers[1][160], &REG_WIN0H, ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_16BIT | DMA_SRC_INC | DMA_DEST_FIXED) << 16) | 1);
}

static void HBCB_BT_Phase2SlicedScreen(void)
{
    s16 offset = gScanlineEffectRegBuffers[1][REG_VCOUNT];
    
    REG_BG1HOFS = offset;
    REG_BG2HOFS = offset;
    REG_BG3HOFS = offset;
}

#undef tSpeed
#undef tAcc
#undef tJerk

#define spBldyCounter data[0]
#define spFinished data[1]
#define spAltDelay data[2]
#define spDelay data[5]
#define spLastSprite data[6]

static void BT_Phase2WhiteFadeInStripes(u8 taskId)
{
    while (sBT_Phase2WhiteFadeInStripesFuncs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 BT_Phase2WhiteFadeInStripes_Init(struct Task *task)
{
    u16 i;

    BT_InitCtrlBlk();
    ScanlineEffect_Clear();
    sTransitionStructPtr->bldCnt = BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_LIGHTEN;
    sTransitionStructPtr->bldY = 0;
    sTransitionStructPtr->winIn = WINOUT_WIN01_BG1 | WINOUT_WIN01_BG2 | WINOUT_WIN01_BG3 | WINOUT_WIN01_OBJ;
    sTransitionStructPtr->winOut = WINOUT_WIN01_BG_ALL | WINOUT_WIN01_OBJ | WININ_WIN0_CLR;
    sTransitionStructPtr->win0V = WIN_RANGE(0, 0xA0);
    for (i = 0; i < 160; ++i)
    {
        gScanlineEffectRegBuffers[1][i] = 0;
        gScanlineEffectRegBuffers[1][i + 160] = 0xF0;
    }
    EnableInterrupts(INTR_FLAG_HBLANK);
    SetHBlankCallback(HBCB_BT_Phase2WhiteFadeInStripes);
    SetVBlankCallback(VBCB_BT_Phase2WhiteFadeInStripes1);
    ++task->tState;
    return FALSE;
}

static bool8 BT_Phase2WhiteFadeInStripes_SetupSprites(struct Task *task)
{
    s16 i, posY;
    s16 buffer[NELEMS(sWhiteStripeDelay)];
    struct Sprite *sprite;

    memcpy(buffer, sWhiteStripeDelay, sizeof(sWhiteStripeDelay));
    for (i = 0, posY = 0; i < 6; ++i, posY += 0x1B)
    {
        sprite = &gSprites[CreateInvisibleSprite(SpriteCB_BT_Phase2WhiteFadeInStripes)];
        sprite->x = 0xF0;
        sprite->y = posY;
        sprite->spDelay = buffer[i];
    }
    ++sprite->spLastSprite;
    ++task->tState;
    return FALSE;
}

static bool8 BT_Phase2WhiteFadeInStripes_IsWhiteFadeDone(struct Task *task)
{
    sTransitionStructPtr->vblankDma = FALSE;
    if (sTransitionStructPtr->counter > 5)
    {
        BlendPalettes(PALETTES_ALL, 0x10, RGB_WHITE);
        ++task->tState;
    }
    return FALSE;
}

static bool8 BT_Phase2WhiteFadeInStripes_Stop(struct Task *task)
{
    sTransitionStructPtr->vblankDma = FALSE;
    DmaStop(0);
    SetVBlankCallback(NULL);
    SetHBlankCallback(NULL);
    sTransitionStructPtr->win0H = WIN_RANGE(0, 240);
    sTransitionStructPtr->bldY = 0;
    sTransitionStructPtr->bldCnt = BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_DARKEN;
    sTransitionStructPtr->winIn = WINOUT_WIN01_BG_ALL | WINOUT_WIN01_OBJ | WININ_WIN0_CLR;
    sTransitionStructPtr->counter = 0;
    SetVBlankCallback(VBCB_BT_Phase2WhiteFadeInStripes2);
    ++task->tState;
    return FALSE;
}

static bool8 BT_Phase2WhiteFadeInStripes_IsDone(struct Task *task)
{
   sTransitionStructPtr->counter += 480;
   sTransitionStructPtr->bldY = sTransitionStructPtr->counter >> 8;
   if (sTransitionStructPtr->bldY > 16)
   {
       BT_BlendPalettesToBlack();
       DestroyTask(FindTaskIdByFunc(BT_Phase2WhiteFadeInStripes));
   }
   return FALSE;
}

static void VBCB_BT_Phase2WhiteFadeInStripes1(void)
{
    DmaStop(0);
    BT_VBSyncOamAndPltt();
    SetGpuReg(REG_OFFSET_BLDCNT, sTransitionStructPtr->bldCnt);
    SetGpuReg(REG_OFFSET_WININ, sTransitionStructPtr->winIn);
    SetGpuReg(REG_OFFSET_WINOUT, sTransitionStructPtr->winOut);
    SetGpuReg(REG_OFFSET_WIN0V, sTransitionStructPtr->win0H); // BUG: This should obviously be sTransitionStructPtr->win0V
    if (sTransitionStructPtr->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 640);
    DmaSet(0, &gScanlineEffectRegBuffers[1][160], &REG_WIN0H, ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_16BIT | DMA_SRC_INC | DMA_DEST_FIXED) << 16) | 1);
}

static void VBCB_BT_Phase2WhiteFadeInStripes2(void)
{
    BT_VBSyncOamAndPltt();
    SetGpuReg(REG_OFFSET_BLDY, sTransitionStructPtr->bldY);
    SetGpuReg(REG_OFFSET_BLDCNT, sTransitionStructPtr->bldCnt);
    SetGpuReg(REG_OFFSET_WININ, sTransitionStructPtr->winIn);
    SetGpuReg(REG_OFFSET_WINOUT, sTransitionStructPtr->winOut);
    SetGpuReg(REG_OFFSET_WIN0H, sTransitionStructPtr->win0H);
    SetGpuReg(REG_OFFSET_WIN0V, sTransitionStructPtr->win0V);
}


static void HBCB_BT_Phase2WhiteFadeInStripes(void)
{
    vu16 index = REG_VCOUNT;

    if (index == 227)
        index = 0;
    REG_BLDY = gScanlineEffectRegBuffers[1][index];
}

static void SpriteCB_BT_Phase2WhiteFadeInStripes(struct Sprite *sprite)
{
    if (sprite->spDelay)
    {
        --sprite->spDelay;
        if (sprite->spLastSprite)
            sTransitionStructPtr->vblankDma = TRUE;
    }
    else
    {
        u16 i;
        u16 *bldY = &gScanlineEffectRegBuffers[0][sprite->y];
        u16 *win0H = &gScanlineEffectRegBuffers[0][sprite->y + 160];
        u32 stripeWidth = sprite->spLastSprite ? 0x19 : 0x1B;
        
        for (i = 0; i < stripeWidth; ++i)
        {
            bldY[i] = sprite->spBldyCounter >> 8;
            win0H[i] = (u8)(sprite->x);
        }
        if (sprite->x == 0 && sprite->spBldyCounter == 0x1000)
            sprite->spFinished = 1;
        sprite->x -= 24;
        sprite->spBldyCounter += 192;
        if (sprite->x < 0)
            sprite->x = 0;
        if (sprite->spBldyCounter > 0x1000)
            sprite->spBldyCounter = 0x1000;
        if (sprite->spLastSprite)
            sTransitionStructPtr->vblankDma = TRUE;
        if (sprite->spFinished)
        {
            if (sprite->spLastSprite == FALSE || (sTransitionStructPtr->counter > 4))
            {
                ++sTransitionStructPtr->counter;
                DestroySprite(sprite);
            }
        }
    }
}

#undef spBldyCounter
#undef spFinished
#undef spAltDelay
#undef spDelay
#undef spLastSprite

#define tDelay data[1]
#define tWhichGrid data[2]

static void BT_Phase2GridSquares(u8 taskId)
{
    while (sBT_Phase2GridSquaresFuncs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 BT_Phase2GridSquares_LoadGfx(struct Task *task)
{
    u16 *tilemapAddr, *tilesetAddr;

    BT_GetBg0TilemapAndTilesetBase(&tilemapAddr, &tilesetAddr);
    CpuCopy16(sGridSquareTileset, tilesetAddr, 0x20);
    CpuFill16(0xF000, tilemapAddr, 0x800);
    LoadPalette(sSlidingPokeballBigPokeballPalette, 0xF0, 0x20);
    ++task->tState;
    return FALSE;
}

static bool8 BT_Phase2GridSquares_UpdateTileset(struct Task *task)
{
    u16 *tilesetAddr;

    if (task->tDelay == 0)
    {
        BT_GetBg0TilesetBase(&tilesetAddr);
        task->tDelay = 3;
        ++task->tWhichGrid;
        CpuCopy16(sGridSquareTileset + (task->tWhichGrid * 8), tilesetAddr, 0x20);
        if (task->tWhichGrid > 0xD)
        {
            ++task->tState;
            task->tDelay = 16;
        }
    }
    --task->tDelay;
    return FALSE;
}

static bool8 BT_Phase2GridSquares_IsDone(struct Task *task)
{
    if (--task->tDelay == 0)
    {
        BT_BlendPalettesToBlack();
        DestroyTask(FindTaskIdByFunc(BT_Phase2GridSquares));
    }
    return FALSE;
}

#undef tDelay
#undef tWhichGrid

#define tWhichBrush data[1]
#define tWhichSide data[2]
#define tDelay data[3]

#define trCurrentPtX data[2]
#define trCurrentPtY data[3]

static void BT_Phase2BlackDoodles(u8 taskId)
{
    while (sBT_Phase2BlackDoodlesFuncs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 BT_Phase2BlackDoodles_Init(struct Task *task)
{
    u16 i;

    BT_InitCtrlBlk();
    ScanlineEffect_Clear();
    sTransitionStructPtr->winIn = WINOUT_WIN01_BG_ALL | WINOUT_WIN01_OBJ | WINOUT_WIN01_CLR;
    sTransitionStructPtr->winOut = 0;
    sTransitionStructPtr->win0V = WIN_RANGE(0, 0xA0);
    for (i = 0; i < 160; ++i)
        gScanlineEffectRegBuffers[0][i] = WIN_RANGE(0, 0xF0);
    CpuCopy16(gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 0x140);
    SetVBlankCallback(VBCB_BT_Phase2BlackDoodles);
    ++task->tState;
    return TRUE;
}

static bool8 BT_Phase2BlackDoodles_InitSingleBrush(struct Task *task)
{
    BT_DiagonalSegment_InitParams(sTransitionStructPtr->data, sBlackDoodlesSegments[task->tWhichBrush][0], sBlackDoodlesSegments[task->tWhichBrush][1], sBlackDoodlesSegments[task->tWhichBrush][2], sBlackDoodlesSegments[task->tWhichBrush][3], 1, 1);
    task->tWhichSide = sBlackDoodlesSegments[task->tWhichBrush][4];
    ++task->tState;
    return TRUE;
}

static bool8 BT_Phase2BlackDoodles_DrawSingleBrush(struct Task *task)
{
    s16 i;
    bool8 nextFunc;

    sTransitionStructPtr->vblankDma = FALSE;
    for (i = 0, nextFunc = FALSE; i < 16; ++i)
    {
        s16 left = gScanlineEffectRegBuffers[0][sTransitionStructPtr->trCurrentPtY] >> 8;
        s16 right = gScanlineEffectRegBuffers[0][sTransitionStructPtr->trCurrentPtY] & 0xFF;
        if (task->tWhichSide == 0)
        {
            if (left < sTransitionStructPtr->trCurrentPtX)
                left = sTransitionStructPtr->trCurrentPtX;
            if (left > right)
                left = right;
        }
        else
        {
            if (right > sTransitionStructPtr->trCurrentPtX)
                right = sTransitionStructPtr->trCurrentPtX;
            if (right <= left)
                right = left;
        }
        gScanlineEffectRegBuffers[0][sTransitionStructPtr->trCurrentPtY] = WIN_RANGE2(left, right);
        if (nextFunc)
        {
            ++task->tState;
            break;
        }
        else
            nextFunc = BT_DiagonalSegment_ComputePointOnSegment(sTransitionStructPtr->data, TRUE, TRUE);
    }
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}

static bool8 BT_Phase2BlackDoodles_IsDone(struct Task *task)
{
    if (++task->tWhichBrush < 7)
    {
        ++task->tState;
        task->tDelay = sBlackDoodlesDelay[task->tWhichBrush - 1];
        return TRUE;
    }
    else
    {
        DmaStop(0);
        BT_BlendPalettesToBlack();
        DestroyTask(FindTaskIdByFunc(BT_Phase2BlackDoodles));
        return FALSE;
    }
}

static bool8 BT_Phase2BlackDoodles_NextBrush(struct Task *task)
{
    if (--task->tDelay == 0)
    {
        task->tState = 1;
        return TRUE;
    }
    else
        return FALSE;
}

static void VBCB_BT_Phase2BlackDoodles(void)
{
    DmaStop(0);
    BT_VBSyncOamAndPltt();
    if (sTransitionStructPtr->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
    SetGpuReg(REG_OFFSET_WININ, sTransitionStructPtr->winIn);
    SetGpuReg(REG_OFFSET_WINOUT, sTransitionStructPtr->winOut);
    SetGpuReg(REG_OFFSET_WIN0V, sTransitionStructPtr->win0V);
    SetGpuReg(REG_OFFSET_WIN0H, gScanlineEffectRegBuffers[1][0]);
    DmaSet(0, gScanlineEffectRegBuffers[1], &REG_WIN0H, ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_16BIT | DMA_SRC_INC | DMA_DEST_FIXED) << 16) | 1);
}

#undef tWhichBrush
#undef tWhichSide
#undef tDelay

#undef trCurrentPtX
#undef trCurrentPtY

#define tFadeOutDelay data[1]
#define tFadeInDelay data[2]
#define tBlinkTimes data[3]
#define tFadeOutSpeed data[4]
#define tFadeInSpeed data[5]
#define tDelayCounter data[6]
#define tCoeff data[7]

static void BT_CreatePhase1SubTask(s16 fadeOutDelay, s16 fadeInDelay, s16 blinkTimes, s16 fadeOutSpeed, s16 fadeInSpeed)
{
    u8 taskId = CreateTask(BT_Phase1SubTask, 3);
    gTasks[taskId].tFadeOutDelay = fadeOutDelay;
    gTasks[taskId].tFadeInDelay = fadeInDelay;
    gTasks[taskId].tBlinkTimes = blinkTimes;
    gTasks[taskId].tFadeOutSpeed = fadeOutSpeed;
    gTasks[taskId].tFadeInSpeed = fadeInSpeed;
    gTasks[taskId].tDelayCounter = fadeOutDelay;
}

static bool8 BT_IsPhase1Done(void)
{
    if (FindTaskIdByFunc(BT_Phase1SubTask) == TAIL_SENTINEL)
        return TRUE;
    else
        return FALSE;
}

static void BT_Phase1SubTask(u8 taskId)
{
    while (sBT_Phase1FadeFuncs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 BT_Phase1_FadeOut(struct Task *task)
{
    if (task->tDelayCounter == 0 || --task->tDelayCounter == 0)
    {
        task->tDelayCounter = task->tFadeOutDelay;
        task->tCoeff += task->tFadeOutSpeed;
        if (task->tCoeff > 16)
            task->tCoeff = 16;
        BlendPalettes(-1, task->tCoeff, RGB(11, 11, 11));
    }
    if (task->tCoeff > 15)
    {
        ++task->tState;
        task->tDelayCounter = task->tFadeInDelay;
    }
    return FALSE;
}

static bool8 BT_Phase1_FadeIn(struct Task *task)
{
    if (task->tDelayCounter == 0 || --task->tDelayCounter == 0)
    {
        task->tDelayCounter = task->tFadeInDelay;
        task->tCoeff -= task->tFadeInSpeed;
        if (task->tCoeff < 0)
            task->tCoeff = 0;
        BlendPalettes(PALETTES_ALL, task->tCoeff, RGB(11, 11, 11));
    }
    if (task->tCoeff == 0)
    {
        if (--task->tBlinkTimes == 0)
        {
            DestroyTask(FindTaskIdByFunc(BT_Phase1SubTask));
        }
        else
        {
            task->tDelayCounter = task->tFadeOutDelay;
            task->tState = 0;
        }
    }
    return FALSE;
}

#undef tFadeOutDelay
#undef tFadeInDelay
#undef tBlinkTimes
#undef tFadeOutSpeed
#undef tFadeInSpeed
#undef tDelayCounter
#undef tCoeff

static void BT_InitCtrlBlk(void)
{
    memset(sTransitionStructPtr, 0, sizeof(*sTransitionStructPtr));
    FieldCameraGetPixelOffsetAtGround(&sTransitionStructPtr->bg123HOfs, &sTransitionStructPtr->bg123VOfs);
}

static void BT_VBSyncOamAndPltt(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void BT_GetBg0TilesetBase(u16 **tilesetPtr)
{
    u16 charBase;

    charBase = GetGpuReg(REG_OFFSET_BG0CNT) >> 2;
    charBase <<= 14;
    *tilesetPtr = (u16 *)(VRAM + charBase);
}

static void BT_GetBg0TilemapAndTilesetBase(u16 **tilemapPtr, u16 **tilesetPtr)
{
    u16 screenBase, charBase;

    screenBase = (GetGpuReg(REG_OFFSET_BG0CNT) >> 8) & 0x1F;
    charBase = GetGpuReg(REG_OFFSET_BG0CNT) >> 2;
    screenBase <<= 11;
    charBase <<= 14;
    *tilemapPtr = (u16 *)(VRAM + screenBase);
    *tilesetPtr = (u16 *)(VRAM + charBase);
}

static void BT_BlendPalettesToBlack(void)
{
    BlendPalettes(PALETTES_ALL, 0x10, RGB_BLACK);
}

static void BT_LoadWaveIntoBuffer(s16 *buffer, s16 offset, s16 theta, s16 frequency, s16 amplitude, s16 bufSize)
{
    u8 i;

    for (i = 0; bufSize > 0; --bufSize, ++i, theta += frequency)
        buffer[i] = offset + Sin(0xFF & theta, amplitude);
}

static void BT_GenerateCircle(s16 *buffer, s16 x, s16 y, s16 radius)
{
    s16 i;

    memset(buffer, 0xA, 320);
    // 64 iterations because we only want to cover [0, π/2) discretely.
    for (i = 0; i < 64; ++i)
    {
        s16 sinResult, cosResult, leftX, topY, bottomY, nextTopY, nextBottomY, winVal;

        // The loop variable i here does not stand for rotation angle, 
        // but is the angle between segment (center, pointOnCircle) 
        // and vertical line.   
        sinResult = Sin(i, radius);
        cosResult = Cos(i, radius);
        leftX = x - sinResult;
        winVal = x + sinResult;
        topY = y - cosResult;
        bottomY = y + cosResult;
        if (leftX < 0)
            leftX = 0;
        if (winVal > 240)
            winVal = 240;
        if (topY < 0)
            topY = 0;
        if (bottomY > 159)
            bottomY = 159;
        winVal |= (leftX << 8);
        buffer[topY] = winVal;
        buffer[bottomY] = winVal;
        cosResult = Cos(i + 1, radius);
        nextTopY = y - cosResult;
        nextBottomY = y + cosResult;
        if (nextTopY < 0)
            nextTopY = 0;
        if (nextBottomY > 159)
            nextBottomY = 159;
        // fill everything in between with the same WIN0H value
        while (topY > nextTopY)
            buffer[--topY] = winVal;
        while (topY < nextTopY)
            buffer[++topY] = winVal;
        while (bottomY > nextBottomY)
            buffer[--bottomY] = winVal;
        while (bottomY < nextBottomY)
            buffer[++bottomY] = winVal;
    }
}

#define trStartPtX data[0]
#define trStartPtY data[1]
#define trCurrentPtX data[2]
#define trCurrentPtY data[3]
#define trEndPtX data[4]
#define trEndPtY data[5]
#define trStepX data[6]
#define trStepY data[7]
#define trAbsDeltaX data[8]
#define trAbsDeltaY data[9]
#define trAccum data[10] // track one dimension based on slope

static void BT_DiagonalSegment_InitParams(s16 *data, s16 startPtX, s16 startPtY, s16 endPtX, s16 endPtY, s16 stepX, s16 stepY)
{
    trStartPtX = startPtX;
    trStartPtY = startPtY;
    trCurrentPtX = startPtX;
    trCurrentPtY = startPtY;
    trEndPtX = endPtX;
    trEndPtY = endPtY;
    trStepX = stepX;
    trStepY = stepY;
    trAbsDeltaX = endPtX - startPtX;
    if (trAbsDeltaX < 0)
    {
        trAbsDeltaX = -trAbsDeltaX;
        trStepX = -stepX;
    }
    trAbsDeltaY = endPtY - startPtY;
    if (trAbsDeltaY < 0)
    {
        trAbsDeltaY = -trAbsDeltaY;
        trStepY = -stepY;
    }
    trAccum = 0;
}

static bool8 BT_DiagonalSegment_ComputePointOnSegment(s16 *data, bool8 checkBoundary1, bool8 checkBoundary2)
{
    u8 finish;

    if (trAbsDeltaX > trAbsDeltaY)
    {
        trCurrentPtX += trStepX;
        trAccum += trAbsDeltaY;
        if (trAccum > trAbsDeltaX)
        {
            trCurrentPtY += trStepY;
            trAccum -= trAbsDeltaX;
        }
    }
    else
    {
        trCurrentPtY += trStepY;
        trAccum += trAbsDeltaX;
        if (trAccum > trAbsDeltaY)
        {
            trCurrentPtX += trStepX;
            trAccum -= trAbsDeltaY;
        }
    }
    finish = 0;
    if ((trStepX > 0 && trCurrentPtX >= trEndPtX) || (trStepX < 0 && trCurrentPtX <= trEndPtX))
    {
        ++finish;
        if (checkBoundary1)
            trCurrentPtX = trEndPtX;
    }
    if ((trStepY > 0 && trCurrentPtY >= trEndPtY) || (trStepY < 0 && trCurrentPtY <= trEndPtY))
    {
        ++finish;
        if (checkBoundary2)
            trCurrentPtY = trEndPtY;
    }
    if (finish == 2)
        return TRUE;
    else
        return FALSE;
}

#undef trStartPtX
#undef trStartPtY
#undef trCurrentPtX
#undef trCurrentPtY
#undef trEndPtX
#undef trEndPtY
#undef trStepX
#undef trStepY
#undef trAbsDeltaX
#undef trAbsDeltaY
#undef trAccum
