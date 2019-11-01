#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83D4100:: @ 83D4100
	.incbin "baserom.gba", 0x3D4100, 0x4C

gUnknown_83D414C:: @ 83D414C
	.incbin "baserom.gba", 0x3D414C, 0x18
