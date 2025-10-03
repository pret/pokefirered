#ifndef GUARD_GENERATIONAL_CHANGES_H
#define GUARD_GENERATIONAL_CHANGES_H

#include "constants/generational_changes.h"
#include "config/battle.h"

static const u8 sGenerationalChanges[GEN_CONFIG_COUNT] =
{
    [GEN_CONFIG_CRIT_CHANCE]               = B_CRIT_CHANCE,
    [GEN_CONFIG_CRIT_MULTIPLIER]           = B_CRIT_MULTIPLIER,
    [GEN_CONFIG_FOCUS_ENERGY_CRIT_RATIO]   = B_FOCUS_ENERGY_CRIT_RATIO,
    [GEN_CONFIG_PARALYSIS_SPEED]           = B_PARALYSIS_SPEED,
    [GEN_CONFIG_CONFUSION_SELF_DMG_CHANCE] = B_CONFUSION_SELF_DMG_CHANCE,
    [GEN_CONFIG_MULTI_HIT_CHANCE]          = B_MULTI_HIT_CHANCE,
    [GEN_CONFIG_GALE_WINGS]                = B_GALE_WINGS,
    [GEN_CONFIG_HEAL_BELL_SOUNDPROOF]      = B_HEAL_BELL_SOUNDPROOF,
    [GEN_CONFIG_TELEPORT_BEHAVIOR]         = B_TELEPORT_BEHAVIOR,
    [GEN_CONFIG_ABILITY_WEATHER]           = B_ABILITY_WEATHER,
    [GEN_CONFIG_MOODY_STATS]               = B_MOODY_ACC_EVASION,
    [GEN_CONFIG_BATTLE_BOND]               = B_BATTLE_BOND,
    [GEN_CONFIG_ATE_MULTIPLIER]            = B_ATE_MULTIPLIER,
    [GEN_CONFIG_FELL_STINGER_STAT_RAISE]   = B_FELL_STINGER_STAT_RAISE,
    [GEN_CONFIG_DEFIANT_STICKY_WEB]        = B_DEFIANT_STICKY_WEB,
    [GEN_CONFIG_ENCORE_TARGET]             = B_ENCORE_TARGET,
    [GEN_CONFIG_TIME_OF_DAY_HEALING_MOVES] = B_TIME_OF_DAY_HEALING_MOVES,
    [GEN_PICKUP_WILD]                      = B_PICKUP_WILD,
    [GEN_PROTEAN_LIBERO]                   = B_PROTEAN_LIBERO,
    [GEN_INTREPID_SWORD]                   = B_INTREPID_SWORD,
    [GEN_DAUNTLESS_SHIELD]                 = B_DAUNTLESS_SHIELD,
    [GEN_ILLUMINATE_EFFECT]                = B_ILLUMINATE_EFFECT,
    [GEN_STEAL_WILD_ITEMS]                 = B_STEAL_WILD_ITEMS,
    [GEN_SNOW_WARNING]                     = B_SNOW_WARNING,
    [GEN_ALLY_SWITCH_FAIL_CHANCE]          = B_ALLY_SWITCH_FAIL_CHANCE,
    [GEN_DREAM_EATER_LIQUID_OOZE]          = B_DREAM_EATER_LIQUID_OOZE,
    [GEN_CONFIG_TRANSISTOR_BOOST]          = B_TRANSISTOR_BOOST,
    [GEN_CONFIG_RECALC_TURN_AFTER_ACTIONS] = B_RECALC_TURN_AFTER_ACTIONS,
    [GEN_CONFIG_UPDATED_INTIMIDATE]        = B_UPDATED_INTIMIDATE,
    [GEN_CONFIG_DISGUISE_HP_LOSS]          = B_DISGUISE_HP_LOSS,
    [GEN_CONFIG_AFTER_YOU_TURN_ORDER]      = B_AFTER_YOU_TURN_ORDER,
    [GEN_CONFIG_HEALING_WISH_SWITCH]       = B_HEALING_WISH_SWITCH,
    [GEN_CONFIG_MEGA_EVO_TURN_ORDER]       = B_MEGA_EVO_TURN_ORDER,
    [GEN_CONFIG_SHEER_COLD_IMMUNITY]       = B_SHEER_COLD_IMMUNITY,
    [GEN_CONFIG_WEAK_ARMOR_SPEED]          = B_WEAK_ARMOR_SPEED,
    [GEN_CONFIG_PRANKSTER_DARK_TYPES]      = B_PRANKSTER_DARK_TYPES,
    [GEN_CONFIG_DESTINY_BOND_FAIL]         = B_DESTINY_BOND_FAIL,
    [GEN_CONFIG_POWDER_RAIN]               = B_POWDER_RAIN,
};

#if TESTING
extern u8 *gGenerationalChangesTestOverride;
#endif

static inline u32 GetGenConfig(enum GenConfigTag configTag)
{
    if (configTag >= GEN_CONFIG_COUNT) return GEN_LATEST;
#if TESTING
    if (gGenerationalChangesTestOverride == NULL) return sGenerationalChanges[configTag];
    return gGenerationalChangesTestOverride[configTag];
#else
    return sGenerationalChanges[configTag];
#endif
}

static inline void SetGenConfig(enum GenConfigTag configTag, u32 value)
{
#if TESTING
    if (configTag >= GEN_CONFIG_COUNT) return;
    if (gGenerationalChangesTestOverride == NULL) return;
    gGenerationalChangesTestOverride[configTag] = value;
#endif
}

#if TESTING
void TestInitConfigData(void);
void TestFreeConfigData(void);
#endif

#endif // GUARD_GENERATIONAL_CHANGES_H
