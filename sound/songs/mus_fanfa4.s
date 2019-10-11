	.include "MPlayDef.s"
	.section .rodata
	.global mus_fanfa4
	.align 2
	.equ mus_fanfa4_grp, voicegroup012
	.equ mus_fanfa4_pri, 5
	.equ mus_fanfa4_rev, reverb_set+50

mus_fanfa4_1: @ 86BCDB4
	.byte KEYSH, 0x00
	.byte W12
	.byte TEMPO, 0x5F
	.byte VOICE, 0x2E
	.byte VOL, 0x5A
	.byte PAN, 0x28
	.byte N16
	.byte Gs4
	.byte v080
	.byte W08
	.byte MOD, 0x05
	.byte W08
	.byte CnM2
	.byte W08
	.byte N06
	.byte Ds4
	.byte W08
	.byte Gs4
	.byte W08
	.byte Ds4
	.byte W08
	.byte N08
	.byte As4
	.byte W16
	.byte N08
	.byte W16
	.byte N08
	.byte W16
	.byte N48
	.byte Gs4
	.byte W16
	.byte MOD, 0x05
	.byte W08
	.byte VOL, 0x52
	.byte W05
	.byte Cn4
	.byte W07
	.byte Fn1
	.byte W05
	.byte DnM1
	.byte W07
	.byte MOD, 0x00
	.byte W24
	.byte FINE

mus_fanfa4_2: @ 86BCDE9
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x2E
	.byte VOL, 0x5A
	.byte PAN, 0x40
	.byte N16
	.byte Cn5
	.byte v104
	.byte W08
	.byte MOD, 0x05
	.byte W08
	.byte CnM2
	.byte W08
	.byte N06
	.byte W08
	.byte N06
	.byte W08
	.byte N06
	.byte W08
	.byte N08
	.byte Cs5
	.byte W16
	.byte N08
	.byte W16
	.byte N08
	.byte W16
	.byte N48
	.byte Cn5
	.byte W16
	.byte MOD, 0x05
	.byte W08
	.byte VOL, 0x52
	.byte W05
	.byte Cn4
	.byte W07
	.byte Fn1
	.byte W05
	.byte DnM1
	.byte W07
	.byte MOD, 0x00
	.byte W24
	.byte FINE

mus_fanfa4_3: @ 86BCE1B
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x3A
	.byte VOL, 0x5A
	.byte N16
	.byte Gs1
	.byte v120
	.byte W24
	.byte N06
	.byte W08
	.byte N06
	.byte W08
	.byte N06
	.byte W08
	.byte N08
	.byte Fs1
	.byte W16
	.byte N08
	.byte W16
	.byte Gn1
	.byte W16
	.byte N48
	.byte Gs1
	.byte W24
	.byte VOL, 0x52
	.byte W05
	.byte Cn4
	.byte W07
	.byte Fn1
	.byte W05
	.byte DnM1
	.byte W07
	.byte W24
	.byte FINE

mus_fanfa4_4: @ 86BCE41
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x52
	.byte VOL, 0x5A
	.byte XCMD, 0x08
	.byte GsM2
	.byte v009
	.byte GsM2
	.byte PAN, 0x10
	.byte N16
	.byte Cn4
	.byte v036
	.byte W08
	.byte MOD, 0x05
	.byte W08
	.byte CnM2
	.byte W08
	.byte N06
	.byte Gs3
	.byte W08
	.byte Cn4
	.byte W08
	.byte Gs3
	.byte W08
	.byte N08
	.byte As3
	.byte W16
	.byte N08
	.byte W16
	.byte N08
	.byte W16
	.byte N48
	.byte Gs3
	.byte W16
	.byte MOD, 0x05
	.byte W08
	.byte VOL, 0x52
	.byte W05
	.byte Cn4
	.byte W07
	.byte Fn1
	.byte W05
	.byte DnM1
	.byte W07
	.byte MOD, 0x00
	.byte W24
	.byte FINE

mus_fanfa4_5: @ 86BCE79
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x53
	.byte VOL, 0x5A
	.byte XCMD, 0x08
	.byte GsM2
	.byte v009
	.byte GsM2
	.byte PAN, 0x70
	.byte N16
	.byte Gs3
	.byte v036
	.byte W08
	.byte MOD, 0x05
	.byte W08
	.byte CnM2
	.byte W08
	.byte N06
	.byte Ds3
	.byte W08
	.byte Gs3
	.byte W08
	.byte Ds3
	.byte W08
	.byte N08
	.byte Fs3
	.byte W16
	.byte N08
	.byte W16
	.byte N08
	.byte W16
	.byte N48
	.byte Ds3
	.byte W16
	.byte MOD, 0x05
	.byte W08
	.byte VOL, 0x52
	.byte W05
	.byte Cn4
	.byte W07
	.byte Fn1
	.byte W05
	.byte DnM1
	.byte W07
	.byte MOD, 0x00
	.byte W24
	.byte FINE

mus_fanfa4_6: @ 86BCEB1
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x2E
	.byte PAN, 0x58
	.byte VOL, 0x5A
	.byte N16
	.byte Ds4
	.byte v080
	.byte W08
	.byte MOD, 0x05
	.byte W08
	.byte CnM2
	.byte W08
	.byte N06
	.byte Cn4
	.byte W08
	.byte Ds4
	.byte W08
	.byte Cn4
	.byte W08
	.byte N08
	.byte Fs4
	.byte W16
	.byte N08
	.byte W16
	.byte N08
	.byte W16
	.byte N48
	.byte Ds4
	.byte W16
	.byte MOD, 0x05
	.byte W08
	.byte VOL, 0x52
	.byte W05
	.byte Cn4
	.byte W07
	.byte Fn1
	.byte W05
	.byte DnM1
	.byte W07
	.byte MOD, 0x00
	.byte W24
	.byte FINE

@ ***************************************
	.align 2
mus_fanfa4: @ 86BCEE4
	.byte 6
	.byte 0
	.byte mus_fanfa4_pri
	.byte mus_fanfa4_rev
	.word mus_fanfa4_grp

	.word mus_fanfa4_1
	.word mus_fanfa4_2
	.word mus_fanfa4_3
	.word mus_fanfa4_4
	.word mus_fanfa4_5
	.word mus_fanfa4_6
