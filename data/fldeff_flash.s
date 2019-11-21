#include "constants/species.h"
#include "constants/items.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_83F5738:: @ 83F5738
	.byte 1, 4, 1, 0
	.4byte sub_80C9FD4
	.4byte sub_80CA160
	.byte 2, 4, 1, 0
	.4byte sub_80C9FD4
	.4byte sub_80CA160
	.byte 3, 4, 1, 0
	.4byte sub_80C9FD4
	.4byte sub_80CA160
	.byte 5, 4, 1, 0
	.4byte sub_80C9FD4
	.4byte sub_80CA160
	.byte 6, 4, 1, 0
	.4byte sub_80C9FD4
	.4byte sub_80CA160
	.byte 7, 4, 1, 0
	.4byte sub_80C9FD4
	.4byte sub_80CA160
	.byte 8, 4, 1, 0
	.4byte sub_80C9FD4
	.4byte sub_80CA160
	.byte 9, 4, 1, 0
	.4byte sub_80C9FD4
	.4byte sub_80CA160
	.byte 4, 1, 0, 1
	.4byte sub_80C9E1C
	.4byte sub_80CA160
	.byte 4, 2, 0, 1
	.4byte sub_80C9E1C
	.4byte sub_80CA160
	.byte 4, 3, 0, 1
	.4byte sub_80C9E1C
	.4byte sub_80CA160
	.byte 4, 5, 0, 1
	.4byte sub_80C9E1C
	.4byte sub_80CA160
	.byte 4, 6, 0, 1
	.4byte sub_80C9E1C
	.4byte sub_80CA160
	.byte 4, 7, 0, 1
	.4byte sub_80C9E1C
	.4byte sub_80CA160
	.byte 4, 8, 0, 1
	.4byte sub_80C9E1C
	.4byte sub_80CA160
	.byte 4, 9, 0, 1
	.4byte sub_80C9E1C
	.4byte sub_80CA160
	.byte 0, 0, 0, 0
	.4byte NULL
	.4byte NULL

gUnknown_83F5804:: @ 83F5804
	.incbin "graphics/field_effects/flash_white.gbapal"

gUnknown_83F5824:: @ 83F5824
	.incbin "graphics/field_effects/flash_black.gbapal"

gUnknown_83F5844:: @ 83F5844
	.incbin "graphics/field_effects/flash_gradient.gbapal"

gUnknown_83F5864:: @ 83F5864
	.incbin "graphics/field_effects/flash_effect_map.bin.lz"

gUnknown_83F5A44:: @ 83F5A44
	.incbin "graphics/field_effects/flash_effect_tiles.4bpp.lz"
