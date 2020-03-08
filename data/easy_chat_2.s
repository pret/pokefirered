#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
#define RGB(r, g, b) ((r) | ((g) << 5) | ((b) << 10))
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_843FA38::
	.4byte 0xc0000000, 0x00000c00

gUnknown_843FA40:: @ 843FA40 sprite_template
	spr_template 6, 2, gUnknown_843FA38, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_843FA58::
	.4byte 0x40004000, 0x00000400

gUnknown_843FA60::
	.4byte 0x40000000, 0x00000400

gUnknown_843FA68::
	obj_image_anim_frame 0x0000, 0
	obj_image_anim_end

gUnknown_843FA70::
	obj_image_anim_frame 0x0004, 0
	obj_image_anim_end

gUnknown_843FA78::
	.4byte gUnknown_843FA68
	.4byte gUnknown_843FA70

gUnknown_843FA80:: @ 843FA80 sprite_template
	spr_template 3, 2, gUnknown_843FA58, gUnknown_843FA78, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_843FA98:: @ 843FA98 sprite_template
	spr_template 2, 2, gUnknown_843FA60, gUnknown_843FA78, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
