#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83DF09C:: @ 83DF09C
	.4byte gUnknown_8416738, sub_809AC5C
	.4byte gUnknown_841673C, sub_809AC98
	.4byte gUnknown_8416741, sub_809ACF8

gUnknown_83DF0B4:: @ 83DF0B4
	.4byte sub_809BEA4
	.4byte sub_809BF98

gUnknown_83DF0BC:: @ 83DF0BC
	.byte 0, 2, 1, 12, 6, 15
	.2byte 0x0008
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 2,
	@   .tilemapTop = 1,
	@   .width = 12,
	@   .height = 6,
	@   .paletteNum = 15,
	@   .baseBlock = 0x0008
	@ }

gUnknown_83DF0C4:: @ 83DF0C4
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
	.4byte 0x000011e1
	@ {
	@   .bg = 1,
	@   .charBaseIndex = 0,
	@   .mapBaseIndex = 30,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 1,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x000021d2
	@ {
	@   .bg = 2,
	@   .charBaseIndex = 0,
	@   .mapBaseIndex = 29,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 2,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x000031c3
	@ {
	@   .bg = 3,
	@   .charBaseIndex = 0,
	@   .mapBaseIndex = 28,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 3,
	@   .baseTile = 0x0000
	@ }

gUnknown_83DF0D4:: @ 83DF0D4
	.2byte 0x0308, 0x030a, 0x02d0

gUnknown_83DF0DA:: @ 83DF0DA
	.2byte 0x0309, 0x030b, 0x02d1

gUnknown_83DF0E0:: @ 83DF0E0
	.2byte 0x0310, 0x0312, 0x02d8

gUnknown_83DF0E6:: @ 83DF0E6
	.2byte 0x0311, 0x0313, 0x02d9

gUnknown_83DF0EC:: @ 83DF0EC
	.2byte 0x02e3, 0x0316, 0x0314

gUnknown_83DF0F2:: @ 83DF0F2
	.2byte 0x02e4, 0x0317, 0x0315

gUnknown_83DF0F8:: @ 83DF0F8
	.2byte 0x02eb, 0x031e, 0x031c
