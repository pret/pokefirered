#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_841F4B4:: @ 841F4B4
	.incbin "baserom.gba", 0x41f4b4, 0x20
