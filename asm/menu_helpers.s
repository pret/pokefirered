	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start DisplayMessageAndContinueTask
DisplayMessageAndContinueTask: @ 80BF474
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	ldr r4, [sp, 0x28]
	ldr r5, [sp, 0x2C]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	adds r6, r1, 0
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r7, r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080BF500 @ =gUnknown_20399D0
	strb r6, [r0]
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_810EDC4
	ldr r4, _080BF504 @ =gStringVar4
	ldr r0, [sp, 0x30]
	cmp r0, r4
	beq _080BF4B8
	adds r0, r4, 0
	ldr r1, [sp, 0x30]
	bl StringExpandPlaceholders
_080BF4B8:
	ldr r2, _080BF508 @ =gTextFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	adds r0, r6, 0
	adds r1, r7, 0
	adds r2, r4, 0
	adds r3, r5, 0
	bl AddTextPrinterParametrized
	ldr r1, _080BF50C @ =gUnknown_20399CC
	ldr r0, [sp, 0x34]
	str r0, [r1]
	ldr r1, _080BF510 @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BF514 @ =Task_ContinueTaskAfterMessagePrints
	str r1, [r0]
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BF500: .4byte gUnknown_20399D0
_080BF504: .4byte gStringVar4
_080BF508: .4byte gTextFlags
_080BF50C: .4byte gUnknown_20399CC
_080BF510: .4byte gTasks
_080BF514: .4byte Task_ContinueTaskAfterMessagePrints
	thumb_func_end DisplayMessageAndContinueTask

	thumb_func_start sub_80BF518
sub_80BF518: @ 80BF518
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl RunTextPrinters
	adds r0, r4, 0
	bl IsTextPrinterActive
	lsls r0, 16
	lsrs r0, 16
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BF518

	thumb_func_start Task_ContinueTaskAfterMessagePrints
Task_ContinueTaskAfterMessagePrints: @ 80BF534
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080BF558 @ =gUnknown_20399D0
	ldrb r0, [r0]
	bl sub_80BF518
	lsls r0, 16
	cmp r0, 0
	bne _080BF552
	ldr r0, _080BF55C @ =gUnknown_20399CC
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
_080BF552:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BF558: .4byte gUnknown_20399D0
_080BF55C: .4byte gUnknown_20399CC
	thumb_func_end Task_ContinueTaskAfterMessagePrints

	thumb_func_start sub_80BF560
sub_80BF560: @ 80BF560
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080BF586
	cmp r1, 0
	bgt _080BF580
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080BF5A8
	b _080BF5C0
_080BF580:
	cmp r1, 0x1
	beq _080BF5A8
	b _080BF5C0
_080BF586:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080BF5A0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BF5A4 @ =gUnknown_20399C8
	ldr r1, [r1]
	ldr r1, [r1]
	b _080BF5BE
	.align 2, 0
_080BF5A0: .4byte gTasks
_080BF5A4: .4byte gUnknown_20399C8
_080BF5A8:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080BF5C8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BF5CC @ =gUnknown_20399C8
	ldr r1, [r1]
	ldr r1, [r1, 0x4]
_080BF5BE:
	str r1, [r0]
_080BF5C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BF5C8: .4byte gTasks
_080BF5CC: .4byte gUnknown_20399C8
	thumb_func_end sub_80BF560

	thumb_func_start CreateYesNoMenuWithCallbacks
CreateYesNoMenuWithCallbacks: @ 80BF5D0
	push {r4-r7,lr}
	sub sp, 0xC
	adds r6, r0, 0
	adds r0, r1, 0
	adds r1, r2, 0
	adds r2, r3, 0
	ldr r3, [sp, 0x20]
	ldr r4, [sp, 0x24]
	ldr r5, [sp, 0x28]
	ldr r7, [sp, 0x2C]
	lsls r6, 24
	lsrs r6, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	bl CreateYesNoMenu
	ldr r0, _080BF624 @ =gUnknown_20399C8
	str r7, [r0]
	ldr r1, _080BF628 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BF62C @ =sub_80BF560
	str r1, [r0]
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BF624: .4byte gUnknown_20399C8
_080BF628: .4byte gTasks
_080BF62C: .4byte sub_80BF560
	thumb_func_end CreateYesNoMenuWithCallbacks

	thumb_func_start GetLRKeysState
GetLRKeysState: @ 80BF630
	push {lr}
	ldr r0, _080BF650 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _080BF666
	ldr r0, _080BF654 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _080BF658
	movs r0, 0x1
	b _080BF668
	.align 2, 0
_080BF650: .4byte gSaveBlock2Ptr
_080BF654: .4byte gMain
_080BF658:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080BF666
	movs r0, 0x2
	b _080BF668
_080BF666:
	movs r0, 0
_080BF668:
	pop {r1}
	bx r1
	thumb_func_end GetLRKeysState

	thumb_func_start sub_80BF66C
sub_80BF66C: @ 80BF66C
	push {lr}
	ldr r0, _080BF68C @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _080BF6A2
	ldr r0, _080BF690 @ =gMain
	ldrh r1, [r0, 0x30]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _080BF694
	movs r0, 0x1
	b _080BF6A4
	.align 2, 0
_080BF68C: .4byte gSaveBlock2Ptr
_080BF690: .4byte gMain
_080BF694:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080BF6A2
	movs r0, 0x2
	b _080BF6A4
_080BF6A2:
	movs r0, 0
_080BF6A4:
	pop {r1}
	bx r1
	thumb_func_end sub_80BF66C

	thumb_func_start sub_80BF6A8
sub_80BF6A8: @ 80BF6A8
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _080BF6D0
	ldr r0, _080BF6CC @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	movs r0, 0x80
	lsls r0, 1
	cmp r1, r0
	beq _080BF6C8
	bl InUnionRoom
	cmp r0, 0x1
	bne _080BF6D0
_080BF6C8:
	movs r0, 0
	b _080BF6D2
	.align 2, 0
_080BF6CC: .4byte gSaveBlock1Ptr
_080BF6D0:
	movs r0, 0x1
_080BF6D2:
	pop {r1}
	bx r1
	thumb_func_end sub_80BF6A8

	thumb_func_start itemid_80BF6D8_mail_related
itemid_80BF6D8_mail_related: @ 80BF6D8
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl is_c1_link_related_active
	cmp r0, 0x1
	beq _080BF6EE
	bl InUnionRoom
	cmp r0, 0x1
	bne _080BF700
_080BF6EE:
	adds r0, r4, 0
	bl itemid_is_mail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BF700
	movs r0, 0
	b _080BF702
_080BF700:
	movs r0, 0x1
_080BF702:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end itemid_80BF6D8_mail_related

	thumb_func_start sub_80BF708
sub_80BF708: @ 80BF708
	push {lr}
	bl is_c1_link_related_active
	cmp r0, 0x1
	beq _080BF71A
	ldr r0, _080BF720 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080BF724
_080BF71A:
	movs r0, 0x1
	b _080BF726
	.align 2, 0
_080BF720: .4byte gReceivedRemoteLinkPlayers
_080BF724:
	movs r0, 0
_080BF726:
	pop {r1}
	bx r1
	thumb_func_end sub_80BF708

	thumb_func_start sub_80BF72C
sub_80BF72C: @ 80BF72C
	push {lr}
	bl sub_80BF708
	lsls r0, 24
	cmp r0, 0
	beq _080BF742
	bl sub_8058244
	lsls r0, 24
	lsrs r0, 24
	b _080BF744
_080BF742:
	movs r0, 0
_080BF744:
	pop {r1}
	bx r1
	thumb_func_end sub_80BF72C

	thumb_func_start sub_80BF748
sub_80BF748: @ 80BF748
	push {lr}
	bl sub_80BF72C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BF75E
	bl sub_800B270
	cmp r0, 0x1
	bne _080BF762
_080BF75E:
	movs r0, 0x1
	b _080BF764
_080BF762:
	movs r0, 0
_080BF764:
	pop {r1}
	bx r1
	thumb_func_end sub_80BF748

	thumb_func_start VblankHblankHandlerSetZero
VblankHblankHandlerSetZero: @ 80BF768
	push {lr}
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	pop {r0}
	bx r0
	thumb_func_end VblankHblankHandlerSetZero

	thumb_func_start sub_80BF77C
sub_80BF77C: @ 80BF77C
	push {r4,lr}
	sub sp, 0xC
	bl InitBgReg
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	movs r1, 0xC0
	lsls r1, 19
	ldr r2, _080BF7BC @ =0x0100c000
	mov r0, sp
	bl CpuSet
	movs r4, 0
	str r4, [sp, 0x4]
	add r0, sp, 0x4
	movs r1, 0xE0
	lsls r1, 19
	ldr r2, _080BF7C0 @ =0x05000100
	bl CpuSet
	add r0, sp, 0x8
	strh r4, [r0]
	movs r1, 0xA0
	lsls r1, 19
	ldr r2, _080BF7C4 @ =0x01000200
	bl CpuSet
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BF7BC: .4byte 0x0100c000
_080BF7C0: .4byte 0x05000100
_080BF7C4: .4byte 0x01000200
	thumb_func_end sub_80BF77C

	thumb_func_start InitBgReg
InitBgReg: @ 80BF7C8
	push {lr}
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	movs r0, 0xE
	movs r1, 0
	bl SetGpuReg
	movs r0, 0xC
	movs r1, 0
	bl SetGpuReg
	movs r0, 0xA
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x8
	movs r1, 0
	bl SetGpuReg
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
	pop {r0}
	bx r0
	thumb_func_end InitBgReg

	thumb_func_start sub_80BF848
sub_80BF848: @ 80BF848
	push {r4-r6,lr}
	adds r2, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r5, r1, 0
	ldrh r4, [r2]
	adds r6, r4, 0
	ldr r0, _080BF87C @ =gMain
	ldrh r0, [r0, 0x30]
	movs r3, 0xF0
	ands r3, r0
	cmp r3, 0x40
	bne _080BF880
	adds r0, r4, 0x1
	strh r0, [r2]
	movs r3, 0
	ldrsh r0, [r2, r3]
	cmp r0, r1
	ble _080BF872
	movs r0, 0x1
	strh r0, [r2]
_080BF872:
	movs r0, 0
	ldrsh r1, [r2, r0]
_080BF876:
	lsls r0, r4, 16
	b _080BF8CA
	.align 2, 0
_080BF87C: .4byte gMain
_080BF880:
	cmp r3, 0x80
	bne _080BF896
	subs r0, r4, 0x1
	strh r0, [r2]
	lsls r0, 16
	cmp r0, 0
	bgt _080BF890
	strh r1, [r2]
_080BF890:
	movs r3, 0
	ldrsh r1, [r2, r3]
	b _080BF876
_080BF896:
	cmp r3, 0x10
	bne _080BF8B0
	adds r0, r4, 0
	adds r0, 0xA
	strh r0, [r2]
	movs r1, 0
	ldrsh r0, [r2, r1]
	cmp r0, r5
	ble _080BF8AA
	strh r5, [r2]
_080BF8AA:
	movs r3, 0
	ldrsh r1, [r2, r3]
	b _080BF876
_080BF8B0:
	cmp r3, 0x20
	bne _080BF8DA
	adds r0, r4, 0
	subs r0, 0xA
	strh r0, [r2]
	lsls r0, 16
	cmp r0, 0
	bgt _080BF8C4
	movs r0, 0x1
	strh r0, [r2]
_080BF8C4:
	movs r0, 0
	ldrsh r1, [r2, r0]
	lsls r0, r6, 16
_080BF8CA:
	asrs r0, 16
	cmp r1, r0
	beq _080BF8DA
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	b _080BF8DC
_080BF8DA:
	movs r0, 0
_080BF8DC:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80BF848

	thumb_func_start sub_80BF8E4
sub_80BF8E4: @ 80BF8E4
	push {lr}
	bl sub_80CBE00
	lsls r0, 24
	cmp r0, 0
	beq _080BF8F4
	movs r0, 0x5
	b _080BF8F6
_080BF8F4:
	movs r0, 0x4
_080BF8F6:
	pop {r1}
	bx r1
	thumb_func_end sub_80BF8E4

	.align 2, 0 @ Don't pad with nop.
