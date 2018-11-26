	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_845FC2C:: @ 845FC2C
	.4byte 0x000f0000, 0x000f0010, 0x0000fffe

gUnknown_845FC38::
	.4byte gUnknown_845FC2C

gOamData_845FC3C::
	.4byte 0x80000000, 0x00000800

gUnknown_845FC44:: @ 845FC44
	spr_template 1000, 1000, gOamData_845FC3C, gUnknown_845FC38, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_845FC5C::
	.4byte 0x00000000, 0x00000000

gOamData_845FC64::
	.4byte 0x80008000, 0x00000800

gUnknown_845FC6C::
	.4byte 0x000a0000, 0x0000ffff

gUnknown_845FC74::
	.4byte gUnknown_845FC6C

gUnknown_845FC78:: @ 845FC78
	spr_template 1001, 0xffff, gOamData_845FC64, gUnknown_845FC74, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_845FC90:: @ 845FC90
	.4byte 0x000a0000, 0x0000ffff

gUnknown_845FC98::
	.4byte gUnknown_845FC90

gOamData_845FC9C::
	.4byte 0x80000100, 0x00000000

gUnknown_845FCA4::
	.4byte 0x00000000, 0x00001404, 0x00007ffe, 0x00000000

gUnknown_845FCB4:: @ 845FCB4
	.4byte gUnknown_845FCA4

gUnknown_845FCB8:: @ 845FCB8
	spr_template 1002, 1002, gOamData_845FC9C, gUnknown_845FC98, NULL, gUnknown_845FCB4, sub_812D840

gUnknown_845FCD0:: @ 845FCD0
	.4byte 0x000f0000, 0x0000ffff

gUnknown_845FCD8::
	.4byte gUnknown_845FCD0

gOamData_845FCDC::
	.4byte 0xc0000000, 0x00000000

gUnknown_845FCE4:: @ 845FCE4
	spr_template 1006, 0xffff, gOamData_845FCDC, gUnknown_845FCD8, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_845FCFC:: @ 845FCFC
	spr_template 1007, 0xffff, gOamData_845FCDC, gUnknown_845FCD8, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_845FD14:: @ 845FD14
	spr_template 1008, 0xffff, gOamData_845FCDC, gUnknown_845FCD8, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_845FD2C:: @ 845FD2C
	spr_template 1009, 0xffff, gOamData_845FCDC, gUnknown_845FCD8, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_845FD44:: @ 845FD44
	.byte 0x02, 0x28, 0x1a, 0x03, 0x28, 0x64, 0x00, 0x00, 0x00, 0x00, 0xec, 0x03, 0xff, 0xff, 0x01, 0x00
