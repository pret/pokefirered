	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start Task_SwitchHoldItemsPrompt
Task_SwitchHoldItemsPrompt: @ 81238A4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081238E4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081238DC
	ldr r0, _081238E8 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081238EC @ =gPlayerParty
	adds r0, r1
	ldr r1, _081238F0 @ =sPartyMenuItemId
	ldrh r1, [r1]
	movs r2, 0x1
	bl DisplayAlreadyHoldingItemSwitchMessage
	ldr r1, _081238F4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081238F8 @ =Task_SwitchItemsYesNo
	str r1, [r0]
_081238DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081238E4: .4byte gPaletteFade
_081238E8: .4byte gPartyMenu
_081238EC: .4byte gPlayerParty
_081238F0: .4byte sPartyMenuItemId
_081238F4: .4byte gTasks
_081238F8: .4byte Task_SwitchItemsYesNo
	thumb_func_end Task_SwitchHoldItemsPrompt

	thumb_func_start Task_SwitchItemsYesNo
Task_SwitchItemsYesNo: @ 81238FC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08123920
	bl PartyMenuDisplayYesNoMenu
	ldr r0, _08123928 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812392C @ =Task_HandleSwitchItemsYesNoInput
	str r0, [r1]
_08123920:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123928: .4byte gTasks
_0812392C: .4byte Task_HandleSwitchItemsYesNoInput
	thumb_func_end Task_SwitchItemsYesNo

	thumb_func_start Task_HandleSwitchItemsYesNoInput
Task_HandleSwitchItemsYesNoInput: @ 8123930
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08123956
	cmp r1, 0
	bgt _08123950
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08123A2C
	b _08123A40
_08123950:
	cmp r1, 0x1
	beq _08123A32
	b _08123A40
_08123956:
	ldr r5, _08123998 @ =gSpecialVar_ItemId
	ldrh r0, [r5]
	movs r1, 0x1
	bl RemoveBagItem
	ldr r6, _0812399C @ =sPartyMenuItemId
	ldrh r0, [r6]
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	cmp r0, 0
	bne _081239AC
	ldrh r0, [r5]
	movs r1, 0x1
	bl AddBagItem
	ldrh r0, [r6]
	bl BufferBagFullCantTakeItemMessage
	ldr r0, _081239A0 @ =gStringVar4
	movs r1, 0
	bl DisplayPartyMenuMessage
	ldr r1, _081239A4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081239A8 @ =Task_ReturnToChooseMonAfterText
	str r1, [r0]
	b _08123A40
	.align 2, 0
_08123998: .4byte gSpecialVar_ItemId
_0812399C: .4byte sPartyMenuItemId
_081239A0: .4byte gStringVar4
_081239A4: .4byte gTasks
_081239A8: .4byte Task_ReturnToChooseMonAfterText
_081239AC:
	ldrh r0, [r5]
	bl ItemIsMail
	lsls r0, 24
	cmp r0, 0
	beq _081239EC
	ldr r0, _081239DC @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081239E0 @ =gPlayerParty
	adds r0, r1
	ldrh r1, [r5]
	bl GiveItemToMon
	ldr r1, _081239E4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081239E8 @ =Task_WriteMailToGiveMonAfterText
	str r1, [r0]
	b _08123A40
	.align 2, 0
_081239DC: .4byte gPartyMenu
_081239E0: .4byte gPlayerParty
_081239E4: .4byte gTasks
_081239E8: .4byte Task_WriteMailToGiveMonAfterText
_081239EC:
	ldr r0, _08123A1C @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08123A20 @ =gPlayerParty
	adds r0, r1
	ldrh r1, [r5]
	bl GiveItemToMon
	ldrh r0, [r5]
	ldrh r1, [r6]
	movs r2, 0x1
	bl DisplaySwitchedHeldItemMessage
	ldr r1, _08123A24 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08123A28 @ =Task_UpdateHeldItemSprite
	str r1, [r0]
	b _08123A40
	.align 2, 0
_08123A1C: .4byte gPartyMenu
_08123A20: .4byte gPlayerParty
_08123A24: .4byte gTasks
_08123A28: .4byte Task_UpdateHeldItemSprite
_08123A2C:
	movs r0, 0x5
	bl PlaySE
_08123A32:
	ldr r0, _08123A48 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08123A4C @ =Task_ReturnToChooseMonAfterText
	str r0, [r1]
_08123A40:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08123A48: .4byte gTasks
_08123A4C: .4byte Task_ReturnToChooseMonAfterText
	thumb_func_end Task_HandleSwitchItemsYesNoInput

	thumb_func_start Task_WriteMailToGiveMonAfterText
Task_WriteMailToGiveMonAfterText: @ 8123A50
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08123A70
	ldr r0, _08123A78 @ =sPartyMenuInternal
	ldr r1, [r0]
	ldr r0, _08123A7C @ =CB2_WriteMailToGiveMon
	str r0, [r1, 0x4]
	adds r0, r4, 0
	bl Task_ClosePartyMenu
_08123A70:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123A78: .4byte sPartyMenuInternal
_08123A7C: .4byte CB2_WriteMailToGiveMon
	thumb_func_end Task_WriteMailToGiveMonAfterText

	thumb_func_start CB2_WriteMailToGiveMon
CB2_WriteMailToGiveMon: @ 8123A80
	push {lr}
	ldr r0, _08123AB8 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08123ABC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x40
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08123AC0 @ =gSaveBlock1Ptr
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	ldr r0, _08123AC4 @ =0x00002cd0
	adds r2, r0
	ldr r1, [r1]
	adds r1, r2
	ldr r2, _08123AC8 @ =CB2_ReturnToPartyMenuFromWritingMail
	movs r0, 0x4
	bl DoEasyChatScreen
	pop {r0}
	bx r0
	.align 2, 0
_08123AB8: .4byte gPartyMenu
_08123ABC: .4byte gPlayerParty
_08123AC0: .4byte gSaveBlock1Ptr
_08123AC4: .4byte 0x00002cd0
_08123AC8: .4byte CB2_ReturnToPartyMenuFromWritingMail
	thumb_func_end CB2_WriteMailToGiveMon

	thumb_func_start CB2_ReturnToPartyMenuFromWritingMail
CB2_ReturnToPartyMenuFromWritingMail: @ 8123ACC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	ldr r6, _08123B38 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r6, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08123B3C @ =gPlayerParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _08123B40 @ =gSpecialVar_Result
	ldrh r7, [r0]
	cmp r7, 0
	bne _08123B4C
	adds r0, r5, 0
	bl TakeMailFromMon
	ldr r4, _08123B44 @ =sPartyMenuItemId
	adds r0, r5, 0
	movs r1, 0xC
	adds r2, r4, 0
	bl SetMonData
	ldrh r0, [r4]
	movs r1, 0x1
	bl RemoveBagItem
	mov r0, r8
	movs r1, 0x1
	bl AddBagItem
	ldrb r0, [r6, 0x8]
	lsls r0, 28
	lsrs r0, 28
	ldrb r2, [r6, 0xB]
	str r7, [sp]
	ldr r1, _08123B48 @ =Task_TryCreateSelectionWindow
	str r1, [sp, 0x4]
	ldr r1, [r6]
	str r1, [sp, 0x8]
	movs r1, 0xFF
	movs r3, 0x1
	bl InitPartyMenu
	b _08123B68
	.align 2, 0
_08123B38: .4byte gPartyMenu
_08123B3C: .4byte gPlayerParty
_08123B40: .4byte gSpecialVar_Result
_08123B44: .4byte sPartyMenuItemId
_08123B48: .4byte Task_TryCreateSelectionWindow
_08123B4C:
	ldrb r0, [r6, 0x8]
	lsls r0, 28
	lsrs r0, 28
	ldrb r2, [r6, 0xB]
	movs r1, 0
	str r1, [sp]
	ldr r1, _08123B74 @ =Task_DisplayGaveMailFromPartyMessage
	str r1, [sp, 0x4]
	ldr r1, [r6]
	str r1, [sp, 0x8]
	movs r1, 0xFF
	movs r3, 0x1
	bl InitPartyMenu
_08123B68:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08123B74: .4byte Task_DisplayGaveMailFromPartyMessage
	thumb_func_end CB2_ReturnToPartyMenuFromWritingMail

	thumb_func_start Task_DisplayGaveMailFromPartyMessage
Task_DisplayGaveMailFromPartyMessage: @ 8123B78
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08123BB0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08123BDE
	ldr r1, _08123BB4 @ =sPartyMenuItemId
	ldrh r0, [r1]
	cmp r0, 0
	bne _08123BC4
	ldr r0, _08123BB8 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08123BBC @ =gPlayerParty
	adds r0, r1
	ldr r1, _08123BC0 @ =gSpecialVar_ItemId
	ldrh r1, [r1]
	movs r2, 0
	movs r3, 0
	bl DisplayGaveHeldItemMessage
	b _08123BD0
	.align 2, 0
_08123BB0: .4byte gPaletteFade
_08123BB4: .4byte sPartyMenuItemId
_08123BB8: .4byte gPartyMenu
_08123BBC: .4byte gPlayerParty
_08123BC0: .4byte gSpecialVar_ItemId
_08123BC4:
	ldr r0, _08123BE4 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	ldrh r1, [r1]
	movs r2, 0
	bl DisplaySwitchedHeldItemMessage
_08123BD0:
	ldr r0, _08123BE8 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08123BEC @ =Task_UpdateHeldItemSprite
	str r0, [r1]
_08123BDE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123BE4: .4byte gSpecialVar_ItemId
_08123BE8: .4byte gTasks
_08123BEC: .4byte Task_UpdateHeldItemSprite
	thumb_func_end Task_DisplayGaveMailFromPartyMessage

	thumb_func_start Task_UpdateHeldItemSprite
Task_UpdateHeldItemSprite: @ 8123BF0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08123C2C @ =gPartyMenu
	ldrb r4, [r0, 0x9]
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08123C24
	lsls r2, r4, 24
	asrs r2, 24
	movs r0, 0x64
	muls r0, r2
	ldr r1, _08123C30 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08123C34 @ =sPartyMenuBoxes
	lsls r2, 4
	ldr r1, [r1]
	adds r1, r2
	bl UpdatePartyMonHeldItemSprite
	adds r0, r5, 0
	bl Task_ReturnToChooseMonAfterText
_08123C24:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08123C2C: .4byte gPartyMenu
_08123C30: .4byte gPlayerParty
_08123C34: .4byte sPartyMenuBoxes
	thumb_func_end Task_UpdateHeldItemSprite

	thumb_func_start CursorCB_TakeItem
CursorCB_TakeItem: @ 8123C38
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08123C90 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08123C94 @ =gPlayerParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	movs r0, 0x5
	bl PlaySE
	ldr r4, _08123C98 @ =sPartyMenuInternal
	ldr r0, [r4]
	adds r0, 0xC
	bl PartyMenuRemoveWindow
	ldr r0, [r4]
	adds r0, 0xD
	bl PartyMenuRemoveWindow
	adds r0, r5, 0
	bl TryTakeMonItem
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08123C9C
	cmp r0, 0x1
	beq _08123CC0
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x1
	bl DisplayTookHeldItemMessage
	b _08123CCE
	.align 2, 0
_08123C90: .4byte gPartyMenu
_08123C94: .4byte gPlayerParty
_08123C98: .4byte sPartyMenuInternal
_08123C9C:
	ldr r1, _08123CB4 @ =gStringVar1
	adds r0, r5, 0
	bl GetMonNickname
	ldr r4, _08123CB8 @ =gStringVar4
	ldr r1, _08123CBC @ =gUnknown_8416C8F
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	b _08123CC8
	.align 2, 0
_08123CB4: .4byte gStringVar1
_08123CB8: .4byte gStringVar4
_08123CBC: .4byte gUnknown_8416C8F
_08123CC0:
	adds r0, r6, 0
	bl BufferBagFullCantTakeItemMessage
	ldr r0, _08123CE8 @ =gStringVar4
_08123CC8:
	movs r1, 0x1
	bl DisplayPartyMenuMessage
_08123CCE:
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r0, _08123CEC @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _08123CF0 @ =Task_UpdateHeldItemSprite
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08123CE8: .4byte gStringVar4
_08123CEC: .4byte gTasks
_08123CF0: .4byte Task_UpdateHeldItemSprite
	thumb_func_end CursorCB_TakeItem

	thumb_func_start CursorCB_Mail
CursorCB_Mail: @ 8123CF4
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x5
	bl PlaySE
	ldr r4, _08123D44 @ =sPartyMenuInternal
	ldr r0, [r4]
	adds r0, 0xC
	bl PartyMenuRemoveWindow
	ldr r0, [r4]
	adds r0, 0xD
	bl PartyMenuRemoveWindow
	ldr r0, _08123D48 @ =gPlayerParty
	ldr r1, _08123D4C @ =gPartyMenu
	ldrb r1, [r1, 0x9]
	movs r2, 0x9
	bl SetPartyMonSelectionActions
	movs r0, 0x2
	bl DisplaySelectionWindow
	movs r0, 0x1A
	bl DisplayPartyMenuStdMessage
	ldr r1, _08123D50 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0xFF
	strh r1, [r0, 0x8]
	ldr r1, _08123D54 @ =Task_HandleSelectionMenuInput
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08123D44: .4byte sPartyMenuInternal
_08123D48: .4byte gPlayerParty
_08123D4C: .4byte gPartyMenu
_08123D50: .4byte gTasks
_08123D54: .4byte Task_HandleSelectionMenuInput
	thumb_func_end CursorCB_Mail

	thumb_func_start CursorCB_Read
CursorCB_Read: @ 8123D58
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08123D7C @ =sPartyMenuInternal
	ldr r1, [r0]
	ldr r0, _08123D80 @ =CB2_ReadHeldMail
	str r0, [r1, 0x4]
	adds r0, r4, 0
	bl Task_ClosePartyMenu
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123D7C: .4byte sPartyMenuInternal
_08123D80: .4byte CB2_ReadHeldMail
	thumb_func_end CursorCB_Read

	thumb_func_start CB2_ReadHeldMail
CB2_ReadHeldMail: @ 8123D84
	push {lr}
	ldr r0, _08123DB8 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08123DBC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x40
	bl GetMonData
	ldr r2, _08123DC0 @ =gSaveBlock1Ptr
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08123DC4 @ =0x00002cd0
	adds r1, r0
	ldr r0, [r2]
	adds r0, r1
	ldr r1, _08123DC8 @ =CB2_ReturnToPartyMenuFromReadingMail
	movs r2, 0x1
	bl ReadMail
	pop {r0}
	bx r0
	.align 2, 0
_08123DB8: .4byte gPartyMenu
_08123DBC: .4byte gPlayerParty
_08123DC0: .4byte gSaveBlock1Ptr
_08123DC4: .4byte 0x00002cd0
_08123DC8: .4byte CB2_ReturnToPartyMenuFromReadingMail
	thumb_func_end CB2_ReadHeldMail

	thumb_func_start CB2_ReturnToPartyMenuFromReadingMail
CB2_ReturnToPartyMenuFromReadingMail: @ 8123DCC
	push {lr}
	sub sp, 0xC
	ldr r2, _08123E00 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r3, _08123E04 @ =gPartyMenu
	ldrb r0, [r3, 0x8]
	lsls r0, 28
	lsrs r0, 28
	ldrb r2, [r3, 0xB]
	movs r1, 0x16
	str r1, [sp]
	ldr r1, _08123E08 @ =Task_TryCreateSelectionWindow
	str r1, [sp, 0x4]
	ldr r1, [r3]
	str r1, [sp, 0x8]
	movs r1, 0xFF
	movs r3, 0x1
	bl InitPartyMenu
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08123E00: .4byte gPaletteFade
_08123E04: .4byte gPartyMenu
_08123E08: .4byte Task_TryCreateSelectionWindow
	thumb_func_end CB2_ReturnToPartyMenuFromReadingMail

	thumb_func_start CursorCB_TakeMail
CursorCB_TakeMail: @ 8123E0C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	ldr r5, _08123E48 @ =sPartyMenuInternal
	ldr r0, [r5]
	adds r0, 0xD
	bl PartyMenuRemoveWindow
	ldr r0, [r5]
	adds r0, 0xC
	bl PartyMenuRemoveWindow
	ldr r0, _08123E4C @ =gText_SendMailToPC
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	ldr r1, _08123E50 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08123E54 @ =Task_SendMailToPCYesNo
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08123E48: .4byte sPartyMenuInternal
_08123E4C: .4byte gText_SendMailToPC
_08123E50: .4byte gTasks
_08123E54: .4byte Task_SendMailToPCYesNo
	thumb_func_end CursorCB_TakeMail

	thumb_func_start Task_SendMailToPCYesNo
Task_SendMailToPCYesNo: @ 8123E58
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08123E7C
	bl PartyMenuDisplayYesNoMenu
	ldr r0, _08123E84 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08123E88 @ =Task_HandleSendMailToPCYesNoInput
	str r0, [r1]
_08123E7C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123E84: .4byte gTasks
_08123E88: .4byte Task_HandleSendMailToPCYesNoInput
	thumb_func_end Task_SendMailToPCYesNo

	thumb_func_start Task_HandleSendMailToPCYesNoInput
Task_HandleSendMailToPCYesNoInput: @ 8123E8C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08123EB2
	cmp r1, 0
	bgt _08123EAC
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08123F1C
	b _08123F38
_08123EAC:
	cmp r1, 0x1
	beq _08123F22
	b _08123F38
_08123EB2:
	ldr r0, _08123EE4 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08123EE8 @ =gPlayerParty
	adds r0, r1
	bl TakeMailFromMon2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08123EF8
	ldr r0, _08123EEC @ =gText_MailSentToPC
	movs r1, 0
	bl DisplayPartyMenuMessage
	ldr r1, _08123EF0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08123EF4 @ =Task_UpdateHeldItemSprite
	b _08123F36
	.align 2, 0
_08123EE4: .4byte gPartyMenu
_08123EE8: .4byte gPlayerParty
_08123EEC: .4byte gText_MailSentToPC
_08123EF0: .4byte gTasks
_08123EF4: .4byte Task_UpdateHeldItemSprite
_08123EF8:
	ldr r0, _08123F10 @ =gText_PCMailboxFull
	movs r1, 0
	bl DisplayPartyMenuMessage
	ldr r1, _08123F14 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08123F18 @ =Task_ReturnToChooseMonAfterText
	b _08123F36
	.align 2, 0
_08123F10: .4byte gText_PCMailboxFull
_08123F14: .4byte gTasks
_08123F18: .4byte Task_ReturnToChooseMonAfterText
_08123F1C:
	movs r0, 0x5
	bl PlaySE
_08123F22:
	ldr r0, _08123F40 @ =gText_MailMessageWillBeLost
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	ldr r1, _08123F44 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08123F48 @ =Task_LoseMailMessageYesNo
_08123F36:
	str r1, [r0]
_08123F38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123F40: .4byte gText_MailMessageWillBeLost
_08123F44: .4byte gTasks
_08123F48: .4byte Task_LoseMailMessageYesNo
	thumb_func_end Task_HandleSendMailToPCYesNoInput

	thumb_func_start Task_LoseMailMessageYesNo
Task_LoseMailMessageYesNo: @ 8123F4C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08123F70
	bl PartyMenuDisplayYesNoMenu
	ldr r0, _08123F78 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08123F7C @ =Task_HandleLoseMailMessageYesNoInput
	str r0, [r1]
_08123F70:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123F78: .4byte gTasks
_08123F7C: .4byte Task_HandleLoseMailMessageYesNoInput
	thumb_func_end Task_LoseMailMessageYesNo

	thumb_func_start Task_HandleLoseMailMessageYesNoInput
Task_HandleLoseMailMessageYesNoInput: @ 8123F80
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08123FAA
	cmp r1, 0
	bgt _08123FA4
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0812403C
	b _08124050
_08123FA4:
	cmp r1, 0x1
	beq _08124042
	b _08124050
_08123FAA:
	ldr r0, _08123FFC @ =gPartyMenu
	mov r8, r0
	ldrb r0, [r0, 0x9]
	lsls r0, 24
	asrs r0, 24
	movs r7, 0x64
	muls r0, r7
	ldr r6, _08124000 @ =gPlayerParty
	adds r0, r6
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08124010
	mov r1, r8
	movs r0, 0x9
	ldrsb r0, [r1, r0]
	muls r0, r7
	adds r0, r6
	bl TakeMailFromMon
	ldr r0, _08124004 @ =gText_MailTakenFromPkmn
	movs r1, 0
	bl DisplayPartyMenuMessage
	ldr r1, _08124008 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0812400C @ =Task_UpdateHeldItemSprite
	str r1, [r0]
	b _08124050
	.align 2, 0
_08123FFC: .4byte gPartyMenu
_08124000: .4byte gPlayerParty
_08124004: .4byte gText_MailTakenFromPkmn
_08124008: .4byte gTasks
_0812400C: .4byte Task_UpdateHeldItemSprite
_08124010:
	adds r0, r4, 0
	bl BufferBagFullCantTakeItemMessage
	ldr r0, _08124030 @ =gStringVar4
	movs r1, 0
	bl DisplayPartyMenuMessage
	ldr r1, _08124034 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08124038 @ =Task_ReturnToChooseMonAfterText
	str r1, [r0]
	b _08124050
	.align 2, 0
_08124030: .4byte gStringVar4
_08124034: .4byte gTasks
_08124038: .4byte Task_ReturnToChooseMonAfterText
_0812403C:
	movs r0, 0x5
	bl PlaySE
_08124042:
	ldr r0, _0812405C @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08124060 @ =Task_ReturnToChooseMonAfterText
	str r0, [r1]
_08124050:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812405C: .4byte gTasks
_08124060: .4byte Task_ReturnToChooseMonAfterText
	thumb_func_end Task_HandleLoseMailMessageYesNoInput

	thumb_func_start CursorCB_Cancel2
CursorCB_Cancel2: @ 8124064
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _081240E0 @ =gPartyMenu
	mov r8, r0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	adds r5, r1, 0
	muls r5, r0
	ldr r0, _081240E4 @ =gPlayerParty
	mov r9, r0
	add r5, r9
	movs r0, 0x5
	bl PlaySE
	ldr r4, _081240E8 @ =sPartyMenuInternal
	ldr r0, [r4]
	adds r0, 0xC
	bl PartyMenuRemoveWindow
	ldr r0, [r4]
	adds r0, 0xD
	bl PartyMenuRemoveWindow
	mov r0, r8
	ldrb r4, [r0, 0x9]
	adds r0, r5, 0
	bl GetPartyMenuActionsType
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	mov r0, r9
	adds r1, r4, 0
	bl SetPartyMonSelectionActions
	movs r0, 0
	bl DisplaySelectionWindow
	movs r0, 0x16
	bl DisplayPartyMenuStdMessage
	ldr r1, _081240EC @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	movs r1, 0xFF
	strh r1, [r0, 0x8]
	ldr r1, _081240F0 @ =Task_HandleSelectionMenuInput
	str r1, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081240E0: .4byte gPartyMenu
_081240E4: .4byte gPlayerParty
_081240E8: .4byte sPartyMenuInternal
_081240EC: .4byte gTasks
_081240F0: .4byte Task_HandleSelectionMenuInput
	thumb_func_end CursorCB_Cancel2

	thumb_func_start CursorCB_SendMon
CursorCB_SendMon: @ 81240F4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x5
	bl PlaySE
	ldr r5, _08124120 @ =sPartyMenuInternal
	ldr r0, [r5]
	adds r0, 0xC
	bl PartyMenuRemoveWindow
	bl TrySwitchInPokemon
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08124124
	adds r0, r4, 0
	bl Task_ClosePartyMenu
	b _08124142
	.align 2, 0
_08124120: .4byte sPartyMenuInternal
_08124124:
	ldr r0, [r5]
	adds r0, 0xD
	bl PartyMenuRemoveWindow
	ldr r0, _08124148 @ =gStringVar4
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	ldr r1, _0812414C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08124150 @ =Task_ReturnToChooseMonAfterText
	str r1, [r0]
_08124142:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08124148: .4byte gStringVar4
_0812414C: .4byte gTasks
_08124150: .4byte Task_ReturnToChooseMonAfterText
	thumb_func_end CursorCB_SendMon

	thumb_func_start CursorCB_Enter
CursorCB_Enter: @ 8124154
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0812417C @ =gPartyMenu
	ldrb r1, [r0, 0x8]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0x80
	bne _08124184
	movs r0, 0x2
	mov r8, r0
	ldr r1, _08124180 @ =gUnknown_8416B3E
	str r1, [sp]
	b _0812418C
	.align 2, 0
_0812417C: .4byte gPartyMenu
_08124180: .4byte gUnknown_8416B3E
_08124184:
	movs r2, 0x3
	mov r8, r2
	ldr r0, _081241FC @ =gUnknown_8416B16
	str r0, [sp]
_0812418C:
	ldr r4, _08124200 @ =sPartyMenuInternal
	ldr r0, [r4]
	adds r0, 0xC
	bl PartyMenuRemoveWindow
	ldr r0, [r4]
	adds r0, 0xD
	bl PartyMenuRemoveWindow
	movs r5, 0
	lsls r1, r7, 2
	mov r9, r1
	cmp r5, r8
	bcs _08124222
	ldr r6, _08124204 @ =gPartyMenu
	ldr r1, _08124208 @ =gTasks
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	mov r10, r0
_081241B6:
	ldr r0, _0812420C @ =gSelectedOrderFromParty
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0
	bne _08124218
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r6, 0x9]
	adds r0, 0x1
	strb r0, [r4]
	adds r0, r5, 0x2
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08124210 @ =sPartyMenuBoxes
	movs r2, 0x9
	ldrsb r2, [r6, r2]
	lsls r2, 4
	ldr r1, [r1]
	adds r1, r2
	movs r2, 0x1
	bl DisplayPartyPokemonDescriptionText
	mov r0, r8
	subs r0, 0x1
	cmp r5, r0
	bne _081241F0
	bl MoveCursorToConfirm
_081241F0:
	movs r0, 0
	bl DisplayPartyMenuStdMessage
	ldr r0, _08124214 @ =Task_HandleChooseMonInput
	mov r1, r10
	b _0812423C
	.align 2, 0
_081241FC: .4byte gUnknown_8416B16
_08124200: .4byte sPartyMenuInternal
_08124204: .4byte gPartyMenu
_08124208: .4byte gTasks
_0812420C: .4byte gSelectedOrderFromParty
_08124210: .4byte sPartyMenuBoxes
_08124214: .4byte Task_HandleChooseMonInput
_08124218:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r8
	bcc _081241B6
_08124222:
	movs r0, 0x1A
	bl PlaySE
	ldr r0, [sp]
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	ldr r0, _08124250 @ =gTasks
	mov r2, r9
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _08124254 @ =Task_ReturnToChooseMonAfterText
_0812423C:
	str r0, [r1]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124250: .4byte gTasks
_08124254: .4byte Task_ReturnToChooseMonAfterText
	thumb_func_end CursorCB_Enter

	thumb_func_start MoveCursorToConfirm
MoveCursorToConfirm: @ 8124258
	push {r4,lr}
	ldr r4, _08124274 @ =gPartyMenu
	ldrb r0, [r4, 0x9]
	movs r1, 0
	bl AnimatePartySlot
	movs r0, 0x6
	strb r0, [r4, 0x9]
	movs r1, 0x1
	bl AnimatePartySlot
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08124274: .4byte gPartyMenu
	thumb_func_end MoveCursorToConfirm

	thumb_func_start CursorCB_NoEntry
CursorCB_NoEntry: @ 8124278
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0x5
	bl PlaySE
	ldr r4, _081242BC @ =sPartyMenuInternal
	ldr r0, [r4]
	adds r0, 0xC
	bl PartyMenuRemoveWindow
	ldr r0, [r4]
	adds r0, 0xD
	bl PartyMenuRemoveWindow
	movs r4, 0
	ldr r3, _081242C0 @ =gSelectedOrderFromParty
	ldr r6, _081242C4 @ =gPartyMenu
	adds r5, r6, 0
_0812429E:
	adds r2, r4, r3
	ldrb r1, [r2]
	movs r0, 0x9
	ldrsb r0, [r5, r0]
	adds r0, 0x1
	cmp r1, r0
	bne _081242DC
	movs r1, 0
	strb r1, [r2]
	cmp r4, 0
	beq _081242C8
	cmp r4, 0x1
	beq _081242D4
	b _081242E6
	.align 2, 0
_081242BC: .4byte sPartyMenuInternal
_081242C0: .4byte gSelectedOrderFromParty
_081242C4: .4byte gPartyMenu
_081242C8:
	ldrb r0, [r3, 0x1]
	strb r0, [r3]
	ldrb r0, [r3, 0x2]
	strb r0, [r3, 0x1]
	strb r4, [r3, 0x2]
	b _081242E6
_081242D4:
	ldrb r0, [r3, 0x2]
	strb r0, [r3, 0x1]
	strb r1, [r3, 0x2]
	b _081242E6
_081242DC:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0812429E
_081242E6:
	ldr r5, _08124344 @ =sPartyMenuBoxes
	movs r0, 0x9
	ldrsb r0, [r6, r0]
	lsls r0, 4
	ldr r1, [r5]
	adds r1, r0
	movs r0, 0x1
	movs r2, 0x1
	bl DisplayPartyPokemonDescriptionText
	ldr r4, _08124348 @ =gSelectedOrderFromParty
	ldrb r0, [r4]
	cmp r0, 0
	beq _08124312
	lsls r0, 4
	subs r0, 0x10
	ldr r1, [r5]
	adds r1, r0
	movs r0, 0x2
	movs r2, 0x1
	bl DisplayPartyPokemonDescriptionText
_08124312:
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _08124328
	lsls r0, 4
	subs r0, 0x10
	ldr r1, [r5]
	adds r1, r0
	movs r0, 0x3
	movs r2, 0x1
	bl DisplayPartyPokemonDescriptionText
_08124328:
	movs r0, 0
	bl DisplayPartyMenuStdMessage
	ldr r0, _0812434C @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _08124350 @ =Task_HandleChooseMonInput
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124344: .4byte sPartyMenuBoxes
_08124348: .4byte gSelectedOrderFromParty
_0812434C: .4byte gTasks
_08124350: .4byte Task_HandleChooseMonInput
	thumb_func_end CursorCB_NoEntry

	thumb_func_start CursorCB_Store
CursorCB_Store: @ 8124354
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0812437C @ =gSpecialVar_0x8004
	ldr r0, _08124380 @ =gPartyMenu
	ldrb r0, [r0, 0x9]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r1]
	adds r0, r4, 0
	bl Task_ClosePartyMenu
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812437C: .4byte gSpecialVar_0x8004
_08124380: .4byte gPartyMenu
	thumb_func_end CursorCB_Store

	thumb_func_start CursorCB_Register
CursorCB_Register: @ 8124384
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08124410 @ =gPartyMenu
	mov r9, r0
	ldrb r0, [r0, 0x9]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r4, _08124414 @ =gPlayerParty
	adds r0, r4
	movs r1, 0x41
	bl GetMonData
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	mov r1, r9
	movs r0, 0x9
	ldrsb r0, [r1, r0]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r4
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r1, r9
	movs r0, 0x9
	ldrsb r0, [r1, r0]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r4
	movs r1, 0x50
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80F9800
	ldr r0, [r0]
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl Trade_CanTradeSelectedMon
	cmp r0, 0x1
	beq _08124418
	cmp r0, 0x2
	beq _0812442C
	movs r0, 0x5
	bl PlaySE
	adds r0, r7, 0
	bl Task_ClosePartyMenu
	b _0812446C
	.align 2, 0
_08124410: .4byte gPartyMenu
_08124414: .4byte gPlayerParty
_08124418:
	ldr r0, _08124424 @ =gStringVar4
	ldr r1, _08124428 @ =gText_PkmnCantBeTradedNow
	bl StringExpandPlaceholders
	b _08124434
	.align 2, 0
_08124424: .4byte gStringVar4
_08124428: .4byte gText_PkmnCantBeTradedNow
_0812442C:
	ldr r0, _08124478 @ =gStringVar4
	ldr r1, _0812447C @ =gText_EggCantBeTradedNow
	bl StringExpandPlaceholders
_08124434:
	movs r0, 0x1A
	bl PlaySE
	ldr r4, _08124480 @ =sPartyMenuInternal
	ldr r0, [r4]
	adds r0, 0xC
	bl PartyMenuRemoveWindow
	ldr r0, [r4]
	adds r0, 0xD
	bl PartyMenuRemoveWindow
	ldr r4, _08124478 @ =gStringVar4
	ldr r1, _08124484 @ =gText_PauseUntilPress
	adds r0, r4, 0
	bl StringAppend
	adds r0, r4, 0
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	ldr r1, _08124488 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _0812448C @ =Task_ReturnToChooseMonAfterText
	str r1, [r0]
_0812446C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124478: .4byte gStringVar4
_0812447C: .4byte gText_EggCantBeTradedNow
_08124480: .4byte sPartyMenuInternal
_08124484: .4byte gText_PauseUntilPress
_08124488: .4byte gTasks
_0812448C: .4byte Task_ReturnToChooseMonAfterText
	thumb_func_end CursorCB_Register

	thumb_func_start CursorCB_Trade1
CursorCB_Trade1: @ 8124490
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08124558 @ =gPartyMenu
	mov r8, r0
	ldrb r0, [r0, 0x9]
	lsls r0, 24
	asrs r0, 24
	movs r6, 0x64
	muls r0, r6
	ldr r4, _0812455C @ =gPlayerParty
	adds r0, r4
	movs r1, 0x41
	bl GetMonData
	mov r9, r0
	mov r1, r9
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	mov r1, r8
	movs r0, 0x9
	ldrsb r0, [r1, r0]
	muls r0, r6
	adds r0, r4
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r1, r8
	movs r0, 0x9
	ldrsb r0, [r1, r0]
	muls r0, r6
	adds r0, r4
	movs r1, 0x50
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80F9800
	ldr r0, [r0]
	ldr r1, _08124560 @ =gUnknown_203B064
	ldr r1, [r1]
	ldr r2, _08124564 @ =gUnionRoomOfferedSpecies
	ldrh r3, [r2]
	ldr r2, _08124568 @ =gUnionRoomRequestedMonType
	ldrb r2, [r2]
	str r2, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	mov r2, r9
	bl GetUnionRoomTradeMessageId
	cmp r0, 0
	beq _08124584
	ldr r5, _0812456C @ =gStringVar4
	ldr r1, _08124570 @ =sUnionRoomTradeMessages
	subs r0, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0x1A
	bl PlaySE
	ldr r4, _08124574 @ =sPartyMenuInternal
	ldr r0, [r4]
	adds r0, 0xC
	bl PartyMenuRemoveWindow
	ldr r0, [r4]
	adds r0, 0xD
	bl PartyMenuRemoveWindow
	ldr r1, _08124578 @ =gText_PauseUntilPress
	adds r0, r5, 0
	bl StringAppend
	adds r0, r5, 0
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	ldr r1, _0812457C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _08124580 @ =Task_ReturnToChooseMonAfterText
	str r1, [r0]
	b _08124590
	.align 2, 0
_08124558: .4byte gPartyMenu
_0812455C: .4byte gPlayerParty
_08124560: .4byte gUnknown_203B064
_08124564: .4byte gUnionRoomOfferedSpecies
_08124568: .4byte gUnionRoomRequestedMonType
_0812456C: .4byte gStringVar4
_08124570: .4byte sUnionRoomTradeMessages
_08124574: .4byte sPartyMenuInternal
_08124578: .4byte gText_PauseUntilPress
_0812457C: .4byte gTasks
_08124580: .4byte Task_ReturnToChooseMonAfterText
_08124584:
	movs r0, 0x5
	bl PlaySE
	adds r0, r7, 0
	bl Task_ClosePartyMenu
_08124590:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end CursorCB_Trade1

	thumb_func_start CursorCB_Trade2
CursorCB_Trade2: @ 81245A0
	bx lr
	thumb_func_end CursorCB_Trade2

	thumb_func_start CursorCB_FieldMove
CursorCB_FieldMove: @ 81245A4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	bl Menu_GetCursorPos
	ldr r5, _08124610 @ =sPartyMenuInternal
	ldr r1, [r5]
	lsls r0, 24
	lsrs r0, 24
	adds r1, 0xF
	adds r1, r0
	ldrb r0, [r1]
	subs r0, 0x12
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08124614 @ =sFieldMoveCursorCallbacks
	lsls r0, r4, 3
	adds r7, r0, r1
	ldr r0, [r7]
	cmp r0, 0
	bne _081245D6
	b _081247B4
_081245D6:
	ldr r0, [r5]
	adds r0, 0xC
	bl PartyMenuRemoveWindow
	ldr r0, [r5]
	adds r0, 0xD
	bl PartyMenuRemoveWindow
	bl MenuHelpers_LinkSomething
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081245FA
	bl InUnionRoom
	cmp r0, 0x1
	bne _0812461C
_081245FA:
	adds r0, r4, 0
	subs r0, 0x9
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08124618
	movs r0, 0xD
	bl DisplayPartyMenuStdMessage
	b _081247A6
	.align 2, 0
_08124610: .4byte sPartyMenuInternal
_08124614: .4byte sFieldMoveCursorCallbacks
_08124618:
	ldrb r0, [r7, 0x4]
	b _081247A2
_0812461C:
	cmp r4, 0x6
	bhi _08124658
	movs r1, 0x82
	lsls r1, 4
	adds r0, r4, r1
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08124658
	ldr r0, _0812464C @ =gText_CantUseUntilNewBadge
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	ldr r1, _08124650 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08124654 @ =Task_ReturnToChooseMonAfterText
	str r1, [r0]
	b _081247B4
	.align 2, 0
_0812464C: .4byte gText_CantUseUntilNewBadge
_08124650: .4byte gTasks
_08124654: .4byte Task_ReturnToChooseMonAfterText
_08124658:
	ldr r1, _08124680 @ =sFieldMoveCursorCallbacks
	lsls r0, r4, 3
	adds r5, r0, r1
	ldr r0, [r5]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0812466E
	b _0812478C
_0812466E:
	subs r0, r4, 0x2
	cmp r0, 0x8
	bhi _0812475C
	lsls r0, 2
	ldr r1, _08124684 @ =_08124688
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08124680: .4byte sFieldMoveCursorCallbacks
_08124684: .4byte _08124688
	.align 2, 0
_08124688:
	.4byte _0812474C
	.4byte _0812475C
	.4byte _0812475C
	.4byte _0812475C
	.4byte _0812475C
	.4byte _081246B4
	.4byte _081246F0
	.4byte _081246AC
	.4byte _081246AC
_081246AC:
	adds r0, r6, 0
	bl ChooseMonForSoftboiled
	b _081247B4
_081246B4:
	ldr r0, _081246E0 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r0, 0x1C
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x1D]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl Overworld_GetMapHeaderByGroupAndId
	adds r1, r0, 0
	ldr r0, _081246E4 @ =gStringVar1
	ldrb r1, [r1, 0x14]
	bl GetMapNameGeneric
	ldr r0, _081246E8 @ =gStringVar4
	ldr r1, _081246EC @ =gUnknown_8417640
	b _08124720
	.align 2, 0
_081246E0: .4byte gSaveBlock1Ptr
_081246E4: .4byte gStringVar1
_081246E8: .4byte gStringVar4
_081246EC: .4byte gUnknown_8417640
_081246F0:
	ldr r0, _08124738 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x24
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 16
	lsrs r0, 16
	adds r1, 0x25
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl Overworld_GetMapHeaderByGroupAndId
	adds r1, r0, 0
	ldr r0, _0812473C @ =gStringVar1
	ldrb r1, [r1, 0x14]
	bl GetMapNameGeneric
	ldr r0, _08124740 @ =gStringVar4
	ldr r1, _08124744 @ =gUnknown_8417615
_08124720:
	bl StringExpandPlaceholders
	adds r0, r6, 0
	bl DisplayFieldMoveExitAreaMessage
	ldr r0, _08124748 @ =sPartyMenuInternal
	ldr r0, [r0]
	movs r1, 0x86
	lsls r1, 2
	adds r0, r1
	strh r4, [r0]
	b _081247B4
	.align 2, 0
_08124738: .4byte gSaveBlock1Ptr
_0812473C: .4byte gStringVar1
_08124740: .4byte gStringVar4
_08124744: .4byte gUnknown_8417615
_08124748: .4byte sPartyMenuInternal
_0812474C:
	ldr r1, _08124754 @ =gPartyMenu
	ldr r0, _08124758 @ =sub_80C4EF8
	str r0, [r1]
	b _08124778
	.align 2, 0
_08124754: .4byte gPartyMenu
_08124758: .4byte sub_80C4EF8
_0812475C:
	ldr r1, _08124780 @ =gPartyMenu
	ldr r0, _08124784 @ =CB2_ReturnToField
	str r0, [r1]
	bl GetCursorSelectionMonId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _08124788 @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	bl sub_8124BB0
_08124778:
	adds r0, r6, 0
	bl Task_ClosePartyMenu
	b _081247B4
	.align 2, 0
_08124780: .4byte gPartyMenu
_08124784: .4byte CB2_ReturnToField
_08124788: .4byte gPlayerParty
_0812478C:
	cmp r4, 0
	beq _0812479A
	cmp r4, 0x4
	bne _081247A0
	bl DisplayCantUseSurfMessage
	b _081247A6
_0812479A:
	bl DisplayCantUseFlashMessage
	b _081247A6
_081247A0:
	ldrb r0, [r5, 0x4]
_081247A2:
	bl DisplayPartyMenuStdMessage
_081247A6:
	ldr r0, _081247BC @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _081247C0 @ =Task_CancelAfterAorBPress
	str r0, [r1]
_081247B4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081247BC: .4byte gTasks
_081247C0: .4byte Task_CancelAfterAorBPress
	thumb_func_end CursorCB_FieldMove

	thumb_func_start DisplayFieldMoveExitAreaMessage
DisplayFieldMoveExitAreaMessage: @ 81247C4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _081247E8 @ =gStringVar4
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	ldr r1, _081247EC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081247F0 @ =Task_FieldMoveExitAreaYesNo
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081247E8: .4byte gStringVar4
_081247EC: .4byte gTasks
_081247F0: .4byte Task_FieldMoveExitAreaYesNo
	thumb_func_end DisplayFieldMoveExitAreaMessage

	thumb_func_start Task_FieldMoveExitAreaYesNo
Task_FieldMoveExitAreaYesNo: @ 81247F4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08124818
	bl PartyMenuDisplayYesNoMenu
	ldr r0, _08124820 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08124824 @ =Task_HandleFieldMoveExitAreaYesNoInput
	str r0, [r1]
_08124818:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08124820: .4byte gTasks
_08124824: .4byte Task_HandleFieldMoveExitAreaYesNoInput
	thumb_func_end Task_FieldMoveExitAreaYesNo

	thumb_func_start Task_HandleFieldMoveExitAreaYesNoInput
Task_HandleFieldMoveExitAreaYesNoInput: @ 8124828
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0812484E
	cmp r1, 0
	bgt _08124848
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0812488C
	b _081248A2
_08124848:
	cmp r1, 0x1
	beq _08124892
	b _081248A2
_0812484E:
	ldr r1, _0812487C @ =gPartyMenu
	ldr r0, _08124880 @ =CB2_ReturnToField
	str r0, [r1]
	bl GetCursorSelectionMonId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _08124884 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08124888 @ =sPartyMenuInternal
	ldr r1, [r1]
	movs r2, 0x86
	lsls r2, 2
	adds r1, r2
	ldrb r1, [r1]
	bl sub_8124BB0
	adds r0, r4, 0
	bl Task_ClosePartyMenu
	b _081248A2
	.align 2, 0
_0812487C: .4byte gPartyMenu
_08124880: .4byte CB2_ReturnToField
_08124884: .4byte gPlayerParty
_08124888: .4byte sPartyMenuInternal
_0812488C:
	movs r0, 0x5
	bl PlaySE
_08124892:
	ldr r0, _081248A8 @ =gFieldCallback2
	movs r1, 0
	str r1, [r0]
	ldr r0, _081248AC @ =gPostMenuFieldCallback
	str r1, [r0]
	adds r0, r4, 0
	bl Task_ReturnToChooseMonAfterText
_081248A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081248A8: .4byte gFieldCallback2
_081248AC: .4byte gPostMenuFieldCallback
	thumb_func_end Task_HandleFieldMoveExitAreaYesNoInput

	thumb_func_start FieldCallback_PrepareFadeInFromMenu
FieldCallback_PrepareFadeInFromMenu: @ 81248B0
	push {lr}
	bl sub_807DC00
	ldr r0, _081248C4 @ =Task_FieldMoveWaitForFade
	movs r1, 0x8
	bl CreateTask
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_081248C4: .4byte Task_FieldMoveWaitForFade
	thumb_func_end FieldCallback_PrepareFadeInFromMenu

	thumb_func_start Task_FieldMoveWaitForFade
Task_FieldMoveWaitForFade: @ 81248C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsWeatherNotFadingIn
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081248F4
	bl GetFieldMoveMonSpecies
	ldr r1, _081248FC @ =gFieldEffectArguments
	lsls r0, 16
	lsrs r0, 16
	str r0, [r1]
	ldr r0, _08124900 @ =gPostMenuFieldCallback
	ldr r0, [r0]
	bl _call_via_r0
	adds r0, r4, 0
	bl DestroyTask
_081248F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081248FC: .4byte gFieldEffectArguments
_08124900: .4byte gPostMenuFieldCallback
	thumb_func_end Task_FieldMoveWaitForFade

	thumb_func_start GetFieldMoveMonSpecies
GetFieldMoveMonSpecies: @ 8124904
	push {lr}
	ldr r0, _08124924 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08124928 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08124924: .4byte gPartyMenu
_08124928: .4byte gPlayerParty
	thumb_func_end GetFieldMoveMonSpecies

	thumb_func_start Task_CancelAfterAorBPress
Task_CancelAfterAorBPress: @ 812492C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08124950 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08124946
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0812494C
_08124946:
	adds r0, r2, 0
	bl CursorCB_Cancel1
_0812494C:
	pop {r0}
	bx r0
	.align 2, 0
_08124950: .4byte gMain
	thumb_func_end Task_CancelAfterAorBPress

	thumb_func_start DisplayCantUseFlashMessage
DisplayCantUseFlashMessage: @ 8124954
	push {lr}
	ldr r0, _0812496C @ =0x00000806
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08124970
	movs r0, 0xC
	bl DisplayPartyMenuStdMessage
	b _08124976
	.align 2, 0
_0812496C: .4byte 0x00000806
_08124970:
	movs r0, 0xD
	bl DisplayPartyMenuStdMessage
_08124976:
	pop {r0}
	bx r0
	thumb_func_end DisplayCantUseFlashMessage

	thumb_func_start FieldCallback_Surf
FieldCallback_Surf: @ 812497C
	push {lr}
	bl GetCursorSelectionMonId
	ldr r1, _08124994 @ =gFieldEffectArguments
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1]
	movs r0, 0x9
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08124994: .4byte gFieldEffectArguments
	thumb_func_end FieldCallback_Surf

	thumb_func_start SetUpFieldMove_Surf
SetUpFieldMove_Surf: @ 8124998
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSemiDeepWater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08124A00
	bl PartyHasMonWithSurf
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08124A00
	bl IsPlayerFacingSurfableFishableWater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08124A00
	ldr r1, _081249F0 @ =gFieldCallback2
	ldr r0, _081249F4 @ =FieldCallback_PrepareFadeInFromMenu
	str r0, [r1]
	ldr r1, _081249F8 @ =gPostMenuFieldCallback
	ldr r0, _081249FC @ =FieldCallback_Surf
	str r0, [r1]
	movs r0, 0x1
	b _08124A02
	.align 2, 0
_081249F0: .4byte gFieldCallback2
_081249F4: .4byte FieldCallback_PrepareFadeInFromMenu
_081249F8: .4byte gPostMenuFieldCallback
_081249FC: .4byte FieldCallback_Surf
_08124A00:
	movs r0, 0
_08124A02:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end SetUpFieldMove_Surf

	thumb_func_start DisplayCantUseSurfMessage
DisplayCantUseSurfMessage: @ 8124A0C
	push {r4,lr}
	sub sp, 0x4
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08124A24
	movs r0, 0x9
	bl DisplayPartyMenuStdMessage
	b _08124A82
_08124A24:
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSemiDeepWater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08124A56
	movs r0, 0xA
	bl DisplayPartyMenuStdMessage
	b _08124A82
_08124A56:
	ldr r0, _08124A78 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	cmp r0, 0x3
	bne _08124A7C
	ldrb r0, [r1, 0x5]
	subs r0, 0x23
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08124A7C
	movs r0, 0xB
	bl DisplayPartyMenuStdMessage
	b _08124A82
	.align 2, 0
_08124A78: .4byte gSaveBlock1Ptr
_08124A7C:
	movs r0, 0x8
	bl DisplayPartyMenuStdMessage
_08124A82:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DisplayCantUseSurfMessage

	thumb_func_start SetUpFieldMove_Fly
SetUpFieldMove_Fly: @ 8124A8C
	push {lr}
	ldr r0, _08124AA4 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	bl Overworld_MapTypeAllowsTeleportAndFly
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08124AA8
	movs r0, 0
	b _08124AAA
	.align 2, 0
_08124AA4: .4byte gMapHeader
_08124AA8:
	movs r0, 0x1
_08124AAA:
	pop {r1}
	bx r1
	thumb_func_end SetUpFieldMove_Fly

	thumb_func_start CB2_ReturnToPartyMenuFromFlyMap
CB2_ReturnToPartyMenuFromFlyMap: @ 8124AB0
	push {lr}
	sub sp, 0xC
	movs r0, 0
	str r0, [sp]
	ldr r0, _08124AD4 @ =Task_HandleChooseMonInput
	str r0, [sp, 0x4]
	ldr r0, _08124AD8 @ =CB2_ReturnToStartMenu
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x1
	bl InitPartyMenu
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08124AD4: .4byte Task_HandleChooseMonInput
_08124AD8: .4byte CB2_ReturnToStartMenu
	thumb_func_end CB2_ReturnToPartyMenuFromFlyMap

	thumb_func_start FieldCallback_Waterfall
FieldCallback_Waterfall: @ 8124ADC
	push {lr}
	bl GetCursorSelectionMonId
	ldr r1, _08124AF4 @ =gFieldEffectArguments
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1]
	movs r0, 0x2B
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08124AF4: .4byte gFieldEffectArguments
	thumb_func_end FieldCallback_Waterfall

	thumb_func_start SetUpFieldMove_Waterfall
SetUpFieldMove_Waterfall: @ 8124AF8
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08124B54
	bl IsPlayerSurfingNorth
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08124B54
	ldr r1, _08124B44 @ =gFieldCallback2
	ldr r0, _08124B48 @ =FieldCallback_PrepareFadeInFromMenu
	str r0, [r1]
	ldr r1, _08124B4C @ =gPostMenuFieldCallback
	ldr r0, _08124B50 @ =FieldCallback_Waterfall
	str r0, [r1]
	movs r0, 0x1
	b _08124B56
	.align 2, 0
_08124B44: .4byte gFieldCallback2
_08124B48: .4byte FieldCallback_PrepareFadeInFromMenu
_08124B4C: .4byte gPostMenuFieldCallback
_08124B50: .4byte FieldCallback_Waterfall
_08124B54:
	movs r0, 0
_08124B56:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end SetUpFieldMove_Waterfall

	thumb_func_start sub_8124B60
sub_8124B60: @ 8124B60
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	movs r0, 0x8
	bl Alloc
	adds r7, r0, 0
	adds r0, r6, 0
	movs r1, 0x41
	bl GetMonData
	strh r0, [r7, 0x4]
	strh r4, [r7]
	strh r5, [r7, 0x2]
	ldr r0, _08124B98 @ =gPartyMenu
	ldrb r0, [r0, 0xB]
	cmp r0, 0x6
	bne _08124B9C
	movs r0, 0xA
	adds r1, r7, 0
	bl sub_8113550
	b _08124BA4
	.align 2, 0
_08124B98: .4byte gPartyMenu
_08124B9C:
	movs r0, 0x9
	adds r1, r7, 0
	bl sub_8113550
_08124BA4:
	adds r0, r7, 0
	bl Free
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8124B60

	thumb_func_start sub_8124BB0
sub_8124BB0: @ 8124BB0
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	movs r0, 0x4
	bl Alloc
	adds r6, r0, 0
	adds r0, r5, 0
	movs r1, 0x41
	bl GetMonData
	strh r0, [r6]
	strb r4, [r6, 0x2]
	ldrb r0, [r6, 0x2]
	cmp r0, 0x7
	beq _08124BDA
	cmp r0, 0x8
	beq _08124BFC
	movs r0, 0xFF
	b _08124C00
_08124BDA:
	ldr r0, _08124BF8 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r0, 0x1C
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x1D]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl Overworld_GetMapHeaderByGroupAndId
	b _08124BFE
	.align 2, 0
_08124BF8: .4byte gSaveBlock1Ptr
_08124BFC:
	ldr r0, _08124C18 @ =gMapHeader
_08124BFE:
	ldrb r0, [r0, 0x14]
_08124C00:
	strb r0, [r6, 0x3]
	movs r0, 0x24
	adds r1, r6, 0
	bl sub_8113550
	adds r0, r6, 0
	bl Free
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08124C18: .4byte gMapHeader
	thumb_func_end sub_8124BB0

	thumb_func_start sub_8124C1C
sub_8124C1C: @ 8124C1C
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r0, 0x8
	bl Alloc
	adds r4, r0, 0
	ldrb r0, [r5]
	strb r0, [r4]
	ldrb r0, [r5, 0x1]
	strb r0, [r4, 0x1]
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	lsls r1, 16
	lsrs r1, 16
	bl Overworld_GetMapHeaderByGroupAndId
	adds r5, r0, 0
	adds r0, r4, 0
	bl Free
	movs r0, 0x4
	bl Alloc
	adds r4, r0, 0
	bl GetCursorSelectionMonId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _08124C88 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x41
	bl GetMonData
	strh r0, [r4]
	movs r0, 0x2
	strb r0, [r4, 0x2]
	ldrb r0, [r5, 0x14]
	strb r0, [r4, 0x3]
	movs r0, 0x24
	adds r1, r4, 0
	bl sub_8113550
	adds r0, r4, 0
	bl Free
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08124C88: .4byte gPlayerParty
	thumb_func_end sub_8124C1C

	thumb_func_start CB2_ShowPartyMenuForItemUse
CB2_ShowPartyMenuForItemUse: @ 8124C8C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	ldr r6, _08124CB4 @ =CB2_ReturnToBagMenu
	ldr r0, _08124CB8 @ =gMain
	ldr r1, _08124CBC @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08124CCC
	movs r0, 0x1
	mov r8, r0
	bl GetPartyLayoutFromBattleType
	lsls r0, 24
	lsrs r7, r0, 24
	b _08124CD2
	.align 2, 0
_08124CB4: .4byte CB2_ReturnToBagMenu
_08124CB8: .4byte gMain
_08124CBC: .4byte 0x00000439
_08124CC0:
	ldr r0, _08124CC8 @ =gPartyMenu
	strb r5, [r0, 0x9]
	b _08124D16
	.align 2, 0
_08124CC8: .4byte gPartyMenu
_08124CCC:
	movs r1, 0
	mov r8, r1
	movs r7, 0
_08124CD2:
	ldr r4, _08124D30 @ =gSpecialVar_ItemId
	ldrh r0, [r4]
	bl GetItemEffectType
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA
	bne _08124D44
	ldr r1, _08124D34 @ =gPartyMenu
	movs r0, 0
	strb r0, [r1, 0x9]
	movs r5, 0
_08124CEA:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08124D38 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08124D0C
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08124CC0
_08124D0C:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08124CEA
_08124D16:
	ldr r0, _08124D30 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	bl GetPocketByItemId
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _08124D28
	ldr r6, _08124D3C @ =sub_8124DB0
_08124D28:
	ldr r1, _08124D40 @ =Task_SetSacredAshCB
	movs r0, 0x7F
	b _08124D6A
	.align 2, 0
_08124D30: .4byte gSpecialVar_ItemId
_08124D34: .4byte gPartyMenu
_08124D38: .4byte gPlayerParty
_08124D3C: .4byte sub_8124DB0
_08124D40: .4byte Task_SetSacredAshCB
_08124D44:
	ldrh r0, [r4]
	bl GetPocketByItemId
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _08124D5A
	cmp r0, 0x5
	beq _08124D64
	movs r0, 0x5
	b _08124D68
_08124D5A:
	movs r0, 0x4
	ldr r6, _08124D60 @ =sub_8124DA0
	b _08124D68
	.align 2, 0
_08124D60: .4byte sub_8124DA0
_08124D64:
	movs r0, 0x5
	ldr r6, _08124D88 @ =sub_8124DB0
_08124D68:
	ldr r1, _08124D8C @ =Task_HandleChooseMonInput
_08124D6A:
	str r0, [sp]
	str r1, [sp, 0x4]
	str r6, [sp, 0x8]
	mov r0, r8
	adds r1, r7, 0
	movs r2, 0x3
	movs r3, 0x1
	bl InitPartyMenu
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124D88: .4byte sub_8124DB0
_08124D8C: .4byte Task_HandleChooseMonInput
	thumb_func_end CB2_ShowPartyMenuForItemUse

	thumb_func_start CB2_ReturnToBagMenu
CB2_ReturnToBagMenu: @ 8124D90
	push {lr}
	movs r0, 0xB
	movs r1, 0x3
	movs r2, 0
	bl GoToBagMenu
	pop {r0}
	bx r0
	thumb_func_end CB2_ReturnToBagMenu

	thumb_func_start sub_8124DA0
sub_8124DA0: @ 8124DA0
	push {lr}
	movs r0, 0x5
	movs r1, 0
	movs r2, 0xFF
	bl InitTMCase
	pop {r0}
	bx r0
	thumb_func_end sub_8124DA0

	thumb_func_start sub_8124DB0
sub_8124DB0: @ 8124DB0
	push {lr}
	movs r0, 0x6
	movs r1, 0
	movs r2, 0xFF
	bl InitBerryPouch
	pop {r0}
	bx r0
	thumb_func_end sub_8124DB0

	thumb_func_start sub_8124DC0
sub_8124DC0: @ 8124DC0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08124DD8 @ =sPartyMenuInternal
	ldr r2, [r1]
	ldr r1, _08124DDC @ =sub_8124DE0
	str r1, [r2, 0x4]
	bl Task_ClosePartyMenu
	pop {r0}
	bx r0
	.align 2, 0
_08124DD8: .4byte sPartyMenuInternal
_08124DDC: .4byte sub_8124DE0
	thumb_func_end sub_8124DC0

	thumb_func_start sub_8124DE0
sub_8124DE0: @ 8124DE0
	push {r4,lr}
	ldr r4, _08124E0C @ =gSpecialVar_ItemId
	ldrh r0, [r4]
	bl CheckIfItemIsTMHMOrEvolutionStone
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08124E2C
	bl sub_8126C24
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08124E18
	ldr r0, _08124E10 @ =gPartyMenu
	ldrb r0, [r0, 0x9]
	ldrh r1, [r4]
	ldr r2, _08124E14 @ =ItemUseCB_EvolutionStone
	bl sub_811C540
	b _08124E38
	.align 2, 0
_08124E0C: .4byte gSpecialVar_ItemId
_08124E10: .4byte gPartyMenu
_08124E14: .4byte ItemUseCB_EvolutionStone
_08124E18:
	ldr r2, _08124E28 @ =gPartyMenu
	ldrb r0, [r2, 0x9]
	ldrh r1, [r4]
	ldr r2, [r2]
	bl sub_811C5AC
	b _08124E38
	.align 2, 0
_08124E28: .4byte gPartyMenu
_08124E2C:
	ldr r0, _08124E40 @ =gPartyMenu
	ldrb r0, [r0, 0x9]
	ldrh r1, [r4]
	ldr r2, _08124E44 @ =sub_8124E48
	bl sub_811C540
_08124E38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08124E40: .4byte gPartyMenu
_08124E44: .4byte sub_8124E48
	thumb_func_end sub_8124DE0

	thumb_func_start sub_8124E48
sub_8124E48: @ 8124E48
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	ldr r7, _08124EBC @ =gSpecialVar_ItemId
	ldrh r0, [r7]
	bl ItemId_GetPocket
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _08124EC8
	bl sub_811D178
	cmp r0, 0x1
	bne _08124EC8
	ldr r0, _08124EC0 @ =gPartyMenu
	mov r8, r0
	ldrb r0, [r0, 0x9]
	lsls r0, 24
	asrs r0, 24
	movs r6, 0x64
	adds r4, r0, 0
	muls r4, r6
	ldr r5, _08124EC4 @ =gPlayerParty
	adds r4, r5
	ldrh r0, [r7]
	bl ItemIdToBattleMoveId
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl GiveMoveToMon
	mov r1, r8
	movs r0, 0x9
	ldrsb r0, [r1, r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0x4
	bl AdjustFriendship
	ldrh r1, [r7]
	movs r0, 0xA9
	lsls r0, 1
	cmp r1, r0
	bhi _08124EB0
	adds r0, r1, 0
	movs r1, 0x1
	bl RemoveBagItem
_08124EB0:
	mov r1, r8
	ldr r0, [r1]
	bl SetMainCallback2
	b _08124EE6
	.align 2, 0
_08124EBC: .4byte gSpecialVar_ItemId
_08124EC0: .4byte gPartyMenu
_08124EC4: .4byte gPlayerParty
_08124EC8:
	ldr r2, _08124EF4 @ =gPartyMenu
	ldrb r0, [r2, 0x8]
	lsls r0, 28
	lsrs r0, 28
	ldrb r3, [r2, 0x9]
	movs r1, 0x7F
	str r1, [sp]
	ldr r1, _08124EF8 @ =Task_SetSacredAshCB
	str r1, [sp, 0x4]
	ldr r1, [r2]
	str r1, [sp, 0x8]
	movs r1, 0xFF
	movs r2, 0
	bl InitPartyMenu
_08124EE6:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124EF4: .4byte gPartyMenu
_08124EF8: .4byte Task_SetSacredAshCB
	thumb_func_end sub_8124E48

	thumb_func_start sub_8124EFC
sub_8124EFC: @ 8124EFC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	bl sub_811D178
	cmp r0, 0x1
	bne _08124F94
	ldr r0, _08124F88 @ =gPartyMenu
	mov r8, r0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	adds r5, r1, 0
	muls r5, r0
	ldr r0, _08124F8C @ =gPlayerParty
	adds r5, r0
	bl GetMoveSlotToReplace
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r5, 0
	bl GetMonData
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl RemoveMonPPBonus
	ldr r7, _08124F90 @ =gSpecialVar_ItemId
	ldrh r0, [r7]
	bl ItemIdToBattleMoveId
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	adds r2, r4, 0
	bl SetMonMoveSlot
	adds r0, r5, 0
	movs r1, 0x4
	bl AdjustFriendship
	ldrh r2, [r7]
	movs r0, 0x4
	adds r1, r5, 0
	adds r3, r6, 0
	bl ItemUse_SetQuestLogEvent
	ldrh r1, [r7]
	movs r0, 0xA9
	lsls r0, 1
	cmp r1, r0
	bhi _08124F7C
	adds r0, r1, 0
	movs r1, 0x1
	bl RemoveBagItem
_08124F7C:
	mov r1, r8
	ldr r0, [r1]
	bl SetMainCallback2
	b _08124FB2
	.align 2, 0
_08124F88: .4byte gPartyMenu
_08124F8C: .4byte gPlayerParty
_08124F90: .4byte gSpecialVar_ItemId
_08124F94:
	ldr r4, _08124FC0 @ =gPartyMenu
	ldrb r0, [r4, 0x8]
	lsls r0, 28
	lsrs r0, 28
	ldrb r2, [r4, 0xB]
	ldrb r3, [r4, 0x9]
	movs r1, 0x7F
	str r1, [sp]
	ldr r1, _08124FC4 @ =Task_SetSacredAshCB
	str r1, [sp, 0x4]
	ldr r1, [r4]
	str r1, [sp, 0x8]
	movs r1, 0xFF
	bl InitPartyMenu
_08124FB2:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124FC0: .4byte gPartyMenu
_08124FC4: .4byte Task_SetSacredAshCB
	thumb_func_end sub_8124EFC

	thumb_func_start Task_SetSacredAshCB
Task_SetSacredAshCB: @ 8124FC8
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _08125000 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08124FFA
	ldr r0, _08125004 @ =gPartyMenu
	ldrb r1, [r0, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	bne _08124FEE
	ldr r0, _08125008 @ =sPartyMenuInternal
	ldr r1, [r0]
	ldr r0, _0812500C @ =CB2_SetUpExitToBattleScreen
	str r0, [r1, 0x4]
_08124FEE:
	ldr r0, _08125010 @ =gItemUseCB
	ldr r1, _08125014 @ =Task_ClosePartyMenuAfterText
	ldr r2, [r0]
	adds r0, r3, 0
	bl _call_via_r2
_08124FFA:
	pop {r0}
	bx r0
	.align 2, 0
_08125000: .4byte gPaletteFade
_08125004: .4byte gPartyMenu
_08125008: .4byte sPartyMenuInternal
_0812500C: .4byte CB2_SetUpExitToBattleScreen
_08125010: .4byte gItemUseCB
_08125014: .4byte Task_ClosePartyMenuAfterText
	thumb_func_end Task_SetSacredAshCB

	thumb_func_start IsHPRecoveryItem
IsHPRecoveryItem: @ 8125018
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _08125034
	ldr r0, _0812502C @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _08125030 @ =0x00003108
	adds r0, r1
	b _0812503E
	.align 2, 0
_0812502C: .4byte gSaveBlock1Ptr
_08125030: .4byte 0x00003108
_08125034:
	ldr r1, _0812504C @ =gItemEffectTable
	subs r0, 0xD
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
_0812503E:
	ldrb r1, [r0, 0x4]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _08125050
	movs r0, 0
	b _08125052
	.align 2, 0
_0812504C: .4byte gItemEffectTable
_08125050:
	movs r0, 0x1
_08125052:
	pop {r1}
	bx r1
	thumb_func_end IsHPRecoveryItem

	thumb_func_start GetMedicineItemEffectMessage
GetMedicineItemEffectMessage: @ 8125058
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl GetItemEffectType
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x3
	cmp r0, 0x12
	bls _0812506E
	b _08125204
_0812506E:
	lsls r0, 2
	ldr r1, _08125078 @ =_0812507C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08125078: .4byte _0812507C
	.align 2, 0
_0812507C:
	.4byte _081250C8
	.4byte _081250DC
	.4byte _081250F0
	.4byte _08125104
	.4byte _08125118
	.4byte _0812512C
	.4byte _08125140
	.4byte _08125204
	.4byte _08125154
	.4byte _08125178
	.4byte _08125168
	.4byte _081251A8
	.4byte _081251B8
	.4byte _08125198
	.4byte _08125188
	.4byte _08125204
	.4byte _081251DC
	.4byte _081251DC
	.4byte _081251F0
_081250C8:
	ldr r0, _081250D4 @ =gStringVar4
	ldr r1, _081250D8 @ =gText_PkmnCuredOfPoison
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_081250D4: .4byte gStringVar4
_081250D8: .4byte gText_PkmnCuredOfPoison
_081250DC:
	ldr r0, _081250E8 @ =gStringVar4
	ldr r1, _081250EC @ =gText_PkmnWokeUp2
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_081250E8: .4byte gStringVar4
_081250EC: .4byte gText_PkmnWokeUp2
_081250F0:
	ldr r0, _081250FC @ =gStringVar4
	ldr r1, _08125100 @ =gText_PkmnBurnHealed
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_081250FC: .4byte gStringVar4
_08125100: .4byte gText_PkmnBurnHealed
_08125104:
	ldr r0, _08125110 @ =gStringVar4
	ldr r1, _08125114 @ =gText_PkmnThawedOut
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_08125110: .4byte gStringVar4
_08125114: .4byte gText_PkmnThawedOut
_08125118:
	ldr r0, _08125124 @ =gStringVar4
	ldr r1, _08125128 @ =gText_PkmnCuredOfParalysis
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_08125124: .4byte gStringVar4
_08125128: .4byte gText_PkmnCuredOfParalysis
_0812512C:
	ldr r0, _08125138 @ =gStringVar4
	ldr r1, _0812513C @ =gText_PkmnSnappedOutOfConfusion
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_08125138: .4byte gStringVar4
_0812513C: .4byte gText_PkmnSnappedOutOfConfusion
_08125140:
	ldr r0, _0812514C @ =gStringVar4
	ldr r1, _08125150 @ =gText_PkmnGotOverInfatuation
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_0812514C: .4byte gStringVar4
_08125150: .4byte gText_PkmnGotOverInfatuation
_08125154:
	ldr r0, _08125160 @ =gStringVar4
	ldr r1, _08125164 @ =gText_PkmnBecameHealthy
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_08125160: .4byte gStringVar4
_08125164: .4byte gText_PkmnBecameHealthy
_08125168:
	ldr r0, _08125170 @ =gStringVar2
	ldr r1, _08125174 @ =gText_HP3
	b _081251BC
	.align 2, 0
_08125170: .4byte gStringVar2
_08125174: .4byte gText_HP3
_08125178:
	ldr r0, _08125180 @ =gStringVar2
	ldr r1, _08125184 @ =gText_Attack3
	b _081251BC
	.align 2, 0
_08125180: .4byte gStringVar2
_08125184: .4byte gText_Attack3
_08125188:
	ldr r0, _08125190 @ =gStringVar2
	ldr r1, _08125194 @ =gText_Defense3
	b _081251BC
	.align 2, 0
_08125190: .4byte gStringVar2
_08125194: .4byte gText_Defense3
_08125198:
	ldr r0, _081251A0 @ =gStringVar2
	ldr r1, _081251A4 @ =gText_Speed2
	b _081251BC
	.align 2, 0
_081251A0: .4byte gStringVar2
_081251A4: .4byte gText_Speed2
_081251A8:
	ldr r0, _081251B0 @ =gStringVar2
	ldr r1, _081251B4 @ =gText_SpAtk3
	b _081251BC
	.align 2, 0
_081251B0: .4byte gStringVar2
_081251B4: .4byte gText_SpAtk3
_081251B8:
	ldr r0, _081251CC @ =gStringVar2
	ldr r1, _081251D0 @ =gText_SpDef3
_081251BC:
	bl StringCopy
	ldr r0, _081251D4 @ =gStringVar4
	ldr r1, _081251D8 @ =gText_PkmnBaseVar2StatIncreased
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_081251CC: .4byte gStringVar2
_081251D0: .4byte gText_SpDef3
_081251D4: .4byte gStringVar4
_081251D8: .4byte gText_PkmnBaseVar2StatIncreased
_081251DC:
	ldr r0, _081251E8 @ =gStringVar4
	ldr r1, _081251EC @ =gText_MovesPPIncreased
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_081251E8: .4byte gStringVar4
_081251EC: .4byte gText_MovesPPIncreased
_081251F0:
	ldr r0, _081251FC @ =gStringVar4
	ldr r1, _08125200 @ =gText_PPWasRestored
	bl StringExpandPlaceholders
	b _0812520C
	.align 2, 0
_081251FC: .4byte gStringVar4
_08125200: .4byte gText_PPWasRestored
_08125204:
	ldr r0, _08125210 @ =gStringVar4
	ldr r1, _08125214 @ =gText_WontHaveEffect
	bl StringExpandPlaceholders
_0812520C:
	pop {r0}
	bx r0
	.align 2, 0
_08125210: .4byte gStringVar4
_08125214: .4byte gText_WontHaveEffect
	thumb_func_end GetMedicineItemEffectMessage

	thumb_func_start NotUsingHPEVItemOnShedinja
NotUsingHPEVItemOnShedinja: @ 8125218
	push {r4,lr}
	adds r4, r0, 0
	lsls r0, r1, 16
	lsrs r0, 16
	bl GetItemEffectType
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD
	bne _08125244
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	ldr r1, _08125240 @ =0x0000012f
	cmp r0, r1
	bne _08125244
	movs r0, 0
	b _08125246
	.align 2, 0
_08125240: .4byte 0x0000012f
_08125244:
	movs r0, 0x1
_08125246:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end NotUsingHPEVItemOnShedinja

	thumb_func_start IsItemFlute
IsItemFlute: @ 812524C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x27
	beq _0812525E
	cmp r0, 0x29
	beq _0812525E
	cmp r0, 0x28
	bne _08125262
_0812525E:
	movs r0, 0x1
	b _08125264
_08125262:
	movs r0, 0
_08125264:
	pop {r1}
	bx r1
	thumb_func_end IsItemFlute

	thumb_func_start ExecuteTableBasedItemEffect_
ExecuteTableBasedItemEffect_: @ 8125268
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r0, _08125294 @ =gMain
	ldr r1, _08125298 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _081252A0
	movs r0, 0x64
	muls r0, r3
	ldr r1, _0812529C @ =gPlayerParty
	adds r0, r1
	adds r1, r5, 0
	adds r2, r3, 0
	b _081252BA
	.align 2, 0
_08125294: .4byte gMain
_08125298: .4byte 0x00000439
_0812529C: .4byte gPlayerParty
_081252A0:
	movs r0, 0x64
	adds r4, r3, 0
	muls r4, r0
	ldr r0, _081252CC @ =gPlayerParty
	adds r4, r0
	adds r0, r3, 0
	bl GetPartyIdFromBattleSlot
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
_081252BA:
	adds r3, r6, 0
	bl ExecuteTableBasedItemEffect
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081252CC: .4byte gPlayerParty
	thumb_func_end ExecuteTableBasedItemEffect_

	thumb_func_start sub_81252D0
sub_81252D0: @ 81252D0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08125300 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08125304 @ =gPlayerParty
	adds r5, r1, r0
	ldr r0, _08125308 @ =gSpecialVar_ItemId
	ldrh r6, [r0]
	adds r0, r5, 0
	adds r1, r6, 0
	bl NotUsingHPEVItemOnShedinja
	lsls r0, 24
	cmp r0, 0
	bne _0812530C
	movs r4, 0x1
	b _08125342
	.align 2, 0
_08125300: .4byte gPartyMenu
_08125304: .4byte gPlayerParty
_08125308: .4byte gSpecialVar_ItemId
_0812530C:
	adds r0, r6, 0
	bl IsHPRecoveryItem
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08125330
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
_08125330:
	ldr r0, _08125370 @ =gPartyMenu
	ldrb r2, [r0, 0x9]
	adds r0, r5, 0
	adds r1, r6, 0
	movs r3, 0
	bl PokemonUseItemEffects2
	lsls r0, 24
	lsrs r4, r0, 24
_08125342:
	movs r0, 0x5
	bl PlaySE
	cmp r4, 0
	beq _08125380
	ldr r1, _08125374 @ =gPartyMenuUseExitCallback
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08125378 @ =gText_WontHaveEffect
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r1, _0812537C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	mov r1, r8
	str r1, [r0]
	b _08125398
	.align 2, 0
_08125370: .4byte gPartyMenu
_08125374: .4byte gPartyMenuUseExitCallback
_08125378: .4byte gText_WontHaveEffect
_0812537C: .4byte gTasks
_08125380:
	ldr r3, _081253A4 @ =0x0000ffff
	movs r0, 0x4
	adds r1, r5, 0
	adds r2, r6, 0
	bl ItemUse_SetQuestLogEvent
	adds r0, r7, 0
	bl sub_8124DC0
	ldr r1, _081253A8 @ =gItemUseCB
	ldr r0, _081253AC @ =ItemUseCB_Medicine
	str r0, [r1]
_08125398:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081253A4: .4byte 0x0000ffff
_081253A8: .4byte gItemUseCB
_081253AC: .4byte ItemUseCB_Medicine
	thumb_func_end sub_81252D0

	thumb_func_start ItemUseCB_Medicine
ItemUseCB_Medicine: @ 81253B0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	str r1, [sp, 0x4]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r0, 0
	mov r10, r0
	ldr r0, _08125438 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0812543C @ =gPlayerParty
	adds r5, r1, r0
	ldr r0, _08125440 @ =gSpecialVar_ItemId
	ldrh r6, [r0]
	adds r0, r5, 0
	adds r1, r6, 0
	bl NotUsingHPEVItemOnShedinja
	lsls r0, 24
	cmp r0, 0
	beq _08125428
	adds r0, r6, 0
	bl IsHPRecoveryItem
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x1
	bne _08125416
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
	cmp r10, r0
	bne _08125416
	movs r1, 0
	mov r8, r1
_08125416:
	ldr r4, _08125438 @ =gPartyMenu
	ldrb r0, [r4, 0x9]
	adds r1, r6, 0
	movs r2, 0
	bl ExecuteTableBasedItemEffect_
	lsls r0, 24
	cmp r0, 0
	beq _0812544C
_08125428:
	ldr r1, _08125444 @ =gPartyMenuUseExitCallback
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08125448 @ =gText_WontHaveEffect
	b _0812551C
	.align 2, 0
_08125438: .4byte gPartyMenu
_0812543C: .4byte gPlayerParty
_08125440: .4byte gSpecialVar_ItemId
_08125444: .4byte gPartyMenuUseExitCallback
_08125448: .4byte gText_WontHaveEffect
_0812544C:
	ldr r1, _08125474 @ =gPartyMenuUseExitCallback
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r6, 0
	bl IsItemFlute
	lsls r0, 24
	cmp r0, 0
	bne _08125478
	movs r0, 0x1
	bl PlaySE
	ldrb r0, [r4, 0xB]
	cmp r0, 0xE
	beq _0812547E
	adds r0, r6, 0
	movs r1, 0x1
	bl RemoveBagItem
	b _0812547E
	.align 2, 0
_08125474: .4byte gPartyMenuUseExitCallback
_08125478:
	movs r0, 0x6E
	bl PlaySE
_0812547E:
	ldr r4, _081254FC @ =sPartyMenuBoxes
	ldr r7, _08125500 @ =gPartyMenu
	movs r0, 0x9
	ldrsb r0, [r7, r0]
	lsls r0, 4
	ldr r1, [r4]
	adds r1, r0
	adds r0, r5, 0
	bl SetPartyMonAilmentGfx
	ldr r2, _08125504 @ =gSprites
	movs r0, 0x9
	ldrsb r0, [r7, r0]
	ldr r1, [r4]
	lsls r0, 4
	adds r3, r0, r1
	ldrb r1, [r3, 0xC]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _081254BC
	adds r0, r5, 0
	adds r1, r3, 0
	movs r2, 0x1
	bl DisplayPartyPokemonLevelCheck
_081254BC:
	mov r2, r8
	cmp r2, 0x1
	bne _0812550C
	mov r0, r10
	cmp r0, 0
	bne _081254D0
	ldrb r0, [r7, 0x9]
	movs r1, 0x1
	bl AnimatePartySlot
_081254D0:
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	mov r1, r10
	subs r3, r1
	lsls r3, 16
	asrs r3, 16
	ldrb r1, [r7, 0x9]
	ldr r0, _08125508 @ =Task_DisplayHPRestoredMessage
	str r0, [sp]
	mov r0, r9
	movs r2, 0x1
	bl PartyMenuModifyHP
	mov r0, r9
	movs r1, 0
	mov r2, r10
	bl ResetHPTaskData
	b _08125538
	.align 2, 0
_081254FC: .4byte sPartyMenuBoxes
_08125500: .4byte gPartyMenu
_08125504: .4byte gSprites
_08125508: .4byte Task_DisplayHPRestoredMessage
_0812550C:
	ldr r1, _08125548 @ =gStringVar1
	adds r0, r5, 0
	bl GetMonNickname
	adds r0, r6, 0
	bl GetMedicineItemEffectMessage
	ldr r0, _0812554C @ =gStringVar4
_0812551C:
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r1, _08125550 @ =gTasks
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	ldr r1, [sp, 0x4]
	str r1, [r0]
_08125538:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08125548: .4byte gStringVar1
_0812554C: .4byte gStringVar4
_08125550: .4byte gTasks
	thumb_func_end ItemUseCB_Medicine

	thumb_func_start Task_DisplayHPRestoredMessage
Task_DisplayHPRestoredMessage: @ 8125554
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _081255A0 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081255A4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _081255A8 @ =gStringVar1
	bl GetMonNickname
	ldr r4, _081255AC @ =gStringVar4
	ldr r1, _081255B0 @ =gText_PkmnHPRestoredByVar2
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	bl HandleBattleLowHpMusicChange
	ldr r1, _081255B4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _081255B8 @ =Task_ClosePartyMenuAfterText
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081255A0: .4byte gPartyMenu
_081255A4: .4byte gPlayerParty
_081255A8: .4byte gStringVar1
_081255AC: .4byte gStringVar4
_081255B0: .4byte gText_PkmnHPRestoredByVar2
_081255B4: .4byte gTasks
_081255B8: .4byte Task_ClosePartyMenuAfterText
	thumb_func_end Task_DisplayHPRestoredMessage

	thumb_func_start Task_ClosePartyMenuAfterText
Task_ClosePartyMenuAfterText: @ 81255BC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081255E2
	ldr r0, _081255E8 @ =gPartyMenuUseExitCallback
	ldrb r1, [r0]
	cmp r1, 0
	bne _081255DC
	ldr r0, _081255EC @ =sPartyMenuInternal
	ldr r0, [r0]
	str r1, [r0, 0x4]
_081255DC:
	adds r0, r4, 0
	bl Task_ClosePartyMenu
_081255E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081255E8: .4byte gPartyMenuUseExitCallback
_081255EC: .4byte sPartyMenuInternal
	thumb_func_end Task_ClosePartyMenuAfterText

	thumb_func_start ShowMoveSelectWindow
ShowMoveSelectWindow: @ 81255F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	mov r10, r0
	movs r1, 0x2
	mov r8, r1
	movs r0, 0x3
	bl DisplaySelectionWindow
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r6, 0
	movs r0, 0x64
	adds r2, r4, 0
	muls r2, r0
	str r2, [sp, 0xC]
_08125620:
	ldr r0, _081256B8 @ =gPlayerParty
	adds r1, r6, 0
	adds r1, 0xD
	ldr r2, [sp, 0xC]
	adds r0, r2, r0
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r0, r8
	movs r1, 0
	bl GetFontAttribute
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x2
	bl GetFontAttribute
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0xD
	adds r2, r5, 0
	muls r2, r0
	ldr r0, _081256BC @ =gMoveNames
	adds r2, r0
	lsls r0, r6, 4
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r7, 0
	str r7, [sp, 0x8]
	mov r0, r9
	mov r1, r8
	adds r3, r4, 0
	bl AddTextPrinterParameterized
	cmp r5, 0
	beq _08125680
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
_08125680:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _08125620
	movs r0, 0x10
	str r0, [sp]
	mov r0, r10
	str r0, [sp, 0x4]
	str r7, [sp, 0x8]
	mov r0, r9
	mov r1, r8
	movs r2, 0
	movs r3, 0x2
	bl Menu_InitCursor
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081256B8: .4byte gPlayerParty
_081256BC: .4byte gMoveNames
	thumb_func_end ShowMoveSelectWindow

	thumb_func_start Task_HandleWhichMoveInput
Task_HandleWhichMoveInput: @ 81256C0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl Menu_ProcessInput
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _081256F2
	adds r0, 0x1
	cmp r1, r0
	bne _081256EC
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl ReturnToUseOnWhichMon
	b _081256F2
_081256EC:
	adds r0, r5, 0
	bl SetSelectedMoveForPPItem
_081256F2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end Task_HandleWhichMoveInput

	thumb_func_start ItemUseCB_PPRecovery
ItemUseCB_PPRecovery: @ 81256F8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08125710 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	cmp r0, 0xAF
	bne _0812571C
	ldr r0, _08125714 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _08125718 @ =0x00003108
	adds r0, r1
	b _08125726
	.align 2, 0
_08125710: .4byte gSpecialVar_ItemId
_08125714: .4byte gSaveBlock1Ptr
_08125718: .4byte 0x00003108
_0812571C:
	ldr r1, _0812574C @ =gItemEffectTable
	subs r0, 0xD
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
_08125726:
	ldrb r1, [r0, 0x4]
	movs r0, 0x10
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0812575C
	ldr r0, _08125750 @ =gPartyMenu
	strh r1, [r0, 0xE]
	ldrb r1, [r0, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	bne _08125754
	adds r0, r4, 0
	bl TryUsePPItem
	b _0812577E
	.align 2, 0
_0812574C: .4byte gItemEffectTable
_08125750: .4byte gPartyMenu
_08125754:
	adds r0, r4, 0
	bl sub_812580C
	b _0812577E
_0812575C:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x17
	bl DisplayPartyMenuStdMessage
	ldr r0, _08125784 @ =gPartyMenu
	ldrb r0, [r0, 0x9]
	bl ShowMoveSelectWindow
	ldr r1, _08125788 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0812578C @ =Task_HandleWhichMoveInput
	str r1, [r0]
_0812577E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08125784: .4byte gPartyMenu
_08125788: .4byte gTasks
_0812578C: .4byte Task_HandleWhichMoveInput
	thumb_func_end ItemUseCB_PPRecovery

	thumb_func_start SetSelectedMoveForPPItem
SetSelectedMoveForPPItem: @ 8125790
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081257C0 @ =sPartyMenuInternal
	ldr r0, [r0]
	adds r0, 0xC
	bl PartyMenuRemoveWindow
	bl Menu_GetCursorPos
	ldr r1, _081257C4 @ =gPartyMenu
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0xE]
	ldrb r1, [r1, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	bne _081257C8
	adds r0, r4, 0
	bl TryUsePPItem
	b _081257CE
	.align 2, 0
_081257C0: .4byte sPartyMenuInternal
_081257C4: .4byte gPartyMenu
_081257C8:
	adds r0, r4, 0
	bl sub_812580C
_081257CE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SetSelectedMoveForPPItem

	thumb_func_start ReturnToUseOnWhichMon
ReturnToUseOnWhichMon: @ 81257D4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08125800 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _08125804 @ =Task_HandleChooseMonInput
	str r0, [r1]
	ldr r0, _08125808 @ =sPartyMenuInternal
	ldr r0, [r0]
	movs r1, 0
	str r1, [r0, 0x4]
	adds r0, 0xC
	bl PartyMenuRemoveWindow
	movs r0, 0x5
	bl DisplayPartyMenuStdMessage
	pop {r0}
	bx r0
	.align 2, 0
_08125800: .4byte gTasks
_08125804: .4byte Task_HandleChooseMonInput
_08125808: .4byte sPartyMenuInternal
	thumb_func_end ReturnToUseOnWhichMon

	thumb_func_start sub_812580C
sub_812580C: @ 812580C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r3, _08125860 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r3, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08125864 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08125868 @ =gSpecialVar_ItemId
	ldrh r1, [r1]
	ldrb r2, [r3, 0x9]
	ldrb r3, [r3, 0xE]
	bl PokemonUseItemEffects2
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	cmp r4, 0
	beq _0812587C
	ldr r1, _0812586C @ =gPartyMenuUseExitCallback
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08125870 @ =gText_WontHaveEffect
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r1, _08125874 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08125878 @ =Task_ClosePartyMenuAfterText
	str r1, [r0]
	b _08125888
	.align 2, 0
_08125860: .4byte gPartyMenu
_08125864: .4byte gPlayerParty
_08125868: .4byte gSpecialVar_ItemId
_0812586C: .4byte gPartyMenuUseExitCallback
_08125870: .4byte gText_WontHaveEffect
_08125874: .4byte gTasks
_08125878: .4byte Task_ClosePartyMenuAfterText
_0812587C:
	adds r0, r5, 0
	bl sub_8124DC0
	ldr r1, _08125890 @ =gItemUseCB
	ldr r0, _08125894 @ =sub_8125898
	str r0, [r1]
_08125888:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08125890: .4byte gItemUseCB
_08125894: .4byte sub_8125898
	thumb_func_end sub_812580C

	thumb_func_start sub_8125898
sub_8125898: @ 8125898
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r5, _08125930 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r5, r1]
	movs r0, 0x64
	adds r4, r1, 0
	muls r4, r0
	ldr r0, _08125934 @ =gPlayerParty
	adds r4, r0
	ldrb r0, [r5, 0x9]
	ldr r6, _08125938 @ =gSpecialVar_ItemId
	ldrh r1, [r6]
	ldrb r2, [r5, 0xE]
	bl ExecuteTableBasedItemEffect_
	ldr r1, _0812593C @ =gPartyMenuUseExitCallback
	movs r0, 0x1
	strb r0, [r1]
	ldrh r2, [r6]
	ldr r3, _08125940 @ =0x0000ffff
	movs r0, 0x4
	adds r1, r4, 0
	bl ItemUse_SetQuestLogEvent
	movs r0, 0x1
	bl PlaySE
	ldrh r0, [r6]
	movs r1, 0x1
	bl RemoveBagItem
	movs r2, 0xE
	ldrsh r1, [r5, r2]
	adds r1, 0xD
	adds r0, r4, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08125944 @ =gStringVar1
	movs r1, 0xD
	muls r1, r0
	ldr r0, _08125948 @ =gMoveNames
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	ldrh r0, [r6]
	bl GetMedicineItemEffectMessage
	ldr r0, _0812594C @ =gStringVar4
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r1, _08125950 @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _08125954 @ =Task_ClosePartyMenuAfterText
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08125930: .4byte gPartyMenu
_08125934: .4byte gPlayerParty
_08125938: .4byte gSpecialVar_ItemId
_0812593C: .4byte gPartyMenuUseExitCallback
_08125940: .4byte 0x0000ffff
_08125944: .4byte gStringVar1
_08125948: .4byte gMoveNames
_0812594C: .4byte gStringVar4
_08125950: .4byte gTasks
_08125954: .4byte Task_ClosePartyMenuAfterText
	thumb_func_end sub_8125898

	thumb_func_start TryUsePPItem
TryUsePPItem: @ 8125958
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r7, _08125990 @ =gPartyMenu + 14
	ldr r0, _08125994 @ =gSpecialVar_ItemId
	ldrh r5, [r0]
	movs r0, 0xE
	negs r0, r0
	adds r0, r7
	mov r8, r0
	ldrb r0, [r0, 0x9]
	ldrb r2, [r7]
	adds r1, r5, 0
	bl ExecuteTableBasedItemEffect_
	lsls r0, 24
	cmp r0, 0
	beq _081259A0
	ldr r0, _08125998 @ =gPartyMenuUseExitCallback
	strb r4, [r0]
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0812599C @ =gText_WontHaveEffect
	b _081259F6
	.align 2, 0
_08125990: .4byte gPartyMenu + 14
_08125994: .4byte gSpecialVar_ItemId
_08125998: .4byte gPartyMenuUseExitCallback
_0812599C: .4byte gText_WontHaveEffect
_081259A0:
	ldr r1, _08125A1C @ =gPartyMenuUseExitCallback
	movs r0, 0x1
	strb r0, [r1]
	mov r0, r8
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	adds r4, r1, 0
	muls r4, r0
	ldr r0, _08125A20 @ =gPlayerParty
	adds r4, r0
	ldr r3, _08125A24 @ =0x0000ffff
	movs r0, 0x4
	adds r1, r4, 0
	adds r2, r5, 0
	bl ItemUse_SetQuestLogEvent
	movs r0, 0x1
	bl PlaySE
	adds r0, r5, 0
	movs r1, 0x1
	bl RemoveBagItem
	movs r0, 0
	ldrsh r1, [r7, r0]
	adds r1, 0xD
	adds r0, r4, 0
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _08125A28 @ =gStringVar1
	movs r1, 0xD
	muls r1, r4
	ldr r2, _08125A2C @ =gMoveNames
	adds r1, r2
	bl StringCopy
	adds r0, r5, 0
	bl GetMedicineItemEffectMessage
	ldr r0, _08125A30 @ =gStringVar4
_081259F6:
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r1, _08125A34 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08125A38 @ =Task_ClosePartyMenuAfterText
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08125A1C: .4byte gPartyMenuUseExitCallback
_08125A20: .4byte gPlayerParty
_08125A24: .4byte 0x0000ffff
_08125A28: .4byte gStringVar1
_08125A2C: .4byte gMoveNames
_08125A30: .4byte gStringVar4
_08125A34: .4byte gTasks
_08125A38: .4byte Task_ClosePartyMenuAfterText
	thumb_func_end TryUsePPItem

	thumb_func_start ItemUseCB_PPUp
ItemUseCB_PPUp: @ 8125A3C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x18
	bl DisplayPartyMenuStdMessage
	ldr r0, _08125A6C @ =gPartyMenu
	ldrb r0, [r0, 0x9]
	bl ShowMoveSelectWindow
	ldr r1, _08125A70 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08125A74 @ =Task_HandleWhichMoveInput
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08125A6C: .4byte gPartyMenu
_08125A70: .4byte gTasks
_08125A74: .4byte Task_HandleWhichMoveInput
	thumb_func_end ItemUseCB_PPUp

	thumb_func_start ItemIdToBattleMoveId
ItemIdToBattleMoveId: @ 8125A78
	lsls r0, 16
	ldr r1, _08125A88 @ =0xfedf0000
	adds r0, r1
	ldr r1, _08125A8C @ =sTMHMMoves
	lsrs r0, 15
	adds r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08125A88: .4byte 0xfedf0000
_08125A8C: .4byte sTMHMMoves
	thumb_func_end ItemIdToBattleMoveId

	thumb_func_start IsMoveHm
IsMoveHm: @ 8125A90
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0
	ldr r3, _08125AAC @ =sTMHMMoves
_08125A9A:
	adds r0, r1, 0
	adds r0, 0x32
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _08125AB0
	movs r0, 0x1
	b _08125ABC
	.align 2, 0
_08125AAC: .4byte sTMHMMoves
_08125AB0:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x6
	bls _08125A9A
	movs r0, 0
_08125ABC:
	pop {r1}
	bx r1
	thumb_func_end IsMoveHm

	thumb_func_start MonKnowsMove
MonKnowsMove: @ 8125AC0
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	movs r4, 0
_08125ACA:
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r6, 0
	bl GetMonData
	cmp r0, r5
	bne _08125ADC
	movs r0, 0x1
	b _08125AE8
_08125ADC:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08125ACA
	movs r0, 0
_08125AE8:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end MonKnowsMove

	thumb_func_start DisplayLearnMoveMessage
DisplayLearnMoveMessage: @ 8125AF0
	push {r4,lr}
	adds r1, r0, 0
	ldr r4, _08125B10 @ =gStringVar4
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08125B10: .4byte gStringVar4
	thumb_func_end DisplayLearnMoveMessage

	thumb_func_start DisplayLearnMoveMessageAndClose
DisplayLearnMoveMessageAndClose: @ 8125B14
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	lsls r4, 24
	lsrs r4, 24
	bl DisplayLearnMoveMessage
	ldr r1, _08125B38 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08125B3C @ =Task_ClosePartyMenuAfterText
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08125B38: .4byte gTasks
_08125B3C: .4byte Task_ClosePartyMenuAfterText
	thumb_func_end DisplayLearnMoveMessageAndClose

	thumb_func_start ItemUseCB_TMHM
ItemUseCB_TMHM: @ 8125B40
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0x5
	bl PlaySE
	ldr r7, _08125BD0 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r7, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08125BD4 @ =gPlayerParty
	adds r4, r1, r0
	movs r0, 0xE
	adds r0, r7
	mov r8, r0
	ldr r0, _08125BD8 @ =gSpecialVar_ItemId
	ldrh r5, [r0]
	ldr r1, _08125BDC @ =gStringVar1
	adds r0, r4, 0
	bl GetMonNickname
	adds r0, r5, 0
	bl ItemIdToBattleMoveId
	strh r0, [r7, 0xE]
	ldr r0, _08125BE0 @ =gStringVar2
	movs r1, 0xE
	ldrsh r2, [r7, r1]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _08125BE4 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	movs r0, 0
	mov r1, r8
	strh r0, [r1, 0x2]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl CanMonLearnTMTutor
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08125BF4
	cmp r0, 0x2
	beq _08125BFC
	ldrh r1, [r7, 0xE]
	adds r0, r4, 0
	bl GiveMoveToMon
	lsls r0, 16
	lsrs r0, 16
	ldr r3, _08125BE8 @ =0x0000ffff
	cmp r0, r3
	beq _08125C0C
	movs r0, 0x4
	adds r1, r4, 0
	adds r2, r5, 0
	bl ItemUse_SetQuestLogEvent
	adds r0, r6, 0
	bl sub_8124DC0
	ldr r1, _08125BEC @ =gItemUseCB
	ldr r0, _08125BF0 @ =Task_LearnedMove_
	str r0, [r1]
	b _08125C20
	.align 2, 0
_08125BD0: .4byte gPartyMenu
_08125BD4: .4byte gPlayerParty
_08125BD8: .4byte gSpecialVar_ItemId
_08125BDC: .4byte gStringVar1
_08125BE0: .4byte gStringVar2
_08125BE4: .4byte gMoveNames
_08125BE8: .4byte 0x0000ffff
_08125BEC: .4byte gItemUseCB
_08125BF0: .4byte Task_LearnedMove_
_08125BF4:
	ldr r1, _08125BF8 @ =gText_PkmnCantLearnMove
	b _08125BFE
	.align 2, 0
_08125BF8: .4byte gText_PkmnCantLearnMove
_08125BFC:
	ldr r1, _08125C08 @ =gText_PkmnAlreadyKnows
_08125BFE:
	adds r0, r6, 0
	bl DisplayLearnMoveMessageAndClose
	b _08125C20
	.align 2, 0
_08125C08: .4byte gText_PkmnAlreadyKnows
_08125C0C:
	ldr r0, _08125C2C @ =gText_PkmnNeedsToReplaceMove
	bl DisplayLearnMoveMessage
	ldr r1, _08125C30 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08125C34 @ =Task_ReplaceMoveYesNo
	str r1, [r0]
_08125C20:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08125C2C: .4byte gText_PkmnNeedsToReplaceMove
_08125C30: .4byte gTasks
_08125C34: .4byte Task_ReplaceMoveYesNo
	thumb_func_end ItemUseCB_TMHM

	thumb_func_start Task_LearnedMove_
Task_LearnedMove_: @ 8125C38
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl Task_LearnedMove
	pop {r0}
	bx r0
	thumb_func_end Task_LearnedMove_

	thumb_func_start Task_LearnedMove
Task_LearnedMove: @ 8125C48
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _08125CCC @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r2, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08125CD0 @ =gPlayerParty
	adds r5, r1, r0
	adds r6, r2, 0
	adds r6, 0xE
	ldr r0, _08125CD4 @ =gSpecialVar_ItemId
	ldrh r4, [r0]
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _08125C84
	adds r0, r5, 0
	movs r1, 0x4
	bl AdjustFriendship
	movs r0, 0xA9
	lsls r0, 1
	cmp r4, r0
	bhi _08125C84
	adds r0, r4, 0
	movs r1, 0x1
	bl RemoveBagItem
_08125C84:
	ldr r1, _08125CD8 @ =gStringVar1
	adds r0, r5, 0
	bl GetMonNickname
	ldr r0, _08125CDC @ =gStringVar2
	movs r1, 0
	ldrsh r2, [r6, r1]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _08125CE0 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _08125CE4 @ =gStringVar4
	ldr r1, _08125CE8 @ =gText_PkmnLearnedMove3
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r1, _08125CEC @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _08125CF0 @ =Task_DoLearnedMoveFanfareAfterText
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08125CCC: .4byte gPartyMenu
_08125CD0: .4byte gPlayerParty
_08125CD4: .4byte gSpecialVar_ItemId
_08125CD8: .4byte gStringVar1
_08125CDC: .4byte gStringVar2
_08125CE0: .4byte gMoveNames
_08125CE4: .4byte gStringVar4
_08125CE8: .4byte gText_PkmnLearnedMove3
_08125CEC: .4byte gTasks
_08125CF0: .4byte Task_DoLearnedMoveFanfareAfterText
	thumb_func_end Task_LearnedMove

	thumb_func_start Task_DoLearnedMoveFanfareAfterText
Task_DoLearnedMoveFanfareAfterText: @ 8125CF4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08125D1A
	ldr r0, _08125D20 @ =0x00000101
	bl PlayFanfare
	ldr r1, _08125D24 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08125D28 @ =Task_LearnNextMoveOrClosePartyMenu
	str r1, [r0]
_08125D1A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08125D20: .4byte 0x00000101
_08125D24: .4byte gTasks
_08125D28: .4byte Task_LearnNextMoveOrClosePartyMenu
	thumb_func_end Task_DoLearnedMoveFanfareAfterText

	thumb_func_start Task_LearnNextMoveOrClosePartyMenu
Task_LearnNextMoveOrClosePartyMenu: @ 8125D2C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08125D7E
	ldr r0, _08125D68 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _08125D54
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08125D7E
_08125D54:
	ldr r0, _08125D6C @ =gPartyMenu
	movs r1, 0x10
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _08125D70
	adds r0, r4, 0
	bl Task_TryLearningNextMove
	b _08125D7E
	.align 2, 0
_08125D68: .4byte gMain
_08125D6C: .4byte gPartyMenu
_08125D70:
	cmp r0, 0x2
	bne _08125D78
	ldr r0, _08125D84 @ =gSpecialVar_Result
	strh r2, [r0]
_08125D78:
	adds r0, r5, 0
	bl Task_ClosePartyMenu
_08125D7E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08125D84: .4byte gSpecialVar_Result
	thumb_func_end Task_LearnNextMoveOrClosePartyMenu

	thumb_func_start Task_ReplaceMoveYesNo
Task_ReplaceMoveYesNo: @ 8125D88
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08125DAC
	bl PartyMenuDisplayYesNoMenu
	ldr r0, _08125DB4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08125DB8 @ =Task_HandleReplaceMoveYesNoInput
	str r0, [r1]
_08125DAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08125DB4: .4byte gTasks
_08125DB8: .4byte Task_HandleReplaceMoveYesNoInput
	thumb_func_end Task_ReplaceMoveYesNo

	thumb_func_start Task_HandleReplaceMoveYesNoInput
Task_HandleReplaceMoveYesNoInput: @ 8125DBC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08125DE2
	cmp r1, 0
	bgt _08125DDC
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08125E08
	b _08125E14
_08125DDC:
	cmp r1, 0x1
	beq _08125E0E
	b _08125E14
_08125DE2:
	ldr r0, _08125DFC @ =gText_WhichMoveToForget
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	ldr r1, _08125E00 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08125E04 @ =Task_ShowSummaryScreenToForgetMove
	str r1, [r0]
	b _08125E14
	.align 2, 0
_08125DFC: .4byte gText_WhichMoveToForget
_08125E00: .4byte gTasks
_08125E04: .4byte Task_ShowSummaryScreenToForgetMove
_08125E08:
	movs r0, 0x5
	bl PlaySE
_08125E0E:
	adds r0, r4, 0
	bl StopLearningMovePrompt
_08125E14:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_HandleReplaceMoveYesNoInput

	thumb_func_start Task_ShowSummaryScreenToForgetMove
Task_ShowSummaryScreenToForgetMove: @ 8125E1C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08125E3C
	ldr r0, _08125E44 @ =sPartyMenuInternal
	ldr r1, [r0]
	ldr r0, _08125E48 @ =CB2_ShowSummaryScreenToForgetMove
	str r0, [r1, 0x4]
	adds r0, r4, 0
	bl Task_ClosePartyMenu
_08125E3C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08125E44: .4byte sPartyMenuInternal
_08125E48: .4byte CB2_ShowSummaryScreenToForgetMove
	thumb_func_end Task_ShowSummaryScreenToForgetMove

	thumb_func_start CB2_ShowSummaryScreenToForgetMove
CB2_ShowSummaryScreenToForgetMove: @ 8125E4C
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08125E74 @ =gPlayerParty
	ldr r4, _08125E78 @ =gPartyMenu
	ldrb r1, [r4, 0x9]
	ldr r2, _08125E7C @ =gPlayerPartyCount
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08125E80 @ =CB2_ReturnToPartyMenuWhileLearningMove
	ldrh r4, [r4, 0xE]
	str r4, [sp]
	bl ShowSelectMovePokemonSummaryScreen
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08125E74: .4byte gPlayerParty
_08125E78: .4byte gPartyMenu
_08125E7C: .4byte gPlayerPartyCount
_08125E80: .4byte CB2_ReturnToPartyMenuWhileLearningMove
	thumb_func_end CB2_ShowSummaryScreenToForgetMove

	thumb_func_start CB2_ReturnToPartyMenuWhileLearningMove
CB2_ReturnToPartyMenuWhileLearningMove: @ 8125E84
	push {r4,r5,lr}
	sub sp, 0xC
	bl GetMoveSlotToReplace
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r4, _08125ED0 @ =gPartyMenu
	movs r0, 0x10
	ldrsh r5, [r4, r0]
	cmp r5, 0
	bne _08125EE8
	cmp r2, 0x4
	beq _08125EE8
	movs r1, 0x9
	ldrsb r1, [r4, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08125ED4 @ =gPlayerParty
	adds r0, r1
	adds r1, r2, 0
	adds r1, 0xD
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	ldrb r0, [r4, 0x9]
	ldr r1, _08125ED8 @ =gSpecialVar_ItemId
	ldrh r1, [r1]
	ldr r3, _08125EDC @ =sub_8124EFC
	bl sub_811C568
	ldr r1, _08125EE0 @ =gItemUseCB
	ldr r0, _08125EE4 @ =sub_8125F4C
	str r0, [r1]
	strb r5, [r4, 0xB]
	b _08125F02
	.align 2, 0
_08125ED0: .4byte gPartyMenu
_08125ED4: .4byte gPlayerParty
_08125ED8: .4byte gSpecialVar_ItemId
_08125EDC: .4byte sub_8124EFC
_08125EE0: .4byte gItemUseCB
_08125EE4: .4byte sub_8125F4C
_08125EE8:
	movs r0, 0x7F
	str r0, [sp]
	ldr r0, _08125F0C @ =Task_ReturnToPartyMenuWhileLearningMove
	str r0, [sp, 0x4]
	ldr r0, _08125F10 @ =gPartyMenu
	ldr r0, [r0]
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x1
	bl InitPartyMenu
_08125F02:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08125F0C: .4byte Task_ReturnToPartyMenuWhileLearningMove
_08125F10: .4byte gPartyMenu
	thumb_func_end CB2_ReturnToPartyMenuWhileLearningMove

	thumb_func_start Task_ReturnToPartyMenuWhileLearningMove
Task_ReturnToPartyMenuWhileLearningMove: @ 8125F14
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	ldr r0, _08125F3C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08125F46
	bl GetMoveSlotToReplace
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _08125F40
	adds r0, r4, 0
	bl DisplayPartyMenuForgotMoveMessage
	b _08125F46
	.align 2, 0
_08125F3C: .4byte gPaletteFade
_08125F40:
	adds r0, r5, 0
	bl StopLearningMovePrompt
_08125F46:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end Task_ReturnToPartyMenuWhileLearningMove

	thumb_func_start sub_8125F4C
sub_8125F4C: @ 8125F4C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8125F5C
	pop {r0}
	bx r0
	thumb_func_end sub_8125F4C

	thumb_func_start sub_8125F5C
sub_8125F5C: @ 8125F5C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _08125FE4 @ =gPartyMenu
	mov r9, r0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	adds r6, r1, 0
	muls r6, r0
	ldr r0, _08125FE8 @ =gPlayerParty
	adds r6, r0
	bl GetMoveSlotToReplace
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r1, r5, 0
	adds r1, 0xD
	adds r0, r6, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08125FEC @ =gSpecialVar_ItemId
	ldrh r2, [r0]
	movs r0, 0x4
	adds r1, r6, 0
	adds r3, r4, 0
	bl ItemUse_SetQuestLogEvent
	ldr r1, _08125FF0 @ =gStringVar1
	adds r0, r6, 0
	bl GetMonNickname
	ldr r0, _08125FF4 @ =gStringVar2
	movs r1, 0xD
	muls r1, r4
	ldr r2, _08125FF8 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	adds r0, r6, 0
	adds r1, r5, 0
	bl RemoveMonPPBonus
	mov r0, r9
	ldrh r1, [r0, 0xE]
	adds r0, r6, 0
	adds r2, r5, 0
	bl SetMonMoveSlot
	mov r0, r8
	bl Task_LearnedMove
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08125FE4: .4byte gPartyMenu
_08125FE8: .4byte gPlayerParty
_08125FEC: .4byte gSpecialVar_ItemId
_08125FF0: .4byte gStringVar1
_08125FF4: .4byte gStringVar2
_08125FF8: .4byte gMoveNames
	thumb_func_end sub_8125F5C

	thumb_func_start DisplayPartyMenuForgotMoveMessage
DisplayPartyMenuForgotMoveMessage: @ 8125FFC
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _0812605C @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	adds r5, r1, 0
	muls r5, r0
	ldr r0, _08126060 @ =gPlayerParty
	adds r5, r0
	bl GetMoveSlotToReplace
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r1, 0xD
	adds r0, r5, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r1, _08126064 @ =gStringVar1
	adds r0, r5, 0
	bl GetMonNickname
	ldr r0, _08126068 @ =gStringVar2
	movs r1, 0xD
	muls r1, r4
	ldr r2, _0812606C @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r0, _08126070 @ =gUnknown_8416EC6
	bl DisplayLearnMoveMessage
	ldr r1, _08126074 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126078 @ =Task_PartyMenuReplaceMove
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812605C: .4byte gPartyMenu
_08126060: .4byte gPlayerParty
_08126064: .4byte gStringVar1
_08126068: .4byte gStringVar2
_0812606C: .4byte gMoveNames
_08126070: .4byte gUnknown_8416EC6
_08126074: .4byte gTasks
_08126078: .4byte Task_PartyMenuReplaceMove
	thumb_func_end DisplayPartyMenuForgotMoveMessage

	thumb_func_start Task_PartyMenuReplaceMove
Task_PartyMenuReplaceMove: @ 812607C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081260C8
	ldr r5, _081260D0 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r5, r1]
	movs r0, 0x64
	adds r4, r1, 0
	muls r4, r0
	ldr r0, _081260D4 @ =gPlayerParty
	adds r4, r0
	bl GetMoveSlotToReplace
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl RemoveMonPPBonus
	ldrh r5, [r5, 0xE]
	bl GetMoveSlotToReplace
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl SetMonMoveSlot
	adds r0, r6, 0
	bl Task_LearnedMove
_081260C8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081260D0: .4byte gPartyMenu
_081260D4: .4byte gPlayerParty
	thumb_func_end Task_PartyMenuReplaceMove

	thumb_func_start StopLearningMovePrompt
StopLearningMovePrompt: @ 81260D8
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08126120 @ =gStringVar2
	ldr r1, _08126124 @ =gPartyMenu
	movs r3, 0xE
	ldrsh r2, [r1, r3]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _08126128 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _0812612C @ =gStringVar4
	ldr r1, _08126130 @ =gText_StopLearningMove2
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r1, _08126134 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126138 @ =Task_StopLearningMoveYesNo
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08126120: .4byte gStringVar2
_08126124: .4byte gPartyMenu
_08126128: .4byte gMoveNames
_0812612C: .4byte gStringVar4
_08126130: .4byte gText_StopLearningMove2
_08126134: .4byte gTasks
_08126138: .4byte Task_StopLearningMoveYesNo
	thumb_func_end StopLearningMovePrompt

	thumb_func_start Task_StopLearningMoveYesNo
Task_StopLearningMoveYesNo: @ 812613C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08126160
	bl PartyMenuDisplayYesNoMenu
	ldr r0, _08126168 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812616C @ =Task_HandleStopLearningMoveYesNoInput
	str r0, [r1]
_08126160:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08126168: .4byte gTasks
_0812616C: .4byte Task_HandleStopLearningMoveYesNoInput
	thumb_func_end Task_StopLearningMoveYesNo

	thumb_func_start Task_HandleStopLearningMoveYesNoInput
Task_HandleStopLearningMoveYesNoInput: @ 8126170
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r7, _081261A0 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r7, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _081261A4 @ =gPlayerParty
	adds r4, r1, r0
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r5, r0, 24
	cmp r5, 0
	beq _081261AE
	cmp r5, 0
	bgt _081261A8
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	beq _08126234
	b _0812626A
	.align 2, 0
_081261A0: .4byte gPartyMenu
_081261A4: .4byte gPlayerParty
_081261A8:
	cmp r5, 0x1
	beq _0812623A
	b _0812626A
_081261AE:
	ldr r1, _081261F4 @ =gStringVar1
	adds r0, r4, 0
	bl GetMonNickname
	ldr r0, _081261F8 @ =gStringVar2
	movs r1, 0xE
	ldrsh r2, [r7, r1]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _081261FC @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _08126200 @ =gStringVar4
	ldr r1, _08126204 @ =gText_MoveNotLearned
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r3, 0x10
	ldrsh r0, [r7, r3]
	cmp r0, 0x1
	bne _08126210
	ldr r0, _08126208 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812620C @ =Task_TryLearningNextMoveAfterText
	str r0, [r1]
	b _0812626A
	.align 2, 0
_081261F4: .4byte gStringVar1
_081261F8: .4byte gStringVar2
_081261FC: .4byte gMoveNames
_08126200: .4byte gStringVar4
_08126204: .4byte gText_MoveNotLearned
_08126208: .4byte gTasks
_0812620C: .4byte Task_TryLearningNextMoveAfterText
_08126210:
	cmp r0, 0x2
	bne _08126218
	ldr r0, _08126228 @ =gSpecialVar_Result
	strh r5, [r0]
_08126218:
	ldr r0, _0812622C @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _08126230 @ =Task_ClosePartyMenuAfterText
	str r0, [r1]
	b _0812626A
	.align 2, 0
_08126228: .4byte gSpecialVar_Result
_0812622C: .4byte gTasks
_08126230: .4byte Task_ClosePartyMenuAfterText
_08126234:
	movs r0, 0x5
	bl PlaySE
_0812623A:
	ldr r1, _08126270 @ =gStringVar1
	adds r0, r4, 0
	bl GetMonNickname
	ldr r0, _08126274 @ =gStringVar2
	ldr r1, _08126278 @ =gPartyMenu
	movs r3, 0xE
	ldrsh r2, [r1, r3]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _0812627C @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r0, _08126280 @ =gText_PkmnNeedsToReplaceMove
	bl DisplayLearnMoveMessage
	ldr r1, _08126284 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126288 @ =Task_ReplaceMoveYesNo
	str r1, [r0]
_0812626A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126270: .4byte gStringVar1
_08126274: .4byte gStringVar2
_08126278: .4byte gPartyMenu
_0812627C: .4byte gMoveNames
_08126280: .4byte gText_PkmnNeedsToReplaceMove
_08126284: .4byte gTasks
_08126288: .4byte Task_ReplaceMoveYesNo
	thumb_func_end Task_HandleStopLearningMoveYesNoInput

	thumb_func_start Task_TryLearningNextMoveAfterText
Task_TryLearningNextMoveAfterText: @ 812628C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081262A4
	adds r0, r4, 0
	bl Task_TryLearningNextMove
_081262A4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_TryLearningNextMoveAfterText

	thumb_func_start dp05_rare_candy
dp05_rare_candy: @ 81262AC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r7, _081262E8 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r7, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _081262EC @ =gPlayerParty
	adds r4, r1, r0
	ldr r0, _081262F0 @ =gSpecialVar_ItemId
	ldrh r5, [r0]
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x64
	beq _081262F4
	ldrb r2, [r7, 0x9]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r3, 0
	bl PokemonUseItemEffects2
	lsls r0, 24
	lsrs r4, r0, 24
	b _081262F6
	.align 2, 0
_081262E8: .4byte gPartyMenu
_081262EC: .4byte gPlayerParty
_081262F0: .4byte gSpecialVar_ItemId
_081262F4:
	movs r4, 0x1
_081262F6:
	movs r0, 0x5
	bl PlaySE
	cmp r4, 0
	beq _08126330
	ldr r1, _08126324 @ =gPartyMenuUseExitCallback
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08126328 @ =gText_WontHaveEffect
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r1, _0812632C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	mov r1, r8
	str r1, [r0]
	b _0812633C
	.align 2, 0
_08126324: .4byte gPartyMenuUseExitCallback
_08126328: .4byte gText_WontHaveEffect
_0812632C: .4byte gTasks
_08126330:
	adds r0, r6, 0
	bl sub_8124DC0
	ldr r1, _08126348 @ =gItemUseCB
	ldr r0, _0812634C @ =ItemUseCB_RareCandy
	str r0, [r1]
_0812633C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126348: .4byte gItemUseCB
_0812634C: .4byte ItemUseCB_RareCandy
	thumb_func_end dp05_rare_candy

	thumb_func_start ItemUseCB_RareCandy
ItemUseCB_RareCandy: @ 8126350
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r6, _08126410 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r6, r1]
	movs r0, 0x64
	adds r4, r1, 0
	muls r4, r0
	ldr r0, _08126414 @ =gPlayerParty
	adds r4, r0
	ldr r0, _08126418 @ =sPartyMenuInternal
	ldr r7, [r0]
	movs r2, 0x86
	lsls r2, 2
	adds r1, r7, r2
	adds r0, r4, 0
	bl GetMonLevelUpWindowStats
	ldrb r0, [r6, 0x9]
	ldr r5, _0812641C @ =gSpecialVar_ItemId
	ldrh r1, [r5]
	movs r2, 0
	bl ExecuteTableBasedItemEffect_
	movs r0, 0x89
	lsls r0, 2
	adds r1, r7, r0
	adds r0, r4, 0
	bl GetMonLevelUpWindowStats
	ldr r1, _08126420 @ =gPartyMenuUseExitCallback
	movs r0, 0x1
	strb r0, [r1]
	ldrh r2, [r5]
	ldr r3, _08126424 @ =0x0000ffff
	movs r0, 0x4
	adds r1, r4, 0
	bl ItemUse_SetQuestLogEvent
	movs r0, 0
	bl PlayFanfareByFanfareNum
	ldrb r0, [r6, 0x9]
	adds r1, r4, 0
	bl UpdateMonDisplayInfoAfterRareCandy
	ldrh r0, [r5]
	movs r1, 0x1
	bl RemoveBagItem
	ldr r1, _08126428 @ =gStringVar1
	adds r0, r4, 0
	bl GetMonNickname
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _0812642C @ =gStringVar2
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r4, _08126430 @ =gStringVar4
	ldr r1, _08126434 @ =gText_PkmnElevatedToLvVar2
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r1, _08126438 @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _0812643C @ =Task_DisplayLevelUpStatsPg1
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126410: .4byte gPartyMenu
_08126414: .4byte gPlayerParty
_08126418: .4byte sPartyMenuInternal
_0812641C: .4byte gSpecialVar_ItemId
_08126420: .4byte gPartyMenuUseExitCallback
_08126424: .4byte 0x0000ffff
_08126428: .4byte gStringVar1
_0812642C: .4byte gStringVar2
_08126430: .4byte gStringVar4
_08126434: .4byte gText_PkmnElevatedToLvVar2
_08126438: .4byte gTasks
_0812643C: .4byte Task_DisplayLevelUpStatsPg1
	thumb_func_end ItemUseCB_RareCandy

	thumb_func_start UpdateMonDisplayInfoAfterRareCandy
UpdateMonDisplayInfoAfterRareCandy: @ 8126440
	push {r4-r7,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r0, 24
	adds r7, r0, 0
	ldr r6, _081264C0 @ =sPartyMenuBoxes
	lsls r4, r7, 4
	ldr r1, [r6]
	adds r1, r4
	adds r0, r5, 0
	bl SetPartyMonAilmentGfx
	ldr r2, _081264C4 @ =gSprites
	ldr r0, [r6]
	adds r3, r4, r0
	ldrb r1, [r3, 0xC]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _0812647C
	adds r0, r5, 0
	adds r1, r3, 0
	movs r2, 0x1
	bl DisplayPartyPokemonLevelCheck
_0812647C:
	ldr r1, [r6]
	adds r1, r4
	adds r0, r5, 0
	movs r2, 0x1
	bl DisplayPartyPokemonHPCheck
	ldr r1, [r6]
	adds r1, r4
	adds r0, r5, 0
	movs r2, 0x1
	bl DisplayPartyPokemonMaxHPCheck
	ldr r1, [r6]
	adds r1, r4
	adds r0, r5, 0
	bl DisplayPartyPokemonHPBarCheck
	ldr r0, [r6]
	adds r0, r4, r0
	ldrb r0, [r0, 0x9]
	adds r1, r5, 0
	bl UpdatePartyMonHPBar
	adds r0, r7, 0
	movs r1, 0x1
	bl AnimatePartySlot
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081264C0: .4byte sPartyMenuBoxes
_081264C4: .4byte gSprites
	thumb_func_end UpdateMonDisplayInfoAfterRareCandy

	thumb_func_start Task_DisplayLevelUpStatsPg1
Task_DisplayLevelUpStatsPg1: @ 81264C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	bl WaitFanfare
	lsls r0, 24
	cmp r0, 0
	beq _08126514
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08126514
	ldr r0, _0812651C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081264FA
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08126514
_081264FA:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl DisplayLevelUpStatsPg1
	ldr r0, _08126520 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08126524 @ =Task_DisplayLevelUpStatsPg2
	str r0, [r1]
_08126514:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812651C: .4byte gMain
_08126520: .4byte gTasks
_08126524: .4byte Task_DisplayLevelUpStatsPg2
	thumb_func_end Task_DisplayLevelUpStatsPg1

	thumb_func_start Task_DisplayLevelUpStatsPg2
Task_DisplayLevelUpStatsPg2: @ 8126528
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08126564 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08126542
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0812655C
_08126542:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl DisplayLevelUpStatsPg2
	ldr r0, _08126568 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812656C @ =Task_TryLearnNewMoves
	str r0, [r1]
_0812655C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08126564: .4byte gMain
_08126568: .4byte gTasks
_0812656C: .4byte Task_TryLearnNewMoves
	thumb_func_end Task_DisplayLevelUpStatsPg2

	thumb_func_start DisplayLevelUpStatsPg1
DisplayLevelUpStatsPg1: @ 8126570
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _081265B8 @ =sPartyMenuInternal
	ldr r5, [r0]
	movs r0, 0x86
	lsls r0, 2
	adds r4, r5, r0
	bl CreateLevelUpStatsWindow
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x18]
	ldrh r0, [r4, 0x18]
	movs r1, 0x89
	lsls r1, 2
	adds r2, r5, r1
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0x3
	str r1, [sp, 0x4]
	adds r1, r4, 0
	movs r3, 0x1
	bl DrawLevelUpWindowPg1
	ldrb r0, [r4, 0x18]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081265B8: .4byte sPartyMenuInternal
	thumb_func_end DisplayLevelUpStatsPg1

	thumb_func_start DisplayLevelUpStatsPg2
DisplayLevelUpStatsPg2: @ 81265BC
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _081265F4 @ =sPartyMenuInternal
	ldr r1, [r0]
	movs r0, 0x86
	lsls r0, 2
	adds r4, r1, r0
	ldrh r0, [r4, 0x18]
	movs r2, 0x89
	lsls r2, 2
	adds r1, r2
	movs r2, 0x3
	str r2, [sp]
	movs r2, 0x1
	movs r3, 0x2
	bl DrawLevelUpWindowPg2
	ldrb r0, [r4, 0x18]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081265F4: .4byte sPartyMenuInternal
	thumb_func_end DisplayLevelUpStatsPg2

	thumb_func_start Task_TryLearnNewMoves
Task_TryLearnNewMoves: @ 81265F8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0
	bl WaitFanfare
	lsls r0, 24
	cmp r0, 0
	beq _0812669A
	ldr r0, _08126650 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r6, 0x1
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	bne _08126620
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0812669A
_08126620:
	bl RemoveLevelUpStatsWindow
	ldr r4, _08126654 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r4, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08126658 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1
	bl MonTryLearningNewMove
	lsls r0, 16
	lsrs r1, r0, 16
	strh r6, [r4, 0x10]
	ldr r0, _0812665C @ =0x0000fffe
	cmp r1, r0
	beq _0812667C
	cmp r1, r0
	bgt _08126660
	cmp r1, 0
	beq _0812666C
	b _08126694
	.align 2, 0
_08126650: .4byte gMain
_08126654: .4byte gPartyMenu
_08126658: .4byte gPlayerParty
_0812665C: .4byte 0x0000fffe
_08126660:
	ldr r0, _08126668 @ =0x0000ffff
	cmp r1, r0
	beq _08126674
	b _08126694
	.align 2, 0
_08126668: .4byte 0x0000ffff
_0812666C:
	adds r0, r5, 0
	bl PartyMenuTryEvolution
	b _0812669A
_08126674:
	adds r0, r5, 0
	bl DisplayMonNeedsToReplaceMove
	b _0812669A
_0812667C:
	ldr r0, _0812668C @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08126690 @ =Task_TryLearningNextMove
	str r0, [r1]
	b _0812669A
	.align 2, 0
_0812668C: .4byte gTasks
_08126690: .4byte Task_TryLearningNextMove
_08126694:
	adds r0, r5, 0
	bl DisplayMonLearnedMove
_0812669A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end Task_TryLearnNewMoves

	thumb_func_start Task_TryLearningNextMove
Task_TryLearningNextMove: @ 81266A0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081266D0 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081266D4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0
	bl MonTryLearningNewMove
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _081266D8 @ =0x0000fffe
	cmp r1, r0
	beq _081266FE
	cmp r1, r0
	bgt _081266DC
	cmp r1, 0
	beq _081266E8
	b _081266F8
	.align 2, 0
_081266D0: .4byte gPartyMenu
_081266D4: .4byte gPlayerParty
_081266D8: .4byte 0x0000fffe
_081266DC:
	ldr r0, _081266E4 @ =0x0000ffff
	cmp r1, r0
	beq _081266F0
	b _081266F8
	.align 2, 0
_081266E4: .4byte 0x0000ffff
_081266E8:
	adds r0, r4, 0
	bl PartyMenuTryEvolution
	b _081266FE
_081266F0:
	adds r0, r4, 0
	bl DisplayMonNeedsToReplaceMove
	b _081266FE
_081266F8:
	adds r0, r4, 0
	bl DisplayMonLearnedMove
_081266FE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_TryLearningNextMove

	thumb_func_start PartyMenuTryEvolution
PartyMenuTryEvolution: @ 8126704
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _08126748 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r6, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0812674C @ =gPlayerParty
	adds r7, r1, r0
	adds r0, r7, 0
	movs r1, 0
	movs r2, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _08126754
	bl FreePartyPointers
	ldr r0, _08126750 @ =gCB2_AfterEvolution
	ldr r1, [r6]
	str r1, [r0]
	ldrb r3, [r6, 0x9]
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0x1
	bl BeginEvolutionScene
	adds r0, r5, 0
	bl DestroyTask
	b _08126762
	.align 2, 0
_08126748: .4byte gPartyMenu
_0812674C: .4byte gPlayerParty
_08126750: .4byte gCB2_AfterEvolution
_08126754:
	ldr r0, _08126768 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812676C @ =Task_ClosePartyMenuAfterText
	str r0, [r1]
_08126762:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126768: .4byte gTasks
_0812676C: .4byte Task_ClosePartyMenuAfterText
	thumb_func_end PartyMenuTryEvolution

	thumb_func_start DisplayMonNeedsToReplaceMove
DisplayMonNeedsToReplaceMove: @ 8126770
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _081267DC @ =gPartyMenu
	mov r8, r0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081267E0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _081267E4 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _081267E8 @ =gStringVar2
	ldr r6, _081267EC @ =gMoveToLearn
	ldrh r2, [r6]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _081267F0 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _081267F4 @ =gStringVar4
	ldr r1, _081267F8 @ =gText_PkmnNeedsToReplaceMove
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldrh r0, [r6]
	mov r1, r8
	strh r0, [r1, 0xE]
	ldr r1, _081267FC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126800 @ =Task_ReplaceMoveYesNo
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081267DC: .4byte gPartyMenu
_081267E0: .4byte gPlayerParty
_081267E4: .4byte gStringVar1
_081267E8: .4byte gStringVar2
_081267EC: .4byte gMoveToLearn
_081267F0: .4byte gMoveNames
_081267F4: .4byte gStringVar4
_081267F8: .4byte gText_PkmnNeedsToReplaceMove
_081267FC: .4byte gTasks
_08126800: .4byte Task_ReplaceMoveYesNo
	thumb_func_end DisplayMonNeedsToReplaceMove

	thumb_func_start DisplayMonLearnedMove
DisplayMonLearnedMove: @ 8126804
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r6, r0, 0
	adds r5, r1, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _08126870 @ =gPartyMenu
	mov r8, r0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08126874 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08126878 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _0812687C @ =gStringVar2
	movs r1, 0xD
	muls r1, r5
	ldr r2, _08126880 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _08126884 @ =gStringVar4
	ldr r1, _08126888 @ =gText_PkmnLearnedMove3
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	mov r0, r8
	strh r5, [r0, 0xE]
	ldr r1, _0812688C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126890 @ =Task_DoLearnedMoveFanfareAfterText
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08126870: .4byte gPartyMenu
_08126874: .4byte gPlayerParty
_08126878: .4byte gStringVar1
_0812687C: .4byte gStringVar2
_08126880: .4byte gMoveNames
_08126884: .4byte gStringVar4
_08126888: .4byte gText_PkmnLearnedMove3
_0812688C: .4byte gTasks
_08126890: .4byte Task_DoLearnedMoveFanfareAfterText
	thumb_func_end DisplayMonLearnedMove

	thumb_func_start ItemUseCB_SacredAsh
ItemUseCB_SacredAsh: @ 8126894
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081268C8 @ =sPartyMenuInternal
	ldr r2, [r1]
	movs r3, 0x86
	lsls r3, 2
	adds r1, r2, r3
	movs r3, 0
	strh r3, [r1]
	ldr r4, _081268CC @ =0x0000021a
	adds r1, r2, r4
	strh r3, [r1]
	ldr r1, _081268D0 @ =gPartyMenu
	ldrb r1, [r1, 0x9]
	lsls r1, 24
	asrs r1, 24
	movs r3, 0x87
	lsls r3, 2
	adds r2, r3
	strh r1, [r2]
	bl UseSacredAsh
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081268C8: .4byte sPartyMenuInternal
_081268CC: .4byte 0x0000021a
_081268D0: .4byte gPartyMenu
	thumb_func_end ItemUseCB_SacredAsh

	thumb_func_start UseSacredAsh
UseSacredAsh: @ 81268D4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	mov r9, r4
	ldr r6, _08126930 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r6, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08126934 @ =gPlayerParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08126920
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldrb r0, [r6, 0x9]
	ldr r1, _08126938 @ =gSpecialVar_ItemId
	ldrh r1, [r1]
	movs r2, 0
	bl ExecuteTableBasedItemEffect_
	lsls r0, 24
	cmp r0, 0
	beq _08126944
_08126920:
	ldr r0, _0812693C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08126940 @ =Task_SacredAshLoop
	str r0, [r1]
	b _081269EE
	.align 2, 0
_08126930: .4byte gPartyMenu
_08126934: .4byte gPlayerParty
_08126938: .4byte gSpecialVar_ItemId
_0812693C: .4byte gTasks
_08126940: .4byte Task_SacredAshLoop
_08126944:
	movs r0, 0x1
	bl PlaySE
	ldr r7, _08126A00 @ =sPartyMenuInternal
	ldr r0, [r7]
	ldr r1, _08126A04 @ =0x0000021a
	mov r10, r1
	add r0, r10
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _08126960
	ldr r0, _08126A08 @ =gUnknown_203B0D0
	str r5, [r0]
_08126960:
	ldr r4, _08126A0C @ =sPartyMenuBoxes
	movs r0, 0x9
	ldrsb r0, [r6, r0]
	lsls r0, 4
	ldr r1, [r4]
	adds r1, r0
	adds r0, r5, 0
	bl SetPartyMonAilmentGfx
	ldr r2, _08126A10 @ =gSprites
	movs r0, 0x9
	ldrsb r0, [r6, r0]
	ldr r1, [r4]
	lsls r0, 4
	adds r3, r0, r1
	ldrb r1, [r3, 0xC]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _0812699C
	adds r0, r5, 0
	adds r1, r3, 0
	movs r2, 0x1
	bl DisplayPartyPokemonLevelCheck
_0812699C:
	ldr r0, [r7]
	movs r1, 0x87
	lsls r1, 2
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl AnimatePartySlot
	ldrb r0, [r6, 0x9]
	movs r1, 0x1
	bl AnimatePartySlot
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	mov r2, r8
	subs r3, r2
	lsls r3, 16
	asrs r3, 16
	ldrb r1, [r6, 0x9]
	ldr r0, _08126A14 @ =Task_SacredAshDisplayHPRestored
	str r0, [sp]
	mov r0, r9
	movs r2, 0x1
	bl PartyMenuModifyHP
	mov r0, r9
	movs r1, 0
	mov r2, r8
	bl ResetHPTaskData
	ldr r0, [r7]
	movs r2, 0x86
	lsls r2, 2
	adds r1, r0, r2
	movs r2, 0x1
	strh r2, [r1]
	add r0, r10
	strh r2, [r0]
_081269EE:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126A00: .4byte sPartyMenuInternal
_08126A04: .4byte 0x0000021a
_08126A08: .4byte gUnknown_203B0D0
_08126A0C: .4byte sPartyMenuBoxes
_08126A10: .4byte gSprites
_08126A14: .4byte Task_SacredAshDisplayHPRestored
	thumb_func_end UseSacredAsh

	thumb_func_start Task_SacredAshLoop
Task_SacredAshLoop: @ 8126A18
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08126AF6
	ldr r5, _08126A80 @ =sPartyMenuInternal
	ldr r2, [r5]
	movs r0, 0x86
	lsls r0, 2
	adds r1, r2, r0
	movs r3, 0
	ldrsh r0, [r1, r3]
	ldr r3, _08126A84 @ =gPartyMenu
	cmp r0, 0x1
	bne _08126A4E
	movs r0, 0
	strh r0, [r1]
	movs r1, 0x9
	ldrsb r1, [r3, r1]
	movs r6, 0x87
	lsls r6, 2
	adds r0, r2, r6
	strh r1, [r0]
_08126A4E:
	adds r1, r3, 0
	ldrb r0, [r1, 0x9]
	adds r0, 0x1
	strb r0, [r1, 0x9]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x6
	bne _08126AF0
	ldr r0, [r5]
	ldr r1, _08126A88 @ =0x0000021a
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	cmp r1, 0
	bne _08126A94
	ldr r0, _08126A8C @ =gPartyMenuUseExitCallback
	strb r1, [r0]
	ldr r0, _08126A90 @ =gText_WontHaveEffect
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	b _08126ABE
	.align 2, 0
_08126A80: .4byte sPartyMenuInternal
_08126A84: .4byte gPartyMenu
_08126A88: .4byte 0x0000021a
_08126A8C: .4byte gPartyMenuUseExitCallback
_08126A90: .4byte gText_WontHaveEffect
_08126A94:
	ldr r1, _08126AD4 @ =gPartyMenuUseExitCallback
	movs r0, 0x1
	strb r0, [r1]
	ldrb r1, [r3, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	beq _08126AB4
	ldr r0, _08126AD8 @ =gUnknown_203B0D0
	ldr r1, [r0]
	ldr r0, _08126ADC @ =gSpecialVar_ItemId
	ldrh r2, [r0]
	ldr r3, _08126AE0 @ =0x0000ffff
	movs r0, 0x4
	bl ItemUse_SetQuestLogEvent
_08126AB4:
	ldr r0, _08126ADC @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	movs r1, 0x1
	bl RemoveBagItem
_08126ABE:
	ldr r1, _08126AE4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126AE8 @ =Task_ClosePartyMenuAfterText
	str r1, [r0]
	ldr r1, _08126AEC @ =gPartyMenu
	movs r0, 0
	strb r0, [r1, 0x9]
	b _08126AF6
	.align 2, 0
_08126AD4: .4byte gPartyMenuUseExitCallback
_08126AD8: .4byte gUnknown_203B0D0
_08126ADC: .4byte gSpecialVar_ItemId
_08126AE0: .4byte 0x0000ffff
_08126AE4: .4byte gTasks
_08126AE8: .4byte Task_ClosePartyMenuAfterText
_08126AEC: .4byte gPartyMenu
_08126AF0:
	adds r0, r4, 0
	bl UseSacredAsh
_08126AF6:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end Task_SacredAshLoop

	thumb_func_start Task_SacredAshDisplayHPRestored
Task_SacredAshDisplayHPRestored: @ 8126AFC
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08126B44 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08126B48 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08126B4C @ =gStringVar1
	bl GetMonNickname
	ldr r4, _08126B50 @ =gStringVar4
	ldr r1, _08126B54 @ =gText_PkmnHPRestoredByVar2
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r1, _08126B58 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126B5C @ =Task_SacredAshLoop
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08126B44: .4byte gPartyMenu
_08126B48: .4byte gPlayerParty
_08126B4C: .4byte gStringVar1
_08126B50: .4byte gStringVar4
_08126B54: .4byte gText_PkmnHPRestoredByVar2
_08126B58: .4byte gTasks
_08126B5C: .4byte Task_SacredAshLoop
	thumb_func_end Task_SacredAshDisplayHPRestored

	thumb_func_start sub_8126B60
sub_8126B60: @ 8126B60
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x5
	bl PlaySE
	ldr r2, _08126BB0 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r2, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08126BB4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08126BB8 @ =gSpecialVar_ItemId
	ldrh r1, [r1]
	ldrb r2, [r2, 0x9]
	movs r3, 0
	bl PokemonUseItemEffects2
	lsls r0, 24
	cmp r0, 0
	beq _08126BC8
	ldr r1, _08126BBC @ =gPartyMenuUseExitCallback
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08126BC0 @ =gText_WontHaveEffect
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r1, _08126BC4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	str r5, [r0]
	b _08126BCE
	.align 2, 0
_08126BB0: .4byte gPartyMenu
_08126BB4: .4byte gPlayerParty
_08126BB8: .4byte gSpecialVar_ItemId
_08126BBC: .4byte gPartyMenuUseExitCallback
_08126BC0: .4byte gText_WontHaveEffect
_08126BC4: .4byte gTasks
_08126BC8:
	adds r0, r4, 0
	bl sub_8124DC0
_08126BCE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8126B60

	thumb_func_start ItemUseCB_EvolutionStone
ItemUseCB_EvolutionStone: @ 8126BD4
	push {r4,r5,lr}
	ldr r1, _08126C10 @ =gCB2_AfterEvolution
	ldr r4, _08126C14 @ =gPartyMenu
	ldr r0, [r4]
	str r0, [r1]
	ldrb r0, [r4, 0x9]
	ldr r5, _08126C18 @ =gSpecialVar_ItemId
	ldrh r1, [r5]
	movs r2, 0
	bl ExecuteTableBasedItemEffect_
	movs r1, 0x9
	ldrsb r1, [r4, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08126C1C @ =gPlayerParty
	adds r1, r0
	ldrh r2, [r5]
	ldr r3, _08126C20 @ =0x0000ffff
	movs r0, 0x4
	bl ItemUse_SetQuestLogEvent
	ldrh r0, [r5]
	movs r1, 0x1
	bl RemoveBagItem
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08126C10: .4byte gCB2_AfterEvolution
_08126C14: .4byte gPartyMenu
_08126C18: .4byte gSpecialVar_ItemId
_08126C1C: .4byte gPlayerParty
_08126C20: .4byte 0x0000ffff
	thumb_func_end ItemUseCB_EvolutionStone

	thumb_func_start sub_8126C24
sub_8126C24: @ 8126C24
	push {lr}
	bl IsNationalPokedexEnabled
	cmp r0, 0
	bne _08126C60
	ldr r0, _08126C54 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08126C58 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08126C5C @ =gSpecialVar_ItemId
	ldrh r2, [r1]
	movs r1, 0x2
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x97
	bls _08126C60
	movs r0, 0
	b _08126C62
	.align 2, 0
_08126C54: .4byte gPartyMenu
_08126C58: .4byte gPlayerParty
_08126C5C: .4byte gSpecialVar_ItemId
_08126C60:
	movs r0, 0x1
_08126C62:
	pop {r1}
	bx r1
	thumb_func_end sub_8126C24

	thumb_func_start GetItemEffectType
GetItemEffectType: @ 8126C68
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, r1, 0
	subs r2, 0xD
	lsls r0, r2, 16
	lsrs r0, 16
	cmp r0, 0xA5
	bls _08126C7C
	b _08126DBC
_08126C7C:
	cmp r1, 0xAF
	bne _08126C94
	ldr r0, _08126C8C @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _08126C90 @ =0x00003108
	adds r4, r0, r1
	b _08126C9C
	.align 2, 0
_08126C8C: .4byte gSaveBlock1Ptr
_08126C90: .4byte 0x00003108
_08126C94:
	ldr r1, _08126CC4 @ =gItemEffectTable
	lsls r0, r2, 2
	adds r0, r1
	ldr r4, [r0]
_08126C9C:
	ldrb r1, [r4]
	movs r5, 0x3F
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _08126CBE
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08126CBE
	ldrb r0, [r4, 0x2]
	cmp r0, 0
	bne _08126CBE
	ldrb r3, [r4, 0x3]
	movs r0, 0x80
	ands r0, r3
	cmp r0, 0
	beq _08126CC8
_08126CBE:
	movs r0, 0
	b _08126DC2
	.align 2, 0
_08126CC4: .4byte gItemEffectTable
_08126CC8:
	movs r2, 0x40
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _08126CD6
	movs r0, 0xA
	b _08126DC2
_08126CD6:
	adds r0, r2, 0
	ands r0, r3
	cmp r0, 0
	beq _08126CE2
	movs r0, 0x1
	b _08126DC2
_08126CE2:
	adds r2, r5, 0
	ands r2, r3
	cmp r2, 0
	bne _08126CF0
	lsrs r0, r1, 7
	cmp r0, 0
	beq _08126D32
_08126CF0:
	cmp r2, 0x20
	bne _08126CF8
	movs r0, 0x4
	b _08126DC2
_08126CF8:
	cmp r2, 0x10
	bne _08126D00
	movs r0, 0x3
	b _08126DC2
_08126D00:
	cmp r2, 0x8
	bne _08126D08
	movs r0, 0x5
	b _08126DC2
_08126D08:
	cmp r2, 0x4
	bne _08126D10
	movs r0, 0x6
	b _08126DC2
_08126D10:
	cmp r2, 0x2
	bne _08126D18
	movs r0, 0x7
	b _08126DC2
_08126D18:
	cmp r2, 0x1
	bne _08126D20
	movs r0, 0x8
	b _08126DC2
_08126D20:
	lsrs r0, r1, 7
	cmp r0, 0
	beq _08126D2E
	cmp r2, 0
	bne _08126D2E
	movs r0, 0x9
	b _08126DC2
_08126D2E:
	movs r0, 0xB
	b _08126DC2
_08126D32:
	ldrb r1, [r4, 0x4]
	movs r0, 0x44
	ands r0, r1
	adds r2, r1, 0
	cmp r0, 0
	beq _08126D42
	movs r0, 0x2
	b _08126DC2
_08126D42:
	movs r5, 0x2
	adds r0, r5, 0
	ands r0, r2
	cmp r0, 0
	beq _08126D50
	movs r0, 0xC
	b _08126DC2
_08126D50:
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r2
	cmp r0, 0
	beq _08126D5E
	movs r0, 0xD
	b _08126DC2
_08126D5E:
	ldrb r1, [r4, 0x5]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08126D6C
	movs r0, 0xE
	b _08126DC2
_08126D6C:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08126D78
	movs r0, 0xF
	b _08126DC2
_08126D78:
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _08126D84
	movs r0, 0x10
	b _08126DC2
_08126D84:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08126D90
	movs r0, 0x11
	b _08126DC2
_08126D90:
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _08126D9C
	movs r0, 0x12
	b _08126DC2
_08126D9C:
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _08126DA8
	movs r0, 0x13
	b _08126DC2
_08126DA8:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08126DB4
	movs r0, 0x14
	b _08126DC2
_08126DB4:
	movs r0, 0x18
	ands r0, r2
	cmp r0, 0
	bne _08126DC0
_08126DBC:
	movs r0, 0x16
	b _08126DC2
_08126DC0:
	movs r0, 0x15
_08126DC2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetItemEffectType

	thumb_func_start TryTutorSelectedMon
TryTutorSelectedMon: @ 8126DC8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08126E4C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08126E98
	ldr r7, _08126E50 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r7, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08126E54 @ =gPlayerParty
	adds r5, r1, r0
	movs r0, 0xE
	adds r0, r7
	mov r8, r0
	ldr r1, _08126E58 @ =gStringVar1
	adds r0, r5, 0
	bl GetMonNickname
	ldr r4, _08126E5C @ =gSpecialVar_0x8005
	ldrb r0, [r4]
	bl GetTutorMove
	strh r0, [r7, 0xE]
	ldr r0, _08126E60 @ =gStringVar2
	movs r1, 0xE
	ldrsh r2, [r7, r1]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _08126E64 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	movs r0, 0x2
	mov r1, r8
	strh r0, [r1, 0x2]
	ldrb r2, [r4]
	adds r0, r5, 0
	movs r1, 0
	bl CanMonLearnTMTutor
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08126E6C
	cmp r0, 0x2
	beq _08126E74
	ldrh r1, [r7, 0xE]
	adds r0, r5, 0
	bl GiveMoveToMon
	lsls r0, 16
	ldr r1, _08126E68 @ =0xffff0000
	cmp r0, r1
	beq _08126E84
	adds r0, r6, 0
	bl Task_LearnedMove
	b _08126E98
	.align 2, 0
_08126E4C: .4byte gPaletteFade
_08126E50: .4byte gPartyMenu
_08126E54: .4byte gPlayerParty
_08126E58: .4byte gStringVar1
_08126E5C: .4byte gSpecialVar_0x8005
_08126E60: .4byte gStringVar2
_08126E64: .4byte gMoveNames
_08126E68: .4byte 0xffff0000
_08126E6C:
	ldr r1, _08126E70 @ =gText_PkmnCantLearnMove
	b _08126E76
	.align 2, 0
_08126E70: .4byte gText_PkmnCantLearnMove
_08126E74:
	ldr r1, _08126E80 @ =gText_PkmnAlreadyKnows
_08126E76:
	adds r0, r6, 0
	bl DisplayLearnMoveMessageAndClose
	b _08126E98
	.align 2, 0
_08126E80: .4byte gText_PkmnAlreadyKnows
_08126E84:
	ldr r0, _08126EA4 @ =gText_PkmnNeedsToReplaceMove
	bl DisplayLearnMoveMessage
	ldr r1, _08126EA8 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126EAC @ =Task_ReplaceMoveYesNo
	str r1, [r0]
_08126E98:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126EA4: .4byte gText_PkmnNeedsToReplaceMove
_08126EA8: .4byte gTasks
_08126EAC: .4byte Task_ReplaceMoveYesNo
	thumb_func_end TryTutorSelectedMon

	thumb_func_start CB2_PartyMenuFromStartMenu
CB2_PartyMenuFromStartMenu: @ 8126EB0
	push {lr}
	sub sp, 0xC
	movs r0, 0
	str r0, [sp]
	ldr r0, _08126ED4 @ =Task_HandleChooseMonInput
	str r0, [sp, 0x4]
	ldr r0, _08126ED8 @ =CB2_ReturnToStartMenu
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl InitPartyMenu
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08126ED4: .4byte Task_HandleChooseMonInput
_08126ED8: .4byte CB2_ReturnToStartMenu
	thumb_func_end CB2_PartyMenuFromStartMenu

	thumb_func_start CB2_ChooseMonToGiveItem
CB2_ChooseMonToGiveItem: @ 8126EDC
	push {lr}
	sub sp, 0xC
	ldr r0, _08126EF8 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	bl GetPocketByItemId
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _08126F00
	cmp r0, 0x5
	beq _08126F08
	ldr r1, _08126EFC @ =CB2_ReturnToBagMenu
	b _08126F0A
	.align 2, 0
_08126EF8: .4byte gSpecialVar_ItemId
_08126EFC: .4byte CB2_ReturnToBagMenu
_08126F00:
	ldr r1, _08126F04 @ =sub_8124DA0
	b _08126F0A
	.align 2, 0
_08126F04: .4byte sub_8124DA0
_08126F08:
	ldr r1, _08126F30 @ =sub_8124DB0
_08126F0A:
	movs r0, 0x6
	str r0, [sp]
	ldr r0, _08126F34 @ =Task_HandleChooseMonInput
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0x5
	movs r3, 0
	bl InitPartyMenu
	ldr r1, _08126F38 @ =gPartyMenu
	ldr r0, _08126F3C @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	strh r0, [r1, 0xC]
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08126F30: .4byte sub_8124DB0
_08126F34: .4byte Task_HandleChooseMonInput
_08126F38: .4byte gPartyMenu
_08126F3C: .4byte gSpecialVar_ItemId
	thumb_func_end CB2_ChooseMonToGiveItem

	thumb_func_start TryGiveItemOrMailToSelectedMon
TryGiveItemOrMailToSelectedMon: @ 8126F40
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	ldr r5, _08126F80 @ =sPartyMenuItemId
	ldr r0, _08126F84 @ =gPartyMenu
	mov r9, r0
	ldrb r0, [r0, 0x9]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r7, _08126F88 @ =gPlayerParty
	adds r0, r7
	movs r1, 0xC
	bl GetMonData
	strh r0, [r5]
	lsls r0, 16
	cmp r0, 0
	bne _08126F8C
	adds r0, r4, 0
	bl GiveItemOrMailToSelectedMon
	b _08126FC4
	.align 2, 0
_08126F80: .4byte sPartyMenuItemId
_08126F84: .4byte gPartyMenu
_08126F88: .4byte gPlayerParty
_08126F8C:
	ldrh r0, [r5]
	bl ItemIsMail
	lsls r0, 24
	cmp r0, 0
	beq _08126FA0
	adds r0, r4, 0
	bl DisplayItemMustBeRemovedFirstMessage
	b _08126FC4
_08126FA0:
	mov r1, r9
	movs r0, 0x9
	ldrsb r0, [r1, r0]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r7
	ldrh r1, [r5]
	movs r2, 0x1
	bl DisplayAlreadyHoldingItemSwitchMessage
	ldr r1, _08126FD0 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126FD4 @ =Task_SwitchItemsFromBagYesNo
	str r1, [r0]
_08126FC4:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126FD0: .4byte gTasks
_08126FD4: .4byte Task_SwitchItemsFromBagYesNo
	thumb_func_end TryGiveItemOrMailToSelectedMon

	thumb_func_start GiveItemOrMailToSelectedMon
GiveItemOrMailToSelectedMon: @ 8126FD8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _08127004 @ =gPartyMenu
	ldrh r0, [r5, 0xC]
	bl ItemIsMail
	lsls r0, 24
	cmp r0, 0
	beq _08127010
	ldrh r0, [r5, 0xC]
	bl RemoveItemToGiveFromBag
	ldr r0, _08127008 @ =sPartyMenuInternal
	ldr r1, [r0]
	ldr r0, _0812700C @ =CB2_WriteMailToGiveMonFromBag
	str r0, [r1, 0x4]
	adds r0, r4, 0
	bl Task_ClosePartyMenu
	b _08127016
	.align 2, 0
_08127004: .4byte gPartyMenu
_08127008: .4byte sPartyMenuInternal
_0812700C: .4byte CB2_WriteMailToGiveMonFromBag
_08127010:
	adds r0, r4, 0
	bl GiveItemToSelectedMon
_08127016:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GiveItemOrMailToSelectedMon

	thumb_func_start GiveItemToSelectedMon
GiveItemToSelectedMon: @ 812701C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08127084 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08127078
	ldr r4, _08127088 @ =gPartyMenu
	ldrh r5, [r4, 0xC]
	movs r0, 0x9
	ldrsb r0, [r4, r0]
	movs r1, 0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r6, _0812708C @ =gPlayerParty
	adds r0, r6
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x1
	bl DisplayGaveHeldItemMessage
	movs r0, 0x9
	ldrsb r0, [r4, r0]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	adds r1, r5, 0
	bl GiveItemToMon
	adds r0, r5, 0
	bl RemoveItemToGiveFromBag
	ldr r1, _08127090 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _08127094 @ =Task_UpdateHeldItemSpriteAndClosePartyMenu
	str r1, [r0]
_08127078:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08127084: .4byte gPaletteFade
_08127088: .4byte gPartyMenu
_0812708C: .4byte gPlayerParty
_08127090: .4byte gTasks
_08127094: .4byte Task_UpdateHeldItemSpriteAndClosePartyMenu
	thumb_func_end GiveItemToSelectedMon

	thumb_func_start Task_UpdateHeldItemSpriteAndClosePartyMenu
Task_UpdateHeldItemSpriteAndClosePartyMenu: @ 8127098
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _081270D4 @ =gPartyMenu
	ldrb r4, [r0, 0x9]
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081270CC
	lsls r2, r4, 24
	asrs r2, 24
	movs r0, 0x64
	muls r0, r2
	ldr r1, _081270D8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _081270DC @ =sPartyMenuBoxes
	lsls r2, 4
	ldr r1, [r1]
	adds r1, r2
	bl UpdatePartyMonHeldItemSprite
	adds r0, r5, 0
	bl Task_ClosePartyMenu
_081270CC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081270D4: .4byte gPartyMenu
_081270D8: .4byte gPlayerParty
_081270DC: .4byte sPartyMenuBoxes
	thumb_func_end Task_UpdateHeldItemSpriteAndClosePartyMenu

	thumb_func_start CB2_WriteMailToGiveMonFromBag
CB2_WriteMailToGiveMonFromBag: @ 81270E0
	push {r4-r6,lr}
	ldr r4, _08127128 @ =gPartyMenu
	movs r0, 0x9
	ldrsb r0, [r4, r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0812712C @ =gPlayerParty
	adds r0, r5
	ldrh r1, [r4, 0xC]
	bl GiveItemToMon
	movs r0, 0x9
	ldrsb r0, [r4, r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0x40
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08127130 @ =gSaveBlock1Ptr
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	ldr r0, _08127134 @ =0x00002cd0
	adds r2, r0
	ldr r1, [r1]
	adds r1, r2
	ldr r2, _08127138 @ =CB2_ReturnToPartyOrBagMenuFromWritingMail
	movs r0, 0x4
	bl DoEasyChatScreen
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08127128: .4byte gPartyMenu
_0812712C: .4byte gPlayerParty
_08127130: .4byte gSaveBlock1Ptr
_08127134: .4byte 0x00002cd0
_08127138: .4byte CB2_ReturnToPartyOrBagMenuFromWritingMail
	thumb_func_end CB2_WriteMailToGiveMonFromBag

	thumb_func_start CB2_ReturnToPartyOrBagMenuFromWritingMail
CB2_ReturnToPartyOrBagMenuFromWritingMail: @ 812713C
	push {r4-r7,lr}
	sub sp, 0xC
	ldr r6, _0812718C @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r6, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08127190 @ =gPlayerParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, _08127194 @ =gSpecialVar_Result
	ldrh r0, [r0]
	cmp r0, 0
	bne _0812719C
	adds r0, r5, 0
	bl TakeMailFromMon
	ldr r4, _08127198 @ =sPartyMenuItemId
	adds r0, r5, 0
	movs r1, 0xC
	adds r2, r4, 0
	bl SetMonData
	ldrh r0, [r4]
	movs r1, 0x1
	bl RemoveBagItem
	adds r0, r7, 0
	bl ReturnGiveItemToBagOrPC
	ldr r0, [r6]
	bl SetMainCallback2
	b _081271B8
	.align 2, 0
_0812718C: .4byte gPartyMenu
_08127190: .4byte gPlayerParty
_08127194: .4byte gSpecialVar_Result
_08127198: .4byte sPartyMenuItemId
_0812719C:
	ldrb r0, [r6, 0x8]
	lsls r0, 28
	lsrs r0, 28
	ldrb r2, [r6, 0xB]
	movs r1, 0x7F
	str r1, [sp]
	ldr r1, _081271C0 @ =Task_DisplayGaveMailFromBagMessage
	str r1, [sp, 0x4]
	ldr r1, [r6]
	str r1, [sp, 0x8]
	movs r1, 0xFF
	movs r3, 0x1
	bl InitPartyMenu
_081271B8:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081271C0: .4byte Task_DisplayGaveMailFromBagMessage
	thumb_func_end CB2_ReturnToPartyOrBagMenuFromWritingMail

	thumb_func_start Task_DisplayGaveMailFromBagMessage
Task_DisplayGaveMailFromBagMessage: @ 81271C4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081271EC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812721E
	ldr r1, _081271F0 @ =sPartyMenuItemId
	ldrh r0, [r1]
	cmp r0, 0
	beq _081271F8
	ldr r0, _081271F4 @ =gPartyMenu
	ldrh r0, [r0, 0xC]
	ldrh r1, [r1]
	movs r2, 0
	bl DisplaySwitchedHeldItemMessage
	b _08127210
	.align 2, 0
_081271EC: .4byte gPaletteFade
_081271F0: .4byte sPartyMenuItemId
_081271F4: .4byte gPartyMenu
_081271F8:
	ldr r2, _08127224 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r2, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08127228 @ =gPlayerParty
	adds r0, r1
	ldrh r1, [r2, 0xC]
	movs r2, 0
	movs r3, 0x1
	bl DisplayGaveHeldItemMessage
_08127210:
	ldr r0, _0812722C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08127230 @ =Task_UpdateHeldItemSpriteAndClosePartyMenu
	str r0, [r1]
_0812721E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127224: .4byte gPartyMenu
_08127228: .4byte gPlayerParty
_0812722C: .4byte gTasks
_08127230: .4byte Task_UpdateHeldItemSpriteAndClosePartyMenu
	thumb_func_end Task_DisplayGaveMailFromBagMessage

	thumb_func_start Task_SwitchItemsFromBagYesNo
Task_SwitchItemsFromBagYesNo: @ 8127234
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08127258
	bl PartyMenuDisplayYesNoMenu
	ldr r0, _08127260 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08127264 @ =Task_HandleSwitchItemsFromBagYesNoInput
	str r0, [r1]
_08127258:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127260: .4byte gTasks
_08127264: .4byte Task_HandleSwitchItemsFromBagYesNoInput
	thumb_func_end Task_SwitchItemsFromBagYesNo

	thumb_func_start Task_HandleSwitchItemsFromBagYesNoInput
Task_HandleSwitchItemsFromBagYesNoInput: @ 8127268
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0812728E
	cmp r1, 0
	bgt _08127288
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08127328
	b _0812733C
_08127288:
	cmp r1, 0x1
	beq _0812732E
	b _0812733C
_0812728E:
	ldr r7, _081272C0 @ =gPartyMenu
	ldrh r4, [r7, 0xC]
	adds r0, r4, 0
	bl RemoveItemToGiveFromBag
	ldr r6, _081272C4 @ =sPartyMenuItemId
	ldrh r0, [r6]
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	cmp r0, 0
	bne _081272CC
	adds r0, r4, 0
	bl ReturnGiveItemToBagOrPC
	ldrh r0, [r6]
	bl BufferBagFullCantTakeItemMessage
	ldr r0, _081272C8 @ =gStringVar4
	movs r1, 0
	bl DisplayPartyMenuMessage
	b _0812730C
	.align 2, 0
_081272C0: .4byte gPartyMenu
_081272C4: .4byte sPartyMenuItemId
_081272C8: .4byte gStringVar4
_081272CC:
	adds r0, r4, 0
	bl ItemIsMail
	lsls r0, 24
	cmp r0, 0
	beq _081272F0
	ldr r0, _081272E8 @ =sPartyMenuInternal
	ldr r1, [r0]
	ldr r0, _081272EC @ =CB2_WriteMailToGiveMonFromBag
	str r0, [r1, 0x4]
	adds r0, r5, 0
	bl Task_ClosePartyMenu
	b _0812733C
	.align 2, 0
_081272E8: .4byte sPartyMenuInternal
_081272EC: .4byte CB2_WriteMailToGiveMonFromBag
_081272F0:
	movs r1, 0x9
	ldrsb r1, [r7, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0812731C @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	bl GiveItemToMon
	ldrh r1, [r6]
	adds r0, r4, 0
	movs r2, 0x1
	bl DisplaySwitchedHeldItemMessage
_0812730C:
	ldr r1, _08127320 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08127324 @ =Task_UpdateHeldItemSpriteAndClosePartyMenu
	str r1, [r0]
	b _0812733C
	.align 2, 0
_0812731C: .4byte gPlayerParty
_08127320: .4byte gTasks
_08127324: .4byte Task_UpdateHeldItemSpriteAndClosePartyMenu
_08127328:
	movs r0, 0x5
	bl PlaySE
_0812732E:
	ldr r0, _08127344 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08127348 @ =Task_UpdateHeldItemSpriteAndClosePartyMenu
	str r0, [r1]
_0812733C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08127344: .4byte gTasks
_08127348: .4byte Task_UpdateHeldItemSpriteAndClosePartyMenu
	thumb_func_end Task_HandleSwitchItemsFromBagYesNoInput

	thumb_func_start DisplayItemMustBeRemovedFirstMessage
DisplayItemMustBeRemovedFirstMessage: @ 812734C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08127378 @ =gUnknown_8416BFB
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r1, _0812737C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08127380 @ =Task_UpdateHeldItemSpriteAndClosePartyMenu
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127378: .4byte gUnknown_8416BFB
_0812737C: .4byte gTasks
_08127380: .4byte Task_UpdateHeldItemSpriteAndClosePartyMenu
	thumb_func_end DisplayItemMustBeRemovedFirstMessage

	thumb_func_start RemoveItemToGiveFromBag
RemoveItemToGiveFromBag: @ 8127384
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _0812739C @ =gPartyMenu
	ldrb r0, [r0, 0xB]
	cmp r0, 0x6
	bne _081273A0
	adds r0, r1, 0
	movs r1, 0x1
	bl RemoveItemFromPC
	b _081273A8
	.align 2, 0
_0812739C: .4byte gPartyMenu
_081273A0:
	adds r0, r1, 0
	movs r1, 0x1
	bl RemoveBagItem
_081273A8:
	pop {r0}
	bx r0
	thumb_func_end RemoveItemToGiveFromBag

	thumb_func_start ReturnGiveItemToBagOrPC
ReturnGiveItemToBagOrPC: @ 81273AC
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _081273C4 @ =gPartyMenu
	ldrb r0, [r0, 0xB]
	cmp r0, 0x5
	beq _081273C8
	adds r0, r1, 0
	movs r1, 0x1
	bl AddPCItem
	b _081273D0
	.align 2, 0
_081273C4: .4byte gPartyMenu
_081273C8:
	adds r0, r1, 0
	movs r1, 0x1
	bl AddBagItem
_081273D0:
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end ReturnGiveItemToBagOrPC

	thumb_func_start ChooseMonToGiveMailFromMailbox
ChooseMonToGiveMailFromMailbox: @ 81273D8
	push {lr}
	sub sp, 0xC
	movs r0, 0x6
	str r0, [sp]
	ldr r0, _081273FC @ =Task_HandleChooseMonInput
	str r0, [sp, 0x4]
	ldr r0, _08127400 @ =CB2_PlayerPC_ReturnFromPartyMenu
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0x7
	movs r3, 0
	bl InitPartyMenu
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_081273FC: .4byte Task_HandleChooseMonInput
_08127400: .4byte CB2_PlayerPC_ReturnFromPartyMenu
	thumb_func_end ChooseMonToGiveMailFromMailbox

	thumb_func_start TryGiveMailToSelectedMon
TryGiveMailToSelectedMon: @ 8127404
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08127450 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08127454 @ =gPlayerParty
	adds r5, r1, r0
	ldr r1, _08127458 @ =gPartyMenuUseExitCallback
	movs r0, 0
	strb r0, [r1]
	ldr r2, _0812745C @ =gSaveBlock1Ptr
	ldr r0, _08127460 @ =gPlayerPcMenuManager
	ldrh r1, [r0]
	adds r1, 0x6
	ldrh r0, [r0, 0x2]
	adds r1, r0
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08127464 @ =0x00002cd0
	adds r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	adds r0, r5, 0
	movs r1, 0xC
	bl GetMonData
	cmp r0, 0
	beq _0812746C
	ldr r0, _08127468 @ =gText_PkmnHoldingItemCantHoldMail
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	b _08127482
	.align 2, 0
_08127450: .4byte gPartyMenu
_08127454: .4byte gPlayerParty
_08127458: .4byte gPartyMenuUseExitCallback
_0812745C: .4byte gSaveBlock1Ptr
_08127460: .4byte gPlayerPcMenuManager
_08127464: .4byte 0x00002cd0
_08127468: .4byte gText_PkmnHoldingItemCantHoldMail
_0812746C:
	adds r0, r5, 0
	adds r1, r4, 0
	bl GiveMailToMon2
	adds r0, r4, 0
	bl ClearMailStruct
	ldr r0, _0812749C @ =gText_MailTransferredFromMailbox
	movs r1, 0x1
	bl DisplayPartyMenuMessage
_08127482:
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r0, _081274A0 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _081274A4 @ =Task_UpdateHeldItemSpriteAndClosePartyMenu
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812749C: .4byte gText_MailTransferredFromMailbox
_081274A0: .4byte gTasks
_081274A4: .4byte Task_UpdateHeldItemSpriteAndClosePartyMenu
	thumb_func_end TryGiveMailToSelectedMon

	thumb_func_start InitChooseHalfPartyForBattle
InitChooseHalfPartyForBattle: @ 81274A8
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ClearSelectedPartyOrder
	movs r0, 0
	str r0, [sp]
	ldr r0, _081274EC @ =Task_HandleChooseMonInput
	str r0, [sp, 0x4]
	ldr r0, _081274F0 @ =gMain
	ldr r0, [r0, 0x8]
	str r0, [sp, 0x8]
	movs r0, 0x4
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl InitPartyMenu
	ldr r1, _081274F4 @ =gPartyMenu
	lsls r4, 6
	ldrb r2, [r1, 0x8]
	movs r0, 0x3F
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, 0x8]
	ldr r0, _081274F8 @ =Task_ValidateChosenHalfParty
	str r0, [r1, 0x4]
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081274EC: .4byte Task_HandleChooseMonInput
_081274F0: .4byte gMain
_081274F4: .4byte gPartyMenu
_081274F8: .4byte Task_ValidateChosenHalfParty
	thumb_func_end InitChooseHalfPartyForBattle

	thumb_func_start ClearSelectedPartyOrder
ClearSelectedPartyOrder: @ 81274FC
	push {lr}
	ldr r0, _0812750C @ =gSelectedOrderFromParty
	movs r1, 0
	movs r2, 0x3
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_0812750C: .4byte gSelectedOrderFromParty
	thumb_func_end ClearSelectedPartyOrder

	thumb_func_start GetPartySlotEntryStatus
GetPartySlotEntryStatus: @ 8127510
	push {r4,lr}
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0812752C @ =gPlayerParty
	adds r0, r1
	bl GetBattleEntryEligibility
	lsls r0, 24
	cmp r0, 0
	bne _08127530
	movs r0, 0x2
	b _08127548
	.align 2, 0
_0812752C: .4byte gPlayerParty
_08127530:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r0, 24
	bl HasPartySlotAlreadyBeenSelected
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08127546
	movs r0, 0
	b _08127548
_08127546:
	movs r0, 0x1
_08127548:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetPartySlotEntryStatus

	thumb_func_start GetBattleEntryEligibility
GetBattleEntryEligibility: @ 8127550
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0812757A
	ldr r0, _08127580 @ =gPartyMenu
	ldrb r0, [r0, 0x8]
	lsrs r1, r0, 6
	cmp r1, 0
	beq _08127584
	cmp r1, 0x1
	beq _08127592
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x1E
	bls _081275E0
_0812757A:
	movs r0, 0
	b _081275E2
	.align 2, 0
_08127580: .4byte gPartyMenu
_08127584:
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _081275E0
	b _0812757A
_08127592:
	ldr r0, _081275E8 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r2, _081275EC @ =0x0000055c
	adds r0, r2
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _081275AE
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x32
	bhi _0812757A
_081275AE:
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r3, _081275F0 @ =gBattleTowerBannedSpecies
	lsls r1, r5, 1
	adds r0, r1, r3
	ldrh r0, [r0]
	ldr r2, _081275F4 @ =0x0000ffff
	cmp r0, r2
	beq _081275E0
_081275C8:
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, r4
	beq _0812757A
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, r5, 1
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _081275C8
_081275E0:
	movs r0, 0x1
_081275E2:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081275E8: .4byte gSaveBlock2Ptr
_081275EC: .4byte 0x0000055c
_081275F0: .4byte gBattleTowerBannedSpecies
_081275F4: .4byte 0x0000ffff
	thumb_func_end GetBattleEntryEligibility

	thumb_func_start CheckBattleEntriesAndGetMessage
CheckBattleEntriesAndGetMessage: @ 81275F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08127618 @ =gPlayerParty
	mov r10, r0
	ldr r0, _0812761C @ =gPartyMenu
	ldrb r0, [r0, 0x8]
	lsrs r0, 6
	cmp r0, 0x1
	beq _08127620
	cmp r0, 0x2
	beq _081276E8
	b _08127700
	.align 2, 0
_08127618: .4byte gPlayerParty
_0812761C: .4byte gPartyMenu
_08127620:
	ldr r1, _0812762C @ =gSelectedOrderFromParty
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	bne _08127630
	movs r0, 0x11
	b _08127702
	.align 2, 0
_0812762C: .4byte gSelectedOrderFromParty
_08127630:
	movs r5, 0
_08127632:
	ldr r2, _081276DC @ =gSelectedOrderFromParty
	adds r4, r2, r5
	ldrb r0, [r4]
	movs r1, 0x64
	muls r0, r1
	subs r0, 0x64
	add r0, r10
	movs r1, 0xB
	bl GetMonData
	ldr r2, _081276E0 @ =sPartyMenuInternal
	ldr r1, [r2]
	ldr r2, _081276E4 @ =0x00000236
	adds r1, r2
	strh r0, [r1]
	ldrb r0, [r4]
	movs r1, 0x64
	muls r0, r1
	subs r0, 0x64
	add r0, r10
	movs r1, 0xC
	bl GetMonData
	ldr r2, _081276E0 @ =sPartyMenuInternal
	ldr r1, [r2]
	movs r2, 0x8D
	lsls r2, 2
	adds r1, r2
	strh r0, [r1]
	adds r1, r5, 0x1
	lsls r0, r1, 24
	lsrs r5, r0, 24
	mov r9, r1
	cmp r5, 0x2
	bhi _081276D0
	ldr r0, _081276E0 @ =sPartyMenuInternal
	mov r8, r0
	movs r7, 0x64
_0812767E:
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _081276E4 @ =0x00000236
	adds r0, r2
	movs r1, 0
	ldrsh r4, [r0, r1]
	ldr r2, _081276DC @ =gSelectedOrderFromParty
	adds r6, r2, r5
	ldrb r0, [r6]
	muls r0, r7
	subs r0, 0x64
	add r0, r10
	movs r1, 0xB
	bl GetMonData
	cmp r4, r0
	beq _081276F8
	mov r1, r8
	ldr r0, [r1]
	movs r2, 0x8D
	lsls r2, 2
	adds r1, r0, r2
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _081276C6
	adds r4, r0, 0
	ldrb r0, [r6]
	muls r0, r7
	subs r0, 0x64
	add r0, r10
	movs r1, 0xC
	bl GetMonData
	cmp r4, r0
	beq _081276FC
_081276C6:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _0812767E
_081276D0:
	mov r1, r9
	lsls r0, r1, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _08127632
	b _08127700
	.align 2, 0
_081276DC: .4byte gSelectedOrderFromParty
_081276E0: .4byte sPartyMenuInternal
_081276E4: .4byte 0x00000236
_081276E8:
	ldr r2, _081276F4 @ =gSelectedOrderFromParty
	ldrb r0, [r2, 0x1]
	cmp r0, 0
	bne _08127700
	movs r0, 0x12
	b _08127702
	.align 2, 0
_081276F4: .4byte gSelectedOrderFromParty
_081276F8:
	movs r0, 0x13
	b _08127702
_081276FC:
	movs r0, 0x14
	b _08127702
_08127700:
	movs r0, 0xFF
_08127702:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckBattleEntriesAndGetMessage

	thumb_func_start HasPartySlotAlreadyBeenSelected
HasPartySlotAlreadyBeenSelected: @ 8127710
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	ldr r3, _08127728 @ =gSelectedOrderFromParty
_0812771A:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _0812772C
	movs r0, 0x1
	b _08127738
	.align 2, 0
_08127728: .4byte gSelectedOrderFromParty
_0812772C:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bls _0812771A
	movs r0, 0
_08127738:
	pop {r1}
	bx r1
	thumb_func_end HasPartySlotAlreadyBeenSelected

	thumb_func_start Task_ValidateChosenHalfParty
Task_ValidateChosenHalfParty: @ 812773C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	bl CheckBattleEntriesAndGetMessage
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	beq _08127768
	movs r0, 0x1A
	bl PlaySE
	adds r0, r4, 0
	bl DisplayPartyMenuStdMessage
	ldr r0, _08127764 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	b _08127796
	.align 2, 0
_08127764: .4byte gTasks
_08127768:
	ldr r0, _08127780 @ =gSelectedOrderFromParty
	ldrb r0, [r0]
	cmp r0, 0
	beq _08127784
	movs r0, 0x5
	bl PlaySE
	adds r0, r5, 0
	bl Task_ClosePartyMenu
	b _0812779E
	.align 2, 0
_08127780: .4byte gSelectedOrderFromParty
_08127784:
	movs r0, 0x1A
	bl PlaySE
	movs r0, 0xE
	bl DisplayPartyMenuStdMessage
	ldr r0, _081277A4 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
_08127796:
	lsls r1, 3
	adds r1, r0
	ldr r0, _081277A8 @ =Task_ContinueChoosingHalfParty
	str r0, [r1]
_0812779E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081277A4: .4byte gTasks
_081277A8: .4byte Task_ContinueChoosingHalfParty
	thumb_func_end Task_ValidateChosenHalfParty

	thumb_func_start Task_ContinueChoosingHalfParty
Task_ContinueChoosingHalfParty: @ 81277AC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081277E8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081277C6
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081277E0
_081277C6:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl DisplayPartyMenuStdMessage
	ldr r0, _081277EC @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _081277F0 @ =Task_HandleChooseMonInput
	str r0, [r1]
_081277E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081277E8: .4byte gMain
_081277EC: .4byte gTasks
_081277F0: .4byte Task_HandleChooseMonInput
	thumb_func_end Task_ContinueChoosingHalfParty

	thumb_func_start ChooseMonForMoveTutor
ChooseMonForMoveTutor: @ 81277F4
	push {lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	str r2, [sp]
	ldr r2, _08127818 @ =Task_HandleChooseMonInput
	str r2, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl InitPartyMenu
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08127818: .4byte Task_HandleChooseMonInput
	thumb_func_end ChooseMonForMoveTutor

	thumb_func_start sub_812781C
sub_812781C: @ 812781C
	push {lr}
	sub sp, 0xC
	ldr r0, _08127844 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	cmp r0, 0xE
	bhi _08127850
	movs r0, 0x4
	str r0, [sp]
	ldr r0, _08127848 @ =Task_HandleChooseMonInput
	str r0, [sp, 0x4]
	ldr r0, _0812784C @ =CB2_ReturnToFieldContinueScriptPlayMapMusic
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0xC
	movs r3, 0
	bl InitPartyMenu
	b _08127870
	.align 2, 0
_08127844: .4byte gSpecialVar_0x8005
_08127848: .4byte Task_HandleChooseMonInput
_0812784C: .4byte CB2_ReturnToFieldContinueScriptPlayMapMusic
_08127850:
	movs r0, 0x7F
	str r0, [sp]
	ldr r0, _08127878 @ =TryTutorSelectedMon
	str r0, [sp, 0x4]
	ldr r0, _0812787C @ =CB2_ReturnToFieldContinueScriptPlayMapMusic
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0xC
	movs r3, 0
	bl InitPartyMenu
	ldr r1, _08127880 @ =gPartyMenu
	ldr r0, _08127884 @ =gSpecialVar_0x8007
	ldrh r0, [r0]
	strb r0, [r1, 0x9]
_08127870:
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08127878: .4byte TryTutorSelectedMon
_0812787C: .4byte CB2_ReturnToFieldContinueScriptPlayMapMusic
_08127880: .4byte gPartyMenu
_08127884: .4byte gSpecialVar_0x8007
	thumb_func_end sub_812781C

	thumb_func_start ChooseMonForWirelessMinigame
ChooseMonForWirelessMinigame: @ 8127888
	push {lr}
	sub sp, 0xC
	movs r0, 0x1
	str r0, [sp]
	ldr r0, _081278AC @ =Task_HandleChooseMonInput
	str r0, [sp, 0x4]
	ldr r0, _081278B0 @ =CB2_ReturnToFieldContinueScriptPlayMapMusic
	str r0, [sp, 0x8]
	movs r0, 0xB
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl InitPartyMenu
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_081278AC: .4byte Task_HandleChooseMonInput
_081278B0: .4byte CB2_ReturnToFieldContinueScriptPlayMapMusic
	thumb_func_end ChooseMonForWirelessMinigame

	thumb_func_start GetPartyLayoutFromBattleType
GetPartyLayoutFromBattleType: @ 81278B4
	push {lr}
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	bne _081278C4
	movs r0, 0
	b _081278D6
_081278C4:
	bl IsMultiBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081278D4
	movs r0, 0x1
	b _081278D6
_081278D4:
	movs r0, 0x2
_081278D6:
	pop {r1}
	bx r1
	thumb_func_end GetPartyLayoutFromBattleType

	thumb_func_start OpenPartyMenuInTutorialBattle
OpenPartyMenuInTutorialBattle: @ 81278DC
	push {r4,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x8
	bl sub_80EB2E0
	lsls r0, 24
	cmp r0, 0
	bne _08127930
	ldr r0, _08127924 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08127930
	bl GetPartyLayoutFromBattleType
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x7F
	str r0, [sp]
	ldr r0, _08127928 @ =sub_8120C3C
	str r0, [sp, 0x4]
	ldr r0, _0812792C @ =SetCB2ToReshowScreenAfterMenu
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r2, r4, 0
	movs r3, 0
	bl InitPartyMenu
	movs r0, 0x8
	bl sub_80EB2F4
	b _08127950
	.align 2, 0
_08127924: .4byte gBattleTypeFlags
_08127928: .4byte sub_8120C3C
_0812792C: .4byte SetCB2ToReshowScreenAfterMenu
_08127930:
	bl GetPartyLayoutFromBattleType
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	str r0, [sp]
	ldr r0, _08127960 @ =Task_HandleChooseMonInput
	str r0, [sp, 0x4]
	ldr r0, _08127964 @ =SetCB2ToReshowScreenAfterMenu
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r2, r4, 0
	movs r3, 0
	bl InitPartyMenu
_08127950:
	bl nullsub_44
	bl UpdatePartyToBattleOrder
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127960: .4byte Task_HandleChooseMonInput
_08127964: .4byte SetCB2ToReshowScreenAfterMenu
	thumb_func_end OpenPartyMenuInTutorialBattle

	thumb_func_start OpenPartyMenuInBattle
OpenPartyMenuInBattle: @ 8127968
	push {lr}
	sub sp, 0xC
	bl GetPartyLayoutFromBattleType
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	str r0, [sp]
	ldr r0, _0812799C @ =sub_8120EBC
	str r0, [sp, 0x4]
	ldr r0, _081279A0 @ =SetCB2ToReshowScreenAfterMenu
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl InitPartyMenu
	bl nullsub_44
	bl UpdatePartyToBattleOrder
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_0812799C: .4byte sub_8120EBC
_081279A0: .4byte SetCB2ToReshowScreenAfterMenu
	thumb_func_end OpenPartyMenuInBattle

	thumb_func_start ChooseMonForInBattleItem
ChooseMonForInBattleItem: @ 81279A4
	push {lr}
	sub sp, 0xC
	bl GetPartyLayoutFromBattleType
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x5
	str r0, [sp]
	ldr r0, _081279D8 @ =sub_8120FCC
	str r0, [sp, 0x4]
	ldr r0, _081279DC @ =sub_8107ECC
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0xE
	movs r3, 0
	bl InitPartyMenu
	bl nullsub_44
	bl UpdatePartyToBattleOrder
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_081279D8: .4byte sub_8120FCC
_081279DC: .4byte sub_8107ECC
	thumb_func_end ChooseMonForInBattleItem

	thumb_func_start sub_81279E0
sub_81279E0: @ 81279E0
	push {r4,lr}
	sub sp, 0xC
	movs r0, 0x8
	bl sub_80EB2E0
	lsls r0, 24
	cmp r0, 0
	bne _08127A30
	ldr r0, _08127A24 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08127A30
	bl GetPartyLayoutFromBattleType
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x7F
	str r0, [sp]
	ldr r0, _08127A28 @ =sub_8120C3C
	str r0, [sp, 0x4]
	ldr r0, _08127A2C @ =sub_8107ECC
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x3
	movs r3, 0
	bl InitPartyMenu
	movs r0, 0x8
	bl sub_80EB2F4
	b _08127A62
	.align 2, 0
_08127A24: .4byte gBattleTypeFlags
_08127A28: .4byte sub_8120C3C
_08127A2C: .4byte sub_8107ECC
_08127A30:
	ldr r0, _08127A74 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	bl GetPocketByItemId
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08127A78 @ =sub_8107ECC
	cmp r0, 0x5
	bne _08127A44
	ldr r4, _08127A7C @ =sub_8124DB0
_08127A44:
	bl GetPartyLayoutFromBattleType
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x5
	str r0, [sp]
	ldr r0, _08127A80 @ =Task_HandleChooseMonInput
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x3
	movs r3, 0
	bl InitPartyMenu
_08127A62:
	bl nullsub_44
	bl UpdatePartyToBattleOrder
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127A74: .4byte gSpecialVar_ItemId
_08127A78: .4byte sub_8107ECC
_08127A7C: .4byte sub_8124DB0
_08127A80: .4byte Task_HandleChooseMonInput
	thumb_func_end sub_81279E0

	thumb_func_start GetPartyMenuActionsTypeInBattle
GetPartyMenuActionsTypeInBattle: @ 8127A84
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08127AA4 @ =gPlayerParty + 100 @ &gPlayerParty[1]
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08127AA0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _08127AA8
_08127AA0:
	movs r0, 0x7
	b _08127ABA
	.align 2, 0
_08127AA4: .4byte gPlayerParty + 100 @ &gPlayerParty[1]
_08127AA8:
	ldr r0, _08127AB4 @ =gPartyMenu
	ldrb r0, [r0, 0xB]
	cmp r0, 0x1
	beq _08127AB8
	movs r0, 0x2
	b _08127ABA
	.align 2, 0
_08127AB4: .4byte gPartyMenu
_08127AB8:
	movs r0, 0x3
_08127ABA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetPartyMenuActionsTypeInBattle

	thumb_func_start TrySwitchInPokemon
TrySwitchInPokemon: @ 8127AC0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	bl GetCursorSelectionMonId
	lsls r0, 24
	lsrs r5, r0, 24
	bl IsMultiBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08127B08
	cmp r5, 0x1
	beq _08127AE6
	cmp r5, 0x4
	beq _08127AE6
	cmp r5, 0x5
	bne _08127B08
_08127AE6:
	ldr r4, _08127AFC @ =gStringVar1
	bl GetTrainerPartnerName
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldr r0, _08127B00 @ =gStringVar4
	ldr r1, _08127B04 @ =gUnknown_8416A98
	b _08127C86
	.align 2, 0
_08127AFC: .4byte gStringVar1
_08127B00: .4byte gStringVar4
_08127B04: .4byte gUnknown_8416A98
_08127B08:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08127B2C @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _08127B3C
	ldr r1, _08127B30 @ =gStringVar1
	adds r0, r4, 0
	bl GetMonNickname
	ldr r0, _08127B34 @ =gStringVar4
	ldr r1, _08127B38 @ =gUnknown_8416A75
	b _08127C86
	.align 2, 0
_08127B2C: .4byte gPlayerParty
_08127B30: .4byte gStringVar1
_08127B34: .4byte gStringVar4
_08127B38: .4byte gUnknown_8416A75
_08127B3C:
	movs r4, 0
	b _08127B68
_08127B40:
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08127B62
	adds r0, r5, 0
	bl GetPartyIdFromBattleSlot
	lsls r0, 24
	ldr r2, _08127B90 @ =gBattlerPartyIndexes
	lsls r1, r4, 1
	adds r1, r2
	lsrs r0, 24
	ldrh r1, [r1]
	cmp r0, r1
	beq _08127C40
_08127B62:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_08127B68:
	ldr r0, _08127B94 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r4, r0
	bcc _08127B40
	movs r7, 0x64
	adds r0, r5, 0
	muls r0, r7
	ldr r1, _08127B98 @ =gPlayerParty
	mov r8, r1
	adds r6, r0, r1
	adds r0, r6, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _08127BA4
	ldr r0, _08127B9C @ =gStringVar4
	ldr r1, _08127BA0 @ =gUnknown_8416ACB
	b _08127C86
	.align 2, 0
_08127B90: .4byte gBattlerPartyIndexes
_08127B94: .4byte gBattlersCount
_08127B98: .4byte gPlayerParty
_08127B9C: .4byte gStringVar4
_08127BA0: .4byte gUnknown_8416ACB
_08127BA4:
	adds r0, r5, 0
	bl GetPartyIdFromBattleSlot
	ldr r1, _08127BC8 @ =gBattleStruct
	ldr r1, [r1]
	adds r1, 0x8B
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _08127BD8
	ldr r1, _08127BCC @ =gStringVar1
	adds r0, r6, 0
	bl GetMonNickname
	ldr r0, _08127BD0 @ =gStringVar4
	ldr r1, _08127BD4 @ =gUnknown_8416A55
	b _08127C86
	.align 2, 0
_08127BC8: .4byte gBattleStruct
_08127BCC: .4byte gStringVar1
_08127BD0: .4byte gStringVar4
_08127BD4: .4byte gUnknown_8416A55
_08127BD8:
	ldr r0, _08127BE8 @ =gPartyMenu
	ldrb r0, [r0, 0xB]
	cmp r0, 0x4
	bne _08127BEC
	bl SetMonPreventsSwitchingString
	b _08127C8A
	.align 2, 0
_08127BE8: .4byte gPartyMenu
_08127BEC:
	cmp r0, 0x2
	beq _08127C64
	adds r0, r5, 0
	bl GetPartyIdFromBattleSlot
	ldr r1, _08127C30 @ =gSelectedMonPartyId
	strb r0, [r1]
	ldr r1, _08127C34 @ =gPartyMenuUseExitCallback
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _08127C38 @ =gBattlerPartyIndexes
	ldr r0, _08127C3C @ =gBattlerInMenuId
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl SwitchPartyMonSlots
	adds r0, r4, 0
	muls r0, r7
	add r0, r8
	adds r1, r6, 0
	bl SwapPartyPokemon
	movs r0, 0x1
	b _08127C8C
	.align 2, 0
_08127C30: .4byte gSelectedMonPartyId
_08127C34: .4byte gPartyMenuUseExitCallback
_08127C38: .4byte gBattlerPartyIndexes
_08127C3C: .4byte gBattlerInMenuId
_08127C40:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08127C54 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08127C58 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _08127C5C @ =gStringVar4
	ldr r1, _08127C60 @ =gUnknown_8416A3A
	b _08127C86
	.align 2, 0
_08127C54: .4byte gPlayerParty
_08127C58: .4byte gStringVar1
_08127C5C: .4byte gStringVar4
_08127C60: .4byte gUnknown_8416A3A
_08127C64:
	ldr r0, _08127C98 @ =gBattlerInMenuId
	ldrb r0, [r0]
	ldr r1, _08127C9C @ =gBattlerPartyIndexes
	lsls r0, 1
	adds r0, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	lsls r0, 24
	lsrs r0, 24
	muls r0, r7
	add r0, r8
	ldr r1, _08127CA0 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _08127CA4 @ =gStringVar4
	ldr r1, _08127CA8 @ =gUnknown_8416A1E
_08127C86:
	bl StringExpandPlaceholders
_08127C8A:
	movs r0, 0
_08127C8C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08127C98: .4byte gBattlerInMenuId
_08127C9C: .4byte gBattlerPartyIndexes
_08127CA0: .4byte gStringVar1
_08127CA4: .4byte gStringVar4
_08127CA8: .4byte gUnknown_8416A1E
	thumb_func_end TrySwitchInPokemon

	thumb_func_start BufferBattlePartyCurrentOrder
BufferBattlePartyCurrentOrder: @ 8127CAC
	push {r4,lr}
	ldr r4, _08127CC8 @ =gBattlePartyCurrentOrder
	bl sub_80435E0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl BufferBattlePartyOrder
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127CC8: .4byte gBattlePartyCurrentOrder
	thumb_func_end BufferBattlePartyCurrentOrder

	thumb_func_start BufferBattlePartyOrder
BufferBattlePartyOrder: @ 8127CCC
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	bl IsMultiBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08127D02
	cmp r4, 0
	beq _08127CF4
	movs r0, 0x30
	strb r0, [r6]
	movs r0, 0x45
	strb r0, [r6, 0x1]
	movs r0, 0x12
	strb r0, [r6, 0x2]
	b _08127D9C
_08127CF4:
	movs r0, 0x3
	strb r0, [r6]
	movs r0, 0x12
	strb r0, [r6, 0x1]
	movs r0, 0x45
	strb r0, [r6, 0x2]
	b _08127D9C
_08127D02:
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	bne _08127D40
	movs r5, 0x1
	movs r0, 0
	bl GetBattlerAtPosition
	mov r2, sp
	ldr r1, _08127D3C @ =gBattlerPartyIndexes
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r0, [r0]
	strb r0, [r2]
	movs r4, 0
	mov r1, sp
_08127D26:
	ldrb r0, [r1]
	cmp r4, r0
	beq _08127D34
	mov r2, sp
	adds r0, r2, r5
	strb r4, [r0]
	adds r5, 0x1
_08127D34:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08127D26
	b _08127D84
	.align 2, 0
_08127D3C: .4byte gBattlerPartyIndexes
_08127D40:
	movs r5, 0x2
	movs r0, 0
	bl GetBattlerAtPosition
	mov r1, sp
	ldr r4, _08127DA4 @ =gBattlerPartyIndexes
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	ldrh r0, [r0]
	strb r0, [r1]
	movs r0, 0x2
	bl GetBattlerAtPosition
	mov r1, sp
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	ldrh r0, [r0]
	strb r0, [r1, 0x1]
	movs r4, 0
_08127D6A:
	ldrb r0, [r1]
	cmp r4, r0
	beq _08127D7E
	ldrb r0, [r1, 0x1]
	cmp r4, r0
	beq _08127D7E
	mov r2, sp
	adds r0, r2, r5
	strb r4, [r0]
	adds r5, 0x1
_08127D7E:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08127D6A
_08127D84:
	movs r4, 0
	mov r3, sp
_08127D88:
	adds r0, r6, r4
	ldrb r1, [r3]
	lsls r1, 4
	ldrb r2, [r3, 0x1]
	orrs r1, r2
	strb r1, [r0]
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	ble _08127D88
_08127D9C:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08127DA4: .4byte gBattlerPartyIndexes
	thumb_func_end BufferBattlePartyOrder

	thumb_func_start BufferBattlePartyCurrentOrderBySide
BufferBattlePartyCurrentOrderBySide: @ 8127DA8
	push {lr}
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08127DC8 @ =gBattleStruct
	lsls r3, r2, 1
	adds r3, r2
	adds r3, 0x60
	ldr r0, [r0]
	adds r0, r3
	bl BufferBattlePartyOrderBySide
	pop {r0}
	bx r0
	.align 2, 0
_08127DC8: .4byte gBattleStruct
	thumb_func_end BufferBattlePartyCurrentOrderBySide

	thumb_func_start BufferBattlePartyOrderBySide
BufferBattlePartyOrderBySide: @ 8127DCC
	push {r4-r7,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r0, r2, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08127DF4
	movs r0, 0
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x2
	b _08127E00
_08127DF4:
	movs r0, 0x1
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x3
_08127E00:
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r6, r0, 24
	bl IsMultiBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08127E34
	cmp r7, 0
	beq _08127E26
	movs r0, 0x30
	strb r0, [r5]
	movs r0, 0x45
	strb r0, [r5, 0x1]
	movs r0, 0x12
	strb r0, [r5, 0x2]
	b _08127EB6
_08127E26:
	movs r0, 0x3
	strb r0, [r5]
	movs r0, 0x12
	strb r0, [r5, 0x1]
	movs r0, 0x45
	strb r0, [r5, 0x2]
	b _08127EB6
_08127E34:
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	bne _08127E6C
	movs r3, 0x1
	mov r2, sp
	ldr r1, _08127E68 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	strb r0, [r2]
	movs r4, 0
	mov r1, sp
_08127E50:
	ldrb r0, [r1]
	cmp r4, r0
	beq _08127E5E
	mov r2, sp
	adds r0, r2, r3
	strb r4, [r0]
	adds r3, 0x1
_08127E5E:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08127E50
	b _08127E9E
	.align 2, 0
_08127E68: .4byte gBattlerPartyIndexes
_08127E6C:
	movs r3, 0x2
	mov r1, sp
	ldr r2, _08127EC0 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1]
	lsls r0, r6, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1, 0x1]
	movs r4, 0
_08127E84:
	ldrb r0, [r1]
	cmp r4, r0
	beq _08127E98
	ldrb r0, [r1, 0x1]
	cmp r4, r0
	beq _08127E98
	mov r2, sp
	adds r0, r2, r3
	strb r4, [r0]
	adds r3, 0x1
_08127E98:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08127E84
_08127E9E:
	movs r4, 0
	mov r3, sp
_08127EA2:
	adds r0, r5, r4
	ldrb r1, [r3]
	lsls r1, 4
	ldrb r2, [r3, 0x1]
	orrs r1, r2
	strb r1, [r0]
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	ble _08127EA2
_08127EB6:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08127EC0: .4byte gBattlerPartyIndexes
	thumb_func_end BufferBattlePartyOrderBySide

	thumb_func_start SwitchPartyOrderLinkMulti
SwitchPartyOrderLinkMulti: @ 8127EC4
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	movs r7, 0
	bl IsMultiBattle
	lsls r0, 24
	cmp r0, 0
	beq _08127F72
	ldr r0, _08127F28 @ =gBattleStruct
	lsls r1, r4, 1
	adds r1, r4
	adds r1, 0x60
	ldr r0, [r0]
	adds r4, r0, r1
	movs r2, 0
	add r6, sp
	mov r12, r6
	movs r6, 0xF
	mov r3, sp
_08127EF6:
	adds r1, r4, r2
	ldrb r0, [r1]
	lsrs r0, 4
	strb r0, [r3]
	adds r3, 0x1
	ldrb r1, [r1]
	adds r0, r6, 0
	ands r0, r1
	strb r0, [r3]
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, 0x2
	ble _08127EF6
	mov r0, r12
	ldrb r3, [r0]
	movs r2, 0
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, r5
	bne _08127F2C
	mov r0, sp
	ldrb r7, [r0]
	strb r3, [r0]
	b _08127F40
	.align 2, 0
_08127F28: .4byte gBattleStruct
_08127F2C:
	adds r2, 0x1
	cmp r2, 0x5
	bgt _08127F40
	mov r0, sp
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, r5
	bne _08127F2C
	adds r7, r0, 0
	strb r3, [r1]
_08127F40:
	cmp r2, 0x6
	beq _08127F72
	mov r0, r12
	strb r7, [r0]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, 4
	mov r1, sp
	ldrb r1, [r1, 0x1]
	orrs r0, r1
	strb r0, [r4]
	mov r0, sp
	ldrb r0, [r0, 0x2]
	lsls r0, 4
	mov r1, sp
	ldrb r1, [r1, 0x3]
	orrs r0, r1
	strb r0, [r4, 0x1]
	mov r0, sp
	ldrb r0, [r0, 0x4]
	lsls r0, 4
	mov r1, sp
	ldrb r1, [r1, 0x5]
	orrs r0, r1
	strb r0, [r4, 0x2]
_08127F72:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end SwitchPartyOrderLinkMulti

	thumb_func_start GetPartyIdFromBattleSlot
GetPartyIdFromBattleSlot: @ 8127F7C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0x1
	ands r1, r2
	lsrs r2, r0, 25
	cmp r1, 0
	beq _08127F9C
	ldr r0, _08127F98 @ =gBattlePartyCurrentOrder
	adds r0, r2, r0
	ldrb r0, [r0]
	movs r1, 0xF
	ands r1, r0
	b _08127FA4
	.align 2, 0
_08127F98: .4byte gBattlePartyCurrentOrder
_08127F9C:
	ldr r0, _08127FAC @ =gBattlePartyCurrentOrder
	adds r0, r2, r0
	ldrb r0, [r0]
	lsrs r1, r0, 4
_08127FA4:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_08127FAC: .4byte gBattlePartyCurrentOrder
	thumb_func_end GetPartyIdFromBattleSlot

	thumb_func_start SetPartyIdAtBattleSlot
SetPartyIdAtBattleSlot: @ 8127FB0
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	movs r1, 0x1
	ands r1, r3
	lsrs r3, r0, 25
	cmp r1, 0
	beq _08127FD8
	ldr r0, _08127FD4 @ =gBattlePartyCurrentOrder
	adds r0, r3, r0
	ldrb r2, [r0]
	movs r1, 0xF0
	ands r1, r2
	orrs r1, r4
	strb r1, [r0]
	b _08127FE8
	.align 2, 0
_08127FD4: .4byte gBattlePartyCurrentOrder
_08127FD8:
	ldr r2, _08127FF0 @ =gBattlePartyCurrentOrder
	adds r2, r3, r2
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	lsls r1, r4, 4
	orrs r0, r1
	strb r0, [r2]
_08127FE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127FF0: .4byte gBattlePartyCurrentOrder
	thumb_func_end SetPartyIdAtBattleSlot

	thumb_func_start SwitchPartyMonSlots
SwitchPartyMonSlots: @ 8127FF4
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	adds r0, r5, 0
	bl GetPartyIdFromBattleSlot
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl GetPartyIdFromBattleSlot
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl SetPartyIdAtBattleSlot
	adds r0, r6, 0
	adds r1, r4, 0
	bl SetPartyIdAtBattleSlot
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end SwitchPartyMonSlots

	thumb_func_start pokemon_order_func
pokemon_order_func: @ 8128030
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r3, 0
	movs r2, 0
	ldr r5, _08128058 @ =gBattlePartyCurrentOrder
_0812803C:
	adds r0, r3, r5
	ldrb r1, [r0]
	lsrs r0, r1, 4
	cmp r0, r4
	beq _08128054
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	movs r0, 0xF
	ands r0, r1
	cmp r0, r4
	bne _0812805C
_08128054:
	adds r0, r2, 0
	b _0812806E
	.align 2, 0
_08128058: .4byte gBattlePartyCurrentOrder
_0812805C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x2
	bls _0812803C
	movs r0, 0
_0812806E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end pokemon_order_func

	thumb_func_start UpdatePartyToBattleOrder
UpdatePartyToBattleOrder: @ 8128074
	push {r4-r6,lr}
	movs r4, 0x96
	lsls r4, 2
	adds r0, r4, 0
	bl Alloc
	adds r5, r0, 0
	ldr r1, _081280C0 @ =gPlayerParty
	adds r2, r4, 0
	bl memcpy
	movs r4, 0
	movs r6, 0x64
_0812808E:
	adds r0, r4, 0
	bl pokemon_order_func
	lsls r0, 24
	lsrs r0, 24
	muls r0, r6
	ldr r1, _081280C0 @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	movs r2, 0x64
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0812808E
	adds r0, r5, 0
	bl Free
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081280C0: .4byte gPlayerParty
	thumb_func_end UpdatePartyToBattleOrder

	thumb_func_start UpdatePartyToFieldOrder
UpdatePartyToFieldOrder: @ 81280C4
	push {r4-r6,lr}
	movs r4, 0x96
	lsls r4, 2
	adds r0, r4, 0
	bl Alloc
	adds r5, r0, 0
	ldr r1, _08128110 @ =gPlayerParty
	adds r2, r4, 0
	bl memcpy
	movs r4, 0
	movs r6, 0x64
_081280DE:
	adds r0, r4, 0
	bl GetPartyIdFromBattleSlot
	lsls r0, 24
	lsrs r0, 24
	muls r0, r6
	ldr r1, _08128110 @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	movs r2, 0x64
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _081280DE
	adds r0, r5, 0
	bl Free
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08128110: .4byte gPlayerParty
	thumb_func_end UpdatePartyToFieldOrder

	thumb_func_start SwitchAliveMonIntoLeadSlot
SwitchAliveMonIntoLeadSlot: @ 8128114
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0x1
	movs r7, 0x64
	ldr r0, _0812816C @ =gPlayerParty
	mov r8, r0
_08128122:
	adds r0, r6, 0
	bl GetPartyIdFromBattleSlot
	lsls r0, 24
	lsrs r0, 24
	muls r0, r7
	mov r1, r8
	adds r5, r0, r1
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08128170
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08128170
	movs r0, 0
	bl GetPartyIdFromBattleSlot
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	adds r1, r6, 0
	bl SwitchPartyMonSlots
	adds r0, r4, 0
	muls r0, r7
	add r0, r8
	adds r1, r5, 0
	bl SwapPartyPokemon
	b _0812817A
	.align 2, 0
_0812816C: .4byte gPlayerParty
_08128170:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x5
	bls _08128122
_0812817A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end SwitchAliveMonIntoLeadSlot

	thumb_func_start CB2_SetUpExitToBattleScreen
CB2_SetUpExitToBattleScreen: @ 8128184
	push {lr}
	bl CB2_SetUpReshowBattleScreenAfterMenu
	ldr r0, _08128194 @ =SetCB2ToReshowScreenAfterMenu
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08128194: .4byte SetCB2ToReshowScreenAfterMenu
	thumb_func_end CB2_SetUpExitToBattleScreen

	thumb_func_start ShowPartyMenuToShowcaseMultiBattleParty
ShowPartyMenuToShowcaseMultiBattleParty: @ 8128198
	push {lr}
	sub sp, 0xC
	movs r0, 0x7F
	str r0, [sp]
	ldr r0, _081281BC @ =Task_InitMultiPartnerPartySlideIn
	str r0, [sp, 0x4]
	ldr r0, _081281C0 @ =gMain
	ldr r0, [r0, 0x8]
	str r0, [sp, 0x8]
	movs r0, 0x5
	movs r1, 0x3
	movs r2, 0
	movs r3, 0
	bl InitPartyMenu
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_081281BC: .4byte Task_InitMultiPartnerPartySlideIn
_081281C0: .4byte gMain
	thumb_func_end ShowPartyMenuToShowcaseMultiBattleParty

	thumb_func_start Task_InitMultiPartnerPartySlideIn
Task_InitMultiPartnerPartySlideIn: @ 81281C4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081281F4 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r1, 0x80
	lsls r1, 1
	strh r1, [r4, 0x8]
	bl SlideMultiPartyMenuBoxSpritesOneStep
	movs r1, 0x80
	lsls r1, 9
	movs r0, 0x2
	movs r2, 0
	bl ChangeBgX
	ldr r0, _081281F8 @ =Task_MultiPartnerPartySlideIn
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081281F4: .4byte gTasks
_081281F8: .4byte Task_MultiPartnerPartySlideIn
	thumb_func_end Task_InitMultiPartnerPartySlideIn

	thumb_func_start Task_MultiPartnerPartySlideIn
Task_MultiPartnerPartySlideIn: @ 81281FC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r6, r5, 2
	adds r0, r6, r5
	lsls r0, 3
	ldr r1, _08128270 @ =gTasks+0x8
	adds r4, r0, r1
	ldr r0, _08128274 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08128268
	ldrh r0, [r4]
	subs r0, 0x8
	strh r0, [r4]
	adds r0, r5, 0
	bl SlideMultiPartyMenuBoxSpritesOneStep
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08128268
	movs r4, 0x3
	ldr r7, _08128278 @ =gMultiPartnerParty
_08128230:
	subs r0, r4, 0x3
	lsls r0, 5
	adds r0, r7
	ldrh r0, [r0]
	cmp r0, 0
	beq _0812824C
	ldr r0, _0812827C @ =sPartyMenuBoxes
	ldr r1, [r0]
	lsls r0, r4, 4
	adds r0, r1
	ldrb r0, [r0, 0x9]
	movs r1, 0
	bl AnimateSelectedPartyIcon
_0812824C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _08128230
	movs r0, 0x71
	bl PlaySE
	ldr r0, _08128280 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08128284 @ =Task_WaitAfterMultiPartnerPartySlideIn
	str r0, [r1]
_08128268:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08128270: .4byte gTasks+0x8
_08128274: .4byte gPaletteFade
_08128278: .4byte gMultiPartnerParty
_0812827C: .4byte sPartyMenuBoxes
_08128280: .4byte gTasks
_08128284: .4byte Task_WaitAfterMultiPartnerPartySlideIn
	thumb_func_end Task_MultiPartnerPartySlideIn

	thumb_func_start Task_WaitAfterMultiPartnerPartySlideIn
Task_WaitAfterMultiPartnerPartySlideIn: @ 8128288
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _081282B4 @ =gTasks+0x8
	adds r0, r1
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	lsls r1, 16
	movs r0, 0x80
	lsls r0, 17
	cmp r1, r0
	bne _081282AE
	adds r0, r2, 0
	bl Task_ClosePartyMenu
_081282AE:
	pop {r0}
	bx r0
	.align 2, 0
_081282B4: .4byte gTasks+0x8
	thumb_func_end Task_WaitAfterMultiPartnerPartySlideIn

	thumb_func_start MoveMultiPartyMenuBoxSprite
MoveMultiPartyMenuBoxSprite: @ 81282B8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 16
	lsrs r3, r1, 16
	cmp r1, 0
	blt _081282D2
	ldr r1, _081282D8 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	strh r3, [r0, 0x24]
_081282D2:
	pop {r0}
	bx r0
	.align 2, 0
_081282D8: .4byte gSprites
	thumb_func_end MoveMultiPartyMenuBoxSprite

	thumb_func_start SlideMultiPartyMenuBoxSpritesOneStep
SlideMultiPartyMenuBoxSpritesOneStep: @ 81282DC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08128364 @ =gTasks+0x8
	adds r5, r1, r0
	movs r6, 0x3
	ldr r7, _08128368 @ =sPartyMenuBoxes
_081282F0:
	ldr r0, _0812836C @ =gMultiPartnerParty
	subs r1, r6, 0x3
	lsls r1, 5
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _08128348
	ldr r0, [r7]
	lsls r4, r6, 4
	adds r0, r4, r0
	ldrb r0, [r0, 0x9]
	ldrh r1, [r5]
	subs r1, 0x8
	lsls r1, 16
	asrs r1, 16
	bl MoveMultiPartyMenuBoxSprite
	ldr r0, [r7]
	adds r0, r4, r0
	ldrb r0, [r0, 0xA]
	ldrh r1, [r5]
	subs r1, 0x8
	lsls r1, 16
	asrs r1, 16
	bl MoveMultiPartyMenuBoxSprite
	ldr r0, [r7]
	adds r0, r4, r0
	ldrb r0, [r0, 0xB]
	ldrh r1, [r5]
	subs r1, 0x8
	lsls r1, 16
	asrs r1, 16
	bl MoveMultiPartyMenuBoxSprite
	ldr r0, [r7]
	adds r4, r0
	ldrb r0, [r4, 0xC]
	ldrh r1, [r5]
	subs r1, 0x8
	lsls r1, 16
	asrs r1, 16
	bl MoveMultiPartyMenuBoxSprite
_08128348:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x5
	bls _081282F0
	movs r1, 0x80
	lsls r1, 4
	movs r0, 0x2
	movs r2, 0x1
	bl ChangeBgX
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08128364: .4byte gTasks+0x8
_08128368: .4byte sPartyMenuBoxes
_0812836C: .4byte gMultiPartnerParty
	thumb_func_end SlideMultiPartyMenuBoxSpritesOneStep

	thumb_func_start ChooseMonForDaycare
ChooseMonForDaycare: @ 8128370
	push {lr}
	sub sp, 0xC
	ldr r1, _08128398 @ =gFieldCallback2
	ldr r0, _0812839C @ =CB2_FadeFromPartyMenu
	str r0, [r1]
	movs r0, 0xF
	str r0, [sp]
	ldr r0, _081283A0 @ =Task_HandleChooseMonInput
	str r0, [sp, 0x4]
	ldr r0, _081283A4 @ =CB2_ReturnToField
	str r0, [sp, 0x8]
	movs r0, 0x6
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl InitPartyMenu
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08128398: .4byte gFieldCallback2
_0812839C: .4byte CB2_FadeFromPartyMenu
_081283A0: .4byte Task_HandleChooseMonInput
_081283A4: .4byte CB2_ReturnToField
	thumb_func_end ChooseMonForDaycare

	thumb_func_start ChoosePartyMonByMenuType
ChoosePartyMonByMenuType: @ 81283A8
	push {lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081283D4 @ =gFieldCallback2
	ldr r1, _081283D8 @ =CB2_FadeFromPartyMenu
	str r1, [r2]
	movs r1, 0
	str r1, [sp]
	ldr r1, _081283DC @ =Task_HandleChooseMonInput
	str r1, [sp, 0x4]
	ldr r1, _081283E0 @ =CB2_ReturnToField
	str r1, [sp, 0x8]
	movs r1, 0
	movs r2, 0xB
	movs r3, 0
	bl InitPartyMenu
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_081283D4: .4byte gFieldCallback2
_081283D8: .4byte CB2_FadeFromPartyMenu
_081283DC: .4byte Task_HandleChooseMonInput
_081283E0: .4byte CB2_ReturnToField
	thumb_func_end ChoosePartyMonByMenuType

	thumb_func_start CB2_FadeFromPartyMenu
CB2_FadeFromPartyMenu: @ 81283E4
	push {lr}
	bl sub_807DC00
	ldr r0, _081283F8 @ =Task_PartyMenuWaitForFade
	movs r1, 0xA
	bl CreateTask
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_081283F8: .4byte Task_PartyMenuWaitForFade
	thumb_func_end CB2_FadeFromPartyMenu

	thumb_func_start Task_PartyMenuWaitForFade
Task_PartyMenuWaitForFade: @ 81283FC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsWeatherNotFadingIn
	lsls r0, 24
	cmp r0, 0
	beq _0812841A
	adds r0, r4, 0
	bl DestroyTask
	bl ScriptContext2_Disable
	bl EnableBothScriptContexts
_0812841A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_PartyMenuWaitForFade

	.align 2, 0 @ Don't pad with nop.
