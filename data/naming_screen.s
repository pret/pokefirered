#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

	.incbin "baserom.gba", 0x3E1800, 0xA80

gUnknown_83E2280:: @ 83E2280
	.incbin "baserom.gba", 0x3E2280, 0x10

gUnknown_83E2290:: @ 83E2290
	.incbin "baserom.gba", 0x3E2290, 0x10

gUnknown_83E22A0:: @ 83E22A0
	.incbin "baserom.gba", 0x3E22A0, 0x30

gUnknown_83E22D0:: @ 83E22D0
	.incbin "baserom.gba", 0x3E22D0, 0x60

gUnknown_83E2330:: @ 83E2330
	.incbin "baserom.gba", 0x3E2330, 0x3

gUnknown_83E2333:: @ 83E2333
	.incbin "baserom.gba", 0x3E2333, 0x18

gUnknown_83E234B:: @ 83E234B
	.incbin "baserom.gba", 0x3E234B, 0x3

gUnknown_83E234E:: @ 83E234E
	.incbin "baserom.gba", 0x3E234E, 0x3

gUnknown_83E2351:: @ 83E2351
	.incbin "baserom.gba", 0x3E2351, 0x3

gUnknown_83E2354:: @ 83E2354
	.incbin "baserom.gba", 0x3E2354, 0x10

gUnknown_83E2364:: @ 83E2364
	.incbin "baserom.gba", 0x3E2364, 0x8

gUnknown_83E236C:: @ 83E236C
	.incbin "baserom.gba", 0x3E236C, 0x8

gUnknown_83E2374:: @ 83E2374
	.incbin "baserom.gba", 0x3E2374, 0x4

gUnknown_83E2378:: @ 83E2378
	.incbin "baserom.gba", 0x3E2378, 0x10

gUnknown_83E2388:: @ 83E2388
	.incbin "baserom.gba", 0x3E2388, 0x6

gUnknown_83E238E:: @ 83E238E
	.incbin "baserom.gba", 0x3E238E, 0x6

gUnknown_83E2394:: @ 83E2394
	.incbin "baserom.gba", 0x3E2394, 0x28

gUnknown_83E23BC:: @ 83E23BC
	.incbin "baserom.gba", 0x3E23BC, 0x4

gUnknown_83E23C0:: @ 83E23C0
	.incbin "baserom.gba", 0x3E23C0, 0x8

gUnknown_83E23C8:: @ 83E23C8
	.incbin "baserom.gba", 0x3E23C8, 0x8

gUnknown_83E23D0:: @ 83E23D0
	.incbin "baserom.gba", 0x3E23D0, 0x10

gUnknown_83E23E0:: @ 83E23E0
	.incbin "baserom.gba", 0x3E23E0, 0x8

gUnknown_83E23E8:: @ 83E23E8
	.incbin "baserom.gba", 0x3E23E8, 0xA

gUnknown_83E23F2:: @ 83E23F2
	.incbin "baserom.gba", 0x3E23F2, 0xA

gUnknown_83E23FC:: @ 83E23FC
	.incbin "baserom.gba", 0x3E23FC, 0x8

gUnknown_83E2404:: @ 83E2404
	.incbin "baserom.gba", 0x3E2404, 0x8

gUnknown_83E240C:: @ 83E240C
	.incbin "baserom.gba", 0x3E240C, 0x14

gUnknown_83E2420:: @ 83E2420
	.incbin "baserom.gba", 0x3E2420, 0x8

gUnknown_83E2428:: @ 83E2428
	.incbin "baserom.gba", 0x3E2428, 0x14

gUnknown_83E243C:: @ 83E243C
	.incbin "baserom.gba", 0x3E243C, 0x4

gUnknown_83E2440:: @ 83E2440
	.incbin "baserom.gba", 0x3E2440, 0xC

gUnknown_83E244C:: @ 83E244C
	.incbin "baserom.gba", 0x3E244C, 0xC

gUnknown_83E2458:: @ 83E2458
	.incbin "baserom.gba", 0x3E2458, 0x34

gUnknown_83E248C:: @ 83E248C
	.incbin "baserom.gba", 0x3E248C, 0x78

gUnknown_83E2504:: @ 83E2504
	.incbin "baserom.gba", 0x3E2504, 0x8

gUnknown_83E250C:: @ 83E250C
	.incbin "baserom.gba", 0x3E250C, 0x18

gUnknown_83E2524:: @ 83E2524
	.incbin "baserom.gba", 0x3E2524, 0x8

gUnknown_83E252C:: @ 83E252C
	.incbin "baserom.gba", 0x3E252C, 0x48

gUnknown_83E2574:: @ 83E2574
	.incbin "baserom.gba", 0x3E2574, 0x18

gUnknown_83E258C:: @ 83E258C
	.incbin "baserom.gba", 0x3E258C, 0x18

gUnknown_83E25A4:: @ 83E25A4
	.incbin "baserom.gba", 0x3E25A4, 0x18

gUnknown_83E25BC:: @ 83E25BC
	.incbin "baserom.gba", 0x3E25BC, 0x18

gUnknown_83E25D4:: @ 83E25D4
	.incbin "baserom.gba", 0x3E25D4, 0x18

gUnknown_83E25EC:: @ 83E25EC
	.incbin "baserom.gba", 0x3E25EC, 0x18

gUnknown_83E2604:: @ 83E2604
	.incbin "baserom.gba", 0x3E2604, 0x18

gUnknown_83E261C:: @ 83E261C
	.incbin "baserom.gba", 0x3E261C, 0x18

gUnknown_83E2634:: @ 83E2634
	.incbin "baserom.gba", 0x3E2634, 0x18

gUnknown_83E264C:: @ 83E264C
	.incbin "baserom.gba", 0x3E264C, 0x30

gUnknown_83E267C:: @ 83E267C
	.incbin "baserom.gba", 0x3E267C, 0x68

gUnknown_83E26E4:: @ 83E26E4
	.incbin "baserom.gba", 0x3E26E4, 0x48
