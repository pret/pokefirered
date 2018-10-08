	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start DoPokeballSendOutAnimation
DoPokeballSendOutAnimation: @ 804A938
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _0804A98C @ =gUnknown_2024005
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _0804A990 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r6, _0804A994 @ =gActiveBattler
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _0804A998 @ =sub_804A9A0
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0804A99C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	strh r5, [r1, 0xC]
	ldrb r0, [r6]
	strh r0, [r1, 0xE]
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804A98C: .4byte gUnknown_2024005
_0804A990: .4byte gUnknown_2024018
_0804A994: .4byte gActiveBattler
_0804A998: .4byte sub_804A9A0
_0804A99C: .4byte gTasks
	thumb_func_end DoPokeballSendOutAnimation

	thumb_func_start sub_804A9A0
sub_804A9A0: @ 804A9A0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r1, _0804A9D4 @ =gTasks
	ldr r2, [sp]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0x8]
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _0804A9D8
	adds r0, r2, 0x1
	strh r0, [r1, 0x8]
	b _0804ABB8
	.align 2, 0
_0804A9D4: .4byte gTasks
_0804A9D8:
	ldrh r0, [r1, 0xC]
	mov r9, r0
	ldrb r6, [r1, 0xE]
	adds r0, r6, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _0804AA04
	ldr r1, _0804A9FC @ =gBattlerPartyIndexes
	lsls r0, r6, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0804AA00 @ =gEnemyParty
	b _0804AA12
	.align 2, 0
_0804A9FC: .4byte gBattlerPartyIndexes
_0804AA00: .4byte gEnemyParty
_0804AA04:
	ldr r1, _0804AA50 @ =gBattlerPartyIndexes
	lsls r0, r6, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0804AA54 @ =gPlayerParty
_0804AA12:
	adds r0, r1
	movs r1, 0x26
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl ItemIdToBallId
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl LoadBallGfx
	ldr r0, _0804AA58 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0804AA60
	ldr r4, _0804AA5C @ =gUnknown_202273C
	adds r0, r6, 0
	bl GetBankMultiplayerId
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r1, [r1, 0x13]
	mov r10, r1
	b _0804AA68
	.align 2, 0
_0804AA50: .4byte gBattlerPartyIndexes
_0804AA54: .4byte gPlayerParty
_0804AA58: .4byte gBattleTypeFlags
_0804AA5C: .4byte gUnknown_202273C
_0804AA60:
	ldr r0, _0804AAB8 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	mov r10, r0
_0804AA68:
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 3
	ldr r1, _0804AABC @ =gUnknown_82606F4
	adds r0, r1
	movs r1, 0x20
	movs r2, 0x50
	movs r3, 0x1D
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r5, r7, 4
	adds r0, r5, r7
	lsls r0, 2
	mov r8, r0
	ldr r4, _0804AAC0 @ =gSprites
	add r4, r8
	movs r0, 0x80
	strh r0, [r4, 0x2E]
	movs r1, 0
	strh r1, [r4, 0x30]
	mov r2, r9
	strh r2, [r4, 0x3C]
	mov r3, r9
	cmp r3, 0xFE
	beq _0804AAF8
	cmp r3, 0xFF
	bne _0804AB38
	ldr r0, _0804AAC4 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 9
	ands r0, r1
	cmp r0, 0
	beq _0804AAC8
	movs r5, 0x20
	movs r4, 0x40
	b _0804AACE
	.align 2, 0
_0804AAB8: .4byte gSaveBlock2Ptr
_0804AABC: .4byte gUnknown_82606F4
_0804AAC0: .4byte gSprites
_0804AAC4: .4byte gBattleTypeFlags
_0804AAC8:
	mov r0, r10
	movs r5, 0x30
	movs r4, 0x46
_0804AACE:
	ldr r0, _0804AAEC @ =gBattlerTarget
	strb r6, [r0]
	ldr r2, _0804AAF0 @ =gSprites
	lsls r3, r7, 4
	adds r1, r3, r7
	lsls r1, 2
	adds r0, r1, r2
	strh r5, [r0, 0x20]
	strh r4, [r0, 0x22]
	adds r2, 0x1C
	adds r1, r2
	ldr r0, _0804AAF4 @ =SpriteCB_PlayerMonSendOut_1
	str r0, [r1]
	b _0804AB48
	.align 2, 0
_0804AAEC: .4byte gBattlerTarget
_0804AAF0: .4byte gSprites
_0804AAF4: .4byte SpriteCB_PlayerMonSendOut_1
_0804AAF8:
	adds r0, r6, 0
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x18
	strh r0, [r4, 0x22]
	ldr r0, _0804AB2C @ =gBattlerTarget
	strb r6, [r0]
	movs r1, 0
	strh r1, [r4, 0x2E]
	ldr r0, _0804AB30 @ =gSprites
	adds r0, 0x1C
	add r0, r8
	ldr r1, _0804AB34 @ =SpriteCB_OpponentMonSendOut
	str r1, [r0]
	b _0804AB46
	.align 2, 0
_0804AB2C: .4byte gBattlerTarget
_0804AB30: .4byte gSprites
_0804AB34: .4byte SpriteCB_OpponentMonSendOut
_0804AB38:
	movs r0, 0x1
	bl GetBattlerAtPosition
	ldr r1, _0804AB64 @ =gBattlerTarget
	strb r0, [r1]
	movs r2, 0x1
	str r2, [sp, 0x4]
_0804AB46:
	adds r3, r5, 0
_0804AB48:
	ldr r0, _0804AB68 @ =gSprites
	adds r1, r3, r7
	lsls r1, 2
	adds r4, r1, r0
	ldr r5, _0804AB64 @ =gBattlerTarget
	ldrb r0, [r5]
	strh r0, [r4, 0x3A]
	ldr r3, [sp, 0x4]
	cmp r3, 0
	bne _0804AB6C
	ldr r0, [sp]
	bl DestroyTask
	b _0804ABB8
	.align 2, 0
_0804AB64: .4byte gBattlerTarget
_0804AB68: .4byte gSprites
_0804AB6C:
	movs r0, 0x22
	strh r0, [r4, 0x2E]
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x10
	strh r0, [r4, 0x36]
	ldr r0, _0804ABC8 @ =0x0000ffd8
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_8075068
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x6]
	ldr r1, _0804ABCC @ =gTasks
	ldr r2, [sp]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r5]
	strh r1, [r0, 0x10]
	ldr r1, _0804ABD0 @ =TaskDummy
	str r1, [r0]
	movs r0, 0x36
	bl PlaySE
_0804ABB8:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804ABC8: .4byte 0x0000ffd8
_0804ABCC: .4byte gTasks
_0804ABD0: .4byte TaskDummy
	thumb_func_end sub_804A9A0

	thumb_func_start SpriteCB_TestBallThrow
SpriteCB_TestBallThrow: @ 804ABD4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r7, r0, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _0804AC74
	ldrb r6, [r7, 0x6]
	ldr r1, _0804AC80 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldrb r5, [r0, 0x10]
	ldrb r0, [r0, 0xC]
	mov r8, r0
	adds r0, r7, 0
	movs r1, 0x1
	bl StartSpriteAnim
	adds r2, r7, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r7, 0x24]
	ldrh r1, [r7, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r7, 0x20]
	ldrh r0, [r7, 0x26]
	ldrh r2, [r7, 0x22]
	adds r0, r2
	strh r0, [r7, 0x22]
	strh r1, [r7, 0x24]
	strh r1, [r7, 0x26]
	strh r1, [r7, 0x38]
	adds r0, r5, 0
	bl GetBankPokeballItemId
	lsls r0, 16
	lsrs r0, 16
	bl ItemIdToBallId
	adds r4, r0, 0
	ldrh r0, [r7, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r7, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp]
	movs r2, 0x1
	movs r3, 0x1C
	bl LaunchBallStarsTask
	movs r0, 0
	adds r1, r5, 0
	movs r2, 0xE
	adds r3, r4, 0
	bl LaunchBallFadeMonTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x2E]
	strh r5, [r7, 0x3A]
	mov r0, r8
	strh r0, [r7, 0x3C]
	adds r0, r6, 0
	bl DestroyTask
	ldr r0, _0804AC84 @ =sub_804AC88
	str r0, [r7, 0x1C]
_0804AC74:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AC80: .4byte gTasks
_0804AC84: .4byte sub_804AC88
	thumb_func_end SpriteCB_TestBallThrow

	thumb_func_start sub_804AC88
sub_804AC88: @ 804AC88
	ldr r1, _0804AC90 @ =sub_804AC94
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_0804AC90: .4byte sub_804AC94
	thumb_func_end sub_804AC88

	thumb_func_start sub_804AC94
sub_804AC94: @ 804AC94
	push {r4-r7,lr}
	adds r6, r0, 0
	ldrh r0, [r6, 0x38]
	adds r0, 0x1
	movs r7, 0
	strh r0, [r6, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _0804ACEE
	strh r7, [r6, 0x38]
	ldr r0, _0804ACF4 @ =sub_804AD00
	str r0, [r6, 0x1C]
	ldr r5, _0804ACF8 @ =gUnknown_2023D44
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0804ACFC @ =gSprites
	adds r0, r4
	movs r1, 0x2
	bl StartSpriteAffineAnim
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl AnimateSprite
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r7, [r0, 0x30]
_0804ACEE:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804ACF4: .4byte sub_804AD00
_0804ACF8: .4byte gUnknown_2023D44
_0804ACFC: .4byte gSprites
	thumb_func_end sub_804AC94

	thumb_func_start sub_804AD00
sub_804AD00: @ 804AD00
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	bne _0804AD18
	movs r0, 0x35
	bl PlaySE
_0804AD18:
	ldr r6, _0804AD64 @ =gSprites
	ldr r5, _0804AD68 @ =gUnknown_2023D44
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r6
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _0804AD70
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0
	strh r0, [r4, 0x38]
	ldr r0, _0804AD6C @ =sub_804AD98
	str r0, [r4, 0x1C]
	b _0804AD90
	.align 2, 0
_0804AD64: .4byte gSprites
_0804AD68: .4byte gUnknown_2023D44
_0804AD6C: .4byte sub_804AD98
_0804AD70:
	ldrh r0, [r1, 0x30]
	adds r0, 0x60
	strh r0, [r1, 0x30]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	adds r0, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r2, 0x30
	ldrsh r0, [r1, r2]
	negs r0, r0
	asrs r0, 8
	strh r0, [r1, 0x26]
_0804AD90:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_804AD00

	thumb_func_start sub_804AD98
sub_804AD98: @ 804AD98
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0804ADE0
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _0804ADE0
	strh r1, [r4, 0x34]
	movs r0, 0x20
	strh r0, [r4, 0x36]
	strh r1, [r4, 0x38]
	movs r0, 0
	movs r1, 0x20
	bl Cos
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl Cos
	negs r0, r0
	strh r0, [r4, 0x26]
	ldr r0, _0804ADE8 @ =sub_804ADEC
	str r0, [r4, 0x1C]
_0804ADE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804ADE8: .4byte sub_804ADEC
	thumb_func_end sub_804AD98

	thumb_func_start sub_804ADEC
sub_804ADEC: @ 804ADEC
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0
	ldrh r0, [r4, 0x34]
	movs r1, 0xFF
	ands r1, r0
	cmp r1, 0
	beq _0804AE02
	cmp r1, 0x1
	beq _0804AE76
	b _0804AEA2
_0804AE02:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl Cos
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x38]
	adds r1, 0x4
	ldrh r2, [r4, 0x34]
	lsls r0, r2, 16
	asrs r0, 24
	adds r1, r0
	strh r1, [r4, 0x38]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x3F
	ble _0804AEA2
	ldrh r0, [r4, 0x36]
	subs r0, 0xA
	strh r0, [r4, 0x36]
	ldr r1, _0804AE4C @ =0x00000101
	adds r0, r2, r1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 24
	cmp r0, 0x4
	bne _0804AE3E
	movs r5, 0x1
_0804AE3E:
	cmp r0, 0x2
	beq _0804AE5E
	cmp r0, 0x2
	bgt _0804AE50
	cmp r0, 0x1
	beq _0804AE56
	b _0804AE6E
	.align 2, 0
_0804AE4C: .4byte 0x00000101
_0804AE50:
	cmp r0, 0x3
	beq _0804AE66
	b _0804AE6E
_0804AE56:
	movs r0, 0x31
	bl PlaySE
	b _0804AEA2
_0804AE5E:
	movs r0, 0x32
	bl PlaySE
	b _0804AEA2
_0804AE66:
	movs r0, 0x33
	bl PlaySE
	b _0804AEA2
_0804AE6E:
	movs r0, 0x34
	bl PlaySE
	b _0804AEA2
_0804AE76:
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl Cos
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x38]
	subs r1, 0x4
	ldrh r2, [r4, 0x34]
	lsls r0, r2, 16
	asrs r0, 24
	subs r1, r0
	strh r1, [r4, 0x38]
	lsls r1, 16
	cmp r1, 0
	bgt _0804AEA2
	strh r5, [r4, 0x38]
	ldr r0, _0804AEC8 @ =0xffffff00
	ands r0, r2
	strh r0, [r4, 0x34]
_0804AEA2:
	cmp r5, 0
	beq _0804AEDA
	movs r5, 0
	strh r5, [r4, 0x34]
	movs r0, 0x40
	movs r1, 0x20
	bl Cos
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r5, [r4, 0x26]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0804AED0
	ldr r0, _0804AECC @ =sub_804B268
	str r0, [r4, 0x1C]
	b _0804AEDA
	.align 2, 0
_0804AEC8: .4byte 0xffffff00
_0804AECC: .4byte sub_804B268
_0804AED0:
	ldr r0, _0804AEE0 @ =sub_804AEE4
	str r0, [r4, 0x1C]
	movs r0, 0x1
	strh r0, [r4, 0x36]
	strh r5, [r4, 0x38]
_0804AEDA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804AEE0: .4byte sub_804AEE4
	thumb_func_end sub_804ADEC

	thumb_func_start sub_804AEE4
sub_804AEE4: @ 804AEE4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _0804AF18
	movs r0, 0
	strh r0, [r4, 0x34]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r0, _0804AF20 @ =sub_804AF24
	str r0, [r4, 0x1C]
	movs r0, 0x17
	bl PlaySE
_0804AF18:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804AF20: .4byte sub_804AF24
	thumb_func_end sub_804AEE4

	thumb_func_start sub_804AF24
sub_804AF24: @ 804AF24
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x34]
	movs r1, 0xFF
	ands r1, r0
	cmp r1, 0x4
	bhi _0804B024
	lsls r0, r1, 2
	ldr r1, _0804AF3C @ =_0804AF40
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804AF3C: .4byte _0804AF40
	.align 2, 0
_0804AF40:
	.4byte _0804AF54
	.4byte _0804AF86
	.4byte _0804AF54
	.4byte _0804AFDA
	.4byte _0804B024
_0804AF54:
	ldrh r0, [r4, 0x36]
	ldrh r2, [r4, 0x24]
	adds r1, r0, r2
	strh r1, [r4, 0x24]
	ldrh r1, [r4, 0x38]
	adds r0, r1
	strh r0, [r4, 0x38]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x38]
	adds r0, 0x3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x6
	bls _0804B06A
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	movs r0, 0
	strh r0, [r4, 0x38]
	b _0804B06A
_0804AF86:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _0804AFCC
	movs r0, 0
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x36]
	negs r0, r0
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bge _0804AFC2
	adds r0, r4, 0
	movs r1, 0x2
	bl ChangeSpriteAffineAnim
	b _0804B06A
_0804AFC2:
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
	b _0804B06A
_0804AFCC:
	adds r0, r4, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	b _0804B06A
_0804AFDA:
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1, 0
	ldrh r2, [r4, 0x34]
	adds r0, r2
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 24
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _0804AFFC
	ldr r0, _0804AFF8 @ =sub_804B268
	str r0, [r4, 0x1C]
	b _0804B06A
	.align 2, 0
_0804AFF8: .4byte sub_804B268
_0804AFFC:
	cmp r1, 0x4
	bne _0804B010
	cmp r0, 0x3
	bne _0804B010
	ldr r0, _0804B00C @ =sub_804B484
	str r0, [r4, 0x1C]
	b _0804B016
	.align 2, 0
_0804B00C: .4byte sub_804B484
_0804B010:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
_0804B016:
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	b _0804B06A
_0804B024:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _0804B06A
	movs r0, 0
	strh r0, [r4, 0x38]
	ldrh r1, [r4, 0x34]
	ldr r0, _0804B058 @ =0xffffff00
	ands r0, r1
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAffineAnim
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _0804B05C
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	b _0804B064
	.align 2, 0
_0804B058: .4byte 0xffffff00
_0804B05C:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_0804B064:
	movs r0, 0x17
	bl PlaySE
_0804B06A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804AF24

	thumb_func_start Task_PlayCryWhenReleasedFromBall
Task_PlayCryWhenReleasedFromBall: @ 804B070
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _0804B0A4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r2
	ldrb r7, [r0, 0xC]
	ldrb r5, [r0, 0xA]
	ldrh r6, [r0, 0x8]
	movs r3, 0xE
	ldrsh r1, [r0, r3]
	lsls r3, r1, 16
	ldrh r1, [r0, 0x10]
	orrs r3, r1
	movs r1, 0x26
	ldrsh r0, [r0, r1]
	cmp r0, 0x20
	bhi _0804B130
	lsls r0, 2
	ldr r1, _0804B0A8 @ =_0804B0AC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804B0A4: .4byte gTasks
_0804B0A8: .4byte _0804B0AC
	.align 2, 0
_0804B0AC:
	.4byte _0804B130
	.4byte _0804B14E
	.4byte _0804B174
	.4byte _0804B1CE
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B190
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B130
	.4byte _0804B1E0
	.4byte _0804B1F8
	.4byte _0804B220
_0804B130:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r2
	ldrh r2, [r1, 0x18]
	movs r3, 0x18
	ldrsh r0, [r1, r3]
	cmp r0, 0x2
	bgt _0804B148
	adds r0, r2, 0x1
	strh r0, [r1, 0x18]
	b _0804B262
_0804B148:
	adds r0, r7, 0x1
	strh r0, [r1, 0x26]
	b _0804B262
_0804B14E:
	adds r0, r3, 0
	bl ShouldPlayNormalPokeCry
	cmp r0, 0x1
	bne _0804B166
	lsls r1, r5, 24
	asrs r1, 24
	adds r0, r6, 0
	movs r2, 0
	bl PlayCry3
	b _0804B1C6
_0804B166:
	lsls r1, r5, 24
	asrs r1, 24
	adds r0, r6, 0
	movs r2, 0xB
	bl PlayCry3
	b _0804B1C6
_0804B174:
	bl StopCryAndClearCrySongs
	ldr r1, _0804B18C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x3
	strh r1, [r0, 0x1C]
	movs r1, 0x14
	strh r1, [r0, 0x26]
	b _0804B262
	.align 2, 0
_0804B18C: .4byte gTasks
_0804B190:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r2
	ldrh r2, [r1, 0x1C]
	movs r7, 0x1C
	ldrsh r0, [r1, r7]
	cmp r0, 0
	bne _0804B232
	adds r0, r3, 0
	bl ShouldPlayNormalPokeCry
	cmp r0, 0x1
	bne _0804B1BA
	lsls r1, r5, 24
	asrs r1, 24
	adds r0, r6, 0
	movs r2, 0x1
	bl PlayCry4
	b _0804B1C6
_0804B1BA:
	lsls r1, r5, 24
	asrs r1, 24
	adds r0, r6, 0
	movs r2, 0xC
	bl PlayCry4
_0804B1C6:
	adds r0, r4, 0
	bl DestroyTask
	b _0804B262
_0804B1CE:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r2
	movs r1, 0x6
	strh r1, [r0, 0x1C]
	movs r1, 0x1E
	strh r1, [r0, 0x26]
	b _0804B262
_0804B1E0:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r2
	ldrh r2, [r1, 0x1C]
	movs r3, 0x1C
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _0804B232
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
_0804B1F8:
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	bne _0804B262
	bl StopCryAndClearCrySongs
	ldr r0, _0804B21C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x3
	strh r0, [r1, 0x1C]
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _0804B262
	.align 2, 0
_0804B21C: .4byte gTasks
_0804B220:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r2
	ldrh r2, [r1, 0x1C]
	movs r7, 0x1C
	ldrsh r0, [r1, r7]
	cmp r0, 0
	beq _0804B238
_0804B232:
	subs r0, r2, 0x1
	strh r0, [r1, 0x1C]
	b _0804B262
_0804B238:
	adds r0, r3, 0
	bl ShouldPlayNormalPokeCry
	cmp r0, 0x1
	bne _0804B250
	lsls r1, r5, 24
	asrs r1, 24
	adds r0, r6, 0
	movs r2, 0
	bl PlayCry4
	b _0804B25C
_0804B250:
	lsls r1, r5, 24
	asrs r1, 24
	adds r0, r6, 0
	movs r2, 0xB
	bl PlayCry4
_0804B25C:
	adds r0, r4, 0
	bl DestroyTask
_0804B262:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end Task_PlayCryWhenReleasedFromBall

	thumb_func_start sub_804B268
sub_804B268: @ 804B268
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r6, r0, 0
	ldrh r0, [r6, 0x3A]
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r6, 0
	movs r1, 0x1
	bl StartSpriteAnim
	adds r0, r5, 0
	bl GetBankPokeballItemId
	lsls r0, 16
	lsrs r0, 16
	bl ItemIdToBallId
	adds r4, r0, 0
	ldrh r0, [r6, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp]
	movs r2, 0x1
	movs r3, 0x1C
	bl LaunchBallStarsTask
	ldrh r1, [r6, 0x3A]
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x1
	movs r2, 0xE
	adds r3, r4, 0
	bl LaunchBallFadeMonTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x2E]
	ldr r0, _0804B2FC @ =HandleBallAnimEnd
	str r0, [r6, 0x1C]
	ldr r0, _0804B300 @ =gMain
	ldr r1, _0804B304 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0804B2DA
	b _0804B420
_0804B2DA:
	adds r0, r5, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _0804B310
	ldr r1, _0804B308 @ =gBattlerPartyIndexes
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0804B30C @ =gEnemyParty
	adds r7, r1, r0
	movs r3, 0x19
	mov r9, r3
	b _0804B324
	.align 2, 0
_0804B2FC: .4byte HandleBallAnimEnd
_0804B300: .4byte gMain
_0804B304: .4byte 0x00000439
_0804B308: .4byte gBattlerPartyIndexes
_0804B30C: .4byte gEnemyParty
_0804B310:
	ldr r1, _0804B388 @ =gBattlerPartyIndexes
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0804B38C @ =gPlayerParty
	adds r7, r1, r0
	movs r0, 0xE7
	mov r9, r0
_0804B324:
	adds r0, r7, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	movs r0, 0
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	beq _0804B34E
	movs r0, 0x1
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bne _0804B3A6
_0804B34E:
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _0804B3A6
	ldr r0, _0804B390 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	ldrb r1, [r0, 0x9]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0804B3A6
	ldr r0, _0804B394 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0804B39C
	bl IsBGMPlaying
	lsls r0, 24
	cmp r0, 0
	beq _0804B3A6
	ldr r0, _0804B398 @ =gMPlayInfo_BGM
	bl m4aMPlayStop
	b _0804B3A6
	.align 2, 0
_0804B388: .4byte gBattlerPartyIndexes
_0804B38C: .4byte gPlayerParty
_0804B390: .4byte gUnknown_2024018
_0804B394: .4byte gBattleTypeFlags
_0804B398: .4byte gMPlayInfo_BGM
_0804B39C:
	ldr r0, _0804B3C4 @ =gMPlayInfo_BGM
	ldr r1, _0804B3C8 @ =0x0000ffff
	movs r2, 0x80
	bl m4aMPlayVolumeControl
_0804B3A6:
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _0804B3C0
	ldr r0, _0804B3CC @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	ldrb r1, [r0, 0x9]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0804B3D0
_0804B3C0:
	movs r4, 0
	b _0804B3F2
	.align 2, 0
_0804B3C4: .4byte gMPlayInfo_BGM
_0804B3C8: .4byte 0x0000ffff
_0804B3CC: .4byte gUnknown_2024018
_0804B3D0:
	movs r0, 0
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	beq _0804B3EC
	movs r0, 0x1
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bne _0804B3F0
_0804B3EC:
	movs r4, 0x1
	b _0804B3F2
_0804B3F0:
	movs r4, 0x2
_0804B3F2:
	ldr r0, _0804B474 @ =Task_PlayCryWhenReleasedFromBall
	movs r1, 0x3
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0804B478 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	mov r3, r8
	strh r3, [r1, 0x8]
	mov r3, r9
	lsls r0, r3, 24
	asrs r0, 24
	strh r0, [r1, 0xA]
	strh r4, [r1, 0xC]
	lsrs r0, r7, 16
	strh r0, [r1, 0xE]
	strh r7, [r1, 0x10]
	strh r2, [r1, 0x26]
_0804B420:
	ldr r5, _0804B47C @ =gUnknown_2023D44
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0804B480 @ =gSprites
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAffineAnim
	movs r3, 0x3A
	ldrsh r0, [r6, r3]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl AnimateSprite
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x80
	lsls r1, 5
	strh r1, [r0, 0x30]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B474: .4byte Task_PlayCryWhenReleasedFromBall
_0804B478: .4byte gTasks
_0804B47C: .4byte gUnknown_2023D44
_0804B480: .4byte gSprites
	thumb_func_end sub_804B268

	thumb_func_start sub_804B484
sub_804B484: @ 804B484
	adds r3, r0, 0
	adds r3, 0x2C
	ldrb r1, [r3]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _0804B4A0 @ =sub_804B5C8
	str r1, [r0, 0x1C]
	movs r1, 0
	strh r1, [r0, 0x34]
	strh r1, [r0, 0x36]
	strh r1, [r0, 0x38]
	bx lr
	.align 2, 0
_0804B4A0: .4byte sub_804B5C8
	thumb_func_end sub_804B484

	thumb_func_start HandleBallAnimEnd
HandleBallAnimEnd: @ 804B4A4
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r7, 0
	ldrh r0, [r5, 0x3A]
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r4, _0804B508 @ =gSprites
	ldr r0, _0804B50C @ =gUnknown_2023D44
	adds r3, r6, r0
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0804B4E6
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_0804B4E6:
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _0804B510
	adds r0, r1, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	movs r7, 0x1
	b _0804B52C
	.align 2, 0
_0804B508: .4byte gSprites
_0804B50C: .4byte gUnknown_2023D44
_0804B510:
	ldr r2, _0804B5B4 @ =0xfffffee0
	adds r0, r2, 0
	ldrh r2, [r1, 0x30]
	adds r0, r2
	strh r0, [r1, 0x30]
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r1, 0x26]
_0804B52C:
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0804B5AE
	cmp r7, 0
	beq _0804B5AE
	ldr r2, _0804B5B8 @ =gSprites
	ldr r0, _0804B5BC @ =gUnknown_2023D44
	adds r0, r6, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r2, 0
	movs r1, 0
	strh r1, [r0, 0x26]
	ldr r0, _0804B5C0 @ =gUnknown_2024005
	strb r2, [r0]
	ldr r4, _0804B5C4 @ =gUnknown_2024018
	ldr r0, [r4]
	ldr r0, [r0, 0x4]
	lsls r1, r6, 1
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x9
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	adds r0, r5, 0
	bl FreeSpriteOamMatrix
	adds r0, r5, 0
	bl DestroySprite
	movs r3, 0
	ldr r0, [r4]
	ldr r2, [r0, 0x4]
	movs r5, 0x8
	movs r4, 0x3
_0804B586:
	ldrb r1, [r2]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _0804B592
	adds r3, 0x1
_0804B592:
	adds r2, 0xC
	subs r4, 0x1
	cmp r4, 0
	bge _0804B586
	cmp r3, 0x4
	bne _0804B5AE
	movs r4, 0
_0804B5A0:
	lsls r0, r4, 24
	lsrs r0, 24
	bl FreeBallGfx
	adds r4, 0x1
	cmp r4, 0xB
	ble _0804B5A0
_0804B5AE:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B5B4: .4byte 0xfffffee0
_0804B5B8: .4byte gSprites
_0804B5BC: .4byte gUnknown_2023D44
_0804B5C0: .4byte gUnknown_2024005
_0804B5C4: .4byte gUnknown_2024018
	thumb_func_end HandleBallAnimEnd

	thumb_func_start sub_804B5C8
sub_804B5C8: @ 804B5C8
	push {r4-r7,lr}
	adds r6, r0, 0
	ldrh r0, [r6, 0x3A]
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r6, 0x36]
	adds r0, 0x1
	strh r0, [r6, 0x36]
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0x28
	beq _0804B666
	cmp r1, 0x5F
	bne _0804B600
	ldr r0, _0804B5F8 @ =gUnknown_2024005
	movs r1, 0
	strb r1, [r0]
	bl m4aMPlayAllStop
	ldr r0, _0804B5FC @ =0x0000013f
	bl PlaySE
	b _0804B666
	.align 2, 0
_0804B5F8: .4byte gUnknown_2024005
_0804B5FC: .4byte 0x0000013f
_0804B600:
	ldr r0, _0804B66C @ =0x0000013b
	cmp r1, r0
	bne _0804B666
	ldr r5, _0804B670 @ =gSprites
	ldr r4, _0804B674 @ =gUnknown_2023D44
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	adds r0, r6, 0
	bl DestroySpriteAndFreeResources
	ldr r0, _0804B678 @ =gMain
	ldr r1, _0804B67C @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0804B666
	ldr r0, _0804B680 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0, 0x4]
	lsls r1, r7, 1
	adds r1, r7
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x9
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
_0804B666:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B66C: .4byte 0x0000013b
_0804B670: .4byte gSprites
_0804B674: .4byte gUnknown_2023D44
_0804B678: .4byte gMain
_0804B67C: .4byte 0x00000439
_0804B680: .4byte gUnknown_2024018
	thumb_func_end sub_804B5C8

	thumb_func_start SpriteCB_PlayerMonSendOut_1
SpriteCB_PlayerMonSendOut_1: @ 804B684
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x19
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x18
	strh r0, [r4, 0x36]
	ldr r0, _0804B6CC @ =0x0000ffe2
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x3A]
	strh r0, [r4, 0x6]
	adds r0, r4, 0
	bl sub_8075068
	ldr r0, _0804B6D0 @ =SpriteCB_PlayerMonSendOut_2
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B6CC: .4byte 0x0000ffe2
_0804B6D0: .4byte SpriteCB_PlayerMonSendOut_2
	thumb_func_end SpriteCB_PlayerMonSendOut_1

	thumb_func_start SpriteCB_PlayerMonSendOut_2
SpriteCB_PlayerMonSendOut_2: @ 804B6D4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	ldrh r0, [r5, 0x3C]
	movs r1, 0xFF
	mov r8, r1
	lsrs r0, 8
	subs r0, 0x23
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2C
	bhi _0804B7C8
	ldrh r1, [r5, 0x6]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	bne _0804B736
	ldrh r0, [r5, 0x30]
	movs r1, 0x1
	adds r6, r1, 0
	ands r6, r0
	ldrh r0, [r5, 0x32]
	adds r7, r1, 0
	ands r7, r0
	movs r2, 0x30
	ldrsh r0, [r5, r2]
	movs r1, 0x3
	bl __divsi3
	movs r1, 0x2
	negs r1, r1
	adds r4, r1, 0
	ands r0, r4
	orrs r6, r0
	strh r6, [r5, 0x30]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	movs r1, 0x3
	bl __divsi3
	ands r0, r4
	orrs r7, r0
	strh r7, [r5, 0x32]
	adds r0, r5, 0
	movs r1, 0x4
	bl StartSpriteAffineAnim
_0804B736:
	ldrh r4, [r5, 0x2E]
	adds r0, r5, 0
	bl sub_80755E0
	movs r1, 0x3A
	ldrsh r0, [r5, r1]
	movs r1, 0x3
	bl __divsi3
	adds r1, r0, 0
	ldrh r0, [r5, 0x3C]
	adds r0, r1
	strh r0, [r5, 0x3C]
	lsls r0, 16
	asrs r0, 24
	mov r2, r8
	ands r0, r2
	movs r2, 0x38
	ldrsh r1, [r5, r2]
	bl Sin
	ldrh r1, [r5, 0x26]
	adds r0, r1
	strh r0, [r5, 0x26]
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	ldrh r1, [r5, 0x6]
	adds r0, r1
	strh r0, [r5, 0x6]
	lsls r0, 16
	lsrs r0, 24
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	beq _0804B786
	strh r4, [r5, 0x2E]
	b _0804B78E
_0804B786:
	lsls r0, r4, 16
	asrs r0, 16
	subs r0, 0x1
	strh r0, [r5, 0x2E]
_0804B78E:
	ldrh r0, [r5, 0x3C]
	lsrs r0, 8
	cmp r0, 0x4F
	ble _0804B834
	ldrh r0, [r5, 0x30]
	movs r1, 0x1
	adds r6, r1, 0
	ands r6, r0
	ldrh r0, [r5, 0x32]
	adds r7, r1, 0
	ands r7, r0
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	lsls r0, r1, 1
	adds r0, r1
	movs r1, 0x2
	negs r1, r1
	adds r2, r1, 0
	ands r0, r2
	orrs r0, r6
	strh r0, [r5, 0x30]
	movs r0, 0x32
	ldrsh r1, [r5, r0]
	lsls r0, r1, 1
	adds r0, r1
	ands r0, r2
	orrs r0, r7
	strh r0, [r5, 0x32]
	b _0804B834
_0804B7C8:
	adds r0, r5, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _0804B834
	ldrh r0, [r5, 0x24]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r1, [r5, 0x26]
	strh r1, [r5, 0x24]
	ldrb r0, [r5, 0x6]
	strh r0, [r5, 0x3A]
	strh r1, [r5, 0x2E]
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _0804B828
	ldr r0, _0804B820 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	ldrb r1, [r0, 0x9]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0804B828
	movs r0, 0x3A
	ldrsh r4, [r5, r0]
	movs r0, 0x2
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _0804B828
	ldr r0, _0804B824 @ =SpriteCB_ReleaseMon2FromBall
	b _0804B82A
	.align 2, 0
_0804B820: .4byte gUnknown_2024018
_0804B824: .4byte SpriteCB_ReleaseMon2FromBall
_0804B828:
	ldr r0, _0804B840 @ =sub_804B268
_0804B82A:
	str r0, [r5, 0x1C]
	adds r0, r5, 0
	movs r1, 0
	bl StartSpriteAffineAnim
_0804B834:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B840: .4byte sub_804B268
	thumb_func_end SpriteCB_PlayerMonSendOut_2

	thumb_func_start SpriteCB_ReleaseMon2FromBall
SpriteCB_ReleaseMon2FromBall: @ 804B844
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r1, r0, 0x1
	strh r1, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x18
	ble _0804B85E
	movs r0, 0
	strh r0, [r2, 0x2E]
	ldr r0, _0804B864 @ =sub_804B268
	str r0, [r2, 0x1C]
_0804B85E:
	pop {r0}
	bx r0
	.align 2, 0
_0804B864: .4byte sub_804B268
	thumb_func_end SpriteCB_ReleaseMon2FromBall

	thumb_func_start SpriteCB_OpponentMonSendOut
SpriteCB_OpponentMonSendOut: @ 804B868
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _0804B8BC
	movs r0, 0
	strh r0, [r5, 0x2E]
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _0804B8B8
	ldr r0, _0804B8B0 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	ldrb r1, [r0, 0x9]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0804B8B8
	movs r0, 0x3A
	ldrsh r4, [r5, r0]
	movs r0, 0x3
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _0804B8B8
	ldr r0, _0804B8B4 @ =SpriteCB_ReleaseMon2FromBall
	b _0804B8BA
	.align 2, 0
_0804B8B0: .4byte gUnknown_2024018
_0804B8B4: .4byte SpriteCB_ReleaseMon2FromBall
_0804B8B8:
	ldr r0, _0804B8C4 @ =sub_804B268
_0804B8BA:
	str r0, [r5, 0x1C]
_0804B8BC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804B8C4: .4byte sub_804B268
	thumb_func_end SpriteCB_OpponentMonSendOut

	thumb_func_start LaunchBallStarsTaskForPokeball
LaunchBallStarsTaskForPokeball: @ 804B8C8
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	movs r4, 0
	str r4, [sp]
	bl LaunchBallStarsTask
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end LaunchBallStarsTaskForPokeball

	thumb_func_start LaunchBallFadeMonTaskForPokeball
LaunchBallFadeMonTaskForPokeball: @ 804B8F0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0
	bl LaunchBallFadeMonTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end LaunchBallFadeMonTaskForPokeball

	thumb_func_start CreatePokeballSpriteToReleaseMon
CreatePokeballSpriteToReleaseMon: @ 804B908
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r5, r0, 0
	mov r9, r2
	mov r10, r3
	ldr r6, [sp, 0x24]
	ldr r4, [sp, 0x28]
	ldr r0, [sp, 0x2C]
	lsls r5, 24
	lsrs r5, 24
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	mov r1, r9
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	mov r2, r10
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0804B9D4 @ =gUnknown_826056C
	bl sub_800F034
	ldr r0, _0804B9D8 @ =gUnknown_82605CC
	bl sub_800F078
	ldr r0, _0804B9DC @ =gUnknown_82606F4
	mov r1, r9
	mov r2, r10
	adds r3, r4, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0804B9E0 @ =gSprites
	mov r8, r3
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r1, r4, r3
	strh r5, [r1, 0x2E]
	lsls r2, r5, 4
	adds r2, r5
	lsls r2, 2
	add r2, r8
	ldrh r0, [r2, 0x20]
	strh r0, [r1, 0x38]
	ldrh r0, [r2, 0x22]
	strh r0, [r1, 0x3A]
	mov r0, r9
	strh r0, [r2, 0x20]
	mov r3, r10
	strh r3, [r2, 0x22]
	strh r7, [r1, 0x30]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r1, 0x32]
	mov r3, sp
	ldrh r3, [r3, 0x30]
	strh r3, [r1, 0x34]
	ldr r3, [sp, 0x30]
	lsrs r0, r3, 16
	strh r0, [r1, 0x36]
	movs r0, 0x3
	ands r6, r0
	lsls r6, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r6
	strb r0, [r1, 0x5]
	movs r0, 0x1C
	add r8, r0
	add r4, r8
	ldr r0, _0804B9E4 @ =sub_804B9E8
	str r0, [r4]
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B9D4: .4byte gUnknown_826056C
_0804B9D8: .4byte gUnknown_82605CC
_0804B9DC: .4byte gUnknown_82606F4
_0804B9E0: .4byte gSprites
_0804B9E4: .4byte sub_804B9E8
	thumb_func_end CreatePokeballSpriteToReleaseMon

	thumb_func_start sub_804B9E8
sub_804B9E8: @ 804B9E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldrh r1, [r6, 0x30]
	movs r2, 0x30
	ldrsh r0, [r6, r2]
	cmp r0, 0
	bne _0804BA94
	ldrh r0, [r6, 0x2E]
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r6, 0x32]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrh r4, [r6, 0x34]
	ldrh r0, [r6, 0x36]
	lsls r0, 16
	orrs r4, r0
	adds r0, r6, 0
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r0, 0
	beq _0804BA22
	subs r0, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	b _0804BA24
_0804BA22:
	movs r5, 0
_0804BA24:
	adds r0, r6, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldrh r0, [r6, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r6, 0x5]
	lsls r2, 28
	lsrs r2, 30
	adds r3, r5, 0
	bl LaunchBallStarsTaskForPokeball
	movs r0, 0x1
	mov r1, r8
	adds r2, r4, 0
	bl LaunchBallFadeMonTaskForPokeball
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r6, 0x30]
	ldr r0, _0804BA8C @ =sub_804BAA4
	str r0, [r6, 0x1C]
	ldr r0, _0804BA90 @ =gSprites
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	adds r4, r0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	adds r0, r4, 0
	bl AnimateSprite
	movs r0, 0x80
	lsls r0, 5
	strh r0, [r4, 0x30]
	strh r5, [r6, 0x3C]
	b _0804BA98
	.align 2, 0
_0804BA8C: .4byte sub_804BAA4
_0804BA90: .4byte gSprites
_0804BA94:
	subs r0, r1, 0x1
	strh r0, [r6, 0x30]
_0804BA98:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_804B9E8

	thumb_func_start sub_804BAA4
sub_804BAA4: @ 804BAA4
	push {r4-r7,lr}
	adds r4, r0, 0
	movs r0, 0
	mov r12, r0
	movs r6, 0
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0804BACE
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_0804BACE:
	ldr r0, _0804BB5C @ =gSprites
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r5, r1, r0
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _0804BAF0
	adds r0, r5, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	movs r1, 0x1
	mov r12, r1
_0804BAF0:
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	movs r7, 0x20
	ldrsh r1, [r4, r7]
	subs r0, r1
	movs r1, 0x3C
	ldrsh r2, [r4, r1]
	muls r0, r2
	cmp r0, 0
	bge _0804BB06
	adds r0, 0x7F
_0804BB06:
	asrs r0, 7
	ldrh r7, [r4, 0x20]
	adds r0, r7
	lsls r0, 16
	lsrs r3, r0, 16
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	movs r7, 0x22
	ldrsh r1, [r4, r7]
	subs r0, r1
	muls r0, r2
	cmp r0, 0
	bge _0804BB22
	adds r0, 0x7F
_0804BB22:
	asrs r0, 7
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r3, [r5, 0x20]
	strh r0, [r5, 0x22]
	ldrh r2, [r4, 0x3C]
	movs r7, 0x3C
	ldrsh r0, [r4, r7]
	cmp r0, 0x7F
	bgt _0804BB64
	ldr r1, _0804BB60 @ =gUnknown_825E074
	lsls r0, r2, 24
	lsrs r0, 23
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _0804BB48
	adds r0, 0x7
_0804BB48:
	asrs r0, 3
	negs r0, r0
	lsls r0, 16
	lsrs r0, 16
	adds r1, r2, 0x4
	strh r1, [r4, 0x3C]
	strh r0, [r5, 0x24]
	strh r0, [r5, 0x26]
	b _0804BB72
	.align 2, 0
_0804BB5C: .4byte gSprites
_0804BB60: .4byte gUnknown_825E074
_0804BB64:
	ldrh r0, [r4, 0x38]
	strh r0, [r5, 0x20]
	ldrh r0, [r4, 0x3A]
	strh r0, [r5, 0x22]
	strh r6, [r5, 0x24]
	strh r6, [r5, 0x26]
	movs r6, 0x1
_0804BB72:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0804BB90
	mov r2, r12
	cmp r2, 0
	beq _0804BB90
	cmp r6, 0
	beq _0804BB90
	adds r0, r4, 0
	bl DestroySpriteAndFreeResources
_0804BB90:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_804BAA4

	thumb_func_start sub_804BB98
sub_804BB98: @ 804BB98
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r0
	adds r6, r2, 0
	mov r8, r3
	ldr r5, [sp, 0x20]
	ldr r4, [sp, 0x24]
	ldr r0, [sp, 0x28]
	mov r9, r0
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r6, 24
	lsrs r6, 24
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _0804BC3C @ =gUnknown_826056C
	bl sub_800F034
	ldr r0, _0804BC40 @ =gUnknown_82605CC
	bl sub_800F078
	ldr r0, _0804BC44 @ =gUnknown_82606F4
	adds r1, r6, 0
	mov r2, r8
	adds r3, r4, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _0804BC48 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r2, r3, r6
	mov r1, r10
	strh r1, [r2, 0x2E]
	mov r4, r9
	strh r4, [r2, 0x30]
	strh r7, [r2, 0x32]
	mov r1, sp
	ldrh r1, [r1, 0x2C]
	strh r1, [r2, 0x34]
	ldr r4, [sp, 0x2C]
	lsrs r1, r4, 16
	strh r1, [r2, 0x36]
	movs r1, 0x3
	ands r5, r1
	lsls r5, 2
	ldrb r4, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r4
	orrs r1, r5
	strb r1, [r2, 0x5]
	adds r6, 0x1C
	adds r3, r6
	ldr r1, _0804BC4C @ =sub_804BC50
	str r1, [r3]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804BC3C: .4byte gUnknown_826056C
_0804BC40: .4byte gUnknown_82605CC
_0804BC44: .4byte gUnknown_82606F4
_0804BC48: .4byte gSprites
_0804BC4C: .4byte sub_804BC50
	thumb_func_end sub_804BB98

	thumb_func_start sub_804BC50
sub_804BC50: @ 804BC50
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0804BCE8
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrh r5, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	lsls r0, 16
	orrs r5, r0
	adds r0, r4, 0
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r0, 0
	beq _0804BC8A
	subs r0, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	b _0804BC8C
_0804BC8A:
	movs r6, 0
_0804BC8C:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldrh r0, [r4, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r4, 0x5]
	lsls r2, 28
	lsrs r2, 30
	adds r3, r6, 0
	bl LaunchBallStarsTaskForPokeball
	movs r0, 0x1
	mov r1, r8
	adds r2, r5, 0
	bl LaunchBallFadeMonTaskForPokeball
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0x30]
	ldr r0, _0804BCE0 @ =sub_804BCF8
	str r0, [r4, 0x1C]
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	ldr r0, _0804BCE4 @ =gSprites
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	adds r0, r4, 0
	bl AnimateSprite
	strh r5, [r4, 0x30]
	b _0804BCEC
	.align 2, 0
_0804BCE0: .4byte sub_804BCF8
_0804BCE4: .4byte gSprites
_0804BCE8:
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
_0804BCEC:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_804BC50

	thumb_func_start sub_804BCF8
sub_804BCF8: @ 804BCF8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x38]
	adds r0, 0x1
	strh r0, [r5, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	bne _0804BD10
	movs r0, 0x35
	bl PlaySE
_0804BD10:
	ldrh r1, [r5, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0804BD4C @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _0804BD54
	adds r0, r5, 0
	movs r1, 0x2
	bl StartSpriteAnim
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0
	strh r0, [r5, 0x38]
	ldr r0, _0804BD50 @ =sub_804BD6C
	str r0, [r5, 0x1C]
	b _0804BD64
	.align 2, 0
_0804BD4C: .4byte gSprites
_0804BD50: .4byte sub_804BD6C
_0804BD54:
	ldrh r0, [r4, 0x30]
	adds r0, 0x60
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	negs r0, r0
	asrs r0, 8
	strh r0, [r4, 0x26]
_0804BD64:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_804BCF8

	thumb_func_start sub_804BD6C
sub_804BD6C: @ 804BD6C
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0804BD80
	ldr r0, _0804BD84 @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
_0804BD80:
	pop {r0}
	bx r0
	.align 2, 0
_0804BD84: .4byte SpriteCallbackDummy
	thumb_func_end sub_804BD6C

	thumb_func_start DestroySpriteAndFreeResources_
DestroySpriteAndFreeResources_: @ 804BD88
	push {lr}
	bl DestroySpriteAndFreeResources
	pop {r0}
	bx r0
	thumb_func_end DestroySpriteAndFreeResources_

	thumb_func_start sub_804BD94
sub_804BD94: @ 804BD94
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r0, _0804BE14 @ =gUnknown_3004FF0
	adds r0, r5, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r6, _0804BE18 @ =gSprites
	adds r4, r0, r6
	movs r1, 0
	movs r0, 0x5
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	movs r0, 0x73
	strh r0, [r4, 0x24]
	strh r1, [r4, 0x26]
	ldr r0, _0804BE1C @ =sub_804BE48
	str r0, [r4, 0x1C]
	adds r0, r5, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _0804BDE2
	ldrh r0, [r4, 0x2E]
	negs r0, r0
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	negs r0, r0
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x24]
	negs r0, r0
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x26]
	negs r0, r0
	strh r0, [r4, 0x26]
_0804BDE2:
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r6, 0
	adds r1, 0x1C
	adds r1, r0, r1
	adds r0, r6
	ldr r1, [r1]
	bl _call_via_r1
	adds r0, r5, 0
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0804BE0C
	ldr r0, _0804BE20 @ =sub_804BE24
	str r0, [r4, 0x1C]
_0804BE0C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804BE14: .4byte gUnknown_3004FF0
_0804BE18: .4byte gSprites
_0804BE1C: .4byte sub_804BE48
_0804BE20: .4byte sub_804BE24
	thumb_func_end sub_804BD94

	thumb_func_start sub_804BE24
sub_804BE24: @ 804BE24
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _0804BE3E
	movs r0, 0
	strh r0, [r1, 0x30]
	ldr r0, _0804BE44 @ =sub_804BE48
	str r0, [r1, 0x1C]
_0804BE3E:
	pop {r0}
	bx r0
	.align 2, 0
_0804BE44: .4byte sub_804BE48
	thumb_func_end sub_804BE24

	thumb_func_start sub_804BE48
sub_804BE48: @ 804BE48
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x24]
	ldrh r1, [r2, 0x2E]
	subs r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x26]
	ldrh r1, [r2, 0x30]
	subs r0, r1
	strh r0, [r2, 0x26]
	ldr r0, [r2, 0x24]
	cmp r0, 0
	bne _0804BE66
	ldr r0, _0804BE6C @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
_0804BE66:
	pop {r0}
	bx r0
	.align 2, 0
_0804BE6C: .4byte SpriteCallbackDummy
	thumb_func_end sub_804BE48

	thumb_func_start DoHitAnimHealthboxEffect
DoHitAnimHealthboxEffect: @ 804BE70
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _0804BEA8 @ =SpriteCB_HitAnimHealthoxEffect
	adds r0, r5, 0
	bl CreateInvisibleSpriteWithCallback
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0804BEAC @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r3, r1, r2
	movs r0, 0x1
	strh r0, [r3, 0x2E]
	ldr r0, _0804BEB0 @ =gUnknown_3004FF0
	adds r4, r0
	ldrb r0, [r4]
	strh r0, [r3, 0x30]
	adds r2, 0x1C
	adds r1, r2
	str r5, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804BEA8: .4byte SpriteCB_HitAnimHealthoxEffect
_0804BEAC: .4byte gSprites
_0804BEB0: .4byte gUnknown_3004FF0
	thumb_func_end DoHitAnimHealthboxEffect

	thumb_func_start SpriteCB_HitAnimHealthoxEffect
SpriteCB_HitAnimHealthoxEffect: @ 804BEB4
	push {lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0804BEF0 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrh r0, [r3, 0x2E]
	movs r2, 0
	strh r0, [r1, 0x26]
	ldrh r0, [r3, 0x2E]
	negs r0, r0
	strh r0, [r3, 0x2E]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _0804BEEC
	strh r2, [r1, 0x24]
	strh r2, [r1, 0x26]
	adds r0, r3, 0
	bl DestroySprite
_0804BEEC:
	pop {r0}
	bx r0
	.align 2, 0
_0804BEF0: .4byte gSprites
	thumb_func_end SpriteCB_HitAnimHealthoxEffect

	thumb_func_start LoadBallGfx
LoadBallGfx: @ 804BEF4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0804BF50 @ =gUnknown_826056C
	lsls r6, r4, 3
	adds r5, r6, r0
	ldrh r0, [r5, 0x6]
	bl GetSpriteTileStartByTag
	lsls r0, 16
	ldr r1, _0804BF54 @ =0xffff0000
	cmp r0, r1
	bne _0804BF1C
	adds r0, r5, 0
	bl sub_800F034
	ldr r0, _0804BF58 @ =gUnknown_82605CC
	adds r0, r6, r0
	bl sub_800F078
_0804BF1C:
	cmp r4, 0x6
	beq _0804BF48
	cmp r4, 0x6
	blt _0804BF2C
	cmp r4, 0xB
	bgt _0804BF2C
	cmp r4, 0xA
	bge _0804BF48
_0804BF2C:
	ldr r1, _0804BF50 @ =gUnknown_826056C
	lsls r0, r4, 3
	adds r0, r1
	ldrh r0, [r0, 0x6]
	bl GetSpriteTileStartByTag
	adds r1, r0, 0
	lsls r1, 16
	ldr r0, _0804BF5C @ =gUnknown_8D022E8
	lsrs r1, 11
	ldr r2, _0804BF60 @ =0x06010100
	adds r1, r2
	bl LZDecompressVram
_0804BF48:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804BF50: .4byte gUnknown_826056C
_0804BF54: .4byte 0xffff0000
_0804BF58: .4byte gUnknown_82605CC
_0804BF5C: .4byte gUnknown_8D022E8
_0804BF60: .4byte 0x06010100
	thumb_func_end LoadBallGfx

	thumb_func_start FreeBallGfx
FreeBallGfx: @ 804BF64
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	ldr r0, _0804BF88 @ =gUnknown_826056C
	lsrs r4, 21
	adds r0, r4, r0
	ldrh r0, [r0, 0x6]
	bl FreeSpriteTilesByTag
	ldr r0, _0804BF8C @ =gUnknown_82605CC
	adds r4, r0
	ldrh r0, [r4, 0x4]
	bl FreeSpritePaletteByTag
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BF88: .4byte gUnknown_826056C
_0804BF8C: .4byte gUnknown_82605CC
	thumb_func_end FreeBallGfx

	thumb_func_start GetBankPokeballItemId
GetBankPokeballItemId: @ 804BF90
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _0804BFBC
	ldr r1, _0804BFB4 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0804BFB8 @ =gEnemyParty
	b _0804BFCA
	.align 2, 0
_0804BFB4: .4byte gBattlerPartyIndexes
_0804BFB8: .4byte gEnemyParty
_0804BFBC:
	ldr r1, _0804BFDC @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0804BFE0 @ =gPlayerParty
_0804BFCA:
	adds r0, r1
	movs r1, 0x26
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0804BFDC: .4byte gBattlerPartyIndexes
_0804BFE0: .4byte gPlayerParty
	thumb_func_end GetBankPokeballItemId

	.align 2, 0 @ Don't pad with nop.
