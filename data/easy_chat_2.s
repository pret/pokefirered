#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
#define RGB(r, g, b) ((r) | ((g) << 5) | ((b) << 10))
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_843F3B8:: @ 843F3B8 gbapal
	.incbin "graphics/link_rfu/unk_843F3F8.gbapal"

gUnknown_843F3D8:: @ 843F3D8 gbapal
	.incbin "graphics/link_rfu/unk_8E9BD28.gbapal"

gUnknown_843F3F8:: @ 843F3F8 4bpp
	.incbin "graphics/link_rfu/unk_843F3F8.4bpp"

gUnknown_843F418:: @ 843F418 4bpp
	.incbin "graphics/link_rfu/unk_843F418.4bpp"

gUnknown_843F518:: @ 843F518 4bpp
	.incbin "graphics/link_rfu/unk_843F518.4bpp"

gUnknown_843F618:: @ 843F618 gbapal
	.incbin "graphics/link_rfu/unk_843F638.gbapal"

gUnknown_843F638:: @ 843F638 4bpp.lz
	.incbin "graphics/link_rfu/unk_843F638.4bpp.lz"

gUnknown_843F76C:: @ 843F76C gbapal
	.incbin "graphics/link_rfu/unk_843F76C.gbapal"

gUnknown_843F78C:: @ 843F78C gbapal
	.incbin "graphics/link_rfu/unk_843F78C.gbapal"

gUnknown_843F7AC:: @ 843F7AC 4bpp.lz
	.incbin "graphics/link_rfu/unk_843F7AC.4bpp.lz"

gUnknown_843F874:: @ 843F874 gbapal
	.2byte RGB(0, 0, 0)
	.2byte RGB(0, 0, 0)
	.2byte RGB(7, 25, 31)
	.2byte RGB(21, 21, 29)

gUnknown_843F87C:: @ 843F87C gbapal
	.2byte RGB(0, 0, 0)
	.2byte RGB(31, 31, 31)
	.2byte RGB(12, 12, 12)
	.2byte RGB(27, 26, 27)
	.2byte RGB(8, 17, 9)

	.align 2
gUnknown_843F888:: @ 843F888 data8 6x4
	.byte 0x03, 0x04, 0x18, 0x04
	.byte 0x01, 0x04, 0x1b, 0x04
	.byte 0x03, 0x00, 0x18, 0x0a
	.byte 0x06, 0x06, 0x12, 0x04
	.byte 0x10, 0x04, 0x09, 0x02
	.byte 0x0e, 0x04, 0x12, 0x04

gUnknown_843F8A0:: @ 843F8A0 bg_template
	.4byte 0x000001c0, 0x000011dd, 0x002021e2, 0x000031fb

gUnknown_843F8B0:: @ 843F8B0 window_template
	.align 2
	.byte 0x01, 0x07, 0x00, 0x10, 0x02, 0x0a
	.2byte 0x0010
	@ {0x01, 0x07, 0x00, 0x10, 0x02, 0x0a, 0x0010}
	.align 2
	.byte 0x00, 0x04, 0x0f, 0x16, 0x04, 0x0f
	.2byte 0x000a
	@ {0x00, 0x04, 0x0f, 0x16, 0x04, 0x0f, 0x000a}
	.align 2
	.byte 0x02, 0x01, 0x00, 0x1c, 0x20, 0x03
	.2byte 0x0000
	@ {0x02, 0x01, 0x00, 0x1c, 0x20, 0x03, 0x0000}
	.align 2
	.byte 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
	.2byte 0x0000
	@ {0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0000}

gUnknown_843F8D0:: @ 843F8D0 window_template
	.align 2
	.byte 0x00, 0x16, 0x09, 0x05, 0x04, 0x0f
	.2byte 0x0062
	@ {0x00, 0x16, 0x09, 0x05, 0x04, 0x0f, 0x0062}

gUnknown_843F8D8:: @ 843F8D8 text
	.string "{UNDERSCORE}$"

gUnknown_843F8DB:: @ 843F8DB text
	.string "{CLEAR 17}$"

	.align 2
gUnknown_843F8E0:: @ 843F8E0
	.4byte gUnknown_847A8D8
	.4byte gUnknown_847A8FA
	.4byte gUnknown_847A913
	.4byte gUnknown_847A934

gUnknown_843F8F0:: @ 843F8F0 sprite_sheet
	obj_tiles gUnknown_843F3F8, 0x0020, 0
	obj_tiles gUnknown_843F418, 0x0100, 2
	obj_tiles gUnknown_843F518, 0x0100, 3
	null_obj_tiles

gUnknown_843F910:: @ 843F910 sprite_palette
	obj_pal gUnknown_843F3B8, 0
	obj_pal gUnknown_843F3D8, 1
	obj_pal gUnknown_8E99F24, 2
	obj_pal gUnknown_843F618, 3
	null_obj_pal

gUnknown_843F938:: @ 843F938 sprite_sheet
	obj_tiles gUnknown_843F638, 0x0800, 5
	obj_tiles gUnknown_8E9BD28, 0x1000, 1
	obj_tiles gUnknown_8E99F44, 0x0800, 6
	obj_tiles gUnknown_8E9A168, 0x1000, 4

gUnknown_843F958:: @ 843F958 data8
	.byte 0x00, 0x0c, 0x18, 0x38, 0x44, 0x50, 0x5c, 0x00

gUnknown_843F960::
	.4byte 0x00000000, 0x00000c00

gUnknown_843F968:: @ 843F968 sprite_template
	spr_template 0, 0, gUnknown_843F960, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8101B20

gUnknown_843F980::
	.4byte 0xc0004000, 0x00000400

gUnknown_843F988::
	obj_image_anim_frame 0x0000, 0
	obj_image_anim_end

gUnknown_843F990::
	obj_image_anim_frame 0x0020, 0
	obj_image_anim_end

gUnknown_843F998::
	obj_image_anim_frame 0x0040, 0
	obj_image_anim_end

gUnknown_843F9A0::
	obj_image_anim_frame 0x0060, 0
	obj_image_anim_end

gUnknown_843F9A8::
	.4byte gUnknown_843F988
	.4byte gUnknown_843F990
	.4byte gUnknown_843F998
	.4byte gUnknown_843F9A0

gUnknown_843F9B8:: @ 843F9B8 sprite_template
	spr_template 1, 1, gUnknown_843F980, gUnknown_843F9A8, NULL, gDummySpriteAffineAnimTable, sub_8101B20

gUnknown_843F9D0::
	.4byte 0xc0004000, 0x00000400

gUnknown_843F9D8::
	obj_image_anim_frame 0x0060, 0
	obj_image_anim_end

gUnknown_843F9E0::
	obj_image_anim_frame 0x0040, 4
	obj_image_anim_frame 0x0020, 4
	obj_image_anim_end

gUnknown_843F9EC::
	obj_image_anim_frame 0x0040, 4
	obj_image_anim_frame 0x0000, 4
	obj_image_anim_end

gUnknown_843F9F8::
	obj_image_anim_frame 0x0040, 4
	obj_image_anim_frame 0x0060, 0
	obj_image_anim_end

gUnknown_843FA04::
	obj_image_anim_frame 0x0040, 4
	obj_image_anim_end

gUnknown_843FA0C::
	.4byte gUnknown_843F9D8
	.4byte gUnknown_843F9E0
	.4byte gUnknown_843F9EC
	.4byte gUnknown_843F9F8
	.4byte gUnknown_843FA04

gUnknown_843FA20:: @ 843FA20 sprite_template
	spr_template 4, 2, gUnknown_843F9D0, gUnknown_843FA0C, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

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
