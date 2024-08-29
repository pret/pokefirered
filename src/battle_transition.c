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

#define PALTAG_UNUSED_MUGSHOT 0x100A

#define B_TRANS_DMA_FLAGS (1 | ((DMA_SRC_INC | DMA_DEST_FIXED | DMA_REPEAT | DMA_16BIT | DMA_START_HBLANK | DMA_ENABLE) << 16))

// Used by each transition task to determine which of its functions to call
#define tState          data[0]

// Below are data defines for InitBlackWipe and UpdateBlackWipe, for the TransitionData data array.
// These will be re-used by any transitions that use these functions.
#define tWipeStartX data[0]
#define tWipeStartY data[1]
#define tWipeCurrX  data[2]
#define tWipeCurrY  data[3]
#define tWipeEndX   data[4]
#define tWipeEndY   data[5]
#define tWipeXMove  data[6]
#define tWipeYMove  data[7]
#define tWipeXDist  data[8]
#define tWipeYDist  data[9]
#define tWipeTemp   data[10]

#define SET_TILE(ptr, posY, posX, tile) \
{                                       \
    u32 index = (posY) * 32 + posX;     \
    ptr[index] = tile | (15 << 12);     \
}

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
    s16 cameraX;
    s16 cameraY;
    s16 bg0HOfsOpponent;
    s16 bg0HOfsPlayer;
    s16 bg0VOfs;
    s16 unused_1E;
    s16 counter;
    s16 unused_22;
    s16 data[11]; // for multiple purposes
};

static EWRAM_DATA struct TransitionData *sTransitionData = NULL;

static bool8 TransitionIntro_FadeToGray(struct Task *task);
static bool8 TransitionIntro_FadeFromGray(struct Task *task);
static bool8 AngledWipes_Init(struct Task *task);
static bool8 AngledWipes_SetWipeData(struct Task *task);
static bool8 AngledWipes_DoWipe(struct Task *task);
static bool8 AngledWipes_TryEnd(struct Task *task);
static bool8 AngledWipes_StartNext(struct Task *task);
static bool8 GridSquares_Init(struct Task *task);
static bool8 GridSquares_Main(struct Task *task);
static bool8 GridSquares_End(struct Task *task);
static bool8 WhiteBarsFade_Init(struct Task *task);
static bool8 WhiteBarsFade_StartBars(struct Task *task);
static bool8 WhiteBarsFade_WaitBars(struct Task *task);
static bool8 WhiteBarsFade_BlendToBlack(struct Task *task);
static bool8 WhiteBarsFade_End(struct Task *task);
static bool8 Slice_Init(struct Task *task);
static bool8 Slice_Main(struct Task *task);
static bool8 Slice_End(struct Task *task);
static bool8 Mugshot_Init(struct Task *task);
static bool8 Mugshot_SetGfx(struct Task *task);
static bool8 Mugshot_ShowBanner(struct Task *task);
static bool8 Mugshot_StartOpponentSlide(struct Task *task);
static bool8 Mugshot_WaitStartPlayerSlide(struct Task *task);
static bool8 Mugshot_WaitPlayerSlide(struct Task *task);
static bool8 Mugshot_GradualWhiteFade(struct Task *task);
static bool8 Mugshot_InitFadeWhiteToBlack(struct Task *task);
static bool8 Mugshot_FadeToBlack(struct Task *task);
static bool8 Mugshot_End(struct Task *task);
static bool8 Spiral_Init(struct Task *task);
static bool8 Spiral_End(struct Task *task);
static bool8 Wave_Init(struct Task *task);
static bool8 Wave_Main(struct Task *task);
static bool8 Wave_End(struct Task *task);
static bool8 Ripple_Init(struct Task *task);
static bool8 Ripple_Main(struct Task *task);
static bool8 ClockwiseWipe_Init(struct Task *task);
static bool8 ClockwiseWipe_TopRight(struct Task *task);
static bool8 ClockwiseWipe_Right(struct Task *task);
static bool8 ClockwiseWipe_Bottom(struct Task *task);
static bool8 ClockwiseWipe_Left(struct Task *task);
static bool8 ClockwiseWipe_TopLeft(struct Task *task);
static bool8 ClockwiseWipe_End(struct Task *task);
static bool8 PokeballsTrail_Init(struct Task *task);
static bool8 PokeballsTrail_Main(struct Task *task);
static bool8 PokeballsTrail_End(struct Task *task);
static bool8 BigPokeball_Init(struct Task *task);
static bool8 BigPokeball_SetGfx(struct Task *task);
static bool8 PatternWeave_Blend1(struct Task *task);
static bool8 PatternWeave_Blend2(struct Task *task);
static bool8 PatternWeave_FinishAppear(struct Task *task);
static bool8 PatternWeave_CircularMask(struct Task *task);
static bool8 Shuffle_Init(struct Task *task);
static bool8 Shuffle_End(struct Task *task);
static bool8 Swirl_Init(struct Task *task);
static bool8 Swirl_End(struct Task *task);
static bool8 Blur_Init(struct Task *task);
static bool8 Blur_Main(struct Task *task);
static bool8 Blur_End(struct Task *task);
static bool8 Transition_StartIntro(struct Task *task);
static bool8 Transition_WaitForIntro(struct Task *task);
static bool8 Transition_StartMain(struct Task *task);
static bool8 Transition_WaitForMain(struct Task *task);

static void Task_Blur(u8 taskId);
static void Task_Swirl(u8 taskId);
static void Task_Shuffle(u8 taskId);
static void Task_BigPokeball(u8 taskId);
static void Task_PokeballsTrail(u8 taskId);
static void Task_ClockwiseWipe(u8 taskId);
static void Task_Ripple(u8 taskId);
static void Task_Wave(u8 taskId);
static void Task_Slice(u8 taskId);
static void Task_WhiteBarsFade(u8 taskId);
static void Task_GridSquares(u8 taskId);
static void Task_AngledWipes(u8 taskId);
static void Task_Lorelei(u8 taskId);
static void Task_Bruno(u8 taskId);
static void Task_Agatha(u8 taskId);
static void Task_Lance(u8 taskId);
static void Task_Blue(u8 taskId);
static void Task_Spiral(u8 taskId);
static void Task_Intro(u8 taskId);
static void DoMugshotTransition(u8 taskId);
static void Task_BattleTransition_Intro(u8 taskId);

static void SpriteCB_MugshotTrainerPic(struct Sprite *sprite);
static void SpriteCB_FldEffPokeballTrail(struct Sprite *sprite);
static void SpriteCB_WhiteBarFade(struct Sprite *sprite);

static bool8 MugshotTrainerPic_Pause(struct Sprite *sprite);
static bool8 MugshotTrainerPic_Init(struct Sprite *sprite);
static bool8 MugshotTrainerPic_Slide(struct Sprite *sprite);
static bool8 MugshotTrainerPic_SlideSlow(struct Sprite *sprite);
static bool8 MugshotTrainerPic_SlideOffscreen(struct Sprite *sprite);

static void VBlankCB_Swirl(void);
static void HBlankCB_Swirl(void);
static void VBlankCB_Shuffle(void);
static void HBlankCB_Shuffle(void);
static void VBlankCB_PatternWeave(void);
static void VBlankCB_CircularMask(void);
static void VBlankCB_ClockwiseWipe(void);
static void VBlankCB_Ripple(void);
static void HBlankCB_Ripple(void);
static void VBlankCB_Wave(void);
static void VBlankCB_Spiral(void);
static void VBlankCB_Mugshots(void);
static void VBlankCB_MugshotsFadeOut(void);
static void HBlankCB_Mugshots(void);
static void VBlankCB_Slice(void);
static void HBlankCB_Slice(void);
static void VBlankCB_WhiteBarsFade(void);
static void VBlankCB_WhiteBarsFade_Blend(void);
static void HBlankCB_WhiteBarsFade(void);
static void VBlankCB_AngledWipes(void);

static void LaunchBattleTransitionTask(u8 transitionId);
static void Task_BattleTransition(u8 taskId);
static void InitTransitionData(void);
static void CreateIntroTask(s16 fadeOutDelay, s16 fadeInDelay, s16 blinkTimes, s16 fadeOutSpeed, s16 fadeInSpeed);
static bool8 IsIntroTaskDone(void);
static void VBlankCB_BattleTransition(void);
static void GetBg0TilemapDst(u16 **tilesetPtr);
static void GetBg0TilesDst(u16 **tilemapPtr, u16 **tilesetPtr);
static void SetSinWave(s16 *buffer, s16 offset, s16 sinIndex, s16 frequency, s16 amplitude, s16 bufSize);
static void SetCircularMask(s16 *buffer, s16 x, s16 y, s16 radius);
static void FadeScreenBlack(void);
static void InitBlackWipe(s16 *data, s16 startX, s16 startY, s16 endX, s16 endY, s16 stepX, s16 stepY);
static bool8 UpdateBlackWipe(s16 *data, bool8 xExact, bool8 yExact);
static void SetTrainerPicSlideDirection(s16 spriteId, bool16 value);
static void IncrementTrainerPicState(s16 spriteId);
static s16 IsTrainerPicSlideDone(s16 spriteId);
static void Mugshots_CreateTrainerPics(struct Task *task);

static const u32 sBigPokeball_Gfx[] = INCBIN_U32("graphics/battle_transitions/big_pokeball.4bpp");
static const u32 sSlidingPokeball_Tilemap[] = INCBIN_U32("graphics/battle_transitions/sliding_pokeball.bin");
static const u8 sSlidingPokeball_Gfx[] = INCBIN_U8("graphics/battle_transitions/sliding_pokeball.4bpp");
static const u32 sMugshotBanner_Gfx[] = INCBIN_U32("graphics/battle_transitions/mugshot_banner.4bpp");
static const u8 sUnusedBrendan_Gfx[] = INCBIN_U8("graphics/battle_transitions/unused_brendan.4bpp");
static const u8 sUnusedLass_Gfx[] = INCBIN_U8("graphics/battle_transitions/unused_lass.4bpp");
static const u32 sGridSquare_Gfx[] = INCBIN_U32("graphics/battle_transitions/grid_square.4bpp");

// All battle transitions use the same intro
static const TaskFunc sTasks_Intro[] =
{
    [0 ... B_TRANSITION_COUNT - 1] = &Task_Intro,
};

// After the intro each transition has a unique main task.
// This task will call the functions that do the transition effects.
static const TaskFunc sTasks_Main[] =
{
    [B_TRANSITION_BLUR]            = Task_Blur,
    [B_TRANSITION_SWIRL]           = Task_Swirl,
    [B_TRANSITION_SHUFFLE]         = Task_Shuffle,
    [B_TRANSITION_BIG_POKEBALL]    = Task_BigPokeball,
    [B_TRANSITION_POKEBALLS_TRAIL] = Task_PokeballsTrail,
    [B_TRANSITION_CLOCKWISE_WIPE]  = Task_ClockwiseWipe,
    [B_TRANSITION_RIPPLE]          = Task_Ripple,
    [B_TRANSITION_WAVE]            = Task_Wave,
    [B_TRANSITION_SLICE]           = Task_Slice,
    [B_TRANSITION_WHITE_BARS_FADE] = Task_WhiteBarsFade,
    [B_TRANSITION_GRID_SQUARES]    = Task_GridSquares,
    [B_TRANSITION_ANGLED_WIPES]    = Task_AngledWipes,
    [B_TRANSITION_LORELEI]         = Task_Lorelei,
    [B_TRANSITION_BRUNO]           = Task_Bruno,
    [B_TRANSITION_AGATHA]          = Task_Agatha,
    [B_TRANSITION_LANCE]           = Task_Lance,
    [B_TRANSITION_BLUE]            = Task_Blue,
    [B_TRANSITION_SPIRAL]          = Task_Spiral,
};

static const TransitionStateFunc sTaskHandlers[] =
{
    Transition_StartIntro,
    Transition_WaitForIntro,
    Transition_StartMain,
    Transition_WaitForMain,
};

static const TransitionStateFunc sBlur_Funcs[] =
{
    Blur_Init,
    Blur_Main,
    Blur_End,
};

static const TransitionStateFunc sSwirl_Funcs[] =
{
    Swirl_Init,
    Swirl_End,
};

static const TransitionStateFunc sShuffle_Funcs[] =
{
    Shuffle_Init,
    Shuffle_End,
};

static const TransitionStateFunc sBigPokeball_Funcs[] =
{
    BigPokeball_Init,
    BigPokeball_SetGfx,
    PatternWeave_Blend1,
    PatternWeave_Blend2,
    PatternWeave_FinishAppear,
    PatternWeave_CircularMask,
};

static const TransitionStateFunc sPokeballsTrail_Funcs[] =
{
    PokeballsTrail_Init,
    PokeballsTrail_Main,
    PokeballsTrail_End,
};

#define NUM_POKEBALL_TRAILS 5
static const s16 sPokeballsTrail_StartXCoords[] = { -16, DISPLAY_WIDTH + 16 };
static const s16 sPokeballsTrail_Delays[NUM_POKEBALL_TRAILS] = { 0, 16, 32, 8, 24 };
static const s16 sPokeballsTrail_Speeds[] = { 8, -8 };

static const TransitionStateFunc sClockwiseWipe_Funcs[] =
{
    ClockwiseWipe_Init,
    ClockwiseWipe_TopRight,
    ClockwiseWipe_Right,
    ClockwiseWipe_Bottom,
    ClockwiseWipe_Left,
    ClockwiseWipe_TopLeft,
    ClockwiseWipe_End,
};

static const TransitionStateFunc sRipple_Funcs[] =
{
    Ripple_Init,
    Ripple_Main,
};

static const TransitionStateFunc sWave_Funcs[] =
{
    Wave_Init,
    Wave_Main,
    Wave_End,
};
static const s16 sSpiral_AngleData[] =
{
    0x0,
    0x26E,
    0x100,
    0x69,
    0x0,
    -0x69,
    -0x100,
    -0x266E,
    0x0,
    0x26E,
    0x100,
    0x69,
    0x0,
    -0x69,
    -0x100,
    -0x266E,
};

static const TransitionStateFunc sSpiral_Funcs[] =
{
    Spiral_Init,
    Spiral_End,
};

static const TransitionStateFunc sMugshot_Funcs[] =
{
    Mugshot_Init,
    Mugshot_SetGfx,
    Mugshot_ShowBanner,
    Mugshot_StartOpponentSlide,
    Mugshot_WaitStartPlayerSlide,
    Mugshot_WaitPlayerSlide,
    Mugshot_GradualWhiteFade,
    Mugshot_InitFadeWhiteToBlack,
    Mugshot_FadeToBlack,
    Mugshot_End,
};

static const u8 sMugshotsTrainerPicIDsTable[MUGSHOTS_COUNT] =
{
    [MUGSHOT_LORELEI] = TRAINER_PIC_ELITE_FOUR_LORELEI,
    [MUGSHOT_BRUNO]   = TRAINER_PIC_ELITE_FOUR_BRUNO,
    [MUGSHOT_AGATHA]  = TRAINER_PIC_ELITE_FOUR_AGATHA,
    [MUGSHOT_LANCE]   = TRAINER_PIC_ELITE_FOUR_LANCE,
    [MUGSHOT_BLUE]    = TRAINER_PIC_CHAMPION_RIVAL,
};

static const s16 sMugshotsOpponentRotationScales[MUGSHOTS_COUNT][2] =
{
    [MUGSHOT_LORELEI] = {0x200, 0x200},
    [MUGSHOT_BRUNO]   = {0x200, 0x200},
    [MUGSHOT_AGATHA]  = {0x200, 0x200},
    [MUGSHOT_LANCE]   = {0x200, 0x200},
    [MUGSHOT_BLUE]    = {0x200, 0x200},
};

static const s16 sMugshotsOpponentCoords[MUGSHOTS_COUNT][2] =
{
    [MUGSHOT_LORELEI] = {  -8,  0 },
    [MUGSHOT_BRUNO]   = { -10,  0 },
    [MUGSHOT_AGATHA]  = {   0,  0 },
    [MUGSHOT_LANCE]   = { -32,  0 },
    [MUGSHOT_BLUE]    = {   0,  0 },
};

static const TransitionSpriteCallback sMugshotTrainerPicFuncs[] =
{
    MugshotTrainerPic_Pause,
    MugshotTrainerPic_Init,
    MugshotTrainerPic_Slide,
    MugshotTrainerPic_SlideSlow,
    MugshotTrainerPic_Pause,
    MugshotTrainerPic_SlideOffscreen,
    MugshotTrainerPic_Pause,
};

// One element per slide direction.
// Sign of acceleration is opposite speed, so slide decelerates.
static const s16 sTrainerPicSlideSpeeds[] = {12, -12};
static const s16 sTrainerPicSlideAccels[] = {-1,   1};

static const TransitionStateFunc sSlice_Funcs[] =
{
    Slice_Init,
    Slice_Main,
    Slice_End,
};

static const TransitionStateFunc sWhiteBarsFade_Funcs[] =
{
    WhiteBarsFade_Init,
    WhiteBarsFade_StartBars,
    WhiteBarsFade_WaitBars,
    WhiteBarsFade_BlendToBlack,
    WhiteBarsFade_End,
};

#define NUM_WHITE_BARS 6
#define WHITE_BAR_HEIGHT (1 + DISPLAY_HEIGHT / NUM_WHITE_BARS)
static const u16 sWhiteBarsFade_StartDelays[NUM_WHITE_BARS] = {0, 9, 15, 6, 12, 3};

static const TransitionStateFunc sGridSquares_Funcs[] =
{
    GridSquares_Init,
    GridSquares_Main,
    GridSquares_End,
};

static const TransitionStateFunc sAngledWipes_Funcs[] =
{
    AngledWipes_Init,
    AngledWipes_SetWipeData,
    AngledWipes_DoWipe,
    AngledWipes_TryEnd,
    AngledWipes_StartNext,
};

#define NUM_ANGLED_WIPES 7

static const s16 sAngledWipes_MoveData[NUM_ANGLED_WIPES][5] =
{
// startX          startY          endX            endY            yDirection
    {56,            0,              0,              DISPLAY_HEIGHT, 0},
    {104,           DISPLAY_HEIGHT, DISPLAY_WIDTH,  88,             1},
    {DISPLAY_WIDTH, 72,             56,             0,              1},
    {0,             32,             144,            DISPLAY_HEIGHT, 0},
    {144,           DISPLAY_HEIGHT, 184,            0,              1},
    {56,            0,              168,            DISPLAY_HEIGHT, 0},
    {168,           DISPLAY_HEIGHT, 48,             0,              1},
};

static const s16 sAngledWipes_EndDelays[NUM_ANGLED_WIPES] = { 1, 1, 1, 1, 1, 1, 0 };

static const TransitionStateFunc sTransitionIntroFuncs[] =
{
    TransitionIntro_FadeToGray,
    TransitionIntro_FadeFromGray,
};

static const struct SpriteFrameImage sSpriteImage_Pokeball[] =
{
    {
        .data = sSlidingPokeball_Gfx, 
        .size = sizeof(sSlidingPokeball_Gfx),
    },
};

static const union AnimCmd sSpriteAnim_Pokeball[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

static const union AnimCmd *const sSpriteAnimTable_Pokeball[] = { sSpriteAnim_Pokeball };

static const union AffineAnimCmd sSpriteAffineAnim_Pokeball1[] =
{
    AFFINEANIMCMD_FRAME(0, 0, -4, 1),
    AFFINEANIMCMD_JUMP(0),
};

static const union AffineAnimCmd sSpriteAffineAnim_Pokeball2[] =
{
    AFFINEANIMCMD_FRAME(0, 0, 4, 1),
    AFFINEANIMCMD_JUMP(0),
};

static const union AffineAnimCmd *const sSpriteAffineAnimTable_Pokeball[] =
{
    sSpriteAffineAnim_Pokeball1,
    sSpriteAffineAnim_Pokeball2,
};

static const struct SpriteTemplate sSpriteTemplate_Pokeball =
{
    .tileTag = TAG_NONE,
    .paletteTag = FLDEFF_PAL_TAG_POKEBALL_TRAIL,
    .oam = &gObjectEventBaseOam_32x32,
    .anims = sSpriteAnimTable_Pokeball,
    .images = sSpriteImage_Pokeball,
    .affineAnims = sSpriteAffineAnimTable_Pokeball,
    .callback = SpriteCB_FldEffPokeballTrail,
};

static const struct OamData sOam_UnusedBrendanLass =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = 0,
    .mosaic = FALSE,
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

static const struct SpriteFrameImage sImageTable_UnusedBrendan[] =
{
    {
        .data = sUnusedBrendan_Gfx,
        .size = sizeof(sUnusedBrendan_Gfx),
    },
};

static const struct SpriteFrameImage sImageTable_UnusedLass[] =
{
    {
        .data = sUnusedLass_Gfx,
        .size = sizeof(sUnusedLass_Gfx),
    },
};

static const union AnimCmd sSpriteAnim_UnusedBrendanLass[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

static const union AnimCmd *const sSpriteAnimTable_UnusedBrendanLass[] = { sSpriteAnim_UnusedBrendanLass };

static const struct SpriteTemplate sSpriteTemplate_UnusedBrendanLass[] =
{
    {
        .tileTag = TAG_NONE,
        .paletteTag = PALTAG_UNUSED_MUGSHOT,
        .oam = &sOam_UnusedBrendanLass,
        .anims = sSpriteAnimTable_UnusedBrendanLass,
        .images = sImageTable_UnusedBrendan,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_MugshotTrainerPic,
    },
    {
        .tileTag = TAG_NONE,
        .paletteTag = PALTAG_UNUSED_MUGSHOT,
        .oam = &sOam_UnusedBrendanLass,
        .anims = sSpriteAnimTable_UnusedBrendanLass,
        .images = sImageTable_UnusedLass,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_MugshotTrainerPic,
    },
};

// this palette is shared by big pokeball and sliding pokeball
static const u16 sFieldEffectPal_Pokeball[] = INCBIN_U16("graphics/battle_transitions/sliding_pokeball.gbapal");

const struct SpritePalette gSpritePalette_Pokeball =
{
    .data = sFieldEffectPal_Pokeball,
    .tag = FLDEFF_PAL_TAG_POKEBALL_TRAIL,
};

static const u16 sMugshotPal_Lorelei[] = INCBIN_U16("graphics/battle_transitions/lorelei_bg.gbapal");
static const u16 sMugshotPal_Bruno[] = INCBIN_U16("graphics/battle_transitions/bruno_bg.gbapal");
static const u16 sMugshotPal_Agatha[] = INCBIN_U16("graphics/battle_transitions/agatha_bg.gbapal");
static const u16 sMugshotPal_Lance[] = INCBIN_U16("graphics/battle_transitions/lance_bg.gbapal");
static const u16 sMugshotPal_Blue[] = INCBIN_U16("graphics/battle_transitions/blue_bg.gbapal");
static const u16 sMugshotPal_Red[] = INCBIN_U16("graphics/battle_transitions/red_bg.gbapal");
static const u16 sMugshotPal_Green[] = INCBIN_U16("graphics/battle_transitions/green_bg.gbapal");

static const u16 *const sOpponentMugshotsPals[MUGSHOTS_COUNT] =
{
    [MUGSHOT_LORELEI] = sMugshotPal_Lorelei,
    [MUGSHOT_BRUNO]   = sMugshotPal_Bruno,
    [MUGSHOT_AGATHA]  = sMugshotPal_Agatha,
    [MUGSHOT_LANCE]   = sMugshotPal_Lance,
    [MUGSHOT_BLUE]    = sMugshotPal_Blue,
};

static const u16 *const sPlayerMugshotsPals[GENDER_COUNT] =
{
    [MALE]   = sMugshotPal_Red,
    [FEMALE] = sMugshotPal_Green,
};

static const u16 sUnusedTrainerPalette[] = INCBIN_U16("graphics/battle_transitions/unused_trainer.gbapal");

static const struct SpritePalette sSpritePalette_UnusedTrainer =
{
    .data = sUnusedTrainerPalette, 
    .tag = PALTAG_UNUSED_MUGSHOT,
};

static const u16 sBigPokeball_Tilemap[] = INCBIN_U16("graphics/battle_transitions/big_pokeball_tilemap.bin");
static const u16 sMugshotsTilemap[] = INCBIN_U16("graphics/battle_transitions/vsbar_tilemap.bin");

void BattleTransition_StartOnField(u8 transitionId)
{
    sTransitionData = AllocZeroed(sizeof(*sTransitionData));
    gMain.callback2 = CB2_OverworldBasic;
    LaunchBattleTransitionTask(transitionId);
}

// Unused
static void BattleTransition_Start(u8 transitionId)
{
    LaunchBattleTransitionTask(transitionId);
}

#define tTransitionId   data[1]
#define tTransitionDone data[15]

bool8 IsBattleTransitionDone(void)
{
    u8 taskId = FindTaskIdByFunc(Task_BattleTransition);
    if (gTasks[taskId].tTransitionDone)
    {
        InitTransitionData();
        FREE_AND_SET_NULL(sTransitionData);
        DestroyTask(taskId);
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

static void LaunchBattleTransitionTask(u8 transitionId)
{
    u8 taskId = CreateTask(Task_BattleTransition, 2);
    gTasks[taskId].tTransitionId = transitionId;
}

static void Task_BattleTransition(u8 taskId)
{
    while (sTaskHandlers[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 Transition_StartIntro(struct Task *task)
{
    SetWeatherScreenFadeOut();
    CpuCopy32(gPlttBufferFaded, gPlttBufferUnfaded, PLTT_SIZE);
    if (sTasks_Intro[task->tTransitionId] != NULL)
    {
        CreateTask(sTasks_Intro[task->tTransitionId], 4);
        task->tState++;
        return FALSE;
    }
    else
    {
        task->tState = 2;
        return TRUE;
    }
}

static bool8 Transition_WaitForIntro(struct Task *task)
{
    if (FindTaskIdByFunc(sTasks_Intro[task->tTransitionId]) == TASK_NONE)
    {
        task->tState++;
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

static bool8 Transition_StartMain(struct Task *task)
{
    CreateTask(sTasks_Main[task->tTransitionId], 0);
    task->tState++;
    return FALSE;
}

static bool8 Transition_WaitForMain(struct Task *task)
{
    task->tTransitionDone = FALSE;
    if (FindTaskIdByFunc(sTasks_Main[task->tTransitionId]) == TASK_NONE)
        task->tTransitionDone = TRUE;
    return FALSE;
}

#undef tTransitionId
#undef tTransitionDone

static void Task_Intro(u8 taskId)
{
    if (gTasks[taskId].tState == 0)
    {
        gTasks[taskId].tState++;
        CreateIntroTask(0, 0, 2, 2, 2);
    }
    else if (IsIntroTaskDone())
    {
        DestroyTask(taskId);
    }
}

//--------------------
// B_TRANSITION_BLUR
//--------------------

#define tDelay   data[1]
#define tCounter data[2]

static void Task_Blur(u8 taskId)
{
    while (sBlur_Funcs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 Blur_Init(struct Task *task)
{
    SetGpuReg(REG_OFFSET_MOSAIC, 0);
    SetGpuRegBits(REG_OFFSET_BG1CNT, BGCNT_MOSAIC);
    SetGpuRegBits(REG_OFFSET_BG2CNT, BGCNT_MOSAIC);
    SetGpuRegBits(REG_OFFSET_BG3CNT, BGCNT_MOSAIC);
    task->tState++;
    return TRUE;
}

static bool8 Blur_Main(struct Task *task)
{
    if (task->tDelay != 0)
    {
        task->tDelay--;
    }
    else
    {
        task->tDelay = 2;
        if (++task->tCounter == 10)
            BeginNormalPaletteFade(PALETTES_ALL, -1, 0, 16, RGB_BLACK);
        SetGpuReg(REG_OFFSET_MOSAIC, (task->tCounter & 0xF) + ((task->tCounter & 0xF) << 4));
        if (task->tCounter > 14)
            task->tState++;
    }
    return FALSE;
}

static bool8 Blur_End(struct Task *task)
{
    if (!gPaletteFade.active)
        DestroyTask(FindTaskIdByFunc(Task_Blur));
    return FALSE;
}

#undef tDelay
#undef tCounter

//--------------------
// B_TRANSITION_SWIRL
//--------------------

#define tSinIndex  data[1]
#define tAmplitude data[2]

static void Task_Swirl(u8 taskId)
{
    while (sSwirl_Funcs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 Swirl_Init(struct Task *task)
{
    InitTransitionData();
    ScanlineEffect_Clear();
    BeginNormalPaletteFade(PALETTES_ALL, 4, 0, 16, RGB_BLACK);
    SetSinWave(gScanlineEffectRegBuffers[1], sTransitionData->cameraX, 0, 2, 0, DISPLAY_HEIGHT);
    SetVBlankCallback(VBlankCB_Swirl);
    SetHBlankCallback(HBlankCB_Swirl);
    EnableInterrupts(INTR_FLAG_VBLANK | INTR_FLAG_HBLANK);
    task->tState++;
    return FALSE;
}

static bool8 Swirl_End(struct Task *task)
{
    sTransitionData->vblankDma = FALSE;
    task->tSinIndex += 4;
    task->tAmplitude += 8;
    SetSinWave(gScanlineEffectRegBuffers[0], sTransitionData->cameraX, task->tSinIndex, 2, task->tAmplitude, 160);
    if (!gPaletteFade.active)
        DestroyTask(FindTaskIdByFunc(Task_Swirl));
    sTransitionData->vblankDma++;
    return FALSE;
}

static void VBlankCB_Swirl(void)
{
    VBlankCB_BattleTransition();
    if (sTransitionData->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
}

static void HBlankCB_Swirl(void)
{
    s16 offset = gScanlineEffectRegBuffers[1][REG_VCOUNT];
    
    REG_BG1HOFS = offset;
    REG_BG2HOFS = offset;
    REG_BG3HOFS = offset;
}

#undef tSinIndex
#undef tAmplitude

//----------------------
// B_TRANSITION_SHUFFLE
//----------------------

#define tSinVal    data[1]
#define tAmplitude data[2]

static void Task_Shuffle(u8 taskId)
{
    while (sShuffle_Funcs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 Shuffle_Init(struct Task *task)
{
    InitTransitionData();
    ScanlineEffect_Clear();
    BeginNormalPaletteFade(PALETTES_ALL, 4, 0, 16, RGB_BLACK);
    memset(gScanlineEffectRegBuffers[1], sTransitionData->cameraY, DISPLAY_HEIGHT * 2);
    SetVBlankCallback(VBlankCB_Shuffle);
    SetHBlankCallback(HBlankCB_Shuffle);
    EnableInterrupts(INTR_FLAG_VBLANK | INTR_FLAG_HBLANK);
    task->tState++;
    return FALSE;
}

static bool8 Shuffle_End(struct Task *task)
{
    u8 i;
    u16 sinVal, amplitude;

    sTransitionData->vblankDma = FALSE;
    sinVal = task->tSinVal;
    amplitude = task->tAmplitude >> 8;
    task->tSinVal += 4224;
    task->tAmplitude += 384;

    for (i = 0; i < DISPLAY_HEIGHT; i++, sinVal += 4224)
        gScanlineEffectRegBuffers[0][i] = sTransitionData->cameraY + Sin(sinVal / 256, amplitude);

    if (!gPaletteFade.active)
        DestroyTask(FindTaskIdByFunc(Task_Shuffle));
    sTransitionData->vblankDma++;
    return FALSE;
}

static void VBlankCB_Shuffle(void)
{
    VBlankCB_BattleTransition();
    if (sTransitionData->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
}

static void HBlankCB_Shuffle(void)
{
    s16 offset = gScanlineEffectRegBuffers[1][REG_VCOUNT];
    
    REG_BG1VOFS = offset;
    REG_BG2VOFS = offset;
    REG_BG3VOFS = offset;
}

#undef tSinVal
#undef tAmplitude

//------------------------------------------------------------------------
// B_TRANSITION_BIG_POKEBALL
//
// In Emerald, the "PatternWeave" effect of this transition is used
// by multiple different transitions. In FRLG it's unique to this one.
//------------------------------------------------------------------------

#define tBlendTarget1 data[1]
#define tBlendTarget2 data[2]
#define tBlendDelay   data[3]

// Data 1-3 change purpose for PatternWeave_CircularMask
#define tRadius      data[1]
#define tRadiusDelta data[2]
#define tVBlankSet   data[3]

#define tSinIndex     data[4]
#define tAmplitude    data[5]
#define tEndDelay     data[8]

static void Task_BigPokeball(u8 taskId)
{
    while (sBigPokeball_Funcs[gTasks[taskId].tState](&gTasks[taskId]));
}

// Separate function in Emerald
#define InitPatternWeaveTransition(task) \
{ \
    u16 i; \
    InitTransitionData(); \
    ScanlineEffect_Clear(); \
    (task)->tBlendTarget1 = 16; \
    (task)->tBlendTarget2 = 0; \
    (task)->tSinIndex = 0; \
    (task)->tAmplitude = 0x4000; \
    sTransitionData->winIn = WININ_WIN0_ALL; \
    sTransitionData->winOut = 0; \
    sTransitionData->win0H = DISPLAY_WIDTH; \
    sTransitionData->win0V = DISPLAY_HEIGHT; \
    sTransitionData->bldCnt = BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_ALL; \
    sTransitionData->bldAlpha = BLDALPHA_BLEND((task)->tBlendTarget2, (task)->tBlendTarget1); \
    for (i = 0; i < DISPLAY_HEIGHT; i++) \
        gScanlineEffectRegBuffers[1][i] = DISPLAY_WIDTH; \
    SetVBlankCallback(VBlankCB_PatternWeave); \
}

static bool8 BigPokeball_Init(struct Task *task)
{
    u16 *tilemap, *tileset;

    InitPatternWeaveTransition(task);
    GetBg0TilesDst(&tilemap, &tileset);
    CpuFill16(0, tilemap, BG_SCREEN_SIZE);
    CpuCopy16(sBigPokeball_Gfx, tileset, sizeof(sBigPokeball_Gfx));
    LoadPalette(sFieldEffectPal_Pokeball, BG_PLTT_ID(15), sizeof(sFieldEffectPal_Pokeball));
    task->tState++;
    return FALSE;
}

static bool8 BigPokeball_SetGfx(struct Task *task)
{
    s16 i, j;
    u16 *tilemap, *tileset;
    const u16 *bigPokeballMap = sBigPokeball_Tilemap;

    GetBg0TilesDst(&tilemap, &tileset);
    for (i = 0; i < 20; i++)
        for (j = 0; j < 30; j++, bigPokeballMap++)
            SET_TILE(tilemap, i, j, *bigPokeballMap);

    SetSinWave(gScanlineEffectRegBuffers[0], 0, task->tSinIndex, 132, task->tAmplitude, DISPLAY_HEIGHT);
    task->tState++;
    return TRUE;
}

static bool8 PatternWeave_Blend1(struct Task *task)
{
    sTransitionData->vblankDma = FALSE;
    if (task->tBlendDelay == 0 || --task->tBlendDelay == 0)
    {
        task->tBlendTarget2++;
        task->tBlendDelay = 1; // Broken logic. This makes the condition always TRUE.
    }
    sTransitionData->bldAlpha = BLDALPHA_BLEND(task->tBlendTarget2, task->tBlendTarget1);
    // Increment eva until it reaches 50% coeff
    if (task->tBlendTarget2 > 15)
        task->tState++;
    task->tSinIndex += 12;
    task->tAmplitude -= 384;
    // Assign a very high frequency value so that 2 adjacent values in gScanlineEffectRegBuffers[0] will have different sign. 
    SetSinWave(gScanlineEffectRegBuffers[0], 0, task->tSinIndex, 132, task->tAmplitude >> 8, DISPLAY_HEIGHT);
    sTransitionData->vblankDma++;
    return FALSE;
}

static bool8 PatternWeave_Blend2(struct Task *task)
{
    sTransitionData->vblankDma = FALSE;
    if (task->tBlendDelay == 0 || --task->tBlendDelay == 0)
    {
        task->tBlendTarget1--;
        task->tBlendDelay = 2;
    }
    sTransitionData->bldAlpha = BLDALPHA_BLEND(task->tBlendTarget2, task->tBlendTarget1);
    if (task->tBlendTarget1 == 0)
        task->tState++;
    if (task->tAmplitude > 0)
    {
        task->tSinIndex += 12;
        task->tAmplitude -= 384;
    }
    else
    {
        task->tAmplitude = 0;
    }
    SetSinWave(gScanlineEffectRegBuffers[0], 0, task->tSinIndex, 132, task->tAmplitude >> 8, DISPLAY_HEIGHT);
    sTransitionData->vblankDma++;
    return FALSE;
}

static bool8 PatternWeave_FinishAppear(struct Task *task)
{
    sTransitionData->vblankDma = FALSE;
    if (task->tAmplitude > 0)
    {
        task->tSinIndex += 12;
        task->tAmplitude -= 384;
    }
    else
    {
        task->tAmplitude = 0;
    }
    SetSinWave(gScanlineEffectRegBuffers[0], 0, task->tSinIndex, 132, task->tAmplitude >> 8, DISPLAY_HEIGHT);
    if (task->tAmplitude <= 0)
    {
        task->tState++;
        task->tRadius = DISPLAY_HEIGHT;
        task->tRadiusDelta = 1 << 8;
        task->tVBlankSet = FALSE;
    }
    sTransitionData->vblankDma++;
    return FALSE;
}

// Do a shrinking circular mask to go to a black screen after the pattern appears.
static bool8 PatternWeave_CircularMask(struct Task *task)
{
    sTransitionData->vblankDma = FALSE;
    if (task->tRadiusDelta < (8 << 8))
        task->tRadiusDelta += (1 << 8);
    if (task->tRadius != 0)
    {
        task->tRadius -= (task->tRadiusDelta >> 8);
        if (task->tRadius < 0)
            task->tRadius = 0;
    }
    SetCircularMask(gScanlineEffectRegBuffers[0], DISPLAY_WIDTH / 2, DISPLAY_HEIGHT / 2, task->tRadius);
    if (task->tRadius == 0)
    {
        DmaStop(0);
        FadeScreenBlack();
        DestroyTask(FindTaskIdByFunc(Task_BigPokeball)); // FindTaskIdByFunc(task->func) in Emerald to accomdate other functions
    }
    if (!task->tVBlankSet)
    {
        task->tVBlankSet++;
        SetVBlankCallback(VBlankCB_CircularMask);
    }
    sTransitionData->vblankDma++;
    return FALSE;
}

static void VBlankCB_SetWinAndBlend(void)
{
    DmaStop(0);
    VBlankCB_BattleTransition();
    if (sTransitionData->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
    SetGpuReg(REG_OFFSET_WININ, sTransitionData->winIn);
    SetGpuReg(REG_OFFSET_WINOUT, sTransitionData->winOut);
    SetGpuReg(REG_OFFSET_WIN0V, sTransitionData->win0V);
    SetGpuReg(REG_OFFSET_BLDCNT, sTransitionData->bldCnt);
    SetGpuReg(REG_OFFSET_BLDALPHA, sTransitionData->bldAlpha);
}

static void VBlankCB_PatternWeave(void)
{
    VBlankCB_SetWinAndBlend();
    DmaSet(0, gScanlineEffectRegBuffers[1], &REG_BG0HOFS, B_TRANS_DMA_FLAGS);
}

static void VBlankCB_CircularMask(void)
{
    VBlankCB_SetWinAndBlend();
    DmaSet(0, gScanlineEffectRegBuffers[1], &REG_WIN0H, B_TRANS_DMA_FLAGS);
}

#undef tAmplitude
#undef tSinIndex
#undef tBlendTarget1
#undef tBlendTarget2
#undef tRadius
#undef tRadiusDelta
#undef tVBlankSet

//------------------------------
// B_TRANSITION_POKEBALLS_TRAIL
//------------------------------

#define sSide  data[0]
#define sDelay data[1]
#define sPrevX data[2]

static void Task_PokeballsTrail(u8 taskId)
{
    while (sPokeballsTrail_Funcs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 PokeballsTrail_Init(struct Task *task)
{
    u16 *tilemap, *tileset;

    GetBg0TilesDst(&tilemap, &tileset);
    CpuCopy16(sSlidingPokeball_Tilemap, tileset, sizeof(sSlidingPokeball_Tilemap));
    CpuFill32(0, tilemap, BG_SCREEN_SIZE);
    LoadPalette(sFieldEffectPal_Pokeball, BG_PLTT_ID(15), sizeof(sFieldEffectPal_Pokeball));
    task->tState++;
    return FALSE;
}

static bool8 PokeballsTrail_Main(struct Task *task)
{
    s16 i, side;
    s16 startX[ARRAY_COUNT(sPokeballsTrail_StartXCoords)];
    s16 delays[ARRAY_COUNT(sPokeballsTrail_Delays)];
    memcpy(startX, sPokeballsTrail_StartXCoords, sizeof(sPokeballsTrail_StartXCoords));
    memcpy(delays, sPokeballsTrail_Delays, sizeof(sPokeballsTrail_Delays));

    // Randomly pick which side the first ball should start on.
    // The side is then flipped for each subsequent ball.
    side = Random() & 1;
    for (i = 0; i < NUM_POKEBALL_TRAILS; i++, side ^= 1)
    {
        gFieldEffectArguments[0] = startX[side];    // x
        gFieldEffectArguments[1] = (i * 32) + 16;   // y
        gFieldEffectArguments[2] = side;
        gFieldEffectArguments[3] = delays[i];
        FieldEffectStart(FLDEFF_POKEBALL);
    }
    task->tState++;
    return FALSE;
}

static bool8 PokeballsTrail_End(struct Task *task)
{
    if (!FieldEffectActiveListContains(FLDEFF_POKEBALL))
    {
        FadeScreenBlack();
        DestroyTask(FindTaskIdByFunc(Task_PokeballsTrail));
    }
    return FALSE;
}

bool8 FldEff_PokeballTrail(void)
{
    u8 spriteId = CreateSpriteAtEnd(&sSpriteTemplate_Pokeball, gFieldEffectArguments[0], gFieldEffectArguments[1], 0);
    
    gSprites[spriteId].oam.priority = 0;
    gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_NORMAL;
    gSprites[spriteId].sSide = gFieldEffectArguments[2];
    gSprites[spriteId].sDelay = gFieldEffectArguments[3];
    gSprites[spriteId].sPrevX = -1;
    InitSpriteAffineAnim(&gSprites[spriteId]);
    StartSpriteAffineAnim(&gSprites[spriteId], gFieldEffectArguments[2]);
    return FALSE;
}

static void SpriteCB_FldEffPokeballTrail(struct Sprite *sprite)
{
    s16 speeds[ARRAY_COUNT(sPokeballsTrail_Speeds)];
    memcpy(speeds, sPokeballsTrail_Speeds, sizeof(sPokeballsTrail_Speeds));

    if (sprite->sDelay)
    {
        sprite->sDelay--;
    }
    else
    {
        if (sprite->x >= 0 && sprite->x <= DISPLAY_WIDTH)
        {
            // Set Pokéball position
            s16 posX = sprite->x >> 3;
            s16 posY = sprite->y >> 3;

            // If Pokéball moved forward clear trail behind it
            if (posX != sprite->sPrevX)
            {
                u16 *ptr;

                sprite->sPrevX = posX;
                ptr = (u16 *)BG_SCREEN_ADDR((GetGpuReg(REG_OFFSET_BG0CNT) >> 8) & 0x1F);
                SET_TILE(ptr, posY - 2, posX, 1);
                SET_TILE(ptr, posY - 1, posX, 1);
                SET_TILE(ptr, posY - 0, posX, 1);
                SET_TILE(ptr, posY + 1, posX, 1);
            }
        }
        sprite->x += speeds[sprite->sSide];
        if (sprite->x < -15 || sprite->x > DISPLAY_WIDTH + 15)
            FieldEffectStop(sprite, FLDEFF_POKEBALL);
    }
}

#undef sSide
#undef sDelay
#undef sPrevX

//-----------------------------
// B_TRANSITION_CLOCKWISE_WIPE
//-----------------------------

static void Task_ClockwiseWipe(u8 taskId)
{
    while (sClockwiseWipe_Funcs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 ClockwiseWipe_Init(struct Task *task)
{
    u16 i;

    InitTransitionData();
    ScanlineEffect_Clear();
    sTransitionData->winIn = 0;
    sTransitionData->winOut = WINOUT_WIN01_ALL;
    sTransitionData->win0H = WIN_RANGE(DISPLAY_WIDTH, DISPLAY_WIDTH + 1);
    sTransitionData->win0V = DISPLAY_HEIGHT;
    for (i = 0; i < DISPLAY_HEIGHT; i++)
        gScanlineEffectRegBuffers[1][i] = WIN_RANGE(DISPLAY_WIDTH + 3, DISPLAY_WIDTH + 4);
    SetVBlankCallback(VBlankCB_ClockwiseWipe);
    sTransitionData->tWipeEndX = DISPLAY_WIDTH / 2;
    task->tState++;
    return TRUE;
}

static bool8 ClockwiseWipe_TopRight(struct Task *task)
{
    sTransitionData->vblankDma = FALSE;
#ifdef UBFIX
    InitBlackWipe(sTransitionData->data, DISPLAY_WIDTH / 2, DISPLAY_HEIGHT / 2, sTransitionData->tWipeEndX, 0, 1, 1);
#else
    InitBlackWipe(sTransitionData->data, DISPLAY_WIDTH / 2, DISPLAY_HEIGHT / 2, sTransitionData->tWipeEndX, -1, 1, 1);
#endif
    do
    {
        gScanlineEffectRegBuffers[0][sTransitionData->tWipeCurrY] = WIN_RANGE(DISPLAY_WIDTH / 2, sTransitionData->tWipeCurrX + 1);
    }
    while (!UpdateBlackWipe(sTransitionData->data, TRUE, TRUE));

    sTransitionData->tWipeEndX += 32;
    if (sTransitionData->tWipeEndX >= DISPLAY_WIDTH)
    {
        sTransitionData->tWipeEndY = 0;
        task->tState++;
    }
    sTransitionData->vblankDma++;
    return FALSE;
}

static bool8 ClockwiseWipe_Right(struct Task *task)
{
    s16 start, end;
    vu8 finished = FALSE;

    sTransitionData->vblankDma = FALSE;
    InitBlackWipe(sTransitionData->data, DISPLAY_WIDTH / 2, DISPLAY_HEIGHT / 2, DISPLAY_WIDTH, sTransitionData->tWipeEndY, 1, 1);
    while (TRUE)
    {
        start = DISPLAY_WIDTH / 2;
        end = sTransitionData->tWipeCurrX + 1;
        if (sTransitionData->tWipeEndY >= DISPLAY_HEIGHT / 2)
        {
            start = sTransitionData->tWipeCurrX;
            end = DISPLAY_WIDTH;
        }
        gScanlineEffectRegBuffers[0][sTransitionData->tWipeCurrY] = WIN_RANGE2(start, end);
        if (finished)
            break;
        finished = UpdateBlackWipe(sTransitionData->data, TRUE, TRUE);
    }
    sTransitionData->tWipeEndY += 16;
    if (sTransitionData->tWipeEndY >= DISPLAY_HEIGHT)
    {
        sTransitionData->tWipeEndX = DISPLAY_WIDTH;
        task->tState++;
    }
    else
    {
        while (sTransitionData->tWipeCurrY < sTransitionData->tWipeEndY)
            gScanlineEffectRegBuffers[0][++sTransitionData->tWipeCurrY] = WIN_RANGE2(start, end);
    }
    sTransitionData->vblankDma++;
    return FALSE;
}

static bool8 ClockwiseWipe_Bottom(struct Task *task)
{
    sTransitionData->vblankDma = FALSE;
    InitBlackWipe(sTransitionData->data, DISPLAY_WIDTH / 2, DISPLAY_HEIGHT / 2, sTransitionData->tWipeEndX, DISPLAY_HEIGHT, 1, 1);
    do
    {
        gScanlineEffectRegBuffers[0][sTransitionData->tWipeCurrY] = (sTransitionData->tWipeCurrX << 8) | DISPLAY_WIDTH;
    }
    while (!UpdateBlackWipe(sTransitionData->data, TRUE, TRUE));
    sTransitionData->tWipeEndX -= 32;
    if (sTransitionData->tWipeEndX <= 0)
    {
        sTransitionData->tWipeEndY = DISPLAY_HEIGHT;
        task->tState++;
    }
    sTransitionData->vblankDma++;
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
 * 2. The programmer sometimes swapped the place of start and end boundary
 * of WIN0 (see variables start and end), which will sometimes cause end
 * to be smaller than start. In this way, garbage data will be written to WIN0H. 
 */
static bool8 ClockwiseWipe_Left(struct Task *task)
{
    s16 end, start;
    u16 win0H;
    vu8 finished = FALSE;

    sTransitionData->vblankDma = FALSE;
    InitBlackWipe(sTransitionData->data, DISPLAY_WIDTH / 2, DISPLAY_HEIGHT / 2, 0, sTransitionData->tWipeEndY, 1, 1);
    while (TRUE)
    {
        end = (gScanlineEffectRegBuffers[0][sTransitionData->tWipeCurrY]) & 0xFF;
        start = sTransitionData->tWipeCurrX;
        if (sTransitionData->tWipeEndY <= DISPLAY_HEIGHT / 2)
        {
            start = DISPLAY_WIDTH / 2;
            end = sTransitionData->tWipeCurrX;
        }
        win0H = WIN_RANGE2(start, end);
        gScanlineEffectRegBuffers[0][sTransitionData->tWipeCurrY] = win0H;
        if (finished)
            break;
        finished = UpdateBlackWipe(sTransitionData->data, TRUE, TRUE);
    }
    sTransitionData->tWipeEndY -= 16;
    if (sTransitionData->tWipeEndY <= 0)
    {
        sTransitionData->tWipeEndX = 0;
        task->tState++;
    }
    else
    {
        while (sTransitionData->tWipeCurrY > sTransitionData->tWipeEndY)
            gScanlineEffectRegBuffers[0][--sTransitionData->tWipeCurrY] = WIN_RANGE2(start, end);
    }
    sTransitionData->vblankDma++;
    return FALSE;
}

static bool8 ClockwiseWipe_TopLeft(struct Task *task)
{
    sTransitionData->vblankDma = FALSE;
    InitBlackWipe(sTransitionData->data, 120, 80, sTransitionData->tWipeEndX, 0, 1, 1);
    do
    {
        s16 start = DISPLAY_WIDTH / 2;
        s16 end = sTransitionData->tWipeCurrX;
        if (sTransitionData->tWipeCurrX >= 120)
        {
            start = 0;
            end = DISPLAY_WIDTH;
        }
        gScanlineEffectRegBuffers[0][sTransitionData->tWipeCurrY] = WIN_RANGE2(start, end);
    }
    while (!UpdateBlackWipe(sTransitionData->data, TRUE, TRUE));
    sTransitionData->tWipeEndX += 32;
    if (sTransitionData->tWipeCurrX > DISPLAY_WIDTH / 2)
        task->tState++;
    sTransitionData->vblankDma++;
    return FALSE;
}

static bool8 ClockwiseWipe_End(struct Task *task)
{
    DmaStop(0);
    FadeScreenBlack();
    DestroyTask(FindTaskIdByFunc(Task_ClockwiseWipe));
    return FALSE;
}

static void VBlankCB_ClockwiseWipe(void)
{
    DmaStop(0);
    VBlankCB_BattleTransition();
    if (sTransitionData->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], DISPLAY_HEIGHT * 2);
    SetGpuReg(REG_OFFSET_WININ, sTransitionData->winIn);
    SetGpuReg(REG_OFFSET_WINOUT, sTransitionData->winOut);
    SetGpuReg(REG_OFFSET_WIN0V, sTransitionData->win0V);
    SetGpuReg(REG_OFFSET_WIN0H, gScanlineEffectRegBuffers[1][0]);
    DmaSet(0, gScanlineEffectRegBuffers[1], &REG_WIN0H, B_TRANS_DMA_FLAGS);
}

//---------------------
// B_TRANSITION_RIPPLE
//---------------------

#define tSinVal       data[1]
#define tAmplitude    data[2]
#define tTimer        data[3]
#define tFadeStarted  data[4]

static void Task_Ripple(u8 taskId)
{
    while (sRipple_Funcs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 Ripple_Init(struct Task *task)
{
    u8 i;

    InitTransitionData();
    ScanlineEffect_Clear();
    for (i = 0; i < DISPLAY_HEIGHT; i++)
        gScanlineEffectRegBuffers[1][i] = sTransitionData->cameraY;
    SetVBlankCallback(VBlankCB_Ripple);
    SetHBlankCallback(HBlankCB_Ripple);
    EnableInterrupts(INTR_FLAG_HBLANK);
    task->tState++;
    return TRUE;
}

static bool8 Ripple_Main(struct Task *task)
{
    u8 i;
    s16 amplitude;
    u16 sinVal, speed;

    sTransitionData->vblankDma = FALSE;
    amplitude = task->tAmplitude >> 8;
    sinVal = task->tSinVal;
    speed = 384;
    task->tSinVal += 0x400;
    if (task->tAmplitude <= 0x1FFF)
        task->tAmplitude += 384;
    for (i = 0; i < DISPLAY_HEIGHT; i++, sinVal += speed)
    {
        s16 sinIndex = sinVal >> 8;
        gScanlineEffectRegBuffers[0][i] = sTransitionData->cameraY + Sin(sinIndex & 0xFFFF, amplitude);
    }
    if (++task->tTimer == 41)
    {
        task->tFadeStarted++;
        BeginNormalPaletteFade(PALETTES_ALL, -8, 0, 16, RGB_BLACK);
    }
    if (task->tFadeStarted && !gPaletteFade.active)
        DestroyTask(FindTaskIdByFunc(Task_Ripple));
    sTransitionData->vblankDma++;
    return FALSE;
}

static void VBlankCB_Ripple(void)
{
    VBlankCB_BattleTransition();
    if (sTransitionData->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], 320);
}

static void HBlankCB_Ripple(void)
{
    s16 offset = gScanlineEffectRegBuffers[1][REG_VCOUNT];
    
    REG_BG1VOFS = offset;
    REG_BG2VOFS = offset;
    REG_BG3VOFS = offset;
}

#undef tSinVal
#undef tAmplitudeVal
#undef tTimer
#undef tFadeStarted

//-------------------
// B_TRANSITION_WAVE
//-------------------

#define tX data[1]
#define tSinIndex data[2]

static void Task_Wave(u8 taskId)
{
    while (sWave_Funcs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 Wave_Init(struct Task *task)
{
    u8 i;

    InitTransitionData();
    ScanlineEffect_Clear();
    sTransitionData->winIn = WININ_WIN0_ALL;
    sTransitionData->winOut = 0;
    sTransitionData->win0H = DISPLAY_WIDTH;
    sTransitionData->win0V = DISPLAY_HEIGHT;
    for (i = 0; i < DISPLAY_HEIGHT; i++)
        gScanlineEffectRegBuffers[1][i] = DISPLAY_WIDTH + 2;
    SetVBlankCallback(VBlankCB_Wave);
    task->tState++;
    return TRUE;
}

static bool8 Wave_Main(struct Task *task)
{
    u8 i, sinIndex;
    u16 *winVal;
    bool8 finished;

    sTransitionData->vblankDma = FALSE;
    winVal = gScanlineEffectRegBuffers[0];
    sinIndex = task->tSinIndex;
    task->tSinIndex += 16;
    task->tX += 8;
    for (i = 0, finished = TRUE; i < DISPLAY_HEIGHT; i++, sinIndex += 4, winVal++)
    {
        s16 x = task->tX + Sin(sinIndex, 40);
        if (x < 0)
            x = 0;
        if (x > DISPLAY_WIDTH)
            x = DISPLAY_WIDTH;
        *winVal = WIN_RANGE(x, DISPLAY_WIDTH + 1);
        if (x < DISPLAY_WIDTH)
            finished = FALSE;
    }
    if (finished)
        task->tState++;
    sTransitionData->vblankDma++;
    return FALSE;
}

static bool8 Wave_End(struct Task *task)
{
    DmaStop(0);
    FadeScreenBlack();
    DestroyTask(FindTaskIdByFunc(Task_Wave));
    return FALSE;
}

static void VBlankCB_Wave(void)
{
    DmaStop(0);
    VBlankCB_BattleTransition();
    if (sTransitionData->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], DISPLAY_HEIGHT * 2);
    SetGpuReg(REG_OFFSET_WININ, sTransitionData->winIn);
    SetGpuReg(REG_OFFSET_WINOUT, sTransitionData->winOut);
    SetGpuReg(REG_OFFSET_WIN0V, sTransitionData->win0V);
    DmaSet(0, gScanlineEffectRegBuffers[1], &REG_WIN0H, B_TRANS_DMA_FLAGS);
}

#undef tX
#undef tSinIndex

//---------------------
// B_TRANSITION_SPIRAL
//---------------------

static void Task_Spiral(u8 taskId)
{
    while (sSpiral_Funcs[gTasks[taskId].tState](&gTasks[taskId]));
}

static void Spiral_UpdateFrame(s16 initRadius, s16 deltaAngleMax, u8 offsetMaybe)
{
    u8 sinIndex = 0;
    s16 i, amplitude1, amplitude2;
    s16 y1, x1, y2, x2;

    for (i = DISPLAY_HEIGHT * 2; i < DISPLAY_HEIGHT * 6; i++)
        gScanlineEffectRegBuffers[1][i] = DISPLAY_WIDTH / 2;

    for (i = 0; i < (deltaAngleMax * 16); i++, sinIndex++)
    {
        amplitude1 = initRadius + (sinIndex >> 3);
        if ((sinIndex >> 3) != ((sinIndex + 1) >> 3))
        {
            amplitude2 = amplitude1 + 1;
        }
        else
        {
            amplitude2 = amplitude1;
        }

        y1 = DISPLAY_HEIGHT / 2 - Sin(sinIndex, amplitude1);
        x1 = Cos(sinIndex, amplitude1) + DISPLAY_WIDTH / 2;
        y2 = DISPLAY_HEIGHT / 2 - Sin(sinIndex + 1, amplitude2);
        x2 = Cos(sinIndex + 1, amplitude2) + DISPLAY_WIDTH / 2;

        if (y1 < 0 && y2 < 0)
            continue;
        if (y1 > DISPLAY_HEIGHT - 1 && y2 > DISPLAY_HEIGHT - 1)
            continue;

        if (y1 < 0)
            y1 = 0;
        if (y1 > DISPLAY_HEIGHT - 1)
            y1 = DISPLAY_HEIGHT - 1;
        if (x1 < 0)
            x1 = 0;
        if (x1 > 255)
            x1 = 255;
        if (y2 < 0)
            y2 = 0;
        if (y2 > DISPLAY_HEIGHT - 1)
            y2 = DISPLAY_HEIGHT - 1;
        if (x2 < 0)
            x2 = 0;
        if (x2 > 255)
            x2 = 255;

        y2 -= y1;

        if (sinIndex >= 64 && sinIndex < 64 * 3)
        {
            gScanlineEffectRegBuffers[1][y1 + DISPLAY_HEIGHT * 2] = x1;

            if (y2 == 0)
                continue;

            x2 -= x1;
            if (x2 < -1 && x1 > 1)
                x1--;
            else if (x2 > 1 && x1 < 255)
                x1++;

            if (y2 < 0)
                for (; y2 < 0; y2++)
                    gScanlineEffectRegBuffers[1][y1 + y2 + DISPLAY_HEIGHT * 2] = x1;
            else
                for (; y2 > 0; y2--)
                    gScanlineEffectRegBuffers[1][y1 + y2 + DISPLAY_HEIGHT * 2] = x1;
        }
        else
        {
            gScanlineEffectRegBuffers[1][y1 + DISPLAY_HEIGHT * 3] = x1;

            if (y2 == 0)
                continue;

            x2 -= x1;
            if (x2 < -1 && x1 > 1)
                x1--;
            else if (x2 > 1 && x1 < 255)
                x1++;

            if (y2 < 0)
                for (; y2 < 0; y2++)
                    gScanlineEffectRegBuffers[1][y1 + y2 + DISPLAY_HEIGHT * 3] = x1;
            else
                for (; y2 > 0; y2--)
                    gScanlineEffectRegBuffers[1][y1 + y2 + DISPLAY_HEIGHT * 3] = x1;
        }
    }

    if (offsetMaybe == 0 || deltaAngleMax % 4 == 0)
    {
        for (i = 0; i < DISPLAY_HEIGHT; i++)
            gScanlineEffectRegBuffers[1][i * 2 + offsetMaybe] = gScanlineEffectRegBuffers[1][i + DISPLAY_HEIGHT * 2] << 8
                                                              | gScanlineEffectRegBuffers[1][i + DISPLAY_HEIGHT * 3];
        return;
    }

    y1 = Sin(deltaAngleMax * 16, initRadius + (deltaAngleMax << 1));

    switch (deltaAngleMax / 4)
    {
    case 0:
        if (y1 > DISPLAY_HEIGHT / 2)
            y1 = DISPLAY_HEIGHT / 2;
        for (i = y1; i > 0; i--)
        {
            sTransitionData->data[2] = x1 = ((i * sSpiral_AngleData[deltaAngleMax]) >> 8) + DISPLAY_WIDTH / 2;
            if (x1 < 0 || x1 > 255)
                continue;
            sTransitionData->cameraX = 400 - i;
            sTransitionData->data[10] = gScanlineEffectRegBuffers[1][400 - i];
            if (gScanlineEffectRegBuffers[1][560 - i] < x1)
                gScanlineEffectRegBuffers[1][560 - i] = DISPLAY_WIDTH / 2;
            else if (gScanlineEffectRegBuffers[1][400 - i] < x1)
                gScanlineEffectRegBuffers[1][400 - i] = x1;
        }
        break;
    case 1:
        if (y1 > DISPLAY_HEIGHT / 2)
            y1 = DISPLAY_HEIGHT / 2;
        for (i = y1; i > 0; i--)
        {
            sTransitionData->data[2] = x1 = ((i * sSpiral_AngleData[deltaAngleMax]) >> 8) + DISPLAY_WIDTH / 2;
            if (x1 < 0 || x1 > 255)
                continue;
            sTransitionData->cameraX = 400 - i;
            sTransitionData->data[10] = gScanlineEffectRegBuffers[1][400 - i];
            if (gScanlineEffectRegBuffers[1][400 - i] < x1)
                gScanlineEffectRegBuffers[1][400 - i] = x1;
        }
        break;
    case 2:
        if (y1 < -(DISPLAY_HEIGHT / 2 - 1))
            y1 = -(DISPLAY_HEIGHT / 2 - 1);
        for (i = y1; i <= 0; i++)
        {
            sTransitionData->data[2] = x1 = ((i * sSpiral_AngleData[deltaAngleMax]) >> 8) + DISPLAY_WIDTH / 2;
            if (x1 < 0 || x1 > 255)
                continue;
            sTransitionData->cameraX = 560 - i;
            sTransitionData->data[10] = gScanlineEffectRegBuffers[1][560 - i];
            if (gScanlineEffectRegBuffers[1][400 - i] >= x1)
                gScanlineEffectRegBuffers[1][400 - i] = DISPLAY_WIDTH / 2;
            else if (gScanlineEffectRegBuffers[1][560 - i] > x1)
                gScanlineEffectRegBuffers[1][560 - i] = x1;
        }
        break;
    case 3:
        if (y1 < -(DISPLAY_HEIGHT / 2 - 1))
            y1 = -(DISPLAY_HEIGHT / 2 - 1);
        for (i = y1; i <= 0; i++)
        {
            sTransitionData->data[2] = x1 = ((i * sSpiral_AngleData[deltaAngleMax]) >> 8) + 120;
            if (x1 < 0 || x1 > 255)
                continue;
            sTransitionData->cameraX = 560 - i;
            sTransitionData->data[10] = gScanlineEffectRegBuffers[1][560 - i];
            if (gScanlineEffectRegBuffers[1][560 - i] > x1)
                gScanlineEffectRegBuffers[1][560 - i] = x1;
        }
        break;
    default:
        break;
    }

    for (i = 0; i < DISPLAY_HEIGHT; i++)
        gScanlineEffectRegBuffers[1][i * 2 + offsetMaybe] = (gScanlineEffectRegBuffers[1][i + DISPLAY_HEIGHT * 2] << 8)
                                                           | gScanlineEffectRegBuffers[1][i + DISPLAY_HEIGHT * 3];
}

static bool8 Spiral_Init(struct Task *task)
{
    InitTransitionData();
    ScanlineEffect_Clear();
    sTransitionData->winIn = 0;
    sTransitionData->winOut = WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR;
    sTransitionData->win0H = WIN_RANGE(DISPLAY_WIDTH / 2, DISPLAY_WIDTH / 2);
    sTransitionData->win0V = WIN_RANGE(48, DISPLAY_HEIGHT - 48);
    sTransitionData->win1V = WIN_RANGE(16, DISPLAY_HEIGHT - 16);
    sTransitionData->counter = 0;
    Spiral_UpdateFrame(0, 0, 0);
    Spiral_UpdateFrame(0, 0, 1);
    DmaCopy16(3, gScanlineEffectRegBuffers[1], gScanlineEffectRegBuffers[0], DISPLAY_HEIGHT * 4);
    SetVBlankCallback(VBlankCB_Spiral);
    task->tState++;
    task->data[1] = 0;
    task->data[2] = 0;
    return FALSE;
}

static bool8 Spiral_End(struct Task *task)
{
    s16 win_top, win_bottom;

    Spiral_UpdateFrame(task->data[2], task->data[1], 1);
    sTransitionData->vblankDma |= TRUE;
    if (++task->data[1] == (int)ARRAY_COUNT(sSpiral_AngleData) + 1)
    {
        Spiral_UpdateFrame(task->data[2], 16, 0);
        win_top = 48 - task->data[2];
        if (win_top < 0)
            win_top = 0;
        win_bottom = task->data[2] + 112;
        if (win_bottom > 255)
            win_bottom = 255;
        sTransitionData->win0V = win_top | win_bottom; // UB: win_top should be shifted
        task->data[2] += 32;
        task->data[1] = 0;
        Spiral_UpdateFrame(task->data[2], 0, 1);
        win_top = 48 - task->data[2];
        if (win_top < 0)
            win_top = 0;
        win_bottom = task->data[2] + 112;
        if (win_bottom > 255)
            win_bottom = 255;
        sTransitionData->win1V = win_top | win_bottom; // UB: win_top should be shifted
        sTransitionData->vblankDma |= TRUE;
        if (task->data[2] >= DISPLAY_HEIGHT)
        {
            sTransitionData->counter = 1;
            FadeScreenBlack();
        }
    }
    return FALSE;
}

static void VBlankCB_Spiral(void)
{
    DmaStop(0);
    VBlankCB_BattleTransition();
    if (sTransitionData->counter)
    {
        DestroyTask(FindTaskIdByFunc(Task_Spiral));
    }
    else
    {
        if (sTransitionData->vblankDma)
        {
            DmaCopy16(3, gScanlineEffectRegBuffers[1], gScanlineEffectRegBuffers[0], DISPLAY_HEIGHT * 4);
            sTransitionData->vblankDma = FALSE;
        }
        SetGpuReg(REG_OFFSET_WININ, sTransitionData->winIn);
        SetGpuReg(REG_OFFSET_WINOUT, sTransitionData->winOut);
        SetGpuReg(REG_OFFSET_WIN0V, sTransitionData->win0V);
        SetGpuReg(REG_OFFSET_WIN1V, sTransitionData->win1V);
        SetGpuReg(REG_OFFSET_WIN0H, gScanlineEffectRegBuffers[0][0]);
        SetGpuReg(REG_OFFSET_WIN1H, gScanlineEffectRegBuffers[0][1]);
        DmaSet(0, gScanlineEffectRegBuffers[0], &REG_WIN0H, (DMA_32BIT << 16) | B_TRANS_DMA_FLAGS);
    }
}

//----------------------------------------------------------------
// B_TRANSITION_LORELEI, B_TRANSITION_BRUNO, B_TRANSITION_AGATHA,
// B_TRANSITION_LANCE, and B_TRANSITION_BLUE
//
// These are all the "mugshot" transitions, where a banner shows
// the trainer pic of the player and their opponent.
//----------------------------------------------------------------

#define tSinIndex         data[1]
#define tTopBannerX       data[2]
#define tBottomBannerX    data[3]
#define tTimer            data[3] // Re-used
#define tFadeSpread       data[4]
#define tOpponentSpriteId data[13]
#define tPlayerSpriteId   data[14]
#define tMugshotId        data[15]

// Sprite data for trainer sprites in mugshots
#define sState      data[0]
#define sSlideSpeed data[1]
#define sSlideAccel data[2]
#define sDone       data[6]
#define sSlideDir   data[7]

static void Task_Lorelei(u8 taskId)
{
    gTasks[taskId].tMugshotId = MUGSHOT_LORELEI;
    DoMugshotTransition(taskId);
}

static void Task_Bruno(u8 taskId)
{
    gTasks[taskId].tMugshotId = MUGSHOT_BRUNO;
    DoMugshotTransition(taskId);
}

static void Task_Agatha(u8 taskId)
{
    gTasks[taskId].tMugshotId = MUGSHOT_AGATHA;
    DoMugshotTransition(taskId);
}

static void Task_Lance(u8 taskId)
{
    gTasks[taskId].tMugshotId = MUGSHOT_LANCE;
    DoMugshotTransition(taskId);
}

static void Task_Blue(u8 taskId)
{
    gTasks[taskId].tMugshotId = MUGSHOT_BLUE;
    DoMugshotTransition(taskId);
}

static void DoMugshotTransition(u8 taskId)
{
    while (sMugshot_Funcs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 Mugshot_Init(struct Task *task)
{
    u8 i;

    InitTransitionData();
    ScanlineEffect_Clear();
    Mugshots_CreateTrainerPics(task);

    task->tSinIndex = 0;
    task->tTopBannerX = 1;
    task->tBottomBannerX = DISPLAY_WIDTH - 1;
    sTransitionData->winIn = WININ_WIN0_ALL;
    sTransitionData->winOut = WININ_WIN0_BG1 | WININ_WIN0_BG2 | WININ_WIN0_BG3 | WININ_WIN0_OBJ | WININ_WIN0_CLR;
    sTransitionData->win0V = DISPLAY_HEIGHT;
    for (i = 0; i < DISPLAY_HEIGHT; i++)
        gScanlineEffectRegBuffers[1][i] = WIN_RANGE(DISPLAY_WIDTH, DISPLAY_WIDTH + 1);
    SetVBlankCallback(VBlankCB_Mugshots);
    task->tState++;
    return FALSE;
}

static bool8 Mugshot_SetGfx(struct Task *task)
{
    s16 i, j;
    u16 *tilemap, *tileset;
    const u16 *mugshotsMap = sMugshotsTilemap;
    
    GetBg0TilesDst(&tilemap, &tileset);
    CpuCopy16(sMugshotBanner_Gfx, tileset, sizeof(sMugshotBanner_Gfx));
    LoadPalette(sOpponentMugshotsPals[task->tMugshotId], BG_PLTT_ID(15), PLTT_SIZE_4BPP);
    LoadPalette(sPlayerMugshotsPals[gSaveBlock2Ptr->playerGender], BG_PLTT_ID(15) + 10, PLTT_SIZEOF(16 - 10));
    
    for (i = 0; i < 20; i++)
        for (j = 0; j < 32; j++, mugshotsMap++)
            SET_TILE(tilemap, i, j, *mugshotsMap);

    EnableInterrupts(INTR_FLAG_HBLANK);
    SetHBlankCallback(HBlankCB_Mugshots);
    task->tState++;
    return FALSE;
}

static bool8 Mugshot_ShowBanner(struct Task *task)
{
    u8 i, sinIndex;
    u16 *winVal;
    s16 x;
    s32 mergedValue;

    sTransitionData->vblankDma = FALSE;

    winVal = gScanlineEffectRegBuffers[0];
    sinIndex = task->tSinIndex;
    task->tSinIndex += 16;

    // Update top banner
    for (i = 0; i < DISPLAY_HEIGHT / 2; i++, winVal++, sinIndex += 16)
    {
        x = task->tTopBannerX + Sin(sinIndex, 16);
        if (x < 0)
            x = 1;
        if (x > DISPLAY_WIDTH)
            x = DISPLAY_WIDTH;
        *winVal = x;
    }

    // Update bottom banner
    for (; i < DISPLAY_HEIGHT; i++, winVal++, sinIndex += 16)
    {
        x = task->tBottomBannerX - Sin(sinIndex, 16);
        if (x < 0)
            x = 0;
        if (x > DISPLAY_WIDTH - 1)
            x = DISPLAY_WIDTH - 1;
        *winVal = (x << 8) | (DISPLAY_WIDTH);
    }

    // Slide banners across screen
    task->tTopBannerX += 8;
    task->tBottomBannerX -= 8;

    if (task->tTopBannerX > DISPLAY_WIDTH)
        task->tTopBannerX = DISPLAY_WIDTH;
    if (task->tBottomBannerX < 0)
        task->tBottomBannerX = 0;

    mergedValue = *(s32 *)(&task->tTopBannerX);
    if (mergedValue == DISPLAY_WIDTH)
        task->tState++;

    sTransitionData->bg0HOfsOpponent -= 8;
    sTransitionData->bg0HOfsPlayer += 8;
    sTransitionData->vblankDma++;
    return FALSE;
}

static bool8 Mugshot_StartOpponentSlide(struct Task *task)
{
    u8 i;
    u16 *winVal;

    sTransitionData->vblankDma = FALSE;
    for (i = 0, winVal = gScanlineEffectRegBuffers[0]; i < DISPLAY_HEIGHT; i++, winVal++)
        *winVal = DISPLAY_WIDTH;
    task->tState++;

    // Clear old data
    task->tSinIndex = 0;
    task->tTopBannerX = 0;
    task->tBottomBannerX = 0;

    sTransitionData->bg0HOfsOpponent -= 8;
    sTransitionData->bg0HOfsPlayer += 8;

    SetTrainerPicSlideDirection(task->tOpponentSpriteId, 0);
    SetTrainerPicSlideDirection(task->tPlayerSpriteId, 1);

    // Start opponent slide
    IncrementTrainerPicState(task->tOpponentSpriteId);
    PlaySE(SE_MUGSHOT);
    sTransitionData->vblankDma++;
    return FALSE;
}

static bool8 Mugshot_WaitStartPlayerSlide(struct Task *task)
{
    sTransitionData->bg0HOfsOpponent -= 8;
    sTransitionData->bg0HOfsPlayer += 8;

    // Start player's slide in once the opponent is finished
    if (IsTrainerPicSlideDone(task->tOpponentSpriteId))
    {
        task->tState++;
        IncrementTrainerPicState(task->tPlayerSpriteId);
    }
    return FALSE;
}

static bool8 Mugshot_WaitPlayerSlide(struct Task *task)
{
    sTransitionData->bg0HOfsOpponent -= 8;
    sTransitionData->bg0HOfsPlayer += 8;

    if (IsTrainerPicSlideDone(task->tPlayerSpriteId))
    {
        sTransitionData->vblankDma = FALSE;
        SetVBlankCallback(NULL);
        DmaStop(0);
        memset(gScanlineEffectRegBuffers[0], 0, DISPLAY_HEIGHT * 2);
        memset(gScanlineEffectRegBuffers[1], 0, DISPLAY_HEIGHT * 2);
        SetGpuReg(REG_OFFSET_WIN0H, DISPLAY_WIDTH);
        SetGpuReg(REG_OFFSET_BLDY, 0);
        task->tState++;
        task->tTimer = 0;
        task->tFadeSpread = 0;
        sTransitionData->bldCnt = BLDCNT_TGT1_ALL | BLDCNT_EFFECT_LIGHTEN;
        SetVBlankCallback(VBlankCB_MugshotsFadeOut);
    }
    return FALSE;
}

static bool8 Mugshot_GradualWhiteFade(struct Task *task)
{
    bool32 active;

    sTransitionData->vblankDma = FALSE;
    active = TRUE;
    sTransitionData->bg0HOfsOpponent -= 8;
    sTransitionData->bg0HOfsPlayer += 8;

    if (task->tFadeSpread < DISPLAY_HEIGHT / 2)
        task->tFadeSpread += 2;
    if (task->tFadeSpread > DISPLAY_HEIGHT / 2)
        task->tFadeSpread = DISPLAY_HEIGHT / 2;

    if (++task->tTimer & 1)
    {
        s16 i;
        for (i = 0, active = FALSE; i <= task->tFadeSpread; i++)
        {
            // Fade starts in middle of screen and
            // spreads outwards in both directions.
            s16 y1 = DISPLAY_HEIGHT / 2 - i;
            s16 y2 = DISPLAY_HEIGHT / 2 + i;
            if (gScanlineEffectRegBuffers[0][y1] <= 15)
            {
                active = TRUE;
                gScanlineEffectRegBuffers[0][y1]++;
            }
            if (gScanlineEffectRegBuffers[0][y2] <= 15)
            {
                active = TRUE;
                gScanlineEffectRegBuffers[0][y2]++;
            }
        }
    }
    if (task->tFadeSpread == DISPLAY_HEIGHT / 2 && !active)
        task->tState++;
    sTransitionData->vblankDma++;
    return FALSE;
}

// Set palette to white to replace the scanline white fade
// before the screen fades to black.
static bool8 Mugshot_InitFadeWhiteToBlack(struct Task *task)
{
    sTransitionData->vblankDma = FALSE;
    BlendPalettes(PALETTES_ALL, 16, RGB_WHITE);
    sTransitionData->bldCnt = BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_DARKEN;
    task->tTimer = 0;
    task->tState++;
    return TRUE;
}

static bool8 Mugshot_FadeToBlack(struct Task *task)
{
    sTransitionData->vblankDma = FALSE;
    task->tTimer++;
    memset(gScanlineEffectRegBuffers[0], task->tTimer, DISPLAY_HEIGHT * 2);
    if (task->tTimer > 15)
        task->tState++;
    sTransitionData->vblankDma++;
    return FALSE;
}

static bool8 Mugshot_End(struct Task *task)
{
    DmaStop(0);
    FadeScreenBlack();
    DestroyTask(FindTaskIdByFunc(task->func));
    return FALSE;
}

static void VBlankCB_Mugshots(void)
{
    DmaStop(0);
    VBlankCB_BattleTransition();
    if (sTransitionData->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], DISPLAY_HEIGHT * 2);
    SetGpuReg(REG_OFFSET_BG0VOFS, sTransitionData->bg0VOfs);
    SetGpuReg(REG_OFFSET_WININ, sTransitionData->winIn);
    SetGpuReg(REG_OFFSET_WINOUT, sTransitionData->winOut);
    SetGpuReg(REG_OFFSET_WIN0V, sTransitionData->win0V);
    DmaSet(0, gScanlineEffectRegBuffers[1], &REG_WIN0H, B_TRANS_DMA_FLAGS);
}

static void VBlankCB_MugshotsFadeOut(void)
{
    DmaStop(0);
    VBlankCB_BattleTransition();
    if (sTransitionData->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], DISPLAY_HEIGHT * 2);
    SetGpuReg(REG_OFFSET_BLDCNT, sTransitionData->bldCnt);
    DmaSet(0, gScanlineEffectRegBuffers[1], &REG_BLDY, B_TRANS_DMA_FLAGS);
}

static void HBlankCB_Mugshots(void)
{
    if (REG_VCOUNT < DISPLAY_HEIGHT / 2)
        REG_BG0HOFS = sTransitionData->bg0HOfsOpponent;
    else
        REG_BG0HOFS = sTransitionData->bg0HOfsPlayer;
}


static void Mugshots_CreateTrainerPics(struct Task *task)
{
    struct Sprite *opponentSprite, *playerSprite;
    s16 mugshotId;

    gReservedSpritePaletteCount = 10;
    mugshotId = task->tMugshotId;
    task->tOpponentSpriteId = CreateTrainerSprite(sMugshotsTrainerPicIDsTable[mugshotId],
                                                  sMugshotsOpponentCoords[mugshotId][0] - 32,
                                                  sMugshotsOpponentCoords[mugshotId][1] + 42,
                                                  0, gDecompressionBuffer);
    task->tPlayerSpriteId = CreateTrainerSprite(PlayerGenderToFrontTrainerPicId(gSaveBlock2Ptr->playerGender, TRUE),
                                                DISPLAY_WIDTH + 32,
                                                106,
                                                0, gDecompressionBuffer);
    gReservedSpritePaletteCount = 12;

    opponentSprite = &gSprites[task->tOpponentSpriteId];
    playerSprite = &gSprites[task->tPlayerSpriteId];

    opponentSprite->callback = SpriteCB_MugshotTrainerPic;
    playerSprite->callback = SpriteCB_MugshotTrainerPic;

    opponentSprite->oam.affineMode = ST_OAM_AFFINE_DOUBLE;
    playerSprite->oam.affineMode = ST_OAM_AFFINE_DOUBLE;

    opponentSprite->oam.matrixNum = AllocOamMatrix();
    playerSprite->oam.matrixNum = AllocOamMatrix();

    opponentSprite->oam.shape = SPRITE_SHAPE(64x32);
    playerSprite->oam.shape = SPRITE_SHAPE(64x32);

    opponentSprite->oam.size = SPRITE_SIZE(64x32);
    playerSprite->oam.size = SPRITE_SIZE(64x32);

    CalcCenterToCornerVec(opponentSprite, SPRITE_SHAPE(64x32), SPRITE_SIZE(64x32), ST_OAM_AFFINE_DOUBLE);
    CalcCenterToCornerVec(playerSprite, SPRITE_SHAPE(64x32), SPRITE_SIZE(64x32), ST_OAM_AFFINE_DOUBLE);

    SetOamMatrixRotationScaling(opponentSprite->oam.matrixNum, sMugshotsOpponentRotationScales[mugshotId][0], sMugshotsOpponentRotationScales[mugshotId][1], 0);
    SetOamMatrixRotationScaling(playerSprite->oam.matrixNum, -512, 512, 0);
}

static void SpriteCB_MugshotTrainerPic(struct Sprite *sprite)
{
    while (sMugshotTrainerPicFuncs[sprite->sState](sprite));
}

// Wait until IncrementTrainerPicState is called
static bool8 MugshotTrainerPic_Pause(struct Sprite *sprite)
{
    return FALSE;
}

static bool8 MugshotTrainerPic_Init(struct Sprite *sprite)
{
    s16 speeds[ARRAY_COUNT(sTrainerPicSlideSpeeds)];
    s16 accels[ARRAY_COUNT(sTrainerPicSlideAccels)];

    memcpy(speeds, sTrainerPicSlideSpeeds, sizeof(sTrainerPicSlideSpeeds));
    memcpy(accels, sTrainerPicSlideAccels, sizeof(sTrainerPicSlideAccels));
    sprite->sState++;
    sprite->sSlideSpeed = speeds[sprite->sSlideDir];
    sprite->sSlideAccel = accels[sprite->sSlideDir];
    return TRUE;
}

static bool8 MugshotTrainerPic_Slide(struct Sprite *sprite)
{
    sprite->x += sprite->sSlideSpeed;

    // Advance state when pic passes ~40% of screen
    if (sprite->sSlideDir && sprite->x < DISPLAY_WIDTH - 107)
        sprite->sState++;
    else if (!sprite->sSlideDir && sprite->x > 103)
        sprite->sState++;
    return FALSE;
}

static bool8 MugshotTrainerPic_SlideSlow(struct Sprite *sprite)
{
    // Add acceleration value to speed, then add speed.
    // For both sides acceleration is opposite speed, so slide slows down.
    sprite->sSlideSpeed += sprite->sSlideAccel;
    sprite->x += sprite->sSlideSpeed;

    // Advance state when slide comes to a stop
    if (sprite->sSlideSpeed == 0)
    {
        sprite->sState++;
        sprite->sSlideAccel = -sprite->sSlideAccel;
        sprite->sDone = TRUE;
    }
    return FALSE;
}

// Slides trainer pic offscreen. This is never reached, because it's preceded
// by a second MugshotTrainerPic_Pause, and IncrementTrainerPicState is
// only called once per trainer pic.
static bool8 MugshotTrainerPic_SlideOffscreen(struct Sprite *sprite)
{
    sprite->sSlideSpeed += sprite->sSlideAccel;
    sprite->x += sprite->sSlideSpeed;
    if (sprite->x < -31 || sprite->x > DISPLAY_WIDTH + 31)
        sprite->sState++;
    return FALSE;
}

static void SetTrainerPicSlideDirection(s16 spriteId, bool16 dirId)
{
    gSprites[spriteId].sSlideDir = dirId;
}

static void IncrementTrainerPicState(s16 spriteId)
{
    gSprites[spriteId].sState++;
}

static s16 IsTrainerPicSlideDone(s16 spriteId)
{
    return gSprites[spriteId].sDone;
}

#undef sState
#undef sSlideSpeed
#undef sSlideAccel
#undef sDone
#undef sSlideDir
#undef tSinIndex
#undef tTopBannerX
#undef tBottomBannerX
#undef tTimer
#undef tFadeSpread
#undef tOpponentSpriteId
#undef tPlayerSpriteId
#undef tMugshotId

//--------------------
// B_TRANSITION_SLICE
//--------------------

#define tEffectX data[1]
#define tSpeed data[2]
#define tAccel data[3]

static void Task_Slice(u8 taskId)
{
    while (sSlice_Funcs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 Slice_Init(struct Task *task)
{
    u16 i;

    InitTransitionData();
    ScanlineEffect_Clear();
    task->tSpeed = 1 << 8;
    task->tAccel = 1;
    sTransitionData->winIn = WININ_WIN0_ALL;
    sTransitionData->winOut = 0;
    sTransitionData->win0V = DISPLAY_HEIGHT;
    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        gScanlineEffectRegBuffers[1][i] = sTransitionData->cameraX;
        gScanlineEffectRegBuffers[1][DISPLAY_HEIGHT + i] = DISPLAY_WIDTH;
    }
    EnableInterrupts(INTR_FLAG_HBLANK);
    SetVBlankCallback(VBlankCB_Slice);
    SetHBlankCallback(HBlankCB_Slice);
    task->tState++;
    return TRUE;
}

static bool8 Slice_Main(struct Task *task)
{
    u16 i;

    sTransitionData->vblankDma = FALSE;
    task->tEffectX += (task->tSpeed >> 8);
    if (task->tEffectX > DISPLAY_WIDTH)
        task->tEffectX = DISPLAY_WIDTH;
    if (task->tSpeed <= 0xFFF)
        task->tSpeed += task->tAccel;
    if (task->tAccel < 128)
        task->tAccel <<= 1;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        u16 *ofsBuffer = &gScanlineEffectRegBuffers[0][i];
        u16 *win0HBuffer = &gScanlineEffectRegBuffers[0][i + DISPLAY_HEIGHT];
        
        // Alternate rows
        if (i & 1)
        {
            *ofsBuffer = sTransitionData->cameraX + task->tEffectX;
            *win0HBuffer = DISPLAY_WIDTH - task->tEffectX;
        }
        else
        {
            *ofsBuffer = sTransitionData->cameraX - task->tEffectX;
            *win0HBuffer = WIN_RANGE(task->tEffectX, DISPLAY_WIDTH + 1);
        }
    }
    if (task->tEffectX >= DISPLAY_WIDTH)
        task->tState++;
    sTransitionData->vblankDma++;
    return FALSE;
}

static bool8 Slice_End(struct Task *task)
{
    DmaStop(0);
    FadeScreenBlack();
    DestroyTask(FindTaskIdByFunc(Task_Slice));
    return FALSE;
}

static void VBlankCB_Slice(void)
{
    DmaStop(0);
    VBlankCB_BattleTransition();
    SetGpuReg(REG_OFFSET_WININ, sTransitionData->winIn);
    SetGpuReg(REG_OFFSET_WINOUT, sTransitionData->winOut);
    SetGpuReg(REG_OFFSET_WIN0V, sTransitionData->win0V);
    if (sTransitionData->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], DISPLAY_HEIGHT * 4);
    DmaSet(0, &gScanlineEffectRegBuffers[1][DISPLAY_HEIGHT], &REG_WIN0H, B_TRANS_DMA_FLAGS);
}

static void HBlankCB_Slice(void)
{
    s16 offset = gScanlineEffectRegBuffers[1][REG_VCOUNT];
    
    REG_BG1HOFS = offset;
    REG_BG2HOFS = offset;
    REG_BG3HOFS = offset;
}

#undef tEffectX
#undef tSpeed
#undef tAccel

//------------------------------
// B_TRANSITION_WHITE_BARS_FADE
//------------------------------

#define sFade            data[0]
#define sFinished        data[1]
#define sDestroyAttempts data[2]
#define sDelay           data[5]
#define sIsMainSprite    data[6]

#define FADE_TARGET (16 << 8)

static void Task_WhiteBarsFade(u8 taskId)
{
    while (sWhiteBarsFade_Funcs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 WhiteBarsFade_Init(struct Task *task)
{
    u16 i;

    InitTransitionData();
    ScanlineEffect_Clear();
    sTransitionData->bldCnt = BLDCNT_TGT1_ALL | BLDCNT_EFFECT_LIGHTEN;
    sTransitionData->bldY = 0;
    sTransitionData->winIn = WINOUT_WIN01_BG1 | WINOUT_WIN01_BG2 | WINOUT_WIN01_BG3 | WINOUT_WIN01_OBJ;
    sTransitionData->winOut = WINOUT_WIN01_ALL;
    sTransitionData->win0V = DISPLAY_HEIGHT;
    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        gScanlineEffectRegBuffers[1][i] = 0;
        gScanlineEffectRegBuffers[1][i + DISPLAY_HEIGHT] = DISPLAY_WIDTH;
    }
    EnableInterrupts(INTR_FLAG_HBLANK);
    SetHBlankCallback(HBlankCB_WhiteBarsFade);
    SetVBlankCallback(VBlankCB_WhiteBarsFade);
    task->tState++;
    return FALSE;
}

static bool8 WhiteBarsFade_StartBars(struct Task *task)
{
    s16 i, posY;
    s16 delays[ARRAY_COUNT(sWhiteBarsFade_StartDelays)];
    struct Sprite *sprite;
    memcpy(delays, sWhiteBarsFade_StartDelays, sizeof(sWhiteBarsFade_StartDelays));

    for (i = 0, posY = 0; i < NUM_WHITE_BARS; i++, posY += WHITE_BAR_HEIGHT)
    {
        sprite = &gSprites[CreateInvisibleSprite(SpriteCB_WhiteBarFade)];
        sprite->x = DISPLAY_WIDTH;
        sprite->y = posY;
        sprite->sDelay = delays[i];
    }

    // Set on one sprite only. This one will enable the DMA
    // copy in VBlank and wait for the others to destroy.
    sprite->sIsMainSprite++;

    task->tState++;
    return FALSE;
}

static bool8 WhiteBarsFade_WaitBars(struct Task *task)
{
    sTransitionData->vblankDma = FALSE;
    if (sTransitionData->counter >= NUM_WHITE_BARS)
    {
        BlendPalettes(PALETTES_ALL, 16, RGB_WHITE);
        task->tState++;
    }
    return FALSE;
}

static bool8 WhiteBarsFade_BlendToBlack(struct Task *task)
{
    sTransitionData->vblankDma = FALSE;
    DmaStop(0);
    SetVBlankCallback(NULL);
    SetHBlankCallback(NULL);
    sTransitionData->win0H = DISPLAY_WIDTH;
    sTransitionData->bldY = 0;
    sTransitionData->bldCnt = BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_DARKEN;
    sTransitionData->winIn = WININ_WIN0_ALL;
    sTransitionData->counter = 0;
    SetVBlankCallback(VBlankCB_WhiteBarsFade_Blend);
    task->tState++;
    return FALSE;
}

static bool8 WhiteBarsFade_End(struct Task *task)
{
   sTransitionData->counter += 480;
   sTransitionData->bldY = sTransitionData->counter >> 8;
   if (sTransitionData->bldY > 16)
   {
       FadeScreenBlack();
       DestroyTask(FindTaskIdByFunc(Task_WhiteBarsFade));
   }
   return FALSE;
}

static void VBlankCB_WhiteBarsFade(void)
{
    DmaStop(0);
    VBlankCB_BattleTransition();
    SetGpuReg(REG_OFFSET_BLDCNT, sTransitionData->bldCnt);
    SetGpuReg(REG_OFFSET_WININ, sTransitionData->winIn);
    SetGpuReg(REG_OFFSET_WINOUT, sTransitionData->winOut);
    SetGpuReg(REG_OFFSET_WIN0V, sTransitionData->win0H); // BUG: This should obviously be sTransitionData->win0V
    if (sTransitionData->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], DISPLAY_HEIGHT * 4);
    DmaSet(0, &gScanlineEffectRegBuffers[1][DISPLAY_HEIGHT], &REG_WIN0H, B_TRANS_DMA_FLAGS);
}

static void VBlankCB_WhiteBarsFade_Blend(void)
{
    VBlankCB_BattleTransition();
    SetGpuReg(REG_OFFSET_BLDY, sTransitionData->bldY);
    SetGpuReg(REG_OFFSET_BLDCNT, sTransitionData->bldCnt);
    SetGpuReg(REG_OFFSET_WININ, sTransitionData->winIn);
    SetGpuReg(REG_OFFSET_WINOUT, sTransitionData->winOut);
    SetGpuReg(REG_OFFSET_WIN0H, sTransitionData->win0H);
    SetGpuReg(REG_OFFSET_WIN0V, sTransitionData->win0V);
}


static void HBlankCB_WhiteBarsFade(void)
{
    vu16 index = REG_VCOUNT;

    if (index == 227)
        index = 0;
    REG_BLDY = gScanlineEffectRegBuffers[1][index];
}

static void SpriteCB_WhiteBarFade(struct Sprite *sprite)
{
    if (sprite->sDelay)
    {
        sprite->sDelay--;
        if (sprite->sIsMainSprite)
            sTransitionData->vblankDma = TRUE;
    }
    else
    {
        u16 i;
        u16 *bldY = &gScanlineEffectRegBuffers[0][sprite->y];
        u16 *win0H = &gScanlineEffectRegBuffers[0][sprite->y + DISPLAY_HEIGHT];

        // Each bar is 27 pixels high. With 6 bars this is a total of 162, which is 2 pixels taller than the screen.
        // 1 bar is therefore shortened by 2 pixels
        u32 stripeWidth = sprite->sIsMainSprite ? (WHITE_BAR_HEIGHT - 2) : WHITE_BAR_HEIGHT;
        
        for (i = 0; i < stripeWidth; i++)
        {
            bldY[i] = sprite->sFade >> 8;
            win0H[i] = (u8)(sprite->x);
        }
        if (sprite->x == 0 && sprite->sFade == FADE_TARGET)
            sprite->sFinished = TRUE;
        sprite->x -= 24;
        sprite->sFade += 192;
        if (sprite->x < 0)
            sprite->x = 0;
        if (sprite->sFade > FADE_TARGET)
            sprite->sFade = FADE_TARGET;
        if (sprite->sIsMainSprite)
            sTransitionData->vblankDma = TRUE;
        if (sprite->sFinished)
        {
            if (sprite->sIsMainSprite == FALSE || (sTransitionData->counter > 4))
            {
                sTransitionData->counter++;
                DestroySprite(sprite);
            }
        }
    }
}

#undef sFade
#undef sFinished
#undef sDestroyAttempts
#undef sDelay
#undef sIsMainSprite

//---------------------------
// B_TRANSITION_GRID_SQUARES
//---------------------------

#define tDelay       data[1]
#define tShrinkStage data[2]

static void Task_GridSquares(u8 taskId)
{
    while (sGridSquares_Funcs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 GridSquares_Init(struct Task *task)
{
    u16 *tilemap, *tileset;

    GetBg0TilesDst(&tilemap, &tileset);
    CpuCopy16(sGridSquare_Gfx, tileset, 0x20);
    CpuFill16(0xF0 << 8, tilemap, BG_SCREEN_SIZE);
    LoadPalette(sFieldEffectPal_Pokeball, BG_PLTT_ID(15), sizeof(sFieldEffectPal_Pokeball));
    task->tState++;
    return FALSE;
}

static bool8 GridSquares_Main(struct Task *task)
{
    u16 *tileset;

    if (task->tDelay == 0)
    {
        GetBg0TilemapDst(&tileset);
        task->tDelay = 3;
        task->tShrinkStage++;
        CpuCopy16(&sGridSquare_Gfx[task->tShrinkStage * 8], tileset, 0x20);
        if (task->tShrinkStage > 13)
        {
            task->tState++;
            task->tDelay = 16;
        }
    }
    task->tDelay--;
    return FALSE;
}

static bool8 GridSquares_End(struct Task *task)
{
    if (--task->tDelay == 0)
    {
        FadeScreenBlack();
        DestroyTask(FindTaskIdByFunc(Task_GridSquares));
    }
    return FALSE;
}

#undef tDelay
#undef tShrinkStage

//---------------------------
// B_TRANSITION_ANGLED_WIPES
//---------------------------

#define tWipeId data[1]
#define tDir    data[2]
#define tDelay  data[3]

static void Task_AngledWipes(u8 taskId)
{
    while (sAngledWipes_Funcs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 AngledWipes_Init(struct Task *task)
{
    u16 i;

    InitTransitionData();
    ScanlineEffect_Clear();
    sTransitionData->winIn = WININ_WIN0_ALL;
    sTransitionData->winOut = 0;
    sTransitionData->win0V = DISPLAY_HEIGHT;
    for (i = 0; i < DISPLAY_HEIGHT; i++)
        gScanlineEffectRegBuffers[0][i] = WIN_RANGE(0, DISPLAY_WIDTH);
    CpuCopy16(gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], DISPLAY_HEIGHT * 2);
    SetVBlankCallback(VBlankCB_AngledWipes);
    task->tState++;
    return TRUE;
}

static bool8 AngledWipes_SetWipeData(struct Task *task)
{
    InitBlackWipe(sTransitionData->data,
                  sAngledWipes_MoveData[task->tWipeId][0],
                  sAngledWipes_MoveData[task->tWipeId][1],
                  sAngledWipes_MoveData[task->tWipeId][2],
                  sAngledWipes_MoveData[task->tWipeId][3],
                  1, 1);
    task->tDir = sAngledWipes_MoveData[task->tWipeId][4];
    task->tState++;
    return TRUE;
}

static bool8 AngledWipes_DoWipe(struct Task *task)
{
    s16 i;
    bool8 finished;

    sTransitionData->vblankDma = FALSE;
    for (i = 0, finished = FALSE; i < 16; i++)
    {
        s16 left = gScanlineEffectRegBuffers[0][sTransitionData->tWipeCurrY] >> 8;
        s16 right = gScanlineEffectRegBuffers[0][sTransitionData->tWipeCurrY] & 0xFF;
        if (task->tDir == 0)
        {
            // Moving down
            if (left < sTransitionData->tWipeCurrX)
                left = sTransitionData->tWipeCurrX;
            if (left > right)
                left = right;
        }
        else
        {
            // Moving up
            if (right > sTransitionData->tWipeCurrX)
                right = sTransitionData->tWipeCurrX;
            if (right <= left)
                right = left;
        }
        gScanlineEffectRegBuffers[0][sTransitionData->tWipeCurrY] = WIN_RANGE2(left, right);
        if (finished)
        {
            task->tState++;
            break;
        }
        finished = UpdateBlackWipe(sTransitionData->data, TRUE, TRUE);
    }
    sTransitionData->vblankDma++;
    return FALSE;
}

static bool8 AngledWipes_TryEnd(struct Task *task)
{
    if (++task->tWipeId < NUM_ANGLED_WIPES)
    {
        // Continue with next wipe
        task->tState++;
        task->tDelay = sAngledWipes_EndDelays[task->tWipeId - 1];
        return TRUE;
    }
    else
    {
        // End transition
        DmaStop(0);
        FadeScreenBlack();
        DestroyTask(FindTaskIdByFunc(Task_AngledWipes));
        return FALSE;
    }
}

static bool8 AngledWipes_StartNext(struct Task *task)
{
    if (--task->tDelay == 0)
    {
        // Return to AngledWipes_SetWipeData
        task->tState = 1;
        return TRUE;
    }
    else
        return FALSE;
}

static void VBlankCB_AngledWipes(void)
{
    DmaStop(0);
    VBlankCB_BattleTransition();
    if (sTransitionData->vblankDma)
        DmaCopy16(3, gScanlineEffectRegBuffers[0], gScanlineEffectRegBuffers[1], DISPLAY_HEIGHT * 2);
    SetGpuReg(REG_OFFSET_WININ, sTransitionData->winIn);
    SetGpuReg(REG_OFFSET_WINOUT, sTransitionData->winOut);
    SetGpuReg(REG_OFFSET_WIN0V, sTransitionData->win0V);
    SetGpuReg(REG_OFFSET_WIN0H, gScanlineEffectRegBuffers[1][0]);
    DmaSet(0, gScanlineEffectRegBuffers[1], &REG_WIN0H, B_TRANS_DMA_FLAGS);
}

#undef tWipeId
#undef tDir
#undef tDelay

//-----------------------------------
// Transition intro
//-----------------------------------

#define tFadeToGrayDelay   data[1]
#define tFadeFromGrayDelay data[2]
#define tNumFades          data[3]
#define tFadeToGraySpeed   data[4]
#define tFadeFromGraySpeed data[5]
#define tDelayTimer        data[6]
#define tBlend             data[7]

static void CreateIntroTask(s16 fadeToGrayDelay, s16 fadeFromGrayDelay, s16 numFades, s16 fadeToGraySpeed, s16 fadeFromGraySpeed)
{
    u8 taskId = CreateTask(Task_BattleTransition_Intro, 3);
    gTasks[taskId].tFadeToGrayDelay = fadeToGrayDelay;
    gTasks[taskId].tFadeFromGrayDelay = fadeFromGrayDelay;
    gTasks[taskId].tNumFades = numFades;
    gTasks[taskId].tFadeToGraySpeed = fadeToGraySpeed;
    gTasks[taskId].tFadeFromGraySpeed = fadeFromGraySpeed;
    gTasks[taskId].tDelayTimer = fadeToGrayDelay;
}

static bool8 IsIntroTaskDone(void)
{
    if (FindTaskIdByFunc(Task_BattleTransition_Intro) == TASK_NONE)
        return TRUE;
    else
        return FALSE;
}

static void Task_BattleTransition_Intro(u8 taskId)
{
    while (sTransitionIntroFuncs[gTasks[taskId].tState](&gTasks[taskId]));
}

static bool8 TransitionIntro_FadeToGray(struct Task *task)
{
    if (task->tDelayTimer == 0 || --task->tDelayTimer == 0)
    {
        task->tDelayTimer = task->tFadeToGrayDelay;
        task->tBlend += task->tFadeToGraySpeed;
        if (task->tBlend > 16)
            task->tBlend = 16;
        BlendPalettes(-1, task->tBlend, RGB(11, 11, 11));
    }
    if (task->tBlend >= 16)
    {
        // Fade to gray complete, start fade back
        task->tState++;
        task->tDelayTimer = task->tFadeFromGrayDelay;
    }
    return FALSE;
}

static bool8 TransitionIntro_FadeFromGray(struct Task *task)
{
    if (task->tDelayTimer == 0 || --task->tDelayTimer == 0)
    {
        task->tDelayTimer = task->tFadeFromGrayDelay;
        task->tBlend -= task->tFadeFromGraySpeed;
        if (task->tBlend < 0)
            task->tBlend = 0;
        BlendPalettes(PALETTES_ALL, task->tBlend, RGB(11, 11, 11));
    }
    if (task->tBlend == 0)
    {
        if (--task->tNumFades == 0)
        {
            // All fades done, end intro
            DestroyTask(FindTaskIdByFunc(Task_BattleTransition_Intro));
        }
        else
        {
            // Fade from gray complete, start new fade
            task->tDelayTimer = task->tFadeToGrayDelay;
            task->tState = 0;
        }
    }
    return FALSE;
}

#undef tFadeToGrayDelay
#undef tFadeFromGrayDelay
#undef tNumFades
#undef tFadeToGraySpeed
#undef tFadeFromGraySpeed
#undef tDelayTimer
#undef tBlend

//-----------------------------------
// General transition functions
//-----------------------------------

static void InitTransitionData(void)
{
    memset(sTransitionData, 0, sizeof(*sTransitionData));
    FieldCameraGetPixelOffsetAtGround(&sTransitionData->cameraX, &sTransitionData->cameraY);
}

static void VBlankCB_BattleTransition(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void GetBg0TilemapDst(u16 **tilesetPtr)
{
    u16 charBase;

    charBase = GetGpuReg(REG_OFFSET_BG0CNT) >> 2;
    charBase <<= 14;
    *tilesetPtr = (u16 *)(VRAM + charBase);
}

static void GetBg0TilesDst(u16 **tilemapPtr, u16 **tilesetPtr)
{
    u16 screenBase, charBase;

    screenBase = (GetGpuReg(REG_OFFSET_BG0CNT) >> 8) & 0x1F;
    charBase = GetGpuReg(REG_OFFSET_BG0CNT) >> 2;
    screenBase <<= 11;
    charBase <<= 14;
    *tilemapPtr = (u16 *)(VRAM + screenBase);
    *tilesetPtr = (u16 *)(VRAM + charBase);
}

static void FadeScreenBlack(void)
{
    BlendPalettes(PALETTES_ALL, 16, RGB_BLACK);
}

static void SetSinWave(s16 *buffer, s16 offset, s16 index, s16 frequency, s16 amplitude, s16 bufSize)
{
    u8 i;

    for (i = 0; bufSize > 0; bufSize--, i++, index += frequency)
        buffer[i] = offset + Sin(index & 0xFF, amplitude);
}

static void SetCircularMask(s16 *buffer, s16 x, s16 y, s16 radius)
{
    s16 i;

    memset(buffer, 10, DISPLAY_HEIGHT * sizeof(u16));
    // 64 iterations because we only want to cover [0, π/2) discretely.
    for (i = 0; i < 64; i++)
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
        if (winVal > DISPLAY_WIDTH)
            winVal = DISPLAY_WIDTH;
        if (topY < 0)
            topY = 0;
        if (bottomY > DISPLAY_HEIGHT - 1)
            bottomY = DISPLAY_HEIGHT - 1;
        winVal |= (leftX << 8);
        buffer[topY] = winVal;
        buffer[bottomY] = winVal;
        cosResult = Cos(i + 1, radius);
        nextTopY = y - cosResult;
        nextBottomY = y + cosResult;
        if (nextTopY < 0)
            nextTopY = 0;
        if (nextBottomY > DISPLAY_HEIGHT - 1)
            nextBottomY = DISPLAY_HEIGHT - 1;
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

static void InitBlackWipe(s16 *data, s16 startX, s16 startY, s16 endX, s16 endY, s16 stepX, s16 stepY)
{
    tWipeStartX = startX;
    tWipeStartY = startY;
    tWipeCurrX = startX;
    tWipeCurrY = startY;
    tWipeEndX = endX;
    tWipeEndY = endY;
    tWipeXMove = stepX;
    tWipeYMove = stepY;
    tWipeXDist = endX - startX;
    if (tWipeXDist < 0)
    {
        // If end was less than start, reverse direction
        tWipeXDist = -tWipeXDist;
        tWipeXMove = -stepX;
    }
    tWipeYDist = endY - startY;
    if (tWipeYDist < 0)
    {
        // If end was less than start, reverse direction
        tWipeYDist = -tWipeYDist;
        tWipeYMove = -stepY;
    }
    tWipeTemp = 0;
}

static bool8 UpdateBlackWipe(s16 *data, bool8 xExact, bool8 yExact)
{
    u8 numFinished;

    if (tWipeXDist > tWipeYDist)
    {
        // X has further to move, move it first
        tWipeCurrX += tWipeXMove;
        
        // If it has been far enough since Y's
        // last move then move it too
        tWipeTemp += tWipeYDist;
        if (tWipeTemp > tWipeXDist)
        {
            tWipeCurrY += tWipeYMove;
            tWipeTemp -= tWipeXDist;
        }
    }
    else
    {
        // Y has further to move, move it first
        tWipeCurrY += tWipeYMove;
        
        // If it has been far enough since X's
        // last move then move it too
        tWipeTemp += tWipeXDist;
        if (tWipeTemp > tWipeYDist)
        {
            tWipeCurrX += tWipeXMove;
            tWipeTemp -= tWipeYDist;
        }
    }

    numFinished = 0;

    // Has X coord reached end?
    if ((tWipeXMove > 0 && tWipeCurrX >= tWipeEndX)
     || (tWipeXMove < 0 && tWipeCurrX <= tWipeEndX))
    {
        numFinished++;
        if (xExact)
            tWipeCurrX = tWipeEndX;
    }

    // Has Y coord reached end?
    if ((tWipeYMove > 0 && tWipeCurrY >= tWipeEndY)
     || (tWipeYMove < 0 && tWipeCurrY <= tWipeEndY))
    {
        numFinished++;
        if (yExact)
            tWipeCurrY = tWipeEndY;
    }

    // Return TRUE if both coords have reached end
    if (numFinished == 2)
        return TRUE;
    else
        return FALSE;
}
