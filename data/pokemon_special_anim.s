#include "constants/region_map_sections.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_84599A4:: @ 84599A4
	.2byte 0x0000, 0x0010

gUnknown_84599A8:: @ 84599A8 unref, data16?
	.2byte 0x0044

gUnknown_84599AA:: @ 84599AA data16
	.2byte 0x0100, 0x0155, 0x01aa, 0x0200

gUnknown_84599B2:: @ 84599B2 data8
	.byte 0xf8, 0xf8, 0x06, 0xf3, 0x08, 0xf8

gUnknown_84599B8:: @ 84599B8 sprite_sheet
	obj_tiles gUnknown_84598C4, 0x0080, 2

gUnknown_84599C0:: @ 84599C0 sprite_palette
	obj_pal gUnknown_84598A4, 2

gUnknown_84599C8:: @ 84599C8 sprite_sheet
	obj_tiles gUnknown_8459960, 0x0060, 5

gUnknown_84599D0:: @ 84599D0 sprite_palette
	obj_pal gUnknown_8459940, 5

gUnknown_84599D8:: @ 84599D8
	.4byte 0xc0000300, 0x00000400

gUnknown_84599E0:: @ 84599E0
	obj_rot_scal_anim_frame 256, 256, 0, 0
	obj_rot_scal_anim_end

gUnknown_84599F0:: @ 84599F0
	obj_rot_scal_anim_frame 341, 341, 0, 0
	obj_rot_scal_anim_end

gUnknown_8459A00:: @ 8459A00
	obj_rot_scal_anim_frame 426, 426, 0, 0
	obj_rot_scal_anim_end

gUnknown_8459A10:: @ 8459A10
	obj_rot_scal_anim_frame 512, 512, 0, 0
	obj_rot_scal_anim_end

gUnknown_8459A20:: @ 8459A20 dataptr
	.4byte gUnknown_84599E0
	.4byte gUnknown_84599F0
	.4byte gUnknown_8459A00
	.4byte gUnknown_8459A10

gUnknown_8459A30:: @ 8459A30 spr_template
	spr_template 0, 0, gUnknown_84599D8, gDummySpriteAnimTable, NULL, gUnknown_8459A20, SpriteCallbackDummy

gUnknown_8459A48:: @ 8459A48 affine_anim_cmd?
	obj_rot_scal_anim_frame 256, 256, 0, 0
	obj_rot_scal_anim_frame -28, -28, 0, 8
	obj_rot_scal_anim_end

gUnknown_8459A60:: @ 459A60
	obj_rot_scal_anim_frame 341, 341, 0, 0
	obj_rot_scal_anim_frame -37, -37, 0, 8
	obj_rot_scal_anim_end

gUnknown_8459A78:: @ 459A78
	obj_rot_scal_anim_frame 426, 426, 0, 0
	obj_rot_scal_anim_frame -47, -47, 0, 8
	obj_rot_scal_anim_end

gUnknown_8459A90:: @ 459A90
	obj_rot_scal_anim_frame 512, 512, 0, 0
	obj_rot_scal_anim_frame -56, -56, 0, 8
	obj_rot_scal_anim_end

gUnknown_8459AA8:: @ 8459AA8 dataptr
	.4byte gUnknown_8459A48
	.4byte gUnknown_8459A60
	.4byte gUnknown_8459A78
	.4byte gUnknown_8459A90

gUnknown_8459AB8:: @ 8459AB8
	.4byte 0x00008400, 0x00000400

gUnknown_8459AC0:: @ 8459AC0
	obj_image_anim_frame 0x0000, 3
	obj_image_anim_end

gUnknown_8459AC8:: @ 8459AC8
	.4byte gUnknown_8459AC0

gUnknown_8459ACC:: @ 8459ACC spr_template
	spr_template 0, 0, gUnknown_8459AB8, gUnknown_8459AC8, NULL, gDummySpriteAffineAnimTable, sub_811E7B4

gUnknown_8459AE4:: @ 8459AE4
	.4byte 0x40000000, 0x00000400

gUnknown_8459AEC:: @ 8459AEC spr_template
	spr_template 2, 2, gUnknown_8459AE4, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_811E300

gUnknown_8459B04:: @ 8459B04
	.4byte 0x00000000, 0x00000000

gUnknown_8459B0C:: @ 8459B0C
	obj_image_anim_frame 0x0000, 16
	obj_image_anim_frame 0x0001, 8
	obj_image_anim_frame 0x0002, 4
	obj_image_anim_end

gUnknown_8459B1C:: @ 8459B1C
	obj_image_anim_frame 0x0001, 4
	obj_image_anim_frame 0x0000, 4
	obj_image_anim_end

gUnknown_8459B28:: @ 8459B28
	.4byte gUnknown_8459B0C
	.4byte gUnknown_8459B1C

gUnknown_8459B30:: @ 8459B30 spr_template
	spr_template 5, 5, gUnknown_8459B04, gUnknown_8459B28, NULL, gDummySpriteAffineAnimTable, sub_811E520

gUnknown_8459B48:: @ 8459B48 dataptr
	.4byte gUnknown_841B2A9
	.4byte gUnknown_841B2B7
	.4byte gUnknown_841B2BE
	.4byte gUnknown_841B2CC
	.4byte gUnknown_841B2D4
	.4byte gUnknown_841B2C6
