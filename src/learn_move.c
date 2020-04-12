#include "global.h"
#include "bg.h"
#include "malloc.h"
#include "gpu_regs.h"
#include "palette.h"
#include "script.h"
#include "task.h"
#include "data.h"
#include "trig.h"
#include "window.h"
#include "field_fadetransition.h"
#include "overworld.h"
#include "new_menu_helpers.h"
#include "menu.h"
#include "list_menu.h"
#include "event_data.h"
#include "text_window.h"
#include "string_util.h"
#include "pokemon_summary_screen.h"
#include "graphics.h"
#include "sound.h"
#include "strings.h"
#include "constants/songs.h"
#include "constants/moves.h"


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
    struct ListMenuItem listMenuItems[255];
    u16 learnableMoves[255];
    u8 listMenuStrbufs[255][13];
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
        .paletteNum = 0x0d,
        .baseBlock = 0x014
    },
    {
        .bg = 0,
        .tilemapLeft = 10,
        .tilemapTop = 0,
        .width = 5,
        .height = 5,
        .paletteNum = 0x0d,
        .baseBlock = 0x03e
    },
    {
        .bg = 0,
        .tilemapLeft = 5,
        .tilemapTop = 0,
        .width = 5,
        .height = 2,
        .paletteNum = 0x0d,
        .baseBlock = 0x057
    },
    {
        .bg = 0,
        .tilemapLeft = 15,
        .tilemapTop = 0,
        .width = 3,
        .height = 5,
        .paletteNum = 0x0f,
        .baseBlock = 0x061
    },
    {
        .bg = 0,
        .tilemapLeft = 5,
        .tilemapTop = 2,
        .width = 3,
        .height = 3,
        .paletteNum = 0x0f,
        .baseBlock = 0x070
    },
    {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 6,
        .width = 15,
        .height = 8,
        .paletteNum = 0x0f,
        .baseBlock = 0x079
    },
    {
        .bg = 0,
        .tilemapLeft = 19,
        .tilemapTop = 1,
        .width = 10,
        .height = 12,
        .paletteNum = 0x0f,
        .baseBlock = 0x0f1
    },
    {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 15,
        .width = 26,
        .height = 4,
        .paletteNum = 0x0f,
        .baseBlock = 0x169
    }, DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate gUnknown_83FFA8C = {
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
        FillWindowPixelBuffer(7, PIXEL_FILL(1));
        FillBgTilemapBufferRect(0, 0x000, 0, 0, 30, 20, 0xF);
        SetBgTilemapBuffer(1, sMoveRelearner->bg1TilemapBuffer);
        TextWindow_SetUserSelectedFrame(0, 1, 0xE0);
        ListMenuLoadStdPalAt(0xD0, 1);
        LoadPalette(gUnknown_8E97DDC, 0x00, 0x20);
        DecompressAndLoadBgGfxUsingHeap(1, gUnknown_8E97DFC, 0, 0, 0);
        CopyToBgTilemapBuffer(1, gUnknown_8E97EC4, 0, 0);
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
    case 0:
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
    case 1:
        if (!gPaletteFade.active)
            sMoveRelearner->state = 4;
        break;
    case 2:
        sMoveRelearner->state++;
        break;
    case 3:
        PrintTeachWhichMoveToStrVar1(FALSE);
        sMoveRelearner->scheduleMoveInfoUpdate = TRUE;
        sMoveRelearner->state++;
        break;
    case 4:
        MoveRelearnerMenuHandleInput();
        break;
    case 8:
        CreateYesNoMenu(&gUnknown_83FFA8C, 3, 0, 2, 0x001, 0xE, 0);
        sMoveRelearner->state++;
        break;
    case 9:
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
    case 12:
        CreateYesNoMenu(&gUnknown_83FFA8C, 3, 0, 2, 0x001, 0xE, 0);
        sMoveRelearner->state++;
        break;
    case 13:
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
    case 16:
        StringExpandPlaceholdersAndPrintTextOnWindow7Color2(gText_MonIsTryingToLearnMove);
        sMoveRelearner->state++;
        break;
    case 17:
        CreateYesNoMenu(&gUnknown_83FFA8C, 3, 0, 2, 0x001, 0xE, 0);
        sMoveRelearner->state = 18;
        break;
    case 18:
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
    case 24:
        StringExpandPlaceholdersAndPrintTextOnWindow7Color2(gText_StopLearningMove);
        sMoveRelearner->state++;
        break;
    case 25:
        CreateYesNoMenu(&gUnknown_83FFA8C, 3, 0, 2, 0x001, 0xE, 0);
        sMoveRelearner->state = 26;
        break;
    case 26:
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
    case 27:
        sMoveRelearner->state = 3;
        break;
    case 19:
        sMoveRelearner->state = 20;
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        break;
    case 20:
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
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        break;
    case 14:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        sMoveRelearner->state++;
        break;
    case 15:
        if (!gPaletteFade.active)
        {
            FreeAllWindowBuffers();
            Free(sMoveRelearner);
            SetMainCallback2(CB2_ReturnToField);
        }
        break;
    case 28:
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
    case 29:
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
    case 30:
        StringExpandPlaceholdersAndPrintTextOnWindow7Color2(gText_MonForgotOldMoveAndMonLearnedNewMove);
        sMoveRelearner->state = 31;
        PlayFanfare(MUS_FANFA1);
        break;
    case 31:
        PlayFanfare(MUS_FANFA1);
        sMoveRelearner->state = 32;
        break;
    case 32:
        if (IsFanfareTaskInactive())
            sMoveRelearner->state = 33;
        break;
    case 33:
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
        DrawTextBorderOuter(i, 0x001, 0xE);
}

static void PrintTeachWhichMoveToStrVar1(bool8 onInit)
{
    if (!onInit)
    {
        StringExpandPlaceholders(gStringVar4, gText_TeachWhichMoveToMon);
        PrintTextOnWindow(7, gStringVar4, 0, 2, 0, 2);
        PutWindowTilemap(7);
        CopyWindowToVram(7, 3);
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

    // Bug: This should be using the second element of spriteIds.
    sMoveRelearner->spriteIds[0] = CreateSprite(&sSpriteTemplate_MoveRelearnerListMenuScrollIndicators, 200, 108, 0);
    gSprites[sMoveRelearner->spriteIds[0]].data[0] = 2;
    gSprites[sMoveRelearner->spriteIds[0]].data[2] = 1;
    for (i = 0; i < 2; i++)
        gSprites[sMoveRelearner->spriteIds[i]].invisible = TRUE;
}

u8 GetTMMoves(struct Pokemon *mon, u16 *moves);
u8 GetEggMoves(struct Pokemon *pokemon, u16 *eggMoves);
u8 GetTutorMoves(struct Pokemon *mon, u16 *moves);
u8 GetHMMoves(struct Pokemon *mon, u16 *moves);
u8 GetVCMoves(struct Pokemon *mon, u16 *moves);
u8 GetEventMoves(struct Pokemon *mon, u16 *moves);
static void MoveRelearnerInitListMenuBuffersEtc(void)
{
    int i;
    s32 count;
    u8 nickname[11];

    sMoveRelearner->numLearnableMoves = GetMoveRelearnerMoves(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->learnableMoves);
    if (FlagGet(FLAG_EGG_MOVES))
	sMoveRelearner->numLearnableMoves += GetEggMoves(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->learnableMoves + sMoveRelearner->numLearnableMoves);
    if (FlagGet(FLAG_TM_MOVES))
	sMoveRelearner->numLearnableMoves += GetTMMoves(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->learnableMoves + sMoveRelearner->numLearnableMoves);
    if (FlagGet(FLAG_HM_MOVES))
	sMoveRelearner->numLearnableMoves += GetHMMoves(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->learnableMoves + sMoveRelearner->numLearnableMoves);
    if (FlagGet(FLAG_TUTOR_MOVES))
	sMoveRelearner->numLearnableMoves += GetTutorMoves(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->learnableMoves + sMoveRelearner->numLearnableMoves);
    if (FlagGet(FLAG_VC_MOVES))
	sMoveRelearner->numLearnableMoves += GetVCMoves(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->learnableMoves + sMoveRelearner->numLearnableMoves);
    if (FlagGet(FLAG_EVENT_MOVES))
	sMoveRelearner->numLearnableMoves += GetEventMoves(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->learnableMoves + sMoveRelearner->numLearnableMoves);
    count = GetMoveRelearnerMoves(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->learnableMoves);
    if (FlagGet(FLAG_EGG_MOVES))
	count += GetEggMoves(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->learnableMoves + sMoveRelearner->numLearnableMoves);
    if (FlagGet(FLAG_TM_MOVES))
	count += GetTMMoves(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->learnableMoves + sMoveRelearner->numLearnableMoves);
	if (FlagGet(FLAG_HM_MOVES))
	count += GetHMMoves(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->learnableMoves + sMoveRelearner->numLearnableMoves);
    if (FlagGet(FLAG_TUTOR_MOVES))
	count += GetTutorMoves(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->learnableMoves + sMoveRelearner->numLearnableMoves);
    if (FlagGet(FLAG_VC_MOVES))
	count += GetVCMoves(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->learnableMoves + sMoveRelearner->numLearnableMoves);
    if (FlagGet(FLAG_EVENT_MOVES))
	count += GetEventMoves(&gPlayerParty[sMoveRelearner->selectedPartyMember], sMoveRelearner->learnableMoves + sMoveRelearner->numLearnableMoves);
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
			if (FlagGet(FLAG_LEARN_MOVES)) {
				sMoveRelearner->state = 8;
				StringCopy(gStringVar2, sMoveRelearner->listMenuStrbufs[sMoveRelearner->selectedIndex]);
				StringExpandPlaceholdersAndPrintTextOnWindow7Color2(gText_TeachMoveQues);
			}
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
    CopyWindowToVram(6, 1);
}

static void PrintMoveInfo(u16 move)
{
    u8 buffer[50];
    BlitMoveInfoIcon(2, gBattleMoves[move].type + 1, 1, 4);

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
    BlitMoveInfoIcon(0, 19, 1, 4);
    BlitMoveInfoIcon(1, 20, 0, 4);
    BlitMoveInfoIcon(1, 21, 0, 19);
    BlitMoveInfoIcon(0, 22, 1, 19);
    BlitMoveInfoIcon(0, 23, 1, 34);
    PutWindowTilemap(0);
    PutWindowTilemap(1);
    PutWindowTilemap(4);
    PutWindowTilemap(3);
    PutWindowTilemap(5);
    PutWindowTilemap(2);
    PutWindowTilemap(7);
    CopyWindowToVram(0, 2);
    CopyWindowToVram(1, 2);
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
            CopyWindowToVram(i, 2);
        }
    }
    CopyWindowToVram(3, 2);
    CopyWindowToVram(4, 2);
    CopyWindowToVram(2, 2);
    CopyWindowToVram(2, 2);
    CopyWindowToVram(5, 2);
    CopyWindowToVram(7, 3);
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
        CopyWindowToVram(6, 1);
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
    AddTextPrinterParameterized4(windowId, 3, x, y, letterSpacing, lineSpacing, sMoveRelearner->textColor, speed, str);
}
