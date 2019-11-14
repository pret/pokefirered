#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83E2964:: @ 83E2964
	.byte 0x02, 0x04, 0x01, 0x03

gUnknown_83E2968:: @ 83E2968
	obj_image_anim_frame 0x0000, 5
	obj_image_anim_frame 0x0002, 5
	obj_image_anim_frame 0x0004, 5
	obj_image_anim_frame 0x0006, 5
	obj_image_anim_frame 0x0008, 5
	obj_image_anim_frame 0x000a, 5
	obj_image_anim_frame 0x000c, 5
	obj_image_anim_frame 0x000e, 5
	obj_image_anim_jump 0x0000

gUnknown_83E298C:: @ 83E298C
	.4byte gUnknown_83E2968

gUnknown_83E2990:: @ 83E2990
	spr_template 10067, 10067, gOamData_83ACA08, gUnknown_83E298C, NULL, gDummySpriteAffineAnimTable, sub_80A22E8

gUnknown_83E29A8:: @ 83E29A8
	spr_template 10068, 10068, gOamData_83ACA08, gUnknown_83E298C, NULL, gDummySpriteAffineAnimTable, sub_80A22E8

gUnknown_83E29C0:: @ 83E29C0
	spr_template 10065, 10065, gOamData_83ACA08, gUnknown_83E298C, NULL, gDummySpriteAffineAnimTable, sub_80A22E8

gAnimCmd_83E29D8:: @ 83E29D8
	obj_image_anim_frame 0, 1
	obj_image_anim_end

gAnimCmd_83E29E0:: @ 83E29E0
	obj_image_anim_frame 1, 1
	obj_image_anim_end

gAnimCmd_83E29E8:: @ 83E29E8
	obj_image_anim_frame 2, 1
	obj_image_anim_end

gAnimCmd_83E29F0:: @ 83E29F0
	obj_image_anim_frame 3, 1
	obj_image_anim_end

gAnimCmd_83E29F8:: @ 83E29F8
	obj_image_anim_frame 4, 1
	obj_image_anim_end

gAnimCmd_83E2A00:: @ 83E2A00
	obj_image_anim_frame 5, 1
	obj_image_anim_end

gAnimCmd_83E2A08:: @ 83E2A08
	obj_image_anim_frame 6, 1
	obj_image_anim_end

gAnimCmd_83E2A10:: @ 83E2A10
	obj_image_anim_frame 7, 1
	obj_image_anim_end

gAnimCmd_83E2A18:: @ 83E2A18
	obj_image_anim_frame 8, 1
	obj_image_anim_end

gSpriteAnimTable_83E2A20:: @ 83E2A20
	.4byte gAnimCmd_83E29D8
	.4byte gAnimCmd_83E29E0
	.4byte gAnimCmd_83E29E8
	.4byte gAnimCmd_83E29F0
	.4byte gAnimCmd_83E29F8
	.4byte gAnimCmd_83E2A00
	.4byte gAnimCmd_83E2A08

gSpriteAnimTable_83E2A3C:: @ 83E2A3C
	.4byte gAnimCmd_83E2A10

gSpriteAnimTable_83E2A40:: @ 83E2A40
	.4byte gAnimCmd_83E2A18

gAffineAnimCmd_83E2A44:: @ 83E2A44
	obj_rot_scal_anim_frame -5, -5, 0, 1
	obj_rot_scal_anim_jump 0

gSpriteAffineAnimTable_83E2A54:: @ 83E2A54
	.4byte gAffineAnimCmd_83E2A44

gUnknown_83E2A58:: @ 83E2A58
	spr_template 10147, 10147, gOamData_83ACB50, gSpriteAnimTable_83E2A40, NULL, gSpriteAffineAnimTable_83E2A54, sub_80A2388

gUnknown_83E2A70:: @ 83E2A70
	spr_template 10147, 10147, gOamData_83AC9C8, gSpriteAnimTable_83E2A20, NULL, gDummySpriteAffineAnimTable, sub_80A23D8

gUnknown_83E2A88:: @ 83E2A88
	spr_template 10147, 10147, gOamData_83AC9C8, gSpriteAnimTable_83E2A3C, NULL, gDummySpriteAffineAnimTable, sub_80A2430

gUnknown_83E2AA0:: @ 83E2AA0
	obj_rot_scal_anim_frame 320, 320, 0, 0
	obj_rot_scal_anim_frame -14, -14, 0, 1
	obj_rot_scal_anim_jump 1

gUnknown_83E2AB8:: @ 83E2AB8
	.4byte gUnknown_83E2AA0

gUnknown_83E2ABC:: @ 83E2ABC
	spr_template 10235, 10235, gOamData_83ACA88, gDummySpriteAnimTable, NULL, gUnknown_83E2AB8, sub_80A2388

gUnknown_83E2AD4:: @ 83E2AD4
	obj_rot_scal_anim_frame -5, -5, 0, 1
	obj_rot_scal_anim_jump 0

gUnknown_83E2AE4:: @ 83E2AE4
	.4byte gUnknown_83E2AD4

gUnknown_83E2AE8:: @ 83E2AE8
	spr_template 10147, 10147, gOamData_83ACB50, gSpriteAnimTable_83E2A40, NULL, gUnknown_83E2AE4, sub_80A2580

gUnknown_83E2B00:: @ 83E2B00
	spr_template 10147, 10147, gOamData_83AC9C8, gSpriteAnimTable_83E2A20, NULL, gDummySpriteAffineAnimTable, sub_80A25EC

gUnknown_83E2B18:: @ 83E2B18
	.incbin "baserom.gba", 0x3E2B18, 0x14

gUnknown_83E2B2C:: @ 83E2B2C
	.incbin "baserom.gba", 0x3E2B2C, 0x8

gUnknown_83E2B34:: @ 83E2B34
	spr_template 10006, 10006, gOamData_83AC9D0, gUnknown_83E2B2C, NULL, gDummySpriteAffineAnimTable, sub_80A26F0

gUnknown_83E2B4C:: @ 83E2B4C
	.incbin "baserom.gba", 0x3E2B4C, 0x10

gUnknown_83E2B5C:: @ 83E2B5C
	.incbin "baserom.gba", 0x3E2B5C, 0x8

gUnknown_83E2B64:: @ 83E2B64
	spr_template 10158, 10158, gOamData_83AC9D0, gUnknown_83E2B5C, NULL, gDummySpriteAffineAnimTable, sub_80A27D0

gUnknown_83E2B7C:: @ 83E2B7C
	.incbin "baserom.gba", 0x3E2B7C, 0x10

gUnknown_83E2B8C:: @ 83E2B8C
	.incbin "baserom.gba", 0x3E2B8C, 0x4

gUnknown_83E2B90:: @ 83E2B90
	.incbin "baserom.gba", 0x3E2B90, 0x4

gUnknown_83E2B94:: @ 83E2B94
	spr_template 10159, 10159, gOamData_83AC9D0, gUnknown_83E2B8C, NULL, gDummySpriteAffineAnimTable, sub_80A2920

gUnknown_83E2BAC:: @ 83E2BAC
	spr_template 10159, 10159, gOamData_83AC9C8, gUnknown_83E2B90, NULL, gDummySpriteAffineAnimTable, sub_80A29EC

gUnknown_83E2BC4:: @ 83E2BC4
	.incbin "baserom.gba", 0x3E2BC4, 0x3C

gUnknown_83E2C00:: @ 83E2C00
	.incbin "baserom.gba", 0x3E2C00, 0x8

gUnknown_83E2C08:: @ 83E2C08
	spr_template 10063, 10063, gOamData_83AC9D0, gUnknown_83E2C00, NULL, gDummySpriteAffineAnimTable, sub_80A2AA4

gUnknown_83E2C20:: @ 83E2C20
	spr_template 10063, 10063, gOamData_83AC9D0, gUnknown_83E2C00, NULL, gDummySpriteAffineAnimTable, AnimMoveTwisterParticle

gUnknown_83E2C38:: @ 83E2C38
	.incbin "baserom.gba", 0x3E2C38, 0x14

gUnknown_83E2C4C:: @ 83E2C4C
	.incbin "baserom.gba", 0x3E2C4C, 0x4

gUnknown_83E2C50:: @ 83E2C50
	spr_template 10160, 10160, gOamData_83AC9F8, gUnknown_83E2C4C, NULL, gDummySpriteAffineAnimTable, sub_80A2B9C

gUnknown_83E2C68:: @ 83E2C68
	.incbin "baserom.gba", 0x3E2C68, 0x10

gUnknown_83E2C78:: @ 83E2C78
	.incbin "baserom.gba", 0x3E2C78, 0x4

gUnknown_83E2C7C:: @ 83E2C7C
	spr_template 10174, 10174, gOamData_83ACA38, gDummySpriteAnimTable, NULL, gUnknown_83E2C78, sub_80A2B9C

gUnknown_83E2C94:: @ 83E2C94
	.incbin "baserom.gba", 0x3E2C94, 0x28

gUnknown_83E2CBC:: @ 83E2CBC
	.incbin "baserom.gba", 0x3E2CBC, 0x48

gUnknown_83E2D04:: @ 83E2D04
	.incbin "baserom.gba", 0x3E2D04, 0x8

gUnknown_83E2D0C:: @ 83E2D0C
	spr_template 10186, 10186, gOamData_83ACA60, gUnknown_83E2CBC, NULL, gUnknown_83E2D04, sub_80A2E28

gUnknown_83E2D24:: @ 83E2D24
	.incbin "baserom.gba", 0x3E2D24, 0x28

gUnknown_83E2D4C:: @ 83E2D4C
	.incbin "baserom.gba", 0x3E2D4C, 0x8

gUnknown_83E2D54:: @ 83E2D54
	spr_template 10147, 10147, gOamData_83ACA90, gSpriteAnimTable_83E2A40, NULL, gUnknown_83E2D4C, sub_80A3098

gUnknown_83E2D6C:: @ 83E2D6C
	.incbin "baserom.gba", 0x3E2D6C, 0x48

gUnknown_83E2DB4:: @ 83E2DB4
	.incbin "baserom.gba", 0x3E2DB4, 0x10

gUnknown_83E2DC4:: @ 83E2DC4
	spr_template 10223, 10223, gOamData_83AC9D8, gUnknown_83E2DB4, NULL, gDummySpriteAffineAnimTable, sub_80A3168

gUnknown_83E2DDC:: @ 83E2DDC
	spr_template 10223, 10223, gOamData_83AC9D8, gUnknown_83E2DB4, NULL, gDummySpriteAffineAnimTable, sub_80A31EC

gUnknown_83E2DF4:: @ 83E2DF4
	.incbin "baserom.gba", 0x3E2DF4, 0xC

gUnknown_83E2E00:: @ 83E2E00
	.incbin "baserom.gba", 0x3E2E00, 0x4

gUnknown_83E2E04:: @ 83E2E04
	spr_template 10147, 10147, gOamData_83AC9C8, gUnknown_83E2E00, NULL, gDummySpriteAffineAnimTable, sub_80A3334

gUnknown_83E2E1C:: @ 83E2E1C
	.incbin "baserom.gba", 0x3E2E1C, 0x8

gUnknown_83E2E24:: @ 83E2E24
	.incbin "baserom.gba", 0x3E2E24, 0x5C

gUnknown_83E2E80:: @ 83E2E80
	.incbin "baserom.gba", 0x3E2E80, 0x8

gUnknown_83E2E88:: @ 83E2E88
	spr_template 10224, 10224, gOamData_83ACA38, gUnknown_83E2E24, NULL, gUnknown_83E2E80, sub_80A3518

gUnknown_83E2EA0:: @ 83E2EA0
	spr_template 10224, 10224, gOamData_83ACA38, gUnknown_83E2E24, NULL, gUnknown_83E2E80, sub_80A35F4

gUnknown_83E2EB8:: @ 83E2EB8
	.incbin "baserom.gba", 0x3E2EB8, 0x14

gUnknown_83E2ECC:: @ 83E2ECC
	.incbin "baserom.gba", 0x3E2ECC, 0x4

gUnknown_83E2ED0:: @ 83E2ED0
	spr_template 10195, 10195, gOamData_83AC9D0, gUnknown_83E2ECC, NULL, gDummySpriteAffineAnimTable, sub_80A3670

gUnknown_83E2EE8:: @ 83E2EE8
	spr_template 10224, 10224, gOamData_83ACA38, gUnknown_83E2E24, NULL, gUnknown_83E2E80, sub_80A36B4

gUnknown_83E2F00:: @ 83E2F00
	.incbin "baserom.gba", 0x3E2F00, 0x50

gUnknown_83E2F50:: @ 83E2F50
	.incbin "baserom.gba", 0x3E2F50, 0x10

gUnknown_83E2F60:: @ 83E2F60
	spr_template 10224, 10224, gOamData_83ACA38, gUnknown_83E2E24, NULL, gUnknown_83E2F50, sub_80A37BC

gUnknown_83E2F78:: @ 83E2F78
	.incbin "baserom.gba", 0x3E2F78, 0x5C

gUnknown_83E2FD4:: @ 83E2FD4
	.incbin "baserom.gba", 0x3E2FD4, 0x1C

gUnknown_83E2FF0:: @ 83E2FF0
	spr_template 10063, 10063, gOamData_83AC9D0, gUnknown_83E2FD4, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_83E3008:: @ 83E3008
	.incbin "baserom.gba", 0x3E3008, 0x18

gUnknown_83E3020:: @ 83E3020
	.incbin "baserom.gba", 0x3E3020, 0x4

gUnknown_83E3024:: @ 83E3024
	spr_template 10159, 10159, gOamData_83AC9C8, gUnknown_83E2B90, NULL, gDummySpriteAffineAnimTable, sub_80A4040

gUnknown_83E303C:: @ 83E303C
	spr_template 10159, 10159, gOamData_83ACA30, gUnknown_83E2B8C, NULL, gUnknown_83E3020, sub_80A4040

gUnknown_83E3054:: @ 83E3054
	.incbin "baserom.gba", 0x3E3054, 0x48

gUnknown_83E309C:: @ 83E309C
	.incbin "baserom.gba", 0x3E309C, 0x4

gUnknown_83E30A0:: @ 83E30A0
	.incbin "baserom.gba", 0x3E30A0, 0x4

gUnknown_83E30A4:: @ 83E30A4
	.incbin "baserom.gba", 0x3E30A4, 0x4

gUnknown_83E30A8:: @ 83E30A8
	spr_template 10271, 10271, gOamData_83ACA30, gDummySpriteAnimTable, NULL, gUnknown_83E309C, sub_80A4040

gUnknown_83E30C0:: @ 83E30C0
	spr_template 10271, 10271, gOamData_83ACA30, gDummySpriteAnimTable, NULL, gUnknown_83E30A0, sub_80A4040

gUnknown_83E30D8:: @ 83E30D8
	spr_template 10271, 10271, gOamData_83ACA30, gDummySpriteAnimTable, NULL, gUnknown_83E30A4, sub_80A4040

gUnknown_83E30F0:: @ 83E30F0
	.incbin "baserom.gba", 0x3E30F0, 0x10

gUnknown_83E3100:: @ 83E3100
	spr_template 10266, 10266, gOamData_83ACA30, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A4298

gUnknown_83E3118:: @ 83E3118
	.incbin "baserom.gba", 0x3E3118, 0x28

gUnknown_83E3140:: @ 83E3140
	.incbin "baserom.gba", 0x3E3140, 0x8

gUnknown_83E3148:: @ 83E3148
	spr_template 10056, 10056, gOamData_83AC9D8, gUnknown_83E3140, NULL, gDummySpriteAffineAnimTable, sub_80A4450

gUnknown_83E3160:: @ 83E3160
	spr_template 10287, 10287, gOamData_83AC9D8, gUnknown_83E3140, NULL, gDummySpriteAffineAnimTable, sub_80A4450

gUnknown_83E3178:: @ 83E3178
	.incbin "baserom.gba", 0x3E3178, 0x118

gUnknown_83E3290:: @ 83E3290
	.incbin "baserom.gba", 0x3E3290, 0x4

gUnknown_83E3294:: @ 83E3294
	spr_template 10138, 10138, gOamData_83ACAF8, gUnknown_83E3290, NULL, gDummySpriteAffineAnimTable, sub_80A44E0

gUnknown_83E32AC:: @ 83E32AC
	spr_template 10138, 10138, gOamData_83ACAF8, gUnknown_83E3290, NULL, gDummySpriteAffineAnimTable, sub_80A4588

gUnknown_83E32C4:: @ 83E32C4
	.incbin "baserom.gba", 0x3E32C4, 0x90

gUnknown_83E3354:: @ 83E3354
	spr_template 10280, 10280, gOamData_83ACB00, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A48F0

gUnknown_83E336C:: @ 83E336C
	.incbin "baserom.gba", 0x3E336C, 0x40

gUnknown_83E33AC:: @ 83E33AC
	.incbin "baserom.gba", 0x3E33AC, 0x8

gUnknown_83E33B4:: @ 83E33B4
	spr_template 10099, 10099, gOamData_83ACB58, gDummySpriteAnimTable, NULL, gUnknown_83E33AC, sub_80A4ACC

gUnknown_83E33CC:: @ 83E33CC
	.incbin "baserom.gba", 0x3E33CC, 0x24

gUnknown_83E33F0:: @ 83E33F0
	.incbin "baserom.gba", 0x3E33F0, 0x4

gUnknown_83E33F4:: @ 83E33F4
	spr_template 10049, 10049, gOamData_83AC9D8, gUnknown_83E33F0, NULL, gDummySpriteAffineAnimTable, sub_80A4D0C

gUnknown_83E340C:: @ 83E340C
	spr_template 10049, 10049, gOamData_83AC9D8, gUnknown_83E33F0, NULL, gDummySpriteAffineAnimTable, sub_80A4D5C

gUnknown_83E3424:: @ 83E3424
	.incbin "baserom.gba", 0x3E3424, 0x70

gUnknown_83E3494:: @ 83E3494
	.incbin "baserom.gba", 0x3E3494, 0x64

gUnknown_83E34F8:: @ 83E34F8
	.incbin "baserom.gba", 0x3E34F8, 0x8

gUnknown_83E3500:: @ 83E3500
	spr_template 10228, 10228, gOamData_83ACA38, gUnknown_83E3494, NULL, gUnknown_83E34F8, sub_80A4EF4

gUnknown_83E3518:: @ 83E3518
	spr_template 10014, 10014, gOamData_83AC9D8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A4FAC

gUnknown_83E3530:: @ 83E3530
	spr_template 10014, 10014, gOamData_83AC9D0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A5298

gUnknown_83E3548:: @ 83E3548
	.incbin "baserom.gba", 0x3E3548, 0x8

gUnknown_83E3550:: @ 83E3550
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A5340
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A5590

gUnknown_83E3580:: @ 83E3580
	.incbin "baserom.gba", 0x3E3580, 0x1C

gUnknown_83E359C:: @ 83E359C
	.incbin "baserom.gba", 0x3E359C, 0x8

gUnknown_83E35A4:: @ 83E35A4
	spr_template 10183, 10183, gOamData_83AC9D8, gUnknown_83E359C, NULL, gDummySpriteAffineAnimTable, sub_80A5940

gUnknown_83E35BC:: @ 83E35BC
	spr_template 10286, 10286, gOamData_83AC9D8, gUnknown_83E359C, NULL, gDummySpriteAffineAnimTable, sub_80A59A8

gUnknown_83E35D4:: @ 83E35D4
	spr_template 10286, 10286, gOamData_83AC9D8, gUnknown_83E359C, NULL, gDummySpriteAffineAnimTable, sub_80A59F0

gUnknown_83E35EC:: @ 83E35EC
	.incbin "baserom.gba", 0x3E35EC, 0x14

gUnknown_83E3600:: @ 83E3600
	.incbin "baserom.gba", 0x3E3600, 0x4

gUnknown_83E3604:: @ 83E3604
	spr_template 10184, 10184, gOamData_83ACA18, gUnknown_83E3600, NULL, gDummySpriteAffineAnimTable, sub_80A5AD8

gUnknown_83E361C:: @ 83E361C
	.incbin "baserom.gba", 0x3E361C, 0x3C

gUnknown_83E3658:: @ 83E3658
	.incbin "baserom.gba", 0x3E3658, 0x4

gUnknown_83E365C:: @ 83E365C
	spr_template 10185, 10185, gOamData_83AC9D8, gUnknown_83E3658, NULL, gDummySpriteAffineAnimTable, sub_80A5B7C

gUnknown_83E3674:: @ 83E3674
	spr_template 10017, 10017, gOamData_83AC9C8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, TranslateAnimSpriteToTargetMonLocation

gUnknown_83E368C:: @ 83E368C
	.incbin "baserom.gba", 0x3E368C, 0x18

gUnknown_83E36A4:: @ 83E36A4
	.incbin "baserom.gba", 0x3E36A4, 0x4

gUnknown_83E36A8:: @ 83E36A8
	spr_template 10030, 10030, gOamData_83AC9D8, gUnknown_83E36A4, NULL, gDummySpriteAffineAnimTable, AnimSpriteOnMonPos

gUnknown_83E36C0:: @ 83E36C0
	.incbin "baserom.gba", 0x3E36C0, 0x14

gUnknown_83E36D4:: @ 83E36D4
	.incbin "baserom.gba", 0x3E36D4, 0x14

gUnknown_83E36E8:: @ 83E36E8
	.incbin "baserom.gba", 0x3E36E8, 0x4

gUnknown_83E36EC:: @ 83E36EC
	spr_template 10018, 10018, gOamData_83ACBA8, gUnknown_83E36D4, NULL, gUnknown_83E36E8, sub_80A5C68

gUnknown_83E3704:: @ 83E3704
	.incbin "baserom.gba", 0x3E3704, 0x14

gUnknown_83E3718:: @ 83E3718
	.incbin "baserom.gba", 0x3E3718, 0x4

gUnknown_83E371C:: @ 83E371C
	spr_template 10018, 10018, gOamData_83ACBA8, gUnknown_83E3718, NULL, gUnknown_83E36E8, sub_80A5D4C

gUnknown_83E3734:: @ 83E3734
	spr_template 10194, 10194, gOamData_83ACB00, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A5EE0

gUnknown_83E374C:: @ 83E374C
	.incbin "baserom.gba", 0x3E374C, 0x14

gUnknown_83E3760:: @ 83E3760
	.incbin "baserom.gba", 0x3E3760, 0x4

gUnknown_83E3764:: @ 83E3764
	spr_template 10195, 10195, gOamData_83AC9D0, gUnknown_83E3760, NULL, gDummySpriteAffineAnimTable, sub_80A5F40

gUnknown_83E377C:: @ 83E377C
	.incbin "baserom.gba", 0x3E377C, 0x24

gUnknown_83E37A0:: @ 83E37A0
	.incbin "baserom.gba", 0x3E37A0, 0x4

gUnknown_83E37A4:: @ 83E37A4
	spr_template 10031, 10031, gOamData_83AC9D8, gUnknown_83E37A0, NULL, gDummySpriteAffineAnimTable, AnimSpriteOnMonPos

gUnknown_83E37BC:: @ 83E37BC
	spr_template 10020, 10020, gOamData_83AC9D8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A6244

gUnknown_83E37D4:: @ 83E37D4
	.incbin "baserom.gba", 0x3E37D4, 0x14

gUnknown_83E37E8:: @ 83E37E8
	.incbin "baserom.gba", 0x3E37E8, 0x4

gUnknown_83E37EC:: @ 83E37EC
	spr_template 10192, 10192, gOamData_83AC9D8, gUnknown_83E37E8, NULL, gDummySpriteAffineAnimTable, sub_80A65CC

gUnknown_83E3804:: @ 83E3804
	.incbin "baserom.gba", 0x3E3804, 0x8

gOamData_83E380C::
	.incbin "baserom.gba", 0x3E380C, 0x8

gUnknown_83E3814:: @ 83E3814
	.incbin "baserom.gba", 0x3E3814, 0x8

gUnknown_83E381C:: @ 83E381C
	.incbin "baserom.gba", 0x3E381C, 0x8

gUnknown_83E3824:: @ 83E3824
	.incbin "baserom.gba", 0x3E3824, 0x8

gUnknown_83E382C:: @ 83E382C
	.incbin "baserom.gba", 0x3E382C, 0x18

gUnknown_83E3844:: @ 83E3844
	spr_template 14340, 2110, gOamData_83E380C, gUnknown_83E3814, gUnknown_83E381C, gUnknown_83E3824, gUnknown_83E382C

gUnknown_83E385C:: @ 83E385C
	.incbin "baserom.gba", 0x3E385C, 0x20

gUnknown_83E387C:: @ 83E387C
	.incbin "baserom.gba", 0x3E387C, 0x4

gUnknown_83E3880:: @ 83E3880
	spr_template 10072, 10072, gOamData_83ACA90, gUnknown_83E3844, NULL, gUnknown_83E387C, sub_80A66D4

gUnknown_83E3898:: @ 83E3898
	.incbin "baserom.gba", 0x3E3898, 0x30

gUnknown_83E38C8:: @ 83E38C8
	spr_template 10072, 10072, gOamData_83ACA90, gUnknown_83E3844, NULL, gUnknown_83E387C, sub_80A68B0

gUnknown_83E38E0:: @ 83E38E0
	spr_template 10193, 10193, gOamData_83AC9D8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A69B8

gUnknown_83E38F8:: @ 83E38F8
	.incbin "baserom.gba", 0x3E38F8, 0x18

gUnknown_83E3910:: @ 83E3910
	.incbin "baserom.gba", 0x3E3910, 0x4

gUnknown_83E3914:: @ 83E3914
	spr_template 10072, 10072, gOamData_83ACA90, gUnknown_83E3844, NULL, gUnknown_83E3910, sub_80A6A28

gUnknown_83E392C:: @ 83E392C
	.incbin "baserom.gba", 0x3E392C, 0x50

gUnknown_83E397C:: @ 83E397C
	.incbin "baserom.gba", 0x3E397C, 0x10

gUnknown_83E398C:: @ 83E398C
	spr_template 10209, 10209, gOamData_83AC9D8, gUnknown_83E397C, NULL, gDummySpriteAffineAnimTable, sub_80A6B64

gUnknown_83E39A4:: @ 83E39A4
	.incbin "baserom.gba", 0x3E39A4, 0x88

gUnknown_83E3A2C:: @ 83E3A2C
	.incbin "baserom.gba", 0x3E3A2C, 0x8

gUnknown_83E3A34:: @ 83E3A34
	spr_template 10064, 10064, gOamData_83ACA98, gDummySpriteAnimTable, NULL, gUnknown_83E3A2C, sub_80A6C08

gUnknown_83E3A4C:: @ 83E3A4C
	spr_template 10064, 10064, gOamData_83ACA38, gDummySpriteAnimTable, NULL, gUnknown_83E3A2C, sub_80A6C84

gUnknown_83E3A64:: @ 83E3A64
	.incbin "baserom.gba", 0x3E3A64, 0x50

gUnknown_83E3AB4:: @ 83E3AB4
	.incbin "baserom.gba", 0x3E3AB4, 0x10

gUnknown_83E3AC4:: @ 83E3AC4
	spr_template 10214, 10214, gOamData_83AC9D8, gUnknown_83E3AB4, NULL, gDummySpriteAffineAnimTable, sub_80A6D90
	spr_template 10064, 10064, gOamData_83AC9D8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A6E48

gUnknown_83E3AF4:: @ 83E3AF4
	.incbin "baserom.gba", 0x3E3AF4, 0xC4

gUnknown_83E3BB8:: @ 83E3BB8
	.incbin "baserom.gba", 0x3E3BB8, 0x4

gUnknown_83E3BBC:: @ 83E3BBC
	spr_template 10075, 10075, gOamData_83AC9F8, gUnknown_83E3BB8, NULL, gDummySpriteAffineAnimTable, sub_80A71D8

gUnknown_83E3BD4:: @ 83E3BD4
	.incbin "baserom.gba", 0x3E3BD4, 0x20

gUnknown_83E3BF4:: @ 83E3BF4
	.incbin "baserom.gba", 0x3E3BF4, 0x4

gUnknown_83E3BF8:: @ 83E3BF8
	spr_template 10005, 10005, gOamData_83ACBA0, gDummySpriteAnimTable, NULL, gUnknown_83E3BF4, sub_80A727C

gUnknown_83E3C10:: @ 83E3C10
	spr_template 10003, 10003, gOamData_83ACBD8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A72C8

gUnknown_83E3C28:: @ 83E3C28
	spr_template 10003, 10003, gOamData_83ACB18, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A74A4

gUnknown_83E3C40:: @ 83E3C40
	.incbin "baserom.gba", 0x3E3C40, 0x58

gUnknown_83E3C98:: @ 83E3C98
	.incbin "baserom.gba", 0x3E3C98, 0x4

gUnknown_83E3C9C:: @ 83E3C9C
	.incbin "baserom.gba", 0x3E3C9C, 0x4

gUnknown_83E3CA0:: @ 83E3CA0
	spr_template 10163, 10163, gOamData_83ACAD8, gDummySpriteAnimTable, NULL, gUnknown_83E3C98, TranslateAnimSpriteToTargetMonLocation

gUnknown_83E3CB8:: @ 83E3CB8
	spr_template 10164, 10164, gOamData_83ACAD8, gDummySpriteAnimTable, NULL, gUnknown_83E3C98, TranslateAnimSpriteToTargetMonLocation

gUnknown_83E3CD0:: @ 83E3CD0
	spr_template 10260, 10260, gOamData_83ACAE0, gDummySpriteAnimTable, NULL, gUnknown_83E3C98, TranslateAnimSpriteToTargetMonLocation

gUnknown_83E3CE8:: @ 83E3CE8
	spr_template 10288, 10288, gOamData_83ACAD8, gDummySpriteAnimTable, NULL, gUnknown_83E3C9C, sub_80AC6D8

gUnknown_83E3D00:: @ 83E3D00
	spr_template 10175, 10175, gOamData_83AC9D0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, AnimThrowProjectile

gUnknown_83E3D18:: @ 83E3D18
	spr_template 10178, 10178, gOamData_83ACB00, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A79E8

gUnknown_83E3D30:: @ 83E3D30
	.incbin "baserom.gba", 0x3E3D30, 0x8

gUnknown_83E3D38:: @ 83E3D38
	.incbin "baserom.gba", 0x3E3D38, 0x14

gUnknown_83E3D4C:: @ 83E3D4C
	.incbin "baserom.gba", 0x3E3D4C, 0x4

gUnknown_83E3D50:: @ 83E3D50
	spr_template 10100, 10100, gOamData_83ACA30, gUnknown_83E3D38, NULL, gDummySpriteAffineAnimTable, sub_80A7A88

gUnknown_83E3D68:: @ 83E3D68
	spr_template 10100, 10100, gOamData_83ACA30, gUnknown_83E3D38, NULL, gUnknown_83E3D4C, sub_80A7B3C

gUnknown_83E3D80:: @ 83E3D80
	.incbin "baserom.gba", 0x3E3D80, 0x10

gUnknown_83E3D90:: @ 83E3D90
	.incbin "baserom.gba", 0x3E3D90, 0x4

gUnknown_83E3D94:: @ 83E3D94
	spr_template 10006, 10006, gOamData_83ACA30, gDummySpriteAnimTable, NULL, gUnknown_83E3D90, sub_80A7BC4

gUnknown_83E3DAC:: @ 83E3DAC
	.incbin "baserom.gba", 0x3E3DAC, 0x18

gUnknown_83E3DC4:: @ 83E3DC4
	.incbin "baserom.gba", 0x3E3DC4, 0x4

gUnknown_83E3DC8:: @ 83E3DC8
	spr_template 10009, 10009, gOamData_83ACA80, gDummySpriteAnimTable, NULL, gUnknown_83E3DC4, sub_80A7D04

gUnknown_83E3DE0:: @ 83E3DE0
	.incbin "baserom.gba", 0x3E3DE0, 0x20

gUnknown_83E3E00:: @ 83E3E00
	.incbin "baserom.gba", 0x3E3E00, 0x8

gUnknown_83E3E08:: @ 83E3E08
	spr_template 10138, 10138, gOamData_83ACAF8, gUnknown_83E3E00, NULL, gDummySpriteAffineAnimTable, sub_80A7D64

gUnknown_83E3E20:: @ 83E3E20
	.incbin "baserom.gba", 0x3E3E20, 0x20

gUnknown_83E3E40:: @ 83E3E40
	.incbin "baserom.gba", 0x3E3E40, 0x8

gUnknown_83E3E48:: @ 83E3E48
	spr_template 10138, 10138, gOamData_83ACAF8, gUnknown_83E3E40, NULL, gDummySpriteAffineAnimTable, sub_80A7E14

gUnknown_83E3E60:: @ 83E3E60
	.incbin "baserom.gba", 0x3E3E60, 0x20

gUnknown_83E3E80:: @ 83E3E80
	.incbin "baserom.gba", 0x3E3E80, 0x48

gUnknown_83E3EC8:: @ 83E3EC8
	.incbin "baserom.gba", 0x3E3EC8, 0x8

gUnknown_83E3ED0:: @ 83E3ED0
	spr_template 10086, 10086, gOamData_83AC9D0, gUnknown_83E3EC8, NULL, gDummySpriteAffineAnimTable, sub_80A851C

gUnknown_83E3EE8:: @ 83E3EE8
	.incbin "baserom.gba", 0x3E3EE8, 0x18

gUnknown_83E3F00:: @ 83E3F00
	.incbin "baserom.gba", 0x3E3F00, 0x4

gUnknown_83E3F04:: @ 83E3F04
	spr_template 10087, 10087, gOamData_83ACA30, gDummySpriteAnimTable, NULL, gUnknown_83E3F00, sub_80A85AC

gUnknown_83E3F1C:: @ 83E3F1C
	.incbin "baserom.gba", 0x3E3F1C, 0x30

gUnknown_83E3F4C:: @ 83E3F4C
	spr_template 10002, 10002, gOamData_83AC9D8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A8A1C

gUnknown_83E3F64:: @ 83E3F64
	spr_template 10197, 10197, gOamData_83AC9D8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8075F0C

gUnknown_83E3F7C:: @ 83E3F7C
	.incbin "baserom.gba", 0x3E3F7C, 0x14

gUnknown_83E3F90:: @ 83E3F90
	.incbin "baserom.gba", 0x3E3F90, 0x4

gUnknown_83E3F94:: @ 83E3F94
	spr_template 10198, 10198, gOamData_83AC9D8, gUnknown_83E3F90, NULL, gDummySpriteAffineAnimTable, AnimSpriteOnMonPos

gUnknown_83E3FAC:: @ 83E3FAC
	.incbin "baserom.gba", 0x3E3FAC, 0x70

gUnknown_83E401C:: @ 83E401C
	.incbin "baserom.gba", 0x3E401C, 0xC

gUnknown_83E4028:: @ 83E4028
	spr_template 10202, 10202, gOamData_83ACBB8, gDummySpriteAnimTable, NULL, gUnknown_83E401C, sub_80A8F38

gUnknown_83E4040:: @ 83E4040
	.incbin "baserom.gba", 0x3E4040, 0x48

gUnknown_83E4088:: @ 83E4088
	.incbin "baserom.gba", 0x3E4088, 0x8

gUnknown_83E4090:: @ 83E4090
	.incbin "baserom.gba", 0x3E4090, 0x4

gUnknown_83E4094:: @ 83E4094
	spr_template 10203, 10203, gOamData_83ACAA0, gDummySpriteAnimTable, NULL, gUnknown_83E4088, AnimSpriteOnMonPos

gUnknown_83E40AC:: @ 83E40AC
	.incbin "baserom.gba", 0x3E40AC, 0x18

gUnknown_83E40C4:: @ 83E40C4
	.incbin "baserom.gba", 0x3E40C4, 0x4

gUnknown_83E40C8:: @ 83E40C8
	spr_template 10203, 10203, gOamData_83ACBC0, gDummySpriteAnimTable, NULL, gUnknown_83E40C4, AnimSpriteOnMonPos

gUnknown_83E40E0:: @ 83E40E0
	spr_template 10203, 10203, gOamData_83ACBC0, gDummySpriteAnimTable, NULL, gUnknown_83E4088, sub_80A8BC4

gUnknown_83E40F8:: @ 83E40F8
	spr_template 10203, 10203, gOamData_83ACBC0, gDummySpriteAnimTable, NULL, gUnknown_83E4090, sub_80A8CA4

gUnknown_83E4110:: @ 83E4110
	spr_template 10203, 10203, gOamData_83ACBC0, gDummySpriteAnimTable, NULL, gUnknown_83E4088, sub_80A8EE8

gUnknown_83E4128:: @ 83E4128
	.incbin "baserom.gba", 0x3E4128, 0x28

gUnknown_83E4150:: @ 83E4150
	.incbin "baserom.gba", 0x3E4150, 0x4

gUnknown_83E4154:: @ 83E4154
	spr_template 10207, 10207, gOamData_83AC9D0, gUnknown_83E4150, NULL, gDummySpriteAffineAnimTable, sub_80A9648

gUnknown_83E416C:: @ 83E416C
	.incbin "baserom.gba", 0x3E416C, 0x40

gUnknown_83E41AC:: @ 83E41AC
	.incbin "baserom.gba", 0x3E41AC, 0x4

gUnknown_83E41B0:: @ 83E41B0
	spr_template 10205, 10205, gOamData_83AC9D8, gUnknown_83E41AC, NULL, gDummySpriteAffineAnimTable, AnimSpriteOnMonPos

gUnknown_83E41C8:: @ 83E41C8
	.incbin "baserom.gba", 0x3E41C8, 0x8

gUnknown_83E41D0:: @ 83E41D0
	spr_template 10206, 10206, gOamData_83AC9D0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A97E8

gUnknown_83E41E8:: @ 83E41E8
	spr_template 10210, 10210, gOamData_83AC9D0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A9860

gUnknown_83E4200:: @ 83E4200
	.incbin "baserom.gba", 0x3E4200, 0x18

gUnknown_83E4218:: @ 83E4218
	spr_template 10216, 10216, gOamData_83AC9D0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A9B40

gUnknown_83E4230:: @ 83E4230
	spr_template 10216, 10216, gOamData_83AC9D0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A9BC4

gUnknown_83E4248:: @ 83E4248
	spr_template 10216, 10216, gOamData_83AC9D0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A9C4C

gUnknown_83E4260:: @ 83E4260
	.incbin "baserom.gba", 0x3E4260, 0x18

gUnknown_83E4278:: @ 83E4278
	.incbin "baserom.gba", 0x3E4278, 0x4

gUnknown_83E427C:: @ 83E427C
	spr_template 10217, 10217, gOamData_83ACA30, gDummySpriteAnimTable, NULL, gUnknown_83E4278, sub_80AA174

gUnknown_83E4294:: @ 83E4294
	spr_template 10217, 10217, gOamData_83ACA90, gDummySpriteAnimTable, NULL, gUnknown_83E4278, sub_80AA2B0

gUnknown_83E42AC:: @ 83E42AC
	.incbin "baserom.gba", 0x3E42AC, 0x18

gUnknown_83E42C4:: @ 83E42C4
	.incbin "baserom.gba", 0x3E42C4, 0x4

gUnknown_83E42C8:: @ 83E42C8
	spr_template 10237, 10237, gOamData_83ACA88, gDummySpriteAnimTable, NULL, gUnknown_83E42C4, sub_80AA37C

gUnknown_83E42E0:: @ 83E42E0
	.incbin "baserom.gba", 0x3E42E0, 0x18

gUnknown_83E42F8:: @ 83E42F8
	.incbin "baserom.gba", 0x3E42F8, 0x4

gUnknown_83E42FC:: @ 83E42FC
	spr_template 10218, 10218, gOamData_83AC9D0, gUnknown_83E42F8, NULL, gDummySpriteAffineAnimTable, sub_80AA3F0

gUnknown_83E4314:: @ 83E4314
	.incbin "baserom.gba", 0x3E4314, 0x8

gUnknown_83E431C:: @ 83E431C
	.incbin "baserom.gba", 0x3E431C, 0x4

gUnknown_83E4320:: @ 83E4320
	spr_template 10220, 10220, gOamData_83AC9D8, gUnknown_83E431C, NULL, gDummySpriteAffineAnimTable, sub_80AA408

gUnknown_83E4338:: @ 83E4338
	spr_template 10219, 10219, gOamData_83AC9D0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80AA508

gUnknown_83E4350:: @ 83E4350
	.incbin "baserom.gba", 0x3E4350, 0x10

gUnknown_83E4360:: @ 83E4360
	.incbin "baserom.gba", 0x3E4360, 0x8

gUnknown_83E4368:: @ 83E4368
	spr_template 10221, 10221, gOamData_83AC9D8, gUnknown_83E4360, NULL, gDummySpriteAffineAnimTable, sub_80AA58C

gUnknown_83E4380:: @ 83E4380
	.incbin "baserom.gba", 0x3E4380, 0x28

gUnknown_83E43A8:: @ 83E43A8
	.incbin "baserom.gba", 0x3E43A8, 0x8

gUnknown_83E43B0:: @ 83E43B0
	spr_template 10222, 10222, gOamData_83AC9D8, gUnknown_83E43A8, NULL, gDummySpriteAffineAnimTable, sub_80AA6B8

gUnknown_83E43C8:: @ 83E43C8
	.incbin "baserom.gba", 0x3E43C8, 0x28

gUnknown_83E43F0:: @ 83E43F0
	.incbin "baserom.gba", 0x3E43F0, 0x8

gUnknown_83E43F8:: @ 83E43F8
	spr_template 10215, 10215, gOamData_83AC9D8, gUnknown_83E43F0, NULL, gDummySpriteAffineAnimTable, sub_80AA708

gUnknown_83E4410:: @ 83E4410
	.incbin "baserom.gba", 0x3E4410, 0x20

gUnknown_83E4430:: @ 83E4430
	spr_template 10225, 10225, gOamData_83AC9D8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80AA838

gUnknown_83E4448:: @ 83E4448
	.incbin "baserom.gba", 0x3E4448, 0x30

gUnknown_83E4478:: @ 83E4478
	.incbin "baserom.gba", 0x3E4478, 0xC

gUnknown_83E4484:: @ 83E4484
	spr_template 10206, 10206, gOamData_83ACA30, gUnknown_83E3844, NULL, gUnknown_83E4478, sub_80AA998

gUnknown_83E449C:: @ 83E449C
	spr_template 10206, 10206, gOamData_83ACA30, gUnknown_83E3844, NULL, gUnknown_83E4478, sub_80AA938

gUnknown_83E44B4:: @ 83E44B4
	.incbin "baserom.gba", 0x3E44B4, 0x20

gUnknown_83E44D4:: @ 83E44D4
	.incbin "baserom.gba", 0x3E44D4, 0x8

gUnknown_83E44DC:: @ 83E44DC
	spr_template 10244, 10244, gOamData_83ACBE0, gDummySpriteAnimTable, NULL, gUnknown_83E44D4, sub_80AAAE4

gUnknown_83E44F4:: @ 83E44F4
	.incbin "baserom.gba", 0x3E44F4, 0x13A0

gUnknown_83E5894:: @ 83E5894
	.incbin "baserom.gba", 0x3E5894, 0x4

gUnknown_83E5898:: @ 83E5898
	spr_template 10115, 10115, gOamData_83ACA18, gUnknown_83E5894, NULL, gDummySpriteAffineAnimTable, sub_80AAC54

gUnknown_83E58B0:: @ 83E58B0
	.incbin "baserom.gba", 0x3E58B0, 0x18

gUnknown_83E58C8:: @ 83E58C8
	.incbin "baserom.gba", 0x3E58C8, 0x14

gUnknown_83E58DC:: @ 83E58DC
	.incbin "baserom.gba", 0x3E58DC, 0x4

gUnknown_83E58E0:: @ 83E58E0
	spr_template 10146, 10146, gOamData_83ACB50, gUnknown_83E58DC, NULL, gUnknown_83E58C8, sub_80AAC98

gUnknown_83E58F8:: @ 83E58F8
	.incbin "baserom.gba", 0x3E58F8, 0x10

gUnknown_83E5908:: @ 83E5908
	.incbin "baserom.gba", 0x3E5908, 0x20

gUnknown_83E5928:: @ 83E5928
	.incbin "baserom.gba", 0x3E5928, 0x4

gUnknown_83E592C:: @ 83E592C
	spr_template 10140, 10140, gOamData_83ACAC8, gUnknown_83E5908, NULL, gUnknown_83E5928, sub_80AAE84

gUnknown_83E5944:: @ 83E5944
	.incbin "baserom.gba", 0x3E5944, 0x14

gUnknown_83E5958:: @ 83E5958
	.incbin "baserom.gba", 0x3E5958, 0x4

gUnknown_83E595C:: @ 83E595C
	spr_template 10149, 10149, gOamData_83ACAF0, gUnknown_83E5958, NULL, gDummySpriteAffineAnimTable, sub_80AB024

gUnknown_83E5974:: @ 83E5974
	spr_template 10259, 10259, gOamData_83ACAF0, gUnknown_83E5958, NULL, gDummySpriteAffineAnimTable, sub_80AB024

gUnknown_83E598C:: @ 83E598C
	spr_template 10264, 10264, gOamData_83AC9C8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80AB024

gUnknown_83E59A4:: @ 83E59A4
	spr_template 10265, 10265, gOamData_83AC9C8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80AB024

gUnknown_83E59BC:: @ 83E59BC
	.incbin "baserom.gba", 0x3E59BC, 0x10

gUnknown_83E59CC:: @ 83E59CC
	.incbin "baserom.gba", 0x3E59CC, 0x4

gUnknown_83E59D0:: @ 83E59D0
	spr_template 10029, 10029, gOamData_83AC9D8, gUnknown_83E59CC, NULL, gDummySpriteAffineAnimTable, sub_80AB024

gUnknown_83E59E8:: @ 83E59E8
	spr_template 10165, 10165, gOamData_83ACAD8, gDummySpriteAnimTable, NULL, gUnknown_83E3C98, sub_80AB024

gUnknown_83E5A00:: @ 83E5A00
	.incbin "baserom.gba", 0x3E5A00, 0x30

gUnknown_83E5A30:: @ 83E5A30
	.incbin "baserom.gba", 0x3E5A30, 0x4

gUnknown_83E5A34:: @ 83E5A34
	.incbin "baserom.gba", 0x3E5A34, 0x4

gUnknown_83E5A38:: @ 83E5A38
	spr_template 10149, 10149, gOamData_83ACBB0, gUnknown_83E5958, NULL, gUnknown_83E5A30, sub_80AB168

gUnknown_83E5A50:: @ 83E5A50
	spr_template 10149, 10149, gOamData_83ACBB0, gUnknown_83E5958, NULL, gUnknown_83E5A34, sub_80AB1F8

gUnknown_83E5A68:: @ 83E5A68
	.incbin "baserom.gba", 0x3E5A68, 0x10

gUnknown_83E5A78:: @ 83E5A78
	.incbin "baserom.gba", 0x3E5A78, 0x4

gUnknown_83E5A7C:: @ 83E5A7C
	.incbin "baserom.gba", 0x3E5A7C, 0x4

gUnknown_83E5A80:: @ 83E5A80
	spr_template 10155, 10155, gOamData_83ACAF0, gUnknown_83E5A78, NULL, gDummySpriteAffineAnimTable, AnimThrowProjectile

gUnknown_83E5A98:: @ 83E5A98
	spr_template 10155, 10155, gOamData_83ACBB0, gUnknown_83E5A7C, NULL, gUnknown_83E6A80, sub_80AB2CC

gUnknown_83E5AB0:: @ 83E5AB0
	spr_template 10141, 10141, gOamData_83AC9C8, gUnknown_83E6330, NULL, gDummySpriteAffineAnimTable, sub_80AB308

gUnknown_83E5AC8:: @ 83E5AC8
	spr_template 10155, 10155, gOamData_83AC9C8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80ABA78

gUnknown_83E5AE0:: @ 83E5AE0
	spr_template 10268, 10268, gOamData_83AC9C8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80ABF60

gUnknown_83E5AF8:: @ 83E5AF8
	.incbin "baserom.gba", 0x3E5AF8, 0x18

gUnknown_83E5B10:: @ 83E5B10
	.incbin "baserom.gba", 0x3E5B10, 0x8

gUnknown_83E5B18:: @ 83E5B18
	.incbin "baserom.gba", 0x3E5B18, 0x4C

gUnknown_83E5B64:: @ 83E5B64
	.incbin "baserom.gba", 0x3E5B64, 0x8

gUnknown_83E5B6C:: @ 83E5B6C
	.incbin "baserom.gba", 0x3E5B6C, 0x4

gUnknown_83E5B70:: @ 83E5B70
	spr_template 10155, 10155, gOamData_83AC9C8, gUnknown_83E5B10, NULL, gDummySpriteAffineAnimTable, sub_80AC624

gUnknown_83E5B88:: @ 83E5B88
	spr_template 10155, 10155, gOamData_83ACA28, gUnknown_83E5B10, NULL, gUnknown_83E5B64, sub_80AC698

gUnknown_83E5BA0:: @ 83E5BA0
	spr_template 10155, 10155, gOamData_83ACA30, gUnknown_83E5B18, NULL, gUnknown_83E5B6C, sub_8077350

gUnknown_83E5BB8:: @ 83E5BB8
	.incbin "baserom.gba", 0x3E5BB8, 0x20

gUnknown_83E5BD8:: @ 83E5BD8
	.incbin "baserom.gba", 0x3E5BD8, 0x8

gUnknown_83E5BE0:: @ 83E5BE0
	spr_template 10029, 10029, gOamData_83AC9D8, gUnknown_83E5BD8, NULL, gDummySpriteAffineAnimTable, sub_80AC90C

gUnknown_83E5BF8:: @ 83E5BF8
	spr_template 10029, 10029, gOamData_83AC9D8, gUnknown_83E5BD8, NULL, gDummySpriteAffineAnimTable, sub_80AC94C

gUnknown_83E5C10:: @ 83E5C10
	.incbin "baserom.gba", 0x3E5C10, 0x24

gUnknown_83E5C34:: @ 83E5C34
	.incbin "baserom.gba", 0x3E5C34, 0x1C

gUnknown_83E5C50:: @ 83E5C50
	.incbin "baserom.gba", 0x3E5C50, 0x1C

gUnknown_83E5C6C:: @ 83E5C6C
	.incbin "baserom.gba", 0x3E5C6C, 0x4

gUnknown_83E5C70:: @ 83E5C70
	spr_template 10033, 10033, gOamData_83ACA38, gUnknown_83E5C34, NULL, gUnknown_83E5C6C, sub_80ACA00

gUnknown_83E5C88:: @ 83E5C88
	spr_template 10033, 10033, gOamData_83AC9D8, gUnknown_83E5C34, NULL, gDummySpriteAffineAnimTable, sub_80ACA00

gUnknown_83E5CA0:: @ 83E5CA0
	spr_template 10035, 10035, gOamData_83AC9D8, gUnknown_83E5C50, NULL, gDummySpriteAffineAnimTable, sub_80AC990
	spr_template 10029, 10029, gOamData_83AC9D8, gUnknown_83E5C50, NULL, gDummySpriteAffineAnimTable, sub_80AC990

gUnknown_83E5CD0:: @ 83E5CD0
	.incbin "baserom.gba", 0x3E5CD0, 0x44

gUnknown_83E5D14:: @ 83E5D14
	.incbin "baserom.gba", 0x3E5D14, 0x4

gUnknown_83E5D18:: @ 83E5D18
	spr_template 10157, 10157, gOamData_83ACB58, gDummySpriteAnimTable, NULL, gUnknown_83E5D14, sub_80ACBB0

gUnknown_83E5D30:: @ 83E5D30
	.incbin "baserom.gba", 0x3E5D30, 0x18

gUnknown_83E5D48:: @ 83E5D48
	.incbin "baserom.gba", 0x3E5D48, 0x4

gUnknown_83E5D4C:: @ 83E5D4C
	spr_template 10029, 10029, gOamData_83AC9D8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, TranslateAnimSpriteToTargetMonLocation

gUnknown_83E5D64:: @ 83E5D64
	spr_template 10029, 10029, gOamData_83AC9D8, gUnknown_83E5D48, NULL, gDummySpriteAffineAnimTable, sub_80ACBDC

gUnknown_83E5D7C:: @ 83E5D7C
	spr_template 10029, 10029, gOamData_83AC9D8, gUnknown_83E5D48, NULL, gDummySpriteAffineAnimTable, sub_80ACC44

gUnknown_83E5D94:: @ 83E5D94
	spr_template 10029, 10029, gOamData_83AC9D8, gUnknown_83E5D48, NULL, gDummySpriteAffineAnimTable, sub_80ACC60

gUnknown_83E5DAC:: @ 83E5DAC
	.incbin "baserom.gba", 0x3E5DAC, 0xC

gUnknown_83E5DB8:: @ 83E5DB8
	.incbin "baserom.gba", 0x3E5DB8, 0x2C

gUnknown_83E5DE4:: @ 83E5DE4
	spr_template 10029, 10029, gOamData_83AC9D8, gUnknown_83E5DB8, NULL, gDummySpriteAffineAnimTable, sub_80ACDA8

gUnknown_83E5DFC:: @ 83E5DFC
	spr_template 10029, 10029, gOamData_83AC9D8, gUnknown_83E5D48, NULL, gDummySpriteAffineAnimTable, sub_80ACDE8

gUnknown_83E5E14:: @ 83E5E14
	spr_template 10029, 10029, gOamData_83AC9D8, gUnknown_83E5D48, NULL, gDummySpriteAffineAnimTable, sub_8077350

gUnknown_83E5E2C:: @ 83E5E2C
	spr_template 10201, 10201, gOamData_83AC9D0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80AD330

gUnknown_83E5E44:: @ 83E5E44
	.incbin "baserom.gba", 0x3E5E44, 0x2

gUnknown_83E5E46:: @ 83E5E46
	.incbin "baserom.gba", 0x3E5E46, 0x1A

gUnknown_83E5E60:: @ 83E5E60
	spr_template 10201, 10201, gOamData_83AC9D8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80AD454

gUnknown_83E5E78:: @ 83E5E78
	.incbin "baserom.gba", 0x3E5E78, 0x2C

gUnknown_83E5EA4:: @ 83E5EA4
	.incbin "baserom.gba", 0x3E5EA4, 0x10

gUnknown_83E5EB4:: @ 83E5EB4
	spr_template 10231, 10231, gOamData_83AC9D0, gUnknown_83E5EA4, NULL, gDummySpriteAffineAnimTable, sub_80AD540

gUnknown_83E5ECC:: @ 83E5ECC
	.incbin "baserom.gba", 0x3E5ECC, 0x14

gUnknown_83E5EE0:: @ 83E5EE0
	.incbin "baserom.gba", 0x3E5EE0, 0x4

gUnknown_83E5EE4:: @ 83E5EE4
	spr_template 10232, 10232, gOamData_83AC9D8, gUnknown_83E5EE0, NULL, gDummySpriteAffineAnimTable, sub_80AD6F4

gUnknown_83E5EFC:: @ 83E5EFC
	.incbin "baserom.gba", 0x3E5EFC, 0x10

gUnknown_83E5F0C:: @ 83E5F0C
	.incbin "baserom.gba", 0x3E5F0C, 0x28

gUnknown_83E5F34:: @ 83E5F34
	.incbin "baserom.gba", 0x3E5F34, 0x4

gUnknown_83E5F38:: @ 83E5F38
	spr_template 10037, 10037, gOamData_83AC9D8, gUnknown_83E5F34, NULL, gDummySpriteAffineAnimTable, sub_80ADBEC

gUnknown_83E5F50:: @ 83E5F50
	.incbin "baserom.gba", 0x3E5F50, 0x74

gUnknown_83E5FC4:: @ 83E5FC4
	spr_template 10011, 10011, gOamData_83ACA30, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80ADD4C

gUnknown_83E5FDC:: @ 83E5FDC
	spr_template 10171, 10171, gOamData_83AC9D0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, TranslateAnimSpriteToTargetMonLocation

gUnknown_83E5FF4:: @ 83E5FF4
	.incbin "baserom.gba", 0x3E5FF4, 0x10

gUnknown_83E6004:: @ 83E6004
	.incbin "baserom.gba", 0x3E6004, 0x4

gUnknown_83E6008:: @ 83E6008
	spr_template 10011, 10011, gOamData_83ACA30, gDummySpriteAnimTable, NULL, gUnknown_83E6004, sub_80ADEB0

gUnknown_83E6020:: @ 83E6020
	.incbin "baserom.gba", 0x3E6020, 0x10

gUnknown_83E6030:: @ 83E6030
	.incbin "baserom.gba", 0x3E6030, 0x24

gUnknown_83E6054:: @ 83E6054
	.incbin "baserom.gba", 0x3E6054, 0x4

gUnknown_83E6058:: @ 83E6058
	spr_template 10282, 10282, gOamData_83ACA38, gUnknown_83E6030, NULL, gUnknown_83E6054, sub_80AE000

gUnknown_83E6070:: @ 83E6070
	spr_template 10011, 10011, gOamData_83ACA30, gDummySpriteAnimTable, NULL, gUnknown_83E6004, sub_80AE06C

gUnknown_83E6088:: @ 83E6088
	spr_template 10011, 10011, gOamData_83AC9D0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80AE1A0

gUnknown_83E60A0:: @ 83E60A0
	spr_template 10001, 10001, gOamData_83AC9C8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80AE420

gUnknown_83E60B8:: @ 83E60B8
	spr_template 10173, 10173, gOamData_83AC9F8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80AE470

gUnknown_83E60D0:: @ 83E60D0
	.incbin "baserom.gba", 0x3E60D0, 0x48

gUnknown_83E6118:: @ 83E6118
	.incbin "baserom.gba", 0x3E6118, 0x8

gUnknown_83E6120:: @ 83E6120
	spr_template 10211, 10211, gOamData_83AC9C8, gUnknown_83E6118, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_83E6138:: @ 83E6138
	.incbin "baserom.gba", 0x3E6138, 0x90

gUnknown_83E61C8:: @ 83E61C8
	.incbin "baserom.gba", 0x3E61C8, 0xC

gUnknown_83E61D4:: @ 83E61D4
	spr_template 10212, 10212, gOamData_83ACB60, gDummySpriteAnimTable, NULL, gUnknown_83E61C8, sub_80AE71C

gUnknown_83E61EC:: @ 83E61EC
	.incbin "baserom.gba", 0x3E61EC, 0x14

gUnknown_83E6200:: @ 83E6200
	.incbin "baserom.gba", 0x3E6200, 0x4

gUnknown_83E6204:: @ 83E6204
	spr_template 10213, 10213, gOamData_83AC9D8, gUnknown_83E6200, NULL, gDummySpriteAffineAnimTable, sub_80AE774

gUnknown_83E621C:: @ 83E621C
	spr_template 10212, 10212, gOamData_83ACB60, gDummySpriteAnimTable, NULL, gUnknown_83E61C8, sub_80AE7DC

gUnknown_83E6234:: @ 83E6234
	.incbin "baserom.gba", 0x3E6234, 0x20

gUnknown_83E6254:: @ 83E6254
	.incbin "baserom.gba", 0x3E6254, 0x20

gUnknown_83E6274:: @ 83E6274
	.incbin "baserom.gba", 0x3E6274, 0x4

gUnknown_83E6278:: @ 83E6278
	spr_template 10001, 10001, gOamData_83ACAC8, gUnknown_83E6254, NULL, gUnknown_83E6274, sub_80AEC34

gUnknown_83E6290:: @ 83E6290
	spr_template 10212, 10212, gOamData_83ACB60, gDummySpriteAnimTable, NULL, gUnknown_83E61C8, sub_80AEC80

gUnknown_83E62A8:: @ 83E62A8
	spr_template 10001, 10001, gOamData_83AC9C8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80AEF60

gUnknown_83E62C0:: @ 83E62C0
	.incbin "baserom.gba", 0x3E62C0, 0x60

gUnknown_83E6320:: @ 83E6320
	.incbin "baserom.gba", 0x3E6320, 0x4

gUnknown_83E6324:: @ 83E6324
	.incbin "baserom.gba", 0x3E6324, 0x4

gUnknown_83E6328:: @ 83E6328
	.incbin "baserom.gba", 0x3E6328, 0x4

gUnknown_83E632C:: @ 83E632C
	.incbin "baserom.gba", 0x3E632C, 0x4

gUnknown_83E6330:: @ 83E6330
	.incbin "baserom.gba", 0x3E6330, 0x14

gUnknown_83E6344:: @ 83E6344
	.incbin "baserom.gba", 0x3E6344, 0x4

gUnknown_83E6348:: @ 83E6348
	spr_template 10141, 10141, gOamData_83ACBE8, gUnknown_83E6320, NULL, gUnknown_83E6344, sub_80AF2F0

gUnknown_83E6360:: @ 83E6360
	spr_template 10141, 10141, gOamData_83ACAE8, gUnknown_83E6324, NULL, gDummySpriteAffineAnimTable, sub_80AF2F0

gUnknown_83E6378:: @ 83E6378
	.incbin "baserom.gba", 0x3E6378, 0x10

gUnknown_83E6388:: @ 83E6388
	.incbin "baserom.gba", 0x3E6388, 0x4

gUnknown_83E638C:: @ 83E638C
	spr_template 10141, 10141, gOamData_83ACB88, gUnknown_83E6320, NULL, gUnknown_83E6388, sub_80AF330

gUnknown_83E63A4:: @ 83E63A4
	spr_template 10141, 10141, gOamData_83ACAE8, gUnknown_83E6324, NULL, gDummySpriteAffineAnimTable, sub_80AF330

gUnknown_83E63BC:: @ 83E63BC
	.incbin "baserom.gba", 0x3E63BC, 0x20

gUnknown_83E63DC:: @ 83E63DC
	.incbin "baserom.gba", 0x3E63DC, 0x4

gUnknown_83E63E0:: @ 83E63E0
	spr_template 10141, 10141, gOamData_83ACB88, gUnknown_83E6320, NULL, gUnknown_83E63DC, sub_80AF3B8

gUnknown_83E63F8:: @ 83E63F8
	spr_template 10141, 10141, gOamData_83ACB48, gUnknown_83E6324, NULL, gUnknown_83E63DC, sub_80AF3B8

gUnknown_83E6410:: @ 83E6410
	spr_template 10141, 10141, gOamData_83AC9C8, gUnknown_83E6328, NULL, gDummySpriteAffineAnimTable, sub_80AF468

gUnknown_83E6428:: @ 83E6428
	spr_template 10141, 10141, gOamData_83AC9D0, gUnknown_83E632C, NULL, gDummySpriteAffineAnimTable, sub_80AF6D8

gUnknown_83E6440:: @ 83E6440
	spr_template 10141, 10141, gOamData_83AC9C8, gUnknown_83E6328, NULL, gDummySpriteAffineAnimTable, sub_80AF6D8

gUnknown_83E6458:: @ 83E6458
	.incbin "baserom.gba", 0x3E6458, 0x20

gUnknown_83E6478:: @ 83E6478
	.incbin "baserom.gba", 0x3E6478, 0x4

gUnknown_83E647C:: @ 83E647C
	spr_template 10142, 10142, gOamData_83ACB28, gUnknown_83E6478, NULL, gDummySpriteAffineAnimTable, sub_80AF88C

gUnknown_83E6494:: @ 83E6494
	.incbin "baserom.gba", 0x3E6494, 0xC

gUnknown_83E64A0:: @ 83E64A0
	.incbin "baserom.gba", 0x3E64A0, 0x4

gUnknown_83E64A4:: @ 83E64A4
	spr_template 10144, 10144, gOamData_83ACB18, gUnknown_83E64A0, NULL, gDummySpriteAffineAnimTable, sub_80AF914

gUnknown_83E64BC:: @ 83E64BC
	spr_template 10172, 10172, gOamData_83ACB18, gUnknown_83E64A0, NULL, gDummySpriteAffineAnimTable, sub_80AF914

gUnknown_83E64D4:: @ 83E64D4
	.incbin "baserom.gba", 0x3E64D4, 0x14

gUnknown_83E64E8:: @ 83E64E8
	spr_template 10155, 10155, gOamData_83AC9D0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80AFD4C

gUnknown_83E6500:: @ 83E6500
	.incbin "baserom.gba", 0x3E6500, 0x14

gUnknown_83E6514:: @ 83E6514
	spr_template 10172, 10172, gOamData_83ACB18, gUnknown_83E64A0, NULL, gDummySpriteAffineAnimTable, sub_80AFFD4

gUnknown_83E652C:: @ 83E652C
	.incbin "baserom.gba", 0x3E652C, 0x68

gUnknown_83E6594:: @ 83E6594
	.incbin "baserom.gba", 0x3E6594, 0xC

gUnknown_83E65A0:: @ 83E65A0
	.incbin "baserom.gba", 0x3E65A0, 0x4

gUnknown_83E65A4:: @ 83E65A4
	spr_template 10263, 10263, gOamData_83ACA30, gDummySpriteAnimTable, NULL, gUnknown_83E6594, sub_80B05CC

gUnknown_83E65BC:: @ 83E65BC
	spr_template 10263, 10263, gOamData_83ACA30, gDummySpriteAnimTable, NULL, gUnknown_83E65A0, sub_8077350

gUnknown_83E65D4:: @ 83E65D4
	.incbin "baserom.gba", 0x3E65D4, 0x1C

gUnknown_83E65F0:: @ 83E65F0
	.incbin "baserom.gba", 0x3E65F0, 0x58

gUnknown_83E6648:: @ 83E6648
	.incbin "baserom.gba", 0x3E6648, 0x14

gUnknown_83E665C:: @ 83E665C
	spr_template 10043, 10043, gOamData_83ACA98, gUnknown_83E65F0, NULL, gUnknown_83E6648, unc_080B06FC

gUnknown_83E6674:: @ 83E6674
	spr_template 10141, 10141, gOamData_83AC9C8, gUnknown_83E6324, NULL, gDummySpriteAffineAnimTable, sub_80B07C0
	spr_template 10050, 10050, gOamData_83AC9D8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, unc_080B08A0

gUnknown_83E66A4:: @ 83E66A4
	.incbin "baserom.gba", 0x3E66A4, 0x28

gUnknown_83E66CC:: @ 83E66CC
	.incbin "baserom.gba", 0x3E66CC, 0x4

gUnknown_83E66D0:: @ 83E66D0
	.incbin "baserom.gba", 0x3E66D0, 0x8

gUnknown_83E66D8:: @ 83E66D8
	.incbin "baserom.gba", 0x3E66D8, 0x8

gUnknown_83E66E0:: @ 83E66E0
	spr_template 10143, 10143, gOamData_83AC9D8, gUnknown_83E66CC, NULL, gDummySpriteAffineAnimTable, sub_80B08DC

gUnknown_83E66F8:: @ 83E66F8
	spr_template 10143, 10143, gOamData_83AC9D8, gUnknown_83E66CC, NULL, gDummySpriteAffineAnimTable, sub_80B0928

gUnknown_83E6710:: @ 83E6710
	spr_template 10143, 10143, gOamData_83AC9D8, gUnknown_83E66CC, NULL, gDummySpriteAffineAnimTable, sub_80B0954

gUnknown_83E6728:: @ 83E6728
	spr_template 10143, 10143, gOamData_83AC9D8, gUnknown_83E66CC, NULL, gDummySpriteAffineAnimTable, sub_80B09A4

gUnknown_83E6740:: @ 83E6740
	spr_template 10143, 10143, gOamData_83AC9D8, gUnknown_83E66D8, NULL, gDummySpriteAffineAnimTable, sub_80B0B80

gUnknown_83E6758:: @ 83E6758
	spr_template 10143, 10143, gOamData_83AC9D8, gUnknown_83E66D0, NULL, gDummySpriteAffineAnimTable, sub_80B0C28

gUnknown_83E6770:: @ 83E6770
	.incbin "baserom.gba", 0x3E6770, 0x18

gUnknown_83E6788:: @ 83E6788
	.incbin "baserom.gba", 0x3E6788, 0x4

gUnknown_83E678C:: @ 83E678C
	spr_template 10143, 10143, gOamData_83ACA98, gUnknown_83E66CC, NULL, gUnknown_83E6788, sub_80B0CEC

gUnknown_83E67A4:: @ 83E67A4
	.incbin "baserom.gba", 0x3E67A4, 0x18

gUnknown_83E67BC:: @ 83E67BC
	.incbin "baserom.gba", 0x3E67BC, 0x4

gUnknown_83E67C0:: @ 83E67C0
	spr_template 10143, 10143, gOamData_83ACA98, gUnknown_83E66CC, NULL, gUnknown_83E67BC, sub_80B0CEC

gUnknown_83E67D8:: @ 83E67D8
	spr_template 10143, 10143, gOamData_83AC9D8, gUnknown_83E66D0, NULL, gDummySpriteAffineAnimTable, sub_80B0D58

gUnknown_83E67F0:: @ 83E67F0
	spr_template 10073, 10073, gOamData_83AC9D0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80B0DF0

gUnknown_83E6808:: @ 83E6808
	spr_template 10167, 10167, gOamData_83ACB00, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80B0E80

gUnknown_83E6820:: @ 83E6820
	spr_template 10208, 10208, gOamData_83AC9D8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80B0F68

gUnknown_83E6838:: @ 83E6838
	.incbin "baserom.gba", 0x3E6838, 0x28

gUnknown_83E6860:: @ 83E6860
	.incbin "baserom.gba", 0x3E6860, 0x4

gUnknown_83E6864:: @ 83E6864
	spr_template 10212, 10212, gOamData_83ACBC0, gDummySpriteAnimTable, NULL, gUnknown_83E6860, sub_80B107C

gUnknown_83E687C:: @ 83E687C
	spr_template 10257, 10257, gOamData_83AC9D0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80B1188

gUnknown_83E6894:: @ 83E6894
	spr_template 10256, 10256, gOamData_83AC9E0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80B12E8

gUnknown_83E68AC:: @ 83E68AC
	spr_template 10143, 10143, gOamData_83AC9D8, gUnknown_83E66CC, NULL, gDummySpriteAffineAnimTable, sub_80B13F8

gUnknown_83E68C4:: @ 83E68C4
	.incbin "baserom.gba", 0x3E68C4, 0x30

gUnknown_83E68F4:: @ 83E68F4
	.incbin "baserom.gba", 0x3E68F4, 0xC

gUnknown_83E6900:: @ 83E6900
	spr_template 10245, 10245, gOamData_83AC9D8, gUnknown_83E68F4, NULL, gDummySpriteAffineAnimTable, sub_80B1484

gUnknown_83E6918:: @ 83E6918
	.incbin "baserom.gba", 0x3E6918, 0x24

gUnknown_83E693C:: @ 83E693C
	.incbin "baserom.gba", 0x3E693C, 0xC

gUnknown_83E6948:: @ 83E6948
	spr_template 10246, 10246, gOamData_83AC9E0, gUnknown_83E693C, NULL, gDummySpriteAffineAnimTable, sub_80B1484

gUnknown_83E6960:: @ 83E6960
	.incbin "baserom.gba", 0x3E6960, 0x18

gUnknown_83E6978:: @ 83E6978
	.incbin "baserom.gba", 0x3E6978, 0x4

gUnknown_83E697C:: @ 83E697C
	spr_template 10143, 10143, gOamData_83ACA98, gUnknown_83E66CC, NULL, gUnknown_83E6978, sub_80B14F0

gUnknown_83E6994:: @ 83E6994
	.incbin "baserom.gba", 0x3E6994, 0x14

gUnknown_83E69A8:: @ 83E69A8
	.incbin "baserom.gba", 0x3E69A8, 0x4

gUnknown_83E69AC:: @ 83E69AC
	spr_template 10151, 10151, gOamData_83ACA18, gUnknown_83E69A8, NULL, gDummySpriteAffineAnimTable, AnimSpriteOnMonPos

gUnknown_83E69C4:: @ 83E69C4
	.incbin "baserom.gba", 0x3E69C4, 0x18

gUnknown_83E69DC:: @ 83E69DC
	.incbin "baserom.gba", 0x3E69DC, 0x4

gUnknown_83E69E0:: @ 83E69E0
	.incbin "baserom.gba", 0x3E69E0, 0x4

gUnknown_83E69E4:: @ 83E69E4
	.incbin "baserom.gba", 0x3E69E4, 0x34

gUnknown_83E6A18:: @ 83E6A18
	.incbin "baserom.gba", 0x3E6A18, 0x4

gUnknown_83E6A1C:: @ 83E6A1C
	.incbin "baserom.gba", 0x3E6A1C, 0x4

gUnknown_83E6A20:: @ 83E6A20
	spr_template 10150, 10150, gOamData_83ACA90, gUnknown_83E69DC, NULL, gUnknown_83E6A18, sub_80B1620

gUnknown_83E6A38:: @ 83E6A38
	spr_template 10150, 10150, gOamData_83ACA90, gUnknown_83E69DC, NULL, gUnknown_83E6A18, sub_80B16A0

gUnknown_83E6A50:: @ 83E6A50
	spr_template 10150, 10150, gOamData_83ACA30, gUnknown_83E69E4, NULL, gUnknown_83E6A1C, sub_80B1744

gUnknown_83E6A68:: @ 83E6A68
	.incbin "baserom.gba", 0x3E6A68, 0x18

gUnknown_83E6A80:: @ 83E6A80
	.incbin "baserom.gba", 0x3E6A80, 0x4

gUnknown_83E6A84:: @ 83E6A84
	spr_template 10150, 10150, gOamData_83ACA90, gUnknown_83E69E0, NULL, gUnknown_83E6A80, sub_80B17C4

gUnknown_83E6A9C:: @ 83E6A9C
	.incbin "baserom.gba", 0x3E6A9C, 0x18

gUnknown_83E6AB4:: @ 83E6AB4
	.incbin "baserom.gba", 0x3E6AB4, 0x4

gUnknown_83E6AB8:: @ 83E6AB8
	spr_template 10150, 10150, gOamData_83ACA30, gUnknown_83E69DC, NULL, gUnknown_83E6AB4, sub_80B1838

gUnknown_83E6AD0:: @ 83E6AD0
	spr_template 10155, 10155, gOamData_83ACB50, gUnknown_83E5A78, NULL, gUnknown_83E6AB4, sub_80B1838
