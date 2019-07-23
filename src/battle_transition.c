#include "global.h"
#include "sprite.h"
#include "task.h"
#include "battle_transition.h"

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
bool8 BT_Phase2Blur(struct Task *task);
bool8 BT_Phase2DistortedWave(struct Task *task);
bool8 BT_Phase2HorizontalCorrugate(struct Task *task);
bool8 BT_Phase2BigPokeball(struct Task *task);
bool8 BT_Phase2SlidingPokeballs(struct Task *task);
bool8 BT_Phase2ClockwiseBlackFade(struct Task *task);
bool8 BT_Phase2FullScreenWave(struct Task *task);
bool8 BT_Phase2BlackWaveToRight(struct Task *task);
bool8 BT_Phase2SlicedScreen(struct Task *task);
bool8 BT_Phase2WhiteFadeInStripes(struct Task *task);
bool8 BT_Phase2GridSquares(struct Task *task);
bool8 BT_Phase2BlackDoodles(struct Task *task);
bool8 BT_Phase2StartLoreleiMugshot(struct Task *task);
bool8 BT_Phase2StartBrunoMugshot(struct Task *task);
bool8 BT_Phase2StartAgathaMugshot(struct Task *task);
bool8 BT_Phase2StartLanceMugshot(struct Task *task);
bool8 BT_Phase2StartBlueMugshot(struct Task *task);
bool8 BT_Phase2AntiClockwiseSpiral(struct Task *task);
bool8 BT_Phase1Task(struct Task *task);

bool8 BT_Phase2MugshotsSpriteFuncs_Wait(struct Sprite *sprite);
bool8 BT_Phase2MugshotsSpriteFuncs_InitParams(struct Sprite *sprite);
bool8 BT_Phase2MugshotsSpriteFuncs_SlideSpriteIn(struct Sprite *sprite);
bool8 BT_Phase2MugshotsSpriteFuncs_DecelerateSprite(struct Sprite *sprite);
bool8 BT_Phase2MugshotsSpriteFuncs_DecelerateSprite2(struct Sprite *sprite);

void SpriteCB_BT_Phase2Mugshots(struct Sprite *sprite);
void SpriteCB_BT_Phase2SlidingPokeballs(struct Sprite *sprite);

const u32 sBigPokeballTileset[] = INCBIN_U32("graphics/battle_transitions/big_pokeball_tileset.4bpp");
const u32 sSlidingPokeballTilemap[] = INCBIN_U32("graphics/battle_transitions/sliding_pokeball_tilemap.bin");
const u8 sSpriteImage_SlidingPokeball[] = INCBIN_U8("graphics/battle_transitions/sliding_pokeball.4bpp");
const u32 sVsBarTileset[] = INCBIN_U32("graphics/battle_transitions/vsbar_tileset.4bpp");
const u8 sSpriteImage_UnusedBrendan[] = INCBIN_U8("graphics/battle_transitions/unused_brendan.4bpp");
const u8 sSpriteImage_UnusedLass[] = INCBIN_U8("graphics/battle_transitions/unused_lass.4bpp");
const u32 sGridSquareTilemap[] = INCBIN_U32("graphics/battle_transitions/grid_square_tilemap.bin");

const TransitionStateFunc sBT_Phase1Tasks[] =
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

const TransitionStateFunc sBT_Phase2Tasks[] =
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
