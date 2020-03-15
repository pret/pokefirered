#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83D35D4:: @ 83D35D4
	.byte 0, 10, 3, 20, 18, 9
	.2byte 0x000a

gUnknown_83D35DC:: @ 83D35DC
	.incbin "graphics/interface/pss_unk_83D35DC.4bpp"

gUnknown_83D365C::
	.4byte 0x80000100, 0x00000400

gUnknown_83D3664::
	obj_rot_scal_anim_frame 128, 128, 0, 0
	obj_rot_scal_anim_end

gUnknown_83D3674::
	obj_rot_scal_anim_frame 88, 88, 0, 0
	obj_rot_scal_anim_frame 5, 5, 0, 8
	obj_rot_scal_anim_end

gUnknown_83D368C::
	obj_rot_scal_anim_frame 128, 128, 0, 0
	obj_rot_scal_anim_frame -5, -5, 0, 8
	obj_rot_scal_anim_end

gUnknown_83D36A4::
	obj_rot_scal_anim_frame 128, 128, 0, 0
	obj_rot_scal_anim_frame 10, 10, 0, 12
	obj_rot_scal_anim_frame 256, 256, 0, 0
	obj_rot_scal_anim_end

gUnknown_83D36C4::
	obj_rot_scal_anim_frame 256, 256, 0, 0
	obj_rot_scal_anim_frame -10, -10, 0, 12
	obj_rot_scal_anim_frame 128, 128, 0, 0
	obj_rot_scal_anim_end

gUnknown_83D36E4::
	obj_rot_scal_anim_frame 256, 256, 0, 0
	obj_rot_scal_anim_frame -5, -5, 0, 16
	obj_rot_scal_anim_end

gUnknown_83D36FC::
	obj_rot_scal_anim_frame 256, 256, 0, 0
	obj_rot_scal_anim_end

gUnknown_83D370C::
	.4byte gUnknown_83D3664
	.4byte gUnknown_83D3674
	.4byte gUnknown_83D368C
	.4byte gUnknown_83D36A4
	.4byte gUnknown_83D36C4
	.4byte gUnknown_83D36E4
	.4byte gUnknown_83D36FC

gUnknown_83D3728:: @ 83D3728
	spr_template 7, 56011, gUnknown_83D365C, gDummySpriteAnimTable, NULL, gUnknown_83D370C, SpriteCallbackDummy
