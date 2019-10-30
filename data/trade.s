#include "constants/items.h"
#include "constants/species.h"
#include "constants/easy_chat.h"
#define RGB(r, g, b) ((r) | ((g) << 5) | ((b) << 10))
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2, 0

gOamData_826CD00::
	.4byte 0x40000100, 0x00000000

gAnimCmd_826CD08::
	obj_image_anim_frame 0x00, 3
	obj_image_anim_frame 0x04, 3
	obj_image_anim_frame 0x08, 3
	obj_image_anim_frame 0x0c, 3
	obj_image_anim_frame 0x10, 3
	obj_image_anim_frame 0x14, 3
	obj_image_anim_frame 0x18, 3
	obj_image_anim_frame 0x1c, 3
	obj_image_anim_frame 0x20, 3
	obj_image_anim_frame 0x24, 3
	obj_image_anim_frame 0x28, 3
	obj_image_anim_frame 0x2c, 3
	obj_image_anim_loop 1
	obj_image_anim_frame 0x00, 3
	obj_image_anim_end

gAnimCmd_826CD44::
	obj_image_anim_frame 0x00, 3
	obj_image_anim_frame 0x04, 3
	obj_image_anim_frame 0x08, 3
	obj_image_anim_frame 0x0c, 3
	obj_image_anim_frame 0x10, 3
	obj_image_anim_frame 0x14, 3
	obj_image_anim_frame 0x18, 3
	obj_image_anim_frame 0x1c, 3
	obj_image_anim_frame 0x20, 3
	obj_image_anim_frame 0x24, 3
	obj_image_anim_frame 0x28, 3
	obj_image_anim_frame 0x2c, 3
	obj_image_anim_loop 2
	obj_image_anim_frame 0x00, 3
	obj_image_anim_end

gSpriteAnimTable_826CD80::
	.4byte gAnimCmd_826CD08
	.4byte gAnimCmd_826CD44

gAffineAnimCmd_826CD88::
	obj_rot_scal_anim_frame 0x0000, 0x0000, 0x00, 0x01
	obj_rot_scal_anim_end

gAffineAnimCmd_826CD98::
	obj_rot_scal_anim_frame 0xfff8, 0x0000, 0x00, 0x14
	obj_rot_scal_anim_end

gAffineAnimCmd_826CDA8::
	obj_rot_scal_anim_frame 0x0060, 0x0100, 0x00, 0x00
	obj_rot_scal_anim_frame 0x0000, 0x0000, 0x00, 0x05
	obj_rot_scal_anim_frame 0x0008, 0x0000, 0x00, 0x14
	obj_rot_scal_anim_end

gSpriteAffineAnimTable_826CDC8::
	.4byte gAffineAnimCmd_826CD88
	.4byte gAffineAnimCmd_826CD98
	.4byte gAffineAnimCmd_826CDA8

gUnknown_826CDD4:: @ 826CDD4
	obj_tiles gTradeBallTiles, 0x0600, 5557

gUnknown_826CDDC:: @ 826CDDC
	obj_pal gTradeBallPalette, 5558

sTradePokeballSpriteTemplate:: @ 826CDE4
	spr_template 5557, 5558, gOamData_826CD00, gSpriteAnimTable_826CD80, NULL, gSpriteAffineAnimTable_826CDC8, SpriteCB_TradePokeball_Default

gOamData_826CDFC::
	.4byte 0x80000500, 0x00000400

gAnimCmd_826CE04::
	obj_image_anim_frame 0, 5, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

gSpriteAnimTable_826CE0C::
	.4byte gAnimCmd_826CE04

gAffineAnimCmd_826CE10::
	obj_rot_scal_anim_frame -10, -10, 0, 5
	obj_rot_scal_anim_frame  10,  10, 0, 5
	obj_rot_scal_anim_jump 0

gSpriteAffineAnimTable_826CE28::
	.4byte gAffineAnimCmd_826CE10

gUnknown_826CE2C:: @ 826CE2C
	obj_tiles gTradeGlow1Tiles, 0x0200, 5550

gUnknown_826CE34:: @ 826CE34
	obj_pal gUnknown_82649FC, 5551

gUnknown_826CE3C:: @ 826CE3C
	obj_pal gUnknown_826499C, 5555

gUnknown_826CE44:: @ 826CE44
	spr_template 5550, 5551, gOamData_826CDFC, gSpriteAnimTable_826CE0C, NULL, gSpriteAffineAnimTable_826CE28, SpriteCB_TradeGlowCable

gOamData_826CE5C::
	.4byte 0x80008000, 0x00000400

gAnimCmd_826CE64::
	obj_image_anim_frame 0, 5, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

gAnimCmd_826CE6C::
	obj_image_anim_frame 8, 5, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

gSpriteAnimTable_826CE74::
	.4byte gAnimCmd_826CE64
	.4byte gAnimCmd_826CE6C

gUnknown_826CE7C:: @ 826CE7C
	obj_tiles gTradeGlow2Tiles, 0x0300, 5552

sGlowBallSpriteTemplate:: @ 826CE84
	spr_template 5552, 5551, gOamData_826CE5C, gSpriteAnimTable_826CE74, NULL, gDummySpriteAffineAnimTable, SpriteCB_TradeGlowCore

gOamData_826CE9C::
	.4byte 0x80008000, 0x00000400

gAnimCmd_826CEA4::
	obj_image_anim_frame 0, 10
	obj_image_anim_end

gSpriteAnimTable_826CEAC::
	.4byte gAnimCmd_826CEA4

gUnknown_826CEB0:: @ 826CEB0
	obj_tiles gTradeCableEndTiles, 0x0100, 5554

sGameLinkCableEndSpriteTemplate:: @ 826CEB8
	spr_template 5554, 5555, gOamData_826CE9C, gSpriteAnimTable_826CEAC, NULL, gDummySpriteAffineAnimTable, SpriteCB_GameLinkCableEnd_Outbound

gOamData_826CED0::
	.4byte 0xc0004000, 0x00000400

gAnimCmd_826CED8::
	obj_image_anim_frame 0x00, 2, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 0x20, 2, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 0x40, 2, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 0x60, 2, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 0x40, 2, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 0x20, 2, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 0x00, 2, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_loop 8
	obj_image_anim_end

gAnimCmd_826CEFC::
	obj_image_anim_frame 0x00, 2, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 0x20, 2, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 0x40, 2, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 0x60, 2, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 0x40, 2, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 0x20, 2, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 0x00, 2, OBJ_IMAGE_ANIM_H_FLIP | OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_loop 2
	obj_image_anim_end

gSpriteAnimTable_826CF20::
	.4byte gAnimCmd_826CED8

gSpriteAnimTable_826CF24::
	.4byte gAnimCmd_826CEFC

gUnknown_826CF28:: @ 826CF28
	obj_tiles gTradeGBAScreenTiles, 0x1000, 5556

gUnknown_826CF30:: @ 826CF30
	spr_template 5556, 5555, gOamData_826CED0, gSpriteAnimTable_826CF20, NULL, gDummySpriteAffineAnimTable, sub_804FE00

gUnknown_826CF48:: @ 826CF48
	spr_template 5556, 5555, gOamData_826CED0, gSpriteAnimTable_826CF24, NULL, gDummySpriteAffineAnimTable, sub_804FE00

gTradeGlow2PaletteAnimTable:: @ 826CF60
	.2byte RGB(18, 24, 31)
	.2byte RGB(18, 24, 31)
	.2byte RGB(18, 24, 31)
	.2byte RGB(31, 31, 31)
	.2byte RGB(31, 31, 31)
	.2byte RGB(31, 31, 31)
	.2byte RGB(18, 24, 31)
	.2byte RGB(18, 24, 31)
	.2byte RGB(18, 24, 31)
	.2byte RGB(31, 31, 31)
	.2byte RGB(31, 31, 31)
	.2byte RGB(31, 31, 31)

gAffineAnimCmd_826CF78::
	obj_rot_scal_anim_frame 0xFF00, 0x0100, 0x00, 0x00
	obj_rot_scal_anim_jump 0

gUnknown_826CF88:: @ 826CF88
	.4byte gAffineAnimCmd_826CF78

	.include "data/ingame_trades.inc"

gUnknown_826D1BC:: @ 826D1BC
	.byte 0, 2, 15, 26, 4, 0
	.2byte 0x0040
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 2,
	@   .tilemapTop = 15,
	@   .width = 26,
	@   .height = 4,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0040
	@ }
	.byte 255, 0, 0, 0, 0, 0
	.2byte 0x0000
	@ {
	@   .bg = 255,
	@   .tilemapLeft = 0,
	@   .tilemapTop = 0,
	@   .width = 0,
	@   .height = 0,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0000
	@ }

gUnknown_826D1CC:: @ 826D1CC
	.byte 0, 21, 9, 6, 4, 15
	.2byte 0x00bc
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 21,
	@   .tilemapTop = 9,
	@   .width = 6,
	@   .height = 4,
	@   .paletteNum = 15,
	@   .baseBlock = 0x00bc
	@ }

gUnknown_826D1D4:: @ 826D1D4
	.4byte 0x000001fc
	@ {
	@   .bg = 0,
	@   .charBaseIndex = 3,
	@   .mapBaseIndex = 31,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 0,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x00002051
	@ {
	@   .bg = 1,
	@   .charBaseIndex = 0,
	@   .mapBaseIndex = 5,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 2,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x00002326
	@ {
	@   .bg = 2,
	@   .charBaseIndex = 1,
	@   .mapBaseIndex = 18,
	@   .screenSize = 1,
	@   .paletteMode = 0,
	@   .priority = 2,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x00003063
	@ {
	@   .bg = 3,
	@   .charBaseIndex = 0,
	@   .mapBaseIndex = 6,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 3,
	@   .baseTile = 0x0000
	@ }

gUnknown_826D1E4:: @ 826D1E4
	.byte 0x00
	.byte 0x00
	.byte 0x01
	.byte 0x00
	.byte 0x01
	.byte 0x00
	.byte 0x01
	.byte 0x01
	.byte 0x01
	.byte 0x01
	.byte 0x02
	.byte 0x02
	.byte 0x02
	.byte 0x02
	.byte 0x03
	.byte 0x03
	.byte 0x03
	.byte 0x03
	.byte 0x04
	.byte 0x04
	.byte 0x04
	.byte 0x04
	.byte 0xfc
	.byte 0xfc
	.byte 0xfc
	.byte 0xfd
	.byte 0xfd
	.byte 0xfd
	.byte 0xfd
	.byte 0xfe
	.byte 0xfe
	.byte 0xfe
	.byte 0xfe
	.byte 0xff
	.byte 0xff
	.byte 0xff
	.byte 0xff
	.byte 0x00
	.byte 0xff
	.byte 0x00
	.byte 0xff
	.byte 0x00
	.byte 0x00
	.byte 0x00

	.incbin "baserom.gba", 0x26D210, 0x40

gUnknown_826D250:: @ 826D250
	.byte 0x00, 0x01
	.byte 0x01, 0x01
	.byte 0x02, 0x01
	.byte 0x03, 0x01
	.byte 0x04, 0x01
	.byte 0x05, 0x02
	.byte 0x06, 0x02
	.byte 0x07, 0x02
	.byte 0x08, 0x02
	.byte 0x09, 0x02
	.byte 0x0a, 0x03
	.byte 0x0b, 0x03
	.byte 0x0c, 0x03
	.byte 0x0d, 0x04
	.byte 0x0e, 0x05
	.byte 0x0f, 0x02
	.byte 0x00, 0x01
	.byte 0x01, 0x01
	.byte 0x02, 0x01
	.byte 0x03, 0x01
	.byte 0x04, 0x01
	.byte 0x05, 0x02
	.byte 0x06, 0x02
	.byte 0x07, 0x02
	.byte 0x08, 0x02
	.byte 0x09, 0x02
	.byte 0x0a, 0x03
	.byte 0x0b, 0x03
	.byte 0x0c, 0x03
	.byte 0x0d, 0x04
	.byte 0x0e, 0x05
	.byte 0x10, 0x01
	.byte 0x10, 0xff

	.align 2, 0
