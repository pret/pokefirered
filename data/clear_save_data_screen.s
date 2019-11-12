#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_841EE64:: @ 841EE64
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

gUnknown_841EE68:: @ 841EE68
	.byte 0, 3, 5, 6, 4, 15
	.2byte 0x000a
	.byte 0, 3, 15, 23, 4, 15
	.2byte 0x0022
	.byte 255, 0, 0, 0, 0, 0
	.2byte 0x0000

gUnknown_841EE80:: @ 841EE80
	.byte 0x01, 0x02, 0x03
