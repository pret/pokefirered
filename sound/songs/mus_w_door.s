	.include "MPlayDef.s"
	.section .rodata
	.global mus_w_door
	.align 2
	.equ mus_w_door_grp, voicegroup129
	.equ mus_w_door_pri, 5
	.equ mus_w_door_rev, reverb_set+50

mus_w_door_1: @ 86BC628
	.byte KEYSH, 0x00
	.byte TEMPO, 0x37
	.byte VOICE, 0x7F
	.byte VOL, 0x64
	.byte N03
	.byte Fn2
	.byte v100
	.byte N03
	.byte As2
	.byte v127
	.byte W06
	.byte N08
	.byte Fs3
	.byte v096
	.byte W06
	.byte VOL, 0x58
	.byte W03
	.byte Fs2
	.byte W03
	.byte Gs3
	.byte W06
	.byte FINE

mus_w_door_2: @ 86BC643
	.byte KEYSH, 0x00
	.byte VOICE, 0x5C
	.byte BENDR, 0x0C
	.byte VOL, 0x2B
	.byte BEND, 0x40
	.byte W04
	.byte DnM1
	.byte N10
	.byte Bn5
	.byte v052
	.byte W02
	.byte BEND, 0x13
	.byte W01
	.byte Fn1
	.byte W01
	.byte Dn3
	.byte W01
	.byte Dn5
	.byte W01
	.byte Gs5
	.byte W01
	.byte An6
	.byte W01
	.byte VOL, 0x1D
	.byte BEND, 0x75
	.byte W01
	.byte En8
	.byte W02
	.byte VOL, 0x12
	.byte BEND, 0x7F
	.byte W09
	.byte FINE

@ ***************************************
	.align 2
mus_w_door: @ 86BC670
	.byte 2
	.byte 0
	.byte mus_w_door_pri
	.byte mus_w_door_rev
	.word mus_w_door_grp

	.word mus_w_door_1
	.word mus_w_door_2
