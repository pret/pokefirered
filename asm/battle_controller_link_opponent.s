	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start nullsub_19
nullsub_19: @ 803A664
	bx lr
	thumb_func_end nullsub_19

	thumb_func_start SetControllerToLinkOpponent
SetControllerToLinkOpponent: @ 803A668
	ldr r1, _0803A678 @ =gBattlerControllerFuncs
	ldr r0, _0803A67C @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803A680 @ =sub_803A684
	str r1, [r0]
	bx lr
	.align 2, 0
_0803A678: .4byte gBattlerControllerFuncs
_0803A67C: .4byte gActiveBattler
_0803A680: .4byte sub_803A684
	thumb_func_end SetControllerToLinkOpponent

	thumb_func_start sub_803A684
sub_803A684: @ 803A684
	push {lr}
	ldr r2, _0803A6B8 @ =gBattleControllerExecFlags
	ldr r1, _0803A6BC @ =gBitTable
	ldr r0, _0803A6C0 @ =gActiveBattler
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0803A6D0
	ldr r0, _0803A6C4 @ =gBattleBufferA
	lsls r1, r3, 9
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x38
	bhi _0803A6CC
	ldr r0, _0803A6C8 @ =gUnknown_8250B20
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _0803A6D0
	.align 2, 0
_0803A6B8: .4byte gBattleControllerExecFlags
_0803A6BC: .4byte gBitTable
_0803A6C0: .4byte gActiveBattler
_0803A6C4: .4byte gBattleBufferA
_0803A6C8: .4byte gUnknown_8250B20
_0803A6CC:
	bl RecordedOpponentBufferExecCompleted
_0803A6D0:
	pop {r0}
	bx r0
	thumb_func_end sub_803A684

	thumb_func_start sub_803A6D4
sub_803A6D4: @ 803A6D4
	push {lr}
	ldr r2, _0803A6FC @ =gSprites
	ldr r1, _0803A700 @ =gBattlerSpriteIds
	ldr r0, _0803A704 @ =gActiveBattler
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0803A708 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0803A6F8
	bl RecordedOpponentBufferExecCompleted
_0803A6F8:
	pop {r0}
	bx r0
	.align 2, 0
_0803A6FC: .4byte gSprites
_0803A700: .4byte gBattlerSpriteIds
_0803A704: .4byte gActiveBattler
_0803A708: .4byte SpriteCallbackDummy
	thumb_func_end sub_803A6D4

	thumb_func_start sub_803A70C
sub_803A70C: @ 803A70C
	push {r4-r6,lr}
	ldr r4, _0803A784 @ =gSprites
	ldr r6, _0803A788 @ =gBattlerSpriteIds
	ldr r5, _0803A78C @ =gActiveBattler
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r2, r0, 2
	adds r0, r4, 0
	adds r0, 0x1C
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r0, _0803A790 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0803A77C
	adds r0, r2, r4
	ldrh r0, [r0, 0x6]
	bl FreeTrainerFrontPicPaletteAndTile
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1, 0x38]
	ldr r2, _0803A794 @ =0x000003ff
	ands r2, r0
	ldrh r3, [r1, 0x4]
	ldr r0, _0803A798 @ =0xfffffc00
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, 0x4]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	bl RecordedOpponentBufferExecCompleted
_0803A77C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803A784: .4byte gSprites
_0803A788: .4byte gBattlerSpriteIds
_0803A78C: .4byte gActiveBattler
_0803A790: .4byte SpriteCallbackDummy
_0803A794: .4byte 0x000003ff
_0803A798: .4byte 0xfffffc00
	thumb_func_end sub_803A70C

	thumb_func_start sub_803A79C
sub_803A79C: @ 803A79C
	push {r4,lr}
	ldr r4, _0803A7DC @ =gBattleSpritesDataPtr
	ldr r1, [r4]
	ldr r3, _0803A7E0 @ =gActiveBattler
	ldrb r0, [r3]
	ldr r2, [r1, 0x4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x9]
	subs r0, 0x1
	strb r0, [r1, 0x9]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0803A7D4
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strb r1, [r0, 0x9]
	bl RecordedOpponentBufferExecCompleted
_0803A7D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803A7DC: .4byte gBattleSpritesDataPtr
_0803A7E0: .4byte gActiveBattler
	thumb_func_end sub_803A79C

	thumb_func_start sub_803A7E4
sub_803A7E4: @ 803A7E4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _0803A80C
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _0803A840
	ldr r0, _0803A82C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0803A840
_0803A80C:
	ldr r2, _0803A830 @ =gSprites
	ldr r1, _0803A834 @ =gHealthboxSpriteIds
	ldr r0, _0803A838 @ =gActiveBattler
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0803A83C @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0803A876
	b _0803A874
	.align 2, 0
_0803A82C: .4byte gBattleTypeFlags
_0803A830: .4byte gSprites
_0803A834: .4byte gHealthboxSpriteIds
_0803A838: .4byte gActiveBattler
_0803A83C: .4byte SpriteCallbackDummy
_0803A840:
	ldr r2, _0803A95C @ =gSprites
	ldr r5, _0803A960 @ =gHealthboxSpriteIds
	ldr r0, _0803A964 @ =gActiveBattler
	ldrb r3, [r0]
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r4, [r0]
	ldr r0, _0803A968 @ =SpriteCallbackDummy
	cmp r4, r0
	bne _0803A876
	movs r0, 0x2
	eors r3, r0
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	cmp r0, r4
	bne _0803A876
_0803A874:
	movs r6, 0x1
_0803A876:
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	beq _0803A882
	movs r6, 0
_0803A882:
	cmp r6, 0
	bne _0803A888
	b _0803A9AA
_0803A888:
	ldr r0, _0803A964 @ =gActiveBattler
	mov r8, r0
	ldrb r0, [r0]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1
	bne _0803A936
	ldr r7, _0803A96C @ =gBattleSpritesDataPtr
	ldr r0, [r7]
	mov r1, r8
	ldrb r2, [r1]
	ldr r5, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r4, r0, r5
	ldrb r1, [r4, 0x1]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0803A9AA
	movs r6, 0x2
	adds r1, r6, 0
	eors r1, r2
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0803A9AA
	ldrb r1, [r4]
	movs r3, 0x7F
	adds r0, r3, 0
	ands r0, r1
	strb r0, [r4]
	ldr r0, [r7]
	mov r1, r8
	ldrb r2, [r1]
	ldr r0, [r0, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x1]
	movs r4, 0x2
	negs r4, r4
	adds r0, r4, 0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldr r2, [r7]
	mov r1, r8
	ldrb r0, [r1]
	adds r1, r6, 0
	eors r1, r0
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	ldr r2, [r7]
	mov r1, r8
	ldrb r0, [r1]
	adds r1, r6, 0
	eors r1, r0
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	ands r4, r1
	strb r4, [r0, 0x1]
	ldr r4, _0803A970 @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
_0803A936:
	ldr r0, _0803A974 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0803A97C
	mov r1, r8
	ldrb r0, [r1]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0803A988
	ldr r0, _0803A978 @ =gMPlayInfo_BGM
	bl m4aMPlayContinue
	b _0803A988
	.align 2, 0
_0803A95C: .4byte gSprites
_0803A960: .4byte gHealthboxSpriteIds
_0803A964: .4byte gActiveBattler
_0803A968: .4byte SpriteCallbackDummy
_0803A96C: .4byte gBattleSpritesDataPtr
_0803A970: .4byte 0x000027f9
_0803A974: .4byte gBattleTypeFlags
_0803A978: .4byte gMPlayInfo_BGM
_0803A97C:
	ldr r0, _0803A9B4 @ =gMPlayInfo_BGM
	ldr r1, _0803A9B8 @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
_0803A988:
	ldr r0, _0803A9BC @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r3, _0803A9C0 @ =gActiveBattler
	ldrb r1, [r3]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3
	strb r1, [r0, 0x9]
	ldr r1, _0803A9C4 @ =gBattlerControllerFuncs
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803A9C8 @ =sub_803A79C
	str r1, [r0]
_0803A9AA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803A9B4: .4byte gMPlayInfo_BGM
_0803A9B8: .4byte 0x0000ffff
_0803A9BC: .4byte gBattleSpritesDataPtr
_0803A9C0: .4byte gActiveBattler
_0803A9C4: .4byte gBattlerControllerFuncs
_0803A9C8: .4byte sub_803A79C
	thumb_func_end sub_803A7E4

	thumb_func_start sub_803A9CC
sub_803A9CC: @ 803A9CC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _0803ABEC @ =gBattleSpritesDataPtr
	mov r8, r0
	ldr r0, [r0]
	ldr r7, _0803ABF0 @ =gActiveBattler
	ldrb r2, [r7]
	ldr r3, [r0, 0x4]
	lsls r5, r2, 1
	adds r0, r5, r2
	lsls r0, 2
	adds r0, r3
	ldrb r4, [r0]
	movs r6, 0x8
	adds r0, r6, 0
	ands r0, r4
	cmp r0, 0
	beq _0803A9F8
	b _0803ABDC
_0803A9F8:
	movs r1, 0x2
	mov r9, r1
	adds r1, r2, 0
	mov r0, r9
	eors r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0]
	adds r0, r6, 0
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	cmp r0, 0
	beq _0803AA1C
	b _0803ABDC
_0803AA1C:
	movs r6, 0x80
	adds r0, r6, 0
	ands r0, r4
	cmp r0, 0
	bne _0803AA3A
	ldr r0, _0803ABF4 @ =gBattlerPartyIndexes
	adds r0, r5, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0803ABF8 @ =gEnemyParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_80F1720
_0803AA3A:
	mov r2, r8
	ldr r1, [r2]
	ldrb r0, [r7]
	mov r2, r9
	eors r2, r0
	ldr r1, [r1, 0x4]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	bne _0803AA6C
	ldr r0, _0803ABF4 @ =gBattlerPartyIndexes
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0803ABF8 @ =gEnemyParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_80F1720
_0803AA6C:
	ldr r0, _0803ABFC @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0803AABA
	ldrb r0, [r7]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0803AABA
	mov r1, r8
	ldr r0, [r1]
	ldrb r2, [r7]
	ldr r0, [r0, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x9]
	adds r0, 0x1
	strb r0, [r1, 0x9]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0803AAA6
	b _0803ABDC
_0803AAA6:
	mov r2, r8
	ldr r0, [r2]
	ldrb r1, [r7]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	mov r1, r10
	strb r1, [r0, 0x9]
_0803AABA:
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _0803AB50
	ldr r0, _0803ABFC @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0803AB50
	ldr r1, _0803AC00 @ =gUnknown_3004FFC
	ldr r5, _0803ABF0 @ =gActiveBattler
	ldrb r0, [r5]
	movs r4, 0x2
	eors r0, r4
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0803AC04 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r2, _0803AC08 @ =gHealthboxSpriteIds
	mov r8, r2
	ldrb r0, [r5]
	adds r1, r4, 0
	eors r1, r0
	adds r0, r1, r2
	ldrb r0, [r0]
	ldr r2, _0803ABF4 @ =gBattlerPartyIndexes
	mov r10, r2
	lsls r1, 1
	add r1, r10
	ldrh r1, [r1]
	movs r2, 0x64
	mov r9, r2
	mov r2, r9
	muls r2, r1
	adds r1, r2, 0
	ldr r6, _0803ABF8 @ =gEnemyParty
	adds r1, r6
	movs r2, 0
	bl UpdateHealthboxAttribute
	ldrb r0, [r5]
	eors r0, r4
	bl sub_804BD94
	ldrb r0, [r5]
	eors r0, r4
	add r0, r8
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	ldrb r0, [r5]
	eors r4, r0
	lsls r0, r4, 1
	add r0, r10
	ldrh r0, [r0]
	mov r1, r9
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl SetBattlerShadowSpriteCallback
_0803AB50:
	ldr r1, _0803AC00 @ =gUnknown_3004FFC
	ldr r5, _0803ABF0 @ =gActiveBattler
	ldrb r0, [r5]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0803AC04 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r4, _0803AC08 @ =gHealthboxSpriteIds
	ldrb r1, [r5]
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _0803ABF4 @ =gBattlerPartyIndexes
	mov r9, r2
	lsls r1, 1
	add r1, r9
	ldrh r1, [r1]
	movs r2, 0x64
	mov r8, r2
	mov r2, r8
	muls r2, r1
	adds r1, r2, 0
	ldr r6, _0803ABF8 @ =gEnemyParty
	adds r1, r6
	movs r2, 0
	bl UpdateHealthboxAttribute
	ldrb r0, [r5]
	bl sub_804BD94
	ldrb r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	ldrb r4, [r5]
	lsls r0, r4, 1
	add r0, r9
	ldrh r0, [r0]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl SetBattlerShadowSpriteCallback
	ldr r0, _0803ABEC @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r2, [r0, 0x8]
	ldrb r1, [r2, 0x9]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _0803AC0C @ =gBattlerControllerFuncs
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803AC10 @ =sub_803A7E4
	str r1, [r0]
_0803ABDC:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803ABEC: .4byte gBattleSpritesDataPtr
_0803ABF0: .4byte gActiveBattler
_0803ABF4: .4byte gBattlerPartyIndexes
_0803ABF8: .4byte gEnemyParty
_0803ABFC: .4byte gBattleTypeFlags
_0803AC00: .4byte gUnknown_3004FFC
_0803AC04: .4byte gSprites
_0803AC08: .4byte gHealthboxSpriteIds
_0803AC0C: .4byte gBattlerControllerFuncs
_0803AC10: .4byte sub_803A7E4
	thumb_func_end sub_803A9CC

	thumb_func_start sub_803AC14
sub_803AC14: @ 803AC14
	push {r4-r7,lr}
	ldr r2, _0803AC70 @ =gSprites
	ldr r0, _0803AC74 @ =gBattlerSpriteIds
	ldr r7, _0803AC78 @ =gActiveBattler
	ldrb r3, [r7]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	lsrs r2, r0, 31
	cmp r2, 0x1
	bne _0803ACC0
	movs r4, 0x24
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bne _0803ACC0
	ldr r6, _0803AC7C @ =gBattleSpritesDataPtr
	ldr r0, [r6]
	ldr r1, [r0, 0x4]
	lsls r4, r3, 1
	adds r0, r4, r3
	lsls r0, 2
	adds r1, r0, r1
	ldrb r5, [r1]
	movs r0, 0x80
	ands r0, r5
	cmp r0, 0
	bne _0803AC88
	ldr r0, _0803AC80 @ =gBattlerPartyIndexes
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0803AC84 @ =gEnemyParty
	adds r1, r0
	adds r0, r3, 0
	bl sub_80F1720
	b _0803ACC0
	.align 2, 0
_0803AC70: .4byte gSprites
_0803AC74: .4byte gBattlerSpriteIds
_0803AC78: .4byte gActiveBattler
_0803AC7C: .4byte gBattleSpritesDataPtr
_0803AC80: .4byte gBattlerPartyIndexes
_0803AC84: .4byte gEnemyParty
_0803AC88:
	ldrb r0, [r1, 0x1]
	ands r2, r0
	cmp r2, 0
	beq _0803ACC0
	movs r0, 0x7F
	ands r0, r5
	strb r0, [r1]
	ldr r0, [r6]
	ldrb r2, [r7]
	ldr r0, [r0, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldr r4, _0803ACC8 @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	bl RecordedOpponentBufferExecCompleted
_0803ACC0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803ACC8: .4byte 0x000027f9
	thumb_func_end sub_803AC14

	thumb_func_start CompleteOnHealthbarDone_4
CompleteOnHealthbarDone_4: @ 803ACCC
	push {r4-r6,lr}
	ldr r6, _0803AD0C @ =gActiveBattler
	ldrb r0, [r6]
	ldr r5, _0803AD10 @ =gHealthboxSpriteIds
	adds r1, r0, r5
	ldrb r1, [r1]
	movs r2, 0
	movs r3, 0
	bl MoveBattleBar
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r6]
	adds r0, r5
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	lsls r4, 16
	asrs r1, r4, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0803AD14
	ldrb r0, [r6]
	adds r0, r5
	ldrb r0, [r0]
	movs r2, 0
	bl UpdateHpTextInHealthbox
	b _0803AD18
	.align 2, 0
_0803AD0C: .4byte gActiveBattler
_0803AD10: .4byte gHealthboxSpriteIds
_0803AD14:
	bl RecordedOpponentBufferExecCompleted
_0803AD18:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end CompleteOnHealthbarDone_4

	thumb_func_start sub_803AD20
sub_803AD20: @ 803AD20
	push {lr}
	ldr r2, _0803AD54 @ =gSprites
	ldr r0, _0803AD58 @ =gBattlerSpriteIds
	ldr r1, _0803AD5C @ =gActiveBattler
	ldrb r3, [r1]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	bne _0803AD4E
	ldr r0, _0803AD60 @ =gHealthboxSpriteIds
	adds r0, r3, r0
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl RecordedOpponentBufferExecCompleted
_0803AD4E:
	pop {r0}
	bx r0
	.align 2, 0
_0803AD54: .4byte gSprites
_0803AD58: .4byte gBattlerSpriteIds
_0803AD5C: .4byte gActiveBattler
_0803AD60: .4byte gHealthboxSpriteIds
	thumb_func_end sub_803AD20

	thumb_func_start sub_803AD64
sub_803AD64: @ 803AD64
	push {r4-r6,lr}
	ldr r0, _0803ADC4 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r6, _0803ADC8 @ =gActiveBattler
	ldrb r2, [r6]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0803ADBE
	ldr r5, _0803ADCC @ =gBattlerSpriteIds
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0803ADD0 @ =gSprites
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldrb r0, [r6]
	bl HideBattlerShadowSprite
	ldr r1, _0803ADD4 @ =gHealthboxSpriteIds
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl RecordedOpponentBufferExecCompleted
_0803ADBE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803ADC4: .4byte gBattleSpritesDataPtr
_0803ADC8: .4byte gActiveBattler
_0803ADCC: .4byte gBattlerSpriteIds
_0803ADD0: .4byte gSprites
_0803ADD4: .4byte gHealthboxSpriteIds
	thumb_func_end sub_803AD64

	thumb_func_start CompleteOnInactiveTextPrinter_5
CompleteOnInactiveTextPrinter_5: @ 803ADD8
	push {lr}
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _0803ADEA
	bl RecordedOpponentBufferExecCompleted
_0803ADEA:
	pop {r0}
	bx r0
	thumb_func_end CompleteOnInactiveTextPrinter_5

	thumb_func_start DoHitAnimBlinkSpriteEffect_4
DoHitAnimBlinkSpriteEffect_4: @ 803ADF0
	push {r4,lr}
	ldr r1, _0803AE2C @ =gBattlerSpriteIds
	ldr r0, _0803AE30 @ =gActiveBattler
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	ldr r2, _0803AE34 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x20
	bne _0803AE3C
	movs r3, 0
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0803AE38 @ =gDoingBattleAnim
	strb r3, [r0]
	bl RecordedOpponentBufferExecCompleted
	b _0803AE66
	.align 2, 0
_0803AE2C: .4byte gBattlerSpriteIds
_0803AE30: .4byte gActiveBattler
_0803AE34: .4byte gSprites
_0803AE38: .4byte gDoingBattleAnim
_0803AE3C:
	ldrh r0, [r4, 0x30]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _0803AE60
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_0803AE60:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
_0803AE66:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DoHitAnimBlinkSpriteEffect_4

	thumb_func_start sub_803AE6C
sub_803AE6C: @ 803AE6C
	push {r4,lr}
	ldr r2, _0803AEC0 @ =gSprites
	ldr r0, _0803AEC4 @ =gHealthboxSpriteIds
	ldr r4, _0803AEC8 @ =gActiveBattler
	ldrb r3, [r4]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0803AECC @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0803AEB8
	ldr r0, _0803AED0 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0803AEAC
	adds r0, r3, 0
	adds r1, r3, 0
	adds r2, r3, 0
	movs r3, 0x6
	bl InitAndLaunchSpecialAnimation
_0803AEAC:
	ldr r0, _0803AED4 @ =gBattlerControllerFuncs
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0803AED8 @ =sub_803AEDC
	str r0, [r1]
_0803AEB8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803AEC0: .4byte gSprites
_0803AEC4: .4byte gHealthboxSpriteIds
_0803AEC8: .4byte gActiveBattler
_0803AECC: .4byte SpriteCallbackDummy
_0803AED0: .4byte gBattleSpritesDataPtr
_0803AED4: .4byte gBattlerControllerFuncs
_0803AED8: .4byte sub_803AEDC
	thumb_func_end sub_803AE6C

	thumb_func_start sub_803AEDC
sub_803AEDC: @ 803AEDC
	push {lr}
	ldr r0, _0803AF18 @ =gBattleSpritesDataPtr
	ldr r2, [r0]
	ldr r0, _0803AF1C @ =gActiveBattler
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0803AF14
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	bne _0803AF14
	ldr r0, _0803AF20 @ =gMPlayInfo_BGM
	ldr r1, _0803AF24 @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
	bl RecordedOpponentBufferExecCompleted
_0803AF14:
	pop {r0}
	bx r0
	.align 2, 0
_0803AF18: .4byte gBattleSpritesDataPtr
_0803AF1C: .4byte gActiveBattler
_0803AF20: .4byte gMPlayInfo_BGM
_0803AF24: .4byte 0x0000ffff
	thumb_func_end sub_803AEDC

	thumb_func_start sub_803AF28
sub_803AF28: @ 803AF28
	push {r4,r5,lr}
	ldr r3, _0803AFD4 @ =gBattleSpritesDataPtr
	ldr r0, [r3]
	ldr r5, _0803AFD8 @ =gActiveBattler
	ldrb r1, [r5]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r2
	ldrb r1, [r2, 0x1]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0803AFCC
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	ldrb r2, [r5]
	ldr r0, [r0, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldr r4, _0803AFDC @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	ldr r1, _0803AFE0 @ =gBattlerSpriteIds
	ldrb r0, [r5]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0803AFE4 @ =gSprites
	adds r0, r1
	movs r1, 0
	bl StartSpriteAnim
	ldr r4, _0803AFE8 @ =gHealthboxSpriteIds
	ldrb r1, [r5]
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _0803AFEC @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0803AFF0 @ =gEnemyParty
	adds r1, r2
	movs r2, 0
	bl UpdateHealthboxAttribute
	ldrb r0, [r5]
	bl sub_804BD94
	ldrb r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	ldrb r0, [r5]
	bl CopyBattleSpriteInvisibility
	ldr r1, _0803AFF4 @ =gBattlerControllerFuncs
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803AFF8 @ =sub_803AE6C
	str r1, [r0]
_0803AFCC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803AFD4: .4byte gBattleSpritesDataPtr
_0803AFD8: .4byte gActiveBattler
_0803AFDC: .4byte 0x000027f9
_0803AFE0: .4byte gBattlerSpriteIds
_0803AFE4: .4byte gSprites
_0803AFE8: .4byte gHealthboxSpriteIds
_0803AFEC: .4byte gBattlerPartyIndexes
_0803AFF0: .4byte gEnemyParty
_0803AFF4: .4byte gBattlerControllerFuncs
_0803AFF8: .4byte sub_803AE6C
	thumb_func_end sub_803AF28

	thumb_func_start sub_803AFFC
sub_803AFFC: @ 803AFFC
	push {r4-r6,lr}
	ldr r6, _0803B0A0 @ =gBattleSpritesDataPtr
	ldr r0, [r6]
	ldr r5, _0803B0A4 @ =gActiveBattler
	ldrb r2, [r5]
	ldr r1, [r0, 0x4]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	bne _0803B02E
	ldr r0, _0803B0A8 @ =gBattlerPartyIndexes
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0803B0AC @ =gEnemyParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_80F1720
_0803B02E:
	ldr r4, _0803B0B0 @ =gSprites
	ldr r0, _0803B0B4 @ =gUnknown_3004FFC
	ldrb r2, [r5]
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r3, r0, 2
	adds r0, r4, 0
	adds r0, 0x1C
	adds r0, r3, r0
	ldr r1, [r0]
	ldr r0, _0803B0B8 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0803B098
	ldr r0, [r6]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _0803B098
	adds r0, r3, r4
	bl DestroySprite
	ldrb r4, [r5]
	ldr r1, _0803B0A8 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0803B0AC @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl SetBattlerShadowSpriteCallback
	ldr r1, _0803B0BC @ =gBattlerControllerFuncs
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803B0C0 @ =sub_803AF28
	str r1, [r0]
_0803B098:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803B0A0: .4byte gBattleSpritesDataPtr
_0803B0A4: .4byte gActiveBattler
_0803B0A8: .4byte gBattlerPartyIndexes
_0803B0AC: .4byte gEnemyParty
_0803B0B0: .4byte gSprites
_0803B0B4: .4byte gUnknown_3004FFC
_0803B0B8: .4byte SpriteCallbackDummy
_0803B0BC: .4byte gBattlerControllerFuncs
_0803B0C0: .4byte sub_803AF28
	thumb_func_end sub_803AFFC

	thumb_func_start CompleteOnFinishedStatusAnimation_5
CompleteOnFinishedStatusAnimation_5: @ 803B0C4
	push {lr}
	ldr r0, _0803B0EC @ =gBattleSpritesDataPtr
	ldr r2, [r0]
	ldr r0, _0803B0F0 @ =gActiveBattler
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0803B0E6
	bl RecordedOpponentBufferExecCompleted
_0803B0E6:
	pop {r0}
	bx r0
	.align 2, 0
_0803B0EC: .4byte gBattleSpritesDataPtr
_0803B0F0: .4byte gActiveBattler
	thumb_func_end CompleteOnFinishedStatusAnimation_5

	thumb_func_start CompleteOnFinishedBattleAnimation_5
CompleteOnFinishedBattleAnimation_5: @ 803B0F4
	push {lr}
	ldr r0, _0803B11C @ =gBattleSpritesDataPtr
	ldr r2, [r0]
	ldr r0, _0803B120 @ =gActiveBattler
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0803B116
	bl RecordedOpponentBufferExecCompleted
_0803B116:
	pop {r0}
	bx r0
	.align 2, 0
_0803B11C: .4byte gBattleSpritesDataPtr
_0803B120: .4byte gActiveBattler
	thumb_func_end CompleteOnFinishedBattleAnimation_5

	thumb_func_start RecordedOpponentBufferExecCompleted
RecordedOpponentBufferExecCompleted: @ 803B124
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _0803B164 @ =gBattlerControllerFuncs
	ldr r4, _0803B168 @ =gActiveBattler
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803B16C @ =sub_803A684
	str r1, [r0]
	ldr r0, _0803B170 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803B178
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, 0x2
	movs r1, 0x4
	mov r2, sp
	bl PrepareBufferDataTransferLink
	ldr r1, _0803B174 @ =gBattleBufferA
	ldrb r0, [r4]
	lsls r0, 9
	adds r0, r1
	movs r1, 0x38
	strb r1, [r0]
	b _0803B18A
	.align 2, 0
_0803B164: .4byte gBattlerControllerFuncs
_0803B168: .4byte gActiveBattler
_0803B16C: .4byte sub_803A684
_0803B170: .4byte gBattleTypeFlags
_0803B174: .4byte gBattleBufferA
_0803B178:
	ldr r2, _0803B194 @ =gBattleControllerExecFlags
	ldr r1, _0803B198 @ =gBitTable
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_0803B18A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803B194: .4byte gBattleControllerExecFlags
_0803B198: .4byte gBitTable
	thumb_func_end RecordedOpponentBufferExecCompleted

	thumb_func_start RecordedOpponentHandleGetMonData
RecordedOpponentHandleGetMonData: @ 803B19C
	push {r4-r6,lr}
	sub sp, 0x100
	movs r6, 0
	ldr r1, _0803B1C8 @ =gBattleBufferA
	ldr r0, _0803B1CC @ =gActiveBattler
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _0803B1D4
	ldr r0, _0803B1D0 @ =gBattlerPartyIndexes
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl CopyRecordedOpponentMonData
	adds r6, r0, 0
	b _0803B1F6
	.align 2, 0
_0803B1C8: .4byte gBattleBufferA
_0803B1CC: .4byte gActiveBattler
_0803B1D0: .4byte gBattlerPartyIndexes
_0803B1D4:
	ldrb r4, [r1]
	movs r5, 0
_0803B1D8:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0803B1EE
	lsls r0, r5, 24
	lsrs r0, 24
	mov r2, sp
	adds r1, r2, r6
	bl CopyRecordedOpponentMonData
	adds r6, r0
_0803B1EE:
	lsrs r4, 1
	adds r5, 0x1
	cmp r5, 0x5
	ble _0803B1D8
_0803B1F6:
	lsls r1, r6, 16
	lsrs r1, 16
	movs r0, 0x1
	mov r2, sp
	bl BtlController_EmitDataTransfer
	bl RecordedOpponentBufferExecCompleted
	add sp, 0x100
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end RecordedOpponentHandleGetMonData

	thumb_func_start CopyRecordedOpponentMonData
CopyRecordedOpponentMonData: @ 803B210
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x90
	adds r7, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	ldr r2, _0803B244 @ =gBattleBufferA
	ldr r3, _0803B248 @ =gActiveBattler
	ldrb r0, [r3]
	lsls r0, 9
	adds r1, r2, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3B
	bls _0803B23A
	bl _0803B9A6
_0803B23A:
	lsls r0, 2
	ldr r1, _0803B24C @ =_0803B250
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803B244: .4byte gBattleBufferA
_0803B248: .4byte gActiveBattler
_0803B24C: .4byte _0803B250
	.align 2, 0
_0803B250:
	.4byte _0803B340
	.4byte _0803B564
	.4byte _0803B574
	.4byte _0803B584
	.4byte _0803B5EC
	.4byte _0803B5EC
	.4byte _0803B5EC
	.4byte _0803B5EC
	.4byte _0803B608
	.4byte _0803B644
	.4byte _0803B644
	.4byte _0803B644
	.4byte _0803B644
	.4byte _0803B9A6
	.4byte _0803B9A6
	.4byte _0803B9A6
	.4byte _0803B9A6
	.4byte _0803B660
	.4byte _0803B670
	.4byte _0803B6A0
	.4byte _0803B6B0
	.4byte _0803B6C0
	.4byte _0803B6D0
	.4byte _0803B6E0
	.4byte _0803B6F0
	.4byte _0803B700
	.4byte _0803B710
	.4byte _0803B720
	.4byte _0803B730
	.4byte _0803B740
	.4byte _0803B750
	.4byte _0803B760
	.4byte _0803B7B0
	.4byte _0803B7C0
	.4byte _0803B7D0
	.4byte _0803B7E0
	.4byte _0803B7F0
	.4byte _0803B800
	.4byte _0803B810
	.4byte _0803B820
	.4byte _0803B830
	.4byte _0803B864
	.4byte _0803B874
	.4byte _0803B884
	.4byte _0803B894
	.4byte _0803B8A4
	.4byte _0803B8B4
	.4byte _0803B8C4
	.4byte _0803B8D4
	.4byte _0803B8F4
	.4byte _0803B904
	.4byte _0803B914
	.4byte _0803B924
	.4byte _0803B934
	.4byte _0803B944
	.4byte _0803B954
	.4byte _0803B964
	.4byte _0803B974
	.4byte _0803B984
	.4byte _0803B994
_0803B340:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0803B554 @ =gEnemyParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2E]
	movs r6, 0
	add r0, sp, 0x24
	mov r9, r0
	movs r1, 0x3B
	add r1, sp
	mov r10, r1
	mov r2, sp
	adds r2, 0x2B
	str r2, [sp, 0x80]
	mov r0, sp
	adds r0, 0x2A
	str r0, [sp, 0x7C]
	mov r1, sp
	adds r1, 0x68
	str r1, [sp, 0x8C]
	adds r2, 0x5
	str r2, [sp, 0x84]
	adds r0, 0x12
	str r0, [sp, 0x88]
	mov r8, r4
	add r4, sp, 0xC
_0803B38C:
	adds r1, r6, 0
	adds r1, 0xD
	mov r0, r8
	bl GetMonData
	strh r0, [r4]
	adds r1, r6, 0
	adds r1, 0x11
	mov r0, r8
	bl GetMonData
	mov r2, r9
	adds r1, r2, r6
	strb r0, [r1]
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0803B38C
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0803B554 @ =gEnemyParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl GetMonData
	mov r1, r10
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	ldr r2, [sp, 0x80]
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x19
	bl GetMonData
	str r0, [sp, 0x44]
	adds r0, r4, 0
	movs r1, 0x27
	bl GetMonData
	mov r3, sp
	movs r5, 0x1F
	ands r0, r5
	ldrb r2, [r3, 0x14]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x28
	bl GetMonData
	mov r3, sp
	movs r6, 0x1F
	ands r0, r6
	lsls r0, 5
	ldrh r2, [r3, 0x14]
	ldr r1, _0803B558 @ =0xfffffc1f
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x29
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, 2
	ldrb r2, [r3, 0x15]
	movs r1, 0x7D
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x15]
	adds r0, r4, 0
	movs r1, 0x2A
	bl GetMonData
	movs r1, 0x1F
	ands r1, r0
	lsls r1, 15
	ldr r0, [sp, 0x14]
	ldr r2, _0803B55C @ =0xfff07fff
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x14]
	adds r0, r4, 0
	movs r1, 0x2B
	bl GetMonData
	mov r3, sp
	ands r0, r6
	lsls r0, 4
	ldrh r2, [r3, 0x16]
	ldr r1, _0803B560 @ =0xfffffe0f
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x16]
	adds r0, r4, 0
	movs r1, 0x2C
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, 1
	ldrb r2, [r3, 0x17]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x48]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	str r0, [sp, 0x4C]
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	ldr r1, [sp, 0x7C]
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x28]
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2C]
	adds r0, r4, 0
	movs r1, 0x3B
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2]
	adds r0, r4, 0
	movs r1, 0x3C
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x4]
	adds r0, r4, 0
	movs r1, 0x3D
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x6]
	adds r0, r4, 0
	movs r1, 0x3E
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x8]
	adds r0, r4, 0
	movs r1, 0x3F
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0xA]
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	mov r3, sp
	movs r1, 0x1
	ands r0, r1
	lsls r0, 6
	ldrb r2, [r3, 0x17]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x2E
	bl GetMonData
	mov r3, sp
	lsls r0, 7
	ldrb r2, [r3, 0x17]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [sp, 0x54]
	adds r0, r4, 0
	movs r1, 0x2
	ldr r2, [sp, 0x8C]
	bl GetMonData
	ldr r0, [sp, 0x84]
	ldr r1, [sp, 0x8C]
	bl StringCopy10
	adds r0, r4, 0
	movs r1, 0x7
	ldr r2, [sp, 0x88]
	bl GetMonData
	mov r2, sp
	movs r6, 0
_0803B544:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0x57
	bls _0803B544
	b _0803B9A6
	.align 2, 0
_0803B554: .4byte gEnemyParty
_0803B558: .4byte 0xfffffc1f
_0803B55C: .4byte 0xfff07fff
_0803B560: .4byte 0xfffffe0f
_0803B564:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B570 @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	b _0803B8DE
	.align 2, 0
_0803B570: .4byte gEnemyParty
_0803B574:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B580 @ =gEnemyParty
	adds r0, r1
	movs r1, 0xC
	b _0803B8DE
	.align 2, 0
_0803B580: .4byte gEnemyParty
_0803B584:
	movs r6, 0
	add r2, sp, 0x58
	mov r9, r2
	add r0, sp, 0x60
	mov r10, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0803B5E8 @ =gEnemyParty
	adds r4, r1, r0
	mov r8, r9
_0803B59A:
	adds r1, r6, 0
	adds r1, 0xD
	adds r0, r4, 0
	bl GetMonData
	mov r1, r8
	strh r0, [r1]
	adds r1, r6, 0
	adds r1, 0x11
	adds r0, r4, 0
	bl GetMonData
	mov r2, r10
	adds r1, r2, r6
	strb r0, [r1]
	movs r0, 0x2
	add r8, r0
	adds r6, 0x1
	cmp r6, 0x3
	ble _0803B59A
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B5E8 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	mov r1, r9
	strb r0, [r1, 0xC]
	mov r2, r9
	movs r6, 0
_0803B5D8:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0xF
	bls _0803B5D8
	b _0803B9A6
	.align 2, 0
_0803B5E8: .4byte gEnemyParty
_0803B5EC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B604 @ =gEnemyParty
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x9
	b _0803B8DE
	.align 2, 0
_0803B604: .4byte gEnemyParty
_0803B608:
	movs r6, 0
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r2, _0803B640 @ =gEnemyParty
	mov r8, r2
_0803B614:
	adds r1, r6, 0
	adds r1, 0x11
	mov r2, r8
	adds r0, r4, r2
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	cmp r6, 0x3
	ble _0803B614
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B640 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	b _0803B9A6
	.align 2, 0
_0803B640: .4byte gEnemyParty
_0803B644:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B65C @ =gEnemyParty
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x8
	b _0803B99E
	.align 2, 0
_0803B65C: .4byte gEnemyParty
_0803B660:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B66C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x1
	b _0803B67A
	.align 2, 0
_0803B66C: .4byte gEnemyParty
_0803B670:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B69C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x19
_0803B67A:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	movs r6, 0x3
	b _0803B9A6
	.align 2, 0
_0803B69C: .4byte gEnemyParty
_0803B6A0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B6AC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x1A
	b _0803B99E
	.align 2, 0
_0803B6AC: .4byte gEnemyParty
_0803B6B0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B6BC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x1B
	b _0803B99E
	.align 2, 0
_0803B6BC: .4byte gEnemyParty
_0803B6C0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B6CC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x1C
	b _0803B99E
	.align 2, 0
_0803B6CC: .4byte gEnemyParty
_0803B6D0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B6DC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x1D
	b _0803B99E
	.align 2, 0
_0803B6DC: .4byte gEnemyParty
_0803B6E0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B6EC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x1E
	b _0803B99E
	.align 2, 0
_0803B6EC: .4byte gEnemyParty
_0803B6F0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B6FC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x1F
	b _0803B99E
	.align 2, 0
_0803B6FC: .4byte gEnemyParty
_0803B700:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B70C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x20
	b _0803B99E
	.align 2, 0
_0803B70C: .4byte gEnemyParty
_0803B710:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B71C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x22
	b _0803B99E
	.align 2, 0
_0803B71C: .4byte gEnemyParty
_0803B720:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B72C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x23
	b _0803B99E
	.align 2, 0
_0803B72C: .4byte gEnemyParty
_0803B730:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B73C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x24
	b _0803B99E
	.align 2, 0
_0803B73C: .4byte gEnemyParty
_0803B740:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B74C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x25
	b _0803B99E
	.align 2, 0
_0803B74C: .4byte gEnemyParty
_0803B750:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B75C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x26
	b _0803B99E
	.align 2, 0
_0803B75C: .4byte gEnemyParty
_0803B760:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0803B7AC @ =gEnemyParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x27
	bl GetMonData
	strb r0, [r7]
	adds r0, r4, 0
	movs r1, 0x28
	bl GetMonData
	strb r0, [r7, 0x1]
	adds r0, r4, 0
	movs r1, 0x29
	bl GetMonData
	strb r0, [r7, 0x2]
	adds r0, r4, 0
	movs r1, 0x2A
	bl GetMonData
	strb r0, [r7, 0x3]
	adds r0, r4, 0
	movs r1, 0x2B
	bl GetMonData
	strb r0, [r7, 0x4]
	adds r0, r4, 0
	movs r1, 0x2C
	bl GetMonData
	strb r0, [r7, 0x5]
	movs r6, 0x6
	b _0803B9A6
	.align 2, 0
_0803B7AC: .4byte gEnemyParty
_0803B7B0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B7BC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x27
	b _0803B99E
	.align 2, 0
_0803B7BC: .4byte gEnemyParty
_0803B7C0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B7CC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x28
	b _0803B99E
	.align 2, 0
_0803B7CC: .4byte gEnemyParty
_0803B7D0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B7DC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x29
	b _0803B99E
	.align 2, 0
_0803B7DC: .4byte gEnemyParty
_0803B7E0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B7EC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2A
	b _0803B99E
	.align 2, 0
_0803B7EC: .4byte gEnemyParty
_0803B7F0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B7FC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2B
	b _0803B99E
	.align 2, 0
_0803B7FC: .4byte gEnemyParty
_0803B800:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B80C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2C
	b _0803B99E
	.align 2, 0
_0803B80C: .4byte gEnemyParty
_0803B810:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B81C @ =gEnemyParty
	adds r0, r1
	movs r1, 0
	b _0803B83A
	.align 2, 0
_0803B81C: .4byte gEnemyParty
_0803B820:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B82C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x9
	b _0803B8DE
	.align 2, 0
_0803B82C: .4byte gEnemyParty
_0803B830:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B860 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x37
_0803B83A:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	lsrs r0, r1, 24
	strb r0, [r7, 0x3]
	movs r6, 0x4
	b _0803B9A6
	.align 2, 0
_0803B860: .4byte gEnemyParty
_0803B864:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B870 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x38
	b _0803B99E
	.align 2, 0
_0803B870: .4byte gEnemyParty
_0803B874:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B880 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x39
	b _0803B8DE
	.align 2, 0
_0803B880: .4byte gEnemyParty
_0803B884:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B890 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3A
	b _0803B8DE
	.align 2, 0
_0803B890: .4byte gEnemyParty
_0803B894:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B8A0 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3B
	b _0803B8DE
	.align 2, 0
_0803B8A0: .4byte gEnemyParty
_0803B8A4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B8B0 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3C
	b _0803B8DE
	.align 2, 0
_0803B8B0: .4byte gEnemyParty
_0803B8B4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B8C0 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3D
	b _0803B8DE
	.align 2, 0
_0803B8C0: .4byte gEnemyParty
_0803B8C4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B8D0 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3E
	b _0803B8DE
	.align 2, 0
_0803B8D0: .4byte gEnemyParty
_0803B8D4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B8F0 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3F
_0803B8DE:
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	strb r0, [r7]
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r6, 0x2
	b _0803B9A6
	.align 2, 0
_0803B8F0: .4byte gEnemyParty
_0803B8F4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B900 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x16
	b _0803B99E
	.align 2, 0
_0803B900: .4byte gEnemyParty
_0803B904:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B910 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x17
	b _0803B99E
	.align 2, 0
_0803B910: .4byte gEnemyParty
_0803B914:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B920 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x18
	b _0803B99E
	.align 2, 0
_0803B920: .4byte gEnemyParty
_0803B924:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B930 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x21
	b _0803B99E
	.align 2, 0
_0803B930: .4byte gEnemyParty
_0803B934:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B940 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2F
	b _0803B99E
	.align 2, 0
_0803B940: .4byte gEnemyParty
_0803B944:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B950 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x30
	b _0803B99E
	.align 2, 0
_0803B950: .4byte gEnemyParty
_0803B954:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B960 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x32
	b _0803B99E
	.align 2, 0
_0803B960: .4byte gEnemyParty
_0803B964:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B970 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x33
	b _0803B99E
	.align 2, 0
_0803B970: .4byte gEnemyParty
_0803B974:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B980 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x34
	b _0803B99E
	.align 2, 0
_0803B980: .4byte gEnemyParty
_0803B984:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B990 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x35
	b _0803B99E
	.align 2, 0
_0803B990: .4byte gEnemyParty
_0803B994:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803B9B8 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x36
_0803B99E:
	bl GetMonData
	strb r0, [r7]
	movs r6, 0x1
_0803B9A6:
	adds r0, r6, 0
	add sp, 0x90
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803B9B8: .4byte gEnemyParty
	thumb_func_end CopyRecordedOpponentMonData

	thumb_func_start sub_803B9BC
sub_803B9BC: @ 803B9BC
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803B9BC

	thumb_func_start RecordedOpponentHandleSetMonData
RecordedOpponentHandleSetMonData: @ 803B9C8
	push {r4,r5,lr}
	ldr r1, _0803B9EC @ =gBattleBufferA
	ldr r0, _0803B9F0 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _0803B9F8
	ldr r0, _0803B9F4 @ =gBattlerPartyIndexes
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	bl SetRecordedOpponentMonData
	b _0803BA16
	.align 2, 0
_0803B9EC: .4byte gBattleBufferA
_0803B9F0: .4byte gActiveBattler
_0803B9F4: .4byte gBattlerPartyIndexes
_0803B9F8:
	ldrb r4, [r1]
	movs r5, 0
_0803B9FC:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0803BA0A
	adds r0, r5, 0
	bl SetRecordedOpponentMonData
_0803BA0A:
	lsrs r4, 1
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _0803B9FC
_0803BA16:
	bl RecordedOpponentBufferExecCompleted
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end RecordedOpponentHandleSetMonData

	thumb_func_start SetRecordedOpponentMonData
SetRecordedOpponentMonData: @ 803BA20
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x38
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r3, _0803BA58 @ =gActiveBattler
	ldrb r0, [r3]
	lsls r0, 9
	ldr r2, _0803BA5C @ =gUnknown_2022BC7
	adds r4, r0, r2
	adds r7, r4, 0
	subs r1, r2, 0x2
	adds r0, r1
	ldrb r0, [r0]
	adds r6, r3, 0
	adds r3, r2, 0
	cmp r0, 0x3B
	bls _0803BA4E
	bl _0803C32C
_0803BA4E:
	lsls r0, 2
	ldr r1, _0803BA60 @ =_0803BA64
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803BA58: .4byte gActiveBattler
_0803BA5C: .4byte gUnknown_2022BC7
_0803BA60: .4byte _0803BA64
	.align 2, 0
_0803BA64:
	.4byte _0803BB54
	.4byte _0803BCEC
	.4byte _0803BD08
	.4byte _0803BD24
	.4byte _0803BD78
	.4byte _0803BD78
	.4byte _0803BD78
	.4byte _0803BD78
	.4byte _0803BD98
	.4byte _0803BE00
	.4byte _0803BE00
	.4byte _0803BE00
	.4byte _0803BE00
	.4byte _0803C32C
	.4byte _0803C32C
	.4byte _0803C32C
	.4byte _0803C32C
	.4byte _0803BE28
	.4byte _0803BE44
	.4byte _0803BE60
	.4byte _0803BE7C
	.4byte _0803BE98
	.4byte _0803BEB4
	.4byte _0803BED0
	.4byte _0803BEEC
	.4byte _0803BF08
	.4byte _0803BF24
	.4byte _0803BF40
	.4byte _0803BF5C
	.4byte _0803BF78
	.4byte _0803BF94
	.4byte _0803BFB0
	.4byte _0803C024
	.4byte _0803C040
	.4byte _0803C05C
	.4byte _0803C078
	.4byte _0803C094
	.4byte _0803C0B0
	.4byte _0803C0CC
	.4byte _0803C0E8
	.4byte _0803C104
	.4byte _0803C120
	.4byte _0803C13C
	.4byte _0803C158
	.4byte _0803C174
	.4byte _0803C190
	.4byte _0803C1AC
	.4byte _0803C1C8
	.4byte _0803C1E4
	.4byte _0803C200
	.4byte _0803C21C
	.4byte _0803C238
	.4byte _0803C254
	.4byte _0803C270
	.4byte _0803C28C
	.4byte _0803C2A8
	.4byte _0803C2C4
	.4byte _0803C2E0
	.4byte _0803C2FC
	.4byte _0803C318
_0803BB54:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0803BCE8 @ =gEnemyParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	adds r2, r7, 0
	bl SetMonData
	adds r2, r7, 0
	adds r2, 0x2E
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
	movs r0, 0
	mov r8, r0
	movs r0, 0x3B
	adds r0, r7
	mov r10, r0
	adds r0, r7, 0
	adds r0, 0x2B
	str r0, [sp, 0x20]
	adds r0, 0x19
	str r0, [sp, 0x28]
	adds r0, 0x4
	str r0, [sp, 0x2C]
	adds r0, 0x4
	str r0, [sp, 0x30]
	subs r0, 0x22
	str r0, [sp, 0x1C]
	subs r0, 0x2
	str r0, [sp, 0x18]
	adds r0, 0x4
	str r0, [sp, 0x24]
	adds r0, r7, 0x2
	str r0, [sp, 0x4]
	adds r0, r7, 0x4
	str r0, [sp, 0x8]
	adds r0, r7, 0x6
	str r0, [sp, 0xC]
	adds r0, 0x2
	str r0, [sp, 0x10]
	adds r0, 0x2
	str r0, [sp, 0x14]
	mov r9, r4
	adds r6, r7, 0
	adds r6, 0x24
	adds r4, r7, 0
	adds r4, 0xC
_0803BBBA:
	mov r1, r8
	adds r1, 0xD
	mov r0, r9
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	mov r0, r9
	adds r2, r6, 0
	bl SetMonData
	adds r6, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _0803BBBA
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0803BCE8 @ =gEnemyParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	mov r2, r10
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x20
	ldr r2, [sp, 0x20]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x19
	ldr r2, [sp, 0x28]
	bl SetMonData
	ldrb r0, [r7, 0x14]
	lsls r0, 27
	lsrs r0, 27
	mov r1, sp
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x27
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r7, 0x14]
	lsls r0, 22
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x28
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r7, 0x15]
	lsls r0, 25
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x29
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldr r0, [r7, 0x14]
	lsls r0, 12
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2A
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r7, 0x16]
	lsls r0, 23
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2B
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r7, 0x17]
	lsls r0, 26
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2C
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0
	ldr r2, [sp, 0x2C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x37
	ldr r2, [sp, 0x30]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x38
	ldr r2, [sp, 0x1C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x39
	ldr r2, [sp, 0x18]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3A
	ldr r2, [sp, 0x24]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3B
	ldr r2, [sp, 0x4]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3C
	ldr r2, [sp, 0x8]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3D
	ldr r2, [sp, 0xC]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3E
	ldr r2, [sp, 0x10]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3F
	ldr r2, [sp, 0x14]
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803BCE8: .4byte gEnemyParty
_0803BCEC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803BD04 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0xB
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803BD04: .4byte gEnemyParty
_0803BD08:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803BD20 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0xC
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803BD20: .4byte gEnemyParty
_0803BD24:
	movs r0, 0
	mov r8, r0
	movs r0, 0xC
	adds r0, r4
	mov r9, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0803BD74 @ =gEnemyParty
	adds r7, r1, r0
	adds r6, r4, 0
	adds r6, 0x8
_0803BD3C:
	mov r1, r8
	adds r1, 0xD
	adds r0, r7, 0
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	adds r0, r7, 0
	adds r2, r6, 0
	bl SetMonData
	adds r6, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _0803BD3C
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803BD74 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x15
	mov r2, r9
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803BD74: .4byte gEnemyParty
_0803BD78:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803BD90 @ =gEnemyParty
	adds r0, r1
	ldr r3, _0803BD94 @ =gBattleBufferA
	ldrb r2, [r6]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x9
	b _0803BE16
	.align 2, 0
_0803BD90: .4byte gEnemyParty
_0803BD94: .4byte gBattleBufferA
_0803BD98:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0803BDFC @ =gEnemyParty
	adds r4, r0
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	adds r0, r4, 0
	movs r1, 0x11
	str r3, [sp, 0x34]
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, 9
	ldr r3, [sp, 0x34]
	adds r0, r3, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x12
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, 9
	ldr r3, [sp, 0x34]
	adds r0, r3, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x13
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, 9
	ldr r3, [sp, 0x34]
	adds r0, r3, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x14
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, 9
	ldr r3, [sp, 0x34]
	adds r0, r3, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803BDFC: .4byte gEnemyParty
_0803BE00:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803BE20 @ =gEnemyParty
	adds r0, r1
	ldr r3, _0803BE24 @ =gBattleBufferA
	ldrb r2, [r6]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x8
_0803BE16:
	adds r3, 0x3
	adds r2, r3
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803BE20: .4byte gEnemyParty
_0803BE24: .4byte gBattleBufferA
_0803BE28:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803BE40 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x1
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803BE40: .4byte gEnemyParty
_0803BE44:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803BE5C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x19
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803BE5C: .4byte gEnemyParty
_0803BE60:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803BE78 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x1A
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803BE78: .4byte gEnemyParty
_0803BE7C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803BE94 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x1B
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803BE94: .4byte gEnemyParty
_0803BE98:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803BEB0 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x1C
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803BEB0: .4byte gEnemyParty
_0803BEB4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803BECC @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x1D
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803BECC: .4byte gEnemyParty
_0803BED0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803BEE8 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x1E
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803BEE8: .4byte gEnemyParty
_0803BEEC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803BF04 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x1F
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803BF04: .4byte gEnemyParty
_0803BF08:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803BF20 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x20
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803BF20: .4byte gEnemyParty
_0803BF24:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803BF3C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x22
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803BF3C: .4byte gEnemyParty
_0803BF40:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803BF58 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x23
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803BF58: .4byte gEnemyParty
_0803BF5C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803BF74 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x24
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803BF74: .4byte gEnemyParty
_0803BF78:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803BF90 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x25
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803BF90: .4byte gEnemyParty
_0803BF94:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803BFAC @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x26
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803BFAC: .4byte gEnemyParty
_0803BFB0:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0803C020 @ =gEnemyParty
	adds r4, r0
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	adds r0, r4, 0
	movs r1, 0x27
	str r3, [sp, 0x34]
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, 9
	ldr r3, [sp, 0x34]
	adds r0, r3, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x28
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, 9
	ldr r3, [sp, 0x34]
	adds r0, r3, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x29
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, 9
	ldr r3, [sp, 0x34]
	adds r0, r3, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2A
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, 9
	ldr r3, [sp, 0x34]
	adds r0, r3, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2B
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, 9
	ldr r3, [sp, 0x34]
	adds r0, r3, 0x5
	adds r2, r0
	adds r0, r4, 0
	b _0803C0BE
	.align 2, 0
_0803C020: .4byte gEnemyParty
_0803C024:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C03C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x27
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C03C: .4byte gEnemyParty
_0803C040:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C058 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x28
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C058: .4byte gEnemyParty
_0803C05C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C074 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x29
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C074: .4byte gEnemyParty
_0803C078:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C090 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x2A
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C090: .4byte gEnemyParty
_0803C094:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C0AC @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x2B
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C0AC: .4byte gEnemyParty
_0803C0B0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C0C8 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
_0803C0BE:
	movs r1, 0x2C
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C0C8: .4byte gEnemyParty
_0803C0CC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C0E4 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C0E4: .4byte gEnemyParty
_0803C0E8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C100 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x9
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C100: .4byte gEnemyParty
_0803C104:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C11C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x37
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C11C: .4byte gEnemyParty
_0803C120:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C138 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x38
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C138: .4byte gEnemyParty
_0803C13C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C154 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x39
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C154: .4byte gEnemyParty
_0803C158:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C170 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x3A
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C170: .4byte gEnemyParty
_0803C174:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C18C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x3B
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C18C: .4byte gEnemyParty
_0803C190:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C1A8 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x3C
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C1A8: .4byte gEnemyParty
_0803C1AC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C1C4 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x3D
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C1C4: .4byte gEnemyParty
_0803C1C8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C1E0 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x3E
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C1E0: .4byte gEnemyParty
_0803C1E4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C1FC @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x3F
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C1FC: .4byte gEnemyParty
_0803C200:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C218 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x16
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C218: .4byte gEnemyParty
_0803C21C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C234 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x17
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C234: .4byte gEnemyParty
_0803C238:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C250 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x18
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C250: .4byte gEnemyParty
_0803C254:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C26C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x21
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C26C: .4byte gEnemyParty
_0803C270:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C288 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x2F
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C288: .4byte gEnemyParty
_0803C28C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C2A4 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x30
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C2A4: .4byte gEnemyParty
_0803C2A8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C2C0 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x32
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C2C0: .4byte gEnemyParty
_0803C2C4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C2DC @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x33
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C2DC: .4byte gEnemyParty
_0803C2E0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C2F8 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x34
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C2F8: .4byte gEnemyParty
_0803C2FC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C314 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x35
	bl SetMonData
	b _0803C32C
	.align 2, 0
_0803C314: .4byte gEnemyParty
_0803C318:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803C33C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x36
	bl SetMonData
_0803C32C:
	add sp, 0x38
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C33C: .4byte gEnemyParty
	thumb_func_end SetRecordedOpponentMonData

	thumb_func_start RecordedOpponentHandleSetRawMonData
RecordedOpponentHandleSetRawMonData: @ 803C340
	push {r4-r7,lr}
	ldr r1, _0803C3A4 @ =gBattlerPartyIndexes
	ldr r7, _0803C3A8 @ =gActiveBattler
	ldrb r2, [r7]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	adds r3, r1, 0
	muls r3, r0
	ldr r4, _0803C3AC @ =gBattleBufferA
	lsls r2, 9
	adds r0, r4, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	ldr r1, _0803C3B0 @ =gEnemyParty
	adds r0, r1
	adds r5, r3, r0
	movs r3, 0
	adds r0, r4, 0x2
	adds r2, r0
	ldrb r2, [r2]
	cmp r3, r2
	bcs _0803C398
	adds r6, r4, 0
	adds r2, r7, 0
	adds r4, r0, 0
_0803C376:
	adds r1, r5, r3
	ldrb r0, [r2]
	lsls r0, 9
	adds r0, 0x3
	adds r0, r3, r0
	adds r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r0, [r2]
	lsls r0, 9
	adds r0, r4
	ldrb r0, [r0]
	cmp r3, r0
	bcc _0803C376
_0803C398:
	bl RecordedOpponentBufferExecCompleted
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C3A4: .4byte gBattlerPartyIndexes
_0803C3A8: .4byte gActiveBattler
_0803C3AC: .4byte gBattleBufferA
_0803C3B0: .4byte gEnemyParty
	thumb_func_end RecordedOpponentHandleSetRawMonData

	thumb_func_start LinkOpponentHandleLoadPokeSprite
LinkOpponentHandleLoadPokeSprite: @ 803C3B4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r7, _0803C4DC @ =gBattlerPartyIndexes
	ldr r6, _0803C4E0 @ =gActiveBattler
	ldrb r0, [r6]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	movs r1, 0x64
	mov r10, r1
	mov r2, r10
	muls r2, r0
	adds r0, r2, 0
	ldr r1, _0803C4E4 @ =gEnemyParty
	mov r9, r1
	add r0, r9
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r1, [r6]
	lsls r0, r1, 1
	adds r0, r7
	ldrh r0, [r0]
	mov r2, r10
	muls r2, r0
	adds r0, r2, 0
	add r0, r9
	bl BattleLoadOpponentMonSpriteGfx
	ldrb r0, [r6]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _0803C4E8 @ =gMultiuseSpriteTemplate
	mov r8, r0
	ldrb r0, [r6]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldrb r0, [r6]
	bl GetBattlerSpriteDefault_Y
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r6]
	bl GetBattlerSpriteSubpriority
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r4, _0803C4EC @ =gBattlerSpriteIds
	ldrb r1, [r6]
	adds r1, r4
	strb r0, [r1]
	ldr r5, _0803C4F0 @ =gSprites
	ldrb r0, [r6]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0803C4F4 @ =0x0000ff10
	strh r1, [r0, 0x24]
	ldrb r2, [r6]
	adds r0, r2, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x2E]
	ldrb r3, [r6]
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r2, [r6]
	adds r4, r2, r4
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0803C4F8 @ =gBattleMonForms
	adds r2, r1
	ldrb r1, [r2]
	bl StartSpriteAnim
	ldrb r4, [r6]
	lsls r0, r4, 1
	adds r0, r7
	ldrh r0, [r0]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl SetBattlerShadowSpriteCallback
	ldr r1, _0803C4FC @ =gBattlerControllerFuncs
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803C500 @ =sub_803AC14
	str r1, [r0]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C4DC: .4byte gBattlerPartyIndexes
_0803C4E0: .4byte gActiveBattler
_0803C4E4: .4byte gEnemyParty
_0803C4E8: .4byte gMultiuseSpriteTemplate
_0803C4EC: .4byte gBattlerSpriteIds
_0803C4F0: .4byte gSprites
_0803C4F4: .4byte 0x0000ff10
_0803C4F8: .4byte gBattleMonForms
_0803C4FC: .4byte gBattlerControllerFuncs
_0803C500: .4byte sub_803AC14
	thumb_func_end LinkOpponentHandleLoadPokeSprite

	thumb_func_start LinkOpponentHandleSendOutPoke
LinkOpponentHandleSendOutPoke: @ 803C504
	push {r4,lr}
	ldr r1, _0803C53C @ =gBattlerPartyIndexes
	ldr r4, _0803C540 @ =gActiveBattler
	ldrb r0, [r4]
	lsls r2, r0, 1
	adds r2, r1
	ldr r3, _0803C544 @ =gBattleBufferA
	lsls r0, 9
	adds r1, r3, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r2]
	ldrb r0, [r4]
	lsls r1, r0, 9
	adds r3, 0x2
	adds r1, r3
	ldrb r1, [r1]
	bl sub_803C550
	ldr r1, _0803C548 @ =gBattlerControllerFuncs
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803C54C @ =sub_803AFFC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C53C: .4byte gBattlerPartyIndexes
_0803C540: .4byte gActiveBattler
_0803C544: .4byte gBattleBufferA
_0803C548: .4byte gBattlerControllerFuncs
_0803C54C: .4byte sub_803AFFC
	thumb_func_end LinkOpponentHandleSendOutPoke

	thumb_func_start sub_803C550
sub_803C550: @ 803C550
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl ClearTemporarySpeciesSpriteData
	ldr r0, _0803C6AC @ =gBattlerPartyIndexes
	lsls r4, r6, 1
	adds r4, r0
	ldr r0, _0803C6B0 @ =gBattleBufferA
	lsls r1, r6, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	strh r0, [r4]
	ldrh r0, [r4]
	movs r1, 0x64
	mov r9, r1
	mov r1, r9
	muls r1, r0
	adds r0, r1, 0
	ldr r5, _0803C6B4 @ =gEnemyParty
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	mov r8, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _0803C6B8 @ =sub_8033E3C
	bl CreateInvisibleSpriteWithCallback
	ldr r1, _0803C6BC @ =gUnknown_3004FFC
	mov r10, r1
	add r10, r6
	mov r1, r10
	strb r0, [r1]
	ldrh r0, [r4]
	mov r1, r9
	muls r1, r0
	adds r0, r1, 0
	adds r0, r5
	adds r1, r6, 0
	bl BattleLoadOpponentMonSpriteGfx
	adds r0, r6, 0
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _0803C6C0 @ =gMultiuseSpriteTemplate
	mov r9, r0
	adds r0, r6, 0
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	bl GetBattlerSpriteDefault_Y
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl GetBattlerSpriteSubpriority
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r9
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r4, _0803C6C4 @ =gBattlerSpriteIds
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _0803C6C8 @ =gSprites
	mov r0, r10
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r4]
	strh r1, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r6, [r0, 0x2E]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x32]
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, r6, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0803C6CC @ =gBattleMonForms
	adds r6, r1
	ldrb r1, [r6]
	bl StartSpriteAnim
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0803C6D0 @ =SpriteCallbackDummy
	str r1, [r0]
	movs r0, 0
	movs r1, 0xFE
	bl DoPokeballSendOutAnimation
	mov r1, r10
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x2E]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803C6AC: .4byte gBattlerPartyIndexes
_0803C6B0: .4byte gBattleBufferA
_0803C6B4: .4byte gEnemyParty
_0803C6B8: .4byte sub_8033E3C
_0803C6BC: .4byte gUnknown_3004FFC
_0803C6C0: .4byte gMultiuseSpriteTemplate
_0803C6C4: .4byte gBattlerSpriteIds
_0803C6C8: .4byte gSprites
_0803C6CC: .4byte gBattleMonForms
_0803C6D0: .4byte SpriteCallbackDummy
	thumb_func_end sub_803C550

	thumb_func_start LinkOpponentHandleReturnPokeToBall
LinkOpponentHandleReturnPokeToBall: @ 803C6D4
	push {r4-r6,lr}
	ldr r1, _0803C708 @ =gBattleBufferA
	ldr r6, _0803C70C @ =gActiveBattler
	ldrb r2, [r6]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r3, [r0]
	cmp r3, 0
	bne _0803C71C
	ldr r0, _0803C710 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	strb r3, [r0, 0x4]
	ldr r1, _0803C714 @ =gBattlerControllerFuncs
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803C718 @ =sub_803C76C
	str r1, [r0]
	b _0803C758
	.align 2, 0
_0803C708: .4byte gBattleBufferA
_0803C70C: .4byte gActiveBattler
_0803C710: .4byte gBattleSpritesDataPtr
_0803C714: .4byte gBattlerControllerFuncs
_0803C718: .4byte sub_803C76C
_0803C71C:
	ldr r5, _0803C760 @ =gBattlerSpriteIds
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0803C764 @ =gSprites
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldrb r0, [r6]
	bl HideBattlerShadowSprite
	ldr r1, _0803C768 @ =gHealthboxSpriteIds
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl RecordedOpponentBufferExecCompleted
_0803C758:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803C760: .4byte gBattlerSpriteIds
_0803C764: .4byte gSprites
_0803C768: .4byte gHealthboxSpriteIds
	thumb_func_end LinkOpponentHandleReturnPokeToBall

	thumb_func_start sub_803C76C
sub_803C76C: @ 803C76C
	push {r4-r6,lr}
	ldr r6, _0803C78C @ =gBattleSpritesDataPtr
	ldr r4, [r6]
	ldr r5, _0803C790 @ =gActiveBattler
	ldrb r2, [r5]
	ldr r1, [r4, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r1
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	beq _0803C794
	cmp r0, 0x1
	beq _0803C7C2
	b _0803C7EA
	.align 2, 0
_0803C78C: .4byte gBattleSpritesDataPtr
_0803C790: .4byte gActiveBattler
_0803C794:
	ldr r1, [r4]
	lsls r0, r2, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0803C7AE
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl InitAndLaunchSpecialAnimation
_0803C7AE:
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0, 0x4]
	b _0803C7EA
_0803C7C2:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0803C7EA
	strb r0, [r3, 0x4]
	ldrb r2, [r5]
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x2
	bl InitAndLaunchSpecialAnimation
	ldr r1, _0803C7F0 @ =gBattlerControllerFuncs
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803C7F4 @ =sub_803AD64
	str r1, [r0]
_0803C7EA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803C7F0: .4byte gBattlerControllerFuncs
_0803C7F4: .4byte sub_803AD64
	thumb_func_end sub_803C76C

	thumb_func_start sub_803C7F8
sub_803C7F8: @ 803C7F8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _0803C884 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0803C8C0
	ldr r6, _0803C888 @ =gActiveBattler
	ldrb r0, [r6]
	bl GetBattlerPosition
	movs r1, 0x2
	ands r1, r0
	movs r7, 0xC8
	cmp r1, 0
	beq _0803C820
	movs r7, 0x98
_0803C820:
	ldrb r0, [r6]
	bl GetBankMultiplayerId
	ldr r5, _0803C88C @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r5
	movs r4, 0xFF
	ldrb r0, [r1]
	cmp r0, 0x2
	beq _0803C866
	ldrb r0, [r6]
	bl GetBankMultiplayerId
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r5
	ldrh r1, [r1]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0x1
	beq _0803C866
	ldrb r0, [r6]
	bl GetBankMultiplayerId
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r5
	ldrh r0, [r1]
	ands r4, r0
	cmp r4, 0x3
	bne _0803C8A0
_0803C866:
	ldr r4, _0803C88C @ =gLinkPlayers
	ldr r0, _0803C888 @ =gActiveBattler
	ldrb r0, [r0]
	bl GetBankMultiplayerId
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1, 0x13]
	cmp r0, 0
	beq _0803C894
	ldr r0, _0803C890 @ =gFacilityClassToPicIndex
	adds r0, 0x3D
	b _0803C990
	.align 2, 0
_0803C884: .4byte gBattleTypeFlags
_0803C888: .4byte gActiveBattler
_0803C88C: .4byte gLinkPlayers
_0803C890: .4byte gFacilityClassToPicIndex
_0803C894:
	ldr r0, _0803C89C @ =gFacilityClassToPicIndex
	adds r0, 0x3A
	b _0803C990
	.align 2, 0
_0803C89C: .4byte gFacilityClassToPicIndex
_0803C8A0:
	ldrb r0, [r6]
	bl GetBankMultiplayerId
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r0, [r1, 0x13]
	cmp r0, 0
	beq _0803C98C
	ldr r0, _0803C8BC @ =gFacilityClassToPicIndex
	adds r0, 0x87
	b _0803C990
	.align 2, 0
_0803C8BC: .4byte gFacilityClassToPicIndex
_0803C8C0:
	movs r7, 0xB0
	ldr r0, _0803C8D8 @ =gTrainerBattleOpponent_A
	ldrh r1, [r0]
	movs r0, 0xC0
	lsls r0, 4
	cmp r1, r0
	bne _0803C8DC
	bl sub_80447AC
	lsls r0, 16
	lsrs r0, 16
	b _0803C992
	.align 2, 0
_0803C8D8: .4byte gTrainerBattleOpponent_A
_0803C8DC:
	bl GetMultiplayerId
	ldr r6, _0803C954 @ =gLinkPlayers
	movs r5, 0x1
	eors r0, r5
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r6
	movs r4, 0xFF
	ldrb r0, [r1]
	cmp r0, 0x2
	beq _0803C930
	bl GetMultiplayerId
	eors r0, r5
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r6
	ldrh r1, [r1]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0x1
	beq _0803C930
	bl GetMultiplayerId
	eors r0, r5
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r6
	ldrh r0, [r1]
	ands r4, r0
	cmp r4, 0x3
	bne _0803C968
_0803C930:
	ldr r4, _0803C954 @ =gLinkPlayers
	bl GetMultiplayerId
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1, 0x13]
	cmp r0, 0
	beq _0803C95C
	ldr r0, _0803C958 @ =gFacilityClassToPicIndex
	adds r0, 0x3D
	b _0803C990
	.align 2, 0
_0803C954: .4byte gLinkPlayers
_0803C958: .4byte gFacilityClassToPicIndex
_0803C95C:
	ldr r0, _0803C964 @ =gFacilityClassToPicIndex
	adds r0, 0x3A
	b _0803C990
	.align 2, 0
_0803C964: .4byte gFacilityClassToPicIndex
_0803C968:
	bl GetMultiplayerId
	eors r0, r5
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r1, 0x13]
	cmp r0, 0
	beq _0803C98C
	ldr r0, _0803C988 @ =gFacilityClassToPicIndex
	adds r0, 0x87
	b _0803C990
	.align 2, 0
_0803C988: .4byte gFacilityClassToPicIndex
_0803C98C:
	ldr r0, _0803CAC8 @ =gFacilityClassToPicIndex
	adds r0, 0x86
_0803C990:
	ldrb r0, [r0]
_0803C992:
	mov r9, r0
	ldr r0, _0803CACC @ =gActiveBattler
	mov r8, r0
	ldrb r1, [r0]
	mov r0, r9
	bl DecompressTrainerFrontPic
	mov r1, r8
	ldrb r0, [r1]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r9
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r5, _0803CAD0 @ =gMultiuseSpriteTemplate
	adds r6, r7, 0
	ldr r1, _0803CAD4 @ =gTrainerFrontPicCoords
	mov r2, r9
	lsls r0, r2, 2
	adds r0, r1
	ldrb r0, [r0]
	movs r4, 0x8
	subs r4, r0
	lsls r4, 18
	movs r0, 0xA0
	lsls r0, 14
	adds r4, r0
	asrs r4, 16
	mov r1, r8
	ldrb r0, [r1]
	bl GetBattlerSpriteSubpriority
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r5, _0803CAD8 @ =gBattlerSpriteIds
	mov r2, r8
	ldrb r1, [r2]
	adds r1, r5
	strb r0, [r1]
	ldr r4, _0803CADC @ =gSprites
	ldrb r0, [r2]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _0803CAE0 @ =0x0000ff10
	strh r1, [r0, 0x24]
	ldrb r0, [r2]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	ldr r0, _0803CAE4 @ =gTrainerFrontPicPaletteTable
	mov r1, r9
	lsls r6, r1, 3
	adds r0, r6, r0
	ldrh r0, [r0, 0x4]
	bl IndexOfSpritePaletteTag
	mov r2, r8
	ldrb r1, [r2]
	adds r1, r5
	ldrb r1, [r1]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r4
	lsls r0, 4
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, 0x5]
	mov r1, r8
	ldrb r0, [r1]
	adds r0, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1, 0x4]
	lsls r0, 22
	lsrs r0, 22
	strh r0, [r1, 0x38]
	ldr r0, _0803CAE8 @ =gTrainerFrontPicTable
	adds r6, r0
	ldrh r0, [r6, 0x6]
	bl GetSpriteTileStartByTag
	mov r2, r8
	ldrb r1, [r2]
	adds r1, r5
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldr r2, _0803CAEC @ =0x000003ff
	ands r2, r0
	ldrh r3, [r1, 0x4]
	ldr r0, _0803CAF0 @ =0xfffffc00
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, 0x4]
	mov r1, r8
	ldrb r0, [r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	mov r2, r9
	strh r2, [r0, 0x6]
	mov r1, r8
	ldrb r0, [r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _0803CAF4 @ =sub_8033EEC
	str r1, [r0]
	ldr r1, _0803CAF8 @ =gBattlerControllerFuncs
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803CAFC @ =sub_803A6D4
	str r1, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CAC8: .4byte gFacilityClassToPicIndex
_0803CACC: .4byte gActiveBattler
_0803CAD0: .4byte gMultiuseSpriteTemplate
_0803CAD4: .4byte gTrainerFrontPicCoords
_0803CAD8: .4byte gBattlerSpriteIds
_0803CADC: .4byte gSprites
_0803CAE0: .4byte 0x0000ff10
_0803CAE4: .4byte gTrainerFrontPicPaletteTable
_0803CAE8: .4byte gTrainerFrontPicTable
_0803CAEC: .4byte 0x000003ff
_0803CAF0: .4byte 0xfffffc00
_0803CAF4: .4byte sub_8033EEC
_0803CAF8: .4byte gBattlerControllerFuncs
_0803CAFC: .4byte sub_803A6D4
	thumb_func_end sub_803C7F8

	thumb_func_start sub_803CB00
sub_803CB00: @ 803CB00
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803CB00

	thumb_func_start sub_803CB0C
sub_803CB0C: @ 803CB0C
	push {r4-r6,lr}
	ldr r6, _0803CB9C @ =gBattlerSpriteIds
	ldr r4, _0803CBA0 @ =gActiveBattler
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _0803CBA4 @ =gSprites
	adds r0, r5
	bl SetSpritePrimaryCoordsFromSecondaryCoords
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x23
	strh r1, [r0, 0x2E]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x8C
	lsls r1, 1
	strh r1, [r0, 0x32]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0803CBA8 @ =StartAnimLinearTranslation
	str r1, [r0]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0803CBAC @ =SpriteCallbackDummy
	bl StoreSpriteCallbackInData6
	ldr r1, _0803CBB0 @ =gBattlerControllerFuncs
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803CBB4 @ =sub_803A70C
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803CB9C: .4byte gBattlerSpriteIds
_0803CBA0: .4byte gActiveBattler
_0803CBA4: .4byte gSprites
_0803CBA8: .4byte StartAnimLinearTranslation
_0803CBAC: .4byte SpriteCallbackDummy
_0803CBB0: .4byte gBattlerControllerFuncs
_0803CBB4: .4byte sub_803A70C
	thumb_func_end sub_803CB0C

	thumb_func_start sub_803CBB8
sub_803CBB8: @ 803CBB8
	push {r4-r6,lr}
	ldr r6, _0803CC04 @ =gBattleSpritesDataPtr
	ldr r4, [r6]
	ldr r5, _0803CC08 @ =gActiveBattler
	ldrb r2, [r5]
	ldr r0, [r4, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r3, r1, r0
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	bne _0803CC0C
	ldr r1, [r4]
	lsls r0, r2, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0803CBEC
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl InitAndLaunchSpecialAnimation
_0803CBEC:
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	adds r1, 0x1
	strb r1, [r0, 0x4]
	b _0803CC48
	.align 2, 0
_0803CC04: .4byte gBattleSpritesDataPtr
_0803CC08: .4byte gActiveBattler
_0803CC0C:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0803CC48
	strb r0, [r3, 0x4]
	movs r0, 0x10
	movs r1, 0x3F
	bl PlaySE12WithPanning
	ldr r2, _0803CC50 @ =gSprites
	ldr r1, _0803CC54 @ =gBattlerSpriteIds
	ldrb r0, [r5]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0803CC58 @ =SpriteCB_FaintOpponentMon
	str r1, [r0]
	ldr r1, _0803CC5C @ =gBattlerControllerFuncs
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803CC60 @ =sub_803AD20
	str r1, [r0]
_0803CC48:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803CC50: .4byte gSprites
_0803CC54: .4byte gBattlerSpriteIds
_0803CC58: .4byte SpriteCB_FaintOpponentMon
_0803CC5C: .4byte gBattlerControllerFuncs
_0803CC60: .4byte sub_803AD20
	thumb_func_end sub_803CBB8

	thumb_func_start sub_803CC64
sub_803CC64: @ 803CC64
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803CC64

	thumb_func_start sub_803CC70
sub_803CC70: @ 803CC70
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803CC70

	thumb_func_start sub_803CC7C
sub_803CC7C: @ 803CC7C
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803CC7C

	thumb_func_start sub_803CC88
sub_803CC88: @ 803CC88
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803CC88

	thumb_func_start RecordedOpponentHandleMoveAnimation
RecordedOpponentHandleMoveAnimation: @ 803CC94
	push {r4-r6,lr}
	ldr r6, _0803CD78 @ =gActiveBattler
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	beq _0803CCA6
	b _0803CDBA
_0803CCA6:
	ldr r0, _0803CD7C @ =gBattleBufferA
	mov r12, r0
	ldrb r2, [r6]
	lsls r2, 9
	adds r0, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r1, r12
	adds r1, 0x2
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	ldr r5, _0803CD80 @ =gAnimMoveTurn
	mov r1, r12
	adds r1, 0x3
	adds r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _0803CD84 @ =gAnimMovePower
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x4
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x5
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r4, _0803CD88 @ =gAnimMoveDmg
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x6
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x7
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r3, r1
	mov r1, r12
	adds r1, 0x8
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 16
	orrs r3, r1
	mov r1, r12
	adds r1, 0x9
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 24
	orrs r3, r1
	str r3, [r4]
	ldr r3, _0803CD8C @ =gAnimFriendship
	ldrb r1, [r6]
	lsls r1, 9
	mov r2, r12
	adds r2, 0xA
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _0803CD90 @ =gWeatherMoveAnim
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0xC
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0xD
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r3, _0803CD94 @ =gAnimDisableStructPtr
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x10
	adds r2, r1
	str r2, [r3]
	ldr r3, _0803CD98 @ =gTransformedPersonalities
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r3
	ldr r2, [r2]
	str r2, [r1]
	ldrb r1, [r5]
	bl IsMoveWithoutAnimation
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _0803CD9C
	bl RecordedOpponentBufferExecCompleted
	b _0803CDBA
	.align 2, 0
_0803CD78: .4byte gActiveBattler
_0803CD7C: .4byte gBattleBufferA
_0803CD80: .4byte gAnimMoveTurn
_0803CD84: .4byte gAnimMovePower
_0803CD88: .4byte gAnimMoveDmg
_0803CD8C: .4byte gAnimFriendship
_0803CD90: .4byte gWeatherMoveAnim
_0803CD94: .4byte gAnimDisableStructPtr
_0803CD98: .4byte gTransformedPersonalities
_0803CD9C:
	ldr r0, _0803CDC0 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strb r3, [r0, 0x4]
	ldr r1, _0803CDC4 @ =gBattlerControllerFuncs
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803CDC8 @ =RecordedOpponentDoMoveAnimation
	str r1, [r0]
_0803CDBA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803CDC0: .4byte gBattleSpritesDataPtr
_0803CDC4: .4byte gBattlerControllerFuncs
_0803CDC8: .4byte RecordedOpponentDoMoveAnimation
	thumb_func_end RecordedOpponentHandleMoveAnimation

	thumb_func_start RecordedOpponentDoMoveAnimation
RecordedOpponentDoMoveAnimation: @ 803CDCC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r2, _0803CE18 @ =gBattleBufferA
	ldr r6, _0803CE1C @ =gActiveBattler
	ldrb r3, [r6]
	lsls r1, r3, 9
	adds r0, r2, 0x1
	mov r10, r0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, r2, 0x2
	mov r9, r5
	adds r0, r1, r5
	ldrb r0, [r0]
	lsls r0, 8
	orrs r4, r0
	adds r2, 0xB
	adds r1, r2
	ldrb r1, [r1]
	mov r8, r1
	ldr r7, _0803CE20 @ =gBattleSpritesDataPtr
	ldr r5, [r7]
	ldr r1, [r5, 0x4]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x4]
	cmp r2, 0x1
	beq _0803CE64
	cmp r2, 0x1
	bgt _0803CE24
	cmp r2, 0
	beq _0803CE2E
	b _0803CF40
	.align 2, 0
_0803CE18: .4byte gBattleBufferA
_0803CE1C: .4byte gActiveBattler
_0803CE20: .4byte gBattleSpritesDataPtr
_0803CE24:
	cmp r2, 0x2
	beq _0803CE8E
	cmp r2, 0x3
	beq _0803CF04
	b _0803CF40
_0803CE2E:
	ldr r1, [r5]
	lsls r0, r3, 2
	adds r1, r0, r1
	ldrb r2, [r1]
	movs r0, 0xC
	ands r0, r2
	cmp r0, 0x4
	bne _0803CE50
	movs r0, 0x8
	orrs r0, r2
	strb r0, [r1]
	ldrb r2, [r6]
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl InitAndLaunchSpecialAnimation
_0803CE50:
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0, 0x4]
	b _0803CF40
_0803CE64:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0803CF40
	movs r0, 0
	bl sub_8035450
	adds r0, r4, 0
	bl DoMoveAnim
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2
	strb r1, [r0, 0x4]
	b _0803CF40
_0803CE8E:
	ldr r0, _0803CEF4 @ =gAnimScriptCallback
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _0803CEF8 @ =gAnimScriptActive
	ldrb r0, [r0]
	cmp r0, 0
	bne _0803CF40
	movs r0, 0x1
	bl sub_8035450
	ldr r0, [r7]
	ldrb r2, [r6]
	ldr r1, [r0]
	lsls r0, r2, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0803CEDC
	mov r0, r8
	cmp r0, 0x1
	bhi _0803CEDC
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x6
	bl InitAndLaunchSpecialAnimation
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x9
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
_0803CEDC:
	ldr r0, _0803CEFC @ =gBattleSpritesDataPtr
	ldr r2, [r0]
	ldr r0, _0803CF00 @ =gActiveBattler
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3
	strb r1, [r0, 0x4]
	b _0803CF40
	.align 2, 0
_0803CEF4: .4byte gAnimScriptCallback
_0803CEF8: .4byte gAnimScriptActive
_0803CEFC: .4byte gBattleSpritesDataPtr
_0803CF00: .4byte gActiveBattler
_0803CF04:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0803CF40
	bl CopyAllBattleSpritesInvisibilities
	ldrb r0, [r6]
	lsls r2, r0, 9
	mov r3, r10
	adds r1, r2, r3
	ldrb r1, [r1]
	add r2, r9
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	bl TrySetBehindSubstituteSpriteBit
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strb r4, [r0, 0x4]
	bl RecordedOpponentBufferExecCompleted
_0803CF40:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end RecordedOpponentDoMoveAnimation

	thumb_func_start sub_803CF50
sub_803CF50: @ 803CF50
	push {r4,lr}
	ldr r0, _0803CF84 @ =gBattle_BG0_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0803CF88 @ =gBattle_BG0_Y
	strh r1, [r0]
	ldr r0, _0803CF8C @ =gActiveBattler
	ldrb r4, [r0]
	lsls r4, 9
	ldr r0, _0803CF90 @ =gUnknown_2022BC6
	adds r4, r0
	ldrh r0, [r4]
	bl BufferStringBattle
	ldrh r0, [r4]
	bl sub_80D89B0
	lsls r0, 24
	cmp r0, 0
	beq _0803CF98
	ldr r0, _0803CF94 @ =gDisplayedStringBattle
	movs r1, 0x40
	bl BattlePutTextOnWindow
	b _0803CFA0
	.align 2, 0
_0803CF84: .4byte gBattle_BG0_X
_0803CF88: .4byte gBattle_BG0_Y
_0803CF8C: .4byte gActiveBattler
_0803CF90: .4byte gUnknown_2022BC6
_0803CF94: .4byte gDisplayedStringBattle
_0803CF98:
	ldr r0, _0803CFB4 @ =gDisplayedStringBattle
	movs r1, 0
	bl BattlePutTextOnWindow
_0803CFA0:
	ldr r1, _0803CFB8 @ =gBattlerControllerFuncs
	ldr r0, _0803CFBC @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803CFC0 @ =CompleteOnInactiveTextPrinter_5
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803CFB4: .4byte gDisplayedStringBattle
_0803CFB8: .4byte gBattlerControllerFuncs
_0803CFBC: .4byte gActiveBattler
_0803CFC0: .4byte CompleteOnInactiveTextPrinter_5
	thumb_func_end sub_803CF50

	thumb_func_start sub_803CFC4
sub_803CFC4: @ 803CFC4
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803CFC4

	thumb_func_start sub_803CFD0
sub_803CFD0: @ 803CFD0
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803CFD0

	thumb_func_start sub_803CFDC
sub_803CFDC: @ 803CFDC
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803CFDC

	thumb_func_start sub_803CFE8
sub_803CFE8: @ 803CFE8
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803CFE8

	thumb_func_start sub_803CFF4
sub_803CFF4: @ 803CFF4
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803CFF4

	thumb_func_start sub_803D000
sub_803D000: @ 803D000
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803D000

	thumb_func_start sub_803D00C
sub_803D00C: @ 803D00C
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803D00C

	thumb_func_start sub_803D018
sub_803D018: @ 803D018
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r0, 0
	bl LoadBattleBarGfx
	ldr r3, _0803D090 @ =gBattleBufferA
	ldr r0, _0803D094 @ =gActiveBattler
	mov r9, r0
	ldrb r4, [r0]
	lsls r2, r4, 9
	adds r0, r3, 0x2
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r3, 0x3
	adds r2, r3
	ldrb r0, [r2]
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	asrs r7, r1, 16
	ldr r0, _0803D098 @ =0x00007fff
	cmp r7, r0
	beq _0803D0A8
	ldr r6, _0803D09C @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _0803D0A0 @ =gEnemyParty
	adds r0, r4
	movs r1, 0x3A
	bl GetMonData
	mov r8, r0
	mov r1, r9
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r4
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _0803D0A4 @ =gHealthboxSpriteIds
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl SetBattleBarStruct
	b _0803D0D2
	.align 2, 0
_0803D090: .4byte gBattleBufferA
_0803D094: .4byte gActiveBattler
_0803D098: .4byte 0x00007fff
_0803D09C: .4byte gBattlerPartyIndexes
_0803D0A0: .4byte gEnemyParty
_0803D0A4: .4byte gHealthboxSpriteIds
_0803D0A8:
	ldr r1, _0803D0F0 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0803D0F4 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3A
	bl GetMonData
	adds r2, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _0803D0F8 @ =gHealthboxSpriteIds
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, 0
	bl SetBattleBarStruct
_0803D0D2:
	ldr r1, _0803D0FC @ =gBattlerControllerFuncs
	ldr r0, _0803D100 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803D104 @ =CompleteOnHealthbarDone_4
	str r1, [r0]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D0F0: .4byte gBattlerPartyIndexes
_0803D0F4: .4byte gEnemyParty
_0803D0F8: .4byte gHealthboxSpriteIds
_0803D0FC: .4byte gBattlerControllerFuncs
_0803D100: .4byte gActiveBattler
_0803D104: .4byte CompleteOnHealthbarDone_4
	thumb_func_end sub_803D018

	thumb_func_start sub_803D108
sub_803D108: @ 803D108
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803D108

	thumb_func_start sub_803D114
sub_803D114: @ 803D114
	push {r4,lr}
	ldr r4, _0803D170 @ =gActiveBattler
	ldrb r0, [r4]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _0803D168
	ldr r0, _0803D174 @ =gHealthboxSpriteIds
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _0803D178 @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0803D17C @ =gEnemyParty
	adds r1, r2
	movs r2, 0x9
	bl UpdateHealthboxAttribute
	ldrb r2, [r4]
	ldr r0, _0803D180 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r0, [r0, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r1, _0803D184 @ =gBattlerControllerFuncs
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803D188 @ =CompleteOnFinishedStatusAnimation_5
	str r1, [r0]
_0803D168:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D170: .4byte gActiveBattler
_0803D174: .4byte gHealthboxSpriteIds
_0803D178: .4byte gBattlerPartyIndexes
_0803D17C: .4byte gEnemyParty
_0803D180: .4byte gBattleSpritesDataPtr
_0803D184: .4byte gBattlerControllerFuncs
_0803D188: .4byte CompleteOnFinishedStatusAnimation_5
	thumb_func_end sub_803D114

	thumb_func_start sub_803D18C
sub_803D18C: @ 803D18C
	push {r4,r5,lr}
	ldr r5, _0803D1E4 @ =gActiveBattler
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _0803D1DC
	ldr r4, _0803D1E8 @ =gBattleBufferA
	ldrb r3, [r5]
	lsls r3, 9
	adds r0, r4, 0x1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, 0x2
	adds r1, r3, r1
	ldrb r1, [r1]
	adds r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	adds r2, r4, 0x4
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, 16
	orrs r1, r2
	adds r4, 0x5
	adds r3, r4
	ldrb r2, [r3]
	lsls r2, 24
	orrs r1, r2
	bl InitAndLaunchChosenStatusAnimation
	ldr r1, _0803D1EC @ =gBattlerControllerFuncs
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803D1F0 @ =CompleteOnFinishedStatusAnimation_5
	str r1, [r0]
_0803D1DC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803D1E4: .4byte gActiveBattler
_0803D1E8: .4byte gBattleBufferA
_0803D1EC: .4byte gBattlerControllerFuncs
_0803D1F0: .4byte CompleteOnFinishedStatusAnimation_5
	thumb_func_end sub_803D18C

	thumb_func_start sub_803D1F4
sub_803D1F4: @ 803D1F4
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803D1F4

	thumb_func_start sub_803D200
sub_803D200: @ 803D200
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803D200

	thumb_func_start sub_803D20C
sub_803D20C: @ 803D20C
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803D20C

	thumb_func_start sub_803D218
sub_803D218: @ 803D218
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803D218

	thumb_func_start sub_803D224
sub_803D224: @ 803D224
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803D224

	thumb_func_start sub_803D230
sub_803D230: @ 803D230
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803D230

	thumb_func_start sub_803D23C
sub_803D23C: @ 803D23C
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803D23C

	thumb_func_start sub_803D248
sub_803D248: @ 803D248
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803D248

	thumb_func_start sub_803D254
sub_803D254: @ 803D254
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803D254

	thumb_func_start RecordedOpponentHandleCmd37
RecordedOpponentHandleCmd37: @ 803D260
	push {lr}
	ldr r2, _0803D278 @ =gUnknown_2022870
	ldrb r1, [r2]
	movs r0, 0x80
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0803D278: .4byte gUnknown_2022870
	thumb_func_end RecordedOpponentHandleCmd37

	thumb_func_start RecordedOpponentHandleCmd38
RecordedOpponentHandleCmd38: @ 803D27C
	push {lr}
	ldr r3, _0803D2A8 @ =gUnknown_2022870
	ldr r1, _0803D2AC @ =gBattleBufferA
	ldr r0, _0803D2B0 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x7F
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0803D2A8: .4byte gUnknown_2022870
_0803D2AC: .4byte gBattleBufferA
_0803D2B0: .4byte gActiveBattler
	thumb_func_end RecordedOpponentHandleCmd38

	thumb_func_start RecordedOpponentHandleCmd39
RecordedOpponentHandleCmd39: @ 803D2B4
	push {lr}
	ldr r2, _0803D2C8 @ =gUnknown_2022870
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0803D2C8: .4byte gUnknown_2022870
	thumb_func_end RecordedOpponentHandleCmd39

	thumb_func_start RecordedOpponentHandleCmd40
RecordedOpponentHandleCmd40: @ 803D2CC
	push {lr}
	ldr r3, _0803D2F0 @ =gUnknown_2022870
	ldr r1, [r3]
	lsls r1, 24
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 7
	ldrb r2, [r3]
	movs r0, 0x7F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0803D2F0: .4byte gUnknown_2022870
	thumb_func_end RecordedOpponentHandleCmd40

	thumb_func_start RecordedOpponentHandleHitAnimation
RecordedOpponentHandleHitAnimation: @ 803D2F4
	push {r4,lr}
	ldr r3, _0803D31C @ =gSprites
	ldr r2, _0803D320 @ =gBattlerSpriteIds
	ldr r4, _0803D324 @ =gActiveBattler
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _0803D328
	bl RecordedOpponentBufferExecCompleted
	b _0803D352
	.align 2, 0
_0803D31C: .4byte gSprites
_0803D320: .4byte gBattlerSpriteIds
_0803D324: .4byte gActiveBattler
_0803D328:
	ldr r1, _0803D358 @ =gDoingBattleAnim
	movs r0, 0x1
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x30]
	ldrb r0, [r4]
	bl DoHitAnimHealthboxEffect
	ldr r1, _0803D35C @ =gBattlerControllerFuncs
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803D360 @ =DoHitAnimBlinkSpriteEffect_4
	str r1, [r0]
_0803D352:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D358: .4byte gDoingBattleAnim
_0803D35C: .4byte gBattlerControllerFuncs
_0803D360: .4byte DoHitAnimBlinkSpriteEffect_4
	thumb_func_end RecordedOpponentHandleHitAnimation

	thumb_func_start sub_803D364
sub_803D364: @ 803D364
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803D364

	thumb_func_start RecordedOpponentHandlePlaySE
RecordedOpponentHandlePlaySE: @ 803D370
	push {r4,lr}
	ldr r4, _0803D3AC @ =gActiveBattler
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	movs r3, 0x3F
	cmp r0, 0
	bne _0803D384
	movs r3, 0xC0
_0803D384:
	ldr r2, _0803D3B0 @ =gBattleBufferA
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	lsls r1, r3, 24
	asrs r1, 24
	bl PlaySE12WithPanning
	bl RecordedOpponentBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D3AC: .4byte gActiveBattler
_0803D3B0: .4byte gBattleBufferA
	thumb_func_end RecordedOpponentHandlePlaySE

	thumb_func_start LinkOpponentHandlePlayFanfare
LinkOpponentHandlePlayFanfare: @ 803D3B4
	push {lr}
	ldr r2, _0803D3DC @ =gBattleBufferA
	ldr r0, _0803D3E0 @ =gActiveBattler
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl PlayFanfare
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0803D3DC: .4byte gBattleBufferA
_0803D3E0: .4byte gActiveBattler
	thumb_func_end LinkOpponentHandlePlayFanfare

	thumb_func_start RecordedOpponentHandleFaintingCry
RecordedOpponentHandleFaintingCry: @ 803D3E4
	push {lr}
	ldr r1, _0803D414 @ =gBattlerPartyIndexes
	ldr r0, _0803D418 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0803D41C @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	movs r2, 0x5
	bl PlayCry3
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0803D414: .4byte gBattlerPartyIndexes
_0803D418: .4byte gActiveBattler
_0803D41C: .4byte gEnemyParty
	thumb_func_end RecordedOpponentHandleFaintingCry

	thumb_func_start RecordedOpponentHandleIntroSlide
RecordedOpponentHandleIntroSlide: @ 803D420
	push {lr}
	ldr r1, _0803D448 @ =gBattleBufferA
	ldr r0, _0803D44C @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl HandleIntroSlide
	ldr r2, _0803D450 @ =gIntroSlideFlags
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0803D448: .4byte gBattleBufferA
_0803D44C: .4byte gActiveBattler
_0803D450: .4byte gIntroSlideFlags
	thumb_func_end RecordedOpponentHandleIntroSlide

	thumb_func_start sub_803D454
sub_803D454: @ 803D454
	push {r4-r6,lr}
	ldr r5, _0803D534 @ =gBattlerSpriteIds
	ldr r6, _0803D538 @ =gActiveBattler
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0803D53C @ =gSprites
	adds r0, r4
	bl SetSpritePrimaryCoordsFromSecondaryCoords
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x23
	strh r1, [r0, 0x2E]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x8C
	lsls r1, 1
	strh r1, [r0, 0x32]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0803D540 @ =StartAnimLinearTranslation
	str r1, [r0]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _0803D544 @ =sub_803D648
	bl StoreSpriteCallbackInData6
	ldr r0, _0803D548 @ =sub_803D564
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _0803D54C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	ldrb r0, [r6]
	strh r0, [r1, 0x8]
	ldr r3, _0803D550 @ =gBattleSpritesDataPtr
	ldr r0, [r3]
	ldrb r2, [r6]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0803D516
	ldr r0, _0803D554 @ =gBattlerStatusSummaryTaskId
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldr r1, _0803D558 @ =Task_HidePartyStatusSummary
	str r1, [r0]
_0803D516:
	ldr r0, [r3]
	ldr r2, [r0, 0x8]
	ldrb r0, [r2, 0x9]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _0803D55C @ =gBattlerControllerFuncs
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803D560 @ =nullsub_19
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803D534: .4byte gBattlerSpriteIds
_0803D538: .4byte gActiveBattler
_0803D53C: .4byte gSprites
_0803D540: .4byte StartAnimLinearTranslation
_0803D544: .4byte sub_803D648
_0803D548: .4byte sub_803D564
_0803D54C: .4byte gTasks
_0803D550: .4byte gBattleSpritesDataPtr
_0803D554: .4byte gBattlerStatusSummaryTaskId
_0803D558: .4byte Task_HidePartyStatusSummary
_0803D55C: .4byte gBattlerControllerFuncs
_0803D560: .4byte nullsub_19
	thumb_func_end sub_803D454

	thumb_func_start sub_803D564
sub_803D564: @ 803D564
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r7, _0803D5BC @ =gActiveBattler
	ldrb r0, [r7]
	mov r9, r0
	ldr r1, _0803D5C0 @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x8]
	strb r0, [r7]
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _0803D59E
	ldr r0, _0803D5C4 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0803D5D0
_0803D59E:
	ldr r0, _0803D5C8 @ =gBattleBufferA
	ldrb r1, [r7]
	lsls r2, r1, 9
	adds r0, 0x1
	adds r2, r0
	ldr r0, _0803D5CC @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_803C550
	b _0803D610
	.align 2, 0
_0803D5BC: .4byte gActiveBattler
_0803D5C0: .4byte gTasks
_0803D5C4: .4byte gBattleTypeFlags
_0803D5C8: .4byte gBattleBufferA
_0803D5CC: .4byte gBattlerPartyIndexes
_0803D5D0:
	ldr r4, _0803D634 @ =gBattleBufferA
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r4, 0x1
	adds r1, r4
	ldr r6, _0803D638 @ =gBattlerPartyIndexes
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_803C550
	ldrb r0, [r7]
	movs r5, 0x2
	eors r0, r5
	strb r0, [r7]
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r1, r4
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_803C550
	ldrb r0, [r7]
	eors r0, r5
	strb r0, [r7]
_0803D610:
	ldr r1, _0803D63C @ =gBattlerControllerFuncs
	ldr r2, _0803D640 @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803D644 @ =sub_803A9CC
	str r1, [r0]
	mov r0, r9
	strb r0, [r2]
	mov r0, r8
	bl DestroyTask
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D634: .4byte gBattleBufferA
_0803D638: .4byte gBattlerPartyIndexes
_0803D63C: .4byte gBattlerControllerFuncs
_0803D640: .4byte gActiveBattler
_0803D644: .4byte sub_803A9CC
	thumb_func_end sub_803D564

	thumb_func_start sub_803D648
sub_803D648: @ 803D648
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x6]
	bl FreeTrainerFrontPicPaletteAndTile
	ldrh r0, [r4, 0x38]
	ldr r1, _0803D674 @ =0x000003ff
	ands r1, r0
	ldrh r2, [r4, 0x4]
	ldr r0, _0803D678 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D674: .4byte 0x000003ff
_0803D678: .4byte 0xfffffc00
	thumb_func_end sub_803D648

	thumb_func_start RecordedOpponentHandleDrawPartyStatusSummary
RecordedOpponentHandleDrawPartyStatusSummary: @ 803D67C
	push {r4-r7,lr}
	ldr r1, _0803D6A4 @ =gBattleBufferA
	ldr r0, _0803D6A8 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0803D6AC
	adds r0, r2, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _0803D6AC
	bl RecordedOpponentBufferExecCompleted
	b _0803D776
	.align 2, 0
_0803D6A4: .4byte gBattleBufferA
_0803D6A8: .4byte gActiveBattler
_0803D6AC:
	ldr r4, _0803D704 @ =gBattleSpritesDataPtr
	ldr r0, [r4]
	ldr r3, _0803D708 @ =gActiveBattler
	ldrb r1, [r3]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	ldr r1, _0803D70C @ =gBattleBufferA
	ldrb r2, [r3]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r0, r1
	ldrb r0, [r0]
	adds r7, r3, 0
	cmp r0, 0
	beq _0803D718
	ldr r0, [r4]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r1
	ldrb r2, [r3, 0x1]
	lsls r1, r2, 26
	lsrs r0, r1, 27
	cmp r0, 0x1
	bhi _0803D710
	adds r0, 0x1
	movs r1, 0x1F
	ands r0, r1
	lsls r0, 1
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x1]
	b _0803D776
	.align 2, 0
_0803D704: .4byte gBattleSpritesDataPtr
_0803D708: .4byte gActiveBattler
_0803D70C: .4byte gBattleBufferA
_0803D710:
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	strb r0, [r3, 0x1]
_0803D718:
	adds r5, r7, 0
	ldrb r0, [r5]
	lsls r3, r0, 9
	ldr r4, _0803D77C @ =gUnknown_2022BC8
	adds r1, r3, r4
	subs r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	subs r4, 0x2
	adds r3, r4
	ldrb r3, [r3]
	bl CreatePartyStatusSummarySprites
	ldr r2, _0803D780 @ =gBattlerStatusSummaryTaskId
	ldrb r1, [r5]
	adds r1, r2
	movs r3, 0
	strb r0, [r1]
	ldr r6, _0803D784 @ =gBattleSpritesDataPtr
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strb r3, [r0, 0x5]
	ldrb r2, [r5]
	lsls r0, r2, 9
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0803D76A
	ldr r0, [r6]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0x5D
	strb r1, [r0, 0x5]
_0803D76A:
	ldr r0, _0803D788 @ =gBattlerControllerFuncs
	ldrb r1, [r7]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0803D78C @ =sub_803D790
	str r0, [r1]
_0803D776:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D77C: .4byte gUnknown_2022BC8
_0803D780: .4byte gBattlerStatusSummaryTaskId
_0803D784: .4byte gBattleSpritesDataPtr
_0803D788: .4byte gBattlerControllerFuncs
_0803D78C: .4byte sub_803D790
	thumb_func_end RecordedOpponentHandleDrawPartyStatusSummary

	thumb_func_start sub_803D790
sub_803D790: @ 803D790
	push {r4,lr}
	ldr r4, _0803D7D0 @ =gBattleSpritesDataPtr
	ldr r0, [r4]
	ldr r3, _0803D7D4 @ =gActiveBattler
	ldrb r1, [r3]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x5]
	adds r2, r1, 0x1
	strb r2, [r0, 0x5]
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x5C
	bls _0803D7C8
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strb r1, [r0, 0x5]
	bl RecordedOpponentBufferExecCompleted
_0803D7C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D7D0: .4byte gBattleSpritesDataPtr
_0803D7D4: .4byte gActiveBattler
	thumb_func_end sub_803D790

	thumb_func_start RecordedOpponentHandleCmd49
RecordedOpponentHandleCmd49: @ 803D7D8
	push {lr}
	ldr r0, _0803D814 @ =gBattleSpritesDataPtr
	ldr r1, [r0]
	ldr r0, _0803D818 @ =gActiveBattler
	ldrb r3, [r0]
	ldr r1, [r1, 0x4]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0803D80A
	ldr r2, _0803D81C @ =gTasks
	ldr r0, _0803D820 @ =gBattlerStatusSummaryTaskId
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _0803D824 @ =Task_HidePartyStatusSummary
	str r1, [r0]
_0803D80A:
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0803D814: .4byte gBattleSpritesDataPtr
_0803D818: .4byte gActiveBattler
_0803D81C: .4byte gTasks
_0803D820: .4byte gBattlerStatusSummaryTaskId
_0803D824: .4byte Task_HidePartyStatusSummary
	thumb_func_end RecordedOpponentHandleCmd49

	thumb_func_start sub_803D828
sub_803D828: @ 803D828
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803D828

	thumb_func_start RecordedOpponentHandleSpriteInvisibility
RecordedOpponentHandleSpriteInvisibility: @ 803D834
	push {r4,lr}
	ldr r4, _0803D884 @ =gActiveBattler
	ldrb r0, [r4]
	bl IsBattlerSpritePresent
	lsls r0, 24
	cmp r0, 0
	beq _0803D87A
	ldr r3, _0803D888 @ =gSprites
	ldr r0, _0803D88C @ =gBattlerSpriteIds
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldr r0, _0803D890 @ =gBattleBufferA
	lsls r1, 9
	adds r0, 0x1
	adds r1, r0
	adds r2, 0x3E
	movs r0, 0x1
	ldrb r1, [r1]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	bl CopyBattleSpriteInvisibility
_0803D87A:
	bl RecordedOpponentBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D884: .4byte gActiveBattler
_0803D888: .4byte gSprites
_0803D88C: .4byte gBattlerSpriteIds
_0803D890: .4byte gBattleBufferA
	thumb_func_end RecordedOpponentHandleSpriteInvisibility

	thumb_func_start RecordedOpponentHandleBattleAnimation
RecordedOpponentHandleBattleAnimation: @ 803D894
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _0803D8D8 @ =gActiveBattler
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _0803D8EC
	ldr r5, _0803D8DC @ =gBattleBufferA
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, r5, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r0, r5, 0x2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, 0x3
	adds r1, r5
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	str r4, [sp]
	adds r0, r2, 0
	adds r1, r2, 0
	bl TryHandleLaunchBattleTableAnimation
	lsls r0, 24
	cmp r0, 0
	beq _0803D8E0
	bl RecordedOpponentBufferExecCompleted
	b _0803D8EC
	.align 2, 0
_0803D8D8: .4byte gActiveBattler
_0803D8DC: .4byte gBattleBufferA
_0803D8E0:
	ldr r0, _0803D8F4 @ =gBattlerControllerFuncs
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0803D8F8 @ =CompleteOnFinishedBattleAnimation_5
	str r0, [r1]
_0803D8EC:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803D8F4: .4byte gBattlerControllerFuncs
_0803D8F8: .4byte CompleteOnFinishedBattleAnimation_5
	thumb_func_end RecordedOpponentHandleBattleAnimation

	thumb_func_start sub_803D8FC
sub_803D8FC: @ 803D8FC
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803D8FC

	thumb_func_start sub_803D908
sub_803D908: @ 803D908
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803D908

	thumb_func_start RecordedOpponentHandleCmd55
RecordedOpponentHandleCmd55: @ 803D914
	push {lr}
	ldr r1, _0803D930 @ =gBattleBufferA
	ldr r0, _0803D934 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r2, [r0]
	cmp r2, 0x3
	bne _0803D93C
	ldr r0, _0803D938 @ =gBattleOutcome
	strb r2, [r0]
	b _0803D944
	.align 2, 0
_0803D930: .4byte gBattleBufferA
_0803D934: .4byte gActiveBattler
_0803D938: .4byte gBattleOutcome
_0803D93C:
	ldr r0, _0803D968 @ =gBattleOutcome
	movs r1, 0x3
	eors r1, r2
	strb r1, [r0]
_0803D944:
	movs r0, 0x5
	bl FadeOutMapMusic
	movs r0, 0x3
	bl BeginFastPaletteFade
	bl RecordedOpponentBufferExecCompleted
	ldr r1, _0803D96C @ =gBattlerControllerFuncs
	ldr r0, _0803D970 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803D974 @ =sub_802F6A8
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0803D968: .4byte gBattleOutcome
_0803D96C: .4byte gBattlerControllerFuncs
_0803D970: .4byte gActiveBattler
_0803D974: .4byte sub_802F6A8
	thumb_func_end RecordedOpponentHandleCmd55

	thumb_func_start nullsub_20
nullsub_20: @ 803D978
	bx lr
	thumb_func_end nullsub_20

	.align 2, 0 @ Don't pad with nop.
