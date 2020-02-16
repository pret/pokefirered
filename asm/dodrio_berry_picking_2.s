	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

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
	bl RfuPrepareSend0x2f00
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
	ldr r4, _0815A98C @ =gRecvCmds
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
_0815A98C: .4byte gRecvCmds
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
	bl RfuPrepareSend0x2f00
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
	ldr r3, _0815AB2C @ =gRecvCmds
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
_0815AB2C: .4byte gRecvCmds
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
	bl RfuPrepareSend0x2f00
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
	ldr r3, _0815AB88 @ =gRecvCmds
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
_0815AB88: .4byte gRecvCmds
_0815AB8C:
	ldr r0, [r1, 0x4]
_0815AB8E:
	pop {r1}
	bx r1
	thumb_func_end sub_815AB60

	.align 2, 0 @ Don't pad with nop.
