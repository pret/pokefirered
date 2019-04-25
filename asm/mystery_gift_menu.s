	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_81422AC
sub_81422AC: @ 81422AC
	push {lr}
	movs r0, 0
	bl HandleMysteryGiftOrEReaderSetup
	cmp r0, 0
	beq _081422C8
	ldr r0, _081422CC @ =c2_mystery_gift_e_reader_run
	bl SetMainCallback2
	ldr r1, _081422D0 @ =gUnknown_203F3B8
	movs r0, 0
	strb r0, [r1]
	bl task_add_00_mystery_gift
_081422C8:
	pop {r0}
	bx r0
	.align 2, 0
_081422CC: .4byte c2_mystery_gift_e_reader_run
_081422D0: .4byte gUnknown_203F3B8
	thumb_func_end sub_81422AC

	thumb_func_start sub_81422D4
sub_81422D4: @ 81422D4
	push {lr}
	movs r0, 0x1
	bl HandleMysteryGiftOrEReaderSetup
	cmp r0, 0
	beq _081422F0
	ldr r0, _081422F4 @ =c2_mystery_gift_e_reader_run
	bl SetMainCallback2
	ldr r1, _081422F8 @ =gUnknown_203F3B8
	movs r0, 0x1
	strb r0, [r1]
	bl sub_81438A0
_081422F0:
	pop {r0}
	bx r0
	.align 2, 0
_081422F4: .4byte c2_mystery_gift_e_reader_run
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
	bl GetStringWidth
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
