#include "global.h"
#include "gflib.h"
#include "data.h"
#include "item.h"
#include "item_menu.h"
#include "link.h"
#include "m4a.h"
#include "party_menu.h"
#include "pokeball.h"
#include "strings.h"
#include "pokemon_special_anim.h"
#include "task.h"
#include "util.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_controllers.h"
#include "battle_interface.h"
#include "battle_message.h"
#include "battle_script_commands.h"
#include "reshow_battle_screen.h"
#include "constants/battle_anim.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/songs.h"
#include "constants/sound.h"

static void PlayerBufferExecCompleted(u32 battler);
static void PlayerHandleLoadMonSprite(u32 battler);
static void PlayerHandleSwitchInAnim(u32 battler);
static void PlayerHandleReturnMonToBall(u32 battler);
static void PlayerHandleDrawTrainerPic(u32 battler);
static void PlayerHandleTrainerSlide(u32 battler);
static void PlayerHandleTrainerSlideBack(u32 battler);
static void PlayerHandleFaintAnimation(u32 battler);
static void PlayerHandlePaletteFade(u32 battler);
static void PlayerHandleSuccessBallThrowAnim(u32 battler);
static void PlayerHandleBallThrowAnim(u32 battler);
static void PlayerHandlePause(u32 battler);
static void PlayerHandleMoveAnimation(u32 battler);
static void PlayerHandlePrintString(u32 battler);
static void PlayerHandlePrintSelectionString(u32 battler);
static void PlayerHandleChooseAction(u32 battler);
static void PlayerHandleUnknownYesNoBox(u32 battler);
static void PlayerHandleChooseMove(u32 battler);
static void PlayerHandleChooseItem(u32 battler);
static void PlayerHandleChoosePokemon(u32 battler);
static void PlayerHandleCmd23(u32 battler);
static void PlayerHandleHealthBarUpdate(u32 battler);
static void PlayerHandleExpUpdate(u32 battler);
static void PlayerHandleStatusIconUpdate(u32 battler);
static void PlayerHandleStatusAnimation(u32 battler);
static void PlayerHandleStatusXor(u32 battler);
static void PlayerHandleDataTransfer(u32 battler);
static void PlayerHandleDMA3Transfer(u32 battler);
static void PlayerHandlePlayBGM(u32 battler);
static void PlayerHandleCmd32(u32 battler);
static void PlayerHandleTwoReturnValues(u32 battler);
static void PlayerHandleChosenMonReturnValue(u32 battler);
static void PlayerHandleOneReturnValue(u32 battler);
static void PlayerHandleOneReturnValue_Duplicate(u32 battler);
static void PlayerHandleCmd37(u32 battler);
static void PlayerHandleCmd38(u32 battler);
static void PlayerHandleCmd39(u32 battler);
static void PlayerHandleCmd40(u32 battler);
static void PlayerHandleHitAnimation(u32 battler);
static void PlayerHandleCmd42(u32 battler);
static void PlayerHandlePlaySE(u32 battler);
static void PlayerHandlePlayFanfare(u32 battler);
static void PlayerHandleFaintingCry(u32 battler);
static void PlayerHandleIntroSlide(u32 battler);
static void PlayerHandleIntroTrainerBallThrow(u32 battler);
static void PlayerHandleDrawPartyStatusSummary(u32 battler);
static void PlayerHandleHidePartyStatusSummary(u32 battler);
static void PlayerHandleEndBounceEffect(u32 battler);
static void PlayerHandleSpriteInvisibility(u32 battler);
static void PlayerHandleBattleAnimation(u32 battler);
static void PlayerHandleLinkStandbyMsg(u32 battler);
static void PlayerHandleResetActionMoveSelection(u32 battler);
static void PlayerHandleCmd55(u32 battler);
static void PlayerCmdEnd(u32 battler);

static void PlayerBufferRunCommand(u32 battler);
static void HandleInputChooseTarget(u32 battler);
static void MoveSelectionDisplayPpNumber(u32 battler);
static void MoveSelectionDisplayPpString(void);
static void MoveSelectionDisplayMoveType(u32 battler);
static void MoveSelectionDisplayMoveNames(u32 battler);
static void HandleMoveSwitching(u32 battler);
static void WaitForMonSelection(u32 battler);
static void CompleteWhenChoseItem(u32 battler);
static void Task_LaunchLvlUpAnim(u8 taskId);
static void Task_PrepareToGiveExpWithExpBar(u8 taskId);
static void DestroyExpTaskAndCompleteOnInactiveTextPrinter(u8 taskId);
static void Task_UpdateLvlInHealthbox(u8 taskId);
static void PrintLinkStandbyMsg(void);
static void DoSwitchOutAnimation(u32 battler);
static void PlayerDoMoveAnimation(u32 battler);
static void Task_StartSendOutAnim(u8 taskId);
static void PreviewDeterminativeMoveTargets(u32 battler);
static void SwitchIn_HandleSoundAndEnd(u32 battler);
static void Task_GiveExpWithExpBar(u8 taskId);
static void Task_CreateLevelUpVerticalStripes(u8 taskId);
static void StartSendOutAnim(u32 battler, bool8 dontClearSubstituteBit);
static void EndDrawPartyStatusSummary(u32 battler);

static void ReloadMoveNames(u32 battler);

static void (*const sPlayerBufferCommands[CONTROLLER_CMDS_COUNT])(u32 battler) =
{
    [CONTROLLER_GETMONDATA]               = BtlController_HandleGetMonData,
    [CONTROLLER_GETRAWMONDATA]            = BtlController_HandleGetRawMonData,
    [CONTROLLER_SETMONDATA]               = BtlController_HandleSetMonData,
    [CONTROLLER_SETRAWMONDATA]            = BtlController_HandleSetRawMonData,
    [CONTROLLER_LOADMONSPRITE]            = PlayerHandleLoadMonSprite,
    [CONTROLLER_SWITCHINANIM]             = PlayerHandleSwitchInAnim,
    [CONTROLLER_RETURNMONTOBALL]          = PlayerHandleReturnMonToBall,
    [CONTROLLER_DRAWTRAINERPIC]           = PlayerHandleDrawTrainerPic,
    [CONTROLLER_TRAINERSLIDE]             = PlayerHandleTrainerSlide,
    [CONTROLLER_TRAINERSLIDEBACK]         = PlayerHandleTrainerSlideBack,
    [CONTROLLER_FAINTANIMATION]           = PlayerHandleFaintAnimation,
    [CONTROLLER_PALETTEFADE]              = PlayerHandlePaletteFade,
    [CONTROLLER_SUCCESSBALLTHROWANIM]     = PlayerHandleSuccessBallThrowAnim,
    [CONTROLLER_BALLTHROWANIM]            = PlayerHandleBallThrowAnim,
    [CONTROLLER_PAUSE]                    = PlayerHandlePause,
    [CONTROLLER_MOVEANIMATION]            = PlayerHandleMoveAnimation,
    [CONTROLLER_PRINTSTRING]              = PlayerHandlePrintString,
    [CONTROLLER_PRINTSTRINGPLAYERONLY]    = PlayerHandlePrintSelectionString,
    [CONTROLLER_CHOOSEACTION]             = PlayerHandleChooseAction,
    [CONTROLLER_UNKNOWNYESNOBOX]          = PlayerHandleUnknownYesNoBox,
    [CONTROLLER_CHOOSEMOVE]               = PlayerHandleChooseMove,
    [CONTROLLER_OPENBAG]                  = PlayerHandleChooseItem,
    [CONTROLLER_CHOOSEPOKEMON]            = PlayerHandleChoosePokemon,
    [CONTROLLER_23]                       = PlayerHandleCmd23,
    [CONTROLLER_HEALTHBARUPDATE]          = PlayerHandleHealthBarUpdate,
    [CONTROLLER_EXPUPDATE]                = PlayerHandleExpUpdate,
    [CONTROLLER_STATUSICONUPDATE]         = PlayerHandleStatusIconUpdate,
    [CONTROLLER_STATUSANIMATION]          = PlayerHandleStatusAnimation,
    [CONTROLLER_STATUSXOR]                = PlayerHandleStatusXor,
    [CONTROLLER_DATATRANSFER]             = PlayerHandleDataTransfer,
    [CONTROLLER_DMA3TRANSFER]             = PlayerHandleDMA3Transfer,
    [CONTROLLER_PLAYBGM]                  = PlayerHandlePlayBGM,
    [CONTROLLER_32]                       = PlayerHandleCmd32,
    [CONTROLLER_CHOSENMONRETURNVALUE]     = PlayerHandleChosenMonReturnValue,
    [CONTROLLER_TWORETURNVALUES]          = PlayerHandleTwoReturnValues,
    [CONTROLLER_ONERETURNVALUE]           = PlayerHandleOneReturnValue,
    [CONTROLLER_ONERETURNVALUE_DUPLICATE] = PlayerHandleOneReturnValue_Duplicate,
    [CONTROLLER_CLEARUNKVAR]              = PlayerHandleCmd37,
    [CONTROLLER_SETUNKVAR]                = PlayerHandleCmd38,
    [CONTROLLER_CLEARUNKFLAG]             = PlayerHandleCmd39,
    [CONTROLLER_TOGGLEUNKFLAG]            = PlayerHandleCmd40,
    [CONTROLLER_HITANIMATION]             = PlayerHandleHitAnimation,
    [CONTROLLER_CANTSWITCH]               = PlayerHandleCmd42,
    [CONTROLLER_PLAYSE]                   = PlayerHandlePlaySE,
    [CONTROLLER_PLAYFANFAREORBGM]         = PlayerHandlePlayFanfare,
    [CONTROLLER_FAINTINGCRY]              = PlayerHandleFaintingCry,
    [CONTROLLER_INTROSLIDE]               = PlayerHandleIntroSlide,
    [CONTROLLER_INTROTRAINERBALLTHROW]    = PlayerHandleIntroTrainerBallThrow,
    [CONTROLLER_DRAWPARTYSTATUSSUMMARY]   = PlayerHandleDrawPartyStatusSummary,
    [CONTROLLER_HIDEPARTYSTATUSSUMMARY]   = PlayerHandleHidePartyStatusSummary,
    [CONTROLLER_ENDBOUNCE]                = PlayerHandleEndBounceEffect,
    [CONTROLLER_SPRITEINVISIBILITY]       = PlayerHandleSpriteInvisibility,
    [CONTROLLER_BATTLEANIMATION]          = PlayerHandleBattleAnimation,
    [CONTROLLER_LINKSTANDBYMSG]           = PlayerHandleLinkStandbyMsg,
    [CONTROLLER_RESETACTIONMOVESELECTION] = PlayerHandleResetActionMoveSelection,
    [CONTROLLER_ENDLINKBATTLE]            = PlayerHandleCmd55,
    [CONTROLLER_TERMINATOR_NOP]           = PlayerCmdEnd,
};

void SetControllerToPlayer(u32 battler)
{
    gBattlerControllerEndFuncs[battler] = PlayerBufferExecCompleted;
    gBattlerControllerFuncs[battler] = PlayerBufferRunCommand;
    gDoingBattleAnim = FALSE;
    gPlayerDpadHoldFrames = 0;
}

static void PlayerBufferExecCompleted(u32 battler)
{
    gBattlerControllerFuncs[battler] = PlayerBufferRunCommand;
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        u8 playerId = GetMultiplayerId();

        PrepareBufferDataTransferLink(battler, 2, 4, &playerId);
        gBattleBufferA[battler][0] = CONTROLLER_TERMINATOR_NOP;
    }
    else
    {
        gBattleControllerExecFlags &= ~gBitTable[battler];
    }
}

static void PlayerBufferRunCommand(u32 battler)
{
    if (gBattleControllerExecFlags & gBitTable[battler])
    {
        if (gBattleBufferA[battler][0] < NELEMS(sPlayerBufferCommands))
            sPlayerBufferCommands[gBattleBufferA[battler][0]](battler);
        else
            PlayerBufferExecCompleted(battler);
    }
}

static void CompleteOnBattlerSpritePosX_0(u32 battler)
{
    if (gSprites[gBattlerSpriteIds[battler]].x2 == 0)
        PlayerBufferExecCompleted(battler);
}

static void HandleInputChooseAction(u32 battler)
{
    u16 itemId = gBattleBufferA[battler][2] | (gBattleBufferA[battler][3] << 8);

    DoBounceEffect(battler, BOUNCE_HEALTHBOX, 7, 1);
    DoBounceEffect(battler, BOUNCE_MON, 7, 1);
    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);

        switch (gActionSelectionCursor[battler])
        {
        case 0:
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, B_ACTION_USE_MOVE, 0);
            break;
        case 1:
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, B_ACTION_USE_ITEM, 0);
            break;
        case 2:
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, B_ACTION_SWITCH, 0);
            break;
        case 3:
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, B_ACTION_RUN, 0);
            break;
        }
        PlayerBufferExecCompleted(battler);
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
            if (gBattleBufferA[battler][1] == B_ACTION_USE_ITEM)
            {
                // Return item to bag if partner had selected one.
                AddBagItem(itemId, 1);
            }
            PlaySE(SE_SELECT);
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, B_ACTION_CANCEL_PARTNER, 0);
            PlayerBufferExecCompleted(battler);
        }
    }
    else if (JOY_NEW(START_BUTTON))
    {
        SwapHpBarsWithHpText();
    }
}

// Unused
static void EndBounceEffect2(u32 battler)
{
    EndBounceEffect(battler, BOUNCE_HEALTHBOX);
    EndBounceEffect(battler, BOUNCE_MON);
    gBattlerControllerFuncs[battler] = HandleInputChooseTarget;
}

static void HandleInputChooseTarget(u32 battler)
{
    s32 i;
    static const u8 identities[MAX_BATTLERS_COUNT] = {B_POSITION_PLAYER_LEFT, B_POSITION_PLAYER_RIGHT, B_POSITION_OPPONENT_RIGHT, B_POSITION_OPPONENT_LEFT};
    u16 move = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_MOVE1 + gMoveSelectionCursor[battler]);
    u16 moveTarget = GetBattlerMoveTargetType(battler, move);

    DoBounceEffect(gMultiUsePlayerCursor, BOUNCE_HEALTHBOX, 15, 1);
    for (i = 0; i < gBattlersCount; i++)
    {
        if (i != gMultiUsePlayerCursor)
            EndBounceEffect(i, BOUNCE_HEALTHBOX);
    }

    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        gSprites[gBattlerSpriteIds[gMultiUsePlayerCursor]].callback = SpriteCB_HideAsMoveTarget;
        if (gBattleStruct->mega.playerSelect)
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, gMoveSelectionCursor[battler] | RET_MEGA_EVOLUTION | (gMultiUsePlayerCursor << 8));
        else if (gBattleStruct->burst.playerSelect)
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, gMoveSelectionCursor[battler] | RET_ULTRA_BURST | (gMultiUsePlayerCursor << 8));
        else if (gBattleStruct->dynamax.playerSelect)
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, gMoveSelectionCursor[battler] | RET_DYNAMAX | (gMultiUsePlayerCursor << 8));
        else
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, gMoveSelectionCursor[battler] | (gMultiUsePlayerCursor << 8));
        EndBounceEffect(gMultiUsePlayerCursor, BOUNCE_HEALTHBOX);
        HideTriggerSprites();
        PlayerBufferExecCompleted(battler);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        gSprites[gBattlerSpriteIds[gMultiUsePlayerCursor]].callback = SpriteCB_HideAsMoveTarget;
        gBattlerControllerFuncs[battler] = HandleInputChooseMove;
        DoBounceEffect(battler, BOUNCE_HEALTHBOX, 7, 1);
        DoBounceEffect(battler, BOUNCE_MON, 7, 1);
        EndBounceEffect(gMultiUsePlayerCursor, BOUNCE_HEALTHBOX);
    }
    else if (JOY_NEW(DPAD_LEFT | DPAD_UP))
    {
        PlaySE(SE_SELECT);
        gSprites[gBattlerSpriteIds[gMultiUsePlayerCursor]].callback = SpriteCB_HideAsMoveTarget;

        if (moveTarget == (MOVE_TARGET_USER | MOVE_TARGET_ALLY))
        {
            gMultiUsePlayerCursor ^= BIT_FLANK;
        }
        else
        {
            do
            {
                u8 currSelIdentity = GetBattlerPosition(gMultiUsePlayerCursor);

                for (i = 0; i < MAX_BATTLERS_COUNT; i++)
                {
                    if (currSelIdentity == identities[i])
                        break;
                }
                do
                {
                    if (--i < 0)
                        i = MAX_BATTLERS_COUNT - 1;
                    gMultiUsePlayerCursor = GetBattlerAtPosition(identities[i]);
                } while (gMultiUsePlayerCursor == gBattlersCount);

                i = 0;
                switch (GetBattlerPosition(gMultiUsePlayerCursor))
                {
                case B_POSITION_PLAYER_LEFT:
                case B_POSITION_PLAYER_RIGHT:
                    if (battler != gMultiUsePlayerCursor)
                        i++;
                    else if (moveTarget & MOVE_TARGET_USER_OR_SELECTED)
                        i++;
                    break;
                case B_POSITION_OPPONENT_LEFT:
                case B_POSITION_OPPONENT_RIGHT:
                    i++;
                    break;
                }

                if (gAbsentBattlerFlags & gBitTable[gMultiUsePlayerCursor]
                 || !CanTargetBattler(battler, gMultiUsePlayerCursor, move))
                    i = 0;
            } while (i == 0);
        }
        gSprites[gBattlerSpriteIds[gMultiUsePlayerCursor]].callback = SpriteCB_ShowAsMoveTarget;
    }
    else if (JOY_NEW(DPAD_RIGHT | DPAD_DOWN))
    {
        PlaySE(SE_SELECT);
        gSprites[gBattlerSpriteIds[gMultiUsePlayerCursor]].callback = SpriteCB_HideAsMoveTarget;

        if (moveTarget == (MOVE_TARGET_USER | MOVE_TARGET_ALLY))
        {
            gMultiUsePlayerCursor ^= BIT_FLANK;
        }
        else
        {
            do
            {
                u8 currSelIdentity = GetBattlerPosition(gMultiUsePlayerCursor);

                for (i = 0; i < MAX_BATTLERS_COUNT; i++)
                {
                    if (currSelIdentity == identities[i])
                        break;
                }
                do
                {
                    if (++i > 3)
                        i = 0;
                    gMultiUsePlayerCursor = GetBattlerAtPosition(identities[i]);
                } while (gMultiUsePlayerCursor == gBattlersCount);

                i = 0;
                switch (GetBattlerPosition(gMultiUsePlayerCursor))
                {
                case B_POSITION_PLAYER_LEFT:
                case B_POSITION_PLAYER_RIGHT:
                    if (battler != gMultiUsePlayerCursor)
                        i++;
                    else if (moveTarget & MOVE_TARGET_USER_OR_SELECTED)
                        i++;
                    break;
                case B_POSITION_OPPONENT_LEFT:
                case B_POSITION_OPPONENT_RIGHT:
                    i++;
                    break;
                }

                if (gAbsentBattlerFlags & gBitTable[gMultiUsePlayerCursor]
                 || !CanTargetBattler(battler, gMultiUsePlayerCursor, move))
                    i = 0;
            } while (i == 0);
        }

        gSprites[gBattlerSpriteIds[gMultiUsePlayerCursor]].callback = SpriteCB_ShowAsMoveTarget;
    }
}

static void HideAllTargets(void)
{
    s32 i;
    for (i = 0; i < MAX_BATTLERS_COUNT; i++)
    {
        if (IsBattlerAlive(i) && gBattleSpritesDataPtr->healthBoxesData[i].healthboxIsBouncing)
        {
            gSprites[gBattlerSpriteIds[i]].callback = SpriteCB_HideAsMoveTarget;
            EndBounceEffect(i, BOUNCE_HEALTHBOX);
        }
    }
}

static void HideShownTargets(u32 battler)
{
    s32 i;
    for (i = 0; i < MAX_BATTLERS_COUNT; i++)
    {
        if (IsBattlerAlive(i) && gBattleSpritesDataPtr->healthBoxesData[i].healthboxIsBouncing && i != battler)
        {
            gSprites[gBattlerSpriteIds[i]].callback = SpriteCB_HideAsMoveTarget;
            EndBounceEffect(i, BOUNCE_HEALTHBOX);
        }
    }
}

static void HandleInputShowEntireFieldTargets(u32 battler)
{
    if (JOY_HELD(DPAD_ANY) && gSaveBlock2Ptr->optionsButtonMode == OPTIONS_BUTTON_MODE_L_EQUALS_A)
        gPlayerDpadHoldFrames++;
    else
        gPlayerDpadHoldFrames = 0;

    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        HideAllTargets();
        if (gBattleStruct->mega.playerSelect)
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, gMoveSelectionCursor[battler] | RET_MEGA_EVOLUTION | (gMultiUsePlayerCursor << 8));
        else if (gBattleStruct->burst.playerSelect)
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, gMoveSelectionCursor[battler] | RET_ULTRA_BURST | (gMultiUsePlayerCursor << 8));
        else if (gBattleStruct->dynamax.playerSelect)
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, gMoveSelectionCursor[battler] | RET_DYNAMAX | (gMultiUsePlayerCursor << 8));
        else
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, gMoveSelectionCursor[battler] | (gMultiUsePlayerCursor << 8));
        HideTriggerSprites();
        PlayerBufferExecCompleted(battler);
    }
    else if (JOY_NEW(B_BUTTON) || gPlayerDpadHoldFrames > 59)
    {
        PlaySE(SE_SELECT);
        HideAllTargets();
        gBattlerControllerFuncs[battler] = HandleInputChooseMove;
        DoBounceEffect(battler, BOUNCE_HEALTHBOX, 7, 1);
        DoBounceEffect(battler, BOUNCE_MON, 7, 1);
    }
}

static void HandleInputShowTargets(u32 battler)
{
    if (JOY_HELD(DPAD_ANY) && gSaveBlock2Ptr->optionsButtonMode == OPTIONS_BUTTON_MODE_L_EQUALS_A)
        gPlayerDpadHoldFrames++;
    else
        gPlayerDpadHoldFrames = 0;

    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        HideShownTargets(battler);
        if (gBattleStruct->mega.playerSelect)
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, gMoveSelectionCursor[battler] | RET_MEGA_EVOLUTION | (gMultiUsePlayerCursor << 8));
        else if (gBattleStruct->burst.playerSelect)
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, gMoveSelectionCursor[battler] | RET_ULTRA_BURST | (gMultiUsePlayerCursor << 8));
        else if (gBattleStruct->dynamax.playerSelect)
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, gMoveSelectionCursor[battler] | RET_DYNAMAX | (gMultiUsePlayerCursor << 8));
        else
            BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, gMoveSelectionCursor[battler] | (gMultiUsePlayerCursor << 8));
        HideTriggerSprites();
        // TryHideLastUsedBall();
        PlayerBufferExecCompleted(battler);
    }
    else if (JOY_NEW(B_BUTTON) || gPlayerDpadHoldFrames > 59)
    {
        PlaySE(SE_SELECT);
        HideShownTargets(battler);
        gBattlerControllerFuncs[battler] = HandleInputChooseMove;
        DoBounceEffect(battler, BOUNCE_HEALTHBOX, 7, 1);
        DoBounceEffect(battler, BOUNCE_MON, 7, 1);
    }
}

static void TryShowAsTarget(u32 battler)
{
    if (IsBattlerAlive(battler))
    {
        DoBounceEffect(battler, BOUNCE_HEALTHBOX, 15, 1);
        gSprites[gBattlerSpriteIds[battler]].callback = SpriteCB_ShowAsMoveTarget;
    }
}

void HandleInputChooseMove(u32 battler)
{
    u16 moveTarget;
    u32 canSelectTarget = 0;
    struct ChooseMoveStruct *moveInfo = (struct ChooseMoveStruct *)(&gBattleBufferA[battler][4]);

    // PreviewDeterminativeMoveTargets(battler);
    if (JOY_NEW(A_BUTTON))
    {

        PlaySE(SE_SELECT);
        if (moveInfo->moves[gMoveSelectionCursor[battler]] == MOVE_CURSE)
        {
            if (moveInfo->monType1 != TYPE_GHOST && moveInfo->monType2 != TYPE_GHOST && moveInfo->monType3 != TYPE_GHOST)
                moveTarget = MOVE_TARGET_USER;
            else
                moveTarget = MOVE_TARGET_SELECTED;
        }
        else
        {
            moveTarget = GetBattlerMoveTargetType(battler, moveInfo->moves[gMoveSelectionCursor[battler]]);
        }

        // TODO: Z-Moves
        // if (gBattleStruct->zmove.viewing)
        // {
        //     u16 chosenMove = moveInfo->moves[gMoveSelectionCursor[battler]];

        //     QueueZMove(battler, chosenMove);
        //     gBattleStruct->zmove.viewing = FALSE;
        //     if (gMovesInfo[moveInfo->moves[gMoveSelectionCursor[battler]]].category != DAMAGE_CATEGORY_STATUS)
        //         moveTarget = MOVE_TARGET_SELECTED;  //damaging z moves always have selected target
        // }

        // Status moves turn into Max Guard when Dynamaxed, targets user.
        if ((IsDynamaxed(battler) || gBattleStruct->dynamax.playerSelect))
            moveTarget = gMovesInfo[GetMaxMove(battler, moveInfo->moves[gMoveSelectionCursor[battler]])].target;

        if (moveTarget & MOVE_TARGET_USER)
            gMultiUsePlayerCursor = battler;
        else
            gMultiUsePlayerCursor = GetBattlerAtPosition(BATTLE_OPPOSITE(GetBattlerSide(battler)));

        if (!gBattleBufferA[battler][1]) // not a double battle
        {
            if (moveTarget & MOVE_TARGET_USER_OR_SELECTED && !gBattleBufferA[battler][2])
                canSelectTarget = 1;
        }
        else // double battle
        {
            if (!(moveTarget & (MOVE_TARGET_RANDOM | MOVE_TARGET_BOTH | MOVE_TARGET_DEPENDS | MOVE_TARGET_FOES_AND_ALLY | MOVE_TARGET_OPPONENTS_FIELD | MOVE_TARGET_USER | MOVE_TARGET_ALLY)))
                canSelectTarget = 1; // either selected or user
            if (moveTarget == (MOVE_TARGET_USER | MOVE_TARGET_ALLY) && IsBattlerAlive(BATTLE_PARTNER(battler)))
                canSelectTarget = 1;

            if (moveInfo->currentPp[gMoveSelectionCursor[battler]] == 0)
            {
                canSelectTarget = 0;
            }
            else if (!(moveTarget & (MOVE_TARGET_USER | MOVE_TARGET_USER_OR_SELECTED)) && CountAliveMonsInBattle(BATTLE_ALIVE_EXCEPT_BATTLER, battler) <= 1)
            {
                gMultiUsePlayerCursor = GetDefaultMoveTarget(battler);
                canSelectTarget = 0;
            }

            if (B_SHOW_TARGETS == TRUE)
            {
                // Show all available targets for multi-target moves
                if ((moveTarget & MOVE_TARGET_ALL_BATTLERS) == MOVE_TARGET_ALL_BATTLERS)
                {
                    u32 i = 0;
                    for (i = 0; i < gBattlersCount; i++)
                        TryShowAsTarget(i);

                    canSelectTarget = 3;
                }
                else if (moveTarget & (MOVE_TARGET_OPPONENTS_FIELD | MOVE_TARGET_BOTH | MOVE_TARGET_FOES_AND_ALLY))
                {
                    TryShowAsTarget(gMultiUsePlayerCursor);
                    TryShowAsTarget(BATTLE_PARTNER(gMultiUsePlayerCursor));
                    if (moveTarget & MOVE_TARGET_FOES_AND_ALLY)
                        TryShowAsTarget(BATTLE_PARTNER(battler));
                    canSelectTarget = 2;
                }
            }
        }

        switch(canSelectTarget)
        {
        case 0:
        default:
            if (gBattleStruct->mega.playerSelect)
                BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, gMoveSelectionCursor[battler] | RET_MEGA_EVOLUTION | (gMultiUsePlayerCursor << 8));
            else if (gBattleStruct->burst.playerSelect)
                BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, gMoveSelectionCursor[battler] | RET_ULTRA_BURST | (gMultiUsePlayerCursor << 8));
            else if (gBattleStruct->dynamax.playerSelect)
                BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, gMoveSelectionCursor[battler] | RET_DYNAMAX | (gMultiUsePlayerCursor << 8));
            else
                BtlController_EmitTwoReturnValues(battler, BUFFER_B, 10, gMoveSelectionCursor[battler] | (gMultiUsePlayerCursor << 8));
            HideTriggerSprites();
            PlayerBufferExecCompleted(battler);
            break;
        case 1:
            gBattlerControllerFuncs[battler] = HandleInputChooseTarget;

            if (moveTarget & (MOVE_TARGET_USER | MOVE_TARGET_USER_OR_SELECTED))
                gMultiUsePlayerCursor = battler;
            else if (gAbsentBattlerFlags & gBitTable[GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT)])
                gMultiUsePlayerCursor = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
            else
                gMultiUsePlayerCursor = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);

            gSprites[gBattlerSpriteIds[gMultiUsePlayerCursor]].callback = SpriteCB_ShowAsMoveTarget;
            break;
        case 2:
            gBattlerControllerFuncs[battler] = HandleInputShowTargets;
            break;
        case 3: // Entire field
            gBattlerControllerFuncs[battler] = HandleInputShowEntireFieldTargets;
            break;
        }
    }
    else if (JOY_NEW(B_BUTTON) || gPlayerDpadHoldFrames > 59)
    {
        PlaySE(SE_SELECT);
        if (gBattleStruct->zmove.viewing)
        {
            ReloadMoveNames(battler);
        }
        else
        {
            gBattleStruct->mega.playerSelect = FALSE;
            gBattleStruct->burst.playerSelect = FALSE;
            gBattleStruct->dynamax.playerSelect = FALSE;
            gBattleStruct->zmove.viable = FALSE;
            BtlController_EmitTwoReturnValues(battler, 1, 10, 0xFFFF);
            HideTriggerSprites();
            PlayerBufferExecCompleted(battler);
            ResetPaletteFadeControl();
            BeginNormalPaletteFade(0xF0000, 0, 0, 0, RGB_WHITE);
        }
    }
    else if (JOY_NEW(DPAD_LEFT))
    {
        if (gMoveSelectionCursor[battler] & 1)
        {
            MoveSelectionDestroyCursorAt(gMoveSelectionCursor[battler]);
            gMoveSelectionCursor[battler] ^= 1;
            PlaySE(SE_SELECT);
            MoveSelectionCreateCursorAt(gMoveSelectionCursor[battler], 0);
            MoveSelectionDisplayPpNumber(battler);
            MoveSelectionDisplayMoveType(battler);
            BeginNormalPaletteFade(0xF0000, 0, 0, 0, RGB_WHITE);
        }
    }
    else if (JOY_NEW(DPAD_RIGHT))
    {
        if (!(gMoveSelectionCursor[battler] & 1)
         && (gMoveSelectionCursor[battler] ^ 1) < gNumberOfMovesToChoose)
        {
            MoveSelectionDestroyCursorAt(gMoveSelectionCursor[battler]);
            gMoveSelectionCursor[battler] ^= 1;
            PlaySE(SE_SELECT);
            MoveSelectionCreateCursorAt(gMoveSelectionCursor[battler], 0);
            MoveSelectionDisplayPpNumber(battler);
            MoveSelectionDisplayMoveType(battler);
            BeginNormalPaletteFade(0xF0000, 0, 0, 0, RGB_WHITE);
        }
    }
    else if (JOY_NEW(DPAD_UP))
    {
        if (gMoveSelectionCursor[battler] & 2)
        {
            MoveSelectionDestroyCursorAt(gMoveSelectionCursor[battler]);
            gMoveSelectionCursor[battler] ^= 2;
            PlaySE(SE_SELECT);
            MoveSelectionCreateCursorAt(gMoveSelectionCursor[battler], 0);
            MoveSelectionDisplayPpNumber(battler);
            MoveSelectionDisplayMoveType(battler);
            BeginNormalPaletteFade(0xF0000, 0, 0, 0, RGB_WHITE);
        }
    }
    else if (JOY_NEW(DPAD_DOWN))
    {
        if (!(gMoveSelectionCursor[battler] & 2)
         && (gMoveSelectionCursor[battler] ^ 2) < gNumberOfMovesToChoose)
        {
            MoveSelectionDestroyCursorAt(gMoveSelectionCursor[battler]);
            gMoveSelectionCursor[battler] ^= 2;
            PlaySE(SE_SELECT);
            MoveSelectionCreateCursorAt(gMoveSelectionCursor[battler], 0);
            MoveSelectionDisplayPpNumber(battler);
            MoveSelectionDisplayMoveType(battler);
            BeginNormalPaletteFade(0xF0000, 0, 0, 0, RGB_WHITE);
        }
    }
    else if (JOY_NEW(SELECT_BUTTON))
    {
        if (gNumberOfMovesToChoose > 1 && !(gBattleTypeFlags & BATTLE_TYPE_LINK))
        {
            MoveSelectionCreateCursorAt(gMoveSelectionCursor[battler], 29);
            if (gMoveSelectionCursor[battler] != 0)
                gMultiUsePlayerCursor = 0;
            else
                gMultiUsePlayerCursor = gMoveSelectionCursor[battler] + 1;
            MoveSelectionCreateCursorAt(gMultiUsePlayerCursor, 27);
            BattlePutTextOnWindow(gText_BattleSwitchWhich, B_WIN_SWITCH_PROMPT);
            gBattlerControllerFuncs[battler] = HandleMoveSwitching;
        }
    }
    else if (JOY_NEW(START_BUTTON))
    {
        DebugPrintfLevel(MGBA_LOG_ERROR, "start");
        if (CanMegaEvolve(battler))
        {
            DebugPrintfLevel(MGBA_LOG_ERROR, "canmegaevolve");
            gBattleStruct->mega.playerSelect ^= 1;
            ChangeMegaTriggerSprite(gBattleStruct->mega.triggerSpriteId, gBattleStruct->mega.playerSelect);
            PlaySE(SE_SELECT);
        }
        else if (CanUltraBurst(battler))
        {
            gBattleStruct->burst.playerSelect ^= 1;
            ChangeBurstTriggerSprite(gBattleStruct->burst.triggerSpriteId, gBattleStruct->burst.playerSelect);
            PlaySE(SE_SELECT);
        }/* 
        else if (gBattleStruct->zmove.viable)
        {
            // show z move name / info
            //TODO: brighten z move symbol
            PlaySE(SE_SELECT);
            if (!gBattleStruct->zmove.viewing)
                MoveSelectionDisplayZMove(gBattleStruct->zmove.chosenZMove, battler);
            else
                ReloadMoveNames(battler);
        } */
        else if (CanDynamax(battler))
        {
            gBattleStruct->dynamax.playerSelect ^= 1;
            MoveSelectionDisplayMoveNames(battler);
            MoveSelectionCreateCursorAt(gMoveSelectionCursor[battler], 0);
            ChangeDynamaxTriggerSprite(gBattleStruct->dynamax.triggerSpriteId, gBattleStruct->dynamax.playerSelect);
            PlaySE(SE_SELECT);
        }
    }
}

static void ReloadMoveNames(u32 battler)
{
    gBattleStruct->mega.playerSelect = FALSE;
    gBattleStruct->burst.playerSelect = FALSE;
    gBattleStruct->dynamax.playerSelect = FALSE;
    gBattleStruct->zmove.viewing = FALSE;
    MoveSelectionDestroyCursorAt(battler);
    MoveSelectionDisplayMoveNames(battler);
    MoveSelectionCreateCursorAt(gMoveSelectionCursor[battler], 0);
    MoveSelectionDisplayPpNumber(battler);
    MoveSelectionDisplayMoveType(battler);
}

static void HandleMoveSwitching(u32 battler)
{
    u8 perMovePPBonuses[4];
    struct ChooseMoveStruct moveStruct;
    u8 totalPPBonuses;

    if (JOY_NEW(A_BUTTON | SELECT_BUTTON))
    {
        PlaySE(SE_SELECT);

        if (gMoveSelectionCursor[battler] != gMultiUsePlayerCursor)
        {
            struct ChooseMoveStruct *moveInfo = (struct ChooseMoveStruct *)(&gBattleBufferA[battler][4]);
            s32 i;

            // swap moves and pp
            i = moveInfo->moves[gMoveSelectionCursor[battler]];
            moveInfo->moves[gMoveSelectionCursor[battler]] = moveInfo->moves[gMultiUsePlayerCursor];
            moveInfo->moves[gMultiUsePlayerCursor] = i;
            i = moveInfo->currentPp[gMoveSelectionCursor[battler]];
            moveInfo->currentPp[gMoveSelectionCursor[battler]] = moveInfo->currentPp[gMultiUsePlayerCursor];
            moveInfo->currentPp[gMultiUsePlayerCursor] = i;
            i = moveInfo->maxPp[gMoveSelectionCursor[battler]];
            moveInfo->maxPp[gMoveSelectionCursor[battler]] = moveInfo->maxPp[gMultiUsePlayerCursor];
            moveInfo->maxPp[gMultiUsePlayerCursor] = i;
            if (gDisableStructs[battler].mimickedMoves & gBitTable[gMoveSelectionCursor[battler]])
            {
                gDisableStructs[battler].mimickedMoves &= (~gBitTable[gMoveSelectionCursor[battler]]);
                gDisableStructs[battler].mimickedMoves |= gBitTable[gMultiUsePlayerCursor];
            }
            MoveSelectionDisplayMoveNames(battler);
            for (i = 0; i < MAX_MON_MOVES; ++i)
                perMovePPBonuses[i] = (gBattleMons[battler].ppBonuses & (3 << (i * 2))) >> (i * 2);
            totalPPBonuses = perMovePPBonuses[gMoveSelectionCursor[battler]];
            perMovePPBonuses[gMoveSelectionCursor[battler]] = perMovePPBonuses[gMultiUsePlayerCursor];
            perMovePPBonuses[gMultiUsePlayerCursor] = totalPPBonuses;
            totalPPBonuses = 0;
            for (i = 0; i < MAX_MON_MOVES; ++i)
                totalPPBonuses |= perMovePPBonuses[i] << (i * 2);

            gBattleMons[battler].ppBonuses = totalPPBonuses;
            for (i = 0; i < MAX_MON_MOVES; ++i)
            {
                gBattleMons[battler].moves[i] = moveInfo->moves[i];
                gBattleMons[battler].pp[i] = moveInfo->currentPp[i];
            }
            if (!(gBattleMons[battler].status2 & STATUS2_TRANSFORMED))
            {
                for (i = 0; i < MAX_MON_MOVES; ++i)
                {
                    moveStruct.moves[i] = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_MOVE1 + i);
                    moveStruct.currentPp[i] = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_PP1 + i);
                }

                totalPPBonuses = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_PP_BONUSES);
                for (i = 0; i < MAX_MON_MOVES; ++i)
                    perMovePPBonuses[i] = (totalPPBonuses & (3 << (i * 2))) >> (i * 2);
                i = moveStruct.moves[gMoveSelectionCursor[battler]];
                moveStruct.moves[gMoveSelectionCursor[battler]] = moveStruct.moves[gMultiUsePlayerCursor];
                moveStruct.moves[gMultiUsePlayerCursor] = i;
                i = moveStruct.currentPp[gMoveSelectionCursor[battler]];
                moveStruct.currentPp[gMoveSelectionCursor[battler]] = moveStruct.currentPp[gMultiUsePlayerCursor];
                moveStruct.currentPp[gMultiUsePlayerCursor] = i;
                totalPPBonuses = perMovePPBonuses[gMoveSelectionCursor[battler]];
                perMovePPBonuses[gMoveSelectionCursor[battler]] = perMovePPBonuses[gMultiUsePlayerCursor];
                perMovePPBonuses[gMultiUsePlayerCursor] = totalPPBonuses;
                totalPPBonuses = 0;
                for (i = 0; i < MAX_MON_MOVES; ++i)
                    totalPPBonuses |= perMovePPBonuses[i] << (i * 2);
                for (i = 0; i < MAX_MON_MOVES; ++i)
                {
                    SetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_MOVE1 + i, &moveStruct.moves[i]);
                    SetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_PP1 + i, &moveStruct.currentPp[i]);
                }
                SetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_PP_BONUSES, &totalPPBonuses);
            }
        }
        if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
            gBattlerControllerFuncs[battler] = OakOldManHandleInputChooseMove;
        else
            gBattlerControllerFuncs[battler] = HandleInputChooseMove;
        gMoveSelectionCursor[battler] = gMultiUsePlayerCursor;
        MoveSelectionCreateCursorAt(gMoveSelectionCursor[battler], 0);
        MoveSelectionDisplayPpString();
        MoveSelectionDisplayPpNumber(battler);
        MoveSelectionDisplayMoveType(battler);
    }
    if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        MoveSelectionDestroyCursorAt(gMultiUsePlayerCursor);
        MoveSelectionCreateCursorAt(gMoveSelectionCursor[battler], 0);
        if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
            gBattlerControllerFuncs[battler] = OakOldManHandleInputChooseMove;
        else
            gBattlerControllerFuncs[battler] = HandleInputChooseMove;
        MoveSelectionDisplayPpString();
        MoveSelectionDisplayPpNumber(battler);
        MoveSelectionDisplayMoveType(battler);
    }
    if (JOY_NEW(DPAD_LEFT))
    {
        if (gMultiUsePlayerCursor & 1)
        {
            if (gMultiUsePlayerCursor == gMoveSelectionCursor[battler])
                MoveSelectionCreateCursorAt(gMoveSelectionCursor[battler], 29);
            else
                MoveSelectionDestroyCursorAt(gMultiUsePlayerCursor);
            gMultiUsePlayerCursor ^= 1;
            PlaySE(SE_SELECT);
            if (gMultiUsePlayerCursor == gMoveSelectionCursor[battler])
                MoveSelectionCreateCursorAt(gMultiUsePlayerCursor, 0);
            else
                MoveSelectionCreateCursorAt(gMultiUsePlayerCursor, 27);
        }
    }
    if (JOY_NEW(DPAD_RIGHT))
    {
        if (!(gMultiUsePlayerCursor & 1) && (gMultiUsePlayerCursor ^ 1) < gNumberOfMovesToChoose)
        {
            if (gMultiUsePlayerCursor == gMoveSelectionCursor[battler])
                MoveSelectionCreateCursorAt(gMoveSelectionCursor[battler], 29);
            else
                MoveSelectionDestroyCursorAt(gMultiUsePlayerCursor);
            gMultiUsePlayerCursor ^= 1;
            PlaySE(SE_SELECT);
            if (gMultiUsePlayerCursor == gMoveSelectionCursor[battler])
                MoveSelectionCreateCursorAt(gMultiUsePlayerCursor, 0);
            else
                MoveSelectionCreateCursorAt(gMultiUsePlayerCursor, 27);
        }
    }
    if (JOY_NEW(DPAD_UP))
    {
        if (gMultiUsePlayerCursor & 2)
        {
            if (gMultiUsePlayerCursor == gMoveSelectionCursor[battler])
                MoveSelectionCreateCursorAt(gMoveSelectionCursor[battler], 29);
            else
                MoveSelectionDestroyCursorAt(gMultiUsePlayerCursor);
            gMultiUsePlayerCursor ^= 2;
            PlaySE(SE_SELECT);
            if (gMultiUsePlayerCursor == gMoveSelectionCursor[battler])
                MoveSelectionCreateCursorAt(gMultiUsePlayerCursor, 0);
            else
                MoveSelectionCreateCursorAt(gMultiUsePlayerCursor, 27);
        }
    }
    if (JOY_NEW(DPAD_DOWN))
    {
        if (!(gMultiUsePlayerCursor & 2) && (gMultiUsePlayerCursor ^ 2) < gNumberOfMovesToChoose)
        {
            if (gMultiUsePlayerCursor == gMoveSelectionCursor[battler])
                MoveSelectionCreateCursorAt(gMoveSelectionCursor[battler], 29);
            else
                MoveSelectionDestroyCursorAt(gMultiUsePlayerCursor);
            gMultiUsePlayerCursor ^= 2;
            PlaySE(SE_SELECT);
            if (gMultiUsePlayerCursor == gMoveSelectionCursor[battler])
                MoveSelectionCreateCursorAt(gMultiUsePlayerCursor, 0);
            else
                MoveSelectionCreateCursorAt(gMultiUsePlayerCursor, 27);
        }
    }
}

static void SetLinkBattleEndCallbacks(u32 battler)
{
    if (gWirelessCommType == 0)
    {
        if (!gReceivedRemoteLinkPlayers)
        {
            m4aSongNumStop(SE_LOW_HEALTH);
            gMain.inBattle = 0;
            gMain.callback1 = gPreBattleCallback1;
            SetMainCallback2(CB2_InitEndLinkBattle);
            FreeAllWindowBuffers();
        }
    }
    else if (IsLinkTaskFinished())
    {
        m4aSongNumStop(SE_LOW_HEALTH);
        gMain.inBattle = 0;
        gMain.callback1 = gPreBattleCallback1;
        SetMainCallback2(CB2_InitEndLinkBattle);
        FreeAllWindowBuffers();
    }
}

void SetBattleEndCallbacks(u32 battler)
{
    if (!gPaletteFade.active)
    {
        if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        {
            if (gWirelessCommType == 0)
                SetCloseLinkCallback();
            else
                SetLinkStandbyCallback();
            gBattlerControllerFuncs[battler] = SetLinkBattleEndCallbacks;
        }
        else
        {
            m4aSongNumStop(SE_LOW_HEALTH);
            gMain.inBattle = FALSE;
            gMain.callback1 = gPreBattleCallback1;
            SetMainCallback2(gMain.savedCallback);
        }
    }
}

static void CompleteOnBattlerSpriteCallbackDummy(u32 battler)
{
    if (gSprites[gBattlerSpriteIds[battler]].callback == SpriteCallbackDummy)
        PlayerBufferExecCompleted(battler);
}

static void CompleteOnBattlerSpriteCallbackDummy2(u32 battler)
{
    if (gSprites[gBattlerSpriteIds[battler]].callback == SpriteCallbackDummy)
        PlayerBufferExecCompleted(battler);
}

static void FreeTrainerSpriteAfterSlide(u32 battler)
{
    if (gSprites[gBattlerSpriteIds[battler]].callback == SpriteCallbackDummy)
    {
        BattleGfxSfxDummy3(gSaveBlock2Ptr->playerGender);
        FreeSpriteOamMatrix(&gSprites[gBattlerSpriteIds[battler]]);
        DestroySprite(&gSprites[gBattlerSpriteIds[battler]]);
        PlayerBufferExecCompleted(battler);
    }
}

static void Intro_DelayAndEnd(u32 battler)
{
    if (--gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay == (u8)-1)
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay = 0;
        PlayerBufferExecCompleted(battler);
    }
}

static void Intro_WaitForShinyAnimAndHealthbox(u32 battler)
{
    bool8 var = FALSE;

    if (!IsDoubleBattle() || (IsDoubleBattle() && (gBattleTypeFlags & BATTLE_TYPE_MULTI)))
    {
        if (gSprites[gHealthboxSpriteIds[battler]].callback == SpriteCallbackDummy)
            var = TRUE;
    }
    else
    {
        if (gSprites[gHealthboxSpriteIds[battler]].callback == SpriteCallbackDummy
         && gSprites[gHealthboxSpriteIds[BATTLE_PARTNER(battler)]].callback == SpriteCallbackDummy)
            var = TRUE;
    }
    if (IsCryPlayingOrClearCrySongs())
        var = FALSE;
    if (var && gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim
        && gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].finishedShinyMonAnim)
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
        HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[battler]], battler);
        if (IsDoubleBattle())
            HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[BATTLE_PARTNER(battler)]], BATTLE_PARTNER(battler));
        gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay = 3;
        gBattlerControllerFuncs[battler] = Intro_DelayAndEnd;
    }
}

static void Intro_TryShinyAnimShowHealthbox(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].ballAnimActive && !gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].ballAnimActive)
    {
        if (!gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim)
            TryShinyAnimation(battler, &gPlayerParty[gBattlerPartyIndexes[battler]]);
        if (!gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].triedShinyMonAnim)
            TryShinyAnimation(BATTLE_PARTNER(battler), &gPlayerParty[gBattlerPartyIndexes[BATTLE_PARTNER(battler)]]);
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

static void SwitchIn_CleanShinyAnimShowSubstitute(u32 battler)
{
    if (gSprites[gHealthboxSpriteIds[battler]].callback == SpriteCallbackDummy
     && gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim)
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim = FALSE;
        gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim = FALSE;
        FreeSpriteTilesByTag(ANIM_TAG_GOLD_STARS);
        FreeSpritePaletteByTag(ANIM_TAG_GOLD_STARS);
        if (gBattleSpritesDataPtr->battlerData[battler].behindSubstitute)
            InitAndLaunchSpecialAnimation(battler, battler, battler, B_ANIM_MON_TO_SUBSTITUTE);
        gBattlerControllerFuncs[battler] = SwitchIn_HandleSoundAndEnd;
    }
}

static void SwitchIn_HandleSoundAndEnd(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].specialAnimActive
     && !IsCryPlayingOrClearCrySongs())
    {
        m4aMPlayVolumeControl(&gMPlayInfo_BGM, TRACKS_ALL, 0x100);
        HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[battler]], battler);
        PlayerBufferExecCompleted(battler);
    }
}

static void SwitchIn_TryShinyAnimShowHealthbox(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim
     && !gBattleSpritesDataPtr->healthBoxesData[battler].ballAnimActive)
        TryShinyAnimation(battler, &gPlayerParty[gBattlerPartyIndexes[battler]]);
    if (gSprites[gBattleControllerData[battler]].callback == SpriteCallbackDummy
     && !(gBattleSpritesDataPtr->healthBoxesData[battler].ballAnimActive))
    {
        DestroySprite(&gSprites[gBattleControllerData[battler]]);
        UpdateHealthboxAttribute(gHealthboxSpriteIds[battler],
                                 &gPlayerParty[gBattlerPartyIndexes[battler]],
                                 HEALTHBOX_ALL);
        StartHealthboxSlideIn(battler);
        SetHealthboxSpriteVisible(gHealthboxSpriteIds[battler]);
        CopyBattleSpriteInvisibility(battler);
        gBattlerControllerFuncs[battler] = SwitchIn_CleanShinyAnimShowSubstitute;
    }
}

void Task_PlayerController_RestoreBgmAfterCry(u8 taskId)
{
    if (!IsCryPlayingOrClearCrySongs())
    {
        m4aMPlayVolumeControl(&gMPlayInfo_BGM, TRACKS_ALL, 0x100);
        DestroyTask(taskId);
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
        HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[battler]], battler);
        PlayerBufferExecCompleted(battler);
    }
}

void CompleteOnInactiveTextPrinter(u32 battler)
{
    if (!IsTextPrinterActive(0))
        PlayerBufferExecCompleted(battler);
}

#define tExpTask_monId      data[0]
#define tExpTask_battler    data[2]
#define tExpTask_gainedExp_1  data[3]
#define tExpTask_gainedExp_2  data[4]
#define tExpTask_frames     data[10]

static s32 GetTaskExpValue(u8 taskId)
{
    return (u16)(gTasks[taskId].tExpTask_gainedExp_1) | (gTasks[taskId].tExpTask_gainedExp_2 << 16);
}

static void Task_GiveExpToMon(u8 taskId)
{
    u32 monId = (u8)(gTasks[taskId].tExpTask_monId);
    u32 battler = gTasks[taskId].tExpTask_battler;
    s32 gainedExp = GetTaskExpValue(taskId);

    if (IsDoubleBattle() == TRUE || monId != gBattlerPartyIndexes[battler]) // Give exp without moving the expbar.
    {
        struct Pokemon *mon = &gPlayerParty[monId];
        u16 species = GetMonData(mon, MON_DATA_SPECIES);
        u8 level = GetMonData(mon, MON_DATA_LEVEL);
        u32 currExp = GetMonData(mon, MON_DATA_EXP);
        u32 nextLvlExp = gExperienceTables[gSpeciesInfo[species].growthRate][level + 1];

        if (currExp + gainedExp >= nextLvlExp)
        {
            SetMonData(mon, MON_DATA_EXP, &nextLvlExp);
            CalculateMonStats(mon);
            gainedExp -= nextLvlExp - currExp;
            BtlController_EmitTwoReturnValues(battler, 1, RET_VALUE_LEVELED_UP, gainedExp);
            if (IsDoubleBattle() == TRUE
             && ((u16)(monId) == gBattlerPartyIndexes[battler] || (u16)(monId) == gBattlerPartyIndexes[BATTLE_PARTNER(battler)]))
                gTasks[taskId].func = Task_LaunchLvlUpAnim;
            else
                gTasks[taskId].func = DestroyExpTaskAndCompleteOnInactiveTextPrinter;
        }
        else
        {
            currExp += gainedExp;
            SetMonData(mon, MON_DATA_EXP, &currExp);
            gBattlerControllerFuncs[battler] = CompleteOnInactiveTextPrinter;
            DestroyTask(taskId);
        }
    }
    else
    {
        gTasks[taskId].func = Task_PrepareToGiveExpWithExpBar;
    }
}

static void Task_PrepareToGiveExpWithExpBar(u8 taskId)
{
    u8 monIndex = gTasks[taskId].tExpTask_monId;
    s32 gainedExp = GetTaskExpValue(taskId);
    u8 battlerId = gTasks[taskId].tExpTask_battler;
    struct Pokemon *mon = &gPlayerParty[monIndex];
    u8 level = GetMonData(mon, MON_DATA_LEVEL);
    u16 species = GetMonData(mon, MON_DATA_SPECIES);
    u32 exp = GetMonData(mon, MON_DATA_EXP);
    u32 currLvlExp = gExperienceTables[gSpeciesInfo[species].growthRate][level];
    u32 expToNextLvl;

    exp -= currLvlExp;
    expToNextLvl = gExperienceTables[gSpeciesInfo[species].growthRate][level + 1] - currLvlExp;
    SetBattleBarStruct(battlerId, gHealthboxSpriteIds[battlerId], expToNextLvl, exp, -gainedExp);
    PlaySE(SE_EXP);
    gTasks[taskId].func = Task_GiveExpWithExpBar;
}

static void Task_GiveExpWithExpBar(u8 taskId)
{
    u8 level;
    u16 species;
    s32 currExp, newExpPoints, expOnNextLvl;
    if (gTasks[taskId].tExpTask_frames < 13)
    {
        ++gTasks[taskId].tExpTask_frames;
    }
    else
    {
        u8 monId = gTasks[taskId].tExpTask_monId;
        s32 gainedExp = GetTaskExpValue(taskId);
        u8 battler = gTasks[taskId].tExpTask_battler;

        newExpPoints = MoveBattleBar(battler, gHealthboxSpriteIds[battler], EXP_BAR, 0);
        SetHealthboxSpriteVisible(gHealthboxSpriteIds[battler]);
        if (newExpPoints == -1) // The bar has been filled with given exp points.
        {
            m4aSongNumStop(SE_EXP);
            level = GetMonData(&gPlayerParty[monId], MON_DATA_LEVEL);
            currExp = GetMonData(&gPlayerParty[monId], MON_DATA_EXP);
            species = GetMonData(&gPlayerParty[monId], MON_DATA_SPECIES);
            expOnNextLvl = gExperienceTables[gSpeciesInfo[species].growthRate][level + 1];
            if (currExp + gainedExp >= expOnNextLvl)
            {
                SetMonData(&gPlayerParty[monId], MON_DATA_EXP, &expOnNextLvl);
                CalculateMonStats(&gPlayerParty[monId]);
                gainedExp -= expOnNextLvl - currExp;
                BtlController_EmitTwoReturnValues(battler, 1, RET_VALUE_LEVELED_UP, gainedExp);
                gTasks[taskId].func = Task_LaunchLvlUpAnim;
            }
            else
            {
                currExp += gainedExp;
                SetMonData(&gPlayerParty[monId], MON_DATA_EXP, &currExp);
                gBattlerControllerFuncs[battler] = CompleteOnInactiveTextPrinter;
                DestroyTask(taskId);
            }
        }
    }
}

static void Task_LaunchLvlUpAnim(u8 taskId)
{
    u8 battler = gTasks[taskId].tExpTask_battler;
    u8 monIndex = gTasks[taskId].tExpTask_monId;

    if (IsDoubleBattle() == TRUE && monIndex == gBattlerPartyIndexes[BATTLE_PARTNER(battler)])
        battler = BATTLE_PARTNER(battler);

    InitAndLaunchSpecialAnimation(battler, battler, battler, B_ANIM_LVL_UP);
    gTasks[taskId].func = Task_UpdateLvlInHealthbox;
}

static void Task_UpdateLvlInHealthbox(u8 taskId)
{
    u8 battler = gTasks[taskId].tExpTask_battler;

    if (!gBattleSpritesDataPtr->healthBoxesData[battler].specialAnimActive)
    {
        u8 monIndex = gTasks[taskId].tExpTask_monId;
        if (IsDoubleBattle() == TRUE && monIndex == gBattlerPartyIndexes[BATTLE_PARTNER(battler)])
            UpdateHealthboxAttribute(gHealthboxSpriteIds[BATTLE_PARTNER(battler)], &gPlayerParty[monIndex], HEALTHBOX_ALL);
        else
            UpdateHealthboxAttribute(gHealthboxSpriteIds[battler], &gPlayerParty[monIndex], HEALTHBOX_ALL);
        gTasks[taskId].func = DestroyExpTaskAndCompleteOnInactiveTextPrinter;
    }
}

static void DestroyExpTaskAndCompleteOnInactiveTextPrinter(u8 taskId)
{
    u8 monIndex;
    s32 battlerId = gTasks[taskId].tExpTask_battler;

    if (IsBattlerSpriteVisible((u8)battlerId) == TRUE)
    {
        gTasks[taskId].func = Task_CreateLevelUpVerticalStripes;
        gTasks[taskId].data[15] = 0;
    }
    else
    {
        gBattlerControllerFuncs[battlerId] = CompleteOnInactiveTextPrinter;
        DestroyTask(taskId);
    }
}

static void Task_CreateLevelUpVerticalStripes(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u8 battlerId = tExpTask_battler;
    u16 bgPriorityRank = GetBattlerSpriteBGPriorityRank(battlerId);
    bool32 isOnBg2 = ((bgPriorityRank ^ 1)) != 0;
    struct Sprite *sprite = &gSprites[gBattlerSpriteIds[battlerId]];

    switch (data[15])
    {
    case 0:
        if (!IsTextPrinterActive(0))
        {
            if (!isOnBg2)
            {
                data[14] = gBattle_BG1_X;
                data[13] = gBattle_BG1_Y;
                gBattle_BG1_X = -(sprite->x + sprite->x2) + 32;
                gBattle_BG1_Y = -(sprite->y + sprite->y2) + 32;
            }
            else
            {
                data[14] = gBattle_BG2_X;
                data[13] = gBattle_BG2_Y;
                gBattle_BG2_X = -(sprite->x + sprite->x2) + 32;
                gBattle_BG2_Y = -(sprite->y + sprite->y2) + 32;
            }
            ++data[15];
        }
        break;
    case 1:
        {
            u32 battlerIdAlt = battlerId;
            bool32 v6Alt = isOnBg2;

            MoveBattlerSpriteToBG(battlerIdAlt, v6Alt);
        }
        ++data[15];
        break;
    case 2:
        PlaySE(SE_RS_SHOP);
        if (IsMonGettingExpSentOut())
            CreateLevelUpVerticalSpritesTask(sprite->x + sprite->x2,
                        sprite->y + sprite->y2,
                        10000,
                        10000,
                        1,
                        0);
        ++data[15];
        break;
    case 3:
        if (!LevelUpVerticalSpritesTaskIsRunning())
        {
            sprite->invisible = FALSE;
            ++data[15];
        }
        break;
    case 5:
        ResetBattleAnimBg(isOnBg2);
        ++data[15];
        break;
    case 4:
        ++data[15];
        break;
    case 6:
        if (!isOnBg2)
        {
            gBattle_BG1_X = data[14];
            gBattle_BG1_Y = data[13];
        }
        else
        {
            gBattle_BG2_X = data[14];
            gBattle_BG2_Y = data[13];
        }
        gBattlerControllerFuncs[battlerId] = CompleteOnInactiveTextPrinter;
        DestroyTask(taskId);
        break;
    }
}

static void FreeMonSpriteAfterFaintAnim(u32 battler)
{
    if (gSprites[gBattlerSpriteIds[battler]].y + gSprites[gBattlerSpriteIds[battler]].y2 > DISPLAY_HEIGHT)
    {
        FreeOamMatrix(gSprites[gBattlerSpriteIds[battler]].oam.matrixNum);
        DestroySprite(&gSprites[gBattlerSpriteIds[battler]]);
        SetHealthboxSpriteInvisible(gHealthboxSpriteIds[battler]);
        PlayerBufferExecCompleted(battler);
    }
}

static void FreeMonSpriteAfterSwitchOutAnim(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].specialAnimActive)
    {
        FreeSpriteOamMatrix(&gSprites[gBattlerSpriteIds[battler]]);
        DestroySprite(&gSprites[gBattlerSpriteIds[battler]]);
        SetHealthboxSpriteInvisible(gHealthboxSpriteIds[battler]);
        PlayerBufferExecCompleted(battler);
    }
}

static void CompleteOnInactiveTextPrinter2(u32 battler)
{
    if (!IsTextPrinterActive(0))
        PlayerBufferExecCompleted(battler);
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
        if ((gBattleBufferA[battler][1] & 0xF) == 1)
            PrintLinkStandbyMsg();
        PlayerBufferExecCompleted(battler);
    }
}

static void OpenBagAndChooseItem(u32 battler)
{
    if (!gPaletteFade.active)
    {
        gBattlerControllerFuncs[battler] = CompleteWhenChoseItem;
        ReshowBattleScreenDummy();
        FreeAllWindowBuffers();
        CB2_BagMenuFromBattle();
    }
}

static void CompleteWhenChoseItem(u32 battler)
{
    if (gMain.callback2 == BattleMainCB2 && !gPaletteFade.active)
    {
        BtlController_EmitOneReturnValue(battler, 1, gSpecialVar_ItemId);
        PlayerBufferExecCompleted(battler);
    }
}

static void CompleteOnSpecialAnimDone(u32 battler)
{
    if (!gDoingBattleAnim || !gBattleSpritesDataPtr->healthBoxesData[battler].specialAnimActive)
        PlayerBufferExecCompleted(battler);
}

static void DoHitAnimBlinkSpriteEffect(u32 battler)
{
    u8 spriteId = gBattlerSpriteIds[battler];

    if (gSprites[spriteId].data[1] == 32)
    {
        gSprites[spriteId].data[1] = 0;
        gSprites[spriteId].invisible = FALSE;
        gDoingBattleAnim = FALSE;
        PlayerBufferExecCompleted(battler);
    }
    else
    {
        if ((gSprites[spriteId].data[1] % 4) == 0)
            gSprites[spriteId].invisible ^= 1;
        ++gSprites[spriteId].data[1];
    }
}

static void MoveSelectionDisplayMoveNames(u32 battler)
{
    s32 i;
    struct ChooseMoveStruct *moveInfo = (struct ChooseMoveStruct *)(&gBattleBufferA[battler][4]);
    gNumberOfMovesToChoose = 0;

    for (i = 0; i < MAX_MON_MOVES; ++i)
    {
        MoveSelectionDestroyCursorAt(i);
        StringCopy(gDisplayedStringBattle, gText_MoveInterfaceDynamicColors);
        StringAppend(gDisplayedStringBattle, gMovesInfo[moveInfo->moves[i]].name);
        BattlePutTextOnWindow(gDisplayedStringBattle, i + 3);
        if (moveInfo->moves[i] != MOVE_NONE)
            ++gNumberOfMovesToChoose;
    }
}

static void MoveSelectionDisplayPpString(void)
{
    StringCopy(gDisplayedStringBattle, gText_MoveInterfacePP);
    BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_PP);
}

static void MoveSelectionDisplayPpNumber(u32 battler)
{
    u8 *txtPtr;
    struct ChooseMoveStruct *moveInfo;

    if (gBattleBufferA[battler][2] == TRUE) // check if we didn't want to display pp number
        return;
    SetPpNumbersPaletteInMoveSelection(battler);
    moveInfo = (struct ChooseMoveStruct *)(&gBattleBufferA[battler][4]);
    txtPtr = ConvertIntToDecimalStringN(gDisplayedStringBattle, moveInfo->currentPp[gMoveSelectionCursor[battler]], STR_CONV_MODE_RIGHT_ALIGN, 2);
    *txtPtr = CHAR_SLASH;
    ConvertIntToDecimalStringN(++txtPtr, moveInfo->maxPp[gMoveSelectionCursor[battler]], STR_CONV_MODE_RIGHT_ALIGN, 2);
    BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_PP_REMAINING);
}

static void MoveSelectionDisplayMoveType(u32 battler)
{
    u8 *txtPtr;
    struct ChooseMoveStruct *moveInfo = (struct ChooseMoveStruct *)(&gBattleBufferA[battler][4]);

    txtPtr = StringCopy(gDisplayedStringBattle, gText_MoveInterfaceType);
    *txtPtr++ = EXT_CTRL_CODE_BEGIN;
    *txtPtr++ = EXT_CTRL_CODE_FONT;
    *txtPtr++ = FONT_SMALL;
    txtPtr = StringCopy(txtPtr, gText_MoveInterfaceDynamicColors);
    StringCopy(txtPtr, gTypesInfo[gMovesInfo[moveInfo->moves[gMoveSelectionCursor[battler]]].type].name);
    BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_MOVE_TYPE);
}

void MoveSelectionCreateCursorAt(u8 cursorPosition, u8 arg1)
{
    u16 src[2];

    src[0] = arg1 + 1;
    src[1] = arg1 + 2;
    CopyToBgTilemapBufferRect_ChangePalette(0, src, 9 * (cursorPosition & 1) + 1, 55 + (cursorPosition & 2), 1, 2, 0x11);
    CopyBgTilemapBufferToVram(0);
}

void MoveSelectionDestroyCursorAt(u8 cursorPosition)
{
    u16 src[2];

    src[0] = 32;
    src[1] = 32;
    CopyToBgTilemapBufferRect_ChangePalette(0, src, 9 * (cursorPosition & 1) + 1, 55 + (cursorPosition & 2), 1, 2, 0x11);
    CopyBgTilemapBufferToVram(0);
}

void ActionSelectionCreateCursorAt(u8 cursorPosition, u8 arg1)
{
    u16 src[2];

    src[0] = 1;
    src[1] = 2;
    CopyToBgTilemapBufferRect_ChangePalette(0, src, 7 * (cursorPosition & 1) + 16, 35 + (cursorPosition & 2), 1, 2, 0x11);
    CopyBgTilemapBufferToVram(0);
}

void ActionSelectionDestroyCursorAt(u8 cursorPosition)
{
    u16 src[2];

    src[0] = 32;
    src[1] = 32;
    CopyToBgTilemapBufferRect_ChangePalette(0, src, 7 * (cursorPosition & 1) + 16, 35 + (cursorPosition & 2), 1, 2, 0x11);
    CopyBgTilemapBufferToVram(0);
}

void SetCB2ToReshowScreenAfterMenu(void)
{
    SetMainCallback2(ReshowBattleScreenAfterMenu);
}

void SetCB2ToReshowScreenAfterMenu2(void)
{
    SetMainCallback2(ReshowBattleScreenAfterMenu);
}

static void CompleteOnFinishedStatusAnimation(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].statusAnimActive)
        PlayerBufferExecCompleted(battler);
}

static void CompleteOnFinishedBattleAnimation(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].animFromTableActive)
        PlayerBufferExecCompleted(battler);
}

static void PrintLinkStandbyMsg(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        gBattle_BG0_X = 0;
        gBattle_BG0_Y = 0;
        BattlePutTextOnWindow(gText_LinkStandby, B_WIN_MSG);
    }
}

static void PlayerHandleLoadMonSprite(u32 battler)
{
    BattleLoadPlayerMonSpriteGfx(&gPlayerParty[gBattlerPartyIndexes[battler]], battler);
    gSprites[gBattlerSpriteIds[battler]].oam.paletteNum = battler;
    gBattlerControllerFuncs[battler] = CompleteOnBattlerSpritePosX_0;
}

static void PlayerHandleSwitchInAnim(u32 battler)
{
    ClearTemporarySpeciesSpriteData(battler, gBattleBufferA[battler][2]);
    gBattlerPartyIndexes[battler] = gBattleBufferA[battler][1];
    BattleLoadPlayerMonSpriteGfx(&gPlayerParty[gBattlerPartyIndexes[battler]], battler);
    gActionSelectionCursor[battler] = 0;
    gMoveSelectionCursor[battler] = 0;
    StartSendOutAnim(battler, gBattleBufferA[battler][2]);
    gBattlerControllerFuncs[battler] = SwitchIn_TryShinyAnimShowHealthbox;
}

static void StartSendOutAnim(u32 battler, bool8 dontClearSubstituteBit)
{
    u16 species;

    ClearTemporarySpeciesSpriteData(battler, dontClearSubstituteBit);
    gBattlerPartyIndexes[battler] = gBattleBufferA[battler][1];
    species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_SPECIES);

    gBattleControllerData[battler] = CreateInvisibleSpriteWithCallback(SpriteCB_WaitForBattlerBallReleaseAnim);
    SetMultiuseSpriteTemplateToPokemon(species, GetBattlerPosition(battler));
    gBattlerSpriteIds[battler] = CreateSprite(&gMultiuseSpriteTemplate,
                                                GetBattlerSpriteCoord(battler, BATTLER_COORD_X_2),
                                                GetBattlerSpriteDefault_Y(battler),
                                                GetBattlerSpriteSubpriority(battler));
    gSprites[gBattleControllerData[battler]].data[1] = gBattlerSpriteIds[battler];
    gSprites[gBattlerSpriteIds[battler]].data[0] = battler;
    gSprites[gBattlerSpriteIds[battler]].data[2] = species;
    gSprites[gBattlerSpriteIds[battler]].oam.paletteNum = battler;
    StartSpriteAnim(&gSprites[gBattlerSpriteIds[battler]], gBattleMonForms[battler]);
    gSprites[gBattlerSpriteIds[battler]].invisible = TRUE;
    gSprites[gBattlerSpriteIds[battler]].callback = SpriteCallbackDummy;
    gSprites[gBattleControllerData[battler]].data[0] = DoPokeballSendOutAnimation(battler, 0, POKEBALL_PLAYER_SENDOUT);
}

static void PlayerHandleReturnMonToBall(u32 battler)
{
    if (gBattleBufferA[battler][1] == 0)
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 0;
        gBattlerControllerFuncs[battler] = DoSwitchOutAnimation;
    }
    else
    {
        FreeSpriteOamMatrix(&gSprites[gBattlerSpriteIds[battler]]);
        DestroySprite(&gSprites[gBattlerSpriteIds[battler]]);
        SetHealthboxSpriteInvisible(gHealthboxSpriteIds[battler]);
        PlayerBufferExecCompleted(battler);
    }
}

static void DoSwitchOutAnimation(u32 battler)
{
    switch (gBattleSpritesDataPtr->healthBoxesData[battler].animationState)
    {
    case 0:
        if (gBattleSpritesDataPtr->battlerData[battler].behindSubstitute)
            InitAndLaunchSpecialAnimation(battler, battler, battler, B_ANIM_SUBSTITUTE_TO_MON);
        gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 1;
        break;
    case 1:
        if (!gBattleSpritesDataPtr->healthBoxesData[battler].specialAnimActive)
        {
            gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 0;
            InitAndLaunchSpecialAnimation(battler, battler, battler, B_ANIM_SWITCH_OUT_PLAYER_MON);
            gBattlerControllerFuncs[battler] = FreeMonSpriteAfterSwitchOutAnim;
        }
        break;
    }
}

static void PlayerHandleDrawTrainerPic(u32 battler)
{
    s16 xPos;
    u32 trainerPicId;

    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        if ((GetBattlerPosition(battler) & BIT_FLANK) != B_FLANK_LEFT) // Second mon, on the right.
            xPos = 90;
        else // First mon, on the left.
            xPos = 32;

    }
    else
    {
        xPos = 80;
    }
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        if ((gLinkPlayers[GetMultiplayerId()].version & 0xFF) == VERSION_RUBY
         || (gLinkPlayers[GetMultiplayerId()].version & 0xFF) == VERSION_SAPPHIRE
         || (gLinkPlayers[GetMultiplayerId()].version & 0xFF) == VERSION_EMERALD)
            trainerPicId = gLinkPlayers[GetMultiplayerId()].gender + TRAINER_BACK_PIC_RUBY_SAPPHIRE_BRENDAN;
        else
            trainerPicId = gLinkPlayers[GetMultiplayerId()].gender;
    }
    else
    {
        trainerPicId = gSaveBlock2Ptr->playerGender;
    }
    DecompressTrainerBackPalette(trainerPicId, battler);
    SetMultiuseSpriteTemplateToTrainerBack(trainerPicId, GetBattlerPosition(battler));
    gBattlerSpriteIds[battler] = CreateSprite(&gMultiuseSpriteTemplate,
                                                     xPos,
                                                     (8 - gTrainerBackPicCoords[trainerPicId].size) * 4 + 80,
                                                     GetBattlerSpriteSubpriority(battler));
    gSprites[gBattlerSpriteIds[battler]].oam.paletteNum = battler;
    gSprites[gBattlerSpriteIds[battler]].x2 = DISPLAY_WIDTH;
    gSprites[gBattlerSpriteIds[battler]].data[0] = -2;
    gSprites[gBattlerSpriteIds[battler]].callback = SpriteCB_TrainerSlideIn;
    gBattlerControllerFuncs[battler] = CompleteOnBattlerSpriteCallbackDummy;
}

static void PlayerHandleTrainerSlide(u32 battler)
{
    u32 trainerPicId;

    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        if ((gLinkPlayers[GetMultiplayerId()].version & 0xFF) == VERSION_RUBY
         || (gLinkPlayers[GetMultiplayerId()].version & 0xFF) == VERSION_SAPPHIRE
         || (gLinkPlayers[GetMultiplayerId()].version & 0xFF) == VERSION_EMERALD)
            trainerPicId = gLinkPlayers[GetMultiplayerId()].gender + 2;
        else
            trainerPicId = gLinkPlayers[GetMultiplayerId()].gender + 0;
    }
    else
    {
        trainerPicId = gSaveBlock2Ptr->playerGender + 0;
    }
    DecompressTrainerBackPalette(trainerPicId, battler);
    SetMultiuseSpriteTemplateToTrainerBack(trainerPicId, GetBattlerPosition(battler));
    gBattlerSpriteIds[battler] = CreateSprite(&gMultiuseSpriteTemplate,
                                                     80,
                                                     (8 - gTrainerBackPicCoords[trainerPicId].size) * 4 + 80,
                                                     30);
    gSprites[gBattlerSpriteIds[battler]].oam.paletteNum = battler;
    gSprites[gBattlerSpriteIds[battler]].x2 = -96;
    gSprites[gBattlerSpriteIds[battler]].data[0] = 2;
    gSprites[gBattlerSpriteIds[battler]].callback = SpriteCB_TrainerSlideIn;
    gBattlerControllerFuncs[battler] = CompleteOnBattlerSpriteCallbackDummy2;
}

static void PlayerHandleTrainerSlideBack(u32 battler)
{
    SetSpritePrimaryCoordsFromSecondaryCoords(&gSprites[gBattlerSpriteIds[battler]]);
    gSprites[gBattlerSpriteIds[battler]].data[0] = 50;
    gSprites[gBattlerSpriteIds[battler]].data[2] = -40;
    gSprites[gBattlerSpriteIds[battler]].data[4] = gSprites[gBattlerSpriteIds[battler]].y;
    gSprites[gBattlerSpriteIds[battler]].callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData6(&gSprites[gBattlerSpriteIds[battler]], SpriteCallbackDummy);
    StartSpriteAnim(&gSprites[gBattlerSpriteIds[battler]], 1);
    gBattlerControllerFuncs[battler] = FreeTrainerSpriteAfterSlide;
}

static void PlayerHandleFaintAnimation(u32 battler)
{
    if (gBattleSpritesDataPtr->healthBoxesData[battler].animationState == 0)
    {
        if (gBattleSpritesDataPtr->battlerData[battler].behindSubstitute)
            InitAndLaunchSpecialAnimation(battler, battler, battler, B_ANIM_SUBSTITUTE_TO_MON);
        ++gBattleSpritesDataPtr->healthBoxesData[battler].animationState;
    }
    else
    {
        if (!gBattleSpritesDataPtr->healthBoxesData[battler].specialAnimActive)
        {
            gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 0;
            HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[battler]], battler);
            PlaySE12WithPanning(SE_FAINT, SOUND_PAN_ATTACKER);
            gSprites[gBattlerSpriteIds[battler]].data[1] = 0;
            gSprites[gBattlerSpriteIds[battler]].data[2] = 5;
            gSprites[gBattlerSpriteIds[battler]].callback = SpriteCB_FaintSlideAnim;
            gBattlerControllerFuncs[battler] = FreeMonSpriteAfterFaintAnim;
        }
    }
}

static void PlayerHandlePaletteFade(u32 battler)
{
    BeginNormalPaletteFade(PALETTES_ALL, 2, 0, 16, RGB_BLACK);
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleSuccessBallThrowAnim(u32 battler)
{
    gBattleSpritesDataPtr->animationData->ballThrowCaseId = BALL_3_SHAKES_SUCCESS;
    gDoingBattleAnim = TRUE;
    InitAndLaunchSpecialAnimation(battler, battler, GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT), B_ANIM_BALL_THROW);
    gBattlerControllerFuncs[battler] = CompleteOnSpecialAnimDone;
}

static void PlayerHandleBallThrowAnim(u32 battler)
{
    u8 ballThrowCaseId = gBattleBufferA[battler][1];

    gBattleSpritesDataPtr->animationData->ballThrowCaseId = ballThrowCaseId;
    gDoingBattleAnim = TRUE;
    InitAndLaunchSpecialAnimation(battler, battler, GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT), B_ANIM_BALL_THROW);
    gBattlerControllerFuncs[battler] = CompleteOnSpecialAnimDone;
}

static void PlayerHandlePause(u32 battler)
{
    u8 var = gBattleBufferA[battler][1];

    while (var)
        --var;
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleMoveAnimation(u32 battler)
{
    if (!IsBattleSEPlaying(battler))
    {
        u16 move = gBattleBufferA[battler][1] | (gBattleBufferA[battler][2] << 8);

        gAnimMoveTurn = gBattleBufferA[battler][3];
        gAnimMovePower = gBattleBufferA[battler][4] | (gBattleBufferA[battler][5] << 8);
        gAnimMoveDmg = gBattleBufferA[battler][6] | (gBattleBufferA[battler][7] << 8) | (gBattleBufferA[battler][8] << 16) | (gBattleBufferA[battler][9] << 24);
        gAnimFriendship = gBattleBufferA[battler][10];
        gWeatherMoveAnim = gBattleBufferA[battler][12] | (gBattleBufferA[battler][13] << 8);
        gAnimDisableStructPtr = (struct DisableStruct *)&gBattleBufferA[battler][16];
        gTransformedPersonalities[battler] = gAnimDisableStructPtr->transformedMonPersonality;
        if (IsMoveWithoutAnimation(move, gAnimMoveTurn)) // Always returns FALSE.
        {
            PlayerBufferExecCompleted(battler);
        }
        else
        {
            gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 0;
            gBattlerControllerFuncs[battler] = PlayerDoMoveAnimation;
        }
    }
}

static void PlayerDoMoveAnimation(u32 battler)
{
    u16 move = gBattleBufferA[battler][1] | (gBattleBufferA[battler][2] << 8);
    u8 multihit = gBattleBufferA[battler][11];

    switch (gBattleSpritesDataPtr->healthBoxesData[battler].animationState)
    {
    case 0:
        if (gBattleSpritesDataPtr->battlerData[battler].behindSubstitute
         && !gBattleSpritesDataPtr->battlerData[battler].flag_x8)
        {
            gBattleSpritesDataPtr->battlerData[battler].flag_x8 = 1;
            InitAndLaunchSpecialAnimation(battler, battler, battler, B_ANIM_SUBSTITUTE_TO_MON);
        }
        gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 1;
        break;
    case 1:
        if (!gBattleSpritesDataPtr->healthBoxesData[battler].specialAnimActive)
        {
            SetBattlerSpriteAffineMode(ST_OAM_AFFINE_OFF);
            DoMoveAnim(move);
            gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 2;
        }
        break;
    case 2:
        gAnimScriptCallback();
        if (!gAnimScriptActive)
        {
            SetBattlerSpriteAffineMode(ST_OAM_AFFINE_NORMAL);
            if (gBattleSpritesDataPtr->battlerData[battler].behindSubstitute && multihit < 2)
            {
                InitAndLaunchSpecialAnimation(battler, battler, battler, B_ANIM_MON_TO_SUBSTITUTE);
                gBattleSpritesDataPtr->battlerData[battler].flag_x8 = 0;
            }
            gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 3;
        }
        break;
    case 3:
        if (!gBattleSpritesDataPtr->healthBoxesData[battler].specialAnimActive)
        {
            CopyAllBattleSpritesInvisibilities();
            TrySetBehindSubstituteSpriteBit(battler, gBattleBufferA[battler][1] | (gBattleBufferA[battler][2] << 8));
            gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 0;
            PlayerBufferExecCompleted(battler);
        }
        break;
    }
}

static void PlayerHandlePrintString(u32 battler)
{
    u16 *stringId;

    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    stringId = (u16 *)(&gBattleBufferA[battler][2]);
    BufferStringBattle(battler, *stringId);
    if (BattleStringShouldBeColored(*stringId))
        BattlePutTextOnWindow(gDisplayedStringBattle, (B_WIN_MSG | B_TEXT_FLAG_NPC_CONTEXT_FONT));
    else
        BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_MSG);
    gBattlerControllerFuncs[battler] = CompleteOnInactiveTextPrinter2;
}

static void PlayerHandlePrintSelectionString(u32 battler)
{
    if (GetBattlerSide(battler) == B_SIDE_PLAYER)
        PlayerHandlePrintString(battler);
    else
        PlayerBufferExecCompleted(battler);
}

static void HandleChooseActionAfterDma3(u32 battler)
{
    if (!IsDma3ManagerBusyWithBgCopy())
    {
        gBattle_BG0_X = 0;
        gBattle_BG0_Y = 160;
        gBattlerControllerFuncs[battler] = HandleInputChooseAction;
    }
}

static void PlayerHandleChooseAction(u32 battler)
{
    s32 i;

    gBattlerControllerFuncs[battler] = HandleChooseActionAfterDma3;
    BattlePutTextOnWindow(gText_EmptyString3, B_WIN_MSG);
    BattlePutTextOnWindow(gText_BattleMenu, B_WIN_ACTION_MENU);
    for (i = 0; i < 4; ++i)
        ActionSelectionDestroyCursorAt(i);
    ActionSelectionCreateCursorAt(gActionSelectionCursor[battler], 0);
    PREPARE_MON_NICK_BUFFER(gBattleTextBuff1, battler, gBattlerPartyIndexes[battler]);
    BattleStringExpandPlaceholdersToDisplayedString(gText_WhatWillPkmnDo);
    BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_ACTION_PROMPT);
}

static void PlayerHandleUnknownYesNoBox(u32 battler)
{
}

static void HandleChooseMoveAfterDma3(u32 battler)
{
    if (!IsDma3ManagerBusyWithBgCopy())
    {
        gBattle_BG0_X = 0;
        gBattle_BG0_Y = 320;
        gBattlerControllerFuncs[battler] = HandleInputChooseMove;
    }
}

static void PlayerHandleChooseMove(u32 battler)
{
    struct ChooseMoveStruct *moveInfo = (struct ChooseMoveStruct *)(&gBattleBufferA[battler][4]);
    InitMoveSelectionsVarsAndStrings(battler);
    gBattleStruct->mega.playerSelect = FALSE;
    gBattleStruct->burst.playerSelect = FALSE;
    gBattleStruct->dynamax.playerSelect = FALSE;
    if (!IsMegaTriggerSpriteActive())
        gBattleStruct->mega.triggerSpriteId = 0xFF;
    if (CanMegaEvolve(battler))
        CreateMegaTriggerSprite(battler, 0);
    if (!IsBurstTriggerSpriteActive())
        gBattleStruct->burst.triggerSpriteId = 0xFF;
    if (CanUltraBurst(battler))
        CreateBurstTriggerSprite(battler, 0);
    // TODO: Dynamax
    // if (!IsDynamaxTriggerSpriteActive())
    //     gBattleStruct->dynamax.triggerSpriteId = 0xFF;
    // if (CanDynamax(battler))
    //     CreateDynamaxTriggerSprite(battler, 0);
    // TODO: Z-Move
    // if (!IsZMoveTriggerSpriteActive())
    //     gBattleStruct->zmove.triggerSpriteId = 0xFF;

    // GetUsableZMoves(battler, moveInfo->moves);
    // gBattleStruct->zmove.viable = IsZMoveUsable(battler, gMoveSelectionCursor[battler]);
    // CreateZMoveTriggerSprite(battler, gBattleStruct->zmove.viable);
    gBattlerControllerFuncs[battler] = HandleChooseMoveAfterDma3;
}

void InitMoveSelectionsVarsAndStrings(u32 battler)
{
    MoveSelectionDisplayMoveNames(battler);
    gMultiUsePlayerCursor = 0xFF;
    MoveSelectionCreateCursorAt(gMoveSelectionCursor[battler], 0);
    MoveSelectionDisplayPpString();
    MoveSelectionDisplayPpNumber(battler);
    MoveSelectionDisplayMoveType(battler);
}

static void PlayerHandleChooseItem(u32 battler)
{
    s32 i;

    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 0x10, RGB_BLACK);
    gBattlerControllerFuncs[battler] = OpenBagAndChooseItem;
    gBattlerInMenuId = battler;
    for (i = 0; i < 3; ++i)
        gBattlePartyCurrentOrder[i] = gBattleBufferA[battler][1 + i];
}

static void PlayerHandleChoosePokemon(u32 battler)
{
    s32 i;

    gBattleControllerData[battler] = CreateTask(TaskDummy, 0xFF);
    gTasks[gBattleControllerData[battler]].data[0] = gBattleBufferA[battler][1] & 0xF;
    *(&gBattleStruct->battlerPreventingSwitchout) = gBattleBufferA[battler][1] >> 4;
    *(&gBattleStruct->playerPartyIdx) = gBattleBufferA[battler][2];
    *(&gBattleStruct->abilityPreventingSwitchout) = (gBattleBufferA[battler][3] & 0xFF) | (gBattleBufferA[battler][7] << 8);
    for (i = 0; i < 3; ++i)
        gBattlePartyCurrentOrder[i] = gBattleBufferA[battler][4 + i];
    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 0x10, RGB_BLACK);
    gBattlerControllerFuncs[battler] = OpenPartyMenuToChooseMon;
    gBattlerInMenuId = battler;
}

static void PlayerHandleCmd23(u32 battler)
{
    BattleStopLowHpSound();
    BeginNormalPaletteFade(PALETTES_ALL, 2, 0, 16, RGB_BLACK);
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleHealthBarUpdate(u32 battler)
{
    s16 hpVal;

    LoadBattleBarGfx(0);
    hpVal = gBattleBufferA[battler][2] | (gBattleBufferA[battler][3] << 8);
    if (hpVal != INSTANT_HP_BAR_DROP)
    {
        u32 maxHP = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_MAX_HP);
        u32 curHP = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_HP);

        SetBattleBarStruct(battler, gHealthboxSpriteIds[battler], maxHP, curHP, hpVal);
    }
    else
    {
        u32 maxHP = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_MAX_HP);

        SetBattleBarStruct(battler, gHealthboxSpriteIds[battler], maxHP, 0, hpVal);
        UpdateHpTextInHealthbox(gHealthboxSpriteIds[battler], HP_CURRENT, 0, maxHP);
    }
    gBattlerControllerFuncs[battler] = CompleteOnHealthbarDone;
}

static void PlayerHandleExpUpdate(u32 battler)
{
    u8 monId = gBattleBufferA[battler][1];
    s32 expPointsToGive, taskId;

    if (GetMonData(&gPlayerParty[monId], MON_DATA_LEVEL) >= MAX_LEVEL)
    {
        PlayerBufferExecCompleted(battler);
    }
    else
    {
        LoadBattleBarGfx(1);
        expPointsToGive = T1_READ_32(&gBattleBufferA[battler][2]);
        taskId = CreateTask(Task_GiveExpToMon, 10);
        gTasks[taskId].tExpTask_monId = monId;
        gTasks[taskId].tExpTask_gainedExp_1 = expPointsToGive;
        gTasks[taskId].tExpTask_gainedExp_2 = expPointsToGive >> 16;
        gTasks[taskId].tExpTask_battler = battler;
        gBattlerControllerFuncs[battler] = BattleControllerDummy;
    }
}

static void PlayerHandleStatusIconUpdate(u32 battler)
{
    if (!IsBattleSEPlaying(battler))
    {
        u8 battlerId;

        UpdateHealthboxAttribute(gHealthboxSpriteIds[battler], &gPlayerParty[gBattlerPartyIndexes[battler]], HEALTHBOX_STATUS_ICON);
        battlerId = battler;
        gBattleSpritesDataPtr->healthBoxesData[battlerId].statusAnimActive = FALSE;
        gBattlerControllerFuncs[battler] = CompleteOnFinishedStatusAnimation;
    }
}

static void PlayerHandleStatusAnimation(u32 battler)
{
    if (!IsBattleSEPlaying(battler))
    {
        InitAndLaunchChosenStatusAnimation(battler, gBattleBufferA[battler][1],
                                           gBattleBufferA[battler][2] | (gBattleBufferA[battler][3] << 8) | (gBattleBufferA[battler][4] << 16) | (gBattleBufferA[battler][5] << 24));
        gBattlerControllerFuncs[battler] = CompleteOnFinishedStatusAnimation;
    }
}

static void PlayerHandleStatusXor(u32 battler)
{
    u8 val = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_STATUS) ^ gBattleBufferA[battler][1];

    SetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_STATUS, &val);
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleDataTransfer(u32 battler)
{
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleDMA3Transfer(u32 battler)
{
    u32 dstArg = gBattleBufferA[battler][1]
               | (gBattleBufferA[battler][2] << 8)
               | (gBattleBufferA[battler][3] << 16)
               | (gBattleBufferA[battler][4] << 24);
    u16 sizeArg = gBattleBufferA[battler][5] | (gBattleBufferA[battler][6] << 8);
    const u8 *src = &gBattleBufferA[battler][7];
    u8 *dst = (u8 *)(dstArg);
    u32 size = sizeArg;

    while (TRUE)
    {
        if (size <= 0x1000)
        {
            DmaCopy16(3, src, dst, size);
            break;
        }
        DmaCopy16(3, src, dst, 0x1000);
        src += 0x1000;
        dst += 0x1000;
        size -= 0x1000;
    }
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandlePlayBGM(u32 battler)
{
    PlayBGM(gBattleBufferA[battler][1] | (gBattleBufferA[battler][2] << 8));
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleCmd32(u32 battler)
{
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleTwoReturnValues(u32 battler)
{
    BtlController_EmitTwoReturnValues(battler, 1, 0, 0);
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleChosenMonReturnValue(u32 battler)
{
    BtlController_EmitChosenMonReturnValue(battler, 1, 0, NULL);
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleOneReturnValue(u32 battler)
{
    BtlController_EmitOneReturnValue(battler, 1, 0);
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleOneReturnValue_Duplicate(u32 battler)
{
    BtlController_EmitOneReturnValue_Duplicate(battler, 1, 0);
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleCmd37(u32 battler)
{
    gUnusedControllerStruct.unk = 0;
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleCmd38(u32 battler)
{
    gUnusedControllerStruct.unk = gBattleBufferA[battler][1];
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleCmd39(u32 battler)
{
    gUnusedControllerStruct.flag = 0;
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleCmd40(u32 battler)
{
    gUnusedControllerStruct.flag ^= 1;
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleHitAnimation(u32 battler)
{
    if (gSprites[gBattlerSpriteIds[battler]].invisible == TRUE)
    {
        PlayerBufferExecCompleted(battler);
    }
    else
    {
        gDoingBattleAnim = TRUE;
        gSprites[gBattlerSpriteIds[battler]].data[1] = 0;
        DoHitAnimHealthboxEffect(battler);
        gBattlerControllerFuncs[battler] = DoHitAnimBlinkSpriteEffect;
    }
}

static void PlayerHandleCmd42(u32 battler)
{
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandlePlaySE(u32 battler)
{
    s8 pan;

    if (GetBattlerSide(battler) == B_SIDE_PLAYER)
        pan = SOUND_PAN_ATTACKER;
    else
        pan = SOUND_PAN_TARGET;
    PlaySE12WithPanning(gBattleBufferA[battler][1] | (gBattleBufferA[battler][2] << 8), pan);
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandlePlayFanfare(u32 battler)
{
    PlayFanfare(gBattleBufferA[battler][1] | (gBattleBufferA[battler][2] << 8));
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleFaintingCry(u32 battler)
{
    PlayCry_ByMode(GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_SPECIES), -25, CRY_MODE_FAINT);
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleIntroSlide(u32 battler)
{
    HandleIntroSlide(gBattleBufferA[battler][1]);
    gIntroSlideFlags |= 1;
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleIntroTrainerBallThrow(u32 battler)
{
    u8 paletteNum;
    u8 taskId;

    SetSpritePrimaryCoordsFromSecondaryCoords(&gSprites[gBattlerSpriteIds[battler]]);
    gSprites[gBattlerSpriteIds[battler]].data[0] = 50;
    gSprites[gBattlerSpriteIds[battler]].data[2] = -40;
    gSprites[gBattlerSpriteIds[battler]].data[4] = gSprites[gBattlerSpriteIds[battler]].y;
    gSprites[gBattlerSpriteIds[battler]].callback = PlayerThrowBall_StartAnimLinearTranslation;
    gSprites[gBattlerSpriteIds[battler]].data[5] = battler;
    StoreSpriteCallbackInData6(&gSprites[gBattlerSpriteIds[battler]], SpriteCB_FreePlayerSpriteLoadMonSprite);
    StartSpriteAnim(&gSprites[gBattlerSpriteIds[battler]], 1);
    paletteNum = AllocSpritePalette(0xD6F8);
    LoadCompressedPalette(gTrainerBackPicPaletteTable[gSaveBlock2Ptr->playerGender].data, OBJ_PLTT_ID(paletteNum), PLTT_SIZE_4BPP);
    gSprites[gBattlerSpriteIds[battler]].oam.paletteNum = paletteNum;
    taskId = CreateTask(Task_StartSendOutAnim, 5);
    gTasks[taskId].data[0] = battler;
    if (gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusSummaryShown)
        gTasks[gBattlerStatusSummaryTaskId[battler]].func = Task_HidePartyStatusSummary;
    gBattleSpritesDataPtr->animationData->introAnimActive = TRUE;
    gBattlerControllerFuncs[battler] = BattleControllerDummy;
}

void SpriteCB_FreePlayerSpriteLoadMonSprite(struct Sprite *sprite)
{
    u8 battlerId = sprite->data[5];

    FreeSpriteOamMatrix(sprite);
    FreeSpritePaletteByTag(GetSpritePaletteTagByPaletteNum(sprite->oam.paletteNum));
    DestroySprite(sprite);
    BattleLoadPlayerMonSpriteGfx(&gPlayerParty[gBattlerPartyIndexes[battlerId]], battlerId);
    StartSpriteAnim(&gSprites[gBattlerSpriteIds[battlerId]], 0);
}

static void Task_StartSendOutAnim(u8 taskId)
{
    if (gTasks[taskId].data[1] < 31)
    {
        ++gTasks[taskId].data[1];
    }
    else
    {
        u32 battler = gTasks[taskId].data[0];
        if (!IsDoubleBattle() || (gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            gBattleBufferA[battler][1] = gBattlerPartyIndexes[battler];
            StartSendOutAnim(battler, FALSE);
        }
        else
        {
            u32 battlerPartner = BATTLE_PARTNER(battler);
            gBattleBufferA[battler][1] = gBattlerPartyIndexes[battler];
            StartSendOutAnim(battler, FALSE);

            gBattleBufferA[battlerPartner][1] = gBattlerPartyIndexes[battlerPartner];
            BattleLoadPlayerMonSpriteGfx(&gPlayerParty[gBattlerPartyIndexes[battlerPartner]], battlerPartner);
            StartSendOutAnim(battlerPartner, FALSE);
        }
        gBattlerControllerFuncs[battler] = Intro_TryShinyAnimShowHealthbox;
        DestroyTask(taskId);
    }
}

static void PlayerHandleDrawPartyStatusSummary(u32 battler)
{
    if (gBattleBufferA[battler][1] && GetBattlerSide(battler) == B_SIDE_PLAYER)
    {
        PlayerBufferExecCompleted(battler);
    }
    else
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusSummaryShown = TRUE;
        gBattlerStatusSummaryTaskId[battler] = CreatePartyStatusSummarySprites(battler, (struct HpAndStatus *)&gBattleBufferA[battler][4], gBattleBufferA[battler][1], gBattleBufferA[battler][2]);
        gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusDelayTimer = 0;
        if (gBattleBufferA[battler][2] != 0)
            gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusDelayTimer = 93;
        gBattlerControllerFuncs[battler] = EndDrawPartyStatusSummary;
    }
}

static void EndDrawPartyStatusSummary(u32 battler)
{
    if (gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusDelayTimer++ > 0x5C)
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusDelayTimer = 0;
        PlayerBufferExecCompleted(battler);
    }
}

static void PlayerHandleHidePartyStatusSummary(u32 battler)
{
    if (gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusSummaryShown)
        gTasks[gBattlerStatusSummaryTaskId[battler]].func = Task_HidePartyStatusSummary;
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleEndBounceEffect(u32 battler)
{
    EndBounceEffect(battler, BOUNCE_HEALTHBOX);
    EndBounceEffect(battler, BOUNCE_MON);
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleSpriteInvisibility(u32 battler)
{
    if (IsBattlerSpritePresent(battler))
    {
        gSprites[gBattlerSpriteIds[battler]].invisible = gBattleBufferA[battler][1];
        CopyBattleSpriteInvisibility(battler);
    }
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleBattleAnimation(u32 battler)
{
    if (!IsBattleSEPlaying(battler))
    {
        u8 animationId = gBattleBufferA[battler][1];
        u16 argument = gBattleBufferA[battler][2] | (gBattleBufferA[battler][3] << 8);

        if (TryHandleLaunchBattleTableAnimation(battler, battler, battler, animationId, argument))
            PlayerBufferExecCompleted(battler);
        else
            gBattlerControllerFuncs[battler] = CompleteOnFinishedBattleAnimation;
    }
}

static void PlayerHandleLinkStandbyMsg(u32 battler)
{
    switch (gBattleBufferA[battler][1])
    {
    case 0:
        PrintLinkStandbyMsg();
        // fall through
    case 1:
        EndBounceEffect(battler, BOUNCE_HEALTHBOX);
        EndBounceEffect(battler, BOUNCE_MON);
        break;
    case 2:
        PrintLinkStandbyMsg();
        break;
    }
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleResetActionMoveSelection(u32 battler)
{
    switch (gBattleBufferA[battler][1])
    {
    case RESET_ACTION_MOVE_SELECTION:
        gActionSelectionCursor[battler] = 0;
        gMoveSelectionCursor[battler] = 0;
        break;
    case RESET_ACTION_SELECTION:
        gActionSelectionCursor[battler] = 0;
        break;
    case RESET_MOVE_SELECTION:
        gMoveSelectionCursor[battler] = 0;
        break;
    }
    PlayerBufferExecCompleted(battler);
}

static void PlayerHandleCmd55(u32 battler)
{
    gBattleOutcome = gBattleBufferA[battler][1];
    FadeOutMapMusic(5);
    BeginFastPaletteFade(3);
    PlayerBufferExecCompleted(battler);
    gBattlerControllerFuncs[battler] = SetBattleEndCallbacks;
}

static void PlayerCmdEnd(u32 battler)
{
}

static void PreviewDeterminativeMoveTargets(u32 battler)
{
    u32 bitMask = 0;
    u8 startY = 0;

    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
    {
        u8 moveTarget;
        struct ChooseMoveStruct *moveInfo = (struct ChooseMoveStruct *)(&gBattleBufferA[battler][4]);
        u16 move = moveInfo->moves[gMoveSelectionCursor[battler]];

        if (move == MOVE_CURSE)
        {
            if (moveInfo->monType1 != TYPE_GHOST && moveInfo->monType2 != TYPE_GHOST)
                moveTarget = MOVE_TARGET_USER;
            else
                moveTarget = MOVE_TARGET_SELECTED;
        }
        else
        {
            moveTarget = gMovesInfo[moveInfo->moves[gMoveSelectionCursor[battler]]].target;
        }
        switch (moveTarget)
        {
        case MOVE_TARGET_SELECTED:
        case MOVE_TARGET_DEPENDS:
        case MOVE_TARGET_USER_OR_SELECTED:
        case MOVE_TARGET_RANDOM:
            bitMask = 0xF0000;
            startY = 0;
            break;
        case MOVE_TARGET_BOTH:
        case MOVE_TARGET_OPPONENTS_FIELD:
            bitMask = (gBitTable[GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT)]
                     | gBitTable[GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT)]) << 16;
            startY = 8;
            break;
        case MOVE_TARGET_USER:
            switch (move)
            {
            case MOVE_HAZE:
            case MOVE_SANDSTORM:
            case MOVE_PERISH_SONG:
            case MOVE_RAIN_DANCE:
            case MOVE_SUNNY_DAY:
            case MOVE_HAIL:
            case MOVE_MUD_SPORT:
            case MOVE_WATER_SPORT:
                bitMask = 0xF0000;
                break;
            case MOVE_SAFEGUARD:
            case MOVE_REFLECT:
            case MOVE_LIGHT_SCREEN:
            case MOVE_MIST:
            case MOVE_HEAL_BELL:
            case MOVE_AROMATHERAPY:
                bitMask = (gBitTable[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)]
                         | gBitTable[GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT)]) << 16;
                break;
            case MOVE_HELPING_HAND:
                bitMask = (gBitTable[GetBattlerAtPosition(GetBattlerPosition(battler) ^ BIT_FLANK)]) << 16;
                break;
            default:
                bitMask = (gBitTable[battler]) << 16;
                break;
            }
            startY = 8;
            break;
        case MOVE_TARGET_FOES_AND_ALLY:
            bitMask = (gBitTable[GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT)]
                     | gBitTable[GetBattlerAtPosition(GetBattlerPosition(battler) ^ BIT_FLANK)]
                     | gBitTable[GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT)]) << 16;
            startY = 8;
            break;
        }
        BeginNormalPaletteFade(bitMask, 8, startY, 0, RGB_WHITE);
    }
}
