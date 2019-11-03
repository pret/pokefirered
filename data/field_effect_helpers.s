#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_83FECCC:: @ 83FECCC
	.byte 0x0c, 0x00, 0x1c, 0x00, 0x2c, 0x00

gUnknown_83FECD2:: @ 83FECD2
	.incbin "baserom.gba", 0x3FECD2, 0x4

gUnknown_83FECD6:: @ 83FECD6
	.incbin "baserom.gba", 0x3FECD6, 0xA

gUnknown_83FECE0:: @ 83FECE0
	.incbin "baserom.gba", 0x3FECE0, 0x8

gUnknown_83FECE8:: @ 83FECE8
	.incbin "baserom.gba", 0x3FECE8, 0xC

gUnknown_83FECF4:: @ 83FECF4
	.incbin "baserom.gba", 0x3FECF4, 0x6

gUnknown_83FECFA:: @ 83FECFA
	.incbin "baserom.gba", 0x3FECFA, 0x6
