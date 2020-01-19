	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_810A85C
sub_810A85C: @ 810A85C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0810A8B4 @ =gTasks+0x8
	adds r5, r0, r1
	adds r0, r5, 0
	adds r0, 0x10
	ldrh r1, [r5, 0x4]
	bl AdjustQuantityAccordingToDPadInput
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810A8BC
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	movs r1, 0x2
	bl sub_81097E4
	ldr r0, _0810A8B8 @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x6]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x2]
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r0, 16
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	movs r2, 0x10
	ldrsh r1, [r5, r2]
	muls r0, r1
	bl sub_810A834
	b _0810A93A
	.align 2, 0
_0810A8B4: .4byte gTasks+0x8
_0810A8B8: .4byte gUnknown_203ACFC
_0810A8BC:
	ldr r0, _0810A8EC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810A8F0
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl sub_810BA3C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	bl sub_8108978
	adds r0, r4, 0
	bl sub_810A690
	b _0810A93A
	.align 2, 0
_0810A8EC: .4byte gMain
_0810A8F0:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810A93A
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl sub_810BA3C
	movs r0, 0x2
	bl sub_810BA3C
	movs r0, 0x5
	bl sub_810BA9C
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	bl sub_8108978
	ldrb r0, [r5]
	movs r1, 0x1
	bl bag_menu_print_cursor_
	adds r0, r6, 0
	bl sub_810910C
_0810A93A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_810A85C

	thumb_func_start sub_810A940
sub_810A940: @ 810A940
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _0810A9B4 @ =gTasks+0x8
	adds r4, r0
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	ldr r0, _0810A9B8 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	ldr r1, _0810A9BC @ =gStringVar1
	bl CopyItemName
	ldr r6, _0810A9C0 @ =gStringVar3
	ldr r0, _0810A9C4 @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x6]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r0, 16
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	muls r1, r0
	adds r0, r6, 0
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	ldr r4, _0810A9C8 @ =gStringVar4
	ldr r1, _0810A9CC @ =gText_TurnedOverItemsWorthYen
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r3, _0810A9D0 @ =sub_810A9D4
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl DisplayItemMessageInBag
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810A9B4: .4byte gTasks+0x8
_0810A9B8: .4byte gSpecialVar_ItemId
_0810A9BC: .4byte gStringVar1
_0810A9C0: .4byte gStringVar3
_0810A9C4: .4byte gUnknown_203ACFC
_0810A9C8: .4byte gStringVar4
_0810A9CC: .4byte gText_TurnedOverItemsWorthYen
_0810A9D0: .4byte sub_810A9D4
	thumb_func_end sub_810A940

	thumb_func_start sub_810A9D4
sub_810A9D4: @ 810A9D4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r6, r0, 2
	adds r6, r0
	lsls r6, 3
	ldr r0, _0810AAD8 @ =gTasks+0x8
	mov r10, r0
	adds r1, r6, 0
	add r1, r10
	mov r8, r1
	movs r0, 0xF8
	bl PlaySE
	ldr r5, _0810AADC @ =gSpecialVar_ItemId
	ldrh r0, [r5]
	mov r2, r8
	ldrh r1, [r2, 0x10]
	bl RemoveBagItem
	ldr r3, _0810AAE0 @ =gSaveBlock1Ptr
	ldr r4, [r3]
	movs r7, 0xA4
	lsls r7, 2
	adds r4, r7
	ldrh r0, [r5]
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	mov r2, r8
	movs r3, 0x10
	ldrsh r1, [r2, r3]
	muls r1, r0
	adds r0, r4, 0
	bl AddMoney
	ldrh r0, [r5]
	mov r2, r8
	ldrh r1, [r2, 0x10]
	movs r2, 0x2
	bl RecordItemPurchase
	mov r3, r8
	ldrb r0, [r3]
	ldr r4, _0810AAE4 @ =gUnknown_203ACFC
	ldrh r2, [r4, 0x6]
	lsls r2, 1
	adds r5, r4, 0
	adds r5, 0xE
	adds r1, r2, r5
	movs r3, 0x8
	adds r3, r4
	mov r9, r3
	add r2, r9
	bl DestroyListMenuTask
	ldrb r0, [r4, 0x6]
	bl sub_8108DC8
	ldrb r0, [r4, 0x6]
	bl sub_81089F4
	ldr r0, _0810AAE8 @ =gUnknown_203AD10
	ldr r2, [r0]
	ldrb r1, [r2, 0x5]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldrb r0, [r4, 0x6]
	bl sub_810842C
	ldr r0, _0810AAEC @ =gMultiuseListMenuTemplate
	ldrh r2, [r4, 0x6]
	lsls r2, 1
	adds r5, r2, r5
	ldrh r1, [r5]
	add r2, r9
	ldrh r2, [r2]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	strh r0, [r1]
	movs r1, 0x2
	bl bag_menu_print_cursor_
	movs r0, 0x2
	bl sub_810BAD8
	lsls r0, 24
	lsrs r0, 24
	bl sub_810BB74
	movs r0, 0x2
	bl sub_810BAD8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r2, _0810AAE0 @ =gSaveBlock1Ptr
	ldr r0, [r2]
	adds r0, r7
	bl GetMoney
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0
	bl PrintMoneyAmountInMoneyBox
	movs r3, 0x8
	negs r3, r3
	add r10, r3
	add r6, r10
	ldr r0, _0810AAF0 @ =sub_810AAF4
	str r0, [r6]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810AAD8: .4byte gTasks+0x8
_0810AADC: .4byte gSpecialVar_ItemId
_0810AAE0: .4byte gSaveBlock1Ptr
_0810AAE4: .4byte gUnknown_203ACFC
_0810AAE8: .4byte gUnknown_203AD10
_0810AAEC: .4byte gMultiuseListMenuTemplate
_0810AAF0: .4byte sub_810AAF4
	thumb_func_end sub_810A9D4

	thumb_func_start sub_810AAF4
sub_810AAF4: @ 810AAF4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0810AB38 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810AB0E
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810AB32
_0810AB0E:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
	bl sub_810BA3C
	movs r0, 0x2
	bl PutWindowTilemap
	ldr r0, _0810AB3C @ =gUnknown_203AD10
	ldr r2, [r0]
	ldrb r1, [r2, 0x5]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2, 0x5]
	adds r0, r4, 0
	bl sub_810A1F8
_0810AB32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810AB38: .4byte gMain
_0810AB3C: .4byte gUnknown_203AD10
	thumb_func_end sub_810AAF4

	thumb_func_start sub_810AB40
sub_810AB40: @ 810AB40
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r4, r0, 3
	ldr r5, _0810AB64 @ =gTasks+0x8
	adds r1, r4, r5
	movs r0, 0x1
	strh r0, [r1, 0x10]
	movs r3, 0x4
	ldrsh r0, [r1, r3]
	cmp r0, 0x1
	bne _0810AB68
	adds r0, r2, 0
	bl sub_810AC40
	b _0810AB7A
	.align 2, 0
_0810AB64: .4byte gTasks+0x8
_0810AB68:
	ldrh r0, [r1, 0x2]
	ldr r1, _0810AB80 @ =gUnknown_841638F
	bl sub_810971C
	adds r0, r5, 0
	subs r0, 0x8
	adds r0, r4, r0
	ldr r1, _0810AB84 @ =sub_810AB88
	str r1, [r0]
_0810AB7A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810AB80: .4byte gUnknown_841638F
_0810AB84: .4byte sub_810AB88
	thumb_func_end sub_810AB40

	thumb_func_start sub_810AB88
sub_810AB88: @ 810AB88
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0810ABB8 @ =gTasks+0x8
	adds r4, r0, r1
	adds r0, r4, 0
	adds r0, 0x10
	ldrh r1, [r4, 0x4]
	bl AdjustQuantityAccordingToDPadInput
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810ABBC
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	bl sub_81097E4
	b _0810AC38
	.align 2, 0
_0810ABB8: .4byte gTasks+0x8
_0810ABBC:
	ldr r0, _0810ABFC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810AC00
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x6
	bl sub_810BAD8
	lsls r0, 24
	lsrs r0, 24
	bl ClearWindowTilemap
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0
	bl sub_810BA3C
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	bl sub_8108978
	adds r0, r5, 0
	bl sub_810AC40
	b _0810AC38
	.align 2, 0
_0810ABFC: .4byte gMain
_0810AC00:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810AC38
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0
	bl sub_810BA3C
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	ldrb r0, [r4]
	movs r1, 0x1
	bl bag_menu_print_cursor_
	bl sub_8108978
	adds r0, r6, 0
	bl sub_810910C
_0810AC38:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_810AB88

	thumb_func_start sub_810AC40
sub_810AC40: @ 810AC40
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	mov r8, r0
	ldr r0, _0810ACCC @ =gTasks+0x8
	mov r9, r0
	mov r7, r8
	add r7, r9
	ldr r5, _0810ACD0 @ =gSpecialVar_ItemId
	ldrh r0, [r5]
	ldrh r1, [r7, 0x10]
	bl AddPCItem
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x1
	bne _0810ACEC
	ldrh r2, [r5]
	ldr r3, _0810ACD4 @ =0x0000ffff
	movs r0, 0x1C
	movs r1, 0
	bl ItemUse_SetQuestLogEvent
	ldrh r0, [r5]
	ldr r1, _0810ACD8 @ =gStringVar1
	bl CopyItemName
	ldr r0, _0810ACDC @ =gStringVar2
	movs r2, 0x10
	ldrsh r1, [r7, r2]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r4, _0810ACE0 @ =gStringVar4
	ldr r1, _0810ACE4 @ =gUnknown_84163A7
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0x6
	movs r1, 0x3
	bl sub_810B9DC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	str r1, [sp]
	str r6, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	str r1, [sp, 0xC]
	str r6, [sp, 0x10]
	movs r1, 0x2
	adds r2, r4, 0
	movs r3, 0
	bl sub_810B8F0
	mov r0, r9
	subs r0, 0x8
	add r0, r8
	ldr r1, _0810ACE8 @ =sub_8109F44
	str r1, [r0]
	b _0810ACF8
	.align 2, 0
_0810ACCC: .4byte gTasks+0x8
_0810ACD0: .4byte gSpecialVar_ItemId
_0810ACD4: .4byte 0x0000ffff
_0810ACD8: .4byte gStringVar1
_0810ACDC: .4byte gStringVar2
_0810ACE0: .4byte gStringVar4
_0810ACE4: .4byte gUnknown_84163A7
_0810ACE8: .4byte sub_8109F44
_0810ACEC:
	ldr r2, _0810AD08 @ =gUnknown_84163BB
	ldr r3, _0810AD0C @ =sub_810A1D0
	adds r0, r4, 0
	movs r1, 0x2
	bl DisplayItemMessageInBag
_0810ACF8:
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810AD08: .4byte gUnknown_84163BB
_0810AD0C: .4byte sub_810A1D0
	thumb_func_end sub_810AC40

	thumb_func_start UseRegisteredKeyItemOnField
UseRegisteredKeyItemOnField: @ 810AD10
	push {r4-r6,lr}
	bl InUnionRoom
	cmp r0, 0x1
	bne _0810AD1E
	movs r0, 0
	b _0810ADA0
_0810AD1E:
	bl DismissMapNamePopup
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	ldr r4, _0810AD80 @ =gSaveBlock1Ptr
	ldr r0, [r4]
	ldr r5, _0810AD84 @ =0x00000296
	adds r1, r0, r5
	ldrh r0, [r1]
	cmp r0, 0
	beq _0810AD98
	movs r1, 0x1
	bl CheckBagHasItem
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x1
	bne _0810AD90
	bl ScriptContext2_Enable
	bl FreezeObjectEvents
	bl sub_805C270
	bl sub_805C780
	ldr r2, _0810AD88 @ =gSpecialVar_ItemId
	ldr r0, [r4]
	adds r0, r5
	ldrh r1, [r0]
	strh r1, [r2]
	ldrh r0, [r0]
	bl ItemId_GetFieldFunc
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810AD8C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r6, [r1, 0xE]
	b _0810AD9E
	.align 2, 0
_0810AD80: .4byte gSaveBlock1Ptr
_0810AD84: .4byte 0x00000296
_0810AD88: .4byte gSpecialVar_ItemId
_0810AD8C: .4byte gTasks
_0810AD90:
	ldr r0, [r4]
	adds r0, r5
	movs r1, 0
	strh r1, [r0]
_0810AD98:
	ldr r0, _0810ADA8 @ =gUnknown_81A77A0
	bl ScriptContext1_SetupScript
_0810AD9E:
	movs r0, 0x1
_0810ADA0:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0810ADA8: .4byte gUnknown_81A77A0
	thumb_func_end UseRegisteredKeyItemOnField

	thumb_func_start sub_810ADAC
sub_810ADAC: @ 810ADAC
	push {lr}
	ldr r0, _0810ADCC @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x4]
	cmp r0, 0x6
	beq _0810ADC6
	cmp r0, 0x8
	beq _0810ADC6
	cmp r0, 0x7
	beq _0810ADC6
	cmp r0, 0x9
	beq _0810ADC6
	cmp r0, 0xA
	bne _0810ADD0
_0810ADC6:
	movs r0, 0x1
	b _0810ADD2
	.align 2, 0
_0810ADCC: .4byte gUnknown_203ACFC
_0810ADD0:
	movs r0, 0
_0810ADD2:
	pop {r1}
	bx r1
	thumb_func_end sub_810ADAC

	thumb_func_start sub_810ADD8
sub_810ADD8: @ 810ADD8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r5, _0810AEBC @ =gUnknown_203AD2C
	movs r0, 0xB2
	lsls r0, 1
	bl AllocZeroed
	str r0, [r5]
	ldr r4, _0810AEC0 @ =gSaveBlock1Ptr
	ldr r1, [r4]
	movs r2, 0xC4
	lsls r2, 2
	adds r1, r2
	movs r2, 0xA8
	bl memcpy
	ldr r0, [r5]
	adds r0, 0xA8
	ldr r1, [r4]
	movs r3, 0xEE
	lsls r3, 2
	adds r1, r3
	movs r2, 0x78
	bl memcpy
	ldr r0, [r5]
	movs r1, 0x90
	lsls r1, 1
	adds r0, r1
	ldr r1, [r4]
	movs r2, 0x86
	lsls r2, 3
	adds r1, r2
	movs r2, 0x34
	bl memcpy
	ldr r2, [r5]
	ldr r0, [r4]
	ldr r3, _0810AEC4 @ =0x00000296
	adds r0, r3
	ldrh r1, [r0]
	movs r3, 0xB0
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	ldr r1, _0810AEC8 @ =gUnknown_203ACFC
	ldrh r0, [r1, 0x6]
	adds r3, 0x2
	adds r2, r3
	strh r0, [r2]
	movs r4, 0
	mov r8, r5
	movs r7, 0xAA
	lsls r7, 1
	movs r0, 0xE
	adds r0, r1
	mov r12, r0
	movs r6, 0xAD
	lsls r6, 1
	adds r5, r1, 0
	adds r5, 0x8
_0810AE54:
	mov r1, r8
	ldr r2, [r1]
	lsls r3, r4, 1
	adds r0, r2, r7
	adds r0, r3
	ldrh r1, [r5]
	strh r1, [r0]
	adds r2, r6
	adds r2, r3
	mov r3, r12
	ldrh r0, [r3]
	strh r0, [r2]
	movs r0, 0x2
	add r12, r0
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	bls _0810AE54
	ldr r4, _0810AEC0 @ =gSaveBlock1Ptr
	ldr r0, [r4]
	movs r1, 0xC4
	lsls r1, 2
	adds r0, r1
	movs r1, 0x2A
	bl ClearItemSlots
	ldr r0, [r4]
	movs r2, 0xEE
	lsls r2, 2
	adds r0, r2
	movs r1, 0x1E
	bl ClearItemSlots
	ldr r0, [r4]
	movs r3, 0x86
	lsls r3, 3
	adds r0, r3
	movs r1, 0xD
	bl ClearItemSlots
	ldr r0, [r4]
	ldr r1, _0810AEC4 @ =0x00000296
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	bl sub_81089BC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810AEBC: .4byte gUnknown_203AD2C
_0810AEC0: .4byte gSaveBlock1Ptr
_0810AEC4: .4byte 0x00000296
_0810AEC8: .4byte gUnknown_203ACFC
	thumb_func_end sub_810ADD8

	thumb_func_start sub_810AECC
sub_810AECC: @ 810AECC
	push {r4-r7,lr}
	ldr r4, _0810AF64 @ =gSaveBlock1Ptr
	ldr r0, [r4]
	movs r1, 0xC4
	lsls r1, 2
	adds r0, r1
	ldr r5, _0810AF68 @ =gUnknown_203AD2C
	ldr r1, [r5]
	movs r2, 0xA8
	bl memcpy
	ldr r0, [r4]
	movs r2, 0xEE
	lsls r2, 2
	adds r0, r2
	ldr r1, [r5]
	adds r1, 0xA8
	movs r2, 0x78
	bl memcpy
	ldr r0, [r4]
	movs r3, 0x86
	lsls r3, 3
	adds r0, r3
	ldr r1, [r5]
	movs r2, 0x90
	lsls r2, 1
	adds r1, r2
	movs r2, 0x34
	bl memcpy
	ldr r1, [r4]
	ldr r2, [r5]
	movs r3, 0xB0
	lsls r3, 1
	adds r0, r2, r3
	ldrh r0, [r0]
	ldr r3, _0810AF6C @ =0x00000296
	adds r1, r3
	strh r0, [r1]
	ldr r1, _0810AF70 @ =gUnknown_203ACFC
	movs r3, 0xB1
	lsls r3, 1
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1, 0x6]
	movs r4, 0
	mov r12, r5
	adds r3, r1, 0
	adds r3, 0x8
	mov r7, r12
	movs r6, 0xAA
	lsls r6, 1
	movs r5, 0xAD
	lsls r5, 1
_0810AF3A:
	lsls r2, r4, 1
	ldr r1, [r7]
	adds r0, r1, r6
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r3]
	adds r1, r5
	adds r1, r2
	ldrh r0, [r1]
	strh r0, [r3, 0x6]
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	bls _0810AF3A
	mov r1, r12
	ldr r0, [r1]
	bl Free
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810AF64: .4byte gSaveBlock1Ptr
_0810AF68: .4byte gUnknown_203AD2C
_0810AF6C: .4byte 0x00000296
_0810AF70: .4byte gUnknown_203ACFC
	thumb_func_end sub_810AECC

	thumb_func_start sub_810AF74
sub_810AF74: @ 810AF74
	push {lr}
	bl sub_810ADD8
	movs r0, 0xD
	movs r1, 0x1
	bl AddBagItem
	movs r0, 0x4
	movs r1, 0x1
	bl AddBagItem
	ldr r2, _0810AF98 @ =SetCB2ToReshowScreenAfterMenu2
	movs r0, 0x6
	movs r1, 0
	bl GoToBagMenu
	pop {r0}
	bx r0
	.align 2, 0
_0810AF98: .4byte SetCB2ToReshowScreenAfterMenu2
	thumb_func_end sub_810AF74

	thumb_func_start sub_810AF9C
sub_810AF9C: @ 810AF9C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r6, r0, 3
	ldr r7, _0810AFCC @ =gTasks+0x8
	adds r5, r6, r7
	ldr r0, _0810AFD0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810B06A
	movs r0, 0x10
	ldrsh r1, [r5, r0]
	cmp r1, 0xCC
	beq _0810AFE4
	cmp r1, 0xCC
	bgt _0810AFD4
	cmp r1, 0x66
	beq _0810AFE4
	b _0810B064
	.align 2, 0
_0810AFCC: .4byte gTasks+0x8
_0810AFD0: .4byte gPaletteFade
_0810AFD4:
	movs r0, 0x99
	lsls r0, 1
	cmp r1, r0
	beq _0810AFF6
	adds r0, 0x66
	cmp r1, r0
	beq _0810B01C
	b _0810B064
_0810AFE4:
	movs r0, 0xF6
	bl PlaySE
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_81091D0
	b _0810B064
_0810AFF6:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r5]
	movs r1, 0x2
	bl bag_menu_print_cursor_
	movs r0, 0x1
	bl sub_8109140
	ldr r1, _0810B018 @ =gSpecialVar_ItemId
	movs r0, 0x4
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_8109890
	b _0810B064
	.align 2, 0
_0810B018: .4byte gSpecialVar_ItemId
_0810B01C:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0xA
	bl sub_810BA3C
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x1
	bl CopyWindowToVram
	ldrb r0, [r5]
	movs r1, 0
	movs r2, 0
	bl DestroyListMenuTask
	bl sub_810AECC
	bl sub_8108CB4
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0810B060 @ =sub_810B070
	str r1, [r0]
	b _0810B06A
	.align 2, 0
_0810B060: .4byte sub_810B070
_0810B064:
	ldrh r0, [r5, 0x10]
	adds r0, 0x1
	strh r0, [r5, 0x10]
_0810B06A:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810AF9C

	thumb_func_start sub_810B070
sub_810B070: @ 810B070
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x2
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0810B0A4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810B0A8 @ =sub_810B0AC
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B0A4: .4byte gTasks
_0810B0A8: .4byte sub_810B0AC
	thumb_func_end sub_810B070

	thumb_func_start sub_810B0AC
sub_810B0AC: @ 810B0AC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0810B0DC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810B0FE
	ldr r0, _0810B0E0 @ =sub_8108CFC
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810B0FE
	ldr r0, _0810B0E4 @ =gUnknown_203AD10
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, 0
	beq _0810B0E8
	bl SetMainCallback2
	b _0810B0F0
	.align 2, 0
_0810B0DC: .4byte gPaletteFade
_0810B0E0: .4byte sub_8108CFC
_0810B0E4: .4byte gUnknown_203AD10
_0810B0E8:
	ldr r0, _0810B104 @ =gUnknown_203ACFC
	ldr r0, [r0]
	bl SetMainCallback2
_0810B0F0:
	bl sub_8108978
	bl sub_8108B04
	adds r0, r4, 0
	bl DestroyTask
_0810B0FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B104: .4byte gUnknown_203ACFC
	thumb_func_end sub_810B0AC

	thumb_func_start sub_810B108
sub_810B108: @ 810B108
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_810ADD8
	movs r0, 0xD
	movs r1, 0x1
	bl AddBagItem
	movs r0, 0xE
	movs r1, 0x1
	bl AddBagItem
	movs r0, 0xB7
	lsls r0, 1
	movs r1, 0x1
	bl AddBagItem
	movs r0, 0xB6
	lsls r0, 1
	movs r1, 0x1
	bl AddBagItem
	movs r0, 0x4
	movs r1, 0x5
	bl AddBagItem
	movs r0, 0x3
	movs r1, 0x1
	bl AddBagItem
	movs r0, 0x8
	movs r1, 0x1
	bl AddBagItem
	cmp r4, 0x7
	beq _0810B160
	cmp r4, 0x8
	beq _0810B16C
	ldr r2, _0810B15C @ =CB2_ReturnToTeachyTV
	adds r0, r4, 0
	b _0810B170
	.align 2, 0
_0810B15C: .4byte CB2_ReturnToTeachyTV
_0810B160:
	ldr r2, _0810B168 @ =SetCB2ToReshowScreenAfterMenu2
	movs r0, 0x7
	b _0810B170
	.align 2, 0
_0810B168: .4byte SetCB2ToReshowScreenAfterMenu2
_0810B16C:
	ldr r2, _0810B17C @ =SetCB2ToReshowScreenAfterMenu2
	movs r0, 0x8
_0810B170:
	movs r1, 0
	bl GoToBagMenu
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B17C: .4byte SetCB2ToReshowScreenAfterMenu2
	thumb_func_end sub_810B108

	thumb_func_start sub_810B180
sub_810B180: @ 810B180
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0810B198 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0810B19C
	movs r0, 0
	b _0810B1BC
	.align 2, 0
_0810B198: .4byte gMain
_0810B19C:
	bl sub_810AECC
	bl SetTeachyTvControllerModeToResume
	ldr r0, _0810B1C4 @ =gUnknown_203AD10
	ldr r1, [r0]
	ldr r0, _0810B1C8 @ =CB2_ReturnToTeachyTV
	str r0, [r1]
	ldr r1, _0810B1CC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810B1D0 @ =sub_810B070
	str r1, [r0]
	movs r0, 0x1
_0810B1BC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0810B1C4: .4byte gUnknown_203AD10
_0810B1C8: .4byte CB2_ReturnToTeachyTV
_0810B1CC: .4byte gTasks
_0810B1D0: .4byte sub_810B070
	thumb_func_end sub_810B180

	thumb_func_start sub_810B1D4
sub_810B1D4: @ 810B1D4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r5, r0, 3
	ldr r6, _0810B220 @ =gTasks+0x8
	adds r7, r5, r6
	ldr r0, _0810B224 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0810B1F2
	b _0810B372
_0810B1F2:
	adds r0, r4, 0
	bl sub_810B180
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810B202
	b _0810B372
_0810B202:
	movs r0, 0x10
	ldrsh r1, [r7, r0]
	movs r0, 0xCC
	lsls r0, 1
	cmp r1, r0
	beq _0810B29E
	cmp r1, r0
	bgt _0810B232
	cmp r1, 0xCC
	beq _0810B266
	cmp r1, 0xCC
	bgt _0810B228
	cmp r1, 0x66
	beq _0810B254
	b _0810B36C
	.align 2, 0
_0810B220: .4byte gTasks+0x8
_0810B224: .4byte gPaletteFade
_0810B228:
	movs r0, 0x99
	lsls r0, 1
	cmp r1, r0
	beq _0810B290
	b _0810B36C
_0810B232:
	movs r0, 0x99
	lsls r0, 2
	cmp r1, r0
	beq _0810B32C
	cmp r1, r0
	bgt _0810B246
	subs r0, 0x66
	cmp r1, r0
	beq _0810B32C
	b _0810B36C
_0810B246:
	ldr r0, _0810B250 @ =0x000002ca
	cmp r1, r0
	bne _0810B24E
	b _0810B344
_0810B24E:
	b _0810B36C
	.align 2, 0
_0810B250: .4byte 0x000002ca
_0810B254:
	movs r0, 0xF6
	bl PlaySE
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_81091D0
	b _0810B36C
_0810B266:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r7]
	movs r1, 0x2
	bl bag_menu_print_cursor_
	movs r0, 0x1
	bl sub_8109140
	ldr r1, _0810B28C @ =gSpecialVar_ItemId
	movs r2, 0xB7
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_8109890
	b _0810B36C
	.align 2, 0
_0810B28C: .4byte gSpecialVar_ItemId
_0810B290:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl Menu_MoveCursorNoWrapAround
	b _0810B36C
_0810B29E:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0810B318 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _0810B31C @ =gSpecialVar_ItemId
	ldrh r1, [r1]
	ldr r2, _0810B320 @ =0x00000296
	adds r0, r2
	strh r1, [r0]
	movs r0, 0xA
	bl sub_810BA3C
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	ldrb r0, [r7]
	ldr r4, _0810B324 @ =gUnknown_203ACFC
	ldrh r2, [r4, 0x6]
	lsls r2, 1
	adds r5, r4, 0
	adds r5, 0xE
	adds r1, r2, r5
	adds r6, r4, 0
	adds r6, 0x8
	adds r2, r6
	bl DestroyListMenuTask
	ldrb r0, [r4, 0x6]
	bl sub_810842C
	ldr r0, _0810B328 @ =gMultiuseListMenuTemplate
	ldrh r2, [r4, 0x6]
	lsls r2, 1
	adds r5, r2, r5
	ldrh r1, [r5]
	adds r2, r6
	ldrh r2, [r2]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7]
	movs r0, 0
	bl sub_8109140
	ldrb r0, [r7]
	movs r1, 0x1
	bl bag_menu_print_cursor_
	movs r0, 0
	movs r1, 0x1
	bl CopyWindowToVram
	b _0810B36C
	.align 2, 0
_0810B318: .4byte gSaveBlock1Ptr
_0810B31C: .4byte gSpecialVar_ItemId
_0810B320: .4byte 0x00000296
_0810B324: .4byte gUnknown_203ACFC
_0810B328: .4byte gMultiuseListMenuTemplate
_0810B32C:
	ldr r1, _0810B340 @ =gMain
	movs r0, 0
	strh r0, [r1, 0x2E]
	movs r0, 0x80
	strh r0, [r1, 0x30]
	ldrb r0, [r7]
	bl ListMenu_ProcessInput
	b _0810B36C
	.align 2, 0
_0810B340: .4byte gMain
_0810B344:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r7]
	movs r1, 0
	movs r2, 0
	bl DestroyListMenuTask
	bl sub_810AECC
	bl sub_8108CB4
	adds r0, r6, 0
	subs r0, 0x8
	adds r0, r5, r0
	ldr r1, _0810B368 @ =sub_810B070
	str r1, [r0]
	b _0810B372
	.align 2, 0
_0810B368: .4byte sub_810B070
_0810B36C:
	ldrh r0, [r7, 0x10]
	adds r0, 0x1
	strh r0, [r7, 0x10]
_0810B372:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810B1D4

	thumb_func_start sub_810B378
sub_810B378: @ 810B378
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r7, _0810B3B0 @ =gTasks+0x8
	adds r4, r6, r7
	ldr r0, _0810B3B4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0810B396
	b _0810B4B6
_0810B396:
	adds r0, r5, 0
	bl sub_810B180
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810B3B8
	bl FreeRestoreBattleData
	bl LoadPlayerParty
	b _0810B4B6
	.align 2, 0
_0810B3B0: .4byte gTasks+0x8
_0810B3B4: .4byte gPaletteFade
_0810B3B8:
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	movs r0, 0xCC
	lsls r0, 1
	cmp r1, r0
	beq _0810B41A
	cmp r1, r0
	bgt _0810B3E0
	cmp r1, 0xCC
	beq _0810B408
	cmp r1, 0xCC
	bgt _0810B3D6
	cmp r1, 0x66
	beq _0810B408
	b _0810B4B0
_0810B3D6:
	movs r0, 0x99
	lsls r0, 1
	cmp r1, r0
	beq _0810B41A
	b _0810B4B0
_0810B3E0:
	movs r0, 0x99
	lsls r0, 2
	cmp r1, r0
	beq _0810B428
	cmp r1, r0
	bgt _0810B3F4
	subs r0, 0x66
	cmp r1, r0
	beq _0810B428
	b _0810B4B0
_0810B3F4:
	ldr r0, _0810B404 @ =0x000002ca
	cmp r1, r0
	beq _0810B440
	adds r0, 0x66
	cmp r1, r0
	beq _0810B468
	b _0810B4B0
	.align 2, 0
_0810B404: .4byte 0x000002ca
_0810B408:
	movs r0, 0xF6
	bl PlaySE
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_81091D0
	b _0810B4B0
_0810B41A:
	ldr r1, _0810B424 @ =gMain
	movs r0, 0
	strh r0, [r1, 0x2E]
	movs r0, 0x80
	b _0810B430
	.align 2, 0
_0810B424: .4byte gMain
_0810B428:
	ldr r1, _0810B43C @ =gMain
	movs r0, 0
	strh r0, [r1, 0x2E]
	movs r0, 0x40
_0810B430:
	strh r0, [r1, 0x30]
	ldrb r0, [r4]
	bl ListMenu_ProcessInput
	b _0810B4B0
	.align 2, 0
_0810B43C: .4byte gMain
_0810B440:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	movs r1, 0x2
	bl bag_menu_print_cursor_
	movs r0, 0x1
	bl sub_8109140
	ldr r1, _0810B464 @ =gSpecialVar_ItemId
	movs r0, 0x4
	strh r0, [r1]
	adds r0, r5, 0
	bl sub_8109890
	b _0810B4B0
	.align 2, 0
_0810B464: .4byte gSpecialVar_ItemId
_0810B468:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0xA
	bl sub_810BA3C
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x1
	bl CopyWindowToVram
	ldrb r0, [r4]
	movs r1, 0
	movs r2, 0
	bl DestroyListMenuTask
	bl sub_810AECC
	bl sub_8108CB4
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0810B4AC @ =sub_810B070
	str r1, [r0]
	b _0810B4B6
	.align 2, 0
_0810B4AC: .4byte sub_810B070
_0810B4B0:
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
_0810B4B6:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810B378

	thumb_func_start sub_810B4BC
sub_810B4BC: @ 810B4BC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	mov r8, r0
	ldr r0, _0810B504 @ =gTasks+0x8
	mov r9, r0
	mov r5, r8
	add r5, r9
	ldr r0, _0810B508 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r7, 0x80
	adds r0, r7, 0
	ands r0, r1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	bne _0810B5C6
	adds r0, r4, 0
	bl sub_810B180
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810B50C
	bl FreeRestoreBattleData
	bl LoadPlayerParty
	b _0810B5C6
	.align 2, 0
_0810B504: .4byte gTasks+0x8
_0810B508: .4byte gPaletteFade
_0810B50C:
	movs r0, 0x10
	ldrsh r1, [r5, r0]
	cmp r1, 0xCC
	beq _0810B53C
	cmp r1, 0xCC
	bgt _0810B51E
	cmp r1, 0x66
	beq _0810B528
	b _0810B5C0
_0810B51E:
	movs r0, 0x99
	lsls r0, 1
	cmp r1, r0
	beq _0810B564
	b _0810B5C0
_0810B528:
	ldr r0, _0810B538 @ =gMain
	strh r6, [r0, 0x2E]
	strh r7, [r0, 0x30]
	ldrb r0, [r5]
	bl ListMenu_ProcessInput
	b _0810B5C0
	.align 2, 0
_0810B538: .4byte gMain
_0810B53C:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r5]
	movs r1, 0x2
	bl bag_menu_print_cursor_
	movs r0, 0x1
	bl sub_8109140
	ldr r1, _0810B560 @ =gSpecialVar_ItemId
	movs r0, 0xE
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_8109890
	b _0810B5C0
	.align 2, 0
_0810B560: .4byte gSpecialVar_ItemId
_0810B564:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0xA
	bl sub_810BA3C
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x1
	bl CopyWindowToVram
	ldrb r0, [r5]
	movs r1, 0
	movs r2, 0
	bl DestroyListMenuTask
	bl sub_810AECC
	ldr r1, _0810B5B0 @ =gItemUseCB
	ldr r0, _0810B5B4 @ =ItemUseCB_MedicineStep
	str r0, [r1]
	ldr r0, _0810B5B8 @ =ChooseMonForInBattleItem
	bl ItemMenu_SetExitCallback
	mov r0, r9
	subs r0, 0x8
	add r0, r8
	ldr r1, _0810B5BC @ =sub_810B070
	str r1, [r0]
	b _0810B5C6
	.align 2, 0
_0810B5B0: .4byte gItemUseCB
_0810B5B4: .4byte ItemUseCB_MedicineStep
_0810B5B8: .4byte ChooseMonForInBattleItem
_0810B5BC: .4byte sub_810B070
_0810B5C0:
	ldrh r0, [r5, 0x10]
	adds r0, 0x1
	strh r0, [r5, 0x10]
_0810B5C6:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810B4BC

	thumb_func_start sub_810B5D4
sub_810B5D4: @ 810B5D4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	mov r8, r0
	ldr r0, _0810B624 @ =gTasks+0x8
	mov r9, r0
	mov r6, r8
	add r6, r9
	ldr r0, _0810B628 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r7, 0x80
	adds r0, r7, 0
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _0810B6E6
	adds r0, r4, 0
	bl sub_810B180
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810B6E6
	movs r2, 0x10
	ldrsh r1, [r6, r2]
	cmp r1, 0xCC
	beq _0810B64E
	cmp r1, 0xCC
	bgt _0810B62C
	cmp r1, 0x66
	beq _0810B63C
	b _0810B6E0
	.align 2, 0
_0810B624: .4byte gTasks+0x8
_0810B628: .4byte gPaletteFade
_0810B62C:
	movs r0, 0x99
	lsls r0, 1
	cmp r1, r0
	beq _0810B660
	adds r0, 0x66
	cmp r1, r0
	beq _0810B68C
	b _0810B6E0
_0810B63C:
	movs r0, 0xF6
	bl PlaySE
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_81091D0
	b _0810B6E0
_0810B64E:
	ldr r0, _0810B65C @ =gMain
	strh r5, [r0, 0x2E]
	strh r7, [r0, 0x30]
	ldrb r0, [r6]
	bl ListMenu_ProcessInput
	b _0810B6E0
	.align 2, 0
_0810B65C: .4byte gMain
_0810B660:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r6]
	movs r1, 0x2
	bl bag_menu_print_cursor_
	movs r0, 0x1
	bl sub_8109140
	ldr r1, _0810B688 @ =gSpecialVar_ItemId
	movs r2, 0xB6
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_8109890
	b _0810B6E0
	.align 2, 0
_0810B688: .4byte gSpecialVar_ItemId
_0810B68C:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0xA
	bl sub_810BA3C
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x1
	bl CopyWindowToVram
	ldrb r0, [r6]
	movs r1, 0
	movs r2, 0
	bl DestroyListMenuTask
	bl sub_810AECC
	ldr r0, _0810B6D4 @ =gUnknown_203AD10
	ldr r1, [r0]
	ldr r0, _0810B6D8 @ =PokeDude_InitTMCase
	str r0, [r1]
	mov r0, r9
	subs r0, 0x8
	add r0, r8
	ldr r1, _0810B6DC @ =sub_810B070
	str r1, [r0]
	b _0810B6E6
	.align 2, 0
_0810B6D4: .4byte gUnknown_203AD10
_0810B6D8: .4byte PokeDude_InitTMCase
_0810B6DC: .4byte sub_810B070
_0810B6E0:
	ldrh r0, [r6, 0x10]
	adds r0, 0x1
	strh r0, [r6, 0x10]
_0810B6E6:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810B5D4

	.align 2, 0 @ Don't pad with nop.
