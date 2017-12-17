	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8142078
sub_8142078: @ 8142078
	push {lr}
	bl ProcessSpriteCopyRequests
	bl LoadOam
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8142078

	thumb_func_start sub_814208C
sub_814208C: @ 814208C
	push {lr}
	bl RunTasks
	bl sub_8002DE8
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_814208C

	thumb_func_start sub_81420A4
sub_81420A4: @ 81420A4
	push {r4-r7,lr}
	sub sp, 0xC
	adds r7, r0, 0
	ldr r0, _081420C4 @ =gUnknown_30030F0
	movs r1, 0x87
	lsls r1, 3
	adds r6, r0, r1
	ldrb r5, [r6]
	cmp r5, 0x1
	bne _081420BA
	b _081421EC
_081420BA:
	cmp r5, 0x1
	bgt _081420C8
	cmp r5, 0
	beq _081420D6
	b _081422A0
	.align 2, 0
_081420C4: .4byte gUnknown_30030F0
_081420C8:
	cmp r5, 0x2
	bne _081420CE
	b _08142254
_081420CE:
	cmp r5, 0x3
	bne _081420D4
	b _08142274
_081420D4:
	b _081422A0
_081420D6:
	movs r0, 0
	bl SetVBlankCallback
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	bl remove_some_task
	movs r0, 0x1
	bl sub_8001618
	ldr r1, _081421E0 @ =gUnknown_8466D60
	movs r0, 0
	movs r2, 0x4
	bl sub_8001658
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
	movs r4, 0x80
	lsls r4, 4
	adds r0, r4, 0
	bl Alloc
	adds r1, r0, 0
	movs r0, 0x3
	bl SetBgTilemapBuffer
	adds r0, r4, 0
	bl Alloc
	adds r1, r0, 0
	movs r0, 0x2
	bl SetBgTilemapBuffer
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
	movs r0, 0
	movs r1, 0xA
	movs r2, 0xE0
	bl sub_814FE40
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xF0
	bl sub_814FDA0
	ldr r1, _081421E4 @ =gUnknown_8466D30
	movs r2, 0x80
	lsls r2, 1
	str r5, [sp]
	movs r0, 0x3
	movs r3, 0
	bl sub_80F696C
	ldr r0, _081421E8 @ =gUnknown_8466D70
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r1, 0xC0
	lsls r1, 7
	movs r0, 0
	bl ClearGpuRegBits
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	b _0814226C
	.align 2, 0
_081421E0: .4byte gUnknown_8466D60
_081421E4: .4byte gUnknown_8466D30
_081421E8: .4byte gUnknown_8466D70
_081421EC:
	ldr r0, _08142250 @ =gUnknown_8466D10
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0x2
	bl stdpal_get
	movs r1, 0xD0
	movs r2, 0x20
	bl LoadPalette
	movs r4, 0x20
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r5, 0x11
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	bl sub_8142420
	lsls r0, r7, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8142344
	b _0814226C
	.align 2, 0
_08142250: .4byte gUnknown_8466D10
_08142254:
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
_0814226C:
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	b _081422A0
_08142274:
	movs r0, 0
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	ldr r0, _08142298 @ =0x00000149
	bl PlayBGM
	ldr r0, _0814229C @ =sub_8142078
	bl SetVBlankCallback
	movs r0, 0xC5
	bl EnableInterrupts
	movs r0, 0x1
	b _081422A2
	.align 2, 0
_08142298: .4byte 0x00000149
_0814229C: .4byte sub_8142078
_081422A0:
	movs r0, 0
_081422A2:
	add sp, 0xC
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81420A4

	thumb_func_start sub_81422AC
sub_81422AC: @ 81422AC
	push {lr}
	movs r0, 0
	bl sub_81420A4
	cmp r0, 0
	beq _081422C8
	ldr r0, _081422CC @ =sub_814208C
	bl SetMainCallback2
	ldr r1, _081422D0 @ =gUnknown_203F3B8
	movs r0, 0
	strb r0, [r1]
	bl task_add_00_mystery_gift
_081422C8:
	pop {r0}
	bx r0
	.align 2, 0
_081422CC: .4byte sub_814208C
_081422D0: .4byte gUnknown_203F3B8
	thumb_func_end sub_81422AC

	thumb_func_start sub_81422D4
sub_81422D4: @ 81422D4
	push {lr}
	movs r0, 0x1
	bl sub_81420A4
	cmp r0, 0
	beq _081422F0
	ldr r0, _081422F4 @ =sub_814208C
	bl SetMainCallback2
	ldr r1, _081422F8 @ =gUnknown_203F3B8
	movs r0, 0x1
	strb r0, [r1]
	bl sub_81438A0
_081422F0:
	pop {r0}
	bx r0
	.align 2, 0
_081422F4: .4byte sub_814208C
_081422F8: .4byte gUnknown_203F3B8
	thumb_func_end sub_81422D4

	thumb_func_start sub_81422FC
sub_81422FC: @ 81422FC
	push {lr}
	ldr r1, _0814233C @ =gUnknown_203F3B8
	movs r0, 0
	strb r0, [r1]
	bl FreeAllWindowBuffers
	movs r0, 0
	bl GetBgTilemapBuffer
	bl Free
	movs r0, 0x1
	bl GetBgTilemapBuffer
	bl Free
	movs r0, 0x2
	bl GetBgTilemapBuffer
	bl Free
	movs r0, 0x3
	bl GetBgTilemapBuffer
	bl Free
	ldr r0, _08142340 @ =sub_8078914
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0814233C: .4byte gUnknown_203F3B8
_08142340: .4byte sub_8078914
	thumb_func_end sub_81422FC

	thumb_func_start sub_8142344
sub_8142344: @ 8142344
	push {r4-r6,lr}
	sub sp, 0x14
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	cmp r5, 0
	bne _081423B4
	ldr r6, _081423A4 @ =gUnknown_841EDCA
	cmp r4, 0x1
	bne _08142362
	ldr r6, _081423A8 @ =gUnknown_8415F51
_08142362:
	str r5, [sp]
	str r5, [sp, 0x4]
	ldr r4, _081423AC @ =gUnknown_8466EE8
	str r4, [sp, 0x8]
	str r5, [sp, 0xC]
	ldr r0, _081423B0 @ =gUnknown_841EDBD
	str r0, [sp, 0x10]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x2
	movs r3, 0x2
	bl AddTextPrinterParametrized2
	movs r0, 0
	adds r1, r6, 0
	movs r2, 0
	bl sub_8005ED4
	movs r2, 0xDE
	subs r2, r0
	lsls r2, 24
	lsrs r2, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	str r5, [sp, 0xC]
	str r6, [sp, 0x10]
	movs r0, 0
	movs r1, 0
	movs r3, 0x2
	bl AddTextPrinterParametrized2
	b _081423E8
	.align 2, 0
_081423A4: .4byte gUnknown_841EDCA
_081423A8: .4byte gUnknown_8415F51
_081423AC: .4byte gUnknown_8466EE8
_081423B0: .4byte gUnknown_841EDBD
_081423B4:
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	ldr r5, _08142400 @ =gUnknown_8466EE8
	str r5, [sp, 0x8]
	str r4, [sp, 0xC]
	ldr r0, _08142404 @ =gUnknown_841DE50
	str r0, [sp, 0x10]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x2
	movs r3, 0x2
	bl AddTextPrinterParametrized2
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	str r4, [sp, 0xC]
	ldr r0, _08142408 @ =gUnknown_841DE51
	str r0, [sp, 0x10]
	movs r0, 0
	movs r1, 0
	movs r2, 0x78
	movs r3, 0x2
	bl AddTextPrinterParametrized2
_081423E8:
	movs r0, 0
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0
	bl PutWindowTilemap
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08142400: .4byte gUnknown_8466EE8
_08142404: .4byte gUnknown_841DE50
_08142408: .4byte gUnknown_841DE51
	thumb_func_end sub_8142344

	.align 2, 0 @ Don't pad with nop.
