#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_8452CF4:: @ 8452CF4
	.4byte 0x000001f0
	@ {
	@ 	.bg = 0,
	@ 	.charBaseIndex = 0,
	@ 	.mapBaseIndex = 31,
	@ 	.screenSize = 0,
	@ 	.paletteMode = 0,
	@ 	.priority = 0,
	@ 	.baseTile = 0x0000
	@ }
	.4byte 0x000011ed
	@ {
	@ 	.bg = 1,
	@ 	.charBaseIndex = 3,
	@ 	.mapBaseIndex = 30,
	@ 	.screenSize = 0,
	@ 	.paletteMode = 0,
	@ 	.priority = 1,
	@ 	.baseTile = 0x0000
	@ }

gUnknown_8452CFC:: @ 8452CFC
	.4byte gUnknown_84162CD
	.4byte gUnknown_84162DE
	.4byte gUnknown_84162D3

gUnknown_8452D08:: @ 8452D08
	.incbin "graphics/item_menu/bagmap_0.bin"
	.incbin "graphics/item_menu/bagmap_1.bin"
	.incbin "graphics/item_menu/bagmap_2.bin"
	.incbin "graphics/item_menu/bagmap_3.bin"
	.incbin "graphics/item_menu/bagmap_4.bin"
	.incbin "graphics/item_menu/bagmap_5.bin"
	.incbin "graphics/item_menu/bagmap_6.bin"
	.incbin "graphics/item_menu/bagmap_7.bin"
	.incbin "graphics/item_menu/bagmap_8.bin"
	.incbin "graphics/item_menu/bagmap_9.bin"
	.incbin "graphics/item_menu/bagmap_A.bin"
	.incbin "graphics/item_menu/bagmap_B.bin"

gUnknown_8452EB8:: @ 8452EB8
	.4byte gOtherText_Use, sub_8109C50
	.4byte gOtherText_Toss, sub_8109CC0
	.4byte gUnknown_84161A9, sub_810A000
	.4byte gOtherText_Give, sub_810A0A8
	.4byte gFameCheckerText_Cancel, sub_810A2DC
	.4byte gOtherText_Use, sub_810A324
	.4byte gUnknown_84161E9, sub_8109C50
	.4byte gUnknown_84161F4, sub_8109C50
	.4byte gUnknown_84161F4, sub_810A324
	.4byte gUnknown_84161BC, sub_8109C50
	.4byte gUnknown_84161F9, sub_810A000
	.4byte gString_Dummy, NULL

gUnknown_8452F18:: @ 8452F18
	.byte 0x00, 0x03, 0x01, 0x04
	.byte 0x00, 0x02, 0x04, 0x0b
	.byte 0x03, 0x01, 0x04, 0x0b

gUnknown_8452F24:: @ 8452F24
	.byte 0x06, 0x03, 0x01, 0x04

gUnknown_8452F28:: @ 8452F28
	.byte 0x03, 0x04
	.byte 0x04, 0x0b
	.byte 0x03, 0x04

gUnknown_8452F2E:: @ 8452F2E
	.byte 0x07, 0x04

gUnknown_8452F30:: @ 8452F30
	.byte 0x05, 0x04

gUnknown_8452F32:: @ 8452F32
	.byte 0x04, 0x0b

gUnknown_8452F34:: @ 8452F34
	.4byte sub_8109BB8
	.4byte sub_810A370
	.4byte sub_810A568
	.4byte sub_810AB40
	.4byte sub_810A468
	.4byte sub_8109BB8
	.4byte NULL

gUnknown_8452F50:: @ 8452F50
	.4byte sub_8109EA8
	.4byte sub_8109DB0

gUnknown_8452F58:: @ 8452F58
	.4byte sub_810A940
	.4byte sub_810A720

gUnknown_8452F60:: @ 8452F60
	.string "{COLOR_HIGHLIGHT_SHADOW RED TRANSPARENT GREEN}$"

gUnknown_8452F66:: @ 8452F66
	.string "{COLOR_HIGHLIGHT_SHADOW LIGHT_GRAY TRANSPARENT BLACK}$"

gUnknown_8452F6C:: @ 8452F6C
	.byte 0, 8, 72, 1, 72, 72
	.2byte 0, 2, 111, 111
	.byte 0
	.align 2

gUnknown_8452F7C:: @ 8452F7C
	.incbin "graphics/interface/select_button.4bpp"
