	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start atkC1_hiddenpowercalc
atkC1_hiddenpowercalc: @ 802B678
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r2, _0802B760 @ =gBattleMons
	ldr r0, _0802B764 @ =gBattlerAttacker
	ldrb r1, [r0]
	movs r0, 0x58
	muls r1, r0
	adds r1, r2
	ldrb r0, [r1, 0x14]
	mov r9, r0
	mov r7, r9
	lsls r7, 27
	adds r0, r7, 0
	lsrs r0, 27
	mov r9, r0
	movs r4, 0x2
	mov r2, r9
	ands r2, r4
	asrs r2, 1
	ldrh r7, [r1, 0x14]
	mov r8, r7
	mov r0, r8
	lsls r0, 22
	lsrs r0, 27
	mov r8, r0
	ands r0, r4
	orrs r2, r0
	ldrb r6, [r1, 0x15]
	lsls r6, 25
	lsrs r6, 27
	adds r0, r6, 0
	ands r0, r4
	lsls r0, 1
	orrs r2, r0
	ldr r5, [r1, 0x14]
	lsls r5, 12
	lsrs r5, 27
	adds r0, r5, 0
	ands r0, r4
	lsls r0, 2
	orrs r2, r0
	ldrh r3, [r1, 0x16]
	lsls r3, 23
	lsrs r3, 27
	adds r0, r3, 0
	ands r0, r4
	lsls r0, 3
	orrs r2, r0
	ldrb r1, [r1, 0x17]
	lsls r1, 26
	lsrs r1, 27
	adds r0, r1, 0
	ands r0, r4
	lsls r0, 4
	orrs r2, r0
	movs r0, 0x1
	adds r4, r0, 0
	mov r7, r9
	ands r4, r7
	mov r7, r8
	ands r7, r0
	lsls r7, 1
	orrs r4, r7
	ands r6, r0
	lsls r6, 2
	orrs r4, r6
	ands r5, r0
	lsls r5, 3
	orrs r4, r5
	ands r3, r0
	lsls r3, 4
	orrs r4, r3
	ands r1, r0
	lsls r1, 5
	orrs r4, r1
	ldr r5, _0802B768 @ =gDynamicBasePower
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	movs r1, 0x3F
	bl __divsi3
	adds r0, 0x1E
	strh r0, [r5]
	ldr r6, _0802B76C @ =gBattleStruct
	ldr r5, [r6]
	lsls r0, r4, 4
	subs r0, r4
	movs r1, 0x3F
	bl __divsi3
	adds r0, 0x1
	strb r0, [r5, 0x13]
	ldr r1, [r6]
	ldrb r0, [r1, 0x13]
	cmp r0, 0x8
	bls _0802B742
	adds r0, 0x1
	strb r0, [r1, 0x13]
_0802B742:
	ldr r2, [r6]
	ldrb r0, [r2, 0x13]
	movs r1, 0xC0
	orrs r0, r1
	strb r0, [r2, 0x13]
	ldr r1, _0802B770 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B760: .4byte gBattleMons
_0802B764: .4byte gBattlerAttacker
_0802B768: .4byte gDynamicBasePower
_0802B76C: .4byte gBattleStruct
_0802B770: .4byte gBattlescriptCurrInstr
	thumb_func_end atkC1_hiddenpowercalc

	thumb_func_start atkC2_selectfirstvalidtarget
atkC2_selectfirstvalidtarget: @ 802B774
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _0802B7D0 @ =gBattlerTarget
	movs r1, 0
	strb r1, [r0]
	ldr r1, _0802B7D4 @ =gBattlersCount
	ldrb r1, [r1]
	adds r6, r0, 0
	ldr r0, _0802B7D8 @ =gBattlescriptCurrInstr
	mov r8, r0
	cmp r1, 0
	beq _0802B7BE
	adds r3, r6, 0
	ldr r0, _0802B7DC @ =gBattlerAttacker
	ldrb r5, [r0]
	ldr r0, _0802B7E0 @ =gBitTable
	mov r12, r0
	adds r4, r1, 0
	ldr r7, _0802B7E4 @ =gAbsentBattlerFlags
_0802B79C:
	ldrb r2, [r3]
	cmp r2, r5
	beq _0802B7B2
	ldrb r0, [r7]
	ldrb r1, [r6]
	lsls r1, 2
	add r1, r12
	ldr r1, [r1]
	ands r0, r1
	cmp r0, 0
	beq _0802B7BE
_0802B7B2:
	adds r0, r2, 0x1
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r4
	bcc _0802B79C
_0802B7BE:
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B7D0: .4byte gBattlerTarget
_0802B7D4: .4byte gBattlersCount
_0802B7D8: .4byte gBattlescriptCurrInstr
_0802B7DC: .4byte gBattlerAttacker
_0802B7E0: .4byte gBitTable
_0802B7E4: .4byte gAbsentBattlerFlags
	thumb_func_end atkC2_selectfirstvalidtarget

	thumb_func_start atkC3_trysetfutureattack
atkC3_trysetfutureattack: @ 802B7E8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	ldr r0, _0802B820 @ =gWishFutureKnock
	mov r8, r0
	ldr r7, _0802B824 @ =gBattlerTarget
	ldrb r1, [r7]
	adds r0, r1, r0
	ldrb r6, [r0]
	cmp r6, 0
	beq _0802B82C
	ldr r3, _0802B828 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802B8F6
	.align 2, 0
_0802B820: .4byte gWishFutureKnock
_0802B824: .4byte gBattlerTarget
_0802B828: .4byte gBattlescriptCurrInstr
_0802B82C:
	lsls r1, 1
	mov r0, r8
	adds r0, 0x18
	adds r1, r0
	ldr r2, _0802B8CC @ =gCurrentMove
	mov r9, r2
	ldrh r0, [r2]
	strh r0, [r1]
	mov r0, r8
	adds r0, 0x4
	ldrb r4, [r7]
	adds r0, r4
	ldr r5, _0802B8D0 @ =gBattlerAttacker
	ldrb r1, [r5]
	strb r1, [r0]
	ldrb r0, [r7]
	add r0, r8
	movs r1, 0x3
	strb r1, [r0]
	ldr r4, _0802B8D4 @ =gSideStatuses
	ldrb r0, [r7]
	bl GetBattlerPosition
	movs r1, 0x1
	mov r10, r1
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	ldrh r3, [r1]
	ldrb r0, [r5]
	movs r4, 0x58
	muls r0, r4
	ldr r2, _0802B8D8 @ =gBattleMons
	adds r0, r2
	ldrb r1, [r7]
	muls r1, r4
	adds r1, r2
	mov r4, r9
	ldrh r2, [r4]
	str r6, [sp]
	str r6, [sp, 0x4]
	ldrb r4, [r5]
	str r4, [sp, 0x8]
	ldrb r4, [r7]
	str r4, [sp, 0xC]
	bl CalculateBaseDamage
	ldrb r1, [r7]
	lsls r1, 2
	mov r2, r8
	adds r2, 0x8
	adds r1, r2
	str r0, [r1]
	ldr r1, _0802B8DC @ =gProtectStructs
	ldrb r0, [r5]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 28
	cmp r0, 0
	bge _0802B8BA
	ldrb r4, [r7]
	lsls r4, 2
	adds r4, r2
	ldr r1, [r4]
	lsls r0, r1, 4
	subs r0, r1
	movs r1, 0xA
	bl __divsi3
	str r0, [r4]
_0802B8BA:
	mov r0, r9
	ldrh r1, [r0]
	ldr r0, _0802B8E0 @ =0x00000161
	cmp r1, r0
	bne _0802B8E8
	ldr r0, _0802B8E4 @ =gBattleCommunication
	mov r1, r10
	strb r1, [r0, 0x5]
	b _0802B8EE
	.align 2, 0
_0802B8CC: .4byte gCurrentMove
_0802B8D0: .4byte gBattlerAttacker
_0802B8D4: .4byte gSideStatuses
_0802B8D8: .4byte gBattleMons
_0802B8DC: .4byte gProtectStructs
_0802B8E0: .4byte 0x00000161
_0802B8E4: .4byte gBattleCommunication
_0802B8E8:
	ldr r1, _0802B908 @ =gBattleCommunication
	movs r0, 0
	strb r0, [r1, 0x5]
_0802B8EE:
	ldr r1, _0802B90C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802B8F6:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B908: .4byte gBattleCommunication
_0802B90C: .4byte gBattlescriptCurrInstr
	thumb_func_end atkC3_trysetfutureattack

	thumb_func_start atkC4_trydobeatup
atkC4_trydobeatup: @ 802B910
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _0802B954 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	ldr r7, _0802B958 @ =gEnemyParty
	cmp r0, 0
	bne _0802B92A
	ldr r7, _0802B95C @ =gPlayerParty
_0802B92A:
	ldr r2, _0802B960 @ =gBattleMons
	ldr r0, _0802B964 @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _0802B96C
	ldr r3, _0802B968 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	b _0802BB08
	.align 2, 0
_0802B954: .4byte gBattlerAttacker
_0802B958: .4byte gEnemyParty
_0802B95C: .4byte gPlayerParty
_0802B960: .4byte gBattleMons
_0802B964: .4byte gBattlerTarget
_0802B968: .4byte gBattlescriptCurrInstr
_0802B96C:
	ldr r6, _0802BAA8 @ =gBattleCommunication
	ldrb r0, [r6]
	mov r8, r0
	cmp r0, 0x5
	bls _0802B978
	b _0802BAD4
_0802B978:
	adds r4, r6, 0
	movs r5, 0x64
_0802B97C:
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r7, r0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0802B9C0
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r7, r0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _0802B9C0
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r7, r0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0802B9C0
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r7, r0
	movs r1, 0x37
	bl GetMonData
	cmp r0, 0
	beq _0802B9D0
_0802B9C0:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	adds r6, r4, 0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bls _0802B97C
_0802B9D0:
	ldr r1, _0802BAA8 @ =gBattleCommunication
	mov r9, r1
	ldrb r2, [r1]
	cmp r2, 0x5
	bhi _0802BAD4
	ldr r1, _0802BAAC @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x1]
	ldr r6, _0802BAB0 @ =gBattlerAttacker
	ldrb r0, [r6]
	strb r0, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _0802BAB4 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x9
	str r0, [r1]
	ldr r2, _0802BAB8 @ =gBattleMoveDamage
	mov r8, r2
	ldr r5, _0802BABC @ =gBaseStats
	mov r1, r9
	ldrb r0, [r1]
	movs r4, 0x64
	muls r0, r4
	adds r0, r7, r0
	movs r1, 0xB
	bl GetMonData
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r3, [r1, 0x1]
	mov r2, r8
	str r3, [r2]
	ldr r2, _0802BAC0 @ =gBattleMoves
	ldr r0, _0802BAC4 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	muls r0, r3
	mov r1, r8
	str r0, [r1]
	mov r2, r9
	ldrb r0, [r2]
	muls r0, r4
	adds r0, r7, r0
	movs r1, 0x38
	bl GetMonData
	lsls r0, 1
	movs r1, 0x5
	bl __udivsi3
	adds r0, 0x2
	mov r2, r8
	ldr r1, [r2]
	muls r0, r1
	str r0, [r2]
	ldr r3, _0802BAC8 @ =gBattleMons
	ldr r1, _0802BACC @ =gBattlerTarget
	ldrb r2, [r1]
	movs r1, 0x58
	muls r1, r2
	adds r1, r3
	ldrh r2, [r1]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r5
	ldrb r1, [r1, 0x2]
	bl __divsi3
	mov r1, r8
	str r0, [r1]
	movs r1, 0x32
	bl __divsi3
	adds r2, r0, 0x2
	mov r0, r8
	str r2, [r0]
	ldr r1, _0802BAD0 @ =gProtectStructs
	ldrb r0, [r6]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 28
	cmp r0, 0
	bge _0802BA9C
	lsls r0, r2, 4
	subs r0, r2
	movs r1, 0xA
	bl __divsi3
	mov r1, r8
	str r0, [r1]
_0802BA9C:
	mov r2, r9
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	b _0802BB0E
	.align 2, 0
_0802BAA8: .4byte gBattleCommunication
_0802BAAC: .4byte gBattleTextBuff1
_0802BAB0: .4byte gBattlerAttacker
_0802BAB4: .4byte gBattlescriptCurrInstr
_0802BAB8: .4byte gBattleMoveDamage
_0802BABC: .4byte gBaseStats
_0802BAC0: .4byte gBattleMoves
_0802BAC4: .4byte gCurrentMove
_0802BAC8: .4byte gBattleMons
_0802BACC: .4byte gBattlerTarget
_0802BAD0: .4byte gProtectStructs
_0802BAD4:
	mov r0, r8
	cmp r0, 0
	beq _0802BAF4
	ldr r3, _0802BAF0 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	b _0802BB08
	.align 2, 0
_0802BAF0: .4byte gBattlescriptCurrInstr
_0802BAF4:
	ldr r3, _0802BB1C @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x8]
_0802BB08:
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802BB0E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802BB1C: .4byte gBattlescriptCurrInstr
	thumb_func_end atkC4_trydobeatup

	thumb_func_start atkC5_setsemiinvulnerablebit
atkC5_setsemiinvulnerablebit: @ 802BB20
	push {lr}
	ldr r0, _0802BB34 @ =gCurrentMove
	ldrh r1, [r0]
	cmp r1, 0x5B
	beq _0802BB60
	cmp r1, 0x5B
	bgt _0802BB38
	cmp r1, 0x13
	beq _0802BB44
	b _0802BB8C
	.align 2, 0
_0802BB34: .4byte gCurrentMove
_0802BB38:
	ldr r0, _0802BB54 @ =0x00000123
	cmp r1, r0
	beq _0802BB78
	adds r0, 0x31
	cmp r1, r0
	bne _0802BB8C
_0802BB44:
	ldr r2, _0802BB58 @ =gStatuses3
	ldr r0, _0802BB5C @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x40
	b _0802BB88
	.align 2, 0
_0802BB54: .4byte 0x00000123
_0802BB58: .4byte gStatuses3
_0802BB5C: .4byte gBattlerAttacker
_0802BB60:
	ldr r2, _0802BB70 @ =gStatuses3
	ldr r0, _0802BB74 @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x80
	b _0802BB88
	.align 2, 0
_0802BB70: .4byte gStatuses3
_0802BB74: .4byte gBattlerAttacker
_0802BB78:
	ldr r2, _0802BB98 @ =gStatuses3
	ldr r0, _0802BB9C @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 11
_0802BB88:
	orrs r0, r2
	str r0, [r1]
_0802BB8C:
	ldr r1, _0802BBA0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802BB98: .4byte gStatuses3
_0802BB9C: .4byte gBattlerAttacker
_0802BBA0: .4byte gBattlescriptCurrInstr
	thumb_func_end atkC5_setsemiinvulnerablebit

	thumb_func_start atkC6_clearsemiinvulnerablebit
atkC6_clearsemiinvulnerablebit: @ 802BBA4
	push {lr}
	ldr r0, _0802BBB8 @ =gCurrentMove
	ldrh r1, [r0]
	cmp r1, 0x5B
	beq _0802BBE8
	cmp r1, 0x5B
	bgt _0802BBBC
	cmp r1, 0x13
	beq _0802BBC8
	b _0802BC16
	.align 2, 0
_0802BBB8: .4byte gCurrentMove
_0802BBBC:
	ldr r0, _0802BBDC @ =0x00000123
	cmp r1, r0
	beq _0802BC04
	adds r0, 0x31
	cmp r1, r0
	bne _0802BC16
_0802BBC8:
	ldr r2, _0802BBE0 @ =gStatuses3
	ldr r0, _0802BBE4 @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x41
	negs r2, r2
	b _0802BC12
	.align 2, 0
_0802BBDC: .4byte 0x00000123
_0802BBE0: .4byte gStatuses3
_0802BBE4: .4byte gBattlerAttacker
_0802BBE8:
	ldr r2, _0802BBFC @ =gStatuses3
	ldr r0, _0802BC00 @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x81
	negs r2, r2
	b _0802BC12
	.align 2, 0
_0802BBFC: .4byte gStatuses3
_0802BC00: .4byte gBattlerAttacker
_0802BC04:
	ldr r2, _0802BC24 @ =gStatuses3
	ldr r0, _0802BC28 @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	ldr r2, _0802BC2C @ =0xfffbffff
_0802BC12:
	ands r0, r2
	str r0, [r1]
_0802BC16:
	ldr r1, _0802BC30 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802BC24: .4byte gStatuses3
_0802BC28: .4byte gBattlerAttacker
_0802BC2C: .4byte 0xfffbffff
_0802BC30: .4byte gBattlescriptCurrInstr
	thumb_func_end atkC6_clearsemiinvulnerablebit

	thumb_func_start atkC7_setminimize
atkC7_setminimize: @ 802BC34
	push {lr}
	ldr r0, _0802BC64 @ =gHitMarker
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 18
	ands r0, r1
	cmp r0, 0
	beq _0802BC58
	ldr r2, _0802BC68 @ =gStatuses3
	ldr r0, _0802BC6C @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 1
	orrs r0, r2
	str r0, [r1]
_0802BC58:
	ldr r1, _0802BC70 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802BC64: .4byte gHitMarker
_0802BC68: .4byte gStatuses3
_0802BC6C: .4byte gBattlerAttacker
_0802BC70: .4byte gBattlescriptCurrInstr
	thumb_func_end atkC7_setminimize

	thumb_func_start atkC8_sethail
atkC8_sethail: @ 802BC74
	push {lr}
	ldr r3, _0802BC98 @ =gBattleWeather
	ldrh r1, [r3]
	movs r2, 0x80
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0802BCA4
	ldr r2, _0802BC9C @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0802BCA0 @ =gBattleCommunication
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _0802BCB2
	.align 2, 0
_0802BC98: .4byte gBattleWeather
_0802BC9C: .4byte gMoveResultFlags
_0802BCA0: .4byte gBattleCommunication
_0802BCA4:
	strh r2, [r3]
	ldr r0, _0802BCC0 @ =gBattleCommunication
	movs r1, 0x5
	strb r1, [r0, 0x5]
	ldr r0, _0802BCC4 @ =gWishFutureKnock
	adds r0, 0x28
	strb r1, [r0]
_0802BCB2:
	ldr r1, _0802BCC8 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802BCC0: .4byte gBattleCommunication
_0802BCC4: .4byte gWishFutureKnock
_0802BCC8: .4byte gBattlescriptCurrInstr
	thumb_func_end atkC8_sethail

	thumb_func_start atkC9_jumpifattackandspecialattackcannotfall
atkC9_jumpifattackandspecialattackcannotfall: @ 802BCCC
	push {r4,lr}
	ldr r2, _0802BD10 @ =gBattleMons
	ldr r0, _0802BD14 @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r1, r0, r2
	movs r0, 0x19
	ldrsb r0, [r1, r0]
	adds r3, r2, 0
	cmp r0, 0
	bne _0802BD20
	movs r0, 0x1C
	ldrsb r0, [r1, r0]
	cmp r0, 0
	bne _0802BD20
	ldr r0, _0802BD18 @ =gBattleCommunication
	ldrb r0, [r0, 0x6]
	cmp r0, 0x1
	beq _0802BD20
	ldr r3, _0802BD1C @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802BD4C
	.align 2, 0
_0802BD10: .4byte gBattleMons
_0802BD14: .4byte gBattlerTarget
_0802BD18: .4byte gBattleCommunication
_0802BD1C: .4byte gBattlescriptCurrInstr
_0802BD20:
	ldr r4, _0802BD54 @ =gActiveBattler
	ldr r0, _0802BD58 @ =gBattlerAttacker
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r2, _0802BD5C @ =gBattleMoveDamage
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	adds r0, r3
	ldrh r0, [r0, 0x28]
	str r0, [r2]
	ldr r1, _0802BD60 @ =0x00007fff
	movs r0, 0
	bl BtlController_EmitHealthBarUpdate
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r1, _0802BD64 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802BD4C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802BD54: .4byte gActiveBattler
_0802BD58: .4byte gBattlerAttacker
_0802BD5C: .4byte gBattleMoveDamage
_0802BD60: .4byte 0x00007fff
_0802BD64: .4byte gBattlescriptCurrInstr
	thumb_func_end atkC9_jumpifattackandspecialattackcannotfall

	thumb_func_start atkCA_setforcedtarget
atkCA_setforcedtarget: @ 802BD68
	push {r4,r5,lr}
	ldr r4, _0802BDA8 @ =gBattlerAttacker
	ldrb r0, [r4]
	bl GetBattlerSide
	ldr r5, _0802BDAC @ =gSideTimers
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	movs r0, 0x1
	strb r0, [r1, 0x8]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r0, [r4]
	strb r0, [r1, 0x9]
	ldr r1, _0802BDB0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802BDA8: .4byte gBattlerAttacker
_0802BDAC: .4byte gSideTimers
_0802BDB0: .4byte gBattlescriptCurrInstr
	thumb_func_end atkCA_setforcedtarget

	thumb_func_start atkCB_setcharge
atkCB_setcharge: @ 802BDB4
	push {r4,lr}
	ldr r0, _0802BE08 @ =gStatuses3
	ldr r3, _0802BE0C @ =gBattlerAttacker
	ldrb r1, [r3]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 2
	orrs r0, r2
	str r0, [r1]
	ldr r4, _0802BE10 @ =gDisableStructs
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r2, [r0, 0x12]
	movs r1, 0x10
	negs r1, r1
	ands r1, r2
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0, 0x12]
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r2, [r0, 0x12]
	movs r1, 0xF
	ands r1, r2
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x12]
	ldr r1, _0802BE14 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802BE08: .4byte gStatuses3
_0802BE0C: .4byte gBattlerAttacker
_0802BE10: .4byte gDisableStructs
_0802BE14: .4byte gBattlescriptCurrInstr
	thumb_func_end atkCB_setcharge

	thumb_func_start atkCC_callterrainattack
atkCC_callterrainattack: @ 802BE18
	push {r4,lr}
	ldr r2, _0802BE68 @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _0802BE6C @ =0xfffffbff
	ands r0, r1
	str r0, [r2]
	ldr r4, _0802BE70 @ =gCurrentMove
	ldr r1, _0802BE74 @ =sNaturePowerMoves
	ldr r0, _0802BE78 @ =gBattleTerrain
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r4]
	ldrh r0, [r4]
	movs r1, 0
	bl GetMoveTarget
	ldr r1, _0802BE7C @ =gBattlerTarget
	strb r0, [r1]
	ldr r3, _0802BE80 @ =gBattleScriptsForMoveEffects
	ldr r2, _0802BE84 @ =gBattleMoves
	ldrh r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	bl BattleScriptPush
	ldr r1, _0802BE88 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802BE68: .4byte gHitMarker
_0802BE6C: .4byte 0xfffffbff
_0802BE70: .4byte gCurrentMove
_0802BE74: .4byte sNaturePowerMoves
_0802BE78: .4byte gBattleTerrain
_0802BE7C: .4byte gBattlerTarget
_0802BE80: .4byte gBattleScriptsForMoveEffects
_0802BE84: .4byte gBattleMoves
_0802BE88: .4byte gBattlescriptCurrInstr
	thumb_func_end atkCC_callterrainattack

	thumb_func_start atkCD_cureifburnedparalysedorpoisoned
atkCD_cureifburnedparalysedorpoisoned: @ 802BE8C
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r1, _0802BED8 @ =gBattleMons
	ldr r3, _0802BEDC @ =gBattlerAttacker
	ldrb r0, [r3]
	movs r6, 0x58
	muls r0, r6
	adds r5, r1, 0
	adds r5, 0x4C
	adds r2, r0, r5
	ldr r0, [r2]
	movs r1, 0xD8
	ands r0, r1
	cmp r0, 0
	beq _0802BEE8
	movs r0, 0
	str r0, [r2]
	ldr r1, _0802BEE0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	ldr r4, _0802BEE4 @ =gActiveBattler
	ldrb r0, [r3]
	strb r0, [r4]
	ldrb r0, [r4]
	muls r0, r6
	adds r0, r5
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl BtlController_EmitSetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	b _0802BF02
	.align 2, 0
_0802BED8: .4byte gBattleMons
_0802BEDC: .4byte gBattlerAttacker
_0802BEE0: .4byte gBattlescriptCurrInstr
_0802BEE4: .4byte gActiveBattler
_0802BEE8:
	ldr r3, _0802BF0C @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802BF02:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802BF0C: .4byte gBattlescriptCurrInstr
	thumb_func_end atkCD_cureifburnedparalysedorpoisoned

	thumb_func_start atkCE_settorment
atkCE_settorment: @ 802BF10
	push {lr}
	ldr r1, _0802BF48 @ =gBattleMons
	ldr r0, _0802BF4C @ =gBattlerTarget
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r1, [r0]
	movs r2, 0x80
	lsls r2, 24
	cmp r1, 0
	bge _0802BF54
	ldr r3, _0802BF50 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802BF60
	.align 2, 0
_0802BF48: .4byte gBattleMons
_0802BF4C: .4byte gBattlerTarget
_0802BF50: .4byte gBattlescriptCurrInstr
_0802BF54:
	orrs r1, r2
	str r1, [r0]
	ldr r1, _0802BF64 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802BF60:
	pop {r0}
	bx r0
	.align 2, 0
_0802BF64: .4byte gBattlescriptCurrInstr
	thumb_func_end atkCE_settorment

	thumb_func_start atkCF_jumpifnodamage
atkCF_jumpifnodamage: @ 802BF68
	push {lr}
	ldr r2, _0802BF94 @ =gProtectStructs
	ldr r0, _0802BF98 @ =gBattlerAttacker
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r0, r2, 0x4
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0802BF88
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0802BFA0
_0802BF88:
	ldr r1, _0802BF9C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802BFBA
	.align 2, 0
_0802BF94: .4byte gProtectStructs
_0802BF98: .4byte gBattlerAttacker
_0802BF9C: .4byte gBattlescriptCurrInstr
_0802BFA0:
	ldr r3, _0802BFC0 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802BFBA:
	pop {r0}
	bx r0
	.align 2, 0
_0802BFC0: .4byte gBattlescriptCurrInstr
	thumb_func_end atkCF_jumpifnodamage

	thumb_func_start atkD0_settaunt
atkD0_settaunt: @ 802BFC4
	push {r4,lr}
	ldr r4, _0802C008 @ =gDisableStructs
	ldr r3, _0802C00C @ =gBattlerTarget
	ldrb r0, [r3]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r2, r1, r4
	ldrb r1, [r2, 0x13]
	lsls r0, r1, 28
	cmp r0, 0
	bne _0802C014
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2, 0x13]
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r2, [r0, 0x13]
	movs r1, 0xF
	ands r1, r2
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x13]
	ldr r1, _0802C010 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802C02E
	.align 2, 0
_0802C008: .4byte gDisableStructs
_0802C00C: .4byte gBattlerTarget
_0802C010: .4byte gBattlescriptCurrInstr
_0802C014:
	ldr r3, _0802C034 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802C02E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C034: .4byte gBattlescriptCurrInstr
	thumb_func_end atkD0_settaunt

	thumb_func_start atkD1_trysethelpinghand
atkD1_trysethelpinghand: @ 802C038
	push {r4,lr}
	ldr r4, _0802C0A0 @ =gBattlerAttacker
	ldrb r0, [r4]
	bl GetBattlerPosition
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerAtPosition
	ldr r3, _0802C0A4 @ =gBattlerTarget
	strb r0, [r3]
	ldr r0, _0802C0A8 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0802C0BC
	ldr r0, _0802C0AC @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldr r2, _0802C0B0 @ =gBitTable
	ldrb r3, [r3]
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0802C0BC
	ldr r1, _0802C0B4 @ =gProtectStructs
	ldrb r0, [r4]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 28
	cmp r0, 0
	blt _0802C0BC
	lsls r0, r3, 4
	adds r2, r0, r1
	ldrb r1, [r2]
	lsls r0, r1, 28
	cmp r0, 0
	blt _0802C0BC
	movs r0, 0x8
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0802C0B8 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802C0D6
	.align 2, 0
_0802C0A0: .4byte gBattlerAttacker
_0802C0A4: .4byte gBattlerTarget
_0802C0A8: .4byte gBattleTypeFlags
_0802C0AC: .4byte gAbsentBattlerFlags
_0802C0B0: .4byte gBitTable
_0802C0B4: .4byte gProtectStructs
_0802C0B8: .4byte gBattlescriptCurrInstr
_0802C0BC:
	ldr r3, _0802C0DC @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802C0D6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C0DC: .4byte gBattlescriptCurrInstr
	thumb_func_end atkD1_trysethelpinghand

	thumb_func_start atkD2_tryswapitems
atkD2_tryswapitems: @ 802C0E0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r4, _0802C1FC @ =gBattleTypeFlags
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 12
	ands r0, r1
	cmp r0, 0
	bne _0802C1DE
	ldr r0, _0802C200 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0802C120
	ldr r0, [r4]
	ldr r1, _0802C204 @ =0x00000902
	ands r0, r1
	cmp r0, 0
	bne _0802C120
	ldr r0, _0802C208 @ =gTrainerBattleOpponent_A
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _0802C1DE
_0802C120:
	ldr r6, _0802C200 @ =gBattlerAttacker
	ldrb r0, [r6]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r7, _0802C20C @ =gBattlerTarget
	ldrb r0, [r7]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0802C1FC @ =gBattleTypeFlags
	ldr r0, [r0]
	ldr r1, _0802C204 @ =0x00000902
	ands r0, r1
	cmp r0, 0
	bne _0802C18A
	ldr r0, _0802C208 @ =gTrainerBattleOpponent_A
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _0802C18A
	ldr r0, _0802C210 @ =gWishFutureKnock
	adds r2, r0, 0
	adds r2, 0x29
	adds r0, r4, r2
	ldrb r1, [r0]
	ldr r4, _0802C214 @ =gBitTable
	ldr r3, _0802C218 @ =gBattlerPartyIndexes
	ldrb r0, [r6]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0802C1DE
	adds r0, r5, r2
	ldrb r1, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0802C1DE
_0802C18A:
	ldr r0, _0802C21C @ =gBattleMons
	mov r8, r0
	ldr r1, _0802C200 @ =gBattlerAttacker
	ldrb r4, [r1]
	movs r5, 0x58
	adds r0, r4, 0
	muls r0, r5
	add r0, r8
	mov r9, r0
	ldrh r3, [r0, 0x2E]
	adds r1, r3, 0
	cmp r1, 0
	bne _0802C1B2
	ldr r0, _0802C20C @ =gBattlerTarget
	ldrb r0, [r0]
	muls r0, r5
	add r0, r8
	ldrh r0, [r0, 0x2E]
	cmp r0, 0
	beq _0802C1DE
_0802C1B2:
	cmp r1, 0xAF
	beq _0802C1DE
	ldr r7, _0802C20C @ =gBattlerTarget
	ldrb r0, [r7]
	muls r0, r5
	mov r2, r8
	adds r1, r0, r2
	ldrh r2, [r1, 0x2E]
	cmp r2, 0xAF
	beq _0802C1DE
	adds r0, r3, 0
	subs r0, 0x79
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xB
	bls _0802C1DE
	adds r0, r2, 0
	subs r0, 0x79
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xB
	bhi _0802C224
_0802C1DE:
	ldr r3, _0802C220 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802C37A
	.align 2, 0
_0802C1FC: .4byte gBattleTypeFlags
_0802C200: .4byte gBattlerAttacker
_0802C204: .4byte 0x00000902
_0802C208: .4byte gTrainerBattleOpponent_A
_0802C20C: .4byte gBattlerTarget
_0802C210: .4byte gWishFutureKnock
_0802C214: .4byte gBitTable
_0802C218: .4byte gBattlerPartyIndexes
_0802C21C: .4byte gBattleMons
_0802C220: .4byte gBattlescriptCurrInstr
_0802C224:
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x3C
	bne _0802C258
	ldr r1, _0802C24C @ =gBattlescriptCurrInstr
	ldr r0, _0802C250 @ =BattleScript_StickyHoldActivates
	str r0, [r1]
	ldr r1, _0802C254 @ =gLastUsedAbility
	ldrb r0, [r7]
	muls r0, r5
	add r0, r8
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	ldrb r1, [r1]
	bl RecordAbilityBattle
	b _0802C37A
	.align 2, 0
_0802C24C: .4byte gBattlescriptCurrInstr
_0802C250: .4byte BattleScript_StickyHoldActivates
_0802C254: .4byte gLastUsedAbility
_0802C258:
	ldr r3, _0802C344 @ =gBattleStruct
	mov r10, r3
	lsls r0, r4, 1
	adds r0, 0xD0
	ldr r1, [r3]
	adds r6, r1, r0
	mov r0, r9
	ldrh r0, [r0, 0x2E]
	mov r9, r0
	strh r2, [r6]
	ldr r1, _0802C348 @ =gBattlerAttacker
	ldrb r0, [r1]
	muls r0, r5
	add r0, r8
	movs r1, 0
	strh r1, [r0, 0x2E]
	ldrb r0, [r7]
	muls r0, r5
	add r0, r8
	mov r2, r9
	strh r2, [r0, 0x2E]
	ldr r4, _0802C34C @ =gActiveBattler
	ldr r3, _0802C348 @ =gBattlerAttacker
	ldrb r0, [r3]
	strb r0, [r4]
	str r6, [sp]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl BtlController_EmitSetMonData
	ldr r1, _0802C348 @ =gBattlerAttacker
	ldrb r0, [r1]
	bl MarkBattlerForControllerExec
	ldrb r0, [r7]
	strb r0, [r4]
	ldrb r0, [r7]
	muls r0, r5
	mov r1, r8
	adds r1, 0x2E
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl BtlController_EmitSetMonData
	ldrb r0, [r7]
	bl MarkBattlerForControllerExec
	ldrb r0, [r7]
	mov r2, r10
	ldr r1, [r2]
	lsls r0, 1
	adds r0, r1
	adds r0, 0xC8
	movs r3, 0
	strb r3, [r0]
	ldrb r0, [r7]
	ldr r1, [r2]
	lsls r0, 1
	adds r0, r1
	adds r0, 0xC9
	strb r3, [r0]
	ldr r1, _0802C348 @ =gBattlerAttacker
	ldrb r0, [r1]
	ldr r1, [r2]
	lsls r0, 1
	adds r0, r1
	adds r0, 0xC8
	strb r3, [r0]
	ldr r2, _0802C348 @ =gBattlerAttacker
	ldrb r0, [r2]
	mov r3, r10
	ldr r1, [r3]
	lsls r0, 1
	adds r0, r1
	adds r0, 0xC9
	movs r1, 0
	strb r1, [r0]
	ldr r1, _0802C350 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	ldr r1, _0802C354 @ =gBattleTextBuff1
	movs r3, 0xFD
	strb r3, [r1]
	movs r2, 0xA
	strb r2, [r1, 0x1]
	ldrh r0, [r6]
	strb r0, [r1, 0x2]
	ldrh r0, [r6]
	lsrs r0, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _0802C358 @ =gBattleTextBuff2
	strb r3, [r1]
	strb r2, [r1, 0x1]
	mov r2, r9
	strb r2, [r1, 0x2]
	mov r3, r9
	lsrs r0, r3, 8
	strb r0, [r1, 0x3]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r1, 0x4]
	cmp r3, 0
	beq _0802C360
	ldrh r0, [r6]
	cmp r0, 0
	beq _0802C374
	ldr r1, _0802C35C @ =gBattleCommunication
	movs r0, 0x2
	b _0802C378
	.align 2, 0
_0802C344: .4byte gBattleStruct
_0802C348: .4byte gBattlerAttacker
_0802C34C: .4byte gActiveBattler
_0802C350: .4byte gBattlescriptCurrInstr
_0802C354: .4byte gBattleTextBuff1
_0802C358: .4byte gBattleTextBuff2
_0802C35C: .4byte gBattleCommunication
_0802C360:
	ldrh r0, [r6]
	cmp r0, 0
	beq _0802C374
	ldr r0, _0802C370 @ =gBattleCommunication
	movs r1, 0
	strb r1, [r0, 0x5]
	b _0802C37A
	.align 2, 0
_0802C370: .4byte gBattleCommunication
_0802C374:
	ldr r1, _0802C38C @ =gBattleCommunication
	movs r0, 0x1
_0802C378:
	strb r0, [r1, 0x5]
_0802C37A:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C38C: .4byte gBattleCommunication
	thumb_func_end atkD2_tryswapitems

	thumb_func_start atkD3_trycopyability
atkD3_trycopyability: @ 802C390
	push {r4,lr}
	ldr r3, _0802C3D0 @ =gBattleMons
	ldr r4, _0802C3D4 @ =gBattlerTarget
	ldrb r0, [r4]
	movs r2, 0x58
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	ldrb r1, [r0]
	adds r0, r1, 0
	cmp r0, 0
	beq _0802C3E4
	cmp r0, 0x19
	beq _0802C3E4
	ldr r0, _0802C3D8 @ =gBattlerAttacker
	ldrb r0, [r0]
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	strb r1, [r0]
	ldr r1, _0802C3DC @ =gLastUsedAbility
	ldrb r0, [r4]
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0802C3E0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802C3FE
	.align 2, 0
_0802C3D0: .4byte gBattleMons
_0802C3D4: .4byte gBattlerTarget
_0802C3D8: .4byte gBattlerAttacker
_0802C3DC: .4byte gLastUsedAbility
_0802C3E0: .4byte gBattlescriptCurrInstr
_0802C3E4:
	ldr r3, _0802C404 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802C3FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C404: .4byte gBattlescriptCurrInstr
	thumb_func_end atkD3_trycopyability

	thumb_func_start atkD4_trywish
atkD4_trywish: @ 802C408
	push {r4-r7,lr}
	ldr r7, _0802C41C @ =gBattlescriptCurrInstr
	ldr r2, [r7]
	ldrb r3, [r2, 0x1]
	cmp r3, 0
	beq _0802C420
	cmp r3, 0x1
	beq _0802C458
	b _0802C4D4
	.align 2, 0
_0802C41C: .4byte gBattlescriptCurrInstr
_0802C420:
	ldr r1, _0802C44C @ =gWishFutureKnock
	ldr r4, _0802C450 @ =gBattlerAttacker
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r5, [r4]
	adds r3, r0, r5
	ldrb r0, [r3]
	cmp r0, 0
	bne _0802C4A4
	movs r0, 0x2
	strb r0, [r3]
	ldrb r0, [r4]
	adds r1, 0x24
	adds r1, r0, r1
	ldr r2, _0802C454 @ =gBattlerPartyIndexes
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, 0x6
	b _0802C4D2
	.align 2, 0
_0802C44C: .4byte gWishFutureKnock
_0802C450: .4byte gBattlerAttacker
_0802C454: .4byte gBattlerPartyIndexes
_0802C458:
	ldr r1, _0802C4BC @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x1]
	ldr r4, _0802C4C0 @ =gBattlerTarget
	ldrb r0, [r4]
	strb r0, [r1, 0x2]
	ldr r0, _0802C4C4 @ =gWishFutureKnock
	adds r0, 0x24
	ldrb r5, [r4]
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _0802C4C8 @ =gBattleMoveDamage
	ldr r6, _0802C4CC @ =gBattleMons
	ldrb r0, [r4]
	movs r5, 0x58
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0, 0x2C]
	lsrs r0, 1
	str r0, [r1]
	cmp r0, 0
	bne _0802C490
	str r3, [r1]
_0802C490:
	ldr r0, [r1]
	negs r0, r0
	str r0, [r1]
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r6
	ldrh r1, [r0, 0x28]
	ldrh r0, [r0, 0x2C]
	cmp r1, r0
	bne _0802C4D0
_0802C4A4:
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r7]
	b _0802C4D4
	.align 2, 0
_0802C4BC: .4byte gBattleTextBuff1
_0802C4C0: .4byte gBattlerTarget
_0802C4C4: .4byte gWishFutureKnock
_0802C4C8: .4byte gBattleMoveDamage
_0802C4CC: .4byte gBattleMons
_0802C4D0:
	adds r0, r2, 0x6
_0802C4D2:
	str r0, [r7]
_0802C4D4:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end atkD4_trywish

	thumb_func_start atkD5_trysetroots
atkD5_trysetroots: @ 802C4DC
	push {lr}
	ldr r1, _0802C514 @ =gStatuses3
	ldr r0, _0802C518 @ =gBattlerAttacker
	ldrb r0, [r0]
	lsls r0, 2
	adds r2, r0, r1
	ldr r1, [r2]
	movs r3, 0x80
	lsls r3, 3
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	beq _0802C520
	ldr r3, _0802C51C @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802C52C
	.align 2, 0
_0802C514: .4byte gStatuses3
_0802C518: .4byte gBattlerAttacker
_0802C51C: .4byte gBattlescriptCurrInstr
_0802C520:
	orrs r1, r3
	str r1, [r2]
	ldr r1, _0802C530 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802C52C:
	pop {r0}
	bx r0
	.align 2, 0
_0802C530: .4byte gBattlescriptCurrInstr
	thumb_func_end atkD5_trysetroots

	thumb_func_start atkD6_doubledamagedealtifdamaged
atkD6_doubledamagedealtifdamaged: @ 802C534
	push {lr}
	ldr r3, _0802C580 @ =gProtectStructs
	ldr r0, _0802C584 @ =gBattlerAttacker
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r0, r3, 0x4
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0802C554
	adds r0, r2, r3
	ldr r1, _0802C588 @ =gBattlerTarget
	ldrb r0, [r0, 0xC]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0802C56C
_0802C554:
	adds r0, r3, 0
	adds r0, 0x8
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0802C572
	adds r0, r2, r3
	ldr r1, _0802C588 @ =gBattlerTarget
	ldrb r0, [r0, 0xD]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0802C572
_0802C56C:
	ldr r1, _0802C58C @ =gBattleScripting
	movs r0, 0x2
	strb r0, [r1, 0xE]
_0802C572:
	ldr r1, _0802C590 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802C580: .4byte gProtectStructs
_0802C584: .4byte gBattlerAttacker
_0802C588: .4byte gBattlerTarget
_0802C58C: .4byte gBattleScripting
_0802C590: .4byte gBattlescriptCurrInstr
	thumb_func_end atkD6_doubledamagedealtifdamaged

	thumb_func_start atkD7_setyawn
atkD7_setyawn: @ 802C594
	push {r4,lr}
	ldr r1, _0802C5D8 @ =gStatuses3
	ldr r0, _0802C5DC @ =gBattlerTarget
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r4, r0, r1
	ldr r2, [r4]
	movs r0, 0xC0
	lsls r0, 5
	ands r0, r2
	cmp r0, 0
	bne _0802C5BC
	ldr r1, _0802C5E0 @ =gBattleMons
	movs r0, 0x58
	muls r0, r3
	adds r1, 0x4C
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0802C5E8
_0802C5BC:
	ldr r3, _0802C5E4 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802C5F8
	.align 2, 0
_0802C5D8: .4byte gStatuses3
_0802C5DC: .4byte gBattlerTarget
_0802C5E0: .4byte gBattleMons
_0802C5E4: .4byte gBattlescriptCurrInstr
_0802C5E8:
	movs r0, 0x80
	lsls r0, 5
	orrs r2, r0
	str r2, [r4]
	ldr r1, _0802C600 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802C5F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C600: .4byte gBattlescriptCurrInstr
	thumb_func_end atkD7_setyawn

	thumb_func_start atkD8_setdamagetohealthdifference
atkD8_setdamagetohealthdifference: @ 802C604
	push {lr}
	ldr r2, _0802C640 @ =gBattleMons
	ldr r0, _0802C644 @ =gBattlerTarget
	ldrb r0, [r0]
	movs r1, 0x58
	muls r0, r1
	adds r3, r0, r2
	ldr r0, _0802C648 @ =gBattlerAttacker
	ldrb r0, [r0]
	muls r0, r1
	adds r1, r0, r2
	ldrh r0, [r3, 0x28]
	ldrh r2, [r1, 0x28]
	cmp r0, r2
	bhi _0802C650
	ldr r3, _0802C64C @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802C662
	.align 2, 0
_0802C640: .4byte gBattleMons
_0802C644: .4byte gBattlerTarget
_0802C648: .4byte gBattlerAttacker
_0802C64C: .4byte gBattlescriptCurrInstr
_0802C650:
	ldr r2, _0802C668 @ =gBattleMoveDamage
	ldrh r0, [r3, 0x28]
	ldrh r1, [r1, 0x28]
	subs r0, r1
	str r0, [r2]
	ldr r1, _0802C66C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802C662:
	pop {r0}
	bx r0
	.align 2, 0
_0802C668: .4byte gBattleMoveDamage
_0802C66C: .4byte gBattlescriptCurrInstr
	thumb_func_end atkD8_setdamagetohealthdifference

	thumb_func_start atkD9_scaledamagebyhealthratio
atkD9_scaledamagebyhealthratio: @ 802C670
	push {r4,lr}
	ldr r4, _0802C6BC @ =gDynamicBasePower
	ldrh r0, [r4]
	cmp r0, 0
	bne _0802C6AC
	ldr r2, _0802C6C0 @ =gBattleMoves
	ldr r0, _0802C6C4 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r3, [r0, 0x1]
	ldr r2, _0802C6C8 @ =gBattleMons
	ldr r0, _0802C6CC @ =gBattlerAttacker
	ldrb r1, [r0]
	movs r0, 0x58
	muls r1, r0
	adds r1, r2
	ldrh r0, [r1, 0x28]
	muls r0, r3
	ldrh r1, [r1, 0x2C]
	bl __divsi3
	strh r0, [r4]
	lsls r0, 16
	cmp r0, 0
	bne _0802C6AC
	movs r0, 0x1
	strh r0, [r4]
_0802C6AC:
	ldr r1, _0802C6D0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C6BC: .4byte gDynamicBasePower
_0802C6C0: .4byte gBattleMoves
_0802C6C4: .4byte gCurrentMove
_0802C6C8: .4byte gBattleMons
_0802C6CC: .4byte gBattlerAttacker
_0802C6D0: .4byte gBattlescriptCurrInstr
	thumb_func_end atkD9_scaledamagebyhealthratio

	thumb_func_start atkDA_tryswapabilities
atkDA_tryswapabilities: @ 802C6D4
	push {r4-r6,lr}
	ldr r5, _0802C738 @ =gBattleMons
	ldr r0, _0802C73C @ =gBattlerAttacker
	ldrb r0, [r0]
	movs r4, 0x58
	muls r0, r4
	adds r0, r5
	adds r2, r0, 0
	adds r2, 0x20
	ldrb r1, [r2]
	cmp r1, 0
	bne _0802C6FC
	ldr r0, _0802C740 @ =gBattlerTarget
	ldrb r0, [r0]
	muls r0, r4
	adds r0, r5
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0
	beq _0802C71C
_0802C6FC:
	cmp r1, 0x19
	beq _0802C71C
	ldr r6, _0802C740 @ =gBattlerTarget
	ldrb r0, [r6]
	muls r0, r4
	adds r0, r5
	adds r0, 0x20
	ldrb r3, [r0]
	cmp r3, 0x19
	beq _0802C71C
	ldr r0, _0802C744 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0802C74C
_0802C71C:
	ldr r3, _0802C748 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802C762
	.align 2, 0
_0802C738: .4byte gBattleMons
_0802C73C: .4byte gBattlerAttacker
_0802C740: .4byte gBattlerTarget
_0802C744: .4byte gMoveResultFlags
_0802C748: .4byte gBattlescriptCurrInstr
_0802C74C:
	ldrb r1, [r2]
	strb r3, [r2]
	ldrb r0, [r6]
	muls r0, r4
	adds r0, r5
	adds r0, 0x20
	strb r1, [r0]
	ldr r1, _0802C768 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802C762:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802C768: .4byte gBattlescriptCurrInstr
	thumb_func_end atkDA_tryswapabilities

	thumb_func_start atkDB_tryimprison
atkDB_tryimprison: @ 802C76C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r1, _0802C78C @ =gStatuses3
	ldr r4, _0802C790 @ =gBattlerAttacker
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 6
	ands r0, r1
	cmp r0, 0
	beq _0802C7BC
	b _0802C83E
	.align 2, 0
_0802C78C: .4byte gStatuses3
_0802C790: .4byte gBattlerAttacker
_0802C794:
	ldr r0, _0802C7B4 @ =gStatuses3
	mov r2, r9
	ldrb r1, [r2]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 6
	orrs r0, r2
	str r0, [r1]
	ldr r1, _0802C7B8 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802C836
	.align 2, 0
_0802C7B4: .4byte gStatuses3
_0802C7B8: .4byte gBattlescriptCurrInstr
_0802C7BC:
	adds r0, r2, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrb r0, [r4]
	bl PressurePPLoseOnUsingImprison
	movs r6, 0
	b _0802C82E
_0802C7D2:
	adds r0, r6, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r8, r0
	beq _0802C828
	movs r4, 0
	ldr r7, _0802C864 @ =gBattlerAttacker
	mov r9, r7
	ldr r0, _0802C868 @ =gBattleMons
	mov r12, r0
	mov r1, r9
	ldrb r0, [r1]
	mov r2, r12
	adds r2, 0xC
	movs r1, 0x58
	muls r0, r1
	adds r3, r0, r2
	adds r5, r6, 0
	muls r5, r1
_0802C7FC:
	movs r2, 0
	ldrh r1, [r3]
	mov r0, r12
	adds r0, 0xC
	adds r0, r5, r0
_0802C806:
	ldrh r7, [r0]
	cmp r1, r7
	bne _0802C810
	cmp r1, 0
	bne _0802C818
_0802C810:
	adds r0, 0x2
	adds r2, 0x1
	cmp r2, 0x3
	ble _0802C806
_0802C818:
	cmp r2, 0x4
	bne _0802C824
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0802C7FC
_0802C824:
	cmp r4, 0x4
	bne _0802C794
_0802C828:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0802C82E:
	ldr r0, _0802C86C @ =gBattlersCount
	ldrb r0, [r0]
	cmp r6, r0
	bcc _0802C7D2
_0802C836:
	ldr r0, _0802C86C @ =gBattlersCount
	ldrb r0, [r0]
	cmp r6, r0
	bne _0802C858
_0802C83E:
	ldr r3, _0802C870 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802C858:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C864: .4byte gBattlerAttacker
_0802C868: .4byte gBattleMons
_0802C86C: .4byte gBattlersCount
_0802C870: .4byte gBattlescriptCurrInstr
	thumb_func_end atkDB_tryimprison

	thumb_func_start atkDC_trysetgrudge
atkDC_trysetgrudge: @ 802C874
	push {lr}
	ldr r1, _0802C8AC @ =gStatuses3
	ldr r0, _0802C8B0 @ =gBattlerAttacker
	ldrb r0, [r0]
	lsls r0, 2
	adds r2, r0, r1
	ldr r1, [r2]
	movs r3, 0x80
	lsls r3, 7
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	beq _0802C8B8
	ldr r3, _0802C8B4 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802C8C4
	.align 2, 0
_0802C8AC: .4byte gStatuses3
_0802C8B0: .4byte gBattlerAttacker
_0802C8B4: .4byte gBattlescriptCurrInstr
_0802C8B8:
	orrs r1, r3
	str r1, [r2]
	ldr r1, _0802C8C8 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802C8C4:
	pop {r0}
	bx r0
	.align 2, 0
_0802C8C8: .4byte gBattlescriptCurrInstr
	thumb_func_end atkDC_trysetgrudge

	thumb_func_start atkDD_weightdamagecalculation
atkDD_weightdamagecalculation: @ 802C8CC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
	ldr r2, _0802C930 @ =sWeightToDamageTable
	ldrh r0, [r2]
	ldr r1, _0802C934 @ =0x0000ffff
	cmp r0, r1
	beq _0802C944
	adds r6, r2, 0
	ldr r0, _0802C938 @ =gBattleMons
	mov r8, r0
	adds r7, r1, 0
	adds r4, r6, 0
_0802C8E8:
	ldr r0, _0802C93C @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	add r0, r8
	ldrh r0, [r0]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl GetPokedexHeightWeight
	ldrh r1, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bhi _0802C916
	adds r4, 0x4
	adds r5, 0x2
	ldrh r0, [r4]
	cmp r0, r7
	bne _0802C8E8
_0802C916:
	lsls r0, r5, 1
	adds r0, r6
	ldrh r1, [r0]
	ldr r0, _0802C934 @ =0x0000ffff
	cmp r1, r0
	beq _0802C944
	ldr r0, _0802C940 @ =gDynamicBasePower
	adds r1, r5, 0x1
	lsls r1, 1
	adds r1, r6
	ldrh r1, [r1]
	strh r1, [r0]
	b _0802C94A
	.align 2, 0
_0802C930: .4byte sWeightToDamageTable
_0802C934: .4byte 0x0000ffff
_0802C938: .4byte gBattleMons
_0802C93C: .4byte gBattlerTarget
_0802C940: .4byte gDynamicBasePower
_0802C944:
	ldr r1, _0802C95C @ =gDynamicBasePower
	movs r0, 0x78
	strh r0, [r1]
_0802C94A:
	ldr r1, _0802C960 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C95C: .4byte gDynamicBasePower
_0802C960: .4byte gBattlescriptCurrInstr
	thumb_func_end atkDD_weightdamagecalculation

	thumb_func_start atkDE_assistattackselect
atkDE_assistattackselect: @ 802C964
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	movs r0, 0
	mov r10, r0
	ldr r0, _0802CA84 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x18
	str r0, [sp, 0x4]
	ldr r0, _0802CA88 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerPosition
	movs r1, 0x1
	ands r1, r0
	ldr r0, _0802CA8C @ =gPlayerParty
	str r0, [sp]
	cmp r1, 0
	beq _0802C994
	ldr r1, _0802CA90 @ =gEnemyParty
	str r1, [sp]
_0802C994:
	movs r2, 0
_0802C996:
	ldr r1, _0802CA94 @ =gBattlerPartyIndexes
	ldr r0, _0802CA88 @ =gBattlerAttacker
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	adds r1, r2, 0x1
	str r1, [sp, 0x8]
	ldrh r0, [r0]
	cmp r2, r0
	beq _0802CA3C
	movs r0, 0x64
	adds r6, r2, 0
	muls r6, r0
	ldr r0, [sp]
	adds r4, r0, r6
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _0802CA3C
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0802CA3C
	movs r5, 0
	ldr r1, _0802CA98 @ =0x0000ffff
	mov r8, r1
	mov r9, r6
	mov r1, r10
	lsls r0, r1, 1
	ldr r1, [sp, 0x4]
	adds r6, r0, r1
_0802C9E0:
	movs r7, 0
	adds r1, r5, 0
	adds r1, 0xD
	ldr r0, [sp]
	add r0, r9
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl IsInvalidForSleepTalkOrAssist
	lsls r0, 24
	adds r1, r5, 0x1
	cmp r0, 0
	bne _0802CA36
	ldr r0, _0802CA9C @ =sMovesForbiddenToCopy
	ldrh r2, [r0]
	adds r3, r0, 0
	cmp r2, r8
	beq _0802CA2A
	cmp r4, r2
	beq _0802CA20
	ldr r5, _0802CA98 @ =0x0000ffff
	adds r2, r3, 0
_0802CA12:
	adds r2, 0x2
	adds r7, 0x1
	ldrh r0, [r2]
	cmp r0, r5
	beq _0802CA2A
	cmp r4, r0
	bne _0802CA12
_0802CA20:
	lsls r0, r7, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r8
	bne _0802CA36
_0802CA2A:
	cmp r4, 0
	beq _0802CA36
	strh r4, [r6]
	adds r6, 0x2
	movs r0, 0x1
	add r10, r0
_0802CA36:
	adds r5, r1, 0
	cmp r5, 0x3
	ble _0802C9E0
_0802CA3C:
	ldr r2, [sp, 0x8]
	cmp r2, 0x5
	ble _0802C996
	mov r1, r10
	cmp r1, 0
	beq _0802CAB4
	ldr r2, _0802CAA0 @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _0802CAA4 @ =0xfffffbff
	ands r0, r1
	str r0, [r2]
	ldr r4, _0802CAA8 @ =gCalledMove
	bl Random
	movs r1, 0xFF
	ands r1, r0
	mov r0, r10
	muls r0, r1
	asrs r0, 8
	lsls r0, 1
	ldr r1, [sp, 0x4]
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r4]
	ldrh r0, [r4]
	movs r1, 0
	bl GetMoveTarget
	ldr r1, _0802CAAC @ =gBattlerTarget
	strb r0, [r1]
	ldr r1, _0802CAB0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802CACE
	.align 2, 0
_0802CA84: .4byte gBattleStruct
_0802CA88: .4byte gBattlerAttacker
_0802CA8C: .4byte gPlayerParty
_0802CA90: .4byte gEnemyParty
_0802CA94: .4byte gBattlerPartyIndexes
_0802CA98: .4byte 0x0000ffff
_0802CA9C: .4byte sMovesForbiddenToCopy
_0802CAA0: .4byte gHitMarker
_0802CAA4: .4byte 0xfffffbff
_0802CAA8: .4byte gCalledMove
_0802CAAC: .4byte gBattlerTarget
_0802CAB0: .4byte gBattlescriptCurrInstr
_0802CAB4:
	ldr r3, _0802CAE0 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802CACE:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802CAE0: .4byte gBattlescriptCurrInstr
	thumb_func_end atkDE_assistattackselect

	thumb_func_start atkDF_trysetmagiccoat
atkDF_trysetmagiccoat: @ 802CAE4
	push {lr}
	ldr r1, _0802CB2C @ =gBattlerTarget
	ldr r3, _0802CB30 @ =gBattlerAttacker
	ldrb r0, [r3]
	strb r0, [r1]
	ldr r2, _0802CB34 @ =gSpecialStatuses
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _0802CB38 @ =gCurrentTurnActionNumber
	ldrb r1, [r0]
	ldr r0, _0802CB3C @ =gBattlersCount
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	bne _0802CB44
	ldr r3, _0802CB40 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802CB5C
	.align 2, 0
_0802CB2C: .4byte gBattlerTarget
_0802CB30: .4byte gBattlerAttacker
_0802CB34: .4byte gSpecialStatuses
_0802CB38: .4byte gCurrentTurnActionNumber
_0802CB3C: .4byte gBattlersCount
_0802CB40: .4byte gBattlescriptCurrInstr
_0802CB44:
	ldr r0, _0802CB60 @ =gProtectStructs
	ldrb r1, [r3]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x10
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _0802CB64 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802CB5C:
	pop {r0}
	bx r0
	.align 2, 0
_0802CB60: .4byte gProtectStructs
_0802CB64: .4byte gBattlescriptCurrInstr
	thumb_func_end atkDF_trysetmagiccoat

	thumb_func_start atkE0_trysetsnatch
atkE0_trysetsnatch: @ 802CB68
	push {lr}
	ldr r2, _0802CBAC @ =gSpecialStatuses
	ldr r3, _0802CBB0 @ =gBattlerAttacker
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _0802CBB4 @ =gCurrentTurnActionNumber
	ldrb r1, [r0]
	ldr r0, _0802CBB8 @ =gBattlersCount
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	bne _0802CBC0
	ldr r3, _0802CBBC @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802CBD6
	.align 2, 0
_0802CBAC: .4byte gSpecialStatuses
_0802CBB0: .4byte gBattlerAttacker
_0802CBB4: .4byte gCurrentTurnActionNumber
_0802CBB8: .4byte gBattlersCount
_0802CBBC: .4byte gBattlescriptCurrInstr
_0802CBC0:
	ldr r0, _0802CBDC @ =gProtectStructs
	ldrb r1, [r3]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _0802CBE0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802CBD6:
	pop {r0}
	bx r0
	.align 2, 0
_0802CBDC: .4byte gProtectStructs
_0802CBE0: .4byte gBattlescriptCurrInstr
	thumb_func_end atkE0_trysetsnatch

	thumb_func_start atkE1_trygetintimidatetarget
atkE1_trygetintimidatetarget: @ 802CBE4
	push {r4-r6,lr}
	ldr r4, _0802CC88 @ =gBattleScripting
	ldr r0, _0802CC8C @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xD8
	ldrb r0, [r0]
	strb r0, [r4, 0x17]
	ldrb r0, [r4, 0x17]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _0802CC90 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r2]
	movs r0, 0x9
	strb r0, [r2, 0x1]
	ldr r3, _0802CC94 @ =gBattleMons
	ldrb r1, [r4, 0x17]
	movs r0, 0x58
	muls r0, r1
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r2, 0x2]
	movs r0, 0xFF
	strb r0, [r2, 0x3]
	ldr r2, _0802CC98 @ =gBattlerTarget
	ldr r1, _0802CC9C @ =gBattlersCount
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bcs _0802CC6A
	adds r4, r2, 0
	ldr r6, _0802CCA0 @ =gBitTable
_0802CC2A:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r5
	beq _0802CC4C
	ldr r0, _0802CCA4 @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ands r1, r0
	ldr r2, _0802CC9C @ =gBattlersCount
	cmp r1, 0
	beq _0802CC60
_0802CC4C:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _0802CC9C @ =gBattlersCount
	lsls r0, 24
	lsrs r0, 24
	adds r2, r1, 0
	ldrb r1, [r2]
	cmp r0, r1
	bcc _0802CC2A
_0802CC60:
	ldr r0, _0802CC98 @ =gBattlerTarget
	ldrb r0, [r0]
	ldrb r2, [r2]
	cmp r0, r2
	bcc _0802CCAC
_0802CC6A:
	ldr r3, _0802CCA8 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802CCB4
	.align 2, 0
_0802CC88: .4byte gBattleScripting
_0802CC8C: .4byte gBattleStruct
_0802CC90: .4byte gBattleTextBuff1
_0802CC94: .4byte gBattleMons
_0802CC98: .4byte gBattlerTarget
_0802CC9C: .4byte gBattlersCount
_0802CCA0: .4byte gBitTable
_0802CCA4: .4byte gAbsentBattlerFlags
_0802CCA8: .4byte gBattlescriptCurrInstr
_0802CCAC:
	ldr r1, _0802CCBC @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802CCB4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802CCBC: .4byte gBattlescriptCurrInstr
	thumb_func_end atkE1_trygetintimidatetarget

	thumb_func_start atkE2_switchoutabilities
atkE2_switchoutabilities: @ 802CCC0
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r5, _0802CD28 @ =gBattlescriptCurrInstr
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl GetBattlerForBattleScript
	ldr r4, _0802CD2C @ =gActiveBattler
	strb r0, [r4]
	ldr r3, _0802CD30 @ =gBattleMons
	ldrb r0, [r4]
	movs r6, 0x58
	adds r1, r0, 0
	muls r1, r6
	adds r0, r1, r3
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1E
	bne _0802CD1A
	adds r3, 0x4C
	adds r1, r3
	movs r0, 0
	str r0, [r1]
	ldr r2, _0802CD34 @ =gBitTable
	ldrb r1, [r4]
	ldr r0, _0802CD38 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, r1, r0
	adds r0, 0x58
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0]
	adds r0, r1, 0
	muls r0, r6
	adds r0, r3
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r3, 0x4
	bl BtlController_EmitSetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_0802CD1A:
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802CD28: .4byte gBattlescriptCurrInstr
_0802CD2C: .4byte gActiveBattler
_0802CD30: .4byte gBattleMons
_0802CD34: .4byte gBitTable
_0802CD38: .4byte gBattleStruct
	thumb_func_end atkE2_switchoutabilities

	thumb_func_start atkE3_jumpifhasnohp
atkE3_jumpifhasnohp: @ 802CD3C
	push {r4,lr}
	ldr r4, _0802CD78 @ =gBattlescriptCurrInstr
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl GetBattlerForBattleScript
	ldr r1, _0802CD7C @ =gActiveBattler
	strb r0, [r1]
	ldr r2, _0802CD80 @ =gBattleMons
	ldrb r1, [r1]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _0802CD84
	ldr r2, [r4]
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0802CD8A
	.align 2, 0
_0802CD78: .4byte gBattlescriptCurrInstr
_0802CD7C: .4byte gActiveBattler
_0802CD80: .4byte gBattleMons
_0802CD84:
	ldr r0, [r4]
	adds r0, 0x6
	str r0, [r4]
_0802CD8A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end atkE3_jumpifhasnohp

	thumb_func_start atkE4_getsecretpowereffect
atkE4_getsecretpowereffect: @ 802CD90
	push {lr}
	ldr r0, _0802CDA4 @ =gBattleTerrain
	ldrb r0, [r0]
	cmp r0, 0x7
	bhi _0802CE2C
	lsls r0, 2
	ldr r1, _0802CDA8 @ =_0802CDAC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802CDA4: .4byte gBattleTerrain
_0802CDA8: .4byte _0802CDAC
	.align 2, 0
_0802CDAC:
	.4byte _0802CDCC
	.4byte _0802CDD8
	.4byte _0802CDE4
	.4byte _0802CDF0
	.4byte _0802CDFC
	.4byte _0802CE08
	.4byte _0802CE14
	.4byte _0802CE20
_0802CDCC:
	ldr r1, _0802CDD4 @ =gBattleCommunication
	movs r0, 0x2
	b _0802CE30
	.align 2, 0
_0802CDD4: .4byte gBattleCommunication
_0802CDD8:
	ldr r1, _0802CDE0 @ =gBattleCommunication
	movs r0, 0x1
	b _0802CE30
	.align 2, 0
_0802CDE0: .4byte gBattleCommunication
_0802CDE4:
	ldr r1, _0802CDEC @ =gBattleCommunication
	movs r0, 0x1B
	b _0802CE30
	.align 2, 0
_0802CDEC: .4byte gBattleCommunication
_0802CDF0:
	ldr r1, _0802CDF8 @ =gBattleCommunication
	movs r0, 0x17
	b _0802CE30
	.align 2, 0
_0802CDF8: .4byte gBattleCommunication
_0802CDFC:
	ldr r1, _0802CE04 @ =gBattleCommunication
	movs r0, 0x16
	b _0802CE30
	.align 2, 0
_0802CE04: .4byte gBattleCommunication
_0802CE08:
	ldr r1, _0802CE10 @ =gBattleCommunication
	movs r0, 0x18
	b _0802CE30
	.align 2, 0
_0802CE10: .4byte gBattleCommunication
_0802CE14:
	ldr r1, _0802CE1C @ =gBattleCommunication
	movs r0, 0x7
	b _0802CE30
	.align 2, 0
_0802CE1C: .4byte gBattleCommunication
_0802CE20:
	ldr r1, _0802CE28 @ =gBattleCommunication
	movs r0, 0x8
	b _0802CE30
	.align 2, 0
_0802CE28: .4byte gBattleCommunication
_0802CE2C:
	ldr r1, _0802CE40 @ =gBattleCommunication
	movs r0, 0x5
_0802CE30:
	strb r0, [r1, 0x3]
	ldr r1, _0802CE44 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802CE40: .4byte gBattleCommunication
_0802CE44: .4byte gBattlescriptCurrInstr
	thumb_func_end atkE4_getsecretpowereffect

	thumb_func_start atkE5_pickup
atkE5_pickup: @ 802CE48
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r7, 0
	ldr r0, _0802CE90 @ =gBaseStats
	mov r8, r0
_0802CE54:
	movs r0, 0x64
	adds r4, r7, 0
	muls r4, r0
	ldr r0, _0802CE94 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	movs r1, 0x2E
	bl GetMonData
	cmp r0, 0
	beq _0802CE98
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	add r0, r8
	ldrb r0, [r0, 0x17]
	b _0802CEA2
	.align 2, 0
_0802CE90: .4byte gBaseStats
_0802CE94: .4byte gPlayerParty
_0802CE98:
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	add r0, r8
	ldrb r0, [r0, 0x16]
_0802CEA2:
	adds r4, r7, 0x1
	cmp r0, 0x35
	bne _0802CF0A
	cmp r5, 0
	beq _0802CF0A
	movs r0, 0xCE
	lsls r0, 1
	cmp r5, r0
	beq _0802CF0A
	cmp r6, 0
	bne _0802CF0A
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	bne _0802CF0A
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r1, _0802CEE4 @ =sPickupItems
	b _0802CEF0
	.align 2, 0
_0802CEE4: .4byte sPickupItems
_0802CEE8:
	adds r1, 0x4
	adds r2, 0x1
	cmp r2, 0xE
	bhi _0802CEF6
_0802CEF0:
	ldrb r0, [r1, 0x2]
	cmp r0, r3
	ble _0802CEE8
_0802CEF6:
	movs r0, 0x64
	muls r0, r7
	ldr r1, _0802CF24 @ =gPlayerParty
	adds r0, r1
	lsls r2, 2
	ldr r1, _0802CF28 @ =sPickupItems
	adds r2, r1
	movs r1, 0xC
	bl SetMonData
_0802CF0A:
	adds r7, r4, 0
	cmp r7, 0x5
	ble _0802CE54
	ldr r1, _0802CF2C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802CF24: .4byte gPlayerParty
_0802CF28: .4byte sPickupItems
_0802CF2C: .4byte gBattlescriptCurrInstr
	thumb_func_end atkE5_pickup

	thumb_func_start atkE6_docastformchangeanimation
atkE6_docastformchangeanimation: @ 802CF30
	push {r4,lr}
	ldr r4, _0802CF84 @ =gActiveBattler
	ldr r0, _0802CF88 @ =gBattleScripting
	ldrb r0, [r0, 0x17]
	strb r0, [r4]
	ldr r1, _0802CF8C @ =gBattleMons
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 17
	ands r0, r1
	ldr r3, _0802CF90 @ =gBattleStruct
	cmp r0, 0
	beq _0802CF60
	ldr r0, [r3]
	adds r0, 0x7F
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
_0802CF60:
	ldr r0, [r3]
	adds r0, 0x7F
	ldrb r2, [r0]
	movs r0, 0
	movs r1, 0
	bl BtlController_EmitBattleAnimation
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r1, _0802CF94 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802CF84: .4byte gActiveBattler
_0802CF88: .4byte gBattleScripting
_0802CF8C: .4byte gBattleMons
_0802CF90: .4byte gBattleStruct
_0802CF94: .4byte gBattlescriptCurrInstr
	thumb_func_end atkE6_docastformchangeanimation

	thumb_func_start atkE7_trycastformdatachange
atkE7_trycastformdatachange: @ 802CF98
	push {r4,lr}
	ldr r1, _0802CFC8 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r0, _0802CFCC @ =gBattleScripting
	ldrb r0, [r0, 0x17]
	bl CastformDataTypeChange
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _0802CFC2
	ldr r0, _0802CFD0 @ =BattleScript_CastformChange
	bl BattleScriptPushCursorAndCallback
	ldr r0, _0802CFD4 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x7F
	subs r1, r4, 0x1
	strb r1, [r0]
_0802CFC2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802CFC8: .4byte gBattlescriptCurrInstr
_0802CFCC: .4byte gBattleScripting
_0802CFD0: .4byte BattleScript_CastformChange
_0802CFD4: .4byte gBattleStruct
	thumb_func_end atkE7_trycastformdatachange

	thumb_func_start atkE8_settypebasedhalvers
atkE8_settypebasedhalvers: @ 802CFD8
	push {r4,lr}
	movs r4, 0
	ldr r2, _0802D014 @ =gBattleMoves
	ldr r0, _0802D018 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0xC9
	bne _0802D028
	ldr r1, _0802D01C @ =gStatuses3
	ldr r0, _0802D020 @ =gBattlerAttacker
	ldrb r0, [r0]
	lsls r0, 2
	adds r2, r0, r1
	ldr r1, [r2]
	movs r3, 0x80
	lsls r3, 9
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	bne _0802D04C
	orrs r1, r3
	str r1, [r2]
	ldr r0, _0802D024 @ =gBattleCommunication
	strb r4, [r0, 0x5]
	b _0802D050
	.align 2, 0
_0802D014: .4byte gBattleMoves
_0802D018: .4byte gCurrentMove
_0802D01C: .4byte gStatuses3
_0802D020: .4byte gBattlerAttacker
_0802D024: .4byte gBattleCommunication
_0802D028:
	ldr r1, _0802D05C @ =gStatuses3
	ldr r0, _0802D060 @ =gBattlerAttacker
	ldrb r0, [r0]
	lsls r0, 2
	adds r2, r0, r1
	ldr r1, [r2]
	movs r3, 0x80
	lsls r3, 10
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	bne _0802D04C
	orrs r1, r3
	str r1, [r2]
	ldr r1, _0802D064 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
	movs r4, 0x1
_0802D04C:
	cmp r4, 0
	beq _0802D06C
_0802D050:
	ldr r1, _0802D068 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802D086
	.align 2, 0
_0802D05C: .4byte gStatuses3
_0802D060: .4byte gBattlerAttacker
_0802D064: .4byte gBattleCommunication
_0802D068: .4byte gBattlescriptCurrInstr
_0802D06C:
	ldr r3, _0802D08C @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802D086:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D08C: .4byte gBattlescriptCurrInstr
	thumb_func_end atkE8_settypebasedhalvers

	thumb_func_start atkE9_setweatherballtype
atkE9_setweatherballtype: @ 802D090
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0802D130
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	bne _0802D130
	ldr r2, _0802D0E0 @ =gBattleWeather
	ldrb r0, [r2]
	cmp r0, 0
	beq _0802D0CE
	ldr r1, _0802D0E4 @ =gBattleScripting
	movs r0, 0x2
	strb r0, [r1, 0xE]
_0802D0CE:
	ldrh r1, [r2]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _0802D0EC
	ldr r0, _0802D0E8 @ =gBattleStruct
	ldr r1, [r0]
	movs r0, 0x8B
	b _0802D12E
	.align 2, 0
_0802D0E0: .4byte gBattleWeather
_0802D0E4: .4byte gBattleScripting
_0802D0E8: .4byte gBattleStruct
_0802D0EC:
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	beq _0802D100
	ldr r0, _0802D0FC @ =gBattleStruct
	ldr r1, [r0]
	movs r0, 0x85
	b _0802D12E
	.align 2, 0
_0802D0FC: .4byte gBattleStruct
_0802D100:
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _0802D114
	ldr r0, _0802D110 @ =gBattleStruct
	ldr r1, [r0]
	movs r0, 0x8A
	b _0802D12E
	.align 2, 0
_0802D110: .4byte gBattleStruct
_0802D114:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802D128
	ldr r0, _0802D124 @ =gBattleStruct
	ldr r1, [r0]
	movs r0, 0x8F
	b _0802D12E
	.align 2, 0
_0802D124: .4byte gBattleStruct
_0802D128:
	ldr r0, _0802D140 @ =gBattleStruct
	ldr r1, [r0]
	movs r0, 0x80
_0802D12E:
	strb r0, [r1, 0x13]
_0802D130:
	ldr r1, _0802D144 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0802D140: .4byte gBattleStruct
_0802D144: .4byte gBattlescriptCurrInstr
	thumb_func_end atkE9_setweatherballtype

	thumb_func_start atkEA_tryrecycleitem
atkEA_tryrecycleitem: @ 802D148
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r7, _0802D1B0 @ =gActiveBattler
	ldr r0, _0802D1B4 @ =gBattlerAttacker
	ldrb r0, [r0]
	strb r0, [r7]
	ldr r1, _0802D1B8 @ =gBattleStruct
	ldrb r2, [r7]
	lsls r0, r2, 1
	adds r0, 0xB8
	ldr r1, [r1]
	adds r6, r1, r0
	ldrh r5, [r6]
	cmp r5, 0
	beq _0802D1C8
	ldr r4, _0802D1BC @ =gBattleMons
	movs r3, 0x58
	adds r0, r2, 0
	muls r0, r3
	adds r0, r4
	ldrh r0, [r0, 0x2E]
	cmp r0, 0
	bne _0802D1C8
	ldr r1, _0802D1C0 @ =gLastUsedItem
	strh r5, [r1]
	strh r0, [r6]
	ldrb r0, [r7]
	muls r0, r3
	adds r0, r4
	ldrh r1, [r1]
	strh r1, [r0, 0x2E]
	ldrb r0, [r7]
	muls r0, r3
	adds r1, r4, 0
	adds r1, 0x2E
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl BtlController_EmitSetMonData
	ldrb r0, [r7]
	bl MarkBattlerForControllerExec
	ldr r1, _0802D1C4 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802D1E2
	.align 2, 0
_0802D1B0: .4byte gActiveBattler
_0802D1B4: .4byte gBattlerAttacker
_0802D1B8: .4byte gBattleStruct
_0802D1BC: .4byte gBattleMons
_0802D1C0: .4byte gLastUsedItem
_0802D1C4: .4byte gBattlescriptCurrInstr
_0802D1C8:
	ldr r3, _0802D1EC @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802D1E2:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D1EC: .4byte gBattlescriptCurrInstr
	thumb_func_end atkEA_tryrecycleitem

	thumb_func_start atkEB_settypetoterrain
atkEB_settypetoterrain: @ 802D1F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _0802D260 @ =gBattleMons
	mov r8, r0
	ldr r7, _0802D264 @ =gBattlerAttacker
	ldrb r0, [r7]
	movs r6, 0x58
	muls r0, r6
	mov r1, r8
	adds r3, r0, r1
	movs r0, 0x21
	adds r0, r3
	mov r12, r0
	ldr r5, _0802D268 @ =sTerrainToType
	ldr r4, _0802D26C @ =gBattleTerrain
	ldrb r0, [r4]
	adds r0, r5
	ldrb r2, [r0]
	mov r1, r12
	ldrb r0, [r1]
	adds r1, r2, 0
	cmp r0, r1
	beq _0802D278
	adds r0, r3, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, r1
	beq _0802D278
	mov r0, r12
	strb r2, [r0]
	ldrb r0, [r7]
	adds r1, r0, 0
	muls r1, r6
	add r1, r8
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	adds r1, 0x22
	strb r0, [r1]
	ldr r1, _0802D270 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x3
	strb r0, [r1, 0x1]
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r1, _0802D274 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802D292
	.align 2, 0
_0802D260: .4byte gBattleMons
_0802D264: .4byte gBattlerAttacker
_0802D268: .4byte sTerrainToType
_0802D26C: .4byte gBattleTerrain
_0802D270: .4byte gBattleTextBuff1
_0802D274: .4byte gBattlescriptCurrInstr
_0802D278:
	ldr r3, _0802D29C @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802D292:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D29C: .4byte gBattlescriptCurrInstr
	thumb_func_end atkEB_settypetoterrain

	thumb_func_start atkEC_pursuitrelated
atkEC_pursuitrelated: @ 802D2A0
	push {r4-r6,lr}
	ldr r5, _0802D314 @ =gBattlerAttacker
	ldrb r0, [r5]
	bl GetBattlerPosition
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerAtPosition
	ldr r4, _0802D318 @ =gActiveBattler
	strb r0, [r4]
	ldr r0, _0802D31C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r6, 0x1
	ands r0, r6
	cmp r0, 0
	beq _0802D340
	ldr r0, _0802D320 @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldr r2, _0802D324 @ =gBitTable
	ldrb r3, [r4]
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0802D340
	ldr r0, _0802D328 @ =gChosenActionByBattler
	adds r0, r3, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _0802D340
	ldr r1, _0802D32C @ =gChosenMoveByBattler
	lsls r0, r3, 1
	adds r0, r1
	ldrh r2, [r0]
	cmp r2, 0xE4
	bne _0802D340
	ldr r0, _0802D330 @ =gActionsByTurnOrder
	adds r0, r3, r0
	movs r1, 0xB
	strb r1, [r0]
	ldr r0, _0802D334 @ =gCurrentMove
	strh r2, [r0]
	ldr r1, _0802D338 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	ldr r0, _0802D33C @ =gBattleScripting
	strb r6, [r0, 0x18]
	ldrb r1, [r5]
	adds r0, 0x20
	strb r1, [r0]
	ldrb r0, [r4]
	strb r0, [r5]
	b _0802D35A
	.align 2, 0
_0802D314: .4byte gBattlerAttacker
_0802D318: .4byte gActiveBattler
_0802D31C: .4byte gBattleTypeFlags
_0802D320: .4byte gAbsentBattlerFlags
_0802D324: .4byte gBitTable
_0802D328: .4byte gChosenActionByBattler
_0802D32C: .4byte gChosenMoveByBattler
_0802D330: .4byte gActionsByTurnOrder
_0802D334: .4byte gCurrentMove
_0802D338: .4byte gBattlescriptCurrInstr
_0802D33C: .4byte gBattleScripting
_0802D340:
	ldr r3, _0802D360 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802D35A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D360: .4byte gBattlescriptCurrInstr
	thumb_func_end atkEC_pursuitrelated

	thumb_func_start atkED_snatchsetbattlers
atkED_snatchsetbattlers: @ 802D364
	push {r4,lr}
	ldr r1, _0802D388 @ =gEffectBattler
	ldr r3, _0802D38C @ =gBattlerAttacker
	ldrb r0, [r3]
	strb r0, [r1]
	ldr r2, _0802D390 @ =gBattlerTarget
	lsls r0, 24
	lsrs r0, 24
	adds r4, r1, 0
	ldrb r1, [r2]
	cmp r0, r1
	bne _0802D398
	ldr r1, _0802D394 @ =gBattleScripting
	ldrb r0, [r1, 0x17]
	strb r0, [r2]
	strb r0, [r3]
	b _0802D39E
	.align 2, 0
_0802D388: .4byte gEffectBattler
_0802D38C: .4byte gBattlerAttacker
_0802D390: .4byte gBattlerTarget
_0802D394: .4byte gBattleScripting
_0802D398:
	ldr r1, _0802D3B0 @ =gBattleScripting
	ldrb r0, [r1, 0x17]
	strb r0, [r2]
_0802D39E:
	ldrb r0, [r4]
	strb r0, [r1, 0x17]
	ldr r1, _0802D3B4 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D3B0: .4byte gBattleScripting
_0802D3B4: .4byte gBattlescriptCurrInstr
	thumb_func_end atkED_snatchsetbattlers

	thumb_func_start atkEE_removelightscreenreflect
atkEE_removelightscreenreflect: @ 802D3B8
	push {r4,lr}
	ldr r0, _0802D400 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0802D404 @ =gSideTimers
	lsls r3, r0, 1
	adds r0, r3, r0
	lsls r0, 2
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	bne _0802D3E0
	ldrb r1, [r4, 0x2]
	cmp r1, 0
	beq _0802D418
_0802D3E0:
	ldr r2, _0802D408 @ =gSideStatuses
	adds r2, r3, r2
	ldrh r1, [r2]
	ldr r0, _0802D40C @ =0x0000fffe
	ands r0, r1
	movs r3, 0
	ldr r1, _0802D410 @ =0x0000fffd
	ands r0, r1
	strh r0, [r2]
	strb r3, [r4]
	strb r3, [r4, 0x2]
	ldr r1, _0802D414 @ =gBattleScripting
	movs r0, 0x1
	strb r0, [r1, 0x18]
	strb r0, [r1, 0x19]
	b _0802D41E
	.align 2, 0
_0802D400: .4byte gBattlerAttacker
_0802D404: .4byte gSideTimers
_0802D408: .4byte gSideStatuses
_0802D40C: .4byte 0x0000fffe
_0802D410: .4byte 0x0000fffd
_0802D414: .4byte gBattleScripting
_0802D418:
	ldr r0, _0802D42C @ =gBattleScripting
	strb r1, [r0, 0x18]
	strb r1, [r0, 0x19]
_0802D41E:
	ldr r1, _0802D430 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D42C: .4byte gBattleScripting
_0802D430: .4byte gBattlescriptCurrInstr
	thumb_func_end atkEE_removelightscreenreflect

	thumb_func_start atkEF_handleballthrow
atkEF_handleballthrow: @ 802D434
	push {r4-r6,lr}
	movs r4, 0
	ldr r0, _0802D474 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	beq _0802D442
	b _0802D7EE
_0802D442:
	ldr r5, _0802D478 @ =gActiveBattler
	ldr r0, _0802D47C @ =gBattlerAttacker
	ldrb r0, [r0]
	strb r0, [r5]
	ldr r6, _0802D480 @ =gBattlerTarget
	movs r1, 0x1
	eors r0, r1
	strb r0, [r6]
	ldr r0, _0802D484 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _0802D490
	movs r0, 0
	movs r1, 0x6
	bl BtlController_EmitBallThrowAnim
	ldrb r0, [r5]
	bl MarkBattlerForControllerExec
	ldr r1, _0802D488 @ =gBattlescriptCurrInstr
	ldr r0, _0802D48C @ =BattleScript_GhostBallDodge
	b _0802D7EC
	.align 2, 0
_0802D474: .4byte gBattleControllerExecFlags
_0802D478: .4byte gActiveBattler
_0802D47C: .4byte gBattlerAttacker
_0802D480: .4byte gBattlerTarget
_0802D484: .4byte gBattleTypeFlags
_0802D488: .4byte gBattlescriptCurrInstr
_0802D48C: .4byte BattleScript_GhostBallDodge
_0802D490:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0802D4B4
	movs r0, 0
	movs r1, 0x5
	bl BtlController_EmitBallThrowAnim
	ldrb r0, [r5]
	bl MarkBattlerForControllerExec
	ldr r1, _0802D4AC @ =gBattlescriptCurrInstr
	ldr r0, _0802D4B0 @ =BattleScript_TrainerBallBlock
	b _0802D7EC
	.align 2, 0
_0802D4AC: .4byte gBattlescriptCurrInstr
_0802D4B0: .4byte BattleScript_TrainerBallBlock
_0802D4B4:
	movs r0, 0x81
	lsls r0, 9
	ands r1, r0
	cmp r1, 0
	beq _0802D4DC
	movs r0, 0
	movs r1, 0x4
	bl BtlController_EmitBallThrowAnim
	ldrb r0, [r5]
	bl MarkBattlerForControllerExec
	ldr r1, _0802D4D4 @ =gBattlescriptCurrInstr
	ldr r0, _0802D4D8 @ =gUnknown_81D9A88
	b _0802D7EC
	.align 2, 0
_0802D4D4: .4byte gBattlescriptCurrInstr
_0802D4D8: .4byte gUnknown_81D9A88
_0802D4DC:
	ldr r0, _0802D500 @ =gLastUsedItem
	ldrh r0, [r0]
	cmp r0, 0x5
	bne _0802D508
	ldr r0, _0802D504 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x7C
	ldrb r0, [r0]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 8
	subs r0, r1
	movs r1, 0x64
	bl __divsi3
	lsls r0, 24
	lsrs r5, r0, 24
	b _0802D520
	.align 2, 0
_0802D500: .4byte gLastUsedItem
_0802D504: .4byte gBattleStruct
_0802D508:
	ldr r3, _0802D53C @ =gBaseStats
	ldr r2, _0802D540 @ =gBattleMons
	ldrb r1, [r6]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r5, [r0, 0x8]
_0802D520:
	ldr r2, _0802D544 @ =gLastUsedItem
	ldrh r0, [r2]
	cmp r0, 0x5
	bhi _0802D52A
	b _0802D620
_0802D52A:
	subs r0, 0x6
	cmp r0, 0x6
	bls _0802D532
	b _0802D62A
_0802D532:
	lsls r0, 2
	ldr r1, _0802D548 @ =_0802D54C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802D53C: .4byte gBaseStats
_0802D540: .4byte gBattleMons
_0802D544: .4byte gLastUsedItem
_0802D548: .4byte _0802D54C
	.align 2, 0
_0802D54C:
	.4byte _0802D568
	.4byte _0802D598
	.4byte _0802D5AA
	.4byte _0802D5D8
	.4byte _0802D608
	.4byte _0802D5CA
	.4byte _0802D5CA
_0802D568:
	ldr r2, _0802D590 @ =gBattleMons
	ldr r0, _0802D594 @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r1, r0, 0
	adds r1, 0x21
	ldrb r1, [r1]
	cmp r1, 0xB
	beq _0802D5FC
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0xB
	beq _0802D5FC
	cmp r1, 0x6
	beq _0802D5FC
	cmp r0, 0x6
	beq _0802D5FC
	b _0802D5CA
	.align 2, 0
_0802D590: .4byte gBattleMons
_0802D594: .4byte gBattlerTarget
_0802D598:
	bl GetCurrentMapType
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0xA
	cmp r0, 0x5
	bne _0802D62A
	movs r4, 0x23
	b _0802D62A
_0802D5AA:
	ldr r2, _0802D5D0 @ =gBattleMons
	ldr r0, _0802D5D4 @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x2A
	ldrb r1, [r0]
	cmp r1, 0x27
	bhi _0802D5CA
	movs r0, 0x28
	subs r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bhi _0802D62A
_0802D5CA:
	movs r4, 0xA
	b _0802D62A
	.align 2, 0
_0802D5D0: .4byte gBattleMons
_0802D5D4: .4byte gBattlerTarget
_0802D5D8:
	ldr r2, _0802D600 @ =gBattleMons
	ldr r0, _0802D604 @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl GetSetPokedexFlag
	lsls r0, 24
	movs r4, 0xA
	cmp r0, 0
	beq _0802D62A
_0802D5FC:
	movs r4, 0x1E
	b _0802D62A
	.align 2, 0
_0802D600: .4byte gBattleMons
_0802D604: .4byte gBattlerTarget
_0802D608:
	ldr r0, _0802D61C @ =gBattleResults
	ldrb r0, [r0, 0x13]
	adds r0, 0xA
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x28
	bls _0802D62A
	movs r4, 0x28
	b _0802D62A
	.align 2, 0
_0802D61C: .4byte gBattleResults
_0802D620:
	ldr r1, _0802D694 @ =sBallCatchBonuses
	ldrh r0, [r2]
	subs r0, 0x2
	adds r0, r1
	ldrb r4, [r0]
_0802D62A:
	adds r0, r5, 0
	muls r0, r4
	movs r1, 0xA
	bl __divsi3
	ldr r5, _0802D698 @ =gBattleMons
	ldr r1, _0802D69C @ =gBattlerTarget
	ldrb r2, [r1]
	movs r1, 0x58
	adds r4, r2, 0
	muls r4, r1
	adds r3, r4, r5
	ldrh r2, [r3, 0x2C]
	lsls r1, r2, 1
	adds r1, r2
	ldrh r2, [r3, 0x28]
	lsls r2, 1
	subs r2, r1, r2
	muls r0, r2
	bl __divsi3
	adds r6, r0, 0
	adds r5, 0x4C
	adds r4, r5
	ldr r4, [r4]
	movs r0, 0x27
	ands r0, r4
	cmp r0, 0
	beq _0802D666
	lsls r6, 1
_0802D666:
	movs r0, 0xD8
	ands r4, r0
	cmp r4, 0
	beq _0802D67A
	lsls r0, r6, 4
	subs r0, r6
	movs r1, 0xA
	bl __udivsi3
	adds r6, r0, 0
_0802D67A:
	ldr r1, _0802D6A0 @ =gLastUsedItem
	ldrh r0, [r1]
	cmp r0, 0x5
	beq _0802D6BC
	cmp r0, 0x1
	bne _0802D6A8
	ldr r0, _0802D6A4 @ =gBattleResults
	ldrb r1, [r0, 0x5]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0, 0x5]
	b _0802D6BC
	.align 2, 0
_0802D694: .4byte sBallCatchBonuses
_0802D698: .4byte gBattleMons
_0802D69C: .4byte gBattlerTarget
_0802D6A0: .4byte gLastUsedItem
_0802D6A4: .4byte gBattleResults
_0802D6A8:
	ldr r0, _0802D700 @ =gBattleResults
	ldrh r1, [r1]
	adds r0, r1
	adds r1, r0, 0
	adds r1, 0x34
	ldrb r0, [r1]
	cmp r0, 0xFE
	bhi _0802D6BC
	adds r0, 0x1
	strb r0, [r1]
_0802D6BC:
	cmp r6, 0xFE
	bls _0802D720
	movs r0, 0
	movs r1, 0x4
	bl BtlController_EmitBallThrowAnim
	ldr r0, _0802D704 @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBattlerForControllerExec
	ldr r1, _0802D708 @ =gBattlescriptCurrInstr
	ldr r0, _0802D70C @ =BattleScript_SuccessBallThrow
	str r0, [r1]
	ldr r1, _0802D710 @ =gBattlerPartyIndexes
	ldr r0, _0802D714 @ =gBattlerTarget
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802D718 @ =gEnemyParty
	adds r0, r1
	ldr r2, _0802D71C @ =gLastUsedItem
	movs r1, 0x26
	bl SetMonData
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	beq _0802D7AE
	b _0802D7D8
	.align 2, 0
_0802D700: .4byte gBattleResults
_0802D704: .4byte gActiveBattler
_0802D708: .4byte gBattlescriptCurrInstr
_0802D70C: .4byte BattleScript_SuccessBallThrow
_0802D710: .4byte gBattlerPartyIndexes
_0802D714: .4byte gBattlerTarget
_0802D718: .4byte gEnemyParty
_0802D71C: .4byte gLastUsedItem
_0802D720:
	movs r0, 0xFF
	lsls r0, 16
	adds r1, r6, 0
	bl __udivsi3
	bl Sqrt
	lsls r0, 16
	lsrs r0, 16
	bl Sqrt
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _0802D748 @ =0x000ffff0
	adds r1, r6, 0
	bl __udivsi3
	adds r6, r0, 0
	movs r4, 0
	b _0802D752
	.align 2, 0
_0802D748: .4byte 0x000ffff0
_0802D74C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0802D752:
	cmp r4, 0x3
	bhi _0802D762
	bl Random
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r6
	bcc _0802D74C
_0802D762:
	ldr r5, _0802D7B8 @ =gLastUsedItem
	ldrh r0, [r5]
	cmp r0, 0x1
	bne _0802D76C
	movs r4, 0x4
_0802D76C:
	movs r0, 0
	adds r1, r4, 0
	bl BtlController_EmitBallThrowAnim
	ldr r0, _0802D7BC @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBattlerForControllerExec
	cmp r4, 0x4
	bne _0802D7E4
	ldr r1, _0802D7C0 @ =gBattlescriptCurrInstr
	ldr r0, _0802D7C4 @ =BattleScript_SuccessBallThrow
	str r0, [r1]
	ldr r1, _0802D7C8 @ =gBattlerPartyIndexes
	ldr r0, _0802D7CC @ =gBattlerTarget
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802D7D0 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x26
	adds r2, r5, 0
	bl SetMonData
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bne _0802D7D8
_0802D7AE:
	ldr r1, _0802D7D4 @ =gBattleCommunication
	movs r0, 0
	strb r0, [r1, 0x5]
	b _0802D7EE
	.align 2, 0
_0802D7B8: .4byte gLastUsedItem
_0802D7BC: .4byte gActiveBattler
_0802D7C0: .4byte gBattlescriptCurrInstr
_0802D7C4: .4byte BattleScript_SuccessBallThrow
_0802D7C8: .4byte gBattlerPartyIndexes
_0802D7CC: .4byte gBattlerTarget
_0802D7D0: .4byte gEnemyParty
_0802D7D4: .4byte gBattleCommunication
_0802D7D8:
	ldr r1, _0802D7E0 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _0802D7EE
	.align 2, 0
_0802D7E0: .4byte gBattleCommunication
_0802D7E4:
	ldr r0, _0802D7F4 @ =gBattleCommunication
	strb r4, [r0, 0x5]
	ldr r1, _0802D7F8 @ =gBattlescriptCurrInstr
	ldr r0, _0802D7FC @ =BattleScript_ShakeBallThrow
_0802D7EC:
	str r0, [r1]
_0802D7EE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D7F4: .4byte gBattleCommunication
_0802D7F8: .4byte gBattlescriptCurrInstr
_0802D7FC: .4byte BattleScript_ShakeBallThrow
	thumb_func_end atkEF_handleballthrow

	thumb_func_start atkF0_givecaughtmon
atkF0_givecaughtmon: @ 802D800
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _0802D870 @ =gBattlerPartyIndexes
	mov r9, r0
	ldr r5, _0802D874 @ =gBattlerAttacker
	ldrb r0, [r5]
	movs r6, 0x1
	eors r0, r6
	lsls r0, 1
	add r0, r9
	ldrh r0, [r0]
	movs r7, 0x64
	muls r0, r7
	ldr r1, _0802D878 @ =gEnemyParty
	mov r8, r1
	add r0, r8
	bl GiveMonToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0802D8EA
	bl sub_80CC7B4
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0802D88C
	ldr r0, _0802D87C @ =gBattleCommunication
	strb r1, [r0, 0x5]
	ldr r4, _0802D880 @ =gStringVar1
	ldr r0, _0802D884 @ =0x00004037
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	bl GetBoxNamePtr
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrb r0, [r5]
	eors r0, r6
	lsls r0, 1
	add r0, r9
	ldrh r0, [r0]
	muls r0, r7
	add r0, r8
	ldr r2, _0802D888 @ =gStringVar2
	movs r1, 0x2
	bl GetMonData
	b _0802D8D6
	.align 2, 0
_0802D870: .4byte gBattlerPartyIndexes
_0802D874: .4byte gBattlerAttacker
_0802D878: .4byte gEnemyParty
_0802D87C: .4byte gBattleCommunication
_0802D880: .4byte gStringVar1
_0802D884: .4byte 0x00004037
_0802D888: .4byte gStringVar2
_0802D88C:
	ldr r4, _0802D92C @ =gStringVar1
	ldr r0, _0802D930 @ =0x00004037
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	bl GetBoxNamePtr
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrb r0, [r5]
	eors r0, r6
	lsls r0, 1
	add r0, r9
	ldrh r0, [r0]
	muls r0, r7
	add r0, r8
	ldr r2, _0802D934 @ =gStringVar2
	movs r1, 0x2
	bl GetMonData
	ldr r4, _0802D938 @ =gStringVar3
	bl get_unknown_box_id
	lsls r0, 24
	lsrs r0, 24
	bl GetBoxNamePtr
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldr r1, _0802D93C @ =gBattleCommunication
	movs r0, 0x2
	strb r0, [r1, 0x5]
_0802D8D6:
	ldr r0, _0802D940 @ =0x00000834
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0802D8EA
	ldr r1, _0802D93C @ =gBattleCommunication
	ldrb r0, [r1, 0x5]
	adds r0, 0x1
	strb r0, [r1, 0x5]
_0802D8EA:
	ldr r2, _0802D944 @ =gBattleResults
	ldr r3, _0802D948 @ =gBattleMons
	ldr r0, _0802D94C @ =gBattlerAttacker
	ldrb r0, [r0]
	movs r1, 0x1
	eors r1, r0
	movs r0, 0x58
	muls r0, r1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r2, 0x28]
	ldr r0, _0802D950 @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r0
	ldrh r1, [r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802D954 @ =gEnemyParty
	adds r0, r1
	adds r2, 0x2A
	movs r1, 0x2
	bl GetMonData
	ldr r1, _0802D958 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D92C: .4byte gStringVar1
_0802D930: .4byte 0x00004037
_0802D934: .4byte gStringVar2
_0802D938: .4byte gStringVar3
_0802D93C: .4byte gBattleCommunication
_0802D940: .4byte 0x00000834
_0802D944: .4byte gBattleResults
_0802D948: .4byte gBattleMons
_0802D94C: .4byte gBattlerAttacker
_0802D950: .4byte gBattlerPartyIndexes
_0802D954: .4byte gEnemyParty
_0802D958: .4byte gBattlescriptCurrInstr
	thumb_func_end atkF0_givecaughtmon

	thumb_func_start atkF1_trysetcaughtmondexflags
atkF1_trysetcaughtmondexflags: @ 802D95C
	push {r4,r5,lr}
	ldr r4, _0802D9AC @ =gEnemyParty
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	adds r0, r5, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl GetSetPokedexFlag
	lsls r0, 24
	cmp r0, 0
	beq _0802D9B4
	ldr r3, _0802D9B0 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802D9CE
	.align 2, 0
_0802D9AC: .4byte gEnemyParty
_0802D9B0: .4byte gBattlescriptCurrInstr
_0802D9B4:
	adds r0, r5, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	adds r2, r4, 0
	bl HandleSetPokedexFlag
	ldr r1, _0802D9D4 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802D9CE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D9D4: .4byte gBattlescriptCurrInstr
	thumb_func_end atkF1_trysetcaughtmondexflags

	thumb_func_start atkF2_displaydexinfo
atkF2_displaydexinfo: @ 802D9D8
	push {r4,r5,lr}
	sub sp, 0x18
	ldr r0, _0802DA00 @ =gEnemyParty
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _0802DA04 @ =gBattleCommunication
	ldrb r0, [r0]
	cmp r0, 0x5
	bls _0802D9F4
	b _0802DB6C
_0802D9F4:
	lsls r0, 2
	ldr r1, _0802DA08 @ =_0802DA0C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802DA00: .4byte gEnemyParty
_0802DA04: .4byte gBattleCommunication
_0802DA08: .4byte _0802DA0C
	.align 2, 0
_0802DA0C:
	.4byte _0802DA24
	.4byte _0802DA3C
	.4byte _0802DA64
	.4byte _0802DAC8
	.4byte _0802DAE0
	.4byte _0802DB58
_0802DA24:
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0802DA38 @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0802DB34
	.align 2, 0
_0802DA38: .4byte 0x00007fff
_0802DA3C:
	ldr r0, _0802DA5C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802DA4A
	b _0802DB6C
_0802DA4A:
	bl FreeAllWindowBuffers
	adds r0, r5, 0
	bl sub_8106B60
	ldr r1, _0802DA60 @ =gBattleCommunication
	strb r0, [r1, 0x1]
	b _0802DB36
	.align 2, 0
_0802DA5C: .4byte gPaletteFade
_0802DA60: .4byte gBattleCommunication
_0802DA64:
	ldr r0, _0802DAAC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802DA72
	b _0802DB6C
_0802DA72:
	ldr r0, _0802DAB0 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _0802DAB4 @ =BattleMainCB2
	cmp r1, r0
	bne _0802DB6C
	ldr r2, _0802DAB8 @ =gTasks
	ldr r4, _0802DABC @ =gBattleCommunication
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	bne _0802DB6C
	str r0, [sp, 0x10]
	movs r1, 0xC0
	lsls r1, 19
	ldr r2, _0802DAC0 @ =0x05006000
	add r0, sp, 0x10
	bl CpuSet
	ldr r0, _0802DAC4 @ =VBlankCB_Battle
	bl SetVBlankCallback
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0802DB6C
	.align 2, 0
_0802DAAC: .4byte gPaletteFade
_0802DAB0: .4byte gMain
_0802DAB4: .4byte BattleMainCB2
_0802DAB8: .4byte gTasks
_0802DABC: .4byte gBattleCommunication
_0802DAC0: .4byte 0x05006000
_0802DAC4: .4byte VBlankCB_Battle
_0802DAC8:
	bl sub_800F34C
	bl LoadBattleTextboxAndBackground
	ldr r1, _0802DADC @ =gBattle_BG3_X
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	b _0802DB34
	.align 2, 0
_0802DADC: .4byte gBattle_BG3_X
_0802DAE0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0802DB6C
	ldr r0, _0802DB40 @ =gBattleMons
	adds r1, r0, 0
	adds r1, 0xAC
	ldr r1, [r1]
	adds r0, 0xA0
	ldr r2, [r0]
	movs r0, 0x78
	str r0, [sp]
	movs r0, 0x40
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	ldr r0, _0802DB44 @ =0x0000ffff
	str r0, [sp, 0xC]
	adds r0, r5, 0
	movs r3, 0x1
	bl CreateMonPicSprite_HandleDeoxys
	str r4, [sp, 0x14]
	add r0, sp, 0x14
	ldr r1, _0802DB48 @ =gPlttBufferFaded
	ldr r2, _0802DB4C @ =0x05000080
	bl CpuSet
	ldr r0, _0802DB50 @ =0x0001ffff
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
_0802DB34:
	ldr r1, _0802DB54 @ =gBattleCommunication
_0802DB36:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0802DB6C
	.align 2, 0
_0802DB40: .4byte gBattleMons
_0802DB44: .4byte 0x0000ffff
_0802DB48: .4byte gPlttBufferFaded
_0802DB4C: .4byte 0x05000080
_0802DB50: .4byte 0x0001ffff
_0802DB54: .4byte gBattleCommunication
_0802DB58:
	ldr r0, _0802DB74 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0802DB6C
	ldr r1, _0802DB78 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_0802DB6C:
	add sp, 0x18
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802DB74: .4byte gPaletteFade
_0802DB78: .4byte gBattlescriptCurrInstr
	thumb_func_end atkF2_displaydexinfo

	thumb_func_start HandleBattleWindow
HandleBattleWindow: @ 802DB7C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	ldr r4, [sp, 0x40]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x10]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x1C]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x14]
	lsls r4, 24
	lsrs r4, 24
	mov r10, r4
	movs r1, 0
	add r0, sp, 0xC
	strh r1, [r0]
	ldr r6, [sp, 0x10]
	cmp r6, r3
	ble _0802DBB6
	b _0802DCA2
_0802DBB6:
	mov r4, r8
	adds r0, r6, 0x1
	str r0, [sp, 0x18]
	ldr r2, [sp, 0x1C]
	cmp r4, r2
	bgt _0802DC98
	add r5, sp, 0xC
	lsls r7, r6, 24
	mov r9, r7
_0802DBC8:
	ldr r0, [sp, 0x10]
	cmp r6, r0
	bne _0802DBF4
	cmp r4, r8
	bne _0802DBDC
	ldr r0, _0802DBD8 @ =0x00001022
	b _0802DC3E
	.align 2, 0
_0802DBD8: .4byte 0x00001022
_0802DBDC:
	ldr r2, [sp, 0x1C]
	cmp r4, r2
	bne _0802DBEC
	ldr r0, _0802DBE8 @ =0x00001024
	b _0802DC3E
	.align 2, 0
_0802DBE8: .4byte 0x00001024
_0802DBEC:
	ldr r0, _0802DBF0 @ =0x00001023
	b _0802DC3E
	.align 2, 0
_0802DBF0: .4byte 0x00001023
_0802DBF4:
	ldr r7, [sp, 0x14]
	cmp r6, r7
	bne _0802DC20
	cmp r4, r8
	bne _0802DC08
	ldr r0, _0802DC04 @ =0x00001028
	b _0802DC3E
	.align 2, 0
_0802DC04: .4byte 0x00001028
_0802DC08:
	ldr r0, [sp, 0x1C]
	cmp r4, r0
	bne _0802DC18
	ldr r0, _0802DC14 @ =0x0000102a
	b _0802DC3E
	.align 2, 0
_0802DC14: .4byte 0x0000102a
_0802DC18:
	ldr r0, _0802DC1C @ =0x00001029
	b _0802DC3E
	.align 2, 0
_0802DC1C: .4byte 0x00001029
_0802DC20:
	cmp r4, r8
	bne _0802DC2C
	ldr r0, _0802DC28 @ =0x00001025
	b _0802DC3E
	.align 2, 0
_0802DC28: .4byte 0x00001025
_0802DC2C:
	ldr r2, [sp, 0x1C]
	cmp r4, r2
	bne _0802DC3C
	ldr r0, _0802DC38 @ =0x00001027
	b _0802DC3E
	.align 2, 0
_0802DC38: .4byte 0x00001027
_0802DC3C:
	ldr r0, _0802DC74 @ =0x00001026
_0802DC3E:
	strh r0, [r5]
	movs r1, 0x1
	mov r0, r10
	ands r0, r1
	cmp r0, 0
	beq _0802DC4E
	movs r0, 0
	strh r0, [r5]
_0802DC4E:
	movs r0, 0x80
	mov r7, r10
	ands r0, r7
	cmp r0, 0
	beq _0802DC78
	lsls r2, r4, 24
	lsrs r2, 24
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0x1
	add r1, sp, 0xC
	mov r7, r9
	lsrs r3, r7, 24
	bl CopyToBgTilemapBufferRect_ChangePalette
	b _0802DC90
	.align 2, 0
_0802DC74: .4byte 0x00001026
_0802DC78:
	lsls r2, r4, 24
	lsrs r2, 24
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	add r1, sp, 0xC
	mov r7, r9
	lsrs r3, r7, 24
	bl CopyToBgTilemapBufferRect_ChangePalette
_0802DC90:
	adds r4, 0x1
	ldr r0, [sp, 0x1C]
	cmp r4, r0
	ble _0802DBC8
_0802DC98:
	ldr r6, [sp, 0x18]
	ldr r2, [sp, 0x14]
	cmp r6, r2
	bgt _0802DCA2
	b _0802DBB6
_0802DCA2:
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end HandleBattleWindow

	thumb_func_start BattleCreateYesNoCursorAt
BattleCreateYesNoCursorAt: @ 802DCB8
	push {lr}
	sub sp, 0x10
	add r0, sp, 0xC
	movs r2, 0x1
	strh r2, [r0]
	movs r1, 0x2
	strh r1, [r0, 0x2]
	ldr r0, _0802DCF4 @ =gBattleCommunication
	ldrb r3, [r0, 0x1]
	lsls r3, 25
	movs r0, 0x90
	lsls r0, 20
	adds r3, r0
	lsrs r3, 24
	str r2, [sp]
	str r1, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	add r1, sp, 0xC
	movs r2, 0x18
	bl CopyToBgTilemapBufferRect_ChangePalette
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_0802DCF4: .4byte gBattleCommunication
	thumb_func_end BattleCreateYesNoCursorAt

	thumb_func_start BattleDestroyYesNoCursorAt
BattleDestroyYesNoCursorAt: @ 802DCF8
	push {lr}
	sub sp, 0x10
	add r0, sp, 0xC
	movs r1, 0x20
	strh r1, [r0]
	strh r1, [r0, 0x2]
	ldr r0, _0802DD34 @ =gBattleCommunication
	ldrb r3, [r0, 0x1]
	lsls r3, 25
	movs r0, 0x90
	lsls r0, 20
	adds r3, r0
	lsrs r3, 24
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	add r1, sp, 0xC
	movs r2, 0x18
	bl CopyToBgTilemapBufferRect_ChangePalette
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_0802DD34: .4byte gBattleCommunication
	thumb_func_end BattleDestroyYesNoCursorAt

	thumb_func_start atkF3_trygivecaughtmonnick
atkF3_trygivecaughtmonnick: @ 802DD38
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r0, _0802DD5C @ =gBattleCommunication
	ldrb r1, [r0]
	adds r4, r0, 0
	cmp r1, 0x4
	bls _0802DD50
	b _0802DFA6
_0802DD50:
	lsls r0, r1, 2
	ldr r1, _0802DD60 @ =_0802DD64
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802DD5C: .4byte gBattleCommunication
_0802DD60: .4byte _0802DD64
	.align 2, 0
_0802DD64:
	.4byte _0802DD78
	.4byte _0802DDA8
	.4byte _0802DE40
	.4byte _0802DF18
	.4byte _0802DF70
_0802DD78:
	movs r4, 0
	str r4, [sp]
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl HandleBattleWindow
	ldr r0, _0802DDA0 @ =gText_BattleYesNoChoice
	movs r1, 0xE
	bl BattlePutTextOnWindow
	ldr r1, _0802DDA4 @ =gBattleCommunication
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	strb r4, [r1, 0x1]
	bl BattleCreateYesNoCursorAt
	b _0802DFA6
	.align 2, 0
_0802DDA0: .4byte gText_BattleYesNoChoice
_0802DDA4: .4byte gBattleCommunication
_0802DDA8:
	ldr r0, _0802DE1C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0802DDCC
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _0802DDCC
	movs r0, 0x5
	bl PlaySE
	bl BattleDestroyYesNoCursorAt
	movs r0, 0
	strb r0, [r4, 0x1]
	bl BattleCreateYesNoCursorAt
_0802DDCC:
	ldr r0, _0802DE1C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802DDF2
	ldr r4, _0802DE20 @ =gBattleCommunication
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _0802DDF2
	movs r0, 0x5
	bl PlaySE
	bl BattleDestroyYesNoCursorAt
	movs r0, 0x1
	strb r0, [r4, 0x1]
	bl BattleCreateYesNoCursorAt
_0802DDF2:
	ldr r0, _0802DE1C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0802DE24
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0802DE20 @ =gBattleCommunication
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _0802DE36
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0x3
	bl BeginFastPaletteFade
	b _0802DFA6
	.align 2, 0
_0802DE1C: .4byte gMain
_0802DE20: .4byte gBattleCommunication
_0802DE24:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0802DE2E
	b _0802DFA6
_0802DE2E:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0802DE3C @ =gBattleCommunication
_0802DE36:
	movs r0, 0x4
	strb r0, [r1]
	b _0802DFA6
	.align 2, 0
_0802DE3C: .4byte gBattleCommunication
_0802DE40:
	ldr r0, _0802DEFC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802DE4E
	b _0802DFA6
_0802DE4E:
	ldr r7, _0802DF00 @ =gBattlerPartyIndexes
	ldr r0, _0802DF04 @ =gBattlerAttacker
	mov r10, r0
	ldrb r0, [r0]
	movs r4, 0x1
	eors r0, r4
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	movs r1, 0x64
	mov r9, r1
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	ldr r1, _0802DF08 @ =gEnemyParty
	mov r8, r1
	add r0, r8
	ldr r1, _0802DF0C @ =gBattleStruct
	ldr r2, [r1]
	adds r2, 0x6D
	movs r1, 0x2
	bl GetMonData
	bl FreeAllWindowBuffers
	mov r2, r10
	ldrb r0, [r2]
	eors r0, r4
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	mov r1, r9
	muls r1, r0
	adds r0, r1, 0
	add r0, r8
	movs r1, 0xB
	bl GetMonData
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	mov r2, r10
	ldrb r0, [r2]
	eors r0, r4
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	mov r1, r9
	muls r1, r0
	adds r0, r1, 0
	add r0, r8
	bl GetMonGender
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	mov r2, r10
	ldrb r0, [r2]
	eors r4, r0
	lsls r4, 1
	adds r4, r7
	ldrh r0, [r4]
	mov r1, r9
	muls r1, r0
	adds r0, r1, 0
	add r0, r8
	movs r1, 0
	movs r2, 0
	bl GetMonData
	ldr r2, _0802DF0C @ =gBattleStruct
	ldr r1, [r2]
	adds r1, 0x6D
	str r0, [sp]
	ldr r0, _0802DF10 @ =BattleMainCB2
	str r0, [sp, 0x4]
	movs r0, 0x2
	adds r2, r6, 0
	adds r3, r5, 0
	bl DoNamingScreen
	ldr r1, _0802DF14 @ =gBattleCommunication
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0802DFA6
	.align 2, 0
_0802DEFC: .4byte gPaletteFade
_0802DF00: .4byte gBattlerPartyIndexes
_0802DF04: .4byte gBattlerAttacker
_0802DF08: .4byte gEnemyParty
_0802DF0C: .4byte gBattleStruct
_0802DF10: .4byte BattleMainCB2
_0802DF14: .4byte gBattleCommunication
_0802DF18:
	ldr r0, _0802DF54 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _0802DF58 @ =BattleMainCB2
	cmp r1, r0
	bne _0802DFA6
	ldr r0, _0802DF5C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0802DFA6
	ldr r2, _0802DF60 @ =gBattlerPartyIndexes
	ldr r0, _0802DF64 @ =gBattlerAttacker
	ldrb r1, [r0]
	movs r0, 0x1
	eors r0, r1
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802DF68 @ =gEnemyParty
	adds r0, r1
	ldr r1, _0802DF6C @ =gBattleStruct
	ldr r2, [r1]
	adds r2, 0x6D
	movs r1, 0x2
	bl SetMonData
	b _0802DF8C
	.align 2, 0
_0802DF54: .4byte gMain
_0802DF58: .4byte BattleMainCB2
_0802DF5C: .4byte gPaletteFade
_0802DF60: .4byte gBattlerPartyIndexes
_0802DF64: .4byte gBattlerAttacker
_0802DF68: .4byte gEnemyParty
_0802DF6C: .4byte gBattleStruct
_0802DF70:
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bne _0802DF8C
	ldr r1, _0802DF88 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802DFA6
	.align 2, 0
_0802DF88: .4byte gBattlescriptCurrInstr
_0802DF8C:
	ldr r3, _0802DFB8 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802DFA6:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DFB8: .4byte gBattlescriptCurrInstr
	thumb_func_end atkF3_trygivecaughtmonnick

	thumb_func_start atkF4_subattackerhpbydmg
atkF4_subattackerhpbydmg: @ 802DFBC
	ldr r2, _0802DFDC @ =gBattleMons
	ldr r0, _0802DFE0 @ =gBattlerAttacker
	ldrb r1, [r0]
	movs r0, 0x58
	muls r1, r0
	adds r1, r2
	ldr r0, _0802DFE4 @ =gBattleMoveDamage
	ldr r2, [r0]
	ldrh r0, [r1, 0x28]
	subs r0, r2
	strh r0, [r1, 0x28]
	ldr r1, _0802DFE8 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_0802DFDC: .4byte gBattleMons
_0802DFE0: .4byte gBattlerAttacker
_0802DFE4: .4byte gBattleMoveDamage
_0802DFE8: .4byte gBattlescriptCurrInstr
	thumb_func_end atkF4_subattackerhpbydmg

	thumb_func_start atkF5_removeattackerstatus1
atkF5_removeattackerstatus1: @ 802DFEC
	ldr r1, _0802E008 @ =gBattleMons
	ldr r0, _0802E00C @ =gBattlerAttacker
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x4C
	adds r0, r1
	movs r1, 0
	str r1, [r0]
	ldr r1, _0802E010 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_0802E008: .4byte gBattleMons
_0802E00C: .4byte gBattlerAttacker
_0802E010: .4byte gBattlescriptCurrInstr
	thumb_func_end atkF5_removeattackerstatus1

	thumb_func_start atkF6_finishaction
atkF6_finishaction: @ 802E014
	ldr r1, _0802E01C @ =gCurrentActionFuncId
	movs r0, 0xC
	strb r0, [r1]
	bx lr
	.align 2, 0
_0802E01C: .4byte gCurrentActionFuncId
	thumb_func_end atkF6_finishaction

	thumb_func_start atkF7_finishturn
atkF7_finishturn: @ 802E020
	ldr r1, _0802E030 @ =gCurrentActionFuncId
	movs r0, 0xC
	strb r0, [r1]
	ldr r1, _0802E034 @ =gCurrentTurnActionNumber
	ldr r0, _0802E038 @ =gBattlersCount
	ldrb r0, [r0]
	strb r0, [r1]
	bx lr
	.align 2, 0
_0802E030: .4byte gCurrentActionFuncId
_0802E034: .4byte gCurrentTurnActionNumber
_0802E038: .4byte gBattlersCount
	thumb_func_end atkF7_finishturn

	.align 2, 0 @ Don't pad with nop.
