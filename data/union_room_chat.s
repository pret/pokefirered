#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_845AA24:: @ 845AA24
	.incbin "graphics/union_room_chat/unk_845AA24.gbapal"

gUnknown_845AA44:: @ 845AA44
	.incbin "graphics/union_room_chat/unk_845AA44.gbapal"

gUnknown_845AA64:: @ 845AA64
	.incbin "graphics/union_room_chat/unk_845AA64.gbapal"

gUnknown_845AA84:: @ 845AA84
	.4byte 0x00000070
	@ {
	@ 	.bg = 0,
	@ 	.charBaseIndex = 0,
	@ 	.mapBaseIndex = 7,
	@ 	.screenSize = 0,
	@ 	.paletteMode = 0,
	@ 	.priority = 0,
	@ 	.baseTile = 0x0000
	@ }
	.4byte 0x000011fd
	@ {
	@ 	.bg = 1,
	@ 	.charBaseIndex = 3,
	@ 	.mapBaseIndex = 31,
	@ 	.screenSize = 0,
	@ 	.paletteMode = 0,
	@ 	.priority = 1,
	@ 	.baseTile = 0x0000
	@ }
	.4byte 0x0000217a
	@ {
	@ 	.bg = 2,
	@ 	.charBaseIndex = 2,
	@ 	.mapBaseIndex = 23,
	@ 	.screenSize = 0,
	@ 	.paletteMode = 0,
	@ 	.priority = 2,
	@ 	.baseTile = 0x0000
	@ }
	.4byte 0x000070f7
	@ {
	@ 	.bg = 3,
	@ 	.charBaseIndex = 1,
	@ 	.mapBaseIndex = 15,
	@ 	.screenSize = 0,
	@ 	.paletteMode = 0,
	@ 	.priority = 3,
	@ 	.baseTile = 0x0001
	@ }

gUnknown_845AA94:: @ 845AA94
	.byte 3, 8, 1, 21, 19, 15
	.2byte 0x0001
	.byte 1, 9, 18, 15, 2, 12
	.2byte 0x007a
	.byte 1, 0, 2, 6, 15, 7
	.2byte 0x0020
	.byte 0, 1, 2, 7, 9, 14
	.2byte 0x0013
	.byte 255, 0, 0, 0, 0, 0
	.2byte 0x0000

gUnknown_845AABC:: @ 845AABC
	.2byte 0x00
	.align 2
	.4byte sub_8129CA0
	.2byte 0x03
	.align 2
	.4byte sub_8129D40
	.2byte 0x04
	.align 2
	.4byte sub_8129D78
	.2byte 0x05
	.align 2
	.4byte sub_8129DB0
	.2byte 0x01
	.align 2
	.4byte sub_8129E1C
	.2byte 0x06
	.align 2
	.4byte sub_8129E28
	.2byte 0x07
	.align 2
	.4byte sub_8129E74
	.2byte 0x08
	.align 2
	.4byte sub_8129EB8
	.2byte 0x09
	.align 2
	.4byte sub_8129F24
	.2byte 0x0a
	.align 2
	.4byte sub_8129FCC
	.2byte 0x0b
	.align 2
	.4byte sub_812A074
	.2byte 0x0c
	.align 2
	.4byte sub_812A0B0
	.2byte 0x02
	.align 2
	.4byte sub_812A18C
	.2byte 0x0d
	.align 2
	.4byte sub_812A1B8
	.2byte 0x12
	.align 2
	.4byte sub_812A1FC
	.2byte 0x13
	.align 2
	.4byte sub_812A240
	.2byte 0x0e
	.align 2
	.4byte sub_812A294
	.2byte 0x0f
	.align 2
	.4byte sub_812A2E4
	.2byte 0x10
	.align 2
	.4byte sub_812A334
	.2byte 0x11
	.align 2
	.4byte sub_812A378
	.2byte 0x14
	.align 2
	.4byte sub_812A3D0

gUnknown_845AB64:: @ 845AB64
	.4byte gUnknown_841B366
	.byte 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00
	.align 2
	.4byte gUnknown_841B375
	.byte 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00
	.align 2
	.4byte gUnknown_841B38A
	.byte 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00
	.align 2
	.4byte gUnknown_841B39E
	.byte 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00
	.align 2
	.4byte gUnknown_841B3E9
	.byte 0x02, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00
	.align 2
	.4byte gUnknown_841B3FB
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00
	.align 2
	.4byte gUnknown_841B426
	.byte 0x02, 0x00, 0x00, 0x01, 0x02, 0x00, 0x01
	.align 2
	.4byte gUnknown_841B469
	.byte 0x02, 0x00, 0x00, 0x01, 0x02, 0x00, 0x01
	.align 2
	.4byte gUnknown_841B4A4
	.byte 0x02, 0x00, 0x00, 0x01, 0x02, 0x00, 0x01
	.align 2
	.4byte gUnknown_841B4C6
	.byte 0x02, 0x00, 0x00, 0x01, 0x02, 0x01, 0x01
	.align 2
	.4byte gUnknown_841B4D9
	.byte 0x02, 0x00, 0x00, 0x01, 0x02, 0x00, 0x01
	.align 2

gUnknown_845ABE8:: @ 845ABE8
	.string "…$"

	.align 2
gUnknown_845ABEC:: @ 845ABEC
	.4byte gUnknown_841B33D, 0
	.4byte gUnknown_841B343, 0
	.4byte gUnknown_841B350, 0
	.4byte gUnknown_841B358, 0
	.4byte gUnknown_841B361, 0

gUnknown_845AC14:: @ 845AC14
	.incbin "graphics/union_room_chat/unk_845AC14.gbapal"

gUnknown_845AC34::
	.incbin "graphics/union_room_chat/unk_845AC34.4bpp.lz"

gUnknown_845AEB8::
	.incbin "graphics/union_room_chat/unk_845AEB8.4bpp.lz"

gUnknown_845AED8::
	.incbin "graphics/union_room_chat/unk_845AED8.4bpp.lz"

gUnknown_845AF04::
	.incbin "graphics/union_room_chat/unk_845AF04.4bpp.lz"

gUnknown_845AF58:: @ 845AF58
	obj_tiles gUnknown_845AC34, 0x1000, 0
	obj_tiles gUnknown_845AED8, 0x0040, 1
	obj_tiles gUnknown_845AEB8, 0x0040, 2
	obj_tiles gUnknown_845AF04, 0x0080, 3
	obj_tiles gUnknown_8EA1A50, 0x0400, 4

gUnknown_845AF80:: @ 845AF80
	obj_pal gUnknown_845AC14, 0

gOamData_845AF88::
	.4byte 0xc0004000, 0x00000400

gAnimCmd_845AF90::
	obj_image_anim_frame 0x0000, 30
	obj_image_anim_end

gAnimCmd_845AF98::
	obj_image_anim_frame 0x0020, 30
	obj_image_anim_end

gAnimCmd_845AFA0::
	obj_image_anim_frame 0x0040, 30
	obj_image_anim_end

gAnimCmd_845AFA8::
	obj_image_anim_frame 0x0060, 30
	obj_image_anim_end

gSpriteAnimTable_845AFB0::
	.4byte gAnimCmd_845AF90
	.4byte gAnimCmd_845AF98
	.4byte gAnimCmd_845AFA0
	.4byte gAnimCmd_845AFA8

gUnknown_845AFC0:: @ 845AFC0
	spr_template 0, 0, gOamData_845AF88, gSpriteAnimTable_845AFB0, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gOamData_845AFD8::
	.4byte 0x00008000, 0x00000800

gUnknown_845AFE0:: @ 845AFE0
	spr_template 2, 0, gOamData_845AFD8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812B09C

gUnknown_845AFF8:: @ 845AFF8
	spr_template 1, 0, gOamData_845AFD8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_812B0D4

gOamData_845B010::
	.4byte 0x40000000, 0x00000800

gOamData_845B018::
	.4byte 0x80004000, 0x00000800

gAnimCmd_845B020::
	obj_image_anim_frame 0x0000, 2
	obj_image_anim_end

gAnimCmd_845B028::
	obj_image_anim_frame 0x0008, 2
	obj_image_anim_end

gAnimCmd_845B030::
	obj_image_anim_frame 0x0010, 2
	obj_image_anim_end

gAnimCmd_845B038::
	obj_image_anim_frame 0x0018, 2
	obj_image_anim_end

gSpriteAnimTable_845B040::
	.4byte gAnimCmd_845B020
	.4byte gAnimCmd_845B028
	.4byte gAnimCmd_845B030
	.4byte gAnimCmd_845B038

gUnknown_845B050:: @ 845B050
	spr_template 3, 0, gOamData_845B010, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_845B068:: @ 845B068
	spr_template 4, 0, gOamData_845B018, gSpriteAnimTable_845B040, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
