	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start ExpandBattleTextBuffPlaceholders
ExpandBattleTextBuffPlaceholders: @ 80D8418
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	adds r7, r0, 0
	adds r6, r1, 0
	movs r5, 0x1
	movs r0, 0
	mov r8, r0
	movs r0, 0xFF
	strb r0, [r6]
	ldrb r0, [r7, 0x1]
	cmp r0, 0xFF
	bne _080D8436
	b _080D86BA
_080D8436:
	adds r0, r7, r5
	ldrb r1, [r0]
	adds r4, r0, 0
	cmp r1, 0xA
	bls _080D8442
	b _080D86B0
_080D8442:
	lsls r0, r1, 2
	ldr r1, _080D844C @ =_080D8450
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D844C: .4byte _080D8450
	.align 2, 0
_080D8450:
	.4byte _080D847C
	.4byte _080D8498
	.4byte _080D84EC
	.4byte _080D8504
	.4byte _080D8514
	.4byte _080D858C
	.4byte _080D85A0
	.4byte _080D85B2
	.4byte _080D85F8
	.4byte _080D860C
	.4byte _080D8628
_080D847C:
	adds r0, r5, r7
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldr r0, _080D8494 @ =gBattleStringsTable
	subs r1, 0xC
	lsls r1, 2
	adds r1, r0
	ldr r1, [r1]
	b _080D868E
	.align 2, 0
_080D8494: .4byte gBattleStringsTable
_080D8498:
	ldrb r0, [r4, 0x1]
	cmp r0, 0x2
	beq _080D84B4
	cmp r0, 0x2
	bgt _080D84A8
	cmp r0, 0x1
	beq _080D84AE
	b _080D84D6
_080D84A8:
	cmp r0, 0x4
	beq _080D84BC
	b _080D84D6
_080D84AE:
	ldrb r4, [r4, 0x3]
	mov r8, r4
	b _080D84D6
_080D84B4:
	ldrb r1, [r4, 0x3]
	ldrb r0, [r4, 0x4]
	lsls r0, 8
	b _080D84D2
_080D84BC:
	ldrb r0, [r4, 0x3]
	mov r8, r0
	ldrb r0, [r4, 0x4]
	lsls r0, 8
	mov r1, r8
	orrs r1, r0
	ldrb r0, [r4, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r4, 0x6]
	lsls r0, 24
_080D84D2:
	orrs r1, r0
	mov r8, r1
_080D84D6:
	adds r4, r5, r7
	ldrb r3, [r4, 0x2]
	adds r0, r6, 0
	mov r1, r8
	movs r2, 0
	bl ConvertIntToDecimalStringN
	adds r0, r5, 0x3
	ldrb r4, [r4, 0x1]
	adds r5, r0, r4
	b _080D86B0
_080D84EC:
	adds r0, r5, r7
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r1, r0
	movs r0, 0xD
	muls r1, r0
	ldr r0, _080D8500 @ =gMoveNames
	adds r1, r0
	b _080D868E
	.align 2, 0
_080D8500: .4byte gMoveNames
_080D8504:
	adds r0, r5, r7
	ldrb r0, [r0, 0x1]
	lsls r1, r0, 3
	subs r1, r0
	ldr r0, _080D8510 @ =gTypeNames
	b _080D8616
	.align 2, 0
_080D8510: .4byte gTypeNames
_080D8514:
	ldrb r0, [r4, 0x1]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080D8538
	ldrb r1, [r4, 0x2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080D8534 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	b _080D8574
	.align 2, 0
_080D8534: .4byte gPlayerParty
_080D8538:
	ldr r0, _080D8550 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080D8558
	ldr r1, _080D8554 @ =sText_FoePkmnPrefix
	adds r0, r6, 0
	bl StringAppend
	b _080D8560
	.align 2, 0
_080D8550: .4byte gBattleTypeFlags
_080D8554: .4byte sText_FoePkmnPrefix
_080D8558:
	ldr r1, _080D8584 @ =sText_WildPkmnPrefix
	adds r0, r6, 0
	bl StringAppend
_080D8560:
	adds r0, r5, r7
	ldrb r1, [r0, 0x2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080D8588 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
_080D8574:
	mov r0, sp
	bl StringGetEnd10
	adds r0, r6, 0
	mov r1, sp
	bl StringAppend
	b _080D86AE
	.align 2, 0
_080D8584: .4byte sText_WildPkmnPrefix
_080D8588: .4byte gEnemyParty
_080D858C:
	ldr r1, _080D859C @ =gUnknown_83FD5D0
	adds r0, r5, r7
	ldrb r0, [r0, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	b _080D8618
	.align 2, 0
_080D859C: .4byte gUnknown_83FD5D0
_080D85A0:
	adds r0, r5, r7
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r1, r0
	adds r0, r6, 0
	bl GetSpeciesName
	b _080D86AE
_080D85B2:
	adds r4, r5, r7
	ldrb r0, [r4, 0x1]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080D85D8
	ldrb r1, [r4, 0x2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080D85D4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2
	adds r2, r6, 0
	bl GetMonData
	b _080D85EA
	.align 2, 0
_080D85D4: .4byte gPlayerParty
_080D85D8:
	ldrb r1, [r4, 0x2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080D85F4 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2
	adds r2, r6, 0
	bl GetMonData
_080D85EA:
	adds r0, r6, 0
	bl StringGetEnd10
	b _080D86AE
	.align 2, 0
_080D85F4: .4byte gEnemyParty
_080D85F8:
	ldr r1, _080D8608 @ =gUnknown_83FD63C
	adds r0, r5, r7
	ldrb r0, [r0, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	b _080D8618
	.align 2, 0
_080D8608: .4byte gUnknown_83FD63C
_080D860C:
	adds r0, r5, r7
	ldrb r1, [r0, 0x1]
	movs r0, 0xD
	muls r1, r0
	ldr r0, _080D8624 @ =gAbilityNames
_080D8616:
	adds r1, r0
_080D8618:
	adds r0, r6, 0
	bl StringAppend
	adds r5, 0x2
	b _080D86B0
	.align 2, 0
_080D8624: .4byte gAbilityNames
_080D8628:
	adds r0, r5, r7
	ldrb r2, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r2, r0
	ldr r0, _080D8674 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D86A6
	cmp r2, 0xAF
	bne _080D869C
	ldr r2, _080D8678 @ =gLinkPlayers
	ldr r0, _080D867C @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xB5
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _080D8680 @ =gPotentialItemEffectBattler
	ldrb r2, [r1]
	ldrh r0, [r0, 0x18]
	cmp r0, r2
	bne _080D868C
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r0, _080D8684 @ =gEnigmaBerries
	adds r1, r0
	adds r0, r6, 0
	bl StringCopy
	ldr r1, _080D8688 @ =sText_BerrySuffix
	b _080D868E
	.align 2, 0
_080D8674: .4byte gBattleTypeFlags
_080D8678: .4byte gLinkPlayers
_080D867C: .4byte gBattleStruct
_080D8680: .4byte gPotentialItemEffectBattler
_080D8684: .4byte gEnigmaBerries
_080D8688: .4byte sText_BerrySuffix
_080D868C:
	ldr r1, _080D8698 @ =sText_EnigmaBerry
_080D868E:
	adds r0, r6, 0
	bl StringAppend
	b _080D86AE
	.align 2, 0
_080D8698: .4byte sText_EnigmaBerry
_080D869C:
	adds r0, r2, 0
	adds r1, r6, 0
	bl CopyItemName
	b _080D86AE
_080D86A6:
	adds r0, r2, 0
	adds r1, r6, 0
	bl CopyItemName
_080D86AE:
	adds r5, 0x3
_080D86B0:
	adds r0, r7, r5
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _080D86BA
	b _080D8436
_080D86BA:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ExpandBattleTextBuffPlaceholders

	thumb_func_start ChooseMoveUsedParticle
ChooseMoveUsedParticle: @ 80D86C8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r2, 0
	ldr r5, _080D86FC @ =gBattleMsgDataPtr
	ldr r3, _080D8700 @ =gUnknown_83FEA70
_080D86D2:
	cmp r2, 0x4
	beq _080D86E8
	ldrh r1, [r3]
	cmp r1, 0
	bne _080D86DE
	adds r2, 0x1
_080D86DE:
	ldr r0, [r5]
	adds r3, 0x2
	ldrh r0, [r0]
	cmp r1, r0
	bne _080D86D2
_080D86E8:
	cmp r2, 0
	blt _080D8714
	cmp r2, 0x2
	bgt _080D8708
	ldr r1, _080D8704 @ =gUnknown_83FE88B
	adds r0, r4, 0
	bl StringCopy
	b _080D8714
	.align 2, 0
_080D86FC: .4byte gBattleMsgDataPtr
_080D8700: .4byte gUnknown_83FEA70
_080D8704: .4byte gUnknown_83FE88B
_080D8708:
	cmp r2, 0x4
	bgt _080D8714
	ldr r1, _080D871C @ =gUnknown_83FE88F
	adds r0, r4, 0
	bl StringCopy
_080D8714:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D871C: .4byte gUnknown_83FE88F
	thumb_func_end ChooseMoveUsedParticle

	thumb_func_start ChooseTypeOfMoveUsedString
ChooseTypeOfMoveUsedString: @ 80D8720
	push {r4,r5,lr}
	adds r3, r0, 0
	movs r4, 0
	b _080D872A
_080D8728:
	adds r3, 0x1
_080D872A:
	ldrb r0, [r3]
	cmp r0, 0xFF
	bne _080D8728
	ldr r1, _080D8760 @ =gUnknown_83FEA70
	ldr r5, _080D8764 @ =gBattleMsgDataPtr
	movs r0, 0
	lsls r0, 1
	adds r2, r0, r1
_080D873A:
	cmp r4, 0x4
	beq _080D8754
	ldrh r1, [r2]
	cmp r1, 0
	bne _080D8746
	adds r4, 0x1
_080D8746:
	ldr r0, [r5]
	adds r2, 0x2
	ldrh r0, [r0]
	cmp r1, r0
	bne _080D873A
	cmp r4, 0x4
	bhi _080D87B0
_080D8754:
	lsls r0, r4, 2
	ldr r1, _080D8768 @ =_080D876C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D8760: .4byte gUnknown_83FEA70
_080D8764: .4byte gBattleMsgDataPtr
_080D8768: .4byte _080D876C
	.align 2, 0
_080D876C:
	.4byte _080D8780
	.4byte _080D8788
	.4byte _080D8790
	.4byte _080D8798
	.4byte _080D87A8
_080D8780:
	ldr r1, _080D8784 @ =sText_ExclamationMark
	b _080D879A
	.align 2, 0
_080D8784: .4byte sText_ExclamationMark
_080D8788:
	ldr r1, _080D878C @ =sText_ExclamationMark2
	b _080D879A
	.align 2, 0
_080D878C: .4byte sText_ExclamationMark2
_080D8790:
	ldr r1, _080D8794 @ =sText_ExclamationMark3
	b _080D879A
	.align 2, 0
_080D8794: .4byte sText_ExclamationMark3
_080D8798:
	ldr r1, _080D87A4 @ =sText_ExclamationMark4
_080D879A:
	adds r0, r3, 0
	bl StringCopy
	b _080D87B0
	.align 2, 0
_080D87A4: .4byte sText_ExclamationMark4
_080D87A8:
	ldr r1, _080D87B8 @ =sText_ExclamationMark5
	adds r0, r3, 0
	bl StringCopy
_080D87B0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D87B8: .4byte sText_ExclamationMark5
	thumb_func_end ChooseTypeOfMoveUsedString

	thumb_func_start BattlePutTextOnWindow
BattlePutTextOnWindow: @ 80D87BC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r4, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	movs r0, 0xC0
	mov r8, r0
	mov r1, r8
	ands r1, r7
	mov r8, r1
	movs r0, 0x3F
	ands r7, r0
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080D87F2
	ldr r0, _080D8814 @ =gUnknown_83FEB64
	lsls r1, r7, 1
	adds r1, r7
	lsls r1, 2
	adds r1, r0
	ldrb r1, [r1]
	adds r0, r7, 0
	bl FillWindowPixelBuffer
_080D87F2:
	movs r0, 0x40
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _080D881C
	bl ContextNpcGetTextColor
	lsls r0, 24
	lsrs r0, 24
	mov r2, sp
	ldr r1, _080D8818 @ =gUnknown_83FEC90
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2, 0x5]
	lsls r6, r7, 1
	b _080D882E
	.align 2, 0
_080D8814: .4byte gUnknown_83FEB64
_080D8818: .4byte gUnknown_83FEC90
_080D881C:
	mov r3, sp
	ldr r1, _080D884C @ =gUnknown_83FEB64
	lsls r2, r7, 1
	adds r0, r2, r7
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x1]
	strb r0, [r3, 0x5]
	adds r6, r2, 0
_080D882E:
	cmp r7, 0xF
	blt _080D8878
	cmp r7, 0x14
	bgt _080D8850
	ldr r0, _080D884C @ =gUnknown_83FEB64
	adds r1, r6, r7
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	ldrb r2, [r1, 0x4]
	adds r1, r4, 0
	bl GetStringWidth
	movs r1, 0x30
	b _080D8868
	.align 2, 0
_080D884C: .4byte gUnknown_83FEB64
_080D8850:
	cmp r7, 0x17
	bgt _080D8878
	ldr r0, _080D8874 @ =gUnknown_83FEB64
	adds r1, r6, r7
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	ldrb r2, [r1, 0x4]
	adds r1, r4, 0
	bl GetStringWidth
	movs r1, 0x40
_080D8868:
	subs r1, r0
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	b _080D8882
	.align 2, 0
_080D8874: .4byte gUnknown_83FEB64
_080D8878:
	ldr r1, _080D88F8 @ =gUnknown_83FEB64
	adds r0, r6, r7
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x2]
_080D8882:
	cmp r1, 0
	bge _080D8888
	movs r1, 0
_080D8888:
	str r4, [sp]
	mov r0, sp
	strb r7, [r0, 0x4]
	strb r1, [r0, 0x6]
	mov r1, sp
	ldr r0, _080D88F8 @ =gUnknown_83FEB64
	mov r12, r0
	adds r3, r6, r7
	lsls r3, 2
	add r3, r12
	ldrb r0, [r3, 0x3]
	strb r0, [r1, 0x7]
	mov r0, sp
	ldrb r0, [r0, 0x6]
	strb r0, [r1, 0x8]
	mov r0, sp
	ldrb r0, [r0, 0x7]
	strb r0, [r1, 0x9]
	ldrb r0, [r3, 0x4]
	strb r0, [r1, 0xA]
	ldrb r0, [r3, 0x5]
	strb r0, [r1, 0xB]
	mov r4, sp
	ldrb r2, [r4, 0xC]
	movs r1, 0x10
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r4, 0xC]
	mov r2, sp
	ldrb r0, [r3, 0x7]
	lsls r0, 4
	movs r5, 0xF
	strb r0, [r2, 0xC]
	ldrb r2, [r3, 0x8]
	adds r0, r5, 0
	ands r0, r2
	ldrb r2, [r4, 0xD]
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0xD]
	mov r2, sp
	ldrb r0, [r3, 0x9]
	lsls r0, 4
	ands r1, r5
	orrs r1, r0
	strb r1, [r2, 0xD]
	mov r3, r12
	cmp r7, 0x18
	bne _080D8900
	ldr r0, _080D88FC @ =gTextFlags
	ldrb r2, [r0]
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	b _080D8908
	.align 2, 0
_080D88F8: .4byte gUnknown_83FEB64
_080D88FC: .4byte gTextFlags
_080D8900:
	ldr r0, _080D8930 @ =gTextFlags
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
_080D8908:
	strb r1, [r0]
	adds r4, r0, 0
	ldr r1, _080D8934 @ =gBattleTypeFlags
	ldr r2, [r1]
	movs r0, 0x2
	ands r0, r2
	adds r5, r1, 0
	cmp r0, 0
	bne _080D8928
	movs r0, 0x80
	lsls r0, 9
	ands r2, r0
	cmp r2, 0
	beq _080D8938
	cmp r7, 0x18
	beq _080D8938
_080D8928:
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	b _080D8940
	.align 2, 0
_080D8930: .4byte gTextFlags
_080D8934: .4byte gBattleTypeFlags
_080D8938:
	ldrb r1, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
_080D8940:
	strb r0, [r4]
	cmp r7, 0
	beq _080D894A
	cmp r7, 0x18
	bne _080D8970
_080D894A:
	ldr r0, [r5]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D8958
	movs r3, 0x1
	b _080D8960
_080D8958:
	bl GetTextSpeedSetting
	lsls r0, 24
	lsrs r3, r0, 24
_080D8960:
	ldr r0, _080D896C @ =gTextFlags
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	b _080D8982
	.align 2, 0
_080D896C: .4byte gTextFlags
_080D8970:
	adds r0, r6, r7
	lsls r0, 2
	adds r0, r3
	ldrb r3, [r0, 0x6]
	ldrb r1, [r4]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
_080D8982:
	mov r0, sp
	adds r1, r3, 0
	movs r2, 0
	bl AddTextPrinter
	movs r0, 0x80
	mov r1, r8
	ands r1, r0
	cmp r1, 0
	bne _080D89A4
	adds r0, r7, 0
	bl PutWindowTilemap
	adds r0, r7, 0
	movs r1, 0x3
	bl CopyWindowToVram
_080D89A4:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end BattlePutTextOnWindow

	thumb_func_start sub_80D89B0
sub_80D89B0: @ 80D89B0
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xC
	beq _080D89CC
	ldr r0, _080D89D0 @ =0x00000177
	cmp r1, r0
	beq _080D89CC
	adds r0, 0x8
	cmp r1, r0
	beq _080D89CC
	subs r0, 0x7
	cmp r1, r0
	bne _080D89D4
_080D89CC:
	movs r0, 0x1
	b _080D89D6
	.align 2, 0
_080D89D0: .4byte 0x00000177
_080D89D4:
	movs r0, 0
_080D89D6:
	pop {r1}
	bx r1
	thumb_func_end sub_80D89B0

	thumb_func_start SetPpNumbersPaletteInMoveSelection
SetPpNumbersPaletteInMoveSelection: @ 80D89DC
	push {r4,r5,lr}
	ldr r0, _080D8A38 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r1, r2, 9
	ldr r0, _080D8A3C @ =gBattleBufferA + 4
	adds r1, r0
	ldr r4, _080D8A40 @ =gUnknown_8D2FBB4
	ldr r0, _080D8A44 @ =gMoveSelectionCursor
	adds r2, r0
	ldrb r2, [r2]
	adds r0, r1, 0
	adds r0, 0x8
	adds r0, r2
	ldrb r0, [r0]
	adds r1, 0xC
	adds r1, r2
	ldrb r1, [r1]
	bl GetCurrentPpToMaxPpState
	lsls r0, 24
	ldr r5, _080D8A48 @ =gPlttBufferUnfaded
	lsrs r0, 22
	adds r0, r4
	ldrh r1, [r0]
	adds r2, r5, 0
	adds r2, 0xB8
	strh r1, [r2]
	ldrh r0, [r0, 0x2]
	adds r5, 0xB6
	strh r0, [r5]
	ldr r4, _080D8A4C @ =gPlttBufferFaded + 0xB8
	adds r0, r2, 0
	adds r1, r4, 0
	movs r2, 0x1
	bl CpuSet
	subs r4, 0x2
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x1
	bl CpuSet
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D8A38: .4byte gActiveBattler
_080D8A3C: .4byte gBattleBufferA + 4
_080D8A40: .4byte gUnknown_8D2FBB4
_080D8A44: .4byte gMoveSelectionCursor
_080D8A48: .4byte gPlttBufferUnfaded
_080D8A4C: .4byte gPlttBufferFaded + 0xB8
	thumb_func_end SetPpNumbersPaletteInMoveSelection

	thumb_func_start GetCurrentPpToMaxPpState
GetCurrentPpToMaxPpState: @ 80D8A50
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	lsls r1, 24
	lsrs r0, r1, 24
	cmp r0, r2
	beq _080D8A98
	cmp r0, 0x2
	bhi _080D8A6A
	cmp r2, 0x1
	bhi _080D8A98
	b _080D8A72
_080D8A6A:
	cmp r0, 0x7
	bhi _080D8A7C
	cmp r2, 0x2
	bhi _080D8A98
_080D8A72:
	movs r0, 0x2
	subs r0, r2
	lsls r0, 24
	lsrs r0, 24
	b _080D8A9A
_080D8A7C:
	cmp r2, 0
	bne _080D8A84
	movs r0, 0x2
	b _080D8A9A
_080D8A84:
	lsrs r0, r1, 26
	cmp r2, r0
	bhi _080D8A8E
	movs r0, 0x1
	b _080D8A9A
_080D8A8E:
	lsrs r0, r1, 25
	cmp r3, r0
	bhi _080D8A98
	movs r0, 0
	b _080D8A9A
_080D8A98:
	movs r0, 0x3
_080D8A9A:
	pop {r1}
	bx r1
	thumb_func_end GetCurrentPpToMaxPpState

	.align 2, 0 @ Don't pad with nop.
