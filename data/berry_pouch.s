	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_8464358:: @ 8464358
	.incbin "baserom.gba", 0x464358, 0x14

gUnknown_846436C:: @ 846436C
	.incbin "baserom.gba", 0x46436C, 0x8

gUnknown_8464374:: @ 8464374
	.incbin "baserom.gba", 0x464374, 0x8

gUnknown_846437C:: @ 846437C
	.incbin "baserom.gba", 0x46437C, 0x28

gUnknown_84643A4:: @ 84643A4
	.incbin "baserom.gba", 0x4643A4, 0x4

gUnknown_84643A8:: @ 84643A8
	.incbin "baserom.gba", 0x4643A8, 0x4

gUnknown_84643AC:: @ 84643AC
	.incbin "baserom.gba", 0x4643AC, 0x4

gUnknown_84643B0:: @ 84643B0
	.incbin "baserom.gba", 0x4643B0, 0x4

gUnknown_84643B4:: @ 84643B4
	.incbin "baserom.gba", 0x4643B4, 0x4

gUnknown_84643B8:: @ 84643B8
	.incbin "baserom.gba", 0x4643B8, 0x20

gUnknown_84643D8:: @ 84643D8
	.incbin "baserom.gba", 0x4643D8, 0x18

gUnknown_84643F0:: @ 84643F0
	.incbin "baserom.gba", 0x4643F0, 0x8

gUnknown_84643F8:: @ 84643F8
	.incbin "baserom.gba", 0x4643F8, 0x8

gUnknown_8464400:: @ 8464400
	.incbin "baserom.gba", 0x464400, 0x48

gUnknown_8464448:: @ 8464448
	.incbin "baserom.gba", 0x464448, 0x60

gUnknown_84644A8:: @ 84644A8
	obj_tiles gUnknown_8E8560C, 0x800, 100

gUnknown_84644B0:: @ 84644B0
	obj_pal gUnknown_8E85C1C, 100

gUnknown_84644B8:: @ 84644B8
	.incbin "baserom.gba", 0x4644B8, 0x32C
