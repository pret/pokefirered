#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83E7CFC:: @ 83E7CFC
	.4byte sub_80BD27C
	.4byte sub_80BD28C
	.4byte sub_80BD2C8
	.4byte sub_80BD358
	.4byte sub_80BD380

gUnknown_83E7D10:: @ 83E7D10
	.4byte sub_80BD100
	.4byte sub_80BD1C8
	.4byte sub_80BD1E8

gUnknown_83E7D1C:: @ 83E7D1C
	.2byte 0x0001, 0x0002, 0x0004

gUnknown_83E7D22::
	.byte 4

	.align 2
gUnknown_83E7D24::
	.4byte 1, 2, 15, 15, gUnknown_83E7D22, gUnknown_83E7D22, 1
	.4byte 2, 2, 15, 15, gUnknown_83E7D22, gUnknown_83E7D22, 2
	.4byte 3, 2, 15, 15, gUnknown_83E7D22, gUnknown_83E7D22, 3
	.4byte 4, 2, 15, 15, gUnknown_83E7D22, gUnknown_83E7D22, 4

