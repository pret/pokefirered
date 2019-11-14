#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_83FECCC:: @ 83FECCC
	.2byte 0x0c, 0x1c, 0x2c

gUnknown_83FECD2:: @ 83FECD2
	.byte 0, 1, 2, 3

gUnknown_83FECD6:: @ 83FECD6
	.2byte 0x0004, 0x0004, 0x0004, 0x0010

	.align 2
gUnknown_83FECE0:: @ 83FECE0
	.4byte sub_80DBB18
	.4byte sub_80DBB3C

	.align 2
gUnknown_83FECE8:: @ 83FECE8
	.4byte sub_80DC318
	.4byte sub_80DC348
	.4byte sub_80DC3A8

gUnknown_83FECF4:: @ 83FECF4
	.byte 0, 0, 1, 2, 3

	.align 1
gUnknown_83FECFA:: @ 83FECFA
	.2byte 0x0007, 0x000f
