#include "global.h"
#include "battle.h"
#include "battle_hold_effects.h"
#include "battle_setup.h"
#include "battle_util.h"
#include "battle_controllers.h"
#include "battle_ai_util.h"
#include "battle_gimmick.h"
#include "battle_scripts.h"
#include "constants/battle.h"
#include "constants/battle_string_ids.h"
#include "constants/abilities.h"
#include "constants/items.h"
#include "constants/moves.h"

static u32 GetBattlerSideForMessage(enum BattleSide side)
{
    enum BattlerId battler = 0;

    for (battler = 0; battler < gBattlersCount; battler++)
    {
        if (GetBattlerSide(battler) == side)
            break;
    }

    return battler;
}

static bool32 HandleEndTurnOrder(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleTurnCounter++;
    gBattleStruct->eventState.endTurn++;

    for (enum BattlerId i = 0; i < gBattlersCount; i++)
        gBattlerByTurnOrder[i] = i;
    SortBattlersBySpeed(gBattlerByTurnOrder, FALSE);

    return effect;
}

static bool32 HandleEndTurnVarious(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurn++;

    if (gFieldTimers.fairyLockTimer > 0 && --gFieldTimers.fairyLockTimer == 0)
        gFieldStatuses &= ~STATUS_FIELD_FAIRY_LOCK;

    for (enum BattleSide i = 0; i < NUM_BATTLE_SIDES; i++)
    {
        if (gSideTimers[i].damageNonTypesTimer > 0 && --gSideTimers[i].damageNonTypesTimer == 0)
            gSideStatuses[i] &= ~SIDE_STATUS_DAMAGE_NON_TYPES;
    }

    for (enum BattlerId i = 0; i < gBattlersCount; i++)
    {
        if (gBattleMons[i].volatiles.throatChopTimer > 0)
            gBattleMons[i].volatiles.throatChopTimer--;

        if (gBattleMons[i].volatiles.lockOn > 0)
            gBattleMons[i].volatiles.lockOn--;

        if (B_CHARGE < GEN_9 && gBattleMons[i].volatiles.chargeTimer > 0)
            gBattleMons[i].volatiles.chargeTimer--;

        if (gBattleMons[i].volatiles.laserFocusTimer > 0 && --gBattleMons[i].volatiles.laserFocusTimer == 0)
            gBattleMons[i].volatiles.laserFocus = FALSE;

        gBattleStruct->battlerState[i].wasAboveHalfHp = gBattleMons[i].hp > gBattleMons[i].maxHP / 2;
    }

    if (gBattleStruct->incrementEchoedVoice)
    {
        if (gBattleStruct->echoedVoiceCounter < 4)
            gBattleStruct->echoedVoiceCounter++;
        gBattleStruct->incrementEchoedVoice = FALSE;
    }
    else
    {
        gBattleStruct->echoedVoiceCounter = 0;
    }

    return effect;
}

static bool32 HandleEndTurnWeather(enum BattlerId battler)
{
    gBattleStruct->eventState.endTurn++;
    return EndOrContinueWeather();
}

static bool32 HandleEndTurnWeatherDamage(enum BattlerId battler)
{
    bool32 effect = FALSE;

    enum Ability ability = GetBattlerAbility(battler);
    u32 currBattleWeather = GetCurrentBattleWeather();

    if (currBattleWeather == 0xFF)
    {
        // If there is no weather on the field, no need to check other battlers so go to next state
        gBattleStruct->eventState.endTurnBattler = 0;
        gBattleStruct->eventState.endTurn++;
        return effect;
    }

    gBattleStruct->eventState.endTurnBattler++;

    if (!IsBattlerAlive(battler) || !HasWeatherEffect())
        return effect;


    switch (currBattleWeather)
    {
    case BATTLE_WEATHER_FOG:
    case BATTLE_WEATHER_STRONG_WINDS:
        break;
    case BATTLE_WEATHER_RAIN:
    case BATTLE_WEATHER_RAIN_PRIMAL:
    case BATTLE_WEATHER_RAIN_DOWNPOUR:
        if (ability == ABILITY_DRY_SKIN || ability == ABILITY_RAIN_DISH)
        {
            if (AbilityBattleEffects(ABILITYEFFECT_ENDTURN, battler, ability, MOVE_NONE, TRUE))
                effect = TRUE;
        }
        break;
    case BATTLE_WEATHER_SUN:
    case BATTLE_WEATHER_SUN_PRIMAL:
        if (ability == ABILITY_DRY_SKIN || ability == ABILITY_SOLAR_POWER)
        {
            if (AbilityBattleEffects(ABILITYEFFECT_ENDTURN, battler, ability, MOVE_NONE, TRUE))
                effect = TRUE;
        }
        break;
    case BATTLE_WEATHER_SANDSTORM:
        if (ability != ABILITY_SAND_VEIL
         && ability != ABILITY_SAND_FORCE
         && ability != ABILITY_SAND_RUSH
         && ability != ABILITY_OVERCOAT
         && !IS_BATTLER_ANY_TYPE(battler, TYPE_ROCK, TYPE_GROUND, TYPE_STEEL)
         && gBattleMons[battler].volatiles.semiInvulnerable != STATE_UNDERGROUND
         && gBattleMons[battler].volatiles.semiInvulnerable != STATE_UNDERWATER
         && GetBattlerHoldEffect(battler) != HOLD_EFFECT_SAFETY_GOGGLES
         && !IsAbilityAndRecord(battler, ability, ABILITY_MAGIC_GUARD))
        {
            SetPassiveDamageAmount(battler, GetNonDynamaxMaxHP(battler) / 16);
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SANDSTORM;
            BattleScriptExecute(BattleScript_DamagingWeather);
            effect = TRUE;
        }
        break;
    case BATTLE_WEATHER_HAIL:
    case BATTLE_WEATHER_SNOW:
        if (ability == ABILITY_ICE_BODY)
        {
            if (AbilityBattleEffects(ABILITYEFFECT_ENDTURN, battler, ability, MOVE_NONE, TRUE))
                effect = TRUE;
        }
        else if (currBattleWeather == BATTLE_WEATHER_HAIL)
        {
            if (ability != ABILITY_SNOW_CLOAK
             && ability != ABILITY_OVERCOAT
             && !IS_BATTLER_OF_TYPE(battler, TYPE_ICE)
             && gBattleMons[battler].volatiles.semiInvulnerable != STATE_UNDERGROUND
             && gBattleMons[battler].volatiles.semiInvulnerable != STATE_UNDERWATER
             && GetBattlerHoldEffect(battler) != HOLD_EFFECT_SAFETY_GOGGLES
             && !IsAbilityAndRecord(battler, ability, ABILITY_MAGIC_GUARD))
            {
                SetPassiveDamageAmount(battler, GetNonDynamaxMaxHP(battler) / 16);
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_HAIL;
                BattleScriptExecute(BattleScript_DamagingWeather);
                effect = TRUE;
            }
        }
        break;
    }

    return effect;
}

static bool32 HandleEndTurnEmergencyExit(enum BattlerId battler)
{
    bool32 effect = FALSE;
    enum Ability ability = GetBattlerAbility(battler);

    gBattleStruct->eventState.endTurnBattler++;

    if (EmergencyExitCanBeTriggered(battler))
    {
        gBattlerAbility = battler;
        gLastUsedAbility = ability;
        gBattleScripting.battler = battler;
        BattleScriptExecute(BattleScript_EmergencyExitEnd2);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnAffection(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (!B_AFFECTION_MECHANICS
     || !IsBattlerAlive(battler)
     || !IsOnPlayerSide(battler))
        return effect;

    if (GetBattlerAffectionHearts(gBattlerAttacker) >= AFFECTION_FOUR_HEARTS && (Random() % 100 < 20))
    {
        gBattleCommunication[MULTISTRING_CHOOSER] = 1;
        BattleScriptExecute(BattleScript_AffectionBasedStatusHeal);
        effect = TRUE;
    }

    return effect;
}

// Note: Technically Future Sight, Doom Desire and Wish need a queue but
// I think we should accept this slight inconsistency so custom moves don't have to touch this code
static bool32 HandleEndTurnFutureSight(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleStruct->futureSight[battler].counter > 0
     && --gBattleStruct->futureSight[battler].counter == 0)
    {
        if (!IsBattlerAlive(battler))
            return effect;

        if (gBattleStruct->futureSight[battler].move == MOVE_FUTURE_SIGHT)
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_FUTURE_SIGHT;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_DOOM_DESIRE;

        PREPARE_MOVE_BUFFER(gBattleTextBuff1, gBattleStruct->futureSight[battler].move);

        gBattlerTarget = battler;
        gBattlerAttacker = gBattleStruct->futureSight[battler].battlerIndex;
        gCurrentMove = gBattleStruct->futureSight[battler].move;
        gBattleStruct->eventState.atkCanceler = CANCELER_TARGET_FAILURE;

        if (!IsFutureSightAttackerInParty(gBattlerAttacker, gBattlerTarget, gCurrentMove))
            SetTypeBeforeUsingMove(gCurrentMove, gBattlerAttacker);

        BattleScriptExecute(BattleScript_MonTookFutureAttack);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnWish(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleStruct->wish[battler].counter > 0 && --gBattleStruct->wish[battler].counter == 0 && IsBattlerAlive(battler))
    {
        s32 wishHeal = 0;
        gBattlerTarget = battler;
        PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff1, battler, gBattleStruct->wish[battler].partyId)
        if (GetConfig(CONFIG_WISH_HP_SOURCE) >= GEN_5)
            wishHeal = GetMonData(&GetBattlerParty(battler)[gBattleStruct->wish[battler].partyId], MON_DATA_MAX_HP) / 2;
        else
            wishHeal = GetNonDynamaxMaxHP(battler) / 2;

        SetHealAmount(battler, wishHeal);
        if (gBattleMons[battler].volatiles.healBlock)
            BattleScriptExecute(BattleScript_WishButHealBlocked);
        else if (gBattleMons[battler].hp == gBattleMons[battler].maxHP)
            BattleScriptExecute(BattleScript_WishButFullHp);
        else
            BattleScriptExecute(BattleScript_WishComesTrue);

        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnFirstEventBlock(enum BattlerId battler)
{
    bool32 effect = FALSE;
    enum BattleSide side;

    if (!IsBattlerAlive(battler))
    {
        gBattleStruct->eventState.endTurnBlock = 0;
        gBattleStruct->eventState.endTurnBattler++;
        return effect;
    }

    switch (gBattleStruct->eventState.endTurnBlock)
    {
    case FIRST_EVENT_BLOCK_GMAX_MOVE_RESIDUAL: // TODO: Has to be split into 3 statuses and needs a queue
        side = GetBattlerSide(battler);
        if (gSideStatuses[side] & SIDE_STATUS_DAMAGE_NON_TYPES)
        {
            if (!IS_BATTLER_OF_TYPE(battler, gSideTimers[side].damageNonTypesType)
             && !IsAbilityAndRecord(battler, GetBattlerAbility(battler), ABILITY_MAGIC_GUARD))
            {
                SetPassiveDamageAmount(battler, GetNonDynamaxMaxHP(battler) / 6);
                ChooseDamageNonTypesString(gSideTimers[side].damageNonTypesType);
                BattleScriptExecute(BattleScript_DamageNonTypesContinues);
                effect = TRUE;
            }
        }
        gBattleStruct->eventState.endTurnBlock++;
        break;
    case FIRST_EVENT_BLOCK_SEA_OF_FIRE_DAMAGE:
        if (gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_SEA_OF_FIRE)
        {
            gBattlerAttacker = battler;
            SetPassiveDamageAmount(battler, GetNonDynamaxMaxHP(battler) / 8);
            BtlController_EmitStatusAnimation(battler, B_COMM_TO_CONTROLLER, FALSE, STATUS1_BURN);
            MarkBattlerForControllerExec(battler);
            BattleScriptExecute(BattleScript_HurtByTheSeaOfFire);
            effect = TRUE;
        }
        gBattleStruct->eventState.endTurnBlock++;
        break;
    case FIRST_EVENT_BLOCK_THRASH:
        if (gBattleMons[battler].volatiles.rampageTurns && gBattleMons[battler].volatiles.semiInvulnerable != STATE_SKY_DROP)
        {
            gBattleMons[battler].volatiles.rampageTurns--;
            if (gBattleMons[battler].volatiles.unableToUseMove)
            {
                CancelMultiTurnMoves(battler, SKY_DROP_IGNORE);
            }
            else if (!gBattleMons[battler].volatiles.rampageTurns && gBattleMons[battler].volatiles.multipleTurns)
            {
                gBattleMons[battler].volatiles.multipleTurns = FALSE;
                if (!gBattleMons[battler].volatiles.confusionTurns)
                {
                    SetMoveEffect(battler, battler, MOVE_EFFECT_CONFUSION, gBattlescriptCurrInstr, EFFECT_PRIMARY);
                    if (gBattleMons[battler].volatiles.confusionTurns)
                        BattleScriptExecute(BattleScript_ThrashConfuses);
                    effect = TRUE;
                }
            }
        }
        gBattleStruct->eventState.endTurnBlock++;
        break;
    case FIRST_EVENT_BLOCK_GRASSY_TERRAIN_HEAL:
        if (gFieldStatuses & STATUS_FIELD_GRASSY_TERRAIN
         && !IsBattlerAtMaxHp(battler)
         && !gBattleMons[battler].volatiles.healBlock
         && !IsSemiInvulnerable(battler, CHECK_ALL)
         && IsBattlerGrounded(battler, GetBattlerAbility(battler), GetBattlerHoldEffect(battler)))
        {
            SetHealAmount(battler, GetNonDynamaxMaxHP(battler) / 16);
            BattleScriptExecute(BattleScript_GrassyTerrainHeals);
            effect = TRUE;
        }
        gBattleStruct->eventState.endTurnBlock++;
        break;
    case FIRST_EVENT_BLOCK_ABILITIES:
    {
        enum Ability ability = GetBattlerAbility(battler);
        switch (ability)
        {
        case ABILITY_HEALER:
        case ABILITY_HYDRATION:
        case ABILITY_SHED_SKIN:
            if (AbilityBattleEffects(ABILITYEFFECT_ENDTURN, battler, ability, MOVE_NONE, TRUE))
                effect = TRUE;
            break;
        default:
            break;
        }
        gBattleStruct->eventState.endTurnBlock++;
        break;
    }
    case FIRST_EVENT_BLOCK_HEAL_ITEMS:
        if (ItemBattleEffects(battler, 0, GetBattlerHoldEffect(battler), IsLeftoversActivation))
            effect = TRUE;
        gBattleStruct->eventState.endTurnBlock = 0;
        gBattleStruct->eventState.endTurnBattler++;
        break;
    }

    return effect;
}

static bool32 HandleEndTurnAquaRing(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleMons[battler].volatiles.aquaRing
     && !gBattleMons[battler].volatiles.healBlock
     && !IsBattlerAtMaxHp(battler)
     && IsBattlerAlive(battler))
    {
        SetHealAmount(battler, GetDrainedBigRootHp(battler, GetNonDynamaxMaxHP(battler) / 16));
        BattleScriptExecute(BattleScript_AquaRingHeal);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnIngrain(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleMons[battler].volatiles.root
     && !gBattleMons[battler].volatiles.healBlock
     && !IsBattlerAtMaxHp(battler)
     && IsBattlerAlive(battler))
    {
        SetHealAmount(battler, GetDrainedBigRootHp(battler, GetNonDynamaxMaxHP(battler) / 16));
        BattleScriptExecute(BattleScript_IngrainTurnHeal);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnLeechSeed(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleMons[battler].volatiles.leechSeed
     && IsBattlerAlive(gBattleMons[battler].volatiles.leechSeed - 1)
     && IsBattlerAlive(battler)
     && !IsAbilityAndRecord(battler, GetBattlerAbility(battler), ABILITY_MAGIC_GUARD))
    {
        gBattlerTarget = gBattleMons[battler].volatiles.leechSeed - 1; // leech seed receiver
        gBattleScripting.animArg1 = gBattlerTarget;
        gBattleScripting.animArg2 = gBattlerAttacker;
        s32 drainAmount = GetNonDynamaxMaxHP(gBattlerAttacker) / 8;
        s32 healAmount = GetDrainedBigRootHp(gBattlerTarget, drainAmount);
        if (GetBattlerAbility(battler) == ABILITY_LIQUID_OOZE)
        {
            SetPassiveDamageAmount(gBattlerAttacker, drainAmount);
            SetPassiveDamageAmount(gBattlerTarget, healAmount);
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_LEECH_SEED_OOZE;
            BattleScriptExecute(BattleScript_LeechSeedTurnDrainLiquidOoze);
        }
        else if (gBattleMons[gBattlerTarget].volatiles.healBlock)
        {
            BattleScriptExecute(BattleScript_LeechSeedTurnDrainHealBlock);
        }
        else
        {
            SetPassiveDamageAmount(gBattlerAttacker, drainAmount);
            SetHealAmount(gBattlerTarget, healAmount);
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_LEECH_SEED_DRAIN;
            BattleScriptExecute(BattleScript_LeechSeedTurnDrainRecovery);
        }
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnPoison(enum BattlerId battler)
{
    bool32 effect = FALSE;

    enum Ability ability = GetBattlerAbility(battler);

    gBattleStruct->eventState.endTurnBattler++;

    if ((gBattleMons[battler].status1 & STATUS1_POISON || gBattleMons[battler].status1 & STATUS1_TOXIC_POISON)
     && IsBattlerAlive(battler)
     && !IsAbilityAndRecord(battler, ability, ABILITY_MAGIC_GUARD))
    {
        if (ability == ABILITY_POISON_HEAL)
        {
            if (!IsBattlerAtMaxHp(battler) && !gBattleMons[battler].volatiles.healBlock)
            {
                SetHealAmount(battler, GetNonDynamaxMaxHP(battler) / 8);
                BattleScriptExecute(BattleScript_PoisonHealActivates);
                effect = TRUE;
            }
        }
        else if (gBattleMons[battler].status1 & STATUS1_TOXIC_POISON)
        {
            SetPassiveDamageAmount(battler, GetNonDynamaxMaxHP(battler) / 16);
            if ((gBattleMons[battler].status1 & STATUS1_TOXIC_COUNTER) != STATUS1_TOXIC_TURN(15)) // not 16 turns
                gBattleMons[battler].status1 += STATUS1_TOXIC_TURN(1);
            gBattleStruct->passiveHpUpdate[battler] *= (gBattleMons[battler].status1 & STATUS1_TOXIC_COUNTER) >> 8;
            BattleScriptExecute(BattleScript_PoisonTurnDmg);
            effect = TRUE;
        }
        else
        {
            SetPassiveDamageAmount(battler, GetNonDynamaxMaxHP(battler) / 8);
            BattleScriptExecute(BattleScript_PoisonTurnDmg);
            effect = TRUE;
        }
    }

    return effect;
}

static bool32 HandleEndTurnBurn(enum BattlerId battler)
{
    bool32 effect = FALSE;

    enum Ability ability = GetBattlerAbility(battler);

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleMons[battler].status1 & STATUS1_BURN
     && IsBattlerAlive(battler)
     && !IsAbilityAndRecord(battler, ability, ABILITY_MAGIC_GUARD))
    {
        s32 burnDamage = GetNonDynamaxMaxHP(battler) / ((GetConfig(CONFIG_BURN_DAMAGE) >= GEN_7 || GetConfig(CONFIG_BURN_DAMAGE) == GEN_1) ? 16 : 8);
        if (ability == ABILITY_HEATPROOF)
        {
            if (burnDamage > (burnDamage / 2) + 1) // Record ability if the burn takes less damage than it normally would.
                RecordAbilityBattle(battler, ABILITY_HEATPROOF);
            burnDamage /= 2;
        }
        SetPassiveDamageAmount(battler, burnDamage);
        BattleScriptExecute(BattleScript_BurnTurnDmg);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnFrostbite(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleMons[battler].status1 & STATUS1_FROSTBITE
     && IsBattlerAlive(battler)
     && !IsAbilityAndRecord(battler, GetBattlerAbility(battler), ABILITY_MAGIC_GUARD))
    {
        SetPassiveDamageAmount(battler, GetNonDynamaxMaxHP(battler) / ((GetConfig(CONFIG_BURN_DAMAGE) >= GEN_7 || GetConfig(CONFIG_BURN_DAMAGE) == GEN_1) ? 16 : 8));
        BattleScriptExecute(BattleScript_FrostbiteTurnDmg);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnNightmare(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleMons[battler].volatiles.nightmare
     && IsBattlerAlive(battler)
     && !IsAbilityAndRecord(battler, GetBattlerAbility(battler), ABILITY_MAGIC_GUARD))
    {
        if (gBattleMons[battler].status1 & STATUS1_SLEEP || GetBattlerAbility(battler) == ABILITY_COMATOSE)
        {
            SetPassiveDamageAmount(battler, GetNonDynamaxMaxHP(battler) / 4);
            BattleScriptExecute(BattleScript_NightmareTurnDmg);
            effect = TRUE;
        }
        else
        {
            gBattleMons[battler].volatiles.nightmare = FALSE;
        }
    }

    return effect;
}

static bool32 HandleEndTurnCurse(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleMons[battler].volatiles.cursed
     && IsBattlerAlive(battler)
     && !IsAbilityAndRecord(battler, GetBattlerAbility(battler), ABILITY_MAGIC_GUARD))
    {
        SetPassiveDamageAmount(battler, GetNonDynamaxMaxHP(battler) / 4);
        BattleScriptExecute(BattleScript_CurseTurnDmg);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnWrap(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleMons[battler].volatiles.wrapped && IsBattlerAlive(battler))
    {
        if (gBattleMons[battler].volatiles.wrapTurns != 0)
        {
            gBattleMons[battler].volatiles.wrapTurns--;
            if (IsAbilityAndRecord(battler, GetBattlerAbility(battler), ABILITY_MAGIC_GUARD))
                return effect;

            gBattleScripting.animArg1 = gBattleMons[battler].volatiles.wrappedMove;
            gBattleScripting.animArg2 = gBattleMons[battler].volatiles.wrappedMove >> 8;
            PREPARE_MOVE_BUFFER(gBattleTextBuff1, gBattleMons[battler].volatiles.wrappedMove);
            BattleScriptExecute(BattleScript_WrapTurnDmg);
            s32 bindDamage = 0;
            if (GetBattlerHoldEffect(gBattleMons[battler].volatiles.wrappedBy) == HOLD_EFFECT_BINDING_BAND)
                bindDamage = GetNonDynamaxMaxHP(battler) / (B_BINDING_DAMAGE >= GEN_6 ? 6 : 8);
            else
                bindDamage = GetNonDynamaxMaxHP(battler) / (B_BINDING_DAMAGE >= GEN_6 ? 8 : 16);
            SetPassiveDamageAmount(battler, bindDamage);
        }
        else  // broke free
        {
            gBattleMons[battler].volatiles.wrapped = FALSE;
            PREPARE_MOVE_BUFFER(gBattleTextBuff1, gBattleMons[battler].volatiles.wrappedMove);
            BattleScriptExecute(BattleScript_WrapEnds);
        }
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnSaltCure(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleMons[battler].volatiles.saltCure
     && IsBattlerAlive(battler)
     && !IsAbilityAndRecord(battler, GetBattlerAbility(battler), ABILITY_MAGIC_GUARD))
    {
        s32 saltCureDamage = 0;
        if (IS_BATTLER_ANY_TYPE(battler, TYPE_STEEL, TYPE_WATER))
            saltCureDamage = GetNonDynamaxMaxHP(battler) / 4;
        else
            saltCureDamage = GetNonDynamaxMaxHP(battler) / 8;
        SetPassiveDamageAmount(battler, saltCureDamage);
        PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_SALT_CURE);
        BattleScriptExecute(BattleScript_SaltCureExtraDamage);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnOctolock(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleMons[battler].volatiles.octolock)
    {
        gBattlerTarget = battler;
        gBattlerAttacker = gBattleMons[battler].volatiles.battlerPreventingEscape;
        BattleScriptExecute(BattleScript_OctolockEndTurn);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnSyrupBomb(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleMons[battler].volatiles.syrupBomb && (IsBattlerAlive(battler)))
    {
        if (gBattleMons[battler].volatiles.syrupBombTimer > 0 && --gBattleMons[battler].volatiles.syrupBombTimer == 0)
            gBattleMons[battler].volatiles.syrupBomb = FALSE;
        PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_SYRUP_BOMB);
        gBattlescriptCurrInstr = BattleScript_SyrupBombEndTurn;
        BattleScriptExecute(gBattlescriptCurrInstr);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnTaunt(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleMons[battler].volatiles.tauntTimer && --gBattleMons[battler].volatiles.tauntTimer == 0)
    {
        gBattleScripting.battler = battler;
        BattleScriptExecute(BattleScript_BufferEndTurn);
        PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_TAUNT);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnTorment(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleMons[battler].volatiles.tormentTimer > 0 && --gBattleMons[battler].volatiles.tormentTimer == 0)
    {
        gBattleMons[battler].volatiles.torment = FALSE;
        gBattleScripting.battler = battler;
        BattleScriptExecute(BattleScript_TormentEnds);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnEncore(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleMons[battler].volatiles.encoreTimer != 0)
    {
        if (gBattleMons[battler].moves[gBattleMons[battler].volatiles.encoredMovePos] != gBattleMons[battler].volatiles.encoredMove)  // Pokémon does not have the encored move anymore
        {
            gBattleMons[battler].volatiles.encoredMove = 0;
            gBattleMons[battler].volatiles.encoreTimer = 0;
        }
        else if (--gBattleMons[battler].volatiles.encoreTimer == 0
         || gBattleMons[battler].pp[gBattleMons[battler].volatiles.encoredMovePos] == 0)
        {
            gBattleMons[battler].volatiles.encoredMove = 0;
            gBattleMons[battler].volatiles.encoreTimer = 0;
            gBattleScripting.battler = battler;
            BattleScriptExecute(BattleScript_EncoredNoMore);
            effect = TRUE;
        }
    }

    return effect;
}

static bool32 HandleEndTurnDisable(enum BattlerId battler)
{
    bool32 effect = FALSE;

    u32 moveIndex = 0;
    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleMons[battler].volatiles.disableTimer != 0)
    {
        for (moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
        {
            if (gBattleMons[battler].volatiles.disabledMove == gBattleMons[battler].moves[moveIndex])
                break;
        }
        if (moveIndex == MAX_MON_MOVES)  // Pokémon does not have the disabled move anymore
        {
            gBattleMons[battler].volatiles.disabledMove = 0;
            gBattleMons[battler].volatiles.disableTimer = 0;
        }
        else if (--gBattleMons[battler].volatiles.disableTimer == 0)  // disable ends
        {
            gBattleMons[battler].volatiles.disabledMove = 0;
            gBattleScripting.battler = battler;
            BattleScriptExecute(BattleScript_DisabledNoMore);
            effect = TRUE;
        }
    }

    return effect;
}

static bool32 HandleEndTurnMagnetRise(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleMons[battler].volatiles.magnetRiseTimer > 0 && --gBattleMons[battler].volatiles.magnetRiseTimer == 0)
    {
        gBattleMons[battler].volatiles.magnetRise = FALSE;
        BattleScriptExecute(BattleScript_BufferEndTurn);
        PREPARE_STRING_BUFFER(gBattleTextBuff1, STRINGID_ELECTROMAGNETISM);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnTelekinesis(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleMons[battler].volatiles.telekinesisTimer > 0 && --gBattleMons[battler].volatiles.telekinesisTimer == 0)
    {
        gBattleMons[battler].volatiles.telekinesis = FALSE;
        BattleScriptExecute(BattleScript_TelekinesisEndTurn);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnHealBlock(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleMons[battler].volatiles.healBlockTimer > 0 && --gBattleMons[battler].volatiles.healBlockTimer == 0)
    {
        gBattleMons[battler].volatiles.healBlock = FALSE;
        gBattleScripting.battler = battler;
        BattleScriptExecute(BattleScript_BufferEndTurn);
        PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_HEAL_BLOCK);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnEmbargo(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleMons[battler].volatiles.embargoTimer > 0 && --gBattleMons[battler].volatiles.embargoTimer == 0)
    {
        gBattleMons[battler].volatiles.embargo = FALSE;
        BattleScriptExecute(BattleScript_EmbargoEndTurn);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnYawn(enum BattlerId battler)
{
    bool32 effect = FALSE;

    enum Ability ability = GetBattlerAbility(battler);

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleMons[battler].volatiles.yawn > 0)
    {
        gBattleMons[battler].volatiles.yawn--;
        if (!gBattleMons[battler].volatiles.yawn
         && !(gBattleMons[battler].status1 & STATUS1_ANY)
         && ability != ABILITY_VITAL_SPIRIT
         && ability != ABILITY_INSOMNIA
         && !UproarWakeUpCheck(battler)
         && !IsLeafGuardProtected(battler, ability))
        {
            gEffectBattler = gBattlerTarget = battler;
            enum HoldEffect holdEffect = GetBattlerHoldEffect(battler);
            if (IsElectricTerrainAffected(battler, ability, holdEffect, gFieldStatuses))
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAINPREVENTS_ELECTRIC;
                BattleScriptExecute(BattleScript_TerrainPreventsEnd2);
            }
            else if (IsMistyTerrainAffected(battler, ability, holdEffect, gFieldStatuses))
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAINPREVENTS_MISTY;
                BattleScriptExecute(BattleScript_TerrainPreventsEnd2);
            }
            else if (IsSleepClauseActiveForSide(GetBattlerSide(battler)))
            {
                BattleScriptExecute(BattleScript_SleepClausePreventsEnd2);
            }
            else if ((gBattleScripting.battler = IsAbilityOnSide(battler, ABILITY_SWEET_VEIL)))
            {
                gBattleScripting.battler--;
                gLastUsedAbility = ABILITY_SWEET_VEIL;
                gBattlerAbility = gBattleScripting.battler;
                RecordAbilityBattle(gBattleScripting.battler, ABILITY_SWEET_VEIL);
                BattleScriptExecute(BattleScript_ImmunityProtectedEnd2);
            }
            else
            {
                if (B_SLEEP_TURNS >= GEN_5)
                    gBattleMons[battler].status1 |= (RandomUniform(RNG_SLEEP_TURNS, 2, 4));
                else if (B_SLEEP_TURNS >= GEN_3)
                    gBattleMons[battler].status1 |= (RandomUniform(RNG_SLEEP_TURNS, 2, 5));
                else
                    gBattleMons[battler].status1 |= (RandomUniform(RNG_SLEEP_TURNS, 2, 8));

                CancelMultiTurnMoves(battler, SKY_DROP_STATUS_YAWN);
                TryActivateSleepClause(battler, gBattlerPartyIndexes[battler]);
                BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[battler].status1);
                MarkBattlerForControllerExec(battler);
                BattleScriptExecute(BattleScript_YawnMakesAsleepEnd2);
            }
            effect = TRUE;
        }
    }

    return effect;
}

static bool32 HandleEndTurnPerishSong(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (IsBattlerAlive(battler) && gBattleMons[battler].volatiles.perishSong)
    {
        PREPARE_BYTE_NUMBER_BUFFER(gBattleTextBuff1, 1, gBattleMons[battler].volatiles.perishSongTimer);
        if (gBattleMons[battler].volatiles.perishSongTimer == 0)
        {
            gBattleMons[battler].volatiles.perishSong = FALSE;
            SetPassiveDamageAmount(battler, gBattleMons[battler].hp);
            BattleScriptExecute(BattleScript_PerishSongTakesLife);
        }
        else
        {
            gBattleMons[battler].volatiles.perishSongTimer--;
            BattleScriptExecute(BattleScript_PerishSongCountGoesDown);
        }
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnRoost(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (gBattleMons[battler].volatiles.roostActive)
        gBattleMons[battler].volatiles.roostActive = FALSE;

    return effect;
}

static bool32 HandleEndTurnSecondEventBlock(enum BattlerId battler)
{
    bool32 effect = FALSE;

    enum BattleSide side = gBattleStruct->eventState.battlerSide;

    switch (gBattleStruct->eventState.endTurnBlock)
    {
    case SECOND_EVENT_BLOCK_REFLECT:
        if (gSideTimers[side].reflectTimer > 0 && --gSideTimers[side].reflectTimer == 0)
        {
            gBattlerAttacker = GetBattlerSideForMessage(side);
            gSideStatuses[side] &= ~SIDE_STATUS_REFLECT;
            BattleScriptExecute(BattleScript_SideStatusWoreOff);
            gBattleCommunication[MULTISTRING_CHOOSER] = side;
            PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_REFLECT);
            effect = TRUE;
        }
        gBattleStruct->eventState.endTurnBlock++;
        break;
    case SECOND_EVENT_BLOCK_LIGHT_SCREEN:
        if (gSideTimers[side].lightscreenTimer > 0 && --gSideTimers[side].lightscreenTimer == 0)
        {
            gBattlerAttacker = GetBattlerSideForMessage(side);
            gSideStatuses[side] &= ~SIDE_STATUS_LIGHTSCREEN;
            BattleScriptExecute(BattleScript_SideStatusWoreOff);
            gBattleCommunication[MULTISTRING_CHOOSER] = side;
            PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_LIGHT_SCREEN);
            effect = TRUE;
        }
        gBattleStruct->eventState.endTurnBlock++;
        break;
    case SECOND_EVENT_BLOCK_SAFEGUARD:
        if (gSideTimers[side].safeguardTimer > 0 && --gSideTimers[side].safeguardTimer == 0)
        {
            gBattlerAttacker = GetBattlerSideForMessage(side);
            gSideStatuses[side] &= ~SIDE_STATUS_SAFEGUARD;
            BattleScriptExecute(BattleScript_SafeguardEnds);
            effect = TRUE;
        }
        gBattleStruct->eventState.endTurnBlock++;
        break;
    case SECOND_EVENT_BLOCK_MIST:
        if (gSideTimers[side].mistTimer > 0 && --gSideTimers[side].mistTimer == 0)
        {
            gBattlerAttacker = GetBattlerSideForMessage(side);
            gSideStatuses[side] &= ~SIDE_STATUS_MIST;
            BattleScriptExecute(BattleScript_SideStatusWoreOff);
            gBattleCommunication[MULTISTRING_CHOOSER] = side;
            PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_MIST);
            effect = TRUE;
        }
        gBattleStruct->eventState.endTurnBlock++;
        break;
    case SECOND_EVENT_BLOCK_TAILWIND:
        if (gSideTimers[side].tailwindTimer > 0 && --gSideTimers[side].tailwindTimer == 0)
        {
            gBattlerAttacker = GetBattlerSideForMessage(side);
            gSideStatuses[side] &= ~SIDE_STATUS_TAILWIND;
            BattleScriptExecute(BattleScript_TailwindEnds);
            effect = TRUE;
        }
        gBattleStruct->eventState.endTurnBlock++;
        break;
    case SECOND_EVENT_BLOCK_LUCKY_CHANT:
        if (gSideTimers[side].luckyChantTimer > 0 && --gSideTimers[side].luckyChantTimer == 0)
        {
            gBattlerAttacker = GetBattlerSideForMessage(side);
            gSideStatuses[side] &= ~SIDE_STATUS_LUCKY_CHANT;
            BattleScriptExecute(BattleScript_LuckyChantEnds);
            effect = TRUE;
        }
        gBattleStruct->eventState.endTurnBlock++;
        break;
    case SECOND_EVENT_BLOCK_RAINBOW:
        gBattlerAttacker = GetBattlerSideForMessage(side);
        if (gSideTimers[side].rainbowTimer > 0 && --gSideTimers[side].rainbowTimer == 0)
        {
            gSideStatuses[side] &= ~SIDE_STATUS_RAINBOW;
            BattleScriptExecute(BattleScript_TheRainbowDisappeared);
            effect = TRUE;
        }
        gBattleStruct->eventState.endTurnBlock++;
            break;
    case SECOND_EVENT_BLOCK_SEA_OF_FIRE:
        if (gSideTimers[side].seaOfFireTimer > 0 && --gSideTimers[side].seaOfFireTimer == 0)
        {
            gSideStatuses[side] &= ~SIDE_STATUS_SEA_OF_FIRE;
            BattleScriptExecute(BattleScript_TheSeaOfFireDisappeared);
            effect = TRUE;
        }
        gBattleStruct->eventState.endTurnBlock++;
        break;
    case SECOND_EVENT_BLOCK_SWAMP:
        gBattlerAttacker = GetBattlerSideForMessage(side);
        if (gSideTimers[side].swampTimer > 0 && --gSideTimers[side].swampTimer == 0)
        {
            gSideStatuses[side] &= ~SIDE_STATUS_SWAMP;
            BattleScriptExecute(BattleScript_TheSwampDisappeared);
            effect = TRUE;
        }
        gBattleStruct->eventState.endTurnBlock++;
        break;
    case SECOND_EVENT_BLOCK_AURORA_VEIL:
        if (gSideTimers[side].auroraVeilTimer > 0 && --gSideTimers[side].auroraVeilTimer == 0)
        {
            gBattlerAttacker = GetBattlerSideForMessage(side);
            gSideStatuses[side] &= ~SIDE_STATUS_AURORA_VEIL;
            BattleScriptExecute(BattleScript_SideStatusWoreOff);
            gBattleCommunication[MULTISTRING_CHOOSER] = side;
            PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_AURORA_VEIL);
            effect = TRUE;
        }
        gBattleStruct->eventState.battlerSide++;
        gBattleStruct->eventState.endTurnBlock = 0;
        break;
    }

    return effect;
}

static bool32 HandleEndTurnTrickRoom(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurn++;

    if (gFieldTimers.trickRoomTimer > 0 && --gFieldTimers.trickRoomTimer == 0)
    {
        gFieldStatuses &= ~STATUS_FIELD_TRICK_ROOM;
        BattleScriptExecute(BattleScript_TrickRoomEnds);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnGravity(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurn++;

    if (gFieldTimers.gravityTimer > 0 && --gFieldTimers.gravityTimer == 0)
    {
        gFieldStatuses &= ~STATUS_FIELD_GRAVITY;
        BattleScriptExecute(BattleScript_GravityEnds);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnWaterSport(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurn++;

    if (gFieldTimers.waterSportTimer > 0 && --gFieldTimers.waterSportTimer == 0)
    {
        gFieldStatuses &= ~STATUS_FIELD_WATERSPORT;
        BattleScriptExecute(BattleScript_WaterSportEnds);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnMudSport(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurn++;

    if (gFieldTimers.mudSportTimer > 0 && --gFieldTimers.mudSportTimer == 0)
    {
        gFieldStatuses &= ~STATUS_FIELD_MUDSPORT;
        BattleScriptExecute(BattleScript_MudSportEnds);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnWonderRoom(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurn++;

    if (gFieldTimers.wonderRoomTimer > 0 && --gFieldTimers.wonderRoomTimer == 0)
    {
        gFieldStatuses &= ~STATUS_FIELD_WONDER_ROOM;
        BattleScriptExecute(BattleScript_WonderRoomEnds);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnMagicRoom(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurn++;

    if (gFieldTimers.magicRoomTimer > 0 && --gFieldTimers.magicRoomTimer == 0)
    {
        gFieldStatuses &= ~STATUS_FIELD_MAGIC_ROOM;
        BattleScriptExecute(BattleScript_MagicRoomEnds);
        effect = TRUE;
    }

    return effect;
}

static bool32 EndTurnTerrain(u32 terrainFlag, u32 stringTableId)
{
    if (gFieldTimers.terrainTimer > 0 && --gFieldTimers.terrainTimer == 0)
    {
        gFieldStatuses &= ~terrainFlag;
        TryToRevertMimicryAndFlags();
        gBattleCommunication[MULTISTRING_CHOOSER] = stringTableId;
        BattleScriptExecute(BattleScript_TerrainEnds);
        return TRUE;
    }

    return FALSE;
}

static bool32 HandleEndTurnTerrain(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurn++;

    if (gFieldStatuses & STATUS_FIELD_ELECTRIC_TERRAIN)
        effect = EndTurnTerrain(STATUS_FIELD_ELECTRIC_TERRAIN, B_MSG_TERRAIN_END_ELECTRIC);
    else if (gFieldStatuses & STATUS_FIELD_MISTY_TERRAIN)
        effect = EndTurnTerrain(STATUS_FIELD_MISTY_TERRAIN, B_MSG_TERRAIN_END_MISTY);
    else if (gFieldStatuses & STATUS_FIELD_GRASSY_TERRAIN)
        effect = EndTurnTerrain(STATUS_FIELD_GRASSY_TERRAIN, B_MSG_TERRAIN_END_GRASSY);
    else if (gFieldStatuses & STATUS_FIELD_PSYCHIC_TERRAIN)
        effect = EndTurnTerrain(STATUS_FIELD_PSYCHIC_TERRAIN, B_MSG_TERRAIN_END_PSYCHIC);

    return effect;
}

static bool32 HandleEndTurnThirdEventBlock(enum BattlerId battler)
{
    bool32 effect = FALSE;

    if (!IsBattlerAlive(battler))
    {
        gBattleStruct->eventState.endTurnBattler++;
        return effect;
    }

    switch (gBattleStruct->eventState.endTurnBlock)
    {
    case THIRD_EVENT_BLOCK_UPROAR:
        if (gBattleMons[battler].volatiles.uproarTurns)
        {
            for (gEffectBattler = 0; gEffectBattler < gBattlersCount; gEffectBattler++)
            {
                if ((gBattleMons[gEffectBattler].status1 & STATUS1_SLEEP)
                 && GetBattlerAbility(gEffectBattler) != ABILITY_SOUNDPROOF)
                {
                    gBattleMons[gEffectBattler].status1 &= ~STATUS1_SLEEP;
                    gBattleMons[gEffectBattler].volatiles.nightmare = FALSE;
                    gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                    BattleScriptExecute(BattleScript_MonWokeUpInUproar);
                    BtlController_EmitSetMonData(gEffectBattler, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gBattlerAttacker].status1);
                    MarkBattlerForControllerExec(gEffectBattler);
                    effect = TRUE;
                    break;
                }
            }
            if (effect == FALSE)
            {
                gBattlerAttacker = battler;
                gBattleMons[battler].volatiles.uproarTurns--;  // uproar timer goes down
                if (gBattleMons[battler].volatiles.unableToUseMove)
                {
                    CancelMultiTurnMoves(battler, SKY_DROP_IGNORE);
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_UPROAR_ENDS;
                }
                else if (gBattleMons[battler].volatiles.uproarTurns)
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_UPROAR_CONTINUES;
                    gBattleMons[battler].volatiles.multipleTurns = TRUE;
                }
                else
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_UPROAR_ENDS;
                    CancelMultiTurnMoves(battler, SKY_DROP_IGNORE);
                }
                BattleScriptExecute(BattleScript_PrintUproarOverTurns);
                effect = TRUE;
            }
        }
        gBattleStruct->eventState.endTurnBlock++;
        break;
    case THIRD_EVENT_BLOCK_ABILITIES:
    {
        enum Ability ability = GetBattlerAbility(battler);
        switch (ability)
        {
        case ABILITY_TRUANT: // Not fully accurate but it has to be handled somehow. TODO: Find a better way.
        case ABILITY_CUD_CHEW:
        case ABILITY_SLOW_START:
        case ABILITY_BAD_DREAMS:
        case ABILITY_BALL_FETCH:
        case ABILITY_HARVEST:
        case ABILITY_MOODY:
        case ABILITY_PICKUP:
        case ABILITY_SPEED_BOOST:
            if (AbilityBattleEffects(ABILITYEFFECT_ENDTURN, battler, ability, MOVE_NONE, TRUE))
                effect = TRUE;
            break;
        default:
            break;
        }
        gBattleStruct->eventState.endTurnBlock++;
        break;
    }
    case THIRD_EVENT_BLOCK_ITEMS:
    {
        // TODO: simplify
        enum HoldEffect holdEffect = GetBattlerHoldEffect(battler);
        switch (holdEffect)
        {
        case HOLD_EFFECT_FLAME_ORB:
        case HOLD_EFFECT_STICKY_BARB:
        case HOLD_EFFECT_TOXIC_ORB:
            if (ItemBattleEffects(battler, 0, holdEffect, IsOrbsActivation))
                effect = TRUE;
            break;
        case HOLD_EFFECT_WHITE_HERB:
            if (ItemBattleEffects(battler, 0, holdEffect, IsWhiteHerbEndTurnActivation))
                effect = TRUE;
            break;
        default:
            break;
        }
        gBattleStruct->eventState.endTurnBlock = 0;
        gBattleStruct->eventState.endTurnBattler++;
        break;
    }
    }

    return effect;
}

static bool32 HandleEndTurnFormChange(enum BattlerId battler)
{
    bool32 effect = FALSE;

    enum Ability ability = GetBattlerAbility(battler);

    gBattleStruct->eventState.endTurnBattler++;

    if (TryBattleFormChange(battler, FORM_CHANGE_BATTLE_TURN_END, ability)
        || TryBattleFormChange(battler, FORM_CHANGE_BATTLE_HP_PERCENT_TURN_END, ability))
    {
        gBattleScripting.battler = battler;
        gBattleScripting.abilityPopupOverwrite = ability; // To prevent the new form's ability from pop up
        if (ability == ABILITY_POWER_CONSTRUCT) // Special animation
            BattleScriptExecute(BattleScript_PowerConstruct);
        else if (ability == ABILITY_HUNGER_SWITCH)
            BattleScriptExecute(BattleScript_BattlerFormChangeEnd3NoPopup);
        else
            BattleScriptExecute(BattleScript_BattlerFormChangeEnd2); // Generic animation
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnEjectPack(enum BattlerId battler)
{
    gBattleStruct->eventState.endTurn++;
    return TrySwitchInEjectPack(END_TURN);
}

static bool32 HandleEndTurnDynamax(enum BattlerId battler)
{
    bool32 effect = FALSE;

    gBattleStruct->eventState.endTurnBattler++;

    if (GetActiveGimmick(battler) == GIMMICK_DYNAMAX && gBattleStruct->dynamax.dynamaxTurns[battler] > 0 && --gBattleStruct->dynamax.dynamaxTurns[battler] == 0)
    {
        gBattleScripting.battler = battler;
        UndoDynamax(battler);
        BattleScriptExecute(BattleScript_DynamaxEnds);
        effect = TRUE;
    }

    return effect;
}

static bool32 TryEndTurnTrainerSlide(enum BattlerId battler)
{
    return ((ShouldDoTrainerSlide(battler, TRAINER_SLIDE_LAST_LOW_HP) != TRAINER_SLIDE_TARGET_NONE)
         || (ShouldDoTrainerSlide(battler, TRAINER_SLIDE_LAST_HALF_HP) != TRAINER_SLIDE_TARGET_NONE)
         || (ShouldDoTrainerSlide(battler, TRAINER_SLIDE_PLAYER_LANDS_FIRST_CRITICAL_HIT) != TRAINER_SLIDE_TARGET_NONE)
         || (ShouldDoTrainerSlide(battler, TRAINER_SLIDE_ENEMY_LANDS_FIRST_CRITICAL_HIT) != TRAINER_SLIDE_TARGET_NONE)
         || (ShouldDoTrainerSlide(battler, TRAINER_SLIDE_PLAYER_LANDS_FIRST_SUPER_EFFECTIVE_HIT) != TRAINER_SLIDE_TARGET_NONE)
         || (ShouldDoTrainerSlide(battler, TRAINER_SLIDE_PLAYER_LANDS_FIRST_STAB_MOVE) != TRAINER_SLIDE_TARGET_NONE)
         || (ShouldDoTrainerSlide(battler, TRAINER_SLIDE_ENEMY_MON_UNAFFECTED) != TRAINER_SLIDE_TARGET_NONE));
}

static bool32 HandleEndTurnTrainerASlides(enum BattlerId battler)
{
    gBattleStruct->eventState.endTurnBattler++;
    bool32 slide = TryEndTurnTrainerSlide(B_BATTLER_1);
    if (slide == TRUE)
        BattleScriptExecute(BattleScript_TrainerASlideMsgEnd2);
    return slide;
}

static bool32 HandleEndTurnTrainerBSlides(enum BattlerId battler)
{
    gBattleStruct->eventState.endTurnBattler++;

    if (!IsDoubleBattle())
        return FALSE;

    bool32 slide = TryEndTurnTrainerSlide(B_BATTLER_3);

    if (slide == TRUE)
    {
        if ((TRAINER_BATTLE_PARAM.opponentB == TRAINER_BATTLE_PARAM.opponentA)
        || (TRAINER_BATTLE_PARAM.opponentB == TRAINER_NONE)
        || (TRAINER_BATTLE_PARAM.opponentB == 0xFFFF))
            BattleScriptExecute(BattleScript_TrainerASlideMsgEnd2);
        else
            BattleScriptExecute(BattleScript_TrainerBSlideMsgEnd2);
    }

    return slide;
}

static bool32 HandleEndTurnTrainerPartnerSlides(enum BattlerId battler)
{
    gBattleStruct->eventState.endTurnBattler++;

    if (!IsDoubleBattle())
        return FALSE;

    bool32 slide = TryEndTurnTrainerSlide(B_BATTLER_2);

    if (slide == TRUE)
        BattleScriptExecute(BattleScript_TrainerPartnerSlideMsgEnd2);

    return slide;
}

/*
 * Various end turn effects that happen after all battlers moved.
 * Each Case will apply the effects for each battler. Moving to the next case when all battlers are done.
 * If an effect is going to be applied on a better, the bool effect will be set to TRUE and a script set.
 * The script is set with `BattleScriptExecute` and should have the ending `end2`
   Example:
        BattleScriptExecute(BattleScript_X);

        (in battle_scripts_1.s)
        BattleScript_X:
            some commands
            end2
 */
static bool32 (*const sEndTurnEffectHandlers[])(enum BattlerId battler) =
{
    [ENDTURN_ORDER] = HandleEndTurnOrder,
    [ENDTURN_VARIOUS] = HandleEndTurnVarious,
    [ENDTURN_WEATHER] = HandleEndTurnWeather,
    [ENDTURN_WEATHER_DAMAGE] = HandleEndTurnWeatherDamage,
    [ENDTURN_EMERGENCY_EXIT_1] = HandleEndTurnEmergencyExit,
    [ENDTURN_AFFECTION] = HandleEndTurnAffection,
    [ENDTURN_FUTURE_SIGHT] = HandleEndTurnFutureSight,
    [ENDTURN_WISH] = HandleEndTurnWish,
    [ENDTURN_FIRST_EVENT_BLOCK] = HandleEndTurnFirstEventBlock,
    [ENDTURN_EMERGENCY_EXIT_2] = HandleEndTurnEmergencyExit,
    [ENDTURN_AQUA_RING] = HandleEndTurnAquaRing,
    [ENDTURN_INGRAIN] = HandleEndTurnIngrain,
    [ENDTURN_LEECH_SEED] = HandleEndTurnLeechSeed,
    [ENDTURN_POISON] = HandleEndTurnPoison,
    [ENDTURN_BURN] = HandleEndTurnBurn,
    [ENDTURN_FROSTBITE] = HandleEndTurnFrostbite,
    [ENDTURN_NIGHTMARE] = HandleEndTurnNightmare,
    [ENDTURN_CURSE] = HandleEndTurnCurse,
    [ENDTURN_WRAP] = HandleEndTurnWrap,
    [ENDTURN_SALT_CURE] = HandleEndTurnSaltCure,
    [ENDTURN_OCTOLOCK] = HandleEndTurnOctolock,
    [ENDTURN_SYRUP_BOMB] = HandleEndTurnSyrupBomb,
    [ENDTURN_TAUNT] = HandleEndTurnTaunt,
    [ENDTURN_TORMENT] = HandleEndTurnTorment,
    [ENDTURN_ENCORE] = HandleEndTurnEncore,
    [ENDTURN_DISABLE] = HandleEndTurnDisable,
    [ENDTURN_MAGNET_RISE] = HandleEndTurnMagnetRise,
    [ENDTURN_TELEKINESIS] = HandleEndTurnTelekinesis,
    [ENDTURN_HEAL_BLOCK] = HandleEndTurnHealBlock,
    [ENDTURN_EMBARGO] = HandleEndTurnEmbargo,
    [ENDTURN_YAWN] = HandleEndTurnYawn,
    [ENDTURN_PERISH_SONG] = HandleEndTurnPerishSong,
    [ENDTURN_ROOST] = HandleEndTurnRoost,
    [ENDTURN_EMERGENCY_EXIT_3] = HandleEndTurnEmergencyExit,
    [ENDTURN_SECOND_EVENT_BLOCK] = HandleEndTurnSecondEventBlock,
    [ENDTURN_TRICK_ROOM] = HandleEndTurnTrickRoom,
    [ENDTURN_GRAVITY] = HandleEndTurnGravity,
    [ENDTURN_WATER_SPORT] = HandleEndTurnWaterSport,
    [ENDTURN_MUD_SPORT] = HandleEndTurnMudSport,
    [ENDTURN_WONDER_ROOM] = HandleEndTurnWonderRoom,
    [ENDTURN_MAGIC_ROOM] = HandleEndTurnMagicRoom,
    [ENDTURN_TERRAIN] = HandleEndTurnTerrain,
    [ENDTURN_THIRD_EVENT_BLOCK] = HandleEndTurnThirdEventBlock,
    [ENDTURN_EMERGENCY_EXIT_4] = HandleEndTurnEmergencyExit,
    [ENDTURN_FORM_CHANGE] = HandleEndTurnFormChange,
    [ENDTURN_EJECT_PACK] = HandleEndTurnEjectPack,
    [ENDTURN_DYNAMAX] = HandleEndTurnDynamax,
    [ENDTURN_TRAINER_A_SLIDES] = HandleEndTurnTrainerASlides,
    [ENDTURN_TRAINER_B_SLIDES] = HandleEndTurnTrainerBSlides,
    [ENDTURN_TRAINER_PARTNER_SLIDES] = HandleEndTurnTrainerPartnerSlides,
};

bool32 DoEndTurnEffects(void)
{
    enum BattlerId battler = MAX_BATTLERS_COUNT;

    for (;;)
    {
        // If either turnEffectsBattlerId or turnSideTracker are at max count, reest values and go to the next state
        if (gBattleStruct->eventState.endTurnBattler == gBattlersCount || gBattleStruct->eventState.battlerSide == NUM_BATTLE_SIDES)
        {
            gBattleStruct->eventState.endTurnBattler = 0;
            gBattleStruct->eventState.battlerSide = 0;
            gBattleStruct->eventState.endTurnBlock = 0;
            gBattleStruct->eventState.endTurn++;
        }

        // Jump out if possible after endTurnEventsCounter was increased in the above code block
        if (gBattleStruct->eventState.endTurn == ENDTURN_COUNT)
            return FALSE;

        battler = gBattlerAttacker = gBattlerByTurnOrder[gBattleStruct->eventState.endTurnBattler];

        if (sEndTurnEffectHandlers[gBattleStruct->eventState.endTurn](battler))
            return TRUE;
    }
}
