	.include "MPlayDef.s"
	.section .rodata
	.global mus_fanfa1
	.align 2
	.equ mus_fanfa1_grp, voicegroup012
	.equ mus_fanfa1_pri, 5
	.equ mus_fanfa1_rev, reverb_set+50

mus_fanfa1_1: @ 86BCCD0
	.byte KEYSH, 0x00
	.byte TEMPO, 0x57
	.byte VOICE, 0x2E
	.byte XCMD, 0x08
	.byte GsM2
	.byte v009
	.byte GsM2
	.byte VOL, 0x5A
	.byte PAN, 0x70
	.byte W08
	.byte N04
	.byte Bn3
	.byte v100
	.byte W08
	.byte N04
	.byte W08
	.byte N04
	.byte W08
	.byte N24
	.byte Gs4
	.byte W10
	.byte MOD, 0x05
	.byte W06
	.byte W24
	.byte FINE

mus_fanfa1_2: @ 86BCCF0
	.byte KEYSH, 0x00
	.byte VOICE, 0x2E
	.byte XCMD, 0x08
	.byte GsM2
	.byte v009
	.byte GsM2
	.byte VOL, 0x5A
	.byte W08
	.byte PAN, 0x30
	.byte N04
	.byte En4
	.byte v100
	.byte W08
	.byte PAN, 0x50
	.byte N04
	.byte W08
	.byte PAN, 0x30
	.byte N04
	.byte W08
	.byte PAN, 0x40
	.byte N24
	.byte Bn4
	.byte W10
	.byte MOD, 0x05
	.byte W06
	.byte W24
	.byte FINE

mus_fanfa1_3: @ 86BCD14
	.byte KEYSH, 0x00
	.byte VOICE, 0x2E
	.byte XCMD, 0x08
	.byte GsM2
	.byte v009
	.byte GsM2
	.byte VOL, 0x5A
	.byte PAN, 0x10
	.byte W08
	.byte N04
	.byte Gs3
	.byte v068
	.byte W08
	.byte N04
	.byte W08
	.byte N04
	.byte W08
	.byte N24
	.byte En4
	.byte W10
	.byte MOD, 0x05
	.byte W06
	.byte W24
	.byte FINE

mus_fanfa1_4: @ 86BCD32
	.byte KEYSH, 0x00
	.byte VOICE, 0x54
	.byte XCMD, 0x08
	.byte GsM2
	.byte v009
	.byte GsM2
	.byte VOL, 0x5A
	.byte W08
	.byte N04
	.byte Bn3
	.byte v048
	.byte W04
	.byte Bn3
	.byte v020
	.byte W04
	.byte Bn3
	.byte v048
	.byte W04
	.byte Bn3
	.byte v020
	.byte W04
	.byte Bn3
	.byte v048
	.byte W04
	.byte Bn3
	.byte v020
	.byte W04
	.byte N24
	.byte Gs4
	.byte v048
	.byte W10
	.byte MOD, 0x05
	.byte W03
	.byte VOL, 0x47
	.byte W03
	.byte Cn2
	.byte W03
	.byte Cs0
	.byte W03
	.byte AsM2
	.byte W03
	.byte CnM2
	.byte W15
	.byte FINE

mus_fanfa1_5: @ 86BCD64
	.byte KEYSH, 0x00
	.byte VOICE, 0x55
	.byte XCMD, 0x08
	.byte GsM2
	.byte v009
	.byte GsM2
	.byte VOL, 0x5A
	.byte W08
	.byte N04
	.byte En4
	.byte v048
	.byte W04
	.byte En4
	.byte v020
	.byte W04
	.byte En4
	.byte v048
	.byte W04
	.byte En4
	.byte v020
	.byte W04
	.byte En4
	.byte v048
	.byte W04
	.byte En4
	.byte v020
	.byte W04
	.byte N24
	.byte Bn4
	.byte v048
	.byte W10
	.byte MOD, 0x05
	.byte W03
	.byte VOL, 0x47
	.byte W03
	.byte Cn2
	.byte W03
	.byte Cs0
	.byte W03
	.byte AsM2
	.byte W03
	.byte CnM2
	.byte W15
	.byte FINE

@ ***************************************
	.align 2
mus_fanfa1: @ 86BCD98
	.byte 5
	.byte 0
	.byte mus_fanfa1_pri
	.byte mus_fanfa1_rev
	.word mus_fanfa1_grp

	.word mus_fanfa1_1
	.word mus_fanfa1_2
	.word mus_fanfa1_3
	.word mus_fanfa1_4
	.word mus_fanfa1_5
