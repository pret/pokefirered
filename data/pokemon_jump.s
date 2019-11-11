	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_846AFE8:: @ 846AFE8
	.incbin "graphics/misc/unk_846B008.gbapal"

gUnknown_846B008:: @ 846B008
	.incbin "graphics/misc/unk_846B008.4bpp.lz"

gUnknown_846B42C:: @ 846B42C
	obj_tiles gUnknown_846B008, 0x0c00, 0x2000
	null_obj_tiles

gUnknown_846B43C:: @ 846B43C
	obj_pal gUnknown_846AFE8, 0x2000
	null_obj_pal

gUnknown_846B44C:: @ 846B44C
	obj_image_anim_frame 0x00, 0
	obj_image_anim_end

gUnknown_846B454:: @ 846B454
	obj_image_anim_frame 0x10, 0
	obj_image_anim_end

gUnknown_846B45C:: @ 846B45C
	obj_image_anim_frame 0x20, 0
	obj_image_anim_end

gUnknown_846B464:: @ 846B464
	obj_image_anim_frame 0x40, 0
	obj_image_anim_end

gUnknown_846B46C:: @ 846B46C
	obj_image_anim_frame 0x30, 0
	obj_image_anim_end

gUnknown_846B474:: @ 846B474
	obj_image_anim_frame 0x50, 0
	obj_image_anim_end

gUnknown_846B47C::
	.4byte gUnknown_846B44C
	.4byte gUnknown_846B454
	.4byte gUnknown_846B45C
	.4byte gUnknown_846B464
	.4byte gUnknown_846B46C
	.4byte gUnknown_846B474

gUnknown_846B494:: @ 846B494
	spr_template 0x2000, 0x2000, gOamData_83AC9D8, gUnknown_846B47C, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_846B4AC:: @ 846B4AC
	@ This is a 2D array with one row.
	@ Why this was done this way is beyond me.
	@ The data that follow this row are not at all function pointers.
	.4byte sub_81477C0, sub_814784C, sub_81479D4, sub_8147A34

gUnknown_846B4BC:: @ 846B4BC
	.incbin "baserom.gba", 0x46B4BC, 0x190

gUnknown_846B64C:: @ 846B64C
	.incbin "baserom.gba", 0x46B64C, 0x24

gUnknown_846B670:: @ 846B670
	.incbin "baserom.gba", 0x46B670, 0x24

gUnknown_846B694:: @ 846B694
	.incbin "baserom.gba", 0x46B694, 0x10

gUnknown_846B6A4:: @ 846B6A4
	.incbin "baserom.gba", 0x46B6A4, 0x8

gUnknown_846B6AC:: @ 846B6AC
	.incbin "baserom.gba", 0x46B6AC, 0x8

gUnknown_846B6B4:: @ 846B6B4
	.incbin "baserom.gba", 0x46B6B4, 0x90

gUnknown_846B744:: @ 846B744
	.incbin "baserom.gba", 0x46B744, 0x18

gUnknown_846B75C:: @ 846B75C
	.incbin "baserom.gba", 0x46B75C, 0x10

gUnknown_846B76C:: @ 846B76C
	.incbin "baserom.gba", 0x46B76C, 0x28

gUnknown_846B794:: @ 846B794
	.incbin "baserom.gba", 0x46B794, 0x20

gUnknown_846B7B4:: @ 846B7B4
	.incbin "baserom.gba", 0x46B7B4, 0x20

gUnknown_846B7D4:: @ 846B7D4
	.incbin "baserom.gba", 0x46B7D4, 0x22C

gUnknown_846BA00:: @ 846BA00
	.incbin "baserom.gba", 0x46BA00, 0x1B0

gUnknown_846BBB0:: @ 846BBB0
	.incbin "baserom.gba", 0x46BBB0, 0x20

gUnknown_846BBD0:: @ 846BBD0
	.incbin "baserom.gba", 0x46BBD0, 0x950

gUnknown_846C520:: @ 846C520
	.incbin "baserom.gba", 0x46C520, 0x3B8

gUnknown_846C8D8:: @ 846C8D8
	.incbin "baserom.gba", 0x46C8D8, 0x20

gUnknown_846C8F8:: @ 846C8F8
	.incbin "baserom.gba", 0x46C8F8, 0xAB0

gUnknown_846D3A8:: @ 846D3A8
	.incbin "baserom.gba", 0x46D3A8, 0x52C

gUnknown_846D8D4:: @ 846D8D4
	.incbin "baserom.gba", 0x46D8D4, 0x10

gUnknown_846D8E4:: @ 846D8E4
	.incbin "baserom.gba", 0x46D8E4, 0x18

gUnknown_846D8FC:: @ 846D8FC
	.incbin "baserom.gba", 0x46D8FC, 0x50

gUnknown_846D94C:: @ 846D94C
	.incbin "baserom.gba", 0x46D94C, 0x4

gUnknown_846D950:: @ 846D950
	.incbin "baserom.gba", 0x46D950, 0x3

gUnknown_846D953:: @ 846D953
	.incbin "baserom.gba", 0x46D953, 0xD

gUnknown_846D960:: @ 846D960
	obj_tiles gUnknown_8479688, 0, 800

gUnknown_846D968:: @ 846D968
	obj_pal gUnknown_8479668, 800

gUnknown_846D970::
	.2byte 0x0006, 0x0008, 0x0010, 0x0008, 0x0006, 0x0008, 0x000b, 0x0006, 0x0010, 0x0008, 0x0002, 0x0006
	.2byte 0x0006, 0x0008, 0x0010, 0x0008, 0x0014, 0x0006, 0x0002, 0x0006, 0x0006, 0x0008, 0x000b, 0x0006, 0x0010, 0x0008, 0x0014, 0x0006

gUnknown_846D9A8:: @ 846D9A8
	.incbin "baserom.gba", 0x46D9A8, 0x2C

gUnknown_846D9D4:: @ 846D9D4
	.incbin "baserom.gba", 0x46D9D4, 0x6DC

gUnknown_846E0B0:: @ 846E0B0
	.incbin "baserom.gba", 0x46E0B0, 0x28

gUnknown_846E0D8:: @ 846E0D8
	.incbin "baserom.gba", 0x46E0D8, 0x10

gUnknown_846E0E8:: @ 846E0E8
	.incbin "baserom.gba", 0x46E0E8, 0x18

gUnknown_846E100:: @ 846E100
	.incbin "baserom.gba", 0x46E100, 0x50

gUnknown_846E150:: @ 846E150
	.incbin "baserom.gba", 0x46E150, 0x10

gUnknown_846E160:: @ 846E160
	.incbin "baserom.gba", 0x46E160, 0x154

gUnknown_846E2B4:: @ 846E2B4
	.incbin "baserom.gba", 0x46E2B4, 0x18

gUnknown_846E2CC:: @ 846E2CC
	.incbin "baserom.gba", 0x46E2CC, 0x8

gUnknown_846E2D4:: @ 846E2D4
	.incbin "baserom.gba", 0x46E2D4, 0xC
