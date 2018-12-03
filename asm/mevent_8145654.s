	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8146980
sub_8146980: @ 8146980
	push {r4-r6,lr}
	movs r5, 0
	ldr r4, =gUnknown_203F3CC
	ldr r1, [r4]
	movs r2, 0xE7
	lsls r2, 1
	adds r0, r1, r2
	adds r1, 0x4
	movs r2, 0x28
	bl memcpy
	ldr r0, [r4]
	movs r3, 0xFB
	lsls r3, 1
	adds r1, r0, r3
	movs r0, 0xFF
	strb r0, [r1]
	adds r6, r4, 0
_081469A4:
	ldr r2, [r6]
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r4, r1, r5
	adds r0, r4, r2
	ldr r3, =0x000001f7
	adds r0, r3
	adds r1, r2
	adds r1, 0x2C
	movs r2, 0x28
	bl memcpy
	ldr r0, [r6]
	ldr r1, =0x0000021f
	adds r0, r1
	adds r0, r4
	movs r1, 0xFF
	strb r1, [r0]
	cmp r5, 0x7
	bls _081469E8
	ldr r1, [r6]
	ldr r2, =0x000001f7
	adds r0, r1, r2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _081469E8
	movs r3, 0xE2
	lsls r3, 1
	adds r1, r3
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_081469E8:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x9
	bls _081469A4
	ldr r2, =gUnknown_203F3CC
	ldr r1, [r2]
	movs r4, 0xE5
	lsls r4, 2
	adds r1, r4
	ldr r0, =gUnknown_8468050
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldr r0, [r0]
	str r0, [r1]
	ldr r2, [r2]
	movs r5, 0xE2
	lsls r5, 1
	adds r0, r2, r5
	ldrh r1, [r0]
	movs r3, 0xE7
	lsls r3, 2
	adds r0, r2, r3
	strh r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8146980

	thumb_func_start sub_8146A30
sub_8146A30: @ 8146A30
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	movs r5, 0
	ldr r6, =gUnknown_203F3CC
	ldr r0, [r6]
	movs r7, 0xE4
	lsls r7, 1
	adds r0, r7
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r6]
	movs r4, 0xE5
	lsls r4, 1
	adds r0, r4
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r6]
	adds r0, r7
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r4, [r6]
	movs r0, 0xE7
	lsls r0, 1
	mov r8, r0
	add r4, r8
	movs r0, 0x3
	movs r1, 0x2
	bl GetFontAttribute
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x3
	adds r1, r4, 0
	bl GetStringWidth
	movs r1, 0xE0
	subs r1, r0
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	cmp r1, 0
	bge _08146AA0
	movs r1, 0
_08146AA0:
	ldr r4, [r6]
	adds r0, r4, r7
	ldrb r0, [r0]
	lsls r2, r1, 24
	lsrs r2, 24
	movs r3, 0xDE
	lsls r3, 1
	adds r1, r4, r3
	ldr r1, [r1]
	ldrb r1, [r1]
	lsls r1, 28
	lsrs r1, 28
	lsls r3, r1, 1
	adds r3, r1
	ldr r1, =gUnknown_8468038
	adds r3, r1
	str r3, [sp]
	str r5, [sp, 0x4]
	add r4, r8
	str r4, [sp, 0x8]
	movs r1, 0x3
	movs r3, 0x6
	bl box_print
_08146AD0:
	ldr r6, =gUnknown_203F3CC
	ldr r4, [r6]
	movs r1, 0xE5
	lsls r1, 1
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r3, r5, 4
	adds r3, 0x2
	lsls r3, 24
	lsrs r3, 24
	movs r2, 0xDE
	lsls r2, 1
	adds r1, r4, r2
	ldr r1, [r1]
	ldrb r1, [r1]
	lsrs r1, 4
	lsls r2, r1, 1
	adds r2, r1
	ldr r1, =gUnknown_8468038
	adds r2, r1
	str r2, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r5
	ldr r2, =0x000001f7
	adds r1, r2
	adds r4, r1
	str r4, [sp, 0x8]
	movs r1, 0x3
	movs r2, 0
	bl box_print
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x9
	bls _08146AD0
	ldr r0, [r6]
	movs r3, 0xE4
	lsls r3, 1
	adds r0, r3
	ldrb r0, [r0]
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r0, [r6]
	movs r1, 0xE5
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8146A30

	thumb_func_start sub_8146B58
sub_8146B58: @ 8146B58
	push {r4-r6,lr}
	ldr r0, =gUnknown_203F3CC
	ldr r1, [r0]
	movs r2, 0xE1
	lsls r2, 1
	adds r0, r1, r2
	ldrb r0, [r0]
	lsrs r4, r0, 1
	lsls r4, 8
	ldr r6, =0x000001c3
	adds r0, r1, r6
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08146B98
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0x1
	bl ChangeBgY
	movs r0, 0x3
	adds r1, r4, 0
	movs r2, 0x1
	bl ChangeBgY
	b _08146BAC
	.pool
_08146B98:
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0x2
	bl ChangeBgY
	movs r0, 0x3
	adds r1, r4, 0
	movs r2, 0x2
	bl ChangeBgY
_08146BAC:
	ldr r3, =gUnknown_203F3CC
	ldr r0, [r3]
	ldr r2, =0x000001c3
	adds r5, r0, r2
	ldrb r4, [r5]
	lsrs r1, r4, 1
	movs r6, 0xE1
	lsls r6, 1
	adds r0, r6
	ldrb r0, [r0]
	lsrs r0, 1
	adds r1, r0
	lsls r1, 1
	movs r6, 0x1
	adds r0, r6, 0
	ands r0, r4
	orrs r0, r1
	strb r0, [r5]
	ldr r1, [r3]
	adds r2, r1, r2
	ldrb r2, [r2]
	lsrs r0, r2, 1
	cmp r0, 0xF
	bls _08146C24
	adds r0, r6, 0
	ands r0, r2
	cmp r0, 0
	beq _08146BF8
	movs r0, 0xE3
	lsls r0, 1
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	b _08146C02
	.pool
_08146BF8:
	movs r2, 0xE3
	lsls r2, 1
	adds r1, r2
	ldrh r0, [r1]
	subs r0, 0x1
_08146C02:
	strh r0, [r1]
	ldr r0, [r3]
	movs r6, 0xE1
	lsls r6, 1
	adds r2, r0, r6
	ldrb r1, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	ldr r1, =0x000001c3
	adds r2, r0, r1
	ldrb r1, [r2]
	movs r0, 0x1
	ands r0, r1
	strb r0, [r2]
_08146C24:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8146B58

	.align 2, 0 @ Don't pad with nop.
