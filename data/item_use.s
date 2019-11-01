#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

	.incbin "baserom.gba", 0x3E27B4, 0x1A0

gUnknown_83E2954:: @ 83E2954
	.4byte sub_8124C8C
	.4byte CB2_ReturnToField
	.4byte NULL
	.4byte NULL
