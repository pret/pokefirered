#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83E2964:: @ 83E2964
	.byte 0x02, 0x04, 0x01, 0x03

gPowderParticlesAnimCmds:: @ 83E2968
	obj_image_anim_frame 0x0000, 5
	obj_image_anim_frame 0x0002, 5
	obj_image_anim_frame 0x0004, 5
	obj_image_anim_frame 0x0006, 5
	obj_image_anim_frame 0x0008, 5
	obj_image_anim_frame 0x000a, 5
	obj_image_anim_frame 0x000c, 5
	obj_image_anim_frame 0x000e, 5
	obj_image_anim_jump 0x0000

gPowderParticlesAnimTable:: @ 83E298C
	.4byte gPowderParticlesAnimCmds

gSleepPowderParticleSpriteTemplate:: @ 83E2990
	spr_template 10067, 10067, gOamData_AffineOff_ObjNormal_8x16, gPowderParticlesAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A22E8

gStunSporeParticleSpriteTemplate:: @ 83E29A8
	spr_template 10068, 10068, gOamData_AffineOff_ObjNormal_8x16, gPowderParticlesAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A22E8

gPoisonPowderParticleSpriteTemplate:: @ 83E29C0
	spr_template 10065, 10065, gOamData_AffineOff_ObjNormal_8x16, gPowderParticlesAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A22E8

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

gPowerAbsorptionOrbSpriteTemplate:: @ 83E2A58
	spr_template 10147, 10147, gOamData_AffineNormal_ObjBlend_16x16, gSpriteAnimTable_83E2A40, NULL, gSpriteAffineAnimTable_83E2A54, sub_80A2388

gSolarbeamBigOrbSpriteTemplate:: @ 83E2A70
	spr_template 10147, 10147, gOamData_AffineOff_ObjNormal_8x8, gSpriteAnimTable_83E2A20, NULL, gDummySpriteAffineAnimTable, sub_80A23D8

gSolarbeamSmallOrbSpriteTemplate:: @ 83E2A88
	spr_template 10147, 10147, gOamData_AffineOff_ObjNormal_8x8, gSpriteAnimTable_83E2A3C, NULL, gDummySpriteAffineAnimTable, sub_80A2430

gStockpileAbsorptionOrbAffineCmds:: @ 83E2AA0
	obj_rot_scal_anim_frame 320, 320, 0, 0
	obj_rot_scal_anim_frame -14, -14, 0, 1
	obj_rot_scal_anim_jump 1

gStockpileAbsorptionOrbAffineAnimTable:: @ 83E2AB8
	.4byte gStockpileAbsorptionOrbAffineCmds

gStockpileAbsorptionOrbSpriteTemplate:: @ 83E2ABC
	spr_template 10235, 10235, gOamData_AffineDouble_ObjNormal_8x8, gDummySpriteAnimTable, NULL, gStockpileAbsorptionOrbAffineAnimTable, sub_80A2388

gAbsorptionOrbAffineAnimCmds:: @ 83E2AD4
	obj_rot_scal_anim_frame -5, -5, 0, 1
	obj_rot_scal_anim_jump 0

gAbsorptionOrbAffineAnimTable:: @ 83E2AE4
	.4byte gAbsorptionOrbAffineAnimCmds

gAbsorptionOrbSpriteTemplate:: @ 83E2AE8
	spr_template 10147, 10147, gOamData_AffineNormal_ObjBlend_16x16, gSpriteAnimTable_83E2A40, NULL, gAbsorptionOrbAffineAnimTable, sub_80A2580

gHyperBeamOrbSpriteTemplate:: @ 83E2B00
	spr_template 10147, 10147, gOamData_AffineOff_ObjNormal_8x8, gSpriteAnimTable_83E2A20, NULL, gDummySpriteAffineAnimTable, sub_80A25EC

gLeechSeedAnimCmds1:: @ 83E2B18
	obj_image_anim_frame 0, 1
	obj_image_anim_end

gLeechSeedAnimCmds2:: @ 83E2B20
	obj_image_anim_frame 4, 7
	obj_image_anim_frame 8, 7
	obj_image_anim_jump 0

gLeechSeedAnimTable:: @ 83E2B2C
	.4byte gLeechSeedAnimCmds1
	.4byte gLeechSeedAnimCmds2

gLeechSeedSpriteTemplate:: @ 83E2B34
	spr_template 10006, 10006, gOamData_AffineOff_ObjNormal_16x16, gLeechSeedAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A26F0

gUnknown_83E2B4C:: @ 83E2B4C
	obj_image_anim_frame 0, 1
	obj_image_anim_end

gUnknown_83E2B54:: @ 83E2B54
	obj_image_anim_frame 4, 7
	obj_image_anim_end

gUnknown_83E2B5C:: @ 83E2B5C
	.4byte gUnknown_83E2B4C
	.4byte gUnknown_83E2B54

gUnknown_83E2B64:: @ 83E2B64
	spr_template 10158, 10158, gOamData_AffineOff_ObjNormal_16x16, gUnknown_83E2B5C, NULL, gDummySpriteAffineAnimTable, sub_80A27D0

gUnknown_83E2B7C:: @ 83E2B7C
	obj_image_anim_frame 0, 1
	obj_image_anim_end

gUnknown_83E2B84:: @ 83E2B84
	obj_image_anim_frame 4, 1
	obj_image_anim_end

gUnknown_83E2B8C:: @ 83E2B8C
	.4byte gUnknown_83E2B7C

gUnknown_83E2B90:: @ 83E2B90
	.4byte gUnknown_83E2B84

gUnknown_83E2B94:: @ 83E2B94
	spr_template 10159, 10159, gOamData_AffineOff_ObjNormal_16x16, gUnknown_83E2B8C, NULL, gDummySpriteAffineAnimTable, sub_80A2920

gUnknown_83E2BAC:: @ 83E2BAC
	spr_template 10159, 10159, gOamData_AffineOff_ObjNormal_8x8, gUnknown_83E2B90, NULL, gDummySpriteAffineAnimTable, sub_80A29EC

gUnknown_83E2BC4:: @ 83E2BC4
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_frame 12, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 20, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 12, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_frame 4, 5
	obj_image_anim_jump 0

gUnknown_83E2BF0:: @ 83E2BF0
	obj_image_anim_frame 24, 5
	obj_image_anim_frame 28, 5
	obj_image_anim_frame 32, 5
	obj_image_anim_end

gUnknown_83E2C00:: @ 83E2C00
	.4byte gUnknown_83E2BC4
	.4byte gUnknown_83E2BF0

gUnknown_83E2C08:: @ 83E2C08
	spr_template 10063, 10063, gOamData_AffineOff_ObjNormal_16x16, gUnknown_83E2C00, NULL, gDummySpriteAffineAnimTable, sub_80A2AA4

gUnknown_83E2C20:: @ 83E2C20
	spr_template 10063, 10063, gOamData_AffineOff_ObjNormal_16x16, gUnknown_83E2C00, NULL, gDummySpriteAffineAnimTable, AnimMoveTwisterParticle

gUnknown_83E2C38:: @ 83E2C38
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_jump 0

gUnknown_83E2C4C:: @ 83E2C4C
	.4byte gUnknown_83E2C38

gUnknown_83E2C50:: @ 83E2C50
	spr_template 10160, 10160, gOamData_AffineOff_ObjNormal_32x16, gUnknown_83E2C4C, NULL, gDummySpriteAffineAnimTable, sub_80A2B9C

gUnknown_83E2C68:: @ 83E2C68
	obj_rot_scal_anim_frame 0, 0, 0, 1
	obj_rot_scal_anim_jump 0

gUnknown_83E2C78:: @ 83E2C78
	.4byte gUnknown_83E2C68

gUnknown_83E2C7C:: @ 83E2C7C
	spr_template 10174, 10174, gOamData_AffineNormal_ObjNormal_32x32, gDummySpriteAnimTable, NULL, gUnknown_83E2C78, sub_80A2B9C

gUnknown_83E2C94:: @ 83E2C94
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 64, 4
	obj_image_anim_frame 96, 4
	obj_image_anim_end

gUnknown_83E2CA8:: @ 83E2CA8
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 64, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 96, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

gUnknown_83E2CBC:: @ 83E2CBC
	.4byte gUnknown_83E2C94
	.4byte gUnknown_83E2CA8

gUnknown_83E2CC4:: @ 83E2CC4
	obj_rot_scal_anim_frame 256, 256, 0, 0
	obj_rot_scal_anim_frame -11, 0, 0, 6
	obj_rot_scal_anim_frame 11, 0, 0, 6
	obj_rot_scal_anim_end

gUnknown_83E2CE4:: @ 83E2CE4
	obj_rot_scal_anim_frame -256, 256, 0, 0
	obj_rot_scal_anim_frame 11, 0, 0, 6
	obj_rot_scal_anim_frame -11, 0, 0, 6
	obj_rot_scal_anim_end

gUnknown_83E2D04:: @ 83E2D04
	.4byte gUnknown_83E2CC4
	.4byte gUnknown_83E2CE4

gUnknown_83E2D0C:: @ 83E2D0C
	spr_template 10186, 10186, gOamData_AffineNormal_ObjNormal_64x32, gUnknown_83E2CBC, NULL, gUnknown_83E2D04, sub_80A2E28

gUnknown_83E2D24:: @ 83E2D24
	obj_rot_scal_anim_frame 0, 0, 0, 0
	obj_rot_scal_anim_frame 48, 48, 0, 14
	obj_rot_scal_anim_end

gUnknown_83E2D3C:: @ 83E2D3C
	obj_rot_scal_anim_frame -16, -16, 0, 1
	obj_rot_scal_anim_jump 0

gUnknown_83E2D4C:: @ 83E2D4C
	.4byte gUnknown_83E2D24
	.4byte gUnknown_83E2D3C

gUnknown_83E2D54:: @ 83E2D54
	spr_template 10147, 10147, gOamData_AffineDouble_ObjNormal_16x16, gSpriteAnimTable_83E2A40, NULL, gUnknown_83E2D4C, sub_80A3098

gUnknown_83E2D6C:: @ 83E2D6C
	obj_image_anim_frame 0, 7
	obj_image_anim_frame 16, 7
	obj_image_anim_frame 32, 7
	obj_image_anim_frame 48, 7
	obj_image_anim_end

gUnknown_83E2D80:: @ 83E2D80
	obj_image_anim_frame 0, 7, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 7, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 7, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 48, 7, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

gUnknown_83E2D94:: @ 83E2D94
	obj_image_anim_frame 0, 7
	obj_image_anim_frame 16, 7
	obj_image_anim_frame 32, 7
	obj_image_anim_end

gUnknown_83E2DA4:: @ 83E2DA4
	obj_image_anim_frame 0, 7, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 7, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 7, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

gUnknown_83E2DB4:: @ 83E2DB4
	.4byte gUnknown_83E2D6C
	.4byte gUnknown_83E2D80
	.4byte gUnknown_83E2D94
	.4byte gUnknown_83E2DA4

gUnknown_83E2DC4:: @ 83E2DC4
	spr_template 10223, 10223, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E2DB4, NULL, gDummySpriteAffineAnimTable, sub_80A3168

gUnknown_83E2DDC:: @ 83E2DDC
	spr_template 10223, 10223, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E2DB4, NULL, gDummySpriteAffineAnimTable, sub_80A31EC

gUnknown_83E2DF4:: @ 83E2DF4
	obj_image_anim_frame 3, 3
	obj_image_anim_frame 0, 5
	obj_image_anim_jump 0

gUnknown_83E2E00:: @ 83E2E00
	.4byte gUnknown_83E2DF4

gUnknown_83E2E04:: @ 83E2E04
	spr_template 10147, 10147, gOamData_AffineOff_ObjNormal_8x8, gUnknown_83E2E00, NULL, gDummySpriteAffineAnimTable, sub_80A3334

gUnknown_83E2E1C:: @ 83E2E1C
	obj_image_anim_frame 0, 30
	obj_image_anim_end

gUnknown_83E2E24:: @ 83E2E24
	.4byte gUnknown_83E2E1C

gUnknown_83E2E28:: @ 83E2E28
	obj_rot_scal_anim_frame 0, 0, 252, 10
	obj_rot_scal_anim_frame 0, 0, 4, 20
	obj_rot_scal_anim_frame 0, 0, 252, 10
	obj_rot_scal_anim_end

gUnknown_83E2E48:: @ 83E2E48
	obj_rot_scal_anim_frame 0, 0, 255, 2
	obj_rot_scal_anim_frame 0, 0, 1, 4
	obj_rot_scal_anim_frame 0, 0, 255, 4
	obj_rot_scal_anim_frame 0, 0, 1, 4
	obj_rot_scal_anim_frame 0, 0, 255, 4
	obj_rot_scal_anim_frame 0, 0, 1, 2
	obj_rot_scal_anim_end

gUnknown_83E2E80:: @ 83E2E80
	.4byte gUnknown_83E2E28
	.4byte gUnknown_83E2E48

gUnknown_83E2E88:: @ 83E2E88
	spr_template 10224, 10224, gOamData_AffineNormal_ObjNormal_32x32, gUnknown_83E2E24, NULL, gUnknown_83E2E80, sub_80A3518

gUnknown_83E2EA0:: @ 83E2EA0
	spr_template 10224, 10224, gOamData_AffineNormal_ObjNormal_32x32, gUnknown_83E2E24, NULL, gUnknown_83E2E80, sub_80A35F4

gUnknown_83E2EB8:: @ 83E2EB8
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 8, 4
	obj_image_anim_frame 12, 4
	obj_image_anim_end

gUnknown_83E2ECC:: @ 83E2ECC
	.4byte gUnknown_83E2EB8

gUnknown_83E2ED0:: @ 83E2ED0
	spr_template 10195, 10195, gOamData_AffineOff_ObjNormal_16x16, gUnknown_83E2ECC, NULL, gDummySpriteAffineAnimTable, sub_80A3670

gUnknown_83E2EE8:: @ 83E2EE8
	spr_template 10224, 10224, gOamData_AffineNormal_ObjNormal_32x32, gUnknown_83E2E24, NULL, gUnknown_83E2E80, sub_80A36B4

gUnknown_83E2F00:: @ 83E2F00
	obj_rot_scal_anim_frame 0, 0, 0, 3
	obj_rot_scal_anim_end

gUnknown_83E2F10:: @ 83E2F10
	obj_rot_scal_anim_frame 0, -10, 0, 3
	obj_rot_scal_anim_frame 0, -6, 0, 3
	obj_rot_scal_anim_frame 0, -2, 0, 3
	obj_rot_scal_anim_frame 0, 0, 0, 3
	obj_rot_scal_anim_frame 0, 2, 0, 3
	obj_rot_scal_anim_frame 0, 6, 0, 3
	obj_rot_scal_anim_frame 0, 10, 0, 3
	obj_rot_scal_anim_end

gUnknown_83E2F50:: @ 83E2F50
	.4byte gUnknown_83E2F00
	.4byte gUnknown_83E2F10
	.4byte gUnknown_83E2E28
	.4byte gUnknown_83E2E48

gUnknown_83E2F60:: @ 83E2F60
	spr_template 10224, 10224, gOamData_AffineNormal_ObjNormal_32x32, gUnknown_83E2E24, NULL, gUnknown_83E2F50, sub_80A37BC

gUnknown_83E2F78:: @ 83E2F78
	.byte 0x05, 0x18, 0x01, 0x00, 0x04, 0x00, 0x08, 0x10, 0xff, 0x00, 0x02, 0x00, 0x08, 0x10, 0x01, 0x00, 0x02, 0x00, 0x08, 0x10, 0x01, 0x00, 0x02, 0x00, 0x08, 0x10, 0x01, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x7f, 0x00, 0x00, 0x00

gUnknown_83E2F9C:: @ 83E2F9C
	obj_image_anim_frame 28, 1
	obj_image_anim_end

gUnknown_83E2FA4:: @ 83E2FA4
	obj_image_anim_frame 32, 1
	obj_image_anim_end

gUnknown_83E2FAC:: @ 83E2FAC
	obj_image_anim_frame 20, 1
	obj_image_anim_end

gUnknown_83E2FB4:: @ 83E2FB4
	obj_image_anim_frame 28, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

gUnknown_83E2FBC:: @ 83E2FBC
	obj_image_anim_frame 16, 1
	obj_image_anim_end

gUnknown_83E2FC4:: @ 83E2FC4
	obj_image_anim_frame 16, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

gUnknown_83E2FCC:: @ 83E2FCC
	obj_image_anim_frame 28, 1
	obj_image_anim_end

gUnknown_83E2FD4:: @ 83E2FD4
	.4byte gUnknown_83E2F9C
	.4byte gUnknown_83E2FA4
	.4byte gUnknown_83E2FAC
	.4byte gUnknown_83E2FB4
	.4byte gUnknown_83E2FBC
	.4byte gUnknown_83E2FC4
	.4byte gUnknown_83E2FCC

gUnknown_83E2FF0:: @ 83E2FF0
	spr_template 10063, 10063, gOamData_AffineOff_ObjNormal_16x16, gUnknown_83E2FD4, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_83E3008:: @ 83E3008
	obj_rot_scal_anim_frame 256, 256, 0, 0
	obj_rot_scal_anim_frame 0, 0, 4, 1
	obj_rot_scal_anim_jump 1

gUnknown_83E3020:: @ 83E3020
	.4byte gUnknown_83E3008

gUnknown_83E3024:: @ 83E3024
	spr_template 10159, 10159, gOamData_AffineOff_ObjNormal_8x8, gUnknown_83E2B90, NULL, gDummySpriteAffineAnimTable, sub_80A4040

gUnknown_83E303C:: @ 83E303C
	spr_template 10159, 10159, gOamData_AffineNormal_ObjNormal_16x16, gUnknown_83E2B8C, NULL, gUnknown_83E3020, sub_80A4040

gUnknown_83E3054:: @ 83E3054
	obj_rot_scal_anim_frame 256, 256, 0, 0
	obj_rot_scal_anim_frame 0, 0, 246, 1
	obj_rot_scal_anim_jump 1

gUnknown_83E306C:: @ 83E306C
	obj_rot_scal_anim_frame 192, 192, 0, 0
	obj_rot_scal_anim_frame 0, 0, 244, 1
	obj_rot_scal_anim_jump 1

gUnknown_83E3084:: @ 83E3084
	obj_rot_scal_anim_frame 143, 143, 0, 0
	obj_rot_scal_anim_frame 0, 0, 241, 1
	obj_rot_scal_anim_jump 1

gUnknown_83E309C:: @ 83E309C
	.4byte gUnknown_83E3054

gUnknown_83E30A0:: @ 83E30A0
	.4byte gUnknown_83E306C

gUnknown_83E30A4:: @ 83E30A4
	.4byte gUnknown_83E3084

gUnknown_83E30A8:: @ 83E30A8
	spr_template 10271, 10271, gOamData_AffineNormal_ObjNormal_16x16, gDummySpriteAnimTable, NULL, gUnknown_83E309C, sub_80A4040

gUnknown_83E30C0:: @ 83E30C0
	spr_template 10271, 10271, gOamData_AffineNormal_ObjNormal_16x16, gDummySpriteAnimTable, NULL, gUnknown_83E30A0, sub_80A4040

gUnknown_83E30D8:: @ 83E30D8
	spr_template 10271, 10271, gOamData_AffineNormal_ObjNormal_16x16, gDummySpriteAnimTable, NULL, gUnknown_83E30A4, sub_80A4040

gUnknown_83E30F0:: @ 83E30F0
	.2byte 0x001f, 0x027f, 0x03ff, 0x03e0, 0x7dc5, 0x7d56, 0x7eb6, 0x0000

gUnknown_83E3100:: @ 83E3100
	spr_template 10266, 10266, gOamData_AffineNormal_ObjNormal_16x16, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A4298

gUnknown_83E3118:: @ 83E3118
	obj_image_anim_frame 64, 3
	obj_image_anim_frame 80, 3
	obj_image_anim_frame 96, 3
	obj_image_anim_frame 112, 6
	obj_image_anim_end

gUnknown_83E312C:: @ 83E312C
	obj_image_anim_frame 64, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 80, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 96, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 112, 6, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

gUnknown_83E3140:: @ 83E3140
	.4byte gUnknown_83E3118
	.4byte gUnknown_83E312C

gUnknown_83E3148:: @ 83E3148
	spr_template 10056, 10056, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E3140, NULL, gDummySpriteAffineAnimTable, sub_80A4450

gUnknown_83E3160:: @ 83E3160
	spr_template 10287, 10287, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E3140, NULL, gDummySpriteAffineAnimTable, sub_80A4450

gUnknown_83E3178:: @ 83E3178
	obj_image_anim_frame 0x0000, 4
	obj_image_anim_frame 0x0010, 4
	obj_image_anim_frame 0x0020, 4
	obj_image_anim_frame 0x0030, 4
	obj_image_anim_frame 0x0040, 5
	obj_image_anim_end

gUnknown_83E3190:: @ 83E3190
	.4byte gUnknown_83E3178

gUnknown_83E3194:: @ 83E3194
	spr_template 10021, 10021, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E3190, NULL, gDummySpriteAffineAnimTable, sub_80A43F8

gUnknown_83E31AC:: @ 83E31AC
	spr_template 10022, 10022, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E3190, NULL, gDummySpriteAffineAnimTable, sub_80A43F8

gUnknown_83E31C4:: @ 83E31C4
	obj_rot_scal_anim_frame 256, 256, 0, 0
	obj_rot_scal_anim_end

gUnknown_83E31D4::
	obj_rot_scal_anim_frame 256, 256, 32, 0
	obj_rot_scal_anim_end

gUnknown_83E31E4::
	obj_rot_scal_anim_frame 256, 256, 64, 0
	obj_rot_scal_anim_end

gUnknown_83E31F4::
	obj_rot_scal_anim_frame 256, 256, 96, 0
	obj_rot_scal_anim_end

gUnknown_83E3204::
	obj_rot_scal_anim_frame 256, 256, 128, 0
	obj_rot_scal_anim_end

gUnknown_83E3214::
	obj_rot_scal_anim_frame 256, 256, 160, 0
	obj_rot_scal_anim_end

gUnknown_83E3224::
	obj_rot_scal_anim_frame 256, 256, 192, 0
	obj_rot_scal_anim_end

gUnknown_83E3234::
	obj_rot_scal_anim_frame 256, 256, 224, 0
	obj_rot_scal_anim_end

gUnknown_83E3244::
	.4byte gUnknown_83E31C4
	.4byte gUnknown_83E31D4
	.4byte gUnknown_83E31E4
	.4byte gUnknown_83E31F4
	.4byte gUnknown_83E3204
	.4byte gUnknown_83E3214
	.4byte gUnknown_83E3224
	.4byte gUnknown_83E3234

gUnknown_83E3264::
	spr_template 10143, 10143, gOamData_AffineNormal_ObjNormal_32x32, gDummySpriteAnimTable, NULL, gUnknown_83E3244, sub_80A4494

gUnknown_83E327C:: @ 83E327C
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 32, 5
	obj_image_anim_frame 48, 5
	obj_image_anim_end

gUnknown_83E3290:: @ 83E3290
	.4byte gUnknown_83E327C

gUnknown_83E3294:: @ 83E3294
	spr_template 10138, 10138, gOamData_AffineOff_ObjBlend_32x32, gUnknown_83E3290, NULL, gDummySpriteAffineAnimTable, sub_80A44E0

gUnknown_83E32AC:: @ 83E32AC
	spr_template 10138, 10138, gOamData_AffineOff_ObjBlend_32x32, gUnknown_83E3290, NULL, gDummySpriteAffineAnimTable, sub_80A4588

gUnknown_83E32C4:: @ 83E32C4
	obj_image_anim_frame 0x0000, 1
	obj_image_anim_end

gUnknown_83E32CC::
	obj_image_anim_frame 0x0004, 1
	obj_image_anim_end

gUnknown_83E32D4::
	obj_image_anim_frame 0x0008, 1
	obj_image_anim_end

gUnknown_83E32DC::
	obj_image_anim_frame 0x000c, 1
	obj_image_anim_end

gUnknown_83E32E4::
	obj_image_anim_frame 0x0010, 1
	obj_image_anim_end

gUnknown_83E32EC::
	obj_image_anim_frame 0x0014, 1
	obj_image_anim_end

gUnknown_83E32F4::
	obj_image_anim_frame 0x0000, 1, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

gUnknown_83E32FC::
	obj_image_anim_frame 0x0004, 1, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

gUnknown_83E3304::
	obj_image_anim_frame 0x0008, 1, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

gUnknown_83E330C::
	obj_image_anim_frame 0x000c, 1, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

gUnknown_83E3314::
	.4byte gUnknown_83E32C4
	.4byte gUnknown_83E32CC
	.4byte gUnknown_83E32D4
	.4byte gUnknown_83E32DC
	.4byte gUnknown_83E32E4
	.4byte gUnknown_83E32EC
	.4byte gUnknown_83E32F4
	.4byte gUnknown_83E32FC
	.4byte gUnknown_83E3304
	.4byte gUnknown_83E330C

gUnknown_83E333C::
	spr_template 10072, 10072, gOamData_AffineOff_ObjNormal_16x16, gUnknown_83E3314, NULL, gDummySpriteAffineAnimTable, sub_80A481C

gUnknown_83E3354:: @ 83E3354
	spr_template 10280, 10280, gOamData_AffineOff_ObjBlend_64x64, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A48F0

gUnknown_83E336C:: @ 83E336C
	obj_rot_scal_anim_frame 256, 256, 0, 0
	obj_rot_scal_anim_end

gUnknown_83E337C:: @ 83E337C
	obj_rot_scal_anim_frame 0, 0, 2, 12
	obj_rot_scal_anim_frame 0, 0, 0, 6
	obj_rot_scal_anim_frame 0, 0, 254, 24
	obj_rot_scal_anim_frame 0, 0, 0, 6
	obj_rot_scal_anim_frame 0, 0, 2, 12
	obj_rot_scal_anim_jump 0

gUnknown_83E33AC:: @ 83E33AC
	.4byte gUnknown_83E336C
	.4byte gUnknown_83E337C

gUnknown_83E33B4:: @ 83E33B4
	spr_template 10099, 10099, gOamData_AffineNormal_ObjBlend_32x32, gDummySpriteAnimTable, NULL, gUnknown_83E33AC, sub_80A4ACC

gUnknown_83E33CC:: @ 83E33CC
	obj_image_anim_frame 0, 7
	obj_image_anim_frame 16, 7
	obj_image_anim_frame 32, 7
	obj_image_anim_frame 48, 7
	obj_image_anim_frame 64, 7
	obj_image_anim_frame 80, 7
	obj_image_anim_frame 96, 7
	obj_image_anim_frame 112, 7
	obj_image_anim_jump 0

gUnknown_83E33F0:: @ 83E33F0
	.4byte gUnknown_83E33CC

gUnknown_83E33F4:: @ 83E33F4
	spr_template 10049, 10049, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E33F0, NULL, gDummySpriteAffineAnimTable, sub_80A4D0C

gUnknown_83E340C:: @ 83E340C
	spr_template 10049, 10049, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E33F0, NULL, gDummySpriteAffineAnimTable, sub_80A4D5C

gUnknown_83E3424:: @ 83E3424
	obj_image_anim_frame 0x0000, 10
	obj_image_anim_frame 0x0004, 10
	obj_image_anim_frame 0x0008, 10
	obj_image_anim_frame 0x000c, 10
	obj_image_anim_frame 0x0010, 26
	obj_image_anim_frame 0x0010, 5
	obj_image_anim_frame 0x0014, 5
	obj_image_anim_frame 0x0018, 15
	obj_image_anim_end

gUnknown_83E3448::
	obj_image_anim_frame 0x0000, 10, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0x0004, 10, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0x0008, 10, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0x000c, 10, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0x0010, 26, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0x0010, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0x0014, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0x0018, 15, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

gUnknown_83E346C::
	.4byte gUnknown_83E3424
	.4byte gUnknown_83E3448

gUnknown_83E3474::
	spr_template 10032, 10032, gOamData_AffineOff_ObjNormal_16x16, gUnknown_83E346C, NULL, gDummySpriteAffineAnimTable, sub_80A4E40

gUnknown_83E348C:: @ 83E348C
	obj_image_anim_frame 0, 40
	obj_image_anim_end

gUnknown_83E3494:: @ 83E3494
	.4byte gUnknown_83E348C

gUnknown_83E3498:: @ 83E3498
	obj_rot_scal_anim_frame 20, 20, 226, 0
	obj_rot_scal_anim_frame 8, 8, 1, 24
	obj_rot_scal_anim_end

gUnknown_83E34B0:: @ 83E34B0
	obj_rot_scal_anim_loop 0
	obj_rot_scal_anim_frame 0, 0, 1, 24
	obj_rot_scal_anim_loop 10

gUnknown_83E34C8:: @ 83E34C8
	obj_rot_scal_anim_frame 20, 20, 30, 0
	obj_rot_scal_anim_frame 8, 8, 255, 24
	obj_rot_scal_anim_end

gUnknown_83E34E0:: @ 83E34E0
	obj_rot_scal_anim_loop 0
	obj_rot_scal_anim_frame 0, 0, 255, 24
	obj_rot_scal_anim_loop 10

gUnknown_83E34F8:: @ 83E34F8
	.4byte gUnknown_83E3498
	.4byte gUnknown_83E34C8

gUnknown_83E3500:: @ 83E3500
	spr_template 10228, 10228, gOamData_AffineNormal_ObjNormal_32x32, gUnknown_83E3494, NULL, gUnknown_83E34F8, sub_80A4EF4

gUnknown_83E3518:: @ 83E3518
	spr_template 10014, 10014, gOamData_AffineOff_ObjNormal_32x32, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A4FAC

gUnknown_83E3530:: @ 83E3530
	spr_template 10014, 10014, gOamData_AffineOff_ObjNormal_16x16, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A5298

gUnknown_83E3548:: @ 83E3548
	.byte 0x40, 0x40, 0x00, 0xc0, 0xc0, 0x40, 0x20, 0xe0

gUnknown_83E3550:: @ 83E3550
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A5340
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A5590

gUnknown_83E3580:: @ 83E3580
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 48, 4
	obj_image_anim_end

gUnknown_83E3594:: @ 83E3594
	obj_image_anim_frame 48, 4
	obj_image_anim_end

gUnknown_83E359C:: @ 83E359C
	.4byte gUnknown_83E3580
	.4byte gUnknown_83E3594

gUnknown_83E35A4:: @ 83E35A4
	spr_template 10183, 10183, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E359C, NULL, gDummySpriteAffineAnimTable, sub_80A5940

gUnknown_83E35BC:: @ 83E35BC
	spr_template 10286, 10286, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E359C, NULL, gDummySpriteAffineAnimTable, sub_80A59A8

gUnknown_83E35D4:: @ 83E35D4
	spr_template 10286, 10286, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E359C, NULL, gDummySpriteAffineAnimTable, sub_80A59F0

gUnknown_83E35EC:: @ 83E35EC
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 8, 12
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 24, 4
	obj_image_anim_end

gUnknown_83E3600:: @ 83E3600
	.4byte gUnknown_83E35EC

gUnknown_83E3604:: @ 83E3604
	spr_template 10184, 10184, gOamData_AffineOff_ObjNormal_16x32, gUnknown_83E3600, NULL, gDummySpriteAffineAnimTable, sub_80A5AD8

gUnknown_83E361C:: @ 83E361C
	obj_image_anim_frame 0, 18
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 16, 18
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 32, 18
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 32, 6
	obj_image_anim_frame 48, 18
	obj_image_anim_frame 32, 6
	obj_image_anim_frame 48, 6
	obj_image_anim_frame 64, 18
	obj_image_anim_frame 48, 6
	obj_image_anim_frame 64, 54
	obj_image_anim_end

gUnknown_83E3658:: @ 83E3658
	.4byte gUnknown_83E361C

gUnknown_83E365C:: @ 83E365C
	spr_template 10185, 10185, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E3658, NULL, gDummySpriteAffineAnimTable, sub_80A5B7C

gUnknown_83E3674:: @ 83E3674
	spr_template 10017, 10017, gOamData_AffineOff_ObjNormal_8x8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, TranslateAnimSpriteToTargetMonLocation

gUnknown_83E368C:: @ 83E368C
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_frame 64, 3
	obj_image_anim_end

gUnknown_83E36A4:: @ 83E36A4
	.4byte gUnknown_83E368C

gUnknown_83E36A8:: @ 83E36A8
	spr_template 10030, 10030, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E36A4, NULL, gDummySpriteAffineAnimTable, AnimSpriteOnMonPos

gUnknown_83E36C0:: @ 83E36C0
	obj_image_anim_frame 3, 5
	obj_image_anim_frame 2, 5
	obj_image_anim_frame 1, 5
	obj_image_anim_frame 0, 5
	obj_image_anim_end

gUnknown_83E36D4:: @ 83E36D4
	.4byte gUnknown_83E36C0

gUnknown_83E36D8:: @ 83E36D8
	obj_rot_scal_anim_frame 512, 512, 0, 0
	obj_rot_scal_anim_end

gUnknown_83E36E8:: @ 83E36E8
	.4byte gUnknown_83E36D8

gUnknown_83E36EC:: @ 83E36EC
	spr_template 10018, 10018, gOamData_AffineDouble_ObjBlend_8x8, gUnknown_83E36D4, NULL, gUnknown_83E36E8, sub_80A5C68

gUnknown_83E3704:: @ 83E3704
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 1, 5
	obj_image_anim_frame 2, 5
	obj_image_anim_frame 3, 5
	obj_image_anim_end

gUnknown_83E3718:: @ 83E3718
	.4byte gUnknown_83E3704

gUnknown_83E371C:: @ 83E371C
	spr_template 10018, 10018, gOamData_AffineDouble_ObjBlend_8x8, gUnknown_83E3718, NULL, gUnknown_83E36E8, sub_80A5D4C

gUnknown_83E3734:: @ 83E3734
	spr_template 10194, 10194, gOamData_AffineOff_ObjBlend_64x64, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A5EE0

gUnknown_83E374C:: @ 83E374C
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 4, 8
	obj_image_anim_frame 8, 8
	obj_image_anim_frame 12, 8
	obj_image_anim_jump 0

gUnknown_83E3760:: @ 83E3760
	.4byte gUnknown_83E374C

gUnknown_83E3764:: @ 83E3764
	spr_template 10195, 10195, gOamData_AffineOff_ObjNormal_16x16, gUnknown_83E3760, NULL, gDummySpriteAffineAnimTable, sub_80A5F40

gUnknown_83E377C:: @ 83E377C
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 32, 2
	obj_image_anim_frame 48, 3
	obj_image_anim_frame 64, 5
	obj_image_anim_frame 80, 3
	obj_image_anim_frame 96, 2
	obj_image_anim_frame 0, 2
	obj_image_anim_end

gUnknown_83E37A0:: @ 83E37A0
	.4byte gUnknown_83E377C

gUnknown_83E37A4:: @ 83E37A4
	spr_template 10031, 10031, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E37A0, NULL, gDummySpriteAffineAnimTable, AnimSpriteOnMonPos

gUnknown_83E37BC:: @ 83E37BC
	spr_template 10020, 10020, gOamData_AffineOff_ObjNormal_32x32, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A6244

gUnknown_83E37D4:: @ 83E37D4
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 32, 2
	obj_image_anim_frame 48, 2
	obj_image_anim_end

gUnknown_83E37E8:: @ 83E37E8
	.4byte gUnknown_83E37D4

gUnknown_83E37EC:: @ 83E37EC
	spr_template 10192, 10192, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E37E8, NULL, gDummySpriteAffineAnimTable, sub_80A65CC

gUnknown_83E3804:: @ 83E3804
	obj_image_anim_frame 0x0000, 10
	obj_image_anim_end

gOamData_83E380C::
	obj_image_anim_frame 0x0004, 10
	obj_image_anim_end

gUnknown_83E3814:: @ 83E3814
	obj_image_anim_frame 0x0008, 41
	obj_image_anim_end

gUnknown_83E381C:: @ 83E381C
	obj_image_anim_frame 0x000c, 10
	obj_image_anim_end

gUnknown_83E3824:: @ 83E3824
	obj_image_anim_frame 0x0010, 10
	obj_image_anim_end

gUnknown_83E382C:: @ 83E382C
	obj_image_anim_frame 0x0014, 10
	obj_image_anim_end
	obj_image_anim_frame 0x0000, 10, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end
	obj_image_anim_frame 0x0004, 10, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

gUnknown_83E3844:: @ 83E3844
	spr_template 14340, 2110, gOamData_83E380C, gUnknown_83E3814, gUnknown_83E381C, gUnknown_83E3824, gUnknown_83E382C

gUnknown_83E385C:: @ 83E385C
	.4byte 0x83e3834
	.4byte 0x83e383c

gUnknown_83E3864:: @ 83E3864
	obj_rot_scal_anim_frame 12, 12, 0, 16
	obj_rot_scal_anim_frame -12, -12, 0, 16
	obj_rot_scal_anim_jump 0

gUnknown_83E387C:: @ 83E387C
	.4byte gUnknown_83E3864

gUnknown_83E3880:: @ 83E3880
	spr_template 10072, 10072, gOamData_AffineDouble_ObjNormal_16x16, gUnknown_83E3844, NULL, gUnknown_83E387C, sub_80A66D4

gUnknown_83E3898:: @ 83E3898
	.2byte 0x2758, 0x7fff, 0x735f, 0x6adf, 0x623f, 0x59bf, 0x2771, 0x7fff, 0x6bf9, 0x57f4, 0x43ef, 0x33ea, 0x27c9, 0x7fff, 0x63ff, 0x47ff
	.2byte 0x2bff, 0x0fff, 0x27bf, 0x7fff, 0x7f9a, 0x7f55, 0x7f10, 0x7ecc

gUnknown_83E38C8:: @ 83E38C8
	spr_template 10072, 10072, gOamData_AffineDouble_ObjNormal_16x16, gUnknown_83E3844, NULL, gUnknown_83E387C, sub_80A68B0

gUnknown_83E38E0:: @ 83E38E0
	spr_template 10193, 10193, gOamData_AffineOff_ObjNormal_32x32, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A69B8

gUnknown_83E38F8:: @ 83E38F8
	obj_rot_scal_anim_frame 160, 160, 0, 0
	obj_rot_scal_anim_frame 4, 4, 0, 1
	obj_rot_scal_anim_jump 1

gUnknown_83E3910:: @ 83E3910
	.4byte gUnknown_83E38F8

gUnknown_83E3914:: @ 83E3914
	spr_template 10072, 10072, gOamData_AffineDouble_ObjNormal_16x16, gUnknown_83E3844, NULL, gUnknown_83E3910, sub_80A6A28

gUnknown_83E392C:: @ 83E392C
	obj_image_anim_frame 0, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 48, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

gUnknown_83E3940:: @ 83E3940
	obj_image_anim_frame 48, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

gUnknown_83E3954:: @ 83E3954
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 32, 2
	obj_image_anim_frame 48, 2
	obj_image_anim_end

gUnknown_83E3968:: @ 83E3968
	obj_image_anim_frame 48, 2
	obj_image_anim_frame 32, 2
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 0, 2
	obj_image_anim_end

gUnknown_83E397C:: @ 83E397C
	.4byte gUnknown_83E392C
	.4byte gUnknown_83E3954
	.4byte gUnknown_83E3940
	.4byte gUnknown_83E3968

gUnknown_83E398C:: @ 83E398C
	spr_template 10209, 10209, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E397C, NULL, gDummySpriteAffineAnimTable, sub_80A6B64

gUnknown_83E39A4:: @ 83E39A4
	obj_rot_scal_anim_frame 16, 16, 0, 0
	obj_rot_scal_anim_frame 30, 30, 0, 8
	obj_rot_scal_anim_end

gUnknown_83E39BC:: @ 83E39BC
	obj_rot_scal_anim_frame 0, 0, 4, 11
	obj_rot_scal_anim_frame 0, 0, 252, 11
	obj_rot_scal_anim_loop 2
	obj_rot_scal_anim_frame -30, -30, 0, 8
	obj_rot_scal_anim_end

gUnknown_83E39E4:: @ 83E39E4
	obj_rot_scal_anim_frame 16, 16, 0, 0
	obj_rot_scal_anim_frame 30, 30, 0, 8
	obj_rot_scal_anim_frame 0, 0, 0, 16
	obj_rot_scal_anim_loop 0
	obj_rot_scal_anim_frame 0, 0, 4, 11
	obj_rot_scal_anim_frame 0, 0, 252, 11
	obj_rot_scal_anim_loop 2
	obj_rot_scal_anim_frame -30, -30, 0, 8
	obj_rot_scal_anim_end

gUnknown_83E3A2C:: @ 83E3A2C
	.4byte gUnknown_83E39A4
	.4byte gUnknown_83E39BC

gUnknown_83E3A34:: @ 83E3A34
	spr_template 10064, 10064, gOamData_AffineDouble_ObjNormal_32x32, gDummySpriteAnimTable, NULL, gUnknown_83E3A2C, sub_80A6C08

gUnknown_83E3A4C:: @ 83E3A4C
	spr_template 10064, 10064, gOamData_AffineNormal_ObjNormal_32x32, gDummySpriteAnimTable, NULL, gUnknown_83E3A2C, sub_80A6C84

gUnknown_83E3A64:: @ 83E3A64
	obj_image_anim_frame 0, 1
	obj_image_anim_end

gUnknown_83E3A6C:: @ 83E3A6C
	obj_image_anim_frame 0, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

gUnknown_83E3A74:: @ 83E3A74
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_end

gUnknown_83E3A94:: @ 83E3A94
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

gUnknown_83E3AB4:: @ 83E3AB4
	.4byte gUnknown_83E3A64
	.4byte gUnknown_83E3A6C
	.4byte gUnknown_83E3A74
	.4byte gUnknown_83E3A94

gUnknown_83E3AC4:: @ 83E3AC4
	spr_template 10214, 10214, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E3AB4, NULL, gDummySpriteAffineAnimTable, sub_80A6D90

gUnknown_83E3ADC::
	spr_template 10064, 10064, gOamData_AffineOff_ObjNormal_32x32, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A6E48

gUnknown_83E3AF4:: @ 83E3AF4
	obj_image_anim_frame 0x0004, 1
	obj_image_anim_end

gUnknown_83E3AFC::
	.4byte gUnknown_83E3AF4

gUnknown_83E3B00::
	spr_template 10072, 10072, gOamData_AffineOff_ObjNormal_16x16, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A6E98

gUnknown_83E3B18::
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A6F8C

gUnknown_83E3B30::
	spr_template 10145, 10145, gOamData_AffineNormal_ObjBlend_64x64, gDummySpriteAnimTable, NULL, gUnknown_83E7910, sub_80A7020

gUnknown_83E3B48::
	obj_image_anim_frame 0x0000, 9
	obj_image_anim_frame 0x0010, 3
	obj_image_anim_frame 0x0020, 3
	obj_image_anim_frame 0x0030, 3
	obj_image_anim_end

gUnknown_83E3B5C::
	.4byte gUnknown_83E3B48

gUnknown_83E3B60::
	obj_rot_scal_anim_frame 80, 80, 0, 0
	obj_rot_scal_anim_frame 9, 9, 0, 18
	obj_rot_scal_anim_end

gUnknown_83E3B78::
	.4byte gUnknown_83E3B60

gUnknown_83E3B7C::
	spr_template 10007, 10007, gOamData_AffineNormal_ObjNormal_32x32, gUnknown_83E3B5C, NULL, gUnknown_83E3B78, AnimSpriteOnMonPos

gUnknown_83E3B94:: @ 83E3B94
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 24, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 40, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 48, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_loop 1
	obj_image_anim_end

gUnknown_83E3BB8:: @ 83E3BB8
	.4byte gUnknown_83E3B94

gUnknown_83E3BBC:: @ 83E3BBC
	spr_template 10075, 10075, gOamData_AffineOff_ObjNormal_32x16, gUnknown_83E3BB8, NULL, gDummySpriteAffineAnimTable, sub_80A71D8

gUnknown_83E3BD4:: @ 83E3BD4
	obj_rot_scal_anim_frame 16, 256, 0, 0
	obj_rot_scal_anim_frame 20, 0, 0, 12
	obj_rot_scal_anim_frame 0, 0, 0, 32
	obj_rot_scal_anim_end

gUnknown_83E3BF4:: @ 83E3BF4
	.4byte gUnknown_83E3BD4

gUnknown_83E3BF8:: @ 83E3BF8
	spr_template 10005, 10005, gOamData_AffineNormal_ObjBlend_32x64, gDummySpriteAnimTable, NULL, gUnknown_83E3BF4, sub_80A727C

gUnknown_83E3C10:: @ 83E3C10
	spr_template 10003, 10003, gOamData_AffineDouble_ObjBlend_32x16, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A72C8

gUnknown_83E3C28:: @ 83E3C28
	spr_template 10003, 10003, gOamData_AffineOff_ObjBlend_32x16, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A74A4

gUnknown_83E3C40:: @ 83E3C40
	obj_rot_scal_anim_frame 32, 32, 0, 0
	obj_rot_scal_anim_frame 7, 7, 0, 200
	obj_rot_scal_anim_end

gUnknown_83E3C58:: @ 83E3C58
	obj_rot_scal_anim_frame 5, 5, 0, 10
	obj_rot_scal_anim_frame -10, -10, 0, 10
	obj_rot_scal_anim_frame 10, 10, 0, 10
	obj_rot_scal_anim_frame -10, -10, 0, 10
	obj_rot_scal_anim_frame 10, 10, 0, 10
	obj_rot_scal_anim_frame -10, -10, 0, 10
	obj_rot_scal_anim_frame 10, 10, 0, 10
	obj_rot_scal_anim_end

gUnknown_83E3C98:: @ 83E3C98
	.4byte gUnknown_83E3C40

gUnknown_83E3C9C:: @ 83E3C9C
	.4byte gUnknown_83E3C58

gUnknown_83E3CA0:: @ 83E3CA0
	spr_template 10163, 10163, gOamData_AffineDouble_ObjNormal_16x32, gDummySpriteAnimTable, NULL, gUnknown_83E3C98, TranslateAnimSpriteToTargetMonLocation

gUnknown_83E3CB8:: @ 83E3CB8
	spr_template 10164, 10164, gOamData_AffineDouble_ObjNormal_16x32, gDummySpriteAnimTable, NULL, gUnknown_83E3C98, TranslateAnimSpriteToTargetMonLocation

gUnknown_83E3CD0:: @ 83E3CD0
	spr_template 10260, 10260, gOamData_AffineDouble_ObjNormal_32x64, gDummySpriteAnimTable, NULL, gUnknown_83E3C98, TranslateAnimSpriteToTargetMonLocation

gUnknown_83E3CE8:: @ 83E3CE8
	spr_template 10288, 10288, gOamData_AffineDouble_ObjNormal_16x32, gDummySpriteAnimTable, NULL, gUnknown_83E3C9C, sub_80AC6D8

gUnknown_83E3D00:: @ 83E3D00
	spr_template 10175, 10175, gOamData_AffineOff_ObjNormal_16x16, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, AnimThrowProjectile

gUnknown_83E3D18:: @ 83E3D18
	spr_template 10178, 10178, gOamData_AffineOff_ObjBlend_64x64, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A79E8

gUnknown_83E3D30:: @ 83E3D30
	obj_image_anim_frame 8, 1
	obj_image_anim_end

gUnknown_83E3D38:: @ 83E3D38
	.4byte gUnknown_83E3D30

gUnknown_83E3D3C:: @ 83E3D3C
	obj_rot_scal_anim_frame 0, 0, 10, 1
	obj_rot_scal_anim_jump 0

gUnknown_83E3D4C:: @ 83E3D4C
	.4byte gUnknown_83E3D3C

gUnknown_83E3D50:: @ 83E3D50
	spr_template 10100, 10100, gOamData_AffineNormal_ObjNormal_16x16, gUnknown_83E3D38, NULL, gDummySpriteAffineAnimTable, sub_80A7A88

gUnknown_83E3D68:: @ 83E3D68
	spr_template 10100, 10100, gOamData_AffineNormal_ObjNormal_16x16, gUnknown_83E3D38, NULL, gUnknown_83E3D4C, sub_80A7B3C

gUnknown_83E3D80:: @ 83E3D80
	obj_rot_scal_anim_frame 0, 0, 20, 1
	obj_rot_scal_anim_jump 0

gUnknown_83E3D90:: @ 83E3D90
	.4byte gUnknown_83E3D80

gUnknown_83E3D94:: @ 83E3D94
	spr_template 10006, 10006, gOamData_AffineNormal_ObjNormal_16x16, gDummySpriteAnimTable, NULL, gUnknown_83E3D90, sub_80A7BC4

gUnknown_83E3DAC:: @ 83E3DAC
	obj_rot_scal_anim_frame 16, 256, 0, 0
	obj_rot_scal_anim_frame 4, 0, 0, 40
	obj_rot_scal_anim_end

gUnknown_83E3DC4:: @ 83E3DC4
	.4byte gUnknown_83E3DAC

gUnknown_83E3DC8:: @ 83E3DC8
	spr_template 10009, 10009, gOamData_AffineNormal_ObjNormal_32x64, gDummySpriteAnimTable, NULL, gUnknown_83E3DC4, sub_80A7D04

gUnknown_83E3DE0:: @ 83E3DE0
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 20
	obj_image_anim_end

gUnknown_83E3DF0:: @ 83E3DF0
	obj_image_anim_frame 0, 3, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 16, 3, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 32, 20, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

gUnknown_83E3E00:: @ 83E3E00
	.4byte gUnknown_83E3DE0
	.4byte gUnknown_83E3DF0

gUnknown_83E3E08:: @ 83E3E08
	spr_template 10138, 10138, gOamData_AffineOff_ObjBlend_32x32, gUnknown_83E3E00, NULL, gDummySpriteAffineAnimTable, sub_80A7D64

gUnknown_83E3E20:: @ 83E3E20
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 16, 2
	obj_image_anim_frame 32, 1
	obj_image_anim_end

gUnknown_83E3E30:: @ 83E3E30
	obj_image_anim_frame 0, 2, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 16, 2, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 32, 1, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

gUnknown_83E3E40:: @ 83E3E40
	.4byte gUnknown_83E3E20
	.4byte gUnknown_83E3E30

gUnknown_83E3E48:: @ 83E3E48
	spr_template 10138, 10138, gOamData_AffineOff_ObjBlend_32x32, gUnknown_83E3E40, NULL, gDummySpriteAffineAnimTable, sub_80A7E14

gUnknown_83E3E60:: @ 83E3E60
	obj_rot_scal_anim_frame -6, 4, 0, 8
	obj_rot_scal_anim_frame 10, -10, 0, 8
	obj_rot_scal_anim_frame -4, 6, 0, 8
	obj_rot_scal_anim_end

gUnknown_83E3E80:: @ 83E3E80
	obj_rot_scal_anim_frame -4, -5, 0, 12
	obj_rot_scal_anim_frame 0, 0, 0, 24
	obj_rot_scal_anim_frame 4, 5, 0, 12
	obj_rot_scal_anim_end

gUnknown_83E3EA0:: @ 83E3EA0
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 4, 40, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 12, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

gUnknown_83E3EB4:: @ 83E3EB4
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 4, 40
	obj_image_anim_frame 8, 4
	obj_image_anim_frame 12, 4
	obj_image_anim_end

gUnknown_83E3EC8:: @ 83E3EC8
	.4byte gUnknown_83E3EA0
	.4byte gUnknown_83E3EB4

gUnknown_83E3ED0:: @ 83E3ED0
	spr_template 10086, 10086, gOamData_AffineOff_ObjNormal_16x16, gUnknown_83E3EC8, NULL, gDummySpriteAffineAnimTable, sub_80A851C

gUnknown_83E3EE8:: @ 83E3EE8
	obj_rot_scal_anim_frame 11, 11, 0, 8
	obj_rot_scal_anim_frame -11, -11, 0, 8
	obj_rot_scal_anim_end

gUnknown_83E3F00:: @ 83E3F00
	.4byte gUnknown_83E3EE8

gUnknown_83E3F04:: @ 83E3F04
	spr_template 10087, 10087, gOamData_AffineNormal_ObjNormal_16x16, gDummySpriteAnimTable, NULL, gUnknown_83E3F00, sub_80A85AC

gUnknown_83E3F1C:: @ 83E3F1C
	obj_rot_scal_anim_frame -10, 9, 0, 7
	obj_rot_scal_anim_frame 20, -20, 0, 7
	obj_rot_scal_anim_frame -20, 20, 0, 7
	obj_rot_scal_anim_frame 10, -9, 0, 7
	obj_rot_scal_anim_loop 2
	obj_rot_scal_anim_end

gUnknown_83E3F4C:: @ 83E3F4C
	spr_template 10002, 10002, gOamData_AffineOff_ObjNormal_32x32, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A8A1C

gUnknown_83E3F64:: @ 83E3F64
	spr_template 10197, 10197, gOamData_AffineOff_ObjNormal_32x32, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, AnimSnoreZ

gUnknown_83E3F7C:: @ 83E3F7C
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 16, 5
	obj_image_anim_frame 32, 5
	obj_image_anim_frame 48, 5
	obj_image_anim_end

gUnknown_83E3F90:: @ 83E3F90
	.4byte gUnknown_83E3F7C

gUnknown_83E3F94:: @ 83E3F94
	spr_template 10198, 10198, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E3F90, NULL, gDummySpriteAffineAnimTable, AnimSpriteOnMonPos

gUnknown_83E3FAC:: @ 83E3FAC
	obj_rot_scal_anim_frame 0, 0, 248, 2
	obj_rot_scal_anim_frame 0, 0, 8, 4
	obj_rot_scal_anim_frame 0, 0, 248, 2
	obj_rot_scal_anim_jump 0

gUnknown_83E3FCC:: @ 83E3FCC
	obj_rot_scal_anim_frame 256, 256, 0, 0
	obj_rot_scal_anim_end

gUnknown_83E3FDC:: @ 83E3FDC
	obj_rot_scal_anim_frame -8, 4, 0, 8
	obj_rot_scal_anim_loop 0
	obj_rot_scal_anim_frame 16, -8, 0, 8
	obj_rot_scal_anim_frame -16, 8, 0, 8
	obj_rot_scal_anim_loop 1
	obj_rot_scal_anim_frame 256, 256, 0, 0
	obj_rot_scal_anim_frame 0, 0, 0, 15
	obj_rot_scal_anim_end

gUnknown_83E401C:: @ 83E401C
	.4byte gUnknown_83E3FAC
	.4byte gUnknown_83E3FCC
	.4byte gUnknown_83E3FDC

gUnknown_83E4028:: @ 83E4028
	spr_template 10202, 10202, gOamData_AffineDouble_ObjBlend_32x32, gDummySpriteAnimTable, NULL, gUnknown_83E401C, sub_80A8F38

gUnknown_83E4040:: @ 83E4040
	obj_rot_scal_anim_frame 16, 16, 0, 0
	obj_rot_scal_anim_frame 16, 16, 0, 30
	obj_rot_scal_anim_end 1

gUnknown_83E4058:: @ 83E4058
	obj_rot_scal_anim_frame 16, 16, 0, 0
	obj_rot_scal_anim_frame 32, 32, 0, 15
	obj_rot_scal_anim_end 1

gUnknown_83E4070:: @ 83E4070
	obj_rot_scal_anim_frame 16, 16, 0, 0
	obj_rot_scal_anim_frame 11, 11, 0, 45
	obj_rot_scal_anim_end 1

gUnknown_83E4088:: @ 83E4088
	.4byte gUnknown_83E4040
	.4byte gUnknown_83E4058

gUnknown_83E4090:: @ 83E4090
	.4byte gUnknown_83E4070

gUnknown_83E4094:: @ 83E4094
	spr_template 10203, 10203, gOamData_AffineDouble_ObjNormal_64x64, gDummySpriteAnimTable, NULL, gUnknown_83E4088, AnimSpriteOnMonPos

gUnknown_83E40AC:: @ 83E40AC
	obj_rot_scal_anim_frame 512, 512, 0, 0
	obj_rot_scal_anim_frame -16, -16, 0, 30
	obj_rot_scal_anim_end 1

gUnknown_83E40C4:: @ 83E40C4
	.4byte gUnknown_83E40AC

gUnknown_83E40C8:: @ 83E40C8
	spr_template 10203, 10203, gOamData_AffineDouble_ObjBlend_64x64, gDummySpriteAnimTable, NULL, gUnknown_83E40C4, AnimSpriteOnMonPos

gUnknown_83E40E0:: @ 83E40E0
	spr_template 10203, 10203, gOamData_AffineDouble_ObjBlend_64x64, gDummySpriteAnimTable, NULL, gUnknown_83E4088, sub_80A8BC4

gUnknown_83E40F8:: @ 83E40F8
	spr_template 10203, 10203, gOamData_AffineDouble_ObjBlend_64x64, gDummySpriteAnimTable, NULL, gUnknown_83E4090, sub_80A8CA4

gUnknown_83E4110:: @ 83E4110
	spr_template 10203, 10203, gOamData_AffineDouble_ObjBlend_64x64, gDummySpriteAnimTable, NULL, gUnknown_83E4088, sub_80A8EE8

gUnknown_83E4128:: @ 83E4128
	obj_rot_scal_anim_frame 96, -13, 0, 8
	obj_rot_scal_anim_end

gUnknown_83E4138:: @ 83E4138
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 4, 3
	obj_image_anim_frame 8, 3
	obj_image_anim_frame 4, 3
	obj_image_anim_frame 0, 3
	obj_image_anim_end

gUnknown_83E4150:: @ 83E4150
	.4byte gUnknown_83E4138

gUnknown_83E4154:: @ 83E4154
	spr_template 10207, 10207, gOamData_AffineOff_ObjNormal_16x16, gUnknown_83E4150, NULL, gDummySpriteAffineAnimTable, sub_80A9648

gUnknown_83E416C:: @ 83E416C
	.byte 0x1e, 0x1c, 0xec, 0x18, 0x10, 0x1a, 0xf6, 0x1c

gUnknown_83E4174:: @ 83E4174
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 32, 15
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 16, 6, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 15, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 6, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 32, 15
	obj_image_anim_frame 16, 6
	obj_image_anim_frame 0, 6
	obj_image_anim_end

gUnknown_83E41AC:: @ 83E41AC
	.4byte gUnknown_83E4174

gUnknown_83E41B0:: @ 83E41B0
	spr_template 10205, 10205, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E41AC, NULL, gDummySpriteAffineAnimTable, AnimSpriteOnMonPos

gUnknown_83E41C8:: @ 83E41C8
	.2byte 10206, 9999, 9998

	.align 2
gUnknown_83E41D0:: @ 83E41D0
	spr_template 10206, 10206, gOamData_AffineOff_ObjNormal_16x16, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A97E8

gUnknown_83E41E8:: @ 83E41E8
	spr_template 10210, 10210, gOamData_AffineOff_ObjNormal_16x16, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A9860

gUnknown_83E4200:: @ 83E4200
	obj_rot_scal_anim_frame 10, -13, 0, 10
	obj_rot_scal_anim_frame -10, 13, 0, 10
	obj_rot_scal_anim_end

gUnknown_83E4218:: @ 83E4218
	spr_template 10216, 10216, gOamData_AffineOff_ObjNormal_16x16, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A9B40

gUnknown_83E4230:: @ 83E4230
	spr_template 10216, 10216, gOamData_AffineOff_ObjNormal_16x16, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A9BC4

gUnknown_83E4248:: @ 83E4248
	spr_template 10216, 10216, gOamData_AffineOff_ObjNormal_16x16, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80A9C4C

gUnknown_83E4260:: @ 83E4260
	obj_rot_scal_anim_frame 128, 128, 0, 0
	obj_rot_scal_anim_frame 8, 8, 0, 1
	obj_rot_scal_anim_jump 1

gUnknown_83E4278:: @ 83E4278
	.4byte gUnknown_83E4260

gUnknown_83E427C:: @ 83E427C
	spr_template 10217, 10217, gOamData_AffineNormal_ObjNormal_16x16, gDummySpriteAnimTable, NULL, gUnknown_83E4278, sub_80AA174

gUnknown_83E4294:: @ 83E4294
	spr_template 10217, 10217, gOamData_AffineDouble_ObjNormal_16x16, gDummySpriteAnimTable, NULL, gUnknown_83E4278, sub_80AA2B0

gUnknown_83E42AC:: @ 83E42AC
	obj_rot_scal_anim_frame 128, 128, 0, 0
	obj_rot_scal_anim_frame 8, 8, 0, 1
	obj_rot_scal_anim_jump 1

gUnknown_83E42C4:: @ 83E42C4
	.4byte gUnknown_83E42AC

gUnknown_83E42C8:: @ 83E42C8
	spr_template 10237, 10237, gOamData_AffineDouble_ObjNormal_8x8, gDummySpriteAnimTable, NULL, gUnknown_83E42C4, sub_80AA37C

gUnknown_83E42E0:: @ 83E42E0
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 8, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_end

gUnknown_83E42F8:: @ 83E42F8
	.4byte gUnknown_83E42E0

gUnknown_83E42FC:: @ 83E42FC
	spr_template 10218, 10218, gOamData_AffineOff_ObjNormal_16x16, gUnknown_83E42F8, NULL, gDummySpriteAffineAnimTable, sub_80AA3F0

gUnknown_83E4314:: @ 83E4314
	obj_image_anim_frame 0, 24
	obj_image_anim_end

gUnknown_83E431C:: @ 83E431C
	.4byte gUnknown_83E4314

gUnknown_83E4320:: @ 83E4320
	spr_template 10220, 10220, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E431C, NULL, gDummySpriteAffineAnimTable, sub_80AA408

gUnknown_83E4338:: @ 83E4338
	spr_template 10219, 10219, gOamData_AffineOff_ObjNormal_16x16, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80AA508

gUnknown_83E4350:: @ 83E4350
	obj_image_anim_frame 0, 3
	obj_image_anim_jump 0

gUnknown_83E4358:: @ 83E4358
	obj_image_anim_frame 16, 3
	obj_image_anim_jump 0

gUnknown_83E4360:: @ 83E4360
	.4byte gUnknown_83E4350
	.4byte gUnknown_83E4358

gUnknown_83E4368:: @ 83E4368
	spr_template 10221, 10221, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E4360, NULL, gDummySpriteAffineAnimTable, sub_80AA58C

gUnknown_83E4380:: @ 83E4380
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 48, 4
	obj_image_anim_end

gUnknown_83E4394:: @ 83E4394
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 48, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

gUnknown_83E43A8:: @ 83E43A8
	.4byte gUnknown_83E4380
	.4byte gUnknown_83E4394

gUnknown_83E43B0:: @ 83E43B0
	spr_template 10222, 10222, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E43A8, NULL, gDummySpriteAffineAnimTable, sub_80AA6B8

gUnknown_83E43C8:: @ 83E43C8
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 16, 8
	obj_image_anim_frame 32, 8
	obj_image_anim_frame 16, 8
	obj_image_anim_end

gUnknown_83E43DC:: @ 83E43DC
	obj_image_anim_frame 16, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

gUnknown_83E43F0:: @ 83E43F0
	.4byte gUnknown_83E43C8
	.4byte gUnknown_83E43DC

gUnknown_83E43F8:: @ 83E43F8
	spr_template 10215, 10215, gOamData_AffineOff_ObjNormal_32x32, gUnknown_83E43F0, NULL, gDummySpriteAffineAnimTable, sub_80AA708

gUnknown_83E4410:: @ 83E4410
	obj_rot_scal_anim_frame -12, 8, 0, 4
	obj_rot_scal_anim_frame 20, -20, 0, 4
	obj_rot_scal_anim_frame -8, 12, 0, 4
	obj_rot_scal_anim_end

gUnknown_83E4430:: @ 83E4430
	spr_template 10225, 10225, gOamData_AffineOff_ObjNormal_32x32, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80AA838

gUnknown_83E4448:: @ 83E4448
	obj_rot_scal_anim_frame 0, 0, 0, 5
	obj_rot_scal_anim_end

gUnknown_83E4458:: @ 83E4458
	obj_rot_scal_anim_frame 0, 0, 248, 16
	obj_rot_scal_anim_end 1

gUnknown_83E4468:: @ 83E4468
	obj_rot_scal_anim_frame 0, 0, 8, 16
	obj_rot_scal_anim_end 1

gUnknown_83E4478:: @ 83E4478
	.4byte gUnknown_83E4448
	.4byte gUnknown_83E4458
	.4byte gUnknown_83E4468

gUnknown_83E4484:: @ 83E4484
	spr_template 10206, 10206, gOamData_AffineNormal_ObjNormal_16x16, gUnknown_83E3844, NULL, gUnknown_83E4478, sub_80AA998

gUnknown_83E449C:: @ 83E449C
	spr_template 10206, 10206, gOamData_AffineNormal_ObjNormal_16x16, gUnknown_83E3844, NULL, gUnknown_83E4478, sub_80AA938

gUnknown_83E44B4:: @ 83E44B4
	obj_rot_scal_anim_frame 256, 256, 0, 0
	obj_rot_scal_anim_end

gUnknown_83E44C4:: @ 83E44C4
	obj_rot_scal_anim_frame 512, 256, 0, 0
	obj_rot_scal_anim_end

gUnknown_83E44D4:: @ 83E44D4
	.4byte gUnknown_83E44B4
	.4byte gUnknown_83E44C4

gUnknown_83E44DC:: @ 83E44DC
	spr_template 10244, 10244, gOamData_AffineDouble_ObjBlend_64x32, gDummySpriteAnimTable, NULL, gUnknown_83E44D4, sub_80AAAE4

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
	spr_template 10165, 10165, gOamData_AffineDouble_ObjNormal_16x32, gDummySpriteAnimTable, NULL, gUnknown_83E3C98, sub_80AB024

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
