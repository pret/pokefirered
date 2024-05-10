#include "global.h"
#include "gflib.h"
#include "data.h"
#include "m4a.h"
#include "task.h"
#include "util.h"
#include "pokeball.h"
#include "random.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_controllers.h"
#include "battle_message.h"
#include "battle_interface.h"
#include "battle_tower.h"
#include "battle_gfx_sfx_util.h"
#include "battle_ai_script_commands.h"
#include "battle_ai_switch_items.h"
#include "trainer_tower.h"
#include "constants/battle_anim.h"
#include "constants/moves.h"
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
static void OpponentHandleHitAnimation(u32 battler);
static void OpponentHandleCmd42(u32 battler);
static void OpponentHandlePlaySE(u32 battler);
static void OpponentHandlePlayFanfare(u32 battler);
static void OpponentHandleFaintingCry(u32 battler);
static void OpponentHandleIntroSlide(u32 battler);
static void OpponentHandleIntroTrainerBallThrow(u32 battler);
static void OpponentHandleDrawPartyStatusSummary(u32 battler);
static void OpponentHandleHidePartyStatusSummary(u32 battler);
static void OpponentHandleEndBounceEffect(u32 battler);
static void OpponentHandleSpriteInvisibility(u32 battler);
static void OpponentHandleBattleAnimation(u32 battler);
static void OpponentHandleLinkStandbyMsg(u32 battler);
static void OpponentHandleResetActionMoveSelection(u32 battler);
static void OpponentHandleCmd55(u32 battler);
static void OpponentCmdEnd(u32 battler);

static void OpponentBufferRunCommand(u32 battler);
static void SwitchIn_HandleSoundAndEnd(u32 battler);
static void Task_StartSendOutAnim(u8 taskId);
static void SpriteCB_FreeOpponentSprite(struct Sprite *sprite);
static void EndDrawPartyStatusSummary(u32 battler);

static void (*const sOpponentBufferCommands[CONTROLLER_CMDS_COUNT])(u32 battler) =
{
    [CONTROLLER_GETMONDATA]               = BtlController_HandleGetMonData,         // done
    [CONTROLLER_GETRAWMONDATA]            = BtlController_HandleGetRawMonData,      // done
    [CONTROLLER_SETMONDATA]               = BtlController_HandleSetMonData,         // done
    [CONTROLLER_SETRAWMONDATA]            = BtlController_HandleSetRawMonData,      // done
    [CONTROLLER_LOADMONSPRITE]            = OpponentHandleLoadMonSprite,            // done
    [CONTROLLER_SWITCHINANIM]             = OpponentHandleSwitchInAnim,             // done
    [CONTROLLER_RETURNMONTOBALL]          = BtlController_HandleReturnMonToBall,    // done
    [CONTROLLER_DRAWTRAINERPIC]           = OpponentHandleDrawTrainerPic,           // done
    [CONTROLLER_TRAINERSLIDE]             = OpponentHandleTrainerSlide,             // done
    [CONTROLLER_TRAINERSLIDEBACK]         = OpponentHandleTrainerSlideBack,         // done
    [CONTROLLER_FAINTANIMATION]           = BtlController_HandleFaintAnimation,     // done
    [CONTROLLER_PALETTEFADE]              = BtlController_Empty,                    // done
    [CONTROLLER_SUCCESSBALLTHROWANIM]     = BtlController_Empty,                    // done
    [CONTROLLER_BALLTHROWANIM]            = BtlController_Empty,                    // done
    [CONTROLLER_PAUSE]                    = BtlController_Empty,                    // done
    [CONTROLLER_MOVEANIMATION]            = BtlController_HandleMoveAnimation,      // done
    [CONTROLLER_PRINTSTRING]              = BtlController_HandlePrintString,        // done
    [CONTROLLER_PRINTSTRINGPLAYERONLY]    = BtlController_Empty,                    // done
    [CONTROLLER_CHOOSEACTION]             = OpponentHandleChooseAction,             // done
    [CONTROLLER_UNKNOWNYESNOBOX]          = BtlController_Empty,                    // done
    [CONTROLLER_CHOOSEMOVE]               = OpponentHandleChooseMove,               // done TODO: AI refactoring
    [CONTROLLER_OPENBAG]                  = OpponentHandleChooseItem,               // done
    [CONTROLLER_CHOOSEPOKEMON]            = OpponentHandleChoosePokemon,            // done TODO: AI refactoring
    [CONTROLLER_23]                       = BtlController_Empty,                    // done
    [CONTROLLER_HEALTHBARUPDATE]          = OpponentHandleHealthBarUpdate,          // done
    [CONTROLLER_EXPUPDATE]                = BtlController_Empty,                    // done
    [CONTROLLER_STATUSICONUPDATE]         = BtlController_HandleStatusIconUpdate,   // done
    [CONTROLLER_STATUSANIMATION]          = BtlController_HandleStatusAnimation,    // done
    [CONTROLLER_STATUSXOR]                = BtlController_Empty,                    // done
    [CONTROLLER_DATATRANSFER]             = BtlController_Empty,                    // done
    [CONTROLLER_DMA3TRANSFER]             = BtlController_Empty,                    // done
    [CONTROLLER_PLAYBGM]                  = BtlController_Empty,                    // done
    [CONTROLLER_32]                       = BtlController_Empty,                    // done
    [CONTROLLER_TWORETURNVALUES]          = BtlController_Empty,                    // done
    [CONTROLLER_CHOSENMONRETURNVALUE]     = BtlController_Empty,                    // done
    [CONTROLLER_ONERETURNVALUE]           = BtlController_Empty,                    // done
    [CONTROLLER_ONERETURNVALUE_DUPLICATE] = BtlController_Empty,                    // done
    [CONTROLLER_CLEARUNKVAR]              = BtlController_HandleClearUnkVar,        // done
    [CONTROLLER_SETUNKVAR]                = BtlController_HandleSetUnkVar,          // done
    [CONTROLLER_CLEARUNKFLAG]             = BtlController_HandleClearUnkFlag,       // done
    [CONTROLLER_TOGGLEUNKFLAG]            = BtlController_HandleToggleUnkFlag,      // done
    [CONTROLLER_HITANIMATION]             = OpponentHandleHitAnimation,
    [CONTROLLER_CANTSWITCH]               = OpponentHandleCmd42,
    [CONTROLLER_PLAYSE]                   = OpponentHandlePlaySE,
    [CONTROLLER_PLAYFANFAREORBGM]         = OpponentHandlePlayFanfare,
    [CONTROLLER_FAINTINGCRY]              = OpponentHandleFaintingCry,
    [CONTROLLER_INTROSLIDE]               = OpponentHandleIntroSlide,
    [CONTROLLER_INTROTRAINERBALLTHROW]    = OpponentHandleIntroTrainerBallThrow,
    [CONTROLLER_DRAWPARTYSTATUSSUMMARY]   = OpponentHandleDrawPartyStatusSummary,
    [CONTROLLER_HIDEPARTYSTATUSSUMMARY]   = OpponentHandleHidePartyStatusSummary,
    [CONTROLLER_ENDBOUNCE]                = OpponentHandleEndBounceEffect,
    [CONTROLLER_SPRITEINVISIBILITY]       = OpponentHandleSpriteInvisibility,
    [CONTROLLER_BATTLEANIMATION]          = OpponentHandleBattleAnimation,
    [CONTROLLER_LINKSTANDBYMSG]           = OpponentHandleLinkStandbyMsg,
    [CONTROLLER_RESETACTIONMOVESELECTION] = OpponentHandleResetActionMoveSelection,
    [CONTROLLER_ENDLINKBATTLE]            = OpponentHandleCmd55,
    [CONTROLLER_TERMINATOR_NOP]           = OpponentCmdEnd
};

static void OpponentDummy(u32 battler)
{
}

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

static void DoHitAnimBlinkSpriteEffect(u32 battler)
{
    u8 spriteId = gBattlerSpriteIds[battler];

    if (gSprites[spriteId].data[1] == 32)
    {
        gSprites[spriteId].data[1] = 0;
        gSprites[spriteId].invisible = FALSE;
        gDoingBattleAnim = FALSE;
        OpponentBufferExecCompleted(battler);
    }
    else
    {
        if ((gSprites[spriteId].data[1] % 4) == 0)
            gSprites[spriteId].invisible ^= 1;
        ++gSprites[spriteId].data[1];
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

static void CompleteOnFinishedBattleAnimation(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].animFromTableActive)
        OpponentBufferExecCompleted(battler);
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

    if (gBattleTypeFlags & (BATTLE_TYPE_TRAINER | BATTLE_TYPE_FIRST_BATTLE | BATTLE_TYPE_SAFARI | BATTLE_TYPE_ROAMER))
    {
        // TODO: update with AI refactoring
        BattleAI_SetupAIData(battler);
        chosenMoveId = BattleAI_ChooseMoveOrAction();

        switch (chosenMoveId)
        {
        case AI_CHOICE_WATCH:
            BtlController_EmitTwoReturnValues(battler, 1, B_ACTION_SAFARI_WATCH_CAREFULLY, 0);
            break;
        case AI_CHOICE_FLEE:
            BtlController_EmitTwoReturnValues(battler, 1, B_ACTION_RUN, 0);
            break;
        default:
            if (gMovesInfo[moveInfo->moves[chosenMoveId]].target & (MOVE_TARGET_USER_OR_SELECTED | MOVE_TARGET_USER))
                gBattlerTarget = battler;
            if (gMovesInfo[moveInfo->moves[chosenMoveId]].target & MOVE_TARGET_BOTH)
            {
                gBattlerTarget = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
                if (gAbsentBattlerFlags & gBitTable[gBattlerTarget])
                    gBattlerTarget = GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT);
            }
            BtlController_EmitTwoReturnValues(battler, 1, 10, (chosenMoveId) | (gBattlerTarget << 8));
            break;
        }
        OpponentBufferExecCompleted(battler);
    }
    else
    {
        u16 move;

        do
        {
            chosenMoveId = Random() & 3;
            move = moveInfo->moves[chosenMoveId];
        }
        while (move == MOVE_NONE);
        if (gMovesInfo[move].target & (MOVE_TARGET_USER_OR_SELECTED | MOVE_TARGET_USER))
            BtlController_EmitTwoReturnValues(battler, 1, 10, (chosenMoveId) | (battler << 8));
        else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
            BtlController_EmitTwoReturnValues(battler, 1, 10, (chosenMoveId) | (GetBattlerAtPosition(Random() & 2) << 8));
        else
            BtlController_EmitTwoReturnValues(battler, 1, 10, (chosenMoveId) | (GetBattlerAtPosition(B_POSITION_PLAYER_LEFT) << 8));

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

    if (*(gBattleStruct->AI_monToSwitchIntoId + (GetBattlerPosition(battler) >> 1)) == PARTY_SIZE)
    {
        chosenMonId = GetMostSuitableMonToSwitchInto(battler);

        if (chosenMonId == PARTY_SIZE)
        {
            s32 battler1, battler2;

            if (!(gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
            {
                battler2 = battler1 = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
            }
            else
            {
                battler1 = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
                battler2 = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
            }
            for (chosenMonId = 0; chosenMonId < PARTY_SIZE; ++chosenMonId)
                if (GetMonData(&gEnemyParty[chosenMonId], MON_DATA_HP) != 0
                 && chosenMonId != gBattlerPartyIndexes[battler1]
                 && chosenMonId != gBattlerPartyIndexes[battler2])
                    break;
        }
    }
    else
    {
        chosenMonId = *(gBattleStruct->AI_monToSwitchIntoId + (GetBattlerPosition(battler) >> 1));
        *(gBattleStruct->AI_monToSwitchIntoId + (GetBattlerPosition(battler) >> 1)) = PARTY_SIZE;
    }
    *(gBattleStruct->monToSwitchIntoId + battler) = chosenMonId;
    BtlController_EmitChosenMonReturnValue(battler, 1, chosenMonId, NULL);
    OpponentBufferExecCompleted(battler);
}

static void OpponentHandleHealthBarUpdate(u32 battler)
{
    BtlController_HandleHealthBarUpdate(battler, FALSE);
}

static void OpponentHandleHitAnimation(u32 battler)
{
    if (gSprites[gBattlerSpriteIds[battler]].invisible == TRUE)
    {
        OpponentBufferExecCompleted(battler);
    }
    else
    {
        gDoingBattleAnim = TRUE;
        gSprites[gBattlerSpriteIds[battler]].data[1] = 0;
        DoHitAnimHealthboxEffect(battler);
        gBattlerControllerFuncs[battler] = DoHitAnimBlinkSpriteEffect;
    }
}

static void OpponentHandleCmd42(u32 battler)
{
    OpponentBufferExecCompleted(battler);
}

static void OpponentHandlePlaySE(u32 battler)
{
    s8 pan;

    if (GetBattlerSide(battler) == B_SIDE_PLAYER)
        pan = SOUND_PAN_ATTACKER;
    else
        pan = SOUND_PAN_TARGET;
    PlaySE12WithPanning(gBattleResources->bufferA[battler][1] | (gBattleResources->bufferA[battler][2] << 8), pan);
    OpponentBufferExecCompleted(battler);
}

static void OpponentHandlePlayFanfare(u32 battler)
{
    PlayFanfare(gBattleResources->bufferA[battler][1] | (gBattleResources->bufferA[battler][2] << 8));
    OpponentBufferExecCompleted(battler);
}

static void OpponentHandleFaintingCry(u32 battler)
{
    u16 species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[battler]], MON_DATA_SPECIES);

    PlayCry_ByMode(species, 25, CRY_MODE_FAINT);
    OpponentBufferExecCompleted(battler);
}

static void OpponentHandleIntroSlide(u32 battler)
{
    HandleIntroSlide(gBattleResources->bufferA[battler][1]);
    gIntroSlideFlags |= 1;
    OpponentBufferExecCompleted(battler);
}

static void OpponentHandleIntroTrainerBallThrow(u32 battler)
{
    u8 paletteNum;
    u8 taskId;

    SetSpritePrimaryCoordsFromSecondaryCoords(&gSprites[gBattlerSpriteIds[battler]]);
    gSprites[gBattlerSpriteIds[battler]].data[0] = 35;
    gSprites[gBattlerSpriteIds[battler]].data[2] = 280;
    gSprites[gBattlerSpriteIds[battler]].data[4] = gSprites[gBattlerSpriteIds[battler]].y;
    gSprites[gBattlerSpriteIds[battler]].callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData6(&gSprites[gBattlerSpriteIds[battler]], SpriteCB_FreeOpponentSprite);
    taskId = CreateTask(Task_StartSendOutAnim, 5);
    gTasks[taskId].data[0] = battler;
    if (gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusSummaryShown)
        gTasks[gBattlerStatusSummaryTaskId[battler]].func = Task_HidePartyStatusSummary;
    gBattleSpritesDataPtr->animationData->introAnimActive = TRUE;
    gBattlerControllerFuncs[battler] = OpponentDummy;
}

static void SpriteCB_FreeOpponentSprite(struct Sprite *sprite)
{
    FreeTrainerFrontPicPaletteAndTile(sprite->oam.affineParam);
    sprite->oam.tileNum = sprite->data[5];
    FreeSpriteOamMatrix(sprite);
    DestroySprite(sprite);
}

static void Task_StartSendOutAnim(u8 taskId)
{
    u8 battler = gTasks[taskId].data[0];
    if (!IsDoubleBattle() || (gBattleTypeFlags & BATTLE_TYPE_MULTI))
    {
        gBattleResources->bufferA[battler][1] = gBattlerPartyIndexes[battler];
        StartSendOutAnim(battler, FALSE);
    }
    else
    {
        u8 battlerPartner = BATTLE_PARTNER(battler);
        gBattleResources->bufferA[battler][1] = gBattlerPartyIndexes[battler];
        StartSendOutAnim(battler, FALSE);

        gBattleResources->bufferA[battlerPartner][1] = gBattlerPartyIndexes[battlerPartner];
        StartSendOutAnim(battlerPartner, FALSE);
    }
    gBattlerControllerFuncs[battler] = Intro_TryShinyAnimShowHealthbox;
    DestroyTask(taskId);
}

static void OpponentHandleDrawPartyStatusSummary(u32 battler)
{
    if (gBattleResources->bufferA[battler][1] && GetBattlerSide(battler) == B_SIDE_PLAYER)
    {
        OpponentBufferExecCompleted(battler);
    }
    else
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusSummaryShown = TRUE;
        if (gBattleResources->bufferA[battler][2])
        {
            if (gBattleSpritesDataPtr->healthBoxesData[battler].opponentDrawPartyStatusSummaryDelay < 2)
            {
                ++gBattleSpritesDataPtr->healthBoxesData[battler].opponentDrawPartyStatusSummaryDelay;
                return;
            }
            else
            {
                gBattleSpritesDataPtr->healthBoxesData[battler].opponentDrawPartyStatusSummaryDelay = 0;
            }
        }
        gBattlerStatusSummaryTaskId[battler] = CreatePartyStatusSummarySprites(battler, 
                                                                                      (struct HpAndStatus *)&gBattleResources->bufferA[battler][4], 
                                                                                      gBattleResources->bufferA[battler][1], 
                                                                                      gBattleResources->bufferA[battler][2]);
        gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusDelayTimer = 0;
        if (gBattleResources->bufferA[battler][2])
            gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusDelayTimer = 0x5D;
        gBattlerControllerFuncs[battler] = EndDrawPartyStatusSummary;
    }
}

static void EndDrawPartyStatusSummary(u32 battler)
{
    if (gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusDelayTimer++ > 0x5C)
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusDelayTimer = 0;
        OpponentBufferExecCompleted(battler);
    }
}

static void OpponentHandleHidePartyStatusSummary(u32 battler)
{
    if (gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusSummaryShown)
        gTasks[gBattlerStatusSummaryTaskId[battler]].func = Task_HidePartyStatusSummary;
    OpponentBufferExecCompleted(battler);
}

static void OpponentHandleEndBounceEffect(u32 battler)
{
    OpponentBufferExecCompleted(battler);
}

static void OpponentHandleSpriteInvisibility(u32 battler)
{
    if (IsBattlerSpritePresent(battler))
    {
        gSprites[gBattlerSpriteIds[battler]].invisible = gBattleResources->bufferA[battler][1];
        CopyBattleSpriteInvisibility(battler);
    }
    OpponentBufferExecCompleted(battler);
}

static void OpponentHandleBattleAnimation(u32 battler)
{
    if (!IsBattleSEPlaying(battler))
    {
        u8 animationId = gBattleResources->bufferA[battler][1];
        u16 argument = gBattleResources->bufferA[battler][2] | (gBattleResources->bufferA[battler][3] << 8);

        if (TryHandleLaunchBattleTableAnimation(battler, battler, battler, animationId, argument))
            OpponentBufferExecCompleted(battler);
        else
            gBattlerControllerFuncs[battler] = CompleteOnFinishedBattleAnimation;
    }
}

static void OpponentHandleLinkStandbyMsg(u32 battler)
{
    OpponentBufferExecCompleted(battler);
}

static void OpponentHandleResetActionMoveSelection(u32 battler)
{
    OpponentBufferExecCompleted(battler);
}

static void OpponentHandleCmd55(u32 battler)
{
    if (gBattleTypeFlags & BATTLE_TYPE_LINK && !(gBattleTypeFlags & BATTLE_TYPE_IS_MASTER))
    {
        gMain.inBattle = 0;
        gMain.callback1 = gPreBattleCallback1;
        SetMainCallback2(gMain.savedCallback);
    }
    OpponentBufferExecCompleted(battler);
}

static void OpponentCmdEnd(u32 battler)
{
}
