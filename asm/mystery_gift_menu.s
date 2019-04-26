	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start mevent_08142CE8
mevent_08142CE8: @ 8142CE8
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r0, r1, 0
	adds r5, r2, 0
	ldrb r4, [r6]
	cmp r4, 0x1
	beq _08142D1A
	cmp r4, 0x1
	bgt _08142D00
	cmp r4, 0
	beq _08142D06
	b _08142D46
_08142D00:
	cmp r4, 0x2
	beq _08142D30
	b _08142D46
_08142D06:
	cmp r0, 0
	beq _08142D0E
	bl AddTextPrinterToWindow1
_08142D0E:
	movs r0, 0x81
	lsls r0, 1
	bl PlayFanfare
	strh r4, [r5]
	b _08142D28
_08142D1A:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xF0
	bls _08142D46
_08142D28:
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	b _08142D46
_08142D30:
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08142D46
	movs r0, 0
	strb r0, [r6]
	bl ClearTextWindow
	movs r0, 0x1
	b _08142D48
_08142D46:
	movs r0, 0
_08142D48:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end mevent_08142CE8

	thumb_func_start mevent_message_stamp_card_etc_send_status
mevent_message_stamp_card_etc_send_status: @ 8142D50
	push {r4,lr}
	adds r3, r0, 0
	ldr r1, _08142D6C @ =gText_CommunicationError
	movs r0, 0
	str r0, [r3]
	adds r4, r1, 0
	cmp r2, 0xE
	bhi _08142E12
	lsls r0, r2, 2
	ldr r1, _08142D70 @ =_08142D74
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08142D6C: .4byte gText_CommunicationError
_08142D70: .4byte _08142D74
	.align 2, 0
_08142D74:
	.4byte _08142DB0
	.4byte _08142DB8
	.4byte _08142DC0
	.4byte _08142DC8
	.4byte _08142DD4
	.4byte _08142DDC
	.4byte _08142DE4
	.4byte _08142DEC
	.4byte _08142DF4
	.4byte _08142DFC
	.4byte _08142E10
	.4byte _08142E04
	.4byte _08142E08
	.4byte _08142E08
	.4byte _08142E10
_08142DB0:
	ldr r1, _08142DB4 @ =gText_NothingSentOver
	b _08142E12
	.align 2, 0
_08142DB4: .4byte gText_NothingSentOver
_08142DB8:
	ldr r1, _08142DBC @ =gText_RecordUploadedViaWireless
	b _08142E12
	.align 2, 0
_08142DBC: .4byte gText_RecordUploadedViaWireless
_08142DC0:
	ldr r1, _08142DC4 @ =gUnknown_841EB20
	b _08142DCA
	.align 2, 0
_08142DC4: .4byte gUnknown_841EB20
_08142DC8:
	ldr r1, _08142DD0 @ =gUnknown_841EB46
_08142DCA:
	movs r0, 0x1
	str r0, [r3]
	b _08142E12
	.align 2, 0
_08142DD0: .4byte gUnknown_841EB46
_08142DD4:
	ldr r1, _08142DD8 @ =gUnknown_841EB71
	b _08142E12
	.align 2, 0
_08142DD8: .4byte gUnknown_841EB71
_08142DDC:
	ldr r1, _08142DE0 @ =gUnknown_841EBAA
	b _08142E12
	.align 2, 0
_08142DE0: .4byte gUnknown_841EBAA
_08142DE4:
	ldr r1, _08142DE8 @ =gUnknown_841EC12
	b _08142E12
	.align 2, 0
_08142DE8: .4byte gUnknown_841EC12
_08142DEC:
	ldr r1, _08142DF0 @ =gUnknown_841EBDE
	b _08142E12
	.align 2, 0
_08142DF0: .4byte gUnknown_841EBDE
_08142DF4:
	ldr r1, _08142DF8 @ =gText_NoMoreRoomForStamps
	b _08142E12
	.align 2, 0
_08142DF8: .4byte gText_NoMoreRoomForStamps
_08142DFC:
	ldr r1, _08142E00 @ =gUnknown_841EC40
	b _08142E12
	.align 2, 0
_08142E00: .4byte gUnknown_841EC40
_08142E04:
	adds r1, r4, 0
	b _08142E12
_08142E08:
	ldr r1, _08142E0C @ =gUnknown_841EB8E
	b _08142E12
	.align 2, 0
_08142E0C: .4byte gUnknown_841EB8E
_08142E10:
	ldr r1, _08142E1C @ =gUnknown_841EC6A
_08142E12:
	adds r0, r1, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08142E1C: .4byte gUnknown_841EC6A
	thumb_func_end mevent_message_stamp_card_etc_send_status

	thumb_func_start sub_8142E20
sub_8142E20: @ 8142E20
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	adds r1, r2, 0
	adds r2, r3, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, sp
	bl mevent_message_stamp_card_etc_send_status
	adds r1, r0, 0
	ldr r0, [sp]
	cmp r0, 0
	bne _08142E46
	adds r0, r4, 0
	bl MG_PrintTextOnWindow1AndWaitButton
	b _08142E4E
_08142E46:
	adds r0, r4, 0
	adds r2, r5, 0
	bl mevent_08142CE8
_08142E4E:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8142E20

	thumb_func_start task_add_00_mystery_gift
task_add_00_mystery_gift: @ 8142E58
	push {r4,lr}
	ldr r0, _08142E98 @ =sub_8142EA0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _08142E9C @ =gTasks+0x8
	adds r4, r0
	movs r0, 0
	strb r0, [r4, 0x8]
	strb r0, [r4, 0x9]
	strb r0, [r4, 0xA]
	strb r0, [r4, 0xB]
	strb r0, [r4, 0xC]
	strb r0, [r4, 0xD]
	movs r1, 0
	strh r0, [r4]
	strh r0, [r4, 0x2]
	strh r0, [r4, 0x4]
	strh r0, [r4, 0x6]
	strb r1, [r4, 0xE]
	movs r0, 0x40
	bl AllocZeroed
	str r0, [r4, 0x10]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08142E98: .4byte sub_8142EA0
_08142E9C: .4byte gTasks+0x8
	thumb_func_end task_add_00_mystery_gift

	thumb_func_start sub_8142EA0
sub_8142EA0: @ 8142EA0
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08142EC4 @ =gTasks+0x8
	adds r5, r0, r1
	ldrb r0, [r5, 0x8]
	cmp r0, 0x25
	bls _08142EBA
	b _081435C6
_08142EBA:
	lsls r0, 2
	ldr r1, _08142EC8 @ =_08142ECC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08142EC4: .4byte gTasks+0x8
_08142EC8: .4byte _08142ECC
	.align 2, 0
_08142ECC:
	.4byte _08142F64
	.4byte _08142F6A
	.4byte _08142FAC
	.4byte _08142FE4
	.4byte _08143008
	.4byte _08143058
	.4byte _081430B8
	.4byte _081430EC
	.4byte _081430FC
	.4byte _08143174
	.4byte _08143198
	.4byte _081431B0
	.4byte _081431E0
	.4byte _0814321C
	.4byte _08143232
	.4byte _08143264
	.4byte _0814358C
	.4byte _081432C2
	.4byte _081432CC
	.4byte _081435C6
	.4byte _081432DE
	.4byte _0814332C
	.4byte _081433A2
	.4byte _081433D2
	.4byte _08143408
	.4byte _08143422
	.4byte _08143436
	.4byte _08143442
	.4byte _08143456
	.4byte _0814346A
	.4byte _0814349C
	.4byte _081434D0
	.4byte _08143514
	.4byte _08143528
	.4byte _08143544
	.4byte _08143558
	.4byte _0814358C
	.4byte _081435AC
_08142F64:
	movs r0, 0x1
	strb r0, [r5, 0x8]
	b _081435C6
_08142F6A:
	adds r0, r5, 0
	adds r0, 0x9
	adds r1, r5, 0
	movs r2, 0
	bl MysteryGift_HandleThreeOptionMenu
	adds r1, r0, 0
	cmp r1, 0x1
	beq _08142F94
	cmp r1, 0x1
	bcc _08142F8A
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _08142FA6
	b _081435C6
_08142F8A:
	movs r0, 0
	strb r0, [r5, 0xC]
	bl ValidateReceivedWonderCard
	b _08142F9A
_08142F94:
	strb r1, [r5, 0xC]
	bl ValidateReceivedWonderNews
_08142F9A:
	cmp r0, 0x1
	bne _08142FA0
	b _081434C4
_08142FA0:
	movs r0, 0x2
	strb r0, [r5, 0x8]
	b _081435C6
_08142FA6:
	movs r0, 0x25
	strb r0, [r5, 0x8]
	b _081435C6
_08142FAC:
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _08142FC0
	adds r0, r5, 0
	adds r0, 0x9
	ldr r1, _08142FBC @ =gUnknown_841E6A1
	b _08142FC6
	.align 2, 0
_08142FBC: .4byte gUnknown_841E6A1
_08142FC0:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r1, _08142FE0 @ =gUnknown_841E6DC
_08142FC6:
	bl MG_PrintTextOnWindow1AndWaitButton
	cmp r0, 0
	bne _08142FD0
	b _081435C6
_08142FD0:
	movs r0, 0x3
	strb r0, [r5, 0x8]
	movs r0, 0
	movs r1, 0x1
	bl PrintMysteryGiftOrEReaderTopMenu
	b _081435C6
	.align 2, 0
_08142FE0: .4byte gUnknown_841E6DC
_08142FE4:
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _08142FF8
	ldr r0, _08142FF4 @ =gUnknown_841E717
	bl AddTextPrinterToWindow1
	b _08142FFE
	.align 2, 0
_08142FF4: .4byte gUnknown_841E717
_08142FF8:
	ldr r0, _08143004 @ =gUnknown_841E741
	bl AddTextPrinterToWindow1
_08142FFE:
	movs r0, 0x4
	strb r0, [r5, 0x8]
	b _081435C6
	.align 2, 0
_08143004: .4byte gUnknown_841E741
_08143008:
	adds r0, r5, 0
	adds r0, 0x9
	adds r1, r5, 0
	movs r2, 0x1
	bl MysteryGift_HandleThreeOptionMenu
	adds r4, r0, 0
	cmp r4, 0x1
	beq _08143036
	cmp r4, 0x1
	bcc _08143028
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _08143042
	b _081435C6
_08143028:
	bl ClearTextWindow
	movs r1, 0
	movs r0, 0x5
	strb r0, [r5, 0x8]
	strb r1, [r5, 0xD]
	b _081435C6
_08143036:
	bl ClearTextWindow
	movs r0, 0x5
	strb r0, [r5, 0x8]
	strb r4, [r5, 0xD]
	b _081435C6
_08143042:
	bl ClearTextWindow
	ldrb r0, [r5, 0xC]
	bl ValidateCardOrNews
	cmp r0, 0
	beq _08143052
	b _081434C4
_08143052:
	strb r0, [r5, 0x8]
	movs r0, 0
	b _0814359E
_08143058:
	ldr r0, _08143074 @ =gStringVar1
	movs r1, 0xFF
	strb r1, [r0]
	ldr r0, _08143078 @ =gStringVar2
	strb r1, [r0]
	ldr r0, _0814307C @ =gStringVar3
	strb r1, [r0]
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	beq _08143080
	cmp r0, 0x1
	beq _0814309A
	b _081430B2
	.align 2, 0
_08143074: .4byte gStringVar1
_08143078: .4byte gStringVar2
_0814307C: .4byte gStringVar3
_08143080:
	ldrb r0, [r5, 0xD]
	cmp r0, 0x1
	bne _0814308E
	movs r0, 0x15
	bl sub_8117ED4
	b _081430B2
_0814308E:
	cmp r0, 0
	bne _081430B2
	movs r0, 0x15
	bl sub_8118290
	b _081430B2
_0814309A:
	ldrb r0, [r5, 0xD]
	cmp r0, 0x1
	bne _081430A8
	movs r0, 0x16
	bl sub_8117ED4
	b _081430B2
_081430A8:
	cmp r0, 0
	bne _081430B2
	movs r0, 0x16
	bl sub_8118290
_081430B2:
	movs r0, 0x6
	strb r0, [r5, 0x8]
	b _081435C6
_081430B8:
	ldr r0, _081430D0 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _081430D4
	movs r0, 0x1
	bl ClearScreenInBg0
	movs r0, 0x7
	strb r0, [r5, 0x8]
	bl mevent_srv_ish_do_init
	b _081435C6
	.align 2, 0
_081430D0: .4byte gReceivedRemoteLinkPlayers
_081430D4:
	ldr r0, _081430E8 @ =gSpecialVar_Result
	ldrh r0, [r0]
	cmp r0, 0x5
	beq _081430DE
	b _081435C6
_081430DE:
	movs r0, 0x1
	bl ClearScreenInBg0
	b _08143464
	.align 2, 0
_081430E8: .4byte gSpecialVar_Result
_081430EC:
	ldr r0, _081430F8 @ =gUnknown_841E794
	bl AddTextPrinterToWindow1
	movs r0, 0x8
	strb r0, [r5, 0x8]
	b _081435C6
	.align 2, 0
_081430F8: .4byte gUnknown_841E794
_081430FC:
	adds r0, r5, 0
	bl mevent_srv_ish_do_exec
	subs r0, 0x2
	cmp r0, 0x4
	bls _0814310A
	b _081435C6
_0814310A:
	lsls r0, 2
	ldr r1, _08143114 @ =_08143118
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08143114: .4byte _08143118
	.align 2, 0
_08143118:
	.4byte _08143156
	.4byte _08143150
	.4byte _0814315C
	.4byte _0814313A
	.4byte _0814312C
_0814312C:
	bl task_add_05_task_del_08FA224_when_no_RfuFunc
	ldrh r0, [r5]
	strb r0, [r5, 0xE]
	movs r0, 0xD
	strb r0, [r5, 0x8]
	b _081435C6
_0814313A:
	ldr r4, [r5, 0x10]
	bl mevent_srv_ish_get_buffer
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x40
	bl memcpy
	bl mevent_srv_ish_inc_flag
	b _081435C6
_08143150:
	movs r0, 0xA
	strb r0, [r5, 0x8]
	b _081435C6
_08143156:
	movs r0, 0x9
	strb r0, [r5, 0x8]
	b _081435C6
_0814315C:
	movs r0, 0xB
	strb r0, [r5, 0x8]
	ldr r0, _0814316C @ =gStringVar1
	ldr r1, _08143170 @ =gLinkPlayers + 8
	bl StringCopy
	b _081435C6
	.align 2, 0
_0814316C: .4byte gStringVar1
_08143170: .4byte gLinkPlayers + 8
_08143174:
	adds r4, r5, 0
	adds r4, 0x9
	bl mevent_srv_ish_get_buffer
	adds r3, r0, 0
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl mevent_message_print_and_prompt_yes_no
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0x1
	beq _0814320C
	cmp r1, 0x1
	bcs _081431FA
	movs r0, 0
	b _0814320E
_08143198:
	adds r4, r5, 0
	adds r4, 0x9
	bl mevent_srv_ish_get_buffer
	adds r1, r0, 0
	adds r0, r4, 0
	bl MG_PrintTextOnWindow1AndWaitButton
	cmp r0, 0
	bne _081431AE
	b _081435C6
_081431AE:
	b _08143212
_081431B0:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r3, _081431D8 @ =gUnknown_841E7F2
	adds r1, r5, 0
	movs r2, 0
	bl mevent_message_print_and_prompt_yes_no
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0x1
	beq _0814320C
	cmp r1, 0x1
	bcs _081431FA
	bl sub_8144144
	cmp r0, 0x1
	bne _081431DC
	movs r0, 0xC
	strb r0, [r5, 0x8]
	b _081435C6
	.align 2, 0
_081431D8: .4byte gUnknown_841E7F2
_081431DC:
	movs r0, 0
	b _0814320E
_081431E0:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r3, _08143204 @ =gUnknown_841E823
	adds r1, r5, 0
	movs r2, 0
	bl mevent_message_print_and_prompt_yes_no
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0x1
	beq _0814320C
	cmp r1, 0x1
	bcc _08143208
_081431FA:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0814320C
	b _081435C6
	.align 2, 0
_08143204: .4byte gUnknown_841E823
_08143208:
	movs r0, 0
	b _0814320E
_0814320C:
	movs r0, 0x1
_0814320E:
	bl mevent_srv_ish_set_param
_08143212:
	bl mevent_srv_ish_inc_flag
	movs r0, 0x7
	strb r0, [r5, 0x8]
	b _081435C6
_0814321C:
	bl sub_80FA4F8
	lsls r0, 24
	cmp r0, 0
	bne _08143228
	b _081435C6
_08143228:
	bl sub_80FCE44
	movs r0, 0xE
	strb r0, [r5, 0x8]
	b _081435C6
_08143232:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r1, _08143258 @ =gUnknown_841E7A3
	bl PrintStringAndWait2Seconds
	cmp r0, 0
	bne _08143242
	b _081435C6
_08143242:
	ldrb r0, [r5, 0xD]
	cmp r0, 0x1
	bne _08143250
	ldr r0, _0814325C @ =gStringVar1
	ldr r1, _08143260 @ =gLinkPlayers + 8
	bl StringCopy
_08143250:
	movs r0, 0xF
	strb r0, [r5, 0x8]
	b _081435C6
	.align 2, 0
_08143258: .4byte gUnknown_841E7A3
_0814325C: .4byte gStringVar1
_08143260: .4byte gLinkPlayers + 8
_08143264:
	ldrb r1, [r5, 0xC]
	ldrb r2, [r5, 0xD]
	ldrb r3, [r5, 0xE]
	mov r0, sp
	bl mevent_message
	adds r1, r0, 0
	cmp r1, 0
	bne _08143278
	ldr r1, [r5, 0x10]
_08143278:
	ldr r0, [sp]
	cmp r0, 0
	beq _0814328A
	adds r0, r5, 0
	adds r0, 0x9
	adds r2, r5, 0
	bl mevent_08142CE8
	b _08143292
_0814328A:
	adds r0, r5, 0
	adds r0, 0x9
	bl MG_PrintTextOnWindow1AndWaitButton
_08143292:
	adds r1, r0, 0
	cmp r1, 0
	bne _0814329A
	b _081435C6
_0814329A:
	ldrb r0, [r5, 0xE]
	cmp r0, 0x3
	bne _081432B4
	ldrb r0, [r5, 0xD]
	cmp r0, 0x1
	bne _081432AE
	movs r0, 0x1
	bl sub_8146C30
	b _081432B4
_081432AE:
	movs r0, 0x2
	bl sub_8146C30
_081432B4:
	ldr r0, [sp]
	cmp r0, 0
	beq _081432BC
	b _0814357C
_081432BC:
	strb r0, [r5, 0x8]
	movs r0, 0
	b _0814359E
_081432C2:
	adds r0, r5, 0
	adds r0, 0x9
	bl mevent_save_game
	b _08143596
_081432CC:
	adds r0, r5, 0
	adds r0, 0x9
	ldrb r1, [r5, 0xC]
	bl HandleLoadWonderCardOrNews
	cmp r0, 0
	bne _081432DC
	b _081435C6
_081432DC:
	b _0814339C
_081432DE:
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _08143308
	ldr r2, _08143304 @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081432F4
	movs r0, 0x15
	strb r0, [r5, 0x8]
_081432F4:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08143300
	b _081435C6
_08143300:
	b _08143326
	.align 2, 0
_08143304: .4byte gMain
_08143308:
	ldr r0, _0814331C @ =gMain
	ldrh r0, [r0, 0x2E]
	bl sub_8146884
	cmp r0, 0
	beq _08143320
	cmp r0, 0x1
	beq _08143326
	b _081435C6
	.align 2, 0
_0814331C: .4byte gMain
_08143320:
	bl sub_81467EC
	b _08143402
_08143326:
	movs r0, 0x1B
	strb r0, [r5, 0x8]
	b _081435C6
_0814332C:
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _08143346
	bl sub_8144054
	cmp r0, 0
	beq _0814335A
	adds r0, r5, 0
	adds r0, 0x9
	ldrb r2, [r5, 0xC]
	adds r1, r5, 0
	movs r3, 0
	b _08143364
_08143346:
	bl sub_8143E78
	cmp r0, 0
	beq _0814335A
	adds r0, r5, 0
	adds r0, 0x9
	ldrb r2, [r5, 0xC]
	adds r1, r5, 0
	movs r3, 0
	b _08143364
_0814335A:
	adds r0, r5, 0
	adds r0, 0x9
	ldrb r2, [r5, 0xC]
	adds r1, r5, 0
	movs r3, 0x1
_08143364:
	bl HandleMysteryGiftListMenu
	adds r1, r0, 0
	cmp r1, 0x1
	beq _08143386
	cmp r1, 0x1
	bcc _08143380
	cmp r1, 0x2
	beq _0814338C
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _08143392
	b _081435C6
_08143380:
	movs r0, 0x1C
	strb r0, [r5, 0x8]
	b _081435C6
_08143386:
	movs r0, 0x1D
	strb r0, [r5, 0x8]
	b _081435C6
_0814338C:
	movs r0, 0x16
	strb r0, [r5, 0x8]
	b _081435C6
_08143392:
	ldrb r0, [r5, 0xC]
	cmp r0, 0x1
	bne _0814339C
	bl sub_8146834
_0814339C:
	movs r0, 0x14
	strb r0, [r5, 0x8]
	b _081435C6
_081433A2:
	adds r0, r5, 0
	adds r0, 0x9
	ldrb r2, [r5, 0xC]
	adds r1, r5, 0
	bl mevent_message_prompt_discard
	adds r1, r0, 0
	cmp r1, 0
	beq _081433BE
	cmp r1, 0
	ble _081433EC
	cmp r1, 0x1
	beq _08143402
	b _081435C6
_081433BE:
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _081433FC
	bl sub_8144144
	cmp r0, 0x1
	bne _081433FC
	movs r0, 0x17
	strb r0, [r5, 0x8]
	b _081435C6
_081433D2:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r3, _081433F8 @ =gUnknown_841ECF9
	adds r1, r5, 0
	movs r2, 0x1
	bl mevent_message_print_and_prompt_yes_no
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0x1
	beq _08143402
	cmp r1, 0x1
	bcc _081433FC
_081433EC:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08143402
	b _081435C6
	.align 2, 0
_081433F8: .4byte gUnknown_841ECF9
_081433FC:
	movs r0, 0x18
	strb r0, [r5, 0x8]
	b _081435C6
_08143402:
	movs r0, 0x15
	strb r0, [r5, 0x8]
	b _081435C6
_08143408:
	ldrb r0, [r5, 0xC]
	movs r1, 0x1
	bl TearDownCardOrNews_ReturnToTopMenu
	cmp r0, 0
	bne _08143416
	b _081435C6
_08143416:
	ldrb r0, [r5, 0xC]
	bl DestroyNewsOrCard
	movs r0, 0x19
	strb r0, [r5, 0x8]
	b _081435C6
_08143422:
	adds r0, r5, 0
	adds r0, 0x9
	bl mevent_save_game
	cmp r0, 0
	bne _08143430
	b _081435C6
_08143430:
	movs r0, 0x1A
	strb r0, [r5, 0x8]
	b _081435C6
_08143436:
	adds r0, r5, 0
	adds r0, 0x9
	ldrb r1, [r5, 0xC]
	bl mevent_message_was_thrown_away
	b _08143596
_08143442:
	ldrb r0, [r5, 0xC]
	movs r1, 0
	bl TearDownCardOrNews_ReturnToTopMenu
	cmp r0, 0
	bne _08143450
	b _081435C6
_08143450:
	movs r0, 0
	strb r0, [r5, 0x8]
	b _081435C6
_08143456:
	ldrb r0, [r5, 0xC]
	movs r1, 0x1
	bl TearDownCardOrNews_ReturnToTopMenu
	cmp r0, 0
	bne _08143464
	b _081435C6
_08143464:
	movs r0, 0x3
	strb r0, [r5, 0x8]
	b _081435C6
_0814346A:
	ldrb r0, [r5, 0xC]
	movs r1, 0x1
	bl TearDownCardOrNews_ReturnToTopMenu
	cmp r0, 0
	bne _08143478
	b _081435C6
_08143478:
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	beq _08143484
	cmp r0, 0x1
	beq _0814348C
	b _08143492
_08143484:
	movs r0, 0x15
	bl sub_81179CC
	b _08143492
_0814348C:
	movs r0, 0x16
	bl sub_81179CC
_08143492:
	movs r0, 0x1
	strb r0, [r5, 0xD]
	movs r0, 0x1E
	strb r0, [r5, 0x8]
	b _081435C6
_0814349C:
	ldr r0, _081434B0 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _081434B4
	movs r0, 0x1
	bl ClearScreenInBg0
	movs r0, 0x1F
	strb r0, [r5, 0x8]
	b _081435C6
	.align 2, 0
_081434B0: .4byte gReceivedRemoteLinkPlayers
_081434B4:
	ldr r0, _081434CC @ =gSpecialVar_Result
	ldrh r0, [r0]
	cmp r0, 0x5
	beq _081434BE
	b _081435C6
_081434BE:
	movs r0, 0x1
	bl ClearScreenInBg0
_081434C4:
	movs r0, 0x12
	strb r0, [r5, 0x8]
	b _081435C6
	.align 2, 0
_081434CC: .4byte gSpecialVar_Result
_081434D0:
	ldr r0, _081434F0 @ =gStringVar1
	movs r1, 0xFF
	strb r1, [r0]
	ldr r0, _081434F4 @ =gStringVar2
	strb r1, [r0]
	ldr r0, _081434F8 @ =gStringVar3
	strb r1, [r0]
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _08143500
	ldr r0, _081434FC @ =gUnknown_841EAE7
	bl AddTextPrinterToWindow1
	bl mevent_srv_common_do_init_2
	b _0814350A
	.align 2, 0
_081434F0: .4byte gStringVar1
_081434F4: .4byte gStringVar2
_081434F8: .4byte gStringVar3
_081434FC: .4byte gUnknown_841EAE7
_08143500:
	ldr r0, _08143510 @ =gUnknown_841EB01
	bl AddTextPrinterToWindow1
	bl mevent_srv_common_do_init_1
_0814350A:
	movs r0, 0x20
	strb r0, [r5, 0x8]
	b _081435C6
	.align 2, 0
_08143510: .4byte gUnknown_841EB01
_08143514:
	adds r0, r5, 0
	bl mevent_srv_init_do_exec
	cmp r0, 0x3
	bne _081435C6
	ldrh r0, [r5]
	strb r0, [r5, 0xE]
	movs r0, 0x21
	strb r0, [r5, 0x8]
	b _081435C6
_08143528:
	bl task_add_05_task_del_08FA224_when_no_RfuFunc
	ldr r0, _0814353C @ =gStringVar1
	ldr r1, _08143540 @ =gLinkPlayers + 0x24
	bl StringCopy
	movs r0, 0x22
	strb r0, [r5, 0x8]
	b _081435C6
	.align 2, 0
_0814353C: .4byte gStringVar1
_08143540: .4byte gLinkPlayers + 0x24
_08143544:
	bl sub_80FA4F8
	lsls r0, 24
	cmp r0, 0
	beq _081435C6
	bl sub_80FCE44
	movs r0, 0x23
	strb r0, [r5, 0x8]
	b _081435C6
_08143558:
	adds r0, r5, 0
	adds r0, 0x9
	ldrb r2, [r5, 0xD]
	ldrb r3, [r5, 0xE]
	adds r1, r5, 0
	bl sub_8142E20
	cmp r0, 0
	beq _081435C6
	ldr r0, [r5, 0xC]
	ldr r1, _08143584 @ =0x00ffff00
	ands r0, r1
	ldr r1, _08143588 @ =0x00030100
	cmp r0, r1
	bne _0814359A
	movs r0, 0x3
	bl sub_8146C30
_0814357C:
	movs r0, 0x11
	strb r0, [r5, 0x8]
	b _081435C6
	.align 2, 0
_08143584: .4byte 0x00ffff00
_08143588: .4byte 0x00030100
_0814358C:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r1, _081435A8 @ =gText_CommunicationError
	bl MG_PrintTextOnWindow1AndWaitButton
_08143596:
	cmp r0, 0
	beq _081435C6
_0814359A:
	movs r0, 0
	strb r0, [r5, 0x8]
_0814359E:
	movs r1, 0
	bl PrintMysteryGiftOrEReaderTopMenu
	b _081435C6
	.align 2, 0
_081435A8: .4byte gText_CommunicationError
_081435AC:
	bl sub_80098B8
	bl sub_812B484
	ldr r0, [r5, 0x10]
	bl Free
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, _081435D0 @ =MainCB_FreeAllBuffersAndReturnToInitTitleScreen
	bl SetMainCallback2
_081435C6:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081435D0: .4byte MainCB_FreeAllBuffersAndReturnToInitTitleScreen
	thumb_func_end sub_8142EA0

	thumb_func_start sub_81435D4
sub_81435D4: @ 81435D4
	ldr r0, _081435D8 @ =0x0000019b
	bx lr
	.align 2, 0
_081435D8: .4byte 0x0000019b
	thumb_func_end sub_81435D4

	.align 2, 0 @ Don't pad with nop.
