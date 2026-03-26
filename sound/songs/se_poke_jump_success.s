	.include "MPlayDef.s"
	.section .rodata
	.global se_poke_jump_success
	.align 2
	.equ se_poke_jump_success_grp, voicegroup128
	.equ se_poke_jump_success_pri, 5
	.equ se_poke_jump_success_rev, reverb_set+50

se_poke_jump_success_1: @ 86BCB1C
	.byte KEYSH, 0x00
	.byte TEMPO, 0x4B
	.byte VOICE, 0x2E
	.byte VOL, 0x6E
	.byte BENDR, 0x02
	.byte PAN, 0x40
	.byte BEND, 0x4F
	.byte W01
	.byte N02
	.byte Dn6
	.byte v112
	.byte W02
	.byte Cs6
	.byte W03
	.byte PAN, 0x48
	.byte N02
	.byte An5
	.byte W02
	.byte Fs5
	.byte W01
	.byte W01
	.byte Dn5
	.byte W02
	.byte PAN, 0x39
	.byte W01
	.byte N02
	.byte Dn5
	.byte v104
	.byte W02
	.byte Cs5
	.byte v100
	.byte W03
	.byte PAN, 0x40
	.byte N02
	.byte An4
	.byte v096
	.byte W02
	.byte Fs4
	.byte v092
	.byte W01
	.byte W01
	.byte Dn4
	.byte v088
	.byte W02
	.byte PAN, 0x4F
	.byte W01
	.byte N02
	.byte Dn6
	.byte W02
	.byte Cs6
	.byte v084
	.byte W03
	.byte An5
	.byte v080
	.byte W02
	.byte Fs5
	.byte v076
	.byte W01
	.byte W01
	.byte Dn5
	.byte v072
	.byte W02
	.byte PAN, 0x30
	.byte W01
	.byte N02
	.byte Dn6
	.byte v068
	.byte W02
	.byte Cs6
	.byte v064
	.byte W03
	.byte An5
	.byte v060
	.byte W02
	.byte Fs5
	.byte v056
	.byte W01
	.byte W01
	.byte Dn5
	.byte v052
	.byte W02
	.byte W03
	.byte FINE

se_poke_jump_success_2: @ 86BCB7B
	.byte KEYSH, 0x00
	.byte VOICE, 0x35
	.byte BENDR, 0x02
	.byte VOL, 0x2B
	.byte BEND, 0x4F
	.byte N02
	.byte An6
	.byte v112
	.byte W02
	.byte Fs6
	.byte W01
	.byte W01
	.byte Dn6
	.byte W02
	.byte W01
	.byte Cs6
	.byte W02
	.byte An5
	.byte W03
	.byte N02
	.byte W02
	.byte Fs5
	.byte v104
	.byte W01
	.byte W01
	.byte Dn5
	.byte v100
	.byte W02
	.byte W01
	.byte Cs5
	.byte v096
	.byte W02
	.byte An4
	.byte v092
	.byte W03
	.byte An6
	.byte v088
	.byte W02
	.byte Fs6
	.byte v084
	.byte W01
	.byte W01
	.byte Dn6
	.byte v080
	.byte W02
	.byte W01
	.byte Cs6
	.byte v076
	.byte W02
	.byte An5
	.byte v072
	.byte W03
	.byte An6
	.byte v068
	.byte W02
	.byte Fs6
	.byte v064
	.byte W01
	.byte W01
	.byte Dn6
	.byte v060
	.byte W02
	.byte W01
	.byte Cs6
	.byte v056
	.byte W02
	.byte An5
	.byte v052
	.byte W03
	.byte W03
	.byte FINE

@ ***************************************
	.align 2
se_poke_jump_success: @ 86BCBC8
	.byte 2
	.byte 0
	.byte se_poke_jump_success_pri
	.byte se_poke_jump_success_rev
	.word se_poke_jump_success_grp

	.word se_poke_jump_success_1
	.word se_poke_jump_success_2
