#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_83FFAC4:: @ 83FFAC4
	.incbin "baserom.gba", 0x3FFAC4, 0x1

gUnknown_83FFAC5:: @ 83FFAC5
	.incbin "baserom.gba", 0x3FFAC5, 0x5

gUnknown_83FFACA:: @ 83FFACA
	.incbin "baserom.gba", 0x3FFACA, 0x7A

gUnknown_83FFB44:: @ 83FFB44
	.incbin "baserom.gba", 0x3FFB44, 0x12C0

gUnknown_8400E04:: @ 8400E04
	.incbin "baserom.gba", 0x400E04, 0x12C0

gUnknown_84020C4:: @ 84020C4
	.incbin "baserom.gba", 0x4020C4, 0x16

gUnknown_84020DA:: @ 84020DA
	.incbin "baserom.gba", 0x4020DA, 0xC

gUnknown_84020E6:: @ 84020E6
	.incbin "baserom.gba", 0x4020E6, 0x12
