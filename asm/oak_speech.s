	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_813144C
sub_813144C: @ 813144C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	movs r7, 0
	ldr r1, _081314D0 @ =0x00001244
	movs r0, 0x50
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0x10
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldr r0, _081314D4 @ =gTasks
	mov r8, r0
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r0, r5, r0
	strh r7, [r0, 0xC]
	ldr r0, _081314D8 @ =sub_8131338
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	mov r1, r8
	adds r0, r2, r1
	strh r4, [r0, 0x8]
	movs r1, 0x10
	strh r1, [r0, 0xA]
	strh r7, [r0, 0xC]
	strh r6, [r0, 0xE]
	strh r6, [r0, 0x10]
	mov r3, r8
	adds r3, 0x8
_081314AC:
	adds r0, r7, 0x7
	lsls r0, 1
	adds r1, r0, r2
	adds r1, r3
	adds r0, r5
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x2
	bls _081314AC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081314D0: .4byte 0x00001244
_081314D4: .4byte gTasks
_081314D8: .4byte sub_8131338
	thumb_func_end sub_813144C

	thumb_func_start sub_81314DC
sub_81314DC: @ 81314DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r1, _08131528 @ =gTasks
	lsls r5, r6, 2
	adds r0, r5, r6
	lsls r0, 3
	mov r9, r0
	adds r2, r0, r1
	ldrh r3, [r2, 0xA]
	movs r7, 0xA
	ldrsh r0, [r2, r7]
	mov r12, r1
	cmp r0, 0x10
	bne _08131530
	ldr r0, _0813152C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081315BA
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	add r1, r12
	movs r0, 0x1
	strh r0, [r1, 0xC]
	adds r0, r6, 0
	bl DestroyTask
	b _081315BA
	.align 2, 0
_08131528: .4byte gTasks
_0813152C: .4byte gPaletteFade
_08131530:
	ldrh r1, [r2, 0x10]
	movs r7, 0x10
	ldrsh r0, [r2, r7]
	cmp r0, 0
	beq _08131540
	subs r0, r1, 0x1
	strh r0, [r2, 0x10]
	b _081315BA
_08131540:
	ldrh r0, [r2, 0xE]
	strh r0, [r2, 0x10]
	adds r1, r3, 0x2
	strh r1, [r2, 0xA]
	ldrh r0, [r2, 0xC]
	subs r0, 0x2
	strh r0, [r2, 0xC]
	lsls r1, 16
	asrs r1, 16
	mov r8, r5
	cmp r1, 0x8
	bne _0813159E
	mov r7, r9
	movs r0, 0x8
	add r0, r12
	mov r10, r0
	movs r5, 0x1
	movs r1, 0x5
	negs r1, r1
	mov r9, r1
_08131568:
	adds r0, r4, 0x7
	lsls r0, 1
	adds r0, r7
	add r0, r10
	movs r2, 0
	ldrsh r0, [r0, r2]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _081315C8 @ =gSprites
	adds r2, r0
	adds r2, 0x3E
	ldrb r3, [r2]
	lsls r1, r3, 29
	lsrs r1, 31
	eors r1, r5
	ands r1, r5
	lsls r1, 2
	mov r0, r9
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _08131568
_0813159E:
	mov r1, r8
	adds r0, r1, r6
	lsls r0, 3
	add r0, r12
	movs r2, 0xC
	ldrsh r1, [r0, r2]
	lsls r1, 8
	ldrh r0, [r0, 0xA]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
_081315BA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081315C8: .4byte gSprites
	thumb_func_end sub_81314DC

	thumb_func_start sub_81315CC
sub_81315CC: @ 81315CC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	movs r7, 0
	ldr r1, _08131654 @ =0x00001244
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldr r0, _08131658 @ =gTasks
	mov r8, r0
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r0, r5, r0
	strh r7, [r0, 0xC]
	ldr r0, _0813165C @ =sub_81314DC
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	mov r1, r8
	adds r0, r2, r1
	strh r4, [r0, 0x8]
	strh r7, [r0, 0xA]
	movs r1, 0x10
	strh r1, [r0, 0xC]
	strh r6, [r0, 0xE]
	strh r6, [r0, 0x10]
	mov r3, r8
	adds r3, 0x8
_0813162E:
	adds r0, r7, 0x7
	lsls r0, 1
	adds r1, r0, r2
	adds r1, r3
	adds r0, r5
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x2
	bls _0813162E
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08131654: .4byte 0x00001244
_08131658: .4byte gTasks
_0813165C: .4byte sub_81314DC
	thumb_func_end sub_81315CC

	thumb_func_start sub_8131660
sub_8131660: @ 8131660
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	mov r8, r1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r5, _081316DC @ =gTasks+0x8
	adds r7, r4, r5
	ldr r0, _081316E0 @ =gUnknown_8462ED8
	bl AddWindow
	strh r0, [r7, 0x1A]
	lsls r0, 24
	lsrs r0, 24
	bl PutWindowTilemap
	ldrb r6, [r7, 0x1A]
	bl sub_80F796C
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	adds r0, r6, 0
	movs r1, 0x1
	movs r3, 0xE
	bl SetWindowBorderStyle
	adds r5, r4
	ldrb r0, [r5, 0x1A]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r7, 0x1A]
	ldr r2, _081316E4 @ =gUnknown_81C574F
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x8
	bl AddTextPrinterParameterized
	mov r0, r8
	cmp r0, 0
	bne _081316F4
	ldr r0, _081316E8 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	ldr r6, _081316EC @ =gUnknown_84630D8
	cmp r0, 0
	bne _081316F6
	ldr r6, _081316F0 @ =gUnknown_846308C
	b _081316F6
	.align 2, 0
_081316DC: .4byte gTasks+0x8
_081316E0: .4byte gUnknown_8462ED8
_081316E4: .4byte gUnknown_81C574F
_081316E8: .4byte gSaveBlock2Ptr
_081316EC: .4byte gUnknown_84630D8
_081316F0: .4byte gUnknown_846308C
_081316F4:
	ldr r6, _08131750 @ =gUnknown_8463124
_081316F6:
	movs r4, 0
	movs r5, 0
_081316FA:
	ldrb r0, [r7, 0x1A]
	lsls r1, r4, 2
	adds r1, r6
	ldr r2, [r1]
	adds r4, 0x1
	lsls r1, r4, 4
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x8
	bl AddTextPrinterParameterized
	lsls r4, 24
	lsrs r4, 24
	cmp r4, 0x3
	bls _081316FA
	ldrb r0, [r7, 0x1A]
	movs r1, 0x10
	str r1, [sp]
	movs r1, 0x5
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x1
	bl sub_810F7D8
	ldrb r0, [r7, 0x1A]
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08131750: .4byte gUnknown_8463124
	thumb_func_end sub_8131660

	thumb_func_start sub_8131754
sub_8131754: @ 8131754
	push {r4,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	cmp r0, 0
	bne _081317A0
	ldr r0, _08131770 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _08131778
	ldr r4, _08131774 @ =gUnknown_846308C
	b _0813177A
	.align 2, 0
_08131770: .4byte gSaveBlock2Ptr
_08131774: .4byte gUnknown_846308C
_08131778:
	ldr r4, _08131798 @ =gUnknown_84630D8
_0813177A:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x13
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 14
	adds r0, r4
	ldr r3, [r0]
	ldr r0, _0813179C @ =gSaveBlock2Ptr
	ldr r4, [r0]
	b _081317B0
	.align 2, 0
_08131798: .4byte gUnknown_84630D8
_0813179C: .4byte gSaveBlock2Ptr
_081317A0:
	ldr r1, _081317EC @ =gUnknown_8463124
	lsls r0, r2, 2
	adds r0, r1
	ldr r3, [r0]
	ldr r0, _081317F0 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _081317F4 @ =0x00003a4c
	adds r4, r0, r1
_081317B0:
	movs r2, 0
	ldrb r0, [r3]
	cmp r0, 0xFF
	beq _081317D2
_081317B8:
	adds r1, r4, r2
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x6
	bhi _081317D2
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _081317B8
_081317D2:
	cmp r2, 0x7
	bhi _081317E6
	movs r1, 0xFF
_081317D8:
	adds r0, r4, r2
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _081317D8
_081317E6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081317EC: .4byte gUnknown_8463124
_081317F0: .4byte gSaveBlock1Ptr
_081317F4: .4byte 0x00003a4c
	thumb_func_end sub_8131754

	.align 2, 0 @ Don't pad with nop.
