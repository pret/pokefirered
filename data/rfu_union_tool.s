#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

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
