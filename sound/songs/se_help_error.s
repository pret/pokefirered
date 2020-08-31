	.include "MPlayDef.s"
	.section .rodata
	.global se_help_error
	.align 2
	.equ se_help_error_grp, voicegroup129
	.equ se_help_error_pri, 5
	.equ se_help_error_rev, reverb_set+50

se_help_error_1: @ 86BC9EC
	.byte KEYSH, 0x00
	.byte TEMPO, 0xD2
	.byte VOICE, 0x18
	.byte LFOS, 0x2C
	.byte BENDR, 0x0C
	.byte PAN, 0x40
	.byte VOL, 0x60
	.byte N04
	.byte Dn4
	.byte v120
	.byte W06
	.byte PAN, 0x00
	.byte N04
	.byte Dn4
	.byte v032
	.byte W06
	.byte PAN, 0x3F
	.byte N04
	.byte Fs4
	.byte v096
	.byte W06
	.byte PAN, 0x7F
	.byte N04
	.byte Fs4
	.byte v032
	.byte W06
	.byte VOICE, 0x5C
	.byte PAN, 0x40
	.byte VOL, 0x7D
	.byte N04
	.byte An1
	.byte v112
	.byte W10
	.byte MOD, 0x08
	.byte W02
	.byte N06
	.byte An1
	.byte v088
	.byte W06
	.byte An1
	.byte v024
	.byte W06
	.byte MOD, 0x00
	.byte FINE

@ ***************************************
	.align 2
se_help_error: @ 86BCA28
	.byte 1
	.byte 0
	.byte se_help_error_pri
	.byte se_help_error_rev
	.word se_help_error_grp

	.word se_help_error_1
