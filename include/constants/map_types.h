#ifndef GUARD_CONSTANTS_MAP_TYPES_H
#define GUARD_CONSTANTS_MAP_TYPES_H

#define MAP_TYPE_NONE        0
#define MAP_TYPE_TOWN        1
#define MAP_TYPE_CITY        2 // Not used by any map. RSE use this map type to distinguish Town and City. FRLG make no distinction
#define MAP_TYPE_ROUTE       3
#define MAP_TYPE_UNDERGROUND 4
#define MAP_TYPE_UNDERWATER  5 // Not used by any map.
#define MAP_TYPE_OCEAN_ROUTE 6 // Not used by any map.
#define MAP_TYPE_UNKNOWN     7 // Not used by any map.
#define MAP_TYPE_INDOOR      8
#define MAP_TYPE_SECRET_BASE 9 // Not used by any map.


//Battle backgrounds
enum MapBattleScene
{
    MAP_BATTLE_SCENE_NORMAL,
    MAP_BATTLE_SCENE_GYM,
    MAP_BATTLE_SCENE_INDOOR_1, // Pokemon Tower, Tanoby ruins
    MAP_BATTLE_SCENE_INDOOR_2, // Pokemon Mansion, Power Plant, Rocket Hideout/Warehouse
    MAP_BATTLE_SCENE_LORELEI,
    MAP_BATTLE_SCENE_BRUNO,
    MAP_BATTLE_SCENE_AGATHA,
    MAP_BATTLE_SCENE_LANCE,
    MAP_BATTLE_SCENE_LINK,
    MAP_BATTLE_SCENE_MAGMA,
    MAP_BATTLE_SCENE_AQUA,
    MAP_BATTLE_SCENE_FRONTIER,
    MAP_BATTLE_SCENE_LEADER,
    MAP_BATTLE_SCENE_CHAMPION,
    MAP_BATTLE_SCENE_GROUDON,
    MAP_BATTLE_SCENE_KYOGRE,
    MAP_BATTLE_SCENE_RAYQUAZA,
};

#endif  // GUARD_CONSTANTS_MAP_TYPES_H
