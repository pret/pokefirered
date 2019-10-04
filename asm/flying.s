	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80B18A0
sub_80B18A0: @ 80B18A0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0xB
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x4
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r0, 0x30
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080B18DC
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B18DC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B18A0

	thumb_func_start sub_80B18E4
sub_80B18E4: @ 80B18E4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl InitSpritePosToAnimTarget
	ldrh r0, [r4, 0x22]
	adds r0, 0x14
	strh r0, [r4, 0x22]
	movs r0, 0xBF
	strh r0, [r4, 0x30]
	ldr r1, _080B1908 @ =sub_80B190C
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1908: .4byte sub_80B190C
	thumb_func_end sub_80B18E4

	thumb_func_start sub_80B190C
sub_80B190C: @ 80B190C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x20
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x8
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x5
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x47
	bne _080B1946
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B1946:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B190C

	thumb_func_start sub_80B194C
sub_80B194C: @ 80B194C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B197C @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldr r1, _080B1980 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x8]
	ldrh r0, [r1]
	strh r0, [r4, 0xA]
	ldr r0, _080B1984 @ =0x00002719
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xC]
	ldr r0, _080B1988 @ =sub_80B198C
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B197C: .4byte gTasks
_080B1980: .4byte gBattleAnimArgs
_080B1984: .4byte 0x00002719
_080B1988: .4byte sub_80B198C
	thumb_func_end sub_80B194C

	thumb_func_start sub_80B198C
sub_80B198C: @ 80B198C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _080B1A0C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r4, 0xA
	ldrsh r1, [r3, r4]
	adds r7, r2, 0
	cmp r0, r1
	bne _080B19EA
	movs r0, 0
	strh r0, [r3, 0x1C]
	ldrb r0, [r3, 0xC]
	ldr r2, _080B1A10 @ =gPlttBufferFaded
	lsls r0, 4
	movs r3, 0x84
	lsls r3, 1
	adds r1, r0, r3
	lsls r1, 1
	adds r1, r2
	ldrh r6, [r1]
	movs r4, 0x7
	mov r12, r0
	ldr r0, _080B1A14 @ =0x00000107
	add r0, r12
	lsls r0, 1
	adds r3, r0, r2
_080B19D2:
	ldrh r0, [r3]
	strh r0, [r1]
	subs r3, 0x2
	subs r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bgt _080B19D2
	ldr r0, _080B1A18 @ =0x00000101
	add r0, r12
	lsls r0, 1
	adds r0, r2
	strh r6, [r0]
_080B19EA:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r7
	ldrh r1, [r0, 0x8]
	subs r1, 0x1
	strh r1, [r0, 0x8]
	lsls r1, 16
	cmp r1, 0
	bne _080B1A04
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080B1A04:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1A0C: .4byte gTasks
_080B1A10: .4byte gPlttBufferFaded
_080B1A14: .4byte 0x00000107
_080B1A18: .4byte 0x00000101
	thumb_func_end sub_80B198C

	thumb_func_start sub_80B1A1C
sub_80B1A1C: @ 80B1A1C
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl InitSpritePosToAnimAttacker
	ldr r0, _080B1A88 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B1A3C
	ldr r1, _080B1A8C @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080B1A3C:
	ldr r4, _080B1A8C @ =gBattleAnimArgs
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldrh r0, [r6, 0x20]
	strh r0, [r6, 0x30]
	ldr r5, _080B1A90 @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrh r0, [r6, 0x22]
	strh r0, [r6, 0x34]
	ldrb r0, [r5]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x6]
	adds r0, r4
	strh r0, [r6, 0x36]
	adds r0, r6, 0
	bl InitAnimLinearTranslation
	ldr r0, _080B1A94 @ =RunStoredCallbackWhenAffineAnimEnds
	str r0, [r6, 0x1C]
	ldr r1, _080B1A98 @ =sub_80B1A9C
	adds r0, r6, 0
	bl StoreSpriteCallbackInData6
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B1A88: .4byte gBattleAnimAttacker
_080B1A8C: .4byte gBattleAnimArgs
_080B1A90: .4byte gBattleAnimTarget
_080B1A94: .4byte RunStoredCallbackWhenAffineAnimEnds
_080B1A98: .4byte sub_80B1A9C
	thumb_func_end sub_80B1A1C

	thumb_func_start sub_80B1A9C
sub_80B1A9C: @ 80B1A9C
	push {r4,lr}
	adds r4, r0, 0
	bl AnimTranslateLinear
	lsls r0, 24
	cmp r0, 0
	beq _080B1AB0
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B1AB0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B1A9C

	thumb_func_start sub_80B1AB8
sub_80B1AB8: @ 80B1AB8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080B1B54 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B1AE4
	ldr r1, _080B1B58 @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
	ldrh r0, [r1, 0x6]
	negs r0, r0
	strh r0, [r1, 0x6]
_080B1AE4:
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080B1AFC
	ldr r0, _080B1B58 @ =gBattleAnimArgs
	ldrh r1, [r0, 0x2]
	negs r1, r1
	strh r1, [r0, 0x2]
	ldrh r1, [r0, 0x6]
	negs r1, r1
	strh r1, [r0, 0x6]
_080B1AFC:
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	ldr r2, _080B1B58 @ =gBattleAnimArgs
	ldrh r1, [r2]
	ldrh r3, [r5, 0x20]
	adds r1, r3
	strh r1, [r5, 0x20]
	lsrs r0, 24
	ldrh r1, [r2, 0x2]
	adds r0, r1
	strh r0, [r5, 0x22]
	ldrh r0, [r2, 0x8]
	strh r0, [r5, 0x2E]
	movs r3, 0xC
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _080B1B60
	ldr r4, _080B1B5C @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	b _080B1B72
	.align 2, 0
_080B1B54: .4byte gBattleAnimAttacker
_080B1B58: .4byte gBattleAnimArgs
_080B1B5C: .4byte gBattleAnimTarget
_080B1B60:
	ldr r0, _080B1BA0 @ =gBattleAnimTarget
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x32
	adds r3, r5, 0
	adds r3, 0x36
	movs r1, 0x1
	bl SetAverageBattlerPositions
_080B1B72:
	ldr r4, _080B1BA4 @ =gBattleAnimArgs
	ldrh r0, [r4, 0x4]
	ldrh r1, [r5, 0x32]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r4, 0x6]
	ldrh r3, [r5, 0x36]
	adds r0, r3
	strh r0, [r5, 0x36]
	ldr r0, _080B1BA8 @ =StartAnimLinearTranslation
	str r0, [r5, 0x1C]
	ldr r1, _080B1BAC @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	ldrb r1, [r4, 0xA]
	adds r0, r5, 0
	bl SeekSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1BA0: .4byte gBattleAnimTarget
_080B1BA4: .4byte gBattleAnimArgs
_080B1BA8: .4byte StartAnimLinearTranslation
_080B1BAC: .4byte DestroyAnimSprite
	thumb_func_end sub_80B1AB8

	thumb_func_start sub_80B1BB0
sub_80B1BB0: @ 80B1BB0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl InitSpritePosToAnimAttacker
	ldr r1, _080B1BEC @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldr r0, _080B1BF0 @ =sub_80B1BF8
	str r0, [r4, 0x1C]
	movs r0, 0
	bl GetAnimBattlerSpriteId
	ldr r2, _080B1BF4 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1BEC: .4byte gBattleAnimArgs
_080B1BF0: .4byte sub_80B1BF8
_080B1BF4: .4byte gSprites
	thumb_func_end sub_80B1BB0

	thumb_func_start sub_80B1BF8
sub_80B1BF8: @ 80B1BF8
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _080B1C0C
	subs r0, r1, 0x1
	strh r0, [r2, 0x2E]
	b _080B1C1E
_080B1C0C:
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r2, 0x26]
	subs r1, r0
	strh r1, [r2, 0x26]
_080B1C1E:
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _080B1C36
	adds r0, r2, 0
	bl DestroyAnimSprite
_080B1C36:
	pop {r0}
	bx r0
	thumb_func_end sub_80B1BF8

	thumb_func_start sub_80B1C3C
sub_80B1C3C: @ 80B1C3C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080B1C64 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B1C6C
	movs r0, 0x88
	lsls r0, 1
	strh r0, [r5, 0x20]
	ldr r0, _080B1C68 @ =0x0000ffe0
	strh r0, [r5, 0x22]
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	b _080B1C72
	.align 2, 0
_080B1C64: .4byte gBattleAnimAttacker
_080B1C68: .4byte 0x0000ffe0
_080B1C6C:
	ldr r0, _080B1CB0 @ =0x0000ffe0
	strh r0, [r5, 0x20]
	strh r0, [r5, 0x22]
_080B1C72:
	ldr r0, _080B1CB4 @ =gBattleAnimArgs
	ldrh r0, [r0]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldr r4, _080B1CB8 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl InitAnimLinearTranslation
	ldr r0, _080B1CBC @ =sub_80B1CC0
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1CB0: .4byte 0x0000ffe0
_080B1CB4: .4byte gBattleAnimArgs
_080B1CB8: .4byte gBattleAnimTarget
_080B1CBC: .4byte sub_80B1CC0
	thumb_func_end sub_80B1C3C

	thumb_func_start sub_80B1CC0
sub_80B1CC0: @ 80B1CC0
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl AnimTranslateLinear
	ldrh r1, [r4, 0x34]
	lsrs r0, r1, 8
	cmp r0, 0xC8
	bls _080B1CE8
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	movs r0, 0
	strh r0, [r4, 0x24]
	movs r0, 0xFF
	ands r0, r1
	strh r0, [r4, 0x34]
_080B1CE8:
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	adds r0, r1
	adds r0, 0x20
	movs r1, 0x98
	lsls r1, 1
	cmp r0, r1
	bhi _080B1D0A
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	cmp r0, 0xA0
	ble _080B1D30
_080B1D0A:
	movs r0, 0
	bl GetAnimBattlerSpriteId
	ldr r2, _080B1D38 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B1D30:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1D38: .4byte gSprites
	thumb_func_end sub_80B1CC0

	thumb_func_start sub_80B1D3C
sub_80B1D3C: @ 80B1D3C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	subs r1, r0, 0x1
	strh r1, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bgt _080B1D7C
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B1D6E
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
_080B1D6E:
	adds r0, r4, 0
	bl DestroySprite
	ldr r1, _080B1D84 @ =gAnimVisualTaskCount
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_080B1D7C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1D84: .4byte gAnimVisualTaskCount
	thumb_func_end sub_80B1D3C

	thumb_func_start sub_80B1D88
sub_80B1D88: @ 80B1D88
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r5, r7, 0
	adds r5, 0x2E
	ldr r0, _080B1DA8 @ =gBattleAnimArgs
	ldrh r1, [r0, 0xE]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080B1DB0
	ldr r0, _080B1DAC @ =gBattleAnimAttacker
	b _080B1DB2
	.align 2, 0
_080B1DA8: .4byte gBattleAnimArgs
_080B1DAC: .4byte gBattleAnimAttacker
_080B1DB0:
	ldr r0, _080B1E5C @ =gBattleAnimTarget
_080B1DB2:
	ldrb r6, [r0]
	adds r0, r6, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B1DC8
	ldr r1, _080B1E60 @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080B1DC8:
	adds r0, r6, 0
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	ldr r4, _080B1E60 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r7, 0x20]
	adds r0, r6, 0
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	ldrh r1, [r4, 0x2]
	lsrs r0, 24
	adds r1, r0, r1
	strh r1, [r7, 0x22]
	lsls r1, 8
	strh r1, [r5, 0x8]
	ldrh r1, [r4, 0xC]
	adds r0, r1
	lsls r0, 1
	ldrh r2, [r5, 0xE]
	movs r1, 0x1
	ands r1, r2
	orrs r1, r0
	strh r1, [r5, 0xE]
	ldrb r0, [r5]
	movs r2, 0x4
	mov r8, r2
	mov r1, r8
	orrs r0, r1
	strb r0, [r5]
	ldrh r0, [r4, 0x4]
	ldrb r1, [r4, 0x4]
	strh r1, [r5, 0x2]
	lsls r0, 16
	lsrs r0, 24
	strh r0, [r5, 0xA]
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x4]
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x6]
	ldrh r0, [r4, 0xA]
	strh r0, [r5, 0xC]
	subs r1, 0x40
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0x7F
	bhi _080B1EBE
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080B1E64
	adds r0, r6, 0
	bl GetBattlerSpriteBGPriority
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r7, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, 0x5]
	b _080B1E7C
	.align 2, 0
_080B1E5C: .4byte gBattleAnimTarget
_080B1E60: .4byte gBattleAnimArgs
_080B1E64:
	adds r0, r6, 0
	bl GetBattlerSpriteBGPriority
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, 0x5]
_080B1E7C:
	ldrb r1, [r5, 0xE]
	movs r4, 0x2
	negs r4, r4
	adds r0, r4, 0
	ands r0, r1
	strb r0, [r5, 0xE]
	movs r2, 0x4
	ldrsh r0, [r5, r2]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	bne _080B1F1E
	adds r3, r7, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r0, r2, 31
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	adds r0, r4, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r7, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	b _080B1F16
_080B1EBE:
	adds r0, r6, 0
	bl GetBattlerSpriteBGPriority
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, 0x5]
	ldrb r0, [r5, 0xE]
	movs r4, 0x1
	orrs r0, r4
	strb r0, [r5, 0xE]
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080B1F1E
	adds r3, r7, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	ands r1, r4
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r7, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	mov r2, r8
	orrs r0, r2
_080B1F16:
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
_080B1F1E:
	ldrh r1, [r5, 0x2]
	lsrs r1, 6
	lsls r1, 4
	ldrb r2, [r5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	ldr r3, _080B1F88 @ =gSineTable
	ldrh r0, [r5, 0x2]
	lsls r0, 1
	adds r0, r3
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldrb r0, [r5, 0xC]
	muls r0, r1
	asrs r0, 8
	strh r0, [r7, 0x24]
	ldrb r2, [r7, 0x3]
	lsls r2, 26
	lsrs r2, 27
	movs r1, 0x24
	ldrsh r0, [r7, r1]
	negs r0, r0
	asrs r0, 1
	ldrb r5, [r5, 0xA]
	adds r0, r5
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r3
	ldrh r4, [r1]
	ldr r1, _080B1F8C @ =gOamMatrices
	lsls r2, 3
	adds r2, r1
	adds r0, 0x40
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r2, 0x6]
	strh r0, [r2]
	strh r4, [r2, 0x2]
	lsls r0, r4, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r2, 0x4]
	ldr r0, _080B1F90 @ =sub_80B1F94
	str r0, [r7, 0x1C]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1F88: .4byte gSineTable
_080B1F8C: .4byte gOamMatrices
_080B1F90: .4byte sub_80B1F94
	thumb_func_end sub_80B1D88

	thumb_func_start sub_80B1F94
sub_80B1F94: @ 80B1F94
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	movs r6, 0
	adds r4, r5, 0
	adds r4, 0x2E
	ldrb r2, [r4]
	movs r7, 0x1
	movs r0, 0x1
	mov r9, r0
	ands r0, r2
	cmp r0, 0
	beq _080B1FCE
	ldrb r0, [r4, 0x1]
	adds r1, r0, 0
	adds r1, 0xFF
	strb r1, [r4, 0x1]
	lsls r0, 24
	cmp r0, 0
	beq _080B1FC2
	b _080B24AA
_080B1FC2:
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r4]
	strb r6, [r4, 0x1]
	b _080B24AA
_080B1FCE:
	ldrh r0, [r4, 0x2]
	lsrs r1, r0, 6
	mov r12, r0
	cmp r1, 0x1
	bne _080B1FDA
	b _080B20FE
_080B1FDA:
	cmp r1, 0x1
	bgt _080B1FE4
	cmp r1, 0
	beq _080B1FF2
	b _080B23F0
_080B1FE4:
	cmp r1, 0x2
	bne _080B1FEA
	b _080B21F2
_080B1FEA:
	cmp r1, 0x3
	bne _080B1FF0
	b _080B22E6
_080B1FF0:
	b _080B23F0
_080B1FF2:
	lsls r1, r2, 24
	lsrs r0, r1, 28
	cmp r0, 0x1
	bne _080B2006
	movs r0, 0x8
	orrs r0, r2
	orrs r0, r7
	strb r0, [r4]
	strb r6, [r4, 0x1]
	b _080B20F4
_080B2006:
	lsrs r0, r1, 28
	cmp r0, 0x3
	bne _080B2028
	lsls r0, r2, 30
	lsrs r0, 31
	movs r1, 0x1
	eors r0, r1
	ands r0, r7
	lsls r0, 1
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	orrs r1, r7
	strb r1, [r4]
	strb r6, [r4, 0x1]
	b _080B20F4
_080B2028:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _080B20F4
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r6, 0x1
	eors r1, r6
	ands r1, r7
	movs r0, 0x2
	negs r0, r0
	mov r8, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r5, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	ldrb r1, [r4]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080B20E6
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080B20B6
	ldrb r1, [r4, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080B209C
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080B20D4
_080B209C:
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080B20D4
_080B20B6:
	ldrb r1, [r4, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080B20CA
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0xC
	b _080B20D2
_080B20CA:
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0xC
_080B20D2:
	strb r0, [r1]
_080B20D4:
	ldrb r2, [r4, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r6
	ands r0, r7
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0xE]
_080B20E6:
	ldrb r1, [r4]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrh r1, [r4, 0x2]
	mov r12, r1
_080B20F4:
	ldrb r1, [r4]
	movs r0, 0xF
	ands r0, r1
	strb r0, [r4]
	b _080B23F0
_080B20FE:
	lsls r1, r2, 24
	lsrs r0, r1, 28
	cmp r0, 0
	bne _080B210C
	movs r0, 0x8
	orrs r0, r2
	b _080B2114
_080B210C:
	lsrs r0, r1, 28
	cmp r0, 0x2
	bne _080B211C
	adds r0, r2, 0
_080B2114:
	orrs r0, r7
	strb r0, [r4]
	strb r6, [r4, 0x1]
	b _080B21E8
_080B211C:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _080B21E8
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r6, 0x1
	eors r1, r6
	ands r1, r7
	movs r0, 0x2
	negs r0, r0
	mov r8, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r5, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	ldrb r1, [r4]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080B21DA
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080B21AA
	ldrb r1, [r4, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080B2190
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080B21C8
_080B2190:
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080B21C8
_080B21AA:
	ldrb r1, [r4, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080B21BE
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0xC
	b _080B21C6
_080B21BE:
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0xC
_080B21C6:
	strb r0, [r1]
_080B21C8:
	ldrb r2, [r4, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r6
	ands r0, r7
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0xE]
_080B21DA:
	ldrb r1, [r4]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrh r1, [r4, 0x2]
	mov r12, r1
_080B21E8:
	ldrb r0, [r4]
	movs r1, 0xF
	ands r1, r0
	movs r0, 0x10
	b _080B23EC
_080B21F2:
	lsls r1, r2, 24
	lsrs r0, r1, 28
	cmp r0, 0x3
	bne _080B2200
	movs r0, 0x8
	orrs r0, r2
	b _080B2208
_080B2200:
	lsrs r0, r1, 28
	cmp r0, 0x1
	bne _080B2210
	adds r0, r2, 0
_080B2208:
	orrs r0, r7
	strb r0, [r4]
	strb r6, [r4, 0x1]
	b _080B22DC
_080B2210:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _080B22DC
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r6, 0x1
	eors r1, r6
	ands r1, r7
	movs r0, 0x2
	negs r0, r0
	mov r8, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r5, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	ldrb r1, [r4]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080B22CE
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080B229E
	ldrb r1, [r4, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080B2284
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080B22BC
_080B2284:
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080B22BC
_080B229E:
	ldrb r1, [r4, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080B22B2
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0xC
	b _080B22BA
_080B22B2:
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0xC
_080B22BA:
	strb r0, [r1]
_080B22BC:
	ldrb r2, [r4, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r6
	ands r0, r7
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0xE]
_080B22CE:
	ldrb r1, [r4]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrh r1, [r4, 0x2]
	mov r12, r1
_080B22DC:
	ldrb r0, [r4]
	movs r1, 0xF
	ands r1, r0
	movs r0, 0x20
	b _080B23EC
_080B22E6:
	lsls r1, r2, 24
	lsrs r0, r1, 28
	cmp r0, 0x2
	bne _080B22F6
	movs r0, 0x8
	orrs r0, r2
	strb r0, [r4]
	b _080B23E4
_080B22F6:
	lsrs r0, r1, 28
	cmp r0, 0
	bne _080B2318
	lsls r0, r2, 30
	lsrs r0, 31
	movs r1, 0x1
	eors r0, r1
	ands r0, r7
	lsls r0, 1
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	orrs r1, r7
	strb r1, [r4]
	strb r6, [r4, 0x1]
	b _080B23E4
_080B2318:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _080B23E4
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r6, 0x1
	eors r1, r6
	ands r1, r7
	movs r0, 0x2
	negs r0, r0
	mov r8, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r5, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	ldrb r1, [r4]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080B23D6
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080B23A6
	ldrb r1, [r4, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080B238C
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080B23C4
_080B238C:
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080B23C4
_080B23A6:
	ldrb r1, [r4, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080B23BA
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0xC
	b _080B23C2
_080B23BA:
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0xC
_080B23C2:
	strb r0, [r1]
_080B23C4:
	ldrb r2, [r4, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r6
	ands r0, r7
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0xE]
_080B23D6:
	ldrb r1, [r4]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrh r1, [r4, 0x2]
	mov r12, r1
_080B23E4:
	ldrb r0, [r4]
	movs r1, 0xF
	ands r1, r0
	movs r0, 0x30
_080B23EC:
	orrs r1, r0
	strb r1, [r4]
_080B23F0:
	ldrb r1, [r4]
	lsls r1, 30
	lsrs r1, 31
	adds r0, r4, 0
	adds r0, 0xC
	adds r0, r1
	ldrb r1, [r0]
	ldr r3, _080B2478 @ =gSineTable
	mov r2, r12
	lsls r0, r2, 1
	adds r0, r3
	movs r2, 0
	ldrsh r0, [r0, r2]
	muls r0, r1
	asrs r0, 8
	strh r0, [r5, 0x24]
	ldrb r2, [r5, 0x3]
	lsls r2, 26
	lsrs r2, 27
	movs r1, 0x24
	ldrsh r0, [r5, r1]
	negs r0, r0
	asrs r0, 1
	ldrb r1, [r4, 0xA]
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r3
	ldrh r6, [r1]
	ldr r1, _080B247C @ =gOamMatrices
	lsls r2, 3
	adds r2, r1
	adds r0, 0x40
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r2, 0x6]
	strh r0, [r2]
	strh r6, [r2, 0x2]
	lsls r0, r6, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r2, 0x4]
	ldrh r0, [r4, 0x6]
	ldrh r2, [r4, 0x8]
	adds r0, r2
	strh r0, [r4, 0x8]
	lsls r0, 16
	lsrs r0, 24
	strh r0, [r5, 0x22]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080B2480
	ldrh r0, [r4, 0x4]
	subs r1, 0x1
	ands r1, r0
	ldrh r0, [r4, 0x2]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2]
	b _080B2490
	.align 2, 0
_080B2478: .4byte gSineTable
_080B247C: .4byte gOamMatrices
_080B2480:
	ldrh r0, [r4, 0x4]
	ldr r1, _080B24B8 @ =0x00007fff
	ands r1, r0
	ldrh r2, [r4, 0x2]
	adds r1, r2
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r4, 0x2]
_080B2490:
	movs r0, 0x22
	ldrsh r1, [r5, r0]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	adds r1, r0
	ldrh r0, [r4, 0xE]
	lsrs r0, 1
	cmp r1, r0
	blt _080B24AA
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldr r0, _080B24BC @ =sub_80B1D3C
	str r0, [r5, 0x1C]
_080B24AA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B24B8: .4byte 0x00007fff
_080B24BC: .4byte sub_80B1D3C
	thumb_func_end sub_80B1F94

	thumb_func_start sub_80B24C0
sub_80B24C0: @ 80B24C0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _080B2508 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriority
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	ldr r5, _080B250C @ =gBattleAnimAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r0, _080B2510 @ =TranslateAnimSpriteToTargetMonLocation
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B2508: .4byte gBattleAnimTarget
_080B250C: .4byte gBattleAnimAttacker
_080B2510: .4byte TranslateAnimSpriteToTargetMonLocation
	thumb_func_end sub_80B24C0

	thumb_func_start sub_80B2514
sub_80B2514: @ 80B2514
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r5, _080B2554 @ =gBattleAnimArgs
	ldrh r0, [r5]
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x34]
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080B25C4
	ldr r0, _080B2558 @ =gBattlerPositions
	ldr r1, _080B255C @ =gBattleAnimTarget
	ldrb r2, [r1]
	adds r0, r2, r0
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B2560
	adds r0, r2, 0
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x6]
	adds r0, r5
	b _080B256E
	.align 2, 0
_080B2554: .4byte gBattleAnimArgs
_080B2558: .4byte gBattlerPositions
_080B255C: .4byte gBattleAnimTarget
_080B2560:
	adds r0, r2, 0
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x28
_080B256E:
	strh r0, [r4, 0x3C]
	ldr r0, _080B259C @ =gBattleAnimArgs
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080B25A4
	ldr r0, _080B25A0 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriority
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
	b _080B25D8
	.align 2, 0
_080B259C: .4byte gBattleAnimArgs
_080B25A0: .4byte gBattleAnimTarget
_080B25A4:
	ldr r0, _080B25C0 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriority
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	b _080B25D8
	.align 2, 0
_080B25C0: .4byte gBattleAnimTarget
_080B25C4:
	ldr r0, _080B267C @ =gBattleAnimTarget
	ldrb r0, [r0]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x6]
	adds r0, r5
	strh r0, [r4, 0x3C]
_080B25D8:
	ldr r5, _080B2680 @ =gSineTable
	ldrh r3, [r4, 0x30]
	movs r1, 0xFF
	ands r1, r3
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	movs r2, 0
	strh r0, [r4, 0x36]
	adds r1, 0x40
	lsls r1, 1
	adds r1, r5
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r4, 0x38]
	strh r2, [r4, 0x3A]
	strh r2, [r4, 0x26]
	strh r2, [r4, 0x24]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r6, r0, 27
	lsls r3, 16
	lsrs r3, 24
	strh r3, [r4, 0x30]
	bl Random
	lsls r0, 16
	asrs r7, r0, 16
	movs r0, 0x80
	lsls r0, 8
	ands r0, r7
	cmp r0, 0
	beq _080B2622
	ldrh r1, [r4, 0x30]
	movs r0, 0xFF
	subs r0, r1
	strh r0, [r4, 0x30]
_080B2622:
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	ldr r3, _080B2684 @ =gOamMatrices
	lsls r2, r6, 3
	adds r2, r3
	adds r1, 0x40
	lsls r1, 1
	adds r1, r5
	ldrh r1, [r1]
	strh r1, [r2, 0x6]
	strh r1, [r2]
	strh r0, [r2, 0x2]
	lsls r0, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r2, 0x4]
	adds r3, r4, 0
	adds r3, 0x3F
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	movs r0, 0x1
	ands r0, r7
	cmp r0, 0
	beq _080B2672
	adds r2, r4, 0
	adds r2, 0x2A
	movs r1, 0x1
	movs r0, 0x1
	strb r0, [r2]
	ldrb r0, [r3]
	orrs r0, r1
	strb r0, [r3]
_080B2672:
	ldr r0, _080B2688 @ =sub_80B268C
	str r0, [r4, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B267C: .4byte gBattleAnimTarget
_080B2680: .4byte gSineTable
_080B2684: .4byte gOamMatrices
_080B2688: .4byte sub_80B268C
	thumb_func_end sub_80B2514

	thumb_func_start sub_80B268C
sub_80B268C: @ 80B268C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r4, r0, 0
	adds r5, r4, 0
	adds r5, 0x2E
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	movs r1, 0
	mov r8, r1
	movs r7, 0
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080B2770
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	muls r0, r1
	asrs r6, r0, 8
	strh r6, [r4, 0x24]
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	muls r0, r1
	asrs r3, r0, 8
	strh r3, [r4, 0x26]
	ldrh r2, [r4, 0x34]
	movs r1, 0xFF
	adds r0, r1, 0
	ands r0, r2
	ldrh r2, [r4, 0x3A]
	adds r0, r2
	strh r0, [r4, 0x3A]
	ldrh r2, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	ands r1, r2
	cmp r0, r1
	blt _080B2770
	ldrh r0, [r4, 0x20]
	adds r0, r6
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x22]
	adds r0, r3
	strh r0, [r4, 0x22]
	strh r7, [r4, 0x24]
	strh r7, [r4, 0x26]
	mov r0, sp
	adds r1, r5, 0
	movs r2, 0x10
	bl memcpy
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x10
	bl memset
	ldrh r0, [r4, 0x22]
	lsls r0, 8
	strh r0, [r5, 0x8]
	mov r0, sp
	ldrh r0, [r0, 0x6]
	lsrs r1, r0, 8
	strh r1, [r5, 0x6]
	strh r7, [r5, 0x2]
	mov r0, sp
	ldrh r0, [r0, 0x2]
	strh r0, [r5, 0xA]
	adds r0, r4, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B2740
	movs r0, 0x8
	ands r1, r0
	cmp r1, 0
	beq _080B2738
	ldr r0, _080B2734 @ =0x00008001
	b _080B274E
	.align 2, 0
_080B2734: .4byte 0x00008001
_080B2738:
	ldr r0, _080B273C @ =0x00008002
	b _080B274E
	.align 2, 0
_080B273C: .4byte 0x00008002
_080B2740:
	movs r0, 0x8
	ands r1, r0
	cmp r1, 0
	beq _080B274C
	movs r0, 0x1
	b _080B274E
_080B274C:
	movs r0, 0x2
_080B274E:
	strh r0, [r5, 0x4]
	mov r0, sp
	ldrh r0, [r0, 0x4]
	lsrs r0, 8
	strb r0, [r5, 0xC]
	subs r0, 0x2
	strb r0, [r5, 0xD]
	mov r0, sp
	ldrh r1, [r0, 0xE]
	lsls r1, 1
	ldrh r2, [r5, 0xE]
	movs r0, 0x1
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0xE]
	ldr r0, _080B277C @ =sub_80B1F94
	str r0, [r4, 0x1C]
_080B2770:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B277C: .4byte sub_80B1F94
	thumb_func_end sub_80B268C

	thumb_func_start sub_80B2780
sub_80B2780: @ 80B2780
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080B2798 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B279C
	adds r0, r5, 0
	movs r1, 0
	bl InitSpritePosToAnimAttacker
	b _080B27A4
	.align 2, 0
_080B2798: .4byte gBattleAnimArgs
_080B279C:
	adds r0, r5, 0
	movs r1, 0
	bl InitSpritePosToAnimTarget
_080B27A4:
	ldr r4, _080B280C @ =gBattleAnimArgs
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080B27BC
	ldr r0, _080B2810 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B27D2
_080B27BC:
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080B27D8
	ldr r0, _080B2814 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B27D8
_080B27D2:
	ldrh r0, [r5, 0x20]
	adds r0, 0x8
	strh r0, [r5, 0x20]
_080B27D8:
	ldr r4, _080B280C @ =gBattleAnimArgs
	ldrb r1, [r4, 0x8]
	adds r0, r5, 0
	bl SeekSpriteAnim
	ldrh r0, [r5, 0x20]
	subs r0, 0x20
	strh r0, [r5, 0x20]
	ldr r0, _080B2818 @ =0x00000ccc
	strh r0, [r5, 0x30]
	ldrh r1, [r4, 0x8]
	movs r0, 0xC
	adds r2, r0, 0
	muls r2, r1
	adds r0, r2, 0
	ldrh r2, [r5, 0x24]
	adds r0, r2
	strh r0, [r5, 0x24]
	strh r1, [r5, 0x2E]
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x3C]
	ldr r0, _080B281C @ =sub_80B2820
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B280C: .4byte gBattleAnimArgs
_080B2810: .4byte gBattleAnimAttacker
_080B2814: .4byte gBattleAnimTarget
_080B2818: .4byte 0x00000ccc
_080B281C: .4byte sub_80B2820
	thumb_func_end sub_80B2780

	thumb_func_start sub_80B2820
sub_80B2820: @ 80B2820
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x24]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _080B284A
	strh r1, [r4, 0x2E]
	strh r1, [r4, 0x24]
	adds r0, r4, 0
	bl StartSpriteAnim
_080B284A:
	ldrh r0, [r4, 0x3C]
	subs r0, 0x1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080B2862
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B2862:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B2820

	thumb_func_start sub_80B2868
sub_80B2868: @ 80B2868
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r1, _080B2900 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r7, r0, r1
	ldrh r0, [r7, 0x8]
	movs r1, 0x1F
	ands r0, r1
	cmp r0, 0
	bne _080B28E2
	ldr r1, _080B2904 @ =gAnimVisualTaskCount
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	movs r5, 0xD
	negs r5, r5
	adds r1, r5, 0
	bl Sin
	ldr r4, _080B2908 @ =gBattleAnimArgs
	strh r0, [r4]
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	adds r1, r5, 0
	bl Cos
	strh r0, [r4, 0x2]
	movs r0, 0x1
	strh r0, [r4, 0x4]
	movs r0, 0x3
	strh r0, [r4, 0x6]
	ldr r0, _080B290C @ =gUnknown_83E7C98
	mov r8, r0
	ldr r5, _080B2910 @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r5]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	mov r0, r8
	adds r1, r4, 0
	movs r3, 0x3
	bl CreateSpriteAndAnimate
_080B28E2:
	ldrh r0, [r7, 0x8]
	adds r0, 0x8
	strh r0, [r7, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080B28F6
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080B28F6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2900: .4byte gTasks
_080B2904: .4byte gAnimVisualTaskCount
_080B2908: .4byte gBattleAnimArgs
_080B290C: .4byte gUnknown_83E7C98
_080B2910: .4byte gBattleAnimTarget
	thumb_func_end sub_80B2868

	thumb_func_start sub_80B2914
sub_80B2914: @ 80B2914
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080B2926
	cmp r0, 0x1
	beq _080B2958
	b _080B296C
_080B2926:
	adds r0, r4, 0
	movs r1, 0x1
	bl InitSpritePosToAnimAttacker
	movs r0, 0
	bl GetAnimBattlerSpriteId
	ldr r2, _080B2954 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080B296C
	.align 2, 0
_080B2954: .4byte gSprites
_080B2958:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080B296C
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B296C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B2914

	thumb_func_start sub_80B2974
sub_80B2974: @ 80B2974
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080B29AC
	cmp r0, 0x1
	bgt _080B298A
	cmp r0, 0
	beq _080B2990
	b _080B29FE
_080B298A:
	cmp r0, 0x2
	beq _080B29C0
	b _080B29FE
_080B2990:
	ldr r0, _080B29A8 @ =gBattleAnimTarget
	ldrb r0, [r0]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	negs r0, r0
	subs r0, 0x20
	strh r0, [r4, 0x26]
	b _080B29B8
	.align 2, 0
_080B29A8: .4byte gBattleAnimTarget
_080B29AC:
	ldrh r0, [r4, 0x26]
	adds r0, 0xA
	strh r0, [r4, 0x26]
	lsls r0, 16
	cmp r0, 0
	blt _080B29FE
_080B29B8:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080B29FE
_080B29C0:
	ldrh r0, [r4, 0x26]
	subs r0, 0xA
	strh r0, [r4, 0x26]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _080B29FE
	movs r0, 0
	bl GetAnimBattlerSpriteId
	ldr r2, _080B2A04 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B29FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2A04: .4byte gSprites
	thumb_func_end sub_80B2974

	thumb_func_start sub_80B2A08
sub_80B2A08: @ 80B2A08
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl InitSpritePosToAnimAttacker
	ldr r1, _080B2A44 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldr r0, _080B2A48 @ =sub_80B2A50
	str r0, [r4, 0x1C]
	movs r0, 0
	bl GetAnimBattlerSpriteId
	ldr r2, _080B2A4C @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2A44: .4byte gBattleAnimArgs
_080B2A48: .4byte sub_80B2A50
_080B2A4C: .4byte gSprites
	thumb_func_end sub_80B2A08

	thumb_func_start sub_80B2A50
sub_80B2A50: @ 80B2A50
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _080B2A64
	subs r0, r1, 0x1
	strh r0, [r2, 0x2E]
	b _080B2AA8
_080B2A64:
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	ble _080B2A8A
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r2, 0x26]
	subs r1, r0
	strh r1, [r2, 0x26]
	b _080B2AA8
_080B2A8A:
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x34]
	adds r1, r0, 0x1
	strh r1, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080B2AA8
	ldr r0, _080B2AAC @ =sub_80B2AB0
	str r0, [r2, 0x1C]
_080B2AA8:
	pop {r0}
	bx r0
	.align 2, 0
_080B2AAC: .4byte sub_80B2AB0
	thumb_func_end sub_80B2A50

	thumb_func_start sub_80B2AB0
sub_80B2AB0: @ 80B2AB0
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r2, 0x26]
	adds r0, r1
	strh r0, [r2, 0x26]
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	ble _080B2AE0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
_080B2AE0:
	movs r1, 0x26
	ldrsh r0, [r2, r1]
	cmp r0, 0
	ble _080B2AEE
	adds r0, r2, 0
	bl DestroyAnimSprite
_080B2AEE:
	pop {r0}
	bx r0
	thumb_func_end sub_80B2AB0

	thumb_func_start sub_80B2AF4
sub_80B2AF4: @ 80B2AF4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080B2B08
	cmp r0, 0x1
	beq _080B2B60
	b _080B2BCC
_080B2B08:
	ldr r0, _080B2B18 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _080B2B20
	ldr r4, _080B2B1C @ =gBattleAnimAttacker
	b _080B2B22
	.align 2, 0
_080B2B18: .4byte gBattleAnimArgs
_080B2B1C: .4byte gBattleAnimAttacker
_080B2B20:
	ldr r4, _080B2B5C @ =gBattleAnimTarget
_080B2B22:
	ldrb r0, [r4]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	movs r0, 0
	movs r3, 0x80
	lsls r3, 2
	strh r3, [r5, 0x30]
	movs r2, 0x80
	lsls r2, 1
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0
	bl TrySetSpriteRotScale
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080B2BCC
	.align 2, 0
_080B2B5C: .4byte gBattleAnimTarget
_080B2B60:
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	cmp r0, 0xB
	bgt _080B2B6E
	ldrh r0, [r5, 0x30]
	subs r0, 0x28
	b _080B2B72
_080B2B6E:
	ldrh r0, [r5, 0x30]
	adds r0, 0x28
_080B2B72:
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r5, 0x32]
	movs r2, 0x80
	lsls r2, 1
	movs r0, 0x30
	ldrsh r3, [r5, r0]
	str r1, [sp]
	adds r0, r5, 0
	bl TrySetSpriteRotScale
	ldrb r1, [r5, 0x3]
	lsls r1, 26
	lsrs r1, 27
	movs r0, 0xF4
	lsls r0, 6
	ldr r2, _080B2BD4 @ =gOamMatrices
	lsls r1, 3
	adds r1, r2
	movs r2, 0x6
	ldrsh r1, [r1, r2]
	bl __divsi3
	adds r1, r0, 0x1
	cmp r1, 0x80
	ble _080B2BAC
	movs r1, 0x80
_080B2BAC:
	movs r0, 0x40
	subs r0, r1
	lsrs r1, r0, 31
	adds r0, r1
	asrs r1, r0, 1
	strh r1, [r5, 0x26]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	cmp r0, 0x18
	bne _080B2BCC
	adds r0, r5, 0
	bl sub_8075AD8
	adds r0, r5, 0
	bl DestroyAnimSprite
_080B2BCC:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B2BD4: .4byte gOamMatrices
	thumb_func_end sub_80B2AF4

	thumb_func_start sub_80B2BD8
sub_80B2BD8: @ 80B2BD8
	push {r4,r5,lr}
	adds r5, r0, 0
	bl Random
	ldr r4, _080B2BFC @ =0x000001ff
	ands r4, r0
	bl Random
	movs r1, 0x7F
	ands r1, r0
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080B2C00
	movs r2, 0xB8
	lsls r2, 2
	adds r0, r4, r2
	b _080B2C08
	.align 2, 0
_080B2BFC: .4byte 0x000001ff
_080B2C00:
	movs r2, 0xB8
	lsls r2, 2
	adds r0, r2, 0
	subs r0, r4
_080B2C08:
	strh r0, [r5, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B2C1C
	movs r2, 0xE0
	lsls r2, 2
	adds r0, r2, 0
	adds r0, r1, r0
	b _080B2C24
_080B2C1C:
	movs r2, 0xE0
	lsls r2, 2
	adds r0, r2, 0
	subs r0, r1
_080B2C24:
	strh r0, [r5, 0x30]
	ldr r2, _080B2C4C @ =gBattleAnimArgs
	ldrh r0, [r2]
	strh r0, [r5, 0x32]
	lsls r0, 16
	cmp r0, 0
	beq _080B2C40
	ldrb r0, [r5, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	orrs r1, r0
	strb r1, [r5, 0x3]
_080B2C40:
	movs r1, 0x2
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080B2C54
	ldr r4, _080B2C50 @ =gBattleAnimAttacker
	b _080B2C56
	.align 2, 0
_080B2C4C: .4byte gBattleAnimArgs
_080B2C50: .4byte gBattleAnimAttacker
_080B2C54:
	ldr r4, _080B2C80 @ =gBattleAnimTarget
_080B2C56:
	ldrb r0, [r4]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x20
	strh r0, [r5, 0x22]
	ldr r0, _080B2C84 @ =sub_80B2C88
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B2C80: .4byte gBattleAnimTarget
_080B2C84: .4byte sub_80B2C88
	thumb_func_end sub_80B2BD8

	thumb_func_start sub_80B2C88
sub_80B2C88: @ 80B2C88
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B2CA0
	ldrh r3, [r4, 0x2E]
	lsls r0, r3, 16
	asrs r0, 24
	ldrh r1, [r4, 0x24]
	adds r0, r1
	b _080B2CAA
_080B2CA0:
	ldrh r3, [r4, 0x2E]
	lsls r1, r3, 16
	asrs r1, 24
	ldrh r0, [r4, 0x24]
	subs r0, r1
_080B2CAA:
	strh r0, [r4, 0x24]
	ldrh r2, [r4, 0x30]
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r4, 0x26]
	subs r0, r1
	strh r0, [r4, 0x26]
	strh r3, [r4, 0x2E]
	adds r0, r2, 0
	subs r0, 0x20
	strh r0, [r4, 0x30]
	lsls r0, r3, 16
	cmp r0, 0
	bge _080B2CCA
	movs r0, 0
	strh r0, [r4, 0x2E]
_080B2CCA:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _080B2CDE
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B2CDE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B2C88

	thumb_func_start sub_80B2CE4
sub_80B2CE4: @ 80B2CE4
	movs r1, 0
	strh r1, [r0, 0x3A]
	movs r1, 0x40
	strh r1, [r0, 0x3C]
	ldr r1, _080B2CF4 @ =sub_80B2CF8
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080B2CF4: .4byte sub_80B2CF8
	thumb_func_end sub_80B2CE4

	thumb_func_start sub_80B2CF8
sub_80B2CF8: @ 80B2CF8
	push {lr}
	adds r3, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	cmp r1, 0
	beq _080B2D0A
	cmp r1, 0x1
	beq _080B2D58
	b _080B2D5E
_080B2D0A:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080B2D5E
	strh r1, [r3, 0x30]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	ldrb r2, [r1]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080B2D5E
	ldrb r1, [r1]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080B2D5E
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	b _080B2D5E
_080B2D58:
	adds r0, r3, 0
	bl DestroyAnimSprite
_080B2D5E:
	pop {r0}
	bx r0
	thumb_func_end sub_80B2CF8

	thumb_func_start sub_80B2D64
sub_80B2D64: @ 80B2D64
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r8, r0
	ldrh r4, [r0, 0x20]
	ldrh r5, [r0, 0x22]
	ldr r6, _080B2E18 @ =gBattleAnimAttacker
	ldrb r0, [r6]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	strh r0, [r1, 0x20]
	ldrb r0, [r6]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	mov r2, r8
	strh r6, [r2, 0x22]
	ldrh r0, [r2, 0x20]
	mov r9, r0
	mov r1, r9
	lsls r0, r1, 4
	strh r0, [r2, 0x36]
	lsls r0, r6, 4
	strh r0, [r2, 0x38]
	lsls r4, 16
	asrs r4, 16
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	subs r0, r4, r0
	lsls r0, 4
	movs r1, 0xC
	bl __divsi3
	mov r2, r8
	strh r0, [r2, 0x3A]
	lsls r5, 16
	asrs r5, 16
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	subs r0, r5, r0
	lsls r0, 4
	movs r1, 0xC
	bl __divsi3
	mov r2, r8
	strh r0, [r2, 0x3C]
	mov r0, r9
	subs r4, r0
	lsls r4, 16
	asrs r4, 16
	subs r5, r6
	lsls r5, 16
	asrs r5, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl ArcTan2Neg
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 24
	adds r0, r1
	lsrs r0, 16
	movs r3, 0x80
	lsls r3, 1
	str r0, [sp]
	mov r0, r8
	movs r1, 0x1
	adds r2, r3, 0
	bl TrySetSpriteRotScale
	ldr r0, _080B2E1C @ =sub_80B2E20
	mov r2, r8
	str r0, [r2, 0x1C]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B2E18: .4byte gBattleAnimAttacker
_080B2E1C: .4byte sub_80B2E20
	thumb_func_end sub_80B2D64

	thumb_func_start sub_80B2E20
sub_80B2E20: @ 80B2E20
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x3A]
	ldrh r1, [r2, 0x36]
	adds r0, r1
	strh r0, [r2, 0x36]
	ldrh r1, [r2, 0x3C]
	ldrh r3, [r2, 0x38]
	adds r1, r3
	strh r1, [r2, 0x38]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r3, r1, 20
	strh r3, [r2, 0x22]
	adds r0, 0x2D
	lsls r0, 16
	movs r1, 0xA5
	lsls r1, 17
	cmp r0, r1
	bhi _080B2E5A
	adds r1, r3, 0
	cmp r1, 0x9D
	bgt _080B2E5A
	movs r0, 0x2D
	negs r0, r0
	cmp r1, r0
	bge _080B2E60
_080B2E5A:
	adds r0, r2, 0
	bl DestroySpriteAndMatrix
_080B2E60:
	pop {r0}
	bx r0
	thumb_func_end sub_80B2E20

	thumb_func_start sub_80B2E64
sub_80B2E64: @ 80B2E64
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080B2E94 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B2E9C
	movs r0, 0
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B2E98 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	b _080B2EBA
	.align 2, 0
_080B2E94: .4byte gBattleAnimArgs
_080B2E98: .4byte gSprites
_080B2E9C:
	movs r0, 0
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B2EC8 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
_080B2EBA:
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2EC8: .4byte gSprites
	thumb_func_end sub_80B2E64

	.align 2, 0 @ Don't pad with nop.
