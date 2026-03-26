#include "global.h"
#include "heal_location.h"
#include "event_data.h"
#include "constants/maps.h"
#include "constants/heal_locations.h"

static void SetWhiteoutRespawnHealerNpcAsLastTalked(u32 healLocationIdx);

// Arrays described here because porymap will overrwrite the below data file

// sSpawnPoints
// This array defines the fly points for unlocked spawns.

// sWhiteoutRespawnHealCenterMapIdxs
// This array defines the map where you actually respawn when you white out,
// based on where you last checkpointed.
// This is either the player's house or a Pokémon Center.
// The data are u16 instead of u8 for reasons unknown.

// sWhiteoutRespawnHealerNpcIds
// When you respawn, your character scurries back to either their house
// or a Pokémon Center, and hands their fainted Pokémon to their mother
// or the Nurse for healing.
// This array defines the index of the NPC on the map defined above
// with whom your character interacts in this cutscene.

#include "data/heal_locations.h"

static u32 GetHealLocationIndexFromMapGroupAndNum(u16 mapGroup, u16 mapNum)
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

static const struct HealLocation * GetHealLocationPointerFromMapGroupAndNum(u16 mapGroup, u16 mapNum)
{
    u32 i = GetHealLocationIndexFromMapGroupAndNum(mapGroup, mapNum);
    if (i == 0)
        return NULL;

    return &sSpawnPoints[i - 1];
}

const struct HealLocation * GetHealLocation(u32 idx)
{
    if (idx == 0)
        return NULL;
    if (idx > NELEMS(sSpawnPoints))
        return NULL;
    return &sSpawnPoints[idx - 1];
}

void SetWhiteoutRespawnWarpAndHealerNpc(struct WarpData * warp)
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
        warp->mapGroup = sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][0];
        warp->mapNum = sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][1];
        warp->warpId = 0xFF;

        if (sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][0] == MAP_GROUP(PALLET_TOWN_PLAYERS_HOUSE_1F) && sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][1] == MAP_NUM(PALLET_TOWN_PLAYERS_HOUSE_1F))
        {
            warp->x = 8;
            warp->y = 5;
        }
        else if (sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][0] == MAP_GROUP(INDIGO_PLATEAU_POKEMON_CENTER_1F) && sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][1] == MAP_NUM(INDIGO_PLATEAU_POKEMON_CENTER_1F))
        {
            warp->x = 13;
            warp->y = 12;
        }
        else if (sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][0] == MAP_GROUP(ONE_ISLAND_POKEMON_CENTER_1F) && sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][1] == MAP_NUM(ONE_ISLAND_POKEMON_CENTER_1F))
        {
            warp->x = 5;
            warp->y = 4;
        }
        else if (sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][0] == MAP_GROUP(TRAINER_TOWER_LOBBY) && sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][1] == MAP_NUM(TRAINER_TOWER_LOBBY))
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
        SetWhiteoutRespawnHealerNpcAsLastTalked(healLocationIdx);
    }
}

static void SetWhiteoutRespawnHealerNpcAsLastTalked(u32 healLocationIdx)
{
    gSpecialVar_LastTalked = sWhiteoutRespawnHealerNpcIds[healLocationIdx - 1];
}
