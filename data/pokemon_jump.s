	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gUnknown_846B794:: @ 846B794 gbapal
	.incbin "graphics/link_games/unk_846B794.gbapal"

gUnknown_846B7B4:: @ 846B7B4 gbapal
	.incbin "graphics/link_games/unk_846B7B4.gbapal"

gUnknown_846B7D4:: @ 846B7D4 4bpp.lz
	.incbin "graphics/link_games/unk_846B7D4.4bpp.lz"

gUnknown_846BA00:: @ 846BA00 bin.lz
	.incbin "graphics/link_games/unk_846BA00.bin.lz"

gUnknown_846BBB0:: @ 846BBB0 gbapal
	.incbin "graphics/link_games/unk_846BBB0.gbapal"

gUnknown_846BBD0:: @ 846BBD0 4bpp.lz
	.incbin "graphics/link_games/unk_846BBD0.4bpp.lz"

gUnknown_846C520:: @ 846C520 bin.lz
	.incbin "graphics/link_games/unk_846C520.bin.lz"

gUnknown_846C8D8:: @ 846C8D8 gbapal
	.incbin "graphics/link_games/unk_846C8D8.gbapal"

gUnknown_846C8F8:: @ 846C8F8 4bpp.lz
	.incbin "graphics/link_games/unk_846C8F8.4bpp.lz"

gUnknown_846D3A8:: @ 846D3A8 bin.lz
	.incbin "graphics/link_games/unk_846D3A8.bin.lz"

gUnknown_846D8D4:: @ 846D8D4
	.4byte 0x000001b0
	@ {
	@ 	.bg = 0,
	@ 	.charBaseIndex = 0,
	@ 	.mapBaseIndex = 27,
	@ 	.screenSize = 0,
	@ 	.paletteMode = 0,
	@ 	.priority = 0,
	@ 	.baseTile = 0x0000
	@ }
	.4byte 0x000025e6
	@ {
	@ 	.bg = 2,
	@ 	.charBaseIndex = 1,
	@ 	.mapBaseIndex = 30,
	@ 	.screenSize = 2,
	@ 	.paletteMode = 0,
	@ 	.priority = 2,
	@ 	.baseTile = 0x0000
	@ }
	.4byte 0x000016c9
	@ {
	@ 	.bg = 1,
	@ 	.charBaseIndex = 2,
	@ 	.mapBaseIndex = 12,
	@ 	.screenSize = 3,
	@ 	.paletteMode = 0,
	@ 	.priority = 1,
	@ 	.baseTile = 0x0000
	@ }
	.4byte 0x000031df
	@ {
	@ 	.bg = 3,
	@ 	.charBaseIndex = 3,
	@ 	.mapBaseIndex = 29,
	@ 	.screenSize = 0,
	@ 	.paletteMode = 0,
	@ 	.priority = 3,
	@ 	.baseTile = 0x0000
	@ }

gUnknown_846D8E4:: @ 846D8E4
	.byte 0, 19, 0, 6, 2, 2
	.2byte 0x0013
	.byte 0, 8, 0, 6, 2, 2
	.2byte 0x001f
	.byte 255, 0, 0, 0, 0, 0
	.2byte 0x0000

gUnknown_846D8FC:: @ 846D8FC
	.4byte 0, sub_8149DC8
	.4byte 1, sub_8149F64
	.4byte 2, sub_8149FD0
	.4byte 3, sub_814A03C
	.4byte 4, sub_814A0C8
	.4byte 5, sub_814A174
	.4byte 6, sub_814A218
	.4byte 7, sub_814A264
	.4byte 9, sub_814A3AC
	.4byte 8, sub_814A308

gUnknown_846D94C:: @ 846D94C
	.string "IES$"

gUnknown_846D950:: @ 846D950
	.byte 0x00, 0x02, 0x03

gUnknown_846D953:: @ 846D953
	.byte 0x02, 0x02, 0x00, 0x00, 0x01, 0x01, 0x01, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

gUnknown_846D960:: @ 846D960
	obj_tiles gUnknown_8479688, 0, 800

gUnknown_846D968:: @ 846D968
	obj_pal gUnknown_8479668, 800

gUnknown_846D970::
	.2byte 0x0006, 0x0008, 0x0010, 0x0008

gUnknown_846D978::
	.2byte 0x0006, 0x0008, 0x000b, 0x0006, 0x0010, 0x0008

gUnknown_846D984::
	.2byte 0x0002, 0x0006, 0x0006, 0x0008, 0x0010, 0x0008, 0x0014, 0x0006

gUnknown_846D994::
	.2byte 0x0002, 0x0006, 0x0006, 0x0008, 0x000b, 0x0006, 0x0010, 0x0008, 0x0014, 0x0006

gUnknown_846D9A8:: @ 846D9A8
	.4byte gUnknown_846D970
	.4byte gUnknown_846D978
	.4byte gUnknown_846D984
	.4byte gUnknown_846D994

gUnknown_846D9B8::
	.2byte 0x0058, 0x0098

gUnknown_846D9BC::
	.2byte 0x0058, 0x0078, 0x0098

gUnknown_846D9C2::
	.2byte 0x0038, 0x0058, 0x0098, 0x00b8

gUnknown_846D9CA::
	.2byte 0x0038, 0x0058, 0x0078, 0x0098, 0x00b8

gUnknown_846D9D4:: @ 846D9D4
	.4byte gUnknown_846D9B8
	.4byte gUnknown_846D9BC
	.4byte gUnknown_846D9C2
	.4byte gUnknown_846D9CA

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
