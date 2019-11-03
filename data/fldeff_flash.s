#include "constants/species.h"
#include "constants/items.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_83F5738:: @ 83F5738
	.incbin "baserom.gba", 0x3F5738, 0xCC

gUnknown_83F5804:: @ 83F5804
	.incbin "baserom.gba", 0x3F5804, 0x20

gUnknown_83F5824:: @ 83F5824
	.incbin "baserom.gba", 0x3F5824, 0x20

gUnknown_83F5844:: @ 83F5844
	.incbin "baserom.gba", 0x3F5844, 0x10

gUnknown_83F5854:: @ 83F5854
	.incbin "baserom.gba", 0x3F5854, 0x10

gUnknown_83F5864:: @ 83F5864
	.incbin "baserom.gba", 0x3F5864, 0x1E0

gUnknown_83F5A44:: @ 83F5A44
	.incbin "baserom.gba", 0x3F5A44, 0xB4
