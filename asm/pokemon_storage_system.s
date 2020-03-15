	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	@ file boundary?

	thumb_func_start sub_8096BE4
sub_8096BE4: @ 8096BE4
	ldr r3, _08096BF4 @ =gUnknown_203982C
	str r0, [r3]
	str r1, [r0]
	movs r1, 0
	strb r2, [r0, 0x5]
	strb r1, [r0, 0x4]
	bx lr
	.align 2, 0
_08096BF4: .4byte gUnknown_203982C
	thumb_func_end sub_8096BE4

	thumb_func_start sub_8096BF8
sub_8096BF8: @ 8096BF8
	push {r4,r5,lr}
	ldr r2, _08096C3C @ =gUnknown_203982C
	ldr r1, [r2]
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _08096C36
	movs r4, 0
	ldrb r1, [r1, 0x4]
	cmp r4, r1
	bcs _08096C2E
	adds r5, r2, 0
_08096C0E:
	ldr r0, [r5]
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 2
	ldr r0, [r0]
	adds r0, r1
	ldr r1, [r0, 0x10]
	bl _call_via_r1
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, [r5]
	ldrb r0, [r0, 0x4]
	cmp r4, r0
	bcc _08096C0E
_08096C2E:
	ldr r0, _08096C3C @ =gUnknown_203982C
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x4]
_08096C36:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08096C3C: .4byte gUnknown_203982C
	thumb_func_end sub_8096BF8

	thumb_func_start sub_8096C40
sub_8096C40: @ 8096C40
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r9, r0
	mov r10, r3
	ldr r0, [sp, 0x24]
	ldr r3, [sp, 0x28]
	ldr r4, [sp, 0x2C]
	ldr r5, [sp, 0x30]
	ldr r6, [sp, 0x34]
	lsls r1, 16
	lsrs r1, 16
	mov r12, r1
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp]
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r3, 16
	lsrs r3, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _08096CC0 @ =gUnknown_203982C
	ldr r2, [r0]
	ldrb r0, [r2, 0x4]
	adds r1, r0, 0
	ldrb r7, [r2, 0x5]
	cmp r1, r7
	bcs _08096CC8
	adds r0, 0x1
	strb r0, [r2, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r1, [r2]
	adds r1, r0
	lsls r0, r4, 1
	strh r0, [r1, 0x8]
	ldr r2, [sp]
	lsls r0, r2, 5
	add r0, r12
	lsls r0, 1
	add r0, r9
	str r0, [r1, 0x4]
	adds r0, r3, 0
	muls r0, r6
	add r0, r8
	lsls r0, 1
	add r0, r10
	str r0, [r1]
	strh r5, [r1, 0xC]
	strh r6, [r1, 0xA]
	ldr r0, _08096CC4 @ =sub_8096CDC
	str r0, [r1, 0x10]
	movs r0, 0x1
	b _08096CCA
	.align 2, 0
_08096CC0: .4byte gUnknown_203982C
_08096CC4: .4byte sub_8096CDC
_08096CC8:
	movs r0, 0
_08096CCA:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8096C40

	thumb_func_start sub_8096CDC
sub_8096CDC: @ 8096CDC
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0
	b _08096D06
_08096CE4:
	ldr r0, [r4]
	ldr r1, [r4, 0x4]
	ldrh r2, [r4, 0x8]
	lsrs r2, 1
	bl CpuSet
	ldr r0, [r4, 0x4]
	adds r0, 0x40
	str r0, [r4, 0x4]
	ldrh r1, [r4, 0xA]
	lsls r1, 1
	ldr r0, [r4]
	adds r0, r1
	str r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_08096D06:
	ldrh r0, [r4, 0xC]
	cmp r5, r0
	bcc _08096CE4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8096CDC

	thumb_func_start sub_8096D14
sub_8096D14: @ 8096D14
	push {r4-r7,lr}
	mov r12, r0
	ldr r0, [sp, 0x14]
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r4, r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _08096D60 @ =gUnknown_203982C
	ldr r2, [r0]
	ldrb r0, [r2, 0x4]
	adds r1, r0, 0
	ldrb r7, [r2, 0x5]
	cmp r1, r7
	bcs _08096D68
	adds r0, 0x1
	strb r0, [r2, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r1, [r2]
	adds r1, r0
	lsls r0, r3, 1
	strh r0, [r1, 0x8]
	lsls r0, r4, 5
	adds r0, r6
	lsls r0, 1
	add r0, r12
	str r0, [r1, 0x4]
	strh r5, [r1, 0xC]
	ldr r0, _08096D64 @ =sub_8096D70
	str r0, [r1, 0x10]
	movs r0, 0x1
	b _08096D6A
	.align 2, 0
_08096D60: .4byte gUnknown_203982C
_08096D64: .4byte sub_8096D70
_08096D68:
	movs r0, 0
_08096D6A:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8096D14

	thumb_func_start sub_8096D70
sub_8096D70: @ 8096D70
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r6, r0, 0
	movs r0, 0
	ldrh r1, [r6, 0xC]
	cmp r0, r1
	bcs _08096DFE
	movs r7, 0x80
	lsls r7, 5
	mov r5, sp
	ldr r2, _08096DBC @ =0x040000d4
	mov r8, r2
	movs r1, 0x81
	lsls r1, 24
	mov r10, r1
_08096D96:
	ldr r2, [r6, 0x4]
	ldrh r3, [r6, 0x8]
	mov r12, r2
	adds r0, 0x1
	mov r9, r0
	cmp r3, r7
	bhi _08096DC0
	movs r0, 0
	strh r0, [r5]
	mov r2, sp
	mov r0, r8
	str r2, [r0]
	mov r1, r12
	str r1, [r0, 0x4]
	lsrs r0, r3, 1
	mov r2, r10
	orrs r0, r2
	mov r1, r8
	b _08096DE8
	.align 2, 0
_08096DBC: .4byte 0x040000d4
_08096DC0:
	movs r4, 0
	strh r4, [r5]
	ldr r1, _08096E10 @ =0x040000d4
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _08096E14 @ =0x81000800
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r7
	subs r3, r7
	cmp r3, r7
	bhi _08096DC0
	strh r4, [r5]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r10
	orrs r0, r2
_08096DE8:
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, r12
	adds r0, 0x40
	str r0, [r6, 0x4]
	mov r1, r9
	lsls r0, r1, 16
	lsrs r0, 16
	ldrh r2, [r6, 0xC]
	cmp r0, r2
	bcc _08096D96
_08096DFE:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096E10: .4byte 0x040000d4
_08096E14: .4byte 0x81000800
	thumb_func_end sub_8096D70

	.align 2, 0 @ Don't pad with nop.
