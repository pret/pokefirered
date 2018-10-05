	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_814F19C
sub_814F19C: @ 814F19C
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0814F1BC
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
_0814F1BC:
	pop {r0}
	bx r0
	thumb_func_end sub_814F19C

	thumb_func_start sub_814F1C0
sub_814F1C0: @ 814F1C0
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_814F1C0

	thumb_func_start sub_814F1D4
sub_814F1D4: @ 814F1D4
	push {lr}
	ldr r0, _0814F1E0 @ =sub_814F1E4
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0814F1E0: .4byte sub_814F1E4
	thumb_func_end sub_814F1D4

	thumb_func_start sub_814F1E4
sub_814F1E4: @ 814F1E4
	push {r4,r5,lr}
	sub sp, 0xC
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	ldr r5, _0814F308 @ =gUnknown_3002040
	movs r0, 0x6C
	bl AllocZeroed
	str r0, [r5]
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0814F30C @ =gUnknown_846FA74
	movs r0, 0
	movs r2, 0x2
	bl InitBgsFromTemplates
	movs r4, 0x80
	lsls r4, 4
	adds r0, r4, 0
	bl Alloc
	adds r1, r0, 0
	movs r0, 0x1
	bl SetBgTilemapBuffer
	adds r0, r4, 0
	bl Alloc
	adds r1, r0, 0
	movs r0, 0
	bl SetBgTilemapBuffer
	ldr r1, _0814F310 @ =gUnknown_846F6D0
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl sub_80F696C
	ldr r1, _0814F314 @ =gUnknown_846F8E0
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r0, _0814F318 @ =gUnknown_846FA7C
	bl InitWindows
	bl DeactivateAllTextPrinters
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	bl remove_some_task
	bl m4aSoundVSyncOn
	ldr r0, _0814F31C @ =sub_814F1C0
	bl SetVBlankCallback
	ldr r0, _0814F320 @ =sub_814F46C
	movs r1, 0
	bl CreateTask
	ldr r1, [r5]
	adds r1, 0x60
	strb r0, [r1]
	bl sub_8116DE0
	ldr r1, [r5]
	adds r1, 0x61
	strb r0, [r1]
	ldr r1, [r5]
	movs r0, 0x1
	str r0, [r1, 0x1C]
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
	ldr r0, _0814F324 @ =gUnknown_846F4D0
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0xF0
	bl sub_80F77CC
	bl UnkTextUtil_Reset
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0xF
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	ldr r0, _0814F328 @ =sub_814F19C
	bl SetMainCallback2
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814F308: .4byte gUnknown_3002040
_0814F30C: .4byte gUnknown_846FA74
_0814F310: .4byte gUnknown_846F6D0
_0814F314: .4byte gUnknown_846F8E0
_0814F318: .4byte gUnknown_846FA7C
_0814F31C: .4byte sub_814F1C0
_0814F320: .4byte sub_814F46C
_0814F324: .4byte gUnknown_846F4D0
_0814F328: .4byte sub_814F19C
	thumb_func_end sub_814F1E4

	thumb_func_start sub_814F32C
sub_814F32C: @ 814F32C
	push {r4,lr}
	bl FreeAllWindowBuffers
	movs r4, 0
_0814F334:
	lsls r0, r4, 24
	lsrs r0, 24
	bl GetBgTilemapBuffer
	bl Free
	adds r4, 0x1
	cmp r4, 0x1
	ble _0814F334
	ldr r0, _0814F35C @ =gUnknown_3002040
	ldr r0, [r0]
	bl Free
	ldr r0, _0814F360 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814F35C: .4byte gUnknown_3002040
_0814F360: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_814F32C

	thumb_func_start sub_814F364
sub_814F364: @ 814F364
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _0814F38C
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xE
	bne _0814F388
	movs r0, 0
	strh r0, [r1]
_0814F388:
	movs r0, 0
	strh r0, [r2]
_0814F38C:
	movs r2, 0
	ldrsh r0, [r1, r2]
	adds r0, 0x2
	lsls r0, 5
	ldr r1, _0814F3A4 @ =gUnknown_846F4D0
	adds r0, r1
	movs r1, 0
	movs r2, 0x10
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_0814F3A4: .4byte gUnknown_846F4D0
	thumb_func_end sub_814F364

	thumb_func_start sub_814F3A8
sub_814F3A8: @ 814F3A8
	push {r4,r5,lr}
	sub sp, 0x8
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x1
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x2
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r5, _0814F468 @ =gUnknown_846FAAC
	ldr r4, [r5]
	movs r0, 0x3
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	movs r3, 0xC0
	subs r3, r0
	lsrs r3, 1
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x6
	str r0, [sp]
	movs r0, 0x3
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl sub_814F65C
	movs r1, 0
_0814F3F0:
	adds r4, r1, 0x1
	lsls r0, r4, 2
	adds r0, r5
	ldr r2, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 25
	movs r1, 0xA0
	lsls r1, 20
	adds r0, r1
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r1, 0x3
	movs r3, 0
	bl sub_814F65C
	adds r1, r4, 0
	cmp r4, 0x2
	ble _0814F3F0
	ldr r1, _0814F468 @ =gUnknown_846FAAC
	adds r0, r4, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r0, r4, 4
	subs r0, r4
	lsls r0, 25
	movs r1, 0xA0
	lsls r1, 20
	adds r0, r1
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0x3
	movs r3, 0
	bl sub_814F65C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814F468: .4byte gUnknown_846FAAC
	thumb_func_end sub_814F3A8

	thumb_func_start sub_814F46C
sub_814F46C: @ 814F46C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0814F498 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x5
	bls _0814F48E
	b _0814F648
_0814F48E:
	lsls r0, 2
	ldr r1, _0814F49C @ =_0814F4A0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814F498: .4byte gTasks
_0814F49C: .4byte _0814F4A0
	.align 2, 0
_0814F4A0:
	.4byte _0814F4B8
	.4byte _0814F4D4
	.4byte _0814F4F8
	.4byte _0814F514
	.4byte _0814F608
	.4byte _0814F630
_0814F4B8:
	bl sub_814F3A8
	ldr r0, _0814F4D0 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _0814F648
	.align 2, 0
_0814F4D0: .4byte gTasks
_0814F4D4:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0x1
	bl ShowBg
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl ShowBg
	b _0814F618
_0814F4F8:
	ldr r0, _0814F510 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0814F506
	b _0814F648
_0814F506:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r2
	b _0814F622
	.align 2, 0
_0814F510: .4byte gUnknown_2037AB8
_0814F514:
	ldr r0, _0814F570 @ =gUnknown_3002040
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x10
	adds r2, r0, 0
	adds r2, 0x20
	adds r3, r0, 0
	adds r3, 0x61
	ldrb r3, [r3]
	bl sub_814F7E4
	lsls r1, r5, 2
	mov r8, r1
	cmp r0, 0
	beq _0814F5A4
	movs r0, 0x2
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r4, 0
	ldr r6, _0814F574 @ =gStringVar4
	movs r7, 0xA0
	lsls r7, 20
_0814F542:
	ldr r0, _0814F570 @ =gUnknown_3002040
	ldr r0, [r0]
	lsls r1, r4, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r6, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	cmp r4, 0x3
	beq _0814F578
	lsrs r0, r7, 24
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0x3
	adds r2, r6, 0
	movs r3, 0x4
	bl sub_814F65C
	b _0814F58A
	.align 2, 0
_0814F570: .4byte gUnknown_3002040
_0814F574: .4byte gStringVar4
_0814F578:
	movs r0, 0x64
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r1, 0x3
	adds r2, r6, 0
	movs r3, 0x4
	bl sub_814F65C
_0814F58A:
	movs r2, 0xF0
	lsls r2, 21
	adds r7, r2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0814F542
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0x2
	movs r1, 0x3
	bl CopyWindowToVram
_0814F5A4:
	ldr r0, _0814F5F8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0814F5B8
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0814F5E2
_0814F5B8:
	movs r0, 0x5
	bl PlaySE
	ldr r2, _0814F5FC @ =gTasks
	ldr r0, _0814F600 @ =gUnknown_3002040
	ldr r0, [r0]
	adds r0, 0x61
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0xFF
	strh r1, [r0, 0x26]
	mov r0, r8
	adds r1, r0, r5
	lsls r1, 3
	adds r1, r2
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_0814F5E2:
	mov r2, r8
	adds r1, r2, r5
	lsls r1, 3
	ldr r0, _0814F604 @ =gTasks+0x8
	adds r1, r0
	adds r0, r1, 0
	adds r0, 0xE
	adds r1, 0x10
	bl sub_814F364
	b _0814F648
	.align 2, 0
_0814F5F8: .4byte gMain
_0814F5FC: .4byte gTasks
_0814F600: .4byte gUnknown_3002040
_0814F604: .4byte gTasks+0x8
_0814F608:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_0814F618:
	ldr r1, _0814F62C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
_0814F622:
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _0814F648
	.align 2, 0
_0814F62C: .4byte gTasks
_0814F630:
	ldr r0, _0814F654 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0814F648
	ldr r0, _0814F658 @ =sub_814F32C
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_0814F648:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814F654: .4byte gUnknown_2037AB8
_0814F658: .4byte sub_814F32C
	thumb_func_end sub_814F46C

	thumb_func_start sub_814F65C
sub_814F65C: @ 814F65C
	push {r4-r7,lr}
	sub sp, 0x18
	mov r12, r2
	ldr r2, [sp, 0x2C]
	ldr r4, [sp, 0x30]
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r2, 24
	lsrs r3, r2, 24
	lsls r4, 24
	lsrs r0, r4, 24
	cmp r0, 0x4
	bhi _0814F6E6
	lsls r0, 2
	ldr r1, _0814F688 @ =_0814F68C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814F688: .4byte _0814F68C
	.align 2, 0
_0814F68C:
	.4byte _0814F6A0
	.4byte _0814F6AE
	.4byte _0814F6BC
	.4byte _0814F6CA
	.4byte _0814F6D8
_0814F6A0:
	add r1, sp, 0x14
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	movs r0, 0x3
	b _0814F6E4
_0814F6AE:
	add r1, sp, 0x14
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	movs r0, 0x3
	b _0814F6E4
_0814F6BC:
	add r1, sp, 0x14
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x1]
	movs r0, 0x5
	b _0814F6E4
_0814F6CA:
	add r1, sp, 0x14
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x7
	strb r0, [r1, 0x1]
	movs r0, 0x6
	b _0814F6E4
_0814F6D8:
	add r1, sp, 0x14
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	movs r0, 0x2
_0814F6E4:
	strb r0, [r1, 0x2]
_0814F6E6:
	negs r0, r5
	orrs r0, r5
	lsrs r0, 31
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	add r0, sp, 0x14
	str r0, [sp, 0x8]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0xC]
	mov r0, r12
	str r0, [sp, 0x10]
	adds r0, r7, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl AddTextPrinterParametrized2
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_814F65C

	thumb_func_start sub_814F714
sub_814F714: @ 814F714
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r12, r0
	adds r7, r1, 0
	ldrb r0, [r0, 0xA]
	lsls r0, 25
	lsrs r0, 25
	mov r8, r0
	movs r4, 0
	ldr r0, _0814F78C @ =gUnknown_846FAC0
	mov r9, r0
	movs r1, 0x1
	add r1, r9
	mov r10, r1
	mov r3, r12
	adds r3, 0x4
	str r3, [sp]
_0814F73E:
	lsls r0, r4, 1
	adds r2, r0, r4
	mov r3, r9
	adds r1, r2, r3
	adds r5, r0, 0
	adds r6, r4, 0x1
	ldrb r1, [r1]
	cmp r8, r1
	bne _0814F7A2
	mov r0, r12
	ldrb r1, [r0, 0x1A]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _0814F7A2
	mov r0, r9
	adds r0, 0x2
	adds r3, r2, r0
	ldrb r0, [r3]
	cmp r0, 0
	bne _0814F790
	movs r2, 0
	movs r1, 0
	ldr r3, [sp]
_0814F76E:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0814F778
	adds r2, 0x1
_0814F778:
	adds r1, 0x1
	cmp r1, 0x3
	ble _0814F76E
	adds r2, 0x1
	adds r0, r5, r4
	add r0, r10
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r7
	b _0814F79C
	.align 2, 0
_0814F78C: .4byte gUnknown_846FAC0
_0814F790:
	mov r1, r10
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r7
	ldrb r2, [r3]
_0814F79C:
	ldr r0, [r1]
	adds r0, r2
	str r0, [r1]
_0814F7A2:
	adds r4, r6, 0
	cmp r4, 0x16
	bls _0814F73E
	mov r0, r8
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_814F714

	thumb_func_start sub_814F7BC
sub_814F7BC: @ 814F7BC
	push {r4,lr}
	movs r4, 0
	adds r3, r1, 0
	adds r2, r0, 0
_0814F7C4:
	ldr r1, [r2]
	ldr r0, [r3]
	cmp r1, r0
	beq _0814F7D0
	movs r0, 0x1
	b _0814F7DC
_0814F7D0:
	adds r3, 0x4
	adds r2, 0x4
	adds r4, 0x1
	cmp r4, 0x3
	ble _0814F7C4
	movs r0, 0
_0814F7DC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_814F7BC

	thumb_func_start sub_814F7E4
sub_814F7E4: @ 814F7E4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	adds r6, r0, 0
	mov r9, r1
	adds r5, r2, 0
	lsls r4, r3, 24
	lsrs r4, 24
	movs r0, 0
	mov r8, r0
	mov r0, sp
	movs r1, 0
	movs r2, 0x10
	bl memset
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0814F84C @ =gTasks+0x8
	adds r7, r0, r1
	movs r4, 0
_0814F812:
	lsls r1, r4, 5
	ldr r0, [r7]
	adds r0, r1
	mov r1, sp
	bl sub_814F714
	adds r1, r0, 0
	ldr r0, [r5]
	cmp r1, r0
	beq _0814F82C
	str r1, [r5]
	movs r2, 0x1
	mov r8, r2
_0814F82C:
	adds r5, 0x4
	adds r4, 0x1
	cmp r4, 0xF
	ble _0814F812
	mov r0, sp
	mov r1, r9
	bl sub_814F7BC
	cmp r0, 0
	bne _0814F850
	mov r3, r8
	cmp r3, 0x1
	beq _0814F874
	movs r0, 0
	b _0814F876
	.align 2, 0
_0814F84C: .4byte gTasks+0x8
_0814F850:
	adds r1, r6, 0
	mov r0, sp
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldr r0, [r0]
	str r0, [r1]
	mov r1, r9
	mov r0, sp
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r6]
	ldr r1, [r6, 0x4]
	adds r0, r1
	ldr r1, [r6, 0x8]
	adds r0, r1
	str r0, [r6, 0xC]
_0814F874:
	movs r0, 0x1
_0814F876:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_814F7E4

	.align 2, 0 @ Don't pad with nop.
