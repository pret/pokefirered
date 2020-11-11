#include "constants/region_map_sections.h"
#include "constants/flags.h"
#include "constants/moves.h"
#include "constants/species.h"
#define RGB(r, g, b) ((r) | ((g) << 5) | ((b) << 10))
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_8451EBC:: @ 8451EBC BgTemplate
	.4byte 0x00000050
	@ {
	@   .bg = 0,
	@   .charBaseIndex = 0,
	@   .mapBaseIndex = 5,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 0,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x00001049
	@ {
	@   .bg = 1,
	@   .charBaseIndex = 2,
	@   .mapBaseIndex = 4,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 1,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x0000206a
	@ {
	@   .bg = 2,
	@   .charBaseIndex = 2,
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

gUnknown_8451ECC:: @ 8451ECC WindowTemplate
	.byte 0, 0, 0, 30, 2, 15
	.2byte 0x03c4
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 0,
	@   .tilemapTop = 0,
	@   .width = 30,
	@   .height = 2,
	@   .paletteNum = 15,
	@   .baseBlock = 0x03c4
	@ }
	.byte 0, 0, 18, 30, 2, 15
	.2byte 0x0388
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 0,
	@   .tilemapTop = 18,
	@   .width = 30,
	@   .height = 2,
	@   .paletteNum = 15,
	@   .baseBlock = 0x0388
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

gUnknown_8451EE4:: @ 8451EE4 PokedexScreenData
	.byte 0x00, 0x00, 0x00, 0x00, 0x00
	.align 2
	.4byte 0x00000000
	.4byte 0x00000000
	.2byte 0x0001
	.2byte 0x0000
	.byte 0xff
	.byte 0xff
	.byte 0xff
	.byte 0x00
	.2byte 0xffff, 0xffff, 0xffff, 0xffff
	.byte 0xff, 0xff, 0xff, 0xff
	.byte 0xff, 0xff, 0xff, 0xff
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.4byte 0x00000000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.byte 0xff, 0x00, 0x00
	.align 2
	.4byte NULL
	.2byte 0x0000
	.byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
	.2byte 0x0000
	.4byte NULL
	.byte 0xff, 0xff
	.2byte 0x0000
	.byte 0x00
	.align 1
	.2byte 0x0000, 0x0000, 0x0000, 0x0000

	.align 2
gUnknown_8451F54:: @ 8451F54 WindowTemplate
	.byte 1, 1, 2, 20, 16, 0
	.2byte 0x0008
	@ {
	@   .bg = 1,
	@   .tilemapLeft = 1,
	@   .tilemapTop = 2,
	@   .width = 20,
	@   .height = 16,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0008
	@ }

gUnknown_8451F5C:: @ 8451F5C WindowTemplate
	.byte 1, 21, 11, 8, 6, 1
	.2byte 0x0148
	@ {
	@   .bg = 1,
	@   .tilemapLeft = 21,
	@   .tilemapTop = 11,
	@   .width = 8,
	@   .height = 6,
	@   .paletteNum = 1,
	@   .baseBlock = 0x0148
	@ }

gUnknown_8451F64:: @ 8451F64 WindowTemplate
	.byte 1, 21, 2, 9, 9, 0
	.2byte 0x0178
	@ {
	@   .bg = 1,
	@   .tilemapLeft = 21,
	@   .tilemapTop = 2,
	@   .width = 9,
	@   .height = 9,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0178
	@ }

gUnknown_8451F6C::
	.4byte gUnknown_8415EFB, -3
	.4byte gUnknown_8415E95, 9
	.4byte gUnknown_8415DE0, -3
	.4byte gText_DexCategory_GrasslandPkmn, 0
	.4byte gText_DexCategory_ForestPkmn, 1
	.4byte gText_DexCategory_WatersEdgePkmn, 2
	.4byte gText_DexCategory_SeaPkmn, 3
	.4byte gText_DexCategory_CavePkmn, 4
	.4byte gText_DexCategory_MountainPkmn, 5
	.4byte gText_DexCategory_RoughTerrainPkmn, 6
	.4byte gText_DexCategory_UrbanPkmn, 7
	.4byte gText_DexCategory_RarePkmn, 8
	.4byte gUnknown_8415E88, -3
	.4byte gUnknown_8415EA4, 10
	.4byte gUnknown_8415ED5, 11
	.4byte gUnknown_8415EDF, 12
	.4byte gUnknown_8415EED, 13
	.4byte gUnknown_8415EB0, -3
	.4byte gUnknown_8415EC7, -2

gUnknown_8452004:: @ 8452004 ListMenuTemplate
	.4byte gUnknown_8451F6C
	.4byte sub_8102EC0
	.4byte sub_8102F48
	.2byte 19, 9
	.byte 0, 0, 12, 4
	.byte 0x12, 0x30, 0x01, 0x02

gUnknown_845201C::
	.4byte gUnknown_8415EFB, -3
	.4byte gUnknown_8415F0E, 9
	.4byte gUnknown_8415F24, 14
	.4byte gUnknown_8415DE0, -3
	.4byte gText_DexCategory_GrasslandPkmn, 0
	.4byte gText_DexCategory_ForestPkmn, 1
	.4byte gText_DexCategory_WatersEdgePkmn, 2
	.4byte gText_DexCategory_SeaPkmn, 3
	.4byte gText_DexCategory_CavePkmn, 4
	.4byte gText_DexCategory_MountainPkmn, 5
	.4byte gText_DexCategory_RoughTerrainPkmn, 6
	.4byte gText_DexCategory_UrbanPkmn, 7
	.4byte gText_DexCategory_RarePkmn, 8
	.4byte gUnknown_8415E88, -3
	.4byte gUnknown_8415EA4, 10
	.4byte gUnknown_8415ED5, 11
	.4byte gUnknown_8415EDF, 12
	.4byte gUnknown_8415EED, 13
	.4byte gUnknown_8415EB0, -3
	.4byte gUnknown_8415EC7, -2

gUnknown_84520BC:: @ 84520BC ListMenuTemplate
	.4byte gUnknown_845201C
	.4byte sub_8102EC0
	.4byte sub_8102F48
	.2byte 20, 9
	.byte 0, 0, 12, 4
	.byte 0x12, 0x30, 0x01, 0x02

gUnknown_84520D4:: @ 84520D4 ScrollArrowsTemplate
	.byte 2, 200, 19, 3, 200, 141
	.2byte 0, 10, 2000, 65535
	.byte 1
	.align 2

gUnknown_84520E4:: @ 84520E4 ScrollArrowsTemplate
	.byte 2, 200, 19, 3, 200, 141
	.2byte 0, 11, 2000, 65535
	.byte 1
	.align 2

gUnknown_84520F4:: @ 84520F4 struct { dataptr; dataptr; }
	.4byte gUnknown_84414BC, gUnknown_84434A0
	.4byte gUnknown_844112C, gUnknown_8443480
	.4byte gUnknown_8442838, gUnknown_8443580
	.4byte gUnknown_8442004, gUnknown_8443520
	.4byte gUnknown_84408E0, gUnknown_8443420
	.4byte gUnknown_8441A40, gUnknown_84434E0
	.4byte gUnknown_84424E4, gUnknown_8443560
	.4byte gUnknown_8440BD8, gUnknown_8443440
	.4byte gUnknown_8441D54, gUnknown_8443500
	.4byte gUnknown_844223C, gUnknown_8443540
	.4byte gUnknown_8E9C16C, gUnknown_8E9C14C
	.4byte gUnknown_8442BC0, gUnknown_84435A0
	.4byte gUnknown_8442EF8, gUnknown_84435C0
	.4byte gUnknown_844318C, gUnknown_84435E0
	.4byte gUnknown_844223C, gUnknown_8443540

gUnknown_845216C:: @ 845216C WindowTemplate
	.byte 1, 2, 2, 23, 16, 0
	.2byte 0x0008
	@ {
	@   .bg = 1,
	@   .tilemapLeft = 2,
	@   .tilemapTop = 2,
	@   .width = 23,
	@   .height = 16,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0008
	@ }

gUnknown_8452174:: @ 8452174 ListMenuTemplate
	.4byte gUnknown_8451F6C
	.4byte ListMenuDefaultCursorMoveFunc
	.4byte sub_8103A40
	.2byte 0, 9
	.byte 0, 0, 56, 4
	.byte 0x12, 0x30, 0x41, 0x02

gUnknown_845218C:: @ 845218C ListMenuWindowRect
	.byte 0x00, 0x00, 0x05, 0x10, 0x00, 0x00, 0x00, 0x00

gUnknown_8452194:: @ unknown
	.byte 0x05, 0x00, 0x02, 0x10, 0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x08, 0x10, 0x00, 0x00, 0x00, 0x00, 0x0f, 0x00, 0x08, 0x10, 0x02, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00

gUnknown_84521B4:: @ 84521B4 ScrollArrowsTemplate
	.byte 2, 200, 19, 3, 200, 141
	.2byte 0, 0, 2000, 65535
	.byte 1
	.align 2

gUnknown_84521C4:: @ 84521C4 WindowTemplate
	.byte 2, 0, 0, 8, 8, 0
	.2byte 0x0000
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 0,
	@   .tilemapTop = 0,
	@   .width = 8,
	@   .height = 8,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0000
	@ }

gUnknown_84521CC:: @ 84521CC WindowTemplate
	.byte 1, 0, 0, 8, 5, 0
	.2byte 0x0000
	@ {
	@   .bg = 1,
	@   .tilemapLeft = 0,
	@   .tilemapTop = 0,
	@   .width = 8,
	@   .height = 5,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0000
	@ }

gUnknown_84521D4:: @ 84521D4 WindowTemplate
	.byte 1, 19, 3, 8, 8, 9
	.2byte 0x01a8
	@ {
	@   .bg = 1,
	@   .tilemapLeft = 19,
	@   .tilemapTop = 3,
	@   .width = 8,
	@   .height = 8,
	@   .paletteNum = 9,
	@   .baseBlock = 0x01a8
	@ }

gUnknown_84521DC:: @ 84521DC WindowTemplate
	.byte 1, 2, 3, 13, 8, 0
	.2byte 0x01e8
	@ {
	@   .bg = 1,
	@   .tilemapLeft = 2,
	@   .tilemapTop = 3,
	@   .width = 13,
	@   .height = 8,
	@   .paletteNum = 0,
	@   .baseBlock = 0x01e8
	@ }

gUnknown_84521E4:: @ 84521E4 WindowTemplate
	.byte 1, 0, 11, 30, 7, 0
	.2byte 0x0250
	@ {
	@   .bg = 1,
	@   .tilemapLeft = 0,
	@   .tilemapTop = 11,
	@   .width = 30,
	@   .height = 7,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0250
	@ }

gUnknown_84521EC:: @ 84521EC WindowTemplate
	.byte 2, 1, 2, 4, 4, 10
	.2byte 0x01a8
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 1,
	@   .tilemapTop = 2,
	@   .width = 4,
	@   .height = 4,
	@   .paletteNum = 10,
	@   .baseBlock = 0x01a8
	@ }

gUnknown_84521F4:: @ 84521F4 WindowTemplate
	.byte 2, 5, 2, 8, 3, 0
	.2byte 0x01b8
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 5,
	@   .tilemapTop = 2,
	@   .width = 8,
	@   .height = 3,
	@   .paletteNum = 0,
	@   .baseBlock = 0x01b8
	@ }

gUnknown_84521FC:: @ 84521FC WindowTemplate
	.byte 2, 2, 7, 10, 2, 0
	.2byte 0x01d0
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 2,
	@   .tilemapTop = 7,
	@   .width = 10,
	@   .height = 2,
	@   .paletteNum = 0,
	@   .baseBlock = 0x01d0
	@ }

gUnknown_8452204:: @ 8452204 WindowTemplate
	.byte 2, 18, 2, 10, 2, 0
	.2byte 0x01e4
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 18,
	@   .tilemapTop = 2,
	@   .width = 10,
	@   .height = 2,
	@   .paletteNum = 0,
	@   .baseBlock = 0x01e4
	@ }

gUnknown_845220C:: @ 845220C WindowTemplate
	.byte 2, 5, 5, 8, 2, 11
	.2byte 0x01f8
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 5,
	@   .tilemapTop = 5,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 11,
	@   .baseBlock = 0x01f8
	@ }

gUnknown_8452214:: @ 8452214 WindowTemplate
	.byte 2, 17, 4, 12, 9, 0
	.2byte 0x0208
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 17,
	@   .tilemapTop = 4,
	@   .width = 12,
	@   .height = 9,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0208
	@ }

gUnknown_845221C::
	.byte 2, 13, 4, 4, 3, 0
	.2byte 0x0274
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 13,
	@   .tilemapTop = 4,
	@   .width = 4,
	@   .height = 3,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0274
	@ }

gUnknown_8452224::
	.byte 2, 13, 7, 4, 3, 0
	.2byte 0x0280
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 13,
	@   .tilemapTop = 7,
	@   .width = 4,
	@   .height = 3,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0280
	@ }

gUnknown_845222C::
	.byte 2, 13, 10, 4, 3, 0
	.2byte 0x028c
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 13,
	@   .tilemapTop = 10,
	@   .width = 4,
	@   .height = 3,
	@   .paletteNum = 0,
	@   .baseBlock = 0x028c
	@ }

gUnknown_8452234::
	.byte 2, 13, 13, 4, 4, 0
	.2byte 0x0298
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 13,
	@   .tilemapTop = 13,
	@   .width = 4,
	@   .height = 4,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0298
	@ }

gUnknown_845223C::
	.byte 2, 17, 13, 4, 4, 0
	.2byte 0x02a8
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 17,
	@   .tilemapTop = 13,
	@   .width = 4,
	@   .height = 4,
	@   .paletteNum = 0,
	@   .baseBlock = 0x02a8
	@ }

gUnknown_8452244::
	.byte 2, 21, 13, 4, 4, 0
	.2byte 0x02b8
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 21,
	@   .tilemapTop = 13,
	@   .width = 4,
	@   .height = 4,
	@   .paletteNum = 0,
	@   .baseBlock = 0x02b8
	@ }

gUnknown_845224C::
	.byte 2, 25, 13, 4, 4, 0
	.2byte 0x02c8
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 25,
	@   .tilemapTop = 13,
	@   .width = 4,
	@   .height = 4,
	@   .paletteNum = 0,
	@   .baseBlock = 0x02c8
	@ }

gUnknown_8452254:: @ 8452254 struct { dataptr; dataptr; }
	@ window template, tilemap.lz
	.4byte gUnknown_845221C, gUnknown_8443910
	.4byte gUnknown_8452224, gUnknown_8443988
	.4byte gUnknown_845222C, gUnknown_84439FC
	.4byte gUnknown_8452234, gUnknown_8443A78
	.4byte gUnknown_845223C, gUnknown_8443AF8
	.4byte gUnknown_8452244, gUnknown_8443BB0
	.4byte gUnknown_845224C, gUnknown_8443C54

gUnknown_845228C:: @ 845228C bin
	.incbin "graphics/pokedex/unk_845228C.bin"

gUnknown_845230C::
	.byte 0x0b, 0x03, 0x0b, 0x0b

gUnknown_8452310::
	.byte 0x03, 0x03, 0x0b, 0x03
	.byte 0x12, 0x09, 0x0a, 0x0b

gUnknown_8452318::
	.byte 0x01, 0x02, 0x09, 0x02
	.byte 0x0b, 0x09, 0x03, 0x0b
	.byte 0x15, 0x03, 0x15, 0x0b

gUnknown_8452324::
	.byte 0x00, 0x02, 0x06, 0x03
	.byte 0x07, 0x0a, 0x00, 0x0c
	.byte 0x0f, 0x0a, 0x16, 0x0b
	.byte 0x16, 0x02, 0x0f, 0x04

gUnknown_8452334:: @ 8452334 dataptr
	.4byte gUnknown_845230C
	.4byte gUnknown_8452310
	.4byte gUnknown_8452318
	.4byte gUnknown_8452324

gDexCategoryNamePtrs:: @ 8452344 dataptr
	.4byte gText_DexCategory_GrasslandPkmn
	.4byte gText_DexCategory_ForestPkmn
	.4byte gText_DexCategory_WatersEdgePkmn
	.4byte gText_DexCategory_SeaPkmn
	.4byte gText_DexCategory_CavePkmn
	.4byte gText_DexCategory_MountainPkmn
	.4byte gText_DexCategory_RoughTerrainPkmn
	.4byte gText_DexCategory_UrbanPkmn
	.4byte gText_DexCategory_RarePkmn

gUnknown_8452368:: @ 8452368 gbapal
	.incbin "graphics/pokedex/unk_8452368.gbapal"

gUnknown_8452388:: @ 8452388 data8
	.byte 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e
	.byte 0x05, 0x0b, 0x11, 0x17, 0x1d, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e
	.byte 0x02, 0x05, 0x08, 0x0b, 0x0e, 0x11, 0x14, 0x17, 0x1a, 0x1d, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e
	.byte 0x02, 0x03, 0x05, 0x07, 0x09, 0x0b, 0x0d, 0x0f, 0x11, 0x13, 0x15, 0x17, 0x19, 0x1b, 0x1d, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e
	.byte 0x02, 0x04, 0x05, 0x07, 0x08, 0x0a, 0x0b, 0x0d, 0x0e, 0x10, 0x11, 0x13, 0x14, 0x16, 0x17, 0x19, 0x1a, 0x1c, 0x1d, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e
	.byte 0x01, 0x02, 0x03, 0x04, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0f, 0x10, 0x11, 0x13, 0x14, 0x15, 0x17, 0x18, 0x19, 0x1b, 0x1c, 0x1d, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e
	.byte 0x01, 0x02, 0x03, 0x04, 0x05, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x14, 0x15, 0x16, 0x17, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1e, 0x1e, 0x1e
	.byte 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1e, 0x1e
	.byte 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d

gUnknown_84524B4:: @ 84524B4 ScrollArrowsTemplate
	.byte 0, 16, 80, 1, 224, 80
	.2byte 0, 0, 2000, 65535
	.byte 1
	.align 2

gUnknown_84524C4:: @ 84524C4 CursorStruct
	.byte 0, 160
	.2byte 64, 40, 2002, 65535
	.byte 4, 0

gDexCategory_GrasslandPkmn_Page1:: @ 84524D0
	.2byte SPECIES_RATTATA
	.2byte SPECIES_RATICATE
	.2byte SPECIES_SENTRET
	.2byte SPECIES_FURRET

gDexCategory_GrasslandPkmn_Page2:: @ 84524D8
	.2byte SPECIES_ZIGZAGOON
	.2byte SPECIES_LINOONE
	.2byte SPECIES_POOCHYENA
	.2byte SPECIES_MIGHTYENA

gDexCategory_GrasslandPkmn_Page3:: @ 84524E0
	.2byte SPECIES_NIDORAN_F
	.2byte SPECIES_NIDORINA
	.2byte SPECIES_NIDOQUEEN

gDexCategory_GrasslandPkmn_Page4:: @ 84524E6
	.2byte SPECIES_NIDORAN_M
	.2byte SPECIES_NIDORINO
	.2byte SPECIES_NIDOKING

gDexCategory_GrasslandPkmn_Page5:: @ 84524EC
	.2byte SPECIES_DODUO
	.2byte SPECIES_DODRIO
	.2byte SPECIES_TAILLOW
	.2byte SPECIES_SWELLOW

gDexCategory_GrasslandPkmn_Page6:: @ 84524F4
	.2byte SPECIES_TANGELA
	.2byte SPECIES_ROSELIA
	.2byte SPECIES_SUNKERN
	.2byte SPECIES_SUNFLORA

gDexCategory_GrasslandPkmn_Page7:: @ 84524FC
	.2byte SPECIES_HOPPIP
	.2byte SPECIES_SKIPLOOM
	.2byte SPECIES_JUMPLUFF

gDexCategory_GrasslandPkmn_Page8:: @ 8452502
	.2byte SPECIES_ODDISH
	.2byte SPECIES_GLOOM
	.2byte SPECIES_VILEPLUME
	.2byte SPECIES_BELLOSSOM

gDexCategory_GrasslandPkmn_Page9:: @ 845250A
	.2byte SPECIES_EKANS
	.2byte SPECIES_ARBOK

gDexCategory_GrasslandPkmn_Page10:: @ 845250E
	.2byte SPECIES_IGGLYBUFF
	.2byte SPECIES_JIGGLYPUFF
	.2byte SPECIES_WIGGLYTUFF

gDexCategory_GrasslandPkmn_Page11:: @ 8452514
	.2byte SPECIES_MAREEP
	.2byte SPECIES_FLAAFFY
	.2byte SPECIES_AMPHAROS

gDexCategory_GrasslandPkmn_Page12:: @ 845251A
	.2byte SPECIES_FARFETCHD
	.2byte SPECIES_LICKITUNG

gDexCategory_GrasslandPkmn_Page13:: @ 845251E
	.2byte SPECIES_SCYTHER
	.2byte SPECIES_SCIZOR

gDexCategory_GrasslandPkmn_Page14:: @ 8452522
	.2byte SPECIES_DROWZEE
	.2byte SPECIES_HYPNO
	.2byte SPECIES_GULPIN
	.2byte SPECIES_SWALOT

gDexCategory_GrasslandPkmn_Page15:: @ 845252A
	.2byte SPECIES_KANGASKHAN
	.2byte SPECIES_GIRAFARIG

gDexCategory_GrasslandPkmn_Page16:: @ 845252E
	.2byte SPECIES_TAUROS
	.2byte SPECIES_MILTANK

gDexCategory_GrasslandPkmn_Page17:: @ 8452532
	.2byte SPECIES_VULPIX
	.2byte SPECIES_NINETALES
	.2byte SPECIES_PONYTA
	.2byte SPECIES_RAPIDASH

gDexCategory_GrasslandPkmn_Page18:: @ 845253A
	.2byte SPECIES_ELEKID
	.2byte SPECIES_ELECTABUZZ
	.2byte SPECIES_ELECTRIKE
	.2byte SPECIES_MANECTRIC

gDexCategory_GrasslandPkmn_Page19:: @ 8452542
	.2byte SPECIES_ZANGOOSE
	.2byte SPECIES_SEVIPER

gDexCategory_GrasslandPkmn_Page20:: @ 8452546
	.2byte SPECIES_PLUSLE
	.2byte SPECIES_MINUN

gDexCategory_GrasslandPkmn_Page21:: @ 845254A
	.2byte SPECIES_GROWLITHE
	.2byte SPECIES_ARCANINE

gDexCategory_GrasslandPkmn_Page22:: @ 845254E
	.2byte SPECIES_CASTFORM
	.2byte SPECIES_CHIMECHO

gDexCategory_GrasslandPkmn_Page23:: @ 8452552
	.2byte SPECIES_BULBASAUR
	.2byte SPECIES_IVYSAUR
	.2byte SPECIES_VENUSAUR

gDexCategory_GrasslandPkmn_Page24:: @ 8452558
	.2byte SPECIES_CHIKORITA
	.2byte SPECIES_BAYLEEF
	.2byte SPECIES_MEGANIUM

gDexCategory_GrasslandPkmn_Page25:: @ 845255E
	.2byte SPECIES_CYNDAQUIL
	.2byte SPECIES_QUILAVA
	.2byte SPECIES_TYPHLOSION

gDexCategory_GrasslandPkmn_Page26:: @ 8452564
	.2byte SPECIES_TORCHIC
	.2byte SPECIES_COMBUSKEN
	.2byte SPECIES_BLAZIKEN

gDexCategory_GrasslandPkmn_Page27:: @ 845256A
	.2byte SPECIES_RAIKOU
	.2byte SPECIES_ENTEI
	.2byte SPECIES_SUICUNE

gDexCategory_ForestPkmn_Page1:: @ 8452570
	.2byte SPECIES_CATERPIE
	.2byte SPECIES_METAPOD
	.2byte SPECIES_BUTTERFREE

gDexCategory_ForestPkmn_Page2:: @ 8452576
	.2byte SPECIES_WEEDLE
	.2byte SPECIES_KAKUNA
	.2byte SPECIES_BEEDRILL

gDexCategory_ForestPkmn_Page3:: @ 845257C
	.2byte SPECIES_WURMPLE
	.2byte SPECIES_SILCOON
	.2byte SPECIES_BEAUTIFLY

gDexCategory_ForestPkmn_Page4:: @ 8452582
	.2byte SPECIES_CASCOON
	.2byte SPECIES_DUSTOX

gDexCategory_ForestPkmn_Page5:: @ 8452586
	.2byte SPECIES_PIDGEY
	.2byte SPECIES_PIDGEOTTO
	.2byte SPECIES_PIDGEOT

gDexCategory_ForestPkmn_Page6:: @ 845258C
	.2byte SPECIES_HOOTHOOT
	.2byte SPECIES_NOCTOWL
	.2byte SPECIES_NATU
	.2byte SPECIES_XATU

gDexCategory_ForestPkmn_Page7:: @ 8452594
	.2byte SPECIES_PICHU
	.2byte SPECIES_PIKACHU
	.2byte SPECIES_RAICHU

gDexCategory_ForestPkmn_Page8:: @ 845259A
	.2byte SPECIES_BELLSPROUT
	.2byte SPECIES_WEEPINBELL
	.2byte SPECIES_VICTREEBEL

gDexCategory_ForestPkmn_Page9:: @ 84525A0
	.2byte SPECIES_PARAS
	.2byte SPECIES_PARASECT
	.2byte SPECIES_SHROOMISH
	.2byte SPECIES_BRELOOM

gDexCategory_ForestPkmn_Page10:: @ 84525A8
	.2byte SPECIES_SEEDOT
	.2byte SPECIES_NUZLEAF
	.2byte SPECIES_SHIFTRY

gDexCategory_ForestPkmn_Page11:: @ 84525AE
	.2byte SPECIES_VENONAT
	.2byte SPECIES_VENOMOTH
	.2byte SPECIES_YANMA

gDexCategory_ForestPkmn_Page12:: @ 84525B4
	.2byte SPECIES_LEDYBA
	.2byte SPECIES_LEDIAN
	.2byte SPECIES_SPINARAK
	.2byte SPECIES_ARIADOS

gDexCategory_ForestPkmn_Page13:: @ 84525BC
	.2byte SPECIES_NINCADA
	.2byte SPECIES_NINJASK
	.2byte SPECIES_SHEDINJA

gDexCategory_ForestPkmn_Page14:: @ 84525C2
	.2byte SPECIES_VOLBEAT
	.2byte SPECIES_ILLUMISE

gDexCategory_ForestPkmn_Page15:: @ 84525C6
	.2byte SPECIES_PINECO
	.2byte SPECIES_FORRETRESS

gDexCategory_ForestPkmn_Page16:: @ 84525CA
	.2byte SPECIES_SLAKOTH
	.2byte SPECIES_VIGOROTH
	.2byte SPECIES_SLAKING

gDexCategory_ForestPkmn_Page17:: @ 84525D0
	.2byte SPECIES_SKITTY
	.2byte SPECIES_DELCATTY

gDexCategory_ForestPkmn_Page18:: @ 84525D4
	.2byte SPECIES_MURKROW
	.2byte SPECIES_SNEASEL

gDexCategory_ForestPkmn_Page19:: @ 84525D8
	.2byte SPECIES_EXEGGCUTE
	.2byte SPECIES_EXEGGUTOR
	.2byte SPECIES_SUDOWOODO

gDexCategory_ForestPkmn_Page20:: @ 84525DE
	.2byte SPECIES_AIPOM
	.2byte SPECIES_STANTLER
	.2byte SPECIES_KECLEON

gDexCategory_ForestPkmn_Page21:: @ 84525E4
	.2byte SPECIES_PINSIR
	.2byte SPECIES_HERACROSS

gDexCategory_ForestPkmn_Page22:: @ 84525E8
	.2byte SPECIES_SWABLU
	.2byte SPECIES_ALTARIA
	.2byte SPECIES_TROPIUS

gDexCategory_ForestPkmn_Page23:: @ 84525EE
	.2byte SPECIES_DUSKULL
	.2byte SPECIES_DUSCLOPS

gDexCategory_ForestPkmn_Page24:: @ 84525F2
	.2byte SPECIES_TOGEPI
	.2byte SPECIES_TOGETIC

gDexCategory_ForestPkmn_Page25:: @ 84525F6
	.2byte SPECIES_TREECKO
	.2byte SPECIES_GROVYLE
	.2byte SPECIES_SCEPTILE

gDexCategory_ForestPkmn_Page26:: @ 84525FC
	.2byte SPECIES_CELEBI

gDexCategory_WatersEdgePkmn_Page1:: @ 84525FE
	.2byte SPECIES_GOLDEEN
	.2byte SPECIES_SEAKING

gDexCategory_WatersEdgePkmn_Page2:: @ 8452602
	.2byte SPECIES_MAGIKARP
	.2byte SPECIES_GYARADOS
	.2byte SPECIES_KRABBY
	.2byte SPECIES_KINGLER

gDexCategory_WatersEdgePkmn_Page3:: @ 845260A
	.2byte SPECIES_CORPHISH
	.2byte SPECIES_CRAWDAUNT
	.2byte SPECIES_BARBOACH
	.2byte SPECIES_WHISCASH

gDexCategory_WatersEdgePkmn_Page4:: @ 8452612
	.2byte SPECIES_LOTAD
	.2byte SPECIES_LOMBRE
	.2byte SPECIES_LUDICOLO

gDexCategory_WatersEdgePkmn_Page5:: @ 8452618
	.2byte SPECIES_SURSKIT
	.2byte SPECIES_MASQUERAIN

gDexCategory_WatersEdgePkmn_Page6:: @ 845261C
	.2byte SPECIES_PSYDUCK
	.2byte SPECIES_GOLDUCK
	.2byte SPECIES_WOOPER
	.2byte SPECIES_QUAGSIRE

gDexCategory_WatersEdgePkmn_Page7:: @ 8452624
	.2byte SPECIES_POLIWAG
	.2byte SPECIES_POLIWHIRL
	.2byte SPECIES_POLIWRATH
	.2byte SPECIES_POLITOED

gDexCategory_WatersEdgePkmn_Page8:: @ 845262C
	.2byte SPECIES_AZURILL
	.2byte SPECIES_MARILL
	.2byte SPECIES_AZUMARILL

gDexCategory_WatersEdgePkmn_Page9:: @ 8452632
	.2byte SPECIES_SLOWPOKE
	.2byte SPECIES_SLOWBRO
	.2byte SPECIES_SLOWKING

gDexCategory_WatersEdgePkmn_Page10:: @ 8452638
	.2byte SPECIES_FEEBAS
	.2byte SPECIES_MILOTIC

gDexCategory_WatersEdgePkmn_Page11:: @ 845263C
	.2byte SPECIES_ANORITH
	.2byte SPECIES_ARMALDO

gDexCategory_WatersEdgePkmn_Page12:: @ 8452640
	.2byte SPECIES_DRATINI
	.2byte SPECIES_DRAGONAIR
	.2byte SPECIES_DRAGONITE

gDexCategory_WatersEdgePkmn_Page13:: @ 8452646
	.2byte SPECIES_SQUIRTLE
	.2byte SPECIES_WARTORTLE
	.2byte SPECIES_BLASTOISE

gDexCategory_WatersEdgePkmn_Page14:: @ 845264C
	.2byte SPECIES_TOTODILE
	.2byte SPECIES_CROCONAW
	.2byte SPECIES_FERALIGATR

gDexCategory_WatersEdgePkmn_Page15:: @ 8452652
	.2byte SPECIES_MUDKIP
	.2byte SPECIES_MARSHTOMP
	.2byte SPECIES_SWAMPERT

gDexCategory_WatersEdgePkmn_Page16:: @ 8452658
	.2byte SPECIES_LATIAS
	.2byte SPECIES_LATIOS

gDexCategory_SeaPkmn_Page1:: @ 845265C
	.2byte SPECIES_TENTACOOL
	.2byte SPECIES_TENTACRUEL

gDexCategory_SeaPkmn_Page2:: @ 8452660
	.2byte SPECIES_WINGULL
	.2byte SPECIES_PELIPPER

gDexCategory_SeaPkmn_Page3:: @ 8452664
	.2byte SPECIES_STARYU
	.2byte SPECIES_STARMIE

gDexCategory_SeaPkmn_Page4:: @ 8452668
	.2byte SPECIES_CHINCHOU
	.2byte SPECIES_LANTURN
	.2byte SPECIES_REMORAID
	.2byte SPECIES_OCTILLERY

gDexCategory_SeaPkmn_Page5:: @ 8452670
	.2byte SPECIES_SHELLDER
	.2byte SPECIES_CLOYSTER

gDexCategory_SeaPkmn_Page6:: @ 8452674
	.2byte SPECIES_CLAMPERL
	.2byte SPECIES_HUNTAIL
	.2byte SPECIES_GOREBYSS

gDexCategory_SeaPkmn_Page7:: @ 845267A
	.2byte SPECIES_QWILFISH
	.2byte SPECIES_CORSOLA
	.2byte SPECIES_MANTINE
	.2byte SPECIES_LUVDISC

gDexCategory_SeaPkmn_Page8:: @ 8452682
	.2byte SPECIES_SEEL
	.2byte SPECIES_DEWGONG

gDexCategory_SeaPkmn_Page9:: @ 8452686
	.2byte SPECIES_SPHEAL
	.2byte SPECIES_SEALEO
	.2byte SPECIES_WALREIN

gDexCategory_SeaPkmn_Page10:: @ 845268C
	.2byte SPECIES_CARVANHA
	.2byte SPECIES_SHARPEDO
	.2byte SPECIES_WAILMER
	.2byte SPECIES_WAILORD

gDexCategory_SeaPkmn_Page11:: @ 8452694
	.2byte SPECIES_HORSEA
	.2byte SPECIES_SEADRA
	.2byte SPECIES_KINGDRA

gDexCategory_SeaPkmn_Page12:: @ 845269A
	.2byte SPECIES_RELICANTH

gDexCategory_SeaPkmn_Page13:: @ 845269C
	.2byte SPECIES_LAPRAS

gDexCategory_SeaPkmn_Page14:: @ 845269E
	.2byte SPECIES_OMANYTE
	.2byte SPECIES_OMASTAR
	.2byte SPECIES_KABUTO
	.2byte SPECIES_KABUTOPS

gDexCategory_SeaPkmn_Page15:: @ 84526A6
	.2byte SPECIES_LILEEP
	.2byte SPECIES_CRADILY

gDexCategory_SeaPkmn_Page16:: @ 84526AA
	.2byte SPECIES_KYOGRE

gDexCategory_CavePkmn_Page1:: @ 84526AC
	.2byte SPECIES_ZUBAT
	.2byte SPECIES_GOLBAT
	.2byte SPECIES_CROBAT

gDexCategory_CavePkmn_Page2:: @ 84526B2
	.2byte SPECIES_DIGLETT
	.2byte SPECIES_DUGTRIO
	.2byte SPECIES_ONIX
	.2byte SPECIES_STEELIX

gDexCategory_CavePkmn_Page3:: @ 84526BA
	.2byte SPECIES_SWINUB
	.2byte SPECIES_PILOSWINE
	.2byte SPECIES_SNORUNT
	.2byte SPECIES_GLALIE

gDexCategory_CavePkmn_Page4:: @ 84526C2
	.2byte SPECIES_WHISMUR
	.2byte SPECIES_LOUDRED
	.2byte SPECIES_EXPLOUD

gDexCategory_CavePkmn_Page5:: @ 84526C8
	.2byte SPECIES_MISDREAVUS
	.2byte SPECIES_DUNSPARCE
	.2byte SPECIES_NOSEPASS

gDexCategory_CavePkmn_Page6:: @ 84526CE
	.2byte SPECIES_SABLEYE
	.2byte SPECIES_MAWILE

gDexCategory_CavePkmn_Page7:: @ 84526D2
	.2byte SPECIES_GASTLY
	.2byte SPECIES_HAUNTER
	.2byte SPECIES_GENGAR

gDexCategory_CavePkmn_Page8:: @ 84526D8
	.2byte SPECIES_WYNAUT
	.2byte SPECIES_WOBBUFFET

gDexCategory_CavePkmn_Page9:: @ 84526DC
	.2byte SPECIES_LUNATONE
	.2byte SPECIES_SOLROCK

gDexCategory_CavePkmn_Page10:: @ 84526E0
	.2byte SPECIES_REGIROCK
	.2byte SPECIES_REGICE
	.2byte SPECIES_REGISTEEL

gDexCategory_MountainPkmn_Page1:: @ 84526E6
	.2byte SPECIES_GEODUDE
	.2byte SPECIES_GRAVELER
	.2byte SPECIES_GOLEM

gDexCategory_MountainPkmn_Page2:: @ 84526EC
	.2byte SPECIES_MANKEY
	.2byte SPECIES_PRIMEAPE
	.2byte SPECIES_SPOINK
	.2byte SPECIES_GRUMPIG

gDexCategory_MountainPkmn_Page3:: @ 84526F4
	.2byte SPECIES_MACHOP
	.2byte SPECIES_MACHOKE
	.2byte SPECIES_MACHAMP

gDexCategory_MountainPkmn_Page4:: @ 84526FA
	.2byte SPECIES_CLEFFA
	.2byte SPECIES_CLEFAIRY
	.2byte SPECIES_CLEFABLE

gDexCategory_MountainPkmn_Page5:: @ 8452700
	.2byte SPECIES_CUBONE
	.2byte SPECIES_MAROWAK

gDexCategory_MountainPkmn_Page6:: @ 8452704
	.2byte SPECIES_SLUGMA
	.2byte SPECIES_MAGCARGO
	.2byte SPECIES_NUMEL
	.2byte SPECIES_CAMERUPT

gDexCategory_MountainPkmn_Page7:: @ 845270C
	.2byte SPECIES_MAKUHITA
	.2byte SPECIES_HARIYAMA
	.2byte SPECIES_MEDITITE
	.2byte SPECIES_MEDICHAM

gDexCategory_MountainPkmn_Page8:: @ 8452714
	.2byte SPECIES_SHUCKLE
	.2byte SPECIES_TEDDIURSA
	.2byte SPECIES_URSARING
	.2byte SPECIES_DELIBIRD

gDexCategory_MountainPkmn_Page9:: @ 845271C
	.2byte SPECIES_GLIGAR
	.2byte SPECIES_SPINDA

gDexCategory_MountainPkmn_Page10:: @ 8452720
	.2byte SPECIES_MAGBY
	.2byte SPECIES_MAGMAR
	.2byte SPECIES_TORKOAL

gDexCategory_MountainPkmn_Page11:: @ 8452726
	.2byte SPECIES_ARON
	.2byte SPECIES_LAIRON
	.2byte SPECIES_AGGRON

gDexCategory_MountainPkmn_Page12:: @ 845272C
	.2byte SPECIES_LARVITAR
	.2byte SPECIES_PUPITAR
	.2byte SPECIES_TYRANITAR

gDexCategory_MountainPkmn_Page13:: @ 8452732
	.2byte SPECIES_SNORLAX

gDexCategory_MountainPkmn_Page14:: @ 8452734
	.2byte SPECIES_ABSOL

gDexCategory_MountainPkmn_Page15:: @ 8452736
	.2byte SPECIES_AERODACTYL

gDexCategory_MountainPkmn_Page16:: @ 8452738
	.2byte SPECIES_CHARMANDER
	.2byte SPECIES_CHARMELEON
	.2byte SPECIES_CHARIZARD

gDexCategory_MountainPkmn_Page17:: @ 845273E
	.2byte SPECIES_JIRACHI

gDexCategory_RoughTerrainPkmn_Page1:: @ 8452740
	.2byte SPECIES_SPEAROW
	.2byte SPECIES_FEAROW

gDexCategory_RoughTerrainPkmn_Page2:: @ 8452744
	.2byte SPECIES_SANDSHREW
	.2byte SPECIES_SANDSLASH
	.2byte SPECIES_RHYHORN
	.2byte SPECIES_RHYDON

gDexCategory_RoughTerrainPkmn_Page3:: @ 845274C
	.2byte SPECIES_MAGNEMITE
	.2byte SPECIES_MAGNETON

gDexCategory_RoughTerrainPkmn_Page4:: @ 8452750
	.2byte SPECIES_HOUNDOUR
	.2byte SPECIES_HOUNDOOM
	.2byte SPECIES_PHANPY
	.2byte SPECIES_DONPHAN

gDexCategory_RoughTerrainPkmn_Page5:: @ 8452758
	.2byte SPECIES_CACNEA
	.2byte SPECIES_CACTURNE

gDexCategory_RoughTerrainPkmn_Page6:: @ 845275C
	.2byte SPECIES_TRAPINCH
	.2byte SPECIES_VIBRAVA
	.2byte SPECIES_FLYGON

gDexCategory_RoughTerrainPkmn_Page7:: @ 8452762
	.2byte SPECIES_SKARMORY

gDexCategory_RoughTerrainPkmn_Page8:: @ 8452764
	.2byte SPECIES_BALTOY
	.2byte SPECIES_CLAYDOL

gDexCategory_RoughTerrainPkmn_Page9:: @ 8452768
	.2byte SPECIES_BAGON
	.2byte SPECIES_SHELGON
	.2byte SPECIES_SALAMENCE

gDexCategory_RoughTerrainPkmn_Page10:: @ 845276E
	.2byte SPECIES_BELDUM
	.2byte SPECIES_METANG
	.2byte SPECIES_METAGROSS

gDexCategory_RoughTerrainPkmn_Page11:: @ 8452774
	.2byte SPECIES_GROUDON

gDexCategory_UrbanPkmn_Page1:: @ 8452776
	.2byte SPECIES_MEOWTH
	.2byte SPECIES_PERSIAN
	.2byte SPECIES_SNUBBULL
	.2byte SPECIES_GRANBULL

gDexCategory_UrbanPkmn_Page2:: @ 845277E
	.2byte SPECIES_GRIMER
	.2byte SPECIES_MUK
	.2byte SPECIES_KOFFING
	.2byte SPECIES_WEEZING

gDexCategory_UrbanPkmn_Page3:: @ 8452786
	.2byte SPECIES_SHUPPET
	.2byte SPECIES_BANETTE

gDexCategory_UrbanPkmn_Page4:: @ 845278A
	.2byte SPECIES_ABRA
	.2byte SPECIES_KADABRA
	.2byte SPECIES_ALAKAZAM

gDexCategory_UrbanPkmn_Page5:: @ 8452790
	.2byte SPECIES_RALTS
	.2byte SPECIES_KIRLIA
	.2byte SPECIES_GARDEVOIR

gDexCategory_UrbanPkmn_Page6:: @ 8452796
	.2byte SPECIES_SMOOCHUM
	.2byte SPECIES_JYNX
	.2byte SPECIES_MR_MIME
	.2byte SPECIES_SMEARGLE

gDexCategory_UrbanPkmn_Page7:: @ 845279E
	.2byte SPECIES_TYROGUE
	.2byte SPECIES_HITMONLEE
	.2byte SPECIES_HITMONCHAN
	.2byte SPECIES_HITMONTOP

gDexCategory_UrbanPkmn_Page8:: @ 84527A6
	.2byte SPECIES_CHANSEY
	.2byte SPECIES_BLISSEY

gDexCategory_UrbanPkmn_Page9:: @ 84527AA
	.2byte SPECIES_VOLTORB
	.2byte SPECIES_ELECTRODE
	.2byte SPECIES_PORYGON
	.2byte SPECIES_PORYGON2

gDexCategory_UrbanPkmn_Page10:: @ 84527B2
	.2byte SPECIES_DITTO

gDexCategory_UrbanPkmn_Page11:: @ 84527B4
	.2byte SPECIES_EEVEE
	.2byte SPECIES_VAPOREON
	.2byte SPECIES_JOLTEON
	.2byte SPECIES_FLAREON

gDexCategory_UrbanPkmn_Page12:: @ 84527BC
	.2byte SPECIES_ESPEON
	.2byte SPECIES_UMBREON

gDexCategory_RarePkmn_Page1:: @ 84527C0
	.2byte SPECIES_UNOWN

gDexCategory_RarePkmn_Page2:: @ 84527C2
	.2byte SPECIES_ARTICUNO
	.2byte SPECIES_ZAPDOS
	.2byte SPECIES_MOLTRES

gDexCategory_RarePkmn_Page3:: @ 84527C8
	.2byte SPECIES_LUGIA

gDexCategory_RarePkmn_Page4:: @ 84527CA
	.2byte SPECIES_HO_OH

gDexCategory_RarePkmn_Page5:: @ 84527CC
	.2byte SPECIES_RAYQUAZA

gDexCategory_RarePkmn_Page6:: @ 84527CE
	.2byte SPECIES_DEOXYS

gDexCategory_RarePkmn_Page7:: @ 84527D0
	.2byte SPECIES_MEWTWO

gDexCategory_RarePkmn_Page8:: @ 84527D2
	.2byte SPECIES_MEW

gDexCategory_GrasslandPkmn::
	.4byte gDexCategory_GrasslandPkmn_Page1, 4
	.4byte gDexCategory_GrasslandPkmn_Page2, 4
	.4byte gDexCategory_GrasslandPkmn_Page3, 3
	.4byte gDexCategory_GrasslandPkmn_Page4, 3
	.4byte gDexCategory_GrasslandPkmn_Page5, 4
	.4byte gDexCategory_GrasslandPkmn_Page6, 4
	.4byte gDexCategory_GrasslandPkmn_Page7, 3
	.4byte gDexCategory_GrasslandPkmn_Page8, 4
	.4byte gDexCategory_GrasslandPkmn_Page9, 2
	.4byte gDexCategory_GrasslandPkmn_Page10, 3
	.4byte gDexCategory_GrasslandPkmn_Page11, 3
	.4byte gDexCategory_GrasslandPkmn_Page12, 2
	.4byte gDexCategory_GrasslandPkmn_Page13, 2
	.4byte gDexCategory_GrasslandPkmn_Page14, 4
	.4byte gDexCategory_GrasslandPkmn_Page15, 2
	.4byte gDexCategory_GrasslandPkmn_Page16, 2
	.4byte gDexCategory_GrasslandPkmn_Page17, 4
	.4byte gDexCategory_GrasslandPkmn_Page18, 4
	.4byte gDexCategory_GrasslandPkmn_Page19, 2
	.4byte gDexCategory_GrasslandPkmn_Page20, 2
	.4byte gDexCategory_GrasslandPkmn_Page21, 2
	.4byte gDexCategory_GrasslandPkmn_Page22, 2
	.4byte gDexCategory_GrasslandPkmn_Page23, 3
	.4byte gDexCategory_GrasslandPkmn_Page24, 3
	.4byte gDexCategory_GrasslandPkmn_Page25, 3
	.4byte gDexCategory_GrasslandPkmn_Page26, 3
	.4byte gDexCategory_GrasslandPkmn_Page27, 3

gDexCategory_ForestPkmn::
	.4byte gDexCategory_ForestPkmn_Page1, 3
	.4byte gDexCategory_ForestPkmn_Page2, 3
	.4byte gDexCategory_ForestPkmn_Page3, 3
	.4byte gDexCategory_ForestPkmn_Page4, 2
	.4byte gDexCategory_ForestPkmn_Page5, 3
	.4byte gDexCategory_ForestPkmn_Page6, 4
	.4byte gDexCategory_ForestPkmn_Page7, 3
	.4byte gDexCategory_ForestPkmn_Page8, 3
	.4byte gDexCategory_ForestPkmn_Page9, 4
	.4byte gDexCategory_ForestPkmn_Page10, 3
	.4byte gDexCategory_ForestPkmn_Page11, 3
	.4byte gDexCategory_ForestPkmn_Page12, 4
	.4byte gDexCategory_ForestPkmn_Page13, 3
	.4byte gDexCategory_ForestPkmn_Page14, 2
	.4byte gDexCategory_ForestPkmn_Page15, 2
	.4byte gDexCategory_ForestPkmn_Page16, 3
	.4byte gDexCategory_ForestPkmn_Page17, 2
	.4byte gDexCategory_ForestPkmn_Page18, 2
	.4byte gDexCategory_ForestPkmn_Page19, 3
	.4byte gDexCategory_ForestPkmn_Page20, 3
	.4byte gDexCategory_ForestPkmn_Page21, 2
	.4byte gDexCategory_ForestPkmn_Page22, 3
	.4byte gDexCategory_ForestPkmn_Page23, 2
	.4byte gDexCategory_ForestPkmn_Page24, 2
	.4byte gDexCategory_ForestPkmn_Page25, 3
	.4byte gDexCategory_ForestPkmn_Page26, 1

gDexCategory_WatersEdgePkmn::
	.4byte gDexCategory_WatersEdgePkmn_Page1, 2
	.4byte gDexCategory_WatersEdgePkmn_Page2, 4
	.4byte gDexCategory_WatersEdgePkmn_Page3, 4
	.4byte gDexCategory_WatersEdgePkmn_Page4, 3
	.4byte gDexCategory_WatersEdgePkmn_Page5, 2
	.4byte gDexCategory_WatersEdgePkmn_Page6, 4
	.4byte gDexCategory_WatersEdgePkmn_Page7, 4
	.4byte gDexCategory_WatersEdgePkmn_Page8, 3
	.4byte gDexCategory_WatersEdgePkmn_Page9, 3
	.4byte gDexCategory_WatersEdgePkmn_Page10, 2
	.4byte gDexCategory_WatersEdgePkmn_Page11, 2
	.4byte gDexCategory_WatersEdgePkmn_Page12, 3
	.4byte gDexCategory_WatersEdgePkmn_Page13, 3
	.4byte gDexCategory_WatersEdgePkmn_Page14, 3
	.4byte gDexCategory_WatersEdgePkmn_Page15, 3
	.4byte gDexCategory_WatersEdgePkmn_Page16, 2

gDexCategory_SeaPkmn::
	.4byte gDexCategory_SeaPkmn_Page1, 2
	.4byte gDexCategory_SeaPkmn_Page2, 2
	.4byte gDexCategory_SeaPkmn_Page3, 2
	.4byte gDexCategory_SeaPkmn_Page4, 4
	.4byte gDexCategory_SeaPkmn_Page5, 2
	.4byte gDexCategory_SeaPkmn_Page6, 3
	.4byte gDexCategory_SeaPkmn_Page7, 4
	.4byte gDexCategory_SeaPkmn_Page8, 2
	.4byte gDexCategory_SeaPkmn_Page9, 3
	.4byte gDexCategory_SeaPkmn_Page10, 4
	.4byte gDexCategory_SeaPkmn_Page11, 3
	.4byte gDexCategory_SeaPkmn_Page12, 1
	.4byte gDexCategory_SeaPkmn_Page13, 1
	.4byte gDexCategory_SeaPkmn_Page14, 4
	.4byte gDexCategory_SeaPkmn_Page15, 2
	.4byte gDexCategory_SeaPkmn_Page16, 1

gDexCategory_CavePkmn::
	.4byte gDexCategory_CavePkmn_Page1, 3
	.4byte gDexCategory_CavePkmn_Page2, 4
	.4byte gDexCategory_CavePkmn_Page3, 4
	.4byte gDexCategory_CavePkmn_Page4, 3
	.4byte gDexCategory_CavePkmn_Page5, 3
	.4byte gDexCategory_CavePkmn_Page6, 2
	.4byte gDexCategory_CavePkmn_Page7, 3
	.4byte gDexCategory_CavePkmn_Page8, 2
	.4byte gDexCategory_CavePkmn_Page9, 2
	.4byte gDexCategory_CavePkmn_Page10, 3

gDexCategory_MountainPkmn::
	.4byte gDexCategory_MountainPkmn_Page1, 3
	.4byte gDexCategory_MountainPkmn_Page2, 4
	.4byte gDexCategory_MountainPkmn_Page3, 3
	.4byte gDexCategory_MountainPkmn_Page4, 3
	.4byte gDexCategory_MountainPkmn_Page5, 2
	.4byte gDexCategory_MountainPkmn_Page6, 4
	.4byte gDexCategory_MountainPkmn_Page7, 4
	.4byte gDexCategory_MountainPkmn_Page8, 4
	.4byte gDexCategory_MountainPkmn_Page9, 2
	.4byte gDexCategory_MountainPkmn_Page10, 3
	.4byte gDexCategory_MountainPkmn_Page11, 3
	.4byte gDexCategory_MountainPkmn_Page12, 3
	.4byte gDexCategory_MountainPkmn_Page13, 1
	.4byte gDexCategory_MountainPkmn_Page14, 1
	.4byte gDexCategory_MountainPkmn_Page15, 1
	.4byte gDexCategory_MountainPkmn_Page16, 3
	.4byte gDexCategory_MountainPkmn_Page17, 1

gDexCategory_RoughTerrainPkmn::
	.4byte gDexCategory_RoughTerrainPkmn_Page1, 2
	.4byte gDexCategory_RoughTerrainPkmn_Page2, 4
	.4byte gDexCategory_RoughTerrainPkmn_Page3, 2
	.4byte gDexCategory_RoughTerrainPkmn_Page4, 4
	.4byte gDexCategory_RoughTerrainPkmn_Page5, 2
	.4byte gDexCategory_RoughTerrainPkmn_Page6, 3
	.4byte gDexCategory_RoughTerrainPkmn_Page7, 1
	.4byte gDexCategory_RoughTerrainPkmn_Page8, 2
	.4byte gDexCategory_RoughTerrainPkmn_Page9, 3
	.4byte gDexCategory_RoughTerrainPkmn_Page10, 3
	.4byte gDexCategory_RoughTerrainPkmn_Page11, 1

gDexCategory_UrbanPkmn::
	.4byte gDexCategory_UrbanPkmn_Page1, 4
	.4byte gDexCategory_UrbanPkmn_Page2, 4
	.4byte gDexCategory_UrbanPkmn_Page3, 2
	.4byte gDexCategory_UrbanPkmn_Page4, 3
	.4byte gDexCategory_UrbanPkmn_Page5, 3
	.4byte gDexCategory_UrbanPkmn_Page6, 4
	.4byte gDexCategory_UrbanPkmn_Page7, 4
	.4byte gDexCategory_UrbanPkmn_Page8, 2
	.4byte gDexCategory_UrbanPkmn_Page9, 4
	.4byte gDexCategory_UrbanPkmn_Page10, 1
	.4byte gDexCategory_UrbanPkmn_Page11, 4
	.4byte gDexCategory_UrbanPkmn_Page12, 2

gDexCategory_RarePkmn::
	.4byte gDexCategory_RarePkmn_Page1, 1
	.4byte gDexCategory_RarePkmn_Page2, 3
	.4byte gDexCategory_RarePkmn_Page3, 1
	.4byte gDexCategory_RarePkmn_Page4, 1
	.4byte gDexCategory_RarePkmn_Page5, 1
	.4byte gDexCategory_RarePkmn_Page6, 1
	.4byte gDexCategory_RarePkmn_Page7, 1
	.4byte gDexCategory_RarePkmn_Page8, 1

gDexCategories:: @ 8452C4C struct { dataptr; data8; }
	.4byte gDexCategory_GrasslandPkmn, 27
	.4byte gDexCategory_ForestPkmn, 26
	.4byte gDexCategory_WatersEdgePkmn, 16
	.4byte gDexCategory_SeaPkmn, 16
	.4byte gDexCategory_CavePkmn, 10
	.4byte gDexCategory_MountainPkmn, 17
	.4byte gDexCategory_RoughTerrainPkmn, 11
	.4byte gDexCategory_UrbanPkmn, 12
	.4byte gDexCategory_RarePkmn, 8
