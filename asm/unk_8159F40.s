	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8159F40
sub_8159F40: @ 8159F40
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	movs r0, 0
	mov r10, r0
	mov r9, r0
	ldr r1, _08159F90 @ =gBattleTypeFlags
	movs r0, 0x80
	lsls r0, 9
	str r0, [r1]
	bl ZeroPlayerPartyMons
	bl ZeroEnemyPartyMons
	ldr r1, _08159F94 @ =gUnknown_84792D0
	ldr r0, _08159F98 @ =gUnknown_20370C0
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	mov r8, r0
	movs r7, 0
_08159F72:
	lsls r0, r7, 4
	mov r2, r8
	adds r1, r0, r2
	ldrb r1, [r1]
	adds r4, r0, 0
	cmp r1, 0
	bne _08159FA0
	movs r0, 0x64
	mov r1, r10
	muls r1, r0
	ldr r0, _08159F9C @ =gPlayerParty
	adds r6, r1, r0
	movs r0, 0x1
	add r10, r0
	b _08159FAE
	.align 2, 0
_08159F90: .4byte gBattleTypeFlags
_08159F94: .4byte gUnknown_84792D0
_08159F98: .4byte gUnknown_20370C0
_08159F9C: .4byte gPlayerParty
_08159FA0:
	movs r0, 0x64
	mov r1, r9
	muls r1, r0
	ldr r0, _0815A004 @ =gEnemyParty
	adds r6, r1, r0
	movs r2, 0x1
	add r9, r2
_08159FAE:
	mov r0, r8
	adds r3, r4, r0
	ldrh r1, [r3, 0x2]
	ldrb r2, [r3, 0x1]
	ldrb r0, [r3, 0xD]
	str r0, [sp]
	ldrb r0, [r3, 0xC]
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	adds r0, r6, 0
	movs r3, 0
	bl CreateMonWithGenderNatureLetter
	movs r5, 0
	adds r7, 0x1
	mov r0, r8
	adds r0, 0x4
	adds r4, r0
_08159FD4:
	ldrh r1, [r4]
	lsls r2, r5, 24
	lsrs r2, 24
	adds r0, r6, 0
	bl SetMonMoveSlot
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _08159FD4
	lsls r0, r7, 4
	add r0, r8
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08159F72
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815A004: .4byte gEnemyParty
	thumb_func_end sub_8159F40

	thumb_func_start sub_815A008
sub_815A008: @ 815A008
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r1, 0
	mov r8, r1
	movs r6, 0x1
	movs r2, 0x2
	negs r2, r2
	mov r12, r2
	adds r5, r0, 0
	adds r5, 0x8
	movs r7, 0
	movs r0, 0x41
	negs r0, r0
	mov r10, r0
	movs r1, 0x7F
	mov r9, r1
_0815A02E:
	ldr r2, _0815A1F4 @ =gMapObjects
	adds r3, r7, r2
	ldrb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	ands r0, r6
	ldrb r2, [r5]
	mov r1, r12
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	ldrb r0, [r3]
	lsls r0, 28
	lsrs r0, 31
	ands r0, r6
	lsls r0, 1
	movs r2, 0x3
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r5]
	ldrb r0, [r3]
	lsls r0, 27
	lsrs r0, 31
	ands r0, r6
	lsls r0, 2
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	ldrb r0, [r3]
	lsls r0, 26
	lsrs r0, 31
	ands r0, r6
	lsls r0, 3
	movs r2, 0x9
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r5]
	ldrb r0, [r3, 0x1]
	lsls r0, 31
	lsrs r0, 31
	ands r0, r6
	lsls r0, 4
	movs r1, 0x11
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	ldrb r0, [r3, 0x1]
	lsls r0, 30
	lsrs r0, 31
	ands r0, r6
	lsls r0, 5
	movs r2, 0x21
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r5]
	ldrb r0, [r3, 0x1]
	lsls r0, 29
	lsrs r0, 31
	ands r0, r6
	lsls r0, 6
	mov r1, r10
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	ldrb r0, [r3, 0x1]
	lsls r0, 28
	lsrs r0, 31
	lsls r0, 7
	mov r2, r9
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	ldrb r0, [r3, 0x1]
	lsls r0, 27
	lsrs r0, 31
	ands r0, r6
	ldrb r2, [r5, 0x1]
	mov r1, r12
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 26
	lsrs r0, 31
	ands r0, r6
	lsls r0, 1
	movs r2, 0x3
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r5, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 25
	lsrs r0, 31
	ands r0, r6
	lsls r0, 2
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x1]
	ldrb r0, [r3, 0x1]
	lsrs r0, 7
	ands r0, r6
	lsls r0, 3
	movs r2, 0x9
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r5, 0x1]
	ldrb r0, [r3, 0x2]
	lsls r0, 31
	lsrs r0, 31
	ands r0, r6
	lsls r0, 4
	movs r1, 0x11
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x1]
	ldrb r0, [r3, 0x2]
	lsrs r0, 7
	ands r0, r6
	lsls r0, 5
	movs r2, 0x21
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r5, 0x1]
	ldrb r0, [r3, 0x3]
	lsls r0, 31
	lsrs r0, 31
	ands r0, r6
	lsls r0, 6
	mov r1, r10
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x1]
	ldrb r0, [r3, 0x3]
	lsls r0, 30
	lsrs r0, 31
	lsls r0, 7
	mov r2, r9
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x1]
	ldrb r0, [r3, 0x3]
	lsls r0, 29
	lsrs r0, 31
	ands r0, r6
	ldrb r2, [r5, 0x2]
	mov r1, r12
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x2]
	ldrb r2, [r3, 0x18]
	lsls r2, 28
	lsrs r2, 27
	movs r0, 0x1F
	negs r0, r0
	ands r1, r0
	orrs r1, r2
	strb r1, [r5, 0x2]
	ldrb r1, [r3, 0xB]
	lsls r1, 28
	movs r4, 0xF
	lsrs r1, 28
	ldrb r2, [r5, 0x3]
	adds r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x3]
	ldrb r1, [r3, 0xB]
	lsrs r1, 4
	lsls r1, 4
	ands r0, r4
	orrs r0, r1
	strb r0, [r5, 0x3]
	ldrb r0, [r3, 0x5]
	strb r0, [r5, 0x4]
	ldrb r0, [r3, 0x6]
	strb r0, [r5, 0x5]
	ldrb r0, [r3, 0x7]
	strb r0, [r5, 0x6]
	ldrb r0, [r3, 0x8]
	strb r0, [r5, 0x7]
	ldrb r0, [r3, 0x9]
	strb r0, [r5, 0x8]
	ldrb r0, [r3, 0xA]
	strb r0, [r5, 0x9]
	ldrh r0, [r3, 0x10]
	strh r0, [r5, 0xA]
	ldrh r0, [r3, 0x12]
	strh r0, [r5, 0xC]
	ldrb r0, [r3, 0x1D]
	strb r0, [r5, 0xE]
	ldrb r0, [r3, 0x1F]
	strb r0, [r5, 0xF]
	adds r0, r3, 0
	adds r0, 0x21
	ldrb r0, [r0]
	strb r0, [r5, 0x10]
	adds r3, 0x22
	ldrb r0, [r3]
	strb r0, [r5, 0x11]
	adds r5, 0x14
	adds r7, 0x24
	movs r0, 0x1
	add r8, r0
	mov r1, r8
	cmp r1, 0xF
	bhi _0815A1E4
	b _0815A02E
_0815A1E4:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815A1F4: .4byte gMapObjects
	thumb_func_end sub_815A008

	thumb_func_start sub_815A1F8
sub_815A1F8: @ 815A1F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	str r1, [sp, 0x4]
	adds r0, 0x8
	str r0, [sp, 0x8]
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r4, _0815A480 @ =gMapObjects
	ldr r2, _0815A484 @ =0x01000120
	mov r0, sp
	adds r1, r4, 0
	bl CpuSet
	movs r0, 0
	mov r12, r0
	movs r1, 0x1
	mov r10, r1
_0815A224:
	mov r2, r12
	lsls r7, r2, 3
	adds r5, r7, r2
	lsls r5, 2
	ldr r0, _0815A480 @ =gMapObjects
	adds r5, r0
	lsls r6, r2, 2
	add r6, r12
	lsls r6, 2
	ldr r1, [sp, 0x8]
	adds r6, r1
	ldrb r0, [r6]
	lsls r0, 31
	lsrs r0, 31
	mov r2, r10
	ands r0, r2
	ldrb r2, [r5]
	movs r1, 0x2
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	ldrb r0, [r6]
	lsls r0, 30
	lsrs r0, 31
	mov r2, r10
	ands r0, r2
	lsls r0, 3
	movs r2, 0x9
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r5]
	ldrb r0, [r6]
	lsls r0, 29
	lsrs r0, 31
	mov r1, r10
	ands r0, r1
	lsls r0, 4
	movs r1, 0x11
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	ldrb r0, [r6]
	lsls r0, 28
	lsrs r0, 31
	mov r2, r10
	ands r0, r2
	lsls r0, 5
	movs r4, 0x21
	negs r4, r4
	ands r1, r4
	orrs r1, r0
	strb r1, [r5]
	ldrb r0, [r6]
	lsls r0, 27
	lsrs r0, 31
	ands r0, r2
	ldrb r1, [r5, 0x1]
	movs r2, 0x2
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r5, 0x1]
	ldrb r0, [r6]
	lsls r0, 26
	lsrs r0, 31
	mov r1, r10
	ands r0, r1
	lsls r0, 1
	movs r1, 0x3
	negs r1, r1
	mov r8, r1
	mov r3, r8
	ands r3, r2
	orrs r3, r0
	strb r3, [r5, 0x1]
	ldrb r0, [r6]
	lsls r0, 25
	lsrs r0, 31
	mov r2, r10
	ands r0, r2
	lsls r0, 2
	subs r1, 0x2
	mov r9, r1
	ands r1, r3
	orrs r1, r0
	strb r1, [r5, 0x1]
	ldrb r0, [r6]
	lsrs r0, 7
	ands r0, r2
	lsls r0, 3
	movs r2, 0x9
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r5, 0x1]
	ldrb r0, [r6, 0x1]
	lsls r0, 31
	lsrs r0, 31
	mov r1, r10
	ands r0, r1
	lsls r0, 4
	movs r1, 0x11
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x1]
	ldrb r0, [r6, 0x1]
	lsls r0, 30
	lsrs r0, 31
	mov r2, r10
	ands r0, r2
	lsls r0, 5
	ands r4, r1
	orrs r4, r0
	strb r4, [r5, 0x1]
	ldrb r0, [r6, 0x1]
	lsls r0, 29
	lsrs r0, 31
	ands r0, r2
	lsls r0, 6
	movs r2, 0x41
	negs r2, r2
	adds r1, r2, 0
	ands r4, r1
	orrs r4, r0
	strb r4, [r5, 0x1]
	ldrb r0, [r6, 0x1]
	lsls r0, 28
	lsrs r0, 31
	lsls r0, 7
	movs r3, 0x7F
	ands r4, r3
	orrs r4, r0
	strb r4, [r5, 0x1]
	ldrb r0, [r6, 0x1]
	lsls r0, 27
	lsrs r0, 31
	mov r1, r10
	ands r0, r1
	ldrb r2, [r5, 0x2]
	movs r1, 0x2
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x2]
	ldrb r0, [r6, 0x1]
	lsls r0, 26
	lsrs r0, 31
	lsls r0, 7
	ands r1, r3
	orrs r1, r0
	strb r1, [r5, 0x2]
	ldrb r0, [r6, 0x1]
	lsls r0, 25
	lsrs r0, 31
	mov r2, r10
	ands r0, r2
	ldrb r2, [r5, 0x3]
	movs r1, 0x2
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x3]
	ldrb r0, [r6, 0x1]
	lsrs r0, 7
	mov r2, r10
	ands r0, r2
	lsls r0, 1
	mov r2, r8
	ands r2, r1
	orrs r2, r0
	mov r8, r2
	strb r2, [r5, 0x3]
	ldrb r0, [r6, 0x2]
	lsls r0, 31
	lsrs r0, 31
	mov r1, r10
	ands r0, r1
	lsls r0, 2
	mov r1, r9
	ands r2, r1
	orrs r2, r0
	strb r2, [r5, 0x3]
	ldrb r1, [r6, 0x2]
	lsls r1, 27
	lsrs r1, 28
	ldrb r2, [r5, 0x18]
	movs r4, 0x10
	negs r4, r4
	adds r0, r4, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x18]
	ldrb r1, [r6, 0x3]
	lsls r1, 28
	movs r3, 0xF
	lsrs r1, 28
	ldrb r2, [r5, 0xB]
	adds r0, r4, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0xB]
	ldrb r1, [r6, 0x3]
	lsrs r1, 4
	lsls r1, 4
	ands r0, r3
	orrs r0, r1
	strb r0, [r5, 0xB]
	ldrb r0, [r6, 0x4]
	strb r0, [r5, 0x5]
	ldrb r0, [r6, 0x5]
	strb r0, [r5, 0x6]
	ldrb r0, [r6, 0x6]
	strb r0, [r5, 0x7]
	ldrb r0, [r6, 0x7]
	strb r0, [r5, 0x8]
	ldrb r0, [r6, 0x8]
	strb r0, [r5, 0x9]
	ldrb r0, [r6, 0x9]
	strb r0, [r5, 0xA]
	ldrh r0, [r6, 0xA]
	strh r0, [r5, 0x10]
	ldrh r0, [r6, 0xC]
	strh r0, [r5, 0x12]
	ldrb r0, [r6, 0xE]
	strb r0, [r5, 0x1D]
	ldrb r0, [r6, 0xF]
	strb r0, [r5, 0x1F]
	ldrb r0, [r6, 0x10]
	adds r1, r5, 0
	adds r1, 0x21
	strb r0, [r1]
	ldrb r0, [r6, 0x11]
	adds r1, 0x1
	strb r0, [r1]
	movs r6, 0
	mov r8, r7
	mov r2, r12
	adds r2, 0x1
	str r2, [sp, 0xC]
	ldrb r7, [r5, 0x8]
	ldr r3, [sp, 0x4]
	movs r0, 0xF
	mov r9, r0
_0815A412:
	ldrb r1, [r3]
	cmp r7, r1
	bne _0815A444
	ldrh r0, [r3, 0x4]
	adds r0, 0x7
	strh r0, [r5, 0xC]
	ldrh r0, [r3, 0x6]
	adds r0, 0x7
	strh r0, [r5, 0xE]
	ldrb r1, [r3, 0xA]
	lsls r1, 28
	lsrs r1, 28
	mov r2, r9
	ands r1, r2
	ldrb r0, [r5, 0x19]
	ands r0, r4
	orrs r0, r1
	strb r0, [r5, 0x19]
	ldrb r1, [r3, 0xA]
	lsrs r1, 4
	lsls r1, 4
	movs r2, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x19]
_0815A444:
	adds r3, 0x18
	adds r6, 0x1
	cmp r6, 0x3F
	bls _0815A412
	mov r0, r8
	add r0, r12
	lsls r0, 2
	ldr r1, _0815A480 @ =gMapObjects
	adds r6, r0, r1
	movs r2, 0x10
	ldrsh r0, [r6, r2]
	movs r2, 0x12
	ldrsh r1, [r6, r2]
	bl sub_8058F78
	strb r0, [r6, 0x1E]
	ldrb r4, [r6, 0x1F]
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	movs r2, 0x12
	ldrsh r1, [r6, r2]
	bl sub_8058F78
	cmp r4, r0
	bne _0815A488
	ldrh r0, [r6, 0x10]
	strh r0, [r6, 0x14]
	ldrh r0, [r6, 0x12]
	b _0815A506
	.align 2, 0
_0815A480: .4byte gMapObjects
_0815A484: .4byte 0x01000120
_0815A488:
	ldrb r4, [r6, 0x1F]
	ldrh r0, [r6, 0x10]
	subs r0, 0x1
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x12
	ldrsh r1, [r6, r2]
	bl sub_8058F78
	cmp r4, r0
	bne _0815A4A8
	ldrh r0, [r6, 0x10]
	subs r0, 0x1
	strh r0, [r6, 0x14]
	ldrh r0, [r6, 0x12]
	b _0815A506
_0815A4A8:
	ldrb r4, [r6, 0x1F]
	ldrh r0, [r6, 0x10]
	adds r0, 0x1
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x12
	ldrsh r1, [r6, r2]
	bl sub_8058F78
	cmp r4, r0
	bne _0815A4C8
	ldrh r0, [r6, 0x10]
	adds r0, 0x1
	strh r0, [r6, 0x14]
	ldrh r0, [r6, 0x12]
	b _0815A506
_0815A4C8:
	ldrb r4, [r6, 0x1F]
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	ldrh r1, [r6, 0x12]
	subs r1, 0x1
	lsls r1, 16
	asrs r1, 16
	bl sub_8058F78
	cmp r4, r0
	bne _0815A4E8
	ldrh r0, [r6, 0x10]
	strh r0, [r6, 0x14]
	ldrh r0, [r6, 0x12]
	subs r0, 0x1
	b _0815A506
_0815A4E8:
	ldrb r4, [r6, 0x1F]
	movs r2, 0x10
	ldrsh r0, [r6, r2]
	ldrh r1, [r6, 0x12]
	adds r1, 0x1
	lsls r1, 16
	asrs r1, 16
	bl sub_8058F78
	cmp r4, r0
	bne _0815A508
	ldrh r0, [r6, 0x10]
	strh r0, [r6, 0x14]
	ldrh r0, [r6, 0x12]
	adds r0, 0x1
_0815A506:
	strh r0, [r6, 0x16]
_0815A508:
	ldr r0, [sp, 0xC]
	mov r12, r0
	cmp r0, 0xF
	bhi _0815A512
	b _0815A224
_0815A512:
	ldr r0, _0815A538 @ =gMapObjects
	ldr r1, _0815A53C @ =gSaveBlock1Ptr
	ldr r1, [r1]
	movs r2, 0xD4
	lsls r2, 3
	adds r1, r2
	movs r2, 0x90
	lsls r2, 1
	bl CpuSet
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815A538: .4byte gMapObjects
_0815A53C: .4byte gSaveBlock1Ptr
	thumb_func_end sub_815A1F8

	thumb_func_start sub_815A540
sub_815A540: @ 815A540
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0815A5AC @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0815A5A4
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
	bl sub_8058F78
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSurfable
	lsls r0, 24
	cmp r0, 0
	bne _0815A5A4
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _0815A5A4
	ldr r0, _0815A5B0 @ =gUnknown_2037078
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0815A5B4 @ =gMapObjects
	adds r4, r0
	movs r0, 0x1
	bl SetPlayerAvatarTransitionFlags
	ldrb r1, [r4, 0x1A]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0815A5B8 @ =gSprites
	adds r0, r1
	bl DestroySprite
_0815A5A4:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815A5AC: .4byte gUnknown_203ADFA
_0815A5B0: .4byte gUnknown_2037078
_0815A5B4: .4byte gMapObjects
_0815A5B8: .4byte gSprites
	thumb_func_end sub_815A540

	thumb_func_start sub_815A5BC
sub_815A5BC: @ 815A5BC
	push {lr}
	sub sp, 0x8
	ldr r3, _0815A5E4 @ =0xffffff00
	ldr r1, [sp]
	ands r1, r3
	movs r2, 0x1
	orrs r1, r2
	str r1, [sp]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp, 0x4]
	ands r1, r3
	orrs r1, r0
	str r1, [sp, 0x4]
	mov r0, sp
	bl sub_80F9E2C
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0815A5E4: .4byte 0xffffff00
	thumb_func_end sub_815A5BC

	thumb_func_start sub_815A5E8
sub_815A5E8: @ 815A5E8
	push {lr}
	adds r2, r0, 0
	ldr r3, _0815A610 @ =gUnknown_3003ED0
	ldrh r0, [r3]
	movs r1, 0xFF
	lsls r1, 8
	ands r1, r0
	movs r0, 0xBC
	lsls r0, 6
	cmp r1, r0
	bne _0815A60A
	lsls r0, r2, 4
	adds r1, r3, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0x1
	beq _0815A614
_0815A60A:
	movs r0, 0
	b _0815A616
	.align 2, 0
_0815A610: .4byte gUnknown_3003ED0
_0815A614:
	ldrb r0, [r1, 0x4]
_0815A616:
	pop {r1}
	bx r1
	thumb_func_end sub_815A5E8

	thumb_func_start sub_815A61C
sub_815A61C: @ 815A61C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	ldr r4, [sp, 0x48]
	lsls r4, 24
	str r4, [sp, 0x1C]
	movs r4, 0x14
	adds r4, r0
	mov r9, r4
	mov r5, sp
	movs r4, 0x2
	strb r4, [r5]
	mov r10, sp
	mov r5, r9
	ldrb r4, [r5, 0xB]
	movs r7, 0xF
	adds r5, r7, 0
	ands r5, r4
	mov r6, r10
	ldrb r6, [r6, 0x1]
	mov r8, r6
	movs r4, 0x10
	negs r4, r4
	mov r6, r8
	ands r4, r6
	orrs r4, r5
	mov r5, r10
	strb r4, [r5, 0x1]
	mov r8, sp
	mov r6, r9
	ldrb r5, [r6, 0xC]
	lsls r5, 4
	ands r4, r7
	orrs r4, r5
	mov r5, r8
	strb r4, [r5, 0x1]
	ldrb r5, [r6, 0xD]
	movs r6, 0xF
	ands r5, r6
	mov r4, r10
	ldrb r4, [r4, 0x2]
	mov r8, r4
	movs r4, 0x10
	negs r4, r4
	mov r6, r8
	ands r4, r6
	orrs r4, r5
	mov r5, r10
	strb r4, [r5, 0x2]
	mov r8, sp
	mov r6, r9
	ldrb r5, [r6, 0xE]
	lsls r5, 4
	ands r4, r7
	orrs r4, r5
	mov r5, r8
	strb r4, [r5, 0x2]
	ldrb r5, [r6, 0xF]
	movs r6, 0xF
	ands r5, r6
	mov r4, r10
	ldrb r4, [r4, 0x3]
	mov r8, r4
	movs r4, 0x10
	negs r4, r4
	mov r6, r8
	ands r4, r6
	orrs r4, r5
	mov r5, r10
	strb r4, [r5, 0x3]
	mov r8, sp
	mov r6, r9
	ldrb r5, [r6, 0x10]
	lsls r5, 4
	ands r4, r7
	orrs r4, r5
	mov r5, r8
	strb r4, [r5, 0x3]
	ldrb r5, [r6, 0x11]
	movs r6, 0xF
	ands r5, r6
	mov r4, r10
	ldrb r4, [r4, 0x4]
	mov r8, r4
	movs r4, 0x10
	negs r4, r4
	mov r6, r8
	ands r4, r6
	orrs r4, r5
	mov r5, r10
	strb r4, [r5, 0x4]
	mov r8, sp
	mov r6, r9
	ldrb r5, [r6, 0x12]
	lsls r5, 4
	ands r4, r7
	orrs r4, r5
	mov r5, r8
	strb r4, [r5, 0x4]
	ldrb r4, [r6, 0x13]
	movs r6, 0xF
	ands r4, r6
	mov r6, r8
	ldrb r5, [r6, 0x5]
	movs r6, 0x10
	negs r6, r6
	ands r6, r5
	orrs r6, r4
	str r6, [sp, 0xC]
	mov r4, r8
	strb r6, [r4, 0x5]
	mov r5, sp
	mov r6, r9
	ldrb r4, [r6, 0x14]
	lsls r4, 4
	ldr r6, [sp, 0xC]
	ands r6, r7
	orrs r6, r4
	strb r6, [r5, 0x5]
	mov r7, sp
	movs r4, 0x3
	mov r8, r4
	ldrb r0, [r0, 0x14]
	mov r5, r8
	ands r0, r5
	ldrb r5, [r7, 0x6]
	movs r6, 0x4
	negs r6, r6
	mov r10, r6
	mov r4, r10
	ands r4, r5
	orrs r4, r0
	strb r4, [r7, 0x6]
	mov r5, r9
	ldrb r0, [r5, 0x1]
	mov r6, r8
	ands r0, r6
	lsls r0, 2
	movs r5, 0xD
	negs r5, r5
	ands r5, r4
	orrs r5, r0
	strb r5, [r7, 0x6]
	mov r0, r9
	ldrb r4, [r0, 0x2]
	ands r4, r6
	lsls r4, 4
	movs r0, 0x31
	negs r0, r0
	ands r0, r5
	orrs r0, r4
	strb r0, [r7, 0x6]
	mov r5, sp
	mov r6, r9
	ldrb r4, [r6, 0x3]
	lsls r4, 6
	movs r6, 0x3F
	ands r0, r6
	orrs r0, r4
	strb r0, [r5, 0x6]
	mov r4, r9
	ldrb r0, [r4, 0x4]
	mov r5, r8
	ands r0, r5
	ldrb r5, [r7, 0x7]
	mov r4, r10
	ands r4, r5
	orrs r4, r0
	strb r4, [r7, 0x7]
	mov r6, r9
	ldrb r0, [r6, 0x5]
	mov r5, r8
	ands r0, r5
	lsls r0, 2
	movs r5, 0xD
	negs r5, r5
	ands r5, r4
	orrs r5, r0
	strb r5, [r7, 0x7]
	ldrb r4, [r6, 0x6]
	mov r6, r8
	ands r4, r6
	lsls r4, 4
	movs r0, 0x31
	negs r0, r0
	ands r0, r5
	orrs r0, r4
	strb r0, [r7, 0x7]
	mov r5, sp
	mov r6, r9
	ldrb r4, [r6, 0x7]
	lsls r4, 6
	movs r6, 0x3F
	ands r0, r6
	orrs r0, r4
	strb r0, [r5, 0x7]
	mov r8, sp
	mov r0, r9
	ldrb r4, [r0, 0x8]
	movs r7, 0x3
	adds r0, r7, 0
	ands r0, r4
	mov r4, r8
	ldrb r5, [r4, 0x8]
	mov r4, r10
	ands r4, r5
	orrs r4, r0
	mov r5, r8
	strb r4, [r5, 0x8]
	mov r6, r9
	ldrb r5, [r6, 0x9]
	adds r0, r7, 0
	ands r0, r5
	lsls r0, 2
	movs r5, 0xD
	negs r5, r5
	ands r5, r4
	orrs r5, r0
	mov r0, r8
	strb r5, [r0, 0x8]
	ldrb r0, [r1]
	adds r4, r7, 0
	ands r4, r0
	lsls r4, 4
	movs r0, 0x31
	negs r0, r0
	ands r0, r5
	orrs r0, r4
	mov r4, r8
	strb r0, [r4, 0x8]
	mov r5, sp
	ldrb r4, [r2]
	lsls r4, 6
	movs r6, 0x3F
	ands r0, r6
	orrs r0, r4
	strb r0, [r5, 0x8]
	ldrb r4, [r3]
	adds r0, r7, 0
	ands r0, r4
	ldrb r4, [r5, 0x9]
	mov r6, r10
	ands r6, r4
	orrs r6, r0
	mov r10, r6
	strb r6, [r5, 0x9]
	ldr r0, [sp, 0x40]
	ldrb r4, [r0]
	adds r0, r7, 0
	ands r0, r4
	lsls r0, 2
	movs r4, 0xD
	negs r4, r4
	ands r6, r4
	orrs r6, r0
	str r6, [sp, 0x10]
	strb r6, [r5, 0x9]
	mov r4, sp
	ldr r5, [sp, 0x44]
	ldrb r0, [r5]
	adds r6, r7, 0
	ands r6, r0
	lsls r0, r6, 4
	subs r7, 0x34
	ldr r5, [sp, 0x10]
	ands r7, r5
	orrs r7, r0
	strb r7, [r4, 0x9]
	mov r5, sp
	ldrb r0, [r1, 0x4]
	movs r6, 0x1
	mov r12, r6
	mov r4, r12
	ands r4, r0
	lsls r4, 6
	movs r0, 0x41
	negs r0, r0
	mov r10, r0
	ands r0, r7
	orrs r0, r4
	strb r0, [r5, 0x9]
	ldrb r4, [r2, 0x4]
	lsls r4, 7
	movs r5, 0x7F
	ands r0, r5
	orrs r0, r4
	mov r4, r8
	strb r0, [r4, 0x9]
	ldrb r4, [r3, 0x4]
	mov r0, r12
	ands r0, r4
	mov r5, r8
	ldrb r4, [r5, 0xA]
	movs r7, 0x2
	negs r7, r7
	adds r5, r7, 0
	ands r5, r4
	orrs r5, r0
	mov r6, r8
	strb r5, [r6, 0xA]
	mov r9, sp
	ldr r4, [sp, 0x40]
	ldrb r0, [r4, 0x4]
	mov r4, r12
	ands r4, r0
	lsls r4, 1
	movs r6, 0x3
	negs r6, r6
	mov r8, r6
	mov r0, r8
	ands r0, r5
	orrs r0, r4
	mov r4, r9
	strb r0, [r4, 0xA]
	ldr r6, [sp, 0x44]
	ldrb r5, [r6, 0x4]
	mov r4, r12
	ands r4, r5
	lsls r4, 2
	movs r5, 0x5
	negs r5, r5
	ands r0, r5
	orrs r0, r4
	mov r4, r9
	strb r0, [r4, 0xA]
	mov r4, sp
	ldrb r1, [r1, 0x8]
	mov r0, r12
	ands r0, r1
	lsls r0, 2
	ldrb r1, [r4, 0xB]
	ands r5, r1
	orrs r5, r0
	strb r5, [r4, 0xB]
	ldrb r1, [r2, 0x8]
	mov r0, r12
	ands r0, r1
	lsls r0, 3
	movs r1, 0x9
	negs r1, r1
	ands r1, r5
	orrs r1, r0
	strb r1, [r4, 0xB]
	ldrb r2, [r3, 0x8]
	mov r0, r12
	ands r0, r2
	lsls r0, 4
	movs r2, 0x11
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r4, 0xB]
	mov r3, sp
	ldr r5, [sp, 0x40]
	ldrb r0, [r5, 0x8]
	mov r1, r12
	ands r1, r0
	lsls r1, 5
	movs r0, 0x21
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0xB]
	mov r2, sp
	ldrb r1, [r6, 0x8]
	mov r6, r12
	ands r6, r1
	lsls r1, r6, 6
	mov r3, r10
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0xB]
	ldr r4, [sp, 0x1C]
	lsrs r3, r4, 21
	ldrb r1, [r2, 0xA]
	movs r0, 0x7
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, 0xA]
	mov r1, sp
	ldr r5, [sp, 0x4C]
	movs r6, 0x1
	ands r5, r6
	lsls r2, r5, 1
	ldrb r0, [r1, 0xB]
	mov r3, r8
	ands r3, r0
	orrs r3, r2
	mov r8, r3
	strb r3, [r1, 0xB]
	mov r0, sp
	ldr r4, [sp, 0x50]
	ands r4, r6
	mov r5, r8
	ands r5, r7
	orrs r5, r4
	strb r5, [r0, 0xB]
	bl sub_80F9E2C
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_815A61C

	thumb_func_start sub_815A950
sub_815A950: @ 815A950
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	ldr r0, [sp, 0x1C]
	mov r12, r0
	ldr r1, [sp, 0x20]
	mov r8, r1
	ldr r0, [sp, 0x24]
	mov r9, r0
	adds r2, r7, 0
	adds r2, 0x14
	ldr r4, _0815A98C @ =gUnknown_3003ED0
	ldrh r0, [r4]
	movs r1, 0xFF
	lsls r1, 8
	ands r1, r0
	movs r0, 0xBC
	lsls r0, 6
	cmp r1, r0
	bne _0815A988
	adds r3, r4, 0x2
	ldrb r0, [r4, 0x2]
	cmp r0, 0x2
	beq _0815A990
_0815A988:
	movs r0, 0
	b _0815AACA
	.align 2, 0
_0815A98C: .4byte gUnknown_3003ED0
_0815A990:
	ldrb r0, [r3, 0x1]
	lsls r0, 28
	lsrs r0, 28
	strb r0, [r2, 0xB]
	ldrb r0, [r3, 0x1]
	lsrs r0, 4
	strb r0, [r2, 0xC]
	ldrb r0, [r3, 0x2]
	lsls r0, 28
	lsrs r0, 28
	strb r0, [r2, 0xD]
	ldrb r0, [r3, 0x2]
	lsrs r0, 4
	strb r0, [r2, 0xE]
	ldrb r0, [r3, 0x3]
	lsls r0, 28
	lsrs r0, 28
	strb r0, [r2, 0xF]
	ldrb r0, [r3, 0x3]
	lsrs r0, 4
	strb r0, [r2, 0x10]
	ldrb r0, [r3, 0x4]
	lsls r0, 28
	lsrs r0, 28
	strb r0, [r2, 0x11]
	ldrb r0, [r3, 0x4]
	lsrs r0, 4
	strb r0, [r2, 0x12]
	ldrb r0, [r3, 0x5]
	lsls r0, 28
	lsrs r0, 28
	strb r0, [r2, 0x13]
	ldrb r0, [r3, 0x5]
	lsrs r0, 4
	strb r0, [r2, 0x14]
	ldrb r0, [r3, 0x1]
	lsls r0, 28
	lsrs r0, 28
	strb r0, [r2, 0x15]
	ldrb r0, [r3, 0x6]
	lsls r0, 30
	lsrs r0, 30
	strb r0, [r7, 0x14]
	ldrb r0, [r3, 0x6]
	lsls r0, 28
	lsrs r0, 30
	strb r0, [r2, 0x1]
	ldrb r0, [r3, 0x6]
	lsls r0, 26
	lsrs r0, 30
	strb r0, [r2, 0x2]
	ldrb r0, [r3, 0x6]
	lsrs r0, 6
	strb r0, [r2, 0x3]
	ldrb r0, [r3, 0x7]
	lsls r0, 30
	lsrs r0, 30
	strb r0, [r2, 0x4]
	ldrb r0, [r3, 0x7]
	lsls r0, 28
	lsrs r0, 30
	strb r0, [r2, 0x5]
	ldrb r0, [r3, 0x7]
	lsls r0, 26
	lsrs r0, 30
	strb r0, [r2, 0x6]
	ldrb r0, [r3, 0x7]
	lsrs r0, 6
	strb r0, [r2, 0x7]
	ldrb r0, [r3, 0x8]
	lsls r0, 30
	lsrs r0, 30
	strb r0, [r2, 0x8]
	ldrb r0, [r3, 0x8]
	lsls r0, 28
	lsrs r0, 30
	strb r0, [r2, 0x9]
	ldrb r0, [r3, 0x6]
	lsls r0, 30
	lsrs r0, 30
	strb r0, [r2, 0xA]
	ldrb r0, [r3, 0x8]
	lsls r0, 26
	lsrs r0, 30
	strb r0, [r5]
	ldrb r0, [r3, 0x9]
	lsls r0, 25
	lsrs r0, 31
	strb r0, [r5, 0x4]
	ldrb r0, [r3, 0xB]
	lsls r0, 29
	lsrs r0, 31
	strb r0, [r5, 0x8]
	ldrb r0, [r3, 0x8]
	lsrs r0, 6
	strb r0, [r6]
	ldrb r0, [r3, 0x9]
	lsrs r0, 7
	strb r0, [r6, 0x4]
	ldrb r0, [r3, 0xB]
	lsls r0, 28
	lsrs r0, 31
	strb r0, [r6, 0x8]
	ldrb r0, [r3, 0x9]
	lsls r0, 30
	lsrs r0, 30
	mov r1, r12
	strb r0, [r1]
	ldrb r0, [r3, 0xA]
	lsls r0, 31
	lsrs r0, 31
	strb r0, [r1, 0x4]
	ldrb r0, [r3, 0xB]
	lsls r0, 27
	lsrs r0, 31
	strb r0, [r1, 0x8]
	ldrb r0, [r3, 0x9]
	lsls r0, 28
	lsrs r0, 30
	mov r1, r8
	strb r0, [r1]
	ldrb r0, [r3, 0xA]
	lsls r0, 30
	lsrs r0, 31
	strb r0, [r1, 0x4]
	ldrb r0, [r3, 0xB]
	lsls r0, 26
	lsrs r0, 31
	strb r0, [r1, 0x8]
	ldrb r0, [r3, 0x9]
	lsls r0, 26
	lsrs r0, 30
	mov r1, r9
	strb r0, [r1]
	ldrb r0, [r3, 0xA]
	lsls r0, 29
	lsrs r0, 31
	strb r0, [r1, 0x4]
	ldrb r0, [r3, 0xB]
	lsls r0, 25
	lsrs r0, 31
	strb r0, [r1, 0x8]
	ldrb r0, [r3, 0xA]
	lsrs r0, 3
	ldr r1, [sp, 0x28]
	strb r0, [r1]
	ldrb r0, [r3, 0xB]
	lsls r0, 30
	lsrs r0, 31
	ldr r1, [sp, 0x2C]
	str r0, [r1]
	ldrb r0, [r3, 0xB]
	lsls r0, 31
	lsrs r0, 31
	ldr r1, [sp, 0x30]
	str r0, [r1]
	movs r0, 0x1
_0815AACA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_815A950

	thumb_func_start sub_815AAD8
sub_815AAD8: @ 815AAD8
	push {lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0815AB00 @ =0xffffff00
	ldr r1, [sp]
	ands r1, r3
	movs r2, 0x3
	orrs r1, r2
	str r1, [sp]
	ldr r1, [sp, 0x4]
	ands r1, r3
	orrs r1, r0
	str r1, [sp, 0x4]
	mov r0, sp
	bl sub_80F9E2C
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0815AB00: .4byte 0xffffff00
	thumb_func_end sub_815AAD8

	thumb_func_start sub_815AB04
sub_815AB04: @ 815AB04
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	ldr r3, _0815AB2C @ =gUnknown_3003ED0
	ldrh r0, [r3]
	movs r1, 0xFF
	lsls r1, 8
	ands r1, r0
	movs r0, 0xBC
	lsls r0, 6
	cmp r1, r0
	bne _0815AB28
	lsls r0, r2, 4
	adds r1, r3, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0x3
	beq _0815AB30
_0815AB28:
	movs r0, 0
	b _0815AB36
	.align 2, 0
_0815AB2C: .4byte gUnknown_3003ED0
_0815AB30:
	ldrb r0, [r1, 0x4]
	strb r0, [r4]
	movs r0, 0x1
_0815AB36:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_815AB04

	thumb_func_start sub_815AB3C
sub_815AB3C: @ 815AB3C
	push {lr}
	sub sp, 0x8
	ldr r2, _0815AB5C @ =0xffffff00
	ldr r1, [sp]
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	str r1, [sp]
	str r0, [sp, 0x4]
	mov r0, sp
	bl sub_80F9E2C
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0815AB5C: .4byte 0xffffff00
	thumb_func_end sub_815AB3C

	thumb_func_start sub_815AB60
sub_815AB60: @ 815AB60
	push {lr}
	adds r2, r0, 0
	ldr r3, _0815AB88 @ =gUnknown_3003ED0
	ldrh r0, [r3]
	movs r1, 0xFF
	lsls r1, 8
	ands r1, r0
	movs r0, 0xBC
	lsls r0, 6
	cmp r1, r0
	bne _0815AB82
	lsls r0, r2, 4
	adds r1, r3, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0x4
	beq _0815AB8C
_0815AB82:
	movs r0, 0
	b _0815AB8E
	.align 2, 0
_0815AB88: .4byte gUnknown_3003ED0
_0815AB8C:
	ldr r0, [r1, 0x4]
_0815AB8E:
	pop {r1}
	bx r1
	thumb_func_end sub_815AB60

	.align 2, 0 @ Don't pad with nop.
