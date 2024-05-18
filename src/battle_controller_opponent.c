#include "global.h"
#include "gflib.h"
#include "data.h"
#include "m4a.h"
#include "task.h"
#include "util.h"
#include "pokeball.h"
#include "random.h"
#include "battle.h"
#include "battle_ai_main.h"
#include "battle_ai_util.h"
#include "battle_anim.h"
#include "battle_controllers.h"
#include "battle_message.h"
#include "battle_interface.h"
#include "battle_tower.h"
#include "battle_gfx_sfx_util.h"
#include "battle_ai_switch_items.h"
#include "battle_z_move.h"
#include "party_menu.h"
#include "trainer_tower.h"
#include "constants/battle_ai.h"
#include "constants/battle_anim.h"
#include "constants/moves.h"
#include "constants/party_menu.h"
#include "constants/songs.h"
#include "constants/sound.h"

static void OpponentHandleLoadMonSprite(u32 battler);
static void OpponentHandleSwitchInAnim(u32 battler);
static void OpponentHandleDrawTrainerPic(u32 battler);
static void OpponentHandleTrainerSlide(u32 battler);
static void OpponentHandleTrainerSlideBack(u32 battler);
static void OpponentHandleChooseAction(u32 battler);
static void OpponentHandleChooseMove(u32 battler);
static void OpponentHandleChooseItem(u32 battler);
static void OpponentHandleChoosePokemon(u32 battler);
static void OpponentHandleHealthBarUpdate(u32 battler);
static void OpponentHandleIntroTrainerBallThrow(u32 battler);
static void OpponentHandleDrawPartyStatusSummary(u32 battler);
static void OpponentHandleBattleAnimation(u32 battler);
static void OpponentHandleEndLinkBattle(u32 battler);
static u8 CountAIAliveNonEggMonsExcept(u8 slotToIgnore);

static void OpponentBufferRunCommand(u32 battler);
static void SwitchIn_HandleSoundAndEnd(u32 battler);

static void (*const sOpponentBufferCommands[CONTROLLER_CMDS_COUNT])(u32 battler) =
{
    [CONTROLLER_GETMONDATA]               = BtlController_HandleGetMonData,             // done
    [CONTROLLER_GETRAWMONDATA]            = BtlController_HandleGetRawMonData,          // done
    [CONTROLLER_SETMONDATA]               = BtlController_HandleSetMonData,             // done
    [CONTROLLER_SETRAWMONDATA]            = BtlController_HandleSetRawMonData,          // done
    [CONTROLLER_LOADMONSPRITE]            = OpponentHandleLoadMonSprite,                // done
    [CONTROLLER_SWITCHINANIM]             = OpponentHandleSwitchInAnim,                 // done
    [CONTROLLER_RETURNMONTOBALL]          = BtlController_HandleReturnMonToBall,        // done
    [CONTROLLER_DRAWTRAINERPIC]           = OpponentHandleDrawTrainerPic,               // done
    [CONTROLLER_TRAINERSLIDE]             = OpponentHandleTrainerSlide,                 // done
    [CONTROLLER_TRAINERSLIDEBACK]         = OpponentHandleTrainerSlideBack,             // done
    [CONTROLLER_FAINTANIMATION]           = BtlController_HandleFaintAnimation,         // done
    [CONTROLLER_PALETTEFADE]              = BtlController_Empty,                        // done
    [CONTROLLER_SUCCESSBALLTHROWANIM]     = BtlController_Empty,                        // done
    [CONTROLLER_BALLTHROWANIM]            = BtlController_Empty,                        // done
    [CONTROLLER_PAUSE]                    = BtlController_Empty,                        // done
    [CONTROLLER_MOVEANIMATION]            = BtlController_HandleMoveAnimation,          // done
    [CONTROLLER_PRINTSTRING]              = BtlController_HandlePrintString,            // done
    [CONTROLLER_PRINTSTRINGPLAYERONLY]    = BtlController_Empty,                        // done
    [CONTROLLER_CHOOSEACTION]             = OpponentHandleChooseAction,                 // done
    [CONTROLLER_UNKNOWNYESNOBOX]          = BtlController_Empty,                        // done
    [CONTROLLER_CHOOSEMOVE]               = OpponentHandleChooseMove,                   // done
    [CONTROLLER_OPENBAG]                  = OpponentHandleChooseItem,                   // done
    [CONTROLLER_CHOOSEPOKEMON]            = OpponentHandleChoosePokemon,                // done
    [CONTROLLER_23]                       = BtlController_Empty,                        // done
    [CONTROLLER_HEALTHBARUPDATE]          = OpponentHandleHealthBarUpdate,              // done
    [CONTROLLER_EXPUPDATE]                = BtlController_Empty,                        // done
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
    [CONTROLLER_CLEARUNKVAR]              = BtlController_HandleClearUnkVar,            // done
    [CONTROLLER_SETUNKVAR]                = BtlController_HandleSetUnkVar,              // done
    [CONTROLLER_CLEARUNKFLAG]             = BtlController_HandleClearUnkFlag,           // done
    [CONTROLLER_TOGGLEUNKFLAG]            = BtlController_HandleToggleUnkFlag,          // done
    [CONTROLLER_HITANIMATION]             = BtlController_HandleHitAnimation,           // done
    [CONTROLLER_CANTSWITCH]               = BtlController_Empty,                        // done
    [CONTROLLER_PLAYSE]                   = BtlController_HandlePlaySE,                 // done
    [CONTROLLER_PLAYFANFAREORBGM]         = BtlController_HandlePlayFanfareOrBGM,       // done
    [CONTROLLER_FAINTINGCRY]              = BtlController_HandleFaintingCry,            // done
    [CONTROLLER_INTROSLIDE]               = BtlController_HandleIntroSlide,             // done
    [CONTROLLER_INTROTRAINERBALLTHROW]    = OpponentHandleIntroTrainerBallThrow,        // done
    [CONTROLLER_DRAWPARTYSTATUSSUMMARY]   = OpponentHandleDrawPartyStatusSummary,       // done
    [CONTROLLER_HIDEPARTYSTATUSSUMMARY]   = BtlController_HandleHidePartyStatusSummary, // done
    [CONTROLLER_ENDBOUNCE]                = BtlController_Empty,                        // done
    [CONTROLLER_SPRITEINVISIBILITY]       = BtlController_HandleSpriteInvisibility,     // done
    [CONTROLLER_BATTLEANIMATION]          = OpponentHandleBattleAnimation,              // done
    [CONTROLLER_LINKSTANDBYMSG]           = BtlController_Empty,                        // done
    [CONTROLLER_RESETACTIONMOVESELECTION] = BtlController_Empty,                        // done
    [CONTROLLER_ENDLINKBATTLE]            = OpponentHandleEndLinkBattle,                // done
    [CONTROLLER_TERMINATOR_NOP]           = BtlController_TerminatorNop                 // done
};

void SetControllerToOpponent(u32 battler)
{
    gBattlerControllerEndFuncs[battler] = OpponentBufferExecCompleted;
    gBattlerControllerFuncs[battler] = OpponentBufferRunCommand;
}

static void OpponentBufferRunCommand(u32 battler)
{
    if (gBattleControllerExecFlags & gBitTable[battler])
    {
        if (gBattleResources->bufferA[battler][0] < NELEMS(sOpponentBufferCommands))
            sOpponentBufferCommands[gBattleResources->bufferA[battler][0]](battler);
        else
            OpponentBufferExecCompleted(battler);
    }
}

static void Intro_DelayAndEnd(u32 battler)
{
    if (--gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay == (u8)-1)
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay = 0;
        OpponentBufferExecCompleted(battler);
    }
}

static void Intro_WaitForShinyAnimAndHealthbox(u32 battler)
{
    bool8 var = FALSE;

    if (!IsDoubleBattle() || ((IsDoubleBattle() && (gBattleTypeFlags & BATTLE_TYPE_MULTI))))
    {
        if (gSprites[gHealthboxSpriteIds[battler]].callback == SpriteCallbackDummy)
            var = TRUE;
    }
    else if (gSprites[gHealthboxSpriteIds[battler]].callback == SpriteCallbackDummy
          && gSprites[gHealthboxSpriteIds[BATTLE_PARTNER(battler)]].callback == gSprites[gHealthboxSpriteIds[battler]].callback)
    {
        var = TRUE;
    }
    if (IsCryPlayingOrClearCrySongs())
        var = FALSE;
    if (var && gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim && gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].finishedShinyMonAnim)
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim = FALSE;
        gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim = FALSE;
        gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].triedShinyMonAnim = FALSE;
        gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].finishedShinyMonAnim = FALSE;
        FreeSpriteTilesByTag(ANIM_TAG_GOLD_STARS);
        FreeSpritePaletteByTag(ANIM_TAG_GOLD_STARS);
        if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            m4aMPlayContinue(&gMPlayInfo_BGM);
        else
            m4aMPlayVolumeControl(&gMPlayInfo_BGM, TRACKS_ALL, 256);
        gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay = 3;
        gBattlerControllerFuncs[battler] = Intro_DelayAndEnd;
    }
}

static void Intro_TryShinyAnimShowHealthbox(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim && !gBattleSpritesDataPtr->healthBoxesData[battler].ballAnimActive)
        TryShinyAnimation(battler, &gEnemyParty[gBattlerPartyIndexes[battler]]);
    if (!gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].triedShinyMonAnim && !gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].ballAnimActive)
        TryShinyAnimation(BATTLE_PARTNER(battler), &gEnemyParty[gBattlerPartyIndexes[BATTLE_PARTNER(battler)]]);
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].ballAnimActive && !gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].ballAnimActive)
    {
        if (IsDoubleBattle() && !(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            DestroySprite(&gSprites[gBattleControllerData[BATTLE_PARTNER(battler)]]);
            UpdateHealthboxAttribute(gHealthboxSpriteIds[BATTLE_PARTNER(battler)],
                                     &gEnemyParty[gBattlerPartyIndexes[BATTLE_PARTNER(battler)]],
                                     HEALTHBOX_ALL);
            StartHealthboxSlideIn(BATTLE_PARTNER(battler));
            SetHealthboxSpriteVisible(gHealthboxSpriteIds[BATTLE_PARTNER(battler)]);
            SetBattlerShadowSpriteCallback(BATTLE_PARTNER(battler), GetMonData(&gEnemyParty[gBattlerPartyIndexes[BATTLE_PARTNER(battler)]], MON_DATA_SPECIES));
        }
        DestroySprite(&gSprites[gBattleControllerData[battler]]);
        UpdateHealthboxAttribute(gHealthboxSpriteIds[battler],
                                 &gEnemyParty[gBattlerPartyIndexes[battler]],
                                 HEALTHBOX_ALL);
        StartHealthboxSlideIn(battler);
        SetHealthboxSpriteVisible(gHealthboxSpriteIds[battler]);
        SetBattlerShadowSpriteCallback(battler, GetMonData(&gEnemyParty[gBattlerPartyIndexes[battler]], MON_DATA_SPECIES));
        gBattleSpritesDataPtr->animationData->introAnimActive = FALSE;
        gBattlerControllerFuncs[battler] = Intro_WaitForShinyAnimAndHealthbox;
    }
}

static void TryShinyAnimAfterMonAnim(u32 battler)
{
    if (gSprites[gBattlerSpriteIds[battler]].animEnded == TRUE
     && gSprites[gBattlerSpriteIds[battler]].x2 == 0)
    {
        if (!gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim)
        {
            TryShinyAnimation(battler, &gEnemyParty[gBattlerPartyIndexes[battler]]);
        }
        else if (gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim)
        {
            gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim = FALSE;
            gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim = FALSE;
            FreeSpriteTilesByTag(ANIM_TAG_GOLD_STARS);
            FreeSpritePaletteByTag(ANIM_TAG_GOLD_STARS);
            OpponentBufferExecCompleted(battler);
        }
    }
}

static void CompleteOnHealthbarDone(u32 battler)
{
    s16 hpValue = MoveBattleBar(battler, gHealthboxSpriteIds[battler], HEALTH_BAR, 0);
    
    SetHealthboxSpriteVisible(gHealthboxSpriteIds[battler]);
    if (hpValue != -1)
    {
        UpdateHpTextInHealthbox(gHealthboxSpriteIds[battler], HP_CURRENT, hpValue, gBattleMons[battler].maxHP);
    }
    else
    {
        if (!BtlCtrl_OakOldMan_TestState2Flag(1) && (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE))
        {
            BtlCtrl_OakOldMan_SetState2Flag(1);
            gBattlerControllerFuncs[battler] = PrintOakText_InflictingDamageIsKey;
        }
        else
        {
            OpponentBufferExecCompleted(battler);
        }
    }
}

static void SwitchIn_ShowSubstitute(u32 battler)
{
    if (gSprites[gHealthboxSpriteIds[battler]].callback == SpriteCallbackDummy)
    {
        if (gBattleSpritesDataPtr->battlerData[battler].behindSubstitute)
            InitAndLaunchSpecialAnimation(battler, battler, battler, B_ANIM_MON_TO_SUBSTITUTE);
        gBattlerControllerFuncs[battler] = SwitchIn_HandleSoundAndEnd;
    }
}

static void SwitchIn_HandleSoundAndEnd(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].specialAnimActive && !IsCryPlayingOrClearCrySongs())
    {
        m4aMPlayVolumeControl(&gMPlayInfo_BGM, TRACKS_ALL, 0x100);
        OpponentBufferExecCompleted(battler);
    }
}

static void SwitchIn_ShowHealthbox(u32 battler)
{
    if (gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim)
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim = FALSE;
        gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim = FALSE;
        FreeSpriteTilesByTag(ANIM_TAG_GOLD_STARS);
        FreeSpritePaletteByTag(ANIM_TAG_GOLD_STARS);
        StartSpriteAnim(&gSprites[gBattlerSpriteIds[battler]], 0);
        UpdateHealthboxAttribute(gHealthboxSpriteIds[battler], &gEnemyParty[gBattlerPartyIndexes[battler]], HEALTHBOX_ALL);
        StartHealthboxSlideIn(battler);
        SetHealthboxSpriteVisible(gHealthboxSpriteIds[battler]);
        CopyBattleSpriteInvisibility(battler);
        gBattlerControllerFuncs[battler] = SwitchIn_ShowSubstitute;
    }
}

static void SwitchIn_TryShinyAnim(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim && !gBattleSpritesDataPtr->healthBoxesData[battler].ballAnimActive)
        TryShinyAnimation(battler, &gEnemyParty[gBattlerPartyIndexes[battler]]);
    if (gSprites[gBattleControllerData[battler]].callback == SpriteCallbackDummy
     && !gBattleSpritesDataPtr->healthBoxesData[battler].ballAnimActive)
    {
        DestroySprite(&gSprites[gBattleControllerData[battler]]);
        SetBattlerShadowSpriteCallback(battler, GetMonData(&gEnemyParty[gBattlerPartyIndexes[battler]], MON_DATA_SPECIES));
        gBattlerControllerFuncs[battler] = SwitchIn_ShowHealthbox;
    }
}

void OpponentBufferExecCompleted(u32 battler)
{
    gBattlerControllerFuncs[battler] = OpponentBufferRunCommand;
    gBattleControllerExecFlags &= ~gBitTable[battler];
}

static void OpponentHandleLoadMonSprite(u32 battler)
{
    BtlController_HandleLoadMonSprite(battler, TryShinyAnimAfterMonAnim);
}

static void OpponentHandleSwitchInAnim(u32 battler)
{
    gBattleStruct->monToSwitchIntoId[battler] = PARTY_SIZE;
    BtlController_HandleSwitchInAnim(battler, FALSE, SwitchIn_TryShinyAnim);
}

static u32 OpponentGetTrainerPicId(u32 battlerId) // TODO: trainer refactoring
{
    u32 trainerPicId;

    if (gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER)
        trainerPicId = GetBattleTowerTrainerFrontSpriteId();
    else if (gBattleTypeFlags & BATTLE_TYPE_TRAINER_TOWER)
        trainerPicId = GetTrainerTowerTrainerFrontSpriteId();
    else if (gBattleTypeFlags & BATTLE_TYPE_EREADER_TRAINER)
        trainerPicId = GetEreaderTrainerFrontSpriteId();
    else
        trainerPicId = gTrainers[gTrainerBattleOpponent_A].trainerPic;

    return trainerPicId;
}

static void OpponentHandleDrawTrainerPic(u32 battler)
{
    s16 xPos;
    u32 trainerPicId = OpponentGetTrainerPicId(battler);

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

    BtlController_HandleDrawTrainerPic(battler, trainerPicId, TRUE, xPos, 40, -1);
}

static void OpponentHandleTrainerSlide(u32 battler)
{
    u32 trainerPicId = OpponentGetTrainerPicId(battler);
    BtlController_HandleTrainerSlide(battler, trainerPicId);
}

static void OpponentHandleTrainerSlideBack(u32 battler)
{    
    BtlController_HandleTrainerSlideBack(battler, 35, FALSE);
}

static void OpponentHandleChooseAction(u32 battler)
{
    AI_TrySwitchOrUseItem(battler);
    OpponentBufferExecCompleted(battler);
}

static void OpponentHandleChooseMove(u32 battler)
{
    u8 chosenMoveId;
    struct ChooseMoveStruct *moveInfo = (struct ChooseMoveStruct *)(&gBattleResources->bufferA[battler][4]);

    if (gBattleTypeFlags & (BATTLE_TYPE_TRAINER | BATTLE_TYPE_FIRST_BATTLE | BATTLE_TYPE_SAFARI | BATTLE_TYPE_ROAMER)
     || IsWildMonSmart())
    {
        chosenMoveId = gBattleStruct->aiMoveOrAction[battler];
        gBattlerTarget = gBattleStruct->aiChosenTarget[battler];
        switch (chosenMoveId)
        {
        case AI_CHOICE_WATCH:
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, B_ACTION_SAFARI_WATCH_CAREFULLY, 0);
            break;
        case AI_CHOICE_FLEE:
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, B_ACTION_RUN, 0);
            break;
        case AI_CHOICE_SWITCH:
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, 0xFFFF);
            break;
        case 6:
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, 15, gBattlerTarget);
            break;
        default:
            {
                u16 chosenMove = moveInfo->moves[chosenMoveId];
                bool32 isSecondTrainer = (GetBattlerPosition(battler) == B_POSITION_OPPONENT_RIGHT) && (gBattleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS) && !BATTLE_TWO_VS_ONE_OPPONENT;
                u16 trainerId = isSecondTrainer ? gTrainerBattleOpponent_B : gTrainerBattleOpponent_A;
                const struct TrainerMon *party = GetTrainerPartyFromId(trainerId);
                bool32 shouldDynamax = FALSE;
                if (party != NULL)
                    shouldDynamax = party[isSecondTrainer ? gBattlerPartyIndexes[battler] - MULTI_PARTY_SIZE : gBattlerPartyIndexes[battler]].shouldDynamax;

                if (GetBattlerMoveTargetType(battler, chosenMove) & (MOVE_TARGET_USER_OR_SELECTED | MOVE_TARGET_USER))
                    gBattlerTarget = battler;
                if (GetBattlerMoveTargetType(battler, chosenMove) & MOVE_TARGET_BOTH)
                {
                    gBattlerTarget = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
                    if (gAbsentBattlerFlags & gBitTable[gBattlerTarget])
                        gBattlerTarget = GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT);
                }
                if (ShouldUseZMove(battler, gBattlerTarget, chosenMove))
                    QueueZMove(battler, chosenMove);
                // If opponent can Mega Evolve, do it.
                if (CanMegaEvolve(battler))
                    BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, (chosenMoveId) | (RET_MEGA_EVOLUTION) | (gBattlerTarget << 8));
                // If opponent can Ultra Burst, do it.
                else if (CanUltraBurst(battler))
                    BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, (chosenMoveId) | (RET_ULTRA_BURST) | (gBattlerTarget << 8));
                // If opponent can Dynamax and is allowed in the partydata, do it.
                else if (CanDynamax(battler) && shouldDynamax)
                    BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, (chosenMoveId) | (RET_DYNAMAX) | (gBattlerTarget << 8));
                else
                    BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, (chosenMoveId) | (gBattlerTarget << 8));
            }
            break;
        }
        OpponentBufferExecCompleted(battler);
    }
    else // Wild pokemon - use random move
    {
        u16 move;
        u8 target;
        do
        {
            chosenMoveId = Random() & 3;
            move = moveInfo->moves[chosenMoveId];
        } while (move == MOVE_NONE);

        if (GetBattlerMoveTargetType(battler, move) & (MOVE_TARGET_USER_OR_SELECTED | MOVE_TARGET_USER))
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, (chosenMoveId) | (battler << 8));
        else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
        {
            do {
                target = GetBattlerAtPosition(Random() & 2);
            } while (!CanTargetBattler(battler, target, move));

            // Don't bother to loop through table if the move can't attack ally
            if (B_WILD_NATURAL_ENEMIES == TRUE && !(gMovesInfo[move].target & MOVE_TARGET_BOTH))
            {
                u16 i, speciesAttacker, speciesTarget, isPartnerEnemy = FALSE;
                static const u16 naturalEnemies[][2] =
                {
                    // Attacker         Target
                    {SPECIES_ZANGOOSE,  SPECIES_SEVIPER},
                    {SPECIES_SEVIPER,   SPECIES_ZANGOOSE},
                    {SPECIES_HEATMOR,   SPECIES_DURANT},
                    {SPECIES_DURANT,    SPECIES_HEATMOR},
                    {SPECIES_SABLEYE,   SPECIES_CARBINK},
                    {SPECIES_MAREANIE,  SPECIES_CORSOLA},
                };
                speciesAttacker = gBattleMons[battler].species;
                speciesTarget = gBattleMons[GetBattlerAtPosition(BATTLE_PARTNER(battler))].species;

                for (i = 0; i < ARRAY_COUNT(naturalEnemies); i++)
                {
                    if (speciesAttacker == naturalEnemies[i][0] && speciesTarget == naturalEnemies[i][1])
                    {
                        isPartnerEnemy = TRUE;
                        break;
                    }
                }
                if (isPartnerEnemy && CanTargetBattler(battler, target, move))
                    BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, (chosenMoveId) | (GetBattlerAtPosition(BATTLE_PARTNER(battler)) << 8));
                else
                    BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, (chosenMoveId) | (target << 8));
            }
            else
            {
                BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, (chosenMoveId) | (target << 8));
            }
        }
        else
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, (chosenMoveId) | (GetBattlerAtPosition(B_POSITION_PLAYER_LEFT) << 8));

        OpponentBufferExecCompleted(battler);
    }
}

static void OpponentHandleChooseItem(u32 battler)
{
    BtlController_EmitOneReturnValue(battler, BUFFER_B, gBattleStruct->chosenItem[battler]);
    OpponentBufferExecCompleted(battler);
}

static void OpponentHandleChoosePokemon(u32 battler)
{
    s32 chosenMonId;
    s32 pokemonInBattle = 1;

    // Choosing Revival Blessing target
    if ((gBattleResources->bufferA[battler][1] & 0xF) == PARTY_ACTION_CHOOSE_FAINTED_MON)
    {
        chosenMonId = gSelectedMonPartyId = GetFirstFaintedPartyIndex(battler);
    }
    // Switching out
    else if (*(gBattleStruct->AI_monToSwitchIntoId + battler) == PARTY_SIZE)
    {
        chosenMonId = GetMostSuitableMonToSwitchInto(battler, TRUE);
        if (chosenMonId == PARTY_SIZE)
        {
            s32 battler1, battler2, firstId, lastId;

            if (!(gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
            {
                battler2 = battler1 = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
            }
            else
            {
                battler1 = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
                battler2 = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
                pokemonInBattle = 2;
            }

            GetAIPartyIndexes(battler, &firstId, &lastId);

            for (chosenMonId = (lastId-1); chosenMonId >= firstId; chosenMonId--)
            {
                if (IsValidForBattle(&gEnemyParty[chosenMonId])
                    && chosenMonId != gBattlerPartyIndexes[battler1]
                    && chosenMonId != gBattlerPartyIndexes[battler2]
                    && (!(AI_THINKING_STRUCT->aiFlags[battler] & AI_FLAG_ACE_POKEMON)
                        || chosenMonId != CalculateEnemyPartyCount() - 1
                        || CountAIAliveNonEggMonsExcept(PARTY_SIZE) == pokemonInBattle))
                {
                    break;
                }
            }
        }
        *(gBattleStruct->monToSwitchIntoId + battler) = chosenMonId;
    }
    else
    {
        chosenMonId = *(gBattleStruct->AI_monToSwitchIntoId + battler);
        *(gBattleStruct->AI_monToSwitchIntoId + battler) = PARTY_SIZE;
        *(gBattleStruct->monToSwitchIntoId + battler) = chosenMonId;
    }
    BtlController_EmitChosenMonReturnValue(battler, BUFFER_B, chosenMonId, NULL);
    OpponentBufferExecCompleted(battler);
}

static u8 CountAIAliveNonEggMonsExcept(u8 slotToIgnore)
{
    u16 i, count;

    for (i = 0, count = 0; i < PARTY_SIZE; i++)
    {
        if (i != slotToIgnore
            && IsValidForBattle(&gEnemyParty[i]))
        {
            count++;
        }
    }

    return count;
}

static void OpponentHandleHealthBarUpdate(u32 battler)
{
    BtlController_HandleHealthBarUpdate(battler, FALSE);
}

static void OpponentHandleIntroTrainerBallThrow(u32 battler)
{
    BtlController_HandleIntroTrainerBallThrow(battler, 0, NULL, 0, Intro_TryShinyAnimShowHealthbox, StartAnimLinearTranslation);
}

static void OpponentHandleDrawPartyStatusSummary(u32 battler)
{
    BtlController_HandleDrawPartyStatusSummary(battler, B_SIDE_OPPONENT, TRUE);
}

static void OpponentHandleBattleAnimation(u32 battler)
{
    BtlController_HandleBattleAnimation(battler, FALSE);
}

static void OpponentHandleEndLinkBattle(u32 battler)
{
    if (gBattleTypeFlags & BATTLE_TYPE_LINK && !(gBattleTypeFlags & BATTLE_TYPE_IS_MASTER))
    {
        gMain.inBattle = FALSE;
        gMain.callback1 = gPreBattleCallback1;
        SetMainCallback2(gMain.savedCallback);
    }
    OpponentBufferExecCompleted(battler);
}
