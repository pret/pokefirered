	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start FieldEffectStart
FieldEffectStart: @ 8083444
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl FieldEffectActiveListAdd
	ldr r0, _08083484 @ =gUnknown_81D96AC
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	str r0, [sp]
	add r4, sp, 0x4
	ldr r5, _08083488 @ =gUnknown_83CBE30
_08083462:
	ldr r0, [sp]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r5
	ldr r2, [r0]
	mov r0, sp
	adds r1, r4, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	bne _08083462
	ldr r0, [sp, 0x4]
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08083484: .4byte gUnknown_81D96AC
_08083488: .4byte gUnknown_83CBE30
	thumb_func_end FieldEffectStart

	thumb_func_start FieldEffectCmd_loadtiles
FieldEffectCmd_loadtiles: @ 808348C
	push {lr}
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	bl FieldEffectScript_LoadTiles
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_loadtiles

	thumb_func_start FieldEffectCmd_loadfadedpal
FieldEffectCmd_loadfadedpal: @ 80834A0
	push {lr}
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	bl sub_8083614
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_loadfadedpal

	thumb_func_start FieldEffectCmd_loadpal
FieldEffectCmd_loadpal: @ 80834B4
	push {lr}
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	bl sub_808365C
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_loadpal

	thumb_func_start FieldEffectCmd_callnative
FieldEffectCmd_callnative: @ 80834C8
	push {lr}
	ldr r2, [r0]
	adds r2, 0x1
	str r2, [r0]
	bl FieldEffectScript_CallNative
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_callnative

	thumb_func_start sub_80834DC
sub_80834DC: @ 80834DC
	movs r0, 0
	bx lr
	thumb_func_end sub_80834DC

	thumb_func_start FieldEffectCmd_loadgfx_callnative
FieldEffectCmd_loadgfx_callnative: @ 80834E0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	adds r0, r4, 0
	bl FieldEffectScript_LoadTiles
	adds r0, r4, 0
	bl sub_8083614
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldEffectScript_CallNative
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_loadgfx_callnative

	thumb_func_start FieldEffectCmd_loadtiles_callnative
FieldEffectCmd_loadtiles_callnative: @ 8083508
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	adds r0, r4, 0
	bl FieldEffectScript_LoadTiles
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldEffectScript_CallNative
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_loadtiles_callnative

	thumb_func_start FieldEffectCmd_loadfadedpal_callnative
FieldEffectCmd_loadfadedpal_callnative: @ 808352C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	adds r0, r4, 0
	bl sub_8083614
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldEffectScript_CallNative
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_loadfadedpal_callnative

	thumb_func_start FieldEffectScript_ReadWord
FieldEffectScript_ReadWord: @ 8083550
	ldr r2, [r0]
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	ldrb r1, [r2, 0x2]
	lsls r1, 16
	adds r0, r1
	ldrb r1, [r2, 0x3]
	lsls r1, 24
	adds r0, r1
	bx lr
	thumb_func_end FieldEffectScript_ReadWord

	thumb_func_start FieldEffectScript_LoadTiles
FieldEffectScript_LoadTiles: @ 8083568
	push {r4,r5,lr}
	adds r4, r0, 0
	bl FieldEffectScript_ReadWord
	adds r5, r0, 0
	ldrh r0, [r5, 0x6]
	bl GetSpriteTileStartByTag
	lsls r0, 16
	ldr r1, _08083594 @ =0xffff0000
	cmp r0, r1
	bne _08083586
	adds r0, r5, 0
	bl LoadSpriteSheet
_08083586:
	ldr r0, [r4]
	adds r0, 0x4
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083594: .4byte 0xffff0000
	thumb_func_end FieldEffectScript_LoadTiles

	thumb_func_start sub_8083598
sub_8083598: @ 8083598
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080835B4 @ =gUnknown_2036E28
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080835B8
	cmp r0, 0x1
	ble _08083606
	cmp r0, 0x2
	beq _080835CC
	cmp r0, 0x3
	beq _080835E0
	b _08083606
	.align 2, 0
_080835B4: .4byte gUnknown_2036E28
_080835B8:
	adds r4, 0x10
	lsls r0, r4, 5
	ldr r1, _080835C8 @ =gPlttBufferUnfaded
	adds r0, r1
	movs r1, 0x10
	bl TintPalette_GrayScale
	b _080835F6
	.align 2, 0
_080835C8: .4byte gPlttBufferUnfaded
_080835CC:
	adds r4, 0x10
	lsls r0, r4, 5
	ldr r1, _080835DC @ =gPlttBufferUnfaded
	adds r0, r1
	movs r1, 0x10
	bl TintPalette_SepiaTone
	b _080835F6
	.align 2, 0
_080835DC: .4byte gPlttBufferUnfaded
_080835E0:
	adds r4, 0x10
	lsls r0, r4, 4
	movs r1, 0x10
	bl sub_8111F38
	lsls r0, r4, 5
	ldr r1, _0808360C @ =gPlttBufferUnfaded
	adds r0, r1
	movs r1, 0x10
	bl TintPalette_GrayScale
_080835F6:
	lsls r1, r4, 5
	ldr r0, _0808360C @ =gPlttBufferUnfaded
	adds r0, r1, r0
	ldr r2, _08083610 @ =gPlttBufferFaded
	adds r1, r2
	movs r2, 0x8
	bl CpuFastSet
_08083606:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808360C: .4byte gPlttBufferUnfaded
_08083610: .4byte gPlttBufferFaded
	thumb_func_end sub_8083598

	thumb_func_start sub_8083614
sub_8083614: @ 8083614
	push {r4-r6,lr}
	adds r6, r0, 0
	bl FieldEffectScript_ReadWord
	adds r5, r0, 0
	ldrh r0, [r5, 0x4]
	bl IndexOfSpritePaletteTag
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl LoadSpritePalette
	cmp r4, 0xFF
	bne _08083642
	ldrh r0, [r5, 0x4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	bl sub_8083598
_08083642:
	ldrh r0, [r5, 0x4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	bl sub_807AA8C
	ldr r0, [r6]
	adds r0, 0x4
	str r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8083614

	thumb_func_start sub_808365C
sub_808365C: @ 808365C
	push {r4-r6,lr}
	adds r6, r0, 0
	bl FieldEffectScript_ReadWord
	adds r5, r0, 0
	ldrh r0, [r5, 0x4]
	bl IndexOfSpritePaletteTag
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl LoadSpritePalette
	cmp r4, 0xFF
	beq _0808368A
	ldrh r0, [r5, 0x4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	bl sub_8083598
_0808368A:
	ldr r0, [r6]
	adds r0, 0x4
	str r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_808365C

	thumb_func_start FieldEffectScript_CallNative
FieldEffectScript_CallNative: @ 8083698
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldEffectScript_ReadWord
	bl _call_via_r0
	str r0, [r5]
	ldr r0, [r4]
	adds r0, 0x4
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectScript_CallNative

	thumb_func_start FieldEffectFreeGraphicsResources
FieldEffectFreeGraphicsResources: @ 80836B4
	push {r4,r5,lr}
	adds r1, r0, 0
	adds r1, 0x40
	ldrh r5, [r1]
	ldrb r4, [r0, 0x5]
	lsrs r4, 4
	bl DestroySprite
	adds r0, r5, 0
	bl FieldEffectFreeTilesIfUnused
	adds r0, r4, 0
	bl FieldEffectFreePaletteIfUnused
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectFreeGraphicsResources

	thumb_func_start FieldEffectStop
FieldEffectStop: @ 80836D8
	push {r4,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	bl FieldEffectFreeGraphicsResources
	adds r0, r4, 0
	bl FieldEffectActiveListRemove
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectStop

	thumb_func_start FieldEffectFreeTilesIfUnused
FieldEffectFreeTilesIfUnused: @ 80836F0
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetSpriteTileTagByTileStart
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _0808374C @ =0x0000ffff
	cmp r3, r0
	beq _08083744
	movs r2, 0
	ldr r5, _08083750 @ =gSprites
_0808370A:
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r5
	adds r0, r1, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _08083734
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 25
	cmp r0, 0
	bge _08083734
	adds r0, r1, 0
	adds r0, 0x40
	ldrh r0, [r0]
	cmp r4, r0
	beq _08083744
_08083734:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3F
	bls _0808370A
	adds r0, r3, 0
	bl FreeSpriteTilesByTag
_08083744:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808374C: .4byte 0x0000ffff
_08083750: .4byte gSprites
	thumb_func_end FieldEffectFreeTilesIfUnused

	thumb_func_start FieldEffectFreePaletteIfUnused
FieldEffectFreePaletteIfUnused: @ 8083754
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _080837A4 @ =0x0000ffff
	cmp r5, r0
	beq _0808379C
	movs r2, 0
	ldr r6, _080837A8 @ =gSprites
	adds r3, r4, 0
_08083770:
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r6
	adds r0, r1, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _0808378C
	ldrb r0, [r1, 0x5]
	lsrs r0, 4
	cmp r0, r3
	beq _0808379C
_0808378C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3F
	bls _08083770
	adds r0, r5, 0
	bl FreeSpritePaletteByTag
_0808379C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080837A4: .4byte 0x0000ffff
_080837A8: .4byte gSprites
	thumb_func_end FieldEffectFreePaletteIfUnused

	thumb_func_start FieldEffectActiveListClear
FieldEffectActiveListClear: @ 80837AC
	push {r4,lr}
	movs r2, 0
	ldr r4, _080837CC @ =gUnknown_3000FC8
	movs r3, 0xFF
_080837B4:
	adds r0, r2, r4
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1F
	bls _080837B4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080837CC: .4byte gUnknown_3000FC8
	thumb_func_end FieldEffectActiveListClear

	thumb_func_start FieldEffectActiveListAdd
FieldEffectActiveListAdd: @ 80837D0
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r2, 0
	ldr r4, _080837E8 @ =gUnknown_3000FC8
_080837DA:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _080837EC
	strb r3, [r1]
	b _080837F6
	.align 2, 0
_080837E8: .4byte gUnknown_3000FC8
_080837EC:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1F
	bls _080837DA
_080837F6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectActiveListAdd

	thumb_func_start FieldEffectActiveListRemove
FieldEffectActiveListRemove: @ 80837FC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r2, 0
	ldr r4, _08083818 @ =gUnknown_3000FC8
	movs r5, 0xFF
_08083808:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, r3
	bne _0808381C
	orrs r0, r5
	strb r0, [r1]
	b _08083826
	.align 2, 0
_08083818: .4byte gUnknown_3000FC8
_0808381C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1F
	bls _08083808
_08083826:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectActiveListRemove

	thumb_func_start FieldEffectActiveListContains
FieldEffectActiveListContains: @ 808382C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	ldr r3, _08083844 @ =gUnknown_3000FC8
_08083836:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _08083848
	movs r0, 0x1
	b _08083854
	.align 2, 0
_08083844: .4byte gUnknown_3000FC8
_08083848:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1F
	bls _08083836
	movs r0, 0
_08083854:
	pop {r1}
	bx r1
	thumb_func_end FieldEffectActiveListContains

	thumb_func_start CreateTrainerSprite
CreateTrainerSprite: @ 8083858
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x18
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	mov r9, r3
	ldr r7, [sp, 0x34]
	lsls r4, 24
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsrs r4, 21
	ldr r3, _080838E0 @ =gTrainerFrontPicPaletteTable
	mov r8, r3
	add r8, r4
	mov r0, r8
	adds r1, r7, 0
	bl LoadCompressedSpritePaletteOverrideBuffer
	ldr r0, _080838E4 @ =gTrainerFrontPicTable
	adds r4, r0
	adds r0, r4, 0
	adds r1, r7, 0
	bl LoadCompressedSpriteSheetOverrideBuffer
	mov r1, sp
	ldrh r0, [r4, 0x6]
	movs r2, 0
	strh r0, [r1]
	mov r3, r8
	ldrh r0, [r3, 0x4]
	strh r0, [r1, 0x2]
	ldr r0, _080838E8 @ =gUnknown_83CBE50
	str r0, [sp, 0x4]
	ldr r0, _080838EC @ =gDummySpriteAnimTable
	str r0, [sp, 0x8]
	str r2, [sp, 0xC]
	ldr r0, _080838F0 @ =gDummySpriteAffineAnimTable
	str r0, [sp, 0x10]
	ldr r0, _080838F4 @ =SpriteCallbackDummy
	str r0, [sp, 0x14]
	lsls r5, 16
	asrs r5, 16
	lsls r6, 16
	asrs r6, 16
	mov r0, sp
	adds r1, r5, 0
	adds r2, r6, 0
	mov r3, r9
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080838E0: .4byte gTrainerFrontPicPaletteTable
_080838E4: .4byte gTrainerFrontPicTable
_080838E8: .4byte gUnknown_83CBE50
_080838EC: .4byte gDummySpriteAnimTable
_080838F0: .4byte gDummySpriteAffineAnimTable
_080838F4: .4byte SpriteCallbackDummy
	thumb_func_end CreateTrainerSprite

	thumb_func_start LoadTrainerGfx_TrainerCard
LoadTrainerGfx_TrainerCard: @ 80838F8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r1, r2, 0
	lsls r4, 24
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _08083928 @ =gTrainerFrontPicTable
	lsrs r4, 21
	adds r0, r4, r0
	ldr r0, [r0]
	bl LZDecompressVram
	ldr r0, _0808392C @ =gTrainerFrontPicPaletteTable
	adds r4, r0
	ldr r0, [r4]
	adds r1, r5, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083928: .4byte gTrainerFrontPicTable
_0808392C: .4byte gTrainerFrontPicPaletteTable
	thumb_func_end LoadTrainerGfx_TrainerCard

	thumb_func_start AddNewGameBirchObject
AddNewGameBirchObject: @ 8083930
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _08083968 @ =gUnknown_83CBE70
	bl LoadSpritePalette
	ldr r0, _0808396C @ =gUnknown_83CBE84
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08083968: .4byte gUnknown_83CBE70
_0808396C: .4byte gUnknown_83CBE84
	thumb_func_end AddNewGameBirchObject

	thumb_func_start sub_8083970
sub_8083970: @ 8083970
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 16
	lsrs r0, 16
	movs r3, 0x80
	lsls r3, 8
	lsls r1, 16
	asrs r1, 16
	str r1, [sp]
	lsls r2, 16
	asrs r2, 16
	str r2, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	ldr r1, _080839C0 @ =gMonPaletteTable
	lsls r4, r0, 3
	adds r4, r1
	ldrh r1, [r4, 0x4]
	str r1, [sp, 0xC]
	movs r1, 0
	adds r2, r3, 0
	movs r3, 0x1
	bl CreateMonPicSprite_HandleDeoxys
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r4, 0x4]
	bl IndexOfSpritePaletteTag
	adds r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	bl sub_807B084
	ldr r0, _080839C4 @ =0x0000ffff
	cmp r5, r0
	beq _080839C8
	lsls r0, r5, 24
	lsrs r0, 24
	b _080839CA
	.align 2, 0
_080839C0: .4byte gMonPaletteTable
_080839C4: .4byte 0x0000ffff
_080839C8:
	movs r0, 0x40
_080839CA:
	add sp, 0x10
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8083970

	thumb_func_start sub_80839D4
sub_80839D4: @ 80839D4
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x10
	adds r6, r0, 0
	mov r9, r1
	mov r10, r2
	adds r4, r3, 0
	ldr r5, [sp, 0x2C]
	lsls r6, 16
	lsrs r6, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	bl GetMonSpritePalStructFromOtIdPersonality
	mov r8, r0
	lsls r4, 16
	asrs r4, 16
	str r4, [sp]
	lsls r5, 16
	asrs r5, 16
	str r5, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	mov r1, r8
	ldrh r0, [r1, 0x4]
	str r0, [sp, 0xC]
	adds r0, r6, 0
	mov r1, r9
	mov r2, r10
	movs r3, 0x1
	bl CreateMonPicSprite_HandleDeoxys
	lsls r0, 16
	lsrs r4, r0, 16
	mov r1, r8
	ldrh r0, [r1, 0x4]
	bl IndexOfSpritePaletteTag
	adds r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	bl sub_807B084
	ldr r0, _08083A44 @ =0x0000ffff
	cmp r4, r0
	beq _08083A48
	lsls r0, r4, 24
	lsrs r0, 24
	b _08083A4A
	.align 2, 0
_08083A44: .4byte 0x0000ffff
_08083A48:
	movs r0, 0x40
_08083A4A:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80839D4

	thumb_func_start sub_8083A5C
sub_8083A5C: @ 8083A5C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	bl sub_807B0B4
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	cmp r0, 0
	beq _08083A7A
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
_08083A7A:
	adds r0, r5, 0
	bl FreeAndDestroyMonPicSprite
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8083A5C

	thumb_func_start MultiplyInvertedPaletteRGBComponents
MultiplyInvertedPaletteRGBComponents: @ 8083A88
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 16
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r4, _08083B0C @ =gPlttBufferUnfaded
	lsrs r0, 15
	adds r4, r0, r4
	ldrh r4, [r4]
	movs r5, 0x1F
	mov r9, r5
	mov r8, r4
	mov r6, r8
	ands r6, r5
	mov r8, r6
	movs r6, 0xF8
	lsls r6, 2
	ands r6, r4
	lsrs r6, 5
	movs r5, 0xF8
	lsls r5, 7
	ands r4, r5
	lsrs r4, 10
	mov r7, r9
	mov r5, r8
	subs r7, r5
	mov r12, r7
	mov r7, r12
	muls r7, r1
	adds r1, r7, 0
	asrs r1, 4
	add r8, r1
	mov r5, r9
	subs r1, r5, r6
	muls r1, r2
	asrs r1, 4
	adds r6, r1
	subs r5, r4
	mov r9, r5
	mov r1, r9
	muls r1, r3
	asrs r1, 4
	adds r4, r1
	mov r7, r8
	lsls r7, 16
	lsls r6, 21
	orrs r6, r7
	lsls r4, 26
	orrs r4, r6
	lsrs r4, 16
	ldr r1, _08083B10 @ =gPlttBufferFaded
	adds r0, r1
	strh r4, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083B0C: .4byte gPlttBufferUnfaded
_08083B10: .4byte gPlttBufferFaded
	thumb_func_end MultiplyInvertedPaletteRGBComponents

	thumb_func_start MultiplyPaletteRGBComponents
MultiplyPaletteRGBComponents: @ 8083B14
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	lsls r0, 16
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r4, _08083B84 @ =gPlttBufferUnfaded
	lsrs r0, 15
	adds r4, r0, r4
	ldrh r4, [r4]
	movs r5, 0x1F
	mov r8, r5
	mov r6, r8
	ands r6, r4
	mov r8, r6
	movs r5, 0xF8
	lsls r5, 2
	ands r5, r4
	lsrs r5, 5
	movs r6, 0xF8
	lsls r6, 7
	ands r4, r6
	lsrs r4, 10
	mov r6, r8
	muls r6, r1
	adds r1, r6, 0
	asrs r1, 4
	mov r6, r8
	subs r6, r1
	adds r1, r5, 0
	muls r1, r2
	asrs r1, 4
	subs r5, r1
	adds r1, r4, 0
	muls r1, r3
	asrs r1, 4
	subs r4, r1
	lsls r6, 16
	lsls r5, 21
	orrs r5, r6
	lsls r4, 26
	orrs r4, r5
	lsrs r4, 16
	ldr r1, _08083B88 @ =gPlttBufferFaded
	adds r0, r1
	strh r4, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08083B84: .4byte gPlttBufferUnfaded
_08083B88: .4byte gPlttBufferFaded
	thumb_func_end MultiplyPaletteRGBComponents

	thumb_func_start sub_8083B8C
sub_8083B8C: @ 8083B8C
	push {r4,lr}
	bl CalculatePlayerPartyCount
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08083BC8 @ =sub_8083BD0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08083BCC @ =gTasks
	adds r1, r0
	strh r4, [r1, 0xA]
	movs r0, 0x5D
	strh r0, [r1, 0xC]
	movs r0, 0x24
	strh r0, [r1, 0xE]
	movs r0, 0x80
	strh r0, [r1, 0x10]
	movs r0, 0x18
	strh r0, [r1, 0x12]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08083BC8: .4byte sub_8083BD0
_08083BCC: .4byte gTasks
	thumb_func_end sub_8083B8C

	thumb_func_start sub_8083BD0
sub_8083BD0: @ 8083BD0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08083BF8 @ =gTasks
	adds r1, r0
	ldr r2, _08083BFC @ =gUnknown_83CBFD0
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	lsls r0, 2
	adds r0, r2
	ldr r2, [r0]
	adds r0, r1, 0
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_08083BF8: .4byte gTasks
_08083BFC: .4byte gUnknown_83CBFD0
	thumb_func_end sub_8083BD0

	thumb_func_start PokecenterHealEffect_0
PokecenterHealEffect_0: @ 8083C00
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	movs r3, 0xE
	ldrsh r2, [r4, r3]
	movs r3, 0x1
	bl sub_8083E14
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x14]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl PokecenterHealEffectHelper
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x16]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PokecenterHealEffect_0

	thumb_func_start PokecenterHealEffect_1
PokecenterHealEffect_1: @ 8083C3C
	push {r4,lr}
	adds r2, r0, 0
	ldr r3, _08083C74 @ =gSprites
	movs r1, 0x14
	ldrsh r0, [r2, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r4, 0x2E
	ldrsh r0, [r1, r4]
	cmp r0, 0x1
	ble _08083C6E
	movs r0, 0x16
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x2E]
	adds r1, 0x1
	strh r1, [r0, 0x2E]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
_08083C6E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083C74: .4byte gSprites
	thumb_func_end PokecenterHealEffect_1

	thumb_func_start sub_8083C78
sub_8083C78: @ 8083C78
	push {lr}
	adds r3, r0, 0
	ldr r2, _08083C9C @ =gSprites
	movs r0, 0x14
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	ble _08083C98
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_08083C98:
	pop {r0}
	bx r0
	.align 2, 0
_08083C9C: .4byte gSprites
	thumb_func_end sub_8083C78

	thumb_func_start PokecenterHealEffect_3
PokecenterHealEffect_3: @ 8083CA0
	push {lr}
	ldr r2, _08083CD8 @ =gSprites
	movs r3, 0x14
	ldrsh r1, [r0, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x6
	ble _08083CD2
	adds r0, r1, 0
	bl DestroySprite
	movs r0, 0x19
	bl FieldEffectActiveListRemove
	ldr r0, _08083CDC @ =sub_8083BD0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08083CD2:
	pop {r0}
	bx r0
	.align 2, 0
_08083CD8: .4byte gSprites
_08083CDC: .4byte sub_8083BD0
	thumb_func_end PokecenterHealEffect_3

	thumb_func_start sub_8083CE0
sub_8083CE0: @ 8083CE0
	push {r4,lr}
	bl CalculatePlayerPartyCount
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08083D14 @ =sub_8083D1C
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08083D18 @ =gTasks
	adds r1, r0
	strh r4, [r1, 0xA]
	movs r0, 0x75
	strh r0, [r1, 0xC]
	movs r0, 0x3C
	strh r0, [r1, 0xE]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08083D14: .4byte sub_8083D1C
_08083D18: .4byte gTasks
	thumb_func_end sub_8083CE0

	thumb_func_start sub_8083D1C
sub_8083D1C: @ 8083D1C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08083D44 @ =gTasks
	adds r1, r0
	ldr r2, _08083D48 @ =gUnknown_83CBFE0
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	lsls r0, 2
	adds r0, r2
	ldr r2, [r0]
	adds r0, r1, 0
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_08083D44: .4byte gTasks
_08083D48: .4byte gUnknown_83CBFE0
	thumb_func_end sub_8083D1C

	thumb_func_start HallOfFameRecordEffect_0
HallOfFameRecordEffect_0: @ 8083D4C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	movs r3, 0xE
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl sub_8083E14
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x14]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end HallOfFameRecordEffect_0

	thumb_func_start sub_8083D74
sub_8083D74: @ 8083D74
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _08083DA8 @ =gSprites
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	ble _08083DA2
	movs r0, 0x78
	movs r1, 0x19
	bl sub_808428C
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08083DA2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083DA8: .4byte gSprites
	thumb_func_end sub_8083D74

	thumb_func_start sub_8083DAC
sub_8083DAC: @ 8083DAC
	push {lr}
	adds r3, r0, 0
	ldr r2, _08083DD0 @ =gSprites
	movs r0, 0x14
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	ble _08083DCC
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_08083DCC:
	pop {r0}
	bx r0
	.align 2, 0
_08083DD0: .4byte gSprites
	thumb_func_end sub_8083DAC

	thumb_func_start sub_8083DD4
sub_8083DD4: @ 8083DD4
	push {lr}
	ldr r2, _08083E0C @ =gSprites
	movs r3, 0x14
	ldrsh r1, [r0, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x6
	ble _08083E06
	adds r0, r1, 0
	bl DestroySprite
	movs r0, 0x3E
	bl FieldEffectActiveListRemove
	ldr r0, _08083E10 @ =sub_8083D1C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08083E06:
	pop {r0}
	bx r0
	.align 2, 0
_08083E0C: .4byte gSprites
_08083E10: .4byte sub_8083D1C
	thumb_func_end sub_8083DD4

	thumb_func_start sub_8083E14
sub_8083E14: @ 8083E14
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _08083E68 @ =sub_8083E70
	bl CreateInvisibleSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r2, _08083E6C @ =gSprites
	adds r1, r2
	strh r4, [r1, 0x24]
	strh r5, [r1, 0x26]
	adds r3, r1, 0
	adds r3, 0x43
	movs r2, 0xFF
	strb r2, [r3]
	strh r6, [r1, 0x38]
	mov r2, r8
	strh r2, [r1, 0x3A]
	strh r0, [r1, 0x3C]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08083E68: .4byte sub_8083E70
_08083E6C: .4byte gSprites
	thumb_func_end sub_8083E14

	thumb_func_start sub_8083E70
sub_8083E70: @ 8083E70
	push {lr}
	ldr r2, _08083E88 @ =gUnknown_83CBFF0
	movs r3, 0x2E
	ldrsh r1, [r0, r3]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08083E88: .4byte gUnknown_83CBFF0
	thumb_func_end sub_8083E70

	thumb_func_start PokeballGlowEffect_0
PokeballGlowEffect_0: @ 8083E8C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08083EA4
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _08083F00
_08083EA4:
	movs r0, 0x19
	strh r0, [r4, 0x30]
	ldr r0, _08083F18 @ =gUnknown_83CBF88
	ldr r1, _08083F1C @ =gUnknown_83CC010
	movs r2, 0x32
	ldrsh r3, [r4, r2]
	lsls r3, 2
	adds r3, r1
	ldrh r1, [r4, 0x24]
	ldrh r2, [r3]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r4, 0x26]
	ldrh r3, [r3, 0x2]
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0xFF
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08083F20 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x8
	orrs r0, r2
	strb r0, [r1, 0x5]
	ldrh r0, [r4, 0x3C]
	strh r0, [r1, 0x2E]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x3A]
	subs r0, 0x1
	strh r0, [r4, 0x3A]
	movs r0, 0x17
	bl PlaySE
_08083F00:
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08083F12
	movs r0, 0x20
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_08083F12:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083F18: .4byte gUnknown_83CBF88
_08083F1C: .4byte gUnknown_83CC010
_08083F20: .4byte gSprites
	thumb_func_end PokeballGlowEffect_0

	thumb_func_start PokeballGlowEffect_1
PokeballGlowEffect_1: @ 8083F24
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	subs r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bne _08083F54
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	movs r0, 0x8
	strh r0, [r1, 0x30]
	strh r2, [r1, 0x32]
	strh r2, [r1, 0x34]
	movs r2, 0x38
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _08083F54
	movs r0, 0x80
	lsls r0, 1
	bl PlayFanfare
_08083F54:
	pop {r0}
	bx r0
	thumb_func_end PokeballGlowEffect_1

	thumb_func_start PokeballGlowEffect_2
PokeballGlowEffect_2: @ 8083F58
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r0, 0
	ldrh r0, [r7, 0x30]
	subs r0, 0x1
	strh r0, [r7, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _08083F88
	movs r0, 0x8
	strh r0, [r7, 0x30]
	ldrh r0, [r7, 0x32]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	strh r0, [r7, 0x32]
	cmp r0, 0
	bne _08083F88
	ldrh r0, [r7, 0x34]
	adds r0, 0x1
	strh r0, [r7, 0x34]
_08083F88:
	ldrh r4, [r7, 0x32]
	adds r4, 0x3
	movs r0, 0x3
	mov r8, r0
	mov r1, r8
	ands r4, r1
	ldr r3, _08084080 @ =0x00001007
	mov r10, r3
	mov r0, r10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x84
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	ldr r6, _08084084 @ =gUnknown_83CC028
	adds r1, r4, r6
	ldrb r1, [r1]
	ldr r5, _08084088 @ =gUnknown_83CC02C
	adds r2, r4, r5
	ldrb r2, [r2]
	ldr r3, _0808408C @ =gUnknown_83CC030
	mov r9, r3
	add r4, r9
	ldrb r3, [r4]
	bl MultiplyInvertedPaletteRGBComponents
	ldrh r4, [r7, 0x32]
	adds r4, 0x2
	mov r0, r8
	ands r4, r0
	mov r0, r10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x83
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	adds r1, r4, r6
	ldrb r1, [r1]
	adds r2, r4, r5
	ldrb r2, [r2]
	add r4, r9
	ldrb r3, [r4]
	bl MultiplyInvertedPaletteRGBComponents
	ldrh r4, [r7, 0x32]
	adds r4, 0x1
	mov r3, r8
	ands r4, r3
	mov r0, r10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x81
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	adds r1, r4, r6
	ldrb r1, [r1]
	adds r2, r4, r5
	ldrb r2, [r2]
	add r4, r9
	ldrb r3, [r4]
	bl MultiplyInvertedPaletteRGBComponents
	ldrh r4, [r7, 0x32]
	lsls r4, 24
	lsrs r4, 24
	mov r0, r10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r3, _08084090 @ =0x01050000
	adds r0, r3
	lsrs r0, 16
	adds r6, r4, r6
	ldrb r6, [r6]
	adds r5, r4, r5
	ldrb r5, [r5]
	add r4, r9
	ldrb r4, [r4]
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl MultiplyInvertedPaletteRGBComponents
	mov r0, r10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r1, _08084094 @ =0x01030000
	adds r0, r1
	lsrs r0, 16
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl MultiplyInvertedPaletteRGBComponents
	movs r3, 0x34
	ldrsh r0, [r7, r3]
	cmp r0, 0x2
	ble _08084072
	ldrh r0, [r7, 0x2E]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r7, 0x2E]
	movs r0, 0x8
	strh r0, [r7, 0x30]
	strh r1, [r7, 0x32]
_08084072:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084080: .4byte 0x00001007
_08084084: .4byte gUnknown_83CC028
_08084088: .4byte gUnknown_83CC02C
_0808408C: .4byte gUnknown_83CC030
_08084090: .4byte 0x01050000
_08084094: .4byte 0x01030000
	thumb_func_end PokeballGlowEffect_2

	thumb_func_start PokeballGlowEffect_3
PokeballGlowEffect_3: @ 8084098
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	subs r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080840C8
	movs r0, 0x8
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x32]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	strh r0, [r2, 0x32]
	cmp r0, 0x3
	bne _080840C8
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	movs r0, 0x1E
	strh r0, [r2, 0x30]
_080840C8:
	ldrh r4, [r2, 0x32]
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08084174 @ =0x00001007
	mov r8, r0
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x84
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	ldr r1, _08084178 @ =gUnknown_83CC028
	adds r1, r4, r1
	ldrb r6, [r1]
	ldr r1, _0808417C @ =gUnknown_83CC02C
	adds r1, r4, r1
	ldrb r5, [r1]
	ldr r1, _08084180 @ =gUnknown_83CC030
	adds r4, r1
	ldrb r4, [r4]
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl MultiplyInvertedPaletteRGBComponents
	mov r0, r8
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x83
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl MultiplyInvertedPaletteRGBComponents
	mov r0, r8
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x81
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl MultiplyInvertedPaletteRGBComponents
	mov r0, r8
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r1, _08084184 @ =0x01050000
	adds r0, r1
	lsrs r0, 16
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl MultiplyInvertedPaletteRGBComponents
	mov r0, r8
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r1, _08084188 @ =0x01030000
	adds r0, r1
	lsrs r0, 16
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl MultiplyInvertedPaletteRGBComponents
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084174: .4byte 0x00001007
_08084178: .4byte gUnknown_83CC028
_0808417C: .4byte gUnknown_83CC02C
_08084180: .4byte gUnknown_83CC030
_08084184: .4byte 0x01050000
_08084188: .4byte 0x01030000
	thumb_func_end PokeballGlowEffect_3

	thumb_func_start PokeballGlowEffect_4
PokeballGlowEffect_4: @ 808418C
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	subs r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080841A2
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
_080841A2:
	pop {r0}
	bx r0
	thumb_func_end PokeballGlowEffect_4

	thumb_func_start PokeballGlowEffect_5
PokeballGlowEffect_5: @ 80841A8
	ldrh r1, [r0, 0x2E]
	adds r1, 0x1
	strh r1, [r0, 0x2E]
	bx lr
	thumb_func_end PokeballGlowEffect_5

	thumb_func_start PokeballGlowEffect_6
PokeballGlowEffect_6: @ 80841B0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080841C6
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _080841CC
_080841C6:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_080841CC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PokeballGlowEffect_6

	thumb_func_start nullsub_50
nullsub_50: @ 80841D4
	bx lr
	thumb_func_end nullsub_50

	thumb_func_start SpriteCB_PokeballGlow
SpriteCB_PokeballGlow: @ 80841D8
	push {lr}
	adds r3, r0, 0
	ldr r2, _080841FC @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	ble _080841F8
	adds r0, r3, 0
	bl FieldEffectFreeGraphicsResources
_080841F8:
	pop {r0}
	bx r0
	.align 2, 0
_080841FC: .4byte gSprites
	thumb_func_end SpriteCB_PokeballGlow

	thumb_func_start PokecenterHealEffectHelper
PokecenterHealEffectHelper: @ 8084200
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _08084244 @ =gUnknown_83CBFA0
	lsls r3, 16
	asrs r3, 16
	lsls r2, 16
	asrs r2, 16
	adds r1, r3, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r1, _08084248 @ =gSprites
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	movs r3, 0x8
	orrs r1, r3
	strb r1, [r2, 0x5]
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r2]
	pop {r1}
	bx r1
	.align 2, 0
_08084244: .4byte gUnknown_83CBFA0
_08084248: .4byte gSprites
	thumb_func_end PokecenterHealEffectHelper

	thumb_func_start sub_808424C
sub_808424C: @ 808424C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08084270
	movs r0, 0
	strh r0, [r4, 0x2E]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x5
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
_08084270:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08084284
	adds r0, r4, 0
	bl FieldEffectFreeGraphicsResources
_08084284:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_808424C

	thumb_func_start sub_808428C
sub_808428C: @ 808428C
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _080842A8 @ =gUnknown_83CBFB8
	lsls r3, 16
	asrs r3, 16
	lsls r2, 16
	asrs r2, 16
	adds r1, r3, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	pop {r0}
	bx r0
	.align 2, 0
_080842A8: .4byte gUnknown_83CBFB8
	thumb_func_end sub_808428C

	thumb_func_start sub_80842AC
sub_80842AC: @ 80842AC
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080842C2
	adds r0, r2, 0
	bl FieldEffectFreeGraphicsResources
_080842C2:
	pop {r0}
	bx r0
	thumb_func_end sub_80842AC

	thumb_func_start sub_80842C8
sub_80842C8: @ 80842C8
	push {lr}
	ldr r0, _080842DC @ =CB2_ReturnToField
	bl SetMainCallback2
	ldr r1, _080842E0 @ =gFieldCallback
	ldr r0, _080842E4 @ =mapldr_080842E8
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080842DC: .4byte CB2_ReturnToField
_080842E0: .4byte gFieldCallback
_080842E4: .4byte mapldr_080842E8
	thumb_func_end sub_80842C8

	thumb_func_start mapldr_080842E8
mapldr_080842E8: @ 80842E8
	push {lr}
	bl sub_807DC00
	ldr r0, _08084308 @ =task00_8084310
	movs r1, 0
	bl CreateTask
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r1, _0808430C @ =gFieldCallback
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08084308: .4byte task00_8084310
_0808430C: .4byte gFieldCallback
	thumb_func_end mapldr_080842E8

	thumb_func_start task00_8084310
task00_8084310: @ 8084310
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0808437C @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r6, [r4, r0]
	cmp r6, 0
	bne _08084350
	bl sub_807AA70
	lsls r0, 24
	cmp r0, 0
	beq _08084376
	bl GetCursorSelectionMonId
	ldr r1, _08084380 @ =gFieldEffectArguments
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1]
	cmp r0, 0x5
	ble _08084344
	str r6, [r1]
_08084344:
	movs r0, 0x1F
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08084350:
	movs r0, 0x1F
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08084376
	bl sub_8054CA0
	bl WarpIntoMap
	ldr r0, _08084384 @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r1, _08084388 @ =gFieldCallback
	ldr r0, _0808438C @ =mapldr_08084390
	str r0, [r1]
	adds r0, r5, 0
	bl DestroyTask
_08084376:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808437C: .4byte gTasks
_08084380: .4byte gFieldEffectArguments
_08084384: .4byte CB2_LoadMap
_08084388: .4byte gFieldCallback
_0808438C: .4byte mapldr_08084390
	thumb_func_end task00_8084310

	thumb_func_start mapldr_08084390
mapldr_08084390: @ 8084390
	push {r4,lr}
	bl Overworld_PlaySpecialMapMusic
	bl sub_807DC00
	ldr r0, _080843E8 @ =c3_080843F8
	movs r1, 0
	bl CreateTask
	ldr r4, _080843EC @ =gMapObjects
	ldr r3, _080843F0 @ =gPlayerAvatar
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x1]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldrb r1, [r3]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080843D2
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x3
	bl FieldObjectTurn
_080843D2:
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r1, _080843F4 @ =gFieldCallback
	movs r0, 0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080843E8: .4byte c3_080843F8
_080843EC: .4byte gMapObjects
_080843F0: .4byte gPlayerAvatar
_080843F4: .4byte gFieldCallback
	thumb_func_end mapldr_08084390

	thumb_func_start c3_080843F8
c3_080843F8: @ 80843F8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0808444C @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0808442A
	ldr r0, _08084450 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08084444
	movs r0, 0x20
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0808442A:
	movs r0, 0x20
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08084444
	bl ScriptContext2_Disable
	bl UnfreezeMapObjects
	adds r0, r5, 0
	bl DestroyTask
_08084444:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808444C: .4byte gTasks
_08084450: .4byte gPaletteFade
	thumb_func_end c3_080843F8

	thumb_func_start sub_8084454
sub_8084454: @ 8084454
	push {lr}
	bl Overworld_PlaySpecialMapMusic
	bl pal_fill_for_maplights
	bl sub_8111CF0
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r0, _0808447C @ =sub_8084484
	movs r1, 0
	bl CreateTask
	ldr r1, _08084480 @ =gFieldCallback
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0808447C: .4byte sub_8084484
_08084480: .4byte gFieldCallback
	thumb_func_end sub_8084454

	thumb_func_start sub_8084484
sub_8084484: @ 8084484
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080844B4 @ =gTasks
	adds r4, r1, r0
	ldr r5, _080844B8 @ =gUnknown_83CC034
_08084496:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _08084496
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080844B4: .4byte gTasks
_080844B8: .4byte gUnknown_83CC034
	thumb_func_end sub_8084484

	thumb_func_start sub_80844BC
sub_80844BC: @ 80844BC
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	mov r9, r0
	ldr r6, _08084558 @ =gPlayerAvatar
	ldrb r0, [r6, 0x5]
	lsls r5, r0, 3
	adds r5, r0
	lsls r5, 2
	ldr r0, _0808455C @ =gMapObjects
	mov r8, r0
	add r5, r8
	ldrb r0, [r6, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08084560 @ =gSprites
	adds r4, r0
	bl CameraObjectReset2
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	add r0, r8
	ldrb r1, [r0, 0x1]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x1]
	movs r0, 0x1
	strb r0, [r6, 0x6]
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	bl sub_8063EB8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetHeldMovement
	adds r3, r4, 0
	adds r3, 0x42
	ldrb r0, [r3]
	lsrs r0, 6
	mov r1, r9
	strh r0, [r1, 0x10]
	ldrb r0, [r5, 0x3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r5, 0x3]
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	ldrb r1, [r3]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r3]
	mov r1, r9
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x1
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08084558: .4byte gPlayerAvatar
_0808455C: .4byte gMapObjects
_08084560: .4byte gSprites
	thumb_func_end sub_80844BC

	thumb_func_start sub_8084564
sub_8084564: @ 8084564
	push {r4,lr}
	adds r4, r0, 0
	bl sub_807AA70
	lsls r0, 24
	cmp r0, 0
	beq _08084578
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08084578:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8084564

	thumb_func_start sub_8084580
sub_8084580: @ 8084580
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080845E4 @ =gPlayerAvatar
	ldrb r0, [r6, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _080845E8 @ =gSprites
	adds r2, r0
	adds r0, r2, 0
	adds r0, 0x29
	movs r4, 0
	ldrsb r4, [r0, r4]
	lsls r0, r4, 17
	negs r0, r0
	ldrh r1, [r2, 0x22]
	ldr r3, _080845EC @ =gSpriteCoordOffsetY
	adds r1, r4
	ldrh r3, [r3]
	adds r1, r3
	asrs r0, 16
	adds r0, r1
	negs r0, r0
	movs r1, 0
	strh r0, [r2, 0x26]
	movs r0, 0x1
	strh r0, [r5, 0xA]
	strh r1, [r5, 0xC]
	ldr r2, _080845F0 @ =gMapObjects
	ldrb r0, [r6, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	movs r0, 0x25
	bl PlaySE
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080845E4: .4byte gPlayerAvatar
_080845E8: .4byte gSprites
_080845EC: .4byte gSpriteCoordOffsetY
_080845F0: .4byte gMapObjects
	thumb_func_end sub_8084580

	thumb_func_start sub_80845F4
sub_80845F4: @ 80845F4
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r2, _080846A0 @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080846A4 @ =gMapObjects
	adds r6, r0, r1
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080846A8 @ =gSprites
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	ldrh r1, [r5, 0x26]
	adds r0, r1
	strh r0, [r5, 0x26]
	ldrh r2, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bgt _08084636
	ldrh r1, [r4, 0xC]
	adds r0, r2, r1
	strh r0, [r4, 0xC]
	movs r1, 0xF
	ands r0, r1
	cmp r0, 0
	beq _08084636
	lsls r0, r2, 1
	strh r0, [r4, 0xA]
_08084636:
	ldrh r2, [r4, 0xE]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08084674
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	blt _08084674
	adds r0, r2, 0x1
	strh r0, [r4, 0xE]
	ldrb r1, [r6, 0x3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r6, 0x3]
	ldrb r1, [r4, 0x10]
	adds r3, r5, 0
	adds r3, 0x42
	lsls r1, 6
	ldrb r2, [r3]
	movs r0, 0x3F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
_08084674:
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _08084698
	movs r0, 0xCF
	bl PlaySE
	ldrb r0, [r6]
	movs r1, 0x8
	orrs r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r6]
	movs r0, 0
	strh r0, [r5, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08084698:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080846A0: .4byte gPlayerAvatar
_080846A4: .4byte gMapObjects
_080846A8: .4byte gSprites
	thumb_func_end sub_80845F4

	thumb_func_start sub_80846AC
sub_80846AC: @ 80846AC
	push {lr}
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	movs r2, 0
	strh r1, [r0, 0x8]
	movs r1, 0x4
	strh r1, [r0, 0xA]
	strh r2, [r0, 0xC]
	movs r0, 0
	bl SetCameraPanningCallback
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_80846AC

	thumb_func_start sub_80846C8
sub_80846C8: @ 80846C8
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl SetCameraPanning
	ldrh r0, [r4, 0xA]
	negs r2, r0
	strh r2, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _080846F0
	lsls r0, r2, 16
	asrs r0, 17
	strh r0, [r4, 0xA]
_080846F0:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080846FE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080846FE:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80846C8

	thumb_func_start sub_8084708
sub_8084708: @ 8084708
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _08084778 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0x6]
	bl ScriptContext2_Disable
	bl CameraObjectReset1
	bl UnfreezeMapObjects
	bl InstallCameraPanAheadCallback
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r0, 16
	bl sub_8055B38
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08084760
	ldr r0, _0808477C @ =0x00004001
	movs r1, 0x1
	bl VarSet
	movs r0, 0x8
	bl SetPlayerAvatarTransitionFlags
	movs r0, 0x16
	bl HelpSystem_SetSomeVariable2
_08084760:
	ldr r0, _08084780 @ =sub_8084484
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08084778: .4byte gPlayerAvatar
_0808477C: .4byte 0x00004001
_08084780: .4byte sub_8084484
	thumb_func_end sub_8084708

	thumb_func_start sub_8084784
sub_8084784: @ 8084784
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _080847B8 @ =sub_80847C0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080847BC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0xA]
	cmp r4, 0x6A
	bne _080847B0
	movs r0, 0x1
	strh r0, [r1, 0xA]
_080847B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080847B8: .4byte sub_80847C0
_080847BC: .4byte gTasks
	thumb_func_end sub_8084784

	thumb_func_start sub_80847C0
sub_80847C0: @ 80847C0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080847F0 @ =gTasks
	adds r4, r1, r0
	ldr r5, _080847F4 @ =gUnknown_83CC050
_080847D2:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080847D2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080847F0: .4byte gTasks
_080847F4: .4byte gUnknown_83CC050
	thumb_func_end sub_80847C0

	thumb_func_start sub_80847F8
sub_80847F8: @ 80847F8
	push {r4,lr}
	adds r4, r0, 0
	bl player_bitmagic
	bl CameraObjectReset2
	ldrb r0, [r4, 0xA]
	bl sub_809C448
	movs r0, 0x1
	bl sub_81128BC
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80847F8

	thumb_func_start sub_8084820
sub_8084820: @ 8084820
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08084888 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0808488C @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _0808484A
	adds r0, r4, 0
	bl FieldObjectClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _0808487E
_0808484A:
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	bl sub_8063EB8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetHeldMovement
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r5, 0x8]
	strh r1, [r5, 0xC]
	strh r1, [r5, 0xE]
	ldrb r0, [r5, 0xA]
	cmp r0, 0
	bne _08084878
	movs r0, 0x4
	strh r0, [r5, 0x8]
_08084878:
	movs r0, 0x49
	bl PlaySE
_0808487E:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08084888: .4byte gPlayerAvatar
_0808488C: .4byte gMapObjects
	thumb_func_end sub_8084820

	thumb_func_start sub_8084890
sub_8084890: @ 8084890
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80848F8
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	ble _080848AA
	bl sub_8084990
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080848AA:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8084890

	thumb_func_start sub_80848B4
sub_80848B4: @ 80848B4
	push {lr}
	bl sub_80848F8
	bl sub_80849A0
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80848B4

	thumb_func_start sub_80848C4
sub_80848C4: @ 80848C4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8084944
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	ble _080848DE
	bl sub_8084990
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080848DE:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80848C4

	thumb_func_start sub_80848E8
sub_80848E8: @ 80848E8
	push {lr}
	bl sub_8084944
	bl sub_80849A0
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80848E8

	thumb_func_start sub_80848F8
sub_80848F8: @ 80848F8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _0808493C @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08084940 @ =gSprites
	adds r4, r0
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	movs r0, 0x84
	bl Cos
	strh r0, [r4, 0x24]
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	movs r0, 0x94
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	strh r0, [r5, 0xE]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08084936
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
_08084936:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808493C: .4byte gPlayerAvatar
_08084940: .4byte gSprites
	thumb_func_end sub_80848F8

	thumb_func_start sub_8084944
sub_8084944: @ 8084944
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08084988 @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0808498C @ =gSprites
	adds r4, r0
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	movs r0, 0x7C
	bl Cos
	strh r0, [r4, 0x24]
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	movs r0, 0x76
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	strh r0, [r5, 0xE]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08084982
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
_08084982:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08084988: .4byte gPlayerAvatar
_0808498C: .4byte gSprites
	thumb_func_end sub_8084944

	thumb_func_start sub_8084990
sub_8084990: @ 8084990
	push {lr}
	bl sub_8055F88
	bl sub_807DC18
	pop {r0}
	bx r0
	thumb_func_end sub_8084990

	thumb_func_start sub_80849A0
sub_80849A0: @ 80849A0
	push {lr}
	ldr r0, _080849E0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080849DC
	bl sub_8055FC4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080849DC
	bl sub_809C460
	bl WarpIntoMap
	ldr r1, _080849E4 @ =gFieldCallback
	ldr r0, _080849E8 @ =sub_80849F4
	str r0, [r1]
	ldr r0, _080849EC @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r0, _080849F0 @ =sub_80847C0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080849DC:
	pop {r0}
	bx r0
	.align 2, 0
_080849E0: .4byte gPaletteFade
_080849E4: .4byte gFieldCallback
_080849E8: .4byte sub_80849F4
_080849EC: .4byte CB2_LoadMap
_080849F0: .4byte sub_80847C0
	thumb_func_end sub_80849A0

	thumb_func_start sub_80849F4
sub_80849F4: @ 80849F4
	push {lr}
	bl Overworld_PlaySpecialMapMusic
	bl pal_fill_for_maplights
	bl sub_8111CF0
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r0, _08084A1C @ =sub_8084A24
	movs r1, 0
	bl CreateTask
	ldr r1, _08084A20 @ =gFieldCallback
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08084A1C: .4byte sub_8084A24
_08084A20: .4byte gFieldCallback
	thumb_func_end sub_80849F4

	thumb_func_start sub_8084A24
sub_8084A24: @ 8084A24
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08084A54 @ =gTasks
	adds r4, r1, r0
	ldr r5, _08084A58 @ =gUnknown_83CC068
_08084A36:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _08084A36
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08084A54: .4byte gTasks
_08084A58: .4byte gUnknown_83CC068
	thumb_func_end sub_8084A24

	thumb_func_start sub_8084A5C
sub_8084A5C: @ 8084A5C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	bl CameraObjectReset2
	ldr r0, _08084ABC @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08084AC0 @ =gMapObjects
	adds r4, r0
	movs r0, 0x4
	bl sub_8063EB8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetHeldMovement
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r1, r0, 24
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x10
	strh r0, [r5, 0xA]
	cmp r1, 0x6B
	bne _08084AC4
	movs r1, 0x1
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _08084AC6
	.align 2, 0
_08084ABC: .4byte gPlayerAvatar
_08084AC0: .4byte gMapObjects
_08084AC4:
	movs r1, 0
_08084AC6:
	adds r0, r1, 0
	bl sub_809C448
	movs r0, 0x1
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8084A5C

	thumb_func_start sub_8084AD8
sub_8084AD8: @ 8084AD8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08084B10 @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08084B14 @ =gSprites
	adds r4, r0
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	movs r0, 0x84
	bl Cos
	strh r0, [r4, 0x24]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	movs r0, 0x94
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08084B10: .4byte gPlayerAvatar
_08084B14: .4byte gSprites
	thumb_func_end sub_8084AD8

	thumb_func_start sub_8084B18
sub_8084B18: @ 8084B18
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _08084B70 @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08084B74 @ =gSprites
	adds r5, r0, r1
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0x84
	bl Cos
	strh r0, [r5, 0x24]
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0x94
	bl Sin
	strh r0, [r5, 0x26]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08084B56
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
_08084B56:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08084B66
	strh r0, [r5, 0x24]
	strh r0, [r5, 0x26]
	movs r0, 0x5
	strh r0, [r4, 0x8]
_08084B66:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08084B70: .4byte gPlayerAvatar
_08084B74: .4byte gSprites
	thumb_func_end sub_8084B18

	thumb_func_start sub_8084B78
sub_8084B78: @ 8084B78
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08084BB0 @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08084BB4 @ =gSprites
	adds r4, r0
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	movs r0, 0x7C
	bl Cos
	strh r0, [r4, 0x24]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	movs r0, 0x76
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08084BB0: .4byte gPlayerAvatar
_08084BB4: .4byte gSprites
	thumb_func_end sub_8084B78

	thumb_func_start sub_8084BB8
sub_8084BB8: @ 8084BB8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _08084C10 @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08084C14 @ =gSprites
	adds r5, r0, r1
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0x7C
	bl Cos
	strh r0, [r5, 0x24]
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0x76
	bl Sin
	strh r0, [r5, 0x26]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08084BF6
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
_08084BF6:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08084C08
	strh r0, [r5, 0x24]
	strh r0, [r5, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08084C08:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08084C10: .4byte gPlayerAvatar
_08084C14: .4byte gSprites
	thumb_func_end sub_8084BB8

	thumb_func_start sub_8084C18
sub_8084C18: @ 8084C18
	push {r4,lr}
	adds r4, r0, 0
	bl sub_809C474
	lsls r0, 24
	cmp r0, 0
	bne _08084C34
	bl sub_809C460
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	b _08084C36
_08084C34:
	movs r0, 0
_08084C36:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8084C18

	thumb_func_start sub_8084C3C
sub_8084C3C: @ 8084C3C
	push {r4,lr}
	ldr r0, _08084C94 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08084C98 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _08084C8A
	bl CameraObjectReset1
	bl ScriptContext2_Disable
	bl UnfreezeMapObjects
	movs r0, 0x4
	bl sub_8063F84
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetHeldMovement
	ldr r0, _08084C9C @ =sub_8084A24
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0x2
	bl sub_81128BC
_08084C8A:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08084C94: .4byte gPlayerAvatar
_08084C98: .4byte gMapObjects
_08084C9C: .4byte sub_8084A24
	thumb_func_end sub_8084C3C

	thumb_func_start oei_waterfall
oei_waterfall: @ 8084CA0
	push {r4,lr}
	ldr r4, _08084CCC @ =sub_8084CD8
	adds r0, r4, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08084CD0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _08084CD4 @ =gFieldEffectArguments
	ldr r2, [r2]
	strh r2, [r1, 0xA]
	bl _call_via_r4
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08084CCC: .4byte sub_8084CD8
_08084CD0: .4byte gTasks
_08084CD4: .4byte gFieldEffectArguments
	thumb_func_end oei_waterfall

	thumb_func_start sub_8084CD8
sub_8084CD8: @ 8084CD8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08084D14 @ =gUnknown_83CC084
	ldr r2, _08084D18 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08084CEA:
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	lsls r2, 2
	adds r2, r5
	ldr r0, _08084D1C @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08084D20 @ =gMapObjects
	adds r1, r0
	ldr r2, [r2]
	adds r0, r4, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	bne _08084CEA
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08084D14: .4byte gUnknown_83CC084
_08084D18: .4byte gTasks
_08084D1C: .4byte gPlayerAvatar
_08084D20: .4byte gMapObjects
	thumb_func_end sub_8084CD8

	thumb_func_start sub_8084D24
sub_8084D24: @ 8084D24
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	ldr r1, _08084D40 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08084D40: .4byte gPlayerAvatar
	thumb_func_end sub_8084D24

	thumb_func_start waterfall_1_do_anim_probably
waterfall_1_do_anim_probably: @ 8084D44
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl ScriptContext2_Enable
	adds r0, r5, 0
	bl FieldObjectIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	bne _08084D74
	adds r0, r5, 0
	bl FieldObjectClearHeldMovementIfFinished
	ldr r1, _08084D7C @ =gFieldEffectArguments
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r0, 0x3B
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08084D74:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08084D7C: .4byte gFieldEffectArguments
	thumb_func_end waterfall_1_do_anim_probably

	thumb_func_start waterfall_2_wait_anim_finish_probably
waterfall_2_wait_anim_finish_probably: @ 8084D80
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08084D9A
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	b _08084D9C
_08084D9A:
	movs r0, 0
_08084D9C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end waterfall_2_wait_anim_finish_probably

	thumb_func_start sub_8084DA4
sub_8084DA4: @ 8084DA4
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r0, 0x2
	bl sub_8063F2C
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetHeldMovement
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8084DA4

	thumb_func_start sub_8084DCC
sub_8084DCC: @ 8084DCC
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	bl FieldObjectClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	bne _08084DE2
	movs r0, 0
	b _08084E1E
_08084DE2:
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08084E18
	bl ScriptContext2_Disable
	ldr r0, _08084E10 @ =gPlayerAvatar
	strb r4, [r0, 0x6]
	ldr r0, _08084E14 @ =sub_8084CD8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0x2B
	bl FieldEffectActiveListRemove
	movs r0, 0
	b _08084E1E
	.align 2, 0
_08084E10: .4byte gPlayerAvatar
_08084E14: .4byte sub_8084CD8
_08084E18:
	movs r0, 0x3
	strh r0, [r5, 0x8]
	movs r0, 0x1
_08084E1E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8084DCC

	thumb_func_start FldEff_UseDive
FldEff_UseDive: @ 8084E24
	push {r4,lr}
	ldr r4, _08084E54 @ =sub_8084E60
	adds r0, r4, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08084E58 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _08084E5C @ =gFieldEffectArguments
	ldr r2, [r3]
	strh r2, [r1, 0x26]
	ldr r2, [r3, 0x4]
	strh r2, [r1, 0x24]
	bl _call_via_r4
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08084E54: .4byte sub_8084E60
_08084E58: .4byte gTasks
_08084E5C: .4byte gFieldEffectArguments
	thumb_func_end FldEff_UseDive

	thumb_func_start sub_8084E60
sub_8084E60: @ 8084E60
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08084E90 @ =gUnknown_83CC098
	ldr r2, _08084E94 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08084E72:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _08084E72
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08084E90: .4byte gUnknown_83CC098
_08084E94: .4byte gTasks
	thumb_func_end sub_8084E60

	thumb_func_start dive_1_lock
dive_1_lock: @ 8084E98
	ldr r2, _08084EA8 @ =gPlayerAvatar
	movs r1, 0x1
	strb r1, [r2, 0x6]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	movs r0, 0
	bx lr
	.align 2, 0
_08084EA8: .4byte gPlayerAvatar
	thumb_func_end dive_1_lock

	thumb_func_start dive_2_unknown
dive_2_unknown: @ 8084EAC
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	ldr r1, _08084ED0 @ =gFieldEffectArguments
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r0, 0x3B
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08084ED0: .4byte gFieldEffectArguments
	thumb_func_end dive_2_unknown

	thumb_func_start dive_3_unknown
dive_3_unknown: @ 8084ED4
	push {lr}
	sub sp, 0x8
	mov r1, sp
	adds r1, 0x2
	mov r0, sp
	bl PlayerGetDestCoords
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08084F18
	ldr r2, _08084F20 @ =gMapObjects
	ldr r0, _08084F24 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1E]
	mov r0, sp
	bl dive_warp
	ldr r0, _08084F28 @ =sub_8084E60
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0x2C
	bl FieldEffectActiveListRemove
_08084F18:
	movs r0, 0
	add sp, 0x8
	pop {r1}
	bx r1
	.align 2, 0
_08084F20: .4byte gMapObjects
_08084F24: .4byte gPlayerAvatar
_08084F28: .4byte sub_8084E60
	thumb_func_end dive_3_unknown

	thumb_func_start sub_8084F2C
sub_8084F2C: @ 8084F2C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08084F40 @ =sub_8084F44
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08084F40: .4byte sub_8084F44
	thumb_func_end sub_8084F2C

	thumb_func_start sub_8084F44
sub_8084F44: @ 8084F44
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _08084F8C @ =gUnknown_83CC0A4
	ldr r2, _08084F90 @ =gTasks
	ldr r5, _08084F94 @ =gPlayerAvatar
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08084F58:
	movs r0, 0x8
	ldrsh r3, [r4, r0]
	lsls r3, 2
	adds r3, r6
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08084F98 @ =gMapObjects
	adds r1, r0
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08084F9C @ =gSprites
	adds r2, r0
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _08084F58
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084F8C: .4byte gUnknown_83CC0A4
_08084F90: .4byte gTasks
_08084F94: .4byte gPlayerAvatar
_08084F98: .4byte gMapObjects
_08084F9C: .4byte gSprites
	thumb_func_end sub_8084F44

	thumb_func_start sub_8084FA0
sub_8084FA0: @ 8084FA0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl player_bitmagic
	bl CameraObjectReset2
	movs r0, 0
	bl SetCameraPanningCallback
	ldr r0, _08084FD4 @ =gPlayerAvatar
	movs r2, 0x1
	strb r2, [r0, 0x6]
	ldrb r0, [r5, 0x3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5, 0x3]
	strh r2, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08084FD4: .4byte gPlayerAvatar
	thumb_func_end sub_8084FA0

	thumb_func_start sub_8084FD8
sub_8084FD8: @ 8084FD8
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl SetCameraPanning
	ldrh r0, [r4, 0xA]
	negs r0, r0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _08085004
	movs r0, 0
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08085004:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8084FD8

	thumb_func_start sub_808500C
sub_808500C: @ 808500C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0
	strh r0, [r2, 0x26]
	movs r0, 0x1
	strh r0, [r4, 0xE]
	ldr r3, _08085054 @ =gFieldEffectArguments
	movs r5, 0x10
	ldrsh r0, [r1, r5]
	str r0, [r3]
	movs r5, 0x12
	ldrsh r0, [r1, r5]
	str r0, [r3, 0x4]
	adds r0, r2, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r3, 0x8]
	ldrb r0, [r2, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r3, 0xC]
	movs r0, 0x32
	bl FieldEffectStart
	movs r0, 0xAB
	bl PlaySE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08085054: .4byte gFieldEffectArguments
	thumb_func_end sub_808500C

	thumb_func_start sub_8085058
sub_8085058: @ 8085058
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	adds r5, r2, 0
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl SetCameraPanning
	ldrh r0, [r4, 0xA]
	negs r2, r0
	strh r2, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r1, r0, 0x1
	strh r1, [r4, 0xC]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x11
	bgt _08085092
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	bne _080850A4
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x3
	bgt _080850A4
	lsls r0, r2, 1
	b _080850A2
_08085092:
	movs r0, 0x4
	ands r1, r0
	cmp r1, 0
	bne _080850A4
	lsls r0, r2, 16
	cmp r0, 0
	ble _080850A4
	asrs r0, 17
_080850A2:
	strh r0, [r4, 0xA]
_080850A4:
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	ble _080850F0
	adds r0, r5, 0
	adds r0, 0x29
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r2, r1, 17
	negs r2, r2
	movs r7, 0x26
	ldrsh r3, [r5, r7]
	movs r7, 0x22
	ldrsh r0, [r5, r7]
	adds r0, r1
	ldr r1, _080850E8 @ =gSpriteCoordOffsetY
	movs r7, 0
	ldrsh r1, [r1, r7]
	adds r0, r1
	asrs r2, 16
	adds r0, r2
	cmn r3, r0
	ble _080850EC
	ldrh r0, [r5, 0x26]
	ldrh r1, [r4, 0xE]
	subs r0, r1
	strh r0, [r5, 0x26]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x7
	bgt _080850F0
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _080850F0
	.align 2, 0
_080850E8: .4byte gSpriteCoordOffsetY
_080850EC:
	movs r0, 0x1
	strh r0, [r4, 0x10]
_080850F0:
	ldrh r2, [r4, 0x12]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0808512E
	movs r7, 0x26
	ldrsh r1, [r5, r7]
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _0808512E
	adds r0, r2, 0x1
	strh r0, [r4, 0x12]
	ldrb r0, [r6, 0x3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r6, 0x3]
	ldrb r1, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x5]
	adds r2, r5, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
_0808512E:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08085144
	movs r7, 0x10
	ldrsh r0, [r4, r7]
	cmp r0, 0
	beq _08085144
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08085144:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8085058

	thumb_func_start sub_808514C
sub_808514C: @ 808514C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8055F88
	bl sub_807DC18
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_808514C

	thumb_func_start sub_8085168
sub_8085168: @ 8085168
	push {lr}
	ldr r0, _080851A8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080851A0
	bl sub_8055FC4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080851A0
	bl WarpIntoMap
	ldr r1, _080851AC @ =gFieldCallback
	ldr r0, _080851B0 @ =mapldr_080851BC
	str r0, [r1]
	ldr r0, _080851B4 @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r0, _080851B8 @ =sub_8084F44
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080851A0:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080851A8: .4byte gPaletteFade
_080851AC: .4byte gFieldCallback
_080851B0: .4byte mapldr_080851BC
_080851B4: .4byte CB2_LoadMap
_080851B8: .4byte sub_8084F44
	thumb_func_end sub_8085168

	thumb_func_start mapldr_080851BC
mapldr_080851BC: @ 80851BC
	push {lr}
	bl Overworld_PlaySpecialMapMusic
	bl pal_fill_for_maplights
	bl sub_8111CF0
	bl ScriptContext2_Enable
	ldr r0, _080851E0 @ =gFieldCallback
	movs r1, 0
	str r1, [r0]
	ldr r0, _080851E4 @ =sub_80851E8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080851E0: .4byte gFieldCallback
_080851E4: .4byte sub_80851E8
	thumb_func_end mapldr_080851BC

	thumb_func_start sub_80851E8
sub_80851E8: @ 80851E8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _08085230 @ =gUnknown_83CC0BC
	ldr r2, _08085234 @ =gTasks
	ldr r5, _08085238 @ =gPlayerAvatar
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080851FC:
	movs r0, 0x8
	ldrsh r3, [r4, r0]
	lsls r3, 2
	adds r3, r6
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0808523C @ =gMapObjects
	adds r1, r0
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08085240 @ =gSprites
	adds r2, r0
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _080851FC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085230: .4byte gUnknown_83CC0BC
_08085234: .4byte gTasks
_08085238: .4byte gPlayerAvatar
_0808523C: .4byte gMapObjects
_08085240: .4byte gSprites
	thumb_func_end sub_80851E8

	thumb_func_start sub_8085244
sub_8085244: @ 8085244
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	bl CameraObjectReset2
	bl player_bitmagic
	ldr r1, _08085270 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08085270: .4byte gPlayerAvatar
	thumb_func_end sub_8085244

	thumb_func_start sub_8085274
sub_8085274: @ 8085274
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	bl sub_807AA70
	lsls r0, 24
	cmp r0, 0
	beq _080852B4
	ldr r1, _080852BC @ =gFieldEffectArguments
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	str r0, [r1]
	movs r2, 0x12
	ldrsh r0, [r5, r2]
	str r0, [r1, 0x4]
	adds r0, r6, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r1, 0x8]
	ldrb r0, [r6, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r1, 0xC]
	movs r0, 0x31
	bl FieldEffectStart
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080852B4:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080852BC: .4byte gFieldEffectArguments
	thumb_func_end sub_8085274

	thumb_func_start sub_80852C0
sub_80852C0: @ 80852C0
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0xA
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08085310 @ =gSprites
	adds r0, r1
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _08085308
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	ldrb r1, [r4, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	bl CameraObjectReset1
	movs r0, 0xA8
	bl PlaySE
	movs r0, 0x4
	bl sub_8064194
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetHeldMovement
_08085308:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08085310: .4byte gSprites
	thumb_func_end sub_80852C0

	thumb_func_start sub_8085314
sub_8085314: @ 8085314
	push {lr}
	adds r0, r1, 0
	bl FieldObjectClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _0808533E
	ldr r1, _08085344 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0x6]
	bl ScriptContext2_Disable
	bl UnfreezeMapObjects
	ldr r0, _08085348 @ =sub_80851E8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0808533E:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08085344: .4byte gPlayerAvatar
_08085348: .4byte sub_80851E8
	thumb_func_end sub_8085314

	thumb_func_start FldEff_LavaridgeGymWarp
FldEff_LavaridgeGymWarp: @ 808534C
	push {r4,lr}
	ldr r4, _080853A4 @ =gFieldEffectArguments
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8063BC4
	ldr r0, _080853A8 @ =gUnknown_83A0010
	adds r0, 0x84
	ldr r0, [r0]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080853AC @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	movs r1, 0x3
	ldrb r3, [r4, 0xC]
	ands r3, r1
	lsls r3, 2
	ldrb r4, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r4
	orrs r1, r3
	strb r1, [r2, 0x5]
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x2
	orrs r1, r3
	strb r1, [r2]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080853A4: .4byte gFieldEffectArguments
_080853A8: .4byte gUnknown_83A0010
_080853AC: .4byte gSprites
	thumb_func_end FldEff_LavaridgeGymWarp

	thumb_func_start sub_80853B0
sub_80853B0: @ 80853B0
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080853C8
	adds r0, r2, 0
	movs r1, 0x32
	bl FieldEffectStop
_080853C8:
	pop {r0}
	bx r0
	thumb_func_end sub_80853B0

	thumb_func_start sub_80853CC
sub_80853CC: @ 80853CC
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _080853E0 @ =sub_80853E4
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080853E0: .4byte sub_80853E4
	thumb_func_end sub_80853CC

	thumb_func_start sub_80853E4
sub_80853E4: @ 80853E4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _0808542C @ =gUnknown_83CC0CC
	ldr r2, _08085430 @ =gTasks
	ldr r5, _08085434 @ =gPlayerAvatar
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080853F8:
	movs r0, 0x8
	ldrsh r3, [r4, r0]
	lsls r3, 2
	adds r3, r6
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08085438 @ =gMapObjects
	adds r1, r0
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _0808543C @ =gSprites
	adds r2, r0
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _080853F8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808542C: .4byte gUnknown_83CC0CC
_08085430: .4byte gTasks
_08085434: .4byte gPlayerAvatar
_08085438: .4byte gMapObjects
_0808543C: .4byte gSprites
	thumb_func_end sub_80853E4

	thumb_func_start sub_8085440
sub_8085440: @ 8085440
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	bl player_bitmagic
	bl CameraObjectReset2
	ldr r1, _0808546C @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrb r0, [r4, 0x3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4, 0x3]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808546C: .4byte gPlayerAvatar
	thumb_func_end sub_8085440

	thumb_func_start sub_8085470
sub_8085470: @ 8085470
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r2, 0
	adds r0, r4, 0
	bl FieldObjectClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _080854E4
	ldrh r1, [r5, 0xA]
	movs r2, 0xA
	ldrsh r0, [r5, r2]
	cmp r0, 0x3
	ble _080854C4
	ldr r1, _080854C0 @ =gFieldEffectArguments
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	str r0, [r1, 0x4]
	adds r0, r6, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r1, 0x8]
	ldrb r0, [r6, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r1, 0xC]
	movs r0, 0x31
	bl FieldEffectStart
	strh r0, [r5, 0xA]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080854E4
	.align 2, 0
_080854C0: .4byte gFieldEffectArguments
_080854C4:
	adds r0, r1, 0x1
	strh r0, [r5, 0xA]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay4AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetHeldMovement
	movs r0, 0x21
	bl PlaySE
_080854E4:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8085470

	thumb_func_start sub_80854EC
sub_80854EC: @ 80854EC
	push {r4,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	ldr r2, _08085520 @ =gSprites
	movs r0, 0xA
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08085516
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_08085516:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08085520: .4byte gSprites
	thumb_func_end sub_80854EC

	thumb_func_start sub_8085524
sub_8085524: @ 8085524
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x31
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08085542
	bl sub_8055F88
	bl sub_807DC18
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08085542:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8085524

	thumb_func_start sub_808554C
sub_808554C: @ 808554C
	push {lr}
	ldr r0, _0808558C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08085584
	bl sub_8055FC4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085584
	bl WarpIntoMap
	ldr r1, _08085590 @ =gFieldCallback
	ldr r0, _08085594 @ =sub_8084454
	str r0, [r1]
	ldr r0, _08085598 @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r0, _0808559C @ =sub_80853E4
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08085584:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0808558C: .4byte gPaletteFade
_08085590: .4byte gFieldCallback
_08085594: .4byte sub_8084454
_08085598: .4byte CB2_LoadMap
_0808559C: .4byte sub_80853E4
	thumb_func_end sub_808554C

	thumb_func_start FldEff_PopOutOfAsh
FldEff_PopOutOfAsh: @ 80855A0
	push {r4,lr}
	ldr r4, _080855F8 @ =gFieldEffectArguments
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8063BC4
	ldr r0, _080855FC @ =gUnknown_83A0010
	adds r0, 0x80
	ldr r0, [r0]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08085600 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	movs r1, 0x3
	ldrb r3, [r4, 0xC]
	ands r3, r1
	lsls r3, 2
	ldrb r4, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r4
	orrs r1, r3
	strb r1, [r2, 0x5]
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x2
	orrs r1, r3
	strb r1, [r2]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080855F8: .4byte gFieldEffectArguments
_080855FC: .4byte gUnknown_83A0010
_08085600: .4byte gSprites
	thumb_func_end FldEff_PopOutOfAsh

	thumb_func_start sub_8085604
sub_8085604: @ 8085604
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0808561C
	adds r0, r2, 0
	movs r1, 0x31
	bl FieldEffectStop
_0808561C:
	pop {r0}
	bx r0
	thumb_func_end sub_8085604

	thumb_func_start sub_8085620
sub_8085620: @ 8085620
	push {lr}
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r0, _08085638 @ =sub_808563C
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08085638: .4byte sub_808563C
	thumb_func_end sub_8085620

	thumb_func_start sub_808563C
sub_808563C: @ 808563C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08085664 @ =gUnknown_83CC0E0
	ldr r2, _08085668 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08085664: .4byte gUnknown_83CC0E0
_08085668: .4byte gTasks
	thumb_func_end sub_808563C

	thumb_func_start sub_808566C
sub_808566C: @ 808566C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0x8]
	movs r0, 0x40
	strh r0, [r4, 0x22]
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x24]
	strh r5, [r4, 0x26]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_808566C

	thumb_func_start sub_8085690
sub_8085690: @ 8085690
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _080856D4 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080856D8 @ =gMapObjects
	adds r6, r0, r1
	adds r4, r5, 0
	adds r4, 0x8
	adds r1, r5, 0
	adds r1, 0xA
	adds r2, r5, 0
	adds r2, 0xC
	adds r0, r6, 0
	bl sub_808576C
	ldrh r1, [r4, 0x6]
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	cmp r0, 0x3B
	bgt _080856DC
	adds r0, r1, 0x1
	strh r0, [r4, 0x6]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _08085702
	movs r0, 0x27
	bl PlaySE
	b _08085702
	.align 2, 0
_080856D4: .4byte gPlayerAvatar
_080856D8: .4byte gMapObjects
_080856DC:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08085702
	adds r1, r5, 0
	adds r1, 0x12
	adds r2, r5, 0
	adds r2, 0x14
	adds r0, r6, 0
	bl sub_80857F0
	cmp r0, 0
	bne _08085702
	bl sub_8055F88
	bl sub_807DC18
	movs r0, 0x1
	strh r0, [r4, 0x8]
_08085702:
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	cmp r0, 0x1
	bne _08085750
	ldr r0, _08085758 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08085750
	bl sub_8055FC4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085750
	ldrh r1, [r5, 0x26]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl FieldObjectSetDirection
	bl sub_80555E0
	bl WarpIntoMap
	ldr r1, _0808575C @ =gFieldCallback
	ldr r0, _08085760 @ =sub_80859D4
	str r0, [r1]
	ldr r0, _08085764 @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r0, _08085768 @ =sub_808563C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08085750:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085758: .4byte gPaletteFade
_0808575C: .4byte gFieldCallback
_08085760: .4byte sub_80859D4
_08085764: .4byte CB2_LoadMap
_08085768: .4byte sub_808563C
	thumb_func_end sub_8085690

	thumb_func_start sub_808576C
sub_808576C: @ 808576C
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	adds r5, r2, 0
	bl FieldObjectIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _0808578A
	adds r0, r4, 0
	bl FieldObjectClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _080857E4
_0808578A:
	ldrh r1, [r6]
	movs r2, 0
	ldrsh r0, [r6, r2]
	cmp r0, 0
	beq _0808579E
	subs r0, r1, 0x1
	strh r0, [r6]
	lsls r0, 16
	cmp r0, 0
	bne _080857E4
_0808579E:
	ldr r7, _080857E0 @ =gUnknown_83CC0E8
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	adds r0, r7
	ldrb r0, [r0]
	bl sub_8063EB8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetHeldMovement
	ldrh r1, [r5]
	movs r2, 0
	ldrsh r0, [r5, r2]
	cmp r0, 0xB
	bgt _080857C8
	adds r0, r1, 0x1
	strh r0, [r5]
_080857C8:
	movs r0, 0
	ldrsh r1, [r5, r0]
	movs r0, 0xC
	asrs r0, r1
	strh r0, [r6]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	adds r0, r7
	ldrb r0, [r0]
	b _080857EA
	.align 2, 0
_080857E0: .4byte gUnknown_83CC0E8
_080857E4:
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
_080857EA:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_808576C

	thumb_func_start sub_80857F0
sub_80857F0: @ 80857F0
	push {r4-r7,lr}
	adds r7, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldrb r0, [r7, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08085818 @ =gSprites
	adds r4, r1, r0
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _08085830
	cmp r0, 0x1
	bgt _0808581C
	cmp r0, 0
	beq _08085826
	b _0808589A
	.align 2, 0
_08085818: .4byte gSprites
_0808581C:
	cmp r0, 0x2
	beq _08085878
	cmp r0, 0x3
	beq _08085896
	b _0808589A
_08085826:
	bl CameraObjectReset2
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_08085830:
	ldrh r0, [r4, 0x26]
	subs r0, 0x8
	strh r0, [r4, 0x26]
	ldrh r0, [r6]
	subs r0, 0x8
	strh r0, [r6]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bgt _0808589A
	ldrb r0, [r7, 0x3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r7, 0x3]
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0
	strb r0, [r1]
	adds r2, r4, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _0808589A
_08085878:
	ldrh r0, [r4, 0x26]
	subs r0, 0x8
	strh r0, [r4, 0x26]
	ldrh r0, [r6]
	subs r0, 0x8
	strh r0, [r6]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x58
	negs r1, r1
	cmp r0, r1
	bgt _0808589A
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_08085896:
	movs r0, 0
	b _0808589C
_0808589A:
	movs r0, 0x1
_0808589C:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80857F0

	thumb_func_start sub_80858A4
sub_80858A4: @ 80858A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r6, r0, 0
	adds r5, r1, 0
	adds r7, r2, 0
	mov r9, r3
	ldr r0, [sp, 0x20]
	mov r10, r0
	ldrb r0, [r6, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _080858D8 @ =gSprites
	adds r4, r1, r0
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _08085948
	cmp r0, 0x1
	bgt _080858DC
	cmp r0, 0
	beq _080858E6
	b _080859C2
	.align 2, 0
_080858D8: .4byte gSprites
_080858DC:
	cmp r0, 0x2
	beq _0808599C
	cmp r0, 0x3
	beq _080859BE
	b _080859C2
_080858E6:
	bl CameraObjectReset2
	movs r2, 0x58
	negs r2, r2
	adds r0, r2, 0
	strh r0, [r7]
	ldrh r0, [r4, 0x26]
	subs r0, 0x58
	movs r3, 0
	strh r0, [r4, 0x26]
	ldrb r0, [r4, 0x5]
	lsls r0, 28
	lsrs r0, 30
	mov r1, r9
	strh r0, [r1]
	movs r2, 0x43
	adds r2, r4
	mov r8, r2
	ldrb r0, [r2]
	mov r1, r10
	strh r0, [r1]
	movs r2, 0x42
	adds r2, r4
	mov r12, r2
	ldrb r0, [r2]
	lsrs r0, 6
	ldr r1, [sp, 0x24]
	strh r0, [r1]
	ldrb r0, [r6, 0x3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r6, 0x3]
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	mov r2, r8
	strb r3, [r2]
	mov r0, r12
	ldrb r1, [r0]
	movs r0, 0x3F
	ands r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_08085948:
	ldrh r0, [r4, 0x26]
	adds r0, 0x4
	strh r0, [r4, 0x26]
	ldrh r0, [r7]
	adds r0, 0x4
	strh r0, [r7]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	blt _080859C2
	movs r0, 0x3
	mov r2, r9
	ldrb r1, [r2]
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	mov r1, r10
	ldrh r0, [r1]
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldr r2, [sp, 0x24]
	ldrb r1, [r2]
	adds r3, r4, 0
	adds r3, 0x42
	lsls r1, 6
	ldrb r2, [r3]
	movs r0, 0x3F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _080859C2
_0808599C:
	ldrh r0, [r4, 0x26]
	adds r0, 0x4
	strh r0, [r4, 0x26]
	ldrh r0, [r7]
	adds r0, 0x4
	strh r0, [r7]
	lsls r0, 16
	cmp r0, 0
	blt _080859C2
	movs r0, 0x1E
	bl PlaySE
	bl CameraObjectReset1
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_080859BE:
	movs r0, 0
	b _080859C4
_080859C2:
	movs r0, 0x1
_080859C4:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80858A4

	thumb_func_start sub_80859D4
sub_80859D4: @ 80859D4
	push {lr}
	bl Overworld_PlaySpecialMapMusic
	bl pal_fill_for_maplights
	bl sub_8111CF0
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r1, _08085A14 @ =gFieldCallback
	movs r0, 0
	str r0, [r1]
	ldr r2, _08085A18 @ =gMapObjects
	ldr r0, _08085A1C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldr r0, _08085A20 @ =sub_8085A24
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08085A14: .4byte gFieldCallback
_08085A18: .4byte gMapObjects
_08085A1C: .4byte gPlayerAvatar
_08085A20: .4byte sub_8085A24
	thumb_func_end sub_80859D4

	thumb_func_start sub_8085A24
sub_8085A24: @ 8085A24
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08085A4C @ =gUnknown_83CC0F0
	ldr r2, _08085A50 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08085A4C: .4byte gUnknown_83CC0F0
_08085A50: .4byte gTasks
	thumb_func_end sub_8085A24

	thumb_func_start sub_8085A54
sub_8085A54: @ 8085A54
	push {r4,lr}
	adds r4, r0, 0
	bl sub_807AA70
	lsls r0, 24
	cmp r0, 0
	beq _08085A78
	movs r0, 0x28
	bl PlaySE
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08085A78:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8085A54

	thumb_func_start sub_8085A80
sub_8085A80: @ 8085A80
	push {r4-r7,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r4, 0
	adds r5, 0x8
	ldr r0, _08085AD4 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08085AD8 @ =gMapObjects
	adds r6, r0, r1
	adds r1, r4, 0
	adds r1, 0xA
	adds r2, r4, 0
	adds r2, 0xC
	adds r3, r4, 0
	adds r3, 0xE
	adds r0, r5, 0
	adds r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r0, 0x12
	str r0, [sp, 0x4]
	adds r0, r6, 0
	bl sub_80858A4
	adds r7, r0, 0
	ldrb r1, [r6, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r6, 0x1]
	ldrh r1, [r5, 0xC]
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	cmp r0, 0x7
	bgt _08085ADC
	adds r0, r1, 0x1
	strh r0, [r5, 0xC]
	b _08085B10
	.align 2, 0
_08085AD4: .4byte gPlayerAvatar
_08085AD8: .4byte gMapObjects
_08085ADC:
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _08085B10
	adds r0, r1, 0x1
	strh r0, [r5, 0xC]
	adds r1, r4, 0
	adds r1, 0x1A
	adds r2, r4, 0
	adds r2, 0x1C
	adds r0, r6, 0
	bl sub_808576C
	lsls r0, 24
	lsrs r1, r0, 24
	strh r1, [r5, 0x10]
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	cmp r0, 0x31
	ble _08085B10
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _08085B10
	movs r0, 0x1
	strh r0, [r5, 0xE]
_08085B10:
	cmp r7, 0
	bne _08085B58
	movs r0, 0x10
	ldrsh r1, [r5, r0]
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _08085B58
	adds r0, r6, 0
	bl FieldObjectCheckHeldMovementStatus
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085B58
	ldrb r1, [r6, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r6, 0x1]
	ldrb r1, [r6, 0x3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r6, 0x3]
	bl ScriptContext2_Disable
	bl UnfreezeMapObjects
	ldr r0, _08085B60 @ =sub_8085A24
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08085B58:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085B60: .4byte sub_8085A24
	thumb_func_end sub_8085A80

	thumb_func_start CreateTeleportFieldEffectTask
CreateTeleportFieldEffectTask: @ 8085B64
	push {lr}
	ldr r0, _08085B74 @ =sub_8085B78
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08085B74: .4byte sub_8085B78
	thumb_func_end CreateTeleportFieldEffectTask

	thumb_func_start sub_8085B78
sub_8085B78: @ 8085B78
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08085BA0 @ =gUnknown_83CC0F8
	ldr r2, _08085BA4 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08085BA0: .4byte gUnknown_83CC0F8
_08085BA4: .4byte gTasks
	thumb_func_end sub_8085B78

	thumb_func_start sub_8085BA8
sub_8085BA8: @ 8085BA8
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	bl player_bitmagic
	bl CameraObjectReset2
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8085BA8

	thumb_func_start sub_8085BD0
sub_8085BD0: @ 8085BD0
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08085C54 @ =gUnknown_83CC108
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r0, _08085C58 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08085C5C @ =gMapObjects
	adds r5, r0, r1
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08085C02
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _08085C1C
_08085C02:
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r5, 0
	bl FieldObjectTurn
	movs r0, 0x8
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_08085C1C:
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	ble _08085C4A
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	cmp r1, r0
	bne _08085C4A
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x4
	strh r0, [r4, 0xA]
	movs r0, 0x8
	strh r0, [r4, 0xC]
	movs r0, 0x1
	strh r0, [r4, 0xE]
	movs r0, 0x27
	bl PlaySE
_08085C4A:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085C54: .4byte gUnknown_83CC108
_08085C58: .4byte gPlayerAvatar
_08085C5C: .4byte gMapObjects
	thumb_func_end sub_8085BD0

	thumb_func_start sub_8085C60
sub_8085C60: @ 8085C60
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08085D24 @ =gUnknown_83CC108
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r2, _08085D28 @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08085D2C @ =gMapObjects
	adds r3, r0, r1
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08085D30 @ =gSprites
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bgt _08085CAA
	movs r0, 0x4
	strh r0, [r4, 0xA]
	ldrb r0, [r3, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r3, 0
	bl FieldObjectTurn
_08085CAA:
	ldrh r0, [r5, 0x22]
	ldrh r1, [r4, 0xE]
	subs r0, r1
	strh r0, [r5, 0x22]
	ldrh r1, [r4, 0xE]
	ldrh r2, [r4, 0x10]
	adds r0, r1, r2
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bgt _08085CD6
	movs r0, 0x4
	strh r0, [r4, 0xC]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x7
	bgt _08085CD6
	lsls r0, r1, 1
	strh r0, [r4, 0xE]
_08085CD6:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	ble _08085D04
	ldrb r1, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5, 0x5]
	adds r2, r5, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _08085D04
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
_08085D04:
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0xA7
	ble _08085D1A
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl sub_8055F88
	bl sub_807DC18
_08085D1A:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085D24: .4byte gUnknown_83CC108
_08085D28: .4byte gPlayerAvatar
_08085D2C: .4byte gMapObjects
_08085D30: .4byte gSprites
	thumb_func_end sub_8085C60

	thumb_func_start sub_8085D34
sub_8085D34: @ 8085D34
	push {lr}
	ldr r0, _08085D74 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08085D70
	bl sub_8055FC4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085D70
	bl copy_saved_warp3_bank_and_enter_x_to_warp1
	bl WarpIntoMap
	ldr r0, _08085D78 @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r1, _08085D7C @ =gFieldCallback
	ldr r0, _08085D80 @ =mapldr_08085D88
	str r0, [r1]
	ldr r0, _08085D84 @ =sub_8085B78
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08085D70:
	pop {r0}
	bx r0
	.align 2, 0
_08085D74: .4byte gPaletteFade
_08085D78: .4byte CB2_LoadMap
_08085D7C: .4byte gFieldCallback
_08085D80: .4byte mapldr_08085D88
_08085D84: .4byte sub_8085B78
	thumb_func_end sub_8085D34

	thumb_func_start mapldr_08085D88
mapldr_08085D88: @ 8085D88
	push {lr}
	bl Overworld_PlaySpecialMapMusic
	bl pal_fill_for_maplights
	bl sub_8111CF0
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r1, _08085DCC @ =gFieldCallback
	movs r0, 0
	str r0, [r1]
	ldr r2, _08085DD0 @ =gMapObjects
	ldr r0, _08085DD4 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x1]
	bl CameraObjectReset2
	ldr r0, _08085DD8 @ =sub_8085DDC
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08085DCC: .4byte gFieldCallback
_08085DD0: .4byte gMapObjects
_08085DD4: .4byte gPlayerAvatar
_08085DD8: .4byte sub_8085DDC
	thumb_func_end mapldr_08085D88

	thumb_func_start sub_8085DDC
sub_8085DDC: @ 8085DDC
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08085E04 @ =gUnknown_83CC110
	ldr r2, _08085E08 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08085E04: .4byte gUnknown_83CC110
_08085E08: .4byte gTasks
	thumb_func_end sub_8085DDC

	thumb_func_start sub_8085E0C
sub_8085E0C: @ 8085E0C
	push {r4-r6,lr}
	adds r6, r0, 0
	bl sub_807AA70
	lsls r0, 24
	cmp r0, 0
	beq _08085E82
	ldr r5, _08085E88 @ =gPlayerAvatar
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08085E8C @ =gSprites
	adds r2, r0
	adds r0, r2, 0
	adds r0, 0x29
	movs r4, 0
	ldrsb r4, [r0, r4]
	lsls r0, r4, 17
	negs r0, r0
	ldrh r1, [r2, 0x22]
	ldr r3, _08085E90 @ =gSpriteCoordOffsetY
	adds r1, r4
	ldrh r3, [r3]
	adds r1, r3
	asrs r0, 16
	adds r0, r1
	negs r0, r0
	strh r0, [r2, 0x26]
	ldr r3, _08085E94 @ =gMapObjects
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r3, [r1, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r3
	strb r0, [r1, 0x1]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	movs r0, 0x8
	strh r0, [r6, 0xA]
	movs r0, 0x1
	strh r0, [r6, 0xC]
	adds r2, 0x42
	ldrb r0, [r2]
	lsrs r0, 6
	strh r0, [r6, 0x24]
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x26]
	movs r0, 0x27
	bl PlaySE
_08085E82:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085E88: .4byte gPlayerAvatar
_08085E8C: .4byte gSprites
_08085E90: .4byte gSpriteCoordOffsetY
_08085E94: .4byte gMapObjects
	thumb_func_end sub_8085E0C

	thumb_func_start sub_8085E98
sub_8085E98: @ 8085E98
	push {r4-r7,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08085F00 @ =gUnknown_83CC108
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r2, _08085F04 @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08085F08 @ =gMapObjects
	adds r6, r0, r1
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08085F0C @ =gSprites
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	ldrh r1, [r5, 0x26]
	adds r0, r1
	strh r0, [r5, 0x26]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x8
	negs r1, r1
	cmp r0, r1
	blt _08085F10
	ldrh r1, [r4, 0x22]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _08085F36
	adds r0, r1, 0x1
	strh r0, [r4, 0x22]
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
	ldrh r1, [r4, 0x24]
	adds r3, r5, 0
	adds r3, 0x42
	lsls r1, 6
	ldrb r2, [r3]
	movs r0, 0x3F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _08085F36
	.align 2, 0
_08085F00: .4byte gUnknown_83CC108
_08085F04: .4byte gPlayerAvatar
_08085F08: .4byte gMapObjects
_08085F0C: .4byte gSprites
_08085F10:
	ldrb r1, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5, 0x5]
	adds r2, r5, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _08085F36
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
_08085F36:
	ldrh r2, [r5, 0x26]
	movs r3, 0x26
	ldrsh r1, [r5, r3]
	movs r0, 0x30
	negs r0, r0
	cmp r1, r0
	blt _08085F5A
	ldrh r1, [r4, 0xA]
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	ble _08085F5A
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	bne _08085F5A
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
_08085F5A:
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	movs r7, 0
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _08085F7C
	movs r0, 0x4
	strh r0, [r4, 0xC]
	ldrb r0, [r6, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r6, 0
	bl FieldObjectTurn
_08085F7C:
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _08085F92
	strh r7, [r5, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	strh r0, [r4, 0xA]
	strh r7, [r4, 0xC]
_08085F92:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8085E98

	thumb_func_start sub_8085F9C
sub_8085F9C: @ 8085F9C
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08086018 @ =gUnknown_83CC108
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r0, _0808601C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086020 @ =gMapObjects
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _08086010
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r5, 0
	bl FieldObjectTurn
	movs r0, 0x8
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _08086010
	movs r0, 0x24
	ldrsh r1, [r4, r0]
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	cmp r1, r0
	bne _08086010
	bl ScriptContext2_Disable
	bl CameraObjectReset1
	bl UnfreezeMapObjects
	ldr r0, _08086024 @ =sub_8085DDC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08086010:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086018: .4byte gUnknown_83CC108
_0808601C: .4byte gPlayerAvatar
_08086020: .4byte gMapObjects
_08086024: .4byte sub_8085DDC
	thumb_func_end sub_8085F9C

	thumb_func_start FldEff_FieldMoveShowMon
FldEff_FieldMoveShowMon: @ 8086028
	push {r4,lr}
	bl GetCurrentMapType
	lsls r0, 24
	lsrs r0, 24
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08086048
	ldr r0, _08086044 @ =sub_80860E0
	b _0808604A
	.align 2, 0
_08086044: .4byte sub_80860E0
_08086048:
	ldr r0, _08086078 @ =sub_8086468
_0808604A:
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _0808607C @ =gFieldEffectArguments
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	ldr r2, [r2, 0x8]
	bl sub_8086860
	ldr r2, _08086080 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x26]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08086078: .4byte sub_8086468
_0808607C: .4byte gFieldEffectArguments
_08086080: .4byte gTasks
	thumb_func_end FldEff_FieldMoveShowMon

	thumb_func_start FldEff_FieldMoveShowMonInit
FldEff_FieldMoveShowMonInit: @ 8086084
	push {r4-r6,lr}
	ldr r5, _080860D8 @ =gFieldEffectArguments
	ldr r0, [r5]
	movs r6, 0x80
	lsls r6, 24
	ands r6, r0
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	adds r4, r0, 0
	muls r4, r1
	ldr r0, _080860DC @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	str r0, [r5]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [r5, 0x4]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [r5, 0x8]
	ldr r0, [r5]
	orrs r0, r6
	str r0, [r5]
	movs r0, 0x6
	bl FieldEffectStart
	movs r0, 0x3B
	bl FieldEffectActiveListRemove
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080860D8: .4byte gFieldEffectArguments
_080860DC: .4byte gPlayerParty
	thumb_func_end FldEff_FieldMoveShowMonInit

	thumb_func_start sub_80860E0
sub_80860E0: @ 80860E0
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08086108 @ =gUnknown_83CC11C
	ldr r2, _0808610C @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08086108: .4byte gUnknown_83CC11C
_0808610C: .4byte gTasks
	thumb_func_end sub_80860E0

	thumb_func_start sub_8086110
sub_8086110: @ 8086110
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x48
	bl GetGpuReg
	strh r0, [r4, 0x1E]
	movs r0, 0x4A
	bl GetGpuReg
	strh r0, [r4, 0x20]
	adds r0, r4, 0
	adds r0, 0x22
	ldr r1, _08086170 @ =gMain
	ldr r1, [r1, 0xC]
	bl StoreWordInTwoHalfwords
	ldr r1, _08086174 @ =0x0000f0f1
	strh r1, [r4, 0xA]
	ldr r0, _08086178 @ =0x00005051
	strh r0, [r4, 0xC]
	movs r0, 0x3F
	strh r0, [r4, 0xE]
	movs r0, 0x3E
	strh r0, [r4, 0x10]
	movs r0, 0x40
	bl SetGpuReg
	ldrh r1, [r4, 0xC]
	movs r0, 0x44
	bl SetGpuReg
	ldrh r1, [r4, 0xE]
	movs r0, 0x48
	bl SetGpuReg
	ldrh r1, [r4, 0x10]
	movs r0, 0x4A
	bl SetGpuReg
	ldr r0, _0808617C @ =sub_80863C0
	bl SetVBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086170: .4byte gMain
_08086174: .4byte 0x0000f0f1
_08086178: .4byte 0x00005051
_0808617C: .4byte sub_80863C0
	thumb_func_end sub_8086110

	thumb_func_start sub_8086180
sub_8086180: @ 8086180
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	mov r8, r0
	movs r0, 0x8
	bl GetGpuReg
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 18
	lsls r4, 30
	lsrs r4, 16
	movs r0, 0x8
	bl GetGpuReg
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 24
	lsls r5, 27
	lsrs r5, 16
	ldr r0, _080861F0 @ =gUnknown_83CB5F0
	movs r6, 0xC0
	lsls r6, 19
	adds r4, r6
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, 0
	bl CpuSet
	movs r0, 0
	str r0, [sp]
	adds r6, r5, r6
	ldr r2, _080861F4 @ =0x05000200
	mov r0, sp
	adds r1, r6, 0
	bl CpuSet
	ldr r0, _080861F8 @ =gUnknown_83CB7F0
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r5, 0
	bl sub_8086428
	mov r1, r8
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080861F0: .4byte gUnknown_83CB5F0
_080861F4: .4byte 0x05000200
_080861F8: .4byte gUnknown_83CB7F0
	thumb_func_end sub_8086180

	thumb_func_start sub_80861FC
sub_80861FC: @ 80861FC
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x12]
	subs r0, 0x10
	strh r0, [r3, 0x12]
	ldrh r6, [r3, 0xA]
	ldrh r2, [r3, 0xC]
	movs r7, 0xFF
	lsrs r1, r6, 8
	subs r1, 0x10
	lsls r1, 16
	lsrs r0, r2, 8
	subs r0, 0x2
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r7, 0
	ands r0, r2
	adds r5, r0, 0x2
	lsrs r2, r1, 16
	cmp r1, 0
	bge _08086228
	movs r2, 0
_08086228:
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, 0x27
	bgt _08086232
	movs r4, 0x28
_08086232:
	cmp r5, 0x78
	ble _08086238
	movs r5, 0x78
_08086238:
	lsls r2, 16
	asrs r2, 16
	lsls r1, r2, 8
	adds r0, r7, 0
	ands r0, r6
	orrs r1, r0
	strh r1, [r3, 0xA]
	lsls r0, r4, 16
	asrs r4, r0, 16
	lsls r0, r4, 8
	adds r1, r5, 0
	orrs r0, r1
	strh r0, [r3, 0xC]
	cmp r2, 0
	bne _08086278
	cmp r4, 0x28
	bne _08086278
	cmp r1, 0x78
	bne _08086278
	ldr r2, _08086280 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08086284 @ =sub_80868C0
	str r1, [r0]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_08086278:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086280: .4byte gSprites
_08086284: .4byte sub_80868C0
	thumb_func_end sub_80861FC

	thumb_func_start sub_8086288
sub_8086288: @ 8086288
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x12]
	subs r0, 0x10
	strh r0, [r3, 0x12]
	ldr r2, _080862B4 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3C
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080862AE
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_080862AE:
	pop {r0}
	bx r0
	.align 2, 0
_080862B4: .4byte gSprites
	thumb_func_end sub_8086288

	thumb_func_start sub_80862B8
sub_80862B8: @ 80862B8
	push {r4,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x12]
	subs r0, 0x10
	strh r0, [r3, 0x12]
	ldrh r2, [r3, 0xC]
	lsls r1, r2, 16
	movs r0, 0xFF
	asrs r1, 24
	adds r1, 0x6
	lsls r1, 16
	ands r0, r2
	subs r0, 0x6
	lsls r0, 16
	lsrs r2, r0, 16
	lsrs r4, r1, 16
	asrs r1, 16
	cmp r1, 0x50
	ble _080862E0
	movs r4, 0x50
_080862E0:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x50
	bgt _080862EA
	movs r2, 0x51
_080862EA:
	lsls r0, r4, 16
	asrs r0, 16
	lsls r1, r0, 8
	lsls r2, 16
	asrs r2, 16
	orrs r1, r2
	strh r1, [r3, 0xC]
	cmp r0, 0x50
	bne _08086306
	cmp r2, 0x51
	bne _08086306
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_08086306:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80862B8

	thumb_func_start sub_808630C
sub_808630C: @ 808630C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r0, 0x8
	bl GetGpuReg
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 24
	lsls r1, 27
	lsrs r1, 16
	movs r0, 0
	str r0, [sp]
	movs r0, 0xC0
	lsls r0, 19
	adds r1, r0
	ldr r2, _08086354 @ =0x05000200
	mov r0, sp
	bl CpuSet
	movs r0, 0xF1
	strh r0, [r4, 0xA]
	movs r0, 0xA1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x1E]
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086354: .4byte 0x05000200
	thumb_func_end sub_808630C

	thumb_func_start sub_8086358
sub_8086358: @ 8086358
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r0, 0x22
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	bl SetVBlankCallback
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	bl Menu_LoadStdPal
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080863B8 @ =gSprites
	adds r0, r1
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	bl sub_8083A5C
	movs r0, 0x6
	bl FieldEffectActiveListRemove
	ldr r0, _080863BC @ =sub_80860E0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080863B8: .4byte gSprites
_080863BC: .4byte sub_80860E0
	thumb_func_end sub_8086358

	thumb_func_start sub_80863C0
sub_80863C0: @ 80863C0
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08086420 @ =sub_80860E0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _08086424 @ =gTasks
	adds r4, r0
	adds r0, r4, 0
	adds r0, 0x22
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	bl _call_via_r0
	ldrh r1, [r4, 0xA]
	movs r0, 0x40
	bl SetGpuReg
	ldrh r1, [r4, 0xC]
	movs r0, 0x44
	bl SetGpuReg
	ldrh r1, [r4, 0xE]
	movs r0, 0x48
	bl SetGpuReg
	ldrh r1, [r4, 0x10]
	movs r0, 0x4A
	bl SetGpuReg
	ldrh r1, [r4, 0x12]
	movs r0, 0x10
	bl SetGpuReg
	ldrh r1, [r4, 0x14]
	movs r0, 0x12
	bl SetGpuReg
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086420: .4byte sub_80860E0
_08086424: .4byte gTasks
	thumb_func_end sub_80863C0

	thumb_func_start sub_8086428
sub_8086428: @ 8086428
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0808645C @ =0x06000140
	adds r2, r0, r1
	movs r1, 0
	ldr r5, _08086460 @ =gUnknown_83CB810
	movs r0, 0xF0
	lsls r0, 8
	adds r4, r0, 0
	ldr r3, _08086464 @ =0x0000013f
_0808643E:
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	orrs r0, r4
	strh r0, [r2]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, 0x2
	cmp r1, r3
	bls _0808643E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808645C: .4byte 0x06000140
_08086460: .4byte gUnknown_83CB810
_08086464: .4byte 0x0000013f
	thumb_func_end sub_8086428

	thumb_func_start sub_8086468
sub_8086468: @ 8086468
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08086490 @ =gUnknown_83CC138
	ldr r2, _08086494 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08086490: .4byte gUnknown_83CC138
_08086494: .4byte gTasks
	thumb_func_end sub_8086468

	thumb_func_start sub_8086498
sub_8086498: @ 8086498
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0xA]
	movs r0, 0x10
	bl SetGpuReg
	ldrh r1, [r4, 0xC]
	movs r0, 0x12
	bl SetGpuReg
	adds r0, r4, 0
	adds r0, 0x22
	ldr r1, _080864CC @ =gMain
	ldr r1, [r1, 0xC]
	bl StoreWordInTwoHalfwords
	ldr r0, _080864D0 @ =sub_80866E0
	bl SetVBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080864CC: .4byte gMain
_080864D0: .4byte sub_80866E0
	thumb_func_end sub_8086498

	thumb_func_start sub_80864D4
sub_80864D4: @ 80864D4
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r9, r0
	movs r0, 0x8
	bl GetGpuReg
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 18
	lsls r5, 30
	lsrs r5, 16
	movs r0, 0x8
	bl GetGpuReg
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 24
	lsls r4, 27
	lsrs r4, 16
	movs r0, 0
	mov r8, r0
	mov r1, r9
	strh r4, [r1, 0x20]
	ldr r0, _08086548 @ =gUnknown_83CBA90
	movs r6, 0xC0
	lsls r6, 19
	adds r5, r6
	adds r1, r5, 0
	movs r2, 0x40
	bl CpuSet
	mov r0, r8
	str r0, [sp]
	adds r4, r6
	ldr r2, _0808654C @ =0x05000200
	mov r0, sp
	adds r1, r4, 0
	bl CpuSet
	ldr r0, _08086550 @ =gUnknown_83CBB10
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	mov r1, r9
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086548: .4byte gUnknown_83CBA90
_0808654C: .4byte 0x05000200
_08086550: .4byte gUnknown_83CBB10
	thumb_func_end sub_80864D4

	thumb_func_start sub_8086554
sub_8086554: @ 8086554
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8086738
	lsls r0, 24
	cmp r0, 0
	beq _080865A6
	movs r0, 0x48
	bl GetGpuReg
	strh r0, [r4, 0x12]
	movs r1, 0xFF
	ands r1, r0
	movs r2, 0x88
	lsls r2, 5
	adds r0, r2, 0
	orrs r1, r0
	movs r0, 0x48
	bl SetGpuReg
	movs r0, 0x42
	movs r1, 0xF0
	bl SetGpuReg
	ldr r1, _080865B4 @ =0x00002878
	movs r0, 0x46
	bl SetGpuReg
	ldr r2, _080865B8 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080865BC @ =sub_80868C0
	str r1, [r0]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080865A6:
	adds r0, r4, 0
	bl sub_8086728
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080865B4: .4byte 0x00002878
_080865B8: .4byte gSprites
_080865BC: .4byte sub_80868C0
	thumb_func_end sub_8086554

	thumb_func_start sub_80865C0
sub_80865C0: @ 80865C0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8086728
	ldr r2, _080865EC @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3C
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080865E4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080865E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080865EC: .4byte gSprites
	thumb_func_end sub_80865C0

	thumb_func_start sub_80865F0
sub_80865F0: @ 80865F0
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_8086728
	ldrh r1, [r4, 0xA]
	movs r0, 0x7
	ands r0, r1
	movs r1, 0
	strh r0, [r4, 0xE]
	strh r1, [r4, 0x10]
	ldr r5, _0808662C @ =0x0000ffff
	movs r0, 0x42
	adds r1, r5, 0
	bl SetGpuReg
	movs r0, 0x46
	adds r1, r5, 0
	bl SetGpuReg
	ldrh r1, [r4, 0x12]
	movs r0, 0x48
	bl SetGpuReg
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808662C: .4byte 0x0000ffff
	thumb_func_end sub_80865F0

	thumb_func_start sub_8086630
sub_8086630: @ 8086630
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8086728
	adds r0, r4, 0
	bl sub_80867F0
	lsls r0, 24
	cmp r0, 0
	beq _0808664A
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0808664A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8086630

	thumb_func_start sub_8086650
sub_8086650: @ 8086650
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	movs r0, 0x8
	bl GetGpuReg
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 24
	lsls r1, 27
	lsrs r1, 16
	movs r0, 0
	str r0, [sp]
	movs r0, 0xC0
	lsls r0, 19
	adds r1, r0
	ldr r2, _080866D4 @ =0x05000200
	mov r0, sp
	bl CpuSet
	adds r0, r4, 0
	adds r0, 0x22
	add r1, sp, 0x4
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp, 0x4]
	bl SetVBlankCallback
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	bl Menu_LoadStdPal
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080866D8 @ =gSprites
	adds r0, r1
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	bl sub_8083A5C
	movs r0, 0x6
	bl FieldEffectActiveListRemove
	ldr r0, _080866DC @ =sub_8086468
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080866D4: .4byte 0x05000200
_080866D8: .4byte gSprites
_080866DC: .4byte sub_8086468
	thumb_func_end sub_8086650

	thumb_func_start sub_80866E0
sub_80866E0: @ 80866E0
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08086720 @ =sub_8086468
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _08086724 @ =gTasks
	adds r4, r0
	adds r0, r4, 0
	adds r0, 0x22
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	bl _call_via_r0
	ldrh r1, [r4, 0xA]
	movs r0, 0x10
	bl SetGpuReg
	ldrh r1, [r4, 0xC]
	movs r0, 0x12
	bl SetGpuReg
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086720: .4byte sub_8086468
_08086724: .4byte gTasks
	thumb_func_end sub_80866E0

	thumb_func_start sub_8086728
sub_8086728: @ 8086728
	ldrh r1, [r0, 0xA]
	subs r1, 0x10
	strh r1, [r0, 0xA]
	ldrh r1, [r0, 0xE]
	adds r1, 0x10
	strh r1, [r0, 0xE]
	bx lr
	thumb_func_end sub_8086728

	thumb_func_start sub_8086738
sub_8086738: @ 8086738
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r2, [r5, 0x10]
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r0, 0x1F
	ble _08086754
	movs r0, 0x1
	b _080867D8
_08086754:
	ldrh r0, [r5, 0xE]
	lsls r0, 16
	asrs r3, r0, 19
	movs r1, 0x1F
	ands r3, r1
	movs r4, 0x10
	ldrsh r0, [r5, r4]
	cmp r3, r0
	blt _080867D6
	movs r0, 0x20
	subs r3, r0, r3
	ands r3, r1
	subs r0, r2
	mov r12, r0
	mov r7, r12
	ands r7, r1
	mov r12, r7
	ldrh r0, [r5, 0x20]
	ldr r1, _080867E8 @ =0x06000140
	adds r1, r0
	mov r8, r1
	movs r4, 0
	ldr r7, _080867EC @ =gUnknown_83CBB30
	mov r10, r7
	movs r0, 0xF0
	lsls r0, 8
	mov r9, r0
	adds r1, r3, 0x1
	movs r0, 0x1F
	ands r1, r0
	str r1, [sp]
	mov r6, r12
	adds r6, 0x1
	ands r6, r0
_08086798:
	lsls r1, r4, 5
	adds r2, r1, r3
	lsls r2, 1
	add r2, r8
	mov r7, r12
	adds r0, r7, r1
	lsls r0, 1
	add r0, r10
	ldrh r0, [r0]
	mov r7, r9
	orrs r0, r7
	strh r0, [r2]
	ldr r0, [sp]
	adds r2, r1, r0
	lsls r2, 1
	add r2, r8
	adds r1, r6, r1
	lsls r1, 1
	add r1, r10
	ldrh r0, [r1]
	mov r1, r9
	orrs r0, r1
	strh r0, [r2]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x9
	bls _08086798
	ldrh r0, [r5, 0x10]
	adds r0, 0x2
	strh r0, [r5, 0x10]
_080867D6:
	movs r0, 0
_080867D8:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080867E8: .4byte 0x06000140
_080867EC: .4byte gUnknown_83CBB30
	thumb_func_end sub_8086738

	thumb_func_start sub_80867F0
sub_80867F0: @ 80867F0
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r0, 0x1F
	ble _08086800
	movs r0, 0x1
	b _08086854
_08086800:
	ldrh r0, [r5, 0xE]
	lsls r0, 16
	asrs r0, 19
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r2, r0
	blt _08086852
	ldrh r0, [r5, 0xA]
	lsls r0, 16
	asrs r2, r0, 19
	movs r0, 0x1F
	ands r2, r0
	ldrh r0, [r5, 0x20]
	ldr r1, _0808685C @ =0x06000140
	adds r6, r0, r1
	movs r3, 0
	movs r0, 0xF0
	lsls r0, 8
	adds r7, r0, 0
	adds r4, r2, 0x1
	movs r0, 0x1F
	ands r4, r0
_08086830:
	lsls r0, r3, 5
	adds r1, r0, r2
	lsls r1, 1
	adds r1, r6
	strh r7, [r1]
	adds r0, r4
	lsls r0, 1
	adds r0, r6
	strh r7, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x9
	bls _08086830
	ldrh r0, [r5, 0x10]
	adds r0, 0x2
	strh r0, [r5, 0x10]
_08086852:
	movs r0, 0
_08086854:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808685C: .4byte 0x06000140
	thumb_func_end sub_80867F0

	thumb_func_start sub_8086860
sub_8086860: @ 8086860
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	movs r5, 0x80
	lsls r5, 24
	ands r5, r6
	lsrs r5, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _080868B4 @ =0x7fffffff
	ands r6, r0
	lsls r0, r6, 16
	lsrs r0, 16
	movs r3, 0xA0
	lsls r3, 1
	movs r4, 0x50
	str r4, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	bl sub_80839D4
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r1, _080868B8 @ =gSprites
	adds r2, r1
	ldr r1, _080868BC @ =SpriteCallbackDummy
	str r1, [r2, 0x1C]
	ldrb r3, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	strb r1, [r2, 0x5]
	strh r6, [r2, 0x2E]
	strh r5, [r2, 0x3A]
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080868B4: .4byte 0x7fffffff
_080868B8: .4byte gSprites
_080868BC: .4byte SpriteCallbackDummy
	thumb_func_end sub_8086860

	thumb_func_start sub_80868C0
sub_80868C0: @ 80868C0
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x20]
	subs r0, 0x14
	strh r0, [r1, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	bgt _08086900
	movs r0, 0x78
	strh r0, [r1, 0x20]
	movs r0, 0x1E
	strh r0, [r1, 0x30]
	ldr r0, _080868F4 @ =sub_8086904
	str r0, [r1, 0x1C]
	movs r2, 0x3A
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080868F8
	ldrh r0, [r1, 0x2E]
	movs r1, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCry2
	b _08086900
	.align 2, 0
_080868F4: .4byte sub_8086904
_080868F8:
	ldrh r0, [r1, 0x2E]
	movs r1, 0
	bl PlayCry1
_08086900:
	pop {r0}
	bx r0
	thumb_func_end sub_80868C0

	thumb_func_start sub_8086904
sub_8086904: @ 8086904
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	subs r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _08086918
	ldr r0, _0808691C @ =sub_8086920
	str r0, [r1, 0x1C]
_08086918:
	pop {r0}
	bx r0
	.align 2, 0
_0808691C: .4byte sub_8086920
	thumb_func_end sub_8086904

	thumb_func_start sub_8086920
sub_8086920: @ 8086920
	push {lr}
	adds r2, r0, 0
	ldrh r3, [r2, 0x20]
	movs r0, 0x20
	ldrsh r1, [r2, r0]
	movs r0, 0x40
	negs r0, r0
	cmp r1, r0
	bge _08086938
	movs r0, 0x1
	strh r0, [r2, 0x3C]
	b _0808693E
_08086938:
	adds r0, r3, 0
	subs r0, 0x14
	strh r0, [r2, 0x20]
_0808693E:
	pop {r0}
	bx r0
	thumb_func_end sub_8086920

	thumb_func_start sub_8086944
sub_8086944: @ 8086944
	push {r4,lr}
	ldr r0, _08086980 @ =sub_8086990
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08086984 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _08086988 @ =gFieldEffectArguments
	ldr r0, [r0]
	strh r0, [r1, 0x26]
	bl sav1_reset_battle_music_maybe
	ldr r4, _0808698C @ =0x00000131
	adds r0, r4, 0
	bl sub_8056124
	cmp r0, 0
	beq _08086978
	adds r0, r4, 0
	bl Overworld_ChangeMusicTo
_08086978:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08086980: .4byte sub_8086990
_08086984: .4byte gTasks
_08086988: .4byte gFieldEffectArguments
_0808698C: .4byte 0x00000131
	thumb_func_end sub_8086944

	thumb_func_start sub_8086990
sub_8086990: @ 8086990
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _080869B8 @ =gUnknown_83CC154
	ldr r2, _080869BC @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080869B8: .4byte gUnknown_83CC154
_080869BC: .4byte gTasks
	thumb_func_end sub_8086990

	thumb_func_start sub_80869C0
sub_80869C0: @ 80869C0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r5, _08086A18 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r5, 0x6]
	movs r0, 0x8
	bl SetPlayerAvatarStateMask
	adds r6, r4, 0
	adds r6, 0xA
	movs r0, 0xC
	adds r0, r4
	mov r8, r0
	adds r0, r6, 0
	mov r1, r8
	bl PlayerGetDestCoords
	ldr r2, _08086A1C @ =gMapObjects
	ldrb r1, [r5, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsrs r0, 4
	adds r1, r6, 0
	mov r2, r8
	bl MoveCoords
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086A18: .4byte gPlayerAvatar
_08086A1C: .4byte gMapObjects
	thumb_func_end sub_80869C0

	thumb_func_start sub_8086A20
sub_8086A20: @ 8086A20
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08086A64 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086A68 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _08086A4A
	adds r0, r4, 0
	bl FieldObjectClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _08086A5C
_08086A4A:
	bl sub_805CB70
	adds r0, r4, 0
	movs r1, 0x45
	bl FieldObjectSetHeldMovement
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08086A5C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086A64: .4byte gPlayerAvatar
_08086A68: .4byte gMapObjects
	thumb_func_end sub_8086A20

	thumb_func_start sub_8086A6C
sub_8086A6C: @ 8086A6C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08086AA8 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086AAC @ =gMapObjects
	adds r0, r1
	bl FieldObjectCheckHeldMovementStatus
	lsls r0, 24
	cmp r0, 0
	beq _08086AA2
	ldr r2, _08086AB0 @ =gFieldEffectArguments
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	movs r1, 0x80
	lsls r1, 24
	orrs r0, r1
	str r0, [r2]
	movs r0, 0x3B
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086AA2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086AA8: .4byte gPlayerAvatar
_08086AAC: .4byte gMapObjects
_08086AB0: .4byte gFieldEffectArguments
	thumb_func_end sub_8086A6C

	thumb_func_start sub_8086AB4
sub_8086AB4: @ 8086AB4
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08086B1E
	ldr r5, _08086B24 @ =gPlayerAvatar
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08086B28 @ =gMapObjects
	adds r4, r0
	movs r0, 0x2
	bl sub_805C808
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl EventObjectSetGraphicsId
	adds r0, r4, 0
	bl FieldObjectClearHeldMovementIfFinished
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl sub_80641C0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetHeldMovement
	ldr r1, _08086B2C @ =gFieldEffectArguments
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	str r0, [r1]
	movs r2, 0xC
	ldrsh r0, [r6, r2]
	str r0, [r1, 0x4]
	ldrb r0, [r5, 0x5]
	str r0, [r1, 0x8]
	movs r0, 0x8
	bl FieldEffectStart
	strb r0, [r4, 0x1A]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_08086B1E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086B24: .4byte gPlayerAvatar
_08086B28: .4byte gMapObjects
_08086B2C: .4byte gFieldEffectArguments
	thumb_func_end sub_8086AB4

	thumb_func_start sub_8086B30
sub_8086B30: @ 8086B30
	push {r4,r5,lr}
	ldr r5, _08086B9C @ =gPlayerAvatar
	ldrb r1, [r5, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086BA0 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _08086B96
	movs r0, 0
	strb r0, [r5, 0x6]
	ldrb r1, [r5]
	movs r0, 0xDF
	ands r0, r1
	strb r0, [r5]
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl sub_8063EB8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetHeldMovement
	ldrb r0, [r4, 0x1A]
	movs r1, 0x1
	bl sub_80DC44C
	bl UnfreezeMapObjects
	bl ScriptContext2_Disable
	movs r0, 0x9
	bl FieldEffectActiveListRemove
	ldr r0, _08086BA4 @ =sub_8086990
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0x16
	bl HelpSystem_SetSomeVariable2
_08086B96:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086B9C: .4byte gPlayerAvatar
_08086BA0: .4byte gMapObjects
_08086BA4: .4byte sub_8086990
	thumb_func_end sub_8086B30

	thumb_func_start sub_8086BA8
sub_8086BA8: @ 8086BA8
	push {lr}
	ldr r0, _08086BC8 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08086BBA
	movs r0, 0x8
	movs r1, 0x59
	bl sub_811278C
_08086BBA:
	ldr r0, _08086BCC @ =sub_8086BD0
	movs r1, 0xFF
	bl CreateTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08086BC8: .4byte gUnknown_203ADFA
_08086BCC: .4byte sub_8086BD0
	thumb_func_end sub_8086BA8

	thumb_func_start sub_8086BD0
sub_8086BD0: @ 8086BD0
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08086BF8 @ =gUnknown_83CC168
	ldr r2, _08086BFC @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08086BF8: .4byte gUnknown_83CC168
_08086BFC: .4byte gTasks
	thumb_func_end sub_8086BD0

	thumb_func_start sub_8086C00
sub_8086C00: @ 8086C00
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r1, _08086C20 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086C20: .4byte gPlayerAvatar
	thumb_func_end sub_8086C00

	thumb_func_start sub_8086C24
sub_8086C24: @ 8086C24
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08086C68 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086C6C @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _08086C4E
	adds r0, r4, 0
	bl FieldObjectClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _08086C60
_08086C4E:
	bl sub_805CBE8
	adds r0, r4, 0
	movs r1, 0x45
	bl FieldObjectSetHeldMovement
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08086C60:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086C68: .4byte gPlayerAvatar
_08086C6C: .4byte gMapObjects
	thumb_func_end sub_8086C24

	thumb_func_start sub_8086C70
sub_8086C70: @ 8086C70
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r5, _08086C9C @ =gPlayerAvatar
	ldrb r1, [r5, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086CA0 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _08086CEE
	ldrb r1, [r5]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0
	beq _08086CA4
	movs r0, 0x1
	b _08086CAE
	.align 2, 0
_08086C9C: .4byte gPlayerAvatar
_08086CA0: .4byte gMapObjects
_08086CA4:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08086CC0
	movs r0, 0x2
_08086CAE:
	bl sub_805C808
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl EventObjectSetGraphicsId
	b _08086CD2
_08086CC0:
	movs r0, 0
	bl sub_805C808
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl EventObjectSetGraphicsId
_08086CD2:
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063EB8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectForceSetSpecialAnim
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_08086CEE:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8086C70

	thumb_func_start sub_8086CF4
sub_8086CF4: @ 8086CF4
	push {r4,lr}
	ldr r4, _08086D2C @ =gPlayerAvatar
	ldrb r1, [r4, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086D30 @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _08086D26
	movs r0, 0
	strb r0, [r4, 0x6]
	movs r0, 0x41
	bl FieldEffectActiveListRemove
	ldr r0, _08086D34 @ =sub_8086BD0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08086D26:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086D2C: .4byte gPlayerAvatar
_08086D30: .4byte gMapObjects
_08086D34: .4byte sub_8086BD0
	thumb_func_end sub_8086CF4

	thumb_func_start sub_8086D38
sub_8086D38: @ 8086D38
	push {r4,lr}
	ldr r0, _08086D84 @ =gUnknown_83A0010
	ldr r0, [r0, 0x68]
	movs r1, 0x78
	movs r2, 0
	movs r3, 0x1
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r2, r4, 4
	adds r2, r4
	lsls r2, 2
	ldr r0, _08086D88 @ =gSprites
	adds r2, r0
	ldrb r1, [r2, 0x5]
	movs r0, 0xF
	ands r0, r1
	movs r1, 0xD
	negs r1, r1
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, _08086D8C @ =sub_8086D94
	str r0, [r2, 0x1C]
	ldr r0, _08086D90 @ =gFieldEffectArguments
	ldr r0, [r0]
	strh r0, [r2, 0x30]
	movs r0, 0x97
	bl PlaySE
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08086D84: .4byte gUnknown_83A0010
_08086D88: .4byte gSprites
_08086D8C: .4byte sub_8086D94
_08086D90: .4byte gFieldEffectArguments
	thumb_func_end sub_8086D38

	thumb_func_start sub_8086D94
sub_8086D94: @ 8086D94
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0x8C
	bl Cos
	movs r5, 0
	strh r0, [r4, 0x24]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r1, 0x48
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08086DF6
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08086E0C @ =gSprites
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r3]
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	subs r0, 0x8
	strh r0, [r1, 0x22]
	strh r5, [r1, 0x24]
	strh r5, [r1, 0x26]
_08086DF6:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	ble _08086E06
	adds r0, r4, 0
	movs r1, 0x1E
	bl FieldEffectStop
_08086E06:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086E0C: .4byte gSprites
	thumb_func_end sub_8086D94

	thumb_func_start FldEff_UseFly
FldEff_UseFly: @ 8086E10
	push {lr}
	ldr r0, _08086E34 @ =sub_8086E40
	movs r1, 0xFE
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08086E38 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _08086E3C @ =gFieldEffectArguments
	ldr r0, [r0]
	strh r0, [r1, 0xA]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08086E34: .4byte sub_8086E40
_08086E38: .4byte gTasks
_08086E3C: .4byte gFieldEffectArguments
	thumb_func_end FldEff_UseFly

	thumb_func_start sub_8086E40
sub_8086E40: @ 8086E40
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08086E68 @ =gUnknown_83CC178
	ldr r2, _08086E6C @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08086E68: .4byte gUnknown_83CC178
_08086E6C: .4byte gTasks
	thumb_func_end sub_8086E40

	thumb_func_start sub_8086E70
sub_8086E70: @ 8086E70
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _08086EC0 @ =gPlayerAvatar
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086EC4 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _08086E9A
	adds r0, r4, 0
	bl FieldObjectClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _08086EB8
_08086E9A:
	ldrb r0, [r6]
	strh r0, [r5, 0x26]
	movs r0, 0x1
	strb r0, [r6, 0x6]
	bl SetPlayerAvatarStateMask
	bl sub_805CB70
	adds r0, r4, 0
	movs r1, 0x45
	bl FieldObjectSetHeldMovement
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08086EB8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086EC0: .4byte gPlayerAvatar
_08086EC4: .4byte gMapObjects
	thumb_func_end sub_8086E70

	thumb_func_start sub_8086EC8
sub_8086EC8: @ 8086EC8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08086F00 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086F04 @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _08086EF8
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldr r1, _08086F08 @ =gFieldEffectArguments
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r0, 0x3B
	bl FieldEffectStart
_08086EF8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086F00: .4byte gPlayerAvatar
_08086F04: .4byte gMapObjects
_08086F08: .4byte gFieldEffectArguments
	thumb_func_end sub_8086EC8

	thumb_func_start sub_8086F0C
sub_8086F0C: @ 8086F0C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08086F54
	ldr r0, _08086F5C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086F60 @ =gMapObjects
	adds r5, r0, r1
	ldrh r1, [r4, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08086F44
	ldrb r0, [r5, 0x1A]
	movs r1, 0x2
	bl sub_80DC44C
	ldrb r0, [r5, 0x1A]
	movs r1, 0
	bl sub_80DC478
_08086F44:
	bl sub_8087168
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086F54:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086F5C: .4byte gPlayerAvatar
_08086F60: .4byte gMapObjects
	thumb_func_end sub_8086F0C

	thumb_func_start sub_8086F64
sub_8086F64: @ 8086F64
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xA]
	bl sub_80871AC
	lsls r0, 24
	cmp r0, 0
	beq _08086F98
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x10
	strh r0, [r4, 0xC]
	movs r0, 0x1
	bl SetPlayerAvatarTransitionFlags
	ldr r0, _08086FA0 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086FA4 @ =gMapObjects
	adds r0, r1
	movs r1, 0x2
	bl FieldObjectSetHeldMovement
_08086F98:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086FA0: .4byte gPlayerAvatar
_08086FA4: .4byte gMapObjects
	thumb_func_end sub_8086F64

	thumb_func_start sub_8086FA8
sub_8086FA8: @ 8086FA8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08086FF4 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086FF8 @ =gMapObjects
	adds r2, r0, r1
	ldrh r1, [r4, 0xC]
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _08086FCE
	subs r0, r1, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _08086FEC
_08086FCE:
	adds r0, r2, 0
	bl FieldObjectClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _08086FEC
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x97
	bl PlaySE
	ldrb r0, [r4, 0xA]
	bl sub_80871C8
_08086FEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086FF4: .4byte gPlayerAvatar
_08086FF8: .4byte gMapObjects
	thumb_func_end sub_8086FA8

	thumb_func_start sub_8086FFC
sub_8086FFC: @ 8086FFC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _0808705A
	ldr r0, _08087060 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08087064 @ =gMapObjects
	adds r4, r0
	movs r0, 0x2
	bl sub_805C808
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl EventObjectSetGraphicsId
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087068 @ =gSprites
	adds r0, r1
	movs r1, 0x16
	bl StartSpriteAnim
	ldrb r0, [r4, 0x1]
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	movs r1, 0x54
	bl FieldObjectSetHeldMovement
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	strh r0, [r5, 0xC]
_0808705A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087060: .4byte gPlayerAvatar
_08087064: .4byte gMapObjects
_08087068: .4byte gSprites
	thumb_func_end sub_8086FFC

	thumb_func_start sub_808706C
sub_808706C: @ 808706C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _080870FC
	ldr r0, _08087104 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08087108 @ =gMapObjects
	adds r4, r0
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimActive
	ldrb r1, [r4, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x2]
	ldrb r0, [r5, 0xA]
	ldrb r1, [r4, 0x4]
	bl sub_8087204
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0808710C @ =gSprites
	adds r0, r4
	ldr r1, _08087110 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	ldrb r1, [r1, 0x8]
	lsls r1, 1
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0
	bl sub_80877FC
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _08087114 @ =sub_8087828
	str r1, [r0]
	bl CameraObjectReset2
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_080870FC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087104: .4byte gPlayerAvatar
_08087108: .4byte gMapObjects
_0808710C: .4byte gSprites
_08087110: .4byte gSaveBlock2Ptr
_08087114: .4byte sub_8087828
	thumb_func_end sub_808706C

	thumb_func_start sub_8087118
sub_8087118: @ 8087118
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xA]
	bl sub_80871AC
	lsls r0, 24
	cmp r0, 0
	beq _08087132
	bl sub_807DC18
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08087132:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8087118

	thumb_func_start sub_8087138
sub_8087138: @ 8087138
	push {lr}
	ldr r0, _08087160 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808715A
	movs r0, 0x1F
	bl FieldEffectActiveListRemove
	ldr r0, _08087164 @ =sub_8086E40
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0808715A:
	pop {r0}
	bx r0
	.align 2, 0
_08087160: .4byte gPaletteFade
_08087164: .4byte sub_8086E40
	thumb_func_end sub_8087138

	thumb_func_start sub_8087168
sub_8087168: @ 8087168
	push {lr}
	ldr r0, _080871A0 @ =gUnknown_83A0010
	ldr r0, [r0, 0x68]
	movs r1, 0xFF
	movs r2, 0xB4
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r1, _080871A4 @ =gSprites
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	movs r3, 0xD
	negs r3, r3
	ands r1, r3
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r2, 0x5]
	ldr r1, _080871A8 @ =sub_8087220
	str r1, [r2, 0x1C]
	pop {r1}
	bx r1
	.align 2, 0
_080871A0: .4byte gUnknown_83A0010
_080871A4: .4byte gSprites
_080871A8: .4byte sub_8087220
	thumb_func_end sub_8087168

	thumb_func_start sub_80871AC
sub_80871AC: @ 80871AC
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080871C4 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	bx lr
	.align 2, 0
_080871C4: .4byte gSprites
	thumb_func_end sub_80871AC

	thumb_func_start sub_80871C8
sub_80871C8: @ 80871C8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080871FC @ =gSprites
	adds r4, r0
	ldr r0, _08087200 @ =sub_80872F0
	str r0, [r4, 0x1C]
	movs r1, 0
	movs r0, 0x78
	strh r0, [r4, 0x20]
	strh r1, [r4, 0x22]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x2E
	movs r2, 0x10
	bl memset
	movs r0, 0x40
	strh r0, [r4, 0x3A]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080871FC: .4byte gSprites
_08087200: .4byte sub_80872F0
	thumb_func_end sub_80871C8

	thumb_func_start sub_8087204
sub_8087204: @ 8087204
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0808721C @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	strh r1, [r2, 0x3A]
	bx lr
	.align 2, 0
_0808721C: .4byte gSprites
	thumb_func_end sub_8087204

	thumb_func_start sub_8087220
sub_8087220: @ 8087220
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080872E2
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0808727A
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _0808725C @ =gUnknown_83CC1CC
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	ldr r0, _08087260 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _08087264
	movs r0, 0x80
	b _08087266
	.align 2, 0
_0808725C: .4byte gUnknown_83CC1CC
_08087260: .4byte gSaveBlock2Ptr
_08087264:
	movs r0, 0x76
_08087266:
	strh r0, [r4, 0x20]
	ldr r0, _080872E8 @ =0x0000ffd0
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0x40
	strh r0, [r4, 0x30]
	adds r0, 0xC0
	strh r0, [r4, 0x32]
_0808727A:
	ldrh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x78
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x78
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r2, [r4, 0x32]
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	ldr r0, _080872EC @ =0x000007ff
	cmp r1, r0
	bgt _080872B0
	adds r0, r2, 0
	adds r0, 0x60
	strh r0, [r4, 0x32]
_080872B0:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x81
	ble _080872E2
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	lsrs r1, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	adds r0, r4, 0
	movs r3, 0
	bl CalcCenterToCornerVec
_080872E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080872E8: .4byte 0x0000ffd0
_080872EC: .4byte 0x000007ff
	thumb_func_end sub_8087220

	thumb_func_start sub_80872F0
sub_80872F0: @ 80872F0
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0x8C
	bl Cos
	movs r5, 0
	strh r0, [r4, 0x24]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r1, 0x48
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0x40
	beq _0808734E
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08087360 @ =gSprites
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r3]
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	subs r0, 0x8
	strh r0, [r1, 0x22]
	strh r5, [r1, 0x24]
	strh r5, [r1, 0x26]
_0808734E:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	ble _0808735A
	movs r0, 0x1
	strh r0, [r4, 0x3C]
_0808735A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087360: .4byte gSprites
	thumb_func_end sub_80872F0

	thumb_func_start sub_8087364
sub_8087364: @ 8087364
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0808744E
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080873C4
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _080873A0 @ =gUnknown_83CC1CC
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r0, _080873A4 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _080873A8
	movs r0, 0x70
	b _080873AA
	.align 2, 0
_080873A0: .4byte gUnknown_83CC1CC
_080873A4: .4byte gSaveBlock2Ptr
_080873A8:
	movs r0, 0x64
_080873AA:
	strh r0, [r4, 0x20]
	ldr r0, _08087454 @ =0x0000ffe0
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0xF0
	strh r0, [r4, 0x30]
	movs r0, 0x80
	lsls r0, 4
	strh r0, [r4, 0x32]
	movs r0, 0x80
	strh r0, [r4, 0x36]
_080873C4:
	ldrh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	ldrh r2, [r4, 0x30]
	adds r2, r1
	ldrh r0, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r4, 0x30]
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	movs r1, 0x20
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x78
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x32]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r2, 0x80
	lsls r2, 1
	cmp r0, r2
	ble _08087406
	ldrh r0, [r4, 0x36]
	subs r0, r1, r0
	strh r0, [r4, 0x32]
_08087406:
	ldrh r1, [r4, 0x36]
	movs r3, 0x36
	ldrsh r0, [r4, r3]
	cmp r0, 0xFF
	bgt _08087416
	adds r0, r1, 0
	adds r0, 0x18
	strh r0, [r4, 0x36]
_08087416:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0xFF
	bgt _08087420
	strh r2, [r4, 0x32]
_08087420:
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r0, 0x3B
	ble _0808744E
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_0808744E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087454: .4byte 0x0000ffe0
	thumb_func_end sub_8087364

	thumb_func_start sub_8087458
sub_8087458: @ 8087458
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_80871C8
	ldr r1, _0808747C @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08087480 @ =sub_8087364
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808747C: .4byte gSprites
_08087480: .4byte sub_8087364
	thumb_func_end sub_8087458

	thumb_func_start FldEff_FlyIn
FldEff_FlyIn: @ 8087484
	push {lr}
	ldr r0, _08087494 @ =sub_8087498
	movs r1, 0xFE
	bl CreateTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08087494: .4byte sub_8087498
	thumb_func_end FldEff_FlyIn

	thumb_func_start sub_8087498
sub_8087498: @ 8087498
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _080874C0 @ =gUnknown_83CC1D4
	ldr r2, _080874C4 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080874C0: .4byte gUnknown_83CC1D4
_080874C4: .4byte gTasks
	thumb_func_end sub_8087498

	thumb_func_start sub_80874C8
sub_80874C8: @ 80874C8
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r4, _080875B4 @ =gPlayerAvatar
	ldrb r1, [r4, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080875B8 @ =gMapObjects
	adds r5, r0, r1
	adds r0, r5, 0
	bl FieldObjectIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _080874F2
	adds r0, r5, 0
	bl FieldObjectClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _080875AE
_080874F2:
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	movs r0, 0x21
	strh r0, [r6, 0xC]
	ldrb r0, [r4]
	strh r0, [r6, 0x26]
	movs r0, 0x1
	strb r0, [r4, 0x6]
	bl SetPlayerAvatarStateMask
	ldrh r1, [r6, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0808751A
	ldrb r0, [r5, 0x1A]
	movs r1, 0
	bl sub_80DC44C
_0808751A:
	movs r0, 0x2
	bl sub_805C808
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl EventObjectSetGraphicsId
	bl CameraObjectReset2
	adds r0, r5, 0
	movs r1, 0x3
	bl FieldObjectTurn
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080875BC @ =gSprites
	adds r0, r4
	movs r1, 0x16
	bl StartSpriteAnim
	ldrb r1, [r5, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	bl sub_8087168
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0xA]
	bl sub_80871C8
	ldrb r0, [r6, 0xA]
	ldrb r1, [r5, 0x4]
	bl sub_8087204
	movs r0, 0xA
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080875C0 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	ldrb r1, [r1, 0x8]
	lsls r1, 25
	movs r2, 0x80
	lsls r2, 18
	adds r1, r2
	lsrs r1, 24
	bl StartSpriteAnim
	movs r0, 0xA
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	bl sub_80877FC
	movs r2, 0xA
	ldrsh r1, [r6, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _080875C4 @ =sub_8087828
	str r1, [r0]
_080875AE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080875B4: .4byte gPlayerAvatar
_080875B8: .4byte gMapObjects
_080875BC: .4byte gSprites
_080875C0: .4byte gSaveBlock2Ptr
_080875C4: .4byte sub_8087828
	thumb_func_end sub_80874C8

	thumb_func_start sub_80875C8
sub_80875C8: @ 80875C8
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r6, _08087638 @ =gSprites
	adds r0, r6
	bl sub_80878C0
	ldrh r1, [r5, 0xC]
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080875F2
	subs r0, r1, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _08087630
_080875F2:
	ldr r0, _0808763C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087640 @ =gMapObjects
	adds r0, r1
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r4, r6
	ldrb r0, [r5, 0xA]
	movs r1, 0x40
	bl sub_8087204
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x26]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	strh r1, [r5, 0xC]
_08087630:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08087638: .4byte gSprites
_0808763C: .4byte gPlayerAvatar
_08087640: .4byte gMapObjects
	thumb_func_end sub_80875C8

	thumb_func_start sub_8087644
sub_8087644: @ 8087644
	push {r4,lr}
	sub sp, 0x24
	adds r4, r0, 0
	ldr r1, _0808768C @ =gUnknown_83CC1F0
	mov r0, sp
	movs r2, 0x24
	bl memcpy
	ldr r0, _08087690 @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08087694 @ =gSprites
	adds r1, r0
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r1, 0x26]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x11
	ble _08087682
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08087682:
	add sp, 0x24
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808768C: .4byte gUnknown_83CC1F0
_08087690: .4byte gPlayerAvatar
_08087694: .4byte gSprites
	thumb_func_end sub_8087644

	thumb_func_start sub_8087698
sub_8087698: @ 8087698
	push {r4-r6,lr}
	adds r6, r0, 0
	ldrb r0, [r6, 0xA]
	bl sub_80871AC
	lsls r0, 24
	cmp r0, 0
	beq _080876FC
	ldr r0, _08087704 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r5, r0, 3
	adds r5, r0
	lsls r5, 2
	ldr r0, _08087708 @ =gMapObjects
	adds r5, r0
	ldrb r0, [r5, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0808770C @ =gSprites
	adds r4, r0
	ldrb r1, [r5, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	movs r0, 0x10
	ldrsh r1, [r5, r0]
	movs r0, 0x12
	ldrsh r2, [r5, r0]
	adds r0, r5, 0
	bl sub_805F724
	movs r0, 0
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	bl sub_805CB70
	adds r0, r5, 0
	movs r1, 0x45
	bl FieldObjectSetHeldMovement
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_080876FC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08087704: .4byte gPlayerAvatar
_08087708: .4byte gMapObjects
_0808770C: .4byte gSprites
	thumb_func_end sub_8087698

	thumb_func_start sub_8087710
sub_8087710: @ 8087710
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08087740 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087744 @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _08087738
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldrb r0, [r4, 0xA]
	bl sub_8087458
_08087738:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087740: .4byte gPlayerAvatar
_08087744: .4byte gMapObjects
	thumb_func_end sub_8087710

	thumb_func_start sub_8087748
sub_8087748: @ 8087748
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xA]
	bl sub_80871AC
	lsls r0, 24
	cmp r0, 0
	beq _08087774
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0808777C @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x10
	strh r0, [r4, 0xA]
_08087774:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808777C: .4byte gSprites
	thumb_func_end sub_8087748

	thumb_func_start fishE
fishE: @ 8087780
	push {r4-r7,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0xA]
	subs r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _080877EA
	ldr r6, _080877F0 @ =gPlayerAvatar
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080877F4 @ =gMapObjects
	adds r4, r0, r1
	movs r7, 0
	ldrh r1, [r5, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080877B4
	movs r7, 0x2
	ldrb r0, [r4, 0x1A]
	movs r1, 0x1
	bl sub_80DC44C
_080877B4:
	adds r0, r7, 0
	bl sub_805C808
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl EventObjectSetGraphicsId
	adds r0, r4, 0
	movs r1, 0x1
	bl FieldObjectTurn
	ldrh r0, [r5, 0x26]
	strb r0, [r6]
	movs r0, 0
	strb r0, [r6, 0x6]
	movs r0, 0x20
	bl FieldEffectActiveListRemove
	ldr r0, _080877F8 @ =sub_8087498
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080877EA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080877F0: .4byte gPlayerAvatar
_080877F4: .4byte gMapObjects
_080877F8: .4byte sub_8087498
	thumb_func_end fishE

	thumb_func_start sub_80877FC
sub_80877FC: @ 80877FC
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r5, r1, 24
	lsrs r5, 24
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _08087824 @ =gUnknown_83CC23C
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	adds r1, r5, 0
	bl StartSpriteAffineAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087824: .4byte gUnknown_83CC23C
	thumb_func_end sub_80877FC

	thumb_func_start sub_8087828
sub_8087828: @ 8087828
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0xB4
	bl Cos
	movs r5, 0
	strh r0, [r4, 0x24]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r1, 0x48
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0x40
	beq _08087886
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _080878BC @ =gSprites
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r3]
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	subs r0, 0x8
	strh r0, [r1, 0x22]
	strh r5, [r1, 0x24]
	strh r5, [r1, 0x26]
_08087886:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	ble _080878B4
	movs r0, 0x1
	strh r0, [r4, 0x3C]
	ldrb r1, [r4, 0x1]
	subs r0, 0x5
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	lsrs r1, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	adds r0, r4, 0
	movs r3, 0
	bl CalcCenterToCornerVec
_080878B4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080878BC: .4byte gSprites
	thumb_func_end sub_8087828

	thumb_func_start sub_80878C0
sub_80878C0: @ 80878C0
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrb r5, [r4, 0x1]
	lsls r0, r5, 30
	cmp r0, 0
	beq _08087916
	ldr r1, _0808791C @ =gOamMatrices
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r3, r0, 27
	lsls r0, r3, 3
	adds r1, r0, r1
	movs r2, 0
	ldrsh r0, [r1, r2]
	movs r2, 0x80
	lsls r2, 1
	cmp r0, r2
	beq _080878EC
	movs r6, 0x6
	ldrsh r0, [r1, r6]
	cmp r0, r2
	bne _08087916
_080878EC:
	movs r0, 0x4
	negs r0, r0
	ands r0, r5
	strb r0, [r4, 0x1]
	adds r0, r3, 0
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	lsrs r1, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	adds r0, r4, 0
	movs r3, 0
	bl CalcCenterToCornerVec
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
	ldr r0, _08087920 @ =sub_80872F0
	str r0, [r4, 0x1C]
_08087916:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808791C: .4byte gOamMatrices
_08087920: .4byte sub_80872F0
	thumb_func_end sub_80878C0

	thumb_func_start sub_8087924
sub_8087924: @ 8087924
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r7, _080879C4 @ =gFieldEffectArguments
	ldrb r0, [r7]
	ldrb r1, [r7, 0x4]
	ldrb r2, [r7, 0x8]
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _080879BA
	mov r0, sp
	ldrb r0, [r0]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080879C8 @ =gMapObjects
	adds r4, r0
	movs r0, 0x10
	ldrsh r5, [r4, r0]
	subs r5, 0x7
	movs r0, 0x12
	ldrsh r6, [r4, r0]
	subs r6, 0x7
	ldr r1, [r7, 0xC]
	subs r5, r1, r5
	lsls r5, 4
	ldr r2, [r7, 0x10]
	subs r6, r2, r6
	lsls r6, 4
	adds r1, 0x7
	lsls r1, 16
	asrs r1, 16
	adds r2, 0x7
	lsls r2, 16
	asrs r2, 16
	adds r0, r4, 0
	bl npc_coords_shift
	ldr r0, _080879CC @ =sub_80879D8
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080879D0 @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r1
	ldrb r0, [r4, 0x4]
	strh r0, [r2, 0xA]
	ldr r3, _080879D4 @ =gSprites
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x20]
	adds r0, r5
	strh r0, [r2, 0xC]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x22]
	adds r0, r6
	strh r0, [r2, 0xE]
	ldr r0, [r7, 0x14]
	strh r0, [r2, 0x18]
	mov r0, sp
	ldrb r0, [r0]
	strh r0, [r2, 0x1A]
_080879BA:
	movs r0, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080879C4: .4byte gFieldEffectArguments
_080879C8: .4byte gMapObjects
_080879CC: .4byte sub_80879D8
_080879D0: .4byte gTasks
_080879D4: .4byte gSprites
	thumb_func_end sub_8087924

	thumb_func_start sub_80879D8
sub_80879D8: @ 80879D8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _08087A04 @ =gTasks+0x8
	adds r5, r0, r1
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087A08 @ =gSprites
	adds r6, r0, r1
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08087A0C
	cmp r0, 0x1
	beq _08087A4A
	b _08087AA8
	.align 2, 0
_08087A04: .4byte gTasks+0x8
_08087A08: .4byte gSprites
_08087A0C:
	ldrh r0, [r6, 0x20]
	lsls r0, 4
	strh r0, [r5, 0x8]
	ldrh r0, [r6, 0x22]
	lsls r0, 4
	strh r0, [r5, 0xA]
	movs r2, 0x4
	ldrsh r0, [r5, r2]
	lsls r0, 4
	movs r2, 0x8
	ldrsh r1, [r5, r2]
	subs r0, r1
	movs r2, 0x10
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r5, 0xC]
	movs r1, 0x6
	ldrsh r0, [r5, r1]
	lsls r0, 4
	movs r2, 0xA
	ldrsh r1, [r5, r2]
	subs r0, r1
	movs r2, 0x10
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r5, 0xE]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_08087A4A:
	ldrh r1, [r5, 0x10]
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _08087A78
	subs r0, r1, 0x1
	strh r0, [r5, 0x10]
	ldrh r1, [r5, 0xC]
	ldrh r0, [r5, 0x8]
	adds r1, r0
	strh r1, [r5, 0x8]
	ldrh r0, [r5, 0xE]
	ldrh r2, [r5, 0xA]
	adds r0, r2
	strh r0, [r5, 0xA]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r6, 0x20]
	ldrh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r6, 0x22]
	b _08087AA8
_08087A78:
	movs r1, 0x12
	ldrsh r0, [r5, r1]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08087AB0 @ =gMapObjects
	adds r4, r0
	ldrh r0, [r5, 0x4]
	strh r0, [r6, 0x20]
	ldrh r0, [r5, 0x6]
	strh r0, [r6, 0x22]
	adds r0, r4, 0
	bl npc_coords_shift_still
	ldrb r0, [r4]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x43
	bl FieldEffectActiveListRemove
	adds r0, r7, 0
	bl DestroyTask
_08087AA8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087AB0: .4byte gMapObjects
	thumb_func_end sub_80879D8

	thumb_func_start sub_8087AB4
sub_8087AB4: @ 8087AB4
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08087AF8 @ =gFieldEffectArguments
	ldrb r0, [r4]
	ldrb r1, [r4, 0x4]
	ldrb r2, [r4, 0x8]
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _08087B04
	ldr r0, _08087AFC @ =sub_8087BC0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08087B00 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	mov r0, sp
	ldrb r0, [r0]
	strh r0, [r1, 0xC]
	ldr r0, [r4]
	strh r0, [r1, 0x14]
	ldr r0, [r4, 0x4]
	strh r0, [r1, 0x16]
	ldr r0, [r4, 0x8]
	strh r0, [r1, 0x18]
	b _08087B0A
	.align 2, 0
_08087AF8: .4byte gFieldEffectArguments
_08087AFC: .4byte sub_8087BC0
_08087B00: .4byte gTasks
_08087B04:
	movs r0, 0x44
	bl FieldEffectActiveListRemove
_08087B0A:
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8087AB4

	thumb_func_start sub_8087B14
sub_8087B14: @ 8087B14
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08087B4C @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08087B50
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _08087B54
	movs r0, 0
	strh r0, [r4, 0xC]
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08087B54
	subs r0, r1, 0x1
	b _08087B52
	.align 2, 0
_08087B4C: .4byte gTasks+0x8
_08087B50:
	movs r0, 0x4
_08087B52:
	strh r0, [r4, 0xA]
_08087B54:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _08087B8E
	movs r0, 0
	strh r0, [r4]
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08087B84
	ldrh r1, [r4, 0xA]
	negs r1, r1
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl SetCameraPanning
	b _08087B8E
_08087B84:
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl SetCameraPanning
_08087B8E:
	bl UpdateCameraPanning
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08087BA0
	adds r0, r5, 0
	bl DestroyTask
_08087BA0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8087B14

	thumb_func_start sub_8087BA8
sub_8087BA8: @ 8087BA8
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08087BBC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x1
	strh r0, [r1, 0x16]
	bx lr
	.align 2, 0
_08087BBC: .4byte gTasks
	thumb_func_end sub_8087BA8

	thumb_func_start sub_8087BC0
sub_8087BC0: @ 8087BC0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _08087BF8 @ =gTasks+0x8
	adds r4, r0
	bl InstallCameraPanAheadCallback
	movs r0, 0
	bl SetCameraPanningCallback
	ldr r1, _08087BFC @ =gUnknown_83CC244
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r2, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	bl _call_via_r2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087BF8: .4byte gTasks+0x8
_08087BFC: .4byte gUnknown_83CC244
	thumb_func_end sub_8087BC0

	thumb_func_start sub_8087C00
sub_8087C00: @ 8087C00
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08087C28 @ =sub_8087B14
	movs r1, 0x5A
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x51
	bl PlaySE
	strh r4, [r5, 0xA]
	ldrh r0, [r5, 0x2]
	adds r0, 0x1
	strh r0, [r5, 0x2]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087C28: .4byte sub_8087B14
	thumb_func_end sub_8087C00

	thumb_func_start sub_8087C2C
sub_8087C2C: @ 8087C2C
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	ldrh r0, [r7, 0x6]
	adds r0, 0x1
	strh r0, [r7, 0x6]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	ble _08087C9A
	ldr r2, _08087CA4 @ =gMapObjects
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08087CA8 @ =gSprites
	adds r4, r0
	ldrb r0, [r1, 0x1]
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x1]
	ldr r6, _08087CAC @ =0x0000ffff
	ldr r5, _08087CB0 @ =0x00007fff
	adds r0, r6, 0
	movs r1, 0x10
	adds r2, r5, 0
	bl BlendPalettes
	str r5, [sp]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	adds r0, r4, 0
	bl sub_8087CFC
	movs r0, 0x50
	bl PlaySE
	ldrb r0, [r7, 0xA]
	bl sub_8087BA8
	movs r0, 0
	strh r0, [r7, 0x6]
	ldrh r0, [r7, 0x2]
	adds r0, 0x1
	strh r0, [r7, 0x2]
_08087C9A:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087CA4: .4byte gMapObjects
_08087CA8: .4byte gSprites
_08087CAC: .4byte 0x0000ffff
_08087CB0: .4byte 0x00007fff
	thumb_func_end sub_8087C2C

	thumb_func_start sub_8087CB4
sub_8087CB4: @ 8087CB4
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _08087CF4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08087CEE
	ldr r0, _08087CF8 @ =sub_8087B14
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08087CEE
	bl InstallCameraPanAheadCallback
	ldrb r0, [r4, 0xC]
	ldrb r1, [r4, 0xE]
	ldrb r2, [r4, 0x10]
	bl RemoveFieldObjectByLocalIdAndMap
	movs r0, 0x44
	bl FieldEffectActiveListRemove
	adds r0, r5, 0
	bl DestroyTask
_08087CEE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087CF4: .4byte gPaletteFade
_08087CF8: .4byte sub_8087B14
	thumb_func_end sub_8087CB4

	thumb_func_start sub_8087CFC
sub_8087CFC: @ 8087CFC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldr r0, _08087D80 @ =gUnknown_300506C
	movs r1, 0
	ldrsh r2, [r0, r1]
	movs r3, 0x20
	ldrsh r0, [r6, r3]
	adds r2, r0
	movs r1, 0x24
	ldrsh r0, [r6, r1]
	adds r2, r0
	ldr r0, _08087D84 @ =gUnknown_3005068
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r3, 0x22
	ldrsh r1, [r6, r3]
	adds r0, r1
	movs r3, 0x26
	ldrsh r1, [r6, r3]
	adds r0, r1
	subs r0, 0x4
	movs r5, 0
	lsls r2, 16
	mov r8, r2
	lsls r7, r0, 16
_08087D32:
	ldr r0, _08087D88 @ =gUnknown_83CC2A0
	mov r2, r8
	asrs r1, r2, 16
	asrs r2, r7, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08087D6E
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08087D8C @ =gSprites
	adds r4, r0
	lsls r1, r5, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	strh r5, [r4, 0x2E]
	ldrb r1, [r6, 0x5]
	lsrs r1, 4
	lsls r1, 4
	ldrb r2, [r4, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
_08087D6E:
	adds r5, 0x1
	cmp r5, 0x3
	ble _08087D32
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087D80: .4byte gUnknown_300506C
_08087D84: .4byte gUnknown_3005068
_08087D88: .4byte gUnknown_83CC2A0
_08087D8C: .4byte gSprites
	thumb_func_end sub_8087CFC

	thumb_func_start sub_8087D90
sub_8087D90: @ 8087D90
	push {lr}
	adds r1, r0, 0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	beq _08087DBC
	cmp r0, 0x1
	bgt _08087DA6
	cmp r0, 0
	beq _08087DB0
	b _08087DDA
_08087DA6:
	cmp r0, 0x2
	beq _08087DC8
	cmp r0, 0x3
	beq _08087DCE
	b _08087DDA
_08087DB0:
	ldrh r0, [r1, 0x20]
	subs r0, 0x10
	strh r0, [r1, 0x20]
	ldrh r0, [r1, 0x22]
	subs r0, 0xC
	b _08087DD8
_08087DBC:
	ldrh r0, [r1, 0x20]
	adds r0, 0x10
	strh r0, [r1, 0x20]
	ldrh r0, [r1, 0x22]
	subs r0, 0xC
	b _08087DD8
_08087DC8:
	ldrh r0, [r1, 0x20]
	subs r0, 0x10
	b _08087DD2
_08087DCE:
	ldrh r0, [r1, 0x20]
	adds r0, 0x10
_08087DD2:
	strh r0, [r1, 0x20]
	ldrh r0, [r1, 0x22]
	adds r0, 0xC
_08087DD8:
	strh r0, [r1, 0x22]
_08087DDA:
	ldrh r0, [r1, 0x20]
	adds r0, 0x4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xF8
	bhi _08087DF6
	movs r0, 0x22
	ldrsh r2, [r1, r0]
	movs r0, 0x4
	negs r0, r0
	cmp r2, r0
	blt _08087DF6
	cmp r2, 0xA4
	ble _08087DFC
_08087DF6:
	adds r0, r1, 0
	bl DestroySprite
_08087DFC:
	pop {r0}
	bx r0
	thumb_func_end sub_8087D90

	thumb_func_start sub_8087E00
sub_8087E00: @ 8087E00
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08087E24 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08087E1E
	movs r0, 0x45
	bl FieldEffectActiveListRemove
	adds r0, r4, 0
	bl DestroyTask
_08087E1E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087E24: .4byte gPaletteFade
	thumb_func_end sub_8087E00

	thumb_func_start sub_8087E28
sub_8087E28: @ 8087E28
	push {r4,r5,lr}
	sub sp, 0x4
	movs r4, 0x1
	negs r4, r4
	ldr r5, _08087E5C @ =0x00007fff
	adds r0, r4, 0
	movs r1, 0x10
	adds r2, r5, 0
	bl BlendPalettes
	str r5, [sp]
	adds r0, r4, 0
	adds r1, r4, 0
	movs r2, 0xF
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _08087E60 @ =sub_8087E00
	movs r1, 0x5A
	bl CreateTask
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087E5C: .4byte 0x00007fff
_08087E60: .4byte sub_8087E00
	thumb_func_end sub_8087E28

	.align 2, 0 @ Don't pad with nop.
