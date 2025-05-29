#include "global.h"
#include "battle.h"
#include "battle_util.h"
#include "battle_controllers.h"
#include "battle_ai_util.h"
#include "battle_gimmick.h"
#include "battle_scripts.h"
#include "constants/battle.h"
#include "constants/battle_string_ids.h"
#include "constants/hold_effects.h"
#include "constants/abilities.h"
#include "constants/items.h"
#include "constants/moves.h"

// General End Turn Effects based on research from smogon from vanilla games:
// https://www.smogon.com/forums/threads/sword-shield-battle-mechanics-research.3655528/page-64#post-9244179
enum EndTurnResolutionOrder
{
    ENDTURN_ORDER,
    ENDTURN_VARIOUS,
    ENDTURN_WEATHER,
    ENDTURN_WEATHER_DAMAGE,
    ENDTURN_GEN_3_BERRY_ACTIVATION,
    ENDTURN_EMERGENCY_EXIT_1,
    ENDTURN_AFFECTION,
    ENDTURN_FUTURE_SIGHT,
    ENDTURN_WISH,
    ENDTURN_FIRST_EVENT_BLOCK,
    ENDTURN_EMERGENCY_EXIT_2,
    ENDTURN_AQUA_RING,
    ENDTURN_INGRAIN,
    ENDTURN_LEECH_SEED,
    ENDTURN_POISON,
    ENDTURN_BURN,
    ENDTURN_FROSTBITE,
    ENDTURN_NIGHTMARE,
    ENDTURN_CURSE,
    ENDTURN_WRAP,
    ENDTURN_SALT_CURE,
    ENDTURN_OCTOLOCK,
    ENDTURN_SYRUP_BOMB,
    ENDTURN_TAUNT,
    ENDTURN_TORMENT,
    ENDTURN_ENCORE,
    ENDTURN_DISABLE,
    ENDTURN_MAGNET_RISE,
    ENDTURN_TELEKINESIS,
    ENDTURN_HEAL_BLOCK,
    ENDTURN_EMBARGO,
    ENDTURN_YAWN,
    ENDTURN_PERISH_SONG,
    ENDTURN_ROOST,
    ENDTURN_EMERGENCY_EXIT_3,
    ENDTURN_SECOND_EVENT_BLOCK,
    ENDTURN_TRICK_ROOM,
    ENDTURN_GRAVITY,
    ENDTURN_WATER_SPORT,
    ENDTURN_MUD_SPORT,
    ENDTURN_WONDER_ROOM,
    ENDTURN_MAGIC_ROOM,
    ENDTURN_TERRAIN,
    ENDTURN_THIRD_EVENT_BLOCK,
    ENDTURN_EMERGENCY_EXIT_4,
    ENDTURN_ABILITIES,
    ENDTURN_FOURTH_EVENT_BLOCK,
    ENDTURN_DYNAMAX,
    ENDTURN_COUNT,
};

// Block that handles effects for each individual battler on the field (eg residual damage)
enum FirstEventBlock
{
    FIRST_EVENT_BLOCK_GMAX_MOVE_RESIDUAL, // Needs to be split
    FIRST_EVENT_BLOCK_SEA_OF_FIRE_DAMAGE,
    FIRST_EVENT_BLOCK_THRASH, // Thrash isn't handled here in vanilla but for now it is that best place for it.
    FIRST_EVENT_BLOCK_GRASSY_TERRAIN_HEAL,
    FIRST_EVENT_BLOCK_ABILITIES,
    FIRST_EVENT_BLOCK_HEAL_ITEMS,
};

// Block that tries to remove side statuses
enum SecondEventBlock
{
    SECOND_EVENT_BLOCK_REFLECT,
    SECOND_EVENT_BLOCK_LIGHT_SCREEN,
    SECOND_EVENT_BLOCK_SAFEGUARD,
    SECOND_EVENT_BLOCK_MIST,
    SECOND_EVENT_BLOCK_TAILWIND,
    SECOND_EVENT_BLOCK_LUCKY_CHANT,
    SECOND_EVENT_BLOCK_RAINBOW,
    SECOND_EVENT_BLOCK_SEA_OF_FIRE,
    SECOND_EVENT_BLOCK_SWAMP,
    SECOND_EVENT_BLOCK_AURORA_VEIL,
};

// Block that handles Uproar, items and non-form changing abilities
enum ThirdEventBlock
{
    THIRD_EVENT_BLOCK_UPROAR,
    THIRD_EVENT_BLOCK_ABILITIES,
    THIRD_EVENT_BLOCK_ITEMS,
};

// Form changing abilities and Eject Pack
enum FourthEventBlock
{
    FOURTH_EVENT_BLOCK_HUNGER_SWITCH,
    FOURTH_EVENT_BLOCK_EJECT_PACK,
};

static inline bool32 IsBattlerProtectedByMagicGuard(u32 battler, u32 ability)
{
    if (ability != ABILITY_MAGIC_GUARD)
        return FALSE;

    RecordAbilityBattle(battler, ability);
    return TRUE;
}

static u32 GetBattlerSideForMessage(u32 side)
{
    u32 battler = 0;

    for (battler = 0; battler < gBattlersCount; battler++)
    {
        if (GetBattlerSide(battler) == side)
            break;
    }

    return battler;
}

static bool32 HandleEndTurnOrder(u32 battler)
{
    bool32 effect = FALSE;

    gBattleTurnCounter++;
    gBattleStruct->endTurnEventsCounter++;

    u32 i, j;
    for (i = 0; i < gBattlersCount; i++)
    {
        gBattlerByTurnOrder[i] = i;
    }
    for (i = 0; i < gBattlersCount - 1; i++)
    {
        for (j = i + 1; j < gBattlersCount; j++)
        {
            if (GetWhichBattlerFaster(gBattlerByTurnOrder[i], gBattlerByTurnOrder[j], FALSE) == -1)
                SwapTurnOrder(i, j);
        }
    }

    return effect;
}

static bool32 HandleEndTurnVarious(u32 battler)
{
    u32 i;
    bool32 effect = FALSE;

    gBattleStruct->endTurnEventsCounter++;

    if (gFieldStatuses & STATUS_FIELD_FAIRY_LOCK && gFieldTimers.fairyLockTimer == gBattleTurnCounter)
        gFieldStatuses &= ~STATUS_FIELD_FAIRY_LOCK;

    for (i = 0; i < NUM_BATTLE_SIDES; i++)
    {
        if (gSideStatuses[i] & SIDE_STATUS_DAMAGE_NON_TYPES && gSideTimers[i].damageNonTypesTimer == gBattleTurnCounter)
            gSideStatuses[i] &= ~SIDE_STATUS_DAMAGE_NON_TYPES;
    }

    for (i = 0; i < gBattlersCount; i++)
    {
        if (gStatuses3[i] & STATUS3_ALWAYS_HITS)
            gStatuses3[i] -= STATUS3_ALWAYS_HITS_TURN(1);

        if (gDisableStructs[i].chargeTimer && --gDisableStructs[i].chargeTimer == 0)
            gStatuses3[i] &= ~STATUS3_CHARGED_UP;

        if (gStatuses3[i] & STATUS3_LASER_FOCUS && gDisableStructs[i].laserFocusTimer == gBattleTurnCounter)
            gStatuses3[i] &= ~STATUS3_LASER_FOCUS;

        gBattleStruct->hpBefore[i] = gBattleMons[i].hp;
    }

    return effect;
}

static bool32 HandleEndTurnWeather(u32 battler)
{
    gBattleStruct->endTurnEventsCounter++;
    return EndOrContinueWeather();
}

static bool32 HandleEndTurnWeatherDamage(u32 battler)
{
    bool32 effect = FALSE;

    u32 ability = GetBattlerAbility(battler);
    u32 currBattleWeather = GetCurrentBattleWeather();

    if (currBattleWeather == 0xFF)
    {
        // If there is no weather on the field, no need to check other battlers so go to next state
        gBattleStruct->turnEffectsBattlerId = 0;
        gBattleStruct->endTurnEventsCounter++;
        return effect;
    }

    gBattleStruct->turnEffectsBattlerId++;

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
            if (AbilityBattleEffects(ABILITYEFFECT_ENDTURN, battler, ability, 0, MOVE_NONE))
                effect = TRUE;
        }
        break;
    case BATTLE_WEATHER_SUN:
    case BATTLE_WEATHER_SUN_PRIMAL:
        if (ability == ABILITY_DRY_SKIN || ability == ABILITY_SOLAR_POWER)
        {
            if (AbilityBattleEffects(ABILITYEFFECT_ENDTURN, battler, ability, 0, MOVE_NONE))
                effect = TRUE;
        }
        break;
    case BATTLE_WEATHER_SANDSTORM:
        if (ability != ABILITY_SAND_VEIL
         && ability != ABILITY_SAND_FORCE
         && ability != ABILITY_SAND_RUSH
         && ability != ABILITY_OVERCOAT
         && !IS_BATTLER_ANY_TYPE(gBattlerAttacker, TYPE_ROCK, TYPE_GROUND, TYPE_STEEL)
         && !(gStatuses3[gBattlerAttacker] & (STATUS3_UNDERGROUND | STATUS3_UNDERWATER))
         && GetBattlerHoldEffect(gBattlerAttacker, TRUE) != HOLD_EFFECT_SAFETY_GOGGLES
         && !IsBattlerProtectedByMagicGuard(battler, ability))
        {
            gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 16;
            if (gBattleStruct->moveDamage[battler] == 0)
                gBattleStruct->moveDamage[battler] = 1;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SANDSTORM;
            BattleScriptExecute(BattleScript_DamagingWeather);
            effect = TRUE;
        }
        break;
    case BATTLE_WEATHER_HAIL:
    case BATTLE_WEATHER_SNOW:
        if (ability == ABILITY_ICE_BODY)
        {
            if (AbilityBattleEffects(ABILITYEFFECT_ENDTURN, battler, ability, 0, MOVE_NONE))
                effect = TRUE;
        }
        else if (currBattleWeather == BATTLE_WEATHER_HAIL)
        {
            if (ability != ABILITY_SNOW_CLOAK
             && ability != ABILITY_OVERCOAT
             && !IS_BATTLER_OF_TYPE(battler, TYPE_ICE)
             && !(gStatuses3[battler] & (STATUS3_UNDERGROUND | STATUS3_UNDERWATER))
             && GetBattlerHoldEffect(battler, TRUE) != HOLD_EFFECT_SAFETY_GOGGLES
             && !IsBattlerProtectedByMagicGuard(battler, ability))
            {
                gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 16;
                if (gBattleStruct->moveDamage[battler] == 0)
                    gBattleStruct->moveDamage[battler] = 1;
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_HAIL;
                BattleScriptExecute(BattleScript_DamagingWeather);
                effect = TRUE;
            }
        }
        break;
    }

    return effect;
}

static bool32 HandleEndTurnGenThreeBerryActivation(u32 battler)
{
    bool32 effect = FALSE;

    if (B_HP_BERRIES >= GEN_4) // Skip handler for > Gen3
    {
        gBattleStruct->endTurnEventsCounter++;
        return effect;
    }
    gBattleStruct->turnEffectsBattlerId++;
    effect = TryRestoreHPBerries(battler, ITEMEFFECT_NORMAL);
    return effect;
}

static bool32 HandleEndTurnEmergencyExit(u32 battler)
{
    bool32 effect = FALSE;
    u32 ability = GetBattlerAbility(battler);

    gBattleStruct->turnEffectsBattlerId++;

    if (ability == ABILITY_EMERGENCY_EXIT || ability == ABILITY_WIMP_OUT)
    {
        u32 cutoff = gBattleMons[battler].maxHP / 2;
        bool32 HadMoreThanHalfHpNowDoesnt = gBattleStruct->hpBefore[battler] > cutoff && gBattleMons[battler].hp <= cutoff;

        if (HadMoreThanHalfHpNowDoesnt
         && IsBattlerAlive(battler)
         && (CanBattlerSwitch(battler) || !(gBattleTypeFlags & BATTLE_TYPE_TRAINER))
         && !(gBattleTypeFlags & BATTLE_TYPE_ARENA)
         && CountUsablePartyMons(battler) > 0
         && !(gStatuses3[battler] & STATUS3_SKY_DROPPED)) // Not currently held by Sky Drop
        {
            gBattlerAbility = battler;
            gLastUsedAbility = ability;

            if (gBattleTypeFlags & BATTLE_TYPE_TRAINER || IsOnPlayerSide(battler))
                BattleScriptExecute(BattleScript_EmergencyExitEnd2);
            else
                BattleScriptExecute(BattleScript_EmergencyExitWildEnd2);

            effect = TRUE;
        }
    }

    return effect;
}

static bool32 HandleEndTurnAffection(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

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
static bool32 HandleEndTurnFutureSight(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if (gWishFutureKnock.futureSightCounter[battler] == gBattleTurnCounter)
    {
        if (gWishFutureKnock.futureSightCounter[battler] == gBattleTurnCounter
         && gWishFutureKnock.futureSightCounter[BATTLE_PARTNER(battler)] <= gBattleTurnCounter)
        {
            gSideStatuses[GetBattlerSide(battler)] &= ~SIDE_STATUS_FUTUREATTACK;
        }

        if (!IsBattlerAlive(battler))
            return effect;

        if (gWishFutureKnock.futureSightMove[battler] == MOVE_FUTURE_SIGHT)
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_FUTURE_SIGHT;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_DOOM_DESIRE;

        PREPARE_MOVE_BUFFER(gBattleTextBuff1, gWishFutureKnock.futureSightMove[battler]);

        gBattlerTarget = battler;
        gBattlerAttacker = gWishFutureKnock.futureSightBattlerIndex[battler];
        gCurrentMove = gWishFutureKnock.futureSightMove[battler];

        if (!IsFutureSightAttackerInParty(gBattlerAttacker, gBattlerTarget, gCurrentMove))
            SetTypeBeforeUsingMove(gCurrentMove, gBattlerAttacker);

        BattleScriptExecute(BattleScript_MonTookFutureAttack);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnWish(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if (gWishFutureKnock.wishCounter[battler] == gBattleTurnCounter && IsBattlerAlive(battler))
    {
        gBattlerTarget = battler;
        PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff1, battler, gWishFutureKnock.wishPartyId[battler])
        if (B_WISH_HP_SOURCE >= GEN_5)
        {
            if (IsOnPlayerSide(battler))
                gBattleStruct->moveDamage[battler] = max(1, GetMonData(&gPlayerParty[gWishFutureKnock.wishPartyId[battler]], MON_DATA_MAX_HP) / 2);
            else
                gBattleStruct->moveDamage[battler] = max(1, GetMonData(&gEnemyParty[gWishFutureKnock.wishPartyId[battler]], MON_DATA_MAX_HP) / 2);
        }
        else
        {
            gBattleStruct->moveDamage[battler] = max(1, GetNonDynamaxMaxHP(battler) / 2);
        }

        gBattleStruct->moveDamage[battler] *= -1;
        if (gStatuses3[battler] & STATUS3_HEAL_BLOCK)
            BattleScriptExecute(BattleScript_WishButHealBlocked);
        else if (gBattleMons[battler].hp == gBattleMons[battler].maxHP)
            BattleScriptExecute(BattleScript_WishButFullHp);
        else
            BattleScriptExecute(BattleScript_WishComesTrue);

        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnFirstEventBlock(u32 battler)
{
    bool32 effect = FALSE;

    u32 side;

    switch (gBattleStruct->eventBlockCounter)
    {
    case FIRST_EVENT_BLOCK_GMAX_MOVE_RESIDUAL: // TODO: Has to be split into 3 statuses and needs a queue
        side = GetBattlerSide(battler);
        if (gSideStatuses[side] & SIDE_STATUS_DAMAGE_NON_TYPES)
        {
            if (IsBattlerAlive(battler)
             && !IS_BATTLER_OF_TYPE(battler, gSideTimers[side].damageNonTypesType)
             && !IsBattlerProtectedByMagicGuard(battler, GetBattlerAbility(battler)))
            {
                gBattlerAttacker = battler;
                gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 6;
                ChooseDamageNonTypesString(gSideTimers[side].damageNonTypesType);
                BattleScriptExecute(BattleScript_DamageNonTypesContinues);
                effect = TRUE;
            }
        }
        gBattleStruct->eventBlockCounter++;
        break;
    case FIRST_EVENT_BLOCK_SEA_OF_FIRE_DAMAGE:
        if (gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_SEA_OF_FIRE && IsBattlerAlive(battler))
        {
            gBattlerAttacker = battler;
            gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 8;
            BtlController_EmitStatusAnimation(battler, B_COMM_TO_CONTROLLER, FALSE, STATUS1_BURN);
            MarkBattlerForControllerExec(battler);
            BattleScriptExecute(BattleScript_HurtByTheSeaOfFire);
            effect = TRUE;
        }
        gBattleStruct->eventBlockCounter++;
        break;
    case FIRST_EVENT_BLOCK_THRASH:
        if (gBattleMons[battler].status2 & STATUS2_LOCK_CONFUSE && !(gStatuses3[battler] & STATUS3_SKY_DROPPED))
        {
            gBattleMons[battler].status2 -= STATUS2_LOCK_CONFUSE_TURN(1);
            if (WasUnableToUseMove(battler))
            {
                CancelMultiTurnMoves(battler, SKY_DROP_IGNORE);
            }
            else if (!(gBattleMons[battler].status2 & STATUS2_LOCK_CONFUSE) && (gBattleMons[battler].status2 & STATUS2_MULTIPLETURNS))
            {
                gBattleMons[battler].status2 &= ~STATUS2_MULTIPLETURNS;
                if (!(gBattleMons[battler].status2 & STATUS2_CONFUSION))
                {
                    gBattleScripting.moveEffect = MOVE_EFFECT_CONFUSION | MOVE_EFFECT_AFFECTS_USER;
                    SetMoveEffect(TRUE, FALSE);
                    if (gBattleMons[battler].status2 & STATUS2_CONFUSION)
                        BattleScriptExecute(BattleScript_ThrashConfuses);
                    effect = TRUE;
                }
            }
        }
        gBattleStruct->eventBlockCounter++;
        break;
    case FIRST_EVENT_BLOCK_GRASSY_TERRAIN_HEAL:
        if (gFieldStatuses & STATUS_FIELD_GRASSY_TERRAIN && IsBattlerAlive(battler) && !IsBattlerAtMaxHp(battler))
        {
            gBattlerAttacker = battler;
            gBattleStruct->moveDamage[battler] = -(GetNonDynamaxMaxHP(battler) / 16);
            BattleScriptExecute(BattleScript_GrassyTerrainHeals);
            effect = TRUE;
        }
        gBattleStruct->eventBlockCounter++;
        break;
    case FIRST_EVENT_BLOCK_ABILITIES:
    {
        u32 ability = GetBattlerAbility(battler);
        switch (ability)
        {
        case ABILITY_HEALER:
        case ABILITY_HYDRATION:
        case ABILITY_SHED_SKIN:
            if (AbilityBattleEffects(ABILITYEFFECT_ENDTURN, battler, ability, 0, MOVE_NONE))
                effect = TRUE;
            break;
        }
        gBattleStruct->eventBlockCounter++;
        break;
    }
    case FIRST_EVENT_BLOCK_HEAL_ITEMS:
    {
        enum ItemHoldEffect holdEffect = GetBattlerHoldEffect(battler, TRUE);
        switch (holdEffect)
        {
        case HOLD_EFFECT_LEFTOVERS:
        case HOLD_EFFECT_BLACK_SLUDGE:
            if (ItemBattleEffects(ITEMEFFECT_NORMAL, battler, FALSE))
                effect = TRUE;
            break;
        default:
            break;
        }
        gBattleStruct->eventBlockCounter = 0;
        gBattleStruct->turnEffectsBattlerId++;
        break;
    }
    }

    return effect;
}

static bool32 HandleEndTurnAquaRing(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if (gStatuses3[battler] & STATUS3_AQUA_RING
     && !(gStatuses3[battler] & STATUS3_HEAL_BLOCK)
     && !IsBattlerAtMaxHp(battler)
     && IsBattlerAlive(battler))
    {
        gBattleStruct->moveDamage[battler] = GetDrainedBigRootHp(battler, GetNonDynamaxMaxHP(battler) / 16);
        BattleScriptExecute(BattleScript_AquaRingHeal);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnIngrain(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if (gStatuses3[battler] & STATUS3_ROOTED
     && !(gStatuses3[battler] & STATUS3_HEAL_BLOCK)
     && !IsBattlerAtMaxHp(battler)
     && IsBattlerAlive(battler))
    {
        gBattleStruct->moveDamage[battler] = GetDrainedBigRootHp(battler, GetNonDynamaxMaxHP(battler) / 16);
        BattleScriptExecute(BattleScript_IngrainTurnHeal);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnLeechSeed(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if (gStatuses3[battler] & STATUS3_LEECHSEED
     && IsBattlerAlive(gStatuses3[battler] & STATUS3_LEECHSEED_BATTLER)
     && IsBattlerAlive(battler)
     && !IsBattlerProtectedByMagicGuard(battler, GetBattlerAbility(battler)))
    {
        gBattlerTarget = gStatuses3[battler] & STATUS3_LEECHSEED_BATTLER; // Notice gBattlerTarget is actually the HP receiver.
        gBattleScripting.animArg1 = gBattlerTarget;
        gBattleScripting.animArg2 = gBattlerAttacker;
        gBattleStruct->moveDamage[gBattlerAttacker] = max(1, GetNonDynamaxMaxHP(battler) / 8);
        gBattleStruct->moveDamage[gBattlerTarget] = GetDrainedBigRootHp(gBattlerTarget, gBattleStruct->moveDamage[gBattlerAttacker]);
        gHitMarker |= HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_PASSIVE_DAMAGE;
        if (GetBattlerAbility(battler) == ABILITY_LIQUID_OOZE)
        {
            gBattleStruct->moveDamage[gBattlerTarget] = gBattleStruct->moveDamage[gBattlerTarget] * -1;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_LEECH_SEED_OOZE;
            BattleScriptExecute(BattleScript_LeechSeedTurnDrainLiquidOoze);
        }
        else if (gStatuses3[gBattlerTarget] & STATUS3_HEAL_BLOCK)
        {
            BattleScriptExecute(BattleScript_LeechSeedTurnDrainHealBlock);
        }
        else
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_LEECH_SEED_DRAIN;
            BattleScriptExecute(BattleScript_LeechSeedTurnDrainRecovery);
        }
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnPoison(u32 battler)
{
    bool32 effect = FALSE;

    u32 ability = GetBattlerAbility(battler);

    gBattleStruct->turnEffectsBattlerId++;

    if ((gBattleMons[battler].status1 & STATUS1_POISON || gBattleMons[battler].status1 & STATUS1_TOXIC_POISON)
     && IsBattlerAlive(battler)
     && !IsBattlerProtectedByMagicGuard(battler, ability))
    {
        if (ability == ABILITY_POISON_HEAL)
        {
            if (!IsBattlerAtMaxHp(battler) && !(gStatuses3[battler] & STATUS3_HEAL_BLOCK))
            {
                gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 8;
                if (gBattleStruct->moveDamage[battler] == 0)
                    gBattleStruct->moveDamage[battler] = 1;
                gBattleStruct->moveDamage[battler] *= -1;
                BattleScriptExecute(BattleScript_PoisonHealActivates);
                effect = TRUE;
            }
        }
        else if (gBattleMons[battler].status1 & STATUS1_TOXIC_POISON)
        {
            gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 16;
            if (gBattleStruct->moveDamage[battler] == 0)
                gBattleStruct->moveDamage[battler] = 1;
            if ((gBattleMons[battler].status1 & STATUS1_TOXIC_COUNTER) != STATUS1_TOXIC_TURN(15)) // not 16 turns
                gBattleMons[battler].status1 += STATUS1_TOXIC_TURN(1);
            gBattleStruct->moveDamage[battler] *= (gBattleMons[battler].status1 & STATUS1_TOXIC_COUNTER) >> 8;
            BattleScriptExecute(BattleScript_PoisonTurnDmg);
            effect = TRUE;
        }
        else
        {
            gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 8;
            if (gBattleStruct->moveDamage[battler] == 0)
                gBattleStruct->moveDamage[battler] = 1;
            BattleScriptExecute(BattleScript_PoisonTurnDmg);
            effect = TRUE;
        }
    }

    return effect;
}

static bool32 HandleEndTurnBurn(u32 battler)
{
    bool32 effect = FALSE;

    u32 ability = GetBattlerAbility(battler);

    gBattleStruct->turnEffectsBattlerId++;

    if (gBattleMons[battler].status1 & STATUS1_BURN
     && IsBattlerAlive(battler)
     && !IsBattlerProtectedByMagicGuard(battler, ability))
    {
        gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / (B_BURN_DAMAGE >= GEN_7 ? 16 : 8);
        if (ability == ABILITY_HEATPROOF)
        {
            if (gBattleStruct->moveDamage[battler] > (gBattleStruct->moveDamage[battler] / 2) + 1) // Record ability if the burn takes less damage than it normally would.
                RecordAbilityBattle(battler, ABILITY_HEATPROOF);
            gBattleStruct->moveDamage[battler] /= 2;
        }
        if (gBattleStruct->moveDamage[battler] == 0)
            gBattleStruct->moveDamage[battler] = 1;
        BattleScriptExecute(BattleScript_BurnTurnDmg);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnFrostbite(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if (gBattleMons[battler].status1 & STATUS1_FROSTBITE
     && IsBattlerAlive(battler)
     && !IsBattlerProtectedByMagicGuard(battler, GetBattlerAbility(battler)))
    {
        gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / (B_BURN_DAMAGE >= GEN_7 ? 16 : 8);
        if (gBattleStruct->moveDamage[battler] == 0)
            gBattleStruct->moveDamage[battler] = 1;
        BattleScriptExecute(BattleScript_FrostbiteTurnDmg);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnNightmare(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if (gBattleMons[battler].status2 & STATUS2_NIGHTMARE
     && IsBattlerAlive(battler)
     && !IsBattlerProtectedByMagicGuard(battler, GetBattlerAbility(battler)))
    {
        if (gBattleMons[battler].status1 & STATUS1_SLEEP)
        {
            gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 4;
            if (gBattleStruct->moveDamage[battler] == 0)
                gBattleStruct->moveDamage[battler] = 1;
            BattleScriptExecute(BattleScript_NightmareTurnDmg);
            effect = TRUE;
        }
        else
        {
            gBattleMons[battler].status2 &= ~STATUS2_NIGHTMARE;
        }
    }

    return effect;
}

static bool32 HandleEndTurnCurse(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if (gBattleMons[battler].status2 & STATUS2_CURSED
     && IsBattlerAlive(battler)
     && !IsBattlerProtectedByMagicGuard(battler, GetBattlerAbility(battler)))
    {
        gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 4;
        if (gBattleStruct->moveDamage[battler] == 0)
            gBattleStruct->moveDamage[battler] = 1;
        BattleScriptExecute(BattleScript_CurseTurnDmg);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnWrap(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if (gBattleMons[battler].status2 & STATUS2_WRAPPED && IsBattlerAlive(battler))
    {
        if (--gDisableStructs[battler].wrapTurns != 0)
        {
            if (IsBattlerProtectedByMagicGuard(battler, GetBattlerAbility(battler)))
                return effect;

            gBattleScripting.animArg1 = gBattleStruct->wrappedMove[battler];
            gBattleScripting.animArg2 = gBattleStruct->wrappedMove[battler] >> 8;
            PREPARE_MOVE_BUFFER(gBattleTextBuff1, gBattleStruct->wrappedMove[battler]);
            BattleScriptExecute(BattleScript_WrapTurnDmg);
            if (GetBattlerHoldEffect(gBattleStruct->wrappedBy[battler], TRUE) == HOLD_EFFECT_BINDING_BAND)
                gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / (B_BINDING_DAMAGE >= GEN_6 ? 6 : 8);
            else
                gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / (B_BINDING_DAMAGE >= GEN_6 ? 8 : 16);

            if (gBattleStruct->moveDamage[battler] == 0)
                gBattleStruct->moveDamage[battler] = 1;
        }
        else  // broke free
        {
            gBattleMons[battler].status2 &= ~STATUS2_WRAPPED;
            PREPARE_MOVE_BUFFER(gBattleTextBuff1, gBattleStruct->wrappedMove[battler]);
            BattleScriptExecute(BattleScript_WrapEnds);
        }
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnSaltCure(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if (gStatuses4[battler] & STATUS4_SALT_CURE
     && IsBattlerAlive(battler)
     && !IsBattlerProtectedByMagicGuard(battler, GetBattlerAbility(battler)))
    {
        if (IS_BATTLER_ANY_TYPE(battler, TYPE_STEEL, TYPE_WATER))
            gBattleStruct->moveDamage[battler] = gBattleMons[battler].maxHP / 4;
        else
            gBattleStruct->moveDamage[battler] = gBattleMons[battler].maxHP / 8;
        if (gBattleStruct->moveDamage[battler] == 0)
            gBattleStruct->moveDamage[battler] = 1;
        PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_SALT_CURE);
        BattleScriptExecute(BattleScript_SaltCureExtraDamage);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnOctolock(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if (gDisableStructs[battler].octolock)
    {
        gBattlerTarget = battler;
        gBattlerAttacker = gDisableStructs[battler].battlerPreventingEscape;
        BattleScriptExecute(BattleScript_OctolockEndTurn);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnSyrupBomb(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if ((gStatuses4[battler] & STATUS4_SYRUP_BOMB) && (IsBattlerAlive(battler)))
    {
        if (gDisableStructs[battler].syrupBombTimer > 0 && --gDisableStructs[battler].syrupBombTimer == 0)
            gStatuses4[battler] &= ~STATUS4_SYRUP_BOMB;
        PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_SYRUP_BOMB);
        gBattlescriptCurrInstr = BattleScript_SyrupBombEndTurn;
        BattleScriptExecute(gBattlescriptCurrInstr);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnTaunt(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if (gDisableStructs[battler].tauntTimer && --gDisableStructs[battler].tauntTimer == 0)
    {
        BattleScriptExecute(BattleScript_BufferEndTurn);
        PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_TAUNT);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnTorment(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if (gDisableStructs[battler].tormentTimer == gBattleTurnCounter)
    {
        gBattleMons[battler].status2 &= ~STATUS2_TORMENT;
        BattleScriptExecute(BattleScript_TormentEnds);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnEncore(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if (gDisableStructs[battler].encoreTimer != 0)
    {
        if (gBattleMons[battler].moves[gDisableStructs[battler].encoredMovePos] != gDisableStructs[battler].encoredMove)  // Pokémon does not have the encored move anymore
        {
            gDisableStructs[battler].encoredMove = 0;
            gDisableStructs[battler].encoreTimer = 0;
        }
        else if (--gDisableStructs[battler].encoreTimer == 0
         || gBattleMons[battler].pp[gDisableStructs[battler].encoredMovePos] == 0)
        {
            gDisableStructs[battler].encoredMove = 0;
            gDisableStructs[battler].encoreTimer = 0;
            BattleScriptExecute(BattleScript_EncoredNoMore);
            effect = TRUE;
        }
    }

    return effect;
}

static bool32 HandleEndTurnDisable(u32 battler)
{
    bool32 effect = FALSE;

    u32 moveIndex = 0;
    gBattleStruct->turnEffectsBattlerId++;

    if (gDisableStructs[battler].disableTimer != 0)
    {
        for (moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
        {
            if (gDisableStructs[battler].disabledMove == gBattleMons[battler].moves[moveIndex])
                break;
        }
        if (moveIndex == MAX_MON_MOVES)  // Pokémon does not have the disabled move anymore
        {
            gDisableStructs[battler].disabledMove = 0;
            gDisableStructs[battler].disableTimer = 0;
        }
        else if (--gDisableStructs[battler].disableTimer == 0)  // disable ends
        {
            gDisableStructs[battler].disabledMove = 0;
            BattleScriptExecute(BattleScript_DisabledNoMore);
            effect = TRUE;
        }
    }

    return effect;
}

static bool32 HandleEndTurnMagnetRise(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if (gStatuses3[battler] & STATUS3_MAGNET_RISE && gDisableStructs[battler].magnetRiseTimer == gBattleTurnCounter)
    {
        gStatuses3[battler] &= ~STATUS3_MAGNET_RISE;
        BattleScriptExecute(BattleScript_BufferEndTurn);
        PREPARE_STRING_BUFFER(gBattleTextBuff1, STRINGID_ELECTROMAGNETISM);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnTelekinesis(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if (gStatuses3[battler] & STATUS3_TELEKINESIS && gDisableStructs[battler].telekinesisTimer == gBattleTurnCounter)
    {
        gStatuses3[battler] &= ~STATUS3_TELEKINESIS;
        BattleScriptExecute(BattleScript_TelekinesisEndTurn);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnHealBlock(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if (gStatuses3[battler] & STATUS3_HEAL_BLOCK && gDisableStructs[battler].healBlockTimer == gBattleTurnCounter)
    {
        gStatuses3[battler] &= ~STATUS3_HEAL_BLOCK;
        BattleScriptExecute(BattleScript_BufferEndTurn);
        PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_HEAL_BLOCK);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnEmbargo(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if (gStatuses3[battler] & STATUS3_EMBARGO && gDisableStructs[battler].embargoTimer == gBattleTurnCounter)
    {
        gStatuses3[battler] &= ~STATUS3_EMBARGO;
        BattleScriptExecute(BattleScript_EmbargoEndTurn);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnYawn(u32 battler)
{
    bool32 effect = FALSE;

    u32 ability = GetBattlerAbility(battler);

    gBattleStruct->turnEffectsBattlerId++;

    if (gStatuses3[battler] & STATUS3_YAWN)
    {
        gStatuses3[battler] -= STATUS3_YAWN_TURN(1);
        if (!(gStatuses3[battler] & STATUS3_YAWN) && !(gBattleMons[battler].status1 & STATUS1_ANY)
         && ability != ABILITY_VITAL_SPIRIT
         && ability != ABILITY_INSOMNIA
         && !UproarWakeUpCheck(battler)
         && !IsLeafGuardProtected(battler, ability))
        {
            CancelMultiTurnMoves(battler, SKY_DROP_STATUS_YAWN);
            gEffectBattler = gBattlerTarget = battler;
            if (IsBattlerTerrainAffected(battler, STATUS_FIELD_ELECTRIC_TERRAIN))
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAINPREVENTS_ELECTRIC;
                BattleScriptExecute(BattleScript_TerrainPreventsEnd2);
            }
            else if (IsBattlerTerrainAffected(battler, STATUS_FIELD_MISTY_TERRAIN))
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAINPREVENTS_MISTY;
                BattleScriptExecute(BattleScript_TerrainPreventsEnd2);
            }
            else if (IsSleepClauseActiveForSide(GetBattlerSide(battler)))
            {
                BattleScriptExecute(BattleScript_SleepClausePreventsEnd);
            }
            else
            {
                if (B_SLEEP_TURNS >= GEN_5)
                    gBattleMons[battler].status1 |= ((Random() % 3) + 2);
                else
                    gBattleMons[battler].status1 |= ((Random() % 4) + 3);

                TryActivateSleepClause(battler, gBattlerPartyIndexes[battler]);
                BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[battler].status1);
                MarkBattlerForControllerExec(battler);
                BattleScriptExecute(BattleScript_YawnMakesAsleep);
            }
            effect = TRUE;
        }
    }

    return effect;
}

static bool32 HandleEndTurnPerishSong(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if (IsBattlerAlive(battler) && gStatuses3[battler] & STATUS3_PERISH_SONG)
    {
        PREPARE_BYTE_NUMBER_BUFFER(gBattleTextBuff1, 1, gDisableStructs[battler].perishSongTimer);
        if (gDisableStructs[battler].perishSongTimer == 0)
        {
            gStatuses3[battler] &= ~STATUS3_PERISH_SONG;
            gBattleStruct->moveDamage[battler] = gBattleMons[battler].hp;
            BattleScriptExecute(BattleScript_PerishSongTakesLife);
        }
        else
        {
            gDisableStructs[battler].perishSongTimer--;
            BattleScriptExecute(BattleScript_PerishSongCountGoesDown);
        }
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnRoost(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if (gDisableStructs[battler].roostActive)
        gDisableStructs[battler].roostActive = FALSE;

    return effect;
}

static bool32 HandleEndTurnSecondEventBlock(u32 battler)
{
    bool32 effect = FALSE;

    u32 side = gBattleStruct->turnSideTracker;

    switch (gBattleStruct->eventBlockCounter)
    {
    case SECOND_EVENT_BLOCK_REFLECT:
        if (gSideStatuses[side] & SIDE_STATUS_REFLECT && gSideTimers[side].reflectTimer == gBattleTurnCounter)
        {
            gBattlerAttacker = GetBattlerSideForMessage(side);
            gSideStatuses[side] &= ~SIDE_STATUS_REFLECT;
            BattleScriptExecute(BattleScript_SideStatusWoreOff);
            gBattleCommunication[MULTISTRING_CHOOSER] = side;
            PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_REFLECT);
            effect = TRUE;
        }
        gBattleStruct->eventBlockCounter++;
        break;
    case SECOND_EVENT_BLOCK_LIGHT_SCREEN:
        if (gSideStatuses[side] & SIDE_STATUS_LIGHTSCREEN && gSideTimers[side].lightscreenTimer == gBattleTurnCounter)
        {
            gBattlerAttacker = GetBattlerSideForMessage(side);
            gSideStatuses[side] &= ~SIDE_STATUS_LIGHTSCREEN;
            BattleScriptExecute(BattleScript_SideStatusWoreOff);
            gBattleCommunication[MULTISTRING_CHOOSER] = side;
            PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_LIGHT_SCREEN);
            effect = TRUE;
        }
        gBattleStruct->eventBlockCounter++;
        break;
    case SECOND_EVENT_BLOCK_SAFEGUARD:
        if (gSideStatuses[side] & SIDE_STATUS_SAFEGUARD && gSideTimers[side].safeguardTimer == gBattleTurnCounter)
        {
            gBattlerAttacker = GetBattlerSideForMessage(side);
            gSideStatuses[side] &= ~SIDE_STATUS_SAFEGUARD;
            BattleScriptExecute(BattleScript_SafeguardEnds);
            effect = TRUE;
        }
        gBattleStruct->eventBlockCounter++;
        break;
    case SECOND_EVENT_BLOCK_MIST:
        if (gSideTimers[side].mistTimer != 0 && gSideTimers[side].mistTimer == gBattleTurnCounter)
        {
            gBattlerAttacker = GetBattlerSideForMessage(side);
            gSideStatuses[side] &= ~SIDE_STATUS_MIST;
            BattleScriptExecute(BattleScript_SideStatusWoreOff);
            gBattleCommunication[MULTISTRING_CHOOSER] = side;
            PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_MIST);
            effect = TRUE;
        }
        gBattleStruct->eventBlockCounter++;
        break;
    case SECOND_EVENT_BLOCK_TAILWIND:
        if (gSideStatuses[side] & SIDE_STATUS_TAILWIND && gSideTimers[side].tailwindTimer == gBattleTurnCounter)
        {
            gBattlerAttacker = GetBattlerSideForMessage(side);
            gSideStatuses[side] &= ~SIDE_STATUS_TAILWIND;
            BattleScriptExecute(BattleScript_TailwindEnds);
            effect = TRUE;
        }
        gBattleStruct->eventBlockCounter++;
        break;
    case SECOND_EVENT_BLOCK_LUCKY_CHANT:
        if (gSideStatuses[side] & SIDE_STATUS_LUCKY_CHANT && gSideTimers[side].luckyChantTimer == gBattleTurnCounter)
        {
            gBattlerAttacker = GetBattlerSideForMessage(side);
            gSideStatuses[side] &= ~SIDE_STATUS_LUCKY_CHANT;
            BattleScriptExecute(BattleScript_LuckyChantEnds);
            effect = TRUE;
        }
        gBattleStruct->eventBlockCounter++;
        break;
    case SECOND_EVENT_BLOCK_RAINBOW:
        gBattlerAttacker = GetBattlerSideForMessage(side);
        if (gSideStatuses[side] & SIDE_STATUS_RAINBOW && gSideTimers[side].rainbowTimer == gBattleTurnCounter)
        {
            gSideStatuses[side] &= ~SIDE_STATUS_RAINBOW;
            BattleScriptExecute(BattleScript_TheRainbowDisappeared);
            effect = TRUE;
        }
        gBattleStruct->eventBlockCounter++;
            break;
    case SECOND_EVENT_BLOCK_SEA_OF_FIRE:
        if (gSideStatuses[side] & SIDE_STATUS_SEA_OF_FIRE && gSideTimers[side].seaOfFireTimer == gBattleTurnCounter)
        {
            gSideStatuses[side] &= ~SIDE_STATUS_SEA_OF_FIRE;
            BattleScriptExecute(BattleScript_TheSeaOfFireDisappeared);
            effect = TRUE;
        }
        gBattleStruct->eventBlockCounter++;
        break;
    case SECOND_EVENT_BLOCK_SWAMP:
        gBattlerAttacker = GetBattlerSideForMessage(side);
        if (gSideStatuses[side] & SIDE_STATUS_SWAMP && gSideTimers[side].swampTimer == gBattleTurnCounter)
        {
            gSideStatuses[side] &= ~SIDE_STATUS_SWAMP;
            BattleScriptExecute(BattleScript_TheSwampDisappeared);
            effect = TRUE;
        }
        gBattleStruct->eventBlockCounter++;
        break;
    case SECOND_EVENT_BLOCK_AURORA_VEIL:
        if (gSideStatuses[side] & SIDE_STATUS_AURORA_VEIL && gSideTimers[side].auroraVeilTimer == gBattleTurnCounter)
        {
            gBattlerAttacker = GetBattlerSideForMessage(side);
            gSideStatuses[side] &= ~SIDE_STATUS_AURORA_VEIL;
            BattleScriptExecute(BattleScript_SideStatusWoreOff);
            gBattleCommunication[MULTISTRING_CHOOSER] = side;
            PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_AURORA_VEIL);
            effect = TRUE;
        }
        gBattleStruct->turnSideTracker++;
        gBattleStruct->eventBlockCounter = 0;
        break;
    }

    return effect;
}

static bool32 HandleEndTurnTrickRoom(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->endTurnEventsCounter++;

    if (gFieldStatuses & STATUS_FIELD_TRICK_ROOM && gFieldTimers.trickRoomTimer == gBattleTurnCounter)
    {
        gFieldStatuses &= ~STATUS_FIELD_TRICK_ROOM;
        BattleScriptExecute(BattleScript_TrickRoomEnds);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnGravity(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->endTurnEventsCounter++;

    if (gFieldStatuses & STATUS_FIELD_GRAVITY && gFieldTimers.gravityTimer == gBattleTurnCounter)
    {
        gFieldStatuses &= ~STATUS_FIELD_GRAVITY;
        BattleScriptExecute(BattleScript_GravityEnds);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnWaterSport(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->endTurnEventsCounter++;

    if (gFieldStatuses & STATUS_FIELD_WATERSPORT && gFieldTimers.waterSportTimer == gBattleTurnCounter)
    {
        gFieldStatuses &= ~STATUS_FIELD_WATERSPORT;
        BattleScriptExecute(BattleScript_WaterSportEnds);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnMudSport(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->endTurnEventsCounter++;

    if (gFieldStatuses & STATUS_FIELD_MUDSPORT && gFieldTimers.mudSportTimer == gBattleTurnCounter)
    {
        gFieldStatuses &= ~STATUS_FIELD_MUDSPORT;
        BattleScriptExecute(BattleScript_MudSportEnds);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnWonderRoom(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->endTurnEventsCounter++;

    if (gFieldStatuses & STATUS_FIELD_WONDER_ROOM && gFieldTimers.wonderRoomTimer == gBattleTurnCounter)
    {
        gFieldStatuses &= ~STATUS_FIELD_WONDER_ROOM;
        BattleScriptExecute(BattleScript_WonderRoomEnds);
        effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnMagicRoom(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->endTurnEventsCounter++;

    if (gFieldStatuses & STATUS_FIELD_MAGIC_ROOM && gFieldTimers.magicRoomTimer == gBattleTurnCounter)
    {
        gFieldStatuses &= ~STATUS_FIELD_MAGIC_ROOM;
        BattleScriptExecute(BattleScript_MagicRoomEnds);
        effect = TRUE;
    }

    return effect;
}

static bool32 EndTurnTerrain(u32 terrainFlag, u32 stringTableId)
{
    if (gFieldStatuses & terrainFlag && gFieldTimers.terrainTimer == gBattleTurnCounter)
    {
        gFieldStatuses &= ~terrainFlag;
        TryToRevertMimicryAndFlags();
        gBattleCommunication[MULTISTRING_CHOOSER] = stringTableId;
        BattleScriptExecute(BattleScript_TerrainEnds);
        return TRUE;
    }

    return FALSE;
}

static bool32 HandleEndTurnTerrain(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->endTurnEventsCounter++;

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

static bool32 HandleEndTurnThirdEventBlock(u32 battler)
{
    bool32 effect = FALSE;

    if (!IsBattlerAlive(battler))
    {
        gBattleStruct->turnEffectsBattlerId++;
        return effect;
    }

    switch (gBattleStruct->eventBlockCounter)
    {
    case THIRD_EVENT_BLOCK_UPROAR:
        if (gBattleMons[battler].status2 & STATUS2_UPROAR)
        {
            for (gBattlerAttacker = 0; gBattlerAttacker < gBattlersCount; gBattlerAttacker++)
            {
                if ((gBattleMons[gBattlerAttacker].status1 & STATUS1_SLEEP)
                && GetBattlerAbility(gBattlerAttacker) != ABILITY_SOUNDPROOF)
                {
                    gBattleMons[gBattlerAttacker].status1 &= ~STATUS1_SLEEP;
                    gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_NIGHTMARE;
                    gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                    BattleScriptExecute(BattleScript_MonWokeUpInUproar);
                    BtlController_EmitSetMonData(gBattlerAttacker, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gBattlerAttacker].status1);
                    MarkBattlerForControllerExec(gBattlerAttacker);
                    break;
                }
            }
            if (gBattlerAttacker != gBattlersCount)
            {
                break;
            }
            else
            {
                gBattlerAttacker = battler;
                gBattleMons[battler].status2 -= STATUS2_UPROAR_TURN(1);  // uproar timer goes down
                if (WasUnableToUseMove(battler))
                {
                    CancelMultiTurnMoves(battler, SKY_DROP_IGNORE);
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_UPROAR_ENDS;
                }
                else if (gBattleMons[battler].status2 & STATUS2_UPROAR)
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_UPROAR_CONTINUES;
                    gBattleMons[battler].status2 |= STATUS2_MULTIPLETURNS;
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
        gBattleStruct->eventBlockCounter++;
        break;
    case THIRD_EVENT_BLOCK_ABILITIES:
    {
        u32 ability = GetBattlerAbility(battler);
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
            if (AbilityBattleEffects(ABILITYEFFECT_ENDTURN, battler, ability, 0, MOVE_NONE))
                effect = TRUE;
            break;
        }
        gBattleStruct->eventBlockCounter++;
        break;
    }
    case THIRD_EVENT_BLOCK_ITEMS:
    {
        enum ItemHoldEffect holdEffect = GetBattlerHoldEffect(battler, TRUE);
        switch (holdEffect)
        {
        case HOLD_EFFECT_FLAME_ORB:
        case HOLD_EFFECT_STICKY_BARB:
        case HOLD_EFFECT_TOXIC_ORB:
            if (ItemBattleEffects(ITEMEFFECT_ORBS, battler, FALSE))
                effect = TRUE;
            break;
        case HOLD_EFFECT_WHITE_HERB:
            if (ItemBattleEffects(ITEMEFFECT_NORMAL, battler, FALSE))
                effect = TRUE;
            break;
        default:
            break;
        }
        gBattleStruct->eventBlockCounter = 0;
        gBattleStruct->turnEffectsBattlerId++;
        break;
    }
    }

    return effect;
}

static bool32 HandleEndTurnAbilities(u32 battler)
{
    bool32 effect = FALSE;

    u32 ability = GetBattlerAbility(battler);

    gBattleStruct->turnEffectsBattlerId++;

    switch (ability)
    {
    case ABILITY_POWER_CONSTRUCT:
    case ABILITY_SCHOOLING:
    case ABILITY_SHIELDS_DOWN:
    case ABILITY_ZEN_MODE:
        if (AbilityBattleEffects(ABILITYEFFECT_ENDTURN, battler, ability, 0, MOVE_NONE))
            effect = TRUE;
    }

    return effect;
}

static bool32 HandleEndTurnFourthEventBlock(u32 battler)
{
    bool32 effect = FALSE;

    switch (gBattleStruct->eventBlockCounter)
    {
    case FOURTH_EVENT_BLOCK_HUNGER_SWITCH:
    {
        u32 ability = GetBattlerAbility(battler);
        if (ability == ABILITY_HUNGER_SWITCH)
        {
            if (AbilityBattleEffects(ABILITYEFFECT_ENDTURN, battler, ability, 0, MOVE_NONE))
                effect = TRUE;
        }
        gBattleStruct->eventBlockCounter++;
        break;
    }
    case FOURTH_EVENT_BLOCK_EJECT_PACK:
    {
        enum ItemHoldEffect holdEffect = GetBattlerHoldEffect(battler, TRUE);
        if (holdEffect == HOLD_EFFECT_EJECT_PACK)
        {
            if (ItemBattleEffects(ITEMEFFECT_NORMAL, battler, FALSE))
                effect = TRUE;
        }
        gBattleStruct->eventBlockCounter = 0;
        gBattleStruct->turnEffectsBattlerId++;
        break;
    }
    }

    return effect;
}

static bool32 HandleEndTurnDynamax(u32 battler)
{
    bool32 effect = FALSE;

    gBattleStruct->turnEffectsBattlerId++;

    if (GetActiveGimmick(battler) == GIMMICK_DYNAMAX && gBattleStruct->dynamax.dynamaxTurns[battler] == gBattleTurnCounter)
    {
        gBattleScripting.battler = battler;
        UndoDynamax(battler);
        BattleScriptExecute(BattleScript_DynamaxEnds);
        effect = TRUE;
    }

    return effect;
}

static bool32 (*const sEndTurnEffectHandlers[])(u32 battler) =
{
    [ENDTURN_ORDER] = HandleEndTurnOrder,
    [ENDTURN_VARIOUS] = HandleEndTurnVarious,
    [ENDTURN_WEATHER] = HandleEndTurnWeather,
    [ENDTURN_WEATHER_DAMAGE] = HandleEndTurnWeatherDamage,
    [ENDTURN_GEN_3_BERRY_ACTIVATION] = HandleEndTurnGenThreeBerryActivation,
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
    [ENDTURN_ABILITIES] = HandleEndTurnAbilities,
    [ENDTURN_FOURTH_EVENT_BLOCK] = HandleEndTurnFourthEventBlock,
    [ENDTURN_DYNAMAX] = HandleEndTurnDynamax,
};

u32 DoEndTurnEffects(void)
{
    u32 battler = MAX_BATTLERS_COUNT;
    gHitMarker |= (HITMARKER_GRUDGE | HITMARKER_IGNORE_BIDE);

    for (;;)
    {
        // If either turnEffectsBattlerId or turnSideTracker are at max count, reest values and go to the next state
        if (gBattleStruct->turnEffectsBattlerId == gBattlersCount || gBattleStruct->turnSideTracker == NUM_BATTLE_SIDES)
        {
            gBattleStruct->turnEffectsBattlerId = 0;
            gBattleStruct->turnSideTracker = 0;
            gBattleStruct->eventBlockCounter = 0;
            gBattleStruct->endTurnEventsCounter++;
        }

        // Jump out if possible after endTurnEventsCounter was increased in the above code block
        if (gBattleStruct->endTurnEventsCounter == ENDTURN_COUNT)
        {
            gHitMarker &= ~(HITMARKER_GRUDGE | HITMARKER_IGNORE_BIDE);
            return FALSE;
        }

        battler = gBattlerAttacker = gBattlerByTurnOrder[gBattleStruct->turnEffectsBattlerId];

        if (sEndTurnEffectHandlers[gBattleStruct->endTurnEventsCounter](battler))
            return TRUE;
    }
}
