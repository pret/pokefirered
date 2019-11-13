#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83E2964:: @ 83E2964
	.incbin "baserom.gba", 0x3E2964, 0x2C

gUnknown_83E2990::
	.incbin "baserom.gba", 0x3E2990, 0x18

gUnknown_83E29A8::
	.incbin "baserom.gba", 0x3E29A8, 0x18

gUnknown_83E29C0::
	.incbin "baserom.gba", 0x3E29C0, 0x18

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
	.incbin "baserom.gba", 0x3E5A50, 0x30

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

gUnknown_83E5BA0::
	.incbin "baserom.gba", 0x3E5BA0, 0x40

gUnknown_83E5BE0::
	.incbin "baserom.gba", 0x3E5BE0, 0x18

gUnknown_83E5BF8::
	.incbin "baserom.gba", 0x3E5BF8, 0x78

gUnknown_83E5C70::
	.incbin "baserom.gba", 0x3E5C70, 0x18

gUnknown_83E5C88::
	.incbin "baserom.gba", 0x3E5C88, 0x18

gUnknown_83E5CA0::
	.incbin "baserom.gba", 0x3E5CA0, 0x78

gUnknown_83E5D18::
	.incbin "baserom.gba", 0x3E5D18, 0x30

@ ================
gUnknown_83E5D48:: @ 83E5D48
	.incbin "baserom.gba", 0x3E5D48, 0x4

gUnknown_83E5D4C::
	.incbin "baserom.gba", 0x3E5D4C, 0x18

gUnknown_83E5D64::
	.incbin "baserom.gba", 0x3E5D64, 0x18

gUnknown_83E5D7C::
	.incbin "baserom.gba", 0x3E5D7C, 0x18

gUnknown_83E5D94::
	.incbin "baserom.gba", 0x3E5D94, 0x50

gUnknown_83E5DE4::
	.incbin "baserom.gba", 0x3E5DE4, 0x18

gUnknown_83E5DFC::
	.incbin "baserom.gba", 0x3E5DFC, 0x18

gUnknown_83E5E14::
	.incbin "baserom.gba", 0x3E5E14, 0x18

gUnknown_83E5E2C:: @ 83E5E2C
	.incbin "baserom.gba", 0x3E5E2C, 0x18

gUnknown_83E5E44:: @ 83E5E44
	.incbin "baserom.gba", 0x3E5E44, 0x2

gUnknown_83E5E46:: @ 83E5E46
	.incbin "baserom.gba", 0x3E5E46, 0x1A

gUnknown_83E5E60::
	.incbin "baserom.gba", 0x3E5E60, 0x54

gUnknown_83E5EB4::
	.incbin "baserom.gba", 0x3E5EB4, 0x30

gUnknown_83E5EE4::
	.incbin "baserom.gba", 0x3E5EE4, 0x18

gUnknown_83E5EFC:: @ 83E5EFC
	.incbin "baserom.gba", 0x3E5EFC, 0x10

gUnknown_83E5F0C:: @ 83E5F0C
	.incbin "baserom.gba", 0x3E5F0C, 0x2C

gUnknown_83E5F38:: @ 83E5F38
	.incbin "baserom.gba", 0x3E5F38, 0x8C

gUnknown_83E5FC4::
	.incbin "baserom.gba", 0x3E5FC4, 0x18

gUnknown_83E5FDC::
	.incbin "baserom.gba", 0x3E5FDC, 0x2C

gUnknown_83E6008::
	.incbin "baserom.gba", 0x3E6008, 0x50

gUnknown_83E6058::
	.incbin "baserom.gba", 0x3E6058, 0x18

gUnknown_83E6070::
	.incbin "baserom.gba", 0x3E6070, 0x18

gUnknown_83E6088::
	.incbin "baserom.gba", 0x3E6088, 0x18

gUnknown_83E60A0:: @ 83E60A0
	.incbin "baserom.gba", 0x3E60A0, 0x18

gUnknown_83E60B8:: @ 83E60B8
	.incbin "baserom.gba", 0x3E60B8, 0x18

gUnknown_83E60D0:: @ 83E60D0
	.incbin "baserom.gba", 0x3E60D0, 0x50

gUnknown_83E6120:: @ 83E6120
	.incbin "baserom.gba", 0x3E6120, 0xB4

gUnknown_83E61D4::
	.incbin "baserom.gba", 0x3E61D4, 0x30

gUnknown_83E6204::
	.incbin "baserom.gba", 0x3E6204, 0x18

gUnknown_83E621C::
	.incbin "baserom.gba", 0x3E621C, 0x5C

gUnknown_83E6278:: @ 83E6278
	.incbin "baserom.gba", 0x3E6278, 0x18

gUnknown_83E6290::
	.incbin "baserom.gba", 0x3E6290, 0x18

gUnknown_83E62A8:: @ 83E62A8
	.incbin "baserom.gba", 0x3E62A8, 0xA0

gUnknown_83E6348::
	.incbin "baserom.gba", 0x3E6348, 0x18

gUnknown_83E6360::
	.incbin "baserom.gba", 0x3E6360, 0x2C

gUnknown_83E638C::
	.incbin "baserom.gba", 0x3E638C, 0x18

gUnknown_83E63A4::
	.incbin "baserom.gba", 0x3E63A4, 0x3C

gUnknown_83E63E0:: @ 83E63E0
	.incbin "baserom.gba", 0x3E63E0, 0x18

gUnknown_83E63F8::
	.incbin "baserom.gba", 0x3E63F8, 0x18

gUnknown_83E6410::
	.incbin "baserom.gba", 0x3E6410, 0x18

gUnknown_83E6428::
	.incbin "baserom.gba", 0x3E6428, 0x18

gUnknown_83E6440::
	.incbin "baserom.gba", 0x3E6440, 0x3C

gUnknown_83E647C::
	.incbin "baserom.gba", 0x3E647C, 0x28

gUnknown_83E64A4::
	.incbin "baserom.gba", 0x3E64A4, 0x18

gUnknown_83E64BC::
	.incbin "baserom.gba", 0x3E64BC, 0x18

gUnknown_83E64D4:: @ 83E64D4
	.incbin "baserom.gba", 0x3E64D4, 0x14

gUnknown_83E64E8::
	.incbin "baserom.gba", 0x3E64E8, 0x18

gUnknown_83E6500:: @ 83E6500
	.incbin "baserom.gba", 0x3E6500, 0x14

gUnknown_83E6514::
	.incbin "baserom.gba", 0x3E6514, 0x18

gUnknown_83E652C:: @ 83E652C
	.incbin "baserom.gba", 0x3E652C, 0x78

gUnknown_83E65A4:: @ 83E65A4
	.incbin "baserom.gba", 0x3E65A4, 0x18

gUnknown_83E65BC::
	.incbin "baserom.gba", 0x3E65BC, 0xA0

gUnknown_83E665C::
	.incbin "baserom.gba", 0x3E665C, 0x18

gUnknown_83E6674::
	.incbin "baserom.gba", 0x3E6674, 0x6C

gUnknown_83E66E0::
	.incbin "baserom.gba", 0x3E66E0, 0x18

gUnknown_83E66F8::
	.incbin "baserom.gba", 0x3E66F8, 0x18

gUnknown_83E6710::
	.incbin "baserom.gba", 0x3E6710, 0x18

gUnknown_83E6728::
	.incbin "baserom.gba", 0x3E6728, 0x18

gUnknown_83E6740::
	.incbin "baserom.gba", 0x3E6740, 0x18

gUnknown_83E6758::
	.incbin "baserom.gba", 0x3E6758, 0x34

gUnknown_83E678C::
	.incbin "baserom.gba", 0x3E678C, 0x34

gUnknown_83E67C0::
	.incbin "baserom.gba", 0x3E67C0, 0x18

gUnknown_83E67D8::
	.incbin "baserom.gba", 0x3E67D8, 0x18

gUnknown_83E67F0::
	.incbin "baserom.gba", 0x3E67F0, 0x18

gUnknown_83E6808::
	.incbin "baserom.gba", 0x3E6808, 0x18

gUnknown_83E6820::
	.incbin "baserom.gba", 0x3E6820, 0x44

gUnknown_83E6864::
	.incbin "baserom.gba", 0x3E6864, 0x18

gUnknown_83E687C::
	.incbin "baserom.gba", 0x3E687C, 0x18

gUnknown_83E6894::
	.incbin "baserom.gba", 0x3E6894, 0x18

gUnknown_83E68AC::
	.incbin "baserom.gba", 0x3E68AC, 0x54

gUnknown_83E6900::
	.incbin "baserom.gba", 0x3E6900, 0x48

gUnknown_83E6948::
	.incbin "baserom.gba", 0x3E6948, 0x34

gUnknown_83E697C::
	.incbin "baserom.gba", 0x3E697C, 0x30

gUnknown_83E69AC::
	.incbin "baserom.gba", 0x3E69AC, 0x74

gUnknown_83E6A20::
	.incbin "baserom.gba", 0x3E6A20, 0x18

gUnknown_83E6A38::
	.incbin "baserom.gba", 0x3E6A38, 0x18

gUnknown_83E6A50::
	.incbin "baserom.gba", 0x3E6A50, 0x34

gUnknown_83E6A84::
	.incbin "baserom.gba", 0x3E6A84, 0x34

gUnknown_83E6AB8::
	.incbin "baserom.gba", 0x3E6AB8, 0x18

gUnknown_83E6AD0::
	.incbin "baserom.gba", 0x3E6AD0, 0x18
