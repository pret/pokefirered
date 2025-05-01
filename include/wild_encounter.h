#ifndef GUARD_WILD_ENCOUNTER_H
#define GUARD_WILD_ENCOUNTER_H

#include "global.h"
#include "rtc.h"

enum WildPokemonArea
{
    WILD_AREA_LAND,
    WILD_AREA_WATER,
    WILD_AREA_ROCKS,
    WILD_AREA_FISHING,
    WILD_AREA_HIDDEN
};

#define LAND_WILD_COUNT     12
#define WATER_WILD_COUNT    5
#define ROCK_WILD_COUNT     5
#define FISH_WILD_COUNT     10
#define HIDDEN_WILD_COUNT   3

#define NUM_ALTERING_CAVE_TABLES 9

#define FISHING_CHAIN_LENGTH_MAX 999
#define FISHING_CHAIN_SHINY_STREAK_MAX 20

struct WildPokemon
{
    u8 minLevel;
    u8 maxLevel;
    u16 species;
};

struct WildPokemonInfo
{
    u8 encounterRate;
    const struct WildPokemon *wildPokemon;
};

struct WildEncounterTypes
{
    const struct WildPokemonInfo *landMonsInfo;
    const struct WildPokemonInfo *waterMonsInfo;
    const struct WildPokemonInfo *rockSmashMonsInfo;
    const struct WildPokemonInfo *fishingMonsInfo;
    const struct WildPokemonInfo *hiddenMonsInfo;
};

struct WildPokemonHeader
{
    u8 mapGroup;
    u8 mapNum;

#if OW_TIME_OF_DAY_ENCOUNTERS
const struct WildEncounterTypes encounterTypes[TIMES_OF_DAY_COUNT];
#else
const struct WildEncounterTypes encounterTypes[1];
#endif
};

extern const struct WildPokemonHeader gWildMonHeaders[];
extern bool8 gIsFishingEncounter;
extern bool8 gIsSurfingEncounter;
extern u16 gChainFishingDexNavStreak;

void DisableWildEncounters(bool8 disabled);
u8 PickWildMonNature(void);
bool8 StandardWildEncounter(u32 currMetatileAttrs, u16 previousMetaTileBehavior);
bool8 SweetScentWildEncounter(void);
bool8 DoesCurrentMapHaveFishingMons(void);
void FishingWildEncounter(u8 rod);
u16 GetLocalWildMon(bool8 *isWaterMon);
u16 GetLocalWaterMon(void);
bool8 UpdateRepelCounter(void);
void DisableWildEncounters(bool8 state);
u8 GetUnownLetterByPersonalityLoByte(u32 personality);
bool8 SweetScentWildEncounter(void);
void SeedWildEncounterRng(u16 randVal);
void ResetEncounterRateModifiers(void);
bool8 TryStandardWildEncounter(u32 currMetatileAttrs);
bool8 TryDoDoubleWildBattle(void);
u32 CalculateChainFishingShinyRolls(void);
void CreateWildMon(u16 species, u8 level, u8 unownSlot);
u16 GetCurrentMapWildMonHeaderId(void);
u8 ChooseWildMonIndex_Land(void);
u8 ChooseWildMonIndex_WaterRock(void);
u8 ChooseHiddenMonIndex(void);
bool32 MapHasNoEncounterData(void);
enum TimeOfDay GetTimeOfDayForEncounters(u32 headerId, enum WildPokemonArea area);

#endif // GUARD_WILD_ENCOUNTER_H
