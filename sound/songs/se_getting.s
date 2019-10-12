	.include "MPlayDef.s"
	.section .rodata
	.global se_getting
	.align 2
	.equ se_getting_grp, voicegroup129
	.equ se_getting_pri, 5
	.equ se_getting_rev, reverb_set+50

se_getting_1: @ 86BC7F0
	.byte KEYSH, 0x00
	.byte TEMPO, 0x9B
	.byte VOICE, 0x03
	.byte XCMD, 0x08
	.byte GsM2
	.byte v009
	.byte GsM2
	.byte VOL, 0x64
	.byte BEND, 0x40
	.byte N02
	.byte Bn3
	.byte v120
	.byte W03
	.byte W03
	.byte W02
	.byte En4
	.byte v127
	.byte W01
	.byte W03
	.byte W03
	.byte W03
	.byte W03
	.byte FINE

se_getting_2: @ 86BC80D
	.byte KEYSH, 0x00
	.byte VOICE, 0x7E
	.byte VOL, 0x64
	.byte W03
	.byte W01
	.byte N01
	.byte Cn2
	.byte v120
	.byte W02
	.byte W03
	.byte W03
	.byte W03
	.byte W03
	.byte W03
	.byte FINE

@ ***************************************
	.align 2
se_getting: @ 86BC820
	.byte 2
	.byte 0
	.byte se_getting_pri
	.byte se_getting_rev
	.word se_getting_grp

	.word se_getting_1
	.word se_getting_2
