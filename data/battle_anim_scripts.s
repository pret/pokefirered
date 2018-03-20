	.section script_data, "aw", %progbits

gUnknown_81C68EC:: @ 81C68EC
	.4byte 0xc3002f, 0xffff0140

gUnknown_81C68F4:: @ 81C68F4 - table
	.incbin "baserom.gba", 0x1C68F4, 0x590

gUnknown_81C6E84:: @ 81C6E84 - table
	.incbin "baserom.gba", 0x1C6E84, 0x24

gUnknown_81C6EA8:: @ 81C6EA8 - table
	.incbin "baserom.gba", 0x1C6EA8, 0x70

gUnknown_81C6F18:: @ 81C6F18
	.incbin "baserom.gba", 0x1C6F18, 0xF690
