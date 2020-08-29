	.include "MPlayDef.s"
	.section .rodata
	.global se_card_flip
	.align 2
	.equ se_card_flip_grp, voicegroup129
	.equ se_card_flip_pri, 5
	.equ se_card_flip_rev, reverb_set+50

se_card_flip_1: @ 86BC680
	.byte KEYSH, 0x00
	.byte TEMPO, 0x5B
	.byte VOICE, 0x7D
	.byte XCMD, 0x08
	.byte GsM2
	.byte v009
	.byte GsM2
	.byte PAN, 0x40
	.byte VOL, 0x7F
	.byte BEND, 0x42
	.byte N01
	.byte Cn4
	.byte v127
	.byte W03
	.byte VOICE, 0x7C
	.byte N01
	.byte Cn5
	.byte v064
	.byte W21
	.byte W24
	.byte FINE

@ ***************************************
	.align 2
se_card_flip: @ 86BC6A0
	.byte 1
	.byte 0
	.byte se_card_flip_pri
	.byte se_card_flip_rev
	.word se_card_flip_grp

	.word se_card_flip_1
