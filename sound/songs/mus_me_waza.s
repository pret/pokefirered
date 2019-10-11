	.include "MPlayDef.s"
	.section .rodata
	.global mus_me_waza
	.align 2
	.equ mus_me_waza_grp, voicegroup012
	.equ mus_me_waza_pri, 5
	.equ mus_me_waza_rev, reverb_set+50

mus_me_waza_1: @ 86BD37C
	.byte KEYSH, 0x00
	.byte W12
	.byte TEMPO, 0x46
	.byte VOICE, 0x49
	.byte PAN, 0x11
	.byte VOL, 0x5A
	.byte N06
	.byte Dn4
	.byte v096
	.byte W12
	.byte Gn3
	.byte W06
	.byte Bn3
	.byte W06
	.byte N30
	.byte Dn4
	.byte W12
	.byte MOD, 0x06
	.byte W18
	.byte CnM2
	.byte W06
	.byte N06
	.byte Cn4
	.byte W12
	.byte Dn4
	.byte W12
	.byte En4
	.byte W12
	.byte N48
	.byte Fs4
	.byte W18
	.byte MOD, 0x06
	.byte W06
	.byte W24
	.byte W24
	.byte FINE

mus_me_waza_2: @ 86BD3A7
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x49
	.byte PAN, 0x40
	.byte VOL, 0x5A
	.byte N06
	.byte Gn4
	.byte v116
	.byte W12
	.byte Dn4
	.byte W06
	.byte Gn4
	.byte W06
	.byte N30
	.byte Bn4
	.byte W12
	.byte MOD, 0x06
	.byte W18
	.byte CnM2
	.byte W06
	.byte N06
	.byte An4
	.byte W12
	.byte Bn4
	.byte W12
	.byte Cn5
	.byte W12
	.byte N48
	.byte Dn5
	.byte W18
	.byte MOD, 0x06
	.byte W06
	.byte W24
	.byte W24
	.byte FINE

mus_me_waza_3: @ 86BD3D0
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x3A
	.byte VOL, 0x5A
	.byte N12
	.byte Gn1
	.byte v120
	.byte W24
	.byte N12
	.byte W24
	.byte Fn1
	.byte W24
	.byte N12
	.byte W24
	.byte N48
	.byte Dn1
	.byte W24
	.byte W24
	.byte W24
	.byte FINE

mus_me_waza_4: @ 86BD3E7
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x52
	.byte XCMD, 0x08
	.byte GsM2
	.byte v009
	.byte GsM2
	.byte PAN, 0x40
	.byte VOL, 0x5A
	.byte N12
	.byte Dn3
	.byte v056
	.byte W24
	.byte N12
	.byte W12
	.byte N06
	.byte Gn2
	.byte v068
	.byte W06
	.byte Bn2
	.byte W06
	.byte N12
	.byte Fn3
	.byte v056
	.byte W24
	.byte N24
	.byte W03
	.byte VOL, 0x4F
	.byte W03
	.byte En4
	.byte W02
	.byte Gn4
	.byte W04
	.byte Gs4
	.byte W02
	.byte Bn4
	.byte W03
	.byte Dn5
	.byte W03
	.byte Fs5
	.byte W04
	.byte N06
	.byte An2
	.byte v048
	.byte W06
	.byte Dn3
	.byte W06
	.byte Fs3
	.byte W06
	.byte An3
	.byte W06
	.byte N08
	.byte Dn4
	.byte W08
	.byte Fs4
	.byte W08
	.byte An4
	.byte W08
	.byte N06
	.byte Dn5
	.byte W24
	.byte FINE

mus_me_waza_5: @ 86BD42B
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x53
	.byte XCMD, 0x08
	.byte GsM2
	.byte v009
	.byte GsM2
	.byte PAN, 0x70
	.byte VOL, 0x5A
	.byte N12
	.byte Bn2
	.byte v048
	.byte W24
	.byte N12
	.byte W12
	.byte N06
	.byte Dn2
	.byte v056
	.byte W06
	.byte Gn2
	.byte W06
	.byte N12
	.byte Cn3
	.byte v048
	.byte W24
	.byte N24
	.byte W03
	.byte VOL, 0x4F
	.byte W03
	.byte En4
	.byte W02
	.byte Gn4
	.byte W04
	.byte Gs4
	.byte W02
	.byte Bn4
	.byte W03
	.byte Dn5
	.byte W03
	.byte Fs5
	.byte W04
	.byte BEND, 0x3E
	.byte W02
	.byte N06
	.byte An2
	.byte v024
	.byte W06
	.byte Dn3
	.byte W06
	.byte Fs3
	.byte W06
	.byte An3
	.byte W04
	.byte W02
	.byte N08
	.byte Dn4
	.byte W08
	.byte Fs4
	.byte W08
	.byte An4
	.byte W06
	.byte W02
	.byte N06
	.byte Dn5
	.byte W22
	.byte FINE

mus_me_waza_6: @ 86BD474
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x57
	.byte VOL, 0x5A
	.byte PAN, 0x70
	.byte N12
	.byte Gn2
	.byte v048
	.byte W24
	.byte N12
	.byte W24
	.byte Fn2
	.byte W24
	.byte N12
	.byte W24
	.byte N36
	.byte Dn2
	.byte W24
	.byte W12
	.byte N12
	.byte Dn2
	.byte v024
	.byte W12
	.byte W24
	.byte FINE

mus_me_waza_7: @ 86BD491
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x00
	.byte VOL, 0x5A
	.byte N04
	.byte En1
	.byte v100
	.byte W12
	.byte N04
	.byte W04
	.byte En1
	.byte v068
	.byte W04
	.byte N04
	.byte W04
	.byte En1
	.byte v100
	.byte W12
	.byte N04
	.byte W04
	.byte En1
	.byte v072
	.byte W04
	.byte N04
	.byte W04
	.byte En1
	.byte v100
	.byte W12
	.byte N04
	.byte W04
	.byte En1
	.byte v072
	.byte W04
	.byte N04
	.byte W04
	.byte En1
	.byte v100
	.byte W08
	.byte N04
	.byte W08
	.byte N04
	.byte W08
	.byte N04
	.byte W04
	.byte En1
	.byte v040
	.byte W04
	.byte N04
	.byte W04
	.byte En1
	.byte v044
	.byte W04
	.byte N04
	.byte W04
	.byte N04
	.byte W04
	.byte En1
	.byte v072
	.byte W04
	.byte En1
	.byte v048
	.byte W04
	.byte En1
	.byte v056
	.byte W04
	.byte En1
	.byte v060
	.byte W04
	.byte En1
	.byte v064
	.byte W04
	.byte N05
	.byte En1
	.byte v068
	.byte W04
	.byte W02
	.byte En1
	.byte v104
	.byte W22
	.byte FINE

@ ***************************************
	.align 2
mus_me_waza: @ 86BD4E4
	.byte 7
	.byte 0
	.byte mus_me_waza_pri
	.byte mus_me_waza_rev
	.word mus_me_waza_grp

	.word mus_me_waza_1
	.word mus_me_waza_2
	.word mus_me_waza_3
	.word mus_me_waza_4
	.word mus_me_waza_5
	.word mus_me_waza_6
	.word mus_me_waza_7
