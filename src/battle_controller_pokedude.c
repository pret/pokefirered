#include "global.h"
#include "gflib.h"
#include "task.h"
#include "party_menu.h"
#include "pokeball.h"
#include "data.h"
#include "util.h"
#include "m4a.h"
#include "link.h"
#include "event_data.h"
#include "item_menu.h"
#include "strings.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_controllers.h"
#include "battle_interface.h"
#include "battle_message.h"
#include "reshow_battle_screen.h"
#include "teachy_tv.h"
#include "constants/battle_string_ids.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/songs.h"

struct PokedudeTextScriptHeader
{
    u8 btlcmd;
    u8 side;
    u16 stringid;
    void (*callback)(enum BattlerId battler);
};

struct PokedudeBattlePartyInfo
{
    u8 side;
    u8 level;
    u16 species;
    u16 moves[MAX_MON_MOVES];
    u8 nature;
    u8 gender;
};

static void PokedudeHandleDrawTrainerPic(enum BattlerId battler);
static void PokedudeHandleTrainerSlide(enum BattlerId battler);
static void PokedudeHandlePrintSelectionString(enum BattlerId battler);
static void PokedudeHandleChooseAction(enum BattlerId battler);
static void PokedudeHandleChooseMove(enum BattlerId battler);
static void PokedudeHandleChooseItem(enum BattlerId battler);
static void PokedudeHandleChoosePokemon(enum BattlerId battler);
static void PokedudeHandleStatusXor(enum BattlerId battler);
static void PokedudeHandlePlaySE(enum BattlerId battler);
static void PokedudeHandleIntroTrainerBallThrow(enum BattlerId battler);
static void PokedudeHandleDrawPartyStatusSummary(enum BattlerId battler);
static void PokedudeHandleEndBounceEffect(enum BattlerId battler);
static void PokedudeHandleLinkStandbyMsg(enum BattlerId battler);
static void PokedudeHandleEndLinkBattle(enum BattlerId battler);

static void PokedudeAction_PrintVoiceoverMessage(enum BattlerId battler);
static void PokedudeAction_PrintMessageWithHealthboxPals(enum BattlerId battler);
static void PokedudeSimulateInputChooseAction(enum BattlerId battler);
static void PokedudeBufferRunCommand(enum BattlerId battler);
static bool8 HandlePokedudeVoiceoverEtc(enum BattlerId battler);
static void PokedudeSimulateInputChooseMove(enum BattlerId battler);
static void WaitForMonSelection(enum BattlerId battler);
static void CompleteWhenChoseItem(enum BattlerId battler);
static void Intro_WaitForShinyAnimAndHealthbox(enum BattlerId battler);
static const u8 *GetPokedudeText(void);

static void (*const sPokedudeBufferCommands[CONTROLLER_CMDS_COUNT])(enum BattlerId battler) =
{
    [CONTROLLER_GETMONDATA]               = BtlController_HandleGetMonData,
    [CONTROLLER_GETRAWMONDATA]            = BtlController_Empty,
    [CONTROLLER_SETMONDATA]               = BtlController_HandleSetMonData,
    [CONTROLLER_SETRAWMONDATA]            = BtlController_Empty,
    [CONTROLLER_LOADMONSPRITE]            = BtlController_HandleLoadMonSprite,
    [CONTROLLER_SWITCHINANIM]             = BtlController_HandleSwitchInAnim,
    [CONTROLLER_RETURNMONTOBALL]          = BtlController_HandleReturnMonToBall,
    [CONTROLLER_DRAWTRAINERPIC]           = PokedudeHandleDrawTrainerPic,
    [CONTROLLER_TRAINERSLIDE]             = PokedudeHandleTrainerSlide,
    [CONTROLLER_TRAINERSLIDEBACK]         = BtlController_Empty,
    [CONTROLLER_FAINTANIMATION]           = BtlController_HandleFaintAnimation,
    [CONTROLLER_PALETTEFADE]              = BtlController_Empty,
    [CONTROLLER_BALLTHROWANIM]            = BtlController_HandleBallThrowAnim,
    [CONTROLLER_PAUSE]                    = BtlController_Empty,
    [CONTROLLER_MOVEANIMATION]            = BtlController_HandleMoveAnimation,
    [CONTROLLER_PRINTSTRING]              = BtlController_HandlePrintString,
    [CONTROLLER_PRINTSTRINGPLAYERONLY]    = PokedudeHandlePrintSelectionString,
    [CONTROLLER_CHOOSEACTION]             = PokedudeHandleChooseAction,
    [CONTROLLER_YESNOBOX]                 = BtlController_Empty,
    [CONTROLLER_CHOOSEMOVE]               = PokedudeHandleChooseMove,
    [CONTROLLER_OPENBAG]                  = PokedudeHandleChooseItem,
    [CONTROLLER_CHOOSEPOKEMON]            = PokedudeHandleChoosePokemon,
    [CONTROLLER_23]                       = BtlController_Empty,
    [CONTROLLER_HEALTHBARUPDATE]          = BtlController_HandleHealthBarUpdate,
    [CONTROLLER_EXPUPDATE]                = PlayerHandleExpUpdate,
    [CONTROLLER_STATUSICONUPDATE]         = BtlController_HandleStatusIconUpdate,
    [CONTROLLER_STATUSANIMATION]          = BtlController_HandleStatusAnimation,
    [CONTROLLER_STATUSXOR]                = PokedudeHandleStatusXor,
    [CONTROLLER_DATATRANSFER]             = BtlController_Empty,
    [CONTROLLER_DMA3TRANSFER]             = BtlController_Empty,
    [CONTROLLER_PLAYBGM]                  = BtlController_Empty,
    [CONTROLLER_32]                       = BtlController_Empty,
    [CONTROLLER_TWORETURNVALUES]          = BtlController_Empty,
    [CONTROLLER_CHOSENMONRETURNVALUE]     = BtlController_Empty,
    [CONTROLLER_ONERETURNVALUE]           = BtlController_Empty,
    [CONTROLLER_ONERETURNVALUE_DUPLICATE] = BtlController_Empty,
    [CONTROLLER_HITANIMATION]             = BtlController_HandleHitAnimation,
    [CONTROLLER_CANTSWITCH]               = BtlController_Empty,
    [CONTROLLER_PLAYSE]                   = PokedudeHandlePlaySE,
    [CONTROLLER_PLAYFANFAREORBGM]         = BtlController_HandlePlayFanfareOrBGM,
    [CONTROLLER_FAINTINGCRY]              = BtlController_HandleFaintingCry,
    [CONTROLLER_INTROSLIDE]               = BtlController_HandleIntroSlide,
    [CONTROLLER_INTROTRAINERBALLTHROW]    = PokedudeHandleIntroTrainerBallThrow,
    [CONTROLLER_DRAWPARTYSTATUSSUMMARY]   = PokedudeHandleDrawPartyStatusSummary,
    [CONTROLLER_HIDEPARTYSTATUSSUMMARY]   = BtlController_Empty,
    [CONTROLLER_ENDBOUNCE]                = PokedudeHandleEndBounceEffect,
    [CONTROLLER_SPRITEINVISIBILITY]       = BtlController_Empty,
    [CONTROLLER_BATTLEANIMATION]          = BtlController_HandleBattleAnimation,
    [CONTROLLER_LINKSTANDBYMSG]           = PokedudeHandleLinkStandbyMsg,
    [CONTROLLER_RESETACTIONMOVESELECTION] = BtlController_Empty,
    [CONTROLLER_ENDLINKBATTLE]            = PokedudeHandleEndLinkBattle,
    [CONTROLLER_DEBUGMENU]                = BtlController_Empty,
    [CONTROLLER_TERMINATOR_NOP]           = BtlController_TerminatorNop,
};

#define pdHealthboxPal1  simulatedInputState[0]
#define pdHealthboxPal2  simulatedInputState[1]
#define pdScriptNum      simulatedInputState[2]
#define pdMessageNo      simulatedInputState[3]

void SetControllerToPokedude(enum BattlerId battler)
{
    gBattlerControllerEndFuncs[battler] = PokedudeBufferExecCompleted;
    gBattlerControllerFuncs[battler] = PokedudeBufferRunCommand;
    *(&gBattleStruct->pdScriptNum) = gSpecialVar_0x8004;
    gBattleStruct->pdMessageNo = 0;
}

static void PokedudeBufferRunCommand(enum BattlerId battler)
{
    if (gBattleControllerExecFlags & (1u << battler))
    {
        if (gBattleResources->bufferA[battler][0] < ARRAY_COUNT(sPokedudeBufferCommands))
        {
            if (!HandlePokedudeVoiceoverEtc(battler))
                sPokedudeBufferCommands[gBattleResources->bufferA[battler][0]](battler);
        }
        else
        {
            PokedudeBufferExecCompleted(battler);
        }
    }
}

static void HandleInputChooseAction(enum BattlerId battler)
{
    PokedudeSimulateInputChooseAction(battler);
}

static void Pokedude_SetBattleEndCallbacks(enum BattlerId battler)
{
    if (!gPaletteFade.active)
    {
        gMain.inBattle = FALSE;
        gMain.callback1 = gPreBattleCallback1;
        SetMainCallback2(gMain.savedCallback);
    }
}

static void Intro_DelayAndEnd(enum BattlerId battler)
{
    if (--gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay == 255)
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay = 0;
        PokedudeBufferExecCompleted(battler);
    }
}

static void PokedudeHandleInputChooseMove(enum BattlerId battler)
{
    PokedudeSimulateInputChooseMove(battler);
}

static void OpenPartyMenuToChooseMon(enum BattlerId battler)
{
    if (!gPaletteFade.active)
    {
        gBattlerControllerFuncs[battler] = WaitForMonSelection;
        DestroyTask(gBattleControllerData[battler]);
        FreeAllWindowBuffers();
        Pokedude_OpenPartyMenuInBattle();
    }
}

static void WaitForMonSelection(enum BattlerId battler)
{
    if (gMain.callback2 == BattleMainCB2 && !gPaletteFade.active)
    {
        if (gPartyMenuUseExitCallback == TRUE)
            BtlController_EmitChosenMonReturnValue(battler, 1, gSelectedMonPartyId, gBattlePartyCurrentOrder);
        else
            BtlController_EmitChosenMonReturnValue(battler, 1, 6, NULL);
        PokedudeBufferExecCompleted(battler);
    }
}

static void OpenBagAndChooseItem(enum BattlerId battler)
{
    u8 callbackId;

    if (!gPaletteFade.active)
    {
        gBattlerControllerFuncs[battler] = CompleteWhenChoseItem;
        ReshowBattleScreenDummy();
        FreeAllWindowBuffers();
        switch (gSpecialVar_0x8004)
        {
        case TTVSCR_STATUS:
        default:
            callbackId = ITEMMENULOCATION_TTVSCR_STATUS;
            break;
        case TTVSCR_CATCHING:
            callbackId = ITEMMENULOCATION_TTVSCR_CATCHING;
            break;
        }
        InitPokedudeBag(callbackId);
    }
}

static void CompleteWhenChoseItem(enum BattlerId battler)
{
    if (gMain.callback2 == BattleMainCB2 && !gPaletteFade.active)
    {
        BtlController_EmitOneReturnValue(battler, 1, gSpecialVar_ItemId);
        PokedudeBufferExecCompleted(battler);
    }
}

static void Intro_TryShinyAnimShowHealthbox(enum BattlerId battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim
        && !gBattleSpritesDataPtr->healthBoxesData[battler].ballAnimActive)
        TryShinyAnimation(battler, &gPlayerParty[gBattlerPartyIndexes[battler]]);
    if (!gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].triedShinyMonAnim
        && !gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].ballAnimActive)
        TryShinyAnimation(BATTLE_PARTNER(battler), &gPlayerParty[gBattlerPartyIndexes[BATTLE_PARTNER(battler)]]);
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].ballAnimActive && !gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].ballAnimActive)
    {
        if (IsDoubleBattle() && !(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            DestroySprite(&gSprites[gBattleControllerData[BATTLE_PARTNER(battler)]]);
            UpdateHealthboxAttribute(gHealthboxSpriteIds[BATTLE_PARTNER(battler)],
                                     &gPlayerParty[gBattlerPartyIndexes[BATTLE_PARTNER(battler)]],
                                     HEALTHBOX_ALL);
            StartHealthboxSlideIn(BATTLE_PARTNER(battler));
            SetHealthboxSpriteVisible(gHealthboxSpriteIds[BATTLE_PARTNER(battler)]);
        }
        DestroySprite(&gSprites[gBattleControllerData[battler]]);
        UpdateHealthboxAttribute(gHealthboxSpriteIds[battler],
                                 &gPlayerParty[gBattlerPartyIndexes[battler]],
                                 HEALTHBOX_ALL);
        StartHealthboxSlideIn(battler);
        SetHealthboxSpriteVisible(gHealthboxSpriteIds[battler]);
        gBattleSpritesDataPtr->animationData->introAnimActive = FALSE;
        gBattlerControllerFuncs[battler] = Intro_WaitForShinyAnimAndHealthbox;
    }
}

static void Intro_WaitForShinyAnimAndHealthbox(enum BattlerId battler)
{
    bool32 r4 = FALSE;

    if (gSprites[gHealthboxSpriteIds[battler]].callback == SpriteCallbackDummy)
        r4 = TRUE;
    if (r4
        && gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim
        && gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].finishedShinyMonAnim)
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim = FALSE;
        gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim = FALSE;
        gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].triedShinyMonAnim = FALSE;
        gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].finishedShinyMonAnim = FALSE;
        FreeSpriteTilesByTag(ANIM_TAG_GOLD_STARS);
        FreeSpritePaletteByTag(ANIM_TAG_GOLD_STARS);
        CreateTask(Task_PlayerController_RestoreBgmAfterCry, 10);
        HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[battler]], battler);
        gBattlerControllerFuncs[battler] = Intro_DelayAndEnd;
    }
}

void PokedudeBufferExecCompleted(enum BattlerId battler)
{
    gBattlerControllerFuncs[battler] = PokedudeBufferRunCommand;
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        u8 playerId = GetMultiplayerId();

        PrepareBufferDataTransferLink(battler, 2, 4, &playerId);
        gBattleResources->bufferA[battler][0] = CONTROLLER_TERMINATOR_NOP;
    }
    else
    {
        gBattleControllerExecFlags &= ~(1u << battler);
    }
}

static void PokedudeHandleDrawTrainerPic(enum BattlerId battler)
{
    u32 trainerPicId;
    bool32 isFrontPic;
    s32 subpriority = -1;
    s16 xPos, yPos;

    if (GetBattlerSide(battler) == B_SIDE_PLAYER)
    {
        trainerPicId = TRAINER_BACK_PIC_POKEDUDE;
        isFrontPic = FALSE;
        subpriority = 30;
        xPos = 80;
        yPos = (8 - gTrainerBacksprites[trainerPicId].coordinates.size) * 4 + 80;
    }
    else
    {
        trainerPicId = TRAINER_PIC_PROFESSOR_OAK;
        isFrontPic = TRUE;
        xPos = 176;
        yPos = (8 - gTrainerSprites[trainerPicId].frontPicCoords.size) * 4 + 40;
    }
    BtlController_HandleDrawTrainerPic(battler, trainerPicId, isFrontPic, xPos, yPos, subpriority);
}

static void PokedudeHandleTrainerSlide(enum BattlerId battler)
{
    BtlController_HandleTrainerSlide(battler, TRAINER_BACK_PIC_POKEDUDE);
}

static void PokedudeHandlePrintSelectionString(enum BattlerId battler)
{
    if (GetBattlerSide(battler) == B_SIDE_PLAYER)
        BtlController_HandlePrintString(battler);
    else
        PokedudeBufferExecCompleted(battler);
}

static void HandleChooseActionAfterDma3(enum BattlerId battler)
{
    if (!IsDma3ManagerBusyWithBgCopy())
    {
        gBattle_BG0_X = 0;
        gBattle_BG0_Y = 160;
        gBattlerControllerFuncs[battler] = HandleInputChooseAction;
    }
}

static void PokedudeHandleChooseAction(enum BattlerId battler)
{
    s32 i;

    if (GetBattlerSide(battler) == B_SIDE_PLAYER)
    {
        gBattlerControllerFuncs[battler] = HandleChooseActionAfterDma3;
        BattlePutTextOnWindow(gText_EmptyString3, B_WIN_MSG);
        BattlePutTextOnWindow(gText_BattleMenu, B_WIN_ACTION_MENU);
        for (i = 0; i < MAX_MON_MOVES; ++i)
            ActionSelectionDestroyCursorAt((u8)i);
        ActionSelectionCreateCursorAt(gActionSelectionCursor[battler], 0);
        PREPARE_MON_NICK_BUFFER(gBattleTextBuff1, battler, gBattlerPartyIndexes[battler]);
        BattleStringExpandPlaceholdersToDisplayedString(gText_WhatWillPkmnDo);
        BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_ACTION_PROMPT);
    }
    else
    {
        gBattlerControllerFuncs[battler] = HandleInputChooseAction;
    }
}

static void PokedudeHandleChooseMoveAfterDma3(enum BattlerId battler)
{
    if (!IsDma3ManagerBusyWithBgCopy())
    {
        gBattle_BG0_X = 0;
        gBattle_BG0_Y = 320;
        gBattlerControllerFuncs[battler] = PokedudeHandleInputChooseMove;
    }
}

static void PokedudeHandleChooseMove(enum BattlerId battler)
{
    if (GetBattlerSide(battler) == B_SIDE_PLAYER)
    {
        InitMoveSelectionsVarsAndStrings(battler);
        gBattlerControllerFuncs[battler] = PokedudeHandleChooseMoveAfterDma3;
    }
    else
    {
        gBattlerControllerFuncs[battler] = PokedudeHandleInputChooseMove;
    }
}

static void PokedudeHandleChooseItem(enum BattlerId battler)
{
    s32 i;

    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 0x10, RGB_BLACK);
    gBattlerControllerFuncs[battler] = OpenBagAndChooseItem;
    gBattlerInMenuId = battler;
    for (i = 0; i < 3; ++i)
        gBattlePartyCurrentOrder[i] = gBattleResources->bufferA[battler][i + 1];
}

static void PokedudeHandleChoosePokemon(enum BattlerId battler)
{
    s32 i;

    gBattleControllerData[battler] = CreateTask(TaskDummy, 0xFF);
    gTasks[gBattleControllerData[battler]].data[0] = gBattleResources->bufferA[battler][1];
    *(&gBattleStruct->battlerPreventingSwitchout) = gBattleResources->bufferA[battler][8];
    *(&gBattleStruct->prevSelectedPartySlot) = gBattleResources->bufferA[battler][2];
    *(&gBattleStruct->abilityPreventingSwitchout) = (gBattleResources->bufferA[battler][3] & 0xFF) | (gBattleResources->bufferA[battler][7] << 8);
    for (i = 0; i < 3; ++i)
        gBattlePartyCurrentOrder[i] = gBattleResources->bufferA[battler][4 + i];
    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 0x10, RGB_BLACK);
    gBattlerControllerFuncs[battler] = OpenPartyMenuToChooseMon;
    gBattlerInMenuId = battler;
}

// shared with battle_controller_player
static void PokedudeHandleStatusXor(enum BattlerId battler)
{
    struct Pokemon *mon;
    u8 val;

    if (GetBattlerSide(battler) == B_SIDE_PLAYER)
        mon = &gPlayerParty[gBattlerPartyIndexes[battler]];
    else
        mon = &gEnemyParty[gBattlerPartyIndexes[battler]];
    val = GetMonData(mon, MON_DATA_STATUS) ^ gBattleResources->bufferA[battler][1];
    SetMonData(mon, MON_DATA_STATUS, &val);
    PokedudeBufferExecCompleted(battler);
}

static void PokedudeHandlePlaySE(enum BattlerId battler)
{
    PlaySE(gBattleResources->bufferA[battler][1] | (gBattleResources->bufferA[battler][2] << 8));
    PokedudeBufferExecCompleted(battler);
}

static void PokedudeHandleIntroTrainerBallThrow(enum BattlerId battler)
{
    BtlController_HandleIntroTrainerBallThrow(battler, 0xD6F8, gTrainerBacksprites[TRAINER_BACK_PIC_POKEDUDE].palette.data, 31, Intro_TryShinyAnimShowHealthbox);
}

static void PokedudeHandleDrawPartyStatusSummary(enum BattlerId battler)
{
    if (gBattleResources->bufferA[battler][1] != 0
        && GetBattlerSide(battler) == B_SIDE_PLAYER)
    {
        PokedudeBufferExecCompleted(battler);
    }
    else
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusSummaryShown = TRUE;
        gBattlerStatusSummaryTaskId[battler] = CreatePartyStatusSummarySprites(battler,
                                                                                      (struct HpAndStatus *)&gBattleResources->bufferA[battler][4],
                                                                                      gBattleResources->bufferA[battler][1],
                                                                                      gBattleResources->bufferA[battler][2]);
        PokedudeBufferExecCompleted(battler);
    }
}

static void PokedudeHandleEndBounceEffect(enum BattlerId battler)
{
    EndBounceEffect(battler, BOUNCE_HEALTHBOX);
    EndBounceEffect(battler, BOUNCE_MON);
    PokedudeBufferExecCompleted(battler);
}

static void PokedudeHandleLinkStandbyMsg(enum BattlerId battler)
{
    switch (gBattleResources->bufferA[battler][1])
    {
    case LINK_STANDBY_MSG_STOP_BOUNCE:
    case LINK_STANDBY_STOP_BOUNCE_ONLY:
        EndBounceEffect(battler, BOUNCE_HEALTHBOX);
        EndBounceEffect(battler, BOUNCE_MON);
        break;
    case LINK_STANDBY_MSG_ONLY:
        break;
    }
    PokedudeBufferExecCompleted(battler);
}

static void PokedudeHandleEndLinkBattle(enum BattlerId battler)
{
    gBattleOutcome = gBattleResources->bufferA[battler][1];
    FadeOutMapMusic(5);
    BeginFastPaletteFade(FAST_FADE_OUT_TO_BLACK);
    PokedudeBufferExecCompleted(battler);
    if (!(gBattleTypeFlags & BATTLE_TYPE_IS_MASTER) && gBattleTypeFlags & BATTLE_TYPE_LINK)
        gBattlerControllerFuncs[battler] = Pokedude_SetBattleEndCallbacks;
}

// Script handlers

struct PokedudeInputScript
{
    // 0-3 for selection, 4 to repeat action, 255 to repeat move
    u8 cursorPos[MAX_BATTLERS_COUNT];
    u8 delay[MAX_BATTLERS_COUNT];
};

static const struct PokedudeInputScript sInputScripts_ChooseAction_Battle[] =
{
    {
        .cursorPos = {0, 0},
        .delay     = {64, 0}
    },
    {
        .cursorPos = {4, 4},
        .delay     = {0, 0}
    },
};

static const struct PokedudeInputScript sInputScripts_ChooseAction_Status[] =
{
    {
        .cursorPos = {0, 0},
        .delay     = {64, 0}
    },
    {
        .cursorPos = {1, 0},
        .delay     = {64, 0}
    },
    {
        .cursorPos = {0, 0},
        .delay     = {64, 0}
    },
};

static const struct PokedudeInputScript sInputScripts_ChooseAction_Matchups[] =
{
    {
        .cursorPos = {0, 0},
        .delay     = {64, 0}
    },
    {
        .cursorPos = {2, 0},
        .delay     = {64, 0}
    },
    {
        .cursorPos = {0, 0},
        .delay     = {64, 0}
    },
};

static const struct PokedudeInputScript sInputScripts_ChooseAction_Catching[] =
{
    {
        .cursorPos = {0, 0},
        .delay     = {64, 0}
    },
    {
        .cursorPos = {0, 0},
        .delay     = {64, 0}
    },
    {
        .cursorPos = {1, 0},
        .delay     = {64, 0}
    },
};

static const struct PokedudeInputScript *const sInputScripts_ChooseAction[] =
{
    [TTVSCR_BATTLE]   = sInputScripts_ChooseAction_Battle,
    [TTVSCR_STATUS]   = sInputScripts_ChooseAction_Status,
    [TTVSCR_MATCHUPS] = sInputScripts_ChooseAction_Matchups,
    [TTVSCR_CATCHING] = sInputScripts_ChooseAction_Catching,
};

static const struct PokedudeInputScript sInputScripts_ChooseMove_Battle[] =
{
    {
        .cursorPos = {  2,   2},
        .delay     = { 64,   0}
    },
    {
        .cursorPos = {255, 255},
        .delay     = {  0,   0}
    },
};

static const struct PokedudeInputScript sInputScripts_ChooseMove_Status[] =
{
    {
        .cursorPos = {  2,   2},
        .delay     = { 64,   0}
    },
    {
        .cursorPos = {  2,   0},
        .delay     = { 64,   0}
    },
    {
        .cursorPos = {  2,   0},
        .delay     = { 64,   0}
    },
    {
        .cursorPos = {255, 255},
        .delay     = {  0,   0}
    },
};

static const struct PokedudeInputScript sInputScripts_ChooseMove_Matchups[] =
{
    {
        .cursorPos = {  2,   0},
        .delay     = { 64,   0}
    },
    {
        .cursorPos = {  0,   0},
        .delay     = { 64,   0}
    },
    {
        .cursorPos = {  0,   0},
        .delay     = { 64,   0}
    },
    {
        .cursorPos = {255, 255},
        .delay     = {  0,   0}
    },
};

static const struct PokedudeInputScript sInputScripts_ChooseMove_Catching[] =
{
    {
        .cursorPos = {  0,   2},
        .delay     = { 64,   0}
    },
    {
        .cursorPos = {  2,   2},
        .delay     = { 64,   0}
    },
    {
        .cursorPos = {255, 255},
        .delay     = {  0,   0}
    },
};

static const struct PokedudeInputScript *const sInputScripts_ChooseMove[] =
{
    [TTVSCR_BATTLE]   = sInputScripts_ChooseMove_Battle,
    [TTVSCR_STATUS]   = sInputScripts_ChooseMove_Status,
    [TTVSCR_MATCHUPS] = sInputScripts_ChooseMove_Matchups,
    [TTVSCR_CATCHING] = sInputScripts_ChooseMove_Catching,
};

static const struct PokedudeTextScriptHeader sPokedudeTextScripts_Battle[] =
{
    {
        .btlcmd = CONTROLLER_CHOOSEACTION,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_PRINTSTRING,
        .side = B_SIDE_OPPONENT,
        .stringid = STRINGID_USEDMOVE,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_CHOOSEACTION,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_PRINTSTRING,
        .side = B_SIDE_PLAYER,
        .stringid = STRINGID_PKMNGAINEDEXP,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
};

static const struct PokedudeTextScriptHeader sPokedudeTextScripts_Status[] =
{
    {
        .btlcmd = CONTROLLER_CHOOSEACTION,
        .side = B_SIDE_PLAYER,
        .callback = NULL,
    },
    {
        .btlcmd = CONTROLLER_CHOOSEACTION,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintMessageWithHealthboxPals,
    },
    {
        .btlcmd = CONTROLLER_OPENBAG,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_PRINTSTRING,
        .side = B_SIDE_OPPONENT,
        .stringid = STRINGID_USEDMOVE,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_PRINTSTRING,
        .side = B_SIDE_PLAYER,
        .stringid = STRINGID_PKMNGAINEDEXP,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
};

static const struct PokedudeTextScriptHeader sPokedudeTextScripts_Matchups[] =
{
    {
        .btlcmd = CONTROLLER_PRINTSTRING,
        .side = B_SIDE_OPPONENT,
        .stringid = STRINGID_USEDMOVE,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_CHOOSEACTION,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_CHOOSEPOKEMON,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_PRINTSTRING,
        .side = B_SIDE_OPPONENT,
        .stringid = STRINGID_USEDMOVE,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_CHOOSEACTION,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_CHOOSEMOVE,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_PRINTSTRING,
        .side = B_SIDE_PLAYER,
        .stringid = STRINGID_PKMNGAINEDEXP,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
};

static const struct PokedudeTextScriptHeader sPokedudeTextScripts_Catching[] =
{
    {
        .btlcmd = CONTROLLER_CHOOSEACTION,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_CHOOSEACTION,
        .side = B_SIDE_PLAYER,
        .callback = NULL,
    },
    {
        .btlcmd = CONTROLLER_CHOOSEACTION,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_PRINTSTRING,
        .side = B_SIDE_OPPONENT,
        .stringid = STRINGID_PKMNFASTASLEEP,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_OPENBAG,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_ENDLINKBATTLE,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
};

static const struct PokedudeTextScriptHeader *const sPokedudeTextScripts[] =
{
    [TTVSCR_BATTLE]   = sPokedudeTextScripts_Battle,
    [TTVSCR_STATUS]   = sPokedudeTextScripts_Status,
    [TTVSCR_MATCHUPS] = sPokedudeTextScripts_Matchups,
    [TTVSCR_CATCHING] = sPokedudeTextScripts_Catching,
};

static const u8 *const sPokedudeTexts_Battle[] =
{
    Pokedude_Text_SpeedierBattlerGoesFirst,
    Pokedude_Text_MyRattataFasterThanPidgey,
    Pokedude_Text_BattlersTakeTurnsAttacking,
    Pokedude_Text_MyRattataWonGetsEXP,
};

static const u8 *const sPokedudeTexts_Status[] =
{
    Pokedude_Text_UhOhRattataPoisoned,
    Pokedude_Text_UhOhRattataPoisoned,
    Pokedude_Text_HealStatusRightAway,
    Pokedude_Text_UsingItemTakesTurn,
    Pokedude_Text_YayWeManagedToWin,
};

static const u8 *const sPokedudeTexts_TypeMatchup[] =
{
    Pokedude_Text_WaterNotVeryEffectiveAgainstGrass,
    Pokedude_Text_GrassEffectiveAgainstWater,
    Pokedude_Text_LetsTryShiftingMons,
    Pokedude_Text_ShiftingUsesTurn,
    Pokedude_Text_ButterfreeDoubleResistsGrass,
    Pokedude_Text_ButterfreeGoodAgainstOddish,
    Pokedude_Text_YeahWeWon,
};

static const u8 *const sPokedudeTexts_Catching[] =
{
    Pokedude_Text_WeakenMonBeforeCatching,
    Pokedude_Text_WeakenMonBeforeCatching,
    Pokedude_Text_BestIfTargetStatused,
    Pokedude_Text_CantDoubleUpOnStatus,
    Pokedude_Text_LetMeThrowBall,
    Pokedude_Text_PickBestKindOfBall,
};

static const struct PokedudeBattlePartyInfo sParties_Battle[] =
{
    {
        .side = B_SIDE_PLAYER,
        .level = 15,
        .species = SPECIES_RATTATA,
        .moves = { MOVE_TACKLE, MOVE_TAIL_WHIP, MOVE_HYPER_FANG, MOVE_QUICK_ATTACK },
        .nature = NATURE_LONELY,
        .gender = MALE,
    },
    {
        .side = B_SIDE_OPPONENT,
        .level = 18,
        .species = SPECIES_PIDGEY,
        .moves = { MOVE_TACKLE, MOVE_SAND_ATTACK, MOVE_GUST, MOVE_QUICK_ATTACK },
        .nature = NATURE_NAUGHTY,
        .gender = MALE,
    },
    {0xFF}
};

static const struct PokedudeBattlePartyInfo sParties_Status[] =
{
    {
        .side = B_SIDE_PLAYER,
        .level = 15,
        .species = SPECIES_RATTATA,
        .moves = { MOVE_TACKLE, MOVE_TAIL_WHIP, MOVE_HYPER_FANG, MOVE_QUICK_ATTACK },
        .nature = NATURE_LONELY,
        .gender = MALE,
    },
    {
        .side = B_SIDE_OPPONENT,
        .level = 14,
        .species = SPECIES_ODDISH,
        .moves = { MOVE_ABSORB, MOVE_SWEET_SCENT, MOVE_POISON_POWDER },
        .nature = NATURE_RASH,
        .gender = MALE,
    },
    {0xFF}
};

static const struct PokedudeBattlePartyInfo sParties_Matchups[] =
{
    {
        .side = B_SIDE_PLAYER,
        .level = 15,
        .species = SPECIES_POLIWAG,
        .moves = { MOVE_WATER_GUN, MOVE_HYPNOSIS, MOVE_BUBBLE },
        .nature = NATURE_RASH,
        .gender = MALE,
    },
    {
        .side = B_SIDE_PLAYER,
        .level = 15,
        .species = SPECIES_BUTTERFREE,
        .moves = { MOVE_CONFUSION, MOVE_POISON_POWDER, MOVE_STUN_SPORE, MOVE_SLEEP_POWDER },
        .nature = NATURE_RASH,
        .gender = MALE,
    },
    {
        .side = B_SIDE_OPPONENT,
        .level = 14,
        .species = SPECIES_ODDISH,
        .moves = { MOVE_ABSORB, MOVE_SWEET_SCENT, MOVE_POISON_POWDER },
        .nature = NATURE_RASH,
        .gender = MALE,
    },
    {0xFF}
};

static const struct PokedudeBattlePartyInfo sParties_Catching[] =
{
    {
        .side = B_SIDE_PLAYER,
        .level = 15,
        .species = SPECIES_BUTTERFREE,
        .moves = { MOVE_CONFUSION, MOVE_POISON_POWDER, MOVE_SLEEP_POWDER, MOVE_STUN_SPORE },
        .nature = NATURE_RASH,
        .gender = MALE,
    },
    {
        .side = B_SIDE_OPPONENT,
        .level = 11,
        .species = SPECIES_JIGGLYPUFF,
        .moves = { MOVE_SING, MOVE_DEFENSE_CURL, MOVE_POUND },
        .nature = NATURE_CAREFUL,
        .gender = MALE,
    },
    {0xFF}
};


static const struct PokedudeBattlePartyInfo *const sPokedudeBattlePartyPointers[] =
{
    [TTVSCR_BATTLE]   = sParties_Battle,
    [TTVSCR_STATUS]   = sParties_Status,
    [TTVSCR_MATCHUPS] = sParties_Matchups,
    [TTVSCR_CATCHING] = sParties_Catching,
};

COMMON_DATA struct PokedudeBattlerState *gPokedudeBattlerStates[MAX_BATTLERS_COUNT] = {0};

static void PokedudeSimulateInputChooseAction(enum BattlerId battler)
{
    const struct PokedudeInputScript *script_p = sInputScripts_ChooseAction[gBattleStruct->pdScriptNum];

    if (GetBattlerSide(battler) == B_SIDE_PLAYER)
    {
        DoBounceEffect(battler, BOUNCE_HEALTHBOX, 7, 1);
        DoBounceEffect(battler, BOUNCE_MON, 7, 1);
    }
    if (script_p[gPokedudeBattlerStates[battler]->action_idx].delay[battler] == gPokedudeBattlerStates[battler]->timer)
    {
        if (GetBattlerSide(battler) == B_SIDE_PLAYER)
            PlaySE(SE_SELECT);
        gPokedudeBattlerStates[battler]->timer = 0;
        switch (script_p[gPokedudeBattlerStates[battler]->action_idx].cursorPos[battler])
        {
        case 0:
            BtlController_EmitTwoReturnValues(battler, 1, B_ACTION_USE_MOVE, 0);
            break;
        case 1:
            BtlController_EmitTwoReturnValues(battler, 1, B_ACTION_USE_ITEM, 0);
            break;
        case 2:
            BtlController_EmitTwoReturnValues(battler, 1, B_ACTION_SWITCH, 0);
            break;
        case 3:
            BtlController_EmitTwoReturnValues(battler, 1, B_ACTION_RUN, 0);
            break;
        }
        PokedudeBufferExecCompleted(battler);
        ++gPokedudeBattlerStates[battler]->action_idx;
        if (script_p[gPokedudeBattlerStates[battler]->action_idx].cursorPos[battler] == 4)
            gPokedudeBattlerStates[battler]->action_idx = 0;
    }
    else
    {
        if (gActionSelectionCursor[battler] != script_p[gPokedudeBattlerStates[battler]->action_idx].cursorPos[battler]
            && script_p[gPokedudeBattlerStates[battler]->action_idx].delay[battler] / 2 == gPokedudeBattlerStates[battler]->timer)
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[battler]);
            gActionSelectionCursor[battler] = script_p[gPokedudeBattlerStates[battler]->action_idx].cursorPos[battler];
            ActionSelectionCreateCursorAt(gActionSelectionCursor[battler], 0);
        }
        ++gPokedudeBattlerStates[battler]->timer;
    }
}

static void PokedudeSimulateInputChooseMove(enum BattlerId battler)
{
    const struct PokedudeInputScript *script_p = sInputScripts_ChooseMove[gBattleStruct->pdScriptNum];

    if (script_p[gPokedudeBattlerStates[battler]->move_idx].delay[battler] == gPokedudeBattlerStates[battler]->timer)
    {
        if (GetBattlerSide(battler) == B_SIDE_PLAYER)
            PlaySE(SE_SELECT);
        gPokedudeBattlerStates[battler]->timer = 0;
        BtlController_EmitTwoReturnValues(battler, 1,
                                          B_ACTION_EXEC_SCRIPT,
                                          script_p[gPokedudeBattlerStates[battler]->move_idx].cursorPos[battler] | ((battler ^ BIT_SIDE) << 8));
        PokedudeBufferExecCompleted(battler);
        ++gPokedudeBattlerStates[battler]->move_idx;
        if (script_p[gPokedudeBattlerStates[battler]->move_idx].cursorPos[battler] == 255)
            gPokedudeBattlerStates[battler]->move_idx = 0;
    }
    else
    {
        if (script_p[gPokedudeBattlerStates[battler]->move_idx].cursorPos[battler] != gMoveSelectionCursor[battler]
            && script_p[gPokedudeBattlerStates[battler]->move_idx].delay[battler] / 2 == gPokedudeBattlerStates[battler]->timer)
        {
            PlaySE(SE_SELECT);
            MoveSelectionDestroyCursorAt(gMoveSelectionCursor[battler]);
            gMoveSelectionCursor[battler] = script_p[gPokedudeBattlerStates[battler]->move_idx].cursorPos[battler];
            MoveSelectionCreateCursorAt(gMoveSelectionCursor[battler], 0);
        }
        ++gPokedudeBattlerStates[battler]->timer;
    }
}

static bool8 HandlePokedudeVoiceoverEtc(enum BattlerId battler)
{
    const struct PokedudeTextScriptHeader *header_p = sPokedudeTextScripts[gBattleStruct->pdScriptNum];
    const u16 * bstringid_p = (const u16 *)&gBattleResources->bufferA[battler][2];

    if (gBattleResources->bufferA[battler][0] != header_p[gBattleStruct->pdMessageNo].btlcmd)
        return FALSE;
    if (battler != header_p[gBattleStruct->pdMessageNo].side)
        return FALSE;
    if (gBattleResources->bufferA[battler][0] == CONTROLLER_PRINTSTRING && header_p[gBattleStruct->pdMessageNo].stringid != *bstringid_p)
        return FALSE;
    if (header_p[gBattleStruct->pdMessageNo].callback == NULL)
    {
        gBattleStruct->pdMessageNo++;
        return FALSE;
    }
    gBattlerControllerFuncs[battler] = header_p[gBattleStruct->pdMessageNo].callback;
    gPokedudeBattlerStates[battler]->timer = 0;
    gPokedudeBattlerStates[battler]->msg_idx = header_p[gBattleStruct->pdMessageNo].stringid;
    gBattleStruct->pdMessageNo++;
    return TRUE;
}

static void ReturnFromPokedudeAction(enum BattlerId battler)
{
    gPokedudeBattlerStates[battler]->timer = 0;
    gBattlerControllerFuncs[battler] = PokedudeBufferRunCommand;
}

static void PokedudeAction_PrintVoiceoverMessage(enum BattlerId battler)
{
    switch (gPokedudeBattlerStates[battler]->timer)
    {
    case 0:
        if (!gPaletteFade.active)
        {
            BeginNormalPaletteFade(0xFFFFFF7F, 4, 0, 8, RGB_BLACK);
            ++gPokedudeBattlerStates[battler]->timer;
        }
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            gPokedudeBattlerStates[battler]->saved_bg0y = gBattle_BG0_Y;
            BtlCtrl_DrawVoiceoverMessageFrame();
            ++gPokedudeBattlerStates[battler]->timer;
        }
        break;
    case 2:
        gBattle_BG0_Y = 0;
        BattleStringExpandPlaceholdersToDisplayedString(GetPokedudeText());
        BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_OAK_OLD_MAN);
        ++gPokedudeBattlerStates[battler]->timer;
        break;
    case 3:
        if (!IsTextPrinterActiveOnWindow(24) && JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            BeginNormalPaletteFade(0xFFFFFF7F, 4, 8, 0, RGB_BLACK);
            ++gPokedudeBattlerStates[battler]->timer;
        }
        break;
    case 4:
        if (!gPaletteFade.active)
        {
            if (gPokedudeBattlerStates[battler]->msg_idx == STRINGID_PKMNGAINEDEXP)
            {
                BattleStopLowHpSound();
                PlayBGM(MUS_VICTORY_WILD);
            }
            gBattle_BG0_Y = gPokedudeBattlerStates[battler]->saved_bg0y;
            BtlCtrl_RemoveVoiceoverMessageFrame();
            ReturnFromPokedudeAction(battler);
        }
        break;
    }
}

static void PokedudeAction_PrintMessageWithHealthboxPals(enum BattlerId battler)
{
    switch (gPokedudeBattlerStates[battler]->timer)
    {
    case 0:
        if (!gPaletteFade.active)
        {
            LoadHealthboxPalsForLevelUp(&gBattleStruct->pdHealthboxPal2,
                                          &gBattleStruct->pdHealthboxPal1,
                                          GetBattlerAtPosition(B_POSITION_PLAYER_LEFT));
            BeginNormalPaletteFade(0xFFFFFF7F, 4, 0, 8, RGB_BLACK);
            ++gPokedudeBattlerStates[battler]->timer;
        }
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            u32 mask = ((1u << gBattleStruct->pdHealthboxPal2) | (1u << gBattleStruct->pdHealthboxPal1)) << 16;

            ++mask; // It's possible that this is influenced by other functions, as
            --mask; // this also striked in battle_controller_oak_old_man.c but was naturally fixed.
            BeginNormalPaletteFade(mask, 4, 8, 0, RGB_BLACK);
            ++gPokedudeBattlerStates[battler]->timer;
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            BtlCtrl_DrawVoiceoverMessageFrame();
            ++gPokedudeBattlerStates[battler]->timer;
        }
        break;
    case 3:
        BattleStringExpandPlaceholdersToDisplayedString(GetPokedudeText());
        BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_OAK_OLD_MAN);
        ++gPokedudeBattlerStates[battler]->timer;
        break;
    case 4:
        if (!IsTextPrinterActiveOnWindow(24) && JOY_NEW(A_BUTTON))
        {
            u32 mask;

            PlaySE(SE_SELECT);
            mask = ((1u << gBattleStruct->pdHealthboxPal2) | (1u << gBattleStruct->pdHealthboxPal1)) << 16;
            ++mask;
            --mask;
            BeginNormalPaletteFade(mask, 4, 0, 8, RGB_BLACK);
            ++gPokedudeBattlerStates[battler]->timer;
        }
        break;
    case 5:
        if (!gPaletteFade.active)
        {
            BeginNormalPaletteFade(0xFFFFFF7F, 4, 8, 0, RGB_BLACK);
            ++gPokedudeBattlerStates[battler]->timer;
        }
        break;
    case 6:
        if (!gPaletteFade.active)
        {
            if (gPokedudeBattlerStates[battler]->msg_idx == STRINGID_PKMNGAINEDEXP)
            {
                BattleStopLowHpSound();
                PlayBGM(MUS_VICTORY_WILD);
            }
            FreeHealthboxPalsForLevelUp(GetBattlerAtPosition(B_POSITION_PLAYER_LEFT));
            BtlCtrl_RemoveVoiceoverMessageFrame();
            ReturnFromPokedudeAction(battler);
        }
        break;
    }
}

static const u8 *GetPokedudeText(void)
{
    switch (gBattleStruct->pdScriptNum)
    {
    case TTVSCR_BATTLE:
    default:
        return sPokedudeTexts_Battle[gBattleStruct->pdMessageNo - 1];
    case TTVSCR_STATUS:
        return sPokedudeTexts_Status[gBattleStruct->pdMessageNo - 1];
    case TTVSCR_MATCHUPS:
        return sPokedudeTexts_TypeMatchup[gBattleStruct->pdMessageNo - 1];
    case TTVSCR_CATCHING:
        return sPokedudeTexts_Catching[gBattleStruct->pdMessageNo - 1];
    }
}

void InitPokedudePartyAndOpponent(void)
{
    s32 i, j;
    struct Pokemon *mon;
    s32 myIdx = 0;
    s32 opIdx = 0;
    const struct PokedudeBattlePartyInfo *data;

    gBattleTypeFlags = BATTLE_TYPE_POKEDUDE;
    ZeroPlayerPartyMons();
    ZeroEnemyPartyMons();
    data = sPokedudeBattlePartyPointers[gSpecialVar_0x8004];
    i = 0;
    do
    {
        u32 personality;
        if (data[i].side == B_SIDE_PLAYER)
            mon = &gPlayerParty[myIdx++];
        else
            mon = &gEnemyParty[opIdx++];

        personality = GetMonPersonality(data[i].species, data[i].gender, data[i].nature, RANDOM_UNOWN_LETTER);
        CreateMonWithIVsPersonality(mon, data[i].species, data[i].level, 0, personality);

        for (j = 0; j < 4; ++j)
            SetMonMoveSlot(mon, data[i].moves[j], j);
    } while (data[++i].side != 0xFF);
}
