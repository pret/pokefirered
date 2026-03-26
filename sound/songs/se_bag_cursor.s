	.include "MPlayDef.s"
	.section .rodata
	.global se_bag_cursor
	.align 2
	.equ se_bag_cursor_grp, voicegroup129
	.equ se_bag_cursor_pri, 5
	.equ se_bag_cursor_rev, reverb_set+50

se_bag_cursor_1: @ 86BC774
	.byte KEYSH, 0x00
	.byte TEMPO, 0x9B
	.byte VOICE, 0x0A
	.byte XCMD, 0x08
	.byte GsM2
	.byte v009
	.byte GsM2
	.byte VOL, 0x7F
	.byte BEND, 0x42
	.byte N01
	.byte Cs4
	.byte v072
	.byte W03
	.byte W03
	.byte W03
	.byte FINE

se_bag_cursor_2: @ 86BC78A
	.byte VOL, 0x7F
	.byte KEYSH, 0x00
	.byte VOICE, 0x7C
	.byte N01
	.byte Cs5
	.byte v072
	.byte W01
	.byte Ds5
	.byte v104
	.byte W02
	.byte W03
	.byte W03
	.byte FINE

@ ***************************************
	.align 2
se_bag_cursor: @ 86BC79C
	.byte 2
	.byte 0
	.byte se_bag_cursor_pri
	.byte se_bag_cursor_rev
	.word se_bag_cursor_grp

	.word se_bag_cursor_1
	.word se_bag_cursor_2
