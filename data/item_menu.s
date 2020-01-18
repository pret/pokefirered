#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

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
