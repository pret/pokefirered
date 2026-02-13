#ifndef GUARD_CONSTANTS_MENU_H
#define GUARD_CONSTANTS_MENU_H

#define MULTI_B_PRESSED  127
#define SCR_MENU_CANCEL 127
#define SCR_MENU_UNSET  255

#define MAX_MULTICHOICE_WIDTH 28

#define MULTI_YESNO                                             0
#define MULTICHOICE_EEVEELUTIONS                                1
#define MULTICHOICE_TRAINER_CARD_ICON_TINT                      2
#define MULTICHOICE_HOF_QUIT                                    3
#define MULTICHOICE_EGGS_QUIT                                   4
#define MULTICHOICE_VICTORIES_QUIT                              5
#define MULTICHOICE_HOF_EGGS_QUIT                               6
#define MULTICHOICE_HOF_VICTORIES_QUIT                          7
#define MULTICHOICE_EGGS_VICTORIES_QUIT                         8
#define MULTICHOICE_HOF_EGGS_VICTORIES_QUIT                     9
#define MULTICHOICE_EXIT                                       10
#define MULTICHOICE_EXIT_2                                     11
#define MULTICHOICE_EXIT_3                                     12
#define MULTICHOICE_BIKE_SHOP                                  13
#define MULTICHOICE_GAME_CORNER_POKEMON_PRIZES                 14
#define MULTICHOICE_TRAINER_SCHOOL_WHITEBOARD                  15
#define MULTICHOICE_YES_NO_INFO                                16
#define MULTICHOICE_SINGLE_DOUBLE_MULTI_INFO_EXIT              17
#define MULTICHOICE_YES_NO_INFO_2                              18
#define MULTI_CHALLENGEINFO                                    19
#define MULTICHOICE_ROOFTOP_B1F                                20
#define MULTICHOICE_HELIX                                      21
#define MULTICHOICE_DOME                                       22
#define MULTICHOICE_AMBER                                      23
#define MULTICHOICE_HELIX_AMBER                                24
#define MULTICHOICE_DOME_AMBER                                 25
#define MULTICHOICE_CELADON_VENDING_MACHINE                    26
#define MULTICHOICE_GAME_CORNER_COIN_PURCHASE_COUNTER          27
#define MULTICHOICE_EXCELLENT_NOT_SO_BAD                       28
#define MULTICHOICE_RIGHT_LEFT                                 29
#define MULTICHOICE_GAME_CORNER_TMPRIZES                       30
#define MULTICHOICE_DEPT_STORE_ELEVATOR                        31
#define MULTICHOICE_THIRSTY_GIRL_FRESH_WATER                   32
#define MULTICHOICE_THIRSTY_GIRL_SODA_POP                      33
#define MULTICHOICE_THIRSTY_GIRL_FRESH_WATER_SODA_POP          34
#define MULTICHOICE_THIRSTY_GIRL_LEMONADE                      35
#define MULTICHOICE_THIRSTY_GIRL_FRESH_WATER_LEMONADE          36
#define MULTICHOICE_THIRSTY_GIRL_SODA_POP_LEMONADE             37
#define MULTICHOICE_THIRSTY_GIRL_FRESH_WATER_SODA_POP_LEMONADE 38
#define MULTICHOICE_TRADE_CENTER_COLOSSEUM                     39
#define MULTICHOICE_LINK_WIRELESS                              40
#define MULTICHOICE_GAME_CORNER_BATTLE_ITEM_PRIZES             41
#define MULTICHOICE_ROCKET_HIDEOUT_ELEVATOR                    42
#define MULTICHOICE_LINKED_DIRECT_UNION                        43
#define MULTICHOICE_ISLAND_23                                  44
#define MULTICHOICE_ISLAND_13                                  45
#define MULTICHOICE_ISLAND_12                                  46
#define MULTICHOICE_TRADE_COLOSSEUM_CRUSH                      47
#define MULTICHOICE_48                                         48
#define MULTICHOICE_POKEJUMP_DODRIO                            49
#define MULTICHOICE_TRADE_COLOSSEUM_2                          50
#define MULTICHOICE_MUSHROOMS                                  51
#define MULTICHOICE_TRADE_COLOSSEUM_BLANK_CRUSH                52
#define MULTICHOICE_TRADE_COLOSSEUM_BLANK                      53
#define MULTICHOICE_SEVII_NAVEL                                54
#define MULTICHOICE_SEVII_BIRTH                                55
#define MULTICHOICE_SEVII_NAVEL_BIRTH                          56
#define MULTICHOICE_SEAGALLOP_123                              57
#define MULTICHOICE_SEAGALLOP_V23                              58
#define MULTICHOICE_SEAGALLOP_V13                              59
#define MULTICHOICE_SEAGALLOP_V12                              60
#define MULTICHOICE_SEAGALLOP_VERMILION                        61
#define MULTI_SSTIDAL_BATTLE_FRONTIER                          62
#define MULTICHOICE_JOIN_OR_LEAD                               63
#define MULTICHOICE_TRAINER_TOWER_MODE                         64
#define MULTI_FRONTIER_RULES                                   65
#define MULTI_FRONTIER_PASS_INFO                               66
#define MULTI_FRONTIER_GAMBLER_BET                             67
#define MULTI_LEVEL_MODE                                       68
#define MULTI_BATTLE_FACTORY_RULES                             69
#define MULTI_GO_ON_RECORD_REST_RETIRE                         70
#define MULTI_GO_ON_REST_RETIRE                                71
#define MULTI_GO_ON_RECORD_RETIRE                              72
#define MULTI_GO_ON_RETIRE                                     73
#define MULTI_BATTLE_ARENA_RULES                               74
#define MULTI_BATTLE_DOME_RULES                                75
#define MULTI_TOURNEY_WITH_RECORD                              76
#define MULTI_TOURNEY_NO_RECORD                                77
#define MULTI_BATTLE_PALACE_RULES                              78
#define MULTI_BATTLE_PYRAMID_RULES                             79
#define MULTI_BATTLE_PIKE_RULES                                80
#define MULTI_FRONTIER_ITEM_CHOOSE                             81
#define MULTI_BATTLE_TOWER_RULES                               82
#define MULTI_BATTLE_TOWER_FEELINGS                            83
#define MULTI_LINK_LEADER                                      84
#define MULTI_SATISFACTION                                     85


#define MULTICHOICE_NONE                                      255

enum ScrollMulti
{
    LISTMENU_BADGES,
    LISTMENU_SILPHCO_FLOORS,
    LISTMENU_ROCKET_HIDEOUT_FLOORS,
    LISTMENU_DEPT_STORE_FLOORS,
    LISTMENU_WIRELESS_LECTURE_HEADERS,
    LISTMENU_BERRY_POWDER,
    LISTMENU_TRAINER_TOWER_FLOORS,
    SCROLL_MULTI_BF_RECEPTIONIST,
    SCROLL_MULTI_BF_MOVE_TUTOR_1,
    SCROLL_MULTI_BF_MOVE_TUTOR_2,
    SCROLL_MULTI_BF_EXCHANGE_CORNER_DECOR_VENDOR_1,
    SCROLL_MULTI_BF_EXCHANGE_CORNER_DECOR_VENDOR_2,
    SCROLL_MULTI_BF_EXCHANGE_CORNER_VITAMIN_VENDOR,
    SCROLL_MULTI_BF_EXCHANGE_CORNER_HOLD_ITEM_VENDOR,
    SCROLL_MULTI_NONE = 99,
};

#define MAX_SCROLL_MULTI_ON_SCREEN 6
#define MAX_SCROLL_MULTI_LENGTH 16

// Std String Ids
#define STDSTRING_COOL              0
#define STDSTRING_BEAUTY            1
#define STDSTRING_CUTE              2
#define STDSTRING_SMART             3
#define STDSTRING_TOUGH             4
#define STDSTRING_COOL2             5
#define STDSTRING_BEAUTY2           6
#define STDSTRING_CUTE2             7
#define STDSTRING_SMART2            8
#define STDSTRING_TOUGH2            9
#define STDSTRING_ITEMS             10
#define STDSTRING_KEY_ITEMS         11
#define STDSTRING_POKEBALLS         12
#define STDSTRING_TMHMS             13
#define STDSTRING_BERRIES           14
#define STDSTRING_BOULDER_BADGE     15
#define STDSTRING_CASCADE_BADGE     16
#define STDSTRING_THUNDER_BADGE     17
#define STDSTRING_RAINBOW_BADGE     18
#define STDSTRING_SOUL_BADGE        19
#define STDSTRING_MARSH_BADGE       20
#define STDSTRING_VOLCANO_BADGE     21
#define STDSTRING_EARTH_BADGE       22
#define STDSTRING_COINS             23
#define STDSTRING_ITEMS_POCKET      24
#define STDSTRING_KEY_ITEMS_POCKET  25
#define STDSTRING_POKEBALLS_POCKET  26
#define STDSTRING_TM_CASE           27
#define STDSTRING_BERRY_POUCH       28
#define STDSTRING_SINGLE            29
#define STDSTRING_DOUBLE            30
#define STDSTRING_MULTI             31
#define STDSTRING_MULTI_LINK        32
#define STDSTRING_BATTLE_DOME       33
#define STDSTRING_BATTLE_FACTORY    34
#define STDSTRING_BATTLE_PALACE     35
#define STDSTRING_BATTLE_ARENA      36
#define STDSTRING_BATTLE_PIKE       37
#define STDSTRING_BATTLE_PYRAMID    38

#endif //GUARD_CONSTANTS_MENU_H
