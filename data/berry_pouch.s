	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_846436C:: @ 846436C
	.incbin "baserom.gba", 0x46436C, 0x8

gUnknown_8464374:: @ 8464374
	.incbin "baserom.gba", 0x464374, 0x8

gUnknown_846437C:: @ 846437C
	.4byte gOtherText_Use,  sub_813DE0C
	.4byte gOtherText_Toss, sub_813DEBC
	.4byte gOtherText_Give, sub_813E200
	.4byte gOtherText_Exit, sub_813E320
	.4byte gString_Dummy,   NULL

gUnknown_84643A4:: @ 84643A4
	.byte 0, 2, 1, 3

gUnknown_84643A8:: @ 84643A8
	.byte 2, 3, 4, 4

gUnknown_84643AC:: @ 84643AC
	.byte 3, 4, 4, 4

gUnknown_84643B0:: @ 84643B0
	.byte 0, 1, 3, 4

gUnknown_84643B4:: @ 84643B4
	.string " $"

	.align 2
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
