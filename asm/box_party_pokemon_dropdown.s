	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F7AD8
sub_80F7AD8: @ 80F7AD8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r6, _080F7B24 @ =gUnknown_203ABE4
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 4
	bl Alloc
	str r0, [r6]
	ldr r5, _080F7B28 @ =gUnknown_203ABE8
	movs r1, 0
	cmp r0, 0
	beq _080F7AF6
	adds r1, r4, 0
_080F7AF6:
	strh r1, [r5]
	movs r2, 0
	cmp r2, r1
	bcs _080F7B1E
	movs r3, 0
	adds r4, r5, 0
_080F7B02:
	ldr r0, [r6]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 4
	adds r1, r0
	str r3, [r1, 0x18]
	adds r1, 0x2C
	strb r3, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r4]
	cmp r2, r0
	bcc _080F7B02
_080F7B1E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F7B24: .4byte gUnknown_203ABE4
_080F7B28: .4byte gUnknown_203ABE8
	thumb_func_end sub_80F7AD8

	thumb_func_start sub_80F7B2C
sub_80F7B2C: @ 80F7B2C
	push {lr}
	ldr r0, _080F7B3C @ =gUnknown_203ABE4
	ldr r0, [r0]
	bl Free
	pop {r0}
	bx r0
	.align 2, 0
_080F7B3C: .4byte gUnknown_203ABE4
	thumb_func_end sub_80F7B2C

	thumb_func_start sub_80F7B40
sub_80F7B40: @ 80F7B40
	push {r4,r5,lr}
	movs r4, 0
	ldr r0, _080F7B78 @ =gUnknown_203ABE8
	ldrh r0, [r0]
	cmp r4, r0
	bge _080F7B70
	movs r5, 0
_080F7B4E:
	ldr r0, _080F7B7C @ =gUnknown_203ABE4
	ldr r0, [r0]
	adds r0, r5, r0
	adds r0, 0x2C
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080F7B64
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80F7E54
_080F7B64:
	adds r5, 0x30
	adds r4, 0x1
	ldr r0, _080F7B78 @ =gUnknown_203ABE8
	ldrh r0, [r0]
	cmp r4, r0
	blt _080F7B4E
_080F7B70:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F7B78: .4byte gUnknown_203ABE8
_080F7B7C: .4byte gUnknown_203ABE4
	thumb_func_end sub_80F7B40

	thumb_func_start sub_80F7B80
sub_80F7B80: @ 80F7B80
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r4, r2, 0
	ldr r2, [sp, 0x24]
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r3, 16
	lsrs r3, 16
	mov r10, r3
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp]
	ldr r0, _080F7C18 @ =gUnknown_203ABE8
	ldrh r0, [r0]
	cmp r6, r0
	bcs _080F7C68
	ldr r0, _080F7C1C @ =gUnknown_203ABE4
	mov r9, r0
	ldr r0, [r0]
	lsls r1, r6, 1
	mov r8, r1
	adds r5, r1, r6
	lsls r5, 4
	adds r0, r5, r0
	movs r1, 0
	str r1, [r0, 0x18]
	str r4, [r0, 0x1C]
	adds r0, 0x2B
	strb r7, [r0]
	mov r2, r9
	ldr r0, [r2]
	adds r0, r5, r0
	mov r3, r10
	strh r3, [r0, 0x24]
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r0, 0x26]
	adds r0, r7, 0
	movs r1, 0x3
	bl GetBgAttribute
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r7, 0
	movs r1, 0x9
	bl GetBgAttribute
	lsls r0, 16
	lsrs r0, 16
	mov r2, r9
	ldr r1, [r2]
	adds r5, r1
	ldr r2, _080F7C20 @ =gUnknown_841F4B4
	lsls r4, 2
	lsls r1, r0, 4
	adds r4, r1
	adds r4, r2
	ldrh r1, [r4]
	strh r1, [r5, 0x20]
	ldrh r1, [r4, 0x2]
	strh r1, [r5, 0x22]
	mov r2, r8
	cmp r0, 0
	beq _080F7C24
	adds r1, r5, 0
	adds r1, 0x2A
	movs r0, 0x1
	b _080F7C2A
	.align 2, 0
_080F7C18: .4byte gUnknown_203ABE8
_080F7C1C: .4byte gUnknown_203ABE4
_080F7C20: .4byte gUnknown_841F4B4
_080F7C24:
	adds r1, r5, 0
	adds r1, 0x2A
	movs r0, 0x2
_080F7C2A:
	strb r0, [r1]
	ldr r4, _080F7C78 @ =gUnknown_203ABE4
	ldr r1, [r4]
	adds r2, r6
	lsls r2, 4
	adds r1, r2, r1
	adds r0, r1, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	mov r3, r10
	muls r3, r0
	movs r0, 0
	strh r3, [r1, 0x28]
	mov r3, r10
	strh r3, [r1, 0x10]
	mov r5, sp
	ldrh r5, [r5]
	strh r5, [r1, 0x12]
	strh r0, [r1, 0xC]
	strh r0, [r1, 0xE]
	strh r0, [r1, 0x14]
	strh r0, [r1, 0x16]
	adds r0, r1, 0
	adds r0, 0xC
	ldm r0!, {r3,r5,r6}
	stm r1!, {r3,r5,r6}
	ldr r0, [r4]
	adds r2, r0
	adds r2, 0x2C
	movs r0, 0x1
	strb r0, [r2]
_080F7C68:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F7C78: .4byte gUnknown_203ABE4
	thumb_func_end sub_80F7B80

	thumb_func_start sub_80F7C7C
sub_80F7C7C: @ 80F7C7C
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080F7CA4 @ =gUnknown_203ABE8
	ldrh r0, [r0]
	cmp r2, r0
	bcs _080F7CA0
	ldr r0, _080F7CA8 @ =gUnknown_203ABE4
	ldr r1, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 4
	adds r0, r1
	str r3, [r0, 0x18]
	adds r0, 0x2C
	movs r1, 0x1
	strb r1, [r0]
_080F7CA0:
	pop {r0}
	bx r0
	.align 2, 0
_080F7CA4: .4byte gUnknown_203ABE8
_080F7CA8: .4byte gUnknown_203ABE4
	thumb_func_end sub_80F7C7C

	thumb_func_start sub_80F7CAC
sub_80F7CAC: @ 80F7CAC
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r0, _080F7CE0 @ =gUnknown_203ABE8
	ldrh r0, [r0]
	cmp r3, r0
	bcs _080F7CD8
	ldr r0, _080F7CE4 @ =gUnknown_203ABE4
	ldr r1, [r0]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 4
	adds r0, r1
	strh r4, [r0, 0x14]
	strh r2, [r0, 0x16]
	adds r0, 0x2C
	movs r1, 0x1
	strb r1, [r0]
_080F7CD8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F7CE0: .4byte gUnknown_203ABE8
_080F7CE4: .4byte gUnknown_203ABE4
	thumb_func_end sub_80F7CAC

	thumb_func_start sub_80F7CE8
sub_80F7CE8: @ 80F7CE8
	push {r4-r6,lr}
	ldr r4, [sp, 0x10]
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _080F7D28 @ =gUnknown_203ABE8
	ldrh r0, [r0]
	cmp r5, r0
	bcs _080F7D22
	ldr r0, _080F7D2C @ =gUnknown_203ABE4
	ldr r1, [r0]
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 4
	adds r0, r1
	strh r6, [r0, 0xC]
	strh r2, [r0, 0xE]
	strh r3, [r0, 0x10]
	strh r4, [r0, 0x12]
	adds r0, 0x2C
	movs r1, 0x1
	strb r1, [r0]
_080F7D22:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F7D28: .4byte gUnknown_203ABE8
_080F7D2C: .4byte gUnknown_203ABE4
	thumb_func_end sub_80F7CE8

	thumb_func_start sub_80F7D30
sub_80F7D30: @ 80F7D30
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r0, _080F7D5C @ =gUnknown_203ABE8
	ldrh r0, [r0]
	cmp r5, r0
	bcc _080F7D48
	b _080F7E4A
_080F7D48:
	ldr r4, _080F7D60 @ =gUnknown_203ABE4
	lsls r2, r5, 1
	cmp r1, 0x5
	bls _080F7D52
	b _080F7E3C
_080F7D52:
	lsls r0, r1, 2
	ldr r1, _080F7D64 @ =_080F7D68
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F7D5C: .4byte gUnknown_203ABE8
_080F7D60: .4byte gUnknown_203ABE4
_080F7D64: .4byte _080F7D68
	.align 2, 0
_080F7D68:
	.4byte _080F7D80
	.4byte _080F7DA0
	.4byte _080F7DC4
	.4byte _080F7DE4
	.4byte _080F7E08
	.4byte _080F7E24
_080F7D80:
	ldr r4, _080F7D9C @ =gUnknown_203ABE4
	ldr r0, [r4]
	lsls r3, r5, 1
	adds r1, r3, r5
	lsls r1, 4
	adds r1, r0
	lsls r2, r6, 24
	asrs r2, 24
	ldrh r0, [r1, 0x14]
	adds r0, r2
	strh r0, [r1, 0x14]
	ldrh r0, [r1, 0x10]
	subs r0, r2
	b _080F7DBA
	.align 2, 0
_080F7D9C: .4byte gUnknown_203ABE4
_080F7DA0:
	ldr r4, _080F7DC0 @ =gUnknown_203ABE4
	ldr r0, [r4]
	lsls r3, r5, 1
	adds r1, r3, r5
	lsls r1, 4
	adds r1, r0
	lsls r2, r6, 24
	asrs r2, 24
	ldrh r0, [r1, 0xC]
	adds r0, r2
	strh r0, [r1, 0xC]
	ldrh r0, [r1, 0x10]
	adds r0, r2
_080F7DBA:
	strh r0, [r1, 0x10]
	adds r2, r3, 0
	b _080F7E3C
	.align 2, 0
_080F7DC0: .4byte gUnknown_203ABE4
_080F7DC4:
	ldr r4, _080F7DE0 @ =gUnknown_203ABE4
	ldr r0, [r4]
	lsls r3, r5, 1
	adds r1, r3, r5
	lsls r1, 4
	adds r1, r0
	lsls r2, r6, 24
	asrs r2, 24
	ldrh r0, [r1, 0x16]
	adds r0, r2
	strh r0, [r1, 0x16]
	ldrh r0, [r1, 0x12]
	subs r0, r2
	b _080F7DFE
	.align 2, 0
_080F7DE0: .4byte gUnknown_203ABE4
_080F7DE4:
	ldr r4, _080F7E04 @ =gUnknown_203ABE4
	ldr r0, [r4]
	lsls r3, r5, 1
	adds r1, r3, r5
	lsls r1, 4
	adds r1, r0
	lsls r2, r6, 24
	asrs r2, 24
	ldrh r0, [r1, 0xE]
	subs r0, r2
	strh r0, [r1, 0xE]
	ldrh r0, [r1, 0x12]
	adds r0, r2
_080F7DFE:
	strh r0, [r1, 0x12]
	adds r2, r3, 0
	b _080F7E3C
	.align 2, 0
_080F7E04: .4byte gUnknown_203ABE4
_080F7E08:
	ldr r3, _080F7E20 @ =gUnknown_203ABE4
	ldr r0, [r3]
	lsls r2, r5, 1
	adds r1, r2, r5
	lsls r1, 4
	adds r1, r0
	lsls r0, r6, 24
	asrs r0, 24
	ldrh r4, [r1, 0x14]
	adds r0, r4
	strh r0, [r1, 0x14]
	b _080F7E3A
	.align 2, 0
_080F7E20: .4byte gUnknown_203ABE4
_080F7E24:
	ldr r3, _080F7E50 @ =gUnknown_203ABE4
	ldr r0, [r3]
	lsls r2, r5, 1
	adds r1, r2, r5
	lsls r1, 4
	adds r1, r0
	lsls r0, r6, 24
	asrs r0, 24
	ldrh r4, [r1, 0x16]
	adds r0, r4
	strh r0, [r1, 0x16]
_080F7E3A:
	adds r4, r3, 0
_080F7E3C:
	ldr r0, [r4]
	adds r1, r2, r5
	lsls r1, 4
	adds r1, r0
	adds r1, 0x2C
	movs r0, 0x1
	strb r0, [r1]
_080F7E4A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F7E50: .4byte gUnknown_203ABE4
	thumb_func_end sub_80F7D30

	thumb_func_start sub_80F7E54
sub_80F7E54: @ 80F7E54
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r6, r2, 0
	ldr r0, _080F7E94 @ =gUnknown_203ABE8
	ldrh r0, [r0]
	cmp r2, r0
	bcs _080F7E8E
	ldr r5, _080F7E98 @ =gUnknown_203ABE4
	ldr r0, [r5]
	lsls r1, r2, 1
	adds r1, r2
	lsls r4, r1, 4
	adds r0, r4, r0
	ldr r0, [r0, 0x18]
	cmp r0, 0
	beq _080F7E7C
	adds r0, r2, 0
	bl sub_80F7E9C
_080F7E7C:
	adds r0, r6, 0
	bl sub_80F7F34
	ldr r1, [r5]
	adds r1, r4, r1
	adds r0, r1, 0
	adds r0, 0xC
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
_080F7E8E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F7E94: .4byte gUnknown_203ABE8
_080F7E98: .4byte gUnknown_203ABE4
	thumb_func_end sub_80F7E54

	thumb_func_start sub_80F7E9C
sub_80F7E9C: @ 80F7E9C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r4, _080F7F30 @ =gUnknown_203ABE4
	ldr r1, [r4]
	lsls r5, r0, 1
	adds r0, r5, r0
	lsls r0, 4
	adds r0, r1
	adds r1, r0, 0
	adds r1, 0x2A
	ldrb r3, [r1]
	ldrh r1, [r0, 0x20]
	adds r2, r3, 0
	muls r2, r1
	mov r9, r2
	movs r6, 0xA
	ldrsh r1, [r0, r6]
	mov r2, r9
	muls r2, r1
	ldr r1, [r0, 0x18]
	adds r1, r2
	movs r6, 0x8
	ldrsh r2, [r0, r6]
	muls r2, r3
	adds r7, r1, r2
	movs r6, 0
	ldrh r0, [r0, 0x6]
	cmp r6, r0
	bge _080F7F20
	mov r10, r4
_080F7EE6:
	mov r0, r10
	ldr r1, [r0]
	mov r2, r8
	adds r4, r5, r2
	lsls r4, 4
	adds r1, r4, r1
	adds r0, r1, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	ldrb r2, [r1, 0x8]
	ldrb r3, [r1, 0xA]
	adds r3, r6
	lsls r3, 24
	lsrs r3, 24
	ldrb r1, [r1, 0x4]
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	adds r1, r7, 0
	bl CopyToBgTilemapBufferRect
	add r7, r9
	adds r6, 0x1
	mov r1, r10
	ldr r0, [r1]
	adds r4, r0
	ldrh r4, [r4, 0x6]
	cmp r6, r4
	blt _080F7EE6
_080F7F20:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F7F30: .4byte gUnknown_203ABE4
	thumb_func_end sub_80F7E9C

	thumb_func_start sub_80F7F34
sub_80F7F34: @ 80F7F34
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r4, _080F7FC8 @ =gUnknown_203ABE4
	ldr r1, [r4]
	lsls r5, r0, 1
	adds r0, r5, r0
	lsls r0, 4
	adds r0, r1
	adds r1, r0, 0
	adds r1, 0x2A
	ldrb r3, [r1]
	ldrh r1, [r0, 0x24]
	adds r2, r3, 0
	muls r2, r1
	mov r9, r2
	movs r6, 0xE
	ldrsh r1, [r0, r6]
	mov r2, r9
	muls r2, r1
	ldr r1, [r0, 0x1C]
	adds r1, r2
	movs r6, 0xC
	ldrsh r2, [r0, r6]
	muls r2, r3
	adds r7, r1, r2
	movs r6, 0
	ldrh r0, [r0, 0x12]
	cmp r6, r0
	bge _080F7FB8
	mov r10, r4
_080F7F7E:
	mov r0, r10
	ldr r1, [r0]
	mov r2, r8
	adds r4, r5, r2
	lsls r4, 4
	adds r1, r4, r1
	adds r0, r1, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	ldrb r2, [r1, 0x14]
	ldrb r3, [r1, 0x16]
	adds r3, r6
	lsls r3, 24
	lsrs r3, 24
	ldrb r1, [r1, 0x10]
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	adds r1, r7, 0
	bl CopyToBgTilemapBufferRect
	add r7, r9
	adds r6, 0x1
	mov r1, r10
	ldr r0, [r1]
	adds r4, r0
	ldrh r4, [r4, 0x12]
	cmp r6, r4
	blt _080F7F7E
_080F7FB8:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F7FC8: .4byte gUnknown_203ABE4
	thumb_func_end sub_80F7F34

	.align 2, 0 @ Don't pad with nop.
