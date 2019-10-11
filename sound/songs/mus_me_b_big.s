	.include "MPlayDef.s"
	.section .rodata
	.global mus_me_b_big
	.align 2
	.equ mus_me_b_big_grp, voicegroup012
	.equ mus_me_b_big_pri, 5
	.equ mus_me_b_big_rev, reverb_set+50

mus_me_b_big_1: @ 86BFDD8
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x30
	.byte VOL, 0x64
	.byte PAN, 0x40
	.byte N08
	.byte Gn3
	.byte v040
	.byte W08
	.byte Bn3
	.byte v052
	.byte W08
	.byte Dn4
	.byte v060
	.byte W08
	.byte TEMPO, 0x48
	.byte VOICE, 0x38
	.byte N04
	.byte Gn3
	.byte v116
	.byte W08
	.byte Bn3
	.byte W08
	.byte Gn3
	.byte W08
	.byte N44
	.byte Dn4
	.byte W24
	.byte MOD, 0x06
	.byte W04
	.byte VOL, 0x62
	.byte W04
	.byte Fs5
	.byte W04
	.byte En4
	.byte W04
	.byte Gn2
	.byte W04
	.byte MOD, 0x00
	.byte W04
	.byte VOL, 0x64
	.byte N05
	.byte Bn3
	.byte W08
	.byte Dn4
	.byte W08
	.byte Gn4
	.byte W08
	.byte N04
	.byte En4
	.byte W08
	.byte Cn5
	.byte W08
	.byte Gn4
	.byte W08
	.byte N48
	.byte Bn4
	.byte W03
	.byte VOL, 0x5B
	.byte W03
	.byte En5
	.byte W03
	.byte Ds4
	.byte W06
	.byte Gs4
	.byte W01
	.byte MOD, 0x06
	.byte W05
	.byte VOL, 0x55
	.byte W06
	.byte Gn5
	.byte W06
	.byte Bn5
	.byte W06
	.byte En6
	.byte W09
	.byte MOD, 0x00
	.byte N12
	.byte W48
	.byte FINE

mus_me_b_big_2: @ 86BFE36
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x30
	.byte VOL, 0x64
	.byte PAN, 0x4A
	.byte W04
	.byte N08
	.byte An3
	.byte v044
	.byte W08
	.byte Cn4
	.byte v056
	.byte W08
	.byte N04
	.byte Fs4
	.byte v064
	.byte W04
	.byte N08
	.byte Gn4
	.byte v060
	.byte W08
	.byte Bn4
	.byte W08
	.byte Gn4
	.byte W08
	.byte W24
	.byte N08
	.byte W08
	.byte Bn4
	.byte W08
	.byte Gn4
	.byte W08
	.byte Dn4
	.byte W08
	.byte Gn4
	.byte W08
	.byte Bn4
	.byte W08
	.byte Cn5
	.byte W08
	.byte Gn5
	.byte W08
	.byte En5
	.byte W08
	.byte N48
	.byte Gn5
	.byte W03
	.byte VOL, 0x5B
	.byte W03
	.byte En5
	.byte W03
	.byte Ds4
	.byte W06
	.byte Gs4
	.byte W06
	.byte Cs5
	.byte W06
	.byte Gn5
	.byte W06
	.byte Bn5
	.byte W06
	.byte En6
	.byte W09
	.byte N12
	.byte W48
	.byte FINE

mus_me_b_big_3: @ 86BFE7D
	.byte KEYSH, 0x00
	.byte W12
	.byte W24
	.byte VOICE, 0x2F
	.byte VOL, 0x64
	.byte PAN, 0x40
	.byte N08
	.byte Gn2
	.byte v127
	.byte W08
	.byte N16
	.byte Bn1
	.byte W16
	.byte N24
	.byte Dn2
	.byte W40
	.byte N08
	.byte Gn2
	.byte W08
	.byte N24
	.byte Dn2
	.byte W24
	.byte N04
	.byte Cn2
	.byte W04
	.byte N04
	.byte W04
	.byte N08
	.byte W08
	.byte N08
	.byte W08
	.byte N04
	.byte Gn2
	.byte W04
	.byte Dn2
	.byte v092
	.byte W04
	.byte Dn2
	.byte v096
	.byte W04
	.byte N04
	.byte W04
	.byte Dn2
	.byte v100
	.byte W04
	.byte Dn2
	.byte v104
	.byte W04
	.byte Dn2
	.byte v108
	.byte W04
	.byte Dn2
	.byte v112
	.byte W04
	.byte Dn2
	.byte v116
	.byte W04
	.byte N04
	.byte W04
	.byte Dn2
	.byte v120
	.byte W04
	.byte Dn2
	.byte v124
	.byte W04
	.byte N24
	.byte Gn2
	.byte v127
	.byte W48
	.byte FINE

mus_me_b_big_4: @ 86BFEC7
	.byte KEYSH, 0x00
	.byte W12
	.byte XCMD, 0x08
	.byte AsM2
	.byte v009
	.byte GsM2
	.byte W24
	.byte VOICE, 0x52
	.byte VOL, 0x64
	.byte PAN, 0x10
	.byte N04
	.byte Dn3
	.byte v052
	.byte W08
	.byte Gn3
	.byte W08
	.byte Dn3
	.byte W08
	.byte N68
	.byte Bn3
	.byte W24
	.byte MOD, 0x06
	.byte W04
	.byte VOL, 0x60
	.byte W08
	.byte Cn5
	.byte W09
	.byte Bn3
	.byte W06
	.byte Cn3
	.byte W06
	.byte Cn2
	.byte W06
	.byte Fs0
	.byte W03
	.byte BnM2
	.byte W02
	.byte MOD, 0x00
	.byte W04
	.byte VOL, 0x64
	.byte N04
	.byte Gn3
	.byte W08
	.byte En4
	.byte W08
	.byte Cn4
	.byte W08
	.byte N48
	.byte Dn4
	.byte W16
	.byte MOD, 0x06
	.byte W32
	.byte CnM2
	.byte N12
	.byte W48
	.byte FINE

mus_me_b_big_5: @ 86BFF09
	.byte KEYSH, 0x00
	.byte W12
	.byte XCMD, 0x08
	.byte AsM2
	.byte W24
	.byte VOICE, 0x53
	.byte VOL, 0x64
	.byte PAN, 0x6F
	.byte BEND, 0x40
	.byte N04
	.byte Bn2
	.byte v052
	.byte W08
	.byte Dn3
	.byte W08
	.byte Bn2
	.byte W08
	.byte N68
	.byte Gn3
	.byte W24
	.byte MOD, 0x06
	.byte W04
	.byte VOL, 0x60
	.byte W08
	.byte Cn5
	.byte W09
	.byte Bn3
	.byte W06
	.byte Cn3
	.byte W06
	.byte Cn2
	.byte W06
	.byte Fs0
	.byte W03
	.byte BnM2
	.byte W02
	.byte MOD, 0x00
	.byte W04
	.byte VOL, 0x64
	.byte N04
	.byte En3
	.byte W08
	.byte Cn4
	.byte W08
	.byte Gn3
	.byte W08
	.byte N48
	.byte Bn3
	.byte W16
	.byte MOD, 0x06
	.byte W32
	.byte CnM2
	.byte N12
	.byte W48
	.byte FINE

mus_me_b_big_6: @ 86BFF4B
	.byte KEYSH, 0x00
	.byte W12
	.byte W24
	.byte VOICE, 0x58
	.byte VOL, 0x64
	.byte W24
	.byte N24
	.byte Gn1
	.byte v080
	.byte W32
	.byte N04
	.byte W08
	.byte N04
	.byte W08
	.byte N16
	.byte W16
	.byte Bn1
	.byte W16
	.byte Cn2
	.byte W16
	.byte Bn1
	.byte W16
	.byte An1
	.byte W16
	.byte N08
	.byte Gn1
	.byte W08
	.byte N04
	.byte Dn1
	.byte W04
	.byte Fs1
	.byte W04
	.byte N12
	.byte Gn1
	.byte W48
	.byte FINE

mus_me_b_big_7: @ 86BFF72
	.byte KEYSH, 0x00
	.byte W12
	.byte W24
	.byte VOICE, 0x00
	.byte VOL, 0x64
	.byte N04
	.byte En1
	.byte v112
	.byte W04
	.byte En1
	.byte v076
	.byte W04
	.byte N04
	.byte W04
	.byte En1
	.byte v080
	.byte W04
	.byte En1
	.byte v084
	.byte W04
	.byte En1
	.byte v088
	.byte W04
	.byte En1
	.byte v112
	.byte N72
	.byte Bn2
	.byte v092
	.byte W16
	.byte N04
	.byte En1
	.byte v112
	.byte W08
	.byte N04
	.byte W04
	.byte En1
	.byte v068
	.byte W04
	.byte En1
	.byte v088
	.byte W04
	.byte En1
	.byte v108
	.byte W04
	.byte En1
	.byte v112
	.byte W08
	.byte N04
	.byte W16
	.byte N04
	.byte W08
	.byte En1
	.byte v120
	.byte W16
	.byte En1
	.byte v092
	.byte W04
	.byte N04
	.byte W04
	.byte En1
	.byte v112
	.byte N48
	.byte Bn2
	.byte v092
	.byte W04
	.byte N04
	.byte En1
	.byte v076
	.byte W04
	.byte N04
	.byte W04
	.byte En1
	.byte v080
	.byte W04
	.byte En1
	.byte v084
	.byte W04
	.byte En1
	.byte v088
	.byte W04
	.byte En1
	.byte v092
	.byte W04
	.byte N04
	.byte W04
	.byte En1
	.byte v096
	.byte W04
	.byte En1
	.byte v100
	.byte W04
	.byte En1
	.byte v104
	.byte W04
	.byte En1
	.byte v108
	.byte W04
	.byte En1
	.byte v120
	.byte N24
	.byte Bn2
	.byte v092
	.byte W48
	.byte FINE

@ ***************************************
	.align 2
mus_me_b_big: @ 86BFFE0
	.byte 7
	.byte 0
	.byte mus_me_b_big_pri
	.byte mus_me_b_big_rev
	.word mus_me_b_big_grp

	.word mus_me_b_big_1
	.word mus_me_b_big_2
	.word mus_me_b_big_3
	.word mus_me_b_big_4
	.word mus_me_b_big_5
	.word mus_me_b_big_6
	.word mus_me_b_big_7
