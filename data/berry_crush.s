	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2
gUnknown_846E2E0:: @ 846E2E0
	.byte 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80

gUnknown_846E2E8:: @ 846E2E8
	.byte 0x00, 0x01, 0x02, 0x03, 0x05, 0x00, 0x00, 0x00

gUnknown_846E2F0:: @ 846E2F0
	.byte 0x04, 0x01, 0x00, 0xff
	.byte 0x00, 0x00, 0x00, 0x04
	.byte 0x02, 0x00, 0xff, 0x00
	.byte 0x00, 0x00, 0x04, 0x02
	.byte 0x00, 0xfe, 0x00, 0x00
	.byte 0x00, 0x06, 0x03, 0x01
	.byte 0xff, 0xfd, 0xff, 0x00
	.byte 0x06, 0x04, 0x01, 0xfe
	.byte 0xfc, 0xfe, 0x00, 0x00

gUnknown_846E314:: @ 846E314
	.byte 0x03, 0x02, 0x01, 0x00
	.byte 0x03, 0x03, 0x01, 0x00
	.byte 0x03, 0x03, 0x02, 0x00
	.byte 0x03, 0x04, 0x02, 0x00
	.byte 0x03, 0x05, 0x03, 0x00

gUnknown_846E328:: @ 846E328
	.4byte gUnknown_841CE3C
	.4byte gUnknown_841CE78
	.4byte gUnknown_841CEA8
	.4byte gUnknown_841CF14
	.4byte gUnknown_841CF50
	.4byte gUnknown_841CF70
	.4byte gUnknown_841CFA0
	.4byte gUnknown_841CFD4
	.4byte gUnknown_841D008

gUnknown_846E34C:: @ 846E34C
	.4byte NULL
	.4byte sub_814BBB8
	.4byte sub_814BC10
	.4byte sub_814BC74
	.4byte sub_814BD7C
	.4byte sub_814BD9C
	.4byte sub_814BDBC
	.4byte sub_814BE0C
	.4byte sub_814BE64
	.4byte sub_814BE7C
	.4byte sub_814BFD0
	.4byte sub_814C118
	.4byte sub_814C24C
	.4byte sub_814C850
	.4byte sub_814C8F8
	.4byte sub_814C990
	.4byte sub_814CB20
	.4byte sub_814CC0C
	.4byte sub_814CFA8
	.4byte sub_814D094
	.4byte sub_814D188
	.4byte sub_814D240
	.4byte sub_814D31C
	.4byte sub_814D3A4
	.4byte sub_814D468
	.4byte sub_814D4C8

gUnknown_846E3B4:: @ 846E3B4
	.byte 0x02, 0x04, 0x06, 0x07
	.byte 0x03, 0x05, 0x08, 0x0b
	.byte 0x03, 0x07, 0x0b, 0x0f
	.byte 0x04, 0x08, 0x0c, 0x11

gUnknown_846E3C4:: @ 846E3C4
	.byte 0x05, 0x07, 0x09, 0x0c

gUnknown_846E3C8:: @ 846E3C8
	.byte 0x03, 0x07, 0x0f, 0x1f

gUnknown_846E3CC:: @ 846E3CC
	.4byte 0x000000f8
	@ {
	@ 	.bg = 0,
	@ 	.charBaseIndex = 2,
	@ 	.mapBaseIndex = 15,
	@ 	.screenSize = 0,
	@ 	.paletteMode = 0,
	@ 	.priority = 0,
	@ 	.baseTile = 0x0000
	@ }
	.4byte 0x000014d1
	@ {
	@ 	.bg = 1,
	@ 	.charBaseIndex = 0,
	@ 	.mapBaseIndex = 13,
	@ 	.screenSize = 2,
	@ 	.paletteMode = 0,
	@ 	.priority = 1,
	@ 	.baseTile = 0x0000
	@ }
	.4byte 0x000020c2
	@ {
	@ 	.bg = 2,
	@ 	.charBaseIndex = 0,
	@ 	.mapBaseIndex = 12,
	@ 	.screenSize = 0,
	@ 	.paletteMode = 0,
	@ 	.priority = 2,
	@ 	.baseTile = 0x0000
	@ }
	.4byte 0x000030b3
	@ {
	@ 	.bg = 3,
	@ 	.charBaseIndex = 0,
	@ 	.mapBaseIndex = 11,
	@ 	.screenSize = 0,
	@ 	.paletteMode = 0,
	@ 	.priority = 3,
	@ 	.baseTile = 0x0000
	@ }

gUnknown_846E3DC:: @ 846E3DC
	.byte 0x01, 0x02, 0x03

gUnknown_846E3DF:: @ 846E3DF
	.byte 0x00, 0x01, 0x02

gUnknown_846E3E2:: @ 846E3E2
	.byte 0x00, 0x03, 0x04

gUnknown_846E3E5:: @ 846E3E5
	.byte 0x01, 0x08, 0x09
	.byte 0x01, 0x06, 0x07

gUnknown_846E3EB:: @ 846E3EB
	.byte 0x01, 0x04, 0x05

	.align 2
gUnknown_846E3F0:: @ 846E3F0
	.byte 0, 3, 4, 24, 13, 15
	.2byte 0x0001

gUnknown_846E3F8:: @ 846E3F8
	.byte 0, 0, 0, 9, 2, 8
	.2byte 0x03ed
	.byte 0, 0, 3, 9, 2, 8
	.2byte 0x03db
	.byte 0, 0, 6, 9, 2, 8
	.2byte 0x03c9
	.byte 0, 21, 3, 9, 2, 8
	.2byte 0x03b7
	.byte 0, 21, 6, 9, 2, 8
	.2byte 0x03a5
	.byte 255, 0, 0, 0, 0, 0
	.2byte 0x0000
	.byte 0, 4, 2, 22, 16, 15
	.2byte 0x0001
	.byte 0, 4, 2, 22, 16, 15
	.2byte 0x0001
	.byte 0, 3, 2, 24, 16, 15
	.2byte 0x0001
	.byte 255, 0, 0, 0, 0, 0
	.2byte 0x0000

gUnknown_846E448:: @ 846E448
	.byte 0x06, 0x08, 0x09, 0x0b
	.byte 0x0c, 0x0e, 0x0f, 0x10

gUnknown_846E450:: @ 846E450
	.4byte 50000000, 25000000, 12500000, 6250000, 3125000, 1562500, 781250, 390625

gUnknown_846E470:: @ 846E470 gbapal
	.incbin "graphics/link_games/unk_846E4D0.gbapal"

gUnknown_846E490:: @ 846E490 gbapal
	.incbin "graphics/link_games/unk_846E7FC.gbapal"

gUnknown_846E4B0:: @ 846E4B0 gbapal
	.incbin "graphics/link_games/unk_846ECC4.gbapal"

gUnknown_846E4D0:: @ 846E4D0 4bpp.lz
	.incbin "graphics/link_games/unk_846E4D0.4bpp.lz"

gUnknown_846E7FC:: @ 846E7FC 4bpp.lz
	.incbin "graphics/link_games/unk_846E7FC.4bpp.lz"

gUnknown_846EB78:: @ 846EB78 4bpp.lz
	.incbin "graphics/link_games/unk_846EB78.4bpp.lz"

gUnknown_846ECC4:: @ 846ECC4 4bpp.lz
	.incbin "graphics/link_games/unk_846ECC4.4bpp.lz"

gUnknown_846ED90:: @ 846ED90 bin.lz
	.incbin "graphics/link_games/unk_846ED90.bin.lz"

gUnknown_846EEC0:: @ 846EEC0 bin.lz
	.incbin "graphics/link_games/unk_846EEC0.bin.lz"

gUnknown_846F058:: @ 846F058 bin.lz
	.incbin "graphics/link_games/unk_846F058.bin.lz"

gUnknown_846F280:: @ 846F280
	.byte 0x01, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x03, 0x00, 0x00
	.byte 0x01, 0x03, 0x02, 0x04, 0x00
	.byte 0x00, 0x01, 0x03, 0x02, 0x04

gUnknown_846F294:: @ 846F294
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf0, 0xff, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x03, 0x00, 0xe4, 0xff, 0xfc, 0xff, 0xe8, 0xff, 0x10, 0x00
	.byte 0x02, 0x00, 0x06, 0x00, 0xf0, 0xff, 0x14, 0x00, 0xf8, 0xff, 0x10, 0x00
	.byte 0x03, 0x14, 0x03, 0x00, 0x1c, 0x00, 0xfc, 0xff, 0x20, 0x00, 0xf8, 0xff
	.byte 0x04, 0x14, 0x06, 0x00, 0x10, 0x00, 0x14, 0x00, 0x10, 0x00, 0xf8, 0xff

gUnknown_846F2D0:: @ 846F2D0
	.byte 0x00, 0x00
	.byte 0xff, 0x00
	.byte 0x01, 0x01

gUnknown_846F2D6:: @ 846F2D6
	.byte 0x00, 0x00
	.byte 0xf0, 0xfc
	.byte 0x10, 0xfc
	.byte 0xf8, 0xfe
	.byte 0x08, 0xfe
	.byte 0xe8, 0xf8
	.byte 0x18, 0xf8
	.byte 0xe0, 0xf4
	.byte 0x20, 0xf4
	.byte 0xd8, 0xf0
	.byte 0x28, 0xf0

gUnknown_846F2EC:: @ 846F2EC
	.2byte 5, 6, 7, 8, 9

	.align 2
gUnknown_846F2F8:: @ 846F2F8
	obj_tiles gUnknown_846E4D0, 0x0800, 1
	obj_tiles gUnknown_846E7FC, 0x0e00, 2
	obj_tiles gUnknown_846EB78, 0x0700, 3
	obj_tiles gUnknown_846ECC4, 0x02c0, 4
	obj_tiles NULL, 0x0000, 0

gUnknown_846F320:: @ 846F320
	obj_pal gUnknown_846E470, 1
	obj_pal gUnknown_846E490, 2
	obj_pal gUnknown_846E4B0, 4
	obj_pal NULL, 0

gUnknown_846F340::
	obj_image_anim_frame 0x0000, 0
	obj_image_anim_end

gUnknown_846F348::
	obj_image_anim_frame 0x0000, 4
	obj_image_anim_frame 0x0010, 4
	obj_image_anim_frame 0x0020, 4
	obj_image_anim_end

gUnknown_846F358::
	obj_image_anim_frame 0x0030, 2
	obj_image_anim_frame 0x0040, 2
	obj_image_anim_frame 0x0050, 2
	obj_image_anim_frame 0x0060, 2
	obj_image_anim_end

gUnknown_846F36C::
	obj_image_anim_frame 0x0000, 2
	obj_image_anim_frame 0x0004, 2
	obj_image_anim_frame 0x0008, 2
	obj_image_anim_frame 0x000c, 2
	obj_image_anim_frame 0x0010, 2
	obj_image_anim_frame 0x0014, 2
	obj_image_anim_jump 0

gUnknown_846F388::
	obj_image_anim_frame 0x0018, 4
	obj_image_anim_frame 0x001c, 4
	obj_image_anim_frame 0x0020, 4
	obj_image_anim_frame 0x0024, 4
	obj_image_anim_frame 0x0028, 4
	obj_image_anim_frame 0x002c, 4
	obj_image_anim_frame 0x0030, 4
	obj_image_anim_frame 0x0034, 4
	obj_image_anim_jump 0

gUnknown_846F3AC::
	obj_image_anim_frame 0x0014, 0
	obj_image_anim_end

gUnknown_846F3B4::
	obj_image_anim_frame 0x0000, 0
	obj_image_anim_end

gUnknown_846F3BC::
	obj_rot_scal_anim_frame 256, 256, 0, 0
	obj_rot_scal_anim_frame 0, 0, 2, 1
	obj_rot_scal_anim_jump 1

gUnknown_846F3D4::
	obj_rot_scal_anim_frame 256, 256, 0, 0
	obj_rot_scal_anim_frame 0, 0, 254, 1
	obj_rot_scal_anim_jump 1

gUnknown_846F3EC::
	.4byte gUnknown_846F340

gUnknown_846F3F0::
	.4byte gUnknown_846F348
	.4byte gUnknown_846F358

gUnknown_846F3F8::
	.4byte gUnknown_846F36C
	.4byte gUnknown_846F388

gUnknown_846F400::
	.4byte gUnknown_846F3AC

gUnknown_846F404::
	.4byte gUnknown_846F3B4

gUnknown_846F408::
	.4byte gUnknown_846F3BC
	.4byte gUnknown_846F3D4

gUnknown_846F410:: @ 846F410
	spr_template 1, 1, gOamData_83AC9E0, gUnknown_846F3EC, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_846F428:: @ 846F428
	spr_template 2, 2, gOamData_83AC9D8, gUnknown_846F3F0, NULL, gDummySpriteAffineAnimTable, sub_814EFD0

gUnknown_846F440:: @ 846F440
	spr_template 3, 2, gOamData_83AC9D0, gUnknown_846F3F8, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_846F458:: @ 846F458
	spr_template 4, 4, gOamData_83ACA08, gUnknown_846F400, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_846F470:: @ 846F470
	spr_template 5, 5, gOamData_83ACA98, gUnknown_846F404, NULL, gUnknown_846F408, SpriteCallbackDummy

gUnknown_846F488:: @ 846F488 struct UnkStruct3? perhaps not
	.byte 9, 2, 8
	.align 2
	.2byte 0x9c, 0x00
	.4byte gUnknown_846F2F8 + 0x18
	.4byte gUnknown_846F320 + 0x10
	.byte 8, 2, 8
	.align 2
	.2byte 0xb4, 0x00
	.4byte gUnknown_846F2F8 + 0x18
	.4byte gUnknown_846F320 + 0x10
	.byte 8, 2, 8
	.align 2
	.2byte 0xcc, 0x00
	.4byte gUnknown_846F2F8 + 0x18
	.4byte gUnknown_846F320 + 0x10

gUnknown_846F4B8:: @ 846F4B8
	.4byte gUnknown_841D034
	.4byte gUnknown_841D03C
	.4byte gUnknown_841D044
	.4byte gUnknown_841D0D4
	.4byte gUnknown_841D0E8
	.4byte gUnknown_841D100
