	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_812A1FC
sub_812A1FC: @ 812A1FC
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0812A20C
	cmp r0, 0x1
	beq _0812A22C
	b _0812A236
_0812A20C:
	movs r0, 0x4
	movs r1, 0
	bl sub_812A578
	ldr r0, _0812A228 @ =gUnknown_203B0E4
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0812A236
	.align 2, 0
_0812A228: .4byte gUnknown_203B0E4
_0812A22C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0812A238
_0812A236:
	movs r0, 0x1
_0812A238:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812A1FC

	thumb_func_start sub_812A240
sub_812A240: @ 812A240
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0812A250
	cmp r0, 0x1
	beq _0812A280
	b _0812A28A
_0812A250:
	bl DynamicPlaceholderTextUtil_Reset
	bl sub_8129814
	adds r1, r0, 0
	movs r0, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r0, 0x5
	movs r1, 0
	bl sub_812A578
	ldr r0, _0812A27C @ =gUnknown_203B0E4
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0812A28A
	.align 2, 0
_0812A27C: .4byte gUnknown_203B0E4
_0812A280:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0812A28C
_0812A28A:
	movs r0, 0x1
_0812A28C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812A240

	thumb_func_start sub_812A294
sub_812A294: @ 812A294
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0812A2A4
	cmp r0, 0x1
	beq _0812A2D0
	b _0812A2DA
_0812A2A4:
	movs r0, 0x6
	movs r1, 0
	bl sub_812A578
	movs r0, 0x17
	movs r1, 0xA
	movs r2, 0x1
	bl sub_812A424
	ldr r0, _0812A2CC @ =gUnknown_203B0E4
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0812A2DA
	.align 2, 0
_0812A2CC: .4byte gUnknown_203B0E4
_0812A2D0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0812A2DC
_0812A2DA:
	movs r0, 0x1
_0812A2DC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812A294

	thumb_func_start sub_812A2E4
sub_812A2E4: @ 812A2E4
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0812A2F4
	cmp r0, 0x1
	beq _0812A320
	b _0812A32A
_0812A2F4:
	movs r0, 0x7
	movs r1, 0
	bl sub_812A578
	movs r0, 0x17
	movs r1, 0xA
	movs r2, 0x1
	bl sub_812A424
	ldr r0, _0812A31C @ =gUnknown_203B0E4
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0812A32A
	.align 2, 0
_0812A31C: .4byte gUnknown_203B0E4
_0812A320:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0812A32C
_0812A32A:
	movs r0, 0x1
_0812A32C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812A2E4

	thumb_func_start sub_812A334
sub_812A334: @ 812A334
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0812A344
	cmp r0, 0x1
	beq _0812A364
	b _0812A36E
_0812A344:
	movs r0, 0x8
	movs r1, 0
	bl sub_812A578
	ldr r0, _0812A360 @ =gUnknown_203B0E4
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0812A36E
	.align 2, 0
_0812A360: .4byte gUnknown_203B0E4
_0812A364:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0812A370
_0812A36E:
	movs r0, 0x1
_0812A370:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812A334

	thumb_func_start sub_812A378
sub_812A378: @ 812A378
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0812A388
	cmp r0, 0x1
	beq _0812A3BC
	b _0812A3C6
_0812A388:
	bl DynamicPlaceholderTextUtil_Reset
	ldr r0, _0812A3B4 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	movs r0, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r0, 0x9
	movs r1, 0
	bl sub_812A578
	ldr r0, _0812A3B8 @ =gUnknown_203B0E4
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0812A3C6
	.align 2, 0
_0812A3B4: .4byte gSaveBlock2Ptr
_0812A3B8: .4byte gUnknown_203B0E4
_0812A3BC:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0812A3C8
_0812A3C6:
	movs r0, 0x1
_0812A3C8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812A378

	thumb_func_start sub_812A3D0
sub_812A3D0: @ 812A3D0
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0812A3E0
	cmp r0, 0x1
	beq _0812A40C
	b _0812A416
_0812A3E0:
	movs r0, 0xA
	movs r1, 0
	bl sub_812A578
	movs r0, 0x17
	movs r1, 0xA
	movs r2, 0x1
	bl sub_812A424
	ldr r0, _0812A408 @ =gUnknown_203B0E4
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0812A416
	.align 2, 0
_0812A408: .4byte gUnknown_203B0E4
_0812A40C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0812A418
_0812A416:
	movs r0, 0x1
_0812A418:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812A3D0

	thumb_func_start sub_812A420
sub_812A420: @ 812A420
	movs r0, 0
	bx lr
	thumb_func_end sub_812A420

	thumb_func_start sub_812A424
sub_812A424: @ 812A424
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	lsls r0, 24
	lsls r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	ldr r4, _0812A4FC @ =0xffffff00
	ldr r2, [sp, 0xC]
	ands r2, r4
	lsrs r0, 16
	ldr r3, _0812A500 @ =0xffff00ff
	ands r2, r3
	orrs r2, r0
	lsrs r1, 8
	ldr r0, _0812A504 @ =0xff00ffff
	ands r2, r0
	orrs r2, r1
	ldr r0, _0812A508 @ =0x00ffffff
	ands r2, r0
	movs r0, 0xC0
	lsls r0, 19
	orrs r2, r0
	str r2, [sp, 0xC]
	ldr r0, [sp, 0x10]
	ands r0, r4
	movs r1, 0x4
	orrs r0, r1
	ands r0, r3
	movs r1, 0xE0
	lsls r1, 4
	orrs r0, r1
	ldr r1, _0812A50C @ =0x0000ffff
	ands r0, r1
	movs r1, 0xA4
	lsls r1, 15
	orrs r0, r1
	str r0, [sp, 0x10]
	add r0, sp, 0xC
	bl AddWindow
	adds r1, r0, 0
	ldr r6, _0812A510 @ =gUnknown_203B0E4
	ldr r0, [r6]
	movs r7, 0
	strh r1, [r0, 0x18]
	lsls r0, r1, 16
	lsrs r0, 16
	cmp r0, 0xFF
	beq _0812A4F0
	lsls r0, r1, 24
	lsrs r0, 24
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r6]
	ldrb r0, [r0, 0x18]
	bl PutWindowTilemap
	ldr r0, [r6]
	ldrb r0, [r0, 0x18]
	ldr r2, _0812A514 @ =gText_Yes
	movs r5, 0x2
	str r5, [sp]
	movs r4, 0xFF
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x8
	bl AddTextPrinterParameterized
	ldr r0, [r6]
	ldrb r0, [r0, 0x18]
	ldr r2, _0812A518 @ =gText_No
	movs r1, 0x10
	str r1, [sp]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x8
	bl AddTextPrinterParameterized
	ldr r0, [r6]
	ldrb r0, [r0, 0x18]
	movs r1, 0x1
	movs r2, 0xD
	bl DrawTextBorderOuter
	ldr r0, [r6]
	ldrb r0, [r0, 0x18]
	movs r1, 0xE
	str r1, [sp]
	str r5, [sp, 0x4]
	mov r1, r8
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl Menu_InitCursor
_0812A4F0:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812A4FC: .4byte 0xffffff00
_0812A500: .4byte 0xffff00ff
_0812A504: .4byte 0xff00ffff
_0812A508: .4byte 0x00ffffff
_0812A50C: .4byte 0x0000ffff
_0812A510: .4byte gUnknown_203B0E4
_0812A514: .4byte gText_Yes
_0812A518: .4byte gText_No
	thumb_func_end sub_812A424

	thumb_func_start sub_812A51C
sub_812A51C: @ 812A51C
	push {r4,lr}
	ldr r4, _0812A540 @ =gUnknown_203B0E4
	ldr r0, [r4]
	ldrh r0, [r0, 0x18]
	cmp r0, 0xFF
	beq _0812A53A
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl ClearStdWindowAndFrameToTransparent
	ldr r0, [r4]
	ldrb r0, [r0, 0x18]
	bl ClearWindowTilemap
_0812A53A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A540: .4byte gUnknown_203B0E4
	thumb_func_end sub_812A51C

	thumb_func_start sub_812A544
sub_812A544: @ 812A544
	push {r4,lr}
	ldr r4, _0812A564 @ =gUnknown_203B0E4
	ldr r0, [r4]
	ldrh r0, [r0, 0x18]
	cmp r0, 0xFF
	beq _0812A55E
	lsls r0, 24
	lsrs r0, 24
	bl RemoveWindow
	ldr r1, [r4]
	movs r0, 0xFF
	strh r0, [r1, 0x18]
_0812A55E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A564: .4byte gUnknown_203B0E4
	thumb_func_end sub_812A544

	thumb_func_start sub_812A568
sub_812A568: @ 812A568
	push {lr}
	bl Menu_ProcessInput
	lsls r0, 24
	asrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_812A568

	thumb_func_start sub_812A578
sub_812A578: @ 812A578
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x1C
	adds r7, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	ldr r1, _0812A624 @ =0xffffff00
	ldr r3, [sp, 0x14]
	ands r3, r1
	ldr r2, _0812A628 @ =0xffff00ff
	ands r3, r2
	movs r0, 0x80
	lsls r0, 4
	orrs r3, r0
	ldr r0, _0812A62C @ =0xff00ffff
	ands r3, r0
	movs r0, 0x80
	lsls r0, 13
	orrs r3, r0
	ldr r5, _0812A630 @ =0x00ffffff
	ands r3, r5
	movs r0, 0xA8
	lsls r0, 21
	orrs r3, r0
	str r3, [sp, 0x14]
	ldr r0, [sp, 0x18]
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	ands r0, r2
	movs r1, 0xE0
	lsls r1, 4
	orrs r0, r1
	ldr r1, _0812A634 @ =0x0000ffff
	ands r0, r1
	movs r1, 0xD4
	lsls r1, 15
	orrs r0, r1
	str r0, [sp, 0x18]
	ldr r1, _0812A638 @ =gUnknown_845AB64
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	adds r4, r0, r1
	ldrb r0, [r4, 0xA]
	cmp r0, 0
	beq _0812A5F8
	lsls r0, r3, 16
	movs r1, 0xF9
	lsls r1, 24
	adds r0, r1
	lsrs r0, 16
	ands r2, r3
	orrs r2, r0
	lsrs r1, r2, 24
	adds r1, 0x7
	lsls r1, 24
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x14]
_0812A5F8:
	add r0, sp, 0x14
	bl AddWindow
	ldr r5, _0812A63C @ =gUnknown_203B0E4
	ldr r1, [r5]
	strh r0, [r1, 0x1E]
	ldrh r0, [r1, 0x1E]
	mov r8, r0
	cmp r0, 0xFF
	beq _0812A6E2
	ldrb r0, [r4, 0x9]
	cmp r0, 0
	beq _0812A640
	adds r0, r1, 0
	adds r0, 0x22
	ldr r1, [r4]
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	ldr r0, [r5]
	adds r6, r0, 0
	adds r6, 0x22
	b _0812A642
	.align 2, 0
_0812A624: .4byte 0xffffff00
_0812A628: .4byte 0xffff00ff
_0812A62C: .4byte 0xff00ffff
_0812A630: .4byte 0x00ffffff
_0812A634: .4byte 0x0000ffff
_0812A638: .4byte gUnknown_845AB64
_0812A63C: .4byte gUnknown_203B0E4
_0812A640:
	ldr r6, [r4]
_0812A642:
	mov r0, r9
	lsls r1, r0, 8
	movs r0, 0
	movs r2, 0
	bl ChangeBgY
	mov r1, r8
	lsls r0, r1, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	adds r0, r5, 0
	bl PutWindowTilemap
	ldr r1, _0812A6AC @ =gUnknown_845AB64
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	adds r4, r0, r1
	ldrb r0, [r4, 0x4]
	cmp r0, 0x1
	bne _0812A6B0
	adds r0, r5, 0
	movs r1, 0xA
	movs r2, 0x2
	bl DrawTextBorderInner
	ldrb r3, [r4, 0x5]
	adds r3, 0x8
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4, 0x6]
	adds r0, 0x8
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	ldrb r0, [r4, 0x7]
	str r0, [sp, 0xC]
	ldrb r0, [r4, 0x8]
	str r0, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r6, 0
	bl AddTextPrinterParameterized5
	b _0812A6DA
	.align 2, 0
_0812A6AC: .4byte gUnknown_845AB64
_0812A6B0:
	adds r0, r5, 0
	movs r1, 0xA
	movs r2, 0x2
	bl DrawTextBorderOuter
	ldrb r3, [r4, 0x5]
	ldrb r0, [r4, 0x6]
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	ldrb r0, [r4, 0x7]
	str r0, [sp, 0xC]
	ldrb r0, [r4, 0x8]
	str r0, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r6, 0
	bl AddTextPrinterParameterized5
_0812A6DA:
	ldr r0, _0812A6F0 @ =gUnknown_203B0E4
	ldr r0, [r0]
	mov r1, r8
	strh r1, [r0, 0x1E]
_0812A6E2:
	add sp, 0x1C
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812A6F0: .4byte gUnknown_203B0E4
	thumb_func_end sub_812A578

	thumb_func_start sub_812A6F4
sub_812A6F4: @ 812A6F4
	push {r4,lr}
	ldr r4, _0812A724 @ =gUnknown_203B0E4
	ldr r0, [r4]
	ldrh r0, [r0, 0x1E]
	cmp r0, 0xFF
	beq _0812A712
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl ClearStdWindowAndFrameToTransparent
	ldr r0, [r4]
	ldrb r0, [r0, 0x1E]
	bl ClearWindowTilemap
_0812A712:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A724: .4byte gUnknown_203B0E4
	thumb_func_end sub_812A6F4

	thumb_func_start sub_812A728
sub_812A728: @ 812A728
	push {r4,lr}
	ldr r4, _0812A748 @ =gUnknown_203B0E4
	ldr r0, [r4]
	ldrh r0, [r0, 0x1E]
	cmp r0, 0xFF
	beq _0812A742
	lsls r0, 24
	lsrs r0, 24
	bl RemoveWindow
	ldr r1, [r4]
	movs r0, 0xFF
	strh r0, [r1, 0x1E]
_0812A742:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A748: .4byte gUnknown_203B0E4
	thumb_func_end sub_812A728

	thumb_func_start sub_812A74C
sub_812A74C: @ 812A74C
	push {lr}
	sub sp, 0x8
	adds r3, r0, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 19
	lsrs r3, 16
	lsls r1, 19
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0xE
	str r0, [sp, 0x4]
	movs r0, 0x1
	adds r1, r2, 0
	adds r2, r3, 0
	movs r3, 0x1
	bl FillWindowPixelRect
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_812A74C

	thumb_func_start sub_812A778
sub_812A778: @ 812A778
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	mov r10, r1
	ldr r1, [sp, 0x54]
	lsls r0, 16
	lsrs r5, r0, 16
	mov r9, r5
	lsls r2, 24
	lsrs r4, r2, 24
	mov r8, r4
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r1, 24
	lsrs r6, r1, 24
	cmp r4, 0
	beq _0812A7B4
	bl sub_81297DC
	adds r1, r0, 0
	subs r1, r5
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	adds r2, r4, 0
	bl sub_812A74C
_0812A7B4:
	add r0, sp, 0xC
	mov r1, r8
	strb r1, [r0]
	strb r7, [r0, 0x1]
	strb r6, [r0, 0x2]
	add r4, sp, 0x10
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x14
	strb r0, [r4, 0x1]
	movs r0, 0x8
	strb r0, [r4, 0x2]
	mov r0, sp
	adds r0, 0x13
	mov r1, r10
	bl StringCopy
	mov r0, r9
	lsls r2, r0, 27
	lsrs r2, 24
	add r1, sp, 0xC
	str r1, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r3, 0x1
	bl AddTextPrinterParameterized3
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812A778

	thumb_func_start sub_812A804
sub_812A804: @ 812A804
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4C
	movs r0, 0x2
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	bl GetCurrentKeyboardPage
	lsls r0, 24
	lsrs r2, r0, 24
	add r1, sp, 0xC
	movs r0, 0
	strb r0, [r1]
	movs r0, 0xE
	strb r0, [r1, 0x1]
	movs r0, 0xD
	strb r0, [r1, 0x2]
	cmp r2, 0x3
	beq _0812A8A0
	add r1, sp, 0x10
	movs r0, 0xFC
	strb r0, [r1]
	movs r0, 0x14
	strb r0, [r1, 0x1]
	movs r0, 0x8
	strb r0, [r1, 0x2]
	str r0, [sp, 0x40]
	str r1, [sp, 0x44]
	cmp r2, 0x2
	bne _0812A84C
	movs r1, 0x6
	str r1, [sp, 0x40]
_0812A84C:
	movs r7, 0
	movs r6, 0
	lsls r0, r2, 2
	ldr r1, _0812A89C @ =sUnionRoomKeyboardText
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	ldr r0, [sp, 0x40]
	lsls r5, r0, 24
_0812A85E:
	ldr r1, [r4]
	cmp r1, 0
	bne _0812A866
	b _0812A96C
_0812A866:
	mov r0, sp
	adds r0, 0x13
	bl StringCopy
	lsls r3, r6, 24
	lsrs r3, 24
	add r1, sp, 0xC
	str r1, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	ldr r0, [sp, 0x44]
	str r0, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0
	lsrs r2, r5, 24
	bl AddTextPrinterParameterized3
	adds r4, 0x4
	adds r7, 0x1
	adds r0, r6, 0
	adds r0, 0xC
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r7, 0x9
	ble _0812A85E
	b _0812A96C
	.align 2, 0
_0812A89C: .4byte sUnionRoomKeyboardText
_0812A8A0:
	movs r1, 0x4
	str r1, [sp, 0x40]
	movs r7, 0
	movs r6, 0
_0812A8A8:
	adds r0, r7, 0
	bl sub_81294B0
	adds r5, r0, 0
	movs r0, 0
	adds r1, r5, 0
	movs r2, 0
	bl GetStringWidth
	cmp r0, 0x28
	bgt _0812A8E6
	lsls r3, r6, 24
	lsrs r3, 24
	add r4, sp, 0xC
	str r4, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0
	movs r4, 0x80
	lsls r4, 19
	lsrs r2, r4, 24
	bl AddTextPrinterParameterized3
	adds r0, r7, 0x1
	str r0, [sp, 0x48]
	adds r6, 0xC
	mov r10, r6
	b _0812A960
_0812A8E6:
	adds r0, r5, 0
	bl StringLength_Multibyte
	adds r4, r0, 0
	mov r1, sp
	adds r1, 0x10
	str r1, [sp, 0x44]
	ldr r0, [sp, 0x40]
	lsls r0, 24
	mov r8, r0
	lsls r1, r6, 24
	mov r9, r1
	adds r0, r7, 0x1
	str r0, [sp, 0x48]
	adds r6, 0xC
	mov r10, r6
	ldr r7, [sp, 0x40]
	adds r7, 0x23
	ldr r6, [sp, 0x44]
_0812A90C:
	subs r4, 0x1
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl StringCopyN_Multibyte
	movs r0, 0
	adds r1, r6, 0
	movs r2, 0
	bl GetStringWidth
	cmp r0, 0x23
	bgt _0812A90C
	mov r1, r8
	lsrs r2, r1, 24
	mov r0, r9
	lsrs r4, r0, 24
	add r1, sp, 0xC
	str r1, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	ldr r1, [sp, 0x44]
	str r1, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0
	adds r3, r4, 0
	bl AddTextPrinterParameterized3
	adds r2, r7, 0
	add r0, sp, 0xC
	str r0, [sp]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0x4]
	ldr r0, _0812A97C @ =gUnknown_845ABE8
	str r0, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0
	adds r3, r4, 0
	bl AddTextPrinterParameterized3
_0812A960:
	ldr r7, [sp, 0x48]
	mov r4, r10
	lsls r0, r4, 16
	lsrs r6, r0, 16
	cmp r7, 0x9
	ble _0812A8A8
_0812A96C:
	add sp, 0x4C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812A97C: .4byte gUnknown_845ABE8
	thumb_func_end sub_812A804

	thumb_func_start sub_812A980
sub_812A980: @ 812A980
	push {r4,lr}
	ldr r1, _0812A9A4 @ =gUnknown_203B0E4
	ldr r2, [r1]
	ldrh r3, [r2, 0x20]
	movs r4, 0x20
	ldrsh r0, [r2, r4]
	cmp r0, 0x37
	bgt _0812A9B4
	adds r0, r3, 0
	adds r0, 0xC
	strh r0, [r2, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x37
	ble _0812A9A8
	movs r0, 0x38
	strh r0, [r2, 0x20]
	b _0812A9B4
	.align 2, 0
_0812A9A4: .4byte gUnknown_203B0E4
_0812A9A8:
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	bl sub_812ADA0
	movs r0, 0x1
	b _0812A9C0
_0812A9B4:
	ldr r0, [r1]
	movs r4, 0x20
	ldrsh r0, [r0, r4]
	bl sub_812ADF8
	movs r0, 0
_0812A9C0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812A980

	thumb_func_start sub_812A9C8
sub_812A9C8: @ 812A9C8
	push {r4,lr}
	ldr r1, _0812A9EC @ =gUnknown_203B0E4
	ldr r2, [r1]
	ldrh r3, [r2, 0x20]
	movs r4, 0x20
	ldrsh r0, [r2, r4]
	cmp r0, 0
	ble _0812A9FC
	adds r0, r3, 0
	subs r0, 0xC
	strh r0, [r2, 0x20]
	lsls r0, 16
	cmp r0, 0
	bgt _0812A9F0
	movs r0, 0
	strh r0, [r2, 0x20]
	b _0812A9FC
	.align 2, 0
_0812A9EC: .4byte gUnknown_203B0E4
_0812A9F0:
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	bl sub_812ADA0
	movs r0, 0x1
	b _0812AA08
_0812A9FC:
	ldr r0, [r1]
	movs r4, 0x20
	ldrsh r0, [r0, r4]
	bl sub_812ADF8
	movs r0, 0
_0812AA08:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812A9C8

	thumb_func_start sub_812AA10
sub_812AA10: @ 812AA10
	push {lr}
	sub sp, 0xC
	movs r0, 0x3
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0xD
	bl DrawTextBorderOuter
	ldr r0, _0812AA60 @ =gUnknown_845ABEC
	str r0, [sp]
	movs r0, 0x3
	movs r1, 0x2
	movs r2, 0xE
	movs r3, 0x5
	bl UnionRoomAndTradeMenuPrintOptions
	bl GetCurrentKeyboardPage
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xE
	str r1, [sp]
	movs r1, 0x5
	str r1, [sp, 0x4]
	str r0, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0x2
	movs r2, 0
	movs r3, 0
	bl Menu_InitCursor
	movs r0, 0x3
	bl PutWindowTilemap
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_0812AA60: .4byte gUnknown_845ABEC
	thumb_func_end sub_812AA10

	thumb_func_start sub_812AA64
sub_812AA64: @ 812AA64
	push {lr}
	movs r0, 0x3
	movs r1, 0
	bl ClearStdWindowAndFrameToTransparent
	movs r0, 0x3
	bl ClearWindowTilemap
	pop {r0}
	bx r0
	thumb_func_end sub_812AA64

	thumb_func_start sub_812AA78
sub_812AA78: @ 812AA78
	push {r4,r5,lr}
	sub sp, 0x10
	adds r5, r1, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r2, 24
	add r3, sp, 0xC
	movs r1, 0x1
	strb r1, [r3]
	lsrs r2, 23
	adds r1, r2, 0x2
	strb r1, [r3, 0x1]
	adds r1, r3, 0
	adds r2, 0x3
	strb r2, [r1, 0x2]
	lsls r4, r0, 4
	subs r4, r0
	lsls r3, r4, 16
	lsrs r3, 16
	movs r0, 0xA8
	str r0, [sp]
	movs r0, 0xF
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x11
	movs r2, 0
	bl FillWindowPixelRect
	lsls r4, 24
	lsrs r4, 24
	add r0, sp, 0xC
	str r0, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	adds r3, r4, 0
	bl AddTextPrinterParameterized3
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812AA78

	thumb_func_start sub_812AAD4
sub_812AAD4: @ 812AAD4
	push {lr}
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	movs r1, 0x82
	lsls r1, 5
	movs r0, 0
	bl SetGpuRegBits
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r1, 0xE0
	lsls r1, 8
	movs r0, 0
	bl ClearGpuRegBits
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl SetGpuRegBits
	ldr r1, _0812AB88 @ =0x000040f0
	movs r0, 0x40
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0x90
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0x3D
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0x3F
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_0812AB88: .4byte 0x000040f0
	thumb_func_end sub_812AAD4

	thumb_func_start sub_812AB8C
sub_812AB8C: @ 812AB8C
	push {r4,lr}
	ldr r4, _0812ABC8 @ =gUnknown_203B0E4
	ldr r1, [r4]
	movs r0, 0x94
	lsls r0, 1
	adds r1, r0
	movs r0, 0
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _0812ABCC @ =0x00000928
	adds r1, r0
	movs r0, 0x1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _0812ABD0 @ =0x00001128
	adds r1, r0
	movs r0, 0x3
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _0812ABD4 @ =0x00001928
	adds r1, r0
	movs r0, 0x2
	bl SetBgTilemapBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812ABC8: .4byte gUnknown_203B0E4
_0812ABCC: .4byte 0x00000928
_0812ABD0: .4byte 0x00001128
_0812ABD4: .4byte 0x00001928
	thumb_func_end sub_812AB8C

	thumb_func_start sub_812ABD8
sub_812ABD8: @ 812ABD8
	push {lr}
	sub sp, 0x8
	movs r1, 0xC0
	lsls r1, 19
	movs r0, 0
	movs r2, 0x20
	movs r3, 0x1
	bl RequestDma3Fill
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_812ABD8

	thumb_func_start sub_812AC08
sub_812AC08: @ 812AC08
	push {lr}
	sub sp, 0x4
	ldr r0, _0812AC48 @ =gUnknown_8EAA9F0
	movs r1, 0x70
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0812AC4C @ =gUnknown_845AA24
	movs r1, 0xC0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _0812AC50 @ =gUnknown_8EAAA10
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	ldr r1, _0812AC54 @ =gUnknown_8EAAA6C
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0812AC48: .4byte gUnknown_8EAA9F0
_0812AC4C: .4byte gUnknown_845AA24
_0812AC50: .4byte gUnknown_8EAAA10
_0812AC54: .4byte gUnknown_8EAAA6C
	thumb_func_end sub_812AC08

	thumb_func_start sub_812AC58
sub_812AC58: @ 812AC58
	push {lr}
	sub sp, 0x4
	ldr r0, _0812AC90 @ =gUnknown_8EA1700
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _0812AC94 @ =gUnknown_8EA1720
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	ldr r1, _0812AC98 @ =gUnknown_8EA1958
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0812AC90: .4byte gUnknown_8EA1700
_0812AC94: .4byte gUnknown_8EA1720
_0812AC98: .4byte gUnknown_8EA1958
	thumb_func_end sub_812AC58

	thumb_func_start sub_812AC9C
sub_812AC9C: @ 812AC9C
	push {lr}
	ldr r0, _0812ACB8 @ =gUnknown_845AA44
	movs r1, 0x80
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _0812ACBC @ =0x06004020
	movs r0, 0
	movs r2, 0x20
	movs r3, 0x1
	bl RequestDma3Fill
	pop {r0}
	bx r0
	.align 2, 0
_0812ACB8: .4byte gUnknown_845AA44
_0812ACBC: .4byte 0x06004020
	thumb_func_end sub_812AC9C

	thumb_func_start sub_812ACC0
sub_812ACC0: @ 812ACC0
	push {lr}
	ldr r0, _0812ACE8 @ =gUnknown_845AA64
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	pop {r0}
	bx r0
	.align 2, 0
_0812ACE8: .4byte gUnknown_845AA64
	thumb_func_end sub_812ACC0

	thumb_func_start sub_812ACEC
sub_812ACEC: @ 812ACEC
	push {lr}
	movs r0, 0x2
	bl PutWindowTilemap
	bl sub_812A804
	movs r0, 0x2
	movs r1, 0x3
	bl CopyWindowToVram
	pop {r0}
	bx r0
	thumb_func_end sub_812ACEC

	thumb_func_start sub_812AD04
sub_812AD04: @ 812AD04
	push {lr}
	movs r0, 0x1
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x1
	movs r1, 0x3
	bl CopyWindowToVram
	pop {r0}
	bx r0
	thumb_func_end sub_812AD04

	thumb_func_start sub_812AD20
sub_812AD20: @ 812AD20
	push {lr}
	movs r0, 0x3
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0xD0
	bl TextWindow_SetUserSelectedFrame
	movs r0, 0x3
	movs r1, 0xA
	movs r2, 0x20
	bl TextWindow_SetStdFrame0_WithPal
	ldr r0, _0812AD4C @ =gTMCaseMainWindowPalette
	movs r1, 0xE0
	movs r2, 0x20
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_0812AD4C: .4byte gTMCaseMainWindowPalette
	thumb_func_end sub_812AD20

	thumb_func_start sub_812AD50
sub_812AD50: @ 812AD50
	push {lr}
	sub sp, 0x10
	ldr r0, _0812AD8C @ =0xa2600001
	str r0, [sp, 0x4]
	ldr r0, _0812AD90 @ =0x04000014
	str r0, [sp]
	mov r2, sp
	movs r1, 0
	movs r0, 0x1
	strb r0, [r2, 0x8]
	mov r0, sp
	strb r1, [r0, 0x9]
	ldr r0, _0812AD94 @ =gUnknown_203B0E4
	ldr r0, [r0]
	strh r1, [r0, 0x20]
	str r1, [sp, 0xC]
	add r0, sp, 0xC
	ldr r1, _0812AD98 @ =gScanlineEffectRegBuffers
	ldr r2, _0812AD9C @ =0x010003c0
	bl CpuFastSet
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl ScanlineEffect_SetParams
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_0812AD8C: .4byte 0xa2600001
_0812AD90: .4byte 0x04000014
_0812AD94: .4byte gUnknown_203B0E4
_0812AD98: .4byte gScanlineEffectRegBuffers
_0812AD9C: .4byte 0x010003c0
	thumb_func_end sub_812AD50

	thumb_func_start sub_812ADA0
sub_812ADA0: @ 812ADA0
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r0, 16
	mov r1, sp
	strh r0, [r1]
	ldr r5, _0812ADE8 @ =gScanlineEffect
	ldrb r0, [r5, 0x14]
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 7
	ldr r4, _0812ADEC @ =gScanlineEffectRegBuffers
	adds r1, r4
	ldr r2, _0812ADF0 @ =0x01000090
	mov r0, sp
	bl CpuSet
	mov r0, sp
	adds r0, 0x2
	movs r1, 0
	strh r1, [r0]
	ldrb r2, [r5, 0x14]
	lsls r1, r2, 4
	subs r1, r2
	lsls r1, 7
	movs r2, 0x90
	lsls r2, 1
	adds r4, r2
	adds r1, r4
	ldr r2, _0812ADF4 @ =0x01000010
	bl CpuSet
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812ADE8: .4byte gScanlineEffect
_0812ADEC: .4byte gScanlineEffectRegBuffers
_0812ADF0: .4byte 0x01000090
_0812ADF4: .4byte 0x01000010
	thumb_func_end sub_812ADA0

	thumb_func_start sub_812ADF8
sub_812ADF8: @ 812ADF8
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, sp
	strh r4, [r0]
	ldr r5, _0812AE64 @ =gScanlineEffectRegBuffers
	ldr r0, _0812AE68 @ =0x01000090
	mov r9, r0
	mov r0, sp
	adds r1, r5, 0
	mov r2, r9
	bl CpuSet
	mov r0, sp
	adds r0, 0x2
	movs r6, 0
	strh r6, [r0]
	movs r2, 0x90
	lsls r2, 1
	adds r1, r5, r2
	ldr r2, _0812AE6C @ =0x01000010
	mov r8, r2
	bl CpuSet
	add r0, sp, 0x4
	strh r4, [r0]
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r5, r2
	mov r2, r9
	bl CpuSet
	mov r0, sp
	adds r0, 0x6
	strh r6, [r0]
	movs r1, 0x8A
	lsls r1, 4
	adds r5, r1
	adds r1, r5, 0
	mov r2, r8
	bl CpuSet
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812AE64: .4byte gScanlineEffectRegBuffers
_0812AE68: .4byte 0x01000090
_0812AE6C: .4byte 0x01000010
	thumb_func_end sub_812ADF8

	thumb_func_start sub_812AE70
sub_812AE70: @ 812AE70
	push {r4,r5,lr}
	movs r5, 0
	ldr r4, _0812AE9C @ =gUnknown_845AF58
_0812AE76:
	adds r0, r4, 0
	bl LoadCompressedSpriteSheet
	adds r4, 0x8
	adds r5, 0x1
	cmp r5, 0x4
	bls _0812AE76
	ldr r0, _0812AEA0 @ =gUnknown_845AF80
	bl LoadSpritePalette
	ldr r4, _0812AEA4 @ =gUnknown_203B0E8
	movs r0, 0x18
	bl Alloc
	str r0, [r4]
	cmp r0, 0
	beq _0812AEA8
	movs r0, 0x1
	b _0812AEAA
	.align 2, 0
_0812AE9C: .4byte gUnknown_845AF58
_0812AEA0: .4byte gUnknown_845AF80
_0812AEA4: .4byte gUnknown_203B0E8
_0812AEA8:
	movs r0, 0
_0812AEAA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_812AE70

	thumb_func_start sub_812AEB0
sub_812AEB0: @ 812AEB0
	push {lr}
	ldr r0, _0812AEC4 @ =gUnknown_203B0E8
	ldr r0, [r0]
	cmp r0, 0
	beq _0812AEBE
	bl Free
_0812AEBE:
	pop {r0}
	bx r0
	.align 2, 0
_0812AEC4: .4byte gUnknown_203B0E8
	thumb_func_end sub_812AEB0

	thumb_func_start sub_812AEC8
sub_812AEC8: @ 812AEC8
	push {lr}
	ldr r0, _0812AEF0 @ =gUnknown_845AFC0
	movs r1, 0xA
	movs r2, 0x18
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0812AEF4 @ =gUnknown_203B0E8
	ldr r2, [r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0812AEF8 @ =gSprites
	adds r1, r0
	str r1, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0812AEF0: .4byte gUnknown_845AFC0
_0812AEF4: .4byte gUnknown_203B0E8
_0812AEF8: .4byte gSprites
	thumb_func_end sub_812AEC8

	thumb_func_start sub_812AEFC
sub_812AEFC: @ 812AEFC
	ldr r1, _0812AF18 @ =gUnknown_203B0E8
	ldr r1, [r1]
	ldr r2, [r1]
	adds r2, 0x3E
	movs r1, 0x1
	ands r0, r1
	lsls r0, 2
	ldrb r3, [r2]
	movs r1, 0x5
	negs r1, r1
	ands r1, r3
	orrs r1, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_0812AF18: .4byte gUnknown_203B0E8
	thumb_func_end sub_812AEFC

	thumb_func_start sub_812AF1C
sub_812AF1C: @ 812AF1C
	push {r4,r5,lr}
	sub sp, 0x4
	bl GetCurrentKeyboardPage
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r5, sp
	adds r5, 0x1
	mov r0, sp
	adds r1, r5, 0
	bl sub_8129700
	cmp r4, 0x3
	beq _0812AF5C
	ldr r4, _0812AF58 @ =gUnknown_203B0E8
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
	ldr r1, [r4]
	ldr r2, [r1]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, 0xA
	strh r0, [r2, 0x20]
	ldr r2, [r1]
	b _0812AF72
	.align 2, 0
_0812AF58: .4byte gUnknown_203B0E8
_0812AF5C:
	ldr r4, _0812AF88 @ =gUnknown_203B0E8
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, 0x2
	bl StartSpriteAnim
	ldr r2, [r4]
	ldr r1, [r2]
	movs r0, 0x18
	strh r0, [r1, 0x20]
	ldr r2, [r2]
_0812AF72:
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, 0x18
	strh r0, [r2, 0x22]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812AF88: .4byte gUnknown_203B0E8
	thumb_func_end sub_812AF1C

	thumb_func_start sub_812AF8C
sub_812AF8C: @ 812AF8C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 2
	ldr r0, _0812AFB8 @ =gUnknown_845AC14 + 2
	adds r4, r0
	movs r0, 0
	bl IndexOfSpritePaletteTag
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 4
	ldr r0, _0812AFBC @ =0x01010000
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0x4
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812AFB8: .4byte gUnknown_845AC14 + 2
_0812AFBC: .4byte 0x01010000
	thumb_func_end sub_812AF8C

	thumb_func_start sub_812AFC0
sub_812AFC0: @ 812AFC0
	push {lr}
	bl GetCurrentKeyboardPage
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _0812AFE0
	ldr r0, _0812AFDC @ =gUnknown_203B0E8
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
	b _0812AFEC
	.align 2, 0
_0812AFDC: .4byte gUnknown_203B0E8
_0812AFE0:
	ldr r0, _0812AFF8 @ =gUnknown_203B0E8
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, 0x3
	bl StartSpriteAnim
_0812AFEC:
	ldr r0, _0812AFF8 @ =gUnknown_203B0E8
	ldr r1, [r0]
	movs r0, 0
	strh r0, [r1, 0x14]
	pop {r0}
	bx r0
	.align 2, 0
_0812AFF8: .4byte gUnknown_203B0E8
	thumb_func_end sub_812AFC0

	thumb_func_start sub_812AFFC
sub_812AFFC: @ 812AFFC
	push {r4,lr}
	ldr r4, _0812B00C @ =gUnknown_203B0E8
	ldr r1, [r4]
	ldrh r0, [r1, 0x14]
	cmp r0, 0x3
	bls _0812B010
_0812B008:
	movs r0, 0
	b _0812B042
	.align 2, 0
_0812B00C: .4byte gUnknown_203B0E8
_0812B010:
	adds r0, 0x1
	strh r0, [r1, 0x14]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3
	bls _0812B040
	bl GetCurrentKeyboardPage
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _0812B034
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
	b _0812B008
_0812B034:
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, 0x2
	bl StartSpriteAnim
	b _0812B008
_0812B040:
	movs r0, 0x1
_0812B042:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812AFFC

	thumb_func_start sub_812B048
sub_812B048: @ 812B048
	push {r4,r5,lr}
	ldr r0, _0812B08C @ =gUnknown_845AFE0
	movs r1, 0x4C
	movs r2, 0x98
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0812B090 @ =gUnknown_203B0E8
	ldr r2, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r4, _0812B094 @ =gSprites
	adds r1, r4
	str r1, [r2, 0x8]
	ldr r0, _0812B098 @ =gUnknown_845AFF8
	movs r1, 0x40
	movs r2, 0x98
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	str r1, [r2, 0x4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B08C: .4byte gUnknown_845AFE0
_0812B090: .4byte gUnknown_203B0E8
_0812B094: .4byte gSprites
_0812B098: .4byte gUnknown_845AFF8
	thumb_func_end sub_812B048

	thumb_func_start sub_812B09C
sub_812B09C: @ 812B09C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_81297DC
	adds r3, r0, 0
	cmp r3, 0xF
	bne _0812B0B8
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0812B0CC
_0812B0B8:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r2]
	lsls r0, r3, 3
	adds r0, 0x4C
	strh r0, [r4, 0x20]
_0812B0CC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812B09C

	thumb_func_start sub_812B0D4
sub_812B0D4: @ 812B0D4
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _0812B0FA
	strh r2, [r1, 0x2E]
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _0812B0FA
	strh r2, [r1, 0x24]
_0812B0FA:
	pop {r0}
	bx r0
	thumb_func_end sub_812B0D4

	thumb_func_start sub_812B100
sub_812B100: @ 812B100
	push {r4,r5,lr}
	ldr r0, _0812B150 @ =gUnknown_845B050
	movs r1, 0x8
	movs r2, 0x98
	movs r3, 0x3
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0812B154 @ =gUnknown_203B0E8
	ldr r2, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r4, _0812B158 @ =gSprites
	adds r1, r4
	str r1, [r2, 0xC]
	ldr r0, _0812B15C @ =gUnknown_845B068
	movs r1, 0x20
	movs r2, 0x98
	movs r3, 0x4
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	str r1, [r2, 0x10]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B150: .4byte gUnknown_845B050
_0812B154: .4byte gUnknown_203B0E8
_0812B158: .4byte gSprites
_0812B15C: .4byte gUnknown_845B068
	thumb_func_end sub_812B100

	thumb_func_start sub_812B160
sub_812B160: @ 812B160
	push {r4,lr}
	bl GetCurrentKeyboardPage
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0812B198
	bl sub_8129720
	cmp r0, 0
	beq _0812B1A2
	ldr r3, _0812B194 @ =gUnknown_203B0E8
	ldr r0, [r3]
	ldr r1, [r0, 0x10]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	ldr r0, [r0, 0x10]
	movs r1, 0x3
	bl StartSpriteAnim
	b _0812B1D6
	.align 2, 0
_0812B194: .4byte gUnknown_203B0E8
_0812B198:
	bl sub_81297E8
	adds r4, r0, 0
	cmp r4, 0x3
	bne _0812B1B8
_0812B1A2:
	ldr r0, _0812B1B4 @ =gUnknown_203B0E8
	ldr r0, [r0]
	ldr r1, [r0, 0x10]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	b _0812B1D6
	.align 2, 0
_0812B1B4: .4byte gUnknown_203B0E8
_0812B1B8:
	ldr r3, _0812B1DC @ =gUnknown_203B0E8
	ldr r0, [r3]
	ldr r1, [r0, 0x10]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	ldr r0, [r0, 0x10]
	lsls r1, r4, 24
	lsrs r1, 24
	bl StartSpriteAnim
_0812B1D6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812B1DC: .4byte gUnknown_203B0E8
	thumb_func_end sub_812B160

	.align 2, 0 @ Don't pad with nop.
