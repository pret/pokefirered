	.include "MPlayDef.s"
	.section .rodata
	.global se_card_open
	.align 2
	.equ se_card_open_grp, voicegroup129
	.equ se_card_open_pri, 5
	.equ se_card_open_rev, reverb_set+50

se_card_open_1: @ 86BC6E4
	.byte KEYSH, 0x00
	.byte TEMPO, 0x57
	.byte VOICE, 0x2E
	.byte XCMD, 0x08
	.byte GsM2
	.byte v009
	.byte GsM2
	.byte VOL, 0x70
	.byte PAN, 0x40
	.byte VOL, 0x70
	.byte PAN, 0x40
	.byte BEND, 0x40
	.byte N03
	.byte An5
	.byte v112
	.byte W03
	.byte VOL, 0x40
	.byte N03
	.byte Bn5
	.byte W03
	.byte VOL, 0x70
	.byte PAN, 0x10
	.byte N06
	.byte En6
	.byte W03
	.byte VOL, 0x40
	.byte W03
	.byte En7
	.byte PAN, 0x70
	.byte N06
	.byte En6
	.byte v040
	.byte W03
	.byte VOL, 0x40
	.byte W03
	.byte PAN, 0x10
	.byte VOL, 0x61
	.byte N06
	.byte En6
	.byte v032
	.byte W03
	.byte VOL, 0x40
	.byte W03
	.byte PAN, 0x70
	.byte VOL, 0x60
	.byte N06
	.byte En6
	.byte v024
	.byte W03
	.byte VOL, 0x40
	.byte W03
	.byte PAN, 0x10
	.byte VOL, 0x50
	.byte N06
	.byte En6
	.byte v016
	.byte W03
	.byte VOL, 0x40
	.byte W03
	.byte PAN, 0x70
	.byte VOL, 0x50
	.byte N06
	.byte En6
	.byte v012
	.byte W03
	.byte VOL, 0x30
	.byte W03
	.byte N06
	.byte En6
	.byte v008
	.byte W03
	.byte VOL, 0x02
	.byte W03
	.byte W24
	.byte W24
	.byte W24
	.byte FINE

se_card_open_2: @ 86BC74D
	.byte KEYSH, 0x00
	.byte VOICE, 0x7C
	.byte PAN, 0x40
	.byte VOL, 0x40
	.byte N03
	.byte Cn5
	.byte v092
	.byte W06
	.byte Cn5
	.byte v032
	.byte W18
	.byte W24
	.byte W24
	.byte W24
	.byte W24
	.byte FINE

@ ***************************************
	.align 2
se_card_open: @ 86BC764
	.byte 2
	.byte 0
	.byte se_card_open_pri
	.byte se_card_open_rev
	.word se_card_open_grp

	.word se_card_open_1
	.word se_card_open_2
