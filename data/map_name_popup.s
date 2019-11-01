#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83D4164:: @ 83D4164
	.incbin "baserom.gba", 0x3D4164, 0x8
