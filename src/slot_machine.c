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

#define SLOT_IMAGE_7         0
#define SLOT_IMAGE_ROCKET    1
#define SLOT_IMAGE_PIKACHU   2
#define SLOT_IMAGE_PSYDUCK   3
#define SLOT_IMAGE_CHERRIES  4
#define SLOT_IMAGE_MAGNEMITE 5
#define SLOT_IMAGE_SHELLDER  6

#define SLOT_PAYOUT_NONE      0
#define SLOT_PAYOUT_CHERRIES2 1
#define SLOT_PAYOUT_CHERRIES3 2
#define SLOT_PAYOUT_MAGSHELL  3
#define SLOT_PAYOUT_PIKAPSY   4
#define SLOT_PAYOUT_ROCKET    5
#define SLOT_PAYOUT_7         6

#define ROWATTR_COL1POS 0
#define ROWATTR_COL2POS 1
#define ROWATTR_COL3POS 2
#define ROWATTR_MINBET  3

#define SLOTTASK_GFX_INIT            0
#define SLOTTASK_FADEOUT_EXIT        1
#define SLOTTASK_UPDATE_LINE_LIGHTS  2
#define SLOTTASK_CLEFAIRY_BOUNCE     3
#define SLOTTASK_ANIM_WIN            4
#define SLOTTASK_END_ANIM_WIN        5
#define SLOTTASK_ANIM_LOSE           6
#define SLOTTASK_ANIM_BETTING        7
#define SLOTTASK_SHOW_AMOUNTS        8
#define SLOTTASK_MSG_NO_COINS        9
#define SLOTTASK_ASK_QUIT           10
#define SLOTTASK_DESTROY_YESNO      11
#define SLOTTASK_PRESS_BUTTON       12
#define SLOTTASK_RELEASE_BUTTONS    13
#define SLOTTASK_SHOWHELP           14
#define SLOTTASK_HIDEHELP           15

struct SlotMachineState
{
    MainCallback savedCallback;
    u16 machineidx;
    u16 currentReel;
    u16 machineBias;
    u16 slotRewardClass;
    u16 biasCooldown;
    u16 bet;
    u8 taskId;
    u8 spinReelsTaskId;
    bool32 reelIsSpinning[3];
    s16 reelPositions[3];
    s16 reelSubpixel[3];
    s16 destReelPos[3];
    s16 reelStopOrder[3];
    u32 reel2BiasInPlay;
    bool32 winFlags[5];
    u16 payout;
};

struct SlotMachineGfxManager
{
    u32 field_00[3];
    struct Sprite *reelIconSprites[3][5];
    struct Sprite *creditDigitSprites[4];
    struct Sprite *payoutDigitSprites[4];
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
    u16 buttonPressedTiles[3][4];
    u16 buttonReleasedTiles[3][4];
    u8 field_005C[0x800];
    u8 bg0TilemapBuffer[0x800];
    u8 bg1TilemapBuffer[0x800];
    u8 bg2TilemapBuffer[0x800];
    u8 bg3TilemapBuffer[0x800];
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

static const u8 sThirdReelBiasCheckIndices[][3] = {
    {0x00, 0x03, 0x06}, // top row
    {0x01, 0x04, 0x07}, // middle row
    {0x02, 0x05, 0x08}, // bottom row
    {0x00, 0x04, 0x08}, // tl-br
    {0x02, 0x04, 0x06}  // bl-tr
};

static const u8 sRowAttributes[][4] = {
    {0x00, 0x04, 0x08, 0x03}, // tl-br
    {0x00, 0x03, 0x06, 0x02}, // top row
    {0x01, 0x04, 0x07, 0x01}, // middle row
    {0x02, 0x05, 0x08, 0x02}, // bottom row
    {0x02, 0x04, 0x06, 0x03}  // bl-tr
};

static const u16 sReelBiasChances[][7] = {
    {0x1fa1, 0x2eab, 0x3630, 0x39f3, 0x3bd4, 0x3bfc, 0x0049},
    {0x1f97, 0x2ea2, 0x3627, 0x39e9, 0x3bca, 0x3bf8, 0x0049},
    {0x1f91, 0x2e9b, 0x3620, 0x39e3, 0x3bc4, 0x3bf4, 0x0049},
    {0x1f87, 0x2e92, 0x3617, 0x39d9, 0x3bba, 0x3bef, 0x0050},
    {0x1f7f, 0x2e89, 0x360e, 0x39d1, 0x3bb2, 0x3bea, 0x0050},
    {0x1fc9, 0x2efc, 0x3696, 0x3a63, 0x3c49, 0x3c8b, 0x0073},
};

static const u8 sReelIconAnimByReelAndPos[][21] = {
    {
        SLOT_IMAGE_7,
        SLOT_IMAGE_PSYDUCK,
        SLOT_IMAGE_CHERRIES,
        SLOT_IMAGE_ROCKET,
        SLOT_IMAGE_PIKACHU,
        SLOT_IMAGE_SHELLDER,
        SLOT_IMAGE_PIKACHU,
        SLOT_IMAGE_MAGNEMITE,
        SLOT_IMAGE_7,
        SLOT_IMAGE_SHELLDER,
        SLOT_IMAGE_PSYDUCK,
        SLOT_IMAGE_ROCKET,
        SLOT_IMAGE_CHERRIES,
        SLOT_IMAGE_PIKACHU,
        SLOT_IMAGE_SHELLDER,
        SLOT_IMAGE_7,
        SLOT_IMAGE_MAGNEMITE,
        SLOT_IMAGE_PIKACHU,
        SLOT_IMAGE_ROCKET,
        SLOT_IMAGE_SHELLDER,
        SLOT_IMAGE_PIKACHU
    }, {
        SLOT_IMAGE_7,
        SLOT_IMAGE_MAGNEMITE,
        SLOT_IMAGE_CHERRIES,
        SLOT_IMAGE_PSYDUCK,
        SLOT_IMAGE_ROCKET,
        SLOT_IMAGE_MAGNEMITE,
        SLOT_IMAGE_CHERRIES,
        SLOT_IMAGE_PSYDUCK,
        SLOT_IMAGE_PIKACHU,
        SLOT_IMAGE_MAGNEMITE,
        SLOT_IMAGE_CHERRIES,
        SLOT_IMAGE_PSYDUCK,
        SLOT_IMAGE_7,
        SLOT_IMAGE_MAGNEMITE,
        SLOT_IMAGE_CHERRIES,
        SLOT_IMAGE_ROCKET,
        SLOT_IMAGE_PSYDUCK,
        SLOT_IMAGE_SHELLDER,
        SLOT_IMAGE_MAGNEMITE,
        SLOT_IMAGE_PSYDUCK,
        SLOT_IMAGE_CHERRIES
    }, {
        SLOT_IMAGE_7,
        SLOT_IMAGE_PSYDUCK,
        SLOT_IMAGE_SHELLDER,
        SLOT_IMAGE_MAGNEMITE,
        SLOT_IMAGE_PIKACHU,
        SLOT_IMAGE_PSYDUCK,
        SLOT_IMAGE_SHELLDER,
        SLOT_IMAGE_MAGNEMITE,
        SLOT_IMAGE_PIKACHU,
        SLOT_IMAGE_PSYDUCK,
        SLOT_IMAGE_MAGNEMITE,
        SLOT_IMAGE_SHELLDER,
        SLOT_IMAGE_PIKACHU,
        SLOT_IMAGE_PSYDUCK,
        SLOT_IMAGE_MAGNEMITE,
        SLOT_IMAGE_SHELLDER,
        SLOT_IMAGE_PIKACHU,
        SLOT_IMAGE_PSYDUCK,
        SLOT_IMAGE_MAGNEMITE,
        SLOT_IMAGE_SHELLDER,
        SLOT_IMAGE_ROCKET
    },
};

static const u16 sPayoutTable[] = {
    [SLOT_PAYOUT_NONE]      =   0,
    [SLOT_PAYOUT_CHERRIES2] =   2,
    [SLOT_PAYOUT_CHERRIES3] =   6,
    [SLOT_PAYOUT_MAGSHELL]  =   8,
    [SLOT_PAYOUT_PIKAPSY]   =  15,
    [SLOT_PAYOUT_ROCKET]    = 100,
    [SLOT_PAYOUT_7]         = 300
};

static const u16 sSpritePal_ReelIcons_0[] = INCBIN_U16("graphics/slot_machine/unk_8464974.gbapal");
static const u16 sSpritePal_ReelIcons_1[] = INCBIN_U16("graphics/slot_machine/unk_8464994.gbapal");
static const u16 sSpritePal_ReelIcons_2[] = INCBIN_U16("graphics/slot_machine/unk_84649b4.gbapal");
static const u16 sSpritePal_ReelIcons_3[] = INCBIN_U16("graphics/slot_machine/unk_84649d4.gbapal");
static const u16 sSpritePal_ReelIcons_4[] = INCBIN_U16("graphics/slot_machine/unk_84649f4.gbapal");
#if defined(FIRERED)
static const u32 sSpriteTiles_ReelIcons[] = INCBIN_U32("graphics/slot_machine/unk_8464a14.4bpp.lz");
static const u16 sSpritePal_Clefairy[] = INCBIN_U16("graphics/slot_machine/unk_846506c.gbapal");
static const u32 sSpriteTiles_Clefairy[] = INCBIN_U32("graphics/slot_machine/unk_846506c.4bpp.lz");
#elif defined(LEAFGREEN)
static const u32 sSpriteTiles_ReelIcons[] = INCBIN_U32("graphics/slot_machine/unk_lg_8464434.4bpp.lz");
static const u16 sSpritePal_Clefairy[] = INCBIN_U16("graphics/slot_machine/unk_lg_8464a3c.gbapal");
static const u32 sSpriteTiles_Clefairy[] = INCBIN_U32("graphics/slot_machine/unk_lg_8464a3c.4bpp.lz");
#endif
static const u16 sSpritePal_Digits[] = INCBIN_U16("graphics/slot_machine/unk_8465524.gbapal");
static const u32 sSpriteTiles_Digits[] = INCBIN_U32("graphics/slot_machine/unk_8465544.4bpp.lz");

static const struct CompressedSpriteSheet sSpriteSheets[] = {
    {(const void *)sSpriteTiles_ReelIcons, 0xe00, 0},
    {(const void *)sSpriteTiles_Clefairy,  0xc00, 1},
    {(const void *)sSpriteTiles_Digits,    0x280, 2},
};

static const struct SpritePalette sSpritePalettes[] = {
    {sSpritePal_ReelIcons_0, 0},
    {sSpritePal_ReelIcons_1, 1},
    {sSpritePal_ReelIcons_2, 2},
    {sSpritePal_ReelIcons_3, 3},
    {sSpritePal_ReelIcons_4, 4},
    {sSpritePal_Clefairy,    5},
    {sSpritePal_Digits,      6},
    {NULL}
};

#if defined(FIRERED)
static const u16 sReelIconPaletteTags[] = {
    [SLOT_IMAGE_7]         = 2,
    [SLOT_IMAGE_ROCKET]    = 2,
    [SLOT_IMAGE_PIKACHU]   = 0,
    [SLOT_IMAGE_PSYDUCK]   = 0,
    [SLOT_IMAGE_CHERRIES]  = 2,
    [SLOT_IMAGE_MAGNEMITE] = 4,
    [SLOT_IMAGE_SHELLDER]  = 3
};
#elif defined(LEAFGREEN)
static const u16 sReelIconPaletteTags[] = {
    [SLOT_IMAGE_7]         = 2,
    [SLOT_IMAGE_ROCKET]    = 2,
    [SLOT_IMAGE_PIKACHU]   = 0,
    [SLOT_IMAGE_PSYDUCK]   = 3,
    [SLOT_IMAGE_CHERRIES]  = 2,
    [SLOT_IMAGE_MAGNEMITE] = 1,
    [SLOT_IMAGE_SHELLDER]  = 1
};
#endif

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
    sAnimCmd_ReelIcon_7,
    sAnimCmd_ReelIcon_Rocket,
    sAnimCmd_ReelIcon_Pikachu,
    sAnimCmd_ReelIcon_Psyduck,
    sAnimCmd_ReelIcon_Cherries,
    sAnimCmd_ReelIcon_Magnemite,
    sAnimCmd_ReelIcon_Shellder,
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
    .tileTag = 0,
    .paletteTag = 0,
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
    .tileTag = 2,
    .paletteTag = 6,
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
    .tileTag = 1,
    .paletteTag = 5,
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
static const u16 sBgPal_00[] = INCBIN_U16("graphics/slot_machine/unk_8465930.gbapal");
static const u16 sBgPal_10[] = INCBIN_U16("graphics/slot_machine/unk_8465950.gbapal");
static const u16 sBgPal_20[] = INCBIN_U16("graphics/slot_machine/unk_8465970.gbapal");
static const u16 sBgPal_30[] = INCBIN_U16("graphics/slot_machine/unk_8465990.gbapal");
static const u16 sBgPal_40[] = INCBIN_U16("graphics/slot_machine/unk_84659b0.gbapal");
static const u32 sBg2Tiles_00[] = INCBIN_U32("graphics/slot_machine/unk_84659d0.4bpp.lz");
static const u32 sBg2Map[] = INCBIN_U32("graphics/slot_machine/unk_84661d4.bin.lz");
static const u16 sBgPal_50[] = INCBIN_U16("graphics/slot_machine/unk_84664bc.gbapal");
static const u16 sBgPal_VictoryFlash[] = INCBIN_U16("graphics/slot_machine/unk_84664dc.gbapal","graphics/slot_machine/unk_84664fc.gbapal", "graphics/slot_machine/unk_846651c.gbapal");
#elif defined(LEAFGREEN)
static const u16 sBgPal_00[] = INCBIN_U16("graphics/slot_machine/unk_lg_84652bc.gbapal");
static const u16 sBgPal_10[] = INCBIN_U16("graphics/slot_machine/unk_lg_84652dc.gbapal");
static const u16 sBgPal_20[] = INCBIN_U16("graphics/slot_machine/unk_lg_84652fc.gbapal");
static const u16 sBgPal_30[] = INCBIN_U16("graphics/slot_machine/unk_lg_846531c.gbapal");
static const u16 sBgPal_40[] = INCBIN_U16("graphics/slot_machine/unk_lg_846533c.gbapal");
static const u32 sBg2Tiles_00[] = INCBIN_U32("graphics/slot_machine/unk_lg_846535c.4bpp.lz");
static const u32 sBg2Map[] = INCBIN_U32("graphics/slot_machine/unk_lg_8465ab8.bin.lz");
static const u16 sBgPal_50[] = INCBIN_U16("graphics/slot_machine/unk_lg_8465d9c.gbapal");
static const u16 sBgPal_VictoryFlash[] = INCBIN_U16("graphics/slot_machine/unk_lg_8465dbc.gbapal","graphics/slot_machine/unk_lg_8465ddc.gbapal", "graphics/slot_machine/unk_lg_8465dfc.gbapal");
#endif
static const u32 sBg2Tiles_C0[] = INCBIN_U32("graphics/slot_machine/unk_846653c.4bpp.lz");
static const u16 sBgPal_70[] = INCBIN_U16("graphics/slot_machine/unk_84665c0.gbapal");
static const u16 sBgPal_80[] = INCBIN_U16("graphics/slot_machine/unk_84665e0.gbapal");
static const u16 sBgPal_90[] = INCBIN_U16("graphics/slot_machine/unk_8466600.gbapal");
#if defined(FIRERED)
static const u32 sBg1Tiles[] = INCBIN_U32("graphics/slot_machine/unk_8466620.4bpp.lz");
static const u32 sBg1Map[] = INCBIN_U32("graphics/slot_machine/unk_8466998.bin.lz");
#elif defined(LEAFGREEN)
static const u32 sBg1Tiles[] = INCBIN_U32("graphics/slot_machine/unk_lg_8465f00.4bpp.lz");
static const u32 sBg1Map[] = INCBIN_U32("graphics/slot_machine/unk_lg_8466278.bin.lz");
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
        .paletteNum = 0x0f,
        .baseBlock = 0x04f
    }, {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 0,
        .width = 30,
        .height = 2,
        .paletteNum = 0x0e,
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

static const struct LineStateTileIdxList sLineStateTileIdxs[] = {
    { sLineTiles_TLBR, NELEMS(sLineTiles_TLBR) },
    { sLineTiles_TopRow, NELEMS(sLineTiles_TopRow) },
    { sLineTiles_MiddleRow, NELEMS(sLineTiles_MiddleRow) },
    { sLineTiles_BottomRow, NELEMS(sLineTiles_BottomRow) },
    { sLineTiles_BLTR, NELEMS(sLineTiles_BLTR) }
};

static const u8 sWInningLineFlashPalIdxs[2] = {2, 4};

static const struct WindowTemplate sYesNoWindowTemplate = {
    .bg = 0,
    .tilemapLeft = 19,
    .tilemapTop = 9,
    .width = 6,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x9F
};

static const u16 sReelButtonMapTileIdxs[][4] = {
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
        if (machineIdx > 5)
            machineIdx = 0;
        sSlotMachineState->machineidx = machineIdx;
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
    for (i = 0; i < 3; i++)
    {
        sSlotMachineState->reelIsSpinning[i] = FALSE;
        sSlotMachineState->reelPositions[i]  =     0;
        sSlotMachineState->reelSubpixel[i]   =     0;
        sSlotMachineState->destReelPos[i]    =    21;
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
            if (sSlotMachineState->currentReel >= 3)
            {
                sSlotMachineState->slotRewardClass = CalcPayout();
                sSlotMachineState->bet = 0;
                sSlotMachineState->currentReel = 0;
                if (sSlotMachineState->slotRewardClass == SLOT_PAYOUT_NONE)
                    SetMainTask(MainTask_DarnNoPayout);
                else
                {
                    if (sSlotMachineState->slotRewardClass == SLOT_PAYOUT_7)
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
        if (sSlotMachineState->slotRewardClass == SLOT_PAYOUT_ROCKET || sSlotMachineState->slotRewardClass == SLOT_PAYOUT_7)
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

    for (i = 0; i < 3; i++)
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
                        sSlotMachineState->reelPositions[i] = 20;
                }
                if (sSlotMachineState->reelPositions[i] != sSlotMachineState->destReelPos[i])
                    continue;
            }
            sSlotMachineState->destReelPos[i] = 21;
            sSlotMachineState->reelIsSpinning[i] = FALSE;
        }
    }
    UpdateReelIconSprites(sSlotMachineState->reelPositions, sSlotMachineState->reelSubpixel);
}

static void StartReels(void)
{
    s32 i;

    for (i = 0; i < 3; i++)
    {
        sSlotMachineState->reelIsSpinning[i] = TRUE;
    }
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
            position = 20;
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
                if (destPos >= 21)
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
            if (destPos >= 21)
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
                destPos = 20;
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
        destPos += 21;
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
    if (firstStoppedReelPos >= 21)
        firstStoppedReelPos = 0;
    nextPos = GetNextReelPosition(whichReel);
    pos = nextPos + 1;
    if (pos >= 21)
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
            pos = 20;
    }
    if (numPossiblePositions == 0)
    {
        sSlotMachineState->reel2BiasInPlay = 0;
        if (sSlotMachineState->machineBias == SLOT_PAYOUT_ROCKET || sSlotMachineState->machineBias == SLOT_PAYOUT_7)
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
        pos += 21;
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
        if (sSlotMachineState->machineBias == SLOT_PAYOUT_ROCKET || sSlotMachineState->machineBias == SLOT_PAYOUT_7)
            pos = 4;
        else
            pos = 0;
    }
    else
        pos = possiblePositions[0];
    pos = nextPos - pos;
    if (pos < 0)
        pos += 21;
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
        if (reel0pos >= 21)
            reel0pos = 0;
        reel1pos++;
        if (reel1pos >= 21)
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
    if (firstStoppedPos >= 21)
        firstStoppedPos = 0;
    if (secondStoppedPos >= 21)
        secondStoppedPos = 0;
    if (reelPos >= 21)
        reelPos = 0;
    for (i = 0; i < 3; i++)
    {
        icons[sSlotMachineState->reelStopOrder[0] * 3 + i] = sReelIconAnimByReelAndPos[sSlotMachineState->reelStopOrder[0]][firstStoppedPos];
        icons[sSlotMachineState->reelStopOrder[1] * 3 + i] = sReelIconAnimByReelAndPos[sSlotMachineState->reelStopOrder[1]][secondStoppedPos];
        icons[reelId * 3 + i] = sReelIconAnimByReelAndPos[reelId][reelPos];
        if (++firstStoppedPos >= 21)
            firstStoppedPos = 0;
        if (++secondStoppedPos >= 21)
            secondStoppedPos = 0;
        if (++reelPos >= 21)
            reelPos = 0;
    }
    switch (biasIcon)
    {
    case SLOT_PAYOUT_NONE:
        for (i = 0; i < 3; i++)
        {
            if (TestReelIconAttribute(1, icons[i]))
                return FALSE;
        }
        for (i = 0; i < 5; i++)
        {
            if (icons[sThirdReelBiasCheckIndices[i][0]] == icons[sThirdReelBiasCheckIndices[i][1]] && icons[sThirdReelBiasCheckIndices[i][0]] == icons[sThirdReelBiasCheckIndices[i][2]])
                return FALSE;
        }
        return TRUE;
    case SLOT_PAYOUT_CHERRIES2:
        for (i = 0; i < 5; i++)
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
    case SLOT_PAYOUT_CHERRIES3:
        for (i = 0; i < 5; i++)
        {
            if (icons[sThirdReelBiasCheckIndices[i][0]] == icons[sThirdReelBiasCheckIndices[i][1]] && TestReelIconAttribute(biasIcon, icons[sThirdReelBiasCheckIndices[i][0]]))
                return TRUE;
        }
        return FALSE;
    }
    for (i = 0; i < 5; i++)
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
    case SLOT_PAYOUT_NONE:
        return icon ^ 4 ? TRUE : FALSE;
    case SLOT_PAYOUT_CHERRIES2:
    case SLOT_PAYOUT_CHERRIES3:
        return icon == SLOT_IMAGE_CHERRIES ? TRUE : FALSE;
    case SLOT_PAYOUT_MAGSHELL:
        return icon == SLOT_IMAGE_MAGNEMITE || icon == SLOT_IMAGE_SHELLDER ? TRUE : FALSE;
    case SLOT_PAYOUT_PIKAPSY:
        return icon == SLOT_IMAGE_PIKACHU || icon == SLOT_IMAGE_PSYDUCK ? TRUE : FALSE;
    case SLOT_PAYOUT_ROCKET:
        return icon == SLOT_IMAGE_ROCKET ? TRUE : FALSE;
    case SLOT_PAYOUT_7:
        return icon == SLOT_IMAGE_7 ? TRUE : FALSE;
    default:
        return FALSE;
    }
}

static u8 ReelIconToPayoutRank(s32 iconId)
{
    switch (iconId)
    {
    default:
    case SLOT_IMAGE_CHERRIES:
        return SLOT_PAYOUT_CHERRIES2;
    case SLOT_IMAGE_MAGNEMITE:
    case SLOT_IMAGE_SHELLDER:
        return SLOT_PAYOUT_MAGSHELL;
    case SLOT_IMAGE_PIKACHU:
    case SLOT_IMAGE_PSYDUCK:
        return SLOT_PAYOUT_PIKAPSY;
    case SLOT_IMAGE_ROCKET:
        return SLOT_PAYOUT_ROCKET;
    case SLOT_IMAGE_7:
        return SLOT_PAYOUT_7;
    }
}

static void CalcSlotBias(void)
{
    u16 rval = Random() / 4;
    s32 i;
    const u16 * biasChances = sReelBiasChances[sSlotMachineState->machineidx];
    for (i = 0; i < 6; i++)
    {
        if (rval < biasChances[i])
            break;
    }
    if (sSlotMachineState->machineBias < SLOT_PAYOUT_ROCKET)
    {
        if (sSlotMachineState->biasCooldown == 0)
        {
            if ((Random() & 0x3FFF) < biasChances[SLOT_PAYOUT_7])
                sSlotMachineState->biasCooldown = (Random() & 1) ? 5 : 60;
        }
        if (sSlotMachineState->biasCooldown != 0)
        {
            if (i == 0 && (Random() & 0x3FFF) < 0x2CCC) // 70%
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

    for (i = 0; i < 5; i++)
        sSlotMachineState->winFlags[i] = FALSE;

    bestMatch = 0;
    reel1pos = sSlotMachineState->reelPositions[0];
    reel2pos = sSlotMachineState->reelPositions[1];
    reel3pos = sSlotMachineState->reelPositions[2];

    for (i = 0; i < 3; i++)
    {
        reel1pos++;
        if (reel1pos >= 21)
            reel1pos = 0;
        reel2pos++;
        if (reel2pos >= 21)
            reel2pos = 0;
        reel3pos++;
        if (reel3pos >= 21)
            reel3pos = 0;
        visibleIcons[0 * 3 + i] = sReelIconAnimByReelAndPos[0][reel1pos];
        visibleIcons[1 * 3 + i] = sReelIconAnimByReelAndPos[1][reel2pos];
        visibleIcons[2 * 3 + i] = sReelIconAnimByReelAndPos[2][reel3pos];
    }
    sSlotMachineState->payout = 0;
    for (i = 0; i < 5; i++)
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

static bool32 GetWinFlagByLine(int a0)
{
    return sSlotMachineState->winFlags[a0];
}

static bool32 LoadSpriteGraphicsAndAllocateManager(void)
{
    s32 i;

    for (i = 0; i < NELEMS(sSpriteSheets); i++)
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

    for (i = 0; i < 3; i++)
    {
        manager->field_00[i] = 0;
        for (j = 0; j < 5; j++)
        {
            manager->reelIconSprites[i][j] = NULL;
        }
    }
}

static void CreateReelIconSprites(void)
{
    struct Sprite *sprite;
    s32 i, j;
    s32 spriteId;
    s32 animId;
    for (i = 0; i < 3; i++)
    {
        for (j = 0; j < 5; j++)
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

    for (i = 0; i < 3; i++)
    {
        reelPos = *reelPosPtr;
        ypos = *yposPtr * 8;
        for (j = 0; j < 5; j++)
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
            if (reelPos >= 21)
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

    for (i = 0; i < 4; i++)
    {
        spriteId = CreateSprite(&sSpriteTemplate_Digits, 0x55 + 7 * i, 30, 0);
        sSlotMachineGfxManager->creditDigitSprites[i] = &gSprites[spriteId];
        spriteId = CreateSprite(&sSpriteTemplate_Digits, 0x85 + 7 * i, 30, 0);
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

    for (i = 0; i < 4; i++)
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
    s32 spriteId;

    spriteId = CreateSprite(&sSpriteTemplate_Clefairy, 0x10, 0x88, 1);
    sSlotMachineGfxManager->clefairySprites[0] = &gSprites[spriteId];
    spriteId = CreateSprite(&sSpriteTemplate_Clefairy, 0xE0, 0x88, 1);
    sSlotMachineGfxManager->clefairySprites[1] = &gSprites[spriteId];
    sSlotMachineGfxManager->clefairySprites[1]->hFlip = TRUE;
}

static void SetClefairySpriteAnim(u8 animId)
{
    s32 i;
    for (i = 0; i < 2; i++)
    {
        StartSpriteAnim(sSlotMachineGfxManager->clefairySprites[i], animId);
    }
}

static bool32 CreateSlotMachine(void)
{
    s32 i;

    struct SlotMachineSetupTaskData * ptr = Alloc(sizeof(struct SlotMachineSetupTaskData));
    if (ptr == NULL)
        return FALSE;
    for (i = 0; i < 8; i++)
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

    for (i = 0; i < 8; i++)
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

static inline void LoadColor(u16 color, u16 *pal)
{
    *pal = color;
    LoadPalette(pal, 0x00, 0x02);
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
        InitBgsFromTemplates(0, sBgTemplates, NELEMS(sBgTemplates));
        InitWindows(sWindowTemplates);

        SetBgTilemapBuffer(3, ptr->bg3TilemapBuffer);
        FillBgTilemapBufferRect_Palette0(3, 0, 0, 0, 32, 32);
        CopyBgTilemapBufferToVram(3);

        ResetTempTileDataBuffers();
        DecompressAndCopyTileDataToVram(2, sBg2Tiles_00, 0, 0x00, 0);
        DecompressAndCopyTileDataToVram(2, sBg2Tiles_C0, 0, 0xC0, 0);
        SetBgTilemapBuffer(2, ptr->bg2TilemapBuffer);
        CopyToBgTilemapBuffer(2, sBg2Map, 0, 0x00);
        CopyBgTilemapBufferToVram(2);
        LoadPalette(sBgPal_00, 0x00, 0xA0);
        LoadPalette(sBgPal_50, 0x50, 0x20);
        LoadPalette(sBgPal_70, 0x70, 0x60);
        LoadColor(RGB(30, 30, 31), pal);
        LoadUserWindowBorderGfx(0, 0x00A, 0xD0);
        DrawWindowBorderWithStdpal3(0, 0x001, 0xF0);

        SetBgTilemapBuffer(0, ptr->bg0TilemapBuffer);
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 2, 32, 30);
        DecompressAndCopyTileDataToVram(1, sBg1Tiles, 0, 0, 0);
        DecompressAndCopyTileDataToVram(1, sBg1Map, 0, 0, 1);
        CopyBgTilemapBufferToVram(1);

        LoadPalette(stdpal_get(2), 0xE0, 0x20);
        FillWindowPixelBuffer(1, 0xFF);
        PutWindowTilemap(1);

        x = 236 - GetStringWidth(FONT_0, gString_SlotMachineControls, 0);
        textColor[0] = TEXT_DYNAMIC_COLOR_6;
        textColor[1] = TEXT_COLOR_WHITE;
        textColor[2] = TEXT_COLOR_DARK_GRAY;
        AddTextPrinterParameterized3(1, FONT_0, x, 0, textColor, 0, gString_SlotMachineControls);
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
    AddTextPrinterParameterized5(0, FONT_2, str, 1, 2, TEXT_SKIP_DRAW, NULL, 1, 2);
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
        SetLineState(bgTilemapBuffer, 0, 4);
        SetLineState(bgTilemapBuffer, 1, 4);
        SetLineState(bgTilemapBuffer, 2, 4);
        SetLineState(bgTilemapBuffer, 3, 4);
        SetLineState(bgTilemapBuffer, 4, 4);
        break;
    case 3:
        SetLineState(bgTilemapBuffer, 0, 5);
        SetLineState(bgTilemapBuffer, 4, 5);
    case 2:
        SetLineState(bgTilemapBuffer, 1, 5);
        SetLineState(bgTilemapBuffer, 3, 5);
    case 1:
        SetLineState(bgTilemapBuffer, 2, 5);
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
        LoadPalette(sBgPal_50, 0x60, 0x20);
        for (i = 0; i < 5; i++)
        {
            if (GetWinFlagByLine(i))
                SetLineState(GetBgTilemapBuffer(2), i, 6);
        }
        CopyBgTilemapBufferToVram(2);
        data[0]++;
        break;
    case 1:
        if (data[1] == 0)
        {
            u16 y = gSineTable[data[2]] >> 7;
            LoadPalette(&sBgPal_VictoryFlash[16 * y], 0x10, 0x20);
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
            BlendPalettes(0x00000040, data[5], RGB_BLACK);
        }
        else
        {
            data[4]++;
            if (data[4] > 1)
            {
                data[4] = 0;
                data[5]++;
                data[5] &= 1;
                BlendPalettes(0x00000040, data[5] * 8, RGB_BLACK);
            }
        }

        for (i = 0; i < NELEMS(sWInningLineFlashPalIdxs); i++)
        {
            gPlttBufferFaded[sWInningLineFlashPalIdxs[i] + 0x60] = gPlttBufferUnfaded[sWInningLineFlashPalIdxs[i] + 0x60];
        }
        break;
    case 2:
        for (i = 0; i < 5; i++)
        {
            if (GetWinFlagByLine(i))
                SetLineState(GetBgTilemapBuffer(2), i, 4);
        }
        LoadPalette(sBgPal_10, 0x10, 0x20);
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
    CreateYesNoMenu(&sYesNoWindowTemplate, FONT_2, 0, 2, 10, 13, cursorPos);
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

    for (i = 0; i < 3; i++)
    {
        for (j = 0; j < 4; j++)
        {
            u16 idx = sReelButtonMapTileIdxs[i][j];
            data->buttonReleasedTiles[i][j] = buffer[idx];
            data->buttonPressedTiles[i][j] = j + 0xC0;
        }
    }
}

static void SetReelButtonPressed(u8 reel)
{
    if (reel < 3)
    {
        s32 i;
        struct SlotMachineSetupTaskData * data = GetSlotMachineSetupTaskDataPtr();
        u16 * buffer = GetBgTilemapBuffer(2);
        for (i = 0; i < 4; i++)
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

    for (i = 0; i < 3; i++)
    {
        for (j = 0; j < 4; j++)
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
