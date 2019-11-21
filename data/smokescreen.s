	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_825098C:: @ 825098C
	obj_tiles gFile_graphics_battle_anims_sprites_smokescreen_impact_sheet, 0x0180, 55019

gUnknown_8250994:: @ 8250994
	obj_pal gFile_graphics_battle_anims_sprites_smokescreen_impact_palette, 55019

gOamData_835099C::
	.4byte 0x40000000, 0x00000400

gAnimCmd_82509A4::
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 8, 4
	obj_image_anim_end

gAnimCmd_82509B4::
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 4, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

gAnimCmd_82509C4::
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 4, 4, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 8, 4, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

gAnimCmd_82509D4::
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 4, 4, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 8, 4, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

gSpriteAnimTable_82509E4::
	.4byte gAnimCmd_82509A4
	.4byte gAnimCmd_82509B4
	.4byte gAnimCmd_82509C4
	.4byte gAnimCmd_82509D4

gUnknown_82509F4:: @ 82509F4
	spr_template 55019, 55019, gOamData_835099C, gSpriteAnimTable_82509E4, NULL, gDummySpriteAffineAnimTable, sub_804A904

gSpriteSheet_EnemyShadow:: @ 8250A0C
	obj_tiles gFile_graphics_battle_interface_enemy_mon_shadow_sheet, 0x0080, 55129

gOamData_8250A14::
	.4byte 0x40004000, 0x00000c00

gSpriteTemplate_EnemyShadow:: @ 8250A1C
	spr_template 55129, 55039, gOamData_8250A14, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCB_SetInvisible
