#include "constants/flags.h"
#include "constants/maps.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2, 0

gFlashEffectParams:: @ 826D330
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
