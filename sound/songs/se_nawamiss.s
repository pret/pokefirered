	.include "MPlayDef.s"
	.section .rodata
	.global se_nawamiss
	.align 2
	.equ se_nawamiss_grp, voicegroup127
	.equ se_nawamiss_pri, 5
	.equ se_nawamiss_rev, reverb_set+50

se_nawamiss_1: @ 86BCBD8
	.byte KEYSH, 0x00
	.byte TEMPO, 0x78
	.byte VOICE, 0x5C
	.byte BENDR, 0x0C
	.byte VOL, 0x78
	.byte BEND, 0x40
	.byte N03
	.byte Cn2
	.byte v127
	.byte W03
	.byte Cn2
	.byte v020
	.byte W03
	.byte N18
	.byte Cn2
	.byte v127
	.byte W03
	.byte W03
	.byte W03
	.byte W03
	.byte W03
	.byte W03
	.byte N09
	.byte Cn2
	.byte v020
	.byte W03
	.byte W03
	.byte W03
	.byte FINE

@ ***************************************
	.align 2
se_nawamiss: @ 86BCBFC
	.byte 1
	.byte 0
	.byte se_nawamiss_pri
	.byte se_nawamiss_rev
	.word se_nawamiss_grp

	.word se_nawamiss_1
