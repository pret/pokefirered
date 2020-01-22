#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_8457120:: @ 8457120
	.byte 0x09, 0x08, 0x07, 0x02, 0x06, 0x05, 0x04, 0x03, 0x63, 0x00, 0x64, 0x00, 0x65, 0x00, 0x66, 0x00, 0x67, 0x00, 0x68, 0x00, 0x69, 0x00, 0x6A, 0x00

	.align 2
gUnknown_8457138:: @ 8457138
	abspath "rfu_union_tool.c"

	.align 2
gUnknown_8457174:: @ 8457174
	.asciz "0"

	.align 2
gUnknown_8457178:: @ 8457178
	.asciz "UnionObjWork != NULL"

gUnknown_845718D:: @ 845718D
	.byte 0xA4, 0xFE

gUnknown_845718F:: @ 845718F
	.byte 0xA5, 0xFE

	.align 2
gUnknown_8457194:: @ 8457194
	.2byte 0x01FC, 0x0000 @ BgTemplate

gUnknown_8457198:: @ 8457198
	.byte 0x00, 0x02, 0x0F, 0x1A, 0x04, 0x0E @ window template
	.2byte 0x0014

	@ ???
	.byte -1, 0, 0, 0
	.byte 0, 0, 0, 0

gUnknown_84571A8:: @ 84571A8
	.byte 0x01, 0x02, 0x03, 0x00
