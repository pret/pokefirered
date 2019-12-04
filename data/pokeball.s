	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2, 0

gUnknown_826056C:: @ 826056C
	obj_tiles gFile_graphics_interface_ball_Poke_sheet, 0x180, 55000
	obj_tiles gFile_graphics_interface_ball_Great_sheet, 0x180, 55001
	obj_tiles gFile_graphics_interface_ball_Safari_sheet, 0x180, 55002
	obj_tiles gFile_graphics_interface_ball_Ultra_sheet, 0x180, 55003
	obj_tiles gFile_graphics_interface_ball_Master_sheet, 0x180, 55004
	obj_tiles gFile_graphics_interface_ball_Net_sheet, 0x180, 55005
	obj_tiles gFile_graphics_interface_ball_Dive_sheet, 0x180, 55006
	obj_tiles gFile_graphics_interface_ball_Nest_sheet, 0x180, 55007
	obj_tiles gFile_graphics_interface_ball_Repeat_sheet, 0x180, 55008
	obj_tiles gFile_graphics_interface_ball_Timer_sheet, 0x180, 55009
	obj_tiles gFile_graphics_interface_ball_Luxury_sheet, 0x180, 55010
	obj_tiles gFile_graphics_interface_ball_Premier_sheet, 0x180, 55011

gUnknown_82605CC:: @ 82605CC
	obj_pal gFile_graphics_interface_ball_Poke_palette, 55000
	obj_pal gFile_graphics_interface_ball_Great_palette, 55001
	obj_pal gFile_graphics_interface_ball_Safari_palette, 55002
	obj_pal gFile_graphics_interface_ball_Ultra_palette, 55003
	obj_pal gFile_graphics_interface_ball_Master_palette, 55004
	obj_pal gFile_graphics_interface_ball_Net_palette, 55005
	obj_pal gFile_graphics_interface_ball_Dive_palette, 55006
	obj_pal gFile_graphics_interface_ball_Nest_palette, 55007
	obj_pal gFile_graphics_interface_ball_Repeat_palette, 55008
	obj_pal gFile_graphics_interface_ball_Timer_palette, 55009
	obj_pal gFile_graphics_interface_ball_Luxury_palette, 55010
	obj_pal gFile_graphics_interface_ball_Premier_palette, 55011

gOamData_826062C:: @ 826062C
	.4byte 0x40000300, 0x00000800

gSpriteAnim_8260634:: @ 8260634
	obj_image_anim_frame 0x0, 0x5
	obj_image_anim_jump 0

gSpriteAnim_826063C:: @ 826063C
	obj_image_anim_frame 0x4, 0x1
	obj_image_anim_jump 0

gSpriteAnim_8260644:: @ 8260644
	obj_image_anim_frame 0x8, 0x5
	obj_image_anim_jump 0

gSpriteAnim_826064C:: @ 826064C
	obj_image_anim_frame 0xc, 0x1
	obj_image_anim_jump 0

gSpriteAnim_8260654:: @ 8260654
	obj_image_anim_frame 0x0, 0x1
	obj_image_anim_end

gSpriteAnim_826065C:: @ 826065C
	obj_image_anim_frame 0x4, 0x5
	obj_image_anim_frame 0x8, 0x5
	obj_image_anim_end

gSpriteAnim_8260668:: @ 8260668
	obj_image_anim_frame 0x4, 0x5
	obj_image_anim_frame 0x0, 0x5
	obj_image_anim_end

gSpriteAnimTable_8260674::
	.4byte gSpriteAnim_8260654
	.4byte gSpriteAnim_826065C
	.4byte gSpriteAnim_8260668
	.4byte gSpriteAnim_8260634
	.4byte gSpriteAnim_8260644
	.4byte gSpriteAnim_826063C
	.4byte gSpriteAnim_826064C

gSpriteAffineAnims_8260690::
	obj_rot_scal_anim_frame 0x0, 0x0, 0x0, 0x1
	obj_rot_scal_anim_jump 0

gSpriteAffineAnims_82606A0::
	obj_rot_scal_anim_frame 0x0, 0x0, 0xfd, 0x1
	obj_rot_scal_anim_jump 0

gSpriteAffineAnims_82606B0::
	obj_rot_scal_anim_frame 0x0, 0x0, 0x3, 0x1
	obj_rot_scal_anim_jump 0

gSpriteAffineAnims_82606C0::
	obj_rot_scal_anim_frame 0x100, 0x100, 0x0, 0x0
	obj_rot_scal_anim_end

gSpriteAffineAnims_82606D0::
	obj_rot_scal_anim_frame 0x0, 0x0, 0x19, 0x1
	obj_rot_scal_anim_jump 0

gSpriteAffineAnimTable_82606E0::
	.4byte gSpriteAffineAnims_8260690
	.4byte gSpriteAffineAnims_82606A0
	.4byte gSpriteAffineAnims_82606B0
	.4byte gSpriteAffineAnims_82606C0
	.4byte gSpriteAffineAnims_82606D0

gBallSpriteTemplates:: @ 82606F4
	spr_template 55000, 55000, gOamData_826062C, gSpriteAnimTable_8260674, NULL, gSpriteAffineAnimTable_82606E0, SpriteCB_TestBallThrow
	spr_template 55001, 55001, gOamData_826062C, gSpriteAnimTable_8260674, NULL, gSpriteAffineAnimTable_82606E0, SpriteCB_TestBallThrow
	spr_template 55002, 55002, gOamData_826062C, gSpriteAnimTable_8260674, NULL, gSpriteAffineAnimTable_82606E0, SpriteCB_TestBallThrow
	spr_template 55003, 55003, gOamData_826062C, gSpriteAnimTable_8260674, NULL, gSpriteAffineAnimTable_82606E0, SpriteCB_TestBallThrow
	spr_template 55004, 55004, gOamData_826062C, gSpriteAnimTable_8260674, NULL, gSpriteAffineAnimTable_82606E0, SpriteCB_TestBallThrow
	spr_template 55005, 55005, gOamData_826062C, gSpriteAnimTable_8260674, NULL, gSpriteAffineAnimTable_82606E0, SpriteCB_TestBallThrow
	spr_template 55006, 55006, gOamData_826062C, gSpriteAnimTable_8260674, NULL, gSpriteAffineAnimTable_82606E0, SpriteCB_TestBallThrow
	spr_template 55007, 55007, gOamData_826062C, gSpriteAnimTable_8260674, NULL, gSpriteAffineAnimTable_82606E0, SpriteCB_TestBallThrow
	spr_template 55008, 55008, gOamData_826062C, gSpriteAnimTable_8260674, NULL, gSpriteAffineAnimTable_82606E0, SpriteCB_TestBallThrow
	spr_template 55009, 55009, gOamData_826062C, gSpriteAnimTable_8260674, NULL, gSpriteAffineAnimTable_82606E0, SpriteCB_TestBallThrow
	spr_template 55010, 55010, gOamData_826062C, gSpriteAnimTable_8260674, NULL, gSpriteAffineAnimTable_82606E0, SpriteCB_TestBallThrow
	spr_template 55011, 55011, gOamData_826062C, gSpriteAnimTable_8260674, NULL, gSpriteAffineAnimTable_82606E0, SpriteCB_TestBallThrow
