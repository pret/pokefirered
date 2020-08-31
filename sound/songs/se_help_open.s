	.include "MPlayDef.s"
	.section .rodata
	.global se_help_open
	.align 2
	.equ se_help_open_grp, voicegroup129
	.equ se_help_open_pri, 5
	.equ se_help_open_rev, reverb_set+50

se_help_open_1: @ 86BC910
	.byte KEYSH, 0x00
	.byte TEMPO, 0xD2
	.byte VOICE, 0x18
	.byte LFOS, 0x2C
	.byte BENDR, 0x0C
	.byte VOL, 0x60
	.byte PAN, 0x10
	.byte N04
	.byte Dn4
	.byte v096
	.byte W06
	.byte PAN, 0x00
	.byte N04
	.byte Dn4
	.byte v032
	.byte W06
	.byte PAN, 0x20
	.byte N04
	.byte Fs4
	.byte v096
	.byte W06
	.byte PAN, 0x7F
	.byte N04
	.byte Fs4
	.byte v032
	.byte W06
	.byte PAN, 0x20
	.byte N04
	.byte An4
	.byte v096
	.byte W06
	.byte PAN, 0x00
	.byte N04
	.byte An4
	.byte v032
	.byte W06
	.byte PAN, 0x30
	.byte N04
	.byte Cs5
	.byte v096
	.byte W06
	.byte PAN, 0x7F
	.byte N04
	.byte Cs5
	.byte v032
	.byte W06
	.byte PAN, 0x60
	.byte N04
	.byte Dn5
	.byte v076
	.byte W06
	.byte PAN, 0x00
	.byte N04
	.byte Dn5
	.byte v032
	.byte W06
	.byte PAN, 0x7F
	.byte N04
	.byte Dn5
	.byte v024
	.byte W06
	.byte PAN, 0x00
	.byte N04
	.byte Dn5
	.byte v016
	.byte W06
	.byte PAN, 0x7F
	.byte N04
	.byte Dn5
	.byte v008
	.byte W06
	.byte PAN, 0x00
	.byte N04
	.byte Dn5
	.byte v004
	.byte W18
	.byte FINE

@ ***************************************
	.align 2
se_help_open: @ 86BC974
	.byte 1
	.byte 0
	.byte se_help_open_pri
	.byte se_help_open_rev
	.word se_help_open_grp

	.word se_help_open_1
