	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start atk50_openpartyscreen
atk50_openpartyscreen: @ 80243EC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r7, 0
	movs r0, 0
	mov r9, r0
	ldr r6, _08024498 @ =gBattlescriptCurrInstr
	ldr r2, [r6]
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	mov r8, r1
	ldrb r1, [r2, 0x1]
	adds r0, r1, 0
	mov r12, r6
	cmp r0, 0x5
	beq _08024422
	b _080248B8
_08024422:
	ldr r0, _0802449C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x41
	ands r1, r0
	cmp r1, 0x1
	beq _08024510
	ldr r1, _080244A0 @ =gActiveBattler
	strb r7, [r1]
	ldr r0, _080244A4 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r7, r0
	bcc _0802443C
	b _080248A6
_0802443C:
	ldr r7, _080244A8 @ =gHitMarker
	ldr r6, _080244AC @ =gBitTable
	adds r4, r1, 0
	ldr r2, _080244B0 @ =gAbsentBattlerFlags
	mov r8, r2
_08024446:
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r0, r6
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r7]
	ands r0, r1
	cmp r0, 0
	beq _080244E8
	adds r0, r2, 0
	movs r1, 0x6
	movs r2, 0x6
	bl HasNoMonsToSwitch
	lsls r0, 24
	cmp r0, 0
	beq _080244B4
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	mov r2, r8
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r7]
	bics r0, r1
	str r0, [r7]
	movs r0, 0
	movs r1, 0x2
	bl BtlController_EmitLinkStandbyMsg
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	b _080244F6
	.align 2, 0
_08024498: .4byte gBattlescriptCurrInstr
_0802449C: .4byte gBattleTypeFlags
_080244A0: .4byte gActiveBattler
_080244A4: .4byte gBattlersCount
_080244A8: .4byte gHitMarker
_080244AC: .4byte gBitTable
_080244B0: .4byte gAbsentBattlerFlags
_080244B4:
	ldr r5, _080244E4 @ =gSpecialStatuses
	ldrb r0, [r4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _080244F6
	movs r0, 0x6
	bl sub_8024398
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	b _080244F6
	.align 2, 0
_080244E4: .4byte gSpecialStatuses
_080244E8:
	movs r0, 0
	movs r1, 0x2
	bl BtlController_EmitLinkStandbyMsg
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_080244F6:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _0802450C @ =gBattlersCount
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08024446
	b _080248A6
	.align 2, 0
_0802450C: .4byte gBattlersCount
_08024510:
	ands r0, r1
	cmp r0, 0
	bne _08024518
	b _080248A6
_08024518:
	ldr r0, _08024570 @ =gHitMarker
	mov r8, r0
	ldr r0, [r0]
	lsrs r5, r0, 28
	ldr r6, _08024574 @ =gBitTable
	ldr r0, [r6]
	ands r0, r5
	cmp r0, 0
	beq _080245CE
	ldr r4, _08024578 @ =gActiveBattler
	strb r7, [r4]
	movs r0, 0
	movs r1, 0x6
	movs r2, 0x6
	bl HasNoMonsToSwitch
	lsls r0, 24
	cmp r0, 0
	beq _08024580
	ldr r2, _0802457C @ =gAbsentBattlerFlags
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r1, [r0]
	lsls r1, 28
	mov r2, r8
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	movs r0, 0
	bl BtlController_EmitCmd42
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	b _080245CE
	.align 2, 0
_08024570: .4byte gHitMarker
_08024574: .4byte gBitTable
_08024578: .4byte gActiveBattler
_0802457C: .4byte gAbsentBattlerFlags
_08024580:
	ldr r6, _080245B4 @ =gSpecialStatuses
	ldrb r0, [r4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _080245BC
	ldr r0, _080245B8 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x5E
	ldrb r0, [r0]
	bl sub_8024398
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	b _080245CE
	.align 2, 0
_080245B4: .4byte gSpecialStatuses
_080245B8: .4byte gBattleStruct
_080245BC:
	movs r0, 0
	movs r1, 0x2
	bl BtlController_EmitLinkStandbyMsg
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	movs r0, 0x1
	mov r9, r0
_080245CE:
	ldr r6, _08024628 @ =gBitTable
	ldr r0, [r6, 0x8]
	ands r0, r5
	cmp r0, 0
	beq _0802468C
	ldr r0, [r6]
	ands r0, r5
	cmp r0, 0
	bne _0802468C
	ldr r4, _0802462C @ =gActiveBattler
	movs r0, 0x2
	strb r0, [r4]
	movs r0, 0x2
	movs r1, 0x6
	movs r2, 0x6
	bl HasNoMonsToSwitch
	lsls r0, 24
	cmp r0, 0
	beq _08024638
	ldr r2, _08024630 @ =gAbsentBattlerFlags
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _08024634 @ =gHitMarker
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	movs r0, 0
	bl BtlController_EmitCmd42
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	b _0802468C
	.align 2, 0
_08024628: .4byte gBitTable
_0802462C: .4byte gActiveBattler
_08024630: .4byte gAbsentBattlerFlags
_08024634: .4byte gHitMarker
_08024638:
	ldr r6, _0802466C @ =gSpecialStatuses
	ldrb r0, [r4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _08024674
	ldr r0, _08024670 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x5C
	ldrb r0, [r0]
	bl sub_8024398
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	b _0802468C
	.align 2, 0
_0802466C: .4byte gSpecialStatuses
_08024670: .4byte gBattleStruct
_08024674:
	movs r0, 0x1
	mov r1, r9
	ands r0, r1
	cmp r0, 0
	bne _0802468C
	movs r0, 0
	movs r1, 0x2
	bl BtlController_EmitLinkStandbyMsg
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_0802468C:
	ldr r6, _080246DC @ =gBitTable
	ldr r0, [r6, 0x4]
	ands r0, r5
	cmp r0, 0
	beq _0802473E
	ldr r4, _080246E0 @ =gActiveBattler
	movs r0, 0x1
	strb r0, [r4]
	movs r0, 0x1
	movs r1, 0x6
	movs r2, 0x6
	bl HasNoMonsToSwitch
	lsls r0, 24
	cmp r0, 0
	beq _080246EC
	ldr r2, _080246E4 @ =gAbsentBattlerFlags
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _080246E8 @ =gHitMarker
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	movs r0, 0
	bl BtlController_EmitCmd42
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	b _0802473E
	.align 2, 0
_080246DC: .4byte gBitTable
_080246E0: .4byte gActiveBattler
_080246E4: .4byte gAbsentBattlerFlags
_080246E8: .4byte gHitMarker
_080246EC:
	ldr r6, _08024720 @ =gSpecialStatuses
	ldrb r0, [r4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _08024728
	ldr r0, _08024724 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x5F
	ldrb r0, [r0]
	bl sub_8024398
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	b _0802473E
	.align 2, 0
_08024720: .4byte gSpecialStatuses
_08024724: .4byte gBattleStruct
_08024728:
	movs r0, 0
	movs r1, 0x2
	bl BtlController_EmitLinkStandbyMsg
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	movs r0, 0x2
	mov r2, r9
	orrs r2, r0
	mov r9, r2
_0802473E:
	ldr r6, _08024798 @ =gBitTable
	ldr r0, [r6, 0xC]
	ands r0, r5
	cmp r0, 0
	beq _080247FC
	ldr r0, [r6, 0x4]
	ands r0, r5
	cmp r0, 0
	bne _080247FC
	ldr r4, _0802479C @ =gActiveBattler
	movs r0, 0x3
	strb r0, [r4]
	movs r0, 0x3
	movs r1, 0x6
	movs r2, 0x6
	bl HasNoMonsToSwitch
	lsls r0, 24
	cmp r0, 0
	beq _080247A8
	ldr r2, _080247A0 @ =gAbsentBattlerFlags
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _080247A4 @ =gHitMarker
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	movs r0, 0
	bl BtlController_EmitCmd42
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	b _080247FC
	.align 2, 0
_08024798: .4byte gBitTable
_0802479C: .4byte gActiveBattler
_080247A0: .4byte gAbsentBattlerFlags
_080247A4: .4byte gHitMarker
_080247A8:
	ldr r6, _080247DC @ =gSpecialStatuses
	ldrb r0, [r4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _080247E4
	ldr r0, _080247E0 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x5D
	ldrb r0, [r0]
	bl sub_8024398
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	b _080247FC
	.align 2, 0
_080247DC: .4byte gSpecialStatuses
_080247E0: .4byte gBattleStruct
_080247E4:
	movs r0, 0x2
	mov r1, r9
	ands r1, r0
	cmp r1, 0
	bne _080247FC
	movs r0, 0
	movs r1, 0x2
	bl BtlController_EmitLinkStandbyMsg
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_080247FC:
	ldr r1, _0802482C @ =gSpecialStatuses
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _08024850
	adds r0, r1, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 25
	cmp r0, 0
	blt _08024850
	cmp r5, 0
	beq _08024850
	ldr r0, _08024830 @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldr r0, _08024834 @ =gBitTable
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0802483C
	ldr r1, _08024838 @ =gActiveBattler
	movs r0, 0x2
	strb r0, [r1]
	b _08024840
	.align 2, 0
_0802482C: .4byte gSpecialStatuses
_08024830: .4byte gAbsentBattlerFlags
_08024834: .4byte gBitTable
_08024838: .4byte gActiveBattler
_0802483C:
	ldr r0, _08024880 @ =gActiveBattler
	strb r1, [r0]
_08024840:
	movs r0, 0
	movs r1, 0x2
	bl BtlController_EmitLinkStandbyMsg
	ldr r0, _08024880 @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBattlerForControllerExec
_08024850:
	ldr r1, _08024884 @ =gSpecialStatuses
	ldrb r0, [r1, 0x14]
	lsls r0, 25
	cmp r0, 0
	blt _080248A6
	adds r0, r1, 0
	adds r0, 0x3C
	ldrb r0, [r0]
	lsls r0, 25
	cmp r0, 0
	blt _080248A6
	cmp r5, 0
	beq _080248A6
	ldr r0, _08024888 @ =gAbsentBattlerFlags
	ldrb r0, [r0]
	ldr r1, _0802488C @ =gBitTable
	ldr r1, [r1, 0x4]
	ands r0, r1
	cmp r0, 0
	beq _08024890
	ldr r1, _08024880 @ =gActiveBattler
	movs r0, 0x3
	b _08024894
	.align 2, 0
_08024880: .4byte gActiveBattler
_08024884: .4byte gSpecialStatuses
_08024888: .4byte gAbsentBattlerFlags
_0802488C: .4byte gBitTable
_08024890:
	ldr r1, _080248B0 @ =gActiveBattler
	movs r0, 0x1
_08024894:
	strb r0, [r1]
	movs r0, 0
	movs r1, 0x2
	bl BtlController_EmitLinkStandbyMsg
	ldr r0, _080248B0 @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBattlerForControllerExec
_080248A6:
	ldr r1, _080248B4 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x6
	str r0, [r1]
	b _08024C2E
	.align 2, 0
_080248B0: .4byte gActiveBattler
_080248B4: .4byte gBattlescriptCurrInstr
_080248B8:
	cmp r0, 0x6
	beq _080248BE
	b _08024AAC
_080248BE:
	ldr r0, _08024934 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080248CC
	b _08024A48
_080248CC:
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	bne _080248D6
	b _08024A48
_080248D6:
	ldr r7, _08024938 @ =gHitMarker
	ldr r0, [r7]
	lsrs r5, r0, 28
	ldr r4, _0802493C @ =gBitTable
	ldr r0, [r4, 0x8]
	ands r0, r5
	cmp r0, 0
	beq _0802497E
	ldr r0, [r4]
	ands r0, r5
	cmp r0, 0
	beq _0802497E
	ldr r6, _08024940 @ =gActiveBattler
	movs r0, 0x2
	strb r0, [r6]
	ldr r0, _08024944 @ =gBattleBufferB
	ldrb r1, [r0, 0x1]
	movs r0, 0x2
	movs r2, 0x6
	bl HasNoMonsToSwitch
	lsls r0, 24
	cmp r0, 0
	beq _0802494C
	ldr r2, _08024948 @ =gAbsentBattlerFlags
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r4
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r7]
	bics r0, r1
	str r0, [r7]
	movs r0, 0
	bl BtlController_EmitCmd42
	ldrb r0, [r6]
	bl MarkBattlerForControllerExec
	b _0802497E
	.align 2, 0
_08024934: .4byte gBattleTypeFlags
_08024938: .4byte gHitMarker
_0802493C: .4byte gBitTable
_08024940: .4byte gActiveBattler
_08024944: .4byte gBattleBufferB
_08024948: .4byte gAbsentBattlerFlags
_0802494C:
	ldr r4, _080249DC @ =gSpecialStatuses
	ldrb r0, [r6]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _0802497E
	ldr r0, _080249E0 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x5C
	ldrb r0, [r0]
	bl sub_8024398
	ldrb r1, [r6]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
_0802497E:
	ldr r4, _080249E4 @ =gBitTable
	ldr r0, [r4, 0xC]
	ands r0, r5
	cmp r0, 0
	beq _08024A2E
	ldr r0, [r4, 0x4]
	ands r5, r0
	cmp r5, 0
	beq _08024A2E
	ldr r5, _080249E8 @ =gActiveBattler
	movs r0, 0x3
	strb r0, [r5]
	ldr r0, _080249EC @ =gBattleBufferB
	ldr r2, _080249F0 @ =0x00000201
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x3
	movs r2, 0x6
	bl HasNoMonsToSwitch
	lsls r0, 24
	cmp r0, 0
	beq _080249FC
	ldr r2, _080249F4 @ =gAbsentBattlerFlags
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _080249F8 @ =gHitMarker
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r4
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	movs r0, 0
	bl BtlController_EmitCmd42
	ldrb r0, [r5]
	bl MarkBattlerForControllerExec
	b _08024A2E
	.align 2, 0
_080249DC: .4byte gSpecialStatuses
_080249E0: .4byte gBattleStruct
_080249E4: .4byte gBitTable
_080249E8: .4byte gActiveBattler
_080249EC: .4byte gBattleBufferB
_080249F0: .4byte 0x00000201
_080249F4: .4byte gAbsentBattlerFlags
_080249F8: .4byte gHitMarker
_080249FC:
	ldr r4, _08024A3C @ =gSpecialStatuses
	ldrb r0, [r5]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _08024A2E
	ldr r0, _08024A40 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x5D
	ldrb r0, [r0]
	bl sub_8024398
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
_08024A2E:
	ldr r1, _08024A44 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x6
	str r0, [r1]
	mov r12, r1
	b _08024A4C
	.align 2, 0
_08024A3C: .4byte gSpecialStatuses
_08024A40: .4byte gBattleStruct
_08024A44: .4byte gBattlescriptCurrInstr
_08024A48:
	adds r0, r2, 0x6
	str r0, [r6]
_08024A4C:
	ldr r0, _08024A9C @ =gHitMarker
	ldr r0, [r0]
	lsrs r5, r0, 28
	ldr r1, _08024AA0 @ =gBattlerFainted
	movs r0, 0
	strb r0, [r1]
	ldr r4, _08024AA4 @ =gBitTable
	ldr r2, [r4]
	ands r2, r5
	ldr r6, _08024AA8 @ =gBattlersCount
	cmp r2, 0
	bne _08024A88
	adds r7, r6, 0
	ldrb r0, [r6]
	cmp r2, r0
	bcs _08024A88
	adds r3, r1, 0
_08024A6E:
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	ldrb r2, [r3]
	lsls r0, r2, 2
	adds r0, r4
	ldr r0, [r0]
	ands r0, r5
	cmp r0, 0
	bne _08024A88
	ldrb r0, [r7]
	cmp r2, r0
	bcc _08024A6E
_08024A88:
	ldrb r0, [r1]
	ldrb r6, [r6]
	cmp r0, r6
	beq _08024A92
	b _08024C2E
_08024A92:
	mov r1, r8
	mov r2, r12
	str r1, [r2]
	b _08024C2E
	.align 2, 0
_08024A9C: .4byte gHitMarker
_08024AA0: .4byte gBattlerFainted
_08024AA4: .4byte gBitTable
_08024AA8: .4byte gBattlersCount
_08024AAC:
	movs r0, 0x80
	ands r0, r1
	movs r5, 0x1
	cmp r0, 0
	beq _08024AB8
	movs r5, 0
_08024AB8:
	movs r0, 0x7F
	ands r0, r1
	bl GetBattlerForBattleScript
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08024AE0 @ =gSpecialStatuses
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 25
	cmp r0, 0
	bge _08024AE4
	ldr r0, [r6]
	adds r0, 0x6
	str r0, [r6]
	b _08024C2E
	.align 2, 0
_08024AE0: .4byte gSpecialStatuses
_08024AE4:
	adds r0, r7, 0
	movs r1, 0x6
	movs r2, 0x6
	bl HasNoMonsToSwitch
	lsls r0, 24
	cmp r0, 0
	beq _08024B34
	ldr r2, _08024B24 @ =gActiveBattler
	strb r7, [r2]
	ldr r3, _08024B28 @ =gAbsentBattlerFlags
	ldr r4, _08024B2C @ =gBitTable
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	ldrb r1, [r3]
	orrs r0, r1
	strb r0, [r3]
	ldr r3, _08024B30 @ =gHitMarker
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r4
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r3]
	bics r0, r1
	str r0, [r3]
	mov r0, r8
	str r0, [r6]
	b _08024C2E
	.align 2, 0
_08024B24: .4byte gActiveBattler
_08024B28: .4byte gAbsentBattlerFlags
_08024B2C: .4byte gBitTable
_08024B30: .4byte gHitMarker
_08024B34:
	ldr r4, _08024BD8 @ =gActiveBattler
	strb r7, [r4]
	ldrb r0, [r4]
	ldr r3, _08024BDC @ =gBattleStruct
	ldr r1, [r3]
	adds r1, r0, r1
	adds r1, 0x58
	ldr r2, _08024BE0 @ =gBattlerPartyIndexes
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r1, [r4]
	movs r0, 0x2
	eors r0, r1
	ldr r3, [r3]
	adds r0, r3
	adds r0, 0x5C
	ldrb r2, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	adds r0, 0x60
	adds r3, r0
	str r3, [sp]
	movs r0, 0
	adds r1, r5, 0
	movs r3, 0
	bl BtlController_EmitChoosePokemon
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r0, [r6]
	adds r0, 0x6
	str r0, [r6]
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, 24
	cmp r0, 0
	bne _08024B94
	ldr r1, _08024BE4 @ =gBattleResults
	ldrb r0, [r1, 0x2]
	cmp r0, 0xFE
	bhi _08024B94
	adds r0, 0x1
	strb r0, [r1, 0x2]
_08024B94:
	ldr r0, _08024BE8 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08024BF0
	ldr r1, _08024BD8 @ =gActiveBattler
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08024BEC @ =gBattlersCount
	ldrb r0, [r0]
	cmp r0, 0
	beq _08024C2E
	adds r4, r1, 0
_08024BB0:
	ldrb r0, [r4]
	cmp r0, r7
	beq _08024BC4
	movs r0, 0
	movs r1, 0x2
	bl BtlController_EmitLinkStandbyMsg
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_08024BC4:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08024BEC @ =gBattlersCount
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08024BB0
	b _08024C2E
	.align 2, 0
_08024BD8: .4byte gActiveBattler
_08024BDC: .4byte gBattleStruct
_08024BE0: .4byte gBattlerPartyIndexes
_08024BE4: .4byte gBattleResults
_08024BE8: .4byte gBattleTypeFlags
_08024BEC: .4byte gBattlersCount
_08024BF0:
	adds r0, r7, 0
	bl GetBattlerPosition
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerAtPosition
	ldr r4, _08024C3C @ =gActiveBattler
	strb r0, [r4]
	ldr r0, _08024C40 @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldr r2, _08024C44 @ =gBitTable
	ldrb r3, [r4]
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08024C20
	movs r0, 0x2
	eors r3, r0
	strb r3, [r4]
_08024C20:
	movs r0, 0
	movs r1, 0x2
	bl BtlController_EmitLinkStandbyMsg
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_08024C2E:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024C3C: .4byte gActiveBattler
_08024C40: .4byte gAbsentBattlerFlags
_08024C44: .4byte gBitTable
	thumb_func_end atk50_openpartyscreen

	thumb_func_start atk51_switchhandleorder
atk51_switchhandleorder: @ 8024C48
	push {r4-r7,lr}
	ldr r0, _08024C74 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	beq _08024C54
	b _08024E16
_08024C54:
	ldr r4, _08024C78 @ =gBattlescriptCurrInstr
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl GetBattlerForBattleScript
	ldr r7, _08024C7C @ =gActiveBattler
	strb r0, [r7]
	ldr r0, [r4]
	ldrb r0, [r0, 0x2]
	cmp r0, 0x1
	beq _08024CC4
	cmp r0, 0x1
	bgt _08024C80
	cmp r0, 0
	beq _08024C86
	b _08024E0E
	.align 2, 0
_08024C74: .4byte gBattleControllerExecFlags
_08024C78: .4byte gBattlescriptCurrInstr
_08024C7C: .4byte gActiveBattler
_08024C80:
	cmp r0, 0x2
	beq _08024CE0
	b _08024E0E
_08024C86:
	movs r3, 0
	ldr r0, _08024CB8 @ =gBattlersCount
	ldrb r1, [r0]
	cmp r3, r1
	blt _08024C92
	b _08024E0E
_08024C92:
	ldr r6, _08024CBC @ =gBattleStruct
	ldr r2, _08024CC0 @ =gBattleBufferB
	movs r5, 0x80
	lsls r5, 2
	adds r4, r0, 0
_08024C9C:
	ldrb r0, [r2]
	cmp r0, 0x22
	bne _08024CAC
	ldr r0, [r6]
	adds r0, r3, r0
	adds r0, 0x5C
	ldrb r1, [r2, 0x1]
	strb r1, [r0]
_08024CAC:
	adds r2, r5
	adds r3, 0x1
	ldrb r0, [r4]
	cmp r3, r0
	blt _08024C9C
	b _08024E0E
	.align 2, 0
_08024CB8: .4byte gBattlersCount
_08024CBC: .4byte gBattleStruct
_08024CC0: .4byte gBattleBufferB
_08024CC4:
	ldr r0, _08024CDC @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08024CD2
	b _08024E0E
_08024CD2:
	ldrb r0, [r7]
	bl sub_8013F6C
	b _08024E0E
	.align 2, 0
_08024CDC: .4byte gBattleTypeFlags
_08024CE0:
	ldr r1, _08024DAC @ =gBattleCommunication
	ldr r4, _08024DB0 @ =gBattleBufferB
	ldrb r0, [r7]
	lsls r0, 9
	adds r2, r4, 0x1
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	ldr r6, _08024DB4 @ =gBattleStruct
	ldr r1, [r6]
	adds r1, r0, r1
	adds r1, 0x5C
	lsls r0, 9
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08024DB8 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08024DBC
	ldrb r0, [r7]
	ldr r2, [r6]
	lsls r1, r0, 1
	adds r1, r0
	adds r1, r2
	adds r1, 0x60
	ldrb r2, [r1]
	movs r0, 0xF
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r7]
	ldr r2, [r6]
	lsls r1, r0, 1
	adds r1, r0
	adds r1, r2
	adds r1, 0x60
	lsls r0, 9
	adds r5, r4, 0x2
	adds r0, r5
	ldrb r2, [r0]
	movs r3, 0xF0
	adds r0, r3, 0
	ands r0, r2
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	ldr r2, [r6]
	lsls r0, r1, 1
	adds r0, r1
	adds r0, r2
	adds r0, 0x61
	lsls r1, 9
	adds r4, 0x3
	mov r12, r4
	add r1, r12
	ldrb r1, [r1]
	strb r1, [r0]
	ldrb r0, [r7]
	movs r4, 0x2
	eors r0, r4
	ldr r2, [r6]
	lsls r1, r0, 1
	adds r1, r0
	adds r1, r2
	adds r1, 0x60
	ldrb r2, [r1]
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r7]
	eors r0, r4
	ldr r2, [r6]
	lsls r1, r0, 1
	adds r1, r0
	adds r1, r2
	adds r1, 0x60
	ldrb r0, [r7]
	lsls r0, 9
	adds r0, r5
	ldrb r0, [r0]
	ands r3, r0
	lsrs r3, 4
	ldrb r0, [r1]
	orrs r3, r0
	strb r3, [r1]
	ldrb r0, [r7]
	eors r4, r0
	ldr r0, [r6]
	lsls r1, r4, 1
	adds r1, r4
	adds r1, r0
	adds r1, 0x62
	ldrb r0, [r7]
	lsls r0, 9
	add r0, r12
	ldrb r0, [r0]
	strb r0, [r1]
	b _08024DC2
	.align 2, 0
_08024DAC: .4byte gBattleCommunication
_08024DB0: .4byte gBattleBufferB
_08024DB4: .4byte gBattleStruct
_08024DB8: .4byte gBattleTypeFlags
_08024DBC:
	ldrb r0, [r7]
	bl sub_8013F6C
_08024DC2:
	ldr r1, _08024E1C @ =gBattleTextBuff1
	movs r5, 0xFD
	strb r5, [r1]
	movs r0, 0x6
	strb r0, [r1, 0x1]
	ldr r4, _08024E20 @ =gBattleMons
	ldr r3, _08024E24 @ =gBattlerAttacker
	ldrb r0, [r3]
	movs r2, 0x58
	muls r0, r2
	adds r0, r4
	ldrh r0, [r0]
	strb r0, [r1, 0x2]
	ldrb r0, [r3]
	muls r0, r2
	adds r0, r4
	ldrh r0, [r0]
	lsrs r0, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r2, _08024E28 @ =gBattleTextBuff2
	strb r5, [r2]
	movs r0, 0x7
	strb r0, [r2, 0x1]
	ldr r3, _08024E2C @ =gActiveBattler
	ldrb r0, [r3]
	strb r0, [r2, 0x2]
	ldr r1, _08024E30 @ =gBattleBufferB
	ldrb r0, [r3]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2, 0x3]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r2, 0x4]
_08024E0E:
	ldr r1, _08024E34 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x3
	str r0, [r1]
_08024E16:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024E1C: .4byte gBattleTextBuff1
_08024E20: .4byte gBattleMons
_08024E24: .4byte gBattlerAttacker
_08024E28: .4byte gBattleTextBuff2
_08024E2C: .4byte gActiveBattler
_08024E30: .4byte gBattleBufferB
_08024E34: .4byte gBattlescriptCurrInstr
	thumb_func_end atk51_switchhandleorder

	thumb_func_start atk52_switchineffects
atk52_switchineffects: @ 8024E38
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	ldr r6, _08024F40 @ =gBattlescriptCurrInstr
	ldr r0, [r6]
	ldrb r0, [r0, 0x1]
	bl GetBattlerForBattleScript
	ldr r4, _08024F44 @ =gActiveBattler
	strb r0, [r4]
	ldrb r0, [r4]
	bl sub_80174B8
	ldr r2, _08024F48 @ =gHitMarker
	ldr r1, _08024F4C @ =gBitTable
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	ldr r2, _08024F50 @ =gSpecialStatuses
	ldrb r0, [r4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1]
	movs r0, 0x41
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r4]
	bl GetBattlerSide
	ldr r5, _08024F54 @ =gSideStatuses
	lsls r0, 24
	lsrs r0, 23
	adds r0, r5
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 2
	mov r8, r0
	ands r0, r1
	cmp r0, 0
	bne _08024F88
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 23
	adds r0, r5
	ldrh r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08024F88
	ldr r1, _08024F58 @ =gBattleMons
	mov r9, r1
	ldrb r2, [r4]
	movs r7, 0x58
	adds r0, r2, 0
	muls r0, r7
	adds r1, r0, r1
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08024F88
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08024F88
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1A
	beq _08024F88
	adds r0, r2, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 23
	adds r0, r5
	ldrh r2, [r0]
	mov r1, r8
	orrs r1, r2
	strh r1, [r0]
	ldrb r0, [r4]
	bl GetBattlerSide
	ldr r2, _08024F5C @ =gSideTimers
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0xA]
	movs r1, 0x5
	subs r1, r0
	lsls r1, 25
	lsrs r1, 24
	ldr r5, _08024F60 @ =gBattleMoveDamage
	ldrb r0, [r4]
	muls r0, r7
	add r0, r9
	ldrh r0, [r0, 0x2C]
	bl __divsi3
	str r0, [r5]
	cmp r0, 0
	bne _08024F28
	movs r0, 0x1
	str r0, [r5]
_08024F28:
	ldr r0, _08024F64 @ =gBattleScripting
	ldrb r1, [r4]
	strb r1, [r0, 0x17]
	bl BattleScriptPushCursor
	ldr r0, [r6]
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _08024F6C
	ldr r0, _08024F68 @ =BattleScript_SpikesOnTarget
	str r0, [r6]
	b _080250C6
	.align 2, 0
_08024F40: .4byte gBattlescriptCurrInstr
_08024F44: .4byte gActiveBattler
_08024F48: .4byte gHitMarker
_08024F4C: .4byte gBitTable
_08024F50: .4byte gSpecialStatuses
_08024F54: .4byte gSideStatuses
_08024F58: .4byte gBattleMons
_08024F5C: .4byte gSideTimers
_08024F60: .4byte gBattleMoveDamage
_08024F64: .4byte gBattleScripting
_08024F68: .4byte BattleScript_SpikesOnTarget
_08024F6C:
	cmp r0, 0x1
	bne _08024F7C
	ldr r0, _08024F78 @ =BattleScript_SpikesOnAttacker
	str r0, [r6]
	b _080250C6
	.align 2, 0
_08024F78: .4byte BattleScript_SpikesOnAttacker
_08024F7C:
	ldr r0, _08024F84 @ =BattleScript_SpikesOnFaintedBattler
	str r0, [r6]
	b _080250C6
	.align 2, 0
_08024F84: .4byte BattleScript_SpikesOnFaintedBattler
_08024F88:
	ldr r1, _08025064 @ =gBattleMons
	ldr r5, _08025068 @ =gActiveBattler
	ldrb r2, [r5]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x36
	bne _08024FAE
	ldr r1, _0802506C @ =gDisableStructs
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x18]
_08024FAE:
	ldrb r1, [r5]
	movs r0, 0
	str r0, [sp]
	movs r2, 0
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	beq _08024FC4
	b _080250C6
_08024FC4:
	ldrb r1, [r5]
	movs r0, 0
	movs r2, 0
	bl ItemBattleEffects
	lsls r0, 24
	cmp r0, 0
	bne _080250C6
	ldrb r0, [r5]
	bl GetBattlerSide
	ldr r1, _08025070 @ =gSideStatuses
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r2, [r0]
	ldr r1, _08025074 @ =0x0000fdff
	ands r1, r2
	strh r1, [r0]
	movs r4, 0
	ldr r0, _08025078 @ =gBattlersCount
	ldrb r3, [r0]
	cmp r4, r3
	bge _08025012
	ldr r6, _0802507C @ =gBattlerByTurnOrder
	ldr r3, _08025080 @ =gActionsByTurnOrder
	movs r2, 0xC
	adds r1, r0, 0
_08024FFC:
	adds r0, r4, r6
	ldrb r0, [r0]
	ldrb r7, [r5]
	cmp r0, r7
	bne _0802500A
	adds r0, r4, r3
	strb r2, [r0]
_0802500A:
	adds r4, 0x1
	ldrb r0, [r1]
	cmp r4, r0
	blt _08024FFC
_08025012:
	movs r4, 0
	ldr r0, _08025078 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r4, r0
	bge _08025046
	ldr r6, _08025084 @ =gBattleStruct
	ldr r5, _08025064 @ =gBattleMons
_08025020:
	lsls r0, r4, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 23
	adds r0, 0xA8
	ldr r1, [r6]
	adds r1, r0
	movs r0, 0x58
	muls r0, r4
	adds r0, r5
	ldrh r0, [r0, 0x28]
	strh r0, [r1]
	adds r4, 0x1
	ldr r0, _08025078 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r4, r0
	blt _08025020
_08025046:
	ldr r0, _08025088 @ =gBattlescriptCurrInstr
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r5, r0, 0
	cmp r1, 0x5
	bne _080250C0
	ldr r0, _0802508C @ =gHitMarker
	ldr r0, [r0]
	lsrs r4, r0, 28
	ldr r1, _08025090 @ =gBattlerFainted
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r2, _08025094 @ =gBitTable
	b _080250A6
	.align 2, 0
_08025064: .4byte gBattleMons
_08025068: .4byte gActiveBattler
_0802506C: .4byte gDisableStructs
_08025070: .4byte gSideStatuses
_08025074: .4byte 0x0000fdff
_08025078: .4byte gBattlersCount
_0802507C: .4byte gBattlerByTurnOrder
_08025080: .4byte gActionsByTurnOrder
_08025084: .4byte gBattleStruct
_08025088: .4byte gBattlescriptCurrInstr
_0802508C: .4byte gHitMarker
_08025090: .4byte gBattlerFainted
_08025094: .4byte gBitTable
_08025098:
	ldr r0, _080250D4 @ =gBattlersCount
	ldrb r3, [r1]
	ldrb r0, [r0]
	cmp r3, r0
	bcs _080250C0
	adds r0, r3, 0x1
	strb r0, [r1]
_080250A6:
	ldrb r0, [r1]
	lsls r0, 2
	adds r0, r2
	ldr r3, [r0]
	adds r0, r4, 0
	ands r0, r3
	cmp r0, 0
	beq _08025098
	ldr r0, _080250D8 @ =gAbsentBattlerFlags
	ldrb r0, [r0]
	ands r0, r3
	cmp r0, 0
	bne _08025098
_080250C0:
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
_080250C6:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080250D4: .4byte gBattlersCount
_080250D8: .4byte gAbsentBattlerFlags
	thumb_func_end atk52_switchineffects

	thumb_func_start atk53_trainerslidein
atk53_trainerslidein: @ 80250DC
	push {lr}
	ldr r0, _080250EC @ =gBattlescriptCurrInstr
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _080250F0
	movs r0, 0
	b _080250F2
	.align 2, 0
_080250EC: .4byte gBattlescriptCurrInstr
_080250F0:
	movs r0, 0x1
_080250F2:
	bl GetBattlerAtPosition
	ldr r1, _08025114 @ =gActiveBattler
	strb r0, [r1]
	movs r0, 0
	bl BtlController_EmitTrainerSlide
	ldr r0, _08025114 @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBattlerForControllerExec
	ldr r1, _08025118 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08025114: .4byte gActiveBattler
_08025118: .4byte gBattlescriptCurrInstr
	thumb_func_end atk53_trainerslidein

	thumb_func_start atk54_playse
atk54_playse: @ 802511C
	push {r4,r5,lr}
	ldr r5, _0802514C @ =gActiveBattler
	ldr r0, _08025150 @ =gBattlerAttacker
	ldrb r0, [r0]
	strb r0, [r5]
	ldr r4, _08025154 @ =gBattlescriptCurrInstr
	ldr r0, [r4]
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r1, r0
	movs r0, 0
	bl BtlController_EmitPlaySE
	ldrb r0, [r5]
	bl MarkBattlerForControllerExec
	ldr r0, [r4]
	adds r0, 0x3
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802514C: .4byte gActiveBattler
_08025150: .4byte gBattlerAttacker
_08025154: .4byte gBattlescriptCurrInstr
	thumb_func_end atk54_playse

	thumb_func_start atk55_fanfare
atk55_fanfare: @ 8025158
	push {r4,r5,lr}
	ldr r5, _08025188 @ =gActiveBattler
	ldr r0, _0802518C @ =gBattlerAttacker
	ldrb r0, [r0]
	strb r0, [r5]
	ldr r4, _08025190 @ =gBattlescriptCurrInstr
	ldr r0, [r4]
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r1, r0
	movs r0, 0
	bl BtlController_EmitPlayFanfare
	ldrb r0, [r5]
	bl MarkBattlerForControllerExec
	ldr r0, [r4]
	adds r0, 0x3
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025188: .4byte gActiveBattler
_0802518C: .4byte gBattlerAttacker
_08025190: .4byte gBattlescriptCurrInstr
	thumb_func_end atk55_fanfare

	thumb_func_start atk56_playfaintcry
atk56_playfaintcry: @ 8025194
	push {r4,r5,lr}
	ldr r5, _080251BC @ =gBattlescriptCurrInstr
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl GetBattlerForBattleScript
	ldr r4, _080251C0 @ =gActiveBattler
	strb r0, [r4]
	movs r0, 0
	bl BtlController_EmitFaintingCry
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080251BC: .4byte gBattlescriptCurrInstr
_080251C0: .4byte gActiveBattler
	thumb_func_end atk56_playfaintcry

	thumb_func_start atk57
atk57: @ 80251C4
	push {r4,lr}
	movs r0, 0
	bl GetBattlerAtPosition
	ldr r4, _080251F0 @ =gActiveBattler
	strb r0, [r4]
	ldr r0, _080251F4 @ =gBattleOutcome
	ldrb r1, [r0]
	movs r0, 0
	bl BtlController_EmitCmd55
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r1, _080251F8 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080251F0: .4byte gActiveBattler
_080251F4: .4byte gBattleOutcome
_080251F8: .4byte gBattlescriptCurrInstr
	thumb_func_end atk57

	thumb_func_start atk58_returntoball
atk58_returntoball: @ 80251FC
	push {r4,r5,lr}
	ldr r5, _08025228 @ =gBattlescriptCurrInstr
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl GetBattlerForBattleScript
	ldr r4, _0802522C @ =gActiveBattler
	strb r0, [r4]
	movs r0, 0
	movs r1, 0x1
	bl BtlController_EmitReturnMonToBall
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025228: .4byte gBattlescriptCurrInstr
_0802522C: .4byte gActiveBattler
	thumb_func_end atk58_returntoball

	thumb_func_start atk59_handlelearnnewmove
atk59_handlelearnnewmove: @ 8025230
	push {r4-r7,lr}
	ldr r0, _080252A4 @ =gBattlescriptCurrInstr
	ldr r2, [r0]
	ldrb r6, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r6, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r6, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r6, r0
	ldrb r4, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	orrs r4, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	orrs r4, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	orrs r4, r0
	ldr r0, _080252A8 @ =gBattleStruct
	ldr r0, [r0]
	ldrb r1, [r0, 0x10]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080252AC @ =gPlayerParty
	adds r0, r1
	ldrb r1, [r2, 0x9]
	bl MonTryLearningNewMove
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _080252B0 @ =0x0000fffe
	cmp r5, r0
	bne _0802529A
	adds r7, r5, 0
_0802527E:
	ldr r0, _080252A8 @ =gBattleStruct
	ldr r0, [r0]
	ldrb r1, [r0, 0x10]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080252AC @ =gPlayerParty
	adds r0, r1
	movs r1, 0
	bl MonTryLearningNewMove
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r7
	beq _0802527E
_0802529A:
	cmp r5, 0
	bne _080252B4
	ldr r0, _080252A4 @ =gBattlescriptCurrInstr
	str r4, [r0]
	b _0802535C
	.align 2, 0
_080252A4: .4byte gBattlescriptCurrInstr
_080252A8: .4byte gBattleStruct
_080252AC: .4byte gPlayerParty
_080252B0: .4byte 0x0000fffe
_080252B4:
	ldr r0, _080252C4 @ =0x0000ffff
	cmp r5, r0
	bne _080252CC
	ldr r1, _080252C8 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0xA
	str r0, [r1]
	b _0802535C
	.align 2, 0
_080252C4: .4byte 0x0000ffff
_080252C8: .4byte gBattlescriptCurrInstr
_080252CC:
	movs r0, 0
	bl GetBattlerAtPosition
	ldr r1, _08025364 @ =gActiveBattler
	strb r0, [r1]
	ldr r2, _08025368 @ =gBattlerPartyIndexes
	ldrb r3, [r1]
	lsls r0, r3, 1
	adds r0, r2
	ldr r1, _0802536C @ =gBattleStruct
	ldr r1, [r1]
	ldrh r0, [r0]
	ldrb r1, [r1, 0x10]
	cmp r0, r1
	bne _0802530C
	ldr r4, _08025370 @ =gBattleMons
	movs r0, 0x58
	adds r2, r3, 0
	muls r2, r0
	adds r0, r4, 0
	adds r0, 0x50
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _0802530C
	adds r0, r2, r4
	adds r1, r5, 0
	bl GiveMoveToBattleMon
_0802530C:
	ldr r0, _08025374 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08025358
	movs r0, 0x2
	bl GetBattlerAtPosition
	ldr r1, _08025364 @ =gActiveBattler
	strb r0, [r1]
	ldr r2, _08025368 @ =gBattlerPartyIndexes
	ldrb r3, [r1]
	lsls r0, r3, 1
	adds r0, r2
	ldr r1, _0802536C @ =gBattleStruct
	ldr r1, [r1]
	ldrh r0, [r0]
	ldrb r1, [r1, 0x10]
	cmp r0, r1
	bne _08025358
	ldr r4, _08025370 @ =gBattleMons
	movs r0, 0x58
	adds r2, r3, 0
	muls r2, r0
	adds r0, r4, 0
	adds r0, 0x50
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _08025358
	adds r0, r2, r4
	adds r1, r5, 0
	bl GiveMoveToBattleMon
_08025358:
	ldr r0, _08025378 @ =gBattlescriptCurrInstr
	str r6, [r0]
_0802535C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025364: .4byte gActiveBattler
_08025368: .4byte gBattlerPartyIndexes
_0802536C: .4byte gBattleStruct
_08025370: .4byte gBattleMons
_08025374: .4byte gBattleTypeFlags
_08025378: .4byte gBattlescriptCurrInstr
	thumb_func_end atk59_handlelearnnewmove

	thumb_func_start atk5A_yesnoboxlearnmove
atk5A_yesnoboxlearnmove: @ 802537C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r0, _080253A0 @ =gActiveBattler
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080253A4 @ =gBattleScripting
	ldrb r1, [r0, 0x1F]
	adds r2, r0, 0
	cmp r1, 0x5
	bls _08025396
	b _080256D0
_08025396:
	lsls r0, r1, 2
	ldr r1, _080253A8 @ =_080253AC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080253A0: .4byte gActiveBattler
_080253A4: .4byte gBattleScripting
_080253A8: .4byte _080253AC
	.align 2, 0
_080253AC:
	.4byte _080253C4
	.4byte _080253FC
	.4byte _080254A8
	.4byte _08025500
	.4byte _080256A4
	.4byte _080256C4
_080253C4:
	movs r4, 0
	str r4, [sp]
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl HandleBattleWindow
	ldr r0, _080253F0 @ =gText_BattleYesNoChoice
	movs r1, 0xE
	bl BattlePutTextOnWindow
	ldr r1, _080253F4 @ =gBattleScripting
	ldrb r0, [r1, 0x1F]
	adds r0, 0x1
	strb r0, [r1, 0x1F]
	ldr r0, _080253F8 @ =gBattleCommunication
	strb r4, [r0, 0x1]
	bl BattleCreateYesNoCursorAt
	b _080256D0
	.align 2, 0
_080253F0: .4byte gText_BattleYesNoChoice
_080253F4: .4byte gBattleScripting
_080253F8: .4byte gBattleCommunication
_080253FC:
	ldr r0, _08025484 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08025422
	ldr r4, _08025488 @ =gBattleCommunication
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _08025422
	movs r0, 0x5
	bl PlaySE
	bl BattleDestroyYesNoCursorAt
	movs r0, 0
	strb r0, [r4, 0x1]
	bl BattleCreateYesNoCursorAt
_08025422:
	ldr r0, _08025484 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08025448
	ldr r4, _08025488 @ =gBattleCommunication
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08025448
	movs r0, 0x5
	bl PlaySE
	bl BattleDestroyYesNoCursorAt
	movs r0, 0x1
	strb r0, [r4, 0x1]
	bl BattleCreateYesNoCursorAt
_08025448:
	ldr r0, _08025484 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r5, 0x1
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _0802548C
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08025488 @ =gBattleCommunication
	ldrb r4, [r0, 0x1]
	cmp r4, 0
	bne _0802549C
	str r5, [sp]
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl HandleBattleWindow
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _080254D8
	.align 2, 0
_08025484: .4byte gMain
_08025488: .4byte gBattleCommunication
_0802548C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08025496
	b _080256D0
_08025496:
	movs r0, 0x5
	bl PlaySE
_0802549C:
	ldr r1, _080254A4 @ =gBattleScripting
	movs r0, 0x4
	strb r0, [r1, 0x1F]
	b _080256D0
	.align 2, 0
_080254A4: .4byte gBattleScripting
_080254A8:
	ldr r0, _080254E4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080254B6
	b _080256D0
_080254B6:
	bl FreeAllWindowBuffers
	ldr r0, _080254E8 @ =gPlayerParty
	ldr r1, _080254EC @ =gBattleStruct
	ldr r1, [r1]
	ldrb r1, [r1, 0x10]
	ldr r2, _080254F0 @ =gPlayerPartyCount
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080254F4 @ =ReshowBattleScreenAfterMenu
	ldr r4, _080254F8 @ =gMoveToLearn
	ldrh r4, [r4]
	str r4, [sp]
	bl sub_8134738
_080254D8:
	ldr r1, _080254FC @ =gBattleScripting
	ldrb r0, [r1, 0x1F]
	adds r0, 0x1
	strb r0, [r1, 0x1F]
	b _080256D0
	.align 2, 0
_080254E4: .4byte gPaletteFade
_080254E8: .4byte gPlayerParty
_080254EC: .4byte gBattleStruct
_080254F0: .4byte gPlayerPartyCount
_080254F4: .4byte ReshowBattleScreenAfterMenu
_080254F8: .4byte gMoveToLearn
_080254FC: .4byte gBattleScripting
_08025500:
	ldr r0, _0802552C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802550E
	b _080256D0
_0802550E:
	ldr r0, _08025530 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _08025534 @ =BattleMainCB2
	cmp r1, r0
	beq _0802551A
	b _080256D0
_0802551A:
	bl sub_8138B2C
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bne _0802553C
	ldr r0, _08025538 @ =gBattleScripting
	strb r5, [r0, 0x1F]
	b _080256D0
	.align 2, 0
_0802552C: .4byte gPaletteFade
_08025530: .4byte gMain
_08025534: .4byte BattleMainCB2
_08025538: .4byte gBattleScripting
_0802553C:
	ldr r6, _08025578 @ =gBattleStruct
	ldr r0, [r6]
	ldrb r0, [r0, 0x10]
	movs r1, 0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r7, _0802557C @ =gPlayerParty
	adds r0, r7
	adds r1, r5, 0
	adds r1, 0xD
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl IsHMMove2
	cmp r0, 0
	beq _0802558C
	ldr r0, _08025580 @ =0x0000013f
	ldr r1, _08025584 @ =gActiveBattler
	ldrb r1, [r1]
	bl PrepareStringBattle
	ldr r1, _08025588 @ =gBattleScripting
	movs r0, 0x5
	strb r0, [r1, 0x1F]
	b _080256D0
	.align 2, 0
_08025578: .4byte gBattleStruct
_0802557C: .4byte gPlayerParty
_08025580: .4byte 0x0000013f
_08025584: .4byte gActiveBattler
_08025588: .4byte gBattleScripting
_0802558C:
	ldr r3, _08025680 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	ldr r1, _08025684 @ =gBattleTextBuff2
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	strb r4, [r1, 0x2]
	lsrs r0, r4, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r0, [r6]
	ldrb r0, [r0, 0x10]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r7
	adds r1, r5, 0
	bl RemoveMonPPBonus
	ldr r0, [r6]
	ldrb r0, [r0, 0x10]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r7
	ldr r7, _08025688 @ =gMoveToLearn
	ldrh r1, [r7]
	adds r2, r5, 0
	bl SetMonMoveSlot
	ldr r0, _0802568C @ =gBattlerPartyIndexes
	ldr r1, [r6]
	ldrh r0, [r0]
	ldrb r1, [r1, 0x10]
	cmp r0, r1
	bne _08025622
	ldr r4, _08025690 @ =gBattleMons
	ldr r0, [r4, 0x50]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _08025622
	ldr r0, _08025694 @ =gDisableStructs
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _08025698 @ =gBitTable
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08025622
	adds r0, r4, 0
	adds r1, r5, 0
	bl RemoveBattleMonPPBonus
	ldrh r1, [r7]
	adds r0, r4, 0
	adds r2, r5, 0
	bl SetBattleMonMoveSlot
_08025622:
	ldr r0, _0802569C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080256D0
	ldr r2, _0802568C @ =gBattlerPartyIndexes
	ldr r0, _080256A0 @ =gBattleStruct
	ldr r1, [r0]
	ldrh r0, [r2, 0x4]
	ldrb r1, [r1, 0x10]
	cmp r0, r1
	bne _080256D0
	ldr r4, _08025690 @ =gBattleMons
	movs r1, 0x80
	lsls r1, 1
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _080256D0
	ldr r0, _08025694 @ =gDisableStructs
	adds r0, 0x50
	ldrb r1, [r0]
	lsrs r1, 4
	ldr r2, _08025698 @ =gBitTable
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080256D0
	adds r4, 0xB0
	adds r0, r4, 0
	adds r1, r5, 0
	bl RemoveBattleMonPPBonus
	ldr r0, _08025688 @ =gMoveToLearn
	ldrh r1, [r0]
	adds r0, r4, 0
	adds r2, r5, 0
	bl SetBattleMonMoveSlot
	b _080256D0
	.align 2, 0
_08025680: .4byte gBattlescriptCurrInstr
_08025684: .4byte gBattleTextBuff2
_08025688: .4byte gMoveToLearn
_0802568C: .4byte gBattlerPartyIndexes
_08025690: .4byte gBattleMons
_08025694: .4byte gDisableStructs
_08025698: .4byte gBitTable
_0802569C: .4byte gBattleTypeFlags
_080256A0: .4byte gBattleStruct
_080256A4:
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl HandleBattleWindow
	ldr r1, _080256C0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _080256D0
	.align 2, 0
_080256C0: .4byte gBattlescriptCurrInstr
_080256C4:
	ldr r0, _080256DC @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	bne _080256D0
	movs r0, 0x2
	strb r0, [r2, 0x1F]
_080256D0:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080256DC: .4byte gBattleControllerExecFlags
	thumb_func_end atk5A_yesnoboxlearnmove

	thumb_func_start atk5B_yesnoboxstoplearningmove
atk5B_yesnoboxstoplearningmove: @ 80256E0
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _080256F4 @ =gBattleScripting
	ldrb r4, [r5, 0x1F]
	cmp r4, 0
	beq _080256F8
	cmp r4, 0x1
	beq _08025728
	b _0802580E
	.align 2, 0
_080256F4: .4byte gBattleScripting
_080256F8:
	str r4, [sp]
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl HandleBattleWindow
	ldr r0, _08025720 @ =gText_BattleYesNoChoice
	movs r1, 0xE
	bl BattlePutTextOnWindow
	ldrb r0, [r5, 0x1F]
	adds r0, 0x1
	strb r0, [r5, 0x1F]
	ldr r0, _08025724 @ =gBattleCommunication
	strb r4, [r0, 0x1]
	bl BattleCreateYesNoCursorAt
	b _0802580E
	.align 2, 0
_08025720: .4byte gText_BattleYesNoChoice
_08025724: .4byte gBattleCommunication
_08025728:
	ldr r0, _080257AC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0802574E
	ldr r4, _080257B0 @ =gBattleCommunication
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _0802574E
	movs r0, 0x5
	bl PlaySE
	bl BattleDestroyYesNoCursorAt
	movs r0, 0
	strb r0, [r4, 0x1]
	bl BattleCreateYesNoCursorAt
_0802574E:
	ldr r0, _080257AC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08025774
	ldr r4, _080257B0 @ =gBattleCommunication
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08025774
	movs r0, 0x5
	bl PlaySE
	bl BattleDestroyYesNoCursorAt
	movs r0, 0x1
	strb r0, [r4, 0x1]
	bl BattleCreateYesNoCursorAt
_08025774:
	ldr r0, _080257AC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _080257D8
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080257B0 @ =gBattleCommunication
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _080257B8
	ldr r3, _080257B4 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080257C0
	.align 2, 0
_080257AC: .4byte gMain
_080257B0: .4byte gBattleCommunication
_080257B4: .4byte gBattlescriptCurrInstr
_080257B8:
	ldr r1, _080257D4 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_080257C0:
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl HandleBattleWindow
	b _0802580E
	.align 2, 0
_080257D4: .4byte gBattlescriptCurrInstr
_080257D8:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802580E
	movs r0, 0x5
	bl PlaySE
	ldr r3, _08025818 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	str r4, [sp]
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl HandleBattleWindow
_0802580E:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025818: .4byte gBattlescriptCurrInstr
	thumb_func_end atk5B_yesnoboxstoplearningmove

	thumb_func_start atk5C_hitanimation
atk5C_hitanimation: @ 802581C
	push {r4,lr}
	ldr r4, _08025888 @ =gBattlescriptCurrInstr
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl GetBattlerForBattleScript
	ldr r2, _0802588C @ =gActiveBattler
	strb r0, [r2]
	ldr r0, _08025890 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _080258A0
	ldr r0, _08025894 @ =gHitMarker
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 1
	ands r0, r1
	cmp r0, 0
	beq _0802586E
	ldr r1, _08025898 @ =gBattleMons
	ldrb r2, [r2]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 17
	ands r0, r1
	cmp r0, 0
	beq _0802586E
	ldr r0, _0802589C @ =gDisableStructs
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	cmp r0, 0
	bne _080258A0
_0802586E:
	movs r0, 0
	bl BtlController_EmitHitAnimation
	ldr r0, _0802588C @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBattlerForControllerExec
	ldr r1, _08025888 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	b _080258A6
	.align 2, 0
_08025888: .4byte gBattlescriptCurrInstr
_0802588C: .4byte gActiveBattler
_08025890: .4byte gMoveResultFlags
_08025894: .4byte gHitMarker
_08025898: .4byte gBattleMons
_0802589C: .4byte gDisableStructs
_080258A0:
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
_080258A6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end atk5C_hitanimation

	thumb_func_start atk5D_getmoneyreward
atk5D_getmoneyreward: @ 80258AC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0
	movs r5, 0
	ldr r0, _080258F0 @ =gBattleOutcome
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080258C0
	b _080259FA
_080258C0:
	ldr r0, _080258F4 @ =gTrainerBattleOpponent_A
	ldrh r2, [r0]
	movs r1, 0x80
	lsls r1, 3
	cmp r2, r1
	bne _08025904
	ldr r0, _080258F8 @ =gBattleResources
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, 0x94
	ldrb r2, [r0]
	ldr r0, _080258FC @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x4A
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r4, r2, 0
	muls r4, r0
	ldr r0, _08025900 @ =gSaveBlock1Ptr
	mov r8, r0
	b _080259E8
	.align 2, 0
_080258F0: .4byte gBattleOutcome
_080258F4: .4byte gTrainerBattleOpponent_A
_080258F8: .4byte gBattleResources
_080258FC: .4byte gBattleStruct
_08025900: .4byte gSaveBlock1Ptr
_08025904:
	ldr r2, _08025920 @ =gTrainers
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r3, r0, 3
	adds r4, r3, r2
	ldrb r1, [r4]
	cmp r1, 0x1
	beq _0802595A
	cmp r1, 0x1
	bgt _08025924
	cmp r1, 0
	beq _0802592E
	b _08025970
	.align 2, 0
_08025920: .4byte gTrainers
_08025924:
	cmp r1, 0x2
	beq _08025944
	cmp r1, 0x3
	beq _0802595A
	b _08025970
_0802592E:
	adds r0, r2, 0
	adds r0, 0x24
	adds r0, r3, r0
	ldr r1, [r0]
	adds r0, r4, 0
	adds r0, 0x20
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r1
	subs r0, 0x8
	b _0802596E
_08025944:
	adds r0, r2, 0
	adds r0, 0x24
	adds r0, r3, r0
	ldr r1, [r0]
	adds r0, r4, 0
	adds r0, 0x20
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r1
	subs r0, 0x8
	b _0802596E
_0802595A:
	adds r0, r2, 0
	adds r0, 0x24
	adds r0, r3, r0
	ldr r1, [r0]
	adds r0, r4, 0
	adds r0, 0x20
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	subs r0, 0x10
_0802596E:
	ldrb r5, [r0, 0x2]
_08025970:
	ldr r0, _080259CC @ =gTrainerMoneyTable
	lsls r1, r6, 2
	adds r3, r1, r0
	ldrb r1, [r3]
	ldr r7, _080259D0 @ =gBattleStruct
	mov r12, r0
	lsls r4, r5, 2
	ldr r5, _080259D4 @ =gBattleTypeFlags
	ldr r0, _080259D8 @ =gSaveBlock1Ptr
	mov r8, r0
	cmp r1, 0xFF
	beq _080259AA
	ldr r2, _080259DC @ =gTrainers
	ldr r0, _080259E0 @ =gTrainerBattleOpponent_A
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r2, [r0, 0x1]
	adds r1, r3, 0
_0802599A:
	ldrb r0, [r1]
	cmp r0, r2
	beq _080259AA
	adds r1, 0x4
	adds r6, 0x1
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _0802599A
_080259AA:
	ldr r0, [r7]
	adds r0, 0x4A
	ldrb r0, [r0]
	adds r3, r4, 0
	muls r3, r0
	lsls r0, r6, 2
	add r0, r12
	ldrb r2, [r0, 0x1]
	ldr r0, [r5]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080259E4
	lsls r0, r2, 1
	adds r4, r3, 0
	muls r4, r0
	b _080259E8
	.align 2, 0
_080259CC: .4byte gTrainerMoneyTable
_080259D0: .4byte gBattleStruct
_080259D4: .4byte gBattleTypeFlags
_080259D8: .4byte gSaveBlock1Ptr
_080259DC: .4byte gTrainers
_080259E0: .4byte gTrainerBattleOpponent_A
_080259E4:
	adds r4, r3, 0
	muls r4, r2
_080259E8:
	mov r1, r8
	ldr r0, [r1]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	adds r1, r4, 0
	bl AddMoney
	b _08025A00
_080259FA:
	bl sub_8054C04
	adds r4, r0, 0
_08025A00:
	ldr r1, _08025A40 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	movs r0, 0x4
	strb r0, [r1, 0x2]
	movs r0, 0x5
	strb r0, [r1, 0x3]
	strb r4, [r1, 0x4]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r4
	lsrs r0, 8
	strb r0, [r1, 0x5]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r4
	lsrs r0, 16
	strb r0, [r1, 0x6]
	lsrs r0, r4, 24
	strb r0, [r1, 0x7]
	movs r0, 0xFF
	strb r0, [r1, 0x8]
	cmp r4, 0
	beq _08025A48
	ldr r1, _08025A44 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08025A62
	.align 2, 0
_08025A40: .4byte gBattleTextBuff1
_08025A44: .4byte gBattlescriptCurrInstr
_08025A48:
	ldr r3, _08025A6C @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_08025A62:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025A6C: .4byte gBattlescriptCurrInstr
	thumb_func_end atk5D_getmoneyreward

	thumb_func_start atk5E
atk5E: @ 8025A70
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r4, _08025A94 @ =gBattlescriptCurrInstr
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl GetBattlerForBattleScript
	ldr r6, _08025A98 @ =gActiveBattler
	strb r0, [r6]
	ldr r5, _08025A9C @ =gBattleCommunication
	ldrb r0, [r5]
	mov r8, r4
	cmp r0, 0
	beq _08025AA0
	cmp r0, 0x1
	beq _08025AB8
	b _08025B0C
	.align 2, 0
_08025A94: .4byte gBattlescriptCurrInstr
_08025A98: .4byte gActiveBattler
_08025A9C: .4byte gBattleCommunication
_08025AA0:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl BtlController_EmitGetMonData
	ldrb r0, [r6]
	bl MarkBattlerForControllerExec
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _08025B0C
_08025AB8:
	ldr r0, _08025B18 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	bne _08025B0C
	ldrb r0, [r6]
	lsls r0, 9
	ldr r1, _08025B1C @ =gUnknown_20233C8
	adds r0, r1
	mov r12, r0
	movs r2, 0
	adds r4, r6, 0
	movs r5, 0x58
	ldr r6, _08025B20 @ =gUnknown_2023C08
	adds r7, r6, 0
	subs r7, 0x18
	mov r3, r12
	adds r3, 0xC
_08025ADA:
	lsls r1, r2, 1
	ldrb r0, [r4]
	muls r0, r5
	adds r1, r0
	adds r1, r7
	ldrh r0, [r3]
	strh r0, [r1]
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r2, r1
	adds r1, r6
	mov r0, r12
	adds r0, 0x24
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r3, 0x2
	adds r2, 0x1
	cmp r2, 0x3
	ble _08025ADA
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
_08025B0C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025B18: .4byte gBattleControllerExecFlags
_08025B1C: .4byte gUnknown_20233C8
_08025B20: .4byte gUnknown_2023C08
	thumb_func_end atk5E

	thumb_func_start atk5F_swapattackerwithtarget
atk5F_swapattackerwithtarget: @ 8025B24
	push {lr}
	ldr r0, _08025B4C @ =gActiveBattler
	ldr r2, _08025B50 @ =gBattlerAttacker
	ldrb r3, [r2]
	strb r3, [r0]
	ldr r1, _08025B54 @ =gBattlerTarget
	ldrb r0, [r1]
	strb r0, [r2]
	strb r3, [r1]
	ldr r2, _08025B58 @ =gHitMarker
	ldr r1, [r2]
	movs r3, 0x80
	lsls r3, 5
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	beq _08025B60
	ldr r0, _08025B5C @ =0xffffefff
	ands r1, r0
	b _08025B62
	.align 2, 0
_08025B4C: .4byte gActiveBattler
_08025B50: .4byte gBattlerAttacker
_08025B54: .4byte gBattlerTarget
_08025B58: .4byte gHitMarker
_08025B5C: .4byte 0xffffefff
_08025B60:
	orrs r1, r3
_08025B62:
	str r1, [r2]
	ldr r1, _08025B70 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08025B70: .4byte gBattlescriptCurrInstr
	thumb_func_end atk5F_swapattackerwithtarget

	thumb_func_start atk60_incrementgamestat
atk60_incrementgamestat: @ 8025B74
	push {lr}
	ldr r0, _08025B9C @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08025B8E
	ldr r0, _08025BA0 @ =gBattlescriptCurrInstr
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl IncrementGameStat
_08025B8E:
	ldr r1, _08025BA0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08025B9C: .4byte gBattlerAttacker
_08025BA0: .4byte gBattlescriptCurrInstr
	thumb_func_end atk60_incrementgamestat

	thumb_func_start atk61_drawpartystatussummary
atk61_drawpartystatussummary: @ 8025BA4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x30
	ldr r0, _08025C08 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	bne _08025C58
	ldr r0, _08025C0C @ =gBattlescriptCurrInstr
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl GetBattlerForBattleScript
	ldr r1, _08025C10 @ =gActiveBattler
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetBattlerSide
	lsls r0, 24
	ldr r1, _08025C14 @ =gEnemyParty
	mov r8, r1
	cmp r0, 0
	bne _08025BD6
	ldr r0, _08025C18 @ =gPlayerParty
	mov r8, r0
_08025BD6:
	movs r7, 0
	add r6, sp, 0x4
	mov r5, sp
_08025BDC:
	movs r0, 0x64
	muls r0, r7
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _08025C00
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	bne _08025C20
_08025C00:
	ldr r0, _08025C1C @ =0x0000ffff
	strh r0, [r5]
	movs r0, 0
	b _08025C32
	.align 2, 0
_08025C08: .4byte gBattleControllerExecFlags
_08025C0C: .4byte gBattlescriptCurrInstr
_08025C10: .4byte gActiveBattler
_08025C14: .4byte gEnemyParty
_08025C18: .4byte gPlayerParty
_08025C1C: .4byte 0x0000ffff
_08025C20:
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	strh r0, [r5]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
_08025C32:
	str r0, [r6]
	adds r6, 0x8
	adds r5, 0x8
	adds r7, 0x1
	cmp r7, 0x5
	ble _08025BDC
	movs r0, 0
	mov r1, sp
	movs r2, 0x1
	bl BtlController_EmitDrawPartyStatusSummary
	ldr r0, _08025C64 @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBattlerForControllerExec
	ldr r1, _08025C68 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
_08025C58:
	add sp, 0x30
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025C64: .4byte gActiveBattler
_08025C68: .4byte gBattlescriptCurrInstr
	thumb_func_end atk61_drawpartystatussummary

	thumb_func_start atk62_hidepartystatussummary
atk62_hidepartystatussummary: @ 8025C6C
	push {r4,r5,lr}
	ldr r5, _08025C94 @ =gBattlescriptCurrInstr
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl GetBattlerForBattleScript
	ldr r4, _08025C98 @ =gActiveBattler
	strb r0, [r4]
	movs r0, 0
	bl BtlController_EmitHidePartyStatusSummary
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025C94: .4byte gBattlescriptCurrInstr
_08025C98: .4byte gActiveBattler
	thumb_func_end atk62_hidepartystatussummary

	thumb_func_start atk63_jumptocalledmove
atk63_jumptocalledmove: @ 8025C9C
	push {r4,lr}
	ldr r0, _08025CB4 @ =gBattlescriptCurrInstr
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0
	beq _08025CC0
	ldr r0, _08025CB8 @ =gCurrentMove
	ldr r1, _08025CBC @ =gCalledMove
	ldrh r1, [r1]
	strh r1, [r0]
	b _08025CCE
	.align 2, 0
_08025CB4: .4byte gBattlescriptCurrInstr
_08025CB8: .4byte gCurrentMove
_08025CBC: .4byte gCalledMove
_08025CC0:
	ldr r2, _08025CEC @ =gChosenMove
	ldr r1, _08025CF0 @ =gCurrentMove
	ldr r0, _08025CF4 @ =gCalledMove
	ldrh r0, [r0]
	strh r0, [r1]
	strh r0, [r2]
	adds r0, r1, 0
_08025CCE:
	ldr r3, _08025CF8 @ =gBattleScriptsForMoveEffects
	ldr r2, _08025CFC @ =gBattleMoves
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08025CEC: .4byte gChosenMove
_08025CF0: .4byte gCurrentMove
_08025CF4: .4byte gCalledMove
_08025CF8: .4byte gBattleScriptsForMoveEffects
_08025CFC: .4byte gBattleMoves
	thumb_func_end atk63_jumptocalledmove

	thumb_func_start atk64_statusanimation
atk64_statusanimation: @ 8025D00
	push {r4,lr}
	ldr r0, _08025D70 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	bne _08025D68
	ldr r0, _08025D74 @ =gBattlescriptCurrInstr
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl GetBattlerForBattleScript
	ldr r4, _08025D78 @ =gActiveBattler
	strb r0, [r4]
	ldr r1, _08025D7C @ =gStatuses3
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08025D80 @ =0x000400c0
	ands r0, r1
	cmp r0, 0
	bne _08025D60
	ldr r0, _08025D84 @ =gDisableStructs
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	cmp r0, 0
	bne _08025D60
	ldr r0, _08025D88 @ =gHitMarker
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08025D60
	ldr r1, _08025D8C @ =gBattleMons
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x4C
	adds r0, r1
	ldr r2, [r0]
	movs r0, 0
	movs r1, 0
	bl BtlController_EmitStatusAnimation
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_08025D60:
	ldr r1, _08025D74 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
_08025D68:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08025D70: .4byte gBattleControllerExecFlags
_08025D74: .4byte gBattlescriptCurrInstr
_08025D78: .4byte gActiveBattler
_08025D7C: .4byte gStatuses3
_08025D80: .4byte 0x000400c0
_08025D84: .4byte gDisableStructs
_08025D88: .4byte gHitMarker
_08025D8C: .4byte gBattleMons
	thumb_func_end atk64_statusanimation

	thumb_func_start atk65_status2animation
atk65_status2animation: @ 8025D90
	push {r4,r5,lr}
	ldr r0, _08025E18 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	bne _08025E10
	ldr r4, _08025E1C @ =gBattlescriptCurrInstr
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl GetBattlerForBattleScript
	ldr r5, _08025E20 @ =gActiveBattler
	strb r0, [r5]
	ldr r1, [r4]
	ldrb r3, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 8
	orrs r3, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 16
	orrs r3, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 24
	orrs r3, r0
	ldr r1, _08025E24 @ =gStatuses3
	ldrb r2, [r5]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08025E28 @ =0x000400c0
	ands r0, r1
	cmp r0, 0
	bne _08025E08
	ldr r0, _08025E2C @ =gDisableStructs
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	cmp r0, 0
	bne _08025E08
	ldr r0, _08025E30 @ =gHitMarker
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08025E08
	ldr r1, _08025E34 @ =gBattleMons
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r2, [r0]
	ands r2, r3
	movs r0, 0
	movs r1, 0x1
	bl BtlController_EmitStatusAnimation
	ldrb r0, [r5]
	bl MarkBattlerForControllerExec
_08025E08:
	ldr r1, _08025E1C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x6
	str r0, [r1]
_08025E10:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025E18: .4byte gBattleControllerExecFlags
_08025E1C: .4byte gBattlescriptCurrInstr
_08025E20: .4byte gActiveBattler
_08025E24: .4byte gStatuses3
_08025E28: .4byte 0x000400c0
_08025E2C: .4byte gDisableStructs
_08025E30: .4byte gHitMarker
_08025E34: .4byte gBattleMons
	thumb_func_end atk65_status2animation

	thumb_func_start atk66_chosenstatusanimation
atk66_chosenstatusanimation: @ 8025E38
	push {r4,r5,lr}
	ldr r0, _08025EB0 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	bne _08025EAA
	ldr r4, _08025EB4 @ =gBattlescriptCurrInstr
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl GetBattlerForBattleScript
	ldr r5, _08025EB8 @ =gActiveBattler
	strb r0, [r5]
	ldr r4, [r4]
	ldrb r2, [r4, 0x3]
	ldrb r0, [r4, 0x4]
	lsls r0, 8
	orrs r2, r0
	ldrb r0, [r4, 0x5]
	lsls r0, 16
	orrs r2, r0
	ldrb r0, [r4, 0x6]
	lsls r0, 24
	orrs r2, r0
	ldr r1, _08025EBC @ =gStatuses3
	ldrb r3, [r5]
	lsls r0, r3, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08025EC0 @ =0x000400c0
	ands r0, r1
	cmp r0, 0
	bne _08025EA2
	ldr r0, _08025EC4 @ =gDisableStructs
	lsls r1, r3, 3
	subs r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	cmp r0, 0
	bne _08025EA2
	ldr r0, _08025EC8 @ =gHitMarker
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08025EA2
	ldrb r1, [r4, 0x2]
	movs r0, 0
	bl BtlController_EmitStatusAnimation
	ldrb r0, [r5]
	bl MarkBattlerForControllerExec
_08025EA2:
	ldr r1, _08025EB4 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x7
	str r0, [r1]
_08025EAA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025EB0: .4byte gBattleControllerExecFlags
_08025EB4: .4byte gBattlescriptCurrInstr
_08025EB8: .4byte gActiveBattler
_08025EBC: .4byte gStatuses3
_08025EC0: .4byte 0x000400c0
_08025EC4: .4byte gDisableStructs
_08025EC8: .4byte gHitMarker
	thumb_func_end atk66_chosenstatusanimation

	thumb_func_start atk67_yesnobox
atk67_yesnobox: @ 8025ECC
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _08025EE0 @ =gBattleCommunication
	ldrb r4, [r5]
	cmp r4, 0
	beq _08025EE4
	cmp r4, 0x1
	beq _08025F0C
	b _08025F9A
	.align 2, 0
_08025EE0: .4byte gBattleCommunication
_08025EE4:
	str r4, [sp]
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl HandleBattleWindow
	ldr r0, _08025F08 @ =gText_BattleYesNoChoice
	movs r1, 0xE
	bl BattlePutTextOnWindow
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	strb r4, [r5, 0x1]
	bl BattleCreateYesNoCursorAt
	b _08025F9A
	.align 2, 0
_08025F08: .4byte gText_BattleYesNoChoice
_08025F0C:
	ldr r0, _08025F6C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08025F30
	ldrb r0, [r5, 0x1]
	cmp r0, 0
	beq _08025F30
	movs r0, 0x5
	bl PlaySE
	bl BattleDestroyYesNoCursorAt
	movs r0, 0
	strb r0, [r5, 0x1]
	bl BattleCreateYesNoCursorAt
_08025F30:
	ldr r0, _08025F6C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08025F56
	ldr r4, _08025F70 @ =gBattleCommunication
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08025F56
	movs r0, 0x5
	bl PlaySE
	bl BattleDestroyYesNoCursorAt
	movs r0, 0x1
	strb r0, [r4, 0x1]
	bl BattleCreateYesNoCursorAt
_08025F56:
	ldr r0, _08025F6C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08025F74
	ldr r0, _08025F70 @ =gBattleCommunication
	movs r4, 0x1
	strb r4, [r0, 0x1]
	b _08025F7E
	.align 2, 0
_08025F6C: .4byte gMain
_08025F70: .4byte gBattleCommunication
_08025F74:
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08025F9A
_08025F7E:
	movs r0, 0x5
	bl PlaySE
	str r4, [sp]
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl HandleBattleWindow
	ldr r1, _08025FA4 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_08025F9A:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025FA4: .4byte gBattlescriptCurrInstr
	thumb_func_end atk67_yesnobox

	thumb_func_start atk68_cancelallactions
atk68_cancelallactions: @ 8025FA8
	push {r4,r5,lr}
	movs r1, 0
	ldr r2, _08025FD4 @ =gBattlersCount
	ldr r5, _08025FD8 @ =gBattlescriptCurrInstr
	ldrb r0, [r2]
	cmp r1, r0
	bge _08025FC6
	ldr r4, _08025FDC @ =gActionsByTurnOrder
	movs r3, 0xC
_08025FBA:
	adds r0, r1, r4
	strb r3, [r0]
	adds r1, 0x1
	ldrb r0, [r2]
	cmp r1, r0
	blt _08025FBA
_08025FC6:
	ldr r0, [r5]
	adds r0, 0x1
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025FD4: .4byte gBattlersCount
_08025FD8: .4byte gBattlescriptCurrInstr
_08025FDC: .4byte gActionsByTurnOrder
	thumb_func_end atk68_cancelallactions

	thumb_func_start atk69_adjustsetdamage
atk69_adjustsetdamage: @ 8025FE0
	push {r4-r7,lr}
	ldr r7, _08026008 @ =gBattleMons
	ldr r6, _0802600C @ =gBattlerTarget
	ldrb r2, [r6]
	movs r5, 0x58
	adds r0, r2, 0
	muls r0, r5
	adds r1, r0, r7
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _08026014
	ldr r1, _08026010 @ =gEnigmaBerries
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x7]
	ldrb r6, [r0, 0x1A]
	b _0802602E
	.align 2, 0
_08026008: .4byte gBattleMons
_0802600C: .4byte gBattlerTarget
_08026010: .4byte gEnigmaBerries
_08026014:
	ldrh r0, [r1, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r7
	ldrh r0, [r0, 0x2E]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r6, r0, 24
_0802602E:
	ldr r1, _080260F0 @ =gPotentialItemEffectBattler
	ldr r5, _080260F4 @ =gBattlerTarget
	ldrb r0, [r5]
	strb r0, [r1]
	cmp r4, 0x27
	bne _0802606C
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r6
	bcs _0802606C
	ldrb r0, [r5]
	movs r1, 0x27
	bl RecordItemEffectBattle
	ldr r2, _080260F8 @ =gSpecialStatuses
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
_0802606C:
	ldr r2, _080260FC @ =gBattleMons
	ldr r3, _080260F4 @ =gBattlerTarget
	ldrb r4, [r3]
	movs r0, 0x58
	muls r0, r4
	adds r1, r2, 0
	adds r1, 0x50
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 17
	ands r1, r0
	adds r5, r2, 0
	cmp r1, 0
	bne _0802613C
	ldr r2, _08026100 @ =gBattleMoves
	ldr r0, _08026104 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x65
	beq _080260BE
	ldr r0, _08026108 @ =gProtectStructs
	lsls r1, r4, 4
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 30
	cmp r0, 0
	blt _080260BE
	ldr r0, _080260F8 @ =gSpecialStatuses
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	lsrs r0, 7
	cmp r0, 0
	beq _0802613C
_080260BE:
	ldrb r0, [r3]
	movs r4, 0x58
	muls r0, r4
	adds r0, r5
	ldrh r1, [r0, 0x28]
	ldr r2, _0802610C @ =gBattleMoveDamage
	ldr r0, [r2]
	cmp r1, r0
	bgt _0802613C
	subs r0, r1, 0x1
	str r0, [r2]
	ldr r1, _08026108 @ =gProtectStructs
	ldrb r3, [r3]
	lsls r0, r3, 4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 30
	cmp r0, 0
	bge _08026114
	ldr r0, _08026110 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	b _0802613C
	.align 2, 0
_080260F0: .4byte gPotentialItemEffectBattler
_080260F4: .4byte gBattlerTarget
_080260F8: .4byte gSpecialStatuses
_080260FC: .4byte gBattleMons
_08026100: .4byte gBattleMoves
_08026104: .4byte gCurrentMove
_08026108: .4byte gProtectStructs
_0802610C: .4byte gBattleMoveDamage
_08026110: .4byte gMoveResultFlags
_08026114:
	ldr r0, _0802614C @ =gSpecialStatuses
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	lsrs r0, 7
	cmp r0, 0
	beq _0802613C
	ldr r2, _08026150 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08026154 @ =gLastUsedItem
	adds r0, r3, 0
	muls r0, r4
	adds r0, r5
	ldrh r0, [r0, 0x2E]
	strh r0, [r1]
_0802613C:
	ldr r1, _08026158 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802614C: .4byte gSpecialStatuses
_08026150: .4byte gMoveResultFlags
_08026154: .4byte gLastUsedItem
_08026158: .4byte gBattlescriptCurrInstr
	thumb_func_end atk69_adjustsetdamage

	thumb_func_start atk6A_removeitem
atk6A_removeitem: @ 802615C
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _080261BC @ =gBattlescriptCurrInstr
	ldr r0, [r6]
	ldrb r0, [r0, 0x1]
	bl GetBattlerForBattleScript
	ldr r5, _080261C0 @ =gActiveBattler
	strb r0, [r5]
	ldr r1, _080261C4 @ =gBattleStruct
	ldrb r4, [r5]
	lsls r0, r4, 1
	adds r0, 0xB8
	ldr r1, [r1]
	adds r1, r0
	ldr r2, _080261C8 @ =gBattleMons
	movs r3, 0x58
	adds r0, r4, 0
	muls r0, r3
	adds r0, r2
	ldrh r0, [r0, 0x2E]
	strh r0, [r1]
	ldrb r0, [r5]
	muls r0, r3
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x2E]
	ldrb r0, [r5]
	muls r0, r3
	adds r2, 0x2E
	adds r0, r2
	str r0, [sp]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl BtlController_EmitSetMonData
	ldrb r0, [r5]
	bl MarkBattlerForControllerExec
	ldr r0, [r6]
	adds r0, 0x2
	str r0, [r6]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080261BC: .4byte gBattlescriptCurrInstr
_080261C0: .4byte gActiveBattler
_080261C4: .4byte gBattleStruct
_080261C8: .4byte gBattleMons
	thumb_func_end atk6A_removeitem

	thumb_func_start atk6B_atknameinbuff1
atk6B_atknameinbuff1: @ 80261CC
	ldr r1, _080261F8 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x7
	strb r0, [r1, 0x1]
	ldr r2, _080261FC @ =gBattlerAttacker
	ldrb r0, [r2]
	strb r0, [r1, 0x2]
	ldr r3, _08026200 @ =gBattlerPartyIndexes
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _08026204 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_080261F8: .4byte gBattleTextBuff1
_080261FC: .4byte gBattlerAttacker
_08026200: .4byte gBattlerPartyIndexes
_08026204: .4byte gBattlescriptCurrInstr
	thumb_func_end atk6B_atknameinbuff1

	thumb_func_start atk6C_drawlvlupbox
atk6C_drawlvlupbox: @ 8026208
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08026224 @ =gBattleScripting
	ldrb r1, [r0, 0x1E]
	adds r4, r0, 0
	cmp r1, 0
	bne _0802622C
	bl IsMonGettingExpSentOut
	cmp r0, 0
	beq _08026228
	movs r0, 0x3
	b _0802622A
	.align 2, 0
_08026224: .4byte gBattleScripting
_08026228:
	movs r0, 0x1
_0802622A:
	strb r0, [r4, 0x1E]
_0802622C:
	ldrb r0, [r4, 0x1E]
	subs r0, 0x1
	cmp r0, 0x9
	bls _08026236
	b _080263F6
_08026236:
	lsls r0, 2
	ldr r1, _08026240 @ =_08026244
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08026240: .4byte _08026244
	.align 2, 0
_08026244:
	.4byte _0802626C
	.4byte _08026298
	.4byte _080262B0
	.4byte _08026304
	.4byte _08026318
	.4byte _08026330
	.4byte _08026318
	.4byte _08026350
	.4byte _08026380
	.4byte _080263C4
_0802626C:
	ldr r1, _08026290 @ =gBattle_BG2_Y
	movs r0, 0x60
	strh r0, [r1]
	movs r0, 0x2
	movs r1, 0x7
	movs r2, 0
	bl SetBgAttribute
	movs r0, 0x2
	bl ShowBg
	bl sub_8026480
	ldr r1, _08026294 @ =gBattleScripting
	movs r0, 0x2
	strb r0, [r1, 0x1E]
	b _080263F6
	.align 2, 0
_08026290: .4byte gBattle_BG2_Y
_08026294: .4byte gBattleScripting
_08026298:
	bl sub_80264D0
	lsls r0, 24
	cmp r0, 0
	beq _080262A4
	b _080263F6
_080262A4:
	ldr r1, _080262AC @ =gBattleScripting
	movs r0, 0x3
	strb r0, [r1, 0x1E]
	b _080263F6
	.align 2, 0
_080262AC: .4byte gBattleScripting
_080262B0:
	ldr r1, _080262F8 @ =gBattle_BG1_X
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080262FC @ =gBattle_BG1_Y
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	movs r1, 0x7
	movs r2, 0x1
	bl SetBgAttribute
	movs r0, 0x1
	movs r1, 0x7
	movs r2, 0
	bl SetBgAttribute
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x80
	str r0, [sp]
	movs r0, 0x12
	movs r1, 0x7
	movs r2, 0x1D
	movs r3, 0x13
	bl HandleBattleWindow
	ldr r1, _08026300 @ =gBattleScripting
	movs r0, 0x4
	strb r0, [r1, 0x1E]
	b _080263F6
	.align 2, 0
_080262F8: .4byte gBattle_BG1_X
_080262FC: .4byte gBattle_BG1_Y
_08026300: .4byte gBattleScripting
_08026304:
	bl DrawLevelUpWindow1
	movs r0, 0xC
	bl PutWindowTilemap
	movs r0, 0xC
	movs r1, 0x3
	bl CopyWindowToVram
	b _0802636E
_08026318:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080263F6
	ldr r0, _0802632C @ =gBattle_BG1_Y
	strh r1, [r0]
	b _0802636E
	.align 2, 0
_0802632C: .4byte gBattle_BG1_Y
_08026330:
	ldr r0, _0802634C @ =gMain
	ldrh r0, [r0, 0x2E]
	cmp r0, 0
	beq _080263F6
	movs r0, 0x5
	bl PlaySE
	bl DrawLevelUpWindow2
	movs r0, 0xC
	movs r1, 0x2
	bl CopyWindowToVram
	b _0802636E
	.align 2, 0
_0802634C: .4byte gMain
_08026350:
	ldr r0, _08026378 @ =gMain
	ldrh r0, [r0, 0x2E]
	cmp r0, 0
	beq _080263F6
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x81
	str r0, [sp]
	movs r0, 0x12
	movs r1, 0x7
	movs r2, 0x1D
	movs r3, 0x13
	bl HandleBattleWindow
_0802636E:
	ldr r1, _0802637C @ =gBattleScripting
	ldrb r0, [r1, 0x1E]
	adds r0, 0x1
	strb r0, [r1, 0x1E]
	b _080263F6
	.align 2, 0
_08026378: .4byte gMain
_0802637C: .4byte gBattleScripting
_08026380:
	bl sub_8026648
	lsls r0, 24
	cmp r0, 0
	bne _080263F6
	movs r0, 0xD
	bl ClearWindowTilemap
	movs r0, 0xD
	movs r1, 0x1
	bl CopyWindowToVram
	movs r0, 0xC
	bl ClearWindowTilemap
	movs r0, 0xC
	movs r1, 0x1
	bl CopyWindowToVram
	movs r0, 0x2
	movs r1, 0x7
	movs r2, 0x2
	bl SetBgAttribute
	movs r0, 0x2
	bl ShowBg
	ldr r1, _080263C0 @ =gBattleScripting
	movs r0, 0xA
	strb r0, [r1, 0x1E]
	b _080263F6
	.align 2, 0
_080263C0: .4byte gBattleScripting
_080263C4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _080263F6
	movs r0, 0
	movs r1, 0x7
	movs r2, 0
	bl SetBgAttribute
	movs r0, 0x1
	movs r1, 0x7
	movs r2, 0x1
	bl SetBgAttribute
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	ldr r1, _08026400 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_080263F6:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08026400: .4byte gBattlescriptCurrInstr
	thumb_func_end atk6C_drawlvlupbox

	thumb_func_start DrawLevelUpWindow1
DrawLevelUpWindow1: @ 8026404
	push {lr}
	sub sp, 0x14
	ldr r0, _0802643C @ =gBattleStruct
	ldr r0, [r0]
	ldrb r1, [r0, 0x10]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08026440 @ =gPlayerParty
	adds r0, r1
	add r1, sp, 0x8
	bl sub_811D130
	ldr r0, _08026444 @ =gBattleResources
	ldr r0, [r0]
	ldr r1, [r0, 0x10]
	movs r0, 0xD
	str r0, [sp]
	movs r0, 0xF
	str r0, [sp, 0x4]
	movs r0, 0xC
	add r2, sp, 0x8
	movs r3, 0xE
	bl sub_811E7F0
	add sp, 0x14
	pop {r0}
	bx r0
	.align 2, 0
_0802643C: .4byte gBattleStruct
_08026440: .4byte gPlayerParty
_08026444: .4byte gBattleResources
	thumb_func_end DrawLevelUpWindow1

	thumb_func_start DrawLevelUpWindow2
DrawLevelUpWindow2: @ 8026448
	push {lr}
	sub sp, 0x10
	ldr r0, _08026478 @ =gBattleStruct
	ldr r0, [r0]
	ldrb r1, [r0, 0x10]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802647C @ =gPlayerParty
	adds r0, r1
	add r1, sp, 0x4
	bl sub_811D130
	movs r0, 0xF
	str r0, [sp]
	movs r0, 0xC
	add r1, sp, 0x4
	movs r2, 0xE
	movs r3, 0xD
	bl sub_811E93C
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_08026478: .4byte gBattleStruct
_0802647C: .4byte gPlayerParty
	thumb_func_end DrawLevelUpWindow2

	thumb_func_start sub_8026480
sub_8026480: @ 8026480
	push {lr}
	ldr r1, _080264C0 @ =gBattle_BG2_Y
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080264C4 @ =gBattle_BG2_X
	movs r2, 0xD0
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080264C8 @ =gUnknown_82506D0
	movs r1, 0x60
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _080264CC @ =gUnknown_82506F0
	movs r0, 0xD
	movs r2, 0
	movs r3, 0
	bl CopyToWindowPixelBuffer
	movs r0, 0xD
	bl PutWindowTilemap
	movs r0, 0xD
	movs r1, 0x3
	bl CopyWindowToVram
	bl PutMonIconOnLvlUpBox
	pop {r0}
	bx r0
	.align 2, 0
_080264C0: .4byte gBattle_BG2_Y
_080264C4: .4byte gBattle_BG2_X
_080264C8: .4byte gUnknown_82506D0
_080264CC: .4byte gUnknown_82506F0
	thumb_func_end sub_8026480

	thumb_func_start sub_80264D0
sub_80264D0: @ 80264D0
	push {r4,r5,lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	beq _080264E0
	movs r0, 0x1
	b _0802651A
_080264E0:
	ldr r4, _080264F0 @ =gBattle_BG2_X
	ldrh r1, [r4]
	movs r5, 0x80
	lsls r5, 2
	cmp r1, r5
	bne _080264F4
	movs r0, 0
	b _0802651A
	.align 2, 0
_080264F0: .4byte gBattle_BG2_X
_080264F4:
	movs r0, 0xD0
	lsls r0, 1
	cmp r1, r0
	bne _08026500
	bl PutLevelAndGenderOnLvlUpBox
_08026500:
	ldrh r0, [r4]
	adds r0, 0x8
	strh r0, [r4]
	lsls r0, 16
	ldr r1, _08026520 @ =0x01ff0000
	cmp r0, r1
	bls _08026510
	strh r5, [r4]
_08026510:
	ldrh r1, [r4]
	eors r1, r5
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_0802651A:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08026520: .4byte 0x01ff0000
	thumb_func_end sub_80264D0

	thumb_func_start PutLevelAndGenderOnLvlUpBox
PutLevelAndGenderOnLvlUpBox: @ 8026524
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	ldr r6, _080265F8 @ =gBattleStruct
	ldr r0, [r6]
	ldrb r0, [r0, 0x10]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _080265FC @ =gPlayerParty
	adds r0, r4
	movs r1, 0x38
	bl GetMonData
	mov r8, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, [r6]
	ldrb r0, [r0, 0x10]
	muls r0, r5
	adds r0, r4
	bl GetMonGender
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, [r6]
	ldrb r0, [r0, 0x10]
	muls r0, r5
	adds r0, r4
	ldr r6, _08026600 @ =gStringVar4
	adds r1, r6, 0
	bl GetMonNickname
	str r6, [sp]
	mov r1, sp
	movs r4, 0
	movs r0, 0xD
	strb r0, [r1, 0x4]
	mov r0, sp
	strb r4, [r0, 0x5]
	movs r5, 0x20
	strb r5, [r0, 0x6]
	strb r4, [r0, 0x7]
	strb r5, [r0, 0x8]
	strb r4, [r0, 0x9]
	strb r4, [r0, 0xA]
	strb r4, [r0, 0xB]
	mov r3, sp
	ldrb r2, [r3, 0xC]
	movs r1, 0x10
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3, 0xC]
	mov r2, sp
	movs r0, 0x10
	strb r0, [r2, 0xC]
	ldrb r0, [r2, 0xD]
	ands r1, r0
	strb r1, [r2, 0xD]
	mov r0, sp
	strb r5, [r0, 0xD]
	movs r1, 0xFF
	movs r2, 0
	bl AddTextPrinter
	movs r0, 0xF9
	strb r0, [r6]
	adds r6, 0x1
	movs r0, 0x5
	strb r0, [r6]
	adds r6, 0x1
	strb r4, [r6]
	adds r6, 0x1
	adds r4, r6, 0
	adds r0, r4, 0
	mov r1, r8
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r6, r0, 0
	movs r1, 0
	movs r2, 0x5
	bl StringFill
	adds r6, r4, 0x4
	cmp r7, 0xFF
	beq _08026624
	cmp r7, 0
	bne _08026604
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0xC
	bl WriteColorChangeControlCode
	adds r6, r0, 0
	movs r1, 0x1
	movs r2, 0xD
	bl WriteColorChangeControlCode
	adds r6, r0, 0
	movs r0, 0xB5
	b _0802661C
	.align 2, 0
_080265F8: .4byte gBattleStruct
_080265FC: .4byte gPlayerParty
_08026600: .4byte gStringVar4
_08026604:
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0xE
	bl WriteColorChangeControlCode
	adds r6, r0, 0
	movs r1, 0x1
	movs r2, 0xF
	bl WriteColorChangeControlCode
	adds r6, r0, 0
	movs r0, 0xB6
_0802661C:
	strb r0, [r6]
	adds r6, 0x1
	movs r0, 0xFF
	strb r0, [r6]
_08026624:
	mov r0, sp
	movs r1, 0xA
	strb r1, [r0, 0x7]
	strb r1, [r0, 0x9]
	movs r1, 0xFF
	movs r2, 0
	bl AddTextPrinter
	movs r0, 0xD
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end PutLevelAndGenderOnLvlUpBox

	thumb_func_start sub_8026648
sub_8026648: @ 8026648
	push {lr}
	ldr r0, _0802665C @ =gBattle_BG2_X
	ldrh r1, [r0]
	movs r3, 0xD0
	lsls r3, 1
	adds r2, r0, 0
	cmp r1, r3
	bne _08026660
	movs r0, 0
	b _08026684
	.align 2, 0
_0802665C: .4byte gBattle_BG2_X
_08026660:
	ldrh r0, [r2]
	adds r1, r0, 0
	subs r1, 0x10
	ldr r0, _08026670 @ =0x0000019f
	cmp r1, r0
	bgt _08026674
	strh r3, [r2]
	b _08026676
	.align 2, 0
_08026670: .4byte 0x0000019f
_08026674:
	strh r1, [r2]
_08026676:
	ldrh r1, [r2]
	movs r0, 0xD0
	lsls r0, 1
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_08026684:
	pop {r1}
	bx r1
	thumb_func_end sub_8026648

	thumb_func_start PutMonIconOnLvlUpBox
PutMonIconOnLvlUpBox: @ 8026688
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x10
	ldr r0, _08026730 @ =gBattleStruct
	mov r8, r0
	ldr r0, [r0]
	ldrb r0, [r0, 0x10]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _08026734 @ =gPlayerParty
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r1, r8
	ldr r0, [r1]
	ldrb r0, [r0, 0x10]
	muls r0, r6
	adds r0, r5
	movs r1, 0
	bl GetMonData
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x1
	bl GetMonIconPtr
	str r0, [sp]
	ldr r5, _08026738 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r5
	movs r1, 0x80
	lsls r1, 2
	orrs r0, r1
	ldr r1, _0802673C @ =0x0000ffff
	ands r0, r1
	ldr r1, _08026740 @ =0xd75a0000
	orrs r0, r1
	str r0, [sp, 0x4]
	adds r0, r4, 0
	bl GetValidMonIconPalettePtr
	str r0, [sp, 0x8]
	add r4, sp, 0x8
	ldr r0, [r4, 0x4]
	ands r0, r5
	ldr r1, _08026744 @ =0x0000d75a
	orrs r0, r1
	str r0, [r4, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl LoadSpritePalette
	ldr r0, _08026748 @ =sSpriteTemplate_MonIconOnLvlUpBox
	movs r1, 0x80
	lsls r1, 1
	movs r2, 0xA
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0802674C @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x2E]
	ldr r0, _08026750 @ =gBattle_BG2_X
	ldrh r0, [r0]
	strh r0, [r1, 0x30]
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08026730: .4byte gBattleStruct
_08026734: .4byte gPlayerParty
_08026738: .4byte 0xffff0000
_0802673C: .4byte 0x0000ffff
_08026740: .4byte 0xd75a0000
_08026744: .4byte 0x0000d75a
_08026748: .4byte sSpriteTemplate_MonIconOnLvlUpBox
_0802674C: .4byte gSprites
_08026750: .4byte gBattle_BG2_X
	thumb_func_end PutMonIconOnLvlUpBox

	thumb_func_start SpriteCB_MonIconOnLvlUpBox
SpriteCB_MonIconOnLvlUpBox: @ 8026754
	push {r4,lr}
	adds r2, r0, 0
	ldr r0, _08026770 @ =gBattle_BG2_X
	ldrh r1, [r2, 0x30]
	ldrh r0, [r0]
	subs r1, r0
	strh r1, [r2, 0x24]
	lsls r1, 16
	cmp r1, 0
	beq _08026774
	movs r0, 0x1
	strh r0, [r2, 0x2E]
	b _08026790
	.align 2, 0
_08026770: .4byte gBattle_BG2_X
_08026774:
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _08026790
	adds r0, r2, 0
	bl DestroySprite
	ldr r4, _08026798 @ =0x0000d75a
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
_08026790:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08026798: .4byte 0x0000d75a
	thumb_func_end SpriteCB_MonIconOnLvlUpBox

	thumb_func_start IsMonGettingExpSentOut
IsMonGettingExpSentOut: @ 802679C
	push {lr}
	ldr r3, _080267C4 @ =gBattlerPartyIndexes
	ldr r0, _080267C8 @ =gBattleStruct
	ldr r0, [r0]
	ldrh r1, [r3]
	ldrb r2, [r0, 0x10]
	cmp r1, r2
	beq _080267BE
	ldr r0, _080267CC @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080267D0
	ldrh r0, [r3, 0x4]
	cmp r0, r2
	bne _080267D0
_080267BE:
	movs r0, 0x1
	b _080267D2
	.align 2, 0
_080267C4: .4byte gBattlerPartyIndexes
_080267C8: .4byte gBattleStruct
_080267CC: .4byte gBattleTypeFlags
_080267D0:
	movs r0, 0
_080267D2:
	pop {r1}
	bx r1
	thumb_func_end IsMonGettingExpSentOut

	thumb_func_start atk6D_resetsentmonsvalue
atk6D_resetsentmonsvalue: @ 80267D8
	push {lr}
	bl ResetSentPokesToOpponentValue
	ldr r1, _080267EC @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080267EC: .4byte gBattlescriptCurrInstr
	thumb_func_end atk6D_resetsentmonsvalue

	thumb_func_start atk6E_setatktoplayer0
atk6E_setatktoplayer0: @ 80267F0
	push {lr}
	movs r0, 0
	bl GetBattlerAtPosition
	ldr r1, _08026808 @ =gBattlerAttacker
	strb r0, [r1]
	ldr r1, _0802680C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08026808: .4byte gBattlerAttacker
_0802680C: .4byte gBattlescriptCurrInstr
	thumb_func_end atk6E_setatktoplayer0

	thumb_func_start atk6F_makevisible
atk6F_makevisible: @ 8026810
	push {r4,r5,lr}
	ldr r5, _0802683C @ =gBattlescriptCurrInstr
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl GetBattlerForBattleScript
	ldr r4, _08026840 @ =gActiveBattler
	strb r0, [r4]
	movs r0, 0
	movs r1, 0
	bl BtlController_EmitSpriteInvisibility
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802683C: .4byte gBattlescriptCurrInstr
_08026840: .4byte gActiveBattler
	thumb_func_end atk6F_makevisible

	thumb_func_start atk70_recordlastability
atk70_recordlastability: @ 8026844
	push {r4,lr}
	ldr r4, _0802686C @ =gBattlescriptCurrInstr
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl GetBattlerForBattleScript
	ldr r1, _08026870 @ =gActiveBattler
	strb r0, [r1]
	ldrb r0, [r1]
	ldr r1, _08026874 @ =gLastUsedAbility
	ldrb r1, [r1]
	bl RecordAbilityBattle
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802686C: .4byte gBattlescriptCurrInstr
_08026870: .4byte gActiveBattler
_08026874: .4byte gLastUsedAbility
	thumb_func_end atk70_recordlastability

	thumb_func_start BufferMoveToLearnIntoBattleTextBuff2
BufferMoveToLearnIntoBattleTextBuff2: @ 8026878
	ldr r2, _08026898 @ =gBattleTextBuff2
	movs r0, 0xFD
	strb r0, [r2]
	movs r0, 0x2
	strb r0, [r2, 0x1]
	ldr r0, _0802689C @ =gMoveToLearn
	ldrh r1, [r0]
	strb r1, [r2, 0x2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r2, 0x3]
	movs r0, 0xFF
	strb r0, [r2, 0x4]
	bx lr
	.align 2, 0
_08026898: .4byte gBattleTextBuff2
_0802689C: .4byte gMoveToLearn
	thumb_func_end BufferMoveToLearnIntoBattleTextBuff2

	thumb_func_start atk71_buffermovetolearn
atk71_buffermovetolearn: @ 80268A0
	push {lr}
	bl BufferMoveToLearnIntoBattleTextBuff2
	ldr r1, _080268B4 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080268B4: .4byte gBattlescriptCurrInstr
	thumb_func_end atk71_buffermovetolearn

	thumb_func_start atk72_jumpifplayerran
atk72_jumpifplayerran: @ 80268B8
	push {lr}
	ldr r0, _080268E4 @ =gBattlerFainted
	ldrb r0, [r0]
	bl TryRunFromBattle
	lsls r0, 24
	cmp r0, 0
	beq _080268EC
	ldr r3, _080268E8 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080268F4
	.align 2, 0
_080268E4: .4byte gBattlerFainted
_080268E8: .4byte gBattlescriptCurrInstr
_080268EC:
	ldr r1, _080268F8 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_080268F4:
	pop {r0}
	bx r0
	.align 2, 0
_080268F8: .4byte gBattlescriptCurrInstr
	thumb_func_end atk72_jumpifplayerran

	thumb_func_start atk73_hpthresholds
atk73_hpthresholds: @ 80268FC
	push {r4-r6,lr}
	ldr r0, _0802694C @ =gBattleTypeFlags
	ldr r4, [r0]
	movs r6, 0x1
	ands r4, r6
	cmp r4, 0
	bne _08026992
	ldr r0, _08026950 @ =gBattlescriptCurrInstr
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl GetBattlerForBattleScript
	ldr r1, _08026954 @ =gActiveBattler
	strb r0, [r1]
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08026958 @ =gBattleMons
	movs r1, 0x58
	muls r1, r0
	adds r1, r2
	ldrh r5, [r1, 0x28]
	movs r0, 0x64
	muls r0, r5
	ldrh r1, [r1, 0x2C]
	bl __divsi3
	cmp r0, 0
	bne _0802693A
	movs r0, 0x1
_0802693A:
	cmp r0, 0x45
	bgt _08026942
	cmp r5, 0
	bne _08026960
_08026942:
	ldr r0, _0802695C @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xAD
	strb r4, [r0]
	b _08026992
	.align 2, 0
_0802694C: .4byte gBattleTypeFlags
_08026950: .4byte gBattlescriptCurrInstr
_08026954: .4byte gActiveBattler
_08026958: .4byte gBattleMons
_0802695C: .4byte gBattleStruct
_08026960:
	cmp r0, 0x27
	ble _08026974
	ldr r0, _08026970 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xAD
	strb r6, [r0]
	b _08026992
	.align 2, 0
_08026970: .4byte gBattleStruct
_08026974:
	cmp r0, 0x9
	ble _08026988
	ldr r0, _08026984 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xAD
	movs r1, 0x2
	b _08026990
	.align 2, 0
_08026984: .4byte gBattleStruct
_08026988:
	ldr r0, _080269A0 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xAD
	movs r1, 0x3
_08026990:
	strb r1, [r0]
_08026992:
	ldr r1, _080269A4 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080269A0: .4byte gBattleStruct
_080269A4: .4byte gBattlescriptCurrInstr
	thumb_func_end atk73_hpthresholds

	thumb_func_start atk74_hpthresholds2
atk74_hpthresholds2: @ 80269A8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _08026A0C @ =gBattleTypeFlags
	ldr r7, [r0]
	movs r0, 0x1
	mov r8, r0
	ands r7, r0
	cmp r7, 0
	bne _08026A42
	ldr r0, _08026A10 @ =gBattlescriptCurrInstr
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl GetBattlerForBattleScript
	adds r4, r0, 0
	ldr r0, _08026A14 @ =gActiveBattler
	strb r4, [r0]
	movs r0, 0x1
	eors r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	ldr r1, _08026A18 @ =gBattleStruct
	ldr r6, [r1]
	lsrs r0, 23
	adds r0, r6
	adds r0, 0xA8
	ldrb r5, [r0]
	ldr r1, _08026A1C @ =gBattleMons
	movs r0, 0x58
	muls r0, r4
	adds r0, r1
	ldrh r4, [r0, 0x28]
	subs r1, r5, r4
	movs r0, 0x64
	muls r0, r1
	adds r1, r5, 0
	bl __divsi3
	adds r1, r0, 0
	cmp r4, r5
	bcc _08026A20
	adds r0, r6, 0
	adds r0, 0xAD
	strb r7, [r0]
	b _08026A42
	.align 2, 0
_08026A0C: .4byte gBattleTypeFlags
_08026A10: .4byte gBattlescriptCurrInstr
_08026A14: .4byte gActiveBattler
_08026A18: .4byte gBattleStruct
_08026A1C: .4byte gBattleMons
_08026A20:
	cmp r0, 0x1D
	bgt _08026A2E
	adds r0, r6, 0
	adds r0, 0xAD
	mov r1, r8
	strb r1, [r0]
	b _08026A42
_08026A2E:
	cmp r1, 0x45
	bgt _08026A3A
	adds r1, r6, 0
	adds r1, 0xAD
	movs r0, 0x2
	b _08026A40
_08026A3A:
	adds r1, r6, 0
	adds r1, 0xAD
	movs r0, 0x3
_08026A40:
	strb r0, [r1]
_08026A42:
	ldr r1, _08026A54 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026A54: .4byte gBattlescriptCurrInstr
	thumb_func_end atk74_hpthresholds2

	thumb_func_start atk75_useitemonopponent
atk75_useitemonopponent: @ 8026A58
	push {lr}
	sub sp, 0x4
	ldr r2, _08026A98 @ =gBattlerInMenuId
	ldr r1, _08026A9C @ =gBattlerAttacker
	ldrb r0, [r1]
	strb r0, [r2]
	ldr r2, _08026AA0 @ =gBattlerPartyIndexes
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r1, _08026AA4 @ =gEnemyParty
	adds r0, r1
	ldr r1, _08026AA8 @ =gLastUsedItem
	ldrh r1, [r1]
	lsls r2, 24
	lsrs r2, 24
	movs r3, 0x1
	str r3, [sp]
	movs r3, 0
	bl PokemonUseItemEffects
	ldr r1, _08026AAC @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08026A98: .4byte gBattlerInMenuId
_08026A9C: .4byte gBattlerAttacker
_08026AA0: .4byte gBattlerPartyIndexes
_08026AA4: .4byte gEnemyParty
_08026AA8: .4byte gLastUsedItem
_08026AAC: .4byte gBattlescriptCurrInstr
	thumb_func_end atk75_useitemonopponent

	thumb_func_start atk76_various
atk76_various: @ 8026AB0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	ldr r4, _08026ADC @ =gBattlescriptCurrInstr
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl GetBattlerForBattleScript
	ldr r1, _08026AE0 @ =gActiveBattler
	strb r0, [r1]
	ldr r0, [r4]
	ldrb r0, [r0, 0x2]
	cmp r0, 0xC
	bls _08026AD2
	b _08026F4E
_08026AD2:
	lsls r0, 2
	ldr r1, _08026AE4 @ =_08026AE8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08026ADC: .4byte gBattlescriptCurrInstr
_08026AE0: .4byte gActiveBattler
_08026AE4: .4byte _08026AE8
	.align 2, 0
_08026AE8:
	.4byte _08026B1C
	.4byte _08026B2C
	.4byte _08026B8C
	.4byte _08026B9C
	.4byte _08026BB4
	.4byte _08026BF0
	.4byte _08026C28
	.4byte _08026CB4
	.4byte _08026CF4
	.4byte _08026D50
	.4byte _08026D64
	.4byte _08026DA0
	.4byte _08026F44
_08026B1C:
	ldr r0, _08026B28 @ =gActiveBattler
	ldrb r0, [r0]
	bl CancelMultiTurnMoves
	b _08026F4E
	.align 2, 0
_08026B28: .4byte gActiveBattler
_08026B2C:
	ldr r1, _08026B68 @ =gBattlerAttacker
	ldr r4, _08026B6C @ =gBattlerTarget
	ldrb r0, [r4]
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetBattlerSide
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08026B70 @ =gSideTimers
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r2, r1, r2
	ldrb r0, [r2, 0x8]
	cmp r0, 0
	beq _08026B78
	ldr r1, _08026B74 @ =gBattleMons
	ldrb r2, [r2, 0x9]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08026B78
	strb r2, [r4]
	b _08026F4E
	.align 2, 0
_08026B68: .4byte gBattlerAttacker
_08026B6C: .4byte gBattlerTarget
_08026B70: .4byte gSideTimers
_08026B74: .4byte gBattleMons
_08026B78:
	ldr r0, _08026B84 @ =gBattlerTarget
	ldr r1, _08026B88 @ =gActiveBattler
	ldrb r1, [r1]
	strb r1, [r0]
	b _08026F4E
	.align 2, 0
_08026B84: .4byte gBattlerTarget
_08026B88: .4byte gActiveBattler
_08026B8C:
	bl IsRunningFromBattleImpossible
	ldr r1, _08026B98 @ =gBattleCommunication
	strb r0, [r1]
	b _08026F4E
	.align 2, 0
_08026B98: .4byte gBattleCommunication
_08026B9C:
	ldr r0, _08026BAC @ =gCurrentMove
	ldrh r0, [r0]
	movs r1, 0
	bl GetMoveTarget
	ldr r1, _08026BB0 @ =gBattlerTarget
	strb r0, [r1]
	b _08026F4E
	.align 2, 0
_08026BAC: .4byte gCurrentMove
_08026BB0: .4byte gBattlerTarget
_08026BB4:
	ldr r2, _08026BD4 @ =gHitMarker
	ldr r1, _08026BD8 @ =gBitTable
	ldr r0, _08026BDC @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r0, 28
	ldr r2, [r2]
	ands r2, r0
	cmp r2, 0
	beq _08026BE4
	ldr r1, _08026BE0 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1]
	b _08026F4E
	.align 2, 0
_08026BD4: .4byte gHitMarker
_08026BD8: .4byte gBitTable
_08026BDC: .4byte gActiveBattler
_08026BE0: .4byte gBattleCommunication
_08026BE4:
	ldr r0, _08026BEC @ =gBattleCommunication
	strb r2, [r0]
	b _08026F4E
	.align 2, 0
_08026BEC: .4byte gBattleCommunication
_08026BF0:
	ldr r4, _08026C20 @ =gSpecialStatuses
	ldr r3, _08026C24 @ =gActiveBattler
	ldrb r0, [r3]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1]
	movs r0, 0x9
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r3]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	b _08026F4E
	.align 2, 0
_08026C20: .4byte gSpecialStatuses
_08026C24: .4byte gActiveBattler
_08026C28:
	ldr r4, _08026C4C @ =gBattlerPartyIndexes
	ldr r1, _08026C50 @ =gBattleStruct
	ldr r0, [r1]
	ldrh r3, [r4]
	ldrb r2, [r0, 0x10]
	adds r5, r1, 0
	cmp r3, r2
	beq _08026C44
	ldrh r0, [r4, 0x4]
	cmp r0, r2
	beq _08026C40
	b _08026F4E
_08026C40:
	cmp r3, r0
	bne _08026C58
_08026C44:
	ldr r1, _08026C54 @ =gActiveBattler
	movs r0, 0
	b _08026C5C
	.align 2, 0
_08026C4C: .4byte gBattlerPartyIndexes
_08026C50: .4byte gBattleStruct
_08026C54: .4byte gActiveBattler
_08026C58:
	ldr r1, _08026CAC @ =gActiveBattler
	movs r0, 0x2
_08026C5C:
	strb r0, [r1]
	mov r8, r1
	mov r0, r8
	ldrb r2, [r0]
	lsls r0, r2, 1
	adds r0, 0xC8
	ldr r1, [r5]
	adds r3, r1, r0
	movs r7, 0
	ldr r1, _08026CB0 @ =gBattleMons
	movs r0, 0x58
	muls r0, r2
	adds r1, 0xC
	adds r0, r1
	ldrh r0, [r0]
	ldrh r2, [r3]
	cmp r0, r2
	beq _08026C9E
	mov r5, r8
	movs r4, 0x58
	adds r2, r1, 0
_08026C86:
	adds r7, 0x1
	cmp r7, 0x3
	bgt _08026C9E
	lsls r1, r7, 1
	ldrb r0, [r5]
	muls r0, r4
	adds r1, r0
	adds r1, r2
	ldrh r0, [r1]
	ldrh r1, [r3]
	cmp r0, r1
	bne _08026C86
_08026C9E:
	cmp r7, 0x4
	beq _08026CA4
	b _08026F4E
_08026CA4:
	movs r0, 0
	strh r0, [r3]
	b _08026F4E
	.align 2, 0
_08026CAC: .4byte gActiveBattler
_08026CB0: .4byte gBattleMons
_08026CB4:
	ldr r0, _08026CE4 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0xB
	ands r0, r1
	cmp r0, 0x8
	beq _08026CC2
	b _08026F4E
_08026CC2:
	ldr r1, _08026CE8 @ =gBattleMons
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	bne _08026CCC
	b _08026F4E
_08026CCC:
	adds r0, r1, 0
	adds r0, 0x80
	ldrh r0, [r0]
	cmp r0, 0
	bne _08026CD8
	b _08026F4E
_08026CD8:
	ldr r0, _08026CEC @ =gHitMarker
	ldr r1, [r0]
	ldr r2, _08026CF0 @ =0xffbfffff
	ands r1, r2
	str r1, [r0]
	b _08026F4E
	.align 2, 0
_08026CE4: .4byte gBattleTypeFlags
_08026CE8: .4byte gBattleMons
_08026CEC: .4byte gHitMarker
_08026CF0: .4byte 0xffbfffff
_08026CF4:
	movs r7, 0
	ldr r2, _08026D3C @ =gBattleCommunication
	strb r7, [r2, 0x5]
	ldr r1, _08026D40 @ =gActiveBattler
	movs r0, 0x1
	strb r0, [r1]
	mov r8, r1
	ldr r0, _08026D44 @ =gBattlersCount
	mov r4, r8
	ldrb r5, [r0]
	ldr r6, _08026D48 @ =gBattleMons
	ldr r3, _08026D4C @ =gBitTable
_08026D0C:
	ldrb r0, [r4]
	cmp r0, r5
	bcs _08026D2A
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r6
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08026D2A
	ldr r0, [r3]
	ldrb r1, [r2, 0x5]
	orrs r0, r1
	strb r0, [r2, 0x5]
_08026D2A:
	adds r3, 0x4
	ldrb r0, [r4]
	adds r0, 0x2
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _08026D0C
	b _08026F4E
	.align 2, 0
_08026D3C: .4byte gBattleCommunication
_08026D40: .4byte gActiveBattler
_08026D44: .4byte gBattlersCount
_08026D48: .4byte gBattleMons
_08026D4C: .4byte gBitTable
_08026D50:
	ldr r4, _08026D5C @ =gActiveBattler
	movs r0, 0x1
	strb r0, [r4]
	ldr r0, _08026D60 @ =gBattleMons
	adds r0, 0x58
	b _08026D7C
	.align 2, 0
_08026D5C: .4byte gActiveBattler
_08026D60: .4byte gBattleMons
_08026D64:
	ldr r0, _08026D94 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r0, 0x3
	bhi _08026D6E
	b _08026F4E
_08026D6E:
	ldr r4, _08026D98 @ =gActiveBattler
	movs r0, 0x3
	strb r0, [r4]
	ldr r0, _08026D9C @ =gBattleMons
	movs r1, 0x84
	lsls r1, 1
	adds r0, r1
_08026D7C:
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _08026D84
	b _08026F4E
_08026D84:
	movs r0, 0
	movs r1, 0
	bl BtlController_EmitReturnMonToBall
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	b _08026F4E
	.align 2, 0
_08026D94: .4byte gBattlersCount
_08026D98: .4byte gActiveBattler
_08026D9C: .4byte gBattleMons
_08026DA0:
	ldr r0, _08026F28 @ =gBattleCommunication
	movs r1, 0
	strb r1, [r0, 0x5]
	mov r8, r1
	movs r7, 0
	ldr r0, _08026F2C @ =gBattlersCount
	mov r12, r0
	ldrb r2, [r0]
	cmp r8, r2
	bge _08026DEE
	ldr r4, _08026F30 @ =gBattleMons
	adds r3, r4, 0
	adds r3, 0x50
	adds r6, r4, 0
	adds r6, 0x20
	movs r5, 0
_08026DC0:
	ldrb r0, [r6]
	cmp r0, 0x2B
	beq _08026DDE
	adds r2, r4, 0
	adds r2, 0x4C
	adds r2, r5, r2
	ldr r0, [r2]
	movs r1, 0x8
	negs r1, r1
	ands r0, r1
	str r0, [r2]
	ldr r0, [r3]
	ldr r1, _08026F34 @ =0xf7ffffff
	ands r0, r1
	str r0, [r3]
_08026DDE:
	adds r3, 0x58
	adds r6, 0x58
	adds r5, 0x58
	adds r7, 0x1
	mov r0, r12
	ldrb r0, [r0]
	cmp r7, r0
	blt _08026DC0
_08026DEE:
	movs r7, 0
	movs r1, 0xCE
	lsls r1, 1
	mov r9, r1
_08026DF6:
	movs r0, 0x64
	adds r4, r7, 0
	muls r4, r0
	ldr r0, _08026F38 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x2E
	bl GetMonData
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	adds r1, r0, 0
	str r1, [sp, 0x4]
	cmp r5, 0
	beq _08026E4E
	cmp r5, r9
	beq _08026E4E
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _08026E4E
	adds r0, r5, 0
	adds r1, r6, 0
	bl GetAbilityBySpecies
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2B
	beq _08026E4E
	movs r0, 0x1
	lsls r0, r7
	mov r2, r8
	orrs r2, r0
	mov r8, r2
_08026E4E:
	adds r7, 0x1
	cmp r7, 0x5
	ble _08026DF6
	mov r0, r8
	cmp r0, 0
	beq _08026E88
	movs r0, 0
	bl GetBattlerAtPosition
	ldr r4, _08026F3C @ =gActiveBattler
	strb r0, [r4]
	movs r0, 0
	str r0, [sp, 0x4]
	mov r1, r8
	lsls r2, r1, 24
	lsrs r2, 24
	add r0, sp, 0x4
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r3, 0x4
	bl BtlController_EmitSetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r1, _08026F28 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
_08026E88:
	movs r1, 0
	mov r8, r1
	movs r7, 0
	movs r2, 0xCE
	lsls r2, 1
	mov r9, r2
_08026E94:
	movs r0, 0x64
	adds r4, r7, 0
	muls r4, r0
	ldr r0, _08026F40 @ =gEnemyParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x2E
	bl GetMonData
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	adds r1, r0, 0
	str r1, [sp, 0x4]
	cmp r5, 0
	beq _08026EEC
	cmp r5, r9
	beq _08026EEC
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _08026EEC
	adds r0, r5, 0
	adds r1, r6, 0
	bl GetAbilityBySpecies
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2B
	beq _08026EEC
	movs r0, 0x1
	lsls r0, r7
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_08026EEC:
	adds r7, 0x1
	cmp r7, 0x5
	ble _08026E94
	mov r2, r8
	cmp r2, 0
	beq _08026F4E
	movs r0, 0x1
	bl GetBattlerAtPosition
	ldr r4, _08026F3C @ =gActiveBattler
	strb r0, [r4]
	movs r0, 0
	str r0, [sp, 0x4]
	mov r0, r8
	lsls r2, r0, 24
	lsrs r2, 24
	add r1, sp, 0x4
	str r1, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r3, 0x4
	bl BtlController_EmitSetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r1, _08026F28 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08026F4E
	.align 2, 0
_08026F28: .4byte gBattleCommunication
_08026F2C: .4byte gBattlersCount
_08026F30: .4byte gBattleMons
_08026F34: .4byte 0xf7ffffff
_08026F38: .4byte gPlayerParty
_08026F3C: .4byte gActiveBattler
_08026F40: .4byte gEnemyParty
_08026F44:
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08026F56
_08026F4E:
	ldr r1, _08026F64 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x3
	str r0, [r1]
_08026F56:
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026F64: .4byte gBattlescriptCurrInstr
	thumb_func_end atk76_various

	thumb_func_start atk77_setprotectlike
atk77_setprotectlike: @ 8026F68
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0x1
	ldr r2, _08027034 @ =gLastResultingMoves
	ldr r1, _08027038 @ =gBattlerAttacker
	ldrb r3, [r1]
	lsls r0, r3, 1
	adds r0, r2
	ldrh r0, [r0]
	mov r8, r1
	ldr r7, _0802703C @ =gDisableStructs
	cmp r0, 0xB6
	beq _08026F98
	cmp r0, 0xC5
	beq _08026F98
	cmp r0, 0xCB
	beq _08026F98
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r7
	movs r1, 0
	strb r1, [r0, 0x8]
_08026F98:
	ldr r0, _08027040 @ =gCurrentTurnActionNumber
	ldrb r1, [r0]
	ldr r0, _08027044 @ =gBattlersCount
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	bne _08026FA8
	movs r6, 0
_08026FA8:
	ldr r2, _08027048 @ =sProtectSuccessRates
	mov r5, r8
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r7
	ldrb r4, [r0, 0x8]
	lsls r4, 1
	adds r4, r2
	bl Random
	ldrh r1, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bcc _0802705C
	cmp r6, 0
	beq _0802705C
	ldr r4, _0802704C @ =gBattleMoves
	ldr r3, _08027050 @ =gCurrentMove
	ldrh r0, [r3]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1]
	cmp r0, 0x6F
	bne _08026FF8
	ldr r0, _08027054 @ =gProtectStructs
	ldrb r1, [r5]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _08027058 @ =gBattleCommunication
	movs r0, 0
	strb r0, [r1, 0x5]
_08026FF8:
	ldrh r0, [r3]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1]
	cmp r0, 0x74
	bne _0802701E
	ldr r0, _08027054 @ =gProtectStructs
	ldrb r1, [r5]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _08027058 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
_0802701E:
	mov r1, r8
	ldrb r0, [r1]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r7
	ldrb r0, [r1, 0x8]
	adds r0, 0x1
	strb r0, [r1, 0x8]
	b _0802707E
	.align 2, 0
_08027034: .4byte gLastResultingMoves
_08027038: .4byte gBattlerAttacker
_0802703C: .4byte gDisableStructs
_08027040: .4byte gCurrentTurnActionNumber
_08027044: .4byte gBattlersCount
_08027048: .4byte sProtectSuccessRates
_0802704C: .4byte gBattleMoves
_08027050: .4byte gCurrentMove
_08027054: .4byte gProtectStructs
_08027058: .4byte gBattleCommunication
_0802705C:
	ldr r2, _08027090 @ =gDisableStructs
	ldr r0, _08027094 @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strb r1, [r0, 0x8]
	ldr r1, _08027098 @ =gBattleCommunication
	movs r0, 0x2
	strb r0, [r1, 0x5]
	ldr r2, _0802709C @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_0802707E:
	ldr r1, _080270A0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027090: .4byte gDisableStructs
_08027094: .4byte gBattlerAttacker
_08027098: .4byte gBattleCommunication
_0802709C: .4byte gMoveResultFlags
_080270A0: .4byte gBattlescriptCurrInstr
	thumb_func_end atk77_setprotectlike

	thumb_func_start atk78_faintifabilitynotdamp
atk78_faintifabilitynotdamp: @ 80270A4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _08027160 @ =gBattleControllerExecFlags
	ldr r2, [r0]
	cmp r2, 0
	bne _080271A8
	ldr r1, _08027164 @ =gBattlerTarget
	strb r2, [r1]
	ldr r0, _08027168 @ =gBattlersCount
	ldrb r3, [r0]
	adds r5, r1, 0
	mov r8, r0
	ldr r6, _0802716C @ =gBattleMons
	cmp r2, r3
	bcs _080270F0
	adds r0, r6, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x6
	beq _080270F0
	adds r2, r3, 0
	adds r4, r6, 0
	movs r3, 0x58
_080270D4:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r2
	bcs _080270F0
	ldrb r0, [r5]
	muls r0, r3
	adds r0, r4
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x6
	bne _080270D4
_080270F0:
	ldrb r0, [r5]
	mov r1, r8
	ldrb r1, [r1]
	cmp r0, r1
	bne _0802718C
	ldr r4, _08027170 @ =gActiveBattler
	ldr r7, _08027174 @ =gBattlerAttacker
	ldrb r0, [r7]
	strb r0, [r4]
	ldr r2, _08027178 @ =gBattleMoveDamage
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	adds r0, r6
	ldrh r0, [r0, 0x28]
	str r0, [r2]
	ldr r1, _0802717C @ =0x00007fff
	movs r0, 0
	bl BtlController_EmitHealthBarUpdate
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r1, _08027180 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	movs r0, 0
	strb r0, [r5]
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, 0
	beq _080271A8
	adds r3, r5, 0
	ldrb r5, [r7]
	ldr r7, _08027184 @ =gBitTable
	adds r4, r0, 0
	ldr r6, _08027188 @ =gAbsentBattlerFlags
_0802713C:
	ldrb r2, [r3]
	cmp r2, r5
	beq _08027152
	ldrb r0, [r6]
	ldrb r1, [r3]
	lsls r1, 2
	adds r1, r7
	ldr r1, [r1]
	ands r0, r1
	cmp r0, 0
	beq _080271A8
_08027152:
	adds r0, r2, 0x1
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r4
	bcc _0802713C
	b _080271A8
	.align 2, 0
_08027160: .4byte gBattleControllerExecFlags
_08027164: .4byte gBattlerTarget
_08027168: .4byte gBattlersCount
_0802716C: .4byte gBattleMons
_08027170: .4byte gActiveBattler
_08027174: .4byte gBattlerAttacker
_08027178: .4byte gBattleMoveDamage
_0802717C: .4byte 0x00007fff
_08027180: .4byte gBattlescriptCurrInstr
_08027184: .4byte gBitTable
_08027188: .4byte gAbsentBattlerFlags
_0802718C:
	ldr r1, _080271B4 @ =gLastUsedAbility
	movs r0, 0x6
	strb r0, [r1]
	ldrb r0, [r5]
	movs r1, 0x58
	muls r1, r0
	adds r1, r6
	adds r1, 0x20
	ldrb r1, [r1]
	bl RecordAbilityBattle
	ldr r1, _080271B8 @ =gBattlescriptCurrInstr
	ldr r0, _080271BC @ =BattleScript_DampStopsExplosion
	str r0, [r1]
_080271A8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080271B4: .4byte gLastUsedAbility
_080271B8: .4byte gBattlescriptCurrInstr
_080271BC: .4byte BattleScript_DampStopsExplosion
	thumb_func_end atk78_faintifabilitynotdamp

	thumb_func_start atk79_setatkhptozero
atk79_setatkhptozero: @ 80271C0
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0802720C @ =gBattleControllerExecFlags
	ldr r3, [r0]
	cmp r3, 0
	bne _08027204
	ldr r4, _08027210 @ =gActiveBattler
	ldr r0, _08027214 @ =gBattlerAttacker
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r1, _08027218 @ =gBattleMons
	ldrb r0, [r4]
	movs r2, 0x58
	muls r0, r2
	adds r0, r1
	strh r3, [r0, 0x28]
	ldrb r0, [r4]
	muls r0, r2
	adds r1, 0x28
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x2A
	movs r2, 0
	movs r3, 0x2
	bl BtlController_EmitSetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r1, _0802721C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_08027204:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802720C: .4byte gBattleControllerExecFlags
_08027210: .4byte gActiveBattler
_08027214: .4byte gBattlerAttacker
_08027218: .4byte gBattleMons
_0802721C: .4byte gBattlescriptCurrInstr
	thumb_func_end atk79_setatkhptozero

	thumb_func_start atk7A_jumpifnexttargetvalid
atk7A_jumpifnexttargetvalid: @ 8027220
	push {r4-r7,lr}
	ldr r3, _08027298 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r4, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r4, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r4, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r4, r0
	ldr r0, _0802729C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	adds r7, r3, 0
	cmp r0, 0
	beq _080272B8
	ldr r0, _080272A0 @ =gBattlerTarget
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	ldr r2, _080272A4 @ =gBattlerAttacker
	lsls r1, 24
	lsrs r1, 24
	adds r3, r0, 0
	ldr r6, _080272A8 @ =gAbsentBattlerFlags
	ldr r5, _080272AC @ =gBitTable
	ldr r0, _080272B0 @ =gBattlersCount
	mov r12, r0
	ldrb r0, [r2]
	cmp r1, r0
	bne _08027276
_08027266:
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r2]
	cmp r0, r1
	beq _08027266
_08027276:
	ldrb r0, [r6]
	ldrb r1, [r3]
	lsls r1, 2
	adds r1, r5
	ldr r1, [r1]
	ands r0, r1
	cmp r0, 0
	bne _08027266
	ldrb r0, [r3]
	mov r2, r12
	ldrb r2, [r2]
	cmp r0, r2
	bcc _080272B4
	ldr r0, [r7]
	adds r0, 0x5
	str r0, [r7]
	b _080272BC
	.align 2, 0
_08027298: .4byte gBattlescriptCurrInstr
_0802729C: .4byte gBattleTypeFlags
_080272A0: .4byte gBattlerTarget
_080272A4: .4byte gBattlerAttacker
_080272A8: .4byte gAbsentBattlerFlags
_080272AC: .4byte gBitTable
_080272B0: .4byte gBattlersCount
_080272B4:
	str r4, [r7]
	b _080272BC
_080272B8:
	adds r0, r2, 0x5
	str r0, [r3]
_080272BC:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end atk7A_jumpifnexttargetvalid

	thumb_func_start atk7B_tryhealhalfhealth
atk7B_tryhealhalfhealth: @ 80272C4
	push {r4-r6,lr}
	ldr r4, _08027320 @ =gBattlescriptCurrInstr
	ldr r1, [r4]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	orrs r2, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	orrs r2, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	orrs r2, r0
	ldrb r0, [r1, 0x5]
	ldr r3, _08027324 @ =gBattlerTarget
	cmp r0, 0x1
	bne _080272EC
	ldr r0, _08027328 @ =gBattlerAttacker
	ldrb r0, [r0]
	strb r0, [r3]
_080272EC:
	ldr r1, _0802732C @ =gBattleMoveDamage
	ldr r6, _08027330 @ =gBattleMons
	ldrb r0, [r3]
	movs r5, 0x58
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0, 0x2C]
	lsrs r0, 1
	str r0, [r1]
	cmp r0, 0
	bne _08027306
	movs r0, 0x1
	str r0, [r1]
_08027306:
	ldr r0, [r1]
	negs r0, r0
	str r0, [r1]
	ldrb r0, [r3]
	muls r0, r5
	adds r0, r6
	ldrh r1, [r0, 0x28]
	ldrh r0, [r0, 0x2C]
	cmp r1, r0
	bne _08027334
	str r2, [r4]
	b _0802733A
	.align 2, 0
_08027320: .4byte gBattlescriptCurrInstr
_08027324: .4byte gBattlerTarget
_08027328: .4byte gBattlerAttacker
_0802732C: .4byte gBattleMoveDamage
_08027330: .4byte gBattleMons
_08027334:
	ldr r0, [r4]
	adds r0, 0x6
	str r0, [r4]
_0802733A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end atk7B_tryhealhalfhealth

	thumb_func_start atk7C_trymirrormove
atk7C_trymirrormove: @ 8027340
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r2, _080273E0 @ =gBattlersCount
	ldr r0, _080273E4 @ =gBattleStruct
	mov r10, r0
	movs r1, 0
	add r0, sp, 0x4
_08027356:
	strh r1, [r0]
	subs r0, 0x2
	cmp r0, sp
	bge _08027356
	movs r1, 0
	mov r8, r1
	movs r5, 0
	ldrb r1, [r2]
	cmp r5, r1
	bge _080273AC
	ldr r0, _080273E8 @ =gBattlerAttacker
	ldrb r6, [r0]
	ldr r2, _080273EC @ =0x0000ffff
	mov r9, r2
	lsls r4, r6, 3
	mov r2, sp
	ldr r0, _080273E4 @ =gBattleStruct
	mov r12, r0
	adds r7, r1, 0
_0802737C:
	cmp r5, r6
	beq _080273A4
	mov r1, r12
	ldr r0, [r1]
	adds r0, r4, r0
	adds r1, r0, 0
	adds r1, 0xE0
	ldrb r3, [r1]
	adds r0, 0xE1
	ldrb r0, [r0]
	lsls r0, 8
	orrs r3, r0
	cmp r3, 0
	beq _080273A4
	cmp r3, r9
	beq _080273A4
	strh r3, [r2]
	adds r2, 0x2
	movs r0, 0x1
	add r8, r0
_080273A4:
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, r7
	blt _0802737C
_080273AC:
	ldr r1, _080273E8 @ =gBattlerAttacker
	ldrb r0, [r1]
	mov r2, r10
	ldr r1, [r2]
	lsls r0, 1
	adds r0, r1
	adds r1, r0, 0
	adds r1, 0x98
	ldrb r3, [r1]
	adds r0, 0x99
	ldrb r0, [r0]
	lsls r0, 8
	orrs r3, r0
	cmp r3, 0
	beq _080273FC
	ldr r0, _080273EC @ =0x0000ffff
	cmp r3, r0
	beq _080273FC
	ldr r2, _080273F0 @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _080273F4 @ =0xfffffbff
	ands r0, r1
	str r0, [r2]
	ldr r4, _080273F8 @ =gCurrentMove
	strh r3, [r4]
	b _08027426
	.align 2, 0
_080273E0: .4byte gBattlersCount
_080273E4: .4byte gBattleStruct
_080273E8: .4byte gBattlerAttacker
_080273EC: .4byte 0x0000ffff
_080273F0: .4byte gHitMarker
_080273F4: .4byte 0xfffffbff
_080273F8: .4byte gCurrentMove
_080273FC:
	mov r0, r8
	cmp r0, 0
	beq _0802746C
	ldr r2, _08027450 @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _08027454 @ =0xfffffbff
	ands r0, r1
	str r0, [r2]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	mov r1, r8
	bl __modsi3
	adds r5, r0, 0
	ldr r4, _08027458 @ =gCurrentMove
	lsls r0, r5, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4]
_08027426:
	ldrh r0, [r4]
	movs r1, 0
	bl GetMoveTarget
	ldr r1, _0802745C @ =gBattlerTarget
	strb r0, [r1]
	ldr r5, _08027460 @ =gBattlescriptCurrInstr
	ldr r3, _08027464 @ =gBattleScriptsForMoveEffects
	ldr r2, _08027468 @ =gBattleMoves
	ldrh r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	str r0, [r5]
	b _0802748A
	.align 2, 0
_08027450: .4byte gHitMarker
_08027454: .4byte 0xfffffbff
_08027458: .4byte gCurrentMove
_0802745C: .4byte gBattlerTarget
_08027460: .4byte gBattlescriptCurrInstr
_08027464: .4byte gBattleScriptsForMoveEffects
_08027468: .4byte gBattleMoves
_0802746C:
	ldr r2, _0802749C @ =gSpecialStatuses
	ldr r0, _080274A0 @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
	ldr r1, _080274A4 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_0802748A:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802749C: .4byte gSpecialStatuses
_080274A0: .4byte gBattlerAttacker
_080274A4: .4byte gBattlescriptCurrInstr
	thumb_func_end atk7C_trymirrormove

	thumb_func_start atk7D_setrain
atk7D_setrain: @ 80274A8
	push {lr}
	ldr r2, _080274C8 @ =gBattleWeather
	ldrh r0, [r2]
	movs r1, 0x7
	ands r1, r0
	cmp r1, 0
	beq _080274D4
	ldr r2, _080274CC @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080274D0 @ =gBattleCommunication
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _080274E4
	.align 2, 0
_080274C8: .4byte gBattleWeather
_080274CC: .4byte gMoveResultFlags
_080274D0: .4byte gBattleCommunication
_080274D4:
	movs r0, 0x1
	strh r0, [r2]
	ldr r0, _080274F0 @ =gBattleCommunication
	strb r1, [r0, 0x5]
	ldr r0, _080274F4 @ =gWishFutureKnock
	adds r0, 0x28
	movs r1, 0x5
	strb r1, [r0]
_080274E4:
	ldr r1, _080274F8 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080274F0: .4byte gBattleCommunication
_080274F4: .4byte gWishFutureKnock
_080274F8: .4byte gBattlescriptCurrInstr
	thumb_func_end atk7D_setrain

	thumb_func_start atk7E_setreflect
atk7E_setreflect: @ 80274FC
	push {r4-r6,lr}
	ldr r6, _0802752C @ =gBattlerAttacker
	ldrb r0, [r6]
	bl GetBattlerPosition
	ldr r4, _08027530 @ =gSideStatuses
	movs r5, 0x1
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	ldrh r1, [r1]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _0802753C
	ldr r2, _08027534 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08027538 @ =gBattleCommunication
	movs r0, 0
	b _080275B0
	.align 2, 0
_0802752C: .4byte gBattlerAttacker
_08027530: .4byte gSideStatuses
_08027534: .4byte gMoveResultFlags
_08027538: .4byte gBattleCommunication
_0802753C:
	ldrb r0, [r6]
	bl GetBattlerPosition
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	ldrh r0, [r1]
	movs r2, 0x1
	orrs r0, r2
	strh r0, [r1]
	ldrb r0, [r6]
	bl GetBattlerPosition
	ldr r4, _080275A0 @ =gSideTimers
	adds r1, r5, 0
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x5
	strb r1, [r0]
	ldrb r0, [r6]
	bl GetBattlerPosition
	adds r1, r5, 0
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r6]
	strb r1, [r0, 0x1]
	ldr r0, _080275A4 @ =gBattleTypeFlags
	ldr r0, [r0]
	ands r0, r5
	cmp r0, 0
	beq _080275AC
	movs r0, 0x1
	bl CountAliveMonsInBattle
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bne _080275AC
	ldr r0, _080275A8 @ =gBattleCommunication
	strb r1, [r0, 0x5]
	b _080275B2
	.align 2, 0
_080275A0: .4byte gSideTimers
_080275A4: .4byte gBattleTypeFlags
_080275A8: .4byte gBattleCommunication
_080275AC:
	ldr r1, _080275C0 @ =gBattleCommunication
	movs r0, 0x1
_080275B0:
	strb r0, [r1, 0x5]
_080275B2:
	ldr r1, _080275C4 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080275C0: .4byte gBattleCommunication
_080275C4: .4byte gBattlescriptCurrInstr
	thumb_func_end atk7E_setreflect

	thumb_func_start atk7F_setseeded
atk7F_setseeded: @ 80275C8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r7, _08027608 @ =gMoveResultFlags
	ldrb r5, [r7]
	movs r0, 0x29
	ands r0, r5
	cmp r0, 0
	bne _080275FA
	ldr r0, _0802760C @ =gStatuses3
	mov r9, r0
	ldr r1, _08027610 @ =gBattlerTarget
	mov r8, r1
	ldrb r4, [r1]
	lsls r0, r4, 2
	mov r2, r9
	adds r6, r0, r2
	ldr r2, [r6]
	movs r0, 0x4
	mov r12, r0
	adds r3, r2, 0
	ands r3, r0
	cmp r3, 0
	beq _08027618
_080275FA:
	movs r0, 0x1
	orrs r0, r5
	strb r0, [r7]
	ldr r1, _08027614 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08027668
	.align 2, 0
_08027608: .4byte gMoveResultFlags
_0802760C: .4byte gStatuses3
_08027610: .4byte gBattlerTarget
_08027614: .4byte gBattleCommunication
_08027618:
	ldr r1, _08027644 @ =gBattleMons
	movs r0, 0x58
	muls r0, r4
	adds r1, r0, r1
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0xC
	beq _08027634
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0xC
	bne _0802764C
_08027634:
	movs r0, 0x1
	orrs r0, r5
	strb r0, [r7]
	ldr r1, _08027648 @ =gBattleCommunication
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _08027668
	.align 2, 0
_08027644: .4byte gBattleMons
_08027648: .4byte gBattleCommunication
_0802764C:
	ldr r0, _0802767C @ =gBattlerAttacker
	ldrb r0, [r0]
	orrs r2, r0
	str r2, [r6]
	mov r2, r8
	ldrb r1, [r2]
	lsls r1, 2
	add r1, r9
	ldr r0, [r1]
	mov r2, r12
	orrs r0, r2
	str r0, [r1]
	ldr r0, _08027680 @ =gBattleCommunication
	strb r3, [r0, 0x5]
_08027668:
	ldr r1, _08027684 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802767C: .4byte gBattlerAttacker
_08027680: .4byte gBattleCommunication
_08027684: .4byte gBattlescriptCurrInstr
	thumb_func_end atk7F_setseeded

	thumb_func_start atk80_manipulatedamage
atk80_manipulatedamage: @ 8027688
	push {r4,lr}
	ldr r1, _080276A0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	ldrb r2, [r0, 0x1]
	adds r4, r1, 0
	cmp r2, 0x1
	beq _080276B8
	cmp r2, 0x1
	bgt _080276A4
	cmp r2, 0
	beq _080276AA
	b _080276F8
	.align 2, 0
_080276A0: .4byte gBattlescriptCurrInstr
_080276A4:
	cmp r2, 0x2
	beq _080276F0
	b _080276F8
_080276AA:
	ldr r1, _080276B4 @ =gBattleMoveDamage
	ldr r0, [r1]
	negs r0, r0
	b _080276F6
	.align 2, 0
_080276B4: .4byte gBattleMoveDamage
_080276B8:
	ldr r3, _080276E4 @ =gBattleMoveDamage
	ldr r0, [r3]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	str r0, [r3]
	cmp r0, 0
	bne _080276CA
	str r2, [r3]
_080276CA:
	ldr r2, _080276E8 @ =gBattleMons
	ldr r0, _080276EC @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x2C]
	lsrs r1, r0, 1
	ldr r0, [r3]
	cmp r1, r0
	bge _080276F8
	str r1, [r3]
	b _080276F8
	.align 2, 0
_080276E4: .4byte gBattleMoveDamage
_080276E8: .4byte gBattleMons
_080276EC: .4byte gBattlerTarget
_080276F0:
	ldr r1, _08027704 @ =gBattleMoveDamage
	ldr r0, [r1]
	lsls r0, 1
_080276F6:
	str r0, [r1]
_080276F8:
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027704: .4byte gBattleMoveDamage
	thumb_func_end atk80_manipulatedamage

	thumb_func_start atk81_trysetrest
atk81_trysetrest: @ 8027708
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r0, _08027760 @ =gBattlescriptCurrInstr
	mov r12, r0
	ldr r1, [r0]
	ldrb r6, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	orrs r6, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	orrs r6, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	orrs r6, r0
	ldr r5, _08027764 @ =gActiveBattler
	ldr r2, _08027768 @ =gBattlerTarget
	ldr r0, _0802776C @ =gBattlerAttacker
	ldrb r0, [r0]
	strb r0, [r2]
	strb r0, [r5]
	ldr r4, _08027770 @ =gBattleMoveDamage
	ldr r1, _08027774 @ =gBattleMons
	ldrb r0, [r2]
	movs r3, 0x58
	muls r0, r3
	adds r0, r1
	ldrh r0, [r0, 0x2C]
	negs r0, r0
	str r0, [r4]
	ldrb r0, [r2]
	adds r4, r0, 0
	muls r4, r3
	adds r0, r4, r1
	ldrh r3, [r0, 0x28]
	adds r7, r5, 0
	adds r5, r2, 0
	adds r2, r1, 0
	ldrh r0, [r0, 0x2C]
	cmp r3, r0
	bne _08027778
	mov r0, r12
	str r6, [r0]
	b _080277C8
	.align 2, 0
_08027760: .4byte gBattlescriptCurrInstr
_08027764: .4byte gActiveBattler
_08027768: .4byte gBattlerTarget
_0802776C: .4byte gBattlerAttacker
_08027770: .4byte gBattleMoveDamage
_08027774: .4byte gBattleMons
_08027778:
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r4, r0
	ldr r1, [r0]
	movs r0, 0xF8
	ands r1, r0
	cmp r1, 0
	beq _08027794
	ldr r1, _08027790 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08027798
	.align 2, 0
_08027790: .4byte gBattleCommunication
_08027794:
	ldr r0, _080277D0 @ =gBattleCommunication
	strb r1, [r0, 0x5]
_08027798:
	ldrb r0, [r5]
	movs r3, 0x58
	muls r0, r3
	adds r2, 0x4C
	adds r0, r2
	movs r1, 0x3
	str r1, [r0]
	ldrb r0, [r7]
	muls r0, r3
	adds r0, r2
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl BtlController_EmitSetMonData
	ldrb r0, [r7]
	bl MarkBattlerForControllerExec
	ldr r1, _080277D4 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_080277C8:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080277D0: .4byte gBattleCommunication
_080277D4: .4byte gBattlescriptCurrInstr
	thumb_func_end atk81_trysetrest

	thumb_func_start atk82_jumpifnotfirstturn
atk82_jumpifnotfirstturn: @ 80277D8
	push {r4,r5,lr}
	ldr r5, _0802780C @ =gBattlescriptCurrInstr
	ldr r4, [r5]
	ldrb r3, [r4, 0x1]
	ldrb r0, [r4, 0x2]
	lsls r0, 8
	orrs r3, r0
	ldrb r0, [r4, 0x3]
	lsls r0, 16
	orrs r3, r0
	ldrb r0, [r4, 0x4]
	lsls r0, 24
	orrs r3, r0
	ldr r2, _08027810 @ =gDisableStructs
	ldr r0, _08027814 @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x16]
	cmp r0, 0
	beq _08027818
	adds r0, r4, 0x5
	str r0, [r5]
	b _0802781A
	.align 2, 0
_0802780C: .4byte gBattlescriptCurrInstr
_08027810: .4byte gDisableStructs
_08027814: .4byte gBattlerAttacker
_08027818:
	str r3, [r5]
_0802781A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end atk82_jumpifnotfirstturn

	thumb_func_start atk83_nop
atk83_nop: @ 8027820
	ldr r1, _0802782C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_0802782C: .4byte gBattlescriptCurrInstr
	thumb_func_end atk83_nop

	thumb_func_start UproarWakeUpCheck
UproarWakeUpCheck: @ 8027830
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r2, 0
	ldr r0, _08027888 @ =gBattlersCount
	ldrb r1, [r0]
	mov r8, r0
	cmp r2, r1
	bge _080278A4
	ldr r0, _0802788C @ =gBattleMons
	mov r12, r0
	movs r0, 0x58
	muls r0, r3
	add r0, r12
	adds r5, r0, 0
	adds r5, 0x20
	adds r4, r1, 0
	movs r3, 0
	ldr r6, _08027890 @ =gBattleScripting
	ldr r7, _08027894 @ =gBattleCommunication
_0802785C:
	mov r0, r12
	adds r0, 0x50
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x70
	ands r0, r1
	cmp r0, 0
	beq _0802789C
	ldrb r0, [r5]
	cmp r0, 0x2B
	beq _0802789C
	movs r3, 0
	strb r2, [r6, 0x17]
	ldr r1, _08027898 @ =gBattlerTarget
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _080278BC
	cmp r0, r2
	beq _080278B0
	movs r0, 0x1
	strb r0, [r7, 0x5]
	b _080278A4
	.align 2, 0
_08027888: .4byte gBattlersCount
_0802788C: .4byte gBattleMons
_08027890: .4byte gBattleScripting
_08027894: .4byte gBattleCommunication
_08027898: .4byte gBattlerTarget
_0802789C:
	adds r3, 0x58
	adds r2, 0x1
	cmp r2, r4
	blt _0802785C
_080278A4:
	mov r1, r8
	ldrb r1, [r1]
	cmp r2, r1
	beq _080278C0
	movs r0, 0x1
	b _080278C2
_080278B0:
	ldr r0, _080278B8 @ =gBattleCommunication
	strb r3, [r0, 0x5]
	b _080278A4
	.align 2, 0
_080278B8: .4byte gBattleCommunication
_080278BC:
	strb r2, [r1]
	b _080278A4
_080278C0:
	movs r0, 0
_080278C2:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end UproarWakeUpCheck

	thumb_func_start atk84_jumpifcantmakeasleep
atk84_jumpifcantmakeasleep: @ 80278CC
	push {r4-r6,lr}
	ldr r5, _080278F8 @ =gBattlescriptCurrInstr
	ldr r1, [r5]
	ldrb r4, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	orrs r4, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	orrs r4, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	orrs r4, r0
	ldr r6, _080278FC @ =gBattlerTarget
	ldrb r0, [r6]
	bl UproarWakeUpCheck
	lsls r0, 24
	cmp r0, 0
	beq _08027900
	str r4, [r5]
	b _08027942
	.align 2, 0
_080278F8: .4byte gBattlescriptCurrInstr
_080278FC: .4byte gBattlerTarget
_08027900:
	ldr r1, _08027930 @ =gBattleMons
	ldrb r3, [r6]
	movs r0, 0x58
	muls r0, r3
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	adds r1, r0, 0
	cmp r1, 0xF
	beq _08027918
	cmp r1, 0x48
	bne _0802793C
_08027918:
	ldr r2, _08027934 @ =gLastUsedAbility
	strb r0, [r2]
	ldr r1, _08027938 @ =gBattleCommunication
	movs r0, 0x2
	strb r0, [r1, 0x5]
	str r4, [r5]
	ldrb r1, [r2]
	adds r0, r3, 0
	bl RecordAbilityBattle
	b _08027942
	.align 2, 0
_08027930: .4byte gBattleMons
_08027934: .4byte gLastUsedAbility
_08027938: .4byte gBattleCommunication
_0802793C:
	ldr r0, [r5]
	adds r0, 0x5
	str r0, [r5]
_08027942:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end atk84_jumpifcantmakeasleep

	thumb_func_start atk85_stockpile
atk85_stockpile: @ 8027948
	push {r4,r5,lr}
	ldr r5, _08027970 @ =gDisableStructs
	ldr r4, _08027974 @ =gBattlerAttacker
	ldrb r1, [r4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1, 0x9]
	cmp r0, 0x3
	bne _08027980
	ldr r2, _08027978 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0802797C @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _080279AA
	.align 2, 0
_08027970: .4byte gDisableStructs
_08027974: .4byte gBattlerAttacker
_08027978: .4byte gMoveResultFlags
_0802797C: .4byte gBattleCommunication
_08027980:
	adds r0, 0x1
	movs r3, 0
	strb r0, [r1, 0x9]
	ldr r2, _080279B8 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r2]
	movs r0, 0x1
	strb r0, [r2, 0x1]
	strb r0, [r2, 0x2]
	strb r0, [r2, 0x3]
	ldrb r1, [r4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x9]
	strb r0, [r2, 0x4]
	movs r0, 0xFF
	strb r0, [r2, 0x5]
	ldr r0, _080279BC @ =gBattleCommunication
	strb r3, [r0, 0x5]
_080279AA:
	ldr r1, _080279C0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080279B8: .4byte gBattleTextBuff1
_080279BC: .4byte gBattleCommunication
_080279C0: .4byte gBattlescriptCurrInstr
	thumb_func_end atk85_stockpile

	thumb_func_start atk86_stockpiletobasedamage
atk86_stockpiletobasedamage: @ 80279C4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	ldr r3, _080279FC @ =gBattlescriptCurrInstr
	ldr r1, [r3]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	orrs r2, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	orrs r2, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	orrs r2, r0
	ldr r7, _08027A00 @ =gDisableStructs
	ldr r6, _08027A04 @ =gBattlerAttacker
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r7
	ldrb r0, [r0, 0x9]
	cmp r0, 0
	bne _08027A08
	str r2, [r3]
	b _08027AAA
	.align 2, 0
_080279FC: .4byte gBattlescriptCurrInstr
_08027A00: .4byte gDisableStructs
_08027A04: .4byte gBattlerAttacker
_08027A08:
	ldr r0, _08027AB8 @ =gBattleCommunication
	ldrb r0, [r0, 0x6]
	cmp r0, 0x1
	beq _08027A90
	ldr r0, _08027ABC @ =gBattleMoveDamage
	mov r8, r0
	ldr r4, _08027AC0 @ =gSideStatuses
	ldr r5, _08027AC4 @ =gBattlerTarget
	ldrb r0, [r5]
	bl GetBattlerPosition
	movs r1, 0x1
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	ldrh r3, [r1]
	ldrb r0, [r6]
	movs r4, 0x58
	muls r0, r4
	ldr r2, _08027AC8 @ =gBattleMons
	adds r0, r2
	ldrb r1, [r5]
	muls r1, r4
	adds r1, r2
	ldr r2, _08027ACC @ =gCurrentMove
	ldrh r2, [r2]
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	ldrb r4, [r6]
	str r4, [sp, 0x8]
	ldrb r4, [r5]
	str r4, [sp, 0xC]
	bl CalculateBaseDamage
	ldrb r2, [r6]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r7
	ldrb r1, [r1, 0x9]
	adds r3, r0, 0
	muls r3, r1
	mov r1, r8
	str r3, [r1]
	ldr r2, _08027AD0 @ =gBattleScripting
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r7
	ldrb r0, [r0, 0x9]
	strb r0, [r2, 0x18]
	ldr r1, _08027AD4 @ =gProtectStructs
	ldrb r0, [r6]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 28
	cmp r0, 0
	bge _08027A90
	lsls r0, r3, 4
	subs r0, r3
	movs r1, 0xA
	bl __divsi3
	mov r1, r8
	str r0, [r1]
_08027A90:
	ldr r2, _08027AD8 @ =gDisableStructs
	ldr r0, _08027ADC @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strb r1, [r0, 0x9]
	ldr r1, _08027AE0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_08027AAA:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027AB8: .4byte gBattleCommunication
_08027ABC: .4byte gBattleMoveDamage
_08027AC0: .4byte gSideStatuses
_08027AC4: .4byte gBattlerTarget
_08027AC8: .4byte gBattleMons
_08027ACC: .4byte gCurrentMove
_08027AD0: .4byte gBattleScripting
_08027AD4: .4byte gProtectStructs
_08027AD8: .4byte gDisableStructs
_08027ADC: .4byte gBattlerAttacker
_08027AE0: .4byte gBattlescriptCurrInstr
	thumb_func_end atk86_stockpiletobasedamage

	thumb_func_start atk87_stockpiletohpheal
atk87_stockpiletohpheal: @ 8027AE4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r7, _08027B24 @ =gBattlescriptCurrInstr
	ldr r1, [r7]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	orrs r2, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	orrs r2, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	orrs r2, r0
	ldr r0, _08027B28 @ =gDisableStructs
	mov r8, r0
	ldr r6, _08027B2C @ =gBattlerAttacker
	ldrb r3, [r6]
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	mov r1, r8
	adds r4, r0, r1
	ldrb r1, [r4, 0x9]
	cmp r1, 0
	bne _08027B34
	str r2, [r7]
	ldr r0, _08027B30 @ =gBattleCommunication
	strb r1, [r0, 0x5]
	b _08027BB0
	.align 2, 0
_08027B24: .4byte gBattlescriptCurrInstr
_08027B28: .4byte gDisableStructs
_08027B2C: .4byte gBattlerAttacker
_08027B30: .4byte gBattleCommunication
_08027B34:
	ldr r1, _08027B58 @ =gBattleMons
	movs r0, 0x58
	muls r0, r3
	adds r1, r0, r1
	ldrh r0, [r1, 0x2C]
	ldrh r3, [r1, 0x28]
	cmp r0, r3
	bne _08027B64
	movs r0, 0
	strb r0, [r4, 0x9]
	str r2, [r7]
	ldr r1, _08027B5C @ =gBattlerTarget
	ldrb r0, [r6]
	strb r0, [r1]
	ldr r1, _08027B60 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08027BB0
	.align 2, 0
_08027B58: .4byte gBattleMons
_08027B5C: .4byte gBattlerTarget
_08027B60: .4byte gBattleCommunication
_08027B64:
	ldr r5, _08027BBC @ =gBattleMoveDamage
	ldrh r0, [r1, 0x2C]
	ldrb r1, [r4, 0x9]
	movs r2, 0x3
	subs r2, r1
	movs r4, 0x1
	adds r1, r4, 0
	lsls r1, r2
	bl __divsi3
	str r0, [r5]
	cmp r0, 0
	bne _08027B80
	str r4, [r5]
_08027B80:
	ldr r0, [r5]
	negs r0, r0
	str r0, [r5]
	ldr r3, _08027BC0 @ =gBattleScripting
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r8
	ldrb r0, [r0, 0x9]
	movs r2, 0
	strb r0, [r3, 0x18]
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r8
	strb r2, [r0, 0x9]
	ldr r0, [r7]
	adds r0, 0x5
	str r0, [r7]
	ldr r1, _08027BC4 @ =gBattlerTarget
	ldrb r0, [r6]
	strb r0, [r1]
_08027BB0:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027BBC: .4byte gBattleMoveDamage
_08027BC0: .4byte gBattleScripting
_08027BC4: .4byte gBattlerTarget
	thumb_func_end atk87_stockpiletohpheal

	thumb_func_start atk88_negativedamage
atk88_negativedamage: @ 8027BC8
	push {lr}
	ldr r2, _08027BF0 @ =gBattleMoveDamage
	ldr r0, _08027BF4 @ =gHpDealt
	ldr r0, [r0]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	negs r0, r0
	str r0, [r2]
	cmp r0, 0
	bne _08027BE4
	movs r0, 0x1
	negs r0, r0
	str r0, [r2]
_08027BE4:
	ldr r1, _08027BF8 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08027BF0: .4byte gBattleMoveDamage
_08027BF4: .4byte gHpDealt
_08027BF8: .4byte gBattlescriptCurrInstr
	thumb_func_end atk88_negativedamage

	thumb_func_start ChangeStatBuffs
ChangeStatBuffs: @ 8027BFC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r8, r3
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r0, 0
	mov r9, r0
	mov r10, r0
	movs r0, 0x40
	ands r0, r5
	cmp r0, 0
	beq _08027C30
	ldr r0, _08027C28 @ =gActiveBattler
	ldr r1, _08027C2C @ =gBattlerAttacker
	b _08027C34
	.align 2, 0
_08027C28: .4byte gActiveBattler
_08027C2C: .4byte gBattlerAttacker
_08027C30:
	ldr r0, _08027CD4 @ =gActiveBattler
	ldr r1, _08027CD8 @ =gBattlerTarget
_08027C34:
	ldrb r1, [r1]
	strb r1, [r0]
	movs r0, 0xBF
	ands r5, r0
	movs r0, 0x80
	ands r0, r5
	cmp r0, 0
	beq _08027C4E
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08027C4E:
	movs r0, 0x7F
	ands r5, r0
	movs r0, 0x20
	ands r0, r5
	cmp r0, 0
	beq _08027C64
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
_08027C64:
	movs r0, 0xDF
	ands r5, r0
	ldr r1, _08027CDC @ =gBattleTextBuff1
	movs r4, 0
	movs r2, 0xFD
	strb r2, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	strb r7, [r1, 0x2]
	movs r3, 0x1
	negs r3, r3
	mov r12, r3
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	lsls r0, r6, 24
	cmp r0, 0
	blt _08027C88
	b _08027F6C
_08027C88:
	ldr r4, _08027CE0 @ =gSideTimers
	ldr r1, _08027CD4 @ =gActiveBattler
	ldrb r0, [r1]
	bl GetBattlerPosition
	movs r1, 0x1
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _08027D28
	mov r2, r9
	cmp r2, 0
	bne _08027D28
	ldr r0, _08027CE4 @ =gCurrentMove
	ldrh r0, [r0]
	cmp r0, 0xAE
	beq _08027D58
	cmp r5, 0x1
	bne _08027D48
	ldr r4, _08027CE8 @ =gSpecialStatuses
	ldr r3, _08027CD4 @ =gActiveBattler
	ldrb r0, [r3]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _08027CF0
	ldr r0, _08027CEC @ =gBattlescriptCurrInstr
	mov r4, r8
	str r4, [r0]
	b _08027D48
	.align 2, 0
_08027CD4: .4byte gActiveBattler
_08027CD8: .4byte gBattlerTarget
_08027CDC: .4byte gBattleTextBuff1
_08027CE0: .4byte gSideTimers
_08027CE4: .4byte gCurrentMove
_08027CE8: .4byte gSpecialStatuses
_08027CEC: .4byte gBattlescriptCurrInstr
_08027CF0:
	mov r0, r8
	bl BattleScriptPush
	ldr r1, _08027D18 @ =gBattleScripting
	ldr r6, _08027D1C @ =gActiveBattler
	ldrb r0, [r6]
	strb r0, [r1, 0x17]
	ldr r1, _08027D20 @ =gBattlescriptCurrInstr
	ldr r0, _08027D24 @ =BattleScript_MistProtected
	str r0, [r1]
	ldrb r1, [r6]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	b _08027D48
	.align 2, 0
_08027D18: .4byte gBattleScripting
_08027D1C: .4byte gActiveBattler
_08027D20: .4byte gBattlescriptCurrInstr
_08027D24: .4byte BattleScript_MistProtected
_08027D28:
	ldr r0, _08027D4C @ =gCurrentMove
	ldrh r0, [r0]
	cmp r0, 0xAE
	beq _08027D58
	mov r0, r10
	cmp r0, 0x1
	beq _08027D58
	movs r0, 0
	bl JumpIfMoveAffectedByProtect
	lsls r0, 24
	cmp r0, 0
	beq _08027D58
	ldr r1, _08027D50 @ =gBattlescriptCurrInstr
	ldr r0, _08027D54 @ =BattleScript_ButItFailed
	str r0, [r1]
_08027D48:
	movs r0, 0x1
	b _08028060
	.align 2, 0
_08027D4C: .4byte gCurrentMove
_08027D50: .4byte gBattlescriptCurrInstr
_08027D54: .4byte BattleScript_ButItFailed
_08027D58:
	ldr r2, _08027DA0 @ =gBattleMons
	ldr r1, _08027DA4 @ =gActiveBattler
	ldrb r3, [r1]
	movs r4, 0x58
	adds r0, r3, 0
	muls r0, r4
	adds r0, r2
	adds r0, 0x20
	ldrb r0, [r0]
	mov r10, r2
	cmp r0, 0x1D
	beq _08027D74
	cmp r0, 0x49
	bne _08027E0C
_08027D74:
	mov r0, r9
	cmp r0, 0
	bne _08027E0C
	ldr r0, _08027DA8 @ =gCurrentMove
	ldrh r0, [r0]
	cmp r0, 0xAE
	beq _08027E0C
	cmp r5, 0x1
	bne _08027D48
	ldr r4, _08027DAC @ =gSpecialStatuses
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _08027DB4
	ldr r0, _08027DB0 @ =gBattlescriptCurrInstr
	mov r1, r8
	str r1, [r0]
	b _08027D48
	.align 2, 0
_08027DA0: .4byte gBattleMons
_08027DA4: .4byte gActiveBattler
_08027DA8: .4byte gCurrentMove
_08027DAC: .4byte gSpecialStatuses
_08027DB0: .4byte gBattlescriptCurrInstr
_08027DB4:
	mov r0, r8
	bl BattleScriptPush
	ldr r1, _08027DF8 @ =gBattleScripting
	ldr r2, _08027DFC @ =gActiveBattler
	ldrb r0, [r2]
	strb r0, [r1, 0x17]
	ldr r1, _08027E00 @ =gBattlescriptCurrInstr
	ldr r0, _08027E04 @ =BattleScript_AbilityNoStatLoss
	str r0, [r1]
	ldr r1, _08027E08 @ =gLastUsedAbility
	ldrb r0, [r2]
	movs r3, 0x58
	muls r0, r3
	add r0, r10
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r2]
	ldrb r1, [r1]
	bl RecordAbilityBattle
	ldr r6, _08027DFC @ =gActiveBattler
	ldrb r1, [r6]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	b _08027D48
	.align 2, 0
_08027DF8: .4byte gBattleScripting
_08027DFC: .4byte gActiveBattler
_08027E00: .4byte gBattlescriptCurrInstr
_08027E04: .4byte BattleScript_AbilityNoStatLoss
_08027E08: .4byte gLastUsedAbility
_08027E0C:
	ldr r1, _08027E58 @ =gActiveBattler
	ldrb r0, [r1]
	movs r4, 0x58
	muls r0, r4
	add r0, r10
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x33
	bne _08027E6C
	mov r2, r9
	cmp r2, 0
	bne _08027E6C
	cmp r7, 0x6
	bne _08027E6C
	cmp r5, 0x1
	bne _08027D48
	mov r0, r8
	bl BattleScriptPush
	ldr r1, _08027E5C @ =gBattleScripting
	ldr r3, _08027E58 @ =gActiveBattler
	ldrb r0, [r3]
	strb r0, [r1, 0x17]
	ldr r1, _08027E60 @ =gBattlescriptCurrInstr
	ldr r0, _08027E64 @ =BattleScript_AbilityNoSpecificStatLoss
	str r0, [r1]
	ldr r1, _08027E68 @ =gLastUsedAbility
	ldrb r0, [r3]
	muls r0, r4
	add r0, r10
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r3]
	ldrb r1, [r1]
	bl RecordAbilityBattle
	b _08027D48
	.align 2, 0
_08027E58: .4byte gActiveBattler
_08027E5C: .4byte gBattleScripting
_08027E60: .4byte gBattlescriptCurrInstr
_08027E64: .4byte BattleScript_AbilityNoSpecificStatLoss
_08027E68: .4byte gLastUsedAbility
_08027E6C:
	ldr r4, _08027EBC @ =gActiveBattler
	ldrb r0, [r4]
	movs r4, 0x58
	muls r0, r4
	add r0, r10
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x34
	bne _08027ED0
	mov r0, r9
	cmp r0, 0
	bne _08027ED0
	cmp r7, 0x1
	bne _08027ED0
	cmp r5, 0x1
	beq _08027E8E
	b _08027D48
_08027E8E:
	mov r0, r8
	bl BattleScriptPush
	ldr r1, _08027EC0 @ =gBattleScripting
	ldr r2, _08027EBC @ =gActiveBattler
	ldrb r0, [r2]
	strb r0, [r1, 0x17]
	ldr r1, _08027EC4 @ =gBattlescriptCurrInstr
	ldr r0, _08027EC8 @ =BattleScript_AbilityNoSpecificStatLoss
	str r0, [r1]
	ldr r1, _08027ECC @ =gLastUsedAbility
	ldrb r0, [r2]
	muls r0, r4
	add r0, r10
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r2]
	ldrb r1, [r1]
	bl RecordAbilityBattle
	b _08027D48
	.align 2, 0
_08027EBC: .4byte gActiveBattler
_08027EC0: .4byte gBattleScripting
_08027EC4: .4byte gBattlescriptCurrInstr
_08027EC8: .4byte BattleScript_AbilityNoSpecificStatLoss
_08027ECC: .4byte gLastUsedAbility
_08027ED0:
	ldr r3, _08027F5C @ =gActiveBattler
	ldrb r1, [r3]
	movs r0, 0x58
	muls r0, r1
	add r0, r10
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x13
	bne _08027EE8
	cmp r5, 0
	bne _08027EE8
	b _08027D48
_08027EE8:
	lsls r0, r6, 24
	asrs r0, 28
	movs r1, 0x7
	ands r0, r1
	negs r0, r0
	lsls r0, 24
	ldr r3, _08027F60 @ =gBattleTextBuff2
	movs r4, 0
	movs r1, 0xFD
	strb r1, [r3]
	movs r2, 0x1
	lsrs r6, r0, 24
	asrs r0, 24
	subs r1, 0xFF
	cmp r0, r1
	bne _08027F12
	strb r4, [r3, 0x1]
	movs r0, 0xD3
	strb r0, [r3, 0x2]
	strb r4, [r3, 0x3]
	movs r2, 0x4
_08027F12:
	adds r0, r2, r3
	strb r4, [r0]
	adds r2, 0x1
	adds r1, r2, r3
	movs r0, 0xD4
	strb r0, [r1]
	adds r2, 0x1
	adds r0, r2, r3
	strb r4, [r0]
	adds r2, 0x1
	adds r1, r2, r3
	movs r0, 0xFF
	strb r0, [r1]
	ldr r4, _08027F5C @ =gActiveBattler
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r0, r7, r0
	mov r1, r10
	adds r1, 0x18
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _08027FC2
	movs r1, 0
	ldr r0, _08027F64 @ =gBattlerTarget
	ldrb r0, [r0]
	ldr r3, _08027F68 @ =gBattleCommunication
	mov r8, r3
	cmp r0, r2
	bne _08027F56
	movs r1, 0x1
_08027F56:
	mov r4, r8
	strb r1, [r4, 0x5]
	b _08027FF0
	.align 2, 0
_08027F5C: .4byte gActiveBattler
_08027F60: .4byte gBattleTextBuff2
_08027F64: .4byte gBattlerTarget
_08027F68: .4byte gBattleCommunication
_08027F6C:
	asrs r6, r0, 28
	movs r0, 0x7
	ands r6, r0
	ldr r3, _08027FCC @ =gBattleTextBuff2
	strb r2, [r3]
	movs r2, 0x1
	cmp r6, 0x2
	bne _08027F86
	strb r4, [r3, 0x1]
	movs r0, 0xD1
	strb r0, [r3, 0x2]
	strb r4, [r3, 0x3]
	movs r2, 0x4
_08027F86:
	adds r0, r2, r3
	strb r4, [r0]
	adds r2, 0x1
	adds r1, r2, r3
	movs r0, 0xD2
	strb r0, [r1]
	adds r2, 0x1
	adds r0, r2, r3
	strb r4, [r0]
	adds r2, 0x1
	adds r1, r2, r3
	ldrb r0, [r1]
	mov r2, r12
	orrs r0, r2
	strb r0, [r1]
	ldr r2, _08027FD0 @ =gBattleMons
	ldr r4, _08027FD4 @ =gActiveBattler
	ldrb r3, [r4]
	movs r0, 0x58
	muls r0, r3
	adds r0, r7, r0
	adds r1, r2, 0
	adds r1, 0x18
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	mov r10, r2
	cmp r0, 0xC
	bne _08027FDC
_08027FC2:
	ldr r1, _08027FD8 @ =gBattleCommunication
	movs r0, 0x2
	strb r0, [r1, 0x5]
	mov r8, r1
	b _08027FF0
	.align 2, 0
_08027FCC: .4byte gBattleTextBuff2
_08027FD0: .4byte gBattleMons
_08027FD4: .4byte gActiveBattler
_08027FD8: .4byte gBattleCommunication
_08027FDC:
	movs r1, 0
	ldr r0, _08028070 @ =gBattlerTarget
	ldrb r0, [r0]
	ldr r2, _08028074 @ =gBattleCommunication
	mov r8, r2
	cmp r0, r3
	bne _08027FEC
	movs r1, 0x1
_08027FEC:
	mov r3, r8
	strb r1, [r3, 0x5]
_08027FF0:
	ldr r2, _08028078 @ =gActiveBattler
	ldrb r0, [r2]
	movs r4, 0x58
	adds r1, r0, 0
	muls r1, r4
	adds r1, r7, r1
	mov r3, r10
	adds r3, 0x18
	adds r1, r3
	lsls r0, r6, 24
	asrs r0, 24
	ldrb r6, [r1]
	adds r0, r6
	strb r0, [r1]
	ldrb r0, [r2]
	muls r0, r4
	adds r0, r7, r0
	adds r1, r0, r3
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0
	bge _08028020
	movs r0, 0
	strb r0, [r1]
_08028020:
	ldr r1, _08028078 @ =gActiveBattler
	ldrb r0, [r1]
	muls r0, r4
	adds r0, r7, r0
	adds r1, r0, r3
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0xC
	ble _08028036
	movs r0, 0xC
	strb r0, [r1]
_08028036:
	mov r2, r8
	ldrb r0, [r2, 0x5]
	cmp r0, 0x2
	bne _0802805E
	movs r3, 0x1
	ands r3, r5
	cmp r3, 0
	beq _08028050
	ldr r0, _0802807C @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
_08028050:
	mov r4, r8
	ldrb r0, [r4, 0x5]
	cmp r0, 0x2
	bne _0802805E
	cmp r3, 0
	bne _0802805E
	b _08027D48
_0802805E:
	movs r0, 0
_08028060:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08028070: .4byte gBattlerTarget
_08028074: .4byte gBattleCommunication
_08028078: .4byte gActiveBattler
_0802807C: .4byte gMoveResultFlags
	thumb_func_end ChangeStatBuffs

	thumb_func_start atk89_statbuffchange
atk89_statbuffchange: @ 8028080
	push {r4,r5,lr}
	ldr r5, _080280C4 @ =gBattlescriptCurrInstr
	ldr r2, [r5]
	ldrb r3, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r3, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r3, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r3, r0
	ldr r0, _080280C8 @ =gBattleScripting
	ldrb r4, [r0, 0x1A]
	movs r0, 0xF0
	ands r0, r4
	lsls r0, 24
	asrs r0, 24
	movs r1, 0xF
	ands r1, r4
	ldrb r2, [r2, 0x1]
	bl ChangeStatBuffs
	lsls r0, 24
	cmp r0, 0
	bne _080280BC
	ldr r0, [r5]
	adds r0, 0x6
	str r0, [r5]
_080280BC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080280C4: .4byte gBattlescriptCurrInstr
_080280C8: .4byte gBattleScripting
	thumb_func_end atk89_statbuffchange

	thumb_func_start atk8A_normalisebuffs
atk8A_normalisebuffs: @ 80280CC
	push {r4-r7,lr}
	movs r2, 0
	ldr r0, _08028114 @ =gBattlersCount
	ldrb r1, [r0]
	ldr r0, _08028118 @ =gBattlescriptCurrInstr
	mov r12, r0
	cmp r2, r1
	bge _08028104
	ldr r0, _0802811C @ =gBattleMons
	movs r4, 0x6
	adds r5, r1, 0
	movs r7, 0x58
	adds r6, r0, 0
	adds r6, 0x18
_080280E8:
	adds r3, r2, 0x1
	movs r1, 0x7
	adds r0, r2, 0
	muls r0, r7
	adds r0, r6
	adds r0, 0x7
_080280F4:
	strb r4, [r0]
	subs r0, 0x1
	subs r1, 0x1
	cmp r1, 0
	bge _080280F4
	adds r2, r3, 0
	cmp r2, r5
	blt _080280E8
_08028104:
	mov r1, r12
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028114: .4byte gBattlersCount
_08028118: .4byte gBattlescriptCurrInstr
_0802811C: .4byte gBattleMons
	thumb_func_end atk8A_normalisebuffs

	thumb_func_start atk8B_setbide
atk8B_setbide: @ 8028120
	push {r4,r5,lr}
	ldr r4, _08028178 @ =gBattleMons
	ldr r3, _0802817C @ =gBattlerAttacker
	ldrb r0, [r3]
	movs r5, 0x58
	adds r2, r0, 0
	muls r2, r5
	adds r4, 0x50
	adds r2, r4
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 5
	orrs r0, r1
	str r0, [r2]
	ldr r1, _08028180 @ =gLockedMoves
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r1
	ldr r1, _08028184 @ =gCurrentMove
	ldrh r1, [r1]
	movs r2, 0
	strh r1, [r0]
	ldr r1, _08028188 @ =gTakenDmg
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r1
	str r2, [r0]
	ldrb r0, [r3]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r4
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 2
	orrs r0, r2
	str r0, [r1]
	ldr r1, _0802818C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028178: .4byte gBattleMons
_0802817C: .4byte gBattlerAttacker
_08028180: .4byte gLockedMoves
_08028184: .4byte gCurrentMove
_08028188: .4byte gTakenDmg
_0802818C: .4byte gBattlescriptCurrInstr
	thumb_func_end atk8B_setbide

	thumb_func_start atk8C_confuseifrepeatingattackends
atk8C_confuseifrepeatingattackends: @ 8028190
	push {lr}
	ldr r1, _080281C0 @ =gBattleMons
	ldr r0, _080281C4 @ =gBattlerAttacker
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0xC0
	lsls r1, 4
	ands r0, r1
	cmp r0, 0
	bne _080281B2
	ldr r1, _080281C8 @ =gBattleCommunication
	movs r0, 0x75
	strb r0, [r1, 0x3]
_080281B2:
	ldr r1, _080281CC @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080281C0: .4byte gBattleMons
_080281C4: .4byte gBattlerAttacker
_080281C8: .4byte gBattleCommunication
_080281CC: .4byte gBattlescriptCurrInstr
	thumb_func_end atk8C_confuseifrepeatingattackends

	thumb_func_start atk8D_setmultihitcounter
atk8D_setmultihitcounter: @ 80281D0
	push {r4,r5,lr}
	ldr r0, _080281E4 @ =gBattlescriptCurrInstr
	ldr r0, [r0]
	ldrb r1, [r0, 0x1]
	cmp r1, 0
	beq _080281EC
	ldr r0, _080281E8 @ =gMultiHitCounter
	strb r1, [r0]
	b _08028206
	.align 2, 0
_080281E4: .4byte gBattlescriptCurrInstr
_080281E8: .4byte gMultiHitCounter
_080281EC:
	ldr r4, _08028214 @ =gMultiHitCounter
	bl Random
	movs r5, 0x3
	ands r0, r5
	strb r0, [r4]
	cmp r0, 0x1
	bls _08028202
	bl Random
	ands r0, r5
_08028202:
	adds r0, 0x2
	strb r0, [r4]
_08028206:
	ldr r1, _08028218 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028214: .4byte gMultiHitCounter
_08028218: .4byte gBattlescriptCurrInstr
	thumb_func_end atk8D_setmultihitcounter

	thumb_func_start atk8E_initmultihitstring
atk8E_initmultihitstring: @ 802821C
	ldr r1, _0802823C @ =gBattleScripting
	movs r2, 0
	movs r0, 0xFD
	strb r0, [r1, 0x8]
	movs r0, 0x1
	strb r0, [r1, 0x9]
	strb r0, [r1, 0xA]
	strb r0, [r1, 0xB]
	strb r2, [r1, 0xC]
	movs r0, 0xFF
	strb r0, [r1, 0xD]
	ldr r1, _08028240 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_0802823C: .4byte gBattleScripting
_08028240: .4byte gBattlescriptCurrInstr
	thumb_func_end atk8E_initmultihitstring

	thumb_func_start TryDoForceSwitchOut
TryDoForceSwitchOut: @ 8028244
	push {r4-r7,lr}
	ldr r6, _08028278 @ =gBattleMons
	ldr r7, _0802827C @ =gBattlerAttacker
	ldrb r0, [r7]
	movs r5, 0x58
	adds r1, r0, 0
	muls r1, r5
	adds r1, r6
	adds r1, 0x2A
	ldr r4, _08028280 @ =gBattlerTarget
	ldrb r3, [r4]
	adds r0, r3, 0
	muls r0, r5
	adds r0, r6
	adds r0, 0x2A
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcc _0802828C
	ldr r0, _08028284 @ =gBattleStruct
	ldr r1, [r0]
	adds r1, r3, r1
	adds r1, 0x58
	ldr r2, _08028288 @ =gBattlerPartyIndexes
	lsls r0, r3, 1
	b _080282E8
	.align 2, 0
_08028278: .4byte gBattleMons
_0802827C: .4byte gBattlerAttacker
_08028280: .4byte gBattlerTarget
_08028284: .4byte gBattleStruct
_08028288: .4byte gBattlerPartyIndexes
_0802828C:
	bl Random
	movs r3, 0xFF
	ands r3, r0
	ldrb r0, [r7]
	muls r0, r5
	adds r0, r6
	adds r0, 0x2A
	ldrb r2, [r0]
	ldrb r4, [r4]
	adds r0, r4, 0
	muls r0, r5
	adds r0, r6
	adds r0, 0x2A
	ldrb r1, [r0]
	adds r2, r1
	adds r0, r3, 0
	muls r0, r2
	asrs r0, 8
	adds r0, 0x1
	lsrs r1, 2
	cmp r0, r1
	bhi _080282DC
	ldr r3, _080282D8 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	movs r0, 0
	b _080282F6
	.align 2, 0
_080282D8: .4byte gBattlescriptCurrInstr
_080282DC:
	ldr r0, _080282FC @ =gBattleStruct
	ldr r1, [r0]
	adds r1, r4, r1
	adds r1, 0x58
	ldr r2, _08028300 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
_080282E8:
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1]
	ldr r1, _08028304 @ =gBattlescriptCurrInstr
	ldr r0, _08028308 @ =BattleScript_SuccessForceOut
	str r0, [r1]
	movs r0, 0x1
_080282F6:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080282FC: .4byte gBattleStruct
_08028300: .4byte gBattlerPartyIndexes
_08028304: .4byte gBattlescriptCurrInstr
_08028308: .4byte BattleScript_SuccessForceOut
	thumb_func_end TryDoForceSwitchOut

	thumb_func_start atk8F_forcerandomswitch
atk8F_forcerandomswitch: @ 802830C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r4, _080283A4 @ =gBattleTypeFlags
	ldr r0, [r4]
	movs r1, 0x8
	ands r0, r1
	cmp r0, 0
	bne _08028320
	b _080285F4
_08028320:
	ldr r5, _080283A8 @ =gBattlerTarget
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, 24
	ldr r1, _080283AC @ =gEnemyParty
	mov r8, r1
	cmp r0, 0
	bne _08028336
	ldr r0, _080283B0 @ =gPlayerParty
	mov r8, r0
_08028336:
	ldr r0, [r4]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080283B4
	movs r7, 0
	movs r6, 0
	ldrb r0, [r5]
	bl GetBattlerMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	bl GetLinkTrainerFlankId
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _0802835C
	movs r6, 0x3
_0802835C:
	adds r5, r6, 0
	adds r0, r5, 0x3
	cmp r5, r0
	bge _080283F4
_08028364:
	movs r0, 0x64
	muls r0, r5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08028396
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08028396
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08028396
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_08028396:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r6, 0x3
	cmp r5, r0
	blt _08028364
	b _080283F4
	.align 2, 0
_080283A4: .4byte gBattleTypeFlags
_080283A8: .4byte gBattlerTarget
_080283AC: .4byte gEnemyParty
_080283B0: .4byte gPlayerParty
_080283B4:
	movs r7, 0
	movs r5, 0
_080283B8:
	movs r0, 0x64
	muls r0, r5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _080283EA
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _080283EA
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080283EA
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_080283EA:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _080283B8
_080283F4:
	cmp r7, 0x1
	bhi _08028404
	ldr r0, _08028438 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x41
	ands r0, r1
	cmp r0, 0x1
	bne _0802841C
_08028404:
	cmp r7, 0x2
	bhi _08028440
	ldr r0, _08028438 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08028440
	movs r0, 0x40
	ands r1, r0
	cmp r1, 0
	bne _08028440
_0802841C:
	ldr r3, _0802843C @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080285F8
	.align 2, 0
_08028438: .4byte gBattleTypeFlags
_0802843C: .4byte gBattlescriptCurrInstr
_08028440:
	bl TryDoForceSwitchOut
	lsls r0, 24
	cmp r0, 0
	bne _0802844C
	b _080285F8
_0802844C:
	ldr r0, _0802848C @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080284F0
_08028458:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08028490 @ =gBattlerTarget
	ldrb r0, [r0]
	bl GetBattlerMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	bl GetLinkTrainerFlankId
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _08028494
	adds r0, r6, 0x3
	lsls r0, 24
	lsrs r5, r0, 24
	b _08028496
	.align 2, 0
_0802848C: .4byte gBattleTypeFlags
_08028490: .4byte gBattlerTarget
_08028494:
	adds r5, r6, 0
_08028496:
	ldr r4, _080284E8 @ =gBattlerPartyIndexes
	ldr r0, _080284EC @ =gBattlerTarget
	ldrb r2, [r0]
	lsls r1, r2, 1
	adds r1, r4
	lsls r0, r5, 16
	lsrs r3, r0, 16
	ldrh r1, [r1]
	cmp r3, r1
	beq _08028458
	movs r0, 0x2
	eors r2, r0
	lsls r0, r2, 1
	adds r0, r4
	ldrh r0, [r0]
	cmp r3, r0
	beq _08028458
	movs r0, 0x64
	muls r0, r5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08028458
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0x1
	beq _08028458
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08028458
	b _080285AE
	.align 2, 0
_080284E8: .4byte gBattlerPartyIndexes
_080284EC: .4byte gBattlerTarget
_080284F0:
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08028560
	ldr r6, _08028558 @ =gBattlerPartyIndexes
_080284FA:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0802855C @ =gBattlerTarget
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r6
	adds r2, r5, 0
	ldrh r0, [r0]
	cmp r2, r0
	beq _080284FA
	movs r0, 0x2
	eors r1, r0
	lsls r0, r1, 1
	adds r0, r6
	ldrh r0, [r0]
	cmp r2, r0
	beq _080284FA
	movs r0, 0x64
	muls r0, r5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _080284FA
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0x1
	beq _080284FA
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080284FA
	b _080285AE
	.align 2, 0
_08028558: .4byte gBattlerPartyIndexes
_0802855C: .4byte gBattlerTarget
_08028560:
	ldr r6, _080285E8 @ =gBattlerPartyIndexes
_08028562:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080285EC @ =gBattlerTarget
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	cmp r5, r0
	beq _08028562
	movs r0, 0x64
	muls r0, r5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08028562
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0x1
	beq _08028562
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08028562
_080285AE:
	ldr r4, _080285EC @ =gBattlerTarget
	ldrb r0, [r4]
	ldr r1, _080285F0 @ =gBattleStruct
	ldr r1, [r1]
	adds r0, r1
	adds r0, 0x5C
	strb r5, [r0]
	bl IsMultiBattle
	lsls r0, 24
	cmp r0, 0
	bne _080285CC
	ldrb r0, [r4]
	bl sub_8013F6C
_080285CC:
	ldrb r0, [r4]
	adds r1, r5, 0
	movs r2, 0
	bl sub_8127EC4
	ldrb r1, [r4]
	movs r0, 0x2
	eors r0, r1
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_8127EC4
	b _080285F8
	.align 2, 0
_080285E8: .4byte gBattlerPartyIndexes
_080285EC: .4byte gBattlerTarget
_080285F0: .4byte gBattleStruct
_080285F4:
	bl TryDoForceSwitchOut
_080285F8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end atk8F_forcerandomswitch

	thumb_func_start atk90_tryconversiontypechange
atk90_tryconversiontypechange: @ 8028604
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r6, 0
	ldr r2, _08028698 @ =gBattleMons
	ldr r3, _0802869C @ =gBattlerAttacker
	ldrb r1, [r3]
	movs r0, 0x58
	muls r0, r1
	adds r1, r2, 0
	adds r1, 0xC
	adds r0, r1
	ldrh r0, [r0]
	mov r8, r2
	cmp r0, 0
	beq _08028646
	movs r5, 0x58
	adds r2, r1, 0
_0802862C:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bhi _08028646
	lsls r1, r6, 1
	ldrb r0, [r3]
	muls r0, r5
	adds r1, r0
	adds r1, r2
	ldrh r0, [r1]
	cmp r0, 0
	bne _0802862C
_08028646:
	movs r3, 0
	cmp r3, r6
	bcs _080286C8
	ldr r0, _080286A0 @ =gBattleMoves
	mov r10, r0
	ldr r5, _08028698 @ =gBattleMons
	mov r12, r5
	ldr r7, _0802869C @ =gBattlerAttacker
	ldrb r0, [r7]
	movs r4, 0x58
	adds r5, r0, 0
	muls r5, r4
	movs r0, 0xC
	add r0, r12
	mov r9, r0
_08028664:
	lsls r0, r3, 1
	adds r0, r5
	add r0, r9
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	add r0, r10
	ldrb r2, [r0, 0x2]
	cmp r2, 0x9
	bne _080286A6
	mov r0, r8
	adds r1, r5, r0
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x7
	beq _08028692
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x7
	bne _080286A4
_08028692:
	movs r2, 0x7
	b _080286A6
	.align 2, 0
_08028698: .4byte gBattleMons
_0802869C: .4byte gBattlerAttacker
_080286A0: .4byte gBattleMoves
_080286A4:
	movs r2, 0
_080286A6:
	ldrb r0, [r7]
	muls r0, r4
	add r0, r12
	adds r1, r0, 0
	adds r1, 0x21
	ldrb r1, [r1]
	cmp r2, r1
	beq _080286BE
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r2, r0
	bne _080286C8
_080286BE:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r6
	bcc _08028664
_080286C8:
	cmp r3, r6
	bne _080286EC
	ldr r3, _080286E8 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08028790
	.align 2, 0
_080286E8: .4byte gBattlescriptCurrInstr
_080286EC:
	movs r7, 0x3
	ldr r5, _08028744 @ =gBattleMoves
	mov r9, r5
_080286F2:
	bl Random
	adds r3, r0, 0
	ands r3, r7
	cmp r3, r6
	bcs _080286F2
	ldr r4, _08028748 @ =gBattleMons
	lsls r1, r3, 1
	ldr r3, _0802874C @ =gBattlerAttacker
	ldrb r2, [r3]
	movs r0, 0x58
	adds r5, r2, 0
	muls r5, r0
	adds r1, r5
	adds r0, r4, 0
	adds r0, 0xC
	adds r1, r0
	ldrh r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r2, [r0, 0x2]
	mov r8, r4
	adds r4, r3, 0
	cmp r2, 0x9
	bne _08028752
	mov r0, r8
	adds r2, r5, r0
	adds r0, r2, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x7
	beq _08028740
	adds r0, r2, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x7
	bne _08028750
_08028740:
	movs r2, 0x7
	b _08028752
	.align 2, 0
_08028744: .4byte gBattleMoves
_08028748: .4byte gBattleMons
_0802874C: .4byte gBattlerAttacker
_08028750:
	movs r2, 0
_08028752:
	ldrb r0, [r4]
	movs r3, 0x58
	muls r0, r3
	add r0, r8
	adds r1, r0, 0
	adds r1, 0x21
	ldrb r5, [r1]
	cmp r2, r5
	beq _080286F2
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r2, r0
	beq _080286F2
	strb r2, [r1]
	ldrb r0, [r4]
	muls r0, r3
	add r0, r8
	adds r0, 0x22
	strb r2, [r0]
	ldr r1, _080287A0 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x3
	strb r0, [r1, 0x1]
	strb r2, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r1, _080287A4 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_08028790:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080287A0: .4byte gBattleTextBuff1
_080287A4: .4byte gBattlescriptCurrInstr
	thumb_func_end atk90_tryconversiontypechange

	thumb_func_start atk91_givepaydaymoney
atk91_givepaydaymoney: @ 80287A8
	push {r4,r5,lr}
	ldr r0, _0802880C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r5, 0x2
	ands r0, r5
	cmp r0, 0
	bne _08028828
	ldr r1, _08028810 @ =gPaydayMoney
	ldrh r0, [r1]
	cmp r0, 0
	beq _08028828
	adds r1, r0, 0
	ldr r0, _08028814 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x4A
	ldrb r0, [r0]
	adds r4, r1, 0
	muls r4, r0
	ldr r0, _08028818 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	adds r1, r4, 0
	bl AddMoney
	ldr r1, _0802881C @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	strb r5, [r1, 0x2]
	movs r0, 0x5
	strb r0, [r1, 0x3]
	strb r4, [r1, 0x4]
	movs r0, 0xFF
	lsls r0, 8
	ands r4, r0
	lsrs r4, 8
	strb r4, [r1, 0x5]
	movs r0, 0xFF
	strb r0, [r1, 0x6]
	ldr r4, _08028820 @ =gBattlescriptCurrInstr
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r0, _08028824 @ =BattleScript_PrintPayDayMoneyString
	str r0, [r4]
	b _08028830
	.align 2, 0
_0802880C: .4byte gBattleTypeFlags
_08028810: .4byte gPaydayMoney
_08028814: .4byte gBattleStruct
_08028818: .4byte gSaveBlock1Ptr
_0802881C: .4byte gBattleTextBuff1
_08028820: .4byte gBattlescriptCurrInstr
_08028824: .4byte BattleScript_PrintPayDayMoneyString
_08028828:
	ldr r1, _08028838 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_08028830:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028838: .4byte gBattlescriptCurrInstr
	thumb_func_end atk91_givepaydaymoney

	thumb_func_start atk92_setlightscreen
atk92_setlightscreen: @ 802883C
	push {r4-r6,lr}
	ldr r5, _0802886C @ =gBattlerAttacker
	ldrb r0, [r5]
	bl GetBattlerPosition
	ldr r4, _08028870 @ =gSideStatuses
	movs r6, 0x1
	adds r1, r6, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	ldrh r1, [r1]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802887C
	ldr r2, _08028874 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08028878 @ =gBattleCommunication
	movs r0, 0
	b _080288F0
	.align 2, 0
_0802886C: .4byte gBattlerAttacker
_08028870: .4byte gSideStatuses
_08028874: .4byte gMoveResultFlags
_08028878: .4byte gBattleCommunication
_0802887C:
	ldrb r0, [r5]
	bl GetBattlerPosition
	adds r1, r6, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	ldrh r0, [r1]
	movs r2, 0x2
	orrs r0, r2
	strh r0, [r1]
	ldrb r0, [r5]
	bl GetBattlerPosition
	ldr r4, _080288E0 @ =gSideTimers
	adds r1, r6, 0
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x5
	strb r1, [r0, 0x2]
	ldrb r0, [r5]
	bl GetBattlerPosition
	adds r1, r6, 0
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r5]
	strb r1, [r0, 0x3]
	ldr r0, _080288E4 @ =gBattleTypeFlags
	ldr r0, [r0]
	ands r0, r6
	cmp r0, 0
	beq _080288EC
	movs r0, 0x1
	bl CountAliveMonsInBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080288EC
	ldr r1, _080288E8 @ =gBattleCommunication
	movs r0, 0x4
	b _080288F0
	.align 2, 0
_080288E0: .4byte gSideTimers
_080288E4: .4byte gBattleTypeFlags
_080288E8: .4byte gBattleCommunication
_080288EC:
	ldr r1, _08028900 @ =gBattleCommunication
	movs r0, 0x3
_080288F0:
	strb r0, [r1, 0x5]
	ldr r1, _08028904 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08028900: .4byte gBattleCommunication
_08028904: .4byte gBattlescriptCurrInstr
	thumb_func_end atk92_setlightscreen

	thumb_func_start atk93_tryKO
atk93_tryKO: @ 8028908
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r7, _08028934 @ =gBattleMons
	ldr r6, _08028938 @ =gBattlerTarget
	ldrb r2, [r6]
	movs r5, 0x58
	adds r0, r2, 0
	muls r0, r5
	adds r1, r0, r7
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _08028940
	ldr r1, _0802893C @ =gEnigmaBerries
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x7]
	ldrb r6, [r0, 0x1A]
	b _0802895A
	.align 2, 0
_08028934: .4byte gBattleMons
_08028938: .4byte gBattlerTarget
_0802893C: .4byte gEnigmaBerries
_08028940:
	ldrh r0, [r1, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r7
	ldrh r0, [r0, 0x2E]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r6, r0, 24
_0802895A:
	ldr r1, _080289D4 @ =gPotentialItemEffectBattler
	ldr r5, _080289D8 @ =gBattlerTarget
	ldrb r0, [r5]
	strb r0, [r1]
	cmp r4, 0x27
	bne _08028998
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r6
	bcs _08028998
	ldrb r0, [r5]
	movs r1, 0x27
	bl RecordItemEffectBattle
	ldr r2, _080289DC @ =gSpecialStatuses
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
_08028998:
	ldr r1, _080289E0 @ =gBattleMons
	ldr r2, _080289D8 @ =gBattlerTarget
	ldrb r3, [r2]
	movs r6, 0x58
	adds r0, r3, 0
	muls r0, r6
	adds r5, r0, r1
	adds r0, r5, 0
	adds r0, 0x20
	ldrb r4, [r0]
	mov r8, r1
	mov r9, r2
	cmp r4, 0x5
	bne _080289F4
	ldr r2, _080289E4 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080289E8 @ =gLastUsedAbility
	strb r4, [r0]
	ldr r1, _080289EC @ =gBattlescriptCurrInstr
	ldr r0, _080289F0 @ =BattleScript_SturdyPreventsOHKO
	str r0, [r1]
	mov r1, r9
	ldrb r0, [r1]
	movs r1, 0x5
	bl RecordAbilityBattle
	b _08028C48
	.align 2, 0
_080289D4: .4byte gPotentialItemEffectBattler
_080289D8: .4byte gBattlerTarget
_080289DC: .4byte gSpecialStatuses
_080289E0: .4byte gBattleMons
_080289E4: .4byte gMoveResultFlags
_080289E8: .4byte gLastUsedAbility
_080289EC: .4byte gBattlescriptCurrInstr
_080289F0: .4byte BattleScript_SturdyPreventsOHKO
_080289F4:
	ldr r1, _08028A68 @ =gStatuses3
	lsls r0, r3, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x18
	ands r0, r1
	cmp r0, 0
	bne _08028A78
	ldr r1, _08028A6C @ =gBattleMoves
	ldr r0, _08028A70 @ =gCurrentMove
	ldrh r0, [r0]
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldr r7, _08028A74 @ =gBattlerAttacker
	ldrb r0, [r7]
	muls r0, r6
	add r0, r8
	adds r0, 0x2A
	ldrb r0, [r0]
	adds r1, r5, 0
	adds r1, 0x2A
	ldrb r1, [r1]
	subs r0, r1
	ldrb r2, [r2, 0x3]
	adds r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	adds r0, 0x1
	cmp r0, r4
	blt _08028A48
	b _08028BE0
_08028A48:
	ldrb r0, [r7]
	adds r1, r0, 0
	muls r1, r6
	add r1, r8
	adds r1, 0x2A
	mov r2, r9
	ldrb r0, [r2]
	muls r0, r6
	add r0, r8
	adds r0, 0x2A
	ldrb r1, [r1]
	movs r4, 0x1
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08028B0E
	b _08028BE0
	.align 2, 0
_08028A68: .4byte gStatuses3
_08028A6C: .4byte gBattleMoves
_08028A70: .4byte gCurrentMove
_08028A74: .4byte gBattlerAttacker
_08028A78:
	ldr r1, _08028B44 @ =gDisableStructs
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldr r1, _08028B48 @ =gBattlerAttacker
	ldrb r0, [r0, 0x15]
	adds r7, r1, 0
	ldrb r3, [r7]
	cmp r0, r3
	bne _08028AA2
	ldrb r0, [r7]
	muls r0, r6
	add r0, r8
	adds r0, 0x2A
	adds r1, r5, 0
	adds r1, 0x2A
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bcs _08028B1A
_08028AA2:
	ldr r1, _08028B4C @ =gBattleMoves
	ldr r0, _08028B50 @ =gCurrentMove
	ldrh r0, [r0]
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldr r6, _08028B54 @ =gBattleMons
	ldrb r0, [r7]
	movs r5, 0x58
	muls r0, r5
	adds r0, r6
	adds r0, 0x2A
	ldrb r1, [r0]
	ldr r0, _08028B58 @ =gBattlerTarget
	mov r8, r0
	ldrb r0, [r0]
	muls r0, r5
	adds r0, r6
	adds r0, 0x2A
	ldrb r0, [r0]
	subs r1, r0
	ldrb r2, [r2, 0x3]
	adds r1, r2
	lsls r1, 16
	lsrs r4, r1, 16
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	adds r0, 0x1
	cmp r0, r4
	bge _08028B0C
	ldrb r0, [r7]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r6
	adds r1, 0x2A
	mov r2, r8
	ldrb r0, [r2]
	muls r0, r5
	adds r0, r6
	adds r0, 0x2A
	ldrb r1, [r1]
	movs r4, 0x1
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08028B0E
_08028B0C:
	movs r4, 0
_08028B0E:
	ldr r3, _08028B54 @ =gBattleMons
	mov r8, r3
	ldr r0, _08028B58 @ =gBattlerTarget
	mov r9, r0
	cmp r4, 0
	beq _08028BE0
_08028B1A:
	ldr r0, _08028B5C @ =gProtectStructs
	mov r1, r9
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 30
	cmp r0, 0
	bge _08028B68
	ldr r1, _08028B60 @ =gBattleMoveDamage
	movs r0, 0x58
	muls r0, r2
	add r0, r8
	ldrh r0, [r0, 0x28]
	subs r0, 0x1
	str r0, [r1]
	ldr r2, _08028B64 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x40
	b _08028BC6
	.align 2, 0
_08028B44: .4byte gDisableStructs
_08028B48: .4byte gBattlerAttacker
_08028B4C: .4byte gBattleMoves
_08028B50: .4byte gCurrentMove
_08028B54: .4byte gBattleMons
_08028B58: .4byte gBattlerTarget
_08028B5C: .4byte gProtectStructs
_08028B60: .4byte gBattleMoveDamage
_08028B64: .4byte gMoveResultFlags
_08028B68:
	ldr r0, _08028BA4 @ =gSpecialStatuses
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	lsrs r0, 7
	cmp r0, 0
	beq _08028BB4
	ldr r1, _08028BA8 @ =gBattleMoveDamage
	movs r3, 0x58
	adds r0, r2, 0
	muls r0, r3
	add r0, r8
	ldrh r0, [r0, 0x28]
	subs r0, 0x1
	str r0, [r1]
	ldr r2, _08028BAC @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08028BB0 @ =gLastUsedItem
	mov r2, r9
	ldrb r0, [r2]
	muls r0, r3
	add r0, r8
	ldrh r0, [r0, 0x2E]
	strh r0, [r1]
	b _08028BCA
	.align 2, 0
_08028BA4: .4byte gSpecialStatuses
_08028BA8: .4byte gBattleMoveDamage
_08028BAC: .4byte gMoveResultFlags
_08028BB0: .4byte gLastUsedItem
_08028BB4:
	ldr r1, _08028BD4 @ =gBattleMoveDamage
	movs r0, 0x58
	muls r0, r2
	add r0, r8
	ldrh r0, [r0, 0x28]
	str r0, [r1]
	ldr r2, _08028BD8 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x10
_08028BC6:
	orrs r0, r1
	strb r0, [r2]
_08028BCA:
	ldr r1, _08028BDC @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08028C48
	.align 2, 0
_08028BD4: .4byte gBattleMoveDamage
_08028BD8: .4byte gMoveResultFlags
_08028BDC: .4byte gBattlescriptCurrInstr
_08028BE0:
	ldr r2, _08028C14 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r3, _08028C18 @ =gBattleMons
	ldr r0, _08028C1C @ =gBattlerAttacker
	ldrb r0, [r0]
	movs r2, 0x58
	adds r1, r0, 0
	muls r1, r2
	adds r1, r3
	adds r1, 0x2A
	ldr r0, _08028C20 @ =gBattlerTarget
	ldrb r0, [r0]
	muls r0, r2
	adds r0, r3
	adds r0, 0x2A
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcc _08028C28
	ldr r1, _08028C24 @ =gBattleCommunication
	movs r0, 0
	b _08028C2C
	.align 2, 0
_08028C14: .4byte gMoveResultFlags
_08028C18: .4byte gBattleMons
_08028C1C: .4byte gBattlerAttacker
_08028C20: .4byte gBattlerTarget
_08028C24: .4byte gBattleCommunication
_08028C28:
	ldr r1, _08028C54 @ =gBattleCommunication
	movs r0, 0x1
_08028C2C:
	strb r0, [r1, 0x5]
	ldr r3, _08028C58 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_08028C48:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028C54: .4byte gBattleCommunication
_08028C58: .4byte gBattlescriptCurrInstr
	thumb_func_end atk93_tryKO

	thumb_func_start atk94_damagetohalftargethp
atk94_damagetohalftargethp: @ 8028C5C
	push {lr}
	ldr r3, _08028C88 @ =gBattleMoveDamage
	ldr r2, _08028C8C @ =gBattleMons
	ldr r0, _08028C90 @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x28]
	lsrs r0, 1
	str r0, [r3]
	cmp r0, 0
	bne _08028C7A
	movs r0, 0x1
	str r0, [r3]
_08028C7A:
	ldr r1, _08028C94 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08028C88: .4byte gBattleMoveDamage
_08028C8C: .4byte gBattleMons
_08028C90: .4byte gBattlerTarget
_08028C94: .4byte gBattlescriptCurrInstr
	thumb_func_end atk94_damagetohalftargethp

	thumb_func_start atk95_setsandstorm
atk95_setsandstorm: @ 8028C98
	push {lr}
	ldr r2, _08028CB8 @ =gBattleWeather
	ldrh r1, [r2]
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	beq _08028CC4
	ldr r2, _08028CBC @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08028CC0 @ =gBattleCommunication
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _08028CD6
	.align 2, 0
_08028CB8: .4byte gBattleWeather
_08028CBC: .4byte gMoveResultFlags
_08028CC0: .4byte gBattleCommunication
_08028CC4:
	movs r0, 0x8
	strh r0, [r2]
	ldr r1, _08028CE4 @ =gBattleCommunication
	movs r0, 0x3
	strb r0, [r1, 0x5]
	ldr r0, _08028CE8 @ =gWishFutureKnock
	adds r0, 0x28
	movs r1, 0x5
	strb r1, [r0]
_08028CD6:
	ldr r1, _08028CEC @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08028CE4: .4byte gBattleCommunication
_08028CE8: .4byte gWishFutureKnock
_08028CEC: .4byte gBattlescriptCurrInstr
	thumb_func_end atk95_setsandstorm

	thumb_func_start atk96_weatherdamage
atk96_weatherdamage: @ 8028CF0
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _08028DBC @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0xA0
	lsls r1, 8
	ands r0, r1
	movs r1, 0x80
	lsls r1, 8
	cmp r0, r1
	bne _08028D18
	ldr r0, _08028DC0 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08028D18
	b _08028E64
_08028D18:
	movs r0, 0
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08028D32
	b _08028E48
_08028D32:
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	beq _08028D48
	b _08028E48
_08028D48:
	ldr r2, _08028DC4 @ =gBattleWeather
	ldrh r1, [r2]
	movs r0, 0x18
	ands r0, r1
	ldr r5, _08028DC0 @ =gBattlerAttacker
	adds r4, r2, 0
	cmp r0, 0
	beq _08028DDA
	ldr r0, _08028DC8 @ =gBattleMons
	ldrb r2, [r5]
	movs r1, 0x58
	muls r1, r2
	adds r3, r1, r0
	adds r0, r3, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x5
	beq _08028DD4
	cmp r0, 0x8
	beq _08028DD4
	cmp r0, 0x4
	beq _08028DD4
	adds r0, r3, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x5
	beq _08028DD4
	cmp r0, 0x8
	beq _08028DD4
	cmp r0, 0x4
	beq _08028DD4
	adds r0, r3, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x8
	beq _08028DD4
	ldr r0, _08028DCC @ =gStatuses3
	lsls r1, r2, 2
	adds r1, r0
	ldr r1, [r1]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08028DD4
	movs r0, 0x80
	lsls r0, 11
	ands r1, r0
	cmp r1, 0
	bne _08028DD4
	ldr r1, _08028DD0 @ =gBattleMoveDamage
	ldrh r0, [r3, 0x2C]
	lsrs r0, 4
	str r0, [r1]
	cmp r0, 0
	bne _08028DDA
	movs r0, 0x1
	b _08028DD8
	.align 2, 0
_08028DBC: .4byte gBattleTypeFlags
_08028DC0: .4byte gBattlerAttacker
_08028DC4: .4byte gBattleWeather
_08028DC8: .4byte gBattleMons
_08028DCC: .4byte gStatuses3
_08028DD0: .4byte gBattleMoveDamage
_08028DD4:
	ldr r1, _08028E30 @ =gBattleMoveDamage
	movs r0, 0
_08028DD8:
	str r0, [r1]
_08028DDA:
	ldrh r1, [r4]
	movs r4, 0x80
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08028E50
	ldr r1, _08028E34 @ =gBattleMons
	ldrb r3, [r5]
	movs r0, 0x58
	muls r0, r3
	adds r2, r0, r1
	adds r0, r2, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0xF
	beq _08028E3C
	adds r0, r2, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0xF
	beq _08028E3C
	ldr r0, _08028E38 @ =gStatuses3
	lsls r1, r3, 2
	adds r1, r0
	ldr r1, [r1]
	adds r0, r1, 0
	ands r0, r4
	cmp r0, 0
	bne _08028E3C
	movs r0, 0x80
	lsls r0, 11
	ands r1, r0
	cmp r1, 0
	bne _08028E3C
	ldr r1, _08028E30 @ =gBattleMoveDamage
	ldrh r0, [r2, 0x2C]
	lsrs r0, 4
	str r0, [r1]
	cmp r0, 0
	bne _08028E50
	movs r0, 0x1
	str r0, [r1]
	b _08028E50
	.align 2, 0
_08028E30: .4byte gBattleMoveDamage
_08028E34: .4byte gBattleMons
_08028E38: .4byte gStatuses3
_08028E3C:
	ldr r1, _08028E44 @ =gBattleMoveDamage
	movs r0, 0
	str r0, [r1]
	b _08028E50
	.align 2, 0
_08028E44: .4byte gBattleMoveDamage
_08028E48:
	ldr r1, _08028E7C @ =gBattleMoveDamage
	movs r0, 0
	str r0, [r1]
	ldr r5, _08028E80 @ =gBattlerAttacker
_08028E50:
	ldr r0, _08028E84 @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldr r2, _08028E88 @ =gBitTable
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08028E6A
_08028E64:
	ldr r1, _08028E7C @ =gBattleMoveDamage
	movs r0, 0
	str r0, [r1]
_08028E6A:
	ldr r1, _08028E8C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028E7C: .4byte gBattleMoveDamage
_08028E80: .4byte gBattlerAttacker
_08028E84: .4byte gAbsentBattlerFlags
_08028E88: .4byte gBitTable
_08028E8C: .4byte gBattlescriptCurrInstr
	thumb_func_end atk96_weatherdamage

	thumb_func_start atk97_tryinfatuating
atk97_tryinfatuating: @ 8028E90
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, _08028EBC @ =gBattlerAttacker
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08028EC8
	ldr r1, _08028EC0 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08028EC4 @ =gPlayerParty
	b _08028ED8
	.align 2, 0
_08028EBC: .4byte gBattlerAttacker
_08028EC0: .4byte gBattlerPartyIndexes
_08028EC4: .4byte gPlayerParty
_08028EC8:
	ldr r1, _08028EFC @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08028F00 @ =gEnemyParty
_08028ED8:
	adds r5, r1, r0
	ldr r4, _08028F04 @ =gBattlerTarget
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08028F0C
	ldr r1, _08028EFC @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08028F08 @ =gPlayerParty
	b _08028F1C
	.align 2, 0
_08028EFC: .4byte gBattlerPartyIndexes
_08028F00: .4byte gEnemyParty
_08028F04: .4byte gBattlerTarget
_08028F08: .4byte gPlayerParty
_08028F0C:
	ldr r1, _08028F78 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08028F7C @ =gEnemyParty
_08028F1C:
	adds r4, r1, r0
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	adds r0, r5, 0
	movs r1, 0
	bl GetMonData
	mov r9, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r7, r0, 0
	ldr r5, _08028F80 @ =gBattlerTarget
	ldrb r0, [r5]
	movs r6, 0x58
	muls r0, r6
	ldr r1, _08028F84 @ =gBattleMons
	adds r0, r1
	adds r0, 0x20
	ldrb r2, [r0]
	cmp r2, 0xC
	bne _08028F94
	ldr r1, _08028F88 @ =gBattlescriptCurrInstr
	ldr r0, _08028F8C @ =BattleScript_ObliviousPreventsAttraction
	str r0, [r1]
	ldr r0, _08028F90 @ =gLastUsedAbility
	strb r2, [r0]
	ldrb r0, [r5]
	movs r1, 0xC
	bl RecordAbilityBattle
	b _0802902C
	.align 2, 0
_08028F78: .4byte gBattlerPartyIndexes
_08028F7C: .4byte gEnemyParty
_08028F80: .4byte gBattlerTarget
_08028F84: .4byte gBattleMons
_08028F88: .4byte gBattlescriptCurrInstr
_08028F8C: .4byte BattleScript_ObliviousPreventsAttraction
_08028F90: .4byte gLastUsedAbility
_08028F94:
	mov r0, r10
	mov r1, r9
	bl GetGenderFromSpeciesAndPersonality
	adds r4, r0, 0
	mov r0, r8
	adds r1, r7, 0
	bl GetGenderFromSpeciesAndPersonality
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _08028FE4
	ldrb r0, [r5]
	muls r0, r6
	ldr r4, _08029000 @ =gBattleMons
	adds r4, 0x50
	adds r0, r4
	ldr r0, [r0]
	movs r1, 0xF0
	lsls r1, 12
	ands r0, r1
	cmp r0, 0
	bne _08028FE4
	mov r0, r10
	mov r1, r9
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08028FE4
	mov r0, r8
	adds r1, r7, 0
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _08029008
_08028FE4:
	ldr r3, _08029004 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802902C
	.align 2, 0
_08029000: .4byte gBattleMons
_08029004: .4byte gBattlescriptCurrInstr
_08029008:
	ldrb r0, [r5]
	adds r2, r0, 0
	muls r2, r6
	adds r2, r4
	ldr r1, _0802903C @ =gBitTable
	ldr r0, _08029040 @ =gBattlerAttacker
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r1, 16
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r1, _08029044 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802902C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802903C: .4byte gBitTable
_08029040: .4byte gBattlerAttacker
_08029044: .4byte gBattlescriptCurrInstr
	thumb_func_end atk97_tryinfatuating

	thumb_func_start atk98_updatestatusicon
atk98_updatestatusicon: @ 8029048
	push {r4-r7,lr}
	ldr r0, _080290B8 @ =gBattleControllerExecFlags
	ldr r1, [r0]
	cmp r1, 0
	beq _08029054
	b _080291C0
_08029054:
	ldr r5, _080290BC @ =gBattlescriptCurrInstr
	ldr r2, [r5]
	ldrb r0, [r2, 0x1]
	cmp r0, 0xD
	bne _080290D4
	ldr r2, _080290C0 @ =gActiveBattler
	strb r1, [r2]
	ldr r0, _080290C4 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08029164
	ldr r7, _080290C8 @ =gBitTable
	adds r4, r2, 0
	ldr r5, _080290CC @ =gBattleMons
	adds r6, r5, 0
	adds r6, 0x50
_08029074:
	ldr r0, _080290D0 @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r0, r7
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080290A2
	movs r0, 0x58
	muls r2, r0
	adds r0, r5, 0
	adds r0, 0x4C
	adds r0, r2, r0
	ldr r1, [r0]
	adds r2, r6
	ldr r2, [r2]
	movs r0, 0
	bl BtlController_EmitStatusIconUpdate
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_080290A2:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _080290C4 @ =gBattlersCount
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08029074
	b _08029164
	.align 2, 0
_080290B8: .4byte gBattleControllerExecFlags
_080290BC: .4byte gBattlescriptCurrInstr
_080290C0: .4byte gActiveBattler
_080290C4: .4byte gBattlersCount
_080290C8: .4byte gBitTable
_080290CC: .4byte gBattleMons
_080290D0: .4byte gAbsentBattlerFlags
_080290D4:
	cmp r0, 0x4
	bne _0802918C
	ldr r4, _08029170 @ =gActiveBattler
	ldr r5, _08029174 @ =gBattlerAttacker
	ldrb r0, [r5]
	strb r0, [r4]
	ldr r6, _08029178 @ =gAbsentBattlerFlags
	ldrb r1, [r6]
	ldr r7, _0802917C @ =gBitTable
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r0, r7
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08029114
	ldr r3, _08029180 @ =gBattleMons
	movs r0, 0x58
	muls r2, r0
	adds r0, r3, 0
	adds r0, 0x4C
	adds r0, r2, r0
	ldr r1, [r0]
	adds r3, 0x50
	adds r2, r3
	ldr r2, [r2]
	movs r0, 0
	bl BtlController_EmitStatusIconUpdate
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_08029114:
	ldr r0, _08029184 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08029164
	ldrb r0, [r5]
	bl GetBattlerPosition
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerAtPosition
	strb r0, [r4]
	ldrb r1, [r6]
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r0, r7
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08029164
	ldr r3, _08029180 @ =gBattleMons
	movs r0, 0x58
	muls r2, r0
	adds r0, r3, 0
	adds r0, 0x4C
	adds r0, r2, r0
	ldr r1, [r0]
	adds r3, 0x50
	adds r2, r3
	ldr r2, [r2]
	movs r0, 0
	bl BtlController_EmitStatusIconUpdate
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_08029164:
	ldr r1, _08029188 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	b _080291C0
	.align 2, 0
_08029170: .4byte gActiveBattler
_08029174: .4byte gBattlerAttacker
_08029178: .4byte gAbsentBattlerFlags
_0802917C: .4byte gBitTable
_08029180: .4byte gBattleMons
_08029184: .4byte gBattleTypeFlags
_08029188: .4byte gBattlescriptCurrInstr
_0802918C:
	ldrb r0, [r2, 0x1]
	bl GetBattlerForBattleScript
	ldr r4, _080291C8 @ =gActiveBattler
	strb r0, [r4]
	ldr r3, _080291CC @ =gBattleMons
	ldrb r1, [r4]
	movs r0, 0x58
	adds r2, r1, 0
	muls r2, r0
	adds r0, r3, 0
	adds r0, 0x4C
	adds r0, r2, r0
	ldr r1, [r0]
	adds r3, 0x50
	adds r2, r3
	ldr r2, [r2]
	movs r0, 0
	bl BtlController_EmitStatusIconUpdate
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
_080291C0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080291C8: .4byte gActiveBattler
_080291CC: .4byte gBattleMons
	thumb_func_end atk98_updatestatusicon

	thumb_func_start atk99_setmist
atk99_setmist: @ 80291D0
	push {r4-r6,lr}
	ldr r6, _08029200 @ =gSideTimers
	ldr r4, _08029204 @ =gBattlerAttacker
	ldrb r0, [r4]
	bl GetBattlerPosition
	movs r5, 0x1
	adds r1, r5, 0
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _08029210
	ldr r2, _08029208 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0802920C @ =gBattleCommunication
	strb r5, [r0, 0x5]
	b _0802925E
	.align 2, 0
_08029200: .4byte gSideTimers
_08029204: .4byte gBattlerAttacker
_08029208: .4byte gMoveResultFlags
_0802920C: .4byte gBattleCommunication
_08029210:
	ldrb r0, [r4]
	bl GetBattlerPosition
	adds r1, r5, 0
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x5
	strb r1, [r0, 0x4]
	ldrb r0, [r4]
	bl GetBattlerPosition
	adds r1, r5, 0
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r4]
	strb r1, [r0, 0x5]
	ldrb r0, [r4]
	bl GetBattlerPosition
	ldr r2, _0802926C @ =gSideStatuses
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r3, 0x80
	lsls r3, 1
	adds r0, r3, 0
	movs r3, 0
	orrs r0, r2
	strh r0, [r1]
	ldr r0, _08029270 @ =gBattleCommunication
	strb r3, [r0, 0x5]
_0802925E:
	ldr r1, _08029274 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802926C: .4byte gSideStatuses
_08029270: .4byte gBattleCommunication
_08029274: .4byte gBattlescriptCurrInstr
	thumb_func_end atk99_setmist

	thumb_func_start atk9A_setfocusenergy
atk9A_setfocusenergy: @ 8029278
	push {lr}
	ldr r1, _080292A8 @ =gBattleMons
	ldr r0, _080292AC @ =gBattlerAttacker
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r1, [r0]
	movs r3, 0x80
	lsls r3, 13
	adds r2, r1, 0
	ands r2, r3
	cmp r2, 0
	beq _080292B8
	ldr r2, _080292B0 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080292B4 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _080292C0
	.align 2, 0
_080292A8: .4byte gBattleMons
_080292AC: .4byte gBattlerAttacker
_080292B0: .4byte gMoveResultFlags
_080292B4: .4byte gBattleCommunication
_080292B8:
	orrs r1, r3
	str r1, [r0]
	ldr r0, _080292CC @ =gBattleCommunication
	strb r2, [r0, 0x5]
_080292C0:
	ldr r1, _080292D0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080292CC: .4byte gBattleCommunication
_080292D0: .4byte gBattlescriptCurrInstr
	thumb_func_end atk9A_setfocusenergy

	thumb_func_start atk9B_transformdataexecution
atk9B_transformdataexecution: @ 80292D4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r1, _0802932C @ =gChosenMove
	ldr r2, _08029330 @ =0x0000ffff
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08029334 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r7, _08029338 @ =gBattleMons
	ldr r0, _0802933C @ =gBattlerTarget
	mov r12, r0
	ldrb r1, [r0]
	movs r6, 0x58
	adds r0, r1, 0
	muls r0, r6
	adds r5, r7, 0
	adds r5, 0x50
	adds r0, r5
	ldr r0, [r0]
	movs r4, 0x80
	lsls r4, 14
	ands r0, r4
	cmp r0, 0
	bne _0802931A
	ldr r0, _08029340 @ =gStatuses3
	lsls r1, 2
	adds r1, r0
	ldr r2, [r1]
	ldr r0, _08029344 @ =0x000400c0
	ands r2, r0
	cmp r2, 0
	beq _08029350
_0802931A:
	ldr r2, _08029348 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0802934C @ =gBattleCommunication
	movs r0, 0x1
	b _08029464
	.align 2, 0
_0802932C: .4byte gChosenMove
_08029330: .4byte 0x0000ffff
_08029334: .4byte gBattlescriptCurrInstr
_08029338: .4byte gBattleMons
_0802933C: .4byte gBattlerTarget
_08029340: .4byte gStatuses3
_08029344: .4byte 0x000400c0
_08029348: .4byte gMoveResultFlags
_0802934C: .4byte gBattleCommunication
_08029350:
	ldr r3, _08029424 @ =gBattlerAttacker
	ldrb r0, [r3]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	ldr r0, [r1]
	orrs r0, r4
	str r0, [r1]
	ldr r4, _08029428 @ =gDisableStructs
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	strh r2, [r0, 0x4]
	ldrb r0, [r3]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0xB]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0xB]
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	mov r2, r12
	ldrb r1, [r2]
	muls r1, r6
	adds r2, r7, 0
	adds r2, 0x48
	adds r1, r2
	ldr r1, [r1]
	str r1, [r0]
	ldrb r0, [r3]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x18]
	movs r0, 0xF
	ands r0, r2
	strb r0, [r1, 0x18]
	ldr r1, _0802942C @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x6
	strb r0, [r1, 0x1]
	mov r2, r12
	ldrb r0, [r2]
	muls r0, r6
	adds r0, r7
	ldrh r0, [r0]
	strb r0, [r1, 0x2]
	ldrb r0, [r2]
	muls r0, r6
	adds r0, r7
	ldrh r0, [r0]
	lsrs r0, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldrb r0, [r3]
	muls r0, r6
	adds r5, r0, r7
	ldrb r0, [r2]
	muls r0, r6
	adds r2, r0, r7
	movs r4, 0
	adds r6, r3, 0
	ldr r0, _08029430 @ =gActiveBattler
	mov r8, r0
_080293E8:
	adds r0, r5, r4
	adds r1, r2, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0x23
	bls _080293E8
	movs r4, 0
	ldr r7, _08029434 @ =gBattleMoves
	ldr r3, _08029438 @ =gUnknown_2023BF0
	adds r5, r3, 0
	adds r5, 0x18
_08029400:
	lsls r1, r4, 1
	ldrb r2, [r6]
	movs r0, 0x58
	muls r2, r0
	adds r1, r2
	adds r1, r3
	ldrh r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldrb r1, [r0, 0x4]
	cmp r1, 0x4
	bhi _0802943C
	adds r0, r4, r2
	adds r0, r5
	b _08029442
	.align 2, 0
_08029424: .4byte gBattlerAttacker
_08029428: .4byte gDisableStructs
_0802942C: .4byte gBattleTextBuff1
_08029430: .4byte gActiveBattler
_08029434: .4byte gBattleMoves
_08029438: .4byte gUnknown_2023BF0
_0802943C:
	adds r0, r4, r2
	adds r0, r5
	movs r1, 0x5
_08029442:
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0x3
	ble _08029400
	ldrb r0, [r6]
	mov r1, r8
	strb r0, [r1]
	movs r0, 0
	movs r1, 0x2
	bl BtlController_EmitResetActionMoveSelection
	mov r2, r8
	ldrb r0, [r2]
	bl MarkBattlerForControllerExec
	ldr r1, _08029470 @ =gBattleCommunication
	movs r0, 0
_08029464:
	strb r0, [r1, 0x5]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08029470: .4byte gBattleCommunication
	thumb_func_end atk9B_transformdataexecution

	thumb_func_start atk9C_setsubstitute
atk9C_setsubstitute: @ 8029474
	push {r4-r7,lr}
	ldr r7, _080294A4 @ =gBattleMons
	ldr r6, _080294A8 @ =gBattlerAttacker
	ldrb r0, [r6]
	movs r5, 0x58
	muls r0, r5
	adds r3, r0, r7
	ldrh r0, [r3, 0x2C]
	lsrs r1, r0, 2
	adds r2, r1, 0
	cmp r1, 0
	bne _0802948E
	movs r2, 0x1
_0802948E:
	ldrh r0, [r3, 0x28]
	cmp r0, r2
	bhi _080294B4
	ldr r1, _080294AC @ =gBattleMoveDamage
	movs r0, 0
	str r0, [r1]
	ldr r1, _080294B0 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08029508
	.align 2, 0
_080294A4: .4byte gBattleMons
_080294A8: .4byte gBattlerAttacker
_080294AC: .4byte gBattleMoveDamage
_080294B0: .4byte gBattleCommunication
_080294B4:
	ldr r4, _08029518 @ =gBattleMoveDamage
	str r1, [r4]
	cmp r1, 0
	bne _080294C0
	movs r0, 0x1
	str r0, [r4]
_080294C0:
	ldrb r0, [r6]
	adds r2, r0, 0
	muls r2, r5
	adds r3, r7, 0
	adds r3, 0x50
	adds r2, r3
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 17
	orrs r0, r1
	str r0, [r2]
	ldrb r0, [r6]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r3
	ldr r0, [r1]
	ldr r2, _0802951C @ =0xffff1fff
	ands r0, r2
	str r0, [r1]
	ldr r2, _08029520 @ =gDisableStructs
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, [r4]
	movs r2, 0
	strb r1, [r0, 0xA]
	ldr r0, _08029524 @ =gBattleCommunication
	strb r2, [r0, 0x5]
	ldr r2, _08029528 @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 1
	orrs r0, r1
	str r0, [r2]
_08029508:
	ldr r1, _0802952C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08029518: .4byte gBattleMoveDamage
_0802951C: .4byte 0xffff1fff
_08029520: .4byte gDisableStructs
_08029524: .4byte gBattleCommunication
_08029528: .4byte gHitMarker
_0802952C: .4byte gBattlescriptCurrInstr
	thumb_func_end atk9C_setsubstitute

	thumb_func_start IsMoveUncopyableByMimic
IsMoveUncopyableByMimic: @ 8029530
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r3, 0
	ldr r0, _08029570 @ =sMovesForbiddenToCopy
	ldrh r1, [r0]
	ldr r4, _08029574 @ =0x0000fffe
	adds r5, r0, 0
	cmp r1, r4
	beq _08029558
	cmp r1, r2
	beq _08029558
	adds r1, r5, 0
_0802954A:
	adds r1, 0x2
	adds r3, 0x1
	ldrh r0, [r1]
	cmp r0, r4
	beq _08029558
	cmp r0, r2
	bne _0802954A
_08029558:
	lsls r0, r3, 1
	adds r0, r5
	ldrh r1, [r0]
	ldr r0, _08029574 @ =0x0000fffe
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08029570: .4byte sMovesForbiddenToCopy
_08029574: .4byte 0x0000fffe
	thumb_func_end IsMoveUncopyableByMimic

	thumb_func_start atk9D_mimicattackcopy
atk9D_mimicattackcopy: @ 8029578
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _080295F0 @ =gChosenMove
	ldr r1, _080295F4 @ =0x0000ffff
	adds r7, r1, 0
	strh r7, [r0]
	ldr r5, _080295F8 @ =gLastMoves
	ldr r6, _080295FC @ =gBattlerTarget
	ldrb r0, [r6]
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	bl IsMoveUncopyableByMimic
	lsls r0, 24
	cmp r0, 0
	bne _080295D2
	ldr r3, _08029600 @ =gBattleMons
	ldr r2, _08029604 @ =gBattlerAttacker
	ldrb r1, [r2]
	movs r0, 0x58
	adds r4, r1, 0
	muls r4, r0
	adds r0, r3, 0
	adds r0, 0x50
	adds r0, r4, r0
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 14
	ands r1, r0
	mov r12, r3
	mov r9, r2
	cmp r1, 0
	bne _080295D2
	ldrb r0, [r6]
	lsls r0, 1
	adds r0, r5
	ldrh r1, [r0]
	cmp r1, 0
	beq _080295D2
	cmp r1, r7
	bne _0802960C
_080295D2:
	ldr r3, _08029608 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08029744
	.align 2, 0
_080295F0: .4byte gChosenMove
_080295F4: .4byte 0x0000ffff
_080295F8: .4byte gLastMoves
_080295FC: .4byte gBattlerTarget
_08029600: .4byte gBattleMons
_08029604: .4byte gBattlerAttacker
_08029608: .4byte gBattlescriptCurrInstr
_0802960C:
	movs r2, 0
	mov r3, r12
	adds r3, 0xC
	adds r0, r4, r3
	ldrh r0, [r0]
	ldr r4, _0802969C @ =gBattlescriptCurrInstr
	mov r10, r4
	cmp r0, r1
	beq _08029646
	mov r8, r3
	adds r7, r5, 0
	adds r5, r6, 0
	mov r4, r9
	movs r3, 0x58
_08029628:
	adds r2, 0x1
	cmp r2, 0x3
	bgt _08029646
	lsls r1, r2, 1
	ldrb r0, [r4]
	muls r0, r3
	adds r1, r0
	add r1, r8
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r7
	ldrh r1, [r1]
	ldrh r0, [r0]
	cmp r1, r0
	bne _08029628
_08029646:
	cmp r2, 0x4
	bne _08029728
	ldr r5, _080296A0 @ =gCurrMovePos
	ldrb r1, [r5]
	lsls r1, 1
	mov r2, r9
	ldrb r0, [r2]
	movs r6, 0x58
	muls r0, r6
	adds r1, r0
	mov r0, r12
	adds r0, 0xC
	adds r1, r0
	ldr r2, _080296A4 @ =gLastMoves
	ldr r3, _080296A8 @ =gBattlerTarget
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r4, _080296AC @ =gBattleMoves
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r4, [r0, 0x4]
	cmp r4, 0x4
	bhi _080296B0
	mov r1, r9
	ldrb r0, [r1]
	muls r0, r6
	ldrb r1, [r5]
	adds r0, r1
	mov r1, r12
	adds r1, 0x24
	adds r0, r1
	strb r4, [r0]
	b _080296C4
	.align 2, 0
_0802969C: .4byte gBattlescriptCurrInstr
_080296A0: .4byte gCurrMovePos
_080296A4: .4byte gLastMoves
_080296A8: .4byte gBattlerTarget
_080296AC: .4byte gBattleMoves
_080296B0:
	mov r4, r9
	ldrb r0, [r4]
	muls r0, r6
	ldrb r1, [r5]
	adds r0, r1
	mov r1, r12
	adds r1, 0x24
	adds r0, r1
	movs r1, 0x5
	strb r1, [r0]
_080296C4:
	ldr r1, _0802971C @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1, 0x2]
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsrs r0, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _08029720 @ =gDisableStructs
	mov r2, r9
	ldrb r0, [r2]
	lsls r2, r0, 3
	subs r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r4, [r2, 0x18]
	lsrs r3, r4, 4
	ldr r1, _08029724 @ =gBitTable
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	orrs r1, r3
	lsls r1, 4
	movs r0, 0xF
	ands r0, r4
	orrs r0, r1
	strb r0, [r2, 0x18]
	mov r4, r10
	ldr r0, [r4]
	adds r0, 0x5
	str r0, [r4]
	b _08029744
	.align 2, 0
_0802971C: .4byte gBattleTextBuff1
_08029720: .4byte gDisableStructs
_08029724: .4byte gBitTable
_08029728:
	mov r0, r10
	ldr r2, [r0]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	mov r2, r10
	str r1, [r2]
_08029744:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end atk9D_mimicattackcopy

	thumb_func_start atk9E_metronome
atk9E_metronome: @ 8029754
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r7, _080297D4 @ =gCurrentMove
	movs r6, 0xB1
	lsls r6, 1
	ldr r5, _080297D8 @ =sMovesForbiddenToCopy
	ldr r0, _080297DC @ =gBattlescriptCurrInstr
	mov r8, r0
_08029766:
	bl Random
	ldr r2, _080297E0 @ =0x000001ff
	adds r1, r2, 0
	ands r0, r1
	adds r0, 0x1
	strh r0, [r7]
	cmp r0, r6
	bhi _08029766
	movs r0, 0x3
_0802977A:
	subs r0, 0x1
	cmp r0, 0
	bge _0802977A
	ldr r4, _080297D4 @ =gCurrentMove
	ldrh r2, [r4]
	ldr r3, _080297E4 @ =0x0000ffff
	subs r0, r5, 0x2
_08029788:
	adds r0, 0x2
	ldrh r1, [r0]
	cmp r1, r2
	beq _08029794
	cmp r1, r3
	bne _08029788
_08029794:
	ldr r0, _080297E4 @ =0x0000ffff
	cmp r1, r0
	bne _08029766
	ldr r2, _080297E8 @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _080297EC @ =0xfffffbff
	ands r0, r1
	str r0, [r2]
	ldr r3, _080297F0 @ =gBattleScriptsForMoveEffects
	ldr r2, _080297F4 @ =gBattleMoves
	ldrh r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	mov r1, r8
	str r0, [r1]
	ldrh r0, [r4]
	movs r1, 0
	bl GetMoveTarget
	ldr r1, _080297F8 @ =gBattlerTarget
	strb r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080297D4: .4byte gCurrentMove
_080297D8: .4byte sMovesForbiddenToCopy
_080297DC: .4byte gBattlescriptCurrInstr
_080297E0: .4byte 0x000001ff
_080297E4: .4byte 0x0000ffff
_080297E8: .4byte gHitMarker
_080297EC: .4byte 0xfffffbff
_080297F0: .4byte gBattleScriptsForMoveEffects
_080297F4: .4byte gBattleMoves
_080297F8: .4byte gBattlerTarget
	thumb_func_end atk9E_metronome

	thumb_func_start atk9F_dmgtolevel
atk9F_dmgtolevel: @ 80297FC
	ldr r3, _0802981C @ =gBattleMoveDamage
	ldr r2, _08029820 @ =gBattleMons
	ldr r0, _08029824 @ =gBattlerAttacker
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x2A
	ldrb r0, [r0]
	str r0, [r3]
	ldr r1, _08029828 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_0802981C: .4byte gBattleMoveDamage
_08029820: .4byte gBattleMons
_08029824: .4byte gBattlerAttacker
_08029828: .4byte gBattlescriptCurrInstr
	thumb_func_end atk9F_dmgtolevel

	thumb_func_start atkA0_psywavedamageeffect
atkA0_psywavedamageeffect: @ 802982C
	push {r4,lr}
	movs r4, 0xF
_08029830:
	bl Random
	adds r3, r4, 0
	ands r3, r0
	cmp r3, 0xA
	bgt _08029830
	lsls r0, r3, 2
	adds r0, r3
	lsls r3, r0, 1
	ldr r4, _08029870 @ =gBattleMoveDamage
	ldr r2, _08029874 @ =gBattleMons
	ldr r0, _08029878 @ =gBattlerAttacker
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x2A
	ldrb r1, [r0]
	adds r0, r3, 0
	adds r0, 0x32
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	str r0, [r4]
	ldr r1, _0802987C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08029870: .4byte gBattleMoveDamage
_08029874: .4byte gBattleMons
_08029878: .4byte gBattlerAttacker
_0802987C: .4byte gBattlescriptCurrInstr
	thumb_func_end atkA0_psywavedamageeffect

	thumb_func_start atkA1_counterdamagecalculator
atkA1_counterdamagecalculator: @ 8029880
	push {r4-r6,lr}
	ldr r4, _080298F0 @ =gBattlerAttacker
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _080298F4 @ =gProtectStructs
	ldrb r0, [r4]
	lsls r0, 4
	adds r0, r5
	ldrb r0, [r0, 0xC]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r0, r5, 0x4
	adds r0, r1, r0
	ldr r3, [r0]
	cmp r3, 0
	beq _08029934
	cmp r6, r2
	beq _08029934
	ldr r6, _080298F8 @ =gBattleMons
	adds r0, r1, r5
	ldrb r0, [r0, 0xC]
	movs r4, 0x58
	muls r0, r4
	adds r0, r6
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08029934
	ldr r1, _080298FC @ =gBattleMoveDamage
	lsls r0, r3, 1
	str r0, [r1]
	ldr r1, _08029900 @ =gSideTimers
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r1
	ldrb r0, [r1, 0x8]
	cmp r0, 0
	beq _08029908
	ldrb r1, [r1, 0x9]
	adds r0, r1, 0
	muls r0, r4
	adds r0, r6
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08029908
	ldr r0, _08029904 @ =gBattlerTarget
	strb r1, [r0]
	b _08029918
	.align 2, 0
_080298F0: .4byte gBattlerAttacker
_080298F4: .4byte gProtectStructs
_080298F8: .4byte gBattleMons
_080298FC: .4byte gBattleMoveDamage
_08029900: .4byte gSideTimers
_08029904: .4byte gBattlerTarget
_08029908:
	ldr r2, _08029924 @ =gBattlerTarget
	ldr r1, _08029928 @ =gProtectStructs
	ldr r0, _0802992C @ =gBattlerAttacker
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0xC]
	strb r0, [r2]
_08029918:
	ldr r1, _08029930 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08029964
	.align 2, 0
_08029924: .4byte gBattlerTarget
_08029928: .4byte gProtectStructs
_0802992C: .4byte gBattlerAttacker
_08029930: .4byte gBattlescriptCurrInstr
_08029934:
	ldr r2, _0802996C @ =gSpecialStatuses
	ldr r0, _08029970 @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
	ldr r3, _08029974 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_08029964:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802996C: .4byte gSpecialStatuses
_08029970: .4byte gBattlerAttacker
_08029974: .4byte gBattlescriptCurrInstr
	thumb_func_end atkA1_counterdamagecalculator

	thumb_func_start atkA2_mirrorcoatdamagecalculator
atkA2_mirrorcoatdamagecalculator: @ 8029978
	push {r4-r6,lr}
	ldr r4, _080299E8 @ =gBattlerAttacker
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _080299EC @ =gProtectStructs
	ldrb r0, [r4]
	lsls r0, 4
	adds r0, r5
	ldrb r0, [r0, 0xD]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r0, r5, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r3, [r0]
	cmp r3, 0
	beq _08029A2C
	cmp r6, r2
	beq _08029A2C
	ldr r6, _080299F0 @ =gBattleMons
	adds r0, r1, r5
	ldrb r0, [r0, 0xD]
	movs r4, 0x58
	muls r0, r4
	adds r0, r6
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08029A2C
	ldr r1, _080299F4 @ =gBattleMoveDamage
	lsls r0, r3, 1
	str r0, [r1]
	ldr r1, _080299F8 @ =gSideTimers
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r1
	ldrb r0, [r1, 0x8]
	cmp r0, 0
	beq _08029A00
	ldrb r1, [r1, 0x9]
	adds r0, r1, 0
	muls r0, r4
	adds r0, r6
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08029A00
	ldr r0, _080299FC @ =gBattlerTarget
	strb r1, [r0]
	b _08029A10
	.align 2, 0
_080299E8: .4byte gBattlerAttacker
_080299EC: .4byte gProtectStructs
_080299F0: .4byte gBattleMons
_080299F4: .4byte gBattleMoveDamage
_080299F8: .4byte gSideTimers
_080299FC: .4byte gBattlerTarget
_08029A00:
	ldr r2, _08029A1C @ =gBattlerTarget
	ldr r1, _08029A20 @ =gProtectStructs
	ldr r0, _08029A24 @ =gBattlerAttacker
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0xD]
	strb r0, [r2]
_08029A10:
	ldr r1, _08029A28 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08029A5C
	.align 2, 0
_08029A1C: .4byte gBattlerTarget
_08029A20: .4byte gProtectStructs
_08029A24: .4byte gBattlerAttacker
_08029A28: .4byte gBattlescriptCurrInstr
_08029A2C:
	ldr r2, _08029A64 @ =gSpecialStatuses
	ldr r0, _08029A68 @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
	ldr r3, _08029A6C @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_08029A5C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08029A64: .4byte gSpecialStatuses
_08029A68: .4byte gBattlerAttacker
_08029A6C: .4byte gBattlescriptCurrInstr
	thumb_func_end atkA2_mirrorcoatdamagecalculator

	thumb_func_start atkA3_disablelastusedattack
atkA3_disablelastusedattack: @ 8029A70
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r4, 0
	ldr r2, _08029B70 @ =gBattleMons
	ldr r3, _08029B74 @ =gBattlerTarget
	ldrb r1, [r3]
	movs r0, 0x58
	muls r0, r1
	adds r7, r2, 0
	adds r7, 0xC
	adds r0, r7
	ldr r5, _08029B78 @ =gLastMoves
	lsls r1, 1
	adds r1, r5
	ldrh r0, [r0]
	mov r9, r2
	adds r6, r3, 0
	ldr r2, _08029B7C @ =gDisableStructs
	mov r8, r2
	ldrh r1, [r1]
	cmp r0, r1
	beq _08029AC4
	mov r12, r6
	movs r3, 0x58
_08029AA4:
	adds r4, 0x1
	cmp r4, 0x3
	bgt _08029AC4
	lsls r2, r4, 1
	mov r0, r12
	ldrb r1, [r0]
	adds r0, r1, 0
	muls r0, r3
	adds r2, r0
	adds r2, r7
	lsls r1, 1
	adds r1, r5
	ldrh r0, [r2]
	ldrh r1, [r1]
	cmp r0, r1
	bne _08029AA4
_08029AC4:
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r8
	ldrh r0, [r0, 0x4]
	cmp r0, 0
	bne _08029B88
	cmp r4, 0x4
	beq _08029B88
	movs r5, 0x58
	adds r0, r1, 0
	muls r0, r5
	adds r0, r4, r0
	mov r1, r9
	adds r1, 0x24
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08029B88
	ldr r1, _08029B80 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	lsls r2, r4, 1
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r2, r0
	mov r3, r9
	adds r3, 0xC
	adds r0, r3
	ldrh r0, [r0]
	strb r0, [r1, 0x2]
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r2, r0
	adds r0, r3
	ldrh r0, [r0]
	lsrs r0, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r8
	muls r1, r5
	adds r2, r1
	adds r2, r3
	ldrh r1, [r2]
	strh r1, [r0, 0x4]
	bl Random
	ldrb r2, [r6]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	add r1, r8
	movs r2, 0x3
	ands r2, r0
	adds r2, 0x2
	ldrb r3, [r1, 0xB]
	movs r0, 0x10
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0xB]
	ldrb r0, [r6]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	add r1, r8
	ldrb r3, [r1, 0xB]
	lsls r2, r3, 28
	lsrs r2, 24
	movs r0, 0xF
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0xB]
	ldr r1, _08029B84 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08029BA2
	.align 2, 0
_08029B70: .4byte gBattleMons
_08029B74: .4byte gBattlerTarget
_08029B78: .4byte gLastMoves
_08029B7C: .4byte gDisableStructs
_08029B80: .4byte gBattleTextBuff1
_08029B84: .4byte gBattlescriptCurrInstr
_08029B88:
	ldr r3, _08029BB0 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_08029BA2:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08029BB0: .4byte gBattlescriptCurrInstr
	thumb_func_end atkA3_disablelastusedattack

	thumb_func_start atkA4_trysetencore
atkA4_trysetencore: @ 8029BB4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r5, 0
	ldr r3, _08029CA8 @ =gBattleMons
	ldr r4, _08029CAC @ =gBattlerTarget
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	adds r6, r3, 0
	adds r6, 0xC
	adds r0, r6
	ldr r2, _08029CB0 @ =gLastMoves
	lsls r1, 1
	adds r1, r2
	ldrh r0, [r0]
	mov r10, r3
	mov r8, r2
	ldr r2, _08029CB4 @ =gDisableStructs
	mov r9, r2
	ldrh r1, [r1]
	cmp r0, r1
	beq _08029C0E
	mov r12, r4
	adds r7, r6, 0
	mov r6, r8
	movs r3, 0x58
_08029BEE:
	adds r5, 0x1
	cmp r5, 0x3
	bgt _08029C0E
	lsls r2, r5, 1
	mov r0, r12
	ldrb r1, [r0]
	adds r0, r1, 0
	muls r0, r3
	adds r2, r0
	adds r2, r7
	lsls r1, 1
	adds r1, r6
	ldrh r0, [r2]
	ldrh r1, [r1]
	cmp r0, r1
	bne _08029BEE
_08029C0E:
	ldrb r0, [r4]
	lsls r0, 1
	add r0, r8
	ldrh r2, [r0]
	cmp r2, 0xA5
	beq _08029C22
	cmp r2, 0xE3
	beq _08029C22
	cmp r2, 0x77
	bne _08029C24
_08029C22:
	movs r5, 0x4
_08029C24:
	ldrb r1, [r4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	mov r2, r9
	adds r3, r0, r2
	ldrh r0, [r3, 0x6]
	cmp r0, 0
	bne _08029CBC
	cmp r5, 0x4
	beq _08029CBC
	movs r0, 0x58
	adds r2, r1, 0
	muls r2, r0
	adds r0, r5, r2
	mov r1, r10
	adds r1, 0x24
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08029CBC
	lsls r0, r5, 1
	adds r0, r2
	subs r1, 0x18
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r3, 0x6]
	ldrb r1, [r4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	strb r5, [r0, 0xC]
	bl Random
	ldrb r2, [r4]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	add r1, r9
	movs r2, 0x3
	ands r2, r0
	adds r2, 0x3
	ldrb r3, [r1, 0xE]
	movs r0, 0x10
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0xE]
	ldrb r0, [r4]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	add r1, r9
	ldrb r3, [r1, 0xE]
	lsls r2, r3, 28
	lsrs r2, 24
	movs r0, 0xF
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0xE]
	ldr r1, _08029CB8 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08029CD6
	.align 2, 0
_08029CA8: .4byte gBattleMons
_08029CAC: .4byte gBattlerTarget
_08029CB0: .4byte gLastMoves
_08029CB4: .4byte gDisableStructs
_08029CB8: .4byte gBattlescriptCurrInstr
_08029CBC:
	ldr r3, _08029CE4 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_08029CD6:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08029CE4: .4byte gBattlescriptCurrInstr
	thumb_func_end atkA4_trysetencore

	thumb_func_start atkA5_painsplitdmgcalc
atkA5_painsplitdmgcalc: @ 8029CE8
	push {r4-r7,lr}
	ldr r6, _08029D68 @ =gBattleMons
	ldr r0, _08029D6C @ =gBattlerTarget
	mov r12, r0
	ldrb r0, [r0]
	movs r7, 0x58
	adds r2, r0, 0
	muls r2, r7
	adds r0, r6, 0
	adds r0, 0x50
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 17
	ands r0, r1
	cmp r0, 0
	bne _08029D88
	ldr r5, _08029D70 @ =gBattlerAttacker
	ldrb r0, [r5]
	muls r0, r7
	adds r0, r6
	ldrh r3, [r0, 0x28]
	adds r0, r2, r6
	ldrh r1, [r0, 0x28]
	adds r3, r1
	asrs r3, 1
	ldr r4, _08029D74 @ =gBattleMoveDamage
	subs r1, r3
	str r1, [r4]
	ldr r2, _08029D78 @ =gBattleScripting
	strb r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	asrs r0, 8
	strb r0, [r2, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	asrs r0, 16
	strb r0, [r2, 0x2]
	lsrs r1, 24
	strb r1, [r2, 0x3]
	ldrb r0, [r5]
	muls r0, r7
	adds r0, r6
	ldrh r0, [r0, 0x28]
	subs r0, r3
	str r0, [r4]
	ldr r2, _08029D7C @ =gSpecialStatuses
	mov r0, r12
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, 0x4
	adds r0, r2
	ldr r1, _08029D80 @ =0x0000ffff
	str r1, [r0]
	ldr r1, _08029D84 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08029DA2
	.align 2, 0
_08029D68: .4byte gBattleMons
_08029D6C: .4byte gBattlerTarget
_08029D70: .4byte gBattlerAttacker
_08029D74: .4byte gBattleMoveDamage
_08029D78: .4byte gBattleScripting
_08029D7C: .4byte gSpecialStatuses
_08029D80: .4byte 0x0000ffff
_08029D84: .4byte gBattlescriptCurrInstr
_08029D88:
	ldr r3, _08029DA8 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_08029DA2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08029DA8: .4byte gBattlescriptCurrInstr
	thumb_func_end atkA5_painsplitdmgcalc

	thumb_func_start atkA6_settypetorandomresistance
atkA6_settypetorandomresistance: @ 8029DAC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r1, _08029E14 @ =gLastLandedMoves
	ldr r4, _08029E18 @ =gBattlerAttacker
	ldrb r0, [r4]
	lsls r0, 1
	adds r2, r0, r1
	ldrh r1, [r2]
	cmp r1, 0
	beq _08029DF6
	ldr r0, _08029E1C @ =0x0000ffff
	cmp r1, r0
	beq _08029DF6
	ldrh r0, [r2]
	bl IsTwoTurnsMove
	lsls r0, 24
	cmp r0, 0
	beq _08029E94
	ldr r1, _08029E20 @ =gBattleMons
	ldr r2, _08029E24 @ =gLastHitBy
	ldrb r0, [r4]
	adds r0, r2
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 5
	ands r0, r1
	cmp r0, 0
	beq _08029E94
_08029DF6:
	ldr r3, _08029E28 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08029F80
	.align 2, 0
_08029E14: .4byte gLastLandedMoves
_08029E18: .4byte gBattlerAttacker
_08029E1C: .4byte 0x0000ffff
_08029E20: .4byte gBattleMons
_08029E24: .4byte gLastHitBy
_08029E28: .4byte gBattlescriptCurrInstr
_08029E2C:
	mov r0, r12
	strb r5, [r0]
	mov r1, r10
	ldrb r0, [r1]
	muls r0, r2
	adds r0, r7
	adds r0, 0x22
	strb r5, [r0]
	ldr r1, _08029E50 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x3
	strb r0, [r1, 0x1]
	strb r5, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r1, _08029E54 @ =gBattlescriptCurrInstr
	b _08029E82
	.align 2, 0
_08029E50: .4byte gBattleTextBuff1
_08029E54: .4byte gBattlescriptCurrInstr
_08029E58:
	mov r0, r8
	adds r0, 0x1
	adds r0, r3
	ldrb r2, [r0]
	strb r2, [r4]
	mov r4, r10
	ldrb r0, [r4]
	muls r0, r6
	ldr r7, _08029E8C @ =gBattleMons
	adds r0, r7
	adds r0, 0x22
	strb r2, [r0]
	ldr r1, _08029E90 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x3
	strb r0, [r1, 0x1]
	strb r2, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	mov r1, r12
_08029E82:
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08029F80
	.align 2, 0
_08029E8C: .4byte gBattleMons
_08029E90: .4byte gBattleTextBuff1
_08029E94:
	movs r4, 0
	mov r8, r4
	movs r7, 0x7F
	mov r9, r7
_08029E9C:
	bl Random
	mov r4, r9
	ands r4, r0
	cmp r4, 0x70
	bhi _08029E9C
	lsls r0, r4, 1
	adds r4, r0, r4
	ldr r6, _08029F90 @ =gTypeEffectiveness
	adds r3, r4, r6
	ldr r1, _08029F94 @ =gLastHitByType
	ldr r2, _08029F98 @ =gBattlerAttacker
	ldrb r5, [r2]
	lsls r0, r5, 1
	adds r0, r1
	ldrb r1, [r3]
	mov r10, r2
	ldrh r0, [r0]
	cmp r1, r0
	bne _08029EF8
	adds r0, r4, 0x2
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _08029EF8
	ldr r7, _08029F9C @ =gBattleMons
	movs r2, 0x58
	adds r0, r5, 0
	muls r0, r2
	adds r3, r0, r7
	movs r0, 0x21
	adds r0, r3
	mov r12, r0
	adds r0, r4, 0x1
	adds r0, r6
	ldrb r5, [r0]
	mov r1, r12
	ldrb r0, [r1]
	adds r1, r5, 0
	cmp r0, r1
	beq _08029EF8
	adds r0, r3, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, r1
	bne _08029E2C
_08029EF8:
	movs r7, 0x1
	add r8, r7
	ldr r0, _08029FA0 @ =0x000003e7
	cmp r8, r0
	ble _08029E9C
	movs r0, 0
	mov r8, r0
	ldr r1, _08029FA4 @ =gBattlescriptCurrInstr
	mov r12, r1
	ldr r3, _08029F90 @ =gTypeEffectiveness
	adds r0, r4, 0x1
	adds r0, r3
	mov r9, r0
	adds r5, r3, 0
_08029F14:
	ldrb r1, [r5]
	cmp r1, 0xFF
	bgt _08029F1E
	cmp r1, 0xFE
	bge _08029F58
_08029F1E:
	mov r4, r10
	ldrb r2, [r4]
	lsls r0, r2, 1
	ldr r7, _08029F94 @ =gLastHitByType
	adds r0, r7
	ldrh r0, [r0]
	cmp r1, r0
	bne _08029F58
	ldrb r0, [r5, 0x2]
	cmp r0, 0x5
	bhi _08029F58
	movs r6, 0x58
	adds r0, r2, 0
	muls r0, r6
	ldr r1, _08029F9C @ =gBattleMons
	adds r2, r0, r1
	adds r4, r2, 0
	adds r4, 0x21
	ldrb r0, [r4]
	mov r7, r9
	ldrb r1, [r7]
	cmp r0, r1
	beq _08029F58
	adds r0, r2, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, r1
	beq _08029F58
	b _08029E58
_08029F58:
	adds r5, 0x3
	movs r0, 0x3
	add r8, r0
	ldr r0, _08029FA8 @ =0x0000014f
	cmp r8, r0
	bls _08029F14
	mov r1, r12
	ldr r2, [r1]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	mov r4, r12
	str r1, [r4]
_08029F80:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08029F90: .4byte gTypeEffectiveness
_08029F94: .4byte gLastHitByType
_08029F98: .4byte gBattlerAttacker
_08029F9C: .4byte gBattleMons
_08029FA0: .4byte 0x000003e7
_08029FA4: .4byte gBattlescriptCurrInstr
_08029FA8: .4byte 0x0000014f
	thumb_func_end atkA6_settypetorandomresistance

	thumb_func_start atkA7_setalwayshitflag
atkA7_setalwayshitflag: @ 8029FAC
	push {r4,lr}
	ldr r4, _08029FF0 @ =gStatuses3
	ldr r3, _08029FF4 @ =gBattlerTarget
	ldrb r1, [r3]
	lsls r1, 2
	adds r1, r4
	ldr r0, [r1]
	movs r2, 0x19
	negs r2, r2
	ands r0, r2
	str r0, [r1]
	ldrb r1, [r3]
	lsls r1, 2
	adds r1, r4
	ldr r0, [r1]
	movs r2, 0x10
	orrs r0, r2
	str r0, [r1]
	ldr r2, _08029FF8 @ =gDisableStructs
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _08029FFC @ =gBattlerAttacker
	ldrb r1, [r1]
	strb r1, [r0, 0x15]
	ldr r1, _0802A000 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08029FF0: .4byte gStatuses3
_08029FF4: .4byte gBattlerTarget
_08029FF8: .4byte gDisableStructs
_08029FFC: .4byte gBattlerAttacker
_0802A000: .4byte gBattlescriptCurrInstr
	thumb_func_end atkA7_setalwayshitflag

	thumb_func_start atkA8_copymovepermanently
atkA8_copymovepermanently: @ 802A004
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	ldr r0, _0802A164 @ =gChosenMove
	ldr r1, _0802A168 @ =0x0000ffff
	adds r5, r1, 0
	strh r5, [r0]
	ldr r3, _0802A16C @ =gBattleMons
	ldr r2, _0802A170 @ =gBattlerAttacker
	ldrb r1, [r2]
	movs r0, 0x58
	adds r4, r1, 0
	muls r4, r0
	adds r0, r3, 0
	adds r0, 0x50
	adds r0, r4, r0
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 14
	ands r1, r0
	mov r12, r3
	mov r10, r2
	cmp r1, 0
	beq _0802A03C
	b _0802A190
_0802A03C:
	ldr r0, _0802A174 @ =gLastPrintedMoves
	ldr r2, _0802A178 @ =gBattlerTarget
	ldrb r1, [r2]
	lsls r1, 1
	adds r1, r0
	ldrh r1, [r1]
	mov r9, r0
	mov r8, r2
	cmp r1, 0xA5
	bne _0802A052
	b _0802A190
_0802A052:
	cmp r1, 0
	bne _0802A058
	b _0802A190
_0802A058:
	cmp r1, r5
	bne _0802A05E
	b _0802A190
_0802A05E:
	cmp r1, 0xA6
	bne _0802A064
	b _0802A190
_0802A064:
	movs r7, 0
	mov r5, r9
	mov r0, r12
	adds r0, 0xC
	adds r1, r4, r0
	mov r3, r8
_0802A070:
	ldrh r2, [r1]
	cmp r2, 0xA6
	beq _0802A082
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	cmp r2, r0
	beq _0802A08A
_0802A082:
	adds r1, 0x2
	adds r7, 0x1
	cmp r7, 0x3
	ble _0802A070
_0802A08A:
	cmp r7, 0x4
	beq _0802A090
	b _0802A190
_0802A090:
	ldr r4, _0802A17C @ =gCurrMovePos
	ldrb r1, [r4]
	lsls r1, 1
	mov r2, r10
	ldrb r0, [r2]
	movs r3, 0x58
	muls r0, r3
	adds r1, r0
	mov r6, r12
	adds r6, 0xC
	adds r1, r6
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 1
	add r0, r9
	ldrh r0, [r0]
	strh r0, [r1]
	mov r1, r10
	ldrb r0, [r1]
	adds r2, r0, 0
	muls r2, r3
	ldrb r4, [r4]
	adds r2, r4
	mov r5, r12
	adds r5, 0x24
	adds r2, r5
	ldr r4, _0802A180 @ =gBattleMoves
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, 1
	add r0, r9
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x4]
	strb r0, [r2]
	ldr r1, _0802A184 @ =gActiveBattler
	mov r2, r10
	ldrb r0, [r2]
	strb r0, [r1]
	movs r7, 0
	ldrb r0, [r2]
	muls r0, r3
	adds r4, r0, r5
	adds r3, r0, 0
	add r2, sp, 0x4
	add r5, sp, 0xC
_0802A0F2:
	adds r0, r3, r6
	ldrh r0, [r0]
	strh r0, [r2]
	adds r1, r5, r7
	ldrb r0, [r4]
	strb r0, [r1]
	adds r4, 0x1
	adds r3, 0x2
	adds r2, 0x2
	adds r7, 0x1
	cmp r7, 0x3
	ble _0802A0F2
	add r2, sp, 0x4
	mov r0, r10
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	add r0, r12
	adds r0, 0x3B
	ldrb r0, [r0]
	strb r0, [r2, 0xC]
	str r2, [sp]
	movs r0, 0
	movs r1, 0x3
	movs r2, 0
	movs r3, 0x10
	bl BtlController_EmitSetMonData
	ldr r0, _0802A184 @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBattlerForControllerExec
	ldr r1, _0802A188 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	ldr r3, _0802A174 @ =gLastPrintedMoves
	ldr r2, _0802A178 @ =gBattlerTarget
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strb r0, [r1, 0x2]
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	lsrs r0, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _0802A18C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802A1AA
	.align 2, 0
_0802A164: .4byte gChosenMove
_0802A168: .4byte 0x0000ffff
_0802A16C: .4byte gBattleMons
_0802A170: .4byte gBattlerAttacker
_0802A174: .4byte gLastPrintedMoves
_0802A178: .4byte gBattlerTarget
_0802A17C: .4byte gCurrMovePos
_0802A180: .4byte gBattleMoves
_0802A184: .4byte gActiveBattler
_0802A188: .4byte gBattleTextBuff1
_0802A18C: .4byte gBattlescriptCurrInstr
_0802A190:
	ldr r3, _0802A1BC @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802A1AA:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A1BC: .4byte gBattlescriptCurrInstr
	thumb_func_end atkA8_copymovepermanently

	thumb_func_start IsTwoTurnsMove
IsTwoTurnsMove: @ 802A1C0
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _0802A1F0 @ =gBattleMoves
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1]
	cmp r0, 0x91
	beq _0802A1EA
	cmp r0, 0x27
	beq _0802A1EA
	cmp r0, 0x4B
	beq _0802A1EA
	cmp r0, 0x97
	beq _0802A1EA
	cmp r0, 0x9B
	beq _0802A1EA
	cmp r0, 0x1A
	bne _0802A1F4
_0802A1EA:
	movs r0, 0x1
	b _0802A1F6
	.align 2, 0
_0802A1F0: .4byte gBattleMoves
_0802A1F4:
	movs r0, 0
_0802A1F6:
	pop {r1}
	bx r1
	thumb_func_end IsTwoTurnsMove

	thumb_func_start IsInvalidForSleepTalkOrAssist
IsInvalidForSleepTalkOrAssist: @ 802A1FC
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0802A21A
	cmp r1, 0xD6
	beq _0802A21A
	movs r0, 0x89
	lsls r0, 1
	cmp r1, r0
	beq _0802A21A
	cmp r1, 0x77
	beq _0802A21A
	cmp r1, 0x76
	bne _0802A21E
_0802A21A:
	movs r0, 0x1
	b _0802A220
_0802A21E:
	movs r0, 0
_0802A220:
	pop {r1}
	bx r1
	thumb_func_end IsInvalidForSleepTalkOrAssist

	thumb_func_start AttacksThisTurn
AttacksThisTurn: @ 802A224
	push {lr}
	lsls r1, 16
	lsrs r2, r1, 16
	ldr r1, _0802A27C @ =gBattleMoves
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	adds r3, r1, 0
	cmp r0, 0x97
	bne _0802A248
	ldr r0, _0802A280 @ =gBattleWeather
	ldrh r1, [r0]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	bne _0802A288
_0802A248:
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, 0x91
	beq _0802A26A
	cmp r0, 0x27
	beq _0802A26A
	cmp r0, 0x4B
	beq _0802A26A
	cmp r0, 0x97
	beq _0802A26A
	cmp r0, 0x9B
	beq _0802A26A
	cmp r0, 0x1A
	bne _0802A288
_0802A26A:
	ldr r0, _0802A284 @ =gHitMarker
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 20
	ands r0, r1
	cmp r0, 0
	beq _0802A288
	movs r0, 0x1
	b _0802A28A
	.align 2, 0
_0802A27C: .4byte gBattleMoves
_0802A280: .4byte gBattleWeather
_0802A284: .4byte gHitMarker
_0802A288:
	movs r0, 0x2
_0802A28A:
	pop {r1}
	bx r1
	thumb_func_end AttacksThisTurn

	thumb_func_start atkA9_trychoosesleeptalkmove
atkA9_trychoosesleeptalkmove: @ 802A290
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r6, 0
	movs r5, 0
	ldr r0, _0802A320 @ =gBattlerAttacker
	mov r9, r0
	movs r1, 0x58
	mov r8, r1
	ldr r7, _0802A324 @ =gUnknown_2023BF0
	movs r0, 0x84
	lsls r0, 1
	mov r10, r0
_0802A2AE:
	lsls r4, r5, 1
	mov r1, r9
	ldrb r0, [r1]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r4, r0
	adds r0, r7
	ldrh r0, [r0]
	bl IsInvalidForSleepTalkOrAssist
	lsls r0, 24
	cmp r0, 0
	bne _0802A2EE
	mov r1, r9
	ldrb r0, [r1]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r4, r0
	adds r0, r7
	ldrh r1, [r0]
	cmp r1, r10
	beq _0802A2EE
	cmp r1, 0xFD
	beq _0802A2EE
	adds r0, r1, 0
	bl IsTwoTurnsMove
	lsls r0, 24
	cmp r0, 0
	beq _0802A2FC
_0802A2EE:
	ldr r1, _0802A328 @ =gBitTable
	lsls r0, r5, 2
	adds r0, r1
	ldr r0, [r0]
	orrs r6, r0
	lsls r0, r6, 24
	lsrs r6, r0, 24
_0802A2FC:
	adds r5, 0x1
	cmp r5, 0x3
	ble _0802A2AE
	ldr r0, _0802A320 @ =gBattlerAttacker
	ldrb r0, [r0]
	adds r1, r6, 0
	movs r2, 0xFD
	bl CheckMoveLimitations
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xF
	bne _0802A330
	ldr r1, _0802A32C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802A394
	.align 2, 0
_0802A320: .4byte gBattlerAttacker
_0802A324: .4byte gUnknown_2023BF0
_0802A328: .4byte gBitTable
_0802A32C: .4byte gBattlescriptCurrInstr
_0802A330:
	movs r7, 0x3
	ldr r4, _0802A3A4 @ =gBitTable
_0802A334:
	bl Random
	adds r5, r7, 0
	ands r5, r0
	lsls r0, r5, 2
	adds r0, r4
	ldr r0, [r0]
	ands r0, r6
	cmp r0, 0
	bne _0802A334
	ldr r4, _0802A3A8 @ =gCalledMove
	ldr r2, _0802A3AC @ =gBattleMons
	lsls r1, r5, 1
	ldr r0, _0802A3B0 @ =gBattlerAttacker
	ldrb r3, [r0]
	movs r0, 0x58
	muls r0, r3
	adds r1, r0
	adds r2, 0xC
	adds r1, r2
	ldrh r0, [r1]
	strh r0, [r4]
	ldr r0, _0802A3B4 @ =gCurrMovePos
	strb r5, [r0]
	ldr r2, _0802A3B8 @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _0802A3BC @ =0xfffffbff
	ands r0, r1
	str r0, [r2]
	ldrh r0, [r4]
	movs r1, 0
	bl GetMoveTarget
	ldr r1, _0802A3C0 @ =gBattlerTarget
	strb r0, [r1]
	ldr r3, _0802A3C4 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802A394:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A3A4: .4byte gBitTable
_0802A3A8: .4byte gCalledMove
_0802A3AC: .4byte gBattleMons
_0802A3B0: .4byte gBattlerAttacker
_0802A3B4: .4byte gCurrMovePos
_0802A3B8: .4byte gHitMarker
_0802A3BC: .4byte 0xfffffbff
_0802A3C0: .4byte gBattlerTarget
_0802A3C4: .4byte gBattlescriptCurrInstr
	thumb_func_end atkA9_trychoosesleeptalkmove

	thumb_func_start atkAA_setdestinybond
atkAA_setdestinybond: @ 802A3C8
	ldr r1, _0802A3EC @ =gBattleMons
	ldr r0, _0802A3F0 @ =gBattlerAttacker
	ldrb r2, [r0]
	movs r0, 0x58
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 18
	orrs r0, r1
	str r0, [r2]
	ldr r1, _0802A3F4 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_0802A3EC: .4byte gBattleMons
_0802A3F0: .4byte gBattlerAttacker
_0802A3F4: .4byte gBattlescriptCurrInstr
	thumb_func_end atkAA_setdestinybond

	thumb_func_start TrySetDestinyBondToHappen
TrySetDestinyBondToHappen: @ 802A3F8
	push {r4,r5,lr}
	ldr r0, _0802A448 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0802A44C @ =gBattlerTarget
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _0802A450 @ =gBattleMons
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 18
	ands r0, r1
	cmp r0, 0
	beq _0802A442
	cmp r5, r3
	beq _0802A442
	ldr r2, _0802A454 @ =gHitMarker
	ldr r1, [r2]
	movs r0, 0x80
	lsls r0, 17
	ands r0, r1
	cmp r0, 0
	bne _0802A442
	movs r0, 0x40
	orrs r1, r0
	str r1, [r2]
_0802A442:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802A448: .4byte gBattlerAttacker
_0802A44C: .4byte gBattlerTarget
_0802A450: .4byte gBattleMons
_0802A454: .4byte gHitMarker
	thumb_func_end TrySetDestinyBondToHappen

	thumb_func_start atkAB_trysetdestinybondtohappen
atkAB_trysetdestinybondtohappen: @ 802A458
	push {lr}
	bl TrySetDestinyBondToHappen
	ldr r1, _0802A46C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802A46C: .4byte gBattlescriptCurrInstr
	thumb_func_end atkAB_trysetdestinybondtohappen

	thumb_func_start atkAC_remaininghptopower
atkAC_remaininghptopower: @ 802A470
	push {lr}
	ldr r2, _0802A4C4 @ =gBattleMons
	ldr r0, _0802A4C8 @ =gBattlerAttacker
	ldrb r1, [r0]
	movs r0, 0x58
	muls r1, r0
	adds r1, r2
	movs r2, 0x28
	ldrsh r0, [r1, r2]
	movs r2, 0x2C
	ldrsh r1, [r1, r2]
	movs r2, 0x30
	bl GetScaledHPFraction
	lsls r0, 24
	lsrs r1, r0, 24
	movs r3, 0
	ldr r0, _0802A4CC @ =sFlailHpScaleToPowerTable
	ldrb r2, [r0]
	cmp r1, r2
	ble _0802A4AA
	adds r2, r0, 0
_0802A49C:
	adds r3, 0x2
	cmp r3, 0xB
	bgt _0802A4AA
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r1, r0
	bgt _0802A49C
_0802A4AA:
	ldr r2, _0802A4D0 @ =gDynamicBasePower
	ldr r1, _0802A4CC @ =sFlailHpScaleToPowerTable
	adds r0, r3, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r2]
	ldr r1, _0802A4D4 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802A4C4: .4byte gBattleMons
_0802A4C8: .4byte gBattlerAttacker
_0802A4CC: .4byte sFlailHpScaleToPowerTable
_0802A4D0: .4byte gDynamicBasePower
_0802A4D4: .4byte gBattlescriptCurrInstr
	thumb_func_end atkAC_remaininghptopower

	thumb_func_start atkAD_tryspiteppreduce
atkAD_tryspiteppreduce: @ 802A4D8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r4, _0802A658 @ =gLastMoves
	ldr r1, _0802A65C @ =gBattlerTarget
	ldrb r3, [r1]
	lsls r0, r3, 1
	adds r0, r4
	ldrh r2, [r0]
	mov r8, r1
	cmp r2, 0
	bne _0802A4F8
	b _0802A680
_0802A4F8:
	ldr r0, _0802A660 @ =0x0000ffff
	cmp r2, r0
	bne _0802A500
	b _0802A680
_0802A500:
	movs r7, 0
	ldr r0, _0802A664 @ =gBattleMons
	movs r1, 0x58
	muls r1, r3
	adds r3, r0, 0
	adds r3, 0xC
	adds r1, r3
	ldrh r1, [r1]
	cmp r2, r1
	beq _0802A538
	adds r6, r4, 0
	mov r5, r8
	adds r4, r3, 0
	movs r3, 0x58
_0802A51C:
	adds r7, 0x1
	cmp r7, 0x3
	bgt _0802A538
	ldrb r0, [r5]
	lsls r2, r0, 1
	adds r2, r6
	lsls r1, r7, 1
	muls r0, r3
	adds r1, r0
	adds r1, r4
	ldrh r0, [r2]
	ldrh r1, [r1]
	cmp r0, r1
	bne _0802A51C
_0802A538:
	cmp r7, 0x4
	bne _0802A53E
	b _0802A680
_0802A53E:
	mov r4, r8
	ldrb r0, [r4]
	movs r1, 0x58
	mov r9, r1
	mov r3, r9
	muls r3, r0
	adds r0, r3, 0
	adds r0, r7, r0
	ldr r1, _0802A664 @ =gBattleMons
	adds r1, 0x24
	mov r10, r1
	add r0, r10
	ldrb r0, [r0]
	cmp r0, 0x1
	bhi _0802A55E
	b _0802A680
_0802A55E:
	bl Random
	movs r1, 0x3
	ands r1, r0
	adds r6, r1, 0x2
	ldrb r0, [r4]
	mov r3, r9
	muls r3, r0
	adds r0, r3, 0
	adds r0, r7, r0
	add r0, r10
	ldrb r0, [r0]
	cmp r0, r6
	bge _0802A57C
	adds r6, r0, 0
_0802A57C:
	ldr r1, _0802A668 @ =gBattleTextBuff1
	movs r5, 0xFD
	strb r5, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	ldr r2, _0802A658 @ =gLastMoves
	mov r3, r8
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1, 0x2]
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsrs r0, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r4, _0802A66C @ =gBattleTextBuff2
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	strb r5, [r4]
	movs r0, 0x1
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
	strb r0, [r4, 0x3]
	strb r6, [r4, 0x4]
	subs r0, 0x2
	strb r0, [r4, 0x5]
	mov r1, r8
	ldrb r0, [r1]
	mov r1, r9
	muls r1, r0
	adds r1, r7, r1
	add r1, r10
	ldrb r0, [r1]
	subs r0, r6
	strb r0, [r1]
	ldr r4, _0802A670 @ =gActiveBattler
	mov r3, r8
	ldrb r0, [r3]
	strb r0, [r4]
	ldr r1, _0802A674 @ =gDisableStructs
	ldrb r3, [r4]
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _0802A678 @ =gBitTable
	lsls r0, r7, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0802A630
	mov r2, r9
	muls r2, r3
	ldr r0, _0802A664 @ =gBattleMons
	adds r0, 0x50
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _0802A630
	adds r1, r7, 0
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	mov r3, r10
	adds r0, r2, r3
	adds r0, r7
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl BtlController_EmitSetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_0802A630:
	ldr r1, _0802A67C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	ldr r1, _0802A664 @ =gBattleMons
	ldr r0, _0802A65C @ =gBattlerTarget
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r7, r0
	adds r1, 0x24
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0802A69A
	adds r0, r2, 0
	bl CancelMultiTurnMoves
	b _0802A69A
	.align 2, 0
_0802A658: .4byte gLastMoves
_0802A65C: .4byte gBattlerTarget
_0802A660: .4byte 0x0000ffff
_0802A664: .4byte gBattleMons
_0802A668: .4byte gBattleTextBuff1
_0802A66C: .4byte gBattleTextBuff2
_0802A670: .4byte gActiveBattler
_0802A674: .4byte gDisableStructs
_0802A678: .4byte gBitTable
_0802A67C: .4byte gBattlescriptCurrInstr
_0802A680:
	ldr r3, _0802A6AC @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802A69A:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A6AC: .4byte gBattlescriptCurrInstr
	thumb_func_end atkAD_tryspiteppreduce

	thumb_func_start atkAE_healpartystatus
atkAE_healpartystatus: @ 802A6B0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r4, 0
	str r4, [sp, 0x4]
	mov r8, r4
	ldr r0, _0802A720 @ =gCurrentMove
	ldrh r0, [r0]
	cmp r0, 0xD7
	beq _0802A6CC
	b _0802A8B6
_0802A6CC:
	ldr r6, _0802A724 @ =gBattleCommunication
	mov r0, r8
	strb r0, [r6, 0x5]
	ldr r5, _0802A728 @ =gBattlerAttacker
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, 24
	ldr r1, _0802A72C @ =gEnemyParty
	mov r10, r1
	cmp r0, 0
	bne _0802A6E8
	ldr r2, _0802A730 @ =gPlayerParty
	mov r10, r2
_0802A6E8:
	ldr r4, _0802A734 @ =gBattleMons
	ldrb r3, [r5]
	movs r7, 0x58
	adds r2, r3, 0
	muls r2, r7
	adds r0, r2, r4
	adds r1, r0, 0
	adds r1, 0x20
	ldrb r0, [r1]
	cmp r0, 0x2B
	beq _0802A73C
	adds r0, r4, 0
	adds r0, 0x4C
	adds r0, r2, r0
	mov r1, r8
	str r1, [r0]
	ldrb r0, [r5]
	adds r2, r0, 0
	muls r2, r7
	adds r0, r4, 0
	adds r0, 0x50
	adds r2, r0
	ldr r0, [r2]
	ldr r1, _0802A738 @ =0xf7ffffff
	ands r0, r1
	str r0, [r2]
	b _0802A74C
	.align 2, 0
_0802A720: .4byte gCurrentMove
_0802A724: .4byte gBattleCommunication
_0802A728: .4byte gBattlerAttacker
_0802A72C: .4byte gEnemyParty
_0802A730: .4byte gPlayerParty
_0802A734: .4byte gBattleMons
_0802A738: .4byte 0xf7ffffff
_0802A73C:
	ldrb r1, [r1]
	adds r0, r3, 0
	bl RecordAbilityBattle
	ldrb r0, [r6, 0x5]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r6, 0x5]
_0802A74C:
	ldr r7, _0802A7C0 @ =gActiveBattler
	ldr r0, _0802A7C4 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerPosition
	movs r2, 0x2
	mov r9, r2
	mov r1, r9
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerAtPosition
	ldr r1, _0802A7C8 @ =gBattleScripting
	strb r0, [r1, 0x17]
	strb r0, [r7]
	ldr r0, _0802A7CC @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0802A7F2
	ldr r0, _0802A7D0 @ =gAbsentBattlerFlags
	ldrb r2, [r0]
	ldr r1, _0802A7D4 @ =gBitTable
	ldrb r3, [r7]
	lsls r0, r3, 2
	adds r0, r1
	ldr r0, [r0]
	ands r2, r0
	cmp r2, 0
	bne _0802A7F2
	ldr r5, _0802A7D8 @ =gBattleMons
	movs r6, 0x58
	adds r4, r3, 0
	muls r4, r6
	adds r0, r4, r5
	adds r1, r0, 0
	adds r1, 0x20
	ldrb r0, [r1]
	cmp r0, 0x2B
	beq _0802A7E0
	adds r0, r5, 0
	adds r0, 0x4C
	adds r0, r4, r0
	str r2, [r0]
	ldrb r0, [r7]
	adds r2, r0, 0
	muls r2, r6
	adds r0, r5, 0
	adds r0, 0x50
	adds r2, r0
	ldr r0, [r2]
	ldr r1, _0802A7DC @ =0xf7ffffff
	ands r0, r1
	str r0, [r2]
	b _0802A7F2
	.align 2, 0
_0802A7C0: .4byte gActiveBattler
_0802A7C4: .4byte gBattlerAttacker
_0802A7C8: .4byte gBattleScripting
_0802A7CC: .4byte gBattleTypeFlags
_0802A7D0: .4byte gAbsentBattlerFlags
_0802A7D4: .4byte gBitTable
_0802A7D8: .4byte gBattleMons
_0802A7DC: .4byte 0xf7ffffff
_0802A7E0:
	ldrb r1, [r1]
	adds r0, r3, 0
	bl RecordAbilityBattle
	ldr r1, _0802A838 @ =gBattleCommunication
	ldrb r0, [r1, 0x5]
	mov r2, r9
	orrs r0, r2
	strb r0, [r1, 0x5]
_0802A7F2:
	movs r6, 0
	ldr r7, _0802A83C @ =gBattleMons
_0802A7F6:
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	add r4, r10
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x2E
	bl GetMonData
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r5, 0
	beq _0802A8AE
	movs r0, 0xCE
	lsls r0, 1
	cmp r5, r0
	beq _0802A8AE
	ldr r2, _0802A840 @ =gBattlerPartyIndexes
	ldr r0, _0802A844 @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r0, [r0]
	cmp r0, r6
	bne _0802A848
	movs r0, 0x58
	muls r0, r1
	b _0802A878
	.align 2, 0
_0802A838: .4byte gBattleCommunication
_0802A83C: .4byte gBattleMons
_0802A840: .4byte gBattlerPartyIndexes
_0802A844: .4byte gBattlerAttacker
_0802A848:
	ldr r0, _0802A880 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0802A890
	ldr r0, _0802A884 @ =gActiveBattler
	ldrb r3, [r0]
	lsls r0, r3, 1
	adds r0, r2
	ldrh r0, [r0]
	cmp r0, r6
	bne _0802A890
	ldr r0, _0802A888 @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldr r2, _0802A88C @ =gBitTable
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0802A890
	movs r0, 0x58
	muls r0, r3
_0802A878:
	adds r0, r7
	adds r0, 0x20
	ldrb r0, [r0]
	b _0802A89C
	.align 2, 0
_0802A880: .4byte gBattleTypeFlags
_0802A884: .4byte gActiveBattler
_0802A888: .4byte gAbsentBattlerFlags
_0802A88C: .4byte gBitTable
_0802A890:
	adds r0, r5, 0
	adds r1, r4, 0
	bl GetAbilityBySpecies
	lsls r0, 24
	lsrs r0, 24
_0802A89C:
	cmp r0, 0x2B
	beq _0802A8AE
	movs r0, 0x1
	lsls r0, r6
	mov r1, r8
	orrs r1, r0
	lsls r0, r1, 24
	lsrs r0, 24
	mov r8, r0
_0802A8AE:
	adds r6, 0x1
	cmp r6, 0x5
	ble _0802A7F6
	b _0802A934
_0802A8B6:
	ldr r1, _0802A970 @ =gBattleCommunication
	movs r0, 0x4
	strb r0, [r1, 0x5]
	movs r2, 0x3F
	mov r8, r2
	ldr r3, _0802A974 @ =gBattleMons
	ldr r2, _0802A978 @ =gBattlerAttacker
	ldrb r0, [r2]
	movs r5, 0x58
	muls r0, r5
	movs r1, 0x4C
	adds r1, r3
	mov r9, r1
	add r0, r9
	str r4, [r0]
	ldrb r0, [r2]
	adds r1, r0, 0
	muls r1, r5
	adds r7, r3, 0
	adds r7, 0x50
	adds r1, r7
	ldr r0, [r1]
	ldr r6, _0802A97C @ =0xf7ffffff
	ands r0, r6
	str r0, [r1]
	ldrb r0, [r2]
	bl GetBattlerPosition
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerAtPosition
	ldr r4, _0802A980 @ =gActiveBattler
	strb r0, [r4]
	ldr r0, _0802A984 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0802A934
	ldr r0, _0802A988 @ =gAbsentBattlerFlags
	ldrb r2, [r0]
	ldr r1, _0802A98C @ =gBitTable
	ldrb r3, [r4]
	lsls r0, r3, 2
	adds r0, r1
	ldr r0, [r0]
	ands r2, r0
	cmp r2, 0
	bne _0802A934
	adds r0, r3, 0
	muls r0, r5
	add r0, r9
	str r2, [r0]
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r7
	ldr r0, [r1]
	ands r0, r6
	str r0, [r1]
_0802A934:
	mov r2, r8
	cmp r2, 0
	beq _0802A956
	ldr r4, _0802A980 @ =gActiveBattler
	ldr r0, _0802A978 @ =gBattlerAttacker
	ldrb r0, [r0]
	strb r0, [r4]
	add r0, sp, 0x4
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r3, 0x4
	bl BtlController_EmitSetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_0802A956:
	ldr r1, _0802A990 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A970: .4byte gBattleCommunication
_0802A974: .4byte gBattleMons
_0802A978: .4byte gBattlerAttacker
_0802A97C: .4byte 0xf7ffffff
_0802A980: .4byte gActiveBattler
_0802A984: .4byte gBattleTypeFlags
_0802A988: .4byte gAbsentBattlerFlags
_0802A98C: .4byte gBitTable
_0802A990: .4byte gBattlescriptCurrInstr
	thumb_func_end atkAE_healpartystatus

	thumb_func_start atkAF_cursetarget
atkAF_cursetarget: @ 802A994
	push {r4,r5,lr}
	ldr r5, _0802A9D4 @ =gBattleMons
	ldr r0, _0802A9D8 @ =gBattlerTarget
	ldrb r0, [r0]
	movs r4, 0x58
	adds r1, r0, 0
	muls r1, r4
	adds r0, r5, 0
	adds r0, 0x50
	adds r1, r0
	ldr r2, [r1]
	movs r3, 0x80
	lsls r3, 21
	adds r0, r2, 0
	ands r0, r3
	cmp r0, 0
	beq _0802A9E0
	ldr r3, _0802A9DC @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802AA04
	.align 2, 0
_0802A9D4: .4byte gBattleMons
_0802A9D8: .4byte gBattlerTarget
_0802A9DC: .4byte gBattlescriptCurrInstr
_0802A9E0:
	orrs r2, r3
	str r2, [r1]
	ldr r1, _0802AA0C @ =gBattleMoveDamage
	ldr r0, _0802AA10 @ =gBattlerAttacker
	ldrb r0, [r0]
	muls r0, r4
	adds r0, r5
	ldrh r0, [r0, 0x2C]
	lsrs r0, 1
	str r0, [r1]
	cmp r0, 0
	bne _0802A9FC
	movs r0, 0x1
	str r0, [r1]
_0802A9FC:
	ldr r1, _0802AA14 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802AA04:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802AA0C: .4byte gBattleMoveDamage
_0802AA10: .4byte gBattlerAttacker
_0802AA14: .4byte gBattlescriptCurrInstr
	thumb_func_end atkAF_cursetarget

	thumb_func_start atkB0_trysetspikes
atkB0_trysetspikes: @ 802AA18
	push {r4,lr}
	ldr r4, _0802AA6C @ =gBattlerAttacker
	ldrb r0, [r4]
	bl GetBattlerSide
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0802AA70 @ =gSideTimers
	lsls r2, r0, 1
	adds r0, r2, r0
	lsls r0, 2
	adds r3, r0, r1
	ldrb r0, [r3, 0xA]
	cmp r0, 0x3
	bne _0802AA7C
	ldr r2, _0802AA74 @ =gSpecialStatuses
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
	ldr r3, _0802AA78 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802AA96
	.align 2, 0
_0802AA6C: .4byte gBattlerAttacker
_0802AA70: .4byte gSideTimers
_0802AA74: .4byte gSpecialStatuses
_0802AA78: .4byte gBattlescriptCurrInstr
_0802AA7C:
	ldr r1, _0802AA9C @ =gSideStatuses
	adds r1, r2, r1
	ldrh r2, [r1]
	movs r0, 0x10
	orrs r0, r2
	strh r0, [r1]
	ldrb r0, [r3, 0xA]
	adds r0, 0x1
	strb r0, [r3, 0xA]
	ldr r1, _0802AAA0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802AA96:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802AA9C: .4byte gSideStatuses
_0802AAA0: .4byte gBattlescriptCurrInstr
	thumb_func_end atkB0_trysetspikes

	thumb_func_start atkB1_setforesight
atkB1_setforesight: @ 802AAA4
	ldr r1, _0802AAC8 @ =gBattleMons
	ldr r0, _0802AACC @ =gBattlerTarget
	ldrb r2, [r0]
	movs r0, 0x58
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 22
	orrs r0, r1
	str r0, [r2]
	ldr r1, _0802AAD0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_0802AAC8: .4byte gBattleMons
_0802AACC: .4byte gBattlerTarget
_0802AAD0: .4byte gBattlescriptCurrInstr
	thumb_func_end atkB1_setforesight

	thumb_func_start atkB2_trysetperishsong
atkB2_trysetperishsong: @ 802AAD4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r6, 0
	movs r3, 0
	ldr r0, _0802AB18 @ =gBattlersCount
	adds r7, r0, 0
	ldr r0, _0802AB1C @ =gBattlerAttacker
	mov r8, r0
	ldrb r1, [r7]
	cmp r6, r1
	bge _0802AB40
	movs r5, 0x20
	ldr r0, _0802AB20 @ =gBattleMons
	mov r12, r0
	ldr r0, _0802AB24 @ =gDisableStructs
	adds r4, r0, 0
	adds r4, 0xF
	ldr r2, _0802AB28 @ =gStatuses3
_0802AAFC:
	ldr r1, [r2]
	adds r0, r1, 0
	ands r0, r5
	cmp r0, 0
	bne _0802AB14
	movs r0, 0x58
	muls r0, r3
	add r0, r12
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x2B
	bne _0802AB2C
_0802AB14:
	adds r6, 0x1
	b _0802AB34
	.align 2, 0
_0802AB18: .4byte gBattlersCount
_0802AB1C: .4byte gBattlerAttacker
_0802AB20: .4byte gBattleMons
_0802AB24: .4byte gDisableStructs
_0802AB28: .4byte gStatuses3
_0802AB2C:
	orrs r1, r5
	str r1, [r2]
	movs r0, 0x33
	strb r0, [r4]
_0802AB34:
	adds r4, 0x1C
	adds r2, 0x4
	adds r3, 0x1
	ldrb r0, [r7]
	cmp r3, r0
	blt _0802AAFC
_0802AB40:
	mov r1, r8
	ldrb r0, [r1]
	bl PressurePPLoseOnUsingPerishSong
	ldr r0, _0802AB6C @ =gBattlersCount
	ldrb r0, [r0]
	cmp r6, r0
	bne _0802AB74
	ldr r3, _0802AB70 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802AB7C
	.align 2, 0
_0802AB6C: .4byte gBattlersCount
_0802AB70: .4byte gBattlescriptCurrInstr
_0802AB74:
	ldr r1, _0802AB88 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802AB7C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802AB88: .4byte gBattlescriptCurrInstr
	thumb_func_end atkB2_trysetperishsong

	thumb_func_start atkB3_rolloutdamagecalculation
atkB3_rolloutdamagecalculation: @ 802AB8C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _0802ABB0 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0802ABC0
	ldr r0, _0802ABB4 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl CancelMultiTurnMoves
	ldr r1, _0802ABB8 @ =gBattlescriptCurrInstr
	ldr r0, _0802ABBC @ =BattleScript_MoveMissedPause
	str r0, [r1]
	b _0802ACD8
	.align 2, 0
_0802ABB0: .4byte gMoveResultFlags
_0802ABB4: .4byte gBattlerAttacker
_0802ABB8: .4byte gBattlescriptCurrInstr
_0802ABBC: .4byte BattleScript_MoveMissedPause
_0802ABC0:
	ldr r2, _0802ACE4 @ =gBattleMons
	ldr r1, _0802ACE8 @ =gBattlerAttacker
	ldrb r3, [r1]
	movs r5, 0x58
	adds r0, r3, 0
	muls r0, r5
	adds r4, r2, 0
	adds r4, 0x50
	adds r0, r4
	ldr r0, [r0]
	movs r7, 0x80
	lsls r7, 5
	ands r0, r7
	adds r6, r1, 0
	mov r9, r2
	ldr r1, _0802ACEC @ =gDisableStructs
	mov r12, r1
	ldr r2, _0802ACF0 @ =gCurrentMove
	mov r8, r2
	cmp r0, 0
	bne _0802AC32
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	add r0, r12
	ldrb r2, [r0, 0x11]
	movs r1, 0x10
	negs r1, r1
	ands r1, r2
	movs r2, 0x5
	orrs r1, r2
	strb r1, [r0, 0x11]
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r12
	ldrb r2, [r0, 0x11]
	movs r1, 0xF
	ands r1, r2
	movs r2, 0x50
	orrs r1, r2
	strb r1, [r0, 0x11]
	ldrb r0, [r6]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r4
	ldr r0, [r1]
	orrs r0, r7
	str r0, [r1]
	ldr r1, _0802ACF4 @ =gLockedMoves
	ldrb r0, [r6]
	lsls r0, 1
	adds r0, r1
	mov r2, r8
	ldrh r1, [r2]
	strh r1, [r0]
_0802AC32:
	ldrb r0, [r6]
	lsls r2, r0, 3
	subs r2, r0
	lsls r2, 2
	add r2, r12
	ldrb r3, [r2, 0x11]
	lsls r1, r3, 28
	lsrs r1, 28
	subs r1, 0x1
	movs r0, 0xF
	ands r1, r0
	movs r0, 0x10
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x11]
	cmp r1, 0
	bne _0802AC66
	ldrb r0, [r6]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r4
	ldr r0, [r1]
	ldr r2, _0802ACF8 @ =0xffffefff
	ands r0, r2
	str r0, [r1]
_0802AC66:
	ldr r3, _0802ACFC @ =gDynamicBasePower
	ldr r2, _0802AD00 @ =gBattleMoves
	mov r0, r8
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	strh r0, [r3]
	movs r2, 0x1
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	mov r1, r12
	adds r4, r0, r1
	ldrb r0, [r4, 0x11]
	lsls r0, 28
	lsrs r0, 28
	movs r1, 0x5
	subs r1, r0
	ldr r7, _0802AD04 @ =gBattlescriptCurrInstr
	adds r5, r3, 0
	cmp r2, r1
	bge _0802ACB4
	adds r1, r5, 0
	adds r3, r4, 0
	movs r4, 0x5
_0802ACA0:
	ldrh r0, [r1]
	lsls r0, 1
	strh r0, [r1]
	adds r2, 0x1
	ldrb r0, [r3, 0x11]
	lsls r0, 28
	lsrs r0, 28
	subs r0, r4, r0
	cmp r2, r0
	blt _0802ACA0
_0802ACB4:
	ldrb r1, [r6]
	movs r0, 0x58
	muls r0, r1
	mov r1, r9
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 23
	ands r0, r1
	cmp r0, 0
	beq _0802ACD2
	ldrh r0, [r5]
	lsls r0, 1
	strh r0, [r5]
_0802ACD2:
	ldr r0, [r7]
	adds r0, 0x1
	str r0, [r7]
_0802ACD8:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802ACE4: .4byte gBattleMons
_0802ACE8: .4byte gBattlerAttacker
_0802ACEC: .4byte gDisableStructs
_0802ACF0: .4byte gCurrentMove
_0802ACF4: .4byte gLockedMoves
_0802ACF8: .4byte 0xffffefff
_0802ACFC: .4byte gDynamicBasePower
_0802AD00: .4byte gBattleMoves
_0802AD04: .4byte gBattlescriptCurrInstr
	thumb_func_end atkB3_rolloutdamagecalculation

	thumb_func_start atkB4_jumpifconfusedandstatmaxed
atkB4_jumpifconfusedandstatmaxed: @ 802AD08
	push {r4,r5,lr}
	ldr r5, _0802AD58 @ =gBattleMons
	ldr r0, _0802AD5C @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0x58
	adds r3, r1, 0
	muls r3, r0
	adds r0, r5, 0
	adds r0, 0x50
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	ldr r4, _0802AD60 @ =gBattlescriptCurrInstr
	cmp r0, 0
	beq _0802AD64
	ldr r2, [r4]
	ldrb r0, [r2, 0x1]
	adds r0, r3
	adds r1, r5, 0
	adds r1, 0x18
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xC
	bne _0802AD64
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0802AD6A
	.align 2, 0
_0802AD58: .4byte gBattleMons
_0802AD5C: .4byte gBattlerTarget
_0802AD60: .4byte gBattlescriptCurrInstr
_0802AD64:
	ldr r0, [r4]
	adds r0, 0x6
	str r0, [r4]
_0802AD6A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end atkB4_jumpifconfusedandstatmaxed

	thumb_func_start atkB5_furycuttercalc
atkB5_furycuttercalc: @ 802AD70
	push {r4,r5,lr}
	ldr r0, _0802AD98 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0802ADAC
	ldr r2, _0802AD9C @ =gDisableStructs
	ldr r0, _0802ADA0 @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strb r1, [r0, 0x10]
	ldr r1, _0802ADA4 @ =gBattlescriptCurrInstr
	ldr r0, _0802ADA8 @ =BattleScript_MoveMissedPause
	str r0, [r1]
	b _0802AE04
	.align 2, 0
_0802AD98: .4byte gMoveResultFlags
_0802AD9C: .4byte gDisableStructs
_0802ADA0: .4byte gBattlerAttacker
_0802ADA4: .4byte gBattlescriptCurrInstr
_0802ADA8: .4byte BattleScript_MoveMissedPause
_0802ADAC:
	ldr r5, _0802AE0C @ =gDisableStructs
	ldr r4, _0802AE10 @ =gBattlerAttacker
	ldrb r1, [r4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1, 0x10]
	cmp r0, 0x5
	beq _0802ADC4
	adds r0, 0x1
	strb r0, [r1, 0x10]
_0802ADC4:
	ldr r3, _0802AE14 @ =gDynamicBasePower
	ldr r2, _0802AE18 @ =gBattleMoves
	ldr r0, _0802AE1C @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	strh r0, [r3]
	movs r2, 0x1
	ldrb r1, [r4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r4, _0802AE20 @ =gBattlescriptCurrInstr
	ldrb r1, [r0, 0x10]
	cmp r2, r1
	bge _0802ADFE
	adds r1, r3, 0
	adds r3, r0, 0
_0802ADF0:
	ldrh r0, [r1]
	lsls r0, 1
	strh r0, [r1]
	adds r2, 0x1
	ldrb r0, [r3, 0x10]
	cmp r2, r0
	blt _0802ADF0
_0802ADFE:
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
_0802AE04:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802AE0C: .4byte gDisableStructs
_0802AE10: .4byte gBattlerAttacker
_0802AE14: .4byte gDynamicBasePower
_0802AE18: .4byte gBattleMoves
_0802AE1C: .4byte gCurrentMove
_0802AE20: .4byte gBattlescriptCurrInstr
	thumb_func_end atkB5_furycuttercalc

	thumb_func_start atkB6_happinesstodamagecalculation
atkB6_happinesstodamagecalculation: @ 802AE24
	push {r4,lr}
	ldr r2, _0802AE50 @ =gBattleMoves
	ldr r0, _0802AE54 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x79
	bne _0802AE64
	ldr r4, _0802AE58 @ =gDynamicBasePower
	ldr r2, _0802AE5C @ =gBattleMons
	ldr r0, _0802AE60 @ =gBattlerAttacker
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x2B
	ldrb r1, [r0]
	b _0802AE7A
	.align 2, 0
_0802AE50: .4byte gBattleMoves
_0802AE54: .4byte gCurrentMove
_0802AE58: .4byte gDynamicBasePower
_0802AE5C: .4byte gBattleMons
_0802AE60: .4byte gBattlerAttacker
_0802AE64:
	ldr r4, _0802AE98 @ =gDynamicBasePower
	ldr r2, _0802AE9C @ =gBattleMons
	ldr r0, _0802AEA0 @ =gBattlerAttacker
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x2B
	ldrb r0, [r0]
	movs r1, 0xFF
	subs r1, r0
_0802AE7A:
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	movs r1, 0x19
	bl __divsi3
	strh r0, [r4]
	ldr r1, _0802AEA4 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802AE98: .4byte gDynamicBasePower
_0802AE9C: .4byte gBattleMons
_0802AEA0: .4byte gBattlerAttacker
_0802AEA4: .4byte gBattlescriptCurrInstr
	thumb_func_end atkB6_happinesstodamagecalculation

	thumb_func_start atkB7_presentdamagecalculation
atkB7_presentdamagecalculation: @ 802AEA8
	push {r4,lr}
	bl Random
	movs r4, 0xFF
	ands r4, r0
	cmp r4, 0x65
	bgt _0802AEC4
	ldr r1, _0802AEC0 @ =gDynamicBasePower
	movs r0, 0x28
	strh r0, [r1]
	b _0802AF06
	.align 2, 0
_0802AEC0: .4byte gDynamicBasePower
_0802AEC4:
	cmp r4, 0xB1
	bgt _0802AED4
	ldr r1, _0802AED0 @ =gDynamicBasePower
	movs r0, 0x50
	strh r0, [r1]
	b _0802AF06
	.align 2, 0
_0802AED0: .4byte gDynamicBasePower
_0802AED4:
	cmp r4, 0xCB
	bgt _0802AEE4
	ldr r1, _0802AEE0 @ =gDynamicBasePower
	movs r0, 0x78
	strh r0, [r1]
	b _0802AF06
	.align 2, 0
_0802AEE0: .4byte gDynamicBasePower
_0802AEE4:
	ldr r3, _0802AF10 @ =gBattleMoveDamage
	ldr r2, _0802AF14 @ =gBattleMons
	ldr r0, _0802AF18 @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x2C]
	lsrs r0, 2
	str r0, [r3]
	cmp r0, 0
	bne _0802AF00
	movs r0, 0x1
	str r0, [r3]
_0802AF00:
	ldr r0, [r3]
	negs r0, r0
	str r0, [r3]
_0802AF06:
	cmp r4, 0xCB
	bgt _0802AF24
	ldr r1, _0802AF1C @ =gBattlescriptCurrInstr
	ldr r0, _0802AF20 @ =BattleScript_HitFromCritCalc
	b _0802AF5E
	.align 2, 0
_0802AF10: .4byte gBattleMoveDamage
_0802AF14: .4byte gBattleMons
_0802AF18: .4byte gBattlerTarget
_0802AF1C: .4byte gBattlescriptCurrInstr
_0802AF20: .4byte BattleScript_HitFromCritCalc
_0802AF24:
	ldr r2, _0802AF40 @ =gBattleMons
	ldr r0, _0802AF44 @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r1, [r0, 0x2C]
	ldrh r0, [r0, 0x28]
	cmp r1, r0
	bne _0802AF50
	ldr r1, _0802AF48 @ =gBattlescriptCurrInstr
	ldr r0, _0802AF4C @ =BattleScript_AlreadyAtFullHp
	b _0802AF5E
	.align 2, 0
_0802AF40: .4byte gBattleMons
_0802AF44: .4byte gBattlerTarget
_0802AF48: .4byte gBattlescriptCurrInstr
_0802AF4C: .4byte BattleScript_AlreadyAtFullHp
_0802AF50:
	ldr r2, _0802AF68 @ =gMoveResultFlags
	ldrb r1, [r2]
	movs r0, 0xF7
	ands r0, r1
	strb r0, [r2]
	ldr r1, _0802AF6C @ =gBattlescriptCurrInstr
	ldr r0, _0802AF70 @ =BattleScript_PresentHealTarget
_0802AF5E:
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802AF68: .4byte gMoveResultFlags
_0802AF6C: .4byte gBattlescriptCurrInstr
_0802AF70: .4byte BattleScript_PresentHealTarget
	thumb_func_end atkB7_presentdamagecalculation

	thumb_func_start atkB8_setsafeguard
atkB8_setsafeguard: @ 802AF74
	push {r4-r7,lr}
	ldr r7, _0802AFA8 @ =gBattlerAttacker
	ldrb r0, [r7]
	bl GetBattlerPosition
	ldr r4, _0802AFAC @ =gSideStatuses
	movs r6, 0x1
	adds r1, r6, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	ldrh r1, [r1]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0802AFB8
	ldr r2, _0802AFB0 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0802AFB4 @ =gBattleCommunication
	movs r0, 0
	strb r0, [r1, 0x5]
	b _0802B000
	.align 2, 0
_0802AFA8: .4byte gBattlerAttacker
_0802AFAC: .4byte gSideStatuses
_0802AFB0: .4byte gMoveResultFlags
_0802AFB4: .4byte gBattleCommunication
_0802AFB8:
	ldrb r0, [r7]
	bl GetBattlerPosition
	adds r1, r6, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	ldrh r0, [r1]
	movs r2, 0x20
	orrs r0, r2
	strh r0, [r1]
	ldrb r0, [r7]
	bl GetBattlerPosition
	ldr r5, _0802B010 @ =gSideTimers
	adds r1, r6, 0
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r4, 0x5
	strb r4, [r0, 0x6]
	ldrb r0, [r7]
	bl GetBattlerPosition
	adds r1, r6, 0
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r7]
	strb r1, [r0, 0x7]
	ldr r0, _0802B014 @ =gBattleCommunication
	strb r4, [r0, 0x5]
_0802B000:
	ldr r1, _0802B018 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B010: .4byte gSideTimers
_0802B014: .4byte gBattleCommunication
_0802B018: .4byte gBattlescriptCurrInstr
	thumb_func_end atkB8_setsafeguard

	thumb_func_start atkB9_magnitudedamagecalculation
atkB9_magnitudedamagecalculation: @ 802B01C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x4
	bgt _0802B048
	ldr r1, _0802B044 @ =gDynamicBasePower
	movs r0, 0xA
	strh r0, [r1]
	movs r3, 0x4
	b _0802B0B4
	.align 2, 0
_0802B044: .4byte gDynamicBasePower
_0802B048:
	cmp r3, 0xE
	bgt _0802B05C
	ldr r1, _0802B058 @ =gDynamicBasePower
	movs r0, 0x1E
	strh r0, [r1]
	movs r3, 0x5
	b _0802B0B4
	.align 2, 0
_0802B058: .4byte gDynamicBasePower
_0802B05C:
	cmp r3, 0x22
	bgt _0802B070
	ldr r1, _0802B06C @ =gDynamicBasePower
	movs r0, 0x32
	strh r0, [r1]
	movs r3, 0x6
	b _0802B0B4
	.align 2, 0
_0802B06C: .4byte gDynamicBasePower
_0802B070:
	cmp r3, 0x40
	bgt _0802B084
	ldr r1, _0802B080 @ =gDynamicBasePower
	movs r0, 0x46
	strh r0, [r1]
	movs r3, 0x7
	b _0802B0B4
	.align 2, 0
_0802B080: .4byte gDynamicBasePower
_0802B084:
	cmp r3, 0x54
	bgt _0802B098
	ldr r1, _0802B094 @ =gDynamicBasePower
	movs r0, 0x5A
	strh r0, [r1]
	movs r3, 0x8
	b _0802B0B4
	.align 2, 0
_0802B094: .4byte gDynamicBasePower
_0802B098:
	cmp r3, 0x5E
	bgt _0802B0AC
	ldr r1, _0802B0A8 @ =gDynamicBasePower
	movs r0, 0x6E
	strh r0, [r1]
	movs r3, 0x9
	b _0802B0B4
	.align 2, 0
_0802B0A8: .4byte gDynamicBasePower
_0802B0AC:
	ldr r1, _0802B120 @ =gDynamicBasePower
	movs r0, 0x96
	strh r0, [r1]
	movs r3, 0xA
_0802B0B4:
	ldr r1, _0802B124 @ =gBattleTextBuff1
	movs r2, 0
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	strb r0, [r1, 0x2]
	movs r0, 0x2
	strb r0, [r1, 0x3]
	strb r3, [r1, 0x4]
	movs r0, 0xFF
	strb r0, [r1, 0x5]
	ldr r1, _0802B128 @ =gBattlerTarget
	strb r2, [r1]
	ldr r0, _0802B12C @ =gBattlersCount
	ldrb r3, [r0]
	adds r6, r1, 0
	ldr r0, _0802B130 @ =gBattlescriptCurrInstr
	mov r8, r0
	cmp r2, r3
	bcs _0802B10C
	adds r4, r6, 0
	ldr r0, _0802B134 @ =gBattlerAttacker
	ldrb r5, [r0]
	ldr r1, _0802B138 @ =gBitTable
	mov r12, r1
	ldr r7, _0802B13C @ =gAbsentBattlerFlags
_0802B0EA:
	ldrb r2, [r4]
	cmp r2, r5
	beq _0802B100
	ldrb r0, [r7]
	ldrb r1, [r6]
	lsls r1, 2
	add r1, r12
	ldr r1, [r1]
	ands r0, r1
	cmp r0, 0
	beq _0802B10C
_0802B100:
	adds r0, r2, 0x1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r3
	bcc _0802B0EA
_0802B10C:
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B120: .4byte gDynamicBasePower
_0802B124: .4byte gBattleTextBuff1
_0802B128: .4byte gBattlerTarget
_0802B12C: .4byte gBattlersCount
_0802B130: .4byte gBattlescriptCurrInstr
_0802B134: .4byte gBattlerAttacker
_0802B138: .4byte gBitTable
_0802B13C: .4byte gAbsentBattlerFlags
	thumb_func_end atkB9_magnitudedamagecalculation

	thumb_func_start atkBA_jumpifnopursuitswitchdmg
atkBA_jumpifnopursuitswitchdmg: @ 802B140
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _0802B164 @ =gMultiHitCounter
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0802B170
	ldr r0, _0802B168 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _0802B16C
	movs r0, 0x1
	b _0802B18A
	.align 2, 0
_0802B164: .4byte gMultiHitCounter
_0802B168: .4byte gBattlerAttacker
_0802B16C:
	movs r0, 0
	b _0802B18A
_0802B170:
	ldr r0, _0802B184 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _0802B188
	movs r0, 0x3
	b _0802B18A
	.align 2, 0
_0802B184: .4byte gBattlerAttacker
_0802B188:
	movs r0, 0x2
_0802B18A:
	bl GetBattlerAtPosition
	ldr r1, _0802B264 @ =gBattlerTarget
	strb r0, [r1]
	ldr r0, _0802B268 @ =gChosenActionByBattler
	ldr r1, _0802B264 @ =gBattlerTarget
	ldrb r3, [r1]
	adds r0, r3, r0
	ldrb r0, [r0]
	cmp r0, 0
	beq _0802B1A2
	b _0802B2A8
_0802B1A2:
	ldr r5, _0802B26C @ =gBattlerAttacker
	ldr r0, _0802B270 @ =gBattleStruct
	ldr r1, [r0]
	adds r1, r3, r1
	ldrb r2, [r5]
	ldrb r1, [r1, 0xC]
	cmp r2, r1
	bne _0802B2A8
	ldr r4, _0802B274 @ =gBattleMons
	movs r2, 0x58
	adds r0, r3, 0
	muls r0, r2
	adds r1, r4, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x27
	ands r0, r1
	cmp r0, 0
	bne _0802B2A8
	ldrb r0, [r5]
	muls r0, r2
	adds r0, r4
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0802B2A8
	ldr r0, _0802B278 @ =gDisableStructs
	lsls r1, r3, 3
	subs r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x18]
	lsls r0, 31
	cmp r0, 0
	bne _0802B2A8
	ldr r0, _0802B27C @ =gChosenMoveByBattler
	lsls r1, r3, 1
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0xE4
	bne _0802B2A8
	movs r1, 0
	ldr r0, _0802B280 @ =gBattlersCount
	ldr r2, _0802B284 @ =gCurrentMove
	mov r8, r2
	ldr r7, _0802B288 @ =gCurrMovePos
	mov r10, r7
	ldr r2, _0802B28C @ =gChosenMovePos
	mov r9, r2
	ldr r7, _0802B290 @ =gHitMarker
	mov r12, r7
	ldrb r2, [r0]
	cmp r1, r2
	bge _0802B22E
	ldr r6, _0802B294 @ =gBattlerByTurnOrder
	ldr r5, _0802B264 @ =gBattlerTarget
	ldr r4, _0802B298 @ =gActionsByTurnOrder
	movs r3, 0xB
	adds r2, r0, 0
_0802B218:
	adds r0, r1, r6
	ldrb r0, [r0]
	ldrb r7, [r5]
	cmp r0, r7
	bne _0802B226
	adds r0, r1, r4
	strb r3, [r0]
_0802B226:
	adds r1, 0x1
	ldrb r0, [r2]
	cmp r1, r0
	blt _0802B218
_0802B22E:
	movs r0, 0xE4
	mov r1, r8
	strh r0, [r1]
	ldr r2, _0802B264 @ =gBattlerTarget
	ldrb r0, [r2]
	ldr r7, _0802B270 @ =gBattleStruct
	ldr r1, [r7]
	adds r0, r1
	adds r0, 0x80
	ldrb r0, [r0]
	mov r1, r9
	strb r0, [r1]
	mov r2, r10
	strb r0, [r2]
	ldr r7, _0802B29C @ =gBattlescriptCurrInstr
	ldr r0, [r7]
	adds r0, 0x5
	str r0, [r7]
	movs r0, 0x1
	ldr r1, _0802B2A0 @ =gBattleScripting
	strb r0, [r1, 0x18]
	mov r2, r12
	ldr r0, [r2]
	ldr r1, _0802B2A4 @ =0xfffffbff
	ands r0, r1
	str r0, [r2]
	b _0802B2C2
	.align 2, 0
_0802B264: .4byte gBattlerTarget
_0802B268: .4byte gChosenActionByBattler
_0802B26C: .4byte gBattlerAttacker
_0802B270: .4byte gBattleStruct
_0802B274: .4byte gBattleMons
_0802B278: .4byte gDisableStructs
_0802B27C: .4byte gChosenMoveByBattler
_0802B280: .4byte gBattlersCount
_0802B284: .4byte gCurrentMove
_0802B288: .4byte gCurrMovePos
_0802B28C: .4byte gChosenMovePos
_0802B290: .4byte gHitMarker
_0802B294: .4byte gBattlerByTurnOrder
_0802B298: .4byte gActionsByTurnOrder
_0802B29C: .4byte gBattlescriptCurrInstr
_0802B2A0: .4byte gBattleScripting
_0802B2A4: .4byte 0xfffffbff
_0802B2A8:
	ldr r3, _0802B2D0 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802B2C2:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B2D0: .4byte gBattlescriptCurrInstr
	thumb_func_end atkBA_jumpifnopursuitswitchdmg

	thumb_func_start atkBB_setsunny
atkBB_setsunny: @ 802B2D4
	push {lr}
	ldr r2, _0802B2F4 @ =gBattleWeather
	ldrh r1, [r2]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _0802B300
	ldr r2, _0802B2F8 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0802B2FC @ =gBattleCommunication
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _0802B312
	.align 2, 0
_0802B2F4: .4byte gBattleWeather
_0802B2F8: .4byte gMoveResultFlags
_0802B2FC: .4byte gBattleCommunication
_0802B300:
	movs r0, 0x20
	strh r0, [r2]
	ldr r1, _0802B320 @ =gBattleCommunication
	movs r0, 0x4
	strb r0, [r1, 0x5]
	ldr r0, _0802B324 @ =gWishFutureKnock
	adds r0, 0x28
	movs r1, 0x5
	strb r1, [r0]
_0802B312:
	ldr r1, _0802B328 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802B320: .4byte gBattleCommunication
_0802B324: .4byte gWishFutureKnock
_0802B328: .4byte gBattlescriptCurrInstr
	thumb_func_end atkBB_setsunny

	thumb_func_start atkBC_maxattackhalvehp
atkBC_maxattackhalvehp: @ 802B32C
	push {r4,r5,lr}
	ldr r5, _0802B378 @ =gBattleMons
	ldr r4, _0802B37C @ =gBattlerAttacker
	ldrb r0, [r4]
	movs r3, 0x58
	muls r0, r3
	adds r2, r0, r5
	ldrh r0, [r2, 0x2C]
	lsrs r1, r0, 1
	cmp r1, 0
	bne _0802B344
	movs r1, 0x1
_0802B344:
	movs r0, 0x19
	ldrsb r0, [r2, r0]
	cmp r0, 0xB
	bgt _0802B388
	ldrh r0, [r2, 0x28]
	cmp r0, r1
	bls _0802B388
	movs r0, 0xC
	strb r0, [r2, 0x19]
	ldr r1, _0802B380 @ =gBattleMoveDamage
	ldrb r0, [r4]
	muls r0, r3
	adds r0, r5
	ldrh r0, [r0, 0x2C]
	lsrs r0, 1
	str r0, [r1]
	cmp r0, 0
	bne _0802B36C
	movs r0, 0x1
	str r0, [r1]
_0802B36C:
	ldr r1, _0802B384 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802B3A2
	.align 2, 0
_0802B378: .4byte gBattleMons
_0802B37C: .4byte gBattlerAttacker
_0802B380: .4byte gBattleMoveDamage
_0802B384: .4byte gBattlescriptCurrInstr
_0802B388:
	ldr r3, _0802B3A8 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802B3A2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802B3A8: .4byte gBattlescriptCurrInstr
	thumb_func_end atkBC_maxattackhalvehp

	thumb_func_start atkBD_copyfoestats
atkBD_copyfoestats: @ 802B3AC
	push {r4-r7,lr}
	movs r2, 0
	ldr r7, _0802B3E4 @ =gBattlescriptCurrInstr
	ldr r6, _0802B3E8 @ =gBattlerAttacker
	movs r4, 0x58
	ldr r3, _0802B3EC @ =gUnknown_2023BFC
	ldr r5, _0802B3F0 @ =gBattlerTarget
_0802B3BA:
	ldrb r0, [r6]
	adds r1, r0, 0
	muls r1, r4
	adds r1, r2, r1
	adds r1, r3
	ldrb r0, [r5]
	muls r0, r4
	adds r0, r2, r0
	adds r0, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, 0x1
	cmp r2, 0x7
	ble _0802B3BA
	ldr r0, [r7]
	adds r0, 0x5
	str r0, [r7]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B3E4: .4byte gBattlescriptCurrInstr
_0802B3E8: .4byte gBattlerAttacker
_0802B3EC: .4byte gUnknown_2023BFC
_0802B3F0: .4byte gBattlerTarget
	thumb_func_end atkBD_copyfoestats

	thumb_func_start atkBE_rapidspinfree
atkBE_rapidspinfree: @ 802B3F4
	push {r4-r6,lr}
	ldr r1, _0802B464 @ =gBattleMons
	ldr r5, _0802B468 @ =gBattlerAttacker
	ldrb r2, [r5]
	movs r6, 0x58
	adds r0, r2, 0
	muls r0, r6
	adds r4, r1, 0
	adds r4, 0x50
	adds r0, r4
	ldr r0, [r0]
	movs r1, 0xE0
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _0802B488
	ldr r1, _0802B46C @ =gBattleScripting
	ldr r3, _0802B470 @ =gBattlerTarget
	ldrb r0, [r3]
	strb r0, [r1, 0x17]
	ldrb r0, [r5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r4
	ldr r0, [r1]
	ldr r2, _0802B474 @ =0xffff1fff
	ands r0, r2
	str r0, [r1]
	ldrb r0, [r5]
	ldr r1, _0802B478 @ =gBattleStruct
	ldr r2, [r1]
	adds r0, r2
	ldrb r0, [r0, 0x14]
	strb r0, [r3]
	ldr r1, _0802B47C @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r2
	ldrb r0, [r0, 0x4]
	strb r0, [r1, 0x2]
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r2
	ldrb r0, [r0, 0x5]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	bl BattleScriptPushCursor
	ldr r1, _0802B480 @ =gBattlescriptCurrInstr
	ldr r0, _0802B484 @ =BattleScript_WrapFree
	b _0802B532
	.align 2, 0
_0802B464: .4byte gBattleMons
_0802B468: .4byte gBattlerAttacker
_0802B46C: .4byte gBattleScripting
_0802B470: .4byte gBattlerTarget
_0802B474: .4byte 0xffff1fff
_0802B478: .4byte gBattleStruct
_0802B47C: .4byte gBattleTextBuff1
_0802B480: .4byte gBattlescriptCurrInstr
_0802B484: .4byte BattleScript_WrapFree
_0802B488:
	ldr r4, _0802B4BC @ =gStatuses3
	lsls r0, r2, 2
	adds r3, r0, r4
	ldr r1, [r3]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0802B4C8
	movs r0, 0x5
	negs r0, r0
	ands r1, r0
	str r1, [r3]
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r4
	ldr r0, [r1]
	movs r2, 0x4
	negs r2, r2
	ands r0, r2
	str r0, [r1]
	bl BattleScriptPushCursor
	ldr r1, _0802B4C0 @ =gBattlescriptCurrInstr
	ldr r0, _0802B4C4 @ =BattleScript_LeechSeedFree
	b _0802B532
	.align 2, 0
_0802B4BC: .4byte gStatuses3
_0802B4C0: .4byte gBattlescriptCurrInstr
_0802B4C4: .4byte BattleScript_LeechSeedFree
_0802B4C8:
	adds r0, r2, 0
	bl GetBattlerSide
	ldr r4, _0802B518 @ =gSideStatuses
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	ldrh r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0802B52C
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	ldrh r2, [r0]
	ldr r1, _0802B51C @ =0x0000ffef
	ands r1, r2
	movs r4, 0
	strh r1, [r0]
	ldrb r0, [r5]
	bl GetBattlerSide
	ldr r2, _0802B520 @ =gSideTimers
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	strb r4, [r1, 0xA]
	bl BattleScriptPushCursor
	ldr r1, _0802B524 @ =gBattlescriptCurrInstr
	ldr r0, _0802B528 @ =BattleScript_SpikesFree
	b _0802B532
	.align 2, 0
_0802B518: .4byte gSideStatuses
_0802B51C: .4byte 0x0000ffef
_0802B520: .4byte gSideTimers
_0802B524: .4byte gBattlescriptCurrInstr
_0802B528: .4byte BattleScript_SpikesFree
_0802B52C:
	ldr r1, _0802B53C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
_0802B532:
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802B53C: .4byte gBattlescriptCurrInstr
	thumb_func_end atkBE_rapidspinfree

	thumb_func_start atkBF_setdefensecurlbit
atkBF_setdefensecurlbit: @ 802B540
	ldr r1, _0802B564 @ =gBattleMons
	ldr r0, _0802B568 @ =gBattlerAttacker
	ldrb r2, [r0]
	movs r0, 0x58
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 23
	orrs r0, r1
	str r0, [r2]
	ldr r1, _0802B56C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_0802B564: .4byte gBattleMons
_0802B568: .4byte gBattlerAttacker
_0802B56C: .4byte gBattlescriptCurrInstr
	thumb_func_end atkBF_setdefensecurlbit

	thumb_func_start atkC0_recoverbasedonsunlight
atkC0_recoverbasedonsunlight: @ 802B570
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r1, _0802B5DC @ =gBattlerTarget
	ldr r5, _0802B5E0 @ =gBattlerAttacker
	ldrb r0, [r5]
	strb r0, [r1]
	ldr r7, _0802B5E4 @ =gBattleMons
	ldrb r0, [r5]
	movs r6, 0x58
	muls r0, r6
	adds r0, r7
	ldrh r1, [r0, 0x28]
	ldrh r0, [r0, 0x2C]
	cmp r1, r0
	beq _0802B650
	ldr r4, _0802B5E8 @ =gBattleWeather
	ldrh r0, [r4]
	cmp r0, 0
	beq _0802B5C2
	movs r0, 0
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0802B5C2
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	beq _0802B5F0
_0802B5C2:
	ldr r3, _0802B5EC @ =gBattleMoveDamage
	ldr r2, _0802B5E4 @ =gBattleMons
	ldr r0, _0802B5E0 @ =gBattlerAttacker
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x2C]
	lsrs r0, 1
	str r0, [r3]
	adds r1, r3, 0
	b _0802B62A
	.align 2, 0
_0802B5DC: .4byte gBattlerTarget
_0802B5E0: .4byte gBattlerAttacker
_0802B5E4: .4byte gBattleMons
_0802B5E8: .4byte gBattleWeather
_0802B5EC: .4byte gBattleMoveDamage
_0802B5F0:
	ldrh r1, [r4]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _0802B61C
	ldr r4, _0802B618 @ =gBattleMoveDamage
	ldrb r0, [r5]
	muls r0, r6
	adds r0, r7
	ldrh r1, [r0, 0x2C]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	movs r1, 0x1E
	bl __divsi3
	str r0, [r4]
	adds r1, r4, 0
	b _0802B62A
	.align 2, 0
_0802B618: .4byte gBattleMoveDamage
_0802B61C:
	ldr r1, _0802B648 @ =gBattleMoveDamage
	ldrb r0, [r5]
	muls r0, r6
	adds r0, r7
	ldrh r0, [r0, 0x2C]
	lsrs r0, 2
	str r0, [r1]
_0802B62A:
	adds r2, r1, 0
	ldr r0, [r2]
	cmp r0, 0
	bne _0802B636
	movs r0, 0x1
	str r0, [r2]
_0802B636:
	ldr r0, [r1]
	negs r0, r0
	str r0, [r1]
	ldr r1, _0802B64C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802B66A
	.align 2, 0
_0802B648: .4byte gBattleMoveDamage
_0802B64C: .4byte gBattlescriptCurrInstr
_0802B650:
	ldr r3, _0802B674 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802B66A:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B674: .4byte gBattlescriptCurrInstr
	thumb_func_end atkC0_recoverbasedonsunlight

	thumb_func_start atkC1_hiddenpowercalc
atkC1_hiddenpowercalc: @ 802B678
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r2, _0802B760 @ =gBattleMons
	ldr r0, _0802B764 @ =gBattlerAttacker
	ldrb r1, [r0]
	movs r0, 0x58
	muls r1, r0
	adds r1, r2
	ldrb r0, [r1, 0x14]
	mov r9, r0
	mov r7, r9
	lsls r7, 27
	adds r0, r7, 0
	lsrs r0, 27
	mov r9, r0
	movs r4, 0x2
	mov r2, r9
	ands r2, r4
	asrs r2, 1
	ldrh r7, [r1, 0x14]
	mov r8, r7
	mov r0, r8
	lsls r0, 22
	lsrs r0, 27
	mov r8, r0
	ands r0, r4
	orrs r2, r0
	ldrb r6, [r1, 0x15]
	lsls r6, 25
	lsrs r6, 27
	adds r0, r6, 0
	ands r0, r4
	lsls r0, 1
	orrs r2, r0
	ldr r5, [r1, 0x14]
	lsls r5, 12
	lsrs r5, 27
	adds r0, r5, 0
	ands r0, r4
	lsls r0, 2
	orrs r2, r0
	ldrh r3, [r1, 0x16]
	lsls r3, 23
	lsrs r3, 27
	adds r0, r3, 0
	ands r0, r4
	lsls r0, 3
	orrs r2, r0
	ldrb r1, [r1, 0x17]
	lsls r1, 26
	lsrs r1, 27
	adds r0, r1, 0
	ands r0, r4
	lsls r0, 4
	orrs r2, r0
	movs r0, 0x1
	adds r4, r0, 0
	mov r7, r9
	ands r4, r7
	mov r7, r8
	ands r7, r0
	lsls r7, 1
	orrs r4, r7
	ands r6, r0
	lsls r6, 2
	orrs r4, r6
	ands r5, r0
	lsls r5, 3
	orrs r4, r5
	ands r3, r0
	lsls r3, 4
	orrs r4, r3
	ands r1, r0
	lsls r1, 5
	orrs r4, r1
	ldr r5, _0802B768 @ =gDynamicBasePower
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	movs r1, 0x3F
	bl __divsi3
	adds r0, 0x1E
	strh r0, [r5]
	ldr r6, _0802B76C @ =gBattleStruct
	ldr r5, [r6]
	lsls r0, r4, 4
	subs r0, r4
	movs r1, 0x3F
	bl __divsi3
	adds r0, 0x1
	strb r0, [r5, 0x13]
	ldr r1, [r6]
	ldrb r0, [r1, 0x13]
	cmp r0, 0x8
	bls _0802B742
	adds r0, 0x1
	strb r0, [r1, 0x13]
_0802B742:
	ldr r2, [r6]
	ldrb r0, [r2, 0x13]
	movs r1, 0xC0
	orrs r0, r1
	strb r0, [r2, 0x13]
	ldr r1, _0802B770 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B760: .4byte gBattleMons
_0802B764: .4byte gBattlerAttacker
_0802B768: .4byte gDynamicBasePower
_0802B76C: .4byte gBattleStruct
_0802B770: .4byte gBattlescriptCurrInstr
	thumb_func_end atkC1_hiddenpowercalc

	thumb_func_start atkC2_selectfirstvalidtarget
atkC2_selectfirstvalidtarget: @ 802B774
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _0802B7D0 @ =gBattlerTarget
	movs r1, 0
	strb r1, [r0]
	ldr r1, _0802B7D4 @ =gBattlersCount
	ldrb r1, [r1]
	adds r6, r0, 0
	ldr r0, _0802B7D8 @ =gBattlescriptCurrInstr
	mov r8, r0
	cmp r1, 0
	beq _0802B7BE
	adds r3, r6, 0
	ldr r0, _0802B7DC @ =gBattlerAttacker
	ldrb r5, [r0]
	ldr r0, _0802B7E0 @ =gBitTable
	mov r12, r0
	adds r4, r1, 0
	ldr r7, _0802B7E4 @ =gAbsentBattlerFlags
_0802B79C:
	ldrb r2, [r3]
	cmp r2, r5
	beq _0802B7B2
	ldrb r0, [r7]
	ldrb r1, [r6]
	lsls r1, 2
	add r1, r12
	ldr r1, [r1]
	ands r0, r1
	cmp r0, 0
	beq _0802B7BE
_0802B7B2:
	adds r0, r2, 0x1
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r4
	bcc _0802B79C
_0802B7BE:
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B7D0: .4byte gBattlerTarget
_0802B7D4: .4byte gBattlersCount
_0802B7D8: .4byte gBattlescriptCurrInstr
_0802B7DC: .4byte gBattlerAttacker
_0802B7E0: .4byte gBitTable
_0802B7E4: .4byte gAbsentBattlerFlags
	thumb_func_end atkC2_selectfirstvalidtarget

	thumb_func_start atkC3_trysetfutureattack
atkC3_trysetfutureattack: @ 802B7E8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	ldr r0, _0802B820 @ =gWishFutureKnock
	mov r8, r0
	ldr r7, _0802B824 @ =gBattlerTarget
	ldrb r1, [r7]
	adds r0, r1, r0
	ldrb r6, [r0]
	cmp r6, 0
	beq _0802B82C
	ldr r3, _0802B828 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802B8F6
	.align 2, 0
_0802B820: .4byte gWishFutureKnock
_0802B824: .4byte gBattlerTarget
_0802B828: .4byte gBattlescriptCurrInstr
_0802B82C:
	lsls r1, 1
	mov r0, r8
	adds r0, 0x18
	adds r1, r0
	ldr r2, _0802B8CC @ =gCurrentMove
	mov r9, r2
	ldrh r0, [r2]
	strh r0, [r1]
	mov r0, r8
	adds r0, 0x4
	ldrb r4, [r7]
	adds r0, r4
	ldr r5, _0802B8D0 @ =gBattlerAttacker
	ldrb r1, [r5]
	strb r1, [r0]
	ldrb r0, [r7]
	add r0, r8
	movs r1, 0x3
	strb r1, [r0]
	ldr r4, _0802B8D4 @ =gSideStatuses
	ldrb r0, [r7]
	bl GetBattlerPosition
	movs r1, 0x1
	mov r10, r1
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	ldrh r3, [r1]
	ldrb r0, [r5]
	movs r4, 0x58
	muls r0, r4
	ldr r2, _0802B8D8 @ =gBattleMons
	adds r0, r2
	ldrb r1, [r7]
	muls r1, r4
	adds r1, r2
	mov r4, r9
	ldrh r2, [r4]
	str r6, [sp]
	str r6, [sp, 0x4]
	ldrb r4, [r5]
	str r4, [sp, 0x8]
	ldrb r4, [r7]
	str r4, [sp, 0xC]
	bl CalculateBaseDamage
	ldrb r1, [r7]
	lsls r1, 2
	mov r2, r8
	adds r2, 0x8
	adds r1, r2
	str r0, [r1]
	ldr r1, _0802B8DC @ =gProtectStructs
	ldrb r0, [r5]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 28
	cmp r0, 0
	bge _0802B8BA
	ldrb r4, [r7]
	lsls r4, 2
	adds r4, r2
	ldr r1, [r4]
	lsls r0, r1, 4
	subs r0, r1
	movs r1, 0xA
	bl __divsi3
	str r0, [r4]
_0802B8BA:
	mov r0, r9
	ldrh r1, [r0]
	ldr r0, _0802B8E0 @ =0x00000161
	cmp r1, r0
	bne _0802B8E8
	ldr r0, _0802B8E4 @ =gBattleCommunication
	mov r1, r10
	strb r1, [r0, 0x5]
	b _0802B8EE
	.align 2, 0
_0802B8CC: .4byte gCurrentMove
_0802B8D0: .4byte gBattlerAttacker
_0802B8D4: .4byte gSideStatuses
_0802B8D8: .4byte gBattleMons
_0802B8DC: .4byte gProtectStructs
_0802B8E0: .4byte 0x00000161
_0802B8E4: .4byte gBattleCommunication
_0802B8E8:
	ldr r1, _0802B908 @ =gBattleCommunication
	movs r0, 0
	strb r0, [r1, 0x5]
_0802B8EE:
	ldr r1, _0802B90C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802B8F6:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B908: .4byte gBattleCommunication
_0802B90C: .4byte gBattlescriptCurrInstr
	thumb_func_end atkC3_trysetfutureattack

	thumb_func_start atkC4_trydobeatup
atkC4_trydobeatup: @ 802B910
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _0802B954 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	ldr r7, _0802B958 @ =gEnemyParty
	cmp r0, 0
	bne _0802B92A
	ldr r7, _0802B95C @ =gPlayerParty
_0802B92A:
	ldr r2, _0802B960 @ =gBattleMons
	ldr r0, _0802B964 @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _0802B96C
	ldr r3, _0802B968 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	b _0802BB08
	.align 2, 0
_0802B954: .4byte gBattlerAttacker
_0802B958: .4byte gEnemyParty
_0802B95C: .4byte gPlayerParty
_0802B960: .4byte gBattleMons
_0802B964: .4byte gBattlerTarget
_0802B968: .4byte gBattlescriptCurrInstr
_0802B96C:
	ldr r6, _0802BAA8 @ =gBattleCommunication
	ldrb r0, [r6]
	mov r8, r0
	cmp r0, 0x5
	bls _0802B978
	b _0802BAD4
_0802B978:
	adds r4, r6, 0
	movs r5, 0x64
_0802B97C:
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r7, r0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0802B9C0
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r7, r0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _0802B9C0
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r7, r0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0802B9C0
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r7, r0
	movs r1, 0x37
	bl GetMonData
	cmp r0, 0
	beq _0802B9D0
_0802B9C0:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	adds r6, r4, 0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bls _0802B97C
_0802B9D0:
	ldr r1, _0802BAA8 @ =gBattleCommunication
	mov r9, r1
	ldrb r2, [r1]
	cmp r2, 0x5
	bhi _0802BAD4
	ldr r1, _0802BAAC @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x1]
	ldr r6, _0802BAB0 @ =gBattlerAttacker
	ldrb r0, [r6]
	strb r0, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _0802BAB4 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x9
	str r0, [r1]
	ldr r2, _0802BAB8 @ =gBattleMoveDamage
	mov r8, r2
	ldr r5, _0802BABC @ =gBaseStats
	mov r1, r9
	ldrb r0, [r1]
	movs r4, 0x64
	muls r0, r4
	adds r0, r7, r0
	movs r1, 0xB
	bl GetMonData
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r3, [r1, 0x1]
	mov r2, r8
	str r3, [r2]
	ldr r2, _0802BAC0 @ =gBattleMoves
	ldr r0, _0802BAC4 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	muls r0, r3
	mov r1, r8
	str r0, [r1]
	mov r2, r9
	ldrb r0, [r2]
	muls r0, r4
	adds r0, r7, r0
	movs r1, 0x38
	bl GetMonData
	lsls r0, 1
	movs r1, 0x5
	bl __udivsi3
	adds r0, 0x2
	mov r2, r8
	ldr r1, [r2]
	muls r0, r1
	str r0, [r2]
	ldr r3, _0802BAC8 @ =gBattleMons
	ldr r1, _0802BACC @ =gBattlerTarget
	ldrb r2, [r1]
	movs r1, 0x58
	muls r1, r2
	adds r1, r3
	ldrh r2, [r1]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r5
	ldrb r1, [r1, 0x2]
	bl __divsi3
	mov r1, r8
	str r0, [r1]
	movs r1, 0x32
	bl __divsi3
	adds r2, r0, 0x2
	mov r0, r8
	str r2, [r0]
	ldr r1, _0802BAD0 @ =gProtectStructs
	ldrb r0, [r6]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 28
	cmp r0, 0
	bge _0802BA9C
	lsls r0, r2, 4
	subs r0, r2
	movs r1, 0xA
	bl __divsi3
	mov r1, r8
	str r0, [r1]
_0802BA9C:
	mov r2, r9
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	b _0802BB0E
	.align 2, 0
_0802BAA8: .4byte gBattleCommunication
_0802BAAC: .4byte gBattleTextBuff1
_0802BAB0: .4byte gBattlerAttacker
_0802BAB4: .4byte gBattlescriptCurrInstr
_0802BAB8: .4byte gBattleMoveDamage
_0802BABC: .4byte gBaseStats
_0802BAC0: .4byte gBattleMoves
_0802BAC4: .4byte gCurrentMove
_0802BAC8: .4byte gBattleMons
_0802BACC: .4byte gBattlerTarget
_0802BAD0: .4byte gProtectStructs
_0802BAD4:
	mov r0, r8
	cmp r0, 0
	beq _0802BAF4
	ldr r3, _0802BAF0 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	b _0802BB08
	.align 2, 0
_0802BAF0: .4byte gBattlescriptCurrInstr
_0802BAF4:
	ldr r3, _0802BB1C @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x8]
_0802BB08:
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802BB0E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802BB1C: .4byte gBattlescriptCurrInstr
	thumb_func_end atkC4_trydobeatup

	thumb_func_start atkC5_setsemiinvulnerablebit
atkC5_setsemiinvulnerablebit: @ 802BB20
	push {lr}
	ldr r0, _0802BB34 @ =gCurrentMove
	ldrh r1, [r0]
	cmp r1, 0x5B
	beq _0802BB60
	cmp r1, 0x5B
	bgt _0802BB38
	cmp r1, 0x13
	beq _0802BB44
	b _0802BB8C
	.align 2, 0
_0802BB34: .4byte gCurrentMove
_0802BB38:
	ldr r0, _0802BB54 @ =0x00000123
	cmp r1, r0
	beq _0802BB78
	adds r0, 0x31
	cmp r1, r0
	bne _0802BB8C
_0802BB44:
	ldr r2, _0802BB58 @ =gStatuses3
	ldr r0, _0802BB5C @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x40
	b _0802BB88
	.align 2, 0
_0802BB54: .4byte 0x00000123
_0802BB58: .4byte gStatuses3
_0802BB5C: .4byte gBattlerAttacker
_0802BB60:
	ldr r2, _0802BB70 @ =gStatuses3
	ldr r0, _0802BB74 @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x80
	b _0802BB88
	.align 2, 0
_0802BB70: .4byte gStatuses3
_0802BB74: .4byte gBattlerAttacker
_0802BB78:
	ldr r2, _0802BB98 @ =gStatuses3
	ldr r0, _0802BB9C @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 11
_0802BB88:
	orrs r0, r2
	str r0, [r1]
_0802BB8C:
	ldr r1, _0802BBA0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802BB98: .4byte gStatuses3
_0802BB9C: .4byte gBattlerAttacker
_0802BBA0: .4byte gBattlescriptCurrInstr
	thumb_func_end atkC5_setsemiinvulnerablebit

	thumb_func_start atkC6_clearsemiinvulnerablebit
atkC6_clearsemiinvulnerablebit: @ 802BBA4
	push {lr}
	ldr r0, _0802BBB8 @ =gCurrentMove
	ldrh r1, [r0]
	cmp r1, 0x5B
	beq _0802BBE8
	cmp r1, 0x5B
	bgt _0802BBBC
	cmp r1, 0x13
	beq _0802BBC8
	b _0802BC16
	.align 2, 0
_0802BBB8: .4byte gCurrentMove
_0802BBBC:
	ldr r0, _0802BBDC @ =0x00000123
	cmp r1, r0
	beq _0802BC04
	adds r0, 0x31
	cmp r1, r0
	bne _0802BC16
_0802BBC8:
	ldr r2, _0802BBE0 @ =gStatuses3
	ldr r0, _0802BBE4 @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x41
	negs r2, r2
	b _0802BC12
	.align 2, 0
_0802BBDC: .4byte 0x00000123
_0802BBE0: .4byte gStatuses3
_0802BBE4: .4byte gBattlerAttacker
_0802BBE8:
	ldr r2, _0802BBFC @ =gStatuses3
	ldr r0, _0802BC00 @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x81
	negs r2, r2
	b _0802BC12
	.align 2, 0
_0802BBFC: .4byte gStatuses3
_0802BC00: .4byte gBattlerAttacker
_0802BC04:
	ldr r2, _0802BC24 @ =gStatuses3
	ldr r0, _0802BC28 @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	ldr r2, _0802BC2C @ =0xfffbffff
_0802BC12:
	ands r0, r2
	str r0, [r1]
_0802BC16:
	ldr r1, _0802BC30 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802BC24: .4byte gStatuses3
_0802BC28: .4byte gBattlerAttacker
_0802BC2C: .4byte 0xfffbffff
_0802BC30: .4byte gBattlescriptCurrInstr
	thumb_func_end atkC6_clearsemiinvulnerablebit

	thumb_func_start atkC7_setminimize
atkC7_setminimize: @ 802BC34
	push {lr}
	ldr r0, _0802BC64 @ =gHitMarker
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 18
	ands r0, r1
	cmp r0, 0
	beq _0802BC58
	ldr r2, _0802BC68 @ =gStatuses3
	ldr r0, _0802BC6C @ =gBattlerAttacker
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 1
	orrs r0, r2
	str r0, [r1]
_0802BC58:
	ldr r1, _0802BC70 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802BC64: .4byte gHitMarker
_0802BC68: .4byte gStatuses3
_0802BC6C: .4byte gBattlerAttacker
_0802BC70: .4byte gBattlescriptCurrInstr
	thumb_func_end atkC7_setminimize

	thumb_func_start atkC8_sethail
atkC8_sethail: @ 802BC74
	push {lr}
	ldr r3, _0802BC98 @ =gBattleWeather
	ldrh r1, [r3]
	movs r2, 0x80
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0802BCA4
	ldr r2, _0802BC9C @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0802BCA0 @ =gBattleCommunication
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _0802BCB2
	.align 2, 0
_0802BC98: .4byte gBattleWeather
_0802BC9C: .4byte gMoveResultFlags
_0802BCA0: .4byte gBattleCommunication
_0802BCA4:
	strh r2, [r3]
	ldr r0, _0802BCC0 @ =gBattleCommunication
	movs r1, 0x5
	strb r1, [r0, 0x5]
	ldr r0, _0802BCC4 @ =gWishFutureKnock
	adds r0, 0x28
	strb r1, [r0]
_0802BCB2:
	ldr r1, _0802BCC8 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802BCC0: .4byte gBattleCommunication
_0802BCC4: .4byte gWishFutureKnock
_0802BCC8: .4byte gBattlescriptCurrInstr
	thumb_func_end atkC8_sethail

	thumb_func_start atkC9_jumpifattackandspecialattackcannotfall
atkC9_jumpifattackandspecialattackcannotfall: @ 802BCCC
	push {r4,lr}
	ldr r2, _0802BD10 @ =gBattleMons
	ldr r0, _0802BD14 @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r1, r0, r2
	movs r0, 0x19
	ldrsb r0, [r1, r0]
	adds r3, r2, 0
	cmp r0, 0
	bne _0802BD20
	movs r0, 0x1C
	ldrsb r0, [r1, r0]
	cmp r0, 0
	bne _0802BD20
	ldr r0, _0802BD18 @ =gBattleCommunication
	ldrb r0, [r0, 0x6]
	cmp r0, 0x1
	beq _0802BD20
	ldr r3, _0802BD1C @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802BD4C
	.align 2, 0
_0802BD10: .4byte gBattleMons
_0802BD14: .4byte gBattlerTarget
_0802BD18: .4byte gBattleCommunication
_0802BD1C: .4byte gBattlescriptCurrInstr
_0802BD20:
	ldr r4, _0802BD54 @ =gActiveBattler
	ldr r0, _0802BD58 @ =gBattlerAttacker
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r2, _0802BD5C @ =gBattleMoveDamage
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	adds r0, r3
	ldrh r0, [r0, 0x28]
	str r0, [r2]
	ldr r1, _0802BD60 @ =0x00007fff
	movs r0, 0
	bl BtlController_EmitHealthBarUpdate
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r1, _0802BD64 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802BD4C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802BD54: .4byte gActiveBattler
_0802BD58: .4byte gBattlerAttacker
_0802BD5C: .4byte gBattleMoveDamage
_0802BD60: .4byte 0x00007fff
_0802BD64: .4byte gBattlescriptCurrInstr
	thumb_func_end atkC9_jumpifattackandspecialattackcannotfall

	thumb_func_start atkCA_setforcedtarget
atkCA_setforcedtarget: @ 802BD68
	push {r4,r5,lr}
	ldr r4, _0802BDA8 @ =gBattlerAttacker
	ldrb r0, [r4]
	bl GetBattlerSide
	ldr r5, _0802BDAC @ =gSideTimers
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	movs r0, 0x1
	strb r0, [r1, 0x8]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r0, [r4]
	strb r0, [r1, 0x9]
	ldr r1, _0802BDB0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802BDA8: .4byte gBattlerAttacker
_0802BDAC: .4byte gSideTimers
_0802BDB0: .4byte gBattlescriptCurrInstr
	thumb_func_end atkCA_setforcedtarget

	thumb_func_start atkCB_setcharge
atkCB_setcharge: @ 802BDB4
	push {r4,lr}
	ldr r0, _0802BE08 @ =gStatuses3
	ldr r3, _0802BE0C @ =gBattlerAttacker
	ldrb r1, [r3]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 2
	orrs r0, r2
	str r0, [r1]
	ldr r4, _0802BE10 @ =gDisableStructs
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r2, [r0, 0x12]
	movs r1, 0x10
	negs r1, r1
	ands r1, r2
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0, 0x12]
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r2, [r0, 0x12]
	movs r1, 0xF
	ands r1, r2
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x12]
	ldr r1, _0802BE14 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802BE08: .4byte gStatuses3
_0802BE0C: .4byte gBattlerAttacker
_0802BE10: .4byte gDisableStructs
_0802BE14: .4byte gBattlescriptCurrInstr
	thumb_func_end atkCB_setcharge

	thumb_func_start atkCC_callterrainattack
atkCC_callterrainattack: @ 802BE18
	push {r4,lr}
	ldr r2, _0802BE68 @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _0802BE6C @ =0xfffffbff
	ands r0, r1
	str r0, [r2]
	ldr r4, _0802BE70 @ =gCurrentMove
	ldr r1, _0802BE74 @ =sNaturePowerMoves
	ldr r0, _0802BE78 @ =gBattleTerrain
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r4]
	ldrh r0, [r4]
	movs r1, 0
	bl GetMoveTarget
	ldr r1, _0802BE7C @ =gBattlerTarget
	strb r0, [r1]
	ldr r3, _0802BE80 @ =gBattleScriptsForMoveEffects
	ldr r2, _0802BE84 @ =gBattleMoves
	ldrh r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	bl BattleScriptPush
	ldr r1, _0802BE88 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802BE68: .4byte gHitMarker
_0802BE6C: .4byte 0xfffffbff
_0802BE70: .4byte gCurrentMove
_0802BE74: .4byte sNaturePowerMoves
_0802BE78: .4byte gBattleTerrain
_0802BE7C: .4byte gBattlerTarget
_0802BE80: .4byte gBattleScriptsForMoveEffects
_0802BE84: .4byte gBattleMoves
_0802BE88: .4byte gBattlescriptCurrInstr
	thumb_func_end atkCC_callterrainattack

	thumb_func_start atkCD_cureifburnedparalysedorpoisoned
atkCD_cureifburnedparalysedorpoisoned: @ 802BE8C
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r1, _0802BED8 @ =gBattleMons
	ldr r3, _0802BEDC @ =gBattlerAttacker
	ldrb r0, [r3]
	movs r6, 0x58
	muls r0, r6
	adds r5, r1, 0
	adds r5, 0x4C
	adds r2, r0, r5
	ldr r0, [r2]
	movs r1, 0xD8
	ands r0, r1
	cmp r0, 0
	beq _0802BEE8
	movs r0, 0
	str r0, [r2]
	ldr r1, _0802BEE0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	ldr r4, _0802BEE4 @ =gActiveBattler
	ldrb r0, [r3]
	strb r0, [r4]
	ldrb r0, [r4]
	muls r0, r6
	adds r0, r5
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl BtlController_EmitSetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	b _0802BF02
	.align 2, 0
_0802BED8: .4byte gBattleMons
_0802BEDC: .4byte gBattlerAttacker
_0802BEE0: .4byte gBattlescriptCurrInstr
_0802BEE4: .4byte gActiveBattler
_0802BEE8:
	ldr r3, _0802BF0C @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802BF02:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802BF0C: .4byte gBattlescriptCurrInstr
	thumb_func_end atkCD_cureifburnedparalysedorpoisoned

	thumb_func_start atkCE_settorment
atkCE_settorment: @ 802BF10
	push {lr}
	ldr r1, _0802BF48 @ =gBattleMons
	ldr r0, _0802BF4C @ =gBattlerTarget
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r1, [r0]
	movs r2, 0x80
	lsls r2, 24
	cmp r1, 0
	bge _0802BF54
	ldr r3, _0802BF50 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802BF60
	.align 2, 0
_0802BF48: .4byte gBattleMons
_0802BF4C: .4byte gBattlerTarget
_0802BF50: .4byte gBattlescriptCurrInstr
_0802BF54:
	orrs r1, r2
	str r1, [r0]
	ldr r1, _0802BF64 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802BF60:
	pop {r0}
	bx r0
	.align 2, 0
_0802BF64: .4byte gBattlescriptCurrInstr
	thumb_func_end atkCE_settorment

	thumb_func_start atkCF_jumpifnodamage
atkCF_jumpifnodamage: @ 802BF68
	push {lr}
	ldr r2, _0802BF94 @ =gProtectStructs
	ldr r0, _0802BF98 @ =gBattlerAttacker
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r0, r2, 0x4
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0802BF88
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0802BFA0
_0802BF88:
	ldr r1, _0802BF9C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802BFBA
	.align 2, 0
_0802BF94: .4byte gProtectStructs
_0802BF98: .4byte gBattlerAttacker
_0802BF9C: .4byte gBattlescriptCurrInstr
_0802BFA0:
	ldr r3, _0802BFC0 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802BFBA:
	pop {r0}
	bx r0
	.align 2, 0
_0802BFC0: .4byte gBattlescriptCurrInstr
	thumb_func_end atkCF_jumpifnodamage

	thumb_func_start atkD0_settaunt
atkD0_settaunt: @ 802BFC4
	push {r4,lr}
	ldr r4, _0802C008 @ =gDisableStructs
	ldr r3, _0802C00C @ =gBattlerTarget
	ldrb r0, [r3]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r2, r1, r4
	ldrb r1, [r2, 0x13]
	lsls r0, r1, 28
	cmp r0, 0
	bne _0802C014
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2, 0x13]
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r2, [r0, 0x13]
	movs r1, 0xF
	ands r1, r2
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x13]
	ldr r1, _0802C010 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802C02E
	.align 2, 0
_0802C008: .4byte gDisableStructs
_0802C00C: .4byte gBattlerTarget
_0802C010: .4byte gBattlescriptCurrInstr
_0802C014:
	ldr r3, _0802C034 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802C02E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C034: .4byte gBattlescriptCurrInstr
	thumb_func_end atkD0_settaunt

	thumb_func_start atkD1_trysethelpinghand
atkD1_trysethelpinghand: @ 802C038
	push {r4,lr}
	ldr r4, _0802C0A0 @ =gBattlerAttacker
	ldrb r0, [r4]
	bl GetBattlerPosition
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerAtPosition
	ldr r3, _0802C0A4 @ =gBattlerTarget
	strb r0, [r3]
	ldr r0, _0802C0A8 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0802C0BC
	ldr r0, _0802C0AC @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldr r2, _0802C0B0 @ =gBitTable
	ldrb r3, [r3]
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0802C0BC
	ldr r1, _0802C0B4 @ =gProtectStructs
	ldrb r0, [r4]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 28
	cmp r0, 0
	blt _0802C0BC
	lsls r0, r3, 4
	adds r2, r0, r1
	ldrb r1, [r2]
	lsls r0, r1, 28
	cmp r0, 0
	blt _0802C0BC
	movs r0, 0x8
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0802C0B8 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802C0D6
	.align 2, 0
_0802C0A0: .4byte gBattlerAttacker
_0802C0A4: .4byte gBattlerTarget
_0802C0A8: .4byte gBattleTypeFlags
_0802C0AC: .4byte gAbsentBattlerFlags
_0802C0B0: .4byte gBitTable
_0802C0B4: .4byte gProtectStructs
_0802C0B8: .4byte gBattlescriptCurrInstr
_0802C0BC:
	ldr r3, _0802C0DC @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802C0D6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C0DC: .4byte gBattlescriptCurrInstr
	thumb_func_end atkD1_trysethelpinghand

	thumb_func_start atkD2_tryswapitems
atkD2_tryswapitems: @ 802C0E0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r4, _0802C1FC @ =gBattleTypeFlags
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 12
	ands r0, r1
	cmp r0, 0
	bne _0802C1DE
	ldr r0, _0802C200 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0802C120
	ldr r0, [r4]
	ldr r1, _0802C204 @ =0x00000902
	ands r0, r1
	cmp r0, 0
	bne _0802C120
	ldr r0, _0802C208 @ =gTrainerBattleOpponent_A
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _0802C1DE
_0802C120:
	ldr r6, _0802C200 @ =gBattlerAttacker
	ldrb r0, [r6]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r7, _0802C20C @ =gBattlerTarget
	ldrb r0, [r7]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0802C1FC @ =gBattleTypeFlags
	ldr r0, [r0]
	ldr r1, _0802C204 @ =0x00000902
	ands r0, r1
	cmp r0, 0
	bne _0802C18A
	ldr r0, _0802C208 @ =gTrainerBattleOpponent_A
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _0802C18A
	ldr r0, _0802C210 @ =gWishFutureKnock
	adds r2, r0, 0
	adds r2, 0x29
	adds r0, r4, r2
	ldrb r1, [r0]
	ldr r4, _0802C214 @ =gBitTable
	ldr r3, _0802C218 @ =gBattlerPartyIndexes
	ldrb r0, [r6]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0802C1DE
	adds r0, r5, r2
	ldrb r1, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0802C1DE
_0802C18A:
	ldr r0, _0802C21C @ =gBattleMons
	mov r8, r0
	ldr r1, _0802C200 @ =gBattlerAttacker
	ldrb r4, [r1]
	movs r5, 0x58
	adds r0, r4, 0
	muls r0, r5
	add r0, r8
	mov r9, r0
	ldrh r3, [r0, 0x2E]
	adds r1, r3, 0
	cmp r1, 0
	bne _0802C1B2
	ldr r0, _0802C20C @ =gBattlerTarget
	ldrb r0, [r0]
	muls r0, r5
	add r0, r8
	ldrh r0, [r0, 0x2E]
	cmp r0, 0
	beq _0802C1DE
_0802C1B2:
	cmp r1, 0xAF
	beq _0802C1DE
	ldr r7, _0802C20C @ =gBattlerTarget
	ldrb r0, [r7]
	muls r0, r5
	mov r2, r8
	adds r1, r0, r2
	ldrh r2, [r1, 0x2E]
	cmp r2, 0xAF
	beq _0802C1DE
	adds r0, r3, 0
	subs r0, 0x79
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xB
	bls _0802C1DE
	adds r0, r2, 0
	subs r0, 0x79
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xB
	bhi _0802C224
_0802C1DE:
	ldr r3, _0802C220 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802C37A
	.align 2, 0
_0802C1FC: .4byte gBattleTypeFlags
_0802C200: .4byte gBattlerAttacker
_0802C204: .4byte 0x00000902
_0802C208: .4byte gTrainerBattleOpponent_A
_0802C20C: .4byte gBattlerTarget
_0802C210: .4byte gWishFutureKnock
_0802C214: .4byte gBitTable
_0802C218: .4byte gBattlerPartyIndexes
_0802C21C: .4byte gBattleMons
_0802C220: .4byte gBattlescriptCurrInstr
_0802C224:
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x3C
	bne _0802C258
	ldr r1, _0802C24C @ =gBattlescriptCurrInstr
	ldr r0, _0802C250 @ =BattleScript_StickyHoldActivates
	str r0, [r1]
	ldr r1, _0802C254 @ =gLastUsedAbility
	ldrb r0, [r7]
	muls r0, r5
	add r0, r8
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	ldrb r1, [r1]
	bl RecordAbilityBattle
	b _0802C37A
	.align 2, 0
_0802C24C: .4byte gBattlescriptCurrInstr
_0802C250: .4byte BattleScript_StickyHoldActivates
_0802C254: .4byte gLastUsedAbility
_0802C258:
	ldr r3, _0802C344 @ =gBattleStruct
	mov r10, r3
	lsls r0, r4, 1
	adds r0, 0xD0
	ldr r1, [r3]
	adds r6, r1, r0
	mov r0, r9
	ldrh r0, [r0, 0x2E]
	mov r9, r0
	strh r2, [r6]
	ldr r1, _0802C348 @ =gBattlerAttacker
	ldrb r0, [r1]
	muls r0, r5
	add r0, r8
	movs r1, 0
	strh r1, [r0, 0x2E]
	ldrb r0, [r7]
	muls r0, r5
	add r0, r8
	mov r2, r9
	strh r2, [r0, 0x2E]
	ldr r4, _0802C34C @ =gActiveBattler
	ldr r3, _0802C348 @ =gBattlerAttacker
	ldrb r0, [r3]
	strb r0, [r4]
	str r6, [sp]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl BtlController_EmitSetMonData
	ldr r1, _0802C348 @ =gBattlerAttacker
	ldrb r0, [r1]
	bl MarkBattlerForControllerExec
	ldrb r0, [r7]
	strb r0, [r4]
	ldrb r0, [r7]
	muls r0, r5
	mov r1, r8
	adds r1, 0x2E
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl BtlController_EmitSetMonData
	ldrb r0, [r7]
	bl MarkBattlerForControllerExec
	ldrb r0, [r7]
	mov r2, r10
	ldr r1, [r2]
	lsls r0, 1
	adds r0, r1
	adds r0, 0xC8
	movs r3, 0
	strb r3, [r0]
	ldrb r0, [r7]
	ldr r1, [r2]
	lsls r0, 1
	adds r0, r1
	adds r0, 0xC9
	strb r3, [r0]
	ldr r1, _0802C348 @ =gBattlerAttacker
	ldrb r0, [r1]
	ldr r1, [r2]
	lsls r0, 1
	adds r0, r1
	adds r0, 0xC8
	strb r3, [r0]
	ldr r2, _0802C348 @ =gBattlerAttacker
	ldrb r0, [r2]
	mov r3, r10
	ldr r1, [r3]
	lsls r0, 1
	adds r0, r1
	adds r0, 0xC9
	movs r1, 0
	strb r1, [r0]
	ldr r1, _0802C350 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	ldr r1, _0802C354 @ =gBattleTextBuff1
	movs r3, 0xFD
	strb r3, [r1]
	movs r2, 0xA
	strb r2, [r1, 0x1]
	ldrh r0, [r6]
	strb r0, [r1, 0x2]
	ldrh r0, [r6]
	lsrs r0, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _0802C358 @ =gBattleTextBuff2
	strb r3, [r1]
	strb r2, [r1, 0x1]
	mov r2, r9
	strb r2, [r1, 0x2]
	mov r3, r9
	lsrs r0, r3, 8
	strb r0, [r1, 0x3]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r1, 0x4]
	cmp r3, 0
	beq _0802C360
	ldrh r0, [r6]
	cmp r0, 0
	beq _0802C374
	ldr r1, _0802C35C @ =gBattleCommunication
	movs r0, 0x2
	b _0802C378
	.align 2, 0
_0802C344: .4byte gBattleStruct
_0802C348: .4byte gBattlerAttacker
_0802C34C: .4byte gActiveBattler
_0802C350: .4byte gBattlescriptCurrInstr
_0802C354: .4byte gBattleTextBuff1
_0802C358: .4byte gBattleTextBuff2
_0802C35C: .4byte gBattleCommunication
_0802C360:
	ldrh r0, [r6]
	cmp r0, 0
	beq _0802C374
	ldr r0, _0802C370 @ =gBattleCommunication
	movs r1, 0
	strb r1, [r0, 0x5]
	b _0802C37A
	.align 2, 0
_0802C370: .4byte gBattleCommunication
_0802C374:
	ldr r1, _0802C38C @ =gBattleCommunication
	movs r0, 0x1
_0802C378:
	strb r0, [r1, 0x5]
_0802C37A:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C38C: .4byte gBattleCommunication
	thumb_func_end atkD2_tryswapitems

	thumb_func_start atkD3_trycopyability
atkD3_trycopyability: @ 802C390
	push {r4,lr}
	ldr r3, _0802C3D0 @ =gBattleMons
	ldr r4, _0802C3D4 @ =gBattlerTarget
	ldrb r0, [r4]
	movs r2, 0x58
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	ldrb r1, [r0]
	adds r0, r1, 0
	cmp r0, 0
	beq _0802C3E4
	cmp r0, 0x19
	beq _0802C3E4
	ldr r0, _0802C3D8 @ =gBattlerAttacker
	ldrb r0, [r0]
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	strb r1, [r0]
	ldr r1, _0802C3DC @ =gLastUsedAbility
	ldrb r0, [r4]
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0802C3E0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802C3FE
	.align 2, 0
_0802C3D0: .4byte gBattleMons
_0802C3D4: .4byte gBattlerTarget
_0802C3D8: .4byte gBattlerAttacker
_0802C3DC: .4byte gLastUsedAbility
_0802C3E0: .4byte gBattlescriptCurrInstr
_0802C3E4:
	ldr r3, _0802C404 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802C3FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C404: .4byte gBattlescriptCurrInstr
	thumb_func_end atkD3_trycopyability

	thumb_func_start atkD4_trywish
atkD4_trywish: @ 802C408
	push {r4-r7,lr}
	ldr r7, _0802C41C @ =gBattlescriptCurrInstr
	ldr r2, [r7]
	ldrb r3, [r2, 0x1]
	cmp r3, 0
	beq _0802C420
	cmp r3, 0x1
	beq _0802C458
	b _0802C4D4
	.align 2, 0
_0802C41C: .4byte gBattlescriptCurrInstr
_0802C420:
	ldr r1, _0802C44C @ =gWishFutureKnock
	ldr r4, _0802C450 @ =gBattlerAttacker
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r5, [r4]
	adds r3, r0, r5
	ldrb r0, [r3]
	cmp r0, 0
	bne _0802C4A4
	movs r0, 0x2
	strb r0, [r3]
	ldrb r0, [r4]
	adds r1, 0x24
	adds r1, r0, r1
	ldr r2, _0802C454 @ =gBattlerPartyIndexes
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, 0x6
	b _0802C4D2
	.align 2, 0
_0802C44C: .4byte gWishFutureKnock
_0802C450: .4byte gBattlerAttacker
_0802C454: .4byte gBattlerPartyIndexes
_0802C458:
	ldr r1, _0802C4BC @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x1]
	ldr r4, _0802C4C0 @ =gBattlerTarget
	ldrb r0, [r4]
	strb r0, [r1, 0x2]
	ldr r0, _0802C4C4 @ =gWishFutureKnock
	adds r0, 0x24
	ldrb r5, [r4]
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _0802C4C8 @ =gBattleMoveDamage
	ldr r6, _0802C4CC @ =gBattleMons
	ldrb r0, [r4]
	movs r5, 0x58
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0, 0x2C]
	lsrs r0, 1
	str r0, [r1]
	cmp r0, 0
	bne _0802C490
	str r3, [r1]
_0802C490:
	ldr r0, [r1]
	negs r0, r0
	str r0, [r1]
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r6
	ldrh r1, [r0, 0x28]
	ldrh r0, [r0, 0x2C]
	cmp r1, r0
	bne _0802C4D0
_0802C4A4:
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r7]
	b _0802C4D4
	.align 2, 0
_0802C4BC: .4byte gBattleTextBuff1
_0802C4C0: .4byte gBattlerTarget
_0802C4C4: .4byte gWishFutureKnock
_0802C4C8: .4byte gBattleMoveDamage
_0802C4CC: .4byte gBattleMons
_0802C4D0:
	adds r0, r2, 0x6
_0802C4D2:
	str r0, [r7]
_0802C4D4:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end atkD4_trywish

	thumb_func_start atkD5_trysetroots
atkD5_trysetroots: @ 802C4DC
	push {lr}
	ldr r1, _0802C514 @ =gStatuses3
	ldr r0, _0802C518 @ =gBattlerAttacker
	ldrb r0, [r0]
	lsls r0, 2
	adds r2, r0, r1
	ldr r1, [r2]
	movs r3, 0x80
	lsls r3, 3
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	beq _0802C520
	ldr r3, _0802C51C @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802C52C
	.align 2, 0
_0802C514: .4byte gStatuses3
_0802C518: .4byte gBattlerAttacker
_0802C51C: .4byte gBattlescriptCurrInstr
_0802C520:
	orrs r1, r3
	str r1, [r2]
	ldr r1, _0802C530 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802C52C:
	pop {r0}
	bx r0
	.align 2, 0
_0802C530: .4byte gBattlescriptCurrInstr
	thumb_func_end atkD5_trysetroots

	thumb_func_start atkD6_doubledamagedealtifdamaged
atkD6_doubledamagedealtifdamaged: @ 802C534
	push {lr}
	ldr r3, _0802C580 @ =gProtectStructs
	ldr r0, _0802C584 @ =gBattlerAttacker
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r0, r3, 0x4
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0802C554
	adds r0, r2, r3
	ldr r1, _0802C588 @ =gBattlerTarget
	ldrb r0, [r0, 0xC]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0802C56C
_0802C554:
	adds r0, r3, 0
	adds r0, 0x8
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0802C572
	adds r0, r2, r3
	ldr r1, _0802C588 @ =gBattlerTarget
	ldrb r0, [r0, 0xD]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0802C572
_0802C56C:
	ldr r1, _0802C58C @ =gBattleScripting
	movs r0, 0x2
	strb r0, [r1, 0xE]
_0802C572:
	ldr r1, _0802C590 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802C580: .4byte gProtectStructs
_0802C584: .4byte gBattlerAttacker
_0802C588: .4byte gBattlerTarget
_0802C58C: .4byte gBattleScripting
_0802C590: .4byte gBattlescriptCurrInstr
	thumb_func_end atkD6_doubledamagedealtifdamaged

	thumb_func_start atkD7_setyawn
atkD7_setyawn: @ 802C594
	push {r4,lr}
	ldr r1, _0802C5D8 @ =gStatuses3
	ldr r0, _0802C5DC @ =gBattlerTarget
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r4, r0, r1
	ldr r2, [r4]
	movs r0, 0xC0
	lsls r0, 5
	ands r0, r2
	cmp r0, 0
	bne _0802C5BC
	ldr r1, _0802C5E0 @ =gBattleMons
	movs r0, 0x58
	muls r0, r3
	adds r1, 0x4C
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0802C5E8
_0802C5BC:
	ldr r3, _0802C5E4 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802C5F8
	.align 2, 0
_0802C5D8: .4byte gStatuses3
_0802C5DC: .4byte gBattlerTarget
_0802C5E0: .4byte gBattleMons
_0802C5E4: .4byte gBattlescriptCurrInstr
_0802C5E8:
	movs r0, 0x80
	lsls r0, 5
	orrs r2, r0
	str r2, [r4]
	ldr r1, _0802C600 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802C5F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C600: .4byte gBattlescriptCurrInstr
	thumb_func_end atkD7_setyawn

	thumb_func_start atkD8_setdamagetohealthdifference
atkD8_setdamagetohealthdifference: @ 802C604
	push {lr}
	ldr r2, _0802C640 @ =gBattleMons
	ldr r0, _0802C644 @ =gBattlerTarget
	ldrb r0, [r0]
	movs r1, 0x58
	muls r0, r1
	adds r3, r0, r2
	ldr r0, _0802C648 @ =gBattlerAttacker
	ldrb r0, [r0]
	muls r0, r1
	adds r1, r0, r2
	ldrh r0, [r3, 0x28]
	ldrh r2, [r1, 0x28]
	cmp r0, r2
	bhi _0802C650
	ldr r3, _0802C64C @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802C662
	.align 2, 0
_0802C640: .4byte gBattleMons
_0802C644: .4byte gBattlerTarget
_0802C648: .4byte gBattlerAttacker
_0802C64C: .4byte gBattlescriptCurrInstr
_0802C650:
	ldr r2, _0802C668 @ =gBattleMoveDamage
	ldrh r0, [r3, 0x28]
	ldrh r1, [r1, 0x28]
	subs r0, r1
	str r0, [r2]
	ldr r1, _0802C66C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802C662:
	pop {r0}
	bx r0
	.align 2, 0
_0802C668: .4byte gBattleMoveDamage
_0802C66C: .4byte gBattlescriptCurrInstr
	thumb_func_end atkD8_setdamagetohealthdifference

	thumb_func_start atkD9_scaledamagebyhealthratio
atkD9_scaledamagebyhealthratio: @ 802C670
	push {r4,lr}
	ldr r4, _0802C6BC @ =gDynamicBasePower
	ldrh r0, [r4]
	cmp r0, 0
	bne _0802C6AC
	ldr r2, _0802C6C0 @ =gBattleMoves
	ldr r0, _0802C6C4 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r3, [r0, 0x1]
	ldr r2, _0802C6C8 @ =gBattleMons
	ldr r0, _0802C6CC @ =gBattlerAttacker
	ldrb r1, [r0]
	movs r0, 0x58
	muls r1, r0
	adds r1, r2
	ldrh r0, [r1, 0x28]
	muls r0, r3
	ldrh r1, [r1, 0x2C]
	bl __divsi3
	strh r0, [r4]
	lsls r0, 16
	cmp r0, 0
	bne _0802C6AC
	movs r0, 0x1
	strh r0, [r4]
_0802C6AC:
	ldr r1, _0802C6D0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C6BC: .4byte gDynamicBasePower
_0802C6C0: .4byte gBattleMoves
_0802C6C4: .4byte gCurrentMove
_0802C6C8: .4byte gBattleMons
_0802C6CC: .4byte gBattlerAttacker
_0802C6D0: .4byte gBattlescriptCurrInstr
	thumb_func_end atkD9_scaledamagebyhealthratio

	thumb_func_start atkDA_tryswapabilities
atkDA_tryswapabilities: @ 802C6D4
	push {r4-r6,lr}
	ldr r5, _0802C738 @ =gBattleMons
	ldr r0, _0802C73C @ =gBattlerAttacker
	ldrb r0, [r0]
	movs r4, 0x58
	muls r0, r4
	adds r0, r5
	adds r2, r0, 0
	adds r2, 0x20
	ldrb r1, [r2]
	cmp r1, 0
	bne _0802C6FC
	ldr r0, _0802C740 @ =gBattlerTarget
	ldrb r0, [r0]
	muls r0, r4
	adds r0, r5
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0
	beq _0802C71C
_0802C6FC:
	cmp r1, 0x19
	beq _0802C71C
	ldr r6, _0802C740 @ =gBattlerTarget
	ldrb r0, [r6]
	muls r0, r4
	adds r0, r5
	adds r0, 0x20
	ldrb r3, [r0]
	cmp r3, 0x19
	beq _0802C71C
	ldr r0, _0802C744 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0802C74C
_0802C71C:
	ldr r3, _0802C748 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802C762
	.align 2, 0
_0802C738: .4byte gBattleMons
_0802C73C: .4byte gBattlerAttacker
_0802C740: .4byte gBattlerTarget
_0802C744: .4byte gMoveResultFlags
_0802C748: .4byte gBattlescriptCurrInstr
_0802C74C:
	ldrb r1, [r2]
	strb r3, [r2]
	ldrb r0, [r6]
	muls r0, r4
	adds r0, r5
	adds r0, 0x20
	strb r1, [r0]
	ldr r1, _0802C768 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802C762:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802C768: .4byte gBattlescriptCurrInstr
	thumb_func_end atkDA_tryswapabilities

	thumb_func_start atkDB_tryimprison
atkDB_tryimprison: @ 802C76C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r1, _0802C78C @ =gStatuses3
	ldr r4, _0802C790 @ =gBattlerAttacker
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 6
	ands r0, r1
	cmp r0, 0
	beq _0802C7BC
	b _0802C83E
	.align 2, 0
_0802C78C: .4byte gStatuses3
_0802C790: .4byte gBattlerAttacker
_0802C794:
	ldr r0, _0802C7B4 @ =gStatuses3
	mov r2, r9
	ldrb r1, [r2]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 6
	orrs r0, r2
	str r0, [r1]
	ldr r1, _0802C7B8 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802C836
	.align 2, 0
_0802C7B4: .4byte gStatuses3
_0802C7B8: .4byte gBattlescriptCurrInstr
_0802C7BC:
	adds r0, r2, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrb r0, [r4]
	bl PressurePPLoseOnUsingImprison
	movs r6, 0
	b _0802C82E
_0802C7D2:
	adds r0, r6, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r8, r0
	beq _0802C828
	movs r4, 0
	ldr r7, _0802C864 @ =gBattlerAttacker
	mov r9, r7
	ldr r0, _0802C868 @ =gBattleMons
	mov r12, r0
	mov r1, r9
	ldrb r0, [r1]
	mov r2, r12
	adds r2, 0xC
	movs r1, 0x58
	muls r0, r1
	adds r3, r0, r2
	adds r5, r6, 0
	muls r5, r1
_0802C7FC:
	movs r2, 0
	ldrh r1, [r3]
	mov r0, r12
	adds r0, 0xC
	adds r0, r5, r0
_0802C806:
	ldrh r7, [r0]
	cmp r1, r7
	bne _0802C810
	cmp r1, 0
	bne _0802C818
_0802C810:
	adds r0, 0x2
	adds r2, 0x1
	cmp r2, 0x3
	ble _0802C806
_0802C818:
	cmp r2, 0x4
	bne _0802C824
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0802C7FC
_0802C824:
	cmp r4, 0x4
	bne _0802C794
_0802C828:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0802C82E:
	ldr r0, _0802C86C @ =gBattlersCount
	ldrb r0, [r0]
	cmp r6, r0
	bcc _0802C7D2
_0802C836:
	ldr r0, _0802C86C @ =gBattlersCount
	ldrb r0, [r0]
	cmp r6, r0
	bne _0802C858
_0802C83E:
	ldr r3, _0802C870 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802C858:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C864: .4byte gBattlerAttacker
_0802C868: .4byte gBattleMons
_0802C86C: .4byte gBattlersCount
_0802C870: .4byte gBattlescriptCurrInstr
	thumb_func_end atkDB_tryimprison

	thumb_func_start atkDC_trysetgrudge
atkDC_trysetgrudge: @ 802C874
	push {lr}
	ldr r1, _0802C8AC @ =gStatuses3
	ldr r0, _0802C8B0 @ =gBattlerAttacker
	ldrb r0, [r0]
	lsls r0, 2
	adds r2, r0, r1
	ldr r1, [r2]
	movs r3, 0x80
	lsls r3, 7
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	beq _0802C8B8
	ldr r3, _0802C8B4 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802C8C4
	.align 2, 0
_0802C8AC: .4byte gStatuses3
_0802C8B0: .4byte gBattlerAttacker
_0802C8B4: .4byte gBattlescriptCurrInstr
_0802C8B8:
	orrs r1, r3
	str r1, [r2]
	ldr r1, _0802C8C8 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802C8C4:
	pop {r0}
	bx r0
	.align 2, 0
_0802C8C8: .4byte gBattlescriptCurrInstr
	thumb_func_end atkDC_trysetgrudge

	thumb_func_start atkDD_weightdamagecalculation
atkDD_weightdamagecalculation: @ 802C8CC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
	ldr r2, _0802C930 @ =sWeightToDamageTable
	ldrh r0, [r2]
	ldr r1, _0802C934 @ =0x0000ffff
	cmp r0, r1
	beq _0802C944
	adds r6, r2, 0
	ldr r0, _0802C938 @ =gBattleMons
	mov r8, r0
	adds r7, r1, 0
	adds r4, r6, 0
_0802C8E8:
	ldr r0, _0802C93C @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	add r0, r8
	ldrh r0, [r0]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl GetPokedexHeightWeight
	ldrh r1, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bhi _0802C916
	adds r4, 0x4
	adds r5, 0x2
	ldrh r0, [r4]
	cmp r0, r7
	bne _0802C8E8
_0802C916:
	lsls r0, r5, 1
	adds r0, r6
	ldrh r1, [r0]
	ldr r0, _0802C934 @ =0x0000ffff
	cmp r1, r0
	beq _0802C944
	ldr r0, _0802C940 @ =gDynamicBasePower
	adds r1, r5, 0x1
	lsls r1, 1
	adds r1, r6
	ldrh r1, [r1]
	strh r1, [r0]
	b _0802C94A
	.align 2, 0
_0802C930: .4byte sWeightToDamageTable
_0802C934: .4byte 0x0000ffff
_0802C938: .4byte gBattleMons
_0802C93C: .4byte gBattlerTarget
_0802C940: .4byte gDynamicBasePower
_0802C944:
	ldr r1, _0802C95C @ =gDynamicBasePower
	movs r0, 0x78
	strh r0, [r1]
_0802C94A:
	ldr r1, _0802C960 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C95C: .4byte gDynamicBasePower
_0802C960: .4byte gBattlescriptCurrInstr
	thumb_func_end atkDD_weightdamagecalculation

	thumb_func_start atkDE_assistattackselect
atkDE_assistattackselect: @ 802C964
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	movs r0, 0
	mov r10, r0
	ldr r0, _0802CA84 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x18
	str r0, [sp, 0x4]
	ldr r0, _0802CA88 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerPosition
	movs r1, 0x1
	ands r1, r0
	ldr r0, _0802CA8C @ =gPlayerParty
	str r0, [sp]
	cmp r1, 0
	beq _0802C994
	ldr r1, _0802CA90 @ =gEnemyParty
	str r1, [sp]
_0802C994:
	movs r2, 0
_0802C996:
	ldr r1, _0802CA94 @ =gBattlerPartyIndexes
	ldr r0, _0802CA88 @ =gBattlerAttacker
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	adds r1, r2, 0x1
	str r1, [sp, 0x8]
	ldrh r0, [r0]
	cmp r2, r0
	beq _0802CA3C
	movs r0, 0x64
	adds r6, r2, 0
	muls r6, r0
	ldr r0, [sp]
	adds r4, r0, r6
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _0802CA3C
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0802CA3C
	movs r5, 0
	ldr r1, _0802CA98 @ =0x0000ffff
	mov r8, r1
	mov r9, r6
	mov r1, r10
	lsls r0, r1, 1
	ldr r1, [sp, 0x4]
	adds r6, r0, r1
_0802C9E0:
	movs r7, 0
	adds r1, r5, 0
	adds r1, 0xD
	ldr r0, [sp]
	add r0, r9
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl IsInvalidForSleepTalkOrAssist
	lsls r0, 24
	adds r1, r5, 0x1
	cmp r0, 0
	bne _0802CA36
	ldr r0, _0802CA9C @ =sMovesForbiddenToCopy
	ldrh r2, [r0]
	adds r3, r0, 0
	cmp r2, r8
	beq _0802CA2A
	cmp r4, r2
	beq _0802CA20
	ldr r5, _0802CA98 @ =0x0000ffff
	adds r2, r3, 0
_0802CA12:
	adds r2, 0x2
	adds r7, 0x1
	ldrh r0, [r2]
	cmp r0, r5
	beq _0802CA2A
	cmp r4, r0
	bne _0802CA12
_0802CA20:
	lsls r0, r7, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r8
	bne _0802CA36
_0802CA2A:
	cmp r4, 0
	beq _0802CA36
	strh r4, [r6]
	adds r6, 0x2
	movs r0, 0x1
	add r10, r0
_0802CA36:
	adds r5, r1, 0
	cmp r5, 0x3
	ble _0802C9E0
_0802CA3C:
	ldr r2, [sp, 0x8]
	cmp r2, 0x5
	ble _0802C996
	mov r1, r10
	cmp r1, 0
	beq _0802CAB4
	ldr r2, _0802CAA0 @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _0802CAA4 @ =0xfffffbff
	ands r0, r1
	str r0, [r2]
	ldr r4, _0802CAA8 @ =gCalledMove
	bl Random
	movs r1, 0xFF
	ands r1, r0
	mov r0, r10
	muls r0, r1
	asrs r0, 8
	lsls r0, 1
	ldr r1, [sp, 0x4]
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r4]
	ldrh r0, [r4]
	movs r1, 0
	bl GetMoveTarget
	ldr r1, _0802CAAC @ =gBattlerTarget
	strb r0, [r1]
	ldr r1, _0802CAB0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802CACE
	.align 2, 0
_0802CA84: .4byte gBattleStruct
_0802CA88: .4byte gBattlerAttacker
_0802CA8C: .4byte gPlayerParty
_0802CA90: .4byte gEnemyParty
_0802CA94: .4byte gBattlerPartyIndexes
_0802CA98: .4byte 0x0000ffff
_0802CA9C: .4byte sMovesForbiddenToCopy
_0802CAA0: .4byte gHitMarker
_0802CAA4: .4byte 0xfffffbff
_0802CAA8: .4byte gCalledMove
_0802CAAC: .4byte gBattlerTarget
_0802CAB0: .4byte gBattlescriptCurrInstr
_0802CAB4:
	ldr r3, _0802CAE0 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802CACE:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802CAE0: .4byte gBattlescriptCurrInstr
	thumb_func_end atkDE_assistattackselect

	thumb_func_start atkDF_trysetmagiccoat
atkDF_trysetmagiccoat: @ 802CAE4
	push {lr}
	ldr r1, _0802CB2C @ =gBattlerTarget
	ldr r3, _0802CB30 @ =gBattlerAttacker
	ldrb r0, [r3]
	strb r0, [r1]
	ldr r2, _0802CB34 @ =gSpecialStatuses
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _0802CB38 @ =gCurrentTurnActionNumber
	ldrb r1, [r0]
	ldr r0, _0802CB3C @ =gBattlersCount
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	bne _0802CB44
	ldr r3, _0802CB40 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802CB5C
	.align 2, 0
_0802CB2C: .4byte gBattlerTarget
_0802CB30: .4byte gBattlerAttacker
_0802CB34: .4byte gSpecialStatuses
_0802CB38: .4byte gCurrentTurnActionNumber
_0802CB3C: .4byte gBattlersCount
_0802CB40: .4byte gBattlescriptCurrInstr
_0802CB44:
	ldr r0, _0802CB60 @ =gProtectStructs
	ldrb r1, [r3]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x10
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _0802CB64 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802CB5C:
	pop {r0}
	bx r0
	.align 2, 0
_0802CB60: .4byte gProtectStructs
_0802CB64: .4byte gBattlescriptCurrInstr
	thumb_func_end atkDF_trysetmagiccoat

	thumb_func_start atkE0_trysetsnatch
atkE0_trysetsnatch: @ 802CB68
	push {lr}
	ldr r2, _0802CBAC @ =gSpecialStatuses
	ldr r3, _0802CBB0 @ =gBattlerAttacker
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _0802CBB4 @ =gCurrentTurnActionNumber
	ldrb r1, [r0]
	ldr r0, _0802CBB8 @ =gBattlersCount
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	bne _0802CBC0
	ldr r3, _0802CBBC @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802CBD6
	.align 2, 0
_0802CBAC: .4byte gSpecialStatuses
_0802CBB0: .4byte gBattlerAttacker
_0802CBB4: .4byte gCurrentTurnActionNumber
_0802CBB8: .4byte gBattlersCount
_0802CBBC: .4byte gBattlescriptCurrInstr
_0802CBC0:
	ldr r0, _0802CBDC @ =gProtectStructs
	ldrb r1, [r3]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _0802CBE0 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802CBD6:
	pop {r0}
	bx r0
	.align 2, 0
_0802CBDC: .4byte gProtectStructs
_0802CBE0: .4byte gBattlescriptCurrInstr
	thumb_func_end atkE0_trysetsnatch

	thumb_func_start atkE1_trygetintimidatetarget
atkE1_trygetintimidatetarget: @ 802CBE4
	push {r4-r6,lr}
	ldr r4, _0802CC88 @ =gBattleScripting
	ldr r0, _0802CC8C @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xD8
	ldrb r0, [r0]
	strb r0, [r4, 0x17]
	ldrb r0, [r4, 0x17]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _0802CC90 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r2]
	movs r0, 0x9
	strb r0, [r2, 0x1]
	ldr r3, _0802CC94 @ =gBattleMons
	ldrb r1, [r4, 0x17]
	movs r0, 0x58
	muls r0, r1
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r2, 0x2]
	movs r0, 0xFF
	strb r0, [r2, 0x3]
	ldr r2, _0802CC98 @ =gBattlerTarget
	ldr r1, _0802CC9C @ =gBattlersCount
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bcs _0802CC6A
	adds r4, r2, 0
	ldr r6, _0802CCA0 @ =gBitTable
_0802CC2A:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r5
	beq _0802CC4C
	ldr r0, _0802CCA4 @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ands r1, r0
	ldr r2, _0802CC9C @ =gBattlersCount
	cmp r1, 0
	beq _0802CC60
_0802CC4C:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _0802CC9C @ =gBattlersCount
	lsls r0, 24
	lsrs r0, 24
	adds r2, r1, 0
	ldrb r1, [r2]
	cmp r0, r1
	bcc _0802CC2A
_0802CC60:
	ldr r0, _0802CC98 @ =gBattlerTarget
	ldrb r0, [r0]
	ldrb r2, [r2]
	cmp r0, r2
	bcc _0802CCAC
_0802CC6A:
	ldr r3, _0802CCA8 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802CCB4
	.align 2, 0
_0802CC88: .4byte gBattleScripting
_0802CC8C: .4byte gBattleStruct
_0802CC90: .4byte gBattleTextBuff1
_0802CC94: .4byte gBattleMons
_0802CC98: .4byte gBattlerTarget
_0802CC9C: .4byte gBattlersCount
_0802CCA0: .4byte gBitTable
_0802CCA4: .4byte gAbsentBattlerFlags
_0802CCA8: .4byte gBattlescriptCurrInstr
_0802CCAC:
	ldr r1, _0802CCBC @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802CCB4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802CCBC: .4byte gBattlescriptCurrInstr
	thumb_func_end atkE1_trygetintimidatetarget

	thumb_func_start atkE2_switchoutabilities
atkE2_switchoutabilities: @ 802CCC0
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r5, _0802CD28 @ =gBattlescriptCurrInstr
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl GetBattlerForBattleScript
	ldr r4, _0802CD2C @ =gActiveBattler
	strb r0, [r4]
	ldr r3, _0802CD30 @ =gBattleMons
	ldrb r0, [r4]
	movs r6, 0x58
	adds r1, r0, 0
	muls r1, r6
	adds r0, r1, r3
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1E
	bne _0802CD1A
	adds r3, 0x4C
	adds r1, r3
	movs r0, 0
	str r0, [r1]
	ldr r2, _0802CD34 @ =gBitTable
	ldrb r1, [r4]
	ldr r0, _0802CD38 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, r1, r0
	adds r0, 0x58
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0]
	adds r0, r1, 0
	muls r0, r6
	adds r0, r3
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r3, 0x4
	bl BtlController_EmitSetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_0802CD1A:
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802CD28: .4byte gBattlescriptCurrInstr
_0802CD2C: .4byte gActiveBattler
_0802CD30: .4byte gBattleMons
_0802CD34: .4byte gBitTable
_0802CD38: .4byte gBattleStruct
	thumb_func_end atkE2_switchoutabilities

	thumb_func_start atkE3_jumpifhasnohp
atkE3_jumpifhasnohp: @ 802CD3C
	push {r4,lr}
	ldr r4, _0802CD78 @ =gBattlescriptCurrInstr
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl GetBattlerForBattleScript
	ldr r1, _0802CD7C @ =gActiveBattler
	strb r0, [r1]
	ldr r2, _0802CD80 @ =gBattleMons
	ldrb r1, [r1]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _0802CD84
	ldr r2, [r4]
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0802CD8A
	.align 2, 0
_0802CD78: .4byte gBattlescriptCurrInstr
_0802CD7C: .4byte gActiveBattler
_0802CD80: .4byte gBattleMons
_0802CD84:
	ldr r0, [r4]
	adds r0, 0x6
	str r0, [r4]
_0802CD8A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end atkE3_jumpifhasnohp

	thumb_func_start atkE4_getsecretpowereffect
atkE4_getsecretpowereffect: @ 802CD90
	push {lr}
	ldr r0, _0802CDA4 @ =gBattleTerrain
	ldrb r0, [r0]
	cmp r0, 0x7
	bhi _0802CE2C
	lsls r0, 2
	ldr r1, _0802CDA8 @ =_0802CDAC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802CDA4: .4byte gBattleTerrain
_0802CDA8: .4byte _0802CDAC
	.align 2, 0
_0802CDAC:
	.4byte _0802CDCC
	.4byte _0802CDD8
	.4byte _0802CDE4
	.4byte _0802CDF0
	.4byte _0802CDFC
	.4byte _0802CE08
	.4byte _0802CE14
	.4byte _0802CE20
_0802CDCC:
	ldr r1, _0802CDD4 @ =gBattleCommunication
	movs r0, 0x2
	b _0802CE30
	.align 2, 0
_0802CDD4: .4byte gBattleCommunication
_0802CDD8:
	ldr r1, _0802CDE0 @ =gBattleCommunication
	movs r0, 0x1
	b _0802CE30
	.align 2, 0
_0802CDE0: .4byte gBattleCommunication
_0802CDE4:
	ldr r1, _0802CDEC @ =gBattleCommunication
	movs r0, 0x1B
	b _0802CE30
	.align 2, 0
_0802CDEC: .4byte gBattleCommunication
_0802CDF0:
	ldr r1, _0802CDF8 @ =gBattleCommunication
	movs r0, 0x17
	b _0802CE30
	.align 2, 0
_0802CDF8: .4byte gBattleCommunication
_0802CDFC:
	ldr r1, _0802CE04 @ =gBattleCommunication
	movs r0, 0x16
	b _0802CE30
	.align 2, 0
_0802CE04: .4byte gBattleCommunication
_0802CE08:
	ldr r1, _0802CE10 @ =gBattleCommunication
	movs r0, 0x18
	b _0802CE30
	.align 2, 0
_0802CE10: .4byte gBattleCommunication
_0802CE14:
	ldr r1, _0802CE1C @ =gBattleCommunication
	movs r0, 0x7
	b _0802CE30
	.align 2, 0
_0802CE1C: .4byte gBattleCommunication
_0802CE20:
	ldr r1, _0802CE28 @ =gBattleCommunication
	movs r0, 0x8
	b _0802CE30
	.align 2, 0
_0802CE28: .4byte gBattleCommunication
_0802CE2C:
	ldr r1, _0802CE40 @ =gBattleCommunication
	movs r0, 0x5
_0802CE30:
	strb r0, [r1, 0x3]
	ldr r1, _0802CE44 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802CE40: .4byte gBattleCommunication
_0802CE44: .4byte gBattlescriptCurrInstr
	thumb_func_end atkE4_getsecretpowereffect

	thumb_func_start atkE5_pickup
atkE5_pickup: @ 802CE48
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r7, 0
	ldr r0, _0802CE90 @ =gBaseStats
	mov r8, r0
_0802CE54:
	movs r0, 0x64
	adds r4, r7, 0
	muls r4, r0
	ldr r0, _0802CE94 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	movs r1, 0x2E
	bl GetMonData
	cmp r0, 0
	beq _0802CE98
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	add r0, r8
	ldrb r0, [r0, 0x17]
	b _0802CEA2
	.align 2, 0
_0802CE90: .4byte gBaseStats
_0802CE94: .4byte gPlayerParty
_0802CE98:
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	add r0, r8
	ldrb r0, [r0, 0x16]
_0802CEA2:
	adds r4, r7, 0x1
	cmp r0, 0x35
	bne _0802CF0A
	cmp r5, 0
	beq _0802CF0A
	movs r0, 0xCE
	lsls r0, 1
	cmp r5, r0
	beq _0802CF0A
	cmp r6, 0
	bne _0802CF0A
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	bne _0802CF0A
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r1, _0802CEE4 @ =sPickupItems
	b _0802CEF0
	.align 2, 0
_0802CEE4: .4byte sPickupItems
_0802CEE8:
	adds r1, 0x4
	adds r2, 0x1
	cmp r2, 0xE
	bhi _0802CEF6
_0802CEF0:
	ldrb r0, [r1, 0x2]
	cmp r0, r3
	ble _0802CEE8
_0802CEF6:
	movs r0, 0x64
	muls r0, r7
	ldr r1, _0802CF24 @ =gPlayerParty
	adds r0, r1
	lsls r2, 2
	ldr r1, _0802CF28 @ =sPickupItems
	adds r2, r1
	movs r1, 0xC
	bl SetMonData
_0802CF0A:
	adds r7, r4, 0
	cmp r7, 0x5
	ble _0802CE54
	ldr r1, _0802CF2C @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802CF24: .4byte gPlayerParty
_0802CF28: .4byte sPickupItems
_0802CF2C: .4byte gBattlescriptCurrInstr
	thumb_func_end atkE5_pickup

	thumb_func_start atkE6_docastformchangeanimation
atkE6_docastformchangeanimation: @ 802CF30
	push {r4,lr}
	ldr r4, _0802CF84 @ =gActiveBattler
	ldr r0, _0802CF88 @ =gBattleScripting
	ldrb r0, [r0, 0x17]
	strb r0, [r4]
	ldr r1, _0802CF8C @ =gBattleMons
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 17
	ands r0, r1
	ldr r3, _0802CF90 @ =gBattleStruct
	cmp r0, 0
	beq _0802CF60
	ldr r0, [r3]
	adds r0, 0x7F
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
_0802CF60:
	ldr r0, [r3]
	adds r0, 0x7F
	ldrb r2, [r0]
	movs r0, 0
	movs r1, 0
	bl BtlController_EmitBattleAnimation
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r1, _0802CF94 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802CF84: .4byte gActiveBattler
_0802CF88: .4byte gBattleScripting
_0802CF8C: .4byte gBattleMons
_0802CF90: .4byte gBattleStruct
_0802CF94: .4byte gBattlescriptCurrInstr
	thumb_func_end atkE6_docastformchangeanimation

	thumb_func_start atkE7_trycastformdatachange
atkE7_trycastformdatachange: @ 802CF98
	push {r4,lr}
	ldr r1, _0802CFC8 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r0, _0802CFCC @ =gBattleScripting
	ldrb r0, [r0, 0x17]
	bl CastformDataTypeChange
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _0802CFC2
	ldr r0, _0802CFD0 @ =BattleScript_CastformChange
	bl BattleScriptPushCursorAndCallback
	ldr r0, _0802CFD4 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x7F
	subs r1, r4, 0x1
	strb r1, [r0]
_0802CFC2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802CFC8: .4byte gBattlescriptCurrInstr
_0802CFCC: .4byte gBattleScripting
_0802CFD0: .4byte BattleScript_CastformChange
_0802CFD4: .4byte gBattleStruct
	thumb_func_end atkE7_trycastformdatachange

	thumb_func_start atkE8_settypebasedhalvers
atkE8_settypebasedhalvers: @ 802CFD8
	push {r4,lr}
	movs r4, 0
	ldr r2, _0802D014 @ =gBattleMoves
	ldr r0, _0802D018 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0xC9
	bne _0802D028
	ldr r1, _0802D01C @ =gStatuses3
	ldr r0, _0802D020 @ =gBattlerAttacker
	ldrb r0, [r0]
	lsls r0, 2
	adds r2, r0, r1
	ldr r1, [r2]
	movs r3, 0x80
	lsls r3, 9
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	bne _0802D04C
	orrs r1, r3
	str r1, [r2]
	ldr r0, _0802D024 @ =gBattleCommunication
	strb r4, [r0, 0x5]
	b _0802D050
	.align 2, 0
_0802D014: .4byte gBattleMoves
_0802D018: .4byte gCurrentMove
_0802D01C: .4byte gStatuses3
_0802D020: .4byte gBattlerAttacker
_0802D024: .4byte gBattleCommunication
_0802D028:
	ldr r1, _0802D05C @ =gStatuses3
	ldr r0, _0802D060 @ =gBattlerAttacker
	ldrb r0, [r0]
	lsls r0, 2
	adds r2, r0, r1
	ldr r1, [r2]
	movs r3, 0x80
	lsls r3, 10
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	bne _0802D04C
	orrs r1, r3
	str r1, [r2]
	ldr r1, _0802D064 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
	movs r4, 0x1
_0802D04C:
	cmp r4, 0
	beq _0802D06C
_0802D050:
	ldr r1, _0802D068 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802D086
	.align 2, 0
_0802D05C: .4byte gStatuses3
_0802D060: .4byte gBattlerAttacker
_0802D064: .4byte gBattleCommunication
_0802D068: .4byte gBattlescriptCurrInstr
_0802D06C:
	ldr r3, _0802D08C @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802D086:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D08C: .4byte gBattlescriptCurrInstr
	thumb_func_end atkE8_settypebasedhalvers

	thumb_func_start atkE9_setweatherballtype
atkE9_setweatherballtype: @ 802D090
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0802D130
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	bne _0802D130
	ldr r2, _0802D0E0 @ =gBattleWeather
	ldrb r0, [r2]
	cmp r0, 0
	beq _0802D0CE
	ldr r1, _0802D0E4 @ =gBattleScripting
	movs r0, 0x2
	strb r0, [r1, 0xE]
_0802D0CE:
	ldrh r1, [r2]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _0802D0EC
	ldr r0, _0802D0E8 @ =gBattleStruct
	ldr r1, [r0]
	movs r0, 0x8B
	b _0802D12E
	.align 2, 0
_0802D0E0: .4byte gBattleWeather
_0802D0E4: .4byte gBattleScripting
_0802D0E8: .4byte gBattleStruct
_0802D0EC:
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	beq _0802D100
	ldr r0, _0802D0FC @ =gBattleStruct
	ldr r1, [r0]
	movs r0, 0x85
	b _0802D12E
	.align 2, 0
_0802D0FC: .4byte gBattleStruct
_0802D100:
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _0802D114
	ldr r0, _0802D110 @ =gBattleStruct
	ldr r1, [r0]
	movs r0, 0x8A
	b _0802D12E
	.align 2, 0
_0802D110: .4byte gBattleStruct
_0802D114:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802D128
	ldr r0, _0802D124 @ =gBattleStruct
	ldr r1, [r0]
	movs r0, 0x8F
	b _0802D12E
	.align 2, 0
_0802D124: .4byte gBattleStruct
_0802D128:
	ldr r0, _0802D140 @ =gBattleStruct
	ldr r1, [r0]
	movs r0, 0x80
_0802D12E:
	strb r0, [r1, 0x13]
_0802D130:
	ldr r1, _0802D144 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0802D140: .4byte gBattleStruct
_0802D144: .4byte gBattlescriptCurrInstr
	thumb_func_end atkE9_setweatherballtype

	thumb_func_start atkEA_tryrecycleitem
atkEA_tryrecycleitem: @ 802D148
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r7, _0802D1B0 @ =gActiveBattler
	ldr r0, _0802D1B4 @ =gBattlerAttacker
	ldrb r0, [r0]
	strb r0, [r7]
	ldr r1, _0802D1B8 @ =gBattleStruct
	ldrb r2, [r7]
	lsls r0, r2, 1
	adds r0, 0xB8
	ldr r1, [r1]
	adds r6, r1, r0
	ldrh r5, [r6]
	cmp r5, 0
	beq _0802D1C8
	ldr r4, _0802D1BC @ =gBattleMons
	movs r3, 0x58
	adds r0, r2, 0
	muls r0, r3
	adds r0, r4
	ldrh r0, [r0, 0x2E]
	cmp r0, 0
	bne _0802D1C8
	ldr r1, _0802D1C0 @ =gLastUsedItem
	strh r5, [r1]
	strh r0, [r6]
	ldrb r0, [r7]
	muls r0, r3
	adds r0, r4
	ldrh r1, [r1]
	strh r1, [r0, 0x2E]
	ldrb r0, [r7]
	muls r0, r3
	adds r1, r4, 0
	adds r1, 0x2E
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl BtlController_EmitSetMonData
	ldrb r0, [r7]
	bl MarkBattlerForControllerExec
	ldr r1, _0802D1C4 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802D1E2
	.align 2, 0
_0802D1B0: .4byte gActiveBattler
_0802D1B4: .4byte gBattlerAttacker
_0802D1B8: .4byte gBattleStruct
_0802D1BC: .4byte gBattleMons
_0802D1C0: .4byte gLastUsedItem
_0802D1C4: .4byte gBattlescriptCurrInstr
_0802D1C8:
	ldr r3, _0802D1EC @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802D1E2:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D1EC: .4byte gBattlescriptCurrInstr
	thumb_func_end atkEA_tryrecycleitem

	thumb_func_start atkEB_settypetoterrain
atkEB_settypetoterrain: @ 802D1F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _0802D260 @ =gBattleMons
	mov r8, r0
	ldr r7, _0802D264 @ =gBattlerAttacker
	ldrb r0, [r7]
	movs r6, 0x58
	muls r0, r6
	mov r1, r8
	adds r3, r0, r1
	movs r0, 0x21
	adds r0, r3
	mov r12, r0
	ldr r5, _0802D268 @ =sTerrainToType
	ldr r4, _0802D26C @ =gBattleTerrain
	ldrb r0, [r4]
	adds r0, r5
	ldrb r2, [r0]
	mov r1, r12
	ldrb r0, [r1]
	adds r1, r2, 0
	cmp r0, r1
	beq _0802D278
	adds r0, r3, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, r1
	beq _0802D278
	mov r0, r12
	strb r2, [r0]
	ldrb r0, [r7]
	adds r1, r0, 0
	muls r1, r6
	add r1, r8
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	adds r1, 0x22
	strb r0, [r1]
	ldr r1, _0802D270 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x3
	strb r0, [r1, 0x1]
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r1, _0802D274 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802D292
	.align 2, 0
_0802D260: .4byte gBattleMons
_0802D264: .4byte gBattlerAttacker
_0802D268: .4byte sTerrainToType
_0802D26C: .4byte gBattleTerrain
_0802D270: .4byte gBattleTextBuff1
_0802D274: .4byte gBattlescriptCurrInstr
_0802D278:
	ldr r3, _0802D29C @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802D292:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D29C: .4byte gBattlescriptCurrInstr
	thumb_func_end atkEB_settypetoterrain

	thumb_func_start atkEC_pursuitrelated
atkEC_pursuitrelated: @ 802D2A0
	push {r4-r6,lr}
	ldr r5, _0802D314 @ =gBattlerAttacker
	ldrb r0, [r5]
	bl GetBattlerPosition
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerAtPosition
	ldr r4, _0802D318 @ =gActiveBattler
	strb r0, [r4]
	ldr r0, _0802D31C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r6, 0x1
	ands r0, r6
	cmp r0, 0
	beq _0802D340
	ldr r0, _0802D320 @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldr r2, _0802D324 @ =gBitTable
	ldrb r3, [r4]
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0802D340
	ldr r0, _0802D328 @ =gChosenActionByBattler
	adds r0, r3, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _0802D340
	ldr r1, _0802D32C @ =gChosenMoveByBattler
	lsls r0, r3, 1
	adds r0, r1
	ldrh r2, [r0]
	cmp r2, 0xE4
	bne _0802D340
	ldr r0, _0802D330 @ =gActionsByTurnOrder
	adds r0, r3, r0
	movs r1, 0xB
	strb r1, [r0]
	ldr r0, _0802D334 @ =gCurrentMove
	strh r2, [r0]
	ldr r1, _0802D338 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	ldr r0, _0802D33C @ =gBattleScripting
	strb r6, [r0, 0x18]
	ldrb r1, [r5]
	adds r0, 0x20
	strb r1, [r0]
	ldrb r0, [r4]
	strb r0, [r5]
	b _0802D35A
	.align 2, 0
_0802D314: .4byte gBattlerAttacker
_0802D318: .4byte gActiveBattler
_0802D31C: .4byte gBattleTypeFlags
_0802D320: .4byte gAbsentBattlerFlags
_0802D324: .4byte gBitTable
_0802D328: .4byte gChosenActionByBattler
_0802D32C: .4byte gChosenMoveByBattler
_0802D330: .4byte gActionsByTurnOrder
_0802D334: .4byte gCurrentMove
_0802D338: .4byte gBattlescriptCurrInstr
_0802D33C: .4byte gBattleScripting
_0802D340:
	ldr r3, _0802D360 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802D35A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D360: .4byte gBattlescriptCurrInstr
	thumb_func_end atkEC_pursuitrelated

	thumb_func_start atkED_snatchsetbattlers
atkED_snatchsetbattlers: @ 802D364
	push {r4,lr}
	ldr r1, _0802D388 @ =gEffectBattler
	ldr r3, _0802D38C @ =gBattlerAttacker
	ldrb r0, [r3]
	strb r0, [r1]
	ldr r2, _0802D390 @ =gBattlerTarget
	lsls r0, 24
	lsrs r0, 24
	adds r4, r1, 0
	ldrb r1, [r2]
	cmp r0, r1
	bne _0802D398
	ldr r1, _0802D394 @ =gBattleScripting
	ldrb r0, [r1, 0x17]
	strb r0, [r2]
	strb r0, [r3]
	b _0802D39E
	.align 2, 0
_0802D388: .4byte gEffectBattler
_0802D38C: .4byte gBattlerAttacker
_0802D390: .4byte gBattlerTarget
_0802D394: .4byte gBattleScripting
_0802D398:
	ldr r1, _0802D3B0 @ =gBattleScripting
	ldrb r0, [r1, 0x17]
	strb r0, [r2]
_0802D39E:
	ldrb r0, [r4]
	strb r0, [r1, 0x17]
	ldr r1, _0802D3B4 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D3B0: .4byte gBattleScripting
_0802D3B4: .4byte gBattlescriptCurrInstr
	thumb_func_end atkED_snatchsetbattlers

	thumb_func_start atkEE_removelightscreenreflect
atkEE_removelightscreenreflect: @ 802D3B8
	push {r4,lr}
	ldr r0, _0802D400 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0802D404 @ =gSideTimers
	lsls r3, r0, 1
	adds r0, r3, r0
	lsls r0, 2
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	bne _0802D3E0
	ldrb r1, [r4, 0x2]
	cmp r1, 0
	beq _0802D418
_0802D3E0:
	ldr r2, _0802D408 @ =gSideStatuses
	adds r2, r3, r2
	ldrh r1, [r2]
	ldr r0, _0802D40C @ =0x0000fffe
	ands r0, r1
	movs r3, 0
	ldr r1, _0802D410 @ =0x0000fffd
	ands r0, r1
	strh r0, [r2]
	strb r3, [r4]
	strb r3, [r4, 0x2]
	ldr r1, _0802D414 @ =gBattleScripting
	movs r0, 0x1
	strb r0, [r1, 0x18]
	strb r0, [r1, 0x19]
	b _0802D41E
	.align 2, 0
_0802D400: .4byte gBattlerAttacker
_0802D404: .4byte gSideTimers
_0802D408: .4byte gSideStatuses
_0802D40C: .4byte 0x0000fffe
_0802D410: .4byte 0x0000fffd
_0802D414: .4byte gBattleScripting
_0802D418:
	ldr r0, _0802D42C @ =gBattleScripting
	strb r1, [r0, 0x18]
	strb r1, [r0, 0x19]
_0802D41E:
	ldr r1, _0802D430 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D42C: .4byte gBattleScripting
_0802D430: .4byte gBattlescriptCurrInstr
	thumb_func_end atkEE_removelightscreenreflect

	thumb_func_start atkEF_handleballthrow
atkEF_handleballthrow: @ 802D434
	push {r4-r6,lr}
	movs r4, 0
	ldr r0, _0802D474 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	beq _0802D442
	b _0802D7EE
_0802D442:
	ldr r5, _0802D478 @ =gActiveBattler
	ldr r0, _0802D47C @ =gBattlerAttacker
	ldrb r0, [r0]
	strb r0, [r5]
	ldr r6, _0802D480 @ =gBattlerTarget
	movs r1, 0x1
	eors r0, r1
	strb r0, [r6]
	ldr r0, _0802D484 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _0802D490
	movs r0, 0
	movs r1, 0x6
	bl BtlController_EmitBallThrowAnim
	ldrb r0, [r5]
	bl MarkBattlerForControllerExec
	ldr r1, _0802D488 @ =gBattlescriptCurrInstr
	ldr r0, _0802D48C @ =BattleScript_GhostBallDodge
	b _0802D7EC
	.align 2, 0
_0802D474: .4byte gBattleControllerExecFlags
_0802D478: .4byte gActiveBattler
_0802D47C: .4byte gBattlerAttacker
_0802D480: .4byte gBattlerTarget
_0802D484: .4byte gBattleTypeFlags
_0802D488: .4byte gBattlescriptCurrInstr
_0802D48C: .4byte BattleScript_GhostBallDodge
_0802D490:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0802D4B4
	movs r0, 0
	movs r1, 0x5
	bl BtlController_EmitBallThrowAnim
	ldrb r0, [r5]
	bl MarkBattlerForControllerExec
	ldr r1, _0802D4AC @ =gBattlescriptCurrInstr
	ldr r0, _0802D4B0 @ =BattleScript_TrainerBallBlock
	b _0802D7EC
	.align 2, 0
_0802D4AC: .4byte gBattlescriptCurrInstr
_0802D4B0: .4byte BattleScript_TrainerBallBlock
_0802D4B4:
	movs r0, 0x81
	lsls r0, 9
	ands r1, r0
	cmp r1, 0
	beq _0802D4DC
	movs r0, 0
	movs r1, 0x4
	bl BtlController_EmitBallThrowAnim
	ldrb r0, [r5]
	bl MarkBattlerForControllerExec
	ldr r1, _0802D4D4 @ =gBattlescriptCurrInstr
	ldr r0, _0802D4D8 @ =gUnknown_81D9A88
	b _0802D7EC
	.align 2, 0
_0802D4D4: .4byte gBattlescriptCurrInstr
_0802D4D8: .4byte gUnknown_81D9A88
_0802D4DC:
	ldr r0, _0802D500 @ =gLastUsedItem
	ldrh r0, [r0]
	cmp r0, 0x5
	bne _0802D508
	ldr r0, _0802D504 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x7C
	ldrb r0, [r0]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 8
	subs r0, r1
	movs r1, 0x64
	bl __divsi3
	lsls r0, 24
	lsrs r5, r0, 24
	b _0802D520
	.align 2, 0
_0802D500: .4byte gLastUsedItem
_0802D504: .4byte gBattleStruct
_0802D508:
	ldr r3, _0802D53C @ =gBaseStats
	ldr r2, _0802D540 @ =gBattleMons
	ldrb r1, [r6]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r5, [r0, 0x8]
_0802D520:
	ldr r2, _0802D544 @ =gLastUsedItem
	ldrh r0, [r2]
	cmp r0, 0x5
	bhi _0802D52A
	b _0802D620
_0802D52A:
	subs r0, 0x6
	cmp r0, 0x6
	bls _0802D532
	b _0802D62A
_0802D532:
	lsls r0, 2
	ldr r1, _0802D548 @ =_0802D54C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802D53C: .4byte gBaseStats
_0802D540: .4byte gBattleMons
_0802D544: .4byte gLastUsedItem
_0802D548: .4byte _0802D54C
	.align 2, 0
_0802D54C:
	.4byte _0802D568
	.4byte _0802D598
	.4byte _0802D5AA
	.4byte _0802D5D8
	.4byte _0802D608
	.4byte _0802D5CA
	.4byte _0802D5CA
_0802D568:
	ldr r2, _0802D590 @ =gBattleMons
	ldr r0, _0802D594 @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r1, r0, 0
	adds r1, 0x21
	ldrb r1, [r1]
	cmp r1, 0xB
	beq _0802D5FC
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0xB
	beq _0802D5FC
	cmp r1, 0x6
	beq _0802D5FC
	cmp r0, 0x6
	beq _0802D5FC
	b _0802D5CA
	.align 2, 0
_0802D590: .4byte gBattleMons
_0802D594: .4byte gBattlerTarget
_0802D598:
	bl GetCurrentMapType
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0xA
	cmp r0, 0x5
	bne _0802D62A
	movs r4, 0x23
	b _0802D62A
_0802D5AA:
	ldr r2, _0802D5D0 @ =gBattleMons
	ldr r0, _0802D5D4 @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x2A
	ldrb r1, [r0]
	cmp r1, 0x27
	bhi _0802D5CA
	movs r0, 0x28
	subs r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bhi _0802D62A
_0802D5CA:
	movs r4, 0xA
	b _0802D62A
	.align 2, 0
_0802D5D0: .4byte gBattleMons
_0802D5D4: .4byte gBattlerTarget
_0802D5D8:
	ldr r2, _0802D600 @ =gBattleMons
	ldr r0, _0802D604 @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl GetSetPokedexFlag
	lsls r0, 24
	movs r4, 0xA
	cmp r0, 0
	beq _0802D62A
_0802D5FC:
	movs r4, 0x1E
	b _0802D62A
	.align 2, 0
_0802D600: .4byte gBattleMons
_0802D604: .4byte gBattlerTarget
_0802D608:
	ldr r0, _0802D61C @ =gBattleResults
	ldrb r0, [r0, 0x13]
	adds r0, 0xA
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x28
	bls _0802D62A
	movs r4, 0x28
	b _0802D62A
	.align 2, 0
_0802D61C: .4byte gBattleResults
_0802D620:
	ldr r1, _0802D694 @ =sBallCatchBonuses
	ldrh r0, [r2]
	subs r0, 0x2
	adds r0, r1
	ldrb r4, [r0]
_0802D62A:
	adds r0, r5, 0
	muls r0, r4
	movs r1, 0xA
	bl __divsi3
	ldr r5, _0802D698 @ =gBattleMons
	ldr r1, _0802D69C @ =gBattlerTarget
	ldrb r2, [r1]
	movs r1, 0x58
	adds r4, r2, 0
	muls r4, r1
	adds r3, r4, r5
	ldrh r2, [r3, 0x2C]
	lsls r1, r2, 1
	adds r1, r2
	ldrh r2, [r3, 0x28]
	lsls r2, 1
	subs r2, r1, r2
	muls r0, r2
	bl __divsi3
	adds r6, r0, 0
	adds r5, 0x4C
	adds r4, r5
	ldr r4, [r4]
	movs r0, 0x27
	ands r0, r4
	cmp r0, 0
	beq _0802D666
	lsls r6, 1
_0802D666:
	movs r0, 0xD8
	ands r4, r0
	cmp r4, 0
	beq _0802D67A
	lsls r0, r6, 4
	subs r0, r6
	movs r1, 0xA
	bl __udivsi3
	adds r6, r0, 0
_0802D67A:
	ldr r1, _0802D6A0 @ =gLastUsedItem
	ldrh r0, [r1]
	cmp r0, 0x5
	beq _0802D6BC
	cmp r0, 0x1
	bne _0802D6A8
	ldr r0, _0802D6A4 @ =gBattleResults
	ldrb r1, [r0, 0x5]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0, 0x5]
	b _0802D6BC
	.align 2, 0
_0802D694: .4byte sBallCatchBonuses
_0802D698: .4byte gBattleMons
_0802D69C: .4byte gBattlerTarget
_0802D6A0: .4byte gLastUsedItem
_0802D6A4: .4byte gBattleResults
_0802D6A8:
	ldr r0, _0802D700 @ =gBattleResults
	ldrh r1, [r1]
	adds r0, r1
	adds r1, r0, 0
	adds r1, 0x34
	ldrb r0, [r1]
	cmp r0, 0xFE
	bhi _0802D6BC
	adds r0, 0x1
	strb r0, [r1]
_0802D6BC:
	cmp r6, 0xFE
	bls _0802D720
	movs r0, 0
	movs r1, 0x4
	bl BtlController_EmitBallThrowAnim
	ldr r0, _0802D704 @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBattlerForControllerExec
	ldr r1, _0802D708 @ =gBattlescriptCurrInstr
	ldr r0, _0802D70C @ =BattleScript_SuccessBallThrow
	str r0, [r1]
	ldr r1, _0802D710 @ =gBattlerPartyIndexes
	ldr r0, _0802D714 @ =gBattlerTarget
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802D718 @ =gEnemyParty
	adds r0, r1
	ldr r2, _0802D71C @ =gLastUsedItem
	movs r1, 0x26
	bl SetMonData
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	beq _0802D7AE
	b _0802D7D8
	.align 2, 0
_0802D700: .4byte gBattleResults
_0802D704: .4byte gActiveBattler
_0802D708: .4byte gBattlescriptCurrInstr
_0802D70C: .4byte BattleScript_SuccessBallThrow
_0802D710: .4byte gBattlerPartyIndexes
_0802D714: .4byte gBattlerTarget
_0802D718: .4byte gEnemyParty
_0802D71C: .4byte gLastUsedItem
_0802D720:
	movs r0, 0xFF
	lsls r0, 16
	adds r1, r6, 0
	bl __udivsi3
	bl Sqrt
	lsls r0, 16
	lsrs r0, 16
	bl Sqrt
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _0802D748 @ =0x000ffff0
	adds r1, r6, 0
	bl __udivsi3
	adds r6, r0, 0
	movs r4, 0
	b _0802D752
	.align 2, 0
_0802D748: .4byte 0x000ffff0
_0802D74C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0802D752:
	cmp r4, 0x3
	bhi _0802D762
	bl Random
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r6
	bcc _0802D74C
_0802D762:
	ldr r5, _0802D7B8 @ =gLastUsedItem
	ldrh r0, [r5]
	cmp r0, 0x1
	bne _0802D76C
	movs r4, 0x4
_0802D76C:
	movs r0, 0
	adds r1, r4, 0
	bl BtlController_EmitBallThrowAnim
	ldr r0, _0802D7BC @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBattlerForControllerExec
	cmp r4, 0x4
	bne _0802D7E4
	ldr r1, _0802D7C0 @ =gBattlescriptCurrInstr
	ldr r0, _0802D7C4 @ =BattleScript_SuccessBallThrow
	str r0, [r1]
	ldr r1, _0802D7C8 @ =gBattlerPartyIndexes
	ldr r0, _0802D7CC @ =gBattlerTarget
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802D7D0 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x26
	adds r2, r5, 0
	bl SetMonData
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bne _0802D7D8
_0802D7AE:
	ldr r1, _0802D7D4 @ =gBattleCommunication
	movs r0, 0
	strb r0, [r1, 0x5]
	b _0802D7EE
	.align 2, 0
_0802D7B8: .4byte gLastUsedItem
_0802D7BC: .4byte gActiveBattler
_0802D7C0: .4byte gBattlescriptCurrInstr
_0802D7C4: .4byte BattleScript_SuccessBallThrow
_0802D7C8: .4byte gBattlerPartyIndexes
_0802D7CC: .4byte gBattlerTarget
_0802D7D0: .4byte gEnemyParty
_0802D7D4: .4byte gBattleCommunication
_0802D7D8:
	ldr r1, _0802D7E0 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _0802D7EE
	.align 2, 0
_0802D7E0: .4byte gBattleCommunication
_0802D7E4:
	ldr r0, _0802D7F4 @ =gBattleCommunication
	strb r4, [r0, 0x5]
	ldr r1, _0802D7F8 @ =gBattlescriptCurrInstr
	ldr r0, _0802D7FC @ =BattleScript_ShakeBallThrow
_0802D7EC:
	str r0, [r1]
_0802D7EE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D7F4: .4byte gBattleCommunication
_0802D7F8: .4byte gBattlescriptCurrInstr
_0802D7FC: .4byte BattleScript_ShakeBallThrow
	thumb_func_end atkEF_handleballthrow

	thumb_func_start atkF0_givecaughtmon
atkF0_givecaughtmon: @ 802D800
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _0802D870 @ =gBattlerPartyIndexes
	mov r9, r0
	ldr r5, _0802D874 @ =gBattlerAttacker
	ldrb r0, [r5]
	movs r6, 0x1
	eors r0, r6
	lsls r0, 1
	add r0, r9
	ldrh r0, [r0]
	movs r7, 0x64
	muls r0, r7
	ldr r1, _0802D878 @ =gEnemyParty
	mov r8, r1
	add r0, r8
	bl GiveMonToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0802D8EA
	bl sub_80CC7B4
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0802D88C
	ldr r0, _0802D87C @ =gBattleCommunication
	strb r1, [r0, 0x5]
	ldr r4, _0802D880 @ =gStringVar1
	ldr r0, _0802D884 @ =0x00004037
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	bl GetBoxNamePtr
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrb r0, [r5]
	eors r0, r6
	lsls r0, 1
	add r0, r9
	ldrh r0, [r0]
	muls r0, r7
	add r0, r8
	ldr r2, _0802D888 @ =gStringVar2
	movs r1, 0x2
	bl GetMonData
	b _0802D8D6
	.align 2, 0
_0802D870: .4byte gBattlerPartyIndexes
_0802D874: .4byte gBattlerAttacker
_0802D878: .4byte gEnemyParty
_0802D87C: .4byte gBattleCommunication
_0802D880: .4byte gStringVar1
_0802D884: .4byte 0x00004037
_0802D888: .4byte gStringVar2
_0802D88C:
	ldr r4, _0802D92C @ =gStringVar1
	ldr r0, _0802D930 @ =0x00004037
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	bl GetBoxNamePtr
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrb r0, [r5]
	eors r0, r6
	lsls r0, 1
	add r0, r9
	ldrh r0, [r0]
	muls r0, r7
	add r0, r8
	ldr r2, _0802D934 @ =gStringVar2
	movs r1, 0x2
	bl GetMonData
	ldr r4, _0802D938 @ =gStringVar3
	bl get_unknown_box_id
	lsls r0, 24
	lsrs r0, 24
	bl GetBoxNamePtr
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldr r1, _0802D93C @ =gBattleCommunication
	movs r0, 0x2
	strb r0, [r1, 0x5]
_0802D8D6:
	ldr r0, _0802D940 @ =0x00000834
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0802D8EA
	ldr r1, _0802D93C @ =gBattleCommunication
	ldrb r0, [r1, 0x5]
	adds r0, 0x1
	strb r0, [r1, 0x5]
_0802D8EA:
	ldr r2, _0802D944 @ =gBattleResults
	ldr r3, _0802D948 @ =gBattleMons
	ldr r0, _0802D94C @ =gBattlerAttacker
	ldrb r0, [r0]
	movs r1, 0x1
	eors r1, r0
	movs r0, 0x58
	muls r0, r1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r2, 0x28]
	ldr r0, _0802D950 @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r0
	ldrh r1, [r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802D954 @ =gEnemyParty
	adds r0, r1
	adds r2, 0x2A
	movs r1, 0x2
	bl GetMonData
	ldr r1, _0802D958 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D92C: .4byte gStringVar1
_0802D930: .4byte 0x00004037
_0802D934: .4byte gStringVar2
_0802D938: .4byte gStringVar3
_0802D93C: .4byte gBattleCommunication
_0802D940: .4byte 0x00000834
_0802D944: .4byte gBattleResults
_0802D948: .4byte gBattleMons
_0802D94C: .4byte gBattlerAttacker
_0802D950: .4byte gBattlerPartyIndexes
_0802D954: .4byte gEnemyParty
_0802D958: .4byte gBattlescriptCurrInstr
	thumb_func_end atkF0_givecaughtmon

	thumb_func_start atkF1_trysetcaughtmondexflags
atkF1_trysetcaughtmondexflags: @ 802D95C
	push {r4,r5,lr}
	ldr r4, _0802D9AC @ =gEnemyParty
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	adds r0, r5, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl GetSetPokedexFlag
	lsls r0, 24
	cmp r0, 0
	beq _0802D9B4
	ldr r3, _0802D9B0 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0802D9CE
	.align 2, 0
_0802D9AC: .4byte gEnemyParty
_0802D9B0: .4byte gBattlescriptCurrInstr
_0802D9B4:
	adds r0, r5, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	adds r2, r4, 0
	bl HandleSetPokedexFlag
	ldr r1, _0802D9D4 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802D9CE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D9D4: .4byte gBattlescriptCurrInstr
	thumb_func_end atkF1_trysetcaughtmondexflags

	thumb_func_start atkF2_displaydexinfo
atkF2_displaydexinfo: @ 802D9D8
	push {r4,r5,lr}
	sub sp, 0x18
	ldr r0, _0802DA00 @ =gEnemyParty
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _0802DA04 @ =gBattleCommunication
	ldrb r0, [r0]
	cmp r0, 0x5
	bls _0802D9F4
	b _0802DB6C
_0802D9F4:
	lsls r0, 2
	ldr r1, _0802DA08 @ =_0802DA0C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802DA00: .4byte gEnemyParty
_0802DA04: .4byte gBattleCommunication
_0802DA08: .4byte _0802DA0C
	.align 2, 0
_0802DA0C:
	.4byte _0802DA24
	.4byte _0802DA3C
	.4byte _0802DA64
	.4byte _0802DAC8
	.4byte _0802DAE0
	.4byte _0802DB58
_0802DA24:
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0802DA38 @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0802DB34
	.align 2, 0
_0802DA38: .4byte 0x00007fff
_0802DA3C:
	ldr r0, _0802DA5C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802DA4A
	b _0802DB6C
_0802DA4A:
	bl FreeAllWindowBuffers
	adds r0, r5, 0
	bl sub_8106B60
	ldr r1, _0802DA60 @ =gBattleCommunication
	strb r0, [r1, 0x1]
	b _0802DB36
	.align 2, 0
_0802DA5C: .4byte gPaletteFade
_0802DA60: .4byte gBattleCommunication
_0802DA64:
	ldr r0, _0802DAAC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802DA72
	b _0802DB6C
_0802DA72:
	ldr r0, _0802DAB0 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _0802DAB4 @ =BattleMainCB2
	cmp r1, r0
	bne _0802DB6C
	ldr r2, _0802DAB8 @ =gTasks
	ldr r4, _0802DABC @ =gBattleCommunication
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	bne _0802DB6C
	str r0, [sp, 0x10]
	movs r1, 0xC0
	lsls r1, 19
	ldr r2, _0802DAC0 @ =0x05006000
	add r0, sp, 0x10
	bl CpuSet
	ldr r0, _0802DAC4 @ =VBlankCB_Battle
	bl SetVBlankCallback
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0802DB6C
	.align 2, 0
_0802DAAC: .4byte gPaletteFade
_0802DAB0: .4byte gMain
_0802DAB4: .4byte BattleMainCB2
_0802DAB8: .4byte gTasks
_0802DABC: .4byte gBattleCommunication
_0802DAC0: .4byte 0x05006000
_0802DAC4: .4byte VBlankCB_Battle
_0802DAC8:
	bl sub_800F34C
	bl LoadBattleTextboxAndBackground
	ldr r1, _0802DADC @ =gBattle_BG3_X
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	b _0802DB34
	.align 2, 0
_0802DADC: .4byte gBattle_BG3_X
_0802DAE0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0802DB6C
	ldr r0, _0802DB40 @ =gBattleMons
	adds r1, r0, 0
	adds r1, 0xAC
	ldr r1, [r1]
	adds r0, 0xA0
	ldr r2, [r0]
	movs r0, 0x78
	str r0, [sp]
	movs r0, 0x40
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	ldr r0, _0802DB44 @ =0x0000ffff
	str r0, [sp, 0xC]
	adds r0, r5, 0
	movs r3, 0x1
	bl CreateMonPicSprite_HandleDeoxys
	str r4, [sp, 0x14]
	add r0, sp, 0x14
	ldr r1, _0802DB48 @ =gPlttBufferFaded
	ldr r2, _0802DB4C @ =0x05000080
	bl CpuSet
	ldr r0, _0802DB50 @ =0x0001ffff
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
_0802DB34:
	ldr r1, _0802DB54 @ =gBattleCommunication
_0802DB36:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0802DB6C
	.align 2, 0
_0802DB40: .4byte gBattleMons
_0802DB44: .4byte 0x0000ffff
_0802DB48: .4byte gPlttBufferFaded
_0802DB4C: .4byte 0x05000080
_0802DB50: .4byte 0x0001ffff
_0802DB54: .4byte gBattleCommunication
_0802DB58:
	ldr r0, _0802DB74 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0802DB6C
	ldr r1, _0802DB78 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_0802DB6C:
	add sp, 0x18
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802DB74: .4byte gPaletteFade
_0802DB78: .4byte gBattlescriptCurrInstr
	thumb_func_end atkF2_displaydexinfo

	thumb_func_start HandleBattleWindow
HandleBattleWindow: @ 802DB7C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	ldr r4, [sp, 0x40]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x10]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x1C]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x14]
	lsls r4, 24
	lsrs r4, 24
	mov r10, r4
	movs r1, 0
	add r0, sp, 0xC
	strh r1, [r0]
	ldr r6, [sp, 0x10]
	cmp r6, r3
	ble _0802DBB6
	b _0802DCA2
_0802DBB6:
	mov r4, r8
	adds r0, r6, 0x1
	str r0, [sp, 0x18]
	ldr r2, [sp, 0x1C]
	cmp r4, r2
	bgt _0802DC98
	add r5, sp, 0xC
	lsls r7, r6, 24
	mov r9, r7
_0802DBC8:
	ldr r0, [sp, 0x10]
	cmp r6, r0
	bne _0802DBF4
	cmp r4, r8
	bne _0802DBDC
	ldr r0, _0802DBD8 @ =0x00001022
	b _0802DC3E
	.align 2, 0
_0802DBD8: .4byte 0x00001022
_0802DBDC:
	ldr r2, [sp, 0x1C]
	cmp r4, r2
	bne _0802DBEC
	ldr r0, _0802DBE8 @ =0x00001024
	b _0802DC3E
	.align 2, 0
_0802DBE8: .4byte 0x00001024
_0802DBEC:
	ldr r0, _0802DBF0 @ =0x00001023
	b _0802DC3E
	.align 2, 0
_0802DBF0: .4byte 0x00001023
_0802DBF4:
	ldr r7, [sp, 0x14]
	cmp r6, r7
	bne _0802DC20
	cmp r4, r8
	bne _0802DC08
	ldr r0, _0802DC04 @ =0x00001028
	b _0802DC3E
	.align 2, 0
_0802DC04: .4byte 0x00001028
_0802DC08:
	ldr r0, [sp, 0x1C]
	cmp r4, r0
	bne _0802DC18
	ldr r0, _0802DC14 @ =0x0000102a
	b _0802DC3E
	.align 2, 0
_0802DC14: .4byte 0x0000102a
_0802DC18:
	ldr r0, _0802DC1C @ =0x00001029
	b _0802DC3E
	.align 2, 0
_0802DC1C: .4byte 0x00001029
_0802DC20:
	cmp r4, r8
	bne _0802DC2C
	ldr r0, _0802DC28 @ =0x00001025
	b _0802DC3E
	.align 2, 0
_0802DC28: .4byte 0x00001025
_0802DC2C:
	ldr r2, [sp, 0x1C]
	cmp r4, r2
	bne _0802DC3C
	ldr r0, _0802DC38 @ =0x00001027
	b _0802DC3E
	.align 2, 0
_0802DC38: .4byte 0x00001027
_0802DC3C:
	ldr r0, _0802DC74 @ =0x00001026
_0802DC3E:
	strh r0, [r5]
	movs r1, 0x1
	mov r0, r10
	ands r0, r1
	cmp r0, 0
	beq _0802DC4E
	movs r0, 0
	strh r0, [r5]
_0802DC4E:
	movs r0, 0x80
	mov r7, r10
	ands r0, r7
	cmp r0, 0
	beq _0802DC78
	lsls r2, r4, 24
	lsrs r2, 24
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0x1
	add r1, sp, 0xC
	mov r7, r9
	lsrs r3, r7, 24
	bl CopyToBgTilemapBufferRect_ChangePalette
	b _0802DC90
	.align 2, 0
_0802DC74: .4byte 0x00001026
_0802DC78:
	lsls r2, r4, 24
	lsrs r2, 24
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	add r1, sp, 0xC
	mov r7, r9
	lsrs r3, r7, 24
	bl CopyToBgTilemapBufferRect_ChangePalette
_0802DC90:
	adds r4, 0x1
	ldr r0, [sp, 0x1C]
	cmp r4, r0
	ble _0802DBC8
_0802DC98:
	ldr r6, [sp, 0x18]
	ldr r2, [sp, 0x14]
	cmp r6, r2
	bgt _0802DCA2
	b _0802DBB6
_0802DCA2:
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end HandleBattleWindow

	thumb_func_start BattleCreateYesNoCursorAt
BattleCreateYesNoCursorAt: @ 802DCB8
	push {lr}
	sub sp, 0x10
	add r0, sp, 0xC
	movs r2, 0x1
	strh r2, [r0]
	movs r1, 0x2
	strh r1, [r0, 0x2]
	ldr r0, _0802DCF4 @ =gBattleCommunication
	ldrb r3, [r0, 0x1]
	lsls r3, 25
	movs r0, 0x90
	lsls r0, 20
	adds r3, r0
	lsrs r3, 24
	str r2, [sp]
	str r1, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	add r1, sp, 0xC
	movs r2, 0x18
	bl CopyToBgTilemapBufferRect_ChangePalette
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_0802DCF4: .4byte gBattleCommunication
	thumb_func_end BattleCreateYesNoCursorAt

	thumb_func_start BattleDestroyYesNoCursorAt
BattleDestroyYesNoCursorAt: @ 802DCF8
	push {lr}
	sub sp, 0x10
	add r0, sp, 0xC
	movs r1, 0x20
	strh r1, [r0]
	strh r1, [r0, 0x2]
	ldr r0, _0802DD34 @ =gBattleCommunication
	ldrb r3, [r0, 0x1]
	lsls r3, 25
	movs r0, 0x90
	lsls r0, 20
	adds r3, r0
	lsrs r3, 24
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	add r1, sp, 0xC
	movs r2, 0x18
	bl CopyToBgTilemapBufferRect_ChangePalette
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_0802DD34: .4byte gBattleCommunication
	thumb_func_end BattleDestroyYesNoCursorAt

	thumb_func_start atkF3_trygivecaughtmonnick
atkF3_trygivecaughtmonnick: @ 802DD38
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r0, _0802DD5C @ =gBattleCommunication
	ldrb r1, [r0]
	adds r4, r0, 0
	cmp r1, 0x4
	bls _0802DD50
	b _0802DFA6
_0802DD50:
	lsls r0, r1, 2
	ldr r1, _0802DD60 @ =_0802DD64
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802DD5C: .4byte gBattleCommunication
_0802DD60: .4byte _0802DD64
	.align 2, 0
_0802DD64:
	.4byte _0802DD78
	.4byte _0802DDA8
	.4byte _0802DE40
	.4byte _0802DF18
	.4byte _0802DF70
_0802DD78:
	movs r4, 0
	str r4, [sp]
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl HandleBattleWindow
	ldr r0, _0802DDA0 @ =gText_BattleYesNoChoice
	movs r1, 0xE
	bl BattlePutTextOnWindow
	ldr r1, _0802DDA4 @ =gBattleCommunication
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	strb r4, [r1, 0x1]
	bl BattleCreateYesNoCursorAt
	b _0802DFA6
	.align 2, 0
_0802DDA0: .4byte gText_BattleYesNoChoice
_0802DDA4: .4byte gBattleCommunication
_0802DDA8:
	ldr r0, _0802DE1C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0802DDCC
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _0802DDCC
	movs r0, 0x5
	bl PlaySE
	bl BattleDestroyYesNoCursorAt
	movs r0, 0
	strb r0, [r4, 0x1]
	bl BattleCreateYesNoCursorAt
_0802DDCC:
	ldr r0, _0802DE1C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802DDF2
	ldr r4, _0802DE20 @ =gBattleCommunication
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _0802DDF2
	movs r0, 0x5
	bl PlaySE
	bl BattleDestroyYesNoCursorAt
	movs r0, 0x1
	strb r0, [r4, 0x1]
	bl BattleCreateYesNoCursorAt
_0802DDF2:
	ldr r0, _0802DE1C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0802DE24
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0802DE20 @ =gBattleCommunication
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _0802DE36
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0x3
	bl BeginFastPaletteFade
	b _0802DFA6
	.align 2, 0
_0802DE1C: .4byte gMain
_0802DE20: .4byte gBattleCommunication
_0802DE24:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0802DE2E
	b _0802DFA6
_0802DE2E:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0802DE3C @ =gBattleCommunication
_0802DE36:
	movs r0, 0x4
	strb r0, [r1]
	b _0802DFA6
	.align 2, 0
_0802DE3C: .4byte gBattleCommunication
_0802DE40:
	ldr r0, _0802DEFC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802DE4E
	b _0802DFA6
_0802DE4E:
	ldr r7, _0802DF00 @ =gBattlerPartyIndexes
	ldr r0, _0802DF04 @ =gBattlerAttacker
	mov r10, r0
	ldrb r0, [r0]
	movs r4, 0x1
	eors r0, r4
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	movs r1, 0x64
	mov r9, r1
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	ldr r1, _0802DF08 @ =gEnemyParty
	mov r8, r1
	add r0, r8
	ldr r1, _0802DF0C @ =gBattleStruct
	ldr r2, [r1]
	adds r2, 0x6D
	movs r1, 0x2
	bl GetMonData
	bl FreeAllWindowBuffers
	mov r2, r10
	ldrb r0, [r2]
	eors r0, r4
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	mov r1, r9
	muls r1, r0
	adds r0, r1, 0
	add r0, r8
	movs r1, 0xB
	bl GetMonData
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	mov r2, r10
	ldrb r0, [r2]
	eors r0, r4
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	mov r1, r9
	muls r1, r0
	adds r0, r1, 0
	add r0, r8
	bl GetMonGender
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	mov r2, r10
	ldrb r0, [r2]
	eors r4, r0
	lsls r4, 1
	adds r4, r7
	ldrh r0, [r4]
	mov r1, r9
	muls r1, r0
	adds r0, r1, 0
	add r0, r8
	movs r1, 0
	movs r2, 0
	bl GetMonData
	ldr r2, _0802DF0C @ =gBattleStruct
	ldr r1, [r2]
	adds r1, 0x6D
	str r0, [sp]
	ldr r0, _0802DF10 @ =BattleMainCB2
	str r0, [sp, 0x4]
	movs r0, 0x2
	adds r2, r6, 0
	adds r3, r5, 0
	bl DoNamingScreen
	ldr r1, _0802DF14 @ =gBattleCommunication
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0802DFA6
	.align 2, 0
_0802DEFC: .4byte gPaletteFade
_0802DF00: .4byte gBattlerPartyIndexes
_0802DF04: .4byte gBattlerAttacker
_0802DF08: .4byte gEnemyParty
_0802DF0C: .4byte gBattleStruct
_0802DF10: .4byte BattleMainCB2
_0802DF14: .4byte gBattleCommunication
_0802DF18:
	ldr r0, _0802DF54 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _0802DF58 @ =BattleMainCB2
	cmp r1, r0
	bne _0802DFA6
	ldr r0, _0802DF5C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0802DFA6
	ldr r2, _0802DF60 @ =gBattlerPartyIndexes
	ldr r0, _0802DF64 @ =gBattlerAttacker
	ldrb r1, [r0]
	movs r0, 0x1
	eors r0, r1
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802DF68 @ =gEnemyParty
	adds r0, r1
	ldr r1, _0802DF6C @ =gBattleStruct
	ldr r2, [r1]
	adds r2, 0x6D
	movs r1, 0x2
	bl SetMonData
	b _0802DF8C
	.align 2, 0
_0802DF54: .4byte gMain
_0802DF58: .4byte BattleMainCB2
_0802DF5C: .4byte gPaletteFade
_0802DF60: .4byte gBattlerPartyIndexes
_0802DF64: .4byte gBattlerAttacker
_0802DF68: .4byte gEnemyParty
_0802DF6C: .4byte gBattleStruct
_0802DF70:
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bne _0802DF8C
	ldr r1, _0802DF88 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802DFA6
	.align 2, 0
_0802DF88: .4byte gBattlescriptCurrInstr
_0802DF8C:
	ldr r3, _0802DFB8 @ =gBattlescriptCurrInstr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_0802DFA6:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DFB8: .4byte gBattlescriptCurrInstr
	thumb_func_end atkF3_trygivecaughtmonnick

	thumb_func_start atkF4_subattackerhpbydmg
atkF4_subattackerhpbydmg: @ 802DFBC
	ldr r2, _0802DFDC @ =gBattleMons
	ldr r0, _0802DFE0 @ =gBattlerAttacker
	ldrb r1, [r0]
	movs r0, 0x58
	muls r1, r0
	adds r1, r2
	ldr r0, _0802DFE4 @ =gBattleMoveDamage
	ldr r2, [r0]
	ldrh r0, [r1, 0x28]
	subs r0, r2
	strh r0, [r1, 0x28]
	ldr r1, _0802DFE8 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_0802DFDC: .4byte gBattleMons
_0802DFE0: .4byte gBattlerAttacker
_0802DFE4: .4byte gBattleMoveDamage
_0802DFE8: .4byte gBattlescriptCurrInstr
	thumb_func_end atkF4_subattackerhpbydmg

	thumb_func_start atkF5_removeattackerstatus1
atkF5_removeattackerstatus1: @ 802DFEC
	ldr r1, _0802E008 @ =gBattleMons
	ldr r0, _0802E00C @ =gBattlerAttacker
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x4C
	adds r0, r1
	movs r1, 0
	str r1, [r0]
	ldr r1, _0802E010 @ =gBattlescriptCurrInstr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_0802E008: .4byte gBattleMons
_0802E00C: .4byte gBattlerAttacker
_0802E010: .4byte gBattlescriptCurrInstr
	thumb_func_end atkF5_removeattackerstatus1

	thumb_func_start atkF6_finishaction
atkF6_finishaction: @ 802E014
	ldr r1, _0802E01C @ =gCurrentActionFuncId
	movs r0, 0xC
	strb r0, [r1]
	bx lr
	.align 2, 0
_0802E01C: .4byte gCurrentActionFuncId
	thumb_func_end atkF6_finishaction

	thumb_func_start atkF7_finishturn
atkF7_finishturn: @ 802E020
	ldr r1, _0802E030 @ =gCurrentActionFuncId
	movs r0, 0xC
	strb r0, [r1]
	ldr r1, _0802E034 @ =gCurrentTurnActionNumber
	ldr r0, _0802E038 @ =gBattlersCount
	ldrb r0, [r0]
	strb r0, [r1]
	bx lr
	.align 2, 0
_0802E030: .4byte gCurrentActionFuncId
_0802E034: .4byte gCurrentTurnActionNumber
_0802E038: .4byte gBattlersCount
	thumb_func_end atkF7_finishturn

	.align 2, 0 @ Don't pad with nop.
