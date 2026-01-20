#include "global.h"
#include "battle.h"
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
static void SetSameMoveTurnValues(u32 moveEffect);
static void TryClearChargeVolatile(enum Type moveType);
static inline bool32 IsBattlerUsingBeakBlast(u32 battler);

// Attackcanceler

// ----
// TODO
// ----

// Move End

static enum MoveEndResult MoveEnd_SetValues(void)
{
    gBattleScripting.savedDmg += gBattleStruct->moveDamage[gBattlerTarget];
    gBattleStruct->eventState.moveEndBattler = 0;
    gBattleStruct->eventState.moveEndBlock = 0;
    gBattleScripting.moveendState++;
    return MOVEEND_STEP_CONTINUE;
}

static enum MoveEndResult MoveEnd_ProtectLikeEffect(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;
    u32 temp = 0;

    if (CanBattlerAvoidContactEffects(gBattlerAttacker, gBattlerTarget, GetBattlerAbility(gBattlerAttacker), GetBattlerHoldEffect(gBattlerAttacker), gCurrentMove))
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
            result = MOVEEND_STEP_RUN_SCRIPT;
        }
        break;
    case PROTECT_KINGS_SHIELD:
        SWAP(gBattlerAttacker, gBattlerTarget, temp); // gBattlerTarget and gBattlerAttacker are swapped in order to activate Defiant, if applicable
        if (B_KINGS_SHIELD_LOWER_ATK >= GEN_8)
            gBattleScripting.moveEffect = MOVE_EFFECT_ATK_MINUS_1;
        else
            gBattleScripting.moveEffect = MOVE_EFFECT_ATK_MINUS_2;
        BattleScriptCall(BattleScript_KingsShieldEffect);
        result = MOVEEND_STEP_RUN_SCRIPT;
        break;
    case PROTECT_BANEFUL_BUNKER:
        if (CanBePoisoned(gBattlerTarget, gBattlerAttacker, GetBattlerAbility(gBattlerTarget), GetBattlerAbility(gBattlerAttacker)))
        {
            gBattleScripting.moveEffect = MOVE_EFFECT_POISON;
            BattleScriptCall(BattleScript_BanefulBunkerEffect);
            result = MOVEEND_STEP_RUN_SCRIPT;
        }
        break;
    case PROTECT_BURNING_BULWARK:
        if (CanBeBurned(gBattlerTarget, gBattlerAttacker, GetBattlerAbility(gBattlerAttacker)))
        {
            gBattleScripting.moveEffect = MOVE_EFFECT_BURN;
            BattleScriptCall(BattleScript_BanefulBunkerEffect);
            result = MOVEEND_STEP_RUN_SCRIPT;
        }
        break;
    case PROTECT_OBSTRUCT:
        SWAP(gBattlerAttacker, gBattlerTarget, temp); // gBattlerTarget and gBattlerAttacker are swapped in order to activate Defiant, if applicable
        gBattleScripting.moveEffect = MOVE_EFFECT_DEF_MINUS_2;
        BattleScriptCall(BattleScript_KingsShieldEffect);
        result = MOVEEND_STEP_RUN_SCRIPT;
        break;
    case PROTECT_SILK_TRAP:
        SWAP(gBattlerAttacker, gBattlerTarget, temp); // gBattlerTarget and gBattlerAttacker are swapped in order to activate Defiant, if applicable
        gBattleScripting.moveEffect = MOVE_EFFECT_SPD_MINUS_1;
        BattleScriptCall(BattleScript_KingsShieldEffect);
        result = MOVEEND_STEP_RUN_SCRIPT;
        break;
    default:
        break;
    }

    // Not strictly a protect effect, but works the same way
    if (IsBattlerUsingBeakBlast(gBattlerTarget)
     && CanBeBurned(gBattlerAttacker, gBattlerAttacker, GetBattlerAbility(gBattlerAttacker))
     && !IsBattlerUnaffectedByMove(gBattlerTarget))
    {
        gBattleMons[gBattlerAttacker].status1 = STATUS1_BURN;
        BtlController_EmitSetMonData(gBattlerAttacker, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[gBattlerAttacker].status1), &gBattleMons[gBattlerAttacker].status1);
        MarkBattlerForControllerExec(gBattlerAttacker);
        BattleScriptCall(BattleScript_BeakBlastBurn);
        result = MOVEEND_STEP_RUN_SCRIPT;
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_Absorb(void)
{
    if (gBattleStruct->unableToUseMove)
    {
        gBattleScripting.moveendState++;
        return MOVEEND_STEP_CONTINUE;
    }

    if (IsExplosionMove(gCurrentMove)
     && (gBattleStruct->doneDoublesSpreadHit || !IsDoubleSpreadMove())
     && !IsBattlerAlive(gBattlerAttacker)
     && !gBattleStruct->battlerState[gBattlerAttacker].fainted)
    {
        gBattleStruct->passiveHpUpdate[gBattlerAttacker] = 0;
        BattleScriptCall(BattleScript_FaintAttackerForExplosion);
        gBattleScripting.moveendState++;
        return MOVEEND_STEP_RUN_SCRIPT;
    }

    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;
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
            result = MOVEEND_STEP_RUN_SCRIPT;
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
            result = MOVEEND_STEP_RUN_SCRIPT;
        }
        break;
    default:
        break;
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_Rage(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

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
        result = MOVEEND_STEP_RUN_SCRIPT;
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_SynchronizeTarget(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;
    if (AbilityBattleEffects(ABILITYEFFECT_SYNCHRONIZE, gBattlerTarget, 0, 0, TRUE))
        result = MOVEEND_STEP_RUN_SCRIPT;
    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_Abilities(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;
    enum Ability targetAbility = GetBattlerAbility(gBattlerTarget);

    if (AbilityBattleEffects(ABILITYEFFECT_MOVE_END, gBattlerTarget, targetAbility, 0, TRUE))
        result = MOVEEND_STEP_RUN_SCRIPT;
    else if (TryClearIllusion(gBattlerTarget, targetAbility))
        result = MOVEEND_STEP_RUN_SCRIPT;

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_AbilitiesAttacker(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

    if (AbilityBattleEffects(ABILITYEFFECT_MOVE_END_ATTACKER, gBattlerAttacker, 0, 0, TRUE))
        result = MOVEEND_STEP_RUN_SCRIPT;

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_StatusImmunityAbilities(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

    for (u32 battler = 0; battler < gBattlersCount; battler++)
    {
        if (AbilityBattleEffects(ABILITYEFFECT_IMMUNITY, battler, 0, 0, TRUE))
            result = MOVEEND_STEP_RUN_SCRIPT;
    }

    if (result == MOVEEND_STEP_CONTINUE)
        gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_SynchronizeAttacker(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

    if (AbilityBattleEffects(ABILITYEFFECT_ATK_SYNCHRONIZE, gBattlerAttacker, 0, 0, TRUE))
        result = MOVEEND_STEP_RUN_SCRIPT;

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_AttackerInvisible(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

    if (IsSemiInvulnerable(gBattlerAttacker, CHECK_ALL)
     && gHitMarker & (HITMARKER_NO_ANIMATIONS | HITMARKER_DISABLE_ANIMATION))
    {
        BtlController_EmitSpriteInvisibility(gBattlerAttacker, B_COMM_TO_CONTROLLER, TRUE);
        MarkBattlerForControllerExec(gBattlerAttacker);
        result = MOVEEND_STEP_BREAK;
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_AttackerVisible(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

    if (IsBattlerUnaffectedByMove(gBattlerTarget)
        || !IsSemiInvulnerable(gBattlerAttacker, CHECK_ALL)
        || gBattleStruct->unableToUseMove)
    {
        BtlController_EmitSpriteInvisibility(gBattlerAttacker, B_COMM_TO_CONTROLLER, FALSE);
        MarkBattlerForControllerExec(gBattlerAttacker);
        gBattleMons[gBattlerAttacker].volatiles.semiInvulnerable = STATE_NONE;
        gSpecialStatuses[gBattlerAttacker].restoredBattlerSprite = TRUE;
        gBattleScripting.moveendState++;
        return MOVEEND_STEP_BREAK;
    }
    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_TargetVisible(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

    if (!gSpecialStatuses[gBattlerTarget].restoredBattlerSprite && gBattlerTarget < gBattlersCount
        && !IsSemiInvulnerable(gBattlerTarget, CHECK_ALL))
    {
        BtlController_EmitSpriteInvisibility(gBattlerTarget, B_COMM_TO_CONTROLLER, FALSE);
        MarkBattlerForControllerExec(gBattlerTarget);
        gBattleMons[gBattlerTarget].volatiles.semiInvulnerable = STATE_NONE;
        result = MOVEEND_STEP_BREAK;
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_ItemEffectsTarget(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;
    enum HoldEffect holdEffect = GetBattlerHoldEffect(gBattlerTarget);

    if (ItemBattleEffects(gBattlerTarget, gBattlerAttacker, holdEffect, IsOnTargetHitActivation)
     || ItemBattleEffects(gBattlerTarget, gBattlerAttacker, holdEffect, IsOnStatusChangeActivation))
        result = MOVEEND_STEP_RUN_SCRIPT;

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_ItemEffectsAttacker1(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;
    enum HoldEffect holdEffect = GetBattlerHoldEffect(gBattlerAttacker);

    if (ItemBattleEffects(gBattlerAttacker, gBattlerTarget, holdEffect, IsOnAttackerAfterHitActivation)
     || ItemBattleEffects(gBattlerAttacker, gBattlerTarget, holdEffect, IsOnStatusChangeActivation)
     || ItemBattleEffects(gBattlerAttacker, gBattlerTarget, holdEffect, IsOnHpThresholdActivation))
        result = MOVEEND_STEP_RUN_SCRIPT;

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_Symbiosis(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

    for (u32 battler = 0; battler < gBattlersCount; battler++)
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
            result = MOVEEND_STEP_RUN_SCRIPT;
            break;
        }
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_Substitute(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

    for (u32 i = 0; i < gBattlersCount; i++)
    {
        if (gBattleMons[i].volatiles.substituteHP == 0)
            gBattleMons[i].volatiles.substitute = FALSE;
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_FaintBlock(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

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
                result = MOVEEND_STEP_RUN_SCRIPT;
            }
            gBattleStruct->eventState.moveEndBlock++;
            break;
        case FAINT_BLOCK_CHECK_TARGET_FAINTED: // Stop if target already ran the block / is alive or absent
            if (IsBattlerAlive(gBattlerTarget)
             || gBattleStruct->battlerState[gBattlerTarget].fainted)
            {
                gBattleScripting.moveendState++;
                return MOVEEND_STEP_CONTINUE;
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
                    result = MOVEEND_STEP_RUN_SCRIPT;
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
            result = MOVEEND_STEP_RUN_SCRIPT;
            gBattleStruct->eventState.moveEndBlock++;
            break;
        case FAINT_BLOCK_DO_DESTINY_BOND:
            if (gBattleStruct->tryDestinyBond)
            {
                gBattleStruct->passiveHpUpdate[gBattlerAttacker] = gBattleMons[gBattlerAttacker].hp;
                BattleScriptCall(BattleScript_DestinyBondTakesLife);
                result = MOVEEND_STEP_RUN_SCRIPT;
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
                result = MOVEEND_STEP_RUN_SCRIPT;
            }
            gBattleStruct->eventState.moveEndBlock++;
            break;
        case FAINT_BLOCK_COUNT: // Clear bits for other potential fainting targets
            gBattleStruct->tryDestinyBond = FALSE;
            gBattleStruct->tryGrudge = FALSE;
            gBattleStruct->eventState.moveEndBlock = 0;
            break;
        }

        if (result == MOVEEND_STEP_RUN_SCRIPT)
            break;

    } while (gBattleStruct->eventState.moveEndBlock != 0);

    if (result == MOVEEND_STEP_CONTINUE)
    {
        gBattleStruct->eventState.moveEndBlock = 0;
        gBattleScripting.moveendState++;
    }

    return result;
}

static enum MoveEndResult MoveEnd_SkyDropConfuse(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

    for (u32 battler = 0; battler < gBattlersCount; battler++)
    {
        if (gBattleStruct->skyDropTargets[battler] == SKY_DROP_RELEASED_TARGET)
        {
            // Find the battler id of the Pokemon that was held by Sky Drop
            u32 targetId;
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
            result = MOVEEND_STEP_RUN_SCRIPT;
            break;
        }
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_UpdateLastMoves(void)
{
    if (!IsOnPlayerSide(gBattlerAttacker))
        UpdateStallMons();

    if ((gBattleStruct->moveResultFlags[gBattlerTarget] & (MOVE_RESULT_FAILED | MOVE_RESULT_DOESNT_AFFECT_FOE))
     || gBattleMons[gBattlerAttacker].volatiles.flinched
     || gBattleStruct->pledgeMove == TRUE // Is the battler that uses the first Pledge move in the combo
     || gBattleStruct->unableToUseMove)
        gBattleStruct->battlerState[gBattlerAttacker].stompingTantrumTimer = 2;

    // After swapattackerwithtarget is used for snatch the correct battlers have to be restored so data is stored correctly
    if (gBattleStruct->snatchedMoveIsUsed)
    {
        u32 temp;
        SWAP(gBattlerAttacker, gBattlerTarget, temp);
    }

    if (!gSpecialStatuses[gBattlerAttacker].dancerUsedMove)
    {
        gBattleMons[gBattlerAttacker].volatiles.usedMoves |= 1u << gCurrMovePos;
        gBattleStruct->battlerState[gBattlerAttacker].lastMoveTarget = gBattlerTarget;
    }

    enum BattleMoveEffects originalEffect = GetMoveEffect(GetOriginallyUsedMove(gChosenMove));
    if (IsBattlerAlive(gBattlerAttacker)
     && originalEffect != EFFECT_BATON_PASS
     && originalEffect != EFFECT_HEALING_WISH
     && originalEffect != EFFECT_LUNAR_DANCE)
    {
        if (!gBattleStruct->unableToUseMove)
        {
            if (!gSpecialStatuses[gBattlerAttacker].dancerUsedMove)
            {
                gLastMoves[gBattlerAttacker] = gChosenMove;
                RecordKnownMove(gBattlerAttacker, gChosenMove);
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
    return MOVEEND_STEP_CONTINUE;
}

static enum MoveEndResult MoveEnd_MirrorMove(void)
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
    return MOVEEND_STEP_CONTINUE;
}

static enum MoveEndResult MoveEnd_Defrost(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

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
        result = MOVEEND_STEP_RUN_SCRIPT;
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
        result = MOVEEND_STEP_RUN_SCRIPT;
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_NextTarget(void)
{
    enum MoveTarget moveTarget = GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove);

    gBattleStruct->battlerState[gBattlerAttacker].targetsDone[gBattlerTarget] = TRUE;

    if (gBattleStruct->unableToUseMove || gProtectStructs[gBattlerAttacker].chargingTurn)
    {
        // unable to use move
    }
    else if (moveTarget == TARGET_USER_AND_ALLY)
    {
        u32 partner = BATTLE_PARTNER(gBattlerAttacker);
        if (partner != gBattlerTarget && IsBattlerAlive(partner))
        {
            gBattleStruct->moveTarget[gBattlerAttacker] = gBattlerTarget = partner;
            BattleScriptPush(GetMoveBattleScript(gCurrentMove));
            gBattlescriptCurrInstr = BattleScript_FlushMessageBox;
            gBattleScripting.moveendState = 0;
            MoveValuesCleanUp();
            return MOVEEND_STEP_BREAK;
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

            enum BattleMoveEffects moveEffect = GetMoveEffect(gCurrentMove);

            // Edge cases for moves that shouldn't repeat their own script
            if (moveEffect == EFFECT_MAGNITUDE)
                BattleScriptPush(gBattleMoveEffects[EFFECT_HIT].battleScript);
            else
                BattleScriptPush(GetMoveBattleScript(gCurrentMove));
            gBattlescriptCurrInstr = BattleScript_FlushMessageBox;
            return MOVEEND_STEP_BREAK;
        }
        // Check if the move used was actually a bounced move. If so, we need to go back to the original attacker and make sure, its move hits all 2 or 3 pokemon.
        else if (gBattleStruct->bouncedMoveIsUsed)
        {
            u8 originalBounceTarget = gBattlerAttacker;
            gBattleStruct->bouncedMoveIsUsed = FALSE;
            gBattlerAttacker = gBattleStruct->attackerBeforeBounce;
            gBattleStruct->battlerState[gBattlerAttacker].targetsDone[originalBounceTarget] = TRUE;
            for (u32 i = 0; i < gBattlersCount; i++)
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
                return MOVEEND_STEP_BREAK;
            }
        }
    }

    RecordLastUsedMoveBy(gBattlerAttacker, gCurrentMove);
    gBattleScripting.moveendState++;
    return MOVEEND_STEP_CONTINUE;
}

static enum MoveEndResult MoveEnd_HpThresholdItemsTarget(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

    if (gMultiHitCounter &&
        ItemBattleEffects(gBattlerTarget, gBattlerAttacker, GetBattlerHoldEffect(gBattlerTarget), IsOnHpThresholdActivation))
    {
        result = MOVEEND_STEP_RUN_SCRIPT;
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_MultihitMove(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

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
            result = MOVEEND_STEP_RUN_SCRIPT;
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
                return MOVEEND_STEP_BREAK;
            }
            else
            {
                BattleScriptCall(BattleScript_MultiHitPrintStrings);
                result = MOVEEND_STEP_RUN_SCRIPT;
            }
        }
    }

    gMultiHitCounter = 0;
    gSpecialStatuses[gBattlerAttacker].parentalBondState = PARENTAL_BOND_OFF;
    gSpecialStatuses[gBattlerAttacker].multiHitOn = 0;
    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_MoveBlock(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;
    enum BattleSide side = GetBattlerSide(gBattlerTarget);
    enum BattleMoveEffects moveEffect = GetMoveEffect(gCurrentMove);

    switch (moveEffect)
    {
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
                result = MOVEEND_STEP_RUN_SCRIPT;
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
            result = MOVEEND_STEP_RUN_SCRIPT;
        }
        break;
    case EFFECT_STEAL_ITEM:
        if (!IsBattlerTurnDamaged(gBattlerTarget)
         || gBattleMons[gBattlerAttacker].item != ITEM_NONE
         || gBattleMons[gBattlerTarget].item == ITEM_NONE
         || !IsBattlerAlive(gBattlerAttacker)
         || !CanStealItem(gBattlerAttacker, gBattlerTarget, gBattleMons[gBattlerTarget].item))
        {
            result = MOVEEND_STEP_CONTINUE;
        }
        else if (GetBattlerAbility(gBattlerTarget) == ABILITY_STICKY_HOLD)
        {
            BattleScriptCall(BattleScript_NoItemSteal);
            gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
            RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
            result = MOVEEND_STEP_RUN_SCRIPT;
        }
        else
        {
            StealTargetItem(gBattlerAttacker, gBattlerTarget);  // Attacker steals target item

            if (!(GetConfig(CONFIG_STEAL_WILD_ITEMS) >= GEN_9
             && !(gBattleTypeFlags & (BATTLE_TYPE_TRAINER | BATTLE_TYPE_PALACE))))
            {
                gBattleMons[gBattlerAttacker].item = ITEM_NONE; // Item assigned later on with thief (see MOVEEND_CHANGED_ITEMS)
                gBattleStruct->changedItems[gBattlerAttacker] = gLastUsedItem; // Stolen item to be assigned later
            }
            gEffectBattler = gBattlerTarget;
            BattleScriptCall(BattleScript_ItemSteal);
            result = MOVEEND_STEP_RUN_SCRIPT;
        }
        break;
    case EFFECT_HIT_SWITCH_TARGET:
        if (IsBattlerTurnDamaged(gBattlerTarget)
         && IsBattlerAlive(gBattlerTarget)
         && IsBattlerAlive(gBattlerAttacker)
         && gBattleMons[BATTLE_PARTNER(gBattlerTarget)].volatiles.semiInvulnerable != STATE_COMMANDER)
        {
            u32 targetAbility = GetBattlerAbility(gBattlerTarget);
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
            result = MOVEEND_STEP_RUN_SCRIPT;
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
            result = MOVEEND_STEP_RUN_SCRIPT;
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
            result = MOVEEND_STEP_RUN_SCRIPT;
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
            result = MOVEEND_STEP_RUN_SCRIPT;
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
            result = MOVEEND_STEP_RUN_SCRIPT;
        }
        break;
    case EFFECT_RAPID_SPIN:
        if (IsBattlerTurnDamaged(gBattlerTarget) && IsBattlerAlive(gBattlerAttacker))
        {
            BattleScriptCall(BattleScript_RapidSpinAway);
            result = MOVEEND_STEP_RUN_SCRIPT;
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
            result = MOVEEND_STEP_RUN_SCRIPT;
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
            result = MOVEEND_STEP_RUN_SCRIPT;
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
                result = MOVEEND_STEP_CONTINUE;
            }
            else
            {
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_SpikesActivates;
                result = MOVEEND_STEP_RUN_SCRIPT;
            }
        }
        break;
    default:
        result = MOVEEND_STEP_CONTINUE;
        break;
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_ItemEffectsAttacker2(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;
    enum HoldEffect holdEffect = GetBattlerHoldEffect(gBattlerAttacker);

    if (ItemBattleEffects(gBattlerAttacker, gBattlerTarget, holdEffect, IsOnStatusChangeActivation)
     || ItemBattleEffects(gBattlerAttacker, gBattlerTarget, holdEffect, IsOnHpThresholdActivation))
        result = MOVEEND_STEP_RUN_SCRIPT;

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_AbilityEffectFoesFainted(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

    if (AbilityBattleEffects(ABILITYEFFECT_MOVE_END_FOES_FAINTED, gBattlerAttacker, GetBattlerAbility(gBattlerAttacker), gCurrentMove, TRUE))
        result = MOVEEND_STEP_RUN_SCRIPT;

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_SheerForce(void)
{
    if (IsSheerForceAffected(gCurrentMove, GetBattlerAbility(gBattlerAttacker)))
        gBattleScripting.moveendState = MOVEEND_EJECT_PACK;
    else
        gBattleScripting.moveendState++;

    return MOVEEND_STEP_CONTINUE;
}

static enum MoveEndResult MoveEnd_ShellTrap(void)
{
    for (u32 battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
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
    return MOVEEND_STEP_CONTINUE;
}

static enum MoveEndResult MoveEnd_ColorChange(void)
{
    while (gBattleStruct->eventState.moveEndBattler < gBattlersCount)
    {
        u32 battler = gBattleStruct->eventState.moveEndBattler++;
        if (battler == gBattlerAttacker)
            continue;
        if (AbilityBattleEffects(ABILITYEFFECT_COLOR_CHANGE, battler, GetBattlerAbility(battler), 0, TRUE))
            return MOVEEND_STEP_RUN_SCRIPT;
    }

    gBattleStruct->eventState.moveEndBattler = 0;
    gBattleScripting.moveendState++;
    return MOVEEND_STEP_CONTINUE;
}

static enum MoveEndResult MoveEnd_KeeMarangaHpThresholdItemTarget(void)
{
    while (gBattleStruct->eventState.moveEndBattler < gBattlersCount)
    {
        u32 battlerDef = gBattleStruct->eventState.moveEndBattler++;
        if (battlerDef == gBattlerAttacker)
            continue;
        enum HoldEffect holdEffect = GetBattlerHoldEffect(battlerDef);
        if (ItemBattleEffects(battlerDef, gBattlerAttacker, holdEffect, IsKeeMarangaBerryActivation)
         || ItemBattleEffects(battlerDef, gBattlerAttacker, holdEffect, IsOnHpThresholdActivation))
            return MOVEEND_STEP_RUN_SCRIPT;
    }

    gBattleScripting.moveendState++;
    return MOVEEND_STEP_CONTINUE;
}

static bool32 TryRedCard(u32 battlerAtk, u32 redCardBattler, u32 move)
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

static bool32 TryEjectButton(u32 battlerAtk, u32 ejectButtonBattler)
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

static enum MoveEndResult MoveEnd_CardButton(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;
    u32 redCardBattlers = 0;
    u32 ejectButtonBattlers = 0;

    // Because sorting the battlers by speed takes lots of cycles, it's better to just check if any of the battlers has the Eject items.
    for (u32 battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
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
        return MOVEEND_STEP_CONTINUE;
    }

    u8 battlers[4] = {0, 1, 2, 3};
    SortBattlersBySpeed(battlers, FALSE);

    for (u32 battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
    {
        u32 battler = battlers[battlerDef];

        // Only fastest red card or eject button activates
        if (redCardBattlers & 1u << battler && TryRedCard(gBattlerAttacker, battler, gCurrentMove))
            result = MOVEEND_STEP_RUN_SCRIPT;
        else if (ejectButtonBattlers & 1u << battler && TryEjectButton(gBattlerAttacker, battler))
            result = MOVEEND_STEP_RUN_SCRIPT;

        if (result == MOVEEND_STEP_RUN_SCRIPT)
        {
            for (u32 i = 0; i < gBattlersCount; i++)
                gBattleMons[i].volatiles.tryEjectPack = FALSE;
            gBattleScripting.moveendState = MOVEEND_JUMP_TO_HIT_ESCAPE_PLUS_ONE;
            return result;
        }
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_LifeOrbShellBell(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

    if (ItemBattleEffects(gBattlerAttacker, 0, GetBattlerHoldEffect(gBattlerAttacker), IsLifeOrbShellBellActivation))
        result = MOVEEND_STEP_RUN_SCRIPT;

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_FormChange(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

    if (TryBattleFormChange(gBattlerAttacker, FORM_CHANGE_BATTLE_AFTER_MOVE))
    {
        result = MOVEEND_STEP_RUN_SCRIPT;
        BattleScriptCall(BattleScript_AttackerFormChangeMoveEffect);
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_EmergencyExit(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;
    u32 numEmergencyExitBattlers = 0;
    u32 emergencyExitBattlers = 0;

    // Because sorting the battlers by speed takes lots of cycles,
    // we check if EE can be activated and count how many.
    for (u32 i = 0; i < gBattlersCount; i++)
    {
        if (IsBattlerTurnDamaged(i) && EmergencyExitCanBeTriggered(i))
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

    for (u32 i = 0; i < gBattlersCount; i++)
        gBattleMons[i].volatiles.tryEjectPack = FALSE;

    u8 battlers[4] = {0, 1, 2, 3};
    if (numEmergencyExitBattlers > 1)
        SortBattlersBySpeed(battlers, FALSE);

    for (u32 i = 0; i < gBattlersCount; i++)
    {
        u32 battler = battlers[i];

        if (!(emergencyExitBattlers & 1u << battler))
            continue;

        gBattleScripting.battler = battler;
        BattleScriptCall(BattleScript_EmergencyExit);
        result = MOVEEND_STEP_RUN_SCRIPT;
        break; // Only the fastest Emergency Exit / Wimp Out activates
    }

    if (result == MOVEEND_STEP_RUN_SCRIPT)
        gBattleScripting.moveendState = MOVEEND_JUMP_TO_HIT_ESCAPE_PLUS_ONE;
    else
        gBattleScripting.moveendState++;
    return result;
}

static inline bool32 CanEjectPackTrigger(u32 battlerAtk, u32 battlerDef, enum BattleMoveEffects moveEffect)
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

static enum MoveEndResult MoveEnd_EjectPack(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;
    u32 ejectPackBattlers = 0;
    u32 numEjectPackBattlers = 0;

    // Because sorting the battlers by speed takes lots of cycles, it's better to just check if any of the battlers has the Eject items.
    for (u32 i = 0; i < gBattlersCount; i++)
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

    u8 battlers[4] = {0, 1, 2, 3};
    if (numEjectPackBattlers > 1)
        SortBattlersBySpeed(battlers, FALSE);

    for (u32 i = 0; i < gBattlersCount; i++)
        gBattleMons[i].volatiles.tryEjectPack = FALSE;

    for (u32 i = 0; i < gBattlersCount; i++)
    {
        u32 battler = battlers[i];

        if (!(ejectPackBattlers & 1u << battler))
            continue;

        gBattleScripting.battler = battler;
        gLastUsedItem = gBattleMons[battler].item;
        gBattleStruct->battlerState[battler].usedEjectItem = TRUE;
        BattleScriptCall(BattleScript_EjectPackActivates);
        gAiLogicData->ejectPackSwitch = TRUE;
        result = MOVEEND_STEP_RUN_SCRIPT;
        break; // Only the fastest Eject item activates
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_HitEscape(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

    if (GetMoveEffect(gCurrentMove) == EFFECT_HIT_ESCAPE
     && !gBattleStruct->unableToUseMove
     && IsBattlerTurnDamaged(gBattlerTarget)
     && IsBattlerAlive(gBattlerAttacker)
     && !NoAliveMonsForBattlerSide(gBattlerTarget))
    {
        result = MOVEEND_STEP_RUN_SCRIPT;
        BattleScriptCall(BattleScript_EffectHitEscape);
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_ItemsEffectsAll(void)
{
    while (gBattleStruct->eventState.moveEndBattler < gBattlersCount)
    {
        u32 battler = gBattleStruct->eventState.moveEndBattler++;
        enum HoldEffect holdEffect = GetBattlerHoldEffect(battler);
        if (ItemBattleEffects(battler, 0, holdEffect, IsOnStatusChangeActivation)
         || ItemBattleEffects(battler, 0, holdEffect, IsOnHpThresholdActivation))
            return MOVEEND_STEP_RUN_SCRIPT;
    }

    gBattleStruct->eventState.moveEndBattler = 0;
    gBattleScripting.moveendState++;
    return MOVEEND_STEP_CONTINUE;
}

static enum MoveEndResult MoveEnd_WhiteHerb(void)
{
    while (gBattleStruct->eventState.moveEndBattler < gBattlersCount)
    {
        u32 battler = gBattleStruct->eventState.moveEndBattler++;
        if (!IsBattlerAlive(battler))
            continue;

        if (ItemBattleEffects(battler, 0, GetBattlerHoldEffect(battler), IsWhiteHerbActivation))
            return MOVEEND_STEP_RUN_SCRIPT;
    }

    gBattleStruct->eventState.moveEndBattler = 0;
    gBattleScripting.moveendState++;
    return MOVEEND_STEP_CONTINUE;
}

static enum MoveEndResult MoveEnd_Opportunist(void)
{
    while (gBattleStruct->eventState.moveEndBattler < gBattlersCount)
    {
        u32 battler = gBattleStruct->eventState.moveEndBattler++;
        if (!IsBattlerAlive(battler))
            continue;
        if (AbilityBattleEffects(ABILITYEFFECT_OPPORTUNIST, battler, GetBattlerAbility(battler), 0, TRUE))
            return MOVEEND_STEP_RUN_SCRIPT;
    }

    gBattleStruct->eventState.moveEndBattler = 0;
    gBattleScripting.moveendState++;
    return MOVEEND_STEP_CONTINUE;
}

static enum MoveEndResult MoveEnd_MirrorHerb(void)
{
    while (gBattleStruct->eventState.moveEndBattler < gBattlersCount)
    {
        u32 battler = gBattleStruct->eventState.moveEndBattler++;
        if (!IsBattlerAlive(battler))
            continue;

        if (ItemBattleEffects(battler, 0, GetBattlerHoldEffect(battler), IsMirrorHerbActivation))
            return MOVEEND_STEP_RUN_SCRIPT;
    }

    gBattleStruct->eventState.moveEndBattler = 0;
    gBattleScripting.moveendState++;
    return MOVEEND_STEP_CONTINUE;
}

static enum MoveEndResult MoveEnd_Pickpocket(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

    if (IsBattlerAlive(gBattlerAttacker)
      && gBattleMons[gBattlerAttacker].item != ITEM_NONE // Attacker must be holding an item
      && !GetBattlerPartyState(gBattlerAttacker)->isKnockedOff // But not knocked off
      && IsMoveMakingContact(gBattlerAttacker, gBattlerTarget, GetBattlerAbility(gBattlerAttacker), GetBattlerHoldEffect(gBattlerAttacker), gCurrentMove) // Pickpocket requires contact
      && !IsBattlerUnaffectedByMove(gBattlerTarget)) // Obviously attack needs to have worked
    {
        u8 battlers[4] = {0, 1, 2, 3};
        SortBattlersBySpeed(battlers, FALSE); // Pickpocket activates for fastest mon without item
        for (u32 i = 0; i < gBattlersCount; i++)
        {
            u8 battler = battlers[i];
            // Attacker is mon who made contact, battler is mon with pickpocket
            if (battler != gBattlerAttacker                                                     // Cannot pickpocket yourself
              && GetBattlerAbility(battler) == ABILITY_PICKPOCKET                               // Target must have pickpocket ability
              && IsBattlerTurnDamaged(battler)                                                  // Target needs to have been damaged
              && !DoesSubstituteBlockMove(gBattlerAttacker, battler, gCurrentMove)              // Subsitute unaffected
              && IsBattlerAlive(battler)                                                        // Battler must be alive to pickpocket
              && gBattleMons[battler].item == ITEM_NONE                                         // Pickpocketer can't have an item already
              && CanStealItem(battler, gBattlerAttacker, gBattleMons[gBattlerAttacker].item))   // Cannot steal plates, mega stones, etc
            {
                gBattlerTarget = gBattlerAbility = battler;
                // Battle scripting is super brittle so we shall do the item exchange now (if possible)
                if (GetBattlerAbility(gBattlerAttacker) != ABILITY_STICKY_HOLD)
                    StealTargetItem(gBattlerTarget, gBattlerAttacker);  // Target takes attacker's item

                gEffectBattler = gBattlerAttacker;
                BattleScriptCall(BattleScript_Pickpocket);   // Includes sticky hold check to print separate string
                result = MOVEEND_STEP_RUN_SCRIPT;
                break; // Pickpocket activates on fastest mon, so exit loop.
            }
        }
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_ThirdMoveBlock(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;
    enum BattleMoveEffects moveEffect = GetMoveEffect(gCurrentMove);

    switch (moveEffect)
    {
    case EFFECT_STEEL_ROLLER:
        if (gFieldStatuses & STATUS_FIELD_TERRAIN_ANY && IsBattlerTurnDamaged(gBattlerTarget))
        {
            BattleScriptCall(BattleScript_RemoveTerrain);
            result = MOVEEND_STEP_RUN_SCRIPT;
        }
        break;
    case EFFECT_ICE_SPINNER:
        if (gFieldStatuses & STATUS_FIELD_TERRAIN_ANY
         && gLastPrintedMoves[gBattlerAttacker] == gCurrentMove
         && IsBattlerAlive(gBattlerAttacker)
         && IsBattlerTurnDamaged(gBattlerTarget))
        {
            BattleScriptCall(BattleScript_RemoveTerrain);
            result = MOVEEND_STEP_RUN_SCRIPT;
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
                result = MOVEEND_STEP_RUN_SCRIPT;
        }
        break;
    default:
        break;
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_ChangedItems(void)
{
    for (u32 battler = 0; battler < gBattlersCount; battler++)
    {
        if (gBattleStruct->changedItems[battler] != ITEM_NONE)
        {
            gBattleMons[battler].item = gBattleStruct->changedItems[battler];
            gBattleStruct->changedItems[battler] = ITEM_NONE;
        }
    }

    gBattleScripting.moveendState++;
    return MOVEEND_STEP_CONTINUE;
}

static enum MoveEndResult MoveEnd_ClearBits(void)
{
    ValidateBattlers();

    enum Move originallyUsedMove = GetOriginallyUsedMove(gChosenMove);
    enum Type moveType = GetBattleMoveType(gCurrentMove);
    enum BattleMoveEffects moveEffect = GetMoveEffect(gCurrentMove);

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

    for (u32 i = 0; i < gBattlersCount; i++)
    {
        gBattleStruct->battlerState[gBattlerAttacker].targetsDone[i] = FALSE;
        gBattleMons[i].volatiles.tryEjectPack = FALSE;

        if (gBattleStruct->battlerState[i].commanderSpecies != SPECIES_NONE && !IsBattlerAlive(i))
        {
            u32 partner = BATTLE_PARTNER(i);
            gBattleStruct->battlerState[i].commanderSpecies = SPECIES_NONE;
            if (IsBattlerAlive(partner))
                gBattleMons[partner].volatiles.semiInvulnerable = STATE_NONE;
        }
    }

    // Need to check a specific battle during the end turn and dancer
    gBattleMons[gBattlerAttacker].volatiles.unableToUseMove = gBattleStruct->unableToUseMove;
    gBattleScripting.moveendState++;

    return MOVEEND_STEP_CONTINUE;
}

static enum MoveEndResult MoveEnd_Dancer(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

    if (IsDanceMove(gCurrentMove) && !gBattleStruct->snatchedMoveIsUsed)
    {
        u32 battler, nextDancer = 0;
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
                result = MOVEEND_STEP_RUN_SCRIPT;
        }
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult MoveEnd_PursuitNextAction(void)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

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
            result = MOVEEND_STEP_RUN_SCRIPT;
        }
    }

    gBattleScripting.moveendState++;
    return result;
}

static enum MoveEndResult (*const sMoveEndHandlers[])(void) =
{
    [MOVEEND_SET_VALUES] = MoveEnd_SetValues,
    [MOVEEND_PROTECT_LIKE_EFFECT] = MoveEnd_ProtectLikeEffect,
    [MOVEEND_ABSORB] = MoveEnd_Absorb,
    [MOVEEND_RAGE] = MoveEnd_Rage,
    [MOVEEND_SYNCHRONIZE_TARGET] = MoveEnd_SynchronizeTarget,
    [MOVEEND_ABILITIES] = MoveEnd_Abilities,
    [MOVEEND_ABILITIES_ATTACKER] = MoveEnd_AbilitiesAttacker,
    [MOVEEND_STATUS_IMMUNITY_ABILITIES] = MoveEnd_StatusImmunityAbilities,
    [MOVEEND_SYNCHRONIZE_ATTACKER] = MoveEnd_SynchronizeAttacker,
    [MOVEEND_ATTACKER_INVISIBLE] = MoveEnd_AttackerInvisible,
    [MOVEEND_ATTACKER_VISIBLE] = MoveEnd_AttackerVisible,
    [MOVEEND_TARGET_VISIBLE] = MoveEnd_TargetVisible,
    [MOVEEND_ITEM_EFFECTS_TARGET] = MoveEnd_ItemEffectsTarget,
    [MOVEEND_ITEM_EFFECTS_ATTACKER_1] = MoveEnd_ItemEffectsAttacker1,
    [MOVEEND_SYMBIOSIS] = MoveEnd_Symbiosis,
    [MOVEEND_SUBSTITUTE] = MoveEnd_Substitute,
    [MOVEEND_FAINT_BLOCK] = MoveEnd_FaintBlock,
    [MOVEEND_SKY_DROP_CONFUSE] = MoveEnd_SkyDropConfuse,
    [MOVEEND_UPDATE_LAST_MOVES] = MoveEnd_UpdateLastMoves,
    [MOVEEND_MIRROR_MOVE] = MoveEnd_MirrorMove,
    [MOVEEND_DEFROST] = MoveEnd_Defrost,
    [MOVEEND_NEXT_TARGET] = MoveEnd_NextTarget,
    [MOVEEND_HP_THRESHOLD_ITEMS_TARGET] = MoveEnd_HpThresholdItemsTarget,
    [MOVEEND_MULTIHIT_MOVE] = MoveEnd_MultihitMove,
    [MOVEEND_MOVE_BLOCK] = MoveEnd_MoveBlock,
    [MOVEEND_ITEM_EFFECTS_ATTACKER_2] = MoveEnd_ItemEffectsAttacker2,
    [MOVEEND_ABILITY_EFFECT_FOES_FAINTED] = MoveEnd_AbilityEffectFoesFainted,
    [MOVEEND_SHEER_FORCE] = MoveEnd_SheerForce,
    [MOVEEND_SHELL_TRAP] = MoveEnd_ShellTrap,
    [MOVEEND_COLOR_CHANGE] = MoveEnd_ColorChange,
    [MOVEEND_KEE_MARANGA_HP_THRESHOLD_ITEM_TARGET] = MoveEnd_KeeMarangaHpThresholdItemTarget,
    [MOVEEND_CARD_BUTTON] = MoveEnd_CardButton,
    [MOVEEND_LIFE_ORB_SHELL_BELL] = MoveEnd_LifeOrbShellBell,
    [MOVEEND_FORM_CHANGE] = MoveEnd_FormChange,
    [MOVEEND_EMERGENCY_EXIT] = MoveEnd_EmergencyExit,
    [MOVEEND_EJECT_PACK] = MoveEnd_EjectPack,
    [MOVEEND_HIT_ESCAPE] = MoveEnd_HitEscape,
    [MOVEEND_ITEMS_EFFECTS_ALL] = MoveEnd_ItemsEffectsAll,
    [MOVEEND_WHITE_HERB] = MoveEnd_WhiteHerb,
    [MOVEEND_OPPORTUNIST] = MoveEnd_Opportunist,
    [MOVEEND_MIRROR_HERB] = MoveEnd_MirrorHerb,
    [MOVEEND_PICKPOCKET] = MoveEnd_Pickpocket,
    [MOVEEND_THIRD_MOVE_BLOCK] = MoveEnd_ThirdMoveBlock,
    [MOVEEND_CHANGED_ITEMS] = MoveEnd_ChangedItems,
    [MOVEEND_CLEAR_BITS] = MoveEnd_ClearBits,
    [MOVEEND_DANCER] = MoveEnd_Dancer,
    [MOVEEND_PURSUIT_NEXT_ACTION] = MoveEnd_PursuitNextAction,
};

bool32 DoMoveEnd(enum MoveEndState endMode, enum MoveEndState endState)
{
    enum MoveEndResult result = MOVEEND_STEP_CONTINUE;

    do
    {
        result = sMoveEndHandlers[gBattleScripting.moveendState]();

        if (endMode == 1 && result == MOVEEND_STEP_CONTINUE)
            gBattleScripting.moveendState = MOVEEND_COUNT;
        if (endMode == 2 && endState == gBattleScripting.moveendState)
            gBattleScripting.moveendState = MOVEEND_COUNT;

    } while (gBattleScripting.moveendState != MOVEEND_COUNT && result == MOVEEND_STEP_CONTINUE);

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

static void SetSameMoveTurnValues(u32 moveEffect)
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

    for (u32 battler = 0; battler < gBattlersCount; battler++)
    {
        if (gBattleMons[battler].volatiles.chargeTimer == 2) // Has been set this turn by move or ability
            gBattleMons[battler].volatiles.chargeTimer--;
    }
}

static inline bool32 IsBattlerUsingBeakBlast(u32 battler)
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
