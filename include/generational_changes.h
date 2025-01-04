#ifndef GUARD_GENERATIONAL_CHANGES_H
#define GUARD_GENERATIONAL_CHANGES_H

#include "constants/generational_changes.h"
#include "config/battle.h"

static const u8 sGenerationalChanges[GEN_CONFIG_COUNT] =
{
    [GEN_CONFIG_GALE_WINGS] = B_GALE_WINGS,
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
