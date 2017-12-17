	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80423A4
sub_80423A4: @ 80423A4
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r4, r2, 0
	lsls r3, 24
	lsrs r6, r3, 24
	movs r1, 0x37
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	str r1, [sp]
	ands r0, r4
	cmp r0, 0
	beq _08042408
	mvns r4, r4
	ands r1, r4
	str r1, [sp]
	adds r0, r5, 0
	movs r1, 0x37
	mov r2, sp
	bl sub_804037C
	ldr r0, _080423FC @ =gUnknown_30030F0
	ldr r1, _08042400 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080423F6
	cmp r6, 0x4
	beq _080423F6
	ldr r0, _08042404 @ =gUnknown_2023BE4
	movs r1, 0x58
	muls r1, r6
	adds r0, 0x4C
	adds r1, r0
	ldr r0, [r1]
	ands r0, r4
	str r0, [r1]
_080423F6:
	movs r0, 0
	b _0804240A
	.align 2, 0
_080423FC: .4byte gUnknown_30030F0
_08042400: .4byte 0x00000439
_08042404: .4byte gUnknown_2023BE4
_08042408:
	movs r0, 0x1
_0804240A:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80423A4

	thumb_func_start sub_8042414
sub_8042414: @ 8042414
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	mov r8, r0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x4]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x8]
	movs r0, 0x1
	str r0, [sp, 0x10]
	movs r1, 0x6
	mov r10, r1
	movs r2, 0
	str r2, [sp, 0x18]
	movs r0, 0x4
	str r0, [sp, 0x1C]
	mov r0, r8
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	beq _08042458
	bl ItemId_GetHoldEffect
_08042458:
	ldr r1, _080424B0 @ =gUnknown_2023D6F
	ldr r0, _080424B4 @ =gUnknown_2024004
	ldrb r2, [r0]
	strb r2, [r1]
	ldr r0, _080424B8 @ =gUnknown_30030F0
	ldr r1, _080424BC @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _080424F8
	ldr r0, _080424C0 @ =gUnknown_2023BC4
	strb r2, [r0]
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	negs r1, r0
	orrs r1, r0
	lsrs r1, 31
	str r1, [sp, 0xC]
	ldr r0, _080424C4 @ =gUnknown_2023BCC
	ldr r4, [sp]
	subs r4, 0xD
	ldrb r0, [r0]
	cmp r1, r0
	bge _08042504
	ldr r2, _080424C8 @ =gUnknown_2023BCE
	lsls r0, r1, 1
	adds r0, r2
	ldrh r3, [r0]
	ldr r1, [sp, 0x4]
	lsls r0, r1, 16
	lsrs r1, r0, 16
	adds r5, r0, 0
	cmp r3, r1
	bne _080424CC
	ldr r2, [sp, 0xC]
	str r2, [sp, 0x1C]
	b _08042504
	.align 2, 0
_080424B0: .4byte gUnknown_2023D6F
_080424B4: .4byte gUnknown_2024004
_080424B8: .4byte gUnknown_30030F0
_080424BC: .4byte 0x00000439
_080424C0: .4byte gUnknown_2023BC4
_080424C4: .4byte gUnknown_2023BCC
_080424C8: .4byte gUnknown_2023BCE
_080424CC:
	ldr r0, [sp, 0xC]
	adds r0, 0x2
	str r0, [sp, 0xC]
	ldr r0, _080424F4 @ =gUnknown_2023BCC
	ldr r1, [sp, 0xC]
	ldrb r0, [r0]
	cmp r1, r0
	bge _08042504
	lsls r0, r1, 1
	adds r0, r2
	ldrh r1, [r0]
	lsrs r0, r5, 16
	cmp r1, r0
	bne _080424CC
	ldr r2, [sp, 0xC]
	lsls r0, r2, 24
	lsrs r0, 24
	str r0, [sp, 0x1C]
	b _08042504
	.align 2, 0
_080424F4: .4byte gUnknown_2023BCC
_080424F8:
	ldr r0, _08042520 @ =gUnknown_2023BC4
	strb r1, [r0]
	movs r0, 0x4
	str r0, [sp, 0x1C]
	ldr r4, [sp]
	subs r4, 0xD
_08042504:
	lsls r0, r4, 16
	lsrs r0, 16
	cmp r0, 0xA5
	bhi _08042578
	ldr r1, _08042524 @ =gUnknown_82528BC
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	bne _08042528
	ldr r1, [sp]
	cmp r1, 0xAF
	beq _0804252E
	b _08042578
	.align 2, 0
_08042520: .4byte gUnknown_2023BC4
_08042524: .4byte gUnknown_82528BC
_08042528:
	ldr r2, [sp]
	cmp r2, 0xAF
	bne _0804257C
_0804252E:
	ldr r0, _08042550 @ =gUnknown_30030F0
	ldr r1, _08042554 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08042560
	ldr r0, _08042558 @ =gUnknown_2023BC4
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _0804255C @ =gUnknown_2023F5C
	adds r0, r1
	b _0804257C
	.align 2, 0
_08042550: .4byte gUnknown_30030F0
_08042554: .4byte 0x00000439
_08042558: .4byte gUnknown_2023BC4
_0804255C: .4byte gUnknown_2023F5C
_08042560:
	ldr r0, _0804256C @ =gUnknown_3005008
	ldr r0, [r0]
	ldr r2, _08042570 @ =0x00003108
	adds r2, r0, r2
	str r2, [sp, 0x14]
	b _0804257E
	.align 2, 0
_0804256C: .4byte gUnknown_3005008
_08042570: .4byte 0x00003108
_08042574:
	movs r0, 0
	b _08042BD8
_08042578:
	movs r0, 0x1
	b _08042BD8
_0804257C:
	str r0, [sp, 0x14]
_0804257E:
	movs r0, 0
	str r0, [sp, 0xC]
_08042582:
	ldr r1, [sp, 0xC]
	cmp r1, 0x5
	bls _0804258A
	b _08042BCA
_0804258A:
	lsls r0, r1, 2
	ldr r1, _08042594 @ =_08042598
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08042594: .4byte _08042598
	.align 2, 0
_08042598:
	.4byte _080425B0
	.4byte _0804264C
	.4byte _080426A8
	.4byte _08042708
	.4byte _08042850
	.4byte _08042A6A
_080425B0:
	ldr r0, [sp, 0x14]
	ldr r1, [sp, 0xC]
	adds r2, r0, r1
	ldrb r1, [r2]
	movs r0, 0x80
	ands r0, r1
	adds r5, r2, 0
	cmp r0, 0
	beq _080425F4
	ldr r0, _0804263C @ =gUnknown_30030F0
	ldr r2, _08042640 @ =0x00000439
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080425F4
	ldr r0, [sp, 0x1C]
	cmp r0, 0x4
	beq _080425F4
	ldr r1, _08042644 @ =gUnknown_2023BE4
	movs r0, 0x58
	ldr r2, [sp, 0x1C]
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0xF0
	lsls r1, 12
	ands r0, r1
	cmp r0, 0
	beq _080425F4
	movs r0, 0
	str r0, [sp, 0x10]
_080425F4:
	ldrb r1, [r5]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0
	beq _0804261C
	ldr r1, _08042644 @ =gUnknown_2023BE4
	ldr r0, _08042648 @ =gUnknown_2023BC4
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 13
	ands r0, r1
	cmp r0, 0
	bne _0804261C
	movs r1, 0
	str r1, [sp, 0x10]
_0804261C:
	ldrb r1, [r5]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _08042628
	b _08042BCA
_08042628:
	ldr r2, _08042644 @ =gUnknown_2023BE4
	ldr r0, _08042648 @ =gUnknown_2023BC4
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrb r0, [r0, 0x19]
	lsls r0, 24
	asrs r0, 24
	b _080426F2
	.align 2, 0
_0804263C: .4byte gUnknown_30030F0
_08042640: .4byte 0x00000439
_08042644: .4byte gUnknown_2023BE4
_08042648: .4byte gUnknown_2023BC4
_0804264C:
	ldr r0, [sp, 0x14]
	ldr r1, [sp, 0xC]
	adds r2, r0, r1
	ldrb r1, [r2]
	movs r0, 0xF0
	ands r0, r1
	adds r5, r2, 0
	cmp r0, 0
	beq _08042678
	ldr r2, _080426A0 @ =gUnknown_2023BE4
	ldr r0, _080426A4 @ =gUnknown_2023BC4
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrb r0, [r0, 0x1A]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xB
	bgt _08042678
	movs r2, 0
	str r2, [sp, 0x10]
_08042678:
	ldrb r1, [r5]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _08042684
	b _08042BCA
_08042684:
	ldr r2, _080426A0 @ =gUnknown_2023BE4
	ldr r0, _080426A4 @ =gUnknown_2023BC4
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrb r0, [r0, 0x1B]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xB
	ble _0804269C
	b _08042BCA
_0804269C:
	b _08042832
	.align 2, 0
_080426A0: .4byte gUnknown_2023BE4
_080426A4: .4byte gUnknown_2023BC4
_080426A8:
	ldr r1, [sp, 0x14]
	ldr r0, [sp, 0xC]
	adds r2, r1, r0
	ldrb r1, [r2]
	movs r0, 0xF0
	ands r0, r1
	adds r5, r2, 0
	cmp r0, 0
	beq _080426D4
	ldr r2, _08042700 @ =gUnknown_2023BE4
	ldr r0, _08042704 @ =gUnknown_2023BC4
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrb r0, [r0, 0x1E]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xB
	bgt _080426D4
	movs r1, 0
	str r1, [sp, 0x10]
_080426D4:
	ldrb r1, [r5]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _080426E0
	b _08042BCA
_080426E0:
	ldr r2, _08042700 @ =gUnknown_2023BE4
	ldr r0, _08042704 @ =gUnknown_2023BC4
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrb r0, [r0, 0x1C]
	lsls r0, 24
	asrs r0, 24
_080426F2:
	cmp r0, 0xB
	ble _080426F8
	b _08042BCA
_080426F8:
	movs r2, 0
	str r2, [sp, 0x10]
	b _08042BCA
	.align 2, 0
_08042700: .4byte gUnknown_2023BE4
_08042704: .4byte gUnknown_2023BC4
_08042708:
	ldr r0, [sp, 0x14]
	ldr r1, [sp, 0xC]
	adds r2, r0, r1
	ldrb r1, [r2]
	movs r0, 0x80
	ands r0, r1
	adds r5, r2, 0
	cmp r0, 0
	beq _0804273A
	ldr r4, _08042838 @ =gUnknown_2023DE4
	ldr r0, _0804283C @ =gUnknown_2023BC4
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	bne _0804273A
	movs r2, 0
	str r2, [sp, 0x10]
_0804273A:
	ldrb r1, [r5]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08042756
	mov r0, r8
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	cmp r0, 0x64
	beq _08042756
	movs r0, 0
	str r0, [sp, 0x10]
_08042756:
	ldrb r1, [r5]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08042776
	mov r0, r8
	ldr r1, [sp, 0x4]
	movs r2, 0x7
	ldr r3, [sp, 0x1C]
	bl sub_8042BE8
	lsls r0, 24
	cmp r0, 0
	beq _08042776
	movs r1, 0
	str r1, [sp, 0x10]
_08042776:
	ldrb r1, [r5]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08042796
	ldr r2, _08042840 @ =0x00000f88
	mov r0, r8
	ldr r1, [sp, 0x4]
	ldr r3, [sp, 0x1C]
	bl sub_8042BE8
	lsls r0, 24
	cmp r0, 0
	beq _08042796
	movs r2, 0
	str r2, [sp, 0x10]
_08042796:
	ldrb r1, [r5]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080427B6
	mov r0, r8
	ldr r1, [sp, 0x4]
	movs r2, 0x10
	ldr r3, [sp, 0x1C]
	bl sub_8042BE8
	lsls r0, 24
	cmp r0, 0
	beq _080427B6
	movs r0, 0
	str r0, [sp, 0x10]
_080427B6:
	ldrb r1, [r5]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080427D6
	mov r0, r8
	ldr r1, [sp, 0x4]
	movs r2, 0x20
	ldr r3, [sp, 0x1C]
	bl sub_8042BE8
	lsls r0, 24
	cmp r0, 0
	beq _080427D6
	movs r1, 0
	str r1, [sp, 0x10]
_080427D6:
	ldrb r1, [r5]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080427F6
	mov r0, r8
	ldr r1, [sp, 0x4]
	movs r2, 0x40
	ldr r3, [sp, 0x1C]
	bl sub_8042BE8
	lsls r0, 24
	cmp r0, 0
	beq _080427F6
	movs r2, 0
	str r2, [sp, 0x10]
_080427F6:
	ldrb r1, [r5]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08042802
	b _08042BCA
_08042802:
	ldr r0, _08042844 @ =gUnknown_30030F0
	ldr r1, _08042848 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08042814
	b _08042BCA
_08042814:
	ldr r2, [sp, 0x1C]
	cmp r2, 0x4
	bne _0804281C
	b _08042BCA
_0804281C:
	ldr r1, _0804284C @ =gUnknown_2023BE4
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08042832
	b _08042BCA
_08042832:
	movs r0, 0
	str r0, [sp, 0x10]
	b _08042BCA
	.align 2, 0
_08042838: .4byte gUnknown_2023DE4
_0804283C: .4byte gUnknown_2023BC4
_08042840: .4byte 0x00000f88
_08042844: .4byte gUnknown_30030F0
_08042848: .4byte 0x00000439
_0804284C: .4byte gUnknown_2023BE4
_08042850:
	ldr r1, [sp, 0x14]
	ldr r2, [sp, 0xC]
	adds r0, r1, r2
	ldrb r7, [r0]
	movs r0, 0x20
	ands r0, r7
	cmp r0, 0
	beq _080428B6
	movs r0, 0xDF
	ands r7, r0
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	ldr r0, _080428DC @ =gUnknown_825DEA1
	ldr r1, [sp, 0x8]
	adds r0, r1, r0
	ldrb r0, [r0]
	ands r5, r0
	lsls r0, r1, 1
	lsrs r5, r0
	adds r1, 0xD
	mov r0, r8
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	ldr r2, [sp, 0x8]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	cmp r5, 0x2
	bhi _080428B6
	cmp r0, 0x4
	bls _080428B6
	movs r2, 0
	str r2, [sp, 0x10]
_080428B6:
	movs r0, 0
	mov r9, r0
	cmp r7, 0
	bne _080428C0
	b _08042BCA
_080428C0:
	movs r0, 0x1
	ands r0, r7
	cmp r0, 0
	bne _080428CA
	b _08042A5C
_080428CA:
	mov r1, r9
	cmp r1, 0x7
	bls _080428D2
	b _08042A5C
_080428D2:
	lsls r0, r1, 2
	ldr r1, _080428E0 @ =_080428E4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080428DC: .4byte gUnknown_825DEA1
_080428E0: .4byte _080428E4
	.align 2, 0
_080428E4:
	.4byte _08042904
	.4byte _08042904
	.4byte _08042934
	.4byte _08042996
	.4byte _08042A5C
	.4byte _08042A5C
	.4byte _08042A5C
	.4byte _08042A4A
_08042904:
	mov r0, r8
	bl GetMonEVCount
	lsls r0, 16
	ldr r1, _0804292C @ =0x01fd0000
	cmp r0, r1
	bls _08042914
	b _08042578
_08042914:
	ldr r0, _08042930 @ =gUnknown_825DFEA
	add r0, r9
	ldrb r1, [r0]
	mov r0, r8
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	cmp r5, 0x63
	bls _0804292A
	b _08042A5C
_0804292A:
	b _08042A3A
	.align 2, 0
_0804292C: .4byte 0x01fd0000
_08042930: .4byte gUnknown_825DFEA
_08042934:
	movs r0, 0x10
	ands r0, r7
	cmp r0, 0
	beq _08042952
	mov r0, r8
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _08042968
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	b _080429F4
_08042952:
	mov r0, r8
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _08042968
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	b _080429F4
_08042968:
	mov r0, r8
	movs r1, 0x3A
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	cmp r4, r0
	beq _08042986
	movs r0, 0
	str r0, [sp, 0x10]
_08042986:
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	movs r0, 0xEF
	ands r7, r0
	b _08042A5C
_08042996:
	movs r0, 0x2
	ands r0, r7
	cmp r0, 0
	bne _080429FA
	movs r6, 0
	movs r1, 0x1
	add r10, r1
_080429A4:
	adds r1, r6, 0
	adds r1, 0x11
	mov r0, r8
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	adds r1, r6, 0
	adds r1, 0xD
	mov r0, r8
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r6, 24
	lsrs r2, 24
	adds r0, r4, 0
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	beq _080429EA
	movs r2, 0
	str r2, [sp, 0x10]
_080429EA:
	adds r6, 0x1
	cmp r6, 0x3
	ble _080429A4
	mov r1, r10
	lsls r0, r1, 24
_080429F4:
	lsrs r0, 24
	mov r10, r0
	b _08042A5C
_080429FA:
	ldr r1, [sp, 0x8]
	adds r1, 0x11
	mov r0, r8
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	ldr r1, [sp, 0x8]
	adds r1, 0xD
	mov r0, r8
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	ldr r2, [sp, 0x8]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	beq _08042A5C
_08042A3A:
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	movs r2, 0
	str r2, [sp, 0x10]
	b _08042A5C
_08042A4A:
	mov r0, r8
	movs r1, 0x2
	ldr r2, [sp]
	bl sub_8042EC4
	lsls r0, 16
	cmp r0, 0
	beq _08042A5C
	b _08042574
_08042A5C:
	movs r0, 0x1
	add r9, r0
	lsrs r7, 1
	cmp r7, 0
	beq _08042A68
	b _080428C0
_08042A68:
	b _08042BCA
_08042A6A:
	ldr r1, [sp, 0x14]
	ldr r2, [sp, 0xC]
	adds r0, r1, r2
	ldrb r7, [r0]
	movs r0, 0
	mov r9, r0
	cmp r7, 0
	bne _08042A7C
	b _08042BCA
_08042A7C:
	movs r0, 0x1
	ands r0, r7
	cmp r0, 0
	bne _08042A86
	b _08042BBE
_08042A86:
	mov r1, r9
	cmp r1, 0x7
	bls _08042A8E
	b _08042BBE
_08042A8E:
	lsls r0, r1, 2
	ldr r1, _08042A98 @ =_08042A9C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08042A98: .4byte _08042A9C
	.align 2, 0
_08042A9C:
	.4byte _08042ABC
	.4byte _08042ABC
	.4byte _08042ABC
	.4byte _08042ABC
	.4byte _08042AF4
	.4byte _08042B4C
	.4byte _08042B68
	.4byte _08042B92
_08042ABC:
	mov r0, r8
	bl GetMonEVCount
	lsls r0, 16
	ldr r1, _08042AEC @ =0x01fd0000
	cmp r0, r1
	bls _08042ACC
	b _08042578
_08042ACC:
	ldr r0, _08042AF0 @ =gUnknown_825DFEA
	mov r1, r9
	adds r1, 0x2
	adds r1, r0
	ldrb r1, [r1]
	mov r0, r8
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	cmp r5, 0x63
	bhi _08042BBE
	movs r2, 0
	str r2, [sp, 0x10]
	b _08042BB4
	.align 2, 0
_08042AEC: .4byte 0x01fd0000
_08042AF0: .4byte gUnknown_825DFEA
_08042AF4:
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	ldr r0, _08042B48 @ =gUnknown_825DEA1
	ldr r1, [sp, 0x8]
	adds r0, r1, r0
	ldrb r0, [r0]
	ands r5, r0
	lsls r0, r1, 1
	lsrs r5, r0
	adds r1, 0xD
	mov r0, r8
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	ldr r2, [sp, 0x8]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r5, 0x2
	bhi _08042BBE
	cmp r6, 0x4
	ble _08042BBE
	movs r2, 0
	str r2, [sp, 0x10]
	b _08042BBE
	.align 2, 0
_08042B48: .4byte gUnknown_825DEA1
_08042B4C:
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	cmp r0, 0x63
	bhi _08042BB4
	ldr r0, [sp, 0x10]
	cmp r0, 0
	bne _08042BB4
	ldr r1, [sp, 0x18]
	cmp r1, 0
	bne _08042BB4
	b _08042BAC
_08042B68:
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	cmp r0, 0x63
	bls _08042BB4
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	cmp r0, 0xC7
	bhi _08042BB4
	ldr r2, [sp, 0x10]
	cmp r2, 0
	bne _08042BB4
	ldr r0, [sp, 0x18]
	cmp r0, 0
	bne _08042BB4
	b _08042BAC
_08042B92:
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	cmp r0, 0xC7
	bls _08042BB4
	ldr r1, [sp, 0x10]
	cmp r1, 0
	bne _08042BB4
	ldr r2, [sp, 0x18]
	cmp r2, 0
	bne _08042BB4
_08042BAC:
	ldr r0, [sp, 0x14]
	add r0, r10
	ldrb r0, [r0]
	str r0, [sp, 0x18]
_08042BB4:
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
_08042BBE:
	movs r0, 0x1
	add r9, r0
	lsrs r7, 1
	cmp r7, 0
	beq _08042BCA
	b _08042A7C
_08042BCA:
	ldr r1, [sp, 0xC]
	adds r1, 0x1
	str r1, [sp, 0xC]
	cmp r1, 0x5
	bgt _08042BD6
	b _08042582
_08042BD6:
	ldr r0, [sp, 0x10]
_08042BD8:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8042414

	thumb_func_start sub_8042BE8
sub_8042BE8: @ 8042BE8
	push {r4,lr}
	adds r4, r2, 0
	movs r1, 0x37
	movs r2, 0
	bl GetMonData
	ands r0, r4
	cmp r0, 0
	bne _08042BFE
	movs r0, 0
	b _08042C00
_08042BFE:
	movs r0, 0x1
_08042C00:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8042BE8

	thumb_func_start GetItemEffectParamOffset
GetItemEffectParamOffset: @ 8042C08
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r7, 0x6
	ldr r1, _08042C30 @ =gUnknown_82528BC
	adds r0, r3, 0
	subs r0, 0xD
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	bne _08042C34
	cmp r3, 0xAF
	beq _08042C38
_08042C2C:
	movs r0, 0
	b _08042D48
	.align 2, 0
_08042C30: .4byte gUnknown_82528BC
_08042C34:
	cmp r3, 0xAF
	bne _08042C46
_08042C38:
	ldr r0, _08042C58 @ =gUnknown_2023BC4
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _08042C5C @ =gUnknown_2023F5C
	adds r0, r1
_08042C46:
	mov r12, r0
	movs r2, 0
_08042C4A:
	cmp r2, 0x4
	beq _08042C6A
	cmp r2, 0x4
	ble _08042C60
	cmp r2, 0x5
	beq _08042CF4
	b _08042D3E
	.align 2, 0
_08042C58: .4byte gUnknown_2023BC4
_08042C5C: .4byte gUnknown_2023F5C
_08042C60:
	cmp r2, 0
	blt _08042D3E
	cmp r2, r4
	bne _08042D3E
	b _08042C2C
_08042C6A:
	mov r0, r12
	ldrb r3, [r0, 0x4]
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	beq _08042C7A
	movs r0, 0xDF
	ands r3, r0
_08042C7A:
	movs r6, 0
	cmp r3, 0
	beq _08042D3E
_08042C80:
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _08042CE0
	cmp r6, 0x7
	bhi _08042CE0
	lsls r0, r6, 2
	ldr r1, _08042C98 @ =_08042C9C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08042C98: .4byte _08042C9C
	.align 2, 0
_08042C9C:
	.4byte _08042CC8
	.4byte _08042CC8
	.4byte _08042CBC
	.4byte _08042CC8
	.4byte _08042CE0
	.4byte _08042CE0
	.4byte _08042CE0
	.4byte _08042CDC
_08042CBC:
	movs r0, 0x10
	ands r0, r3
	cmp r0, 0
	beq _08042CC8
	movs r0, 0xEF
	ands r3, r0
_08042CC8:
	cmp r2, r4
	bne _08042CD4
	adds r0, r3, 0
	ands r0, r5
	cmp r0, 0
	bne _08042D46
_08042CD4:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	b _08042CE0
_08042CDC:
	cmp r2, r4
	beq _08042C2C
_08042CE0:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	lsrs r3, 1
	cmp r2, r4
	bne _08042CEE
	lsrs r5, 1
_08042CEE:
	cmp r3, 0
	bne _08042C80
	b _08042D3E
_08042CF4:
	mov r0, r12
	ldrb r3, [r0, 0x5]
	movs r6, 0
_08042CFA:
	cmp r3, 0
	beq _08042D3E
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _08042D2E
	cmp r6, 0
	blt _08042D2E
	cmp r6, 0x6
	ble _08042D14
	cmp r6, 0x7
	beq _08042D28
	b _08042D2E
_08042D14:
	cmp r2, r4
	bne _08042D20
	adds r0, r3, 0
	ands r0, r5
	cmp r0, 0
	bne _08042D46
_08042D20:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	b _08042D2E
_08042D28:
	cmp r2, r4
	bne _08042D2E
	b _08042C2C
_08042D2E:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	lsrs r3, 1
	cmp r2, r4
	bne _08042CFA
	lsrs r5, 1
	b _08042CFA
_08042D3E:
	adds r2, 0x1
	cmp r2, 0x5
	bgt _08042D46
	b _08042C4A
_08042D46:
	adds r0, r7, 0
_08042D48:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetItemEffectParamOffset

	thumb_func_start sub_8042D50
sub_8042D50: @ 8042D50
	push {lr}
	ldr r2, _08042D84 @ =gUnknown_2023D6C
	ldr r1, _08042D88 @ =gUnknown_2024004
	ldrb r1, [r1]
	strb r1, [r2]
	ldr r3, _08042D8C @ =gUnknown_2022AB8
	ldr r2, _08042D90 @ =gUnknown_83FD5D0
	ldr r1, _08042D94 @ =gUnknown_825DFF0
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r1, [r0]
	adds r0, r3, 0
	bl StringCopy
	ldr r0, _08042D98 @ =gUnknown_2022AC8
	ldr r1, _08042D9C @ =gUnknown_83FCB4A
	bl StringCopy
	ldr r0, _08042DA0 @ =gUnknown_83FCB6A
	bl BattleStringExpandPlaceholdersToDisplayedString
	pop {r0}
	bx r0
	.align 2, 0
_08042D84: .4byte gUnknown_2023D6C
_08042D88: .4byte gUnknown_2024004
_08042D8C: .4byte gUnknown_2022AB8
_08042D90: .4byte gUnknown_83FD5D0
_08042D94: .4byte gUnknown_825DFF0
_08042D98: .4byte gUnknown_2022AC8
_08042D9C: .4byte gUnknown_83FCB4A
_08042DA0: .4byte gUnknown_83FCB6A
	thumb_func_end sub_8042D50

	thumb_func_start sub_8042DA4
sub_8042DA4: @ 8042DA4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _08042DF8
	ldr r0, _08042DD4 @ =gUnknown_30030F0
	ldr r1, _08042DD8 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08042DE4
	ldr r2, _08042DDC @ =gUnknown_2024004
	ldrb r1, [r2]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _08042DE0 @ =gUnknown_2023F5C
	adds r7, r0, r1
	b _08042E04
	.align 2, 0
_08042DD4: .4byte gUnknown_30030F0
_08042DD8: .4byte 0x00000439
_08042DDC: .4byte gUnknown_2024004
_08042DE0: .4byte gUnknown_2023F5C
_08042DE4:
	ldr r0, _08042DF0 @ =gUnknown_3005008
	ldr r0, [r0]
	ldr r1, _08042DF4 @ =0x00003108
	adds r7, r0, r1
	b _08042E02
	.align 2, 0
_08042DF0: .4byte gUnknown_3005008
_08042DF4: .4byte 0x00003108
_08042DF8:
	ldr r1, _08042E3C @ =gUnknown_82528BC
	subs r0, 0xD
	lsls r0, 2
	adds r0, r1
	ldr r7, [r0]
_08042E02:
	ldr r2, _08042E40 @ =gUnknown_2024004
_08042E04:
	ldr r1, _08042E44 @ =gUnknown_2023D6F
	ldrb r0, [r2]
	strb r0, [r1]
	movs r5, 0
	ldr r0, _08042E48 @ =gUnknown_2023D6B
	mov r8, r0
	movs r6, 0
_08042E12:
	adds r4, r7, r5
	ldrb r1, [r4]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	beq _08042E24
	adds r0, r6, 0
	bl sub_8042D50
_08042E24:
	ldrb r1, [r4]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	beq _08042E5A
	cmp r5, 0
	beq _08042E4C
	adds r0, r6, 0x1
	bl sub_8042D50
	b _08042E5A
	.align 2, 0
_08042E3C: .4byte gUnknown_82528BC
_08042E40: .4byte gUnknown_2024004
_08042E44: .4byte gUnknown_2023D6F
_08042E48: .4byte gUnknown_2023D6B
_08042E4C:
	ldr r0, _08042E88 @ =gUnknown_2024004
	ldrb r0, [r0]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _08042E8C @ =gUnknown_83FBBE9
	bl BattleStringExpandPlaceholdersToDisplayedString
_08042E5A:
	adds r6, 0x2
	adds r5, 0x1
	cmp r5, 0x2
	ble _08042E12
	ldrb r1, [r7, 0x3]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08042E7A
	ldr r1, _08042E90 @ =gUnknown_2023D6B
	ldr r0, _08042E88 @ =gUnknown_2024004
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08042E94 @ =gUnknown_83FBBB4
	bl BattleStringExpandPlaceholdersToDisplayedString
_08042E7A:
	ldr r0, _08042E98 @ =gUnknown_202298C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08042E88: .4byte gUnknown_2024004
_08042E8C: .4byte gUnknown_83FBBE9
_08042E90: .4byte gUnknown_2023D6B
_08042E94: .4byte gUnknown_83FBBB4
_08042E98: .4byte gUnknown_202298C
	thumb_func_end sub_8042DA4

	thumb_func_start GetNature
GetNature: @ 8042E9C
	push {lr}
	movs r1, 0
	movs r2, 0
	bl GetMonData
	movs r1, 0x19
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetNature

	thumb_func_start GetNatureFromPersonality
GetNatureFromPersonality: @ 8042EB4
	push {lr}
	movs r1, 0x19
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetNatureFromPersonality

	thumb_func_start sub_8042EC4
sub_8042EC4: @ 8042EC4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r8, r0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 16
	lsrs r2, 16
	mov r9, r2
	movs r0, 0
	mov r10, r0
	mov r0, r8
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	mov r0, r8
	movs r1, 0xC
	movs r2, 0
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	mov r0, r8
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x17
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
	lsrs r4, 16
	str r4, [sp, 0x10]
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, 0xAF
	bne _08042F38
	ldr r0, _08042F30 @ =gUnknown_3005008
	ldr r0, [r0]
	ldr r1, _08042F34 @ =0x0000311a
	adds r0, r1
	ldrb r0, [r0]
	b _08042F40
	.align 2, 0
_08042F30: .4byte gUnknown_3005008
_08042F34: .4byte 0x0000311a
_08042F38:
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r0, 24
_08042F40:
	cmp r0, 0x26
	bne _08042F4C
	cmp r5, 0x3
	beq _08042F4C
	movs r0, 0
	b _080431A4
_08042F4C:
	cmp r5, 0x1
	bne _08042F52
	b _0804311E
_08042F52:
	cmp r5, 0x1
	bgt _08042F5C
	cmp r5, 0
	beq _08042F70
	b _080431A2
_08042F5C:
	cmp r5, 0x3
	ble _08042F62
	b _080431A2
_08042F62:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r3, _08042F6C @ =gUnknown_8259754
	lsls r6, r7, 2
	b _08043182
	.align 2, 0
_08042F6C: .4byte gUnknown_8259754
_08042F70:
	mov r0, r8
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r6, r7, 2
_08042F96:
	ldr r1, _08042FBC @ =gUnknown_8259754
	ldr r0, [sp, 0x4]
	lsls r2, r0, 3
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r2, r0
	adds r0, r1
	ldrh r0, [r0]
	subs r0, 0x1
	adds r3, r1, 0
	cmp r0, 0xE
	bls _08042FB0
	b _08043110
_08042FB0:
	lsls r0, 2
	ldr r1, _08042FC0 @ =_08042FC4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08042FBC: .4byte gUnknown_8259754
_08042FC0: .4byte _08042FC4
	.align 2, 0
_08042FC4:
	.4byte _08043000
	.4byte _08043110
	.4byte _08043110
	.4byte _08043016
	.4byte _08043110
	.4byte _08043110
	.4byte _08043110
	.4byte _08043026
	.4byte _08043050
	.4byte _0804307A
	.4byte _080430A8
	.4byte _080430C8
	.4byte _080430EC
	.4byte _08043110
	.4byte _080430FC
_08043000:
	ldr r1, [sp, 0x8]
	cmp r1, 0xDB
	bhi _08043008
	b _08043110
_08043008:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r2, r0
	adds r0, r3
	ldrh r0, [r0, 0x4]
	mov r10, r0
	b _08043110
_08043016:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r2, r0
	adds r1, r0, r3
	ldrh r0, [r1, 0x2]
	cmp r0, r9
	bhi _08043110
	b _0804310C
_08043026:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r2, r0
	adds r5, r0, r3
	ldrh r0, [r5, 0x2]
	cmp r0, r9
	bhi _08043110
	mov r0, r8
	movs r1, 0x3B
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x3C
	movs r2, 0
	bl GetMonData
	cmp r4, r0
	bls _08043110
	b _080430A2
_08043050:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r2, r0
	adds r5, r0, r3
	ldrh r0, [r5, 0x2]
	cmp r0, r9
	bhi _08043110
	mov r0, r8
	movs r1, 0x3B
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x3C
	movs r2, 0
	bl GetMonData
	cmp r4, r0
	bne _08043110
	b _080430A2
_0804307A:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r2, r0
	adds r5, r0, r3
	ldrh r0, [r5, 0x2]
	cmp r0, r9
	bhi _08043110
	mov r0, r8
	movs r1, 0x3B
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x3C
	movs r2, 0
	bl GetMonData
	cmp r4, r0
	bcs _08043110
_080430A2:
	ldrh r5, [r5, 0x4]
	mov r10, r5
	b _08043110
_080430A8:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r2, r0
	adds r4, r0, r3
	ldrh r0, [r4, 0x2]
	cmp r0, r9
	bhi _08043110
	ldr r0, [sp, 0x10]
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bhi _08043110
	b _080430E6
_080430C8:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r2, r0
	adds r4, r0, r3
	ldrh r0, [r4, 0x2]
	cmp r0, r9
	bhi _08043110
	ldr r0, [sp, 0x10]
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bls _08043110
_080430E6:
	ldrh r4, [r4, 0x4]
	mov r10, r4
	b _08043110
_080430EC:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r2, r0
	adds r1, r0, r3
	ldrh r0, [r1, 0x2]
	cmp r0, r9
	bhi _08043110
	b _0804310C
_080430FC:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r2, r0
	adds r1, r0, r3
	ldrh r0, [r1, 0x2]
	ldr r2, [sp, 0xC]
	cmp r0, r2
	bhi _08043110
_0804310C:
	ldrh r1, [r1, 0x4]
	mov r10, r1
_08043110:
	ldr r0, [sp, 0x4]
	adds r0, 0x1
	str r0, [sp, 0x4]
	cmp r0, 0x4
	bgt _0804311C
	b _08042F96
_0804311C:
	b _080431A2
_0804311E:
	movs r1, 0
	str r1, [sp, 0x4]
	lsls r6, r7, 2
	ldr r1, _08043138 @ =gUnknown_8259754
	adds r0, r6, r7
	lsls r0, 3
	adds r4, r0, r1
_0804312C:
	ldrh r0, [r4]
	cmp r0, 0x5
	beq _0804313C
	cmp r0, 0x6
	beq _08043142
	b _0804316E
	.align 2, 0
_08043138: .4byte gUnknown_8259754
_0804313C:
	ldrh r2, [r4, 0x4]
	mov r10, r2
	b _0804316E
_08043142:
	ldrh r1, [r4, 0x2]
	mov r0, sp
	ldrh r0, [r0]
	cmp r1, r0
	bne _0804316E
	ldrh r0, [r4, 0x4]
	mov r10, r0
	bl sub_806E25C
	cmp r0, 0
	bne _0804315E
	mov r1, r10
	cmp r1, 0x97
	bhi _0804316E
_0804315E:
	movs r1, 0
	mov r0, sp
	strh r1, [r0]
	mov r0, r8
	movs r1, 0xC
	mov r2, sp
	bl sub_804037C
_0804316E:
	adds r4, 0x8
	ldr r2, [sp, 0x4]
	adds r2, 0x1
	str r2, [sp, 0x4]
	cmp r2, 0x4
	ble _0804312C
	b _080431A2
_0804317C:
	ldrh r1, [r1, 0x4]
	mov r10, r1
	b _080431A2
_08043182:
	adds r0, r6, r7
	ldr r1, [sp, 0x4]
	adds r0, r1
	lsls r0, 3
	adds r1, r0, r3
	ldrh r0, [r1]
	cmp r0, 0x7
	bne _08043198
	ldrh r0, [r1, 0x2]
	cmp r0, r9
	beq _0804317C
_08043198:
	ldr r2, [sp, 0x4]
	adds r2, 0x1
	str r2, [sp, 0x4]
	cmp r2, 0x4
	ble _08043182
_080431A2:
	mov r0, r10
_080431A4:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8042EC4

	thumb_func_start sub_80431B4
sub_80431B4: @ 80431B4
	push {r4,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _080431F8
	movs r1, 0
	ldr r3, _080431F0 @ =gUnknown_8251CB8
	ldrh r0, [r3]
	cmp r0, r2
	beq _080431E0
	movs r4, 0xCD
	lsls r4, 1
_080431CC:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r4
	bhi _080431E0
	lsls r0, r1, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _080431CC
_080431E0:
	ldr r0, _080431F4 @ =0x0000019b
	cmp r1, r0
	beq _080431F8
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	b _080431FA
	.align 2, 0
_080431F0: .4byte gUnknown_8251CB8
_080431F4: .4byte 0x0000019b
_080431F8:
	movs r0, 0
_080431FA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80431B4

	thumb_func_start NationalPokedexNumToSpecies
NationalPokedexNumToSpecies: @ 8043200
	push {r4,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08043244
	movs r1, 0
	ldr r3, _0804323C @ =gUnknown_8251FEE
	ldrh r0, [r3]
	cmp r0, r2
	beq _0804322C
	movs r4, 0xCD
	lsls r4, 1
_08043218:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r4
	bhi _0804322C
	lsls r0, r1, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _08043218
_0804322C:
	ldr r0, _08043240 @ =0x0000019b
	cmp r1, r0
	beq _08043244
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	b _08043246
	.align 2, 0
_0804323C: .4byte gUnknown_8251FEE
_08043240: .4byte 0x0000019b
_08043244:
	movs r0, 0
_08043246:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end NationalPokedexNumToSpecies

	thumb_func_start sub_804324C
sub_804324C: @ 804324C
	push {r4,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08043290
	movs r1, 0
	ldr r3, _08043288 @ =gUnknown_8252324
	ldrh r0, [r3]
	cmp r0, r2
	beq _08043278
	movs r4, 0xCD
	lsls r4, 1
_08043264:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r4
	bhi _08043278
	lsls r0, r1, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _08043264
_08043278:
	ldr r0, _0804328C @ =0x0000019b
	cmp r1, r0
	beq _08043290
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	b _08043292
	.align 2, 0
_08043288: .4byte gUnknown_8252324
_0804328C: .4byte 0x0000019b
_08043290:
	movs r0, 0
_08043292:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_804324C

	thumb_func_start SpeciesToNationalPokedexNum
SpeciesToNationalPokedexNum: @ 8043298
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _080432B4
	ldr r0, _080432B0 @ =gUnknown_8251FEE
	subs r1, 0x1
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	b _080432B6
	.align 2, 0
_080432B0: .4byte gUnknown_8251FEE
_080432B4:
	movs r0, 0
_080432B6:
	pop {r1}
	bx r1
	thumb_func_end SpeciesToNationalPokedexNum

	thumb_func_start SpeciesToHoennPokedexNum
SpeciesToHoennPokedexNum: @ 80432BC
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _080432D8
	ldr r0, _080432D4 @ =gUnknown_8251CB8
	subs r1, 0x1
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	b _080432DA
	.align 2, 0
_080432D4: .4byte gUnknown_8251CB8
_080432D8:
	movs r0, 0
_080432DA:
	pop {r1}
	bx r1
	thumb_func_end SpeciesToHoennPokedexNum

	thumb_func_start HoennToNationalOrder
HoennToNationalOrder: @ 80432E0
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _080432FC
	ldr r0, _080432F8 @ =gUnknown_8252324
	subs r1, 0x1
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	b _080432FE
	.align 2, 0
_080432F8: .4byte gUnknown_8252324
_080432FC:
	movs r0, 0
_080432FE:
	pop {r1}
	bx r1
	thumb_func_end HoennToNationalOrder

	thumb_func_start SpeciesToCryId
SpeciesToCryId: @ 8043304
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, 0
	cmp r0, 0xFA
	bls _08043332
	ldr r0, _08043324 @ =0x00000113
	cmp r1, r0
	bls _08043330
	ldr r0, _08043328 @ =gUnknown_82539D4
	ldr r2, _0804332C @ =0xfffffeec
	adds r1, r2
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	b _08043332
	.align 2, 0
_08043324: .4byte 0x00000113
_08043328: .4byte gUnknown_82539D4
_0804332C: .4byte 0xfffffeec
_08043330:
	movs r0, 0xC8
_08043332:
	pop {r1}
	bx r1
	thumb_func_end SpeciesToCryId

	thumb_func_start sub_8043338
sub_8043338: @ 8043338
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r6, r1, 0
	mov r10, r2
	lsls r0, 16
	movs r1, 0x9A
	lsls r1, 17
	cmp r0, r1
	bne _08043446
	ldr r0, _08043408 @ =gUnknown_202401C
	ldr r1, [r0]
	ldr r0, [r1, 0x4]
	cmp r10, r0
	beq _08043446
	ldr r0, [r1, 0xC]
	cmp r10, r0
	beq _08043446
	movs r5, 0
_08043364:
	lsls r3, r5, 3
	adds r3, r5
	lsls r3, 2
	ldr r0, _0804340C @ =gUnknown_825265C
	adds r4, r3, r0
	ldrb r1, [r4]
	adds r1, 0xF8
	movs r2, 0xF
	adds r0, r6, 0
	ands r0, r2
	adds r1, r0
	lsls r1, 24
	lsrs r1, 24
	mov r12, r1
	ldrb r1, [r4, 0x1]
	adds r1, 0xF8
	movs r0, 0xF0
	ands r0, r6
	lsrs r0, 4
	adds r1, r0
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	lsrs r6, 8
	str r6, [sp, 0x4]
	adds r5, 0x1
	str r5, [sp]
	mov r9, r3
_0804339C:
	lsls r0, r2, 1
	add r0, r9
	ldr r3, _08043410 @ =gUnknown_825265E
	adds r0, r3
	ldrh r3, [r0]
	mov r4, r12
	adds r0, r4, 0
	adds r0, 0x10
	adds r7, r1, 0x1
	adds r2, 0x1
	mov r8, r2
	cmp r4, r0
	bge _08043434
	lsrs r0, r1, 3
	lsls r6, r0, 8
	movs r0, 0x7
	ands r1, r0
	lsls r5, r1, 2
_080433C0:
	adds r0, r4, 0
	cmp r4, 0
	bge _080433C8
	adds r0, r4, 0x7
_080433C8:
	asrs r0, 3
	lsls r2, r0, 5
	add r2, r10
	lsls r0, 3
	subs r0, r4, r0
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r2, r0
	adds r2, r6
	adds r2, r5
	movs r1, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08043428
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08043414
	ldrb r1, [r2]
	movs r0, 0xF0
	ands r0, r1
	subs r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x20
	bhi _08043428
	adds r0, r1, 0
	adds r0, 0x40
	b _08043426
	.align 2, 0
_08043408: .4byte gUnknown_202401C
_0804340C: .4byte gUnknown_825265C
_08043410: .4byte gUnknown_825265E
_08043414:
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bhi _08043428
	adds r0, r1, 0x4
_08043426:
	strb r0, [r2]
_08043428:
	asrs r3, 1
	adds r4, 0x1
	mov r0, r12
	adds r0, 0x10
	cmp r4, r0
	blt _080433C0
_08043434:
	lsls r0, r7, 24
	lsrs r1, r0, 24
	mov r2, r8
	cmp r2, 0xF
	ble _0804339C
	ldr r6, [sp, 0x4]
	ldr r5, [sp]
	cmp r5, 0x3
	ble _08043364
_08043446:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8043338

	thumb_func_start DrawSpindaSpots
DrawSpindaSpots: @ 8043458
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r5, r1, 0
	str r2, [sp]
	lsls r0, 16
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0x9A
	lsls r1, 17
	cmp r0, r1
	bne _0804355A
	cmp r3, 0
	beq _0804355A
	movs r6, 0
_0804347C:
	lsls r3, r6, 3
	adds r3, r6
	lsls r3, 2
	ldr r0, _08043520 @ =gUnknown_825265C
	adds r4, r3, r0
	ldrb r1, [r4]
	adds r1, 0xF8
	movs r2, 0xF
	adds r0, r5, 0
	ands r0, r2
	adds r1, r0
	lsls r1, 24
	lsrs r1, 24
	mov r12, r1
	ldrb r1, [r4, 0x1]
	adds r1, 0xF8
	movs r0, 0xF0
	ands r0, r5
	lsrs r0, 4
	adds r1, r0
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	lsrs r5, 8
	str r5, [sp, 0x4]
	adds r6, 0x1
	mov r10, r6
	mov r9, r3
_080434B4:
	lsls r0, r2, 1
	add r0, r9
	ldr r3, _08043524 @ =gUnknown_825265E
	adds r0, r3
	ldrh r3, [r0]
	mov r4, r12
	adds r0, r4, 0
	adds r0, 0x10
	adds r7, r1, 0x1
	adds r2, 0x1
	mov r8, r2
	cmp r4, r0
	bge _08043548
	lsrs r0, r1, 3
	lsls r6, r0, 8
	movs r0, 0x7
	ands r1, r0
	lsls r5, r1, 2
_080434D8:
	adds r0, r4, 0
	cmp r4, 0
	bge _080434E0
	adds r0, r4, 0x7
_080434E0:
	asrs r0, 3
	lsls r2, r0, 5
	ldr r1, [sp]
	adds r2, r1, r2
	lsls r0, 3
	subs r0, r4, r0
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r2, r0
	adds r2, r6
	adds r2, r5
	movs r1, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0804353C
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08043528
	ldrb r1, [r2]
	movs r0, 0xF0
	ands r0, r1
	subs r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x20
	bhi _0804353C
	adds r0, r1, 0
	adds r0, 0x40
	b _0804353A
	.align 2, 0
_08043520: .4byte gUnknown_825265C
_08043524: .4byte gUnknown_825265E
_08043528:
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bhi _0804353C
	adds r0, r1, 0x4
_0804353A:
	strb r0, [r2]
_0804353C:
	asrs r3, 1
	adds r4, 0x1
	mov r0, r12
	adds r0, 0x10
	cmp r4, r0
	blt _080434D8
_08043548:
	lsls r0, r7, 24
	lsrs r1, r0, 24
	mov r2, r8
	cmp r2, 0xF
	ble _080434B4
	ldr r5, [sp, 0x4]
	mov r6, r10
	cmp r6, 0x3
	ble _0804347C
_0804355A:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end DrawSpindaSpots

	thumb_func_start EvolutionRenameMon
EvolutionRenameMon: @ 804356C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	ldr r0, _080435D8 @ =gUnknown_2021CD0
	mov r9, r0
	adds r0, r5, 0
	movs r1, 0x2
	mov r2, r9
	bl GetMonData
	mov r4, sp
	adds r0, r5, 0
	movs r1, 0x3
	mov r2, sp
	bl GetMonData
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080435C8
	movs r6, 0xB
	adds r0, r7, 0
	muls r0, r6
	ldr r4, _080435DC @ =gUnknown_8245EE0
	adds r0, r4
	mov r1, r9
	bl StringCompare
	cmp r0, 0
	bne _080435C8
	mov r2, r8
	muls r2, r6
	adds r2, r4
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_804037C
_080435C8:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080435D8: .4byte gUnknown_2021CD0
_080435DC: .4byte gUnknown_8245EE0
	thumb_func_end EvolutionRenameMon

	thumb_func_start sub_80435E0
sub_80435E0: @ 80435E0
	push {r4,r5,lr}
	movs r5, 0
	ldr r4, _08043608 @ =gUnknown_202273C
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1, 0x18]
	cmp r0, 0x2
	bgt _0804360C
	cmp r0, 0x1
	bge _08043614
	cmp r0, 0
	beq _08043610
	b _08043616
	.align 2, 0
_08043608: .4byte gUnknown_202273C
_0804360C:
	cmp r0, 0x3
	bne _08043616
_08043610:
	movs r5, 0
	b _08043616
_08043614:
	movs r5, 0x1
_08043616:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80435E0

	thumb_func_start sub_8043620
sub_8043620: @ 8043620
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	ldr r2, _08043644 @ =gUnknown_202273C
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x18]
	cmp r0, 0x2
	bgt _08043648
	cmp r0, 0x1
	bge _08043650
	cmp r0, 0
	beq _0804364C
	b _08043652
	.align 2, 0
_08043644: .4byte gUnknown_202273C
_08043648:
	cmp r0, 0x3
	bne _08043652
_0804364C:
	movs r3, 0
	b _08043652
_08043650:
	movs r3, 0x1
_08043652:
	adds r0, r3, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8043620

	thumb_func_start GetBankMultiplayerId
GetBankMultiplayerId: @ 8043658
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r1, _08043664 @ =gUnknown_202273C
	b _08043670
	.align 2, 0
_08043664: .4byte gUnknown_202273C
_08043668:
	adds r1, 0x1C
	adds r2, 0x1
	cmp r2, 0x3
	bgt _08043676
_08043670:
	ldrh r0, [r1, 0x18]
	cmp r0, r3
	bne _08043668
_08043676:
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end GetBankMultiplayerId

	thumb_func_start sub_804367C
sub_804367C: @ 804367C
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08043694 @ =gUnknown_823EAC8
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r1, [r1, 0x2]
	movs r0, 0x7F
	ands r0, r1
	bx lr
	.align 2, 0
_08043694: .4byte gUnknown_823EAC8
	thumb_func_end sub_804367C

	thumb_func_start nature_stat_mod
nature_stat_mod: @ 8043698
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r2, 24
	lsrs r5, r2, 24
	movs r0, 0xFF
	lsls r0, 24
	adds r2, r0
	lsrs r2, 24
	cmp r2, 0x4
	bls _080436B6
	adds r0, r3, 0
	b _080436F2
_080436B6:
	ldr r0, _080436D8 @ =gUnknown_8252B48
	lsls r1, r4, 2
	adds r1, r4
	subs r1, 0x1
	adds r1, r5, r1
	adds r1, r0
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080436DC
	cmp r1, 0x1
	bne _080436F0
	movs r0, 0x6E
	b _080436DE
	.align 2, 0
_080436D8: .4byte gUnknown_8252B48
_080436DC:
	movs r0, 0x5A
_080436DE:
	muls r0, r3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	b _080436F2
_080436F0:
	adds r0, r3, 0
_080436F2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end nature_stat_mod

	thumb_func_start sub_80436F8
sub_80436F8: @ 80436F8
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r7, 0
	movs r1, 0xC
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _08043758
	ldr r0, _08043738 @ =gUnknown_30030F0
	ldr r1, _0804373C @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08043744
	ldr r0, _08043740 @ =gUnknown_2023F54
	ldrb r4, [r0, 0x7]
	b _08043760
	.align 2, 0
_08043738: .4byte gUnknown_30030F0
_0804373C: .4byte 0x00000439
_08043740: .4byte gUnknown_2023F54
_08043744:
	ldr r0, _08043750 @ =gUnknown_3005008
	ldr r0, [r0]
	ldr r1, _08043754 @ =0x0000311a
	adds r0, r1
	ldrb r4, [r0]
	b _08043760
	.align 2, 0
_08043750: .4byte gUnknown_3005008
_08043754: .4byte 0x0000311a
_08043758:
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r4, r0, 24
_08043760:
	cmp r6, 0
	bne _08043766
	b _08043876
_08043766:
	movs r0, 0xCE
	lsls r0, 1
	cmp r6, r0
	bne _08043770
	b _08043876
_08043770:
	movs r6, 0
	adds r0, r7, 0
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r1, sp
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x63
	ble _0804378E
	movs r6, 0x1
_0804378E:
	cmp r0, 0xC7
	ble _08043798
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08043798:
	cmp r5, 0x5
	bne _080437A8
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	bne _08043876
_080437A8:
	cmp r5, 0x3
	bne _080437D4
	ldr r0, _08043880 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08043876
	ldr r2, _08043884 @ =gUnknown_823EAC8
	ldr r0, _08043888 @ =gUnknown_20386AE
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0x54
	beq _080437D4
	cmp r0, 0x57
	beq _080437D4
	cmp r0, 0x5A
	bne _08043876
_080437D4:
	ldr r1, _0804388C @ =gUnknown_825DFF6
	lsls r0, r5, 1
	adds r0, r5
	adds r0, r6, r0
	adds r0, r1
	ldrb r2, [r0]
	movs r1, 0
	ldrsb r1, [r0, r1]
	cmp r1, 0
	ble _080437FA
	cmp r4, 0x1B
	bne _080437FA
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	lsls r0, 24
	lsrs r2, r0, 24
_080437FA:
	lsls r2, 24
	asrs r2, 24
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r0, r2
	mov r1, sp
	strh r0, [r1]
	cmp r2, 0
	ble _0804384C
	adds r0, r7, 0
	movs r1, 0x26
	movs r2, 0
	bl GetMonData
	cmp r0, 0xB
	bne _08043828
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r0, 0x1
	mov r1, sp
	strh r0, [r1]
_08043828:
	adds r0, r7, 0
	movs r1, 0x23
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	bl sav1_map_get_name
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _0804384C
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r0, 0x1
	mov r1, sp
	strh r0, [r1]
_0804384C:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _0804385C
	movs r1, 0
	mov r0, sp
	strh r1, [r0]
_0804385C:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0xFF
	ble _0804386C
	movs r1, 0xFF
	mov r0, sp
	strh r1, [r0]
_0804386C:
	adds r0, r7, 0
	movs r1, 0x20
	mov r2, sp
	bl sub_804037C
_08043876:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043880: .4byte gUnknown_2022B4C
_08043884: .4byte gUnknown_823EAC8
_08043888: .4byte gUnknown_20386AE
_0804388C: .4byte gUnknown_825DFF6
	thumb_func_end sub_80436F8

	thumb_func_start MonGainEVs
MonGainEVs: @ 8043890
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	mov r8, r0
	lsls r1, 16
	lsrs r5, r1, 16
	movs r4, 0
	movs r7, 0
	movs r6, 0
_080438A4:
	adds r1, r6, 0
	adds r1, 0x1A
	mov r0, r8
	movs r2, 0
	bl GetMonData
	mov r2, sp
	adds r1, r2, r6
	strb r0, [r1]
	ldrb r0, [r1]
	adds r0, r7, r0
	lsls r0, 16
	lsrs r7, r0, 16
	adds r6, 0x1
	cmp r6, 0x5
	ble _080438A4
	movs r6, 0
	b _08043A26
_080438C8:
	mov r0, r8
	movs r1, 0
	bl CheckPartyHasHadPokerus
	lsls r0, 24
	movs r2, 0x1
	cmp r0, 0
	beq _080438DA
	movs r2, 0x2
_080438DA:
	cmp r6, 0x5
	bhi _0804397C
	lsls r0, r6, 2
	ldr r1, _080438E8 @ =_080438EC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080438E8: .4byte _080438EC
	.align 2, 0
_080438EC:
	.4byte _08043904
	.4byte _08043918
	.4byte _0804392C
	.4byte _08043940
	.4byte _08043954
	.4byte _08043968
_08043904:
	ldr r0, _08043914 @ =gUnknown_8254784
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	lsls r0, 30
	b _08043976
	.align 2, 0
_08043914: .4byte gUnknown_8254784
_08043918:
	ldr r0, _08043928 @ =gUnknown_8254784
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	b _08043974
	.align 2, 0
_08043928: .4byte gUnknown_8254784
_0804392C:
	ldr r0, _0804393C @ =gUnknown_8254784
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	lsls r0, 26
	b _08043976
	.align 2, 0
_0804393C: .4byte gUnknown_8254784
_08043940:
	ldr r0, _08043950 @ =gUnknown_8254784
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	lsrs r0, 6
	b _08043978
	.align 2, 0
_08043950: .4byte gUnknown_8254784
_08043954:
	ldr r0, _08043964 @ =gUnknown_8254784
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xB]
	lsls r0, 30
	b _08043976
	.align 2, 0
_08043964: .4byte gUnknown_8254784
_08043968:
	ldr r0, _080439A4 @ =gUnknown_8254784
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xB]
_08043974:
	lsls r0, 28
_08043976:
	lsrs r0, 30
_08043978:
	adds r4, r0, 0
	muls r4, r2
_0804397C:
	mov r0, r8
	movs r1, 0xC
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _080439C8
	ldr r0, _080439A8 @ =gUnknown_30030F0
	ldr r1, _080439AC @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080439B4
	ldr r0, _080439B0 @ =gUnknown_2023F54
	ldrb r0, [r0, 0x7]
	b _080439D0
	.align 2, 0
_080439A4: .4byte gUnknown_8254784
_080439A8: .4byte gUnknown_30030F0
_080439AC: .4byte 0x00000439
_080439B0: .4byte gUnknown_2023F54
_080439B4:
	ldr r0, _080439C0 @ =gUnknown_3005008
	ldr r0, [r0]
	ldr r2, _080439C4 @ =0x0000311a
	adds r0, r2
	ldrb r0, [r0]
	b _080439D0
	.align 2, 0
_080439C0: .4byte gUnknown_3005008
_080439C4: .4byte 0x0000311a
_080439C8:
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r0, 24
_080439D0:
	cmp r0, 0x18
	bne _080439D8
	lsls r0, r4, 17
	lsrs r4, r0, 16
_080439D8:
	lsls r0, r4, 16
	asrs r2, r0, 16
	adds r1, r7, r2
	movs r0, 0xFF
	lsls r0, 1
	cmp r1, r0
	ble _080439F0
	adds r0, r2, r0
	adds r1, r7, r4
	subs r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
_080439F0:
	mov r0, sp
	adds r2, r0, r6
	ldrb r3, [r2]
	lsls r0, r4, 16
	asrs r1, r0, 16
	adds r0, r3, r1
	cmp r0, 0xFF
	ble _08043A0C
	adds r0, r1, 0
	adds r0, 0xFF
	adds r1, r3, r4
	subs r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
_08043A0C:
	adds r0, r3, r4
	strb r0, [r2]
	adds r0, r7, r4
	lsls r0, 16
	lsrs r7, r0, 16
	adds r1, r6, 0
	adds r1, 0x1A
	mov r0, r8
	bl sub_804037C
	adds r6, 0x1
	cmp r6, 0x5
	bgt _08043A2E
_08043A26:
	ldr r0, _08043A3C @ =0x000001fd
	cmp r7, r0
	bhi _08043A2E
	b _080438C8
_08043A2E:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043A3C: .4byte 0x000001fd
	thumb_func_end MonGainEVs

	thumb_func_start GetMonEVCount
GetMonEVCount: @ 8043A40
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r5, 0
	movs r4, 0
_08043A48:
	adds r1, r4, 0
	adds r1, 0x1A
	adds r0, r6, 0
	movs r2, 0
	bl GetMonData
	adds r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, 0x1
	cmp r4, 0x5
	ble _08043A48
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetMonEVCount

	thumb_func_start sub_8043A68
sub_8043A68: @ 8043A68
	sub sp, 0x4
	add sp, 0x4
	bx lr
	thumb_func_end sub_8043A68

	thumb_func_start CheckPartyPokerus
CheckPartyPokerus: @ 8043A70
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	movs r3, 0
	movs r6, 0x1
	movs r5, 0
	cmp r4, 0
	beq _08043AB8
_08043A84:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _08043AAC
	movs r0, 0x64
	muls r0, r3
	adds r0, r7, r0
	movs r1, 0x22
	movs r2, 0
	str r3, [sp]
	bl GetMonData
	movs r1, 0xF
	ands r1, r0
	ldr r3, [sp]
	cmp r1, 0
	beq _08043AAC
	orrs r5, r6
	lsls r0, r5, 24
	lsrs r5, r0, 24
_08043AAC:
	adds r3, 0x1
	lsls r6, 1
	lsrs r4, 1
	cmp r4, 0
	bne _08043A84
	b _08043ACC
_08043AB8:
	adds r0, r7, 0
	movs r1, 0x22
	movs r2, 0
	bl GetMonData
	movs r1, 0xF
	ands r1, r0
	cmp r1, 0
	beq _08043ACC
	movs r5, 0x1
_08043ACC:
	adds r0, r5, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckPartyPokerus

	thumb_func_start CheckPartyHasHadPokerus
CheckPartyHasHadPokerus: @ 8043AD8
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	movs r3, 0
	movs r6, 0x1
	movs r5, 0
	cmp r4, 0
	beq _08043B1C
_08043AEC:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _08043B10
	movs r0, 0x64
	muls r0, r3
	adds r0, r7, r0
	movs r1, 0x22
	movs r2, 0
	str r3, [sp]
	bl GetMonData
	ldr r3, [sp]
	cmp r0, 0
	beq _08043B10
	orrs r5, r6
	lsls r0, r5, 24
	lsrs r5, r0, 24
_08043B10:
	adds r3, 0x1
	lsls r6, 1
	lsrs r4, 1
	cmp r4, 0
	bne _08043AEC
	b _08043B2C
_08043B1C:
	adds r0, r7, 0
	movs r1, 0x22
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _08043B2C
	movs r5, 0x1
_08043B2C:
	adds r0, r5, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckPartyHasHadPokerus

	thumb_func_start sub_8043B38
sub_8043B38: @ 8043B38
	sub sp, 0x4
	add sp, 0x4
	bx lr
	thumb_func_end sub_8043B38

	thumb_func_start sub_8043B40
sub_8043B40: @ 8043B40
	sub sp, 0x4
	add sp, 0x4
	bx lr
	thumb_func_end sub_8043B40

	thumb_func_start sub_8043B48
sub_8043B48: @ 8043B48
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	str r3, [sp]
	ldr r2, _08043B88 @ =gUnknown_8253AE4
	ldr r3, _08043B8C @ =gUnknown_8254784
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r1
	movs r1, 0xC8
	lsls r1, 1
	adds r2, r1
	adds r0, r2
	ldr r1, [r0]
	ldr r0, [sp]
	cmp r0, r1
	bls _08043B80
	str r1, [sp]
	adds r0, r4, 0
	movs r1, 0x19
	mov r2, sp
	bl sub_804037C
_08043B80:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08043B88: .4byte gUnknown_8253AE4
_08043B8C: .4byte gUnknown_8254784
	thumb_func_end sub_8043B48

	thumb_func_start sub_8043B90
sub_8043B90: @ 8043B90
	push {r4-r7,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r7, r0, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r0, 24
	mov r1, sp
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x19
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	cmp r7, 0x63
	bhi _08043C14
	ldr r3, _08043C0C @ =gUnknown_8253AE4
	mov r0, sp
	ldrb r1, [r0]
	lsls r1, 2
	ldr r2, _08043C10 @ =gUnknown_8254784
	lsls r0, r6, 3
	subs r0, r6
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r2
	adds r1, r0
	adds r1, r3
	ldr r0, [r1]
	cmp r5, r0
	bls _08043C20
	adds r0, r4, 0
	movs r1, 0x38
	mov r2, sp
	bl sub_804037C
	mov r0, sp
	ldrb r2, [r0]
	adds r0, r4, 0
	adds r1, r6, 0
	adds r3, r5, 0
	bl sub_8043B48
	movs r0, 0x1
	b _08043C22
	.align 2, 0
_08043C0C: .4byte gUnknown_8253AE4
_08043C10: .4byte gUnknown_8254784
_08043C14:
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r7, 0
	adds r3, r5, 0
	bl sub_8043B48
_08043C20:
	movs r0, 0
_08043C22:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8043B90

	thumb_func_start CanMonLearnTMHM
CanMonLearnTMHM: @ 8043C2C
	push {r4,r5,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	adds r5, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	adds r3, r1, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	bne _08043C4E
	movs r0, 0
	b _08043C7A
_08043C4E:
	cmp r4, 0x1F
	bls _08043C6C
	adds r0, r4, 0
	subs r0, 0x20
	movs r2, 0x1
	lsls r2, r0
	ldr r0, _08043C68 @ =gUnknown_8252BC8
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	ands r0, r2
	b _08043C7A
	.align 2, 0
_08043C68: .4byte gUnknown_8252BC8
_08043C6C:
	movs r1, 0x1
	lsls r1, r5
	ldr r2, _08043C80 @ =gUnknown_8252BC8
	lsls r0, r3, 3
	adds r0, r2
	ldr r0, [r0]
	ands r0, r1
_08043C7A:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08043C80: .4byte gUnknown_8252BC8
	thumb_func_end CanMonLearnTMHM

	thumb_func_start GetMoveRelearnerMoves
GetMoveRelearnerMoves: @ 8043C84
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	adds r6, r0, 0
	str r1, [sp, 0x8]
	movs r0, 0
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r6, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
	movs r5, 0
	mov r4, sp
_08043CBA:
	adds r1, r5, 0
	adds r1, 0xD
	adds r0, r6, 0
	movs r2, 0
	bl GetMonData
	strh r0, [r4]
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _08043CBA
	movs r5, 0
	ldr r6, _08043DC8 @ =gUnknown_825D7B4
	lsls r1, r7, 2
	adds r2, r1, r6
	ldr r3, [r2]
	ldrh r0, [r3]
	ldr r4, _08043DCC @ =0x0000ffff
	str r1, [sp, 0x14]
	cmp r0, r4
	beq _08043DB4
	mov r9, r2
	str r3, [sp, 0x10]
_08043CE8:
	lsls r2, r5, 1
	ldr r1, [sp, 0x10]
	adds r0, r2, r1
	ldrh r3, [r0]
	movs r0, 0xFE
	lsls r0, 8
	ands r0, r3
	ldr r4, [sp, 0xC]
	lsls r1, r4, 9
	adds r7, r2, 0
	adds r5, 0x1
	mov r12, r5
	cmp r0, r1
	bgt _08043D9E
	movs r4, 0
	mov r0, sp
	ldrh r1, [r0]
	ldr r0, _08043DD0 @ =0x000001ff
	ands r0, r3
	cmp r1, r0
	beq _08043D38
	ldr r0, [sp, 0x14]
	ldr r1, _08043DC8 @ =gUnknown_825D7B4
	adds r6, r0, r1
	ldr r2, _08043DD0 @ =0x000001ff
	mov r8, r2
	mov r3, sp
	adds r5, r7, 0
_08043D20:
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	bgt _08043D38
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _08043D20
_08043D38:
	cmp r4, 0x4
	bne _08043D9E
	movs r4, 0
	cmp r4, r10
	bge _08043D7C
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, [sp, 0x8]
	ldrh r2, [r0]
	ldr r0, _08043DD0 @ =0x000001ff
	ands r0, r1
	cmp r2, r0
	beq _08043D7C
	ldr r1, [sp, 0x14]
	ldr r2, _08043DC8 @ =gUnknown_825D7B4
	adds r6, r1, r2
	ldr r0, _08043DD0 @ =0x000001ff
	mov r8, r0
	ldr r3, [sp, 0x8]
	adds r5, r7, 0
_08043D64:
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, r10
	bge _08043D7C
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _08043D64
_08043D7C:
	cmp r4, r10
	bne _08043D9E
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r2, r4, 1
	ldr r1, [sp, 0x8]
	adds r2, r1
	mov r4, r9
	ldr r0, [r4]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, _08043DD0 @ =0x000001ff
	ands r0, r1
	strh r0, [r2]
_08043D9E:
	mov r5, r12
	cmp r5, 0x13
	bgt _08043DB4
	mov r1, r9
	ldr r0, [r1]
	lsls r1, r5, 1
	adds r1, r0
	ldrh r0, [r1]
	ldr r2, _08043DCC @ =0x0000ffff
	cmp r0, r2
	bne _08043CE8
_08043DB4:
	mov r0, r10
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08043DC8: .4byte gUnknown_825D7B4
_08043DCC: .4byte 0x0000ffff
_08043DD0: .4byte 0x000001ff
	thumb_func_end GetMoveRelearnerMoves

	thumb_func_start GetLevelUpMovesBySpecies
GetLevelUpMovesBySpecies: @ 8043DD4
	push {r4-r7,lr}
	adds r6, r1, 0
	lsls r0, 16
	movs r5, 0
	movs r4, 0
	ldr r1, _08043E20 @ =gUnknown_825D7B4
	lsrs r0, 14
	adds r0, r1
	ldr r2, [r0]
	ldrh r0, [r2]
	ldr r1, _08043E24 @ =0x0000ffff
	cmp r0, r1
	beq _08043E18
	ldr r0, _08043E28 @ =0x000001ff
	mov r12, r0
	adds r7, r1, 0
	adds r3, r2, 0
_08043DF6:
	adds r1, r5, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 1
	adds r1, r6
	ldrh r2, [r3]
	mov r0, r12
	ands r0, r2
	strh r0, [r1]
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x13
	bgt _08043E18
	ldrh r0, [r3]
	cmp r0, r7
	bne _08043DF6
_08043E18:
	adds r0, r5, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08043E20: .4byte gUnknown_825D7B4
_08043E24: .4byte 0x0000ffff
_08043E28: .4byte 0x000001ff
	thumb_func_end GetLevelUpMovesBySpecies

	thumb_func_start GetNumberOfRelearnableMoves
GetNumberOfRelearnableMoves: @ 8043E2C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x3C
	adds r6, r0, 0
	movs r0, 0
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r6, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x30]
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bne _08043E68
	movs r0, 0
	b _08043F72
_08043E68:
	movs r5, 0
	lsls r4, 2
	str r4, [sp, 0x38]
	mov r4, sp
_08043E70:
	adds r1, r5, 0
	adds r1, 0xD
	adds r0, r6, 0
	movs r2, 0
	bl GetMonData
	strh r0, [r4]
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _08043E70
	movs r5, 0
	ldr r3, _08043F84 @ =gUnknown_825D7B4
	ldr r2, [sp, 0x38]
	adds r1, r2, r3
	ldr r0, [r1]
	ldrh r0, [r0]
	ldr r2, _08043F88 @ =0x0000ffff
	cmp r0, r2
	beq _08043F70
	mov r9, r1
	mov r4, sp
	adds r4, 0x8
	str r4, [sp, 0x34]
_08043EA0:
	mov r1, r9
	ldr r0, [r1]
	lsls r2, r5, 1
	adds r0, r2, r0
	ldrh r3, [r0]
	movs r0, 0xFE
	lsls r0, 8
	ands r0, r3
	ldr r4, [sp, 0x30]
	lsls r1, r4, 9
	adds r7, r2, 0
	adds r5, 0x1
	mov r12, r5
	cmp r0, r1
	bgt _08043F5A
	movs r4, 0
	mov r0, sp
	ldrh r1, [r0]
	ldr r0, _08043F8C @ =0x000001ff
	ands r0, r3
	cmp r1, r0
	beq _08043EF2
	ldr r0, [sp, 0x38]
	ldr r1, _08043F84 @ =gUnknown_825D7B4
	adds r6, r0, r1
	ldr r2, _08043F8C @ =0x000001ff
	mov r8, r2
	mov r3, sp
	adds r5, r7, 0
_08043EDA:
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	bgt _08043EF2
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _08043EDA
_08043EF2:
	cmp r4, 0x4
	bne _08043F5A
	movs r4, 0
	cmp r4, r10
	bge _08043F38
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, [sp, 0x34]
	ldrh r2, [r0]
	ldr r0, _08043F8C @ =0x000001ff
	ands r0, r1
	add r1, sp, 0x8
	cmp r2, r0
	beq _08043F38
	ldr r2, [sp, 0x38]
	ldr r0, _08043F84 @ =gUnknown_825D7B4
	adds r6, r2, r0
	ldr r2, _08043F8C @ =0x000001ff
	mov r8, r2
	adds r3, r1, 0
	adds r5, r7, 0
_08043F20:
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, r10
	bge _08043F38
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _08043F20
_08043F38:
	cmp r4, r10
	bne _08043F5A
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r2, r4, 1
	ldr r4, [sp, 0x34]
	adds r2, r4, r2
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, _08043F8C @ =0x000001ff
	ands r0, r1
	strh r0, [r2]
_08043F5A:
	mov r5, r12
	cmp r5, 0x13
	bgt _08043F70
	mov r2, r9
	ldr r0, [r2]
	lsls r1, r5, 1
	adds r1, r0
	ldrh r0, [r1]
	ldr r4, _08043F88 @ =0x0000ffff
	cmp r0, r4
	bne _08043EA0
_08043F70:
	mov r0, r10
_08043F72:
	add sp, 0x3C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08043F84: .4byte gUnknown_825D7B4
_08043F88: .4byte 0x0000ffff
_08043F8C: .4byte 0x000001ff
	thumb_func_end GetNumberOfRelearnableMoves

	thumb_func_start sub_8043F90
sub_8043F90: @ 8043F90
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl SpeciesToNationalPokedexNum
	adds r4, r0, 0
	bl sub_806E25C
	cmp r0, 0
	bne _08043FB4
	cmp r4, 0x97
	bls _08043FB4
	ldr r0, _08043FB0 @ =0x0000ffff
	b _08043FB6
	.align 2, 0
_08043FB0: .4byte 0x0000ffff
_08043FB4:
	adds r0, r4, 0
_08043FB6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8043F90

	thumb_func_start sub_8043FBC
sub_8043FBC: @ 8043FBC
	push {lr}
	ldr r1, _08043FD0 @ =gUnknown_2024024
	movs r2, 0
	adds r0, r1, 0x3
_08043FC4:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _08043FC4
	pop {r0}
	bx r0
	.align 2, 0
_08043FD0: .4byte gUnknown_2024024
	thumb_func_end sub_8043FBC

	thumb_func_start sub_8043FD4
sub_8043FD4: @ 8043FD4
	push {lr}
	ldr r0, _08043FFC @ =gUnknown_2022B4C
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	bne _0804406C
	movs r0, 0x80
	lsls r0, 7
	ands r0, r1
	cmp r0, 0
	bne _08043FF6
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08044000
_08043FF6:
	movs r0, 0x85
	lsls r0, 1
	b _08044070
	.align 2, 0
_08043FFC: .4byte gUnknown_2022B4C
_08044000:
	movs r0, 0x8
	ands r1, r0
	cmp r1, 0
	beq _0804406C
	ldr r2, _08044028 @ =gUnknown_823EAC8
	ldr r0, _0804402C @ =gUnknown_20386AE
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x1]
	subs r0, 0x53
	cmp r0, 0x7
	bhi _08044062
	lsls r0, 2
	ldr r1, _08044030 @ =_08044034
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08044028: .4byte gUnknown_823EAC8
_0804402C: .4byte gUnknown_20386AE
_08044030: .4byte _08044034
	.align 2, 0
_08044034:
	.4byte _08044062
	.4byte _0804405C
	.4byte _08044062
	.4byte _08044062
	.4byte _0804405C
	.4byte _08044062
	.4byte _08044062
	.4byte _08044054
_08044054:
	ldr r0, _08044058 @ =0x0000012b
	b _08044070
	.align 2, 0
_08044058: .4byte 0x0000012b
_0804405C:
	movs r0, 0x94
	lsls r0, 1
	b _08044070
_08044062:
	ldr r0, _08044068 @ =0x00000129
	b _08044070
	.align 2, 0
_08044068: .4byte 0x00000129
_0804406C:
	movs r0, 0x95
	lsls r0, 1
_08044070:
	pop {r1}
	bx r1
	thumb_func_end sub_8043FD4

	thumb_func_start PlayBattleBGM
PlayBattleBGM: @ 8044074
	push {lr}
	bl ResetMapMusic
	bl m4aMPlayAllStop
	bl sub_8043FD4
	lsls r0, 16
	lsrs r0, 16
	bl PlayBGM
	pop {r0}
	bx r0
	thumb_func_end PlayBattleBGM

	thumb_func_start PlayMapChosenOrBattleBGM
PlayMapChosenOrBattleBGM: @ 8044090
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl ResetMapMusic
	bl m4aMPlayAllStop
	cmp r4, 0
	beq _080440AA
	adds r0, r4, 0
	bl PlayNewMapMusic
	b _080440B6
_080440AA:
	bl sub_8043FD4
	lsls r0, 16
	lsrs r0, 16
	bl PlayNewMapMusic
_080440B6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayMapChosenOrBattleBGM

	thumb_func_start GetMonFrontSpritePal
GetMonFrontSpritePal: @ 80440BC
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	adds r6, r0, 0
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r2, r0, 0
	adds r0, r4, 0
	adds r1, r6, 0
	bl GetFrontSpritePalFromSpeciesAndPersonality
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetMonFrontSpritePal

	thumb_func_start GetFrontSpritePalFromSpeciesAndPersonality
GetFrontSpritePalFromSpeciesAndPersonality: @ 80440F4
	push {r4,r5,lr}
	adds r3, r2, 0
	lsls r0, 16
	lsrs r4, r0, 16
	adds r5, r4, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bls _08044110
	ldr r0, _0804410C @ =gUnknown_823730C
	ldr r0, [r0]
	b _0804413C
	.align 2, 0
_0804410C: .4byte gUnknown_823730C
_08044110:
	lsrs r0, r1, 16
	ldr r2, _0804412C @ =0x0000ffff
	ands r1, r2
	eors r0, r1
	lsrs r1, r3, 16
	eors r0, r1
	ands r3, r2
	eors r0, r3
	cmp r0, 0x7
	bls _08044134
	ldr r0, _08044130 @ =gUnknown_823730C
	lsls r1, r4, 3
	b _08044138
	.align 2, 0
_0804412C: .4byte 0x0000ffff
_08044130: .4byte gUnknown_823730C
_08044134:
	ldr r0, _08044144 @ =gUnknown_82380CC
	lsls r1, r5, 3
_08044138:
	adds r1, r0
	ldr r0, [r1]
_0804413C:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08044144: .4byte gUnknown_82380CC
	thumb_func_end GetFrontSpritePalFromSpeciesAndPersonality

	thumb_func_start GetMonSpritePalStruct
GetMonSpritePalStruct: @ 8044148
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	adds r6, r0, 0
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r2, r0, 0
	adds r0, r4, 0
	adds r1, r6, 0
	bl GetMonSpritePalStructFromOtIdPersonality
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetMonSpritePalStruct

	thumb_func_start GetMonSpritePalStructFromOtIdPersonality
GetMonSpritePalStructFromOtIdPersonality: @ 8044180
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsrs r0, r1, 16
	ldr r3, _080441A0 @ =0x0000ffff
	ands r1, r3
	eors r0, r1
	lsrs r1, r2, 16
	eors r0, r1
	ands r2, r3
	eors r0, r2
	cmp r0, 0x7
	bls _080441A8
	lsls r0, r4, 3
	ldr r1, _080441A4 @ =gUnknown_823730C
	b _080441AC
	.align 2, 0
_080441A0: .4byte 0x0000ffff
_080441A4: .4byte gUnknown_823730C
_080441A8:
	lsls r0, r4, 3
	ldr r1, _080441B4 @ =gUnknown_82380CC
_080441AC:
	adds r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080441B4: .4byte gUnknown_82380CC
	thumb_func_end GetMonSpritePalStructFromOtIdPersonality

	thumb_func_start IsHMMove2
IsHMMove2: @ 80441B8
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r2, _080441DC @ =gUnknown_825E014
	ldrh r0, [r2]
	ldr r1, _080441E0 @ =0x0000ffff
	cmp r0, r1
	beq _080441EA
	adds r4, r1, 0
	adds r1, r2, 0
_080441CC:
	ldrh r0, [r2]
	adds r1, 0x2
	adds r2, 0x2
	cmp r0, r3
	bne _080441E4
	movs r0, 0x1
	b _080441EC
	.align 2, 0
_080441DC: .4byte gUnknown_825E014
_080441E0: .4byte 0x0000ffff
_080441E4:
	ldrh r0, [r1]
	cmp r0, r4
	bne _080441CC
_080441EA:
	movs r0, 0
_080441EC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsHMMove2

	thumb_func_start IsPokeSpriteNotFlipped
IsPokeSpriteNotFlipped: @ 80441F4
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08044208 @ =gUnknown_8254784
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x19]
	lsrs r0, 7
	bx lr
	.align 2, 0
_08044208: .4byte gUnknown_8254784
	thumb_func_end IsPokeSpriteNotFlipped

	thumb_func_start GetMonFlavorRelation
GetMonFlavorRelation: @ 804420C
	push {r4,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08044230 @ =gUnknown_825DE24
	lsls r1, r0, 2
	adds r1, r0
	adds r1, r4
	adds r1, r2
	movs r0, 0
	ldrsb r0, [r1, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08044230: .4byte gUnknown_825DE24
	thumb_func_end GetMonFlavorRelation

	thumb_func_start GetFlavorRelationByPersonality
GetFlavorRelationByPersonality: @ 8044234
	push {r4,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	bl GetNatureFromPersonality
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08044258 @ =gUnknown_825DE24
	lsls r1, r0, 2
	adds r1, r0
	adds r1, r4
	adds r1, r2
	movs r0, 0
	ldrsb r0, [r1, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08044258: .4byte gUnknown_825DE24
	thumb_func_end GetFlavorRelationByPersonality

	thumb_func_start IsTradedMon
IsTradedMon: @ 804425C
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	movs r1, 0x7
	mov r2, sp
	bl GetMonData
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	mov r1, sp
	bl IsOtherTrainer
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsTradedMon

	thumb_func_start IsOtherTrainer
IsOtherTrainer: @ 8044288
	push {r4,r5,lr}
	adds r5, r1, 0
	ldr r1, _080442CC @ =gUnknown_300500C
	ldr r3, [r1]
	ldrb r2, [r3, 0xA]
	ldrb r1, [r3, 0xB]
	lsls r1, 8
	orrs r2, r1
	ldrb r1, [r3, 0xC]
	lsls r1, 16
	orrs r2, r1
	ldrb r1, [r3, 0xD]
	lsls r1, 24
	orrs r2, r1
	cmp r0, r2
	bne _080442D0
	movs r4, 0
	ldrb r0, [r5]
	cmp r0, 0xFF
	beq _080442C6
	adds r2, r5, 0
_080442B2:
	adds r1, r3, r4
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080442D0
	adds r2, 0x1
	adds r4, 0x1
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _080442B2
_080442C6:
	movs r0, 0
	b _080442D2
	.align 2, 0
_080442CC: .4byte gUnknown_300500C
_080442D0:
	movs r0, 0x1
_080442D2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end IsOtherTrainer

	thumb_func_start MonRestorePP
MonRestorePP: @ 80442D8
	push {lr}
	bl BoxMonRestorePP
	pop {r0}
	bx r0
	thumb_func_end MonRestorePP

	thumb_func_start BoxMonRestorePP
BoxMonRestorePP: @ 80442E4
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r6, 0
_080442EC:
	adds r4, r6, 0
	adds r4, 0xD
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetBoxMonData
	cmp r0, 0
	beq _08044338
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetBoxMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x15
	movs r2, 0
	bl GetBoxMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r6, 24
	lsrs r2, 24
	adds r0, r4, 0
	bl CalculatePPWithBonus
	mov r1, sp
	strb r0, [r1]
	adds r1, r6, 0
	adds r1, 0x11
	adds r0, r5, 0
	mov r2, sp
	bl sub_80404D0
_08044338:
	adds r6, 0x1
	cmp r6, 0x3
	ble _080442EC
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end BoxMonRestorePP

	thumb_func_start sub_8044348
sub_8044348: @ 8044348
	push {r4,r5,lr}
	ldr r2, _0804438C @ =gUnknown_2023D6A
	ldr r5, _08044390 @ =gUnknown_2023FE8
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0xAC
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r4, _08044394 @ =gUnknown_2022AB8
	movs r0, 0xFD
	strb r0, [r4]
	movs r0, 0x4
	strb r0, [r4, 0x1]
	adds r1, 0x49
	ldrb r0, [r1]
	strb r0, [r4, 0x2]
	movs r0, 0xFF
	strb r0, [r4, 0x4]
	ldrb r0, [r1]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _0804439C
	ldr r1, _08044398 @ =gUnknown_2023BCE
	ldr r0, [r5]
	adds r0, 0x49
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	b _080443AA
	.align 2, 0
_0804438C: .4byte gUnknown_2023D6A
_08044390: .4byte gUnknown_2023FE8
_08044394: .4byte gUnknown_2022AB8
_08044398: .4byte gUnknown_2023BCE
_0804439C:
	ldr r1, _080443E0 @ =gUnknown_2023BCE
	ldr r0, [r5]
	adds r0, 0x49
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
_080443AA:
	strb r0, [r4, 0x3]
	ldr r4, _080443E4 @ =gUnknown_2022AC8
	movs r0, 0xFD
	strb r0, [r4]
	movs r0, 0x4
	strb r0, [r4, 0x1]
	ldr r1, _080443E8 @ =gUnknown_2024004
	ldrb r0, [r1]
	strb r0, [r4, 0x2]
	ldr r2, _080443E0 @ =gUnknown_2023BCE
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r2
	ldrb r0, [r0]
	bl pokemon_order_func
	strb r0, [r4, 0x3]
	movs r0, 0xFF
	strb r0, [r4, 0x4]
	ldr r0, _080443EC @ =gUnknown_83FCA2C
	ldr r1, _080443F0 @ =gUnknown_2021D18
	bl sub_80D7868
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080443E0: .4byte gUnknown_2023BCE
_080443E4: .4byte gUnknown_2022AC8
_080443E8: .4byte gUnknown_2024004
_080443EC: .4byte gUnknown_83FCA2C
_080443F0: .4byte gUnknown_2021D18
	thumb_func_end sub_8044348

	thumb_func_start SetWildMonHeldItem
SetWildMonHeldItem: @ 80443F4
	push {r4,r5,lr}
	ldr r0, _0804444C @ =gUnknown_2022B4C
	ldr r0, [r0]
	ldr r1, _08044450 @ =0x00012008
	ands r0, r1
	cmp r0, 0
	bne _08044468
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r4, _08044454 @ =gUnknown_202402C
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08044458 @ =gUnknown_8254784
	lsls r1, r0, 3
	subs r1, r0
	lsls r3, r1, 2
	adds r1, r3, r2
	ldrh r0, [r1, 0xC]
	ldrh r1, [r1, 0xE]
	cmp r0, r1
	beq _0804443E
	cmp r5, 0x2C
	bls _08044468
	cmp r5, 0x5E
	bhi _0804445C
_0804443E:
	adds r2, 0xC
	adds r2, r3, r2
	adds r0, r4, 0
	movs r1, 0xC
	bl sub_804037C
	b _08044468
	.align 2, 0
_0804444C: .4byte gUnknown_2022B4C
_08044450: .4byte 0x00012008
_08044454: .4byte gUnknown_202402C
_08044458: .4byte gUnknown_8254784
_0804445C:
	adds r2, 0xE
	adds r2, r3, r2
	adds r0, r4, 0
	movs r1, 0xC
	bl sub_804037C
_08044468:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end SetWildMonHeldItem

	thumb_func_start IsMonShiny
IsMonShiny: @ 8044470
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	adds r0, r5, 0
	bl IsShinyOtIdPersonality
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end IsMonShiny

	thumb_func_start IsShinyOtIdPersonality
IsShinyOtIdPersonality: @ 804449C
	push {r4,lr}
	movs r4, 0
	lsrs r2, r0, 16
	ldr r3, _080444C0 @ =0x0000ffff
	ands r0, r3
	eors r2, r0
	lsrs r0, r1, 16
	eors r2, r0
	ands r1, r3
	eors r2, r1
	cmp r2, 0x7
	bhi _080444B6
	movs r4, 0x1
_080444B6:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080444C0: .4byte 0x0000ffff
	thumb_func_end IsShinyOtIdPersonality

	thumb_func_start sub_80444C4
sub_80444C4: @ 80444C4
	push {r4,lr}
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _080444F4 @ =gUnknown_202273C
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x18]
	movs r0, 0x2
	eors r0, r1
	bl GetBankMultiplayerId
	adds r1, r0, 0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r4, 0x8
	adds r0, r4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080444F4: .4byte gUnknown_202273C
	thumb_func_end sub_80444C4

	thumb_func_start sub_80444F8
sub_80444F8: @ 80444F8
	push {r4-r6,lr}
	movs r6, 0x1
	movs r5, 0
_080444FE:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08044548 @ =gUnknown_2024284
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x5
	movs r2, 0
	bl GetMonData
	cmp r0, 0x1
	bne _08044538
	adds r0, r4, 0
	movs r1, 0x6
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _08044538
	adds r0, r4, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r6
	bls _08044538
	adds r6, r0, 0
_08044538:
	adds r5, 0x1
	cmp r5, 0x5
	ble _080444FE
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08044548: .4byte gUnknown_2024284
	thumb_func_end sub_80444F8

	thumb_func_start sub_804454C
sub_804454C: @ 804454C
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08044558 @ =gUnknown_82538A8
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08044558: .4byte gUnknown_82538A8
	thumb_func_end sub_804454C

	thumb_func_start sub_804455C
sub_804455C: @ 804455C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r0, 0x5
	bhi _08044632
	lsls r0, 2
	ldr r1, _08044574 @ =_08044578
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08044574: .4byte _08044578
	.align 2, 0
_08044578:
	.4byte _08044632
	.4byte _08044590
	.4byte _08044664
	.4byte _080445BC
	.4byte _08044664
	.4byte _080445F4
_08044590:
	ldr r0, _080445B0 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08044632
	ldr r0, _080445B4 @ =gUnknown_30030F0
	ldr r1, _080445B8 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08044632
	b _0804461A
	.align 2, 0
_080445B0: .4byte gUnknown_2022B4C
_080445B4: .4byte gUnknown_30030F0
_080445B8: .4byte 0x00000439
_080445BC:
	ldr r0, _080445E8 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08044632
	ldr r0, _080445EC @ =gUnknown_30030F0
	ldr r1, _080445F0 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08044632
	cmp r5, 0x1
	beq _08044664
	cmp r5, 0x4
	beq _08044664
	cmp r5, 0x5
	beq _08044664
	b _08044632
	.align 2, 0
_080445E8: .4byte gUnknown_2022B4C
_080445EC: .4byte gUnknown_30030F0
_080445F0: .4byte 0x00000439
_080445F4:
	ldr r0, _08044638 @ =gUnknown_2022B4C
	ldr r2, [r0]
	movs r3, 0x2
	adds r0, r2, 0
	ands r0, r3
	cmp r0, 0
	beq _08044648
	ldr r0, _0804463C @ =gUnknown_30030F0
	ldr r1, _08044640 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08044632
	movs r0, 0x40
	ands r2, r0
	cmp r2, 0
	beq _08044658
_0804461A:
	ldr r4, _08044644 @ =gUnknown_202273C
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1, 0x18]
	cmp r0, r5
	bne _08044664
_08044632:
	movs r0, 0
	b _08044666
	.align 2, 0
_08044638: .4byte gUnknown_2022B4C
_0804463C: .4byte gUnknown_30030F0
_08044640: .4byte 0x00000439
_08044644: .4byte gUnknown_202273C
_08044648:
	ldr r0, _0804466C @ =gUnknown_30030F0
	ldr r1, _08044670 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08044632
_08044658:
	adds r0, r5, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _08044632
_08044664:
	movs r0, 0x1
_08044666:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0804466C: .4byte gUnknown_30030F0
_08044670: .4byte 0x00000439
	thumb_func_end sub_804455C

	thumb_func_start GetDeoxysStat
GetDeoxysStat: @ 8044674
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r0, _0804469C @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	bne _08044698
	adds r0, r5, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	movs r1, 0xCD
	lsls r1, 1
	cmp r0, r1
	beq _080446A0
_08044698:
	movs r0, 0
	b _080446FE
	.align 2, 0
_0804469C: .4byte gUnknown_2022B4C
_080446A0:
	adds r1, r6, 0
	adds r1, 0x27
	adds r0, r5, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	adds r1, r6, 0
	adds r1, 0x1A
	adds r0, r5, 0
	movs r2, 0
	bl GetMonData
	ldr r2, _08044704 @ =gUnknown_825E026
	lsls r1, r6, 1
	adds r1, r2
	ldrh r1, [r1]
	lsls r1, 1
	adds r1, r4
	cmp r0, 0
	bge _080446CC
	adds r0, 0x3
_080446CC:
	asrs r0, 2
	adds r0, r1, r0
	adds r1, r5, 0
	adds r1, 0x54
	ldrb r1, [r1]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r0, 0x5
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r5, 0
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r6, 24
	lsrs r2, 24
	adds r1, r4, 0
	bl nature_stat_mod
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
_080446FE:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08044704: .4byte gUnknown_825E026
	thumb_func_end GetDeoxysStat

	thumb_func_start sub_8044708
sub_8044708: @ 8044708
	push {r4,r5,lr}
	sub sp, 0x4
	movs r5, 0
_0804470E:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080447A8 @ =gUnknown_2024284
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	movs r1, 0xCD
	lsls r1, 1
	cmp r0, r1
	bne _08044798
	adds r0, r4, 0
	movs r1, 0x3B
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x3B
	mov r2, sp
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x3C
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x3C
	mov r2, sp
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x3D
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x3D
	mov r2, sp
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x3E
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x3E
	mov r2, sp
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x3F
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x3F
	mov r2, sp
	bl sub_804037C
_08044798:
	adds r5, 0x1
	cmp r5, 0x5
	ble _0804470E
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080447A8: .4byte gUnknown_2024284
	thumb_func_end sub_8044708

	thumb_func_start sub_80447AC
sub_80447AC: @ 80447AC
	push {lr}
	bl GetMultiplayerId
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080447E8 @ =gUnknown_202273C
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r3, 0x4
	adds r0, r1, r0
	ldr r2, [r0]
	movs r0, 0x7
	ands r2, r0
	adds r1, r3
	ldrb r0, [r1, 0x13]
	lsls r0, 3
	orrs r2, r0
	ldr r0, _080447EC @ =gUnknown_825E032
	lsls r2, 1
	adds r2, r0
	ldrh r0, [r2]
	bl sub_804454C
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_080447E8: .4byte gUnknown_202273C
_080447EC: .4byte gUnknown_825E032
	thumb_func_end sub_80447AC

	thumb_func_start sub_80447F0
sub_80447F0: @ 80447F0
	push {lr}
	bl GetMultiplayerId
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0804482C @ =gUnknown_202273C
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r3, 0x4
	adds r0, r1, r0
	ldr r2, [r0]
	movs r0, 0x7
	ands r2, r0
	adds r1, r3
	ldrb r0, [r1, 0x13]
	lsls r0, 3
	orrs r2, r0
	ldr r1, _08044830 @ =gUnknown_825393E
	ldr r0, _08044834 @ =gUnknown_825E032
	lsls r2, 1
	adds r2, r0
	ldrh r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_0804482C: .4byte gUnknown_202273C
_08044830: .4byte gUnknown_825393E
_08044834: .4byte gUnknown_825E032
	thumb_func_end sub_80447F0

	thumb_func_start sub_8044838
sub_8044838: @ 8044838
	push {r4-r7,lr}
	sub sp, 0x14
	ldr r0, _08044888 @ =gUnknown_20370C0
	ldrh r5, [r0]
	ldr r0, _0804488C @ =gUnknown_20370C2
	ldrh r4, [r0]
	ldr r0, _08044890 @ =gUnknown_20370C4
	ldrh r6, [r0]
	bl ZeroEnemyPartyMons
	ldr r7, _08044894 @ =gUnknown_202402C
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	adds r0, r7, 0
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0x20
	bl sub_803E1EC
	cmp r6, 0
	beq _08044880
	add r0, sp, 0x10
	strb r6, [r0]
	adds r1, r0, 0
	asrs r0, r6, 8
	strb r0, [r1, 0x1]
	adds r0, r7, 0
	movs r1, 0xC
	add r2, sp, 0x10
	bl sub_804037C
_08044880:
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044888: .4byte gUnknown_20370C0
_0804488C: .4byte gUnknown_20370C2
_08044890: .4byte gUnknown_20370C4
_08044894: .4byte gUnknown_202402C
	thumb_func_end sub_8044838

	thumb_func_start sub_8044898
sub_8044898: @ 8044898
	push {r4-r7,lr}
	adds r7, r2, 0
	lsls r0, 16
	lsrs r4, r0, 16
	adds r6, r4, 0
	lsls r1, 24
	lsrs r5, r1, 24
	movs r0, 0x2
	eors r0, r5
	negs r1, r0
	orrs r1, r0
	lsrs r1, 31
	adds r0, r4, 0
	bl sub_8088E74
	lsls r0, 24
	cmp r0, 0
	bne _080448EE
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8088E74
	adds r0, r4, 0
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xC9
	bne _080448D8
	ldr r0, _080448F4 @ =gUnknown_300500C
	ldr r0, [r0]
	str r7, [r0, 0x1C]
_080448D8:
	adds r0, r6, 0
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	movs r1, 0x9A
	lsls r1, 17
	cmp r0, r1
	bne _080448EE
	ldr r0, _080448F4 @ =gUnknown_300500C
	ldr r0, [r0]
	str r7, [r0, 0x20]
_080448EE:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080448F4: .4byte gUnknown_300500C
	thumb_func_end sub_8044898

	thumb_func_start sub_80448F8
sub_80448F8: @ 80448F8
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r1, 24
	lsrs r2, r1, 24
	ldr r0, _0804493C @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _08044944
	adds r0, r2, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _08044944
	adds r0, r4, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	ldr r1, _08044940 @ =gUnknown_841D148
	mov r0, sp
	bl StringCompare
	cmp r0, 0
	bne _08044944
	movs r0, 0x1
	b _08044946
	.align 2, 0
_0804493C: .4byte gUnknown_2022B4C
_08044940: .4byte gUnknown_841D148
_08044944:
	movs r0, 0
_08044946:
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80448F8

	thumb_func_start sub_8044950
sub_8044950: @ 8044950
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r6, 0
	cmp r1, 0x3
	bls _080449EC
	adds r5, r6, 0
	ldrb r0, [r4]
	lsls r0, 28
	lsrs r0, 28
	cmp r5, r0
	bge _08044A2C
_08044972:
	ldr r1, [r4, 0x10]
	lsls r3, r5, 1
	adds r0, r3, r5
	lsls r0, 3
	ldr r2, _080449E8 @ =gUnknown_825DEF0
	adds r1, r0, r1
	adds r0, r2
	ldm r0!, {r2,r6,r7}
	stm r1!, {r2,r6,r7}
	ldm r0!, {r2,r6,r7}
	stm r1!, {r2,r6,r7}
	movs r6, 0
	ldrb r2, [r4, 0x1]
	ldr r0, [r4, 0x10]
	mov r10, r0
	mov r8, r3
	ldr r7, [r4, 0x14]
	adds r1, r5, 0x1
	mov r9, r1
	cmp r6, r2
	bcs _080449C2
	mov r12, r7
	ldr r1, [r4, 0xC]
	lsls r0, r5, 2
	adds r0, r1
	ldr r3, [r0]
_080449A6:
	adds r0, r5, 0
	muls r0, r2
	adds r0, r6
	lsls r0, 3
	add r0, r12
	lsls r1, r6, 11
	adds r1, r3, r1
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldrb r2, [r4, 0x1]
	cmp r6, r2
	bcc _080449A6
_080449C2:
	mov r2, r8
	adds r1, r2, r5
	lsls r1, 3
	add r1, r10
	ldrb r0, [r4, 0x1]
	muls r0, r5
	lsls r0, 3
	adds r0, r7, r0
	str r0, [r1, 0xC]
	mov r3, r9
	lsls r0, r3, 16
	lsrs r5, r0, 16
	ldrb r0, [r4]
	lsls r0, 28
	lsrs r0, 28
	cmp r5, r0
	blt _08044972
	b _08044A2C
	.align 2, 0
_080449E8: .4byte gUnknown_825DEF0
_080449EC:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r2, _08044A3C @ =gUnknown_825DEF0
	ldr r1, [r4, 0x10]
	adds r0, r2
	ldm r0!, {r2,r5,r7}
	stm r1!, {r2,r5,r7}
	ldm r0!, {r3,r5,r7}
	stm r1!, {r3,r5,r7}
	ldr r0, [r4, 0x10]
	mov r10, r0
	ldr r7, [r4, 0x14]
	ldrb r1, [r4, 0x1]
	cmp r6, r1
	bcs _08044A28
	adds r3, r7, 0
	ldr r0, [r4, 0xC]
	ldr r2, [r0]
_08044A12:
	lsls r0, r6, 3
	adds r0, r3
	lsls r1, r6, 11
	adds r1, r2, r1
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldrb r5, [r4, 0x1]
	cmp r6, r5
	bcc _08044A12
_08044A28:
	mov r6, r10
	str r7, [r6, 0xC]
_08044A2C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044A3C: .4byte gUnknown_825DEF0
	thumb_func_end sub_8044950

	thumb_func_start sub_8044A40
sub_8044A40: @ 8044A40
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r4, r0, 0
	ldrb r0, [r4]
	lsls r0, 28
	movs r3, 0
	cmp r0, 0
	beq _08044ADA
	ldr r0, _08044AE8 @ =gUnknown_825E05C
	mov r10, r0
_08044A5A:
	ldr r0, [r4, 0x10]
	lsls r2, r3, 1
	adds r1, r2, r3
	lsls r1, 3
	adds r1, r0
	mov r0, r10
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	movs r5, 0
	ldr r0, [r4, 0x10]
	mov r8, r0
	mov r12, r2
	ldr r7, [r4, 0x14]
	adds r1, r3, 0x1
	mov r9, r1
	ldrb r6, [r4, 0x1]
	cmp r5, r6
	bcs _08044AAE
	adds r6, r7, 0
	ldr r1, [r4, 0xC]
	lsls r0, r3, 2
	adds r0, r1
	ldr r2, [r0]
_08044A8C:
	ldrb r0, [r4]
	lsls r0, 28
	lsrs r0, 28
	adds r1, r3, 0
	muls r1, r0
	adds r1, r5
	lsls r1, 3
	adds r1, r6
	lsls r0, r5, 11
	adds r0, r2, r0
	str r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldrb r0, [r4, 0x1]
	cmp r5, r0
	bcc _08044A8C
_08044AAE:
	mov r5, r12
	adds r1, r5, r3
	lsls r1, 3
	add r1, r8
	ldrb r0, [r4]
	lsls r0, 28
	lsrs r0, 28
	muls r0, r3
	lsls r0, 3
	adds r0, r7, r0
	str r0, [r1, 0xC]
	ldr r6, _08044AEC @ =gUnknown_82349BC
	str r6, [r1, 0x8]
	strh r3, [r1, 0x2]
	mov r7, r9
	lsls r0, r7, 16
	lsrs r3, r0, 16
	ldrb r0, [r4]
	lsls r0, 28
	lsrs r0, 28
	cmp r3, r0
	blt _08044A5A
_08044ADA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044AE8: .4byte gUnknown_825E05C
_08044AEC: .4byte gUnknown_82349BC
	thumb_func_end sub_8044A40

	thumb_func_start sub_8044AF0
sub_8044AF0: @ 8044AF0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	movs r0, 0
	mov r8, r0
	ldr r4, _08044B34 @ =gUnknown_20244F4
	ldr r1, [r4]
	cmp r1, 0
	beq _08044B1E
	ldrb r0, [r1, 0x2]
	cmp r0, 0xA3
	beq _08044B2E
	adds r0, r1, 0
	movs r1, 0
	movs r2, 0x18
	bl memset
	mov r1, r8
	str r1, [r4]
_08044B1E:
	ldr r4, _08044B34 @ =gUnknown_20244F4
	movs r0, 0x18
	bl AllocZeroed
	adds r2, r0, 0
	str r2, [r4]
	cmp r2, 0
	bne _08044B38
_08044B2E:
	movs r0, 0
	b _08044D70
	.align 2, 0
_08044B34: .4byte gUnknown_20244F4
_08044B38:
	cmp r5, 0
	beq _08044B94
	cmp r5, 0x1
	bne _08044B94
	cmp r6, 0x4
	bne _08044B5E
	ldrb r1, [r2]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r2, [r4]
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	movs r1, 0x40
	b _08044B7C
_08044B5E:
	cmp r6, 0x4
	bls _08044B64
	movs r6, 0
_08044B64:
	ldrb r1, [r2]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r2, [r4]
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	movs r1, 0x10
_08044B7C:
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _08044B90 @ =gUnknown_20244F4
	ldr r1, [r2]
	movs r0, 0x4
	strb r0, [r1, 0x1]
	ldr r1, [r2]
	movs r0, 0x1
	strb r0, [r1, 0x3]
	b _08044BD0
	.align 2, 0
_08044B90: .4byte gUnknown_20244F4
_08044B94:
	cmp r6, 0
	bne _08044B9A
	movs r6, 0x1
_08044B9A:
	cmp r6, 0x8
	bls _08044BA0
	movs r6, 0x8
_08044BA0:
	ldr r4, _08044C10 @ =gUnknown_20244F4
	ldr r3, [r4]
	movs r0, 0xF
	adds r1, r6, 0
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldr r2, [r4]
	lsls r3, r6, 4
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	ldr r1, [r4]
	movs r2, 0
	movs r0, 0x4
	strb r0, [r1, 0x1]
	ldr r0, [r4]
	strb r2, [r0, 0x3]
_08044BD0:
	ldr r5, _08044C10 @ =gUnknown_20244F4
	ldr r0, [r5]
	ldrb r1, [r0, 0x1]
	lsls r1, 11
	str r1, [r0, 0x4]
	ldrb r0, [r0]
	lsls r0, 28
	lsrs r0, 28
	muls r0, r1
	bl AllocZeroed
	ldr r1, [r5]
	str r0, [r1, 0x8]
	ldrb r0, [r1]
	lsls r0, 28
	lsrs r0, 23
	bl AllocZeroed
	adds r2, r0, 0
	ldr r1, [r5]
	str r2, [r1, 0xC]
	ldr r0, [r1, 0x8]
	cmp r0, 0
	beq _08044C04
	cmp r2, 0
	bne _08044C14
_08044C04:
	movs r0, 0x1
	mov r1, r8
	orrs r1, r0
	mov r8, r1
	b _08044C44
	.align 2, 0
_08044C10: .4byte gUnknown_20244F4
_08044C14:
	ldrb r0, [r1]
	lsls r0, 28
	movs r4, 0
	adds r3, r5, 0
	cmp r0, 0
	beq _08044C44
_08044C20:
	ldr r3, [r5]
	ldr r0, [r3, 0xC]
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, [r3, 0x4]
	adds r2, r0, 0
	muls r2, r4
	ldr r0, [r3, 0x8]
	adds r0, r2
	str r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r3]
	lsls r0, 28
	lsrs r0, 28
	cmp r4, r0
	blt _08044C20
_08044C44:
	ldr r5, _08044C8C @ =gUnknown_20244F4
	ldr r0, [r5]
	ldrb r1, [r0]
	lsls r1, 28
	lsrs r1, 28
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	bl AllocZeroed
	ldr r2, [r5]
	str r0, [r2, 0x10]
	ldrb r1, [r2]
	lsls r1, 28
	lsrs r1, 28
	ldrb r0, [r2, 0x1]
	lsls r0, 3
	muls r0, r1
	bl AllocZeroed
	adds r2, r0, 0
	ldr r1, [r5]
	str r2, [r1, 0x14]
	ldr r0, [r1, 0x10]
	cmp r0, 0
	beq _08044C7C
	cmp r2, 0
	bne _08044C90
_08044C7C:
	movs r0, 0x2
	mov r1, r8
	orrs r1, r0
	lsls r0, r1, 24
	lsrs r0, 24
	mov r8, r0
	b _08044CE2
	.align 2, 0
_08044C8C: .4byte gUnknown_20244F4
_08044C90:
	movs r4, 0
	ldrb r0, [r1, 0x1]
	ldrb r1, [r1]
	lsls r1, 28
	lsrs r1, 28
	muls r0, r1
	adds r3, r5, 0
	cmp r4, r0
	bge _08044CC6
	adds r7, r3, 0
	movs r5, 0x80
	lsls r5, 4
_08044CA8:
	ldr r2, [r7]
	ldr r1, [r2, 0x14]
	lsls r0, r4, 3
	adds r0, r1
	strh r5, [r0, 0x4]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2]
	lsls r0, 28
	lsrs r0, 28
	muls r0, r1
	cmp r4, r0
	blt _08044CA8
_08044CC6:
	ldr r0, [r3]
	ldrb r4, [r0, 0x3]
	cmp r4, 0
	beq _08044CDA
	cmp r4, 0x1
	bne _08044CDA
	adds r1, r6, 0
	bl sub_8044950
	b _08044CE2
_08044CDA:
	ldr r0, _08044D60 @ =gUnknown_20244F4
	ldr r0, [r0]
	bl sub_8044A40
_08044CE2:
	movs r0, 0x2
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08044D12
	ldr r4, _08044D60 @ =gUnknown_20244F4
	ldr r0, [r4]
	ldr r0, [r0, 0x14]
	cmp r0, 0
	beq _08044D00
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0x14]
_08044D00:
	ldr r0, [r4]
	ldr r0, [r0, 0x10]
	cmp r0, 0
	beq _08044D12
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0x10]
_08044D12:
	movs r0, 0x1
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08044D42
	ldr r4, _08044D60 @ =gUnknown_20244F4
	ldr r0, [r4]
	ldr r0, [r0, 0xC]
	cmp r0, 0
	beq _08044D30
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0xC]
_08044D30:
	ldr r0, [r4]
	ldr r0, [r0, 0x8]
	cmp r0, 0
	beq _08044D42
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0x8]
_08044D42:
	mov r0, r8
	cmp r0, 0
	beq _08044D64
	ldr r4, _08044D60 @ =gUnknown_20244F4
	ldr r0, [r4]
	movs r1, 0
	movs r2, 0x18
	bl memset
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
	b _08044D6C
	.align 2, 0
_08044D60: .4byte gUnknown_20244F4
_08044D64:
	ldr r0, _08044D7C @ =gUnknown_20244F4
	ldr r1, [r0]
	movs r0, 0xA3
	strb r0, [r1, 0x2]
_08044D6C:
	ldr r0, _08044D7C @ =gUnknown_20244F4
	ldr r0, [r0]
_08044D70:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08044D7C: .4byte gUnknown_20244F4
	thumb_func_end sub_8044AF0

	thumb_func_start sub_8044D80
sub_8044D80: @ 8044D80
	push {r4,lr}
	ldr r4, _08044D9C @ =gUnknown_20244F4
	ldr r1, [r4]
	cmp r1, 0
	beq _08044DFA
	ldrb r0, [r1, 0x2]
	cmp r0, 0xA3
	beq _08044DA0
	adds r0, r1, 0
	movs r1, 0
	movs r2, 0x18
	bl memset
	b _08044DF6
	.align 2, 0
_08044D9C: .4byte gUnknown_20244F4
_08044DA0:
	ldr r0, [r1, 0x14]
	cmp r0, 0
	beq _08044DB0
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0x14]
_08044DB0:
	ldr r0, [r4]
	ldr r0, [r0, 0x10]
	cmp r0, 0
	beq _08044DC2
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0x10]
_08044DC2:
	ldr r0, [r4]
	ldr r0, [r0, 0xC]
	cmp r0, 0
	beq _08044DD4
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0xC]
_08044DD4:
	ldr r0, [r4]
	ldr r0, [r0, 0x8]
	cmp r0, 0
	beq _08044DE6
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0x8]
_08044DE6:
	ldr r0, [r4]
	movs r1, 0
	movs r2, 0x18
	bl memset
	ldr r0, [r4]
	bl Free
_08044DF6:
	movs r0, 0
	str r0, [r4]
_08044DFA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8044D80

	thumb_func_start sub_8044E00
sub_8044E00: @ 8044E00
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _08044E14 @ =gUnknown_20244F4
	ldr r2, [r0]
	ldrb r0, [r2, 0x2]
	cmp r0, 0xA3
	beq _08044E18
	movs r0, 0
	b _08044E2C
	.align 2, 0
_08044E14: .4byte gUnknown_20244F4
_08044E18:
	ldrb r0, [r2]
	lsls r0, 28
	lsrs r0, 28
	cmp r1, r0
	blt _08044E24
	movs r1, 0
_08044E24:
	ldr r0, [r2, 0xC]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
_08044E2C:
	pop {r1}
	bx r1
	thumb_func_end sub_8044E00

	.align 2, 0 @ Don't pad with nop.
