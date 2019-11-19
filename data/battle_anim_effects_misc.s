#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83E2964:: @ 83E2964
	.byte 0x02, 0x04, 0x01, 0x03

gUnknown_83E2968::
	obj_image_anim_frame 0x0000, 5
	obj_image_anim_frame 0x0002, 5
	obj_image_anim_frame 0x0004, 5
	obj_image_anim_frame 0x0006, 5
	obj_image_anim_frame 0x0008, 5
	obj_image_anim_frame 0x000a, 5
	obj_image_anim_frame 0x000c, 5
	obj_image_anim_frame 0x000e, 5
	obj_image_anim_jump 0x0000

gUnknown_83E298C::
	.4byte gUnknown_83E2968

gUnknown_83E2990::
	spr_template 10067, 10067, gOamData_83ACA08, gUnknown_83E298C, NULL, gDummySpriteAffineAnimTable, sub_80A22E8

gUnknown_83E29A8::
	spr_template 10068, 10068, gOamData_83ACA08, gUnknown_83E298C, NULL, gDummySpriteAffineAnimTable, sub_80A22E8

gUnknown_83E29C0::
	spr_template 10065, 10065, gOamData_83ACA08, gUnknown_83E298C, NULL, gDummySpriteAffineAnimTable, sub_80A22E8

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

gSpriteTemplate_83E2AA0::
	.incbin "baserom.gba", 0x3E2AA0, 0x1C

gUnknown_83E2ABC::
	.incbin "baserom.gba", 0x3E2ABC, 0x2C

gUnknown_83E2AE8::
	.incbin "baserom.gba", 0x3E2AE8, 0x18

gUnknown_83E2B00::
	.incbin "baserom.gba", 0x3E2B00, 0x34

gUnknown_83E2B34::
	.incbin "baserom.gba", 0x3E2B34, 0x30

gUnknown_83E2B64::
	.incbin "baserom.gba", 0x3E2B64, 0x30

gUnknown_83E2B94::
	.incbin "baserom.gba", 0x3E2B94, 0x18

gUnknown_83E2BAC::
	.incbin "baserom.gba", 0x3E2BAC, 0x5C

gUnknown_83E2C08::
	.incbin "baserom.gba", 0x3E2C08, 0x18

gUnknown_83E2C20::
	.incbin "baserom.gba", 0x3E2C20, 0x30

gUnknown_83E2C50::
	.incbin "baserom.gba", 0x3E2C50, 0x2C

gUnknown_83E2C7C::
	.incbin "baserom.gba", 0x3E2C7C, 0x90

gUnknown_83E2D0C::
	.incbin "baserom.gba", 0x3E2D0C, 0x48

gUnknown_83E2D54::
	.incbin "baserom.gba", 0x3E2D54, 0x70

gUnknown_83E2DC4::
	.incbin "baserom.gba", 0x3E2DC4, 0x18

gUnknown_83E2DDC::
	.incbin "baserom.gba", 0x3E2DDC, 0x28

gUnknown_83E2E04::
	.incbin "baserom.gba", 0x3E2E04, 0x84

gUnknown_83E2E88::
	.incbin "baserom.gba", 0x3E2E88, 0x18

gUnknown_83E2EA0::
	.incbin "baserom.gba", 0x3E2EA0, 0x30

gUnknown_83E2ED0::
	.incbin "baserom.gba", 0x3E2ED0, 0x18

gUnknown_83E2EE8::
	.incbin "baserom.gba", 0x3E2EE8, 0x78

gUnknown_83E2F60::
	.incbin "baserom.gba", 0x3E2F60, 0x18

gUnknown_83E2F78:: @ 83E2F78
	.incbin "baserom.gba", 0x3E2F78, 0x78

gUnknown_83E2FF0:: @ 83E2FF0
	.incbin "baserom.gba", 0x3E2FF0, 0x34

gUnknown_83E3024::
	.incbin "baserom.gba", 0x3E3024, 0x18

gUnknown_83E303C::
	.incbin "baserom.gba", 0x3E303C, 0x6C

gUnknown_83E30A8::
	.incbin "baserom.gba", 0x3E30A8, 0x18

gUnknown_83E30C0::
	.incbin "baserom.gba", 0x3E30C0, 0x18

gUnknown_83E30D8::
	.incbin "baserom.gba", 0x3E30D8, 0x18

gUnknown_83E30F0:: @ 83E30F0
	.incbin "baserom.gba", 0x3E30F0, 0x10

gUnknown_83E3100::
	.incbin "baserom.gba", 0x3E3100, 0x48

gUnknown_83E3148::
	.incbin "baserom.gba", 0x3E3148, 0x18

gUnknown_83E3160::
	.incbin "baserom.gba", 0x3E3160, 0x134

gUnknown_83E3294::
	.incbin "baserom.gba", 0x3E3294, 0x18

gUnknown_83E32AC::
	.incbin "baserom.gba", 0x3E32AC, 0xA8

gUnknown_83E3354::
	.incbin "baserom.gba", 0x3E3354, 0x60

gUnknown_83E33B4::
	.incbin "baserom.gba", 0x3E33B4, 0x40

gUnknown_83E33F4::
	.incbin "baserom.gba", 0x3E33F4, 0x18

gUnknown_83E340C::
	.incbin "baserom.gba", 0x3E340C, 0xF4

gUnknown_83E3500::
	.incbin "baserom.gba", 0x3E3500, 0x18

gUnknown_83E3518::
	.incbin "baserom.gba", 0x3E3518, 0x18

gUnknown_83E3530::
	.incbin "baserom.gba", 0x3E3530, 0x18

gUnknown_83E3548:: @ 83E3548
	.incbin "baserom.gba", 0x3E3548, 0x8

gUnknown_83E3550::
	.incbin "baserom.gba", 0x3E3550, 0x54

gUnknown_83E35A4::
	.incbin "baserom.gba", 0x3E35A4, 0x18

gUnknown_83E35BC::
	.incbin "baserom.gba", 0x3E35BC, 0x18

gUnknown_83E35D4::
	.incbin "baserom.gba", 0x3E35D4, 0x30

gUnknown_83E3604::
	.incbin "baserom.gba", 0x3E3604, 0x58

gUnknown_83E365C::
	.incbin "baserom.gba", 0x3E365C, 0x18

gUnknown_83E3674::
	.incbin "baserom.gba", 0x3E3674, 0x34

gUnknown_83E36A8::
	.incbin "baserom.gba", 0x3E36A8, 0x44

gUnknown_83E36EC::
	.incbin "baserom.gba", 0x3E36EC, 0x30

gUnknown_83E371C::
	.incbin "baserom.gba", 0x3E371C, 0x18

gUnknown_83E3734:: @ 83E3734
	.incbin "baserom.gba", 0x3E3734, 0x30

gUnknown_83E3764:: @ 83E3764
	.incbin "baserom.gba", 0x3E3764, 0x40

gUnknown_83E37A4::
	.incbin "baserom.gba", 0x3E37A4, 0x18

gUnknown_83E37BC::
	.incbin "baserom.gba", 0x3E37BC, 0x30

gUnknown_83E37EC::
	.incbin "baserom.gba", 0x3E37EC, 0x94

gUnknown_83E3880::
	.incbin "baserom.gba", 0x3E3880, 0x18

gUnknown_83E3898:: @ 83E3898
	.incbin "baserom.gba", 0x3E3898, 0x30

gUnknown_83E38C8::
	.incbin "baserom.gba", 0x3E38C8, 0x18

gUnknown_83E38E0::
	.incbin "baserom.gba", 0x3E38E0, 0x34

gUnknown_83E3914::
	.incbin "baserom.gba", 0x3E3914, 0x78

gUnknown_83E398C:: @ 83E398C
	.incbin "baserom.gba", 0x3E398C, 0xA8

gUnknown_83E3A34::
	.incbin "baserom.gba", 0x3E3A34, 0x18

gUnknown_83E3A4C::
	.incbin "baserom.gba", 0x3E3A4C, 0x78

gUnknown_83E3AC4::
	.incbin "baserom.gba", 0x3E3AC4, 0xF8

gUnknown_83E3BBC::
	.incbin "baserom.gba", 0x3E3BBC, 0x3C

gUnknown_83E3BF8::
	.incbin "baserom.gba", 0x3E3BF8, 0x18

gUnknown_83E3C10::
	.incbin "baserom.gba", 0x3E3C10, 0x18

gUnknown_83E3C28:: @ 83E3C28
	.incbin "baserom.gba", 0x3E3C28, 0x78

gUnknown_83E3CA0::
	.incbin "baserom.gba", 0x3E3CA0, 0x18

gUnknown_83E3CB8::
	.incbin "baserom.gba", 0x3E3CB8, 0x18

gUnknown_83E3CD0::
	.incbin "baserom.gba", 0x3E3CD0, 0x18

gUnknown_83E3CE8::
	.incbin "baserom.gba", 0x3E3CE8, 0x18

gUnknown_83E3D00::
	.incbin "baserom.gba", 0x3E3D00, 0x18

gUnknown_83E3D18:: @ 83E3D18
	.incbin "baserom.gba", 0x3E3D18, 0x38

gUnknown_83E3D50::
	.incbin "baserom.gba", 0x3E3D50, 0x18

gUnknown_83E3D68::
	.incbin "baserom.gba", 0x3E3D68, 0x2C

gUnknown_83E3D94::
	.incbin "baserom.gba", 0x3E3D94, 0x34

gUnknown_83E3DC8::
	.incbin "baserom.gba", 0x3E3DC8, 0x40

gUnknown_83E3E08::
	.incbin "baserom.gba", 0x3E3E08, 0x40

gUnknown_83E3E48::
	.incbin "baserom.gba", 0x3E3E48, 0x18

gUnknown_83E3E60:: @ 83E3E60
	.incbin "baserom.gba", 0x3E3E60, 0x20

gUnknown_83E3E80:: @ 83E3E80
	.incbin "baserom.gba", 0x3E3E80, 0x50

gUnknown_83E3ED0::
	.incbin "baserom.gba", 0x3E3ED0, 0x34

gUnknown_83E3F04::
	.incbin "baserom.gba", 0x3E3F04, 0x18

gUnknown_83E3F1C:: @ 83E3F1C
	.incbin "baserom.gba", 0x3E3F1C, 0x30

gUnknown_83E3F4C::
	.incbin "baserom.gba", 0x3E3F4C, 0x18

gUnknown_83E3F64::
	.incbin "baserom.gba", 0x3E3F64, 0x30

gUnknown_83E3F94::
	.incbin "baserom.gba", 0x3E3F94, 0x94

gUnknown_83E4028::
	.incbin "baserom.gba", 0x3E4028, 0x6C

gUnknown_83E4094::
	.incbin "baserom.gba", 0x3E4094, 0x34

gUnknown_83E40C8::
	.incbin "baserom.gba", 0x3E40C8, 0x18

gUnknown_83E40E0::
	.incbin "baserom.gba", 0x3E40E0, 0x18

gUnknown_83E40F8::
	.incbin "baserom.gba", 0x3E40F8, 0x18

gUnknown_83E4110::
	.incbin "baserom.gba", 0x3E4110, 0x18

gUnknown_83E4128:: @ 83E4128
	.incbin "baserom.gba", 0x3E4128, 0x2C

gUnknown_83E4154:: @ 83E4154
	.incbin "baserom.gba", 0x3E4154, 0x18

gUnknown_83E416C:: @ 83E416C
	.incbin "baserom.gba", 0x3E416C, 0x44

gUnknown_83E41B0::
	.incbin "baserom.gba", 0x3E41B0, 0x18

gUnknown_83E41C8:: @ 83E41C8
	.incbin "baserom.gba", 0x3E41C8, 0x8

gUnknown_83E41D0::
	.incbin "baserom.gba", 0x3E41D0, 0x18

gUnknown_83E41E8::
	.incbin "baserom.gba", 0x3E41E8, 0x18

gUnknown_83E4200:: @ 83E4200
	.incbin "baserom.gba", 0x3E4200, 0x18

gUnknown_83E4218::
	.incbin "baserom.gba", 0x3E4218, 0x18

gUnknown_83E4230::
	.incbin "baserom.gba", 0x3E4230, 0x18

gUnknown_83E4248::
	.incbin "baserom.gba", 0x3E4248, 0x34

gUnknown_83E427C::
	.incbin "baserom.gba", 0x3E427C, 0x18

gUnknown_83E4294::
	.incbin "baserom.gba", 0x3E4294, 0x34

gUnknown_83E42C8::
	.incbin "baserom.gba", 0x3E42C8, 0x34

gUnknown_83E42FC::
	.incbin "baserom.gba", 0x3E42FC, 0x24

gUnknown_83E4320::
	.incbin "baserom.gba", 0x3E4320, 0x18

gUnknown_83E4338::
	.incbin "baserom.gba", 0x3E4338, 0x30

gUnknown_83E4368::
	.incbin "baserom.gba", 0x3E4368, 0x48

gUnknown_83E43B0::
	.incbin "baserom.gba", 0x3E43B0, 0x48

gUnknown_83E43F8::
	.incbin "baserom.gba", 0x3E43F8, 0x18

gUnknown_83E4410:: @ 83E4410
	.incbin "baserom.gba", 0x3E4410, 0x20

gUnknown_83E4430::
	.incbin "baserom.gba", 0x3E4430, 0x54

gUnknown_83E4484::
	.incbin "baserom.gba", 0x3E4484, 0x18

gUnknown_83E449C::
	.incbin "baserom.gba", 0x3E449C, 0x40

gUnknown_83E44DC::
	.incbin "baserom.gba", 0x3E44DC, 0x13BC

gUnknown_83E5898:: @ 83E5898
	.incbin "baserom.gba", 0x3E5898, 0x48

gUnknown_83E58E0::
	.incbin "baserom.gba", 0x3E58E0, 0x4C

gUnknown_83E592C::
	.incbin "baserom.gba", 0x3E592C, 0x2C

gUnknown_83E5958:: @ 83E5958
	.incbin "baserom.gba", 0x3E5958, 0x4

gUnknown_83E595C::
	.incbin "baserom.gba", 0x3E595C, 0x18

gUnknown_83E5974::
	.incbin "baserom.gba", 0x3E5974, 0x18

gUnknown_83E598C::
	.incbin "baserom.gba", 0x3E598C, 0x18

gUnknown_83E59A4::
	.incbin "baserom.gba", 0x3E59A4, 0x2C

gUnknown_83E59D0::
	.incbin "baserom.gba", 0x3E59D0, 0x18

gUnknown_83E59E8::
	.incbin "baserom.gba", 0x3E59E8, 0x50

gUnknown_83E5A38::
	.incbin "baserom.gba", 0x3E5A38, 0x18

gUnknown_83E5A50::
	.incbin "baserom.gba", 0x3E5A50, 0x28

gUnknown_83E5A78::
	.incbin "baserom.gba", 0x3E5A78, 0x8

gUnknown_83E5A80::
	.incbin "baserom.gba", 0x3E5A80, 0x18

gUnknown_83E5A98::
	.incbin "baserom.gba", 0x3E5A98, 0x18

gUnknown_83E5AB0::
	.incbin "baserom.gba", 0x3E5AB0, 0x18

gUnknown_83E5AC8::
	.incbin "baserom.gba", 0x3E5AC8, 0x18

gUnknown_83E5AE0:: @ 83E5AE0
	.incbin "baserom.gba", 0x3E5AE0, 0x90

gUnknown_83E5B70::
	.incbin "baserom.gba", 0x3E5B70, 0x18

gUnknown_83E5B88:: @ 83E5B88
	.incbin "baserom.gba", 0x3E5B88, 0x18

gUnknown_83E5BA0:: @ 83E5BA0
	.incbin "baserom.gba", 0x3E5BA0, 0x18
