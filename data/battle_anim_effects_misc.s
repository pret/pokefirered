#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83E44F4:: @ 83E44F4
	.incbin "graphics/battle_anims/unk_83E4874.4bpp"

gUnknown_83E4874::
	.incbin "graphics/battle_anims/unk_83E4874.bin"

gUnknown_83E5874:: @ 83E5874
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 8, 2
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 24, 6
	obj_image_anim_frame 32, 2
	obj_image_anim_frame 40, 2
	obj_image_anim_frame 48, 2
	obj_image_anim_end

gUnknown_83E5894:: @ 83E5894
	.4byte gUnknown_83E5874

gUnknown_83E5898:: @ 83E5898
	spr_template 10115, 10115, gOamData_AffineOff_ObjNormal_16x32, gUnknown_83E5894, NULL, gDummySpriteAffineAnimTable, sub_80AAC54

gUnknown_83E58B0:: @ 83E58B0
	obj_rot_scal_anim_frame -5, -5, 0, 10
	obj_rot_scal_anim_frame 5, 5, 0, 10
	obj_rot_scal_anim_jump 0

gUnknown_83E58C8:: @ 83E58C8
	.4byte gUnknown_83E58B0

gUnknown_83E58CC:: @ 83E58CC
	obj_image_anim_frame 0, 1
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_end

gUnknown_83E58DC:: @ 83E58DC
	.4byte gUnknown_83E58CC

gUnknown_83E58E0:: @ 83E58E0
	spr_template 10146, 10146, gOamData_AffineNormal_ObjBlend_16x16, gUnknown_83E58DC, NULL, gUnknown_83E58C8, sub_80AAC98

gUnknown_83E58F8:: @ 83E58F8
	obj_image_anim_frame 0, 1
	obj_image_anim_end

gUnknown_83E5900:: @ 83E5900
	obj_image_anim_frame 4, 1
	obj_image_anim_end

gUnknown_83E5908:: @ 83E5908
	.4byte gUnknown_83E58F8
	.4byte gUnknown_83E5900

gUnknown_83E5910:: @ 83E5910
	obj_rot_scal_anim_frame 0, 0, 0, 1
	obj_rot_scal_anim_frame 96, 96, 0, 1
	obj_rot_scal_anim_end

gUnknown_83E5928:: @ 83E5928
	.4byte gUnknown_83E5910

gUnknown_83E592C:: @ 83E592C
	spr_template 10140, 10140, gOamData_AffineDouble_ObjNormal_8x16, gUnknown_83E5908, NULL, gUnknown_83E5928, sub_80AAE84

gUnknown_83E5944:: @ 83E5944
	obj_image_anim_frame 0, 1
	obj_image_anim_frame 4, 1
	obj_image_anim_frame 8, 1
	obj_image_anim_frame 12, 1
	obj_image_anim_jump 0

gUnknown_83E5958:: @ 83E5958
	.4byte gUnknown_83E5944

gUnknown_83E595C:: @ 83E595C
	spr_template 10149, 10149, gOamData_AffineOff_ObjBlend_16x16, gUnknown_83E5958, NULL, gDummySpriteAffineAnimTable, sub_80AB024

gUnknown_83E5974:: @ 83E5974
	spr_template 10259, 10259, gOamData_AffineOff_ObjBlend_16x16, gUnknown_83E5958, NULL, gDummySpriteAffineAnimTable, sub_80AB024

gUnknown_83E598C:: @ 83E598C
	spr_template 10264, 10264, gOamData_AffineOff_ObjNormal_8x8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80AB024

gUnknown_83E59A4:: @ 83E59A4
	spr_template 10265, 10265, gOamData_AffineOff_ObjNormal_8x8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80AB024

gUnknown_83E59BC:: @ 83E59BC
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 32, 2
	obj_image_anim_frame 48, 2
	obj_image_anim_jump 0

gUnknown_83E59CC:: @ 83E59CC
	.4byte gUnknown_83E59BC

gUnknown_83E59D0:: @ 83E59D0
	spr_template 10029, 10029, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E59CC, NULL, gDummySpriteAffineAnimTable, sub_80AB024

gUnknown_83E59E8:: @ 83E59E8
	spr_template 10165, 10165, gOamData_AffineDouble_ObjNormal_16x32, gDummySpriteAnimTable, NULL, gGrowingRingAffineAnimTable, sub_80AB024

gUnknown_83E5A00:: @ 83E5A00
	obj_rot_scal_anim_frame 3, 3, 10, 50
	obj_rot_scal_anim_frame 0, 0, 0, 10
	obj_rot_scal_anim_frame -20, -20, 246, 20
	obj_rot_scal_anim_end

gUnknown_83E5A20:: @ 83E5A20
	obj_rot_scal_anim_frame 336, 336, 0, 0
	obj_rot_scal_anim_end

gUnknown_83E5A30:: @ 83E5A30
	.4byte gUnknown_83E5A00

gUnknown_83E5A34:: @ 83E5A34
	.4byte gUnknown_83E5A20

gUnknown_83E5A38:: @ 83E5A38
	spr_template 10149, 10149, gOamData_AffineDouble_ObjBlend_16x16, gUnknown_83E5958, NULL, gUnknown_83E5A30, sub_80AB168

gUnknown_83E5A50:: @ 83E5A50
	spr_template 10149, 10149, gOamData_AffineDouble_ObjBlend_16x16, gUnknown_83E5958, NULL, gUnknown_83E5A34, sub_80AB1F8

gUnknown_83E5A68:: @ 83E5A68
	obj_image_anim_frame 0, 1
	obj_image_anim_end

gUnknown_83E5A70:: @ 83E5A70
	obj_image_anim_frame 4, 1
	obj_image_anim_end

gUnknown_83E5A78:: @ 83E5A78
	.4byte gUnknown_83E5A68

gUnknown_83E5A7C:: @ 83E5A7C
	.4byte gUnknown_83E5A70

gUnknown_83E5A80:: @ 83E5A80
	spr_template 10155, 10155, gOamData_AffineOff_ObjBlend_16x16, gUnknown_83E5A78, NULL, gDummySpriteAffineAnimTable, AnimThrowProjectile

gUnknown_83E5A98:: @ 83E5A98
	spr_template 10155, 10155, gOamData_AffineDouble_ObjBlend_16x16, gUnknown_83E5A7C, NULL, gUnknown_83E6A80, sub_80AB2CC

gUnknown_83E5AB0:: @ 83E5AB0
	spr_template 10141, 10141, gOamData_AffineOff_ObjNormal_8x8, gUnknown_83E6330, NULL, gDummySpriteAffineAnimTable, sub_80AB308

gUnknown_83E5AC8:: @ 83E5AC8
	spr_template 10155, 10155, gOamData_AffineOff_ObjNormal_8x8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80ABA78

gUnknown_83E5AE0:: @ 83E5AE0
	spr_template 10268, 10268, gOamData_AffineOff_ObjNormal_8x8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80ABF60

gUnknown_83E5AF8:: @ 83E5AF8
	obj_image_anim_frame 8, 1
	obj_image_anim_end

gUnknown_83E5B00:: @ 83E5B00
	obj_image_anim_frame 9, 1
	obj_image_anim_end

gUnknown_83E5B08:: @ 83E5B08
	obj_image_anim_frame 4, 1
	obj_image_anim_end

gUnknown_83E5B10:: @ 83E5B10
	.4byte gUnknown_83E5AF8
	.4byte gUnknown_83E5B00

gUnknown_83E5B18:: @ 83E5B18
	.4byte gUnknown_83E5B08

gUnknown_83E5B1C:: @ 83E5B1C
	obj_rot_scal_anim_frame 256, 256, 0, 0
	obj_rot_scal_anim_frame -10, -10, 0, 15
	obj_rot_scal_anim_end

gUnknown_83E5B34:: @ 83E5B34
	obj_rot_scal_anim_frame 224, 224, 0, 0
	obj_rot_scal_anim_frame -8, -8, 0, 15
	obj_rot_scal_anim_end

gUnknown_83E5B4C:: @ 83E5B4C
	obj_rot_scal_anim_frame 336, 336, 0, 0
	obj_rot_scal_anim_frame 0, 0, 0, 15
	obj_rot_scal_anim_end

gUnknown_83E5B64:: @ 83E5B64
	.4byte gUnknown_83E5B1C
	.4byte gUnknown_83E5B34

gUnknown_83E5B6C:: @ 83E5B6C
	.4byte gUnknown_83E5B4C

gUnknown_83E5B70:: @ 83E5B70
	spr_template 10155, 10155, gOamData_AffineOff_ObjNormal_8x8, gUnknown_83E5B10, NULL, gDummySpriteAffineAnimTable, sub_80AC624

gUnknown_83E5B88:: @ 83E5B88
	spr_template 10155, 10155, gOamData_AffineNormal_ObjNormal_8x8, gUnknown_83E5B10, NULL, gUnknown_83E5B64, sub_80AC698

gUnknown_83E5BA0:: @ 83E5BA0
	spr_template 10155, 10155, gOamData_AffineNormal_ObjNormal_16x16, gUnknown_83E5B18, NULL, gUnknown_83E5B6C, sub_8077350
