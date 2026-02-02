#include "global.h"
#include "battle.h"
#include "battle_ai_main.h"
#include "battle_ai_switch.h"
#include "battle_ai_util.h"
#include "constants/battle_ai.h"
#include "battle_anim.h"
// #include "battle_arena.h"
#include "battle_controllers.h"
#include "battle_message.h"
#include "battle_interface.h"
#include "battle_setup.h"
#include "battle_special.h"
// #include "battle_special.h"
// #include "battle_tv.h"
#include "battle_z_move.h"
#include "bg.h"
#include "data.h"
// #include "frontier_util.h"
#include "item.h"
#include "link.h"
#include "main.h"
#include "m4a.h"
#include "palette.h"
#include "party_menu.h"
#include "pokeball.h"
#include "pokemon.h"
#include "random.h"
#include "reshow_battle_screen.h"
#include "sound.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "trainer_tower.h"
#include "util.h"
#include "window.h"
#include "constants/battle_anim.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/party_menu.h"
#include "constants/songs.h"
#include "constants/trainers.h"
// #include "trainer_hill.h"
#include "trainer_tower.h"
#include "test_runner.h"
#include "test/battle.h"
#include "test/test_runner_battle.h"

static void OpponentHandleDrawTrainerPic(u32 battler);
static void OpponentHandleTrainerSlideBack(u32 battler);
static void OpponentHandleChooseAction(u32 battler);
static void OpponentHandleChooseMove(u32 battler);
static void OpponentHandleChooseItem(u32 battler);
static void OpponentHandleChoosePokemon(u32 battler);
static void OpponentHandleIntroTrainerBallThrow(u32 battler);
static void OpponentHandleDrawPartyStatusSummary(u32 battler);
static void OpponentHandleEndLinkBattle(u32 battler);
static void OpponentBufferRunCommand(u32 battler);

static void (*const sOpponentBufferCommands[CONTROLLER_CMDS_COUNT])(u32 battler) =
{
    [CONTROLLER_GETMONDATA]               = BtlController_HandleGetMonData,
    [CONTROLLER_GETRAWMONDATA]            = BtlController_HandleGetRawMonData,
    [CONTROLLER_SETMONDATA]               = BtlController_HandleSetMonData,
    [CONTROLLER_SETRAWMONDATA]            = BtlController_HandleSetRawMonData,
    [CONTROLLER_LOADMONSPRITE]            = BtlController_HandleLoadMonSprite,
    [CONTROLLER_SWITCHINANIM]             = BtlController_HandleSwitchInAnim,
    [CONTROLLER_RETURNMONTOBALL]          = BtlController_HandleReturnMonToBall,
    [CONTROLLER_DRAWTRAINERPIC]           = OpponentHandleDrawTrainerPic,
    [CONTROLLER_TRAINERSLIDE]             = OpponentHandleTrainerSlide,
    [CONTROLLER_TRAINERSLIDEBACK]         = OpponentHandleTrainerSlideBack,
    [CONTROLLER_FAINTANIMATION]           = BtlController_HandleFaintAnimation,
    [CONTROLLER_PALETTEFADE]              = BtlController_Empty,
    [CONTROLLER_BALLTHROWANIM]            = BtlController_Empty,
    [CONTROLLER_PAUSE]                    = BtlController_Empty,
    [CONTROLLER_MOVEANIMATION]            = BtlController_HandleMoveAnimation,
    [CONTROLLER_PRINTSTRING]              = BtlController_HandlePrintString,
    [CONTROLLER_PRINTSTRINGPLAYERONLY]    = BtlController_Empty,
    [CONTROLLER_CHOOSEACTION]             = OpponentHandleChooseAction,
    [CONTROLLER_YESNOBOX]                 = BtlController_Empty,
    [CONTROLLER_CHOOSEMOVE]               = OpponentHandleChooseMove,
    [CONTROLLER_OPENBAG]                  = OpponentHandleChooseItem,
    [CONTROLLER_CHOOSEPOKEMON]            = OpponentHandleChoosePokemon,
    [CONTROLLER_23]                       = BtlController_Empty,
    [CONTROLLER_HEALTHBARUPDATE]          = BtlController_HandleHealthBarUpdate,
    [CONTROLLER_EXPUPDATE]                = BtlController_Empty,
    [CONTROLLER_STATUSICONUPDATE]         = BtlController_HandleStatusIconUpdate,
    [CONTROLLER_STATUSANIMATION]          = BtlController_HandleStatusAnimation,
    [CONTROLLER_STATUSXOR]                = BtlController_Empty,
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
    [CONTROLLER_PLAYSE]                   = BtlController_HandlePlaySE,
    [CONTROLLER_PLAYFANFAREORBGM]         = BtlController_HandlePlayFanfareOrBGM,
    [CONTROLLER_FAINTINGCRY]              = BtlController_HandleFaintingCry,
    [CONTROLLER_INTROSLIDE]               = BtlController_HandleIntroSlide,
    [CONTROLLER_INTROTRAINERBALLTHROW]    = OpponentHandleIntroTrainerBallThrow,
    [CONTROLLER_DRAWPARTYSTATUSSUMMARY]   = OpponentHandleDrawPartyStatusSummary,
    [CONTROLLER_HIDEPARTYSTATUSSUMMARY]   = BtlController_HandleHidePartyStatusSummary,
    [CONTROLLER_ENDBOUNCE]                = BtlController_Empty,
    [CONTROLLER_SPRITEINVISIBILITY]       = BtlController_HandleSpriteInvisibility,
    [CONTROLLER_BATTLEANIMATION]          = BtlController_HandleBattleAnimation,
    [CONTROLLER_LINKSTANDBYMSG]           = BtlController_Empty,
    [CONTROLLER_RESETACTIONMOVESELECTION] = BtlController_Empty,
    [CONTROLLER_ENDLINKBATTLE]            = OpponentHandleEndLinkBattle,
    [CONTROLLER_DEBUGMENU]                = BtlController_Empty,
    [CONTROLLER_TERMINATOR_NOP]           = BtlController_TerminatorNop
};

void SetControllerToOpponent(u32 battler)
{
    gBattlerBattleController[battler] = BATTLE_CONTROLLER_OPPONENT;
    gBattlerControllerEndFuncs[battler] = OpponentBufferExecCompleted;
    gBattlerControllerFuncs[battler] = OpponentBufferRunCommand;
}

static void OpponentBufferRunCommand(u32 battler)
{
    if (IsBattleControllerActiveOnLocal(battler))
    {
        if (gBattleResources->bufferA[battler][0] < ARRAY_COUNT(sOpponentBufferCommands))
            sOpponentBufferCommands[gBattleResources->bufferA[battler][0]](battler);
        else
            BtlController_Complete(battler);
    }
}

static void Intro_WaitForShinyAnimAndHealthbox(u32 battler)
{
    bool8 healthboxAnimDone = FALSE;
    bool8 twoMons;

    twoMons = TwoOpponentIntroMons(battler);
    if (!twoMons || ((twoMons && (gBattleTypeFlags & BATTLE_TYPE_MULTI) && !BATTLE_TWO_VS_ONE_OPPONENT) || (gBattleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS)))
    {
        if (gSprites[gHealthboxSpriteIds[battler]].callback == SpriteCallbackDummy)
            healthboxAnimDone = TRUE;
        twoMons = FALSE;
    }
    else
    {
        if (gSprites[gHealthboxSpriteIds[battler]].callback == SpriteCallbackDummy
         && gSprites[gHealthboxSpriteIds[BATTLE_PARTNER(battler)]].callback == SpriteCallbackDummy)
            healthboxAnimDone = TRUE;
        twoMons = TRUE;
    }

    if (healthboxAnimDone)
    {
        if (twoMons == TRUE)
        {
            if (gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim
             && gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].finishedShinyMonAnim)
            {
                gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim = FALSE;
                gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim = FALSE;
                gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].triedShinyMonAnim = FALSE;
                gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].finishedShinyMonAnim = FALSE;
                FreeShinyStars();
            }
            else
            {
                return;
            }
        }
        else if (gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim)
        {
            if (GetBattlerPosition(battler) == B_POSITION_OPPONENT_RIGHT)
            {
                if (!gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].triedShinyMonAnim
                 && !gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].finishedShinyMonAnim)
                {
                    FreeShinyStars();
                }
                else
                {
                    return;
                }
            }
            gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim = FALSE;
            gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim = FALSE;
        }
        else
        {
            return;
        }

        gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay = 3;
        gBattlerControllerFuncs[battler] = BtlController_Intro_DelayAndEnd;
    }
}

static void Intro_TryShinyAnimShowHealthbox(u32 battler)
{
    bool32 bgmRestored = FALSE;
    bool32 battlerAnimsDone = FALSE;
    bool32 twoMons;

    if (!gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim
     && !gBattleSpritesDataPtr->healthBoxesData[battler].ballAnimActive
     && !gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim)
        TryShinyAnimation(battler, GetBattlerMon(battler));

    twoMons = TwoOpponentIntroMons(battler);
    if (!(gBattleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS)
     && (!(gBattleTypeFlags & BATTLE_TYPE_MULTI) || BATTLE_TWO_VS_ONE_OPPONENT)
     && twoMons
     && !gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].triedShinyMonAnim
     && !gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].ballAnimActive
     && !gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].finishedShinyMonAnim)
        TryShinyAnimation(BATTLE_PARTNER(battler), GetBattlerMon(BATTLE_PARTNER(battler)));

    if (!gBattleSpritesDataPtr->healthBoxesData[battler].ballAnimActive && !gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].ballAnimActive)
    {
        if (!gBattleSpritesDataPtr->healthBoxesData[battler].healthboxSlideInStarted)
        {
            if (twoMons && (!(gBattleTypeFlags & BATTLE_TYPE_MULTI) || BATTLE_TWO_VS_ONE_OPPONENT))
            {
                UpdateHealthboxAttribute(gHealthboxSpriteIds[BATTLE_PARTNER(battler)], GetBattlerMon(BATTLE_PARTNER(battler)), HEALTHBOX_ALL);
                StartHealthboxSlideIn(BATTLE_PARTNER(battler));
                SetHealthboxSpriteVisible(gHealthboxSpriteIds[BATTLE_PARTNER(battler)]);
            }
            UpdateHealthboxAttribute(gHealthboxSpriteIds[battler], GetBattlerMon(battler), HEALTHBOX_ALL);
            StartHealthboxSlideIn(battler);
            SetHealthboxSpriteVisible(gHealthboxSpriteIds[battler]);
        }
        gBattleSpritesDataPtr->healthBoxesData[battler].healthboxSlideInStarted = TRUE;
    }

    if (!gBattleSpritesDataPtr->healthBoxesData[battler].waitForCry
        && gBattleSpritesDataPtr->healthBoxesData[battler].healthboxSlideInStarted
        && !gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].waitForCry
        && !IsCryPlayingOrClearCrySongs())
    {
        if (!gBattleSpritesDataPtr->healthBoxesData[battler].bgmRestored)
        {
            if (gBattleTypeFlags & BATTLE_TYPE_MULTI && gBattleTypeFlags & BATTLE_TYPE_LINK)
            {
                if (GetBattlerPosition(battler) == B_POSITION_OPPONENT_LEFT)
                    m4aMPlayContinue(&gMPlayInfo_BGM);
            }
            else
            {
                m4aMPlayVolumeControl(&gMPlayInfo_BGM, TRACKS_ALL, 0x100);
            }
        }
        gBattleSpritesDataPtr->healthBoxesData[battler].bgmRestored = TRUE;
        bgmRestored = TRUE;
    }

    if (!twoMons || (twoMons && gBattleTypeFlags & BATTLE_TYPE_MULTI && !BATTLE_TWO_VS_ONE_OPPONENT))
    {
        if (gSprites[gBattleControllerData[battler]].callback == SpriteCallbackDummy)
        {
            TrySetBattlerShadowSpriteCallback(battler);
            if (gSprites[gBattlerSpriteIds[battler]].callback == SpriteCallbackDummy)
            {
                battlerAnimsDone = TRUE;
            }
        }
    }
    else
    {
        if (gSprites[gBattleControllerData[battler]].callback == SpriteCallbackDummy
            && gSprites[gBattleControllerData[BATTLE_PARTNER(battler)]].callback == SpriteCallbackDummy)
        {
            TrySetBattlerShadowSpriteCallback(battler);
            TrySetBattlerShadowSpriteCallback(BATTLE_PARTNER(battler));
            if (gSprites[gBattlerSpriteIds[battler]].callback == SpriteCallbackDummy
                && gSprites[gBattlerSpriteIds[BATTLE_PARTNER(battler)]].callback == SpriteCallbackDummy)
            {
                battlerAnimsDone = TRUE;
            }
        }
    }

    if (bgmRestored && battlerAnimsDone)
    {
        if (twoMons && (!(gBattleTypeFlags & BATTLE_TYPE_MULTI) || BATTLE_TWO_VS_ONE_OPPONENT))
            DestroySprite(&gSprites[gBattleControllerData[BATTLE_PARTNER(battler)]]);

        DestroySprite(&gSprites[gBattleControllerData[battler]]);
        gBattleSpritesDataPtr->animationData->introAnimActive = FALSE;
        gBattleSpritesDataPtr->healthBoxesData[battler].bgmRestored = FALSE;
        gBattleSpritesDataPtr->healthBoxesData[battler].healthboxSlideInStarted = FALSE;

        gBattlerControllerFuncs[battler] = Intro_WaitForShinyAnimAndHealthbox;
    }
}

void OpponentBufferExecCompleted(u32 battler)
{
    gBattlerControllerFuncs[battler] = OpponentBufferRunCommand;
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        u8 playerId = GetMultiplayerId();

        PrepareBufferDataTransferLink(battler, B_COMM_CONTROLLER_IS_DONE, 4, &playerId);
        gBattleResources->bufferA[battler][0] = CONTROLLER_TERMINATOR_NOP;
    }
    else
    {
        MarkBattleControllerIdleOnLocal(battler);
    }
}

static u32 OpponentGetTrainerPicId(u32 battlerId)
{
    enum TrainerPicID trainerPicId;

    if (gBattleTypeFlags & BATTLE_TYPE_FRONTIER)
    {
        trainerPicId = TRAINER_PIC_RED; // placeholder
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_TRAINER_TOWER)
    {
        trainerPicId = GetTrainerTowerTrainerFrontSpriteId();
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_EREADER_TRAINER)
    {
        trainerPicId = GetEreaderTrainerFrontSpriteId();
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS)
    {
        if (battlerId != 1)
            trainerPicId = GetTrainerPicFromId(TRAINER_BATTLE_PARAM.opponentB);
        else
            trainerPicId = GetTrainerPicFromId(TRAINER_BATTLE_PARAM.opponentA);
    }
    else
    {
        trainerPicId = GetTrainerPicFromId(TRAINER_BATTLE_PARAM.opponentA);
    }

    return trainerPicId;
}

static void OpponentHandleDrawTrainerPic(u32 battler)
{
    s16 xPos;
    enum TrainerPicID trainerPicId;

    // Sets Multibattle test opponent sprites to not be Hiker
    if (IsMultibattleTest())
    {
        if (GetBattlerPosition(battler) == B_POSITION_OPPONENT_LEFT)
        {
            trainerPicId = TRAINER_PIC_LEAF;
            if (!(gBattleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS))
                xPos = 176;
            else
                xPos = 200;
        }
        else
        {
            trainerPicId = TRAINER_PIC_RED;
            xPos = 152;
        }
    }
    else
    {
        trainerPicId = OpponentGetTrainerPicId(battler);

        if (gBattleTypeFlags & (BATTLE_TYPE_MULTI | BATTLE_TYPE_TWO_OPPONENTS) && !BATTLE_TWO_VS_ONE_OPPONENT)
        {
            if ((GetBattlerPosition(battler) & BIT_FLANK) != 0) // second mon
                xPos = 152;
           else // first mon
                xPos = 200;
        }
        else
        {
            xPos = 176;
        }
    }

    BtlController_HandleDrawTrainerPic(battler, trainerPicId, TRUE, xPos, 40, -1);
}

void OpponentHandleTrainerSlide(u32 battler)
{
    enum TrainerPicID trainerPicId = OpponentGetTrainerPicId(battler);
    BtlController_HandleTrainerSlide(battler, trainerPicId);
}

static void OpponentHandleTrainerSlideBack(u32 battler)
{
    BtlController_HandleTrainerSlideBack(battler, 35, FALSE);
}

static void OpponentHandleChooseAction(u32 battler)
{
    AI_TrySwitchOrUseItem(battler);
    BtlController_Complete(battler);
}

static void OpponentHandleChooseMove(u32 battler)
{
    u32 chosenMoveIndex;
    struct ChooseMoveStruct *moveInfo = (struct ChooseMoveStruct *)(&gBattleResources->bufferA[battler][4]);

    if (gBattleTypeFlags & (BATTLE_TYPE_TRAINER | BATTLE_TYPE_FIRST_BATTLE | BATTLE_TYPE_SAFARI | BATTLE_TYPE_ROAMER)
     || IsWildMonSmart())
    {
        if (gBattleTypeFlags & BATTLE_TYPE_PALACE)
        {
            // BtlController_EmitTwoReturnValues(battler, B_COMM_TO_ENGINE, B_ACTION_EXEC_SCRIPT, ChooseMoveAndTargetInBattlePalace(battler));
        }
        else if (gAiBattleData->actionFlee)
        {
            gAiBattleData->actionFlee = FALSE;
            BtlController_EmitTwoReturnValues(battler, B_COMM_TO_ENGINE, B_ACTION_RUN, 0);
        }
        else if (gAiBattleData->choiceWatch)
        {
            gAiBattleData->choiceWatch = FALSE;
            BtlController_EmitTwoReturnValues(battler, B_COMM_TO_ENGINE, B_ACTION_SAFARI_WATCH_CAREFULLY, 0);
        }
        else
        {
            chosenMoveIndex = gAiBattleData->chosenMoveIndex[battler];
            gBattlerTarget = gAiBattleData->chosenTarget[battler];

            u32 chosenMove = moveInfo->moves[chosenMoveIndex];
            enum MoveTarget target = GetBattlerMoveTargetType(battler, chosenMove);

            if (target == TARGET_USER || target == TARGET_USER_OR_ALLY)
                gBattlerTarget = battler;

            if (target == TARGET_BOTH)
            {
                gBattlerTarget = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
                if (gAbsentBattlerFlags & (1u << gBattlerTarget))
                    gBattlerTarget = GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT);
            }
            // If opponent can and should use a gimmick (considering trainer data), do it
            enum Gimmick usableGimmick = gBattleStruct->gimmick.usableGimmick[battler];
            if (usableGimmick != GIMMICK_NONE && IsAIUsingGimmick(battler) && !HasTrainerUsedGimmick(battler, usableGimmick))
            {
                gBattleStruct->gimmick.toActivate |= 1u << battler;
                BtlController_EmitTwoReturnValues(battler, B_COMM_TO_ENGINE, B_ACTION_EXEC_SCRIPT, (chosenMoveIndex) | (RET_GIMMICK) | (gBattlerTarget << 8));
            }
            else
            {
                SetAIUsingGimmick(battler, NO_GIMMICK);
                BtlController_EmitTwoReturnValues(battler, B_COMM_TO_ENGINE, B_ACTION_EXEC_SCRIPT, (chosenMoveIndex) | (gBattlerTarget << 8));
            }
        }
        BtlController_Complete(battler);
    }
    else // Wild pokemon - use random move
    {
        enum Move move;
        do
        {
            chosenMoveIndex = Random() & (MAX_MON_MOVES - 1);
            move = moveInfo->moves[chosenMoveIndex];
        } while (move == MOVE_NONE);

        enum MoveTarget target = GetBattlerMoveTargetType(battler, move);
        if (target == TARGET_USER || target == TARGET_USER_OR_ALLY)
        {
            BtlController_EmitTwoReturnValues(battler, B_COMM_TO_ENGINE, B_ACTION_EXEC_SCRIPT, (chosenMoveIndex) | (battler << 8));
        }
        else if (IsDoubleBattle())
        {
            do {
                target = GetBattlerAtPosition(Random() & 2);
            } while (!CanTargetBattler(battler, target, move));

            // Don't bother to check if they're enemies if the move can't attack ally
            if (B_WILD_NATURAL_ENEMIES == TRUE && GetBattlerMoveTargetType(battler, move) != TARGET_BOTH)
            {
                u32 speciesAttacker, speciesTarget;
                speciesAttacker = gBattleMons[battler].species;
                speciesTarget = gBattleMons[GetBattlerAtPosition(BATTLE_PARTNER(battler))].species;

                bool32 isPartnerEnemy = IsNaturalEnemy(speciesAttacker, speciesTarget);

                if (isPartnerEnemy && CanTargetBattler(battler, target, move))
                    BtlController_EmitTwoReturnValues(battler, B_COMM_TO_ENGINE, B_ACTION_EXEC_SCRIPT, (chosenMoveIndex) | (GetBattlerAtPosition(BATTLE_PARTNER(battler)) << 8));
                else
                    BtlController_EmitTwoReturnValues(battler, B_COMM_TO_ENGINE, B_ACTION_EXEC_SCRIPT, (chosenMoveIndex) | (target << 8));
            }
            else
            {
                BtlController_EmitTwoReturnValues(battler, B_COMM_TO_ENGINE, B_ACTION_EXEC_SCRIPT, (chosenMoveIndex) | (target << 8));
            }
        }
        else
            BtlController_EmitTwoReturnValues(battler, B_COMM_TO_ENGINE, B_ACTION_EXEC_SCRIPT, (chosenMoveIndex) | (GetBattlerAtPosition(B_POSITION_PLAYER_LEFT) << 8));

        BtlController_Complete(battler);
    }
}

static void OpponentHandleChooseItem(u32 battler)
{
    BtlController_EmitOneReturnValue(battler, B_COMM_TO_ENGINE, gBattleStruct->chosenItem[battler]);
    BtlController_Complete(battler);
}

static void OpponentHandleChoosePokemon(u32 battler)
{
    s32 chosenMonId;
    enum SwitchType switchType = SWITCH_AFTER_KO;

    // Choosing Revival Blessing target
    if (gBattleResources->bufferA[battler][1] == PARTY_ACTION_CHOOSE_FAINTED_MON)
    {
        chosenMonId = AI_SelectRevivalBlessingMon(battler);
        if (chosenMonId == PARTY_SIZE)
            chosenMonId = GetFirstFaintedPartyIndex(battler);
        gSelectedMonPartyId = chosenMonId;
    }
    // Switching out
    else if (gBattleStruct->AI_monToSwitchIntoId[battler] == PARTY_SIZE)
    {
        if (IsSwitchOutEffect(GetMoveEffect(gCurrentMove)) || gAiLogicData->ejectButtonSwitch || gAiLogicData->ejectPackSwitch)
            switchType = SWITCH_MID_BATTLE_FORCED;

        // reset the AI data to consider the correct on-field state at time of switch
        SetBattlerAiData(GetBattlerAtPosition(B_POSITION_PLAYER_LEFT), gAiLogicData);
        if (IsDoubleBattle())
            SetBattlerAiData(GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT), gAiLogicData);

        chosenMonId = GetMostSuitableMonToSwitchInto(battler, switchType);
        if (chosenMonId == PARTY_SIZE) // Advanced logic failed so we pick the next available battler
        {
            s32 battler1, battler2, firstId, lastId;

            if (!IsDoubleBattle())
            {
                battler2 = battler1 = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
            }
            else
            {
                battler1 = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
                battler2 = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
            }

            GetAIPartyIndexes(battler, &firstId, &lastId);
            for (chosenMonId = firstId; chosenMonId < lastId; chosenMonId++)
            {
                if (IsValidForBattle(&gEnemyParty[chosenMonId])
                 && chosenMonId != gBattlerPartyIndexes[battler1]
                 && chosenMonId != gBattlerPartyIndexes[battler2])
                    break;
            }
        }
        gBattleStruct->monToSwitchIntoId[battler] = chosenMonId;
    }
    else
    {
        chosenMonId = gBattleStruct->AI_monToSwitchIntoId[battler];
        gBattleStruct->AI_monToSwitchIntoId[battler] = PARTY_SIZE;
        gBattleStruct->monToSwitchIntoId[battler] = chosenMonId;
    }
    #if TESTING
    TestRunner_Battle_CheckSwitch(battler, chosenMonId);
    #endif // TESTING
    BtlController_EmitChosenMonReturnValue(battler, B_COMM_TO_ENGINE, chosenMonId, NULL);
    BtlController_Complete(battler);
}

static void OpponentHandleIntroTrainerBallThrow(u32 battler)
{
    BtlController_HandleIntroTrainerBallThrow(battler, 0, NULL, 0, Intro_TryShinyAnimShowHealthbox);
}

static void OpponentHandleDrawPartyStatusSummary(u32 battler)
{
    BtlController_HandleDrawPartyStatusSummary(battler, B_SIDE_OPPONENT, TRUE);
}

static void OpponentHandleEndLinkBattle(u32 battler)
{
    if (gBattleTypeFlags & BATTLE_TYPE_LINK && !(gBattleTypeFlags & BATTLE_TYPE_IS_MASTER))
    {
        gMain.inBattle = FALSE;
        gMain.callback1 = gPreBattleCallback1;
        SetMainCallback2(gMain.savedCallback);
    }
    BtlController_Complete(battler);
}
