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
