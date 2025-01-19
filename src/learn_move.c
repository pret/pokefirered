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
    u8 unk_01;
    u8 unk_02;
    u8 spriteIds[2];
    u8 filler_05[0x13];
    u8 unk_18;
    u8 scrollPositionMaybe;
    u8 numLearnableMoves;
    u8 unk_1B;
    u8 unk_1C;
    u8 unk_1D;
    u8 unk_1E;
    struct ListMenuItem listMenuItems[25];
    u16 learnableMoves[25];
    u8 listMenuStrbufs[25][13];
    bool8 scheduleMoveInfoUpdate;
    u8 selectedPartyMember;
    u8 selectedMoveSlot;
    u8 unk_262;
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
static void SpriteCB_ListMenuScrollIndicators(struct Sprite *sprite);
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

static const u8 sMoveTutorMenuWindowFrameDimensions[][4] =
{
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

static const struct WindowTemplate sWindowTemplates[9] = {
    {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 0,
        .width = 6,
        .height = 7,
        .paletteNum = 13,
        .baseBlock = 0x014
    },
    {
        .bg = 0,
        .tilemapLeft = 10,
        .tilemapTop = 0,
        .width = 5,
        .height = 5,
        .paletteNum = 13,
        .baseBlock = 0x03e
    },
    {
        .bg = 0,
        .tilemapLeft = 5,
        .tilemapTop = 0,
        .width = 5,
        .height = 2,
        .paletteNum = 13,
        .baseBlock = 0x057
    },
    {
        .bg = 0,
        .tilemapLeft = 15,
        .tilemapTop = 0,
        .width = 3,
        .height = 5,
        .paletteNum = 15,
        .baseBlock = 0x061
    },
    {
        .bg = 0,
        .tilemapLeft = 5,
        .tilemapTop = 2,
        .width = 3,
        .height = 3,
        .paletteNum = 15,
        .baseBlock = 0x070
    },
    {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 6,
        .width = 15,
        .height = 8,
        .paletteNum = 15,
        .baseBlock = 0x079
    },
    {
        .bg = 0,
        .tilemapLeft = 19,
        .tilemapTop = 1,
        .width = 10,
        .height = 12,
        .paletteNum = 15,
        .baseBlock = 0x0f1
    },
    {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 15,
        .width = 26,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x169
    }, DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sMoveRelearnerYesNoMenuTemplate = {
    .bg = 0,
    .tilemapLeft = 21,
    .tilemapTop = 8,
    .width = 6,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x1d1
};

static const struct ListMenuTemplate sMoveRelearnerListMenuTemplate = {
    .items = NULL,
    .moveCursorFunc = MoveRelearnerMenu_MoveCursorFunc,
    .itemPrintFunc = NULL,
    .totalItems = 0,
    .maxShowed = 7,
    .windowId = 6,
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
    .fontId = FONT_NORMAL,
    .cursorKind = 0,
};

static void VBlankCB_MoveRelearner(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void TeachMoveRelearnerMove(void)
{
    LockPlayerFieldControls();
    CreateTask(Task_InitMoveRelearnerMenu, 10);
    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
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
        FillWindowPixelBuffer(7, PIXEL_FILL(1));
        FillBgTilemapBufferRect(0, 0x000, 0, 0, 30, 20, 15);
        SetBgTilemapBuffer(1, sMoveRelearner->bg1TilemapBuffer);
        LoadUserWindowGfx(0, 1, BG_PLTT_ID(14));
        ListMenuLoadStdPalAt(BG_PLTT_ID(13), 1);
        LoadPalette(gMoveRelearner_Pal, BG_PLTT_ID(0), PLTT_SIZE_4BPP);
        DecompressAndLoadBgGfxUsingHeap(1, gMoveRelearner_Gfx, 0, 0, 0);
        CopyToBgTilemapBuffer(1, gMoveRelearner_Tilemap, 0, 0);
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
    SetBackdropFromColor(RGB_BLACK);

    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    SetMainCallback2(CB2_MoveRelearner);
}

static void CB2_MoveRelearner(void)
{
    if (!IsTextPrinterActive(7))
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

static void StringExpandPlaceholdersAndPrintTextOnWindow7Color2(const u8 *str)
{
    StringExpandPlaceholders(gStringVar4, str);
    PrintTextOnWindow(7, gStringVar4, 0, 2, GetTextSpeedSetting(), 2);
}

static void MoveRelearnerStateMachine(void)
{
    u16 move;

    switch (sMoveRelearner->state)
    {
    case MENU_STATE_FADE_TO_BLACK:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
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
            sMoveRelearner->state = 4;
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
        CreateYesNoMenu(&sMoveRelearnerYesNoMenuTemplate, FONT_NORMAL_COPY_2, 0, 2, 0x001, 14, 0);
        sMoveRelearner->state++;
        break;
    case MENU_STATE_TEACH_MOVE_CONFIRM :
        switch (YesNoMenuProcessInput())
        {
        case 0:
            if (GiveMoveToMon(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->learnableMoves[sMoveRelearner->selectedIndex]) != 0xFFFF)
            {
                StringExpandPlaceholdersAndPrintTextOnWindow7Color2(gText_MonLearnedMove);
                gSpecialVar_0x8004 = TRUE;
                sMoveRelearner->state = 31;
            }
            else
            {
                sMoveRelearner->state = 16;
            }
            break;
        case 1:
        case -1:
            sMoveRelearner->state = 3;
            break;
        }
        break;
    case MENU_STATE_PRINT_GIVE_UP_PROMPT:
        CreateYesNoMenu(&sMoveRelearnerYesNoMenuTemplate, FONT_NORMAL_COPY_2, 0, 2, 0x001, 14, 0);
        sMoveRelearner->state++;
        break;
    case MENU_STATE_GIVE_UP_CONFIRM:
        switch (YesNoMenuProcessInput())
        {
        case 0:
            gSpecialVar_0x8004 = FALSE;
            sMoveRelearner->state = 14;
            break;
        case 1:
        case -1:
            sMoveRelearner->state = 3;
            break;
        }
        break;
    case MENU_STATE_PRINT_TRYING_TO_LEARN_PROMPT:
        StringExpandPlaceholdersAndPrintTextOnWindow7Color2(gText_MonIsTryingToLearnMove);
        sMoveRelearner->state++;
        break;
    case MENU_STATE_WAIT_FOR_TRYING_TO_LEARN:
        CreateYesNoMenu(&sMoveRelearnerYesNoMenuTemplate, FONT_NORMAL_COPY_2, 0, 2, 0x001, 14, 0);
        sMoveRelearner->state = 18;
        break;
    case MENU_STATE_CONFIRM_DELETE_OLD_MOVE:
        switch (YesNoMenuProcessInput())
        {
        case 0:
            StringExpandPlaceholdersAndPrintTextOnWindow7Color2(gText_WhichMoveShouldBeForgotten);
            sMoveRelearner->state = 19;
            break;
        case 1:
        case -1:
            sMoveRelearner->state = 24;
            break;
        }
        break;
    case MENU_STATE_PRINT_STOP_TEACHING:
        StringExpandPlaceholdersAndPrintTextOnWindow7Color2(gText_StopLearningMove);
        sMoveRelearner->state++;
        break;
    case MENU_STATE_WAIT_FOR_STOP_TEACHING:
        CreateYesNoMenu(&sMoveRelearnerYesNoMenuTemplate, FONT_NORMAL_COPY_2, 0, 2, 0x001, 14, 0);
        sMoveRelearner->state = 26;
        break;
    case MENU_STATE_CONFIRM_STOP_TEACHING:
        switch (YesNoMenuProcessInput())
        {
        case 0:
            sMoveRelearner->state = 27;
            break;
        case 1:
        case -1:
            sMoveRelearner->state = 16;
            break;
        }
        break;
    case MENU_STATE_CHOOSE_SETUP_STATE :
        sMoveRelearner->state = 3;
        break;
    case MENU_STATE_PRINT_WHICH_MOVE_PROMPT:
        sMoveRelearner->state = 20;
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        break;
    case MENU_STATE_SHOW_MOVE_SUMMARY_SCREEN:
        if (!gPaletteFade.active)
        {
            ListMenuGetScrollAndRow(sMoveRelearner->listMenuTaskId, &sMoveRelearner->listMenuScrollPos, &sMoveRelearner->listMenuScrollRow);
            FreeAllWindowBuffers();
            ShowSelectMovePokemonSummaryScreen(gPlayerParty, sMoveRelearner->selectedPartyMember, gPlayerPartyCount - 1, CB2_MoveRelearner_Resume, sMoveRelearner->learnableMoves[sMoveRelearner->selectedIndex]);
            sMoveRelearner->state = 28;
        }
        break;
    case 21:
        sMoveRelearner->state = 14;
        break;
    case 22:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        break;
    case MENU_STATE_FADE_AND_RETURN:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
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
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
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
                sMoveRelearner->state = 24;
            }
            else
            {
                move = GetMonData(&gPlayerParty[sMoveRelearner->selectedPartyMember], MON_DATA_MOVE1 + sMoveRelearner->selectedMoveSlot);
                StringCopy(gStringVar3, gMoveNames[move]);
                RemoveMonPPBonus(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->selectedMoveSlot);
                SetMonMoveSlot(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->learnableMoves[sMoveRelearner->selectedIndex], sMoveRelearner->selectedMoveSlot);
                StringCopy(gStringVar2, gMoveNames[sMoveRelearner->learnableMoves[sMoveRelearner->selectedIndex]]);
                StringExpandPlaceholdersAndPrintTextOnWindow7Color2(gText_1_2_and_Poof);
                sMoveRelearner->state = 30;
                gSpecialVar_0x8004 = TRUE;
            }
        }
        break;
    case MENU_STATE_DOUBLE_FANFARE_FORGOT_MOVE:
        StringExpandPlaceholdersAndPrintTextOnWindow7Color2(gText_MonForgotOldMoveAndMonLearnedNewMove);
        sMoveRelearner->state = 31;
        PlayFanfare(MUS_LEVEL_UP);
        break;
    case MENU_STATE_PRINT_TEXT_THEN_FANFARE:
        PlayFanfare(MUS_LEVEL_UP);
        sMoveRelearner->state = 32;
        break;
    case MENU_STATE_WAIT_FOR_FANFARE:
        if (IsFanfareTaskInactive())
            sMoveRelearner->state = 33;
        break;
    case MENU_STATE_WAIT_FOR_A_BUTTON:
        if (JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            sMoveRelearner->state = 14;
        }
        break;
    }
}

static void DrawTextBorderOnWindows6and7(void)
{
    int i;
    for (i = 6; i < 8; i++)
        DrawTextBorderOuter(i, 0x001, 14);
}

static void PrintTeachWhichMoveToStrVar1(bool8 onInit)
{
    if (!onInit)
    {
        StringExpandPlaceholders(gStringVar4, gText_TeachWhichMoveToMon);
        PrintTextOnWindow(7, gStringVar4, 0, 2, 0, 2);
        PutWindowTilemap(7);
        CopyWindowToVram(7, COPYWIN_FULL);
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

static void SpriteCB_ListMenuScrollIndicators(struct Sprite *sprite)
{
    s16 abcissa = (sprite->data[1] * 10) & 0xFF;
    switch (sprite->data[0])
    {
    case 0:
        break;
    case 1:
        sprite->x2 = Sin(abcissa, 3) * sprite->data[2];
        break;
    case 2:
        sprite->y2 = Sin(abcissa, 1) * sprite->data[2];
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

    // Bug: This should be using the second element of spriteIds.
    sMoveRelearner->spriteIds[0] = CreateSprite(&sSpriteTemplate_MoveRelearnerListMenuScrollIndicators, 200, 108, 0);
    gSprites[sMoveRelearner->spriteIds[0]].data[0] = 2;
    gSprites[sMoveRelearner->spriteIds[0]].data[2] = 1;
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
    StringCopy_Nickname(gStringVar1, nickname);
    StringCopy(sMoveRelearner->listMenuStrbufs[sMoveRelearner->numLearnableMoves], gFameCheckerText_Cancel);
    sMoveRelearner->numLearnableMoves++;
    for (i = 0; i < count; i++)
    {
        sMoveRelearner->listMenuItems[i].label = sMoveRelearner->listMenuStrbufs[i];
        sMoveRelearner->listMenuItems[i].index = i;
    }
    sMoveRelearner->listMenuItems[i].label = gFameCheckerText_Cancel;
    sMoveRelearner->listMenuItems[i].index = 0xFE;
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
        if (sMoveRelearner->selectedIndex != 0xFE)
        {
            sMoveRelearner->state = 8;
            StringCopy(gStringVar2, sMoveRelearner->listMenuStrbufs[sMoveRelearner->selectedIndex]);
            StringExpandPlaceholdersAndPrintTextOnWindow7Color2(gText_TeachMoveQues);
        }
        else
        {
            StringExpandPlaceholdersAndPrintTextOnWindow7Color2(gText_GiveUpTryingToTeachNewMove);
            sMoveRelearner->state = 12;
        }
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        sMoveRelearner->state = 12;
        StringExpandPlaceholdersAndPrintTextOnWindow7Color2(gText_GiveUpTryingToTeachNewMove);
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
    CopyWindowToVram(6, COPYWIN_MAP);
}

static void PrintMoveInfo(u16 move)
{
    u8 buffer[50];
    BlitMenuInfoIcon(2, gBattleMoves[move].type + 1, 1, 4);

    if (gBattleMoves[move].power < 2)
    {
        PrintTextOnWindow(3, gText_ThreeHyphens, 1, 4, 0, 0);
    }
    else
    {
        ConvertIntToDecimalStringN(buffer, gBattleMoves[move].power, STR_CONV_MODE_RIGHT_ALIGN, 3);
        PrintTextOnWindow(3, buffer, 1, 4, 0, 0);
    }

    if (gBattleMoves[move].accuracy == 0)
    {
        PrintTextOnWindow(3, gText_ThreeHyphens, 1, 18, 0, 1);
    }
    else
    {
        ConvertIntToDecimalStringN(buffer, gBattleMoves[move].accuracy, STR_CONV_MODE_RIGHT_ALIGN, 3);
        PrintTextOnWindow(3, buffer, 1, 18, 0, 1);
    }
    ConvertIntToDecimalStringN(buffer, gBattleMoves[move].pp, STR_CONV_MODE_LEFT_ALIGN, 2);
    PrintTextOnWindow(4, buffer, 2, 2, 0, 0);
    PrintTextOnWindow(5, gMoveDescriptionPointers[move - 1], 1, 0, 0, 0);
}

static void LoadMoveInfoUI(void)
{
    BlitMenuInfoIcon(0, MENU_INFO_ICON_TYPE, 1, 4);
    BlitMenuInfoIcon(1, MENU_INFO_ICON_POWER, 0, 4);
    BlitMenuInfoIcon(1, MENU_INFO_ICON_ACCURACY, 0, 19);
    BlitMenuInfoIcon(0, MENU_INFO_ICON_PP, 1, 19);
    BlitMenuInfoIcon(0, MENU_INFO_ICON_EFFECT, 1, 34);
    PutWindowTilemap(0);
    PutWindowTilemap(1);
    PutWindowTilemap(4);
    PutWindowTilemap(3);
    PutWindowTilemap(5);
    PutWindowTilemap(2);
    PutWindowTilemap(7);
    CopyWindowToVram(0, COPYWIN_GFX);
    CopyWindowToVram(1, COPYWIN_GFX);
}

static void PrintMoveInfoHandleCancel_CopyToVram(void)
{
    int i;
    if (sMoveRelearner->selectedIndex != 0xFE)
    {
        PrintMoveInfo(sMoveRelearner->learnableMoves[sMoveRelearner->selectedIndex]);
    }
    else
    {
        for (i = 2; i < 6; i++)
        {
            FillWindowPixelBuffer(i, PIXEL_FILL(0));
            CopyWindowToVram(i, COPYWIN_GFX);
        }
    }
    CopyWindowToVram(3, COPYWIN_GFX);
    CopyWindowToVram(4, COPYWIN_GFX);
    CopyWindowToVram(2, COPYWIN_GFX);
    CopyWindowToVram(2, COPYWIN_GFX);
    CopyWindowToVram(5, COPYWIN_GFX);
    CopyWindowToVram(7, COPYWIN_FULL);
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
    if (input != -2)
    {
        PutWindowTilemap(6);
        CopyWindowToVram(6, COPYWIN_MAP);
    }
    return input;
}

static void PrintTextOnWindow(u8 windowId, const u8 *str, u8 x, u8 y, s32 speed, s32 colorIdx)
{
    s32 letterSpacing = 1;
    s32 lineSpacing = 1;
    if (colorIdx == 0 || colorIdx == 1)
    {
        letterSpacing = 0;
        lineSpacing = 0;
    }
    switch (colorIdx)
    {
    case 0:
    case 1:
        sMoveRelearner->textColor[0] = 0;
        sMoveRelearner->textColor[1] = 2;
        sMoveRelearner->textColor[2] = 3;
        break;
    case 2:
        sMoveRelearner->textColor[0] = 1;
        sMoveRelearner->textColor[1] = 2;
        sMoveRelearner->textColor[2] = 3;
    }
    if (colorIdx != 1)
        FillWindowPixelBuffer(windowId, PIXEL_FILL(sMoveRelearner->textColor[0]));
    AddTextPrinterParameterized4(windowId, FONT_NORMAL_COPY_2, x, y, letterSpacing, lineSpacing, sMoveRelearner->textColor, speed, str);
}
