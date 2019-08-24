	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80CDD18
sub_80CDD18: @ 80CDD18
	push {lr}
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	thumb_func_end sub_80CDD18

	thumb_func_start Task_BeginEvolutionScene
Task_BeginEvolutionScene: @ 80CDD28
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	movs r7, 0
	ldr r1, _080CDD4C @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r6, r0, r1
	movs r1, 0x8
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _080CDD50
	cmp r0, 0x1
	beq _080CDD68
	b _080CDD98
	.align 2, 0
_080CDD4C: .4byte gTasks
_080CDD50:
	movs r0, 0x1
	negs r0, r0
	str r7, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	b _080CDD98
_080CDD68:
	ldr r0, _080CDDA0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080CDD98
	movs r0, 0x1C
	ldrsh r1, [r6, r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080CDDA4 @ =gPlayerParty
	adds r7, r1, r0
	ldrh r4, [r6, 0xC]
	ldrb r5, [r6, 0xE]
	ldrb r6, [r6, 0x1C]
	adds r0, r2, 0
	bl DestroyTask
	adds r0, r7, 0
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl EvolutionScene
_080CDD98:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CDDA0: .4byte gPaletteFade
_080CDDA4: .4byte gPlayerParty
	thumb_func_end Task_BeginEvolutionScene

	thumb_func_start BeginEvolutionScene
BeginEvolutionScene: @ 80CDDA8
	push {r4-r6,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _080CDDE8 @ =Task_BeginEvolutionScene
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CDDEC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r4, [r1, 0xC]
	strh r5, [r1, 0xE]
	strh r6, [r1, 0x1C]
	ldr r0, _080CDDF0 @ =sub_80CDD18
	bl SetMainCallback2
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CDDE8: .4byte Task_BeginEvolutionScene
_080CDDEC: .4byte gTasks
_080CDDF0: .4byte sub_80CDD18
	thumb_func_end BeginEvolutionScene

	thumb_func_start EvolutionScene
EvolutionScene: @ 80CDDF4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	adds r4, r0, 0
	mov r10, r1
	mov r0, r10
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x18]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x1C]
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	bl SetVBlankCallback
	movs r1, 0
	str r1, [sp, 0x14]
	add r0, sp, 0x14
	movs r1, 0xC0
	lsls r1, 19
	ldr r2, _080CE07C @ =0x05006000
	bl CpuSet
	movs r0, 0x4C
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x40
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x42
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x46
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0
	bl SetGpuReg
	bl ResetPaletteFade
	ldr r0, _080CE080 @ =gBattle_BG0_X
	movs r2, 0
	strh r2, [r0]
	ldr r0, _080CE084 @ =gBattle_BG0_Y
	strh r2, [r0]
	ldr r0, _080CE088 @ =gBattle_BG1_X
	strh r2, [r0]
	ldr r0, _080CE08C @ =gBattle_BG1_Y
	strh r2, [r0]
	ldr r0, _080CE090 @ =gBattle_BG2_X
	strh r2, [r0]
	ldr r0, _080CE094 @ =gBattle_BG2_Y
	strh r2, [r0]
	ldr r1, _080CE098 @ =gBattle_BG3_X
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080CE09C @ =gBattle_BG3_Y
	movs r1, 0
	strh r1, [r0]
	ldr r1, _080CE0A0 @ =gBattleTerrain
	movs r0, 0x9
	strb r0, [r1]
	bl sub_800F34C
	bl LoadBattleTextboxAndBackground
	bl ResetSpriteData
	bl ScanlineEffect_Stop
	bl ResetTasks
	bl FreeAllSpritePalettes
	ldr r0, _080CE0A4 @ =gReservedSpritePaletteCount
	movs r2, 0x4
	strb r2, [r0]
	movs r0, 0x64
	bl AllocZeroed
	ldr r1, _080CE0A8 @ =gUnknown_2039A20
	str r0, [r1]
	bl AllocateMonSpritesGfx
	adds r0, r4, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _080CE0AC @ =gStringVar1
	mov r1, sp
	bl StringCopy10
	ldr r0, _080CE0B0 @ =gStringVar2
	movs r1, 0xB
	mov r2, r10
	muls r2, r1
	adds r1, r2, 0
	ldr r2, _080CE0B4 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [sp, 0x20]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	mov r9, r0
	lsls r0, r5, 3
	ldr r1, _080CE0B8 @ =gMonFrontPicTable
	adds r0, r1
	ldr r2, _080CE0BC @ =gMonSpritesGfxPtr
	ldr r1, [r2]
	ldr r1, [r1, 0x8]
	adds r2, r5, 0
	bl DecompressPicFromTable
	adds r0, r5, 0
	ldr r1, [sp, 0x20]
	mov r2, r9
	bl GetMonSpritePalStructFromOtIdPersonality
	ldr r0, [r0]
	movs r1, 0x88
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	adds r0, r5, 0
	movs r1, 0x1
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _080CE0C0 @ =gMultiuseSpriteTemplate
	mov r8, r0
	ldr r1, _080CE0C4 @ =gDummySpriteAffineAnimTable
	str r1, [r0, 0x10]
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0x1E
	bl CreateSprite
	ldr r1, _080CE0A8 @ =gUnknown_2039A20
	ldr r2, [r1]
	lsls r1, r0, 24
	lsrs r3, r1, 24
	strb r0, [r2]
	ldr r7, _080CE0C8 @ =gSprites
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r6, r7, 0
	adds r6, 0x1C
	adds r0, r1, r6
	ldr r2, _080CE0CC @ =nullsub_10
	str r2, [r0]
	adds r1, r7
	ldrb r2, [r1, 0x5]
	movs r4, 0xF
	adds r0, r4, 0
	ands r0, r2
	movs r2, 0x10
	orrs r0, r2
	strb r0, [r1, 0x5]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	mov r1, r10
	lsls r0, r1, 3
	ldr r2, _080CE0B8 @ =gMonFrontPicTable
	adds r0, r2
	ldr r2, _080CE0BC @ =gMonSpritesGfxPtr
	ldr r1, [r2]
	ldr r1, [r1, 0x10]
	mov r2, r10
	bl DecompressPicFromTable
	mov r0, r10
	ldr r1, [sp, 0x20]
	mov r2, r9
	bl GetMonSpritePalStructFromOtIdPersonality
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	mov r0, r10
	movs r1, 0x3
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _080CE0C4 @ =gDummySpriteAffineAnimTable
	mov r1, r8
	str r0, [r1, 0x10]
	mov r0, r8
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0x1E
	bl CreateSprite
	ldr r1, _080CE0A8 @ =gUnknown_2039A20
	ldr r2, [r1]
	lsls r1, r0, 24
	lsrs r3, r1, 24
	strb r0, [r2, 0x1]
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r6, r1, r6
	ldr r2, _080CE0CC @ =nullsub_10
	str r2, [r6]
	adds r1, r7
	ldrb r0, [r1, 0x5]
	ands r4, r0
	movs r0, 0x20
	orrs r4, r0
	strb r4, [r1, 0x5]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	bl LoadEvoSparkleSpriteAndPal
	ldr r0, _080CE0D0 @ =sub_80CE8DC
	movs r1, 0
	bl CreateTask
	ldr r1, _080CE0A8 @ =gUnknown_2039A20
	ldr r2, [r1]
	lsls r1, r0, 24
	lsrs r3, r1, 24
	strb r0, [r2, 0x2]
	ldr r1, _080CE0D4 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	strh r2, [r0, 0x8]
	strh r5, [r0, 0xA]
	mov r1, r10
	strh r1, [r0, 0xC]
	mov r2, sp
	ldrh r2, [r2, 0x18]
	strh r2, [r0, 0xE]
	movs r1, 0x1
	strh r1, [r0, 0x10]
	movs r1, 0
	strh r1, [r0, 0x1A]
	mov r2, sp
	ldrh r2, [r2, 0x1C]
	strh r2, [r0, 0x1C]
	ldr r1, _080CE0A8 @ =gUnknown_2039A20
	ldr r0, [r1]
	ldr r1, _080CE0D8 @ =gPlttBufferUnfaded + 0x40
	adds r0, 0x4
	movs r2, 0x60
	bl memcpy
	movs r1, 0xFA
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	ldr r0, _080CE0DC @ =nullsub_76
	bl SetHBlankCallback
	ldr r0, _080CE0E0 @ =sub_80D0050
	bl SetVBlankCallback
	bl m4aMPlayAllStop
	bl sub_812B478
	ldr r0, _080CE0E4 @ =sub_80CE710
	bl SetMainCallback2
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE07C: .4byte 0x05006000
_080CE080: .4byte gBattle_BG0_X
_080CE084: .4byte gBattle_BG0_Y
_080CE088: .4byte gBattle_BG1_X
_080CE08C: .4byte gBattle_BG1_Y
_080CE090: .4byte gBattle_BG2_X
_080CE094: .4byte gBattle_BG2_Y
_080CE098: .4byte gBattle_BG3_X
_080CE09C: .4byte gBattle_BG3_Y
_080CE0A0: .4byte gBattleTerrain
_080CE0A4: .4byte gReservedSpritePaletteCount
_080CE0A8: .4byte gUnknown_2039A20
_080CE0AC: .4byte gStringVar1
_080CE0B0: .4byte gStringVar2
_080CE0B4: .4byte gSpeciesNames
_080CE0B8: .4byte gMonFrontPicTable
_080CE0BC: .4byte gMonSpritesGfxPtr
_080CE0C0: .4byte gMultiuseSpriteTemplate
_080CE0C4: .4byte gDummySpriteAffineAnimTable
_080CE0C8: .4byte gSprites
_080CE0CC: .4byte nullsub_10
_080CE0D0: .4byte sub_80CE8DC
_080CE0D4: .4byte gTasks
_080CE0D8: .4byte gPlttBufferUnfaded + 0x40
_080CE0DC: .4byte nullsub_76
_080CE0E0: .4byte sub_80D0050
_080CE0E4: .4byte sub_80CE710
	thumb_func_end EvolutionScene

	thumb_func_start CB2_EvolutionSceneLoadGraphics
CB2_EvolutionSceneLoadGraphics: @ 80CE0E8
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	ldr r2, _080CE280 @ =gTasks
	ldr r0, _080CE284 @ =gUnknown_2039A20
	mov r8, r0
	ldr r0, [r0]
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x1C
	ldrsh r2, [r0, r1]
	movs r1, 0x64
	adds r4, r2, 0
	muls r4, r1
	ldr r1, _080CE288 @ =gPlayerParty
	adds r4, r1
	ldrh r5, [r0, 0xC]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	mov r9, r0
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r6, r0, 0
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	bl SetVBlankCallback
	movs r4, 0
	str r4, [sp, 0x4]
	movs r1, 0xC0
	lsls r1, 19
	ldr r2, _080CE28C @ =0x05006000
	add r0, sp, 0x4
	bl CpuSet
	movs r0, 0x4C
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x40
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x42
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x46
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0
	bl SetGpuReg
	bl ResetPaletteFade
	ldr r0, _080CE290 @ =gBattle_BG0_X
	strh r4, [r0]
	ldr r0, _080CE294 @ =gBattle_BG0_Y
	strh r4, [r0]
	ldr r0, _080CE298 @ =gBattle_BG1_X
	strh r4, [r0]
	ldr r0, _080CE29C @ =gBattle_BG1_Y
	strh r4, [r0]
	ldr r0, _080CE2A0 @ =gBattle_BG2_X
	strh r4, [r0]
	ldr r0, _080CE2A4 @ =gBattle_BG2_Y
	strh r4, [r0]
	ldr r1, _080CE2A8 @ =gBattle_BG3_X
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080CE2AC @ =gBattle_BG3_Y
	strh r4, [r0]
	ldr r1, _080CE2B0 @ =gBattleTerrain
	movs r0, 0x9
	strb r0, [r1]
	bl sub_800F34C
	bl LoadBattleTextboxAndBackground
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _080CE2B4 @ =gReservedSpritePaletteCount
	movs r0, 0x4
	strb r0, [r1]
	lsls r0, r5, 3
	ldr r1, _080CE2B8 @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _080CE2BC @ =gMonSpritesGfxPtr
	ldr r1, [r1]
	ldr r1, [r1, 0x10]
	adds r2, r5, 0
	bl DecompressPicFromTable
	adds r0, r5, 0
	mov r1, r9
	adds r2, r6, 0
	bl GetMonSpritePalStructFromOtIdPersonality
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	adds r0, r5, 0
	movs r1, 0x3
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _080CE2C0 @ =gMultiuseSpriteTemplate
	ldr r1, _080CE2C4 @ =gDummySpriteAffineAnimTable
	str r1, [r0, 0x10]
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0x1E
	bl CreateSprite
	mov r2, r8
	ldr r1, [r2]
	lsls r2, r0, 24
	lsrs r2, 24
	strb r0, [r1, 0x1]
	ldr r3, _080CE2C8 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _080CE2CC @ =nullsub_10
	str r2, [r0]
	adds r1, r3
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x5]
	movs r1, 0xFA
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	ldr r0, _080CE2D0 @ =nullsub_76
	bl SetHBlankCallback
	ldr r0, _080CE2D4 @ =sub_80D0050
	bl SetVBlankCallback
	ldr r0, _080CE2D8 @ =sub_80CE710
	bl SetMainCallback2
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CE280: .4byte gTasks
_080CE284: .4byte gUnknown_2039A20
_080CE288: .4byte gPlayerParty
_080CE28C: .4byte 0x05006000
_080CE290: .4byte gBattle_BG0_X
_080CE294: .4byte gBattle_BG0_Y
_080CE298: .4byte gBattle_BG1_X
_080CE29C: .4byte gBattle_BG1_Y
_080CE2A0: .4byte gBattle_BG2_X
_080CE2A4: .4byte gBattle_BG2_Y
_080CE2A8: .4byte gBattle_BG3_X
_080CE2AC: .4byte gBattle_BG3_Y
_080CE2B0: .4byte gBattleTerrain
_080CE2B4: .4byte gReservedSpritePaletteCount
_080CE2B8: .4byte gMonFrontPicTable
_080CE2BC: .4byte gMonSpritesGfxPtr
_080CE2C0: .4byte gMultiuseSpriteTemplate
_080CE2C4: .4byte gDummySpriteAffineAnimTable
_080CE2C8: .4byte gSprites
_080CE2CC: .4byte nullsub_10
_080CE2D0: .4byte nullsub_76
_080CE2D4: .4byte sub_80D0050
_080CE2D8: .4byte sub_80CE710
	thumb_func_end CB2_EvolutionSceneLoadGraphics

	thumb_func_start CB2_TradeEvolutionSceneLoadGraphics
CB2_TradeEvolutionSceneLoadGraphics: @ 80CE2DC
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r2, _080CE318 @ =gTasks
	ldr r0, _080CE31C @ =gUnknown_2039A20
	ldr r0, [r0]
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x1C
	ldrsh r2, [r0, r1]
	movs r1, 0x64
	muls r2, r1
	ldr r1, _080CE320 @ =gPlayerParty
	adds r4, r2, r1
	ldrh r6, [r0, 0xC]
	ldr r0, _080CE324 @ =gMain
	movs r3, 0x87
	lsls r3, 3
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, 0x7
	bls _080CE30E
	b _080CE534
_080CE30E:
	lsls r0, 2
	ldr r1, _080CE328 @ =_080CE32C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CE318: .4byte gTasks
_080CE31C: .4byte gUnknown_2039A20
_080CE320: .4byte gPlayerParty
_080CE324: .4byte gMain
_080CE328: .4byte _080CE32C
	.align 2, 0
_080CE32C:
	.4byte _080CE34C
	.4byte _080CE3BC
	.4byte _080CE3E4
	.4byte _080CE3EA
	.4byte _080CE414
	.4byte _080CE45C
	.4byte _080CE4CC
	.4byte _080CE504
_080CE34C:
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	bl SetVBlankCallback
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _080CE398 @ =gReservedSpritePaletteCount
	movs r0, 0x4
	strb r0, [r1]
	ldr r0, _080CE39C @ =gBattle_BG0_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080CE3A0 @ =gBattle_BG0_Y
	strh r1, [r0]
	ldr r0, _080CE3A4 @ =gBattle_BG1_X
	strh r1, [r0]
	ldr r0, _080CE3A8 @ =gBattle_BG1_Y
	strh r1, [r0]
	ldr r0, _080CE3AC @ =gBattle_BG2_X
	strh r1, [r0]
	ldr r0, _080CE3B0 @ =gBattle_BG2_Y
	strh r1, [r0]
	ldr r2, _080CE3B4 @ =gBattle_BG3_X
	movs r3, 0x80
	lsls r3, 1
	adds r0, r3, 0
	strh r0, [r2]
	ldr r0, _080CE3B8 @ =gBattle_BG3_Y
	strh r1, [r0]
	b _080CE4EC
	.align 2, 0
_080CE398: .4byte gReservedSpritePaletteCount
_080CE39C: .4byte gBattle_BG0_X
_080CE3A0: .4byte gBattle_BG0_Y
_080CE3A4: .4byte gBattle_BG1_X
_080CE3A8: .4byte gBattle_BG1_Y
_080CE3AC: .4byte gBattle_BG2_X
_080CE3B0: .4byte gBattle_BG2_Y
_080CE3B4: .4byte gBattle_BG3_X
_080CE3B8: .4byte gBattle_BG3_Y
_080CE3BC:
	bl ResetPaletteFade
	ldr r0, _080CE3D8 @ =nullsub_76
	bl SetHBlankCallback
	ldr r0, _080CE3DC @ =sub_80D00D8
	bl SetVBlankCallback
	ldr r1, _080CE3E0 @ =gMain
	movs r3, 0x87
	lsls r3, 3
	adds r1, r3
	b _080CE4F4
	.align 2, 0
_080CE3D8: .4byte nullsub_76
_080CE3DC: .4byte sub_80D00D8
_080CE3E0: .4byte gMain
_080CE3E4:
	bl sub_80544FC
	b _080CE4EC
_080CE3EA:
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	ldr r1, _080CE410 @ =gMain
	movs r3, 0x87
	lsls r3, 3
	adds r1, r3
	b _080CE4F4
	.align 2, 0
_080CE410: .4byte gMain
_080CE414:
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	adds r5, r0, 0
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r0, r6, 3
	ldr r1, _080CE454 @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _080CE458 @ =gMonSpritesGfxPtr
	ldr r1, [r1]
	ldr r1, [r1, 0x10]
	adds r2, r6, 0
	bl DecompressPicFromTable
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl GetMonSpritePalStructFromOtIdPersonality
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	b _080CE4EC
	.align 2, 0
_080CE454: .4byte gMonFrontPicTable
_080CE458: .4byte gMonSpritesGfxPtr
_080CE45C:
	adds r0, r6, 0
	movs r1, 0x1
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _080CE4B4 @ =gMultiuseSpriteTemplate
	ldr r1, _080CE4B8 @ =gDummySpriteAffineAnimTable
	str r1, [r0, 0x10]
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0x1E
	bl CreateSprite
	ldr r1, _080CE4BC @ =gUnknown_2039A20
	ldr r1, [r1]
	lsls r2, r0, 24
	lsrs r2, 24
	strb r0, [r1, 0x1]
	ldr r3, _080CE4C0 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _080CE4C4 @ =nullsub_10
	str r2, [r0]
	adds r1, r3
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x5]
	ldr r1, _080CE4C8 @ =gMain
	movs r3, 0x87
	lsls r3, 3
	adds r1, r3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_80504B0
	b _080CE534
	.align 2, 0
_080CE4B4: .4byte gMultiuseSpriteTemplate
_080CE4B8: .4byte gDummySpriteAffineAnimTable
_080CE4BC: .4byte gUnknown_2039A20
_080CE4C0: .4byte gSprites
_080CE4C4: .4byte nullsub_10
_080CE4C8: .4byte gMain
_080CE4CC:
	ldr r0, _080CE4FC @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _080CE4E0
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, 0
	movs r1, 0
	bl CreateWirelessStatusIndicatorSprite
_080CE4E0:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
_080CE4EC:
	ldr r1, _080CE500 @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
_080CE4F4:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080CE534
	.align 2, 0
_080CE4FC: .4byte gWirelessCommType
_080CE500: .4byte gMain
_080CE504:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	bl sub_805049C
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	ldr r0, _080CE53C @ =sub_80CE72C
	bl SetMainCallback2
	movs r1, 0x9A
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
_080CE534:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CE53C: .4byte sub_80CE72C
	thumb_func_end CB2_TradeEvolutionSceneLoadGraphics

	thumb_func_start TradeEvolutionScene
TradeEvolutionScene: @ 80CE540
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 24
	lsrs r6, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x14]
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _080CE6B0 @ =gStringVar1
	mov r1, sp
	bl StringCopy10
	ldr r0, _080CE6B4 @ =gStringVar2
	movs r1, 0xB
	muls r1, r5
	ldr r2, _080CE6B8 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r1, _080CE6BC @ =gAffineAnimsDisabled
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	mov r8, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r7, r0, 0
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	mov r10, r0
	ldr r1, _080CE6C0 @ =gUnknown_2039A20
	mov r9, r1
	movs r0, 0x64
	bl AllocZeroed
	mov r2, r9
	str r0, [r2]
	movs r4, 0
	strb r6, [r0]
	lsls r0, r5, 3
	ldr r1, _080CE6C4 @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _080CE6C8 @ =gMonSpritesGfxPtr
	ldr r1, [r1]
	ldr r1, [r1, 0x8]
	adds r2, r5, 0
	bl DecompressPicFromTable
	adds r0, r5, 0
	mov r1, r10
	adds r2, r7, 0
	bl GetMonSpritePalStructFromOtIdPersonality
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	adds r0, r5, 0
	movs r1, 0x1
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _080CE6CC @ =gMultiuseSpriteTemplate
	ldr r1, _080CE6D0 @ =gDummySpriteAffineAnimTable
	str r1, [r0, 0x10]
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0x1E
	bl CreateSprite
	mov r1, r9
	ldr r2, [r1]
	lsls r1, r0, 24
	lsrs r6, r1, 24
	strb r0, [r2, 0x1]
	ldr r3, _080CE6D4 @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _080CE6D8 @ =nullsub_10
	str r2, [r0]
	adds r1, r3
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x5]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	bl LoadEvoSparkleSpriteAndPal
	ldr r0, _080CE6DC @ =sub_80CF53C
	movs r1, 0
	bl CreateTask
	mov r1, r9
	ldr r2, [r1]
	lsls r1, r0, 24
	lsrs r6, r1, 24
	strb r0, [r2, 0x2]
	ldr r1, _080CE6E0 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x8]
	mov r2, r8
	strh r2, [r0, 0xA]
	strh r5, [r0, 0xC]
	movs r1, 0x1
	strh r1, [r0, 0x10]
	strh r4, [r0, 0x1A]
	mov r1, sp
	ldrh r1, [r1, 0x14]
	strh r1, [r0, 0x1C]
	ldr r0, _080CE6E4 @ =gBattle_BG0_X
	strh r4, [r0]
	ldr r0, _080CE6E8 @ =gBattle_BG0_Y
	strh r4, [r0]
	ldr r0, _080CE6EC @ =gBattle_BG1_X
	strh r4, [r0]
	ldr r0, _080CE6F0 @ =gBattle_BG1_Y
	strh r4, [r0]
	ldr r0, _080CE6F4 @ =gBattle_BG2_X
	strh r4, [r0]
	ldr r0, _080CE6F8 @ =gBattle_BG2_Y
	strh r4, [r0]
	ldr r1, _080CE6FC @ =gBattle_BG3_X
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080CE700 @ =gBattle_BG3_Y
	strh r4, [r0]
	ldr r2, _080CE704 @ =gTextFlags
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080CE708 @ =sub_80D00D8
	bl SetVBlankCallback
	ldr r0, _080CE70C @ =sub_80CE72C
	bl SetMainCallback2
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE6B0: .4byte gStringVar1
_080CE6B4: .4byte gStringVar2
_080CE6B8: .4byte gSpeciesNames
_080CE6BC: .4byte gAffineAnimsDisabled
_080CE6C0: .4byte gUnknown_2039A20
_080CE6C4: .4byte gMonFrontPicTable
_080CE6C8: .4byte gMonSpritesGfxPtr
_080CE6CC: .4byte gMultiuseSpriteTemplate
_080CE6D0: .4byte gDummySpriteAffineAnimTable
_080CE6D4: .4byte gSprites
_080CE6D8: .4byte nullsub_10
_080CE6DC: .4byte sub_80CF53C
_080CE6E0: .4byte gTasks
_080CE6E4: .4byte gBattle_BG0_X
_080CE6E8: .4byte gBattle_BG0_Y
_080CE6EC: .4byte gBattle_BG1_X
_080CE6F0: .4byte gBattle_BG1_Y
_080CE6F4: .4byte gBattle_BG2_X
_080CE6F8: .4byte gBattle_BG2_Y
_080CE6FC: .4byte gBattle_BG3_X
_080CE700: .4byte gBattle_BG3_Y
_080CE704: .4byte gTextFlags
_080CE708: .4byte sub_80D00D8
_080CE70C: .4byte sub_80CE72C
	thumb_func_end TradeEvolutionScene

	thumb_func_start sub_80CE710
sub_80CE710: @ 80CE710
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	thumb_func_end sub_80CE710

	thumb_func_start sub_80CE72C
sub_80CE72C: @ 80CE72C
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	thumb_func_end sub_80CE72C

	thumb_func_start CreateShedinja
CreateShedinja: @ 80CE748
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	str r1, [sp, 0x4]
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	movs r0, 0
	str r0, [sp]
	mov r0, r10
	lsls r0, 2
	str r0, [sp, 0x8]
	add r0, r10
	lsls r7, r0, 3
	ldr r1, _080CE8C4 @ =gEvolutionTable
	adds r1, r7
	mov r8, r1
	ldrh r0, [r1]
	cmp r0, 0xD
	beq _080CE778
	b _080CE8B2
_080CE778:
	ldr r6, _080CE8C8 @ =gPlayerPartyCount
	ldrb r0, [r6]
	cmp r0, 0x5
	bls _080CE782
	b _080CE8B2
_080CE782:
	movs r5, 0x64
	muls r0, r5
	ldr r4, _080CE8CC @ =gPlayerParty
	adds r0, r4
	mov r9, r0
	ldr r1, [sp, 0x4]
	movs r2, 0x64
	bl CopyMon
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	ldr r1, _080CE8C4 @ =gEvolutionTable
	adds r2, r1, r7
	adds r2, 0xC
	movs r1, 0xB
	bl SetMonData
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	mov r1, r8
	ldrh r2, [r1, 0xC]
	movs r1, 0xB
	muls r2, r1
	ldr r1, _080CE8D0 @ =gSpeciesNames
	adds r2, r1
	movs r1, 0x2
	bl SetMonData
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0x8
	mov r2, sp
	bl SetMonData
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0xA
	mov r2, sp
	bl SetMonData
	movs r4, 0x32
	ldr r0, [sp, 0x8]
	mov r8, r0
	adds r5, r6, 0
_080CE7F0:
	ldrb r1, [r5]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080CE8CC @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	mov r2, sp
	bl SetMonData
	adds r4, 0x1
	cmp r4, 0x36
	ble _080CE7F0
	movs r4, 0x43
	ldr r7, _080CE8C8 @ =gPlayerPartyCount
_080CE80C:
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080CE8CC @ =gPlayerParty
	adds r0, r5
	adds r1, r4, 0
	mov r2, sp
	bl SetMonData
	adds r4, 0x1
	cmp r4, 0x4F
	ble _080CE80C
	ldr r4, _080CE8C8 @ =gPlayerPartyCount
	ldrb r0, [r4]
	muls r0, r6
	adds r0, r5
	movs r1, 0x37
	mov r2, sp
	bl SetMonData
	movs r0, 0xFF
	str r0, [sp]
	ldrb r0, [r4]
	muls r0, r6
	adds r0, r5
	movs r1, 0x40
	mov r2, sp
	bl SetMonData
	ldrb r0, [r4]
	muls r0, r6
	adds r0, r5
	bl CalculateMonStats
	bl CalculatePlayerPartyCount
	ldr r0, _080CE8C4 @ =gEvolutionTable
	mov r4, r8
	add r4, r10
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0xC]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl GetSetPokedexFlag
	ldrh r0, [r4, 0xC]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl GetSetPokedexFlag
	mov r0, r9
	movs r1, 0xB
	bl GetMonData
	ldr r1, _080CE8D4 @ =0x0000012f
	cmp r0, r1
	bne _080CE8B2
	mov r0, r9
	movs r1, 0x3
	bl GetMonData
	cmp r0, 0x1
	bne _080CE8B2
	ldr r0, [sp, 0x4]
	movs r1, 0xB
	bl GetMonData
	movs r1, 0x97
	lsls r1, 1
	cmp r0, r1
	bne _080CE8B2
	ldr r2, _080CE8D8 @ =gUnknown_83F8440
	mov r0, r9
	movs r1, 0x2
	bl SetMonData
_080CE8B2:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE8C4: .4byte gEvolutionTable
_080CE8C8: .4byte gPlayerPartyCount
_080CE8CC: .4byte gPlayerParty
_080CE8D0: .4byte gSpeciesNames
_080CE8D4: .4byte 0x0000012f
_080CE8D8: .4byte gUnknown_83F8440
	thumb_func_end CreateShedinja

	thumb_func_start sub_80CE8DC
sub_80CE8DC: @ 80CE8DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, _080CE93C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r5, r0, r4
	movs r0, 0x1C
	ldrsh r1, [r5, r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080CE940 @ =gPlayerParty
	adds r1, r0
	mov r9, r1
	bl sub_806E25C
	mov r10, r4
	cmp r0, 0
	bne _080CE948
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x8
	bne _080CE948
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	cmp r0, 0x97
	ble _080CE948
	movs r0, 0x11
	strh r0, [r5, 0x8]
	movs r2, 0x1
	strh r2, [r5, 0x1A]
	ldr r0, _080CE944 @ =gBattleCommunication
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	add r0, r10
	strh r2, [r0, 0x18]
	bl sub_80D04A8
	bl _080CF528
	.align 2, 0
_080CE93C: .4byte gTasks
_080CE940: .4byte gPlayerParty
_080CE944: .4byte gBattleCommunication
_080CE948:
	ldr r0, _080CE9A0 @ =gMain
	ldrh r1, [r0, 0x2C]
	ldr r3, _080CE9A4 @ =gTasks
	mov r10, r3
	lsls r2, r7, 2
	mov r8, r2
	adds r5, r0, 0
	cmp r1, 0x2
	bne _080CE9AC
	adds r0, r2, r7
	lsls r0, 3
	adds r2, r0, r3
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	cmp r0, 0x8
	bne _080CE9AC
	ldr r4, _080CE9A8 @ =gBattleCommunication
	ldrb r0, [r4, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	add r1, r10
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _080CE9AC
	ldrh r1, [r2, 0xE]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080CE9AC
	movs r0, 0x11
	strh r0, [r2, 0x8]
	ldrb r1, [r4, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	add r0, r10
	strh r3, [r0, 0x18]
	bl sub_80D04A8
	bl _080CF528
	.align 2, 0
_080CE9A0: .4byte gMain
_080CE9A4: .4byte gTasks
_080CE9A8: .4byte gBattleCommunication
_080CE9AC:
	mov r1, r8
	adds r0, r1, r7
	lsls r0, 3
	add r0, r10
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	cmp r0, 0x16
	bls _080CE9C0
	bl _080CF528
_080CE9C0:
	lsls r0, 2
	ldr r1, _080CE9CC @ =_080CE9D0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CE9CC: .4byte _080CE9D0
	.align 2, 0
_080CE9D0:
	.4byte _080CEA2C
	.4byte _080CEA90
	.4byte _080CEAD0
	.4byte _080CEAF0
	.4byte _080CEB18
	.4byte _080CEB58
	.4byte _080CEB90
	.4byte _080CEBD0
	.4byte _080CEC08
	.4byte _080CEC4C
	.4byte _080CEC68
	.4byte _080CEC94
	.4byte _080CECC0
	.4byte _080CED0C
	.4byte _080CED2C
	.4byte _080CEDB8
	.4byte _080CEE60
	.4byte _080CEED0
	.4byte _080CEF10
	.4byte _080CEF3C
	.4byte _080CEF9C
	.4byte _080CEFF8
	.4byte _080CF034
_080CEA2C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _080CEA84 @ =gSprites
	ldr r0, _080CEA88 @ =gUnknown_2039A20
	ldr r0, [r0]
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r0, _080CEA8C @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	bl _080CF528
	.align 2, 0
_080CEA84: .4byte gSprites
_080CEA88: .4byte gUnknown_2039A20
_080CEA8C: .4byte gTasks
_080CEA90:
	ldr r0, _080CEAC0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080CEAA0
	bl _080CF528
_080CEAA0:
	ldr r4, _080CEAC4 @ =gStringVar4
	ldr r1, _080CEAC8 @ =gUnknown_83FE672
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0
	bl BattlePutTextOnWindow
	ldr r0, _080CEACC @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	b _080CEFDE
	.align 2, 0
_080CEAC0: .4byte gPaletteFade
_080CEAC4: .4byte gStringVar4
_080CEAC8: .4byte gUnknown_83FE672
_080CEACC: .4byte gTasks
_080CEAD0:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	beq _080CEAE0
	bl _080CF528
_080CEAE0:
	ldr r0, _080CEAEC @ =gTasks
	mov r3, r8
	adds r4, r3, r7
	lsls r4, 3
	adds r4, r0
	b _080CEF26
	.align 2, 0
_080CEAEC: .4byte gTasks
_080CEAF0:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _080CEAFE
	bl _080CF528
_080CEAFE:
	ldr r0, _080CEB10 @ =0x00000107
	bl PlaySE
	ldr r0, _080CEB14 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	b _080CEFDE
	.align 2, 0
_080CEB10: .4byte 0x00000107
_080CEB14: .4byte gTasks
_080CEB18:
	bl IsSEPlaying
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080CEB28
	bl _080CF528
_080CEB28:
	movs r0, 0x84
	lsls r0, 1
	bl PlayNewMapMusic
	ldr r0, _080CEB54 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r4, [sp]
	movs r0, 0x1C
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	bl _080CF528
	.align 2, 0
_080CEB54: .4byte gTasks
_080CEB58:
	ldr r0, _080CEB84 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080CEB68
	bl _080CF528
_080CEB68:
	movs r0, 0
	bl InitMovingBackgroundTask
	movs r0, 0x11
	bl LaunchTask_PreEvoSparklesSet1
	ldr r1, _080CEB88 @ =gBattleCommunication
	strb r0, [r1, 0x2]
	ldr r0, _080CEB8C @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	b _080CEFDE
	.align 2, 0
_080CEB84: .4byte gPaletteFade
_080CEB88: .4byte gBattleCommunication
_080CEB8C: .4byte gTasks
_080CEB90:
	ldr r4, _080CEBC8 @ =gBattleCommunication
	ldrb r0, [r4, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	add r1, r10
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _080CEBA6
	bl _080CF528
_080CEBA6:
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	add r1, r10
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r0, _080CEBCC @ =gUnknown_2039A20
	ldr r1, [r0]
	movs r0, 0x1
	strb r0, [r1, 0x3]
	bl sub_80F5EC0
	strb r0, [r4, 0x2]
	bl _080CF528
	.align 2, 0
_080CEBC8: .4byte gBattleCommunication
_080CEBCC: .4byte gUnknown_2039A20
_080CEBD0:
	ldr r4, _080CEC00 @ =gBattleCommunication
	ldrb r0, [r4, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	add r1, r10
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _080CEBE6
	bl _080CF528
_080CEBE6:
	ldr r0, _080CEC04 @ =gUnknown_2039A20
	ldr r1, [r0]
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	bl sub_80F62B4
	strb r0, [r4, 0x2]
	mov r0, r8
	adds r1, r0, r7
	lsls r1, 3
	add r1, r10
	b _080CEFDE
	.align 2, 0
_080CEC00: .4byte gBattleCommunication
_080CEC04: .4byte gUnknown_2039A20
_080CEC08:
	ldr r2, _080CEC44 @ =gUnknown_2039A20
	ldr r1, [r2]
	ldrb r0, [r1, 0x3]
	subs r0, 0x1
	strb r0, [r1, 0x3]
	lsls r0, 24
	cmp r0, 0
	beq _080CEC1C
	bl _080CF528
_080CEC1C:
	ldr r1, [r2]
	movs r0, 0x3
	strb r0, [r1, 0x3]
	ldr r0, _080CEC48 @ =gBattleCommunication
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	add r0, r10
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _080CEC38
	bl _080CF528
_080CEC38:
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	add r1, r10
	b _080CEFDE
	.align 2, 0
_080CEC44: .4byte gUnknown_2039A20
_080CEC48: .4byte gBattleCommunication
_080CEC4C:
	bl sub_80F5F74
	ldr r1, _080CEC60 @ =gBattleCommunication
	strb r0, [r1, 0x2]
	ldr r0, _080CEC64 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	b _080CEFDE
	.align 2, 0
_080CEC60: .4byte gBattleCommunication
_080CEC64: .4byte gTasks
_080CEC68:
	ldr r6, _080CEC90 @ =gBattleCommunication
	ldrb r0, [r6, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	add r1, r10
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _080CEC7E
	bl _080CF528
_080CEC7E:
	mov r0, r8
	adds r4, r0, r7
	lsls r4, 3
	add r4, r10
	ldrh r0, [r4, 0xC]
	bl LaunchTask_PostEvoSparklesSet2AndFlash
	strb r0, [r6, 0x2]
	b _080CEF2E
	.align 2, 0
_080CEC90: .4byte gBattleCommunication
_080CEC94:
	ldr r0, _080CECBC @ =gBattleCommunication
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	add r0, r10
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _080CECAA
	bl _080CF528
_080CECAA:
	movs r0, 0x1B
	bl PlaySE
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	add r1, r10
	b _080CEFDE
	.align 2, 0
_080CECBC: .4byte gBattleCommunication
_080CECC0:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _080CECCE
	bl _080CF528
_080CECCE:
	bl m4aMPlayAllStop
	ldr r0, _080CED00 @ =gPlttBufferUnfaded + 0x40
	ldr r1, _080CED04 @ =gUnknown_2039A20
	ldr r1, [r1]
	adds r1, 0x4
	movs r2, 0x60
	bl memcpy
	bl sub_80D04E8
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1C
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080CED08 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	b _080CEFDE
	.align 2, 0
_080CED00: .4byte gPlttBufferUnfaded + 0x40
_080CED04: .4byte gUnknown_2039A20
_080CED08: .4byte gTasks
_080CED0C:
	ldr r0, _080CED28 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080CED1C
	bl _080CF528
_080CED1C:
	mov r0, r8
	adds r4, r0, r7
	lsls r4, 3
	add r4, r10
	ldrh r0, [r4, 0xC]
	b _080CEF28
	.align 2, 0
_080CED28: .4byte gPaletteFade
_080CED2C:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _080CED3A
	bl _080CF528
_080CED3A:
	ldr r4, _080CEDA8 @ =gStringVar4
	ldr r1, _080CEDAC @ =gUnknown_83FE688
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0
	bl BattlePutTextOnWindow
	ldr r0, _080CEDB0 @ =0x00000103
	bl PlayBGM
	ldr r2, _080CEDB4 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	adds r2, r1
	adds r2, 0xC
	mov r0, r9
	movs r1, 0xB
	bl SetMonData
	mov r0, r9
	bl CalculateMonStats
	ldrh r1, [r4, 0xA]
	ldrh r2, [r4, 0xC]
	mov r0, r9
	bl EvolutionRenameMon
	ldrh r0, [r4, 0xC]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl GetSetPokedexFlag
	ldrh r0, [r4, 0xC]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl GetSetPokedexFlag
	movs r0, 0xE
	bl IncrementGameStat
	b _080CF528
	.align 2, 0
_080CEDA8: .4byte gStringVar4
_080CEDAC: .4byte gUnknown_83FE688
_080CEDB0: .4byte 0x00000103
_080CEDB4: .4byte gTasks
_080CEDB8:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	beq _080CEDC6
	b _080CF528
_080CEDC6:
	bl sub_812B484
	ldr r1, _080CEE20 @ =gTasks
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 3
	adds r5, r0, r1
	ldrb r1, [r5, 0x10]
	mov r0, r9
	bl MonTryLearningNewMove
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0
	beq _080CEE40
	movs r3, 0x1A
	ldrsh r4, [r5, r3]
	cmp r4, 0
	bne _080CEE40
	bl StopMapMusic
	bl Overworld_PlaySpecialMapMusic
	ldrh r1, [r5, 0xE]
	movs r0, 0x80
	orrs r0, r1
	strh r0, [r5, 0xE]
	strh r4, [r5, 0x10]
	strh r4, [r5, 0x14]
	mov r0, r9
	movs r1, 0x2
	add r2, sp, 0x4
	bl GetMonData
	ldr r0, _080CEE24 @ =gBattleTextBuff1
	add r1, sp, 0x4
	bl StringCopy10
	ldr r0, _080CEE28 @ =0x0000ffff
	cmp r6, r0
	bne _080CEE2C
	movs r0, 0x16
	strh r0, [r5, 0x8]
	b _080CF528
	.align 2, 0
_080CEE20: .4byte gTasks
_080CEE24: .4byte gBattleTextBuff1
_080CEE28: .4byte 0x0000ffff
_080CEE2C:
	ldr r0, _080CEE3C @ =0x0000fffe
	cmp r6, r0
	bne _080CEE34
	b _080CF528
_080CEE34:
	movs r0, 0x14
	strh r0, [r5, 0x8]
	b _080CF528
	.align 2, 0
_080CEE3C: .4byte 0x0000fffe
_080CEE40:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080CEE5C @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	b _080CEFDE
	.align 2, 0
_080CEE5C: .4byte gTasks
_080CEE60:
	ldr r0, _080CEEC4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r2, 0x80
	adds r0, r2, 0
	ands r0, r1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _080CEE74
	b _080CF528
_080CEE74:
	mov r3, r8
	adds r0, r3, r7
	lsls r0, 3
	mov r1, r10
	adds r4, r0, r1
	ldrh r1, [r4, 0xE]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080CEE90
	bl StopMapMusic
	bl Overworld_PlaySpecialMapMusic
_080CEE90:
	movs r2, 0x1A
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080CEEA0
	ldrh r0, [r4, 0xA]
	mov r1, r9
	bl CreateShedinja
_080CEEA0:
	adds r0, r7, 0
	bl DestroyTask
	bl FreeMonSpritesGfx
	ldr r4, _080CEEC8 @ =gUnknown_2039A20
	ldr r0, [r4]
	bl Free
	str r6, [r4]
	bl FreeAllWindowBuffers
	ldr r0, _080CEECC @ =gUnknown_300537C
	ldr r0, [r0]
	bl SetMainCallback2
	b _080CF528
	.align 2, 0
_080CEEC4: .4byte gPaletteFade
_080CEEC8: .4byte gUnknown_2039A20
_080CEECC: .4byte gUnknown_300537C
_080CEED0:
	ldr r0, _080CEF04 @ =gBattleCommunication
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	add r0, r10
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _080CEEE4
	b _080CF528
_080CEEE4:
	bl m4aMPlayAllStop
	ldr r0, _080CEF08 @ =0x0006001c
	ldr r1, _080CEF0C @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	add r1, r10
	b _080CEFDE
	.align 2, 0
_080CEF04: .4byte gBattleCommunication
_080CEF08: .4byte 0x0006001c
_080CEF0C: .4byte 0x00007fff
_080CEF10:
	ldr r0, _080CEF38 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080CEF1E
	b _080CF528
_080CEF1E:
	mov r0, r8
	adds r4, r0, r7
	lsls r4, 3
	add r4, r10
_080CEF26:
	ldrh r0, [r4, 0xA]
_080CEF28:
	movs r1, 0
	bl PlayCry1
_080CEF2E:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080CF528
	.align 2, 0
_080CEF38: .4byte gPaletteFade
_080CEF3C:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _080CEF48
	b _080CF528
_080CEF48:
	ldr r0, _080CEF64 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	movs r3, 0x1A
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080CEF70
	ldr r0, _080CEF68 @ =gStringVar4
	ldr r1, _080CEF6C @ =gUnknown_83FE6D0
	bl StringExpandPlaceholders
	b _080CEF78
	.align 2, 0
_080CEF64: .4byte gTasks
_080CEF68: .4byte gStringVar4
_080CEF6C: .4byte gUnknown_83FE6D0
_080CEF70:
	ldr r0, _080CEF90 @ =gStringVar4
	ldr r1, _080CEF94 @ =gUnknown_83FE6B5
	bl StringExpandPlaceholders
_080CEF78:
	ldr r0, _080CEF90 @ =gStringVar4
	movs r1, 0
	bl BattlePutTextOnWindow
	ldr r1, _080CEF98 @ =gTasks
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x1A]
	b _080CF4F2
	.align 2, 0
_080CEF90: .4byte gStringVar4
_080CEF94: .4byte gUnknown_83FE6B5
_080CEF98: .4byte gTasks
_080CEF9C:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	beq _080CEFAA
	b _080CF528
_080CEFAA:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _080CEFB6
	b _080CF528
_080CEFB6:
	bl BufferMoveToLearnIntoBattleTextBuff2
	ldr r0, _080CEFE8 @ =0x00000101
	bl PlayFanfare
	ldr r0, _080CEFEC @ =gUnknown_83FDF3C
	ldr r0, [r0, 0xC]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _080CEFF0 @ =gDisplayedStringBattle
	movs r1, 0
	bl BattlePutTextOnWindow
	ldr r0, _080CEFF4 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x40
	strh r0, [r1, 0x10]
_080CEFDE:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080CF528
	.align 2, 0
_080CEFE8: .4byte 0x00000101
_080CEFEC: .4byte gUnknown_83FDF3C
_080CEFF0: .4byte gDisplayedStringBattle
_080CEFF4: .4byte gTasks
_080CEFF8:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	beq _080CF006
	b _080CF528
_080CF006:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _080CF012
	b _080CF528
_080CF012:
	ldr r0, _080CF030 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x10]
	subs r0, 0x1
	strh r0, [r1, 0x10]
	lsls r0, 16
	cmp r0, 0
	beq _080CF02A
	b _080CF528
_080CF02A:
	movs r0, 0xF
	strh r0, [r1, 0x8]
	b _080CF528
	.align 2, 0
_080CF030: .4byte gTasks
_080CF034:
	mov r3, r8
	adds r0, r3, r7
	lsls r0, 3
	add r0, r10
	movs r1, 0x14
	ldrsh r0, [r0, r1]
	cmp r0, 0xC
	bls _080CF046
	b _080CF528
_080CF046:
	lsls r0, 2
	ldr r1, _080CF050 @ =_080CF054
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CF050: .4byte _080CF054
	.align 2, 0
_080CF054:
	.4byte _080CF088
	.4byte _080CF0D4
	.4byte _080CF11C
	.4byte _080CF15A
	.4byte _080CF1BC
	.4byte _080CF2B4
	.4byte _080CF30C
	.4byte _080CF3E0
	.4byte _080CF414
	.4byte _080CF45C
	.4byte _080CF4A4
	.4byte _080CF4D8
	.4byte _080CF504
_080CF088:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	beq _080CF096
	b _080CF528
_080CF096:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _080CF0A2
	b _080CF528
_080CF0A2:
	bl BufferMoveToLearnIntoBattleTextBuff2
	ldr r0, _080CF0C8 @ =gUnknown_83FDF3C
	ldr r0, [r0, 0x10]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _080CF0CC @ =gDisplayedStringBattle
	movs r1, 0
	bl BattlePutTextOnWindow
	ldr r0, _080CF0D0 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x14]
	adds r0, 0x1
	b _080CF526
	.align 2, 0
_080CF0C8: .4byte gUnknown_83FDF3C
_080CF0CC: .4byte gDisplayedStringBattle
_080CF0D0: .4byte gTasks
_080CF0D4:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	beq _080CF0E2
	b _080CF528
_080CF0E2:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _080CF0EE
	b _080CF528
_080CF0EE:
	ldr r0, _080CF110 @ =gUnknown_83FDF3C
	ldr r0, [r0, 0x14]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _080CF114 @ =gDisplayedStringBattle
	movs r1, 0
	bl BattlePutTextOnWindow
	ldr r0, _080CF118 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x14]
	adds r0, 0x1
	b _080CF526
	.align 2, 0
_080CF110: .4byte gUnknown_83FDF3C
_080CF114: .4byte gDisplayedStringBattle
_080CF118: .4byte gTasks
_080CF11C:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _080CF15A
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _080CF15A
	ldr r0, _080CF1A8 @ =gUnknown_83FDF3C
	ldr r0, [r0, 0x18]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _080CF1AC @ =gDisplayedStringBattle
	movs r1, 0
	bl BattlePutTextOnWindow
	ldr r0, _080CF1B0 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x5
	strh r0, [r1, 0x16]
	movs r0, 0xA
	strh r0, [r1, 0x18]
	ldrh r0, [r1, 0x14]
	adds r0, 0x1
	strh r0, [r1, 0x14]
_080CF15A:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	beq _080CF168
	b _080CF528
_080CF168:
	bl IsSEPlaying
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080CF176
	b _080CF528
_080CF176:
	str r0, [sp]
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl HandleBattleWindow
	ldr r0, _080CF1B4 @ =gText_BattleYesNoChoice
	movs r1, 0xE
	bl BattlePutTextOnWindow
	ldr r0, _080CF1B0 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x14]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r1, 0x14]
	ldr r0, _080CF1B8 @ =gBattleCommunication
	strb r2, [r0, 0x1]
	bl BattleCreateYesNoCursorAt
	b _080CF528
	.align 2, 0
_080CF1A8: .4byte gUnknown_83FDF3C
_080CF1AC: .4byte gDisplayedStringBattle
_080CF1B0: .4byte gTasks
_080CF1B4: .4byte gText_BattleYesNoChoice
_080CF1B8: .4byte gBattleCommunication
_080CF1BC:
	ldr r0, _080CF244 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080CF1E2
	ldr r4, _080CF248 @ =gBattleCommunication
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _080CF1E2
	movs r0, 0x5
	bl PlaySE
	bl BattleDestroyYesNoCursorAt
	movs r0, 0
	strb r0, [r4, 0x1]
	bl BattleCreateYesNoCursorAt
_080CF1E2:
	ldr r0, _080CF244 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080CF208
	ldr r4, _080CF248 @ =gBattleCommunication
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _080CF208
	movs r0, 0x5
	bl PlaySE
	bl BattleDestroyYesNoCursorAt
	movs r0, 0x1
	strb r0, [r4, 0x1]
	bl BattleCreateYesNoCursorAt
_080CF208:
	ldr r0, _080CF244 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080CF276
	str r2, [sp]
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl HandleBattleWindow
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080CF248 @ =gBattleCommunication
	ldrb r2, [r0, 0x1]
	cmp r2, 0
	beq _080CF250
	ldr r0, _080CF24C @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	strh r0, [r1, 0x14]
	b _080CF276
	.align 2, 0
_080CF244: .4byte gMain
_080CF248: .4byte gBattleCommunication
_080CF24C: .4byte gTasks
_080CF250:
	ldr r0, _080CF2AC @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x16]
	strh r0, [r1, 0x14]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _080CF276
	movs r0, 0x1
	negs r0, r0
	str r2, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_080CF276:
	ldr r0, _080CF2B0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080CF284
	b _080CF528
_080CF284:
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl HandleBattleWindow
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080CF2AC @ =gTasks
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x18]
	strh r1, [r0, 0x14]
	b _080CF528
	.align 2, 0
_080CF2AC: .4byte gTasks
_080CF2B0: .4byte gMain
_080CF2B4:
	ldr r0, _080CF2F4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080CF2C2
	b _080CF528
_080CF2C2:
	bl FreeAllWindowBuffers
	ldr r0, _080CF2F8 @ =gPlayerParty
	ldr r1, _080CF2FC @ =gTasks
	mov r3, r8
	adds r5, r3, r7
	lsls r5, 3
	adds r5, r1
	ldrb r1, [r5, 0x1C]
	ldr r2, _080CF300 @ =gPlayerPartyCount
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080CF304 @ =CB2_EvolutionSceneLoadGraphics
	ldr r4, _080CF308 @ =gMoveToLearn
	ldrh r4, [r4]
	str r4, [sp]
	bl sub_8134738
	ldrh r0, [r5, 0x14]
	adds r0, 0x1
	strh r0, [r5, 0x14]
	b _080CF528
	.align 2, 0
_080CF2F4: .4byte gPaletteFade
_080CF2F8: .4byte gPlayerParty
_080CF2FC: .4byte gTasks
_080CF300: .4byte gPlayerPartyCount
_080CF304: .4byte CB2_EvolutionSceneLoadGraphics
_080CF308: .4byte gMoveToLearn
_080CF30C:
	ldr r0, _080CF340 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080CF31A
	b _080CF528
_080CF31A:
	ldr r1, [r5, 0x4]
	ldr r0, _080CF344 @ =sub_80CE710
	cmp r1, r0
	beq _080CF324
	b _080CF528
_080CF324:
	bl sub_8138B2C
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x4
	bne _080CF34C
	ldr r0, _080CF348 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0xA
	b _080CF526
	.align 2, 0
_080CF340: .4byte gPaletteFade
_080CF344: .4byte sub_80CE710
_080CF348: .4byte gTasks
_080CF34C:
	adds r1, r6, 0
	adds r1, 0xD
	mov r0, r9
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl IsHMMove2
	cmp r0, 0
	beq _080CF398
	ldr r0, _080CF388 @ =gUnknown_83FDF3C
	ldr r3, _080CF38C @ =0x000004cc
	adds r0, r3
	ldr r0, [r0]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _080CF390 @ =gDisplayedStringBattle
	movs r1, 0
	bl BattlePutTextOnWindow
	ldr r1, _080CF394 @ =gTasks
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0xC
	strh r1, [r0, 0x14]
	b _080CF528
	.align 2, 0
_080CF388: .4byte gUnknown_83FDF3C
_080CF38C: .4byte 0x000004cc
_080CF390: .4byte gDisplayedStringBattle
_080CF394: .4byte gTasks
_080CF398:
	ldr r1, _080CF3D4 @ =gBattleTextBuff2
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	strb r4, [r1, 0x2]
	lsrs r0, r4, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	lsls r4, r6, 24
	lsrs r4, 24
	mov r0, r9
	adds r1, r4, 0
	bl RemoveMonPPBonus
	ldr r0, _080CF3D8 @ =gMoveToLearn
	ldrh r1, [r0]
	mov r0, r9
	adds r2, r4, 0
	bl SetMonMoveSlot
	ldr r0, _080CF3DC @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x14]
	adds r0, 0x1
	b _080CF526
	.align 2, 0
_080CF3D4: .4byte gBattleTextBuff2
_080CF3D8: .4byte gMoveToLearn
_080CF3DC: .4byte gTasks
_080CF3E0:
	ldr r0, _080CF408 @ =gUnknown_83FDF3C
	movs r1, 0xCF
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _080CF40C @ =gDisplayedStringBattle
	movs r1, 0
	bl BattlePutTextOnWindow
	ldr r0, _080CF410 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x14]
	adds r0, 0x1
	b _080CF526
	.align 2, 0
_080CF408: .4byte gUnknown_83FDF3C
_080CF40C: .4byte gDisplayedStringBattle
_080CF410: .4byte gTasks
_080CF414:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	beq _080CF422
	b _080CF528
_080CF422:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _080CF42E
	b _080CF528
_080CF42E:
	ldr r0, _080CF450 @ =gUnknown_83FDF3C
	ldr r0, [r0, 0x1C]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _080CF454 @ =gDisplayedStringBattle
	movs r1, 0
	bl BattlePutTextOnWindow
	ldr r0, _080CF458 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x14]
	adds r0, 0x1
	b _080CF526
	.align 2, 0
_080CF450: .4byte gUnknown_83FDF3C
_080CF454: .4byte gDisplayedStringBattle
_080CF458: .4byte gTasks
_080CF45C:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _080CF528
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _080CF528
	ldr r0, _080CF498 @ =gUnknown_83FDF3C
	movs r1, 0xD0
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _080CF49C @ =gDisplayedStringBattle
	movs r1, 0
	bl BattlePutTextOnWindow
	ldr r1, _080CF4A0 @ =gTasks
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0x14
	strh r1, [r0, 0x8]
	b _080CF528
	.align 2, 0
_080CF498: .4byte gUnknown_83FDF3C
_080CF49C: .4byte gDisplayedStringBattle
_080CF4A0: .4byte gTasks
_080CF4A4:
	ldr r0, _080CF4CC @ =gUnknown_83FDF3C
	ldr r0, [r0, 0x20]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _080CF4D0 @ =gDisplayedStringBattle
	movs r1, 0
	bl BattlePutTextOnWindow
	ldr r1, _080CF4D4 @ =gTasks
	mov r3, r8
	adds r0, r3, r7
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0xB
	strh r1, [r0, 0x16]
	strh r2, [r0, 0x18]
	movs r1, 0x3
	strh r1, [r0, 0x14]
	b _080CF528
	.align 2, 0
_080CF4CC: .4byte gUnknown_83FDF3C
_080CF4D0: .4byte gDisplayedStringBattle
_080CF4D4: .4byte gTasks
_080CF4D8:
	ldr r0, _080CF4F8 @ =gUnknown_83FDF3C
	ldr r0, [r0, 0x24]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _080CF4FC @ =gDisplayedStringBattle
	movs r1, 0
	bl BattlePutTextOnWindow
	ldr r1, _080CF500 @ =gTasks
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
_080CF4F2:
	movs r1, 0xF
	strh r1, [r0, 0x8]
	b _080CF528
	.align 2, 0
_080CF4F8: .4byte gUnknown_83FDF3C
_080CF4FC: .4byte gDisplayedStringBattle
_080CF500: .4byte gTasks
_080CF504:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _080CF528
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _080CF528
	ldr r0, _080CF538 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x5
_080CF526:
	strh r0, [r1, 0x14]
_080CF528:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CF538: .4byte gTasks
	thumb_func_end sub_80CE8DC

	thumb_func_start sub_80CF53C
sub_80CF53C: @ 80CF53C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x20
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _080CF5BC @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r5
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080CF5C0 @ =gPlayerParty
	adds r1, r0
	mov r8, r1
	bl sub_806E25C
	cmp r0, 0
	bne _080CF598
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bne _080CF598
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0x97
	ble _080CF598
	movs r0, 0xF
	strh r0, [r4, 0x8]
	movs r2, 0x1
	strh r2, [r4, 0x1A]
	ldr r0, _080CF5C4 @ =gBattleCommunication
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r1, r0, r5
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _080CF598
	strh r2, [r1, 0x18]
	bl sub_80D04A8
_080CF598:
	ldr r0, _080CF5BC @ =gTasks
	lsls r2, r6, 2
	adds r1, r2, r6
	lsls r1, 3
	adds r1, r0
	movs r3, 0x8
	ldrsh r1, [r1, r3]
	adds r5, r0, 0
	adds r7, r2, 0
	cmp r1, 0x14
	bls _080CF5B2
	bl _080D003A
_080CF5B2:
	lsls r0, r1, 2
	ldr r1, _080CF5C8 @ =_080CF5CC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CF5BC: .4byte gTasks
_080CF5C0: .4byte gPlayerParty
_080CF5C4: .4byte gBattleCommunication
_080CF5C8: .4byte _080CF5CC
	.align 2, 0
_080CF5CC:
	.4byte _080CF620
	.4byte _080CF64C
	.4byte _080CF66C
	.4byte _080CF69C
	.4byte _080CF6D0
	.4byte _080CF73C
	.4byte _080CF778
	.4byte _080CF7AC
	.4byte _080CF7EC
	.4byte _080CF808
	.4byte _080CF838
	.4byte _080CF860
	.4byte _080CF89C
	.4byte _080CF924
	.4byte _080CF9D0
	.4byte _080CFA14
	.4byte _080CFA74
	.4byte _080CFA9C
	.4byte _080CFAD8
	.4byte _080CFB34
	.4byte _080CFB70
_080CF620:
	ldr r4, _080CF640 @ =gStringVar4
	ldr r1, _080CF644 @ =gUnknown_83FE672
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0x1
	bl sub_8054508
	ldr r0, _080CF648 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	b _080CFB1A
	.align 2, 0
_080CF640: .4byte gStringVar4
_080CF644: .4byte gUnknown_83FE672
_080CF648: .4byte gTasks
_080CF64C:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	beq _080CF65C
	bl _080D003A
_080CF65C:
	ldr r0, _080CF668 @ =gTasks
	adds r4, r7, r6
	lsls r4, 3
	adds r4, r0
	b _080CFA88
	.align 2, 0
_080CF668: .4byte gTasks
_080CF66C:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _080CF67A
	bl _080D003A
_080CF67A:
	movs r0, 0x84
	lsls r0, 1
	bl m4aSongNumStop
	ldr r0, _080CF694 @ =0x00000107
	bl PlaySE
	ldr r0, _080CF698 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	b _080CFB1A
	.align 2, 0
_080CF694: .4byte 0x00000107
_080CF698: .4byte gTasks
_080CF69C:
	bl IsSEPlaying
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080CF6AC
	bl _080D003A
_080CF6AC:
	movs r0, 0x84
	lsls r0, 1
	bl PlayBGM
	ldr r0, _080CF6CC @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r4, [sp]
	movs r0, 0x1C
	movs r1, 0x4
	b _080CFD56
	.align 2, 0
_080CF6CC: .4byte gTasks
_080CF6D0:
	ldr r0, _080CF724 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080CF6E0
	bl _080D003A
_080CF6E0:
	movs r0, 0x1
	bl InitMovingBackgroundTask
	ldr r2, _080CF728 @ =gSprites
	ldr r0, _080CF72C @ =gUnknown_2039A20
	ldr r0, [r0]
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r5, r0, 0
	adds r5, 0x10
	adds r0, r5, 0
	bl LaunchTask_PreEvoSparklesSet1
	ldr r1, _080CF730 @ =gBattleCommunication
	strb r0, [r1, 0x2]
	ldr r0, _080CF734 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r1, _080CF738 @ =0x00000603
	movs r0, 0xE
	bl SetGpuReg
	bl _080D003A
	.align 2, 0
_080CF724: .4byte gPaletteFade
_080CF728: .4byte gSprites
_080CF72C: .4byte gUnknown_2039A20
_080CF730: .4byte gBattleCommunication
_080CF734: .4byte gTasks
_080CF738: .4byte 0x00000603
_080CF73C:
	ldr r4, _080CF770 @ =gBattleCommunication
	ldrb r0, [r4, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r5
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _080CF752
	bl _080D003A
_080CF752:
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r5
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r0, _080CF774 @ =gUnknown_2039A20
	ldr r1, [r0]
	movs r0, 0x1
	strb r0, [r1, 0x3]
	bl sub_80F5EC0
	strb r0, [r4, 0x2]
	bl _080D003A
	.align 2, 0
_080CF770: .4byte gBattleCommunication
_080CF774: .4byte gUnknown_2039A20
_080CF778:
	ldr r4, _080CF7A4 @ =gBattleCommunication
	ldrb r0, [r4, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r5
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _080CF78E
	bl _080D003A
_080CF78E:
	ldr r0, _080CF7A8 @ =gUnknown_2039A20
	ldr r1, [r0]
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	bl sub_80F62B4
	strb r0, [r4, 0x2]
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r5
	b _080CFB1A
	.align 2, 0
_080CF7A4: .4byte gBattleCommunication
_080CF7A8: .4byte gUnknown_2039A20
_080CF7AC:
	ldr r2, _080CF7E4 @ =gUnknown_2039A20
	ldr r1, [r2]
	ldrb r0, [r1, 0x3]
	subs r0, 0x1
	strb r0, [r1, 0x3]
	lsls r0, 24
	cmp r0, 0
	beq _080CF7C0
	bl _080D003A
_080CF7C0:
	ldr r1, [r2]
	movs r0, 0x3
	strb r0, [r1, 0x3]
	ldr r0, _080CF7E8 @ =gBattleCommunication
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _080CF7DC
	bl _080D003A
_080CF7DC:
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r5
	b _080CFB1A
	.align 2, 0
_080CF7E4: .4byte gUnknown_2039A20
_080CF7E8: .4byte gBattleCommunication
_080CF7EC:
	bl sub_80F5F74
	ldr r1, _080CF800 @ =gBattleCommunication
	strb r0, [r1, 0x2]
	ldr r0, _080CF804 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	b _080CFB1A
	.align 2, 0
_080CF800: .4byte gBattleCommunication
_080CF804: .4byte gTasks
_080CF808:
	ldr r0, _080CF834 @ =gBattleCommunication
	mov r8, r0
	ldrb r0, [r0, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r5
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _080CF820
	bl _080D003A
_080CF820:
	adds r4, r7, r6
	lsls r4, 3
	adds r4, r5
	ldrh r0, [r4, 0xC]
	bl sub_80F6190
	mov r1, r8
	strb r0, [r1, 0x2]
	b _080CFA90
	.align 2, 0
_080CF834: .4byte gBattleCommunication
_080CF838:
	ldr r0, _080CF85C @ =gBattleCommunication
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _080CF84E
	bl _080D003A
_080CF84E:
	movs r0, 0x1B
	bl PlaySE
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r5
	b _080CFB1A
	.align 2, 0
_080CF85C: .4byte gBattleCommunication
_080CF860:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _080CF86E
	bl _080D003A
_080CF86E:
	ldr r0, _080CF890 @ =gTasks
	adds r4, r7, r6
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0xC]
	movs r1, 0
	bl PlayCry1
	ldr r0, _080CF894 @ =gPlttBufferUnfaded + 0x40
	ldr r1, _080CF898 @ =gUnknown_2039A20
	ldr r1, [r1]
	adds r1, 0x4
	movs r2, 0x60
	bl memcpy
	b _080CFA90
	.align 2, 0
_080CF890: .4byte gTasks
_080CF894: .4byte gPlttBufferUnfaded + 0x40
_080CF898: .4byte gUnknown_2039A20
_080CF89C:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _080CF8A8
	b _080D003A
_080CF8A8:
	ldr r4, _080CF914 @ =gStringVar4
	ldr r1, _080CF918 @ =gUnknown_83FE688
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0x1
	bl sub_8054508
	ldr r0, _080CF91C @ =0x00000103
	bl PlayFanfare
	ldr r2, _080CF920 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	adds r2, r1
	adds r2, 0xC
	mov r0, r8
	movs r1, 0xB
	bl SetMonData
	mov r0, r8
	bl CalculateMonStats
	ldrh r1, [r4, 0xA]
	ldrh r2, [r4, 0xC]
	mov r0, r8
	bl EvolutionRenameMon
	ldrh r0, [r4, 0xC]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl GetSetPokedexFlag
	ldrh r0, [r4, 0xC]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl GetSetPokedexFlag
	movs r0, 0xE
	bl IncrementGameStat
	b _080D003A
	.align 2, 0
_080CF914: .4byte gStringVar4
_080CF918: .4byte gUnknown_83FE688
_080CF91C: .4byte 0x00000103
_080CF920: .4byte gTasks
_080CF924:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	beq _080CF932
	b _080D003A
_080CF932:
	bl IsFanfareTaskInactive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080CF940
	b _080D003A
_080CF940:
	ldr r1, _080CF98C @ =gTasks
	adds r0, r7, r6
	lsls r0, 3
	adds r4, r0, r1
	ldrb r1, [r4, 0x10]
	mov r0, r8
	bl MonTryLearningNewMove
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	beq _080CF9AC
	movs r3, 0x1A
	ldrsh r2, [r4, r3]
	cmp r2, 0
	bne _080CF9AC
	ldrh r1, [r4, 0xE]
	movs r0, 0x80
	orrs r0, r1
	strh r0, [r4, 0xE]
	strh r2, [r4, 0x10]
	strh r2, [r4, 0x14]
	mov r0, r8
	movs r1, 0x2
	add r2, sp, 0xC
	bl GetMonData
	ldr r0, _080CF990 @ =gBattleTextBuff1
	add r1, sp, 0xC
	bl StringCopy10
	ldr r0, _080CF994 @ =0x0000ffff
	cmp r5, r0
	bne _080CF998
	movs r0, 0x14
	strh r0, [r4, 0x8]
	b _080D003A
	.align 2, 0
_080CF98C: .4byte gTasks
_080CF990: .4byte gBattleTextBuff1
_080CF994: .4byte 0x0000ffff
_080CF998:
	ldr r0, _080CF9A8 @ =0x0000fffe
	cmp r5, r0
	bne _080CF9A0
	b _080D003A
_080CF9A0:
	movs r0, 0x12
	strh r0, [r4, 0x8]
	b _080D003A
	.align 2, 0
_080CF9A8: .4byte 0x0000fffe
_080CF9AC:
	movs r0, 0x84
	lsls r0, 1
	bl PlayBGM
	ldr r1, _080CF9C8 @ =gUnknown_841E325
	movs r0, 0
	movs r2, 0x1
	bl sub_8054508
	ldr r0, _080CF9CC @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	b _080CFB1A
	.align 2, 0
_080CF9C8: .4byte gUnknown_841E325
_080CF9CC: .4byte gTasks
_080CF9D0:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	beq _080CF9E0
	b _080D003A
_080CF9E0:
	adds r0, r6, 0
	bl DestroyTask
	ldr r4, _080CFA08 @ =gUnknown_2039A20
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r2, _080CFA0C @ =gTextFlags
	ldrb r1, [r2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _080CFA10 @ =gUnknown_300537C
	ldr r0, [r0]
	bl SetMainCallback2
	b _080D003A
	.align 2, 0
_080CFA08: .4byte gUnknown_2039A20
_080CFA0C: .4byte gTextFlags
_080CFA10: .4byte gUnknown_300537C
_080CFA14:
	ldr r0, _080CFA60 @ =gBattleCommunication
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _080CFA28
	b _080D003A
_080CFA28:
	bl m4aMPlayAllStop
	ldr r2, _080CFA64 @ =gSprites
	ldr r0, _080CFA68 @ =gUnknown_2039A20
	ldr r0, [r0]
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	ldr r1, _080CFA6C @ =0x0004001c
	orrs r0, r1
	ldr r1, _080CFA70 @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r5
	b _080CFB1A
	.align 2, 0
_080CFA60: .4byte gBattleCommunication
_080CFA64: .4byte gSprites
_080CFA68: .4byte gUnknown_2039A20
_080CFA6C: .4byte 0x0004001c
_080CFA70: .4byte 0x00007fff
_080CFA74:
	ldr r0, _080CFA98 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080CFA82
	b _080D003A
_080CFA82:
	adds r4, r7, r6
	lsls r4, 3
	adds r4, r5
_080CFA88:
	ldrh r0, [r4, 0xA]
	movs r1, 0
	bl PlayCry1
_080CFA90:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080D003A
	.align 2, 0
_080CFA98: .4byte gPaletteFade
_080CFA9C:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _080CFAA8
	b _080D003A
_080CFAA8:
	ldr r4, _080CFACC @ =gStringVar4
	ldr r1, _080CFAD0 @ =gUnknown_83FE6D0
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0x1
	bl sub_8054508
	ldr r1, _080CFAD4 @ =gTasks
	adds r0, r7, r6
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x1A]
	b _080D0006
	.align 2, 0
_080CFACC: .4byte gStringVar4
_080CFAD0: .4byte gUnknown_83FE6D0
_080CFAD4: .4byte gTasks
_080CFAD8:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	beq _080CFAE6
	b _080D003A
_080CFAE6:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _080CFAF2
	b _080D003A
_080CFAF2:
	bl BufferMoveToLearnIntoBattleTextBuff2
	ldr r0, _080CFB24 @ =0x00000101
	bl PlayFanfare
	ldr r0, _080CFB28 @ =gUnknown_83FDF3C
	ldr r0, [r0, 0xC]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r1, _080CFB2C @ =gDisplayedStringBattle
	movs r0, 0
	movs r2, 0x1
	bl sub_8054508
	ldr r0, _080CFB30 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	movs r0, 0x40
	strh r0, [r1, 0x10]
_080CFB1A:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080D003A
	.align 2, 0
_080CFB24: .4byte 0x00000101
_080CFB28: .4byte gUnknown_83FDF3C
_080CFB2C: .4byte gDisplayedStringBattle
_080CFB30: .4byte gTasks
_080CFB34:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	beq _080CFB42
	b _080D003A
_080CFB42:
	bl IsFanfareTaskInactive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080CFB50
	b _080D003A
_080CFB50:
	ldr r0, _080CFB6C @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x10]
	subs r0, 0x1
	strh r0, [r1, 0x10]
	lsls r0, 16
	cmp r0, 0
	beq _080CFB66
	b _080D003A
_080CFB66:
	movs r0, 0xD
	strh r0, [r1, 0x8]
	b _080D003A
	.align 2, 0
_080CFB6C: .4byte gTasks
_080CFB70:
	adds r0, r7, r6
	lsls r0, 3
	adds r0, r5
	movs r1, 0x14
	ldrsh r0, [r0, r1]
	cmp r0, 0xB
	bls _080CFB80
	b _080D003A
_080CFB80:
	lsls r0, 2
	ldr r1, _080CFB8C @ =_080CFB90
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CFB8C: .4byte _080CFB90
	.align 2, 0
_080CFB90:
	.4byte _080CFBC0
	.4byte _080CFC0C
	.4byte _080CFC54
	.4byte _080CFC92
	.4byte _080CFCFC
	.4byte _080CFDAC
	.4byte _080CFE30
	.4byte _080CFF28
	.4byte _080CFF70
	.4byte _080CFFB8
	.4byte _080CFFEC
	.4byte _080D0018
_080CFBC0:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	beq _080CFBCE
	b _080D003A
_080CFBCE:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _080CFBDA
	b _080D003A
_080CFBDA:
	bl BufferMoveToLearnIntoBattleTextBuff2
	ldr r0, _080CFC00 @ =gUnknown_83FDF3C
	ldr r0, [r0, 0x10]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r1, _080CFC04 @ =gDisplayedStringBattle
	movs r0, 0
	movs r2, 0x1
	bl sub_8054508
	ldr r0, _080CFC08 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x14]
	adds r0, 0x1
	b _080D0038
	.align 2, 0
_080CFC00: .4byte gUnknown_83FDF3C
_080CFC04: .4byte gDisplayedStringBattle
_080CFC08: .4byte gTasks
_080CFC0C:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	beq _080CFC1A
	b _080D003A
_080CFC1A:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _080CFC26
	b _080D003A
_080CFC26:
	ldr r0, _080CFC48 @ =gUnknown_83FDF3C
	ldr r0, [r0, 0x14]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r1, _080CFC4C @ =gDisplayedStringBattle
	movs r0, 0
	movs r2, 0x1
	bl sub_8054508
	ldr r0, _080CFC50 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x14]
	adds r0, 0x1
	b _080D0038
	.align 2, 0
_080CFC48: .4byte gUnknown_83FDF3C
_080CFC4C: .4byte gDisplayedStringBattle
_080CFC50: .4byte gTasks
_080CFC54:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _080CFC92
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _080CFC92
	ldr r0, _080CFCE8 @ =gUnknown_83FDF3C
	ldr r0, [r0, 0x18]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r1, _080CFCEC @ =gDisplayedStringBattle
	movs r0, 0
	movs r2, 0x1
	bl sub_8054508
	ldr r0, _080CFCF0 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	movs r0, 0x5
	strh r0, [r1, 0x16]
	movs r0, 0x9
	strh r0, [r1, 0x18]
	ldrh r0, [r1, 0x14]
	adds r0, 0x1
	strh r0, [r1, 0x14]
_080CFC92:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	beq _080CFCA0
	b _080D003A
_080CFCA0:
	bl IsSEPlaying
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080CFCAE
	b _080D003A
_080CFCAE:
	movs r0, 0
	movs r1, 0xA8
	movs r2, 0xE0
	bl LoadUserWindowBorderGfx
	ldr r0, _080CFCF4 @ =gUnknown_826D1CC
	movs r1, 0xA8
	str r1, [sp]
	movs r1, 0xE
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x3
	movs r2, 0
	movs r3, 0x2
	bl CreateYesNoMenu
	ldr r3, _080CFCF8 @ =gBattleCommunication
	strb r4, [r3, 0x1]
	ldr r0, _080CFCF0 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x14]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r1, 0x14]
	strb r2, [r3, 0x1]
	b _080D003A
	.align 2, 0
_080CFCE8: .4byte gUnknown_83FDF3C
_080CFCEC: .4byte gDisplayedStringBattle
_080CFCF0: .4byte gTasks
_080CFCF4: .4byte gUnknown_826D1CC
_080CFCF8: .4byte gBattleCommunication
_080CFCFC:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r4, r0, 24
	cmp r4, 0
	beq _080CFD1C
	cmp r4, 0
	bgt _080CFD16
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _080CFD70
	b _080D003A
_080CFD16:
	cmp r4, 0x1
	beq _080CFD70
	b _080D003A
_080CFD1C:
	ldr r0, _080CFD60 @ =gBattleCommunication
	strb r4, [r0, 0x1]
	ldr r0, _080CFD64 @ =gUnknown_83FDF3C
	movs r3, 0x92
	lsls r3, 3
	adds r0, r3
	ldr r0, [r0]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r1, _080CFD68 @ =gDisplayedStringBattle
	movs r0, 0
	movs r2, 0x1
	bl sub_8054508
	ldr r1, _080CFD6C @ =gTasks
	adds r0, r7, r6
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x16]
	strh r1, [r0, 0x14]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x5
	beq _080CFD4E
	b _080D003A
_080CFD4E:
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
_080CFD56:
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _080D003A
	.align 2, 0
_080CFD60: .4byte gBattleCommunication
_080CFD64: .4byte gUnknown_83FDF3C
_080CFD68: .4byte gDisplayedStringBattle
_080CFD6C: .4byte gTasks
_080CFD70:
	ldr r1, _080CFD9C @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x1]
	ldr r0, _080CFDA0 @ =gUnknown_83FDF3C
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r1, _080CFDA4 @ =gDisplayedStringBattle
	movs r0, 0
	movs r2, 0x1
	bl sub_8054508
	ldr r1, _080CFDA8 @ =gTasks
	adds r0, r7, r6
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x18]
	strh r1, [r0, 0x14]
	b _080D003A
	.align 2, 0
_080CFD9C: .4byte gBattleCommunication
_080CFDA0: .4byte gUnknown_83FDF3C
_080CFDA4: .4byte gDisplayedStringBattle
_080CFDA8: .4byte gTasks
_080CFDAC:
	ldr r0, _080CFE14 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080CFDBA
	b _080D003A
_080CFDBA:
	ldr r0, _080CFE18 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _080CFDC6
	bl DestroyWirelessStatusIndicatorSprite
_080CFDC6:
	movs r0, 0x3
	bl GetBgTilemapBuffer
	bl Free
	movs r0, 0x1
	bl GetBgTilemapBuffer
	bl Free
	movs r0, 0
	bl GetBgTilemapBuffer
	bl Free
	bl FreeAllWindowBuffers
	ldr r0, _080CFE1C @ =gPlayerParty
	ldr r1, _080CFE20 @ =gTasks
	adds r5, r7, r6
	lsls r5, 3
	adds r5, r1
	ldrb r1, [r5, 0x1C]
	ldr r2, _080CFE24 @ =gPlayerPartyCount
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080CFE28 @ =CB2_TradeEvolutionSceneLoadGraphics
	ldr r4, _080CFE2C @ =gMoveToLearn
	ldrh r4, [r4]
	str r4, [sp]
	bl sub_8134738
	ldrh r0, [r5, 0x14]
	adds r0, 0x1
	strh r0, [r5, 0x14]
	b _080D003A
	.align 2, 0
_080CFE14: .4byte gPaletteFade
_080CFE18: .4byte gWirelessCommType
_080CFE1C: .4byte gPlayerParty
_080CFE20: .4byte gTasks
_080CFE24: .4byte gPlayerPartyCount
_080CFE28: .4byte CB2_TradeEvolutionSceneLoadGraphics
_080CFE2C: .4byte gMoveToLearn
_080CFE30:
	ldr r0, _080CFE64 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080CFE3E
	b _080D003A
_080CFE3E:
	ldr r0, _080CFE68 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _080CFE6C @ =sub_80CE72C
	cmp r1, r0
	beq _080CFE4A
	b _080D003A
_080CFE4A:
	bl sub_8138B2C
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bne _080CFE74
	ldr r0, _080CFE70 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	movs r0, 0x9
	b _080D0038
	.align 2, 0
_080CFE64: .4byte gPaletteFade
_080CFE68: .4byte gMain
_080CFE6C: .4byte sub_80CE72C
_080CFE70: .4byte gTasks
_080CFE74:
	adds r1, r5, 0
	adds r1, 0xD
	mov r0, r8
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl IsHMMove2
	cmp r0, 0
	beq _080CFEC0
	ldr r0, _080CFEB0 @ =gUnknown_83FDF3C
	ldr r3, _080CFEB4 @ =0x000004cc
	adds r0, r3
	ldr r0, [r0]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r1, _080CFEB8 @ =gDisplayedStringBattle
	movs r0, 0
	movs r2, 0x1
	bl sub_8054508
	ldr r1, _080CFEBC @ =gTasks
	adds r0, r7, r6
	lsls r0, 3
	adds r0, r1
	movs r1, 0xB
	strh r1, [r0, 0x14]
	b _080D003A
	.align 2, 0
_080CFEB0: .4byte gUnknown_83FDF3C
_080CFEB4: .4byte 0x000004cc
_080CFEB8: .4byte gDisplayedStringBattle
_080CFEBC: .4byte gTasks
_080CFEC0:
	ldr r1, _080CFF14 @ =gBattleTextBuff2
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	strb r4, [r1, 0x2]
	lsrs r0, r4, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	lsls r4, r5, 24
	lsrs r4, 24
	mov r0, r8
	adds r1, r4, 0
	bl RemoveMonPPBonus
	ldr r0, _080CFF18 @ =gMoveToLearn
	ldrh r1, [r0]
	mov r0, r8
	adds r2, r4, 0
	bl SetMonMoveSlot
	ldr r0, _080CFF1C @ =gUnknown_83FDF3C
	movs r1, 0xCF
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r1, _080CFF20 @ =gDisplayedStringBattle
	movs r0, 0
	movs r2, 0x1
	bl sub_8054508
	ldr r0, _080CFF24 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x14]
	adds r0, 0x1
	b _080D0038
	.align 2, 0
_080CFF14: .4byte gBattleTextBuff2
_080CFF18: .4byte gMoveToLearn
_080CFF1C: .4byte gUnknown_83FDF3C
_080CFF20: .4byte gDisplayedStringBattle
_080CFF24: .4byte gTasks
_080CFF28:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	beq _080CFF36
	b _080D003A
_080CFF36:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _080CFF42
	b _080D003A
_080CFF42:
	ldr r0, _080CFF64 @ =gUnknown_83FDF3C
	ldr r0, [r0, 0x1C]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r1, _080CFF68 @ =gDisplayedStringBattle
	movs r0, 0
	movs r2, 0x1
	bl sub_8054508
	ldr r0, _080CFF6C @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x14]
	adds r0, 0x1
	b _080D0038
	.align 2, 0
_080CFF64: .4byte gUnknown_83FDF3C
_080CFF68: .4byte gDisplayedStringBattle
_080CFF6C: .4byte gTasks
_080CFF70:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _080D003A
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _080D003A
	ldr r0, _080CFFAC @ =gUnknown_83FDF3C
	movs r3, 0xD0
	lsls r3, 2
	adds r0, r3
	ldr r0, [r0]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r1, _080CFFB0 @ =gDisplayedStringBattle
	movs r0, 0
	movs r2, 0x1
	bl sub_8054508
	ldr r1, _080CFFB4 @ =gTasks
	adds r0, r7, r6
	lsls r0, 3
	adds r0, r1
	movs r1, 0x12
	strh r1, [r0, 0x8]
	b _080D003A
	.align 2, 0
_080CFFAC: .4byte gUnknown_83FDF3C
_080CFFB0: .4byte gDisplayedStringBattle
_080CFFB4: .4byte gTasks
_080CFFB8:
	ldr r0, _080CFFE0 @ =gUnknown_83FDF3C
	ldr r0, [r0, 0x20]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r1, _080CFFE4 @ =gDisplayedStringBattle
	movs r0, 0
	movs r2, 0x1
	bl sub_8054508
	ldr r1, _080CFFE8 @ =gTasks
	adds r0, r7, r6
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0xA
	strh r1, [r0, 0x16]
	strh r2, [r0, 0x18]
	movs r1, 0x3
	strh r1, [r0, 0x14]
	b _080D003A
	.align 2, 0
_080CFFE0: .4byte gUnknown_83FDF3C
_080CFFE4: .4byte gDisplayedStringBattle
_080CFFE8: .4byte gTasks
_080CFFEC:
	ldr r0, _080D000C @ =gUnknown_83FDF3C
	ldr r0, [r0, 0x24]
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r1, _080D0010 @ =gDisplayedStringBattle
	movs r0, 0
	movs r2, 0x1
	bl sub_8054508
	ldr r1, _080D0014 @ =gTasks
	adds r0, r7, r6
	lsls r0, 3
	adds r0, r1
_080D0006:
	movs r1, 0xD
	strh r1, [r0, 0x8]
	b _080D003A
	.align 2, 0
_080D000C: .4byte gUnknown_83FDF3C
_080D0010: .4byte gDisplayedStringBattle
_080D0014: .4byte gTasks
_080D0018:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _080D003A
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _080D003A
	ldr r0, _080D0048 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	movs r0, 0x5
_080D0038:
	strh r0, [r1, 0x14]
_080D003A:
	add sp, 0x20
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D0048: .4byte gTasks
	thumb_func_end sub_80CF53C

	thumb_func_start nullsub_76
nullsub_76: @ 80D004C
	bx lr
	thumb_func_end nullsub_76

	thumb_func_start sub_80D0050
sub_80D0050: @ 80D0050
	push {lr}
	ldr r0, _080D00B8 @ =gBattle_BG0_X
	ldrh r1, [r0]
	movs r0, 0x10
	bl SetGpuReg
	ldr r0, _080D00BC @ =gBattle_BG0_Y
	ldrh r1, [r0]
	movs r0, 0x12
	bl SetGpuReg
	ldr r0, _080D00C0 @ =gBattle_BG1_X
	ldrh r1, [r0]
	movs r0, 0x14
	bl SetGpuReg
	ldr r0, _080D00C4 @ =gBattle_BG1_Y
	ldrh r1, [r0]
	movs r0, 0x16
	bl SetGpuReg
	ldr r0, _080D00C8 @ =gBattle_BG2_X
	ldrh r1, [r0]
	movs r0, 0x18
	bl SetGpuReg
	ldr r0, _080D00CC @ =gBattle_BG2_Y
	ldrh r1, [r0]
	movs r0, 0x1A
	bl SetGpuReg
	ldr r0, _080D00D0 @ =gBattle_BG3_X
	ldrh r1, [r0]
	movs r0, 0x1C
	bl SetGpuReg
	ldr r0, _080D00D4 @ =gBattle_BG3_Y
	ldrh r1, [r0]
	movs r0, 0x1E
	bl SetGpuReg
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl ScanlineEffect_InitHBlankDmaTransfer
	pop {r0}
	bx r0
	.align 2, 0
_080D00B8: .4byte gBattle_BG0_X
_080D00BC: .4byte gBattle_BG0_Y
_080D00C0: .4byte gBattle_BG1_X
_080D00C4: .4byte gBattle_BG1_Y
_080D00C8: .4byte gBattle_BG2_X
_080D00CC: .4byte gBattle_BG2_Y
_080D00D0: .4byte gBattle_BG3_X
_080D00D4: .4byte gBattle_BG3_Y
	thumb_func_end sub_80D0050

	thumb_func_start sub_80D00D8
sub_80D00D8: @ 80D00D8
	push {lr}
	ldr r0, _080D0140 @ =gBattle_BG0_X
	ldrh r1, [r0]
	movs r0, 0x10
	bl SetGpuReg
	ldr r0, _080D0144 @ =gBattle_BG0_Y
	ldrh r1, [r0]
	movs r0, 0x12
	bl SetGpuReg
	ldr r0, _080D0148 @ =gBattle_BG1_X
	ldrh r1, [r0]
	movs r0, 0x14
	bl SetGpuReg
	ldr r0, _080D014C @ =gBattle_BG1_Y
	ldrh r1, [r0]
	movs r0, 0x16
	bl SetGpuReg
	ldr r0, _080D0150 @ =gBattle_BG2_X
	ldrh r1, [r0]
	movs r0, 0x18
	bl SetGpuReg
	ldr r0, _080D0154 @ =gBattle_BG2_Y
	ldrh r1, [r0]
	movs r0, 0x1A
	bl SetGpuReg
	ldr r0, _080D0158 @ =gBattle_BG3_X
	ldrh r1, [r0]
	movs r0, 0x1C
	bl SetGpuReg
	ldr r0, _080D015C @ =gBattle_BG3_Y
	ldrh r1, [r0]
	movs r0, 0x1E
	bl SetGpuReg
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl ScanlineEffect_InitHBlankDmaTransfer
	pop {r0}
	bx r0
	.align 2, 0
_080D0140: .4byte gBattle_BG0_X
_080D0144: .4byte gBattle_BG0_Y
_080D0148: .4byte gBattle_BG1_X
_080D014C: .4byte gBattle_BG1_Y
_080D0150: .4byte gBattle_BG2_X
_080D0154: .4byte gBattle_BG2_Y
_080D0158: .4byte gBattle_BG3_X
_080D015C: .4byte gBattle_BG3_Y
	thumb_func_end sub_80D00D8

	thumb_func_start sub_80D0160
sub_80D0160: @ 80D0160
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080D01E0 @ =gTasks+0x8
	adds r4, r0, r1
	movs r0, 0xC
	ldrsh r5, [r4, r0]
	cmp r5, 0
	bne _080D020E
	ldrh r0, [r4, 0xA]
	adds r1, r0, 0x1
	strh r1, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080D020E
	ldrh r1, [r4]
	adds r0, r1, 0x1
	strh r0, [r4]
	lsls r1, 16
	asrs r1, 16
	ldr r3, _080D01E4 @ =gUnknown_83F846D
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	lsls r2, r0, 2
	adds r0, r3, 0x3
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r1, r0
	ble _080D0200
	adds r0, r3, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080D01E8
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	strh r0, [r4, 0x6]
	movs r0, 0x6
	ldrsh r2, [r4, r0]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r1, r3, 0x2
	adds r0, r1
	ldrb r0, [r0]
	cmp r2, r0
	bne _080D01D2
	strh r5, [r4, 0x6]
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
_080D01D2:
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0]
	b _080D01FE
	.align 2, 0
_080D01E0: .4byte gTasks+0x8
_080D01E4: .4byte gUnknown_83F846D
_080D01E8:
	ldr r0, _080D0214 @ =gUnknown_2039A24
	lsls r1, 5
	ldr r0, [r0]
	adds r0, r1
	movs r1, 0xA0
	movs r2, 0x20
	bl LoadPalette
	strh r5, [r4]
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
_080D01FE:
	strh r0, [r4, 0x2]
_080D0200:
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bne _080D020E
	adds r0, r6, 0
	bl DestroyTask
_080D020E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D0214: .4byte gUnknown_2039A24
	thumb_func_end sub_80D0160

	thumb_func_start sub_80D0218
sub_80D0218: @ 80D0218
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080D023C @ =sub_80D025C
	movs r1, 0x7
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r4, 0
	bne _080D0244
	ldr r1, _080D0240 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0xC]
	b _080D0252
	.align 2, 0
_080D023C: .4byte sub_80D025C
_080D0240: .4byte gTasks
_080D0244:
	ldr r0, _080D0258 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0xC]
_080D0252:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D0258: .4byte gTasks
	thumb_func_end sub_80D0218

	thumb_func_start sub_80D025C
sub_80D025C: @ 80D025C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080D0288 @ =gBattle_BG1_X
	mov r8, r0
	ldr r1, _080D028C @ =gBattle_BG1_Y
	mov r9, r1
	ldr r1, _080D0290 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0xC
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _080D029C
	ldr r7, _080D0294 @ =gBattle_BG2_X
	ldr r6, _080D0298 @ =gBattle_BG2_Y
	b _080D02A0
	.align 2, 0
_080D0288: .4byte gBattle_BG1_X
_080D028C: .4byte gBattle_BG1_Y
_080D0290: .4byte gTasks
_080D0294: .4byte gBattle_BG2_X
_080D0298: .4byte gBattle_BG2_Y
_080D029C:
	ldr r7, _080D0328 @ =gBattle_BG3_X
	ldr r6, _080D032C @ =gBattle_BG3_Y
_080D02A0:
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r1
	ldrh r0, [r4, 0x8]
	adds r0, 0x5
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x8]
	adds r0, 0x80
	ands r0, r1
	strh r0, [r4, 0xA]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	movs r1, 0x4
	bl Cos
	adds r0, 0x8
	mov r2, r8
	strh r0, [r2]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	movs r1, 0x4
	bl Sin
	adds r0, 0x10
	mov r2, r9
	strh r0, [r2]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r1, 0x4
	bl Cos
	adds r0, 0x8
	strh r0, [r7]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	movs r1, 0x4
	bl Sin
	adds r0, 0x10
	strh r0, [r6]
	ldr r0, _080D0330 @ =sub_80D0160
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080D031A
	adds r0, r5, 0
	bl DestroyTask
	mov r0, r8
	strh r4, [r0]
	mov r1, r9
	strh r4, [r1]
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r7]
	strh r4, [r6]
_080D031A:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D0328: .4byte gBattle_BG3_X
_080D032C: .4byte gBattle_BG3_Y
_080D0330: .4byte sub_80D0160
	thumb_func_end sub_80D025C

	thumb_func_start InitMovingBgValues
InitMovingBgValues: @ 80D0334
	push {r4-r7,lr}
	adds r6, r0, 0
	movs r1, 0
	ldr r5, _080D036C @ =gUnknown_83F8400
	ldr r7, _080D0370 @ =gUnknown_83F847D
_080D033E:
	lsls r0, r1, 4
	adds r4, r1, 0x1
	adds r2, r0, r7
	lsls r0, r1, 5
	adds r1, r0, r6
	movs r3, 0xF
_080D034A:
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	strh r0, [r1]
	adds r2, 0x1
	adds r1, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080D034A
	adds r1, r4, 0
	cmp r1, 0x31
	ble _080D033E
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D036C: .4byte gUnknown_83F8400
_080D0370: .4byte gUnknown_83F847D
	thumb_func_end InitMovingBgValues

	thumb_func_start InitMovingBackgroundTask
InitMovingBackgroundTask: @ 80D0374
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080D0398 @ =gUnknown_2039A24
	movs r0, 0xC8
	lsls r0, 3
	bl AllocZeroed
	str r0, [r4]
	bl InitMovingBgValues
	cmp r5, 0
	bne _080D039C
	movs r6, 0x1
	movs r4, 0x2
	b _080D03A0
	.align 2, 0
_080D0398: .4byte gUnknown_2039A24
_080D039C:
	movs r6, 0x1
	movs r4, 0x3
_080D03A0:
	ldr r0, _080D0420 @ =gUnknown_83F7D60
	movs r1, 0xA0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _080D0424 @ =gUnknown_83F6CB0
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _080D0428 @ =gUnknown_83F73A8
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r1, _080D042C @ =gUnknown_83F788C
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	adds r0, r4, 0
	bl CopyBgTilemapBufferToVram
	cmp r5, 0
	bne _080D0438
	ldr r1, _080D0430 @ =0x00000442
	movs r0, 0x50
	bl SetGpuReg
	ldr r1, _080D0434 @ =0x00000808
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0xBA
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	adds r0, r6, 0
	movs r1, 0x7
	movs r2, 0x2
	bl SetBgAttribute
	adds r0, r4, 0
	movs r1, 0x7
	movs r2, 0x2
	bl SetBgAttribute
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	b _080D0452
	.align 2, 0
_080D0420: .4byte gUnknown_83F7D60
_080D0424: .4byte gUnknown_83F6CB0
_080D0428: .4byte gUnknown_83F73A8
_080D042C: .4byte gUnknown_83F788C
_080D0430: .4byte 0x00000442
_080D0434: .4byte 0x00000808
_080D0438:
	ldr r1, _080D0468 @ =0x00000842
	movs r0, 0x50
	bl SetGpuReg
	ldr r1, _080D046C @ =0x00000808
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0xDA
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
_080D0452:
	ldr r0, _080D0470 @ =sub_80D0160
	movs r1, 0x5
	bl CreateTask
	adds r0, r5, 0
	bl sub_80D0218
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D0468: .4byte 0x00000842
_080D046C: .4byte 0x00000808
_080D0470: .4byte sub_80D0160
	thumb_func_end InitMovingBackgroundTask

	thumb_func_start sub_80D0474
sub_80D0474: @ 80D0474
	push {lr}
	ldr r0, _080D04A0 @ =sub_80D0160
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080D0492
	ldr r0, _080D04A4 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x14]
_080D0492:
	movs r0, 0
	movs r1, 0xA0
	movs r2, 0x20
	bl FillPalette
	pop {r0}
	bx r0
	.align 2, 0
_080D04A0: .4byte sub_80D0160
_080D04A4: .4byte gTasks
	thumb_func_end sub_80D0474

	thumb_func_start sub_80D04A8
sub_80D04A8: @ 80D04A8
	push {lr}
	ldr r0, _080D04E0 @ =sub_80D0160
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080D04BC
	bl DestroyTask
_080D04BC:
	ldr r0, _080D04E4 @ =sub_80D025C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080D04CE
	bl DestroyTask
_080D04CE:
	movs r0, 0
	movs r1, 0xA0
	movs r2, 0x20
	bl FillPalette
	bl sub_80D04E8
	pop {r0}
	bx r0
	.align 2, 0
_080D04E0: .4byte sub_80D0160
_080D04E4: .4byte sub_80D025C
	thumb_func_end sub_80D04A8

	thumb_func_start sub_80D04E8
sub_80D04E8: @ 80D04E8
	push {lr}
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	ldr r0, _080D0544 @ =gBattle_BG1_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080D0548 @ =gBattle_BG1_Y
	strh r1, [r0]
	ldr r0, _080D054C @ =gBattle_BG2_X
	strh r1, [r0]
	movs r0, 0x1
	movs r1, 0x5
	bl sub_8011C44
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x1
	movs r1, 0x7
	bl SetBgAttribute
	movs r0, 0x2
	movs r1, 0x5
	bl sub_8011C44
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x2
	movs r1, 0x7
	bl SetBgAttribute
	movs r1, 0xCA
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	ldr r0, _080D0550 @ =gUnknown_2039A24
	ldr r0, [r0]
	bl Free
	pop {r0}
	bx r0
	.align 2, 0
_080D0544: .4byte gBattle_BG1_X
_080D0548: .4byte gBattle_BG1_Y
_080D054C: .4byte gBattle_BG2_X
_080D0550: .4byte gUnknown_2039A24
	thumb_func_end sub_80D04E8

	.align 2, 0 @ Don't pad with nop.
