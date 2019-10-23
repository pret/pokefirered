#include "constants/flags.h"
#include "constants/maps.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2, 0

sWhiteOutMoneyLossMultipliers:: @ 826D294
	.byte  2
	.byte  4
	.byte  6
	.byte  9
	.byte 12
	.byte 16
	.byte 20
	.byte 25
	.byte 30

	.align 1
sWhiteOutMoneyLossBadgeFlagIDs:: @ 826D29E
	.2byte FLAG_BADGE01_GET
    .2byte FLAG_BADGE02_GET
    .2byte FLAG_BADGE03_GET
    .2byte FLAG_BADGE04_GET
    .2byte FLAG_BADGE05_GET
    .2byte FLAG_BADGE06_GET
    .2byte FLAG_BADGE07_GET
    .2byte FLAG_BADGE08_GET

	.align 2
sDummyWarpData:: @ 826D2B0
	map MAP_UNDEFINED
	.byte 0xFF
	.align 1
	.2byte 0xFFFF, 0xFFFF

sUnusedData:: @ 826D2B8
	.4byte 1200
	.4byte 3600
	.4byte 1200
	.4byte 2400
	.4byte   50
	.4byte   80
	.4byte  -44
	.4byte   44

gDirectionToVectors:: @ 826D2D8
	.4byte  0,  0
	.4byte  0,  1
	.4byte  0, -1
	.4byte -1,  0
	.4byte  1,  0
	.4byte -1,  1
	.4byte  1,  1
	.4byte -1, -1
	.4byte  1, -1

gUnknown_826D320:: @ 826D320
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
	.4byte 0x000011d1
	@ {
	@ 	.bg = 1,
	@ 	.charBaseIndex = 0,
	@ 	.mapBaseIndex = 29,
	@ 	.screenSize = 0,
	@ 	.paletteMode = 0,
	@ 	.priority = 1,
	@ 	.baseTile = 0x0000
	@ }
	.4byte 0x000021c2
	@ {
	@ 	.bg = 2,
	@ 	.charBaseIndex = 0,
	@ 	.mapBaseIndex = 28,
	@ 	.screenSize = 0,
	@ 	.paletteMode = 0,
	@ 	.priority = 2,
	@ 	.baseTile = 0x0000
	@ }
	.4byte 0x000031e3
	@ {
	@ 	.bg = 3,
	@ 	.charBaseIndex = 0,
	@ 	.mapBaseIndex = 30,
	@ 	.screenSize = 0,
	@ 	.paletteMode = 0,
	@ 	.priority = 3,
	@ 	.baseTile = 0x0000
	@ }

gUnknown_826D330:: @ 826D330
	.4byte REG_WIN0H
	.4byte (2 >> 1) | ((DMA_16BIT | DMA_DEST_RELOAD | DMA_SRC_INC | DMA_REPEAT | DMA_START_HBLANK | DMA_ENABLE) << 16)
	.byte 1, 0

	.align 2
gUnknown_826D33C:: @ 826D33C
	.4byte sub_8058684
	.4byte sub_80586A4
	.4byte sub_80586A8

gUnknown_826D348:: @ 826D348
	.4byte sub_80586C8
	.4byte sub_80586CC
	.4byte sub_80586CC
	.4byte sub_80586CC
	.4byte sub_80586CC
	.4byte sub_80586C8
	.4byte sub_80586C8
	.4byte sub_8058734
	.4byte sub_8058734
	.4byte sub_8058734
	.4byte sub_8058734

gUnknown_826D374:: @ 826D374
	.4byte sub_805874C
	.4byte sub_8058754
