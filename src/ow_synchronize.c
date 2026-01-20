#include "global.h"
#include "ow_synchronize.h"
#include "pokemon.h"
#include "random.h"
#include "constants/pokemon.h"

static UNUSED bool32 HasHalfChance(u32 species);
static UNUSED bool32 HasTwoThirdsChance(u32 species);
static UNUSED bool32 IsFalse(u32 species);
static UNUSED bool32 IsTrue(u32 species);
static UNUSED bool32 IsTrueIfUndiscoveredEggGroup(u32 species);

const static bool32 (*sSynchronizeModes[]) (u32) = 
{
#if OW_SYNCHRONIZE_NATURE == GEN_3
    [WILDMON_ORIGIN] = HasHalfChance,
    [STATIC_WILDMON_ORIGIN] = IsFalse,
    [ROAMER_ORIGIN] = IsFalse,
    [GIFTMON_ORIGIN] = IsFalse,
#elif OW_SYNCHRONIZE_NATURE <= GEN_5
    [WILDMON_ORIGIN] = HasHalfChance,
    [STATIC_WILDMON_ORIGIN] = HasHalfChance,
    [ROAMER_ORIGIN] = IsFalse,
    [GIFTMON_ORIGIN] = IsFalse,
#elif OW_SYNCHRONIZE_NATURE == GEN_6
    [WILDMON_ORIGIN] = HasHalfChance,
    [STATIC_WILDMON_ORIGIN] = HasHalfChance,
    [ROAMER_ORIGIN] = IsFalse,
    [GIFTMON_ORIGIN] = IsTrueIfUndiscoveredEggGroup,
#elif OW_SYNCHRONIZE_NATURE == GEN_7
    [WILDMON_ORIGIN] = HasHalfChance,
    [STATIC_WILDMON_ORIGIN] = HasHalfChance,
    [ROAMER_ORIGIN] = IsFalse,
    [GIFTMON_ORIGIN] = IsTrue,
#elif OW_SYNCHRONIZE_NATURE == GEN_8
    [WILDMON_ORIGIN] = IsTrue,
    [STATIC_WILDMON_ORIGIN] = IsFalse,
    [ROAMER_ORIGIN] = IsTrue,
    [GIFTMON_ORIGIN] = IsFalse,
#else
    [WILDMON_ORIGIN] = IsFalse,
    [STATIC_WILDMON_ORIGIN] = IsFalse,
    [ROAMER_ORIGIN] = IsFalse,
    [GIFTMON_ORIGIN] = IsFalse,
#endif
};

const static bool32 (*sCuteCharmModes[]) (u32) = 
{
    [WILDMON_ORIGIN] = HasTwoThirdsChance,
    [STATIC_WILDMON_ORIGIN] = HasTwoThirdsChance,
    [ROAMER_ORIGIN] = IsFalse,
    [GIFTMON_ORIGIN] = IsFalse,
};

static UNUSED bool32 HasHalfChance(u32 species)
{
    return Random() % 2;
}

static UNUSED bool32 HasTwoThirdsChance(u32 species)
{
    return Random() % 3;
}

static UNUSED bool32 IsFalse(u32 species)
{
    return FALSE;
}

static UNUSED bool32 IsTrue(u32 species)
{
    return TRUE;
}

static UNUSED bool32 IsTrueIfUndiscoveredEggGroup(u32 species)
{
    return (gSpeciesInfo[species].eggGroups[0] == EGG_GROUP_NO_EGGS_DISCOVERED);
}

static bool32 IsSynchronizeActive(void)
{
    return ((!GetMonData(&gPlayerParty[0], MON_DATA_SANITY_IS_EGG)
        && GetMonAbility(&gPlayerParty[0]) == ABILITY_SYNCHRONIZE));
}

static bool32 IsCuteCharmActive(void)
{
     return ((!GetMonData(&gPlayerParty[0], MON_DATA_SANITY_IS_EGG)
        && GetMonAbility(&gPlayerParty[0]) == ABILITY_CUTE_CHARM));
}

u32 GetSynchronizedNature(enum GeneratedMonOrigin origin, u32 species)
{
    if (!IsSynchronizeActive())
        return NATURE_RANDOM;
    if (!(sSynchronizeModes[origin](species)))
        return NATURE_RANDOM;
    return GetMonData(&gPlayerParty[0], MON_DATA_PERSONALITY) % NUM_NATURES;
}

u32 GetSynchronizedGender(enum GeneratedMonOrigin origin, u32 species)
{
    if (!IsCuteCharmActive())
        return MON_GENDER_RANDOM;
    if (!(sCuteCharmModes[origin](species)))
        return MON_GENDER_RANDOM;
    u8 leadingMonGender = GetMonGender(&gPlayerParty[0]);
    // misses mon is genderless check, although no genderless mon can have cute charm as ability
    if (leadingMonGender == MON_FEMALE)
        return MON_MALE;
    else
        return MON_FEMALE;
}
