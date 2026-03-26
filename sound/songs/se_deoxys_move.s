	.include "MPlayDef.s"
	.section .rodata
	.global se_deoxys_move
	.align 2
	.equ se_deoxys_move_grp, voicegroup129
	.equ se_deoxys_move_pri, 5
	.equ se_deoxys_move_rev, reverb_set+50

se_deoxys_move_1: @ 86BCA34
	.byte KEYSH, 0x00
	.byte TEMPO, 0x83
	.byte VOICE, 0x7B
	.byte XCMD, 0x08
	.byte GsM2
	.byte v009
	.byte GsM2
	.byte PAN, 0x40
	.byte VOL, 0x28
	.byte BEND, 0x42
	.byte N02
	.byte Cn2
	.byte v120
	.byte W08
	.byte N04
	.byte Cn5
	.byte W16
	.byte W24
	.byte W24
	.byte W24
	.byte W24
	.byte W24
	.byte W24
	.byte W24
	.byte FINE

se_deoxys_move_2: @ 86BCA54
	.byte KEYSH, 0x00
	.byte VOICE, 0x1F
	.byte LFOS, 0x2C
	.byte BENDR, 0x0C
	.byte VOL, 0x50
	.byte PAN, 0x40
	.byte BEND, 0x00
	.byte TIE
	.byte En4
	.byte v032
	.byte W24
	.byte W04
	.byte BEND, 0x09
	.byte W02
	.byte DnM1
	.byte W02
	.byte Cs0
	.byte W02
	.byte Gs0
	.byte W02
	.byte Fn1
	.byte W02
	.byte As1
	.byte W02
	.byte Gn2
	.byte W02
	.byte Dn3
	.byte W02
	.byte Gs4
	.byte W02
	.byte Ds5
	.byte W02
	.byte Cn6
	.byte W02
	.byte Gn6
	.byte W02
	.byte En7
	.byte W02
	.byte Cn8
	.byte W02
	.byte Gn8
	.byte W16
	.byte W24
	.byte W24
	.byte VOL, 0x46
	.byte W04
	.byte Fs3
	.byte W06
	.byte Cn3
	.byte W06
	.byte Gn2
	.byte W08
	.byte Cs2
	.byte W06
	.byte Gs1
	.byte W06
	.byte En1
	.byte W06
	.byte Bn0
	.byte W06
	.byte Fs0
	.byte W04
	.byte Cn0
	.byte W02
	.byte GsM1
	.byte W02
	.byte DsM1
	.byte W04
	.byte AsM2
	.byte W06
	.byte CnM2
	.byte W06
	.byte EOT
	.byte FINE

se_deoxys_move_3: @ 86BCAA7
	.byte KEYSH, 0x00
	.byte VOICE, 0x32
	.byte VOL, 0x45
	.byte PAN, 0x00
	.byte W24
	.byte Gn8
	.byte N01
	.byte Fs4
	.byte v064
	.byte W06
	.byte Gs4
	.byte W03
	.byte PAN, 0x00
	.byte W07
	.byte N01
	.byte En5
	.byte W05
	.byte Fs5
	.byte W03
	.byte PAN, 0x7F
	.byte W10
	.byte N01
	.byte Dn5
	.byte W03
	.byte Cn5
	.byte W07
	.byte PAN, 0x00
	.byte W04
	.byte N01
	.byte Fs3
	.byte W03
	.byte Gs3
	.byte W09
	.byte PAN, 0x7F
	.byte W04
	.byte N01
	.byte Bn4
	.byte W04
	.byte Dn5
	.byte W04
	.byte PAN, 0x00
	.byte W09
	.byte N01
	.byte Fs5
	.byte W09
	.byte Cs5
	.byte W06
	.byte PAN, 0x7F
	.byte W02
	.byte N01
	.byte Cs4
	.byte v036
	.byte W02
	.byte As3
	.byte W08
	.byte Fs3
	.byte W03
	.byte Gs3
	.byte W09
	.byte PAN, 0x00
	.byte W03
	.byte N01
	.byte Dn5
	.byte v028
	.byte W03
	.byte Cn5
	.byte W06
	.byte Fs4
	.byte W03
	.byte Cn4
	.byte W04
	.byte Gn3
	.byte W05
	.byte PAN, 0x7F
	.byte W06
	.byte N01
	.byte Gn4
	.byte v020
	.byte W02
	.byte An4
	.byte W16
	.byte FINE

@ ***************************************
	.align 2
se_deoxys_move: @ 86BCB08
	.byte 3
	.byte 0
	.byte se_deoxys_move_pri
	.byte se_deoxys_move_rev
	.word se_deoxys_move_grp

	.word se_deoxys_move_1
	.word se_deoxys_move_2
	.word se_deoxys_move_3
