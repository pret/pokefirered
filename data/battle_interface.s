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
