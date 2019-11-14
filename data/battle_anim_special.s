#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
#define RGB(r, g, b) ((r) | ((g) << 5) | ((b) << 10))
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_840BF3C:: @ 840BF3C
	.byte  10, 2, -3, 0
	.byte  15, 0, -4, 0
	.byte -10, 2, -4, 0

gUnknown_840BF48:: @ 840BF48
	obj_tiles gFile_graphics_battle_anims_sprites_particles_sheet, 0x0100, 55020
	obj_tiles gFile_graphics_battle_anims_sprites_particles_sheet, 0x0100, 55021
	obj_tiles gFile_graphics_battle_anims_sprites_particles_sheet, 0x0100, 55022
	obj_tiles gFile_graphics_battle_anims_sprites_particles_sheet, 0x0100, 55023
	obj_tiles gFile_graphics_battle_anims_sprites_particles_sheet, 0x0100, 55024
	obj_tiles gFile_graphics_battle_anims_sprites_particles_sheet, 0x0100, 55025
	obj_tiles gFile_graphics_battle_anims_sprites_particles_sheet, 0x0100, 55026
	obj_tiles gFile_graphics_battle_anims_sprites_particles_sheet, 0x0100, 55027
	obj_tiles gFile_graphics_battle_anims_sprites_particles_sheet, 0x0100, 55028
	obj_tiles gFile_graphics_battle_anims_sprites_particles_sheet, 0x0100, 55029
	obj_tiles gFile_graphics_battle_anims_sprites_particles_sheet, 0x0100, 55030
	obj_tiles gFile_graphics_battle_anims_sprites_particles_sheet, 0x0100, 55031

gUnknown_840BFA8:: @ 840BFA8
	obj_pal gFile_graphics_battle_anims_sprites_136_palette, 55020
	obj_pal gFile_graphics_battle_anims_sprites_136_palette, 55021
	obj_pal gFile_graphics_battle_anims_sprites_136_palette, 55022
	obj_pal gFile_graphics_battle_anims_sprites_136_palette, 55023
	obj_pal gFile_graphics_battle_anims_sprites_136_palette, 55024
	obj_pal gFile_graphics_battle_anims_sprites_136_palette, 55025
	obj_pal gFile_graphics_battle_anims_sprites_136_palette, 55026
	obj_pal gFile_graphics_battle_anims_sprites_136_palette, 55027
	obj_pal gFile_graphics_battle_anims_sprites_136_palette, 55028
	obj_pal gFile_graphics_battle_anims_sprites_136_palette, 55029
	obj_pal gFile_graphics_battle_anims_sprites_136_palette, 55030
	obj_pal gFile_graphics_battle_anims_sprites_136_palette, 55031

gAnimCmd_840C008:: @ 840C008
	obj_image_anim_frame 0x0000, 1
	obj_image_anim_frame 0x0001, 1
	obj_image_anim_frame 0x0002, 1
	obj_image_anim_frame 0x0000, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0x0002, 1
	obj_image_anim_frame 0x0001, 1
	obj_image_anim_jump 0x0000

gAnimCmd_840C024:: @ 840C024
	obj_image_anim_frame 0x0003, 1
	obj_image_anim_end

gAnimCmd_840C02C:: @ 840C02C
	obj_image_anim_frame 0x0004, 1
	obj_image_anim_end

gAnimCmd_840C034:: @ 840C034
	obj_image_anim_frame 0x0005, 1
	obj_image_anim_end

gAnimCmd_840C03C:: @ 840C03C
	obj_image_anim_frame 0x0006, 4
	obj_image_anim_frame 0x0007, 4
	obj_image_anim_jump 0x0000

gAnimCmd_840C048:: @ 840C048
	obj_image_anim_frame 0x0007, 4
	obj_image_anim_end

gSpriteAnimTable_840C050::
	.4byte gAnimCmd_840C008
	.4byte gAnimCmd_840C024
	.4byte gAnimCmd_840C02C
	.4byte gAnimCmd_840C034
	.4byte gAnimCmd_840C03C
	.4byte gAnimCmd_840C048

gUnknown_840C068:: @ 840C068
	.byte 0x00, 0x00, 0x00, 0x05, 0x01, 0x02, 0x02, 0x03, 0x05, 0x05, 0x04, 0x04

gUnknown_840C074:: @ 840C074
	.4byte sub_80F06A4
	.4byte sub_80F0C28
	.4byte sub_80F0A20
	.4byte sub_80F0B20
	.4byte sub_80F0F10
	.4byte sub_80F0A20
	.4byte sub_80F091C
	.4byte sub_80F0B20
	.4byte sub_80F0DB4
	.4byte sub_80F0818
	.4byte sub_80F0C28
	.4byte sub_80F103C

gUnknown_840C0A4:: @ 840C0A4
	spr_template 55020, 55020, gOamData_83AC9C8, gSpriteAnimTable_840C050, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_840C0BC::
	spr_template 55021, 55021, gOamData_83AC9C8, gSpriteAnimTable_840C050, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
	spr_template 55022, 55022, gOamData_83AC9C8, gSpriteAnimTable_840C050, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
	spr_template 55023, 55023, gOamData_83AC9C8, gSpriteAnimTable_840C050, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_840C104:: @ 840C104
	spr_template 55024, 55024, gOamData_83AC9C8, gSpriteAnimTable_840C050, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
	spr_template 55025, 55025, gOamData_83AC9C8, gSpriteAnimTable_840C050, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
	spr_template 55026, 55026, gOamData_83AC9C8, gSpriteAnimTable_840C050, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
	spr_template 55027, 55027, gOamData_83AC9C8, gSpriteAnimTable_840C050, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
	spr_template 55028, 55028, gOamData_83AC9C8, gSpriteAnimTable_840C050, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
	spr_template 55029, 55029, gOamData_83AC9C8, gSpriteAnimTable_840C050, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
	spr_template 55030, 55030, gOamData_83AC9C8, gSpriteAnimTable_840C050, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
	spr_template 55031, 55031, gOamData_83AC9C8, gSpriteAnimTable_840C050, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_840C1C4:: @ 840C1C4
	.2byte RGB(31, 22, 30)
	.2byte RGB(16, 23, 30)
	.2byte RGB(23, 30, 20)
	.2byte RGB(31, 31, 15)
	.2byte RGB(23, 20, 28)
	.2byte RGB(21, 31, 25)
	.2byte RGB(12, 25, 30)
	.2byte RGB(30, 27, 10)
	.2byte RGB(31, 24, 16)
	.2byte RGB(29, 30, 30)
	.2byte RGB(31, 17, 10)
	.2byte RGB(31, 9, 10)
	.2byte RGB(0, 0, 0)
	.2byte RGB(1, 16, 0)
	.2byte RGB(3, 0, 1)
	.2byte RGB(1, 8, 0)
	.2byte RGB(0, 8, 0)
	.2byte RGB(3, 8, 1)
	.2byte RGB(6, 8, 1)
	.2byte RGB(4, 0, 0)

gUnknown_840C1EC::
	spr_template 10269, 10269, gOamData_83AC9D0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80F1B3C

gUnknown_840C204::
	obj_image_anim_frame 0x0040, 1
	obj_image_anim_end

gSpriteAnimTable_840C20C::
	.4byte gUnknown_840C204

gUnknown_840C210::
	spr_template 10058, 10058, gOamData_83AC9D8, gSpriteAnimTable_840C20C, NULL, gDummySpriteAffineAnimTable, sub_80F1B3C

