	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F4190
sub_80F4190: @ 80F4190
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_80F4190

	thumb_func_start sub_80F41A4
sub_80F41A4: @ 80F41A4
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	beq _080F4200
	cmp r4, 0x1
	bgt _080F41BA
	cmp r4, 0
	beq _080F41C4
	b _080F42C2
_080F41BA:
	cmp r4, 0x2
	beq _080F4240
	cmp r4, 0x3
	beq _080F4288
	b _080F42C2
_080F41C4:
	ldr r0, _080F41F4 @ =gUnknown_840C5B0
	bl InitWindows
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0xA
	str r0, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x6
	movs r1, 0x8
	movs r2, 0
	movs r3, 0x1
	bl sub_810C228
	ldr r1, _080F41F8 @ =gUnknown_840CB8C
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToWindowPixelBuffer
	ldr r1, _080F41FC @ =gUnknown_840D228
	b _080F4270
	.align 2, 0
_080F41F4: .4byte gUnknown_840C5B0
_080F41F8: .4byte gUnknown_840CB8C
_080F41FC: .4byte gUnknown_840D228
_080F4200:
	ldr r0, _080F4234 @ =gUnknown_840C5D0
	bl InitWindows
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0xA
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0x8
	movs r2, 0
	movs r3, 0x1
	bl sub_810C228
	ldr r1, _080F4238 @ =gUnknown_840E158
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToWindowPixelBuffer
	ldr r1, _080F423C @ =gUnknown_840E904
	b _080F4270
	.align 2, 0
_080F4234: .4byte gUnknown_840C5D0
_080F4238: .4byte gUnknown_840E158
_080F423C: .4byte gUnknown_840E904
_080F4240:
	ldr r0, _080F427C @ =gUnknown_840C5F0
	bl InitWindows
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0xA
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	movs r0, 0x9
	movs r1, 0x8
	movs r2, 0
	movs r3, 0x1
	bl sub_810C228
	ldr r1, _080F4280 @ =gUnknown_840F240
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToWindowPixelBuffer
	ldr r1, _080F4284 @ =gUnknown_840F944
_080F4270:
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl CopyToWindowPixelBuffer
	b _080F42C2
	.align 2, 0
_080F427C: .4byte gUnknown_840C5F0
_080F4280: .4byte gUnknown_840F240
_080F4284: .4byte gUnknown_840F944
_080F4288:
	ldr r0, _080F42E4 @ =gUnknown_840C610
	bl InitWindows
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0xA
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	movs r0, 0x19
	movs r1, 0x8
	movs r2, 0
	movs r3, 0x1
	bl sub_810C228
	ldr r1, _080F42E8 @ =gUnknown_8410198
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToWindowPixelBuffer
	ldr r1, _080F42EC @ =gUnknown_84105B4
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl CopyToWindowPixelBuffer
_080F42C2:
	movs r0, 0
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x2
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F42E4: .4byte gUnknown_840C610
_080F42E8: .4byte gUnknown_8410198
_080F42EC: .4byte gUnknown_84105B4
	thumb_func_end sub_80F41A4

	thumb_func_start sub_80F42F0
sub_80F42F0: @ 80F42F0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x1
	beq _080F4314
	cmp r0, 0x1
	bgt _080F4306
	cmp r0, 0
	beq _080F4310
	b _080F4320
_080F4306:
	cmp r1, 0x2
	beq _080F4318
	cmp r1, 0x3
	beq _080F431C
	b _080F4320
_080F4310:
	movs r0, 0x6
	b _080F4322
_080F4314:
	movs r0, 0x3
	b _080F4322
_080F4318:
	movs r0, 0x9
	b _080F4322
_080F431C:
	movs r0, 0x19
	b _080F4322
_080F4320:
	movs r0, 0
_080F4322:
	pop {r1}
	bx r1
	thumb_func_end sub_80F42F0

	thumb_func_start sub_80F4328
sub_80F4328: @ 80F4328
	push {r4-r6,lr}
	sub sp, 0x10
	ldr r1, _080F4344 @ =gUnknown_203AB40
	ldr r0, [r1]
	ldrb r0, [r0, 0x1]
	adds r4, r1, 0
	cmp r0, 0x9
	bls _080F433A
	b _080F4668
_080F433A:
	lsls r0, 2
	ldr r1, _080F4348 @ =_080F434C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F4344: .4byte gUnknown_203AB40
_080F4348: .4byte _080F434C
	.align 2, 0
_080F434C:
	.4byte _080F4374
	.4byte _080F44CC
	.4byte _080F4504
	.4byte _080F4530
	.4byte _080F453A
	.4byte _080F4558
	.4byte _080F4582
	.4byte _080F45D6
	.4byte _080F460E
	.4byte _080F4638
_080F4374:
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	movs r1, 0xC0
	lsls r1, 7
	movs r0, 0
	bl ClearGpuRegBits
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
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	movs r0, 0x1
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080F44A8 @ =gUnknown_840C5A4
	movs r0, 0x1
	movs r2, 0x3
	bl InitBgsFromTemplates
	movs r0, 0x80
	lsls r0, 4
	bl Alloc
	adds r1, r0, 0
	movs r0, 0
	bl SetBgTilemapBuffer
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
	ldr r6, _080F44AC @ =gUnknown_203AB40
	ldr r1, [r6]
	movs r4, 0
	strh r4, [r1, 0xC]
	strh r4, [r1, 0xE]
	movs r2, 0x80
	lsls r2, 8
	movs r0, 0x50
	str r0, [sp]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	str r0, [sp, 0x4]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	str r0, [sp, 0x8]
	str r4, [sp, 0xC]
	movs r0, 0x2
	adds r1, r2, 0
	movs r3, 0x78
	bl SetBgAffine
	ldr r1, _080F44B0 @ =gUnknown_8EAAB98
	movs r5, 0x80
	lsls r5, 6
	str r4, [sp]
	movs r0, 0x1
	adds r2, r5, 0
	movs r3, 0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _080F44B4 @ =gUnknown_840C650
	str r4, [sp]
	movs r0, 0x2
	adds r2, r5, 0
	movs r3, 0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _080F44B8 @ =gUnknown_8EAB30C
	movs r2, 0xA0
	lsls r2, 3
	movs r4, 0x1
	str r4, [sp]
	movs r0, 0x1
	movs r3, 0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _080F44BC @ =gUnknown_840CA54
	movs r2, 0x80
	lsls r2, 3
	str r4, [sp]
	movs r0, 0x2
	movs r3, 0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r0, [r6]
	ldrb r0, [r0, 0x9]
	lsls r0, 5
	ldr r1, _080F44C0 @ =gUnknown_8EAAB18
	adds r0, r1
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080F44C4 @ =gUnknown_840C630
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, [r6]
	ldrb r0, [r0, 0x9]
	bl sub_80F41A4
	ldr r0, _080F44C8 @ =sub_80F4190
	bl SetVBlankCallback
	movs r0, 0x1
	bl EnableInterrupts
	ldr r1, [r6]
	b _080F4630
	.align 2, 0
_080F44A8: .4byte gUnknown_840C5A4
_080F44AC: .4byte gUnknown_203AB40
_080F44B0: .4byte gUnknown_8EAAB98
_080F44B4: .4byte gUnknown_840C650
_080F44B8: .4byte gUnknown_8EAB30C
_080F44BC: .4byte gUnknown_840CA54
_080F44C0: .4byte gUnknown_8EAAB18
_080F44C4: .4byte gUnknown_840C630
_080F44C8: .4byte sub_80F4190
_080F44CC:
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _080F4500 @ =gUnknown_203AB40
	ldr r1, [r0]
	b _080F4630
	.align 2, 0
_080F4500: .4byte gUnknown_203AB40
_080F4504:
	movs r0, 0x2
	bl ShowBg
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080F452C @ =gUnknown_203AB40
	ldr r1, [r0]
	movs r0, 0x28
	strh r0, [r1, 0xC]
	b _080F4630
	.align 2, 0
_080F452C: .4byte gUnknown_203AB40
_080F4530:
	ldr r1, [r4]
	ldrh r0, [r1, 0xC]
	cmp r0, 0
	bne _080F45DE
	b _080F4630
_080F453A:
	ldr r0, _080F4554 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080F4548
	b _080F4668
_080F4548:
	ldr r1, [r4]
	movs r0, 0x8
	strh r0, [r1, 0xC]
	movs r0, 0x1
	strh r0, [r1, 0xE]
	b _080F4630
	.align 2, 0
_080F4554: .4byte gPaletteFade
_080F4558:
	ldr r1, [r4]
	ldrh r0, [r1, 0xC]
	cmp r0, 0
	bne _080F45DE
	ldrh r0, [r1, 0xE]
	cmp r0, 0x2
	bhi _080F4630
	lsls r0, 24
	lsrs r0, 24
	bl PutWindowTilemap
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r1, [r4]
	movs r0, 0x4
	strh r0, [r1, 0xC]
	ldrh r0, [r1, 0xE]
	adds r0, 0x1
	strh r0, [r1, 0xE]
	b _080F4668
_080F4582:
	ldr r3, [r4]
	ldrh r0, [r3, 0xC]
	cmp r0, 0xFF
	bhi _080F45B2
	adds r0, 0x10
	movs r1, 0
	strh r0, [r3, 0xC]
	movs r2, 0x80
	lsls r2, 8
	movs r0, 0x50
	str r0, [sp]
	movs r4, 0xC
	ldrsh r0, [r3, r4]
	str r0, [sp, 0x4]
	movs r4, 0xC
	ldrsh r0, [r3, r4]
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	movs r0, 0x2
	adds r1, r2, 0
	movs r3, 0x78
	bl SetBgAffine
	b _080F4668
_080F45B2:
	movs r2, 0x80
	lsls r2, 8
	movs r0, 0x50
	str r0, [sp]
	adds r0, 0xB0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	movs r0, 0
	str r0, [sp, 0xC]
	movs r0, 0x2
	adds r1, r2, 0
	movs r3, 0x78
	bl SetBgAffine
	ldr r1, [r4]
	movs r0, 0x20
	strh r0, [r1, 0xC]
	b _080F4630
_080F45D6:
	ldr r1, [r4]
	ldrh r0, [r1, 0xC]
	cmp r0, 0
	beq _080F45E4
_080F45DE:
	subs r0, 0x1
	strh r0, [r1, 0xC]
	b _080F4668
_080F45E4:
	movs r0, 0x2
	bl HideBg
	movs r0, 0x1
	bl ShowBg
	ldr r0, [r4]
	ldrb r0, [r0, 0x9]
	bl sub_80F42F0
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCry2
	ldr r1, [r4]
	movs r0, 0x80
	strh r0, [r1, 0xC]
	b _080F4630
_080F460E:
	ldr r2, [r4]
	ldrh r0, [r2, 0xC]
	adds r1, r0, 0
	cmp r1, 0
	beq _080F461E
	subs r0, 0x1
	strh r0, [r2, 0xC]
	b _080F4668
_080F461E:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r4]
_080F4630:
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	b _080F4668
_080F4638:
	ldr r0, _080F4660 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080F4668
	bl FreeAllWindowBuffers
	movs r0, 0
	bl GetBgTilemapBuffer
	bl Free
	ldr r0, _080F4664 @ =gUnknown_203AB40
	ldr r0, [r0]
	strb r4, [r0, 0x1]
	movs r0, 0x1
	b _080F466A
	.align 2, 0
_080F4660: .4byte gPaletteFade
_080F4664: .4byte gUnknown_203AB40
_080F4668:
	movs r0, 0
_080F466A:
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80F4328

	thumb_func_start sub_80F4674
sub_80F4674: @ 80F4674
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _080F4690 @ =gUnknown_203AB40
	ldr r2, [r6]
	ldrb r5, [r2, 0x1]
	cmp r5, 0x1
	bne _080F4684
	b _080F4784
_080F4684:
	cmp r5, 0x1
	bgt _080F4694
	cmp r5, 0
	beq _080F46A0
	b _080F47EC
	.align 2, 0
_080F4690: .4byte gUnknown_203AB40
_080F4694:
	cmp r5, 0x2
	beq _080F478E
	cmp r5, 0x3
	bne _080F469E
	b _080F47D0
_080F469E:
	b _080F47EC
_080F46A0:
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	movs r1, 0xC0
	lsls r1, 7
	movs r0, 0
	bl ClearGpuRegBits
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
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	movs r0, 0x1
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080F4778 @ =gUnknown_840C5A4
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
	ldr r4, _080F477C @ =gUnknown_8410CDC
	ldr r0, [r6]
	ldrb r1, [r0, 0x9]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, [r0]
	movs r2, 0x80
	lsls r2, 6
	str r5, [sp]
	movs r0, 0
	movs r3, 0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r0, [r6]
	ldrb r1, [r0, 0x9]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0x4
	adds r0, r1
	ldr r1, [r0]
	movs r2, 0x80
	lsls r2, 4
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0
	movs r3, 0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r0, [r6]
	ldrb r1, [r0, 0x9]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r4, 0x8
	adds r0, r4
	ldr r0, [r0]
	movs r2, 0x80
	lsls r2, 2
	movs r1, 0
	bl LoadPalette
	ldr r0, _080F4780 @ =sub_80F4190
	bl SetVBlankCallback
	movs r0, 0x1
	bl EnableInterrupts
	ldr r1, [r6]
	b _080F47C2
	.align 2, 0
_080F4778: .4byte gUnknown_840C5A4
_080F477C: .4byte gUnknown_8410CDC
_080F4780: .4byte sub_80F4190
_080F4784:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r1, [r6]
	b _080F47C2
_080F478E:
	movs r0, 0
	bl ShowBg
	ldr r0, [r6]
	ldrb r1, [r0, 0x9]
	cmp r1, 0
	beq _080F47AE
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl BeginNormalPaletteFade
	b _080F47BE
_080F47AE:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_080F47BE:
	ldr r0, _080F47CC @ =gUnknown_203AB40
	ldr r1, [r0]
_080F47C2:
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	b _080F47EC
	.align 2, 0
_080F47CC: .4byte gUnknown_203AB40
_080F47D0:
	ldr r0, _080F47E8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080F47EC
	strb r0, [r2, 0x1]
	movs r0, 0x1
	b _080F47EE
	.align 2, 0
_080F47E8: .4byte gPaletteFade
_080F47EC:
	movs r0, 0
_080F47EE:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80F4674

	thumb_func_start sub_80F47F8
sub_80F47F8: @ 80F47F8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080F481C @ =gTasks+0x8
	adds r3, r1, r0
	ldrb r0, [r3]
	cmp r0, 0x1
	beq _080F4820
	cmp r0, 0x1
	ble _080F48C2
	cmp r0, 0x2
	beq _080F484C
	cmp r0, 0x3
	beq _080F4896
	b _080F48C2
	.align 2, 0
_080F481C: .4byte gTasks+0x8
_080F4820:
	ldr r4, _080F4848 @ =gSprites
	ldrb r0, [r3, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r2, [r1, 0x20]
	movs r5, 0x20
	ldrsh r0, [r1, r5]
	cmp r0, 0xD0
	beq _080F4890
	subs r0, r2, 0x1
	strh r0, [r1, 0x20]
	ldrb r1, [r3, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	b _080F48BC
	.align 2, 0
_080F4848: .4byte gSprites
_080F484C:
	ldr r0, _080F4888 @ =gUnknown_203AB40
	ldr r0, [r0]
	ldrb r1, [r0, 0x1D]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080F48C2
	ldr r4, _080F488C @ =gSprites
	ldrb r0, [r3, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r2, [r1, 0x22]
	movs r5, 0x22
	ldrsh r0, [r1, r5]
	cmp r0, 0x50
	beq _080F4890
	subs r0, r2, 0x1
	strh r0, [r1, 0x22]
	ldrb r1, [r3, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x22]
	subs r1, 0x1
	strh r1, [r0, 0x22]
	b _080F48C2
	.align 2, 0
_080F4888: .4byte gUnknown_203AB40
_080F488C: .4byte gSprites
_080F4890:
	movs r0, 0
	strb r0, [r3]
	b _080F48C2
_080F4896:
	ldr r0, _080F48C8 @ =gUnknown_203AB40
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0xF
	bne _080F48C2
	ldr r2, _080F48CC @ =gSprites
	ldrb r1, [r3, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x20]
	subs r1, 0x1
	strh r1, [r0, 0x20]
	ldrb r1, [r3, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
_080F48BC:
	ldrh r1, [r0, 0x20]
	subs r1, 0x1
	strh r1, [r0, 0x20]
_080F48C2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F48C8: .4byte gUnknown_203AB40
_080F48CC: .4byte gSprites
	thumb_func_end sub_80F47F8

	thumb_func_start sub_80F48D0
sub_80F48D0: @ 80F48D0
	push {r4-r6,lr}
	ldr r6, _080F4924 @ =gUnknown_203AB40
	ldr r1, [r6]
	ldrb r0, [r1, 0x2]
	cmp r0, 0xFF
	beq _080F491E
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080F4928 @ =gTasks+0x8
	adds r4, r0
	ldrh r0, [r4, 0x2]
	bl FreeSpriteTilesByTag
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _080F492C @ =gSprites
	adds r0, r5
	bl DestroySprite
	ldrh r0, [r4, 0x8]
	bl FreeSpriteTilesByTag
	ldrb r1, [r4, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	ldr r0, [r6]
	ldrb r0, [r0, 0x2]
	bl DestroyTask
	ldr r1, [r6]
	movs r0, 0xFF
	strb r0, [r1, 0x2]
_080F491E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F4924: .4byte gUnknown_203AB40
_080F4928: .4byte gTasks+0x8
_080F492C: .4byte gSprites
	thumb_func_end sub_80F48D0

	thumb_func_start sub_80F4930
sub_80F4930: @ 80F4930
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x20
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, _080F4988 @ =gUnknown_203AB40
	ldr r0, [r4]
	ldrb r0, [r0, 0x2]
	cmp r0, 0xFF
	beq _080F494A
	b _080F4BDE
_080F494A:
	ldr r0, _080F498C @ =sub_80F47F8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r2, _080F4990 @ =gTasks+0x8
	adds r6, r1, r2
	ldr r1, [r4]
	strb r0, [r1, 0x2]
	ldr r1, _080F4994 @ =gUnknown_841431C
	lsls r2, r7, 1
	adds r0, r2, r7
	lsls r0, 1
	adds r1, 0x4
	adds r0, r1
	ldrh r0, [r0]
	mov r8, r2
	cmp r0, 0x1
	beq _080F4998
	cmp r0, 0x1
	ble _080F4980
	cmp r0, 0x2
	beq _080F49A2
_080F4980:
	movs r4, 0xD0
	movs r0, 0x50
	mov r9, r0
	b _080F49A8
	.align 2, 0
_080F4988: .4byte gUnknown_203AB40
_080F498C: .4byte sub_80F47F8
_080F4990: .4byte gTasks+0x8
_080F4994: .4byte gUnknown_841431C
_080F4998:
	movs r4, 0x88
	lsls r4, 1
	movs r2, 0x50
	mov r9, r2
	b _080F49A8
_080F49A2:
	movs r4, 0xD0
	movs r3, 0xA0
	mov r9, r3
_080F49A8:
	ldr r2, _080F49D0 @ =gUnknown_841431C
	mov r5, r8
	adds r1, r5, r7
	lsls r1, 1
	adds r0, r2, 0x4
	adds r0, r1, r0
	ldrh r0, [r0]
	strb r0, [r6]
	movs r0, 0x80
	lsls r0, 6
	strh r0, [r6, 0x2]
	ldr r0, _080F49D4 @ =0x0000ffff
	strh r0, [r6, 0x4]
	adds r1, r2
	ldrh r0, [r1]
	cmp r0, 0
	beq _080F49D8
	cmp r0, 0x1
	beq _080F4A4C
	b _080F4A6C
	.align 2, 0
_080F49D0: .4byte gUnknown_841431C
_080F49D4: .4byte 0x0000ffff
_080F49D8:
	ldr r0, _080F4A0C @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _080F4A20
	ldr r0, _080F4A10 @ =gUnknown_8410E30
	str r0, [sp, 0x18]
	ldr r1, _080F4A14 @ =0xffff0000
	add r0, sp, 0x18
	ldr r3, [r0, 0x4]
	ands r3, r1
	movs r1, 0xC0
	lsls r1, 6
	orrs r3, r1
	str r3, [r0, 0x4]
	ldrh r2, [r6, 0x2]
	lsls r2, 16
	ldr r1, _080F4A18 @ =0x0000ffff
	ands r1, r3
	orrs r1, r2
	str r1, [r0, 0x4]
	bl LoadCompressedSpriteSheet
	ldr r0, _080F4A1C @ =gUnknown_8410E10
	b _080F4A36
	.align 2, 0
_080F4A0C: .4byte gSaveBlock2Ptr
_080F4A10: .4byte gUnknown_8410E30
_080F4A14: .4byte 0xffff0000
_080F4A18: .4byte 0x0000ffff
_080F4A1C: .4byte gUnknown_8410E10
_080F4A20:
	ldr r0, _080F4A44 @ =gUnknown_8411C18
	str r0, [sp, 0x18]
	add r0, sp, 0x18
	movs r1, 0xC0
	lsls r1, 6
	strh r1, [r0, 0x4]
	ldrh r1, [r6, 0x2]
	strh r1, [r0, 0x6]
	bl LoadCompressedSpriteSheet
	ldr r0, _080F4A48 @ =gUnknown_8411BF8
_080F4A36:
	movs r1, 0xF8
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	b _080F4A6C
	.align 2, 0
_080F4A44: .4byte gUnknown_8411C18
_080F4A48: .4byte gUnknown_8411BF8
_080F4A4C:
	ldr r0, _080F4AD8 @ =gUnknown_84129C0
	str r0, [sp, 0x18]
	add r0, sp, 0x18
	movs r1, 0xC0
	lsls r1, 6
	strh r1, [r0, 0x4]
	ldrh r1, [r6, 0x2]
	strh r1, [r0, 0x6]
	bl LoadCompressedSpriteSheet
	ldr r0, _080F4ADC @ =gUnknown_84129A0
	movs r1, 0xF8
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
_080F4A6C:
	mov r1, sp
	ldr r0, _080F4AE0 @ =gUnknown_8414364
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	mov r1, sp
	ldrh r0, [r6, 0x2]
	movs r5, 0
	strh r0, [r1]
	lsls r4, 16
	asrs r1, r4, 16
	mov r2, r9
	mov r0, sp
	movs r3, 0
	bl CreateSprite
	strb r0, [r6, 0x1]
	ldr r3, _080F4AE4 @ =gSprites
	ldrb r1, [r6, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x5]
	movs r2, 0xF0
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldrb r1, [r6, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x43
	strb r5, [r0]
	ldr r0, _080F4AE8 @ =0x00002001
	strh r0, [r6, 0x8]
	ldr r0, _080F4AEC @ =0x0000ffff
	strh r0, [r6, 0xA]
	ldr r1, _080F4AF0 @ =gUnknown_841431C
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 1
	adds r1, 0x2
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _080F4B20
	cmp r0, 0x1
	bgt _080F4AF4
	cmp r0, 0
	beq _080F4AFE
	b _080F4BA0
	.align 2, 0
_080F4AD8: .4byte gUnknown_84129C0
_080F4ADC: .4byte gUnknown_84129A0
_080F4AE0: .4byte gUnknown_8414364
_080F4AE4: .4byte gSprites
_080F4AE8: .4byte 0x00002001
_080F4AEC: .4byte 0x0000ffff
_080F4AF0: .4byte gUnknown_841431C
_080F4AF4:
	cmp r0, 0x2
	beq _080F4B54
	cmp r0, 0x3
	beq _080F4B74
	b _080F4BA0
_080F4AFE:
	ldr r0, _080F4B18 @ =gUnknown_8413338
	str r0, [sp, 0x18]
	add r0, sp, 0x18
	movs r1, 0xC0
	lsls r1, 6
	strh r1, [r0, 0x4]
	ldrh r1, [r6, 0x8]
	strh r1, [r0, 0x6]
	bl LoadCompressedSpriteSheet
	ldr r0, _080F4B1C @ =gUnknown_8413318
	b _080F4B8A
	.align 2, 0
_080F4B18: .4byte gUnknown_8413338
_080F4B1C: .4byte gUnknown_8413318
_080F4B20:
	ldr r0, _080F4B48 @ =gUnknown_8413338
	str r0, [sp, 0x18]
	add r0, sp, 0x18
	movs r1, 0xC0
	lsls r1, 6
	strh r1, [r0, 0x4]
	ldrh r1, [r6, 0x8]
	strh r1, [r0, 0x6]
	bl LoadCompressedSpriteSheet
	ldr r0, _080F4B4C @ =gUnknown_8413318
	movs r1, 0xF0
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	mov r1, sp
	ldr r0, _080F4B50 @ =gUnknown_84143D0
	b _080F4B98
	.align 2, 0
_080F4B48: .4byte gUnknown_8413338
_080F4B4C: .4byte gUnknown_8413318
_080F4B50: .4byte gUnknown_84143D0
_080F4B54:
	ldr r0, _080F4B6C @ =gUnknown_8413874
	str r0, [sp, 0x18]
	add r0, sp, 0x18
	movs r1, 0xC0
	lsls r1, 6
	strh r1, [r0, 0x4]
	ldrh r1, [r6, 0x8]
	strh r1, [r0, 0x6]
	bl LoadCompressedSpriteSheet
	ldr r0, _080F4B70 @ =gUnknown_8413854
	b _080F4B8A
	.align 2, 0
_080F4B6C: .4byte gUnknown_8413874
_080F4B70: .4byte gUnknown_8413854
_080F4B74:
	ldr r0, _080F4BEC @ =gUnknown_8413DB8
	str r0, [sp, 0x18]
	add r0, sp, 0x18
	movs r1, 0xC0
	lsls r1, 6
	strh r1, [r0, 0x4]
	ldrh r1, [r6, 0x8]
	strh r1, [r0, 0x6]
	bl LoadCompressedSpriteSheet
	ldr r0, _080F4BF0 @ =gUnknown_8413D98
_080F4B8A:
	movs r1, 0xF0
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	mov r1, sp
	ldr r0, _080F4BF4 @ =gUnknown_84143B8
_080F4B98:
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
_080F4BA0:
	mov r1, sp
	ldrh r0, [r6, 0x8]
	strh r0, [r1]
	asrs r1, r4, 16
	mov r2, r9
	adds r2, 0x26
	mov r0, sp
	movs r3, 0
	bl CreateSprite
	strb r0, [r6, 0x6]
	ldr r3, _080F4BF8 @ =gSprites
	ldrb r1, [r6, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0, 0x5]
	movs r1, 0xF
	ands r1, r2
	movs r2, 0xE0
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldrb r1, [r6, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x43
	movs r1, 0x1
	strb r1, [r0]
_080F4BDE:
	add sp, 0x20
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F4BEC: .4byte gUnknown_8413DB8
_080F4BF0: .4byte gUnknown_8413D98
_080F4BF4: .4byte gUnknown_84143B8
_080F4BF8: .4byte gSprites
	thumb_func_end sub_80F4930

	.align 2, 0 @ Don't pad with nop.
