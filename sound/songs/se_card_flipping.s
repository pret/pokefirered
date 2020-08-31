	.include "MPlayDef.s"
	.section .rodata
	.global se_card_flipping
	.align 2
	.equ se_card_flipping_grp, voicegroup129
	.equ se_card_flipping_pri, 5
	.equ se_card_flipping_rev, reverb_set+50

se_card_flipping_1: @ 86BC6AC
	.byte KEYSH, 0x00
	.byte TEMPO, 0x5B
	.byte VOICE, 0x7D
	.byte XCMD, 0x08
	.byte GsM2
	.byte v009
	.byte GsM2
	.byte PAN, 0x40
	.byte VOL, 0x10
	.byte BEND, 0x42
	.byte N24
	.byte Gn5
	.byte v080
	.byte W03
	.byte VOL, 0x20
	.byte W03
	.byte Cn2
	.byte W03
	.byte En3
	.byte W03
	.byte Gs4
	.byte W03
	.byte Cn6
	.byte W03
	.byte En7
	.byte W03
	.byte Gn8
	.byte W03
	.byte W24
	.byte W24
	.byte W24
	.byte W24
	.byte FINE

@ ***************************************
	.align 2
se_card_flipping: @ 86BC6D8
	.byte 1
	.byte 0
	.byte se_card_flipping_pri
	.byte se_card_flipping_rev
	.word se_card_flipping_grp

	.word se_card_flipping_1
