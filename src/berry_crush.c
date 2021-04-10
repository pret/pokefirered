#include "global.h"
#include "gflib.h"
#include "battle_anim.h"
#include "berry.h"
#include "berry_crush.h"
#include "berry_pouch.h"
#include "berry_powder.h"
#include "decompress.h"
#include "digit_obj_util.h"
#include "dynamic_placeholder_text_util.h"
#include "graphics.h"
#include "item.h"
#include "item_menu.h"
#include "item_menu_icons.h"
#include "link.h"
#include "link_rfu.h"
#include "math_util.h"
#include "menu.h"
#include "minigame_countdown.h"
#include "new_menu_helpers.h"
#include "overworld.h"
#include "random.h"
#include "save.h"
#include "scanline_effect.h"
#include "script.h"
#include "strings.h"
#include "task.h"
#include "text_window.h"
#include "trig.h"
#include "constants/songs.h"
#include "constants/items.h"

#define TAG_COUNTDOWN 0x1000

enum {
    BCTEXT_AREYOUREADY,
    BCTEXT_WAITFOROTHERS,
    BCTEXT_GAINEDPOWDER,
    BCTEXT_RECORDINGRESULTS,
    BCTEXT_ASKPLAYAGAIN,
    BCTEXT_CANCEL_NOBERRIES,
    BCTEXT_CANCEL_DROPPEDOUT,
    BCTEXT_TIMEUP,
    BCTEXT_COMMSTANDBY,
};

enum {
    BCCMD_BeginNormalPaletteFade = 1,
    BCCMD_WaitPaletteFade,
    BCCMD_PrintMessage,
    BCCMD_InitGfx,
    BCCMD_TeardownGfx,
    BCCMD_SignalReadyToBegin,
    BCCMD_AskPickBerry,
    BCCMD_GoToBerryPouch,
    BCCMD_WaitForOthersToPickBerries,
    BCCMD_DropBerriesIntoCrusher,
    BCCMD_DropLid,
    BCCMD_Countdown,
    BCCMD_PlayGame_Master,
    BCCMD_PlayGame_Slave,
    BCCMD_FinishGame,
    BCCMD_HandleTimeUp,
    BCCMD_TabulateResults,
    BCCMD_ShowResults,
    BCCMD_SaveTheGame,
    BCCMD_AskPlayAgain,
    BCCMD_CommunicatePlayAgainResponses,
    BCCMD_FadeOutToPlayAgain,
    BCCMD_PlayAgainFailureMessage,
    BCCMD_GracefulExit,
    BCCMD_Quit,
};

struct BerryCrushGame_Player
{
    u8 unk0[PLAYER_NAME_LENGTH + 1 + 4];
    u16 unkC;
    u16 unkE;
    u16 unk10;
    u16 unk12;
    u16 unk14;
    u16 unk16;
    u16 unk18;
    u16 unk1A;
    u8 unk1B;
    u8 unk1C;
};

struct BerryCrushGame_4E
{
    u16 unk0;
    u16 unk2;
    u8 unk4_0:1;
    u8 unk4_1:1;
    u8 unk4_2:1;
    u8 unk4_3:5;
    s8 unk5;
    u16 unk6;
    u16 unk8;
    u16 unkA;
    u16 unkC;
};

struct BerryCrushGame_40
{
    s16 unk0;
    s16 unk2;
    s16 unk4;
    s16 unk6;
    s16 unk8;
    s16 unkA;
    s16 unkC;
    s16 unkE;
};

struct BerryCrushGame_5C
{
    u16 unk00;
    u8 unk02_0:1;
    u8 unk02_1:1;
    u8 pushedAButton:1;
    u8 unk02_3:5;
    s8 unk03;
    u16 unk04;
    u16 unk06;
    u16 unk08;
    u16 unk0A;
};

struct BerryCrushGame_68
{
    u32 unk00;
    u16 unk04;
    u16 unk06;
    u16 unk08;
    u16 unk0A;
    // 0: Number of A presses
    // 1: Neatness
    u16 stats[2][5];
    u8 unk20[2][8];
};

struct BerryCrushPlayerSeatCoords
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    s16 unk4;
    s16 unk6;
    s16 unk8;
    s16 unkA;
};

struct BerryCrushGame_138
{
    u8 animBerryIdx;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    s16 minutes;
    s16 secondsInt;
    s16 secondsFrac;
    const struct BerryCrushPlayerSeatCoords *seatCoords[5];
    struct Sprite *coreSprite;
    struct Sprite *impactSprites[5];
    struct Sprite *berrySprites[5];
    struct Sprite *sparkleSprites[11];
    struct Sprite *timerSprites[2];
    u8 unk80;
    u8 filler81;
    u8 unk82;
    u8 unk83[5];
    u16 bgBuffers[4][0x800];
};

struct BerryCrushGame
{
    MainCallback savedCallback;
    u32 (*cmdCallback)(struct BerryCrushGame *, u8 *);
    u8 localId;
    u8 playerCount;
    u8 mainTask;
    u8 textSpeed;
    u8 cmdState;
    u8 unkD;
    u8 nextCmd;
    u8 afterPalFadeCmd;
    u16 unk10;
    u16 gameState;
    u16 unk14;
    u16 pressingSpeed;
    s16 unk18;
    s16 unk1A;
    s32 powder;
    s32 unk20;
    u8 unk24;
    u8 unk25_0:1;
    u8 unk25_1:1;
    u8 unk25_2:1;
    u8 unk25_3:1;
    u8 unk25_4:1;
    u8 unk25_5:3;
    u16 unk26;
    u16 timer;
    s16 depth;
    s16 vibration;
    s16 unk2E;
    s16 unk30;
    s16 unk32;
    s16 unk34;
    u8 commandParams[0xC];
    u16 sendCmd[6];
    u16 recvCmd[7];
    struct BerryCrushGame_5C localState;
    struct BerryCrushGame_68 unk68;
    struct BerryCrushGame_Player unk98[5];
    struct BerryCrushGame_138 spritesManager;
};

static EWRAM_DATA struct BerryCrushGame *sBerryCrushGamePtr = NULL;

static void BerryCrush_InitPlayerNamesAndTextSpeed(struct BerryCrushGame *game);
static void CB2_ReturnToBerryCrushGameFromBerryPouch(void);
static void VBlankCB_BerryCrush(void);
static void CB2_BerryCrush(void);
static void Task_RunBerryCrushGame(u8 taskId);
static u32 BerryCrushCommand_BeginNormalPaletteFade(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_WaitPaletteFade(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_PrintMessage(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_InitGfx(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_TeardownGfx(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_SignalReadyToBegin(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_AskPickBerry(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_GoToBerryPouch(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_WaitForOthersToPickBerries(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_DropBerriesIntoCrusher(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_DropLid(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_Countdown(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_PlayGame_Master(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_PlayGame_Slave(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_FinishGame(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_HandleTimeUp(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_TabulateResults(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_ShowResults(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_SaveTheGame(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_AskPlayAgain(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_CommunicatePlayAgainResponses(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_FadeOutToPlayAgain(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_PlayAgainFailureMessage(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_GracefulExit(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_Quit(struct BerryCrushGame * game, u8 *params);
static void sub_814D4D8(struct BerryCrushGame * game);
static void BerryCrush_SetShowMessageParams(u8 *params, u8 stringId, u8 flags, u16 waitKeys, u8 followupCmd);
static void FramesToMinSec(struct BerryCrushGame_138 * arg0, u16 arg1);
static void PrintTextCentered(u8 windowId, u8 left, u8 colorId, const u8 *string);
static void PrintBerryCrushResultWindow(struct BerryCrushGame * sp0C, u8 sp10, u8 sp14, u8 r3);
static void sub_814E32C(struct BerryCrushGame * r8);
static void Task_ShowBerryCrushRankings(u8 r4);
static void BerryCrush_PrintTimeOnSprites(struct BerryCrushGame_138 * r4, u16 r1);
static void sub_814EB38(struct BerryCrushGame * r5);
static void sub_814EBB0(struct BerryCrushGame * r6);
static void sub_814EC80(struct BerryCrushGame * r6);
static void sub_814ECE0(struct BerryCrushGame * r6);
static void sub_814EF10(struct BerryCrushGame * r5);
static void SpriteCB_BerryCrushImpact(struct Sprite * sprite);
static void sub_814EFFC(struct Sprite * sprite);
static void sub_814F044(struct Sprite * sprite);
static void sub_814F0D8(struct Sprite * sprite);
struct BerryCrushGame *GetBerryCrushGame(void);
void StartBerryCrush(MainCallback callback);
u32 ExitBerryCrushWithCallback(MainCallback callback);
void CB2_BerryCrush_GoToBerryPouch(void);
void BerryCrush_SetVBlankCallback(void);
void BerryCrush_UnsetVBlankCallback(void);
void BerryCrush_UpdateSav2Records(void);
void BerryCrush_RunOrScheduleCommand(u16 command, u8 runMode, u8 *params);
void BerryCrush_SetPaletteFadeParams(u8 *params, bool8 communicateAfter, u32 selectedPals, s8 delay, u8 startY, u8 targetY, u16 palette);
int sub_814D9CC(struct BerryCrushGame *arg0);
int BerryCrush_InitBgs(void);
int BerryCrush_TeardownBgs(void);
void BerryCrush_CreateBerrySprites(struct BerryCrushGame *arg0, struct BerryCrushGame_138 *arg1);
void BerryCrushFreeBerrySpriteGfx(struct BerryCrushGame *arg0, struct BerryCrushGame_138 *arg1);
void sub_814DC5C(struct BerryCrushGame *arg0, struct BerryCrushGame_138 *arg1);
bool32 sub_814DE50(struct BerryCrushGame *arg0, struct BerryCrushGame_138 *arg1);
bool32 sub_814E644(struct BerryCrushGame *arg0, struct BerryCrushGame_138 *arg1);
void sub_814E80C(struct BerryCrushGame *arg0);
void sub_814DA04(struct BerryCrushGame *arg0);
void BerryCrush_HideTimerSprites(struct BerryCrushGame_138 *arg0);
void SpriteCB_DropBerryIntoCrusher(struct Sprite * sprite);
void ShowBerryCrushRankings(void);

static const u8 gUnknown_846E2E0[] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};
static const u8 gUnknown_846E2E8[] = {0x00, 0x01, 0x02, 0x03, 0x05, 0x00, 0x00, 0x00};

static const s8 gUnknown_846E2F0[][7] = {
    {0x04, 0x01, 0x00, 0xff, 0x00, 0x00, 0x00},
    {0x04, 0x02, 0x00, 0xff, 0x00, 0x00, 0x00},
    {0x04, 0x02, 0x00, 0xfe, 0x00, 0x00, 0x00},
    {0x06, 0x03, 0x01, 0xff, 0xfd, 0xff, 0x00},
    {0x06, 0x04, 0x01, 0xfe, 0xfc, 0xfe, 0x00},
};

ALIGNED(4) const u8 gUnknown_846E314[][4] = {
    {0x03, 0x02, 0x01, 0x00},
    {0x03, 0x03, 0x01, 0x00},
    {0x03, 0x03, 0x02, 0x00},
    {0x03, 0x04, 0x02, 0x00},
    {0x03, 0x05, 0x03, 0x00}
};

static const u8 *const sBerryCrushMessages[] = {
    gText_BerryCrush_AreYouReady,
    gText_BerryCrush_WaitForOthersToChooseBerry,
    gText_BerryCrush_GainedXUnitsOfPowder,
    gText_BerryCrush_RecordingGameResults,
    gText_BerryCrush_WantToPlayAgain,
    gText_BerryCrush_NoBerries,
    gText_BerryCrush_MemberDroppedOut,
    gText_BerryCrush_TimeUp,
    gText_BerryCrush_CommunicationStandby
};

static u32 (*const sBerryCrushCommands[])(struct BerryCrushGame * berryCrushGame, u8 *params) = {
    NULL,
    BerryCrushCommand_BeginNormalPaletteFade,
    BerryCrushCommand_WaitPaletteFade,
    BerryCrushCommand_PrintMessage,
    BerryCrushCommand_InitGfx,
    BerryCrushCommand_TeardownGfx,
    BerryCrushCommand_SignalReadyToBegin,
    BerryCrushCommand_AskPickBerry,
    BerryCrushCommand_GoToBerryPouch,
    BerryCrushCommand_WaitForOthersToPickBerries,
    BerryCrushCommand_DropBerriesIntoCrusher,
    BerryCrushCommand_DropLid,
    BerryCrushCommand_Countdown,
    BerryCrushCommand_PlayGame_Master,
    BerryCrushCommand_PlayGame_Slave,
    BerryCrushCommand_FinishGame,
    BerryCrushCommand_HandleTimeUp,
    BerryCrushCommand_TabulateResults,
    BerryCrushCommand_ShowResults,
    BerryCrushCommand_SaveTheGame,
    BerryCrushCommand_AskPlayAgain,
    BerryCrushCommand_CommunicatePlayAgainResponses,
    BerryCrushCommand_FadeOutToPlayAgain,
    BerryCrushCommand_PlayAgainFailureMessage,
    BerryCrushCommand_GracefulExit,
    BerryCrushCommand_Quit
};

static const u8 gUnknown_846E3B4[][4] = {
    {0x02, 0x04, 0x06, 0x07},
    {0x03, 0x05, 0x08, 0x0b},
    {0x03, 0x07, 0x0b, 0x0f},
    {0x04, 0x08, 0x0c, 0x11}
};

static const u8 gUnknown_846E3C4[] = {5, 7, 9, 12};

static const u8 sReceivedPlayerBitmasks[] = {0x03, 0x07, 0x0F, 0x1F};

static const struct BgTemplate sBgTemplates[] = {
    {
        .bg = 0,
        .charBaseIndex = 2,
        .mapBaseIndex = 15,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x0000
    }, {
        .bg = 1,
        .charBaseIndex = 0,
        .mapBaseIndex = 13,
        .screenSize = 2,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x0000
    }, {
        .bg = 2,
        .charBaseIndex = 0,
        .mapBaseIndex = 12,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x0000
    }, {
        .bg = 3,
        .charBaseIndex = 0,
        .mapBaseIndex = 11,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x0000
    }
};

static const u8 sBerryCrushTextColorTable[][3] = {
    {
        TEXT_COLOR_WHITE,
        TEXT_COLOR_DARK_GRAY,
        TEXT_COLOR_LIGHT_GRAY
    }, {
        TEXT_COLOR_TRANSPARENT,
        TEXT_COLOR_WHITE,
        TEXT_COLOR_DARK_GRAY
    }, {
        TEXT_COLOR_TRANSPARENT,
        TEXT_COLOR_LIGHT_GRAY,
        TEXT_COLOR_RED
    }, {
        TEXT_COLOR_WHITE,
        TEXT_COLOR_BLUE,
        TEXT_COLOR_LIGHT_BLUE
    }, {
        TEXT_COLOR_WHITE,
        TEXT_COLOR_GREEN,
        TEXT_COLOR_LIGHT_GREEN
    }, {
        TEXT_COLOR_WHITE,
        TEXT_COLOR_RED,
        TEXT_COLOR_LIGHT_RED
    }
};

static const struct WindowTemplate sWindowTemplate_BerryCrushRankings = {
    .bg = 0,
    .tilemapLeft = 3,
    .tilemapTop = 4,
    .width = 24,
    .height = 13,
    .paletteNum = 0xF,
    .baseBlock = 0x001
};

static const struct WindowTemplate gUnknown_846E3F8[] = {
    {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 0,
        .width = 9,
        .height = 2,
        .paletteNum = 0x8,
        .baseBlock = 0x3ed
    }, {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 3,
        .width = 9,
        .height = 2,
        .paletteNum = 0x8,
        .baseBlock = 0x3db
    }, {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 6,
        .width = 9,
        .height = 2,
        .paletteNum = 0x8,
        .baseBlock = 0x3c9
    }, {
        .bg = 0,
        .tilemapLeft = 21,
        .tilemapTop = 3,
        .width = 9,
        .height = 2,
        .paletteNum = 0x8,
        .baseBlock = 0x3b7
    }, {
        .bg = 0,
        .tilemapLeft = 21,
        .tilemapTop = 6,
        .width = 9,
        .height = 2,
        .paletteNum = 0x8,
        .baseBlock = 0x3a5
    }, DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate gUnknown_846E428[] = {
    {
        .bg = 0,
        .tilemapLeft = 4,
        .tilemapTop = 2,
        .width = 22,
        .height = 16,
        .paletteNum = 0xF,
	    .baseBlock = 0x001
    }, {
        .bg = 0,
        .tilemapLeft = 4,
        .tilemapTop = 2,
        .width = 22,
        .height = 16,
        .paletteNum = 0xF,
	    .baseBlock = 0x001
    }, {
        .bg = 0,
        .tilemapLeft = 3,
        .tilemapTop = 2,
        .width = 24,
        .height = 16,
        .paletteNum = 0xF,
	    .baseBlock = 0x001
    }, DUMMY_WIN_TEMPLATE
};

static const u8 gUnknown_846E448[][4] = {
    {  6,  8,  9, 11 },
    { 12, 14, 15, 16}
};

static const u32 sPressingSpeedConversionTable[] = {
    // Decimal point is vertically aligned with the pixel
    // directly between the >< below.
    50000000, // 50
    25000000, // 25
    12500000, // 12.5
     6250000, //  6.25
     3125000, //  3.125
     1562500, //  1.5625
      781250, //  0.78125
      390625  //  0.390625
};

static const u16 sBerryCrushCorePal[] = INCBIN_U16("graphics/link_games/unk_846E4D0.gbapal");
static const u16 sBerryCrushImpactAndSparklesPal[] = INCBIN_U16("graphics/link_games/unk_846E7FC.gbapal");
static const u16 sBerryCrushTImerPal[] = INCBIN_U16("graphics/link_games/unk_846ECC4.gbapal");

static const u32 sBerryCrushCoreTiles[] = INCBIN_U32("graphics/link_games/unk_846E4D0.4bpp.lz");
static const u32 sBerryCrushImpactTiles[] = INCBIN_U32("graphics/link_games/unk_846E7FC.4bpp.lz");
static const u32 sBerryCrushPowderSparklesTiles[] = INCBIN_U32("graphics/link_games/unk_846EB78.4bpp.lz");
static const u32 sBerryCrushTimerTiles[] = INCBIN_U32("graphics/link_games/unk_846ECC4.4bpp.lz");

static const u32 gBerryCrushGrinderTopTilemap[] = INCBIN_U32("graphics/link_games/unk_846ED90.bin.lz");
static const u32 gBerryCrushContainerCapTilemap[] = INCBIN_U32("graphics/link_games/unk_846EEC0.bin.lz");
static const u32 gBerryCrushBackgroundTilemap[] = INCBIN_U32("graphics/link_games/unk_846F058.bin.lz");

static const u8 gUnknown_846F280[][5] = {
    {1, 3},
    {0, 1, 3},
    {1, 3, 2, 4},
    {0, 1, 3, 2, 4}
};

static const struct BerryCrushPlayerSeatCoords gUnknown_846F294[] = {
    {0, 0, 0, 0, -16, 0, 0},
    {1, 0, 3, -28, -4, -24, 16},
    {2, 0, 6, -16, 20, -8, 16},
    {3, 20, 3, 28, -4, 32, -8},
    {4, 20, 6, 16, 20, 16, -8}
};

static const s8 gUnknown_846F2D0[][2] = {
    { 0,  0},
    {-1,  0},
    { 1,  1}
};

static const s8 gUnknown_846F2D6[][2] = {
    {  0,   0},
    {-16,  -4},
    { 16,  -4},
    { -8,  -2},
    {  8,  -2},
    {-24,  -8},
    { 24,  -8},
    {-32, -12},
    { 32, -12},
    {-40, -16},
    { 40, -16}
};

static const u16 sPlayerBerrySpriteTags[] = {
    5, 6, 7, 8, 9
};

static const struct CompressedSpriteSheet sSpriteSheets[] = {
    {sBerryCrushCoreTiles, 0x0800, 1},
    {sBerryCrushImpactTiles, 0x0e00, 2},
    {sBerryCrushPowderSparklesTiles, 0x0700, 3},
    {sBerryCrushTimerTiles, 0x02c0, 4},
    {}
};

static const struct SpritePalette sSpritePals[] = {
    {sBerryCrushCorePal, 1},
    {sBerryCrushImpactAndSparklesPal, 2},
    {sBerryCrushTImerPal, 4},
    {}
};

static const union AnimCmd gUnknown_846F340[] = {
    ANIMCMD_FRAME(0x00, 0),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846F348[] = {
    ANIMCMD_FRAME(0x00, 4),
    ANIMCMD_FRAME(0x10, 4),
    ANIMCMD_FRAME(0x20, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846F358[] = {
    ANIMCMD_FRAME(0x30, 2),
    ANIMCMD_FRAME(0x40, 2),
    ANIMCMD_FRAME(0x50, 2),
    ANIMCMD_FRAME(0x60, 2),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846F36C[] = {
    ANIMCMD_FRAME(0x00, 2),
    ANIMCMD_FRAME(0x04, 2),
    ANIMCMD_FRAME(0x08, 2),
    ANIMCMD_FRAME(0x0c, 2),
    ANIMCMD_FRAME(0x10, 2),
    ANIMCMD_FRAME(0x14, 2),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd gUnknown_846F388[] = {
    ANIMCMD_FRAME(0x18, 4),
    ANIMCMD_FRAME(0x1c, 4),
    ANIMCMD_FRAME(0x20, 4),
    ANIMCMD_FRAME(0x24, 4),
    ANIMCMD_FRAME(0x28, 4),
    ANIMCMD_FRAME(0x2c, 4),
    ANIMCMD_FRAME(0x30, 4),
    ANIMCMD_FRAME(0x34, 4),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd gUnknown_846F3AC[] = {
    ANIMCMD_FRAME(0x14, 0),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846F3B4[] = {
    ANIMCMD_FRAME(0x00, 0),
    ANIMCMD_END
};

static const union AffineAnimCmd gUnknown_846F3BC[] = {
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_FRAME(0, 0, 2, 1),
    AFFINEANIMCMD_JUMP(1)
};

static const union AffineAnimCmd gUnknown_846F3D4[] = {
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_FRAME(0, 0, -2, 1),
    AFFINEANIMCMD_JUMP(1)
};

static const union AnimCmd *const sAnimTable_BerryCrushCore[] = {
    gUnknown_846F340
};

static const union AnimCmd *const sAnimTable_BerryCrushImpact[] = {
    gUnknown_846F348,
    gUnknown_846F358
};

static const union AnimCmd *const sAnimTable_BerryCrushPowderSparkles[] = {
    gUnknown_846F36C,
    gUnknown_846F388
};

static const union AnimCmd *const sAnimTable_BerryCrushTimer[] = {
    gUnknown_846F3AC
};

static const union AnimCmd *const gUnknown_846F404[] = {
    gUnknown_846F3B4
};

static const union AffineAnimCmd *const gUnknown_846F408[] = {
    gUnknown_846F3BC,
    gUnknown_846F3D4
};


static const struct SpriteTemplate sSpriteTemplate_BerryCrushCore = {
    .tileTag = 1,
    .paletteTag = 1,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sAnimTable_BerryCrushCore,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct SpriteTemplate sSpriteTemplate_BerryCrushImpact = {
    .tileTag = 2,
    .paletteTag = 2,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sAnimTable_BerryCrushImpact,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_BerryCrushImpact
};

static const struct SpriteTemplate sSpriteTemplate_BerryCrushPowderSparkles = {
    .tileTag = 3,
    .paletteTag = 2,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = sAnimTable_BerryCrushPowderSparkles,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct SpriteTemplate sSpriteTemplate_BerryCrushTimer = {
    .tileTag = 4,
    .paletteTag = 4,
    .oam = &gOamData_AffineOff_ObjNormal_8x16,
    .anims = sAnimTable_BerryCrushTimer,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct SpriteTemplate sSpriteTemplate_PlayerBerry = {
    .tileTag = 5,
    .paletteTag = 5,
    .oam = &gOamData_AffineDouble_ObjNormal_32x32,
    .anims = gUnknown_846F404,
    .affineAnims = gUnknown_846F408,
    .callback = SpriteCallbackDummy
};

static const struct DigitObjUtilTemplate sDigitObjTemplates[] = {
    {
        .strConvMode = 1,
        .shape = SPRITE_SHAPE(8x16),
        .size = SPRITE_SIZE(8x16),
        .priority = 0,
        .oamCount = 2,
        .xDelta = 8,
        .x = 156,
        .y = 0,
        .spriteSheet = {.compressed = &sSpriteSheets[3]},
        .spritePal = &sSpritePals[2],
    }, {
        .strConvMode = 0,
        .shape = SPRITE_SHAPE(8x16),
        .size = SPRITE_SIZE(8x16),
        .priority = 0,
        .oamCount = 2,
        .xDelta = 8,
        .x = 180,
        .y = 0,
        .spriteSheet = {.compressed = &sSpriteSheets[3]},
        .spritePal = &sSpritePals[2],
    }, {
        .strConvMode = 0,
        .shape = SPRITE_SHAPE(8x16),
        .size = SPRITE_SIZE(8x16),
        .priority = 0,
        .oamCount = 2,
        .xDelta = 8,
        .x = 204,
        .y = 0,
        .spriteSheet = {.compressed = &sSpriteSheets[3]},
        .spritePal = &sSpritePals[2],
    }
};

static const u8 *const sBCRankingHeaders[] = {
    gText_SpaceTimes,
    gText_XDotY,
    gText_StrVar1Berry,
    gText_NeatnessRankings,
    gText_CooperativeRankings,
    gText_PressingPowerRankings
};

struct BerryCrushGame *GetBerryCrushGame(void)
{
    return sBerryCrushGamePtr;
}

u32 ExitBerryCrushWithCallback(MainCallback callback)
{
    if (sBerryCrushGamePtr == NULL)
        return 2;

    if (callback == NULL)
        callback = sBerryCrushGamePtr->savedCallback;

    DestroyTask(sBerryCrushGamePtr->mainTask);
    FREE_AND_SET_NULL(sBerryCrushGamePtr);
    SetMainCallback2(callback);
    if (callback == CB2_ReturnToField)
    {
        PlayNewMapMusic(MUS_POKE_CENTER);
        SetMainCallback1(CB1_Overworld);
    }

    return 0;
}

void StartBerryCrush(MainCallback callback)
{
    u8 playerCount = 0;
    u8 multiplayerId;

    if (!gReceivedRemoteLinkPlayers || gWirelessCommType == 0)
    {
        SetMainCallback2(callback);
        Rfu.linkman_param[0] = 0;
        Rfu.linkman_param[1] = 0;
        Rfu.errorState = 1;
        return;
    }

    playerCount = GetLinkPlayerCount();
    multiplayerId = GetMultiplayerId();
    if (playerCount < 2 || multiplayerId >= playerCount)
    {
        SetMainCallback2(callback);
        Rfu.linkman_param[0] = 0;
        Rfu.linkman_param[1] = 0;
        Rfu.errorState = 1;
        return;
    }

    sBerryCrushGamePtr = AllocZeroed(sizeof(struct BerryCrushGame));
    if (!sBerryCrushGamePtr)
    {
        SetMainCallback2(callback);
        Rfu.linkman_param[0] = 0;
        Rfu.linkman_param[1] = 0;
        Rfu.errorState = 1;
        return;
    }

    sBerryCrushGamePtr->savedCallback = callback;
    sBerryCrushGamePtr->localId = multiplayerId;
    sBerryCrushGamePtr->playerCount = playerCount;
    BerryCrush_InitPlayerNamesAndTextSpeed(sBerryCrushGamePtr);
    sBerryCrushGamePtr->gameState = 1;
    sBerryCrushGamePtr->nextCmd = BCCMD_BeginNormalPaletteFade;
    sBerryCrushGamePtr->afterPalFadeCmd = BCCMD_SignalReadyToBegin;
    BerryCrush_SetPaletteFadeParams(sBerryCrushGamePtr->commandParams, TRUE, 0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
    BerryCrush_RunOrScheduleCommand(BCCMD_InitGfx, 1, sBerryCrushGamePtr->commandParams);
    SetMainCallback2(CB2_BerryCrush);
    sBerryCrushGamePtr->mainTask = CreateTask(Task_RunBerryCrushGame, 8);
}

static void CB2_ReturnToBerryCrushGameFromBerryPouch(void)
{
    if (gSpecialVar_ItemId < FIRST_BERRY_INDEX || gSpecialVar_ItemId > LAST_BERRY_INDEX + 1)
        gSpecialVar_ItemId = FIRST_BERRY_INDEX;
    else
        RemoveBagItem(gSpecialVar_ItemId, 1);

    sBerryCrushGamePtr->unk98[sBerryCrushGamePtr->localId].unkC = gSpecialVar_ItemId - FIRST_BERRY_INDEX;
    sBerryCrushGamePtr->nextCmd = BCCMD_BeginNormalPaletteFade;
    sBerryCrushGamePtr->afterPalFadeCmd = BCCMD_WaitForOthersToPickBerries;
    BerryCrush_SetPaletteFadeParams(sBerryCrushGamePtr->commandParams, FALSE, 0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
    BerryCrush_RunOrScheduleCommand(BCCMD_InitGfx, 1, sBerryCrushGamePtr->commandParams);
    sBerryCrushGamePtr->mainTask = CreateTask(Task_RunBerryCrushGame, 8);
    SetMainCallback2(CB2_BerryCrush);
}

void CB2_BerryCrush_GoToBerryPouch(void)
{
    DestroyTask(sBerryCrushGamePtr->mainTask);
    InitBerryPouch(BERRYPOUCH_FROMBERRYCRUSH, CB2_ReturnToBerryCrushGameFromBerryPouch, FALSE);
}

void BerryCrush_SetVBlankCallback(void)
{
    SetVBlankCallback(VBlankCB_BerryCrush);
}

void BerryCrush_UnsetVBlankCallback(void)
{
    SetVBlankCallback(NULL);
}

void BerryCrush_UpdateSav2Records(void)
{
    u32 var0, var1;

    var0 = sBerryCrushGamePtr->unk68.unk04;
    var0 <<= 8;
    var0 = MathUtil_Div32(var0, 60 << 8);
    var1 = sBerryCrushGamePtr->unk68.unk0A;
    var1 <<= 8;
    var1 = MathUtil_Div32(var1, var0) & 0xFFFF;
    sBerryCrushGamePtr->pressingSpeed = var1;
    switch (sBerryCrushGamePtr->playerCount)
    {
    case 2:
        if (sBerryCrushGamePtr->pressingSpeed > gSaveBlock2Ptr->berryCrush.berryCrushResults[0])
        {
            sBerryCrushGamePtr->unk25_1 = 1;
            gSaveBlock2Ptr->berryCrush.berryCrushResults[0] = sBerryCrushGamePtr->pressingSpeed;
        }
        break;
    case 3:
        if (sBerryCrushGamePtr->pressingSpeed > gSaveBlock2Ptr->berryCrush.berryCrushResults[1])
        {
            sBerryCrushGamePtr->unk25_1 = 1;
            gSaveBlock2Ptr->berryCrush.berryCrushResults[1] = sBerryCrushGamePtr->pressingSpeed;
        }
        break;
    case 4:
        if (sBerryCrushGamePtr->pressingSpeed > gSaveBlock2Ptr->berryCrush.berryCrushResults[2])
        {
            sBerryCrushGamePtr->unk25_1 = 1;
            gSaveBlock2Ptr->berryCrush.berryCrushResults[2] = sBerryCrushGamePtr->pressingSpeed;
        }
        break;
    case 5:
        if (sBerryCrushGamePtr->pressingSpeed > gSaveBlock2Ptr->berryCrush.berryCrushResults[3])
        {
            sBerryCrushGamePtr->unk25_1 = 1;
            gSaveBlock2Ptr->berryCrush.berryCrushResults[3] = sBerryCrushGamePtr->pressingSpeed;
        }
        break;
    }

    sBerryCrushGamePtr->powder = sBerryCrushGamePtr->unk68.unk00;
    if (GiveBerryPowder(sBerryCrushGamePtr->powder))
        return;

    sBerryCrushGamePtr->unk25_0 = 1;
}

static void VBlankCB_BerryCrush(void)
{
    TransferPlttBuffer();
    LoadOam();
    ProcessSpriteCopyRequests();
}

static void CB2_BerryCrush(void)
{
    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
}

static void Task_RunBerryCrushGame(u8 taskId)
{
    if (sBerryCrushGamePtr->cmdCallback != NULL)
        sBerryCrushGamePtr->cmdCallback(sBerryCrushGamePtr, sBerryCrushGamePtr->commandParams);

    sub_814D9CC(sBerryCrushGamePtr);
}

void BerryCrush_InitPlayerNamesAndTextSpeed(struct BerryCrushGame *game)
{
    u8 i;

    for (i = 0; i < game->playerCount; i++)
    {
        StringCopy(game->unk98[i].unk0, gLinkPlayers[i].name);
        game->unk98[i].unk0[PLAYER_NAME_LENGTH] = EOS;
    }
    for (; i < 5; i++)
    {
        memset(game->unk98[i].unk0, 1, PLAYER_NAME_LENGTH);
        game->unk98[i].unk0[PLAYER_NAME_LENGTH] = EOS;
    }

    switch (gSaveBlock2Ptr->optionsTextSpeed)
    {
    case OPTIONS_TEXT_SPEED_SLOW:
        game->textSpeed = 8;
        break;
    case OPTIONS_TEXT_SPEED_MID:
        game->textSpeed = 4;
        break;
    case OPTIONS_TEXT_SPEED_FAST:
        game->textSpeed = 1;
        break;
    }
}

void BerryCrush_RunOrScheduleCommand(u16 command, u8 runMode, u8 *params)
{
    struct BerryCrushGame * game = GetBerryCrushGame();

    if (command >= NELEMS(sBerryCrushCommands))
        command = 0;
    switch (runMode)
    {
    case 0:
        // Call now and set followup to game->nextCmd
        if (command != 0)
            sBerryCrushCommands[command](game, params);
        if (game->nextCmd >= NELEMS(sBerryCrushCommands))
            game->nextCmd = 0;
        game->cmdCallback = sBerryCrushCommands[game->nextCmd];
        break;
    case 1:
        // Schedule for next frame
        game->cmdCallback = sBerryCrushCommands[command];
        break;
    }
}

static u32 BerryCrushCommand_BeginNormalPaletteFade(struct BerryCrushGame * game, u8 *params)
{
    // params points to packed values:
    // bytes 0-3: selectedPals (bitfield)
    // byte 4: delay
    // byte 5: startY
    // byte 6: stopY
    // bytes 7-8: fade color
    // byte 9: if TRUE, communicate on fade complete

    u16 color;
    u32 selectedPals[2];

    selectedPals[0] = (u32)params[0];
    selectedPals[1] = (u32)params[1];
    selectedPals[1] <<= 8;

    selectedPals[0] |= selectedPals[1];
    selectedPals[1] = (u32)params[2];
    selectedPals[1] <<= 16;

    selectedPals[0] |= selectedPals[1];
    selectedPals[1] = (u32)params[3];
    selectedPals[1] <<= 24;

    selectedPals[0] |= selectedPals[1];
    params[0] = params[9];

    color = params[8];
    color <<= 8;
    color |= params[7];

    gPaletteFade.bufferTransferDisabled = FALSE;
    BeginNormalPaletteFade(selectedPals[0], params[4], params[5], params[6], color);
    UpdatePaletteFade();
    game->nextCmd = BCCMD_WaitPaletteFade;
    return 0;
}

static u32 BerryCrushCommand_WaitPaletteFade(struct BerryCrushGame * game, u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        if (UpdatePaletteFade())
            return 0;
        if(params[0] != 0)
            ++game->cmdState;
        else
            game->cmdState = 3;
        return 0;
    case 1:
        LinkRfu_SetRfuFuncToSend6600();
        ++game->cmdState;
        return 0;
    case 2:
        if (IsLinkTaskFinished())
        {
            ++game->cmdState;
            return 0;
        }
        return 0;
    case 3:
        BerryCrush_RunOrScheduleCommand(game->afterPalFadeCmd, 1, NULL);
        game->cmdState = 0;
        return 0;
    default:
        ++game->cmdState;
        return 0;
    }
}

static u32 BerryCrushCommand_PrintMessage(struct BerryCrushGame * game, u8 *params)
{
    u16 waitKeys;

    waitKeys  = params[3];
    waitKeys <<= 8;
    waitKeys |= params[2] << 0;
    switch (game->cmdState)
    {
    case 0:
        DrawDialogueFrame(0, FALSE);
        if (params[1] & 2)
        {
            StringExpandPlaceholders(gStringVar4, sBerryCrushMessages[params[0]]);
            AddTextPrinterParameterized2(0, 2, gStringVar4, game->textSpeed, 0, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
        }
        else
        {
            AddTextPrinterParameterized2(0, 2, sBerryCrushMessages[params[0]], game->textSpeed, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
        }
        CopyWindowToVram(0, COPYWIN_BOTH);
        break;
    case 1:
        if (!IsTextPrinterActive(0))
        {
            if (waitKeys == 0)
                ++game->cmdState;
            break;
        }
        return 0;
    case 2:
        if (!(waitKeys & gMain.newKeys))
            return 0;
        break;
    case 3:
        if (params[1] & 1)
            ClearDialogWindowAndFrame(0, TRUE);
        BerryCrush_RunOrScheduleCommand(game->nextCmd, 1, NULL);
        game->cmdState = params[4];
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_InitGfx(struct BerryCrushGame * game, UNUSED u8 *params)
{
    if (BerryCrush_InitBgs() != 0)
        BerryCrush_RunOrScheduleCommand(game->nextCmd, 0, game->commandParams);
    return 0;
}

static u32 BerryCrushCommand_TeardownGfx(struct BerryCrushGame * game, UNUSED u8 *params)
{
    if (BerryCrush_TeardownBgs() != 0)
        BerryCrush_RunOrScheduleCommand(game->nextCmd, 0, game->commandParams);
    return 0;
}

static u32 BerryCrushCommand_SignalReadyToBegin(struct BerryCrushGame * game, UNUSED u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 1:
        if (IsLinkTaskFinished())
        {
            PlayNewMapMusic(MUS_GAME_CORNER);
            BerryCrush_RunOrScheduleCommand(BCCMD_AskPickBerry, 1, NULL);
            game->gameState = 3;
            game->cmdState = 0;
        }
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_AskPickBerry(struct BerryCrushGame * game, u8 *params)
{
    switch (game->cmdState)
    {
    default:
        ++game->cmdState;
        break;
    case 0:
        sub_814D4D8(game);
        BerryCrush_SetShowMessageParams(params, BCTEXT_AREYOUREADY, 1, 0, BCCMD_BeginNormalPaletteFade);
        game->nextCmd = BCCMD_AskPickBerry;
        BerryCrush_RunOrScheduleCommand(BCCMD_PrintMessage, 1, NULL);
        break;
    case 1:
        game->nextCmd = BCCMD_GoToBerryPouch;
        BerryCrush_RunOrScheduleCommand(BCCMD_TeardownGfx, 1, NULL);
        game->cmdState = 2;
        break;
    }
    return 0;
}

static u32 BerryCrushCommand_GoToBerryPouch(struct BerryCrushGame * game, UNUSED u8 *params)
{
    game->cmdCallback = NULL;
    SetMainCallback2(CB2_BerryCrush_GoToBerryPouch);
    return 0;
}

static u32 BerryCrushCommand_WaitForOthersToPickBerries(struct BerryCrushGame * game, u8 *params)
{
    u8 i;

    switch (game->cmdState)
    {
    case 0:
        BerryCrush_SetShowMessageParams(params, BCTEXT_WAITFOROTHERS, 0, 0, BCCMD_BeginNormalPaletteFade);
        game->nextCmd = BCCMD_WaitForOthersToPickBerries;
        BerryCrush_RunOrScheduleCommand(BCCMD_PrintMessage, 1, NULL);
        return 0;
    case 1:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 2:
        if (!IsLinkTaskFinished())
            return 0;
        memset(game->sendCmd, 0, sizeof(game->sendCmd));
        game->sendCmd[0] = game->unk98[game->localId].unkC;
        SendBlock(0, game->sendCmd, 2);
        break;
    case 3:
        if (!IsLinkTaskFinished())
            return 0;
        game->unk10 = 0;
        break;
    case 4:
        if (GetBlockReceivedStatus() != sReceivedPlayerBitmasks[game->playerCount - 2])
            return 0;
        for (i = 0; i < game->playerCount; ++i)
        {
            game->unk98[i].unkC = gBlockRecvBuffer[i][0];
            if (game->unk98[i].unkC > 0xB0)
                game->unk98[i].unkC = 0;
            game->unk18 += gBerryCrushStats[game->unk98[i].unkC].unk0;
            game->powder += gBerryCrushStats[game->unk98[i].unkC].powder;
        }
        game->unk10 = 0;
        ResetBlockReceivedFlags();
        game->unk20 = MathUtil_Div32(game->unk18 << 8, 0x2000);
        break;
    case 5:
        ClearDialogWindowAndFrame(0, TRUE);
        BerryCrush_RunOrScheduleCommand(BCCMD_DropBerriesIntoCrusher, 1, NULL);
        game->gameState = 4;
        game->cmdState = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_DropBerriesIntoCrusher(struct BerryCrushGame * game, UNUSED u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        BerryCrush_CreateBerrySprites(game, &game->spritesManager);
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 1:
        if (!IsLinkTaskFinished())
            return 0;
        game->spritesManager.animBerryIdx = 0;
        game->spritesManager.unk1 = 0;
        game->spritesManager.unk2 = 0;
        game->spritesManager.unk3 = 0;
        break;
    case 2:
        game->spritesManager.berrySprites[game->spritesManager.animBerryIdx]->callback = SpriteCB_DropBerryIntoCrusher;
        game->spritesManager.berrySprites[game->spritesManager.animBerryIdx]->affineAnimPaused = FALSE;
        PlaySE(SE_BALL_THROW);
        break;
    case 3:
        if (game->spritesManager.berrySprites[game->spritesManager.animBerryIdx]->callback == SpriteCB_DropBerryIntoCrusher)
            return 0;
        game->spritesManager.berrySprites[game->spritesManager.animBerryIdx] = NULL;
        ++game->spritesManager.animBerryIdx;
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 4:
        if (!IsLinkTaskFinished())
            return 0;
        if (game->spritesManager.animBerryIdx < game->playerCount)
        {
            game->cmdState = 2;
            return 0;
        }
        game->spritesManager.animBerryIdx = 0;
        break;
    case 5:
        BerryCrushFreeBerrySpriteGfx(game, &game->spritesManager);
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 6:
        if (!IsLinkTaskFinished())
            return 0;
        PlaySE(SE_FALL);
        BerryCrush_RunOrScheduleCommand(BCCMD_DropLid, 1, NULL);
        game->gameState = 5;
        game->cmdState = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_DropLid(struct BerryCrushGame * game,  UNUSED u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        game->depth += 4;
        if (game->depth < 0)
            return 0;
        game->depth = 0;
        game->spritesManager.unk1 = 4;
        game->spritesManager.animBerryIdx = 0;
        game->spritesManager.unk2 = gUnknown_846E2F0[game->spritesManager.unk1][0];
        PlaySE(SE_M_STRENGTH);
        break;
    case 1:
        game->vibration = gUnknown_846E2F0[game->spritesManager.unk1][game->spritesManager.animBerryIdx];
        SetGpuReg(REG_OFFSET_BG0VOFS, -game->vibration);
        SetGpuReg(REG_OFFSET_BG2VOFS, -game->vibration);
        SetGpuReg(REG_OFFSET_BG3VOFS, -game->vibration);
        ++game->spritesManager.animBerryIdx;
        if (game->spritesManager.animBerryIdx < game->spritesManager.unk2)
            return 0;
        if (game->spritesManager.unk1 == 0)
            break;
        --game->spritesManager.unk1;
        game->spritesManager.unk2 = gUnknown_846E2F0[game->spritesManager.unk1][0];
        game->spritesManager.animBerryIdx = 0;
        return 0;
    case 2:
        game->vibration = 0;
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
        SetGpuReg(REG_OFFSET_BG2VOFS, 0);
        SetGpuReg(REG_OFFSET_BG3VOFS, 0);
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 3:
        if (!IsLinkTaskFinished())
            return 0;
        BerryCrush_RunOrScheduleCommand(BCCMD_Countdown, 1, NULL);
        game->gameState = 6;
        game->cmdState = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_Countdown(struct BerryCrushGame * game,  UNUSED u8 *params)
{
    switch (game-> cmdState)
    {
    case 0:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 1:
        if (!IsLinkTaskFinished())
            return 0;
        StartMinigameCountdown(TAG_COUNTDOWN, TAG_COUNTDOWN, 120, 80, 0);
        break;
    case 2:
        if (IsMinigameCountdownRunning())
            return 0;
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 3:
        if (!IsLinkTaskFinished())
            return 0;
        game->spritesManager.animBerryIdx = 0;
        game->spritesManager.unk1 = 0;
        game->spritesManager.unk2 = 0;
        game->spritesManager.unk3 = 0;
        game->unk10 = 0;
        if (game->localId == 0)
            BerryCrush_RunOrScheduleCommand(BCCMD_PlayGame_Master, 1, NULL);
        else
            BerryCrush_RunOrScheduleCommand(BCCMD_PlayGame_Slave, 1, NULL);
        game->gameState = 7;
        game->cmdState = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static void BerryCrush_ProcessGamePartnerInput(struct BerryCrushGame * game)
{
    u8 numPressedA = 0;
    u16 r3;
    u16 *curRecvCmd;
    u8 i = 0;
    s32 r2_ = 0;
    s32 r0;

    for (i = 0; i < game->playerCount; ++i)
    {
        curRecvCmd = gRecvCmds[i];
        if ((curRecvCmd[0] & 0xFF00) == 0x2F00
            && curRecvCmd[1] == 2)
        {
            if ((u8)curRecvCmd[2] & 4) // pushedAButton
            {
                game->localState.unk02_3 |= gUnknown_846E2E0[i];
                game->unk98[i].unk1C = 1;
                ++game->unk98[i].unk16;
                ++numPressedA;
                r3 = game->timer - game->unk98[i].unkE;
                if (r3 >= game->unk98[i].unk12 - 1 && r3 <= game->unk98[i].unk12 + 1)
                {
                    ++game->unk98[i].unk10;
                    game->unk98[i].unk12 = r3;
                    if (game->unk98[i].unk10 > game->unk98[i].unk14)
                        game->unk98[i].unk14 = game->unk98[i].unk10;
                }
                else
                {
                    game->unk98[i].unk10 = 0;
                    game->unk98[i].unk12 = r3;
                }
                game->unk98[i].unkE = game->timer;
                if (++game->unk98[i].unk1B > 2)
                    game->unk98[i].unk1B = 0;
            }
            else
            {
                game->unk98[i].unk1C = 0;
            }
        }
    }
    if (numPressedA > 1)
    {
        for (i = 0; i < game->playerCount; ++i)
        {
            if (game->unk98[i].unk1C != 0)
            {
                game->unk98[i].unk1C |= 2;
                ++game->unk98[i].unk18;
            }
        }
    }
    if (numPressedA != 0)
    {
        game->unk2E += numPressedA;
        numPressedA += gUnknown_846E2E8[numPressedA - 1];
        game->unk34 += numPressedA;
        game->unk1A += numPressedA;
        r0 = game->unk18;
        r2_ = game->unk1A;
        if (r0 - r2_ > 0)
        {
            r2_ <<= 8;
            r2_ = MathUtil_Div32(r2_, game->unk20);
            r2_ >>= 8;
            game->unk24 = r2_;
        }
        else
        {
            game->unk24 = 32;
            game->localState.unk02_0 = 1;
        }
    }
}

static void BerryCrush_BuildLocalState(struct BerryCrushGame * game)
{
    u8 count = 0;
    u16 r1 = 0;
    u8 i = 0;

    for (i = 0; i < game->playerCount; ++i)
    {
        if (game->unk98[i].unk1C != 0)
        {
            ++count;
            r1 = game->unk98[i].unk1B + 1;
            if (game->unk98[i].unk1C & 2)
                r1 |= 4;
            r1 <<= 3 * i;
            game->localState.unk08 |= r1;
        }
    }
    game->localState.unk04 = game->unk24;
    if (count == 0)
    {
        if (game->spritesManager.unk3 != 0)
            ++game->spritesManager.animBerryIdx;
    }
    else if (game->spritesManager.unk3 != 0)
    {
        if (count != game->spritesManager.unk1)
        {
            game->spritesManager.unk1 = count - 1;
            game->spritesManager.unk2 = gUnknown_846E314[count - 1][0];
        }
        else
        {
            ++game->spritesManager.animBerryIdx;
        }
    }
    else
    {
        game->spritesManager.animBerryIdx = 0;
        game->spritesManager.unk1 = count - 1;
        game->spritesManager.unk2 = gUnknown_846E314[count - 1][0];
        game->spritesManager.unk3 = 1;
    }

    if (game->spritesManager.unk3 != 0)
    {
        if (game->spritesManager.animBerryIdx >= game->spritesManager.unk2)
        {
            game->spritesManager.animBerryIdx = 0;
            game->spritesManager.unk1 = 0;
            game->spritesManager.unk2 = 0;
            game->spritesManager.unk3 = 0;
            r1 = 0;
        }
        else
        {
            r1 = gUnknown_846E314[game->spritesManager.unk1][game->spritesManager.animBerryIdx + 1];
        }
        game->localState.unk03 = r1;
    }
    else
    {
        game->localState.unk03 = 0;
    }
    game->localState.unk06 = game->unk26;
}

static void BerryCrush_HandlePlayerInput(struct BerryCrushGame * game)
{
    if (JOY_NEW(A_BUTTON))
        game->localState.pushedAButton = TRUE;
    if (JOY_HELD(A_BUTTON))
    {
        if (game->unk98[game->localId].unk1A < game->timer)
            ++game->unk98[game->localId].unk1A;
    }
    if (game->localId != 0 && !game->localState.pushedAButton)
        return;
    game->localState.unk00 = 2;
    if (game->timer % 30 == 0)
    {
        if (game->unk2E > gUnknown_846E3C4[game->playerCount - 2])
        {
            ++game->unk30;
            game->unk25_4 = 1;
        }
        else
        {
            game->unk25_4 = 0;
        }
        game->unk2E = 0;
        ++game->unk32;
    }
    if (game->timer % 15 == 0)
    {
        if (game->unk34 < gUnknown_846E3B4[game->playerCount - 2][0])
            game->unk25_5 = 0;
        else if (game->unk34 < gUnknown_846E3B4[game->playerCount - 2][1])
            game->unk25_5 = 1;
        else if (game->unk34 < gUnknown_846E3B4[game->playerCount - 2][2])
            game->unk34 = 2; // typo since game->unk34 will be reset?
        else if (game->unk34 < gUnknown_846E3B4[game->playerCount - 2][3])
            game->unk34 = 3; // typo since game->unk34 will be reset?
        else
            game->unk25_5 = 4;
        game->unk34 = 0;
    }
    else
    {
        ++game->unk10;
        if (game->unk10 > 60)
        {
            if (game->unk10 > 70)
            {
                sub_80FBA44();
                game->unk10 = 0;
            }
            else if (game->localState.unk02_3 == 0)
            {
                sub_80FBA44();
                game->unk10 = 0;
            }
        }

    }
    if (game->timer >= 36000)
        game->localState.unk02_0 = 1;
    game->localState.unk02_1 = game->unk25_4;
    game->localState.unk0A = game->unk25_5;
    memcpy(&game->sendCmd, &game->localState, sizeof(game->sendCmd));
    RfuPrepareSend0x2f00(game->sendCmd);
}

static void BerryCrush_UpdateGameState(struct BerryCrushGame * game)
{
    u8 i = 0;
    struct BerryCrushGame_4E * r4_ = NULL;

    for (i = 0; i < game->playerCount; ++i)
        game->unk98[i].unk1C = 0;
    if ((gRecvCmds[0][0] & 0xFF00) != 0x2F00 || gRecvCmds[0][1] != 2)
    {
        game->unk25_2 = 0;
        return;
    }

    memcpy(game->recvCmd, gRecvCmds[0], 14);
    r4_ = (struct BerryCrushGame_4E *)&game->recvCmd;
    game->depth = r4_->unk6;
    game->vibration = r4_->unk5;
    game->timer = r4_->unk8;
    sub_814DC5C(game, &game->spritesManager);
    if (r4_->unk4_0)
        game->unk25_3 = 1;
}

static u32 BerryCrushCommand_PlayGame_Master(struct BerryCrushGame * game, UNUSED u8 *params)
{
    memset(&game->localState, 0, sizeof(game->localState));
    memset(&game->recvCmd, 0, sizeof(game->recvCmd));
    BerryCrush_UpdateGameState(game);
    SetGpuReg(REG_OFFSET_BG0VOFS, -game->vibration);
    SetGpuReg(REG_OFFSET_BG2VOFS, -game->vibration);
    SetGpuReg(REG_OFFSET_BG3VOFS, -game->vibration);
    if (game->unk25_3)
    {
        if (game->timer >= 36000)
        {
            game->timer = 36000;
            BerryCrush_RunOrScheduleCommand(BCCMD_HandleTimeUp, 1, NULL);
        }
        else
        {
            BerryCrush_RunOrScheduleCommand(BCCMD_FinishGame, 1, NULL);
        }
        game->unk10 = 0;
        game->cmdState = 0;
        return 0;
    }
    else
    {
        ++game->unk26;
        BerryCrush_ProcessGamePartnerInput(game);
        BerryCrush_BuildLocalState(game);
        BerryCrush_HandlePlayerInput(game);
        return 0;
    }
}

static u32 BerryCrushCommand_PlayGame_Slave(struct BerryCrushGame * game, UNUSED u8 *params)
{
    memset(&game->localState, 0, sizeof(game->localState));
    memset(&game->recvCmd, 0, sizeof(game->recvCmd));
    BerryCrush_UpdateGameState(game);
    SetGpuReg(REG_OFFSET_BG0VOFS, -game->vibration);
    SetGpuReg(REG_OFFSET_BG2VOFS, -game->vibration);
    SetGpuReg(REG_OFFSET_BG3VOFS, -game->vibration);
    if (game->unk25_3)
    {
        if (game->timer >= 36000)
        {
            game->timer = 36000;
            BerryCrush_RunOrScheduleCommand(BCCMD_HandleTimeUp, 1, NULL);
        }
        else
        {
            BerryCrush_RunOrScheduleCommand(BCCMD_FinishGame, 1, NULL);
        }
        game->unk10 = 0;
        game->cmdState = 0;
        return 0;
    }
    else
    {
        BerryCrush_HandlePlayerInput(game);
        return 0;
    }
}

static u32 BerryCrushCommand_FinishGame(struct BerryCrushGame * game, UNUSED u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        game->gameState = 8;
        PlaySE(SE_M_STRENGTH);
        BlendPalettes(0xFFFFFFFF, 8, RGB(31, 31, 0));
        game->spritesManager.animBerryIdx = 2;
        break;
    case 1:
        if (--game->spritesManager.animBerryIdx != 255)
            return 0;
        BlendPalettes(0xFFFFFFFF, 0, RGB(31, 31, 0));
        game->spritesManager.unk1 = 4;
        game->spritesManager.animBerryIdx = 0;
        game->spritesManager.unk2 = gUnknown_846E2F0[game->spritesManager.unk1][0];
        break;
    case 2:
        game->vibration = gUnknown_846E2F0[game->spritesManager.unk1][game->spritesManager.animBerryIdx];
        SetGpuReg(REG_OFFSET_BG0VOFS, -game->vibration);
        SetGpuReg(REG_OFFSET_BG2VOFS, -game->vibration);
        SetGpuReg(REG_OFFSET_BG3VOFS, -game->vibration);
        if (++game->spritesManager.animBerryIdx < game->spritesManager.unk2)
            return 0;
        if (game->spritesManager.unk1 != 0)
        {
            --game->spritesManager.unk1;
            game->spritesManager.unk2 = gUnknown_846E2F0[game->spritesManager.unk1][0];
            game->spritesManager.animBerryIdx = 0;
            return 0;
        }
        break;
    case 3:
        game->vibration = 0;
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
        SetGpuReg(REG_OFFSET_BG2VOFS, 0);
        SetGpuReg(REG_OFFSET_BG3VOFS, 0);
        break;
    case 4:
        if (!sub_814DE50(game, &game->spritesManager))
            return 0;
        LinkRfu_SetRfuFuncToSend6600();
        game->unk10 = 0;
        break;
    case 5:
        if (!IsLinkTaskFinished())
            return 0;
        BerryCrush_RunOrScheduleCommand(BCCMD_TabulateResults, 1, NULL);
        game->unk10 = 0;
        game->cmdState = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_HandleTimeUp(struct BerryCrushGame * game, u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        game->gameState = 9;
        PlaySE(SE_FAILURE);
        BlendPalettes(0xFFFFFFFF, 8, RGB(31, 0, 0));
        game->spritesManager.animBerryIdx = 4;
        break;
    case 1:
        if (--game->spritesManager.animBerryIdx != 255)
            return 0;
        BlendPalettes(0xFFFFFFFF, 0, RGB(31, 0, 0));
        game->spritesManager.animBerryIdx = 0;
        break;
    case 2:
        if (!sub_814DE50(game, &game->spritesManager))
            return 0;
        LinkRfu_SetRfuFuncToSend6600();
        game->unk10 = 0;
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
        SetGpuReg(REG_OFFSET_BG2VOFS, 0);
        SetGpuReg(REG_OFFSET_BG3VOFS, 0);
        break;
    case 3:
        if (!IsLinkTaskFinished())
            return 0;
        ConvertIntToDecimalStringN(gStringVar1, game->powder, STR_CONV_MODE_LEFT_ALIGN, 6);
        BerryCrush_SetShowMessageParams(params, BCTEXT_TIMEUP, 1, 0, 0);
        game->nextCmd = BCCMD_SaveTheGame;
        BerryCrush_RunOrScheduleCommand(BCCMD_PrintMessage, 1, NULL);
        game->unk10 = 0;
        game->cmdState = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_TabulateResults(struct BerryCrushGame * game, UNUSED u8 *params)
{
    u8 i, j, r3;
    s32 r2;
    s32 r4;
    u16 r6;

    switch (game->cmdState)
    {
    case 0:
        memset(game->sendCmd, 0, 2 * sizeof(u16));
        if (game->unk98[game->localId].unk1A > game->timer)
            game->unk98[game->localId].unk1A = game->timer;
        game->sendCmd[0] = game->unk98[game->localId].unk1A;
        SendBlock(0, game->sendCmd, 2);
        break;
    case 1:
        if (!IsLinkTaskFinished())
            return 0;
        game->unk10 = 0;
        break;
    case 2:
        if (GetBlockReceivedStatus() != sReceivedPlayerBitmasks[game->playerCount - 2])
            return 0;
        for (i = 0; i < game->playerCount; ++i)
            game->unk98[i].unk1A = gBlockRecvBuffer[i][0];
        game->unk10 = 0;
        game->sendCmd[0] = 0;
        ResetBlockReceivedFlags();
        if (game->localId == 0)
            game->cmdState = 3;
        else
            game->cmdState = 6;
        return 0;
    case 3:
        memset(&game->unk68, 0, sizeof(struct BerryCrushGame_68));
        game->unk68.unk04 = game->timer;
        game->unk68.unk06 = game->unk18 / (game->timer / 60);
        // (unk30 * 50 / unk32) + 50
        r2 = MathUtil_Mul32(game->unk30 << 8, 50 << 8);
        r2 = MathUtil_Div32(r2, game->unk32 << 8) + (50 << 8);
        r2 >>= 8;
        game->unk68.unk08 = r2 & 0x7F;
        // powder + playerCount * (r2 / 100)
        r2 <<= 8;
        r2 = MathUtil_Div32(r2, 100 << 8);
        r4 = (game->powder * game->playerCount) << 8;
        r4 = MathUtil_Mul32(r4, r2);
        game->unk68.unk00 = r4 >> 8;
        game->unk68.unk20[0][7] = Random() % 3;
        for (i = 0; i < game->playerCount; ++i)
        {
            game->unk68.unk20[0][i] = i;
            game->unk68.unk20[1][i] = i;
            game->unk68.stats[0][i] = game->unk98[i].unk16;
            game->unk68.unk0A += game->unk68.stats[0][i];
            switch (game->unk68.unk20[0][7])
            {
            case 0:
                if (game->unk98[i].unk16 != 0)
                {
                    r2 = game->unk98[i].unk14;
                    r2 <<= 8;
                    r2 = MathUtil_Mul32(r2, 0x6400);
                    r4 = game->unk98[i].unk16;
                    r4 <<= 8;
                    r4 = MathUtil_Div32(r2, r4);
                }
                else
                {
                    r4 = 0;
                }
                break;
            case 1:
                if (game->unk98[i].unk16 != 0)
                {
                    r2 = game->unk98[i].unk18;
                    r2 <<= 8;
                    r2 = MathUtil_Mul32(r2, 0x6400);
                    r4 = game->unk98[i].unk16;
                    r4 <<= 8;
                    r4 = MathUtil_Div32(r2, r4);
                }
                else
                {
                    r4 = 0;
                }
                break;
            case 2:
                if (game->unk98[i].unk16 == 0)
                {
                    r4 = 0;
                }
                else if (game->unk98[i].unk1A >= game->timer)
                {
                    r4 = 0x6400;
                }
                else
                {
                    r2 = game->unk98[i].unk1A;
                    r2 <<= 8;
                    r2 = MathUtil_Mul32(r2, 0x6400);
                    r4 = game->timer;
                    r4 <<= 8;
                    r4 = MathUtil_Div32(r2, r4);
                }
                break;
            }
            r4 >>= 4;
            game->unk68.stats[1][i] = r4;
        }
        break;
    case 4:
        for (i = 0; i < game->playerCount - 1; ++i)
        {
            for (j = game->playerCount - 1; j > i; --j)
            {
                if (game->unk68.stats[0][j - 1] < game->unk68.stats[0][j])
                {
                    r6 = game->unk68.stats[0][j];
                    game->unk68.stats[0][j] = game->unk68.stats[0][j - 1];
                    game->unk68.stats[0][j - 1] = r6;
                    r3 = game->unk68.unk20[0][j];
                    game->unk68.unk20[0][j] = game->unk68.unk20[0][j - 1];
                    game->unk68.unk20[0][j - 1] = r3;
                }
                if (game->unk68.stats[1][j - 1] < game->unk68.stats[1][j])
                {
                    r6 = game->unk68.stats[1][j];
                    game->unk68.stats[1][j] = game->unk68.stats[1][j - 1];
                    game->unk68.stats[1][j - 1] = r6;
                    r3 = game->unk68.unk20[1][j];
                    game->unk68.unk20[1][j] = game->unk68.unk20[1][j - 1];
                    game->unk68.unk20[1][j - 1] = r3;
                }
            }
        }
        SendBlock(0, &game->unk68, sizeof(struct BerryCrushGame_68));
        break;
    case 5:
        if (!IsLinkTaskFinished())
            return 0;
        game->unk10 = 0;
        break;
    case 6:
        if (GetBlockReceivedStatus() != 1)
            return 0;
        memset(&game->unk68, 0, sizeof(struct BerryCrushGame_68));
        memcpy(&game->unk68, gBlockRecvBuffer, sizeof(struct BerryCrushGame_68));
        ResetBlockReceivedFlags();
        game->unk10 = 0;
        break;
    case 7:
        BerryCrush_UpdateSav2Records();
        BerryCrush_RunOrScheduleCommand(BCCMD_ShowResults, 1, NULL);
        game->gameState = 11;
        game->cmdState = 0;
        game->unk24 = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_ShowResults(struct BerryCrushGame * game, u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        if (!sub_814E644(game, &game->spritesManager))
            return 0;
        break;
    case 1:
        CopyBgTilemapBufferToVram(0);
        game->spritesManager.animBerryIdx = 30;
        break;
    case 2:
        if (game->spritesManager.animBerryIdx != 0)
        {
            --game->spritesManager.animBerryIdx;
            return 0;
        }
        if (!JOY_NEW(A_BUTTON))
            return 0;
        PlaySE(SE_SELECT);
        sub_814E80C(game);
        break;
    case 3:
        if (game->gameState <= 12)
        {
            ++game->gameState;
            game->cmdState = 0;
            return 0;
        }
        break;
    case 4:
        ConvertIntToDecimalStringN(gStringVar1, game->powder, STR_CONV_MODE_LEFT_ALIGN, 6);
        ConvertIntToDecimalStringN(gStringVar2, GetBerryPowder(), STR_CONV_MODE_LEFT_ALIGN, 6);
        BerryCrush_SetShowMessageParams(params, BCTEXT_GAINEDPOWDER, 3, 0, 0);
        game->nextCmd = BCCMD_SaveTheGame;
        BerryCrush_RunOrScheduleCommand(BCCMD_PrintMessage, 1, NULL);
        game->cmdState = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_SaveTheGame(struct BerryCrushGame * game, u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        if (game->timer >= 36000)
            BerryCrush_HideTimerSprites(&game->spritesManager);
        BerryCrush_SetShowMessageParams(params, BCTEXT_COMMSTANDBY, 0, 0, BCCMD_BeginNormalPaletteFade);
        game->nextCmd = BCCMD_SaveTheGame;
        BerryCrush_RunOrScheduleCommand(BCCMD_PrintMessage, 1, NULL);
        game->cmdState = 0;
        return 0;
    case 1:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 2:
        if (!IsLinkTaskFinished())
            return 0;
        DrawDialogueFrame(0, FALSE);
        AddTextPrinterParameterized2(0, 2, gText_SavingDontTurnOffThePower2, 0, NULL, 2, 1, 3);
        CopyWindowToVram(0, COPYWIN_BOTH);
        CreateTask(Task_SaveGame_UpdatedLinkRecords, 0);
        break;
    case 3:
        if (FuncIsActiveTask(Task_SaveGame_UpdatedLinkRecords))
            return 0;
        break;
    case 4:
        BerryCrush_RunOrScheduleCommand(BCCMD_AskPlayAgain, 1, NULL);
        game->gameState = 15;
        game->cmdState = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_AskPlayAgain(struct BerryCrushGame * game, u8 *params)
{
    s8 r4 = 0;

    switch (game->cmdState)
    {
    case 0:
        BerryCrush_SetShowMessageParams(params, BCTEXT_ASKPLAYAGAIN, 0, 0, BCCMD_BeginNormalPaletteFade);
        game->nextCmd = BCCMD_AskPlayAgain;
        BerryCrush_RunOrScheduleCommand(BCCMD_PrintMessage, 1, NULL);
        game->cmdState = 0; // dunno what it's doing because it's already in case 0
        return 0;
    case 1:
        DisplayYesNoMenuDefaultYes();
        break;
    case 2:
        r4 = Menu_ProcessInputNoWrapClearOnChoose();
        if (r4 != -2)
        {
            memset(game->sendCmd, 0, sizeof(game->sendCmd));
            if (r4 == 0)
            {
                if (CheckHasAtLeastOneBerry())
                    game->unk14 = 0;
                else
                    game->unk14 = 3;
            }
            else
            {
                game->unk14 = 1;
            }
            ClearDialogWindowAndFrame(0, TRUE);
            BerryCrush_SetShowMessageParams(params, BCTEXT_COMMSTANDBY, 0, 0, 0);
            game->nextCmd = BCCMD_CommunicatePlayAgainResponses;
            BerryCrush_RunOrScheduleCommand(BCCMD_PrintMessage, 1, NULL);
            game->cmdState = 0;
        }
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_CommunicatePlayAgainResponses(struct BerryCrushGame * game, UNUSED u8 *params)
{
    u8 i = 0;

    switch (game->cmdState)
    {
    case 0:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 1:
        if (!IsLinkTaskFinished())
            return 0;
        game->sendCmd[0] = game->unk14;
        game->recvCmd[0] = 0;
        SendBlock(0, game->sendCmd, sizeof(u16));
        break;
    case 2:
        if (!IsLinkTaskFinished())
            return 0;
        game->unk10 = 0;
        break;
    case 3:
        if (GetBlockReceivedStatus() != sReceivedPlayerBitmasks[game->playerCount - 2])
            return 0;
        for (; i < game->playerCount; ++i)
            game->recvCmd[0] += gBlockRecvBuffer[i][0];
        if (game->recvCmd[0] != 0)
            BerryCrush_RunOrScheduleCommand(BCCMD_PlayAgainFailureMessage, 1, NULL);
        else
            BerryCrush_RunOrScheduleCommand(BCCMD_FadeOutToPlayAgain, 1, NULL);
        ResetBlockReceivedFlags();
        game->sendCmd[0] = 0;
        game->recvCmd[0] = 0;
        game->unk10 = 0;
        game->cmdState = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_FadeOutToPlayAgain(struct BerryCrushGame * game, UNUSED u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 1, 0, 0x10, RGB_BLACK);
        UpdatePaletteFade();
        break;
    case 1:
        if (UpdatePaletteFade())
            return 0;
        break;
    case 2:
        ClearDialogWindowAndFrame(0, TRUE);
        sub_814DA04(game);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, RGB_BLACK);
        UpdatePaletteFade();
        break;
    case 3:
        if (UpdatePaletteFade())
            return 0;
        BerryCrush_RunOrScheduleCommand(BCCMD_AskPickBerry, 1, NULL);
        game->gameState = 3;
        game->cmdState = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_PlayAgainFailureMessage(struct BerryCrushGame * game, UNUSED u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        DrawDialogueFrame(0, FALSE);
        if (game->unk14 == 3)
            AddTextPrinterParameterized2(0, 2, sBerryCrushMessages[BCTEXT_CANCEL_NOBERRIES], game->textSpeed, NULL, 2, 1, 3);
        else
            AddTextPrinterParameterized2(0, 2, sBerryCrushMessages[BCTEXT_CANCEL_DROPPEDOUT], game->textSpeed, NULL, 2, 1, 3);
        CopyWindowToVram(0, COPYWIN_BOTH);
        break;
    case 1:
        if (IsTextPrinterActive(0))
            return 0;
        game->spritesManager.animBerryIdx = 120;
        break;
    case 2:
        if (game->spritesManager.animBerryIdx != 0)
            --game->spritesManager.animBerryIdx;
        else
        {
            BerryCrush_RunOrScheduleCommand(BCCMD_GracefulExit, 1, NULL);
            game->cmdState = 0;
        }
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_GracefulExit(struct BerryCrushGame * game, UNUSED u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 1:
        if (!IsLinkTaskFinished())
            return 0;
        SetCloseLinkCallback();
        break;
    case 2:
        if (gReceivedRemoteLinkPlayers)
            return 0;
        game->nextCmd = BCCMD_Quit;
        BerryCrush_RunOrScheduleCommand(BCCMD_TeardownGfx, 1, NULL);
        game->cmdState = 2; // ???
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_Quit(UNUSED struct BerryCrushGame * game, UNUSED u8 *params)
{
    ExitBerryCrushWithCallback(NULL);
    return 0;
}

static void sub_814D4D8(struct BerryCrushGame * game)
{
    u8 r5 = 0;

    IncrementGameStat(GAME_STAT_BERRY_CRUSH_POINTS);
    game->unkD = 0;
    game->unk10 = 0;
    game->gameState = 2;
    game->unk14 = 0;
    game->powder = 0;
    game->unk18 = 0;
    game->unk1A = 0;
    game->unk20 = 0;
    game->unk24 = 0;
    game->unk25_0 = 0;
    game->unk25_1 = 0;
    game->unk25_2 = 0;
    game->unk25_3 = FALSE;
    game->unk25_4 = 0;
    game->unk25_5 = 0;
    game->unk26 = 0;
    game->timer = 0;
    game->unk2E = 0;
    game->unk32 = -1;
    game->unk30 = 0;
    game->unk34 = 0;
    for (; r5 < 5; ++r5)
    {
        game->unk98[r5].unkC = -1;
        game->unk98[r5].unkE = 0;
        game->unk98[r5].unk10 = 0;
        game->unk98[r5].unk12 = 1;
        game->unk98[r5].unk14 = 0;
        game->unk98[r5].unk16 = 0;
        game->unk98[r5].unk18 = 0;
        game->unk98[r5].unk1A = 0;
        game->unk98[r5].unk1B = 0;
        game->unk98[r5].unk1C = 0;
    }
}

void BerryCrush_SetPaletteFadeParams(u8 *params, bool8 communicateAfter, u32 selectedPals, s8 delay, u8 startY, u8 targetY, u16 palette)
{
    params[0] = ((u8 *)&selectedPals)[0];
    params[1] = ((u8 *)&selectedPals)[1];
    params[2] = ((u8 *)&selectedPals)[2];
    params[3] = ((u8 *)&selectedPals)[3];
    params[4] = delay;
    params[5] = startY;
    params[6] = targetY;
    params[7] = ((u8 *)&palette)[0];
    params[8] = ((u8 *)&palette)[1];
    params[9] = communicateAfter;
}

void BerryCrush_SetShowMessageParams(u8 *params, u8 stringId, u8 flags, u16 waitKeys, u8 followupCmd)
{
    params[0] = stringId;
    params[1] = flags;
    params[2] = ((u8 *)&waitKeys)[0];
    params[3] = ((u8 *)&waitKeys)[1];
    params[4] = followupCmd;
}

int BerryCrush_InitBgs(void)
{
    struct BerryCrushGame * game = GetBerryCrushGame();
    if (game == NULL)
        return -1;

    switch (game->cmdState)
    {
    case 0:
        SetVBlankCallback(NULL);
        SetHBlankCallback(NULL);
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        ScanlineEffect_Stop();
        ResetTempTileDataBuffers();
        break;
    case 1:
        CpuFill16(0, (void *)OAM, OAM_SIZE);
        gReservedSpritePaletteCount = 0;
        DigitObjUtil_Init(3);
        break;
    case 2:
        ResetPaletteFade();
        ResetSpriteData();
        FreeAllSpritePalettes();
        break;
    case 3:
        ResetBgsAndClearDma3BusyFlags(FALSE);
        InitBgsFromTemplates(0, sBgTemplates, NELEMS(sBgTemplates));
        SetBgTilemapBuffer(1, game->spritesManager.bgBuffers[0]);
        SetBgTilemapBuffer(2, game->spritesManager.bgBuffers[2]);
        SetBgTilemapBuffer(3, game->spritesManager.bgBuffers[3]);
        ChangeBgX(0, 0, 0);
        ChangeBgY(0, 0, 0);
        ChangeBgX(2, 0, 0);
        ChangeBgY(2, 0, 0);
        ChangeBgX(3, 0, 0);
        ChangeBgY(3, 0, 0);
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        break;
    case 4:
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 32, 32);
        FillBgTilemapBufferRect_Palette0(1, 0, 0, 0, 32, 64);
        FillBgTilemapBufferRect_Palette0(2, 0, 0, 0, 32, 32);
        FillBgTilemapBufferRect_Palette0(3, 0, 0, 0, 32, 32);
        break;
    case 5:
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(3);
        DecompressAndCopyTileDataToVram(1, gUnknown_8EAFFC0, 0, 0, 0);
        break;
    case 6:
        if (FreeTempTileDataBuffersIfPossible())
            return 0;

        InitStandardTextBoxWindows();
        ResetBg0();
        sub_814EB38(game);
        sub_814EBB0(game);
        gPaletteFade.bufferTransferDisabled = TRUE;
        break;
    case 7:
        LoadPalette(gUnknown_8EAFEA0, 0, 0x180);
        CopyToBgTilemapBuffer(1, gBerryCrushGrinderTopTilemap, 0, 0);
        CopyToBgTilemapBuffer(2, gBerryCrushContainerCapTilemap, 0, 0);
        CopyToBgTilemapBuffer(3, gBerryCrushBackgroundTilemap, 0, 0);
        sub_814EC80(game);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(3);
        break;
    case 8:
        LoadWirelessStatusIndicatorSpriteGfx();
        CreateWirelessStatusIndicatorSprite(0,  0);
        sub_814ECE0(game);
        SetGpuReg(REG_OFFSET_BG1VOFS, -gSpriteCoordOffsetY);
        ChangeBgX(1, 0, 0);
        ChangeBgY(1, 0, 0);
        break;
    case 9:
        gPaletteFade.bufferTransferDisabled = FALSE;
        BlendPalettes(0xFFFFFFFF, 16, RGB_BLACK);
        ShowBg(0);
        ShowBg(1);
        ShowBg(2);
        ShowBg(3);
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJ_ON | DISPCNT_OBJ_1D_MAP);
        BerryCrush_SetVBlankCallback();
        game->cmdState = 0;
        return 1;
    }

    game->cmdState++;
    return 0;
}

int BerryCrush_TeardownBgs(void)
{
    struct BerryCrushGame * var0 = GetBerryCrushGame();
    if (!var0)
        return -1;

    switch (var0->cmdState)
    {
    case 0:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 1:
        if (!IsLinkTaskFinished())
            return 0;
        // fall through. The original author forgot to use "break" here
        // because this will call BeginNormalPaletteFade() twice.
    case 2:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        UpdatePaletteFade();
        break;
    case 3:
        if (UpdatePaletteFade())
            return 0;
        break;
    case 4:
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 32, 32);
        FillBgTilemapBufferRect_Palette0(1, 0, 0, 0, 32, 32);
        FillBgTilemapBufferRect_Palette0(2, 0, 0, 0, 32, 32);
        FillBgTilemapBufferRect_Palette0(3, 0, 0, 0, 32, 32);
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(3);
        break;
    case 5:
        FreeAllWindowBuffers();
        HideBg(0);
        UnsetBgTilemapBuffer(0);
        HideBg(1);
        UnsetBgTilemapBuffer(1);
        HideBg(2);
        UnsetBgTilemapBuffer(2);
        HideBg(3);
        UnsetBgTilemapBuffer(3);
        ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJ_ON | DISPCNT_OBJ_1D_MAP);
        break;
    case 6:
        DestroyWirelessStatusIndicatorSprite();
        sub_814EF10(var0);
        DigitObjUtil_Teardown();
        break;
    case 7:
        var0->cmdState = 0;
        return 1;
    }

    var0->cmdState++;
    return 0;
}

int sub_814D9CC(struct BerryCrushGame * game)
{
    gSpriteCoordOffsetY = game->depth + game->vibration;
    SetGpuReg(REG_OFFSET_BG1VOFS, -gSpriteCoordOffsetY);
    if (game->gameState == 7)
    {
        BerryCrush_PrintTimeOnSprites(&game->spritesManager, game->timer);
    }

    return 0;
}

void sub_814DA04(struct BerryCrushGame * game)
{
    game->depth = -104;
    game->vibration = 0;
    gSpriteCoordOffsetX = 0;
    gSpriteCoordOffsetY = -104;
}

void BerryCrush_CreateBerrySprites(struct BerryCrushGame * game, struct BerryCrushGame_138 * spritesManager)
{
    u8 i;
    u8 spriteId;
    s16 var0, var1;
    s16 *data;
    int var3;
    s16 var5;
    u32 var6;

    for (i = 0; i < game->playerCount; i++)
    {
        spriteId = AddItemIconObjectWithCustomObjectTemplate(
            &sSpriteTemplate_PlayerBerry,
            sPlayerBerrySpriteTags[i],
            sPlayerBerrySpriteTags[i],
            game->unk98[i].unkC + FIRST_BERRY_INDEX);
        spritesManager->berrySprites[i] = &gSprites[spriteId];
        spritesManager->berrySprites[i]->oam.priority = 3;
        spritesManager->berrySprites[i]->affineAnimPaused = TRUE;
        spritesManager->berrySprites[i]->pos1.x = spritesManager->seatCoords[i]->unk8 + 120;
        spritesManager->berrySprites[i]->pos1.y = -16;
        data = spritesManager->berrySprites[i]->data;
        var5 = 512;
        data[1] = var5;
        data[2] = 32;
        data[7] = 112;
        var0 = spritesManager->seatCoords[i]->unkA - spritesManager->seatCoords[i]->unk8;
        var3 = var0;
        if (var0 < 0)
            var3 += 3;

        data[6] = var3 >> 2;
        var0 *= 128;
        var6 = var5 + 32;
        var6 = var6 / 2;
        var1 = MathUtil_Div16Shift(7, 0x3F80, var6);
        data[0] = (u16)spritesManager->berrySprites[i]->pos1.x * 128;
        data[3] = MathUtil_Div16Shift(7, var0, var1);
        var1 = MathUtil_Mul16Shift(7, var1, 85);
        data[4] = 0;
        data[5] = MathUtil_Div16Shift(7, 0x3F80, var1);
        data[7] |= 0x8000;
        if (spritesManager->seatCoords[i]->unk8 < 0)
            StartSpriteAffineAnim(spritesManager->berrySprites[i], 1);
    }
}

void SpriteCB_DropBerryIntoCrusher(struct Sprite * sprite)
{
    s16 *data = sprite->data;

    data[1] += data[2];
    sprite->pos2.y += data[1] >> 8;
    if (data[7] & 0x8000)
    {
        sprite->data[0] += data[3];
        data[4] += data[5];
        sprite->pos2.x = Sin(data[4] >> 7, data[6]);
        if ((data[7] & 0x8000) && (data[4] >> 7) > 126)
        {
            sprite->pos2.x = 0;
            data[7] &= 0x7FFF;
        }
    }

    sprite->pos1.x = data[0] >> 7;
    if (sprite->pos1.y + sprite->pos2.y >= (data[7] & 0x7FFF))
    {
        sprite->callback = SpriteCallbackDummy;
        FreeSpriteOamMatrix(sprite);
        DestroySprite(sprite);
    }
}

void BerryCrushFreeBerrySpriteGfx(struct BerryCrushGame * arg0, UNUSED struct BerryCrushGame_138 * arg1)
{
    u8 i;
    for (i = 0; i < arg0->playerCount; i++)
    {
        FreeSpritePaletteByTag(sPlayerBerrySpriteTags[i]);
        FreeSpriteTilesByTag(sPlayerBerrySpriteTags[i]);
    }
}

void sub_814DC5C(struct BerryCrushGame * game, struct BerryCrushGame_138 * manager)
{
    u8 sp4;
    struct BerryCrushGame_4E * var4E;
    u8 i;
    u16 var, var2;

    sp4 = 0;
    var4E = (struct BerryCrushGame_4E *)&game->recvCmd;
    for (i = 0; i < game->playerCount; i++)
    {
        var = var4E->unkA >> (i * 3);
        var &= 7;
        if (var)
        {
            sp4++;
            if (var & 0x4)
                StartSpriteAnim(manager->impactSprites[i], 1);
            else
                StartSpriteAnim(manager->impactSprites[i], 0);

            manager->impactSprites[i]->invisible = FALSE;
            manager->impactSprites[i]->animPaused = FALSE;
            manager->impactSprites[i]->pos2.x = gUnknown_846F2D0[(var % 4) - 1][0];
            manager->impactSprites[i]->pos2.y = gUnknown_846F2D0[(var % 4) - 1][1];
        }
    }

    if (sp4 == 0)
    {
        game->unk25_2 = 0;
    }
    else
    {
        var = (u8)(game->timer % 3);
        var2 = var;
        for (i = 0; i < var4E->unkC * 2 + 3; i++)
        {
            if (manager->sparkleSprites[i]->invisible)
            {
                manager->sparkleSprites[i]->callback = sub_814F0D8;
                manager->sparkleSprites[i]->pos1.x = gUnknown_846F2D6[i][0] + 120;
                manager->sparkleSprites[i]->pos1.y = gUnknown_846F2D6[i][1] + 136 - (var * 4);
                manager->sparkleSprites[i]->pos2.x = gUnknown_846F2D6[i][0] + (gUnknown_846F2D6[i][0] / (var2 * 4));
                manager->sparkleSprites[i]->pos2.y = gUnknown_846F2D6[i][1];
                if (var4E->unk4_1)
                    StartSpriteAnim(manager->sparkleSprites[i], 1);
                else
                    StartSpriteAnim(manager->sparkleSprites[i], 0);

                var++;
                if (var > 3)
                    var = 0;
            }
        }

        if (game->unk25_2)
        {
            game->unk25_2 = 0;
        }
        else
        {
            if (sp4 == 1)
                PlaySE(SE_MUD_BALL);
            else
                PlaySE(SE_BREAKABLE_DOOR);

            game->unk25_2 = 1;
        }
    }
}

bool32 sub_814DE50(struct BerryCrushGame * arg0, struct BerryCrushGame_138 * arg1)
{
    u8 i;

    for (i = 0; i < arg0->playerCount; i++)
    {
        if (!arg1->impactSprites[i]->invisible)
            return FALSE;
    }

    for (i = 0; i < 11; i++)
    {
        if (!arg1->sparkleSprites[i]->invisible)
            return FALSE;
    }

    if (arg0->vibration != 0)
        arg0->vibration = 0;

    return TRUE;
}

static void FramesToMinSec(struct BerryCrushGame_138 * manager, u16 frames)
{
    u8 i = 0;
    u32 fractionalFrames = 0;
    s16 r3 = 0;

    manager->minutes = frames / 3600;
    manager->secondsInt = (frames % 3600) / 60;
    r3 = MathUtil_Mul16((frames % 60) << 8, 4);

    for (i = 0; i < 8; i++)
    {
        if ((r3 >> (7 - i)) & 1)
            fractionalFrames += sPressingSpeedConversionTable[i];
    }

    manager->secondsFrac = fractionalFrames / 1000000;
}

static void PrintTextCentered(u8 windowId, u8 left, u8 colorId, const u8 *string)
{
    left = (left * 4) - (GetStringWidth(2, string, -1) / 2u);
    AddTextPrinterParameterized3(windowId, 2, left, 0, sBerryCrushTextColorTable[colorId], 0, string);
}

static void PrintBerryCrushResultWindow(struct BerryCrushGame * game, u8 command, u8 x, u8 y)
{
    u8 i = 0;
    u8 linkPlayerId = 0;
    u8 linkIdToPrint = 0;
    u8 j;
    s32 score;
    u8 realX;
    struct BerryCrushGame_68 * bcPlayers = &game->unk68;
    s32 realX2;

    for (; i < game->playerCount; i++)
    {
        DynamicPlaceholderTextUtil_Reset();
        switch (command)
        {
        case 0:
            // Number of presses
            linkPlayerId = bcPlayers->unk20[command][i];
            if (i != 0 && bcPlayers->stats[command][i] != bcPlayers->stats[command][i - 1])
                linkIdToPrint = i;
            ConvertIntToDecimalStringN(gStringVar1, bcPlayers->stats[command][i], STR_CONV_MODE_RIGHT_ALIGN, 4);
            realX = x - GetStringWidth(2, sBCRankingHeaders[command], -1) - 4;
            AddTextPrinterParameterized3(game->spritesManager.unk82, 2, realX, y + 14 * i, sBerryCrushTextColorTable[0], 0, sBCRankingHeaders[command]);
            AddTextPrinterParameterized3(game->spritesManager.unk82, 2, realX - 24, y + 14 * i, sBerryCrushTextColorTable[0], 0, gStringVar1);
            break;
        case 1:
            // Neatness
            linkPlayerId = bcPlayers->unk20[command][i];
            if (i != 0 && bcPlayers->stats[command][i] != bcPlayers->stats[command][i - 1])
                linkIdToPrint = i;
            ConvertIntToDecimalStringN(gStringVar1, bcPlayers->stats[command][i] >> 4, STR_CONV_MODE_RIGHT_ALIGN, 3);
            score = 0;
            realX = bcPlayers->stats[command][i] & 15;
            for (j = 0; j < 4; j++)
            {
                if ((realX >> (3 - j)) & 1)
                    score += sPressingSpeedConversionTable[j];
            }
            realX = score / 1000000u;
            ConvertIntToDecimalStringN(gStringVar2, realX, STR_CONV_MODE_LEADING_ZEROS, 2);
            StringExpandPlaceholders(gStringVar4, sBCRankingHeaders[command]);
            realX2 = x - 4;
            AddTextPrinterParameterized3(game->spritesManager.unk82, 2, realX2 - GetStringWidth(2, gStringVar4, 0), y + 14 * i, sBerryCrushTextColorTable[0], 0, gStringVar4);
            break;
        case 2:
            // Berry names
            linkPlayerId = i;
            linkIdToPrint = i;
            j = game->unk98[i].unkC;
            if (j >= LAST_BERRY_INDEX - FIRST_BERRY_INDEX + 2)
                j = 0;
            StringCopy(gStringVar1, gBerries[j].name);
            StringExpandPlaceholders(gStringVar4, sBCRankingHeaders[command]);
            AddTextPrinterParameterized3(game->spritesManager.unk82, 2, x - GetStringWidth(2, gStringVar4, -1) - 4, y + 14 * i, sBerryCrushTextColorTable[0], 0, gStringVar4);
            break;
        }
        if (linkPlayerId == game->localId)
            StringCopy(gStringVar3, gText_1_ClrBluShdwLtBlu_Dynamic0);
        else
            StringCopy(gStringVar3, gText_1_Dynamic0);
        gStringVar3[0] = linkIdToPrint + CHAR_1;
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, game->unk98[linkPlayerId].unk0);
        DynamicPlaceholderTextUtil_ExpandPlaceholders(gStringVar4, gStringVar3);
        AddTextPrinterParameterized3(game->spritesManager.unk82, 2, 4, y + 14 * i, sBerryCrushTextColorTable[0], 0, gStringVar4);
    }
}

static void sub_814E32C(struct BerryCrushGame * game)
{
    u8 i = 0;
    u8 x = 0;
    u32 score = 0;
    struct BerryCrushGame_68 *players = &game->unk68;
    u8 y = GetWindowAttribute(game->spritesManager.unk82, WINDOW_HEIGHT) * 8 - 42;

    FramesToMinSec(&game->spritesManager, players->unk04);
    AddTextPrinterParameterized3(game->spritesManager.unk82, 2, 2, y, sBerryCrushTextColorTable[0], 0, gText_TimeColon);

    x = 190 - (u8)GetStringWidth(2, gText_SpaceSec, 0);
    AddTextPrinterParameterized3(game->spritesManager.unk82, 2, x, y, sBerryCrushTextColorTable[0], 0, gText_SpaceSec);

    x -= 32;
    ConvertIntToDecimalStringN(gStringVar1, game->spritesManager.secondsInt, STR_CONV_MODE_LEADING_ZEROS, 2);
    ConvertIntToDecimalStringN(gStringVar2, game->spritesManager.secondsFrac, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringExpandPlaceholders(gStringVar4, gText_XDotY2);
    AddTextPrinterParameterized3(game->spritesManager.unk82, 2, x, y, sBerryCrushTextColorTable[0], 0, gStringVar4);

    x -= (u8)GetStringWidth(2, gText_SpaceMin, 0) + 3;
    AddTextPrinterParameterized3(game->spritesManager.unk82, 2, x, y, sBerryCrushTextColorTable[0], 0, gText_SpaceMin);

    x -= 9;
    ConvertIntToDecimalStringN(gStringVar1, game->spritesManager.minutes, STR_CONV_MODE_LEADING_ZEROS, 1);
    StringExpandPlaceholders(gStringVar4, gText_StrVar1);
    AddTextPrinterParameterized3(game->spritesManager.unk82, 2, x, y, sBerryCrushTextColorTable[0], 0, gStringVar4);

    y += 14;
    AddTextPrinterParameterized3(game->spritesManager.unk82, 2, 2, y, sBerryCrushTextColorTable[0], 0, gText_PressingSpeed);

    x = 190 - (u8)GetStringWidth(2, gText_TimesPerSec, 0);
    AddTextPrinterParameterized3(game->spritesManager.unk82, 3, x, y, sBerryCrushTextColorTable[0], 0, gText_TimesPerSec);

    for (i = 0; i < 8; ++i)
        if (((u8)game->pressingSpeed >> (7 - i)) & 1)
            score += *(i + sPressingSpeedConversionTable); // It's accessed in a different way here for unknown reason
    ConvertIntToDecimalStringN(gStringVar1, game->pressingSpeed >> 8, STR_CONV_MODE_RIGHT_ALIGN, 3);
    ConvertIntToDecimalStringN(gStringVar2, score / 1000000, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringExpandPlaceholders(gStringVar4, gText_XDotY3);
    x -= 38;
    if (game->unk25_1)
        AddTextPrinterParameterized3(game->spritesManager.unk82, 2, x, y, sBerryCrushTextColorTable[5], 0, gStringVar4);
    else
        AddTextPrinterParameterized3(game->spritesManager.unk82, 2, x, y, sBerryCrushTextColorTable[0], 0, gStringVar4);

    y += 14;
    AddTextPrinterParameterized3(game->spritesManager.unk82, 2, 2, y, sBerryCrushTextColorTable[0], 0, gText_Silkiness);

    ConvertIntToDecimalStringN(gStringVar1, players->unk08, STR_CONV_MODE_RIGHT_ALIGN, 3);
    StringExpandPlaceholders(gStringVar4, gText_Var1Percent);
    x = 190 - (u8)GetStringWidth(2, gStringVar4, 0);
    AddTextPrinterParameterized3(game->spritesManager.unk82, 2, x, y, sBerryCrushTextColorTable[0], 0, gStringVar4);
}

bool32 sub_814E644(struct BerryCrushGame * game, struct BerryCrushGame_138 * spriteManager)
{
    u8 playerCountMinus2;
    struct WindowTemplate template;

    switch (spriteManager->unk80)
    {
    case 0:
        playerCountMinus2 = game->playerCount - 2;
        BerryCrush_HideTimerSprites(spriteManager);
        memcpy(&template, &gUnknown_846E428[game->gameState - 11], sizeof(struct WindowTemplate));
        if (game->gameState == 13)
            template.height = gUnknown_846E448[1][playerCountMinus2];
        else
            template.height = gUnknown_846E448[0][playerCountMinus2];
        spriteManager->unk82 = AddWindow(&template);
        break;
    case 1:
        PutWindowTilemap(spriteManager->unk82);
        FillWindowPixelBuffer(spriteManager->unk82, PIXEL_FILL(0));
        break;
    case 2:
        TextWindow_SetStdFrame0_WithPal(spriteManager->unk82, 0x21D, 0xD0);
        DrawStdFrameWithCustomTileAndPalette(spriteManager->unk82, FALSE, 541, 13);
        break;
    case 3:
        playerCountMinus2 = game->playerCount - 2;
        switch (game->gameState)
        {
        case 11:
            PrintTextCentered(spriteManager->unk82, 22, 3, gText_PressesRankings);
            PrintBerryCrushResultWindow(game, 0, 0xB0, 8 * gUnknown_846E448[0][playerCountMinus2] - game->playerCount * 14);
            spriteManager->unk80 = 5;
            return FALSE;
        case 12:
            PrintTextCentered(spriteManager->unk82, 22, 4, sBCRankingHeaders[game->unk68.unk20[0][7] + 3]);
            PrintBerryCrushResultWindow(game, 1, 0xB0, 8 * gUnknown_846E448[0][playerCountMinus2] - game->playerCount * 14);
            spriteManager->unk80 = 5;
            return FALSE;
        case 13:
            PrintTextCentered(spriteManager->unk82, 24, 3, gText_CrushingResults);
            PrintBerryCrushResultWindow(game, 2, 0xC0, 0x10);
            break;
        }
        break;
    case 4:
        sub_814E32C(game);
        break;
    case 5:
        CopyWindowToVram(spriteManager->unk82, COPYWIN_BOTH);
        spriteManager->unk80 = 0;
        return TRUE;
    }
    ++spriteManager->unk80;
    return FALSE;
}

void sub_814E80C(struct BerryCrushGame * game)
{
    ClearStdWindowAndFrameToTransparent(game->spritesManager.unk82, 1);
    RemoveWindow(game->spritesManager.unk82);
    sub_814EBB0(game);
}

static void Task_ShowBerryCrushRankings(u8 taskId)
{
    u8 i = 0, j, xPos, yPos;
    u32 score = 0;
    s16 *data = gTasks[taskId].data;
    u8 *str;

    switch (data[0])
    {
    case 0:
        data[1] = AddWindow(&sWindowTemplate_BerryCrushRankings);
        PutWindowTilemap(data[1]);
        FillWindowPixelBuffer(data[1], PIXEL_FILL(0));
        TextWindow_SetStdFrame0_WithPal(data[1], 0x21D, 0xD0);
        DrawStdFrameWithCustomTileAndPalette(data[1], 0, 0x21D, 0xD);
        break;
    case 1:
        xPos = 96 - GetStringWidth(2, gText_BerryCrush2, -1) / 2u;
        AddTextPrinterParameterized3(
            data[1],
            2,
            xPos,
            2,
            sBerryCrushTextColorTable[3],
            0,
            gText_BerryCrush2
        );
        xPos = 96 - GetStringWidth(2, gText_PressingSpeedRankings, -1) / 2u;
        AddTextPrinterParameterized3(
            data[1],
            2,
            xPos,
            18,
            sBerryCrushTextColorTable[3],
            0,
            gText_PressingSpeedRankings
        );
        yPos = 42;
        for (i = 0; i < 4; ++i)
        {
            ConvertIntToDecimalStringN(gStringVar1, i + 2, STR_CONV_MODE_LEFT_ALIGN, 1);
            StringExpandPlaceholders(gStringVar4, gText_Var1Players);
            AddTextPrinterParameterized3(
                data[1],
                2,
                4,
                yPos,
                sBerryCrushTextColorTable[0],
                0,
                gStringVar4
            );
            for (j = 0; j < 8; ++j)
            {
                if (((data[i + 2] & 0xFF) >> (7 - j)) & 1)
                    score += sPressingSpeedConversionTable[j];
            }
            ConvertIntToDecimalStringN(gStringVar1, (u16)data[i + 2] >> 8, STR_CONV_MODE_RIGHT_ALIGN, 3);
            ConvertIntToDecimalStringN(gStringVar2, score / 1000000, STR_CONV_MODE_LEADING_ZEROS, 2);
            str = StringExpandPlaceholders(gStringVar4, gText_XDotY3);
            *str++ = CHAR_SPACE;
            StringCopy(str, gText_TimesPerSec);
            xPos = 192 - (u8)GetStringWidth(3, gStringVar4, 0);
            AddTextPrinterParameterized3(
                data[1],
                3,
                xPos,
                yPos,
                sBerryCrushTextColorTable[0],
                0,
                gStringVar4
            );
            yPos += 14;
            score = 0;
        }
        CopyWindowToVram(data[1], COPYWIN_BOTH);
        break;
    case 2:
        if (gMain.newKeys & (A_BUTTON | B_BUTTON))
            break;
        else
            return;
    case 3:
        ClearStdWindowAndFrameToTransparent(data[1], 1);
        ClearWindowTilemap(data[1]);
        RemoveWindow(data[1]);
        DestroyTask(taskId);
        EnableBothScriptContexts();
        ScriptContext2_Disable();
        data[0] = 0;
        return;
    }
    ++data[0];
}

void ShowBerryCrushRankings(void)
{
    u8 taskId;

    ScriptContext2_Enable();
    taskId = CreateTask(Task_ShowBerryCrushRankings, 0);
    gTasks[taskId].data[2] = gSaveBlock2Ptr->berryCrush.berryCrushResults[0];
    gTasks[taskId].data[3] = gSaveBlock2Ptr->berryCrush.berryCrushResults[1];
    gTasks[taskId].data[4] = gSaveBlock2Ptr->berryCrush.berryCrushResults[2];
    gTasks[taskId].data[5] = gSaveBlock2Ptr->berryCrush.berryCrushResults[3];
}

static void BerryCrush_PrintTimeOnSprites(struct BerryCrushGame_138 * manager, u16 frames)
{
    FramesToMinSec(manager, frames);
    DigitObjUtil_PrintNumOn(0, manager->minutes);
    DigitObjUtil_PrintNumOn(1, manager->secondsInt);
    DigitObjUtil_PrintNumOn(2, manager->secondsFrac);
}

void BerryCrush_HideTimerSprites(struct BerryCrushGame_138 * manager)
{
    manager->timerSprites[0]->invisible = TRUE;
    manager->timerSprites[1]->invisible = TRUE;
    DigitObjUtil_HideOrShow(2, 1);
    DigitObjUtil_HideOrShow(1, 1);
    DigitObjUtil_HideOrShow(0, 1);
}

static void sub_814EB38(struct BerryCrushGame * game)
{
    u8 i;

    for (i = 0; i < game->playerCount; ++i)
    {
        game->spritesManager.seatCoords[i] = &gUnknown_846F294[gUnknown_846F280[game->playerCount - 2][i]];
        game->spritesManager.unk83[i] = AddWindow(&gUnknown_846E3F8[game->spritesManager.seatCoords[i]->unk0]);
        PutWindowTilemap(game->spritesManager.unk83[i]);
        FillWindowPixelBuffer(game->spritesManager.unk83[i], PIXEL_FILL(0));
    }
}

static void sub_814EBB0(struct BerryCrushGame * game)
{
    u8 i;

    for (i = 0; i < game->playerCount; ++i)
    {
        PutWindowTilemap(game->spritesManager.unk83[i]);
        if (i == game->localId)
        {
            AddTextPrinterParameterized4(
                game->spritesManager.unk83[i],
                2,
                36 - GetStringWidth(2, game->unk98[i].unk0, 0) / 2u,
                1,
                0,
                0,
                sBerryCrushTextColorTable[1],
                0,
                game->unk98[i].unk0
            );
        }
        else
        {
            AddTextPrinterParameterized4(
                game->spritesManager.unk83[i],
                2,
                36 - GetStringWidth(2, game->unk98[i].unk0, 0) / 2u,
                1,
                0,
                0,
                sBerryCrushTextColorTable[2],
                0,
                game->unk98[i].unk0
            );
        }
        CopyWindowToVram(game->spritesManager.unk83[i], COPYWIN_BOTH);
    }
    CopyBgTilemapBufferToVram(0);
}

static void sub_814EC80(struct BerryCrushGame * game)
{
    u8 i = 0;
    u8 *r4;

    LZ77UnCompWram(gUnknown_8EB0ADC, gDecompressionBuffer);
    for (r4 = gDecompressionBuffer; i < game->playerCount; ++i)
    {
        CopyToBgTilemapBufferRect(
            3,
            &r4[game->spritesManager.seatCoords[i]->unk0 * 40],
            game->spritesManager.seatCoords[i]->unk1,
            game->spritesManager.seatCoords[i]->unk2,
            10,
            2
        );
    }
    CopyBgTilemapBufferToVram(3);
}

static void sub_814ECE0(struct BerryCrushGame * game)
{
    u8 i = 0;
    u8 spriteId;

    game->depth = -104;
    game->vibration = 0;
    gSpriteCoordOffsetX = 0;
    gSpriteCoordOffsetY = -104;
    for (; i < 4; ++i)
        LoadCompressedSpriteSheet(&sSpriteSheets[i]);
    LoadSpritePalettes(sSpritePals);
    spriteId = CreateSprite(&sSpriteTemplate_BerryCrushCore, 120, 88, 5);
    game->spritesManager.coreSprite = &gSprites[spriteId];
    game->spritesManager.coreSprite->oam.priority = 3;
    game->spritesManager.coreSprite->coordOffsetEnabled = TRUE;
    game->spritesManager.coreSprite->animPaused = TRUE;
    for (i = 0; i < game->playerCount; ++i)
    {
        spriteId = CreateSprite(
            &sSpriteTemplate_BerryCrushImpact,
            game->spritesManager.seatCoords[i]->unk4 + 120,
            game->spritesManager.seatCoords[i]->unk6 + 32,
            0
        );
        game->spritesManager.impactSprites[i] = &gSprites[spriteId];
        game->spritesManager.impactSprites[i]->oam.priority = 1;
        game->spritesManager.impactSprites[i]->invisible = TRUE;
        game->spritesManager.impactSprites[i]->coordOffsetEnabled = TRUE;
        game->spritesManager.impactSprites[i]->animPaused = TRUE;
    }
    for (i = 0; i < NELEMS(game->spritesManager.sparkleSprites); ++i)
    {
        spriteId = CreateSprite(
            &sSpriteTemplate_BerryCrushPowderSparkles,
            gUnknown_846F2D6[i][0] + 120,
            gUnknown_846F2D6[i][1] + 136,
            6
        );
        game->spritesManager.sparkleSprites[i] = &gSprites[spriteId];
        game->spritesManager.sparkleSprites[i]->oam.priority = 3;
        game->spritesManager.sparkleSprites[i]->invisible = TRUE;
        game->spritesManager.sparkleSprites[i]->animPaused = TRUE;
        game->spritesManager.sparkleSprites[i]->data[0] = i;
    }
    for (i = 0; i < NELEMS(game->spritesManager.timerSprites); ++i)
    {
        spriteId = CreateSprite(
            &sSpriteTemplate_BerryCrushTimer,
            24 * i + 176,
            8,
            0
        );
        game->spritesManager.timerSprites[i] = &gSprites[spriteId];
        game->spritesManager.timerSprites[i]->oam.priority = 0;
        game->spritesManager.timerSprites[i]->invisible = FALSE;
        game->spritesManager.timerSprites[i]->animPaused = FALSE;
    }
    DigitObjUtil_CreatePrinter(0, 0, &sDigitObjTemplates[0]);
    DigitObjUtil_CreatePrinter(1, 0, &sDigitObjTemplates[1]);
    DigitObjUtil_CreatePrinter(2, 0, &sDigitObjTemplates[2]);
    if (game->gameState == 1)
            BerryCrush_HideTimerSprites(&game->spritesManager);
}

static void sub_814EF10(struct BerryCrushGame * r5)
{
    u8 r4 = 0;

    FreeSpriteTilesByTag(4);
    FreeSpriteTilesByTag(3);
    FreeSpriteTilesByTag(2);
    FreeSpriteTilesByTag(1);
    FreeSpritePaletteByTag(4);
    FreeSpritePaletteByTag(2);
    FreeSpritePaletteByTag(1);
    for (; r4 < NELEMS(r5->spritesManager.timerSprites); ++r4)
        DestroySprite(r5->spritesManager.timerSprites[r4]);
    DigitObjUtil_DeletePrinter(2);
    DigitObjUtil_DeletePrinter(1);
    DigitObjUtil_DeletePrinter(0);
    for (r4 = 0; r4 < NELEMS(r5->spritesManager.sparkleSprites); ++r4)
        DestroySprite(r5->spritesManager.sparkleSprites[r4]);
    for (r4 = 0; r4 < r5->playerCount; ++r4)
        DestroySprite(r5->spritesManager.impactSprites[r4]);
    if (r5->spritesManager.coreSprite->inUse)
        DestroySprite(r5->spritesManager.coreSprite);
}

static void SpriteCB_BerryCrushImpact(struct Sprite * sprite)
{
    if (sprite->animEnded)
    {
        sprite->invisible = TRUE;
        sprite->animPaused = TRUE;
    }
}

static void sub_814EFFC(struct Sprite * sprite)
{
    u8 r1 = 0;
    SpriteCallback r5 = SpriteCallbackDummy;

    for (; r1 < NELEMS(sprite->data); ++r1)
        sprite->data[r1] = 0;
    sprite->pos2.x = 0;
    sprite->pos2.y = 0;
    sprite->invisible = TRUE;
    sprite->animPaused = TRUE;
    sprite->callback = r5;
}

static void sub_814F044(struct Sprite * sprite)
{
    s16 *r4 = sprite->data;

    r4[1] += r4[2];
    sprite->pos2.y += r4[1] >> 8;
    if (r4[7] & 0x8000)
    {
        sprite->data[0] += r4[3];
        r4[4] += r4[5];
        sprite->pos2.x = Sin(r4[4] >> 7, r4[6]);
        if (r4[7] & 0x8000 && r4[4] >> 7 > 126)
        {
            sprite->pos2.x = 0;
            r4[7] &= 0x7FFF;
        }
    }
    sprite->pos1.x = r4[0] >> 7;
    if (sprite->pos1.y + sprite->pos2.y > (r4[7] & 0x7FFF))
        sprite->callback = sub_814EFFC;
}

static void sub_814F0D8(struct Sprite * sprite)
{
    s16 *r7 = sprite->data;
    s16 r4, r5;
    s32 r2;
    u32 r8 = 0;

    r2 = 640;
    r7[1] = r2;
    r7[2] = 32;
    r7[7] = 168;
    r4 = sprite->pos2.x * 128;
    r5 = MathUtil_Div16Shift(7, (168 - sprite->pos1.y) << 7, (r2 + 32) >> 1);
    sprite->data[0] = sprite->pos1.x << 7;
    r7[3] = MathUtil_Div16Shift(7, r4, r5);
    r2 = MathUtil_Mul16Shift(7, r5, 85);
    r7[4] = r8;
    r7[5] = MathUtil_Div16Shift(7, 0x3F80, r2);
    r7[6] = sprite->pos2.x / 4;
    r7[7] |= 0x8000;
    sprite->pos2.y = r8;
    sprite->pos2.x = r8;
    sprite->callback = sub_814F044;
    sprite->animPaused = FALSE;
    sprite->invisible = FALSE;
}
