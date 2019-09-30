	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_813E910
sub_813E910: @ 813E910
	push {r4,lr}
	ldr r0, _0813E994 @ =gUnknown_84643B8
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xE0
	bl TextWindow_SetUserSelectedFrame
	movs r0, 0
	movs r1, 0x13
	movs r2, 0xD0
	bl TextWindow_LoadResourcesStdFrame0
	movs r0, 0
	movs r1, 0xA
	movs r2, 0xC0
	bl TextWindow_SetStdFrame0_WithPal
	ldr r0, _0813E998 @ =gTMCaseMainWindowPalette
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	movs r4, 0
_0813E946:
	adds r0, r4, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0813E946
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	movs r4, 0
	ldr r3, _0813E99C @ =gUnknown_203F38C
	movs r2, 0xFF
_0813E97C:
	adds r0, r4, r3
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xD
	bls _0813E97C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813E994: .4byte gUnknown_84643B8
_0813E998: .4byte gTMCaseMainWindowPalette
_0813E99C: .4byte gUnknown_203F38C
	thumb_func_end sub_813E910

	thumb_func_start sub_813E9A0
sub_813E9A0: @ 813E9A0
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
	ldr r5, _0813EA04 @ =gUnknown_8464448
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
_0813EA04: .4byte gUnknown_8464448
	thumb_func_end sub_813E9A0

	thumb_func_start sub_813EA08
sub_813EA08: @ 813EA08
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813EA4C @ =gUnknown_203F38C
	adds r5, r4, r0
	ldrb r0, [r5]
	cmp r0, 0xFF
	bne _0813EA6C
	lsls r0, r4, 3
	ldr r1, _0813EA50 @ =gUnknown_84643D8
	adds r0, r1
	bl AddWindow
	strb r0, [r5]
	cmp r4, 0x2
	beq _0813EA38
	cmp r4, 0x6
	beq _0813EA38
	cmp r4, 0x7
	beq _0813EA38
	cmp r4, 0x8
	beq _0813EA38
	cmp r4, 0x9
	bne _0813EA54
_0813EA38:
	ldr r0, _0813EA4C @ =gUnknown_203F38C
	adds r0, r4, r0
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0xC
	bl DrawStdFrameWithCustomTileAndPalette
	b _0813EA60
	.align 2, 0
_0813EA4C: .4byte gUnknown_203F38C
_0813EA50: .4byte gUnknown_84643D8
_0813EA54:
	ldrb r0, [r5]
	movs r1, 0
	movs r2, 0x1
	movs r3, 0xE
	bl DrawStdFrameWithCustomTileAndPalette
_0813EA60:
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r0, _0813EA74 @ =gUnknown_203F38C
	adds r0, r4, r0
	ldrb r0, [r0]
_0813EA6C:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0813EA74: .4byte gUnknown_203F38C
	thumb_func_end sub_813EA08

	thumb_func_start sub_813EA78
sub_813EA78: @ 813EA78
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813EA94 @ =gUnknown_203F38C
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0x1
	movs r3, 0xE
	bl DrawStdFrameWithCustomTileAndPalette
	pop {r0}
	bx r0
	.align 2, 0
_0813EA94: .4byte gUnknown_203F38C
	thumb_func_end sub_813EA78

	thumb_func_start sub_813EA98
sub_813EA98: @ 813EA98
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0813EAC8 @ =gUnknown_203F38C
	adds r4, r0
	ldrb r0, [r4]
	movs r1, 0
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	movs r0, 0xFF
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813EAC8: .4byte gUnknown_203F38C
	thumb_func_end sub_813EA98

	thumb_func_start sub_813EACC
sub_813EACC: @ 813EACC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813EB0C @ =gUnknown_203F38C
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _0813EB04
	movs r1, 0
	bl ClearDialogWindowAndFrameToTransparent
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	movs r0, 0xFF
	strb r0, [r4]
_0813EB04:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813EB0C: .4byte gUnknown_203F38C
	thumb_func_end sub_813EACC

	thumb_func_start sub_813EB10
sub_813EB10: @ 813EB10
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813EB1C @ =gUnknown_203F38C
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0813EB1C: .4byte gUnknown_203F38C
	thumb_func_end sub_813EB10

	thumb_func_start DisplayItemMessageInBerryPouch
DisplayItemMessageInBerryPouch: @ 813EB20
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r7, r2, 0
	mov r8, r3
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r4, _0813EB74 @ =gUnknown_203F38C
	ldrb r0, [r4, 0x5]
	cmp r0, 0xFF
	bne _0813EB44
	ldr r0, _0813EB78 @ =gUnknown_84643D8 + 0x28
	bl AddWindow
	strb r0, [r4, 0x5]
_0813EB44:
	bl GetTextSpeedSetting
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4, 0x5]
	str r5, [sp]
	str r0, [sp, 0x4]
	str r7, [sp, 0x8]
	mov r0, r8
	str r0, [sp, 0xC]
	adds r0, r6, 0
	movs r2, 0x13
	movs r3, 0xD
	bl DisplayMessageAndContinueTask
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813EB74: .4byte gUnknown_203F38C
_0813EB78: .4byte gUnknown_84643D8 + 0x28
	thumb_func_end DisplayItemMessageInBerryPouch

	thumb_func_start sub_813EB7C
sub_813EB7C: @ 813EB7C
	push {lr}
	sub sp, 0x10
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813EBA4 @ =gUnknown_84643D8 + 0x18
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x1
	str r2, [sp, 0x4]
	movs r2, 0xE
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	movs r2, 0x2
	movs r3, 0
	bl CreateYesNoMenuWithCallbacks
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_0813EBA4: .4byte gUnknown_84643D8 + 0x18
	thumb_func_end sub_813EB7C

	thumb_func_start sub_813EBA8
sub_813EBA8: @ 813EBA8
	push {lr}
	sub sp, 0x10
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813EBD0 @ =gUnknown_84643D8 + 0x20
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x1
	str r2, [sp, 0x4]
	movs r2, 0xE
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	movs r2, 0x2
	movs r3, 0
	bl CreateYesNoMenuWithCallbacks
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_0813EBD0: .4byte gUnknown_84643D8 + 0x20
	thumb_func_end sub_813EBA8

	thumb_func_start sub_813EBD4
sub_813EBD4: @ 813EBD4
	push {r4,lr}
	movs r0, 0x2
	bl sub_813EA08
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0813EC04 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	bl GetMoney
	adds r3, r0, 0
	adds r0, r4, 0
	movs r1, 0xA
	movs r2, 0xC
	bl PrintMoneyAmountInMoneyBoxWithBorder
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813EC04: .4byte gSaveBlock1Ptr
	thumb_func_end sub_813EBD4

	thumb_func_start sub_813EC08
sub_813EC08: @ 813EC08
	push {lr}
	ldr r0, _0813EC20 @ =gUnknown_84644B8
	movs r1, 0x28
	movs r2, 0x4C
	movs r3, 0
	bl CreateSprite
	ldr r1, _0813EC24 @ =gUnknown_203F39C
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0813EC20: .4byte gUnknown_84644B8
_0813EC24: .4byte gUnknown_203F39C
	thumb_func_end sub_813EC08

	thumb_func_start sub_813EC28
sub_813EC28: @ 813EC28
	push {r4,lr}
	ldr r0, _0813EC58 @ =gUnknown_203F39C
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0813EC5C @ =gSprites
	adds r4, r0, r1
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0813EC52
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r0, _0813EC60 @ =sub_813EC64
	str r0, [r4, 0x1C]
_0813EC52:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813EC58: .4byte gUnknown_203F39C
_0813EC5C: .4byte gSprites
_0813EC60: .4byte sub_813EC64
	thumb_func_end sub_813EC28

	thumb_func_start sub_813EC64
sub_813EC64: @ 813EC64
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0813EC80
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	ldr r0, _0813EC88 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_0813EC80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813EC88: .4byte SpriteCallbackDummy
	thumb_func_end sub_813EC64

	.align 2, 0 @ Don't pad with nop.
