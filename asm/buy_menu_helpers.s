	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_813F66C
sub_813F66C: @ 813F66C
	push {r4,lr}
	adds r4, r0, 0
	cmp r4, 0x1
	beq _0813F680
	ldr r0, _0813F67C @ =gUnknown_8464804
	bl InitWindows
	b _0813F686
	.align 2, 0
_0813F67C: .4byte gUnknown_8464804
_0813F680:
	ldr r0, _0813F6CC @ =gUnknown_846483C
	bl InitWindows
_0813F686:
	bl DeactivateAllTextPrinters
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xD0
	bl TextWindow_SetUserSelectedFrame
	movs r0, 0
	movs r1, 0x13
	movs r2, 0xE0
	bl TextWindow_LoadResourcesStdFrame0
	movs r0, 0
	movs r1, 0xA
	movs r2, 0xF0
	bl TextWindow_SetStdFrame0_WithPal
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x4
	bl PutWindowTilemap
	movs r0, 0x5
	bl PutWindowTilemap
	cmp r4, 0x1
	bne _0813F6C4
	movs r0, 0x6
	bl PutWindowTilemap
_0813F6C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813F6CC: .4byte gUnknown_846483C
	thumb_func_end sub_813F66C

	thumb_func_start sub_813F6D0
sub_813F6D0: @ 813F6D0
	push {lr}
	ldr r0, _0813F6F0 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	bl GetMoney
	adds r3, r0, 0
	movs r0, 0
	movs r1, 0xA
	movs r2, 0xF
	bl PrintMoneyAmountInMoneyBoxWithBorder
	pop {r0}
	bx r0
	.align 2, 0
_0813F6F0: .4byte gSaveBlock1Ptr
	thumb_func_end sub_813F6D0

	thumb_func_start sub_813F6F4
sub_813F6F4: @ 813F6F4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	mov r9, r3
	ldr r3, [sp, 0x30]
	ldr r4, [sp, 0x34]
	ldr r6, [sp, 0x38]
	ldr r5, [sp, 0x3C]
	mov r8, r5
	ldr r5, [sp, 0x40]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r7, r9
	lsls r7, 24
	lsrs r7, 24
	mov r9, r7
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 24
	lsrs r5, 24
	str r4, [sp]
	str r6, [sp, 0x4]
	lsls r4, r5, 1
	adds r4, r5
	ldr r5, _0813F758 @ =gUnknown_8464884
	adds r4, r5
	str r4, [sp, 0x8]
	mov r4, r8
	lsls r4, 24
	asrs r4, 24
	str r4, [sp, 0xC]
	str r2, [sp, 0x10]
	mov r2, r9
	bl AddTextPrinterParameterized4
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813F758: .4byte gUnknown_8464884
	thumb_func_end sub_813F6F4

	thumb_func_start sub_813F75C
sub_813F75C: @ 813F75C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x10
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r5, 24
	lsrs r5, 24
	bl sub_809B56C
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl GetTextSpeedSetting
	lsls r0, 24
	lsrs r0, 24
	str r4, [sp]
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	mov r0, r8
	str r0, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0x2
	movs r2, 0x13
	movs r3, 0xE
	bl DisplayMessageAndContinueTask
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_813F75C

	thumb_func_start sub_813F7A8
sub_813F7A8: @ 813F7A8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x1
	movs r3, 0xD
	bl SetWindowBorderStyle
	pop {r0}
	bx r0
	thumb_func_end sub_813F7A8

	thumb_func_start sub_813F7C0
sub_813F7C0: @ 813F7C0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0xA
	movs r3, 0xF
	bl SetWindowBorderStyle
	pop {r0}
	bx r0
	thumb_func_end sub_813F7C0

	thumb_func_start sub_813F7D8
sub_813F7D8: @ 813F7D8
	push {lr}
	sub sp, 0x10
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813F800 @ =gUnknown_846487C
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x1
	str r2, [sp, 0x4]
	movs r2, 0xD
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	movs r2, 0x2
	movs r3, 0
	bl CreateYesNoMenuWithCallbacks
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_0813F800: .4byte gUnknown_846487C
	thumb_func_end sub_813F7D8

	.align 2, 0 @ Don't pad with nop.
