#include "global.h"
#include "battle.h"
#include "battle_environment.h"
#include "battle_hold_effects.h"
#include "battle_ai_util.h"
#include "battle_util.h"
#include "battle_move_resolution.h"
#include "battle_scripts.h"
#include "battle_z_move.h"
#include "item.h"
#include "battle_controllers.h"
#include "move.h"
#include "constants/battle_move_resolution.h"

static void ValidateBattlers(void);
static enum Move GetOriginallyUsedMove(enum Move chosenMove);
static void SetSameMoveTurnValues(enum BattleMoveEffects moveEffect);
static void TryClearChargeVolatile(enum Type moveType);
static inline bool32 IsBattlerUsingBeakBlast(enum BattlerId battler);
static void RequestNonVolatileChangee(enum BattlerId battlerAtk);
static bool32 CanBattlerBounceBackMove(struct BattleContext *ctx);
static bool32 TryMagicBounce(struct BattleContext *ctx);
static bool32 TryMagicCoat(struct BattleContext *ctx);
static bool32 TryActivatePowderStatus(enum Move move);
static void CalculateMagnitudeDamage(void);

// Submoves
static enum Move GetMirrorMoveMove(void);
static enum Move GetMetronomeMove(void);
static enum Move GetAssistMove(void);
static enum Move GetSleepTalkMove(void);
static enum Move GetCopycatMove(void);
static enum Move GetMeFirstMove(void);

// ==============
// Attackcanceler
// ==============

static enum CancelerResult CancelerClearFlags(struct BattleContext *ctx)
{
    gBattleMons[ctx->battlerAtk].volatiles.grudge = FALSE;
    gBattleMons[ctx->battlerAtk].volatiles.glaiveRush = FALSE;
    gBattleStruct->eventState.atkCancelerBattler = 0;
    return CANCELER_RESULT_SUCCESS;
}

static bool32 TryFormChangeBeforeMove(void)
{
    enum Ability ability = GetBattlerAbility(gBattlerAttacker);

    if (TryBattleFormChange(gBattlerAttacker, FORM_CHANGE_BATTLE_BEFORE_MOVE, ability)
        || TryBattleFormChange(gBattlerAttacker, FORM_CHANGE_BATTLE_BEFORE_MOVE_CATEGORY, ability))
    {
        gBattleScripting.battler = gBattlerAttacker;
        BattleScriptCall(BattleScript_BattlerFormChange);
        return TRUE;
    }
    return FALSE;
}

static enum CancelerResult CancelerStanceChangeOne(struct BattleContext *ctx)
{
    if (B_STANCE_CHANGE_FAIL < GEN_7 && ctx->chosenMove == ctx->move && TryFormChangeBeforeMove())
        return CANCELER_RESULT_BREAK;
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerSkyDrop(struct BattleContext *ctx)
{
    // If Pokemon is being held in Sky Drop
    if (gBattleMons[ctx->battlerAtk].volatiles.semiInvulnerable == STATE_SKY_DROP)
    {
        gBattlescriptCurrInstr = BattleScript_MoveEnd;
        return CANCELER_RESULT_FAILURE;
    }
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerRecharge(struct BattleContext *ctx)
{
    if (gBattleMons[ctx->battlerAtk].volatiles.rechargeTimer > 0)
    {
        CancelMultiTurnMoves(ctx->battlerAtk, SKY_DROP_ATTACKCANCELER_CHECK);
        gBattlescriptCurrInstr = BattleScript_MoveUsedMustRecharge;
        return CANCELER_RESULT_FAILURE;
    }
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerChillyReception(struct BattleContext *ctx)
{
    if (GetMoveEffect(ctx->move) == EFFECT_WEATHER_AND_SWITCH)
    {
        BattleScriptCall(BattleScript_ChillyReceptionMessage);
        return CANCELER_RESULT_BREAK;
    }
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerAsleepOrFrozen(struct BattleContext *ctx)
{
    enum CancelerResult result = CANCELER_RESULT_BREAK;

    if (gBattleMons[ctx->battlerAtk].status1 & STATUS1_SLEEP)
    {
        if (UproarWakeUpCheck(ctx->battlerAtk))
        {
            TryDeactivateSleepClause(GetBattlerSide(ctx->battlerAtk), gBattlerPartyIndexes[ctx->battlerAtk]);
            gBattleMons[ctx->battlerAtk].status1 &= ~STATUS1_SLEEP;
            gBattleMons[ctx->battlerAtk].volatiles.nightmare = FALSE;
            gEffectBattler = ctx->battlerAtk;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WOKE_UP_UPROAR;
            result = CANCELER_RESULT_BREAK;
            BattleScriptCall(BattleScript_MoveUsedWokeUp);
        }
        else
        {
            u32 toSub;
            if (IsAbilityAndRecord(ctx->battlerAtk, ctx->abilityAtk, ABILITY_EARLY_BIRD))
                toSub = 2;
            else
                toSub = 1;

            if ((gBattleMons[ctx->battlerAtk].status1 & STATUS1_SLEEP) < toSub)
                gBattleMons[ctx->battlerAtk].status1 &= ~STATUS1_SLEEP;
            else
                gBattleMons[ctx->battlerAtk].status1 -= toSub;

            if (gBattleMons[ctx->battlerAtk].status1 & STATUS1_SLEEP)
            {
                enum BattleMoveEffects moveEffect = GetMoveEffect(ctx->move);
                if (moveEffect == EFFECT_SNORE)
                {
                    BattleScriptCall(BattleScript_BeforeSnoreMessage);
                    result = CANCELER_RESULT_BREAK;
                }
                else if (moveEffect == EFFECT_SLEEP_TALK)
                {
                    result = CANCELER_RESULT_BREAK;
                }
                else
                {
                    gBattlescriptCurrInstr = BattleScript_MoveUsedIsAsleep;
                    result = CANCELER_RESULT_FAILURE;
                }
            }
            else
            {
                TryDeactivateSleepClause(GetBattlerSide(ctx->battlerAtk), gBattlerPartyIndexes[ctx->battlerAtk]);
                gBattleMons[ctx->battlerAtk].volatiles.nightmare = FALSE;
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WOKE_UP;
                result = CANCELER_RESULT_BREAK;
                BattleScriptCall(BattleScript_MoveUsedWokeUp);
            }
        }
        RequestNonVolatileChangee(ctx->battlerAtk);
    }
    else if (gBattleMons[ctx->battlerAtk].status1 & STATUS1_FREEZE && !MoveThawsUser(ctx->move))
    {
        if (!RandomPercentage(RNG_FROZEN, 20))
        {
            result = CANCELER_RESULT_FAILURE;
            gBattlescriptCurrInstr = BattleScript_MoveUsedIsFrozen;
        }
        else // unfreeze
        {
            gBattleMons[ctx->battlerAtk].status1 &= ~STATUS1_FREEZE;
            result = CANCELER_RESULT_BREAK;
            BattleScriptCall(BattleScript_MoveUsedUnfroze);
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_DEFROSTED;
        }
        RequestNonVolatileChangee(ctx->battlerAtk);
    }

    return result;
}

static enum CancelerResult CancelerObedience(struct BattleContext *ctx)
{
    if (!gBattleMons[ctx->battlerAtk].volatiles.multipleTurns)
    {
        enum Obedience obedienceResult = GetAttackerObedienceForAction();
        switch (obedienceResult)
        {
        case OBEYS:
            return CANCELER_RESULT_SUCCESS;
        case DISOBEYS_LOAFS:
            // Randomly select, then print a disobedient string
            // B_MSG_LOAFING, B_MSG_WONT_OBEY, B_MSG_TURNED_AWAY, or B_MSG_PRETEND_NOT_NOTICE
            gBattleCommunication[MULTISTRING_CHOOSER] = MOD(Random(), NUM_LOAF_STRINGS);
            gBattlescriptCurrInstr = BattleScript_MoveUsedLoafingAround;
            gBattleStruct->moveResultFlags[ctx->battlerDef] |= MOVE_RESULT_MISSED;
            return CANCELER_RESULT_FAILURE;
        case DISOBEYS_HITS_SELF:
            gBattlerTarget = ctx->battlerAtk;
            struct BattleContext dmgCtx = {0};
            dmgCtx.battlerAtk = dmgCtx.battlerDef = ctx->battlerAtk;
            dmgCtx.move = dmgCtx.chosenMove = MOVE_NONE;
            dmgCtx.moveType = TYPE_MYSTERY;
            dmgCtx.isCrit = FALSE;
            dmgCtx.randomFactor = FALSE;
            dmgCtx.updateFlags = TRUE;
            dmgCtx.isSelfInflicted = TRUE;
            dmgCtx.fixedBasePower = 40;
            gBattleStruct->moveDamage[ctx->battlerAtk] = CalculateMoveDamage(&dmgCtx);
            gBattlescriptCurrInstr = BattleScript_IgnoresAndHitsItself;
            return CANCELER_RESULT_FAILURE; // Move doesn't fail but mon hits itself
        case DISOBEYS_FALL_ASLEEP:
            if (IsSleepClauseEnabled())
                gBattleStruct->battlerState[ctx->battlerAtk].sleepClauseEffectExempt = TRUE;
            gBattlescriptCurrInstr = BattleScript_IgnoresAndFallsAsleep;
            gBattleStruct->moveResultFlags[ctx->battlerDef] |= MOVE_RESULT_MISSED;
            return CANCELER_RESULT_FAILURE;
            break;
        case DISOBEYS_WHILE_ASLEEP:
            gBattlescriptCurrInstr = BattleScript_IgnoresWhileAsleep;
            gBattleStruct->moveResultFlags[ctx->battlerDef] |= MOVE_RESULT_MISSED;
            return CANCELER_RESULT_FAILURE;
        case DISOBEYS_RANDOM_MOVE:
            gCurrentMove = gCalledMove = gBattleMons[ctx->battlerAtk].moves[gCurrMovePos];
            BattleScriptCall(BattleScript_IgnoresAndUsesRandomMove);
            gBattlerTarget = GetBattleMoveTarget(gCalledMove, TARGET_NONE);
            return CANCELER_RESULT_BREAK;
        }
    }
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerPowerPoints(struct BattleContext *ctx)
{
    if (gBattleMons[ctx->battlerAtk].pp[gCurrMovePos] == 0
     && ctx->move != MOVE_STRUGGLE
     && !gSpecialStatuses[ctx->battlerAtk].dancerUsedMove
     && !gBattleMons[ctx->battlerAtk].volatiles.multipleTurns)
    {
        gBattlescriptCurrInstr = BattleScript_NoPPForMove;
        gBattleStruct->moveResultFlags[ctx->battlerDef] |= MOVE_RESULT_MISSED;
        return CANCELER_RESULT_FAILURE;
    }

    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerTruant(struct BattleContext *ctx)
{
    if (GetBattlerAbility(ctx->battlerAtk) == ABILITY_TRUANT && gBattleMons[ctx->battlerAtk].volatiles.truantCounter)
    {
        CancelMultiTurnMoves(ctx->battlerAtk, SKY_DROP_ATTACKCANCELER_CHECK);
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_LOAFING;
        gBattlerAbility = ctx->battlerAtk;
        gBattlescriptCurrInstr = BattleScript_TruantLoafingAround;
        gBattleStruct->moveResultFlags[ctx->battlerDef] |= MOVE_RESULT_MISSED;
        return CANCELER_RESULT_FAILURE;
    }
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerFocus(struct BattleContext *ctx)
{
    u32 focusPunchFailureConfig = GetConfig(CONFIG_FOCUS_PUNCH_FAILURE);

    // In Gens 3-4, only check if is using Focus Punch.
    // In Gens 5-6, only check if the chosen move is Focus Punch.
    // In Gens 7+, check if chose and is using Focus Punch.
    if ((gProtectStructs[ctx->battlerAtk].physicalDmg || gProtectStructs[ctx->battlerAtk].specialDmg)
     && (focusPunchFailureConfig < GEN_5 || GetMoveEffect(gChosenMoveByBattler[ctx->battlerAtk]) == EFFECT_FOCUS_PUNCH)
     && (focusPunchFailureConfig == GEN_5 || focusPunchFailureConfig == GEN_6 || GetMoveEffect(ctx->move) == EFFECT_FOCUS_PUNCH)
     && !gProtectStructs[ctx->battlerAtk].survivedOHKO)
    {
        CancelMultiTurnMoves(ctx->battlerAtk, SKY_DROP_ATTACKCANCELER_CHECK);
        gBattlescriptCurrInstr = BattleScript_FocusPunchLostFocus;
        return CANCELER_RESULT_FAILURE;
    }
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerFocusPreGen5(struct BattleContext *ctx)
{
    if (GetConfig(CONFIG_FOCUS_PUNCH_FAILURE) < GEN_5)
        return CancelerFocus(ctx);
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerFocusGen5(struct BattleContext *ctx)
{
    if (GetConfig(CONFIG_FOCUS_PUNCH_FAILURE) >= GEN_5)
        return CancelerFocus(ctx);
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerFlinch(struct BattleContext *ctx)
{
    if (gBattleMons[ctx->battlerAtk].volatiles.flinched)
    {
        CancelMultiTurnMoves(ctx->battlerAtk, SKY_DROP_ATTACKCANCELER_CHECK);
        gBattlescriptCurrInstr = BattleScript_MoveUsedFlinched;
        return CANCELER_RESULT_FAILURE;
    }
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerDisabled(struct BattleContext *ctx)
{
    if (GetActiveGimmick(ctx->battlerAtk) != GIMMICK_Z_MOVE
     && gBattleMons[ctx->battlerAtk].volatiles.disabledMove == ctx->move
     && gBattleMons[ctx->battlerAtk].volatiles.disabledMove != MOVE_NONE)
    {
        gBattleScripting.battler = ctx->battlerAtk;
        CancelMultiTurnMoves(ctx->battlerAtk, SKY_DROP_ATTACKCANCELER_CHECK);
        gBattlescriptCurrInstr = BattleScript_MoveUsedIsDisabled;
        return CANCELER_RESULT_FAILURE;
    }
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerVolatileBlocked(struct BattleContext *ctx)
{
    if (GetActiveGimmick(ctx->battlerAtk) != GIMMICK_Z_MOVE
     && gBattleMons[ctx->battlerAtk].volatiles.healBlock
     && IsHealBlockPreventingMove(ctx->battlerAtk, ctx->move))
    {
        gBattleScripting.battler = ctx->battlerAtk;
        CancelMultiTurnMoves(ctx->battlerAtk, SKY_DROP_ATTACKCANCELER_CHECK);
        gBattlescriptCurrInstr = BattleScript_MoveUsedHealBlockPrevents;
        return CANCELER_RESULT_FAILURE;
    }
    else if (gFieldStatuses & STATUS_FIELD_GRAVITY && IsGravityPreventingMove(ctx->move))
    {
        gBattleScripting.battler = ctx->battlerAtk;
        CancelMultiTurnMoves(ctx->battlerAtk, SKY_DROP_ATTACKCANCELER_CHECK);
        gBattlescriptCurrInstr = BattleScript_MoveUsedGravityPrevents;
        return CANCELER_RESULT_FAILURE;
    }
    else if (GetActiveGimmick(ctx->battlerAtk) != GIMMICK_Z_MOVE && gBattleMons[ctx->battlerAtk].volatiles.throatChopTimer > 0 && IsSoundMove(ctx->move))
    {
        CancelMultiTurnMoves(ctx->battlerAtk, SKY_DROP_ATTACKCANCELER_CHECK);
        gBattlescriptCurrInstr = BattleScript_MoveUsedIsThroatChopPrevented;
        return CANCELER_RESULT_FAILURE;
    }
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerTaunted(struct BattleContext *ctx)
{
    if (GetActiveGimmick(ctx->battlerAtk) != GIMMICK_Z_MOVE && gBattleMons[ctx->battlerAtk].volatiles.tauntTimer && IsBattleMoveStatus(ctx->move))
    {
        CancelMultiTurnMoves(ctx->battlerAtk, SKY_DROP_ATTACKCANCELER_CHECK);
        gBattlescriptCurrInstr = BattleScript_MoveUsedIsTaunted;
        return CANCELER_RESULT_FAILURE;
    }
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerImprisoned(struct BattleContext *ctx)
{
    if (GetActiveGimmick(ctx->battlerAtk) != GIMMICK_Z_MOVE && GetImprisonedMovesCount(ctx->battlerAtk, ctx->move))
    {
        CancelMultiTurnMoves(ctx->battlerAtk, SKY_DROP_ATTACKCANCELER_CHECK);
        gBattlescriptCurrInstr = BattleScript_MoveUsedIsImprisoned;
        return CANCELER_RESULT_FAILURE;
    }
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerConfused(struct BattleContext *ctx)
{
    if (gBattleMons[ctx->battlerAtk].volatiles.confusionTurns)
    {
        if (!gBattleMons[ctx->battlerAtk].volatiles.infiniteConfusion)
            gBattleMons[ctx->battlerAtk].volatiles.confusionTurns--;
        if (gBattleMons[ctx->battlerAtk].volatiles.confusionTurns)
        {
             // confusion dmg
            if (RandomPercentage(RNG_CONFUSION, (GetConfig(CONFIG_CONFUSION_SELF_DMG_CHANCE) >= GEN_7 ? 33 : 50)))
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = TRUE;
                gBattlerTarget = gBattlerAttacker;
                struct BattleContext dmgCtx = {0};
                dmgCtx.battlerAtk = dmgCtx.battlerDef = ctx->battlerAtk;
                dmgCtx.move = dmgCtx.chosenMove = MOVE_NONE;
                dmgCtx.moveType = TYPE_MYSTERY;
                dmgCtx.isCrit = FALSE;
                dmgCtx.randomFactor = FALSE;
                dmgCtx.updateFlags = TRUE;
                dmgCtx.isSelfInflicted = TRUE;
                dmgCtx.fixedBasePower = 40;
                gBattleStruct->passiveHpUpdate[ctx->battlerAtk] = CalculateMoveDamage(&dmgCtx);
                gBattlescriptCurrInstr = BattleScript_MoveUsedIsConfused;
                return CANCELER_RESULT_FAILURE;
            }
            else
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = FALSE;
                BattleScriptCall(BattleScript_MoveUsedIsConfused);
                return CANCELER_RESULT_BREAK;
            }
        }
        else // snapped out of confusion
        {
            BattleScriptCall(BattleScript_MoveUsedIsConfusedNoMore);
            return CANCELER_RESULT_BREAK;
        }
    }
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerGhost(struct BattleContext *ctx) // GHOST in pokemon tower
{
    if (IsGhostBattleWithoutScope())
    {
        if (GetBattlerSide(ctx->battlerAtk) == B_SIDE_PLAYER)
            gBattlescriptCurrInstr = BattleScript_TooScaredToMove;
        else
            gBattlescriptCurrInstr = BattleScript_GhostGetOutGetOut;
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
        return CANCELER_RESULT_FAILURE;
    }
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerParalyzed(struct BattleContext *ctx)
{
    if (gBattleMons[ctx->battlerAtk].status1 & STATUS1_PARALYSIS
        && !(B_MAGIC_GUARD == GEN_4 && IsAbilityAndRecord(ctx->battlerAtk, ctx->abilityAtk, ABILITY_MAGIC_GUARD))
        && !RandomPercentage(RNG_PARALYSIS, 75))
    {
        CancelMultiTurnMoves(gBattlerAttacker, SKY_DROP_ATTACKCANCELER_CHECK);
        gBattlescriptCurrInstr = BattleScript_MoveUsedIsParalyzed;
        return CANCELER_RESULT_FAILURE;
    }
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerInfatuation(struct BattleContext *ctx)
{
    if (gBattleMons[ctx->battlerAtk].volatiles.infatuation)
    {
        gBattleScripting.battler = gBattleMons[ctx->battlerAtk].volatiles.infatuation - 1;
        if (!RandomPercentage(RNG_INFATUATION, 50))
        {
            BattleScriptCall(BattleScript_MoveUsedIsInLove);
            return CANCELER_RESULT_BREAK;
        }
        else
        {
            BattleScriptPush(BattleScript_MoveUsedIsInLoveCantAttack);
            CancelMultiTurnMoves(ctx->battlerAtk, SKY_DROP_ATTACKCANCELER_CHECK);
            gBattlescriptCurrInstr = BattleScript_MoveUsedIsInLove;
            return CANCELER_RESULT_FAILURE;
        }
    }
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerBide(struct BattleContext *ctx)
{
    if (gBattleMons[ctx->battlerAtk].volatiles.bideTurns)
    {
        if (--gBattleMons[ctx->battlerAtk].volatiles.bideTurns)
        {
            gBattlescriptCurrInstr = BattleScript_BideStoringEnergy;
        }
        else
        {
            // This is removed in FRLG and Emerald for some reason
            //gBattleMons[gBattlerAttacker].volatiles.multipleTurns = FALSE;
            if (gBideDmg[ctx->battlerAtk])
            {
                gCurrentMove = MOVE_BIDE;
                gBattlerTarget = gBideTarget[ctx->battlerAtk];
                if (!IsBattlerAlive(ctx->battlerDef))
                    gBattlerTarget = GetBattleMoveTarget(MOVE_BIDE, TARGET_SELECTED);
                gBattlescriptCurrInstr = BattleScript_BideAttack;
                return CANCELER_RESULT_BREAK; // Jumps to a different script but no failure
            }
            else
            {
                gBattlescriptCurrInstr = BattleScript_BideNoEnergyToAttack;
                return CANCELER_RESULT_FAILURE;
            }
        }
    }
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerZMoves(struct BattleContext *ctx)
{
    if (GetActiveGimmick(ctx->battlerAtk) == GIMMICK_Z_MOVE)
    {
        // attacker has a queued z move
        RecordItemEffectBattle(ctx->battlerAtk, HOLD_EFFECT_Z_CRYSTAL);
        SetGimmickAsActivated(ctx->battlerAtk, GIMMICK_Z_MOVE);

        gBattleScripting.battler = ctx->battlerAtk;
        if (GetMoveCategory(ctx->move) == DAMAGE_CATEGORY_STATUS)
            BattleScriptCall(BattleScript_ZMoveActivateStatus);
        else
            BattleScriptCall(BattleScript_ZMoveActivateDamaging);

        return CANCELER_RESULT_BREAK;
    }
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerChoiceLock(struct BattleContext *ctx)
{
    enum Move *choicedMoveAtk = &gBattleStruct->choicedMove[ctx->battlerAtk];
    enum HoldEffect holdEffect = GetBattlerHoldEffect(ctx->battlerAtk);

    if (gChosenMove != MOVE_STRUGGLE
     && (*choicedMoveAtk == MOVE_NONE || *choicedMoveAtk == MOVE_UNAVAILABLE)
     && (IsHoldEffectChoice(holdEffect) || ctx->abilityAtk == ABILITY_GORILLA_TACTICS))
        *choicedMoveAtk = gChosenMove;

    u32 moveIndex;
    for (moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
    {
        if (gBattleMons[ctx->battlerAtk].moves[moveIndex] == *choicedMoveAtk)
            break;
    }

    if (moveIndex == MAX_MON_MOVES)
        *choicedMoveAtk = MOVE_NONE;

    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerCallSubmove(struct BattleContext *ctx)
{
    bool32 noEffect = FALSE;
    enum Move calledMove = MOVE_NONE;
    const u8 *battleScript = NULL;
    battleScript = BattleScript_SubmoveAttackstring;

    switch(GetMoveEffect(ctx->move))
    {
    case EFFECT_MIRROR_MOVE:
        calledMove = GetMirrorMoveMove();
        break;
    case EFFECT_METRONOME:
        calledMove = GetMetronomeMove();
        battleScript = BattleScript_MetronomeAttackstring;
        break;
    case EFFECT_ASSIST:
        calledMove = GetAssistMove();
        break;
    case EFFECT_NATURE_POWER:
        calledMove = GetNaturePowerMove();
        battleScript = BattleScript_NaturePowerAttackstring;
        break;
    case EFFECT_SLEEP_TALK:
        calledMove = GetSleepTalkMove();
        battleScript = BattleScript_SleepTalkAttackstring;
        break;
    case EFFECT_COPYCAT:
        calledMove = GetCopycatMove();
        break;
    case EFFECT_ME_FIRST:
        calledMove = GetMeFirstMove();
        break;
    default:
        noEffect = TRUE;
        break;
    }

    if (noEffect)
    {
        gBattleStruct->submoveAnnouncement = SUBMOVE_NO_EFFECT;
        return CANCELER_RESULT_SUCCESS;
    }

    if (calledMove != MOVE_NONE)
    {
        if (GetActiveGimmick(ctx->battlerAtk) == GIMMICK_Z_MOVE && !IsBattleMoveStatus(calledMove))
            calledMove = GetTypeBasedZMove(calledMove);
        if (GetMoveEffect(ctx->move) == EFFECT_COPYCAT && IsMaxMove(calledMove))
            calledMove = gBattleStruct->dynamax.lastUsedBaseMove;

        gBattleStruct->submoveAnnouncement = SUBMOVE_SUCCESS;
        gCalledMove = calledMove;
        BattleScriptCall(battleScript);
        return CANCELER_RESULT_BREAK;
    }

    gBattleStruct->submoveAnnouncement = SUBMOVE_FAILURE;
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerThaw(struct BattleContext *ctx)
{
    enum CancelerResult result = CANCELER_RESULT_BREAK;

    if (gBattleMons[ctx->battlerAtk].status1 & STATUS1_FREEZE)
    {
        if (!(IsMoveEffectRemoveSpeciesType(ctx->move, MOVE_EFFECT_REMOVE_ARG_TYPE, TYPE_FIRE) && !IS_BATTLER_OF_TYPE(ctx->battlerAtk, TYPE_FIRE)))
        {
            gBattleMons[ctx->battlerAtk].status1 &= ~STATUS1_FREEZE;
            result = CANCELER_RESULT_BREAK;
            BattleScriptCall(BattleScript_MoveUsedUnfroze);
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_DEFROSTED_BY_MOVE;
        }
        else
        {
            result = CANCELER_RESULT_FAILURE;
        }
        RequestNonVolatileChangee(ctx->battlerAtk);
    }
    else if (gBattleMons[ctx->battlerAtk].status1 & STATUS1_FROSTBITE && MoveThawsUser(ctx->move))
    {
        if (!(IsMoveEffectRemoveSpeciesType(ctx->move, MOVE_EFFECT_REMOVE_ARG_TYPE, TYPE_FIRE) && !IS_BATTLER_OF_TYPE(ctx->battlerAtk, TYPE_FIRE)))
        {
            gBattleMons[ctx->battlerAtk].status1 &= ~STATUS1_FROSTBITE;
            result = CANCELER_RESULT_BREAK;
            BattleScriptCall(BattleScript_MoveUsedUnfrostbite);
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_FROSTBITE_HEALED_BY_MOVE;
        }
        else
        {
            result = CANCELER_RESULT_FAILURE;
        }
        RequestNonVolatileChangee(ctx->battlerAtk);
    }
    return result;
}

static enum CancelerResult CancelerStanceChangeTwo(struct BattleContext *ctx)
{
    if (B_STANCE_CHANGE_FAIL >= GEN_7 && gChosenMove == ctx->move && TryFormChangeBeforeMove())
        return CANCELER_RESULT_BREAK;
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerAttackstring(struct BattleContext *ctx)
{
    BattleScriptCall(BattleScript_Attackstring);
    if (!gSpecialStatuses[gBattlerAttacker].dancerUsedMove)
    {
        gBattleMons[gBattlerAttacker].volatiles.usedMoves |= 1u << gCurrMovePos;
        gBattleStruct->battlerState[gBattlerAttacker].lastMoveTarget = gBattlerTarget;
        gLastPrintedMoves[gBattlerAttacker] = gChosenMove;
        RecordKnownMove(gBattlerAttacker, gChosenMove);
    }
    return CANCELER_RESULT_BREAK;
}

static enum CancelerResult CancelerPPDeduction(struct BattleContext *ctx)
{
    if (gBattleMons[ctx->battlerAtk].volatiles.multipleTurns
     || gSpecialStatuses[ctx->battlerAtk].dancerUsedMove
     || ctx->move == MOVE_STRUGGLE)
        return CANCELER_RESULT_SUCCESS;

    s32 ppToDeduct = 1;
    enum MoveTarget moveTarget = GetBattlerMoveTargetType(ctx->battlerAtk, ctx->move);
    u32 movePosition = gCurrMovePos;

    if (gBattleStruct->submoveAnnouncement == SUBMOVE_SUCCESS)
        movePosition = gChosenMovePos;

    if (IsSpreadMove(moveTarget)
     || moveTarget == TARGET_ALL_BATTLERS
     || moveTarget == TARGET_FIELD
     || MoveForcesPressure(ctx->move))
    {
        for (u32 i = 0; i < gBattlersCount; i++)
        {
            if (!IsBattlerAlly(i, ctx->battlerAtk) && IsBattlerAlive(i))
                ppToDeduct += (GetBattlerAbility(i) == ABILITY_PRESSURE);
        }
    }
    else if (moveTarget != TARGET_OPPONENTS_FIELD)
    {
        if (ctx->battlerAtk != ctx->battlerDef && GetBattlerAbility(ctx->battlerDef) == ABILITY_PRESSURE)
             ppToDeduct++;
    }

    // For item Metronome, echoed voice
    if (ctx->move != gLastResultingMoves[ctx->battlerAtk] || gBattleStruct->unableToUseMove)
        gBattleMons[ctx->battlerAtk].volatiles.metronomeItemCounter = 0;

    if (gBattleMons[ctx->battlerAtk].pp[movePosition] > ppToDeduct)
        gBattleMons[ctx->battlerAtk].pp[movePosition] -= ppToDeduct;
    else
        gBattleMons[ctx->battlerAtk].pp[movePosition] = 0;

    if (MOVE_IS_PERMANENT(ctx->battlerAtk, movePosition))
    {
        BtlController_EmitSetMonData(
            ctx->battlerAtk,
            B_COMM_TO_CONTROLLER,
            REQUEST_PPMOVE1_BATTLE + movePosition,
            0,
            sizeof(gBattleMons[ctx->battlerAtk].pp[movePosition]),
            &gBattleMons[ctx->battlerAtk].pp[movePosition]);
        MarkBattlerForControllerExec(ctx->battlerAtk);
    }

    if (gBattleStruct->submoveAnnouncement != SUBMOVE_NO_EFFECT)
    {
        if (gBattleStruct->submoveAnnouncement == SUBMOVE_FAILURE)
        {
            gBattleStruct->submoveAnnouncement = SUBMOVE_NO_EFFECT;
            gBattlescriptCurrInstr = BattleScript_ButItFailed;
            return CANCELER_RESULT_FAILURE;
        }
        else if (CancelerVolatileBlocked(ctx) == CANCELER_RESULT_FAILURE) // Check Gravity/Heal Block/Throat Chop for Submove
        {
            gBattleStruct->submoveAnnouncement = SUBMOVE_NO_EFFECT;
            return CANCELER_RESULT_FAILURE;
        }
        else
        {
            gBattleStruct->submoveAnnouncement = SUBMOVE_NO_EFFECT;
            gBattlerTarget = GetBattleMoveTarget(ctx->move, TARGET_NONE);
            gBattleScripting.animTurn = 0;
            gBattleScripting.animTargetsHit = 0;

            // Possibly better to just move type setting and redirection to attackcanceler as a new case at this point
            SetTypeBeforeUsingMove(ctx->move, ctx->battlerAtk);
            DetermineTarget(moveTarget, FALSE);
            ClearDamageCalcResults();
            gBattlescriptCurrInstr = GetMoveBattleScript(ctx->move);
            return CANCELER_RESULT_BREAK;
        }
    }

    return CANCELER_RESULT_SUCCESS;
}

// We don't have clear data on where this belongs to but I assume it should at least be checked before Protean
static enum CancelerResult CancelerSkyBattle(struct BattleContext *ctx)
{
    if (gBattleStruct->isSkyBattle && IsMoveSkyBattleBanned(gCurrentMove))
    {
        CancelMultiTurnMoves(ctx->battlerAtk, SKY_DROP_ATTACKCANCELER_CHECK);
        gBattlescriptCurrInstr = BattleScript_ButItFailed;
        return CANCELER_RESULT_FAILURE;
    }
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerWeatherPrimal(struct BattleContext *ctx)
{
    enum CancelerResult result = CANCELER_RESULT_SUCCESS;

    if (GetMovePower(ctx->move) > 0 && HasWeatherEffect())
    {
        enum Type moveType = GetBattleMoveType(ctx->move);
        if (moveType == TYPE_FIRE && gBattleWeather & B_WEATHER_RAIN_PRIMAL && (GetConfig(CONFIG_POWDER_STATUS_HEAVY_RAIN) >= GEN_7 || !TryActivatePowderStatus(ctx->move)))
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_PRIMAL_WEATHER_FIZZLED_BY_RAIN;
            result = CANCELER_RESULT_FAILURE;
        }
        else if (moveType == TYPE_WATER && gBattleWeather & B_WEATHER_SUN_PRIMAL)
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_PRIMAL_WEATHER_EVAPORATED_IN_SUN;
            result = CANCELER_RESULT_FAILURE;
        }
        if (result == CANCELER_RESULT_FAILURE)
        {
            gProtectStructs[ctx->battlerAtk].chargingTurn = FALSE;
            CancelMultiTurnMoves(ctx->battlerAtk, SKY_DROP_ATTACKCANCELER_CHECK);
            gBattlescriptCurrInstr = BattleScript_PrimalWeatherBlocksMove;
        }
    }

    return result;
}

static enum CancelerResult CancelerMoveFailure(struct BattleContext *ctx)
{
    const u8 *battleScript = NULL;

    switch (GetMoveEffect(ctx->move))
    {
    case EFFECT_FAIL_IF_NOT_ARG_TYPE:
        if (!IS_BATTLER_OF_TYPE(ctx->battlerAtk, GetMoveArgType(ctx->move)))
            battleScript = BattleScript_ButItFailed;
        break;
    case EFFECT_AURA_WHEEL:
        if (gBattleMons[ctx->battlerAtk].species != SPECIES_MORPEKO_FULL_BELLY
         && gBattleMons[ctx->battlerAtk].species != SPECIES_MORPEKO_HANGRY)
            battleScript = BattleScript_PokemonCantUseTheMove;
        break;
    case EFFECT_AURORA_VEIL:
        if (!(gBattleWeather & B_WEATHER_ICY_ANY && HasWeatherEffect()))
            battleScript = BattleScript_ButItFailed;
        break;
    case EFFECT_CLANGOROUS_SOUL:
        if (gBattleMons[ctx->battlerAtk].hp <= max(1, GetNonDynamaxMaxHP(ctx->battlerAtk) / 3))
            battleScript = BattleScript_ButItFailed;
        break;
    case EFFECT_REFLECT_DAMAGE:
    {
        enum DamageCategory reflectCategory = GetReflectDamageMoveDamageCategory(ctx->battlerAtk, ctx->move);
        if (IsBattlerAlly(ctx->battlerAtk, ctx->battlerDef))
            battleScript = BattleScript_ButItFailed;
        // Counter / Metal Burst and took physical damage
        else if (reflectCategory == DAMAGE_CATEGORY_PHYSICAL
              && gProtectStructs[ctx->battlerAtk].physicalDmg > 0
              && (GetConfig(CONFIG_COUNTER_TRY_HIT_PARTNER) >= GEN_5 || gBattleMons[gProtectStructs[ctx->battlerAtk].physicalBattlerId].hp))
            break;
        // Mirror Coat / Metal Burst and took special damage
        else if (reflectCategory == DAMAGE_CATEGORY_SPECIAL
              && gProtectStructs[ctx->battlerAtk].specialDmg > 0
              && (GetConfig(CONFIG_COUNTER_TRY_HIT_PARTNER) >= GEN_5 || gBattleMons[gProtectStructs[ctx->battlerAtk].specialBattlerId].hp))
            break;
        else
            battleScript = BattleScript_ButItFailed;
        break;
    }
    case EFFECT_DESTINY_BOND:
        if (DoesDestinyBondFail(ctx->battlerAtk))
            battleScript = BattleScript_ButItFailed;
        break;
    case EFFECT_FIRST_TURN_ONLY:
        if (!gBattleStruct->battlerState[ctx->battlerAtk].isFirstTurn || gSpecialStatuses[ctx->battlerAtk].instructedChosenTarget)
            battleScript = BattleScript_ButItFailed;
        break;
    case EFFECT_MAT_BLOCK:
        if (!gBattleStruct->battlerState[ctx->battlerAtk].isFirstTurn || gSpecialStatuses[ctx->battlerAtk].instructedChosenTarget)
            battleScript = BattleScript_ButItFailed;
        break;
    case EFFECT_FLING:
        if (!CanFling(ctx->battlerAtk))
            battleScript = BattleScript_ButItFailed;
        else if (!IsBattlerAlive(ctx->battlerDef)) // Edge case for removing a mon's item when there is no target available after using Fling.
            battleScript = BattleScript_FlingFailConsumeItem;
        break;
    case EFFECT_FOLLOW_ME:
        if (B_UPDATED_MOVE_DATA >= GEN_8 && !(gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
            battleScript = BattleScript_ButItFailed;
        break;
    case EFFECT_FUTURE_SIGHT:
        if (gBattleStruct->futureSight[ctx->battlerDef].counter > 0)
            battleScript = BattleScript_ButItFailed;
        break;
    case EFFECT_LAST_RESORT:
        if (!CanUseLastResort(ctx->battlerAtk))
            battleScript = BattleScript_ButItFailed;
        break;
    case EFFECT_NO_RETREAT:
        if (gBattleMons[ctx->battlerDef].volatiles.noRetreat)
            battleScript = BattleScript_ButItFailed;
        break;
    case EFFECT_POLTERGEIST:
        if (gBattleMons[ctx->battlerDef].item == ITEM_NONE
         || gFieldStatuses & STATUS_FIELD_MAGIC_ROOM
         || ctx->abilityDef == ABILITY_KLUTZ)
            battleScript = BattleScript_ButItFailed;
        break;
    case EFFECT_PROTECT:
    case EFFECT_ENDURE:
        TryResetConsecutiveUseCounter(gBattlerAttacker);
        if (IsLastMonToMove(ctx->battlerAtk))
        {
            battleScript = BattleScript_ButItFailed;
        }
        else
        {
            enum ProtectMethod protectMethod = GetMoveProtectMethod(ctx->move);
            bool32 canUseProtectSecondTime = CanUseMoveConsecutively(ctx->battlerAtk);
            bool32 canUseWideGuard = (GetConfig(CONFIG_WIDE_GUARD) >= GEN_6 && protectMethod == PROTECT_WIDE_GUARD);
            bool32 canUseQuickGuard = (GetConfig(CONFIG_QUICK_GUARD) >= GEN_6 && protectMethod == PROTECT_QUICK_GUARD);

            if (!canUseProtectSecondTime
             && !canUseWideGuard
             && !canUseQuickGuard
             && protectMethod != PROTECT_CRAFTY_SHIELD)
                battleScript = BattleScript_ButItFailed;
        }
        if (battleScript != NULL)
        {
            gBattleMons[gBattlerAttacker].volatiles.consecutiveMoveUses = 0;
            gBattleStruct->battlerState[gBattlerAttacker].stompingTantrumTimer = 2;
        }
        break;
    case EFFECT_REST:
        if (gBattleMons[ctx->battlerAtk].status1 & STATUS1_SLEEP
         || ctx->abilityAtk == ABILITY_COMATOSE)
            battleScript = BattleScript_RestIsAlreadyAsleep;
        else if (gBattleMons[ctx->battlerAtk].hp == gBattleMons[ctx->battlerAtk].maxHP)
            battleScript = BattleScript_AlreadyAtFullHp;
        else if (ctx->abilityAtk == ABILITY_INSOMNIA
              || ctx->abilityAtk == ABILITY_VITAL_SPIRIT
              || ctx->abilityAtk == ABILITY_PURIFYING_SALT)
            battleScript = BattleScript_InsomniaProtects;
        break;
    case EFFECT_SUCKER_PUNCH:
        if (HasBattlerActedThisTurn(ctx->battlerDef)
         || (IsBattleMoveStatus(GetBattlerChosenMove(ctx->battlerDef)) && !gProtectStructs[ctx->battlerDef].noValidMoves))
            battleScript = BattleScript_ButItFailed;
        break;
    case EFFECT_UPPER_HAND:
    {
        s32 prio = GetChosenMovePriority(ctx->battlerDef, GetBattlerAbility(ctx->battlerDef));
        if (prio < 1 || prio > 3 // Fails if priority is less than 1 or greater than 3, if target already moved, or if using a status
         || HasBattlerActedThisTurn(ctx->battlerDef)
         || gChosenMoveByBattler[ctx->battlerDef] == MOVE_NONE
         || IsBattleMoveStatus(gChosenMoveByBattler[ctx->battlerDef]))
            battleScript = BattleScript_ButItFailed;
        break;
    }
    case EFFECT_SNORE:
        if (!(gBattleMons[ctx->battlerAtk].status1 & STATUS1_SLEEP)
         && ctx->abilityAtk != ABILITY_COMATOSE)
            battleScript = BattleScript_ButItFailed;
        break;
    case EFFECT_STEEL_ROLLER:
        if (!(gFieldStatuses & STATUS_FIELD_TERRAIN_ANY))
            battleScript = BattleScript_ButItFailed;
        break;
    case EFFECT_STOCKPILE:
        if (gBattleMons[ctx->battlerAtk].volatiles.stockpileCounter >= 3)
            battleScript = BattleScript_ButItFailed;
        break;
    case EFFECT_STUFF_CHEEKS:
        if (GetItemPocket(gBattleMons[ctx->battlerAtk].item) != POCKET_BERRIES)
            battleScript = BattleScript_ButItFailed;
        break;
    case EFFECT_SWALLOW:
    case EFFECT_SPIT_UP:
        if (gBattleMons[ctx->battlerAtk].volatiles.stockpileCounter == 0 && !gBattleStruct->snatchedMoveIsUsed)
            battleScript = BattleScript_ButItFailed;
        break;
    case EFFECT_TELEPORT:
        // TODO: follow up: Can't make sense of teleport logic
        break;
    case EFFECT_LOW_KICK:
    case EFFECT_HEAT_CRASH:
        if (GetActiveGimmick(ctx->battlerDef) == GIMMICK_DYNAMAX)
            battleScript = BattleScript_MoveBlockedByDynamax;
        break;
    case EFFECT_NATURAL_GIFT:
        if (GetItemPocket(gBattleMons[ctx->battlerAtk].item) != POCKET_BERRIES
         || gFieldStatuses & STATUS_FIELD_MAGIC_ROOM
         || ctx->abilityAtk == ABILITY_KLUTZ
         || gBattleMons[ctx->battlerAtk].volatiles.embargo)
            battleScript = BattleScript_ButItFailed;
        break;
    default:
        break;
    }

    if (battleScript != NULL)
    {
        gBattlescriptCurrInstr = battleScript;
        return CANCELER_RESULT_FAILURE;
    }

    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerPowderStatus(struct BattleContext *ctx)
{
    if (TryActivatePowderStatus(ctx->move))
    {
        if (!IsAbilityAndRecord(ctx->battlerAtk, ctx->abilityAtk, ABILITY_MAGIC_GUARD))
            SetPassiveDamageAmount(ctx->battlerAtk, GetNonDynamaxMaxHP(ctx->battlerAtk) / 4);

        // This might be incorrect
        if (GetActiveGimmick(ctx->battlerAtk) != GIMMICK_Z_MOVE
         || HasTrainerUsedGimmick(ctx->battlerAtk, GIMMICK_Z_MOVE))
            gBattlescriptCurrInstr = BattleScript_MoveUsedPowder;
        return CANCELER_RESULT_FAILURE;
    }
    return CANCELER_RESULT_SUCCESS;
}

bool32 IsDazzlingAbility(enum Ability ability)
{
    switch (ability)
    {
    case ABILITY_DAZZLING:        return TRUE;
    case ABILITY_QUEENLY_MAJESTY: return TRUE;
    case ABILITY_ARMOR_TAIL:      return TRUE;
    default: break;
    }
    return FALSE;
}

static enum CancelerResult CancelerPriorityBlock(struct BattleContext *ctx)
{
    bool32 effect = FALSE;
    s32 priority = GetChosenMovePriority(ctx->battlerAtk, ctx->abilityAtk);

    if (priority <= 0)
        return CANCELER_RESULT_SUCCESS;

    enum BattlerId battler;
    enum Ability ability = ABILITY_NONE; // ability of battler who is blocking
    bool32 isSpreadMove = IsSpreadMove(GetBattlerMoveTargetType(ctx->battlerAtk, ctx->move));
    for (battler = 0; battler < gBattlersCount; battler++)
    {
        if (!IsBattlerAlive(battler) || IsBattlerAlly(ctx->battlerAtk, battler))
            continue;
        if (!isSpreadMove && !IsBattlerAlly(battler, ctx->battlerDef))
            continue;

        ability = GetBattlerAbility(battler);
        if (IsDazzlingAbility(ability))
        {
            effect = TRUE;
            break;
        }
    }

    if (effect)
    {
        gLastUsedAbility = ability;
        RecordAbilityBattle(battler, ability);
        gBattleScripting.battler = gBattlerAbility = battler;
        gBattlescriptCurrInstr = BattleScript_DazzlingProtected;
        return CANCELER_RESULT_FAILURE;
    }

    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerProtean(struct BattleContext *ctx)
{
    enum Type moveType = GetBattleMoveType(ctx->move);
    if (ProteanTryChangeType(ctx->battlerAtk, ctx->abilityAtk, ctx->move, moveType))
    {
        if (GetConfig(CONFIG_PROTEAN_LIBERO) >= GEN_9)
            gBattleMons[ctx->battlerAtk].volatiles.usedProteanLibero = TRUE;
        PREPARE_TYPE_BUFFER(gBattleTextBuff1, moveType);
        gBattlerAbility = ctx->battlerAtk;
        PrepareStringBattle(STRINGID_EMPTYSTRING3, ctx->battlerAtk);
        gBattleCommunication[MSG_DISPLAY] = 1;
        BattleScriptCall(BattleScript_ProteanActivates);
        return CANCELER_RESULT_BREAK;
    }
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerExplodingDamp(struct BattleContext *ctx)
{
    u32 dampBattler = IsAbilityOnField(ABILITY_DAMP);
    if (dampBattler && IsMoveDampBanned(ctx->move))
    {
        gBattleScripting.battler = dampBattler - 1;
        gBattlescriptCurrInstr = BattleScript_DampStopsExplosion;
        return CANCELER_RESULT_FAILURE;
    }
    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerExplosion(struct BattleContext *ctx)
{
    // KO user of Explosion; for Final Gambit doesn't happen if target is immune or if it missed
    if (IsExplosionMove(ctx->move)
     && (GetMoveEffect(ctx->move) != EFFECT_FINAL_GAMBIT || !IsBattlerUnaffectedByMove(ctx->battlerDef)))
    {
        BattleScriptCall(BattleScript_Explosion);
        return CANCELER_RESULT_BREAK;
    }

    return CANCELER_RESULT_SUCCESS;
}

static bool32 CanTwoTurnMoveFireThisTurn(struct BattleContext *ctx)
{
    if (gBattleMoveEffects[GetMoveEffect(ctx->move)].semiInvulnerableEffect
     || GetMoveEffect(ctx->move) == EFFECT_GEOMANCY
     || !IsBattlerWeatherAffected(ctx->battlerAtk, GetMoveTwoTurnAttackWeather(ctx->move)))
        return FALSE;
    return TRUE;
}

static enum CancelerResult CancelerCharging(struct BattleContext *ctx)
{
    if (!gBattleMoveEffects[GetMoveEffect(ctx->move)].twoTurnEffect
     || GetMoveEffect(ctx->move) == EFFECT_SKY_DROP)
        return CANCELER_RESULT_SUCCESS;

    enum CancelerResult result = CANCELER_RESULT_SUCCESS;

    if (gBattleMons[ctx->battlerAtk].volatiles.multipleTurns) // Second turn
    {
    	gBattleScripting.animTurn = 1;
    	gBattleScripting.animTargetsHit = 0;
        gBattleMons[ctx->battlerAtk].volatiles.multipleTurns = FALSE;
        if (gBattleMoveEffects[GetMoveEffect(ctx->move)].semiInvulnerableEffect)
            gBattleMons[ctx->battlerAtk].volatiles.semiInvulnerable = STATE_NONE;
        result = CANCELER_RESULT_SUCCESS;
    }
    else if (!gProtectStructs[ctx->battlerAtk].chargingTurn) // First turn charge
    {
        gLockedMoves[ctx->battlerAtk] = ctx->move;
        gProtectStructs[ctx->battlerAtk].chargingTurn = TRUE;
        if (gBattleMoveEffects[GetMoveEffect(ctx->move)].semiInvulnerableEffect)
            gBattleMons[ctx->battlerAtk].volatiles.semiInvulnerable = GetMoveTwoTurnAttackStatus(ctx->move);
        BattleScriptCall(BattleScript_TwoTurnMoveCharging);
        result = CANCELER_RESULT_PAUSE;
    }
    else // Try move this turn. Otherwise use next turn
    {
        if (CanTwoTurnMoveFireThisTurn(ctx))
        {
            gBattleScripting.animTurn = 1;
            gBattleScripting.animTargetsHit = 0;
            gProtectStructs[ctx->battlerAtk].chargingTurn = FALSE;
            result = CANCELER_RESULT_SUCCESS;
        }
        else if (ctx->holdEffectAtk == HOLD_EFFECT_POWER_HERB)
        {
            gBattleScripting.animTurn = 1;
            gBattleScripting.animTargetsHit = 0;
            gProtectStructs[ctx->battlerAtk].chargingTurn = FALSE;
            gLastUsedItem = gBattleMons[ctx->battlerAtk].item;
            BattleScriptCall(BattleScript_PowerHerbActivation);
            result = CANCELER_RESULT_BREAK;
        }
        else // Use move next turn
        {
            gBattleMons[ctx->battlerAtk].volatiles.multipleTurns = TRUE;
            gBattlescriptCurrInstr = BattleScript_MoveEnd;
            result = CANCELER_RESULT_BREAK;
        }

    }

    return result;
}

static enum CancelerResult CancelerMoveSpecificMessage(struct BattleContext *ctx)
{
    switch (GetMoveEffect(ctx->move))
    {
    case EFFECT_MAGNITUDE:
        CalculateMagnitudeDamage();
        BattleScriptCall(BattleScript_MagnitudeMessage);
        return CANCELER_RESULT_BREAK;
    case EFFECT_FICKLE_BEAM:
        gBattleStruct->fickleBeamBoosted = RandomPercentage(RNG_FICKLE_BEAM, 30);
        if (gBattleStruct->fickleBeamBoosted)
        {
            BattleScriptCall(BattleScript_FickleBeamMessage);
            return CANCELER_RESULT_BREAK;
        }
        break;
    default:
        break;
    }

    return CANCELER_RESULT_SUCCESS;
}

static bool32 NoTargetPresent(enum BattlerId battler, enum Move move, enum MoveTarget moveTarget)
{
    switch (moveTarget)
    {
    case TARGET_USER_AND_ALLY:
        return FALSE; // At least user is present
    case TARGET_ALLY:
        if (!IsBattlerAlive(BATTLE_PARTNER(gBattlerAttacker))) // Seems like TARGET_ALLY is retargeting if no ally
            return TRUE;
        break;
    case TARGET_SELECTED:
    case TARGET_DEPENDS:
    case TARGET_RANDOM:
        if (!IsBattlerAlive(gBattlerTarget) && !IsBattlerAlive(GetBattleMoveTarget(move, TARGET_NONE)))
            return TRUE;
        break;
    case TARGET_BOTH:
    case TARGET_SMART:
        if (!IsBattlerAlive(gBattlerTarget) && !IsBattlerAlive(BATTLE_PARTNER(gBattlerTarget)))
            return TRUE;
        break;
    case TARGET_FOES_AND_ALLY:
        if (!IsBattlerAlive(gBattlerTarget) && !IsBattlerAlive(BATTLE_PARTNER(gBattlerTarget)) && !IsBattlerAlive(BATTLE_PARTNER(gBattlerAttacker)))
            return TRUE;
        break;
    default:
        break;
    }

    return FALSE;
}

static enum CancelerResult CancelerNoTarget(struct BattleContext *ctx)
{
    enum MoveTarget moveTarget = GetBattlerMoveTargetType(ctx->battlerAtk, ctx->move);

    if (NoTargetPresent(gBattlerAttacker, gCurrentMove, moveTarget))
    {
        gBattlescriptCurrInstr = BattleScript_ButItFailed;
        return CANCELER_RESULT_FAILURE;
    }

    if (ctx->battlerAtk == ctx->battlerDef
     && moveTarget == TARGET_ALLY
     && gProtectStructs[BATTLE_PARTNER(ctx->battlerAtk)].usedAllySwitch)
    {
        gBattlescriptCurrInstr = BattleScript_ButItFailed;
        return CANCELER_RESULT_FAILURE;
    }

    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult CancelerTookAttack(struct BattleContext *ctx)
{
    if (gSpecialStatuses[gBattlerTarget].abilityRedirected)
    {
        gSpecialStatuses[gBattlerTarget].abilityRedirected = FALSE;
        BattleScriptCall(BattleScript_TookAttack);
        return CANCELER_RESULT_BREAK;
    }
    return CANCELER_RESULT_SUCCESS;
}

#define checkFailure FALSE
#define skipFailure TRUE
static bool32 IsSingleTarget(enum BattlerId battlerAtk, enum BattlerId battlerDef)
{
    if (battlerDef != gBattlerTarget)
        return skipFailure;
    return checkFailure;
}

static bool32 IsSmartTarget(enum BattlerId battlerAtk, enum BattlerId battlerDef)
{
    if (battlerAtk == BATTLE_PARTNER(battlerDef))
        return skipFailure;
    return checkFailure;
}

static bool32 IsTargetingBothFoes(enum BattlerId battlerAtk, enum BattlerId battlerDef)
{
    if (battlerDef == BATTLE_PARTNER(battlerAtk) || battlerAtk == battlerDef)
    {
        // Because of Magic Bounce and Magic Coat we don't want to set MOVE_RESULT_NO_EFFECT
        if (GetMoveCategory(gCurrentMove) != DAMAGE_CATEGORY_STATUS)
            gBattleStruct->moveResultFlags[battlerDef] = MOVE_RESULT_NO_EFFECT;
        return skipFailure;
    }
    return checkFailure;
}

static bool32 IsTargetingSelf(enum BattlerId battlerAtk, enum BattlerId battlerDef)
{
    return skipFailure;
}

static bool32 IsTargetingAlly(enum BattlerId battlerAtk, enum BattlerId battlerDef)
{
    if (battlerDef != BATTLE_PARTNER(battlerAtk))
    {
        gBattleStruct->moveResultFlags[battlerDef] = MOVE_RESULT_NO_EFFECT;
        return skipFailure;
    }
    return checkFailure;
}

static bool32 IsTargetingSelfAndAlly(enum BattlerId battlerAtk, enum BattlerId battlerDef)
{
    if (battlerDef != BATTLE_PARTNER(battlerAtk))
    {
        if (battlerDef != battlerAtk) // Don't set result flags for user
            gBattleStruct->moveResultFlags[battlerDef] = MOVE_RESULT_NO_EFFECT;
        return skipFailure;
    }
    return checkFailure;
}

static bool32 IsTargetingSelfOrAlly(enum BattlerId battlerAtk, enum BattlerId battlerDef)
{
    if (battlerDef == battlerAtk)
        return skipFailure;

    if (battlerDef != BATTLE_PARTNER(battlerAtk))
    {
        gBattleStruct->moveResultFlags[battlerDef] = MOVE_RESULT_NO_EFFECT;
        return skipFailure;
    }

    return checkFailure;
}

static bool32 IsTargetingFoesAndAlly(enum BattlerId battlerAtk, enum BattlerId battlerDef)
{
    if (battlerAtk == battlerDef)
        return skipFailure;  // Don't set result flags for user
    return checkFailure;
}

static bool32 IsTargetingField(enum BattlerId battlerAtk, enum BattlerId battlerDef)
{
    return skipFailure;
}

static bool32 IsTargetingOpponentsField(enum BattlerId battlerAtk, enum BattlerId battlerDef)
{
    return checkFailure; // Bounce failure only
}

static bool32 IsTargetingAllBattlers(enum BattlerId battlerAtk, enum BattlerId battlerDef)
{
    if (GetConfig(CONFIG_CHECK_USER_FAILURE) >= GEN_5 && battlerAtk == battlerDef)
        return skipFailure;
    return checkFailure;
}

static bool32 (*const sShouldCheckTargetMoveFailure[])(enum BattlerId battlerAtk, enum BattlerId battlerDef) =
{
    [TARGET_NONE] = IsTargetingField,
    [TARGET_SELECTED] = IsSingleTarget,
    [TARGET_DEPENDS] = IsSingleTarget,
    [TARGET_OPPONENT] = IsSingleTarget,
    [TARGET_RANDOM] = IsSingleTarget,
    [TARGET_BOTH] = IsTargetingBothFoes,
    [TARGET_USER] = IsTargetingSelf,
    [TARGET_SMART] = IsSmartTarget,
    [TARGET_ALLY] = IsTargetingAlly,
    [TARGET_USER_AND_ALLY] = IsTargetingSelfAndAlly,
    [TARGET_USER_OR_ALLY] = IsTargetingSelfOrAlly,
    [TARGET_FOES_AND_ALLY] = IsTargetingFoesAndAlly,
    [TARGET_FIELD] = IsTargetingField,
    [TARGET_OPPONENTS_FIELD] = IsTargetingOpponentsField,
    [TARGET_ALL_BATTLERS] = IsTargetingAllBattlers,
};

static bool32 ShouldCheckTargetMoveFailure(enum BattlerId battlerAtk, enum BattlerId battlerDef, enum Move move, enum MoveTarget moveTarget)
{
    // For Bounced moves
    if (IsBattlerUnaffectedByMove(battlerDef))
        return skipFailure;

    return sShouldCheckTargetMoveFailure[moveTarget](battlerAtk, battlerDef);
}
#undef checkFailure
#undef skipFailure


static enum CancelerResult CancelerTargetFailure(struct BattleContext *ctx)
{
    bool32 targetAvoidedAttack = FALSE;
    enum MoveTarget moveTarget = GetBattlerMoveTargetType(ctx->battlerAtk, ctx->move);
    s32 movePriority = GetChosenMovePriority(ctx->battlerAtk, ctx->abilityAtk);
    ctx->moveType = GetBattleMoveType(ctx->move);
    ctx->updateFlags = TRUE;
    ctx->runScript = TRUE;

    while (gBattleStruct->eventState.atkCancelerBattler < gBattlersCount)
    {
        ctx->battlerDef = gBattleStruct->eventState.atkCancelerBattler++;

        if (ShouldCheckTargetMoveFailure(ctx->battlerAtk, ctx->battlerDef, ctx->move, moveTarget))
            continue;

        ctx->abilityDef = GetBattlerAbility(ctx->battlerDef);
        ctx->holdEffectDef = GetBattlerHoldEffect(ctx->battlerDef);

        if (moveTarget == TARGET_OPPONENTS_FIELD)
        {
            if (CanBattlerBounceBackMove(ctx))
                gBattleStruct->moveResultFlags[ctx->battlerDef] |= MOVE_RESULT_FAILED;
            continue;
        }

        if (!IsBattlerAlive(ctx->battlerDef))
        {
            gBattleStruct->moveResultFlags[ctx->battlerDef] |= MOVE_RESULT_FAILED;
            continue;
        }
        else if (!BreaksThroughSemiInvulnerablity(ctx->battlerAtk, ctx->battlerDef, ctx->abilityAtk, ctx->abilityDef, ctx->move))
        {
            gBattleStruct->moveResultFlags[ctx->battlerDef] |= MOVE_RESULT_FAILED;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_AVOIDED_ATK;
            if (GetMoveEffect(ctx->move) == EFFECT_FLING)
                BattleScriptCall(BattleScript_TargetAvoidsAttackConsumeFlingItem);
            else
                BattleScriptCall(BattleScript_TargetAvoidsAttack);
            targetAvoidedAttack = TRUE;
        }
        else if (IsBattlerProtected(ctx))
        {
            SetOrClearRageVolatile();
            gBattleStruct->moveResultFlags[ctx->battlerDef] |= MOVE_RESULT_MISSED;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_PROTECTED;
            if (GetMoveEffect(ctx->move) == EFFECT_FLING)
                BattleScriptCall(BattleScript_TargetAvoidsAttackConsumeFlingItem);
            else
                BattleScriptCall(BattleScript_TargetAvoidsAttack);
            targetAvoidedAttack = TRUE;
        }
        else if (CanBattlerBounceBackMove(ctx))
        {
            gBattleStruct->moveResultFlags[ctx->battlerDef] |= MOVE_RESULT_FAILED;
        }
        else if (CanMoveBeBlockedByTarget(ctx, movePriority))
        {

            gBattleStruct->moveResultFlags[ctx->battlerDef] |= MOVE_RESULT_MISSED;
            targetAvoidedAttack = TRUE;
        }
        else if (GetMoveEffect(ctx->move) == EFFECT_SYNCHRONOISE && !DoBattlersShareType(ctx->battlerAtk, ctx->battlerDef))
        {
            gBattleStruct->moveResultFlags[ctx->battlerDef] = MOVE_RESULT_NO_EFFECT;
            BattleScriptCall(BattleScript_ItDoesntAffectFoe);
            targetAvoidedAttack = TRUE;
        }
        else
        {
            CalcTypeEffectivenessMultiplier(ctx);

            if (ctx->abilityBlocked)
            {
                ctx->abilityBlocked = FALSE;
                gBattleStruct->moveResultFlags[ctx->battlerDef] = MOVE_RESULT_FAILED;
                gBattlerAbility = ctx->battlerDef;
                RecordAbilityBattle(ctx->battlerDef, ctx->abilityDef);
                BattleScriptCall(BattleScript_AbilityPopUp);
                targetAvoidedAttack = TRUE;
            }
            else if (ctx->airBalloonBlocked)
            {
                ctx->airBalloonBlocked = FALSE;
                gBattleStruct->moveResultFlags[ctx->battlerDef] = MOVE_RESULT_FAILED;
                BattleScriptCall(BattleScript_DoesntAffectScripting);
                targetAvoidedAttack = TRUE;
            }
        }

        if (targetAvoidedAttack)
        {
            gLastLandedMoves[gBattlerTarget] = 0; // Might need investigation on what exactly clears is
            gLastHitByType[gBattlerTarget] = 0;
            gBattleScripting.battler = ctx->battlerDef;
            gBattleStruct->pledgeMove = FALSE;
            CancelMultiTurnMoves(ctx->battlerAtk, SKY_DROP_ATTACKCANCELER_CHECK);
            return CANCELER_RESULT_PAUSE;
        }
    }

    if (IsDoubleBattle())
    {
        if (moveTarget == TARGET_BOTH)
            gBattleStruct->numSpreadTargets = CountAliveMonsInBattle(BATTLE_ALIVE_EXCEPT_BATTLER_SIDE, gBattlerAttacker);
        else if (moveTarget == TARGET_FOES_AND_ALLY)
            gBattleStruct->numSpreadTargets = CountAliveMonsInBattle(BATTLE_ALIVE_EXCEPT_BATTLER, gBattlerAttacker);
    }

    ctx->battlerDef = gBattlerTarget;
    gBattleStruct->eventState.atkCancelerBattler = 0;
    return CANCELER_RESULT_SUCCESS;
}

static bool32 CantFullyProtectFromMove(enum BattlerId battlerDef)
{
    if (MoveIgnoresProtect(gCurrentMove))
        return FALSE;
    if (!IsZMove(gCurrentMove) && !IsMaxMove(gCurrentMove))
        return FALSE;
    return GetProtectType(gProtectStructs[battlerDef].protected) == PROTECT_TYPE_SINGLE
        && gProtectStructs[battlerDef].protected != PROTECT_MAX_GUARD;
}

static enum CancelerResult CancelerNotFullyProtected(struct BattleContext *ctx)
{
    while (gBattleStruct->eventState.atkCancelerBattler < gBattlersCount)
    {
        enum BattlerId battlerDef = gBattleStruct->eventState.atkCancelerBattler++;

        if (CantFullyProtectFromMove(battlerDef))
        {
            BattleScriptCall(BattleScript_CouldntFullyProtect);
            gBattleScripting.battler = battlerDef;
            return CANCELER_RESULT_PAUSE;
        }
    }

    gBattleStruct->eventState.atkCancelerBattler = 0;
    return CANCELER_RESULT_SUCCESS;
}

static bool32 IsMoveParentalBondAffected(struct BattleContext *ctx)
{
    if (ctx->abilityAtk != ABILITY_PARENTAL_BOND
     || gBattleStruct->numSpreadTargets > 1
     || IsMoveParentalBondBanned(ctx->move)
     || GetMoveCategory(ctx->move) == DAMAGE_CATEGORY_STATUS
     || GetMoveEffect(ctx->move) == EFFECT_SEMI_INVULNERABLE
     || GetMoveEffect(ctx->move) == EFFECT_TWO_TURNS_ATTACK
     || GetActiveGimmick(ctx->battlerAtk) == GIMMICK_Z_MOVE
     || ctx->move == MOVE_STRUGGLE)
        return FALSE;
    return TRUE;
}

static void SetPossibleNewSmartTarget(u32 move)
{
    if (!IsBattlerUnaffectedByMove(gBattlerTarget)
     || !CanTargetPartner(gBattlerAttacker, gBattlerTarget)
     || IsAffectedByFollowMe(gBattlerAttacker, GetBattlerSide(gBattlerTarget), move)
     || GetBattlerMoveTargetType(gBattlerAttacker, move) != TARGET_SMART)
        return;

    enum BattlerId partner = BATTLE_PARTNER(gBattlerTarget);
    if (!IsBattlerUnaffectedByMove(partner))
        gBattlerTarget = partner;
}

static void SetRandomMultiHitCounter()
{
    if (GetBattlerHoldEffect(gBattlerAttacker) == HOLD_EFFECT_LOADED_DICE)
        gMultiHitCounter = RandomUniform(RNG_LOADED_DICE, 4, 5);
    else if (GetConfig(CONFIG_MULTI_HIT_CHANCE) >= GEN_5)
        gMultiHitCounter = RandomWeighted(RNG_HITS, 0, 0, 7, 7, 3, 3); // 35%: 2 hits, 35%: 3 hits, 15% 4 hits, 15% 5 hits.
    else
        gMultiHitCounter = RandomWeighted(RNG_HITS, 0, 0, 3, 3, 1, 1); // 37.5%: 2 hits, 37.5%: 3 hits, 12.5% 4 hits, 12.5% 5 hits.
}

static enum CancelerResult CancelerMultihitMoves(struct BattleContext *ctx)
{
    SetPossibleNewSmartTarget(ctx->move);

    if (IsBattlerUnaffectedByMove(gBattlerTarget)) // Dragon Darts can still hit partner
    {
        gMultiHitCounter = 0;
    }
    else if (IsMultiHitMove(ctx->move))
    {
        enum Ability ability = ctx->abilityAtk;

        if (ability == ABILITY_SKILL_LINK)
        {
            gMultiHitCounter = 5;
        }
        else if (GetMoveEffect(ctx->move) == EFFECT_SPECIES_POWER_OVERRIDE
              && gBattleMons[ctx->battlerAtk].species == GetMoveSpeciesPowerOverride_Species(ctx->move))
        {
            gMultiHitCounter = GetMoveSpeciesPowerOverride_NumOfHits(ctx->move);
        }
        else
        {
            SetRandomMultiHitCounter();
        }

        PREPARE_BYTE_NUMBER_BUFFER(gBattleScripting.multihitString, 1, 0)
    }
    else if (GetMoveStrikeCount(ctx->move) > 1)
    {
        if (GetMoveEffect(ctx->move) == EFFECT_POPULATION_BOMB && GetBattlerHoldEffect(ctx->battlerAtk) == HOLD_EFFECT_LOADED_DICE)
        {
            gMultiHitCounter = RandomUniform(RNG_LOADED_DICE, 4, 10);
        }
        else
        {
            gMultiHitCounter = GetMoveStrikeCount(ctx->move);
        }

        PREPARE_BYTE_NUMBER_BUFFER(gBattleScripting.multihitString, 3, 0)
    }
    else if (GetMoveEffect(ctx->move) == EFFECT_BEAT_UP)
    {
        struct Pokemon* party = GetBattlerParty(ctx->battlerAtk);
        int i;
        gBattleStruct->beatUpSlot = 0;
        gMultiHitCounter = 0;
        memset(gBattleStruct->beatUpSpecies, 0xFF, sizeof(gBattleStruct->beatUpSpecies));

        for (i = 0; i < PARTY_SIZE; i++)
        {
            u32 species = GetMonData(&party[i], MON_DATA_SPECIES);
            if (species != SPECIES_NONE
             && GetMonData(&party[i], MON_DATA_HP)
             && !GetMonData(&party[i], MON_DATA_IS_EGG)
             && !GetMonData(&party[i], MON_DATA_STATUS))
            {
                if (GetConfig(CONFIG_BEAT_UP) >= GEN_5)
                    gBattleStruct->beatUpSpecies[gMultiHitCounter] = species;
                else
                    gBattleStruct->beatUpSpecies[gMultiHitCounter] = i;
                gMultiHitCounter++;
            }
        }

        PREPARE_BYTE_NUMBER_BUFFER(gBattleScripting.multihitString, 1, 0)
    }
    else if (IsMoveParentalBondAffected(ctx))
    {
        gSpecialStatuses[gBattlerAttacker].parentalBondState = PARENTAL_BOND_1ST_HIT;
        gMultiHitCounter = 2;
        PREPARE_BYTE_NUMBER_BUFFER(gBattleScripting.multihitString, 1, 0)
    }
    else
    {
        gMultiHitCounter = 0;
    }

    return CANCELER_RESULT_SUCCESS;
}

static enum CancelerResult (*const sMoveSuccessOrderCancelers[])(struct BattleContext *ctx) =
{
    [CANCELER_CLEAR_FLAGS] = CancelerClearFlags,
    [CANCELER_STANCE_CHANGE_1] = CancelerStanceChangeOne,
    [CANCELER_SKY_DROP] = CancelerSkyDrop,
    [CANCELER_RECHARGE] = CancelerRecharge,
    [CANCELER_CHILLY_RECEPTION] = CancelerChillyReception,
    [CANCELER_ASLEEP_OR_FROZEN] = CancelerAsleepOrFrozen,
    [CANCELER_OBEDIENCE] = CancelerObedience,
    [CANCELER_POWER_POINTS] = CancelerPowerPoints,
    [CANCELER_TRUANT] = CancelerTruant,
    [CANCELER_FOCUS_GEN5] = CancelerFocusGen5,
    [CANCELER_FLINCH] = CancelerFlinch,
    [CANCELER_DISABLED] = CancelerDisabled,
    [CANCELER_VOLATILE_BLOCKED] = CancelerVolatileBlocked,
    [CANCELER_TAUNTED] = CancelerTaunted,
    [CANCELER_IMPRISONED] = CancelerImprisoned,
    [CANCELER_CONFUSED] = CancelerConfused,
    [CANCELER_GHOST] = CancelerGhost,
    [CANCELER_PARALYZED] = CancelerParalyzed,
    [CANCELER_INFATUATION] = CancelerInfatuation,
    [CANCELER_BIDE] = CancelerBide,
    [CANCELER_Z_MOVES] = CancelerZMoves,
    [CANCELER_CHOICE_LOCK] = CancelerChoiceLock,
    [CANCELER_CALLSUBMOVE] = CancelerCallSubmove,
    [CANCELER_THAW] = CancelerThaw,
    [CANCELER_STANCE_CHANGE_2] = CancelerStanceChangeTwo,
    [CANCELER_ATTACKSTRING] = CancelerAttackstring,
    [CANCELER_PPDEDUCTION] = CancelerPPDeduction,
    [CANCELER_SKY_BATTLE] = CancelerSkyBattle,
    [CANCELER_WEATHER_PRIMAL] = CancelerWeatherPrimal,
    [CANCELER_FOCUS_PRE_GEN5] = CancelerFocusPreGen5,
    [CANCELER_MOVE_FAILURE] = CancelerMoveFailure,
    [CANCELER_POWDER_STATUS] = CancelerPowderStatus,
    [CANCELER_PRIORITY_BLOCK] = CancelerPriorityBlock,
    [CANCELER_PROTEAN] = CancelerProtean,
    [CANCELER_EXPLODING_DAMP] = CancelerExplodingDamp,
    [CANCELER_EXPLOSION] = CancelerExplosion,
    [CANCELER_CHARGING] = CancelerCharging,
    [CANCELER_MOVE_SPECIFIC_MESSAGE] = CancelerMoveSpecificMessage,
    [CANCELER_NO_TARGET] = CancelerNoTarget,
    [CANCELER_TOOK_ATTACK] = CancelerTookAttack,
    [CANCELER_TARGET_FAILURE] = CancelerTargetFailure,
    [CANCELER_NOT_FULLY_PROTECTED] = CancelerNotFullyProtected,
    [CANCELER_MULTIHIT_MOVES] = CancelerMultihitMoves,
};

enum CancelerResult DoAttackCanceler(void)
{
    enum CancelerResult result = CANCELER_RESULT_SUCCESS;

    struct BattleContext ctx = {0};
    ctx.battlerAtk = gBattlerAttacker;
    ctx.battlerDef = gBattlerTarget;
    ctx.move = gCurrentMove;
    ctx.chosenMove = gChosenMove;
    ctx.abilityAtk = GetBattlerAbility(ctx.battlerAtk);
    ctx.holdEffectAtk = GetBattlerHoldEffect(ctx.battlerAtk);

    while (gBattleStruct->eventState.atkCanceler < CANCELER_END && result == CANCELER_RESULT_SUCCESS)
    {
        result = sMoveSuccessOrderCancelers[gBattleStruct->eventState.atkCanceler](&ctx);
        if (result != CANCELER_RESULT_PAUSE)
            gBattleStruct->eventState.atkCanceler++;
    }

    if (result == CANCELER_RESULT_FAILURE)
        gBattleStruct->unableToUseMove = TRUE;
    return result;
}

// ========
// Move End
// ========

static enum MoveEndResult MoveEndSetValues(void)
{
    gBattleScripting.savedDmg += gBattleStruct->moveDamage[gBattlerTarget];
    gBattleStruct->eventState.moveEndBattler = 0;
    gBattleStruct->eventState.moveEndBlock = 0;
    gBattleScripting.moveendState++;
    return MOVEEND_RESULT_CONTINUE;
}

static enum MoveEndResult MoveEndProtectLikeEffect(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;
    u32 temp = 0;

    if (gProtectStructs[gBattlerAttacker].chargingTurn
     || CanBattlerAvoidContactEffects(gBattlerAttacker, gBattlerTarget, GetBattlerAbility(gBattlerAttacker), GetBattlerHoldEffect(gBattlerAttacker), gCurrentMove))
    {
        gBattleScripting.moveendState++;
        return result;
    }

    enum ProtectMethod method = gProtectStructs[gBattlerTarget].protected;
    switch (method)
    {
    case PROTECT_SPIKY_SHIELD:
        if (!IsAbilityAndRecord(gBattlerAttacker, GetBattlerAbility(gBattlerAttacker), ABILITY_MAGIC_GUARD))
        {
            SetPassiveDamageAmount(gBattlerAttacker, GetNonDynamaxMaxHP(gBattlerAttacker) / 8);
            PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_SPIKY_SHIELD);
            BattleScriptCall(BattleScript_SpikyShieldEffect);
            result = MOVEEND_RESULT_RUN_SCRIPT;
        }
        break;
    case PROTECT_KINGS_SHIELD:
        SWAP(gBattlerAttacker, gBattlerTarget, temp); // gBattlerTarget and gBattlerAttacker are swapped in order to activate Defiant, if applicable
        if (B_KINGS_SHIELD_LOWER_ATK >= GEN_8)
            gBattleScripting.moveEffect = MOVE_EFFECT_ATK_MINUS_1;
        else
            gBattleScripting.moveEffect = MOVE_EFFECT_ATK_MINUS_2;
        BattleScriptCall(BattleScript_KingsShieldEffect);
        result = MOVEEND_RESULT_RUN_SCRIPT;
        break;
    case PROTECT_BANEFUL_BUNKER:
        if (CanBePoisoned(gBattlerTarget, gBattlerAttacker, GetBattlerAbility(gBattlerTarget), GetBattlerAbility(gBattlerAttacker)))
        {
            gBattleScripting.moveEffect = MOVE_EFFECT_POISON;
            BattleScriptCall(BattleScript_BanefulBunkerEffect);
            result = MOVEEND_RESULT_RUN_SCRIPT;
        }
        break;
    case PROTECT_BURNING_BULWARK:
        if (CanBeBurned(gBattlerTarget, gBattlerAttacker, GetBattlerAbility(gBattlerAttacker)))
        {
            gBattleScripting.moveEffect = MOVE_EFFECT_BURN;
            BattleScriptCall(BattleScript_BanefulBunkerEffect);
            result = MOVEEND_RESULT_RUN_SCRIPT;
        }
        break;
    case PROTECT_OBSTRUCT:
        SWAP(gBattlerAttacker, gBattlerTarget, temp); // gBattlerTarget and gBattlerAttacker are swapped in order to activate Defiant, if applicable
        gBattleScripting.moveEffect = MOVE_EFFECT_DEF_MINUS_2;
        BattleScriptCall(BattleScript_KingsShieldEffect);
        result = MOVEEND_RESULT_RUN_SCRIPT;
        break;
    case PROTECT_SILK_TRAP:
        SWAP(gBattlerAttacker, gBattlerTarget, temp); // gBattlerTarget and gBattlerAttacker are swapped in order to activate Defiant, if applicable
        gBattleScripting.moveEffect = MOVE_EFFECT_SPD_MINUS_1;
        BattleScriptCall(BattleScript_KingsShieldEffect);
        result = MOVEEND_RESULT_RUN_SCRIPT;
        break;
    default:
        break;
    }

    // Not strictly a protect effect, but works the same way
    if (IsBattlerUsingBeakBlast(gBattlerTarget)
     && IsBattlerTurnDamaged(gBattlerTarget)
     && CanBeBurned(gBattlerAttacker, gBattlerAttacker, GetBattlerAbility(gBattlerAttacker)))
    {
        gBattleMons[gBattlerAttacker].status1 = STATUS1_BURN;
        BtlController_EmitSetMonData(gBattlerAttacker, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[gBattlerAttacker].status1), &gBattleMons[gBattlerAttacker].status1);
        MarkBattlerForControllerExec(gBattlerAttacker);
        BattleScriptCall(BattleScript_BeakBlastBurn);
        result = MOVEEND_RESULT_RUN_SCRIPT;
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndAbsorb(void)
{
    if (gBattleStruct->unableToUseMove)
    {
        gBattleScripting.moveendState++;
        return MOVEEND_RESULT_CONTINUE;
    }

    if (IsExplosionMove(gCurrentMove)
     && (gBattleStruct->doneDoublesSpreadHit || !IsDoubleSpreadMove())
     && !IsBattlerAlive(gBattlerAttacker)
     && !gBattleStruct->battlerState[gBattlerAttacker].fainted)
    {
        gBattleStruct->passiveHpUpdate[gBattlerAttacker] = 0;
        BattleScriptCall(BattleScript_FaintAttackerForExplosion);
        gBattleScripting.moveendState++;
        return MOVEEND_RESULT_RUN_SCRIPT;
    }

    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;
    enum BattleMoveEffects moveEffect = GetMoveEffect(gCurrentMove);

    switch (moveEffect)
    {
    case EFFECT_ABSORB:
    case EFFECT_DREAM_EATER:
        if (!gBattleMons[gBattlerAttacker].volatiles.healBlock
         && gBattleStruct->moveDamage[gBattlerTarget] > 0
         && IsBattlerTurnDamaged(gBattlerTarget)
         && IsBattlerAlive(gBattlerAttacker))
        {
            s32 healAmount = (gBattleStruct->moveDamage[gBattlerTarget] * GetMoveAbsorbPercentage(gCurrentMove) / 100);
            healAmount = GetDrainedBigRootHp(gBattlerAttacker, healAmount);
            if ((moveEffect == EFFECT_DREAM_EATER && GetConfig(CONFIG_DREAM_EATER_LIQUID_OOZE) < GEN_5)
                || GetBattlerAbility(gBattlerTarget) != ABILITY_LIQUID_OOZE)
            {
                SetHealAmount(gBattlerAttacker, healAmount);
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ABSORB;
                BattleScriptCall(BattleScript_EffectAbsorb);
            }
            else // Liquid Ooze damage
            {
                SetPassiveDamageAmount(gBattlerAttacker, healAmount);
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ABSORB_OOZE;
                BattleScriptCall(BattleScript_EffectAbsorbLiquidOoze);
            }
            result = MOVEEND_RESULT_RUN_SCRIPT;
        }
        break;
    case EFFECT_MAX_HP_50_RECOIL:
        if (IsBattlerAlive(gBattlerAttacker)
         && !gBattleStruct->unableToUseMove
         && (gBattleStruct->doneDoublesSpreadHit || !IsDoubleSpreadMove())
         && !gSpecialStatuses[gBattlerAttacker].mindBlownRecoil
         && !(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_FAILED)
         && !IsAbilityAndRecord(gBattlerAttacker, GetBattlerAbility(gBattlerAttacker), ABILITY_MAGIC_GUARD))
        {
            s32 recoil = (GetNonDynamaxMaxHP(gBattlerAttacker) + 1) / 2; // Half of Max HP Rounded UP
            SetPassiveDamageAmount(gBattlerAttacker, recoil);
            gSpecialStatuses[gBattlerAttacker].mindBlownRecoil = TRUE;
            TryUpdateEvolutionTracker(IF_RECOIL_DAMAGE_GE, gBattleStruct->passiveHpUpdate[gBattlerAttacker], MOVE_NONE);
            BattleScriptCall(BattleScript_MaxHp50Recoil);
            result = MOVEEND_RESULT_RUN_SCRIPT;
        }
        break;
    default:
        break;
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndRage(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    if (gBattleMons[gBattlerTarget].volatiles.rage
        && IsBattlerAlive(gBattlerTarget)
        && gBattlerAttacker != gBattlerTarget
        && !IsBattlerAlly(gBattlerAttacker, gBattlerTarget)
        && IsBattlerTurnDamaged(gBattlerTarget)
        && !IsBattleMoveStatus(gCurrentMove)
        && CompareStat(gBattlerTarget, STAT_ATK, MAX_STAT_STAGE, CMP_LESS_THAN, GetBattlerAbility(gBattlerTarget)))
    {
        SET_STATCHANGER(STAT_ATK, 1, FALSE);
        BattleScriptCall(BattleScript_RageIsBuilding);
        result = MOVEEND_RESULT_RUN_SCRIPT;
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndSynchronizeTarget(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;
    if (AbilityBattleEffects(ABILITYEFFECT_SYNCHRONIZE, gBattlerTarget, 0, 0, TRUE))
        result = MOVEEND_RESULT_RUN_SCRIPT;
    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndAbilities(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;
    enum Ability targetAbility = GetBattlerAbility(gBattlerTarget);

    if (AbilityBattleEffects(ABILITYEFFECT_MOVE_END, gBattlerTarget, targetAbility, 0, TRUE))
        result = MOVEEND_RESULT_RUN_SCRIPT;
    else if (TryClearIllusion(gBattlerTarget, targetAbility))
        result = MOVEEND_RESULT_RUN_SCRIPT;

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndFormChangeOnHit(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    if (AbilityBattleEffects(ABILITYEFFECT_FORM_CHANGE_ON_HIT, gBattlerTarget, GetBattlerAbility(gBattlerTarget), 0, TRUE))
        result = MOVEEND_RESULT_RUN_SCRIPT;

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndAbilitiesAttacker(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    if (AbilityBattleEffects(ABILITYEFFECT_MOVE_END_ATTACKER, gBattlerAttacker, 0, 0, TRUE))
        result = MOVEEND_RESULT_RUN_SCRIPT;

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndStatusImmunityAbilities(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    for (enum BattlerId battler = 0; battler < gBattlersCount; battler++)
    {
        if (AbilityBattleEffects(ABILITYEFFECT_IMMUNITY, battler, 0, 0, TRUE))
            result = MOVEEND_RESULT_RUN_SCRIPT;
    }

    if (result == MOVEEND_RESULT_CONTINUE)
        gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndSynchronizeAttacker(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    if (AbilityBattleEffects(ABILITYEFFECT_ATK_SYNCHRONIZE, gBattlerAttacker, 0, 0, TRUE))
        result = MOVEEND_RESULT_RUN_SCRIPT;

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndAttackerInvisible(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    if (IsSemiInvulnerable(gBattlerAttacker, CHECK_ALL)
     && gHitMarker & (HITMARKER_NO_ANIMATIONS | HITMARKER_DISABLE_ANIMATION))
    {
        BtlController_EmitSpriteInvisibility(gBattlerAttacker, B_COMM_TO_CONTROLLER, TRUE);
        MarkBattlerForControllerExec(gBattlerAttacker);
        result = MOVEEND_RESULT_BREAK;
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndAttackerVisible(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    if (IsBattlerUnaffectedByMove(gBattlerTarget)
        || !IsSemiInvulnerable(gBattlerAttacker, CHECK_ALL)
        || gBattleStruct->unableToUseMove)
    {
        BtlController_EmitSpriteInvisibility(gBattlerAttacker, B_COMM_TO_CONTROLLER, FALSE);
        MarkBattlerForControllerExec(gBattlerAttacker);
        gBattleMons[gBattlerAttacker].volatiles.semiInvulnerable = STATE_NONE;
        gSpecialStatuses[gBattlerAttacker].restoredBattlerSprite = TRUE;
        gBattleScripting.moveendState++;
        return MOVEEND_RESULT_BREAK;
    }
    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndTargetVisible(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    if (!gSpecialStatuses[gBattlerTarget].restoredBattlerSprite && gBattlerTarget < gBattlersCount
        && !IsSemiInvulnerable(gBattlerTarget, CHECK_ALL))
    {
        BtlController_EmitSpriteInvisibility(gBattlerTarget, B_COMM_TO_CONTROLLER, FALSE);
        MarkBattlerForControllerExec(gBattlerTarget);
        gBattleMons[gBattlerTarget].volatiles.semiInvulnerable = STATE_NONE;
        result = MOVEEND_RESULT_BREAK;
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndItemEffectsTarget(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;
    enum HoldEffect holdEffect = GetBattlerHoldEffect(gBattlerTarget);

    if (ItemBattleEffects(gBattlerTarget, gBattlerAttacker, holdEffect, IsOnTargetHitActivation)
     || ItemBattleEffects(gBattlerTarget, gBattlerAttacker, holdEffect, IsOnStatusChangeActivation))
        result = MOVEEND_RESULT_RUN_SCRIPT;

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndItemEffectsAttacker1(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;
    enum HoldEffect holdEffect = GetBattlerHoldEffect(gBattlerAttacker);

    if (ItemBattleEffects(gBattlerAttacker, gBattlerTarget, holdEffect, IsOnAttackerAfterHitActivation)
     || ItemBattleEffects(gBattlerAttacker, gBattlerTarget, holdEffect, IsOnStatusChangeActivation)
     || ItemBattleEffects(gBattlerAttacker, gBattlerTarget, holdEffect, IsOnHpThresholdActivation))
        result = MOVEEND_RESULT_RUN_SCRIPT;

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndSymbiosis(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    for (enum BattlerId battler = 0; battler < gBattlersCount; battler++)
    {
        if ((gSpecialStatuses[battler].berryReduced
              || (GetConfig(CONFIG_SYMBIOSIS_GEMS) >= GEN_7 && gSpecialStatuses[battler].gemBoost))
            && TryTriggerSymbiosis(battler, BATTLE_PARTNER(battler)))
        {
            BestowItem(BATTLE_PARTNER(battler), battler);
            gLastUsedAbility = gBattleMons[BATTLE_PARTNER(battler)].ability;
            gEffectBattler = battler;
            gBattleScripting.battler = gBattlerAbility = BATTLE_PARTNER(battler);
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_SymbiosisActivates;
            result = MOVEEND_RESULT_RUN_SCRIPT;
            break;
        }
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndSubstitute(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    for (enum BattlerId i = 0; i < gBattlersCount; i++)
    {
        if (gBattleMons[i].volatiles.substituteHP == 0)
            gBattleMons[i].volatiles.substitute = FALSE;
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndFaintBlock(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    do
    {
        switch (gBattleStruct->eventState.moveEndBlock)
        {
        case FAINT_BLOCK_FINAL_GAMBIT:
            if (GetMoveEffect(gCurrentMove) == EFFECT_FINAL_GAMBIT
             && IsBattlerAlive(gBattlerAttacker)
             && !gBattleStruct->unableToUseMove
             && (gBattleStruct->doneDoublesSpreadHit || !IsDoubleSpreadMove())
             && !IsBattlerUnaffectedByMove(gBattlerTarget))
            {
                BattleScriptCall(BattleScript_FinalGambit);
                result = MOVEEND_RESULT_RUN_SCRIPT;
            }
            gBattleStruct->eventState.moveEndBlock++;
            break;
        case FAINT_BLOCK_CHECK_TARGET_FAINTED: // Stop if target already ran the block / is alive or absent
            if (IsBattlerAlive(gBattlerTarget)
             || gBattleStruct->battlerState[gBattlerTarget].fainted)
            {
                gBattleScripting.moveendState++;
                return MOVEEND_RESULT_CONTINUE;
            }

            gBattleStruct->eventState.moveEndBlock++;
            break;
        case FAINT_BLOCK_END_NEUTRALIZING_GAS:
            if (gBattleMons[gBattlerTarget].volatiles.neutralizingGas)
            {
                gBattleMons[gBattlerTarget].volatiles.neutralizingGas = FALSE;
                if (!IsNeutralizingGasOnField())
                {
                    BattleScriptCall(BattleScript_NeutralizingGasExits);
                    result = MOVEEND_RESULT_RUN_SCRIPT;
                }
            }
            gBattleStruct->eventState.moveEndBlock++;
            break;
        case FAINT_BLOCK_TRY_DESTINY_BOND: // Checked before FAINT_BLOCK_FAINT_TARGET but occurs after since volatiles are cleared on faint
            if (gBattleMons[gBattlerTarget].volatiles.destinyBond
             && IsBattlerTurnDamaged(gBattlerTarget)
             && IsBattlerAlive(gBattlerAttacker)
             && GetActiveGimmick(gBattlerAttacker) != GIMMICK_DYNAMAX
             && !IsBattlerAlly(gBattlerAttacker, gBattlerTarget))
            {
                gBattleStruct->tryDestinyBond = TRUE;
            }
            gBattleStruct->eventState.moveEndBlock++;
            break;
        case FAINT_BLOCK_TRY_GRUDGE: // Checked before FAINT_BLOCK_FAINT_TARGET but occurs after since volatiles are cleared on faint
            if (gBattleMons[gBattlerTarget].volatiles.grudge
             && IsBattlerTurnDamaged(gBattlerTarget)
             && IsBattlerAlive(gBattlerAttacker)
             && !IsBattlerAlly(gBattlerAttacker, gBattlerTarget)
             && !IsZMove(gCurrentMove)
             && gCurrentMove != MOVE_STRUGGLE
             && GetMoveEffect(gCurrentMove) != EFFECT_FUTURE_SIGHT)
            {
                gBattleStruct->tryGrudge = TRUE;
            }
            gBattleStruct->eventState.moveEndBlock++;
            break;
        case FAINT_BLOCK_FAINT_TARGET:
            gBattlerFainted = gBattlerTarget;
            TryUpdateEvolutionTracker(IF_DEFEAT_X_WITH_ITEMS, 1, MOVE_NONE);
            TryDeactivateSleepClause(GetBattlerSide(gBattlerTarget), gBattlerPartyIndexes[gBattlerTarget]);
            gHitMarker |= HITMARKER_FAINTED(gBattlerTarget);
            gBattleStruct->eventState.faintedAction = 0;
            if (IsOnPlayerSide(gBattlerTarget))
            {
                gHitMarker |= HITMARKER_PLAYER_FAINTED;
                if (gBattleResults.playerFaintCounter < 255)
                    gBattleResults.playerFaintCounter++;
                AdjustFriendshipOnBattleFaint(gBattlerTarget);
                gSideTimers[B_SIDE_PLAYER].retaliateTimer = 2;
            }
            else
            {
                if (gBattleResults.opponentFaintCounter < 255)
                    gBattleResults.opponentFaintCounter++;
                gBattleResults.lastOpponentSpecies = GetMonData(GetBattlerMon(gBattlerTarget), MON_DATA_SPECIES);
                gSideTimers[B_SIDE_OPPONENT].retaliateTimer = 2;
            }
            BattleScriptCall(BattleScript_FaintBattler);
            result = MOVEEND_RESULT_RUN_SCRIPT;
            gBattleStruct->eventState.moveEndBlock++;
            break;
        case FAINT_BLOCK_DO_DESTINY_BOND:
            if (gBattleStruct->tryDestinyBond)
            {
                gBattleStruct->passiveHpUpdate[gBattlerAttacker] = gBattleMons[gBattlerAttacker].hp;
                BattleScriptCall(BattleScript_DestinyBondTakesLife);
                result = MOVEEND_RESULT_RUN_SCRIPT;
            }
            gBattleStruct->eventState.moveEndBlock++;
            break;
        case FAINT_BLOCK_DO_GRUDGE:
            if (gBattleStruct->tryGrudge)
            {
                u32 moveIndex = gBattleStruct->chosenMovePositions[gBattlerAttacker];

                gBattleMons[gBattlerAttacker].pp[moveIndex] = 0;
                BtlController_EmitSetMonData(gBattlerAttacker, B_COMM_TO_CONTROLLER, moveIndex + REQUEST_PPMOVE1_BATTLE, 0, sizeof(gBattleMons[gBattlerAttacker].pp[moveIndex]), &gBattleMons[gBattlerAttacker].pp[moveIndex]);
                MarkBattlerForControllerExec(gBattlerAttacker);
                PREPARE_MOVE_BUFFER(gBattleTextBuff1, gBattleMons[gBattlerAttacker].moves[moveIndex])
                BattleScriptCall(BattleScript_GrudgeTakesPp);
                result = MOVEEND_RESULT_RUN_SCRIPT;
            }
            gBattleStruct->eventState.moveEndBlock++;
            break;
        case FAINT_BLOCK_COUNT: // Clear bits for other potential fainting targets
            gBattleStruct->tryDestinyBond = FALSE;
            gBattleStruct->tryGrudge = FALSE;
            gBattleStruct->eventState.moveEndBlock = 0;
            break;
        }

        if (result == MOVEEND_RESULT_RUN_SCRIPT)
            break;

    } while (gBattleStruct->eventState.moveEndBlock != 0);

    if (result == MOVEEND_RESULT_CONTINUE)
    {
        gBattleStruct->eventState.moveEndBlock = 0;
        gBattleScripting.moveendState++;
    }

    return result;
}

static enum MoveEndResult MoveEndSkyDropConfuse(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    for (enum BattlerId battler = 0; battler < gBattlersCount; battler++)
    {
        if (gBattleStruct->skyDropTargets[battler] == SKY_DROP_RELEASED_TARGET)
        {
            // Find the battler id of the Pokemon that was held by Sky Drop
            enum BattlerId targetId;
            for (targetId = 0; targetId < gBattlersCount; targetId++)
            {
                if (gBattleStruct->skyDropTargets[targetId] == battler)
                    break;
            }

            gBattleScripting.battler = targetId;
            BattleScriptCall(BattleScript_ThrashConfusesRet); // Jump to "confused due to fatigue" script

            // Clear skyDropTargets data
            gBattleStruct->skyDropTargets[battler] = SKY_DROP_NO_TARGET;
            gBattleStruct->skyDropTargets[targetId] = SKY_DROP_NO_TARGET;
            result = MOVEEND_RESULT_RUN_SCRIPT;
            break;
        }
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndUpdateLastMoves(void)
{
    if (!IsOnPlayerSide(gBattlerAttacker))
        UpdateStallMons();

    // After swapattackerwithtarget is used for snatch the correct battlers have to be restored so data is stored correctly
    if (gBattleStruct->snatchedMoveIsUsed)
    {
        u32 temp;
        SWAP(gBattlerAttacker, gBattlerTarget, temp);
    }

    enum BattleMoveEffects originalEffect = GetMoveEffect(GetOriginallyUsedMove(gChosenMove));
    if (IsBattlerAlive(gBattlerAttacker) // Why do we need to check if user fainted? We just want to set with what move the target got hit
     && originalEffect != EFFECT_BATON_PASS
     && originalEffect != EFFECT_HEALING_WISH
     && originalEffect != EFFECT_LUNAR_DANCE)
    {
        if (!gBattleStruct->unableToUseMove)
        {
            if (!gSpecialStatuses[gBattlerAttacker].dancerUsedMove)
            {
                gLastMoves[gBattlerAttacker] = gChosenMove;
                gLastResultingMoves[gBattlerAttacker] = gCurrentMove;
                gLastUsedMoveType[gBattlerAttacker] = GetBattleMoveType(gCurrentMove);
            }
        }
        else
        {
            gLastMoves[gBattlerAttacker] = MOVE_UNAVAILABLE;
            gLastResultingMoves[gBattlerAttacker] = MOVE_UNAVAILABLE;
            gLastUsedMoveType[gBattlerAttacker] = 0;
        }

        if (!(gHitMarker & HITMARKER_FAINTED(gBattlerTarget)))
            gLastHitBy[gBattlerTarget] = gBattlerAttacker;

        if (!gBattleStruct->unableToUseMove && !IsBattlerUnaffectedByMove(gBattlerTarget))
        {
            if (gChosenMove == MOVE_UNAVAILABLE)
            {
                gLastLandedMoves[gBattlerTarget] = gChosenMove;
            }
            else
            {
                gLastLandedMoves[gBattlerTarget] = gCurrentMove;
                gLastHitByType[gBattlerTarget] = GetBattleMoveType(gCurrentMove);
                if (!gSpecialStatuses[gBattlerAttacker].dancerUsedMove)
                {
                    gLastUsedMove = gCurrentMove;
                    if (IsMaxMove(gCurrentMove))
                        gBattleStruct->dynamax.lastUsedBaseMove = gBattleStruct->dynamax.baseMoves[gBattlerAttacker];
                }
            }
        }
        else
        {
            gLastLandedMoves[gBattlerTarget] = MOVE_UNAVAILABLE;
        }
    }

    gBattleScripting.moveendState++;
    return MOVEEND_RESULT_CONTINUE;
}

static enum MoveEndResult MoveEndMirrorMove(void)
{
    if (!gBattleStruct->unableToUseMove
     && gBattlerAttacker != gBattlerTarget
     && IsBattlerAlive(gBattlerAttacker)
     && IsBattlerAlive(gBattlerTarget)
     && !IsMoveMirrorMoveBanned(GetOriginallyUsedMove(gChosenMove))
     && !IsBattlerUnaffectedByMove(gBattlerTarget))
    {
        gBattleStruct->lastTakenMove[gBattlerTarget] = gChosenMove;
        gBattleStruct->lastTakenMoveFrom[gBattlerTarget][gBattlerAttacker] = gChosenMove;
    }

    gBattleScripting.moveendState++;
    return MOVEEND_RESULT_CONTINUE;
}

static enum MoveEndResult MoveEndDefrost(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    if (gBattleMons[gBattlerTarget].status1 & STATUS1_FREEZE
        && IsBattlerTurnDamaged(gBattlerTarget)
        && IsBattlerAlive(gBattlerTarget)
        && gBattlerAttacker != gBattlerTarget
        && (GetBattleMoveType(gCurrentMove) == TYPE_FIRE || CanBurnHitThaw(gCurrentMove))
        && !IsBattlerUnaffectedByMove(gBattlerTarget))
    {
        gBattleMons[gBattlerTarget].status1 &= ~STATUS1_FREEZE;
        BtlController_EmitSetMonData(gBattlerTarget, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[gBattlerTarget].status1), &gBattleMons[gBattlerTarget].status1);
        MarkBattlerForControllerExec(gBattlerTarget);
        BattleScriptCall(BattleScript_DefrostedViaFireMove);
        result = MOVEEND_RESULT_RUN_SCRIPT;
    }
    else if (gBattleMons[gBattlerTarget].status1 & STATUS1_FROSTBITE
          && IsBattlerTurnDamaged(gBattlerTarget)
          && IsBattlerAlive(gBattlerTarget)
          && gBattlerAttacker != gBattlerTarget
          && MoveThawsUser(GetOriginallyUsedMove(gChosenMove))
          && !IsBattlerUnaffectedByMove(gBattlerTarget))
    {
        gBattleMons[gBattlerTarget].status1 &= ~STATUS1_FROSTBITE;
        BtlController_EmitSetMonData(gBattlerTarget, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[gBattlerTarget].status1), &gBattleMons[gBattlerTarget].status1);
        MarkBattlerForControllerExec(gBattlerTarget);
        BattleScriptCall(BattleScript_FrostbiteHealedViaFireMove);
        result = MOVEEND_RESULT_RUN_SCRIPT;
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndNextTarget(void)
{
    enum MoveTarget moveTarget = GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove);

    gBattleStruct->battlerState[gBattlerAttacker].targetsDone[gBattlerTarget] = TRUE;

    if (gBattleStruct->unableToUseMove || gProtectStructs[gBattlerAttacker].chargingTurn)
    {
        // unable to use move
    }
    else if (moveTarget == TARGET_USER_AND_ALLY)
    {
        enum BattlerId partner = BATTLE_PARTNER(gBattlerAttacker);
        if (partner != gBattlerTarget && IsBattlerAlive(partner))
        {
            gBattleStruct->moveTarget[gBattlerAttacker] = gBattlerTarget = partner;
            BattleScriptPush(GetMoveBattleScript(gCurrentMove));
            gBattlescriptCurrInstr = BattleScript_FlushMessageBox;
            gBattleScripting.moveendState = 0;
            MoveValuesCleanUp();
            return MOVEEND_RESULT_BREAK;
        }
    }
    else if (IsSpreadMove(moveTarget))
    {
        u32 nextTarget = GetNextTarget(moveTarget, FALSE);

        if (nextTarget != MAX_BATTLERS_COUNT)
        {
            gBattleStruct->moveTarget[gBattlerAttacker] = gBattlerTarget = nextTarget; // Fix for moxie spread moves
            gBattleScripting.moveendState = 0;
            MoveValuesCleanUp();
            BattleScriptPush(GetMoveBattleScript(gCurrentMove));
            gBattlescriptCurrInstr = BattleScript_FlushMessageBox;
            return MOVEEND_RESULT_BREAK;
        }
        // Check if the move used was actually a bounced move. If so, we need to go back to the original attacker and make sure, its move hits all 2 or 3 pokemon.
        else if (gBattleStruct->bouncedMoveIsUsed)
        {
            u8 originalBounceTarget = gBattlerAttacker;
            gBattleStruct->bouncedMoveIsUsed = FALSE;
            gBattlerAttacker = gBattleStruct->attackerBeforeBounce;
            gBattleStruct->battlerState[gBattlerAttacker].targetsDone[originalBounceTarget] = TRUE;
            for (enum BattlerId i = 0; i < gBattlersCount; i++)
                gBattleStruct->battlerState[originalBounceTarget].targetsDone[i] = FALSE;
            nextTarget = GetNextTarget(moveTarget, FALSE);
            if (nextTarget != MAX_BATTLERS_COUNT)
            {
                // We found another target for the original move user.
                gBattleStruct->moveTarget[gBattlerAttacker] = gBattlerTarget = nextTarget;
                gBattleScripting.moveendState = 0;
                gBattleScripting.animTurn = 0;
                gBattleScripting.animTargetsHit = 0;
                MoveValuesCleanUp();
                BattleScriptPush(GetMoveBattleScript(gCurrentMove));
                gBattlescriptCurrInstr = BattleScript_FlushMessageBox;
                return MOVEEND_RESULT_BREAK;
            }
        }
    }

    RecordLastUsedMoveBy(gBattlerAttacker, gCurrentMove);
    gBattleScripting.moveendState++;
    return MOVEEND_RESULT_CONTINUE;
}

static enum MoveEndResult MoveEndHpThresholdItemsTarget(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    if (gMultiHitCounter &&
        ItemBattleEffects(gBattlerTarget, gBattlerAttacker, GetBattlerHoldEffect(gBattlerTarget), IsOnHpThresholdActivation))
    {
        result = MOVEEND_RESULT_RUN_SCRIPT;
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndMultihitMove(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    if (!IsBattlerUnaffectedByMove(gBattlerTarget)
     && !gBattleStruct->unableToUseMove
     && gMultiHitCounter)
    {
        enum MoveTarget target = GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove);
        gMultiHitCounter--;
        if (!IsBattlerAlive(gBattlerTarget) && target != TARGET_SMART)
            gMultiHitCounter = 0;

        gBattleScripting.multihitString[4]++;
        if (gMultiHitCounter == 0)
        {
            if (MoveHasAdditionalEffect(gCurrentMove, MOVE_EFFECT_SCALE_SHOT) && !NoAliveMonsForEitherParty())
                BattleScriptCall(BattleScript_ScaleShot);
            else
                BattleScriptCall(BattleScript_MultiHitPrintStrings);
            result = MOVEEND_RESULT_RUN_SCRIPT;
        }
        else
        {
            if (target == TARGET_SMART
             && !IsAffectedByFollowMe(gBattlerAttacker, GetBattlerSide(gBattlerTarget), gCurrentMove)
             && !(gBattleStruct->moveResultFlags[BATTLE_PARTNER(gBattlerTarget)] & MOVE_RESULT_MISSED) // didn't miss the other target
             && CanTargetPartner(gBattlerAttacker, gBattlerTarget)
             && !IsBattlerUnaffectedByMove(BATTLE_PARTNER(gBattlerTarget)))
                gBattlerTarget = BATTLE_PARTNER(gBattlerTarget); // Target the partner in doubles for second hit.

            enum BattleMoveEffects chosenEffect = GetMoveEffect(gChosenMove);

            if (gBattleMons[gBattlerAttacker].hp
             && gBattleMons[gBattlerTarget].hp
             && (IsUsableWhileAsleepEffect(chosenEffect) || !(gBattleMons[gBattlerAttacker].status1 & STATUS1_SLEEP))
             && !(gBattleMons[gBattlerAttacker].status1 & STATUS1_FREEZE))
            {
                if (gSpecialStatuses[gBattlerAttacker].parentalBondState)
                    gSpecialStatuses[gBattlerAttacker].parentalBondState--;

                gBattleScripting.animTargetsHit = 0;
                gBattleScripting.moveendState = 0;
                gSpecialStatuses[gBattlerAttacker].multiHitOn = TRUE;
                MoveValuesCleanUp();
                BattleScriptPush(GetMoveBattleScript(gCurrentMove));
                gBattlescriptCurrInstr = BattleScript_FlushMessageBox;
                return MOVEEND_RESULT_BREAK;
            }
            else
            {
                BattleScriptCall(BattleScript_MultiHitPrintStrings);
                result = MOVEEND_RESULT_RUN_SCRIPT;
            }
        }
    }

    gMultiHitCounter = 0;
    gSpecialStatuses[gBattlerAttacker].parentalBondState = PARENTAL_BOND_OFF;
    gSpecialStatuses[gBattlerAttacker].multiHitOn = 0;
    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndMoveBlock(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;
    enum BattleSide side = GetBattlerSide(gBattlerTarget);
    enum BattleMoveEffects moveEffect = GetMoveEffect(gCurrentMove);

    switch (moveEffect)
    {
    case EFFECT_SPIT_UP:
    case EFFECT_SWALLOW:
        if (!gBattleStruct->unableToUseMove)
        {
            gBattleMons[gBattlerAttacker].volatiles.stockpileCounter = 0;
            if (B_STOCKPILE_RAISES_DEFS >= GEN_4)
            {
                BattleScriptCall(BattleScript_MoveEffectStockpileWoreOff);
                result = MOVEEND_RESULT_RUN_SCRIPT;
            }
        }
        break;
    case EFFECT_KNOCK_OFF:
        if (gBattleMons[gBattlerTarget].item != ITEM_NONE
         && IsBattlerAlive(gBattlerAttacker)
         && !(B_KNOCK_OFF_REMOVAL >= GEN_5 && side == B_SIDE_PLAYER && !(gBattleTypeFlags & BATTLE_TYPE_TRAINER))
         && IsBattlerTurnDamaged(gBattlerTarget)
         && !DoesSubstituteBlockMove(gBattlerAttacker, gBattlerTarget, gCurrentMove)
         && CanBattlerGetOrLoseItem(gBattlerTarget, gBattlerAttacker, gBattleMons[gBattlerTarget].item)
         && !NoAliveMonsForEitherParty())
        {
            enum BattleSide side = GetBattlerSide(gBattlerTarget);

            if (GetBattlerAbility(gBattlerTarget) == ABILITY_STICKY_HOLD)
            {
                gBattlerAbility = gBattlerTarget;
                BattleScriptCall(BattleScript_StickyHoldActivatesRet);
                result = MOVEEND_RESULT_RUN_SCRIPT;
                break;
            }

            gLastUsedItem = gBattleMons[gBattlerTarget].item;
            gBattleMons[gBattlerTarget].item = 0;
            if (gBattleMons[gBattlerTarget].ability != ABILITY_GORILLA_TACTICS)
                gBattleStruct->choicedMove[gBattlerTarget] = MOVE_NONE;
            CheckSetUnburden(gBattlerTarget);

            // In Gen 5+, Knock Off removes the target's item rather than rendering it unusable
            if (B_KNOCK_OFF_REMOVAL >= GEN_5)
            {
                BtlController_EmitSetMonData(gBattlerTarget, B_COMM_TO_CONTROLLER, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[gBattlerTarget].item), &gBattleMons[gBattlerTarget].item);
                MarkBattlerForControllerExec(gBattlerTarget);
                // Mark item as stolen so it will be restored after battle
                gBattleStruct->itemLost[side][gBattlerPartyIndexes[gBattlerTarget]].stolen = TRUE;
            }
            else
            {
                GetBattlerPartyState(gBattlerTarget)->isKnockedOff = TRUE;
            }

            BattleScriptCall(BattleScript_KnockedOff);
            result = MOVEEND_RESULT_RUN_SCRIPT;
        }
        break;
    case EFFECT_STEAL_ITEM:
        if (!IsBattlerTurnDamaged(gBattlerTarget)
         || gBattleMons[gBattlerAttacker].item != ITEM_NONE
         || gBattleMons[gBattlerTarget].item == ITEM_NONE
         || !IsBattlerAlive(gBattlerAttacker)
         || !CanStealItem(gBattlerAttacker, gBattlerTarget, gBattleMons[gBattlerTarget].item))
        {
            result = MOVEEND_RESULT_CONTINUE;
        }
        else if (GetBattlerAbility(gBattlerTarget) == ABILITY_STICKY_HOLD)
        {
            BattleScriptCall(BattleScript_NoItemSteal);
            gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
            RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
            result = MOVEEND_RESULT_RUN_SCRIPT;
        }
        else
        {
            StealTargetItem(gBattlerAttacker, gBattlerTarget);  // Attacker steals target item

            if (!(GetConfig(CONFIG_STEAL_WILD_ITEMS) >= GEN_9
             && !(gBattleTypeFlags & (BATTLE_TYPE_TRAINER | BATTLE_TYPE_PALACE))))
            {
                gBattleMons[gBattlerAttacker].item = gLastUsedItem;
            }
            gEffectBattler = gBattlerTarget;
            BattleScriptCall(BattleScript_ItemSteal);
            result = MOVEEND_RESULT_RUN_SCRIPT;
        }
        break;
    case EFFECT_HIT_SWITCH_TARGET:
        if (IsBattlerTurnDamaged(gBattlerTarget)
         && IsBattlerAlive(gBattlerTarget)
         && IsBattlerAlive(gBattlerAttacker)
         && gBattleMons[BATTLE_PARTNER(gBattlerTarget)].volatiles.semiInvulnerable != STATE_COMMANDER)
        {
            enum Ability targetAbility = GetBattlerAbility(gBattlerTarget);
            if (targetAbility == ABILITY_GUARD_DOG)
                break;

            if (targetAbility == ABILITY_SUCTION_CUPS)
            {
                BattleScriptCall(BattleScript_AbilityPreventsPhasingOutRet);
            }
            else if (gBattleMons[gBattlerTarget].volatiles.root)
            {
                BattleScriptCall(BattleScript_PrintMonIsRootedRet);
            }
            else if (GetActiveGimmick(gBattlerTarget) == GIMMICK_DYNAMAX)
            {
                BattleScriptCall(BattleScript_HitSwitchTargetDynamaxed);
            }
            else
            {
                gBattleScripting.switchCase = B_SWITCH_HIT;
                BattleScriptCall(BattleScript_TryHitSwitchTarget);
            }
            result = MOVEEND_RESULT_RUN_SCRIPT;
        }
        break;
    case EFFECT_SMACK_DOWN:
        if (!IsBattlerGrounded(gBattlerTarget, GetBattlerAbility(gBattlerTarget), GetBattlerHoldEffect(gBattlerTarget))
         && IsBattlerTurnDamaged(gBattlerTarget)
         && IsBattlerAlive(gBattlerTarget)
         && !DoesSubstituteBlockMove(gBattlerAttacker, gBattlerTarget, gCurrentMove))
        {
            gBattleMons[gBattlerTarget].volatiles.smackDown = TRUE;
            gBattleMons[gBattlerTarget].volatiles.telekinesis = FALSE;
            gBattleMons[gBattlerTarget].volatiles.magnetRise = FALSE;
            gBattleMons[gBattlerTarget].volatiles.semiInvulnerable = STATE_NONE;
            BattleScriptCall(BattleScript_MoveEffectSmackDown);
            result = MOVEEND_RESULT_RUN_SCRIPT;
        }
        break;
    case EFFECT_RECOIL_IF_MISS:
        if (IsBattlerAlive(gBattlerAttacker)
         && IsBattlerUnaffectedByMove(gBattlerTarget)
         && !gBattleStruct->unableToUseMove)
        {
            s32 recoil = 0;
            if (B_CRASH_IF_TARGET_IMMUNE == GEN_4 && gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_DOESNT_AFFECT_FOE)
            {
                recoil = GetNonDynamaxMaxHP(gBattlerTarget) / 2;
            }
            if (B_RECOIL_IF_MISS_DMG >= GEN_5)
            {
                recoil = GetNonDynamaxMaxHP(gBattlerAttacker) / 2;
            }
            else if (B_RECOIL_IF_MISS_DMG >= GEN_3)
            {
                if ((GetNonDynamaxMaxHP(gBattlerTarget) / 2) < gBattleStruct->moveDamage[gBattlerTarget])
                    recoil = gBattleStruct->moveDamage[gBattlerTarget];
                else
                    recoil = GetNonDynamaxMaxHP(gBattlerTarget) / 2;
            }
            else if (B_RECOIL_IF_MISS_DMG == GEN_2)
            {
                recoil = gBattleStruct->moveDamage[gBattlerTarget] / 8;
            }
            else
            {
                recoil = 1;
            }
            SetPassiveDamageAmount(gBattlerAttacker, recoil);
            BattleScriptCall(BattleScript_RecoilIfMiss);
            result = MOVEEND_RESULT_RUN_SCRIPT;
        }
        break;
    case EFFECT_RECOIL:
        if (IsBattlerTurnDamaged(gBattlerTarget) && IsBattlerAlive(gBattlerAttacker) && gBattleStruct->moveDamage[gBattlerTarget] > 0)
        {
            enum Ability ability = GetBattlerAbility(gBattlerAttacker);
            if (IsAbilityAndRecord(gBattlerAttacker, ability, ABILITY_ROCK_HEAD)
             || IsAbilityAndRecord(gBattlerAttacker, ability, ABILITY_MAGIC_GUARD))
                break;

            SetPassiveDamageAmount(gBattlerAttacker, gBattleScripting.savedDmg * max(1, GetMoveRecoil(gCurrentMove)) / 100);
            TryUpdateEvolutionTracker(IF_RECOIL_DAMAGE_GE, gBattleStruct->passiveHpUpdate[gBattlerAttacker], MOVE_NONE);
            BattleScriptCall(BattleScript_MoveEffectRecoil);
            result = MOVEEND_RESULT_RUN_SCRIPT;
        }
        break;
    case EFFECT_CHLOROBLAST:
        if (IsBattlerTurnDamaged(gBattlerTarget) && IsBattlerAlive(gBattlerAttacker))
        {
            enum Ability ability = GetBattlerAbility(gBattlerAttacker);
            if (IsAbilityAndRecord(gBattlerAttacker, ability, ABILITY_ROCK_HEAD)
             || IsAbilityAndRecord(gBattlerAttacker, ability, ABILITY_MAGIC_GUARD))
                break;

            s32 recoil = (GetNonDynamaxMaxHP(gBattlerAttacker) + 1) / 2; // Half of Max HP Rounded UP
            SetPassiveDamageAmount(gBattlerAttacker, recoil);
            TryUpdateEvolutionTracker(IF_RECOIL_DAMAGE_GE, gBattleStruct->passiveHpUpdate[gBattlerAttacker], MOVE_NONE);
            BattleScriptCall(BattleScript_MoveEffectRecoil);
            result = MOVEEND_RESULT_RUN_SCRIPT;
        }
        break;
    case EFFECT_RAPID_SPIN:
        if (IsBattlerTurnDamaged(gBattlerTarget) && IsBattlerAlive(gBattlerAttacker))
        {
            BattleScriptCall(BattleScript_RapidSpinAway);
            result = MOVEEND_RESULT_RUN_SCRIPT;
        }
        break;
    case EFFECT_FELL_STINGER:
        if (IsBattlerAlive(gBattlerAttacker)
         && !IsBattlerAlive(gBattlerTarget)
         && IsBattlerTurnDamaged(gBattlerTarget)
         && !NoAliveMonsForEitherParty()
         && CompareStat(gBattlerAttacker, STAT_ATK, MAX_STAT_STAGE, CMP_LESS_THAN, GetBattlerAbility(gBattlerAttacker)))
        {
            SET_STATCHANGER(STAT_ATK, GetConfig(CONFIG_FELL_STINGER_STAT_RAISE) >= GEN_7 ? 3 : 2, FALSE);
            PREPARE_STAT_BUFFER(gBattleTextBuff1, STAT_ATK);
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_FellStingerRaisesStat;
            result = MOVEEND_RESULT_RUN_SCRIPT;
        }
        break;
    case EFFECT_STONE_AXE:
        if (!IsHazardOnSide(side, HAZARDS_STEALTH_ROCK)
         && IsBattlerTurnDamaged(gBattlerTarget)
         && IsBattlerAlive(gBattlerAttacker))
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_POINTEDSTONESFLOAT;
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_StealthRockActivates;
            result = MOVEEND_RESULT_RUN_SCRIPT;
        }
        break;
    case EFFECT_CEASELESS_EDGE:
        if (gSideTimers[side].spikesAmount < 3
         && IsBattlerTurnDamaged(gBattlerTarget)
         && IsBattlerAlive(gBattlerAttacker))
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SPIKESSCATTERED;
            BattleScriptPush(gBattlescriptCurrInstr + 1);
            if (gBattleStruct->isSkyBattle)
            {
                result = MOVEEND_RESULT_CONTINUE;
            }
            else
            {
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_SpikesActivates;
                result = MOVEEND_RESULT_RUN_SCRIPT;
            }
        }
        break;
    default:
        result = MOVEEND_RESULT_CONTINUE;
        break;
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndItemEffectsAttacker2(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;
    enum HoldEffect holdEffect = GetBattlerHoldEffect(gBattlerAttacker);

    if (ItemBattleEffects(gBattlerAttacker, gBattlerTarget, holdEffect, IsOnStatusChangeActivation)
     || ItemBattleEffects(gBattlerAttacker, gBattlerTarget, holdEffect, IsOnHpThresholdActivation))
        result = MOVEEND_RESULT_RUN_SCRIPT;

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndAbilityEffectFoesFainted(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    if (AbilityBattleEffects(ABILITYEFFECT_MOVE_END_FOES_FAINTED, gBattlerAttacker, GetBattlerAbility(gBattlerAttacker), gCurrentMove, TRUE))
        result = MOVEEND_RESULT_RUN_SCRIPT;

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndSheerForce(void)
{
    if (IsSheerForceAffected(gCurrentMove, GetBattlerAbility(gBattlerAttacker)))
        gBattleScripting.moveendState = MOVEEND_EJECT_PACK;
    else
        gBattleScripting.moveendState++;

    return MOVEEND_RESULT_CONTINUE;
}

static enum MoveEndResult MoveEndShellTrap(void)
{
    for (enum BattlerId battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
    {
        if (battlerDef == gBattlerAttacker || IsBattlerAlly(battlerDef, gBattlerAttacker))
            continue;

        // Set ShellTrap to activate after the attacker's turn if target was hit by a physical move.
        if (GetMoveEffect(gChosenMoveByBattler[battlerDef]) == EFFECT_SHELL_TRAP
         && IsBattleMovePhysical(gCurrentMove)
         && IsBattlerTurnDamaged(battlerDef)
         && gProtectStructs[battlerDef].physicalBattlerId == gBattlerAttacker)
        {
            gProtectStructs[battlerDef].shellTrap = TRUE;
            if (IsDoubleBattle()) // Change move order in double battles, so the hit mon with shell trap moves immediately after being hit.
                ChangeOrderTargetAfterAttacker(); // In what order should 2 targets move that will activate a trap?
        }
    }

    gBattleScripting.moveendState++;
    return MOVEEND_RESULT_CONTINUE;
}

static enum MoveEndResult MoveEndColorChange(void)
{
    while (gBattleStruct->eventState.moveEndBattler < gBattlersCount)
    {
        enum BattlerId battler = gBattleStruct->eventState.moveEndBattler++;
        if (battler == gBattlerAttacker)
            continue;
        if (AbilityBattleEffects(ABILITYEFFECT_COLOR_CHANGE, battler, GetBattlerAbility(battler), 0, TRUE))
            return MOVEEND_RESULT_RUN_SCRIPT;
    }

    gBattleStruct->eventState.moveEndBattler = 0;
    gBattleScripting.moveendState++;
    return MOVEEND_RESULT_CONTINUE;
}

static enum MoveEndResult MoveEndKeeMarangaHpThresholdItemTarget(void)
{
    while (gBattleStruct->eventState.moveEndBattler < gBattlersCount)
    {
        enum BattlerId battlerDef = gBattleStruct->eventState.moveEndBattler++;
        if (battlerDef == gBattlerAttacker)
            continue;
        enum HoldEffect holdEffect = GetBattlerHoldEffect(battlerDef);
        if (ItemBattleEffects(battlerDef, gBattlerAttacker, holdEffect, IsKeeMarangaBerryActivation)
         || ItemBattleEffects(battlerDef, gBattlerAttacker, holdEffect, IsOnHpThresholdActivation))
            return MOVEEND_RESULT_RUN_SCRIPT;
    }

    gBattleScripting.moveendState++;
    return MOVEEND_RESULT_CONTINUE;
}

static bool32 TryRedCard(enum BattlerId battlerAtk, enum BattlerId redCardBattler, enum Move move)
{
    if (!IsBattlerAlive(redCardBattler)
     || !IsBattlerTurnDamaged(redCardBattler)
     || DoesSubstituteBlockMove(battlerAtk, redCardBattler, move)
     || !CanBattlerSwitch(battlerAtk))
        return FALSE;

    gLastUsedItem = gBattleMons[redCardBattler].item;
    SaveBattlerTarget(redCardBattler); // save battler with red card
    SaveBattlerAttacker(battlerAtk);
    gBattleScripting.battler = gBattlerTarget = redCardBattler;
    gEffectBattler = battlerAtk;
    if (gBattleStruct->battlerState[battlerAtk].commanderSpecies != SPECIES_NONE
     || GetBattlerAbility(battlerAtk) == ABILITY_GUARD_DOG
     || GetActiveGimmick(battlerAtk) == GIMMICK_DYNAMAX)
        BattleScriptCall(BattleScript_RedCardActivationNoSwitch);
    else
        BattleScriptCall(BattleScript_RedCardActivates);

    return TRUE;
}

static bool32 TryEjectButton(enum BattlerId battlerAtk, u32 ejectButtonBattler)
{
    if (!IsBattlerTurnDamaged(ejectButtonBattler)
     || !IsBattlerAlive(ejectButtonBattler)
     || !CanBattlerSwitch(ejectButtonBattler))
        return FALSE;

    gBattleScripting.battler = ejectButtonBattler;
    gLastUsedItem = gBattleMons[ejectButtonBattler].item;
    gBattleStruct->battlerState[ejectButtonBattler].usedEjectItem = TRUE;
    BattleScriptCall(BattleScript_EjectButtonActivates);
    gAiLogicData->ejectButtonSwitch = TRUE;
    return TRUE;
}

static enum MoveEndResult MoveEndCardButton(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;
    u32 redCardBattlers = 0;
    u32 ejectButtonBattlers = 0;

    // Because sorting the battlers by speed takes lots of cycles, it's better to just check if any of the battlers has the Eject items.
    for (enum BattlerId battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
    {
        if (gBattlerAttacker == battlerDef)
            continue;

        if (GetBattlerHoldEffect(battlerDef) == HOLD_EFFECT_EJECT_BUTTON)
            ejectButtonBattlers |= 1u << battlerDef;

        if (GetBattlerHoldEffect(battlerDef) == HOLD_EFFECT_RED_CARD)
            redCardBattlers |= 1u << battlerDef;
    }

    if (!redCardBattlers && !ejectButtonBattlers)
    {
        gBattleScripting.moveendState++;
        return MOVEEND_RESULT_CONTINUE;
    }

    enum BattlerId battlers[MAX_BATTLERS_COUNT] = {0, 1, 2, 3};
    SortBattlersBySpeed(battlers, FALSE);

    for (enum BattlerId battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
    {
        enum BattlerId battler = battlers[battlerDef];

        // Only fastest red card or eject button activates
        if (redCardBattlers & 1u << battler && TryRedCard(gBattlerAttacker, battler, gCurrentMove))
            result = MOVEEND_RESULT_RUN_SCRIPT;
        else if (ejectButtonBattlers & 1u << battler && TryEjectButton(gBattlerAttacker, battler))
            result = MOVEEND_RESULT_RUN_SCRIPT;

        if (result == MOVEEND_RESULT_RUN_SCRIPT)
        {
            for (enum BattlerId i = 0; i < gBattlersCount; i++)
                gBattleMons[i].volatiles.tryEjectPack = FALSE;
            gBattleScripting.moveendState = MOVEEND_JUMP_TO_HIT_ESCAPE_PLUS_ONE;
            return result;
        }
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndLifeOrbShellBell(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    if (ItemBattleEffects(gBattlerAttacker, 0, GetBattlerHoldEffect(gBattlerAttacker), IsLifeOrbShellBellActivation))
        result = MOVEEND_RESULT_RUN_SCRIPT;

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndFormChange(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    if (TryBattleFormChange(gBattlerAttacker, FORM_CHANGE_BATTLE_AFTER_MOVE, GetBattlerAbility(gBattlerAttacker)))
    {
        result = MOVEEND_RESULT_RUN_SCRIPT;
        BattleScriptCall(BattleScript_AttackerFormChangeMoveEffect);
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndEmergencyExit(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;
    u32 numEmergencyExitBattlers = 0;
    u32 emergencyExitBattlers = 0;

    // Because sorting the battlers by speed takes lots of cycles,
    // we check if EE can be activated and count how many.
    for (enum BattlerId i = 0; i < gBattlersCount; i++)
    {
        if (!IsBattleMoveStatus(gCurrentMove)
         && !gBattleStruct->unableToUseMove
         && EmergencyExitCanBeTriggered(i))
        {
            emergencyExitBattlers |= 1u << i;
            numEmergencyExitBattlers++;
        }
    }

    if (numEmergencyExitBattlers == 0)
    {
        gBattleScripting.moveendState++;
        return result;
    }

    for (enum BattlerId i = 0; i < gBattlersCount; i++)
        gBattleMons[i].volatiles.tryEjectPack = FALSE;

    enum BattlerId battlers[MAX_BATTLERS_COUNT] = {0, 1, 2, 3};
    if (numEmergencyExitBattlers > 1)
        SortBattlersBySpeed(battlers, FALSE);

    for (u32 i = 0; i < gBattlersCount; i++)
    {
        enum BattlerId battler = battlers[i];

        if (!(emergencyExitBattlers & 1u << battler))
            continue;

        gBattleScripting.battler = battler;
        BattleScriptCall(BattleScript_EmergencyExit);
        result = MOVEEND_RESULT_RUN_SCRIPT;
        break; // Only the fastest Emergency Exit / Wimp Out activates
    }

    if (result == MOVEEND_RESULT_RUN_SCRIPT)
        gBattleScripting.moveendState = MOVEEND_JUMP_TO_HIT_ESCAPE_PLUS_ONE;
    else
        gBattleScripting.moveendState++;
    return result;
}

static inline bool32 CanEjectPackTrigger(enum BattlerId battlerAtk, enum BattlerId battlerDef, enum BattleMoveEffects moveEffect)
{
    if (gBattleMons[battlerDef].volatiles.tryEjectPack
     && GetBattlerHoldEffect(battlerDef) == HOLD_EFFECT_EJECT_PACK
     && IsBattlerAlive(battlerDef)
     && CountUsablePartyMons(battlerDef) > 0
     && !gProtectStructs[battlerDef].disableEjectPack
     && !(moveEffect == EFFECT_HIT_SWITCH_TARGET && CanBattlerSwitch(battlerAtk))
     && !(moveEffect == EFFECT_PARTING_SHOT && CanBattlerSwitch(battlerAtk)))
        return TRUE;
    return FALSE;
}

static enum MoveEndResult MoveEndEjectPack(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;
    u32 ejectPackBattlers = 0;
    u32 numEjectPackBattlers = 0;

    // Because sorting the battlers by speed takes lots of cycles, it's better to just check if any of the battlers has the Eject items.
    for (enum BattlerId i = 0; i < gBattlersCount; i++)
    {
        if (CanEjectPackTrigger(gBattlerAttacker, i, GetMoveEffect(gCurrentMove)))
        {
            ejectPackBattlers |= 1u << i;
            numEjectPackBattlers++;
        }
    }

    if (numEjectPackBattlers == 0)
    {
        gBattleScripting.moveendState++;
        return result;
    }

    enum BattlerId battlers[MAX_BATTLERS_COUNT] = {0, 1, 2, 3};
    if (numEjectPackBattlers > 1)
        SortBattlersBySpeed(battlers, FALSE);

    for (enum BattlerId i = 0; i < gBattlersCount; i++)
        gBattleMons[i].volatiles.tryEjectPack = FALSE;

    for (u32 i = 0; i < gBattlersCount; i++)
    {
        enum BattlerId battler = battlers[i];

        if (!(ejectPackBattlers & 1u << battler))
            continue;

        gBattleScripting.battler = battler;
        gLastUsedItem = gBattleMons[battler].item;
        gBattleStruct->battlerState[battler].usedEjectItem = TRUE;
        BattleScriptCall(BattleScript_EjectPackActivates);
        gAiLogicData->ejectPackSwitch = TRUE;
        result = MOVEEND_RESULT_RUN_SCRIPT;
        break; // Only the fastest Eject item activates
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndHitEscape(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    if (GetMoveEffect(gCurrentMove) == EFFECT_HIT_ESCAPE
     && !gBattleStruct->unableToUseMove
     && IsBattlerTurnDamaged(gBattlerTarget)
     && IsBattlerAlive(gBattlerAttacker)
     && !NoAliveMonsForBattlerSide(gBattlerTarget))
    {
        result = MOVEEND_RESULT_RUN_SCRIPT;
        BattleScriptCall(BattleScript_EffectHitEscape);
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndItemsEffectsAll(void)
{
    while (gBattleStruct->eventState.moveEndBattler < gBattlersCount)
    {
        enum BattlerId battler = gBattleStruct->eventState.moveEndBattler++;
        enum HoldEffect holdEffect = GetBattlerHoldEffect(battler);
        if (ItemBattleEffects(battler, 0, holdEffect, IsOnStatusChangeActivation)
         || ItemBattleEffects(battler, 0, holdEffect, IsOnHpThresholdActivation))
            return MOVEEND_RESULT_RUN_SCRIPT;
    }

    gBattleStruct->eventState.moveEndBattler = 0;
    gBattleScripting.moveendState++;
    return MOVEEND_RESULT_CONTINUE;
}

static enum MoveEndResult MoveEndWhiteHerb(void)
{
    while (gBattleStruct->eventState.moveEndBattler < gBattlersCount)
    {
        enum BattlerId battler = gBattleStruct->eventState.moveEndBattler++;
        if (!IsBattlerAlive(battler))
            continue;

        if (ItemBattleEffects(battler, 0, GetBattlerHoldEffect(battler), IsWhiteHerbActivation))
            return MOVEEND_RESULT_RUN_SCRIPT;
    }

    gBattleStruct->eventState.moveEndBattler = 0;
    gBattleScripting.moveendState++;
    return MOVEEND_RESULT_CONTINUE;
}

static enum MoveEndResult MoveEndOpportunist(void)
{
    while (gBattleStruct->eventState.moveEndBattler < gBattlersCount)
    {
        enum BattlerId battler = gBattleStruct->eventState.moveEndBattler++;
        if (!IsBattlerAlive(battler))
            continue;
        if (AbilityBattleEffects(ABILITYEFFECT_OPPORTUNIST, battler, GetBattlerAbility(battler), 0, TRUE))
            return MOVEEND_RESULT_RUN_SCRIPT;
    }

    gBattleStruct->eventState.moveEndBattler = 0;
    gBattleScripting.moveendState++;
    return MOVEEND_RESULT_CONTINUE;
}

static enum MoveEndResult MoveEndMirrorHerb(void)
{
    while (gBattleStruct->eventState.moveEndBattler < gBattlersCount)
    {
        enum BattlerId battler = gBattleStruct->eventState.moveEndBattler++;
        if (!IsBattlerAlive(battler))
            continue;

        if (ItemBattleEffects(battler, 0, GetBattlerHoldEffect(battler), IsMirrorHerbActivation))
            return MOVEEND_RESULT_RUN_SCRIPT;
    }

    gBattleStruct->eventState.moveEndBattler = 0;
    gBattleScripting.moveendState++;
    return MOVEEND_RESULT_CONTINUE;
}

static enum MoveEndResult MoveEndPickpocket(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    if (IsBattlerAlive(gBattlerAttacker)
     && gBattleMons[gBattlerAttacker].item != ITEM_NONE
     && !GetBattlerPartyState(gBattlerAttacker)->isKnockedOff) // Gen3 edge case where the knocked of item was not removed
    {
        enum BattlerId battlers[MAX_BATTLERS_COUNT] = {0, 1, 2, 3};
        SortBattlersBySpeed(battlers, FALSE); // Pickpocket activates for fastest mon without item
        for (u32 i = 0; i < gBattlersCount; i++)
        {
            enum BattlerId battlerDef = battlers[i];
            if (battlerDef != gBattlerAttacker
              && !IsBattlerUnaffectedByMove(battlerDef)
              && GetBattlerAbility(battlerDef) == ABILITY_PICKPOCKET
              && IsMoveMakingContact(gBattlerAttacker, battlerDef, GetBattlerAbility(gBattlerAttacker), GetBattlerHoldEffect(gBattlerAttacker), gCurrentMove)
              && IsBattlerTurnDamaged(battlerDef)
              && !DoesSubstituteBlockMove(gBattlerAttacker, battlerDef, gCurrentMove)
              && IsBattlerAlive(battlerDef)
              && gBattleMons[battlerDef].item == ITEM_NONE
              && CanStealItem(battlerDef, gBattlerAttacker, gBattleMons[gBattlerAttacker].item))
            {
                gBattlerTarget = gBattlerAbility = battlerDef;
                // Battle scripting is super brittle so we shall do the item exchange now (if possible)
                if (GetBattlerAbility(gBattlerAttacker) != ABILITY_STICKY_HOLD)
                    StealTargetItem(battlerDef, gBattlerAttacker);  // Target takes attacker's item

                gEffectBattler = gBattlerAttacker;
                BattleScriptCall(BattleScript_Pickpocket);   // Includes sticky hold check to print separate string
                result = MOVEEND_RESULT_RUN_SCRIPT;
                break; // Pickpocket activates on fastest mon, so exit loop.
            }
        }
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndThirdMoveBlock(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;
    enum BattleMoveEffects moveEffect = GetMoveEffect(gCurrentMove);

    switch (moveEffect)
    {
    case EFFECT_STEEL_ROLLER:
        if (gFieldStatuses & STATUS_FIELD_TERRAIN_ANY && IsBattlerTurnDamaged(gBattlerTarget))
        {
            BattleScriptCall(BattleScript_RemoveTerrain);
            result = MOVEEND_RESULT_RUN_SCRIPT;
        }
        break;
    case EFFECT_ICE_SPINNER:
        if (gFieldStatuses & STATUS_FIELD_TERRAIN_ANY
         && gLastPrintedMoves[gBattlerAttacker] == gCurrentMove
         && IsBattlerAlive(gBattlerAttacker)
         && IsBattlerTurnDamaged(gBattlerTarget))
        {
            BattleScriptCall(BattleScript_RemoveTerrain);
            result = MOVEEND_RESULT_RUN_SCRIPT;
        }
        break;
    case EFFECT_NATURAL_GIFT:
        if (!gBattleStruct->unableToUseMove && GetItemPocket(gBattleMons[gBattlerAttacker].item) == POCKET_BERRIES)
        {
            enum Item item = gBattleMons[gBattlerAttacker].item;
            gBattleMons[gBattlerAttacker].item = ITEM_NONE;
            gBattleStruct->battlerState[gBattlerAttacker].canPickupItem = TRUE;
            GetBattlerPartyState(gBattlerAttacker)->usedHeldItem = item;
            CheckSetUnburden(gBattlerAttacker);
            BtlController_EmitSetMonData(
                gBattlerAttacker,
                B_COMM_TO_CONTROLLER,
                REQUEST_HELDITEM_BATTLE,
                0,
                sizeof(gBattleMons[gBattlerAttacker].item),
                &gBattleMons[gBattlerAttacker].item);
            MarkBattlerForControllerExec(gBattlerAttacker);
            ClearBattlerItemEffectHistory(gBattlerAttacker);

            if (!TrySymbiosis(gBattlerAttacker, item, TRUE))
                result = MOVEEND_RESULT_RUN_SCRIPT;
        }
        break;
    default:
        break;
    }

    gBattleScripting.moveendState++;
    return result;
}

static bool32 ShouldSetStompingTantrumTimer(void)
{
    u32 numNotAffectedTargets = 0;

    if (gBattleStruct->pledgeMove == TRUE // Is the battler that uses the first Pledge move in the combo
     || gBattleStruct->unableToUseMove)
        return TRUE;

    if (!IsDoubleSpreadMove())
        return gBattleStruct->moveResultFlags[gBattlerTarget] & (MOVE_RESULT_FAILED | MOVE_RESULT_DOESNT_AFFECT_FOE);

    for (u32 battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
    {
        if (gBattlerAttacker == battlerDef)
            continue;
        if (gBattleStruct->moveResultFlags[battlerDef] & (MOVE_RESULT_FAILED | MOVE_RESULT_DOESNT_AFFECT_FOE))
            numNotAffectedTargets++;
    }

    return numNotAffectedTargets == gBattleStruct->numSpreadTargets;
}

static enum MoveEndResult MoveEndClearBits(void)
{
    ValidateBattlers();

    enum Move originallyUsedMove = GetOriginallyUsedMove(gChosenMove);
    enum Type moveType = GetBattleMoveType(gCurrentMove);
    enum BattleMoveEffects moveEffect = GetMoveEffect(gCurrentMove);

    if (ShouldSetStompingTantrumTimer())
        gBattleStruct->battlerState[gBattlerAttacker].stompingTantrumTimer = 2;

    if (gSpecialStatuses[gBattlerAttacker].instructedChosenTarget)
        gBattleStruct->moveTarget[gBattlerAttacker] = gSpecialStatuses[gBattlerAttacker].instructedChosenTarget & 0x3;
    if (gSpecialStatuses[gBattlerAttacker].dancerOriginalTarget)
        gBattleStruct->moveTarget[gBattlerAttacker] = gSpecialStatuses[gBattlerAttacker].dancerOriginalTarget & 0x3;

    // If the Pokémon needs to keep track of move usage for its evolutions, do it
    if (originallyUsedMove != MOVE_NONE)
        TryUpdateEvolutionTracker(IF_USED_MOVE_X_TIMES, 1, originallyUsedMove);

    if (B_RAMPAGE_CANCELLING >= GEN_5
      && MoveHasAdditionalEffectSelf(gCurrentMove, MOVE_EFFECT_THRASH)           // If we're rampaging
      && IsBattlerUnaffectedByMove(gBattlerTarget)  // And it is unusable
      && gBattleMons[gBattlerAttacker].volatiles.rampageTurns != 1)  // And won't end this turn
        CancelMultiTurnMoves(gBattlerAttacker, SKY_DROP_IGNORE); // Cancel it

    SetSameMoveTurnValues(moveEffect);
    TryClearChargeVolatile(moveType);
    gProtectStructs[gBattlerAttacker].shellTrap = FALSE;
    gBattleStruct->battlerState[gBattlerAttacker].ateBoost = FALSE;
    gBattleScripting.moveEffect = MOVE_EFFECT_NONE;
    gBattleStruct->swapDamageCategory = FALSE;
    gBattleStruct->categoryOverride = FALSE;
    gBattleStruct->additionalEffectsCounter = 0;
    gBattleStruct->poisonPuppeteerConfusion = FALSE;
    gBattleStruct->fickleBeamBoosted = FALSE;
    gBattleStruct->battlerState[gBattlerAttacker].usedMicleBerry = FALSE;
    gBattleStruct->toxicChainPriority = FALSE;
    if (gBattleStruct->unableToUseMove)
        gBattleStruct->pledgeMove = FALSE;
    if (GetActiveGimmick(gBattlerAttacker) == GIMMICK_Z_MOVE)
        SetActiveGimmick(gBattlerAttacker, GIMMICK_NONE);
    if (gBattleMons[gBattlerAttacker].volatiles.destinyBond > 0)
        gBattleMons[gBattlerAttacker].volatiles.destinyBond--;
    // check if Stellar type boost should be used up
    if (GetActiveGimmick(gBattlerAttacker) == GIMMICK_TERA
     && GetBattlerTeraType(gBattlerAttacker) == TYPE_STELLAR
     && GetMoveCategory(gCurrentMove) != DAMAGE_CATEGORY_STATUS
     && IsTypeStellarBoosted(gBattlerAttacker, moveType))
        ExpendTypeStellarBoost(gBattlerAttacker, moveType);
    memset(gQueuedStatBoosts, 0, sizeof(gQueuedStatBoosts));

    for (enum BattlerId i = 0; i < gBattlersCount; i++)
    {
        gBattleStruct->battlerState[gBattlerAttacker].targetsDone[i] = FALSE;
        gBattleMons[i].volatiles.tryEjectPack = FALSE;

        if (gBattleStruct->battlerState[i].commanderSpecies != SPECIES_NONE && !IsBattlerAlive(i))
        {
            enum BattlerId partner = BATTLE_PARTNER(i);
            gBattleStruct->battlerState[i].commanderSpecies = SPECIES_NONE;
            if (IsBattlerAlive(partner))
                gBattleMons[partner].volatiles.semiInvulnerable = STATE_NONE;
        }
    }

    // Need to check a specific battle during the end turn and dancer
    gBattleMons[gBattlerAttacker].volatiles.unableToUseMove = gBattleStruct->unableToUseMove;
    gBattleScripting.moveendState++;

    return MOVEEND_RESULT_CONTINUE;
}

static enum MoveEndResult MoveEndDancer(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    if (IsDanceMove(gCurrentMove) && !gBattleStruct->snatchedMoveIsUsed)
    {
        enum BattlerId battler;
        u32 nextDancer = 0;
        bool32 hasDancerTriggered = FALSE;

        for (battler = 0; battler < gBattlersCount; battler++)
        {
            if (gSpecialStatuses[battler].dancerUsedMove)
            {
                // in case a battler fails to act on a Dancer-called move
                hasDancerTriggered = TRUE;
                break;
            }
        }

        if (!(!IsAnyTargetAffected()
         || (gBattleStruct->unableToUseMove && !hasDancerTriggered)
         || (!gSpecialStatuses[gBattlerAttacker].dancerUsedMove && gBattleStruct->bouncedMoveIsUsed)))
        {   // Dance move succeeds
            // Set target for other Dancer mons; set bit so that mon cannot activate Dancer off of its own move
            if (!gSpecialStatuses[gBattlerAttacker].dancerUsedMove)
            {
                gBattleScripting.savedBattler = gBattlerTarget | 0x4;
                gBattleScripting.savedBattler |= (gBattlerAttacker << 4);
                gSpecialStatuses[gBattlerAttacker].dancerUsedMove = TRUE;
            }
            for (battler = 0; battler < gBattlersCount; battler++)
            {
                if (GetBattlerAbility(battler) == ABILITY_DANCER && !gSpecialStatuses[battler].dancerUsedMove)
                {
                    if (!nextDancer || (gBattleMons[battler].speed < gBattleMons[nextDancer & 0x3].speed))
                        nextDancer = battler | 0x4;
                }
            }
            if (nextDancer && AbilityBattleEffects(ABILITYEFFECT_MOVE_END_OTHER, nextDancer & 0x3, 0, gCurrentMove, TRUE))
                result = MOVEEND_RESULT_RUN_SCRIPT;
        }
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEndPursuitNextAction(void)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    if (gBattleStruct->battlerState[gBattlerTarget].pursuitTarget)
    {
        u32 storedTarget = gBattlerTarget;
        if (SetTargetToNextPursuiter(gBattlerTarget))
        {
            ChangeOrderTargetAfterAttacker();
            gBattleStruct->moveTarget[gBattlerTarget] = storedTarget;
            gBattlerTarget = storedTarget;
        }
        else if (IsBattlerAlive(gBattlerTarget))
        {
            gBattlerAttacker = gBattlerTarget;
            if (gBattleStruct->pursuitStoredSwitch == PARTY_SIZE)
                gBattlescriptCurrInstr = BattleScript_MoveSwitchOpenPartyScreen;
            else
                gBattlescriptCurrInstr = BattleScript_DoSwitchOut;
            gBattleStruct->monToSwitchIntoId[gBattlerTarget] = gBattleStruct->pursuitStoredSwitch;
            ClearPursuitValues();
            result = MOVEEND_RESULT_RUN_SCRIPT;
        }
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult (*const sMoveEndHandlers[])(void) =
{
    [MOVEEND_SET_VALUES] = MoveEndSetValues,
    [MOVEEND_PROTECT_LIKE_EFFECT] = MoveEndProtectLikeEffect,
    [MOVEEND_ABSORB] = MoveEndAbsorb,
    [MOVEEND_RAGE] = MoveEndRage,
    [MOVEEND_SYNCHRONIZE_TARGET] = MoveEndSynchronizeTarget,
    [MOVEEND_ABILITIES] = MoveEndAbilities,
    [MOVEEND_FORM_CHANGE_ON_HIT] = MoveEndFormChangeOnHit,
    [MOVEEND_ABILITIES_ATTACKER] = MoveEndAbilitiesAttacker,
    [MOVEEND_STATUS_IMMUNITY_ABILITIES] = MoveEndStatusImmunityAbilities,
    [MOVEEND_SYNCHRONIZE_ATTACKER] = MoveEndSynchronizeAttacker,
    [MOVEEND_ATTACKER_INVISIBLE] = MoveEndAttackerInvisible,
    [MOVEEND_ATTACKER_VISIBLE] = MoveEndAttackerVisible,
    [MOVEEND_TARGET_VISIBLE] = MoveEndTargetVisible,
    [MOVEEND_ITEM_EFFECTS_TARGET] = MoveEndItemEffectsTarget,
    [MOVEEND_ITEM_EFFECTS_ATTACKER_1] = MoveEndItemEffectsAttacker1,
    [MOVEEND_SYMBIOSIS] = MoveEndSymbiosis,
    [MOVEEND_SUBSTITUTE] = MoveEndSubstitute,
    [MOVEEND_FAINT_BLOCK] = MoveEndFaintBlock,
    [MOVEEND_SKY_DROP_CONFUSE] = MoveEndSkyDropConfuse,
    [MOVEEND_UPDATE_LAST_MOVES] = MoveEndUpdateLastMoves,
    [MOVEEND_MIRROR_MOVE] = MoveEndMirrorMove,
    [MOVEEND_DEFROST] = MoveEndDefrost,
    [MOVEEND_NEXT_TARGET] = MoveEndNextTarget,
    [MOVEEND_HP_THRESHOLD_ITEMS_TARGET] = MoveEndHpThresholdItemsTarget,
    [MOVEEND_MULTIHIT_MOVE] = MoveEndMultihitMove,
    [MOVEEND_MOVE_BLOCK] = MoveEndMoveBlock,
    [MOVEEND_ITEM_EFFECTS_ATTACKER_2] = MoveEndItemEffectsAttacker2,
    [MOVEEND_ABILITY_EFFECT_FOES_FAINTED] = MoveEndAbilityEffectFoesFainted,
    [MOVEEND_SHEER_FORCE] = MoveEndSheerForce,
    [MOVEEND_SHELL_TRAP] = MoveEndShellTrap,
    [MOVEEND_COLOR_CHANGE] = MoveEndColorChange,
    [MOVEEND_KEE_MARANGA_HP_THRESHOLD_ITEM_TARGET] = MoveEndKeeMarangaHpThresholdItemTarget,
    [MOVEEND_CARD_BUTTON] = MoveEndCardButton,
    [MOVEEND_LIFE_ORB_SHELL_BELL] = MoveEndLifeOrbShellBell,
    [MOVEEND_FORM_CHANGE] = MoveEndFormChange,
    [MOVEEND_EMERGENCY_EXIT] = MoveEndEmergencyExit,
    [MOVEEND_EJECT_PACK] = MoveEndEjectPack,
    [MOVEEND_HIT_ESCAPE] = MoveEndHitEscape,
    [MOVEEND_ITEMS_EFFECTS_ALL] = MoveEndItemsEffectsAll,
    [MOVEEND_WHITE_HERB] = MoveEndWhiteHerb,
    [MOVEEND_OPPORTUNIST] = MoveEndOpportunist,
    [MOVEEND_MIRROR_HERB] = MoveEndMirrorHerb,
    [MOVEEND_PICKPOCKET] = MoveEndPickpocket,
    [MOVEEND_THIRD_MOVE_BLOCK] = MoveEndThirdMoveBlock,
    [MOVEEND_CLEAR_BITS] = MoveEndClearBits,
    [MOVEEND_DANCER] = MoveEndDancer,
    [MOVEEND_PURSUIT_NEXT_ACTION] = MoveEndPursuitNextAction,
};

enum MoveEndResult DoMoveEnd(enum MoveEndState endMode, enum MoveEndState endState)
{
    enum MoveEndResult result = MOVEEND_RESULT_CONTINUE;

    do
    {
        result = sMoveEndHandlers[gBattleScripting.moveendState]();

        if (endMode == 1 && result == MOVEEND_RESULT_CONTINUE)
            gBattleScripting.moveendState = MOVEEND_COUNT;
        if (endMode == 2 && endState == gBattleScripting.moveendState)
            gBattleScripting.moveendState = MOVEEND_COUNT;

    } while (gBattleScripting.moveendState != MOVEEND_COUNT && result == MOVEEND_RESULT_CONTINUE);

    return result;
}

// Utility functions

static void ValidateBattlers(void)
{
    assertf(gBattlerAttacker < gBattlersCount, "invalid gBattlerAttacker: %d\nmove: %S", gBattlerAttacker, GetMoveName(gCurrentMove));
    assertf(gBattlerTarget < gBattlersCount, "invalid gBattlerTarget: %d\nmove: %S", gBattlerTarget, GetMoveName(gCurrentMove));

    // More calls to SaveBattlerAttacker than RestoreBattlerAttacker.
    assertf(gBattleStruct->savedAttackerCount == 0, "savedAttackerCount is greater than 0");

    // More calls to SaveBattlerTarget than RestoreBattlerTarget.
    assertf(gBattleStruct->savedTargetCount == 0, "savedTargetCount is greater than 0");
}

static enum Move GetOriginallyUsedMove(enum Move chosenMove)
{
    return (gChosenMove == MOVE_UNAVAILABLE) ? MOVE_NONE : gChosenMove;
}

static void SetSameMoveTurnValues(enum BattleMoveEffects moveEffect)
{
    bool32 increment = IsAnyTargetAffected()
                    && !gBattleStruct->unableToUseMove
                    && gLastResultingMoves[gBattlerAttacker] == gCurrentMove;

    switch (moveEffect)
    {
    case EFFECT_FURY_CUTTER:
        if (increment && gBattleMons[gBattlerAttacker].volatiles.furyCutterCounter < 5)
            gBattleMons[gBattlerAttacker].volatiles.furyCutterCounter++;
        else
            gBattleMons[gBattlerAttacker].volatiles.furyCutterCounter = 0;
        break;
    case EFFECT_ROLLOUT:
        if (increment && ++gBattleMons[gBattlerAttacker].volatiles.rolloutTimer < 5)
        {
            gBattleMons[gBattlerAttacker].volatiles.multipleTurns = TRUE;
            gLockedMoves[gBattlerAttacker] = gCurrentMove;
        }
        else
        {
            gBattleMons[gBattlerAttacker].volatiles.multipleTurns = FALSE;
            gBattleMons[gBattlerAttacker].volatiles.rolloutTimer = 0;
        }
        break;
    case EFFECT_ECHOED_VOICE:
        if (!gBattleStruct->unableToUseMove) // Increment even if targets unaffected
            gBattleStruct->incrementEchoedVoice = TRUE;
        break;
    default: // not consecutive
        gBattleMons[gBattlerAttacker].volatiles.rolloutTimer = 0;
        gBattleMons[gBattlerAttacker].volatiles.furyCutterCounter = 0;
        break;
    }

    if (increment)
        gBattleMons[gBattlerAttacker].volatiles.metronomeItemCounter++;
    else
        gBattleMons[gBattlerAttacker].volatiles.metronomeItemCounter = 0;
}

static void TryClearChargeVolatile(enum Type moveType)
{
    if (B_CHARGE < GEN_9) // Prior to gen9, charge is cleared during the end turn
        return;

    if (moveType == TYPE_ELECTRIC && gBattleMons[gBattlerAttacker].volatiles.chargeTimer == 1)
        gBattleMons[gBattlerAttacker].volatiles.chargeTimer = 0;

    for (enum BattlerId battler = 0; battler < gBattlersCount; battler++)
    {
        if (gBattleMons[battler].volatiles.chargeTimer == 2) // Has been set this turn by move or ability
            gBattleMons[battler].volatiles.chargeTimer--;
    }
}

static inline bool32 IsBattlerUsingBeakBlast(enum BattlerId battler)
{
    if (gChosenActionByBattler[battler] != B_ACTION_USE_MOVE)
        return FALSE;
    if (GetMoveEffect(gChosenMoveByBattler[battler]) != EFFECT_BEAK_BLAST)
        return FALSE;
    return !HasBattlerActedThisTurn(battler);
}

// Is there any point in still doing this?
void MoveValuesCleanUp(void)
{
    gBattleScripting.moveEffect = MOVE_EFFECT_NONE;
    gBattleStruct->synchronizeMoveEffect = MOVE_EFFECT_NONE;
    gBattleCommunication[MISS_TYPE] = 0;
}

static void RequestNonVolatileChangee(enum BattlerId battlerAtk)
{
    BtlController_EmitSetMonData(
        battlerAtk,
        B_COMM_TO_CONTROLLER,
        REQUEST_STATUS_BATTLE,
        0,
        4,
        &gBattleMons[battlerAtk].status1);
    MarkBattlerForControllerExec(battlerAtk);
}

static enum Move GetMirrorMoveMove(void)
{
    s32 i, validMovesCount;
    enum Move move = MOVE_NONE;
    enum Move validMoves[MAX_BATTLERS_COUNT] = {MOVE_NONE};

    for (validMovesCount = 0, i = 0; i < gBattlersCount; i++)
    {
        if (i != gBattlerAttacker)
        {
            move = gBattleStruct->lastTakenMoveFrom[gBattlerAttacker][i];
            if (move != MOVE_NONE && move != MOVE_UNAVAILABLE)
            {
                validMoves[validMovesCount] = move;
                validMovesCount++;
            }
        }
    }

    move = gBattleStruct->lastTakenMove[gBattlerAttacker];
    if ((move == MOVE_NONE || move == MOVE_UNAVAILABLE) && validMovesCount != 0)
        move = validMoves[Random() % validMovesCount];

    if (GetActiveGimmick(gBattlerAttacker) == GIMMICK_Z_MOVE && !IsBattleMoveStatus(move))
        move = GetTypeBasedZMove(move);

    return move;
}

static bool32 InvalidMetronomeMove(u32 move)
{
    return GetMoveEffect(move) == EFFECT_PLACEHOLDER
        || IsMoveMetronomeBanned(move);
}

static enum Move GetMetronomeMove(void)
{
    enum Move move = MOVE_NONE;

#if B_METRONOME_MOVES >= GEN_9
    u32 moveCount = MOVES_COUNT_GEN9;
#elif B_METRONOME_MOVES >= GEN_8
    u32 moveCount = MOVES_COUNT_GEN8;
#elif B_METRONOME_MOVES >= GEN_7
    u32 moveCount = MOVES_COUNT_GEN7;
#elif B_METRONOME_MOVES >= GEN_6
    u32 moveCount = MOVES_COUNT_GEN6;
#elif B_METRONOME_MOVES >= GEN_5
    u32 moveCount = MOVES_COUNT_GEN5;
#elif B_METRONOME_MOVES >= GEN_4
    u32 moveCount = MOVES_COUNT_GEN4;
#elif B_METRONOME_MOVES >= GEN_3
    u32 moveCount = MOVES_COUNT_GEN3;
#elif B_METRONOME_MOVES >= GEN_2
    u32 moveCount = MOVES_COUNT_GEN2;
#else
    u32 moveCount = MOVES_COUNT_GEN1;
#endif

    move = RandomUniformExcept(RNG_METRONOME, 1, moveCount - 1, InvalidMetronomeMove);
    return move;
}

static enum Move GetAssistMove(void)
{
    enum Move move = MOVE_NONE;
    u32 chooseableMovesNo = 0;
    struct Pokemon *party;
    enum Move validMoves[PARTY_SIZE * MAX_MON_MOVES] = {MOVE_NONE};

    party = GetBattlerParty(gBattlerAttacker);

    for (u32 monId = 0; monId < PARTY_SIZE; monId++)
    {
        if (monId == gBattlerPartyIndexes[gBattlerAttacker])
            continue;
        if (GetMonData(&party[monId], MON_DATA_SPECIES_OR_EGG) == SPECIES_NONE)
            continue;
        if (GetMonData(&party[monId], MON_DATA_SPECIES_OR_EGG) == SPECIES_EGG)
            continue;

        for (u32 moveId = 0; moveId < MAX_MON_MOVES; moveId++)
        {
            enum Move move = GetMonData(&party[monId], MON_DATA_MOVE1 + moveId);

            if (IsMoveAssistBanned(move))
                continue;

            validMoves[chooseableMovesNo++] = move;
        }
    }

    if (chooseableMovesNo)
        move = validMoves[Random() % chooseableMovesNo];

    return move;
}

enum Move GetNaturePowerMove(void)
{
    enum Move move = gBattleEnvironmentInfo[gBattleEnvironment].naturePower;
    if (gFieldStatuses & STATUS_FIELD_MISTY_TERRAIN)
        move = MOVE_MOONBLAST;
    else if (gFieldStatuses & STATUS_FIELD_ELECTRIC_TERRAIN)
        move = MOVE_THUNDERBOLT;
    else if (gFieldStatuses & STATUS_FIELD_GRASSY_TERRAIN)
        move = MOVE_ENERGY_BALL;
    else if (gFieldStatuses & STATUS_FIELD_PSYCHIC_TERRAIN)
        move = MOVE_PSYCHIC;
    else if (gBattleEnvironmentInfo[gBattleEnvironment].naturePower == MOVE_NONE)
        move = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT;

    return move;
}

static enum Move GetSleepTalkMove(void)
{
    enum Move move = MOVE_NONE;

    u32 i, unusableMovesBits = 0, movePosition;

    if (GetBattlerAbility(gBattlerAttacker) != ABILITY_COMATOSE
     && !(gBattleMons[gBattlerAttacker].status1 & STATUS1_SLEEP))
        return move;

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (IsMoveSleepTalkBanned(gBattleMons[gBattlerAttacker].moves[i])
            || gBattleMoveEffects[GetMoveEffect(gBattleMons[gBattlerAttacker].moves[i])].twoTurnEffect)
            unusableMovesBits |= (1 << (i));
    }

    unusableMovesBits = CheckMoveLimitations(gBattlerAttacker, unusableMovesBits, ~(MOVE_LIMITATION_PP | MOVE_LIMITATION_CHOICE_ITEM));
    if (unusableMovesBits == ALL_MOVES_MASK) // all 4 moves cannot be chosen
        return move;

    // Set Sleep Talk as used move, so it works with Last Resort.
    gBattleMons[gBattlerAttacker].volatiles.usedMoves |= 1u << gCurrMovePos;
    do
    {
        movePosition = MOD(Random(), MAX_MON_MOVES);
    } while ((1u << movePosition) & unusableMovesBits);

    move = gBattleMons[gBattlerAttacker].moves[movePosition];
    gCurrMovePos = movePosition;

    return move;
}

static enum Move GetCopycatMove(void)
{
    if (gLastUsedMove == MOVE_NONE
     || gLastUsedMove == MOVE_UNAVAILABLE
     || IsMoveCopycatBanned(gLastUsedMove)
     || IsZMove(gLastUsedMove))
        return MOVE_NONE;

    return gLastUsedMove;
}

static enum Move GetMeFirstMove(void)
{
    enum Move move = GetBattlerChosenMove(gBattlerTarget);

    if (IsBattleMoveStatus(move)
     || IsMoveMeFirstBanned(move)
     || HasBattlerActedThisTurn(gBattlerTarget))
        return MOVE_NONE;

    return move;
}

static bool32 CanBattlerBounceBackMove(struct BattleContext *ctx)
{
    return TryMagicBounce(ctx) || TryMagicCoat(ctx);
}

static bool32 TryMagicBounce(struct BattleContext *ctx)
{
    if (!MoveCanBeBouncedBack(ctx->move))
        return FALSE;

    if (gBattleStruct->magicBounceActive || gBattleStruct->bouncedMoveIsUsed)
        return FALSE;

    if (ctx->abilityDef != ABILITY_MAGIC_BOUNCE)
        return FALSE;

    gBattleStruct->magicBounceActive = TRUE;
    gBattleStruct->moveBouncer = ctx->battlerDef;

    return TRUE;
}

static bool32 TryMagicCoat(struct BattleContext *ctx)
{
    if (!MoveCanBeBouncedBack(ctx->move) || gBattleStruct->magicBounceActive) // Magic Bounce has precedence over magic coat
        return FALSE;

    if (gBattleStruct->magicCoatActive || gBattleStruct->bouncedMoveIsUsed)
        return FALSE;

    if (!gProtectStructs[ctx->battlerDef].bounceMove)
        return FALSE;

    gBattleStruct->magicCoatActive = TRUE;
    gBattleStruct->moveBouncer = ctx->battlerDef;

    return TRUE;
}

static bool32 TryActivatePowderStatus(enum Move move)
{
    enum Move partnerMove = GetBattlerChosenMove(BATTLE_PARTNER(gBattlerAttacker));
    if (!gBattleMons[gBattlerAttacker].volatiles.powder)
        return FALSE;
    if (GetBattleMoveType(move) == TYPE_FIRE && !gBattleStruct->pledgeMove)
        return TRUE;
    if (move == MOVE_FIRE_PLEDGE && partnerMove == MOVE_GRASS_PLEDGE)
        return TRUE;
    if (move == MOVE_GRASS_PLEDGE && partnerMove == MOVE_FIRE_PLEDGE && gBattleStruct->pledgeMove)
        return TRUE;
    return FALSE;
}

static void CalculateMagnitudeDamage(void)
{
    u32 magnitude = RandomUniform(RNG_MAGNITUDE, 0, 99);

    if (magnitude < 5)
    {
        gBattleStruct->magnitudeBasePower = 10;
        magnitude = 4;
    }
    else if (magnitude < 15)
    {
        gBattleStruct->magnitudeBasePower = 30;
        magnitude = 5;
    }
    else if (magnitude < 35)
    {
        gBattleStruct->magnitudeBasePower = 50;
        magnitude = 6;
    }
    else if (magnitude < 65)
    {
        gBattleStruct->magnitudeBasePower = 70;
        magnitude = 7;
    }
    else if (magnitude < 85)
    {
        gBattleStruct->magnitudeBasePower = 90;
        magnitude = 8;
    }
    else if (magnitude < 95)
    {
        gBattleStruct->magnitudeBasePower = 110;
        magnitude = 9;
    }
    else
    {
        gBattleStruct->magnitudeBasePower = 150;
        magnitude = 10;
    }

    PREPARE_BYTE_NUMBER_BUFFER(gBattleTextBuff1, 2, magnitude)
}
