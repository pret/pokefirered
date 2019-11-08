#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83E2964:: @ 83E2964
	.incbin "baserom.gba", 0x3E2964, 0x74

gAnimCmd_83E29D8::
	obj_image_anim_frame 0, 1
	obj_image_anim_end

gAnimCmd_83E29E0::
	obj_image_anim_frame 1, 1
	obj_image_anim_end

gAnimCmd_83E29E8::
	obj_image_anim_frame 2, 1
	obj_image_anim_end

gAnimCmd_83E29F0::
	obj_image_anim_frame 3, 1
	obj_image_anim_end

gAnimCmd_83E29F8::
	obj_image_anim_frame 4, 1
	obj_image_anim_end

gAnimCmd_83E2A00::
	obj_image_anim_frame 5, 1
	obj_image_anim_end

gAnimCmd_83E2A08::
	obj_image_anim_frame 6, 1
	obj_image_anim_end

gAnimCmd_83E2A10::
	obj_image_anim_frame 7, 1
	obj_image_anim_end

gAnimCmd_83E2A18::
	obj_image_anim_frame 8, 1
	obj_image_anim_end

gSpriteAnimTable_83E2A20::
	.4byte gAnimCmd_83E29D8
	.4byte gAnimCmd_83E29E0
	.4byte gAnimCmd_83E29E8
	.4byte gAnimCmd_83E29F0
	.4byte gAnimCmd_83E29F8
	.4byte gAnimCmd_83E2A00
	.4byte gAnimCmd_83E2A08

gSpriteAnimTable_83E2A3C::
	.4byte gAnimCmd_83E2A10

gSpriteAnimTable_83E2A40::
	.4byte gAnimCmd_83E2A18

gAffineAnimCmd_83E2A44::
	obj_rot_scal_anim_frame -5, -5, 0, 1
	obj_rot_scal_anim_jump 0

gSpriteAffineAnimTable_83E2A54::
	.4byte gAffineAnimCmd_83E2A44

gUnknown_83E2A58::
	spr_template 10147, 10147, gOamData_83ACB50, gSpriteAnimTable_83E2A40, NULL, gSpriteAffineAnimTable_83E2A54, sub_80A2388

gUnknown_83E2A70::
	spr_template 10147, 10147, gOamData_83AC9C8, gSpriteAnimTable_83E2A20, NULL, gDummySpriteAffineAnimTable, sub_80A23D8

gUnknown_83E2A88:: @ 83E2A88
	spr_template 10147, 10147, gOamData_83AC9C8, gSpriteAnimTable_83E2A3C, NULL, gDummySpriteAffineAnimTable, sub_80A2430

	.incbin "baserom.gba", 0x3E2AA0, 0x4D8

gUnknown_83E2F78:: @ 83E2F78
	.incbin "baserom.gba", 0x3E2F78, 0x78

gUnknown_83E2FF0:: @ 83E2FF0
	.incbin "baserom.gba", 0x3E2FF0, 0x100

gUnknown_83E30F0:: @ 83E30F0
	.incbin "baserom.gba", 0x3E30F0, 0x458

gUnknown_83E3548:: @ 83E3548
	.incbin "baserom.gba", 0x3E3548, 0x1EC

gUnknown_83E3734:: @ 83E3734
	.incbin "baserom.gba", 0x3E3734, 0x30

gUnknown_83E3764:: @ 83E3764
	.incbin "baserom.gba", 0x3E3764, 0x134

gUnknown_83E3898:: @ 83E3898
	.incbin "baserom.gba", 0x3E3898, 0xF4

gUnknown_83E398C:: @ 83E398C
	.incbin "baserom.gba", 0x3E398C, 0x29C

gUnknown_83E3C28:: @ 83E3C28
	.incbin "baserom.gba", 0x3E3C28, 0xF0

gUnknown_83E3D18:: @ 83E3D18
	.incbin "baserom.gba", 0x3E3D18, 0x148

gUnknown_83E3E60:: @ 83E3E60
	.incbin "baserom.gba", 0x3E3E60, 0x20

gUnknown_83E3E80:: @ 83E3E80
	.incbin "baserom.gba", 0x3E3E80, 0x9C

gUnknown_83E3F1C:: @ 83E3F1C
	.incbin "baserom.gba", 0x3E3F1C, 0x20C

gUnknown_83E4128:: @ 83E4128
	.incbin "baserom.gba", 0x3E4128, 0x2C

gUnknown_83E4154:: @ 83E4154
	.incbin "baserom.gba", 0x3E4154, 0x18

gUnknown_83E416C:: @ 83E416C
	.incbin "baserom.gba", 0x3E416C, 0x5C

gUnknown_83E41C8:: @ 83E41C8
	.incbin "baserom.gba", 0x3E41C8, 0x38

gUnknown_83E4200:: @ 83E4200
	.incbin "baserom.gba", 0x3E4200, 0x210

gUnknown_83E4410:: @ 83E4410
	.incbin "baserom.gba", 0x3E4410, 0x1488

gUnknown_83E5898:: @ 83E5898
	.incbin "baserom.gba", 0x3E5898, 0xC0

gUnknown_83E5958:: @ 83E5958
	.incbin "baserom.gba", 0x3E5958, 0x120

gUnknown_83E5A78:: @ 83E5A78
	.incbin "baserom.gba", 0x3E5A78, 0x68

gUnknown_83E5AE0:: @ 83E5AE0
	.incbin "baserom.gba", 0x3E5AE0, 0xA8

gUnknown_83E5B88:: @ 83E5B88
	.incbin "baserom.gba", 0x3E5B88, 0x1C0

gUnknown_83E5D48:: @ 83E5D48
	.incbin "baserom.gba", 0x3E5D48, 0xE4

gUnknown_83E5E2C:: @ 83E5E2C
	.incbin "baserom.gba", 0x3E5E2C, 0x18

gUnknown_83E5E44:: @ 83E5E44
	.incbin "baserom.gba", 0x3E5E44, 0x2

gUnknown_83E5E46:: @ 83E5E46
	.incbin "baserom.gba", 0x3E5E46, 0xB6

gUnknown_83E5EFC:: @ 83E5EFC
	.incbin "baserom.gba", 0x3E5EFC, 0x10

gUnknown_83E5F0C:: @ 83E5F0C
	.incbin "baserom.gba", 0x3E5F0C, 0x10
