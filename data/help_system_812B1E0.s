#include "constants/maps.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2, 0
gUnknown_845B080:: @ 845B080
	.incbin "baserom.gba", 0x45B080, 0x18

gUnknown_845B098:: @ 845B098
	.incbin "baserom.gba", 0x45B098, 0x18

gUnknown_845B0B0:: @ 845B0B0
	.incbin "baserom.gba", 0x45B0B0, 0xB4

gUnknown_845B164:: @ 845B164
	.incbin "baserom.gba", 0x45B164, 0xB4

gUnknown_845B218:: @ 845B218
	.incbin "baserom.gba", 0x45B218, 0xC4

gUnknown_845B2DC:: @ 845B2DC
	.incbin "baserom.gba", 0x45B2DC, 0xC4

gUnknown_845B3A0:: @ 845B3A0
	.incbin "baserom.gba", 0x45B3A0, 0xB0

gUnknown_845B450:: @ 845B450
	.incbin "baserom.gba", 0x45B450, 0xB0

gUnknown_845B500:: @ 845B500
	.incbin "baserom.gba", 0x45B500, 0x20

gUnknown_845B520:: @ 845B520
	.incbin "baserom.gba", 0x45B520, 0x20

gUnknown_845B540:: @ 845B540
	.incbin "baserom.gba", 0x45B540, 0x90

gUnknown_845B5D0:: @ 845B5D0
	.incbin "baserom.gba", 0x45B5D0, 0x3EE

gUnknown_845B9BE:: @ 845B9BE
	.incbin "baserom.gba", 0x45B9BE, 0x22

gUnknown_845B9E0:: @ 845B9E0
	.incbin "baserom.gba", 0x45B9E0, 0xAD0

gUnknown_845C4B0:: @ 845C4B0
	.incbin "baserom.gba", 0x45C4B0, 0x6

gUnknown_845C4B6:: @ 845C4B6
	.incbin "baserom.gba", 0x45C4B6, 0xDE

gUnknown_845C594:: @ 845C594
	.2byte MAP_VIRIDIAN_CITY_MART
	.2byte MAP_PEWTER_CITY_MART
	.2byte MAP_CERULEAN_CITY_MART
	.2byte MAP_LAVENDER_TOWN_MART
	.2byte MAP_VERMILION_CITY_MART
	.2byte MAP_CELADON_CITY_DEPARTMENT_STORE_1F
	.2byte MAP_CELADON_CITY_DEPARTMENT_STORE_2F
	.2byte MAP_CELADON_CITY_DEPARTMENT_STORE_3F
	.2byte MAP_CELADON_CITY_DEPARTMENT_STORE_4F
	.2byte MAP_CELADON_CITY_DEPARTMENT_STORE_5F
	.2byte MAP_CELADON_CITY_DEPARTMENT_STORE_ROOF
	.2byte MAP_CELADON_CITY_DEPARTMENT_STORE_ELEVATOR
	.2byte MAP_FUCHSIA_CITY_MART
	.2byte MAP_CINNABAR_ISLAND_MART
	.2byte MAP_SAFFRON_CITY_MART
	.2byte MAP_THREE_ISLAND_MART
	.2byte MAP_FOUR_ISLAND_MART
	.2byte MAP_SEVEN_ISLAND_MART
	.2byte MAP_SIX_ISLAND_MART
	.2byte 0xffff

gUnknown_845C5BC:: @ 845C5BC
	.2byte MAP_PEWTER_CITY_GYM
	.2byte MAP_CERULEAN_CITY_GYM
	.2byte MAP_VERMILION_CITY_GYM
	.2byte MAP_CELADON_CITY_GYM
	.2byte MAP_FUCHSIA_CITY_GYM
	.2byte MAP_SAFFRON_CITY_GYM
	.2byte MAP_CINNABAR_ISLAND_GYM
	.2byte MAP_VIRIDIAN_CITY_GYM
	.2byte 0xffff

gUnknown_845C5CE:: @ 845C5CE
	.byte 0x01, 0x00, 0x01 @ MAP_VIRIDIAN_FOREST
	.byte 0x01, 0x01, 0x03 @ MAP_MT_MOON_1F
	.byte 0x01, 0x51, 0x02 @ MAP_ROCK_TUNNEL_1F
	.byte 0x01, 0x24, 0x03 @ MAP_DIGLETTS_CAVE_NORTH_ENTRANCE
	.byte 0x01, 0x53, 0x05 @ MAP_SEAFOAM_ISLANDS_1F
	.byte 0x01, 0x27, 0x03 @ MAP_VICTORY_ROAD_1F
	.byte 0x01, 0x48, 0x03 @ MAP_CERULEAN_CAVE_1F
	.byte 0x01, 0x60, 0x01 @ MAP_MT_EMBER_RUBY_PATH_B4F
	.byte 0x01, 0x62, 0x03 @ MAP_MT_EMBER_SUMMIT_PATH_1F
	.byte 0x01, 0x66, 0x07 @ MAP_MT_EMBER_RUBY_PATH_B5F
	.byte 0x01, 0x6d, 0x01 @ MAP_THREE_ISLAND_BERRY_FOREST
	.byte 0x01, 0x79, 0x01 @ MAP_SIX_ISLAND_PATTERN_BUSH
	.byte 0x02, 0x0c, 0x0f @ MAP_FIVE_ISLAND_LOST_CAVE_ENTRANCE
	.byte 0x01, 0x6e, 0x04 @ MAP_FOUR_ISLAND_ICEFALL_CAVE_ENTRANCE
	.byte 0x01, 0x7a, 0x01 @ MAP_SIX_ISLAND_ALTERING_CAVE
	.byte 0x02, 0x1b, 0x07 @ MAP_SEVEN_ISLAND_TANOBY_RUINS_MONEAN_CHAMBER
