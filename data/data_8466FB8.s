    .include "asm/macros.inc"
    .include "constants/constants.inc"

	.section .rodata

gUnknown_8468038:: @ 8468038
	.incbin "baserom.gba", 0x468038, 0x8

gUnknown_8468040:: @ 8468040
	.incbin "baserom.gba", 0x468040, 0x10

gUnknown_8468050:: @ 8468050
	.incbin "baserom.gba", 0x468050, 0x10

gUnknown_8468060::
	.incbin "baserom.gba", 0x468060, 0x20

gUnknown_8468080::
	.incbin "baserom.gba", 0x468080, 0x20

gUnknown_84680A0::
	.incbin "baserom.gba", 0x4680A0, 0x20

gUnknown_84680C0::
	.incbin "baserom.gba", 0x4680C0, 0x80

gUnknown_8468140::
	.incbin "baserom.gba", 0x468140, 0xdc

gUnknown_846821C::
	.incbin "baserom.gba", 0x46821C, 0x30

gUnknown_846824C::
	.incbin "baserom.gba", 0x46824C, 0xc0

gUnknown_846830C::
	.incbin "baserom.gba", 0x46830C, 0x70

gUnknown_846837C::
	.incbin "baserom.gba", 0x46837C, 0xcc

gUnknown_8468448::
	.incbin "baserom.gba", 0x468448, 0x90

gUnknown_84684D8::
	.incbin "baserom.gba", 0x4684D8, 0xdc

gUnknown_84685B4::
	.incbin "baserom.gba", 0x4685B4, 0x90

gUnknown_8468644::
	.incbin "baserom.gba", 0x468644, 0xdc

gUnknown_8468720:: @ 8468720
	.4byte 1, gUnknown_84680C0, gUnknown_8468140, gUnknown_8468060
	.4byte 1, gUnknown_846821C, gUnknown_846824C, gUnknown_84670AC
	.4byte 1, gUnknown_846830C, gUnknown_846837C, gUnknown_84670CC
	.4byte 1, gUnknown_846830C, gUnknown_846837C, gUnknown_84670EC
	.4byte 1, gUnknown_846830C, gUnknown_846837C, gUnknown_846710C
	.4byte 1, gUnknown_846830C, gUnknown_846837C, gUnknown_846712C
	.4byte 1, gUnknown_8468448, gUnknown_84684D8, gUnknown_8468080
	.4byte 1, gUnknown_84685B4, gUnknown_8468644, gUnknown_84680A0

gUnknown_84687A0::
	.incbin "baserom.gba", 0x4687a0, 0x40

    .include "data/mevent/script_ish.inc"
    .include "data/mevent/script_common.inc"
