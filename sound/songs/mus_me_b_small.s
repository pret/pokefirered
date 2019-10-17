	.include "MPlayDef.s"
	.section .rodata
	.global mus_me_b_small
	.align 2
	.equ mus_me_b_small_grp, voicegroup008
	.equ mus_me_b_small_pri, 5
	.equ mus_me_b_small_rev, reverb_set+50

mus_me_b_small_1: @ 86C0004
	.byte KEYSH, 0x00
	.byte TEMPO, 0x48
	.byte W09
	.byte VOICE, 0x38
	.byte VOL, 0x64
	.byte PAN, 0x46
	.byte N03
	.byte Cs3
	.byte v084
	.byte W03
	.byte Fn3
	.byte W03
	.byte Fs3
	.byte W03
	.byte Gs3
	.byte W03
	.byte An3
	.byte W03
	.byte N06
	.byte As3
	.byte v112
	.byte W12
	.byte N03
	.byte W06
	.byte N03
	.byte W06
	.byte N06
	.byte Fs3
	.byte W12
	.byte N03
	.byte W06
	.byte N03
	.byte W06
	.byte N12
	.byte Cs4
	.byte W03
	.byte MOD, 0x06
	.byte W09
	.byte CnM2
	.byte N06
	.byte En4
	.byte W06
	.byte Fn4
	.byte W06
	.byte N12
	.byte Fs4
	.byte W24
	.byte W24
	.byte FINE

mus_me_b_small_2: @ 86C003B
	.byte KEYSH, 0x00
	.byte W24
	.byte VOICE, 0x3C
	.byte VOL, 0x64
	.byte PAN, 0x30
	.byte N24
	.byte Fs2
	.byte v080
	.byte W24
	.byte N06
	.byte W12
	.byte N06
	.byte W06
	.byte N06
	.byte W06
	.byte N12
	.byte Fs3
	.byte W12
	.byte Bn3
	.byte W12
	.byte As3
	.byte W24
	.byte W24
	.byte FINE

mus_me_b_small_3: @ 86C0057
	.byte KEYSH, 0x00
	.byte W24
	.byte VOICE, 0x2F
	.byte VOL, 0x64
	.byte PAN, 0x3C
	.byte W48
	.byte N03
	.byte Ds2
	.byte v120
	.byte W03
	.byte Ds2
	.byte v092
	.byte W03
	.byte Ds2
	.byte v096
	.byte W03
	.byte Ds2
	.byte v100
	.byte W03
	.byte N06
	.byte Ds2
	.byte v108
	.byte W06
	.byte Ds2
	.byte v116
	.byte W06
	.byte N24
	.byte Fs2
	.byte v120
	.byte W24
	.byte W24
	.byte FINE

mus_me_b_small_4: @ 86C007B
	.byte KEYSH, 0x00
	.byte XCMD, 0x08
	.byte AsM2
	.byte v009
	.byte GsM2
	.byte W24
	.byte VOICE, 0x5A
	.byte VOL, 0x64
	.byte PAN, 0x40
	.byte N03
	.byte Fs5
	.byte v040
	.byte W12
	.byte Cs5
	.byte W06
	.byte N03
	.byte W06
	.byte Fs5
	.byte W12
	.byte Cs5
	.byte W06
	.byte N03
	.byte W06
	.byte N03
	.byte W12
	.byte En5
	.byte W06
	.byte Fn5
	.byte W06
	.byte Fs5
	.byte W24
	.byte W24
	.byte FINE

mus_me_b_small_5: @ 86C00A1
	.byte KEYSH, 0x00
	.byte XCMD, 0x08
	.byte AsM2
	.byte v009
	.byte GsM2
	.byte BEND, 0x40
	.byte W24
	.byte VOICE, 0x53
	.byte VOL, 0x64
	.byte PAN, 0x70
	.byte N06
	.byte Fs3
	.byte v052
	.byte W12
	.byte N03
	.byte W06
	.byte N03
	.byte W06
	.byte N06
	.byte Cs3
	.byte W12
	.byte N03
	.byte W06
	.byte N03
	.byte W06
	.byte N12
	.byte Fs4
	.byte W03
	.byte MOD, 0x06
	.byte W09
	.byte CnM2
	.byte N06
	.byte Gs4
	.byte W06
	.byte An4
	.byte W06
	.byte N12
	.byte As4
	.byte W24
	.byte W24
	.byte FINE

mus_me_b_small_6: @ 86C00D1
	.byte KEYSH, 0x00
	.byte W24
	.byte VOICE, 0x58
	.byte VOL, 0x64
	.byte N12
	.byte Fs1
	.byte v080
	.byte W24
	.byte N12
	.byte W24
	.byte N12
	.byte W12
	.byte N06
	.byte En1
	.byte W06
	.byte Fn1
	.byte W06
	.byte N12
	.byte Fs1
	.byte W24
	.byte W24
	.byte FINE

mus_me_b_small_7: @ 86C00EA
	.byte KEYSH, 0x00
	.byte W24
	.byte VOICE, 0x00
	.byte VOL, 0x64
	.byte N06
	.byte En1
	.byte v100
	.byte N72
	.byte Bn2
	.byte v092
	.byte W24
	.byte N06
	.byte En1
	.byte v100
	.byte W12
	.byte N06
	.byte W06
	.byte N06
	.byte W06
	.byte N03
	.byte En1
	.byte v112
	.byte W03
	.byte En1
	.byte v080
	.byte W03
	.byte En1
	.byte v084
	.byte W03
	.byte En1
	.byte v092
	.byte W03
	.byte N06
	.byte En1
	.byte v096
	.byte W06
	.byte En1
	.byte v108
	.byte W06
	.byte N09
	.byte En1
	.byte v100
	.byte N24
	.byte Bn2
	.byte v092
	.byte W24
	.byte W24
	.byte FINE

@ ***************************************
	.align 2
mus_me_b_small: @ 86C0120
	.byte 7
	.byte 0
	.byte mus_me_b_small_pri
	.byte mus_me_b_small_rev
	.word mus_me_b_small_grp

	.word mus_me_b_small_1
	.word mus_me_b_small_2
	.word mus_me_b_small_3
	.word mus_me_b_small_4
	.word mus_me_b_small_5
	.word mus_me_b_small_6
	.word mus_me_b_small_7
