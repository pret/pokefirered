#include "constants/maps.h"
#include "constants/species.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2
	.incbin "baserom.gba", 0x3E7D24, 0x70
