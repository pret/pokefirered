#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83CC244:: @ 83CC244 dataptr
	.4byte sub_8087C00
	.4byte sub_8087C2C
	.4byte sub_8087CB4

gUnknown_83CC250:: @ 83CC250 sprite_frames
	obj_frame_tiles gUnknown_83CBDB0 + 0x00, 0x0020
	obj_frame_tiles gUnknown_83CBDB0 + 0x20, 0x0020
	obj_frame_tiles gUnknown_83CBDB0 + 0x40, 0x0020
	obj_frame_tiles gUnknown_83CBDB0 + 0x60, 0x0020

gUnknown_83CC270:: @ 83CC270 animcmd
	obj_image_anim_frame 0x0000, 0
	obj_image_anim_end

gUnknown_83CC278:: @ 83CC278 animcmd
	obj_image_anim_frame 0x0001, 0
	obj_image_anim_end

gUnknown_83CC280:: @ 83CC280 animcmd
	obj_image_anim_frame 0x0002, 0
	obj_image_anim_end

gUnknown_83CC288:: @ 83CC288 animcmd
	obj_image_anim_frame 0x0003, 0
	obj_image_anim_end

gUnknown_83CC290:: @ 83CC290 dataptr
	.4byte gUnknown_83CC270
	.4byte gUnknown_83CC278
	.4byte gUnknown_83CC280
	.4byte gUnknown_83CC288

gUnknown_83CC2A0:: @ 83CC2A0 spr_template
	spr_template 65535, 4371, gOamData_83CBE58, gUnknown_83CC290, gUnknown_83CC250, gDummySpriteAffineAnimTable, sub_8087D90
