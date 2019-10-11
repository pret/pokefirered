	.include "MPlayDef.s"
	.section .rodata
	.global mus_fanfa5
	.align 2
	.equ mus_fanfa5_grp, voicegroup012
	.equ mus_fanfa5_pri, 5
	.equ mus_fanfa5_rev, reverb_set+50

mus_fanfa5_1: @ 86BCF04
	.byte KEYSH, 0x00
	.byte W12
	.byte TEMPO, 0x4B
	.byte VOICE, 0x38
	.byte PAN, 0x52
	.byte VOL, 0x5A
	.byte N22
	.byte Ds4
	.byte v092
	.byte W16
	.byte VOL, 0x44
	.byte W04
	.byte Cn1
	.byte W04
	.byte Fs5
	.byte N22
	.byte Cn4
	.byte W16
	.byte VOL, 0x44
	.byte W04
	.byte Cn1
	.byte W04
	.byte Fs5
	.byte N16
	.byte Gs3
	.byte W16
	.byte N06
	.byte Ds3
	.byte W08
	.byte Cn3
	.byte W08
	.byte Gs3
	.byte W08
	.byte Cn4
	.byte W08
	.byte N04
	.byte Fs4
	.byte W08
	.byte N04
	.byte W08
	.byte N04
	.byte W08
	.byte N04
	.byte W08
	.byte N04
	.byte W08
	.byte As4
	.byte W08
	.byte N48
	.byte Gs4
	.byte W16
	.byte MOD, 0x06
	.byte W32
	.byte CnM2
	.byte W24
	.byte FINE

mus_fanfa5_2: @ 86BCF44
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x38
	.byte PAN, 0x30
	.byte VOL, 0x5A
	.byte N22
	.byte Cn5
	.byte v100
	.byte W16
	.byte VOL, 0x44
	.byte W04
	.byte Cn1
	.byte W04
	.byte Fs5
	.byte N22
	.byte Gs4
	.byte W16
	.byte VOL, 0x44
	.byte W04
	.byte Cn1
	.byte W04
	.byte Fs5
	.byte N40
	.byte Ds4
	.byte W12
	.byte MOD, 0x06
	.byte W28
	.byte VOL, 0x44
	.byte MOD, 0x00
	.byte W04
	.byte VOL, 0x24
	.byte W04
	.byte Fs5
	.byte N04
	.byte Cs5
	.byte W08
	.byte N04
	.byte W08
	.byte N04
	.byte W08
	.byte As4
	.byte W08
	.byte N04
	.byte W08
	.byte Cs5
	.byte W08
	.byte N48
	.byte Cn5
	.byte W16
	.byte MOD, 0x06
	.byte W32
	.byte CnM2
	.byte W24
	.byte FINE

mus_fanfa5_3: @ 86BCF85
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x58
	.byte VOL, 0x5A
	.byte N12
	.byte Ds1
	.byte v080
	.byte W24
	.byte N12
	.byte W24
	.byte N12
	.byte W24
	.byte N08
	.byte Cn1
	.byte W08
	.byte Ds1
	.byte W08
	.byte Gs1
	.byte W08
	.byte N24
	.byte As1
	.byte W24
	.byte Cs2
	.byte W24
	.byte N40
	.byte Cn2
	.byte W48
	.byte W24
	.byte FINE

mus_fanfa5_4: @ 86BCFA5
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x52
	.byte PAN, 0x10
	.byte VOL, 0x5A
	.byte N08
	.byte Gs4
	.byte v040
	.byte W08
	.byte Ds4
	.byte W08
	.byte Cn4
	.byte W08
	.byte VOL, 0x5A
	.byte N08
	.byte Gs4
	.byte W08
	.byte Ds4
	.byte W08
	.byte Cn4
	.byte W08
	.byte Ds4
	.byte W08
	.byte Cn4
	.byte W08
	.byte Gs3
	.byte W08
	.byte Cn4
	.byte W08
	.byte Gs3
	.byte W08
	.byte Ds3
	.byte W08
	.byte Cs3
	.byte W08
	.byte As2
	.byte W08
	.byte Fs2
	.byte W08
	.byte Cs2
	.byte W08
	.byte As2
	.byte W08
	.byte Cs3
	.byte W08
	.byte N48
	.byte Ds3
	.byte W16
	.byte MOD, 0x06
	.byte W32
	.byte CnM2
	.byte W24
	.byte FINE

mus_fanfa5_5: @ 86BCFE0
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x53
	.byte PAN, 0x70
	.byte VOL, 0x5A
	.byte W04
	.byte N08
	.byte Gs4
	.byte v040
	.byte W08
	.byte Ds4
	.byte W08
	.byte Cn4
	.byte W04
	.byte VOL, 0x5A
	.byte W04
	.byte N08
	.byte Gs4
	.byte W08
	.byte Ds4
	.byte W08
	.byte Cn4
	.byte W08
	.byte Ds4
	.byte W08
	.byte Cn4
	.byte W08
	.byte Gs3
	.byte W08
	.byte Cn4
	.byte W08
	.byte Gs3
	.byte W08
	.byte Ds3
	.byte W04
	.byte W04
	.byte Cs3
	.byte W08
	.byte As2
	.byte W08
	.byte Fs2
	.byte W08
	.byte Cs2
	.byte W08
	.byte As2
	.byte W08
	.byte Cs3
	.byte W08
	.byte N44
	.byte Ds3
	.byte W12
	.byte MOD, 0x06
	.byte W32
	.byte CnM2
	.byte W24
	.byte FINE

mus_fanfa5_6: @ 86BD01E
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x2F
	.byte VOL, 0x5A
	.byte W24
	.byte Fs5
	.byte W56
	.byte N08
	.byte Cn2
	.byte v127
	.byte W08
	.byte N08
	.byte W08
	.byte Fs2
	.byte W24
	.byte Cs2
	.byte W08
	.byte As1
	.byte v112
	.byte W08
	.byte N08
	.byte W08
	.byte N12
	.byte Cn2
	.byte v127
	.byte W48
	.byte W24
	.byte FINE

mus_fanfa5_7: @ 86BD03D
	.byte KEYSH, 0x00
	.byte W12
	.byte VOICE, 0x00
	.byte VOL, 0x5A
	.byte N04
	.byte En1
	.byte v112
	.byte N80
	.byte An2
	.byte v120
	.byte W24
	.byte VOL, 0x5A
	.byte N04
	.byte En1
	.byte v112
	.byte W08
	.byte En1
	.byte v092
	.byte W08
	.byte N04
	.byte W08
	.byte En1
	.byte v112
	.byte W16
	.byte En1
	.byte v092
	.byte W08
	.byte En1
	.byte v112
	.byte W08
	.byte En1
	.byte v092
	.byte W08
	.byte N04
	.byte W08
	.byte En1
	.byte v112
	.byte W16
	.byte En1
	.byte v092
	.byte W08
	.byte En1
	.byte v112
	.byte W08
	.byte En1
	.byte v092
	.byte W04
	.byte En1
	.byte v112
	.byte W04
	.byte En1
	.byte v092
	.byte W04
	.byte N04
	.byte W04
	.byte En1
	.byte v112
	.byte W48
	.byte W24
	.byte FINE

@ ***************************************
	.align 2
mus_fanfa5: @ 86BD080
	.byte 7
	.byte 0
	.byte mus_fanfa5_pri
	.byte mus_fanfa5_rev
	.word mus_fanfa5_grp

	.word mus_fanfa5_1
	.word mus_fanfa5_2
	.word mus_fanfa5_3
	.word mus_fanfa5_4
	.word mus_fanfa5_5
	.word mus_fanfa5_6
	.word mus_fanfa5_7
