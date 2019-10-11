	.include "MPlayDef.s"
	.section .rodata
	.global mus_me_bachi
	.align 2
	.equ mus_me_bachi_grp, voicegroup012
	.equ mus_me_bachi_pri, 5
	.equ mus_me_bachi_rev, reverb_set+50

mus_me_bachi_1: @ 86BD0A4
	.byte KEYSH, 0x00
	.byte W12
	.byte TEMPO, 0x48
	.byte VOICE, 0x52
	.byte XCMD, 0x08
	.byte AsM2
	.byte v009
	.byte GsM2
	.byte VOL, 0x5A
	.byte PAN, 0x6F
	.byte N09
	.byte Fn4
	.byte v060
	.byte W18
	.byte N03
	.byte Dn4
	.byte W06
	.byte N24
	.byte W09
	.byte MOD, 0x06
	.byte W15
	.byte VOICE, 0x50
	.byte MOD, 0x00
	.byte PAN, 0x40
	.byte N06
	.byte Fn3
	.byte v072
	.byte W06
	.byte As2
	.byte v060
	.byte W06
	.byte Dn3
	.byte W06
	.byte Fn3
	.byte W06
	.byte Dn3
	.byte v072
	.byte W06
	.byte Fn3
	.byte v060
	.byte W06
	.byte As3
	.byte W06
	.byte Dn4
	.byte W06
	.byte VOICE, 0x52
	.byte PAN, 0x6F
	.byte N09
	.byte Gn4
	.byte v056
	.byte W18
	.byte N03
	.byte En4
	.byte v060
	.byte W06
	.byte N24
	.byte W12
	.byte MOD, 0x06
	.byte W12
	.byte VOICE, 0x50
	.byte MOD, 0x00
	.byte PAN, 0x40
	.byte N06
	.byte Gn3
	.byte v072
	.byte W06
	.byte Cn3
	.byte v060
	.byte W06
	.byte En3
	.byte W06
	.byte Gn3
	.byte W06
	.byte En3
	.byte v072
	.byte W06
	.byte Gn3
	.byte v060
	.byte W06
	.byte Cn4
	.byte W06
	.byte En4
	.byte W06
	.byte VOICE, 0x52
	.byte PAN, 0x11
	.byte N48
	.byte An4
	.byte W05
	.byte VOL, 0x4C
	.byte W04
	.byte Fn3
	.byte W05
	.byte Gs3
	.byte W01
	.byte MOD, 0x06
	.byte W04
	.byte VOL, 0x47
	.byte W05
	.byte Ds4
	.byte W05
	.byte Fn4
	.byte W04
	.byte MOD, 0x08
	.byte W01
	.byte VOL, 0x50
	.byte W05
	.byte Cn5
	.byte W05
	.byte Ds5
	.byte W04
	.byte Fs5
	.byte MOD, 0x00
	.byte N09
	.byte W48
	.byte FINE

mus_me_bachi_2: @ 86BD12F
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x38
	.byte VOL, 0x5A
	.byte PAN, 0x4B
	.byte N09
	.byte As4
	.byte v116
	.byte W18
	.byte N03
	.byte Fn4
	.byte W06
	.byte N44
	.byte W09
	.byte MOD, 0x06
	.byte W15
	.byte VOL, 0x4E
	.byte W05
	.byte Ds3
	.byte W05
	.byte Dn1
	.byte W05
	.byte DnM1
	.byte W03
	.byte CnM2
	.byte W03
	.byte Fs5
	.byte MOD, 0x00
	.byte N03
	.byte An4
	.byte v100
	.byte W03
	.byte N06
	.byte As4
	.byte v116
	.byte W12
	.byte Bn4
	.byte W12
	.byte N09
	.byte Cn5
	.byte W18
	.byte N03
	.byte Gn4
	.byte W06
	.byte N44
	.byte W12
	.byte MOD, 0x06
	.byte W12
	.byte VOL, 0x4E
	.byte W05
	.byte Ds3
	.byte W05
	.byte Dn1
	.byte W05
	.byte DnM1
	.byte W03
	.byte CnM2
	.byte W03
	.byte Fs5
	.byte MOD, 0x00
	.byte N03
	.byte Bn4
	.byte v100
	.byte W03
	.byte N24
	.byte Cn5
	.byte v116
	.byte W15
	.byte MOD, 0x06
	.byte W09
	.byte CnM2
	.byte N48
	.byte Dn5
	.byte W05
	.byte VOL, 0x4C
	.byte W04
	.byte Fn3
	.byte W05
	.byte Gs3
	.byte W01
	.byte MOD, 0x06
	.byte W04
	.byte VOL, 0x47
	.byte W05
	.byte Ds4
	.byte W05
	.byte Fn4
	.byte W04
	.byte MOD, 0x08
	.byte W01
	.byte VOL, 0x50
	.byte W05
	.byte Cn5
	.byte W05
	.byte Ds5
	.byte W04
	.byte Fs5
	.byte MOD, 0x00
	.byte N09
	.byte W48
	.byte FINE

mus_me_bachi_3: @ 86BD1A5
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x58
	.byte VOL, 0x5A
	.byte N09
	.byte As1
	.byte v080
	.byte W18
	.byte N03
	.byte W06
	.byte N24
	.byte W24
	.byte N18
	.byte Dn2
	.byte W18
	.byte Cn2
	.byte W18
	.byte N12
	.byte As1
	.byte W12
	.byte N09
	.byte Cn2
	.byte W18
	.byte N03
	.byte W06
	.byte N24
	.byte W24
	.byte N18
	.byte En2
	.byte W18
	.byte Dn2
	.byte W18
	.byte N12
	.byte Cn2
	.byte W12
	.byte N06
	.byte Dn2
	.byte W12
	.byte An1
	.byte W12
	.byte Dn2
	.byte W12
	.byte An1
	.byte W12
	.byte N09
	.byte Dn2
	.byte W48
	.byte FINE

mus_me_bachi_4: @ 86BD1D8
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x2F
	.byte VOL, 0x5A
	.byte PAN, 0x33
	.byte N06
	.byte As1
	.byte v127
	.byte W36
	.byte As1
	.byte v100
	.byte W06
	.byte Fn1
	.byte W06
	.byte As1
	.byte v127
	.byte W12
	.byte Fn1
	.byte W12
	.byte As1
	.byte W12
	.byte Fn1
	.byte W12
	.byte Cn2
	.byte W36
	.byte Cn2
	.byte v100
	.byte W06
	.byte Gn1
	.byte W06
	.byte Cn2
	.byte v127
	.byte W12
	.byte Gn1
	.byte W12
	.byte Cn2
	.byte W12
	.byte Gn1
	.byte W06
	.byte Cn2
	.byte W06
	.byte Dn2
	.byte W12
	.byte An1
	.byte W12
	.byte Dn2
	.byte W12
	.byte An1
	.byte W12
	.byte Dn2
	.byte W48
	.byte FINE

mus_me_bachi_5: @ 86BD210
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x53
	.byte XCMD, 0x08
	.byte AsM2
	.byte v009
	.byte GsM2
	.byte VOL, 0x5A
	.byte PAN, 0x10
	.byte BEND, 0x40
	.byte N09
	.byte Dn4
	.byte v060
	.byte W18
	.byte N03
	.byte As3
	.byte W06
	.byte N24
	.byte W09
	.byte MOD, 0x06
	.byte W15
	.byte CnM2
	.byte W06
	.byte VOICE, 0x51
	.byte PAN, 0x70
	.byte BEND, 0x3E
	.byte N06
	.byte Fn3
	.byte v052
	.byte W06
	.byte PAN, 0x10
	.byte N06
	.byte As2
	.byte W06
	.byte PAN, 0x70
	.byte N06
	.byte Dn3
	.byte W06
	.byte PAN, 0x10
	.byte N06
	.byte Fn3
	.byte W06
	.byte PAN, 0x70
	.byte N06
	.byte Dn3
	.byte W06
	.byte PAN, 0x10
	.byte N06
	.byte Fn3
	.byte W06
	.byte PAN, 0x70
	.byte N06
	.byte As3
	.byte W06
	.byte VOICE, 0x53
	.byte PAN, 0x10
	.byte BEND, 0x40
	.byte N09
	.byte En4
	.byte v060
	.byte W18
	.byte N03
	.byte Cn4
	.byte W06
	.byte N24
	.byte W12
	.byte MOD, 0x06
	.byte W12
	.byte CnM2
	.byte W06
	.byte VOICE, 0x51
	.byte PAN, 0x70
	.byte BEND, 0x3E
	.byte N06
	.byte Gn3
	.byte v052
	.byte W06
	.byte PAN, 0x10
	.byte N06
	.byte Cn3
	.byte W06
	.byte PAN, 0x70
	.byte N06
	.byte En3
	.byte W06
	.byte PAN, 0x10
	.byte N06
	.byte Gn3
	.byte W06
	.byte PAN, 0x70
	.byte N06
	.byte En3
	.byte W06
	.byte PAN, 0x10
	.byte N06
	.byte Gn3
	.byte W06
	.byte PAN, 0x70
	.byte N06
	.byte Cn4
	.byte W06
	.byte VOICE, 0x53
	.byte BEND, 0x40
	.byte N48
	.byte Fs4
	.byte v060
	.byte W05
	.byte VOL, 0x4C
	.byte W04
	.byte Fn3
	.byte W05
	.byte Gs3
	.byte W01
	.byte MOD, 0x06
	.byte W04
	.byte VOL, 0x47
	.byte W05
	.byte Ds4
	.byte W05
	.byte Fn4
	.byte W04
	.byte MOD, 0x08
	.byte W01
	.byte VOL, 0x50
	.byte W05
	.byte Cn5
	.byte W05
	.byte Ds5
	.byte W04
	.byte Fs5
	.byte MOD, 0x00
	.byte N09
	.byte W48
	.byte FINE

mus_me_bachi_6: @ 86BD2BB
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x38
	.byte VOL, 0x5A
	.byte PAN, 0x40
	.byte W68
	.byte W01
	.byte N03
	.byte En4
	.byte v080
	.byte W03
	.byte N06
	.byte Fn4
	.byte v100
	.byte W12
	.byte Gn4
	.byte W12
	.byte W68
	.byte W01
	.byte N03
	.byte Fs4
	.byte v080
	.byte W03
	.byte N24
	.byte Gn4
	.byte v100
	.byte W24
	.byte W96
	.byte FINE

mus_me_bachi_7: @ 86BD2DC
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x00
	.byte VOL, 0x5A
	.byte N06
	.byte En1
	.byte v096
	.byte N24
	.byte Bn2
	.byte v100
	.byte W18
	.byte N06
	.byte En1
	.byte v096
	.byte W06
	.byte En1
	.byte v120
	.byte W12
	.byte N03
	.byte En1
	.byte v100
	.byte W03
	.byte N03
	.byte W03
	.byte N06
	.byte W06
	.byte N12
	.byte W12
	.byte N12
	.byte W12
	.byte N03
	.byte En1
	.byte v084
	.byte W03
	.byte En1
	.byte v080
	.byte W03
	.byte N03
	.byte W03
	.byte N03
	.byte W03
	.byte N03
	.byte W03
	.byte N03
	.byte W03
	.byte N03
	.byte W03
	.byte N03
	.byte W03
	.byte N06
	.byte En1
	.byte v096
	.byte N24
	.byte Bn2
	.byte v100
	.byte W18
	.byte N06
	.byte En1
	.byte v096
	.byte W06
	.byte En1
	.byte v120
	.byte W12
	.byte N03
	.byte En1
	.byte v100
	.byte W03
	.byte N03
	.byte W03
	.byte N06
	.byte W06
	.byte N12
	.byte W12
	.byte N12
	.byte W12
	.byte N03
	.byte En1
	.byte v084
	.byte W03
	.byte En1
	.byte v080
	.byte W03
	.byte N03
	.byte W03
	.byte N03
	.byte W03
	.byte N03
	.byte W03
	.byte N03
	.byte W03
	.byte N03
	.byte W03
	.byte N03
	.byte W03
	.byte N06
	.byte En1
	.byte v096
	.byte N24
	.byte Bn2
	.byte v100
	.byte W18
	.byte N06
	.byte En1
	.byte v096
	.byte W06
	.byte N06
	.byte W12
	.byte N06
	.byte W06
	.byte N06
	.byte W06
	.byte En1
	.byte v120
	.byte N24
	.byte Bn2
	.byte v100
	.byte W48
	.byte FINE

@ ***************************************
	.align 2
mus_me_bachi: @ 86BD358
	.byte 7
	.byte 0
	.byte mus_me_bachi_pri
	.byte mus_me_bachi_rev
	.word mus_me_bachi_grp

	.word mus_me_bachi_1
	.word mus_me_bachi_2
	.word mus_me_bachi_3
	.word mus_me_bachi_4
	.word mus_me_bachi_5
	.word mus_me_bachi_6
	.word mus_me_bachi_7
