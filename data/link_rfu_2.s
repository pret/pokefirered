#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_843EBB4:: @ 843EBB4
	.incbin "baserom.gba", 0x43EBB4, 0x18

gUnknown_843EBCC:: @ 843EBCC
	.incbin "baserom.gba", 0x43EBCC, 0x8

gUnknown_843EBD4:: @ 843EBD4
	.incbin "baserom.gba", 0x43EBD4, 0x64

gUnknown_843EC38:: @ 843EC38
	.incbin "baserom.gba", 0x43EC38, 0x9

gUnknown_843EC41:: @ 843EC41
	.incbin "baserom.gba", 0x43EC41, 0x10

gUnknown_843EC51:: @ 843EC51
	.incbin "baserom.gba", 0x43EC51, 0x13

gUnknown_843EC64:: @ 843EC64
	.incbin "baserom.gba", 0x43EC64, 0x28

gUnknown_843EC8C:: @ 843EC8C
	.incbin "baserom.gba", 0x43EC8C, 0xFC

	.align 2
gUnknown_843ED88:: @ 843ED88
	.incbin "baserom.gba", 0x43ED88, 0xC

	.align 2
gUnknown_843ED94:: @ 843ED94
	.asciz "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/rfu.c"

	.align 2
gUnknown_843EDC4:: @ 843EDC4
	.asciz "Rfu.RfuFunc == NULL"

	.align 2
gUnknown_843EDD8:: @ 843EDD8
	.asciz "size<=252"

	.align 2
gUnknown_843EDE4:: @ 843EDE4
	.asciz "PokemonSioInfo"

	.byte 0, 1, 7, 0x14, 0xFF

	.align 2
gUnknown_843EDF8:: @ 843EDF8
	.asciz "LINK LOSS DISCONNECT!"

	.align 2
gUnknown_843EE10:: @ 843EE10
	.asciz "LINK LOSS RECOVERY NOW"

	.align 2
gUnknown_843EE28:: @ 843EE28
	.incbin "baserom.gba", 0x43EE28, 0x1F

gUnknown_843EE47:: @ 843EE47
	.incbin "baserom.gba", 0x43EE47, 0x10

gUnknown_843EE57:: @ 843EE57
	.incbin "baserom.gba", 0x43EE57, 0xD

	.align 2
gUnknown_843EE64:: @ 843EE64
	.asciz "NOWSLOT"
	.align 2
	.asciz "           "
	.align 2
	.asciz "CLOCK DRIFT"
	.align 2
	.asciz "BUSY SEND  "
	.align 2
	.asciz "CMD REJECT "
	.align 2
	.asciz "CLOCK SLAVE"
	.align 2
	.asciz "CHILD "
	.align 2
	.asciz "PARENT"
	.align 2
	.asciz "SEARCH"

	.align 2
	.incbin "baserom.gba", 0x43EEC0, 0x144

gUnknown_843F004:: @ 843F004
	.incbin "baserom.gba", 0x43F004, 0x100

gUnknown_843F104:: @ 843F104
	.incbin "baserom.gba", 0x43F104, 0x100

gUnknown_843F204:: @ 843F204
	.incbin "baserom.gba", 0x43F204, 0x70

gUnknown_843F274:: @ 843F274
	.incbin "baserom.gba", 0x43F274, 0x8

gUnknown_843F27C:: @ 843F27C
	.incbin "baserom.gba", 0x43F27C, 0x8

gUnknown_843F284:: @ 843F284
	.incbin "baserom.gba", 0x43F284, 0x18
