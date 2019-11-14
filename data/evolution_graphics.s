#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_841EE84:: @ 841EE84
	.incbin "baserom.gba", 0x41EE84, 0x40

gUnknown_841EEC4:: @ 841EEC4
	.incbin "baserom.gba", 0x41EEC4, 0x10

gUnknown_841EED4:: @ 841EED4
	.incbin "baserom.gba", 0x41EED4, 0x24

gUnknown_841EEF8:: @ 841EEF8
	.incbin "baserom.gba", 0x41EEF8, 0x18

gUnknown_841EF10:: @ 841EF10
	.incbin "baserom.gba", 0x41EF10, 0x2B8
