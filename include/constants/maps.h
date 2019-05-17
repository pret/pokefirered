#ifndef GUARD_CONSTANTS_MAPS_H
#define GUARD_CONSTANTS_MAPS_H

#include "constants/map_groups.h"

#define MAP_NONE (0x7F | (0x7F << 8))
#define MAP_UNDEFINED (0xFF | (0xFF << 8))

#define MAP_GROUP(map) (MAP_##map >> 8)
#define MAP_NUM(map) (MAP_##map & 0xFF)

#define MAP(map) MAP_GROUP(map), MAP_NUM(map)

// temporary map constants
#define BATTLE_SCENE_0 0
#define BATTLE_SCENE_1 1
#define BATTLE_SCENE_2 2
#define BATTLE_SCENE_3 3
#define BATTLE_SCENE_4 4
#define BATTLE_SCENE_5 5
#define BATTLE_SCENE_6 6
#define BATTLE_SCENE_7 7
#define BATTLE_SCENE_8 8
#define BATTLE_SCENE_9 9
#define BATTLE_SCENE_10 10
#define BATTLE_SCENE_11 11
#define BATTLE_SCENE_12 12
#define BATTLE_SCENE_13 13
#define BATTLE_SCENE_14 14
#define BATTLE_SCENE_15 15

#define MAP_TYPE_0 0
#define MAP_TYPE_1 1
#define MAP_TYPE_2 2
#define MAP_TYPE_3 3
#define MAP_TYPE_4 4
#define MAP_TYPE_5 5
#define MAP_TYPE_6 6
#define MAP_TYPE_7 7
#define MAP_TYPE_8 8
#define MAP_TYPE_9 9

#define WEATHER_NONE               0
#define WEATHER_SUNNY_CLOUDS       1   // unused
#define WEATHER_SUNNY              2
#define WEATHER_RAIN               3   // unused
#define WEATHER_SNOW               4   // unused
#define WEATHER_RAIN_THUNDERSTORM  5   // unused
#define WEATHER_FOG_HORIZONTAL     6
#define WEATHER_VOLCANIC_ASH       7   // unused
#define WEATHER_SANDSTORM          8   // unused
#define WEATHER_FOG_DIAGONAL       9   // unused
#define WEATHER_UNDERWATER         10  // unused
#define WEATHER_CLOUDY             11
#define WEATHER_DROUGHT            12  // unused and broken in overworld
#define WEATHER_DOWNPOUR           13  // unused
#define WEATHER_UNDERWATER_BUBBLES 14  // unused

#endif  // GUARD_CONSTANTS_MAPS_H
