	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_815E9C8
sub_815E9C8: @ 815E9C8
	ldr r3, _0815E9EC @ =gSpecialVar_Result
	ldr r0, _0815E9F0 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r2, _0815E9F4 @ =0x00003d34
	adds r0, r1, r2
	ldr r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0
	ldr r0, _0815E9F8 @ =0x00003d42
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 29
	lsrs r0, 31
	strh r0, [r3]
	bx lr
	.align 2, 0
_0815E9EC: .4byte gSpecialVar_Result
_0815E9F0: .4byte gSaveBlock1Ptr
_0815E9F4: .4byte 0x00003d34
_0815E9F8: .4byte 0x00003d42
	thumb_func_end sub_815E9C8

	thumb_func_start sub_815E9FC
sub_815E9FC: @ 815E9FC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _0815EABC @ =0x00004001
	bl VarGet
	lsls r0, 16
	lsrs r4, r0, 16
	bl sub_815EBB8
	mov r9, r0
	ldr r0, _0815EAC0 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r2, _0815EAC4 @ =0x00003d34
	adds r0, r1, r2
	ldr r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0
	movs r0, 0xF5
	lsls r0, 6
	adds r1, r0
	ldrb r5, [r1]
	bl ZeroEnemyPartyMons
	ldr r1, _0815EAC8 @ =gUnknown_203F458
	mov r10, r1
	ldr r6, [r1]
	ldrb r1, [r6]
	lsls r0, r1, 5
	subs r0, r1
	lsls r7, r0, 5
	adds r0, r6, r7
	ldrb r0, [r0, 0xE]
	cmp r0, 0x1
	beq _0815EAD4
	cmp r0, 0x1
	ble _0815EA56
	cmp r0, 0x2
	bne _0815EA56
	b _0815EB58
_0815EA56:
	movs r6, 0
	lsls r5, 1
	str r5, [sp]
	lsls r0, r4, 2
	mov r5, r10
	adds r0, r4
	lsls r0, 3
	adds r0, r4
	lsls r7, r0, 3
	adds r2, r7, 0x4
	mov r8, r2
_0815EA6C:
	ldr r1, _0815EACC @ =gUnknown_847A2EE
	ldr r2, [sp]
	adds r0, r6, r2
	adds r0, r1
	ldrb r2, [r0]
	ldr r3, [r5]
	movs r0, 0x2C
	adds r4, r2, 0
	muls r4, r0
	adds r2, r4, r7
	ldrb r1, [r3]
	lsls r0, r1, 5
	subs r0, r1
	lsls r0, 5
	adds r2, r0
	adds r3, r2
	adds r3, 0x5C
	mov r0, r9
	strb r0, [r3]
	movs r0, 0x64
	muls r0, r6
	ldr r1, _0815EAD0 @ =gEnemyParty
	adds r0, r1
	ldr r1, [r5]
	ldrb r3, [r1]
	lsls r2, r3, 5
	subs r2, r3
	lsls r2, 5
	adds r2, 0xC
	adds r1, r2
	add r1, r8
	adds r4, 0x40
	adds r1, r4
	bl sub_803E0A4
	adds r6, 0x1
	cmp r6, 0x1
	ble _0815EA6C
	b _0815EB9E
	.align 2, 0
_0815EABC: .4byte 0x00004001
_0815EAC0: .4byte gSaveBlock1Ptr
_0815EAC4: .4byte 0x00003d34
_0815EAC8: .4byte gUnknown_203F458
_0815EACC: .4byte gUnknown_847A2EE
_0815EAD0: .4byte gEnemyParty
_0815EAD4:
	ldr r4, _0815EB50 @ =gUnknown_847A2FE
	lsls r5, 1
	adds r0, r5, r4
	ldrb r2, [r0]
	movs r1, 0x2C
	mov r8, r1
	mov r3, r8
	muls r3, r2
	adds r0, r3, r7
	adds r0, r6, r0
	adds r0, 0x5C
	mov r2, r9
	strb r2, [r0]
	ldr r6, _0815EB54 @ =gEnemyParty
	mov r0, r10
	ldr r1, [r0]
	ldrb r2, [r1]
	lsls r0, r2, 5
	subs r0, r2
	lsls r0, 5
	adds r0, 0xC
	adds r1, r0
	adds r3, 0x44
	adds r1, r3
	adds r0, r6, 0
	bl sub_803E0A4
	adds r4, 0x1
	adds r5, r4
	ldrb r2, [r5]
	mov r0, r10
	ldr r1, [r0]
	mov r3, r8
	muls r3, r2
	ldrb r2, [r1]
	lsls r0, r2, 5
	subs r0, r2
	lsls r0, 5
	adds r0, r3, r0
	adds r1, r0
	movs r2, 0xD2
	lsls r2, 1
	adds r1, r2
	mov r0, r9
	strb r0, [r1]
	adds r6, 0x64
	mov r2, r10
	ldr r1, [r2]
	ldrb r2, [r1]
	lsls r0, r2, 5
	subs r0, r2
	lsls r0, 5
	adds r0, 0xC
	adds r1, r0
	movs r0, 0xC6
	lsls r0, 1
	adds r3, r0
	adds r1, r3
	adds r0, r6, 0
	bl sub_803E0A4
	b _0815EB9E
	.align 2, 0
_0815EB50: .4byte gUnknown_847A2FE
_0815EB54: .4byte gEnemyParty
_0815EB58:
	ldr r1, _0815EBB0 @ =gUnknown_847A30E
	lsls r0, r5, 1
	adds r0, r5
	adds r0, r4, r0
	adds r0, r1
	ldrb r2, [r0]
	movs r0, 0x2C
	adds r5, r2, 0
	muls r5, r0
	lsls r3, r4, 2
	adds r3, r4
	lsls r3, 3
	adds r3, r4
	lsls r3, 3
	adds r0, r5, r3
	adds r0, r7
	adds r0, r6, r0
	adds r0, 0x5C
	mov r1, r9
	strb r1, [r0]
	ldr r0, _0815EBB4 @ =gEnemyParty
	mov r2, r10
	ldr r1, [r2]
	ldrb r4, [r1]
	lsls r2, r4, 5
	subs r2, r4
	lsls r2, 5
	adds r2, 0xC
	adds r1, r2
	adds r3, 0x4
	adds r1, r3
	adds r5, 0x40
	adds r1, r5
	bl sub_803E0A4
_0815EB9E:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815EBB0: .4byte gUnknown_847A30E
_0815EBB4: .4byte gEnemyParty
	thumb_func_end sub_815E9FC

	thumb_func_start sub_815EBB8
sub_815EBB8: @ 815EBB8
	push {r4-r6,lr}
	movs r6, 0
	movs r5, 0
_0815EBBE:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0815EC08 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _0815EBF8
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0815EBF8
	adds r0, r4, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	cmp r0, r6
	ble _0815EBF8
	adds r6, r0, 0
_0815EBF8:
	adds r5, 0x1
	cmp r5, 0x5
	ble _0815EBBE
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0815EC08: .4byte gPlayerParty
	thumb_func_end sub_815EBB8

	thumb_func_start sub_815EC0C
sub_815EC0C: @ 815EC0C
	push {r4,lr}
	ldr r4, _0815EC70 @ =gSaveBlock1Ptr
	ldr r2, [r4]
	ldr r1, _0815EC74 @ =0x00003d34
	adds r0, r2, r1
	ldr r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r2, r0
	ldr r0, _0815EC78 @ =0x00003d41
	adds r2, r0
	ldr r0, _0815EC7C @ =gUnknown_203F458
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	ldrb r0, [r2]
	cmp r0, r1
	beq _0815EC6A
	strb r1, [r2]
	ldr r2, [r4]
	ldr r1, _0815EC74 @ =0x00003d34
	adds r0, r2, r1
	ldr r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r2, _0815EC80 @ =0x00003d3c
	adds r0, r2
	ldr r1, _0815EC84 @ =0x00034bbf
	bl sub_815EDF4
	ldr r1, [r4]
	ldr r2, _0815EC74 @ =0x00003d34
	adds r0, r1, r2
	ldr r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0
	ldr r0, _0815EC88 @ =0x00003d42
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
_0815EC6A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815EC70: .4byte gSaveBlock1Ptr
_0815EC74: .4byte 0x00003d34
_0815EC78: .4byte 0x00003d41
_0815EC7C: .4byte gUnknown_203F458
_0815EC80: .4byte 0x00003d3c
_0815EC84: .4byte 0x00034bbf
_0815EC88: .4byte 0x00003d42
	thumb_func_end sub_815EC0C

	thumb_func_start sub_815EC8C
sub_815EC8C: @ 815EC8C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	movs r0, 0
	mov r8, r0
	bl sub_815DC8C
	movs r0, 0xD8
	str r0, [sp]
	movs r0, 0x90
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillWindowPixelRect
	bl sub_815EC0C
	ldr r4, _0815EDB4 @ =gUnknown_847A22C
	str r4, [sp]
	mov r0, r8
	str r0, [sp, 0x4]
	ldr r0, _0815EDB8 @ =gUnknown_83FE982
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x4A
	movs r3, 0
	bl box_print
	movs r7, 0
	movs r0, 0x90
	lsls r0, 22
	mov r10, r0
	ldr r0, _0815EDBC @ =0x00003d38
	mov r9, r0
_0815ECDC:
	ldr r0, _0815EDC0 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	add r0, r9
	adds r0, 0x4
	bl sub_815EDDC
	adds r4, r0, 0
	movs r5, 0xE1
	lsls r5, 4
	adds r1, r5, 0
	bl __divsi3
	adds r6, r0, 0
	adds r0, r4, 0
	adds r1, r5, 0
	bl __modsi3
	adds r4, r0, 0
	movs r1, 0x3C
	bl __divsi3
	adds r5, r0, 0
	adds r0, r4, 0
	movs r1, 0x3C
	bl __modsi3
	movs r1, 0xA8
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r4, r0, 0
	ldr r0, _0815EDC4 @ =gStringVar1
	adds r1, r6, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _0815EDC8 @ =gStringVar2
	adds r1, r5, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _0815EDCC @ =gStringVar3
	adds r1, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _0815EDD0 @ =gStringVar4
	ldr r1, _0815EDD4 @ =gUnknown_83FE998
	bl StringExpandPlaceholders
	lsls r1, r7, 2
	mov r0, r10
	lsrs r4, r0, 24
	ldr r0, _0815EDB4 @ =gUnknown_847A22C
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r0, _0815EDD8 @ =gUnknown_83FE9C4
	adds r1, r0
	ldr r0, [r1]
	str r0, [sp, 0x8]
	mov r0, r8
	movs r1, 0x2
	movs r2, 0x18
	adds r3, r4, 0
	bl box_print
	ldr r0, _0815EDB4 @ =gUnknown_847A22C
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r0, _0815EDD0 @ =gStringVar4
	str r0, [sp, 0x8]
	mov r0, r8
	movs r1, 0x2
	movs r2, 0x60
	adds r3, r4, 0
	bl box_print
	movs r0, 0xA0
	lsls r0, 21
	add r10, r0
	movs r0, 0xC
	add r9, r0
	adds r7, 0x1
	cmp r7, 0x3
	ble _0815ECDC
	mov r0, r8
	bl PutWindowTilemap
	mov r0, r8
	movs r1, 0x3
	bl CopyWindowToVram
	bl sub_815DD2C
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815EDB4: .4byte gUnknown_847A22C
_0815EDB8: .4byte gUnknown_83FE982
_0815EDBC: .4byte 0x00003d38
_0815EDC0: .4byte gSaveBlock1Ptr
_0815EDC4: .4byte gStringVar1
_0815EDC8: .4byte gStringVar2
_0815EDCC: .4byte gStringVar3
_0815EDD0: .4byte gStringVar4
_0815EDD4: .4byte gUnknown_83FE998
_0815EDD8: .4byte gUnknown_83FE9C4
	thumb_func_end sub_815EC8C

	thumb_func_start sub_815EDDC
sub_815EDDC: @ 815EDDC
	ldr r1, _0815EDF0 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	movs r2, 0xF2
	lsls r2, 4
	adds r1, r2
	ldr r0, [r0]
	ldr r1, [r1]
	eors r0, r1
	bx lr
	.align 2, 0
_0815EDF0: .4byte gSaveBlock2Ptr
	thumb_func_end sub_815EDDC

	thumb_func_start sub_815EDF4
sub_815EDF4: @ 815EDF4
	ldr r2, _0815EE08 @ =gSaveBlock2Ptr
	ldr r2, [r2]
	movs r3, 0xF2
	lsls r3, 4
	adds r2, r3
	ldr r2, [r2]
	eors r2, r1
	str r2, [r0]
	bx lr
	.align 2, 0
_0815EE08: .4byte gSaveBlock2Ptr
	thumb_func_end sub_815EDF4

	thumb_func_start sub_815EE0C
sub_815EE0C: @ 815EE0C
	push {r4-r6,lr}
	ldr r6, _0815EE30 @ =gSaveBlock1Ptr
	ldr r5, _0815EE34 @ =0x00003d38
	movs r4, 0x3
_0815EE14:
	ldr r0, [r6]
	adds r0, r5
	adds r0, 0x4
	ldr r1, _0815EE38 @ =0x00034bbf
	bl sub_815EDF4
	adds r5, 0xC
	subs r4, 0x1
	cmp r4, 0
	bge _0815EE14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815EE30: .4byte gSaveBlock1Ptr
_0815EE34: .4byte 0x00003d38
_0815EE38: .4byte 0x00034bbf
	thumb_func_end sub_815EE0C

	.align 2, 0 @ Don't pad with nop.
