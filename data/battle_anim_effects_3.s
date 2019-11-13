#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_83FEDE4:: @ 83FEDE4
	.incbin "baserom.gba", 0x3FEDE4, 0x1C

gUnknown_83FEE00::
	.incbin "baserom.gba", 0x3FEE00, 0x18

gUnknown_83FEE18::
	.incbin "baserom.gba", 0x3FEE18, 0x18

gUnknown_83FEE30::
	.incbin "baserom.gba", 0x3FEE30, 0x2C

gUnknown_83FEE5C::
	.incbin "baserom.gba", 0x3FEE5C, 0x18

gUnknown_83FEE74::
	.incbin "baserom.gba", 0x3FEE74, 0x18

gUnknown_83FEE8C::
	.incbin "baserom.gba", 0x3FEE8C, 0x58

gUnknown_83FEEE4::
	.incbin "baserom.gba", 0x3FEEE4, 0x18

gUnknown_83FEEFC::
	.incbin "baserom.gba", 0x3FEEFC, 0x34

gUnknown_83FEF30::
	.incbin "baserom.gba", 0x3FEF30, 0x40

gUnknown_83FEF70::
	.incbin "baserom.gba", 0x3FEF70, 0x4C

gUnknown_83FEFBC::
	.incbin "baserom.gba", 0x3FEFBC, 0x50

gUnknown_83FF00C::
	.incbin "baserom.gba", 0x3FF00C, 0x18

gUnknown_83FF024::
	.incbin "baserom.gba", 0x3FF024, 0x18

gUnknown_83FF03C::
	.incbin "baserom.gba", 0x3FF03C, 0x2C

gUnknown_83FF068::
	.incbin "baserom.gba", 0x3FF068, 0x18

gUnknown_83FF080:: @ 83FF080
	.incbin "baserom.gba", 0x3FF080, 0x58

gUnknown_83FF0D8::
	.incbin "baserom.gba", 0x3FF0D8, 0x40

gUnknown_83FF118::
	.incbin "baserom.gba", 0x3FF118, 0x18

gUnknown_83FF130:: @ 83FF130
	.incbin "baserom.gba", 0x3FF130, 0x20

gUnknown_83FF150::
	.incbin "baserom.gba", 0x3FF150, 0x18

gUnknown_83FF168:: @ 83FF168
	.incbin "baserom.gba", 0x3FF168, 0x18

gUnknown_83FF180:: @ 83FF180
	.incbin "baserom.gba", 0x3FF180, 0x18

gUnknown_83FF198:: @ 83FF198
	.incbin "baserom.gba", 0x3FF198, 0x28

gUnknown_83FF1C0:: @ 83FF1C0
	.incbin "baserom.gba", 0x3FF1C0, 0x38

gUnknown_83FF1F8::
	.incbin "baserom.gba", 0x3FF1F8, 0x18

gUnknown_83FF210:: @ 83FF210
	.incbin "baserom.gba", 0x3FF210, 0x30

gUnknown_83FF240:: @ 83FF240
	.incbin "baserom.gba", 0x3FF240, 0x2C

gUnknown_83FF26C:: @ 83FF26C
	.incbin "baserom.gba", 0x3FF26C, 0x18

gUnknown_83FF284:: @ 83FF284
	.incbin "baserom.gba", 0x3FF284, 0x4

gUnknown_83FF288:: @ 83FF288
	.incbin "baserom.gba", 0x3FF288, 0x8

gUnknown_83FF290:: @ 83FF290
	.incbin "baserom.gba", 0x3FF290, 0x20

gUnknown_83FF2B0::
	.incbin "baserom.gba", 0x3FF2B0, 0x74

gUnknown_83FF324::
	.incbin "baserom.gba", 0x3FF324, 0x4C

gUnknown_83FF370::
	.incbin "baserom.gba", 0x3FF370, 0x18

gUnknown_83FF388::
	.incbin "baserom.gba", 0x3FF388, 0x18

gUnknown_83FF3A0::
	.incbin "baserom.gba", 0x3FF3A0, 0x18

gUnknown_83FF3B8::
	.incbin "baserom.gba", 0x3FF3B8, 0x18

gUnknown_83FF3D0:: @ 83FF3D0
	.incbin "baserom.gba", 0x3FF3D0, 0x9C

gUnknown_83FF46C::
	.incbin "baserom.gba", 0x3FF46C, 0xA8

gUnknown_83FF514::
	.incbin "baserom.gba", 0x3FF514, 0x18

gUnknown_83FF52C:: @ 83FF52C
	.incbin "baserom.gba", 0x3FF52C, 0x20

gUnknown_83FF54C:: @ 83FF54C
	.incbin "baserom.gba", 0x3FF54C, 0x18

gUnknown_83FF564:: @ 83FF564
	.incbin "baserom.gba", 0x3FF564, 0x50

gUnknown_83FF5B4::
	.incbin "baserom.gba", 0x3FF5B4, 0x18

gUnknown_83FF5CC:: @ 83FF5CC
	.incbin "baserom.gba", 0x3FF5CC, 0x18

gUnknown_83FF5E4::
	.incbin "baserom.gba", 0x3FF5E4, 0x48

gUnknown_83FF62C:: @ 83FF62C
	.incbin "baserom.gba", 0x3FF62C, 0x18

gUnknown_83FF644::
	.incbin "baserom.gba", 0x3FF644, 0x18

gUnknown_83FF65C:: @ 83FF65C
	.incbin "baserom.gba", 0x3FF65C, 0x18

gUnknown_83FF674::
	.incbin "baserom.gba", 0x3FF674, 0x18

gUnknown_83FF68C::
	.incbin "baserom.gba", 0x3FF68C, 0x18

gUnknown_83FF6A4::
	.incbin "baserom.gba", 0x3FF6A4, 0x18

gUnknown_83FF6BC::
	.incbin "baserom.gba", 0x3FF6BC, 0x30

gUnknown_83FF6EC::
	.incbin "baserom.gba", 0x3FF6EC, 0x78

gUnknown_83FF764::
	.incbin "baserom.gba", 0x3FF764, 0x2C

gUnknown_83FF790::
	.incbin "baserom.gba", 0x3FF790, 0x18

gUnknown_83FF7A8:: @ 83FF7A8
	.incbin "baserom.gba", 0x3FF7A8, 0x30
