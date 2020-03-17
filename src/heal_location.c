#include "global.h"
#include "heal_location.h"
#include "event_data.h"
#include "constants/vars.h"
#include "constants/maps.h"
#include "constants/heal_locations.h"

static void SetBlackoutRespawnHealerNpcAsLastTalked(u32 healLocationIdx);

// The array in the below file defines the fly points for unlocked spawns.
#include "data/heal_locations.h"

// This array defines the map where you actually respawn when you black out,
// based on where you last checkpointed.
// This is either the player's house or a Pokémon Center.
// The data are u16 instead of u8 for reasons unknown.
static const u16 sBlackoutRespawnHealCenterMapIdxs[][2] = {
    [SPAWN_PALLET_TOWN     - 1] = {MAP_GROUP(PALLET_TOWN_PLAYERS_HOUSE_1F), MAP_NUM(PALLET_TOWN_PLAYERS_HOUSE_1F)},
    [SPAWN_VIRIDIAN_CITY   - 1] = {MAP_GROUP(VIRIDIAN_CITY_POKEMON_CENTER_1F), MAP_NUM(VIRIDIAN_CITY_POKEMON_CENTER_1F)},
    [SPAWN_PEWTER_CITY     - 1] = {MAP_GROUP(PEWTER_CITY_POKEMON_CENTER_1F), MAP_NUM(PEWTER_CITY_POKEMON_CENTER_1F)},
    [SPAWN_CERULEAN_CITY   - 1] = {MAP_GROUP(CERULEAN_CITY_POKEMON_CENTER_1F), MAP_NUM(CERULEAN_CITY_POKEMON_CENTER_1F)},
    [SPAWN_LAVENDER_TOWN   - 1] = {MAP_GROUP(LAVENDER_TOWN_POKEMON_CENTER_1F), MAP_NUM(LAVENDER_TOWN_POKEMON_CENTER_1F)},
    [SPAWN_VERMILION_CITY  - 1] = {MAP_GROUP(VERMILION_CITY_POKEMON_CENTER_1F), MAP_NUM(VERMILION_CITY_POKEMON_CENTER_1F)},
    [SPAWN_CELADON_CITY    - 1] = {MAP_GROUP(CELADON_CITY_POKEMON_CENTER_1F), MAP_NUM(CELADON_CITY_POKEMON_CENTER_1F)},
    [SPAWN_FUCHSIA_CITY    - 1] = {MAP_GROUP(FUCHSIA_CITY_POKEMON_CENTER_1F), MAP_NUM(FUCHSIA_CITY_POKEMON_CENTER_1F)},
    [SPAWN_CINNABAR_ISLAND - 1] = {MAP_GROUP(CINNABAR_ISLAND_POKEMON_CENTER_1F), MAP_NUM(CINNABAR_ISLAND_POKEMON_CENTER_1F)},
    [SPAWN_INDIGO_PLATEAU  - 1] = {MAP_GROUP(INDIGO_PLATEAU_POKEMON_CENTER_1F), MAP_NUM(INDIGO_PLATEAU_POKEMON_CENTER_1F)},
    [SPAWN_SAFFRON_CITY    - 1] = {MAP_GROUP(SAFFRON_CITY_POKEMON_CENTER_1F), MAP_NUM(SAFFRON_CITY_POKEMON_CENTER_1F)},
    [SPAWN_ROUTE4          - 1] = {MAP_GROUP(ROUTE4_POKEMON_CENTER_1F), MAP_NUM(ROUTE4_POKEMON_CENTER_1F)},
    [SPAWN_ROUTE10         - 1] = {MAP_GROUP(ROUTE10_POKEMON_CENTER_1F), MAP_NUM(ROUTE10_POKEMON_CENTER_1F)},
    [SPAWN_ONE_ISLAND      - 1] = {MAP_GROUP(ONE_ISLAND_POKEMON_CENTER_1F), MAP_NUM(ONE_ISLAND_POKEMON_CENTER_1F)},
    [SPAWN_TWO_ISLAND      - 1] = {MAP_GROUP(TWO_ISLAND_POKEMON_CENTER_1F), MAP_NUM(TWO_ISLAND_POKEMON_CENTER_1F)},
    [SPAWN_THREE_ISLAND    - 1] = {MAP_GROUP(THREE_ISLAND_POKEMON_CENTER_1F), MAP_NUM(THREE_ISLAND_POKEMON_CENTER_1F)},
    [SPAWN_FOUR_ISLAND     - 1] = {MAP_GROUP(FOUR_ISLAND_POKEMON_CENTER_1F), MAP_NUM(FOUR_ISLAND_POKEMON_CENTER_1F)},
    [SPAWN_FIVE_ISLAND     - 1] = {MAP_GROUP(FIVE_ISLAND_POKEMON_CENTER_1F), MAP_NUM(FIVE_ISLAND_POKEMON_CENTER_1F)},
    [SPAWN_SEVEN_ISLAND    - 1] = {MAP_GROUP(SEVEN_ISLAND_POKEMON_CENTER_1F), MAP_NUM(SEVEN_ISLAND_POKEMON_CENTER_1F)},
    [SPAWN_SIX_ISLAND      - 1] = {MAP_GROUP(SIX_ISLAND_POKEMON_CENTER_1F), MAP_NUM(SIX_ISLAND_POKEMON_CENTER_1F)}
};

// When you respawn, your character scurries back to either their house
// or a Pokémon Center, and hands their fainted Pokémon to their mother
// or the Nurse for healing.
// This array defines the index of the NPC on the map defined above
// with whom your character interacts in this cutscene.
static const u8 sBlackoutRespawnHealerNpcIds[] = {
    [SPAWN_PALLET_TOWN     - 1] = 1,
    [SPAWN_VIRIDIAN_CITY   - 1] = 1,
    [SPAWN_PEWTER_CITY     - 1] = 3,
    [SPAWN_CERULEAN_CITY   - 1] = 1,
    [SPAWN_LAVENDER_TOWN   - 1] = 1,
    [SPAWN_VERMILION_CITY  - 1] = 1,
    [SPAWN_CELADON_CITY    - 1] = 1,
    [SPAWN_FUCHSIA_CITY    - 1] = 1,
    [SPAWN_CINNABAR_ISLAND - 1] = 1,
    [SPAWN_INDIGO_PLATEAU  - 1] = 2,
    [SPAWN_SAFFRON_CITY    - 1] = 1,
    [SPAWN_ROUTE4          - 1] = 1,
    [SPAWN_ROUTE10         - 1] = 1,
    [SPAWN_ONE_ISLAND      - 1] = 1,
    [SPAWN_TWO_ISLAND      - 1] = 1,
    [SPAWN_THREE_ISLAND    - 1] = 1,
    [SPAWN_FOUR_ISLAND     - 1] = 1,
    [SPAWN_FIVE_ISLAND     - 1] = 1,
    [SPAWN_SEVEN_ISLAND    - 1] = 1,
    [SPAWN_SIX_ISLAND      - 1] = 1
};

u32 GetHealLocationIndexFromMapGroupAndNum(u16 mapGroup, u16 mapNum)
{
    u32 i;

    for (i = 0; i < NELEMS(sSpawnPoints); i++) {
        if (sSpawnPoints[i].group == mapGroup && sSpawnPoints[i].map == mapNum)
        {
            return i + 1;
        }
    }

    return 0;
}

const struct HealLocation * GetHealLocationPointerFromMapGroupAndNum(u16 mapGroup, u16 mapNum)
{
    u32 i = GetHealLocationIndexFromMapGroupAndNum(mapGroup, mapNum);
    if (i == 0)
        return NULL;

    return &sSpawnPoints[i - 1];
}

const struct HealLocation * GetHealLocationPointer(u32 idx)
{
    if (idx == 0)
        return NULL;
    if (idx > NELEMS(sSpawnPoints))
        return NULL;
    return &sSpawnPoints[idx - 1];
}

void SetBlackoutRespawnWarpAndHealerNpc(struct WarpData * warp)
{
    u32 healLocationIdx;

    if (VarGet(VAR_MAP_SCENE_TRAINER_TOWER) == 1)
    {
        if (!gSaveBlock1Ptr->trainerTower[gSaveBlock1Ptr->towerChallengeId].spokeToOwner)
            VarSet(VAR_MAP_SCENE_TRAINER_TOWER, 0);
        gSpecialVar_LastTalked = 1;
        warp->x = 4;
        warp->y = 11;
        warp->mapGroup = MAP_GROUP(TRAINER_TOWER_LOBBY);
        warp->mapNum = MAP_NUM(TRAINER_TOWER_LOBBY);
        warp->warpId = 0xFF;
    }
    else
    {
        healLocationIdx = GetHealLocationIndexFromMapGroupAndNum(gSaveBlock1Ptr->lastHealLocation.mapGroup, gSaveBlock1Ptr->lastHealLocation.mapNum);
        warp->mapGroup = sBlackoutRespawnHealCenterMapIdxs[healLocationIdx - 1][0];
        warp->mapNum = sBlackoutRespawnHealCenterMapIdxs[healLocationIdx - 1][1];
        warp->warpId = 0xFF;

        if (sBlackoutRespawnHealCenterMapIdxs[healLocationIdx - 1][0] == MAP_GROUP(PALLET_TOWN_PLAYERS_HOUSE_1F) && sBlackoutRespawnHealCenterMapIdxs[healLocationIdx - 1][1] == MAP_NUM(PALLET_TOWN_PLAYERS_HOUSE_1F))
        {
            warp->x = 8;
            warp->y = 5;
        }
        else if (sBlackoutRespawnHealCenterMapIdxs[healLocationIdx - 1][0] == MAP_GROUP(INDIGO_PLATEAU_POKEMON_CENTER_1F) && sBlackoutRespawnHealCenterMapIdxs[healLocationIdx - 1][1] == MAP_NUM(INDIGO_PLATEAU_POKEMON_CENTER_1F))
        {
            warp->x = 13;
            warp->y = 12;
        }
        else if (sBlackoutRespawnHealCenterMapIdxs[healLocationIdx - 1][0] == MAP_GROUP(ONE_ISLAND_POKEMON_CENTER_1F) && sBlackoutRespawnHealCenterMapIdxs[healLocationIdx - 1][1] == MAP_NUM(ONE_ISLAND_POKEMON_CENTER_1F))
        {
            warp->x = 5;
            warp->y = 4;
        }
        else if (sBlackoutRespawnHealCenterMapIdxs[healLocationIdx - 1][0] == MAP_GROUP(TRAINER_TOWER_LOBBY) && sBlackoutRespawnHealCenterMapIdxs[healLocationIdx - 1][1] == MAP_NUM(TRAINER_TOWER_LOBBY))
        {
            warp->x = 4;
            warp->y = 11;
            VarSet(VAR_MAP_SCENE_TRAINER_TOWER, 0);
        }
        else
        {
            warp->x = 7;
            warp->y = 4;
        }
        SetBlackoutRespawnHealerNpcAsLastTalked(healLocationIdx);
    }
}

static void SetBlackoutRespawnHealerNpcAsLastTalked(u32 healLocationIdx)
{
    gSpecialVar_LastTalked = sBlackoutRespawnHealerNpcIds[healLocationIdx - 1];
}
