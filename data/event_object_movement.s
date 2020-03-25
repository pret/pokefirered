	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2
gReflectionEffectPaletteMap:: @ 835B934
	.byte 0x01, 0x01, 0x06, 0x07, 0x08, 0x09, 0x06, 0x07, 0x08, 0x09, 0x0b, 0x0b, 0x00, 0x00, 0x00, 0x00

gCameraSpriteTemplate:: @ 835B944
	spr_template 0, 65535, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, ObjectCB_CameraObject

gCameraObjectFuncs:: @ 835B95C
	.4byte CameraObject_0
	.4byte CameraObject_1
	.4byte CameraObject_2

@9186
