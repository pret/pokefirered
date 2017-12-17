	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start nullsub_6
nullsub_6: @ 8003B20
	bx lr
	thumb_func_end nullsub_6

	thumb_func_start sub_8003B24
sub_8003B24: @ 8003B24
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r5, r0, 0
	movs r0, 0
	mov r8, r0
	ldr r4, _08003BB8 @ =gUnknown_3003E40
_08003B38:
	mov r1, r8
	lsls r0, r1, 24
	lsrs r0, 24
	bl sub_8002008
	cmp r0, 0
	beq _08003B48
	ldr r0, _08003BBC @ =nullsub_6
_08003B48:
	str r0, [r4]
	adds r4, 0x4
	movs r2, 0x1
	add r8, r2
	mov r0, r8
	cmp r0, 0x3
	ble _08003B38
	ldr r0, _08003BC0 @ =gUnknown_81EA144
	ldr r2, [r0]
	ldr r3, [r0, 0x4]
	ldr r1, _08003BC4 @ =gUnknown_20204B4
	movs r0, 0
	movs r4, 0x1F
	mov r8, r4
_08003B64:
	str r2, [r1]
	str r3, [r1, 0x4]
	str r0, [r1, 0x8]
	adds r1, 0xC
	movs r4, 0x1
	negs r4, r4
	add r8, r4
	mov r4, r8
	cmp r4, 0
	bge _08003B64
	movs r0, 0
	mov r8, r0
	movs r1, 0
	str r1, [sp]
	ldrb r7, [r5]
	cmp r7, 0xFF
	bne _08003B88
	b _08003CC0
_08003B88:
	adds r6, r5, 0
	movs r2, 0
	str r2, [sp, 0x4]
_08003B8E:
	ldr r0, _08003BC8 @ =gUnknown_3003D8C
	ldr r0, [r0]
	cmp r0, 0x1
	bne _08003BCC
	ldrb r1, [r6, 0x3]
	ldrb r0, [r6, 0x4]
	adds r2, r1, 0
	muls r2, r0
	adds r0, r7, 0
	movs r1, 0
	movs r3, 0
	bl sub_80014F0
	str r0, [sp]
	movs r0, 0x1
	negs r0, r0
	ldr r4, [sp]
	cmp r4, r0
	bne _08003BCC
_08003BB4:
	movs r0, 0
	b _08003CC8
	.align 2, 0
_08003BB8: .4byte gUnknown_3003E40
_08003BBC: .4byte nullsub_6
_08003BC0: .4byte gUnknown_81EA144
_08003BC4: .4byte gUnknown_20204B4
_08003BC8: .4byte gUnknown_3003D8C
_08003BCC:
	ldr r0, _08003C04 @ =gUnknown_3003E40
	mov r9, r0
	lsls r0, r7, 2
	mov r2, r9
	adds r1, r0, r2
	ldr r1, [r1]
	mov r10, r0
	cmp r1, 0
	bne _08003C2E
	adds r0, r7, 0
	movs r1, 0x8
	bl sub_8001AA8
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _08003C08 @ =0x0000ffff
	cmp r5, r0
	beq _08003C2E
	adds r0, r5, 0
	bl sub_8002B9C
	adds r4, r0, 0
	cmp r4, 0
	bne _08003C0C
	bl sub_8003ECC
	b _08003BB4
	.align 2, 0
_08003C04: .4byte gUnknown_3003E40
_08003C08: .4byte 0x0000ffff
_08003C0C:
	movs r1, 0
	mov r3, r9
	cmp r1, r5
	bge _08003C20
	movs r2, 0
_08003C16:
	adds r0, r4, r1
	strb r2, [r0]
	adds r1, 0x1
	cmp r1, r5
	blt _08003C16
_08003C20:
	mov r1, r10
	adds r0, r1, r3
	str r4, [r0]
	adds r0, r7, 0
	adds r1, r4, 0
	bl sub_8001FA0
_08003C2E:
	ldrb r1, [r6, 0x3]
	ldrb r0, [r6, 0x4]
	muls r0, r1
	lsls r0, 21
	lsrs r0, 16
	bl sub_8002B9C
	adds r4, r0, 0
	cmp r4, 0
	bne _08003C70
	adds r0, r7, 0
	bl sub_8004A34
	lsls r0, 24
	cmp r0, 0
	bne _08003BB4
	ldr r0, _08003C68 @ =gUnknown_3003E40
	mov r2, r10
	adds r5, r2, r0
	ldr r1, [r5]
	ldr r0, _08003C6C @ =nullsub_6
	cmp r1, r0
	beq _08003BB4
	adds r0, r1, 0
	bl sub_8002BC4
	str r4, [r5]
	b _08003BB4
	.align 2, 0
_08003C68: .4byte gUnknown_3003E40
_08003C6C: .4byte nullsub_6
_08003C70:
	ldr r1, _08003CD8 @ =gUnknown_20204B4
	adds r0, r1, 0
	adds r0, 0x8
	ldr r2, [sp, 0x4]
	adds r0, r2, r0
	str r4, [r0]
	adds r2, r1
	ldr r0, [r6]
	ldr r1, [r6, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _08003CDC @ =gUnknown_3003D8C
	ldr r0, [r0]
	cmp r0, 0x1
	bne _08003CA6
	mov r4, sp
	ldrh r4, [r4]
	strh r4, [r2, 0x6]
	ldrb r0, [r6, 0x3]
	ldrb r1, [r6, 0x4]
	adds r2, r0, 0
	muls r2, r1
	adds r0, r7, 0
	ldr r1, [sp]
	movs r3, 0x1
	bl sub_80014F0
_08003CA6:
	adds r6, 0x8
	ldr r0, [sp, 0x4]
	adds r0, 0xC
	str r0, [sp, 0x4]
	movs r1, 0x1
	add r8, r1
	ldrb r7, [r6]
	cmp r7, 0xFF
	beq _08003CC0
	mov r2, r8
	cmp r2, 0x1F
	bgt _08003CC0
	b _08003B8E
_08003CC0:
	ldr r1, _08003CE0 @ =gUnknown_3003E30
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
_08003CC8:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08003CD8: .4byte gUnknown_20204B4
_08003CDC: .4byte gUnknown_3003D8C
_08003CE0: .4byte gUnknown_3003E30
	thumb_func_end sub_8003B24

	thumb_func_start sub_8003CE4
sub_8003CE4: @ 8003CE4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r0
	movs r6, 0
	ldr r1, _08003DD4 @ =gUnknown_20204B4
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _08003D14
_08003CFC:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x1F
	bhi _08003D14
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08003CFC
_08003D14:
	cmp r6, 0x20
	beq _08003DCE
	mov r0, r8
	ldrb r7, [r0]
	movs r1, 0
	mov r9, r1
	ldr r0, _08003DD8 @ =gUnknown_3003D8C
	ldr r0, [r0]
	cmp r0, 0x1
	bne _08003D46
	mov r2, r8
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	adds r2, r1, 0
	muls r2, r0
	adds r0, r7, 0
	movs r1, 0
	movs r3, 0
	bl sub_80014F0
	mov r9, r0
	movs r0, 0x1
	negs r0, r0
	cmp r9, r0
	beq _08003DCE
_08003D46:
	ldr r3, _08003DDC @ =gUnknown_3003E40
	mov r10, r3
	lsls r0, r7, 2
	adds r1, r0, r3
	ldr r1, [r1]
	str r0, [sp]
	cmp r1, 0
	bne _08003D96
	adds r0, r7, 0
	movs r1, 0x8
	bl sub_8001AA8
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _08003DE0 @ =0x0000ffff
	cmp r5, r0
	beq _08003D96
	adds r0, r5, 0
	bl sub_8002B9C
	adds r4, r0, 0
	cmp r4, 0
	beq _08003DCE
	movs r1, 0
	mov r3, r10
	cmp r1, r5
	bge _08003D88
	movs r2, 0
_08003D7E:
	adds r0, r4, r1
	strb r2, [r0]
	adds r1, 0x1
	cmp r1, r5
	blt _08003D7E
_08003D88:
	ldr r1, [sp]
	adds r0, r1, r3
	str r4, [r0]
	adds r0, r7, 0
	adds r1, r4, 0
	bl sub_8001FA0
_08003D96:
	mov r2, r8
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	muls r0, r1
	lsls r0, 21
	lsrs r0, 16
	bl sub_8002B9C
	adds r4, r0, 0
	cmp r4, 0
	bne _08003DE8
	adds r0, r7, 0
	bl sub_8004A34
	lsls r0, 24
	cmp r0, 0
	bne _08003DCE
	ldr r0, _08003DDC @ =gUnknown_3003E40
	ldr r3, [sp]
	adds r5, r3, r0
	ldr r1, [r5]
	ldr r0, _08003DE4 @ =nullsub_6
	cmp r1, r0
	beq _08003DCE
	adds r0, r1, 0
	bl sub_8002BC4
	str r4, [r5]
_08003DCE:
	movs r0, 0xFF
	b _08003E24
	.align 2, 0
_08003DD4: .4byte gUnknown_20204B4
_08003DD8: .4byte gUnknown_3003D8C
_08003DDC: .4byte gUnknown_3003E40
_08003DE0: .4byte 0x0000ffff
_08003DE4: .4byte nullsub_6
_08003DE8:
	ldr r2, _08003E34 @ =gUnknown_20204B4
	lsls r1, r6, 1
	adds r1, r6
	lsls r1, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	str r4, [r0]
	adds r2, r1, r2
	mov r3, r8
	ldr r0, [r3]
	ldr r1, [r3, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _08003E38 @ =gUnknown_3003D8C
	ldr r0, [r0]
	cmp r0, 0x1
	bne _08003E22
	mov r0, r9
	strh r0, [r2, 0x6]
	ldrb r0, [r2, 0x3]
	ldrb r1, [r2, 0x4]
	adds r2, r0, 0
	muls r2, r1
	adds r0, r7, 0
	mov r1, r9
	movs r3, 0x1
	bl sub_80014F0
_08003E22:
	adds r0, r6, 0
_08003E24:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08003E34: .4byte gUnknown_20204B4
_08003E38: .4byte gUnknown_3003D8C
	thumb_func_end sub_8003CE4

	thumb_func_start sub_8003E3C
sub_8003E3C: @ 8003E3C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08003EB8 @ =gUnknown_20204B4
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r4, r0, r1
	ldrb r3, [r4]
	adds r7, r3, 0
	ldr r0, _08003EBC @ =gUnknown_3003D8C
	ldr r0, [r0]
	cmp r0, 0x1
	bne _08003E68
	ldrh r1, [r4, 0x6]
	ldrb r2, [r4, 0x3]
	ldrb r0, [r4, 0x4]
	muls r2, r0
	adds r0, r3, 0
	movs r3, 0x2
	bl sub_80014F0
_08003E68:
	ldr r0, _08003EC0 @ =gUnknown_81EA144
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r4]
	str r1, [r4, 0x4]
	adds r0, r7, 0
	bl sub_8004A34
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08003E96
	ldr r0, _08003EC4 @ =gUnknown_3003E40
	lsls r1, r7, 2
	adds r4, r1, r0
	ldr r1, [r4]
	ldr r0, _08003EC8 @ =nullsub_6
	cmp r1, r0
	beq _08003E96
	adds r0, r1, 0
	bl sub_8002BC4
	str r5, [r4]
_08003E96:
	ldr r1, _08003EB8 @ =gUnknown_20204B4
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r1, 0x8
	adds r4, r0, r1
	ldr r0, [r4]
	cmp r0, 0
	beq _08003EB0
	bl sub_8002BC4
	movs r0, 0
	str r0, [r4]
_08003EB0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003EB8: .4byte gUnknown_20204B4
_08003EBC: .4byte gUnknown_3003D8C
_08003EC0: .4byte gUnknown_81EA144
_08003EC4: .4byte gUnknown_3003E40
_08003EC8: .4byte nullsub_6
	thumb_func_end sub_8003E3C

	thumb_func_start sub_8003ECC
sub_8003ECC: @ 8003ECC
	push {r4-r6,lr}
	ldr r4, _08003F14 @ =gUnknown_3003E40
	movs r5, 0x3
_08003ED2:
	ldr r1, [r4]
	cmp r1, 0
	beq _08003EE8
	ldr r0, _08003F18 @ =nullsub_6
	cmp r1, r0
	beq _08003EE8
	adds r0, r1, 0
	bl sub_8002BC4
	movs r0, 0
	str r0, [r4]
_08003EE8:
	adds r4, 0x4
	subs r5, 0x1
	cmp r5, 0
	bge _08003ED2
	ldr r0, _08003F1C @ =gUnknown_20204B4
	adds r4, r0, 0
	adds r4, 0x8
	movs r6, 0
	movs r5, 0x1F
_08003EFA:
	ldr r0, [r4]
	cmp r0, 0
	beq _08003F06
	bl sub_8002BC4
	str r6, [r4]
_08003F06:
	adds r4, 0xC
	subs r5, 0x1
	cmp r5, 0
	bge _08003EFA
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003F14: .4byte gUnknown_3003E40
_08003F18: .4byte nullsub_6
_08003F1C: .4byte gUnknown_20204B4
	thumb_func_end sub_8003ECC

	thumb_func_start sub_8003F20
sub_8003F20: @ 8003F20
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	adds r5, r3, 0
	ldr r2, _08003F58 @ =gUnknown_20204B4
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	mov r0, sp
	adds r1, r2
	ldm r1!, {r2,r4,r6}
	stm r0!, {r2,r4,r6}
	mov r0, sp
	ldrb r1, [r0, 0x3]
	ldrb r0, [r0, 0x4]
	muls r0, r1
	lsls r0, 21
	lsrs r4, r0, 16
	cmp r3, 0x2
	beq _08003F6C
	cmp r3, 0x2
	bgt _08003F5C
	cmp r3, 0x1
	beq _08003F62
	b _08003F96
	.align 2, 0
_08003F58: .4byte gUnknown_20204B4
_08003F5C:
	cmp r5, 0x3
	beq _08003F7E
	b _08003F96
_08003F62:
	mov r0, sp
	ldrb r0, [r0]
	bl sub_80020BC
	b _08003F96
_08003F6C:
	mov r0, sp
	ldrb r0, [r0]
	ldr r1, [sp, 0x8]
	mov r2, sp
	ldrh r3, [r2, 0x6]
	adds r2, r4, 0
	bl sub_80017D0
	b _08003F96
_08003F7E:
	mov r0, sp
	ldrb r0, [r0]
	ldr r1, [sp, 0x8]
	mov r2, sp
	ldrh r3, [r2, 0x6]
	adds r2, r4, 0
	bl sub_80017D0
	mov r0, sp
	ldrb r0, [r0]
	bl sub_80020BC
_08003F96:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8003F20

	thumb_func_start sub_8003FA0
sub_8003FA0: @ 8003FA0
	push {r4,lr}
	sub sp, 0x1C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08003FFC @ =gUnknown_20204B4
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	add r0, sp, 0x10
	adds r1, r2
	ldm r1!, {r2-r4}
	stm r0!, {r2-r4}
	add r0, sp, 0x10
	ldrb r0, [r0]
	movs r1, 0xA
	bl sub_8001AA8
	adds r1, r0, 0
	add r0, sp, 0x10
	ldrh r0, [r0, 0x6]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	add r0, sp, 0x10
	ldrb r0, [r0]
	add r2, sp, 0x10
	ldrb r2, [r2, 0x1]
	add r3, sp, 0x10
	ldrb r3, [r3, 0x2]
	add r4, sp, 0x10
	ldrb r4, [r4, 0x3]
	str r4, [sp]
	add r4, sp, 0x10
	ldrb r4, [r4, 0x4]
	str r4, [sp, 0x4]
	add r4, sp, 0x10
	ldrb r4, [r4, 0x5]
	str r4, [sp, 0x8]
	movs r4, 0x1
	str r4, [sp, 0xC]
	bl sub_8002590
	add sp, 0x1C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08003FFC: .4byte gUnknown_20204B4
	thumb_func_end sub_8003FA0

	thumb_func_start sub_8004000
sub_8004000: @ 8004000
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	ldr r4, [sp, 0x44]
	ldr r5, [sp, 0x48]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x1C]
	lsls r4, 24
	lsrs r4, 24
	mov r8, r4
	lsls r5, 24
	lsrs r5, 24
	str r5, [sp, 0x20]
	ldr r2, _080040B4 @ =gUnknown_20204B4
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	add r0, sp, 0x10
	adds r1, r2
	ldm r1!, {r2-r4}
	stm r0!, {r2-r4}
	add r0, sp, 0x10
	ldrb r0, [r0]
	movs r1, 0xA
	bl sub_8001AA8
	add r2, sp, 0x10
	adds r1, r2, 0
	ldrb r1, [r1, 0x3]
	mov r3, r9
	muls r3, r1
	adds r1, r3, 0
	ldrh r2, [r2, 0x6]
	adds r1, r2
	add r1, r10
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	movs r5, 0
	cmp r5, r8
	bge _080040A2
	add r4, sp, 0x10
	movs r7, 0x1
_0800406E:
	ldrb r0, [r4]
	ldrb r2, [r4, 0x1]
	add r2, r10
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	add r3, r9
	adds r3, r5
	lsls r3, 24
	lsrs r3, 24
	ldr r1, [sp, 0x1C]
	str r1, [sp]
	str r7, [sp, 0x4]
	ldr r1, [sp, 0x20]
	str r1, [sp, 0x8]
	str r7, [sp, 0xC]
	adds r1, r6, 0
	bl sub_8002590
	ldrb r0, [r4, 0x3]
	adds r0, r6, r0
	lsls r0, 16
	lsrs r6, r0, 16
	adds r5, 0x1
	cmp r5, r8
	blt _0800406E
_080040A2:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080040B4: .4byte gUnknown_20204B4
	thumb_func_end sub_8004000

	thumb_func_start sub_80040B8
sub_80040B8: @ 80040B8
	push {r4,lr}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08004100 @ =gUnknown_20204B4
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	add r0, sp, 0xC
	adds r1, r2
	ldm r1!, {r2-r4}
	stm r0!, {r2-r4}
	add r0, sp, 0xC
	ldrb r0, [r0]
	ldr r1, _08004104 @ =gUnknown_3003E30
	ldrb r1, [r1]
	add r2, sp, 0xC
	ldrb r2, [r2, 0x1]
	add r3, sp, 0xC
	ldrb r3, [r3, 0x2]
	add r4, sp, 0xC
	ldrb r4, [r4, 0x3]
	str r4, [sp]
	add r4, sp, 0xC
	ldrb r4, [r4, 0x4]
	str r4, [sp, 0x4]
	add r4, sp, 0xC
	ldrb r4, [r4, 0x5]
	str r4, [sp, 0x8]
	bl sub_8002554
	add sp, 0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08004100: .4byte gUnknown_20204B4
_08004104: .4byte gUnknown_3003E30
	thumb_func_end sub_80040B8

	thumb_func_start sub_8004108
sub_8004108: @ 8004108
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	ldr r4, [sp, 0x40]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x1C]
	lsls r4, 24
	lsrs r4, 24
	mov r8, r4
	ldr r2, _080041B4 @ =gUnknown_20204B4
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	add r0, sp, 0x10
	adds r1, r2
	ldm r1!, {r2-r4}
	stm r0!, {r2-r4}
	add r0, sp, 0x10
	ldrb r0, [r0]
	movs r1, 0xA
	bl sub_8001AA8
	add r2, sp, 0x10
	adds r1, r2, 0
	ldrb r1, [r1, 0x3]
	mov r3, r9
	muls r3, r1
	adds r1, r3, 0
	ldrh r2, [r2, 0x6]
	adds r1, r2
	add r1, r10
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	movs r5, 0
	cmp r5, r8
	bge _080041A2
	add r4, sp, 0x10
	movs r7, 0x1
_0800416E:
	ldrb r0, [r4]
	ldrb r2, [r4, 0x1]
	add r2, r10
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	add r3, r9
	adds r3, r5
	lsls r3, 24
	lsrs r3, 24
	ldr r1, [sp, 0x1C]
	str r1, [sp]
	str r7, [sp, 0x4]
	ldrb r1, [r4, 0x5]
	str r1, [sp, 0x8]
	str r7, [sp, 0xC]
	adds r1, r6, 0
	bl sub_8002590
	ldrb r0, [r4, 0x3]
	adds r0, r6, r0
	lsls r0, 16
	lsrs r6, r0, 16
	adds r5, 0x1
	cmp r5, r8
	blt _0800416E
_080041A2:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080041B4: .4byte gUnknown_20204B4
	thumb_func_end sub_8004108

	thumb_func_start sub_80041B8
sub_80041B8: @ 80041B8
	push {r4,r5,lr}
	sub sp, 0x18
	ldr r4, [sp, 0x24]
	ldr r5, [sp, 0x28]
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	str r4, [sp]
	str r5, [sp, 0x4]
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	str r4, [sp, 0x10]
	str r5, [sp, 0x14]
	movs r2, 0
	movs r3, 0
	bl sub_80041F0
	add sp, 0x18
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80041B8

	thumb_func_start sub_80041F0
sub_80041F0: @ 80041F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	ldr r4, [sp, 0x44]
	ldr r5, [sp, 0x48]
	ldr r6, [sp, 0x4C]
	mov r8, r6
	ldr r6, [sp, 0x50]
	mov r9, r6
	ldr r6, [sp, 0x54]
	mov r10, r6
	ldr r6, [sp, 0x58]
	mov r12, r6
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r4, 16
	mov r6, r8
	lsls r6, 16
	lsrs r6, 16
	mov r8, r6
	mov r6, r9
	lsls r6, 16
	lsrs r6, 16
	mov r9, r6
	mov r6, r10
	lsls r6, 16
	lsrs r6, 16
	mov r10, r6
	mov r6, r12
	lsls r6, 16
	lsrs r6, 16
	mov r12, r6
	str r1, [sp, 0x14]
	ldr r7, _080042A4 @ =0xffff0000
	lsls r5, 16
	ldr r6, _080042A8 @ =0x0000ffff
	lsrs r4, 16
	orrs r4, r5
	str r4, [sp, 0x18]
	ldr r1, _080042AC @ =gUnknown_20204B4
	lsls r5, r0, 1
	adds r5, r0
	lsls r5, 2
	adds r0, r1, 0
	adds r0, 0x8
	adds r0, r5, r0
	ldr r0, [r0]
	str r0, [sp, 0x1C]
	adds r5, r1
	ldrb r0, [r5, 0x3]
	lsls r0, 3
	add r1, sp, 0x1C
	ldr r4, [r1, 0x4]
	ands r4, r7
	orrs r4, r0
	str r4, [r1, 0x4]
	ldrb r0, [r5, 0x4]
	lsls r0, 19
	ands r6, r4
	orrs r6, r0
	str r6, [r1, 0x4]
	mov r0, r8
	str r0, [sp]
	mov r6, r9
	str r6, [sp, 0x4]
	mov r0, r10
	str r0, [sp, 0x8]
	mov r6, r12
	str r6, [sp, 0xC]
	movs r0, 0
	str r0, [sp, 0x10]
	add r0, sp, 0x14
	bl sub_8004AA4
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080042A4: .4byte 0xffff0000
_080042A8: .4byte 0x0000ffff
_080042AC: .4byte gUnknown_20204B4
	thumb_func_end sub_80041F0

	thumb_func_start sub_80042B0
sub_80042B0: @ 80042B0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	ldr r4, [sp, 0x48]
	ldr r5, [sp, 0x4C]
	ldr r6, [sp, 0x50]
	mov r8, r6
	ldr r7, [sp, 0x54]
	mov r9, r7
	ldr r6, [sp, 0x58]
	mov r10, r6
	ldr r7, [sp, 0x5C]
	mov r12, r7
	ldr r6, [sp, 0x60]
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r4, 16
	mov r7, r8
	lsls r7, 16
	lsrs r7, 16
	mov r8, r7
	mov r7, r9
	lsls r7, 16
	lsrs r7, 16
	mov r9, r7
	mov r7, r10
	lsls r7, 16
	lsrs r7, 16
	mov r10, r7
	mov r7, r12
	lsls r7, 16
	lsrs r7, 16
	mov r12, r7
	lsls r6, 24
	lsrs r6, 24
	str r6, [sp, 0x24]
	str r1, [sp, 0x14]
	lsls r5, 16
	ldr r6, _0800436C @ =0x0000ffff
	lsrs r4, 16
	orrs r4, r5
	str r4, [sp, 0x18]
	ldr r1, _08004370 @ =gUnknown_20204B4
	lsls r5, r0, 1
	adds r5, r0
	lsls r5, 2
	adds r0, r1, 0
	adds r0, 0x8
	adds r0, r5, r0
	ldr r0, [r0]
	str r0, [sp, 0x1C]
	adds r5, r1
	ldrb r0, [r5, 0x3]
	lsls r0, 3
	add r1, sp, 0x1C
	ldr r4, [r1, 0x4]
	ldr r7, _08004374 @ =0xffff0000
	ands r4, r7
	orrs r4, r0
	str r4, [r1, 0x4]
	ldrb r0, [r5, 0x4]
	lsls r0, 19
	ands r6, r4
	orrs r6, r0
	str r6, [r1, 0x4]
	mov r0, r8
	str r0, [sp]
	mov r6, r9
	str r6, [sp, 0x4]
	mov r7, r10
	str r7, [sp, 0x8]
	mov r0, r12
	str r0, [sp, 0xC]
	ldr r6, [sp, 0x24]
	str r6, [sp, 0x10]
	add r0, sp, 0x14
	bl sub_8004AA4
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800436C: .4byte 0x0000ffff
_08004370: .4byte gUnknown_20204B4
_08004374: .4byte 0xffff0000
	thumb_func_end sub_80042B0

	thumb_func_start sub_8004378
sub_8004378: @ 8004378
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x10
	mov r9, r3
	ldr r3, [sp, 0x28]
	ldr r4, [sp, 0x2C]
	mov r8, r4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 16
	lsrs r2, 16
	mov r4, r9
	lsls r4, 16
	lsrs r4, 16
	mov r9, r4
	lsls r3, 16
	lsrs r3, 16
	mov r4, r8
	lsls r4, 16
	lsrs r4, 16
	mov r8, r4
	ldr r5, _080043F8 @ =gUnknown_20204B4
	lsls r4, r0, 1
	adds r4, r0
	lsls r4, 2
	adds r0, r5, 0
	adds r0, 0x8
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [sp, 0x8]
	adds r4, r5
	ldrb r0, [r4, 0x3]
	lsls r0, 3
	ldr r6, _080043FC @ =0xffff0000
	ldr r5, [sp, 0xC]
	ands r5, r6
	orrs r5, r0
	str r5, [sp, 0xC]
	ldrb r4, [r4, 0x4]
	lsls r4, 19
	ldr r0, _08004400 @ =0x0000ffff
	ands r0, r5
	orrs r0, r4
	str r0, [sp, 0xC]
	mov r0, r8
	str r0, [sp]
	str r1, [sp, 0x4]
	add r0, sp, 0x8
	adds r1, r2, 0
	mov r2, r9
	bl sub_8004C84
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080043F8: .4byte gUnknown_20204B4
_080043FC: .4byte 0xffff0000
_08004400: .4byte 0x0000ffff
	thumb_func_end sub_8004378

	thumb_func_start sub_8004404
sub_8004404: @ 8004404
	push {r4-r6,lr}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r5, r2, 16
	lsls r3, 16
	lsrs r2, r3, 16
	cmp r5, 0
	beq _08004438
	ldr r1, _08004434 @ =gUnknown_20204B4
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r1, 0x8
	adds r0, r1
	lsls r2, 5
	ldr r1, [r0]
	adds r1, r2
	lsrs r2, r5, 17
	adds r0, r6, 0
	bl CpuSet
	b _08004450
	.align 2, 0
_08004434: .4byte gUnknown_20204B4
_08004438:
	ldr r1, _08004458 @ =gUnknown_20204B4
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r1, 0x8
	adds r0, r1
	lsls r2, 5
	ldr r1, [r0]
	adds r1, r2
	adds r0, r6, 0
	bl LZ77UnCompWram
_08004450:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004458: .4byte gUnknown_20204B4
	thumb_func_end sub_8004404

	thumb_func_start sub_800445C
sub_800445C: @ 800445C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r5, _080044A4 @ =gUnknown_20204B4
	lsls r4, r0, 1
	adds r4, r0
	lsls r4, 2
	adds r0, r4, r5
	ldrb r2, [r0, 0x3]
	ldrb r0, [r0, 0x4]
	muls r2, r0
	lsls r0, r1, 24
	lsls r3, r1, 16
	orrs r0, r3
	lsls r3, r1, 8
	orrs r0, r3
	orrs r0, r1
	str r0, [sp]
	adds r5, 0x8
	adds r4, r5
	ldr r1, [r4]
	lsls r2, 3
	movs r0, 0x80
	lsls r0, 17
	orrs r2, r0
	mov r0, sp
	bl CpuFastSet
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080044A4: .4byte gUnknown_20204B4
	thumb_func_end sub_800445C

	thumb_func_start sub_80044A8
sub_80044A8: @ 80044A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp]
	lsls r3, 24
	lsrs r3, 24
	ldr r2, _08004544 @ =gUnknown_20204B4
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r4, r1, r2
	adds r2, 0x8
	adds r1, r2
	ldr r5, [r1]
	lsls r7, r3, 24
	lsls r0, r3, 16
	orrs r7, r0
	lsls r0, r3, 8
	orrs r7, r0
	orrs r7, r3
	ldr r1, [r4]
	ldr r2, [r4, 0x4]
	ldrb r3, [r4, 0x4]
	lsrs r0, r1, 24
	muls r0, r3
	lsls r6, r0, 5
	lsrs r1, 24
	mov r12, r1
	mov r0, r8
	cmp r0, 0x1
	bne _080044FC
	b _080046B2
_080044FC:
	cmp r0, 0x1
	ble _08004502
	b _0800485A
_08004502:
	cmp r0, 0
	beq _08004508
	b _0800485A
_08004508:
	movs r4, 0
	cmp r4, r6
	blt _08004510
	b _0800485A
_08004510:
	movs r1, 0x8
	negs r1, r1
	mov r9, r1
	movs r2, 0x7
	mov r8, r2
	mov r10, r5
_0800451C:
	ldr r3, [sp]
	adds r0, r3, 0
	mov r1, r9
	ands r0, r1
	mov r1, r12
	muls r1, r0
	adds r0, r3, 0
	mov r2, r8
	ands r0, r2
	orrs r1, r0
	lsls r1, 2
	adds r1, r4, r1
	cmp r1, r6
	bge _08004548
	adds r0, r5, r1
	ldr r0, [r0]
	mov r1, r10
	str r0, [r1]
	b _0800454C
	.align 2, 0
_08004544: .4byte gUnknown_20204B4
_08004548:
	mov r2, r10
	str r7, [r2]
_0800454C:
	adds r3, 0x1
	adds r2, r4, 0x4
	adds r0, r3, 0
	mov r1, r9
	ands r0, r1
	mov r1, r12
	muls r1, r0
	str r1, [sp, 0x4]
	adds r0, r3, 0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, 0x4]
	orrs r1, r0
	lsls r1, 2
	adds r1, r4, r1
	cmp r1, r6
	bge _08004578
	adds r0, r5, r2
	adds r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _0800457C
_08004578:
	adds r0, r5, r2
	str r7, [r0]
_0800457C:
	adds r3, 0x1
	adds r2, r4, 0
	adds r2, 0x8
	adds r0, r3, 0
	mov r1, r9
	ands r0, r1
	mov r1, r12
	muls r1, r0
	str r1, [sp, 0x4]
	adds r0, r3, 0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, 0x4]
	orrs r1, r0
	lsls r1, 2
	adds r1, r4, r1
	cmp r1, r6
	bge _080045AA
	adds r0, r5, r2
	adds r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _080045AE
_080045AA:
	adds r0, r5, r2
	str r7, [r0]
_080045AE:
	adds r3, 0x1
	adds r2, r4, 0
	adds r2, 0xC
	adds r0, r3, 0
	mov r1, r9
	ands r0, r1
	mov r1, r12
	muls r1, r0
	str r1, [sp, 0x4]
	adds r0, r3, 0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, 0x4]
	orrs r1, r0
	lsls r1, 2
	adds r1, r4, r1
	cmp r1, r6
	bge _080045DC
	adds r0, r5, r2
	adds r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _080045E0
_080045DC:
	adds r0, r5, r2
	str r7, [r0]
_080045E0:
	adds r3, 0x1
	adds r2, r4, 0
	adds r2, 0x10
	adds r0, r3, 0
	mov r1, r9
	ands r0, r1
	mov r1, r12
	muls r1, r0
	str r1, [sp, 0x4]
	adds r0, r3, 0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, 0x4]
	orrs r1, r0
	lsls r1, 2
	adds r1, r4, r1
	cmp r1, r6
	bge _0800460E
	adds r0, r5, r2
	adds r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _08004612
_0800460E:
	adds r0, r5, r2
	str r7, [r0]
_08004612:
	adds r3, 0x1
	adds r2, r4, 0
	adds r2, 0x14
	adds r0, r3, 0
	mov r1, r9
	ands r0, r1
	mov r1, r12
	muls r1, r0
	str r1, [sp, 0x4]
	adds r0, r3, 0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, 0x4]
	orrs r1, r0
	lsls r1, 2
	adds r1, r4, r1
	cmp r1, r6
	bge _08004640
	adds r0, r5, r2
	adds r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _08004644
_08004640:
	adds r0, r5, r2
	str r7, [r0]
_08004644:
	adds r3, 0x1
	adds r2, r4, 0
	adds r2, 0x18
	adds r0, r3, 0
	mov r1, r9
	ands r0, r1
	mov r1, r12
	muls r1, r0
	str r1, [sp, 0x4]
	adds r0, r3, 0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, 0x4]
	orrs r1, r0
	lsls r1, 2
	adds r1, r4, r1
	cmp r1, r6
	bge _08004672
	adds r0, r5, r2
	adds r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _08004676
_08004672:
	adds r0, r5, r2
	str r7, [r0]
_08004676:
	adds r3, 0x1
	adds r2, r4, 0
	adds r2, 0x1C
	adds r0, r3, 0
	mov r1, r9
	ands r0, r1
	mov r1, r12
	muls r1, r0
	adds r0, r1, 0
	mov r1, r8
	ands r3, r1
	orrs r0, r3
	lsls r0, 2
	adds r1, r4, r0
	cmp r1, r6
	bge _080046A0
	adds r0, r5, r2
	adds r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _080046A4
_080046A0:
	adds r0, r5, r2
	str r7, [r0]
_080046A4:
	movs r2, 0x20
	add r10, r2
	adds r4, 0x20
	cmp r4, r6
	bge _080046B0
	b _0800451C
_080046B0:
	b _0800485A
_080046B2:
	subs r0, r6, 0x4
	adds r5, r0
	movs r4, 0
	cmp r4, r6
	blt _080046BE
	b _0800485A
_080046BE:
	movs r0, 0x8
	negs r0, r0
	mov r9, r0
	movs r1, 0x7
	mov r8, r1
	mov r10, r5
_080046CA:
	ldr r3, [sp]
	adds r0, r3, 0
	mov r2, r9
	ands r0, r2
	mov r1, r12
	muls r1, r0
	adds r0, r3, 0
	mov r2, r8
	ands r0, r2
	orrs r1, r0
	lsls r1, 2
	adds r1, r4, r1
	cmp r1, r6
	bge _080046F0
	subs r0, r5, r1
	ldr r0, [r0]
	mov r1, r10
	str r0, [r1]
	b _080046F4
_080046F0:
	mov r2, r10
	str r7, [r2]
_080046F4:
	adds r3, 0x1
	adds r2, r4, 0x4
	adds r0, r3, 0
	mov r1, r9
	ands r0, r1
	mov r1, r12
	muls r1, r0
	str r1, [sp, 0x4]
	adds r0, r3, 0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, 0x4]
	orrs r1, r0
	lsls r1, 2
	adds r1, r4, r1
	cmp r1, r6
	bge _08004720
	subs r0, r5, r2
	subs r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _08004724
_08004720:
	subs r0, r5, r2
	str r7, [r0]
_08004724:
	adds r3, 0x1
	adds r2, r4, 0
	adds r2, 0x8
	adds r0, r3, 0
	mov r1, r9
	ands r0, r1
	mov r1, r12
	muls r1, r0
	str r1, [sp, 0x4]
	adds r0, r3, 0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, 0x4]
	orrs r1, r0
	lsls r1, 2
	adds r1, r4, r1
	cmp r1, r6
	bge _08004752
	subs r0, r5, r2
	subs r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _08004756
_08004752:
	subs r0, r5, r2
	str r7, [r0]
_08004756:
	adds r3, 0x1
	adds r2, r4, 0
	adds r2, 0xC
	adds r0, r3, 0
	mov r1, r9
	ands r0, r1
	mov r1, r12
	muls r1, r0
	str r1, [sp, 0x4]
	adds r0, r3, 0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, 0x4]
	orrs r1, r0
	lsls r1, 2
	adds r1, r4, r1
	cmp r1, r6
	bge _08004784
	subs r0, r5, r2
	subs r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _08004788
_08004784:
	subs r0, r5, r2
	str r7, [r0]
_08004788:
	adds r3, 0x1
	adds r2, r4, 0
	adds r2, 0x10
	adds r0, r3, 0
	mov r1, r9
	ands r0, r1
	mov r1, r12
	muls r1, r0
	str r1, [sp, 0x4]
	adds r0, r3, 0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, 0x4]
	orrs r1, r0
	lsls r1, 2
	adds r1, r4, r1
	cmp r1, r6
	bge _080047B6
	subs r0, r5, r2
	subs r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _080047BA
_080047B6:
	subs r0, r5, r2
	str r7, [r0]
_080047BA:
	adds r3, 0x1
	adds r2, r4, 0
	adds r2, 0x14
	adds r0, r3, 0
	mov r1, r9
	ands r0, r1
	mov r1, r12
	muls r1, r0
	str r1, [sp, 0x4]
	adds r0, r3, 0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, 0x4]
	orrs r1, r0
	lsls r1, 2
	adds r1, r4, r1
	cmp r1, r6
	bge _080047E8
	subs r0, r5, r2
	subs r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _080047EC
_080047E8:
	subs r0, r5, r2
	str r7, [r0]
_080047EC:
	adds r3, 0x1
	adds r2, r4, 0
	adds r2, 0x18
	adds r0, r3, 0
	mov r1, r9
	ands r0, r1
	mov r1, r12
	muls r1, r0
	str r1, [sp, 0x4]
	adds r0, r3, 0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, 0x4]
	orrs r1, r0
	lsls r1, 2
	adds r1, r4, r1
	cmp r1, r6
	bge _0800481A
	subs r0, r5, r2
	subs r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _0800481E
_0800481A:
	subs r0, r5, r2
	str r7, [r0]
_0800481E:
	adds r3, 0x1
	adds r2, r4, 0
	adds r2, 0x1C
	adds r0, r3, 0
	mov r1, r9
	ands r0, r1
	mov r1, r12
	muls r1, r0
	adds r0, r1, 0
	mov r1, r8
	ands r3, r1
	orrs r0, r3
	lsls r0, 2
	adds r1, r4, r0
	cmp r1, r6
	bge _08004848
	subs r0, r5, r2
	subs r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _0800484C
_08004848:
	subs r0, r5, r2
	str r7, [r0]
_0800484C:
	movs r2, 0x20
	negs r2, r2
	add r10, r2
	adds r4, 0x20
	cmp r4, r6
	bge _0800485A
	b _080046CA
_0800485A:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80044A8

	thumb_func_start sub_800486C
sub_800486C: @ 800486C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	mov r8, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080048B8 @ =gUnknown_20204B4
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldr r5, [r1]
	ldr r6, [r1, 0x4]
	ldrb r0, [r1]
	lsrs r1, r5, 8
	lsls r1, 24
	lsrs r1, 24
	lsrs r2, r5, 16
	lsls r2, 24
	lsrs r2, 24
	lsrs r3, r5, 24
	lsls r4, r6, 24
	lsrs r4, 24
	str r4, [sp]
	lsrs r4, r6, 8
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x4]
	bl _call_via_r8
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080048B8: .4byte gUnknown_20204B4
	thumb_func_end sub_800486C

	thumb_func_start sub_80048BC
sub_80048BC: @ 80048BC
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r0, r1, 24
	cmp r0, 0x7
	bhi _08004948
	lsls r0, 2
	ldr r1, _080048D4 @ =_080048D8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080048D4: .4byte _080048D8
	.align 2, 0
_080048D8:
	.4byte _08004948
	.4byte _080048F8
	.4byte _0800490C
	.4byte _08004948
	.4byte _08004948
	.4byte _08004920
	.4byte _08004934
	.4byte _08004948
_080048F8:
	ldr r1, _08004908 @ =gUnknown_20204B4
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	strb r2, [r0, 0x1]
	movs r0, 0
	b _0800494A
	.align 2, 0
_08004908: .4byte gUnknown_20204B4
_0800490C:
	ldr r1, _0800491C @ =gUnknown_20204B4
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	strb r2, [r0, 0x2]
	movs r0, 0
	b _0800494A
	.align 2, 0
_0800491C: .4byte gUnknown_20204B4
_08004920:
	ldr r1, _08004930 @ =gUnknown_20204B4
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	strb r2, [r0, 0x5]
	movs r0, 0
	b _0800494A
	.align 2, 0
_08004930: .4byte gUnknown_20204B4
_08004934:
	ldr r1, _08004944 @ =gUnknown_20204B4
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	strh r2, [r0, 0x6]
	movs r0, 0
	b _0800494A
	.align 2, 0
_08004944: .4byte gUnknown_20204B4
_08004948:
	movs r0, 0x1
_0800494A:
	pop {r1}
	bx r1
	thumb_func_end sub_80048BC

	thumb_func_start sub_8004950
sub_8004950: @ 8004950
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r0, r1, 24
	cmp r0, 0x7
	bhi _08004A2C
	lsls r0, 2
	ldr r1, _08004968 @ =_0800496C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08004968: .4byte _0800496C
	.align 2, 0
_0800496C:
	.4byte _0800498C
	.4byte _080049A0
	.4byte _080049B4
	.4byte _080049C8
	.4byte _080049DC
	.4byte _080049F0
	.4byte _08004A04
	.4byte _08004A18
_0800498C:
	ldr r0, _0800499C @ =gUnknown_20204B4
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	b _08004A2E
	.align 2, 0
_0800499C: .4byte gUnknown_20204B4
_080049A0:
	ldr r0, _080049B0 @ =gUnknown_20204B4
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	b _08004A2E
	.align 2, 0
_080049B0: .4byte gUnknown_20204B4
_080049B4:
	ldr r0, _080049C4 @ =gUnknown_20204B4
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x2]
	b _08004A2E
	.align 2, 0
_080049C4: .4byte gUnknown_20204B4
_080049C8:
	ldr r0, _080049D8 @ =gUnknown_20204B4
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x3]
	b _08004A2E
	.align 2, 0
_080049D8: .4byte gUnknown_20204B4
_080049DC:
	ldr r0, _080049EC @ =gUnknown_20204B4
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x4]
	b _08004A2E
	.align 2, 0
_080049EC: .4byte gUnknown_20204B4
_080049F0:
	ldr r0, _08004A00 @ =gUnknown_20204B4
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x5]
	b _08004A2E
	.align 2, 0
_08004A00: .4byte gUnknown_20204B4
_08004A04:
	ldr r0, _08004A14 @ =gUnknown_20204B4
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x6]
	b _08004A2E
	.align 2, 0
_08004A14: .4byte gUnknown_20204B4
_08004A18:
	ldr r0, _08004A28 @ =gUnknown_20204B4
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r0, 0x8
	adds r1, r0
	ldr r0, [r1]
	b _08004A2E
	.align 2, 0
_08004A28: .4byte gUnknown_20204B4
_08004A2C:
	movs r0, 0
_08004A2E:
	pop {r1}
	bx r1
	thumb_func_end sub_8004950

	thumb_func_start sub_8004A34
sub_8004A34: @ 8004A34
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r3, 0
	ldr r2, _08004A5C @ =gUnknown_20204B4
	movs r1, 0x1F
_08004A40:
	ldrb r0, [r2]
	cmp r0, r4
	bne _08004A4C
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
_08004A4C:
	adds r2, 0xC
	subs r1, 0x1
	cmp r1, 0
	bge _08004A40
	adds r0, r3, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08004A5C: .4byte gUnknown_20204B4
	thumb_func_end sub_8004A34

	.align 2, 0 @ Don't pad with nop.
