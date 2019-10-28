#include "constants/region_map.h"
#include "constants/trainer_classes.h"
#include "constants/songs.h"
#include "constants/flags.h"
#include "constants/region_map.h"
#include "constants/maps.h"
#define RGB(r, g, b) ((r) | ((g) << 5) | ((b) << 10))
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2, 0

gUnknown_8260270:: @ 8260270
	.4byte 0xc0004000, 0x00000400

gUnknown_8260278:: @ 8260278
	spr_template 55039, 55039, gUnknown_8260270, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
	spr_template 55040, 55039, gUnknown_8260270, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_82602A8:: @ 82602A8
	spr_template 55041, 55039, gUnknown_8260270, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
	spr_template 55042, 55039, gUnknown_8260270, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_82602D8:: @ 82602D8
	spr_template 55051, 55039, gUnknown_8260270, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_82602F0::
	.4byte 0x40004000, 0x00000400

gUnknown_82602F8:: @ 82602F8
	spr_template 55044, 55044, gUnknown_82602F0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80480B8
	spr_template 55045, 55044, gUnknown_82602F0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80480B8
	spr_template 55046, 55044, gUnknown_82602F0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80480B8
	spr_template 55047, 55044, gUnknown_82602F0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80480B8

gUnknown_8260358::
	subsprite 240, 0, 1, 0x0000, 64x32
	subsprite 48, 0, 1, 0x0020, 32x32
	subsprite 240, 32, 1, 0x0030, 32x8
	subsprite 16, 32, 1, 0x0034, 32x8
	subsprite 48, 32, 1, 0x0038, 32x8

gUnknown_826036C::
	subsprite 240, 0, 1, 0x0040, 64x32
	subsprite 48, 0, 1, 0x0060, 32x32
	subsprite 240, 32, 1, 0x0070, 32x8
	subsprite 16, 32, 1, 0x0074, 32x8
	subsprite 48, 32, 1, 0x0078, 32x8

gUnknown_8260380::
	subsprite 240, 0, 1, 0x0000, 64x32
	subsprite 48, 0, 1, 0x0020, 32x32

gUnknown_8260388::
	subsprite 240, 0, 1, 0x0000, 64x32
	subsprite 48, 0, 1, 0x0020, 32x32

gUnknown_8260390::
	subsprite 240, 0, 1, 0x0000, 32x8
	subsprite 16, 0, 1, 0x0004, 32x8

gUnknown_8260398::
	subsprite 240, 0, 1, 0x0000, 32x8
	subsprite 16, 0, 1, 0x0004, 32x8
	subsprite 224, 0, 1, 0x0008, 8x8

gUnknown_82603A4::
	.4byte 5, gUnknown_8260358
	.4byte 2, gUnknown_8260380
	.4byte 5, gUnknown_826036C
	.4byte 2, gUnknown_8260388

gUnknown_82603C4:: @ 82603C4
	.4byte 2, gUnknown_8260390
	.4byte 3, gUnknown_8260398

gUnknown_82603D4::
	subsprite 160, 0, 1, 0x0000, 32x8
	subsprite 192, 0, 1, 0x0004, 32x8
	subsprite 224, 0, 1, 0x0008, 32x8
	subsprite 0, 0, 1, 0x000c, 32x8

gUnknown_82603E4::
	subsprite 160, 0, 1, 0x0000, 32x8
	subsprite 192, 0, 1, 0x0004, 32x8
	subsprite 224, 0, 1, 0x0008, 32x8
	subsprite 0, 0, 1, 0x0008, 32x8
	subsprite 32, 0, 1, 0x0008, 32x8
	subsprite 64, 0, 1, 0x000c, 32x8

gUnknown_82603FC:: @ 82603FC
	.4byte 4, gUnknown_82603D4

gUnknown_8260404:: @ 8260404
	.4byte 6, gUnknown_82603E4

gUnknown_26040C::
	.incbin "graphics/battle_interface/unk_826404C.4bpp"

gUnknown_826046C:: @ 826046C
	obj_tiles gFile_graphics_battle_interface_ball_status_bar_sheet, 0x0200, 55052
	obj_tiles gFile_graphics_battle_interface_ball_status_bar_sheet, 0x0200, 55053

gUnknown_826047C:: @ 826047C
	obj_pal gBattleInterface_BallStatusBarPal, 55056
	obj_pal gBattleInterface_BallStatusBarPal, 55057

gUnknown_826048C:: @ 826048C
	obj_pal gBattleInterface_BallDisplayPal, 55058
	obj_pal gBattleInterface_BallDisplayPal, 55059

gUnknown_826049C:: @ 826049C
	obj_tiles gUnknown_8D12404, 0x0080, 55060
	obj_tiles gUnknown_8D12404, 0x0080, 55061

gUnknown_82604AC::
	.4byte 0xc0004000, 0x00000400

gUnknown_82604B4::
	.4byte 0x00000000, 0x00000400

gUnknown_82604BC:: @ 82604BC
	spr_template 55052, 55056, gUnknown_8260270, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCB_StatusSummaryBar
	spr_template 55053, 55057, gUnknown_8260270, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCB_StatusSummaryBar

gUnknown_82604EC:: @ 82604EC
	spr_template 55060, 55058, gUnknown_82604B4, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCB_StatusSummaryBallsOnBattleStart
	spr_template 55061, 55059, gUnknown_82604B4, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCB_StatusSummaryBallsOnBattleStart

gUnknown_826051C:: @ 826051C
	.string "{EXTRA_LV}$", 16

gUnknown_826052C:: @ 826052C
	.string "{COLOR 01}{HIGHLIGHT 02}", 20

gUnknown_8260540:: @ 8260540
	.string "/$"

gUnknown_8260542:: @ 8260542
	.string "{COLOR 01}{HIGHLIGHT 00}", 20

gUnknown_8260556:: @ 8260556
	.string "{HIGHLIGHT 02}$"

gUnknown_826055A:: @ 826055A
	.2byte RGB(24, 12, 24)
	.2byte RGB(23, 23, 3)
	.2byte RGB(20, 20, 17)
	.2byte RGB(17, 22, 28)
	.2byte RGB(28, 14, 10)

gUnknown_8260564:: @ 8260564
	.byte 0, 0, 0, 8, 2, 0
	.2byte 0x0000
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 0,
	@   .tilemapTop = 0,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0000
	@ }
