#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_843EBB4:: @ 843EBB4
	.byte 0x04, 0x20
	.2byte 0x0000
	.byte 0x00
	.align 1
	.2byte 0x0002
	.4byte gUnknown_3005440
	.4byte Rfu+2480
	.byte 0x01, 0x00
	.2byte 0x0258, 0x012c
	.align 2

gUnknown_843EBCC:: @ 843EBCC
	.byte 0x00, 0x03, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00

gUnknown_843EBD4:: @ 843EBD4
	.4byte 0x00000000, 0x00000001, 0x00000003, 0x00000007, 0x0000000f, 0x0000001f, 0x0000003f, 0x0000007f
	.4byte 0x000000ff, 0x000001ff, 0x000003ff, 0x000007ff, 0x00000fff, 0x00001fff, 0x00003fff, 0x00007fff
	.4byte 0x0000ffff, 0x0001ffff, 0x0003ffff, 0x0007ffff, 0x000fffff, 0x001fffff, 0x003fffff, 0x007fffff
	.4byte 0x00ffffff

gUnknown_843EC38:: @ 843EC38
	.byte 0x00, 0x00, 0x01, 0x01, 0x02, 0x02, 0x02, 0x02
	.byte 0x03

gUnknown_843EC41:: @ 843EC41
	.byte 0x00, 0x01, 0x01, 0x02, 0x01, 0x02, 0x02, 0x03
	.byte 0x01, 0x02, 0x02, 0x03, 0x02, 0x03, 0x03, 0x04

gUnknown_843EC51:: @ 843EC51
	.byte 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00

gUnknown_843EC64:: @ 843EC64
	.4byte gBlockSendBuffer
	.2byte 0xc8
	.align 2
	.4byte gBlockSendBuffer
	.2byte 0xc8
	.align 2
	.4byte gBlockSendBuffer
	.2byte 0x64
	.align 2
	.4byte gBlockSendBuffer
	.2byte 0xdc
	.align 2
	.4byte gBlockSendBuffer
	.2byte 0x28
	.align 2

gUnknown_843EC8C:: @ 843EC8C
	.2byte 0x0002, 0x7f7d, 0xffff

	.macro ascipad str, len
1:
	.ascii "\str"
2:
	.space \len - (2b - 1b)
	.endm

sUnref_843EC92::
    ascipad "RFU WAIT", 15
    ascipad "RFU BOOT", 15
    ascipad "RFU ERROR", 15
    ascipad "RFU RESET", 15
    ascipad "RFU CONFIG", 15
    ascipad "RFU START", 15
    ascipad "RFU SC POLL", 15
    ascipad "RFU SP POLL", 15
    ascipad "RFU START", 15
    ascipad "RFU SEND ERR", 15
    ascipad "RFU CP POLL", 15

sUnref_843ED38::
    ascipad "              ", 16
    ascipad "RECOVER START ", 16
    ascipad "DISSCONECT    ", 16
    ascipad "RECOVER SUUSES", 16
    ascipad "RECOVER FAILED", 16

	.align 2
gUnknown_843ED88:: @ 843ED88
	.4byte sub_80FA834
	.4byte sub_80FAA94
	.4byte sub_80FACF0

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
