#include "constants/species.h"
#include "constants/items.h"
#include "constants/maps.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata

	.align 2
gUnknown_83F5AF8:: @ 83F5AF8
	.4byte gStringVar1
	.4byte gStringVar2
	.4byte gStringVar3

gUnknown_83F5B04::
	.incbin "baserom.gba", 0x3F5B04, 0x16

sSlotMachineIndices:: @ 83F5B1A
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 1
	.byte 1
	.byte 2
	.byte 2
	.byte 2
	.byte 3
	.byte 3
	.byte 3
	.byte 4
	.byte 4
	.byte 5

	.align 1
sResortGorgeousDeluxeRewards:: @ 83F5B30
	.2byte ITEM_BIG_PEARL
	.2byte ITEM_PEARL
	.2byte ITEM_STARDUST
	.2byte ITEM_STAR_PIECE
	.2byte ITEM_NUGGET
	.2byte ITEM_RARE_CANDY

	.align 2
sElevatorCurrentFloorWindowTemplate:: @ 83F5B3C
	.byte 0, 22, 1, 7, 4, 15
	.2byte 0x0008

sFloorNamePointers:: @ 83F5B44
	.4byte gUnknown_8418069
	.4byte gUnknown_8418065
	.4byte gUnknown_8418061
	.4byte gUnknown_841805D
	.4byte gUnknown_841803A
	.4byte gUnknown_841803D
	.4byte gUnknown_8418040
	.4byte gUnknown_8418043
	.4byte gUnknown_8418046
	.4byte gUnknown_8418049
	.4byte gUnknown_841804C
	.4byte gUnknown_841804F
	.4byte gUnknown_8418052
	.4byte gUnknown_8418055
	.4byte gUnknown_8418059
	.4byte gUnknown_841806D

gUnknown_83F5B84::
	.byte 26
	.byte 26
	.byte 26
	.byte 26
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 26
	.byte 26
	.byte 18

	.align 1
sElevatorWindowMetatilesGoingUp:: @ 83F5B94
	.2byte 0x02e8, 0x02e9, 0x02ea
	.2byte 0x02f0, 0x02f1, 0x02f2
	.2byte 0x02f8, 0x02f9, 0x02fa

	.align 1
sElevatorWindowMetatilesGoingDown:: @ 83F5BA6
	.2byte 0x02e8, 0x02ea, 0x02e9
	.2byte 0x02f0, 0x02f2, 0x02f1
	.2byte 0x02f8, 0x02fa, 0x02f9

sElevatorAnimationDuration:: @ 83F5BB8
	.byte 8
	.byte 16
	.byte 24
	.byte 32
	.byte 38
	.byte 46
	.byte 53
	.byte 56
	.byte 57

sElevatorWindowAnimDuration:: @ 83F5BC1
	.byte  3
	.byte  6
	.byte  9
	.byte 12
	.byte 15
	.byte 18
	.byte 21
	.byte 24
	.byte 27

	.align 2
gUnknown_83F5BCC:: @ 83F5BCC
	.4byte gUnknown_8417FD9
	.4byte gUnknown_8417FE6
	.4byte gUnknown_8417FF3
	.4byte gUnknown_8418000
	.4byte gUnknown_841800D
	.4byte gUnknown_8418017
	.4byte gUnknown_8418022
	.4byte gUnknown_841802F
	.4byte gOtherText_Exit
	.4byte NULL
	.4byte NULL
	.4byte NULL

	.4byte gUnknown_8418059
	.4byte gUnknown_8418055
	.4byte gUnknown_8418052
	.4byte gUnknown_841804F
	.4byte gUnknown_841804C
	.4byte gUnknown_8418049
	.4byte gUnknown_8418046
	.4byte gUnknown_8418043
	.4byte gUnknown_8418040
	.4byte gUnknown_841803D
	.4byte gUnknown_841803A
	.4byte gOtherText_Exit

	.4byte gUnknown_841805D
	.4byte gUnknown_8418061
	.4byte gUnknown_8418069
	.4byte gOtherText_Exit
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL

	.4byte gUnknown_8418046
	.4byte gUnknown_8418043
	.4byte gUnknown_8418040
	.4byte gUnknown_841803D
	.4byte gUnknown_841803A
	.4byte gOtherText_Exit
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL

	.4byte gUnknown_841807D
	.4byte gUnknown_841808E
	.4byte gUnknown_841809C
	.4byte gOtherText_Quit
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL

	.4byte gUnknown_84180A7
	.4byte gUnknown_84180BC
	.4byte gUnknown_84180D0
	.4byte gUnknown_84180E4
	.4byte gUnknown_84180FA
	.4byte gUnknown_841810D
	.4byte gUnknown_841811D
	.4byte gUnknown_841812F
	.4byte gUnknown_8418142
	.4byte gUnknown_8418152
	.4byte gUnknown_8418163
	.4byte gOtherText_Exit

	.4byte gUnknown_841806D
	.4byte gUnknown_841805D
	.4byte gOtherText_Exit
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL

gUnknown_83F5D1C:: @ 83F5D1C
	.byte 2 @ firstArrowType
	.byte 0 @ firstX
	.byte 0 @ firstY
	.byte 3 @ secondArrowType
	.byte 0 @ secondX
	.byte 0 @ secondY
	.2byte 0 @ fullyUpThreshold
	.2byte 0 @ fullyDownThreshold
	.2byte 2000 @ tileTag
	.2byte 100 @ palTag
	.byte 0 @ palNum

	.align 2
	.align 1
sStarterMon:: @ 83F5D2C
	.2byte SPECIES_BULBASAUR
	.2byte SPECIES_SQUIRTLE
	.2byte SPECIES_CHARMANDER

gUnknown_83F5D32:: @ 83F5D32
	.byte MAP_GROUP(VIRIDIAN_CITY_MART),   MAP_NUM(VIRIDIAN_CITY_MART),   1
	.byte MAP_GROUP(PEWTER_CITY_MART),     MAP_NUM(PEWTER_CITY_MART),     3
	.byte MAP_GROUP(CERULEAN_CITY_MART),   MAP_NUM(CERULEAN_CITY_MART),   1
	.byte MAP_GROUP(LAVENDER_TOWN_MART),   MAP_NUM(LAVENDER_TOWN_MART),   1
	.byte MAP_GROUP(VERMILION_CITY_MART),  MAP_NUM(VERMILION_CITY_MART),  1
	.byte MAP_GROUP(FUCHSIA_CITY_MART),    MAP_NUM(FUCHSIA_CITY_MART),    1
	.byte MAP_GROUP(CINNABAR_ISLAND_MART), MAP_NUM(CINNABAR_ISLAND_MART), 1
	.byte MAP_GROUP(SAFFRON_CITY_MART),    MAP_NUM(SAFFRON_CITY_MART),    1
	.byte MAP_GROUP(THREE_ISLAND_MART),    MAP_NUM(THREE_ISLAND_MART),    1
	.byte MAP_GROUP(FOUR_ISLAND_MART),     MAP_NUM(FOUR_ISLAND_MART),     1
	.byte MAP_GROUP(SEVEN_ISLAND_MART),    MAP_NUM(SEVEN_ISLAND_MART),    1
	.byte MAP_GROUP(SIX_ISLAND_MART),      MAP_NUM(SIX_ISLAND_MART),      1

	.align 2
gUnknown_83F5D58:: @ 83F5D58
	.2byte MAP_GROUP(PALLET_TOWN_PLAYERS_HOUSE_1F),          MAP_NUM(PALLET_TOWN_PLAYERS_HOUSE_1F),          0x03, 0x00
	.2byte MAP_GROUP(PALLET_TOWN_PROFESSOR_OAKS_LAB),        MAP_NUM(PALLET_TOWN_PROFESSOR_OAKS_LAB),        0x03, 0x00
	.2byte MAP_GROUP(VIRIDIAN_CITY_GYM),                     MAP_NUM(VIRIDIAN_CITY_GYM),                     0x03, 0x01
	.2byte MAP_GROUP(ROUTE22_NORTH_ENTRANCE),                MAP_NUM(ROUTE22_NORTH_ENTRANCE),                0x03, 0x29
	.2byte MAP_GROUP(ROUTE22_NORTH_ENTRANCE),                MAP_NUM(ROUTE22_NORTH_ENTRANCE),                0x03, 0x2a
	.2byte MAP_GROUP(VIRIDIAN_FOREST),                       MAP_NUM(VIRIDIAN_FOREST),                       0x0f, 0x00
	.2byte MAP_GROUP(VIRIDIAN_FOREST),                       MAP_NUM(VIRIDIAN_FOREST),                       0x0f, 0x03
	.2byte MAP_GROUP(PEWTER_CITY_MUSEUM_1F),                 MAP_NUM(PEWTER_CITY_MUSEUM_1F),                 0x03, 0x02
	.2byte MAP_GROUP(PEWTER_CITY_GYM),                       MAP_NUM(PEWTER_CITY_GYM),                       0x03, 0x02
	.2byte MAP_GROUP(MT_MOON_1F),                            MAP_NUM(MT_MOON_1F),                            0x03, 0x16
	.2byte MAP_GROUP(MT_MOON_B1F),                           MAP_NUM(MT_MOON_B1F),                           0x03, 0x16
	.2byte MAP_GROUP(CERULEAN_CITY_GYM),                     MAP_NUM(CERULEAN_CITY_GYM),                     0x03, 0x03
	.2byte MAP_GROUP(CERULEAN_CITY_BIKE_SHOP),               MAP_NUM(CERULEAN_CITY_BIKE_SHOP),               0x03, 0x03
	.2byte MAP_GROUP(ROUTE25_SEA_COTTAGE),                   MAP_NUM(ROUTE25_SEA_COTTAGE),                   0x03, 0x2c
	.2byte MAP_GROUP(ROUTE5_POKEMON_DAY_CARE),               MAP_NUM(ROUTE5_POKEMON_DAY_CARE),               0x03, 0x17
	.2byte MAP_GROUP(UNDERGROUND_PATH_NORTH_ENTRANCE),       MAP_NUM(UNDERGROUND_PATH_NORTH_ENTRANCE),       0x03, 0x17
	.2byte MAP_GROUP(UNDERGROUND_PATH_SOUTH_ENTRANCE),       MAP_NUM(UNDERGROUND_PATH_SOUTH_ENTRANCE),       0x03, 0x18
	.2byte MAP_GROUP(VERMILION_CITY_POKEMON_FAN_CLUB),       MAP_NUM(VERMILION_CITY_POKEMON_FAN_CLUB),       0x03, 0x05
	.2byte MAP_GROUP(VERMILION_CITY_GYM),                    MAP_NUM(VERMILION_CITY_GYM),                    0x03, 0x05
	.2byte MAP_GROUP(SSANNE_1F_CORRIDOR),                    MAP_NUM(SSANNE_1F_CORRIDOR),                    0x03, 0x05
	.2byte MAP_GROUP(DIGLETTS_CAVE_NORTH_ENTRANCE),          MAP_NUM(DIGLETTS_CAVE_NORTH_ENTRANCE),          0x03, 0x14
	.2byte MAP_GROUP(DIGLETTS_CAVE_SOUTH_ENTRANCE),          MAP_NUM(DIGLETTS_CAVE_SOUTH_ENTRANCE),          0x03, 0x1d
	.2byte MAP_GROUP(ROCK_TUNNEL_1F),                        MAP_NUM(ROCK_TUNNEL_1F),                        0x03, 0x1c
	.2byte MAP_GROUP(ROCK_TUNNEL_1F),                        MAP_NUM(ROCK_TUNNEL_1F),                        0x03, 0x1c
	.2byte MAP_GROUP(POWER_PLANT),                           MAP_NUM(POWER_PLANT),                           0x03, 0x1c
	.2byte MAP_GROUP(POKEMON_TOWER_1F),                      MAP_NUM(POKEMON_TOWER_1F),                      0x03, 0x04
	.2byte MAP_GROUP(LAVENDER_TOWN_VOLUNTEER_POKEMON_HOUSE), MAP_NUM(LAVENDER_TOWN_VOLUNTEER_POKEMON_HOUSE), 0x03, 0x04
	.2byte MAP_GROUP(LAVENDER_TOWN_HOUSE2),                  MAP_NUM(LAVENDER_TOWN_HOUSE2),                  0x03, 0x04
	.2byte MAP_GROUP(UNDERGROUND_PATH_EAST_ENTRANCE),        MAP_NUM(UNDERGROUND_PATH_EAST_ENTRANCE),        0x03, 0x1a
	.2byte MAP_GROUP(UNDERGROUND_PATH_WEST_ENTRANCE),        MAP_NUM(UNDERGROUND_PATH_WEST_ENTRANCE),        0x03, 0x19
	.2byte MAP_GROUP(CELADON_CITY_DEPARTMENT_STORE_1F),      MAP_NUM(CELADON_CITY_DEPARTMENT_STORE_1F),      0x03, 0x06
	.2byte MAP_GROUP(CELADON_CITY_CONDOMINIUMS_1F),          MAP_NUM(CELADON_CITY_CONDOMINIUMS_1F),          0x03, 0x06
	.2byte MAP_GROUP(CELADON_CITY_GAME_CORNER),              MAP_NUM(CELADON_CITY_GAME_CORNER),              0x03, 0x06
	.2byte MAP_GROUP(CELADON_CITY_GYM),                      MAP_NUM(CELADON_CITY_GYM),                      0x03, 0x06
	.2byte MAP_GROUP(CELADON_CITY_RESTAURANT),               MAP_NUM(CELADON_CITY_RESTAURANT),               0x03, 0x06
	.2byte MAP_GROUP(ROCKET_HIDEOUT_B1F),                    MAP_NUM(ROCKET_HIDEOUT_B1F),                    0x0a, 0x0e
	.2byte MAP_GROUP(SAFARI_ZONE_CENTER),                    MAP_NUM(SAFARI_ZONE_CENTER),                    0x0b, 0x00
	.2byte MAP_GROUP(FUCHSIA_CITY_GYM),                      MAP_NUM(FUCHSIA_CITY_GYM),                      0x03, 0x07
	.2byte MAP_GROUP(FUCHSIA_CITY_BUILDING1),                MAP_NUM(FUCHSIA_CITY_BUILDING1),                0x03, 0x07
	.2byte MAP_GROUP(SAFFRON_CITY_DOJO),                     MAP_NUM(SAFFRON_CITY_DOJO),                     0x03, 0x0a
	.2byte MAP_GROUP(SAFFRON_CITY_GYM),                      MAP_NUM(SAFFRON_CITY_GYM),                      0x03, 0x0a
	.2byte MAP_GROUP(SILPH_CO_1F),                           MAP_NUM(SILPH_CO_1F),                           0x03, 0x0a
	.2byte MAP_GROUP(SEAFOAM_ISLANDS_1F),                    MAP_NUM(SEAFOAM_ISLANDS_1F),                    0x03, 0x26
	.2byte MAP_GROUP(SEAFOAM_ISLANDS_1F),                    MAP_NUM(SEAFOAM_ISLANDS_1F),                    0x03, 0x26
	.2byte MAP_GROUP(POKEMON_MANSION_1F),                    MAP_NUM(POKEMON_MANSION_1F),                    0x03, 0x08
	.2byte MAP_GROUP(CINNABAR_ISLAND_GYM),                   MAP_NUM(CINNABAR_ISLAND_GYM),                   0x03, 0x08
	.2byte MAP_GROUP(CINNABAR_ISLAND_POKEMON_LAB_ENTRANCE),  MAP_NUM(CINNABAR_ISLAND_POKEMON_LAB_ENTRANCE),  0x03, 0x08
	.2byte MAP_GROUP(VICTORY_ROAD_1F),                       MAP_NUM(VICTORY_ROAD_1F),                       0x03, 0x2a
	.2byte MAP_GROUP(VICTORY_ROAD_2F),                       MAP_NUM(VICTORY_ROAD_2F),                       0x03, 0x2a
	.2byte MAP_GROUP(INDIGO_PLATEAU_POKEMON_CENTER_1F),      MAP_NUM(INDIGO_PLATEAU_POKEMON_CENTER_1F),      0x03, 0x09
	.2byte MAP_GROUP(CERULEAN_CAVE_1F),                      MAP_NUM(CERULEAN_CAVE_1F),                      0x03, 0x03

	.align 2
gUnknown_83F5EF0:: @ 83F5EF0
	.asciz "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/scr_tool.c"

	.align 2
gUnknown_83F5F24:: @ 83F5F24
	.asciz "0"

	.align 1
gUnknown_83F5F26:: @ 83F5F26
	.2byte 0x0504
	.2byte 0x0605
	.2byte 0x0703
	.2byte 0x0800
	.2byte 0x0901
	.2byte 0x0a0c
	.2byte 0x0b05
	.2byte 0x0c05
	.2byte 0x0d00
	.2byte 0x0e06
	.2byte 0x1000
	.2byte 0x1500
	.2byte 0x2000
	.2byte 0x2102
	.2byte 0x2201
	.2byte 0x2301
	.2byte 0x2400
	.2byte 0x1f03
	.2byte 0x2500
	.2byte 0x0004
	.2byte 0xffff

gUnknown_83F5F50:: @ 83F5F50
	.incbin "data/field_specials/unk_83F5F50.gbapal"
	.incbin "data/field_specials/unk_83F5F70.gbapal"
	.incbin "data/field_specials/unk_83F5F90.gbapal"
	.incbin "data/field_specials/unk_83F5FB0.gbapal"
	.incbin "data/field_specials/unk_83F5FD0.gbapal"
	.incbin "data/field_specials/unk_83F5FF0.gbapal"
	.incbin "data/field_specials/unk_83F6010.gbapal"
	.incbin "data/field_specials/unk_83F6030.gbapal"
	.incbin "data/field_specials/unk_83F6050.gbapal"
	.incbin "data/field_specials/unk_83F6070.gbapal"
	.incbin "data/field_specials/unk_83F6090.gbapal"

gUnknown_83F60B0:: @ 83F60B0
	.incbin "data/field_specials/unk_83F60B0.gbapal"

gUnknown_83F60D0:: @ 83F60D0
	.incbin "data/field_specials/unk_83F60D0.gbapal"
	.incbin "data/field_specials/unk_83F60F0.gbapal"
	.incbin "data/field_specials/unk_83F6110.gbapal"
	.incbin "data/field_specials/unk_83F6130.gbapal"
	.incbin "data/field_specials/unk_83F6150.gbapal"
	.incbin "data/field_specials/unk_83F6170.gbapal"
	.incbin "data/field_specials/unk_83F6190.gbapal"
	.incbin "data/field_specials/unk_83F61B0.gbapal"

gUnknown_83F61D0:: @ 83F61D0
	.incbin "data/field_specials/unk_83F61D0.gbapal"

gUnknown_83F61F0:: @ 83F61F0
	.incbin "baserom.gba", 0x3F61F0, 0xB

gUnknown_83F61FB:: @ 83F61FB
	.incbin "baserom.gba", 0x3F61FB, 0x8

gUnknown_83F6203:: @ 83F6203
	.incbin "baserom.gba", 0x3F6203, 0x3

gUnknown_83F6206:: @ 83F6206
	.incbin "baserom.gba", 0x3F6206, 0x160

gUnknown_83F6366:: @ 83F6366
	.incbin "baserom.gba", 0x3F6366, 0x16

gUnknown_83F637C:: @ 83F637C
	.incbin "baserom.gba", 0x3F637C, 0xC
