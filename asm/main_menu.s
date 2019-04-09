	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_800C2D4
sub_800C2D4: @ 800C2D4
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_800C2D4

	thumb_func_start sub_800C2EC
sub_800C2EC: @ 800C2EC
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_800C2EC

	thumb_func_start sub_800C300
sub_800C300: @ 800C300
	push {lr}
	movs r0, 0x1
	bl sub_800C318
	pop {r0}
	bx r0
	thumb_func_end sub_800C300

	thumb_func_start sub_800C30C
sub_800C30C: @ 800C30C
	push {lr}
	movs r0, 0x1
	bl sub_800C318
	pop {r0}
	bx r0
	thumb_func_end sub_800C30C

	thumb_func_start sub_800C318
sub_800C318: @ 800C318
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	movs r0, 0xC
	movs r1, 0
	bl SetGpuReg
	movs r0, 0xA
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x8
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x18
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1A
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x14
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x16
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x10
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x12
	movs r1, 0
	bl SetGpuReg
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0800C4A0 @ =0x040000d4
	mov r0, sp
	str r0, [r1]
	movs r0, 0xC0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _0800C4A4 @ =0x8100c000
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r5, 0
	str r5, [sp, 0x4]
	add r0, sp, 0x4
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _0800C4A8 @ =0x85000100
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, sp
	strh r5, [r0]
	str r0, [r1]
	ldr r0, _0800C4AC @ =0x05000002
	str r0, [r1, 0x4]
	ldr r0, _0800C4B0 @ =0x810001ff
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ScanlineEffect_Stop
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetPaletteFade
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0800C4B4 @ =gUnknown_8234690
	movs r0, 0
	movs r2, 0x1
	bl InitBgsFromTemplates
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
	ldr r0, _0800C4B8 @ =gUnknown_8234618
	bl InitWindows
	bl DeactivateAllTextPrinters
	ldr r0, _0800C4BC @ =gUnknown_8234648
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0800C4C0 @ =gUnknown_8234668
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0x40
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldr r0, _0800C4C4 @ =sub_800C2D4
	bl SetMainCallback2
	movs r1, 0xC1
	lsls r1, 6
	movs r0, 0
	bl SetGpuReg
	ldr r0, _0800C4C8 @ =sub_800C4D0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0800C4CC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0xA]
	strh r4, [r1, 0x18]
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800C4A0: .4byte 0x040000d4
_0800C4A4: .4byte 0x8100c000
_0800C4A8: .4byte 0x85000100
_0800C4AC: .4byte 0x05000002
_0800C4B0: .4byte 0x810001ff
_0800C4B4: .4byte gUnknown_8234690
_0800C4B8: .4byte gUnknown_8234618
_0800C4BC: .4byte gUnknown_8234648
_0800C4C0: .4byte gUnknown_8234668
_0800C4C4: .4byte sub_800C2D4
_0800C4C8: .4byte sub_800C4D0
_0800C4CC: .4byte gTasks
	thumb_func_end sub_800C318

	thumb_func_start sub_800C4D0
sub_800C4D0: @ 800C4D0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0800C538 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _0800C4E8
	b _0800C626
_0800C4E8:
	movs r0, 0x40
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0x1
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0x21
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0xFF
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0x7
	bl SetGpuReg
	ldr r0, _0800C53C @ =gSaveFileStatus
	ldrh r4, [r0]
	cmp r4, 0x2
	beq _0800C58C
	cmp r4, 0x2
	bgt _0800C540
	cmp r4, 0
	beq _0800C5E8
	cmp r4, 0x1
	beq _0800C54A
	b _0800C5E8
	.align 2, 0
_0800C538: .4byte gPaletteFade
_0800C53C: .4byte gSaveFileStatus
_0800C540:
	cmp r4, 0x4
	beq _0800C60C
	cmp r4, 0xFF
	beq _0800C5B0
	b _0800C5E8
_0800C54A:
	movs r0, 0
	bl sub_800D044
	bl sub_806E2BC
	cmp r0, 0x1
	bne _0800C570
	ldr r2, _0800C56C @ =gTasks
	lsls r3, r5, 2
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r2
	movs r1, 0x2
	strh r1, [r0, 0x8]
	adds r1, r2, 0
	adds r2, r3, 0
	b _0800C57E
	.align 2, 0
_0800C56C: .4byte gTasks
_0800C570:
	ldr r0, _0800C588 @ =gTasks
	lsls r2, r5, 2
	adds r1, r2, r5
	lsls r1, 3
	adds r1, r0
	strh r4, [r1, 0x8]
	adds r1, r0, 0
_0800C57E:
	adds r0, r2, r5
	lsls r0, 3
	adds r0, r1
	b _0800C5FC
	.align 2, 0
_0800C588: .4byte gTasks
_0800C58C:
	movs r0, 0
	bl sub_800D094
	ldr r0, _0800C5A8 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	strh r6, [r1, 0x8]
	ldr r1, _0800C5AC @ =gUnknown_8415C42
	adds r0, r5, 0
	bl sub_800C634
	b _0800C626
	.align 2, 0
_0800C5A8: .4byte gTasks
_0800C5AC: .4byte gUnknown_8415C42
_0800C5B0:
	movs r0, 0
	bl sub_800D094
	ldr r1, _0800C5DC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r6, 0x1
	strh r6, [r4, 0x8]
	ldr r1, _0800C5E0 @ =gUnknown_8415BFF
	adds r0, r5, 0
	bl sub_800C634
	bl sub_806E2BC
	cmp r0, 0x1
	bne _0800C5E4
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _0800C626
	.align 2, 0
_0800C5DC: .4byte gTasks
_0800C5E0: .4byte gUnknown_8415BFF
_0800C5E4:
	strh r6, [r4, 0x8]
	b _0800C626
_0800C5E8:
	movs r0, 0
	bl sub_800D044
	ldr r1, _0800C604 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x8]
_0800C5FC:
	ldr r1, _0800C608 @ =sub_800C704
	str r1, [r0]
	b _0800C626
	.align 2, 0
_0800C604: .4byte gTasks
_0800C608: .4byte sub_800C704
_0800C60C:
	movs r0, 0
	bl sub_800D094
	ldr r0, _0800C62C @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	strh r6, [r1, 0x8]
	ldr r1, _0800C630 @ =gUnknown_8415C64
	adds r0, r5, 0
	bl sub_800C634
_0800C626:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800C62C: .4byte gTasks
_0800C630: .4byte gUnknown_8415C64
	thumb_func_end sub_800C4D0

	thumb_func_start sub_800C634
sub_800C634: @ 800C634
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r0, r1, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_800CDF8
	ldr r1, _0800C678 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0800C67C @ =sub_800C688
	str r1, [r0]
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0800C680 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0
	bl ShowBg
	ldr r0, _0800C684 @ =sub_800C2EC
	bl SetVBlankCallback
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800C678: .4byte gTasks
_0800C67C: .4byte sub_800C688
_0800C680: .4byte 0x0000ffff
_0800C684: .4byte sub_800C2EC
	thumb_func_end sub_800C634

	thumb_func_start sub_800C688
sub_800C688: @ 800C688
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0800C6E0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0800C6F8
	bl RunTextPrinters
	movs r0, 0x4
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _0800C6F8
	ldr r0, _0800C6E4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0800C6F8
	movs r0, 0x4
	bl ClearWindowTilemap
	ldr r0, _0800C6E8 @ =gUnknown_8234638
	bl sub_800D1E8
	movs r0, 0
	bl sub_800D044
	ldr r1, _0800C6EC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0800C6F4
	ldr r0, _0800C6F0 @ =sub_800C704
	b _0800C6F6
	.align 2, 0
_0800C6E0: .4byte gPaletteFade
_0800C6E4: .4byte gMain
_0800C6E8: .4byte gUnknown_8234638
_0800C6EC: .4byte gTasks
_0800C6F0: .4byte sub_800C704
_0800C6F4:
	ldr r0, _0800C700 @ =sub_800C7A0
_0800C6F6:
	str r0, [r1]
_0800C6F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800C700: .4byte sub_800C7A0
	thumb_func_end sub_800C688

	thumb_func_start sub_800C704
sub_800C704: @ 800C704
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0800C764 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0800C774
	movs r0, 0x40
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0x1
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0x21
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0xFF
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0x7
	bl SetGpuReg
	ldr r0, _0800C768 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0800C770
	ldr r0, _0800C76C @ =sub_800CA94
	b _0800C772
	.align 2, 0
_0800C764: .4byte gPaletteFade
_0800C768: .4byte gTasks
_0800C76C: .4byte sub_800CA94
_0800C770:
	ldr r0, _0800C77C @ =sub_800C780
_0800C772:
	str r0, [r1]
_0800C774:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800C77C: .4byte sub_800C780
	thumb_func_end sub_800C704

	thumb_func_start sub_800C780
sub_800C780: @ 800C780
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0800C79C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0800C798
	adds r0, r2, 0
	bl sub_800C7A0
_0800C798:
	pop {r0}
	bx r0
	.align 2, 0
_0800C79C: .4byte gPaletteFade
	thumb_func_end sub_800C780

	thumb_func_start sub_800C7A0
sub_800C7A0: @ 800C7A0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0x40
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0x1
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0x21
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0xFF
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0x7
	bl SetGpuReg
	ldr r0, _0800C7F4 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _0800C7FC
	ldr r1, _0800C7F8 @ =0x00007e04
	b _0800C7FE
	.align 2, 0
_0800C7F4: .4byte gSaveBlock2Ptr
_0800C7F8: .4byte 0x00007e04
_0800C7FC:
	ldr r1, _0800C85C @ =0x0000547f
_0800C7FE:
	add r0, sp, 0xC
	strh r1, [r0]
	add r0, sp, 0xC
	movs r1, 0xF1
	movs r2, 0x2
	bl LoadPalette
	ldr r2, _0800C860 @ =gTasks
	lsls r1, r7, 2
	adds r0, r1, r7
	lsls r0, 3
	adds r6, r0, r2
	movs r2, 0x8
	ldrsh r0, [r6, r2]
	mov r8, r1
	cmp r0, 0x1
	beq _0800C870
	cmp r0, 0x1
	ble _0800C828
	cmp r0, 0x2
	beq _0800C8F0
_0800C828:
	movs r0, 0
	movs r1, 0xAA
	bl FillWindowPixelBuffer
	ldr r0, _0800C864 @ =gUnknown_8234688
	str r0, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	ldr r0, _0800C868 @ =gUnknown_8415A6E
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x2
	movs r3, 0x2
	bl box_print
	ldr r0, _0800C86C @ =gUnknown_8234618
	bl sub_800D0B4
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	b _0800C8D8
	.align 2, 0
_0800C85C: .4byte 0x0000547f
_0800C860: .4byte gTasks
_0800C864: .4byte gUnknown_8234688
_0800C868: .4byte gUnknown_8415A6E
_0800C86C: .4byte gUnknown_8234618
_0800C870:
	movs r0, 0x1
	movs r1, 0xAA
	bl FillWindowPixelBuffer
	movs r0, 0x2
	movs r1, 0xAA
	bl FillWindowPixelBuffer
	ldr r5, _0800C8E0 @ =gUnknown_8234688
	str r5, [sp]
	movs r4, 0x1
	negs r4, r4
	str r4, [sp, 0x4]
	ldr r0, _0800C8E4 @ =gUnknown_8415A77
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x2
	movs r3, 0x2
	bl box_print
	str r5, [sp]
	str r4, [sp, 0x4]
	ldr r0, _0800C8E8 @ =gUnknown_8415A6E
	str r0, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0x2
	movs r2, 0x2
	movs r3, 0x2
	bl box_print
	bl sub_800CE58
	ldr r4, _0800C8EC @ =gUnknown_8234620
	adds r0, r4, 0
	bl sub_800D0B4
	adds r4, 0x8
	adds r0, r4, 0
	bl sub_800D0B4
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x2
_0800C8D8:
	movs r1, 0x3
	bl CopyWindowToVram
	b _0800C994
	.align 2, 0
_0800C8E0: .4byte gUnknown_8234688
_0800C8E4: .4byte gUnknown_8415A77
_0800C8E8: .4byte gUnknown_8415A6E
_0800C8EC: .4byte gUnknown_8234620
_0800C8F0:
	movs r0, 0x1
	movs r1, 0xAA
	bl FillWindowPixelBuffer
	movs r0, 0x2
	movs r1, 0xAA
	bl FillWindowPixelBuffer
	movs r0, 0x3
	movs r1, 0xAA
	bl FillWindowPixelBuffer
	ldr r5, _0800C9B0 @ =gUnknown_8234688
	str r5, [sp]
	movs r4, 0x1
	negs r4, r4
	str r4, [sp, 0x4]
	ldr r0, _0800C9B4 @ =gUnknown_8415A77
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x2
	movs r3, 0x2
	bl box_print
	str r5, [sp]
	str r4, [sp, 0x4]
	ldr r0, _0800C9B8 @ =gUnknown_8415A6E
	str r0, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0x2
	movs r2, 0x2
	movs r3, 0x2
	bl box_print
	movs r0, 0x1
	strh r0, [r6, 0x1C]
	str r5, [sp]
	str r4, [sp, 0x4]
	ldr r0, _0800C9BC @ =gUnknown_8415A97
	str r0, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0x2
	movs r2, 0x2
	movs r3, 0x2
	bl box_print
	bl sub_800CE58
	ldr r4, _0800C9C0 @ =gUnknown_8234620
	adds r0, r4, 0
	bl sub_800D0B4
	adds r0, r4, 0
	adds r0, 0x8
	bl sub_800D0B4
	adds r4, 0x10
	adds r0, r4, 0
	bl sub_800D0B4
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0x3
	bl PutWindowTilemap
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x2
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x3
	movs r1, 0x3
	bl CopyWindowToVram
_0800C994:
	ldr r0, _0800C9C4 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _0800C9C8 @ =sub_800C9CC
	str r0, [r1]
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C9B0: .4byte gUnknown_8234688
_0800C9B4: .4byte gUnknown_8415A77
_0800C9B8: .4byte gUnknown_8415A6E
_0800C9BC: .4byte gUnknown_8415A97
_0800C9C0: .4byte gUnknown_8234620
_0800C9C4: .4byte gTasks
_0800C9C8: .4byte sub_800C9CC
	thumb_func_end sub_800C7A0

	thumb_func_start sub_800C9CC
sub_800C9CC: @ 800C9CC
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0x1
	negs r5, r5
	adds r0, r5, 0
	bl CheckForSpaceForDma3Request
	lsls r0, 16
	asrs r0, 16
	cmp r0, r5
	beq _0800CA10
	ldr r1, _0800CA18 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0800CA1C @ =sub_800CA28
	str r1, [r0]
	ldr r0, _0800CA20 @ =0x0000ffff
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0
	bl ShowBg
	ldr r0, _0800CA24 @ =sub_800C2EC
	bl SetVBlankCallback
_0800CA10:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800CA18: .4byte gTasks
_0800CA1C: .4byte sub_800CA28
_0800CA20: .4byte 0x0000ffff
_0800CA24: .4byte sub_800C2EC
	thumb_func_end sub_800C9CC

	thumb_func_start sub_800CA28
sub_800CA28: @ 800CA28
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800CA4C @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0xA]
	bl sub_800CC94
	ldr r0, _0800CA50 @ =sub_800CA54
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800CA4C: .4byte gTasks
_0800CA50: .4byte sub_800CA54
	thumb_func_end sub_800CA28

	thumb_func_start sub_800CA54
sub_800CA54: @ 800CA54
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0800CA88 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0800CA80
	adds r0, r4, 0
	bl sub_800CCF8
	lsls r0, 24
	cmp r0, 0
	beq _0800CA80
	ldr r0, _0800CA8C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0800CA90 @ =sub_800CA28
	str r0, [r1]
_0800CA80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800CA88: .4byte gPaletteFade
_0800CA8C: .4byte gTasks
_0800CA90: .4byte sub_800CA28
	thumb_func_end sub_800CA54

	thumb_func_start sub_800CA94
sub_800CA94: @ 800CA94
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0800CAC4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0800CB84
	ldr r1, _0800CAC8 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0800CACC
	cmp r0, 0x1
	ble _0800CAEE
	cmp r0, 0x2
	beq _0800CADA
	b _0800CAEE
	.align 2, 0
_0800CAC4: .4byte gPaletteFade
_0800CAC8: .4byte gTasks
_0800CACC:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0800CAEA
	cmp r0, 0x1
	bne _0800CAEA
	b _0800CAEE
_0800CADA:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0800CAEE
	cmp r0, 0x1
	ble _0800CAEA
	cmp r0, 0x2
	beq _0800CAF2
_0800CAEA:
	movs r0, 0x1
	b _0800CB22
_0800CAEE:
	movs r0, 0
	b _0800CB22
_0800CAF2:
	bl sub_8009480
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _0800CB20
	movs r0, 0
	bl sub_800D094
	ldr r0, _0800CB1C @ =sub_800CB90
	str r0, [r4]
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _0800CB84
	.align 2, 0
_0800CB1C: .4byte sub_800CB90
_0800CB20:
	movs r0, 0x2
_0800CB22:
	cmp r0, 0x1
	beq _0800CB48
	cmp r0, 0x1
	ble _0800CB2E
	cmp r0, 0x2
	beq _0800CB70
_0800CB2E:
	ldr r1, _0800CB44 @ =gUnknown_2031DE0
	movs r0, 0
	strb r0, [r1]
	bl FreeAllWindowBuffers
	adds r0, r6, 0
	bl DestroyTask
	bl sub_812EB2C
	b _0800CB84
	.align 2, 0
_0800CB44: .4byte gUnknown_2031DE0
_0800CB48:
	ldr r0, _0800CB64 @ =gPlttBufferUnfaded
	movs r2, 0
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0800CB68 @ =gPlttBufferFaded
	strh r1, [r0]
	ldr r0, _0800CB6C @ =gUnknown_2031DE0
	strb r2, [r0]
	bl FreeAllWindowBuffers
	adds r0, r6, 0
	bl sub_8110F14
	b _0800CB84
	.align 2, 0
_0800CB64: .4byte gPlttBufferUnfaded
_0800CB68: .4byte gPlttBufferFaded
_0800CB6C: .4byte gUnknown_2031DE0
_0800CB70:
	ldr r0, _0800CB8C @ =sub_81422AC
	bl SetMainCallback2
	bl sub_812B478
	bl FreeAllWindowBuffers
	adds r0, r6, 0
	bl DestroyTask
_0800CB84:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800CB8C: .4byte sub_81422AC
	thumb_func_end sub_800CA94

	thumb_func_start sub_800CB90
sub_800CB90: @ 800CB90
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0800CBB4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r0, 0x1A
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _0800CC0C
	cmp r1, 0x1
	bgt _0800CBB8
	cmp r1, 0
	beq _0800CBC2
	b _0800CC58
	.align 2, 0
_0800CBB4: .4byte gTasks
_0800CBB8:
	cmp r1, 0x2
	beq _0800CC1C
	cmp r1, 0x3
	beq _0800CC34
	b _0800CC58
_0800CBC2:
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _0800CBEC
	ldr r0, _0800CBE8 @ =gUnknown_8415AA4
	bl sub_800CDF8
	b _0800CBF2
	.align 2, 0
_0800CBE8: .4byte gUnknown_8415AA4
_0800CBEC:
	ldr r0, _0800CC04 @ =gUnknown_8415ACB
	bl sub_800CDF8
_0800CBF2:
	ldr r0, _0800CC08 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1A]
	adds r0, 0x1
	strh r0, [r1, 0x1A]
	b _0800CC58
	.align 2, 0
_0800CC04: .4byte gUnknown_8415ACB
_0800CC08: .4byte gTasks
_0800CC0C:
	ldr r0, _0800CC18 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	b _0800CC28
	.align 2, 0
_0800CC18: .4byte gPaletteFade
_0800CC1C:
	bl RunTextPrinters
	movs r0, 0x4
	bl IsTextPrinterActive
	lsls r0, 16
_0800CC28:
	cmp r0, 0
	bne _0800CC58
	ldrh r0, [r4, 0x1A]
	adds r0, 0x1
	strh r0, [r4, 0x1A]
	b _0800CC58
_0800CC34:
	ldr r0, _0800CC60 @ =gMain
	ldrh r0, [r0, 0x2E]
	ands r1, r0
	cmp r1, 0
	beq _0800CC58
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0800CC64 @ =sub_800CC68
	str r0, [r4]
_0800CC58:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800CC60: .4byte gMain
_0800CC64: .4byte sub_800CC68
	thumb_func_end sub_800CB90

	thumb_func_start sub_800CC68
sub_800CC68: @ 800CC68
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0800CC8C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0800CC86
	ldr r0, _0800CC90 @ =sub_8078914
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0800CC86:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800CC8C: .4byte gPaletteFade
_0800CC90: .4byte sub_8078914
	thumb_func_end sub_800CC68

	thumb_func_start sub_800CC94
sub_800CC94: @ 800CC94
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r1, _0800CCB8 @ =0x000012de
	movs r0, 0x40
	bl SetGpuReg
	cmp r4, 0
	beq _0800CCB2
	cmp r4, 0
	blt _0800CCB2
	cmp r4, 0x2
	ble _0800CCBC
_0800CCB2:
	movs r2, 0
	movs r0, 0x20
	b _0800CCDC
	.align 2, 0
_0800CCB8: .4byte 0x000012de
_0800CCBC:
	cmp r5, 0x1
	beq _0800CCCE
	cmp r5, 0x1
	ble _0800CCC8
	cmp r5, 0x2
	beq _0800CCD6
_0800CCC8:
	movs r2, 0
	movs r0, 0x60
	b _0800CCDC
_0800CCCE:
	movs r2, 0xC0
	lsls r2, 7
	movs r0, 0x80
	b _0800CCDC
_0800CCD6:
	movs r2, 0x80
	lsls r2, 8
	movs r0, 0xA0
_0800CCDC:
	movs r3, 0x80
	lsls r3, 2
	adds r1, r3, 0
	adds r1, r2, r1
	subs r0, 0x2
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x44
	bl SetGpuReg
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_800CC94

	thumb_func_start sub_800CCF8
sub_800CCF8: @ 800CCF8
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0800CD38 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r5, 0x1
	ands r5, r1
	adds r3, r0, 0
	cmp r5, 0
	beq _0800CD44
	movs r0, 0x5
	bl PlaySE
	bl sub_8009480
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0800CD3C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0800CD40 @ =sub_800CA94
	str r1, [r0]
	b _0800CDEC
	.align 2, 0
_0800CD38: .4byte gMain
_0800CD3C: .4byte gTasks
_0800CD40: .4byte sub_800CA94
_0800CD44:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0800CD8C
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0x40
	movs r1, 0xF0
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0xA0
	bl SetGpuReg
	ldr r1, _0800CD84 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0800CD88 @ =sub_800CC68
	str r1, [r0]
	b _0800CDEC
	.align 2, 0
_0800CD84: .4byte gTasks
_0800CD88: .4byte sub_800CC68
_0800CD8C:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0800CDB4
	ldr r0, _0800CDB0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xA]
	movs r5, 0xA
	ldrsh r0, [r1, r5]
	cmp r0, 0
	ble _0800CDB4
	subs r0, r2, 0x1
	strh r0, [r1, 0xA]
	movs r0, 0x1
	b _0800CDEE
	.align 2, 0
_0800CDB0: .4byte gTasks
_0800CDB4:
	ldrh r1, [r3, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0800CDEC
	ldr r1, _0800CDE4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r3, r0, r1
	movs r0, 0xA
	ldrsh r2, [r3, r0]
	ldr r1, _0800CDE8 @ =gUnknown_8234694
	movs r4, 0x8
	ldrsh r0, [r3, r4]
	adds r0, r1
	ldrb r0, [r0]
	cmp r2, r0
	bge _0800CDEC
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	movs r0, 0x1
	b _0800CDEE
	.align 2, 0
_0800CDE4: .4byte gTasks
_0800CDE8: .4byte gUnknown_8234694
_0800CDEC:
	movs r0, 0
_0800CDEE:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_800CCF8

	thumb_func_start sub_800CDF8
sub_800CDF8: @ 800CDF8
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	movs r0, 0x4
	movs r1, 0xAA
	bl FillWindowPixelBuffer
	ldr r0, _0800CE48 @ =gUnknown_8234638
	bl sub_800D0B4
	ldr r0, _0800CE4C @ =gUnknown_8234688
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x4
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl box_print
	movs r0, 0x4
	bl PutWindowTilemap
	movs r0, 0x4
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, _0800CE50 @ =0x000013dd
	movs r0, 0x40
	bl SetGpuReg
	ldr r1, _0800CE54 @ =0x0000739d
	movs r0, 0x44
	bl SetGpuReg
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800CE48: .4byte gUnknown_8234638
_0800CE4C: .4byte gUnknown_8234688
_0800CE50: .4byte 0x000013dd
_0800CE54: .4byte 0x0000739d
	thumb_func_end sub_800CDF8

	thumb_func_start sub_800CE58
sub_800CE58: @ 800CE58
	push {lr}
	bl sub_800CE70
	bl sub_800CF3C
	bl sub_800CED4
	bl sub_800CFC4
	pop {r0}
	bx r0
	thumb_func_end sub_800CE58

	thumb_func_start sub_800CE70
sub_800CE70: @ 800CE70
	push {lr}
	sub sp, 0x14
	ldr r0, _0800CEC8 @ =gUnknown_823468B
	str r0, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	ldr r0, _0800CECC @ =gUnknown_841B6D5
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x2
	movs r3, 0x12
	bl box_print
	add r1, sp, 0xC
	movs r2, 0
	ldr r0, _0800CED0 @ =gSaveBlock2Ptr
	ldr r3, [r0]
_0800CE96:
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, 0x1
	adds r2, 0x1
	cmp r2, 0x6
	ble _0800CE96
	movs r0, 0xFF
	strb r0, [r1]
	ldr r0, _0800CEC8 @ =gUnknown_823468B
	str r0, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	add r0, sp, 0xC
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x3E
	movs r3, 0x12
	bl box_print
	add sp, 0x14
	pop {r0}
	bx r0
	.align 2, 0
_0800CEC8: .4byte gUnknown_823468B
_0800CECC: .4byte gUnknown_841B6D5
_0800CED0: .4byte gSaveBlock2Ptr
	thumb_func_end sub_800CE70

	thumb_func_start sub_800CED4
sub_800CED4: @ 800CED4
	push {r4-r6,lr}
	sub sp, 0x2C
	ldr r6, _0800CF30 @ =gUnknown_823468B
	str r6, [sp]
	movs r5, 0x1
	negs r5, r5
	str r5, [sp, 0x4]
	ldr r0, _0800CF34 @ =gUnknown_841B6DC
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x2
	movs r3, 0x22
	bl box_print
	ldr r4, _0800CF38 @ =gSaveBlock2Ptr
	ldr r0, [r4]
	ldrh r1, [r0, 0xE]
	add r0, sp, 0xC
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r1, 0xF0
	strb r1, [r0]
	adds r0, 0x1
	ldr r1, [r4]
	ldrb r1, [r1, 0x10]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	str r6, [sp]
	str r5, [sp, 0x4]
	add r0, sp, 0xC
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x3E
	movs r3, 0x22
	bl box_print
	add sp, 0x2C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800CF30: .4byte gUnknown_823468B
_0800CF34: .4byte gUnknown_841B6DC
_0800CF38: .4byte gSaveBlock2Ptr
	thumb_func_end sub_800CED4

	thumb_func_start sub_800CF3C
sub_800CF3C: @ 800CF3C
	push {r4-r6,lr}
	sub sp, 0x2C
	ldr r0, _0800CF60 @ =0x00000829
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0800CFAE
	bl sub_806E25C
	cmp r0, 0
	beq _0800CF64
	movs r0, 0x1
	bl pokedex_count
	b _0800CF6A
	.align 2, 0
_0800CF60: .4byte 0x00000829
_0800CF64:
	movs r0, 0x1
	bl sub_8088EDC
_0800CF6A:
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r5, _0800CFB8 @ =gUnknown_823468B
	str r5, [sp]
	movs r4, 0x1
	negs r4, r4
	str r4, [sp, 0x4]
	ldr r0, _0800CFBC @ =gUnknown_841B6E3
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x2
	movs r3, 0x32
	bl box_print
	add r0, sp, 0xC
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r1, _0800CFC0 @ =gUnknown_841B6EB
	bl StringAppend
	str r5, [sp]
	str r4, [sp, 0x4]
	add r0, sp, 0xC
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x3E
	movs r3, 0x32
	bl box_print
_0800CFAE:
	add sp, 0x2C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800CFB8: .4byte gUnknown_823468B
_0800CFBC: .4byte gUnknown_841B6E3
_0800CFC0: .4byte gUnknown_841B6EB
	thumb_func_end sub_800CF3C

	thumb_func_start sub_800CFC4
sub_800CFC4: @ 800CFC4
	push {r4-r6,lr}
	sub sp, 0x2C
	movs r6, 0
	movs r4, 0x82
	lsls r4, 4
_0800CFCE:
	lsls r0, r4, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0800CFE2
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0800CFE2:
	adds r4, 0x1
	ldr r0, _0800D034 @ =0x00000827
	cmp r4, r0
	bls _0800CFCE
	ldr r5, _0800D038 @ =gUnknown_823468B
	str r5, [sp]
	movs r4, 0x1
	negs r4, r4
	str r4, [sp, 0x4]
	ldr r0, _0800D03C @ =gUnknown_841B6EC
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x2
	movs r3, 0x42
	bl box_print
	add r0, sp, 0xC
	adds r1, r6, 0
	movs r2, 0x2
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	ldr r1, _0800D040 @ =gUnknown_841B6F3
	bl StringAppend
	str r5, [sp]
	str r4, [sp, 0x4]
	add r0, sp, 0xC
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x3E
	movs r3, 0x42
	bl box_print
	add sp, 0x2C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800D034: .4byte 0x00000827
_0800D038: .4byte gUnknown_823468B
_0800D03C: .4byte gUnknown_841B6EC
_0800D040: .4byte gUnknown_841B6F3
	thumb_func_end sub_800CFC4

	thumb_func_start sub_800D044
sub_800D044: @ 800D044
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _0800D088 @ =gSaveBlock2Ptr
	ldr r0, [r5]
	ldrb r0, [r0, 0x14]
	lsrs r0, 3
	bl sub_8069788
	ldr r1, [r0]
	movs r2, 0x90
	lsls r2, 1
	ldr r3, _0800D08C @ =0x000001b1
	adds r0, r4, 0
	bl LoadBgTiles
	ldr r0, [r5]
	ldrb r0, [r0, 0x14]
	lsrs r0, 3
	bl sub_8069788
	ldr r0, [r0, 0x4]
	movs r1, 0x20
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0800D090 @ =gUnknown_8234638
	bl sub_800D1E8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D088: .4byte gSaveBlock2Ptr
_0800D08C: .4byte 0x000001b1
_0800D090: .4byte gUnknown_8234638
	thumb_func_end sub_800D044

	thumb_func_start sub_800D094
sub_800D094: @ 800D094
	push {lr}
	ldr r1, _0800D0AC @ =0x000001b1
	movs r0, 0
	movs r2, 0x20
	bl sub_814FF2C
	ldr r0, _0800D0B0 @ =gUnknown_8234638
	bl sub_800D1E8
	pop {r0}
	bx r0
	.align 2, 0
_0800D0AC: .4byte 0x000001b1
_0800D0B0: .4byte gUnknown_8234638
	thumb_func_end sub_800D094

	thumb_func_start sub_800D0B4
sub_800D0B4: @ 800D0B4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	adds r5, r0, 0
	ldrb r0, [r5]
	ldr r1, _0800D1D8 @ =0x000001b1
	ldrb r2, [r5, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r5, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	movs r6, 0x1
	str r6, [sp]
	str r6, [sp, 0x4]
	movs r4, 0x2
	mov r8, r4
	str r4, [sp, 0x8]
	bl FillBgTilemapBufferRect
	ldrb r0, [r5]
	movs r1, 0xD9
	lsls r1, 1
	ldrb r2, [r5, 0x1]
	ldrb r3, [r5, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r4, [r5, 0x3]
	str r4, [sp]
	ldrb r4, [r5, 0x4]
	str r4, [sp, 0x4]
	mov r4, r8
	str r4, [sp, 0x8]
	bl FillBgTilemapBufferRect
	ldrb r0, [r5]
	ldr r1, _0800D1DC @ =0x000001b3
	ldrb r2, [r5, 0x3]
	ldrb r3, [r5, 0x1]
	adds r2, r3
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r5, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	str r6, [sp]
	str r6, [sp, 0x4]
	str r4, [sp, 0x8]
	bl FillBgTilemapBufferRect
	ldrb r0, [r5]
	movs r1, 0xDA
	lsls r1, 1
	ldrb r2, [r5, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r5, 0x2]
	str r6, [sp]
	ldrb r4, [r5, 0x4]
	str r4, [sp, 0x4]
	mov r4, r8
	str r4, [sp, 0x8]
	bl FillBgTilemapBufferRect
	ldrb r0, [r5]
	movs r1, 0xDB
	lsls r1, 1
	ldrb r2, [r5, 0x3]
	ldrb r3, [r5, 0x1]
	adds r2, r3
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r5, 0x2]
	str r6, [sp]
	ldrb r4, [r5, 0x4]
	str r4, [sp, 0x4]
	mov r4, r8
	str r4, [sp, 0x8]
	bl FillBgTilemapBufferRect
	ldrb r0, [r5]
	ldr r1, _0800D1E0 @ =0x000001b7
	ldrb r2, [r5, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r5, 0x4]
	ldrb r4, [r5, 0x2]
	adds r3, r4
	lsls r3, 24
	lsrs r3, 24
	str r6, [sp]
	str r6, [sp, 0x4]
	mov r4, r8
	str r4, [sp, 0x8]
	bl FillBgTilemapBufferRect
	ldrb r0, [r5]
	movs r1, 0xDC
	lsls r1, 1
	ldrb r2, [r5, 0x1]
	ldrb r3, [r5, 0x4]
	ldrb r4, [r5, 0x2]
	adds r3, r4
	lsls r3, 24
	lsrs r3, 24
	ldrb r4, [r5, 0x3]
	str r4, [sp]
	str r6, [sp, 0x4]
	mov r4, r8
	str r4, [sp, 0x8]
	bl FillBgTilemapBufferRect
	ldrb r0, [r5]
	ldr r1, _0800D1E4 @ =0x000001b9
	ldrb r2, [r5, 0x3]
	ldrb r3, [r5, 0x1]
	adds r2, r3
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r5, 0x4]
	ldrb r4, [r5, 0x2]
	adds r3, r4
	lsls r3, 24
	lsrs r3, 24
	str r6, [sp]
	str r6, [sp, 0x4]
	mov r4, r8
	str r4, [sp, 0x8]
	bl FillBgTilemapBufferRect
	ldrb r0, [r5]
	bl CopyBgTilemapBufferToVram
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800D1D8: .4byte 0x000001b1
_0800D1DC: .4byte 0x000001b3
_0800D1E0: .4byte 0x000001b7
_0800D1E4: .4byte 0x000001b9
	thumb_func_end sub_800D0B4

	thumb_func_start sub_800D1E8
sub_800D1E8: @ 800D1E8
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	ldrb r0, [r6]
	ldrb r1, [r6, 0x1]
	subs r2, r1, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r4, [r6, 0x2]
	subs r3, r4, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r5, [r6, 0x3]
	adds r1, r5
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	ldrb r1, [r6, 0x4]
	adds r4, r1
	adds r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x4]
	movs r1, 0x2
	str r1, [sp, 0x8]
	movs r1, 0
	bl FillBgTilemapBufferRect
	ldrb r0, [r6]
	bl CopyBgTilemapBufferToVram
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_800D1E8

	.align 2, 0 @ Don't pad with nop.
