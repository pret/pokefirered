	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gMonIconTable:: @ 83D37A0
	.incbin "baserom.gba", 0x3D37A0, 0x6E0

gMonIconPaletteIndices:: @ 83D3E80
	.incbin "baserom.gba", 0x3D3E80, 0x1B8

gMonIconPaletteTable:: @ 83D4038
	.incbin "baserom.gba", 0x3D4038, 0x30

sMonIconOamData:: @ 83D4068
	.incbin "baserom.gba", 0x3D4068, 0x44

sMonIconAnims:: @ 83D40AC
	.incbin "baserom.gba", 0x3D40AC, 0x34

sMonIconAffineAnims:: @ 83D40E0
	.incbin "baserom.gba", 0x3D40E0, 0x8

sSpriteImageSizes:: @ 83D40E8
	.incbin "baserom.gba", 0x3D40E8, 0x18
