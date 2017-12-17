	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_812BFDC
sub_812BFDC: @ 812BFDC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, _0812C03C @ =gUnknown_2022B4C
	ldr r0, [r4]
	ldr r1, _0812C040 @ =0x00010202
	ands r0, r1
	cmp r0, 0
	beq _0812BFF4
	b _0812C212
_0812BFF4:
	ldr r5, _0812C044 @ =gUnknown_2023E8A
	ldrb r0, [r5]
	cmp r0, 0x1
	beq _0812C002
	cmp r0, 0x7
	beq _0812C002
	b _0812C212
_0812C002:
	movs r0, 0x8
	bl sub_8002B9C
	adds r7, r0, 0
	movs r0, 0x8
	bl sub_8002B9C
	mov r9, r0
	ldr r4, [r4]
	movs r0, 0x8
	ands r4, r0
	cmp r4, 0
	bne _0812C01E
	b _0812C1CC
_0812C01E:
	ldr r3, _0812C048 @ =gUnknown_823EAC8
	ldr r2, _0812C04C @ =gUnknown_20386AE
	ldrh r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	ldrb r1, [r0, 0x1]
	cmp r1, 0x57
	beq _0812C060
	cmp r1, 0x57
	bgt _0812C050
	cmp r1, 0x54
	beq _0812C056
	b _0812C066
	.align 2, 0
_0812C03C: .4byte gUnknown_2022B4C
_0812C040: .4byte 0x00010202
_0812C044: .4byte gUnknown_2023E8A
_0812C048: .4byte gUnknown_823EAC8
_0812C04C: .4byte gUnknown_20386AE
_0812C050:
	cmp r1, 0x5A
	beq _0812C05C
	b _0812C066
_0812C056:
	movs r0, 0x1E
	mov r10, r0
	b _0812C06A
_0812C05C:
	movs r1, 0x21
	b _0812C068
_0812C060:
	movs r0, 0x20
	mov r10, r0
	b _0812C06A
_0812C066:
	movs r1, 0x22
_0812C068:
	mov r10, r1
_0812C06A:
	ldrh r0, [r2]
	strh r0, [r7]
	ldr r0, _0812C0AC @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0812C150
	ldr r0, _0812C0B0 @ =gUnknown_3004F90
	ldrh r0, [r0, 0x20]
	strh r0, [r7, 0x2]
	ldr r4, _0812C0B4 @ =gUnknown_2023FE8
	ldr r0, [r4]
	movs r1, 0xC1
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80751C4
	lsls r0, 24
	cmp r0, 0
	bne _0812C0BC
	ldr r2, _0812C0B8 @ =gUnknown_2023BE4
	ldr r0, [r4]
	movs r1, 0xC1
	lsls r1, 1
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	b _0812C0EA
	.align 2, 0
_0812C0AC: .4byte gUnknown_2022B4C
_0812C0B0: .4byte gUnknown_3004F90
_0812C0B4: .4byte gUnknown_2023FE8
_0812C0B8: .4byte gUnknown_2023BE4
_0812C0BC:
	ldr r5, _0812C0D8 @ =gUnknown_2023BE4
	movs r0, 0
	bl sub_80751E8
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0x58
	muls r0, r4
	adds r0, r5
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0812C0DC
	movs r0, 0
	b _0812C0DE
	.align 2, 0
_0812C0D8: .4byte gUnknown_2023BE4
_0812C0DC:
	movs r0, 0x2
_0812C0DE:
	bl sub_80751E8
	lsls r0, 24
	lsrs r0, 24
	muls r0, r4
	adds r0, r5
_0812C0EA:
	ldrh r0, [r0]
	strh r0, [r7, 0x4]
	movs r0, 0
	bl sub_80751E8
	adds r4, r0, 0
	movs r0, 0x2
	bl sub_80751E8
	ldr r6, _0812C14C @ =gUnknown_2023BE4
	lsls r4, 24
	lsrs r4, 24
	movs r5, 0x58
	adds r1, r4, 0
	muls r1, r5
	adds r1, r6
	lsls r0, 24
	lsrs r0, 24
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0, 0x28]
	ldrh r1, [r1, 0x28]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	movs r0, 0
	bl sub_80751E8
	adds r4, r0, 0
	movs r0, 0x2
	bl sub_80751E8
	lsls r4, 24
	lsrs r4, 24
	adds r1, r4, 0
	muls r1, r5
	adds r1, r6
	lsls r0, 24
	lsrs r0, 24
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0, 0x2C]
	ldrh r1, [r1, 0x2C]
	adds r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
	b _0812C18E
	.align 2, 0
_0812C14C: .4byte gUnknown_2023BE4
_0812C150:
	ldr r0, _0812C1C4 @ =gUnknown_3004F90
	ldrh r0, [r0, 0x20]
	strh r0, [r7, 0x2]
	movs r0, 0
	bl sub_80751E8
	ldr r5, _0812C1C8 @ =gUnknown_2023BE4
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0x58
	muls r0, r4
	adds r0, r5
	ldrh r0, [r0]
	strh r0, [r7, 0x4]
	movs r0, 0
	bl sub_80751E8
	lsls r0, 24
	lsrs r0, 24
	muls r0, r4
	adds r0, r5
	ldrh r0, [r0, 0x28]
	mov r8, r0
	movs r0, 0
	bl sub_80751E8
	lsls r0, 24
	lsrs r0, 24
	muls r0, r4
	adds r0, r5
	ldrh r4, [r0, 0x2C]
_0812C18E:
	bl sub_8056260
	movs r1, 0
	strb r0, [r7, 0x7]
	strb r1, [r7, 0x6]
	adds r0, r4, 0
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 16
	lsrs r1, r0, 16
	lsls r0, r1, 1
	cmp r8, r0
	bge _0812C1AE
	movs r0, 0x1
	strb r0, [r7, 0x6]
_0812C1AE:
	cmp r8, r1
	bcs _0812C1B8
	ldrb r0, [r7, 0x6]
	adds r0, 0x1
	strb r0, [r7, 0x6]
_0812C1B8:
	mov r0, r10
	adds r1, r7, 0
	bl sub_8113550
	b _0812C206
	.align 2, 0
_0812C1C4: .4byte gUnknown_3004F90
_0812C1C8: .4byte gUnknown_2023BE4
_0812C1CC:
	ldrb r0, [r5]
	cmp r0, 0x1
	bne _0812C1E8
	ldr r0, _0812C1E4 @ =gUnknown_202402C
	movs r1, 0xB
	bl sub_803FBE8
	mov r1, r9
	strh r0, [r1]
	strh r4, [r1, 0x2]
	b _0812C1F8
	.align 2, 0
_0812C1E4: .4byte gUnknown_202402C
_0812C1E8:
	mov r0, r9
	strh r4, [r0]
	ldr r0, _0812C220 @ =gUnknown_202402C
	movs r1, 0xB
	bl sub_803FBE8
	mov r1, r9
	strh r0, [r1, 0x2]
_0812C1F8:
	bl sub_8056260
	mov r1, r9
	strb r0, [r1, 0x4]
	movs r0, 0x1F
	bl sub_8113550
_0812C206:
	adds r0, r7, 0
	bl sub_8002BC4
	mov r0, r9
	bl sub_8002BC4
_0812C212:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812C220: .4byte gUnknown_202402C
	thumb_func_end sub_812BFDC

	thumb_func_start sub_812C224
sub_812C224: @ 812C224
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	ldr r4, _0812C2B8 @ =gUnknown_2022B4C
	ldr r0, [r4]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0812C31C
	movs r0, 0x18
	bl sub_8002B9C
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
_0812C2B8: .4byte gUnknown_2022B4C
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
	bl sub_811B0D0
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
	ldr r7, _0812C330 @ =gUnknown_2023FE8
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
	bl sub_8002BC4
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
_0812C330: .4byte gUnknown_2023FE8
	thumb_func_end sub_812C224

	thumb_func_start sub_812C334
sub_812C334: @ 812C334
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r3, _0812C35C @ =gUnknown_202273C
	ldr r4, _0812C360 @ =gUnknown_2023FE8
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
_0812C35C: .4byte gUnknown_202273C
_0812C360: .4byte gUnknown_2023FE8
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
