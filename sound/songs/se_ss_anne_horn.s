	.include "MPlayDef.s"
	.section .rodata
	.global se_ss_anne_horn
	.align 2
	.equ se_ss_anne_horn_grp, voicegroup129
	.equ se_ss_anne_horn_pri, 5
	.equ se_ss_anne_horn_rev, reverb_set+50

se_ss_anne_horn_1: @ 86BC854
	.byte KEYSH, 0x00
	.byte TEMPO, 0x52
	.byte VOICE, 0x09
	.byte BENDR, 0x0C
	.byte LFOS, 0x2C
	.byte PAN, 0x40
	.byte VOL, 0x60
	.byte MOD, 0x01
	.byte N04
	.byte En2
	.byte v127
	.byte W04
	.byte N10
	.byte En2
	.byte v104
	.byte W20
	.byte W10
	.byte PAN, 0x00
	.byte TIE
	.byte En2
	.byte v127
	.byte W08
	.byte PAN, 0x10
	.byte W06
	.byte W02
	.byte Gs0
	.byte W08
	.byte Cn2
	.byte W08
	.byte En3
	.byte W06
	.byte Gs4
	.byte W06
	.byte Bn5
	.byte W06
	.byte En7
	.byte W06
	.byte Gn8
	.byte W06
	.byte W18
	.byte Ds7
	.byte W06
	.byte Gs6
	.byte W06
	.byte As5
	.byte W06
	.byte Dn4
	.byte W06
	.byte Fn2
	.byte W06
	.byte Ds1
	.byte W06
	.byte Fs0
	.byte W06
	.byte DnM1
	.byte W06
	.byte CnM2
	.byte W06
	.byte W18
	.byte VOL, 0x50
	.byte PAN, 0x0C
	.byte W06
	.byte VOL, 0x48
	.byte PAN, 0x17
	.byte W06
	.byte VOL, 0x40
	.byte PAN, 0x23
	.byte W06
	.byte VOL, 0x35
	.byte PAN, 0x2E
	.byte W06
	.byte VOL, 0x30
	.byte PAN, 0x4F
	.byte W06
	.byte VOL, 0x2A
	.byte PAN, 0x59
	.byte W06
	.byte VOL, 0x20
	.byte PAN, 0x68
	.byte W02
	.byte VOL, 0x18
	.byte W04
	.byte EnM1
	.byte PAN, 0x6F
	.byte W04
	.byte VOL, 0x08
	.byte W02
	.byte EOT
	.byte VOL, 0x00
	.byte W06
	.byte FINE

se_ss_anne_horn_2: @ 86BC8CB
	.byte KEYSH, 0x00
	.byte VOICE, 0x51
	.byte PAN, 0x40
	.byte MOD, 0x0F
	.byte VOL, 0x30
	.byte N04
	.byte En1
	.byte v127
	.byte W04
	.byte N10
	.byte En1
	.byte v104
	.byte W20
	.byte W10
	.byte TIE
	.byte En1
	.byte v127
	.byte W14
	.byte W24
	.byte W24
	.byte W24
	.byte W24
	.byte W24
	.byte W18
	.byte VOL, 0x2A
	.byte W06
	.byte Cn1
	.byte W06
	.byte Gs0
	.byte W06
	.byte Dn0
	.byte W06
	.byte BnM1
	.byte W06
	.byte DsM1
	.byte W06
	.byte CsM1
	.byte W06
	.byte GsM2
	.byte W06
	.byte EOT
	.byte VOL, 0x00
	.byte W06
	.byte FINE

@ ***************************************
	.align 2
se_ss_anne_horn: @ 86BC900
	.byte 2
	.byte 0
	.byte se_ss_anne_horn_pri
	.byte se_ss_anne_horn_rev
	.word se_ss_anne_horn_grp

	.word se_ss_anne_horn_1
	.word se_ss_anne_horn_2
