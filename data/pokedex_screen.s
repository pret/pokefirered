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

gUnknown_84524D0:: @ 84524D0
	.2byte SPECIES_RATTATA
	.2byte SPECIES_RATICATE
	.2byte SPECIES_SENTRET
	.2byte SPECIES_FURRET

gUnknown_84524D8:: @ 84524D8
	.2byte SPECIES_ZIGZAGOON
	.2byte SPECIES_LINOONE
	.2byte SPECIES_POOCHYENA
	.2byte SPECIES_MIGHTYENA

gUnknown_84524E0:: @ 84524E0
	.2byte SPECIES_NIDORAN_F
	.2byte SPECIES_NIDORINA
	.2byte SPECIES_NIDOQUEEN

gUnknown_84524E6:: @ 84524E6
	.2byte SPECIES_NIDORAN_M
	.2byte SPECIES_NIDORINO
	.2byte SPECIES_NIDOKING

gUnknown_84524EC:: @ 84524EC
	.2byte SPECIES_DODUO
	.2byte SPECIES_DODRIO
	.2byte SPECIES_TAILLOW
	.2byte SPECIES_SWELLOW

gUnknown_84524F4:: @ 84524F4
	.2byte SPECIES_TANGELA
	.2byte SPECIES_ROSELIA
	.2byte SPECIES_SUNKERN
	.2byte SPECIES_SUNFLORA

gUnknown_84524FC:: @ 84524FC
	.2byte SPECIES_HOPPIP
	.2byte SPECIES_SKIPLOOM
	.2byte SPECIES_JUMPLUFF

gUnknown_8452502:: @ 8452502
	.2byte SPECIES_ODDISH
	.2byte SPECIES_GLOOM
	.2byte SPECIES_VILEPLUME
	.2byte SPECIES_BELLOSSOM

gUnknown_845250A:: @ 845250A
	.2byte SPECIES_EKANS
	.2byte SPECIES_ARBOK

gUnknown_845250E:: @ 845250E
	.2byte SPECIES_IGGLYBUFF
	.2byte SPECIES_JIGGLYPUFF
	.2byte SPECIES_WIGGLYTUFF

gUnknown_8452514:: @ 8452514
	.2byte SPECIES_MAREEP
	.2byte SPECIES_FLAAFFY
	.2byte SPECIES_AMPHAROS

gUnknown_845251A:: @ 845251A
	.2byte SPECIES_FARFETCHD
	.2byte SPECIES_LICKITUNG

gUnknown_845251E:: @ 845251E
	.2byte SPECIES_SCYTHER
	.2byte SPECIES_SCIZOR

gUnknown_8452522:: @ 8452522
	.2byte SPECIES_DROWZEE
	.2byte SPECIES_HYPNO
	.2byte SPECIES_GULPIN
	.2byte SPECIES_SWALOT

gUnknown_845252A:: @ 845252A
	.2byte SPECIES_KANGASKHAN
	.2byte SPECIES_GIRAFARIG

gUnknown_845252E:: @ 845252E
	.2byte SPECIES_TAUROS
	.2byte SPECIES_MILTANK

gUnknown_8452532:: @ 8452532
	.2byte SPECIES_VULPIX
	.2byte SPECIES_NINETALES
	.2byte SPECIES_PONYTA
	.2byte SPECIES_RAPIDASH

gUnknown_845253A:: @ 845253A
	.2byte SPECIES_ELEKID
	.2byte SPECIES_ELECTABUZZ
	.2byte SPECIES_ELECTRIKE
	.2byte SPECIES_MANECTRIC

gUnknown_8452542:: @ 8452542
	.2byte SPECIES_ZANGOOSE
	.2byte SPECIES_SEVIPER

gUnknown_8452546:: @ 8452546
	.2byte SPECIES_PLUSLE
	.2byte SPECIES_MINUN

gUnknown_845254A:: @ 845254A
	.2byte SPECIES_GROWLITHE
	.2byte SPECIES_ARCANINE

gUnknown_845254E:: @ 845254E
	.2byte SPECIES_CASTFORM
	.2byte SPECIES_CHIMECHO

gUnknown_8452552:: @ 8452552
	.2byte SPECIES_BULBASAUR
	.2byte SPECIES_IVYSAUR
	.2byte SPECIES_VENUSAUR

gUnknown_8452558:: @ 8452558
	.2byte SPECIES_CHIKORITA
	.2byte SPECIES_BAYLEEF
	.2byte SPECIES_MEGANIUM

gUnknown_845255E:: @ 845255E
	.2byte SPECIES_CYNDAQUIL
	.2byte SPECIES_QUILAVA
	.2byte SPECIES_TYPHLOSION

gUnknown_8452564:: @ 8452564
	.2byte SPECIES_TORCHIC
	.2byte SPECIES_COMBUSKEN
	.2byte SPECIES_BLAZIKEN

gUnknown_845256A:: @ 845256A
	.2byte SPECIES_RAIKOU
	.2byte SPECIES_ENTEI
	.2byte SPECIES_SUICUNE

gUnknown_8452570:: @ 8452570
	.2byte SPECIES_CATERPIE
	.2byte SPECIES_METAPOD
	.2byte SPECIES_BUTTERFREE

gUnknown_8452576:: @ 8452576
	.2byte SPECIES_WEEDLE
	.2byte SPECIES_KAKUNA
	.2byte SPECIES_BEEDRILL

gUnknown_845257C:: @ 845257C
	.2byte SPECIES_WURMPLE
	.2byte SPECIES_SILCOON
	.2byte SPECIES_BEAUTIFLY

gUnknown_8452582:: @ 8452582
	.2byte SPECIES_CASCOON
	.2byte SPECIES_DUSTOX

gUnknown_8452586:: @ 8452586
	.2byte SPECIES_PIDGEY
	.2byte SPECIES_PIDGEOTTO
	.2byte SPECIES_PIDGEOT

gUnknown_845258C:: @ 845258C
	.2byte SPECIES_HOOTHOOT
	.2byte SPECIES_NOCTOWL
	.2byte SPECIES_NATU
	.2byte SPECIES_XATU

gUnknown_8452594:: @ 8452594
	.2byte SPECIES_PICHU
	.2byte SPECIES_PIKACHU
	.2byte SPECIES_RAICHU

gUnknown_845259A:: @ 845259A
	.2byte SPECIES_BELLSPROUT
	.2byte SPECIES_WEEPINBELL
	.2byte SPECIES_VICTREEBEL

gUnknown_84525A0:: @ 84525A0
	.2byte SPECIES_PARAS
	.2byte SPECIES_PARASECT
	.2byte SPECIES_SHROOMISH
	.2byte SPECIES_BRELOOM

gUnknown_84525A8:: @ 84525A8
	.2byte SPECIES_SEEDOT
	.2byte SPECIES_NUZLEAF
	.2byte SPECIES_SHIFTRY

gUnknown_84525AE:: @ 84525AE
	.2byte SPECIES_VENONAT
	.2byte SPECIES_VENOMOTH
	.2byte SPECIES_YANMA

gUnknown_84525B4:: @ 84525B4
	.2byte SPECIES_LEDYBA
	.2byte SPECIES_LEDIAN
	.2byte SPECIES_SPINARAK
	.2byte SPECIES_ARIADOS

gUnknown_84525BC:: @ 84525BC
	.2byte SPECIES_NINCADA
	.2byte SPECIES_NINJASK
	.2byte SPECIES_SHEDINJA

gUnknown_84525C2:: @ 84525C2
	.2byte SPECIES_VOLBEAT
	.2byte SPECIES_ILLUMISE

gUnknown_84525C6:: @ 84525C6
	.2byte SPECIES_PINECO
	.2byte SPECIES_FORRETRESS

gUnknown_84525CA:: @ 84525CA
	.2byte SPECIES_SLAKOTH
	.2byte SPECIES_VIGOROTH
	.2byte SPECIES_SLAKING

gUnknown_84525D0:: @ 84525D0
	.2byte SPECIES_SKITTY
	.2byte SPECIES_DELCATTY

gUnknown_84525D4:: @ 84525D4
	.2byte SPECIES_MURKROW
	.2byte SPECIES_SNEASEL

gUnknown_84525D8:: @ 84525D8
	.2byte SPECIES_EXEGGCUTE
	.2byte SPECIES_EXEGGUTOR
	.2byte SPECIES_SUDOWOODO

gUnknown_84525DE:: @ 84525DE
	.2byte SPECIES_AIPOM
	.2byte SPECIES_STANTLER
	.2byte SPECIES_KECLEON

gUnknown_84525E4:: @ 84525E4
	.2byte SPECIES_PINSIR
	.2byte SPECIES_HERACROSS

gUnknown_84525E8:: @ 84525E8
	.2byte SPECIES_SWABLU
	.2byte SPECIES_ALTARIA
	.2byte SPECIES_TROPIUS

gUnknown_84525EE:: @ 84525EE
	.2byte SPECIES_DUSKULL
	.2byte SPECIES_DUSCLOPS

gUnknown_84525F2:: @ 84525F2
	.2byte SPECIES_TOGEPI
	.2byte SPECIES_TOGETIC

gUnknown_84525F6:: @ 84525F6
	.2byte SPECIES_TREECKO
	.2byte SPECIES_GROVYLE
	.2byte SPECIES_SCEPTILE

gUnknown_84525FC:: @ 84525FC
	.2byte SPECIES_CELEBI

gUnknown_84525FE:: @ 84525FE
	.2byte SPECIES_GOLDEEN
	.2byte SPECIES_SEAKING

gUnknown_8452602:: @ 8452602
	.2byte SPECIES_MAGIKARP
	.2byte SPECIES_GYARADOS
	.2byte SPECIES_KRABBY
	.2byte SPECIES_KINGLER

gUnknown_845260A:: @ 845260A
	.2byte SPECIES_CORPHISH
	.2byte SPECIES_CRAWDAUNT
	.2byte SPECIES_BARBOACH
	.2byte SPECIES_WHISCASH

gUnknown_8452612:: @ 8452612
	.2byte SPECIES_LOTAD
	.2byte SPECIES_LOMBRE
	.2byte SPECIES_LUDICOLO

gUnknown_8452618:: @ 8452618
	.2byte SPECIES_SURSKIT
	.2byte SPECIES_MASQUERAIN

gUnknown_845261C:: @ 845261C
	.2byte SPECIES_PSYDUCK
	.2byte SPECIES_GOLDUCK
	.2byte SPECIES_WOOPER
	.2byte SPECIES_QUAGSIRE

gUnknown_8452624:: @ 8452624
	.2byte SPECIES_POLIWAG
	.2byte SPECIES_POLIWHIRL
	.2byte SPECIES_POLIWRATH
	.2byte SPECIES_POLITOED

gUnknown_845262C:: @ 845262C
	.2byte SPECIES_AZURILL
	.2byte SPECIES_MARILL
	.2byte SPECIES_AZUMARILL

gUnknown_8452632:: @ 8452632
	.2byte SPECIES_SLOWPOKE
	.2byte SPECIES_SLOWBRO
	.2byte SPECIES_SLOWKING

gUnknown_8452638:: @ 8452638
	.2byte SPECIES_FEEBAS
	.2byte SPECIES_MILOTIC

gUnknown_845263C:: @ 845263C
	.2byte SPECIES_ANORITH
	.2byte SPECIES_ARMALDO

gUnknown_8452640:: @ 8452640
	.2byte SPECIES_DRATINI
	.2byte SPECIES_DRAGONAIR
	.2byte SPECIES_DRAGONITE

gUnknown_8452646:: @ 8452646
	.2byte SPECIES_SQUIRTLE
	.2byte SPECIES_WARTORTLE
	.2byte SPECIES_BLASTOISE

gUnknown_845264C:: @ 845264C
	.2byte SPECIES_TOTODILE
	.2byte SPECIES_CROCONAW
	.2byte SPECIES_FERALIGATR

gUnknown_8452652:: @ 8452652
	.2byte SPECIES_MUDKIP
	.2byte SPECIES_MARSHTOMP
	.2byte SPECIES_SWAMPERT

gUnknown_8452658:: @ 8452658
	.2byte SPECIES_LATIAS
	.2byte SPECIES_LATIOS

gUnknown_845265C:: @ 845265C
	.2byte SPECIES_TENTACOOL
	.2byte SPECIES_TENTACRUEL

gUnknown_8452660:: @ 8452660
	.2byte SPECIES_WINGULL
	.2byte SPECIES_PELIPPER

gUnknown_8452664:: @ 8452664
	.2byte SPECIES_STARYU
	.2byte SPECIES_STARMIE

gUnknown_8452668:: @ 8452668
	.2byte SPECIES_CHINCHOU
	.2byte SPECIES_LANTURN
	.2byte SPECIES_REMORAID
	.2byte SPECIES_OCTILLERY

gUnknown_8452670:: @ 8452670
	.2byte SPECIES_SHELLDER
	.2byte SPECIES_CLOYSTER

gUnknown_8452674:: @ 8452674
	.2byte SPECIES_CLAMPERL
	.2byte SPECIES_HUNTAIL
	.2byte SPECIES_GOREBYSS

gUnknown_845267A:: @ 845267A
	.2byte SPECIES_QWILFISH
	.2byte SPECIES_CORSOLA
	.2byte SPECIES_MANTINE
	.2byte SPECIES_LUVDISC

gUnknown_8452682:: @ 8452682
	.2byte SPECIES_SEEL
	.2byte SPECIES_DEWGONG

gUnknown_8452686:: @ 8452686
	.2byte SPECIES_SPHEAL
	.2byte SPECIES_SEALEO
	.2byte SPECIES_WALREIN

gUnknown_845268C:: @ 845268C
	.2byte SPECIES_CARVANHA
	.2byte SPECIES_SHARPEDO
	.2byte SPECIES_WAILMER
	.2byte SPECIES_WAILORD

gUnknown_8452694:: @ 8452694
	.2byte SPECIES_HORSEA
	.2byte SPECIES_SEADRA
	.2byte SPECIES_KINGDRA

gUnknown_845269A:: @ 845269A
	.2byte SPECIES_RELICANTH

gUnknown_845269C:: @ 845269C
	.2byte SPECIES_LAPRAS

gUnknown_845269E:: @ 845269E
	.2byte SPECIES_OMANYTE
	.2byte SPECIES_OMASTAR
	.2byte SPECIES_KABUTO
	.2byte SPECIES_KABUTOPS

gUnknown_84526A6:: @ 84526A6
	.2byte SPECIES_LILEEP
	.2byte SPECIES_CRADILY

gUnknown_84526AA:: @ 84526AA
	.2byte SPECIES_KYOGRE

gUnknown_84526AC:: @ 84526AC
	.2byte SPECIES_ZUBAT
	.2byte SPECIES_GOLBAT
	.2byte SPECIES_CROBAT

gUnknown_84526B2:: @ 84526B2
	.2byte SPECIES_DIGLETT
	.2byte SPECIES_DUGTRIO
	.2byte SPECIES_ONIX
	.2byte SPECIES_STEELIX

gUnknown_84526BA:: @ 84526BA
	.2byte SPECIES_SWINUB
	.2byte SPECIES_PILOSWINE
	.2byte SPECIES_SNORUNT
	.2byte SPECIES_GLALIE

gUnknown_84526C2:: @ 84526C2
	.2byte SPECIES_WHISMUR
	.2byte SPECIES_LOUDRED
	.2byte SPECIES_EXPLOUD

gUnknown_84526C8:: @ 84526C8
	.2byte SPECIES_MISDREAVUS
	.2byte SPECIES_DUNSPARCE
	.2byte SPECIES_NOSEPASS

gUnknown_84526CE:: @ 84526CE
	.2byte SPECIES_SABLEYE
	.2byte SPECIES_MAWILE

gUnknown_84526D2:: @ 84526D2
	.2byte SPECIES_GASTLY
	.2byte SPECIES_HAUNTER
	.2byte SPECIES_GENGAR

gUnknown_84526D8:: @ 84526D8
	.2byte SPECIES_WYNAUT
	.2byte SPECIES_WOBBUFFET

gUnknown_84526DC:: @ 84526DC
	.2byte SPECIES_LUNATONE
	.2byte SPECIES_SOLROCK

gUnknown_84526E0:: @ 84526E0
	.2byte SPECIES_REGIROCK
	.2byte SPECIES_REGICE
	.2byte SPECIES_REGISTEEL

gUnknown_84526E6:: @ 84526E6
	.2byte SPECIES_GEODUDE
	.2byte SPECIES_GRAVELER
	.2byte SPECIES_GOLEM

gUnknown_84526EC:: @ 84526EC
	.2byte SPECIES_MANKEY
	.2byte SPECIES_PRIMEAPE
	.2byte SPECIES_SPOINK
	.2byte SPECIES_GRUMPIG

gUnknown_84526F4:: @ 84526F4
	.2byte SPECIES_MACHOP
	.2byte SPECIES_MACHOKE
	.2byte SPECIES_MACHAMP

gUnknown_84526FA:: @ 84526FA
	.2byte SPECIES_CLEFFA
	.2byte SPECIES_CLEFAIRY
	.2byte SPECIES_CLEFABLE

gUnknown_8452700:: @ 8452700
	.2byte SPECIES_CUBONE
	.2byte SPECIES_MAROWAK

gUnknown_8452704:: @ 8452704
	.2byte SPECIES_SLUGMA
	.2byte SPECIES_MAGCARGO
	.2byte SPECIES_NUMEL
	.2byte SPECIES_CAMERUPT

gUnknown_845270C:: @ 845270C
	.2byte SPECIES_MAKUHITA
	.2byte SPECIES_HARIYAMA
	.2byte SPECIES_MEDITITE
	.2byte SPECIES_MEDICHAM

gUnknown_8452714:: @ 8452714
	.2byte SPECIES_SHUCKLE
	.2byte SPECIES_TEDDIURSA
	.2byte SPECIES_URSARING
	.2byte SPECIES_DELIBIRD

gUnknown_845271C:: @ 845271C
	.2byte SPECIES_GLIGAR
	.2byte SPECIES_SPINDA

gUnknown_8452720:: @ 8452720
	.2byte SPECIES_MAGBY
	.2byte SPECIES_MAGMAR
	.2byte SPECIES_TORKOAL

gUnknown_8452726:: @ 8452726
	.2byte SPECIES_ARON
	.2byte SPECIES_LAIRON
	.2byte SPECIES_AGGRON

gUnknown_845272C:: @ 845272C
	.2byte SPECIES_LARVITAR
	.2byte SPECIES_PUPITAR
	.2byte SPECIES_TYRANITAR

gUnknown_8452732:: @ 8452732
	.2byte SPECIES_SNORLAX

gUnknown_8452734:: @ 8452734
	.2byte SPECIES_ABSOL

gUnknown_8452736:: @ 8452736
	.2byte SPECIES_AERODACTYL

gUnknown_8452738:: @ 8452738
	.2byte SPECIES_CHARMANDER
	.2byte SPECIES_CHARMELEON
	.2byte SPECIES_CHARIZARD

gUnknown_845273E:: @ 845273E
	.2byte SPECIES_JIRACHI

gUnknown_8452740:: @ 8452740
	.2byte SPECIES_SPEAROW
	.2byte SPECIES_FEAROW

gUnknown_8452744:: @ 8452744
	.2byte SPECIES_SANDSHREW
	.2byte SPECIES_SANDSLASH
	.2byte SPECIES_RHYHORN
	.2byte SPECIES_RHYDON

gUnknown_845274C:: @ 845274C
	.2byte SPECIES_MAGNEMITE
	.2byte SPECIES_MAGNETON

gUnknown_8452750:: @ 8452750
	.2byte SPECIES_HOUNDOUR
	.2byte SPECIES_HOUNDOOM
	.2byte SPECIES_PHANPY
	.2byte SPECIES_DONPHAN

gUnknown_8452758:: @ 8452758
	.2byte SPECIES_CACNEA
	.2byte SPECIES_CACTURNE

gUnknown_845275C:: @ 845275C
	.2byte SPECIES_TRAPINCH
	.2byte SPECIES_VIBRAVA
	.2byte SPECIES_FLYGON

gUnknown_8452762:: @ 8452762
	.2byte SPECIES_SKARMORY

gUnknown_8452764:: @ 8452764
	.2byte SPECIES_BALTOY
	.2byte SPECIES_CLAYDOL

gUnknown_8452768:: @ 8452768
	.2byte SPECIES_BAGON
	.2byte SPECIES_SHELGON
	.2byte SPECIES_SALAMENCE

gUnknown_845276E:: @ 845276E
	.2byte SPECIES_BELDUM
	.2byte SPECIES_METANG
	.2byte SPECIES_METAGROSS

gUnknown_8452774:: @ 8452774
	.2byte SPECIES_GROUDON

gUnknown_8452776:: @ 8452776
	.2byte SPECIES_MEOWTH
	.2byte SPECIES_PERSIAN
	.2byte SPECIES_SNUBBULL
	.2byte SPECIES_GRANBULL

gUnknown_845277E:: @ 845277E
	.2byte SPECIES_GRIMER
	.2byte SPECIES_MUK
	.2byte SPECIES_KOFFING
	.2byte SPECIES_WEEZING

gUnknown_8452786:: @ 8452786
	.2byte SPECIES_SHUPPET
	.2byte SPECIES_BANETTE

gUnknown_845278A:: @ 845278A
	.2byte SPECIES_ABRA
	.2byte SPECIES_KADABRA
	.2byte SPECIES_ALAKAZAM

gUnknown_8452790:: @ 8452790
	.2byte SPECIES_RALTS
	.2byte SPECIES_KIRLIA
	.2byte SPECIES_GARDEVOIR

gUnknown_8452796:: @ 8452796
	.2byte SPECIES_SMOOCHUM
	.2byte SPECIES_JYNX
	.2byte SPECIES_MR_MIME
	.2byte SPECIES_SMEARGLE

gUnknown_845279E:: @ 845279E
	.2byte SPECIES_TYROGUE
	.2byte SPECIES_HITMONLEE
	.2byte SPECIES_HITMONCHAN
	.2byte SPECIES_HITMONTOP

gUnknown_84527A6:: @ 84527A6
	.2byte SPECIES_CHANSEY
	.2byte SPECIES_BLISSEY

gUnknown_84527AA:: @ 84527AA
	.2byte SPECIES_VOLTORB
	.2byte SPECIES_ELECTRODE
	.2byte SPECIES_PORYGON
	.2byte SPECIES_PORYGON2

gUnknown_84527B2:: @ 84527B2
	.2byte SPECIES_DITTO

gUnknown_84527B4:: @ 84527B4
	.2byte SPECIES_EEVEE
	.2byte SPECIES_VAPOREON
	.2byte SPECIES_JOLTEON
	.2byte SPECIES_FLAREON

gUnknown_84527BC:: @ 84527BC
	.2byte SPECIES_ESPEON
	.2byte SPECIES_UMBREON

gUnknown_84527C0:: @ 84527C0
	.2byte SPECIES_UNOWN

gUnknown_84527C2:: @ 84527C2
	.2byte SPECIES_ARTICUNO
	.2byte SPECIES_ZAPDOS
	.2byte SPECIES_MOLTRES

gUnknown_84527C8:: @ 84527C8
	.2byte SPECIES_LUGIA

gUnknown_84527CA:: @ 84527CA
	.2byte SPECIES_HO_OH

gUnknown_84527CC:: @ 84527CC
	.2byte SPECIES_RAYQUAZA

gUnknown_84527CE:: @ 84527CE
	.2byte SPECIES_DEOXYS

gUnknown_84527D0:: @ 84527D0
	.2byte SPECIES_MEWTWO

gUnknown_84527D2:: @ 84527D2
	.2byte SPECIES_MEW

gDexCategory_GrasslandPkmn::
	.4byte gUnknown_84524D0, 4
	.4byte gUnknown_84524D8, 4
	.4byte gUnknown_84524E0, 3
	.4byte gUnknown_84524E6, 3
	.4byte gUnknown_84524EC, 4
	.4byte gUnknown_84524F4, 4
	.4byte gUnknown_84524FC, 3
	.4byte gUnknown_8452502, 4
	.4byte gUnknown_845250A, 2
	.4byte gUnknown_845250E, 3
	.4byte gUnknown_8452514, 3
	.4byte gUnknown_845251A, 2
	.4byte gUnknown_845251E, 2
	.4byte gUnknown_8452522, 4
	.4byte gUnknown_845252A, 2
	.4byte gUnknown_845252E, 2
	.4byte gUnknown_8452532, 4
	.4byte gUnknown_845253A, 4
	.4byte gUnknown_8452542, 2
	.4byte gUnknown_8452546, 2
	.4byte gUnknown_845254A, 2
	.4byte gUnknown_845254E, 2
	.4byte gUnknown_8452552, 3
	.4byte gUnknown_8452558, 3
	.4byte gUnknown_845255E, 3
	.4byte gUnknown_8452564, 3
	.4byte gUnknown_845256A, 3

gDexCategory_ForestPkmn::
	.4byte gUnknown_8452570, 3
	.4byte gUnknown_8452576, 3
	.4byte gUnknown_845257C, 3
	.4byte gUnknown_8452582, 2
	.4byte gUnknown_8452586, 3
	.4byte gUnknown_845258C, 4
	.4byte gUnknown_8452594, 3
	.4byte gUnknown_845259A, 3
	.4byte gUnknown_84525A0, 4
	.4byte gUnknown_84525A8, 3
	.4byte gUnknown_84525AE, 3
	.4byte gUnknown_84525B4, 4
	.4byte gUnknown_84525BC, 3
	.4byte gUnknown_84525C2, 2
	.4byte gUnknown_84525C6, 2
	.4byte gUnknown_84525CA, 3
	.4byte gUnknown_84525D0, 2
	.4byte gUnknown_84525D4, 2
	.4byte gUnknown_84525D8, 3
	.4byte gUnknown_84525DE, 3
	.4byte gUnknown_84525E4, 2
	.4byte gUnknown_84525E8, 3
	.4byte gUnknown_84525EE, 2
	.4byte gUnknown_84525F2, 2
	.4byte gUnknown_84525F6, 3
	.4byte gUnknown_84525FC, 1

gDexCategory_WatersEdgePkmn::
	.4byte gUnknown_84525FE, 2
	.4byte gUnknown_8452602, 4
	.4byte gUnknown_845260A, 4
	.4byte gUnknown_8452612, 3
	.4byte gUnknown_8452618, 2
	.4byte gUnknown_845261C, 4
	.4byte gUnknown_8452624, 4
	.4byte gUnknown_845262C, 3
	.4byte gUnknown_8452632, 3
	.4byte gUnknown_8452638, 2
	.4byte gUnknown_845263C, 2
	.4byte gUnknown_8452640, 3
	.4byte gUnknown_8452646, 3
	.4byte gUnknown_845264C, 3
	.4byte gUnknown_8452652, 3
	.4byte gUnknown_8452658, 2

gDexCategory_SeaPkmn::
	.4byte gUnknown_845265C, 2
	.4byte gUnknown_8452660, 2
	.4byte gUnknown_8452664, 2
	.4byte gUnknown_8452668, 4
	.4byte gUnknown_8452670, 2
	.4byte gUnknown_8452674, 3
	.4byte gUnknown_845267A, 4
	.4byte gUnknown_8452682, 2
	.4byte gUnknown_8452686, 3
	.4byte gUnknown_845268C, 4
	.4byte gUnknown_8452694, 3
	.4byte gUnknown_845269A, 1
	.4byte gUnknown_845269C, 1
	.4byte gUnknown_845269E, 4
	.4byte gUnknown_84526A6, 2
	.4byte gUnknown_84526AA, 1

gDexCategory_CavePkmn::
	.4byte gUnknown_84526AC, 3
	.4byte gUnknown_84526B2, 4
	.4byte gUnknown_84526BA, 4
	.4byte gUnknown_84526C2, 3
	.4byte gUnknown_84526C8, 3
	.4byte gUnknown_84526CE, 2
	.4byte gUnknown_84526D2, 3
	.4byte gUnknown_84526D8, 2
	.4byte gUnknown_84526DC, 2
	.4byte gUnknown_84526E0, 3

gDexCategory_MountainPkmn::
	.4byte gUnknown_84526E6, 3
	.4byte gUnknown_84526EC, 4
	.4byte gUnknown_84526F4, 3
	.4byte gUnknown_84526FA, 3
	.4byte gUnknown_8452700, 2
	.4byte gUnknown_8452704, 4
	.4byte gUnknown_845270C, 4
	.4byte gUnknown_8452714, 4
	.4byte gUnknown_845271C, 2
	.4byte gUnknown_8452720, 3
	.4byte gUnknown_8452726, 3
	.4byte gUnknown_845272C, 3
	.4byte gUnknown_8452732, 1
	.4byte gUnknown_8452734, 1
	.4byte gUnknown_8452736, 1
	.4byte gUnknown_8452738, 3
	.4byte gUnknown_845273E, 1

gDexCategory_RoughTerrainPkmn::
	.4byte gUnknown_8452740, 2
	.4byte gUnknown_8452744, 4
	.4byte gUnknown_845274C, 2
	.4byte gUnknown_8452750, 4
	.4byte gUnknown_8452758, 2
	.4byte gUnknown_845275C, 3
	.4byte gUnknown_8452762, 1
	.4byte gUnknown_8452764, 2
	.4byte gUnknown_8452768, 3
	.4byte gUnknown_845276E, 3
	.4byte gUnknown_8452774, 1

gDexCategory_UrbanPkmn::
	.4byte gUnknown_8452776, 4
	.4byte gUnknown_845277E, 4
	.4byte gUnknown_8452786, 2
	.4byte gUnknown_845278A, 3
	.4byte gUnknown_8452790, 3
	.4byte gUnknown_8452796, 4
	.4byte gUnknown_845279E, 4
	.4byte gUnknown_84527A6, 2
	.4byte gUnknown_84527AA, 4
	.4byte gUnknown_84527B2, 1
	.4byte gUnknown_84527B4, 4
	.4byte gUnknown_84527BC, 2

gDexCategory_RarePkmn::
	.4byte gUnknown_84527C0, 1
	.4byte gUnknown_84527C2, 3
	.4byte gUnknown_84527C8, 1
	.4byte gUnknown_84527CA, 1
	.4byte gUnknown_84527CC, 1
	.4byte gUnknown_84527CE, 1
	.4byte gUnknown_84527D0, 1
	.4byte gUnknown_84527D2, 1

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
