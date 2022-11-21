#include "global.h"
#include "field_specials.h"
#include "event_data.h"
#include "wild_encounter.h"
#include "roamer.h"
#include "overworld.h"
#include "pokedex.h"
#include "pokedex_area_markers.h"
#include "constants/region_map_sections.h"
#include "constants/maps.h"

struct RoamerPair
{
    u16 roamer;
    u16 starter;
};

static s32 GetRoamerIndex(u16 species);
static s32 GetRoamerPokedexAreaMarkers(u16 species, struct Subsprite * subsprites);
static bool32 IsSpeciesOnMap(const struct WildPokemonHeader * data, s32 species);
static bool32 IsSpeciesInEncounterTable(const struct WildPokemonInfo * pokemon, s32 species, s32 count);
static u16 GetMapSecIdFromWildMonHeader(const struct WildPokemonHeader * header);
static bool32 FindDexAreaByMapSec(u16 mapSecId, const u16 (*lut)[2], s32 count, s32 * lutIdx_p, u16 * tableIdx_p);

static const u16 sDexAreas_Kanto[][2] = {
    { MAPSEC_PALLET_TOWN,         DEX_AREA_PALLET_TOWN },
    { MAPSEC_VIRIDIAN_CITY,       DEX_AREA_VIRIDIAN_CITY },
    { MAPSEC_PEWTER_CITY,         DEX_AREA_PEWTER_CITY },
    { MAPSEC_CERULEAN_CITY,       DEX_AREA_CERULEAN_CITY },
    { MAPSEC_LAVENDER_TOWN,       DEX_AREA_LAVENDER_TOWN },
    { MAPSEC_VERMILION_CITY,      DEX_AREA_VERMILION_CITY },
    { MAPSEC_CELADON_CITY,        DEX_AREA_CELADON_CITY },
    { MAPSEC_FUCHSIA_CITY,        DEX_AREA_FUCHSIA_CITY },
    { MAPSEC_CINNABAR_ISLAND,     DEX_AREA_CINNABAR_ISLAND },
    { MAPSEC_INDIGO_PLATEAU,      DEX_AREA_INDIGO_PLATEAU },
    { MAPSEC_SAFFRON_CITY,        DEX_AREA_SAFFRON_CITY },
    { MAPSEC_ROUTE_4_POKECENTER,  DEX_AREA_ROUTE_4 },
    { MAPSEC_ROUTE_10_POKECENTER, DEX_AREA_ROUTE_10 },
    { MAPSEC_ROUTE_1,             DEX_AREA_ROUTE_1 },
    { MAPSEC_ROUTE_2,             DEX_AREA_ROUTE_2 },
    { MAPSEC_ROUTE_3,             DEX_AREA_ROUTE_3 },
    { MAPSEC_ROUTE_4,             DEX_AREA_ROUTE_4 },
    { MAPSEC_ROUTE_5,             DEX_AREA_ROUTE_5 },
    { MAPSEC_ROUTE_6,             DEX_AREA_ROUTE_6 },
    { MAPSEC_ROUTE_7,             DEX_AREA_ROUTE_7 },
    { MAPSEC_ROUTE_8,             DEX_AREA_ROUTE_8 },
    { MAPSEC_ROUTE_9,             DEX_AREA_ROUTE_9 },
    { MAPSEC_ROUTE_10,            DEX_AREA_ROUTE_10 },
    { MAPSEC_ROUTE_11,            DEX_AREA_ROUTE_11 },
    { MAPSEC_ROUTE_12,            DEX_AREA_ROUTE_12 },
    { MAPSEC_ROUTE_13,            DEX_AREA_ROUTE_13 },
    { MAPSEC_ROUTE_14,            DEX_AREA_ROUTE_14 },
    { MAPSEC_ROUTE_15,            DEX_AREA_ROUTE_15 },
    { MAPSEC_ROUTE_16,            DEX_AREA_ROUTE_16 },
    { MAPSEC_ROUTE_17,            DEX_AREA_ROUTE_17 },
    { MAPSEC_ROUTE_18,            DEX_AREA_ROUTE_18 },
    { MAPSEC_ROUTE_19,            DEX_AREA_ROUTE_19 },
    { MAPSEC_ROUTE_20,            DEX_AREA_ROUTE_20 },
    { MAPSEC_ROUTE_21,            DEX_AREA_ROUTE_21 },
    { MAPSEC_ROUTE_22,            DEX_AREA_ROUTE_22 },
    { MAPSEC_ROUTE_23,            DEX_AREA_ROUTE_23 },
    { MAPSEC_ROUTE_24,            DEX_AREA_ROUTE_24 },
    { MAPSEC_ROUTE_25,            DEX_AREA_ROUTE_25 },
    { MAPSEC_VIRIDIAN_FOREST,     DEX_AREA_VIRIDIAN_FOREST },
    { MAPSEC_MT_MOON,             DEX_AREA_MT_MOON },
    { MAPSEC_S_S_ANNE,            DEX_AREA_VERMILION_CITY },
    { MAPSEC_UNDERGROUND_PATH,    DEX_AREA_SAFFRON_CITY },
    { MAPSEC_UNDERGROUND_PATH_2,  DEX_AREA_SAFFRON_CITY },
    { MAPSEC_DIGLETTS_CAVE,       DEX_AREA_DIGLETTS_CAVE },
    { MAPSEC_KANTO_VICTORY_ROAD,  DEX_AREA_VICTORY_ROAD },
    { MAPSEC_ROCKET_HIDEOUT,      DEX_AREA_CELADON_CITY },
    { MAPSEC_SILPH_CO,            DEX_AREA_SAFFRON_CITY },
    { MAPSEC_POKEMON_MANSION,     DEX_AREA_POKEMON_MANSION },
    { MAPSEC_KANTO_SAFARI_ZONE,   DEX_AREA_SAFARI_ZONE },
    { MAPSEC_POKEMON_LEAGUE,      DEX_AREA_VICTORY_ROAD },
    { MAPSEC_ROCK_TUNNEL,         DEX_AREA_ROCK_TUNNEL },
    { MAPSEC_SEAFOAM_ISLANDS,     DEX_AREA_SEAFOAM_ISLANDS },
    { MAPSEC_POKEMON_TOWER,       DEX_AREA_POKEMON_TOWER },
    { MAPSEC_CERULEAN_CAVE,       DEX_AREA_CERULEAN_CAVE },
    { MAPSEC_POWER_PLANT,         DEX_AREA_POWER_PLANT }
};

static const u16 sDexAreas_Sevii1[][2] = {
	{ MAPSEC_KINDLE_ROAD,    DEX_AREA_KINDLE_ROAD },
	{ MAPSEC_TREASURE_BEACH, DEX_AREA_TREASURE_BEACH },
	{ MAPSEC_ONE_ISLAND,     DEX_AREA_ONE_ISLAND },
	{ MAPSEC_MT_EMBER,       DEX_AREA_MT_EMBER }    
};

static const u16 sDexAreas_Sevii2[][2] = {
	{ MAPSEC_CAPE_BRINK, DEX_AREA_CAPE_BRINK },
	{ MAPSEC_TWO_ISLAND, DEX_AREA_TWO_ISLAND }    
};

static const u16 sDexAreas_Sevii3[][2] = {
	{ MAPSEC_BOND_BRIDGE,     DEX_AREA_BOND_BRIDGE },
	{ MAPSEC_THREE_ISLE_PORT, DEX_AREA_THREE_ISLE_PATH },
	{ MAPSEC_THREE_ISLAND,    DEX_AREA_THREE_ISLAND },
	{ MAPSEC_BERRY_FOREST,    DEX_AREA_BERRY_FOREST },
	{ MAPSEC_THREE_ISLE_PATH, DEX_AREA_THREE_ISLE_PATH }    
};

static const u16 sDexAreas_Sevii4[][2] = {
	{ MAPSEC_FOUR_ISLAND,  DEX_AREA_FOUR_ISLAND },
	{ MAPSEC_ICEFALL_CAVE, DEX_AREA_ICEFALL_CAVE }    
};

static const u16 sDexAreas_Sevii5[][2] = {
	{ MAPSEC_RESORT_GORGEOUS,  DEX_AREA_RESORT_GORGEOUS },
	{ MAPSEC_WATER_LABYRINTH,  DEX_AREA_WATER_LABYRINTH },
	{ MAPSEC_FIVE_ISLE_MEADOW, DEX_AREA_FIVE_ISLE_MEADOW },
	{ MAPSEC_MEMORIAL_PILLAR,  DEX_AREA_MEMORIAL_PILLAR },
	{ MAPSEC_FIVE_ISLAND,      DEX_AREA_FIVE_ISLAND },
	{ MAPSEC_ROCKET_WAREHOUSE, DEX_AREA_FIVE_ISLE_MEADOW },
	{ MAPSEC_LOST_CAVE,        DEX_AREA_LOST_CAVE }    
};

static const u16 sDexAreas_Sevii6[][2] = {
	{ MAPSEC_OUTCAST_ISLAND, DEX_AREA_OUTCAST_ISLAND },
	{ MAPSEC_GREEN_PATH,     DEX_AREA_GREEN_PATH },
	{ MAPSEC_WATER_PATH,     DEX_AREA_WATER_PATH },
	{ MAPSEC_RUIN_VALLEY,    DEX_AREA_RUIN_VALLEY },
	{ MAPSEC_DOTTED_HOLE,    DEX_AREA_DOTTED_HOLE },
	{ MAPSEC_PATTERN_BUSH,   DEX_AREA_PATTERN_BUSH },
	{ MAPSEC_ALTERING_CAVE,  DEX_AREA_ALTERING_CAVE }    
};

static const u16 sDexAreas_Sevii7[][2] = {
	{ MAPSEC_TRAINER_TOWER,   DEX_AREA_TRAINER_TOWER },
	{ MAPSEC_CANYON_ENTRANCE, DEX_AREA_CANYON_ENTRANCE },
	{ MAPSEC_SEVAULT_CANYON,  DEX_AREA_SEVAULT_CANYON },
	{ MAPSEC_TANOBY_RUINS,    DEX_AREA_TANOBY_RUINS },
	{ MAPSEC_MONEAN_CHAMBER,  DEX_AREA_TANOBY_CHAMBER },
	{ MAPSEC_LIPTOO_CHAMBER,  DEX_AREA_TANOBY_CHAMBER },
	{ MAPSEC_WEEPTH_CHAMBER,  DEX_AREA_TANOBY_CHAMBER },
	{ MAPSEC_DILFORD_CHAMBER, DEX_AREA_TANOBY_CHAMBER },
	{ MAPSEC_SCUFIB_CHAMBER,  DEX_AREA_TANOBY_CHAMBER },
	{ MAPSEC_RIXY_CHAMBER,    DEX_AREA_TANOBY_CHAMBER },
	{ MAPSEC_VIAPOIS_CHAMBER, DEX_AREA_TANOBY_CHAMBER }    
};

static const struct
{
    const u16 (*table)[2];
    s32 count;
} sSeviiDexAreas[] = {
    { sDexAreas_Sevii1, ARRAY_COUNT(sDexAreas_Sevii1) },
    { sDexAreas_Sevii2, ARRAY_COUNT(sDexAreas_Sevii2) },
    { sDexAreas_Sevii3, ARRAY_COUNT(sDexAreas_Sevii3) },
    { sDexAreas_Sevii4, ARRAY_COUNT(sDexAreas_Sevii4) },
    { sDexAreas_Sevii5, ARRAY_COUNT(sDexAreas_Sevii5) },
    { sDexAreas_Sevii6, ARRAY_COUNT(sDexAreas_Sevii6) },
    { sDexAreas_Sevii7, ARRAY_COUNT(sDexAreas_Sevii7) }
};

static const struct RoamerPair sRoamerPairs[] = {
    { SPECIES_ENTEI,   SPECIES_BULBASAUR  },
    { SPECIES_SUICUNE, SPECIES_CHARMANDER },
    { SPECIES_RAIKOU,  SPECIES_SQUIRTLE   }
};

// Scans for the given species and populates 'subsprites' with the area markers.
// Returns the number of areas where the species was found.
s32 GetSpeciesPokedexAreaMarkers(u16 species, struct Subsprite * subsprites)
{
    s32 areaCount;
    s32 j;
    s32 mapSecId;
    u16 dexArea;
    s32 tableIndex;
    s32 seviiAreas;
    s32 alteringCaveCount;
    s32 alteringCaveNum;
    s32 i;

    if (GetRoamerIndex(species) >= 0)
        return GetRoamerPokedexAreaMarkers(species, subsprites);

    seviiAreas = GetUnlockedSeviiAreas();
    alteringCaveCount = 0;
    alteringCaveNum = VarGet(VAR_ALTERING_CAVE_WILD_SET);
    if (alteringCaveNum >= NUM_ALTERING_CAVE_TABLES)
        alteringCaveNum = 0;
    for (i = 0, areaCount = 0; gWildMonHeaders[i].mapGroup != MAP_GROUP(UNDEFINED); i++)
    {
        mapSecId = GetMapSecIdFromWildMonHeader(&gWildMonHeaders[i]);
        if (mapSecId == MAPSEC_ALTERING_CAVE)
        {
            alteringCaveCount++;
            if (alteringCaveNum != alteringCaveCount - 1)
                continue;
        }
        if (IsSpeciesOnMap(&gWildMonHeaders[i], species))
        {
            // Search for all dex areas associated with this MAPSEC.
            // In the vanilla game each MAPSEC only has at most one DEX_AREA.
            tableIndex = 0;
            while (FindDexAreaByMapSec(mapSecId, sDexAreas_Kanto, ARRAY_COUNT(sDexAreas_Kanto), &tableIndex, &dexArea))
            {
                if (dexArea != DEX_AREA_NONE)
                    GetAreaMarkerSubsprite(areaCount++, dexArea, subsprites);
            }

            for (j = 0; j < ARRAY_COUNT(sSeviiDexAreas); j++)
            {
                if ((seviiAreas >> j) & 1)
                {
                    // Search for all dex areas associated with this MAPSEC in this unlocked Sevii Island
                    tableIndex = 0;
                    while (FindDexAreaByMapSec(mapSecId, sSeviiDexAreas[j].table, sSeviiDexAreas[j].count, &tableIndex, &dexArea))
                    {
                        if (dexArea != DEX_AREA_NONE)
                            GetAreaMarkerSubsprite(areaCount++, dexArea, subsprites);
                    }
                }
            }
        }
    }

    return areaCount;
}

static s32 GetRoamerIndex(u16 species)
{
    s32 i;
    for (i = 0; i < ARRAY_COUNT(sRoamerPairs); i++)
    {
        if (sRoamerPairs[i].roamer == species)
            return i;
    }

    return -1;
}

static s32 GetRoamerPokedexAreaMarkers(u16 species, struct Subsprite * subsprites)
{
    u16 mapSecId;
    s32 roamerIdx;
    u16 dexArea;
    s32 tableIndex;

    // Make sure that this is a roamer species, and that it corresponds to the player's starter.
    roamerIdx = GetRoamerIndex(species);
    if (roamerIdx < 0)
        return 0;
    if (sRoamerPairs[roamerIdx].starter != GetStarterSpecies())
        return 0;

    mapSecId = GetRoamerLocationMapSectionId();
    tableIndex = 0;
    if (FindDexAreaByMapSec(mapSecId, sDexAreas_Kanto, ARRAY_COUNT(sDexAreas_Kanto), &tableIndex, &dexArea))
    {
        if (dexArea != DEX_AREA_NONE)
        {
            GetAreaMarkerSubsprite(0, dexArea, subsprites);
            return 1;
        }
    }
    return 0;
}

static bool32 IsSpeciesOnMap(const struct WildPokemonHeader * data, s32 species)
{
    if (IsSpeciesInEncounterTable(data->landMonsInfo, species, LAND_WILD_COUNT))
        return TRUE;
    if (IsSpeciesInEncounterTable(data->waterMonsInfo, species, WATER_WILD_COUNT))
        return TRUE;
// When searching the fishing encounters, this incorrectly uses the size of the land encounters.
// As a result it's reading out of bounds of the fishing encounters tables.
#ifdef BUGFIX
    if (IsSpeciesInEncounterTable(data->fishingMonsInfo, species, FISH_WILD_COUNT))
#else
    if (IsSpeciesInEncounterTable(data->fishingMonsInfo, species, LAND_WILD_COUNT))
#endif
        return TRUE;
    if (IsSpeciesInEncounterTable(data->rockSmashMonsInfo, species, ROCK_WILD_COUNT))
        return TRUE;

    return FALSE;
}

static bool32 IsSpeciesInEncounterTable(const struct WildPokemonInfo * info, s32 species, s32 count)
{
    s32 i;
    if (info != NULL)
    {
        for (i = 0; i < count; i++)
        {
            if (info->wildPokemon[i].species == species)
                return TRUE;
        }
    }
    return FALSE;
}

static u16 GetMapSecIdFromWildMonHeader(const struct WildPokemonHeader * header)
{
    return Overworld_GetMapHeaderByGroupAndId(header->mapGroup, header->mapNum)->regionMapSectionId;
}

// Search a MAPSEC -> DEX_AREA table for the given mapsec.
// Assigns the DEX_AREA (if found) to 'dexArea', and the first unread table index to 'index'.
// Returns TRUE if DEX_AREA was found, FALSE otherwise.
static bool32 FindDexAreaByMapSec(u16 mapSecId, const u16 (*table)[2], s32 count, s32 * index, u16 * dexArea)
{
    s32 i;
    for (i = *index; i < count; i++)
    {
        if (table[i][0] == mapSecId)
        {
            *dexArea = table[i][1];
            *index = i + 1;
            return TRUE;
        }
    }
    return FALSE;
}
