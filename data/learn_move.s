#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_83FF9F4:: @ 83FF9F4
	.incbin "baserom.gba", 0x3FF9F4, 0x8

gUnknown_83FF9FC:: @ 83FF9FC
	.incbin "baserom.gba", 0x3FF9FC, 0x28

gUnknown_83FFA24:: @ 83FFA24
	.incbin "baserom.gba", 0x3FFA24, 0x18

gUnknown_83FFA3C:: @ 83FFA3C
	.incbin "baserom.gba", 0x3FFA3C, 0x8

gUnknown_83FFA44:: @ 83FFA44
	.incbin "baserom.gba", 0x3FFA44, 0x48

gUnknown_83FFA8C:: @ 83FFA8C
	.incbin "baserom.gba", 0x3FFA8C, 0x8

gUnknown_83FFA94:: @ 83FFA94
	.incbin "baserom.gba", 0x3FFA94, 0x30
