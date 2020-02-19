	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83C7258:: @ 83C7258
	.4byte sub_8081F34
	.4byte sub_8081F38
	.4byte sub_8081F90
	.4byte sub_8081FD0
	.4byte sub_808202C
	.4byte sub_80820BC
	.4byte sub_8082100
	.4byte sub_8082134
	.4byte sub_8082150
	.4byte sub_8082184
	.4byte sub_80821DC
	.4byte sub_8082250
	.4byte sub_808226C
	.4byte sub_80822CC
	.4byte sub_808237C

gUnknown_83C7294:: @ 83C7294
	.4byte sub_8082150
	.4byte sub_8082184
	.4byte sub_80821DC
	.4byte sub_8082250

gOamData_83C72A4::
	.4byte 0x40000000, 0x00000400

gSpriteImages_83C72AC::
	.4byte gUnknown_83C6AC8 + 0x000, 0x80
	.4byte gUnknown_83C6AC8 + 0x080, 0x80
	.4byte gUnknown_83C6AC8 + 0x100, 0x80
	.4byte gUnknown_83C6AC8 + 0x300, 0x80
	.4byte gUnknown_83C6AC8 + 0x380, 0x80
	.4byte gUnknown_83C6AC8 + 0x400, 0x80
	.4byte gUnknown_83C6AC8 + 0x180, 0x80
	.4byte gUnknown_83C6AC8 + 0x200, 0x80
	.4byte gUnknown_83C6AC8 + 0x280, 0x80
	.4byte gUnknown_83C6AC8 + 0x480, 0x80
	.4byte gUnknown_83C6AC8 + 0x500, 0x80
	.4byte gUnknown_83C6AC8 + 0x580, 0x80
	.4byte gUnknown_83C6AC8 + 0x600, 0x80
	.4byte gUnknown_83C6AC8 + 0x680, 0x80
	.4byte gUnknown_83C6AC8 + 0x700, 0x80

gAnimCmd_83C7324::
	obj_image_anim_frame 0x0000, 0x0004
	obj_image_anim_frame 0x0001, 0x0004
	obj_image_anim_frame 0x0002, 0x0034
	obj_image_anim_end

gAnimCmd_83C7334::
	obj_image_anim_frame 0x0006, 0x0004
	obj_image_anim_frame 0x0007, 0x0004
	obj_image_anim_frame 0x0008, 0x0034
	obj_image_anim_end

gAnimCmd_83C7344::
	obj_image_anim_frame 0x0003, 0x0004
	obj_image_anim_frame 0x0004, 0x0004
	obj_image_anim_frame 0x0005, 0x0034
	obj_image_anim_end

gAnimCmd_83C7354::
	obj_image_anim_frame 0x0009, 0x0004
	obj_image_anim_frame 0x000a, 0x0004
	obj_image_anim_frame 0x000b, 0x0034
	obj_image_anim_end

gAnimCmd_83C7364::
	obj_image_anim_frame 0x000c, 0x0004
	obj_image_anim_frame 0x000d, 0x0004
	obj_image_anim_frame 0x000e, 0x0034
	obj_image_anim_end

gSpriteAnimTable_83C7374::
	.4byte gAnimCmd_83C7324
    .4byte gAnimCmd_83C7334
    .4byte gAnimCmd_83C7344
    .4byte gAnimCmd_83C7354
    .4byte gAnimCmd_83C7364

gUnknown_83C7388:: @ 83C7388
	spr_template 65535, 65535, gOamData_83C72A4, gSpriteAnimTable_83C7374, gSpriteImages_83C72AC, gDummySpriteAffineAnimTable, objc_exclamation_mark_probably
