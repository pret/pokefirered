#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

	.align 2
gUnknown_843ED94:: @ 843ED94
	abspath "rfu.c"

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
	.asciz "                              "

gUnknown_843EE47:: @ 843EE47
	.asciz "               "

gUnknown_843EE57:: @ 843EE57
	.asciz "        "
	.asciz " "
	.asciz "*"

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
