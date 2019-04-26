	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8098110
sub_8098110: @ 8098110
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r0, 0x80
	lsls r0, 7
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080981A2
	ldr r0, _08098178 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080981A2
	ldr r5, _0809817C @ =sub_80981AC
	adds r0, r5, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	bne _08098188
	adds r0, r5, 0
	movs r1, 0x5A
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	ldr r1, _08098180 @ =0xffffef7f
	movs r0, 0
	movs r2, 0
	bl ChangeBgY
	ldr r1, _08098184 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x8]
	strh r1, [r0, 0xC]
	strh r6, [r0, 0x18]
	b _080981A2
	.align 2, 0
_08098178: .4byte gUnknown_203ADFA
_0809817C: .4byte sub_80981AC
_08098180: .4byte 0xffffef7f
_08098184: .4byte gTasks
_08098188:
	ldr r0, _080981A8 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0x4
	beq _0809819E
	movs r0, 0x4
	strh r0, [r1, 0x8]
_0809819E:
	movs r0, 0x1
	strh r0, [r1, 0xE]
_080981A2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080981A8: .4byte gTasks
	thumb_func_end sub_8098110

	thumb_func_start sub_80981AC
sub_80981AC: @ 80981AC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080981D0 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	bls _080981C6
	b _080982DE
_080981C6:
	lsls r0, 2
	ldr r1, _080981D4 @ =_080981D8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080981D0: .4byte gTasks
_080981D4: .4byte _080981D8
	.align 2, 0
_080981D8:
	.4byte _080981FC
	.4byte _0809820E
	.4byte _08098218
	.4byte _08098234
	.4byte _0809824C
	.4byte _080982DE
	.4byte _0809827E
	.4byte _080982A6
	.4byte _080982D6
_080981FC:
	movs r1, 0x18
	ldrsh r0, [r4, r1]
	bl sub_8098340
	strh r0, [r4, 0x10]
	movs r0, 0x1
	strh r0, [r4, 0x12]
	strh r0, [r4, 0x8]
	b _080982DE
_0809820E:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _080982DE
_08098218:
	ldrh r0, [r4, 0xC]
	subs r0, 0x2
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x18
	negs r1, r1
	cmp r0, r1
	bgt _080982DE
	movs r0, 0x3
	strh r0, [r4, 0x8]
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080982DE
_08098234:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	ble _080982DE
	movs r0, 0
	strh r0, [r4, 0xA]
	movs r0, 0x4
	strh r0, [r4, 0x8]
	b _080982DE
_0809824C:
	ldrh r0, [r4, 0xC]
	adds r0, 0x2
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	blt _080982DE
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08098278
	ldrh r0, [r4, 0x10]
	bl sub_8098400
	ldrb r0, [r4, 0x10]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	strh r0, [r4, 0xE]
	b _080982DE
_08098278:
	movs r0, 0x6
	strh r0, [r4, 0x8]
	b _080982E6
_0809827E:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080982A0
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080982A0
	ldrb r0, [r4, 0x10]
	bl rbox_fill_rectangle
	ldrb r0, [r4, 0x10]
	movs r1, 0x1
	bl CopyWindowToVram
	movs r0, 0x1
	strh r0, [r4, 0x14]
_080982A0:
	movs r0, 0x7
	strh r0, [r4, 0x8]
	b _080982E6
_080982A6:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080982E6
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080982C6
	ldrb r0, [r4, 0x10]
	bl RemoveWindow
	strh r5, [r4, 0x12]
	movs r0, 0x1
	strh r0, [r4, 0x16]
_080982C6:
	movs r0, 0x8
	strh r0, [r4, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	b _080982E6
_080982D6:
	adds r0, r2, 0
	bl DestroyTask
	b _080982E6
_080982DE:
	ldrh r1, [r4, 0xC]
	movs r0, 0x12
	bl SetGpuReg
_080982E6:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80981AC

	thumb_func_start sub_80982EC
sub_80982EC: @ 80982EC
	push {lr}
	ldr r0, _08098318 @ =sub_80981AC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _08098312
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0809831C @ =gTasks+0x8
	adds r1, r0, r1
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0x5
	bgt _08098312
	movs r0, 0x6
	strh r0, [r1]
_08098312:
	pop {r0}
	bx r0
	.align 2, 0
_08098318: .4byte sub_80981AC
_0809831C: .4byte gTasks+0x8
	thumb_func_end sub_80982EC

	thumb_func_start sub_8098320
sub_8098320: @ 8098320
	push {lr}
	ldr r0, _0809833C @ =sub_80981AC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xFF
	eors r0, r1
	negs r1, r0
	orrs r1, r0
	lsrs r1, 31
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_0809833C: .4byte sub_80981AC
	thumb_func_end sub_8098320

	thumb_func_start sub_8098340
sub_8098340: @ 8098340
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r0, _08098378 @ =gUnknown_83D4164
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	movs r6, 0x1D
	ldr r0, _0809837C @ =gMapHeader
	ldrb r0, [r0, 0x1A]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _08098396
	cmp r0, 0x7F
	beq _08098384
	ldr r2, [sp]
	lsrs r1, r2, 24
	adds r1, 0x5
	lsls r1, 24
	ldr r0, _08098380 @ =0x00ffffff
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
	movs r6, 0x27
	b _08098396
	.align 2, 0
_08098378: .4byte gUnknown_83D4164
_0809837C: .4byte gMapHeader
_08098380: .4byte 0x00ffffff
_08098384:
	ldr r2, [sp]
	lsrs r1, r2, 24
	adds r1, 0x8
	lsls r1, 24
	ldr r0, _080983B4 @ =0x00ffffff
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
	movs r6, 0x2D
_08098396:
	mov r0, sp
	bl AddWindow
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r4, 0
	beq _080983B8
	movs r0, 0x3
	bl stdpal_get
	movs r1, 0xD0
	movs r2, 0x20
	bl LoadPalette
	b _080983C6
	.align 2, 0
_080983B4: .4byte 0x00ffffff
_080983B8:
	movs r0, 0x3
	bl stdpal_get
	ldr r1, _080983FC @ =gPlttBufferUnfaded + 0x1A0
	movs r2, 0x10
	bl CpuSet
_080983C6:
	lsls r4, r5, 24
	lsrs r4, 24
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_814FF6C
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0xD
	bl DrawTextBorderOuter
	adds r0, r4, 0
	bl PutWindowTilemap
	adds r0, r5, 0
	bl sub_8098400
	adds r0, r4, 0
	movs r1, 0x3
	bl CopyWindowToVram
	adds r0, r5, 0
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080983FC: .4byte gPlttBufferUnfaded + 0x1A0
	thumb_func_end sub_8098340

	thumb_func_start sub_8098400
sub_8098400: @ 8098400
	push {r4-r6,lr}
	sub sp, 0x28
	lsls r0, 16
	lsrs r6, r0, 16
	movs r5, 0x70
	ldr r4, _08098478 @ =gMapHeader
	ldrb r1, [r4, 0x14]
	add r0, sp, 0xC
	movs r2, 0
	bl sub_80C4D78
	adds r2, r0, 0
	movs r0, 0x1A
	ldrsb r0, [r4, r0]
	cmp r0, 0
	beq _08098434
	adds r1, r0, 0
	adds r0, r2, 0
	bl sub_809847C
	movs r0, 0x1A
	ldrsb r0, [r4, r0]
	movs r5, 0xB0
	cmp r0, 0x7F
	beq _08098434
	movs r5, 0x98
_08098434:
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x2
	add r1, sp, 0xC
	bl GetStringWidth
	adds r4, r0, 0
	subs r4, r5, r4
	lsrs r4, 1
	lsls r5, r6, 24
	lsrs r5, 24
	adds r0, r5, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0x2
	add r2, sp, 0xC
	adds r3, r4, 0
	bl AddTextPrinterParameterized
	add sp, 0x28
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098478: .4byte gMapHeader
	thumb_func_end sub_8098400

	thumb_func_start sub_809847C
sub_809847C: @ 809847C
	push {lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r3, r1, 24
	asrs r1, 24
	cmp r1, 0
	beq _080984D2
	movs r0, 0
	strb r0, [r2]
	adds r2, 0x1
	cmp r1, 0x7F
	bne _080984A4
	ldr r1, _080984A0 @ =gUnknown_841D18D
	adds r0, r2, 0
	bl StringCopy
	b _080984D2
	.align 2, 0
_080984A0: .4byte gUnknown_841D18D
_080984A4:
	cmp r1, 0
	bge _080984B4
	movs r0, 0xBC
	strb r0, [r2]
	adds r2, 0x1
	negs r0, r1
	lsls r0, 24
	lsrs r3, r0, 24
_080984B4:
	lsls r1, r3, 24
	asrs r1, 24
	adds r0, r2, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r2, r0, 0
	adds r1, r2, 0
	movs r0, 0xC0
	strb r0, [r2]
	adds r2, 0x1
	movs r0, 0xFF
	strb r0, [r1, 0x1]
	adds r0, r2, 0
_080984D2:
	pop {r1}
	bx r1
	thumb_func_end sub_809847C

	.align 2, 0 @ Don't pad with nop.
