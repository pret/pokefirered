#include "constants/event_objects.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_835B890:: @ 835B890
	.4byte MetatileBehavior_IsSouthArrowWarp
	.4byte MetatileBehavior_IsNorthArrowWarp
	.4byte MetatileBehavior_IsWestArrowWarp
	.4byte MetatileBehavior_IsEastArrowWarp

gUnknown_835B8A0:: @ 835B8A0
	.4byte sub_805CD64
	.4byte sub_805CD84
	.4byte sub_805CE20

gUnknown_835B8AC:: @ 835B8AC
	.4byte PlayerAvatar_DoSecretBaseMatJump

gUnknown_835B8B0:: @ 835B8B0
	.4byte sub_805CFC4
	.4byte sub_805CFEC
	.4byte sub_805D064
	.4byte sub_805D0A4

gUnknown_835B8C0:: @ 835B8C0
	.byte 0x03, 0x04, 0x02, 0x01

gUnknown_835B8C4:: @ 835B8C4
	.byte 0x18, 0x18, 0x19, 0x1a, 0x1b

	.align 2
gUnknown_835B8CC:: @ 835B8CC
	.4byte sub_805D33C
	.4byte fish1
	.4byte fish2
	.4byte sub_805D430
	.4byte sub_805D47C
	.4byte sub_805D508
	.4byte sub_805D574
	.4byte sub_805D580
	.4byte sub_805D5EC
	.4byte sub_805D66C
	.4byte sub_805D6C8
	.4byte sub_805D7C0
	.4byte sub_805D838
	.4byte sub_805D8AC
	.4byte sub_805D8D8
	.4byte sub_805D980

gUnknown_835B90C:: @ 835B90C
	.2byte 0x0001, 0x0001, 0x0001

gUnknown_835B912:: @ 835B912
	.2byte 0x0001, 0x0003, 0x0006

gUnknown_835B918:: @ 835B918
	.string "·$"

gUnknown_835B91A:: @ 835B91A
	.2byte 0x0024, 0x0021, 0x001e

gUnknown_835B920:: @ 835B920
	.2byte 0x0000, 0x0000, 0x0028, 0x000a, 0x0046, 0x001e

gUnknown_835B92C:: @ 835B92C
	.byte 0x01, 0x03, 0x04, 0x02, 0x01
