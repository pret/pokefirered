#include "global.h"
#include "gflib.h"
#include "task.h"
#include "pokeball.h"
#include "party_menu.h"
#include "util.h"
#include "m4a.h"
#include "link.h"
#include "item.h"
#include "item_menu.h"
#include "strings.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_controllers.h"
#include "battle_interface.h"
#include "battle_message.h"
#include "reshow_battle_screen.h"
#include "constants/battle_string_ids.h"
#include "constants/songs.h"
#include "constants/items.h"

static void OakOldManHandleDrawTrainerPic(u32 battler);
static void OakOldManHandleTrainerSlide(u32 battler);
static void OakOldManHandleSuccessBallThrowAnim(u32 battler);
static void OakOldManHandleBallThrowAnim(u32 battler);
static void OakOldManHandlePrintString(u32 battler);
static void OakOldManHandlePrintSelectionString(u32 battler);
static void OakOldManHandleChooseAction(u32 battler);
static void OakOldManHandleChooseMove(u32 battler);
static void OakOldManHandleChooseItem(u32 battler);
static void OakOldManHandleChoosePokemon(u32 battler);
static void OakOldManHandleHealthBarUpdate(u32 battler);
static void OakOldManHandlePlaySE(u32 battler);
static void OakOldManHandleFaintingCry(u32 battler);
static void OakOldManHandleIntroTrainerBallThrow(u32 battler);
static void OakOldManHandleDrawPartyStatusSummary(u32 battler);
static void OakOldManHandleEndBounceEffect(u32 battler);
static void OakOldManHandleBattleAnimation(u32 battler);
static void OakOldManHandleLinkStandbyMsg(u32 battler);
static void OakOldManHandleEndLinkBattle(u32 battler);

static void OakOldManBufferRunCommand(u32 battler);
static void OakOldManBufferExecCompleted(u32 battler);
static void WaitForMonSelection(u32 battler);
static void CompleteWhenChoseItem(u32 battler);
static void PrintOakText_KeepAnEyeOnHP(u32 battler);
static void Intro_WaitForShinyAnimAndHealthbox(u32 battler);
static void PrintOakText_ForPetesSake(u32 battler);
static void PrintOakTextWithMainBgDarkened(u32 battler, const u8 *text, u8 delay);
static void HandleInputChooseAction(u32 battler);

static void (*const sOakOldManBufferCommands[CONTROLLER_CMDS_COUNT])(u32 battler) =
{
    [CONTROLLER_GETMONDATA]               = BtlController_HandleGetMonData,             // done
    [CONTROLLER_GETRAWMONDATA]            = BtlController_Empty,                        // done
    [CONTROLLER_SETMONDATA]               = BtlController_HandleSetMonData,             // done
    [CONTROLLER_SETRAWMONDATA]            = BtlController_Empty,                        // done
    [CONTROLLER_LOADMONSPRITE]            = BtlController_Empty,                        // done
    [CONTROLLER_SWITCHINANIM]             = BtlController_Empty,                        // done
    [CONTROLLER_RETURNMONTOBALL]          = BtlController_HandleReturnMonToBall,        // done
    [CONTROLLER_DRAWTRAINERPIC]           = OakOldManHandleDrawTrainerPic,              // done
    [CONTROLLER_TRAINERSLIDE]             = OakOldManHandleTrainerSlide,                // done
    [CONTROLLER_TRAINERSLIDEBACK]         = BtlController_Empty,                        // done
    [CONTROLLER_FAINTANIMATION]           = BtlController_HandleFaintAnimation,         // done
    [CONTROLLER_PALETTEFADE]              = BtlController_Empty,                        // done
    [CONTROLLER_SUCCESSBALLTHROWANIM]     = OakOldManHandleSuccessBallThrowAnim,        // done
    [CONTROLLER_BALLTHROWANIM]            = OakOldManHandleBallThrowAnim,               // done
    [CONTROLLER_PAUSE]                    = BtlController_Empty,                        // done
    [CONTROLLER_MOVEANIMATION]            = BtlController_HandleMoveAnimation,          // done
    [CONTROLLER_PRINTSTRING]              = OakOldManHandlePrintString,                 // done
    [CONTROLLER_PRINTSTRINGPLAYERONLY]    = OakOldManHandlePrintSelectionString,        // done
    [CONTROLLER_CHOOSEACTION]             = OakOldManHandleChooseAction,                // done
    [CONTROLLER_UNKNOWNYESNOBOX]          = BtlController_Empty,                        // done
    [CONTROLLER_CHOOSEMOVE]               = OakOldManHandleChooseMove,                  // done
    [CONTROLLER_OPENBAG]                  = OakOldManHandleChooseItem,                  // done
    [CONTROLLER_CHOOSEPOKEMON]            = OakOldManHandleChoosePokemon,               // done
    [CONTROLLER_23]                       = BtlController_Empty,                        // done
    [CONTROLLER_HEALTHBARUPDATE]          = OakOldManHandleHealthBarUpdate,             // done
    [CONTROLLER_EXPUPDATE]                = PlayerHandleExpUpdate,                      // done
    [CONTROLLER_STATUSICONUPDATE]         = BtlController_HandleStatusIconUpdate,       // done
    [CONTROLLER_STATUSANIMATION]          = BtlController_HandleStatusAnimation,        // done
    [CONTROLLER_STATUSXOR]                = BtlController_Empty,                        // done
    [CONTROLLER_DATATRANSFER]             = BtlController_Empty,                        // done
    [CONTROLLER_DMA3TRANSFER]             = BtlController_Empty,                        // done
    [CONTROLLER_PLAYBGM]                  = BtlController_Empty,                        // done
    [CONTROLLER_32]                       = BtlController_Empty,                        // done
    [CONTROLLER_TWORETURNVALUES]          = BtlController_Empty,                        // done
    [CONTROLLER_CHOSENMONRETURNVALUE]     = BtlController_Empty,                        // done
    [CONTROLLER_ONERETURNVALUE]           = BtlController_Empty,                        // done
    [CONTROLLER_ONERETURNVALUE_DUPLICATE] = BtlController_Empty,                        // done
    [CONTROLLER_CLEARUNKVAR]              = BtlController_Empty,                        // done
    [CONTROLLER_SETUNKVAR]                = BtlController_Empty,                        // done
    [CONTROLLER_CLEARUNKFLAG]             = BtlController_Empty,                        // done
    [CONTROLLER_TOGGLEUNKFLAG]            = BtlController_Empty,                        // done
    [CONTROLLER_HITANIMATION]             = BtlController_HandleHitAnimation,           // done
    [CONTROLLER_CANTSWITCH]               = BtlController_Empty,                        // done
    [CONTROLLER_PLAYSE]                   = OakOldManHandlePlaySE,                      // done
    [CONTROLLER_PLAYFANFAREORBGM]         = BtlController_HandlePlayFanfareOrBGM,       // done
    [CONTROLLER_FAINTINGCRY]              = OakOldManHandleFaintingCry,                 // done
    [CONTROLLER_INTROSLIDE]               = BtlController_HandleIntroSlide,             // done
    [CONTROLLER_INTROTRAINERBALLTHROW]    = OakOldManHandleIntroTrainerBallThrow,       // done
    [CONTROLLER_DRAWPARTYSTATUSSUMMARY]   = OakOldManHandleDrawPartyStatusSummary,      // done
    [CONTROLLER_HIDEPARTYSTATUSSUMMARY]   = BtlController_Empty,                        // done
    [CONTROLLER_ENDBOUNCE]                = OakOldManHandleEndBounceEffect,             // done
    [CONTROLLER_SPRITEINVISIBILITY]       = BtlController_Empty,                        // done
    [CONTROLLER_BATTLEANIMATION]          = OakOldManHandleBattleAnimation,             // done
    [CONTROLLER_LINKSTANDBYMSG]           = OakOldManHandleLinkStandbyMsg,              // done
    [CONTROLLER_RESETACTIONMOVESELECTION] = BtlController_Empty,                        // done
    [CONTROLLER_ENDLINKBATTLE]            = OakOldManHandleEndLinkBattle,               // done
    [CONTROLLER_DEBUGMENU]                = BtlController_Empty,
    [CONTROLLER_TERMINATOR_NOP]           = BtlController_TerminatorNop,                // done
};

void SetControllerToOakOrOldMan(u32 battler)
{
    gBattlerControllerEndFuncs[battler] = OakOldManBufferExecCompleted;
    gBattlerControllerFuncs[battler] = OakOldManBufferRunCommand;
    gBattleStruct->simulatedInputState[0] = 0;
    gBattleStruct->simulatedInputState[1] = 0;
    gBattleStruct->simulatedInputState[2] = 0;
    gBattleStruct->simulatedInputState[3] = 0;
}

static void OakOldManBufferRunCommand(u32 battler)
{
    if (gBattleControllerExecFlags & gBitTable[battler])
    {
        if (gBattleResources->bufferA[battler][0] < NELEMS(sOakOldManBufferCommands))
            sOakOldManBufferCommands[gBattleResources->bufferA[battler][0]](battler);
        else
            OakOldManBufferExecCompleted(battler);
    }
}

static void HandleInputChooseAction(u32 battler)
{
    // Like player, but specifically for Rival in Oak's Lab
    u16 itemId = gBattleResources->bufferA[battler][2] | (gBattleResources->bufferA[battler][3] << 8);

    DoBounceEffect(battler, BOUNCE_HEALTHBOX, 7, 1);
    DoBounceEffect(battler, BOUNCE_MON, 7, 1);
    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);

        switch (gActionSelectionCursor[battler])
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
        OakOldManBufferExecCompleted(battler);
    }
    else if (JOY_NEW(DPAD_LEFT))
    {
        if (gActionSelectionCursor[battler] & 1) // if is B_ACTION_USE_ITEM or B_ACTION_RUN
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[battler]);
            gActionSelectionCursor[battler] ^= 1;
            ActionSelectionCreateCursorAt(gActionSelectionCursor[battler], 0);
        }
    }
    else if (JOY_NEW(DPAD_RIGHT))
    {
        if (!(gActionSelectionCursor[battler] & 1)) // if is B_ACTION_USE_MOVE or B_ACTION_SWITCH
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[battler]);
            gActionSelectionCursor[battler] ^= 1;
            ActionSelectionCreateCursorAt(gActionSelectionCursor[battler], 0);
        }
    }
    else if (JOY_NEW(DPAD_UP))
    {
        if (gActionSelectionCursor[battler] & 2) // if is B_ACTION_SWITCH or B_ACTION_RUN
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[battler]);
            gActionSelectionCursor[battler] ^= 2;
            ActionSelectionCreateCursorAt(gActionSelectionCursor[battler], 0);
        }
    }
    else if (JOY_NEW(DPAD_DOWN))
    {
        if (!(gActionSelectionCursor[battler] & 2)) // if is B_ACTION_USE_MOVE or B_ACTION_USE_ITEM
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[battler]);
            gActionSelectionCursor[battler] ^= 2;
            ActionSelectionCreateCursorAt(gActionSelectionCursor[battler], 0);
        }
    }
    else if (JOY_NEW(B_BUTTON))
    {
        if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
         && GetBattlerPosition(battler) == B_POSITION_PLAYER_RIGHT
         && !(gAbsentBattlerFlags & gBitTable[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)])
         && !(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            if (gBattleResources->bufferA[battler][1] == B_ACTION_USE_ITEM)
            {
                // Add item to bag if it is a ball
                if (IsItemBall(itemId))
                    AddBagItem(itemId, 1);
                else
                    return;
            }
            PlaySE(SE_SELECT);
            BtlController_EmitTwoReturnValues(battler, 1, B_ACTION_CANCEL_PARTNER, 0);
            OakOldManBufferExecCompleted(battler);
        }
    }
    else if (JOY_NEW(START_BUTTON))
    {
        SwapHpBarsWithHpText();
    }
}

static void SimulateInputChooseAction(u32 battler)
{
    // Old Man
    switch (gBattleStruct->simulatedInputState[0])
    {
    case 0:
        gBattleStruct->simulatedInputState[2] = 64;
        ++gBattleStruct->simulatedInputState[0];
        // fall through
    case 1:
        if (--gBattleStruct->simulatedInputState[2] == 0)
        {
            // Move cursor to BAG
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(0);
            ActionSelectionCreateCursorAt(1, 0);
            gBattleStruct->simulatedInputState[2] = 64;
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 2:
        if (--gBattleStruct->simulatedInputState[2] == 0)
        {
            // Open bag
            PlaySE(SE_SELECT);
            BtlController_EmitTwoReturnValues(battler, 1, B_ACTION_USE_ITEM, 0);
            OakOldManBufferExecCompleted(battler);
        }
        break;
    }
}

static void CompleteOnInactiveTextPrinter(u32 battler)
{
    if (!IsTextPrinterActive(0))
        OakOldManBufferExecCompleted(battler);
}

static void OakOldManSetBattleEndCallbacks(u32 battler)
{
    if (!gPaletteFade.active)
    {
        gMain.inBattle = FALSE;
        gMain.callback1 = gPreBattleCallback1;
        SetMainCallback2(gMain.savedCallback);
    }
}

void OakOldManHandleInputChooseMove(u32 battler)
{
    HandleInputChooseMove(battler);
    if (!(gBattleControllerExecFlags & gBitTable[battler]))
        OakOldManBufferExecCompleted(battler);
}

static void OpenPartyMenuToChooseMon(u32 battler)
{
    if (!gPaletteFade.active)
    {
        u8 caseId;

        gBattlerControllerFuncs[battler] = WaitForMonSelection;
        caseId = gTasks[gBattleControllerData[battler]].data[0];
        DestroyTask(gBattleControllerData[battler]);
        FreeAllWindowBuffers();
        OpenPartyMenuInTutorialBattle(caseId);
    }
}

static void WaitForMonSelection(u32 battler)
{
    if (gMain.callback2 == BattleMainCB2 && !gPaletteFade.active)
    {
        if (gPartyMenuUseExitCallback == TRUE)
            BtlController_EmitChosenMonReturnValue(battler, 1, gSelectedMonPartyId, gBattlePartyCurrentOrder);
        else
            BtlController_EmitChosenMonReturnValue(battler, 1, 6, NULL);
        OakOldManBufferExecCompleted(battler);
    }
}

static void OpenBagAndChooseItem(u32 battler)
{
    if (!gPaletteFade.active)
    {
        gBattlerControllerFuncs[battler] = CompleteWhenChoseItem;
        ReshowBattleScreenDummy();
        FreeAllWindowBuffers();
        if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
            CB2_BagMenuFromBattle();
        else
            InitOldManBag();
    }
}

static void CompleteWhenChoseItem(u32 battler)
{
    if (gMain.callback2 == BattleMainCB2 && !gPaletteFade.active)
    {
        if (!BtlCtrl_OakOldMan_TestState2Flag(FIRST_BATTLE_MSG_FLAG_HP_RESTORE)
         && gSpecialVar_ItemId == ITEM_POTION
         && gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
        {
            BtlCtrl_OakOldMan_SetState2Flag(FIRST_BATTLE_MSG_FLAG_HP_RESTORE);
            gBattlerControllerFuncs[battler] = PrintOakText_KeepAnEyeOnHP;
        }
        else
        {
            BtlController_EmitOneReturnValue(battler, 1, gSpecialVar_ItemId);
            OakOldManBufferExecCompleted(battler);
        }
    }
}

static void Intro_TryShinyAnimShowHealthbox(u32 battler)
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

static void Intro_WaitForShinyAnimAndHealthbox(u32 battler)
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
        gBattlerControllerFuncs[battler] = PrintOakText_ForPetesSake;
    }
}

static void PrintOakText_ForPetesSake(u32 battler)
{
    u32 mask;

    switch (gBattleStruct->simulatedInputState[0])
    {
    case 0:
        if (!gPaletteFade.active)
        {
            DoLoadHealthboxPalsForLevelUp(&gBattleStruct->simulatedInputState[1], &gBattleStruct->simulatedInputState[3], GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT));
            BeginNormalPaletteFade(0xFFFFFF7E,
                                   4,
                                   0,
                                   8,
                                   RGB_BLACK);
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            BtlCtrl_DrawVoiceoverMessageFrame();
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 2:
        BattleStringExpandPlaceholdersToDisplayedString(gText_ForPetesSake);
        BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_OAK_OLD_MAN);
        ++gBattleStruct->simulatedInputState[0];
        break;
    case 3:
        if (!IsTextPrinterActive(24))
        {
            mask = (gBitTable[gBattleStruct->simulatedInputState[1]] | gBitTable[gBattleStruct->simulatedInputState[3]]) << 16;
            BeginNormalPaletteFade(mask,
                                   4,
                                   8,
                                   0,
                                   RGB_BLACK);
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 4:
        if (!gPaletteFade.active)
        {
            BattleStringExpandPlaceholdersToDisplayedString(gText_TheTrainerThat);
            BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_OAK_OLD_MAN);
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 5:
        if (!IsTextPrinterActive(24))
        {
            mask = (gBitTable[gBattleStruct->simulatedInputState[1]] | gBitTable[gBattleStruct->simulatedInputState[3]]) << 16;
            BeginNormalPaletteFade(mask,
                                   4,
                                   0,
                                   8,
                                   RGB_BLACK);
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 6:
        if (!gPaletteFade.active)
        {
            BattleStringExpandPlaceholdersToDisplayedString(gText_TryBattling);
            BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_OAK_OLD_MAN);
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 7:
        if (!IsTextPrinterActive(24))
        {
            BeginNormalPaletteFade(0xFFFFFF7E,
                                   4,
                                   8,
                                   0,
                                   RGB_BLACK);
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 8:
        if (!gPaletteFade.active)
        {
            DoFreeHealthboxPalsForLevelUp(GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT));
            BtlCtrl_RemoveVoiceoverMessageFrame();
            gBattleStruct->simulatedInputState[0] = 0;
            OakOldManBufferExecCompleted(battler);
        }
        break;
    }
}

void PrintOakText_InflictingDamageIsKey(u32 battler)
{
    PrintOakTextWithMainBgDarkened(battler, gText_InflictingDamageIsKey, 1);
}

static void PrintOakText_LoweringStats(u32 battler)
{
    PrintOakTextWithMainBgDarkened(battler, gText_LoweringStats, 64);
}

void PrintOakText_OakNoRunningFromATrainer(u32 battler)
{
    PrintOakTextWithMainBgDarkened(battler, gText_OakNoRunningFromATrainer, 1);
}

static void PrintOakText_WinEarnsPrizeMoney(u32 battler)
{
    PrintOakTextWithMainBgDarkened(battler, gText_WinEarnsPrizeMoney, 64);
}

void PrintOakText_HowDisappointing(u32 battler)
{
    PrintOakTextWithMainBgDarkened(battler, gText_HowDissapointing, 64);
}

static void PrintOakTextWithMainBgDarkened(u32 battler, const u8 *text, u8 delay)
{
    // If delay is 0, it's treated as 256.
    switch (gBattleStruct->simulatedInputState[0])
    {
    case 0:
        if (!IsTextPrinterActive(0))
        {
            gBattleStruct->simulatedInputState[3] = delay;
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 1:
        if (--gBattleStruct->simulatedInputState[3] == 0)
        {
            BeginNormalPaletteFade(0xFFFFFF7E,
                                   4,
                                   0,
                                   8,
                                   RGB_BLACK);
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            BtlCtrl_DrawVoiceoverMessageFrame();
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 3:
        BattleStringExpandPlaceholdersToDisplayedString(text);
        BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_OAK_OLD_MAN);
        ++gBattleStruct->simulatedInputState[0];
        break;
    case 4:
        if (!IsTextPrinterActive(24))
        {
            BeginNormalPaletteFade(0xFFFFFF7E,
                                   4,
                                   8,
                                   0,
                                   RGB_BLACK);
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 5:
        if (!gPaletteFade.active)
        {
            BtlCtrl_RemoveVoiceoverMessageFrame();
            if (GetBattlerSide(battler) == B_SIDE_PLAYER)
                OakOldManBufferExecCompleted(battler);
            else
                OpponentBufferExecCompleted(battler);
            gBattleCommunication[MSG_DISPLAY] = 0;
            gBattleStruct->simulatedInputState[0] = 0;
        }
        break;
    }
}

static void PrintOakText_KeepAnEyeOnHP(u32 battler)
{
    u32 mask;

    switch (gBattleStruct->simulatedInputState[0])
    {
    case 0:
        if (!gPaletteFade.active)
        {
            DoLoadHealthboxPalsForLevelUp(&gBattleStruct->simulatedInputState[1], &gBattleStruct->simulatedInputState[3], battler);
            BeginNormalPaletteFade(0xFFFFFF7E,
                                   4,
                                   0,
                                   8,
                                   RGB_BLACK);
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            mask = (gBitTable[gBattleStruct->simulatedInputState[1]] | gBitTable[gBattleStruct->simulatedInputState[3]]) << 16;
            BeginNormalPaletteFade(mask,
                                   4,
                                   8,
                                   0,
                                   RGB_BLACK);
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            BtlCtrl_DrawVoiceoverMessageFrame();
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 3:
        BattleStringExpandPlaceholdersToDisplayedString(gText_KeepAnEyeOnHP);
        BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_OAK_OLD_MAN);
        ++gBattleStruct->simulatedInputState[0];
        break;
    case 4:
        if (!IsTextPrinterActive(24))
        {
            mask = (gBitTable[gBattleStruct->simulatedInputState[1]] | gBitTable[gBattleStruct->simulatedInputState[3]]) << 16;
            BeginNormalPaletteFade(mask,
                                   4,
                                   0,
                                   8,
                                   RGB_BLACK);
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 5:
        if (!gPaletteFade.active)
        {
            BeginNormalPaletteFade(0xFFFFFF7E,
                                   4,
                                   8,
                                   0,
                                   RGB_BLACK);
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 6:
        if (!gPaletteFade.active)
        {
            BtlCtrl_RemoveVoiceoverMessageFrame();
            BtlController_EmitOneReturnValue(battler, 1, gSpecialVar_ItemId);
            OakOldManBufferExecCompleted(battler);
            gBattleStruct->simulatedInputState[0] = 0;
        }
        break;
    }
}

static void OakOldManBufferExecCompleted(u32 battler)
{
    gBattlerControllerFuncs[battler] = OakOldManBufferRunCommand;
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        u8 playerId = GetMultiplayerId();

        PrepareBufferDataTransferLink(battler, 2, 4, &playerId);
        gBattleResources->bufferA[battler][0] = CONTROLLER_TERMINATOR_NOP;
    }
    else
    {
        gBattleControllerExecFlags &= ~gBitTable[battler];
    }
}

static void OakOldManHandleDrawTrainerPic(u32 battler)
{
    u32 trainerPicId = (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE) ? gSaveBlock2Ptr->playerGender + TRAINER_BACK_PIC_RED : TRAINER_BACK_PIC_OLD_MAN;
    BtlController_HandleDrawTrainerPic(battler, trainerPicId, FALSE, 80, (8 - gTrainerBacksprites[trainerPicId].coordinates.size) * 4 + 80, 30);
}

static void OakOldManHandleTrainerSlide(u32 battler)
{
    u32 trainerPicId = (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE) ? gSaveBlock2Ptr->playerGender + TRAINER_BACK_PIC_RED : TRAINER_BACK_PIC_OLD_MAN;
    BtlController_HandleTrainerSlide(battler, trainerPicId);
}

static void OakOldManHandleSuccessBallThrowAnim(u32 battler)
{
    BtlController_HandleSuccessBallThrowAnim(battler, GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT), B_ANIM_BALL_THROW_WITH_TRAINER, FALSE);
}

static void OakOldManHandleBallThrowAnim(u32 battler)
{
    BtlController_HandleBallThrowAnim(battler, GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT), B_ANIM_BALL_THROW_WITH_TRAINER, FALSE);
}

static void OakOldManHandlePrintString(u32 battler)
{
    u16 *stringId;

    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    stringId = (u16 *)(&gBattleResources->bufferA[battler][2]);
    if (gBattleTypeFlags & BATTLE_TYPE_OLD_MAN_TUTORIAL && *stringId == 1)
    {
        OakOldManBufferExecCompleted(battler);
    }
    else
    {
        BufferStringBattle(battler, *stringId);
        if (BattleStringShouldBeColored(*stringId))
            BattlePutTextOnWindow(gDisplayedStringBattle, (B_WIN_MSG | B_TEXT_FLAG_NPC_CONTEXT_FONT));
        else
            BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_MSG);
        if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
        {
            switch (*stringId)
            {
            case STRINGID_DEFENDERSSTATFELL:
                if (!BtlCtrl_OakOldMan_TestState2Flag(FIRST_BATTLE_MSG_FLAG_STAT_CHG))
                {
                    BtlCtrl_OakOldMan_SetState2Flag(FIRST_BATTLE_MSG_FLAG_STAT_CHG);
                    gBattlerControllerFuncs[battler] = PrintOakText_LoweringStats;
                    return;
                }
                break;
            case STRINGID_PLAYERGOTMONEY:
                gBattlerControllerFuncs[battler] = PrintOakText_WinEarnsPrizeMoney;
                return;
            case STRINGID_TRAINER1WINTEXT:
                gBattlerControllerFuncs[battler] = PrintOakText_HowDisappointing;
                return;
            case STRINGID_DONTLEAVEBIRCH:
                gBattlerControllerFuncs[battler] = PrintOakText_OakNoRunningFromATrainer;
                return;
            }
        }
        gBattlerControllerFuncs[battler] = CompleteOnInactiveTextPrinter;
    }
}

static void OakOldManHandlePrintSelectionString(u32 battler)
{
    if (GetBattlerSide(battler) == B_SIDE_PLAYER)
        OakOldManHandlePrintString(battler);
    else
        OakOldManBufferExecCompleted(battler);
}

static void HandleChooseActionAfterDma3(u32 battler)
{
    if (!IsDma3ManagerBusyWithBgCopy())
    {
        gBattle_BG0_X = 0;
        gBattle_BG0_Y = 160;
        if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
            gBattlerControllerFuncs[battler] = HandleInputChooseAction;
        else
            gBattlerControllerFuncs[battler] = SimulateInputChooseAction;
    }
}

static void OakOldManHandleChooseAction(u32 battler)
{
    s32 i;

    gBattlerControllerFuncs[battler] = HandleChooseActionAfterDma3;
    BattlePutTextOnWindow(gText_EmptyString3, B_WIN_MSG);
    BattlePutTextOnWindow(gText_BattleMenu, B_WIN_ACTION_MENU);
    for (i = 0; i < MAX_MON_MOVES; ++i)
        ActionSelectionDestroyCursorAt((u8)i);
    ActionSelectionCreateCursorAt(gActionSelectionCursor[battler], 0);
    if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
    {
        PREPARE_MON_NICK_BUFFER(gBattleTextBuff1, battler, gBattlerPartyIndexes[battler]);
        BattleStringExpandPlaceholdersToDisplayedString(gText_WhatWillPkmnDo);
    }
    else
        BattleStringExpandPlaceholdersToDisplayedString(gText_WhatWillOldManDo);
    BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_ACTION_PROMPT);
}

static void OakHandleChooseMove_WaitDma3(u32 battler)
{
    if (!IsDma3ManagerBusyWithBgCopy())
    {
        gBattle_BG0_X = 0;
        gBattle_BG0_Y = 320;
        gBattlerControllerFuncs[battler] = OakOldManHandleInputChooseMove;
    }
}

static void OakOldManHandleChooseMove(u32 battler)
{
    if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
    {
        InitMoveSelectionsVarsAndStrings(battler);
        gBattlerControllerFuncs[battler] = OakHandleChooseMove_WaitDma3;
    }
    else
    {
        switch (gBattleStruct->simulatedInputState[1])
        {
        case 0:
            InitMoveSelectionsVarsAndStrings(battler);
            ++gBattleStruct->simulatedInputState[1];
            gBattleStruct->simulatedInputState[3] = 80;
            // fall through
        case 1:
            if (--gBattleStruct->simulatedInputState[3] == 0)
            {
                PlaySE(SE_SELECT);
                BtlController_EmitTwoReturnValues(battler, 1, 10, 0x100);
                OakOldManBufferExecCompleted(battler);
            }
            break;
        }
    }
}

static void OakOldManHandleChooseItem(u32 battler)
{
    s32 i;

    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 0x10, RGB_BLACK);
    gBattlerControllerFuncs[battler] = OpenBagAndChooseItem;
    gBattlerInMenuId = battler;
    for (i = 0; i < 3; ++i)
        gBattlePartyCurrentOrder[i] = gBattleResources->bufferA[battler][i + 1];
}

static void OakOldManHandleChoosePokemon(u32 battler)
{
    s32 i;

    gBattleControllerData[battler] = CreateTask(TaskDummy, 0xFF);
    gTasks[gBattleControllerData[battler]].data[0] = gBattleResources->bufferA[battler][1] & 0xF;
    *(&gBattleStruct->battlerPreventingSwitchout) = gBattleResources->bufferA[battler][1] >> 4;
    *(&gBattleStruct->prevSelectedPartySlot) = gBattleResources->bufferA[battler][2];
    *(&gBattleStruct->abilityPreventingSwitchout) = (gBattleResources->bufferA[battler][3] & 0xFF) | (gBattleResources->bufferA[battler][7] << 8);
    for (i = 0; i < 3; ++i)
        gBattlePartyCurrentOrder[i] = gBattleResources->bufferA[battler][4 + i];
    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 0x10, RGB_BLACK);
    gBattlerControllerFuncs[battler] = OpenPartyMenuToChooseMon;
    gBattlerInMenuId = battler;
}

static void OakOldManHandleHealthBarUpdate(u32 battler)
{
    BtlController_HandleHealthBarUpdate(battler, TRUE);
}

static void OakOldManHandlePlaySE(u32 battler)
{
    PlaySE(gBattleResources->bufferA[battler][1] | (gBattleResources->bufferA[battler][2] << 8));
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleFaintingCry(u32 battler)
{
    u16 species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_SPECIES);

    PlayCry_Normal(species, 25);
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleIntroTrainerBallThrow(u32 battler)
{
    if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
    {
        const u32 *trainerPal = gTrainerBacksprites[gSaveBlock2Ptr->playerGender].palette.data;
        BtlController_HandleIntroTrainerBallThrow(battler, 0xD6F8, trainerPal, 31, Intro_TryShinyAnimShowHealthbox, StartAnimLinearTranslation);
    }
    else
    {
        if (gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusSummaryShown)
            gTasks[gBattlerStatusSummaryTaskId[battler]].func = Task_HidePartyStatusSummary;
        OakOldManBufferExecCompleted(battler);
    }
}

static void OakOldManHandleDrawPartyStatusSummary(u32 battler)
{
    if (gBattleResources->bufferA[battler][1] != 0
     && GetBattlerSide(battler) == B_SIDE_PLAYER)
    {
        OakOldManBufferExecCompleted(battler);
    }
    else
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusSummaryShown = TRUE;
        gBattlerStatusSummaryTaskId[battler] = CreatePartyStatusSummarySprites(battler,
                                                                                      (struct HpAndStatus *)&gBattleResources->bufferA[battler][4],
                                                                                      gBattleResources->bufferA[battler][1],
                                                                                      gBattleResources->bufferA[battler][2]);
        OakOldManBufferExecCompleted(battler);
    }
}

static void OakOldManHandleEndBounceEffect(u32 battler)
{
    EndBounceEffect(battler, BOUNCE_HEALTHBOX);
    EndBounceEffect(battler, BOUNCE_MON);
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleBattleAnimation(u32 battler)
{
    BtlController_HandleBattleAnimation(battler, TRUE);
}

static void OakOldManHandleLinkStandbyMsg(u32 battler)
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
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleEndLinkBattle(u32 battler)
{
    gBattleOutcome = gBattleResources->bufferA[battler][1];
    FadeOutMapMusic(5);
    BeginFastPaletteFade(3);
    OakOldManBufferExecCompleted(battler);
    if (!(gBattleTypeFlags & BATTLE_TYPE_IS_MASTER) && gBattleTypeFlags & BATTLE_TYPE_LINK)
        gBattlerControllerFuncs[battler] = OakOldManSetBattleEndCallbacks;
}

bool8 BtlCtrl_OakOldMan_TestState2Flag(u8 mask)
{
    return gBattleStruct->simulatedInputState[2] & mask;
}

void BtlCtrl_OakOldMan_SetState2Flag(u8 mask)
{
    gBattleStruct->simulatedInputState[2] |= mask;
}

void BtlCtrl_DrawVoiceoverMessageFrame(void)
{
    u32 width = 0x1A;
    u32 pal = 7;

    FillBgTilemapBufferRect(0, 0x30,                 0,    0xE,  1,     1, pal);
    FillBgTilemapBufferRect(0, 0x31,                 1,    0xE,  1,     1, pal);
    FillBgTilemapBufferRect(0, 0x32,                 2,    0xE,  width, 1, pal);
    FillBgTilemapBufferRect(0, 0x33,                 0x1C, 0xE,  1,     1, pal);
    FillBgTilemapBufferRect(0, 0x34,                 0x1D, 0xE,  1,     1, pal);
    FillBgTilemapBufferRect(0, 0x35,                 0,    0xF,  1,     1, pal);
    FillBgTilemapBufferRect(0, 0x36,                 1,    0xF,  1,     1, pal);
    FillBgTilemapBufferRect(0, 0x38,                 0x1C, 0xF,  1,     1, pal);
    FillBgTilemapBufferRect(0, 0x39,                 0x1D, 0xF,  1,     1, pal);
    FillBgTilemapBufferRect(0, 0x3A,                 0,    0x10, 1,     1, pal);
    FillBgTilemapBufferRect(0, 0x3B,                 1,    0x10, 1,     1, pal);
    FillBgTilemapBufferRect(0, 0x3C,                 0x1C, 0x10, 1,     1, pal);
    FillBgTilemapBufferRect(0, 0x3D,                 0x1D, 0x10, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x3A), 0,    0x11, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x3B), 1,    0x11, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x3C), 0x1C, 0x11, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x3D), 0x1D, 0x11, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x35), 0,    0x12, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x36), 1,    0x12, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x38), 0x1C, 0x12, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x39), 0x1D, 0x12, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x30), 0,    0x13, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x31), 1,    0x13, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x32), 2,    0x13, width, 1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x33), 0x1C, 0x13, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x34), 0x1D, 0x13, 1,     1, pal);
}

void BtlCtrl_RemoveVoiceoverMessageFrame(void)
{
    u32 pal = 0;
    u32 width = 0x1A;
    u32 height;

    FillBgTilemapBufferRect(0, 3,    0,    0xE,  1,     1,      pal);
    height = 4;
    FillBgTilemapBufferRect(0, 4,    1,    0xE,  1,     1,      pal);
    FillBgTilemapBufferRect(0, 5,    2,    0xE,  width, 1,      pal);
    FillBgTilemapBufferRect(0, 6,    0x1C, 0xE,  1,     1,      pal);
    FillBgTilemapBufferRect(0, 7,    0x1D, 0xE,  1,     1,      pal);
    FillBgTilemapBufferRect(0, 8,    0,    0xF,  1,     height, pal);
    FillBgTilemapBufferRect(0, 9,    1,    0xF,  1,     height, pal);
    FillBgTilemapBufferRect(0, 0xA,  2,    0xF,  width, height, pal);
    FillBgTilemapBufferRect(0, 0xB,  0x1C, 0xF,  1,     height, pal);
    FillBgTilemapBufferRect(0, 0xC,  0x1D, 0xF,  1,     height, pal);
    FillBgTilemapBufferRect(0, 0xD,  0,    0x13, 1,     1,      pal);
    FillBgTilemapBufferRect(0, 0xE,  1,    0x13, 1,     1,      pal);
    FillBgTilemapBufferRect(0, 0xF,  2,    0x13, width, 1,      pal);
    FillBgTilemapBufferRect(0, 0x10, 0x1C, 0x13, 1,     1,      pal);
    FillBgTilemapBufferRect(0, 0x11, 0x1D, 0x13, 1,     1,      pal);
}
