#include "constants/items.h"
#include "constants/species.h"
#include "constants/easy_chat.h"
#define RGB(r, g, b) ((r) | ((g) << 5) | ((b) << 10))
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2, 0

	@ unknown
gUnknown_8260814:: @ 8260814
	.4byte 0x00000f24 @ sizeof(struct SaveBlock2)
	.4byte 0x00003d68 @ sizeof(struct SaveBlock1)
	.4byte 0x0000001c @ sizeof(struct MapData)
	.4byte 0x00000530 @ unk
	.4byte 0x00000034 @ unk
	.4byte 0x00000024 @ sizeof(struct MailStruct)
	.4byte 0x00000064 @ sizeof(struct Pokemon)
	.4byte 0x00000528

gTradeMovesBoxTilemap:: @ 8260834
	.incbin "data/trade/unk_8260834.bin"

gTradePartyBoxTilemap:: @ 8260A32
	.incbin "data/trade/unk_8260A32.bin"

gUnknown_8260C30:: @ 8260C30
	.incbin "data/trade/unk_8260C30.bin"

gUnknown_8261430:: @ 8261430
	.incbin "data/trade/unk_8261430.bin"

gOamdata_8261C30::
	.4byte 0x80004000, 0x00000400

gOamData_8261C38::
	.4byte 0xc0004000, 0x00000400

gSpriteAnim_8261C40::
	obj_image_anim_frame 0x00, 5
	obj_image_anim_end

gSpriteAnim_8261C48::
	obj_image_anim_frame 0x20, 5
	obj_image_anim_end

gSpriteAnimTable_8261C50::
	.4byte gSpriteAnim_8261C40
	.4byte gSpriteAnim_8261C48

gUnknown_8261C58:: @ 8261C58
	obj_tiles gUnknown_8E9E1DC, 0x0800, 300

gUnknown_8261C60:: @ 8261C60
	obj_pal gUnknown_8E9CF3C, 2345

gSpriteAnim_8261C68::
	obj_image_anim_frame 0x00, 5
	obj_image_anim_end

gSpriteAnim_8261C70::
	obj_image_anim_frame 0x08, 5
	obj_image_anim_end

gSpriteAnim_8261C78::
	obj_image_anim_frame 0x10, 5
	obj_image_anim_end

gSpriteAnim_8261C80::
	obj_image_anim_frame 0x18, 5
	obj_image_anim_end

gSpriteAnim_8261C88::
	obj_image_anim_frame 0x20, 5
	obj_image_anim_end

gSpriteAnim_8261C90::
	obj_image_anim_frame 0x28, 5
	obj_image_anim_end

gSpriteAnimTable_8261C98::
	.4byte gSpriteAnim_8261C68
	.4byte gSpriteAnim_8261C70
	.4byte gSpriteAnim_8261C78
	.4byte gSpriteAnim_8261C80
	.4byte gSpriteAnim_8261C88
	.4byte gSpriteAnim_8261C90

gUnknown_8261CB0:: @ 8261CB0
	spr_template 300, 2345, gOamData_8261C38, gSpriteAnimTable_8261C50, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_8261CC8:: @ 8261CC8
	spr_template 200, 4925, gOamdata_8261C30, gSpriteAnimTable_8261C98, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_8261CE0::
	.incbin "data/trade/unk_8261CE0.gbapal"

gUnknown_8261D00:: @ 8261D00
	obj_pal gUnknown_8261CE0, 4925

gUnknown_8261D08:: @ 8261D08
	.byte 0x04, 0x02, 0x0c, 0x0c, 0x00, 0x00
	.byte 0x02, 0x04, 0x0c, 0x0c, 0x00, 0x00
	.byte 0x07, 0x06, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x06, 0x07, 0x00, 0x00, 0x00

	.byte 0x05, 0x03, 0x0c, 0x0c, 0x00, 0x00
	.byte 0x03, 0x05, 0x0c, 0x0c, 0x00, 0x00
	.byte 0x00, 0x07, 0x06, 0x01, 0x00, 0x00
	.byte 0x06, 0x07, 0x00, 0x01, 0x00, 0x00

	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x08, 0x07, 0x06, 0x00, 0x00
	.byte 0x03, 0x01, 0x00, 0x00, 0x00, 0x00

	.byte 0x01, 0x01, 0x01, 0x01, 0x00, 0x00
	.byte 0x05, 0x01, 0x01, 0x01, 0x00, 0x00
	.byte 0x02, 0x09, 0x08, 0x07, 0x00, 0x00
	.byte 0x08, 0x09, 0x06, 0x06, 0x00, 0x00

	.byte 0x02, 0x02, 0x02, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0b, 0x0a, 0x09, 0x08, 0x07, 0x06
	.byte 0x05, 0x03, 0x01, 0x00, 0x00, 0x00

	.byte 0x03, 0x03, 0x03, 0x03, 0x00, 0x00
	.byte 0x01, 0x01, 0x01, 0x01, 0x00, 0x00
	.byte 0x04, 0x04, 0x04, 0x04, 0x00, 0x00
	.byte 0x0a, 0x08, 0x06, 0x00, 0x00, 0x00

	.byte 0x0a, 0x08, 0x0c, 0x00, 0x00, 0x00
	.byte 0x08, 0x0a, 0x0c, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x01, 0x00, 0x00, 0x00

	.byte 0x0c, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x0c, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.byte 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0a, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x02, 0x01, 0x00, 0x00, 0x00
	.byte 0x09, 0x07, 0x00, 0x00, 0x00, 0x00

	.byte 0x07, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0b, 0x0c, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x01, 0x00, 0x00, 0x00, 0x00

	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x04, 0x03, 0x02, 0x01, 0x00
	.byte 0x0b, 0x09, 0x07, 0x00, 0x00, 0x00

	.byte 0x09, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0c, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x02, 0x00, 0x00, 0x00, 0x00

	.byte 0x0b, 0x09, 0x07, 0x06, 0x00, 0x00
	.byte 0x07, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x0c, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0c, 0x00, 0x00, 0x00, 0x00, 0x00

gTradeMonSpriteCoords:: @ 8261E40
	.byte 0x01, 0x05
	.byte 0x08, 0x05
	.byte 0x01, 0x0a
	.byte 0x08, 0x0a
	.byte 0x01, 0x0f
	.byte 0x08, 0x0f
	.byte 0x10, 0x05
	.byte 0x17, 0x05
	.byte 0x10, 0x0a
	.byte 0x17, 0x0a
	.byte 0x10, 0x0f
	.byte 0x17, 0x0f
	.byte 0x17, 0x12

gUnknown_8261E5A:: @ 8261E5A
	.byte 0x05, 0x04
	.byte 0x0c, 0x04
	.byte 0x05, 0x09
	.byte 0x0c, 0x09
	.byte 0x05, 0x0e
	.byte 0x0c, 0x0e
	.byte 0x14, 0x04
	.byte 0x1b, 0x04
	.byte 0x14, 0x09
	.byte 0x1b, 0x09
	.byte 0x14, 0x0e
	.byte 0x1b, 0x0e

gUnknown_8261E72:: @ 8261E72
	.byte 0x01, 0x03
	.byte 0x08, 0x03
	.byte 0x01, 0x08
	.byte 0x08, 0x08
	.byte 0x01, 0x0d
	.byte 0x08, 0x0d

	.byte 0x10, 0x03
	.byte 0x17, 0x03
	.byte 0x10, 0x08
	.byte 0x17, 0x08
	.byte 0x10, 0x0d
	.byte 0x17, 0x0d

gTradeUnknownSpriteCoords:: @ 8261E8A
	.byte 0x3c, 0x09, 0xb4, 0x09
	.byte 0x30, 0x09, 0xa8, 0x09

gUnknown_8261E92::
	.byte 0x00, 0x0e, 0x0f, 0x1d
	.byte 0x03, 0x05, 0x03, 0x07
	.byte 0x12, 0x05, 0x12, 0x07
	.byte 0x08, 0x07, 0x16, 0x0c
	.byte 0x08, 0x07, 0x16, 0x0c
	.byte 0x06, 0x07, 0x18, 0x0c
	.byte 0x06, 0x07, 0x18, 0x0c
	.byte 0x08, 0x07, 0x16, 0x0c
	.byte 0x07, 0x07, 0x17, 0x0c

gUnknown_8261EB6:: @ 8261EB6
	.string "$"

gUnknown_8261EB7::
	.string "{COLOR DARK_GREY}{HIGHLIGHT TRANSPARENT}{SHADOW RED}$"

gText_MaleSymbol4:: @ 8261EC1
	.string "♂$"

gText_FemaleSymbol4:: @ 8261EC3
	.string "♀$"

gText_GenderlessSymbol:: @ 8261EC5
	.string "$"

gUnknown_8261EC6::
	.string "$"

gUnknown_8261EC7:: @ 8261EC7
	.string "\n$"

gUnknown_8261EC9::
	.string "/$"

	.align 2
gUnknown_8261ECC:: @ 8261ECC
	.4byte gUnknown_841E0B9
	.4byte gUnknown_841E0C0
	.4byte gUnknown_841E0D2
	.4byte gUnknown_841E0DA
	.4byte gUnknown_841E0E0
	.4byte gUnknown_841E0EE

gUnknown_8261EE4:: @ 8261EE4
	.4byte gUnknown_841E10A, sub_804F440
	.4byte gUnknown_841E112, sub_804F464

sTradeErrorOrStatusMessagePtrs:: @ 8261EF4
	.4byte gUnknown_841E118 @ Communication standby
	.4byte gUnknown_841E145 @ The trade has been canceled.
	.4byte gUnknown_841E16B @ That's your only POKéMON for battle
	.4byte gUnknown_8417094 @ That's your only POKéMON for battle
	.4byte gUnknown_841E199 @ Waiting for your friend to finish
	.4byte gUnknown_841E1C5 @ Your friend wants to trade POKéMON
	.4byte gUnknown_84170BC @ That POKéMON can't be traded now
	.4byte gUnknown_84170E0 @ An EGG can't be traded now
	.4byte gUnknown_84170FC @ The other TRAINER's POKéMON can't be traded now

gUnknown_8261F18:: @ 8261F18
	.byte 0, 1, 2

	.align 2
gUnknown_8261F1C:: @ 8261F1C
	.4byte 0x000001f8
	@ {
	@   .bg = 0,
	@   .charBaseIndex = 2,
	@   .mapBaseIndex = 31,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 0,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x00001051
	@ {
	@   .bg = 1,
	@   .charBaseIndex = 0,
	@   .mapBaseIndex = 5,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 1,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x00002062
	@ {
	@   .bg = 2,
	@   .charBaseIndex = 0,
	@   .mapBaseIndex = 6,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 2,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x00003073
	@ {
	@   .bg = 3,
	@   .charBaseIndex = 0,
	@   .mapBaseIndex = 7,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 3,
	@   .baseTile = 0x0000
	@ }

gUnknown_8261F2C:: @ 8261F2C
	.byte 0, 4, 7, 22, 4, 15
	.2byte 0x001e
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 4,
	@   .tilemapTop = 7,
	@   .width = 22,
	@   .height = 4,
	@   .paletteNum = 15,
	@   .baseBlock = 0x001e
	@ }
	.byte 0, 17, 15, 12, 4, 15
	.2byte 0x0076
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 17,
	@   .tilemapTop = 15,
	@   .width = 12,
	@   .height = 4,
	@   .paletteNum = 15,
	@   .baseBlock = 0x0076
	@ }
	.byte 0, 0, 5, 8, 2, 13
	.2byte 0x00a6
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 0,
	@   .tilemapTop = 5,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 13,
	@   .baseBlock = 0x00a6
	@ }
	.byte 0, 7, 5, 8, 2, 13
	.2byte 0x00b6
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 7,
	@   .tilemapTop = 5,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 13,
	@   .baseBlock = 0x00b6
	@ }
	.byte 0, 0, 10, 8, 2, 13
	.2byte 0x00c6
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 0,
	@   .tilemapTop = 10,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 13,
	@   .baseBlock = 0x00c6
	@ }
	.byte 0, 7, 10, 8, 2, 13
	.2byte 0x00d6
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 7,
	@   .tilemapTop = 10,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 13,
	@   .baseBlock = 0x00d6
	@ }
	.byte 0, 0, 15, 8, 2, 13
	.2byte 0x00e6
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 0,
	@   .tilemapTop = 15,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 13,
	@   .baseBlock = 0x00e6
	@ }
	.byte 0, 7, 15, 8, 2, 13
	.2byte 0x00f6
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 7,
	@   .tilemapTop = 15,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 13,
	@   .baseBlock = 0x00f6
	@ }
	.byte 0, 15, 5, 8, 2, 13
	.2byte 0x0106
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 15,
	@   .tilemapTop = 5,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 13,
	@   .baseBlock = 0x0106
	@ }
	.byte 0, 22, 5, 8, 2, 13
	.2byte 0x0116
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 22,
	@   .tilemapTop = 5,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 13,
	@   .baseBlock = 0x0116
	@ }
	.byte 0, 15, 10, 8, 2, 13
	.2byte 0x0126
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 15,
	@   .tilemapTop = 10,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 13,
	@   .baseBlock = 0x0126
	@ }
	.byte 0, 22, 10, 8, 2, 13
	.2byte 0x0136
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 22,
	@   .tilemapTop = 10,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 13,
	@   .baseBlock = 0x0136
	@ }
	.byte 0, 15, 15, 8, 2, 13
	.2byte 0x0146
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 15,
	@   .tilemapTop = 15,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 13,
	@   .baseBlock = 0x0146
	@ }
	.byte 0, 22, 15, 8, 2, 13
	.2byte 0x0156
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 22,
	@   .tilemapTop = 15,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 13,
	@   .baseBlock = 0x0156
	@ }
	.byte 0, 2, 5, 14, 2, 13
	.2byte 0x0166
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 2,
	@   .tilemapTop = 5,
	@   .width = 14,
	@   .height = 2,
	@   .paletteNum = 13,
	@   .baseBlock = 0x0166
	@ }
	.byte 0, 3, 8, 11, 8, 15
	.2byte 0x0182
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 3,
	@   .tilemapTop = 8,
	@   .width = 11,
	@   .height = 8,
	@   .paletteNum = 15,
	@   .baseBlock = 0x0182
	@ }
	.byte 0, 17, 5, 14, 2, 15
	.2byte 0x01da
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 17,
	@   .tilemapTop = 5,
	@   .width = 14,
	@   .height = 2,
	@   .paletteNum = 15,
	@   .baseBlock = 0x01da
	@ }
	.byte 0, 18, 8, 11, 8, 15
	.2byte 0x01f6
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 18,
	@   .tilemapTop = 8,
	@   .width = 11,
	@   .height = 8,
	@   .paletteNum = 15,
	@   .baseBlock = 0x01f6
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

gUnknown_8261FC4:: @ 8261FC4
	.byte 0, 21, 13, 6, 4, 15
	.2byte 0x024e
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 21,
	@   .tilemapTop = 13,
	@   .width = 6,
	@   .height = 4,
	@   .paletteNum = 15,
	@   .baseBlock = 0x024e
	@ }

	.string "かいめの そうしん$", 13
	.string "かいめの じゅしん$", 13
	.string "ポケモンアイコンセット$", 13
	.string "OBJテキストセット$", 13
	.string "セルセット$", 13
	.string "OBJテキストADD$", 13
	.string "システムメッセージADD$", 13
	.string "はいけいセット$", 13

gJPText_Shedinja:: @ 8262034
	.string "ヌケニン$"
	.string "こうかんせいりつ     $"
	.string "だめだたらしいよ     $"

gUnknown_8262055:: @ 8262055
	.byte 0x04, 0x03
	.byte 0x13, 0x03

	.align 2
gUnknown_826205C::
	.incbin "data/trade/unk_826207C.gbapal"

gUnknown_826207C::
	.incbin "data/trade/unk_826207C.4bpp"

	.incbin "baserom.gba", 0x26267C, 0x1A00

gUnknown_826407C:: @ 826407C
	.incbin "data/trade/unk_826407C.bin"

	.incbin "baserom.gba", 0x26487C, 0x120

gUnknown_826499C::
	.incbin "data/trade/unk_8264E1C.gbapal"

	.incbin "baserom.gba", 0x2649BC, 0x40

gUnknown_82649FC::
	.incbin "data/trade/unk_8264A1C.gbapal"

gUnknown_8264A1C::
	.incbin "data/trade/unk_8264A1C.4bpp"

gUnknown_8264C1C::
	.incbin "data/trade/unk_8264C1C.4bpp"

gUnknown_8264E1C::
	.incbin "data/trade/unk_8264E1C.4bpp"

	.incbin "baserom.gba", 0x264F1C, 0x100

gUnknown_826501C::
	.incbin "data/trade/unk_826501C.4bpp"

gUnknown_826601C:: @ 826601C
	.incbin "data/trade/unk_826601C.bin"

gUnknown_826701C:: @ 826701C
	.incbin "data/trade/unk_826701C.8bpp"

gUnknown_826985C:: @ 826985C
	.incbin "data/trade/unk_826985C.bin"

gUnknown_826995C:: @ 826995C
	.incbin "data/trade/unk_826995C.bin"

gUnknown_8269A5C:: @ 8269A5C
	.incbin "data/trade/unk_8269A5C.bin"

gUnknown_826AA5C:: @ 826AA5C
	.incbin "data/trade/unk_826AA5C.bin"

	.align 2
gUnknown_3379A0Bin:: @ 826BA5C
	.incbin "graphics/trade/unknown_3379A0.bin.lz"

gUnknown_826BB5C:: @ 826BB5C
	.incbin "data/trade/unk_826BB5C.gbapal"

gUnknown_826BD5C:: @ 826BD5C
	.incbin "data/trade/unk_826BD5C.gbapal"

gUnknown_826BF5C:: @ 826BF5C
	.incbin "data/trade/unk_826BF5C.gbapal"

gWirelessSignal4bpp:: @ 826BF7C
	.incbin "graphics/trade/wireless_signal.4bpp.lz"

gUnknown_826C60C:: @ 826C60C
	.incbin "data/trade/unk_826C60C.bin.lz"

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
	obj_tiles gUnknown_826207C, 0x0600, 5557

gUnknown_826CDDC:: @ 826CDDC
	obj_pal gUnknown_826205C, 5558

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
	obj_tiles gUnknown_8264A1C, 0x0200, 5550

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
	obj_tiles gUnknown_8264C1C, 0x0300, 5552

gUnknown_826CE84:: @ 826CE84
	spr_template 5552, 5551, gOamData_826CE5C, gSpriteAnimTable_826CE74, NULL, gDummySpriteAffineAnimTable, SpriteCB_TradeGlowCore

gOamData_826CE9C::
	.4byte 0x80008000, 0x00000400

gAnimCmd_826CEA4::
	obj_image_anim_frame 0, 10
	obj_image_anim_end

gSpriteAnimTable_826CEAC::
	.4byte gAnimCmd_826CEA4

gUnknown_826CEB0:: @ 826CEB0
	obj_tiles gUnknown_8264E1C, 0x0100, 5554

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
	obj_tiles gUnknown_826501C, 0x1000, 5556

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
