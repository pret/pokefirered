#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_841EE84:: @ 841EE84
	.incbin "graphics/misc/evolution_sprite_841EEA4.gbapal"

gUnknown_841EEA4::
	.incbin "graphics/misc/evolution_sprite_841EEA4.4bpp.lz"

gUnknown_841EEC4:: @ 841EEC4
	obj_tiles gUnknown_841EEA4, 0x0020, 1001
	null_obj_tiles

gUnknown_841EED4:: @ 841EED4
	obj_pal gUnknown_841EE84, 1001
	null_obj_pal

gOamData_841EEE4::
	.4byte 0x000000a0, 0x00000400

gUnknown_841EEEC::
	obj_image_anim_frame 0x0000, 8
	obj_image_anim_end

gUnknown_841EEF4::
	.4byte gUnknown_841EEEC

gUnknown_841EEF8:: @ 841EEF8
	spr_template 1001, 1001, gOamData_841EEE4, gUnknown_841EEF4, NULL, gDummySpriteAffineAnimTable, nullsub_85

gUnknown_841EF10:: @ 841EF10
	.2byte 0x03c0, 0x0380, 0x0340, 0x0300, 0x02c0, 0x0280, 0x0240, 0x0200, 0x01c0, 0x0180, 0x0140, 0x0100

gUnknown_841EF28:: @ 841EF28
	.2byte -4, 0x10
	.2byte -3, 0x30
	.2byte -2, 0x50
	.2byte -1, 0x70
	.2byte  1, 0x70
	.2byte  2, 0x50
	.2byte  3, 0x30
	.2byte  4, 0x10
