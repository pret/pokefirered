	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_812C224
sub_812C224: @ 812C224
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	ldr r4, _0812C2B8 @ =gBattleTypeFlags
	ldr r0, [r4]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0812C31C
	movs r0, 0x18
	bl Alloc
	adds r5, r0, 0
	ldr r0, _0812C2BC @ =gUnknown_2023E8A
	ldrb r0, [r0]
	subs r0, 0x1
	strb r0, [r5]
	ldr r1, [r4]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0812C2C4
	movs r0, 0xF
	mov r8, r0
	add r4, sp, 0x4
	mov r0, sp
	adds r1, r4, 0
	bl sub_812C334
	movs r3, 0
	mov r9, r4
	adds r1, r5, 0x1
	mov r12, r1
	adds r7, r5, 0
	adds r7, 0x8
	adds r6, r5, 0
	adds r6, 0xF
	ldr r4, _0812C2C0 @ =gUnknown_2022744
_0812C274:
	mov r0, r12
	adds r2, r0, r3
	ldr r1, [sp]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3, r0
	adds r0, r4
	ldrb r0, [r0]
	strb r0, [r2]
	adds r2, r7, r3
	ldr r1, [sp, 0x4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3, r0
	adds r0, r4
	ldrb r0, [r0]
	strb r0, [r2]
	adds r2, r6, r3
	mov r0, r9
	ldr r1, [r0, 0x4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3, r0
	adds r0, r4
	ldrb r0, [r0]
	strb r0, [r2]
	adds r3, 0x1
	cmp r3, 0x6
	ble _0812C274
	b _0812C30E
	.align 2, 0
_0812C2B8: .4byte gBattleTypeFlags
_0812C2BC: .4byte gUnknown_2023E8A
_0812C2C0: .4byte gUnknown_2022744
_0812C2C4:
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _0812C2D2
	movs r1, 0xE
	mov r8, r1
	b _0812C2E2
_0812C2D2:
	bl InUnionRoom
	movs r1, 0xD
	mov r8, r1
	cmp r0, 0x1
	bne _0812C2E2
	movs r0, 0x13
	mov r8, r0
_0812C2E2:
	movs r3, 0
	adds r4, r5, 0x1
	ldr r1, _0812C32C @ =gUnknown_2022744
	mov r12, r1
	ldr r7, _0812C330 @ =gBattleStruct
	movs r6, 0x1
_0812C2EE:
	adds r2, r4, r3
	ldr r0, [r7]
	adds r0, 0xB5
	ldrb r0, [r0]
	adds r1, r6, 0
	eors r1, r0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3, r0
	add r0, r12
	ldrb r0, [r0]
	strb r0, [r2]
	adds r3, 0x1
	cmp r3, 0x6
	ble _0812C2EE
_0812C30E:
	mov r0, r8
	adds r1, r5, 0
	bl sub_8113550
	adds r0, r5, 0
	bl Free
_0812C31C:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812C32C: .4byte gUnknown_2022744
_0812C330: .4byte gBattleStruct
	thumb_func_end sub_812C224

	thumb_func_start sub_812C334
sub_812C334: @ 812C334
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r3, _0812C35C @ =gLinkPlayers
	ldr r4, _0812C360 @ =gBattleStruct
	ldr r0, [r4]
	adds r0, 0xB5
	ldrb r2, [r0]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0, 0x18]
	movs r0, 0x2
	movs r5, 0
	eors r2, r0
_0812C352:
	ldrh r0, [r3, 0x18]
	cmp r2, r0
	bne _0812C364
	str r5, [r6]
	b _0812C370
	.align 2, 0
_0812C35C: .4byte gLinkPlayers
_0812C360: .4byte gBattleStruct
_0812C364:
	ldr r0, [r4]
	adds r0, 0xB5
	ldrb r0, [r0]
	cmp r5, r0
	beq _0812C370
	stm r1!, {r5}
_0812C370:
	adds r3, 0x1C
	adds r5, 0x1
	cmp r5, 0x3
	ble _0812C352
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_812C334

	.align 2, 0 @ Don't pad with nop.
