#ifndef GUARD_CONSTANTS_MAPS_H
#define GUARD_CONSTANTS_MAPS_H

#include "constants/map_groups.h"

#define MAP_NONE (0x7F | (0x7F << 8))
#define MAP_UNDEFINED (0xFF | (0xFF << 8))

#define MAP_GROUP(map) (MAP_##map >> 8)
#define MAP_NUM(map) (MAP_##map & 0xFF)

#define MAP(map) MAP_GROUP(map), MAP_NUM(map)

#define MAP_BATTLE_SCENE_NORMAL   0
#define MAP_BATTLE_SCENE_GYM      1
#define MAP_BATTLE_SCENE_INDOOR_1 2 // Pokemon Tower, Tanoby ruins
#define MAP_BATTLE_SCENE_INDOOR_2 3 // Pokemon Mansion, Power Plant, Rocket Hideout/Warehouse
#define MAP_BATTLE_SCENE_LORELEI  4
#define MAP_BATTLE_SCENE_BRUNO    5
#define MAP_BATTLE_SCENE_AGATHA   6
#define MAP_BATTLE_SCENE_LANCE    7
#define MAP_BATTLE_SCENE_LINK     8

#define MAP_TYPE_NONE        0
#define MAP_TYPE_TOWN        1
#define MAP_TYPE_CITY        2 // Unused. RSE use this map type to distinguish Town and City. FRLG make no distinction
#define MAP_TYPE_ROUTE       3
#define MAP_TYPE_UNDERGROUND 4
#define MAP_TYPE_UNDERWATER  5 // Unused
#define MAP_TYPE_OCEAN_ROUTE 6 // Unused
#define MAP_TYPE_UNKNOWN     7 // Unused
#define MAP_TYPE_INDOOR      8
#define MAP_TYPE_SECRET_BASE 9 // Unused

#endif  // GUARD_CONSTANTS_MAPS_H
