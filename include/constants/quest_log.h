#ifndef GUARD_CONSTANTS_QUEST_LOG_H
#define GUARD_CONSTANTS_QUEST_LOG_H

#define QL_STATE_RECORDING     1
#define QL_STATE_PLAYBACK      2
#define QL_STATE_PLAYBACK_LAST 3

#define QL_START_NORMAL 1
#define QL_START_WARP   2

// gGlobalFieldTintMode
#define QL_TINT_NONE              0
#define QL_TINT_GRAYSCALE         1
#define QL_TINT_SEPIA             2
#define QL_TINT_BACKUP_GRAYSCALE  3

#define QL_IS_PLAYBACK_STATE (gQuestLogState == QL_STATE_PLAYBACK || gQuestLogState == QL_STATE_PLAYBACK_LAST)

#define QL_EVENT_0                              0 // Null
#define QL_EVENT_1                              1 // Null
#define QL_EVENT_2                              2 // Null
#define QL_EVENT_SWITCHED_PARTY_ORDER           3
#define QL_EVENT_USED_ITEM                      4
#define QL_EVENT_GAVE_HELD_ITEM                 5
#define QL_EVENT_GAVE_HELD_ITEM_BAG             6
#define QL_EVENT_GAVE_HELD_ITEM_PC              7
#define QL_EVENT_TOOK_HELD_ITEM                 8
#define QL_EVENT_SWAPPED_HELD_ITEM              9
#define QL_EVENT_SWAPPED_HELD_ITEM_PC           10
#define QL_EVENT_USED_PKMN_CENTER               11
#define QL_EVENT_LINK_TRADED                    12
#define QL_EVENT_LINK_BATTLED_SINGLE            13
#define QL_EVENT_LINK_BATTLED_DOUBLE            14
#define QL_EVENT_LINK_BATTLED_MULTI             15
#define QL_EVENT_USED_UNION_ROOM                16
#define QL_EVENT_USED_UNION_ROOM_CHAT           17
#define QL_EVENT_LINK_TRADED_UNION              18
#define QL_EVENT_LINK_BATTLED_UNION             19
#define QL_EVENT_SWITCHED_MONS_BETWEEN_BOXES    20
#define QL_EVENT_SWITCHED_MONS_WITHIN_BOX       21
#define QL_EVENT_SWITCHED_PARTY_MON_FOR_PC_MON  22
#define QL_EVENT_MOVED_MON_BETWEEN_BOXES        23
#define QL_EVENT_MOVED_MON_WITHIN_BOX           24
#define QL_EVENT_WITHDREW_MON_PC                25
#define QL_EVENT_DEPOSITED_MON_PC               26
#define QL_EVENT_SWITCHED_MULTIPLE_MONS         27
#define QL_EVENT_DEPOSITED_ITEM_PC              28
#define QL_EVENT_WITHDREW_ITEM_PC               29
#define QL_EVENT_DEFEATED_GYM_LEADER            30
#define QL_EVENT_DEFEATED_WILD_MON              31
#define QL_EVENT_DEFEATED_E4_MEMBER             32
#define QL_EVENT_DEFEATED_CHAMPION              33
#define QL_EVENT_DEFEATED_TRAINER               34
#define QL_EVENT_DEPARTED                       35
#define QL_EVENT_USED_FIELD_MOVE                36
#define QL_EVENT_BOUGHT_ITEM                    37
#define QL_EVENT_SOLD_ITEM                      38
#define QL_EVENT_39                             39 // Null
#define QL_EVENT_OBTAINED_ITEM                  40
#define QL_EVENT_41                             41 // Null
#define QL_EVENT_ARRIVED                        42

#define QL_EVENT_USED_POKEMART QL_EVENT_BOUGHT_ITEM - 1 // Used as a start pos for QL_EVENT_BOUGHT_ITEM / QL_EVENT_SOLD_ITEM

#define IS_LINK_QL_EVENT(event)((event) >= QL_EVENT_LINK_TRADED && (event) <= QL_EVENT_LINK_BATTLED_UNION)
#define IS_VALID_QL_EVENT(event)((event) >= QL_EVENT_SWITCHED_PARTY_ORDER && (event) <= QL_EVENT_ARRIVED)

#define QL_LOCATION_HOME                0
#define QL_LOCATION_OAKS_LAB            1
#define QL_LOCATION_VIRIDIAN_GYM        2
#define QL_LOCATION_LEAGUE_GATE_1       3
#define QL_LOCATION_LEAGUE_GATE_2       4
#define QL_LOCATION_VIRIDIAN_FOREST_1   5
#define QL_LOCATION_VIRIDIAN_FOREST_2   6
#define QL_LOCATION_PEWTER_MUSEUM       7
#define QL_LOCATION_PEWTER_GYM          8
#define QL_LOCATION_MT_MOON_1           9
#define QL_LOCATION_MT_MOON_2           10
#define QL_LOCATION_CERULEAN_GYM        11
#define QL_LOCATION_BIKE_SHOP           12
#define QL_LOCATION_BILLS_HOUSE         13
#define QL_LOCATION_DAY_CARE            14
#define QL_LOCATION_UNDERGROUND_PATH_1  15
#define QL_LOCATION_UNDERGROUND_PATH_2  16
#define QL_LOCATION_PKMN_FAN_CLUB       17
#define QL_LOCATION_VERMILION_GYM       18
#define QL_LOCATION_SS_ANNE             19
#define QL_LOCATION_DIGLETTS_CAVE_1     20
#define QL_LOCATION_DIGLETTS_CAVE_2     21
#define QL_LOCATION_ROCK_TUNNEL_1       22
#define QL_LOCATION_ROCK_TUNNEL_2       23
#define QL_LOCATION_POWER_PLANT         24
#define QL_LOCATION_PKMN_TOWER          25
#define QL_LOCATION_VOLUNTEER_HOUSE     26
#define QL_LOCATION_NAME_RATERS_HOUSE   27
#define QL_LOCATION_UNDERGROUND_PATH_3  28
#define QL_LOCATION_UNDERGROUND_PATH_4  29
#define QL_LOCATION_CELADON_DEPT_STORE  30
#define QL_LOCATION_CELADON_MANSION     31
#define QL_LOCATION_GAME_CORNER         32
#define QL_LOCATION_CELADON_GYM         33
#define QL_LOCATION_CELADON_RESTAURANT  34
#define QL_LOCATION_ROCKET_HIDEOUT      35
#define QL_LOCATION_SAFARI_ZONE         36
#define QL_LOCATION_FUCHSIA_GYM         37
#define QL_LOCATION_WARDENS_HOME        38
#define QL_LOCATION_FIGHTING_DOJO       39
#define QL_LOCATION_SAFFRON_GYM         40
#define QL_LOCATION_SILPH_CO            41
#define QL_LOCATION_SEAFOAM_ISLANDS_1   42
#define QL_LOCATION_SEAFOAM_ISLANDS_2   43
#define QL_LOCATION_PKMN_MANSION        44
#define QL_LOCATION_CINNABAR_GYM        45
#define QL_LOCATION_CINNABAR_LAB        46
#define QL_LOCATION_VICTORY_ROAD_1      47
#define QL_LOCATION_VICTORY_ROAD_2      48
#define QL_LOCATION_PKMN_LEAGUE         49
#define QL_LOCATION_CERULEAN_CAVE       50

#define QL_DEPARTED_TOWN_BUILDING    0
#define QL_DEPARTED_MUSEUM           1
#define QL_DEPARTED_GAME_CORNER      2
#define QL_DEPARTED_HOME             3
#define QL_DEPARTED_OAKS_LAB         4
#define QL_DEPARTED_GYM              5
#define QL_DEPARTED_SAFARI_ZONE      6
#define QL_DEPARTED_CAVE             7
#define QL_DEPARTED_MISC_BUILDING_1  8
#define QL_DEPARTED_MISC_BUILDING_2  9

#define QL_INPUT_OFF 0
#define QL_INPUT_UP 1
#define QL_INPUT_DOWN 2
#define QL_INPUT_LEFT 3
#define QL_INPUT_RIGHT 4
#define QL_INPUT_L 5
#define QL_INPUT_R 6
#define QL_INPUT_START 7
#define QL_INPUT_SELECT 8
#define QL_INPUT_A 9
#define QL_INPUT_B 10


#define FANCLUB_MEMBER1        0
#define FANCLUB_MEMBER2        1
#define FANCLUB_MEMBER3        2
#define FANCLUB_MEMBER4        3
#define FANCLUB_MEMBER5        4
#define FANCLUB_MEMBER6        5
#define FANCLUB_MEMBER7        6
#define FANCLUB_MEMBER8        7

#define NUM_TRAINER_FAN_CLUB_MEMBERS  8

#endif //GUARD_CONSTANTS_QUEST_LOG_H
