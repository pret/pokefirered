#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_841EE64:: @ 841EE64
	.incbin "baserom.gba", 0x41EE64, 0x4

gUnknown_841EE68:: @ 841EE68
	.incbin "baserom.gba", 0x41EE68, 0x18

gUnknown_841EE80:: @ 841EE80
	.incbin "baserom.gba", 0x41EE80, 0x44
