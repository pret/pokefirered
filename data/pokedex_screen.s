#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_843FAB0:: @ 843FAB0
	.incbin "baserom.gba", 0x43FAB0, 0x674

gUnknown_8440124:: @ 8440124
	.incbin "baserom.gba", 0x440124, 0x150

gUnknown_8440274:: @ 8440274
	.incbin "baserom.gba", 0x440274, 0x138

gUnknown_84403AC:: @ 84403AC
	.incbin "baserom.gba", 0x4403AC, 0x11C

gUnknown_84404C8:: @ 84404C8
	.incbin "baserom.gba", 0x4404C8, 0x200

gUnknown_84406C8:: @ 84406C8
	.incbin "baserom.gba", 0x4406C8, 0x4

gUnknown_84406CC:: @ 84406CC
	.incbin "baserom.gba", 0x4406CC, 0x2

gUnknown_84406CE:: @ 84406CE
	.incbin "baserom.gba", 0x4406CE, 0x12

gUnknown_84406E0:: @ 84406E0
	.incbin "baserom.gba", 0x4406E0, 0x810

gUnknown_8440EF0:: @ 8440EF0
	.incbin "baserom.gba", 0x440EF0, 0x2570

gUnknown_8443460:: @ 8443460
	.incbin "baserom.gba", 0x443460, 0x1A0

gUnknown_8443600:: @ 8443600
	.incbin "baserom.gba", 0x443600, 0x20

gUnknown_8443620:: @ 8443620
	.incbin "baserom.gba", 0x443620, 0x6E0

gUnknown_8443D00:: @ 8443D00
	.incbin "baserom.gba", 0x443D00, 0x2C0

gUnknown_8443FC0:: @ 8443FC0
	.incbin "baserom.gba", 0x443FC0, 0x336

gUnknown_84442F6:: @ 84442F6
	.incbin "baserom.gba", 0x4442F6, 0x304

gUnknown_84445FA:: @ 84445FA
	.incbin "baserom.gba", 0x4445FA, 0x304

gUnknown_84448FE:: @ 84448FE
	.incbin "baserom.gba", 0x4448FE, 0x336

	.section .rodata.after @ pokedex.c erroneously carved out?

gUnknown_8451EBC:: @ 8451EBC
	.incbin "baserom.gba", 0x451EBC, 0x10

gUnknown_8451ECC:: @ 8451ECC
	.incbin "baserom.gba", 0x451ECC, 0x18

gUnknown_8451EE4:: @ 8451EE4
	.incbin "baserom.gba", 0x451EE4, 0x70

gUnknown_8451F54:: @ 8451F54
	.incbin "baserom.gba", 0x451F54, 0x8

gUnknown_8451F5C:: @ 8451F5C
	.incbin "baserom.gba", 0x451F5C, 0x8

gUnknown_8451F64:: @ 8451F64
	.incbin "baserom.gba", 0x451F64, 0xA0

gUnknown_8452004:: @ 8452004
	.incbin "baserom.gba", 0x452004, 0xB8

gUnknown_84520BC:: @ 84520BC
	.incbin "baserom.gba", 0x4520BC, 0x18

gUnknown_84520D4:: @ 84520D4
	.incbin "baserom.gba", 0x4520D4, 0x10

gUnknown_84520E4:: @ 84520E4
	.incbin "baserom.gba", 0x4520E4, 0x10

gUnknown_84520F4:: @ 84520F4
	.incbin "baserom.gba", 0x4520F4, 0x78

gUnknown_845216C:: @ 845216C
	.incbin "baserom.gba", 0x45216C, 0x8

gUnknown_8452174:: @ 8452174
	.incbin "baserom.gba", 0x452174, 0x18

gUnknown_845218C:: @ 845218C
	.incbin "baserom.gba", 0x45218C, 0x28

gUnknown_84521B4:: @ 84521B4
	.incbin "baserom.gba", 0x4521B4, 0x10

gUnknown_84521C4:: @ 84521C4
	.incbin "baserom.gba", 0x4521C4, 0x8

gUnknown_84521CC:: @ 84521CC
	.incbin "baserom.gba", 0x4521CC, 0x8

gUnknown_84521D4:: @ 84521D4
	.incbin "baserom.gba", 0x4521D4, 0x8

gUnknown_84521DC:: @ 84521DC
	.incbin "baserom.gba", 0x4521DC, 0x8

gUnknown_84521E4:: @ 84521E4
	.incbin "baserom.gba", 0x4521E4, 0x8

gUnknown_84521EC:: @ 84521EC
	.incbin "baserom.gba", 0x4521EC, 0x8

gUnknown_84521F4:: @ 84521F4
	.incbin "baserom.gba", 0x4521F4, 0x8

gUnknown_84521FC:: @ 84521FC
	.incbin "baserom.gba", 0x4521FC, 0x8

gUnknown_8452204:: @ 8452204
	.incbin "baserom.gba", 0x452204, 0x8

gUnknown_845220C:: @ 845220C
	.incbin "baserom.gba", 0x45220C, 0x8

gUnknown_8452214:: @ 8452214
	.incbin "baserom.gba", 0x452214, 0x40

gUnknown_8452254:: @ 8452254
	.incbin "baserom.gba", 0x452254, 0x38

gUnknown_845228C:: @ 845228C
	.incbin "baserom.gba", 0x45228C, 0xA8

gUnknown_8452334:: @ 8452334
	.incbin "baserom.gba", 0x452334, 0x10

gUnknown_8452344:: @ 8452344
	.incbin "baserom.gba", 0x452344, 0x24

gUnknown_8452368:: @ 8452368
	.incbin "baserom.gba", 0x452368, 0x20

gUnknown_8452388:: @ 8452388
	.incbin "baserom.gba", 0x452388, 0x12C

gUnknown_84524B4:: @ 84524B4
	.incbin "baserom.gba", 0x4524B4, 0x10

gUnknown_84524C4:: @ 84524C4
	.incbin "baserom.gba", 0x4524C4, 0x788

gUnknown_8452C4C:: @ 8452C4C
	.incbin "baserom.gba", 0x452C4C, 0x48
