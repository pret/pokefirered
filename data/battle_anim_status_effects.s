	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_83BF3E0:: @ 83BF3DC
	obj_image_anim_frame  0, 3
	obj_image_anim_frame  4, 3
	obj_image_anim_frame  8, 3
	obj_image_anim_frame 12, 3
	obj_image_anim_jump 0

gSpriteAnimTable_83BF3F4:: @ 83BF3F4
	.4byte gUnknown_83BF3E0

gSpriteTemplate_83BF3F8:: @ 83BF3F8
	spr_template 10004, 10004, gOamData_83AC9D0, gSpriteAnimTable_83BF3F4, NULL, gDummySpriteAffineAnimTable, sub_8076F58

gSpriteTemplate_83BF410:: @ 83BF410
	spr_template 10004, 10004, gOamData_83AC9D0, gSpriteAnimTable_83BF3F4, NULL, gDummySpriteAffineAnimTable, sub_8076ED8

gUnknown_83BF428:: @ 83BF428
	obj_image_anim_frame 0x0000, 3
	obj_image_anim_jump 0x0000

gSpriteAnimTable_83BF430:: @ 83BF430
	.4byte gUnknown_83BF428

gSpriteTemplate_83BF434:: @ 83BF434
	spr_template 10283, 10283, gOamData_83AC9D8, gSpriteAnimTable_83BF430, NULL, gDummySpriteAffineAnimTable, sub_807729C

gSpriteTemplate_83BF44C:: @ 83BF44C
	spr_template 10283, 10283, gOamData_83AC9D8, gSpriteAnimTable_83BF430, NULL, gDummySpriteAffineAnimTable, sub_8077350

gUnknown_83BF464:: @ 83BF464
	obj_image_anim_frame 0x0000, 3
	obj_image_anim_frame 0x0010, 3
	obj_image_anim_frame 0x0020, 3
	obj_image_anim_frame 0x0030, 3
	obj_image_anim_frame 0x0040, 3
	obj_image_anim_end

gSpriteAnimTable_83BF47C:: @ 83BF47C
	.4byte gUnknown_83BF464

gSpriteTemplate_83BF480:: @ 83BF480
	spr_template 10071, 10071, gOamData_83AC9D8, gSpriteAnimTable_83BF47C, NULL, gDummySpriteAffineAnimTable, sub_8076FD0

gSpriteTemplate_83BF498:: @ 83BF498
	spr_template 10051, 10051, gOamData_83AC9D8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8076F58

gUnknown_83BF4B0:: @ 83BF4B0
	obj_image_anim_frame 0x0000, 5
	obj_image_anim_jump 0x0000

gUnknown_83BF4B8:: @ 83BF4B8
	obj_image_anim_frame 0x0000, 5
	obj_image_anim_jump 0x0000

gUnknown_83BF4C0:: @ 83BF4C0
	obj_image_anim_frame 0x0000, 5
	obj_image_anim_jump 0x0000

gSpriteAniimTable_83BF4C8:: @ 83BF4C8
	.4byte gUnknown_83BF4B0
	.4byte gUnknown_83BF4B8
	.4byte gUnknown_83BF4C0

gSpriteTemplate_83BF4D4:: @ 83BF4D4
	spr_template 10135, 10135, gOamData_83AC9D8, gSpriteAniimTable_83BF4C8, NULL, gDummySpriteAffineAnimTable, sub_8076F58

gUnknown_83BF4EC:: @ 83BF4EC
	obj_image_anim_frame 0x0000, 15
	obj_image_anim_jump 0x0000

gSpriteAnimTable_83BF4F4:: @ 83BF4F4
	.4byte gUnknown_83BF4EC

gUnknown_83BF4F8:: @ 83BF4F8
	obj_rot_scal_anim_frame 0x0060, 0x0060, 0x00, 0
	obj_rot_scal_anim_frame 0x0002, 0x0002, 0x00, 1
	obj_rot_scal_anim_jump 0x0001

gSpriteAffineAnimTable_83BF510:: @ 83BF510
	.4byte gUnknown_83BF4F8

gSpriteTemplate_83BF514:: @ 83BF514
	spr_template 10004, 10004, gOamData_83ACA90, gSpriteAnimTable_83BF4F4, NULL, gSpriteAffineAnimTable_83BF510, sub_8076ED8

gUnknown_83BF52C:: @ 83BF52C
	.string "TASK OVER\n"
	.string "タスクがオーバーしました$"

	.align 2
gSubsprites_83BF544:: @ 83BF544
	subsprite 240, 240, 2, 0x00, 64x64
	subsprite 240,  48, 2, 0x40, 64x32
	subsprite  48, 240, 2, 0x60, 32x64
	subsprite  48,  48, 2, 0x80, 32x32

gUnknown_83BF554:: @ 83BF554
	.byte 4
	.align 2
	.4byte gSubsprites_83BF544

gUnknown_83BF55C:: @ 83BF55C
	spr_template 10010, 10010, gOamData_83ACB00, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_83BF574:: @ 83BF574
	spr_template 10136, 10136, gOamData_83AC9C8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_807834C
