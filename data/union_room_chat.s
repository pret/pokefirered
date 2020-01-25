#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

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
