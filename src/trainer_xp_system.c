#include "global.h"
#include "trainer_xp_system.h"
#include "battle.h"
#include "pokemon.h"
#include "pokedex.h"
#include "random.h"
#include "constants/moves.h"
#include "constants/opponents.h"
#include "constants/species.h"
#include "constants/pokemon.h"
#include "constants/trainers.h"
#include "trainer_type_debug.h"
#include "trainer_type_npc_levels.h"
#include "event_data.h"
#include "constants/vars.h"

// ---------------------------------------------------------------------------
// Trainer type XP tiers — analogous to Pokemon growth rate groups.
//
// Each trainer type level requires XP equal to the threshold for that level.
// Thresholds follow an x^1.5 power curve so every level costs more than the
// previous one.  Tables were generated with:
//   threshold[i] = max(prev+1, round(max_xp * (i/99)^1.5))  for i=1..99
//
//  Fast         (Bug)                      : max XP 7500   level-10 = 207
//  Medium       (Normal,Fighting,Flying,Poison,
//                Ground,Rock,Ghost,Steel,
//                Mystery,Dark)             : max XP 15000  level-10 = 411
//  MediumSlow   (Fire,Water,Grass,
//                Electric,Ice)             : max XP 24000  level-10 = 657
//  Slow         (Psychic, Dragon)          : max XP 36000  level-10 = 987
// ---------------------------------------------------------------------------

#define TRAINER_TYPE_XP_SCALE 3
#define NPC_TYPE_RAW_TO_EXP_MULTIPLIER 25

#define TRAINER_TYPE_TIER_FAST        0
#define TRAINER_TYPE_TIER_MEDIUM      1
#define TRAINER_TYPE_TIER_MEDIUM_SLOW 2
#define TRAINER_TYPE_TIER_SLOW        3

static u32 sBattleSummaryExpGained[NUMBER_OF_MON_TYPES];
static u8 sBattleSummaryLevelsGained[NUMBER_OF_MON_TYPES];
static u8 sBattleSummaryQuarterExpRemainder[NUMBER_OF_MON_TYPES];
static u8 sNpcTrainerTypeLevels[NUMBER_OF_MON_TYPES];
static u16 sNpcTrainerTypeLevelsTrainerId = 0xFFFF;
static bool8 sNpcTrainerTypeLevelsValid;

static const u16 sRivalTrainerProgressionSquirtle[] = {
    TRAINER_RIVAL_OAKS_LAB_SQUIRTLE,
    TRAINER_RIVAL_ROUTE22_EARLY_SQUIRTLE,
    TRAINER_RIVAL_CERULEAN_SQUIRTLE,
    TRAINER_RIVAL_SS_ANNE_SQUIRTLE,
    TRAINER_RIVAL_POKEMON_TOWER_SQUIRTLE,
    TRAINER_RIVAL_SILPH_SQUIRTLE,
    TRAINER_RIVAL_ROUTE22_LATE_SQUIRTLE,
    TRAINER_CHAMPION_FIRST_SQUIRTLE,
};

static const u16 sRivalTrainerProgressionBulbasaur[] = {
    TRAINER_RIVAL_OAKS_LAB_BULBASAUR,
    TRAINER_RIVAL_ROUTE22_EARLY_BULBASAUR,
    TRAINER_RIVAL_CERULEAN_BULBASAUR,
    TRAINER_RIVAL_SS_ANNE_BULBASAUR,
    TRAINER_RIVAL_POKEMON_TOWER_BULBASAUR,
    TRAINER_RIVAL_SILPH_BULBASAUR,
    TRAINER_RIVAL_ROUTE22_LATE_BULBASAUR,
    TRAINER_CHAMPION_FIRST_BULBASAUR,
};

static const u16 sRivalTrainerProgressionCharmander[] = {
    TRAINER_RIVAL_OAKS_LAB_CHARMANDER,
    TRAINER_RIVAL_ROUTE22_EARLY_CHARMANDER,
    TRAINER_RIVAL_CERULEAN_CHARMANDER,
    TRAINER_RIVAL_SS_ANNE_CHARMANDER,
    TRAINER_RIVAL_POKEMON_TOWER_CHARMANDER,
    TRAINER_RIVAL_SILPH_CHARMANDER,
    TRAINER_RIVAL_ROUTE22_LATE_CHARMANDER,
    TRAINER_CHAMPION_FIRST_CHARMANDER,
};

static void ResetNpcTrainerTypeLevels(void);
static void EnsureNpcTrainerTypeLevels(void);
static void ComputeTrainerTypeLevels(u16 trainerId, u8 *levels);
static void ComputeTrainerTypeLevelsBase(u16 trainerId, u8 *levels);
static void EnsureRivalObedienceMinimums(u16 trainerId, u8 *levels);
static void ApplyRivalStarterBoost(u16 trainerId, u8 *levels);
static bool8 TryLoadPrecomputedTrainerTypeLevels(u16 trainerId, u8 *levels);
static u32 ConvertNpcRawLevelToExp(s16 rawLevel);
static void GetTrainerMonResolvedMoves(u16 trainerId, u8 monIndex, u16 species, u8 level, u16 *moves);
static u32 GetTrainerTypeVarianceSeed(u16 trainerId, u8 trainerClass, u8 typeId);
static bool8 GetRivalProgressionInfo(u16 trainerId, const u16 **progression, u8 *count, u8 *index);
static bool8 IsBossTrainerClass(u8 trainerClass);
static bool8 IsRivalTrainerClass(u8 trainerClass);
static u8 CalculateTrainerTypeBonusLevelFromSource(const u8 *levelSource, u8 type1, u8 type2, u8 moveType);
static u8 CalculateTrainerTypeAverageLevelFromSource(const u8 *levelSource, u8 type1, u8 type2);
static u8 CalculateTrainerTypeObedienceLevelFromSource(const u8 *levelSource, u8 type1, u8 type2, u8 moveType);
static u8 GetTrainerTypeLearnLevelBonusFromSource(const u8 *levelSource, u8 type1, u8 type2);
static u8 CountPlayerPartyMonsMatchingTypes(u8 type1, u8 type2);
static u8 GetPlayerPartySynergyMultiplierTenthsForTypes(u8 type1, u8 type2);
static u8 ApplyTenthsMultiplierToU8(u8 value, u8 multiplierTenths);
static u16 ApplyTenthsMultiplierToU16(u16 value, u8 multiplierTenths);

// Positional array indexed by TYPE_* constant values (0-17)
static const u8 sTrainerTypeTier[NUMBER_OF_MON_TYPES] = {
    TRAINER_TYPE_TIER_MEDIUM,      /* 0  Normal   */
    TRAINER_TYPE_TIER_MEDIUM,      /* 1  Fighting */
    TRAINER_TYPE_TIER_MEDIUM,      /* 2  Flying   */
    TRAINER_TYPE_TIER_MEDIUM,      /* 3  Poison   */
    TRAINER_TYPE_TIER_MEDIUM,      /* 4  Ground   */
    TRAINER_TYPE_TIER_MEDIUM,      /* 5  Rock     */
    TRAINER_TYPE_TIER_FAST,        /* 6  Bug      */
    TRAINER_TYPE_TIER_MEDIUM,      /* 7  Ghost    */
    TRAINER_TYPE_TIER_MEDIUM,      /* 8  Steel    */
    TRAINER_TYPE_TIER_MEDIUM,      /* 9  Mystery  */
    TRAINER_TYPE_TIER_MEDIUM_SLOW, /* 10 Fire     */
    TRAINER_TYPE_TIER_MEDIUM_SLOW, /* 11 Water    */
    TRAINER_TYPE_TIER_MEDIUM_SLOW, /* 12 Grass    */
    TRAINER_TYPE_TIER_MEDIUM_SLOW, /* 13 Electric */
    TRAINER_TYPE_TIER_SLOW,        /* 14 Psychic  */
    TRAINER_TYPE_TIER_MEDIUM_SLOW, /* 15 Ice      */
    TRAINER_TYPE_TIER_SLOW,        /* 16 Dragon   */
    TRAINER_TYPE_TIER_MEDIUM,      /* 17 Dark     */
};

// Fast tier — Bug — max XP 2500
static const u16 sThreshold_fast[101] = {
         0,   3,   7,  13,  20,  28,  37,  47,  57,  69,   // Levels 1-10
        80,  93, 106, 119, 133, 147, 162, 178, 194, 210,   // Levels 11-20
       227, 244, 262, 280, 298, 317, 336, 356, 376, 396,   // Levels 21-30
       417, 438, 459, 481, 503, 526, 548, 571, 595, 618,   // Levels 31-40
       642, 666, 691, 716, 741, 766, 792, 818, 844, 871,   // Levels 41-50
       897, 924, 952, 979,1007,1035,1064,1092,1121,1150,   // Levels 51-60
      1180,1209,1239,1269,1299,1330,1361,1392,1423,1455,   // Levels 61-70
      1486,1518,1551,1583,1616,1648,1682,1715,1748,1782,   // Levels 71-80
      1816,1850,1885,1919,1954,1989,2024,2060,2095,2131,   // Levels 81-90
      2167,2203,2240,2276,2313,2350,2387,2425,2462,2500,   // Levels 91-100
      2500  // sentinel
};

// Medium tier — Fighting/Flying/Poison/Ground/Rock/Ghost/Steel/Mystery/Dark — max XP 5000
static const u16 sThreshold_medium[101] = {
         0,   5,  14,  26,  41,  57,  75,  94, 115, 137,   // Levels 1-10
       161, 185, 211, 238, 266, 295, 325, 356, 388, 420,   // Levels 11-20
       454, 488, 524, 560, 597, 634, 673, 712, 752, 793,   // Levels 21-30
       834, 876, 919, 962,1006,1051,1096,1142,1189,1236,   // Levels 31-40
      1284,1333,1382,1431,1481,1532,1584,1636,1688,1741,   // Levels 41-50
      1795,1849,1903,1959,2014,2070,2127,2184,2242,2300,   // Levels 51-60
      2359,2418,2478,2538,2599,2660,2722,2784,2846,2909,   // Levels 61-70
      2973,3037,3101,3166,3231,3297,3363,3430,3497,3564,   // Levels 71-80
      3632,3700,3769,3838,3908,3978,4048,4119,4190,4262,   // Levels 81-90
      4334,4406,4479,4552,4626,4700,4774,4849,4924,5000,   // Levels 91-100
      5000  // sentinel
};

// Medium-Slow tier — Fire/Water/Grass/Electric/Ice — max XP 8000
static const u16 sThreshold_medium_slow[101] = {
         0,   8,  23,  42,  65,  91, 119, 150, 184, 219,   // Levels 1-10
       257, 296, 338, 381, 425, 472, 520, 569, 620, 673,   // Levels 11-20
       726, 782, 838, 896, 955,1015,1077,1139,1203,1268,   // Levels 21-30
      1335,1402,1470,1540,1610,1682,1754,1828,1902,1978,   // Levels 31-40
      2055,2132,2211,2290,2370,2452,2534,2617,2701,2786,   // Levels 41-50
      2871,2958,3045,3134,3223,3313,3403,3495,3587,3681,   // Levels 51-60
      3775,3869,3965,4061,4158,4256,4355,4454,4554,4655,   // Levels 61-70
      4756,4859,4962,5065,5170,5275,5381,5487,5595,5703,   // Levels 71-80
      5811,5921,6031,6141,6253,6365,6477,6590,6704,6819,   // Levels 81-90
      6934,7050,7167,7284,7402,7520,7639,7759,7879,8000,   // Levels 91-100
      8000  // sentinel
};

// Slow tier — Psychic, Dragon — max XP 12000
static const u16 sThreshold_slow[101] = {
         0,  12,  34,  63,  97, 136, 179, 226, 276, 329,   // Levels 1-10
       385, 444, 506, 571, 638, 708, 780, 854, 930,1009,   // Levels 11-20
      1090,1172,1257,1344,1432,1523,1615,1709,1805,1903,   // Levels 21-30
      2002,2103,2205,2309,2415,2522,2631,2742,2854,2967,   // Levels 31-40
      3082,3198,3316,3435,3556,3677,3800,3924,4050,4176,   // Levels 41-50
      4304,4433,4563,4694,4826,4959,5094,5229,5365,5503,   // Levels 51-60
      5641,5781,5921,6063,6206,6349,6494,6640,6787,6934,   // Levels 61-70
      7083,7233,7383,7535,7688,7841,7996,8151,8308,8465,   // Levels 71-80
      8624,8783,8943,9105,9267,9430,9594,9759,9925,10092,  // Levels 81-90
     10260,10429,10599,10769,10941,11113,11286,11460,11635,11810,// 91-100
     12000  // sentinel
};

static const u16 * const sTrainerTypeTierTable[4] = {
    sThreshold_fast,
    sThreshold_medium,
    sThreshold_medium_slow,
    sThreshold_slow
};

// Returns the cumulative XP threshold to reach 'level' for the given type.
// Accessed as sTable[level - 1], where level is 1-based.
u16 GetTrainerTypeLevelThreshold(u8 typeId, u8 level)
{
    const u16 *table;
    u32 threshold;
    if (level == 0)
        return 0;
    if (level > 100)
        level = 100;
    if (typeId >= NUMBER_OF_MON_TYPES)
        typeId = TYPE_NORMAL;
    table = sTrainerTypeTierTable[sTrainerTypeTier[typeId]];
    threshold = table[level - 1];
    threshold *= TRAINER_TYPE_XP_SCALE;
    if (threshold > 65535)
        threshold = 65535;
    return (u16)threshold;
}

// Calculate trainer type level from current XP for the given type
static u8 CalculateTrainerTypeLevel(u8 typeId, u32 exp)
{
    u8 level = 1;
    while (level < 100 && exp >= GetTrainerTypeLevelThreshold(typeId, level + 1))
        level++;
    return level;
}

static void UpdateTrainerTypeLevel(u8 typeId)
{
    u32 exp;
    u8 newLevel;

    if (typeId >= NUMBER_OF_MON_TYPES)
        return;

    exp = gSaveBlock2Ptr->trainerTypeExp[typeId];
    newLevel = CalculateTrainerTypeLevel(typeId, exp);
    gSaveBlock2Ptr->trainerTypeLevels[typeId] = newLevel;
}

static void AwardTrainerTypeExpInternal(u8 typeId, u16 exp)
{
    u8 oldLevel;
    u8 newLevel;
    u32 totalExp;

    oldLevel = gSaveBlock2Ptr->trainerTypeLevels[typeId];
    gSaveBlock2Ptr->trainerTypeExp[typeId] += exp;
    UpdateTrainerTypeLevel(typeId);
    newLevel = gSaveBlock2Ptr->trainerTypeLevels[typeId];
    totalExp = gSaveBlock2Ptr->trainerTypeExp[typeId];

    sBattleSummaryExpGained[typeId] += exp;
    if (newLevel > oldLevel)
        sBattleSummaryLevelsGained[typeId] += newLevel - oldLevel;

    TRAINER_TYPE_DEBUG_LOGF("XP type=%u +%u total=%lu level=%u->%u\n",
                            typeId,
                            exp,
                            (unsigned long)totalExp,
                            oldLevel,
                            newLevel);
}

void AwardTrainerTypeExpToSpeciesTypes(u16 species, u16 expPerType)
{
    u8 type1;
    u8 type2;

    if (species == SPECIES_NONE)
        return;

    type1 = gSpeciesInfo[species].types[0];
    type2 = gSpeciesInfo[species].types[1];

    // Award per species type slot so pure-typed species receive double credit.
    if (type1 < NUMBER_OF_MON_TYPES && type1 != TYPE_MYSTERY)
        AwardTrainerTypeExpInternal(type1, expPerType);
    if (type2 < NUMBER_OF_MON_TYPES && type2 != TYPE_MYSTERY)
        AwardTrainerTypeExpInternal(type2, expPerType);
}

void AwardTrainerTypeExp(u8 typeId, u16 exp)
{
    u8 multiplierTenths;

    if (typeId >= NUMBER_OF_MON_TYPES || exp == 0)
        return;

    multiplierTenths = GetPlayerPartySynergyMultiplierTenthsForTypes(typeId, TYPE_MYSTERY);
    exp = ApplyTenthsMultiplierToU16(exp, multiplierTenths);

    AwardTrainerTypeExpInternal(typeId, exp);
}

void AwardTrainerTypeExpQuarters(u8 typeId, u8 quarterExp)
{
    u8 multiplierTenths;
    u16 wholeExp;
    u8 remainder;

    if (typeId >= NUMBER_OF_MON_TYPES || quarterExp == 0)
        return;

    multiplierTenths = GetPlayerPartySynergyMultiplierTenthsForTypes(typeId, TYPE_MYSTERY);
    quarterExp = ApplyTenthsMultiplierToU8(quarterExp, multiplierTenths);

    wholeExp = quarterExp / 4;
    remainder = quarterExp % 4;

    if (wholeExp != 0)
        AwardTrainerTypeExpInternal(typeId, wholeExp);

    sBattleSummaryQuarterExpRemainder[typeId] += remainder;
    while (sBattleSummaryQuarterExpRemainder[typeId] >= 4)
    {
        sBattleSummaryQuarterExpRemainder[typeId] -= 4;
        AwardTrainerTypeExpInternal(typeId, 1);
    }
}

void AwardTrainerTypeEncounterExp(u16 species, u32 otId, u32 personality)
{
    if (species == SPECIES_NONE)
        return;

    // First-seen XP is handled by HandleSetPokedexFlag in pokemon.c.
    // Only award shiny bonus here.
    if (GET_SHINY_VALUE(otId, personality) < SHINY_ODDS)
        AwardTrainerTypeExpToSpeciesTypes(species, 15);
}

void TrainerTypeBattleSummary_Reset(void)
{
    u8 i;

    for (i = 0; i < NUMBER_OF_MON_TYPES; i++)
    {
        sBattleSummaryExpGained[i] = 0;
        sBattleSummaryLevelsGained[i] = 0;
        sBattleSummaryQuarterExpRemainder[i] = 0;
    }

    ResetNpcTrainerTypeLevels();
}

bool8 TrainerTypeBattleSummary_HasPending(void)
{
    u8 i;

    for (i = 0; i < NUMBER_OF_MON_TYPES; i++)
    {
        if (sBattleSummaryExpGained[i] != 0 || sBattleSummaryLevelsGained[i] != 0)
            return TRUE;
    }

    return FALSE;
}

bool8 TrainerTypeBattleSummary_GetNext(u8 *typeId, u16 *expGained, u8 *levelsGained)
{
    u8 i;

    for (i = 0; i < NUMBER_OF_MON_TYPES; i++)
    {
        if (sBattleSummaryExpGained[i] != 0 || sBattleSummaryLevelsGained[i] != 0)
        {
            *typeId = i;
            *expGained = sBattleSummaryExpGained[i];
            *levelsGained = sBattleSummaryLevelsGained[i];
            sBattleSummaryExpGained[i] = 0;
            sBattleSummaryLevelsGained[i] = 0;
            return TRUE;
        }
    }

    return FALSE;
}

void InitializeTrainerTypeLevels(void)
{
    u8 i;
    for (i = 0; i < NUMBER_OF_MON_TYPES; i++)
    {
        gSaveBlock2Ptr->trainerTypeExp[i] = 0;
        gSaveBlock2Ptr->trainerTypeLevels[i] = 1;
    }
}

// Grant starter-based trainer type level boost.
// Called via special after the player picks their starter.
// Reads VAR_STARTER_MON: 0=Bulbasaur, 1=Squirtle, 2=Charmander.
void GrantStarterTypeBoost(void)
{
    u16 starter = VarGet(VAR_STARTER_MON);

    switch (starter)
    {
    case 0: // Bulbasaur: +3 Grass, +3 Poison
        AwardTrainerTypeExp(TYPE_GRASS, GetTrainerTypeLevelThreshold(TYPE_GRASS, 4));
        AwardTrainerTypeExp(TYPE_POISON, GetTrainerTypeLevelThreshold(TYPE_POISON, 4));
        break;
    case 1: // Squirtle: +5 Water
        AwardTrainerTypeExp(TYPE_WATER, GetTrainerTypeLevelThreshold(TYPE_WATER, 6));
        break;
    case 2: // Charmander: +5 Fire
        AwardTrainerTypeExp(TYPE_FIRE, GetTrainerTypeLevelThreshold(TYPE_FIRE, 6));
        break;
    }
}

void UpdateTrainerTypeLevels(void)
{
    u8 i;
    for (i = 0; i < NUMBER_OF_MON_TYPES; i++)
        gSaveBlock2Ptr->trainerTypeLevels[i] = CalculateTrainerTypeLevel(i, gSaveBlock2Ptr->trainerTypeExp[i]);
}

// ---------------------------------------------------------------------------
// Combat and obedience helper functions
// ---------------------------------------------------------------------------

// Returns the friendship-based obedience modifier (positive = more obedient).
// Formula: ceil((friendship - 70) / 10), range roughly [-7, +19].
// For Frustration, the modifier is inverted (low friendship = bonus obedience).
s8 GetFriendshipObedienceModifier(u8 friendship, bool8 isFrustrationMove)
{
    // Base friendship for most species is 70, so use that as the neutral
    // midpoint.  A freshly caught Pokemon starts at +0; friendship gained
    // through gameplay provides a bonus, not a penalty.
    s16 diff = (s16)friendship - 70;
    s8 mod;
    // Integer ceiling division for signed values
    if (diff >= 0)
        mod = (s8)((diff + 9) / 10);
    else
        mod = (s8)(diff / 10);
    if (isFrustrationMove)
        mod = -mod;
    return mod;
}

// Returns the extra friendship growth bonus for one type.
// Equals floor(type_level / 10), so a level-10 type adds +1, level-100 adds +10.
u8 GetFriendshipGrowthBonus(u8 typeId)
{
    u8 bonus;

    if (typeId >= NUMBER_OF_MON_TYPES)
        return 0;

    bonus = gSaveBlock2Ptr->trainerTypeLevels[typeId] / 10;
    return ApplyTenthsMultiplierToU8(bonus, GetPlayerPartySynergyMultiplierTenthsForTypes(typeId, TYPE_MYSTERY));
}

u8 GetTrainerTypeLearnLevelBonus(u8 type1, u8 type2)
{
    u8 bonus = GetTrainerTypeLearnLevelBonusFromSource(gSaveBlock2Ptr->trainerTypeLevels, type1, type2);
    return ApplyTenthsMultiplierToU8(bonus, GetPlayerPartySynergyMultiplierTenthsForTypes(type1, type2));
}

// Returns the averaged trainer level across three slots that characterise an
// attacker or defender in a move exchange.
// type1 and type2 are the Pokemon's types; moveType is the move being used.
// Pure-typed species occupy both species slots so they retain a 2/3 weighting.
u8 GetTrainerTypeBonusLevel(u8 type1, u8 type2, u8 moveType)
{
    return CalculateTrainerTypeBonusLevelFromSource(gSaveBlock2Ptr->trainerTypeLevels, type1, type2, moveType);
}

u8 GetTrainerTypeBonusLevelByBattlerSide(u8 battlerSide, u8 type1, u8 type2, u8 moveType)
{
    if (battlerSide == B_SIDE_PLAYER)
        return CalculateTrainerTypeBonusLevelFromSource(gSaveBlock2Ptr->trainerTypeLevels, type1, type2, moveType);

    EnsureNpcTrainerTypeLevels();
    return CalculateTrainerTypeBonusLevelFromSource(sNpcTrainerTypeLevels, type1, type2, moveType);
}

u8 GetTrainerTypeOffenseBonusLevelByBattlerSide(u8 battlerSide, u8 type1, u8 type2, u8 moveType)
{
    u8 baseLevel;

    if (battlerSide == B_SIDE_PLAYER)
    {
        baseLevel = CalculateTrainerTypeBonusLevelFromSource(gSaveBlock2Ptr->trainerTypeLevels, type1, type2, moveType);
        return ApplyTenthsMultiplierToU8(baseLevel, GetPlayerPartySynergyMultiplierTenthsForTypes(moveType, TYPE_MYSTERY));
    }

    EnsureNpcTrainerTypeLevels();
    return CalculateTrainerTypeBonusLevelFromSource(sNpcTrainerTypeLevels, type1, type2, moveType);
}

u8 GetTrainerTypeDefenseBonusLevelByBattlerSide(u8 battlerSide, u8 type1, u8 type2, u8 moveType)
{
    u8 baseLevel;

    if (battlerSide == B_SIDE_PLAYER)
    {
        baseLevel = CalculateTrainerTypeBonusLevelFromSource(gSaveBlock2Ptr->trainerTypeLevels, type1, type2, moveType);
        return ApplyTenthsMultiplierToU8(baseLevel, GetPlayerPartySynergyMultiplierTenthsForTypes(type1, type2));
    }

    EnsureNpcTrainerTypeLevels();
    return CalculateTrainerTypeBonusLevelFromSource(sNpcTrainerTypeLevels, type1, type2, moveType);
}

u8 GetMatchupCompositeByBattlerSide(u8 battlerSide, u8 moveType, u8 defType1, u8 defType2)
{
    // Reuse the existing 3-slot average: slot1=defType1, slot2=defType2, slot3=moveType.
    // This measures a trainer's combined knowledge of the three types in play
    // during a type effectiveness interaction.
    if (battlerSide == B_SIDE_PLAYER)
        return CalculateTrainerTypeBonusLevelFromSource(gSaveBlock2Ptr->trainerTypeLevels, defType1, defType2, moveType);

    EnsureNpcTrainerTypeLevels();
    return CalculateTrainerTypeBonusLevelFromSource(sNpcTrainerTypeLevels, defType1, defType2, moveType);
}

u8 GetTrainerTypeObedienceLevelByBattlerSide(u8 battlerSide, u8 type1, u8 type2, u8 moveType)
{
    u8 baseLevel;

    if (battlerSide == B_SIDE_PLAYER)
    {
        baseLevel = CalculateTrainerTypeObedienceLevelFromSource(gSaveBlock2Ptr->trainerTypeLevels, type1, type2, moveType);
        return ApplyTenthsMultiplierToU8(baseLevel, GetPlayerPartySynergyMultiplierTenthsForTypes(type1, type2));
    }

    EnsureNpcTrainerTypeLevels();
    return CalculateTrainerTypeObedienceLevelFromSource(sNpcTrainerTypeLevels, type1, type2, moveType);
}

u8 GetTrainerTypeObedienceLevelByTrainer(u16 trainerId, u8 type1, u8 type2, u8 moveType)
{
    u8 levels[NUMBER_OF_MON_TYPES];

    ComputeTrainerTypeLevels(trainerId, levels);
    return CalculateTrainerTypeObedienceLevelFromSource(levels, type1, type2, moveType);
}

void GetTrainerMonBattleMoves(u16 trainerId, u8 monIndex, u16 species, u8 level, u16 *moves)
{
    const struct Trainer *trainer;
    u8 i;

    trainer = &gTrainers[trainerId];
    for (i = 0; i < MAX_MON_MOVES; i++)
        moves[i] = MOVE_NONE;

    switch (trainer->partyFlags)
    {
    case F_TRAINER_PARTY_CUSTOM_MOVESET:
        for (i = 0; i < MAX_MON_MOVES; i++)
            moves[i] = trainer->party.NoItemCustomMoves[monIndex].moves[i];
        break;
    case F_TRAINER_PARTY_CUSTOM_MOVESET | F_TRAINER_PARTY_HELD_ITEM:
        for (i = 0; i < MAX_MON_MOVES; i++)
            moves[i] = trainer->party.ItemCustomMoves[monIndex].moves[i];
        break;
    default:
    {
        struct Pokemon tempMon;
        u8 trainerLevels[NUMBER_OF_MON_TYPES];
        u8 effectiveLevel;

        ComputeTrainerTypeLevels(trainerId, trainerLevels);
        effectiveLevel = level + GetTrainerTypeLearnLevelBonusFromSource(
            trainerLevels,
            gSpeciesInfo[species].types[0],
            gSpeciesInfo[species].types[1]);
        if (effectiveLevel > MAX_LEVEL)
            effectiveLevel = MAX_LEVEL;

        CreateMon(&tempMon, species, effectiveLevel, 0, TRUE, 0, OT_ID_PLAYER_ID, 0);
        for (i = 0; i < MAX_MON_MOVES; i++)
            moves[i] = GetMonData(&tempMon, MON_DATA_MOVE1 + i, NULL);
        break;
    }
    }
}

static u8 CalculateTrainerTypeBonusLevelFromSource(const u8 *levelSource, u8 type1, u8 type2, u8 moveType)
{
    u32 sum = 0;

    if (type1 >= NUMBER_OF_MON_TYPES || type1 == TYPE_MYSTERY)
        return 0;

    sum += levelSource[type1];

    if (type2 < NUMBER_OF_MON_TYPES && type2 != TYPE_MYSTERY && type2 != type1)
        sum += levelSource[type2];
    else
        sum += levelSource[type1];

    if (moveType < NUMBER_OF_MON_TYPES && moveType != TYPE_MYSTERY)
        sum += levelSource[moveType];

    return (u8)(sum / 3);
}

static u8 CalculateTrainerTypeAverageLevelFromSource(const u8 *levelSource, u8 type1, u8 type2)
{
    u32 sum;
    u8 count;

    if (type1 >= NUMBER_OF_MON_TYPES || type1 == TYPE_MYSTERY)
        return 0;

    sum = levelSource[type1];
    count = 1;

    if (type2 < NUMBER_OF_MON_TYPES && type2 != TYPE_MYSTERY && type2 != type1)
    {
        sum += levelSource[type2];
        count++;
    }

    return (u8)(sum / count);
}

static u8 CalculateTrainerTypeObedienceLevelFromSource(const u8 *levelSource, u8 type1, u8 type2, u8 moveType)
{
    u32 sum = 0;

    // Add type1
    if (type1 < NUMBER_OF_MON_TYPES && type1 != TYPE_MYSTERY)
    {
        sum += levelSource[type1];
    }

    // Add type2 (or duplicate type1 if single-type for 2/3 weighting)
    if (type2 < NUMBER_OF_MON_TYPES && type2 != TYPE_MYSTERY && type2 != type1)
    {
        sum += levelSource[type2];
    }
    else if (type1 < NUMBER_OF_MON_TYPES && type1 != TYPE_MYSTERY)
    {
        // Single-type: count type1 twice (2/3 weighting vs move type's 1/3)
        sum += levelSource[type1];
    }

    // Add moveType (1/3 weighting)
    if (moveType < NUMBER_OF_MON_TYPES && moveType != TYPE_MYSTERY)
    {
        sum += levelSource[moveType];
    }

    return (u8)(sum / 3);
}

static u8 GetTrainerTypeLearnLevelBonusFromSource(const u8 *levelSource, u8 type1, u8 type2)
{
    return CalculateTrainerTypeAverageLevelFromSource(levelSource, type1, type2) / 10;
}

static void ResetNpcTrainerTypeLevels(void)
{
    u8 i;

    sNpcTrainerTypeLevelsValid = FALSE;
    sNpcTrainerTypeLevelsTrainerId = 0xFFFF;

    for (i = 0; i < NUMBER_OF_MON_TYPES; i++)
        sNpcTrainerTypeLevels[i] = 1;
}

static void EnsureNpcTrainerTypeLevels(void)
{
    if (!(gBattleTypeFlags & BATTLE_TYPE_TRAINER)
        || (gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_TRAINER_TOWER | BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_POKEDUDE))
        || gTrainerBattleOpponent_A == TRAINER_SECRET_BASE)
    {
        ResetNpcTrainerTypeLevels();
        return;
    }

    if (sNpcTrainerTypeLevelsValid && sNpcTrainerTypeLevelsTrainerId == gTrainerBattleOpponent_A)
        return;

    ComputeTrainerTypeLevels(gTrainerBattleOpponent_A, sNpcTrainerTypeLevels);
    sNpcTrainerTypeLevelsTrainerId = gTrainerBattleOpponent_A;
    sNpcTrainerTypeLevelsValid = TRUE;
}

static void ComputeTrainerTypeLevels(u16 trainerId, u8 *levels)
{
    const u16 *progression;
    u8 progressionCount;
    u8 progressionIndex;
    u8 i;
    u8 j;
    u8 tempLevels[NUMBER_OF_MON_TYPES];

    if (TryLoadPrecomputedTrainerTypeLevels(trainerId, levels))
    {
        ApplyRivalStarterBoost(trainerId, levels);
        EnsureRivalObedienceMinimums(trainerId, levels);
        return;
    }

    if (!GetRivalProgressionInfo(trainerId, &progression, &progressionCount, &progressionIndex))
    {
        ComputeTrainerTypeLevelsBase(trainerId, levels);
        return;
    }

    for (i = 0; i < NUMBER_OF_MON_TYPES; i++)
        levels[i] = 1;

    for (i = 0; i <= progressionIndex && i < progressionCount; i++)
    {
        ComputeTrainerTypeLevelsBase(progression[i], tempLevels);
        for (j = 0; j < NUMBER_OF_MON_TYPES; j++)
        {
            if (tempLevels[j] > levels[j])
                levels[j] = tempLevels[j];
        }
    }

    ApplyRivalStarterBoost(trainerId, levels);
    EnsureRivalObedienceMinimums(trainerId, levels);
}

static void ApplyRivalStarterBoost(u16 trainerId, u8 *levels)
{
    const u16 *progression;
    u8 progressionCount;
    u8 progressionIndex;

    if (!GetRivalProgressionInfo(trainerId, &progression, &progressionCount, &progressionIndex))
        return;

    // Squirtle progression: rival has Squirtle -> +5 Water
    // Bulbasaur progression: rival has Bulbasaur -> +3 Grass, +3 Poison
    // Charmander progression: rival has Charmander -> +5 Fire
    if (progression == sRivalTrainerProgressionSquirtle)
    {
        if (levels[TYPE_WATER] < 6)
            levels[TYPE_WATER] = 6;
    }
    else if (progression == sRivalTrainerProgressionBulbasaur)
    {
        if (levels[TYPE_GRASS] < 4)
            levels[TYPE_GRASS] = 4;
        if (levels[TYPE_POISON] < 4)
            levels[TYPE_POISON] = 4;
    }
    else if (progression == sRivalTrainerProgressionCharmander)
    {
        if (levels[TYPE_FIRE] < 6)
            levels[TYPE_FIRE] = 6;
    }
}

static void EnsureRivalObedienceMinimums(u16 trainerId, u8 *levels)
{
    const struct Trainer *trainer;
    u8 partySize;
    u8 i;
    const u16 *progression;
    u8 progressionCount;
    u8 progressionIndex;

    if (!GetRivalProgressionInfo(trainerId, &progression, &progressionCount, &progressionIndex))
        return;

    trainer = &gTrainers[trainerId];
    partySize = trainer->partySize;
    for (i = 0; i < partySize; i++)
    {
        u16 species;
        u8 level;
        u8 requiredLevel;
        u8 type1;
        u8 type2;

        switch (trainer->partyFlags)
        {
        case 0:
            species = trainer->party.NoItemDefaultMoves[i].species;
            level = trainer->party.NoItemDefaultMoves[i].lvl;
            break;
        case F_TRAINER_PARTY_CUSTOM_MOVESET:
            species = trainer->party.NoItemCustomMoves[i].species;
            level = trainer->party.NoItemCustomMoves[i].lvl;
            break;
        case F_TRAINER_PARTY_HELD_ITEM:
            species = trainer->party.ItemDefaultMoves[i].species;
            level = trainer->party.ItemDefaultMoves[i].lvl;
            break;
        case F_TRAINER_PARTY_CUSTOM_MOVESET | F_TRAINER_PARTY_HELD_ITEM:
            species = trainer->party.ItemCustomMoves[i].species;
            level = trainer->party.ItemCustomMoves[i].lvl;
            break;
        default:
            species = SPECIES_NONE;
            level = 1;
            break;
        }

        if (species == SPECIES_NONE)
            continue;

        requiredLevel = (level + 1) / 2;
        type1 = gSpeciesInfo[species].types[0];
        type2 = gSpeciesInfo[species].types[1];

        if (type1 < NUMBER_OF_MON_TYPES && type1 != TYPE_MYSTERY && levels[type1] < requiredLevel)
            levels[type1] = requiredLevel;

        if (type2 < NUMBER_OF_MON_TYPES && type2 != TYPE_MYSTERY && type2 != type1 && levels[type2] < requiredLevel)
            levels[type2] = requiredLevel;
    }
}

static bool8 TryLoadPrecomputedTrainerTypeLevels(u16 trainerId, u8 *levels)
{
    s16 lo;
    s16 hi;

    if (gNpcTrainerTypeLevelEntryCount == 0)
        return FALSE;

    lo = 0;
    hi = gNpcTrainerTypeLevelEntryCount - 1;
    while (lo <= hi)
    {
        s16 mid = lo + ((hi - lo) / 2);
        u16 midTrainerId = gNpcTrainerTypeLevelEntries[mid].trainerId;

        if (trainerId == midTrainerId)
        {
            memcpy(levels, gNpcTrainerTypeLevelEntries[mid].levels, NUMBER_OF_MON_TYPES);
            return TRUE;
        }

        if (trainerId < midTrainerId)
            hi = mid - 1;
        else
            lo = mid + 1;
    }

    return FALSE;
}

static u32 ConvertNpcRawLevelToExp(s16 rawLevel)
{
    u32 exp;

    if (rawLevel < 0)
        rawLevel = 0;

    exp = (u32)rawLevel * NPC_TYPE_RAW_TO_EXP_MULTIPLIER;
    if (exp > 65535)
        exp = 65535;

    return exp;
}

static void ComputeTrainerTypeLevelsBase(u16 trainerId, u8 *levels)
{
    const struct Trainer *trainer;
    s16 rawLevels[NUMBER_OF_MON_TYPES];
    u8 speciesTypeCounts[NUMBER_OF_MON_TYPES];
    u8 moveTypeCounts[NUMBER_OF_MON_TYPES];
    u16 moves[MAX_MON_MOVES];
    u8 dominantCount;
    u8 minorCount;
    u16 totalLevel;
    u8 avgLevel;
    u8 partySize;
    u8 i;
    u8 j;

    trainer = &gTrainers[trainerId];
    partySize = trainer->partySize;
    totalLevel = 0;

    for (i = 0; i < NUMBER_OF_MON_TYPES; i++)
    {
        rawLevels[i] = 0;
        speciesTypeCounts[i] = 0;
        moveTypeCounts[i] = 0;
        levels[i] = 1;
    }

    if (partySize == 0)
        return;

    for (i = 0; i < partySize; i++)
    {
        u16 species;
        u8 level;
        u8 type1;
        u8 type2;

        switch (trainer->partyFlags)
        {
        case 0:
            species = trainer->party.NoItemDefaultMoves[i].species;
            level = trainer->party.NoItemDefaultMoves[i].lvl;
            break;
        case F_TRAINER_PARTY_CUSTOM_MOVESET:
            species = trainer->party.NoItemCustomMoves[i].species;
            level = trainer->party.NoItemCustomMoves[i].lvl;
            break;
        case F_TRAINER_PARTY_HELD_ITEM:
            species = trainer->party.ItemDefaultMoves[i].species;
            level = trainer->party.ItemDefaultMoves[i].lvl;
            break;
        case F_TRAINER_PARTY_CUSTOM_MOVESET | F_TRAINER_PARTY_HELD_ITEM:
            species = trainer->party.ItemCustomMoves[i].species;
            level = trainer->party.ItemCustomMoves[i].lvl;
            break;
        default:
            species = SPECIES_NONE;
            level = 1;
            break;
        }

        if (species == SPECIES_NONE)
            continue;

        totalLevel += level;
        type1 = gSpeciesInfo[species].types[0];
        type2 = gSpeciesInfo[species].types[1];

        if (type1 < NUMBER_OF_MON_TYPES && type1 != TYPE_MYSTERY)
        {
            rawLevels[type1] += level * 2 + 2;
            speciesTypeCounts[type1]++;
        }
        if (type2 < NUMBER_OF_MON_TYPES && type2 != TYPE_MYSTERY && type2 != type1)
        {
            rawLevels[type2] += level + 1;
            speciesTypeCounts[type2]++;
        }

        GetTrainerMonResolvedMoves(trainerId, i, species, level, moves);
        for (j = 0; j < MAX_MON_MOVES; j++)
        {
            u16 move;
            u8 moveType;
            s16 moveWeight;

            move = moves[j];
            if (move == MOVE_NONE)
                continue;

            moveType = gBattleMoves[move].type;
            if (moveType >= NUMBER_OF_MON_TYPES || moveType == TYPE_MYSTERY)
                continue;

            if (gBattleMoves[move].power == 0)
                moveWeight = level / 8;
            else if (gBattleMoves[move].power >= 80)
                moveWeight = level / 4;
            else
                moveWeight = level / 5;

            if (moveWeight < 1)
                moveWeight = 1;
            if (moveType == type1 || moveType == type2)
                moveWeight++;

            rawLevels[moveType] += moveWeight;
            moveTypeCounts[moveType]++;
        }
    }

    avgLevel = totalLevel / partySize;
    if (avgLevel == 0)
        avgLevel = 1;

    dominantCount = 0;
    minorCount = 0;
    for (i = 0; i < NUMBER_OF_MON_TYPES; i++)
    {
        if (speciesTypeCounts[i] > dominantCount)
        {
            minorCount = dominantCount;
            dominantCount = speciesTypeCounts[i];
        }
        else if (speciesTypeCounts[i] > minorCount)
        {
            minorCount = speciesTypeCounts[i];
        }
    }

    for (i = 0; i < NUMBER_OF_MON_TYPES; i++)
    {
        u8 concentration;
        s16 variance;

        concentration = 0;
        if (speciesTypeCounts[i] != 0)
            concentration = (speciesTypeCounts[i] * 100) / partySize;

        if (speciesTypeCounts[i] >= 2)
            rawLevels[i] += (speciesTypeCounts[i] * avgLevel) / 2;

        if (concentration >= 75)
            rawLevels[i] += avgLevel + 4;
        else if (concentration >= 50)
            rawLevels[i] += avgLevel / 2 + 2;
        else if (concentration >= 25)
            rawLevels[i] += avgLevel / 4;

        if (moveTypeCounts[i] >= partySize)
            rawLevels[i] += avgLevel / 4;

        if (speciesTypeCounts[i] != 0 || moveTypeCounts[i] != 0)
        {
            variance = (s16)(GetTrainerTypeVarianceSeed(trainerId, trainer->trainerClass, i) % 5) - 2;
            rawLevels[i] += variance;
        }
    }

    if (IsRivalTrainerClass(trainer->trainerClass) || trainerId == TRAINER_CHAMPION_FIRST_SQUIRTLE || trainerId == TRAINER_CHAMPION_FIRST_BULBASAUR || trainerId == TRAINER_CHAMPION_FIRST_CHARMANDER)
    {
        for (i = 0; i < NUMBER_OF_MON_TYPES; i++)
        {
            if (speciesTypeCounts[i] != 0)
                rawLevels[i] += avgLevel / 3 + 2;
            else if (moveTypeCounts[i] >= 2)
                rawLevels[i] += avgLevel / 4 + 1;
        }
    }
    else if (IsBossTrainerClass(trainer->trainerClass) && dominantCount != 0)
    {
        s16 majorBonus;
        s16 minorBonus;

        switch (trainer->trainerClass)
        {
        case TRAINER_CLASS_LEADER:
            majorBonus = avgLevel / 2 + 4;
            minorBonus = avgLevel / 4 + 1;
            break;
        case TRAINER_CLASS_ELITE_FOUR:
            majorBonus = avgLevel / 2 + 6;
            minorBonus = avgLevel / 3 + 2;
            break;
        case TRAINER_CLASS_CHAMPION:
        default:
            majorBonus = avgLevel / 2 + 8;
            minorBonus = avgLevel / 3 + 3;
            break;
        }

        for (i = 0; i < NUMBER_OF_MON_TYPES; i++)
        {
            if (speciesTypeCounts[i] == dominantCount)
                rawLevels[i] += majorBonus;
            else if (minorCount != 0 && speciesTypeCounts[i] == minorCount)
                rawLevels[i] += minorBonus;
        }
    }

    for (i = 0; i < NUMBER_OF_MON_TYPES; i++)
    {
        s16 levelEstimate;
        u32 expEstimate;

        expEstimate = ConvertNpcRawLevelToExp(rawLevels[i]);
        levelEstimate = CalculateTrainerTypeLevel(i, expEstimate);
        levels[i] = levelEstimate;
    }

    // Cap: no type level may exceed the trainer's avg pokemon level + 10
    {
        u8 cap = (avgLevel + 10 > 100) ? 100 : avgLevel + 10;
        for (i = 0; i < NUMBER_OF_MON_TYPES; i++)
        {
            if (levels[i] > cap)
                levels[i] = cap;
        }
    }
}

static void GetTrainerMonResolvedMoves(u16 trainerId, u8 monIndex, u16 species, u8 level, u16 *moves)
{
    const struct Trainer *trainer;
    u8 i;

    trainer = &gTrainers[trainerId];
    for (i = 0; i < MAX_MON_MOVES; i++)
        moves[i] = MOVE_NONE;

    switch (trainer->partyFlags)
    {
    case F_TRAINER_PARTY_CUSTOM_MOVESET:
        for (i = 0; i < MAX_MON_MOVES; i++)
            moves[i] = trainer->party.NoItemCustomMoves[monIndex].moves[i];
        break;
    case F_TRAINER_PARTY_CUSTOM_MOVESET | F_TRAINER_PARTY_HELD_ITEM:
        for (i = 0; i < MAX_MON_MOVES; i++)
            moves[i] = trainer->party.ItemCustomMoves[monIndex].moves[i];
        break;
    default:
    {
        struct Pokemon tempMon;

        CreateMon(&tempMon, species, level, 0, TRUE, 0, OT_ID_PLAYER_ID, 0);
        for (i = 0; i < MAX_MON_MOVES; i++)
            moves[i] = GetMonData(&tempMon, MON_DATA_MOVE1 + i, NULL);
        break;
    }
    }
}

static u32 GetTrainerTypeVarianceSeed(u16 trainerId, u8 trainerClass, u8 typeId)
{
    u32 seed;

    seed = trainerId;
    seed = seed * 1103515245 + 12345 + trainerClass;
    seed ^= (u32)typeId * 2654435761u;
    seed ^= seed >> 16;
    return seed;
}

static bool8 GetRivalProgressionInfo(u16 trainerId, const u16 **progression, u8 *count, u8 *index)
{
    const u16 *table;
    u8 i;

    switch (trainerId)
    {
    case TRAINER_RIVAL_OAKS_LAB_SQUIRTLE:
    case TRAINER_RIVAL_ROUTE22_EARLY_SQUIRTLE:
    case TRAINER_RIVAL_CERULEAN_SQUIRTLE:
    case TRAINER_RIVAL_SS_ANNE_SQUIRTLE:
    case TRAINER_RIVAL_POKEMON_TOWER_SQUIRTLE:
    case TRAINER_RIVAL_SILPH_SQUIRTLE:
    case TRAINER_RIVAL_ROUTE22_LATE_SQUIRTLE:
    case TRAINER_CHAMPION_FIRST_SQUIRTLE:
        table = sRivalTrainerProgressionSquirtle;
        break;
    case TRAINER_RIVAL_OAKS_LAB_BULBASAUR:
    case TRAINER_RIVAL_ROUTE22_EARLY_BULBASAUR:
    case TRAINER_RIVAL_CERULEAN_BULBASAUR:
    case TRAINER_RIVAL_SS_ANNE_BULBASAUR:
    case TRAINER_RIVAL_POKEMON_TOWER_BULBASAUR:
    case TRAINER_RIVAL_SILPH_BULBASAUR:
    case TRAINER_RIVAL_ROUTE22_LATE_BULBASAUR:
    case TRAINER_CHAMPION_FIRST_BULBASAUR:
        table = sRivalTrainerProgressionBulbasaur;
        break;
    case TRAINER_RIVAL_OAKS_LAB_CHARMANDER:
    case TRAINER_RIVAL_ROUTE22_EARLY_CHARMANDER:
    case TRAINER_RIVAL_CERULEAN_CHARMANDER:
    case TRAINER_RIVAL_SS_ANNE_CHARMANDER:
    case TRAINER_RIVAL_POKEMON_TOWER_CHARMANDER:
    case TRAINER_RIVAL_SILPH_CHARMANDER:
    case TRAINER_RIVAL_ROUTE22_LATE_CHARMANDER:
    case TRAINER_CHAMPION_FIRST_CHARMANDER:
        table = sRivalTrainerProgressionCharmander;
        break;
    default:
        return FALSE;
    }

    *progression = table;
    *count = ARRAY_COUNT(sRivalTrainerProgressionSquirtle);
    *index = 0;
    for (i = 0; i < *count; i++)
    {
        if (table[i] == trainerId)
        {
            *index = i;
            return TRUE;
        }
    }

    return FALSE;
}

static bool8 IsBossTrainerClass(u8 trainerClass)
{
    return trainerClass == TRAINER_CLASS_LEADER
        || trainerClass == TRAINER_CLASS_ELITE_FOUR
        || trainerClass == TRAINER_CLASS_CHAMPION;
}

static bool8 IsRivalTrainerClass(u8 trainerClass)
{
    return trainerClass == TRAINER_CLASS_RIVAL_EARLY
        || trainerClass == TRAINER_CLASS_RIVAL_LATE;
}

u8 GetCatchRateBonus(u16 wildPokemonSpecies)
{
    u8 type1;
    u8 type2;
    u16 bonus;

    if (wildPokemonSpecies >= NUM_SPECIES)
        return 0;

    type1 = gSpeciesInfo[wildPokemonSpecies].types[0];
    type2 = gSpeciesInfo[wildPokemonSpecies].types[1];
    bonus = 0;
    
    // +3 catch rate per trainer type level for primary type
    if (type1 < NUMBER_OF_MON_TYPES)
        bonus += gSaveBlock2Ptr->trainerTypeLevels[type1] * 3;
    
    // +1.5 catch rate per trainer type level for secondary type
    if (type2 < NUMBER_OF_MON_TYPES && type2 != type1)
        bonus += (gSaveBlock2Ptr->trainerTypeLevels[type2] * 3) / 2;

    bonus = ApplyTenthsMultiplierToU16(bonus, GetPlayerPartySynergyMultiplierTenthsForTypes(type1, type2));
    
    // Cap bonus at 60
    if (bonus > 60)
        bonus = 60;
    
    return bonus;
}

u16 GetSafariCatchRateBonus(u16 wildPokemonSpecies)
{
    u8 type1, type2;
    u16 avgLevel;
    u8 multiplierTenths;

    if (wildPokemonSpecies >= NUM_SPECIES)
        return 0;

    type1 = gSpeciesInfo[wildPokemonSpecies].types[0];
    type2 = gSpeciesInfo[wildPokemonSpecies].types[1];

    if (type1 >= NUMBER_OF_MON_TYPES)
        return 0;

    if (type2 < NUMBER_OF_MON_TYPES && type2 != type1)
        avgLevel = (gSaveBlock2Ptr->trainerTypeLevels[type1] + gSaveBlock2Ptr->trainerTypeLevels[type2]) / 2;
    else
        avgLevel = gSaveBlock2Ptr->trainerTypeLevels[type1];

    multiplierTenths = GetPlayerPartySynergyMultiplierTenthsForTypes(type1, type2);
    avgLevel = ApplyTenthsMultiplierToU16(avgLevel, multiplierTenths);

    // 1-to-1: each trainer type level adds ~1% catch rate (255 = 100%)
    return avgLevel * 255 / 100;
}

static u8 CountPlayerPartyMonsMatchingTypes(u8 type1, u8 type2)
{
    u8 i;
    u8 count = 0;

    if (type1 >= NUMBER_OF_MON_TYPES && type2 >= NUMBER_OF_MON_TYPES)
        return 0;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        u16 species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES, NULL);
        u8 isEgg = GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG, NULL);
        u8 monType1;
        u8 monType2;

        if (species == SPECIES_NONE || isEgg)
            continue;

        monType1 = gSpeciesInfo[species].types[0];
        monType2 = gSpeciesInfo[species].types[1];

        if ((type1 < NUMBER_OF_MON_TYPES && (monType1 == type1 || monType2 == type1))
            || (type2 < NUMBER_OF_MON_TYPES && type2 != type1 && (monType1 == type2 || monType2 == type2)))
        {
            count++;
        }
    }

    return count;
}

static u8 GetPlayerPartySynergyMultiplierTenthsForTypes(u8 type1, u8 type2)
{
    u8 count = CountPlayerPartyMonsMatchingTypes(type1, type2);
    u8 multiplierTenths = 10 + count;

    // Natural cap with PARTY_SIZE is 16 (1.6x). Keep explicit for safety.
    if (multiplierTenths > 16)
        multiplierTenths = 16;

    return multiplierTenths;
}

static u8 ApplyTenthsMultiplierToU8(u8 value, u8 multiplierTenths)
{
    u16 scaled;

    if (value == 0)
        return 0;

    scaled = ((u16)value * multiplierTenths + 5) / 10;
    if (scaled > 255)
        scaled = 255;

    return (u8)scaled;
}

static u16 ApplyTenthsMultiplierToU16(u16 value, u8 multiplierTenths)
{
    u32 scaled;

    if (value == 0)
        return 0;

    scaled = ((u32)value * multiplierTenths + 5) / 10;
    if (scaled > 65535)
        scaled = 65535;

    return (u16)scaled;
}
