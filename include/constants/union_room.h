#ifndef GUARD_CONSTANTS_UNION_ROOM_H
#define GUARD_CONSTANTS_UNION_ROOM_H

// The number of possible group leaders visible in the Union Room.
// Note that this is different than the number of people actively
// connected as children via the Wireless Adapter, which cannot
// exceed RFU_CHILD_MAX (4), for a total of 5 including the player.
#define MAX_UNION_ROOM_LEADERS 8

#define UNION_ROOM_SPAWN_NONE 0
#define UNION_ROOM_SPAWN_IN   1
#define UNION_ROOM_SPAWN_OUT  2

#define UNION_ROOM_MAX_LEVEL 30

// The number of possible trainer classes for a trainer of a given gender in the Union Room.
// This value is necessarily a power of 2 because of the way it's treated in GetUnionRoomTrainerPic / GetUnionRoomTrainerClass
#define NUM_UNION_ROOM_CLASSES (1 << 3) // 8

#define ACTIVITY_NONE               0
#define ACTIVITY_BATTLE_SINGLE      1
#define ACTIVITY_BATTLE_DOUBLE      2
#define ACTIVITY_BATTLE_MULTI       3
#define ACTIVITY_TRADE              4
#define ACTIVITY_CHAT               5
#define ACTIVITY_WONDER_CARD_DUP    6 // Duplicates of later WONDER constants
#define ACTIVITY_WONDER_NEWS_DUP    7 //
#define ACTIVITY_CARD               8
#define ACTIVITY_POKEMON_JUMP       9
#define ACTIVITY_BERRY_CRUSH        10
#define ACTIVITY_BERRY_PICK         11
#define ACTIVITY_SEARCH             12
#define ACTIVITY_SPIN_TRADE         13
#define ACTIVITY_ITEM_TRADE         14 // Replaced with ACTIVITY_BATTLE_TOWER_OPEN in Emerald
#define ACTIVITY_RECORD_CORNER      15
#define ACTIVITY_BERRY_BLENDER      16

// Player response
#define ACTIVITY_ACCEPT             17
#define ACTIVITY_DECLINE            18

#define ACTIVITY_NPCTALK            19
#define ACTIVITY_PLYRTALK           20

#define ACTIVITY_WONDER_CARD        21
#define ACTIVITY_WONDER_NEWS        22

#define IN_UNION_ROOM               (1 << 6)

#define LINK_GROUP_SINGLE_BATTLE        0
#define LINK_GROUP_DOUBLE_BATTLE        1
#define LINK_GROUP_MULTI_BATTLE         2
#define LINK_GROUP_TRADE                3
#define LINK_GROUP_POKEMON_JUMP         4
#define LINK_GROUP_BERRY_CRUSH          5
#define LINK_GROUP_BERRY_PICKING        6
#define LINK_GROUP_WONDER_CARD          7
#define LINK_GROUP_WONDER_NEWS          8
#define LINK_GROUP_UNION_ROOM_RESUME    9
#define LINK_GROUP_UNION_ROOM_INIT     10
#define LINK_GROUP_UNK_11              11
#define LINK_GROUP_UNK_12              12
#define NUM_LINK_GROUP_TYPES           13

#define UR_TRADE_MATCH  0
#define UR_TRADE_NOTYPE 1
#define UR_TRADE_NOEGG  2

#define UR_TRADE_READY             0
#define UR_TRADE_PLAYER_NOT_READY  1
#define UR_TRADE_PARTNER_NOT_READY 2

#define UR_INTERACT_PLAYER_1   1
#define UR_INTERACT_PLAYER_2   2
#define UR_INTERACT_PLAYER_3   3
#define UR_INTERACT_PLAYER_4   4
#define UR_INTERACT_PLAYER_5   5
#define UR_INTERACT_PLAYER_6   6
#define UR_INTERACT_PLAYER_7   7
#define UR_INTERACT_PLAYER_8   8
#define UR_INTERACT_ATTENDANT  9
#define UR_INTERACT_UNUSED     10
#define UR_INTERACT_START_MENU 11

#endif //GUARD_CONSTANTS_UNION_ROOM_H
