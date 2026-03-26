	.include "MPlayDef.s"
	.section .rodata
	.global se_shop
	.align 2
	.equ se_shop_grp, voicegroup129
	.equ se_shop_pri, 5
	.equ se_shop_rev, reverb_set+50

se_shop_1: @ 86BC830
	.byte KEYSH, 0x00
	.byte TEMPO, 0x3E
	.byte VOICE, 0x08
	.byte VOL, 0x50
	.byte PAN, 0x40
	.byte BEND, 0x40
	.byte N30
	.byte Cn3
	.byte v120
	.byte W06
	.byte W06
	.byte W06
	.byte W06
	.byte W06
	.byte FINE

@ ***************************************
	.align 2
se_shop: @ 86BC848
	.byte 1
	.byte 0
	.byte se_shop_pri
	.byte se_shop_rev
	.word se_shop_grp

	.word se_shop_1
