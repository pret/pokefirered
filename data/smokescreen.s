	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gSmokescreenImpactSpriteSheet::
	obj_tiles gSmokescreenImpactTiles, 0x0180, 55019

gSmokescreenImpactSpritePalette::
	obj_pal gSmokescreenImpactPalette, 55019

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

gSmokescreenImpactSpriteTemplate::
	spr_template 55019, 55019, gOamData_835099C, gSpriteAnimTable_82509E4, NULL, gDummySpriteAffineAnimTable, SpriteCB_DestroySprite

gSpriteSheet_EnemyShadow::
	obj_tiles gFile_graphics_battle_interface_enemy_mon_shadow_sheet, 0x0080, 55129

gOamData_8250A14::
	.4byte 0x40004000, 0x00000c00

gSpriteTemplate_EnemyShadow::
	spr_template 55129, 55039, gOamData_8250A14, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCB_SetInvisible
