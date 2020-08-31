	.include "MPlayDef.s"
	.section .rodata
	.global se_help_close
	.align 2
	.equ se_help_close_grp, voicegroup129
	.equ se_help_close_pri, 5
	.equ se_help_close_rev, reverb_set+50

se_help_close_1: @ 86BC980
	.byte KEYSH, 0x00
	.byte TEMPO, 0xD2
	.byte VOICE, 0x18
	.byte LFOS, 0x2C
	.byte BENDR, 0x0C
	.byte VOL, 0x5F
	.byte PAN, 0x70
	.byte N04
	.byte Dn5
	.byte v092
	.byte W06
	.byte PAN, 0x00
	.byte N04
	.byte Dn5
	.byte v032
	.byte W06
	.byte PAN, 0x60
	.byte N04
	.byte An4
	.byte v096
	.byte W06
	.byte PAN, 0x7F
	.byte N04
	.byte An4
	.byte v032
	.byte W06
	.byte PAN, 0x60
	.byte N04
	.byte Fs4
	.byte v092
	.byte W06
	.byte PAN, 0x00
	.byte N04
	.byte Fs4
	.byte v032
	.byte W06
	.byte PAN, 0x50
	.byte N04
	.byte En4
	.byte v092
	.byte W06
	.byte PAN, 0x7F
	.byte N04
	.byte En4
	.byte v032
	.byte W06
	.byte PAN, 0x19
	.byte N04
	.byte Dn4
	.byte v096
	.byte W06
	.byte PAN, 0x7F
	.byte N04
	.byte Dn4
	.byte v032
	.byte W06
	.byte PAN, 0x00
	.byte N04
	.byte W06
	.byte PAN, 0x7F
	.byte N04
	.byte Dn4
	.byte v016
	.byte W06
	.byte PAN, 0x00
	.byte N04
	.byte Dn4
	.byte v012
	.byte W06
	.byte PAN, 0x7F
	.byte N04
	.byte Dn4
	.byte v004
	.byte W18
	.byte FINE

@ ***************************************
	.align 2
se_help_close: @ 86BC9E0
	.byte 1
	.byte 0
	.byte se_help_close_pri
	.byte se_help_close_rev
	.word se_help_close_grp

	.word se_help_close_1
