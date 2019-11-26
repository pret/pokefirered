	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_84636C0:: @ 84636C0 gbapal
	.incbin "baserom.gba", 0x4636C0, 0x20

gUnknown_84636E0:: @ 84636E0 gbapal
	.incbin "baserom.gba", 0x4636E0, 0x20

gUnknown_8463700:: @ 8463700 gbapal
	.incbin "baserom.gba", 0x463700, 0x20

gUnknown_8463720:: @ 8463720 gbapal
	.incbin "baserom.gba", 0x463720, 0x20

gUnknown_8463740:: @ 8463740 something.lz
	.incbin "baserom.gba", 0x463740, 0x12C

gUnknown_846386C:: @ 846386C something.lz
	.incbin "baserom.gba", 0x46386C, 0x120

gUnknown_846398C:: @ 846398C oamdata
	.4byte 0xc0004000, 0x00000000
	@ animcmd

gUnknown_8463994::
	obj_image_anim_frame 0x0000, 20
	obj_image_anim_jump 0

gUnknown_846399C::
	obj_image_anim_frame 0x0020, 20
	obj_image_anim_jump 0

gUnknown_84639A4:: @ 84639A4 dataptr
	.4byte gUnknown_8463994
	.4byte gUnknown_846399C

gUnknown_84639AC:: @ 84639AC oamdata
	.4byte 0x40004000, 0x00000000
	@ animcmd

gUnknown_84639B4::
	obj_image_anim_frame 0x0000, 20
	obj_image_anim_jump 0

gUnknown_84639BC::
	obj_image_anim_frame 0x0004, 20
	obj_image_anim_jump 0

gUnknown_84639C4::
	obj_image_anim_frame 0x0008, 20
	obj_image_anim_jump 0

gUnknown_84639CC::
	obj_image_anim_frame 0x000c, 20
	obj_image_anim_jump 0

gUnknown_84639D4::
	obj_image_anim_frame 0x0010, 20
	obj_image_anim_jump 0

gUnknown_84639DC::
	obj_image_anim_frame 0x0014, 20
	obj_image_anim_jump 0

gUnknown_84639E4::
	obj_image_anim_frame 0x0018, 20
	obj_image_anim_jump 0

gUnknown_84639EC::
	obj_image_anim_frame 0x001c, 20
	obj_image_anim_jump 0

gUnknown_84639F4:: @ 84639F4 dataptr
	.4byte gUnknown_84639B4
	.4byte gUnknown_84639BC
	.4byte gUnknown_84639C4
	.4byte gUnknown_84639CC
	.4byte gUnknown_84639D4
	.4byte gUnknown_84639DC
	.4byte gUnknown_84639E4
	.4byte gUnknown_84639EC

gUnknown_8463A14:: @ 8463A14 oamdata
	.4byte 0x00000000, 0x00000000

gUnknown_8463A1C::
	obj_image_anim_frame 0x0000, 20
	obj_image_anim_jump 0

gUnknown_8463A24::
	obj_image_anim_frame 0x0001, 20
	obj_image_anim_jump 0

gUnknown_8463A2C::
	obj_image_anim_frame 0x0002, 20
	obj_image_anim_jump 0

gUnknown_8463A34::
	obj_image_anim_frame 0x0003, 20
	obj_image_anim_jump 0

gUnknown_8463A3C::
	obj_image_anim_frame 0x0004, 20
	obj_image_anim_jump 0

gUnknown_8463A44::
	obj_image_anim_frame 0x0005, 20
	obj_image_anim_jump 0

gUnknown_8463A4C::
	obj_image_anim_frame 0x0006, 20
	obj_image_anim_jump 0

gUnknown_8463A54::
	obj_image_anim_frame 0x0007, 20
	obj_image_anim_jump 0

gUnknown_8463A5C::
	obj_image_anim_frame 0x0008, 20
	obj_image_anim_jump 0

gUnknown_8463A64::
	obj_image_anim_frame 0x0009, 20
	obj_image_anim_jump 0

gUnknown_8463A6C::
	obj_image_anim_frame 0x000a, 20
	obj_image_anim_jump 0

gUnknown_8463A74::
	obj_image_anim_frame 0x000b, 20
	obj_image_anim_jump 0

gUnknown_8463A7C:: @ 8463A7C dataptr
	.4byte gUnknown_8463A1C
	.4byte gUnknown_8463A24
	.4byte gUnknown_8463A2C
	.4byte gUnknown_8463A34
	.4byte gUnknown_8463A3C
	.4byte gUnknown_8463A44
	.4byte gUnknown_8463A4C
	.4byte gUnknown_8463A54
	.4byte gUnknown_8463A5C
	.4byte gUnknown_8463A64
	.4byte gUnknown_8463A6C
	.4byte gUnknown_8463A74

gUnknown_8463AAC:: @ 8463AAC gbapal
	.incbin "baserom.gba", 0x463AAC, 0x20

gUnknown_8463ACC:: @ 8463ACC gbapal
	.incbin "baserom.gba", 0x463ACC, 0x20

gUnknown_8463AEC:: @ 8463AEC oamdata
	.4byte 0x00000000, 0x00000000
	@ animcmd
	obj_image_anim_frame 0x0000, 20
	obj_image_anim_jump 0

gUnknown_8463AFC:: @ 8463AFC dataptr
	.4byte 0x8463af4

gUnknown_8463B00:: @ 8463B00 gbapal
	.incbin "baserom.gba", 0x463B00, 0x20

gUnknown_8463B20:: @ 8463B20 something.lz
	.incbin "baserom.gba", 0x463B20, 0x10

gUnknown_8463B30:: @ 8463B30 oamdata
	.4byte 0x00000000, 0x00000000
	@ animcmd
	obj_image_anim_frame 0x0001, 20
	obj_image_anim_jump 0

gUnknown_8463B40:: @ 8463B40 dataptr
	.4byte 0x8463b38

gUnknown_8463B44:: @ 8463B44 gbapal
	.incbin "baserom.gba", 0x463B44, 0x20

gUnknown_8463B64:: @ 8463B64 something.lz
	.incbin "baserom.gba", 0x463B64, 0x24

gUnknown_8463B88:: @ 8463B88 bin.lz
	.incbin "baserom.gba", 0x463B88, 0xF8

gUnknown_8463C80:: @ 8463C80 bin.lz
	.incbin "baserom.gba", 0x463C80, 0x1E0

gUnknown_8463E60:: @ 8463E60 dataptr
	.4byte 0x8463dbc
	.4byte 0x8463dc2
	.4byte 0x8463dc9
	.4byte 0x8463dcf
	.4byte 0x8463dd7
	.4byte 0x8463ddf
	.4byte 0x8463de4
	.4byte 0x8463deb
	.4byte 0x8463df3
	.4byte 0x8463dfa
	.4byte 0x8463dfe
	.4byte 0x8463e04
	.4byte 0x8463e0a
	.4byte 0x8463e12
	.4byte 0x8463e18
	.4byte 0x8463e1e
	.4byte 0x8463e25
	.4byte 0x8463e2a
	.4byte 0x8463e30
	.4byte 0x8463e38
	.4byte 0x8463e3d
	.4byte 0x8463e42
	.4byte 0x8463e49
	.4byte 0x8463e4f
	.4byte 0x8463e57

gUnknown_8463EC4:: @ 8463EC4 dataptr
	.4byte 0x8419b44
	.4byte 0x8419b7b
	.4byte 0x8419bae
	.4byte 0x8419bdb

gUnknown_8463ED4:: @ 8463ED4 dataptr
	.4byte 0x8419a3d
	.4byte 0x8419b18
	.4byte 0x8419a6e
	.4byte 0x8419b18
	.4byte 0x8419aa2
	.4byte 0x8419ade
	.4byte 0x8419b18

gUnknown_8463EF0:: @ 8463EF0 data8
	.byte 0x00, 0x07, 0x08, 0x00, 0x01, 0x02, 0x00, 0x03, 0x04, 0x00, 0x05, 0x06

gUnknown_8463EFC:: @ 8463EFC bg_template
	.4byte 0x000002e0
	@ {
	@ 	.bg = 0,
	@ 	.charBaseIndex = 0,
	@ 	.mapBaseIndex = 14,
	@ 	.screenSize = 1,
	@ 	.paletteMode = 0,
	@ 	.priority = 0,
	@ 	.baseTile = 0x0000
	@ }
	.4byte 0x000012aa
	@ {
	@ 	.bg = 2,
	@ 	.charBaseIndex = 2,
	@ 	.mapBaseIndex = 10,
	@ 	.screenSize = 1,
	@ 	.paletteMode = 0,
	@ 	.priority = 1,
	@ 	.baseTile = 0x0000
	@ }
	.4byte 0x0000309b
	@ {
	@ 	.bg = 3,
	@ 	.charBaseIndex = 2,
	@ 	.mapBaseIndex = 9,
	@ 	.screenSize = 0,
	@ 	.paletteMode = 0,
	@ 	.priority = 3,
	@ 	.baseTile = 0x0000
	@ }
	.4byte 0x000022c9
	@ {
	@ 	.bg = 1,
	@ 	.charBaseIndex = 2,
	@ 	.mapBaseIndex = 12,
	@ 	.screenSize = 1,
	@ 	.paletteMode = 0,
	@ 	.priority = 2,
	@ 	.baseTile = 0x0000
	@ }

gUnknown_8463F0C:: @ 8463F0C window_template
	.byte 1, 0, 0, 13, 2, 7
	.2byte 0x0258
	.byte 1, 19, 0, 11, 2, 7
	.2byte 0x0272
	.byte 1, 0, 2, 15, 2, 7
	.2byte 0x0288

gUnknown_8463F24:: @ 8463F24 window_template
	.byte 2, 0, 0, 13, 2, 7
	.2byte 0x0258
	.byte 2, 19, 0, 11, 2, 7
	.2byte 0x0272
	.byte 2, 0, 2, 15, 2, 7
	.2byte 0x0288

gUnknown_8463F3C:: @ 8463F3C window_template
	.byte 0, 15, 2, 15, 12, 6
	.2byte 0x0001
	.byte 0, 1, 14, 28, 6, 6
	.2byte 0x00b5
	.byte 0, 0, 0, 0, 0, 0
	.2byte 0x0000
	.byte 0, 0, 0, 0, 0, 0
	.2byte 0x0000

gUnknown_8463F5C:: @ 8463F5C window_template
	.byte 0, 20, 2, 10, 14, 6
	.2byte 0x0001
	.byte 0, 6, 12, 14, 4, 6
	.2byte 0x008d
	.byte 0, 1, 16, 29, 4, 6
	.2byte 0x00c5
	.byte 0, 0, 0, 0, 0, 0
	.2byte 0x0000

gUnknown_8463F7C:: @ 8463F7C window_template
	.byte 0, 20, 2, 10, 18, 8
	.2byte 0x0001
	.byte 0, 0, 7, 15, 13, 6
	.2byte 0x00b5
	.byte 0, 15, 2, 5, 18, 6
	.2byte 0x0178
	.byte 0, 6, 4, 9, 2, 6
	.2byte 0x01d2

gUnknown_8463F9C:: @ 8463F9C window_template
	.byte 255, 0, 0, 0, 0, 0
	.2byte 0x0000

gUnknown_8463FA4:: @ 8463FA4 data8
	.byte 0x00, 0x0e, 0x0a

gUnknown_8463FA7:: @ 8463FA7 data8
	.byte 0x00, 0x01, 0x02, 0x00, 0x09, 0x08, 0x00, 0x05, 0x04, 0x00, 0x02, 0x03, 0x00, 0x0b, 0x0a, 0x00, 0x00

gUnknown_8463FB8:: @ 8463FB8 data8
	.byte 0x00, 0x02, 0x03, 0x01, 0x04, 0x05

gUnknown_8463FBE:: @ 8463FBE data8
	.byte 0xff, 0x00, 0x01

gUnknown_8463FC1:: @ 8463FC1 data8
	.byte 0xfe, 0xff, 0x00, 0x01, 0x02

gUnknown_8463FC6:: @ 8463FC6 data8
	.byte 0xfd, 0xfe, 0xff, 0x00, 0x01, 0x02, 0x03

gUnknown_8463FCD:: @ 8463FCD data8
	.byte 0xfb, 0xfd, 0xff, 0x00, 0x01, 0x03, 0x05

gUnknown_8463FD4:: @ 8463FD4 data8
	.byte 0x01, 0x01, 0x00, 0xff, 0xff, 0x00, 0xff, 0xff, 0x00, 0x01, 0x01

gUnknown_8463FDF:: @ 8463FDF data8
	.byte 0x02, 0x01, 0x00, 0xff, 0xfe, 0x00, 0xfe, 0xff, 0x00, 0x01, 0x02

gUnknown_8463FEA:: @ 8463FEA data8
	.byte 0x02, 0x01, 0x01, 0x00, 0xff, 0xff, 0xfe, 0x00, 0xfe, 0xff, 0xff, 0x00, 0x01, 0x01, 0x02, 0x00, 0x00, 0x00

gUnknown_8463FFC:: @ 8463FFC dataptr
	.4byte gUnknown_8E9B578
	.4byte gUnknown_8463AAC
	.4byte gUnknown_8463ACC
