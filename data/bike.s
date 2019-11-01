#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83E7CFC:: @ 83E7CFC
	.incbin "baserom.gba", 0x3E7CFC, 0x14

gUnknown_83E7D10:: @ 83E7D10
	.incbin "baserom.gba", 0x3E7D10, 0xC

gUnknown_83E7D1C:: @ 83E7D1C
	.incbin "baserom.gba", 0x3E7D1C, 0x7
