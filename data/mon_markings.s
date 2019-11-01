#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83EE008:: @ 83EE008
	.incbin "baserom.gba", 0x3EE008, 0x20

gUnknown_83EE028:: @ 83EE028
	.incbin "baserom.gba", 0x3EE028, 0x808

gUnknown_83EE830:: @ 83EE830
	.incbin "baserom.gba", 0x3EE830, 0x8

gUnknown_83EE838:: @ 83EE838
	.incbin "baserom.gba", 0x3EE838, 0x58

gUnknown_83EE890:: @ 83EE890
	.incbin "baserom.gba", 0x3EE890, 0x38

gUnknown_83EE8C8:: @ 83EE8C8
	.incbin "baserom.gba", 0x3EE8C8, 0x8

gUnknown_83EE8D0:: @ 83EE8D0
	.incbin "baserom.gba", 0x3EE8D0, 0x88

gUnknown_83EE958:: @ 83EE958
	.incbin "baserom.gba", 0x3EE958, 0x40
