#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_841EE44:: @ 841EE44
	.incbin "baserom.gba", 0x41EE44, 0x20
