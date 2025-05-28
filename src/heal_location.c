#include "global.h"
#include "heal_location.h"
#include "event_data.h"
#include "constants/maps.h"
#include "constants/map_event_ids.h"
#include "constants/heal_locations.h"

static void SetWhiteoutRespawnHealerNpcAsLastTalked(u32 healLocationIdx);

// Arrays described here because mapjson will overrwrite the below data file

// sHealLocations
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

    for (i = 0; i < ARRAY_COUNT(sHealLocations); i++) {
        if (sHealLocations[i].mapGroup == mapGroup && sHealLocations[i].mapNum == mapNum)
        {
            return i + 1;
        }
    }

    return HEAL_LOCATION_NONE;
}

const struct HealLocation * GetHealLocation(u32 idx)
{
    if (idx == HEAL_LOCATION_NONE)
        return NULL;
    if (idx > ARRAY_COUNT(sHealLocations))
        return NULL;
    return &sHealLocations[idx - 1];
}

void SetWhiteoutRespawnWarpAndHealerNpc(struct WarpData * warp)
{
    u32 healLocationIdx;

    if (VarGet(VAR_MAP_SCENE_TRAINER_TOWER) == 1)
    {
#if FREE_TRAINER_HILL == FALSE
        if (!gSaveBlock1Ptr->trainerTower[gSaveBlock1Ptr->towerChallengeId].spokeToOwner)
#endif //FREE_TRAINER_HILL
            VarSet(VAR_MAP_SCENE_TRAINER_TOWER, 0);
        gSpecialVar_LastTalked = 1;
        warp->x = 4;
        warp->y = 11;
        warp->mapGroup = MAP_GROUP(MAP_TRAINER_TOWER_LOBBY);
        warp->mapNum = MAP_NUM(MAP_TRAINER_TOWER_LOBBY);
        warp->warpId = 0xFF;
    }
    else
    {
        healLocationIdx = GetHealLocationIndexFromMapGroupAndNum(gSaveBlock1Ptr->lastHealLocation.mapGroup, gSaveBlock1Ptr->lastHealLocation.mapNum);
#ifdef BUGFIX
        // Avoid out of bounds read
        if (healLocationIdx == HEAL_LOCATION_NONE)
            return;
#endif
        warp->mapGroup = sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][0];
        warp->mapNum = sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][1];
        warp->warpId = WARP_ID_NONE;

        if (sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][0] == MAP_GROUP(MAP_PALLET_TOWN_PLAYERS_HOUSE_1F) && sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][1] == MAP_NUM(MAP_PALLET_TOWN_PLAYERS_HOUSE_1F))
        {
            warp->x = 8;
            warp->y = 5;
        }
        else if (sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][0] == MAP_GROUP(MAP_INDIGO_PLATEAU_POKEMON_CENTER_1F) && sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][1] == MAP_NUM(MAP_INDIGO_PLATEAU_POKEMON_CENTER_1F))
        {
            warp->x = 13;
            warp->y = 12;
        }
        else if (sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][0] == MAP_GROUP(MAP_ONE_ISLAND_POKEMON_CENTER_1F) && sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][1] == MAP_NUM(MAP_ONE_ISLAND_POKEMON_CENTER_1F))
        {
            warp->x = 5;
            warp->y = 4;
        }
        else if (sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][0] == MAP_GROUP(MAP_TRAINER_TOWER_LOBBY) && sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][1] == MAP_NUM(MAP_TRAINER_TOWER_LOBBY))
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
