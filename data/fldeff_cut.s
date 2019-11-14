#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83D4100:: @ 83D4100
	.2byte 0x000d, 0x0001
	.2byte 0x000a, 0x0013
	.2byte 0x000b, 0x000e
	.2byte 0x000c, 0x000f
	.2byte 0x0352, 0x033e
	.2byte 0x0300, 0x0310
	.2byte 0x0301, 0x0311
	.2byte 0x0302, 0x0312
	.2byte 0x0284, 0x0281
	.2byte 0xffff, 0xffff

	.align 2
gOamData_83D4128::
	.4byte 0x00000000, 0x00001401

gAnimCmd_83D4130::
	obj_image_anim_frame 0, 30
	obj_image_anim_jump 0

gSpriteAnimTable_83D4138::
	.4byte gAnimCmd_83D4130

gUnknown_83D413C::
	obj_frame_tiles gUnknown_8398648, 0x20

gUnknown_83D4144::
	obj_pal gUnknown_8398688, 4096

gUnknown_83D414C:: @ 83D414C
	spr_template 0xFFFF, 4096, gOamData_83D4128, gSpriteAnimTable_83D4138, gUnknown_83D413C, gDummySpriteAffineAnimTable, objc_8097BA8

