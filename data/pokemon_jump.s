	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gUnknown_846D9E4:: @ gbapal
	.incbin "graphics/link_games/unk_846D9E4.gbapal"

gUnknown_846DA04:: @ gbapal
	.incbin "graphics/link_games/unk_846DA04.gbapal"

gUnknown_846DA24:: @ 4bpp.lz
	.incbin "graphics/link_games/unk_846DA24.4bpp.lz"

gUnknown_846DB44:: @ 4bpp.lz
	.incbin "graphics/link_games/unk_846DB44.4bpp.lz"

gUnknown_846DD18:: @ 4bpp.lz
	.incbin "graphics/link_games/unk_846DD18.4bpp.lz"

gUnknown_846DE48:: @ 4bpp.lz
	.incbin "graphics/link_games/unk_846DE48.4bpp.lz"

gUnknown_846DF44:: @ 4bpp.lz
	.incbin "graphics/link_games/unk_846DF44.4bpp.lz"

gUnknown_846E0B0:: @ 846E0B0
	obj_tiles gUnknown_846DA24, 0x0600, 5
	obj_tiles gUnknown_846DB44, 0x0c00, 6
	obj_tiles gUnknown_846DD18, 0x0600, 7
	obj_tiles gUnknown_846DE48, 0x0600, 8
	obj_tiles gUnknown_846DF44, 0x0200, 10

gUnknown_846E0D8:: @ 846E0D8
	obj_pal gUnknown_846D9E4, 5
	obj_pal gUnknown_846DA04, 6

gUnknown_846E0E8:: @ 846E0E8
	spr_template 0, 0, gUnknown_846E170, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_846E100:: @ 846E100
	.2byte 0x0060, 0x0060, 0x0060, 0x0072, 0x0078, 0x0078, 0x0078, 0x0072, 0x0060, 0x0060, 0x0046, 0x0050, 0x0060, 0x0072, 0x0078, 0x0080
	.2byte 0x0078, 0x0072, 0x0060, 0x0050, 0x0032, 0x0048, 0x0060, 0x0072, 0x0080, 0x0088, 0x0080, 0x0072, 0x0060, 0x0048, 0x002a, 0x0048
	.2byte 0x0060, 0x0072, 0x0080, 0x0088, 0x0080, 0x0072, 0x0060, 0x0048

gUnknown_846E150:: @ 846E150
	.2byte 0x0010, 0x0028, 0x0048, 0x0068, 0x0088, 0x00a8, 0x00c8, 0x00e0

gUnknown_846E160:: @ 846E160
	.4byte gUnknown_846E220
	.4byte gUnknown_846E238
	.4byte gUnknown_846E250
	.4byte gUnknown_846E268

gUnknown_846E170::
	.4byte 0xc0000000, 0x00000800

gUnknown_846E178::
	.4byte 0x80008000, 0x00000800

gUnknown_846E180::
	.4byte 0x80000000, 0x00000800

gUnknown_846E188::
	.4byte 0x80004000, 0x00000800

gUnknown_846E190::
	obj_image_anim_frame 0x0000, 1
	obj_image_anim_end

gUnknown_846E198::
	obj_image_anim_frame 0x0008, 1
	obj_image_anim_end

gUnknown_846E1A0::
	obj_image_anim_frame 0x0010, 1
	obj_image_anim_end

gUnknown_846E1A8::
	obj_image_anim_frame 0x0018, 1
	obj_image_anim_end

gUnknown_846E1B0::
	obj_image_anim_frame 0x0020, 1
	obj_image_anim_end

gUnknown_846E1B8::
	obj_image_anim_frame 0x0028, 1
	obj_image_anim_end

gUnknown_846E1C0::
	obj_image_anim_frame 0x0000, 1
	obj_image_anim_end

gUnknown_846E1C8::
	obj_image_anim_frame 0x0010, 1
	obj_image_anim_end

gUnknown_846E1D0::
	obj_image_anim_frame 0x0020, 1
	obj_image_anim_end

gUnknown_846E1D8::
	obj_image_anim_frame 0x0030, 1
	obj_image_anim_end

gUnknown_846E1E0::
	obj_image_anim_frame 0x0040, 1
	obj_image_anim_end

gUnknown_846E1E8::
	obj_image_anim_frame 0x0050, 1
	obj_image_anim_end

gUnknown_846E1F0::
	.4byte gUnknown_846E190
	.4byte gUnknown_846E198
	.4byte gUnknown_846E1A0
	.4byte gUnknown_846E1A8
	.4byte gUnknown_846E1B0
	.4byte gUnknown_846E1B8

gUnknown_846E208::
	.4byte gUnknown_846E1C0
	.4byte gUnknown_846E1C8
	.4byte gUnknown_846E1D0
	.4byte gUnknown_846E1D8
	.4byte gUnknown_846E1E0
	.4byte gUnknown_846E1E8

gUnknown_846E220::
	spr_template 5, 5, gUnknown_846E178, gUnknown_846E1F0, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_846E238::
	spr_template 6, 5, gUnknown_846E180, gUnknown_846E208, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_846E250::
	spr_template 7, 5, gUnknown_846E188, gUnknown_846E1F0, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_846E268::
	spr_template 8, 5, gUnknown_846E188, gUnknown_846E1F0, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_846E280::
	.4byte 0x40000000, 0x00000400

gUnknown_846E288::
	obj_image_anim_frame 0x0000, 0
	obj_image_anim_end

gUnknown_846E290::
	obj_image_anim_frame 0x0000, 4
	obj_image_anim_frame 0x0004, 4
	obj_image_anim_frame 0x0008, 4
	obj_image_anim_frame 0x000c, 4
	obj_image_anim_loop 1
	obj_image_anim_frame 0x0000, 4
	obj_image_anim_end

gUnknown_846E2AC::
	.4byte gUnknown_846E288
	.4byte gUnknown_846E290

gUnknown_846E2B4:: @ 846E2B4
	spr_template 10, 5, gUnknown_846E280, gUnknown_846E2AC, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_846E2CC:: @ 846E2CC
	.byte 0, 1, 1, 28, 9, 15
	.2byte 0x0001

gUnknown_846E2D4:: @ 846E2D4
	.4byte gUnknown_841CB78
	.4byte gUnknown_841CB88
	.4byte gUnknown_841CB94
