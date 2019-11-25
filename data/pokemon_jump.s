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
	.2byte 0x0001, 0x0002, 0x0004, 0x0001, 0x0007, 0x0000, 0x000a, 0x0001, 0x000b, 0x0001, 0x000d, 0x0001, 0x000e, 0x0001, 0x0013, 0x0001
	.2byte 0x0014, 0x0001, 0x0019, 0x0000, 0x001b, 0x0000, 0x001d, 0x0000, 0x0020, 0x0000, 0x0023, 0x0000, 0x0025, 0x0000, 0x0027, 0x0002
	.2byte 0x002b, 0x0002, 0x002e, 0x0001, 0x0034, 0x0000, 0x0036, 0x0002, 0x0038, 0x0001, 0x003a, 0x0001, 0x003c, 0x0002, 0x0045, 0x0002
	.2byte 0x005a, 0x0001, 0x0062, 0x0001, 0x0066, 0x0002, 0x0068, 0x0000, 0x0084, 0x0002, 0x0085, 0x0000, 0x008a, 0x0001, 0x008c, 0x0001
	.2byte 0x0098, 0x0002, 0x009b, 0x0001, 0x009e, 0x0000, 0x00a7, 0x0001, 0x00ac, 0x0000, 0x00ad, 0x0000, 0x00ae, 0x0002, 0x00af, 0x0002
	.2byte 0x00b3, 0x0000, 0x00b6, 0x0002, 0x00b7, 0x0002, 0x00bf, 0x0002, 0x00c2, 0x0002, 0x00cc, 0x0002, 0x00d1, 0x0000, 0x00d5, 0x0002
	.2byte 0x00d8, 0x0000, 0x00da, 0x0002, 0x00dc, 0x0000, 0x00e4, 0x0001, 0x00e7, 0x0000, 0x00e9, 0x0000, 0x00ec, 0x0001, 0x00ee, 0x0002
	.2byte 0x00ef, 0x0001, 0x00f0, 0x0001, 0x00f6, 0x0001, 0x0115, 0x0001, 0x0118, 0x0002, 0x011b, 0x0000, 0x011c, 0x0000, 0x011e, 0x0001
	.2byte 0x0120, 0x0000, 0x0121, 0x0000, 0x0122, 0x0001, 0x0123, 0x0002, 0x0125, 0x0002, 0x0127, 0x0002, 0x012a, 0x0001, 0x0188, 0x0000
	.2byte 0x0189, 0x0000, 0x0137, 0x0002, 0x0132, 0x0002, 0x012d, 0x0001, 0x0172, 0x0000, 0x015e, 0x0002, 0x013b, 0x0000, 0x0142, 0x0000
	.2byte 0x0163, 0x0000, 0x017e, 0x0001, 0x0164, 0x0002, 0x0151, 0x0001, 0x0161, 0x0001, 0x0162, 0x0001, 0x0182, 0x0000, 0x0183, 0x0000
	.2byte 0x016b, 0x0002, 0x016f, 0x0002, 0x0153, 0x0002, 0x0141, 0x0002, 0x015f, 0x0000, 0x014c, 0x0002, 0x0158, 0x0002, 0x0186, 0x0001
	.2byte 0x0168, 0x0000, 0x015a, 0x0000, 0x0175, 0x0001, 0x018b, 0x0001

gUnknown_846B64C:: @ 846B64C
	.4byte sub_8148344
	.4byte sub_81483D0
	.4byte sub_8148464
	.4byte sub_81484D0
	.4byte sub_81485C8
	.4byte sub_81486C4
	.4byte sub_8148760
	.4byte sub_81487B4
	.4byte sub_814881C

gUnknown_846B670:: @ 846B670
	.4byte sub_8148398
	.4byte sub_8148418
	.4byte sub_81484B0
	.4byte sub_814856C
	.4byte sub_8148664
	.4byte sub_8148724
	.4byte sub_8148760
	.4byte sub_8148800
	.4byte sub_814881C

gUnknown_846B694:: @ 846B694
	.2byte 0x001a, 0x001f, 0x0024, 0x0029, 0x002e, 0x0033, 0x0038, 0x003d

gUnknown_846B6A4:: @ 846B6A4
	.2byte 0x0000, 0x0001, 0x0001, 0x0002

gUnknown_846B6AC:: @ 846B6AC
	.2byte 0x0058, 0x005f, 0x00dd, 0x00fe

gUnknown_846B6B4:: @ 846B6B4
	.byte 0xfd, 0xfa, 0xf8, 0xf6, 0xf3, 0xf1, 0xef, 0xed, 0xeb, 0xe9, 0xe7, 0xe5, 0xe4, 0xe3, 0xe2, 0xe2, 0xe2, 0xe4, 0xe5, 0xe6, 0xe7, 0xe9, 0xea, 0xec, 0xee, 0xef, 0xf1, 0xf3, 0xf5, 0xf8, 0xfa, 0xfc
	.byte 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfd, 0xfa, 0xf7, 0xf5, 0xf2, 0xf0, 0xee, 0xec, 0xea, 0xe8, 0xe6, 0xe4, 0xe3, 0xe2, 0xe2, 0xe4
	.byte 0xe6, 0xe8, 0xea, 0xec, 0xee, 0xf0, 0xf2, 0xf5, 0xf7, 0xfa, 0xfc, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xfd, 0xfa, 0xf7, 0xf5, 0xf3, 0xf1, 0xef, 0xed, 0xeb, 0xe9, 0xe7, 0xe5, 0xe4, 0xe3, 0xe2, 0xe2, 0xe2, 0xe2, 0xe3, 0xe3, 0xe4, 0xe4, 0xe5, 0xe5, 0xe6, 0xe7, 0xe8, 0xea, 0xec, 0xee, 0xf0, 0xf2
	.byte 0xf4, 0xf5, 0xf7, 0xfa, 0xfc, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

gUnknown_846B744:: @ 846B744
	.4byte 0, 0, 50, 100, 200, 500

gUnknown_846B75C:: @ 846B75C
	.2byte 0x008a, 0x008d, 0x008e, 0x008f, 0x0090, 0x0091, 0x0092, 0x0093

gUnknown_846B76C:: @ 846B76C
	.4byte  5000, 1
	.4byte  8000, 2
	.4byte 12000, 3
	.4byte 16000, 4
	.4byte 20000, 5

gUnknown_846B794:: @ 846B794 gbapal
	.incbin "graphics/misc/unk_846B794.gbapal"

gUnknown_846B7B4:: @ 846B7B4 gbapal
	.incbin "graphics/misc/unk_846B7B4.gbapal"

gUnknown_846B7D4:: @ 846B7D4 4bpp.lz
	.incbin "graphics/misc/unk_846B7D4.4bpp.lz"

gUnknown_846BA00:: @ 846BA00 bin.lz
	.incbin "graphics/misc/unk_846BA00.bin.lz"

gUnknown_846BBB0:: @ 846BBB0 gbapal
	.incbin "graphics/misc/unk_846BBB0.gbapal"

gUnknown_846BBD0:: @ 846BBD0 4bpp.lz
	.incbin "graphics/misc/unk_846BBD0.4bpp.lz"

gUnknown_846C520:: @ 846C520 bin.lz
	.incbin "graphics/misc/unk_846C520.bin.lz"

gUnknown_846C8D8:: @ 846C8D8 gbapal
	.incbin "graphics/misc/unk_846C8D8.gbapal"

gUnknown_846C8F8:: @ 846C8F8 4bpp.lz
	.incbin "graphics/misc/unk_846C8F8.4bpp.lz"

gUnknown_846D3A8:: @ 846D3A8 bin.lz
	.incbin "graphics/misc/unk_846D3A8.bin.lz"

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
	.incbin "graphics/misc/unk_846D9E4.gbapal"

gUnknown_846DA04:: @ gbapal
	.incbin "graphics/misc/unk_846DA04.gbapal"

gUnknown_846DA24:: @ 4bpp.lz
	.incbin "graphics/misc/unk_846DA24.4bpp.lz"

gUnknown_846DB44:: @ 4bpp.lz
	.incbin "graphics/misc/unk_846DB44.4bpp.lz"

gUnknown_846DD18:: @ 4bpp.lz
	.incbin "graphics/misc/unk_846DD18.4bpp.lz"

gUnknown_846DE48:: @ 4bpp.lz
	.incbin "graphics/misc/unk_846DE48.4bpp.lz"

gUnknown_846DF44:: @ 4bpp.lz
	.incbin "graphics/misc/unk_846DF44.4bpp.lz"

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
