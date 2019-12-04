#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83CC368:: @ 83CC368
	.incbin "baserom.gba", 0x3CC368, 0x174

gUnknown_83CC4DC:: @ 83CC4DC
	.incbin "baserom.gba", 0x3CC4DC, 0x214

gUnknown_83CC6F0:: @ 83CC6F0
	.incbin "baserom.gba", 0x3CC6F0, 0x1B8

gUnknown_83CC8A8:: @ 83CC8A8
	.incbin "baserom.gba", 0x3CC8A8, 0xDC

gUnknown_83CC984:: @ 83CC984
	.incbin "baserom.gba", 0x3CC984, 0x12C

gUnknown_83CCAB0:: @ 83CCAB0
	.incbin "baserom.gba", 0x3CCAB0, 0x1F4

gUnknown_83CCCA4:: @ 83CCCA4
	.incbin "baserom.gba", 0x3CCCA4, 0x18C

gUnknown_83CCE30:: @ 83CCE30
	.incbin "baserom.gba", 0x3CCE30, 0x98

gUnknown_83CCEC8:: @ 83CCEC8
	.incbin "baserom.gba", 0x3CCEC8, 0xB8

gUnknown_83CCF80:: @ 83CCF80
    .incbin "baserom.gba", 0x3CCF80, 0x60
    
gUnknown_83CCFE0:: @ 83CCFE0
    .incbin "baserom.gba", 0x3CCFE0, 0x60

gUnknown_83CD040:: @ 83CD040
    .incbin "baserom.gba", 0x3CD040, 0x60

gUnknown_83CD0A0:: @ 83CD0A0
    .incbin "baserom.gba", 0x3CD0A0, 0x60

gUnknown_83CD100:: @ 83CD100
    .incbin "baserom.gba", 0x3CD100, 0x60

gUnknown_83CD160:: @ 83CD160  
    .incbin "baserom.gba", 0x3CD160, 0x60

gUnknown_83CD1C0:: @ 83CD1C0
    .incbin "baserom.gba", 0x3CD1C0, 0x60

gUnknown_83CD220:: @ 83CD220
    .incbin "baserom.gba", 0x3CD220, 0x60

gUnknown_83CD280:: @ 83CD280
	.incbin "baserom.gba", 0x3CD280, 0x20

gUnknown_83CD2A0:: @ 83CD2A0
	.incbin "baserom.gba", 0x3CD2A0, 0x20

gUnknown_83CD2C0:: @ 83CD2C0
	.incbin "baserom.gba", 0x3CD2C0, 0x20

gUnknown_83CD2E0:: @ 83CD2E0
	.incbin "baserom.gba", 0x3CD2E0, 0x20

gUnknown_83CD300:: @ 83CD300
	.incbin "baserom.gba", 0x3CD300, 0x20

gUnknown_83CD320:: @ 83CD320
	.incbin "baserom.gba", 0x3CD320, 0x20

gUnknown_83CD340:: @ 83CD340
	.incbin "baserom.gba", 0x3CD340, 0x20

gUnknown_83CD360:: @ 83CD360
	.incbin "baserom.gba", 0x3CD360, 0x20

gUnknown_83CD380:: @ 83CD380
	.incbin "baserom.gba", 0x3CD380, 0x268

gUnknown_83CD5E8:: @ 83CD5E8
	.incbin "baserom.gba", 0x3CD5E8, 0x2A0

gUnknown_83CD888:: @ 83CD888
	.incbin "baserom.gba", 0x3CD888, 0x10

gUnknown_83CD898:: @ 83CD898
	.incbin "baserom.gba", 0x3CD898, 0x20

gUnknown_83CD8B8:: @ 83CD8B8
    .word gUnknown_8E9986C
    .word gUnknown_83CCF80
    .word gUnknown_83CD040
    .word gUnknown_83CD100
    .word gUnknown_83CD1C0

gUnknown_83CD8CC:: @ 83CD8CC
    .word gUnknown_8E99198
    .word gUnknown_83CCFE0
    .word gUnknown_83CD0A0
    .word gUnknown_83CD160
    .word gUnknown_83CD220

gUnknown_83CD8E0:: @ 83CD8E0
	.incbin "baserom.gba", 0x3CD8E0, 0x3

gUnknown_83CD8E3:: @ 83CD8E3
	.incbin "baserom.gba", 0x3CD8E3, 0x6

gUnknown_83CD8E9:: @ 83CD8E9
	.incbin "baserom.gba", 0x3CD8E9, 0x3

gUnknown_83CD8EC:: @ 83CD8EC
	.incbin "baserom.gba", 0x3CD8EC, 0x8

gUnknown_83CD8F4:: @ 83CD8F4
	.incbin "baserom.gba", 0x3CD8F4, 0x4

gUnknown_83CD8F8:: @ 83CD8F8
	.incbin "baserom.gba", 0x3CD8F8, 0x10

gUnknown_83CD908:: @ 83CD908
	.incbin "baserom.gba", 0x3CD908, 0x18

gUnknown_83CD920:: @ 83CD920
	.incbin "baserom.gba", 0x3CD920, 0x2

gUnknown_83CD922:: @ 83CD922
	.incbin "baserom.gba", 0x3CD922, 0x2

gUnknown_83CD924:: @ 83CD924
	.incbin "baserom.gba", 0x3CD924, 0x2

gUnknown_83CD926:: @ 83CD926
	.incbin "baserom.gba", 0x3CD926, 0x2

gUnknown_83CD928:: @ 83CD928
	.incbin "baserom.gba", 0x3CD928, 0x8

gUnknown_83CD930:: @ 83CD930
	.incbin "baserom.gba", 0x3CD930, 0x2

gUnknown_83CD932:: @ 83CD932
	.incbin "baserom.gba", 0x3CD932, 0x2

gUnknown_83CD934:: @ 83CD934
	.incbin "baserom.gba", 0x3CD934, 0x2

gUnknown_83CD936:: @ 83CD936
	.incbin "baserom.gba", 0x3CD936, 0x2

gUnknown_83CD938:: @ 83CD938
	.incbin "baserom.gba", 0x3CD938, 0x2

gUnknown_83CD93A:: @ 83CD93A
	.incbin "baserom.gba", 0x3CD93A, 0x2

gUnknown_83CD93C:: @ 83CD93C
	.incbin "baserom.gba", 0x3CD93C, 0x2

gUnknown_83CD93E:: @ 83CD93E
	.incbin "baserom.gba", 0x3CD93E, 0x2

gUnknown_83CD940:: @ 83CD940
	.incbin "baserom.gba", 0x3CD940, 0x4

gUnknown_83CD944:: @ 83CD944
	.incbin "baserom.gba", 0x3CD944, 0x8

gUnknown_83CD94C:: @ 83CD94C
	.incbin "baserom.gba", 0x3CD94C, 0x6

gUnknown_83CD952:: @ 83CD952
	.incbin "baserom.gba", 0x3CD952, 0x6

gUnknown_83CD958:: @ 83CD958
	.incbin "baserom.gba", 0x3CD958, 0x4

gUnknown_83CD95C:: @ 83CD95C
	.incbin "baserom.gba", 0x3CD95C, 0x4

gUnknown_83CD960:: @ 83CD960
	.incbin "baserom.gba", 0x3CD960, 0x60

gUnknown_83CD9C0:: @ 83CD9C0
	.incbin "baserom.gba", 0x3CD9C0, 0x60
