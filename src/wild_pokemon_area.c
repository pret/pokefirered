#include "global.h"
#include "field_specials.h"
#include "event_data.h"
#include "wild_encounter.h"
#include "roamer.h"
#include "overworld.h"
#include "pokedex_area_markers.h"
#include "constants/region_map_sections.h"
#include "constants/maps.h"

struct SeviiDexArea
{
    const u16 (*lut)[2];
    s32 count;
};

struct RoamerPair
{
    u16 roamer;
    u16 starter;
};

static s32 GetRoamerIndex(u16 species);
static s32 CountRoamerNests(u16 species, struct Subsprite * subsprites);
static bool32 PokemonInAnyEncounterTableInMap(const struct WildPokemonHeader * data, s32 species);
static bool32 PokemonInEncounterTable(const struct WildPokemonInfo * pokemon, s32 species, s32 count);
static u16 GetMapSecIdFromWildMonHeader(const struct WildPokemonHeader * header);
static bool32 TryGetMapSecPokedexAreaEntry(u16 mapSecId, const u16 (*lut)[2], s32 count, s32 * lutIdx_p, u16 * tableIdx_p);

static const u16 sDexAreas_Kanto[][2] = {
    { MAPSEC_PALLET_TOWN,          1 },
    { MAPSEC_VIRIDIAN_CITY,        2 },
    { MAPSEC_PEWTER_CITY,          3 },
    { MAPSEC_CERULEAN_CITY,        4 },
    { MAPSEC_LAVENDER_TOWN,        5 },
    { MAPSEC_VERMILION_CITY,       6 },
    { MAPSEC_CELADON_CITY,         7 },
    { MAPSEC_FUCHSIA_CITY,         8 },
    { MAPSEC_CINNABAR_ISLAND,      9 },
    { MAPSEC_INDIGO_PLATEAU,      10 },
    { MAPSEC_SAFFRON_CITY,        11 },
    { MAPSEC_ROUTE_4_POKECENTER,  15 },
    { MAPSEC_ROUTE_10_POKECENTER, 21 },
    { MAPSEC_ROUTE_1,             12 },
    { MAPSEC_ROUTE_2,             13 },
    { MAPSEC_ROUTE_3,             14 },
    { MAPSEC_ROUTE_4,             15 },
    { MAPSEC_ROUTE_5,             16 },
    { MAPSEC_ROUTE_6,             17 },
    { MAPSEC_ROUTE_7,             18 },
    { MAPSEC_ROUTE_8,             19 },
    { MAPSEC_ROUTE_9,             20 },
    { MAPSEC_ROUTE_10,            21 },
    { MAPSEC_ROUTE_11,            22 },
    { MAPSEC_ROUTE_12,            23 },
    { MAPSEC_ROUTE_13,            24 },
    { MAPSEC_ROUTE_14,            25 },
    { MAPSEC_ROUTE_15,            26 },
    { MAPSEC_ROUTE_16,            27 },
    { MAPSEC_ROUTE_17,            28 },
    { MAPSEC_ROUTE_18,            29 },
    { MAPSEC_ROUTE_19,            30 },
    { MAPSEC_ROUTE_20,            31 },
    { MAPSEC_ROUTE_21,            32 },
    { MAPSEC_ROUTE_22,            33 },
    { MAPSEC_ROUTE_23,            34 },
    { MAPSEC_ROUTE_24,            35 },
    { MAPSEC_ROUTE_25,            36 },
    { MAPSEC_VIRIDIAN_FOREST,     37 },
    { MAPSEC_MT_MOON,             39 },
    { MAPSEC_S_S_ANNE,             6 },
    { MAPSEC_UNDERGROUND_PATH,    11 },
    { MAPSEC_UNDERGROUND_PATH_2,  11 },
    { MAPSEC_DIGLETTS_CAVE,       38 },
    { MAPSEC_KANTO_VICTORY_ROAD,  47 },
    { MAPSEC_ROCKET_HIDEOUT,       7 },
    { MAPSEC_SILPH_CO,            11 },
    { MAPSEC_POKEMON_MANSION,     46 },
    { MAPSEC_KANTO_SAFARI_ZONE,   44 },
    { MAPSEC_POKEMON_LEAGUE,      47 },
    { MAPSEC_ROCK_TUNNEL,         41 },
    { MAPSEC_SEAFOAM_ISLANDS,     45 },
    { MAPSEC_POKEMON_TOWER,       43 },
    { MAPSEC_CERULEAN_CAVE,       40 },
    { MAPSEC_POWER_PLANT,         42 }
};

static const u16 sDexAreas_Sevii1[][2] = {
	{ MAPSEC_KINDLE_ROAD,    55 },
	{ MAPSEC_TREASURE_BEACH, 56 },
	{ MAPSEC_ONE_ISLAND,     48 },
	{ MAPSEC_MT_EMBER,       72 }    
};

static const u16 sDexAreas_Sevii2[][2] = {
	{ MAPSEC_CAPE_BRINK, 57 },
	{ MAPSEC_TWO_ISLAND, 49 }    
};

static const u16 sDexAreas_Sevii3[][2] = {
	{ MAPSEC_BOND_BRIDGE,     58 },
	{ MAPSEC_THREE_ISLE_PORT, 59 },
	{ MAPSEC_THREE_ISLAND,    50 },
	{ MAPSEC_BERRY_FOREST,    73 },
	{ MAPSEC_THREE_ISLE_PATH, 59 }    
};

static const u16 sDexAreas_Sevii4[][2] = {
	{ MAPSEC_FOUR_ISLAND,  51 },
	{ MAPSEC_ICEFALL_CAVE, 74 }    
};

static const u16 sDexAreas_Sevii5[][2] = {
	{ MAPSEC_RESORT_GORGEOUS,  60 },
	{ MAPSEC_WATER_LABYRINTH,  61 },
	{ MAPSEC_FIVE_ISLE_MEADOW, 62 },
	{ MAPSEC_MEMORIAL_PILLAR,  63 },
	{ MAPSEC_FIVE_ISLAND,      52 },
	{ MAPSEC_ROCKET_WAREHOUSE, 62 },
	{ MAPSEC_LOST_CAVE,        75 }    
};

static const u16 sDexAreas_Sevii6[][2] = {
	{ MAPSEC_OUTCAST_ISLAND, 64 },
	{ MAPSEC_GREEN_PATH,     65 },
	{ MAPSEC_WATER_PATH,     66 },
	{ MAPSEC_RUIN_VALLEY,    67 },
	{ MAPSEC_DOTTED_HOLE,    78 },
	{ MAPSEC_PATTERN_BUSH,   77 },
	{ MAPSEC_ALTERING_CAVE,  76 }    
};

static const u16 sDexAreas_Sevii7[][2] = {
	{ MAPSEC_TRAINER_TOWER,   68 },
	{ MAPSEC_CANYON_ENTRANCE, 69 },
	{ MAPSEC_SEVAULT_CANYON,  70 },
	{ MAPSEC_TANOBY_RUINS,    71 },
	{ MAPSEC_MONEAN_CHAMBER,  79 },
	{ MAPSEC_LIPTOO_CHAMBER,  79 },
	{ MAPSEC_WEEPTH_CHAMBER,  79 },
	{ MAPSEC_DILFORD_CHAMBER, 79 },
	{ MAPSEC_SCUFIB_CHAMBER,  79 },
	{ MAPSEC_RIXY_CHAMBER,    79 },
	{ MAPSEC_VIAPOIS_CHAMBER, 79 }    
};

static const struct SeviiDexArea sSeviiDexAreas[] = {
    { sDexAreas_Sevii1,  4 },
    { sDexAreas_Sevii2,  2 },
    { sDexAreas_Sevii3,  5 },
    { sDexAreas_Sevii4,  2 },
    { sDexAreas_Sevii5,  7 },
    { sDexAreas_Sevii6,  7 },
    { sDexAreas_Sevii7, 11 }
};

static const struct RoamerPair sRoamerPairs[] = {
    { SPECIES_ENTEI,   SPECIES_BULBASAUR  },
    { SPECIES_SUICUNE, SPECIES_CHARMANDER },
    { SPECIES_RAIKOU,  SPECIES_SQUIRTLE   }
};

s32 BuildPokedexAreaSubspriteBuffer(u16 species, struct Subsprite * subsprites)
{
    s32 areaCount;
    s32 j;
    s32 mapSecId;
    u16 dexAreaSubspriteIdx;
    s32 dexAreaEntryLUTidx;
    s32 seviiAreas;
    s32 alteringCaveCount;
    s32 alteringCaveNum;
    s32 i;

    if (GetRoamerIndex(species) >= SPECIES_NONE)
    {
        return CountRoamerNests(species, subsprites);
    }

    seviiAreas = GetUnlockedSeviiAreas();
    alteringCaveCount = 0;
    alteringCaveNum = VarGet(VAR_ALTERING_CAVE_WILD_SET);
    if (alteringCaveNum > 8)
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
        if (PokemonInAnyEncounterTableInMap(&gWildMonHeaders[i], species))
        {
            dexAreaEntryLUTidx = 0;
            while (TryGetMapSecPokedexAreaEntry(mapSecId, sDexAreas_Kanto, 55, &dexAreaEntryLUTidx, &dexAreaSubspriteIdx))
            {
                if (dexAreaSubspriteIdx != 0)
                {
                    SetAreaSubsprite(areaCount++, dexAreaSubspriteIdx, subsprites);
                }
            }
            for (j = 0; j < NELEMS(sSeviiDexAreas); j++)
            {
                if ((seviiAreas >> j) & 1)
                {
                    dexAreaEntryLUTidx = 0;
                    while (TryGetMapSecPokedexAreaEntry(mapSecId, sSeviiDexAreas[j].lut, sSeviiDexAreas[j].count, &dexAreaEntryLUTidx, &dexAreaSubspriteIdx))
                    {
                        if (dexAreaSubspriteIdx != 0)
                        {
                            SetAreaSubsprite(areaCount++, dexAreaSubspriteIdx, subsprites);
                        }
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
    for (i = 0; i < NELEMS(sRoamerPairs); i++)
    {
        if (sRoamerPairs[i].roamer == species)
            return i;
    }

    return -1;
}

static s32 CountRoamerNests(u16 species, struct Subsprite * subsprites)
{
    u16 roamerLocation;
    s32 roamerIdx;
    u16 dexAreaSubspriteIdx;
    s32 dexAreaEntryLUTidx;

    roamerIdx = GetRoamerIndex(species);
    if (roamerIdx < 0)
        return 0;
    if (sRoamerPairs[roamerIdx].starter != GetStarterSpecies())
        return 0;
    roamerLocation = GetRoamerLocationMapSectionId();
    dexAreaEntryLUTidx = 0;
    if (TryGetMapSecPokedexAreaEntry(roamerLocation, sDexAreas_Kanto, 55, &dexAreaEntryLUTidx, &dexAreaSubspriteIdx))
    {
        if (dexAreaSubspriteIdx != 0)
        {
            SetAreaSubsprite(0, dexAreaSubspriteIdx, subsprites);
            return 1;
        }
    }
    return 0;
}

static bool32 PokemonInAnyEncounterTableInMap(const struct WildPokemonHeader * data, s32 species)
{
    if (PokemonInEncounterTable(data->landMonsInfo, species, 12))
        return TRUE;
    if (PokemonInEncounterTable(data->waterMonsInfo, species, 5))
        return TRUE;
    if (PokemonInEncounterTable(data->fishingMonsInfo, species, 12)) // 10
        return TRUE;
    if (PokemonInEncounterTable(data->rockSmashMonsInfo, species, 5))
        return TRUE;

    return FALSE;
}

static bool32 PokemonInEncounterTable(const struct WildPokemonInfo * info, s32 species, s32 count)
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

static bool32 TryGetMapSecPokedexAreaEntry(u16 mapSecId, const u16 (*lut)[2], s32 count, s32 * lutIdx_p, u16 * tableIdx_p)
{
    s32 i;
    for (i = *lutIdx_p; i < count; i++)
    {
        if (lut[i][0] == mapSecId)
        {
            *tableIdx_p = lut[i][1];
            *lutIdx_p = i + 1;
            return TRUE;
        }
    }
    return FALSE;
}
