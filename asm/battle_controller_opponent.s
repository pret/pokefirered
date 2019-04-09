	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start nullsub_17
nullsub_17: @ 8035A78
	bx lr
	thumb_func_end nullsub_17

	thumb_func_start sub_8035A7C
sub_8035A7C: @ 8035A7C
	ldr r1, _08035A8C @ =gUnknown_3004FE0
	ldr r0, _08035A90 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08035A94 @ =sub_8035A98
	str r1, [r0]
	bx lr
	.align 2, 0
_08035A8C: .4byte gUnknown_3004FE0
_08035A90: .4byte gActiveBattler
_08035A94: .4byte sub_8035A98
	thumb_func_end sub_8035A7C

	thumb_func_start sub_8035A98
sub_8035A98: @ 8035A98
	push {lr}
	ldr r2, _08035ACC @ =gUnknown_2023BC8
	ldr r1, _08035AD0 @ =gBitTable
	ldr r0, _08035AD4 @ =gActiveBattler
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08035AE4
	ldr r0, _08035AD8 @ =gUnknown_2022BC4
	lsls r1, r3, 9
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x38
	bhi _08035AE0
	ldr r0, _08035ADC @ =gUnknown_8250A34
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _08035AE4
	.align 2, 0
_08035ACC: .4byte gUnknown_2023BC8
_08035AD0: .4byte gBitTable
_08035AD4: .4byte gActiveBattler
_08035AD8: .4byte gUnknown_2022BC4
_08035ADC: .4byte gUnknown_8250A34
_08035AE0:
	bl OpponentBufferExecCompleted
_08035AE4:
	pop {r0}
	bx r0
	thumb_func_end sub_8035A98

	thumb_func_start sub_8035AE8
sub_8035AE8: @ 8035AE8
	push {lr}
	ldr r2, _08035B10 @ =gSprites
	ldr r1, _08035B14 @ =gUnknown_2023D44
	ldr r0, _08035B18 @ =gActiveBattler
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08035B1C @ =SpriteCallbackDummy
	cmp r1, r0
	bne _08035B0C
	bl OpponentBufferExecCompleted
_08035B0C:
	pop {r0}
	bx r0
	.align 2, 0
_08035B10: .4byte gSprites
_08035B14: .4byte gUnknown_2023D44
_08035B18: .4byte gActiveBattler
_08035B1C: .4byte SpriteCallbackDummy
	thumb_func_end sub_8035AE8

	thumb_func_start sub_8035B20
sub_8035B20: @ 8035B20
	push {lr}
	ldr r2, _08035B48 @ =gSprites
	ldr r1, _08035B4C @ =gUnknown_2023D44
	ldr r0, _08035B50 @ =gActiveBattler
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08035B54 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _08035B44
	bl OpponentBufferExecCompleted
_08035B44:
	pop {r0}
	bx r0
	.align 2, 0
_08035B48: .4byte gSprites
_08035B4C: .4byte gUnknown_2023D44
_08035B50: .4byte gActiveBattler
_08035B54: .4byte SpriteCallbackDummy
	thumb_func_end sub_8035B20

	thumb_func_start sub_8035B58
sub_8035B58: @ 8035B58
	push {r4-r6,lr}
	ldr r4, _08035BD0 @ =gSprites
	ldr r6, _08035BD4 @ =gUnknown_2023D44
	ldr r5, _08035BD8 @ =gActiveBattler
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
	ldr r0, _08035BDC @ =SpriteCallbackDummy
	cmp r1, r0
	bne _08035BC8
	adds r0, r2, r4
	ldrh r0, [r0, 0x6]
	bl sub_803477C
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1, 0x38]
	ldr r2, _08035BE0 @ =0x000003ff
	ands r2, r0
	ldrh r3, [r1, 0x4]
	ldr r0, _08035BE4 @ =0xfffffc00
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
	bl OpponentBufferExecCompleted
_08035BC8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035BD0: .4byte gSprites
_08035BD4: .4byte gUnknown_2023D44
_08035BD8: .4byte gActiveBattler
_08035BDC: .4byte SpriteCallbackDummy
_08035BE0: .4byte 0x000003ff
_08035BE4: .4byte 0xfffffc00
	thumb_func_end sub_8035B58

	thumb_func_start sub_8035BE8
sub_8035BE8: @ 8035BE8
	push {r4,lr}
	ldr r4, _08035C28 @ =gUnknown_2024018
	ldr r1, [r4]
	ldr r3, _08035C2C @ =gActiveBattler
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
	bne _08035C20
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strb r1, [r0, 0x9]
	bl OpponentBufferExecCompleted
_08035C20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035C28: .4byte gUnknown_2024018
_08035C2C: .4byte gActiveBattler
	thumb_func_end sub_8035BE8

	thumb_func_start sub_8035C30
sub_8035C30: @ 8035C30
	push {r4-r7,lr}
	movs r6, 0
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _08035C54
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _08035C88
	ldr r0, _08035C74 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08035C88
_08035C54:
	ldr r2, _08035C78 @ =gSprites
	ldr r1, _08035C7C @ =gUnknown_3004FF0
	ldr r0, _08035C80 @ =gActiveBattler
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08035C84 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _08035CBE
	b _08035CBC
	.align 2, 0
_08035C74: .4byte gBattleTypeFlags
_08035C78: .4byte gSprites
_08035C7C: .4byte gUnknown_3004FF0
_08035C80: .4byte gActiveBattler
_08035C84: .4byte SpriteCallbackDummy
_08035C88:
	ldr r2, _08035D84 @ =gSprites
	ldr r5, _08035D88 @ =gUnknown_3004FF0
	ldr r0, _08035D8C @ =gActiveBattler
	ldrb r3, [r0]
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r4, [r0]
	ldr r0, _08035D90 @ =SpriteCallbackDummy
	cmp r4, r0
	bne _08035CBE
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
	bne _08035CBE
_08035CBC:
	movs r6, 0x1
_08035CBE:
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	beq _08035CCA
	movs r6, 0
_08035CCA:
	cmp r6, 0
	bne _08035CD0
	b _08035DD2
_08035CD0:
	ldr r0, _08035D94 @ =gUnknown_2024018
	mov r12, r0
	ldr r0, [r0]
	ldr r7, _08035D8C @ =gActiveBattler
	ldrb r2, [r7]
	ldr r3, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r4, r0, r3
	ldrb r1, [r4, 0x1]
	movs r5, 0x1
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _08035DD2
	movs r6, 0x2
	adds r1, r6, 0
	eors r1, r2
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x1]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _08035DD2
	ldrb r1, [r4]
	movs r3, 0x7F
	adds r0, r3, 0
	ands r0, r1
	strb r0, [r4]
	mov r1, r12
	ldr r0, [r1]
	ldrb r2, [r7]
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
	mov r0, r12
	ldr r2, [r0]
	ldrb r0, [r7]
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
	mov r1, r12
	ldr r2, [r1]
	ldrb r0, [r7]
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
	ldr r4, _08035D98 @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	ldr r0, _08035D9C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08035DA4
	ldr r0, _08035DA0 @ =gMPlayInfo_BGM
	bl m4aMPlayContinue
	b _08035DB0
	.align 2, 0
_08035D84: .4byte gSprites
_08035D88: .4byte gUnknown_3004FF0
_08035D8C: .4byte gActiveBattler
_08035D90: .4byte SpriteCallbackDummy
_08035D94: .4byte gUnknown_2024018
_08035D98: .4byte 0x000027f9
_08035D9C: .4byte gBattleTypeFlags
_08035DA0: .4byte gMPlayInfo_BGM
_08035DA4:
	ldr r0, _08035DD8 @ =gMPlayInfo_BGM
	ldr r1, _08035DDC @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
_08035DB0:
	ldr r0, _08035DE0 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r3, _08035DE4 @ =gActiveBattler
	ldrb r1, [r3]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3
	strb r1, [r0, 0x9]
	ldr r1, _08035DE8 @ =gUnknown_3004FE0
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08035DEC @ =sub_8035BE8
	str r1, [r0]
_08035DD2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035DD8: .4byte gMPlayInfo_BGM
_08035DDC: .4byte 0x0000ffff
_08035DE0: .4byte gUnknown_2024018
_08035DE4: .4byte gActiveBattler
_08035DE8: .4byte gUnknown_3004FE0
_08035DEC: .4byte sub_8035BE8
	thumb_func_end sub_8035C30

	thumb_func_start sub_8035DF0
sub_8035DF0: @ 8035DF0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r4, _08035FC0 @ =gUnknown_2024018
	ldr r0, [r4]
	ldr r1, _08035FC4 @ =gActiveBattler
	mov r9, r1
	ldrb r2, [r1]
	ldr r1, [r0, 0x4]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r5, 0x88
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _08035E2C
	ldr r0, _08035FC8 @ =gBattlerPartyIndexes
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08035FCC @ =gEnemyParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_80F1720
_08035E2C:
	ldr r1, [r4]
	mov r2, r9
	ldrb r0, [r2]
	movs r7, 0x2
	adds r2, r7, 0
	eors r2, r0
	ldr r1, [r1, 0x4]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _08035E60
	ldr r0, _08035FC8 @ =gBattlerPartyIndexes
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08035FCC @ =gEnemyParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_80F1720
_08035E60:
	ldr r0, [r4]
	mov r1, r9
	ldrb r2, [r1]
	ldr r3, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0]
	movs r4, 0x8
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08035E7E
	b _08035FB4
_08035E7E:
	adds r1, r7, 0
	eors r1, r2
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08035E96
	b _08035FB4
_08035E96:
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _08035F28
	ldr r0, _08035FD0 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08035F28
	ldr r1, _08035FD4 @ =gUnknown_3004FFC
	mov r2, r9
	ldrb r0, [r2]
	eors r0, r7
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08035FD8 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r4, _08035FDC @ =gUnknown_3004FF0
	mov r1, r9
	ldrb r0, [r1]
	adds r1, r7, 0
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _08035FC8 @ =gBattlerPartyIndexes
	mov r8, r2
	lsls r1, 1
	add r1, r8
	ldrh r1, [r1]
	movs r6, 0x64
	muls r1, r6
	ldr r5, _08035FCC @ =gEnemyParty
	adds r1, r5
	movs r2, 0
	bl UpdateHealthboxAttribute
	mov r1, r9
	ldrb r0, [r1]
	eors r0, r7
	bl sub_804BD94
	mov r2, r9
	ldrb r0, [r2]
	eors r0, r7
	adds r0, r4
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	mov r1, r9
	ldrb r0, [r1]
	adds r4, r7, 0
	eors r4, r0
	lsls r0, r4, 1
	add r0, r8
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl SetBankEnemyShadowSpriteCallback
_08035F28:
	ldr r1, _08035FD4 @ =gUnknown_3004FFC
	ldr r5, _08035FC4 @ =gActiveBattler
	ldrb r0, [r5]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08035FD8 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r4, _08035FDC @ =gUnknown_3004FF0
	ldrb r1, [r5]
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _08035FC8 @ =gBattlerPartyIndexes
	mov r9, r2
	lsls r1, 1
	add r1, r9
	ldrh r1, [r1]
	movs r2, 0x64
	mov r8, r2
	mov r2, r8
	muls r2, r1
	adds r1, r2, 0
	ldr r6, _08035FCC @ =gEnemyParty
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
	bl SetBankEnemyShadowSpriteCallback
	ldr r0, _08035FC0 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r2, [r0, 0x8]
	ldrb r1, [r2, 0x9]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _08035FE0 @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08035FE4 @ =sub_8035C30
	str r1, [r0]
_08035FB4:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035FC0: .4byte gUnknown_2024018
_08035FC4: .4byte gActiveBattler
_08035FC8: .4byte gBattlerPartyIndexes
_08035FCC: .4byte gEnemyParty
_08035FD0: .4byte gBattleTypeFlags
_08035FD4: .4byte gUnknown_3004FFC
_08035FD8: .4byte gSprites
_08035FDC: .4byte gUnknown_3004FF0
_08035FE0: .4byte gUnknown_3004FE0
_08035FE4: .4byte sub_8035C30
	thumb_func_end sub_8035DF0

	thumb_func_start sub_8035FE8
sub_8035FE8: @ 8035FE8
	push {r4-r7,lr}
	ldr r2, _08036044 @ =gSprites
	ldr r0, _08036048 @ =gUnknown_2023D44
	ldr r7, _0803604C @ =gActiveBattler
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
	bne _08036094
	movs r4, 0x24
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bne _08036094
	ldr r6, _08036050 @ =gUnknown_2024018
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
	bne _0803605C
	ldr r0, _08036054 @ =gBattlerPartyIndexes
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08036058 @ =gEnemyParty
	adds r1, r0
	adds r0, r3, 0
	bl sub_80F1720
	b _08036094
	.align 2, 0
_08036044: .4byte gSprites
_08036048: .4byte gUnknown_2023D44
_0803604C: .4byte gActiveBattler
_08036050: .4byte gUnknown_2024018
_08036054: .4byte gBattlerPartyIndexes
_08036058: .4byte gEnemyParty
_0803605C:
	ldrb r0, [r1, 0x1]
	ands r2, r0
	cmp r2, 0
	beq _08036094
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
	ldr r4, _0803609C @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	bl OpponentBufferExecCompleted
_08036094:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803609C: .4byte 0x000027f9
	thumb_func_end sub_8035FE8

	thumb_func_start sub_80360A0
sub_80360A0: @ 80360A0
	push {r4-r6,lr}
	ldr r6, _080360E0 @ =gActiveBattler
	ldrb r0, [r6]
	ldr r5, _080360E4 @ =gUnknown_3004FF0
	adds r1, r0, r5
	ldrb r1, [r1]
	movs r2, 0
	movs r3, 0
	bl sub_8049FD8
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
	beq _080360E8
	ldrb r0, [r6]
	adds r0, r5
	ldrb r0, [r0]
	movs r2, 0
	bl sub_8048440
	b _08036124
	.align 2, 0
_080360E0: .4byte gActiveBattler
_080360E4: .4byte gUnknown_3004FF0
_080360E8:
	movs r0, 0x1
	bl sub_80EB2E0
	lsls r0, 24
	cmp r0, 0
	bne _08036120
	ldr r0, _08036114 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08036120
	movs r0, 0x1
	bl sub_80EB2F4
	ldr r0, _08036118 @ =gUnknown_3004FE0
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0803611C @ =sub_80E8570
	str r0, [r1]
	b _08036124
	.align 2, 0
_08036114: .4byte gBattleTypeFlags
_08036118: .4byte gUnknown_3004FE0
_0803611C: .4byte sub_80E8570
_08036120:
	bl OpponentBufferExecCompleted
_08036124:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80360A0

	thumb_func_start sub_803612C
sub_803612C: @ 803612C
	push {lr}
	ldr r2, _08036160 @ =gSprites
	ldr r0, _08036164 @ =gUnknown_2023D44
	ldr r1, _08036168 @ =gActiveBattler
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
	bne _0803615A
	ldr r0, _0803616C @ =gUnknown_3004FF0
	adds r0, r3, r0
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl OpponentBufferExecCompleted
_0803615A:
	pop {r0}
	bx r0
	.align 2, 0
_08036160: .4byte gSprites
_08036164: .4byte gUnknown_2023D44
_08036168: .4byte gActiveBattler
_0803616C: .4byte gUnknown_3004FF0
	thumb_func_end sub_803612C

	thumb_func_start sub_8036170
sub_8036170: @ 8036170
	push {r4-r6,lr}
	ldr r0, _080361D0 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r6, _080361D4 @ =gActiveBattler
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
	bne _080361CA
	ldr r5, _080361D8 @ =gUnknown_2023D44
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080361DC @ =gSprites
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
	bl EnemyShadowCallbackToSetInvisible
	ldr r1, _080361E0 @ =gUnknown_3004FF0
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl OpponentBufferExecCompleted
_080361CA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080361D0: .4byte gUnknown_2024018
_080361D4: .4byte gActiveBattler
_080361D8: .4byte gUnknown_2023D44
_080361DC: .4byte gSprites
_080361E0: .4byte gUnknown_3004FF0
	thumb_func_end sub_8036170

	thumb_func_start sub_80361E4
sub_80361E4: @ 80361E4
	push {lr}
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _080361F6
	bl OpponentBufferExecCompleted
_080361F6:
	pop {r0}
	bx r0
	thumb_func_end sub_80361E4

	thumb_func_start sub_80361FC
sub_80361FC: @ 80361FC
	push {r4,lr}
	ldr r1, _08036238 @ =gUnknown_2023D44
	ldr r0, _0803623C @ =gActiveBattler
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	ldr r2, _08036240 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x20
	bne _08036248
	movs r3, 0
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08036244 @ =gUnknown_2024005
	strb r3, [r0]
	bl OpponentBufferExecCompleted
	b _08036272
	.align 2, 0
_08036238: .4byte gUnknown_2023D44
_0803623C: .4byte gActiveBattler
_08036240: .4byte gSprites
_08036244: .4byte gUnknown_2024005
_08036248:
	ldrh r0, [r4, 0x30]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _0803626C
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
_0803626C:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
_08036272:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80361FC

	thumb_func_start sub_8036278
sub_8036278: @ 8036278
	push {r4,lr}
	ldr r2, _080362CC @ =gSprites
	ldr r0, _080362D0 @ =gUnknown_3004FF0
	ldr r4, _080362D4 @ =gActiveBattler
	ldrb r3, [r4]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _080362D8 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _080362C4
	ldr r0, _080362DC @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080362B8
	adds r0, r3, 0
	adds r1, r3, 0
	adds r2, r3, 0
	movs r3, 0x6
	bl InitAndLaunchSpecialAnimation
_080362B8:
	ldr r0, _080362E0 @ =gUnknown_3004FE0
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _080362E4 @ =sub_80362E8
	str r0, [r1]
_080362C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080362CC: .4byte gSprites
_080362D0: .4byte gUnknown_3004FF0
_080362D4: .4byte gActiveBattler
_080362D8: .4byte SpriteCallbackDummy
_080362DC: .4byte gUnknown_2024018
_080362E0: .4byte gUnknown_3004FE0
_080362E4: .4byte sub_80362E8
	thumb_func_end sub_8036278

	thumb_func_start sub_80362E8
sub_80362E8: @ 80362E8
	push {lr}
	ldr r0, _08036324 @ =gUnknown_2024018
	ldr r2, [r0]
	ldr r0, _08036328 @ =gActiveBattler
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
	bne _08036320
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	bne _08036320
	ldr r0, _0803632C @ =gMPlayInfo_BGM
	ldr r1, _08036330 @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
	bl OpponentBufferExecCompleted
_08036320:
	pop {r0}
	bx r0
	.align 2, 0
_08036324: .4byte gUnknown_2024018
_08036328: .4byte gActiveBattler
_0803632C: .4byte gMPlayInfo_BGM
_08036330: .4byte 0x0000ffff
	thumb_func_end sub_80362E8

	thumb_func_start sub_8036334
sub_8036334: @ 8036334
	push {r4,r5,lr}
	ldr r3, _080363E0 @ =gUnknown_2024018
	ldr r0, [r3]
	ldr r5, _080363E4 @ =gActiveBattler
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
	beq _080363D8
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
	ldr r4, _080363E8 @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	ldr r1, _080363EC @ =gUnknown_2023D44
	ldrb r0, [r5]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080363F0 @ =gSprites
	adds r0, r1
	movs r1, 0
	bl StartSpriteAnim
	ldr r4, _080363F4 @ =gUnknown_3004FF0
	ldrb r1, [r5]
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _080363F8 @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _080363FC @ =gEnemyParty
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
	ldr r1, _08036400 @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08036404 @ =sub_8036278
	str r1, [r0]
_080363D8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080363E0: .4byte gUnknown_2024018
_080363E4: .4byte gActiveBattler
_080363E8: .4byte 0x000027f9
_080363EC: .4byte gUnknown_2023D44
_080363F0: .4byte gSprites
_080363F4: .4byte gUnknown_3004FF0
_080363F8: .4byte gBattlerPartyIndexes
_080363FC: .4byte gEnemyParty
_08036400: .4byte gUnknown_3004FE0
_08036404: .4byte sub_8036278
	thumb_func_end sub_8036334

	thumb_func_start sub_8036408
sub_8036408: @ 8036408
	push {r4-r6,lr}
	ldr r6, _080364AC @ =gUnknown_2024018
	ldr r0, [r6]
	ldr r5, _080364B0 @ =gActiveBattler
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
	bne _0803643A
	ldr r0, _080364B4 @ =gBattlerPartyIndexes
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080364B8 @ =gEnemyParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_80F1720
_0803643A:
	ldr r4, _080364BC @ =gSprites
	ldr r0, _080364C0 @ =gUnknown_3004FFC
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
	ldr r0, _080364C4 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _080364A4
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
	bne _080364A4
	adds r0, r3, r4
	bl DestroySprite
	ldrb r4, [r5]
	ldr r1, _080364B4 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080364B8 @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl SetBankEnemyShadowSpriteCallback
	ldr r1, _080364C8 @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080364CC @ =sub_8036334
	str r1, [r0]
_080364A4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080364AC: .4byte gUnknown_2024018
_080364B0: .4byte gActiveBattler
_080364B4: .4byte gBattlerPartyIndexes
_080364B8: .4byte gEnemyParty
_080364BC: .4byte gSprites
_080364C0: .4byte gUnknown_3004FFC
_080364C4: .4byte SpriteCallbackDummy
_080364C8: .4byte gUnknown_3004FE0
_080364CC: .4byte sub_8036334
	thumb_func_end sub_8036408

	thumb_func_start sub_80364D0
sub_80364D0: @ 80364D0
	push {lr}
	ldr r0, _080364F8 @ =gUnknown_2024018
	ldr r2, [r0]
	ldr r0, _080364FC @ =gActiveBattler
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
	bne _080364F2
	bl OpponentBufferExecCompleted
_080364F2:
	pop {r0}
	bx r0
	.align 2, 0
_080364F8: .4byte gUnknown_2024018
_080364FC: .4byte gActiveBattler
	thumb_func_end sub_80364D0

	thumb_func_start sub_8036500
sub_8036500: @ 8036500
	push {lr}
	ldr r0, _08036528 @ =gUnknown_2024018
	ldr r2, [r0]
	ldr r0, _0803652C @ =gActiveBattler
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
	bne _08036522
	bl OpponentBufferExecCompleted
_08036522:
	pop {r0}
	bx r0
	.align 2, 0
_08036528: .4byte gUnknown_2024018
_0803652C: .4byte gActiveBattler
	thumb_func_end sub_8036500

	thumb_func_start OpponentBufferExecCompleted
OpponentBufferExecCompleted: @ 8036530
	ldr r1, _08036554 @ =gUnknown_3004FE0
	ldr r2, _08036558 @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803655C @ =sub_8035A98
	str r1, [r0]
	ldr r3, _08036560 @ =gUnknown_2023BC8
	ldr r1, _08036564 @ =gBitTable
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r3]
	bics r0, r1
	str r0, [r3]
	bx lr
	.align 2, 0
_08036554: .4byte gUnknown_3004FE0
_08036558: .4byte gActiveBattler
_0803655C: .4byte sub_8035A98
_08036560: .4byte gUnknown_2023BC8
_08036564: .4byte gBitTable
	thumb_func_end OpponentBufferExecCompleted

	thumb_func_start OpponentHandleGetAttributes
OpponentHandleGetAttributes: @ 8036568
	push {r4-r6,lr}
	sub sp, 0x100
	movs r6, 0
	ldr r1, _08036594 @ =gUnknown_2022BC4
	ldr r0, _08036598 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _080365A0
	ldr r0, _0803659C @ =gBattlerPartyIndexes
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl sub_80365DC
	adds r6, r0, 0
	b _080365C2
	.align 2, 0
_08036594: .4byte gUnknown_2022BC4
_08036598: .4byte gActiveBattler
_0803659C: .4byte gBattlerPartyIndexes
_080365A0:
	ldrb r4, [r1]
	movs r5, 0
_080365A4:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080365BA
	lsls r0, r5, 24
	lsrs r0, 24
	mov r2, sp
	adds r1, r2, r6
	bl sub_80365DC
	adds r6, r0
_080365BA:
	lsrs r4, 1
	adds r5, 0x1
	cmp r5, 0x5
	ble _080365A4
_080365C2:
	lsls r1, r6, 16
	lsrs r1, 16
	movs r0, 0x1
	mov r2, sp
	bl EmitDataTransfer
	bl OpponentBufferExecCompleted
	add sp, 0x100
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end OpponentHandleGetAttributes

	thumb_func_start sub_80365DC
sub_80365DC: @ 80365DC
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
	ldr r2, _08036610 @ =gUnknown_2022BC4
	ldr r3, _08036614 @ =gActiveBattler
	ldrb r0, [r3]
	lsls r0, 9
	adds r1, r2, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3B
	bls _08036606
	bl _08036D72
_08036606:
	lsls r0, 2
	ldr r1, _08036618 @ =_0803661C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08036610: .4byte gUnknown_2022BC4
_08036614: .4byte gActiveBattler
_08036618: .4byte _0803661C
	.align 2, 0
_0803661C:
	.4byte _0803670C
	.4byte _08036930
	.4byte _08036940
	.4byte _08036950
	.4byte _080369B8
	.4byte _080369B8
	.4byte _080369B8
	.4byte _080369B8
	.4byte _080369D4
	.4byte _08036A10
	.4byte _08036A10
	.4byte _08036A10
	.4byte _08036A10
	.4byte _08036D72
	.4byte _08036D72
	.4byte _08036D72
	.4byte _08036D72
	.4byte _08036A2C
	.4byte _08036A3C
	.4byte _08036A6C
	.4byte _08036A7C
	.4byte _08036A8C
	.4byte _08036A9C
	.4byte _08036AAC
	.4byte _08036ABC
	.4byte _08036ACC
	.4byte _08036ADC
	.4byte _08036AEC
	.4byte _08036AFC
	.4byte _08036B0C
	.4byte _08036B1C
	.4byte _08036B2C
	.4byte _08036B7C
	.4byte _08036B8C
	.4byte _08036B9C
	.4byte _08036BAC
	.4byte _08036BBC
	.4byte _08036BCC
	.4byte _08036BDC
	.4byte _08036BEC
	.4byte _08036BFC
	.4byte _08036C30
	.4byte _08036C40
	.4byte _08036C50
	.4byte _08036C60
	.4byte _08036C70
	.4byte _08036C80
	.4byte _08036C90
	.4byte _08036CA0
	.4byte _08036CC0
	.4byte _08036CD0
	.4byte _08036CE0
	.4byte _08036CF0
	.4byte _08036D00
	.4byte _08036D10
	.4byte _08036D20
	.4byte _08036D30
	.4byte _08036D40
	.4byte _08036D50
	.4byte _08036D60
_0803670C:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08036920 @ =gEnemyParty
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
_08036758:
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
	ble _08036758
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08036920 @ =gEnemyParty
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
	ldr r1, _08036924 @ =0xfffffc1f
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
	ldr r2, _08036928 @ =0xfff07fff
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
	ldr r1, _0803692C @ =0xfffffe0f
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
_08036910:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0x57
	bls _08036910
	b _08036D72
	.align 2, 0
_08036920: .4byte gEnemyParty
_08036924: .4byte 0xfffffc1f
_08036928: .4byte 0xfff07fff
_0803692C: .4byte 0xfffffe0f
_08036930:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803693C @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	b _08036CAA
	.align 2, 0
_0803693C: .4byte gEnemyParty
_08036940:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803694C @ =gEnemyParty
	adds r0, r1
	movs r1, 0xC
	b _08036CAA
	.align 2, 0
_0803694C: .4byte gEnemyParty
_08036950:
	movs r6, 0
	add r2, sp, 0x58
	mov r9, r2
	add r0, sp, 0x60
	mov r10, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080369B4 @ =gEnemyParty
	adds r4, r1, r0
	mov r8, r9
_08036966:
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
	ble _08036966
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080369B4 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	mov r1, r9
	strb r0, [r1, 0xC]
	mov r2, r9
	movs r6, 0
_080369A4:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0xF
	bls _080369A4
	b _08036D72
	.align 2, 0
_080369B4: .4byte gEnemyParty
_080369B8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080369D0 @ =gEnemyParty
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x9
	b _08036CAA
	.align 2, 0
_080369D0: .4byte gEnemyParty
_080369D4:
	movs r6, 0
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r2, _08036A0C @ =gEnemyParty
	mov r8, r2
_080369E0:
	adds r1, r6, 0
	adds r1, 0x11
	mov r2, r8
	adds r0, r4, r2
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	cmp r6, 0x3
	ble _080369E0
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036A0C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	b _08036D72
	.align 2, 0
_08036A0C: .4byte gEnemyParty
_08036A10:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036A28 @ =gEnemyParty
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x8
	b _08036D6A
	.align 2, 0
_08036A28: .4byte gEnemyParty
_08036A2C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036A38 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x1
	b _08036A46
	.align 2, 0
_08036A38: .4byte gEnemyParty
_08036A3C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036A68 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x19
_08036A46:
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
	b _08036D72
	.align 2, 0
_08036A68: .4byte gEnemyParty
_08036A6C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036A78 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x1A
	b _08036D6A
	.align 2, 0
_08036A78: .4byte gEnemyParty
_08036A7C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036A88 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x1B
	b _08036D6A
	.align 2, 0
_08036A88: .4byte gEnemyParty
_08036A8C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036A98 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x1C
	b _08036D6A
	.align 2, 0
_08036A98: .4byte gEnemyParty
_08036A9C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036AA8 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x1D
	b _08036D6A
	.align 2, 0
_08036AA8: .4byte gEnemyParty
_08036AAC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036AB8 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x1E
	b _08036D6A
	.align 2, 0
_08036AB8: .4byte gEnemyParty
_08036ABC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036AC8 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x1F
	b _08036D6A
	.align 2, 0
_08036AC8: .4byte gEnemyParty
_08036ACC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036AD8 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x20
	b _08036D6A
	.align 2, 0
_08036AD8: .4byte gEnemyParty
_08036ADC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036AE8 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x22
	b _08036D6A
	.align 2, 0
_08036AE8: .4byte gEnemyParty
_08036AEC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036AF8 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x23
	b _08036D6A
	.align 2, 0
_08036AF8: .4byte gEnemyParty
_08036AFC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036B08 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x24
	b _08036D6A
	.align 2, 0
_08036B08: .4byte gEnemyParty
_08036B0C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036B18 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x25
	b _08036D6A
	.align 2, 0
_08036B18: .4byte gEnemyParty
_08036B1C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036B28 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x26
	b _08036D6A
	.align 2, 0
_08036B28: .4byte gEnemyParty
_08036B2C:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08036B78 @ =gEnemyParty
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
	b _08036D72
	.align 2, 0
_08036B78: .4byte gEnemyParty
_08036B7C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036B88 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x27
	b _08036D6A
	.align 2, 0
_08036B88: .4byte gEnemyParty
_08036B8C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036B98 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x28
	b _08036D6A
	.align 2, 0
_08036B98: .4byte gEnemyParty
_08036B9C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036BA8 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x29
	b _08036D6A
	.align 2, 0
_08036BA8: .4byte gEnemyParty
_08036BAC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036BB8 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2A
	b _08036D6A
	.align 2, 0
_08036BB8: .4byte gEnemyParty
_08036BBC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036BC8 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2B
	b _08036D6A
	.align 2, 0
_08036BC8: .4byte gEnemyParty
_08036BCC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036BD8 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2C
	b _08036D6A
	.align 2, 0
_08036BD8: .4byte gEnemyParty
_08036BDC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036BE8 @ =gEnemyParty
	adds r0, r1
	movs r1, 0
	b _08036C06
	.align 2, 0
_08036BE8: .4byte gEnemyParty
_08036BEC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036BF8 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x9
	b _08036CAA
	.align 2, 0
_08036BF8: .4byte gEnemyParty
_08036BFC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036C2C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x37
_08036C06:
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
	b _08036D72
	.align 2, 0
_08036C2C: .4byte gEnemyParty
_08036C30:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036C3C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x38
	b _08036D6A
	.align 2, 0
_08036C3C: .4byte gEnemyParty
_08036C40:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036C4C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x39
	b _08036CAA
	.align 2, 0
_08036C4C: .4byte gEnemyParty
_08036C50:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036C5C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3A
	b _08036CAA
	.align 2, 0
_08036C5C: .4byte gEnemyParty
_08036C60:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036C6C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3B
	b _08036CAA
	.align 2, 0
_08036C6C: .4byte gEnemyParty
_08036C70:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036C7C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3C
	b _08036CAA
	.align 2, 0
_08036C7C: .4byte gEnemyParty
_08036C80:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036C8C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3D
	b _08036CAA
	.align 2, 0
_08036C8C: .4byte gEnemyParty
_08036C90:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036C9C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3E
	b _08036CAA
	.align 2, 0
_08036C9C: .4byte gEnemyParty
_08036CA0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036CBC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3F
_08036CAA:
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	strb r0, [r7]
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r6, 0x2
	b _08036D72
	.align 2, 0
_08036CBC: .4byte gEnemyParty
_08036CC0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036CCC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x16
	b _08036D6A
	.align 2, 0
_08036CCC: .4byte gEnemyParty
_08036CD0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036CDC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x17
	b _08036D6A
	.align 2, 0
_08036CDC: .4byte gEnemyParty
_08036CE0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036CEC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x18
	b _08036D6A
	.align 2, 0
_08036CEC: .4byte gEnemyParty
_08036CF0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036CFC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x21
	b _08036D6A
	.align 2, 0
_08036CFC: .4byte gEnemyParty
_08036D00:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036D0C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2F
	b _08036D6A
	.align 2, 0
_08036D0C: .4byte gEnemyParty
_08036D10:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036D1C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x30
	b _08036D6A
	.align 2, 0
_08036D1C: .4byte gEnemyParty
_08036D20:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036D2C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x32
	b _08036D6A
	.align 2, 0
_08036D2C: .4byte gEnemyParty
_08036D30:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036D3C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x33
	b _08036D6A
	.align 2, 0
_08036D3C: .4byte gEnemyParty
_08036D40:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036D4C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x34
	b _08036D6A
	.align 2, 0
_08036D4C: .4byte gEnemyParty
_08036D50:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036D5C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x35
	b _08036D6A
	.align 2, 0
_08036D5C: .4byte gEnemyParty
_08036D60:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08036D84 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x36
_08036D6A:
	bl GetMonData
	strb r0, [r7]
	movs r6, 0x1
_08036D72:
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
_08036D84: .4byte gEnemyParty
	thumb_func_end sub_80365DC

	thumb_func_start OpponentHandlecmd1
OpponentHandlecmd1: @ 8036D88
	push {r4-r7,lr}
	sub sp, 0x58
	ldr r2, _08036E00 @ =gBattlerPartyIndexes
	ldr r5, _08036E04 @ =gActiveBattler
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	adds r4, r2, 0
	muls r4, r0
	ldr r3, _08036E08 @ =gUnknown_2022BC4
	lsls r1, 9
	adds r0, r3, 0x1
	adds r0, r1, r0
	ldrb r2, [r0]
	ldr r0, _08036E0C @ =gEnemyParty
	adds r0, r2, r0
	adds r6, r4, r0
	mov r0, sp
	adds r4, r0, r2
	movs r2, 0
	adds r0, r3, 0x2
	adds r1, r0
	adds r7, r5, 0
	mov r12, r3
	ldrb r1, [r1]
	cmp r2, r1
	bcs _08036DDE
	adds r3, r0, 0
_08036DC4:
	adds r1, r4, r2
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r5]
	lsls r0, 9
	adds r0, r3
	ldrb r0, [r0]
	cmp r2, r0
	bcc _08036DC4
_08036DDE:
	ldrb r0, [r7]
	lsls r0, 9
	mov r1, r12
	adds r1, 0x2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	adds r2, r4, 0
	bl EmitDataTransfer
	bl OpponentBufferExecCompleted
	add sp, 0x58
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036E00: .4byte gBattlerPartyIndexes
_08036E04: .4byte gActiveBattler
_08036E08: .4byte gUnknown_2022BC4
_08036E0C: .4byte gEnemyParty
	thumb_func_end OpponentHandlecmd1

	thumb_func_start OpponentHandleSetAttributes
OpponentHandleSetAttributes: @ 8036E10
	push {r4,r5,lr}
	ldr r1, _08036E34 @ =gUnknown_2022BC4
	ldr r0, _08036E38 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _08036E40
	ldr r0, _08036E3C @ =gBattlerPartyIndexes
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	bl sub_8036E68
	b _08036E5E
	.align 2, 0
_08036E34: .4byte gUnknown_2022BC4
_08036E38: .4byte gActiveBattler
_08036E3C: .4byte gBattlerPartyIndexes
_08036E40:
	ldrb r4, [r1]
	movs r5, 0
_08036E44:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _08036E52
	adds r0, r5, 0
	bl sub_8036E68
_08036E52:
	lsrs r4, 1
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08036E44
_08036E5E:
	bl OpponentBufferExecCompleted
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end OpponentHandleSetAttributes

	thumb_func_start sub_8036E68
sub_8036E68: @ 8036E68
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x38
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r3, _08036EA0 @ =gActiveBattler
	ldrb r0, [r3]
	lsls r0, 9
	ldr r2, _08036EA4 @ =gUnknown_2022BC7
	adds r4, r0, r2
	adds r7, r4, 0
	subs r1, r2, 0x2
	adds r0, r1
	ldrb r0, [r0]
	adds r6, r3, 0
	adds r3, r2, 0
	cmp r0, 0x3B
	bls _08036E96
	bl _08037774
_08036E96:
	lsls r0, 2
	ldr r1, _08036EA8 @ =_08036EAC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08036EA0: .4byte gActiveBattler
_08036EA4: .4byte gUnknown_2022BC7
_08036EA8: .4byte _08036EAC
	.align 2, 0
_08036EAC:
	.4byte _08036F9C
	.4byte _08037134
	.4byte _08037150
	.4byte _0803716C
	.4byte _080371C0
	.4byte _080371C0
	.4byte _080371C0
	.4byte _080371C0
	.4byte _080371E0
	.4byte _08037248
	.4byte _08037248
	.4byte _08037248
	.4byte _08037248
	.4byte _08037774
	.4byte _08037774
	.4byte _08037774
	.4byte _08037774
	.4byte _08037270
	.4byte _0803728C
	.4byte _080372A8
	.4byte _080372C4
	.4byte _080372E0
	.4byte _080372FC
	.4byte _08037318
	.4byte _08037334
	.4byte _08037350
	.4byte _0803736C
	.4byte _08037388
	.4byte _080373A4
	.4byte _080373C0
	.4byte _080373DC
	.4byte _080373F8
	.4byte _0803746C
	.4byte _08037488
	.4byte _080374A4
	.4byte _080374C0
	.4byte _080374DC
	.4byte _080374F8
	.4byte _08037514
	.4byte _08037530
	.4byte _0803754C
	.4byte _08037568
	.4byte _08037584
	.4byte _080375A0
	.4byte _080375BC
	.4byte _080375D8
	.4byte _080375F4
	.4byte _08037610
	.4byte _0803762C
	.4byte _08037648
	.4byte _08037664
	.4byte _08037680
	.4byte _0803769C
	.4byte _080376B8
	.4byte _080376D4
	.4byte _080376F0
	.4byte _0803770C
	.4byte _08037728
	.4byte _08037744
	.4byte _08037760
_08036F9C:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08037130 @ =gEnemyParty
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
_08037002:
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
	ble _08037002
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08037130 @ =gEnemyParty
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
	b _08037774
	.align 2, 0
_08037130: .4byte gEnemyParty
_08037134:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803714C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0xB
	bl SetMonData
	b _08037774
	.align 2, 0
_0803714C: .4byte gEnemyParty
_08037150:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08037168 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0xC
	bl SetMonData
	b _08037774
	.align 2, 0
_08037168: .4byte gEnemyParty
_0803716C:
	movs r0, 0
	mov r8, r0
	movs r0, 0xC
	adds r0, r4
	mov r9, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080371BC @ =gEnemyParty
	adds r7, r1, r0
	adds r6, r4, 0
	adds r6, 0x8
_08037184:
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
	ble _08037184
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080371BC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x15
	mov r2, r9
	bl SetMonData
	b _08037774
	.align 2, 0
_080371BC: .4byte gEnemyParty
_080371C0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080371D8 @ =gEnemyParty
	adds r0, r1
	ldr r3, _080371DC @ =gUnknown_2022BC4
	ldrb r2, [r6]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x9
	b _0803725E
	.align 2, 0
_080371D8: .4byte gEnemyParty
_080371DC: .4byte gUnknown_2022BC4
_080371E0:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08037244 @ =gEnemyParty
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
	b _08037774
	.align 2, 0
_08037244: .4byte gEnemyParty
_08037248:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08037268 @ =gEnemyParty
	adds r0, r1
	ldr r3, _0803726C @ =gUnknown_2022BC4
	ldrb r2, [r6]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x8
_0803725E:
	adds r3, 0x3
	adds r2, r3
	bl SetMonData
	b _08037774
	.align 2, 0
_08037268: .4byte gEnemyParty
_0803726C: .4byte gUnknown_2022BC4
_08037270:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08037288 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x1
	bl SetMonData
	b _08037774
	.align 2, 0
_08037288: .4byte gEnemyParty
_0803728C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080372A4 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x19
	bl SetMonData
	b _08037774
	.align 2, 0
_080372A4: .4byte gEnemyParty
_080372A8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080372C0 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x1A
	bl SetMonData
	b _08037774
	.align 2, 0
_080372C0: .4byte gEnemyParty
_080372C4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080372DC @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x1B
	bl SetMonData
	b _08037774
	.align 2, 0
_080372DC: .4byte gEnemyParty
_080372E0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080372F8 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x1C
	bl SetMonData
	b _08037774
	.align 2, 0
_080372F8: .4byte gEnemyParty
_080372FC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08037314 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x1D
	bl SetMonData
	b _08037774
	.align 2, 0
_08037314: .4byte gEnemyParty
_08037318:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08037330 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x1E
	bl SetMonData
	b _08037774
	.align 2, 0
_08037330: .4byte gEnemyParty
_08037334:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803734C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x1F
	bl SetMonData
	b _08037774
	.align 2, 0
_0803734C: .4byte gEnemyParty
_08037350:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08037368 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x20
	bl SetMonData
	b _08037774
	.align 2, 0
_08037368: .4byte gEnemyParty
_0803736C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08037384 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x22
	bl SetMonData
	b _08037774
	.align 2, 0
_08037384: .4byte gEnemyParty
_08037388:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080373A0 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x23
	bl SetMonData
	b _08037774
	.align 2, 0
_080373A0: .4byte gEnemyParty
_080373A4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080373BC @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x24
	bl SetMonData
	b _08037774
	.align 2, 0
_080373BC: .4byte gEnemyParty
_080373C0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080373D8 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x25
	bl SetMonData
	b _08037774
	.align 2, 0
_080373D8: .4byte gEnemyParty
_080373DC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080373F4 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x26
	bl SetMonData
	b _08037774
	.align 2, 0
_080373F4: .4byte gEnemyParty
_080373F8:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08037468 @ =gEnemyParty
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
	b _08037506
	.align 2, 0
_08037468: .4byte gEnemyParty
_0803746C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08037484 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x27
	bl SetMonData
	b _08037774
	.align 2, 0
_08037484: .4byte gEnemyParty
_08037488:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080374A0 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x28
	bl SetMonData
	b _08037774
	.align 2, 0
_080374A0: .4byte gEnemyParty
_080374A4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080374BC @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x29
	bl SetMonData
	b _08037774
	.align 2, 0
_080374BC: .4byte gEnemyParty
_080374C0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080374D8 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x2A
	bl SetMonData
	b _08037774
	.align 2, 0
_080374D8: .4byte gEnemyParty
_080374DC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080374F4 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x2B
	bl SetMonData
	b _08037774
	.align 2, 0
_080374F4: .4byte gEnemyParty
_080374F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08037510 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
_08037506:
	movs r1, 0x2C
	bl SetMonData
	b _08037774
	.align 2, 0
_08037510: .4byte gEnemyParty
_08037514:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803752C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0
	bl SetMonData
	b _08037774
	.align 2, 0
_0803752C: .4byte gEnemyParty
_08037530:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08037548 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x9
	bl SetMonData
	b _08037774
	.align 2, 0
_08037548: .4byte gEnemyParty
_0803754C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08037564 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x37
	bl SetMonData
	b _08037774
	.align 2, 0
_08037564: .4byte gEnemyParty
_08037568:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08037580 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x38
	bl SetMonData
	b _08037774
	.align 2, 0
_08037580: .4byte gEnemyParty
_08037584:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803759C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x39
	bl SetMonData
	b _08037774
	.align 2, 0
_0803759C: .4byte gEnemyParty
_080375A0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080375B8 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x3A
	bl SetMonData
	b _08037774
	.align 2, 0
_080375B8: .4byte gEnemyParty
_080375BC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080375D4 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x3B
	bl SetMonData
	b _08037774
	.align 2, 0
_080375D4: .4byte gEnemyParty
_080375D8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080375F0 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x3C
	bl SetMonData
	b _08037774
	.align 2, 0
_080375F0: .4byte gEnemyParty
_080375F4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803760C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x3D
	bl SetMonData
	b _08037774
	.align 2, 0
_0803760C: .4byte gEnemyParty
_08037610:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08037628 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x3E
	bl SetMonData
	b _08037774
	.align 2, 0
_08037628: .4byte gEnemyParty
_0803762C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08037644 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x3F
	bl SetMonData
	b _08037774
	.align 2, 0
_08037644: .4byte gEnemyParty
_08037648:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08037660 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x16
	bl SetMonData
	b _08037774
	.align 2, 0
_08037660: .4byte gEnemyParty
_08037664:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803767C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x17
	bl SetMonData
	b _08037774
	.align 2, 0
_0803767C: .4byte gEnemyParty
_08037680:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08037698 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x18
	bl SetMonData
	b _08037774
	.align 2, 0
_08037698: .4byte gEnemyParty
_0803769C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080376B4 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x21
	bl SetMonData
	b _08037774
	.align 2, 0
_080376B4: .4byte gEnemyParty
_080376B8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080376D0 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x2F
	bl SetMonData
	b _08037774
	.align 2, 0
_080376D0: .4byte gEnemyParty
_080376D4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080376EC @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x30
	bl SetMonData
	b _08037774
	.align 2, 0
_080376EC: .4byte gEnemyParty
_080376F0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08037708 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x32
	bl SetMonData
	b _08037774
	.align 2, 0
_08037708: .4byte gEnemyParty
_0803770C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08037724 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x33
	bl SetMonData
	b _08037774
	.align 2, 0
_08037724: .4byte gEnemyParty
_08037728:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08037740 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x34
	bl SetMonData
	b _08037774
	.align 2, 0
_08037740: .4byte gEnemyParty
_08037744:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0803775C @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x35
	bl SetMonData
	b _08037774
	.align 2, 0
_0803775C: .4byte gEnemyParty
_08037760:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08037784 @ =gEnemyParty
	adds r0, r1
	ldrb r2, [r6]
	lsls r2, 9
	adds r2, r3
	movs r1, 0x36
	bl SetMonData
_08037774:
	add sp, 0x38
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037784: .4byte gEnemyParty
	thumb_func_end sub_8036E68

	thumb_func_start OpponentHandlecmd3
OpponentHandlecmd3: @ 8037788
	push {r4-r7,lr}
	ldr r1, _080377EC @ =gBattlerPartyIndexes
	ldr r7, _080377F0 @ =gActiveBattler
	ldrb r2, [r7]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	adds r3, r1, 0
	muls r3, r0
	ldr r4, _080377F4 @ =gUnknown_2022BC4
	lsls r2, 9
	adds r0, r4, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	ldr r1, _080377F8 @ =gEnemyParty
	adds r0, r1
	adds r5, r3, r0
	movs r3, 0
	adds r0, r4, 0x2
	adds r2, r0
	ldrb r2, [r2]
	cmp r3, r2
	bcs _080377E0
	adds r6, r4, 0
	adds r2, r7, 0
	adds r4, r0, 0
_080377BE:
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
	bcc _080377BE
_080377E0:
	bl OpponentBufferExecCompleted
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080377EC: .4byte gBattlerPartyIndexes
_080377F0: .4byte gActiveBattler
_080377F4: .4byte gUnknown_2022BC4
_080377F8: .4byte gEnemyParty
	thumb_func_end OpponentHandlecmd3

	thumb_func_start sub_80377FC
sub_80377FC: @ 80377FC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r7, _0803787C @ =gBattlerPartyIndexes
	ldr r4, _08037880 @ =gActiveBattler
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r6, _08037884 @ =gEnemyParty
	adds r0, r6
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _08037888 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _08037890
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r6
	bl sub_8034658
	ldrb r0, [r4]
	bl sub_8074900
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r3, _0803788C @ =gUnknown_2024018
	ldr r0, [r3]
	ldrb r1, [r4]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r3]
	ldrb r1, [r4]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x1]
	b _080378AA
	.align 2, 0
_0803787C: .4byte gBattlerPartyIndexes
_08037880: .4byte gActiveBattler
_08037884: .4byte gEnemyParty
_08037888: .4byte gBattleTypeFlags
_0803788C: .4byte gUnknown_2024018
_08037890:
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r6
	bl BattleLoadOpponentMonSpriteGfx
	ldrb r0, [r4]
	bl GetBankSpriteDefault_Y
	lsls r0, 24
	lsrs r5, r0, 24
_080378AA:
	ldr r7, _0803799C @ =gActiveBattler
	ldrb r0, [r7]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_803F7D4
	ldr r6, _080379A0 @ =gMultiuseSpriteTemplate
	ldrb r0, [r7]
	movs r1, 0x2
	bl sub_8074480
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r7]
	bl sub_807685C
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl CreateSprite
	ldr r4, _080379A4 @ =gUnknown_2023D44
	ldrb r1, [r7]
	adds r1, r4
	strb r0, [r1]
	ldr r5, _080379A8 @ =gSprites
	ldrb r0, [r7]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _080379AC @ =0x0000ff10
	strh r1, [r0, 0x24]
	ldrb r2, [r7]
	adds r0, r2, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x2E]
	ldrb r0, [r7]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x32]
	ldrb r3, [r7]
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
	ldrb r2, [r7]
	adds r4, r2, r4
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _080379B0 @ =gBattleMonForms
	adds r2, r1
	ldrb r1, [r2]
	bl StartSpriteAnim
	ldr r0, _080379B4 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	bne _08037986
	ldrb r4, [r7]
	ldr r1, _080379B8 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080379BC @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl SetBankEnemyShadowSpriteCallback
_08037986:
	ldr r0, _080379C0 @ =gUnknown_3004FE0
	ldrb r1, [r7]
	lsls r1, 2
	adds r1, r0
	ldr r0, _080379C4 @ =sub_8035FE8
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803799C: .4byte gActiveBattler
_080379A0: .4byte gMultiuseSpriteTemplate
_080379A4: .4byte gUnknown_2023D44
_080379A8: .4byte gSprites
_080379AC: .4byte 0x0000ff10
_080379B0: .4byte gBattleMonForms
_080379B4: .4byte gBattleTypeFlags
_080379B8: .4byte gBattlerPartyIndexes
_080379BC: .4byte gEnemyParty
_080379C0: .4byte gUnknown_3004FE0
_080379C4: .4byte sub_8035FE8
	thumb_func_end sub_80377FC

	thumb_func_start OpponentHandleSwitchInAnim
OpponentHandleSwitchInAnim: @ 80379C8
	push {r4,lr}
	ldr r4, _08037A10 @ =gActiveBattler
	ldrb r0, [r4]
	ldr r1, _08037A14 @ =gBattleStruct
	ldr r1, [r1]
	adds r0, r1
	adds r0, 0x5C
	movs r1, 0x6
	strb r1, [r0]
	ldr r1, _08037A18 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r2, r0, 1
	adds r2, r1
	ldr r3, _08037A1C @ =gUnknown_2022BC4
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
	bl sub_8037A28
	ldr r1, _08037A20 @ =gUnknown_3004FE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08037A24 @ =sub_8036408
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037A10: .4byte gActiveBattler
_08037A14: .4byte gBattleStruct
_08037A18: .4byte gBattlerPartyIndexes
_08037A1C: .4byte gUnknown_2022BC4
_08037A20: .4byte gUnknown_3004FE0
_08037A24: .4byte sub_8036408
	thumb_func_end OpponentHandleSwitchInAnim

	thumb_func_start sub_8037A28
sub_8037A28: @ 8037A28
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
	ldr r0, _08037B84 @ =gBattlerPartyIndexes
	lsls r4, r6, 1
	adds r4, r0
	ldr r0, _08037B88 @ =gUnknown_2022BC4
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
	ldr r5, _08037B8C @ =gEnemyParty
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	mov r8, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _08037B90 @ =sub_8033E3C
	bl CreateInvisibleSpriteWithCallback
	ldr r1, _08037B94 @ =gUnknown_3004FFC
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
	bl sub_803F7D4
	ldr r0, _08037B98 @ =gMultiuseSpriteTemplate
	mov r9, r0
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8074480
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	bl GetBankSpriteDefault_Y
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl sub_807685C
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r9
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r4, _08037B9C @ =gUnknown_2023D44
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _08037BA0 @ =gSprites
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
	mov r0, r10
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r4]
	strh r1, [r0, 0x30]
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
	ldr r1, _08037BA4 @ =gBattleMonForms
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
	ldr r1, _08037BA8 @ =SpriteCallbackDummy
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
_08037B84: .4byte gBattlerPartyIndexes
_08037B88: .4byte gUnknown_2022BC4
_08037B8C: .4byte gEnemyParty
_08037B90: .4byte sub_8033E3C
_08037B94: .4byte gUnknown_3004FFC
_08037B98: .4byte gMultiuseSpriteTemplate
_08037B9C: .4byte gUnknown_2023D44
_08037BA0: .4byte gSprites
_08037BA4: .4byte gBattleMonForms
_08037BA8: .4byte SpriteCallbackDummy
	thumb_func_end sub_8037A28

	thumb_func_start sub_8037BAC
sub_8037BAC: @ 8037BAC
	push {r4-r6,lr}
	ldr r1, _08037BE0 @ =gUnknown_2022BC4
	ldr r6, _08037BE4 @ =gActiveBattler
	ldrb r2, [r6]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r3, [r0]
	cmp r3, 0
	bne _08037BF4
	ldr r0, _08037BE8 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	strb r3, [r0, 0x4]
	ldr r1, _08037BEC @ =gUnknown_3004FE0
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08037BF0 @ =sub_8037C44
	str r1, [r0]
	b _08037C30
	.align 2, 0
_08037BE0: .4byte gUnknown_2022BC4
_08037BE4: .4byte gActiveBattler
_08037BE8: .4byte gUnknown_2024018
_08037BEC: .4byte gUnknown_3004FE0
_08037BF0: .4byte sub_8037C44
_08037BF4:
	ldr r5, _08037C38 @ =gUnknown_2023D44
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08037C3C @ =gSprites
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
	bl EnemyShadowCallbackToSetInvisible
	ldr r1, _08037C40 @ =gUnknown_3004FF0
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl OpponentBufferExecCompleted
_08037C30:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08037C38: .4byte gUnknown_2023D44
_08037C3C: .4byte gSprites
_08037C40: .4byte gUnknown_3004FF0
	thumb_func_end sub_8037BAC

	thumb_func_start sub_8037C44
sub_8037C44: @ 8037C44
	push {r4-r6,lr}
	ldr r6, _08037C64 @ =gUnknown_2024018
	ldr r4, [r6]
	ldr r5, _08037C68 @ =gActiveBattler
	ldrb r2, [r5]
	ldr r1, [r4, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r1
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	beq _08037C6C
	cmp r0, 0x1
	beq _08037C9A
	b _08037CC2
	.align 2, 0
_08037C64: .4byte gUnknown_2024018
_08037C68: .4byte gActiveBattler
_08037C6C:
	ldr r1, [r4]
	lsls r0, r2, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08037C86
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl InitAndLaunchSpecialAnimation
_08037C86:
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0, 0x4]
	b _08037CC2
_08037C9A:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _08037CC2
	strb r0, [r3, 0x4]
	ldrb r2, [r5]
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x2
	bl InitAndLaunchSpecialAnimation
	ldr r1, _08037CC8 @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08037CCC @ =sub_8036170
	str r1, [r0]
_08037CC2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08037CC8: .4byte gUnknown_3004FE0
_08037CCC: .4byte sub_8036170
	thumb_func_end sub_8037C44

	thumb_func_start sub_8037CD0
sub_8037CD0: @ 8037CD0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	ldr r3, _08037CEC @ =gTrainerBattleOpponent_A
	ldrh r1, [r3]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _08037CF0
	bl GetSecretBaseTrainerPicIndex
	b _08037D26
	.align 2, 0
_08037CEC: .4byte gTrainerBattleOpponent_A
_08037CF0:
	ldr r0, _08037D04 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _08037D08
	bl sub_80E6078
	b _08037D26
	.align 2, 0
_08037D04: .4byte gBattleTypeFlags
_08037D08:
	movs r0, 0x80
	lsls r0, 12
	ands r0, r1
	cmp r0, 0
	beq _08037D18
	bl sub_815DA3C
	b _08037D26
_08037D18:
	movs r0, 0x80
	lsls r0, 4
	ands r1, r0
	cmp r1, 0
	beq _08037D2C
	bl GetEreaderTrainerFrontSpriteId
_08037D26:
	lsls r0, 24
	lsrs r0, 24
	b _08037D3A
_08037D2C:
	ldr r2, _08037E6C @ =gTrainers
	ldrh r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x3]
_08037D3A:
	mov r9, r0
	ldr r0, _08037E70 @ =gActiveBattler
	mov r8, r0
	ldrb r1, [r0]
	mov r0, r9
	bl sub_80346C4
	mov r1, r8
	ldrb r0, [r1]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r9
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r5, _08037E74 @ =gMultiuseSpriteTemplate
	ldr r1, _08037E78 @ =gUnknown_823932C
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
	bl sub_807685C
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	movs r1, 0xB0
	adds r2, r4, 0
	bl CreateSprite
	ldr r5, _08037E7C @ =gUnknown_2023D44
	mov r2, r8
	ldrb r1, [r2]
	adds r1, r5
	strb r0, [r1]
	ldr r4, _08037E80 @ =gSprites
	ldrb r0, [r2]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _08037E84 @ =0x0000ff10
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
	ldr r0, _08037E88 @ =gUnknown_8239A1C
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
	ldr r0, _08037E8C @ =gUnknown_823957C
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
	ldr r2, _08037E90 @ =0x000003ff
	ands r2, r0
	ldrh r3, [r1, 0x4]
	ldr r0, _08037E94 @ =0xfffffc00
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
	ldr r1, _08037E98 @ =sub_8033EEC
	str r1, [r0]
	ldr r1, _08037E9C @ =gUnknown_3004FE0
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08037EA0 @ =sub_8035AE8
	str r1, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08037E6C: .4byte gTrainers
_08037E70: .4byte gActiveBattler
_08037E74: .4byte gMultiuseSpriteTemplate
_08037E78: .4byte gUnknown_823932C
_08037E7C: .4byte gUnknown_2023D44
_08037E80: .4byte gSprites
_08037E84: .4byte 0x0000ff10
_08037E88: .4byte gUnknown_8239A1C
_08037E8C: .4byte gUnknown_823957C
_08037E90: .4byte 0x000003ff
_08037E94: .4byte 0xfffffc00
_08037E98: .4byte sub_8033EEC
_08037E9C: .4byte gUnknown_3004FE0
_08037EA0: .4byte sub_8035AE8
	thumb_func_end sub_8037CD0

	thumb_func_start sub_8037EA4
sub_8037EA4: @ 8037EA4
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	ldr r3, _08037EC0 @ =gTrainerBattleOpponent_A
	ldrh r1, [r3]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _08037EC4
	bl GetSecretBaseTrainerPicIndex
	b _08037EFA
	.align 2, 0
_08037EC0: .4byte gTrainerBattleOpponent_A
_08037EC4:
	ldr r0, _08037ED8 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _08037EDC
	bl sub_80E6078
	b _08037EFA
	.align 2, 0
_08037ED8: .4byte gBattleTypeFlags
_08037EDC:
	movs r0, 0x80
	lsls r0, 12
	ands r0, r1
	cmp r0, 0
	beq _08037EEC
	bl sub_815DA3C
	b _08037EFA
_08037EEC:
	movs r0, 0x80
	lsls r0, 4
	ands r1, r0
	cmp r1, 0
	beq _08037F00
	bl GetEreaderTrainerFrontSpriteId
_08037EFA:
	lsls r0, 24
	lsrs r0, 24
	b _08037F0E
_08037F00:
	ldr r2, _08038040 @ =gTrainers
	ldrh r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x3]
_08037F0E:
	mov r9, r0
	ldr r0, _08038044 @ =gActiveBattler
	mov r8, r0
	ldrb r1, [r0]
	mov r0, r9
	bl sub_80346C4
	mov r1, r8
	ldrb r0, [r1]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r9
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r0, _08038048 @ =gMultiuseSpriteTemplate
	ldr r2, _0803804C @ =gUnknown_823932C
	mov r3, r9
	lsls r1, r3, 2
	adds r1, r2
	ldrb r1, [r1]
	movs r2, 0x8
	subs r2, r1
	lsls r2, 18
	movs r1, 0xA0
	lsls r1, 14
	adds r2, r1
	asrs r2, 16
	movs r1, 0xB0
	movs r3, 0x1E
	bl CreateSprite
	ldr r5, _08038050 @ =gUnknown_2023D44
	mov r2, r8
	ldrb r1, [r2]
	adds r1, r5
	strb r0, [r1]
	ldr r4, _08038054 @ =gSprites
	ldrb r0, [r2]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x60
	strh r1, [r0, 0x24]
	ldrb r0, [r2]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x20]
	adds r1, 0x20
	strh r1, [r0, 0x20]
	ldrb r0, [r2]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _08038058 @ =0x0000fffe
	strh r1, [r0, 0x2E]
	ldr r0, _0803805C @ =gUnknown_8239A1C
	mov r3, r9
	lsls r6, r3, 3
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
	mov r3, r8
	ldrb r0, [r3]
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
	ldr r0, _08038060 @ =gUnknown_823957C
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
	ldr r2, _08038064 @ =0x000003ff
	ands r2, r0
	ldrh r3, [r1, 0x4]
	ldr r0, _08038068 @ =0xfffffc00
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, 0x4]
	mov r3, r8
	ldrb r0, [r3]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	mov r1, r9
	strh r1, [r0, 0x6]
	ldrb r0, [r3]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _0803806C @ =sub_8033EEC
	str r1, [r0]
	ldr r1, _08038070 @ =gUnknown_3004FE0
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08038074 @ =sub_8035B20
	str r1, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08038040: .4byte gTrainers
_08038044: .4byte gActiveBattler
_08038048: .4byte gMultiuseSpriteTemplate
_0803804C: .4byte gUnknown_823932C
_08038050: .4byte gUnknown_2023D44
_08038054: .4byte gSprites
_08038058: .4byte 0x0000fffe
_0803805C: .4byte gUnknown_8239A1C
_08038060: .4byte gUnknown_823957C
_08038064: .4byte 0x000003ff
_08038068: .4byte 0xfffffc00
_0803806C: .4byte sub_8033EEC
_08038070: .4byte gUnknown_3004FE0
_08038074: .4byte sub_8035B20
	thumb_func_end sub_8037EA4

	thumb_func_start sub_8038078
sub_8038078: @ 8038078
	push {r4-r6,lr}
	ldr r6, _08038108 @ =gUnknown_2023D44
	ldr r4, _0803810C @ =gActiveBattler
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _08038110 @ =gSprites
	adds r0, r5
	bl oamt_add_pos2_onto_pos1
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
	ldr r1, _08038114 @ =sub_8075590
	str r1, [r0]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08038118 @ =SpriteCallbackDummy
	bl StoreSpriteCallbackInData6
	ldr r1, _0803811C @ =gUnknown_3004FE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08038120 @ =sub_8035B58
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08038108: .4byte gUnknown_2023D44
_0803810C: .4byte gActiveBattler
_08038110: .4byte gSprites
_08038114: .4byte sub_8075590
_08038118: .4byte SpriteCallbackDummy
_0803811C: .4byte gUnknown_3004FE0
_08038120: .4byte sub_8035B58
	thumb_func_end sub_8038078

	thumb_func_start sub_8038124
sub_8038124: @ 8038124
	push {r4-r6,lr}
	ldr r6, _08038170 @ =gUnknown_2024018
	ldr r4, [r6]
	ldr r5, _08038174 @ =gActiveBattler
	ldrb r2, [r5]
	ldr r0, [r4, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r3, r1, r0
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	bne _08038178
	ldr r1, [r4]
	lsls r0, r2, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08038158
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl InitAndLaunchSpecialAnimation
_08038158:
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
	b _080381B4
	.align 2, 0
_08038170: .4byte gUnknown_2024018
_08038174: .4byte gActiveBattler
_08038178:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080381B4
	strb r0, [r3, 0x4]
	movs r0, 0x10
	movs r1, 0x3F
	bl PlaySE12WithPanning
	ldr r2, _080381BC @ =gSprites
	ldr r1, _080381C0 @ =gUnknown_2023D44
	ldrb r0, [r5]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080381C4 @ =sub_8011EA0
	str r1, [r0]
	ldr r1, _080381C8 @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080381CC @ =sub_803612C
	str r1, [r0]
_080381B4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080381BC: .4byte gSprites
_080381C0: .4byte gUnknown_2023D44
_080381C4: .4byte sub_8011EA0
_080381C8: .4byte gUnknown_3004FE0
_080381CC: .4byte sub_803612C
	thumb_func_end sub_8038124

	thumb_func_start sub_80381D0
sub_80381D0: @ 80381D0
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80381D0

	thumb_func_start sub_80381DC
sub_80381DC: @ 80381DC
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80381DC

	thumb_func_start sub_80381E8
sub_80381E8: @ 80381E8
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80381E8

	thumb_func_start sub_80381F4
sub_80381F4: @ 80381F4
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80381F4

	thumb_func_start sub_8038200
sub_8038200: @ 8038200
	push {r4-r6,lr}
	ldr r6, _080382E4 @ =gActiveBattler
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	beq _08038212
	b _08038326
_08038212:
	ldr r0, _080382E8 @ =gUnknown_2022BC4
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
	ldr r5, _080382EC @ =gUnknown_2037F16
	mov r1, r12
	adds r1, 0x3
	adds r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _080382F0 @ =gUnknown_2037EEC
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
	ldr r4, _080382F4 @ =gUnknown_2037EE8
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
	ldr r3, _080382F8 @ =gUnknown_2037EFE
	ldrb r1, [r6]
	lsls r1, 9
	mov r2, r12
	adds r2, 0xA
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _080382FC @ =gUnknown_2037F00
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
	ldr r3, _08038300 @ =gUnknown_2037EE4
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x10
	adds r2, r1
	str r2, [r3]
	ldr r3, _08038304 @ =gUnknown_2024008
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
	beq _08038308
	bl OpponentBufferExecCompleted
	b _08038326
	.align 2, 0
_080382E4: .4byte gActiveBattler
_080382E8: .4byte gUnknown_2022BC4
_080382EC: .4byte gUnknown_2037F16
_080382F0: .4byte gUnknown_2037EEC
_080382F4: .4byte gUnknown_2037EE8
_080382F8: .4byte gUnknown_2037EFE
_080382FC: .4byte gUnknown_2037F00
_08038300: .4byte gUnknown_2037EE4
_08038304: .4byte gUnknown_2024008
_08038308:
	ldr r0, _0803832C @ =gUnknown_2024018
	ldr r0, [r0]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strb r3, [r0, 0x4]
	ldr r1, _08038330 @ =gUnknown_3004FE0
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08038334 @ =sub_8038338
	str r1, [r0]
_08038326:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803832C: .4byte gUnknown_2024018
_08038330: .4byte gUnknown_3004FE0
_08038334: .4byte sub_8038338
	thumb_func_end sub_8038200

	thumb_func_start sub_8038338
sub_8038338: @ 8038338
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r2, _08038384 @ =gUnknown_2022BC4
	ldr r6, _08038388 @ =gActiveBattler
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
	ldr r7, _0803838C @ =gUnknown_2024018
	ldr r5, [r7]
	ldr r1, [r5, 0x4]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x4]
	cmp r2, 0x1
	beq _080383D0
	cmp r2, 0x1
	bgt _08038390
	cmp r2, 0
	beq _0803839A
	b _080384AC
	.align 2, 0
_08038384: .4byte gUnknown_2022BC4
_08038388: .4byte gActiveBattler
_0803838C: .4byte gUnknown_2024018
_08038390:
	cmp r2, 0x2
	beq _080383FA
	cmp r2, 0x3
	beq _08038470
	b _080384AC
_0803839A:
	ldr r1, [r5]
	lsls r0, r3, 2
	adds r1, r0, r1
	ldrb r2, [r1]
	movs r0, 0xC
	ands r0, r2
	cmp r0, 0x4
	bne _080383BC
	movs r0, 0x8
	orrs r0, r2
	strb r0, [r1]
	ldrb r2, [r6]
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl InitAndLaunchSpecialAnimation
_080383BC:
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0, 0x4]
	b _080384AC
_080383D0:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080384AC
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
	b _080384AC
_080383FA:
	ldr r0, _08038460 @ =gUnknown_2037EDC
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _08038464 @ =gUnknown_2037EE1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080384AC
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
	beq _08038448
	mov r0, r8
	cmp r0, 0x1
	bhi _08038448
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
_08038448:
	ldr r0, _08038468 @ =gUnknown_2024018
	ldr r2, [r0]
	ldr r0, _0803846C @ =gActiveBattler
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3
	strb r1, [r0, 0x4]
	b _080384AC
	.align 2, 0
_08038460: .4byte gUnknown_2037EDC
_08038464: .4byte gUnknown_2037EE1
_08038468: .4byte gUnknown_2024018
_0803846C: .4byte gActiveBattler
_08038470:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080384AC
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
	bl OpponentBufferExecCompleted
_080384AC:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8038338

	thumb_func_start sub_80384BC
sub_80384BC: @ 80384BC
	push {r4,lr}
	ldr r0, _080384F0 @ =gBattle_BG0_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080384F4 @ =gBattle_BG0_Y
	strh r1, [r0]
	ldr r0, _080384F8 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 9
	ldr r1, _080384FC @ =gUnknown_2022BC6
	adds r4, r0, r1
	ldrh r0, [r4]
	bl sub_80D7274
	ldrh r0, [r4]
	bl sub_80D89B0
	lsls r0, 24
	cmp r0, 0
	beq _08038504
	ldr r0, _08038500 @ =gDisplayedStringBattle
	movs r1, 0x40
	bl sub_80D87BC
	b _0803850C
	.align 2, 0
_080384F0: .4byte gBattle_BG0_X
_080384F4: .4byte gBattle_BG0_Y
_080384F8: .4byte gActiveBattler
_080384FC: .4byte gUnknown_2022BC6
_08038500: .4byte gDisplayedStringBattle
_08038504:
	ldr r0, _08038534 @ =gDisplayedStringBattle
	movs r1, 0
	bl sub_80D87BC
_0803850C:
	ldr r0, _08038538 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08038568
	ldrh r1, [r4]
	cmp r1, 0xE3
	beq _0803854C
	ldr r0, _0803853C @ =0x0000017f
	cmp r1, r0
	bne _08038568
	ldr r1, _08038540 @ =gUnknown_3004FE0
	ldr r0, _08038544 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08038548 @ =sub_80E85C0
	b _08038574
	.align 2, 0
_08038534: .4byte gDisplayedStringBattle
_08038538: .4byte gBattleTypeFlags
_0803853C: .4byte 0x0000017f
_08038540: .4byte gUnknown_3004FE0
_08038544: .4byte gActiveBattler
_08038548: .4byte sub_80E85C0
_0803854C:
	ldr r1, _0803855C @ =gUnknown_3004FE0
	ldr r0, _08038560 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08038564 @ =sub_80E8598
	b _08038574
	.align 2, 0
_0803855C: .4byte gUnknown_3004FE0
_08038560: .4byte gActiveBattler
_08038564: .4byte sub_80E8598
_08038568:
	ldr r1, _0803857C @ =gUnknown_3004FE0
	ldr r0, _08038580 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08038584 @ =sub_80361E4
_08038574:
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803857C: .4byte gUnknown_3004FE0
_08038580: .4byte gActiveBattler
_08038584: .4byte sub_80361E4
	thumb_func_end sub_80384BC

	thumb_func_start sub_8038588
sub_8038588: @ 8038588
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8038588

	thumb_func_start sub_8038594
sub_8038594: @ 8038594
	push {lr}
	bl sub_8039C84
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8038594

	thumb_func_start sub_80385A4
sub_80385A4: @ 80385A4
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80385A4

	thumb_func_start sub_80385B0
sub_80385B0: @ 80385B0
	push {r4-r6,lr}
	ldr r6, _080385E4 @ =gActiveBattler
	ldrb r0, [r6]
	lsls r0, 9
	ldr r1, _080385E8 @ =gUnknown_2022BC8
	adds r5, r0, r1
	ldr r0, _080385EC @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x93
	lsls r1, 3
	ands r0, r1
	cmp r0, 0
	beq _08038680
	bl BattleAI_SetupAIData
	bl BattleAI_GetAIActionToUse
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	beq _080385F0
	cmp r4, 0x5
	bne _080385FC
	movs r0, 0x1
	movs r1, 0x4
	b _080385F4
	.align 2, 0
_080385E4: .4byte gActiveBattler
_080385E8: .4byte gUnknown_2022BC8
_080385EC: .4byte gBattleTypeFlags
_080385F0:
	movs r0, 0x1
	movs r1, 0x3
_080385F4:
	movs r2, 0
	bl EmitTwoReturnValues
	b _08038668
_080385FC:
	ldr r3, _08038670 @ =gBattleMoves
	lsls r0, r4, 1
	adds r2, r5, r0
	ldrh r1, [r2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x6]
	movs r0, 0x12
	ands r0, r1
	cmp r0, 0
	beq _0803861C
	ldr r1, _08038674 @ =gBattlerTarget
	ldrb r0, [r6]
	strb r0, [r1]
_0803861C:
	ldrh r1, [r2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x6]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08038656
	movs r0, 0
	bl GetBattlerAtPosition
	ldr r5, _08038674 @ =gBattlerTarget
	strb r0, [r5]
	ldr r0, _08038678 @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldr r2, _0803867C @ =gBitTable
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08038656
	movs r0, 0x2
	bl GetBattlerAtPosition
	strb r0, [r5]
_08038656:
	ldr r0, _08038674 @ =gBattlerTarget
	ldrb r0, [r0]
	lsls r0, 8
	orrs r4, r0
	movs r0, 0x1
	movs r1, 0xA
	adds r2, r4, 0
	bl EmitTwoReturnValues
_08038668:
	bl OpponentBufferExecCompleted
	b _08038712
	.align 2, 0
_08038670: .4byte gBattleMoves
_08038674: .4byte gBattlerTarget
_08038678: .4byte gAbsentBattlerFlags
_0803867C: .4byte gBitTable
_08038680:
	movs r6, 0x3
_08038682:
	bl Random
	adds r4, r0, 0
	ands r4, r6
	lsls r0, r4, 1
	adds r0, r5, r0
	ldrh r2, [r0]
	cmp r2, 0
	beq _08038682
	ldr r1, _080386BC @ =gBattleMoves
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x6]
	movs r0, 0x12
	ands r0, r1
	cmp r0, 0
	beq _080386C4
	ldr r0, _080386C0 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 8
	orrs r4, r0
	movs r0, 0x1
	movs r1, 0xA
	adds r2, r4, 0
	bl EmitTwoReturnValues
	b _0803870E
	.align 2, 0
_080386BC: .4byte gBattleMoves
_080386C0: .4byte gActiveBattler
_080386C4:
	ldr r0, _080386F4 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080386F8
	bl Random
	movs r1, 0x2
	ands r1, r0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r1, 0
	bl GetBattlerAtPosition
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 16
	orrs r2, r4
	movs r0, 0x1
	movs r1, 0xA
	bl EmitTwoReturnValues
	b _0803870E
	.align 2, 0
_080386F4: .4byte gBattleTypeFlags
_080386F8:
	movs r0, 0
	bl GetBattlerAtPosition
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 16
	orrs r2, r4
	movs r0, 0x1
	movs r1, 0xA
	bl EmitTwoReturnValues
_0803870E:
	bl OpponentBufferExecCompleted
_08038712:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80385B0

	thumb_func_start sub_8038718
sub_8038718: @ 8038718
	push {lr}
	ldr r0, _0803873C @ =gActiveBattler
	ldrb r0, [r0]
	lsrs r0, 1
	ldr r1, _08038740 @ =gBattleStruct
	ldr r1, [r1]
	lsls r0, 1
	adds r0, r1
	adds r0, 0xC0
	ldrb r1, [r0]
	movs r0, 0x1
	bl EmitOneReturnValue
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0803873C: .4byte gActiveBattler
_08038740: .4byte gBattleStruct
	thumb_func_end sub_8038718

	thumb_func_start sub_8038744
sub_8038744: @ 8038744
	push {r4-r6,lr}
	ldr r6, _08038788 @ =gActiveBattler
	ldrb r0, [r6]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 25
	ldr r5, _0803878C @ =gBattleStruct
	ldr r1, [r5]
	adds r0, r1
	adds r0, 0x92
	ldrb r0, [r0]
	cmp r0, 0x6
	bne _080387E4
	bl sub_8039E3C
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	bne _0803880A
	ldr r0, _08038790 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08038794
	movs r0, 0x1
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	b _080387A8
	.align 2, 0
_08038788: .4byte gActiveBattler
_0803878C: .4byte gBattleStruct
_08038790: .4byte gBattleTypeFlags
_08038794:
	movs r0, 0x1
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0x3
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r5, r0, 24
_080387A8:
	movs r4, 0
	b _080387AE
_080387AC:
	adds r4, 0x1
_080387AE:
	cmp r4, 0x5
	bgt _0803880A
	movs r0, 0x64
	muls r0, r4
	ldr r1, _080387DC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080387AC
	ldr r1, _080387E0 @ =gBattlerPartyIndexes
	lsls r0, r6, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	beq _080387AC
	lsls r0, r5, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	beq _080387AC
	b _0803880A
	.align 2, 0
_080387DC: .4byte gEnemyParty
_080387E0: .4byte gBattlerPartyIndexes
_080387E4:
	ldrb r0, [r6]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 25
	ldr r1, [r5]
	adds r0, r1
	adds r0, 0x92
	ldrb r4, [r0]
	ldrb r0, [r6]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 25
	ldr r1, [r5]
	adds r0, r1
	adds r0, 0x92
	movs r1, 0x6
	strb r1, [r0]
_0803880A:
	ldr r0, _08038830 @ =gActiveBattler
	ldrb r0, [r0]
	ldr r1, _08038834 @ =gBattleStruct
	ldr r1, [r1]
	adds r0, r1
	adds r0, 0x5C
	strb r4, [r0]
	lsls r1, r4, 24
	lsrs r1, 24
	movs r0, 0x1
	movs r2, 0
	bl EmitChosenMonReturnValue
	bl OpponentBufferExecCompleted
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08038830: .4byte gActiveBattler
_08038834: .4byte gBattleStruct
	thumb_func_end sub_8038744

	thumb_func_start sub_8038838
sub_8038838: @ 8038838
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8038838

	thumb_func_start sub_8038844
sub_8038844: @ 8038844
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r0, 0
	bl LoadBattleBarGfx
	ldr r3, _080388BC @ =gUnknown_2022BC4
	ldr r0, _080388C0 @ =gActiveBattler
	mov r9, r0
	ldrb r4, [r0]
	lsls r2, r4, 9
	adds r0, r3, 0x3
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r1, 8
	adds r3, 0x2
	adds r2, r3
	ldrb r0, [r2]
	orrs r0, r1
	lsls r0, 16
	asrs r7, r0, 16
	ldr r0, _080388C4 @ =0x00007fff
	cmp r7, r0
	beq _080388D4
	ldr r6, _080388C8 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _080388CC @ =gEnemyParty
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
	ldr r1, _080388D0 @ =gUnknown_3004FF0
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl SetBattleBarStruct
	b _080388FE
	.align 2, 0
_080388BC: .4byte gUnknown_2022BC4
_080388C0: .4byte gActiveBattler
_080388C4: .4byte 0x00007fff
_080388C8: .4byte gBattlerPartyIndexes
_080388CC: .4byte gEnemyParty
_080388D0: .4byte gUnknown_3004FF0
_080388D4:
	ldr r1, _0803891C @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08038920 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3A
	bl GetMonData
	adds r2, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _08038924 @ =gUnknown_3004FF0
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, 0
	bl SetBattleBarStruct
_080388FE:
	ldr r1, _08038928 @ =gUnknown_3004FE0
	ldr r0, _0803892C @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08038930 @ =sub_80360A0
	str r1, [r0]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803891C: .4byte gBattlerPartyIndexes
_08038920: .4byte gEnemyParty
_08038924: .4byte gUnknown_3004FF0
_08038928: .4byte gUnknown_3004FE0
_0803892C: .4byte gActiveBattler
_08038930: .4byte sub_80360A0
	thumb_func_end sub_8038844

	thumb_func_start sub_8038934
sub_8038934: @ 8038934
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8038934

	thumb_func_start sub_8038940
sub_8038940: @ 8038940
	push {r4,lr}
	ldr r4, _0803899C @ =gActiveBattler
	ldrb r0, [r4]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _08038994
	ldr r0, _080389A0 @ =gUnknown_3004FF0
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _080389A4 @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _080389A8 @ =gEnemyParty
	adds r1, r2
	movs r2, 0x9
	bl UpdateHealthboxAttribute
	ldrb r2, [r4]
	ldr r0, _080389AC @ =gUnknown_2024018
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
	ldr r1, _080389B0 @ =gUnknown_3004FE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080389B4 @ =sub_80364D0
	str r1, [r0]
_08038994:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803899C: .4byte gActiveBattler
_080389A0: .4byte gUnknown_3004FF0
_080389A4: .4byte gBattlerPartyIndexes
_080389A8: .4byte gEnemyParty
_080389AC: .4byte gUnknown_2024018
_080389B0: .4byte gUnknown_3004FE0
_080389B4: .4byte sub_80364D0
	thumb_func_end sub_8038940

	thumb_func_start sub_80389B8
sub_80389B8: @ 80389B8
	push {r4,r5,lr}
	ldr r5, _08038A10 @ =gActiveBattler
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _08038A08
	ldr r4, _08038A14 @ =gUnknown_2022BC4
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
	ldr r1, _08038A18 @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08038A1C @ =sub_80364D0
	str r1, [r0]
_08038A08:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08038A10: .4byte gActiveBattler
_08038A14: .4byte gUnknown_2022BC4
_08038A18: .4byte gUnknown_3004FE0
_08038A1C: .4byte sub_80364D0
	thumb_func_end sub_80389B8

	thumb_func_start sub_8038A20
sub_8038A20: @ 8038A20
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8038A20

	thumb_func_start sub_8038A2C
sub_8038A2C: @ 8038A2C
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8038A2C

	thumb_func_start sub_8038A38
sub_8038A38: @ 8038A38
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8038A38

	thumb_func_start sub_8038A44
sub_8038A44: @ 8038A44
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8038A44

	thumb_func_start sub_8038A50
sub_8038A50: @ 8038A50
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8038A50

	thumb_func_start sub_8038A5C
sub_8038A5C: @ 8038A5C
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8038A5C

	thumb_func_start sub_8038A68
sub_8038A68: @ 8038A68
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8038A68

	thumb_func_start sub_8038A74
sub_8038A74: @ 8038A74
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8038A74

	thumb_func_start sub_8038A80
sub_8038A80: @ 8038A80
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8038A80

	thumb_func_start OpponentHandlecmd37
OpponentHandlecmd37: @ 8038A8C
	push {lr}
	ldr r2, _08038AA4 @ =gUnknown_2022870
	ldrb r1, [r2]
	movs r0, 0x80
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08038AA4: .4byte gUnknown_2022870
	thumb_func_end OpponentHandlecmd37

	thumb_func_start OpponentHandlecmd38
OpponentHandlecmd38: @ 8038AA8
	push {lr}
	ldr r3, _08038AD4 @ =gUnknown_2022870
	ldr r1, _08038AD8 @ =gUnknown_2022BC4
	ldr r0, _08038ADC @ =gActiveBattler
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
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08038AD4: .4byte gUnknown_2022870
_08038AD8: .4byte gUnknown_2022BC4
_08038ADC: .4byte gActiveBattler
	thumb_func_end OpponentHandlecmd38

	thumb_func_start OpponentHandlecmd39
OpponentHandlecmd39: @ 8038AE0
	push {lr}
	ldr r2, _08038AF4 @ =gUnknown_2022870
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08038AF4: .4byte gUnknown_2022870
	thumb_func_end OpponentHandlecmd39

	thumb_func_start OpponentHandlecmd40
OpponentHandlecmd40: @ 8038AF8
	push {lr}
	ldr r3, _08038B1C @ =gUnknown_2022870
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
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08038B1C: .4byte gUnknown_2022870
	thumb_func_end OpponentHandlecmd40

	thumb_func_start OpponentHandleHitAnimation
OpponentHandleHitAnimation: @ 8038B20
	push {r4,lr}
	ldr r3, _08038B48 @ =gSprites
	ldr r2, _08038B4C @ =gUnknown_2023D44
	ldr r4, _08038B50 @ =gActiveBattler
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
	bge _08038B54
	bl OpponentBufferExecCompleted
	b _08038B7E
	.align 2, 0
_08038B48: .4byte gSprites
_08038B4C: .4byte gUnknown_2023D44
_08038B50: .4byte gActiveBattler
_08038B54:
	ldr r1, _08038B84 @ =gUnknown_2024005
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
	ldr r1, _08038B88 @ =gUnknown_3004FE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08038B8C @ =sub_80361FC
	str r1, [r0]
_08038B7E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08038B84: .4byte gUnknown_2024005
_08038B88: .4byte gUnknown_3004FE0
_08038B8C: .4byte sub_80361FC
	thumb_func_end OpponentHandleHitAnimation

	thumb_func_start sub_8038B90
sub_8038B90: @ 8038B90
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8038B90

	thumb_func_start OpponentHandleEffectivenessSound
OpponentHandleEffectivenessSound: @ 8038B9C
	push {r4,lr}
	ldr r4, _08038BD8 @ =gActiveBattler
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	movs r3, 0x3F
	cmp r0, 0
	bne _08038BB0
	movs r3, 0xC0
_08038BB0:
	ldr r2, _08038BDC @ =gUnknown_2022BC4
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
	bl OpponentBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08038BD8: .4byte gActiveBattler
_08038BDC: .4byte gUnknown_2022BC4
	thumb_func_end OpponentHandleEffectivenessSound

	thumb_func_start OpponentHandlecmd44
OpponentHandlecmd44: @ 8038BE0
	push {lr}
	ldr r2, _08038C08 @ =gUnknown_2022BC4
	ldr r0, _08038C0C @ =gActiveBattler
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
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08038C08: .4byte gUnknown_2022BC4
_08038C0C: .4byte gActiveBattler
	thumb_func_end OpponentHandlecmd44

	thumb_func_start OpponentHandleFaintingCry
OpponentHandleFaintingCry: @ 8038C10
	push {lr}
	ldr r1, _08038C40 @ =gBattlerPartyIndexes
	ldr r0, _08038C44 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08038C48 @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	movs r2, 0x5
	bl PlayCry3
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08038C40: .4byte gBattlerPartyIndexes
_08038C44: .4byte gActiveBattler
_08038C48: .4byte gEnemyParty
	thumb_func_end OpponentHandleFaintingCry

	thumb_func_start OpponentHandleIntroSlide
OpponentHandleIntroSlide: @ 8038C4C
	push {lr}
	ldr r1, _08038C74 @ =gUnknown_2022BC4
	ldr r0, _08038C78 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80BC3A0
	ldr r2, _08038C7C @ =gUnknown_2023F4C
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08038C74: .4byte gUnknown_2022BC4
_08038C78: .4byte gActiveBattler
_08038C7C: .4byte gUnknown_2023F4C
	thumb_func_end OpponentHandleIntroSlide

	thumb_func_start sub_8038C80
sub_8038C80: @ 8038C80
	push {r4-r6,lr}
	ldr r5, _08038D60 @ =gUnknown_2023D44
	ldr r6, _08038D64 @ =gActiveBattler
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08038D68 @ =gSprites
	adds r0, r4
	bl oamt_add_pos2_onto_pos1
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
	ldr r1, _08038D6C @ =sub_8075590
	str r1, [r0]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _08038D70 @ =sub_8038D90
	bl StoreSpriteCallbackInData6
	ldr r0, _08038D74 @ =sub_8038DC4
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08038D78 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	ldrb r0, [r6]
	strh r0, [r1, 0x8]
	ldr r3, _08038D7C @ =gUnknown_2024018
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
	beq _08038D42
	ldr r0, _08038D80 @ =gUnknown_2024000
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldr r1, _08038D84 @ =sub_80491B0
	str r1, [r0]
_08038D42:
	ldr r0, [r3]
	ldr r2, [r0, 0x8]
	ldrb r0, [r2, 0x9]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _08038D88 @ =gUnknown_3004FE0
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08038D8C @ =nullsub_17
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08038D60: .4byte gUnknown_2023D44
_08038D64: .4byte gActiveBattler
_08038D68: .4byte gSprites
_08038D6C: .4byte sub_8075590
_08038D70: .4byte sub_8038D90
_08038D74: .4byte sub_8038DC4
_08038D78: .4byte gTasks
_08038D7C: .4byte gUnknown_2024018
_08038D80: .4byte gUnknown_2024000
_08038D84: .4byte sub_80491B0
_08038D88: .4byte gUnknown_3004FE0
_08038D8C: .4byte nullsub_17
	thumb_func_end sub_8038C80

	thumb_func_start sub_8038D90
sub_8038D90: @ 8038D90
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x6]
	bl sub_803477C
	ldrh r0, [r4, 0x38]
	ldr r1, _08038DBC @ =0x000003ff
	ands r1, r0
	ldrh r2, [r4, 0x4]
	ldr r0, _08038DC0 @ =0xfffffc00
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
_08038DBC: .4byte 0x000003ff
_08038DC0: .4byte 0xfffffc00
	thumb_func_end sub_8038D90

	thumb_func_start sub_8038DC4
sub_8038DC4: @ 8038DC4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r7, _08038E1C @ =gActiveBattler
	ldrb r0, [r7]
	mov r9, r0
	ldr r1, _08038E20 @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x8]
	strb r0, [r7]
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _08038DFE
	ldr r0, _08038E24 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08038E30
_08038DFE:
	ldr r0, _08038E28 @ =gUnknown_2022BC4
	ldrb r1, [r7]
	lsls r2, r1, 9
	adds r0, 0x1
	adds r2, r0
	ldr r0, _08038E2C @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_8037A28
	b _08038E70
	.align 2, 0
_08038E1C: .4byte gActiveBattler
_08038E20: .4byte gTasks
_08038E24: .4byte gBattleTypeFlags
_08038E28: .4byte gUnknown_2022BC4
_08038E2C: .4byte gBattlerPartyIndexes
_08038E30:
	ldr r4, _08038E94 @ =gUnknown_2022BC4
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r4, 0x1
	adds r1, r4
	ldr r6, _08038E98 @ =gBattlerPartyIndexes
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_8037A28
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
	bl sub_8037A28
	ldrb r0, [r7]
	eors r0, r5
	strb r0, [r7]
_08038E70:
	ldr r1, _08038E9C @ =gUnknown_3004FE0
	ldr r2, _08038EA0 @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08038EA4 @ =sub_8035DF0
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
_08038E94: .4byte gUnknown_2022BC4
_08038E98: .4byte gBattlerPartyIndexes
_08038E9C: .4byte gUnknown_3004FE0
_08038EA0: .4byte gActiveBattler
_08038EA4: .4byte sub_8035DF0
	thumb_func_end sub_8038DC4

	thumb_func_start sub_8038EA8
sub_8038EA8: @ 8038EA8
	push {r4-r7,lr}
	ldr r1, _08038ED0 @ =gUnknown_2022BC4
	ldr r0, _08038ED4 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08038ED8
	adds r0, r2, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08038ED8
	bl OpponentBufferExecCompleted
	b _08038FA2
	.align 2, 0
_08038ED0: .4byte gUnknown_2022BC4
_08038ED4: .4byte gActiveBattler
_08038ED8:
	ldr r4, _08038F30 @ =gUnknown_2024018
	ldr r0, [r4]
	ldr r3, _08038F34 @ =gActiveBattler
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
	ldr r1, _08038F38 @ =gUnknown_2022BC4
	ldrb r2, [r3]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r0, r1
	ldrb r0, [r0]
	adds r7, r3, 0
	cmp r0, 0
	beq _08038F44
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
	bhi _08038F3C
	adds r0, 0x1
	movs r1, 0x1F
	ands r0, r1
	lsls r0, 1
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x1]
	b _08038FA2
	.align 2, 0
_08038F30: .4byte gUnknown_2024018
_08038F34: .4byte gActiveBattler
_08038F38: .4byte gUnknown_2022BC4
_08038F3C:
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	strb r0, [r3, 0x1]
_08038F44:
	adds r5, r7, 0
	ldrb r0, [r5]
	lsls r3, r0, 9
	ldr r4, _08038FA8 @ =gUnknown_2022BC8
	adds r1, r3, r4
	subs r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	subs r4, 0x2
	adds r3, r4
	ldrb r3, [r3]
	bl sub_8048D14
	ldr r2, _08038FAC @ =gUnknown_2024000
	ldrb r1, [r5]
	adds r1, r2
	movs r3, 0
	strb r0, [r1]
	ldr r6, _08038FB0 @ =gUnknown_2024018
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
	beq _08038F96
	ldr r0, [r6]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0x5D
	strb r1, [r0, 0x5]
_08038F96:
	ldr r0, _08038FB4 @ =gUnknown_3004FE0
	ldrb r1, [r7]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08038FB8 @ =sub_8038FBC
	str r0, [r1]
_08038FA2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038FA8: .4byte gUnknown_2022BC8
_08038FAC: .4byte gUnknown_2024000
_08038FB0: .4byte gUnknown_2024018
_08038FB4: .4byte gUnknown_3004FE0
_08038FB8: .4byte sub_8038FBC
	thumb_func_end sub_8038EA8

	thumb_func_start sub_8038FBC
sub_8038FBC: @ 8038FBC
	push {r4,lr}
	ldr r4, _08038FFC @ =gUnknown_2024018
	ldr r0, [r4]
	ldr r3, _08039000 @ =gActiveBattler
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
	bls _08038FF4
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strb r1, [r0, 0x5]
	bl OpponentBufferExecCompleted
_08038FF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08038FFC: .4byte gUnknown_2024018
_08039000: .4byte gActiveBattler
	thumb_func_end sub_8038FBC

	thumb_func_start sub_8039004
sub_8039004: @ 8039004
	push {lr}
	ldr r0, _08039040 @ =gUnknown_2024018
	ldr r1, [r0]
	ldr r0, _08039044 @ =gActiveBattler
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
	beq _08039036
	ldr r2, _08039048 @ =gTasks
	ldr r0, _0803904C @ =gUnknown_2024000
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _08039050 @ =sub_80491B0
	str r1, [r0]
_08039036:
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08039040: .4byte gUnknown_2024018
_08039044: .4byte gActiveBattler
_08039048: .4byte gTasks
_0803904C: .4byte gUnknown_2024000
_08039050: .4byte sub_80491B0
	thumb_func_end sub_8039004

	thumb_func_start sub_8039054
sub_8039054: @ 8039054
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8039054

	thumb_func_start sub_8039060
sub_8039060: @ 8039060
	push {r4,lr}
	ldr r4, _080390B0 @ =gActiveBattler
	ldrb r0, [r4]
	bl sub_8075224
	lsls r0, 24
	cmp r0, 0
	beq _080390A6
	ldr r3, _080390B4 @ =gSprites
	ldr r0, _080390B8 @ =gUnknown_2023D44
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldr r0, _080390BC @ =gUnknown_2022BC4
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
_080390A6:
	bl OpponentBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080390B0: .4byte gActiveBattler
_080390B4: .4byte gSprites
_080390B8: .4byte gUnknown_2023D44
_080390BC: .4byte gUnknown_2022BC4
	thumb_func_end sub_8039060

	thumb_func_start sub_80390C0
sub_80390C0: @ 80390C0
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _08039104 @ =gActiveBattler
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _08039118
	ldr r5, _08039108 @ =gUnknown_2022BC4
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
	beq _0803910C
	bl OpponentBufferExecCompleted
	b _08039118
	.align 2, 0
_08039104: .4byte gActiveBattler
_08039108: .4byte gUnknown_2022BC4
_0803910C:
	ldr r0, _08039120 @ =gUnknown_3004FE0
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08039124 @ =sub_8036500
	str r0, [r1]
_08039118:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08039120: .4byte gUnknown_3004FE0
_08039124: .4byte sub_8036500
	thumb_func_end sub_80390C0

	thumb_func_start sub_8039128
sub_8039128: @ 8039128
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8039128

	thumb_func_start sub_8039134
sub_8039134: @ 8039134
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8039134

	thumb_func_start OpponentHandleCmd55
OpponentHandleCmd55: @ 8039140
	push {lr}
	ldr r0, _08039174 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x6
	ands r0, r1
	cmp r0, 0x2
	bne _0803916A
	ldr r2, _08039178 @ =gMain
	ldr r0, _0803917C @ =0x00000439
	adds r3, r2, r0
	ldrb r1, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _08039180 @ =gUnknown_3004F80
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, [r2, 0x8]
	bl SetMainCallback2
_0803916A:
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08039174: .4byte gBattleTypeFlags
_08039178: .4byte gMain
_0803917C: .4byte 0x00000439
_08039180: .4byte gUnknown_3004F80
	thumb_func_end OpponentHandleCmd55

	thumb_func_start nullsub_18
nullsub_18: @ 8039184
	bx lr
	thumb_func_end nullsub_18

	.align 2, 0 @ Don't pad with nop.
