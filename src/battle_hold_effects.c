#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_ai_util.h" // maybe move some stuff over to battle.h
#include "battle_controllers.h"
#include "battle_util.h"
#include "battle_hold_effects.h"
#include "battle_scripts.h"
#include "item.h"
#include "string_util.h"
#include "data/hold_effects.h"
#include "constants/berry.h"

bool32 IsOnSwitchInActivation(enum HoldEffect holdEffect)          { return gHoldEffectsInfo[holdEffect].onSwitchIn; }
bool32 IsOnSwitchInFirstTurnActivation(enum HoldEffect holdEffect) { return gHoldEffectsInfo[holdEffect].onSwitchInFirstTurn; }
bool32 IsMirrorHerbActivation(enum HoldEffect holdEffect)          { return gHoldEffectsInfo[holdEffect].mirrorHerb; }
bool32 IsMirrorHerbFirstTurnActivation(enum HoldEffect holdEffect) { return gHoldEffectsInfo[holdEffect].mirrorHerbFirstTurn; }
bool32 IsWhiteHerbActivation(enum HoldEffect holdEffect)           { return gHoldEffectsInfo[holdEffect].whiteHerb; }
bool32 IsWhiteHerbFirstTurnActivation(enum HoldEffect holdEffect)  { return gHoldEffectsInfo[holdEffect].whiteHerbFirstTurn; }
bool32 IsWhiteHerbEndTurnActivation(enum HoldEffect holdEffect)    { return gHoldEffectsInfo[holdEffect].whiteHerbEndTurn; }
bool32 IsOnStatusChangeActivation(enum HoldEffect holdEffect)      { return gHoldEffectsInfo[holdEffect].onStatusChange; }
bool32 IsOnHpThresholdActivation(enum HoldEffect holdEffect)       { return gHoldEffectsInfo[holdEffect].onHpThreshold; }
bool32 IsKeeMarangaBerryActivation(enum HoldEffect holdEffect)     { return gHoldEffectsInfo[holdEffect].keeMarangaBerry; }
bool32 IsOnTargetHitActivation(enum HoldEffect holdEffect)         { return gHoldEffectsInfo[holdEffect].onTargetAfterHit; }
bool32 IsOnAttackerAfterHitActivation(enum HoldEffect holdEffect)  { return gHoldEffectsInfo[holdEffect].onAttackerAfterHit; }
bool32 IsLifeOrbShellBellActivation(enum HoldEffect holdEffect)    { return gHoldEffectsInfo[holdEffect].lifeOrbShellBell; }
bool32 IsLeftoversActivation(enum HoldEffect holdEffect)           { return gHoldEffectsInfo[holdEffect].leftovers; }
bool32 IsOrbsActivation(enum HoldEffect holdEffect)                { return gHoldEffectsInfo[holdEffect].orbs; }
bool32 IsOnEffectActivation(enum HoldEffect holdEffect)            { return gHoldEffectsInfo[holdEffect].onEffect; }
bool32 IsOnBerryActivation(enum HoldEffect holdEffect)             { return GetItemPocket(gLastUsedItem) == POCKET_BERRIES; }
bool32 IsOnFlingActivation(enum HoldEffect holdEffect)             { return gHoldEffectsInfo[holdEffect].onFling; }

bool32 IsForceTriggerItemActivation(enum HoldEffect holdEffect)
{
    return gHoldEffectsInfo[holdEffect].onSwitchIn
        || gHoldEffectsInfo[holdEffect].whiteHerb
        || gHoldEffectsInfo[holdEffect].onStatusChange
        || gHoldEffectsInfo[holdEffect].onHpThreshold;
}

static enum ItemEffect TryDoublePrize(u32 battler)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (IsOnPlayerSide(battler) && !gBattleStruct->moneyMultiplierItem)
    {
        gBattleStruct->moneyMultiplier *= 2;
        gBattleStruct->moneyMultiplierItem = TRUE;
    }

    return effect;
}

enum ItemEffect TryBoosterEnergy(u32 battler, enum Ability ability, ActivationTiming timing)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (gDisableStructs[battler].boosterEnergyActivated || gBattleMons[battler].volatiles.transformed)
        return ITEM_NO_EFFECT;

    if (((ability == ABILITY_PROTOSYNTHESIS) && !((gBattleWeather & B_WEATHER_SUN) && HasWeatherEffect()))
     || ((ability == ABILITY_QUARK_DRIVE) && !(gFieldStatuses & STATUS_FIELD_ELECTRIC_TERRAIN)))
    {
        PREPARE_STAT_BUFFER(gBattleTextBuff1, GetHighestStatId(battler));
        gBattlerAbility = gBattleScripting.battler = battler;
        gDisableStructs[battler].boosterEnergyActivated = TRUE;
        RecordAbilityBattle(battler, ability);
        if (timing == IsOnSwitchInFirstTurnActivation)
            BattleScriptExecute(BattleScript_BoosterEnergyEnd2);
        else
            BattleScriptCall(BattleScript_BoosterEnergyRet);
        effect = ITEM_EFFECT_OTHER;
    }

    return effect;
}

static enum ItemEffect TryRoomService(u32 battler, ActivationTiming timing)
{
    if (gFieldStatuses & STATUS_FIELD_TRICK_ROOM && CompareStat(battler, STAT_SPEED, MIN_STAT_STAGE, CMP_GREATER_THAN, GetBattlerAbility(battler)))
    {
        gEffectBattler = gBattleScripting.battler = battler;
        SET_STATCHANGER(STAT_SPEED, 1, TRUE);
        gBattleScripting.animArg1 = STAT_ANIM_PLUS1 + STAT_SPEED;
        gBattleScripting.animArg2 = 0;

        if (timing == IsOnSwitchInFirstTurnActivation)
            BattleScriptExecute(BattleScript_ConsumableStatRaiseEnd2);
        else
            BattleScriptCall(BattleScript_ConsumableStatRaiseRet);

        return ITEM_STATS_CHANGE;
    }

    return ITEM_NO_EFFECT;
}

enum ItemEffect TryHandleSeed(u32 battler, u32 terrainFlag, enum Stat statId, ActivationTiming timing)
{
    if (gFieldStatuses & terrainFlag && CompareStat(battler, statId, MAX_STAT_STAGE, CMP_LESS_THAN, GetBattlerAbility(battler)))
    {
        gEffectBattler = gBattleScripting.battler = battler;
        SET_STATCHANGER(statId, 1, FALSE);
        gBattleScripting.animArg1 = STAT_ANIM_PLUS1 + statId;
        gBattleScripting.animArg2 = 0;
        if (timing == IsOnSwitchInFirstTurnActivation)
            BattleScriptExecute(BattleScript_ConsumableStatRaiseEnd2);
        else
            BattleScriptCall(BattleScript_ConsumableStatRaiseRet);
        return ITEM_STATS_CHANGE;
    }
    return ITEM_NO_EFFECT;
}

static enum ItemEffect TryTerrainSeeds(u32 battler, u32 item, ActivationTiming timing)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    switch (GetItemHoldEffectParam(item))
    {
    case HOLD_EFFECT_PARAM_ELECTRIC_TERRAIN:
        effect = TryHandleSeed(battler, STATUS_FIELD_ELECTRIC_TERRAIN, STAT_DEF, timing);
        break;
    case HOLD_EFFECT_PARAM_GRASSY_TERRAIN:
        effect = TryHandleSeed(battler, STATUS_FIELD_GRASSY_TERRAIN, STAT_DEF, timing);
        break;
    case HOLD_EFFECT_PARAM_MISTY_TERRAIN:
        effect = TryHandleSeed(battler, STATUS_FIELD_MISTY_TERRAIN, STAT_SPDEF, timing);
        break;
    case HOLD_EFFECT_PARAM_PSYCHIC_TERRAIN:
        effect = TryHandleSeed(battler, STATUS_FIELD_PSYCHIC_TERRAIN, STAT_SPDEF, timing);
        break;
    }

    return effect;
}

static bool32 CanBeInfinitelyConfused(u32 battler)
{
    enum Ability ability = GetBattlerAbility(battler);
    if  (ability == ABILITY_OWN_TEMPO
      || IsBattlerTerrainAffected(battler, ability, GetBattlerHoldEffect(battler), STATUS_FIELD_MISTY_TERRAIN)
      || gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_SAFEGUARD)
        return FALSE;
    return TRUE;
}

static enum ItemEffect TryBerserkGene(u32 battler, ActivationTiming timing)
{
    if (CanBeInfinitelyConfused(battler))
        gBattleMons[battler].volatiles.infiniteConfusion = TRUE;

    SET_STATCHANGER(STAT_ATK, 2, FALSE);
    gBattleScripting.animArg1 = STAT_ANIM_PLUS1 + STAT_ATK;
    gBattleScripting.animArg2 = 0;
    if (timing == IsOnSwitchInFirstTurnActivation)
        BattleScriptExecute(BattleScript_BerserkGeneRetEnd2);
    else
        BattleScriptCall(BattleScript_BerserkGeneRet);

    return ITEM_STATS_CHANGE;
}

static enum ItemEffect RestoreWhiteHerbStats(u32 battler, ActivationTiming timing)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    for (u32 i = 0; i < NUM_BATTLE_STATS; i++)
    {
        if (gBattleMons[battler].statStages[i] < DEFAULT_STAT_STAGE)
        {
            gBattleMons[battler].statStages[i] = DEFAULT_STAT_STAGE;
            effect = ITEM_STATS_CHANGE;
        }
    }
    if (effect != ITEM_NO_EFFECT)
    {
        if (timing == IsWhiteHerbActivation || timing == IsOnFlingActivation)
            BattleScriptCall(BattleScript_WhiteHerbRet);
        else
            BattleScriptExecute(BattleScript_WhiteHerbEnd2);
    }

    return effect;
}

static enum ItemEffect TryConsumeMirrorHerb(u32 battler, ActivationTiming timing)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (gProtectStructs[battler].eatMirrorHerb)
    {
        gProtectStructs[battler].eatMirrorHerb = 0;
        ChooseStatBoostAnimation(battler);
        if (timing == IsMirrorHerbFirstTurnActivation)
            BattleScriptExecute(BattleScript_MirrorHerbCopyStatChangeEnd2);
        else
            BattleScriptCall(BattleScript_MirrorHerbCopyStatChange);
        effect = ITEM_STATS_CHANGE;
    }

    return effect;
}

static enum ItemEffect TryKingsRock(u32 battlerAtk, u32 battlerDef, u32 item)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;
    enum Ability ability = GetBattlerAbility(battlerAtk);
    u32 holdEffectParam = GetItemHoldEffectParam(item);

    if (B_SERENE_GRACE_BOOST >= GEN_5 && ability == ABILITY_SERENE_GRACE)
        holdEffectParam *= 2;
    if (gSideStatuses[GetBattlerSide(battlerAtk)] & SIDE_STATUS_RAINBOW && gCurrentMove != MOVE_SECRET_POWER)
        holdEffectParam *= 2;
    if (IsBattlerTurnDamaged(battlerDef)
     && !MoveIgnoresKingsRock(gCurrentMove)
     && IsBattlerAlive(battlerDef)
     && RandomPercentage(RNG_HOLD_EFFECT_FLINCH, holdEffectParam)
     && ability != ABILITY_STENCH)
    {
        SetMoveEffect(battlerAtk, battlerDef, MOVE_EFFECT_FLINCH, gBattlescriptCurrInstr, NO_FLAGS);
        effect = ITEM_EFFECT_OTHER;
    }

    return effect;
}

static enum ItemEffect TryAirBalloon(u32 battler, ActivationTiming timing)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (timing == IsOnTargetHitActivation)
    {
        if (IsBattlerTurnDamaged(battler))
        {
            BattleScriptCall(BattleScript_AirBalloonMsgPop);
            effect = ITEM_EFFECT_OTHER;
        }
    }
    else if (!gSpecialStatuses[battler].switchInItemDone)
    {
        gSpecialStatuses[battler].switchInItemDone = TRUE;
        if (timing == IsOnSwitchInFirstTurnActivation)
            BattleScriptPushCursorAndCallback(BattleScript_AirBalloonMsgIn);
        else
            BattleScriptCall(BattleScript_AirBalloonMsgInRet);
        RecordItemEffectBattle(battler, HOLD_EFFECT_AIR_BALLOON);
        effect = ITEM_EFFECT_OTHER;
    }

    return effect;
}

static enum ItemEffect TryRockyHelmet(u32 battlerDef, u32 battlerAtk, u32 item)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;
    enum Ability ability = GetBattlerAbility(battlerAtk);

    if (IsBattlerTurnDamaged(battlerDef)
     && IsBattlerAlive(battlerAtk)
     && !CanBattlerAvoidContactEffects(battlerAtk, battlerDef, ability, GetBattlerHoldEffect(battlerAtk), gCurrentMove)
     && !IsAbilityAndRecord(battlerAtk, ability, ABILITY_MAGIC_GUARD))
    {
        SetPassiveDamageAmount(battlerAtk, GetNonDynamaxMaxHP(battlerAtk) / 6);
        PREPARE_ITEM_BUFFER(gBattleTextBuff1, item);
        BattleScriptCall(BattleScript_RockyHelmetActivates);
        effect = ITEM_HP_CHANGE;
    }

    return effect;
}

static enum ItemEffect TryWeaknessPolicy(u32 battlerDef)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (IsBattlerAlive(battlerDef)
     && IsBattlerTurnDamaged(battlerDef)
     && gBattleStruct->moveResultFlags[battlerDef] & MOVE_RESULT_SUPER_EFFECTIVE)
    {
        BattleScriptCall(BattleScript_WeaknessPolicy);
        effect = ITEM_STATS_CHANGE;
    }

    return effect;
}

static enum ItemEffect TrySnowball(u32 battlerDef)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (IsBattlerAlive(battlerDef)
     && IsBattlerTurnDamaged(battlerDef)
     && GetBattleMoveType(gCurrentMove) == TYPE_ICE)
    {
        BattleScriptCall(BattleScript_TargetItemStatRaise);
        SET_STATCHANGER(STAT_ATK, 1, FALSE);
        effect = ITEM_STATS_CHANGE;
    }

    return effect;
}

static enum ItemEffect TryLuminousMoss(u32 battlerDef)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (IsBattlerAlive(battlerDef)
     && IsBattlerTurnDamaged(battlerDef)
     && GetBattleMoveType(gCurrentMove) == TYPE_WATER)
    {
        BattleScriptCall(BattleScript_TargetItemStatRaise);
        SET_STATCHANGER(STAT_SPDEF, 1, FALSE);
        effect = ITEM_STATS_CHANGE;
    }

    return effect;
}

static enum ItemEffect TryCellBattery(u32 battlerDef)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (IsBattlerAlive(battlerDef)
     && IsBattlerTurnDamaged(battlerDef)
     && GetBattleMoveType(gCurrentMove) == TYPE_ELECTRIC)
    {
        BattleScriptCall(BattleScript_TargetItemStatRaise);
        SET_STATCHANGER(STAT_ATK, 1, FALSE);
        effect = ITEM_STATS_CHANGE;
    }

    return effect;
}

static enum ItemEffect TryAbsorbBulb(u32 battlerDef)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (IsBattlerAlive(battlerDef)
     && IsBattlerTurnDamaged(battlerDef)
     && GetBattleMoveType(gCurrentMove) == TYPE_WATER)
    {
        effect = ITEM_STATS_CHANGE;
        BattleScriptCall(BattleScript_TargetItemStatRaise);
        SET_STATCHANGER(STAT_SPATK, 1, FALSE);
    }

    return effect;
}

static enum ItemEffect TryJabocaBerry(u32 battlerDef, u32 battlerAtk, u32 item)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (IsBattlerAlive(battlerAtk)
     && IsBattlerTurnDamaged(battlerDef)
     && !DoesSubstituteBlockMove(battlerAtk, battlerDef, gCurrentMove)
     && IsBattleMovePhysical(gCurrentMove)
     && !IsAbilityAndRecord(battlerAtk, GetBattlerAbility(battlerAtk), ABILITY_MAGIC_GUARD))
    {
        s32 jabocaDamage = GetNonDynamaxMaxHP(battlerAtk) / 8;
        if (GetBattlerAbility(battlerDef) == ABILITY_RIPEN)
            jabocaDamage *= 2;
        SetPassiveDamageAmount(battlerAtk, jabocaDamage);
        BattleScriptCall(BattleScript_JabocaRowapBerryActivates);
        PREPARE_ITEM_BUFFER(gBattleTextBuff1, item);
        effect = ITEM_HP_CHANGE;
    }

    return effect;
}

static enum ItemEffect TryRowapBerry(u32 battlerDef, u32 battlerAtk, u32 item)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (IsBattlerAlive(battlerAtk)
     && IsBattlerTurnDamaged(battlerDef)
     && !DoesSubstituteBlockMove(battlerAtk, battlerDef, gCurrentMove)
     && IsBattleMoveSpecial(gCurrentMove)
     && !IsAbilityAndRecord(battlerAtk, GetBattlerAbility(battlerAtk), ABILITY_MAGIC_GUARD))
    {
        s32 rowapDamage = GetNonDynamaxMaxHP(battlerAtk) / 8;
        if (GetBattlerAbility(battlerDef) == ABILITY_RIPEN)
            rowapDamage *= 2;
        SetPassiveDamageAmount(battlerAtk, rowapDamage);
        BattleScriptCall(BattleScript_JabocaRowapBerryActivates);
        PREPARE_ITEM_BUFFER(gBattleTextBuff1, item);
        effect = ITEM_HP_CHANGE;
    }

    return effect;
}

static enum ItemEffect TrySetEnigmaBerry(u32 battlerDef, u32 battlerAtk)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (IsBattlerAlive(battlerDef)
     && !DoesSubstituteBlockMove(battlerAtk, battlerDef, gCurrentMove)
     && ((IsBattlerTurnDamaged(battlerDef) && gBattleStruct->moveResultFlags[battlerDef] & MOVE_RESULT_SUPER_EFFECTIVE) || gBattleScripting.overrideBerryRequirements)
     && !(gBattleScripting.overrideBerryRequirements && gBattleMons[battlerDef].hp == gBattleMons[battlerDef].maxHP)
     && !(B_HEAL_BLOCKING >= GEN_5 && gBattleMons[battlerDef].volatiles.healBlock))
    {
        s32 healAmount = gBattleMons[battlerDef].maxHP * 25 / 100;
        if (GetBattlerAbility(battlerDef) == ABILITY_RIPEN)
            healAmount *= 2;
        SetHealAmount(battlerDef, healAmount);
        BattleScriptCall(BattleScript_ItemHealHP_RemoveItemRet);
        effect = ITEM_HP_CHANGE;
    }

    return effect;
}

static enum ItemEffect TryBlunderPolicy(u32 battlerAtk)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (gBattleStruct->blunderPolicy
     && IsBattlerAlive(battlerAtk)
     && CompareStat(battlerAtk, STAT_SPEED, MAX_STAT_STAGE, CMP_LESS_THAN, GetBattlerAbility(battlerAtk)))
    {
        gBattleStruct->blunderPolicy = FALSE;
        SET_STATCHANGER(STAT_SPEED, 2, FALSE);
        BattleScriptCall(BattleScript_AttackerItemStatRaise);
        effect = ITEM_STATS_CHANGE;
    }

    return effect;
}

static enum ItemEffect TryMentalHerb(u32 battler)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    // Check infatuation
    if (gBattleMons[battler].volatiles.infatuation)
    {
        gBattleMons[battler].volatiles.infatuation = 0;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MENTALHERBCURE_INFATUATION;
        StringCopy(gBattleTextBuff1, gStatusConditionString_LoveJpn);
        effect = ITEM_EFFECT_OTHER;
    }
    if (B_MENTAL_HERB >= GEN_5)
    {
        // Check taunt
        if (gDisableStructs[battler].tauntTimer != 0)
        {
            gDisableStructs[battler].tauntTimer = 0;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MENTALHERBCURE_TAUNT;
            PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_TAUNT);
            effect = ITEM_EFFECT_OTHER;
        }
        // Check encore
        if (gDisableStructs[battler].encoreTimer != 0)
        {
            gDisableStructs[battler].encoredMove = 0;
            gDisableStructs[battler].encoreTimer = 0;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MENTALHERBCURE_ENCORE;
            effect = ITEM_EFFECT_OTHER;
        }
        // Check torment
        if (gBattleMons[battler].volatiles.torment == TRUE)
        {
            gBattleMons[battler].volatiles.torment = FALSE;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MENTALHERBCURE_TORMENT;
            effect = ITEM_EFFECT_OTHER;
        }
        // Check heal block
        if (gBattleMons[battler].volatiles.healBlock)
        {
            gBattleMons[battler].volatiles.healBlock = FALSE;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MENTALHERBCURE_HEALBLOCK;
            effect = ITEM_EFFECT_OTHER;
        }
        // Check disable
        if (gDisableStructs[battler].disableTimer != 0)
        {
            gDisableStructs[battler].disableTimer = 0;
            gDisableStructs[battler].disabledMove = 0;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MENTALHERBCURE_DISABLE;
            effect = ITEM_EFFECT_OTHER;
        }
    }

    if (effect)
        BattleScriptCall(BattleScript_MentalHerbCureRet);

    return effect;
}

static enum ItemEffect TryThroatSpray(u32 battlerAtk)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (IsSoundMove(gCurrentMove)
     && gMultiHitCounter == 0
     && IsBattlerAlive(battlerAtk)
     && IsAnyTargetTurnDamaged(battlerAtk)
     && CompareStat(battlerAtk, STAT_SPATK, MAX_STAT_STAGE, CMP_LESS_THAN, GetBattlerAbility(battlerAtk))
     && !NoAliveMonsForEitherParty())   // Don't activate if battle will end
    {
        SET_STATCHANGER(STAT_SPATK, 1, FALSE);
        BattleScriptCall(BattleScript_AttackerItemStatRaise);
        effect = ITEM_STATS_CHANGE;
    }

    return effect;
}

static enum ItemEffect DamagedStatBoostBerryEffect(u32 battlerDef, u32 battlerAtk, enum Stat statId, enum DamageCategory category)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (!IsBattlerAlive(battlerDef) || !CompareStat(battlerDef, statId, MAX_STAT_STAGE, CMP_LESS_THAN, GetBattlerAbility(battlerDef)))
        return effect;

    if (gBattleScripting.overrideBerryRequirements
     || (!DoesSubstituteBlockMove(battlerAtk, battlerDef, gCurrentMove)
         && GetBattleMoveCategory(gCurrentMove) == category
         && IsBattlerTurnDamaged(battlerDef)))
    {
        if (GetBattlerAbility(battlerDef) == ABILITY_RIPEN)
            SET_STATCHANGER(statId, 2, FALSE);
        else
            SET_STATCHANGER(statId, 1, FALSE);

        gBattleScripting.animArg1 = STAT_ANIM_PLUS1 + statId;
        gBattleScripting.animArg2 = 0;
        BattleScriptCall(BattleScript_ConsumableStatRaiseRet);
        effect = ITEM_STATS_CHANGE;
    }

    return effect;
}

static enum ItemEffect TryShellBell(u32 battlerAtk)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (gBattleScripting.savedDmg > 0
     && !(gHitMarker & HITMARKER_UNABLE_TO_USE_MOVE)
     && (IsAnyTargetTurnDamaged(battlerAtk) || gBattleScripting.savedDmg > 0)
     && !IsBattlerAtMaxHp(battlerAtk)
     && IsBattlerAlive(battlerAtk)
     && GetMoveEffect(gCurrentMove) != EFFECT_PAIN_SPLIT
     && !IsFutureSightAttackerInParty(battlerAtk, gBattlerTarget, gCurrentMove)
     && !(B_HEAL_BLOCKING >= GEN_5 && gBattleMons[battlerAtk].volatiles.healBlock))
    {
        SetHealAmount(battlerAtk, gBattleScripting.savedDmg / GetBattlerHoldEffectParam(battlerAtk));
        BattleScriptCall(BattleScript_ItemHealHP_Ret);
        effect = ITEM_HP_CHANGE;
    }

    return effect;
}

static enum ItemEffect TryLifeOrb(u32 battlerAtk)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (IsBattlerAlive(battlerAtk)
     && !(gHitMarker & HITMARKER_UNABLE_TO_USE_MOVE)
     && (IsAnyTargetTurnDamaged(battlerAtk) || gBattleScripting.savedDmg > 0)
     && !IsAbilityAndRecord(battlerAtk, GetBattlerAbility(battlerAtk), ABILITY_MAGIC_GUARD)
     && GetMoveEffect(gCurrentMove) != EFFECT_PAIN_SPLIT
     && !IsFutureSightAttackerInParty(battlerAtk, gBattlerTarget, gCurrentMove))
    {
        SetPassiveDamageAmount(battlerAtk, GetNonDynamaxMaxHP(battlerAtk) / 10);
        BattleScriptCall(BattleScript_ItemHurtRet);
        effect = ITEM_HP_CHANGE;
    }

    return effect;
}

static enum ItemEffect TryStickyBarbOnTargetHit(u32 battlerDef, u32 battlerAtk, u32 item)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (IsBattlerTurnDamaged(battlerDef)
     && !CanBattlerAvoidContactEffects(battlerAtk, battlerDef, GetBattlerAbility(battlerAtk), GetBattlerHoldEffect(battlerAtk), gCurrentMove)
     && !DoesSubstituteBlockMove(battlerAtk, battlerDef, gCurrentMove)
     && IsBattlerAlive(battlerAtk)
     && CanStealItem(battlerAtk, battlerDef, item)
     && gBattleMons[battlerAtk].item == ITEM_NONE)
    {
        // No sticky hold checks.
        gEffectBattler = battlerDef;
        StealTargetItem(battlerAtk, battlerDef);  // Attacker takes target's barb
        BattleScriptCall(BattleScript_StickyBarbTransfer);
        effect = ITEM_EFFECT_OTHER;
    }

    return effect;
}

static enum ItemEffect TryStickyBarbOnEndTurn(u32 battler, u32 item)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (!IsAbilityAndRecord(battler, GetBattlerAbility(battler), ABILITY_MAGIC_GUARD))
    {
        SetPassiveDamageAmount(battler, GetNonDynamaxMaxHP(battler) / 8);
        PREPARE_ITEM_BUFFER(gBattleTextBuff1, item);
        BattleScriptExecute(BattleScript_ItemHurtEnd2);
        effect = ITEM_HP_CHANGE;
    }

    return effect;
}

static enum ItemEffect TryToxicOrb(u32 battler)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;
    enum Ability ability = GetBattlerAbility(battler);

    if (CanBePoisoned(battler, battler, ability, ability)) // Can corrosion trigger toxic orb on itself?
    {
        gBattleMons[battler].status1 = STATUS1_TOXIC_POISON;
        BattleScriptExecute(BattleScript_ToxicOrb);
        effect = ITEM_STATUS_CHANGE;
    }

    return effect;
}

static enum ItemEffect TryFlameOrb(u32 battler)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;
    enum Ability ability = GetBattlerAbility(battler);

    if (CanBeBurned(battler, battler, ability))
    {
        gBattleMons[battler].status1 = STATUS1_BURN;
        BattleScriptExecute(BattleScript_FlameOrb);
        effect = ITEM_STATUS_CHANGE;
    }

    return effect;
}

static enum ItemEffect TryLeftovers(u32 battler, enum HoldEffect holdEffect)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (gBattleMons[battler].hp < gBattleMons[battler].maxHP
     && !(B_HEAL_BLOCKING >= GEN_5 && gBattleMons[battler].volatiles.healBlock))
    {
        SetHealAmount(battler, GetNonDynamaxMaxHP(battler) / 16);
        RecordItemEffectBattle(battler, holdEffect);
        BattleScriptExecute(BattleScript_ItemHealHP_End2);
        effect = ITEM_HP_CHANGE;
    }

    return effect;
}

static enum ItemEffect TryBlackSludgeDamage(u32 battler, enum HoldEffect holdEffect)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (!IsAbilityAndRecord(battler, GetBattlerAbility(battler), ABILITY_MAGIC_GUARD))
    {
        SetPassiveDamageAmount(battler, GetNonDynamaxMaxHP(battler) / 8);
        RecordItemEffectBattle(battler, holdEffect);
        BattleScriptExecute(BattleScript_ItemHurtEnd2);
        effect = ITEM_HP_CHANGE;
    }

    return effect;
}

static enum ItemEffect TryCureParalysis(u32 battler, ActivationTiming timing)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (gBattleMons[battler].status1 & STATUS1_PARALYSIS)
    {
        gBattleMons[battler].status1 &= ~STATUS1_PARALYSIS;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_CURED_PARALYSIS;
        if (timing == IsOnSwitchInFirstTurnActivation)
            BattleScriptExecute(BattleScript_BerryCureStatusEnd2);
        else
            BattleScriptCall(BattleScript_BerryCureStatusRet);
        effect = ITEM_STATUS_CHANGE;
    }

    return effect;
}

static enum ItemEffect TryCurePoison(u32 battler, ActivationTiming timing)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (gBattleMons[battler].status1 & STATUS1_PSN_ANY)
    {
        gBattleMons[battler].status1 &= ~(STATUS1_PSN_ANY | STATUS1_TOXIC_COUNTER);
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_CURED_POISON;
        if (timing == IsOnSwitchInFirstTurnActivation)
            BattleScriptExecute(BattleScript_BerryCureStatusEnd2);
        else
            BattleScriptCall(BattleScript_BerryCureStatusRet);
        effect = ITEM_STATUS_CHANGE;
    }

    return effect;
}

static enum ItemEffect TryCureBurn(u32 battler, ActivationTiming timing)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (gBattleMons[battler].status1 & STATUS1_BURN)
    {
        gBattleMons[battler].status1 &= ~STATUS1_BURN;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_CURED_BURN;
        if (timing == IsOnSwitchInFirstTurnActivation)
            BattleScriptExecute(BattleScript_BerryCureStatusEnd2);
        else
            BattleScriptCall(BattleScript_BerryCureStatusRet);
        effect = ITEM_STATUS_CHANGE;
    }

    return effect;
}

static enum ItemEffect TryCureFreezeOrFrostbite(u32 battler, ActivationTiming timing)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (gBattleMons[battler].status1 & STATUS1_FREEZE)
    {
        gBattleMons[battler].status1 &= ~STATUS1_FREEZE;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_CURED_FREEEZE;
        effect = ITEM_STATUS_CHANGE;
    }
    else if (gBattleMons[battler].status1 & STATUS1_FROSTBITE)
    {
        gBattleMons[battler].status1 &= ~STATUS1_FROSTBITE;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_CURED_FROSTBITE;
        effect = ITEM_STATUS_CHANGE;
    }

    if (effect == ITEM_STATUS_CHANGE)
    {
        if (timing == IsOnSwitchInFirstTurnActivation)
            BattleScriptExecute(BattleScript_BerryCureStatusEnd2);
        else
            BattleScriptCall(BattleScript_BerryCureStatusRet);
    }

    return effect;
}

static enum ItemEffect TryCureSleep(u32 battler, ActivationTiming timing)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (gBattleMons[battler].status1 & STATUS1_SLEEP)
    {
        gBattleMons[battler].status1 &= ~STATUS1_SLEEP;
        gBattleMons[battler].volatiles.nightmare = FALSE;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_CURED_SLEEP;
        TryDeactivateSleepClause(GetBattlerSide(battler), gBattlerPartyIndexes[battler]);
        if (timing == IsOnSwitchInFirstTurnActivation)
            BattleScriptExecute(BattleScript_BerryCureStatusEnd2);
        else
            BattleScriptCall(BattleScript_BerryCureStatusRet);
        effect = ITEM_STATUS_CHANGE;
    }

    return effect;
}

static enum ItemEffect TryCureConfusion(u32 battler, ActivationTiming timing)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (gBattleMons[battler].volatiles.confusionTurns > 0)
    {
        RemoveConfusionStatus(battler);
        if (timing == IsOnSwitchInFirstTurnActivation)
            BattleScriptExecute(BattleScript_BerryCureConfusionEnd2);
        else
            BattleScriptCall(BattleScript_BerryCureConfusionRet);
        effect = ITEM_EFFECT_OTHER;
    }

    return effect;
}

static enum ItemEffect TryCureAnyStatus(u32 battler, ActivationTiming timing)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;
    u32 string = 0;

    if ((gBattleMons[battler].status1 & STATUS1_ANY || gBattleMons[battler].volatiles.confusionTurns > 0))
    {
        if (gBattleMons[battler].status1 & STATUS1_PSN_ANY)
        {
            StringCopy(gBattleTextBuff1, gStatusConditionString_PoisonJpn);
            string++;
        }
        if (gBattleMons[battler].status1 & STATUS1_SLEEP)
        {
            gBattleMons[battler].volatiles.nightmare = FALSE;
            StringCopy(gBattleTextBuff1, gStatusConditionString_SleepJpn);
            TryDeactivateSleepClause(GetBattlerSide(battler), gBattlerPartyIndexes[battler]);
            string++;
        }
        if (gBattleMons[battler].status1 & STATUS1_PARALYSIS)
        {
            StringCopy(gBattleTextBuff1, gStatusConditionString_ParalysisJpn);
            string++;
        }
        if (gBattleMons[battler].status1 & STATUS1_BURN)
        {
            StringCopy(gBattleTextBuff1, gStatusConditionString_BurnJpn);
            string++;
        }
        if (gBattleMons[battler].status1 & STATUS1_FREEZE || gBattleMons[battler].status1 & STATUS1_FROSTBITE)
        {
            StringCopy(gBattleTextBuff1, gStatusConditionString_IceJpn);
            string++;
        }
        if (gBattleMons[battler].volatiles.confusionTurns > 0)
        {
            StringCopy(gBattleTextBuff1, gStatusConditionString_ConfusionJpn);
            string++;
        }
        if (string <= 1)
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_CURED_PROBLEM;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_NORMALIZED_STATUS;
        gBattleMons[battler].status1 = 0;
        RemoveConfusionStatus(battler);
        if (timing == IsOnSwitchInFirstTurnActivation)
            BattleScriptExecute(BattleScript_BerryCureStatusEnd2);
        else
            BattleScriptCall(BattleScript_BerryCureStatusRet);
        effect = ITEM_STATUS_CHANGE;
    }

    return effect;
}

enum HealAmount
{
    FIXED_HEAL_AMOUNT,
    PERCENT_HEAL_AMOUNT,
};

static u32 ItemHealHp(u32 battler, u32 itemId, enum HealAmount percentHeal, ActivationTiming timing)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;
    enum Ability ability = GetBattlerAbility(battler);

    if (!(gBattleScripting.overrideBerryRequirements && gBattleMons[battler].hp == gBattleMons[battler].maxHP)
     && !(B_HEAL_BLOCKING >= GEN_5 && gBattleMons[battler].volatiles.healBlock)
     && HasEnoughHpToEatBerry(battler, ability, 2, itemId))
    {
        s32 healAmount = 0;
        if (percentHeal == PERCENT_HEAL_AMOUNT)
            healAmount = (GetNonDynamaxMaxHP(battler) * GetItemHoldEffectParam(itemId) / 100);
        else
            healAmount = GetItemHoldEffectParam(itemId);

        if (ability == ABILITY_RIPEN && GetItemPocket(itemId) == POCKET_BERRIES)
            healAmount *= 2;

        SetHealAmount(battler, healAmount);
        if (timing == IsOnSwitchInFirstTurnActivation)
            BattleScriptExecute(BattleScript_ItemHealHP_RemoveItemEnd2);
        else
            BattleScriptCall(BattleScript_ItemHealHP_RemoveItemRet);

        effect = ITEM_HP_CHANGE;
    }

    return effect;
}

static u32 ItemRestorePp(u32 battler, u32 itemId, ActivationTiming timing)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;
    struct Pokemon *mon = GetBattlerMon(battler);
    u32 i, changedPP = 0;
    enum Ability ability = GetBattlerAbility(battler);

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        u32 move = GetMonData(mon, MON_DATA_MOVE1 + i);
        u32 currentPP = GetMonData(mon, MON_DATA_PP1 + i);
        u32 ppBonuses = GetMonData(mon, MON_DATA_PP_BONUSES);
        u32 maxPP = CalculatePPWithBonus(move, ppBonuses, i);
        if (move && (currentPP == 0 || (gBattleScripting.overrideBerryRequirements && currentPP != maxPP)))
        {
            u32 ppRestored = GetItemHoldEffectParam(itemId);

            if (ability == ABILITY_RIPEN)
            {
                ppRestored *= 2;
                gBattlerAbility = battler;
            }
            if (currentPP + ppRestored > maxPP)
                changedPP = maxPP;
            else
                changedPP = currentPP + ppRestored;

            PREPARE_MOVE_BUFFER(gBattleTextBuff1, move);

            if (timing == IsOnSwitchInFirstTurnActivation)
                BattleScriptExecute(BattleScript_BerryPPHealEnd2);
            else
                BattleScriptCall(BattleScript_BerryPPHealRet);

            gBattleScripting.battler = battler;
            BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, i + REQUEST_PPMOVE1_BATTLE, 0, 1, &changedPP);
            MarkBattlerForControllerExec(battler);
            if (MOVE_IS_PERMANENT(battler, i))
                gBattleMons[battler].pp[i] = changedPP;
            effect = ITEM_PP_CHANGE;
        }
    }
    return effect;
}

static enum ItemEffect HealConfuseBerry(u32 battler, u32 itemId, u32 flavorId, ActivationTiming timing)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;
    u32 hpFraction = B_CONFUSE_BERRIES_HEAL >= GEN_7 ? 4 : 2;
    u32 ability = GetBattlerAbility(battler);

    if (HasEnoughHpToEatBerry(battler, ability, hpFraction, itemId)
     && !(B_HEAL_BLOCKING >= GEN_5 && gBattleMons[battler].volatiles.healBlock))
    {
        s32 healAmount = GetNonDynamaxMaxHP(battler) / GetItemHoldEffectParam(itemId);
        if (ability == ABILITY_RIPEN)
            healAmount *= 2;
        SetHealAmount(battler, healAmount);
        if (timing == IsOnSwitchInFirstTurnActivation)
        {
            if (GetFlavorRelationByPersonality(gBattleMons[battler].personality, flavorId) < 0)
                BattleScriptExecute(BattleScript_BerryConfuseHealEnd2);
            else
                BattleScriptExecute(BattleScript_ItemHealHP_RemoveItemEnd2);
        }
        else
        {
            if (GetFlavorRelationByPersonality(gBattleMons[battler].personality, flavorId) < 0)
                BattleScriptCall(BattleScript_BerryConfuseHealRet);
            else
                BattleScriptCall(BattleScript_ItemHealHP_RemoveItemRet);
        }
        PREPARE_FLAVOR_BUFFER(gBattleTextBuff1, flavorId);
        effect = ITEM_HP_CHANGE;
    }

    return effect;
}

static enum ItemEffect StatRaiseBerry(u32 battler, u32 itemId, enum Stat statId, ActivationTiming timing)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;
    enum Ability ability = GetBattlerAbility(battler);

    if (CompareStat(battler, statId, MAX_STAT_STAGE, CMP_LESS_THAN, ability)
     && HasEnoughHpToEatBerry(battler, ability, GetItemHoldEffectParam(itemId), itemId))
    {
        gEffectBattler = gBattleScripting.battler = battler;
        SET_STATCHANGER(statId, ability == ABILITY_RIPEN ? 2 : 1, FALSE);
        gBattleScripting.animArg1 = STAT_ANIM_PLUS1 + statId;
        gBattleScripting.animArg2 = 0;

        if (timing == IsOnSwitchInFirstTurnActivation)
            BattleScriptExecute(BattleScript_ConsumableStatRaiseEnd2);
        else
            BattleScriptCall(BattleScript_ConsumableStatRaiseRet);
        effect = ITEM_STATS_CHANGE;
    }

    return effect;
}

static enum ItemEffect CriticalHitRatioUp(u32 battler, u32 itemId, ActivationTiming timing)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (!gBattleMons[battler].volatiles.focusEnergy
     && !gBattleMons[battler].volatiles.dragonCheer
     && HasEnoughHpToEatBerry(battler, GetBattlerAbility(battler), GetItemHoldEffectParam(itemId), itemId))
    {
        gBattleMons[battler].volatiles.focusEnergy = TRUE;
        if (timing == IsOnSwitchInFirstTurnActivation)
            BattleScriptExecute(BattleScript_BerryFocusEnergyEnd2);
        else
            BattleScriptCall(BattleScript_BerryFocusEnergyRet);
        effect = ITEM_EFFECT_OTHER;
    }

    return effect;
}

static enum ItemEffect RandomStatRaiseBerry(u32 battler, u32 itemId, ActivationTiming timing)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;
    enum Stat stat;
    enum Ability ability = GetBattlerAbility(battler);

    for (stat = STAT_ATK; stat < NUM_STATS; stat++)
    {
        if (CompareStat(battler, stat, MAX_STAT_STAGE, CMP_LESS_THAN, ability))
            break;
    }

    if (stat == NUM_STATS)
        return effect;

    if (HasEnoughHpToEatBerry(battler, ability, GetItemHoldEffectParam(itemId), itemId))
    {
        u32 savedAttacker = gBattlerAttacker;
        // MoodyCantRaiseStat requires that the battler is set to gBattlerAttacker
        gBattlerAttacker = gBattleScripting.battler = battler;
        gBattleScripting.statChanger = 0;
        if (ability != ABILITY_CONTRARY)
            stat = RandomUniformExcept(RNG_RANDOM_STAT_UP, STAT_ATK, NUM_STATS - 1, MoodyCantRaiseStat);
        else
            stat = RandomUniformExcept(RNG_RANDOM_STAT_UP, STAT_ATK, NUM_STATS - 1, MoodyCantLowerStat);
        gBattlerAttacker = savedAttacker;

        PREPARE_STAT_BUFFER(gBattleTextBuff1, stat);
        SET_STATCHANGER(stat, ability == ABILITY_RIPEN ? 4 : 2, FALSE);
        gBattleScripting.animArg1 = STAT_ANIM_PLUS2 + stat;
        gBattleScripting.animArg2 = 0;
        if (timing == IsOnSwitchInFirstTurnActivation)
            BattleScriptExecute(BattleScript_ConsumableStatRaiseEnd2);
        else
            BattleScriptCall(BattleScript_ConsumableStatRaiseRet);
        effect = ITEM_STATS_CHANGE;
    }

    return effect;
}

static enum ItemEffect TrySetMicleBerry(u32 battler, u32 itemId, ActivationTiming timing)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;

    if (HasEnoughHpToEatBerry(battler, GetBattlerAbility(battler), 4, itemId))
    {
        gBattleStruct->battlerState[battler].usedMicleBerry = TRUE;
        if (timing == IsOnSwitchInFirstTurnActivation)
            BattleScriptExecute(BattleScript_MicleBerryActivateEnd2);
        else
            BattleScriptCall(BattleScript_MicleBerryActivateRet);
        effect = ITEM_EFFECT_OTHER;
    }
    return effect;
}

enum ItemEffect ItemBattleEffects(u32 itemBattler, u32 battler, enum HoldEffect holdEffect, ActivationTiming timing)
{
    enum ItemEffect effect = ITEM_NO_EFFECT;
    u32 item;

    if (timing == IsOnBerryActivation || timing == IsOnFlingActivation)
        item = gLastUsedItem;
    else
        item = gBattleMons[itemBattler].item;

    if (holdEffect == HOLD_EFFECT_NONE
     || !timing(holdEffect)
     || IsUnnerveBlocked(itemBattler, item))
        return effect;

    if (!IsBattlerAlive(itemBattler)
     && holdEffect != HOLD_EFFECT_ROWAP_BERRY // Hacky workaround for them right now
     && holdEffect != HOLD_EFFECT_JABOCA_BERRY
     && holdEffect != HOLD_EFFECT_ROCKY_HELMET)
        return effect;

    switch (holdEffect)
    {
    case HOLD_EFFECT_DOUBLE_PRIZE:
        effect = TryDoublePrize(itemBattler);
        break;
    case HOLD_EFFECT_ROOM_SERVICE:
        effect = TryRoomService(itemBattler, timing);
        break;
    case HOLD_EFFECT_TERRAIN_SEED:
        effect = TryTerrainSeeds(itemBattler, item, timing);
        break;
    case HOLD_EFFECT_BERSERK_GENE:
        effect = TryBerserkGene(itemBattler, timing);
        break;
    case HOLD_EFFECT_BOOSTER_ENERGY:
        effect = TryBoosterEnergy(itemBattler, GetBattlerAbility(itemBattler), timing);
        break;
    case HOLD_EFFECT_WHITE_HERB:
        effect = RestoreWhiteHerbStats(itemBattler, timing);
        break;
    case HOLD_EFFECT_MIRROR_HERB:
        effect = TryConsumeMirrorHerb(itemBattler, timing);
        break;
    case HOLD_EFFECT_FLINCH: // Kings Rock
        effect = TryKingsRock(itemBattler, battler, item);
        break;
    case HOLD_EFFECT_AIR_BALLOON:
        effect = TryAirBalloon(itemBattler, timing);
        break;
    case HOLD_EFFECT_ROCKY_HELMET:
        effect = TryRockyHelmet(itemBattler, battler, item);
        break;
    case HOLD_EFFECT_WEAKNESS_POLICY:
        effect = TryWeaknessPolicy(itemBattler);
        break;
    case HOLD_EFFECT_SNOWBALL:
        effect = TrySnowball(itemBattler);
        break;
    case HOLD_EFFECT_LUMINOUS_MOSS:
        effect = TryLuminousMoss(itemBattler);
        break;
    case HOLD_EFFECT_CELL_BATTERY:
        effect = TryCellBattery(itemBattler);
        break;
    case HOLD_EFFECT_ABSORB_BULB:
        effect = TryAbsorbBulb(itemBattler);
        break;
    case HOLD_EFFECT_JABOCA_BERRY:
        effect = TryJabocaBerry(itemBattler, battler, item);
        break;
    case HOLD_EFFECT_ROWAP_BERRY:
        effect = TryRowapBerry(itemBattler, battler, item);
        break;
    case HOLD_EFFECT_ENIGMA_BERRY: // consume and heal if hit by super effective move
        effect = TrySetEnigmaBerry(itemBattler, battler);
        break;
    case HOLD_EFFECT_BLUNDER_POLICY:
        effect = TryBlunderPolicy(itemBattler);
        break;
    case HOLD_EFFECT_MENTAL_HERB:
        effect = TryMentalHerb(itemBattler);
        break;
    case HOLD_EFFECT_THROAT_SPRAY:
        effect = TryThroatSpray(itemBattler);
        break;
    case HOLD_EFFECT_KEE_BERRY:  // consume and boost defense if used physical move
        effect = DamagedStatBoostBerryEffect(itemBattler, battler, STAT_DEF, DAMAGE_CATEGORY_PHYSICAL);
        break;
    case HOLD_EFFECT_MARANGA_BERRY:  // consume and boost sp. defense if used special move
        effect = DamagedStatBoostBerryEffect(itemBattler, battler, STAT_SPDEF, DAMAGE_CATEGORY_SPECIAL);
        break;
    case HOLD_EFFECT_SHELL_BELL:
        effect = TryShellBell(itemBattler);
        break;
    case HOLD_EFFECT_LIFE_ORB:
        effect = TryLifeOrb(itemBattler);
        break;
    case HOLD_EFFECT_STICKY_BARB:
        if (timing == IsOnTargetHitActivation)
            effect = TryStickyBarbOnTargetHit(itemBattler, battler, item);
        else
            effect = TryStickyBarbOnEndTurn(itemBattler, item);
        break;
    case HOLD_EFFECT_TOXIC_ORB:
        effect = TryToxicOrb(itemBattler);
        break;
    case HOLD_EFFECT_FLAME_ORB:
        effect = TryFlameOrb(itemBattler);
        break;
    case HOLD_EFFECT_LEFTOVERS:
        effect = TryLeftovers(itemBattler, holdEffect);
        break;
    case HOLD_EFFECT_BLACK_SLUDGE:
        if (IS_BATTLER_OF_TYPE(itemBattler, TYPE_POISON))
            effect = TryLeftovers(itemBattler, holdEffect);
        else
            effect = TryBlackSludgeDamage(itemBattler, holdEffect);
        break;
    case HOLD_EFFECT_CURE_PAR: // Cheri Berry
        effect = TryCureParalysis(itemBattler, timing);
        break;
    case HOLD_EFFECT_CURE_PSN: // Pecha Berry
        effect = TryCurePoison(itemBattler, timing);
        break;
    case HOLD_EFFECT_CURE_BRN: // Rawst Berry
        effect = TryCureBurn(itemBattler, timing);
        break;
    case HOLD_EFFECT_CURE_FRZ: // Aspear Berry
        effect = TryCureFreezeOrFrostbite(itemBattler, timing);
        break;
    case HOLD_EFFECT_CURE_SLP: // Chesto Berry
        effect = TryCureSleep(itemBattler, timing);
        break;
    case HOLD_EFFECT_CURE_CONFUSION: // Persim Berry
        effect = TryCureConfusion(itemBattler, timing);
        break;
    case HOLD_EFFECT_CURE_STATUS: // Lum Berry
        effect = TryCureAnyStatus(itemBattler, timing);
        break;
    case HOLD_EFFECT_RESTORE_HP: // Oran / Sitrus Berry / Berry Juice
        effect = ItemHealHp(itemBattler, item, FIXED_HEAL_AMOUNT, timing);
        break;
    case HOLD_EFFECT_RESTORE_PCT_HP: // Sitrus Berry
        effect = ItemHealHp(itemBattler, item, PERCENT_HEAL_AMOUNT, timing);
        break;
    case HOLD_EFFECT_RESTORE_PP: // Leppa Berry
        effect = ItemRestorePp(itemBattler, item, timing);
        break;
    case HOLD_EFFECT_CONFUSE_SPICY: // Figy Berry
        effect = HealConfuseBerry(itemBattler, item, FLAVOR_SPICY, timing);
        break;
    case HOLD_EFFECT_CONFUSE_DRY: // Wiki Berry
        effect = HealConfuseBerry(itemBattler, item, FLAVOR_DRY, timing);
        break;
    case HOLD_EFFECT_CONFUSE_SWEET: // Mago Berry
        effect = HealConfuseBerry(itemBattler, item, FLAVOR_SWEET, timing);
        break;
    case HOLD_EFFECT_CONFUSE_BITTER: // Aguav Berry
        effect = HealConfuseBerry(itemBattler, item, FLAVOR_BITTER, timing);
        break;
    case HOLD_EFFECT_CONFUSE_SOUR: // Iapapa Berry
        effect = HealConfuseBerry(itemBattler, item, FLAVOR_SOUR, timing);
        break;
    case HOLD_EFFECT_ATTACK_UP: // Liechi Berry
        effect = StatRaiseBerry(itemBattler, item, STAT_ATK, timing);
        break;
    case HOLD_EFFECT_DEFENSE_UP: // Ganlon Berry
        effect = StatRaiseBerry(itemBattler, item, STAT_DEF, timing);
        break;
    case HOLD_EFFECT_SPEED_UP: // Salac Berry
        effect = StatRaiseBerry(itemBattler, item, STAT_SPEED, timing);
        break;
    case HOLD_EFFECT_SP_ATTACK_UP: // Petaya Berry
        effect = StatRaiseBerry(itemBattler, item, STAT_SPATK, timing);
        break;
    case HOLD_EFFECT_SP_DEFENSE_UP: // Apicot Berry
        effect = StatRaiseBerry(itemBattler, item, STAT_SPDEF, timing);
        break;
    case HOLD_EFFECT_CRITICAL_UP: // Lansat Berry
        effect = CriticalHitRatioUp(itemBattler, item, timing);
        break;
    case HOLD_EFFECT_RANDOM_STAT_UP: // Starf Berry
        effect = RandomStatRaiseBerry(itemBattler, item, timing);
        break;
    case HOLD_EFFECT_MICLE_BERRY:
        effect = TrySetMicleBerry(itemBattler, item, timing);
        break;
    default:
        break;
    }

    if (effect == ITEM_STATUS_CHANGE)
    {
        BtlController_EmitSetMonData(itemBattler, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[itemBattler].status1);
        MarkBattlerForControllerExec(itemBattler);
    }

    if (effect)
    {
        gLastUsedItem = item;
        gBattleScripting.battler = gPotentialItemEffectBattler = itemBattler;
        if ((item >= FIRST_BERRY_INDEX && item <= LAST_BERRY_INDEX))
            GetBattlerPartyState(itemBattler)->ateBerry = TRUE;
    }

    return effect;
}
