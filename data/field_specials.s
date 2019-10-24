#include "constants/species.h"
#include "constants/items.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata

	.align 2
gUnknown_83F5AF8:: @ 83F5AF8
	.4byte gStringVar1
	.4byte gStringVar2
	.4byte gStringVar3

gUnknown_83F5B04::
	.incbin "baserom.gba", 0x3F5B04, 0x16

sSlotMachineIndices:: @ 83F5B1A
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 1
	.byte 1
	.byte 2
	.byte 2
	.byte 2
	.byte 3
	.byte 3
	.byte 3
	.byte 4
	.byte 4
	.byte 5

	.align 1
sResortGorgeousDeluxeRewards:: @ 83F5B30
	.2byte ITEM_BIG_PEARL
	.2byte ITEM_PEARL
	.2byte ITEM_STARDUST
	.2byte ITEM_STAR_PIECE
	.2byte ITEM_NUGGET
	.2byte ITEM_RARE_CANDY

	.align 2
sElevatorCurrentFloorWindowTemplate:: @ 83F5B3C
	.byte 0, 22, 1, 7, 4, 15
	.2byte 0x0008

sFloorNamePointers:: @ 83F5B44
	.4byte gUnknown_8418069
	.4byte gUnknown_8418065
	.4byte gUnknown_8418061
	.4byte gUnknown_841805D
	.4byte gUnknown_841803A
	.4byte gUnknown_841803D
	.4byte gUnknown_8418040
	.4byte gUnknown_8418043
	.4byte gUnknown_8418046
	.4byte gUnknown_8418049
	.4byte gUnknown_841804C
	.4byte gUnknown_841804F
	.4byte gUnknown_8418052
	.4byte gUnknown_8418055
	.4byte gUnknown_8418059
	.4byte gUnknown_841806D

gUnknown_83F5B84::
	.byte 26
	.byte 26
	.byte 26
	.byte 26
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 30
	.byte 26
	.byte 26
	.byte 18

	.align 1
sElevatorWindowMetatilesGoingUp:: @ 83F5B94
	.2byte 0x02e8, 0x02e9, 0x02ea
	.2byte 0x02f0, 0x02f1, 0x02f2
	.2byte 0x02f8, 0x02f9, 0x02fa

	.align 1
sElevatorWindowMetatilesGoingDown:: @ 83F5BA6
	.2byte 0x02e8, 0x02ea, 0x02e9
	.2byte 0x02f0, 0x02f2, 0x02f1
	.2byte 0x02f8, 0x02fa, 0x02f9

sElevatorAnimationDuration:: @ 83F5BB8
	.byte 8
	.byte 16
	.byte 24
	.byte 32
	.byte 38
	.byte 46
	.byte 53
	.byte 56
	.byte 57

sElevatorWindowAnimDuration:: @ 83F5BC1
	.byte  3
	.byte  6
	.byte  9
	.byte 12
	.byte 15
	.byte 18
	.byte 21
	.byte 24
	.byte 27

	.align 2
gUnknown_83F5BCC:: @ 83F5BCC
	.4byte gUnknown_8417FD9
	.4byte gUnknown_8417FE6
	.4byte gUnknown_8417FF3
	.4byte gUnknown_8418000
	.4byte gUnknown_841800D
	.4byte gUnknown_8418017
	.4byte gUnknown_8418022
	.4byte gUnknown_841802F
	.4byte gOtherText_Exit
	.4byte NULL
	.4byte NULL
	.4byte NULL

	.4byte gUnknown_8418059
	.4byte gUnknown_8418055
	.4byte gUnknown_8418052
	.4byte gUnknown_841804F
	.4byte gUnknown_841804C
	.4byte gUnknown_8418049
	.4byte gUnknown_8418046
	.4byte gUnknown_8418043
	.4byte gUnknown_8418040
	.4byte gUnknown_841803D
	.4byte gUnknown_841803A
	.4byte gOtherText_Exit

	.4byte gUnknown_841805D
	.4byte gUnknown_8418061
	.4byte gUnknown_8418069
	.4byte gOtherText_Exit
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL

	.4byte gUnknown_8418046
	.4byte gUnknown_8418043
	.4byte gUnknown_8418040
	.4byte gUnknown_841803D
	.4byte gUnknown_841803A
	.4byte gOtherText_Exit
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL

	.4byte gUnknown_841807D
	.4byte gUnknown_841808E
	.4byte gUnknown_841809C
	.4byte gOtherText_Quit
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL

	.4byte gUnknown_84180A7
	.4byte gUnknown_84180BC
	.4byte gUnknown_84180D0
	.4byte gUnknown_84180E4
	.4byte gUnknown_84180FA
	.4byte gUnknown_841810D
	.4byte gUnknown_841811D
	.4byte gUnknown_841812F
	.4byte gUnknown_8418142
	.4byte gUnknown_8418152
	.4byte gUnknown_8418163
	.4byte gOtherText_Exit

	.4byte gUnknown_841806D
	.4byte gUnknown_841805D
	.4byte gOtherText_Exit
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL

gUnknown_83F5D1C:: @ 83F5D1C
	.byte 2 @ firstArrowType
	.byte 0 @ firstX
	.byte 0 @ firstY
	.byte 3 @ secondArrowType
	.byte 0 @ secondX
	.byte 0 @ secondY
	.2byte 0 @ fullyUpThreshold
	.2byte 0 @ fullyDownThreshold
	.2byte 2000 @ tileTag
	.2byte 100 @ palTag
	.byte 0 @ palNum

	.align 2
	.align 1
sStarterMon:: @ 83F5D2C
	.2byte SPECIES_BULBASAUR
	.2byte SPECIES_SQUIRTLE
	.2byte SPECIES_CHARMANDER

gUnknown_83F5D32:: @ 83F5D32
	.byte 0x05, 0x03, 0x01
	.byte 0x06, 0x03, 0x03
	.byte 0x07, 0x07, 0x01
	.byte 0x08, 0x05, 0x01
	.byte 0x09, 0x05, 0x01
	.byte 0x0b, 0x01, 0x01
	.byte 0x0c, 0x07, 0x01
	.byte 0x0e, 0x05, 0x01
	.byte 0x22, 0x03, 0x01
	.byte 0x23, 0x07, 0x01
	.byte 0x1f, 0x02, 0x01
	.byte 0x25, 0x04, 0x01

	.align 2
gUnknown_83F5D58:: @ 83F5D58
	.2byte 0x0004, 0x0000, 0x0003, 0x0000
	.2byte 0x0004, 0x0003, 0x0003, 0x0000
	.2byte 0x0005, 0x0001, 0x0003, 0x0001
	.2byte 0x001c, 0x0000, 0x0003, 0x0029
	.2byte 0x001c, 0x0000, 0x0003, 0x002a
	.2byte 0x0001, 0x0000, 0x000f, 0x0000
	.2byte 0x0001, 0x0000, 0x000f, 0x0003
	.2byte 0x0006, 0x0000, 0x0003, 0x0002
	.2byte 0x0006, 0x0002, 0x0003, 0x0002
	.2byte 0x0001, 0x0001, 0x0003, 0x0016
	.2byte 0x0001, 0x0002, 0x0003, 0x0016
	.2byte 0x0007, 0x0005, 0x0003, 0x0003
	.2byte 0x0007, 0x0006, 0x0003, 0x0003
	.2byte 0x001e, 0x0000, 0x0003, 0x002c
	.2byte 0x0011, 0x0000, 0x0003, 0x0017
	.2byte 0x0001, 0x001e, 0x0003, 0x0017
	.2byte 0x0001, 0x0020, 0x0003, 0x0018
	.2byte 0x0009, 0x0003, 0x0003, 0x0005
	.2byte 0x0009, 0x0006, 0x0003, 0x0005
	.2byte 0x0001, 0x0005, 0x0003, 0x0005
	.2byte 0x0001, 0x0024, 0x0003, 0x0014
	.2byte 0x0001, 0x0026, 0x0003, 0x001d
	.2byte 0x0001, 0x0051, 0x0003, 0x001c
	.2byte 0x0001, 0x0051, 0x0003, 0x001c
	.2byte 0x0001, 0x005f, 0x0003, 0x001c
	.2byte 0x0001, 0x0058, 0x0003, 0x0004
	.2byte 0x0008, 0x0002, 0x0003, 0x0004
	.2byte 0x0008, 0x0004, 0x0003, 0x0004
	.2byte 0x0001, 0x0023, 0x0003, 0x001a
	.2byte 0x0001, 0x0021, 0x0003, 0x0019
	.2byte 0x000a, 0x0000, 0x0003, 0x0006
	.2byte 0x000a, 0x0007, 0x0003, 0x0006
	.2byte 0x000a, 0x000e, 0x0003, 0x0006
	.2byte 0x000a, 0x0010, 0x0003, 0x0006
	.2byte 0x000a, 0x0011, 0x0003, 0x0006
	.2byte 0x0001, 0x002a, 0x000a, 0x000e
	.2byte 0x0001, 0x003f, 0x000b, 0x0000
	.2byte 0x000b, 0x0003, 0x0003, 0x0007
	.2byte 0x000b, 0x0007, 0x0003, 0x0007
	.2byte 0x000e, 0x0002, 0x0003, 0x000a
	.2byte 0x000e, 0x0003, 0x0003, 0x000a
	.2byte 0x0001, 0x002f, 0x0003, 0x000a
	.2byte 0x0001, 0x0053, 0x0003, 0x0026
	.2byte 0x0001, 0x0053, 0x0003, 0x0026
	.2byte 0x0001, 0x003b, 0x0003, 0x0008
	.2byte 0x000c, 0x0000, 0x0003, 0x0008
	.2byte 0x000c, 0x0001, 0x0003, 0x0008
	.2byte 0x0001, 0x0027, 0x0003, 0x002a
	.2byte 0x0001, 0x0028, 0x0003, 0x002a
	.2byte 0x000d, 0x0000, 0x0003, 0x0009
	.2byte 0x0001, 0x0048, 0x0003, 0x0003

	.align 2
gUnknown_83F5EF0:: @ 83F5EF0
	.asciz "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/scr_tool.c"

	.align 2
gUnknown_83F5F24:: @ 83F5F24
	.asciz "0"

	.align 1
gUnknown_83F5F26:: @ 83F5F26
	.2byte 0x0504
	.2byte 0x0605
	.2byte 0x0703
	.2byte 0x0800
	.2byte 0x0901
	.2byte 0x0a0c
	.2byte 0x0b05
	.2byte 0x0c05
	.2byte 0x0d00
	.2byte 0x0e06
	.2byte 0x1000
	.2byte 0x1500
	.2byte 0x2000
	.2byte 0x2102
	.2byte 0x2201
	.2byte 0x2301
	.2byte 0x2400
	.2byte 0x1f03
	.2byte 0x2500
	.2byte 0x0004
	.2byte 0xffff

gUnknown_83F5F50:: @ 83F5F50
	.incbin "data/field_specials/unk_83F5F50.gbapal"
	.incbin "data/field_specials/unk_83F5F70.gbapal"
	.incbin "data/field_specials/unk_83F5F90.gbapal"
	.incbin "data/field_specials/unk_83F5FB0.gbapal"
	.incbin "data/field_specials/unk_83F5FD0.gbapal"
	.incbin "data/field_specials/unk_83F5FF0.gbapal"
	.incbin "data/field_specials/unk_83F6010.gbapal"
	.incbin "data/field_specials/unk_83F6030.gbapal"
	.incbin "data/field_specials/unk_83F6050.gbapal"
	.incbin "data/field_specials/unk_83F6070.gbapal"
	.incbin "data/field_specials/unk_83F6090.gbapal"

gUnknown_83F60B0:: @ 83F60B0
	.incbin "data/field_specials/unk_83F60B0.gbapal"

gUnknown_83F60D0:: @ 83F60D0
	.incbin "data/field_specials/unk_83F60D0.gbapal"
	.incbin "data/field_specials/unk_83F60F0.gbapal"
	.incbin "data/field_specials/unk_83F6110.gbapal"
	.incbin "data/field_specials/unk_83F6130.gbapal"
	.incbin "data/field_specials/unk_83F6150.gbapal"
	.incbin "data/field_specials/unk_83F6170.gbapal"
	.incbin "data/field_specials/unk_83F6190.gbapal"
	.incbin "data/field_specials/unk_83F61B0.gbapal"

gUnknown_83F61D0:: @ 83F61D0
	.incbin "data/field_specials/unk_83F61D0.gbapal"

gUnknown_83F61F0:: @ 83F61F0
	.incbin "baserom.gba", 0x3F61F0, 0xB

gUnknown_83F61FB:: @ 83F61FB
	.incbin "baserom.gba", 0x3F61FB, 0x8

gUnknown_83F6203:: @ 83F6203
	.incbin "baserom.gba", 0x3F6203, 0x3

gUnknown_83F6206:: @ 83F6206
	.incbin "baserom.gba", 0x3F6206, 0x160

gUnknown_83F6366:: @ 83F6366
	.incbin "baserom.gba", 0x3F6366, 0x16

gUnknown_83F637C:: @ 83F637C
	.incbin "baserom.gba", 0x3F637C, 0xC
