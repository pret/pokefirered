	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start IsDodrioInParty
IsDodrioInParty: @ 81537C0
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, _081537F0 @ =gSpecialVar_Result
_081537C6:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _081537F4 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x5
	bl GetMonData
	cmp r0, 0
	beq _081537F8
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0x55
	bne _081537F8
	movs r0, 0x1
	strh r0, [r6]
	b _08153804
	.align 2, 0
_081537F0: .4byte gSpecialVar_Result
_081537F4: .4byte gPlayerParty
_081537F8:
	adds r5, 0x1
	cmp r5, 0x5
	ble _081537C6
	ldr r1, _0815380C @ =gSpecialVar_Result
	movs r0, 0
	strh r0, [r1]
_08153804:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815380C: .4byte gSpecialVar_Result
	thumb_func_end IsDodrioInParty

	thumb_func_start ShowDodrioBerryPickingRecords
ShowDodrioBerryPickingRecords: @ 8153810
	push {r4,lr}
	ldr r4, _0815382C @ =sub_8153830
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815382C: .4byte sub_8153830
	thumb_func_end ShowDodrioBerryPickingRecords

	thumb_func_start sub_8153830
sub_8153830: @ 8153830
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08153854 @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0815387C
	cmp r0, 0x1
	bgt _08153858
	cmp r0, 0
	beq _08153862
	b _081538CA
	.align 2, 0
_08153854: .4byte gTasks+0x8
_08153858:
	cmp r0, 0x2
	beq _08153888
	cmp r0, 0x3
	beq _081538B0
	b _081538CA
_08153862:
	ldr r0, _08153878 @ =sUnknown_84755E0
	bl AddWindow
	strh r0, [r4, 0x2]
	lsls r0, 24
	lsrs r0, 24
	bl sub_81538D0
	ldrb r0, [r4, 0x2]
	movs r1, 0x3
	b _0815389E
	.align 2, 0
_08153878: .4byte sUnknown_84755E0
_0815387C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081538CA
	b _081538A2
_08153888:
	ldr r0, _081538AC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _081538CA
	ldrb r0, [r4, 0x2]
	bl rbox_fill_rectangle
	ldrb r0, [r4, 0x2]
	movs r1, 0x1
_0815389E:
	bl CopyWindowToVram
_081538A2:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _081538CA
	.align 2, 0
_081538AC: .4byte gMain
_081538B0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081538CA
	ldrb r0, [r4, 0x2]
	bl RemoveWindow
	adds r0, r5, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_081538CA:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8153830

	thumb_func_start sub_81538D0
sub_81538D0: @ 81538D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x30
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _081539CC @ =gSaveBlock2Ptr
	ldr r1, [r0]
	ldr r2, _081539D0 @ =0x00000b14
	adds r0, r1, r2
	ldrh r0, [r0]
	str r0, [sp, 0xC]
	subs r2, 0x4
	adds r0, r1, r2
	ldr r0, [r0]
	str r0, [sp, 0x10]
	ldr r0, _081539D4 @ =0x00000b16
	adds r1, r0
	ldrh r0, [r1]
	str r0, [sp, 0x14]
	ldr r4, _081539D8 @ =0x0000021d
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0xD0
	bl TextWindow_SetStdFrame0_WithPal
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0xD
	bl DrawTextBorderOuter
	adds r0, r7, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, _081539DC @ =sUnknown_84755E8
	ldr r2, [r0]
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	adds r0, r7, 0
	movs r1, 0x2
	movs r3, 0x1
	bl AddTextPrinterParameterized
	movs r4, 0
	add r2, sp, 0x18
	mov r8, r2
	movs r0, 0xFF
	mov r10, r0
	mov r9, r4
	mov r2, sp
	adds r2, 0xC
	str r2, [sp, 0x2C]
_08153946:
	ldr r0, [sp, 0x2C]
	ldm r0!, {r1}
	str r0, [sp, 0x2C]
	ldr r0, _081539E0 @ =sUnknown_84755F8
	adds r0, r4, r0
	ldrb r3, [r0]
	mov r0, r8
	movs r2, 0
	bl ConvertIntToDecimalStringN
	movs r0, 0x2
	mov r1, r8
	movs r2, 0x1
	negs r2, r2
	bl GetStringWidth
	adds r5, r0, 0
	ldr r1, _081539DC @ =sUnknown_84755E8
	adds r6, r4, 0x1
	lsls r0, r6, 2
	adds r0, r1
	ldr r2, [r0]
	ldr r0, _081539E4 @ =sUnknown_84755FC
	lsls r4, 1
	adds r0, r4, r0
	ldrb r0, [r0]
	str r0, [sp]
	mov r0, r10
	str r0, [sp, 0x4]
	mov r0, r9
	str r0, [sp, 0x8]
	adds r0, r7, 0
	movs r1, 0x2
	movs r3, 0x1
	bl AddTextPrinterParameterized
	movs r3, 0xE0
	subs r3, r5
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _081539E8 @ =sUnknown_8475602
	adds r4, r0
	ldrb r0, [r4]
	str r0, [sp]
	mov r2, r10
	str r2, [sp, 0x4]
	mov r0, r9
	str r0, [sp, 0x8]
	adds r0, r7, 0
	movs r1, 0x2
	mov r2, r8
	bl AddTextPrinterParameterized
	adds r4, r6, 0
	cmp r4, 0x2
	ble _08153946
	adds r0, r7, 0
	bl PutWindowTilemap
	add sp, 0x30
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081539CC: .4byte gSaveBlock2Ptr
_081539D0: .4byte 0x00000b14
_081539D4: .4byte 0x00000b16
_081539D8: .4byte 0x0000021d
_081539DC: .4byte sUnknown_84755E8
_081539E0: .4byte sUnknown_84755F8
_081539E4: .4byte sUnknown_84755FC
_081539E8: .4byte sUnknown_8475602
	thumb_func_end sub_81538D0

	thumb_func_start sub_81539EC
sub_81539EC: @ 81539EC
	push {lr}
	bl GetLinkPlayerCount
	ldr r1, _08153A00 @ =gUnknown_203F3E0
	ldr r1, [r1]
	adds r1, 0x24
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08153A00: .4byte gUnknown_203F3E0
	thumb_func_end sub_81539EC

	thumb_func_start sub_8153A04
sub_8153A04: @ 8153A04
	push {r4-r7,lr}
	ldr r0, _08153A8C @ =gUnknown_203F3E0
	ldr r0, [r0]
	adds r0, 0x24
	ldrb r4, [r0]
	cmp r4, 0x4
	bhi _08153A32
	ldr r5, _08153A90 @ =sUnknown_8475648
_08153A14:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	ldr r1, _08153A94 @ =gLinkPlayers + 8
	adds r0, r1
	lsls r1, r4, 2
	adds r1, r5
	ldr r1, [r1]
	bl StringCopy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _08153A14
_08153A32:
	ldr r0, _08153A8C @ =gUnknown_203F3E0
	ldr r1, [r0]
	adds r1, 0x24
	movs r2, 0x5
	strb r2, [r1]
	movs r1, 0
	mov r12, r0
_08153A40:
	movs r4, 0
	mov r2, r12
	ldr r0, [r2]
	adds r0, 0x24
	adds r5, r1, 0x1
	ldrb r0, [r0]
	cmp r4, r0
	bcs _08153A7E
	ldr r7, _08153A8C @ =gUnknown_203F3E0
	lsls r3, r1, 1
	ldr r6, _08153A98 @ =sUnknown_8475608
_08153A56:
	ldr r2, [r7]
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r3, r0
	adds r1, r2, 0
	adds r1, 0x4A
	adds r1, r0
	lsls r0, r4, 3
	adds r0, r3, r0
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r2, 0x24
	ldrb r2, [r2]
	cmp r4, r2
	bcc _08153A56
_08153A7E:
	lsls r0, r5, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _08153A40
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08153A8C: .4byte gUnknown_203F3E0
_08153A90: .4byte sUnknown_8475648
_08153A94: .4byte gLinkPlayers + 8
_08153A98: .4byte sUnknown_8475608
	thumb_func_end sub_8153A04

	thumb_func_start sub_8153A9C
sub_8153A9C: @ 8153A9C
	push {r4,r5,lr}
	sub sp, 0x18
	movs r5, 0xC0
	lsls r5, 6
	adds r0, r5, 0
	bl AllocZeroed
	adds r4, r0, 0
	ldr r0, _08153AF0 @ =gUnknown_8478D90
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	ldr r0, _08153AF4 @ =gUnknown_8478D98
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x10]
	str r1, [sp, 0x14]
	ldr r0, _08153AF8 @ =sDodrioBerryPkmnGfx
	adds r1, r4, 0
	bl LZ77UnCompWram
	cmp r4, 0
	beq _08153ADC
	str r4, [sp]
	str r5, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl Free
_08153ADC:
	add r0, sp, 0x8
	bl LoadSpritePalette
	add r0, sp, 0x10
	bl LoadSpritePalette
	add sp, 0x18
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08153AF0: .4byte gUnknown_8478D90
_08153AF4: .4byte gUnknown_8478D98
_08153AF8: .4byte sDodrioBerryPkmnGfx
	thumb_func_end sub_8153A9C

	thumb_func_start sub_8153AFC
sub_8153AFC: @ 8153AFC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x30
	adds r6, r1, 0
	mov r8, r2
	adds r5, r3, 0
	lsls r6, 24
	lsrs r6, 24
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r5, 24
	lsrs r5, 24
	add r1, sp, 0x18
	movs r3, 0
	strh r3, [r1]
	ldrb r2, [r0]
	mov r0, sp
	adds r0, 0x1A
	strh r2, [r0]
	ldr r0, _08153B88 @ =sOamData_8478C98
	str r0, [sp, 0x1C]
	ldr r0, _08153B8C @ =sSpriteAnimTable_8478CE0
	str r0, [sp, 0x20]
	str r3, [sp, 0x24]
	ldr r0, _08153B90 @ =gDummySpriteAffineAnimTable
	str r0, [sp, 0x28]
	ldr r0, _08153B94 @ =sub_8153B9C
	str r0, [sp, 0x2C]
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	movs r0, 0x4
	bl AllocZeroed
	ldr r1, _08153B98 @ =gUnknown_203F3E4
	mov r2, r8
	lsls r4, r2, 2
	adds r4, r1
	str r0, [r4]
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8154608
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	mov r0, sp
	movs r2, 0x88
	movs r3, 0x3
	bl CreateSprite
	ldr r1, [r4]
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
	movs r0, 0x1
	mov r1, r8
	bl sub_8153D48
	add sp, 0x30
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08153B88: .4byte sOamData_8478C98
_08153B8C: .4byte sSpriteAnimTable_8478CE0
_08153B90: .4byte gDummySpriteAffineAnimTable
_08153B94: .4byte sub_8153B9C
_08153B98: .4byte gUnknown_203F3E4
	thumb_func_end sub_8153AFC

	thumb_func_start sub_8153B9C
sub_8153B9C: @ 8153B9C
	push {lr}
	movs r2, 0x2E
	ldrsh r1, [r0, r2]
	cmp r1, 0x1
	beq _08153BB0
	cmp r1, 0x1
	ble _08153BBA
	cmp r1, 0x2
	beq _08153BB6
	b _08153BBA
_08153BB0:
	bl sub_8153C30
	b _08153BBA
_08153BB6:
	bl sub_8153CA0
_08153BBA:
	pop {r0}
	bx r0
	thumb_func_end sub_8153B9C

	thumb_func_start sub_8153BC0
sub_8153BC0: @ 8153BC0
	push {lr}
	bl GetMultiplayerId
	ldr r1, _08153BF0 @ =gUnknown_203F3E4
	lsls r0, 24
	lsrs r0, 22
	adds r0, r1
	ldr r0, [r0]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08153BF4 @ =gSprites
	adds r0, r1
	movs r2, 0
	movs r1, 0x1
	strh r1, [r0, 0x2E]
	strh r2, [r0, 0x30]
	strh r2, [r0, 0x32]
	strh r2, [r0, 0x34]
	strh r2, [r0, 0x36]
	pop {r0}
	bx r0
	.align 2, 0
_08153BF0: .4byte gUnknown_203F3E4
_08153BF4: .4byte gSprites
	thumb_func_end sub_8153BC0

	thumb_func_start sub_8153BF8
sub_8153BF8: @ 8153BF8
	push {lr}
	bl GetMultiplayerId
	ldr r1, _08153C28 @ =gUnknown_203F3E4
	lsls r0, 24
	lsrs r0, 22
	adds r0, r1
	ldr r0, [r0]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08153C2C @ =gSprites
	adds r0, r1
	movs r2, 0
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	strh r2, [r0, 0x30]
	strh r2, [r0, 0x32]
	strh r2, [r0, 0x34]
	strh r2, [r0, 0x36]
	pop {r0}
	bx r0
	.align 2, 0
_08153C28: .4byte gUnknown_203F3E4
_08153C2C: .4byte gSprites
	thumb_func_end sub_8153BF8

	thumb_func_start sub_8153C30
sub_8153C30: @ 8153C30
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r2, r0, 16
	lsrs r0, 31
	adds r0, r2, r0
	asrs r1, r0, 1
	adds r0, r1, 0
	cmp r1, 0
	bge _08153C4C
	adds r0, r1, 0x3
_08153C4C:
	asrs r0, 2
	lsls r0, 2
	subs r0, r1, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r2, 0x2
	ble _08153C96
	cmp r0, 0x2
	bgt _08153C62
	cmp r0, 0x1
	bge _08153C66
_08153C62:
	movs r0, 0x1
	b _08153C68
_08153C66:
	movs r0, 0xFF
_08153C68:
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x27
	ble _08153C96
	movs r0, 0
	strh r0, [r4, 0x2E]
	bl sub_81533B4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_8154608
	strh r0, [r4, 0x20]
_08153C96:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8153C30

	thumb_func_start sub_8153CA0
sub_8153CA0: @ 8153CA0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0xD
	bl __divsi3
	lsls r0, 16
	asrs r1, r0, 16
	adds r0, r1, 0
	cmp r1, 0
	bge _08153CC0
	adds r0, r1, 0x3
_08153CC0:
	asrs r0, 2
	lsls r0, 2
	subs r0, r1, r0
	lsls r0, 24
	lsrs r4, r0, 24
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	movs r1, 0xD
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _08153CE4
	cmp r4, 0
	beq _08153CE4
	movs r0, 0xCD
	bl PlaySE
_08153CE4:
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	cmp r0, 0x67
	ble _08153CF2
	movs r0, 0
	strh r0, [r5, 0x2E]
	movs r4, 0
_08153CF2:
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl sub_8153DA8
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8153CA0

	thumb_func_start sub_8153D08
sub_8153D08: @ 8153D08
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	cmp r4, r5
	bcs _08153D3A
	ldr r6, _08153D40 @ =gUnknown_203F3E4
_08153D16:
	lsls r0, r4, 2
	adds r0, r6
	ldr r0, [r0]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08153D44 @ =gSprites
	adds r0, r1
	cmp r0, 0
	beq _08153D30
	bl DestroySpriteAndFreeResources
_08153D30:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _08153D16
_08153D3A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08153D40: .4byte gUnknown_203F3E4
_08153D44: .4byte gSprites
	thumb_func_end sub_8153D08

	thumb_func_start sub_8153D48
sub_8153D48: @ 8153D48
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _08153D78 @ =gSprites
	ldr r2, _08153D7C @ =gUnknown_203F3E4
	lsrs r1, 22
	adds r1, r2
	ldr r1, [r1]
	ldrh r1, [r1]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
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
_08153D78: .4byte gSprites
_08153D7C: .4byte gUnknown_203F3E4
	thumb_func_end sub_8153D48

	thumb_func_start sub_8153D80
sub_8153D80: @ 8153D80
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	movs r4, 0
	cmp r4, r5
	bcs _08153DA2
_08153D90:
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_8153D48
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _08153D90
_08153DA2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8153D80

	thumb_func_start sub_8153DA8
sub_8153DA8: @ 8153DA8
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08153DCC @ =gUnknown_203F3E4
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ldrh r2, [r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r2, _08153DD0 @ =gSprites
	adds r0, r2
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_08153DCC: .4byte gUnknown_203F3E4
_08153DD0: .4byte gSprites
	thumb_func_end sub_8153DA8

	thumb_func_start nullsub_97
nullsub_97: @ 8153DD4
	bx lr
	thumb_func_end nullsub_97

	thumb_func_start sub_8153DD8
sub_8153DD8: @ 8153DD8
	push {r4-r7,lr}
	movs r4, 0
	ldr r0, _08153E20 @ =gSprites
	mov r12, r0
	movs r6, 0
	ldr r5, _08153E24 @ =gUnknown_203F43C
_08153DE4:
	ldr r3, [r5]
	lsls r1, r4, 1
	adds r0, r3, 0
	adds r0, 0x2A
	adds r0, r1
	ldrh r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r12
	lsls r0, r4, 4
	adds r0, 0x30
	strh r0, [r1, 0x20]
	lsls r2, r4, 3
	movs r7, 0x8
	negs r7, r7
	adds r0, r7, 0
	subs r0, r2
	strh r0, [r1, 0x22]
	adds r3, 0xC
	adds r3, r4
	strb r6, [r3]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _08153DE4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08153E20: .4byte gSprites
_08153E24: .4byte gUnknown_203F43C
	thumb_func_end sub_8153DD8

	thumb_func_start sub_8153E28
sub_8153E28: @ 8153E28
	push {r4-r6,lr}
	sub sp, 0x28
	movs r4, 0xC0
	lsls r4, 1
	adds r0, r4, 0
	bl AllocZeroed
	adds r6, r0, 0
	ldr r0, _08153EC8 @ =gUnknown_8478DA0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	ldr r0, _08153ECC @ =sDodrioBerryStatusGfx
	adds r1, r6, 0
	bl LZ77UnCompWram
	cmp r6, 0
	beq _08153EB8
	str r6, [sp, 0x18]
	add r5, sp, 0x18
	movs r0, 0x80
	lsls r0, 9
	orrs r0, r4
	str r0, [r5, 0x4]
	mov r1, sp
	ldr r0, _08153ED0 @ =gUnknown_8478DA8
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldr r4, _08153ED4 @ =gUnknown_203F43C
	movs r0, 0x40
	bl AllocZeroed
	str r0, [r4]
	adds r0, r5, 0
	bl LoadSpriteSheet
	add r0, sp, 0x20
	bl LoadSpritePalette
	movs r4, 0
_08153E7E:
	lsls r1, r4, 20
	movs r0, 0xC0
	lsls r0, 14
	adds r1, r0
	asrs r1, 16
	lsls r0, r4, 3
	movs r3, 0x8
	negs r3, r3
	adds r2, r3, 0
	subs r2, r0
	lsls r2, 16
	asrs r2, 16
	mov r0, sp
	movs r3, 0
	bl CreateSprite
	ldr r1, _08153ED4 @ =gUnknown_203F43C
	ldr r1, [r1]
	lsls r2, r4, 1
	adds r1, 0x2A
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _08153E7E
_08153EB8:
	adds r0, r6, 0
	bl Free
	add sp, 0x28
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08153EC8: .4byte gUnknown_8478DA0
_08153ECC: .4byte sDodrioBerryStatusGfx
_08153ED0: .4byte gUnknown_8478DA8
_08153ED4: .4byte gUnknown_203F43C
	thumb_func_end sub_8153E28

	thumb_func_start sub_8153ED8
sub_8153ED8: @ 8153ED8
	push {r4,r5,lr}
	movs r4, 0
_08153EDC:
	ldr r5, _08153F14 @ =gUnknown_203F43C
	ldr r0, [r5]
	lsls r1, r4, 1
	adds r0, 0x2A
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08153F18 @ =gSprites
	adds r0, r1
	cmp r0, 0
	beq _08153EFA
	bl DestroySpriteAndFreeResources
_08153EFA:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _08153EDC
	ldr r0, [r5]
	bl Free
	movs r0, 0
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08153F14: .4byte gUnknown_203F43C
_08153F18: .4byte gSprites
	thumb_func_end sub_8153ED8

	thumb_func_start sub_8153F1C
sub_8153F1C: @ 8153F1C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r3, 0
	movs r6, 0
	ldr r0, _08153FAC @ =gUnknown_203F43C
	mov r9, r0
_08153F2E:
	mov r7, r9
	ldr r2, [r7]
	lsls r5, r6, 1
	adds r0, r2, 0
	adds r0, 0x2A
	adds r0, r5
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08153FB0 @ =gSprites
	adds r4, r0, r1
	adds r0, r2, 0
	adds r0, 0x16
	adds r0, r5
	movs r1, 0x2
	strh r1, [r0]
	adds r0, r2, 0
	adds r0, 0xC
	adds r2, r0, r6
	ldrb r1, [r2]
	cmp r1, 0
	beq _08153F64
	movs r7, 0x22
	ldrsh r0, [r4, r7]
	cmp r0, 0x8
	beq _08153F9A
_08153F64:
	movs r3, 0x1
	movs r7, 0x22
	ldrsh r0, [r4, r7]
	cmp r0, 0x8
	bne _08153F8A
	cmp r1, 0
	bne _08153F9A
	strb r3, [r2]
	mov r1, r9
	ldr r0, [r1]
	adds r0, 0x16
	adds r0, r5
	ldr r1, _08153FB4 @ =0x0000fff0
	strh r1, [r0]
	movs r0, 0x1E
	str r3, [sp]
	bl PlaySE
	ldr r3, [sp]
_08153F8A:
	mov r7, r9
	ldr r0, [r7]
	adds r0, 0x16
	adds r0, r5
	ldrh r0, [r0]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
_08153F9A:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x9
	bls _08153F2E
	cmp r3, 0
	bne _08153FB8
	movs r0, 0x1
	b _08153FBA
	.align 2, 0
_08153FAC: .4byte gUnknown_203F43C
_08153FB0: .4byte gSprites
_08153FB4: .4byte 0x0000fff0
_08153FB8:
	movs r0, 0
_08153FBA:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8153F1C

	thumb_func_start sub_8153FC8
sub_8153FC8: @ 8153FC8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xA
	bls _08154004
	movs r4, 0
_08153FD4:
	ldr r0, _08153FFC @ =gUnknown_203F43C
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x2A
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08154000 @ =gSprites
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _08153FD4
	b _081540CE
	.align 2, 0
_08153FFC: .4byte gUnknown_203F43C
_08154000: .4byte gSprites
_08154004:
	movs r4, 0
	movs r0, 0xA
	subs r0, r5
	cmp r4, r0
	bge _081540CA
	ldr r6, _08154034 @ =gSprites
_08154010:
	cmp r5, 0x6
	bls _08154078
	ldr r0, _08154038 @ =gUnknown_203F43C
	ldr r2, [r0]
	ldr r1, _0815403C @ =0x0000fffa
	adds r0, r1, 0
	ldrh r1, [r2, 0x3E]
	adds r0, r1
	adds r0, r5
	movs r1, 0
	strh r0, [r2, 0x3E]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1E
	bls _08154040
	strh r1, [r2, 0x3E]
	b _08154092
	.align 2, 0
_08154034: .4byte gSprites
_08154038: .4byte gUnknown_203F43C
_0815403C: .4byte 0x0000fffa
_08154040:
	cmp r0, 0xA
	bls _0815405E
	lsls r1, r4, 1
	adds r0, r2, 0
	adds r0, 0x2A
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x2
	bl StartSpriteAnim
	b _08154092
_0815405E:
	lsls r1, r4, 1
	adds r0, r2, 0
	adds r0, 0x2A
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0
	bl StartSpriteAnim
	b _08154092
_08154078:
	ldr r0, _081540A4 @ =gUnknown_203F43C
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x2A
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0
	bl StartSpriteAnim
_08154092:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0xA
	subs r0, r5
	cmp r4, r0
	blt _08154010
	b _081540CA
	.align 2, 0
_081540A4: .4byte gUnknown_203F43C
_081540A8:
	ldr r0, _081540D4 @ =gUnknown_203F43C
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x2A
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081540D8 @ =gSprites
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_081540CA:
	cmp r4, 0x9
	bls _081540A8
_081540CE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081540D4: .4byte gUnknown_203F43C
_081540D8: .4byte gSprites
	thumb_func_end sub_8153FC8

	thumb_func_start sub_81540DC
sub_81540DC: @ 81540DC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	ldr r7, _08154120 @ =gSprites
	movs r1, 0x1
	ands r0, r1
	lsls r4, r0, 2
	movs r6, 0x5
	negs r6, r6
	ldr r5, _08154124 @ =gUnknown_203F43C
_081540F2:
	ldr r0, [r5]
	lsls r1, r3, 1
	adds r0, 0x2A
	adds r0, r1
	ldrh r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x9
	bls _081540F2
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154120: .4byte gSprites
_08154124: .4byte gUnknown_203F43C
	thumb_func_end sub_81540DC

	thumb_func_start sub_8154128
sub_8154128: @ 8154128
	push {r4,r5,lr}
	sub sp, 0x10
	movs r5, 0x90
	lsls r5, 3
	adds r0, r5, 0
	bl AllocZeroed
	adds r4, r0, 0
	ldr r0, _08154174 @ =gUnknown_8478DCC
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	ldr r0, _08154178 @ =sDodrioBerrySpritesGfx
	adds r1, r4, 0
	bl LZ77UnCompWram
	cmp r4, 0
	beq _0815415E
	str r4, [sp]
	movs r0, 0x80
	lsls r0, 10
	orrs r0, r5
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
_0815415E:
	add r0, sp, 0x8
	bl LoadSpritePalette
	adds r0, r4, 0
	bl Free
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08154174: .4byte gUnknown_8478DCC
_08154178: .4byte sDodrioBerrySpritesGfx
	thumb_func_end sub_8154128

	thumb_func_start sub_815417C
sub_815417C: @ 815417C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x30
	mov r1, sp
	ldr r0, _0815420C @ =gUnknown_8478DDC
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	add r2, sp, 0x18
	adds r1, r2, 0
	ldr r0, _08154210 @ =gUnknown_8478DF4
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	movs r5, 0
	mov r9, r2
_081541A4:
	movs r0, 0x4
	bl AllocZeroed
	ldr r1, _08154214 @ =gUnknown_203F400
	lsls r4, r5, 2
	adds r4, r1
	str r0, [r4]
	lsls r0, r5, 3
	lsls r1, r5, 4
	adds r1, r0
	mov r0, sp
	movs r2, 0x8
	movs r3, 0x1
	bl CreateSprite
	ldr r1, [r4]
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_81542EC
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xA
	bls _081541A4
	movs r5, 0
	ldr r7, _08154218 @ =gUnknown_203F42C
	ldr r4, _0815421C @ =sUnknown_8478DD4
	mov r8, r4
_081541E4:
	movs r0, 0x4
	bl AllocZeroed
	lsls r1, r5, 2
	adds r4, r1, r7
	str r0, [r4]
	adds r6, r1, 0
	cmp r5, 0x3
	bne _08154220
	mov r0, r8
	movs r2, 0x6
	ldrsh r1, [r0, r2]
	mov r0, r9
	movs r2, 0x39
	movs r3, 0
	bl CreateSprite
	ldr r1, [r7, 0xC]
	b _08154234
	.align 2, 0
_0815420C: .4byte gUnknown_8478DDC
_08154210: .4byte gUnknown_8478DF4
_08154214: .4byte gUnknown_203F400
_08154218: .4byte gUnknown_203F42C
_0815421C: .4byte sUnknown_8478DD4
_08154220:
	lsls r0, r5, 1
	add r0, r8
	movs r3, 0
	ldrsh r1, [r0, r3]
	mov r0, r9
	movs r2, 0x3C
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
_08154234:
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
	adds r0, r6, r7
	ldr r0, [r0]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08154270 @ =gSprites
	adds r0, r1
	adds r1, r5, 0
	bl StartSpriteAnim
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _081541E4
	movs r0, 0x1
	bl sub_8154324
	add sp, 0x30
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154270: .4byte gSprites
	thumb_func_end sub_815417C

	thumb_func_start sub_8154274
sub_8154274: @ 8154274
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, _081542E0 @ =gUnknown_203F400
_0815427A:
	lsls r0, r5, 2
	adds r4, r0, r6
	ldr r0, [r4]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081542E4 @ =gSprites
	adds r0, r1
	cmp r0, 0
	beq _08154294
	bl DestroySprite
_08154294:
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xA
	bls _0815427A
	movs r5, 0
	ldr r6, _081542E8 @ =gUnknown_203F42C
_081542AC:
	lsls r0, r5, 2
	adds r4, r0, r6
	ldr r0, [r4]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081542E4 @ =gSprites
	adds r0, r1
	cmp r0, 0
	beq _081542C6
	bl DestroySprite
_081542C6:
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _081542AC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081542E0: .4byte gUnknown_203F400
_081542E4: .4byte gSprites
_081542E8: .4byte gUnknown_203F42C
	thumb_func_end sub_8154274

	thumb_func_start sub_81542EC
sub_81542EC: @ 81542EC
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0815431C @ =gSprites
	ldr r2, _08154320 @ =gUnknown_203F400
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	adds r2, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_0815431C: .4byte gSprites
_08154320: .4byte gUnknown_203F400
	thumb_func_end sub_81542EC

	thumb_func_start sub_8154324
sub_8154324: @ 8154324
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	ldr r7, _08154368 @ =gSprites
	ldr r6, _0815436C @ =gUnknown_203F42C
	movs r1, 0x1
	ands r0, r1
	lsls r4, r0, 2
	movs r5, 0x5
	negs r5, r5
_0815433A:
	lsls r0, r3, 2
	adds r0, r6
	ldr r0, [r0]
	ldrh r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _0815433A
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154368: .4byte gSprites
_0815436C: .4byte gUnknown_203F42C
	thumb_func_end sub_8154324

	thumb_func_start sub_8154370
sub_8154370: @ 8154370
	lsls r0, 24
	lsls r1, 24
	ldr r3, _08154390 @ =gSprites
	ldr r2, _08154394 @ =gUnknown_203F400
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ldrh r2, [r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	lsrs r1, 21
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_08154390: .4byte gSprites
_08154394: .4byte gUnknown_203F400
	thumb_func_end sub_8154370

	thumb_func_start sub_8154398
sub_8154398: @ 8154398
	push {lr}
	lsls r0, 16
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _081543BC @ =gUnknown_203F400
	lsrs r0, 14
	adds r0, r2
	ldr r0, [r0]
	ldrh r2, [r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r2, _081543C0 @ =gSprites
	adds r0, r2
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_081543BC: .4byte gUnknown_203F400
_081543C0: .4byte gSprites
	thumb_func_end sub_8154398

	thumb_func_start sub_81543C4
sub_81543C4: @ 81543C4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081543E4 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, 0x32
	strh r1, [r2, 0x20]
	movs r0, 0x32
	strh r0, [r2, 0x22]
	bx lr
	.align 2, 0
_081543E4: .4byte gSprites
	thumb_func_end sub_81543C4

	thumb_func_start sub_81543E8
sub_81543E8: @ 81543E8
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r0, 0x42
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	beq _0815442A
	movs r3, 0
	ldr r7, _08154430 @ =gUnknown_8478E0C
	ldr r6, _08154434 @ =gUnknown_203F3F8
	movs r5, 0
_081543FE:
	lsls r0, r3, 2
	adds r2, r0, r6
	ldr r1, [r2]
	ldrh r0, [r1, 0x2]
	adds r0, 0x1
	strh r0, [r1, 0x2]
	adds r1, r3, r7
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1]
	cmp r0, r1
	bls _08154420
	ldrh r0, [r4, 0x20]
	subs r0, 0x1
	strh r0, [r4, 0x20]
	ldr r0, [r2]
	strh r5, [r0, 0x2]
_08154420:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1
	bls _081543FE
_0815442A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154430: .4byte gUnknown_8478E0C
_08154434: .4byte gUnknown_203F3F8
	thumb_func_end sub_81543E8

	thumb_func_start sub_8154438
sub_8154438: @ 8154438
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x28
	movs r4, 0x80
	lsls r4, 3
	adds r0, r4, 0
	bl AllocZeroed
	adds r6, r0, 0
	ldr r0, _081544DC @ =gUnknown_8478E18
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	ldr r0, _081544E0 @ =sDodrioBerryPlatformGfx
	adds r1, r6, 0
	bl LZ77UnCompWram
	cmp r6, 0
	beq _081544C6
	str r6, [sp, 0x18]
	add r0, sp, 0x18
	movs r1, 0xA0
	lsls r1, 11
	orrs r1, r4
	str r1, [r0, 0x4]
	mov r2, sp
	ldr r1, _081544E4 @ =gUnknown_8478E20
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	bl LoadSpriteSheet
	add r0, sp, 0x20
	bl LoadSpritePalette
	movs r5, 0
	ldr r7, _081544E8 @ =gUnknown_8478E0E
	adds r0, r7, 0x2
	mov r9, r0
	ldr r1, _081544EC @ =gUnknown_203F3F8
	mov r8, r1
_08154492:
	movs r0, 0x4
	bl AllocZeroed
	lsls r2, r5, 2
	mov r3, r8
	adds r4, r2, r3
	str r0, [r4]
	adds r0, r2, r7
	movs r3, 0
	ldrsh r1, [r0, r3]
	add r2, r9
	movs r0, 0
	ldrsh r2, [r2, r0]
	mov r0, sp
	movs r3, 0x4
	bl CreateSprite
	ldr r1, [r4]
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _08154492
_081544C6:
	adds r0, r6, 0
	bl Free
	add sp, 0x28
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081544DC: .4byte gUnknown_8478E18
_081544E0: .4byte sDodrioBerryPlatformGfx
_081544E4: .4byte gUnknown_8478E20
_081544E8: .4byte gUnknown_8478E0E
_081544EC: .4byte gUnknown_203F3F8
	thumb_func_end sub_8154438

	thumb_func_start sub_81544F0
sub_81544F0: @ 81544F0
	push {r4-r7,lr}
	movs r3, 0
	ldr r0, _08154534 @ =gUnknown_203F3F8
	mov r12, r0
	ldr r4, _08154538 @ =gUnknown_8478E0E
	adds r7, r4, 0x2
	ldr r6, _0815453C @ =gSprites
	movs r5, 0x1
_08154500:
	lsls r2, r3, 2
	mov r1, r12
	adds r0, r2, r1
	ldr r0, [r0]
	ldrh r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r0, r1, 0
	adds r0, 0x42
	strh r5, [r0]
	adds r0, r2, r4
	ldrh r0, [r0]
	strh r0, [r1, 0x20]
	adds r2, r7
	ldrh r0, [r2]
	strh r0, [r1, 0x22]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1
	bls _08154500
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154534: .4byte gUnknown_203F3F8
_08154538: .4byte gUnknown_8478E0E
_0815453C: .4byte gSprites
	thumb_func_end sub_81544F0

	thumb_func_start sub_8154540
sub_8154540: @ 8154540
	push {r4,r5,lr}
	movs r2, 0
	ldr r5, _08154570 @ =gUnknown_203F3F8
	ldr r4, _08154574 @ =gSprites
	movs r3, 0
_0815454A:
	lsls r0, r2, 2
	adds r0, r5
	ldr r0, [r0]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x42
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1
	bls _0815454A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08154570: .4byte gUnknown_203F3F8
_08154574: .4byte gSprites
	thumb_func_end sub_8154540

	thumb_func_start sub_8154578
sub_8154578: @ 8154578
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, _081545B4 @ =gUnknown_203F3F8
_0815457E:
	lsls r0, r5, 2
	adds r4, r0, r6
	ldr r0, [r4]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081545B8 @ =gSprites
	adds r0, r1
	cmp r0, 0
	beq _08154598
	bl DestroySprite
_08154598:
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _0815457E
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081545B4: .4byte gUnknown_203F3F8
_081545B8: .4byte gSprites
	thumb_func_end sub_8154578

	thumb_func_start sub_81545BC
sub_81545BC: @ 81545BC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	ldr r7, _08154600 @ =gSprites
	ldr r6, _08154604 @ =gUnknown_203F3F8
	movs r1, 0x1
	ands r0, r1
	lsls r4, r0, 2
	movs r5, 0x5
	negs r5, r5
_081545D2:
	lsls r0, r3, 2
	adds r0, r6
	ldr r0, [r0]
	ldrh r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1
	bls _081545D2
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154600: .4byte gSprites
_08154604: .4byte gUnknown_203F3F8
	thumb_func_end sub_81545BC

	thumb_func_start sub_8154608
sub_8154608: @ 8154608
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0
	subs r0, r1, 0x1
	cmp r0, 0x4
	bhi _081546BA
	lsls r0, 2
	ldr r1, _08154624 @ =_08154628
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08154624: .4byte _08154628
	.align 2, 0
_08154628:
	.4byte _081546A8
	.4byte _0815463C
	.4byte _08154646
	.4byte _0815465A
	.4byte _08154682
_0815463C:
	cmp r2, 0
	beq _08154672
	cmp r2, 0x1
	bne _081546BA
	b _08154676
_08154646:
	cmp r2, 0x1
	beq _081546AC
	cmp r2, 0x1
	bgt _08154654
	cmp r2, 0
	beq _081546A8
	b _081546BA
_08154654:
	cmp r2, 0x2
	bne _081546BA
	b _081546B8
_0815465A:
	cmp r2, 0x1
	beq _08154676
	cmp r2, 0x1
	bgt _08154668
	cmp r2, 0
	beq _08154672
	b _081546BA
_08154668:
	cmp r2, 0x2
	beq _0815467A
	cmp r2, 0x3
	beq _0815467E
	b _081546BA
_08154672:
	movs r3, 0xC
	b _081546BA
_08154676:
	movs r3, 0x12
	b _081546BA
_0815467A:
	movs r3, 0x18
	b _081546BA
_0815467E:
	movs r3, 0x6
	b _081546BA
_08154682:
	cmp r2, 0x4
	bhi _081546BA
	lsls r0, r2, 2
	ldr r1, _08154690 @ =_08154694
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08154690: .4byte _08154694
	.align 2, 0
_08154694:
	.4byte _081546A8
	.4byte _081546AC
	.4byte _081546B0
	.4byte _081546B4
	.4byte _081546B8
_081546A8:
	movs r3, 0xF
	b _081546BA
_081546AC:
	movs r3, 0x15
	b _081546BA
_081546B0:
	movs r3, 0x1B
	b _081546BA
_081546B4:
	movs r3, 0x3
	b _081546BA
_081546B8:
	movs r3, 0x9
_081546BA:
	lsls r0, r3, 3
	pop {r1}
	bx r1
	thumb_func_end sub_8154608

	thumb_func_start sub_81546C0
sub_81546C0: @ 81546C0
	push {r4,lr}
	movs r4, 0
_081546C4:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81542EC
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8154370
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xA
	bls _081546C4
	movs r0, 0
	bl sub_81540DC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81546C0

	thumb_func_start sub_81546EC
sub_81546EC: @ 81546EC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl GetUserFrameGraphicsInfo
	ldr r1, [r0]
	movs r2, 0x90
	lsls r2, 1
	movs r0, 0
	movs r3, 0x1
	bl LoadBgTiles
	adds r0, r4, 0
	bl GetUserFrameGraphicsInfo
	ldr r0, [r0, 0x4]
	movs r1, 0xA0
	movs r2, 0x20
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81546EC

	thumb_func_start sub_8154720
sub_8154720: @ 8154720
	push {lr}
	movs r0, 0
	movs r1, 0xA
	movs r2, 0xB0
	bl TextWindow_SetStdFrame0_WithPal
	pop {r0}
	bx r0
	thumb_func_end sub_8154720

	thumb_func_start sub_8154730
sub_8154730: @ 8154730
	ldr r3, _08154760 @ =gUnknown_203F440
	ldr r0, [r3]
	movs r2, 0xC0
	lsls r2, 6
	adds r1, r0, r2
	movs r2, 0
	str r2, [r1]
	ldr r1, _08154764 @ =0x00003014
	adds r0, r1
	strb r2, [r0]
	ldr r0, [r3]
	adds r1, 0x4
	adds r0, r1
	strb r2, [r0]
	ldr r0, [r3]
	adds r1, 0x8
	adds r0, r1
	strb r2, [r0]
	ldr r0, [r3]
	adds r1, 0x4
	adds r0, r1
	strb r2, [r0]
	bx lr
	.align 2, 0
_08154760: .4byte gUnknown_203F440
_08154764: .4byte 0x00003014
	thumb_func_end sub_8154730

	thumb_func_start sub_8154768
sub_8154768: @ 8154768
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	movs r6, 0xA
	ldrb r2, [r4, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	movs r5, 0x1
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x1
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	ldrb r3, [r4, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4, 0x3]
	str r0, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x2
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x3]
	ldrb r0, [r4, 0x1]
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	str r5, [sp]
	ldrb r0, [r4, 0x4]
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x4
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x3]
	ldrb r0, [r4, 0x1]
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	str r5, [sp]
	ldrb r0, [r4, 0x4]
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x6
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x4]
	ldrb r0, [r4, 0x2]
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x7
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	ldrb r3, [r4, 0x4]
	ldrb r0, [r4, 0x2]
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4, 0x3]
	str r0, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x8
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x3]
	ldrb r0, [r4, 0x1]
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x4]
	ldrb r4, [r4, 0x2]
	adds r3, r4
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x9
	bl FillBgTilemapBufferRect
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8154768

	thumb_func_start sub_8154868
sub_8154868: @ 8154868
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	movs r6, 0xB
	ldrb r2, [r4, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	movs r5, 0x1
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0xA
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	ldrb r3, [r4, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4, 0x3]
	str r0, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0xB
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x3]
	ldrb r0, [r4, 0x1]
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0xC
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	str r5, [sp]
	ldrb r0, [r4, 0x4]
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0xD
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x3]
	ldrb r0, [r4, 0x1]
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	str r5, [sp]
	ldrb r0, [r4, 0x4]
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0xF
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x4]
	ldrb r0, [r4, 0x2]
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x10
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	ldrb r3, [r4, 0x4]
	ldrb r0, [r4, 0x2]
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4, 0x3]
	str r0, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x11
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x3]
	ldrb r0, [r4, 0x1]
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x4]
	ldrb r4, [r4, 0x2]
	adds r3, r4
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x12
	bl FillBgTilemapBufferRect
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8154868

	thumb_func_start sub_8154968
sub_8154968: @ 8154968
	push {r4,lr}
	ldr r4, _081549B0 @ =gUnknown_203F440
	str r0, [r4]
	movs r2, 0xC0
	lsls r2, 6
	adds r1, r0, r2
	movs r2, 0
	str r2, [r1]
	ldr r3, _081549B4 @ =0x00003014
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _081549B8 @ =0x00003018
	adds r0, r1
	strb r2, [r0]
	ldr r0, [r4]
	adds r3, 0xC
	adds r0, r3
	strb r2, [r0]
	ldr r0, [r4]
	adds r1, 0xC
	adds r0, r1
	strb r2, [r0]
	ldr r0, _081549BC @ =sub_8154A08
	movs r1, 0x3
	bl CreateTask
	ldr r1, [r4]
	ldr r2, _081549C0 @ =0x00003004
	adds r1, r2
	strb r0, [r1]
	ldr r0, _081549C4 @ =sub_8154A2C
	bl sub_8155E24
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081549B0: .4byte gUnknown_203F440
_081549B4: .4byte 0x00003014
_081549B8: .4byte 0x00003018
_081549BC: .4byte sub_8154A08
_081549C0: .4byte 0x00003004
_081549C4: .4byte sub_8154A2C
	thumb_func_end sub_8154968

	thumb_func_start sub_81549C8
sub_81549C8: @ 81549C8
	push {lr}
	bl FreeAllWindowBuffers
	pop {r0}
	bx r0
	thumb_func_end sub_81549C8

	thumb_func_start sub_81549D4
sub_81549D4: @ 81549D4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r5, _08154A04 @ =gUnknown_8478EC4
	adds r7, r5, 0x4
_081549E0:
	lsls r1, r4, 3
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, r6
	bne _081549F2
	adds r0, r1, r7
	ldr r0, [r0]
	bl sub_8155E24
_081549F2:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _081549E0
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154A04: .4byte gUnknown_8478EC4
	thumb_func_end sub_81549D4

	thumb_func_start sub_8154A08
sub_8154A08: @ 8154A08
	push {lr}
	ldr r0, _08154A28 @ =gUnknown_203F440
	ldr r0, [r0]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	bne _08154A22
	bl sub_8155E54
	bl _call_via_r0
_08154A22:
	pop {r0}
	bx r0
	.align 2, 0
_08154A28: .4byte gUnknown_203F440
	thumb_func_end sub_8154A08

	thumb_func_start sub_8154A2C
sub_8154A2C: @ 8154A2C
	push {lr}
	ldr r0, _08154A48 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r2, _08154A4C @ =0x00003014
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _08154B24
	lsls r0, 2
	ldr r1, _08154A50 @ =_08154A54
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08154A48: .4byte gUnknown_203F440
_08154A4C: .4byte 0x00003014
_08154A50: .4byte _08154A54
	.align 2, 0
_08154A54:
	.4byte _08154A68
	.4byte _08154A6E
	.4byte _08154A88
	.4byte _08154ACC
	.4byte _08154AF8
_08154A68:
	bl sub_8155EA0
	b _08154B08
_08154A6E:
	bl sub_8155FE0
	cmp r0, 0x1
	bne _08154B2E
	ldr r0, _08154A80 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r2, _08154A84 @ =0x00003014
	adds r1, r2
	b _08154B10
	.align 2, 0
_08154A80: .4byte gUnknown_203F440
_08154A84: .4byte 0x00003014
_08154A88:
	ldr r1, _08154AC0 @ =sDodrioBerryBgTilemap1
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r1, _08154AC4 @ =sDodrioBerryBgTilemap2Left
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r1, _08154AC8 @ =sDodrioBerryBgTilemap2Right
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	b _08154B08
	.align 2, 0
_08154AC0: .4byte sDodrioBerryBgTilemap1
_08154AC4: .4byte sDodrioBerryBgTilemap2Left
_08154AC8: .4byte sDodrioBerryBgTilemap2Right
_08154ACC:
	movs r0, 0
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	ldr r0, _08154AF0 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r2, _08154AF4 @ =0x00003014
	adds r1, r2
	b _08154B10
	.align 2, 0
_08154AF0: .4byte gUnknown_203F440
_08154AF4: .4byte 0x00003014
_08154AF8:
	ldr r0, _08154B18 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x14]
	lsrs r0, 3
	bl sub_81546EC
	bl sub_8154720
_08154B08:
	ldr r0, _08154B1C @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r0, _08154B20 @ =0x00003014
	adds r1, r0
_08154B10:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08154B2E
	.align 2, 0
_08154B18: .4byte gSaveBlock2Ptr
_08154B1C: .4byte gUnknown_203F440
_08154B20: .4byte 0x00003014
_08154B24:
	movs r2, 0xC0
	lsls r2, 6
	adds r1, r2
	movs r0, 0x1
	str r0, [r1]
_08154B2E:
	pop {r0}
	bx r0
	thumb_func_end sub_8154A2C

	thumb_func_start sub_8154B34
sub_8154B34: @ 8154B34
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	ldr r4, _08154B74 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r2, _08154B78 @ =0x00003014
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _08154B7C
	cmp r0, 0x1
	bne _08154B54
	b _08154CE0
_08154B54:
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB4
	bhi _08154B62
	b _08154D82
_08154B62:
	bl sub_81533B4
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	cmp r6, r7
	bcc _08154B72
	b _08154D5A
_08154B72:
	b _08154D34
	.align 2, 0
_08154B74: .4byte gUnknown_203F440
_08154B78: .4byte 0x00003014
_08154B7C:
	bl sub_81533B4
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08154CB8 @ =sUnknown_8478E80
	subs r0, r7, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r5, [r0]
	ldr r2, _08154CBC @ =0xffffff00
	ldr r0, [sp, 0xC]
	ands r0, r2
	ldr r1, _08154CC0 @ =0x00ffffff
	ands r0, r1
	movs r1, 0xE0
	lsls r1, 19
	orrs r0, r1
	str r0, [sp, 0xC]
	ldr r0, [sp, 0x10]
	ands r0, r2
	movs r1, 0x2
	orrs r0, r1
	ldr r1, _08154CC4 @ =0xffff00ff
	ands r0, r1
	movs r1, 0xD0
	lsls r1, 4
	orrs r0, r1
	ldr r1, _08154CC8 @ =0x0000ffff
	ands r0, r1
	movs r1, 0x98
	lsls r1, 13
	orrs r0, r1
	str r0, [sp, 0x10]
	movs r6, 0
	cmp r6, r7
	bcs _08154CAC
	mov r3, sp
	adds r3, 0xC
	str r3, [sp, 0x18]
	mov r10, r4
	ldr r0, _08154CCC @ =0x00003008
	mov r9, r0
_08154BD0:
	movs r1, 0
	mov r8, r1
	adds r0, r6, 0
	bl sub_81537AC
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	bl sub_81533C4
	adds r1, r0, 0
	movs r0, 0
	movs r2, 0x1
	negs r2, r2
	bl GetStringWidth
	movs r1, 0x38
	subs r1, r0
	lsrs r1, 1
	str r1, [sp, 0x14]
	ldrb r0, [r5]
	lsls r0, 8
	ldr r2, _08154CC4 @ =0xffff00ff
	ldr r1, [sp, 0xC]
	ands r1, r2
	orrs r1, r0
	str r1, [sp, 0xC]
	ldrb r2, [r5, 0x1]
	lsls r2, 16
	ldr r0, _08154CD0 @ =0xff00ffff
	ands r0, r1
	orrs r0, r2
	str r0, [sp, 0xC]
	add r0, sp, 0xC
	bl AddWindow
	mov r2, r10
	ldr r1, [r2]
	add r1, r9
	adds r1, r6
	strb r0, [r1]
	ldr r0, [r2]
	add r0, r9
	adds r0, r6
	ldrb r0, [r0]
	bl ClearWindowTilemap
	mov r3, r10
	ldr r0, [r3]
	add r0, r9
	adds r0, r6
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _08154C4E
	movs r0, 0x2
	mov r8, r0
_08154C4E:
	adds r0, r4, 0
	bl sub_81533C4
	adds r4, r0, 0
	mov r1, r10
	ldr r0, [r1]
	add r0, r9
	adds r0, r6
	ldrb r0, [r0]
	ldr r3, [sp, 0x14]
	lsls r2, r3, 24
	lsrs r2, 24
	mov r3, r8
	lsls r1, r3, 1
	add r1, r8
	ldr r3, _08154CD4 @ =sUnknown_8478E38
	adds r1, r3
	str r1, [sp]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0
	movs r3, 0x1
	bl AddTextPrinterParameterized3
	mov r2, r10
	ldr r0, [r2]
	add r0, r9
	adds r0, r6
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r3, [sp, 0x18]
	ldrh r0, [r3, 0x6]
	adds r0, 0xE
	strh r0, [r3, 0x6]
	add r0, sp, 0xC
	bl sub_8154868
	adds r5, 0x4
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r7
	bcc _08154BD0
_08154CAC:
	ldr r0, _08154CD8 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r0, _08154CDC @ =0x00003014
	adds r1, r0
	b _08154D1E
	.align 2, 0
_08154CB8: .4byte sUnknown_8478E80
_08154CBC: .4byte 0xffffff00
_08154CC0: .4byte 0x00ffffff
_08154CC4: .4byte 0xffff00ff
_08154CC8: .4byte 0x0000ffff
_08154CCC: .4byte 0x00003008
_08154CD0: .4byte 0xff00ffff
_08154CD4: .4byte sUnknown_8478E38
_08154CD8: .4byte gUnknown_203F440
_08154CDC: .4byte 0x00003014
_08154CE0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08154D82
	bl sub_81533B4
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	cmp r6, r7
	bcs _08154D10
_08154CF8:
	ldr r0, [r4]
	ldr r1, _08154D28 @ =0x00003008
	adds r0, r1
	adds r0, r6
	ldrb r0, [r0]
	bl PutWindowTilemap
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r7
	bcc _08154CF8
_08154D10:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _08154D2C @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r2, _08154D30 @ =0x00003014
	adds r1, r2
_08154D1E:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08154D82
	.align 2, 0
_08154D28: .4byte 0x00003008
_08154D2C: .4byte gUnknown_203F440
_08154D30: .4byte 0x00003014
_08154D34:
	ldr r5, _08154D94 @ =gUnknown_203F440
	ldr r0, [r5]
	ldr r4, _08154D98 @ =0x00003008
	adds r0, r4
	adds r0, r6
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r5]
	adds r0, r4
	adds r0, r6
	ldrb r0, [r0]
	bl RemoveWindow
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r7
	bcc _08154D34
_08154D5A:
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _08154D94 @ =gUnknown_203F440
	ldr r0, [r0]
	movs r3, 0xC0
	lsls r3, 6
	adds r0, r3
	movs r1, 0x1
	str r1, [r0]
_08154D82:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154D94: .4byte gUnknown_203F440
_08154D98: .4byte 0x00003008
	thumb_func_end sub_8154B34

	thumb_func_start sub_8154D9C
sub_8154D9C: @ 8154D9C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x70
	lsls r0, 24
	movs r1, 0
	mov r8, r1
	movs r6, 0
	lsrs r7, r0, 24
	add r4, sp, 0x2C
	ldr r1, _08154F64 @ =gUnknown_8478F14
	adds r0, r4, 0
	movs r2, 0x5
	bl memcpy
	movs r5, 0
	cmp r5, r7
	bcs _08154DEC
	add r4, sp, 0x34
_08154DC6:
	mov r0, sp
	adds r0, r5
	adds r0, 0x2C
	strb r5, [r0]
	add r0, sp, 0x5C
	adds r1, r5, 0
	bl sub_81536A0
	lsls r2, r5, 3
	adds r2, r4, r2
	ldr r0, [sp, 0x5C]
	ldr r1, [sp, 0x60]
	str r0, [r2]
	str r1, [r2, 0x4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _08154DC6
_08154DEC:
	bl sub_81534AC
	cmp r0, 0
	beq _08154E22
_08154DF4:
	movs r5, 0
	cmp r5, r7
	bcs _08154E1C
	add r2, sp, 0x34
	add r1, sp, 0x2C
_08154DFE:
	lsls r0, r5, 3
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, r8
	bne _08154E12
	adds r0, r1, r6
	strb r5, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08154E12:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _08154DFE
_08154E1C:
	mov r8, r6
	cmp r6, r7
	bcc _08154DF4
_08154E22:
	movs r5, 0
	ldr r4, _08154F68 @ =gText_SpacePoints
	cmp r5, r7
	bcs _08154E48
	add r1, sp, 0x34
	add r6, sp, 0x38
	subs r3, r7, 0x1
_08154E30:
	lsls r2, r5, 3
	adds r0, r6, r2
	ldr r0, [r0]
	cmp r0, 0
	bne _08154E3E
	adds r0, r1, r2
	strb r3, [r0]
_08154E3E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _08154E30
_08154E48:
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	movs r1, 0xD8
	subs r1, r0
	str r1, [sp, 0x64]
	movs r5, 0
	cmp r5, r7
	bcs _08154F52
	mov r2, sp
	adds r2, 0x34
	str r2, [sp, 0x68]
	ldr r3, _08154F6C @ =0x00003009
	mov r10, r3
	adds r0, r1, 0
	subs r0, 0x23
	lsls r0, 24
	str r0, [sp, 0x6C]
_08154E70:
	movs r4, 0
	mov r8, r4
	mov r0, sp
	adds r0, r5
	adds r0, 0x2C
	ldrb r0, [r0]
	adds r4, r0, 0
	lsls r1, r4, 3
	add r0, sp, 0x38
	adds r0, r1
	ldr r0, [r0]
	mov r9, r0
	ldr r2, _08154F70 @ =gUnknown_203F440
	ldr r0, [r2]
	add r0, r10
	ldrb r0, [r0]
	ldr r2, _08154F74 @ =sUnknown_8478E94
	ldr r3, [sp, 0x68]
	adds r1, r3, r1
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r2, [r1]
	ldr r3, _08154F78 @ =sUnknown_8478EBA
	lsls r1, r5, 1
	adds r1, r3
	ldrb r6, [r1]
	str r6, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	mov r3, r8
	str r3, [sp, 0x8]
	movs r1, 0
	movs r3, 0x8
	bl AddTextPrinterParameterized
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _08154EC8
	movs r0, 0x2
	mov r8, r0
_08154EC8:
	adds r0, r4, 0
	bl sub_81533C4
	adds r3, r0, 0
	ldr r1, _08154F70 @ =gUnknown_203F440
	ldr r0, [r1]
	add r0, r10
	ldrb r0, [r0]
	mov r2, r8
	lsls r1, r2, 1
	add r1, r8
	ldr r2, _08154F7C @ =sUnknown_8478E38
	adds r1, r2
	str r1, [sp]
	movs r4, 0x1
	negs r4, r4
	str r4, [sp, 0x4]
	str r3, [sp, 0x8]
	movs r1, 0
	movs r2, 0x1C
	adds r3, r6, 0
	bl AddTextPrinterParameterized3
	add r0, sp, 0xC
	mov r1, r9
	movs r2, 0x1
	movs r3, 0x7
	bl ConvertIntToDecimalStringN
	movs r0, 0
	add r1, sp, 0xC
	adds r2, r4, 0
	bl GetStringWidth
	ldr r1, _08154F70 @ =gUnknown_203F440
	ldr r0, [r1]
	add r0, r10
	ldrb r0, [r0]
	str r6, [sp]
	movs r2, 0xFF
	str r2, [sp, 0x4]
	movs r3, 0
	str r3, [sp, 0x8]
	movs r1, 0
	add r2, sp, 0xC
	ldr r4, [sp, 0x6C]
	lsrs r3, r4, 24
	bl AddTextPrinterParameterized
	ldr r1, _08154F70 @ =gUnknown_203F440
	ldr r0, [r1]
	add r0, r10
	ldrb r0, [r0]
	ldr r2, [sp, 0x64]
	lsls r3, r2, 24
	str r6, [sp]
	movs r4, 0xFF
	str r4, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	ldr r2, _08154F68 @ =gText_SpacePoints
	lsrs r3, 24
	bl AddTextPrinterParameterized
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _08154E70
_08154F52:
	add sp, 0x70
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154F64: .4byte gUnknown_8478F14
_08154F68: .4byte gText_SpacePoints
_08154F6C: .4byte 0x00003009
_08154F70: .4byte gUnknown_203F440
_08154F74: .4byte sUnknown_8478E94
_08154F78: .4byte sUnknown_8478EBA
_08154F7C: .4byte sUnknown_8478E38
	thumb_func_end sub_8154D9C

	thumb_func_start sub_8154F80
sub_8154F80: @ 8154F80
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8C
	bl sub_81533B4
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x84]
	ldr r6, _08154FB0 @ =gUnknown_203F440
	ldr r1, [r6]
	ldr r2, _08154FB4 @ =0x00003014
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0xB
	bls _08154FA6
	b _08155678
_08154FA6:
	lsls r0, 2
	ldr r1, _08154FB8 @ =_08154FBC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08154FB0: .4byte gUnknown_203F440
_08154FB4: .4byte 0x00003014
_08154FB8: .4byte _08154FBC
	.align 2, 0
_08154FBC:
	.4byte _08154FEC
	.4byte _08155008
	.4byte _08155060
	.4byte _0815524C
	.4byte _08155298
	.4byte _081552DC
	.4byte _08155340
	.4byte _0815537C
	.4byte _081553C0
	.4byte _08155480
	.4byte _081555D8
	.4byte _0815562C
_08154FEC:
	bl sub_81535B0
	ldr r0, _08155000 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r0, _08155004 @ =0x0000301c
	adds r2, r1, r0
	movs r0, 0
	strh r0, [r2]
	b _0815565A
	.align 2, 0
_08155000: .4byte gUnknown_203F440
_08155004: .4byte 0x0000301c
_08155008:
	ldr r6, _08155050 @ =sUnknown_8475674
	adds r0, r6, 0
	bl AddWindow
	ldr r4, _08155054 @ =gUnknown_203F440
	ldr r1, [r4]
	ldr r2, _08155058 @ =0x00003008
	mov r8, r2
	add r1, r8
	strb r0, [r1]
	movs r0, 0x8
	adds r0, r6
	mov r9, r0
	bl AddWindow
	ldr r1, [r4]
	ldr r5, _0815505C @ =0x00003009
	adds r1, r5
	strb r0, [r1]
	ldr r0, [r4]
	add r0, r8
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r6, 0
	bl sub_8154868
	mov r0, r9
	bl sub_8154868
	b _08155658
	.align 2, 0
_08155050: .4byte sUnknown_8475674
_08155054: .4byte gUnknown_203F440
_08155058: .4byte 0x00003008
_0815505C: .4byte 0x00003009
_08155060:
	ldr r4, _081551A8 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r5, _081551AC @ =0x00003008
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r4]
	ldr r1, _081551B0 @ =0x00003009
	mov r9, r1
	add r0, r9
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r2, _081551B4 @ =gText_BerryPickingResults
	mov r8, r2
	movs r2, 0x1
	negs r2, r2
	movs r0, 0
	mov r1, r8
	bl GetStringWidth
	adds r1, r0, 0
	movs r0, 0xE0
	subs r0, r1
	lsrs r3, r0, 1
	ldr r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0x2
	str r1, [sp]
	movs r6, 0xFF
	str r6, [sp, 0x4]
	movs r5, 0
	str r5, [sp, 0x8]
	movs r1, 0
	mov r2, r8
	bl AddTextPrinterParameterized
	ldr r0, [r4]
	add r0, r9
	ldrb r0, [r0]
	ldr r2, _081551B8 @ =gText_10P30P50P50P
	movs r1, 0x10
	str r1, [sp]
	str r6, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0
	movs r3, 0x44
	bl AddTextPrinterParameterized
	movs r0, 0
	mov r9, r0
	ldr r1, [sp, 0x84]
	cmp r9, r1
	bcc _081550DA
	b _08155214
_081550DA:
	movs r5, 0
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	cmp r9, r0
	bne _081550EA
	movs r5, 0x2
_081550EA:
	mov r0, r9
	bl sub_81533C4
	adds r6, r0, 0
	ldr r0, _081551A8 @ =gUnknown_203F440
	ldr r0, [r0]
	ldr r2, _081551B0 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	ldr r1, _081551BC @ =sUnknown_8478EB0
	mov r2, r9
	lsls r4, r2, 1
	adds r4, r1
	ldrb r3, [r4]
	lsls r1, r5, 1
	adds r1, r5
	ldr r2, _081551C0 @ =sUnknown_8478E38
	adds r1, r2
	str r1, [sp]
	movs r5, 0x1
	negs r5, r5
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r1, 0
	movs r2, 0x2
	bl AddTextPrinterParameterized3
	movs r7, 0
	mov r0, r9
	adds r0, 0x1
	str r0, [sp, 0x88]
	mov r8, r4
	ldr r1, _081551C4 @ =sUnknown_8478EA8
	mov r10, r1
_0815512E:
	mov r0, r9
	adds r1, r7, 0
	bl sub_8153404
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _081551C8 @ =0x0000270f
	bl Min
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r7, 0
	bl sub_81534F0
	ldr r1, _081551C8 @ =0x0000270f
	bl Min
	lsls r0, 16
	lsrs r6, r0, 16
	add r0, sp, 0xC
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	movs r0, 0
	add r1, sp, 0xC
	movs r2, 0x1
	negs r2, r2
	bl GetStringWidth
	adds r5, r0, 0
	cmp r6, r4
	bne _081551D0
	cmp r6, 0
	beq _081551D0
	ldr r0, _081551A8 @ =gUnknown_203F440
	ldr r0, [r0]
	ldr r2, _081551B0 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	lsls r1, r7, 1
	add r1, r10
	ldrb r2, [r1]
	subs r2, r5
	lsls r2, 24
	lsrs r2, 24
	mov r1, r8
	ldrb r3, [r1]
	ldr r1, _081551CC @ =sUnknown_8478E38+0x3
	str r1, [sp]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0x4]
	add r1, sp, 0xC
	str r1, [sp, 0x8]
	movs r1, 0
	bl AddTextPrinterParameterized3
	b _081551FA
	.align 2, 0
_081551A8: .4byte gUnknown_203F440
_081551AC: .4byte 0x00003008
_081551B0: .4byte 0x00003009
_081551B4: .4byte gText_BerryPickingResults
_081551B8: .4byte gText_10P30P50P50P
_081551BC: .4byte sUnknown_8478EB0
_081551C0: .4byte sUnknown_8478E38
_081551C4: .4byte sUnknown_8478EA8
_081551C8: .4byte 0x0000270f
_081551CC: .4byte sUnknown_8478E38+0x3
_081551D0:
	ldr r0, _0815523C @ =gUnknown_203F440
	ldr r0, [r0]
	ldr r2, _08155240 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	lsls r1, r7, 1
	add r1, r10
	ldrb r3, [r1]
	subs r3, r5
	lsls r3, 24
	lsrs r3, 24
	mov r2, r8
	ldrb r1, [r2]
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	add r2, sp, 0xC
	bl AddTextPrinterParameterized
_081551FA:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x3
	bls _0815512E
	ldr r1, [sp, 0x88]
	lsls r0, r1, 24
	lsrs r0, 24
	mov r9, r0
	ldr r2, [sp, 0x84]
	cmp r9, r2
	bcs _08155214
	b _081550DA
_08155214:
	ldr r4, _0815523C @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _08155244 @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, _08155240 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r4]
	ldr r0, _08155248 @ =0x00003014
	adds r1, r0
	b _0815565E
	.align 2, 0
_0815523C: .4byte gUnknown_203F440
_08155240: .4byte 0x00003009
_08155244: .4byte 0x00003008
_08155248: .4byte 0x00003014
_0815524C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08155270
	ldr r4, _08155288 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _0815528C @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	ldr r2, _08155290 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	bl PutWindowTilemap
_08155270:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl sub_8154324
	ldr r0, _08155288 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r0, _08155294 @ =0x00003014
	adds r1, r0
	b _0815565E
	.align 2, 0
_08155288: .4byte gUnknown_203F440
_0815528C: .4byte 0x00003008
_08155290: .4byte 0x00003009
_08155294: .4byte 0x00003014
_08155298:
	ldr r4, _081552D0 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _081552D4 @ =0x0000301c
	adds r2, r0, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1D
	bhi _081552B0
	b _081556C8
_081552B0:
	ldr r0, _081552D8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081552BE
	b _081556C8
_081552BE:
	movs r0, 0
	strh r0, [r2]
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl sub_8154324
	b _08155658
	.align 2, 0
_081552D0: .4byte gUnknown_203F440
_081552D4: .4byte 0x0000301c
_081552D8: .4byte gMain
_081552DC:
	ldr r4, _08155330 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r5, _08155334 @ =0x00003008
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r4]
	ldr r1, _08155338 @ =0x00003009
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r6, _0815533C @ =gText_AnnouncingRankings
	movs r2, 0x1
	negs r2, r2
	movs r0, 0
	adds r1, r6, 0
	bl GetStringWidth
	adds r1, r0, 0
	movs r0, 0xE0
	subs r0, r1
	lsrs r3, r0, 1
	ldr r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	adds r2, r6, 0
	bl AddTextPrinterParameterized
	b _08155658
	.align 2, 0
_08155330: .4byte gUnknown_203F440
_08155334: .4byte 0x00003008
_08155338: .4byte 0x00003009
_0815533C: .4byte gText_AnnouncingRankings
_08155340:
	ldr r0, [sp, 0x84]
	bl sub_8154D9C
	ldr r4, _0815536C @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _08155370 @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, _08155374 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r4]
	ldr r0, _08155378 @ =0x00003014
	adds r1, r0
	b _0815565E
	.align 2, 0
_0815536C: .4byte gUnknown_203F440
_08155370: .4byte 0x00003008
_08155374: .4byte 0x00003009
_08155378: .4byte 0x00003014
_0815537C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081553A0
	ldr r4, _081553B0 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _081553B4 @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	ldr r2, _081553B8 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	bl PutWindowTilemap
_081553A0:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _081553B0 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r0, _081553BC @ =0x00003014
	adds r1, r0
	b _0815565E
	.align 2, 0
_081553B0: .4byte gUnknown_203F440
_081553B4: .4byte 0x00003008
_081553B8: .4byte 0x00003009
_081553BC: .4byte 0x00003014
_081553C0:
	ldr r4, _08155408 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _0815540C @ =0x0000301c
	adds r2, r0, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1D
	bhi _081553D8
	b _081556C8
_081553D8:
	ldr r0, _08155410 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081553E6
	b _081556C8
_081553E6:
	movs r0, 0
	strh r0, [r2]
	movs r0, 0x5
	bl PlaySE
	bl sub_81534AC
	ldr r1, _08155414 @ =0x00000bb7
	cmp r0, r1
	bhi _0815541C
	ldr r0, [r4]
	ldr r2, _08155418 @ =0x00003014
	adds r0, r2
	movs r1, 0x7F
	strb r1, [r0]
	b _0815542C
	.align 2, 0
_08155408: .4byte gUnknown_203F440
_0815540C: .4byte 0x0000301c
_08155410: .4byte gMain
_08155414: .4byte 0x00000bb7
_08155418: .4byte 0x00003014
_0815541C:
	bl StopMapMusic
	ldr r1, [r4]
	ldr r0, _08155470 @ =0x00003014
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0815542C:
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0xF
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x5
	bl FillBgTilemapBufferRect_Palette0
	ldr r5, _08155474 @ =gUnknown_203F440
	ldr r0, [r5]
	ldr r4, _08155478 @ =0x00003009
	adds r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r6, _0815547C @ =sUnknown_8475684
	adds r0, r6, 0
	bl AddWindow
	ldr r1, [r5]
	adds r1, r4
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r6, 0
	bl sub_8154868
	b _081556C8
	.align 2, 0
_08155470: .4byte 0x00003014
_08155474: .4byte gUnknown_203F440
_08155478: .4byte 0x00003009
_0815547C: .4byte sUnknown_8475684
_08155480:
	ldr r0, _08155558 @ =0x00000101
	bl PlayNewMapMusic
	ldr r4, _0815555C @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r6, _08155560 @ =0x00003008
	adds r0, r6
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r4]
	ldr r1, _08155564 @ =0x00003009
	mov r10, r1
	add r0, r10
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r5, _08155568 @ =gText_AnnouncingPrizes
	movs r2, 0x1
	negs r2, r2
	movs r0, 0
	adds r1, r5, 0
	bl GetStringWidth
	adds r1, r0, 0
	movs r0, 0xE0
	subs r0, r1
	lsrs r3, r0, 1
	ldr r0, [r4]
	adds r0, r6
	ldrb r0, [r0]
	lsls r3, 24
	lsrs r3, 24
	movs r2, 0x2
	mov r9, r2
	str r2, [sp]
	movs r1, 0xFF
	mov r8, r1
	str r1, [sp, 0x4]
	movs r6, 0
	str r6, [sp, 0x8]
	movs r1, 0
	adds r2, r5, 0
	bl AddTextPrinterParameterized
	bl DynamicPlaceholderTextUtil_Reset
	bl sub_8153390
	lsls r0, 16
	lsrs r0, 16
	add r5, sp, 0x70
	adds r1, r5, 0
	bl CopyItemName
	movs r0, 0
	adds r1, r5, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r1, _0815556C @ =gText_FirstPlacePrize
	add r0, sp, 0xC
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	ldr r0, [r4]
	add r0, r10
	ldrb r0, [r0]
	mov r2, r9
	str r2, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r1, 0
	add r2, sp, 0xC
	movs r3, 0x8
	bl AddTextPrinterParameterized
	bl sub_815372C
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	cmp r4, 0
	beq _0815559E
	cmp r4, 0x3
	beq _0815559E
	bl DynamicPlaceholderTextUtil_Reset
	bl sub_8153390
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	bl CopyItemName
	movs r0, 0
	adds r1, r5, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	cmp r4, 0x2
	bne _08155574
	ldr r1, _08155570 @ =gText_CantHoldAnyMore
	add r0, sp, 0xC
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	b _08155580
	.align 2, 0
_08155558: .4byte 0x00000101
_0815555C: .4byte gUnknown_203F440
_08155560: .4byte 0x00003008
_08155564: .4byte 0x00003009
_08155568: .4byte gText_AnnouncingPrizes
_0815556C: .4byte gText_FirstPlacePrize
_08155570: .4byte gText_CantHoldAnyMore
_08155574:
	cmp r6, 0x1
	bne _08155580
	ldr r1, _081555C4 @ =gText_FilledStorageSpace
	add r0, sp, 0xC
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
_08155580:
	ldr r0, _081555C8 @ =gUnknown_203F440
	ldr r0, [r0]
	ldr r2, _081555CC @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x28
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	add r2, sp, 0xC
	movs r3, 0x8
	bl AddTextPrinterParameterized
_0815559E:
	ldr r4, _081555C8 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _081555D0 @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, _081555CC @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r4]
	ldr r0, _081555D4 @ =0x00003014
	adds r1, r0
	b _0815565E
	.align 2, 0
_081555C4: .4byte gText_FilledStorageSpace
_081555C8: .4byte gUnknown_203F440
_081555CC: .4byte 0x00003009
_081555D0: .4byte 0x00003008
_081555D4: .4byte 0x00003014
_081555D8:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081555FC
	ldr r4, _08155618 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _0815561C @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	ldr r2, _08155620 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	bl PutWindowTilemap
_081555FC:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _08155624 @ =0x00000137
	movs r1, 0x14
	movs r2, 0xA
	bl FadeOutAndFadeInNewMapMusic
	ldr r0, _08155618 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r0, _08155628 @ =0x00003014
	adds r1, r0
	b _0815565E
	.align 2, 0
_08155618: .4byte gUnknown_203F440
_0815561C: .4byte 0x00003008
_08155620: .4byte 0x00003009
_08155624: .4byte 0x00000137
_08155628: .4byte 0x00003014
_0815562C:
	ldr r4, _08155668 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _0815566C @ =0x0000301c
	adds r2, r0, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1D
	bls _081556C8
	ldr r0, _08155670 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081556C8
	movs r0, 0
	strh r0, [r2]
	movs r0, 0x5
	bl PlaySE
_08155658:
	ldr r1, [r4]
_0815565A:
	ldr r2, _08155674 @ =0x00003014
	adds r1, r2
_0815565E:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _081556C8
	.align 2, 0
_08155668: .4byte gUnknown_203F440
_0815566C: .4byte 0x0000301c
_08155670: .4byte gMain
_08155674: .4byte 0x00003014
_08155678:
	ldr r5, _081556D8 @ =0x00003008
	adds r0, r1, r5
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r6]
	ldr r4, _081556DC @ =0x00003009
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r6]
	adds r0, r5
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, [r6]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
_081556C8:
	add sp, 0x8C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081556D8: .4byte 0x00003008
_081556DC: .4byte 0x00003009
	thumb_func_end sub_8154F80

	thumb_func_start sub_81556E0
sub_81556E0: @ 81556E0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	ldr r1, _08155708 @ =gUnknown_203F440
	ldr r2, [r1]
	ldr r0, _0815570C @ =0x00003014
	mov r9, r0
	adds r0, r2, r0
	ldrb r7, [r0]
	mov r10, r1
	cmp r7, 0x1
	beq _0815579C
	cmp r7, 0x1
	bgt _08155710
	cmp r7, 0
	beq _0815571E
	b _081559EC
	.align 2, 0
_08155708: .4byte gUnknown_203F440
_0815570C: .4byte 0x00003014
_08155710:
	cmp r7, 0x2
	bne _08155716
	b _08155868
_08155716:
	cmp r7, 0x3
	bne _0815571C
	b _081558A4
_0815571C:
	b _081559EC
_0815571E:
	ldr r5, _08155788 @ =sUnknown_847568C
	adds r0, r5, 0
	bl AddWindow
	mov r2, r10
	ldr r1, [r2]
	ldr r3, _0815578C @ =0x00003008
	adds r1, r3
	strb r0, [r1]
	movs r0, 0x8
	adds r0, r5
	mov r8, r0
	bl AddWindow
	mov r2, r10
	ldr r1, [r2]
	ldr r4, _08155790 @ =0x00003009
	adds r1, r4
	strb r0, [r1]
	ldr r0, [r2]
	ldr r3, _0815578C @ =0x00003008
	adds r0, r3
	ldrb r0, [r0]
	bl ClearWindowTilemap
	mov r1, r10
	ldr r0, [r1]
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r5, 0
	bl sub_8154868
	mov r0, r8
	bl sub_8154768
	mov r2, r10
	ldr r1, [r2]
	add r1, r9
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	ldr r3, _08155794 @ =0x00003020
	adds r0, r3
	strb r7, [r0]
	ldr r0, [r2]
	ldr r1, _08155798 @ =0x00003024
	adds r0, r1
	strb r7, [r0]
	b _08155A58
	.align 2, 0
_08155788: .4byte sUnknown_847568C
_0815578C: .4byte 0x00003008
_08155790: .4byte 0x00003009
_08155794: .4byte 0x00003020
_08155798: .4byte 0x00003024
_0815579C:
	ldr r3, _0815584C @ =0x00003008
	mov r8, r3
	adds r0, r2, r3
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	mov r1, r10
	ldr r0, [r1]
	ldr r7, _08155850 @ =0x00003009
	adds r0, r7
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	mov r2, r10
	ldr r0, [r2]
	add r0, r8
	ldrb r0, [r0]
	ldr r2, _08155854 @ =gText_WantToPlayAgain
	movs r1, 0x6
	str r1, [sp]
	movs r5, 0xFF
	str r5, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	mov r3, r10
	ldr r0, [r3]
	adds r0, r7
	ldrb r0, [r0]
	ldr r2, _08155858 @ =gText_Yes
	movs r1, 0x2
	mov r9, r1
	str r1, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r3, 0x8
	bl AddTextPrinterParameterized
	mov r2, r10
	ldr r0, [r2]
	adds r0, r7
	ldrb r0, [r0]
	ldr r2, _0815585C @ =gText_No
	movs r1, 0x10
	str r1, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x8
	bl AddTextPrinterParameterized
	mov r3, r10
	ldr r0, [r3]
	adds r0, r7
	ldrb r0, [r0]
	ldr r2, _08155860 @ =gFameCheckerText_ListMenuCursor
	mov r1, r9
	str r1, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	mov r2, r10
	ldr r0, [r2]
	add r0, r8
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	mov r3, r10
	ldr r0, [r3]
	adds r0, r7
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	mov r0, r10
	ldr r1, [r0]
	ldr r2, _08155864 @ =0x00003014
	adds r1, r2
	b _081559DA
	.align 2, 0
_0815584C: .4byte 0x00003008
_08155850: .4byte 0x00003009
_08155854: .4byte gText_WantToPlayAgain
_08155858: .4byte gText_Yes
_0815585C: .4byte gText_No
_08155860: .4byte gFameCheckerText_ListMenuCursor
_08155864: .4byte 0x00003014
_08155868:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0815588E
	mov r3, r10
	ldr r0, [r3]
	ldr r1, _0815589C @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	mov r2, r10
	ldr r0, [r2]
	ldr r3, _081558A0 @ =0x00003009
	adds r0, r3
	ldrb r0, [r0]
	bl PutWindowTilemap
_0815588E:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	mov r0, r10
	ldr r1, [r0]
	add r1, r9
	b _081559DA
	.align 2, 0
_0815589C: .4byte 0x00003008
_081558A0: .4byte 0x00003009
_081558A4:
	ldr r1, _0815590C @ =0x00003020
	adds r0, r2, r1
	ldrb r7, [r0]
	cmp r7, 0
	bne _081558B0
	movs r7, 0x1
_081558B0:
	ldr r4, _08155910 @ =0x00003009
	adds r0, r2, r4
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	mov r2, r10
	ldr r0, [r2]
	adds r0, r4
	ldrb r0, [r0]
	ldr r2, _08155914 @ =gText_Yes
	movs r3, 0x2
	mov r8, r3
	str r3, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r5, 0
	str r5, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x8
	bl AddTextPrinterParameterized
	mov r2, r10
	ldr r0, [r2]
	adds r0, r4
	ldrb r0, [r0]
	ldr r2, _08155918 @ =gText_No
	movs r6, 0x10
	str r6, [sp]
	movs r3, 0xFF
	str r3, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x8
	bl AddTextPrinterParameterized
	mov r1, r10
	ldr r0, [r1]
	adds r0, r4
	ldrb r1, [r0]
	ldr r2, _0815591C @ =gFameCheckerText_ListMenuCursor
	cmp r7, 0x1
	bne _08155920
	mov r3, r8
	str r3, [sp]
	b _08155922
	.align 2, 0
_0815590C: .4byte 0x00003020
_08155910: .4byte 0x00003009
_08155914: .4byte gText_Yes
_08155918: .4byte gText_No
_0815591C: .4byte gFameCheckerText_ListMenuCursor
_08155920:
	str r6, [sp]
_08155922:
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	adds r0, r1, 0
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	ldr r4, _08155970 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _08155974 @ =0x00003009
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r0, _08155978 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r5, 0x1
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08155984
	movs r0, 0x5
	bl PlaySE
	ldr r0, [r4]
	ldr r2, _0815597C @ =0x00003020
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	bne _08155966
	strb r5, [r1]
_08155966:
	ldr r1, [r4]
	ldr r3, _08155980 @ =0x00003014
	adds r1, r3
	b _081559DA
	.align 2, 0
_08155970: .4byte gUnknown_203F440
_08155974: .4byte 0x00003009
_08155978: .4byte gMain
_0815597C: .4byte 0x00003020
_08155980: .4byte 0x00003014
_08155984:
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _081559BC
	movs r0, 0x5
	bl PlaySE
	ldr r0, [r4]
	ldr r2, _081559A8 @ =0x00003020
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0x1
	beq _081559B2
	cmp r0, 0x1
	bgt _081559AC
	cmp r0, 0
	beq _081559B2
	b _08155A58
	.align 2, 0
_081559A8: .4byte 0x00003020
_081559AC:
	cmp r0, 0x2
	beq _081559B8
	b _08155A58
_081559B2:
	movs r0, 0x2
	strb r0, [r1]
	b _08155A58
_081559B8:
	strb r5, [r1]
	b _08155A58
_081559BC:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08155A58
	movs r0, 0x5
	bl PlaySE
	ldr r0, [r4]
	ldr r3, _081559E4 @ =0x00003020
	adds r0, r3
	movs r1, 0x2
	strb r1, [r0]
	ldr r1, [r4]
	ldr r0, _081559E8 @ =0x00003014
	adds r1, r0
_081559DA:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08155A58
	.align 2, 0
_081559E4: .4byte 0x00003020
_081559E8: .4byte 0x00003014
_081559EC:
	mov r1, r10
	ldr r0, [r1]
	ldr r2, _08155A68 @ =0x00003020
	adds r1, r0, r2
	ldrb r1, [r1]
	ldr r3, _08155A6C @ =0x00003024
	adds r0, r3
	strb r1, [r0]
	mov r1, r10
	ldr r0, [r1]
	ldr r5, _08155A70 @ =0x00003008
	adds r0, r5
	ldrb r0, [r0]
	bl ClearWindowTilemap
	mov r2, r10
	ldr r0, [r2]
	ldr r4, _08155A74 @ =0x00003009
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	mov r3, r10
	ldr r0, [r3]
	adds r0, r5
	ldrb r0, [r0]
	bl RemoveWindow
	mov r1, r10
	ldr r0, [r1]
	adds r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	mov r2, r10
	ldr r0, [r2]
	movs r3, 0xC0
	lsls r3, 6
	adds r0, r3
	movs r1, 0x1
	str r1, [r0]
_08155A58:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08155A68: .4byte 0x00003020
_08155A6C: .4byte 0x00003024
_08155A70: .4byte 0x00003008
_08155A74: .4byte 0x00003009
	thumb_func_end sub_81556E0

	thumb_func_start sub_8155A78
sub_8155A78: @ 8155A78
	push {r4-r6,lr}
	sub sp, 0x10
	ldr r5, _08155A94 @ =gUnknown_203F440
	ldr r0, [r5]
	ldr r6, _08155A98 @ =0x00003014
	adds r0, r6
	ldrb r4, [r0]
	cmp r4, 0x1
	beq _08155AD0
	cmp r4, 0x1
	bgt _08155A9C
	cmp r4, 0
	beq _08155AA6
	b _08155B18
	.align 2, 0
_08155A94: .4byte gUnknown_203F440
_08155A98: .4byte 0x00003014
_08155A9C:
	cmp r4, 0x2
	beq _08155AE4
	cmp r4, 0x3
	beq _08155AFC
	b _08155B18
_08155AA6:
	movs r0, 0
	movs r1, 0
	bl DrawDialogueFrame
	ldr r2, _08155ACC @ =gText_SavingDontTurnOffThePower2
	str r4, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized2
	b _08155B08
	.align 2, 0
_08155ACC: .4byte gText_SavingDontTurnOffThePower2
_08155AD0:
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r1, [r5]
	ldr r0, _08155AE0 @ =0x00003014
	adds r1, r0
	b _08155B0C
	.align 2, 0
_08155AE0: .4byte 0x00003014
_08155AE4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08155B40
	ldr r0, _08155AF8 @ =sub_80DA634
	movs r1, 0
	bl CreateTask
	b _08155B08
	.align 2, 0
_08155AF8: .4byte sub_80DA634
_08155AFC:
	ldr r0, _08155B14 @ =sub_80DA634
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08155B40
_08155B08:
	ldr r1, [r5]
	adds r1, r6
_08155B0C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08155B40
	.align 2, 0
_08155B14: .4byte sub_80DA634
_08155B18:
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _08155B48 @ =gUnknown_203F440
	ldr r0, [r0]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
_08155B40:
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08155B48: .4byte gUnknown_203F440
	thumb_func_end sub_8155A78

	thumb_func_start sub_8155B4C
sub_8155B4C: @ 8155B4C
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r1, _08155B6C @ =gUnknown_203F440
	ldr r2, [r1]
	ldr r6, _08155B70 @ =0x00003014
	adds r0, r2, r6
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0x1
	beq _08155BA4
	cmp r0, 0x1
	bgt _08155B74
	cmp r0, 0
	beq _08155B7A
	b _08155C18
	.align 2, 0
_08155B6C: .4byte gUnknown_203F440
_08155B70: .4byte 0x00003014
_08155B74:
	cmp r0, 0x2
	beq _08155BEC
	b _08155C18
_08155B7A:
	ldr r4, _08155B9C @ =sUnknown_84756A4
	adds r0, r4, 0
	bl AddWindow
	ldr r1, [r5]
	ldr r2, _08155BA0 @ =0x00003008
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r2
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r4, 0
	bl sub_8154868
	b _08155C08
	.align 2, 0
_08155B9C: .4byte sUnknown_84756A4
_08155BA0: .4byte 0x00003008
_08155BA4:
	ldr r4, _08155BE0 @ =0x00003008
	adds r0, r2, r4
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	ldr r2, _08155BE4 @ =gText_CommunicationStandby3
	movs r1, 0x6
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r5]
	ldr r0, _08155BE8 @ =0x00003014
	adds r1, r0
	b _08155C0C
	.align 2, 0
_08155BE0: .4byte 0x00003008
_08155BE4: .4byte gText_CommunicationStandby3
_08155BE8: .4byte 0x00003014
_08155BEC:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08155C02
	ldr r0, [r5]
	ldr r1, _08155C14 @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
_08155C02:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
_08155C08:
	ldr r1, [r5]
	adds r1, r6
_08155C0C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08155C24
	.align 2, 0
_08155C14: .4byte 0x00003008
_08155C18:
	ldr r0, [r5]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
_08155C24:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8155B4C

	thumb_func_start sub_8155C2C
sub_8155C2C: @ 8155C2C
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r5, _08155C78 @ =gUnknown_203F440
	ldr r0, [r5]
	ldr r4, _08155C7C @ =0x00003008
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, [r5]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08155C78: .4byte gUnknown_203F440
_08155C7C: .4byte 0x00003008
	thumb_func_end sub_8155C2C

	thumb_func_start sub_8155C80
sub_8155C80: @ 8155C80
	push {r4-r7,lr}
	sub sp, 0xC
	ldr r0, _08155CA0 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r7, _08155CA4 @ =0x00003014
	adds r2, r1, r7
	ldrb r5, [r2]
	adds r6, r0, 0
	cmp r5, 0x1
	beq _08155D08
	cmp r5, 0x1
	bgt _08155CA8
	cmp r5, 0
	beq _08155CB2
	b _08155D9C
	.align 2, 0
_08155CA0: .4byte gUnknown_203F440
_08155CA4: .4byte 0x00003014
_08155CA8:
	cmp r5, 0x2
	beq _08155D50
	cmp r5, 0x3
	beq _08155D7C
	b _08155D9C
_08155CB2:
	ldr r4, _08155CF8 @ =sUnknown_847569C
	adds r0, r4, 0
	bl AddWindow
	ldr r1, [r6]
	ldr r2, _08155CFC @ =0x00003008
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r2
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r4, 0
	bl sub_8154868
	ldr r1, [r6]
	adds r1, r7
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r6]
	ldr r2, _08155D00 @ =0x0000301c
	adds r1, r0, r2
	movs r2, 0
	strh r5, [r1]
	ldr r1, _08155D04 @ =0x00003020
	adds r0, r1
	strb r2, [r0]
	ldr r0, [r6]
	adds r1, 0x4
	adds r0, r1
	strb r2, [r0]
	b _08155DE2
	.align 2, 0
_08155CF8: .4byte sUnknown_847569C
_08155CFC: .4byte 0x00003008
_08155D00: .4byte 0x0000301c
_08155D04: .4byte 0x00003020
_08155D08:
	ldr r4, _08155D44 @ =0x00003008
	adds r0, r1, r4
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	ldr r2, _08155D48 @ =gText_SomeoneDroppedOut
	movs r1, 0x6
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r6]
	ldr r2, _08155D4C @ =0x00003014
	adds r1, r2
	b _08155D70
	.align 2, 0
_08155D44: .4byte 0x00003008
_08155D48: .4byte gText_SomeoneDroppedOut
_08155D4C: .4byte 0x00003014
_08155D50:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08155D66
	ldr r0, [r6]
	ldr r1, _08155D78 @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
_08155D66:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r1, [r6]
	adds r1, r7
_08155D70:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08155DE2
	.align 2, 0
_08155D78: .4byte 0x00003008
_08155D7C:
	ldr r0, _08155D98 @ =0x0000301c
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x77
	bls _08155DE2
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	b _08155DE2
	.align 2, 0
_08155D98: .4byte 0x0000301c
_08155D9C:
	ldr r0, [r6]
	ldr r1, _08155DEC @ =0x00003024
	adds r0, r1
	movs r1, 0x5
	strb r1, [r0]
	ldr r0, [r6]
	ldr r4, _08155DF0 @ =0x00003008
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, [r6]
	movs r2, 0xC0
	lsls r2, 6
	adds r0, r2
	movs r1, 0x1
	str r1, [r0]
_08155DE2:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08155DEC: .4byte 0x00003024
_08155DF0: .4byte 0x00003008
	thumb_func_end sub_8155C80

	thumb_func_start unused_0
unused_0: @ 8155DF4
	push {r4,lr}
	ldr r4, _08155E18 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _08155E1C @ =0x00003004
	adds r0, r1
	ldrb r0, [r0]
	bl DestroyTask
	ldr r0, [r4]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08155E18: .4byte gUnknown_203F440
_08155E1C: .4byte 0x00003004
	thumb_func_end unused_0

	thumb_func_start nullsub_98
nullsub_98: @ 8155E20
	bx lr
	thumb_func_end nullsub_98

	thumb_func_start sub_8155E24
sub_8155E24: @ 8155E24
	push {r4,lr}
	ldr r2, _08155E48 @ =gUnknown_203F440
	ldr r1, [r2]
	ldr r3, _08155E4C @ =0x00003014
	adds r1, r3
	movs r3, 0
	strb r3, [r1]
	ldr r1, [r2]
	movs r4, 0xC0
	lsls r4, 6
	adds r2, r1, r4
	str r3, [r2]
	ldr r2, _08155E50 @ =0x00003028
	adds r1, r2
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08155E48: .4byte gUnknown_203F440
_08155E4C: .4byte 0x00003014
_08155E50: .4byte 0x00003028
	thumb_func_end sub_8155E24

	thumb_func_start sub_8155E54
sub_8155E54: @ 8155E54
	ldr r0, _08155E60 @ =gUnknown_203F440
	ldr r0, [r0]
	ldr r1, _08155E64 @ =0x00003028
	adds r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08155E60: .4byte gUnknown_203F440
_08155E64: .4byte 0x00003028
	thumb_func_end sub_8155E54

	thumb_func_start sub_8155E68
sub_8155E68: @ 8155E68
	push {lr}
	ldr r0, _08155E80 @ =gUnknown_203F440
	ldr r0, [r0]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0x1
	beq _08155E84
	movs r0, 0x1
	b _08155E86
	.align 2, 0
_08155E80: .4byte gUnknown_203F440
_08155E84:
	movs r0, 0
_08155E86:
	pop {r1}
	bx r1
	thumb_func_end sub_8155E68

	thumb_func_start sub_8155E8C
sub_8155E8C: @ 8155E8C
	ldr r0, _08155E98 @ =gUnknown_203F440
	ldr r0, [r0]
	ldr r1, _08155E9C @ =0x00003024
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08155E98: .4byte gUnknown_203F440
_08155E9C: .4byte 0x00003024
	thumb_func_end sub_8155E8C

	thumb_func_start sub_8155EA0
sub_8155EA0: @ 8155EA0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r0, sp, 0x4
	mov r8, r0
	mov r2, sp
	movs r6, 0
	ldr r1, _08155FD0 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08155FD4 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_08155EC6:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _08155EC6
	strh r6, [r2]
	mov r2, sp
	str r2, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r2, _08155FD0 @ =0x040000d4
	mov r1, r8
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xA0
	lsls r1, 19
	mov r0, sp
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08155FD8 @ =sUnknown_847565C
	movs r0, 0
	movs r2, 0x4
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
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	bl InitStandardTextBoxWindows
	bl ResetBg0
	movs r1, 0x82
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	ldr r4, _08155FDC @ =gUnknown_203F440
	ldr r1, [r4]
	movs r0, 0x3
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	movs r2, 0x80
	lsls r2, 5
	adds r1, r2
	movs r0, 0x1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	movs r0, 0x80
	lsls r0, 6
	adds r1, r0
	movs r0, 0x2
	bl SetBgTilemapBuffer
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08155FD0: .4byte 0x040000d4
_08155FD4: .4byte 0x81000800
_08155FD8: .4byte sUnknown_847565C
_08155FDC: .4byte gUnknown_203F440
	thumb_func_end sub_8155EA0

	thumb_func_start sub_8155FE0
sub_8155FE0: @ 8155FE0
	push {lr}
	sub sp, 0x4
	ldr r0, _08155FFC @ =gUnknown_203F440
	ldr r0, [r0]
	ldr r2, _08156000 @ =0x00003018
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0x5
	bhi _0815607A
	lsls r0, 2
	ldr r1, _08156004 @ =_08156008
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08155FFC: .4byte gUnknown_203F440
_08156000: .4byte 0x00003018
_08156004: .4byte _08156008
	.align 2, 0
_08156008:
	.4byte _08156020
	.4byte _08156030
	.4byte _08156036
	.4byte _08156044
	.4byte _0815605C
	.4byte _0815606A
_08156020:
	ldr r0, _0815602C @ =sDodrioBerryBgPal1
	movs r1, 0
	movs r2, 0x40
	bl LoadPalette
	b _08156082
	.align 2, 0
_0815602C: .4byte sDodrioBerryBgPal1
_08156030:
	bl ResetTempTileDataBuffers
	b _08156082
_08156036:
	ldr r1, _08156040 @ =sDodrioBerryBgGfx1
	movs r0, 0
	str r0, [sp]
	movs r0, 0x3
	b _0815604C
	.align 2, 0
_08156040: .4byte sDodrioBerryBgGfx1
_08156044:
	ldr r1, _08156058 @ =sDodrioBerryBgGfx2
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
_0815604C:
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	b _08156082
	.align 2, 0
_08156058: .4byte sDodrioBerryBgGfx2
_0815605C:
	bl FreeTempTileDataBuffersIfPossible
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08156082
	b _08156090
_0815606A:
	movs r0, 0x3
	bl stdpal_get
	movs r1, 0xD0
	movs r2, 0x20
	bl LoadPalette
	b _08156082
_0815607A:
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	b _08156092
_08156082:
	ldr r0, _08156098 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r0, _0815609C @ =0x00003018
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08156090:
	movs r0, 0
_08156092:
	add sp, 0x4
	pop {r1}
	bx r1
	.align 2, 0
_08156098: .4byte gUnknown_203F440
_0815609C: .4byte 0x00003018
	thumb_func_end sub_8155FE0

	.align 2, 0 @ Don't pad with nop.
