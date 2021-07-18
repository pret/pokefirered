#include "global.h"
#include "gflib.h"
#include "script.h"
#include "task.h"
#include "data.h"
#include "trig.h"
#include "field_fadetransition.h"
#include "overworld.h"
#include "new_menu_helpers.h"
#include "menu.h"
#include "list_menu.h"
#include "event_data.h"
#include "text_window.h"
#include "pokemon_summary_screen.h"
#include "graphics.h"
#include "strings.h"
#include "constants/songs.h"
#include "constants/moves.h"

/*
 * Move relearner state machine
 * ------------------------
 * 
 * CB2_MoveRelearner_Init
 *   - Creates listMenuScrollPos to listen to right/left buttons.
 *   - Creates listMenuScrollRow to listen to up/down buttons.
 * MoveRelearnerStateMachine: MENU_STATE_FADE_TO_BLACK
 * MoveRelearnerStateMachine: MENU_STATE_WAIT_FOR_FADE
 *   - Go to MENU_STATE_IDLE_BATTLE_MODE
 * 
 * MoveRelearnerStateMachine: MENU_STATE_SETUP_BATTLE_MODE
 * MoveRelearnerStateMachine: MENU_STATE_IDLE_BATTLE_MODE
 *   - If the player selected a move (pressed A), go to MENU_STATE_PRINT_TEACH_MOVE_PROMPT.
 *   - If the player cancelled (pressed B), go to MENU_STATE_PRINT_GIVE_UP_PROMPT.
 * 
 * MoveRelearnerStateMachine: MENU_STATE_PRINT_TEACH_MOVE_PROMPT
 * MoveRelearnerStateMachine: MENU_STATE_TEACH_MOVE_CONFIRM
 *   - Wait for the player to confirm.
 *   - If cancelled, go to MENU_STATE_SETUP_BATTLE_MODE.
 *   - If confirmed and the pokemon had an empty move slot, set VAR_0x8004 to TRUE and go to
 *     MENU_STATE_PRINT_TEXT_THEN_FANFARE.
 *   - If confirmed and the pokemon doesn't have an empty move slot, go to
 *     MENU_STATE_PRINT_TRYING_TO_LEARN_PROMPT.
 * 
 * MoveRelearnerStateMachine: MENU_STATE_PRINT_TRYING_TO_LEARN_PROMPT
 * MoveRelearnerStateMachine: MENU_STATE_WAIT_FOR_TRYING_TO_LEARN
 * MoveRelearnerStateMachine: MENU_STATE_CONFIRM_DELETE_OLD_MOVE
 *   - If the player confirms, go to MENU_STATE_PRINT_WHICH_MOVE_PROMPT.
 *   - If the player cancels, go to MENU_STATE_PRINT_STOP_TEACHING
 * 
 * MoveRelearnerStateMachine: MENU_STATE_PRINT_STOP_TEACHING
 * MoveRelearnerStateMachine: MENU_STATE_WAIT_FOR_STOP_TEACHING
 * MoveRelearnerStateMachine: MENU_STATE_CONFIRM_STOP_TEACHING
 *   - If the player confirms, go to MENU_STATE_CHOOSE_SETUP_STATE.
 *   - If the player cancels, go back to MENU_STATE_PRINT_TRYING_TO_LEARN_PROMPT.
 * 
 * MoveRelearnerStateMachine: MENU_STATE_PRINT_WHICH_MOVE_PROMPT
 * MoveRelearnerStateMachine: MENU_STATE_SHOW_MOVE_SUMMARY_SCREEN
 *   - Go to ShowSelectMovePokemonSummaryScreen. When done, control returns to
 *     CB2_MoveRelearner_Resume.
 * 
 * MoveRelearnerStateMachine: MENU_STATE_DOUBLE_FANFARE_FORGOT_MOVE
 * MoveRelearnerStateMachine: MENU_STATE_PRINT_TEXT_THEN_FANFARE
 * MoveRelearnerStateMachine: MENU_STATE_WAIT_FOR_FANFARE
 * MoveRelearnerStateMachine: MENU_STATE_WAIT_FOR_A_BUTTON
 * MoveRelearnerStateMachine: MENU_STATE_FADE_AND_RETURN
 * MoveRelearnerStateMachine: MENU_STATE_RETURN_TO_FIELD
 *   - Clean up and go to CB2_ReturnToField.
 * 
 * MoveRelearnerStateMachine: MENU_STATE_PRINT_GIVE_UP_PROMPT
 * MoveRelearnerStateMachine: MENU_STATE_GIVE_UP_CONFIRM
 *   - If the player confirms, go to MENU_STATE_FADE_AND_RETURN, and set VAR_0x8004 to FALSE.
 *   - If the player cancels, go to MENU_STATE_SETUP_BATTLE_MODE.
 * 
 * CB2_MoveRelearner_Resume:
 *   - Do most of the same stuff as CB2_MoveRelearner_Init.
 * MoveRelearnerStateMachine: MENU_STATE_FADE_FROM_SUMMARY_SCREEN
 * MoveRelearnerStateMachine: MENU_STATE_TRY_OVERWRITE_MOVE
 *   - If any of the pokemon's existing moves were chosen, overwrite the move and
 *     go to MENU_STATE_DOUBLE_FANFARE_FORGOT_MOVE and set VAR_0x8004 to TRUE.
 *   - If the chosen move is the one the player selected before the summary screen,
 *     go to MENU_STATE_PRINT_STOP_TEACHING.
 * 
 */
 
#define MENU_STATE_FADE_TO_BLACK 0
#define MENU_STATE_WAIT_FOR_FADE 1
#define MENU_STATE_UNREACHABLE 2
#define MENU_STATE_SETUP_BATTLE_MODE 3
#define MENU_STATE_IDLE_BATTLE_MODE 4
// States 5, 6, and 7 are skipped.
#define MENU_STATE_PRINT_TEACH_MOVE_PROMPT 8
#define MENU_STATE_TEACH_MOVE_CONFIRM 9
// States 10 and 11 are skipped.
#define MENU_STATE_PRINT_GIVE_UP_PROMPT 12
#define MENU_STATE_GIVE_UP_CONFIRM 13
#define MENU_STATE_FADE_AND_RETURN 14
#define MENU_STATE_RETURN_TO_FIELD 15
#define MENU_STATE_PRINT_TRYING_TO_LEARN_PROMPT 16
#define MENU_STATE_WAIT_FOR_TRYING_TO_LEARN 17
#define MENU_STATE_CONFIRM_DELETE_OLD_MOVE 18
#define MENU_STATE_PRINT_WHICH_MOVE_PROMPT 19
#define MENU_STATE_SHOW_MOVE_SUMMARY_SCREEN 20
// States 21, 22, and 23 are skipped.
#define MENU_STATE_PRINT_STOP_TEACHING 24
#define MENU_STATE_WAIT_FOR_STOP_TEACHING 25
#define MENU_STATE_CONFIRM_STOP_TEACHING 26
#define MENU_STATE_CHOOSE_SETUP_STATE 27
#define MENU_STATE_FADE_FROM_SUMMARY_SCREEN 28
#define MENU_STATE_TRY_OVERWRITE_MOVE 29
#define MENU_STATE_DOUBLE_FANFARE_FORGOT_MOVE 30
#define MENU_STATE_PRINT_TEXT_THEN_FANFARE 31
#define MENU_STATE_WAIT_FOR_FANFARE 32
#define MENU_STATE_WAIT_FOR_A_BUTTON 33

struct MoveTutorMoveInfoHeaders
{
    const u8 *text;
    u8 left;
    u8 right;
    u8 index; // unused
};

struct LearnMoveGfxResources
{
    u8 state;
    u8 unk_01; // unused
    u8 unk_02; // set but never read
    u8 spriteIds[2];
    u8 filler_05[19]; // unused
    u8 unk_18; // set but never read
    u8 scrollPositionMaybe;
    u8 numLearnableMoves;
    u8 unk_1B; // set but never read
    u8 unk_1C; // set but never read
    u8 unk_1D; // set but never read
    u8 unk_1E; // set but never read
    struct ListMenuItem listMenuItems[25];
    u16 learnableMoves[25];
    u8 listMenuStrbufs[25][13];
    bool8 scheduleMoveInfoUpdate;
    u8 selectedPartyMember;
    u8 selectedMoveSlot;
    u8 unk_262; // unused
    u8 listMenuTaskId;
    u8 bg1TilemapBuffer[BG_SCREEN_SIZE]; // 264
    u8 textColor[3]; // A64
    u8 selectedIndex;
    u16 listMenuScrollPos;
    u16 listMenuScrollRow;
};

static EWRAM_DATA struct LearnMoveGfxResources * sMoveRelearner = NULL;

static void Task_InitMoveRelearnerMenu(u8 taskId);
static void CB2_MoveRelearner_Init(void);
static void CB2_MoveRelearner(void);
static void MoveRelearnerStateMachine(void);
static void DrawTextBorderOnWindows6and7(void);
static void PrintTeachWhichMoveToStrVar1(bool8 onInit);
static void InitMoveRelearnerStateVariables(void);
static void SpriteCB_ListMenuScrollIndicators(struct Sprite * sprite);
static void SpawnListMenuScrollIndicatorSprites(void);
static void MoveRelearnerInitListMenuBuffersEtc(void);
static void MoveRelearnerMenuHandleInput(void);
static void MoveLearnerInitListMenu(void);
static void LoadMoveInfoUI(void);
static void PrintMoveInfoHandleCancel_CopyToVram(void);
static void MoveRelearnerMenu_MoveCursorFunc(s32 itemIndex, bool8 onInit, struct ListMenu *list);
static s8 YesNoMenuProcessInput(void);
static void PrintTextOnWindow(u8 windowId, const u8 *str, u8 x, u8 y, s32 speed, s32 colorIdx);

static const u16 sLearnMoveInterfaceSpritesPalette[] = INCBIN_U16("graphics/learn_move/interface_sprites.gbapal");
static const u16 sLearnMoveInterfaceSpritesTiles[] = INCBIN_U16("graphics/learn_move/interface_sprites.4bpp");

// Unused in US
static const u8 sMoveTutorMenuWindowFrameDimensions[][4] =
{
    // left, top, height, width
    { 0,  0, 19, 13},
    {20,  0, 29, 13},
    { 2, 14, 27, 19}
};

static const u8 sJPText_TatakauWaza[] = _("たたかうわざ");
static const u8 sJPText_Taipu[] = _("タイプ/");
static const u8 sJPText_PP[] = _("PP/");
static const u8 sJPText_Iryoku[] = _("いりょく/");
static const u8 sJPText_Meichuu[] = _("めいちゅう/");

static const struct MoveTutorMoveInfoHeaders sMoveTutorMoveInfoHeaders[][5] =
{
    {
        {sJPText_TatakauWaza,  7, 1, 0},
        {sJPText_Taipu,        1, 4, 1},
        {sJPText_Iryoku,      11, 4, 2},
        {sJPText_PP,           2, 6, 3},
        {sJPText_Meichuu,     10, 6, 4},
    },
    {
        {NULL,        0, 0, 0},
        {NULL,        0, 0, 0},
        {NULL,        0, 0, 0},
        {NULL,        0, 0, 0},
        {NULL,        0, 0, 0},
    },
};

static const struct SpriteSheet sSpriteSheet_ListMenuScrollIndicators = {
    sLearnMoveInterfaceSpritesTiles, 0x180, 5525
};

static const struct SpritePalette sSpritePalette_ListMenuScrollIndicators = {
    sLearnMoveInterfaceSpritesPalette, 5526
};

static const struct OamData sOamdata_MoveRelearnerListMenuScrollIndicators = {
    .shape = SPRITE_SHAPE(16x8),
    .size = SPRITE_SIZE(16x8)
};

static const union AnimCmd sAnimCmd_ScrollIndicatorDown[] = {
    ANIMCMD_FRAME(4, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_ScrollIndicatorUp[] = {
    ANIMCMD_FRAME(6, 5),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_MoveRelearnerListMenuScrollIndicators[] = {
    sAnimCmd_ScrollIndicatorDown,
    sAnimCmd_ScrollIndicatorUp
};

static const struct SpriteTemplate sSpriteTemplate_MoveRelearnerListMenuScrollIndicators = {
    5525, 5526, &sOamdata_MoveRelearnerListMenuScrollIndicators, sSpriteAnimTable_MoveRelearnerListMenuScrollIndicators, NULL, gDummySpriteAffineAnimTable, SpriteCB_ListMenuScrollIndicators
};

static const struct BgTemplate sBgTemplates[2] = {
    {
        .bg = 0,
        .charBaseIndex = 2,
        .mapBaseIndex = 31,
        .priority = 0
    },
    {
        .bg = 1,
        .charBaseIndex = 0,
        .mapBaseIndex = 8,
        .priority = 1
    }
};

enum
{
    WINID_UITYPEICON,
    WINID_UIMOVESTATS,
    WINID_MOVETYPEICON,
    WINID_MOVEPWRACC,
    WINID_MOVEPP,
    WINID_MOVEDESC,
    WINID_LIST,
    WINID_MESSAGE,
    WINID_COUNT,
};

enum
{
    COLORID_DG_LG_XPAR,
    COLORID_DG_LG_XPAR_NOCLR,
    COLORID_DG_LG_WHITE,
};

static const struct WindowTemplate sWindowTemplates[9] = {
    [WINID_UITYPEICON] = {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 0,
        .width = 6,
        .height = 7,
        .paletteNum = 0x0d,
        .baseBlock = 0x014
    },
    [WINID_UIMOVESTATS] = {
        .bg = 0,
        .tilemapLeft = 10,
        .tilemapTop = 0,
        .width = 5,
        .height = 5,
        .paletteNum = 0x0d,
        .baseBlock = 0x03e
    },
    [WINID_MOVETYPEICON] = {
        .bg = 0,
        .tilemapLeft = 5,
        .tilemapTop = 0,
        .width = 5,
        .height = 2,
        .paletteNum = 0x0d,
        .baseBlock = 0x057
    },
    [WINID_MOVEPWRACC] = {
        .bg = 0,
        .tilemapLeft = 15,
        .tilemapTop = 0,
        .width = 3,
        .height = 5,
        .paletteNum = 0x0f,
        .baseBlock = 0x061
    },
    [WINID_MOVEPP] = {
        .bg = 0,
        .tilemapLeft = 5,
        .tilemapTop = 2,
        .width = 3,
        .height = 3,
        .paletteNum = 0x0f,
        .baseBlock = 0x070
    },
    [WINID_MOVEDESC] = {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 6,
        .width = 15,
        .height = 8,
        .paletteNum = 0x0f,
        .baseBlock = 0x079
    },
    [WINID_LIST] = {
        .bg = 0,
        .tilemapLeft = 19,
        .tilemapTop = 1,
        .width = 10,
        .height = 12,
        .paletteNum = 0x0f,
        .baseBlock = 0x0f1
    },
    [WINID_MESSAGE] = {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 15,
        .width = 26,
        .height = 4,
        .paletteNum = 0x0f,
        .baseBlock = 0x169
    }, DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sWindowTemplate_YesNo = {
    .bg = 0,
    .tilemapLeft = 21,
    .tilemapTop = 8,
    .width = 6,
    .height = 4,
    .paletteNum = 0x0f,
    .baseBlock = 0x1d1
};

static const struct ListMenuTemplate sMoveRelearnerListMenuTemplate = {
    .items = NULL,
    .moveCursorFunc = MoveRelearnerMenu_MoveCursorFunc,
    .itemPrintFunc = NULL,
    .totalItems = 0,
    .maxShowed = 7,
    .windowId = WINID_LIST,
    .header_X = 0,
    .item_X = 8,
    .cursor_X = 0,
    .upText_Y = 0,
    .cursorPal = 2,
    .fillValue = 1,
    .cursorShadowPal = 3,
    .lettersSpacing = 1,
    .itemVerticalPadding = 0,
    .scrollMultiple = 0,
    .fontId = 2,
    .cursorKind = 0,
};

static void VBlankCB_MoveRelearner(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void DisplayMoveTutorMenu(void)
{
    ScriptContext2_Enable();
    CreateTask(Task_InitMoveRelearnerMenu, 10);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
}

static void Task_InitMoveRelearnerMenu(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(CB2_MoveRelearner_Init);
        gFieldCallback = FieldCB_ContinueScriptHandleMusic;
        DestroyTask(taskId);
    }
}

static void MoveRelearnerLoadBgGfx(void)
{
    int i;
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, sBgTemplates, NELEMS(sBgTemplates));
    ResetTempTileDataBuffers();
    if (InitWindows(sWindowTemplates))
    {
        DeactivateAllTextPrinters();
        for (i = 0; i < NELEMS(sWindowTemplates); i++)
        {
            ClearWindowTilemap(i);
            FillWindowPixelBuffer(i, PIXEL_FILL(0));
        }
        FillWindowPixelBuffer(WINID_MESSAGE, PIXEL_FILL(1));
        FillBgTilemapBufferRect(0, 0x000, 0, 0, 30, 20, 0xF);
        SetBgTilemapBuffer(1, sMoveRelearner->bg1TilemapBuffer);
        TextWindow_SetUserSelectedFrame(WINID_UITYPEICON, 1, 0xE0);
        ListMenuLoadStdPalAt(0xD0, 1);
        LoadPalette(gMoveRelearner_Pals, 0x00, 0x20);
        DecompressAndLoadBgGfxUsingHeap(1, gMoveRelearner_BgTiles, 0, 0, 0);
        CopyToBgTilemapBuffer(1, gMoveRelearner_BgMap, 0, 0);
        CopyBgTilemapBufferToVram(1);
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
        SetGpuReg(REG_OFFSET_BG0HOFS, 0);
        SetGpuReg(REG_OFFSET_BG1VOFS, 0);
        SetGpuReg(REG_OFFSET_BG1HOFS, 0);
    }
}

static void CB2_MoveRelearner_Init(void)
{
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
    sMoveRelearner = AllocZeroed(sizeof(struct LearnMoveGfxResources));
    InitMoveRelearnerStateVariables();
    sMoveRelearner->selectedPartyMember = gSpecialVar_0x8004;
    MoveRelearnerInitListMenuBuffersEtc();
    SetVBlankCallback(VBlankCB_MoveRelearner);
    MoveRelearnerLoadBgGfx();
    SpawnListMenuScrollIndicatorSprites();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    SetMainCallback2(CB2_MoveRelearner);
}

static void CB2_MoveRelearner_Resume(void)
{
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
    MoveRelearnerInitListMenuBuffersEtc();
    sMoveRelearner->selectedMoveSlot = gSpecialVar_0x8005;
    SetVBlankCallback(VBlankCB_MoveRelearner);
    MoveRelearnerLoadBgGfx();
    SpawnListMenuScrollIndicatorSprites();
    FillPalette(RGB_BLACK, 0, 2);

    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    SetMainCallback2(CB2_MoveRelearner);
}

static void CB2_MoveRelearner(void)
{
    if (!IsTextPrinterActive(WINID_MESSAGE))
        MoveRelearnerStateMachine();
    if (sMoveRelearner->scheduleMoveInfoUpdate)
    {
        PrintMoveInfoHandleCancel_CopyToVram();
        sMoveRelearner->scheduleMoveInfoUpdate = FALSE;
    }
    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void ExpandAndPrintRelearnerMessage(const u8 *str)
{
    StringExpandPlaceholders(gStringVar4, str);
    PrintTextOnWindow(WINID_MESSAGE, gStringVar4, 0, 2, GetTextSpeedSetting(), COLORID_DG_LG_WHITE);
}

static void MoveRelearnerStateMachine(void)
{
    u16 move;

    switch (sMoveRelearner->state)
    {
    case MENU_STATE_FADE_TO_BLACK:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        ShowBg(0);
        ShowBg(1);
        LoadMoveInfoUI();
        sMoveRelearner->state++;
        DrawTextBorderOnWindows6and7();
        PrintTeachWhichMoveToStrVar1(FALSE);
        MoveLearnerInitListMenu();
        sMoveRelearner->scheduleMoveInfoUpdate = TRUE;
        break;
    case MENU_STATE_WAIT_FOR_FADE:
        if (!gPaletteFade.active)
            sMoveRelearner->state = MENU_STATE_IDLE_BATTLE_MODE;
        break;
    case MENU_STATE_UNREACHABLE:
        sMoveRelearner->state++;
        break;
    case MENU_STATE_SETUP_BATTLE_MODE:
        PrintTeachWhichMoveToStrVar1(FALSE);
        sMoveRelearner->scheduleMoveInfoUpdate = TRUE;
        sMoveRelearner->state++;
        break;
    case MENU_STATE_IDLE_BATTLE_MODE:
        MoveRelearnerMenuHandleInput();
        break;
    case MENU_STATE_PRINT_TEACH_MOVE_PROMPT:
        CreateYesNoMenu(&sWindowTemplate_YesNo, 3, 0, 2, 0x001, 0xE, 0);
        sMoveRelearner->state++;
        break;
    case MENU_STATE_TEACH_MOVE_CONFIRM :
        switch (YesNoMenuProcessInput())
        {
        case 0:
            if (GiveMoveToMon(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->learnableMoves[sMoveRelearner->selectedIndex]) != 0xFFFF)
            {
                ExpandAndPrintRelearnerMessage(gText_MonLearnedMove);
                gSpecialVar_0x8004 = TRUE;
                sMoveRelearner->state = MENU_STATE_PRINT_TEXT_THEN_FANFARE;
            }
            else
            {
                sMoveRelearner->state = MENU_STATE_PRINT_TRYING_TO_LEARN_PROMPT;
            }
            break;
        case 1:
        case MENU_B_PRESSED:
            sMoveRelearner->state = MENU_STATE_SETUP_BATTLE_MODE;
            break;
        }
        break;
    case MENU_STATE_PRINT_GIVE_UP_PROMPT:
        CreateYesNoMenu(&sWindowTemplate_YesNo, 3, 0, 2, 0x001, 0xE, 0);
        sMoveRelearner->state++;
        break;
    case MENU_STATE_GIVE_UP_CONFIRM:
        switch (YesNoMenuProcessInput())
        {
        case 0:
            gSpecialVar_0x8004 = FALSE;
            sMoveRelearner->state = MENU_STATE_FADE_AND_RETURN;
            break;
        case 1:
        case MENU_B_PRESSED:
            sMoveRelearner->state = MENU_STATE_SETUP_BATTLE_MODE;
            break;
        }
        break;
    case MENU_STATE_PRINT_TRYING_TO_LEARN_PROMPT:
        ExpandAndPrintRelearnerMessage(gText_MonIsTryingToLearnMove);
        sMoveRelearner->state++;
        break;
    case MENU_STATE_WAIT_FOR_TRYING_TO_LEARN:
        CreateYesNoMenu(&sWindowTemplate_YesNo, 3, 0, 2, 0x001, 0xE, 0);
        sMoveRelearner->state = MENU_STATE_CONFIRM_DELETE_OLD_MOVE;
        break;
    case MENU_STATE_CONFIRM_DELETE_OLD_MOVE:
        switch (YesNoMenuProcessInput())
        {
        case 0:
            ExpandAndPrintRelearnerMessage(gText_WhichMoveShouldBeForgotten);
            sMoveRelearner->state = MENU_STATE_PRINT_WHICH_MOVE_PROMPT;
            break;
        case 1:
        case MENU_B_PRESSED:
            sMoveRelearner->state = MENU_STATE_PRINT_STOP_TEACHING;
            break;
        }
        break;
    case MENU_STATE_PRINT_STOP_TEACHING:
        ExpandAndPrintRelearnerMessage(gText_StopLearningMove);
        sMoveRelearner->state++;
        break;
    case MENU_STATE_WAIT_FOR_STOP_TEACHING:
        CreateYesNoMenu(&sWindowTemplate_YesNo, 3, 0, 2, 0x001, 0xE, 0);
        sMoveRelearner->state = MENU_STATE_CONFIRM_STOP_TEACHING;
        break;
    case MENU_STATE_CONFIRM_STOP_TEACHING:
        switch (YesNoMenuProcessInput())
        {
        case 0:
            sMoveRelearner->state = MENU_STATE_CHOOSE_SETUP_STATE;
            break;
        case 1:
        case MENU_B_PRESSED:
            sMoveRelearner->state = MENU_STATE_PRINT_TRYING_TO_LEARN_PROMPT;
            break;
        }
        break;
    case MENU_STATE_CHOOSE_SETUP_STATE :
        sMoveRelearner->state = MENU_STATE_SETUP_BATTLE_MODE;
        break;
    case MENU_STATE_PRINT_WHICH_MOVE_PROMPT:
        sMoveRelearner->state = MENU_STATE_SHOW_MOVE_SUMMARY_SCREEN;
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        break;
    case MENU_STATE_SHOW_MOVE_SUMMARY_SCREEN:
        if (!gPaletteFade.active)
        {
            ListMenuGetScrollAndRow(sMoveRelearner->listMenuTaskId, &sMoveRelearner->listMenuScrollPos, &sMoveRelearner->listMenuScrollRow);
            FreeAllWindowBuffers();
            ShowSelectMovePokemonSummaryScreen(gPlayerParty, sMoveRelearner->selectedPartyMember, gPlayerPartyCount - 1, CB2_MoveRelearner_Resume, sMoveRelearner->learnableMoves[sMoveRelearner->selectedIndex]);
            sMoveRelearner->state = MENU_STATE_FADE_FROM_SUMMARY_SCREEN;
        }
        break;
    case 21:
        sMoveRelearner->state = MENU_STATE_FADE_AND_RETURN;
        break;
    case 22:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        break;
    case MENU_STATE_FADE_AND_RETURN:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        sMoveRelearner->state++;
        break;
    case MENU_STATE_RETURN_TO_FIELD:
        if (!gPaletteFade.active)
        {
            FreeAllWindowBuffers();
            Free(sMoveRelearner);
            SetMainCallback2(CB2_ReturnToField);
        }
        break;
    case MENU_STATE_FADE_FROM_SUMMARY_SCREEN:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        ShowBg(0);
        ShowBg(1);
        sMoveRelearner->state++;
        LoadMoveInfoUI();
        DrawTextBorderOnWindows6and7();
        MoveLearnerInitListMenu();
        PrintTeachWhichMoveToStrVar1(TRUE);
        PrintMoveInfoHandleCancel_CopyToVram();
        break;
    case MENU_STATE_TRY_OVERWRITE_MOVE:
        if (!gPaletteFade.active)
        {
            if (sMoveRelearner->selectedMoveSlot == 4)
            {
                sMoveRelearner->state = MENU_STATE_PRINT_STOP_TEACHING;
            }
            else
            {
                move = GetMonData(&gPlayerParty[sMoveRelearner->selectedPartyMember], MON_DATA_MOVE1 + sMoveRelearner->selectedMoveSlot);
                StringCopy(gStringVar3, gMoveNames[move]);
                RemoveMonPPBonus(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->selectedMoveSlot);
                SetMonMoveSlot(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->learnableMoves[sMoveRelearner->selectedIndex], sMoveRelearner->selectedMoveSlot);
                StringCopy(gStringVar2, gMoveNames[sMoveRelearner->learnableMoves[sMoveRelearner->selectedIndex]]);
                ExpandAndPrintRelearnerMessage(gText_1_2_and_Poof);
                sMoveRelearner->state = MENU_STATE_DOUBLE_FANFARE_FORGOT_MOVE;
                gSpecialVar_0x8004 = TRUE;
            }
        }
        break;
    case MENU_STATE_DOUBLE_FANFARE_FORGOT_MOVE:
        ExpandAndPrintRelearnerMessage(gText_MonForgotOldMoveAndMonLearnedNewMove);
        sMoveRelearner->state = MENU_STATE_PRINT_TEXT_THEN_FANFARE;
        PlayFanfare(MUS_LEVEL_UP);
        break;
    case MENU_STATE_PRINT_TEXT_THEN_FANFARE:
        PlayFanfare(MUS_LEVEL_UP);
        sMoveRelearner->state = MENU_STATE_WAIT_FOR_FANFARE;
        break;
    case MENU_STATE_WAIT_FOR_FANFARE:
        if (IsFanfareTaskInactive())
            sMoveRelearner->state = MENU_STATE_WAIT_FOR_A_BUTTON;
        break;
    case MENU_STATE_WAIT_FOR_A_BUTTON:
        if (JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            sMoveRelearner->state = MENU_STATE_FADE_AND_RETURN;
        }
        break;
    }
}

static void DrawTextBorderOnWindows6and7(void)
{
    int i;
    for (i = WINID_LIST; i < WINID_COUNT; i++)
        DrawTextBorderOuter(i, 0x001, 0xE);
}

static void PrintTeachWhichMoveToStrVar1(bool8 onInit)
{
    if (!onInit)
    {
        StringExpandPlaceholders(gStringVar4, gText_TeachWhichMoveToMon);
        PrintTextOnWindow(WINID_MESSAGE, gStringVar4, 0, 2, 0, COLORID_DG_LG_WHITE);
        PutWindowTilemap(WINID_MESSAGE);
        CopyWindowToVram(WINID_MESSAGE, COPYWIN_BOTH);
    }
}

static void InitMoveRelearnerStateVariables(void)
{
    int i;
    sMoveRelearner->state = 0;
    sMoveRelearner->unk_02 = 0;
    sMoveRelearner->scrollPositionMaybe = 0;
    sMoveRelearner->unk_18 = 0;
    sMoveRelearner->unk_1C = 0;
    sMoveRelearner->numLearnableMoves = 0;
    sMoveRelearner->unk_1B = 0;
    sMoveRelearner->unk_1D = 0;
    sMoveRelearner->unk_1E = 0;
    sMoveRelearner->scheduleMoveInfoUpdate = FALSE;
    for (i = 0; i < 20; i++)
        sMoveRelearner->learnableMoves[i] = MOVE_NONE;
}

static void SpriteCB_ListMenuScrollIndicators(struct Sprite * sprite)
{
    s16 abcissa = (sprite->data[1] * 10) & 0xFF;
    switch (sprite->data[0])
    {
    case 0:
        break;
    case 1:
        sprite->pos2.x = Sin(abcissa, 3) * sprite->data[2];
        break;
    case 2:
        sprite->pos2.y = Sin(abcissa, 1) * sprite->data[2];
        break;
    }
    sprite->data[1]++;
}

static void SpawnListMenuScrollIndicatorSprites(void)
{
    int i;
    LoadSpriteSheet(&sSpriteSheet_ListMenuScrollIndicators);
    LoadSpritePalette(&sSpritePalette_ListMenuScrollIndicators);

    sMoveRelearner->spriteIds[0] = CreateSprite(&sSpriteTemplate_MoveRelearnerListMenuScrollIndicators, 200, 4, 0);
    StartSpriteAnim(&gSprites[sMoveRelearner->spriteIds[0]], 1);
    gSprites[sMoveRelearner->spriteIds[0]].data[0] = 2;
    gSprites[sMoveRelearner->spriteIds[0]].data[2] = -1;

#ifdef BUGFIX // This should be using the second element of spriteIds.
#define spriteId 1
#else
#define spriteId 0
#endif //BUGFIX
    sMoveRelearner->spriteIds[spriteId] = CreateSprite(&sSpriteTemplate_MoveRelearnerListMenuScrollIndicators, 200, 108, 0);
    gSprites[sMoveRelearner->spriteIds[spriteId]].data[0] = 2;
    gSprites[sMoveRelearner->spriteIds[spriteId]].data[2] = 1;
#undef spriteId

    for (i = 0; i < 2; i++)
        gSprites[sMoveRelearner->spriteIds[i]].invisible = TRUE;
}

static void MoveRelearnerInitListMenuBuffersEtc(void)
{
    int i;
    s32 count;
    u8 nickname[11];

    sMoveRelearner->numLearnableMoves = GetMoveRelearnerMoves(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->learnableMoves);
    count = GetMoveRelearnerMoves(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->learnableMoves);
    for (i = 0; i < sMoveRelearner->numLearnableMoves; i++)
        StringCopy(sMoveRelearner->listMenuStrbufs[i], gMoveNames[sMoveRelearner->learnableMoves[i]]);
    GetMonData(&gPlayerParty[sMoveRelearner->selectedPartyMember], MON_DATA_NICKNAME, nickname);
    StringCopy10(gStringVar1, nickname);
    StringCopy(sMoveRelearner->listMenuStrbufs[sMoveRelearner->numLearnableMoves], gFameCheckerText_Cancel);
    sMoveRelearner->numLearnableMoves++;
    for (i = 0; i < count; i++)
    {
        sMoveRelearner->listMenuItems[i].label = sMoveRelearner->listMenuStrbufs[i];
        sMoveRelearner->listMenuItems[i].index = i;
    }
    sMoveRelearner->listMenuItems[i].label = gFameCheckerText_Cancel;
    sMoveRelearner->listMenuItems[i].index = (u8)LIST_CANCEL;
    gMultiuseListMenuTemplate = sMoveRelearnerListMenuTemplate;
    gMultiuseListMenuTemplate.items = sMoveRelearner->listMenuItems;
    gMultiuseListMenuTemplate.totalItems = count + 1;
}

static void MoveRelearnerMenuHandleInput(void)
{
    ListMenu_ProcessInput(sMoveRelearner->listMenuTaskId);
    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        if (sMoveRelearner->selectedIndex != (u8)LIST_CANCEL)
        {
            sMoveRelearner->state = MENU_STATE_PRINT_TEACH_MOVE_PROMPT;
            StringCopy(gStringVar2, sMoveRelearner->listMenuStrbufs[sMoveRelearner->selectedIndex]);
            ExpandAndPrintRelearnerMessage(gText_TeachMoveQues);
        }
        else
        {
            ExpandAndPrintRelearnerMessage(gText_GiveUpTryingToTeachNewMove);
            sMoveRelearner->state = MENU_STATE_PRINT_GIVE_UP_PROMPT;
        }
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        sMoveRelearner->state = MENU_STATE_PRINT_GIVE_UP_PROMPT;
        ExpandAndPrintRelearnerMessage(gText_GiveUpTryingToTeachNewMove);
    }
    if (sMoveRelearner->numLearnableMoves > 6)
    {
        gSprites[0].invisible = FALSE;
        gSprites[1].invisible = FALSE;
        if (sMoveRelearner->scrollPositionMaybe == 0)
            gSprites[0].invisible = TRUE;
        else if (sMoveRelearner->scrollPositionMaybe == sMoveRelearner->numLearnableMoves - 6)
            gSprites[1].invisible = TRUE;
    }
}

static void MoveLearnerInitListMenu(void)
{
    sMoveRelearner->listMenuTaskId = ListMenuInit(&gMultiuseListMenuTemplate, sMoveRelearner->listMenuScrollPos, sMoveRelearner->listMenuScrollRow);
    CopyWindowToVram(WINID_LIST, COPYWIN_MAP);
}

static void PrintMoveInfo(u16 move)
{
    u8 buffer[50];
    BlitMoveInfoIcon(WINID_MOVETYPEICON, MOVEICON_TYPE(gBattleMoves[move].type), 1, 4);

    if (gBattleMoves[move].power < 2)
    {
        PrintTextOnWindow(WINID_MOVEPWRACC, gText_ThreeHyphens, 1, 4, 0, COLORID_DG_LG_XPAR);
    }
    else
    {
        ConvertIntToDecimalStringN(buffer, gBattleMoves[move].power, STR_CONV_MODE_RIGHT_ALIGN, 3);
        PrintTextOnWindow(WINID_MOVEPWRACC, buffer, 1, 4, 0, COLORID_DG_LG_XPAR);
    }

    if (gBattleMoves[move].accuracy == 0)
    {
        PrintTextOnWindow(WINID_MOVEPWRACC, gText_ThreeHyphens, 1, 18, 0, COLORID_DG_LG_XPAR_NOCLR);
    }
    else
    {
        ConvertIntToDecimalStringN(buffer, gBattleMoves[move].accuracy, STR_CONV_MODE_RIGHT_ALIGN, 3);
        PrintTextOnWindow(WINID_MOVEPWRACC, buffer, 1, 18, 0, COLORID_DG_LG_XPAR_NOCLR);
    }
    ConvertIntToDecimalStringN(buffer, gBattleMoves[move].pp, STR_CONV_MODE_LEFT_ALIGN, 2);
    PrintTextOnWindow(WINID_MOVEPP, buffer, 2, 2, 0, COLORID_DG_LG_XPAR);
    PrintTextOnWindow(WINID_MOVEDESC, gMoveDescriptionPointers[move - 1], 1, 0, 0, COLORID_DG_LG_XPAR);
}

static void LoadMoveInfoUI(void)
{
    BlitMoveInfoIcon(WINID_UITYPEICON, MOVEICON_TYPEICON, 1, 4);
    BlitMoveInfoIcon(WINID_UIMOVESTATS, MOVEICON_POWER, 0, 4);
    BlitMoveInfoIcon(WINID_UIMOVESTATS, MOVEICON_ACCURACY, 0, 19);
    BlitMoveInfoIcon(WINID_UITYPEICON, MOVEICON_PP, 1, 19);
    BlitMoveInfoIcon(WINID_UITYPEICON, MOVEICON_EFFECT, 1, 34);
    PutWindowTilemap(WINID_UITYPEICON);
    PutWindowTilemap(WINID_UIMOVESTATS);
    PutWindowTilemap(WINID_MOVEPP);
    PutWindowTilemap(WINID_MOVEPWRACC);
    PutWindowTilemap(WINID_MOVEDESC);
    PutWindowTilemap(WINID_MOVETYPEICON);
    PutWindowTilemap(WINID_MESSAGE);
    CopyWindowToVram(WINID_UITYPEICON, COPYWIN_GFX);
    CopyWindowToVram(WINID_UIMOVESTATS, COPYWIN_GFX);
}

static void PrintMoveInfoHandleCancel_CopyToVram(void)
{
    int i;
    if (sMoveRelearner->selectedIndex != (u8)LIST_CANCEL)
    {
        PrintMoveInfo(sMoveRelearner->learnableMoves[sMoveRelearner->selectedIndex]);
    }
    else
    {
        for (i = WINID_MOVETYPEICON; i < WINID_LIST; i++)
        {
            FillWindowPixelBuffer(i, PIXEL_FILL(0));
            CopyWindowToVram(i, COPYWIN_GFX);
        }
    }
    CopyWindowToVram(WINID_MOVEPWRACC, COPYWIN_GFX);
    CopyWindowToVram(WINID_MOVEPP, COPYWIN_GFX);
    CopyWindowToVram(WINID_MOVETYPEICON, COPYWIN_GFX);
    CopyWindowToVram(WINID_MOVETYPEICON, COPYWIN_GFX);
    CopyWindowToVram(WINID_MOVEDESC, COPYWIN_GFX);
    CopyWindowToVram(WINID_MESSAGE, COPYWIN_BOTH);
}

static void MoveRelearnerMenu_MoveCursorFunc(s32 itemIndex, bool8 onInit, struct ListMenu *list)
{
    if (!onInit)
    {
        PlaySE(SE_SELECT);
        sMoveRelearner->scheduleMoveInfoUpdate = TRUE;
        sMoveRelearner->selectedIndex = itemIndex;
    }
}

static s8 YesNoMenuProcessInput(void)
{
    s8 input = Menu_ProcessInputNoWrapClearOnChoose();
    if (input != LIST_CANCEL)
    {
        PutWindowTilemap(WINID_LIST);
        CopyWindowToVram(WINID_LIST, COPYWIN_MAP);
    }
    return input;
}

static void PrintTextOnWindow(u8 windowId, const u8 *str, u8 x, u8 y, s32 speed, s32 colorIdx)
{
    s32 letterSpacing = 1;
    s32 lineSpacing = 1;
    if (colorIdx == COLORID_DG_LG_XPAR || colorIdx == COLORID_DG_LG_XPAR_NOCLR)
    {
        letterSpacing = 0;
        lineSpacing = 0;
    }
    switch (colorIdx)
    {
    case COLORID_DG_LG_XPAR:
    case COLORID_DG_LG_XPAR_NOCLR:
        sMoveRelearner->textColor[0] = TEXT_COLOR_TRANSPARENT;
        sMoveRelearner->textColor[1] = TEXT_COLOR_DARK_GRAY;
        sMoveRelearner->textColor[2] = TEXT_COLOR_LIGHT_GRAY;
        break;
    case COLORID_DG_LG_WHITE:
        sMoveRelearner->textColor[0] = TEXT_COLOR_WHITE;
        sMoveRelearner->textColor[1] = TEXT_COLOR_DARK_GRAY;
        sMoveRelearner->textColor[2] = TEXT_COLOR_LIGHT_GRAY;
    }
    if (colorIdx != COLORID_DG_LG_XPAR_NOCLR)
        FillWindowPixelBuffer(windowId, PIXEL_FILL(sMoveRelearner->textColor[0]));
    AddTextPrinterParameterized4(windowId, 3, x, y, letterSpacing, lineSpacing, sMoveRelearner->textColor, speed, str);
}
