	.include "MPlayDef.s"
	.section .rodata
	.global mus_me_shinka
	.align 2
	.equ mus_me_shinka_grp, voicegroup026
	.equ mus_me_shinka_pri, 1
	.equ mus_me_shinka_rev, reverb_set+50

mus_me_shinka_1: @ 86BD5D8
	.byte KEYSH, 0x00
	.byte TEMPO, 0x3C
	.byte VOICE, 0x2F
	.byte VOL, 0x50
	.byte PAN, 0x38
	.byte N24
	.byte Dn2
	.byte v127
	.byte W48
	.byte FINE

mus_me_shinka_2: @ 86BD5E7
	.byte KEYSH, 0x00
	.byte VOICE, 0x50
	.byte VOL, 0x50
	.byte XCMD, 0x08
	.byte GsM2
	.byte v009
	.byte GsM2
	.byte PAN, 0x40
	.byte N06
	.byte Gn4
	.byte v080
	.byte W06
	.byte Dn4
	.byte W06
	.byte Gn4
	.byte W06
	.byte Dn4
	.byte W30
	.byte FINE

mus_me_shinka_3: @ 86BD5FF
	.byte KEYSH, 0x00
	.byte VOICE, 0x52
	.byte XCMD, 0x08
	.byte GsM2
	.byte v009
	.byte GsM2
	.byte VOL, 0x50
	.byte BEND, 0x42
	.byte W06
	.byte N06
	.byte Gn4
	.byte v032
	.byte W06
	.byte Dn4
	.byte W06
	.byte Gn4
	.byte W06
	.byte Dn4
	.byte W24
	.byte FINE

mus_me_shinka_4: @ 86BD618
	.byte KEYSH, 0x00
	.byte VOICE, 0x00
	.byte VOL, 0x50
	.byte PAN, 0x57
	.byte N48
	.byte Bn2
	.byte v100
	.byte W48
	.byte FINE

@ ***************************************
	.align 2
mus_me_shinka: @ 86BD628
	.byte 4
	.byte 0
	.byte mus_me_shinka_pri
	.byte mus_me_shinka_rev
	.word mus_me_shinka_grp

	.word mus_me_shinka_1
	.word mus_me_shinka_2
	.word mus_me_shinka_3
	.word mus_me_shinka_4
