    .include "asm/macros.inc"
    .include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_8467068:: @ 8467068
	.byte 0x00, 0x02, 0x03
	.byte 0x00, 0x01, 0x02

    .align 2
gUnknown_8467070:: @ 8467070
	.byte 0x07, 0x04, 0x07

	.align 2
gUnknown_8467074:: @ 8467074
	@ {0x01, 0x01, 0x01, 0x19, 0x04, 0x0f, 0x029c},
	@ {0x01, 0x01, 0x06, 0x1c, 0x08, 0x0f, 0x01bc},
	@ {0x01, 0x01, 0x0e, 0x1c, 0x05, 0x0f, 0x0130}
	.byte 0x01, 0x01, 0x01, 0x19, 0x04, 0x0f
	.2byte 0x029c
	.byte 0x01, 0x01, 0x06, 0x1c, 0x08, 0x0f
	.2byte 0x01bc
	.byte 0x01, 0x01, 0x0e, 0x1c, 0x05, 0x0f
	.2byte 0x0130

gUnknown_846708C::
	.incbin "data/graphics/mevent/pal_46708C.gbapal"

gUnknown_84670AC::
	.incbin "data/graphics/mevent/pal_4670AC.gbapal"

gUnknown_84670CC::
	.incbin "data/graphics/mevent/pal_4670CC.gbapal"

gUnknown_84670EC::
	.incbin "data/graphics/mevent/pal_4670EC.gbapal"

gUnknown_846710C::
	.incbin "data/graphics/mevent/pal_46710C.gbapal"

gUnknown_846712C::
	.incbin "data/graphics/mevent/pal_46712C.gbapal"

gUnknown_846714C::
	.incbin "data/graphics/mevent/pal_46714C.gbapal"

gUnknown_846716C::
	.incbin "data/graphics/mevent/pal_46716C.gbapal"

	.align 2
gUnknown_846718C::
	.incbin "data/graphics/mevent/gfx_46718C.4bpp.lz"

	.align 2
gUnknown_8467288::
	.incbin "data/graphics/mevent/tilemap_467288.bin.lz"

	.align 2
gUnknown_846737C::
	.incbin "data/graphics/mevent/gfx_46737C.4bpp.lz"

	.align 2
gUnknown_8467470::
	.incbin "data/graphics/mevent/tilemap_467470.bin.lz"

	.align 2
gUnknown_8467558::
	.incbin "data/graphics/mevent/gfx_467558.4bpp.lz"

	.align 2
gUnknown_846762C::
	.incbin "data/graphics/mevent/tilemap_46762C.bin.lz"

	.align 2
gUnknown_8467700::
	.incbin "data/graphics/mevent/gfx_467700.4bpp.lz"

	.align 2
gUnknown_8467934::
	.incbin "data/graphics/mevent/tilemap_467934.bin.lz"

	.align 2
gUnknown_8467A7C::
	.incbin "data/graphics/mevent/gfx_467A7C.4bpp.lz"

	.align 2
gUnknown_8467CAC::
	.incbin "data/graphics/mevent/tilemap_467CAC.bin.lz"

gUnknown_8467DF4::
	.incbin "baserom.gba", 0x467DF4, 0x164

gUnknown_8467F58:: @ 8467F58
	.incbin "baserom.gba", 0x467F58, 0x8

gUnknown_8467F60:: @ 8467F60
	.incbin "baserom.gba", 0x467F60, 0x40

gUnknown_8467FA0:: @ 8467FA0
	.incbin "baserom.gba", 0x467FA0, 0x18

gUnknown_8467FB8:: @ 8467FB8
	.4byte 0x0001, gUnknown_846718C, gUnknown_8467288, gUnknown_846708C
	.4byte 0x1001, gUnknown_846737C, gUnknown_8467470, gUnknown_84670AC
	.4byte 0x2001, gUnknown_8467558, gUnknown_846762C, gUnknown_84670CC
	.4byte 0x3001, gUnknown_8467558, gUnknown_846762C, gUnknown_84670EC
	.4byte 0x4001, gUnknown_8467558, gUnknown_846762C, gUnknown_846710C
	.4byte 0x5001, gUnknown_8467558, gUnknown_846762C, gUnknown_846712C
	.4byte 0x6001, gUnknown_8467700, gUnknown_8467934, gUnknown_846714C
	.4byte 0x7001, gUnknown_8467A7C, gUnknown_8467CAC, gUnknown_846716C

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
