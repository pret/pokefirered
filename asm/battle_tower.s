	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80E5970
sub_80E5970: @ 80E5970
	push {r4,r5,lr}
	movs r4, 0
	movs r5, 0
_080E5976:
	ldr r0, _080E5990 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, _080E5994 @ =0x0000055e
	adds r0, r1
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0x6
	bhi _080E59B8
	lsls r0, 2
	ldr r1, _080E5998 @ =_080E599C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E5990: .4byte gSaveBlock2Ptr
_080E5994: .4byte 0x0000055e
_080E5998: .4byte _080E599C
	.align 2, 0
_080E599C:
	.4byte _080E59B8
	.4byte _080E59D0
	.4byte _080E59F0
	.4byte _080E5A00
	.4byte _080E59E0
	.4byte _080E59E8
	.4byte _080E5A00
_080E59B8:
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_80E5A38
	cmp r4, 0
	bne _080E5A00
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0x5
	bl VarSet
	b _080E5A00
_080E59D0:
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_80E5A38
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0x1
	b _080E59F6
_080E59E0:
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0x2
	b _080E59F6
_080E59E8:
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0x3
	b _080E59F6
_080E59F0:
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0x4
_080E59F6:
	bl VarSet
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080E5A00:
	adds r5, 0x1
	cmp r5, 0x1
	ble _080E5976
	ldr r0, _080E5A2C @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, _080E5A30 @ =0x0000055e
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _080E5A34 @ =0x00000303
	cmp r1, r0
	bne _080E5A20
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0x5
	bl VarSet
_080E5A20:
	bl sub_80E7064
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E5A2C: .4byte gSaveBlock2Ptr
_080E5A30: .4byte 0x0000055e
_080E5A34: .4byte 0x00000303
	thumb_func_end sub_80E5970

	thumb_func_start sub_80E5A38
sub_80E5A38: @ 80E5A38
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080E5A64 @ =gSaveBlock2Ptr
	ldr r1, [r3]
	ldr r2, _080E5A68 @ =0x0000055e
	adds r1, r2
	adds r1, r0
	movs r2, 0
	strb r2, [r1]
	ldr r2, [r3]
	lsls r0, 1
	movs r3, 0xAC
	lsls r3, 3
	adds r1, r2, r3
	adds r1, r0
	movs r3, 0x1
	strh r3, [r1]
	ldr r1, _080E5A6C @ =0x00000564
	adds r2, r1
	adds r2, r0
	strh r3, [r2]
	bx lr
	.align 2, 0
_080E5A64: .4byte gSaveBlock2Ptr
_080E5A68: .4byte 0x0000055e
_080E5A6C: .4byte 0x00000564
	thumb_func_end sub_80E5A38

	thumb_func_start sub_80E5A70
sub_80E5A70: @ 80E5A70
	push {r4-r7,lr}
	sub sp, 0x2C
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsrs r6, r1, 16
	add r4, sp, 0x28
	movs r0, 0
	strb r0, [r4]
	bl ValidateEReaderTrainer
	ldr r0, _080E5AA4 @ =gSpecialVar_Result
	ldrh r0, [r0]
	adds r7, r4, 0
	cmp r0, 0
	bne _080E5A9E
	ldr r0, _080E5AA8 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, _080E5AAC @ =0x000004a2
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r6
	beq _080E5AB0
_080E5A9E:
	movs r0, 0
	b _080E5B02
	.align 2, 0
_080E5AA4: .4byte gSpecialVar_Result
_080E5AA8: .4byte gSaveBlock2Ptr
_080E5AAC: .4byte 0x000004a2
_080E5AB0:
	movs r6, 0x32
	cmp r5, 0
	beq _080E5AB8
	movs r6, 0x64
_080E5AB8:
	movs r4, 0
_080E5ABA:
	ldr r0, _080E5B0C @ =gSaveBlock2Ptr
	ldr r1, [r0]
	movs r0, 0x2C
	muls r0, r4
	adds r1, r0
	movs r2, 0x9C
	lsls r2, 3
	adds r0, r1, r2
	ldrb r2, [r0]
	cmp r2, r6
	bne _080E5A9E
	ldr r3, _080E5B10 @ =0x000004d4
	adds r0, r1, r3
	ldrh r0, [r0]
	adds r3, 0x2
	adds r1, r3
	ldrh r1, [r1]
	str r2, [sp]
	add r2, sp, 0x10
	str r2, [sp, 0x4]
	add r2, sp, 0x1C
	str r2, [sp, 0x8]
	str r7, [sp, 0xC]
	movs r2, 0x1
	adds r3, r5, 0
	bl sub_80E6564
	adds r4, 0x1
	cmp r4, 0x2
	ble _080E5ABA
	movs r1, 0
	ldrb r0, [r7]
	cmp r0, 0x3
	bne _080E5B00
	movs r1, 0x1
_080E5B00:
	adds r0, r1, 0
_080E5B02:
	add sp, 0x2C
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080E5B0C: .4byte gSaveBlock2Ptr
_080E5B10: .4byte 0x000004d4
	thumb_func_end sub_80E5A70

	thumb_func_start sub_80E5B14
sub_80E5B14: @ 80E5B14
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	movs r0, 0
	str r0, [sp, 0x14]
	ldr r4, _080E5B58 @ =gSaveBlock2Ptr
	ldr r0, [r4]
	ldr r1, _080E5B5C @ =0x0000055c
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	mov r8, r0
	bl sub_80E7188
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	mov r0, r8
	mov r1, r9
	bl sub_80E5A70
	lsls r0, 24
	cmp r0, 0
	beq _080E5B64
	ldr r0, [r4]
	ldr r2, _080E5B60 @ =0x0000056c
	adds r0, r2
	movs r1, 0xC8
	strb r1, [r0]
	b _080E5C0C
	.align 2, 0
_080E5B58: .4byte gSaveBlock2Ptr
_080E5B5C: .4byte 0x0000055c
_080E5B60: .4byte 0x0000056c
_080E5B64:
	movs r6, 0
	movs r3, 0xA4
	mov r10, r3
	movs r7, 0xAA
	lsls r7, 1
	mov r12, r7
	ldr r0, _080E5BE8 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	str r0, [sp, 0x18]
	mov r1, sp
	str r1, [sp, 0x1C]
_080E5B7A:
	mov r0, r10
	muls r0, r6
	add r0, r12
	movs r4, 0
	movs r5, 0
	movs r1, 0
	adds r2, r6, 0x1
	str r2, [sp, 0x20]
	ldr r3, [sp, 0x18]
	adds r2, r3, r0
_080E5B8E:
	ldm r2!, {r0}
	orrs r4, r0
	adds r5, r0
	adds r1, 0x1
	cmp r1, 0x27
	bls _080E5B8E
	ldr r7, _080E5BE8 @ =gSaveBlock2Ptr
	ldr r2, [r7]
	mov r3, r10
	muls r3, r6
	adds r1, r2, r3
	movs r7, 0xAB
	lsls r7, 1
	adds r0, r1, r7
	ldrh r0, [r0]
	cmp r0, r9
	bne _080E5BD8
	mov r7, r12
	adds r0, r1, r7
	ldrb r0, [r0]
	cmp r0, r8
	bne _080E5BD8
	cmp r4, 0
	beq _080E5BD8
	movs r1, 0xFA
	lsls r1, 1
	adds r0, r2, r1
	adds r0, r3
	ldr r0, [r0]
	cmp r0, r5
	bne _080E5BD8
	ldr r2, [sp, 0x1C]
	stm r2!, {r6}
	str r2, [sp, 0x1C]
	ldr r3, [sp, 0x14]
	adds r3, 0x1
	str r3, [sp, 0x14]
_080E5BD8:
	ldr r6, [sp, 0x20]
	cmp r6, 0x4
	ble _080E5B7A
	ldr r7, [sp, 0x14]
	cmp r7, 0
	bne _080E5BEC
	movs r0, 0
	b _080E5C0E
	.align 2, 0
_080E5BE8: .4byte gSaveBlock2Ptr
_080E5BEC:
	bl Random
	ldr r1, _080E5C20 @ =gSaveBlock2Ptr
	ldr r4, [r1]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [sp, 0x14]
	bl __modsi3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	adds r0, 0x64
	ldr r1, _080E5C24 @ =0x0000056c
	adds r4, r1
	strb r0, [r4]
_080E5C0C:
	movs r0, 0x1
_080E5C0E:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080E5C20: .4byte gSaveBlock2Ptr
_080E5C24: .4byte 0x0000056c
	thumb_func_end sub_80E5B14

	thumb_func_start sub_80E5C28
sub_80E5C28: @ 80E5C28
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r5, _080E5C6C @ =gSaveBlock2Ptr
	ldr r0, [r5]
	ldr r1, _080E5C70 @ =0x0000055c
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r6, r0, 31
	bl sub_80E5B14
	lsls r0, 24
	cmp r0, 0
	beq _080E5C7C
	ldr r0, [r5]
	ldr r4, _080E5C74 @ =0x0000056c
	adds r0, r4
	ldrb r0, [r0]
	bl sub_80E5E5C
	ldr r1, [r5]
	lsls r2, r6, 1
	movs r3, 0xAC
	lsls r3, 3
	adds r0, r1, r3
	adds r0, r2
	ldrh r0, [r0]
	adds r0, r1, r0
	ldr r2, _080E5C78 @ =0x00000571
	adds r0, r2
	adds r1, r4
	b _080E5E3E
	.align 2, 0
_080E5C6C: .4byte gSaveBlock2Ptr
_080E5C70: .4byte 0x0000055c
_080E5C74: .4byte 0x0000056c
_080E5C78: .4byte 0x00000571
_080E5C7C:
	ldr r2, [r5]
	lsls r0, r6, 1
	ldr r3, _080E5D1C @ =0x00000564
	adds r1, r2, r3
	adds r1, r0
	ldrh r1, [r1]
	adds r6, r0, 0
	cmp r1, 0x7
	bls _080E5C90
	b _080E5DB8
_080E5C90:
	movs r1, 0xAC
	lsls r1, 3
	adds r0, r2, r1
	adds r0, r6
	ldrh r0, [r0]
	cmp r0, 0x7
	bne _080E5D2C
	adds r7, r6, 0
	mov r8, r5
_080E5CA2:
	bl Random
	movs r1, 0xFF
	ands r1, r0
	lsls r2, r1, 2
	adds r2, r1
	mov r3, r8
	ldr r4, [r3]
	ldr r1, _080E5D1C @ =0x00000564
	adds r0, r4, r1
	adds r0, r7
	ldrh r1, [r0]
	subs r1, 0x1
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	adds r0, 0x14
	lsrs r2, 7
	adds r2, r0
	lsls r2, 16
	lsrs r5, r2, 16
	movs r3, 0
	movs r0, 0xAC
	lsls r0, 3
	adds r2, r4, r0
	adds r0, r2, r7
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r3, r0
	bge _080E5CFC
	ldr r0, _080E5D20 @ =0x00000572
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, r5
	beq _080E5CFC
	adds r0, r2, r6
	ldrh r0, [r0]
	subs r4, r0, 0x1
_080E5CEE:
	adds r3, 0x1
	cmp r3, r4
	bge _080E5CFC
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r5
	bne _080E5CEE
_080E5CFC:
	mov r1, r8
	ldr r0, [r1]
	movs r2, 0xAC
	lsls r2, 3
	adds r0, r2
	adds r0, r6
	ldrh r0, [r0]
	subs r0, 0x1
	ldr r4, _080E5D24 @ =gSaveBlock2Ptr
	cmp r3, r0
	bne _080E5CA2
	ldr r0, [r4]
	ldr r3, _080E5D28 @ =0x0000056c
	adds r0, r3
	b _080E5E16
	.align 2, 0
_080E5D1C: .4byte 0x00000564
_080E5D20: .4byte 0x00000572
_080E5D24: .4byte gSaveBlock2Ptr
_080E5D28: .4byte 0x0000056c
_080E5D2C:
	adds r7, r6, 0
	mov r8, r5
_080E5D30:
	bl Random
	movs r1, 0xFF
	ands r1, r0
	lsls r0, r1, 2
	adds r0, r1
	lsrs r5, r0, 6
	mov r0, r8
	ldr r4, [r0]
	ldr r1, _080E5DA8 @ =0x00000564
	adds r0, r4, r1
	adds r0, r7
	ldrh r1, [r0]
	subs r1, 0x1
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	adds r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
	movs r3, 0
	movs r0, 0xAC
	lsls r0, 3
	adds r2, r4, r0
	adds r0, r2, r7
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r3, r0
	bge _080E5D88
	ldr r0, _080E5DAC @ =0x00000572
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, r5
	beq _080E5D88
	adds r0, r2, r6
	ldrh r0, [r0]
	subs r4, r0, 0x1
_080E5D7A:
	adds r3, 0x1
	cmp r3, r4
	bge _080E5D88
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r5
	bne _080E5D7A
_080E5D88:
	mov r1, r8
	ldr r0, [r1]
	movs r2, 0xAC
	lsls r2, 3
	adds r0, r2
	adds r0, r6
	ldrh r0, [r0]
	subs r0, 0x1
	ldr r4, _080E5DB0 @ =gSaveBlock2Ptr
	cmp r3, r0
	bne _080E5D30
	ldr r0, [r4]
	ldr r3, _080E5DB4 @ =0x0000056c
	adds r0, r3
	b _080E5E16
	.align 2, 0
_080E5DA8: .4byte 0x00000564
_080E5DAC: .4byte 0x00000572
_080E5DB0: .4byte gSaveBlock2Ptr
_080E5DB4: .4byte 0x0000056c
_080E5DB8:
	adds r7, r5, 0
_080E5DBA:
	bl Random
	movs r1, 0xFF
	ands r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 1
	asrs r0, 8
	adds r0, 0x46
	lsls r0, 16
	lsrs r5, r0, 16
	movs r3, 0
	ldr r1, [r7]
	movs r2, 0xAC
	lsls r2, 3
	adds r0, r1, r2
	adds r0, r6
	ldrh r0, [r0]
	subs r4, r0, 0x1
	cmp r3, r4
	bge _080E5DFC
	ldr r0, _080E5E4C @ =0x00000572
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, r5
	beq _080E5DFC
_080E5DEE:
	adds r3, 0x1
	cmp r3, r4
	bge _080E5DFC
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r5
	bne _080E5DEE
_080E5DFC:
	ldr r0, [r7]
	movs r1, 0xAC
	lsls r1, 3
	adds r0, r1
	adds r0, r6
	ldrh r0, [r0]
	subs r0, 0x1
	ldr r4, _080E5E50 @ =gSaveBlock2Ptr
	cmp r3, r0
	bne _080E5DBA
	ldr r0, [r4]
	ldr r2, _080E5E54 @ =0x0000056c
	adds r0, r2
_080E5E16:
	strb r5, [r0]
	ldr r0, [r4]
	ldr r3, _080E5E54 @ =0x0000056c
	adds r0, r3
	ldrb r0, [r0]
	bl sub_80E5E5C
	ldr r1, [r4]
	movs r2, 0xAC
	lsls r2, 3
	adds r0, r1, r2
	adds r2, r0, r6
	ldrh r0, [r2]
	cmp r0, 0x6
	bhi _080E5E42
	adds r0, r1, r0
	ldr r3, _080E5E58 @ =0x00000571
	adds r0, r3
	ldr r2, _080E5E54 @ =0x0000056c
	adds r1, r2
_080E5E3E:
	ldrb r1, [r1]
	strb r1, [r0]
_080E5E42:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E5E4C: .4byte 0x00000572
_080E5E50: .4byte gSaveBlock2Ptr
_080E5E54: .4byte 0x0000056c
_080E5E58: .4byte 0x00000571
	thumb_func_end sub_80E5C28

	thumb_func_start sub_80E5E5C
sub_80E5E5C: @ 80E5E5C
	push {lr}
	ldr r0, _080E5E6C @ =0x00004010
	movs r1, 0x12
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_080E5E6C: .4byte 0x00004010
	thumb_func_end sub_80E5E5C

	thumb_func_start sub_80E5E70
sub_80E5E70: @ 80E5E70
	push {lr}
	movs r0, 0xC8
	bl sub_80E5E5C
	pop {r0}
	bx r0
	thumb_func_end sub_80E5E70

	thumb_func_start sub_80E5E7C
sub_80E5E7C: @ 80E5E7C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	movs r1, 0
	mov r8, r1
	mov r10, r0
	movs r5, 0
	ldr r2, _080E5F08 @ =gSaveBlock2Ptr
	ldr r0, [r2]
	mov r4, r10
	ldrb r4, [r4, 0xC]
	str r4, [sp, 0x18]
	mov r9, r5
	movs r7, 0x4
	str r7, [sp, 0x1C]
	movs r1, 0xB0
	lsls r1, 1
	adds r1, r0
	mov r12, r1
_080E5EA8:
	movs r6, 0
	movs r3, 0
	mov r2, r12
	ldrb r0, [r2]
	ldr r4, [sp, 0x18]
	cmp r0, r4
	bne _080E5EDA
	mov r4, r9
	mov r2, r10
	adds r2, 0xC
_080E5EBC:
	adds r3, 0x1
	cmp r3, 0x3
	bgt _080E5EDA
	ldr r7, _080E5F08 @ =gSaveBlock2Ptr
	ldr r0, [r7]
	adds r1, r3, r4
	movs r7, 0xB0
	lsls r7, 1
	adds r0, r7
	adds r0, r1
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080E5EBC
_080E5EDA:
	cmp r3, 0x4
	bne _080E5F20
	movs r6, 0
	ldr r1, _080E5F08 @ =gSaveBlock2Ptr
	ldr r0, [r1]
	movs r3, 0xAC
	lsls r3, 1
	adds r0, r3
	ldr r2, [sp, 0x1C]
	adds r0, r2
	ldrb r0, [r0]
	mov r4, r10
	ldrb r4, [r4, 0x8]
	cmp r0, r4
	bne _080E5F20
	adds r1, r0, 0
	mov r2, r9
	adds r2, 0x4
_080E5EFE:
	cmp r1, 0xFF
	bne _080E5F0C
	movs r6, 0x7
	b _080E5F20
	.align 2, 0
_080E5F08: .4byte gSaveBlock2Ptr
_080E5F0C:
	adds r6, 0x1
	cmp r6, 0x6
	bgt _080E5F20
	ldr r7, _080E5F4C @ =gSaveBlock2Ptr
	ldr r0, [r7]
	adds r0, r3
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, r1
	beq _080E5EFE
_080E5F20:
	cmp r6, 0x7
	beq _080E5F36
	movs r0, 0xA4
	add r9, r0
	ldr r1, [sp, 0x1C]
	adds r1, 0xA4
	str r1, [sp, 0x1C]
	add r12, r0
	adds r5, 0x1
	cmp r5, 0x4
	ble _080E5EA8
_080E5F36:
	cmp r5, 0x4
	bgt _080E5F50
	ldr r2, _080E5F4C @ =gSaveBlock2Ptr
	ldr r0, [r2]
	movs r1, 0xA4
	muls r1, r5
	adds r0, r1
	movs r4, 0xAA
	lsls r4, 1
	adds r0, r4
	b _080E5F90
	.align 2, 0
_080E5F4C: .4byte gSaveBlock2Ptr
_080E5F50:
	movs r5, 0
	ldr r7, _080E5F9C @ =gSaveBlock2Ptr
	ldr r0, [r7]
	movs r1, 0xAB
	lsls r1, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _080E5F7C
	adds r3, r7, 0
	adds r2, r1, 0
	movs r1, 0
_080E5F68:
	adds r1, 0xA4
	adds r5, 0x1
	cmp r5, 0x4
	bgt _080E5FA0
	ldr r0, [r3]
	adds r0, r1
	adds r0, r2
	ldrh r0, [r0]
	cmp r0, 0
	bne _080E5F68
_080E5F7C:
	cmp r5, 0x4
	bgt _080E5FA0
	ldr r1, _080E5F9C @ =gSaveBlock2Ptr
	ldr r0, [r1]
	movs r1, 0xA4
	muls r1, r5
	adds r0, r1
	movs r2, 0xAA
	lsls r2, 1
	adds r0, r2
_080E5F90:
	mov r1, r10
	movs r2, 0xA4
	bl memcpy
	b _080E6062
	.align 2, 0
_080E5F9C: .4byte gSaveBlock2Ptr
_080E5FA0:
	mov r2, sp
	ldr r4, _080E5FF8 @ =gSaveBlock2Ptr
	ldr r0, [r4]
	movs r3, 0xAB
	lsls r3, 1
	adds r0, r3
	ldrh r0, [r0]
	movs r1, 0
	strh r0, [r2]
	add r0, sp, 0xC
	strh r1, [r0]
	movs r7, 0x1
	add r8, r7
	movs r5, 0x1
	add r0, sp, 0xC
	mov r9, r0
	mov r12, r3
_080E5FC2:
	movs r3, 0
	adds r7, r5, 0x1
	cmp r3, r8
	bge _080E6006
	ldr r1, _080E5FF8 @ =gSaveBlock2Ptr
	ldr r0, [r1]
	movs r2, 0xA4
	adds r1, r5, 0
	muls r1, r2
	adds r0, r1
	mov r1, r12
	adds r4, r0, r1
	mov r6, sp
_080E5FDC:
	lsls r0, r3, 1
	add r0, sp
	ldrh r2, [r4]
	adds r1, r2, 0
	ldrh r0, [r0]
	cmp r1, r0
	bcs _080E5FFC
	movs r3, 0
	movs r4, 0x1
	mov r8, r4
	strh r2, [r6]
	mov r0, r9
	strh r5, [r0]
	b _080E6006
	.align 2, 0
_080E5FF8: .4byte gSaveBlock2Ptr
_080E5FFC:
	cmp r1, r0
	bhi _080E6006
	adds r3, 0x1
	cmp r3, r8
	blt _080E5FDC
_080E6006:
	cmp r3, r8
	bne _080E602C
	mov r1, r8
	lsls r2, r1, 1
	mov r4, sp
	adds r3, r4, r2
	ldr r1, _080E6074 @ =gSaveBlock2Ptr
	ldr r0, [r1]
	movs r4, 0xA4
	adds r1, r5, 0
	muls r1, r4
	adds r0, r1
	add r0, r12
	ldrh r0, [r0]
	strh r0, [r3]
	add r2, r9
	strh r5, [r2]
	movs r0, 0x1
	add r8, r0
_080E602C:
	adds r5, r7, 0
	cmp r5, 0x4
	ble _080E5FC2
	bl Random
	lsls r0, 16
	lsrs r0, 16
	mov r1, r8
	bl __modsi3
	adds r5, r0, 0
	ldr r0, _080E6074 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	lsls r1, r5, 1
	add r1, sp
	adds r1, 0xC
	ldrh r2, [r1]
	movs r1, 0xA4
	muls r1, r2
	adds r0, r1
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r1
	mov r1, r10
	movs r2, 0xA4
	bl memcpy
_080E6062:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E6074: .4byte gSaveBlock2Ptr
	thumb_func_end sub_80E5E7C

	thumb_func_start GetBattleTowerTrainerFrontSpriteId
GetBattleTowerTrainerFrontSpriteId: @ 80E6078
	push {lr}
	ldr r0, _080E6094 @ =gSaveBlock2Ptr
	ldr r3, [r0]
	ldr r0, _080E6098 @ =0x0000056c
	adds r1, r3, r0
	ldrb r0, [r1]
	cmp r0, 0xC8
	bne _080E60A4
	ldr r1, _080E609C @ =gFacilityClassToPicIndex
	ldr r2, _080E60A0 @ =0x000004a1
	adds r0, r3, r2
	ldrb r0, [r0]
	adds r0, r1
	b _080E60D6
	.align 2, 0
_080E6094: .4byte gSaveBlock2Ptr
_080E6098: .4byte 0x0000056c
_080E609C: .4byte gFacilityClassToPicIndex
_080E60A0: .4byte 0x000004a1
_080E60A4:
	cmp r0, 0x63
	bls _080E60C4
	ldr r2, _080E60C0 @ =gFacilityClassToPicIndex
	ldrb r0, [r1]
	subs r0, 0x64
	movs r1, 0xA4
	muls r0, r1
	adds r0, r3, r0
	adds r1, 0xB1
	adds r0, r1
	ldrb r0, [r0]
	adds r0, r2
	b _080E60D6
	.align 2, 0
_080E60C0: .4byte gFacilityClassToPicIndex
_080E60C4:
	ldr r3, _080E60DC @ =gFacilityClassToPicIndex
	ldr r2, _080E60E0 @ =gUnknown_83FFAC4
	ldrb r1, [r1]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	adds r0, r3
_080E60D6:
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080E60DC: .4byte gFacilityClassToPicIndex
_080E60E0: .4byte gUnknown_83FFAC4
	thumb_func_end GetBattleTowerTrainerFrontSpriteId

	thumb_func_start sub_80E60E4
sub_80E60E4: @ 80E60E4
	push {lr}
	ldr r0, _080E6100 @ =gSaveBlock2Ptr
	ldr r3, [r0]
	ldr r0, _080E6104 @ =0x0000056c
	adds r1, r3, r0
	ldrb r0, [r1]
	cmp r0, 0xC8
	bne _080E6110
	ldr r1, _080E6108 @ =gFacilityClassToTrainerClass
	ldr r2, _080E610C @ =0x000004a1
	adds r0, r3, r2
	ldrb r0, [r0]
	adds r0, r1
	b _080E6144
	.align 2, 0
_080E6100: .4byte gSaveBlock2Ptr
_080E6104: .4byte 0x0000056c
_080E6108: .4byte gFacilityClassToTrainerClass
_080E610C: .4byte 0x000004a1
_080E6110:
	cmp r0, 0x63
	bhi _080E6130
	ldr r3, _080E6128 @ =gFacilityClassToTrainerClass
	ldr r2, _080E612C @ =gUnknown_83FFAC4
	ldrb r1, [r1]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	adds r0, r3
	b _080E6144
	.align 2, 0
_080E6128: .4byte gFacilityClassToTrainerClass
_080E612C: .4byte gUnknown_83FFAC4
_080E6130:
	ldr r2, _080E614C @ =gFacilityClassToTrainerClass
	ldrb r0, [r1]
	subs r0, 0x64
	movs r1, 0xA4
	muls r0, r1
	adds r0, r3, r0
	adds r1, 0xB1
	adds r0, r1
	ldrb r0, [r0]
	adds r0, r2
_080E6144:
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080E614C: .4byte gFacilityClassToTrainerClass
	thumb_func_end sub_80E60E4

	thumb_func_start sub_80E6150
sub_80E6150: @ 80E6150
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r0, _080E6178 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	ldr r2, _080E617C @ =0x0000056c
	adds r0, r1, r2
	ldrb r2, [r0]
	cmp r2, 0xC8
	bne _080E6184
	movs r3, 0
	ldr r0, _080E6180 @ =0x000004a4
	adds r2, r1, r0
_080E6168:
	adds r0, r4, r3
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, 0x1
	cmp r3, 0x6
	ble _080E6168
	b _080E61CE
	.align 2, 0
_080E6178: .4byte gSaveBlock2Ptr
_080E617C: .4byte 0x0000056c
_080E6180: .4byte 0x000004a4
_080E6184:
	cmp r2, 0x63
	bhi _080E61AC
	movs r3, 0
	adds r5, r0, 0
	ldr r6, _080E61A8 @ =gUnknown_83FFAC5
_080E618E:
	adds r2, r4, r3
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r3, r0
	adds r0, r6
	ldrb r0, [r0]
	strb r0, [r2]
	adds r3, 0x1
	cmp r3, 0x2
	ble _080E618E
	b _080E61CE
	.align 2, 0
_080E61A8: .4byte gUnknown_83FFAC5
_080E61AC:
	movs r3, 0
	adds r5, r0, 0
	movs r0, 0xAC
	lsls r0, 1
	adds r2, r1, r0
	movs r6, 0xA4
_080E61B8:
	adds r1, r4, r3
	ldrb r0, [r5]
	subs r0, 0x64
	muls r0, r6
	adds r0, r3, r0
	adds r0, r2, r0
	ldrb r0, [r0]
	strb r0, [r1]
	adds r3, 0x1
	cmp r3, 0x6
	ble _080E61B8
_080E61CE:
	adds r1, r4, r3
	movs r0, 0xFF
	strb r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E6150

	thumb_func_start sub_80E61DC
sub_80E61DC: @ 80E61DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	movs r0, 0
	str r0, [sp, 0x18]
	movs r1, 0x3C
	str r1, [sp, 0x1C]
	add r4, sp, 0xC
	movs r0, 0xFF
	strb r0, [r4]
	bl ZeroEnemyPartyMons
	ldr r1, _080E6210 @ =gSaveBlock2Ptr
	ldr r0, [r1]
	ldr r2, _080E6214 @ =0x0000056c
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x13
	bhi _080E6218
	movs r3, 0x6
	str r3, [sp, 0x14]
	b _080E62F4
	.align 2, 0
_080E6210: .4byte gSaveBlock2Ptr
_080E6214: .4byte 0x0000056c
_080E6218:
	cmp r0, 0x1D
	bhi _080E6226
	movs r0, 0x9
	str r0, [sp, 0x14]
	movs r1, 0x1E
	str r1, [sp, 0x18]
	b _080E62F4
_080E6226:
	cmp r0, 0x27
	bhi _080E6234
	movs r2, 0xC
	str r2, [sp, 0x14]
	movs r3, 0x3C
	str r3, [sp, 0x18]
	b _080E62F4
_080E6234:
	cmp r0, 0x31
	bhi _080E6242
	movs r0, 0xF
	str r0, [sp, 0x14]
	movs r1, 0x5A
	str r1, [sp, 0x18]
	b _080E62F4
_080E6242:
	cmp r0, 0x3B
	bhi _080E6250
	movs r2, 0x12
	str r2, [sp, 0x14]
	movs r3, 0x78
	str r3, [sp, 0x18]
	b _080E62F4
_080E6250:
	cmp r0, 0x45
	bhi _080E625E
	movs r0, 0x15
	str r0, [sp, 0x14]
	movs r1, 0x96
	str r1, [sp, 0x18]
	b _080E62F4
_080E625E:
	cmp r0, 0x4F
	bhi _080E626C
	movs r2, 0x1F
	str r2, [sp, 0x14]
	movs r3, 0xB4
	str r3, [sp, 0x18]
	b _080E62F4
_080E626C:
	cmp r0, 0x63
	bhi _080E627E
	movs r0, 0x1F
	str r0, [sp, 0x14]
	movs r1, 0xC8
	str r1, [sp, 0x18]
	movs r2, 0x64
	str r2, [sp, 0x1C]
	b _080E62F4
_080E627E:
	cmp r0, 0xC8
	bne _080E62B0
	movs r6, 0
	adds r4, r1, 0
_080E6286:
	movs r0, 0x64
	muls r0, r6
	ldr r1, _080E62A8 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2C
	adds r2, r6, 0
	muls r2, r1
	ldr r3, _080E62AC @ =0x000004d4
	adds r2, r3
	ldr r1, [r4]
	adds r1, r2
	bl CreateBattleTowerMon
	adds r6, 0x1
	cmp r6, 0x2
	ble _080E6286
	b _080E64A6
	.align 2, 0
_080E62A8: .4byte gEnemyParty
_080E62AC: .4byte 0x000004d4
_080E62B0:
	movs r6, 0
_080E62B2:
	movs r0, 0x64
	muls r0, r6
	ldr r1, _080E62E4 @ =gEnemyParty
	adds r0, r1
	ldr r1, _080E62E8 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	ldr r3, _080E62EC @ =0x0000056c
	adds r2, r1, r3
	ldrb r3, [r2]
	movs r2, 0xA4
	muls r2, r3
	ldr r3, _080E62F0 @ =0xffffc144
	adds r2, r3
	adds r1, r2
	movs r2, 0x2C
	muls r2, r6
	adds r2, 0x1C
	adds r1, r2
	bl CreateBattleTowerMon
	adds r6, 0x1
	cmp r6, 0x2
	ble _080E62B2
	b _080E64A6
	.align 2, 0
_080E62E4: .4byte gEnemyParty
_080E62E8: .4byte gSaveBlock2Ptr
_080E62EC: .4byte 0x0000056c
_080E62F0: .4byte 0xffffc144
_080E62F4:
	ldr r2, _080E6314 @ =gSaveBlock2Ptr
	ldr r0, [r2]
	ldr r1, _080E6318 @ =0x0000055c
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	adds r1, r2, 0
	cmp r0, 0
	beq _080E6320
	ldr r2, _080E631C @ =gUnknown_8400E04
	mov r10, r2
	movs r3, 0x64
	str r3, [sp, 0x10]
	b _080E6328
	.align 2, 0
_080E6314: .4byte gSaveBlock2Ptr
_080E6318: .4byte 0x0000055c
_080E631C: .4byte gUnknown_8400E04
_080E6320:
	ldr r0, _080E6378 @ =gUnknown_83FFB44
	mov r10, r0
	movs r2, 0x32
	str r2, [sp, 0x10]
_080E6328:
	ldr r2, _080E637C @ =gUnknown_83FFAC4
	ldr r0, [r1]
	ldr r3, _080E6380 @ =0x0000056c
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x4]
	str r0, [sp, 0x20]
	movs r6, 0
_080E6340:
	bl Random
	movs r1, 0xFF
	ands r1, r0
	ldr r2, [sp, 0x1C]
	adds r0, r1, 0
	muls r0, r2
	asrs r0, 8
	ldr r3, [sp, 0x18]
	adds r7, r0, r3
	ldr r0, [sp, 0x20]
	cmp r0, 0
	beq _080E636A
	lsls r0, r7, 4
	add r0, r10
	ldrb r0, [r0, 0x3]
	ldr r1, [sp, 0x20]
	ands r0, r1
	cmp r0, r1
	beq _080E636A
	b _080E64A0
_080E636A:
	movs r5, 0
	lsls r0, r7, 4
	mov r2, r10
	adds r3, r0, r2
	movs r4, 0
	b _080E6388
	.align 2, 0
_080E6378: .4byte gUnknown_83FFB44
_080E637C: .4byte gUnknown_83FFAC4
_080E6380: .4byte 0x0000056c
_080E6384:
	adds r4, 0x64
	adds r5, 0x1
_080E6388:
	cmp r5, r6
	bge _080E63A2
	ldr r1, _080E64B8 @ =gEnemyParty
	adds r0, r4, r1
	movs r1, 0xB
	movs r2, 0
	str r3, [sp, 0x24]
	bl GetMonData
	ldr r3, [sp, 0x24]
	ldrh r2, [r3]
	cmp r0, r2
	bne _080E6384
_080E63A2:
	cmp r5, r6
	bne _080E64A0
	movs r5, 0
	cmp r5, r6
	bge _080E63F0
	ldr r3, _080E64BC @ =gUnknown_83FFAC4
	mov r9, r3
	lsls r0, r7, 4
	add r0, r10
	mov r8, r0
	movs r3, 0
_080E63B8:
	ldr r0, _080E64B8 @ =gEnemyParty
	adds r4, r3, r0
	adds r0, r4, 0
	movs r1, 0xC
	movs r2, 0
	str r3, [sp, 0x24]
	bl GetMonData
	ldr r3, [sp, 0x24]
	cmp r0, 0
	beq _080E63E8
	adds r0, r4, 0
	movs r1, 0xC
	movs r2, 0
	bl GetMonData
	mov r2, r8
	ldrb r1, [r2, 0x2]
	lsls r1, 1
	add r1, r9
	ldr r3, [sp, 0x24]
	ldrh r1, [r1]
	cmp r0, r1
	beq _080E63F0
_080E63E8:
	adds r3, 0x64
	adds r5, 0x1
	cmp r5, r6
	blt _080E63B8
_080E63F0:
	cmp r5, r6
	bne _080E64A0
	movs r5, 0
	cmp r5, r6
	bge _080E6412
	add r0, sp, 0x4
	ldrh r0, [r0]
	cmp r0, r7
	beq _080E6412
	add r1, sp, 0x4
_080E6404:
	adds r1, 0x2
	adds r5, 0x1
	cmp r5, r6
	bge _080E6412
	ldrh r0, [r1]
	cmp r0, r7
	bne _080E6404
_080E6412:
	cmp r5, r6
	bne _080E64A0
	lsls r0, r6, 1
	add r0, sp
	adds r0, 0x4
	strh r7, [r0]
	movs r3, 0x64
	adds r0, r6, 0
	muls r0, r3
	ldr r1, _080E64B8 @ =gEnemyParty
	adds r0, r1
	lsls r4, r7, 4
	mov r3, r10
	adds r2, r4, r3
	ldrh r1, [r2]
	ldrb r2, [r2, 0xC]
	str r2, [sp]
	ldr r2, [sp, 0x10]
	ldr r3, [sp, 0x14]
	bl CreateMonWithEVSpread
	movs r5, 0
	adds r0, r6, 0x1
	mov r9, r0
	mov r8, r4
	movs r0, 0x64
	adds r7, r6, 0
	muls r7, r0
	mov r0, r10
	adds r0, 0x4
	adds r4, r0
	ldr r3, _080E64B8 @ =gEnemyParty
_080E6452:
	ldrh r1, [r4]
	lsls r2, r5, 24
	lsrs r2, 24
	adds r0, r7, r3
	str r3, [sp, 0x24]
	bl SetMonMoveSlot
	ldrh r0, [r4]
	ldr r3, [sp, 0x24]
	cmp r0, 0xDA
	bne _080E646E
	movs r0, 0
	mov r1, sp
	strb r0, [r1, 0xC]
_080E646E:
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _080E6452
	movs r2, 0x64
	adds r4, r6, 0
	muls r4, r2
	ldr r3, _080E64B8 @ =gEnemyParty
	adds r4, r3
	adds r0, r4, 0
	movs r1, 0x20
	add r2, sp, 0xC
	bl SetMonData
	mov r0, r8
	add r0, r10
	ldrb r2, [r0, 0x2]
	lsls r2, 1
	ldr r0, _080E64BC @ =gUnknown_83FFAC4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
	mov r6, r9
_080E64A0:
	cmp r6, 0x3
	beq _080E64A6
	b _080E6340
_080E64A6:
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E64B8: .4byte gEnemyParty
_080E64BC: .4byte gUnknown_83FFAC4
	thumb_func_end sub_80E61DC

	thumb_func_start sub_80E64C0
sub_80E64C0: @ 80E64C0
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r0, 16
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl GetSetPokedexFlag
	lsls r0, 24
	cmp r0, 0
	beq _080E6554
	cmp r4, 0
	bne _080E64EC
	ldr r0, _080E6514 @ =gStringVar1
	ldr r1, _080E6518 @ =gUnknown_83FE859
	bl StringAppend
_080E64EC:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r6, _080E6514 @ =gStringVar1
	movs r0, 0xB
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080E651C @ =gSpeciesNames
	adds r1, r0
	adds r0, r6, 0
	bl StringAppend
	cmp r4, 0x5
	beq _080E6538
	cmp r4, 0x5
	bgt _080E6520
	cmp r4, 0x2
	beq _080E652A
	b _080E654C
	.align 2, 0
_080E6514: .4byte gStringVar1
_080E6518: .4byte gUnknown_83FE859
_080E651C: .4byte gSpeciesNames
_080E6520:
	cmp r4, 0x8
	beq _080E6538
	cmp r4, 0xB
	beq _080E6538
	b _080E654C
_080E652A:
	ldr r1, _080E6534 @ =gUnknown_83FE85E
	adds r0, r6, 0
	bl StringAppend
	b _080E6554
	.align 2, 0
_080E6534: .4byte gUnknown_83FE85E
_080E6538:
	ldr r0, _080E6544 @ =gStringVar1
	ldr r1, _080E6548 @ =gUnknown_83FE85C
	bl StringAppend
	b _080E6554
	.align 2, 0
_080E6544: .4byte gStringVar1
_080E6548: .4byte gUnknown_83FE85C
_080E654C:
	ldr r0, _080E655C @ =gStringVar1
	ldr r1, _080E6560 @ =gUnknown_83FE859
	bl StringAppend
_080E6554:
	adds r0, r4, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080E655C: .4byte gStringVar1
_080E6560: .4byte gUnknown_83FE859
	thumb_func_end sub_80E64C0

	thumb_func_start sub_80E6564
sub_80E6564: @ 80E6564
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r2, [sp, 0x20]
	ldr r4, [sp, 0x24]
	mov r9, r4
	ldr r4, [sp, 0x28]
	mov r10, r4
	ldr r7, [sp, 0x2C]
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r3, 24
	lsrs r3, 24
	mov r12, r3
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	movs r2, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	beq _080E6632
	cmp r4, 0
	beq _080E6632
	ldr r0, _080E6640 @ =gUnknown_84020C4
	ldrh r1, [r0]
	ldr r5, _080E6644 @ =0x0000ffff
	adds r3, r0, 0
	cmp r1, r5
	beq _080E65C8
	cmp r1, r4
	beq _080E65BC
	adds r1, r3, 0
_080E65AE:
	adds r1, 0x2
	adds r2, 0x1
	ldrh r0, [r1]
	cmp r0, r5
	beq _080E65C8
	cmp r0, r4
	bne _080E65AE
_080E65BC:
	lsls r0, r2, 1
	adds r0, r3
	ldrh r1, [r0]
	ldr r0, _080E6644 @ =0x0000ffff
	cmp r1, r0
	bne _080E6632
_080E65C8:
	mov r0, r12
	cmp r0, 0
	bne _080E65D4
	mov r1, r8
	cmp r1, 0x32
	bhi _080E6632
_080E65D4:
	movs r2, 0
	ldrb r3, [r7]
	cmp r2, r3
	bge _080E65F4
	mov r1, r9
	ldrh r0, [r1]
	cmp r0, r4
	beq _080E65F4
	adds r5, r3, 0
_080E65E6:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, r5
	bge _080E65F4
	ldrh r0, [r1]
	cmp r0, r4
	bne _080E65E6
_080E65F4:
	cmp r2, r3
	bne _080E6632
	cmp r6, 0
	beq _080E661E
	movs r2, 0
	cmp r2, r3
	bge _080E661A
	mov r1, r10
	ldrh r0, [r1]
	cmp r0, r6
	beq _080E661A
	adds r5, r3, 0
_080E660C:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, r5
	bge _080E661A
	ldrh r0, [r1]
	cmp r0, r6
	bne _080E660C
_080E661A:
	cmp r2, r3
	bne _080E6632
_080E661E:
	lsls r0, r3, 1
	add r0, r9
	strh r4, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	add r0, r10
	strh r6, [r0]
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
_080E6632:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E6640: .4byte gUnknown_84020C4
_080E6644: .4byte 0x0000ffff
	thumb_func_end sub_80E6564

	thumb_func_start sub_80E6648
sub_80E6648: @ 80E6648
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	add r1, sp, 0x28
	movs r0, 0
	strb r0, [r1]
	movs r7, 0
	mov r9, r1
	add r0, sp, 0x1C
	mov r10, r0
_080E6662:
	movs r0, 0x64
	adds r5, r7, 0
	muls r5, r0
	ldr r0, _080E6724 @ =gPlayerParty
	adds r5, r0
	adds r0, r5, 0
	movs r1, 0x41
	bl GetMonData
	mov r8, r0
	mov r1, r8
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	adds r0, r5, 0
	movs r1, 0xC
	bl GetMonData
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	adds r0, r5, 0
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	ldr r5, _080E6728 @ =gSpecialVar_Result
	ldrb r3, [r5]
	str r4, [sp]
	add r0, sp, 0x10
	str r0, [sp, 0x4]
	mov r1, r10
	str r1, [sp, 0x8]
	mov r0, r9
	str r0, [sp, 0xC]
	mov r0, r8
	adds r1, r6, 0
	bl sub_80E6564
	adds r7, 0x1
	cmp r7, 0x5
	ble _080E6662
	mov r1, r9
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _080E6750
	ldr r1, _080E672C @ =gStringVar1
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, _080E6730 @ =gSpecialVar_0x8004
	movs r0, 0x1
	strh r0, [r1]
	movs r0, 0
	mov r1, r9
	strb r0, [r1]
	ldr r2, _080E6734 @ =gUnknown_84020C4
	ldrh r0, [r2]
	ldr r1, _080E6738 @ =0x0000ffff
	cmp r0, r1
	beq _080E6704
	mov r5, r9
	adds r6, r1, 0
	adds r4, r2, 0
_080E66F2:
	ldrh r0, [r4]
	ldrb r1, [r5]
	bl sub_80E64C0
	strb r0, [r5]
	adds r4, 0x2
	ldrh r0, [r4]
	cmp r0, r6
	bne _080E66F2
_080E6704:
	ldr r4, _080E672C @ =gStringVar1
	adds r0, r4, 0
	bl StringLength
	lsls r0, 16
	lsrs r7, r0, 16
	subs r0, r7, 0x1
	adds r0, r4
	movs r1, 0xFF
	strb r1, [r0]
	mov r1, r9
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _080E6740
	ldr r1, _080E673C @ =gUnknown_83FE860
	b _080E6742
	.align 2, 0
_080E6724: .4byte gPlayerParty
_080E6728: .4byte gSpecialVar_Result
_080E672C: .4byte gStringVar1
_080E6730: .4byte gSpecialVar_0x8004
_080E6734: .4byte gUnknown_84020C4
_080E6738: .4byte 0x0000ffff
_080E673C: .4byte gUnknown_83FE860
_080E6740:
	ldr r1, _080E674C @ =gUnknown_83FE864
_080E6742:
	adds r0, r4, 0
	bl StringAppend
	b _080E6770
	.align 2, 0
_080E674C: .4byte gUnknown_83FE864
_080E6750:
	ldr r1, _080E6780 @ =gSpecialVar_0x8004
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080E6784 @ =gSaveBlock2Ptr
	ldr r2, [r0]
	ldrb r0, [r5]
	ldr r1, _080E6788 @ =0x0000055c
	adds r2, r1
	movs r1, 0x1
	ands r1, r0
	ldrb r3, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_080E6770:
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E6780: .4byte gSpecialVar_0x8004
_080E6784: .4byte gSaveBlock2Ptr
_080E6788: .4byte 0x0000055c
	thumb_func_end sub_80E6648

	thumb_func_start sub_80E678C
sub_80E678C: @ 80E678C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0x12
	bl sub_80BD974
	lsls r0, 24
	cmp r0, 0
	beq _080E67E4
	ldr r5, _080E67E0 @ =gStringVar4
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x2
	movs r3, 0x3
	bl ConvertEasyChatWordsToString
	ldrb r0, [r5]
	movs r1, 0x1
	cmp r0, 0xFE
	beq _080E67C2
	adds r2, r5, 0
_080E67B8:
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r1, 0x1
	cmp r0, 0xFE
	bne _080E67B8
_080E67C2:
	ldr r2, _080E67E0 @ =gStringVar4
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r3, r2, 0
	cmp r0, 0xFE
	beq _080E67D8
_080E67CE:
	adds r1, 0x1
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0xFE
	bne _080E67CE
_080E67D8:
	adds r1, r3
	movs r0, 0xFA
	strb r0, [r1]
	b _080E67F0
	.align 2, 0
_080E67E0: .4byte gStringVar4
_080E67E4:
	ldr r0, _080E67F8 @ =gStringVar4
	adds r1, r4, 0
	movs r2, 0x3
	movs r3, 0x2
	bl ConvertEasyChatWordsToString
_080E67F0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E67F8: .4byte gStringVar4
	thumb_func_end sub_80E678C

	thumb_func_start sub_80E67FC
sub_80E67FC: @ 80E67FC
	push {lr}
	ldr r0, _080E6818 @ =gSaveBlock2Ptr
	ldr r2, [r0]
	ldr r1, _080E681C @ =0x0000056c
	adds r0, r2, r1
	ldrb r1, [r0]
	cmp r1, 0xC8
	bne _080E6820
	movs r1, 0x96
	lsls r1, 3
	adds r0, r2, r1
	bl sub_80E678C
	b _080E684C
	.align 2, 0
_080E6818: .4byte gSaveBlock2Ptr
_080E681C: .4byte 0x0000056c
_080E6820:
	cmp r1, 0x63
	bhi _080E683C
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E6838 @ =gUnknown_83FFACA
	adds r0, r1
	bl sub_80E678C
	b _080E684C
	.align 2, 0
_080E6838: .4byte gUnknown_83FFACA
_080E683C:
	ldrb r1, [r0]
	movs r0, 0xA4
	muls r0, r1
	adds r0, r2
	ldr r1, _080E6850 @ =0xffffc154
	adds r0, r1
	bl sub_80E678C
_080E684C:
	pop {r0}
	bx r0
	.align 2, 0
_080E6850: .4byte 0xffffc154
	thumb_func_end sub_80E67FC

	thumb_func_start sub_80E6854
sub_80E6854: @ 80E6854
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, _080E686C @ =gUnknown_203AAB8
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _080E6870
	cmp r0, 0x1
	ble _080E68B0
	cmp r0, 0x2
	beq _080E68AC
	b _080E68B0
	.align 2, 0
_080E686C: .4byte gUnknown_203AAB8
_080E6870:
	movs r5, 0
	ldr r6, _080E68A4 @ =gSaveBlock1Ptr
_080E6874:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	adds r1, r4, 0
	adds r1, 0x38
	ldr r0, [r6]
	adds r0, r1
	movs r1, 0xC
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	ldr r0, _080E68A8 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	adds r5, 0x1
	cmp r5, 0x5
	ble _080E6874
	b _080E68B0
	.align 2, 0
_080E68A4: .4byte gSaveBlock1Ptr
_080E68A8: .4byte gPlayerParty
_080E68AC:
	bl sub_80E7550
_080E68B0:
	ldr r0, _080E68C0 @ =CB2_ReturnToFieldContinueScriptPlayMapMusic
	bl SetMainCallback2
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E68C0: .4byte CB2_ReturnToFieldContinueScriptPlayMapMusic
	thumb_func_end sub_80E6854

	thumb_func_start sub_80E68C4
sub_80E68C4: @ 80E68C4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl BT_IsDone
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E68EC
	ldr r0, _080E68F4 @ =gMain
	ldr r1, _080E68F8 @ =sub_80E6854
	str r1, [r0, 0x8]
	bl CleanupOverworldWindowsAndTilemaps
	ldr r0, _080E68FC @ =sub_800FD9C
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_080E68EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E68F4: .4byte gMain
_080E68F8: .4byte sub_80E6854
_080E68FC: .4byte sub_800FD9C
	thumb_func_end sub_80E68C4

	thumb_func_start sub_80E6900
sub_80E6900: @ 80E6900
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, _080E691C @ =gUnknown_203AAB8
	ldr r1, _080E6920 @ =gSpecialVar_0x8004
	ldrh r1, [r1]
	strh r1, [r0]
	ldrh r2, [r0]
	cmp r2, 0x1
	beq _080E6944
	cmp r2, 0x1
	bgt _080E6924
	cmp r2, 0
	beq _080E692A
	b _080E69E6
	.align 2, 0
_080E691C: .4byte gUnknown_203AAB8
_080E6920: .4byte gSpecialVar_0x8004
_080E6924:
	cmp r2, 0x2
	beq _080E6998
	b _080E69E6
_080E692A:
	ldr r1, _080E693C @ =gBattleTypeFlags
	movs r0, 0x84
	lsls r0, 1
	str r0, [r1]
	ldr r0, _080E6940 @ =gTrainerBattleOpponent_A
	strh r2, [r0]
	bl sub_80E61DC
	b _080E6970
	.align 2, 0
_080E693C: .4byte gBattleTypeFlags
_080E6940: .4byte gTrainerBattleOpponent_A
_080E6944:
	movs r5, 0
	ldr r6, _080E698C @ =gSaveBlock1Ptr
_080E6948:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _080E6990 @ =gPlayerParty
	adds r0, r4, r0
	movs r1, 0xC
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r4, 0x38
	ldr r0, [r6]
	adds r0, r4
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	adds r5, 0x1
	cmp r5, 0x5
	ble _080E6948
_080E6970:
	ldr r0, _080E6994 @ =sub_80E68C4
	movs r1, 0x1
	bl CreateTask
	movs r0, 0
	bl PlayMapChosenOrBattleBGM
	bl sub_8080060
	lsls r0, 24
	lsrs r0, 24
	bl BT_StartOnField
	b _080E69E6
	.align 2, 0
_080E698C: .4byte gSaveBlock1Ptr
_080E6990: .4byte gPlayerParty
_080E6994: .4byte sub_80E68C4
_080E6998:
	bl ZeroEnemyPartyMons
	movs r5, 0
	ldr r4, _080E69F0 @ =gSaveBlock2Ptr
_080E69A0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E69F4 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2C
	adds r2, r5, 0
	muls r2, r1
	ldr r1, _080E69F8 @ =0x000004d4
	adds r2, r1
	ldr r1, [r4]
	adds r1, r2
	bl CreateBattleTowerMon
	adds r5, 0x1
	cmp r5, 0x2
	ble _080E69A0
	ldr r1, _080E69FC @ =gBattleTypeFlags
	ldr r0, _080E6A00 @ =0x00000808
	str r0, [r1]
	ldr r1, _080E6A04 @ =gTrainerBattleOpponent_A
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080E6A08 @ =sub_80E68C4
	movs r1, 0x1
	bl CreateTask
	movs r0, 0
	bl PlayMapChosenOrBattleBGM
	bl sub_8080060
	lsls r0, 24
	lsrs r0, 24
	bl BT_StartOnField
_080E69E6:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E69F0: .4byte gSaveBlock2Ptr
_080E69F4: .4byte gEnemyParty
_080E69F8: .4byte 0x000004d4
_080E69FC: .4byte gBattleTypeFlags
_080E6A00: .4byte 0x00000808
_080E6A04: .4byte gTrainerBattleOpponent_A
_080E6A08: .4byte sub_80E68C4
	thumb_func_end sub_80E6900

	thumb_func_start sub_80E6A0C
sub_80E6A0C: @ 80E6A0C
	push {r4-r6,lr}
	ldr r1, _080E6A34 @ =gSaveBlock2Ptr
	ldr r0, [r1]
	ldr r2, _080E6A38 @ =0x0000055c
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r5, r0, 31
	ldr r0, _080E6A3C @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	adds r6, r1, 0
	cmp r0, 0xE
	bls _080E6A28
	b _080E6C80
_080E6A28:
	lsls r0, 2
	ldr r1, _080E6A40 @ =_080E6A44
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E6A34: .4byte gSaveBlock2Ptr
_080E6A38: .4byte 0x0000055c
_080E6A3C: .4byte gSpecialVar_0x8004
_080E6A40: .4byte _080E6A44
	.align 2, 0
_080E6A44:
	.4byte _080E6A80
	.4byte _080E6AAC
	.4byte _080E6AD0
	.4byte _080E6AE4
	.4byte _080E6AFC
	.4byte _080E6B14
	.4byte _080E6B3C
	.4byte _080E6BA4
	.4byte _080E6BD8
	.4byte _080E6C80
	.4byte _080E6C00
	.4byte _080E6C14
	.4byte _080E6C30
	.4byte _080E6C4C
	.4byte _080E6C6C
_080E6A80:
	ldr r0, _080E6AA0 @ =gBattleStruct
	ldr r1, [r0]
	adds r1, 0xDA
	ldr r0, [r6]
	ldr r2, _080E6AA4 @ =0x0000055e
	adds r0, r2
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r2
	adds r0, r5
	ldr r1, _080E6AA8 @ =gSpecialVar_0x8005
	ldrh r1, [r1]
	strb r1, [r0]
	b _080E6C80
	.align 2, 0
_080E6AA0: .4byte gBattleStruct
_080E6AA4: .4byte 0x0000055e
_080E6AA8: .4byte gSpecialVar_0x8005
_080E6AAC:
	ldr r2, [r6]
	ldr r0, _080E6AC8 @ =gSpecialVar_0x8005
	ldrb r0, [r0]
	ldr r3, _080E6ACC @ =0x0000055c
	adds r2, r3
	movs r1, 0x1
	ands r1, r0
	ldrb r3, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	b _080E6C80
	.align 2, 0
_080E6AC8: .4byte gSpecialVar_0x8005
_080E6ACC: .4byte 0x0000055c
_080E6AD0:
	ldr r0, [r6]
	lsls r1, r5, 1
	movs r2, 0xAC
	lsls r2, 3
	adds r0, r2
	adds r0, r1
	ldr r1, _080E6AE0 @ =gSpecialVar_0x8005
	b _080E6BC6
	.align 2, 0
_080E6AE0: .4byte gSpecialVar_0x8005
_080E6AE4:
	ldr r0, [r6]
	lsls r1, r5, 1
	ldr r3, _080E6AF4 @ =0x00000564
	adds r0, r3
	adds r0, r1
	ldr r1, _080E6AF8 @ =gSpecialVar_0x8005
	b _080E6BC6
	.align 2, 0
_080E6AF4: .4byte 0x00000564
_080E6AF8: .4byte gSpecialVar_0x8005
_080E6AFC:
	ldr r0, [r6]
	ldr r1, _080E6B0C @ =gSpecialVar_0x8005
	ldrh r1, [r1]
	ldr r2, _080E6B10 @ =0x0000056c
	adds r0, r2
	strb r1, [r0]
	b _080E6C80
	.align 2, 0
_080E6B0C: .4byte gSpecialVar_0x8005
_080E6B10: .4byte 0x0000056c
_080E6B14:
	movs r2, 0
	ldr r5, _080E6B30 @ =gSaveBlock2Ptr
	ldr r4, _080E6B34 @ =0x0000056d
	ldr r3, _080E6B38 @ =gUnknown_203B0D4
_080E6B1C:
	ldr r0, [r5]
	adds r0, r4
	adds r0, r2
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x2
	ble _080E6B1C
	b _080E6C80
	.align 2, 0
_080E6B30: .4byte gSaveBlock2Ptr
_080E6B34: .4byte 0x0000056d
_080E6B38: .4byte gUnknown_203B0D4
_080E6B3C:
	ldr r1, [r6]
	ldr r3, _080E6B94 @ =0x0000056c
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0xC8
	bne _080E6B52
	movs r2, 0x94
	lsls r2, 3
	adds r0, r1, r2
	bl sub_80E7524
_080E6B52:
	ldr r0, [r6]
	movs r3, 0xAF
	lsls r3, 3
	adds r2, r0, r3
	ldrh r1, [r2]
	ldr r0, _080E6B98 @ =0x0000270e
	cmp r1, r0
	bhi _080E6B66
	adds r0, r1, 0x1
	strh r0, [r2]
_080E6B66:
	ldr r1, [r6]
	lsls r5, 1
	movs r4, 0xAC
	lsls r4, 3
	adds r1, r4
	adds r1, r5
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	bl sub_80E6E48
	ldr r1, _080E6B9C @ =gSpecialVar_Result
	ldr r0, [r6]
	adds r0, r4
	adds r0, r5
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080E6BA0 @ =gStringVar1
	adds r0, 0xA1
	strb r0, [r1]
	movs r0, 0xFF
	strb r0, [r1, 0x1]
	b _080E6C80
	.align 2, 0
_080E6B94: .4byte 0x0000056c
_080E6B98: .4byte 0x0000270e
_080E6B9C: .4byte gSpecialVar_Result
_080E6BA0: .4byte gStringVar1
_080E6BA4:
	ldr r0, [r6]
	lsls r5, 1
	ldr r4, _080E6BCC @ =0x00000564
	adds r0, r4
	adds r2, r0, r5
	ldrh r1, [r2]
	ldr r0, _080E6BD0 @ =0x00000595
	cmp r1, r0
	bhi _080E6BBA
	adds r0, r1, 0x1
	strh r0, [r2]
_080E6BBA:
	bl sub_80E6E48
	ldr r0, _080E6BD4 @ =gSpecialVar_Result
	ldr r1, [r6]
	adds r1, r4
	adds r1, r5
_080E6BC6:
	ldrh r1, [r1]
	strh r1, [r0]
	b _080E6C80
	.align 2, 0
_080E6BCC: .4byte 0x00000564
_080E6BD0: .4byte 0x00000595
_080E6BD4: .4byte gSpecialVar_Result
_080E6BD8:
	ldr r3, [r6]
	ldr r0, _080E6BF8 @ =gSpecialVar_0x8005
	ldrb r0, [r0]
	ldr r1, _080E6BFC @ =0x0000055c
	adds r3, r1
	movs r1, 0x1
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _080E6C80
	.align 2, 0
_080E6BF8: .4byte gSpecialVar_0x8005
_080E6BFC: .4byte 0x0000055c
_080E6C00:
	ldr r0, [r6]
	ldr r2, _080E6C10 @ =0x0000057a
	adds r0, r2
	ldrh r1, [r0]
	movs r0, 0x20
	bl SetGameStat
	b _080E6C80
	.align 2, 0
_080E6C10: .4byte 0x0000057a
_080E6C14:
	ldr r0, [r6]
	ldr r3, _080E6C2C @ =0x0000055e
	adds r0, r3
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _080E6C80
	adds r0, r5, 0
	bl sub_80E5A38
	b _080E6C80
	.align 2, 0
_080E6C2C: .4byte 0x0000055e
_080E6C30:
	ldr r1, [r6]
	ldr r0, _080E6C44 @ =0x0000055e
	adds r1, r0
	adds r1, r5
	ldr r0, _080E6C48 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xDA
	ldrb r0, [r0]
	b _080E6C7E
	.align 2, 0
_080E6C44: .4byte 0x0000055e
_080E6C48: .4byte gBattleStruct
_080E6C4C:
	adds r0, r5, 0
	bl sub_80E7188
	ldr r1, _080E6C64 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	lsls r2, r5, 1
	ldr r3, _080E6C68 @ =0x0000057c
	adds r1, r3
	adds r1, r2
	strh r0, [r1]
	b _080E6C80
	.align 2, 0
_080E6C64: .4byte gSaveBlock2Ptr
_080E6C68: .4byte 0x0000057c
_080E6C6C:
	ldr r1, [r6]
	ldr r2, _080E6C88 @ =0x0000055c
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	movs r3, 0xB0
	lsls r3, 3
	adds r1, r3
_080E6C7E:
	strb r0, [r1]
_080E6C80:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E6C88: .4byte 0x0000055c
	thumb_func_end sub_80E6A0C

	thumb_func_start sub_80E6C8C
sub_80E6C8C: @ 80E6C8C
	push {r4,lr}
	ldr r1, _080E6CB4 @ =gSaveBlock2Ptr
	ldr r0, [r1]
	ldr r2, _080E6CB8 @ =0x0000055c
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r4, r0, 31
	ldr r0, _080E6CBC @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	adds r3, r1, 0
	cmp r0, 0xE
	bls _080E6CA8
	b _080E6E08
_080E6CA8:
	lsls r0, 2
	ldr r1, _080E6CC0 @ =_080E6CC4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E6CB4: .4byte gSaveBlock2Ptr
_080E6CB8: .4byte 0x0000055c
_080E6CBC: .4byte gSpecialVar_0x8004
_080E6CC0: .4byte _080E6CC4
	.align 2, 0
_080E6CC4:
	.4byte _080E6D00
	.4byte _080E6D14
	.4byte _080E6D2C
	.4byte _080E6D3C
	.4byte _080E6D58
	.4byte _080E6E08
	.4byte _080E6E08
	.4byte _080E6E08
	.4byte _080E6D70
	.4byte _080E6D8C
	.4byte _080E6D9C
	.4byte _080E6DB0
	.4byte _080E6DB8
	.4byte _080E6DD4
	.4byte _080E6DF4
_080E6D00:
	ldr r0, _080E6D0C @ =gSpecialVar_Result
	ldr r1, [r3]
	ldr r3, _080E6D10 @ =0x0000055e
	adds r1, r3
	adds r1, r4
	b _080E6D60
	.align 2, 0
_080E6D0C: .4byte gSpecialVar_Result
_080E6D10: .4byte 0x0000055e
_080E6D14:
	ldr r0, _080E6D24 @ =gSpecialVar_Result
	ldr r1, [r3]
	ldr r2, _080E6D28 @ =0x0000055c
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 31
	b _080E6D7C
	.align 2, 0
_080E6D24: .4byte gSpecialVar_Result
_080E6D28: .4byte 0x0000055c
_080E6D2C:
	ldr r2, _080E6D38 @ =gSpecialVar_Result
	ldr r0, [r3]
	lsls r1, r4, 1
	movs r3, 0xAC
	lsls r3, 3
	b _080E6D44
	.align 2, 0
_080E6D38: .4byte gSpecialVar_Result
_080E6D3C:
	ldr r2, _080E6D50 @ =gSpecialVar_Result
	ldr r0, [r3]
	lsls r1, r4, 1
	ldr r3, _080E6D54 @ =0x00000564
_080E6D44:
	adds r0, r3
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _080E6E08
	.align 2, 0
_080E6D50: .4byte gSpecialVar_Result
_080E6D54: .4byte 0x00000564
_080E6D58:
	ldr r0, _080E6D68 @ =gSpecialVar_Result
	ldr r1, [r3]
	ldr r2, _080E6D6C @ =0x0000056c
	adds r1, r2
_080E6D60:
	ldrb r1, [r1]
	strh r1, [r0]
	b _080E6E08
	.align 2, 0
_080E6D68: .4byte gSpecialVar_Result
_080E6D6C: .4byte 0x0000056c
_080E6D70:
	ldr r0, _080E6D84 @ =gSpecialVar_Result
	ldr r1, [r3]
	ldr r3, _080E6D88 @ =0x0000055c
	adds r1, r3
	ldrb r1, [r1]
	lsls r1, 30
_080E6D7C:
	lsrs r1, 31
	strh r1, [r0]
	b _080E6E08
	.align 2, 0
_080E6D84: .4byte gSpecialVar_Result
_080E6D88: .4byte 0x0000055c
_080E6D8C:
	adds r0, r4, 0
	bl sub_80E7188
	ldr r1, _080E6D98 @ =gSpecialVar_Result
	strh r0, [r1]
	b _080E6E08
	.align 2, 0
_080E6D98: .4byte gSpecialVar_Result
_080E6D9C:
	ldr r0, [r3]
	ldr r1, _080E6DAC @ =0x0000057a
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x20
	bl SetGameStat
	b _080E6E08
	.align 2, 0
_080E6DAC: .4byte 0x0000057a
_080E6DB0:
	adds r0, r4, 0
	bl sub_80E5A38
	b _080E6E08
_080E6DB8:
	ldr r1, [r3]
	ldr r2, _080E6DCC @ =0x0000055e
	adds r1, r2
	adds r1, r4
	ldr r0, _080E6DD0 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xDA
	ldrb r0, [r0]
	b _080E6E06
	.align 2, 0
_080E6DCC: .4byte 0x0000055e
_080E6DD0: .4byte gBattleStruct
_080E6DD4:
	adds r0, r4, 0
	bl sub_80E7188
	ldr r1, _080E6DEC @ =gSaveBlock2Ptr
	ldr r1, [r1]
	lsls r2, r4, 1
	ldr r3, _080E6DF0 @ =0x0000057c
	adds r1, r3
	adds r1, r2
	strh r0, [r1]
	b _080E6E08
	.align 2, 0
_080E6DEC: .4byte gSaveBlock2Ptr
_080E6DF0: .4byte 0x0000057c
_080E6DF4:
	ldr r1, [r3]
	ldr r2, _080E6E10 @ =0x0000055c
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	movs r3, 0xB0
	lsls r3, 3
	adds r1, r3
_080E6E06:
	strb r0, [r1]
_080E6E08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E6E10: .4byte 0x0000055c
	thumb_func_end sub_80E6C8C

	thumb_func_start sub_80E6E14
sub_80E6E14: @ 80E6E14
	push {r4,r5,lr}
	movs r2, 0
	ldr r5, _080E6E3C @ =gUnknown_203B0D4
	ldr r4, _080E6E40 @ =gSaveBlock2Ptr
	ldr r3, _080E6E44 @ =0x0000056d
_080E6E1E:
	adds r0, r2, r5
	ldr r1, [r4]
	adds r1, r3
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x2
	ble _080E6E1E
	bl sub_80A03D8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E6E3C: .4byte gUnknown_203B0D4
_080E6E40: .4byte gSaveBlock2Ptr
_080E6E44: .4byte 0x0000056d
	thumb_func_end sub_80E6E14

	thumb_func_start sub_80E6E48
sub_80E6E48: @ 80E6E48
	push {r4-r6,lr}
	ldr r6, _080E6E98 @ =gSaveBlock2Ptr
	ldr r0, [r6]
	ldr r1, _080E6E9C @ =0x0000055c
	adds r0, r1
	ldrb r4, [r0]
	lsls r4, 31
	lsrs r4, 31
	adds r0, r4, 0
	bl sub_80E7188
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, [r6]
	lsls r4, 1
	movs r2, 0xAD
	lsls r2, 3
	adds r0, r2
	adds r1, r0, r4
	ldrh r0, [r1]
	cmp r0, r5
	bcs _080E6E76
	strh r5, [r1]
_080E6E76:
	ldr r0, [r6]
	adds r2, r0, r2
	ldr r3, _080E6EA0 @ =0x0000056a
	adds r1, r0, r3
	ldrh r0, [r2]
	ldrh r3, [r1]
	cmp r0, r3
	bls _080E6EA8
	adds r5, r0, 0
	movs r0, 0x20
	adds r1, r5, 0
	bl SetGameStat
	ldr r1, _080E6EA4 @ =0x0000270f
	cmp r5, r1
	bhi _080E6EB8
	b _080E6ECC
	.align 2, 0
_080E6E98: .4byte gSaveBlock2Ptr
_080E6E9C: .4byte 0x0000055c
_080E6EA0: .4byte 0x0000056a
_080E6EA4: .4byte 0x0000270f
_080E6EA8:
	ldrh r5, [r1]
	movs r0, 0x20
	adds r1, r5, 0
	bl SetGameStat
	ldr r1, _080E6EC4 @ =0x0000270f
	cmp r5, r1
	bls _080E6ECC
_080E6EB8:
	ldr r0, [r6]
	ldr r2, _080E6EC8 @ =0x0000057a
	adds r0, r2
	strh r1, [r0]
	b _080E6ED4
	.align 2, 0
_080E6EC4: .4byte 0x0000270f
_080E6EC8: .4byte 0x0000057a
_080E6ECC:
	ldr r0, [r6]
	ldr r3, _080E6EDC @ =0x0000057a
	adds r0, r3
	strh r5, [r0]
_080E6ED4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E6EDC: .4byte 0x0000057a
	thumb_func_end sub_80E6E48

	thumb_func_start sub_80E6EE0
sub_80E6EE0: @ 80E6EE0
	push {r4-r6,lr}
	ldr r0, _080E6F00 @ =gSaveBlock2Ptr
	ldr r2, [r0]
	adds r5, r2, 0
	adds r5, 0xB0
	ldr r1, _080E6F04 @ =0x0000055c
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r6, r0, 31
	ldrb r0, [r2, 0x8]
	cmp r0, 0
	beq _080E6F0C
	ldr r4, _080E6F08 @ =gUnknown_84020C4
	b _080E6F0E
	.align 2, 0
_080E6F00: .4byte gSaveBlock2Ptr
_080E6F04: .4byte 0x0000055c
_080E6F08: .4byte gUnknown_84020C4
_080E6F0C:
	ldr r4, _080E6FA0 @ =gUnknown_84020C4
_080E6F0E:
	ldrb r0, [r2, 0xA]
	ldrb r1, [r2, 0xB]
	adds r0, r1
	ldrb r1, [r2, 0xC]
	adds r0, r1
	ldrb r1, [r2, 0xD]
	adds r0, r1
	movs r1, 0
	bl __umodsi3
	adds r0, r4
	ldrb r0, [r0]
	strb r6, [r5]
	strb r0, [r5, 0x1]
	adds r0, r5, 0
	adds r0, 0xC
	ldr r4, _080E6FA4 @ =gSaveBlock2Ptr
	ldr r1, [r4]
	adds r1, 0xA
	bl CopyTrainerId
	adds r0, r5, 0x4
	ldr r1, [r4]
	bl StringCopy7
	adds r0, r6, 0
	bl sub_80E7188
	strh r0, [r5, 0x2]
	movs r4, 0
	ldr r6, _080E6FA8 @ =gSaveBlock1Ptr
	ldr r3, _080E6FAC @ =0x00002cac
	adds r2, r5, 0
	adds r2, 0x10
_080E6F52:
	lsls r0, r4, 1
	ldr r1, [r6]
	adds r1, r3
	adds r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, 0x2
	adds r4, 0x1
	cmp r4, 0x5
	ble _080E6F52
	movs r4, 0
_080E6F68:
	ldr r6, _080E6FA4 @ =gSaveBlock2Ptr
	ldr r0, [r6]
	ldr r1, _080E6FB0 @ =0x0000056d
	adds r0, r1
	adds r0, r4
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E6FB4 @ =gUnknown_2024220
	adds r0, r1
	movs r1, 0x2C
	muls r1, r4
	adds r1, 0x1C
	adds r1, r5, r1
	bl sub_803E23C
	adds r4, 0x1
	cmp r4, 0x2
	ble _080E6F68
	ldr r0, [r6]
	adds r0, 0xB0
	bl SetBattleTowerRecordChecksum
	bl sub_80E6E48
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E6FA0: .4byte gUnknown_84020C4
_080E6FA4: .4byte gSaveBlock2Ptr
_080E6FA8: .4byte gSaveBlock1Ptr
_080E6FAC: .4byte 0x00002cac
_080E6FB0: .4byte 0x0000056d
_080E6FB4: .4byte gUnknown_2024220
	thumb_func_end sub_80E6EE0

	thumb_func_start sub_80E6FB8
sub_80E6FB8: @ 80E6FB8
	push {r4,r5,lr}
	ldr r0, _080E703C @ =gSaveBlock2Ptr
	ldr r1, [r0]
	ldr r2, _080E7040 @ =0x0000055c
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r5, r0, 31
	ldr r0, _080E7044 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x3
	beq _080E6FD4
	cmp r0, 0
	bne _080E6FF2
_080E6FD4:
	lsls r2, r5, 1
	ldr r3, _080E7048 @ =0x00000564
	adds r0, r1, r3
	adds r0, r2
	ldrh r0, [r0]
	cmp r0, 0x1
	bhi _080E6FEE
	subs r3, 0x4
	adds r0, r1, r3
	adds r0, r2
	ldrh r0, [r0]
	cmp r0, 0x1
	bls _080E6FF2
_080E6FEE:
	bl sub_80E6EE0
_080E6FF2:
	bl sub_80E712C
	ldr r4, _080E703C @ =gSaveBlock2Ptr
	ldr r0, [r4]
	ldr r1, _080E704C @ =gBattleOutcome
	ldrb r1, [r1]
	ldr r2, _080E7050 @ =0x0000055d
	adds r0, r2
	strb r1, [r0]
	ldr r0, _080E7044 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	cmp r1, 0x3
	beq _080E7016
	ldr r0, [r4]
	ldr r3, _080E7054 @ =0x0000055e
	adds r0, r3
	adds r0, r5
	strb r1, [r0]
_080E7016:
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0
	bl VarSet
	ldr r1, [r4]
	ldr r0, _080E7040 @ =0x0000055c
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1]
	movs r0, 0x2
	bl TrySavingData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E703C: .4byte gSaveBlock2Ptr
_080E7040: .4byte 0x0000055c
_080E7044: .4byte gSpecialVar_0x8004
_080E7048: .4byte 0x00000564
_080E704C: .4byte gBattleOutcome
_080E7050: .4byte 0x0000055d
_080E7054: .4byte 0x0000055e
	thumb_func_end sub_80E6FB8

	thumb_func_start sub_80E7058
sub_80E7058: @ 80E7058
	push {lr}
	bl DoSoftReset
	pop {r0}
	bx r0
	thumb_func_end sub_80E7058

	thumb_func_start sub_80E7064
sub_80E7064: @ 80E7064
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _080E70F0 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	movs r3, 0
	movs r2, 0
	adds r1, r0, 0
	adds r1, 0xB0
_080E7076:
	ldm r1!, {r0}
	adds r3, r0
	adds r2, 0x1
	cmp r2, 0x27
	bls _080E7076
	ldr r5, _080E70F0 @ =gSaveBlock2Ptr
	ldr r1, [r5]
	movs r2, 0xA8
	lsls r2, 1
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, r3
	beq _080E7098
	adds r0, r1, 0
	adds r0, 0xB0
	bl ClearBattleTowerRecord
_080E7098:
	movs r4, 0
	adds r7, r5, 0
	movs r6, 0xA4
	mov r8, r7
_080E70A0:
	adds r0, r4, 0
	muls r0, r6
	movs r3, 0xAA
	lsls r3, 1
	adds r0, r3
	ldr r1, [r7]
	movs r3, 0
	movs r2, 0
	adds r5, r4, 0x1
	adds r1, r0
_080E70B4:
	ldm r1!, {r0}
	adds r3, r0
	adds r2, 0x1
	cmp r2, 0x27
	bls _080E70B4
	mov r0, r8
	ldr r2, [r0]
	adds r1, r4, 0
	muls r1, r6
	movs r4, 0xFA
	lsls r4, 1
	adds r0, r2, r4
	adds r0, r1
	ldr r0, [r0]
	cmp r0, r3
	beq _080E70E0
	movs r3, 0xAA
	lsls r3, 1
	adds r0, r1, r3
	adds r0, r2, r0
	bl ClearBattleTowerRecord
_080E70E0:
	adds r4, r5, 0
	cmp r4, 0x4
	ble _080E70A0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E70F0: .4byte gSaveBlock2Ptr
	thumb_func_end sub_80E7064

	thumb_func_start SetBattleTowerRecordChecksum
SetBattleTowerRecordChecksum: @ 80E70F4
	push {r4,lr}
	adds r2, r0, 0
	adds r2, 0xA0
	movs r1, 0
	str r1, [r2]
	movs r3, 0
	adds r4, r0, 0
_080E7102:
	ldr r0, [r2]
	ldm r4!, {r1}
	adds r0, r1
	str r0, [r2]
	adds r3, 0x1
	cmp r3, 0x27
	bls _080E7102
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SetBattleTowerRecordChecksum

	thumb_func_start ClearBattleTowerRecord
ClearBattleTowerRecord: @ 80E7118
	push {lr}
	movs r1, 0
	movs r2, 0
_080E711E:
	stm r0!, {r2}
	adds r1, 0x1
	cmp r1, 0x28
	bls _080E711E
	pop {r0}
	bx r0
	thumb_func_end ClearBattleTowerRecord

	thumb_func_start sub_80E712C
sub_80E712C: @ 80E712C
	push {r4,r5,lr}
	ldr r4, _080E7174 @ =gSaveBlock2Ptr
	ldr r0, [r4]
	ldr r1, _080E7178 @ =0x0000048c
	adds r0, r1
	bl sub_80E6150
	ldr r1, [r4]
	ldr r3, _080E717C @ =gBattleMons
	adds r0, r3, 0
	adds r0, 0x58
	ldrh r2, [r0]
	ldr r5, _080E7180 @ =0x0000048a
	adds r0, r1, r5
	strh r2, [r0]
	ldrh r0, [r3]
	movs r2, 0x91
	lsls r2, 3
	adds r1, r2
	strh r0, [r1]
	movs r2, 0
	adds r5, r4, 0
	ldr r4, _080E7184 @ =0x00000494
	adds r3, 0x30
_080E715C:
	ldr r0, [r5]
	adds r0, r4
	adds r0, r2
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x9
	ble _080E715C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E7174: .4byte gSaveBlock2Ptr
_080E7178: .4byte 0x0000048c
_080E717C: .4byte gBattleMons
_080E7180: .4byte 0x0000048a
_080E7184: .4byte 0x00000494
	thumb_func_end sub_80E712C

	thumb_func_start sub_80E7188
sub_80E7188: @ 80E7188
	push {lr}
	lsls r0, 24
	ldr r1, _080E71C0 @ =gSaveBlock2Ptr
	ldr r3, [r1]
	lsrs r0, 23
	ldr r2, _080E71C4 @ =0x00000564
	adds r1, r3, r2
	adds r1, r0
	ldrh r2, [r1]
	subs r2, 0x1
	lsls r1, r2, 3
	subs r1, r2
	movs r2, 0xAC
	lsls r2, 3
	adds r3, r2
	adds r3, r0
	ldr r0, _080E71C8 @ =0x0000ffff
	adds r1, r0
	ldrh r3, [r3]
	adds r1, r3
	lsls r1, 16
	lsrs r0, r1, 16
	ldr r1, _080E71CC @ =0x0000270f
	cmp r0, r1
	bls _080E71BC
	adds r0, r1, 0
_080E71BC:
	pop {r1}
	bx r1
	.align 2, 0
_080E71C0: .4byte gSaveBlock2Ptr
_080E71C4: .4byte 0x00000564
_080E71C8: .4byte 0x0000ffff
_080E71CC: .4byte 0x0000270f
	thumb_func_end sub_80E7188

	thumb_func_start sub_80E71D0
sub_80E71D0: @ 80E71D0
	push {r4,r5,lr}
	ldr r4, _080E7214 @ =gSaveBlock2Ptr
	ldr r1, [r4]
	ldr r2, _080E7218 @ =0x0000055c
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	lsls r0, 1
	adds r2, 0x8
	adds r1, r2
	adds r1, r0
	ldrh r0, [r1]
	subs r0, 0x1
	cmp r0, 0x5
	ble _080E7220
	bl Random
	ldr r4, [r4]
	ldr r5, _080E721C @ =gUnknown_84020E6
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x9
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 15
	adds r0, r5
	ldrh r0, [r0]
	movs r1, 0xAE
	lsls r1, 3
	adds r4, r1
	b _080E7240
	.align 2, 0
_080E7214: .4byte gSaveBlock2Ptr
_080E7218: .4byte 0x0000055c
_080E721C: .4byte gUnknown_84020E6
_080E7220:
	bl Random
	ldr r4, [r4]
	ldr r5, _080E7248 @ =gUnknown_84020DA
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 15
	adds r0, r5
	ldrh r0, [r0]
	movs r2, 0xAE
	lsls r2, 3
	adds r4, r2
_080E7240:
	strh r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E7248: .4byte gUnknown_84020DA
	thumb_func_end sub_80E71D0

	thumb_func_start sub_80E724C
sub_80E724C: @ 80E724C
	push {r4-r6,lr}
	ldr r5, _080E7288 @ =gSaveBlock2Ptr
	ldr r1, [r5]
	ldr r2, _080E728C @ =0x0000055c
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r6, r0, 31
	movs r0, 0xAE
	lsls r0, 3
	adds r1, r0
	ldrh r0, [r1]
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _080E7298
	ldr r0, [r5]
	movs r1, 0xAE
	lsls r1, 3
	adds r0, r1
	ldrh r0, [r0]
	ldr r1, _080E7290 @ =gStringVar1
	bl CopyItemName
	ldr r0, _080E7294 @ =gSpecialVar_Result
	strh r4, [r0]
	b _080E72AA
	.align 2, 0
_080E7288: .4byte gSaveBlock2Ptr
_080E728C: .4byte 0x0000055c
_080E7290: .4byte gStringVar1
_080E7294: .4byte gSpecialVar_Result
_080E7298:
	ldr r1, _080E72B0 @ =gSpecialVar_Result
	movs r0, 0
	strh r0, [r1]
	ldr r0, [r5]
	ldr r2, _080E72B4 @ =0x0000055e
	adds r0, r2
	adds r0, r6
	movs r1, 0x6
	strb r1, [r0]
_080E72AA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E72B0: .4byte gSpecialVar_Result
_080E72B4: .4byte 0x0000055e
	thumb_func_end sub_80E724C

	thumb_func_start sub_80E72B8
sub_80E72B8: @ 80E72B8
	push {r4-r7,lr}
	ldr r0, _080E7334 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, _080E7338 @ =0x0000055c
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r0, 0
	movs r7, 0x44
	cmp r1, 0
	beq _080E72D2
	movs r7, 0x45
_080E72D2:
	ldr r4, _080E733C @ =gSpecialVar_Result
	movs r0, 0
	strh r0, [r4]
	adds r0, r1, 0
	bl sub_80E7188
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x37
	bls _080E7320
	movs r5, 0
	adds r6, r4, 0
_080E72EA:
	ldr r0, _080E7334 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, _080E7340 @ =0x0000056d
	adds r0, r1
	adds r0, r5
	ldrb r0, [r0]
	subs r0, 0x1
	movs r1, 0x64
	muls r1, r0
	ldr r0, _080E7344 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	adds r1, r7, 0
	bl GetMonData
	cmp r0, 0
	bne _080E731A
	movs r0, 0x1
	strh r0, [r6]
	adds r0, r4, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl SetMonData
_080E731A:
	adds r5, 0x1
	cmp r5, 0x2
	ble _080E72EA
_080E7320:
	ldr r0, _080E733C @ =gSpecialVar_Result
	ldrh r0, [r0]
	cmp r0, 0
	beq _080E732E
	movs r0, 0x2A
	bl IncrementGameStat
_080E732E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E7334: .4byte gSaveBlock2Ptr
_080E7338: .4byte 0x0000055c
_080E733C: .4byte gSpecialVar_Result
_080E7340: .4byte 0x0000056d
_080E7344: .4byte gPlayerParty
	thumb_func_end sub_80E72B8

	thumb_func_start sub_80E7348
sub_80E7348: @ 80E7348
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r1, _080E7368 @ =gSaveBlock2Ptr
	ldr r2, [r1]
	movs r0, 0x94
	lsls r0, 3
	adds r7, r2, r0
	ldrb r0, [r2, 0x8]
	adds r5, r1, 0
	cmp r0, 0
	beq _080E7370
	ldr r4, _080E736C @ =gUnknown_84020C4
	b _080E7372
	.align 2, 0
_080E7368: .4byte gSaveBlock2Ptr
_080E736C: .4byte gUnknown_84020C4
_080E7370:
	ldr r4, _080E7410 @ =gUnknown_84020C4
_080E7372:
	ldrb r0, [r2, 0xA]
	ldrb r1, [r2, 0xB]
	adds r0, r1
	ldrb r1, [r2, 0xC]
	adds r0, r1
	ldrb r1, [r2, 0xD]
	adds r0, r1
	movs r1, 0
	bl __umodsi3
	adds r0, r4
	ldrb r0, [r0]
	strb r0, [r7, 0x1]
	adds r0, r7, 0
	adds r0, 0xC
	ldr r1, [r5]
	adds r1, 0xA
	bl CopyTrainerId
	adds r0, r7, 0x4
	ldr r1, [r5]
	bl StringCopy7
	movs r0, 0x1
	strh r0, [r7, 0x2]
	movs r6, 0x7
	movs r4, 0
	ldr r0, _080E7414 @ =gSaveBlock1Ptr
	mov r8, r0
	adds r5, r7, 0
	adds r5, 0x10
	ldr r1, _080E7418 @ =0x00002cac
	mov r12, r1
	adds r3, r7, 0
	adds r3, 0x28
	adds r2, r7, 0
	adds r2, 0x1C
_080E73BC:
	lsls r0, r4, 1
	mov r9, r0
	mov r1, r8
	ldr r0, [r1]
	add r0, r12
	add r0, r9
	ldrh r0, [r0]
	strh r0, [r5]
	strh r6, [r2]
	adds r0, r6, 0x6
	strh r0, [r3]
	adds r6, 0x1
	adds r5, 0x2
	adds r3, 0x2
	adds r2, 0x2
	adds r4, 0x1
	cmp r4, 0x5
	ble _080E73BC
	movs r4, 0
_080E73E2:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _080E741C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2C
	muls r1, r4
	adds r1, 0x34
	adds r1, r7, r1
	bl sub_803E23C
	adds r4, 0x1
	cmp r4, 0x2
	ble _080E73E2
	adds r0, r7, 0
	bl sub_80E7500
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E7410: .4byte gUnknown_84020C4
_080E7414: .4byte gSaveBlock1Ptr
_080E7418: .4byte 0x00002cac
_080E741C: .4byte gPlayerParty
	thumb_func_end sub_80E7348

	thumb_func_start GetEreaderTrainerFrontSpriteId
GetEreaderTrainerFrontSpriteId: @ 80E7420
	ldr r1, _080E7434 @ =gFacilityClassToPicIndex
	ldr r0, _080E7438 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r2, _080E743C @ =0x000004a1
	adds r0, r2
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080E7434: .4byte gFacilityClassToPicIndex
_080E7438: .4byte gSaveBlock2Ptr
_080E743C: .4byte 0x000004a1
	thumb_func_end GetEreaderTrainerFrontSpriteId

	thumb_func_start GetEreaderTrainerClassId
GetEreaderTrainerClassId: @ 80E7440
	ldr r1, _080E7454 @ =gFacilityClassToTrainerClass
	ldr r0, _080E7458 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r2, _080E745C @ =0x000004a1
	adds r0, r2
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080E7454: .4byte gFacilityClassToTrainerClass
_080E7458: .4byte gSaveBlock2Ptr
_080E745C: .4byte 0x000004a1
	thumb_func_end GetEreaderTrainerClassId

	thumb_func_start sub_80E7460
sub_80E7460: @ 80E7460
	push {r4,lr}
	adds r3, r0, 0
	movs r2, 0
	ldr r0, _080E7488 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, _080E748C @ =0x000004a4
	adds r4, r0, r1
_080E746E:
	adds r0, r3, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x4
	ble _080E746E
	adds r1, r3, r2
	movs r0, 0xFF
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E7488: .4byte gSaveBlock2Ptr
_080E748C: .4byte 0x000004a4
	thumb_func_end sub_80E7460

	thumb_func_start ValidateEReaderTrainer
ValidateEReaderTrainer: @ 80E7490
	push {r4-r6,lr}
	ldr r2, _080E74C0 @ =gSpecialVar_Result
	movs r0, 0
	strh r0, [r2]
	ldr r1, _080E74C4 @ =gSaveBlock2Ptr
	ldr r0, [r1]
	movs r3, 0x94
	lsls r3, 3
	adds r5, r0, r3
	movs r4, 0
	movs r3, 0
	adds r6, r1, 0
	adds r1, r5, 0
_080E74AA:
	ldm r1!, {r0}
	orrs r4, r0
	adds r3, 0x1
	cmp r3, 0x2D
	bls _080E74AA
	cmp r4, 0
	bne _080E74C8
	movs r0, 0x1
	strh r0, [r2]
	b _080E74F6
	.align 2, 0
_080E74C0: .4byte gSpecialVar_Result
_080E74C4: .4byte gSaveBlock2Ptr
_080E74C8:
	movs r4, 0
	movs r3, 0
	adds r2, r5, 0
_080E74CE:
	ldm r2!, {r0}
	adds r4, r0
	adds r3, 0x1
	cmp r3, 0x2D
	bls _080E74CE
	ldr r1, [r6]
	movs r2, 0xAB
	lsls r2, 3
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, r4
	beq _080E74F6
	movs r3, 0x94
	lsls r3, 3
	adds r0, r1, r3
	bl sub_80E7524
	ldr r1, _080E74FC @ =gSpecialVar_Result
	movs r0, 0x1
	strh r0, [r1]
_080E74F6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E74FC: .4byte gSpecialVar_Result
	thumb_func_end ValidateEReaderTrainer

	thumb_func_start sub_80E7500
sub_80E7500: @ 80E7500
	push {r4,lr}
	adds r2, r0, 0
	adds r2, 0xB8
	movs r1, 0
	str r1, [r2]
	movs r3, 0
	adds r4, r0, 0
_080E750E:
	ldr r0, [r2]
	ldm r4!, {r1}
	adds r0, r1
	str r0, [r2]
	adds r3, 0x1
	cmp r3, 0x2D
	bls _080E750E
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E7500

	thumb_func_start sub_80E7524
sub_80E7524: @ 80E7524
	push {lr}
	movs r1, 0
	movs r2, 0
_080E752A:
	stm r0!, {r2}
	adds r1, 0x1
	cmp r1, 0x2E
	bls _080E752A
	pop {r0}
	bx r0
	thumb_func_end sub_80E7524

	thumb_func_start sub_80E7538
sub_80E7538: @ 80E7538
	push {lr}
	ldr r0, _080E754C @ =gSaveBlock2Ptr
	ldr r0, [r0]
	movs r1, 0x96
	lsls r1, 3
	adds r0, r1
	bl sub_80E678C
	pop {r0}
	bx r0
	.align 2, 0
_080E754C: .4byte gSaveBlock2Ptr
	thumb_func_end sub_80E7538

	thumb_func_start sub_80E7550
sub_80E7550: @ 80E7550
	push {lr}
	ldr r0, _080E7564 @ =gBattleOutcome
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _080E756C
	ldr r1, _080E7568 @ =gStringVar4
	movs r0, 0xFF
	strb r0, [r1]
	b _080E7590
	.align 2, 0
_080E7564: .4byte gBattleOutcome
_080E7568: .4byte gStringVar4
_080E756C:
	cmp r0, 0x1
	bne _080E7584
	ldr r0, _080E7580 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	movs r1, 0x99
	lsls r1, 3
	adds r0, r1
	bl sub_80E678C
	b _080E7590
	.align 2, 0
_080E7580: .4byte gSaveBlock2Ptr
_080E7584:
	ldr r0, _080E7594 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, _080E7598 @ =0x000004bc
	adds r0, r1
	bl sub_80E678C
_080E7590:
	pop {r0}
	bx r0
	.align 2, 0
_080E7594: .4byte gSaveBlock2Ptr
_080E7598: .4byte 0x000004bc
	thumb_func_end sub_80E7550

	thumb_func_start sub_80E759C
sub_80E759C: @ 80E759C
	push {lr}
	movs r0, 0x1
_080E75A0:
	subs r0, 0x1
	cmp r0, 0
	bge _080E75A0
	pop {r0}
	bx r0
	thumb_func_end sub_80E759C

	.align 2, 0 @ Don't pad with nop.
