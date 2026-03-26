#include "global.h"
#include "random.h"
#include "overworld.h"
#include "field_specials.h"
#include "constants/maps.h"
#include "constants/region_map_sections.h"

// Despite having a variable to track it, the roamer is
// hard-coded to only ever be in map group 3
#define ROAMER_MAP_GROUP 3

enum
{
    MAP_GRP, // map group
    MAP_NUM, // map number
};

#define ROAMER (&gSaveBlock1Ptr->roamer)
EWRAM_DATA u8 sLocationHistory[3][2] = {};
EWRAM_DATA u8 sRoamerLocation[2] = {};

#define ___ MAP_NUM(UNDEFINED) // For empty spots in the location table

// Note: There are two potential softlocks that can occur with this table if its maps are
//       changed in particular ways. They can be avoided by ensuring the following:
//       - There must be at least 2 location sets that start with a different map,
//         i.e. every location set cannot start with the same map. This is because of
//         the while loop in RoamerMoveToOtherLocationSet.
//       - Each location set must have at least 3 unique maps. This is because of
//         the while loop in RoamerMove. In this loop the first map in the set is
//         ignored, and an additional map is ignored if the roamer was there recently.
//       - Additionally, while not a softlock, it's worth noting that if for any
//         map in the location table there is not a location set that starts with
//         that map then the roamer will be significantly less likely to move away
//         from that map when it lands there.
static const u8 sRoamerLocations[][7] = {
    {MAP_NUM(ROUTE1), MAP_NUM(ROUTE2), MAP_NUM(ROUTE21_NORTH), MAP_NUM(ROUTE22), ___, ___, ___},
    {MAP_NUM(ROUTE2), MAP_NUM(ROUTE1), MAP_NUM(ROUTE3), MAP_NUM(ROUTE22), ___, ___, ___},
    {MAP_NUM(ROUTE3), MAP_NUM(ROUTE2), MAP_NUM(ROUTE4), ___, ___, ___, ___},
    {MAP_NUM(ROUTE4), MAP_NUM(ROUTE3), MAP_NUM(ROUTE5), MAP_NUM(ROUTE9), MAP_NUM(ROUTE24), ___, ___},
    {MAP_NUM(ROUTE5), MAP_NUM(ROUTE4), MAP_NUM(ROUTE6), MAP_NUM(ROUTE7), MAP_NUM(ROUTE8), MAP_NUM(ROUTE9), MAP_NUM(ROUTE24)},
    {MAP_NUM(ROUTE6), MAP_NUM(ROUTE5), MAP_NUM(ROUTE7), MAP_NUM(ROUTE8), MAP_NUM(ROUTE11), ___, ___},
    {MAP_NUM(ROUTE7), MAP_NUM(ROUTE5), MAP_NUM(ROUTE6), MAP_NUM(ROUTE8), MAP_NUM(ROUTE16), ___, ___},
    {MAP_NUM(ROUTE8), MAP_NUM(ROUTE5), MAP_NUM(ROUTE6), MAP_NUM(ROUTE7), MAP_NUM(ROUTE10), MAP_NUM(ROUTE12), ___},
    {MAP_NUM(ROUTE9), MAP_NUM(ROUTE4), MAP_NUM(ROUTE5), MAP_NUM(ROUTE10), MAP_NUM(ROUTE24), ___, ___},
    {MAP_NUM(ROUTE10), MAP_NUM(ROUTE8), MAP_NUM(ROUTE9), MAP_NUM(ROUTE12), ___, ___, ___},
    {MAP_NUM(ROUTE11), MAP_NUM(ROUTE6), MAP_NUM(ROUTE12), ___, ___, ___, ___},
    {MAP_NUM(ROUTE12), MAP_NUM(ROUTE10), MAP_NUM(ROUTE11), MAP_NUM(ROUTE13), ___, ___, ___},
    {MAP_NUM(ROUTE13), MAP_NUM(ROUTE12), MAP_NUM(ROUTE14), ___, ___, ___, ___},
    {MAP_NUM(ROUTE14), MAP_NUM(ROUTE13), MAP_NUM(ROUTE15), ___, ___, ___, ___},
    {MAP_NUM(ROUTE15), MAP_NUM(ROUTE14), MAP_NUM(ROUTE18), MAP_NUM(ROUTE19), ___, ___, ___},
    {MAP_NUM(ROUTE16), MAP_NUM(ROUTE7), MAP_NUM(ROUTE17), ___, ___, ___, ___},
    {MAP_NUM(ROUTE17), MAP_NUM(ROUTE16), MAP_NUM(ROUTE18), ___, ___, ___, ___},
    {MAP_NUM(ROUTE18), MAP_NUM(ROUTE15), MAP_NUM(ROUTE17), MAP_NUM(ROUTE19), ___, ___, ___},
    {MAP_NUM(ROUTE19), MAP_NUM(ROUTE15), MAP_NUM(ROUTE18), MAP_NUM(ROUTE20), ___, ___, ___},
    {MAP_NUM(ROUTE20), MAP_NUM(ROUTE19), MAP_NUM(ROUTE21_NORTH), ___, ___, ___, ___},
    {MAP_NUM(ROUTE21_NORTH), MAP_NUM(ROUTE1), MAP_NUM(ROUTE20), ___, ___, ___, ___},
    {MAP_NUM(ROUTE22), MAP_NUM(ROUTE1), MAP_NUM(ROUTE2), MAP_NUM(ROUTE23), ___, ___, ___},
    {MAP_NUM(ROUTE23), MAP_NUM(ROUTE22), MAP_NUM(ROUTE2), ___, ___, ___, ___},
    {MAP_NUM(ROUTE24), MAP_NUM(ROUTE4), MAP_NUM(ROUTE5), MAP_NUM(ROUTE9), ___, ___, ___},
    {MAP_NUM(ROUTE25), MAP_NUM(ROUTE24), MAP_NUM(ROUTE9), ___, ___, ___, ___},
    {___, ___, ___, ___, ___, ___, ___}
};

#undef ___
#define NUM_LOCATION_SETS (ARRAY_COUNT(sRoamerLocations) - 1)
#define NUM_LOCATIONS_PER_SET (ARRAY_COUNT(sRoamerLocations[0]))

void ClearRoamerData(void)
{
    u32 i;
    *ROAMER = (struct Roamer){};
    sRoamerLocation[MAP_GRP] = 0;
    sRoamerLocation[MAP_NUM] = 0;
    for (i = 0; i < ARRAY_COUNT(sLocationHistory); i++)
    {
        sLocationHistory[i][MAP_GRP] = 0;
        sLocationHistory[i][MAP_NUM] = 0;
    }
}

#define GetRoamerSpecies() ({\
    u16 a;\
    switch (GetStarterSpecies())\
    {\
    default:\
        a = SPECIES_RAIKOU;\
        break;\
    case SPECIES_BULBASAUR:\
        a = SPECIES_ENTEI;\
        break;\
    case SPECIES_CHARMANDER:\
        a = SPECIES_SUICUNE;\
        break;\
    }\
    a;\
})

void CreateInitialRoamerMon(void)
{
    struct Pokemon * mon = &gEnemyParty[0];
    u16 species = GetRoamerSpecies();
    CreateMon(mon, species, 50, USE_RANDOM_IVS, FALSE, 0, OT_ID_PLAYER_ID, 0);
    ROAMER->species = species;
    ROAMER->level = 50;
    ROAMER->status = 0;
    ROAMER->active = TRUE;
    ROAMER->ivs = GetMonData(mon, MON_DATA_IVS);
    ROAMER->personality = GetMonData(mon, MON_DATA_PERSONALITY);
    ROAMER->hp = GetMonData(mon, MON_DATA_MAX_HP);
    ROAMER->cool = GetMonData(mon, MON_DATA_COOL);
    ROAMER->beauty = GetMonData(mon, MON_DATA_BEAUTY);
    ROAMER->cute = GetMonData(mon, MON_DATA_CUTE);
    ROAMER->smart = GetMonData(mon, MON_DATA_SMART);
    ROAMER->tough = GetMonData(mon, MON_DATA_TOUGH);
    sRoamerLocation[MAP_GRP] = ROAMER_MAP_GROUP;
    sRoamerLocation[MAP_NUM] = sRoamerLocations[Random() % NUM_LOCATION_SETS][0];
}

void InitRoamer(void)
{
    ClearRoamerData();
    CreateInitialRoamerMon();
}

void UpdateLocationHistoryForRoamer(void)
{
    sLocationHistory[2][MAP_GRP] = sLocationHistory[1][MAP_GRP];
    sLocationHistory[2][MAP_NUM] = sLocationHistory[1][MAP_NUM];

    sLocationHistory[1][MAP_GRP] = sLocationHistory[0][MAP_GRP];
    sLocationHistory[1][MAP_NUM] = sLocationHistory[0][MAP_NUM];

    sLocationHistory[0][MAP_GRP] = gSaveBlock1Ptr->location.mapGroup;
    sLocationHistory[0][MAP_NUM] = gSaveBlock1Ptr->location.mapNum;
}

void RoamerMoveToOtherLocationSet(void)
{
    u8 mapNum = 0;

    if (!ROAMER->active)
        return;

    sRoamerLocation[MAP_GRP] = ROAMER_MAP_GROUP;

    // Choose a location set that starts with a map
    // different from the roamer's current map
    while (1)
    {
        mapNum = sRoamerLocations[Random() % NUM_LOCATION_SETS][0];
        if (sRoamerLocation[MAP_NUM] != mapNum)
        {
            sRoamerLocation[MAP_NUM] = mapNum;
            return;
        }
    }
}


void RoamerMove(void)
{
    u8 locSet = 0;

    if ((Random() % 16) == 0)
    {
        RoamerMoveToOtherLocationSet();
    }
    else
    {
        if (!ROAMER->active)
            return;

        while (locSet < NUM_LOCATION_SETS)
        {
            // Find the location set that starts with the roamer's current map
            if (sRoamerLocation[MAP_NUM] == sRoamerLocations[locSet][0])
            {
                u8 mapNum;
                while (1)
                {
                    // Choose a new map (excluding the first) within this set
                    // Also exclude a map if the roamer was there 2 moves ago
                    mapNum = sRoamerLocations[locSet][(Random() % (NUM_LOCATIONS_PER_SET - 1)) + 1];
                    if (!(sLocationHistory[2][MAP_GRP] == ROAMER_MAP_GROUP
                       && sLocationHistory[2][MAP_NUM] == mapNum)
                       && mapNum != MAP_NUM(UNDEFINED))
                        break;
                }
                sRoamerLocation[MAP_NUM] = mapNum;
                return;
            }
            locSet++;
        }
    }
}

bool8 IsRoamerAt(u8 mapGroup, u8 mapNum)
{
    if (ROAMER->active && mapGroup == sRoamerLocation[MAP_GRP] && mapNum == sRoamerLocation[MAP_NUM])
        return TRUE;
    else
        return FALSE;
}

void CreateRoamerMonInstance(void)
{
    u32 status;
    struct Pokemon *mon = &gEnemyParty[0];
    ZeroEnemyPartyMons();
    CreateMonWithIVsPersonality(mon, ROAMER->species, ROAMER->level, ROAMER->ivs, ROAMER->personality);
// The roamer's status field is u8, but SetMonData expects status to be u32, so will set the roamer's status
// using the status field and the following 3 bytes (cool, beauty, and cute).
#ifdef BUGFIX
    status = ROAMER->status;
    SetMonData(mon, MON_DATA_STATUS, &status);
#else
    SetMonData(mon, MON_DATA_STATUS, &ROAMER->status);
#endif
    SetMonData(mon, MON_DATA_HP, &ROAMER->hp);
    SetMonData(mon, MON_DATA_COOL, &ROAMER->cool);
    SetMonData(mon, MON_DATA_BEAUTY, &ROAMER->beauty);
    SetMonData(mon, MON_DATA_CUTE, &ROAMER->cute);
    SetMonData(mon, MON_DATA_SMART, &ROAMER->smart);
    SetMonData(mon, MON_DATA_TOUGH, &ROAMER->tough);
}

bool8 TryStartRoamerEncounter(void)
{
    if (IsRoamerAt(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum) == TRUE && (Random() % 4) == 0)
    {
        CreateRoamerMonInstance();
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}
void UpdateRoamerHPStatus(struct Pokemon *mon)
{
    ROAMER->hp = GetMonData(mon, MON_DATA_HP);
    ROAMER->status = GetMonData(mon, MON_DATA_STATUS);

    RoamerMoveToOtherLocationSet();
}

void SetRoamerInactive(void)
{
    ROAMER->active = FALSE;
}

void GetRoamerLocation(u8 *mapGroup, u8 *mapNum)
{
    *mapGroup = sRoamerLocation[MAP_GRP];
    *mapNum = sRoamerLocation[MAP_NUM];
}

u16 GetRoamerLocationMapSectionId(void)
{
    if (!ROAMER->active)
        return MAPSEC_NONE;
    return Overworld_GetMapHeaderByGroupAndId(sRoamerLocation[MAP_GRP], sRoamerLocation[MAP_NUM])->regionMapSectionId;
}
