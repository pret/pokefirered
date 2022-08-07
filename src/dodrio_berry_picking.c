#include "global.h"
#include "gflib.h"
#include "dodrio_berry_picking.h"
#include "dynamic_placeholder_text_util.h"
#include "event_data.h"
#include "item.h"
#include "link.h"
#include "link_rfu.h"
#include "m4a.h"
#include "menu.h"
#include "minigame_countdown.h"
#include "new_menu_helpers.h"
#include "random.h"
#include "save.h"
#include "script.h"
#include "strings.h"
#include "task.h"
#include "text_window.h"
#include "text_window_graphics.h"
#include "constants/songs.h"
#include "constants/sound.h"
#include "constants/items.h"

// Note that in this file 'Dodrio Berry Picking' is often
// shortened to DodrioGame or just Game for convenience

#define MAX_SCORE 999990
#define MAX_BERRIES 9999

// The minimum score needed to receive a prize
#define PRIZE_SCORE 3000

// Difficulty increases as berries are eaten. The rate of new berries increases and the types of berries changes
// When the max difficulty is reached it starts again from the beginning
#define NUM_DIFFICULTIES 7

#define MAX_FALL_DIST 10 // The number of times a berry needs to fall before hitting the ground
#define EAT_FALL_DIST 7 // The number of times a berry needs to fall to be available to eat

enum {
    BG_INTERFACE,
    BG_TREE_LEFT,
    BG_TREE_RIGHT,
    BG_SCENERY
};

enum {
    FUNC_INTRO,
    FUNC_INIT_COUNTDOWN,
    FUNC_COUNTDOWN,
    FUNC_WAIT_START,
    FUNC_PLAY_GAME,
    FUNC_INIT_RESULTS,
    FUNC_RESULTS,
    FUNC_ASK_PLAY_AGAIN,
    FUNC_END_LINK,
    FUNC_EXIT,
    FUNC_RESET_GAME,
    FUNC_WAIT_END_GAME,
};

enum {
    GFXFUNC_LOAD,
    GFXFUNC_SHOW_NAMES,
    GFXFUNC_SHOW_RESULTS,
    GFXFUNC_MSG_PLAY_AGAIN,
    GFXFUNC_MSG_SAVING,
    GFXFUNC_MSG_COMM_STANDBY,
    GFXFUNC_ERASE_MSG,
    GFXFUNC_MSG_PLAYER_DROPPED,
    GFXFUNC_STOP,
    GFXFUNC_IDLE,
};

enum {
    PACKET_READY_START = 1,
    PACKET_GAME_STATE,
    PACKET_PICK_STATE,
    PACKET_READY_END,
};

enum {
    PLAY_AGAIN_NONE,
    PLAY_AGAIN_YES,
    PLAY_AGAIN_NO,
    PLAY_AGAIN_DROPPED = 5,
};

enum {
    PICK_NONE,     // Dodrio standing still
    PICK_RIGHT,    // Dodrio reaching right
    PICK_MIDDLE,   // Dodrio reaching up
    PICK_LEFT,     // Dodrio reaching left
    PICK_DISABLED, // Dodrio down after game over
};

enum {
    BERRY_BLUE,
    BERRY_GREEN,
    BERRY_GOLD,
    BERRY_MISSED,
    BERRY_PRIZE,
    BERRY_IN_ROW,
    NUM_BERRY_IDS
};

#define NUM_BERRY_TYPES  4 // Blue, Green, Gold, and 'missed'

 // Eaten anim comes after the normal & missed versions of other berries
#define ANIM_EATEN (BERRY_MISSED * 2)

enum {
    BERRYSTATE_NONE,
    BERRYSTATE_PICKED,   // Berry has been picked by a Dodrio, replaced with blue hit sprite (still falling)
    BERRYSTATE_EATEN,    // Berry has been eaten (after being picked), berry is gone now
    BERRYSTATE_SQUISHED, // Berry has hit the ground
};

enum {
    INPUTSTATE_NONE,
    INPUTSTATE_TRY_PICK,
    INPUTSTATE_PICKED,
    INPUTSTATE_ATE_BERRY,
    INPUTSTATE_BAD_MISS,
};

// Colors for status bar squares
// Colored gray when a berry is missed
// Flash red when few yellow squares remain
enum {
    STATUS_YELLOW,
    STATUS_GRAY,
    STATUS_RED,
};

#define NUM_STATUS_SQUARES 10

#define GFXTAG_DODRIO    0
#define GFXTAG_STATUS    1
#define GFXTAG_BERRIES   2
#define GFXTAG_CLOUD     5
#define GFXTAG_COUNTDOWN 7

#define PALTAG_DODRIO_NORMAL 0
#define PALTAG_DODRIO_SHINY  1
#define PALTAG_STATUS        2
#define PALTAG_BERRIES       3
#define PALTAG_CLOUD         6
#define PALTAG_COUNTDOWN     8

#define NUM_CLOUDS 2

#define PLAYER_NONE 0xFF

struct DodrioGame_Gfx
{
    u16 ALIGNED(4) tilemapBuffers[3][BG_SCREEN_SIZE];
    bool32 finished;
    u8 ALIGNED(4) taskId;
    u8 ALIGNED(4) windowIds[MAX_RFU_PLAYERS + 5]; // The latter 5 are never used
    u8 ALIGNED(4) state;
    u8 ALIGNED(4) loadState;
    u16 ALIGNED(4) timer;
    u8 ALIGNED(4) cursorSelection;
    u8 ALIGNED(4) playAgainState;
    void (*func)(void);
}; // size = 0x302C

struct StatusBar
{
    u8 unused[12];
    bool8 entered[NUM_STATUS_SQUARES];
    s16 yChange[NUM_STATUS_SQUARES];
    u16 spriteIds[NUM_STATUS_SQUARES];
    u16 flashTimer;
}; // size = 0x40

// Because Dodrio is required for this minigame,
// the only relevant information about the selected
// Pokémon is whether or not it's shiny
struct DodrioGame_MonInfo
{
    bool8 isShiny;
};

struct DodrioGame_ScoreResults
{
    u8 ranking;
    u32 score;
};

struct DodrioGame
{
    /*0x0000*/ void (*exitCallback)(void);
    /*0x0004*/ u8 ALIGNED(4) taskId;
    /*0x0008*/ u8 ALIGNED(4) playersReceived;
    /*0x000C*/ u8 ALIGNED(4) startState;
    /*0x0010*/ u8 ALIGNED(4) state;
    /*0x0014*/ u8 ALIGNED(4) timer;
    /*0x0018*/ u8 ALIGNED(4) funcId;
    /*0x001C*/ u8 ALIGNED(4) prevFuncId; // Set, never read
    /*0x0020*/ bool8 ALIGNED(4) isLeader;
    /*0x0024*/ u8 ALIGNED(4) numPlayers;
    /*0x0028*/ u8 ALIGNED(4) multiplayerId;
    /*0x0030*/ u8 ALIGNED(8) countdownEndDelay;
    /*0x0034*/ u8 ALIGNED(4) posToPlayerId[MAX_RFU_PLAYERS];
    /*0x003C*/ u8 ALIGNED(4) unused2; // Set to 0, never read
    /*0x0040*/ u8 ALIGNED(4) numGraySquares;
    /*0x0044*/ u8 ALIGNED(4) berryColStart;
    /*0x0048*/ u8 ALIGNED(4) berryColEnd;
    /*0x004A*/ u16 berryResults[MAX_RFU_PLAYERS][NUM_BERRY_IDS];
    /*0x0086*/ u16 berriesEaten[MAX_RFU_PLAYERS];
    /*0x0090*/ u8 ALIGNED(4) difficulty[MAX_RFU_PLAYERS];
    /*0x0098*/ u8 ALIGNED(4) pickStateQueue[4];
    /*0x009C*/ u8 ALIGNED(4) eatTimer[NUM_BERRY_COLUMNS];
    /*0x00A8*/ u8 ALIGNED(4) inputState[MAX_RFU_PLAYERS];
    /*0x00B0*/ u8 ALIGNED(4) inputDelay[MAX_RFU_PLAYERS];
    /*0x00B8*/ u8 ALIGNED(4) berryEatenBy[NUM_BERRY_COLUMNS];
    /*0x00C4*/ u8 ALIGNED(4) berryState[NUM_BERRY_COLUMNS];
    /*0x00D0*/ u8 ALIGNED(4) fallTimer[NUM_BERRY_COLUMNS];
    /*0x00DC*/ u8 ALIGNED(4) newBerryTimer[NUM_BERRY_COLUMNS];
    /*0x00E8*/ u8 ALIGNED(4) prevBerryIds[NUM_BERRY_COLUMNS];
    /*0x00F4*/ u8 ALIGNED(4) playersAttemptingPick[NUM_BERRY_COLUMNS][2];
    /*0x010C*/ u8 ALIGNED(4) playAgainStates[MAX_RFU_PLAYERS];
    /*0x0112*/ u16 berriesPickedInRow;
    /*0x0114*/ u16 maxBerriesPickedInRow;
    /*0x0118*/ bool32 startCountdown; // Never read
    /*0x011C*/ bool32 startGame;
    /*0x0120*/ bool32 berriesFalling;
    /*0x0124*/ u8 ALIGNED(4) clearRecvCmdTimer;
    /*0x0128*/ u8 ALIGNED(4) clearRecvCmds;
    /*0x012C*/ bool32 allReadyToEnd;
    /*0x0130*/ bool32 readyToEnd[MAX_RFU_PLAYERS];
    /*0x0144*/ bool8 ALIGNED(4) playingPickSound;
    /*0x0148*/ bool8 ALIGNED(4) playingSquishSound[NUM_BERRY_COLUMNS];
    /*0x0154*/ u8 ALIGNED(4) endSoundState;
    /*0x0158*/ bool8 ALIGNED(4) readyToStart[MAX_RFU_PLAYERS];
    /*0x0160*/ struct DodrioGame_Gfx gfx;
    /*0x318C*/ struct DodrioGame_MonInfo monInfo[MAX_RFU_PLAYERS];
    /*0x31A0*/ struct DodrioGame_Player players[MAX_RFU_PLAYERS];
    /*0x32CC*/ struct DodrioGame_Player player;
    /*0x3308*/ struct DodrioGame_ScoreResults scoreResults[MAX_RFU_PLAYERS];
}; // size = 0x3330

static EWRAM_DATA struct DodrioGame * sGame = NULL;
static EWRAM_DATA u16 *sDodrioSpriteIds[MAX_RFU_PLAYERS] = {NULL};
static EWRAM_DATA u16 *sCloudSpriteIds[NUM_CLOUDS] = {NULL};
static EWRAM_DATA u16 *sBerrySpriteIds[NUM_BERRY_COLUMNS] = {NULL};
static EWRAM_DATA u16 *sBerryIconSpriteIds[NUM_BERRY_TYPES] = {NULL};
static EWRAM_DATA struct StatusBar * sStatusBar = NULL;
static EWRAM_DATA struct DodrioGame_Gfx * sGfx = NULL;

static bool32 sExitingGame;

static void ResetTasksAndSprites(void);
static void InitDodrioGame(struct DodrioGame *);
static void Task_StartDodrioGame(u8);
static void DoGameIntro(void);
static void InitCountdown(void);
static void DoCountdown(void);
static void WaitGameStart(void);
static void PlayGame_Leader(void);
static void PlayGame_Member(void);
static void WaitEndGame_Leader(void);
static void WaitEndGame_Member(void);
static void InitResults_Leader(void);
static void InitResults_Member(void);
static void DoResults(void);
static void AskPlayAgain(void);
static void EndLink(void);
static void ExitGame(void);
static void ResetGame(void);
static void Task_NewGameIntro(u8);
static void Task_CommunicateMonInfo(u8);
static void RecvLinkData_Leader(void);
static void SendLinkData_Leader(void);
static void RecvLinkData_Member(void);
static void SendLinkData_Member(void);
static void HandleSound_Leader(void);
static void HandleSound_Member(void);
static void CB2_DodrioGame(void);
static void VBlankCB_DodrioGame(void);
static void InitMonInfo(struct DodrioGame_MonInfo *, struct Pokemon *);
static void CreateTask_(TaskFunc, u8);
static void CreateDodrioGameTask(TaskFunc);
static void SetGameFunc(u8);
static bool32 SlideTreeBordersOut(void);
static void InitFirstWaveOfBerries(void);
static bool32 TryPickBerry(u8, u8, u8);
static void UpdateFallingBerries(void);
static void UpdateGame_Leader(void);
static void UpdateGame_Member(void);
static bool32 AllPlayersReadyToStart(void);
static void ResetReadyToStart(void);
static void GetActiveBerryColumns(u8, u8 *, u8 *);
static bool32 ReadyToEndGame_Leader(void);
static bool32 ReadyToEndGame_Member(void);
static void TryIncrementDifficulty(u8);
static u8 GetPlayerIdAtColumn(u8);
static u8 GetNewBerryId(u8, u8);
static u8 GetNewBerryIdByDifficulty(u8, u8);
static void IncrementBerryResult(u8, u8, u8);
static void UpdateBerriesPickedInRow(bool32);
static void SetMaxBerriesPickedInRow(void);
static void ResetForPlayAgainPrompt(void);
static void SetRandomPrize(void);
static void TryUpdateRecords(void);
static u8 UpdatePickStateQueue(u8);
static void HandleWaitPlayAgainInput(void);
static void ResetPickState(void);
static u32 GetScore(u8);
static void Task_ShowDodrioBerryPickingRecords(u8);
static void PrintRecordsText(u8);
static void SpriteCB_Dodrio(struct Sprite *);
static u32 DoDodrioMissedAnim(struct Sprite *);
static u32 DoDodrioIntroAnim(struct Sprite *);
static void SetDodrioInvisibility(bool8, u8);
static void SpriteCB_Status(struct Sprite *);
static void SetBerryIconsInvisibility(bool8);
static void SpriteCB_Cloud(struct Sprite *);
static s16 GetDodrioXPos(u8, u8);
static void Task_TryRunGfxFunc(u8);
static void LoadGfx(void);
static void ShowNames(void);
static void ShowResults(void);
static void Msg_WantToPlayAgain(void);
static void Msg_SavingDontTurnOff(void);
static void Msg_CommunicationStandby(void);
static void EraseMessage(void);
static void Msg_SomeoneDroppedOut(void);
static void StopGfxFuncs(void);
static void GfxIdle(void);
static void SetGfxFunc(MainCallback);
static MainCallback GetGfxFunc(void);
static void InitBgs(void);
static bool32 LoadBgGfx(void);
static void InitGameGfx(struct DodrioGame_Gfx *);
static void LoadDodrioGfx(void);
static void CreateDodrioSprite(struct DodrioGame_MonInfo *, u8, u8, u8);
static void SetAllDodrioInvisibility(bool8, u8);
static void LoadBerryGfx(void);
static void CreateBerrySprites(void);
static void CreateCloudSprites(void);
static void CreateStatusBarSprites(void);
static void StartDodrioIntroAnim(u8);
static void SetGfxFuncById(u8);
static void SetStatusBarInvisibility(bool8);
static void ResetCloudPos(void);
static void SetCloudInvisibility(bool8);
static u8 GetPlayAgainState(void);
static u32 GetHighestScore(void);
static void ResetBerryAndStatusBarSprites(void);
static void FreeBerrySprites(void);
static void FreeStatusBar(void);
static void FreeDodrioSprites(u8);
static void FreeCloudSprites(void);
static void StartCloudMovement(void);
static void ResetGfxState(void);
static void InitStatusBarPos(void);
static bool32 DoStatusBarIntro(void);
static void StartDodrioMissedAnim(u8);
static void SetBerryInvisibility(u8, bool8);
static void SetBerryAnim(u16, u8);
static void SetBerryYPos(u8, u8);
static void SetDodrioAnim(u8, u8);
static void UpdateStatusBarAnim(u8);
static bool32 IsGfxFuncActive(void);
static u32 IncrementWithLimit(u32, u32);
static u32 Min(u32, u32);

static const struct BgTemplate sBgTemplates_Duplicate[] =
{
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0
    },
    {
        .bg = 1,
        .charBaseIndex = 2,
        .mapBaseIndex = 12,
        .screenSize = 1,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0
    },
    {
        .bg = 2,
        .charBaseIndex = 2,
        .mapBaseIndex = 14,
        .screenSize = 1,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0
    },
    {
        .bg = 3,
        .charBaseIndex = 3,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0
    },
};

static const struct WindowTemplate sWindowTemplate_Dummy_Duplicate = DUMMY_WIN_TEMPLATE;

static const struct WindowTemplate sWindowTemplates_Results_Duplicate[] =
{
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 28,
        .height = 3,
        .paletteNum = 13,
        .baseBlock = 0x13,
    },
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 6,
        .width = 28,
        .height = 13,
        .paletteNum = 13,
        .baseBlock = 0x67,
    }
};

static const struct WindowTemplate sWindowTemplate_Prize_Duplicate =
{
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 6,
    .width = 28,
    .height = 7,
    .paletteNum = 13,
    .baseBlock = 0x67,
};

static const struct WindowTemplate sWindowTemplates_PlayAgain_Duplicate[] =
{
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 8,
        .width = 19,
        .height = 3,
        .paletteNum = 13,
        .baseBlock = 0x13,
    },
    {
        .bg = 0,
        .tilemapLeft = 22,
        .tilemapTop = 7,
        .width = 6,
        .height = 4,
        .paletteNum = 13,
        .baseBlock = 0x4C,
    }
};

static const struct WindowTemplate sWindowTemplate_DroppedOut_Duplicate =
{
    .bg = 0,
    .tilemapLeft = 4,
    .tilemapTop = 6,
    .width = 22,
    .height = 5,
    .paletteNum = 13,
    .baseBlock = 0x13,
};

static const struct WindowTemplate sWindowTemplate_CommStandby_Duplicate =
{
    .bg = 0,
    .tilemapLeft = 5,
    .tilemapTop = 8,
    .width = 19,
    .height = 3,
    .paletteNum = 13,
    .baseBlock = 0x13,
};

static const u8 sActiveColumnMap[5][5][11] =
{
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0},
    },
    {
        {0, 1, 2, 3, 4, 5, 6, 3, 8, 9, 0},
        {0, 1, 2, 5, 6, 3, 4, 5, 8, 9, 0},
    },
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 2, 9, 0},
        {0, 1, 4, 5, 6, 7, 2, 3, 4, 9, 0},
        {0, 1, 6, 7, 2, 3, 4, 5, 6, 9, 0},
    },
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 8, 1, 0},
        {0, 3, 4, 5, 6, 7, 8, 1, 2, 3, 0},
        {0, 5, 6, 7, 8, 1, 2, 3, 4, 5, 0},
        {0, 7, 8, 1, 2, 3, 4, 5, 6, 7, 0},
    },
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0},
        {2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2},
        {4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4},
        {6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6},
        {8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8},
    },
};

static const u8 sDodrioHeadToColumnMap[5][5][3] =
{
    {
        {4, 5, 6},
    },
    {
        {3, 4, 5},
        {5, 6, 3},
    },
    {
        {4, 5, 6},
        {6, 7, 2},
        {2, 3, 4},
    },
    {
        {3, 4, 5},
        {5, 6, 7},
        {7, 8, 1},
        {1, 2, 3},
    },
    {
        {4, 5, 6},
        {6, 7, 8},
        {8, 9, 0},
        {0, 1, 2},
        {2, 3, 4},
    },
};

static const u8 sDodrioNeighborMap[5][5][3] =
{
    {
        {1, 0, 1},
    },
    {
        {1, 0, 1},
        {0, 1, 0},
    },
    {
        {2, 0, 1},
        {0, 1, 2},
        {1, 2, 0},
    },
    {
        {3, 0, 1},
        {0, 1, 2},
        {1, 2, 3},
        {2, 3, 0},
    },
    {
        {4, 0, 1},
        {0, 1, 2},
        {1, 2, 3},
        {2, 3, 4},
        {3, 4, 0},
    },
};

ALIGNED(4)
static const u8 sPlayerIdAtColumn[5][11] =
{
    {9, 9, 9, 9, 1, 1, 1, 9, 9, 9, 9},
    {9, 9, 9, 0, 0, 1, 1, 0, 9, 9, 9},
    {9, 9, 2, 2, 0, 0, 1, 1, 1, 9, 9},
    {9, 3, 3, 0, 0, 1, 1, 2, 2, 3, 9},
    {3, 3, 4, 4, 0, 0, 1, 1, 2, 2, 3},
};

static const u8 sUnsharedColumns[5][5] =
{
    {5},
    {4, 6},
    {3, 5, 7},
    {2, 4, 6, 8},
    {1, 3, 5, 6, 9},
};

// Duplicate and unused gfx.
static const u32 sDuplicateGfx[] = INCBIN_U32("graphics/link_games/dodrioberry_bg1.gbapal",
                                              "graphics/link_games/dodrioberry_bg2.gbapal",
                                              "graphics/link_games/dodrioberry_pkmn.gbapal",
                                              "graphics/link_games/dodrioberry_shiny.gbapal",
                                              "graphics/link_games/dodrioberry_status.gbapal",
                                              "graphics/link_games/dodrioberry_berrysprites.gbapal",
                                              "graphics/link_games/dodrioberry_berrysprites.4bpp.lz",
                                              "graphics/link_games/dodrioberry_platform.gbapal",
                                              "graphics/link_games/dodrioberry_bg1.4bpp.lz",
                                              "graphics/link_games/dodrioberry_bg2.4bpp.lz",
                                              "graphics/link_games/dodrioberry_status.4bpp.lz",
                                              "graphics/link_games/dodrioberry_platform.4bpp.lz",
                                              "graphics/link_games/dodrioberry_pkmn.4bpp.lz",
                                              "graphics/link_games/dodrioberry_bg1.bin.lz",
                                              "graphics/link_games/dodrioberry_bg2right.bin.lz",
                                              "graphics/link_games/dodrioberry_bg2left.bin.lz");

static const u8 sBerryFallDelays[][3] =
{
    {40, 24, 13},
    {32, 19, 10},
    {22, 13, 7},
};

ALIGNED(4)
static const u8 sTreeBorderXPos[] = {8, 5, 8, 11, 15};

ALIGNED(4)
static const u8 sDifficultyThresholds[] = {5, 10, 20, 30, 50, 70, 100};

ALIGNED(4)
static const u8 sPrizeBerryIds[][10] =
{
    {15, 16, 17, 18, 19, 19, 18, 17, 16, 15},
    {20, 21, 22, 23, 24, 25, 26, 27, 28, 29},
    {30, 31, 32, 33, 34, 34, 33, 32, 31, 30},
};

static void (*const sLeaderFuncs[])(void) =
{
    DoGameIntro,
    InitCountdown,
    DoCountdown,
    WaitGameStart,
    PlayGame_Leader,
    InitResults_Leader,
    DoResults,
    AskPlayAgain,
    EndLink,
    ExitGame,
    ResetGame,
    WaitEndGame_Leader
};

static void (*const sMemberFuncs[])(void) =
{
    DoGameIntro,
    InitCountdown,
    DoCountdown,
    WaitGameStart,
    PlayGame_Member,
    InitResults_Member,
    DoResults,
    AskPlayAgain,
    EndLink,
    ExitGame,
    ResetGame,
    WaitEndGame_Member
};

void StartDodrioBerryPicking(u16 a0, MainCallback callback)
{
    sExitingGame = FALSE;

    if (gReceivedRemoteLinkPlayers && (sGame = AllocZeroed(sizeof(*sGame))) != NULL)
    {
        ResetTasksAndSprites();
        InitDodrioGame(sGame);
        sGame->exitCallback = callback;
        sGame->multiplayerId = GetMultiplayerId();
        sGame->player = sGame->players[sGame->multiplayerId];
        InitMonInfo(&sGame->monInfo[sGame->multiplayerId], &gPlayerParty[a0]);
        CreateTask(Task_StartDodrioGame, 1);
        SetMainCallback2(CB2_DodrioGame);
        SetRandomPrize();
        GetActiveBerryColumns(sGame->numPlayers, &sGame->berryColStart, &sGame->berryColEnd);
        StopMapMusic();
        PlayNewMapMusic(MUS_BERRY_PICK);
    }
    else
    {
        SetMainCallback2(callback);
        return;
    }
}

static void ResetTasksAndSprites(void)
{
    ResetTasks();
    ResetSpriteData();
    FreeAllSpritePalettes();
}

static void InitDodrioGame(struct DodrioGame * data)
{
    u8 i;

    data->startState = 0;
    data->state = 0;
    data->timer = 0;
    data->funcId = 0;
    data->prevFuncId = 0;
    data->startGame = 0;
    data->berriesFalling = 0;
    data->countdownEndDelay = 0;
    data->numGraySquares = 0;
    data->unused2 = 0;
    data->allReadyToEnd = 0;

    for (i = 0; i < 4; i++)
    {
        data->pickStateQueue[i] = 0;
    }

    for (i = 0; i < 5; i++)
    {
        data->inputState[i] = 0;
        data->inputDelay[i] = 0;
        data->berryResults[i][0] = 0;
        data->berryResults[i][1] = 0;
        data->berryResults[i][2] = 0;
        data->berryResults[i][3] = 0;
        data->berryResults[i][5] = 0;
        data->playAgainStates[i] = 0;
        data->readyToEnd[i] = 0;
    }

    for (i = 0; i < 11; i++)
    {
        data->fallTimer[i] = 0;
        data->newBerryTimer[i] = 0;
        data->berryState[i] = 0;
        data->playersAttemptingPick[i][0] = 0xFF;
        data->playersAttemptingPick[i][1] = 0xFF;
    }

    data->isLeader = GetMultiplayerId() == 0 ? 1 : 0;
    data->numPlayers = GetLinkPlayerCount();
    data->posToPlayerId[0] = GetMultiplayerId();
    for (i = 1; i < data->numPlayers; i++)
    {
        data->posToPlayerId[i] = data->posToPlayerId[i - 1] + 1;
        if (data->posToPlayerId[i] > data->numPlayers - 1)
            data->posToPlayerId[i] %= data->numPlayers;
    }
}

static void Task_StartDodrioGame(u8 taskId)
{
    u8 r4, r5;

    switch (sGame->startState)
    {
    case 0:
        SetVBlankCallback(NULL);
        CreateTask_(Task_CommunicateMonInfo, 4);
        sGame->startState++;
        break;
    case 1:
        if (!FuncIsActiveTask(Task_CommunicateMonInfo))
        {
            InitGameGfx(&sGame->gfx);
            sGame->startState++;
        }
        break;
    case 2:
        if (!IsGfxFuncActive())
        {
            Rfu_SetLinkStandbyCallback();
            sGame->startState++;
        }
        break;
    case 3:
        if (IsLinkTaskFinished())
        {
            if (gReceivedRemoteLinkPlayers)
            {
                LoadWirelessStatusIndicatorSpriteGfx();
                CreateWirelessStatusIndicatorSprite(0, 0);
            }
            sGame->startState++;
        }
        break;
    case 4:
        r5 = sGame->numPlayers;
        LoadDodrioGfx();
        for (r4 = 0; r4 < r5; r4++)
        {
            CreateDodrioSprite(&sGame->monInfo[sGame->posToPlayerId[r4]], r4, sGame->posToPlayerId[r4], sGame->numPlayers);
        }
        SetAllDodrioInvisibility(FALSE, sGame->numPlayers);
        sGame->startState++;
        break;
    case 5:
        LoadBerryGfx();
        CreateBerrySprites();
        CreateCloudSprites();
        CreateStatusBarSprites();
        sGame->startState++;
        break;
    case 6:
        BlendPalettes(PALETTES_ALL, 0x10, RGB_BLACK);
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        SetVBlankCallback(VBlankCB_DodrioGame);
        sGame->startState++;
        break;
    case 7:
        UpdatePaletteFade();
        if (!gPaletteFade.active)
        {
            sGame->startState++;
        }
        break;
    default:
        DestroyTask(taskId);
        CreateDodrioGameTask(Task_NewGameIntro);
        break;
    }
}

static void Task_DodrioGame_Leader(u8 taskId)
{
    RecvLinkData_Leader();
    sLeaderFuncs[sGame->funcId]();
    if (!sExitingGame)
    {
        UpdateGame_Leader();
    }
    SendLinkData_Leader();
}

static void Task_DodrioGame_Member(u8 taskId)
{
    RecvLinkData_Member();
    sMemberFuncs[sGame->funcId]();
    if (!sExitingGame)
    {
        UpdateGame_Member();
    }
    SendLinkData_Member();
}

static void DoGameIntro(void)
{
    switch (sGame->state)
    {
    case 0:
        StartDodrioIntroAnim(1);
        SetGfxFuncById(1);
        sGame->state++;
        break;
    case 1:
        if (!IsGfxFuncActive())
            SetGameFunc(1);
        break;
    }
}

static void InitCountdown(void)
{
    if (sGame->state == 0)
    {
        InitFirstWaveOfBerries();
        sGame->state++;
    }
    else
    {
        sGame->startCountdown = 1;
        SetGameFunc(2);
    }
}

static void DoCountdown(void)
{
    switch (sGame->state)
    {
    case 0:
        StartMinigameCountdown(7, 8, 120, 80, 0);
        sGame->state++;
        break;
    case 1:
        Rfu_SetLinkStandbyCallback();
        sGame->state++;
        break;
    case 2:
        if (IsLinkTaskFinished())
        {
            sGame->state++;
        }
        break;
    case 3:
        if (!IsMinigameCountdownRunning())
        {
            Rfu_SetLinkStandbyCallback();
            sGame->state++;
        }
        break;
    case 4:
        if (IsLinkTaskFinished())
        {
            SetGameFunc(3);
        }
        break;
    }
}

static void WaitGameStart(void)
{
    if (sGame->state == 0)
    {
        if (sGame->startGame != 0)
        {
            SetGameFunc(4);
        }
    }
}

static void PlayGame_Leader(void)
{
    if (sGame->state == 0)
    {
        if (sGame->numGraySquares < 10)
        {
            if (sGame->inputState[0] == 0)
            {
                if (JOY_NEW(DPAD_UP))
                {
                    if (sGame->players[0].comm.pickState == 0)
                    {
                        sGame->players[0].comm.ateBerry = 0;
                        sGame->players[0].comm.pickState = UpdatePickStateQueue(2);
                    }
                }
                else if (JOY_NEW(DPAD_RIGHT))
                {
                    if (sGame->players[0].comm.pickState == 0)
                    {
                        sGame->players[0].comm.ateBerry = 0;
                        sGame->players[0].comm.pickState = UpdatePickStateQueue(1);
                    }
                }
                else if (JOY_NEW(DPAD_LEFT))
                {
                    if (sGame->players[0].comm.pickState == 0)
                    {
                        sGame->players[0].comm.ateBerry = 0;
                        sGame->players[0].comm.pickState = UpdatePickStateQueue(3);
                    }
                }
                else
                {
                    sGame->players[0].comm.pickState = UpdatePickStateQueue(0);
                }
            }
        }
        else
        {
            SetGameFunc(11);
        }
        UpdateFallingBerries();
        HandleSound_Leader();
    }
}
static void PlayGame_Member(void)
{
    if (sGame->numGraySquares < 10)
    {
        if (JOY_NEW(DPAD_UP))
        {
            if (sGame->players[sGame->multiplayerId].comm.pickState == 0)
            {
                sGame->player.comm.pickState = 2;
            }
        }
        else if (JOY_NEW(DPAD_RIGHT))
        {
            if (sGame->players[sGame->multiplayerId].comm.pickState == 0)
            {
                sGame->player.comm.pickState = 1;
            }
        }
        else if (JOY_NEW(DPAD_LEFT))
        {
            if (sGame->players[sGame->multiplayerId].comm.pickState == 0)
            {
                sGame->player.comm.pickState = 3;
            }
        }
        else
        {
            sGame->player.comm.pickState = 0;
        }
    }
    else
    {
        SetGameFunc(11);
    }
    HandleSound_Member();
}

static void WaitEndGame_Leader(void)
{
    u8 i;

    UpdateFallingBerries();
    HandleSound_Leader();
    if (ReadyToEndGame_Leader() == 1)
    {
        SetMaxBerriesPickedInRow();
        SetGameFunc(5);
    }
    else
    {
        sGame->allReadyToEnd = 1;
        for (i = 1; i < sGame->numPlayers; i++)
        {
            if (sGame->readyToEnd[i] != 1)
            {
                sGame->allReadyToEnd = 0;
                break;
            }
        }
    }
}

static void WaitEndGame_Member(void)
{
    HandleSound_Member();
    if (ReadyToEndGame_Member() == 1)
        SetGameFunc(5);
}

static void InitResults_Leader(void)
{
    u8 blockReceivedStatus;
    u8 i;
    switch (sGame->state)
    {
    case 0:
        SendBlock(0, sGame->berryResults, sizeof(sGame->berryResults));
        sGame->playersReceived = 0;
        sGame->state++;
        break;
    case 1:
        if (IsLinkTaskFinished())
        {
            sGame->state++;
        }
        break;
    case 2:
        blockReceivedStatus = GetBlockReceivedStatus();
        for (i = 0; i < sGame->numPlayers; blockReceivedStatus >>= 1, i++)
        {
            if (blockReceivedStatus & 1)
            {
                ResetBlockReceivedFlag(i);
                sGame->playersReceived++;
            }
        }
        if (sGame->playersReceived >= sGame->numPlayers)
        {
            sGame->timer++;
            sGame->state++;
        }
        break;
    default:
        if (WaitFanfare(TRUE))
        {
            SetGameFunc(6);
            FadeOutAndPlayNewMapMusic(MUS_VICTORY_WILD, 4);
        }
        break;
    }
}

static void InitResults_Member(void)
{
    u8 i;
    u8 blockReceivedStatus;

    switch (sGame->state) {
    case 0:
        SendBlock(0, sGame->berryResults[sGame->timer], sizeof(sGame->berryResults));
        sGame->playersReceived = 0;
        sGame->state++;
        break;
    case 1:
        if (IsLinkTaskFinished()) {
            sGame->state++;
        }
        break;
    case 2:
        blockReceivedStatus = GetBlockReceivedStatus();
        for (i = 0; i < sGame->numPlayers; blockReceivedStatus >>= 1, i++)
        {
            if (blockReceivedStatus & 1)
            {
                memcpy(sGame->berryResults, gBlockRecvBuffer, sizeof(sGame->berryResults));
                ResetBlockReceivedFlag(i);
                sGame->playersReceived++;
            }
        }
        if (sGame->playersReceived >= sGame->numPlayers) {
            sGame->timer++;
            sGame->state++;
        }
        break;
    default:
        if (WaitFanfare(TRUE)) {
            sGame->maxBerriesPickedInRow = sGame->berryResults[sGame->multiplayerId][5];
            SetGameFunc(6);
            FadeOutAndPlayNewMapMusic(MUS_VICTORY_WILD, 4);
        }
        break;
    }
}

static void DoResults(void)
{
    u8 sp00;
    u8 i;
    u8 blockReceivedStatus;

    switch (sGame->state)
    {
    case 0:
        TryUpdateRecords();
        SetStatusBarInvisibility(TRUE);
        ResetCloudPos();
        SetCloudInvisibility(TRUE);
        SetGfxFuncById(2);
        sGame->state++;
        break;
    case 1:
        if (!IsGfxFuncActive())
        {
            sp00 = 1;
            SetGfxFuncById(5);
            sp00 = GetPlayAgainState();
            SendBlock(0, &sp00, sizeof(sp00));
            sGame->state++;
        }
        break;
    case 2:
        if (IsLinkTaskFinished())
        {
            sGame->state++;
            sGame->playersReceived = 0;
        }
        break;
    case 3:
        blockReceivedStatus = GetBlockReceivedStatus();
        for (i = 0; i < sGame->numPlayers; blockReceivedStatus >>= 1, i++)
        {
            if (blockReceivedStatus & 1)
            {
                *(sGame->playAgainStates + i) = *(u8 *)gBlockRecvBuffer[i];
                ResetBlockReceivedFlag(i);
                sGame->playersReceived++;
            }
        }
        if (sGame->playersReceived >= sGame->numPlayers) {
            if (++sGame->timer >= 120)
            {
                SetGfxFuncById(6);
                sGame->state++;
            }
        }
        break;
    default:
        if (!IsGfxFuncActive())
        {
            SetGameFunc(7);
        }
        break;
    }
}

static void AskPlayAgain(void)
{
    u8 sp0;
    u8 i;
    u8 blockReceivedStatus;

    switch (sGame->state)
    {
    case 0:
        if (GetHighestScore() >= 3000)
        {
            SetGfxFuncById(4);
        }
        sGame->state++;
        break;
    case 1:
        if (!IsGfxFuncActive())
        {
            SetGfxFuncById(3);
            sGame->state++;
        }
        break;
    case 2:
        ResetBerryAndStatusBarSprites();
        ResetForPlayAgainPrompt();
        sGame->state++;
        break;
    case 3:
        if ((sp0 = GetPlayAgainState()) != 0)
        {
            sGame->state++;
        }
        break;
    case 4:
        if (!IsGfxFuncActive())
        {
            SetGfxFuncById(5);
            sp0 = GetPlayAgainState();
            SendBlock(0, &sp0, sizeof(sp0));
            sGame->state++;
        }
        break;
    case 5:
        if (IsLinkTaskFinished())
        {
            sGame->state++;
            sGame->playersReceived = 0;
        }
        break;
    case 6:
        blockReceivedStatus = GetBlockReceivedStatus();
        for (i = 0; i < sGame->numPlayers; blockReceivedStatus >>= 1, i++)
        {
            if (blockReceivedStatus & 1)
            {
                *(sGame->playAgainStates + i) = *(u8 *)gBlockRecvBuffer[i];
                ResetBlockReceivedFlag(i);
                sGame->playersReceived++;
            }
        }
        if (sGame->playersReceived >= sGame->numPlayers) {
            if (++sGame->timer >= 120)
            {
                ResetPickState();
                SetGfxFuncById(6);
                sGame->state++;
            }
        }
        else
        {
            HandleWaitPlayAgainInput();
        }
        break;
    default:
        if (!IsGfxFuncActive())
        {
            for (i = 0; i < sGame->numPlayers; i++)
            {
                if (sGame->playAgainStates[i] == 2)
                {
                    SetGameFunc(8);
                    return;
                }
            }
            SetGameFunc(10);
        }
        break;
    }
}

static void EndLink(void)
{
    switch (sGame->state)
    {
    case 0:
        SetCloseLinkCallback();
        SetGfxFuncById(7);
        sGame->state++;
        break;
    case 1:
        if (!IsGfxFuncActive())
        {
            sGame->state++;
        }
        break;
    case 2:
        if (GetPlayAgainState() == 5)
        {
            sGame->state++;
        }
        break;
    default:
        if (!gReceivedRemoteLinkPlayers)
        {
            SetGameFunc(9);
        }
        break;
    }
}

static void ExitGame(void)
{
    switch (sGame->state)
    {
    case 0:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        sGame->state++;
        break;
    case 1:
        UpdatePaletteFade();
        if (!gPaletteFade.active)
        {
            sGame->state++;
        }
        break;
    case 2:
        FreeBerrySprites();
        FreeStatusBar();
        FreeDodrioSprites(sGame->numPlayers);
        FreeCloudSprites();
        sExitingGame = TRUE;
        SetGfxFuncById(8);
        sGame->state++;
        break;
    default:
        if (!IsGfxFuncActive())
        {
            SetMainCallback2(sGame->exitCallback);
            DestroyTask(sGame->taskId);
            Free(sGame);
            FreeAllWindowBuffers();
        }
        break;
    }
}

static void ResetGame(void)
{
    switch (sGame->state)
    {
    case 0:
        SetGfxFuncById(9);
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        sGame->state++;
        break;
    case 1:
        UpdatePaletteFade();
        if (!gPaletteFade.active)
        {
            sGame->state++;
        }
        break;
    case 2:
        ChangeBgX(0, 0, 0);
        ChangeBgY(0, 0, 0);
        ChangeBgX(1, 0, 0);
        ChangeBgY(1, 0, 0);
        ChangeBgX(2, 0, 0);
        ChangeBgY(2, 0, 0);
        ChangeBgX(3, 0, 0);
        ChangeBgY(3, 0, 0);
        sGame->state++;
        break;
    case 3:
        StopMapMusic();
        sGame->state++;
        break;
    case 4:
        PlayNewMapMusic(MUS_BERRY_PICK);
        StartCloudMovement();
        sGame->state++;
        break;
    case 5:
        BlendPalettes(PALETTES_ALL, 16, RGB_BLACK);
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        sGame->state++;
        break;
    case 6:
        UpdatePaletteFade();
        if (!gPaletteFade.active)
        {
            sGame->state++;
        }
        break;
    default:
        DestroyTask(sGame->taskId);
        CreateDodrioGameTask(Task_NewGameIntro);
        ResetGfxState();
        InitDodrioGame(sGame);
        if (!gReceivedRemoteLinkPlayers)
        {
            sGame->numPlayers = 1;
        }
        SetRandomPrize();
        SetCloudInvisibility(FALSE);
        break;
    }
}

static void Task_NewGameIntro(u8 taskId)
{
    switch (sGame->state)
    {
    case 0:
        if (SlideTreeBordersOut() == 1)
        {
            sGame->state++;
        }
        break;
    case 1:
        InitStatusBarPos();
        sGame->state++;
        break;
    case 2:
        if (DoStatusBarIntro() == TRUE)
        {
            sGame->state++;
        }
        break;
    default:
        if (sGame->isLeader != 0)
        {
            CreateDodrioGameTask(Task_DodrioGame_Leader);
        }
        else
        {
            CreateDodrioGameTask(Task_DodrioGame_Member);
        }
        DestroyTask(taskId);
        break;
    }
}

static void Task_CommunicateMonInfo(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u8 i;
    u8 blockReceivedStatus;

    switch (data[0])
    {
    case 0:
        SendBlock(0, &sGame->monInfo[sGame->multiplayerId].isShiny, sizeof(sGame->monInfo[sGame->multiplayerId].isShiny));
        sGame->playersReceived = 0;
        data[0]++;
        break;
    case 1:
        if (IsLinkTaskFinished())
        {
            data[0]++;
        }
        break;
    case 2:
        blockReceivedStatus = GetBlockReceivedStatus();
        for (i = 0; i < sGame->numPlayers; blockReceivedStatus >>= 1, i++)
        {
            if (blockReceivedStatus & 1)
            {
                *(u8 *)&sGame->monInfo[i] = *(u8 *)gBlockRecvBuffer[i];
                ResetBlockReceivedFlag(i);
                sGame->playersReceived++;
            }
        }
        if (sGame->playersReceived >= sGame->numPlayers)
        {
            DestroyTask(taskId);
            SetGfxFuncById(6);
            sGame->state++;
        }
        break;
    }
}

static void RecvLinkData_Gameplay(void)
{
    u8 i;
    u8 r7 = sGame->numPlayers;

    sGame->players[0].receivedGameStatePacket = sub_815A950(0, &sGame->players[0], &sGame->players[0].comm, &sGame->players[1].comm, &sGame->players[2].comm, &sGame->players[3].comm, &sGame->players[4].comm, &sGame->numGraySquares, &sGame->berriesFalling, &sGame->allReadyToEnd);
    sGame->clearRecvCmds = 1;

    for (i = 1; i < r7; i++)
    {
        if (   sGame->inputState[i] == 0
               && sub_815AB04(i, &sGame->players[i].comm.pickState) == 0)
        {
            sGame->players[i].comm.pickState = 0;
            sGame->clearRecvCmds = 0;
        }
    }
    if (++sGame->clearRecvCmdTimer >= 60)
    {
        if (sGame->clearRecvCmds != 0)
        {
            ClearRecvCommands();
            sGame->clearRecvCmdTimer = 0;
        }
        else if (sGame->clearRecvCmdTimer > 70)
        {
            ClearRecvCommands();
            sGame->clearRecvCmdTimer = 0;
        }
    }

    for (i = 0; i < r7; i++)
    {
        if (   sGame->players[i].comm.pickState != 0
               && sGame->inputState[i] == 0)
        {
            sGame->inputState[i] = 1;
        }
        switch (sGame->inputState[i])
        {
        case 0:
        default:
            break;
        case 1 ... 3:
            if (++sGame->inputDelay[i] >= 6)
            {
                sGame->inputDelay[i] = 0;
                sGame->inputState[i] = 0;
                sGame->players[i].comm.pickState = 0;
                sGame->players[i].comm.ateBerry = 0;
                sGame->players[i].comm.missedBerry = 0;
            }
            break;
        case 4:
            if (++sGame->inputDelay[i] >= 40)
            {
                sGame->inputDelay[i] = 0;
                sGame->inputState[i] = 0;
                sGame->players[i].comm.pickState = 0;
                sGame->players[i].comm.ateBerry = 0;
                sGame->players[i].comm.missedBerry = 0;
            }
            break;
        }
    }
}

static void RecvLinkData_ReadyToEnd(void)
{
    u8 i;
    u8 r6 = sGame->numPlayers;

    sGame->players[0].receivedGameStatePacket = sub_815A950(0, &sGame->players[0], &sGame->players[0].comm, &sGame->players[1].comm, &sGame->players[2].comm, &sGame->players[3].comm, &sGame->players[4].comm, &sGame->numGraySquares, &sGame->berriesFalling, &sGame->allReadyToEnd);
    sGame->clearRecvCmds = 1;

    for (i = 1; i < r6; i++)
    {
        if (sub_815AB60(i) != 0)
        {
            sGame->readyToEnd[i] = 1;
            sGame->clearRecvCmds = 0;
        }
    }
    if (++sGame->clearRecvCmdTimer >= 60)
    {
        if (sGame->clearRecvCmds != 0)
        {
            ClearRecvCommands();
            sGame->clearRecvCmdTimer = 0;
        }
        else if (sGame->clearRecvCmdTimer > 70)
        {
            ClearRecvCommands();
            sGame->clearRecvCmdTimer = 0;
        }
    }
}

static void RecvLinkData_Leader(void)
{
    switch (sGame->funcId)
    {
    case 3:
        if (AllPlayersReadyToStart() == TRUE)
        {
            ResetReadyToStart();
            sGame->startGame = 1;
        }
        break;
    case 4:
        RecvLinkData_Gameplay();
        break;
    case 11:
        RecvLinkData_ReadyToEnd();
        break;
    }
}

static void SendLinkData_Leader(void)
{
    switch (sGame->funcId)
    {
    case 4:
        sub_815A61C(&sGame->player, &sGame->players[0].comm, &sGame->players[1].comm, &sGame->players[2].comm, &sGame->players[3].comm, &sGame->players[4].comm, sGame->numGraySquares, sGame->berriesFalling, sGame->allReadyToEnd);
        break;
    case 11:
        sub_815A61C(&sGame->player, &sGame->players[0].comm, &sGame->players[1].comm, &sGame->players[2].comm, &sGame->players[3].comm, &sGame->players[4].comm, sGame->numGraySquares, sGame->berriesFalling, sGame->allReadyToEnd);
        break;
    }
}

static void RecvLinkData_Member(void)
{
    switch (sGame->funcId)
    {
    case 4:
        sub_815A950(sGame->multiplayerId, &sGame->players[sGame->multiplayerId], &sGame->players[0].comm, &sGame->players[1].comm, &sGame->players[2].comm, &sGame->players[3].comm, &sGame->players[4].comm, &sGame->numGraySquares, &sGame->berriesFalling, &sGame->allReadyToEnd);
        break;
    case 11:
        sub_815A950(sGame->multiplayerId, &sGame->players[sGame->multiplayerId], &sGame->players[0].comm, &sGame->players[1].comm, &sGame->players[2].comm, &sGame->players[3].comm, &sGame->players[4].comm, &sGame->numGraySquares, &sGame->berriesFalling, &sGame->allReadyToEnd);
        break;
    }
}

static void SendLinkData_Member(void)
{
    switch (sGame->funcId)
    {
    case 3:
        sub_815A5BC(1);
        sGame->startGame = 1;
        break;
    case 4:
        if (sGame->player.comm.pickState != 0)
        {
            sub_815AAD8(sGame->player.comm.pickState);
        }
        break;
    case 11:
        if (sGame->berriesFalling == 0 && sGame->allReadyToEnd == 0)
        {
            sub_815AB3C(1);
        }
        break;
    }
}

static void HandleSound_Leader(void)
{
    if (sGame->players[sGame->multiplayerId].comm.pickState == 0)
    {
        if (!IsSEPlaying())
        {
            sGame->playingPickSound = 0;
        }
    }
    else if (sGame->players[sGame->multiplayerId].comm.ateBerry == 1)
    {
        if (sGame->playingPickSound == 0)
        {
            m4aSongNumStop(SE_SUCCESS);
            PlaySE(SE_SUCCESS);
            sGame->playingPickSound = 1;
        }
    }
    else if (sGame->players[sGame->multiplayerId].comm.missedBerry == 1)
    {
        if (sGame->playingPickSound == 0 && !IsSEPlaying())
        {
            PlaySE(SE_BOO);
            StartDodrioMissedAnim(1);
            sGame->playingPickSound = 1;
        }
    }

    if (sGame->endSoundState == 0 && sGame->numGraySquares >= 10)
    {
        StopMapMusic();
        sGame->endSoundState = 1;
    }
    else if (sGame->endSoundState == 1)
    {
        PlayFanfareByFanfareNum(FANFARE_TOO_BAD);
        sGame->endSoundState = 2;
    }
}

static void HandleSound_Member(void)
{
    u8 r8 = sGame->berryColStart;
    u8 r7 = sGame->berryColEnd;
    u8 r4;
    if (sGame->players[sGame->multiplayerId].comm.pickState == 0)
    {
        if (sGame->players[sGame->multiplayerId].comm.ateBerry != 1 && sGame->players[sGame->multiplayerId].comm.missedBerry != 1)
        {
            sGame->playingPickSound = 0;
        }
    }
    else if (sGame->players[sGame->multiplayerId].comm.ateBerry == 1)
    {
        if (sGame->playingPickSound == 0)
        {
            m4aSongNumStop(SE_SUCCESS);
            PlaySE(SE_SUCCESS);
            sGame->playingPickSound = 1;
        }
    }
    else if (sGame->players[sGame->multiplayerId].comm.missedBerry == 1)
    {
        if (sGame->playingPickSound == 0 && !IsSEPlaying())
        {
            PlaySE(SE_BOO);
            StartDodrioMissedAnim(1);
            sGame->playingPickSound = 1;
        }
    }
    for (r4 = r8; r4 < r7; r4++)
    {
        struct DodrioGame_Berries * ptr = &sGame->players[sGame->multiplayerId].berries;
        if (ptr->fallDist[r4] >= 10)
        {
            if (sGame->playingSquishSound[r4] == 0)
            {
                PlaySE(SE_BALLOON_RED + ptr->ids[r4]);
                sGame->playingSquishSound[r4] = 1;
            }
        }
        else
        {
            sGame->playingSquishSound[r4] = 0;
        }
    }
    if (sGame->endSoundState == 0 && sGame->numGraySquares >= 10)
    {
        StopMapMusic();
        sGame->endSoundState = 1;
    }
    else if (sGame->endSoundState == 1)
    {
        PlayFanfareByFanfareNum(FANFARE_TOO_BAD);
        sGame->endSoundState = 2;
    }
}

static void CB2_DodrioGame(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void VBlankCB_DodrioGame(void)
{
    TransferPlttBuffer();
    LoadOam();
    ProcessSpriteCopyRequests();
}

static void InitMonInfo(struct DodrioGame_MonInfo * a0, struct Pokemon * a1)
{
    a0->isShiny = IsMonShiny(a1);
}

static void CreateTask_(TaskFunc func, u8 priority)
{
    CreateTask(func, priority);
}

static void CreateDodrioGameTask(TaskFunc func)
{
    sGame->taskId = CreateTask(func, 1);
    sGame->state = 0;
    sGame->startState = 0;
    sGame->timer = 0;
}

static void SetGameFunc(u8 a0)
{
    sGame->prevFuncId = sGame->funcId;
    sGame->funcId = a0;
    sGame->state = 0;
    sGame->timer = 0;
}

static bool32 SlideTreeBordersOut(void)
{
    u8 r2 = sGame->timer / 4;
    sGame->timer++;
    if (r2 != 0 && sGame->timer % 4 == 0)
    {
        if (r2 < sTreeBorderXPos[sGame->numPlayers - 1])
        {
            SetGpuReg(REG_OFFSET_BG1HOFS,  (r2 * 8));
            SetGpuReg(REG_OFFSET_BG2HOFS, -(r2 * 8));
            return FALSE;
        }
        else
        {
            return TRUE;
        }
    }
    else
    {
        return FALSE;
    }
}

static void InitFirstWaveOfBerries(void)
{
    u8 i;
    u8 start = sGame->berryColStart;
    u8 finish = sGame->berryColEnd;

    for (i = start; i < finish; i++)
    {
        struct DodrioGame_Berries * ptr = &sGame->player.berries;
        ptr->fallDist[i] = (i % 2 == 0) ? 1 : 0;
        ptr->ids[i] = 0;
    }
}

static void HandlePickBerries(void)
{
    u8 sp0 = sGame->berryColStart;
    u8 sp4 = sGame->berryColEnd;
    u8 sp8 = sGame->numPlayers;
    u8 i, j, k, r5;

    if (sGame->numGraySquares >= 10)
        return;

    for (i = 0; i < sp8; i++)
    {
        u8 *ptr = &sGame->players[i].comm.pickState;
        if (*ptr != 0 && sGame->inputState[i] == 1)
        {
            for (j = sp0; j < sp4; j++)
            {
                r5 = sActiveColumnMap[0][0][j];
                if (sGame->playersAttemptingPick[r5][0] == i || sGame->playersAttemptingPick[r5][1] == i)
                    break;
                if (TryPickBerry(i, *ptr, r5) == TRUE)
                {
                    for (k = 0; k < 2; k++)
                    {
                        if (sGame->playersAttemptingPick[r5][k] == 0xFF)
                        {
                            sGame->playersAttemptingPick[r5][k] = i;
                            sGame->inputState[i] = 2;
                            sGame->berryState[r5] = 1;
                            break;
                        }
                    }
                    break;
                }
                if (sGame->players[i].comm.missedBerry == 1)
                    break;
            }
        }
    }

    for (j = sp0; j < sp4; j++)
    {
        u8 id = 0xFF;
        r5 = sActiveColumnMap[0][0][j];
        if (sGame->berryState[r5] == 1)
        {
            s32 r2;
            u8 r4, r3 = sGame->difficulty[GetPlayerIdAtColumn(r5)] / 7;
            if (r3 >= NELEMS(sBerryFallDelays) - 1)
                r3 = NELEMS(sBerryFallDelays) - 1;

            r2 = sBerryFallDelays[r3][sGame->players[0].berries.ids[r5]] - sGame->fallTimer[r5];
            if (r2 < 6)
                sGame->eatTimer[r5] += r2;

            if (++sGame->eatTimer[r5] >= 6)
            {
                sGame->eatTimer[r5] = 0;
                if (sGame->playersAttemptingPick[r5][0] == 0xFF && sGame->playersAttemptingPick[r5][1] == 0xFF)
                {
                    continue;
                }
                else if (sGame->playersAttemptingPick[r5][0] != 0xFF && sGame->playersAttemptingPick[r5][1] == 0xFF)
                {
                    r4 = sGame->playersAttemptingPick[r5][0];
                }
                else
                {
                    u8 unk0 = sGame->playersAttemptingPick[r5][0];
                    i = sGame->playersAttemptingPick[r5][1]; // Have to re-use the variable to match.
                    if (!(Random() & 1))
                    {
                        r4 = unk0;
                        id = i;
                    }
                    else
                    {
                        r4 = i;
                        id = unk0;
                    }
                }
                sGame->player.berries.fallDist[r5] = 7;
                sGame->berryState[r5] = 2;
                sGame->inputState[r4] = 3;
                sGame->berryEatenBy[r5] = r4;
                sGame->players[r4].comm.ateBerry = 1;
                sGame->players[id].comm.missedBerry = 1;
                sGame->berriesEaten[r4]++;
                IncrementBerryResult(0, r5, r4);
                UpdateBerriesPickedInRow(TRUE);
                TryIncrementDifficulty(r4);
                sGame->prevBerryIds[r5] = sGame->player.berries.ids[r5];
                sGame->player.berries.ids[r5] = 3;
                sGame->playersAttemptingPick[r5][0] = 0xFF;
                sGame->playersAttemptingPick[r5][1] = 0xFF;
            }
        }
    }
}

static bool32 TryPickBerry(u8 a0, u8 a1, u8 a2)
{
    s32 r7 = 0;
    u8 r5 = sGame->numPlayers - 1;
    struct DodrioGame_Berries * ptr = &sGame->player.berries;

    switch (a1)
    {
    case 3:
    default:
        r7 = 0;
        break;
    case 2:
        r7 = 1;
        break;
    case 1:
        r7 = 2;
        break;
    }
    if (ptr->fallDist[a2] == 6 || ptr->fallDist[a2] == 7)
    {
        if (a2 == sDodrioHeadToColumnMap[r5][a0][r7])
        {
            if (sGame->berryState[a2] == 1 || sGame->berryState[a2] == 2)
            {
                sGame->players[a0].comm.missedBerry = 1;
                return FALSE;
            }
            else
            {
                return TRUE;
            }
        }
    }
    else
    {
        if (a2 == sDodrioHeadToColumnMap[r5][a0][r7])
        {
            sGame->inputState[a0] = 4;
            sGame->players[a0].comm.missedBerry = 1;
        }
    }
    return FALSE;
}

static void UpdateFallingBerries(void)
{
    u8 r1 = sGame->berryColStart;
    u8 r9 = sGame->berryColEnd;
    u8 r3 = 0;
    u8 r10 = 0;
    u8 i;
    u8 r2;
    struct DodrioGame * ptr;

    sGame->berriesFalling = 0;

    for (i = r1; i < r9 - 1; i++)
    {
        ptr = sGame;

        if (sGame->berryState[i] == 0 || sGame->berryState[i] == 1)
        {
            sGame->berriesFalling = 1;
            if (ptr->player.berries.fallDist[i] >= 10)
            {
                ptr->player.berries.fallDist[i] = 10;
                sGame->berryState[i] = 3;
                if (sGame->playingSquishSound[i] == 0)
                {
                    sGame->playingSquishSound[i] = 1;
                    PlaySE(SE_BALLOON_RED + ptr->player.berries.ids[i]);
                }
                if (sGame->numGraySquares < 10 || r10 == 1)
                {
                    r10 = 1;
                    sGame->playingSquishSound[i] = 0;
                    if (sGame->numGraySquares < 10)
                    {
                        sGame->numGraySquares++;
                    }
                    IncrementBerryResult(3, i, 0);
                    UpdateBerriesPickedInRow(FALSE);
                }
            }
            else
            {
                r3 = sGame->difficulty[GetPlayerIdAtColumn(i)] / 7;
                if (r3 >= NELEMS(sBerryFallDelays) - 1)
                {
                    r3 = NELEMS(sBerryFallDelays) - 1;
                }
                r2 = sBerryFallDelays[r3][ptr->player.berries.ids[i]];
                if (++sGame->fallTimer[i] >= r2)
                {
                    ptr->player.berries.fallDist[i]++;
                    sGame->fallTimer[i] = 0;
                }
                HandlePickBerries();
            }
        }
        else if (sGame->berryState[i] == 2)
        {
            // sGame->berriesFalling = 1;
            if (++sGame->newBerryTimer[i] >= 20)
            {
                sGame->players[sGame->berryEatenBy[i]].comm.ateBerry = 0;
                sGame->newBerryTimer[i] = 0;
                sGame->fallTimer[i] = 0;
                sGame->berryState[i] = 0;
                ptr->player.berries.fallDist[i] = 1;
                ptr->player.berries.ids[i] = GetNewBerryId(GetPlayerIdAtColumn(i), i);
            }
        }
        else if (sGame->berryState[i] == 3)
        {
            if (++sGame->newBerryTimer[i] >= 20)
            {
                if (sGame->numGraySquares < 10)
                {
                    sGame->newBerryTimer[i] = 0;
                    sGame->fallTimer[i] = 0;
                    sGame->berryState[i] = 0;
                    ptr->player.berries.fallDist[i] = 1;
                    sGame->prevBerryIds[i] = ptr->player.berries.ids[i];
                    ptr->player.berries.ids[i] = GetNewBerryId(GetPlayerIdAtColumn(i), i);
                }
            }
        }
    }
}

static void UpdateBerrySprites(void)
{
    u8 i, first, count;

    first = sGame->berryColStart;
    count = sGame->berryColEnd;
    for (i = first; i < count; i++)
    {
        struct DodrioGame_Player * ptr = &sGame->players[sGame->multiplayerId];
        u8 var = sActiveColumnMap[sGame->numPlayers - 1][sGame->multiplayerId][i];

        if (ptr->berries.fallDist[var] != 0)
            SetBerryInvisibility(i, FALSE);
        else
            SetBerryInvisibility(i, TRUE);

        if (ptr->berries.fallDist[var] > 9)
        {
            SetBerryAnim(i, ptr->berries.ids[var] + 3);
            SetBerryYPos(i, ptr->berries.fallDist[var] * 2 - 1);
        }
        else if (ptr->berries.ids[var] == 3)
        {
            ptr->berries.fallDist[var] = 7;
            SetBerryAnim(i, 6);
            SetBerryYPos(i, ptr->berries.fallDist[var] * 2 - 1);
        }
        else
        {
            SetBerryAnim(i, ptr->berries.ids[var]);
            SetBerryYPos(i, ptr->berries.fallDist[var] * 2);
        }
    }
}

static void UpdateAllDodrioAnims(void)
{
    u8 i, count;

    count = sGame->numPlayers;
    for (i = 0; i < count; i++)
    {
        struct DodrioGame_Player * ptr = &sGame->players[i];
        SetDodrioAnim(i, ptr->comm.pickState);
    }
}

static void SetAllDodrioDisabled(void)
{
    u8 i, count;

    count = sGame->numPlayers;
    for (i = 0; i < count; i++)
        SetDodrioAnim(i, 4);
}

static void UpdateGame_Leader(void)
{
    UpdateBerrySprites();
    if (sGame->numGraySquares > 9)
        SetAllDodrioDisabled();
    else
        UpdateAllDodrioAnims();

    UpdateStatusBarAnim(sGame->numGraySquares);
}

// Identical to UpdateGame_Leader
static void UpdateGame_Member(void)
{
    UpdateBerrySprites();
    if (sGame->numGraySquares > 9)
        SetAllDodrioDisabled();
    else
        UpdateAllDodrioAnims();

    UpdateStatusBarAnim(sGame->numGraySquares);
}

static void GetActiveBerryColumns(u8 arg0, u8 *arg1, u8 *arg2)
{
    switch (arg0)
    {
    case 1:
        *arg1 = 4, *arg2 = 7;
        break;
    case 2:
        *arg1 = 3, *arg2 = 8;
        break;
    case 3:
        *arg1 = 2, *arg2 = 9;
        break;
    case 4:
        *arg1 = 1, *arg2 = 10;
        break;
    case 5:
        *arg1 = 0, *arg2 = 11;
        break;
    }
}

static bool32 AllPlayersReadyToStart(void)
{
    u8 i, count;

    count = sGame->numPlayers;
    for (i = 1; i < count; i++)
    {
        if (sGame->readyToStart[i] == 0)
            sGame->readyToStart[i] = sub_815A5E8(i);
    }

    // This loop won't ever run, the seemingly pointless assingment below is to make the compiler
    // generate code for it.
    count = count;
    for (; i < count; i++)
    {
        if (sGame->readyToStart[i] == 0)
            return FALSE;
    }

    return TRUE;
}

static void ResetReadyToStart(void)
{
    u8 i;

    for (i = 0; i < 5; i++)
        sGame->readyToStart[i] = 0;
}

static bool32 ReadyToEndGame_Leader(void)
{
    if (sGame->numGraySquares > 9 && sGame->berriesFalling == 0)
    {
        sGame->numGraySquares = 10;
        if (sGame->allReadyToEnd != 0)
            return TRUE;
    }

    return FALSE;
}

static bool32 ReadyToEndGame_Member(void)
{
    u8 i, first, count;

    if (sGame->numGraySquares > 9)
    {
        first = sGame->berryColStart;
        count = sGame->berryColEnd;
        sGame->numGraySquares = 10;
        if (sGame->allReadyToEnd != 0)
        {
            for (i = first; i < count; i++)
            {
                struct DodrioGame_Player * ptr = &sGame->players[sGame->multiplayerId];
                u8 var = sActiveColumnMap[sGame->numPlayers - 1][sGame->multiplayerId][i];

                if (ptr->berries.fallDist[var] != 10)
                    return FALSE;
            }
            return TRUE;
        }
    }

    return FALSE;
}

static void TryIncrementDifficulty(u8 arg0)
{
    u8 var = sDifficultyThresholds[sGame->difficulty[arg0] % 7] + (sGame->difficulty[arg0] / 7) * 100;
    if (sGame->berriesEaten[arg0] >= var)
        sGame->difficulty[arg0]++;
}

static u8 GetPlayerIdAtColumn(u8 arg0)
{
    return sPlayerIdAtColumn[sGame->numPlayers - 1][arg0];
}

static u8 GetNewBerryId(u8 arg0, u8 arg1)
{
    u8 i, var3;
    u8 count = sGame->numPlayers - 1;
    u8 var0 = sDodrioNeighborMap[count][arg0][0];
    u8 var1 = sDodrioNeighborMap[count][arg0][1];
    u8 var2 = sDodrioNeighborMap[count][arg0][2];

    for (i = 0; sUnsharedColumns[count][i] != 0; i++)
    {
        if (arg1 == sUnsharedColumns[count][i])
            return GetNewBerryIdByDifficulty(sGame->difficulty[var1], arg1);
    }

    // Gets the highest of the three.
    if (sGame->difficulty[var0] > sGame->difficulty[var1])
        var3 = sGame->difficulty[var0];
    else
        var3 = sGame->difficulty[var1];

    if (sGame->difficulty[var2] > var3)
        var3 = sGame->difficulty[var2];

    return GetNewBerryIdByDifficulty(var3, arg1);
}

static u8 GetNewBerryIdByDifficulty(u8 arg0, u8 arg1)
{
    u8 var = sGame->prevBerryIds[arg1];
    switch (arg0 % 7)
    {
    default: return 0;
    case 0:  return 0;
    case 1:  return 1;
    case 2:  return 2;
    case 3:
        if (var == 0)
            return 1;
        else
            return 0;
    case 4:
        if (var == 0)
            return 2;
        else
            return 0;
    case 5:
        if (var == 2)
            return 1;
        else
            return 2;
    case 6:
        if (var == 0)
            return 1;
        else if (var == 1)
            return 2;
        else
            return 0;
    }
}

static void IncrementBerryResult(u8 arg0, u8 arg1, u8 arg2)
{
    u8 var;
    u8 count = sGame->numPlayers;
    switch (arg0)
    {
    case 0:
    case 1:
    case 2:
        var = sGame->players[0].berries.ids[arg1];
        sGame->berryResults[arg2][var] = IncrementWithLimit(sGame->berryResults[arg2][var], 20000);
        break;
    case 3:
        switch (count)
        {
        case 5:
            switch (arg1)
            {
            case 0:
                sGame->berryResults[2][3]++;
                sGame->berryResults[3][3]++;
                break;
            case 1:
                sGame->berryResults[3][3]++;
                break;
            case 2:
                sGame->berryResults[3][3]++;
                sGame->berryResults[4][3]++;
                break;
            case 3:
                sGame->berryResults[4][3]++;
                break;
            case 4:
                sGame->berryResults[4][3]++;
                sGame->berryResults[0][3]++;
                break;
            case 5:
                sGame->berryResults[0][3]++;
                break;
            case 6:
                sGame->berryResults[0][3]++;
                sGame->berryResults[1][3]++;
                break;
            case 7:
                sGame->berryResults[1][3]++;
                break;
            case 8:
                sGame->berryResults[1][3]++;
                sGame->berryResults[2][3]++;
                break;
            case 9:
                sGame->berryResults[2][3]++;
                break;
            }
            break;
        case 4:
            switch (arg1)
            {
            case 1:
                sGame->berryResults[2][3]++;
                sGame->berryResults[3][3]++;
                break;
            case 2:
                sGame->berryResults[3][3]++;
                break;
            case 3:
                sGame->berryResults[3][3]++;
                sGame->berryResults[0][3]++;
                break;
            case 4:
                sGame->berryResults[0][3]++;
                break;
            case 5:
                sGame->berryResults[0][3]++;
                sGame->berryResults[1][3]++;
                break;
            case 6:
                sGame->berryResults[1][3]++;
                break;
            case 7:
                sGame->berryResults[1][3]++;
                sGame->berryResults[2][3]++;
                break;
            case 8:
                sGame->berryResults[2][3]++;
                break;
            }
            break;
        case 3:
            switch (arg1)
            {
            case 2:
                sGame->berryResults[1][3]++;
                sGame->berryResults[2][3]++;
                break;
            case 3:
                sGame->berryResults[2][3]++;
                break;
            case 4:
                sGame->berryResults[2][3]++;
                sGame->berryResults[0][3]++;
                break;
            case 5:
                sGame->berryResults[0][3]++;
                break;
            case 6:
                sGame->berryResults[0][3]++;
                sGame->berryResults[1][3]++;
                break;
            case 7:
                sGame->berryResults[1][3]++;
                break;
            }
            break;
        case 2:
            switch (arg1)
            {
            case 3:
                sGame->berryResults[0][3]++;
                sGame->berryResults[1][3]++;
                break;
            case 4:
                sGame->berryResults[0][3]++;
                break;
            case 5:
                sGame->berryResults[0][3]++;
                sGame->berryResults[1][3]++;
                break;
            case 6:
                sGame->berryResults[1][3]++;
                break;
            }
            break;
        }
        break;
    }
}

static void UpdateBerriesPickedInRow(bool32 arg0)
{
    if (sGame->numPlayers != 5)
        return;

    if (arg0 == TRUE)
    {
        if (++sGame->berriesPickedInRow > sGame->maxBerriesPickedInRow)
            sGame->maxBerriesPickedInRow = sGame->berriesPickedInRow;
        if (sGame->berriesPickedInRow > 9999)
            sGame->berriesPickedInRow = 9999;
    }
    else
    {
        if (sGame->berriesPickedInRow > sGame->maxBerriesPickedInRow)
            sGame->maxBerriesPickedInRow = sGame->berriesPickedInRow;
        sGame->berriesPickedInRow = 0;
    }
}

static void SetMaxBerriesPickedInRow(void)
{
    u8 i;
    for (i = 0; i < sGame->numPlayers; i++)
        sGame->berryResults[i][5] = sGame->maxBerriesPickedInRow;
}

static void ResetForPlayAgainPrompt(void)
{
    u8 i, j;

    for (i = 0; i < 5; i++)
    {
        for (j = 0; j < 11; j++)
            sGame->players[i].berries.fallDist[j] = 0;
        sGame->players[i].comm.pickState = 0;
        sGame->players[i].comm.ateBerry = 0;
        sGame->difficulty[i] = 0;
        sGame->berriesEaten[i] = 0;
        sGame->scoreResults[i].ranking = 0;
        sGame->scoreResults[i].score = 0;
        sGame->berryResults[i][0] = 0;
        sGame->berryResults[i][1] = 0;
        sGame->berryResults[i][2] = 0;
        sGame->berryResults[i][3] = 0;
        sGame->berryResults[i][4] = 0;
        sGame->berryResults[i][5] = 0;
    }
    sGame->endSoundState = 0;
    sGame->berriesPickedInRow = 0;
    sGame->numGraySquares = 0;
    UpdateAllDodrioAnims();
    UpdateBerrySprites();
}

static const s16 sBerryScoreMultipliers[] = {10, 30, 50, 50};

static void SetRandomPrize(void)
{
    u8 i, var = 0, var2 = 0;

    switch (sGame->numPlayers)
    {
    case 4:  var = 1; break;
    case 5:  var = 2; break;
    }

    var2 = Random() % 10;
    for (i = 0; i < 5; i++)
        sGame->berryResults[i][4] = sPrizeBerryIds[var][var2];
}

static u32 GetBerriesPicked(u8 arg0)
{
    u32 sum = sGame->berryResults[arg0][0]
              + sGame->berryResults[arg0][1]
              + sGame->berryResults[arg0][2];
    return min(sum, 9999);
}

static void TryUpdateRecords(void)
{
    u32 berriesPicked = Min(GetBerriesPicked(sGame->multiplayerId), 9999);
    u32 score = Min(GetScore(sGame->multiplayerId), 999990);

    if (gSaveBlock2Ptr->berryPick.bestScore < score)
        gSaveBlock2Ptr->berryPick.bestScore = score;
    if (gSaveBlock2Ptr->berryPick.berriesPicked < berriesPicked)
        gSaveBlock2Ptr->berryPick.berriesPicked = berriesPicked;
    if (gSaveBlock2Ptr->berryPick.berriesPickedInRow < sGame->maxBerriesPickedInRow)
        gSaveBlock2Ptr->berryPick.berriesPickedInRow = sGame->maxBerriesPickedInRow;
}

static u8 UpdatePickStateQueue(u8 arg0)
{
    u8 i, saved;

    saved = sGame->pickStateQueue[3];
    for (i = 3; i != 0; i--)
        sGame->pickStateQueue[i] = sGame->pickStateQueue[i - 1];
    sGame->pickStateQueue[0] = arg0;
    return saved;
}

static void HandleWaitPlayAgainInput(void)
{
    if (sGame->inputDelay[sGame->multiplayerId] == 0)
    {
        if (JOY_NEW(DPAD_UP))
        {
            sGame->players[sGame->multiplayerId].comm.pickState = 2;
            sGame->inputDelay[sGame->multiplayerId] = 6;
            PlaySE(SE_M_CHARM);
        }
        else if (JOY_NEW(DPAD_LEFT))
        {
            sGame->players[sGame->multiplayerId].comm.pickState = 3;
            sGame->inputDelay[sGame->multiplayerId] = 6;
            PlaySE(SE_M_CHARM);
        }
        else if (JOY_NEW(DPAD_RIGHT))
        {
            sGame->players[sGame->multiplayerId].comm.pickState = 1;
            sGame->inputDelay[sGame->multiplayerId] = 6;
            PlaySE(SE_M_CHARM);
        }
        else
        {
            sGame->players[sGame->multiplayerId].comm.pickState = 0;
        }
    }
    else
    {
        sGame->inputDelay[sGame->multiplayerId]--;
    }
}

static void ResetPickState(void)
{
    sGame->players[sGame->multiplayerId].comm.pickState = 0;
}

u16 GetPrizeItemId(void)
{
    return sGame->berryResults[sGame->multiplayerId][4] + FIRST_BERRY_INDEX;
}

u8 GetNumPlayers(void)
{
    return sGame->numPlayers;
}

u8 *GetPlayerName(u8 id)
{
    if (gReceivedRemoteLinkPlayers)
        return gLinkPlayers[id].name;
    else
        return sGame->players[id].name;
}

u16 GetBerryResult(u8 arg0, u8 arg1)
{
    return sGame->berryResults[arg0][arg1];
}

static u32 GetScore(u8 arg0)
{
    u8 i;
    u32 var, sum = 0;

    for (i = 0; i < 3; i++)
        sum += sGame->berryResults[arg0][i] * sBerryScoreMultipliers[i];

    var = sGame->berryResults[arg0][3] * sBerryScoreMultipliers[3];
    if (sum <= var)
        return 0;
    else
        return sum - var;
}

u32 GetHighestScore(void)
{
    u8 i, count = sGame->numPlayers;
    u32 maxVar = GetScore(0);

    for (i = 1; i < count; i++)
    {
        u32 var = GetScore(i);
        if (var > maxVar)
            maxVar = var;
    }
    return Min(maxVar, 999990);
}

u32 GetHighestBerryResult(u8 arg0)
{
    u8 i, count = sGame->numPlayers;
    u16 maxVar = sGame->berryResults[0][arg0];

    for (i = 0; i < count; i++)
    {
        u16 var = sGame->berryResults[i][arg0];
        if (var > maxVar)
            maxVar = var;
    }
    return maxVar;
}

static u32 GetScoreByRanking(u8 arg0)
{
    u32 vals[5], temp;
    s16 r6 = TRUE;
    u8 i, count = sGame->numPlayers;

    for (i = 0; i < count; i++)
        vals[i] = temp = GetScore(i);

    while (r6)
    {
        r6 = FALSE;
        for (i = 0; i < count - 1; i++)
        {
            if (vals[i] < vals[i + 1])
            {
                SWAP(vals[i], vals[i + 1], temp);
                r6 = TRUE;
            }
        }
    }

    return vals[arg0];
}

u32 SetScoreResults(void)
{
    u8 i, r10 = 0, r8 = 0, r9 = 0, count = sGame->numPlayers;

    // Function called two times for some reason.
    GetHighestScore();
    if (GetHighestScore() == 0)
    {
        for (i = 0; i < count; i++)
        {
            sGame->scoreResults[i].ranking = 4;
            sGame->scoreResults[i].score = 0;
        }
    }

    for (i = 0; i < count; i++)
        sGame->scoreResults[i].score = Min(GetScore(i), 999990);

    do
    {
        u32 r6 = GetScoreByRanking(r10);
        u8 r3 = r8;
        for (i = 0; i < count; i++)
        {
            if (r6 == sGame->scoreResults[i].score)
            {
                sGame->scoreResults[i].ranking = r3;
                r8++;
                r9++;
            }
        }
        r10 = r8;
    } while (r9 < count);

    return 0;
}

void GetScoreResults(struct DodrioGame_ScoreResults * dst, u8 id)
{
    *dst = sGame->scoreResults[id];
}

static u8 GetScoreRanking(u8 arg0)
{
    u8 i, ret = 0, count = sGame->numPlayers;
    u32 var, vars[5] = {0};

    for (i = 0; i < count; i++)
        vars[i] = GetScore(i);

    var = vars[arg0];
    for (i = 0; i < 5; i++)
    {
        if (i != arg0 && var < vars[i])
            ret++;
    }

    return ret;
}

u8 TryGivePrize(void)
{
    u8 multiplayerId = sGame->multiplayerId;
    u16 itemId = GetPrizeItemId();

    if (GetScore(multiplayerId) != GetHighestScore())
        return 3;
    if (!CheckBagHasSpace(itemId, 1))
        return 2;

    AddBagItem(itemId, 1);
    if (!CheckBagHasSpace(itemId, 1))
        return 1;
    return 0;
}

u32 IncrementWithLimit(u32 a, u32 max)
{
    if (a < max)
        return a + 1;
    else
        return max;
}

u32 Min(u32 a, u32 b)
{
    if (a < b)
        return a;
    else
        return b;
}

u8 GetPlayerIdByPos(u8 id)
{
    return sGame->posToPlayerId[id];
}

void IsDodrioInParty(void)
{
    int i;
    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SANITY_HAS_SPECIES)
            && GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2) == SPECIES_DODRIO)
        {
            gSpecialVar_Result = TRUE;
            return;
        }
    }

    gSpecialVar_Result = FALSE;
}

void ShowDodrioBerryPickingRecords(void)
{
    u8 taskId = CreateTask(Task_ShowDodrioBerryPickingRecords, 0);
    Task_ShowDodrioBerryPickingRecords(taskId);
}

// Data related to printing saved results.
static const struct WindowTemplate sWindowTemplates_Records =
{
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 28,
    .height = 11,
    .paletteNum = 15,
    .baseBlock = 1,
};

static const u8 *const sRecordsTexts[] = {gText_BerryPickingRecords, gText_BerriesPicked, gText_BestScore, gText_BerriesInRowFivePlayers};
static const u8 sRecordNumMaxDigits[] = {4, 7, 4};

ALIGNED(4)
static const u8 sRecordTextYCoords[][2] = {{24}, {40}, {56}};
static const u8 sRecordNumYCoords[][2] = {{24}, {40}, {70}};

static void Task_ShowDodrioBerryPickingRecords(u8 taskId)
{
    struct WindowTemplate window;
    s32 i, width, widthCurr;
    s16 *data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        data[1] = AddWindow(&sWindowTemplates_Records);
        PrintRecordsText(data[1]);
        CopyWindowToVram(data[1], COPYWIN_FULL);
        data[0]++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            data[0]++;
        break;
    case 2:
        if (JOY_NEW(A_BUTTON | B_BUTTON))
        {
            rbox_fill_rectangle(data[1]);
            CopyWindowToVram(data[1], COPYWIN_MAP);
            data[0]++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            RemoveWindow(data[1]);
            DestroyTask(taskId);
            EnableBothScriptContexts();
        }
        break;
    }
}

static void PrintRecordsText(u8 windowId)
{
    s32 i, x, numWidth;
    s32 results[3];
    u8 strbuf[20];
    results[0] = gSaveBlock2Ptr->berryPick.berriesPicked;
    results[1] = gSaveBlock2Ptr->berryPick.bestScore;
    results[2] = gSaveBlock2Ptr->berryPick.berriesPickedInRow;

    TextWindow_SetStdFrame0_WithPal(windowId, 0x21D, 0xD0);
    DrawTextBorderOuter(windowId, 0x21D, 0xD);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    AddTextPrinterParameterized(windowId, FONT_2, sRecordsTexts[0], 1, 1, TEXT_SKIP_DRAW, NULL);
    for (i = 0; i < 3; i++)
    {
        ConvertIntToDecimalStringN(strbuf, results[i], STR_CONV_MODE_LEFT_ALIGN, sRecordNumMaxDigits[i]);
        numWidth = GetStringWidth(FONT_2, strbuf, -1);
        AddTextPrinterParameterized(windowId, FONT_2, sRecordsTexts[i + 1], 1, sRecordTextYCoords[i][0], TEXT_SKIP_DRAW, NULL);
        x = 224 - numWidth;
        AddTextPrinterParameterized(windowId, FONT_2, strbuf, x, sRecordNumYCoords[i][0], TEXT_SKIP_DRAW, NULL);
    }
    PutWindowTilemap(windowId);
}

// Debug functions?
static const u16 sDebug_BerryResults[][4] =
{
    {9999, 0, 90, 9999},
    {9999, 9999, 70, 9999},
    {9999, 0, 9999, 0},
    {9999, 9999, 60, 0},
    {9999, 9999, 9999, 0},
};

static const u8 sJPText_Vowels[] = _("あいうえおかき");
static const u8 sText_Letters[] = _("ABCDEFG");
static const u8 sText_Digits[] = _("0123456");

static const u8 *const sPlaceholderPlayerNames[] =
{
    sJPText_Vowels,
    sJPText_Vowels,
    sJPText_Vowels,
    sText_Letters,
    sText_Digits
};

static void Debug_UpdateNumPlayers(void)
{
    sGame->numPlayers = GetLinkPlayerCount();
}

static void Debug_SetPlayerNamesAndResults(void)
{
    u8 i, playerId;

    for (playerId = sGame->numPlayers; playerId < NELEMS(sPlaceholderPlayerNames); playerId++)
        StringCopy(gLinkPlayers[playerId].name, sPlaceholderPlayerNames[playerId]);

    sGame->numPlayers = 5;
    for (i = 0; i < 4; i++)
    {
        for (playerId = 0; playerId < sGame->numPlayers; playerId++)
            sGame->berryResults[playerId][i] = sDebug_BerryResults[playerId][i];
    }
}

static const struct BgTemplate sBgTemplates[] =
{
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0
    },
    {
        .bg = 1,
        .charBaseIndex = 2,
        .mapBaseIndex = 12,
        .screenSize = 1,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0
    },
    {
        .bg = 2,
        .charBaseIndex = 2,
        .mapBaseIndex = 14,
        .screenSize = 1,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0
    },
    {
        .bg = 3,
        .charBaseIndex = 3,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0
    },
};

static const struct WindowTemplate sWindowTemplate_Dummy = DUMMY_WIN_TEMPLATE;

static const struct WindowTemplate sWindowTemplates_Results[] =
{
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 28,
        .height = 3,
        .paletteNum = 13,
        .baseBlock = 0x13,
    },
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 6,
        .width = 28,
        .height = 13,
        .paletteNum = 13,
        .baseBlock = 0x67,
    }
};

static const struct WindowTemplate sWindowTemplate_Prize =
{
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 6,
    .width = 28,
    .height = 7,
    .paletteNum = 13,
    .baseBlock = 0x67,
};

static const struct WindowTemplate sWindowTemplates_PlayAgain[] =
{
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 8,
        .width = 19,
        .height = 3,
        .paletteNum = 13,
        .baseBlock = 0x13,
    },
    {
        .bg = 0,
        .tilemapLeft = 22,
        .tilemapTop = 7,
        .width = 6,
        .height = 4,
        .paletteNum = 13,
        .baseBlock = 0x4C,
    }
};

static const struct WindowTemplate sWindowTemplate_DroppedOut =
{
    .bg = 0,
    .tilemapLeft = 4,
    .tilemapTop = 6,
    .width = 22,
    .height = 5,
    .paletteNum = 13,
    .baseBlock = 0x13,
};

static const struct WindowTemplate sWindowTemplate_CommStandby =
{
    .bg = 0,
    .tilemapLeft = 5,
    .tilemapTop = 8,
    .width = 19,
    .height = 3,
    .paletteNum = 13,
    .baseBlock = 0x13,
};

static const u8 sActiveColumnMap_Duplicate[5][5][11] =
{
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0},
    },
    {
        {0, 1, 2, 3, 4, 5, 6, 3, 8, 9, 0},
        {0, 1, 2, 5, 6, 3, 4, 5, 8, 9, 0},
    },
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 2, 9, 0},
        {0, 1, 4, 5, 6, 7, 2, 3, 4, 9, 0},
        {0, 1, 6, 7, 2, 3, 4, 5, 6, 9, 0},
    },
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 8, 1, 0},
        {0, 3, 4, 5, 6, 7, 8, 1, 2, 3, 0},
        {0, 5, 6, 7, 8, 1, 2, 3, 4, 5, 0},
        {0, 7, 8, 1, 2, 3, 4, 5, 6, 7, 0},
    },
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0},
        {2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2},
        {4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4},
        {6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6},
        {8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8},
    },
};

static const u8 sDodrioHeadToColumnMap_Duplicate[5][5][3] =
{
    {
        {4, 5, 6},
    },
    {
        {3, 4, 5},
        {5, 6, 3},
    },
    {
        {4, 5, 6},
        {6, 7, 2},
        {2, 3, 4},
    },
    {
        {3, 4, 5},
        {5, 6, 7},
        {7, 8, 1},
        {1, 2, 3},
    },
    {
        {4, 5, 6},
        {6, 7, 8},
        {8, 9, 0},
        {0, 1, 2},
        {2, 3, 4},
    },
};

static const u8 sDodrioNeighborMap_Duplicate[5][5][3] =
{
    {
        {1, 0, 1},
    },
    {
        {1, 0, 1},
        {0, 1, 0},
    },
    {
        {2, 0, 1},
        {0, 1, 2},
        {1, 2, 0},
    },
    {
        {3, 0, 1},
        {0, 1, 2},
        {1, 2, 3},
        {2, 3, 0},
    },
    {
        {4, 0, 1},
        {0, 1, 2},
        {1, 2, 3},
        {2, 3, 4},
        {3, 4, 0},
    },
};

ALIGNED(4)
static const u8 sPlayerIdAtColumn_Duplicate[5][11] =
{
    {9, 9, 9, 9, 1, 1, 1, 9, 9, 9, 9},
    {9, 9, 9, 0, 0, 1, 1, 0, 9, 9, 9},
    {9, 9, 2, 2, 0, 0, 1, 1, 1, 9, 9},
    {9, 3, 3, 0, 0, 1, 1, 2, 2, 3, 9},
    {3, 3, 4, 4, 0, 0, 1, 1, 2, 2, 3},
};

static const u8 sUnsharedColumns_Duplicate[5][5] =
{
    {5},
    {4, 6},
    {3, 5, 7},
    {2, 4, 6, 8},
    {1, 3, 5, 6, 9},
};

static const u16 sDodrioBerryBgPal1[] = INCBIN_U16("graphics/link_games/dodrioberry_bg1.gbapal",
                                            "graphics/link_games/dodrioberry_bg2.gbapal");
static const u16 sDodrioBerryPkmnPal[] = INCBIN_U16("graphics/link_games/dodrioberry_pkmn.gbapal");
static const u16 sDodrioBerryShinyPal[] = INCBIN_U16("graphics/link_games/dodrioberry_shiny.gbapal");
static const u16 sDodrioBerryStatusPal[] = INCBIN_U16("graphics/link_games/dodrioberry_status.gbapal");
static const u16 sDodrioBerrySpritesPal[] = INCBIN_U16("graphics/link_games/dodrioberry_berrysprites.gbapal");
static const u32 sDodrioBerrySpritesGfx[] = INCBIN_U32("graphics/link_games/dodrioberry_berrysprites.4bpp.lz");
static const u16 sDodrioBerryPlatformPal[] = INCBIN_U16("graphics/link_games/dodrioberry_platform.gbapal");
static const u32 sDodrioBerryBgGfx1[] = INCBIN_U32("graphics/link_games/dodrioberry_bg1.4bpp.lz");
static const u32 sDodrioBerryBgGfx2[] = INCBIN_U32("graphics/link_games/dodrioberry_bg2.4bpp.lz");
static const u32 sDodrioBerryStatusGfx[] = INCBIN_U32("graphics/link_games/dodrioberry_status.4bpp.lz");
static const u32 sDodrioBerryPlatformGfx[] = INCBIN_U32("graphics/link_games/dodrioberry_platform.4bpp.lz");
static const u32 sDodrioBerryPkmnGfx[] = INCBIN_U32("graphics/link_games/dodrioberry_pkmn.4bpp.lz");
static const u32 sDodrioBerryBgTilemap1[] = INCBIN_U32("graphics/link_games/dodrioberry_bg1.bin.lz");
static const u32 sDodrioBerryBgTilemap2Right[] = INCBIN_U32("graphics/link_games/dodrioberry_bg2right.bin.lz");
static const u32 sDodrioBerryBgTilemap2Left[] = INCBIN_U32("graphics/link_games/dodrioberry_bg2left.bin.lz");

static const struct OamData sOamData_Dodrio =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x64),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x64),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0
};

static const struct OamData sOamData_16x16_Priority0 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0
};

static const struct OamData sOamData_Berry =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0
};

static const struct OamData sOamData_Cloud =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x32),
    .tileNum = 0,
    .priority = 3,
    .paletteNum = 0,
    .affineParam = 0
};

static const union AnimCmd sAnim_Dodrio_Normal[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sAnim_Dodrio_PickRight[] =
{
    ANIMCMD_FRAME(64, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sAnim_Dodrio_PickMiddle[] =
{
    ANIMCMD_FRAME(128, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sAnim_Dodrio_PickLeft[] =
{
    ANIMCMD_FRAME(192, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sAnim_Dodrio_Down[] =
{
    ANIMCMD_FRAME(256, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sAnims_Dodrio[] =
{
    sAnim_Dodrio_Normal,
    sAnim_Dodrio_PickRight,
    sAnim_Dodrio_PickMiddle,
    sAnim_Dodrio_PickLeft,
    sAnim_Dodrio_Down
};

static const union AnimCmd sAnims_StatusBar_Yellow[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sAnims_StatusBar_Gray[] =
{
    ANIMCMD_FRAME(4, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sAnims_StatusBar_Red[] =
{
    ANIMCMD_FRAME(8, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sAnims_StatusBar[] =
{
    sAnims_StatusBar_Yellow,
    sAnims_StatusBar_Gray,
    sAnims_StatusBar_Red
};

static const union AnimCmd sAnim_Berry_Blue[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sAnim_Berry_Green[] =
{
    ANIMCMD_FRAME(4, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sAnim_Berry_Gold[] =
{
    ANIMCMD_FRAME(8, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sAnim_Berry_BlueSquished[] =
{
    ANIMCMD_FRAME(12, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sAnim_Berry_GreenSquished[] =
{
    ANIMCMD_FRAME(16, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sAnim_Berry_GoldSquished[] =
{
    ANIMCMD_FRAME(20, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sAnim_Berry_Eaten[] =
{
    ANIMCMD_FRAME(24, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sAnim_Berry_Empty1[] =
{
    ANIMCMD_FRAME(28, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sAnim_Berry_Empty2[] =
{
    ANIMCMD_FRAME(32, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sAnims_Berry[] =
{
    sAnim_Berry_Blue,
    sAnim_Berry_Green,
    sAnim_Berry_Gold,
    sAnim_Berry_BlueSquished,
    sAnim_Berry_GreenSquished,
    sAnim_Berry_GoldSquished,
    sAnim_Berry_Eaten,
    sAnim_Berry_Empty1,
    sAnim_Berry_Empty2
};

static const union AnimCmd sAnim_Cloud[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sAnims_Cloud[] =
{
    sAnim_Cloud
};

// Code

void LoadDodrioGfx(void)
{
    void *ptr = AllocZeroed(0x3000);
    struct SpritePalette pal1 = {sDodrioBerryPkmnPal, 0};
    struct SpritePalette pal2 = {sDodrioBerryShinyPal, 1};

    LZ77UnCompWram(sDodrioBerryPkmnGfx, ptr);
    // This check should be one line up.
    if (ptr != NULL)
    {
        struct SpriteSheet sheet = {ptr, 0x3000, 0};
        LoadSpriteSheet(&sheet);
        Free(ptr);
    }
    LoadSpritePalette(&pal1);
    LoadSpritePalette(&pal2);
}

void CreateDodrioSprite(struct DodrioGame_MonInfo * arg0, u8 arg1, u8 id, u8 arg3)
{
    struct SpriteTemplate sprTemplate =
    {
        .tileTag = 0,
        .paletteTag = arg0->isShiny,
        .oam = &sOamData_Dodrio,
        .anims = sAnims_Dodrio,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_Dodrio,
    };

    sDodrioSpriteIds[id] = AllocZeroed(4);
    *sDodrioSpriteIds[id] = CreateSprite(&sprTemplate, GetDodrioXPos(arg1, arg3), 136, 3);
    SetDodrioInvisibility(TRUE, id);
}

static void SpriteCB_Dodrio(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        break;
    case 1:
        DoDodrioMissedAnim(sprite);
        break;
    case 2:
        DoDodrioIntroAnim(sprite);
        break;
    }
}

void StartDodrioMissedAnim(u8 unused)
{
    struct Sprite *sprite = &gSprites[*sDodrioSpriteIds[GetMultiplayerId()]];
    sprite->data[0] = 1;
    sprite->data[1] = 0;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
}

void StartDodrioIntroAnim(u8 unused)
{
    struct Sprite *sprite = &gSprites[*sDodrioSpriteIds[GetMultiplayerId()]];
    sprite->data[0] = 2;
    sprite->data[1] = 0;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
}

static u32 DoDodrioMissedAnim(struct Sprite *sprite)
{
    s8 var;
    u8 mod = (++sprite->data[1] / 2) % 4;

    if (sprite->data[1] >= 3)
    {
        switch (mod)
        {
        default:
            var = 1;
            break;
        case 1:
        case 2:
            var = -1;
            break;
        }

        sprite->x += var;
        if (++sprite->data[1] >= 40)
        {
            sprite->data[0] = 0;
            sprite->x = GetDodrioXPos(0, GetNumPlayers());
        }
    }

    return 0;
}

static u32 DoDodrioIntroAnim(struct Sprite *sprite)
{
    u8 mod = (++sprite->data[1] / 13) % 4;

    if (sprite->data[1] % 13 == 0 && mod != 0)
        PlaySE(SE_M_CHARM);
    if (sprite->data[1] >= 104)
    {
        sprite->data[0] = 0;
        mod = 0;
    }
    SetDodrioAnim(GetMultiplayerId(), mod);
    return 0;
}

void FreeDodrioSprites(u8 count)
{
    u8 i;
    for (i = 0; i < count; i++)
    {
        struct Sprite *sprite = &gSprites[*sDodrioSpriteIds[i]];
        if (sprite != NULL)
            DestroySpriteAndFreeResources(sprite);
        // Memory should be freed here but is not.
    }
}

static void SetDodrioInvisibility(bool8 invisible, u8 id)
{
    gSprites[*sDodrioSpriteIds[id]].invisible = invisible;
}

void SetAllDodrioInvisibility(bool8 invisible, u8 count)
{
    u8 i;
    for (i = 0; i < count; i++)
        SetDodrioInvisibility(invisible, i);
}

void SetDodrioAnim(u8 id, u8 frameNum)
{
    StartSpriteAnim(&gSprites[*sDodrioSpriteIds[id]], frameNum);
}

static void SpriteCB_Status(struct Sprite *sprite)
{

}

void InitStatusBarPos(void)
{
    u8 i;
    for (i = 0; i < 10; i++)
    {
        struct Sprite *sprite = &gSprites[sStatusBar->spriteIds[i]];
        sprite->x = (i * 16) + 48;
        sprite->y = -8 - (i * 8);
        sStatusBar->entered[i] = 0;
    }
}

void CreateStatusBarSprites(void)
{
    u8 i;
    void *ptr = AllocZeroed(0x180);
    struct SpritePalette spPal = {sDodrioBerryStatusPal, 2};

    LZ77UnCompWram(sDodrioBerryStatusGfx, ptr);
    // This check should be one line up.
    if (ptr != NULL)
    {
        struct SpriteSheet spSheet = {ptr, 0x180, 1};
        struct SpriteTemplate spTemplate =
        {
            .tileTag = 1,
            .paletteTag = 2,
            .oam = &sOamData_16x16_Priority0,
            .anims = sAnims_StatusBar,
            .images = NULL,
            .affineAnims = gDummySpriteAffineAnimTable,
            .callback = SpriteCB_Status,
        };

        sStatusBar = AllocZeroed(sizeof(*sStatusBar));
        LoadSpriteSheet(&spSheet);
        LoadSpritePalette(&spPal);
        for (i = 0; i < 10; i++)
            sStatusBar->spriteIds[i] = CreateSprite(&spTemplate, (i * 16) + 48, -8 - (i * 8), 0);
    }

    Free(ptr);
}

void FreeStatusBar(void)
{
    u8 i;
    for (i = 0; i < 10; i++)
    {
        struct Sprite *sprite = &gSprites[sStatusBar->spriteIds[i]];
        if (sprite != NULL)
            DestroySpriteAndFreeResources(sprite);
    }
    FREE_AND_SET_NULL(sStatusBar);
}

bool32 DoStatusBarIntro(void)
{
    u8 i;
    bool32 r3 = FALSE;
    for (i = 0; i < 10; i++)
    {
        struct Sprite *sprite = &gSprites[sStatusBar->spriteIds[i]];
        sStatusBar->yChange[i] = 2;
        if (sStatusBar->entered[i] != 0 && sprite->y == 8)
            continue;
        r3 = TRUE;
        if (sprite->y == 8)
        {
            if (sStatusBar->entered[i] != 0)
                continue;
            sStatusBar->entered[i] = 1;
            sStatusBar->yChange[i] = -16;
            PlaySE(SE_CLICK);
        }
        sprite->y += sStatusBar->yChange[i];
    }

    if (r3)
        return FALSE;
    else
        return TRUE;
}

void UpdateStatusBarAnim(u8 arg0)
{
    u8 i;

    if (arg0 > 10)
    {
        for (i = 0; i < 10; i++)
            StartSpriteAnim(&gSprites[sStatusBar->spriteIds[i]], 1);
    }
    else
    {
        for (i = 0; i < 10 - arg0; i++)
        {
            if (arg0 > 6)
            {
                sStatusBar->flashTimer += arg0 - 6;
                if (sStatusBar->flashTimer > 30)
                    sStatusBar->flashTimer = 0;
                else if (sStatusBar->flashTimer > 10)
                    StartSpriteAnim(&gSprites[sStatusBar->spriteIds[i]], 2);
                else
                    StartSpriteAnim(&gSprites[sStatusBar->spriteIds[i]], 0);
            }
            else
            {
                StartSpriteAnim(&gSprites[sStatusBar->spriteIds[i]], 0);
            }
        }
        for (; i < 10; i++)
            StartSpriteAnim(&gSprites[sStatusBar->spriteIds[i]], 1);
    }
}

void SetStatusBarInvisibility(bool8 invisible)
{
    u8 i;
    for (i = 0; i < 10; i++)
        gSprites[sStatusBar->spriteIds[i]].invisible = invisible;
}

// Unknown unused data, feel free to remove.
static const u8 sUnusedSounds[] = {
    SE_M_CHARM,
    SE_NOTE_C,
    SE_NOTE_D,
    SE_NOTE_E,
    SE_NOTE_F,
    SE_NOTE_G,
    SE_NOTE_A,
    SE_NOTE_B,
    SE_NOTE_C_HIGH,
    SE_CARD_OPEN
};

void LoadBerryGfx(void)
{
    void *ptr = AllocZeroed(0x480);
    struct SpritePalette sprPal = {sDodrioBerrySpritesPal, 3};

    LZ77UnCompWram(sDodrioBerrySpritesGfx, ptr);
    if (ptr != NULL) // This should be one line up
    {
        struct SpriteSheet sprSheet = {ptr, 0x480, 2};
        LoadSpriteSheet(&sprSheet);
    }

    LoadSpritePalette(&sprPal);
    Free(ptr);
}

static const s16 sBerryIconXCoords[] = {88, 128, 168, 208};

void CreateBerrySprites(void)
{
    u8 i;
    s16 x;

    struct SpriteTemplate sprTemplate1 =
    {
        .tileTag = 2,
        .paletteTag = 3,
        .oam = &sOamData_Berry,
        .anims = sAnims_Berry,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    };
    struct SpriteTemplate sprTemplate2 =
    {
        .tileTag = 2,
        .paletteTag = 3,
        .oam = &sOamData_16x16_Priority0,
        .anims = sAnims_Berry,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    };

    for (i = 0; i < 11; i++)
    {
        sBerrySpriteIds[i] = AllocZeroed(4);
        x = i * 16;
        *sBerrySpriteIds[i] = CreateSprite(&sprTemplate1, x + (i * 8), 8, 1);
        SetBerryInvisibility(i, TRUE);
    }
    for (i = 0; i < 4; i++)
    {
        sBerryIconSpriteIds[i] = AllocZeroed(4);
        if (i == 3)
            *sBerryIconSpriteIds[i] = CreateSprite(&sprTemplate2, sBerryIconXCoords[i], 57, 0);
        else
            *sBerryIconSpriteIds[i] = CreateSprite(&sprTemplate2, sBerryIconXCoords[i], 60, 0);
        StartSpriteAnim(&gSprites[*sBerryIconSpriteIds[i]], i);
    }

    SetBerryIconsInvisibility(TRUE);
}

void FreeBerrySprites(void)
{
    struct Sprite *sprite;
    u8 i;

    for (i = 0; i < 11; i++)
    {
        sprite = &gSprites[*sBerrySpriteIds[i]];
        if (sprite != NULL)
            DestroySprite(sprite);
        FREE_AND_SET_NULL(sBerrySpriteIds[i]);
    }
    for (i = 0; i < 4; i++)
    {
        sprite = &gSprites[*sBerryIconSpriteIds[i]];
        if (sprite != NULL)
            DestroySprite(sprite);
        FREE_AND_SET_NULL(sBerryIconSpriteIds[i]);
    }
}

void SetBerryInvisibility(u8 id, bool8 invisible)
{
    gSprites[*sBerrySpriteIds[id]].invisible = invisible;
}

static void SetBerryIconsInvisibility(bool8 invisible)
{
    u8 i;
    for (i = 0; i < 4; i++)
        gSprites[*sBerryIconSpriteIds[i]].invisible = invisible;
}

void SetBerryYPos(u8 id, u8 y)
{
    gSprites[*sBerrySpriteIds[id]].y = y * 8;
}

void SetBerryAnim(u16 id, u8 frameNum)
{
    StartSpriteAnim(&gSprites[*sBerrySpriteIds[id]], frameNum);
}

// Unused
static void UnusedSetSpritePos(u8 spriteId)
{
    gSprites[spriteId].x = 20 * spriteId + 50;
    gSprites[spriteId].y = 50;
}

// Gamefreak made a mistake there and goes out of bounds for the data array as it holds 8 elements
// in turn overwriting sprite's subpriority and subsprites fields.
#if defined(BUGFIX)
#define sKeepPosX data[1]
#else
#define sKeepPosX data[10]
#endif // BUGFIX

static void SpriteCB_Cloud(struct Sprite *sprite)
{
    u8 i;
    static const u8 array[] = {30, 20};

    if (sprite->sKeepPosX != TRUE)
    {
        for (i = 0; i < 2; i++)
        {
            if (++sCloudSpriteIds[i][1] > array[i])
            {
                sprite->x--;
                sCloudSpriteIds[i][1] = 0;
            }
        }
    }
}

static const s16 sCloudStartCoords[][2] = {{230, 55}, {30, 74}};

void CreateCloudSprites(void)
{
    u8 i;
    void *ptr = AllocZeroed(0x400);
    struct SpritePalette sprPal = {sDodrioBerryPlatformPal, 6};

    LZ77UnCompWram(sDodrioBerryPlatformGfx, ptr);
    if (ptr != NULL) // This should be one line up
    {
        struct SpriteSheet sprSheet = {ptr, 0x400, 5};
        struct SpriteTemplate sprTemplate =
        {
            .tileTag = 5,
            .paletteTag = 6,
            .oam = &sOamData_Cloud,
            .anims = sAnims_Cloud,
            .images = NULL,
            .affineAnims = gDummySpriteAffineAnimTable,
            .callback = SpriteCB_Cloud,
        };

        LoadSpriteSheet(&sprSheet);
        LoadSpritePalette(&sprPal);
        for (i = 0; i < 2; i++)
        {
            sCloudSpriteIds[i] = AllocZeroed(4);
            *sCloudSpriteIds[i] = CreateSprite(&sprTemplate, sCloudStartCoords[i][0], sCloudStartCoords[i][1], 4);
        }
    }

    Free(ptr);
}

void ResetCloudPos(void)
{
    u8 i;
    for (i = 0; i < 2; i++)
    {
        struct Sprite *sprite = &gSprites[*sCloudSpriteIds[i]];
        sprite->sKeepPosX = TRUE;
        sprite->x = sCloudStartCoords[i][0];
        sprite->y = sCloudStartCoords[i][1];
    }
}

void StartCloudMovement(void)
{
    u8 i;
    for (i = 0; i < 2; i++)
    {
        struct Sprite *sprite = &gSprites[*sCloudSpriteIds[i]];
        sprite->sKeepPosX = FALSE;
    }
}

void FreeCloudSprites(void)
{
    u8 i;
    for (i = 0; i < 2; i++)
    {
        struct Sprite *sprite = &gSprites[*sCloudSpriteIds[i]];
        if (sprite)
            DestroySprite(sprite);
        FREE_AND_SET_NULL(sCloudSpriteIds[i]);
    }
}

void SetCloudInvisibility(bool8 invisible)
{
    u8 i;
    for (i = 0; i < 2; i++)
        gSprites[*sCloudSpriteIds[i]].invisible = invisible;
}

#undef sKeepPosX

static s16 GetDodrioXPos(u8 arg0, u8 arg1)
{
    s16 x = 0;
    switch (arg1)
    {
    case 1:
        x = 15;
        break;
    case 2:
        switch (arg0)
        {
        case 0: x = 12; break;
        case 1: x = 18; break;
        }
        break;
    case 3:
        switch (arg0)
        {
        case 0: x = 15; break;
        case 1: x = 21; break;
        case 2: x =  9; break;
        }
        break;
    case 4:
        switch (arg0)
        {
        case 0: x = 12; break;
        case 1: x = 18; break;
        case 2: x = 24; break;
        case 3: x =  6; break;
        }
        break;
    case 5:
        switch (arg0)
        {
        case 0: x = 15; break;
        case 1: x = 21; break;
        case 2: x = 27; break;
        case 3: x =  3; break;
        case 4: x =  9; break;
        }
        break;
    }

    return x * 8;
}

void ResetBerryAndStatusBarSprites(void)
{
    u8 i;
    for (i = 0; i < 11; i++)
    {
        SetBerryInvisibility(i, TRUE);
        SetBerryYPos(i, 1);
    }
    SetStatusBarInvisibility(FALSE);
}

static void LoadWindowFrameGfx(u8 frameId)
{
    LoadBgTiles(0, GetWindowFrameTilesPal(frameId)->tiles, 0x120, 1);
    LoadPalette(GetWindowFrameTilesPal(frameId)->palette, 0xA0, 0x20);
}

static void LoadUserWindowFrameGfx(void)
{
    TextWindow_SetStdFrame0_WithPal(0, 0xA, 0xB0);
}

void ResetGfxState(void)
{
    sGfx->finished = FALSE;
    sGfx->state = 0;
    sGfx->loadState = 0;
    sGfx->cursorSelection = 0;
    sGfx->playAgainState = 0;
}

static void DrawYesNoMessageWindow(const struct WindowTemplate * winTempl)
{
    u8 pal = 0xA;

    FillBgTilemapBufferRect(0, 1, winTempl->tilemapLeft - 1,                winTempl->tilemapTop - 1,                   1, 1, pal);
    FillBgTilemapBufferRect(0, 2, winTempl->tilemapLeft,                    winTempl->tilemapTop - 1,                   winTempl->width, 1, pal);
    FillBgTilemapBufferRect(0, 3, winTempl->tilemapLeft + winTempl->width,  winTempl->tilemapTop - 1,                   1, 1, pal);
    FillBgTilemapBufferRect(0, 4, winTempl->tilemapLeft - 1,                winTempl->tilemapTop, 1,                    winTempl->height, pal);
    FillBgTilemapBufferRect(0, 6, winTempl->tilemapLeft + winTempl->width,  winTempl->tilemapTop, 1,                    winTempl->height, pal);
    FillBgTilemapBufferRect(0, 7, winTempl->tilemapLeft - 1,                winTempl->tilemapTop + winTempl->height,    1, 1, pal);
    FillBgTilemapBufferRect(0, 8, winTempl->tilemapLeft,                    winTempl->tilemapTop + winTempl->height,    winTempl->width, 1, pal);
    FillBgTilemapBufferRect(0, 9, winTempl->tilemapLeft + winTempl->width,  winTempl->tilemapTop + winTempl->height,    1, 1, pal);
}

static void DrawMessageWindow(const struct WindowTemplate * winTempl)
{
    u8 pal = 0xB;

    FillBgTilemapBufferRect(0, 10, winTempl->tilemapLeft - 1,                winTempl->tilemapTop - 1,                   1, 1, pal);
    FillBgTilemapBufferRect(0, 11, winTempl->tilemapLeft,                    winTempl->tilemapTop - 1,                   winTempl->width, 1, pal);
    FillBgTilemapBufferRect(0, 12, winTempl->tilemapLeft + winTempl->width,  winTempl->tilemapTop - 1,                   1, 1, pal);
    FillBgTilemapBufferRect(0, 13, winTempl->tilemapLeft - 1,                winTempl->tilemapTop, 1,                    winTempl->height, pal);
    FillBgTilemapBufferRect(0, 15, winTempl->tilemapLeft + winTempl->width,  winTempl->tilemapTop, 1,                    winTempl->height, pal);
    FillBgTilemapBufferRect(0, 16, winTempl->tilemapLeft - 1,                winTempl->tilemapTop + winTempl->height,    1, 1, pal);
    FillBgTilemapBufferRect(0, 17, winTempl->tilemapLeft,                    winTempl->tilemapTop + winTempl->height,    winTempl->width, 1, pal);
    FillBgTilemapBufferRect(0, 18, winTempl->tilemapLeft + winTempl->width,  winTempl->tilemapTop + winTempl->height,    1, 1, pal);
}

void InitGameGfx(struct DodrioGame_Gfx * ptr)
{
    sGfx = ptr;
    sGfx->finished = FALSE;
    sGfx->state = 0;
    sGfx->loadState = 0;
    sGfx->cursorSelection = 0;
    sGfx->playAgainState = 0;
    sGfx->taskId = CreateTask(Task_TryRunGfxFunc, 3);
    SetGfxFunc(LoadGfx);
}

static void FreeAllWindowBuffers_(void)
{
    FreeAllWindowBuffers();
}

struct WinCoords
{
    u8 left;
    u8 top;
};

static const u8 sTextColorTable[][3] =
{
    {
        TEXT_COLOR_WHITE,
        TEXT_COLOR_DARK_GRAY,
        TEXT_COLOR_LIGHT_GRAY
    }, {
        TEXT_COLOR_WHITE,
        TEXT_COLOR_RED,
        TEXT_COLOR_LIGHT_RED
    }, {
        TEXT_COLOR_WHITE,
        TEXT_COLOR_BLUE,
        TEXT_COLOR_LIGHT_BLUE
    }, {
        TEXT_COLOR_WHITE,
        TEXT_COLOR_GREEN,
        TEXT_COLOR_LIGHT_GREEN
    }
};

static const struct WinCoords sNameWindowCoords_1Player[] = {{12, 6}};
static const struct WinCoords sNameWindowCoords_2Players[] = {{9, 10}, {15, 6}};
static const struct WinCoords sNameWindowCoords_3Players[] = {{12, 6}, {18, 10}, {6, 10}};
static const struct WinCoords sNameWindowCoords_4Players[] = {{9, 10}, {15, 6}, {21, 10}, {3, 6}};
static const struct WinCoords sNameWindowCoords_5Players[] = {{12, 6}, {18, 10}, {23, 6}, {1, 6}, {6, 10}};

static const struct WinCoords * const sNameWindowCoords[] =
{
    sNameWindowCoords_1Player,
    sNameWindowCoords_2Players,
    sNameWindowCoords_3Players,
    sNameWindowCoords_4Players,
    sNameWindowCoords_5Players,
};

static const u8 *const sRankingTexts[] =
{
    gText_1Colon,
    gText_2Colon,
    gText_3Colon,
    gText_4Colon,
    gText_5Colon,
};

static const u16 sResultsXCoords[] = {92, 132, 172, 212};
static const u16 sResultsYCoords[] = {30, 45, 60, 75, 90};
static const u16 sRankingYCoords[] = {12, 28, 44, 60, 76};

struct
{
    u8 id;
    void (*func)(void);
} const sGfxFuncs[] =
{
    {0, LoadGfx},
    {1, ShowNames},
    {2, ShowResults},
    {3, Msg_WantToPlayAgain},
    {4, Msg_SavingDontTurnOff},
    {5, Msg_CommunicationStandby},
    {6, EraseMessage},
    {7, Msg_SomeoneDroppedOut},
    {8, StopGfxFuncs},
    {9, GfxIdle},
};

void SetGfxFuncById(u8 arg0)
{
    u8 i;
    for (i = 0; i < 10; i++)
    {
        if (sGfxFuncs[i].id == arg0)
            SetGfxFunc(sGfxFuncs[i].func);
    }
}

static void Task_TryRunGfxFunc(u8 taskId)
{
    if (!sGfx->finished)
        GetGfxFunc()();
}

static void LoadGfx(void)
{
    switch (sGfx->state)
    {
    case 0:
        InitBgs();
        sGfx->state++;
        break;
    case 1:
        if (LoadBgGfx() == TRUE)
            sGfx->state++;
        break;
    case 2:
        CopyToBgTilemapBuffer(3, sDodrioBerryBgTilemap1, 0, 0);
        CopyToBgTilemapBuffer(1, sDodrioBerryBgTilemap2Left, 0, 0);
        CopyToBgTilemapBuffer(2, sDodrioBerryBgTilemap2Right, 0, 0);
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(2);
        sGfx->state++;
        break;
    case 3:
        ShowBg(0);
        ShowBg(3);
        ShowBg(1);
        ShowBg(2);
        sGfx->state++;
        break;
    case 4:
        LoadWindowFrameGfx(gSaveBlock2Ptr->optionsWindowFrameType);
        LoadUserWindowFrameGfx();
        sGfx->state++;
        break;
    default:
        sGfx->finished = TRUE;
        break;
    }
}

static void ShowNames(void)
{
    u8 i, playersCount, id, colorsId, *name;
    u32 left;
    struct WindowTemplate window;
    const struct WinCoords * ptr;

    switch (sGfx->state)
    {
    case 0:
        playersCount = GetNumPlayers();
        ptr = sNameWindowCoords[playersCount - 1];
        window.bg = 0;
        window.width = 7;
        window.height = 2;
        window.paletteNum = 0xD;
        window.baseBlock = 0x13;
        for (i = 0; i < playersCount; ptr++, i++)
        {
            colorsId = 0;
            id = GetPlayerIdByPos(i);
            left = (56 - GetStringWidth(FONT_0, GetPlayerName(id), -1)) / 2u;
            window.tilemapLeft = ptr->left;
            window.tilemapTop = ptr->top;
            sGfx->windowIds[i] = AddWindow(&window);
            ClearWindowTilemap(sGfx->windowIds[i]);
            FillWindowPixelBuffer(sGfx->windowIds[i], PIXEL_FILL(1));
            if (id == GetMultiplayerId())
                colorsId = 2;
            name = GetPlayerName(id);
            AddTextPrinterParameterized3(sGfx->windowIds[i], FONT_0, left, 1, sTextColorTable[colorsId], -1, name);
            CopyWindowToVram(sGfx->windowIds[i], COPYWIN_GFX);
            window.baseBlock += 0xE;
            DrawMessageWindow(&window);
        }
        sGfx->state++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            playersCount = GetNumPlayers();
            for (i = 0; i < playersCount; i++)
                PutWindowTilemap(sGfx->windowIds[i]);
            CopyBgTilemapBufferToVram(0);
            sGfx->state++;
        }
        break;
    default:
        if (++sGfx->state > 180)
        {
            playersCount = GetNumPlayers();
            for (i = 0; i < playersCount; i++)
            {
                ClearWindowTilemap(sGfx->windowIds[i]);
                RemoveWindow(sGfx->windowIds[i]);
            }
            FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
            CopyBgTilemapBufferToVram(0);
            sGfx->finished = TRUE;
        }
        break;
    }
}

static void PrintRankedScores(u8 playersCount_)
{
    u8 i, r8 = 0, r6 = 0;
    u8 playersCount = playersCount_; // Pointless variable, I know, but it's needed to match.
    u8 *name;
    u32 x, numWidth;
    u8 numString[32];
    u8 array[5] = {0, 1, 2, 3, 4};
    struct DodrioGame_ScoreResults temp, structArray[5];

    for (i = 0; i < playersCount; i++)
    {
        array[i] = i;
        GetScoreResults(&temp, i);
        structArray[i] = temp;
    }

    if (GetHighestScore() != 0)
    {
        do
        {
            for (i = 0; i < playersCount; i++)
            {
                if (structArray[i].ranking == r8)
                {
                    array[r6] = i;
                    r6++;
                }
            }
            r8 = r6;
        } while (r6 < playersCount);
    }

    for (i = 0; i < playersCount; i++)
    {
        if (structArray[i].score == 0)
            structArray[i].ranking = playersCount - 1;
    }

    x = 216 - GetStringWidth(FONT_0, gText_SpacePoints, 0);
    for (i = 0; i < playersCount; i++)
    {
        u8 colorsId = 0;
        u8 id = array[i];
        u32 points = structArray[id].score;

        AddTextPrinterParameterized(sGfx->windowIds[1], FONT_0, sRankingTexts[structArray[id].ranking], 8, sRankingYCoords[i], -1, NULL);
        if (id == GetMultiplayerId())
            colorsId = 2;
        name = GetPlayerName(id);
        AddTextPrinterParameterized3(sGfx->windowIds[1], FONT_0, 28, sRankingYCoords[i], sTextColorTable[colorsId], -1, name);
        ConvertIntToDecimalStringN(numString, points, STR_CONV_MODE_RIGHT_ALIGN, 7);
        numWidth = GetStringWidth(FONT_0, numString, -1);
        AddTextPrinterParameterized(sGfx->windowIds[1], FONT_0, numString, x - 35, sRankingYCoords[i], -1, NULL);
        AddTextPrinterParameterized(sGfx->windowIds[1], FONT_0, gText_SpacePoints, x, sRankingYCoords[i], -1, NULL);
    }
}

static void ShowResults(void)
{
    u8 i, j, itemGiveRet, playersCount = GetNumPlayers();
    u8 *name;
    u32 strWidth, x;
    u8 sp0C[100];
    u8 sp70[20];

    switch (sGfx->state)
    {
    case 0:
        SetScoreResults();
        sGfx->timer = 0;
        sGfx->state++;
        break;
    case 1:
        sGfx->windowIds[0] = AddWindow(&sWindowTemplates_Results[0]);
        sGfx->windowIds[1] = AddWindow(&sWindowTemplates_Results[1]);
        ClearWindowTilemap(sGfx->windowIds[0]);
        ClearWindowTilemap(sGfx->windowIds[1]);
        DrawMessageWindow(&sWindowTemplates_Results[0]);
        DrawMessageWindow(&sWindowTemplates_Results[1]);
        sGfx->state++;
        break;
    case 2:
        FillWindowPixelBuffer(sGfx->windowIds[0], PIXEL_FILL(1));
        FillWindowPixelBuffer(sGfx->windowIds[1], PIXEL_FILL(1));
        strWidth = GetStringWidth(FONT_0, gText_BerryPickingResults, -1);
        x = (224 - strWidth) / 2;
        AddTextPrinterParameterized(sGfx->windowIds[0], FONT_0, gText_BerryPickingResults, x, 2, -1, NULL);
        AddTextPrinterParameterized(sGfx->windowIds[1], FONT_0, gText_10P30P50P50P, 68, 16, -1, NULL);
        for (i = 0; i < playersCount; i++)
        {
            u8 colorsId = 0;
            if (i == GetMultiplayerId())
                colorsId = 2;

            name = GetPlayerName(i);
            AddTextPrinterParameterized3(sGfx->windowIds[1], FONT_0, 2, sResultsYCoords[i], sTextColorTable[colorsId], -1, name);
            for (j = 0; j < 4; j++)
            {
                u32 width;
                u16 result1 = Min(GetBerryResult(i, j), 9999);
                u16 result2 = Min(GetHighestBerryResult(j), 9999);

                ConvertIntToDecimalStringN(sp0C, result1, STR_CONV_MODE_LEFT_ALIGN, 4);
                width = GetStringWidth(FONT_0, sp0C, -1);
                if (result2 == result1 && result2 != 0)
                    AddTextPrinterParameterized3(sGfx->windowIds[1], FONT_0, sResultsXCoords[j] - width, sResultsYCoords[i], sTextColorTable[1], -1, sp0C);
                else
                    AddTextPrinterParameterized(sGfx->windowIds[1], FONT_0, sp0C, sResultsXCoords[j] - width, sResultsYCoords[i], -1, NULL);
            }
        }
        CopyWindowToVram(sGfx->windowIds[0], COPYWIN_GFX);
        CopyWindowToVram(sGfx->windowIds[1], COPYWIN_GFX);
        sGfx->state++;
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PutWindowTilemap(sGfx->windowIds[0]);
            PutWindowTilemap(sGfx->windowIds[1]);
        }
        CopyBgTilemapBufferToVram(0);
        SetBerryIconsInvisibility(FALSE);
        sGfx->state++;
        break;
    case 4:
        if (++sGfx->timer >= 30 && JOY_NEW(A_BUTTON))
        {
            sGfx->timer = 0;
            PlaySE(SE_SELECT);
            SetBerryIconsInvisibility(TRUE);
            sGfx->state++;
        }
        break;
    case 5:
        FillWindowPixelBuffer(sGfx->windowIds[0], PIXEL_FILL(1));
        FillWindowPixelBuffer(sGfx->windowIds[1], PIXEL_FILL(1));
        strWidth = GetStringWidth(FONT_0, gText_AnnouncingRankings, -1);
        x = (224 - strWidth) / 2;
        AddTextPrinterParameterized(sGfx->windowIds[0], FONT_0, gText_AnnouncingRankings, x, 2, -1, NULL);
        sGfx->state++;
        break;
    case 6:
        PrintRankedScores(playersCount);
        CopyWindowToVram(sGfx->windowIds[0], COPYWIN_GFX);
        CopyWindowToVram(sGfx->windowIds[1], COPYWIN_GFX);
        sGfx->state++;
        break;
    case 7:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PutWindowTilemap(sGfx->windowIds[0]);
            PutWindowTilemap(sGfx->windowIds[1]);
        }
        CopyBgTilemapBufferToVram(0);
        sGfx->state++;
        break;
    case 8:
        if (++sGfx->timer >= 30 && JOY_NEW(A_BUTTON))
        {
            sGfx->timer = 0;
            PlaySE(SE_SELECT);
            if (GetHighestScore() < 3000)
            {
                sGfx->state = 127;
            }
            else
            {
                StopMapMusic();
                sGfx->state++;
            }

            FillBgTilemapBufferRect_Palette0(0, 0, 0, 5, 30, 15);
            RemoveWindow(sGfx->windowIds[1]);
            sGfx->windowIds[1] = AddWindow(&sWindowTemplate_Prize);
            ClearWindowTilemap(sGfx->windowIds[1]);
            DrawMessageWindow(&sWindowTemplate_Prize);
        }
        break;
    case 9:
        PlayNewMapMusic(MUS_LEVEL_UP);
        FillWindowPixelBuffer(sGfx->windowIds[0], PIXEL_FILL(1));
        FillWindowPixelBuffer(sGfx->windowIds[1], PIXEL_FILL(1));
        strWidth = GetStringWidth(FONT_0, gText_AnnouncingPrizes, -1);
        x = (224 - strWidth) / 2;
        AddTextPrinterParameterized(sGfx->windowIds[0], FONT_0, gText_AnnouncingPrizes, x, 2, -1, NULL);
        DynamicPlaceholderTextUtil_Reset();
        CopyItemName(GetPrizeItemId(), sp70);
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, sp70);
        DynamicPlaceholderTextUtil_ExpandPlaceholders(sp0C, gText_FirstPlacePrize);
        AddTextPrinterParameterized(sGfx->windowIds[1], FONT_0, sp0C, 8, 2, -1, NULL);
        itemGiveRet = TryGivePrize();
        if (itemGiveRet != 0 && itemGiveRet != 3)
        {
            DynamicPlaceholderTextUtil_Reset();
            CopyItemName(GetPrizeItemId(), sp70);
            DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, sp70);
            if (itemGiveRet == 2)
                DynamicPlaceholderTextUtil_ExpandPlaceholders(sp0C, gText_CantHoldAnyMore);
            else if (itemGiveRet == 1)
                DynamicPlaceholderTextUtil_ExpandPlaceholders(sp0C, gText_FilledStorageSpace);
            AddTextPrinterParameterized(sGfx->windowIds[1], FONT_0, sp0C, 8, 40, -1, NULL);
        }
        CopyWindowToVram(sGfx->windowIds[0], COPYWIN_GFX);
        CopyWindowToVram(sGfx->windowIds[1], COPYWIN_GFX);
        sGfx->state++;
        break;
    case 10:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PutWindowTilemap(sGfx->windowIds[0]);
            PutWindowTilemap(sGfx->windowIds[1]);
        }
        CopyBgTilemapBufferToVram(0);
        FadeOutAndFadeInNewMapMusic(MUS_VICTORY_WILD, 20, 10);
        sGfx->state++;
        break;
    case 11:
        if (++sGfx->timer >= 30 && JOY_NEW(A_BUTTON))
        {
            sGfx->timer = 0;
            PlaySE(SE_SELECT);
            sGfx->state++;
        }
        break;
    default:
        ClearWindowTilemap(sGfx->windowIds[0]);
        ClearWindowTilemap(sGfx->windowIds[1]);
        RemoveWindow(sGfx->windowIds[0]);
        RemoveWindow(sGfx->windowIds[1]);
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
        CopyBgTilemapBufferToVram(0);
        sGfx->finished = TRUE;
        break;
    }
}

static void Msg_WantToPlayAgain(void)
{
    u8 y;

    switch (sGfx->state)
    {
    case 0:
        sGfx->windowIds[0] = AddWindow(&sWindowTemplates_PlayAgain[0]);
        sGfx->windowIds[1] = AddWindow(&sWindowTemplates_PlayAgain[1]);
        ClearWindowTilemap(sGfx->windowIds[0]);
        ClearWindowTilemap(sGfx->windowIds[1]);
        DrawMessageWindow(&sWindowTemplates_PlayAgain[0]);
        DrawYesNoMessageWindow(&sWindowTemplates_PlayAgain[1]);
        sGfx->state++;
        sGfx->cursorSelection = 0;
        sGfx->playAgainState = 0;
        break;
    case 1:
        FillWindowPixelBuffer(sGfx->windowIds[0], PIXEL_FILL(1));
        FillWindowPixelBuffer(sGfx->windowIds[1], PIXEL_FILL(1));
        AddTextPrinterParameterized(sGfx->windowIds[0], FONT_2, gText_WantToPlayAgain, 0, 6, -1, NULL);
        AddTextPrinterParameterized(sGfx->windowIds[1], FONT_2, gText_Yes, 8, 2, -1, NULL);
        AddTextPrinterParameterized(sGfx->windowIds[1], FONT_2, gText_No, 8, 16, -1, NULL);
        AddTextPrinterParameterized(sGfx->windowIds[1], FONT_2, gText_SelectorArrow2, 0, 2, -1, NULL);
        CopyWindowToVram(sGfx->windowIds[0], COPYWIN_GFX);
        CopyWindowToVram(sGfx->windowIds[1], COPYWIN_GFX);
        sGfx->state++;
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PutWindowTilemap(sGfx->windowIds[0]);
            PutWindowTilemap(sGfx->windowIds[1]);
        }
        CopyBgTilemapBufferToVram(0);
        sGfx->state++;
        break;
    case 3:
        y = sGfx->cursorSelection;
        if (y == 0)
            y = 1;
        FillWindowPixelBuffer(sGfx->windowIds[1], PIXEL_FILL(1));
        AddTextPrinterParameterized(sGfx->windowIds[1], FONT_2, gText_Yes, 8, 2, -1, NULL);
        AddTextPrinterParameterized(sGfx->windowIds[1], FONT_2, gText_No, 8, 16, -1, NULL);
        AddTextPrinterParameterized(sGfx->windowIds[1], FONT_2, gText_SelectorArrow2, 0, y == 1 ? 2 : 16, -1, NULL);
        CopyWindowToVram(sGfx->windowIds[1], COPYWIN_FULL);
        // Increment state only if A or B button have been pressed.
        if (JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            if (sGfx->cursorSelection == 0)
                sGfx->cursorSelection = 1;
            sGfx->state++;
        }
        else if (JOY_NEW(DPAD_UP | DPAD_DOWN))
        {
            PlaySE(SE_SELECT);
            switch (sGfx->cursorSelection)
            {
            case 0:
                sGfx->cursorSelection = 2;
                break;
            case 1:
                sGfx->cursorSelection = 2;
                break;
            case 2:
                sGfx->cursorSelection = 1;
                break;
            }
        }
        else if (JOY_NEW(B_BUTTON))
        {
            PlaySE(SE_SELECT);
            sGfx->cursorSelection = 2;
            sGfx->state++;
        }
        break;
    default:
        sGfx->playAgainState = sGfx->cursorSelection;
        ClearWindowTilemap(sGfx->windowIds[0]);
        ClearWindowTilemap(sGfx->windowIds[1]);
        RemoveWindow(sGfx->windowIds[0]);
        RemoveWindow(sGfx->windowIds[1]);
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
        CopyBgTilemapBufferToVram(0);
        sGfx->finished = TRUE;
        break;
    }
}

static void Msg_SavingDontTurnOff(void)
{
    switch (sGfx->state)
    {
    case 0:
        DrawDialogueFrame(0, FALSE);
        AddTextPrinterParameterized2(0, FONT_2, gText_SavingDontTurnOffThePower2, 0, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
        sGfx->state++;
        break;
    case 1:
        CopyWindowToVram(0, COPYWIN_FULL);
        sGfx->state++;
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            CreateTask(Task_LinkFullSave, 0);
            sGfx->state++;
        }
        break;
    case 3:
        if (!FuncIsActiveTask(Task_LinkFullSave))
            sGfx->state++;
        break;
    default:
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
        CopyBgTilemapBufferToVram(0);
        sGfx->finished = TRUE;
        break;
    }
}

static void Msg_CommunicationStandby(void)
{
    switch (sGfx->state)
    {
    case 0:
        sGfx->windowIds[0] = AddWindow(&sWindowTemplate_CommStandby);
        ClearWindowTilemap(sGfx->windowIds[0]);
        DrawMessageWindow(&sWindowTemplate_CommStandby);
        sGfx->state++;
        break;
    case 1:
        FillWindowPixelBuffer(sGfx->windowIds[0], PIXEL_FILL(1));
        AddTextPrinterParameterized(sGfx->windowIds[0], FONT_2, gText_CommunicationStandby3, 0, 6, -1, NULL);
        CopyWindowToVram(sGfx->windowIds[0], COPYWIN_GFX);
        sGfx->state++;
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
            PutWindowTilemap(sGfx->windowIds[0]);
        CopyBgTilemapBufferToVram(0);
        sGfx->state++;
        break;
    default:
        sGfx->finished = TRUE;
        break;
    }
}

static void EraseMessage(void)
{
    ClearWindowTilemap(sGfx->windowIds[0]);
    RemoveWindow(sGfx->windowIds[0]);
    FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
    CopyBgTilemapBufferToVram(0);
    sGfx->finished = TRUE;
}

static void Msg_SomeoneDroppedOut(void)
{
    switch (sGfx->state)
    {
    case 0:
        sGfx->windowIds[0] = AddWindow(&sWindowTemplate_DroppedOut);
        ClearWindowTilemap(sGfx->windowIds[0]);
        DrawMessageWindow(&sWindowTemplate_DroppedOut);
        sGfx->state++;
        sGfx->timer = 0;
        sGfx->cursorSelection = 0;
        sGfx->playAgainState = 0;
        break;
    case 1:
        FillWindowPixelBuffer(sGfx->windowIds[0], PIXEL_FILL(1));
        AddTextPrinterParameterized(sGfx->windowIds[0], FONT_2, gText_SomeoneDroppedOut, 0, 6, TEXT_SKIP_DRAW, NULL);
        CopyWindowToVram(sGfx->windowIds[0], COPYWIN_GFX);
        sGfx->state++;
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
            PutWindowTilemap(sGfx->windowIds[0]);
        CopyBgTilemapBufferToVram(0);
        sGfx->state++;
        break;
    case 3:
        if (++sGfx->timer >= 120)
            sGfx->state++;
        break;
    default:
        sGfx->playAgainState = 5;
        ClearWindowTilemap(sGfx->windowIds[0]);
        RemoveWindow(sGfx->windowIds[0]);
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
        CopyBgTilemapBufferToVram(0);
        sGfx->finished = TRUE;
        break;
    }
}

static void StopGfxFuncs(void)
{
    DestroyTask(sGfx->taskId);
    sGfx->finished = TRUE;
}

static void GfxIdle(void)
{

}

static void SetGfxFunc(void (*func)(void))
{
    sGfx->state = 0;
    sGfx->finished = FALSE;
    sGfx->func = func;
}

void (*GetGfxFunc(void))(void)
{
    return sGfx->func;
}

bool32 IsGfxFuncActive(void)
{
    if (sGfx->finished == TRUE)
        return FALSE;
    else
        return TRUE;
}

u8 GetPlayAgainState(void)
{
    return sGfx->playAgainState;
}

static void InitBgs(void)
{
    DmaClearLarge16(3, (void *)VRAM, VRAM_SIZE, 0x1000);
    DmaClear32(3,(void *)OAM, OAM_SIZE);
    DmaClear16(3, (void *)PLTT, PLTT_SIZE);
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, sBgTemplates, NELEMS(sBgTemplates));
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
    InitStandardTextBoxWindows();
    InitTextBoxGfxAndPrinters();
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_ON | DISPCNT_OBJ_1D_MAP);
    SetBgTilemapBuffer(3, sGfx->tilemapBuffers[0]);
    SetBgTilemapBuffer(1, sGfx->tilemapBuffers[1]);
    SetBgTilemapBuffer(2, sGfx->tilemapBuffers[2]);
}

static bool32 LoadBgGfx(void)
{
    switch (sGfx->loadState)
    {
    case 0:
        LoadPalette(sDodrioBerryBgPal1, 0, sizeof(sDodrioBerryBgPal1));
        break;
    case 1:
        ResetTempTileDataBuffers();
        break;
    case 2:
        DecompressAndCopyTileDataToVram(3, sDodrioBerryBgGfx1, 0, 0, 0);
        break;
    case 3:
        DecompressAndCopyTileDataToVram(1, sDodrioBerryBgGfx2, 0, 0, 0);
        break;
    case 4:
        if (FreeTempTileDataBuffersIfPossible() == TRUE)
            return FALSE;
        break;
    case 5:
        LoadPalette(stdpal_get(3), 0xD0, 0x20);
        break;
    default:
        sGfx->loadState = 0;
        return TRUE;
    }

    sGfx->loadState++;
    return FALSE;
}
