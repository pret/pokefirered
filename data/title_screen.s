	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2
gUnknown_83BF64C:: @ 83BF64C
	.incbin "data/graphics/title_screen/unk_83bf64c.4bpp.lz"

gUnknown_83BF77C::
	.incbin "data/graphics/title_screen/unk_83bf77c.gbapal"

gUnknown_83BF79C::
	.incbin "data/graphics/title_screen/unk_83bf79c.4bpp.lz"

gUnknown_83BFA14::
	.incbin "data/graphics/title_screen/unk_83bfa14.4bpp.lz"

gOamData_83BFAB4::
	.4byte 0x40000000, 0x00000c00

gSpriteAnims_83BFABC::
	obj_image_anim_frame 0x0, 0x3
	obj_image_anim_frame 0x4, 0x6
	obj_image_anim_frame 0x8, 0x6
	obj_image_anim_frame 0xc, 0x6
	obj_image_anim_frame 0x10, 0x6
	obj_image_anim_frame 0x14, 0x6
	obj_image_anim_frame 0x18, 0x6
	obj_image_anim_frame 0x1c, 0x6
	obj_image_anim_frame 0x20, 0x6
	obj_image_anim_frame 0x24, 0x6
	obj_image_anim_end

gSpriteAnims_83BFAE8::
	obj_image_anim_frame 0x18, 0x6
	obj_image_anim_frame 0x1c, 0x6
	obj_image_anim_frame 0x20, 0x6
	obj_image_anim_frame 0x24, 0x6
	obj_image_anim_end

gSpriteAnimTable_83BFAFC::
	.4byte gSpriteAnims_83BFABC
	.4byte gSpriteAnims_83BFAE8

gUnknown_83BFB04:: @ 83BFB04
	spr_template 0, 0, gOamData_83BFAB4, gSpriteAnimTable_83BFAFC, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_83BFB1C:: @ 83BFB1C
	spr_template 1, 0, gOamData_83BFAB4, gSpriteAnimTable_83BFAFC, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gOamData_83BFB34::
	.4byte 0xc0008000, 0x00000000

gUnknown_83BFB3C:: @ 83BFB3C
	spr_template 2, 2, gOamData_83BFB34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gOamData_83BFB54::
	.4byte 0xc0000800, 0x00000000

gUnknown_83BFB5C:: @ 83BFB5C
	spr_template 3, 2, gOamData_83BFB54, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_83BFB74:: @ 83BFB74
	.4byte 0x000009f0
	.4byte 0x000011e5
	.4byte 0x000021da
	.4byte 0x000031cf

gUnknown_83BFB84:: @ 83BFB84
	.4byte sub_8078C9C
	.4byte sub_8078D24
	.4byte sub_8078DA4
	.4byte sub_8078FC4
	.4byte sub_80790CC
	.4byte sub_80791C0

gUnknown_83BFB9C:: @ 83BFB9C
	obj_tiles gUnknown_83BF79C, 0x500, 0
	obj_tiles gUnknown_83BFA14, 0x500, 1
	obj_tiles gUnknown_8EAE4A8, 0x400, 2
	obj_tiles gUnknown_83BF64C, 0x800, 3

gUnknown_83BFBBC:: @ 83BFBBC
	obj_pal gUnknown_83BF77C, 0
	obj_pal gUnknown_8EAE488, 2
	null_obj_pal

gUnknown_83BFBD4:: @ 83BFBD4
	.incbin "baserom.gba", 0x3BFBD4, 0xF
