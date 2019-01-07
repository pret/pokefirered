    .include "asm/macros.inc"

    .section .rodata

gUnknown_8352754:: @ 8352754
	.incbin "baserom.gba", 0x352754, 0x798

sDummyConnectionFlags:: @ 8352EEC
	.4byte 0

gUnknown_8352EF0:: @ 8352EF0
	.incbin "baserom.gba", 0x352EF0, 0x20

gUnknown_8352F10:: @ 8352F10
	.incbin "baserom.gba", 0x352F10, 0x8
