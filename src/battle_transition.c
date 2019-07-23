#include "global.h"
#include "sprite.h"
#include "task.h"
#include "overworld.h"
#include "malloc.h"
#include "palette.h"
#include "trig.h"
#include "gpu_regs.h"
#include "battle_transition.h"
#include "field_weather.h"
#include "scanline_effect.h"

typedef bool8 (*TransitionStateFunc)(struct Task *task);
typedef bool8 (*TransitionSpriteCallback)(struct Sprite *sprite);

struct TransitionData
{
    vu8 vblankDma;
    u16 winIn;
    u16 winOut;
    u16 win0H;
    u16 win0V;
    u16 unused_A;
    u16 unused_C;
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

struct __attribute__((packed)) BlackDoodleSegment
{
    s16 startPtX;
    s16 startPtY;
    s16 endPtX;
    s16 endPtY;
    u16 whichSide;
};

EWRAM_DATA struct TransitionData *sTransitionStructPtr = NULL;

// TODO: move this declaration to include/event_object_movement.h
extern const struct OamData gEventObjectBaseOam_32x32;

bool8 BT_Phase1_FadeOut(struct Task *task);
bool8 BT_Phase1_FadeIn(struct Task *task);
bool8 BT_Phase2BlackDoodles_Init(struct Task *task);
bool8 BT_Phase2BlackDoodles_InitSingleBrush(struct Task *task);
bool8 BT_Phase2BlackDoodles_DrawSingleBrush(struct Task *task);
bool8 BT_Phase2BlackDoodles_IsDone(struct Task *task);
bool8 BT_Phase2BlackDoodles_NextBrush(struct Task *task);
bool8 BT_Phase2GridSquares_LoadGfx(struct Task *task);
bool8 BT_Phase2GridSquares_UpdateTileset(struct Task *task);
bool8 BT_Phase2GridSquares_IsDone(struct Task *task);
bool8 BT_Phase2WhiteFadeInStripes_Init(struct Task *task);
bool8 BT_Phase2WhiteFadeInStripes_SetupSprites(struct Task *task);
bool8 BT_Phase2WhiteFadeInStripes_IsWhiteFadeDone(struct Task *task);
bool8 BT_Phase2WhiteFadeInStripes_Stop(struct Task *task);
bool8 BT_Phase2WhiteFadeInStripes_IsDone(struct Task *task);
bool8 BT_Phase2SlicedScreen_Init(struct Task *task);
bool8 BT_Phase2SlicedScreen_UpdateOffsets(struct Task *task);
bool8 BT_Phase2SlicedScreen_End(struct Task *task);
bool8 BT_Phase2Mugshot_Init(struct Task *task);
bool8 BT_Phase2Mugshot_LoadGfx(struct Task *task);
bool8 BT_Phase2Mugshot_VsBarsSlideIn(struct Task *task);
bool8 BT_Phase2Mugshot_StartSpriteSlide(struct Task *task);
bool8 BT_Phase2Mugshot_WaitForOpponentInPlace(struct Task *task);
bool8 BT_Phase2Mugshot_WaitForPlayerInPlace(struct Task *task);
bool8 BT_Phase2Mugshot_ExpandWhiteBand(struct Task *task);
bool8 BT_Phase2Mugshot_StartBlackFade(struct Task *task);
bool8 BT_Phase2Mugshot_WaitForBlackFade(struct Task *task);
bool8 BT_Phase2Mugshot_End(struct Task *task);
bool8 BT_Phase2AntiClockwiseSpiral_Init(struct Task *task);
bool8 BT_Phase2AntiClockwiseSpiral_Update(struct Task *task);
bool8 BT_Phase2BlackWaveToRight_Init(struct Task *task);
bool8 BT_Phase2BlackWaveToRight_UpdateWave(struct Task *task);
bool8 BT_Phase2BlackWaveToRight_End(struct Task *task);
bool8 BT_Phase2FullScreenWave_Init(struct Task *task);
bool8 BT_Phase2FullScreenWave_UpdateWave(struct Task *task);
bool8 BT_Phase2ClockwiseBlackFade_Init(struct Task *task);
bool8 BT_Phase2ClockwiseBlackFade_Step1(struct Task *task);
bool8 BT_Phase2ClockwiseBlackFade_Step2(struct Task *task);
bool8 BT_Phase2ClockwiseBlackFade_Step3(struct Task *task);
bool8 BT_Phase2ClockwiseBlackFade_Step4(struct Task *task);
bool8 BT_Phase2ClockwiseBlackFade_Step5(struct Task *task);
bool8 BT_Phase2ClockwiseBlackFade_End(struct Task *task);
bool8 BT_Phase2SlidingPokeballs_LoadBgGfx(struct Task *task);
bool8 BT_Phase2SlidingPokeballs_SetupFldeffArgs(struct Task *task);
bool8 BT_Phase2SlidingPokeballs_IsDone(struct Task *task);
bool8 BT_Phase2BigPokeball_Init(struct Task *task);
bool8 BT_Phase2BigPokeball_LoadTilemapAndWave(struct Task *task);
bool8 BT_Phase2BigPokeball_UpdateWave1IncEva(struct Task *task);
bool8 BT_Phase2BigPokeball_UpdateWave2DecEvb(struct Task *task);
bool8 BT_Phase2BigPokeball_UpdateWave3(struct Task *task);
bool8 BT_Phase2BigPokeball_CircleEffect(struct Task *task);
bool8 BT_Phase2HorizontalCorrugate_Init(struct Task *task);
bool8 BT_Phase2HorizontalCorrugate_UpdateWave(struct Task *task);
bool8 BT_Phase2DistortedWave_InitWave(struct Task *task);
bool8 BT_Phase2DistortedWave_UpdateWave(struct Task *task);
bool8 BT_Phase2Blur_InitBgMosaic(struct Task *task);
bool8 BT_Phase2Blur_Anim(struct Task *task);
bool8 BT_Phase2Blur_IsDone(struct Task *task);
bool8 BT_Phase1Blink(struct Task *task);
bool8 BT_WaitForPhase1(struct Task *task);
bool8 BT_Phase2LaunchAnimTask(struct Task *task);
bool8 BT_WaitForPhase2(struct Task *task);
void BT_Phase2Blur(u8 taskId);
void BT_Phase2DistortedWave(u8 taskId);
void BT_Phase2HorizontalCorrugate(u8 taskId);
void BT_Phase2BigPokeball(u8 taskId);
void BT_Phase2SlidingPokeballs(u8 taskId);
void BT_Phase2ClockwiseBlackFade(u8 taskId);
void BT_Phase2FullScreenWave(u8 taskId);
void BT_Phase2BlackWaveToRight(u8 taskId);
void BT_Phase2SlicedScreen(u8 taskId);
void BT_Phase2WhiteFadeInStripes(u8 taskId);
void BT_Phase2GridSquares(u8 taskId);
void BT_Phase2BlackDoodles(u8 taskId);
void BT_Phase2StartLoreleiMugshot(u8 taskId);
void BT_Phase2StartBrunoMugshot(u8 taskId);
void BT_Phase2StartAgathaMugshot(u8 taskId);
void BT_Phase2StartLanceMugshot(u8 taskId);
void BT_Phase2StartBlueMugshot(u8 taskId);
void BT_Phase2AntiClockwiseSpiral(u8 taskId);
void BT_Phase1Task(u8 taskId);

void SpriteCB_BT_Phase2Mugshots(struct Sprite *sprite);
void SpriteCB_BT_Phase2SlidingPokeballs(struct Sprite *sprite);

bool8 BT_Phase2MugshotsSpriteFuncs_Wait(struct Sprite *sprite);
bool8 BT_Phase2MugshotsSpriteFuncs_InitParams(struct Sprite *sprite);
bool8 BT_Phase2MugshotsSpriteFuncs_SlideSpriteIn(struct Sprite *sprite);
bool8 BT_Phase2MugshotsSpriteFuncs_DecelerateSprite(struct Sprite *sprite);
bool8 BT_Phase2MugshotsSpriteFuncs_DecelerateSprite2(struct Sprite *sprite);

void VBCB_BT_Phase2DistortedWave(void);
void HBCB_BT_Phase2DistortedWave(void);
void VBCB_BT_Phase2HorizontalCorrugate(void);
void HBCB_BT_Phase2HorizontalCorrugate(void);
void VBCB_BT_Phase2BigPokeball1(void);
void VBCB_BT_Phase2BigPokeball2(void);
void HBCB_BT_Phase2BigPokeball(void);

void BT_LaunchTask(u8 transitionId);
void BT_TaskMain(u8 taskId);
void BT_InitCtrlBlk(void);
void BT_CreatePhase1SubTask(s16 fadeOutDelay, s16 fadeInDelay, s16 blinkTimes, s16 fadeOutSpeed, s16 fadeInSpeed);
bool8 BT_IsPhase1Done(void);
void BT_VBSyncOamAndPltt(void);
void BT_GetBg0TilemapAndTilesetBase(u16 **tilemapPtr, u16 **tilesetPtr);
void BT_LoadWaveIntoBuffer(s16 *buffer, s16 offset, s16 theta, s16 frequency, s16 amplitude, s16 bufSize);


const u32 sBigPokeballTileset[] = INCBIN_U32("graphics/battle_transitions/big_pokeball_tileset.4bpp");
const u32 sSlidingPokeballTilemap[] = INCBIN_U32("graphics/battle_transitions/sliding_pokeball_tilemap.bin");
const u8 sSpriteImage_SlidingPokeball[] = INCBIN_U8("graphics/battle_transitions/sliding_pokeball.4bpp");
const u32 sVsBarTileset[] = INCBIN_U32("graphics/battle_transitions/vsbar_tileset.4bpp");
const u8 sSpriteImage_UnusedBrendan[] = INCBIN_U8("graphics/battle_transitions/unused_brendan.4bpp");
const u8 sSpriteImage_UnusedLass[] = INCBIN_U8("graphics/battle_transitions/unused_lass.4bpp");
const u32 sGridSquareTilemap[] = INCBIN_U32("graphics/battle_transitions/grid_square_tilemap.bin");

const TaskFunc sBT_Phase1Tasks[] =
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

const TaskFunc sBT_Phase2Tasks[] =
{
    BT_Phase2Blur,
    BT_Phase2DistortedWave,
    BT_Phase2HorizontalCorrugate,
    BT_Phase2BigPokeball,
    BT_Phase2SlidingPokeballs,
    BT_Phase2ClockwiseBlackFade,
    BT_Phase2FullScreenWave,
    BT_Phase2BlackWaveToRight,
    BT_Phase2SlicedScreen,
    BT_Phase2WhiteFadeInStripes,
    BT_Phase2GridSquares,
    BT_Phase2BlackDoodles,
    BT_Phase2StartLoreleiMugshot,
    BT_Phase2StartBrunoMugshot,
    BT_Phase2StartAgathaMugshot,
    BT_Phase2StartLanceMugshot,
    BT_Phase2StartBlueMugshot,
    BT_Phase2AntiClockwiseSpiral,
};

const TransitionStateFunc sBT_MainPhases[] =
{
    BT_Phase1Blink,
    BT_WaitForPhase1,
    BT_Phase2LaunchAnimTask,
    BT_WaitForPhase2,
};

const TransitionStateFunc sBT_Phase2BlurFuncs[] =
{
    BT_Phase2Blur_InitBgMosaic,
    BT_Phase2Blur_Anim,
    BT_Phase2Blur_IsDone,
};

const TransitionStateFunc sBT_Phase2DistortedWaveFuncs[] =
{
    BT_Phase2DistortedWave_InitWave,
    BT_Phase2DistortedWave_UpdateWave,
};

const TransitionStateFunc sBT_Phase2HorizontalCorrugateFuncs[] =
{
    BT_Phase2HorizontalCorrugate_Init,
    BT_Phase2HorizontalCorrugate_UpdateWave,
};

const TransitionStateFunc sBT_Phase2BigPokeballFuncs[] =
{
    BT_Phase2BigPokeball_Init,
    BT_Phase2BigPokeball_LoadTilemapAndWave,
    BT_Phase2BigPokeball_UpdateWave1IncEva,
    BT_Phase2BigPokeball_UpdateWave2DecEvb,
    BT_Phase2BigPokeball_UpdateWave3,
    BT_Phase2BigPokeball_CircleEffect,
};

const TransitionStateFunc sBT_Phase2SlidingPokeballsFuncs[] =
{
    BT_Phase2SlidingPokeballs_LoadBgGfx,
    BT_Phase2SlidingPokeballs_SetupFldeffArgs,
    BT_Phase2SlidingPokeballs_IsDone,
};

const s16 gUnknown_83FA400[] = { -16, 256 };

const s16 gUnknown_83FA404[] = { 0, 16, 32, 8, 24 };

const s16 gUnknown_83FA40E[] = { 8, -8 };

const TransitionStateFunc sBT_Phase2ClockwiseBlackFadeFuncs[] =
{
    BT_Phase2ClockwiseBlackFade_Init,
    BT_Phase2ClockwiseBlackFade_Step1,
    BT_Phase2ClockwiseBlackFade_Step2,
    BT_Phase2ClockwiseBlackFade_Step3,
    BT_Phase2ClockwiseBlackFade_Step4,
    BT_Phase2ClockwiseBlackFade_Step5,
    BT_Phase2ClockwiseBlackFade_End,
};

const TransitionStateFunc sBT_Phase2FullScreenWaveFuncs[] =
{
    BT_Phase2FullScreenWave_Init,
    BT_Phase2FullScreenWave_UpdateWave,
};

const TransitionStateFunc sBT_Phase2BlackWaveToRightFuncs[] =
{
    BT_Phase2BlackWaveToRight_Init,
    BT_Phase2BlackWaveToRight_UpdateWave,
    BT_Phase2BlackWaveToRight_End,
};
const s16 gUnknown_83FA444[] =
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

const TransitionStateFunc sBT_Phase2AntiClockwiseSpiralFuncs[] =
{
    BT_Phase2AntiClockwiseSpiral_Init,
    BT_Phase2AntiClockwiseSpiral_Update,
};

const TransitionStateFunc sBT_Phase2MugshotFuncs[] =
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

const u8 sMugshotsTrainerPicIDsTable[MUGSHOTS_COUNT] =
{
    // TODO: document these with macro
    0x70, 0x71, 0x72, 0x73, 0x7D
};

const s16 sMugshotsOpponentRotationScales[MUGSHOTS_COUNT][2] =
{
    {0x200, 0x200},
    {0x200, 0x200},
    {0x200, 0x200},
    {0x200, 0x200},
    {0x200, 0x200},
};

const s16 sMugshotsOpponentCoords[MUGSHOTS_COUNT][2] =
{
    { -8, 0 },
    { -10, 0 },
    { 0, 0 },
    { -32, 0 },
    { 0, 0 },
};

const TransitionSpriteCallback sBT_Phase2MugshotSpriteFuncs[] =
{
    BT_Phase2MugshotsSpriteFuncs_Wait,
    BT_Phase2MugshotsSpriteFuncs_InitParams,
    BT_Phase2MugshotsSpriteFuncs_SlideSpriteIn,
    BT_Phase2MugshotsSpriteFuncs_DecelerateSprite,
    BT_Phase2MugshotsSpriteFuncs_Wait,
    BT_Phase2MugshotsSpriteFuncs_DecelerateSprite2, // not used
    BT_Phase2MugshotsSpriteFuncs_Wait,
};

const s16 sMugShotSlideVelocity[] = { 12, -12 };

const s16 sMugShotSlideDeceleration[] = { -1, 1 };

const TransitionStateFunc sBT_Phase2SlicedScreenFuncs[] =
{
    BT_Phase2SlicedScreen_Init,
    BT_Phase2SlicedScreen_UpdateOffsets,
    BT_Phase2SlicedScreen_End,
};

const TransitionStateFunc sBT_Phase2WhiteFadeInStripesFuncs[] =
{
    BT_Phase2WhiteFadeInStripes_Init,
    BT_Phase2WhiteFadeInStripes_SetupSprites,
    BT_Phase2WhiteFadeInStripes_IsWhiteFadeDone,
    BT_Phase2WhiteFadeInStripes_Stop,
    BT_Phase2WhiteFadeInStripes_IsDone,
};

const u16 sWhiteStripeDelay[] = { 0, 9, 15, 6, 12, 3 };
    
const TransitionStateFunc sBT_Phase2GridSquaresFuncs[] =
{
    BT_Phase2GridSquares_LoadGfx,
    BT_Phase2GridSquares_UpdateTileset,
    BT_Phase2GridSquares_IsDone,
};

const TransitionStateFunc sBT_Phase2BlackDoodlesFuncs[] =
{
    BT_Phase2BlackDoodles_Init,
    BT_Phase2BlackDoodles_InitSingleBrush,
    BT_Phase2BlackDoodles_DrawSingleBrush,
    BT_Phase2BlackDoodles_IsDone,
    BT_Phase2BlackDoodles_NextBrush,
};

const struct BlackDoodleSegment sBlackDoodlesSegments[] =
{
    {
        .startPtX = 0x38,
        .startPtY = 0x0,
        .endPtX = 0x0,
        .endPtY = 0xA0,
        .whichSide = 0,
    },
    {
        .startPtX = 0x68,
        .startPtY = 0xA0,
        .endPtX = 0xF0,
        .endPtY = 0x58,
        .whichSide = 1,
    },
    {
        .startPtX = 0xF0,
        .startPtY = 0x48,
        .endPtX = 0x38,
        .endPtY = 0x0,
        .whichSide = 1,
    },
    {
        .startPtX = 0x0,
        .startPtY = 0x20,
        .endPtX = 0x90,
        .endPtY = 0xA0,
        .whichSide = 0,
    },
    {
        .startPtX = 0x90,
        .startPtY = 0xA0,
        .endPtX = 0xB8,
        .endPtY = 0x0,
        .whichSide = 1,
    },
    {
        .startPtX = 0x38,
        .startPtY = 0x0,
        .endPtX = 0xA8,
        .endPtY = 0xA0,
        .whichSide = 0,
    },
    {
        .startPtX = 0xA8,
        .startPtY = 0xA0,
        .endPtX = 0x30,
        .endPtY = 0x0,
        .whichSide = 1,
    },
};

const s16 sBlackDoodlesDelay[] = { 1, 1, 1, 1, 1, 1, 0 };

const TransitionStateFunc sBT_Phase1FadeFuncs[] =
{
    BT_Phase1_FadeOut,
    BT_Phase1_FadeIn,
};

const struct SpriteFrameImage sSpriteImageTable_SlidingPokeball[] =
{
    {
        .data = sSpriteImage_SlidingPokeball, 
        .size = 0x200,
    },
};

const union AnimCmd sSpriteAnim_SlidingPokeball[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

const union AnimCmd *const sSpriteAnimTable_SlidingPokeball[] = { sSpriteAnim_SlidingPokeball };

const union AffineAnimCmd sSpriteAffineAnim_SlidingPokeball1[] =
{
    AFFINEANIMCMD_FRAME(0, 0, -4, 1),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd sSpriteAffineAnim_SlidingPokeball2[] =
{
    AFFINEANIMCMD_FRAME(0, 0, 4, 1),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const sSpriteAffineAnimTable_SlidingPokeball[] =
{
    sSpriteAffineAnim_SlidingPokeball1,
    sSpriteAffineAnim_SlidingPokeball2,
};

const struct SpriteTemplate sSpriteTemplate_SlidingPokeball =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1009,
    .oam = &gEventObjectBaseOam_32x32,
    .anims = sSpriteAnimTable_SlidingPokeball,
    .images = sSpriteImageTable_SlidingPokeball,
    .affineAnims = sSpriteAffineAnimTable_SlidingPokeball,
    .callback = SpriteCB_BT_Phase2SlidingPokeballs,
};

const struct OamData sOamData_Unused =
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

const struct SpriteFrameImage sSpriteImageTable_UnusedBrendan[] =
{
    {
        .data = sSpriteImage_UnusedBrendan,
        .size = 0x800,
    },
};

const struct SpriteFrameImage sSpriteImageTable_UnusedLass[] =
{
    {
        .data = sSpriteImage_UnusedLass,
        .size = 0x800,
    },
};

const union AnimCmd sSpriteAnim_Unused[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

const union AnimCmd *const sSpriteAnimTable_Unused[] = { sSpriteAnim_Unused };

const struct SpriteTemplate sSpriteTemplateTable_Unused[] =
{
    {
        .tileTag = SPRITE_INVALID_TAG,
        .paletteTag = 0x100A,
        .oam = &sOamData_Unused,
        .anims = sSpriteAnimTable_Unused,
        .images = sSpriteImageTable_UnusedBrendan,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_BT_Phase2Mugshots,
    },
    {
        .tileTag = SPRITE_INVALID_TAG,
        .paletteTag = 0x100A,
        .oam = &sOamData_Unused,
        .anims = sSpriteAnimTable_Unused,
        .images = sSpriteImageTable_UnusedLass,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_BT_Phase2Mugshots,
    },
};

// this palette is shared by big pokeball and sliding pokeball
const u16 sSlidingPokeballBigPokeballPalette[] = INCBIN_U16("graphics/battle_transitions/sliding_pokeball.gbapal");

const struct SpritePalette sSpritePalette_SlidingPokeball =
{
    .data = sSlidingPokeballBigPokeballPalette,
    .tag = 0x1009,
};

const u16 sVsBarLoreleiPalette[] = INCBIN_U16("graphics/battle_transitions/lorelei_bg.gbapal");
const u16 sVsBarBrunoPalette[] = INCBIN_U16("graphics/battle_transitions/bruno_bg.gbapal");
const u16 sVsBarAgathaPalette[] = INCBIN_U16("graphics/battle_transitions/agatha_bg.gbapal");
const u16 sVsBarLancePalette[] = INCBIN_U16("graphics/battle_transitions/lance_bg.gbapal");
const u16 sVsBarBluePalette[] = INCBIN_U16("graphics/battle_transitions/blue_bg.gbapal");
const u16 sVsBarMalePlayerPalette[] = INCBIN_U16("graphics/battle_transitions/red_bg.gbapal");
const u16 sVsBarFemalePlayerPalette[] = INCBIN_U16("graphics/battle_transitions/green_bg.gbapal");

const u16 *const sVsBarOpponentPalettes[MUGSHOTS_COUNT] =
{
    sVsBarLoreleiPalette,
    sVsBarBrunoPalette,
    sVsBarAgathaPalette,
    sVsBarLancePalette,
    sVsBarBluePalette,
};

const u16 *const sVsBarPlayerPalettes[] =
{
    sVsBarMalePlayerPalette,
    sVsBarFemalePlayerPalette,
};

const u16 sUnusedTrainerPalette[] = INCBIN_U16("graphics/battle_transitions/unused_trainer.gbapal");

const struct SpritePalette sSpritePalette_UnusedTrainer =
{
    .data = sUnusedTrainerPalette, 
    .tag = 0x100A,
};

const u16 sBigPokeballTilemap[] = INCBIN_U16("graphics/battle_transitions/big_pokeball_tilemap.bin");
const u16 sVsBarTilemap[] = INCBIN_U16("graphics/battle_transitions/vsbar_tilemap.bin");

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

void BT_LaunchTask(u8 transitionId)
{
    u8 taskId = CreateTask(BT_TaskMain, 2);
    gTasks[taskId].tTransitionId = transitionId;
}

void BT_TaskMain(u8 taskId)
{
    while (sBT_MainPhases[gTasks[taskId].tState](&gTasks[taskId]));
}

bool8 BT_Phase1Blink(struct Task *task)
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

bool8 BT_WaitForPhase1(struct Task *task)
{
    if (FindTaskIdByFunc(sBT_Phase1Tasks[task->tTransitionId]) == TASK_NONE)
    {
        ++task->tState;
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

bool8 BT_Phase2LaunchAnimTask(struct Task *task)
{
    CreateTask(sBT_Phase2Tasks[task->tTransitionId], 0);
    ++task->tState;
    return FALSE;
}

bool8 BT_WaitForPhase2(struct Task *task)
{
    task->tTransitionDone = FALSE;
    if (FindTaskIdByFunc(sBT_Phase2Tasks[task->tTransitionId]) == TASK_NONE)
        task->tTransitionDone = TRUE;
    return FALSE;
}

void BT_Phase1Task(u8 taskId)
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

void BT_Phase2Blur(u8 taskId)
{
    while (sBT_Phase2BlurFuncs[gTasks[taskId].tState](&gTasks[taskId]));
}

bool8 BT_Phase2Blur_InitBgMosaic(struct Task *task)
{
    SetGpuReg(REG_OFFSET_MOSAIC, 0);
    SetGpuRegBits(REG_OFFSET_BG1CNT, BGCNT_MOSAIC);
    SetGpuRegBits(REG_OFFSET_BG2CNT, BGCNT_MOSAIC);
    SetGpuRegBits(REG_OFFSET_BG3CNT, BGCNT_MOSAIC);
    ++task->tState;
    return TRUE;
}

bool8 BT_Phase2Blur_Anim(struct Task *task)
{
    if (task->tInterval)
    {
        --task->tInterval;
    }
    else
    {
        task->tInterval = 2;
        if (++task->tMosaicSize == 10)
            BeginNormalPaletteFade(0xFFFFFFFF, -1, 0, 0x10, RGB_BLACK);
        // The mosaic size argument is shared by HSIZE and VSIZE
        SetGpuReg(REG_OFFSET_MOSAIC, (task->tMosaicSize & 0xF) + ((task->tMosaicSize & 0xF) << 4));
        if (task->tMosaicSize > 14)
            ++task->tState;
    }
    return FALSE;
}

bool8 BT_Phase2Blur_IsDone(struct Task *task)
{
    if (!gPaletteFade.active)
        DestroyTask(FindTaskIdByFunc(BT_Phase2Blur));
    return FALSE;
}

#undef tInterval
#undef tMosaicSize

#define tTheta data[1]
#define tAmplitude data[2]

void BT_Phase2DistortedWave(u8 taskId)
{
    while (sBT_Phase2DistortedWaveFuncs[gTasks[taskId].tState](&gTasks[taskId]));
}

bool8 BT_Phase2DistortedWave_InitWave(struct Task *task)
{
    BT_InitCtrlBlk();
    ScanlineEffect_Clear();
    BeginNormalPaletteFade(0xFFFFFFFF, 4, 0, 0x10, RGB_BLACK);
    BT_LoadWaveIntoBuffer(gScanlineEffectRegBuffers[1], sTransitionStructPtr->bg123HOfs, 0, 2, 0, 160);
    SetVBlankCallback(VBCB_BT_Phase2DistortedWave);
    SetHBlankCallback(HBCB_BT_Phase2DistortedWave);
    EnableInterrupts(INTR_FLAG_VBLANK | INTR_FLAG_HBLANK);
    ++task->tState;
    return FALSE;
}

bool8 BT_Phase2DistortedWave_UpdateWave(struct Task *task)
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

void VBCB_BT_Phase2DistortedWave(void)
{
    BT_VBSyncOamAndPltt();
    if (sTransitionStructPtr->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
}

void HBCB_BT_Phase2DistortedWave(void)
{
    s16 offset = gScanlineEffectRegBuffers[1][REG_VCOUNT];
    REG_BG1HOFS = offset;
    REG_BG2HOFS = offset;
    REG_BG3HOFS = offset;
}

void BT_Phase2HorizontalCorrugate(u8 taskId)
{
    while (sBT_Phase2HorizontalCorrugateFuncs[gTasks[taskId].tState](&gTasks[taskId]));
}

bool8 BT_Phase2HorizontalCorrugate_Init(struct Task *task)
{
    BT_InitCtrlBlk();
    ScanlineEffect_Clear();
    BeginNormalPaletteFade(0xFFFFFFFF, 4, 0, 0x10, RGB_BLACK);
    memset(gScanlineEffectRegBuffers[1], sTransitionStructPtr->bg123VOfs, 320);
    SetVBlankCallback(VBCB_BT_Phase2HorizontalCorrugate);
    SetHBlankCallback(HBCB_BT_Phase2HorizontalCorrugate);
    EnableInterrupts(INTR_FLAG_VBLANK | INTR_FLAG_HBLANK);
    ++task->tState;
    return FALSE;
}

bool8 BT_Phase2HorizontalCorrugate_UpdateWave(struct Task *task)
{
    u8 i;
    u16 theta, amplitude;

    sTransitionStructPtr->vblankDma = FALSE;
    theta = task->tTheta;
    amplitude = task->tAmplitude >> 8;
    task->tTheta += 4224;
    task->tAmplitude += 384;
    for (i = 0; i < 160; i++, theta += 4224)
        gScanlineEffectRegBuffers[0][i] = sTransitionStructPtr->bg123VOfs + Sin(theta / 256, amplitude);
    if (!gPaletteFade.active)
        DestroyTask(FindTaskIdByFunc(BT_Phase2HorizontalCorrugate));
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}

void VBCB_BT_Phase2HorizontalCorrugate(void)
{
    BT_VBSyncOamAndPltt();
    if (sTransitionStructPtr->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
}

void HBCB_BT_Phase2HorizontalCorrugate(void)
{
    u16 offset = gScanlineEffectRegBuffers[1][REG_VCOUNT];
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

void BT_Phase2BigPokeball(u8 taskId)
{
    while (sBT_Phase2BigPokeballFuncs[gTasks[taskId].tState](&gTasks[taskId]));
}

bool8 BT_Phase2BigPokeball_Init(struct Task *task)
{
    u16 i, *tilemapAddr, *tilesetAddr;

    BT_InitCtrlBlk();
    ScanlineEffect_Clear();
    task->tEvb = 16;
    task->tEva = 0;
    task-> tTheta = 0;
    task-> tAmplitude = 0x4000;
    sTransitionStructPtr->winIn = 0x3F;
    sTransitionStructPtr->winOut = 0;
    sTransitionStructPtr->win0H = 240;
    sTransitionStructPtr->win0V = 160;
    sTransitionStructPtr->bldCnt = BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD;
    sTransitionStructPtr->bldAlpha = (task->tEvb << 8) | task->tEva;
    for (i = 0; i < 160; ++i)
        gScanlineEffectRegBuffers[1][i] = 240;
    SetVBlankCallback(VBCB_BT_Phase2BigPokeball1);
    BT_GetBg0TilemapAndTilesetBase(&tilemapAddr, &tilesetAddr);
    CpuFill16(0, tilemapAddr, 0x800);
    CpuCopy16(sBigPokeballTileset, tilesetAddr, 0x580);
    LoadPalette(sSlidingPokeballBigPokeballPalette, 0xF0, 0x20);
    ++task->tState;
    return FALSE;
}

bool8 BT_Phase2BigPokeball_LoadTilemapAndWave(struct Task *task)
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

bool8 BT_Phase2BigPokeball_UpdateWave1IncEva(struct Task *task)
{
    sTransitionStructPtr->vblankDma = FALSE;
    if (task->tInterval == 0 || --task->tInterval == 0)
    {
        ++task->tEva;
        task->tInterval = 1; // Broken logic. This makes the condition always TRUE. 
    }
    sTransitionStructPtr->bldAlpha = (task->tEvb << 8) | task->tEva;
    // Increment eva until it reaches 50% coeff
    if (task->tEva > 15)
        ++task->tState;
    task->tTheta += 12;
    task->tAmplitude -= 384;
    // Assign a very high frequency value so that 2 adjacent values in gScanlineEffectRegBuffers[0] have different sign
    BT_LoadWaveIntoBuffer(gScanlineEffectRegBuffers[0], 0, task->tTheta, 132, task->tAmplitude >> 8, 160);
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}

bool8 BT_Phase2BigPokeball_UpdateWave2DecEvb(struct Task *task)
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

bool8 BT_Phase2BigPokeball_UpdateWave3(struct Task *task)
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
        task->tEvb = 160;
        task->tEva = 256;
        task->tInterval = 0;
    }
    ++sTransitionStructPtr->vblankDma;
    return FALSE;
}


