	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_813E320
sub_813E320: @ 813E320
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0813E374 @ =gUnknown_203F388
	ldrb r0, [r0]
	adds r0, 0x9
	lsls r0, 24
	lsrs r0, 24
	bl sub_813EA98
	movs r0, 0x6
	bl sub_813EA98
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r1, _0813E378 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x8]
	movs r1, 0x1
	bl sub_813D4B0
	adds r0, r4, 0
	bl sub_813DBB4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813E374: .4byte gUnknown_203F388
_0813E378: .4byte gTasks
	thumb_func_end sub_813E320

	thumb_func_start sub_813E37C
sub_813E37C: @ 813E37C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r7, _0813E3C4 @ =gTasks+0x8
	adds r0, r6, r7
	ldrh r1, [r0, 0x2]
	movs r0, 0x5
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_80BF6A8
	lsls r0, 24
	cmp r0, 0
	bne _0813E3D8
	ldr r1, _0813E3C8 @ =gStringVar1
	adds r0, r4, 0
	bl CopyItemName
	ldr r4, _0813E3CC @ =gStringVar4
	ldr r1, _0813E3D0 @ =gUnknown_8416374
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r3, _0813E3D4 @ =sub_813E290
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl DisplayItemMessageInBerryPouch
	b _0813E3EA
	.align 2, 0
_0813E3C4: .4byte gTasks+0x8
_0813E3C8: .4byte gStringVar1
_0813E3CC: .4byte gStringVar4
_0813E3D0: .4byte gUnknown_8416374
_0813E3D4: .4byte sub_813E290
_0813E3D8:
	ldr r0, _0813E3F0 @ =gUnknown_203F36C
	ldr r1, [r0]
	ldr r0, _0813E3F4 @ =c2_8123744
	str r0, [r1]
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0813E3F8 @ =BerryPouch_StartFadeToExitCallback
	str r1, [r0]
_0813E3EA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813E3F0: .4byte gUnknown_203F36C
_0813E3F4: .4byte c2_8123744
_0813E3F8: .4byte BerryPouch_StartFadeToExitCallback
	thumb_func_end sub_813E37C

	thumb_func_start sub_813E3FC
sub_813E3FC: @ 813E3FC
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813E418 @ =gUnknown_203F36C
	ldr r2, [r1]
	ldr r1, _0813E41C @ =sub_808CE60
	str r1, [r2]
	ldr r2, _0813E420 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0813E424 @ =BerryPouch_StartFadeToExitCallback
	str r0, [r1]
	bx lr
	.align 2, 0
_0813E418: .4byte gUnknown_203F36C
_0813E41C: .4byte sub_808CE60
_0813E420: .4byte gTasks
_0813E424: .4byte BerryPouch_StartFadeToExitCallback
	thumb_func_end sub_813E3FC

	thumb_func_start sub_813E428
sub_813E428: @ 813E428
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r5, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0813E470 @ =gTasks+0x8
	adds r4, r0, r1
	ldr r6, _0813E474 @ =gSpecialVar_ItemId
	ldrh r0, [r6]
	bl itemid_get_market_price
	lsls r0, 16
	cmp r0, 0
	bne _0813E488
	ldrh r0, [r6]
	ldr r1, _0813E478 @ =gStringVar1
	bl CopyItemName
	ldr r4, _0813E47C @ =gStringVar4
	ldr r1, _0813E480 @ =gText_OhNoICantBuyThat
	adds r0, r4, 0
	bl StringExpandPlaceholders
	bl sub_80BF8E4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0813E484 @ =sub_813E2B8
	adds r0, r5, 0
	adds r2, r4, 0
	bl DisplayItemMessageInBerryPouch
	b _0813E4CE
	.align 2, 0
_0813E470: .4byte gTasks+0x8
_0813E474: .4byte gSpecialVar_ItemId
_0813E478: .4byte gStringVar1
_0813E47C: .4byte gStringVar4
_0813E480: .4byte gText_OhNoICantBuyThat
_0813E484: .4byte sub_813E2B8
_0813E488:
	movs r0, 0x1
	strh r0, [r4, 0x10]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _0813E4A0
	bl sub_813EBD4
	adds r0, r5, 0
	bl sub_813E4E4
	b _0813E4CE
_0813E4A0:
	cmp r0, 0x63
	ble _0813E4A8
	movs r0, 0x63
	strh r0, [r4, 0x4]
_0813E4A8:
	ldrh r0, [r6]
	ldr r1, _0813E4D4 @ =gStringVar1
	bl CopyItemName
	ldr r4, _0813E4D8 @ =gStringVar4
	ldr r1, _0813E4DC @ =gText_HowManyWouldYouLikeToSell
	adds r0, r4, 0
	bl StringExpandPlaceholders
	bl sub_80BF8E4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0813E4E0 @ =sub_813E5B8
	adds r0, r7, 0
	adds r2, r4, 0
	bl DisplayItemMessageInBerryPouch
_0813E4CE:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813E4D4: .4byte gStringVar1
_0813E4D8: .4byte gStringVar4
_0813E4DC: .4byte gText_HowManyWouldYouLikeToSell
_0813E4E0: .4byte sub_813E5B8
	thumb_func_end sub_813E428

	thumb_func_start sub_813E4E4
sub_813E4E4: @ 813E4E4
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _0813E540 @ =gTasks+0x8
	adds r4, r0
	ldr r6, _0813E544 @ =gStringVar3
	ldrh r1, [r4, 0x2]
	movs r0, 0x5
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
	ldr r4, _0813E548 @ =gStringVar4
	ldr r1, _0813E54C @ =gText_ICanPayThisMuch_WouldThatBeOkay
	adds r0, r4, 0
	bl StringExpandPlaceholders
	bl sub_80BF8E4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0813E550 @ =sub_813E554
	adds r0, r5, 0
	adds r2, r4, 0
	bl DisplayItemMessageInBerryPouch
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813E540: .4byte gTasks+0x8
_0813E544: .4byte gStringVar3
_0813E548: .4byte gStringVar4
_0813E54C: .4byte gText_ICanPayThisMuch_WouldThatBeOkay
_0813E550: .4byte sub_813E554
	thumb_func_end sub_813E4E4

	thumb_func_start sub_813E554
sub_813E554: @ 813E554
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813E564 @ =gUnknown_8464374
	bl sub_813EBA8
	pop {r0}
	bx r0
	.align 2, 0
_0813E564: .4byte gUnknown_8464374
	thumb_func_end sub_813E554

	thumb_func_start sub_813E568
sub_813E568: @ 813E568
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _0813E5B4 @ =gTasks+0x8
	adds r4, r0
	movs r0, 0x2
	bl sub_813EA98
	movs r0, 0x5
	bl sub_813EACC
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_813D4B0
	adds r0, r5, 0
	bl sub_813DBB4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813E5B4: .4byte gTasks+0x8
	thumb_func_end sub_813E568

	thumb_func_start sub_813E5B8
sub_813E5B8: @ 813E5B8
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	lsls r5, r0, 2
	adds r5, r0
	lsls r5, 3
	ldr r6, _0813E654 @ =gTasks+0x8
	adds r0, r5, r6
	mov r9, r0
	movs r0, 0x1
	bl sub_813EA08
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0813E658 @ =gStringVar1
	movs r1, 0x1
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r2, _0813E65C @ =gStringVar4
	mov r8, r2
	ldr r1, _0813E660 @ =gText_TimesStrVar1
	mov r0, r8
	bl StringExpandPlaceholders
	movs r0, 0xA
	str r0, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r0, 0xFF
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	adds r0, r4, 0
	movs r1, 0
	mov r2, r8
	movs r3, 0x4
	bl sub_813E9A0
	mov r3, r9
	ldrh r1, [r3, 0x2]
	movs r0, 0x5
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r0, 16
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	mov r2, r9
	movs r3, 0x10
	ldrsh r1, [r2, r3]
	muls r0, r1
	bl sub_813E668
	bl sub_813EBD4
	bl sub_813D64C
	subs r6, 0x8
	adds r5, r6
	ldr r0, _0813E664 @ =sub_813E690
	str r0, [r5]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813E654: .4byte gTasks+0x8
_0813E658: .4byte gStringVar1
_0813E65C: .4byte gStringVar4
_0813E660: .4byte gText_TimesStrVar1
_0813E664: .4byte sub_813E690
	thumb_func_end sub_813E5B8

	thumb_func_start sub_813E668
sub_813E668: @ 813E668
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r0, 0x1
	bl sub_813EB10
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	str r1, [sp]
	movs r1, 0x38
	movs r2, 0xA
	adds r3, r4, 0
	bl PrintMoneyAmount
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813E668

	thumb_func_start sub_813E690
sub_813E690: @ 813E690
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0813E6E0 @ =gTasks+0x8
	adds r5, r0, r1
	adds r0, r5, 0
	adds r0, 0x10
	ldrh r1, [r5, 0x4]
	bl AdjustQuantityAccordingToDPadInput
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813E6E4
	movs r0, 0x10
	ldrsh r1, [r5, r0]
	movs r0, 0x1
	movs r2, 0x2
	bl sub_813D9F8
	ldrh r1, [r5, 0x2]
	movs r0, 0x5
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r0, 16
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	movs r2, 0x10
	ldrsh r1, [r5, r2]
	muls r0, r1
	bl sub_813E668
	b _0813E762
	.align 2, 0
_0813E6E0: .4byte gTasks+0x8
_0813E6E4:
	ldr r0, _0813E714 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813E718
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl sub_813EA98
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	bl sub_813D684
	adds r0, r4, 0
	bl sub_813E4E4
	b _0813E762
	.align 2, 0
_0813E714: .4byte gMain
_0813E718:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0813E762
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl sub_813EA98
	movs r0, 0x2
	bl sub_813EA98
	movs r0, 0x5
	bl sub_813EACC
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	bl sub_813D684
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_813D4B0
	adds r0, r6, 0
	bl sub_813DBB4
_0813E762:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_813E690

	thumb_func_start sub_813E768
sub_813E768: @ 813E768
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _0813E7D4 @ =gTasks+0x8
	adds r4, r0
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	ldr r0, _0813E7D8 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	ldr r1, _0813E7DC @ =gStringVar1
	bl CopyItemName
	ldr r6, _0813E7E0 @ =gStringVar3
	ldrh r1, [r4, 0x2]
	movs r0, 0x5
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
	ldr r4, _0813E7E4 @ =gStringVar4
	ldr r1, _0813E7E8 @ =gText_TurnedOverItemsWorthYen
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r3, _0813E7EC @ =sub_813E7F0
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl DisplayItemMessageInBerryPouch
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813E7D4: .4byte gTasks+0x8
_0813E7D8: .4byte gSpecialVar_ItemId
_0813E7DC: .4byte gStringVar1
_0813E7E0: .4byte gStringVar3
_0813E7E4: .4byte gStringVar4
_0813E7E8: .4byte gText_TurnedOverItemsWorthYen
_0813E7EC: .4byte sub_813E7F0
	thumb_func_end sub_813E768

	thumb_func_start sub_813E7F0
sub_813E7F0: @ 813E7F0
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
	ldr r0, _0813E8BC @ =gTasks+0x8
	mov r9, r0
	adds r1, r6, 0
	add r1, r9
	mov r8, r1
	movs r0, 0xF8
	bl PlaySE
	ldr r5, _0813E8C0 @ =gSpecialVar_ItemId
	ldrh r0, [r5]
	mov r2, r8
	ldrh r1, [r2, 0x10]
	bl RemoveBagItem
	ldr r7, _0813E8C4 @ =gSaveBlock1Ptr
	ldr r4, [r7]
	movs r3, 0xA4
	lsls r3, 2
	mov r10, r3
	add r4, r10
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
	bl sub_809C09C
	mov r3, r8
	ldrb r0, [r3]
	ldr r4, _0813E8C8 @ =gUnknown_203F370 + 10
	subs r2, r4, 0x2
	adds r1, r4, 0
	bl DestroyListMenuTask
	bl sub_813D8AC
	bl sub_813D6F4
	bl sub_813D204
	ldr r0, _0813E8CC @ =gMultiuseListMenuTemplate
	subs r4, 0xA
	ldrh r1, [r4, 0xA]
	ldrh r2, [r4, 0x8]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	strh r0, [r1]
	movs r1, 0x2
	bl sub_813D4B0
	movs r0, 0x2
	bl sub_813EB10
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, [r7]
	add r0, r10
	bl GetMoney
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0
	bl PrintMoneyAmountInMoneyBox
	movs r2, 0x8
	negs r2, r2
	add r9, r2
	add r6, r9
	ldr r0, _0813E8D0 @ =sub_813E8D4
	str r0, [r6]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813E8BC: .4byte gTasks+0x8
_0813E8C0: .4byte gSpecialVar_ItemId
_0813E8C4: .4byte gSaveBlock1Ptr
_0813E8C8: .4byte gUnknown_203F370 + 10
_0813E8CC: .4byte gMultiuseListMenuTemplate
_0813E8D0: .4byte sub_813E8D4
	thumb_func_end sub_813E7F0

	thumb_func_start sub_813E8D4
sub_813E8D4: @ 813E8D4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813E90C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0813E8EE
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0813E906
_0813E8EE:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
	bl sub_813EA98
	movs r0, 0x2
	bl PutWindowTilemap
	adds r0, r4, 0
	bl sub_813E2B8
_0813E906:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813E90C: .4byte gMain
	thumb_func_end sub_813E8D4

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
	ldr r0, _0813EB78 @ =gUnknown_8464400
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
_0813EB78: .4byte gUnknown_8464400
	thumb_func_end DisplayItemMessageInBerryPouch

	thumb_func_start sub_813EB7C
sub_813EB7C: @ 813EB7C
	push {lr}
	sub sp, 0x10
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813EBA4 @ =gUnknown_84643F0
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
_0813EBA4: .4byte gUnknown_84643F0
	thumb_func_end sub_813EB7C

	thumb_func_start sub_813EBA8
sub_813EBA8: @ 813EBA8
	push {lr}
	sub sp, 0x10
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813EBD0 @ =gUnknown_84643F8
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
_0813EBD0: .4byte gUnknown_84643F8
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
