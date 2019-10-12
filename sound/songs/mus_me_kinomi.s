	.include "MPlayDef.s"
	.section .rodata
	.global mus_me_kinomi
	.align 2
	.equ mus_me_kinomi_grp, voicegroup012
	.equ mus_me_kinomi_pri, 5
	.equ mus_me_kinomi_rev, reverb_set+50

mus_me_kinomi_1: @ 86BD508
	.byte KEYSH, 0x00
	.byte W12
	.byte TEMPO, 0x46
	.byte VOICE, 0x0D
	.byte PAN, 0x36
	.byte VOL, 0x5A
	.byte N04
	.byte Fn4
	.byte v092
	.byte W04
	.byte Fn4
	.byte v080
	.byte W04
	.byte N04
	.byte W04
	.byte Cn4
	.byte v092
	.byte W04
	.byte Cn4
	.byte v080
	.byte W04
	.byte N04
	.byte W04
	.byte Cn5
	.byte v092
	.byte W08
	.byte Dn5
	.byte W08
	.byte Cn5
	.byte W08
	.byte Fn5
	.byte W04
	.byte Fn5
	.byte v080
	.byte W04
	.byte N04
	.byte W04
	.byte N04
	.byte W36
	.byte FINE

mus_me_kinomi_2: @ 86BD535
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x0D
	.byte PAN, 0x5F
	.byte VOL, 0x5A
	.byte W24
	.byte N04
	.byte Gn4
	.byte v092
	.byte W08
	.byte As4
	.byte W08
	.byte Gn4
	.byte W08
	.byte N16
	.byte An4
	.byte W48
	.byte FINE

mus_me_kinomi_3: @ 86BD54B
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x01
	.byte VOL, 0x5A
	.byte PAN, 0x20
	.byte N24
	.byte Fn3
	.byte v080
	.byte W24
	.byte N04
	.byte Gn3
	.byte W08
	.byte N04
	.byte W08
	.byte N04
	.byte W08
	.byte N16
	.byte Fn3
	.byte W48
	.byte FINE

mus_me_kinomi_4: @ 86BD563
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x01
	.byte VOL, 0x5A
	.byte PAN, 0x40
	.byte N24
	.byte An2
	.byte v080
	.byte W24
	.byte N04
	.byte As2
	.byte W08
	.byte N04
	.byte W08
	.byte N04
	.byte W08
	.byte N16
	.byte An2
	.byte W48
	.byte FINE

mus_me_kinomi_5: @ 86BD57B
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x64
	.byte VOL, 0x5A
	.byte PAN, 0x40
	.byte N04
	.byte Cn5
	.byte v060
	.byte W08
	.byte PAN, 0x0F
	.byte N04
	.byte Cn5
	.byte v020
	.byte W16
	.byte VOICE, 0x65
	.byte PAN, 0x3F
	.byte N04
	.byte As3
	.byte v060
	.byte W08
	.byte Gn3
	.byte W08
	.byte PAN, 0x72
	.byte N04
	.byte Gn3
	.byte v020
	.byte W08
	.byte VOICE, 0x64
	.byte PAN, 0x40
	.byte N04
	.byte An3
	.byte v060
	.byte W08
	.byte PAN, 0x10
	.byte N04
	.byte An3
	.byte v020
	.byte W16
	.byte VOICE, 0x65
	.byte PAN, 0x40
	.byte N04
	.byte An3
	.byte v060
	.byte W08
	.byte PAN, 0x72
	.byte N04
	.byte An3
	.byte v020
	.byte W16
	.byte FINE

@ ***************************************
	.align 2
mus_me_kinomi: @ 86BD5BC
	.byte 5
	.byte 0
	.byte mus_me_kinomi_pri
	.byte mus_me_kinomi_rev
	.word mus_me_kinomi_grp

	.word mus_me_kinomi_1
	.word mus_me_kinomi_2
	.word mus_me_kinomi_3
	.word mus_me_kinomi_4
	.word mus_me_kinomi_5
