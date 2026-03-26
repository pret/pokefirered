	.include "MPlayDef.s"
	.section .rodata
	.global se_bag_pocket
	.align 2
	.equ se_bag_pocket_grp, voicegroup129
	.equ se_bag_pocket_pri, 5
	.equ se_bag_pocket_rev, reverb_set+50

se_bag_pocket_1: @ 86BC7AC
	.byte KEYSH, 0x00
	.byte TEMPO, 0xD3
	.byte VOICE, 0x50
	.byte VOL, 0x40
	.byte BEND, 0x40
	.byte N02
	.byte Dn4
	.byte v084
	.byte W02
	.byte BEND, 0x51
	.byte N03
	.byte Fs4
	.byte v080
	.byte W01
	.byte BEND, 0x18
	.byte W03
	.byte FINE

se_bag_pocket_2: @ 86BC7C4
	.byte KEYSH, 0x00
	.byte VOICE, 0x02
	.byte XCMD, 0x08
	.byte GsM2
	.byte v009
	.byte GsM2
	.byte VOL, 0x7F
	.byte PAN, 0x40
	.byte BEND, 0x40
	.byte N04
	.byte En3
	.byte v127
	.byte W03
	.byte W01
	.byte VOICE, 0x02
	.byte N02
	.byte Bn3
	.byte W02
	.byte FINE

@ ***************************************
	.align 2
se_bag_pocket: @ 86BC7E0
	.byte 2
	.byte 0
	.byte se_bag_pocket_pri
	.byte se_bag_pocket_rev
	.word se_bag_pocket_grp

	.word se_bag_pocket_1
	.word se_bag_pocket_2
