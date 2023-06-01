#include "global.h"
#include "gflib.h"
#include "decompress.h"
#include "task.h"
#include "coins.h"
#include "quest_log.h"
#include "overworld.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "text_window.h"
#include "random.h"
#include "trig.h"
#include "strings.h"
#include "constants/songs.h"

#define NUM_REELS 3
#define REEL_LENGTH 21 // Total number of icons per reel

// Only 4 icons are actually visible per reel at a single
// time, with 1 on deck. Only 3 visible when not spinning.
#define REEL_LOAD_LENGTH 5

// 3 horizontal, 2 diagonal
#define NUM_MATCH_LINES 5

#define NUM_BUTTON_TILES 4
#define NUM_DIGIT_SPRITES 4

enum {
    PALSLOT_LINE_NORMAL = 4, // Loaded as part of sBg_Pal
    PALSLOT_LINE_BET,
    PALSLOT_LINE_MATCH,
};

enum {
    GFXTAG_REEL_ICONS,
    GFXTAG_CLEFAIRY,
    GFXTAG_DIGITS,
};

enum {
    PALTAG_REEL_ICONS_0,
    PALTAG_REEL_ICONS_1,
    PALTAG_REEL_ICONS_2,
    PALTAG_REEL_ICONS_3,
    PALTAG_REEL_ICONS_4,
    PALTAG_CLEFAIRY,
    PALTAG_DIGITS,
};

enum {
    ICON_7,
    ICON_ROCKET,
    ICON_PIKACHU,
    ICON_PSYDUCK,   // Psyduck in FR, Slowpoke in LG
    ICON_CHERRIES,
    ICON_MAGNEMITE, // Magnemite in FR, Voltorb in LG
    ICON_SHELLDER,  // Shellder in FR, Staryu in LG
};

enum {
    PAYOUT_NONE,
    PAYOUT_CHERRIES2,
    PAYOUT_CHERRIES3,
    PAYOUT_MAGSHELL,
    PAYOUT_PIKAPSY,
    PAYOUT_ROCKET,
    PAYOUT_7,
    NUM_PAYOUT_TYPES
};

enum {
    ROWATTR_COL1POS,
    ROWATTR_COL2POS,
    ROWATTR_COL3POS,
    ROWATTR_MINBET,
};

enum {
    SLOTTASK_GFX_INIT,
    SLOTTASK_FADEOUT_EXIT,
    SLOTTASK_UPDATE_LINE_LIGHTS,
    SLOTTASK_CLEFAIRY_BOUNCE,
    SLOTTASK_ANIM_WIN,
    SLOTTASK_END_ANIM_WIN,
    SLOTTASK_ANIM_LOSE,
    SLOTTASK_ANIM_BETTING,
    SLOTTASK_SHOW_AMOUNTS,
    SLOTTASK_MSG_NO_COINS,
    SLOTTASK_ASK_QUIT,
    SLOTTASK_DESTROY_YESNO,
    SLOTTASK_PRESS_BUTTON,
    SLOTTASK_RELEASE_BUTTONS,
    SLOTTASK_SHOWHELP,
    SLOTTASK_HIDEHELP,
};

struct SlotMachineState
{
    MainCallback savedCallback;
    u16 machineIdx;
    u16 currentReel;
    u16 machineBias;
    u16 slotRewardClass;
    u16 biasCooldown;
    u16 bet;
    u8 taskId;
    u8 spinReelsTaskId;
    bool32 reelIsSpinning[NUM_REELS];
    s16 reelPositions[NUM_REELS];
    s16 reelSubpixel[NUM_REELS];
    s16 destReelPos[NUM_REELS];
    s16 reelStopOrder[NUM_REELS];
    u32 reel2BiasInPlay;
    bool32 winFlags[NUM_MATCH_LINES];
    u16 payout;
};

struct SlotMachineGfxManager
{
    u32 field_00[NUM_REELS]; // Never read
    struct Sprite *reelIconSprites[NUM_REELS][REEL_LOAD_LENGTH];
    struct Sprite *creditDigitSprites[NUM_DIGIT_SPRITES];
    struct Sprite *payoutDigitSprites[NUM_DIGIT_SPRITES];
    struct Sprite *clefairySprites[2];
    vu16 * reelIconAffineParamPtr;
};

struct SlotMachineSetupTaskDataSub_0000
{
    u16 funcno;
    u8 state;
    bool8 active;
};

struct SlotMachineSetupTaskData
{
    struct SlotMachineSetupTaskDataSub_0000 tasks[8];
    u8 reelButtonToPress;
    // align 2
    s32 bg1X;
    bool32 yesNoMenuActive;
    u16 buttonPressedTiles[NUM_REELS][NUM_BUTTON_TILES];
    u16 buttonReleasedTiles[NUM_REELS][NUM_BUTTON_TILES];
    u8 unusedBuffer[BG_SCREEN_SIZE];
    u8 bg0TilemapBuffer[BG_SCREEN_SIZE];
    u8 bg1TilemapBuffer[BG_SCREEN_SIZE];
    u8 bg2TilemapBuffer[BG_SCREEN_SIZE];
    u8 bg3TilemapBuffer[BG_SCREEN_SIZE];
}; // size: 285C

struct LineStateTileIdxList
{
    const u16 * tiles;
    u32 count;
};

static EWRAM_DATA struct SlotMachineState * sSlotMachineState = NULL;
static EWRAM_DATA struct SlotMachineGfxManager * sSlotMachineGfxManager = NULL;

static void InitSlotMachineState(struct SlotMachineState * ptr);
static void CB2_InitSlotMachine(void);
static void CleanSupSlotMachineState(void);
static void CB2_RunSlotMachine(void);
static void MainTask_SlotsGameLoop(u8 taskId);
static void MainTask_NoCoinsGameOver(u8 taskId);
static void MainTask_ShowHelp(u8 taskId);
static void MainTask_ConfirmExitGame(u8 taskId);
static void MainTask_DarnNoPayout(u8 taskId);
static void MainTask_WinHandlePayout(u8 taskId);
static void MainTask_ExitSlots(u8 taskId);
static void SetMainTask(TaskFunc taskFunc);
static void Task_SpinReels(u8 taskId);
static void StartReels(void);
static void StopCurrentReel(u16 whichReel, u16 whichReel2);
static bool32 IsReelSpinning(u16);
static void StopReel1(u16 whichReel);
static void StopReel2(u16 whichReel);
static void StopReel3(u16 whichReel);
static bool32 TwoReelBiasCheck(s32 reel0id, s32 reel0pos, s32 reel1id, s32 reel1pos, s32 icon);
static bool32 OneReelBiasCheck(s32, s32, s32);
static bool32 TestReelIconAttribute(s32 attr, s32 icon);
static void CalcSlotBias(void);
static void ResetMachineBias(void);
static u16 CalcPayout(void);
static void InitGfxManager(struct SlotMachineGfxManager * manager);
static void UpdateReelIconSprites(const s16 *, const s16 *);
static bool32 CreateSlotMachine(void);
static void DestroySlotMachine(void);
static struct SlotMachineSetupTaskData * GetSlotMachineSetupTaskDataPtr(void);
static void Task_SlotMachine(u8 taskId);
static void SetSlotMachineSetupTask(u16 funcno, u8 taskId);
static bool32 IsSlotMachineSetupTaskActive(u8 taskId);
static bool8 SlotsTask_GraphicsInit(u8 *state, struct SlotMachineSetupTaskData * ptr);
static bool8 SlotsTask_FadeOut(u8 *state, struct SlotMachineSetupTaskData * ptr);
static bool8 SlotsTask_UpdateLineStates(u8 *state, struct SlotMachineSetupTaskData * ptr);
static bool8 SlotsTask_ClefairyUpdateOnReelsStart(u8 *state, struct SlotMachineSetupTaskData * ptr);
static bool8 SlotsTask_StartClefairyDanceAndWinningLineFlash(u8 *state, struct SlotMachineSetupTaskData * ptr);
static bool8 SlotsTask_StopWinningLineFlashTask(u8 *state, struct SlotMachineSetupTaskData * ptr);
static bool8 SlotsTask_ClefairyFainted(u8 *state, struct SlotMachineSetupTaskData * ptr);
static bool8 SlotsTask_ClefairyNeutral(u8 *state, struct SlotMachineSetupTaskData * ptr);
static bool8 SlotsTask_UpdateCoinsDisplay(u8 *state, struct SlotMachineSetupTaskData * ptr);
static bool8 SlotsTask_MessageOutOfCoins(u8 *state, struct SlotMachineSetupTaskData * ptr);
static bool8 SlotsTask_AskQuitPlaying(u8 *state, struct SlotMachineSetupTaskData * ptr);
static bool8 SlotsTask_DestroyYesNoMenu(u8 *state, struct SlotMachineSetupTaskData * ptr);
static bool8 SlotsTask_PressReelButton(u8 *state, struct SlotMachineSetupTaskData * ptr);
static bool8 SlotsTask_ReleaseReelButtons(u8 *state, struct SlotMachineSetupTaskData * ptr);
static bool8 SlotsTask_ShowHelp(u8 *state, struct SlotMachineSetupTaskData * ptr);
static bool8 SlotsTask_HideHelp(u8 *state, struct SlotMachineSetupTaskData * ptr);
static void Slot_PrintOnWindow0(const u8 * str);
static void Slot_ClearWindow0(void);
static void SetLineStatesByBet(u16 * bgTilemapBuffer);
static void SetLineState(u16 * bgTilemapBuffer, u16 lineId, u16 paletteNo);
static void Task_FlashWinningLine(u8 taskId);
static void SignalStopWinningLineFlashTask(void);
static void Slot_CreateYesNoMenu(u8 cursorPos);
static void Slot_DestroyYesNoMenu(void);
static void InitReelButtonTileMem(void);
static void SetReelButtonPressed(u8 reel);
static void ReleaseReelButtons(void);
static void PressReelButton(u8 reel, u8 taskId);

static const u8 sSecondReelBiasCheckIndices[][2] = {
    {0x00, 0x03},
    {0x00, 0x06},
    {0x03, 0x06},

    {0x01, 0x04},
    {0x01, 0x07},
    {0x04, 0x07},

    {0x02, 0x05},
    {0x02, 0x08},
    {0x05, 0x08},

    {0x00, 0x04},
    {0x00, 0x08},
    {0x04, 0x08},

    {0x02, 0x04},
    {0x02, 0x06},
    {0x04, 0x06}
};

static const u8 sThirdReelBiasCheckIndices[NUM_MATCH_LINES][3] = {
    {0x00, 0x03, 0x06}, // top row
    {0x01, 0x04, 0x07}, // middle row
    {0x02, 0x05, 0x08}, // bottom row
    {0x00, 0x04, 0x08}, // tl-br
    {0x02, 0x04, 0x06}  // bl-tr
};

static const u8 sRowAttributes[NUM_MATCH_LINES][4] = {
    {0x00, 0x04, 0x08, 0x03}, // tl-br
    {0x00, 0x03, 0x06, 0x02}, // top row
    {0x01, 0x04, 0x07, 0x01}, // middle row
    {0x02, 0x05, 0x08, 0x02}, // bottom row
    {0x02, 0x04, 0x06, 0x03}  // bl-tr
};

static const u16 sReelBiasChances[][NUM_PAYOUT_TYPES] = {
    {
        [PAYOUT_NONE]      = 0x1fa1,
        [PAYOUT_CHERRIES2] = 0x2eab,
        [PAYOUT_CHERRIES3] = 0x3630,
        [PAYOUT_MAGSHELL]  = 0x39f3,
        [PAYOUT_PIKAPSY]   = 0x3bd4,
        [PAYOUT_ROCKET]    = 0x3bfc,
        [PAYOUT_7]         = 0x0049,
    },
    {
        [PAYOUT_NONE]      = 0x1f97,
        [PAYOUT_CHERRIES2] = 0x2ea2,
        [PAYOUT_CHERRIES3] = 0x3627,
        [PAYOUT_MAGSHELL]  = 0x39e9,
        [PAYOUT_PIKAPSY]   = 0x3bca,
        [PAYOUT_ROCKET]    = 0x3bf8,
        [PAYOUT_7]         = 0x0049,
    },
    {
        [PAYOUT_NONE]      = 0x1f91,
        [PAYOUT_CHERRIES2] = 0x2e9b,
        [PAYOUT_CHERRIES3] = 0x3620,
        [PAYOUT_MAGSHELL]  = 0x39e3,
        [PAYOUT_PIKAPSY]   = 0x3bc4,
        [PAYOUT_ROCKET]    = 0x3bf4,
        [PAYOUT_7]         = 0x0049,
    },
    {
        [PAYOUT_NONE]      = 0x1f87,
        [PAYOUT_CHERRIES2] = 0x2e92,
        [PAYOUT_CHERRIES3] = 0x3617,
        [PAYOUT_MAGSHELL]  = 0x39d9,
        [PAYOUT_PIKAPSY]   = 0x3bba,
        [PAYOUT_ROCKET]    = 0x3bef,
        [PAYOUT_7]         = 0x0050,
    },
    {
        [PAYOUT_NONE]      = 0x1f7f,
        [PAYOUT_CHERRIES2] = 0x2e89,
        [PAYOUT_CHERRIES3] = 0x360e,
        [PAYOUT_MAGSHELL]  = 0x39d1,
        [PAYOUT_PIKAPSY]   = 0x3bb2,
        [PAYOUT_ROCKET]    = 0x3bea,
        [PAYOUT_7]         = 0x0050,
    },
    {
        [PAYOUT_NONE]      = 0x1fc9,
        [PAYOUT_CHERRIES2] = 0x2efc,
        [PAYOUT_CHERRIES3] = 0x3696,
        [PAYOUT_MAGSHELL]  = 0x3a63,
        [PAYOUT_PIKAPSY]   = 0x3c49,
        [PAYOUT_ROCKET]    = 0x3c8b,
        [PAYOUT_7]         = 0x0073,
    },
};

static const u8 sReelIconAnimByReelAndPos[NUM_REELS][REEL_LENGTH] = {
    {
        ICON_7,
        ICON_PSYDUCK,
        ICON_CHERRIES,
        ICON_ROCKET,
        ICON_PIKACHU,
        ICON_SHELLDER,
        ICON_PIKACHU,
        ICON_MAGNEMITE,
        ICON_7,
        ICON_SHELLDER,
        ICON_PSYDUCK,
        ICON_ROCKET,
        ICON_CHERRIES,
        ICON_PIKACHU,
        ICON_SHELLDER,
        ICON_7,
        ICON_MAGNEMITE,
        ICON_PIKACHU,
        ICON_ROCKET,
        ICON_SHELLDER,
        ICON_PIKACHU
    }, {
        ICON_7,
        ICON_MAGNEMITE,
        ICON_CHERRIES,
        ICON_PSYDUCK,
        ICON_ROCKET,
        ICON_MAGNEMITE,
        ICON_CHERRIES,
        ICON_PSYDUCK,
        ICON_PIKACHU,
        ICON_MAGNEMITE,
        ICON_CHERRIES,
        ICON_PSYDUCK,
        ICON_7,
        ICON_MAGNEMITE,
        ICON_CHERRIES,
        ICON_ROCKET,
        ICON_PSYDUCK,
        ICON_SHELLDER,
        ICON_MAGNEMITE,
        ICON_PSYDUCK,
        ICON_CHERRIES
    }, {
        ICON_7,
        ICON_PSYDUCK,
        ICON_SHELLDER,
        ICON_MAGNEMITE,
        ICON_PIKACHU,
        ICON_PSYDUCK,
        ICON_SHELLDER,
        ICON_MAGNEMITE,
        ICON_PIKACHU,
        ICON_PSYDUCK,
        ICON_MAGNEMITE,
        ICON_SHELLDER,
        ICON_PIKACHU,
        ICON_PSYDUCK,
        ICON_MAGNEMITE,
        ICON_SHELLDER,
        ICON_PIKACHU,
        ICON_PSYDUCK,
        ICON_MAGNEMITE,
        ICON_SHELLDER,
        ICON_ROCKET
    },
};

static const u16 sPayoutTable[] = {
    [PAYOUT_NONE]      =   0,
    [PAYOUT_CHERRIES2] =   2,
    [PAYOUT_CHERRIES3] =   6,
    [PAYOUT_MAGSHELL]  =   8,
    [PAYOUT_PIKAPSY]   =  15,
    [PAYOUT_ROCKET]    = 100,
    [PAYOUT_7]         = 300
};

#if defined(FIRERED)
static const u16 sReelIcons_Pal[][16] = INCBIN_U16("graphics/slot_machine/firered/reel_icons.gbapal");
static const u32 sReelIcons_Tiles[]   = INCBIN_U32("graphics/slot_machine/firered/reel_icons.4bpp.lz");
static const u16 sClefairy_Pal[]      = INCBIN_U16("graphics/slot_machine/firered/clefairy.gbapal");
static const u32 sClefairy_Tiles[]    = INCBIN_U32("graphics/slot_machine/firered/clefairy.4bpp.lz");
#elif defined(LEAFGREEN)
static const u16 sReelIcons_Pal[][16] = INCBIN_U16("graphics/slot_machine/leafgreen/reel_icons.gbapal");
static const u32 sReelIcons_Tiles[]   = INCBIN_U32("graphics/slot_machine/leafgreen/reel_icons.4bpp.lz");
static const u16 sClefairy_Pal[]      = INCBIN_U16("graphics/slot_machine/leafgreen/clefairy.gbapal");
static const u32 sClefairy_Tiles[]    = INCBIN_U32("graphics/slot_machine/leafgreen/clefairy.4bpp.lz");
#endif
static const u16 sDigits_Pal[]        = INCBIN_U16("graphics/slot_machine/digits.gbapal");
static const u32 sDigits_Tiles[]      = INCBIN_U32("graphics/slot_machine/digits.4bpp.lz");

static const struct CompressedSpriteSheet sSpriteSheets[] = {
    {.data = sReelIcons_Tiles, .size = 0xe00, .tag = GFXTAG_REEL_ICONS},
    {.data = sClefairy_Tiles,  .size = 0xc00, .tag = GFXTAG_CLEFAIRY},
    {.data = sDigits_Tiles,    .size = 0x280, .tag = GFXTAG_DIGITS},
};

static const struct SpritePalette sSpritePalettes[] = {
    {.data = sReelIcons_Pal[0], .tag = PALTAG_REEL_ICONS_0},
    {.data = sReelIcons_Pal[1], .tag = PALTAG_REEL_ICONS_1},
    {.data = sReelIcons_Pal[2], .tag = PALTAG_REEL_ICONS_2},
    {.data = sReelIcons_Pal[3], .tag = PALTAG_REEL_ICONS_3},
    {.data = sReelIcons_Pal[4], .tag = PALTAG_REEL_ICONS_4},
    {.data = sClefairy_Pal,     .tag = PALTAG_CLEFAIRY},
    {.data = sDigits_Pal,       .tag = PALTAG_DIGITS},
    {}
};

static const u16 sReelIconPaletteTags[] = {
#if defined(FIRERED)
    [ICON_7]         = PALTAG_REEL_ICONS_2,
    [ICON_ROCKET]    = PALTAG_REEL_ICONS_2,
    [ICON_PIKACHU]   = PALTAG_REEL_ICONS_0,
    [ICON_PSYDUCK]   = PALTAG_REEL_ICONS_0,
    [ICON_CHERRIES]  = PALTAG_REEL_ICONS_2,
    [ICON_MAGNEMITE] = PALTAG_REEL_ICONS_4,
    [ICON_SHELLDER]  = PALTAG_REEL_ICONS_3,
#elif defined(LEAFGREEN)
    [ICON_7]         = PALTAG_REEL_ICONS_2,
    [ICON_ROCKET]    = PALTAG_REEL_ICONS_2,
    [ICON_PIKACHU]   = PALTAG_REEL_ICONS_0,
    [ICON_PSYDUCK]   = PALTAG_REEL_ICONS_3,
    [ICON_CHERRIES]  = PALTAG_REEL_ICONS_2,
    [ICON_MAGNEMITE] = PALTAG_REEL_ICONS_1,
    [ICON_SHELLDER]  = PALTAG_REEL_ICONS_1,
#endif
};

static const u16 sReelIconAffineParams[] = {
    0x0120, 0x011f, 0x011e, 0x011d, 0x011c, 0x011b, 0x011a, 0x0119, 0x0118, 0x0117, 0x0116, 0x0115, 0x0114, 0x0113, 0x0112, 0x0111,
    0x0110, 0x010f, 0x010e, 0x010d, 0x010c, 0x010b, 0x010a, 0x0109, 0x0108, 0x0107, 0x0106, 0x0105, 0x0104, 0x0103, 0x0102, 0x0101,
    0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100,
    0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100,
    0x0101, 0x0102, 0x0103, 0x0104, 0x0105, 0x0106, 0x0107, 0x0108, 0x0109, 0x010a, 0x010b, 0x010c, 0x010d, 0x010e, 0x010f, 0x0110,
    0x0111, 0x0112, 0x0113, 0x0114, 0x0115, 0x0116, 0x0117, 0x0118, 0x0119, 0x011a, 0x011b, 0x011c, 0x011d, 0x011e, 0x011f, 0x0120
};

static const u8 sReelIconBldY[] = {
    0x10, 0x10, 0x10, 0x10, 0x0f, 0x0e, 0x0d, 0x0d, 0x0c, 0x0b, 0x0a, 0x0a, 0x09, 0x08, 0x07, 0x07, 0x06, 0x05, 0x04, 0x04, 0x03, 0x02, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x03, 0x03, 0x04, 0x05, 0x06, 0x06, 0x07, 0x08, 0x09, 0x09, 0x0a, 0x0b, 0x0c, 0x0c, 0x0d, 0x0e, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f
};

static const struct OamData sOamData_ReelIcons = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_NORMAL,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .x = 0,
    .matrixNum = 0,
    .size = ST_OAM_SIZE_2,
    .tileNum = 0,
    .priority = 3,
    .paletteNum = 0,
    .affineParam = 0
};

static const union AnimCmd sAnimCmd_ReelIcon_7[] = {
    ANIMCMD_FRAME(0x00, 4),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_ReelIcon_Rocket[] = {
    ANIMCMD_FRAME(0x10, 4),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_ReelIcon_Pikachu[] = {
    ANIMCMD_FRAME(0x20, 4),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_ReelIcon_Psyduck[] = {
    ANIMCMD_FRAME(0x30, 4),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_ReelIcon_Cherries[] = {
    ANIMCMD_FRAME(0x40, 4),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_ReelIcon_Magnemite[] = {
    ANIMCMD_FRAME(0x50, 4),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_ReelIcon_Shellder[] = {
    ANIMCMD_FRAME(0x60, 4),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_ReelIcon_Pikachu_2[] = {
    ANIMCMD_FRAME(0x20, 4),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_ReelIcon_Psyduck_2[] = {
    ANIMCMD_FRAME(0x30, 4),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_ReelIcon_Cherries_2[] = {
    ANIMCMD_FRAME(0x40, 4),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_ReelIcon_Magnemite_2[] = {
    ANIMCMD_FRAME(0x50, 4),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_ReelIcon_Shellder_2[] = {
    ANIMCMD_FRAME(0x60, 4),
    ANIMCMD_END
};

static const union AnimCmd *const sAnimTable_ReelIcons[] = {
    [ICON_7]         = sAnimCmd_ReelIcon_7,
    [ICON_ROCKET]    = sAnimCmd_ReelIcon_Rocket,
    [ICON_PIKACHU]   = sAnimCmd_ReelIcon_Pikachu,
    [ICON_PSYDUCK]   = sAnimCmd_ReelIcon_Psyduck,
    [ICON_CHERRIES]  = sAnimCmd_ReelIcon_Cherries,
    [ICON_MAGNEMITE] = sAnimCmd_ReelIcon_Magnemite,
    [ICON_SHELLDER]  = sAnimCmd_ReelIcon_Shellder,
    sAnimCmd_ReelIcon_Pikachu_2,
    sAnimCmd_ReelIcon_Psyduck_2,
    sAnimCmd_ReelIcon_Cherries_2,
    sAnimCmd_ReelIcon_Magnemite_2,
    sAnimCmd_ReelIcon_Shellder_2
};

static const union AffineAnimCmd sAffineAnimCmd_ReelIcons_Unused[] = {
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 1),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const sAffineAnimTable_ReelIcons_Unused[] = {
    sAffineAnimCmd_ReelIcons_Unused
};

static const struct SpriteTemplate sSpriteTemplate_ReelIcons = {
    .tileTag = GFXTAG_REEL_ICONS,
    .paletteTag = PALTAG_REEL_ICONS_0,
    .oam = &sOamData_ReelIcons,
    .anims = sAnimTable_ReelIcons,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOamData_Digits = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_V_RECTANGLE,
    .x = 0,
    .matrixNum = 0,
    .size = ST_OAM_SIZE_0,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0
};

static const union AnimCmd sSpriteAnim_Digit0[] = {
    ANIMCMD_FRAME(0x00, 4),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_Digit1[] = {
    ANIMCMD_FRAME(0x02, 4),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_Digit2[] = {
    ANIMCMD_FRAME(0x04, 4),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_Digit3[] = {
    ANIMCMD_FRAME(0x06, 4),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_Digit4[] = {
    ANIMCMD_FRAME(0x08, 4),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_Digit5[] = {
    ANIMCMD_FRAME(0x0a, 4),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_Digit6[] = {
    ANIMCMD_FRAME(0x0c, 4),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_Digit7[] = {
    ANIMCMD_FRAME(0x0e, 4),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_Digit8[] = {
    ANIMCMD_FRAME(0x10, 4),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_Digit9[] = {
    ANIMCMD_FRAME(0x12, 4),
    ANIMCMD_END
};

static const union AnimCmd *const sAnimTable_Digits[] = {
    sSpriteAnim_Digit0,
    sSpriteAnim_Digit1,
    sSpriteAnim_Digit2,
    sSpriteAnim_Digit3,
    sSpriteAnim_Digit4,
    sSpriteAnim_Digit5,
    sSpriteAnim_Digit6,
    sSpriteAnim_Digit7,
    sSpriteAnim_Digit8,
    sSpriteAnim_Digit9
};

static const struct SpriteTemplate sSpriteTemplate_Digits = {
    .tileTag = GFXTAG_DIGITS,
    .paletteTag = PALTAG_DIGITS,
    .oam = &sOamData_Digits,
    .anims = sAnimTable_Digits,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOamData_Clefairy = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .x = 0,
    .matrixNum = 0,
    .size = ST_OAM_SIZE_2,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0
};

static const union AnimCmd sAnimCmd_Clefairy_Neutral[] = {
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_Clefairy_Spinning[] = {
    ANIMCMD_FRAME( 0, 24),
    ANIMCMD_FRAME(16, 24),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sAnimCmd_Clefairy_Payout[] = {
    ANIMCMD_FRAME(32, 28),
    ANIMCMD_FRAME(48, 28),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sAnimCmd_Clefairy_Lose[] = {
    ANIMCMD_FRAME(64, 12),
    ANIMCMD_FRAME(80, 12),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sAnimTable_Clefairy[] = {
    sAnimCmd_Clefairy_Neutral,
    sAnimCmd_Clefairy_Spinning,
    sAnimCmd_Clefairy_Payout,
    sAnimCmd_Clefairy_Lose
};

static const struct SpriteTemplate sSpriteTemplate_Clefairy = {
    .tileTag = GFXTAG_CLEFAIRY,
    .paletteTag = PALTAG_CLEFAIRY,
    .oam = &sOamData_Clefairy,
    .anims = sAnimTable_Clefairy,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

bool8 (*const sSlotMachineSetupTasks[])(u8 *, struct SlotMachineSetupTaskData *) = {
    [SLOTTASK_GFX_INIT] = SlotsTask_GraphicsInit,
    [SLOTTASK_FADEOUT_EXIT] = SlotsTask_FadeOut,
    [SLOTTASK_UPDATE_LINE_LIGHTS] = SlotsTask_UpdateLineStates,
    [SLOTTASK_CLEFAIRY_BOUNCE] = SlotsTask_ClefairyUpdateOnReelsStart,
    [SLOTTASK_ANIM_WIN] = SlotsTask_StartClefairyDanceAndWinningLineFlash,
    [SLOTTASK_END_ANIM_WIN] = SlotsTask_StopWinningLineFlashTask,
    [SLOTTASK_ANIM_LOSE] = SlotsTask_ClefairyFainted,
    [SLOTTASK_ANIM_BETTING] = SlotsTask_ClefairyNeutral,
    [SLOTTASK_SHOW_AMOUNTS] = SlotsTask_UpdateCoinsDisplay,
    [SLOTTASK_MSG_NO_COINS] = SlotsTask_MessageOutOfCoins,
    [SLOTTASK_ASK_QUIT] = SlotsTask_AskQuitPlaying,
    [SLOTTASK_DESTROY_YESNO] = SlotsTask_DestroyYesNoMenu,
    [SLOTTASK_PRESS_BUTTON] = SlotsTask_PressReelButton,
    [SLOTTASK_RELEASE_BUTTONS] = SlotsTask_ReleaseReelButtons,
    [SLOTTASK_SHOWHELP] = SlotsTask_ShowHelp,
    [SLOTTASK_HIDEHELP] = SlotsTask_HideHelp
};

#if defined(FIRERED)
static const u16 sBg_Pal[][16]             = INCBIN_U16("graphics/slot_machine/firered/bg.gbapal");
static const u32 sBg_Tiles[]               = INCBIN_U32("graphics/slot_machine/firered/bg.4bpp.lz");
static const u32 sBg_Tilemap[]             = INCBIN_U32("graphics/slot_machine/firered/bg.bin.lz");
static const u16 sBgPal_MatchLines[]       = INCBIN_U16("graphics/slot_machine/firered/match_lines.gbapal");
static const u16 sBgPal_PayoutLight[][16]  = INCBIN_U16("graphics/slot_machine/firered/payout_lights.gbapal");
static const u32 sButtonPressed_Tiles[]    = INCBIN_U32("graphics/slot_machine/firered/button_pressed.4bpp.lz");
static const u16 sCombosWindow_Pal[]       = INCBIN_U16("graphics/slot_machine/firered/combos_window.gbapal");
static const u32 sCombosWindow_Tiles[]     = INCBIN_U32("graphics/slot_machine/firered/combos_window.4bpp.lz");
static const u32 sCombosWindow_Tilemap[]   = INCBIN_U32("graphics/slot_machine/firered/combos_window.bin.lz");
#elif defined(LEAFGREEN)
static const u16 sBg_Pal[][16]             = INCBIN_U16("graphics/slot_machine/leafgreen/bg.gbapal");
static const u32 sBg_Tiles[]               = INCBIN_U32("graphics/slot_machine/leafgreen/bg.4bpp.lz");
static const u32 sBg_Tilemap[]             = INCBIN_U32("graphics/slot_machine/leafgreen/bg.bin.lz");
static const u16 sBgPal_MatchLines[]       = INCBIN_U16("graphics/slot_machine/leafgreen/match_lines.gbapal");
static const u16 sBgPal_PayoutLight[][16]  = INCBIN_U16("graphics/slot_machine/leafgreen/payout_lights.gbapal");
static const u32 sButtonPressed_Tiles[]    = INCBIN_U32("graphics/slot_machine/leafgreen/button_pressed.4bpp.lz");
static const u16 sCombosWindow_Pal[]       = INCBIN_U16("graphics/slot_machine/leafgreen/combos_window.gbapal");
static const u32 sCombosWindow_Tiles[]     = INCBIN_U32("graphics/slot_machine/leafgreen/combos_window.4bpp.lz");
static const u32 sCombosWindow_Tilemap[]   = INCBIN_U32("graphics/slot_machine/leafgreen/combos_window.bin.lz");
#endif

static const struct BgTemplate sBgTemplates[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }, {
        .bg = 3,
        .charBaseIndex = 3,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x000
    }, {
        .bg = 2,
        .charBaseIndex = 2,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x000
    }, {
        .bg = 1,
        .charBaseIndex = 1,
        .mapBaseIndex = 28,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }
};

static const struct WindowTemplate sWindowTemplates[] = {
    {
        .bg = 0,
        .tilemapLeft = 5,
        .tilemapTop = 15,
        .width = 20,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x04f
    }, {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 0,
        .width = 30,
        .height = 2,
        .paletteNum = 14,
        .baseBlock = 0x013
    },
    DUMMY_WIN_TEMPLATE
};

static const u16 sLineTiles_TLBR[] = {
    0x00a4, 0x00a5, 0x00a6, 0x00c4, 0x00c5, 0x00c6, 0x00c7, 0x00e7, 0x012c, 0x014c, 0x0191, 0x01b1, 0x01f6, 0x0216, 0x0217, 0x0218, 0x0219, 0x0237, 0x0238, 0x0239
};

static const u16 sLineTiles_TopRow[] = {
    0x00e4, 0x00e5, 0x00e6, 0x00f7, 0x00f8, 0x00f9, 0x0104, 0x0105, 0x0106, 0x0107, 0x010c, 0x0111, 0x0116, 0x0117, 0x0118, 0x0119, 0x0124, 0x0125, 0x0126, 0x0137, 0x0138, 0x0139
};

static const u16 sLineTiles_MiddleRow[] = {
    0x0144, 0x0145, 0x0146, 0x0157, 0x0158, 0x0159, 0x0164, 0x0165, 0x0166, 0x0167, 0x016c, 0x0171, 0x0176, 0x0177, 0x0178, 0x0179, 0x0184, 0x0185, 0x0186, 0x0197, 0x0198, 0x0199
};

static const u16 sLineTiles_BottomRow[] = {
    0x01a4, 0x01a5, 0x01a6, 0x01b7, 0x01b8, 0x01b9, 0x01c4, 0x01c5, 0x01c6, 0x01c7, 0x01cc, 0x01d1, 0x01d6, 0x01d7, 0x01d8, 0x01d9, 0x01e4, 0x01e5, 0x01e6, 0x01f7, 0x01f8, 0x01f9
};

static const u16 sLineTiles_BLTR[] = {
    0x0204, 0x0205, 0x0206, 0x0224, 0x0225, 0x0226, 0x01e7, 0x0207, 0x018c, 0x01ac, 0x0131, 0x0151, 0x00d6, 0x00f6, 0x00b7, 0x00b8, 0x00b9, 0x00d7, 0x00d8, 0x00d9
};

static const struct LineStateTileIdxList sLineStateTileIdxs[NUM_MATCH_LINES] = {
    { sLineTiles_TLBR, ARRAY_COUNT(sLineTiles_TLBR) },
    { sLineTiles_TopRow, ARRAY_COUNT(sLineTiles_TopRow) },
    { sLineTiles_MiddleRow, ARRAY_COUNT(sLineTiles_MiddleRow) },
    { sLineTiles_BottomRow, ARRAY_COUNT(sLineTiles_BottomRow) },
    { sLineTiles_BLTR, ARRAY_COUNT(sLineTiles_BLTR) }
};

static const u8 sWinningLineFlashPalIdxs[2] = {2, 4};

static const struct WindowTemplate sYesNoWindowTemplate = {
    .bg = 0,
    .tilemapLeft = 19,
    .tilemapTop = 9,
    .width = 6,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x9F
};

static const u16 sReelButtonMapTileIdxs[NUM_REELS][NUM_BUTTON_TILES] = {
    {0x0229, 0x022a, 0x0249, 0x024a},
    {0x022e, 0x022f, 0x024e, 0x024f},
    {0x0233, 0x0234, 0x0253, 0x0254}
};

void PlaySlotMachine(u16 machineIdx, MainCallback savedCallback)
{
    ResetTasks();
    sSlotMachineState = Alloc(sizeof(*sSlotMachineState));
    if (sSlotMachineState == NULL)
        SetMainCallback2(savedCallback);
    else
    {
        if (machineIdx >= ARRAY_COUNT(sReelBiasChances))
            machineIdx = 0;
        sSlotMachineState->machineIdx = machineIdx;
        sSlotMachineState->savedCallback = savedCallback;
        InitSlotMachineState(sSlotMachineState);
        SetMainCallback2(CB2_InitSlotMachine);
    }
}

static void InitSlotMachineState(struct SlotMachineState * ptr)
{
    s32 i;

    ptr->currentReel = 0;
    ptr->bet = 0;
    ptr->payout = 0;
    // for whatever reason, the loop does not use the ptr param
    for (i = 0; i < NUM_REELS; i++)
    {
        sSlotMachineState->reelIsSpinning[i] = FALSE;
        sSlotMachineState->reelPositions[i] = 0;
        sSlotMachineState->reelSubpixel[i] = 0;
        sSlotMachineState->destReelPos[i] = REEL_LENGTH;
    }
}

static void CB2_InitSlotMachine(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();

    switch (gMain.state)
    {
    case 0:
        if (CreateSlotMachine())
        {
            SetMainCallback2(sSlotMachineState->savedCallback);
            CleanSupSlotMachineState();
        }
        else
        {
            SetSlotMachineSetupTask(SLOTTASK_GFX_INIT, 0);
            gMain.state++;
        }
        break;
    case 1:
        if (!IsSlotMachineSetupTaskActive(0))
        {
            sSlotMachineState->taskId = CreateTask(MainTask_SlotsGameLoop, 0);
            sSlotMachineState->spinReelsTaskId = CreateTask(Task_SpinReels, 1);
            SetMainCallback2(CB2_RunSlotMachine);
        }
        break;
    }
}

static void CleanSupSlotMachineState(void)
{
    DestroySlotMachine();
    if (sSlotMachineState != NULL)
    {
        Free(sSlotMachineState);
        sSlotMachineState = NULL;
    }
}

static void CB2_RunSlotMachine(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void MainTask_SlotsGameLoop(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        // Betting Phase
        if (GetCoins() == 0)
        {
            SetMainTask(MainTask_NoCoinsGameOver);
        }
        else if (JOY_NEW(DPAD_DOWN))
        {
            sSlotMachineState->bet++;
            RemoveCoins(1);
            PlaySE(SE_RS_SHOP);
            SetSlotMachineSetupTask(SLOTTASK_SHOW_AMOUNTS, 0);
            SetSlotMachineSetupTask(SLOTTASK_UPDATE_LINE_LIGHTS, 1);
            data[0] = 1;
        }
        else if (JOY_NEW(R_BUTTON))
        {
            s32 toAdd = 3 - sSlotMachineState->bet;
            if (GetCoins() >= toAdd)
            {
                sSlotMachineState->bet = 3;
                RemoveCoins(toAdd);
            }
            else
            {
                sSlotMachineState->bet += GetCoins();
                SetCoins(0);
            }
            PlaySE(SE_RS_SHOP);
            SetSlotMachineSetupTask(SLOTTASK_SHOW_AMOUNTS, 0);
            SetSlotMachineSetupTask(SLOTTASK_UPDATE_LINE_LIGHTS, 1);
            data[0] = 1;
        }
        else if (JOY_NEW(A_BUTTON) && sSlotMachineState->bet != 0)
        {
            data[0] = 2;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            SetMainTask(MainTask_ConfirmExitGame);
        }
        else if (JOY_NEW(DPAD_RIGHT))
        {
            SetMainTask(MainTask_ShowHelp);
        }
        break;
    case 1:
        if (!IsSlotMachineSetupTaskActive(0) && !IsSlotMachineSetupTaskActive(1))
        {
            if (sSlotMachineState->bet == 3 || GetCoins() == 0)
                data[0] = 2;
            else
                data[0] = 0;
        }
        break;
    case 2:
        SetQLPlayedTheSlots();
        CalcSlotBias();
        StartReels();
        sSlotMachineState->currentReel = 0;
        SetSlotMachineSetupTask(SLOTTASK_CLEFAIRY_BOUNCE, 0);
        data[0] = 3;
        break;
    case 3:
        if (!IsSlotMachineSetupTaskActive(0))
        {
            if (JOY_NEW(A_BUTTON))
            {
                PlaySE(SE_CONTEST_PLACE);
                StopCurrentReel(sSlotMachineState->currentReel, sSlotMachineState->currentReel);
                PressReelButton(sSlotMachineState->currentReel, 0);
                data[0] = 4;
            }
        }
        break;
    case 4:
        if (IsReelSpinning(sSlotMachineState->currentReel) == 0 && !IsSlotMachineSetupTaskActive(0))
        {
            sSlotMachineState->currentReel++;
            if (sSlotMachineState->currentReel >= NUM_REELS)
            {
                sSlotMachineState->slotRewardClass = CalcPayout();
                sSlotMachineState->bet = 0;
                sSlotMachineState->currentReel = 0;
                if (sSlotMachineState->slotRewardClass == PAYOUT_NONE)
                    SetMainTask(MainTask_DarnNoPayout);
                else
                {
                    if (sSlotMachineState->slotRewardClass == PAYOUT_7)
                        IncrementGameStat(GAME_STAT_SLOT_JACKPOTS);
                    ResetMachineBias();
                    SetMainTask(MainTask_WinHandlePayout);
                }
            }
            else
                data[0] = 3;
        }
        break;
    }
}

static void MainTask_NoCoinsGameOver(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        SetSlotMachineSetupTask(SLOTTASK_MSG_NO_COINS, 0);
        data[0]++;
        break;
    case 1:
        if (!IsSlotMachineSetupTaskActive(0))
            data[0]++;
        break;
    case 2:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
            SetMainTask(MainTask_ExitSlots);
        break;
    }
}

static void MainTask_ShowHelp(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        SetSlotMachineSetupTask(SLOTTASK_SHOWHELP, 0);
        data[0]++;
        break;
    case 1:
        if (!IsSlotMachineSetupTaskActive(0))
            data[0]++;
        break;
    case 2:
        if (JOY_NEW(DPAD_LEFT))
        {
            SetSlotMachineSetupTask(SLOTTASK_HIDEHELP, 0);
            data[0]++;
        }
        break;
    case 3:
        if (!IsSlotMachineSetupTaskActive(0))
            SetMainTask(MainTask_SlotsGameLoop);
        break;
    }
}

static void MainTask_ConfirmExitGame(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        SetSlotMachineSetupTask(SLOTTASK_ASK_QUIT, 0);
        data[0]++;
        break;
    case 1:
        if (!IsSlotMachineSetupTaskActive(0))
            data[0]++;
        break;
    case 2:
        switch (Menu_ProcessInputNoWrapClearOnChoose())
        {
        case 0:
            AddCoins(sSlotMachineState->bet);
            SetSlotMachineSetupTask(SLOTTASK_SHOW_AMOUNTS, 0);
            data[0] = 3;
            break;
        case 1:
        case -1:
            SetSlotMachineSetupTask(SLOTTASK_DESTROY_YESNO, 0);
            data[0] = 4;
            break;
        }
        break;
    case 3:
        if (!IsSlotMachineSetupTaskActive(0))
            SetMainTask(MainTask_ExitSlots);
        break;
    case 4:
        if (!IsSlotMachineSetupTaskActive(0))
            SetMainTask(MainTask_SlotsGameLoop);
        break;
    }
}

static void MainTask_DarnNoPayout(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        SetSlotMachineSetupTask(SLOTTASK_ANIM_LOSE, 0);
        data[1] = 0;
        data[0]++;
        break;
    case 1:
        data[1]++;
        if (data[1] > 60)
        {
            SetSlotMachineSetupTask(SLOTTASK_ANIM_BETTING, 0);
            SetSlotMachineSetupTask(SLOTTASK_UPDATE_LINE_LIGHTS, 1);
            SetSlotMachineSetupTask(SLOTTASK_RELEASE_BUTTONS, 2);
            data[0]++;
        }
        break;
    case 2:
        if (!IsSlotMachineSetupTaskActive(0) && !IsSlotMachineSetupTaskActive(1) && !IsSlotMachineSetupTaskActive(2))
            SetMainTask(MainTask_SlotsGameLoop);
        break;
    }
}

static void MainTask_WinHandlePayout(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        if (sSlotMachineState->slotRewardClass == PAYOUT_ROCKET || sSlotMachineState->slotRewardClass == PAYOUT_7)
            PlayFanfare(MUS_SLOTS_JACKPOT);
        else
            PlayFanfare(MUS_SLOTS_WIN);
        SetSlotMachineSetupTask(SLOTTASK_SHOW_AMOUNTS, 0);
        SetSlotMachineSetupTask(SLOTTASK_ANIM_WIN, 1);
        data[1] = 8;
        data[0]++;
        break;
    case 1:
        data[1]++;
        if (data[1] > 120)
        {
            data[1] = 8;
            if (JOY_HELD(A_BUTTON))
                data[1] = 2;
            data[0]++;
        }
        break;
    case 2:
        if (!IsSlotMachineSetupTaskActive(0))
        {
            if (IsFanfareTaskInactive() && JOY_NEW(START_BUTTON))
            {
                AddCoins(sSlotMachineState->payout);
                sSlotMachineState->payout = 0;
            }
            else
            {
                data[1]--;
                if (data[1] == 0)
                {
                    if (IsFanfareTaskInactive())
                        PlaySE(SE_PIN);
                    if (sSlotMachineState->payout != 0)
                    {
                        AddCoins(1);
                        sSlotMachineState->payout--;
                    }
                    data[1] = 8;
                    if (JOY_HELD(A_BUTTON))
                        data[1] = 2;
                }
            }
            SetSlotMachineSetupTask(SLOTTASK_SHOW_AMOUNTS, 0);
            if (sSlotMachineState->payout == 0)
                data[0]++;
        }
        break;
    case 3:
        if (IsFanfareTaskInactive() && !IsSlotMachineSetupTaskActive(0))
        {
            SetSlotMachineSetupTask(SLOTTASK_END_ANIM_WIN, 0);
            data[0]++;
        }
        break;
    case 4:
        if (!IsSlotMachineSetupTaskActive(0))
        {
            SetSlotMachineSetupTask(SLOTTASK_UPDATE_LINE_LIGHTS, 0);
            SetSlotMachineSetupTask(SLOTTASK_RELEASE_BUTTONS, 1);
            data[0]++;
        }
        break;
    case 5:
        if (!IsSlotMachineSetupTaskActive(0) && !IsSlotMachineSetupTaskActive(1))
            SetMainTask(MainTask_SlotsGameLoop);
        break;
    }
}

static void MainTask_ExitSlots(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        SetSlotMachineSetupTask(SLOTTASK_FADEOUT_EXIT, 0);
        data[0]++;
        break;
    case 1:
        if (!IsSlotMachineSetupTaskActive(0))
        {
            SetMainCallback2(sSlotMachineState->savedCallback);
            CleanSupSlotMachineState();
        }
        break;
    }
}

static void SetMainTask(TaskFunc taskFunc)
{
    gTasks[sSlotMachineState->taskId].func = taskFunc;
    gTasks[sSlotMachineState->taskId].data[0] = 0;
}

static void Task_SpinReels(u8 taskId)
{
    // taskId is never used

    s32 i;

    for (i = 0; i < NUM_REELS; i++)
    {
        if (sSlotMachineState->reelIsSpinning[i] || sSlotMachineState->reelSubpixel[i] != 0)
        {
            if (sSlotMachineState->reelSubpixel[i] != 0 || sSlotMachineState->reelPositions[i] != sSlotMachineState->destReelPos[i])
            {
                sSlotMachineState->reelSubpixel[i]++;
                if (sSlotMachineState->reelSubpixel[i] > 2)
                {
                    sSlotMachineState->reelSubpixel[i] = 0;
                    sSlotMachineState->reelPositions[i]--;
                    if (sSlotMachineState->reelPositions[i] < 0)
                        sSlotMachineState->reelPositions[i] = REEL_LENGTH - 1;
                }
                if (sSlotMachineState->reelPositions[i] != sSlotMachineState->destReelPos[i])
                    continue;
            }
            sSlotMachineState->destReelPos[i] = REEL_LENGTH;
            sSlotMachineState->reelIsSpinning[i] = FALSE;
        }
    }
    UpdateReelIconSprites(sSlotMachineState->reelPositions, sSlotMachineState->reelSubpixel);
}

static void StartReels(void)
{
    s32 i;

    for (i = 0; i < NUM_REELS; i++)
        sSlotMachineState->reelIsSpinning[i] = TRUE;
}

static void StopCurrentReel(u16 whichReel, u16 whichReel2)
{
    switch (whichReel2)
    {
    case 0:
        StopReel1(whichReel);
        break;
    case 1:
        StopReel2(whichReel);
        break;
    case 2:
        StopReel3(whichReel);
        break;
    }
}

static bool32 IsReelSpinning(u16 whichReel)
{
    return sSlotMachineState->reelIsSpinning[whichReel];
}

static s16 GetNextReelPosition(u16 whichReel)
{
    s16 position = sSlotMachineState->reelPositions[whichReel];
    if (sSlotMachineState->reelSubpixel[whichReel] != 0)
    {
        position--;
        if (position < 0)
            position = REEL_LENGTH - 1;
    }
    return position;
}

static void StopReel1(u16 whichReel)
{
    s32 i, j;
    s16 destPos;
    u8 posToSample[5];
    s16 nextPos = GetNextReelPosition(whichReel);
    s32 numPosToSample = 0;

    if (sSlotMachineState->machineBias == 0 && whichReel == 0)
    {
        for (i = 0; i < 5; i++)
        {
            for (j = 0, destPos = nextPos - i + 1; j < 3; j++, destPos++)
            {
                if (destPos >= REEL_LENGTH)
                    destPos = 0;
                if (TestReelIconAttribute(1, sReelIconAnimByReelAndPos[whichReel][destPos]))
                    break;
            }
            if (j == 3)
            {
                posToSample[numPosToSample] = i;
                numPosToSample++;
            }
        }
    }
    else if (sSlotMachineState->machineBias != 1 || whichReel == 0)
    {
        for (i = 0, destPos = nextPos + 1; i < 3; i++, destPos++)
        {
            if (destPos >= REEL_LENGTH)
                destPos = 0;
            if (TestReelIconAttribute(sSlotMachineState->machineBias, sReelIconAnimByReelAndPos[whichReel][destPos]))
            {
                posToSample[0] = 0;
                numPosToSample = 1;
                break;
            }
        }
        for (i = 0, destPos = nextPos; i < 4; i++, destPos--)
        {
            if (destPos < 0)
                destPos = REEL_LENGTH - 1;
            if (TestReelIconAttribute(sSlotMachineState->machineBias, sReelIconAnimByReelAndPos[whichReel][destPos]))
            {
                posToSample[numPosToSample] = i + 1;
                numPosToSample++;
            }
        }
    }
    if (numPosToSample == 0)
    {
        destPos = Random() % 5;
    }
    else
    {
        destPos = posToSample[Random() % numPosToSample];
    }
    destPos = nextPos - destPos;
    if (destPos < 0)
        destPos += REEL_LENGTH;
    sSlotMachineState->reelStopOrder[0] = whichReel;
    sSlotMachineState->destReelPos[whichReel] = destPos;
}

static void StopReel2(u16 whichReel)
{
    s16 pos, firstStoppedReelPos, firstStoppedReelId, nextPos;
    s32 i;
    s32 numPossiblePositions;
    u8 possiblePositions[5];

    firstStoppedReelId = sSlotMachineState->reelStopOrder[0];
    firstStoppedReelPos = sSlotMachineState->reelPositions[firstStoppedReelId] + 1;
    if (firstStoppedReelPos >= REEL_LENGTH)
        firstStoppedReelPos = 0;
    nextPos = GetNextReelPosition(whichReel);
    pos = nextPos + 1;
    if (pos >= REEL_LENGTH)
        pos = 0;
    numPossiblePositions = 0;
    for (i = 0; i < 5; i++)
    {
        if (TwoReelBiasCheck(firstStoppedReelId, firstStoppedReelPos, whichReel, pos, sSlotMachineState->machineBias))
        {
            possiblePositions[numPossiblePositions] = i;
            numPossiblePositions++;
        }
        pos--;
        if (pos < 0)
            pos = REEL_LENGTH - 1;
    }
    if (numPossiblePositions == 0)
    {
        sSlotMachineState->reel2BiasInPlay = 0;
        if (sSlotMachineState->machineBias == PAYOUT_ROCKET || sSlotMachineState->machineBias == PAYOUT_7)
            pos = 4;
        else
            pos = 0;
    }
    else
    {
        sSlotMachineState->reel2BiasInPlay = 1;
        pos = possiblePositions[0];
    }
    pos = nextPos - pos;
    if (pos < 0)
        pos += REEL_LENGTH;
    sSlotMachineState->reelStopOrder[1] = whichReel;
    sSlotMachineState->destReelPos[whichReel] = pos;
}

static void StopReel3(u16 whichReel)
{
    s32 i;
    s32 numPossiblePositions;
    s32 nextPos;
    s32 testPos;
    s32 pos;
    u8 possiblePositions[5];

    nextPos = GetNextReelPosition(whichReel);
    testPos = nextPos;
    numPossiblePositions = 0;
    for (i = 0; i < 5; i++)
    {
        if (OneReelBiasCheck(whichReel, testPos, sSlotMachineState->machineBias))
        {
            possiblePositions[numPossiblePositions] = i;
            numPossiblePositions++;
        }
        testPos--;
        if (testPos < 0)
            testPos = 20;
    }
    if (numPossiblePositions == 0)
    {
        if (sSlotMachineState->machineBias == PAYOUT_ROCKET || sSlotMachineState->machineBias == PAYOUT_7)
            pos = 4;
        else
            pos = 0;
    }
    else
        pos = possiblePositions[0];
    pos = nextPos - pos;
    if (pos < 0)
        pos += REEL_LENGTH;
    sSlotMachineState->destReelPos[whichReel] = pos;
}

static bool32 TwoReelBiasCheck(s32 reel0id, s32 reel0pos, s32 reel1id, s32 reel1pos, s32 icon)
{
    s32 i;
    u8 icons[9] = {};

    for (i = 0; i < 9; i++)
        icons[i] = 7;

    for (i = 0; i < 3; i++)
    {
        icons[3 * reel0id + i] = sReelIconAnimByReelAndPos[reel0id][reel0pos];
        icons[3 * reel1id + i] = sReelIconAnimByReelAndPos[reel1id][reel1pos];
        reel0pos++;
        if (reel0pos >= REEL_LENGTH)
            reel0pos = 0;
        reel1pos++;
        if (reel1pos >= REEL_LENGTH)
            reel1pos = 0;
    }

    switch (icon)
    {
    case 0:
        for (i = 0; i < 3; i++)
        {
            if (TestReelIconAttribute(1, icons[i]))
                return FALSE;
        }
        for (i = 0; i < 15; i++)
        {
            if (icons[sSecondReelBiasCheckIndices[i][0]] == icons[sSecondReelBiasCheckIndices[i][1]])
                return TRUE;
        }
        return FALSE;
    case 1:
        if (reel0id == 0 || reel1id == 0)
        {
            if (reel0id == 1 || reel1id == 1)
            {
                for (i = 0; i < 15; i += 3)
                {
                    if (icons[sSecondReelBiasCheckIndices[i][0]] == icons[sSecondReelBiasCheckIndices[i][1]])
                        return FALSE;
                }
            }
            for (i = 0; i < 3; i++)
            {
                if (TestReelIconAttribute(icon, icons[i]))
                    return TRUE;
            }
            return FALSE;
        }
        else
            return TRUE;
    case 2:
        if (reel0id == 2 || reel1id == 2)
        {
            for (i = 0; i < 9; i++)
            {
                if (TestReelIconAttribute(icon, icons[i]))
                    return TRUE;
            }
            return FALSE; // wrong level
        }
    }
    for (i = 0; i < 15; i++)
    {
        if (icons[sSecondReelBiasCheckIndices[i][0]] == icons[sSecondReelBiasCheckIndices[i][1]] && TestReelIconAttribute(icon, icons[sSecondReelBiasCheckIndices[i][0]]))
            return TRUE;
    }
    return FALSE;
}

static bool32 OneReelBiasCheck(s32 reelId, s32 reelPos, s32 biasIcon)
{
    u8 icons[9];
    s32 secondStoppedPos, firstStoppedPos;
    s32 i;

    firstStoppedPos++; firstStoppedPos--;
    firstStoppedPos = sSlotMachineState->reelPositions[sSlotMachineState->reelStopOrder[0]] + 1;
    secondStoppedPos = sSlotMachineState->reelPositions[sSlotMachineState->reelStopOrder[1]] + 1;
    reelPos++;
    if (firstStoppedPos >= REEL_LENGTH)
        firstStoppedPos = 0;
    if (secondStoppedPos >= REEL_LENGTH)
        secondStoppedPos = 0;
    if (reelPos >= REEL_LENGTH)
        reelPos = 0;
    for (i = 0; i < 3; i++)
    {
        icons[sSlotMachineState->reelStopOrder[0] * 3 + i] = sReelIconAnimByReelAndPos[sSlotMachineState->reelStopOrder[0]][firstStoppedPos];
        icons[sSlotMachineState->reelStopOrder[1] * 3 + i] = sReelIconAnimByReelAndPos[sSlotMachineState->reelStopOrder[1]][secondStoppedPos];
        icons[reelId * 3 + i] = sReelIconAnimByReelAndPos[reelId][reelPos];
        if (++firstStoppedPos >= REEL_LENGTH)
            firstStoppedPos = 0;
        if (++secondStoppedPos >= REEL_LENGTH)
            secondStoppedPos = 0;
        if (++reelPos >= REEL_LENGTH)
            reelPos = 0;
    }
    switch (biasIcon)
    {
    case PAYOUT_NONE:
        for (i = 0; i < 3; i++)
        {
            if (TestReelIconAttribute(1, icons[i]))
                return FALSE;
        }
        for (i = 0; i < NUM_MATCH_LINES; i++)
        {
            if (icons[sThirdReelBiasCheckIndices[i][0]] == icons[sThirdReelBiasCheckIndices[i][1]] && icons[sThirdReelBiasCheckIndices[i][0]] == icons[sThirdReelBiasCheckIndices[i][2]])
                return FALSE;
        }
        return TRUE;
    case PAYOUT_CHERRIES2:
        for (i = 0; i < NUM_MATCH_LINES; i++)
        {
            if (icons[sThirdReelBiasCheckIndices[i][0]] == icons[sThirdReelBiasCheckIndices[i][1]] && TestReelIconAttribute(biasIcon, icons[sThirdReelBiasCheckIndices[i][0]]))
                return FALSE;
        }
        for (i = 0; i < 3; i++)
        {
            if (TestReelIconAttribute(biasIcon, icons[i]))
                return TRUE;
        }
        return FALSE;
    case PAYOUT_CHERRIES3:
        for (i = 0; i < NUM_MATCH_LINES; i++)
        {
            if (icons[sThirdReelBiasCheckIndices[i][0]] == icons[sThirdReelBiasCheckIndices[i][1]] && TestReelIconAttribute(biasIcon, icons[sThirdReelBiasCheckIndices[i][0]]))
                return TRUE;
        }
        return FALSE;
    }
    for (i = 0; i < NUM_MATCH_LINES; i++)
    {
        if (icons[sThirdReelBiasCheckIndices[i][0]] == icons[sThirdReelBiasCheckIndices[i][1]] && icons[sThirdReelBiasCheckIndices[i][0]] == icons[sThirdReelBiasCheckIndices[i][2]] && TestReelIconAttribute(biasIcon, icons[sThirdReelBiasCheckIndices[i][0]]))
            return TRUE;
    }
    return FALSE;
}

static bool32 TestReelIconAttribute(s32 attr, s32 icon)
{
    switch (attr)
    {
    case PAYOUT_NONE:
        return icon ^ 4 ? TRUE : FALSE;
    case PAYOUT_CHERRIES2:
    case PAYOUT_CHERRIES3:
        return icon == ICON_CHERRIES ? TRUE : FALSE;
    case PAYOUT_MAGSHELL:
        return icon == ICON_MAGNEMITE || icon == ICON_SHELLDER ? TRUE : FALSE;
    case PAYOUT_PIKAPSY:
        return icon == ICON_PIKACHU || icon == ICON_PSYDUCK ? TRUE : FALSE;
    case PAYOUT_ROCKET:
        return icon == ICON_ROCKET ? TRUE : FALSE;
    case PAYOUT_7:
        return icon == ICON_7 ? TRUE : FALSE;
    default:
        return FALSE;
    }
}

static u8 ReelIconToPayoutRank(s32 iconId)
{
    switch (iconId)
    {
    default:
    case ICON_CHERRIES:
        return PAYOUT_CHERRIES2;
    case ICON_MAGNEMITE:
    case ICON_SHELLDER:
        return PAYOUT_MAGSHELL;
    case ICON_PIKACHU:
    case ICON_PSYDUCK:
        return PAYOUT_PIKAPSY;
    case ICON_ROCKET:
        return PAYOUT_ROCKET;
    case ICON_7:
        return PAYOUT_7;
    }
}

static void CalcSlotBias(void)
{
    u16 rval = Random() / 4;
    s32 i;
    const u16 * biasChances = sReelBiasChances[sSlotMachineState->machineIdx];
    for (i = 0; i < NUM_PAYOUT_TYPES - 1; i++)
    {
        if (rval < biasChances[i])
            break;
    }
    if (sSlotMachineState->machineBias < PAYOUT_ROCKET)
    {
        if (sSlotMachineState->biasCooldown == 0)
        {
            if ((Random() & 0x3FFF) < biasChances[PAYOUT_7])
                sSlotMachineState->biasCooldown = (Random() & 1) ? 5 : 60;
        }
        if (sSlotMachineState->biasCooldown != 0)
        {
            if (i == 0 && (Random() & 0x3FFF) < (int)(0.7 * 0x3FFF)) // 70%
                sSlotMachineState->biasCooldown = (Random() & 1) ? 5 : 60;
            sSlotMachineState->biasCooldown--;
        }
        sSlotMachineState->machineBias = i;
    }
}

static void ResetMachineBias(void)
{
    sSlotMachineState->machineBias = 0;
}

static u16 CalcPayout(void)
{
    u8 visibleIcons[9] = {};
    s32 i;
    s32 reel1pos, reel2pos, reel3pos;
    s32 bestMatch;

    for (i = 0; i < NUM_MATCH_LINES; i++)
        sSlotMachineState->winFlags[i] = FALSE;

    bestMatch = 0;
    reel1pos = sSlotMachineState->reelPositions[0];
    reel2pos = sSlotMachineState->reelPositions[1];
    reel3pos = sSlotMachineState->reelPositions[2];

    for (i = 0; i < 3; i++)
    {
        reel1pos++;
        if (reel1pos >= REEL_LENGTH)
            reel1pos = 0;
        reel2pos++;
        if (reel2pos >= REEL_LENGTH)
            reel2pos = 0;
        reel3pos++;
        if (reel3pos >= REEL_LENGTH)
            reel3pos = 0;
        visibleIcons[0 * 3 + i] = sReelIconAnimByReelAndPos[0][reel1pos];
        visibleIcons[1 * 3 + i] = sReelIconAnimByReelAndPos[1][reel2pos];
        visibleIcons[2 * 3 + i] = sReelIconAnimByReelAndPos[2][reel3pos];
    }
    sSlotMachineState->payout = 0;
    for (i = 0; i < NUM_MATCH_LINES; i++)
    {
        if (sSlotMachineState->bet >= sRowAttributes[i][ROWATTR_MINBET])
        {
            int curMatch;
            if (TestReelIconAttribute(1, visibleIcons[sRowAttributes[i][ROWATTR_COL1POS]]))
                curMatch = TestReelIconAttribute(2, visibleIcons[sRowAttributes[i][ROWATTR_COL2POS]]) ? 2 : 1;
            else if (visibleIcons[sRowAttributes[i][ROWATTR_COL1POS]] == visibleIcons[sRowAttributes[i][ROWATTR_COL2POS]] && visibleIcons[sRowAttributes[i][ROWATTR_COL1POS]] == visibleIcons[sRowAttributes[i][ROWATTR_COL3POS]])
                curMatch = ReelIconToPayoutRank(visibleIcons[sRowAttributes[i][ROWATTR_COL1POS]]);
            else
                curMatch = 0;
            if (curMatch != 0)
            {
                sSlotMachineState->winFlags[i] = TRUE;
                sSlotMachineState->payout += sPayoutTable[curMatch];
            }
            if (curMatch > bestMatch)
                bestMatch = curMatch;
        }
    }
    return bestMatch;
}

static u16 GetPayout(void)
{
    return sSlotMachineState->payout;
}

static u8 GetPlayerBet(void)
{
    return sSlotMachineState->bet;
}

static bool32 GetWinFlagByLine(int lineId)
{
    return sSlotMachineState->winFlags[lineId];
}

static bool32 LoadSpriteGraphicsAndAllocateManager(void)
{
    s32 i;

    for (i = 0; i < ARRAY_COUNT(sSpriteSheets); i++)
        LoadCompressedSpriteSheet(&sSpriteSheets[i]);
    LoadSpritePalettes(sSpritePalettes);
    sSlotMachineGfxManager = Alloc(sizeof(*sSlotMachineGfxManager));
    if (sSlotMachineGfxManager == NULL)
        return FALSE;
    InitGfxManager(sSlotMachineGfxManager);
    return TRUE;
}

static void DestroyGfxManager(void)
{
    if (sSlotMachineGfxManager != NULL)
    {
        Free(sSlotMachineGfxManager);
        sSlotMachineGfxManager = NULL;
    }
}

static void InitGfxManager(struct SlotMachineGfxManager * manager)
{
    s32 i, j;

    for (i = 0; i < NUM_REELS; i++)
    {
        manager->field_00[i] = 0;
        for (j = 0; j < REEL_LOAD_LENGTH; j++)
            manager->reelIconSprites[i][j] = NULL;
    }
}

static void CreateReelIconSprites(void)
{
    struct Sprite *sprite;
    s32 i, j;
    s32 spriteId;
    s32 animId;
    for (i = 0; i < NUM_REELS; i++)
    {
        for (j = 0; j < REEL_LOAD_LENGTH; j++)
        {
            spriteId = CreateSprite(&sSpriteTemplate_ReelIcons, 80 + 40 * i, 44 + 24 * j, 2);
            animId =  sReelIconAnimByReelAndPos[i][j];
            sprite = &gSprites[spriteId];
            StartSpriteAnim(sprite, animId);
            sprite->oam.paletteNum = IndexOfSpritePaletteTag(sReelIconPaletteTags[animId]);
            sprite->data[0] = i;
            sprite->data[1] = j;
            sprite->data[2] = j;
            sprite->data[3] = 0;
            sprite->oam.matrixNum = 0;
            sSlotMachineGfxManager->reelIconSprites[i][j] = sprite;
            sSlotMachineGfxManager->reelIconAffineParamPtr = (vu16 *)(OAM + 0 * sizeof(struct OamData) + offsetof(struct OamData, affineParam));
        }
    }
}

static void UpdateReelIconSprites(const s16 * reelPosPtr, const s16 * yposPtr)
{
    s32 i, j;
    s32 reelPos, ypos;

    for (i = 0; i < NUM_REELS; i++)
    {
        reelPos = *reelPosPtr;
        ypos = *yposPtr * 8;
        for (j = 0; j < REEL_LOAD_LENGTH; j++)
        {
            sSlotMachineGfxManager->reelIconSprites[i][j]->y2 = ypos;
            {
                s32 animId = sReelIconAnimByReelAndPos[i][reelPos];
                struct Sprite *sprite = sSlotMachineGfxManager->reelIconSprites[i][j];
                StartSpriteAnim(sprite, animId);
            }
            {
                s32 animId = sReelIconAnimByReelAndPos[i][reelPos];
                struct Sprite *sprite = sSlotMachineGfxManager->reelIconSprites[i][j];
                StartSpriteAnim(sprite, animId);
            }
            sSlotMachineGfxManager->reelIconSprites[i][j]->oam.paletteNum = IndexOfSpritePaletteTag(sReelIconPaletteTags[sReelIconAnimByReelAndPos[i][reelPos]]);
            reelPos++;
            if (reelPos >= REEL_LENGTH)
                reelPos = 0;
        }
        reelPosPtr++;
        yposPtr++;
    }
}

static void HBlankCB_SlotMachine(void)
{
    s32 vcount = REG_VCOUNT - 0x2B;
    if (vcount < 0x54u)
    {
        *sSlotMachineGfxManager->reelIconAffineParamPtr = sReelIconAffineParams[vcount];
        REG_BLDY = sReelIconBldY[vcount];
    }
    else
    {
        *sSlotMachineGfxManager->reelIconAffineParamPtr = 0x100;
        REG_BLDY = 0;
    }
}

static void CreateScoreDigitSprites(void)
{
    s32 i;
    s32 spriteId;

    for (i = 0; i < NUM_DIGIT_SPRITES; i++)
    {
        spriteId = CreateSprite(&sSpriteTemplate_Digits, 85 + 7 * i, 30, 0);
        sSlotMachineGfxManager->creditDigitSprites[i] = &gSprites[spriteId];
        spriteId = CreateSprite(&sSpriteTemplate_Digits, 133 + 7 * i, 30, 0);
        sSlotMachineGfxManager->payoutDigitSprites[i] = &gSprites[spriteId];
    }
}

static void UpdateCoinsDisplay(void)
{
    s32 coins = GetCoins();
    s32 payout = GetPayout();
    s32 i;
    s32 divisor = 1000;
    s32 quotient;

    for (i = 0; i < NUM_DIGIT_SPRITES; i++)
    {
        quotient = coins / divisor;
        StartSpriteAnim(sSlotMachineGfxManager->creditDigitSprites[i], quotient);
        coins -= quotient * divisor;
        quotient = payout / divisor;
        StartSpriteAnim(sSlotMachineGfxManager->payoutDigitSprites[i], quotient);
        payout -= quotient * divisor;
        divisor /= 10;
    }
}

static void CreateClefairySprites(void)
{
    s32 spriteId = CreateSprite(&sSpriteTemplate_Clefairy, 16, 136, 1);
    sSlotMachineGfxManager->clefairySprites[0] = &gSprites[spriteId];
    spriteId = CreateSprite(&sSpriteTemplate_Clefairy, DISPLAY_WIDTH - 16, 136, 1);
    sSlotMachineGfxManager->clefairySprites[1] = &gSprites[spriteId];
    sSlotMachineGfxManager->clefairySprites[1]->hFlip = TRUE;
}

static void SetClefairySpriteAnim(u8 animId)
{
    s32 i;
    for (i = 0; i < (int)ARRAY_COUNT(sSlotMachineGfxManager->clefairySprites); i++)
        StartSpriteAnim(sSlotMachineGfxManager->clefairySprites[i], animId);
}

static bool32 CreateSlotMachine(void)
{
    s32 i;

    struct SlotMachineSetupTaskData * ptr = Alloc(sizeof(struct SlotMachineSetupTaskData));
    if (ptr == NULL)
        return FALSE;
    for (i = 0; i < (int)ARRAY_COUNT(ptr->tasks); i++)
        ptr->tasks[i].active = 0;
    ptr->yesNoMenuActive = FALSE;
    SetWordTaskArg(CreateTask(Task_SlotMachine, 2), 0, (uintptr_t)ptr);
    return FALSE;
}

static void DestroySlotMachine(void)
{
    if (FuncIsActiveTask(Task_SlotMachine))
    {
        Free(GetSlotMachineSetupTaskDataPtr());
        DestroyTask(FindTaskIdByFunc(Task_SlotMachine));
    }
    DestroyGfxManager();
    FreeAllWindowBuffers();
}

static void Task_SlotMachine(u8 taskId)
{
    struct SlotMachineSetupTaskData * ptr = (void *)GetWordTaskArg(taskId, 0);
    s32 i;

    for (i = 0; i < (int)ARRAY_COUNT(ptr->tasks); i++)
    {
        if (ptr->tasks[i].active)
            ptr->tasks[i].active = sSlotMachineSetupTasks[ptr->tasks[i].funcno](&ptr->tasks[i].state, ptr);
    }
}

static void VBlankCB_SlotMachine(void)
{
    TransferPlttBuffer();
    LoadOam();
    ProcessSpriteCopyRequests();
}

static struct SlotMachineSetupTaskData * GetSlotMachineSetupTaskDataPtr(void)
{
    return (void *)GetWordTaskArg(FindTaskIdByFunc(Task_SlotMachine), 0);
}

static void SetSlotMachineSetupTask(u16 funcno, u8 taskId)
{
    struct SlotMachineSetupTaskData * ptr = GetSlotMachineSetupTaskDataPtr();
    ptr->tasks[taskId].funcno = funcno;
    ptr->tasks[taskId].state = 0;
    ptr->tasks[taskId].active = sSlotMachineSetupTasks[funcno](&ptr->tasks[taskId].state, ptr);
}

static bool32 IsSlotMachineSetupTaskActive(u8 taskId)
{
    return GetSlotMachineSetupTaskDataPtr()->tasks[taskId].active;
}

static inline void SetBackdropColor(u16 color, u16 *pal)
{
    *pal = color;
    SetBackdropFromPalette(pal);
}

static bool8 SlotsTask_GraphicsInit(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    u16 pal[2];
    u8 textColor[3];
    u32 x;

    switch (*state)
    {
    case 0:
        BlendPalettes(PALETTES_ALL, 16, RGB_BLACK);
        (*state)++;
        break;
    case 1:
        SetVBlankCallback(NULL);
        ResetSpriteData();
        FreeAllSpritePalettes();
        RequestDma3Fill(0, (void *)OAM, OAM_SIZE, DMA3_32BIT);
        RequestDma3Fill(0, (void *)VRAM, 0x20, DMA3_32BIT);
        RequestDma3Fill(0, (void *)(VRAM + 0xC000), 0x20, DMA3_32BIT);
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        ResetBgPositions();
        ResetBgsAndClearDma3BusyFlags(FALSE);
        InitBgsFromTemplates(0, sBgTemplates, ARRAY_COUNT(sBgTemplates));
        InitWindows(sWindowTemplates);

        SetBgTilemapBuffer(3, ptr->bg3TilemapBuffer);
        FillBgTilemapBufferRect_Palette0(3, 0, 0, 0, 32, 32);
        CopyBgTilemapBufferToVram(3);

        ResetTempTileDataBuffers();
        DecompressAndCopyTileDataToVram(2, sBg_Tiles, 0, 0x00, 0);
        DecompressAndCopyTileDataToVram(2, sButtonPressed_Tiles, 0, 0xC0, 0);
        SetBgTilemapBuffer(2, ptr->bg2TilemapBuffer);
        CopyToBgTilemapBuffer(2, sBg_Tilemap, 0, 0x00);
        CopyBgTilemapBufferToVram(2);
        LoadPalette(sBg_Pal, BG_PLTT_ID(0), sizeof(sBg_Pal));
        LoadPalette(sBgPal_MatchLines, BG_PLTT_ID(PALSLOT_LINE_BET), sizeof(sBgPal_MatchLines));
        LoadPalette(sCombosWindow_Pal, BG_PLTT_ID(7), sizeof(sCombosWindow_Pal));
        SetBackdropColor(RGB(30, 30, 31), pal);
        LoadUserWindowGfx2(0, 0x00A, BG_PLTT_ID(13));
        LoadStdWindowGfxOnBg(0, 0x001, BG_PLTT_ID(15));

        SetBgTilemapBuffer(0, ptr->bg0TilemapBuffer);
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 2, 32, 30);
        DecompressAndCopyTileDataToVram(1, sCombosWindow_Tiles, 0, 0, 0);
        DecompressAndCopyTileDataToVram(1, sCombosWindow_Tilemap, 0, 0, 1);
        CopyBgTilemapBufferToVram(1);

        LoadPalette(GetTextWindowPalette(2), BG_PLTT_ID(14), PLTT_SIZE_4BPP);
        FillWindowPixelBuffer(1, 0xFF);
        PutWindowTilemap(1);

        x = DISPLAY_WIDTH - 4 - GetStringWidth(FONT_SMALL, gString_SlotMachineControls, 0);
        textColor[0] = TEXT_DYNAMIC_COLOR_6;
        textColor[1] = TEXT_COLOR_WHITE;
        textColor[2] = TEXT_COLOR_DARK_GRAY;
        AddTextPrinterParameterized3(1, FONT_SMALL, x, 0, textColor, 0, gString_SlotMachineControls);
        CopyBgTilemapBufferToVram(0);

        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | 0x20 | DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_DARKEN);
        LoadSpriteGraphicsAndAllocateManager();
        CreateReelIconSprites();
        CreateScoreDigitSprites();
        CreateClefairySprites();
        UpdateCoinsDisplay();
        BlendPalettes(PALETTES_ALL, 0x10, RGB_BLACK);
        SetVBlankCallback(VBlankCB_SlotMachine);
        SetHBlankCallback(HBlankCB_SlotMachine);
        (*state)++;
        break;
    case 2:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            ShowBg(0);
            ShowBg(3);
            ShowBg(2);
            HideBg(1);
            InitReelButtonTileMem();
            BlendPalettes(PALETTES_ALL, 0x10, RGB_BLACK);
            BeginNormalPaletteFade(PALETTES_ALL, -1, 16, 0, RGB_BLACK);
            EnableInterrupts(INTR_FLAG_VBLANK | INTR_FLAG_HBLANK);
            (*state)++;
        }
        break;
    case 3:
        UpdatePaletteFade();
        if (!gPaletteFade.active)
            return FALSE;
        break;
    }
    return TRUE;
}

static bool8 SlotsTask_FadeOut(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    switch (*state)
    {
    case 0:
        BeginNormalPaletteFade(PALETTES_ALL, -1, 0, 16, 0);
        (*state)++;
        break;
    case 1:
        if (!gPaletteFade.active)
            return FALSE;
        break;
    }
    return TRUE;
}

static bool8 SlotsTask_UpdateLineStates(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    switch (*state)
    {
    case 0:
        SetLineStatesByBet(GetBgTilemapBuffer(2));
        CopyBgTilemapBufferToVram(2);
        (*state)++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            return FALSE;
        break;
    }
    return TRUE;
}

static bool8 SlotsTask_ClefairyUpdateOnReelsStart(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    SetClefairySpriteAnim(1);
    return FALSE;
}

static bool8 SlotsTask_StartClefairyDanceAndWinningLineFlash(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    SetClefairySpriteAnim(2);
    CreateTask(Task_FlashWinningLine, 3);
    return FALSE;
}

static bool8 SlotsTask_StopWinningLineFlashTask(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    switch (*state)
    {
    case 0:
        SignalStopWinningLineFlashTask();
        (*state)++;
        break;
    case 1:
        if (!FuncIsActiveTask(Task_FlashWinningLine))
        {
            SetClefairySpriteAnim(0);
            return FALSE;
        }
        break;
    }
    return TRUE;
}

static bool8 SlotsTask_ClefairyFainted(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    SetClefairySpriteAnim(3);
    return FALSE;
}

static bool8 SlotsTask_ClefairyNeutral(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    SetClefairySpriteAnim(0);
    return FALSE;
}

static bool8 SlotsTask_UpdateCoinsDisplay(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    UpdateCoinsDisplay();
    return FALSE;
}

static bool8 SlotsTask_MessageOutOfCoins(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    switch (*state)
    {
    case 0:
        Slot_PrintOnWindow0(gString_OutOfCoins);
        CopyWindowToVram(0, COPYWIN_FULL);
        (*state)++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            return FALSE;
        break;
    }
    return TRUE;
}

static bool8 SlotsTask_AskQuitPlaying(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    switch (*state)
    {
    case 0:
        Slot_PrintOnWindow0(gString_QuitPlaying);
        Slot_CreateYesNoMenu(0);
        CopyWindowToVram(0, COPYWIN_FULL);
        (*state)++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            return FALSE;
        break;
    }
    return TRUE;
}

static bool8 SlotsTask_DestroyYesNoMenu(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    switch (*state)
    {
    case 0:
        Slot_ClearWindow0();
        Slot_DestroyYesNoMenu();
        CopyWindowToVram(0, COPYWIN_FULL);
        (*state)++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            return FALSE;
        break;
    }
    return TRUE;
}

static bool8 SlotsTask_PressReelButton(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    switch (*state)
    {
    case 0:
        SetReelButtonPressed(ptr->reelButtonToPress);
        CopyBgTilemapBufferToVram(2);
        (*state)++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            return FALSE;
        break;
    }
    return TRUE;
}

static bool8 SlotsTask_ReleaseReelButtons(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    switch (*state)
    {
    case 0:
        ReleaseReelButtons();
        CopyBgTilemapBufferToVram(2);
        (*state)++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            return FALSE;
        break;
    }
    return TRUE;
}

static bool8 SlotsTask_ShowHelp(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    switch (*state)
    {
    case 0:
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG0 | WININ_WIN0_BG1 | WININ_WIN0_BG2 | WININ_WIN0_BG3 | WININ_WIN0_OBJ | WININ_WIN0_CLR);
        SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_BG0 | WINOUT_WIN01_BG2 | WINOUT_WIN01_BG3 | WINOUT_WIN01_OBJ | WINOUT_WIN01_CLR);
        SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(0,   0));
        SetGpuReg(REG_OFFSET_WIN1H, WIN_RANGE(0, 160));
        ShowBg(1);
        PlaySE(SE_WIN_OPEN);
        ptr->bg1X = 0;
        (*state)++;
        break;
    case 1:
        ptr->bg1X += 16;
        if (ptr->bg1X >= 256)
        {
            ptr->bg1X = 256;
            (*state)++;
        }
        ChangeBgX(1, 256 * (256 - ptr->bg1X), 0);
        SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(0, ptr->bg1X));
        break;
    case 2:
        return FALSE;
    }
    return TRUE;
}

static bool8 SlotsTask_HideHelp(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    switch (*state)
    {
    case 0:
        PlaySE(SE_WIN_OPEN);
        (*state)++;
        // fallthrough
    case 1:
        ptr->bg1X -= 16;
        if (ptr->bg1X <= 0)
        {
            ptr->bg1X = 0;
            (*state)++;
        }
        ChangeBgX(1, 256 * (256 - ptr->bg1X), 0);
        SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(0, ptr->bg1X));
        break;
    case 2:
        HideBg(1);
        ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        (*state)++;
        break;
    case 3:
        return FALSE;
    }
    return TRUE;
}

static void Slot_PrintOnWindow0(const u8 * str)
{
    FillWindowPixelBuffer(0, PIXEL_FILL(1));
    PutWindowTilemap(0);
    DrawTextBorderOuter(0, 0x001, 15);
    AddTextPrinterParameterized5(0, FONT_NORMAL, str, 1, 2, TEXT_SKIP_DRAW, NULL, 1, 2);
}

static void Slot_ClearWindow0(void)
{
    rbox_fill_rectangle(0);
}

static void SetLineStatesByBet(u16 * bgTilemapBuffer)
{
    switch (GetPlayerBet())
    {
    case 0:
        SetLineState(bgTilemapBuffer, 0, PALSLOT_LINE_NORMAL);
        SetLineState(bgTilemapBuffer, 1, PALSLOT_LINE_NORMAL);
        SetLineState(bgTilemapBuffer, 2, PALSLOT_LINE_NORMAL);
        SetLineState(bgTilemapBuffer, 3, PALSLOT_LINE_NORMAL);
        SetLineState(bgTilemapBuffer, 4, PALSLOT_LINE_NORMAL);
        break;
    case 3:
        SetLineState(bgTilemapBuffer, 0, PALSLOT_LINE_BET);
        SetLineState(bgTilemapBuffer, 4, PALSLOT_LINE_BET);
    case 2:
        SetLineState(bgTilemapBuffer, 1, PALSLOT_LINE_BET);
        SetLineState(bgTilemapBuffer, 3, PALSLOT_LINE_BET);
    case 1:
        SetLineState(bgTilemapBuffer, 2, PALSLOT_LINE_BET);
        break;
    }
}

static void SetLineState(u16 * bgTilemapBuffer, u16 whichLine, u16 paletteNum)
{
    s32 i;
    const u16 * tileIdxs = sLineStateTileIdxs[whichLine].tiles;
    u16 palMask = (paletteNum & 0xF) << 12;

    for (i = 0; i < sLineStateTileIdxs[whichLine].count; i++)
    {
        bgTilemapBuffer[*tileIdxs] &= 0x0FFF;
        bgTilemapBuffer[*tileIdxs] |= palMask;
        tileIdxs++;
    }
}

static void Task_FlashWinningLine(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    s32 i;

    switch (data[0])
    {
    case 0:
        LoadPalette(sBgPal_MatchLines, BG_PLTT_ID(PALSLOT_LINE_MATCH), sizeof(sBgPal_MatchLines));
        for (i = 0; i < NUM_MATCH_LINES; i++)
        {
            if (GetWinFlagByLine(i))
                SetLineState(GetBgTilemapBuffer(2), i, PALSLOT_LINE_MATCH);
        }
        CopyBgTilemapBufferToVram(2);
        data[0]++;
        break;
    case 1:
        if (data[1] == 0)
        {
            u16 y = gSineTable[data[2]] >> 7;
            LoadPalette(&sBgPal_PayoutLight[y], BG_PLTT_ID(1), sizeof(sBgPal_PayoutLight[0]));
            data[2] += 32;
            data[2] &= 0x7F;
            data[1] = 8;
        }
        else
            data[1]--;

        if (data[3] == 0)
        {
            data[4] += 8;
            data[4] &= 0x7F;
            data[5] = gSineTable[data[4]] >> 5;
            BlendPalettes(1 << PALSLOT_LINE_MATCH, data[5], RGB_BLACK);
        }
        else
        {
            data[4]++;
            if (data[4] > 1)
            {
                data[4] = 0;
                data[5]++;
                data[5] &= 1;
                BlendPalettes(1 << PALSLOT_LINE_MATCH, data[5] * 8, RGB_BLACK);
            }
        }

        for (i = 0; i < ARRAY_COUNT(sWinningLineFlashPalIdxs); i++)
            gPlttBufferFaded[sWinningLineFlashPalIdxs[i] + BG_PLTT_ID(PALSLOT_LINE_MATCH)] = gPlttBufferUnfaded[sWinningLineFlashPalIdxs[i] + BG_PLTT_ID(PALSLOT_LINE_MATCH)];
        break;
    case 2:
        // Restore match lines to normal color 
        for (i = 0; i < NUM_MATCH_LINES; i++)
        {
            if (GetWinFlagByLine(i))
                SetLineState(GetBgTilemapBuffer(2), i, PALSLOT_LINE_NORMAL);
        }
        
        // Restore payout lights to normal color
        LoadPalette(&sBg_Pal[1], BG_PLTT_ID(1), sizeof(sBg_Pal[1]));

        CopyBgTilemapBufferToVram(2);
        data[0]++;
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
            DestroyTask(taskId);
        break;
    }
}

static void SignalStopWinningLineFlashTask(void)
{
    gTasks[FindTaskIdByFunc(Task_FlashWinningLine)].data[0] = 2;
}

static void Slot_CreateYesNoMenu(u8 cursorPos)
{
    CreateYesNoMenu(&sYesNoWindowTemplate, FONT_NORMAL, 0, 2, 10, 13, cursorPos);
    Menu_MoveCursorNoWrapAround(cursorPos);
    GetSlotMachineSetupTaskDataPtr()->yesNoMenuActive = TRUE;
}

static void Slot_DestroyYesNoMenu(void)
{
    struct SlotMachineSetupTaskData * data = GetSlotMachineSetupTaskDataPtr();
    if (data->yesNoMenuActive)
    {
        DestroyYesNoMenu();
        data->yesNoMenuActive = FALSE;
    }
}

static void InitReelButtonTileMem(void)
{
    s32 i, j;
    struct SlotMachineSetupTaskData * data = GetSlotMachineSetupTaskDataPtr();
    u16 * buffer = GetBgTilemapBuffer(2);

    for (i = 0; i < NUM_REELS; i++)
    {
        for (j = 0; j < NUM_BUTTON_TILES; j++)
        {
            u16 idx = sReelButtonMapTileIdxs[i][j];
            data->buttonReleasedTiles[i][j] = buffer[idx];
            data->buttonPressedTiles[i][j] = j + 0xC0;
        }
    }
}

static void SetReelButtonPressed(u8 reel)
{
    if (reel < NUM_REELS)
    {
        s32 i;
        struct SlotMachineSetupTaskData * data = GetSlotMachineSetupTaskDataPtr();
        u16 * buffer = GetBgTilemapBuffer(2);
        for (i = 0; i < NUM_BUTTON_TILES; i++)
        {
            u16 idx = sReelButtonMapTileIdxs[reel][i];
            buffer[idx] = data->buttonPressedTiles[reel][i];
        }
    }
}

static void ReleaseReelButtons(void)
{
    s32 i, j;
    struct SlotMachineSetupTaskData * data = GetSlotMachineSetupTaskDataPtr();
    u16 * buffer = GetBgTilemapBuffer(2);

    for (i = 0; i < NUM_REELS; i++)
    {
        for (j = 0; j < NUM_BUTTON_TILES; j++)
        {
            u16 idx = sReelButtonMapTileIdxs[i][j];
            buffer[idx] = data->buttonReleasedTiles[i][j];
        }
    }
}

static void PressReelButton(u8 reel, u8 taskId)
{
    GetSlotMachineSetupTaskDataPtr()->reelButtonToPress = reel;
    SetSlotMachineSetupTask(SLOTTASK_PRESS_BUTTON, taskId);
}
