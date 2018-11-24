	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start BlendPalette
BlendPalette: @ 8045274
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r1, 16
	lsrs r1, 16
	mov r12, r1
	lsls r2, 24
	lsrs r7, r2, 24
	mov r0, sp
	strh r3, [r0]
	movs r6, 0
	cmp r6, r12
	bcs _080452FA
	ldr r0, _0804530C @ =gPlttBufferUnfaded
	mov r10, r0
	ldr r1, _08045310 @ =gPlttBufferFaded
	mov r9, r1
_080452A2:
	mov r0, r8
	adds r5, r6, r0
	lsls r5, 16
	lsrs r5, 15
	mov r1, r10
	adds r0, r5, r1
	ldr r3, [r0]
	lsls r4, r3, 27
	lsls r2, r3, 22
	lsls r3, 17
	add r5, r9
	lsrs r4, 27
	ldr r1, [sp]
	lsls r0, r1, 27
	lsrs r0, 27
	subs r0, r4
	muls r0, r7
	asrs r0, 4
	adds r4, r0
	lsrs r2, 27
	lsls r0, r1, 22
	lsrs r0, 27
	subs r0, r2
	muls r0, r7
	asrs r0, 4
	adds r2, r0
	lsls r2, 5
	orrs r4, r2
	lsrs r3, 27
	lsls r1, 17
	lsrs r1, 27
	subs r1, r3
	adds r0, r1, 0
	muls r0, r7
	asrs r0, 4
	adds r3, r0
	lsls r3, 10
	orrs r4, r3
	strh r4, [r5]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, r12
	bcc _080452A2
_080452FA:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804530C: .4byte gPlttBufferUnfaded
_08045310: .4byte gPlttBufferFaded
	thumb_func_end BlendPalette

	thumb_func_start sub_8045314
sub_8045314: @ 8045314
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r5, r0, 0
	adds r6, r2, 0
	adds r4, r3, 0
	lsls r1, 16
	lsrs r2, r1, 16
	cmp r6, 0x10
	bne _08045342
	subs r4, 0x1
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _080453B2
_08045336:
	strh r2, [r5]
	adds r5, 0x2
	subs r4, 0x1
	cmp r4, r0
	bne _08045336
	b _080453B2
_08045342:
	movs r0, 0x1F
	movs r3, 0x1F
	mov r9, r3
	mov r7, r9
	ands r7, r2
	mov r9, r7
	lsrs r2, r1, 21
	ands r2, r0
	mov r12, r2
	lsrs r1, 26
	mov r10, r1
	mov r3, r10
	ands r3, r0
	mov r10, r3
	subs r4, 0x1
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _080453B2
	movs r7, 0x1F
	mov r8, r7
_0804536C:
	ldrh r2, [r5]
	movs r3, 0x1F
	ands r3, r2
	lsls r2, 16
	lsrs r1, r2, 21
	mov r0, r8
	ands r1, r0
	lsrs r2, 26
	ands r2, r0
	mov r7, r9
	subs r0, r7, r3
	muls r0, r6
	lsrs r0, 4
	adds r3, r0
	mov r7, r12
	subs r0, r7, r1
	muls r0, r6
	lsrs r0, 4
	adds r1, r0
	lsls r1, 5
	orrs r3, r1
	mov r1, r10
	subs r0, r1, r2
	muls r0, r6
	lsrs r0, 4
	adds r2, r0
	lsls r2, 10
	orrs r3, r2
	strh r3, [r5]
	adds r5, 0x2
	subs r4, 0x1
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	bne _0804536C
_080453B2:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8045314

	.align 2, 0 @ Don't pad with nop.
