#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_840C228:: @ 840C228
	.4byte 0x000001f8
	@ {
	@ 	.bg = 0,
	@ 	.charBaseIndex = 2,
	@ 	.mapBaseIndex = 31,
	@ 	.screenSize = 0,
	@ 	.paletteMode = 0,
	@ 	.priority = 0,
	@ 	.baseTile = 0x0000
	@ }
	.4byte 0x000011e1
	@ {
	@ 	.bg = 1,
	@ 	.charBaseIndex = 0,
	@ 	.mapBaseIndex = 30,
	@ 	.screenSize = 0,
	@ 	.paletteMode = 0,
	@ 	.priority = 1,
	@ 	.baseTile = 0x0000
	@ }
	.4byte 0x000031d3
	@ {
	@ 	.bg = 3,
	@ 	.charBaseIndex = 0,
	@ 	.mapBaseIndex = 29,
	@ 	.screenSize = 0,
	@ 	.paletteMode = 0,
	@ 	.priority = 3,
	@ 	.baseTile = 0x0000
	@ }

gUnknown_840C234:: @ 840C234
	.byte 0, 2, 2, 17, 6, 13
	.2byte 0x0001

	.align 2
gUnknown_840C23C:: @ 840C23C
	.byte 0, 1, 2

	.align 2
gUnknown_840C240:: @ 840C240
	.byte 0, 2, 3
	.byte 0, 4, 5

	.align 2
gUnknown_840C248:: @ 840C248
	obj_tiles gFile_graphics_misc_confetti_sheet, 0x220, 1001
	null_obj_tiles

gUnknown_840C258:: @ 840C258
	obj_pal gFile_graphics_misc_confetti_palette, 1001
	null_obj_pal

gUnknown_840C268:: @ 840C268
	.2byte 0x0078, 0x00d2, 0x0078, 0x0028
	.2byte 0x0146, 0x00dc, 0x0038, 0x0028
	.2byte 0xffaa, 0x00dc, 0x00b8, 0x0028
	.2byte 0x0078, 0xffc2, 0x0078, 0x0058
	.2byte 0xffba, 0xffa4, 0x00c8, 0x0058
	.2byte 0x0136, 0xffa4, 0x0028, 0x0058

gUnknown_840C298:: @ 840C298
	.2byte 0x0078, 0x00ea, 0x0078, 0x0040
	.2byte 0x0146, 0x00f4, 0x0038, 0x0040
	.2byte 0xffaa, 0x00f4, 0x00b8, 0x0040

gOamData_840C2B0::
	.4byte 0x00000000, 0x00000000

gAnimCmd_840C2B8::
	obj_image_anim_frame 0x00, 30
	obj_image_anim_end

gAnimCmd_840C2C0::
	obj_image_anim_frame 0x01, 30
	obj_image_anim_end

gAnimCmd_840C2C8::
	obj_image_anim_frame 0x02, 30
	obj_image_anim_end

gAnimCmd_840C2D0::
	obj_image_anim_frame 0x03, 30
	obj_image_anim_end

gAnimCmd_840C2D8::
	obj_image_anim_frame 0x04, 30
	obj_image_anim_end

gAnimCmd_840C2E0::
	obj_image_anim_frame 0x05, 30
	obj_image_anim_end

gAnimCmd_840C2E8::
	obj_image_anim_frame 0x06, 30
	obj_image_anim_end

gAnimCmd_840C2F0::
	obj_image_anim_frame 0x07, 30
	obj_image_anim_end

gAnimCmd_840C2F8::
	obj_image_anim_frame 0x08, 30
	obj_image_anim_end

gAnimCmd_840C300::
	obj_image_anim_frame 0x09, 30
	obj_image_anim_end

gAnimCmd_840C308::
	obj_image_anim_frame 0x0a, 30
	obj_image_anim_end

gAnimCmd_840C310::
	obj_image_anim_frame 0x0b, 30
	obj_image_anim_end

gAnimCmd_840C318::
	obj_image_anim_frame 0x0c, 30
	obj_image_anim_end

gAnimCmd_840C320::
	obj_image_anim_frame 0x0d, 30
	obj_image_anim_end

gAnimCmd_840C328::
	obj_image_anim_frame 0x0e, 30
	obj_image_anim_end

gAnimCmd_840C330::
	obj_image_anim_frame 0x0f, 30
	obj_image_anim_end

gAnimCmd_840C338::
	obj_image_anim_frame 0x10, 30
	obj_image_anim_end

gSpriteAnimTable_840C340::
	.4byte gAnimCmd_840C2B8
	.4byte gAnimCmd_840C2C0
	.4byte gAnimCmd_840C2C8
	.4byte gAnimCmd_840C2D0
	.4byte gAnimCmd_840C2D8
	.4byte gAnimCmd_840C2E0
	.4byte gAnimCmd_840C2E8
	.4byte gAnimCmd_840C2F0
	.4byte gAnimCmd_840C2F8
	.4byte gAnimCmd_840C300
	.4byte gAnimCmd_840C308
	.4byte gAnimCmd_840C310
	.4byte gAnimCmd_840C318
	.4byte gAnimCmd_840C320
	.4byte gAnimCmd_840C328
	.4byte gAnimCmd_840C330
	.4byte gAnimCmd_840C338

gUnknown_840C384:: @ 840C384
	spr_template 1001, 1001, gOamData_840C2B0, gSpriteAnimTable_840C340, NULL, gDummySpriteAffineAnimTable, sub_80F38D8

gUnknown_840C39C:: @ 840C39C
	.incbin "graphics/hall_of_fame/unk_840C3BC.gbapal"

gUnknown_840C3BC:: @ 840C3BC
	.incbin "graphics/hall_of_fame/unk_840C3BC.4bpp.lz"

gUnknown_840C588::
	@ Unreferenced
	.2byte 1002, 1002
	.space 16
	.byte 2, 1, 3
	.byte 6, 4, 5
