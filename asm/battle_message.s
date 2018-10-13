	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80D7274
sub_80D7274: @ 80D7274
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r6, r0, 16
	movs r7, 0
	ldr r4, _080D7330 @ =gUnknown_2039A34
	ldr r0, _080D7334 @ =gActiveBattler
	mov r8, r0
	ldrb r1, [r0]
	lsls r1, 9
	ldr r0, _080D7338 @ =gUnknown_2022BC8
	adds r1, r0
	str r1, [r4]
	ldr r2, _080D733C @ =gUnknown_2023D68
	ldrh r0, [r1, 0x4]
	strh r0, [r2]
	ldr r2, _080D7340 @ =gLastUsedAbility
	ldrb r0, [r1, 0x6]
	strb r0, [r2]
	ldr r5, _080D7344 @ =gBattleScripting
	ldrb r0, [r1, 0x7]
	strb r0, [r5, 0x17]
	ldr r3, _080D7348 @ =gBattleStruct
	ldr r0, [r3]
	adds r0, 0x52
	ldrb r1, [r1, 0x8]
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, 0xAD
	ldr r1, [r4]
	ldrb r1, [r1, 0x9]
	strb r1, [r0]
	ldr r1, _080D734C @ =gPotentialItemEffectBattler
	ldr r2, [r4]
	ldrb r0, [r2, 0xA]
	strb r0, [r1]
	ldr r0, [r3]
	adds r0, 0x8E
	ldrb r1, [r2, 0xB]
	strb r1, [r0]
	movs r2, 0
	mov r12, r8
	mov r10, r5
	ldr r1, _080D7350 @ =gBattleTextBuff1
	mov r9, r1
	ldr r3, _080D7354 @ =gUnknown_2039A30
_080D72D6:
	adds r0, r2, r3
	ldr r1, [r4]
	adds r1, 0xC
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x3
	ble _080D72D6
	movs r2, 0
	ldr r0, _080D7350 @ =gBattleTextBuff1
	mov r8, r0
	ldr r3, _080D7330 @ =gUnknown_2039A34
	ldr r5, _080D7358 @ =gBattleTextBuff2
	ldr r4, _080D735C @ =gUnknown_2022AD8
_080D72F4:
	mov r0, r8
	adds r1, r2, r0
	ldr r0, [r3]
	adds r0, 0x10
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r2, r5
	ldr r0, [r3]
	adds r0, 0x20
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r2, r4
	ldr r0, [r3]
	adds r0, 0x30
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, 0x1
	cmp r2, 0xF
	ble _080D72F4
	cmp r6, 0x5
	bls _080D7326
	b _080D77B8
_080D7326:
	lsls r0, r6, 2
	ldr r1, _080D7360 @ =_080D7364
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D7330: .4byte gUnknown_2039A34
_080D7334: .4byte gActiveBattler
_080D7338: .4byte gUnknown_2022BC8
_080D733C: .4byte gUnknown_2023D68
_080D7340: .4byte gLastUsedAbility
_080D7344: .4byte gBattleScripting
_080D7348: .4byte gBattleStruct
_080D734C: .4byte gPotentialItemEffectBattler
_080D7350: .4byte gBattleTextBuff1
_080D7354: .4byte gUnknown_2039A30
_080D7358: .4byte gBattleTextBuff2
_080D735C: .4byte gUnknown_2022AD8
_080D7360: .4byte _080D7364
	.align 2, 0
_080D7364:
	.4byte _080D737C
	.4byte _080D7428
	.4byte _080D74C8
	.4byte _080D7558
	.4byte _080D75F0
	.4byte _080D7654
_080D737C:
	ldr r0, _080D739C @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080D73C4
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D73B4
	movs r0, 0x40
	ands r1, r0
	cmp r1, 0
	beq _080D73A4
	ldr r7, _080D73A0 @ =gUnknown_83FD397
	b _080D77DC
	.align 2, 0
_080D739C: .4byte gBattleTypeFlags
_080D73A0: .4byte gUnknown_83FD397
_080D73A4:
	ldr r0, _080D73B8 @ =gTrainerBattleOpponent_A
	ldrh r1, [r0]
	movs r0, 0xC0
	lsls r0, 4
	ldr r7, _080D73BC @ =gUnknown_83FD383
	cmp r1, r0
	beq _080D73B4
	b _080D77DC
_080D73B4:
	ldr r7, _080D73C0 @ =gUnknown_83FD366
	b _080D77DC
	.align 2, 0
_080D73B8: .4byte gTrainerBattleOpponent_A
_080D73BC: .4byte gUnknown_83FD383
_080D73C0: .4byte gUnknown_83FD366
_080D73C4:
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080D73E8
	movs r0, 0x80
	lsls r0, 6
	ands r1, r0
	ldr r7, _080D73E0 @ =gUnknown_83FD2D9
	cmp r1, 0
	bne _080D73DC
	b _080D77DC
_080D73DC:
	ldr r7, _080D73E4 @ =gUnknown_83FD30D
	b _080D77DC
	.align 2, 0
_080D73E0: .4byte gUnknown_83FD2D9
_080D73E4: .4byte gUnknown_83FD30D
_080D73E8:
	movs r0, 0x80
	lsls r0, 6
	ands r0, r1
	cmp r0, 0
	beq _080D73FC
	ldr r7, _080D73F8 @ =gUnknown_83FD297
	b _080D77DC
	.align 2, 0
_080D73F8: .4byte gUnknown_83FD297
_080D73FC:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D740C
	ldr r7, _080D7408 @ =gUnknown_83FD2BF
	b _080D77DC
	.align 2, 0
_080D7408: .4byte gUnknown_83FD2BF
_080D740C:
	movs r0, 0x80
	lsls r0, 2
	ands r1, r0
	ldr r7, _080D7420 @ =gUnknown_83FD284
	cmp r1, 0
	bne _080D741A
	b _080D77DC
_080D741A:
	ldr r7, _080D7424 @ =gUnknown_83FD2AA
	b _080D77DC
	.align 2, 0
_080D7420: .4byte gUnknown_83FD284
_080D7424: .4byte gUnknown_83FD2AA
_080D7428:
	mov r1, r12
	ldrb r0, [r1]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080D7468
	ldr r0, _080D7454 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D7460
	movs r0, 0x40
	ands r1, r0
	ldr r7, _080D7458 @ =gUnknown_83FD466
	cmp r1, 0
	bne _080D744E
	b _080D77DC
_080D744E:
	ldr r7, _080D745C @ =gUnknown_83FD4B5
	b _080D77DC
	.align 2, 0
_080D7454: .4byte gBattleTypeFlags
_080D7458: .4byte gUnknown_83FD466
_080D745C: .4byte gUnknown_83FD4B5
_080D7460:
	ldr r7, _080D7464 @ =gUnknown_83FD45E
	b _080D77DC
	.align 2, 0
_080D7464: .4byte gUnknown_83FD45E
_080D7468:
	ldr r0, _080D7480 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D74A0
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080D7488
	ldr r7, _080D7484 @ =gUnknown_83FD41E
	b _080D77DC
	.align 2, 0
_080D7480: .4byte gBattleTypeFlags
_080D7484: .4byte gUnknown_83FD41E
_080D7488:
	movs r0, 0x2
	ands r1, r0
	ldr r7, _080D7498 @ =gUnknown_83FD3C7
	cmp r1, 0
	bne _080D7494
	b _080D77DC
_080D7494:
	ldr r7, _080D749C @ =gUnknown_83FD407
	b _080D77DC
	.align 2, 0
_080D7498: .4byte gUnknown_83FD3C7
_080D749C: .4byte gUnknown_83FD407
_080D74A0:
	movs r0, 0x2
	ands r1, r0
	cmp r1, 0
	beq _080D74B8
	ldr r0, _080D74BC @ =gTrainerBattleOpponent_A
	ldrh r1, [r0]
	movs r0, 0xC0
	lsls r0, 4
	ldr r7, _080D74C0 @ =gUnknown_83FD3F7
	cmp r1, r0
	beq _080D74B8
	b _080D77DC
_080D74B8:
	ldr r7, _080D74C4 @ =gUnknown_83FD3B1
	b _080D77DC
	.align 2, 0
_080D74BC: .4byte gTrainerBattleOpponent_A
_080D74C0: .4byte gUnknown_83FD3F7
_080D74C4: .4byte gUnknown_83FD3B1
_080D74C8:
	mov r1, r12
	ldrb r0, [r1]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080D7520
	ldr r0, _080D74E8 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xAD
	ldrb r2, [r0]
	cmp r2, 0
	bne _080D74F0
	ldr r7, _080D74EC @ =gUnknown_83FD4CD
	b _080D77DC
	.align 2, 0
_080D74E8: .4byte gBattleStruct
_080D74EC: .4byte gUnknown_83FD4CD
_080D74F0:
	cmp r2, 0x1
	beq _080D7500
	ldr r0, _080D7504 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D750C
_080D7500:
	ldr r7, _080D7508 @ =gUnknown_83FD4EB
	b _080D77DC
	.align 2, 0
_080D7504: .4byte gBattleTypeFlags
_080D7508: .4byte gUnknown_83FD4EB
_080D750C:
	ldr r7, _080D7518 @ =gUnknown_83FD50D
	cmp r2, 0x2
	beq _080D7514
	b _080D77DC
_080D7514:
	ldr r7, _080D751C @ =gUnknown_83FD4FA
	b _080D77DC
	.align 2, 0
_080D7518: .4byte gUnknown_83FD50D
_080D751C: .4byte gUnknown_83FD4FA
_080D7520:
	ldr r0, _080D7540 @ =gTrainerBattleOpponent_A
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 4
	cmp r1, r0
	bne _080D7550
	ldr r0, _080D7544 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	ldr r7, _080D7548 @ =gUnknown_83FD535
	cmp r0, 0
	bne _080D753C
	b _080D77DC
_080D753C:
	ldr r7, _080D754C @ =gUnknown_83FD545
	b _080D77DC
	.align 2, 0
_080D7540: .4byte gTrainerBattleOpponent_A
_080D7544: .4byte gBattleTypeFlags
_080D7548: .4byte gUnknown_83FD535
_080D754C: .4byte gUnknown_83FD545
_080D7550:
	ldr r7, _080D7554 @ =gUnknown_83FD522
	b _080D77DC
	.align 2, 0
_080D7554: .4byte gUnknown_83FD522
_080D7558:
	mov r1, r10
	ldrb r0, [r1, 0x17]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080D75B0
	ldr r0, _080D7584 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xAD
	ldrb r2, [r0]
	cmp r2, 0
	beq _080D757E
	ldr r0, _080D7588 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D7590
_080D757E:
	ldr r7, _080D758C @ =gUnknown_83FD475
	b _080D77DC
	.align 2, 0
_080D7584: .4byte gBattleStruct
_080D7588: .4byte gBattleTypeFlags
_080D758C: .4byte gUnknown_83FD475
_080D7590:
	cmp r2, 0x1
	bne _080D759C
	ldr r7, _080D7598 @ =gUnknown_83FD47D
	b _080D77DC
	.align 2, 0
_080D7598: .4byte gUnknown_83FD47D
_080D759C:
	ldr r7, _080D75A8 @ =gUnknown_83FD497
	cmp r2, 0x2
	beq _080D75A4
	b _080D77DC
_080D75A4:
	ldr r7, _080D75AC @ =gUnknown_83FD488
	b _080D77DC
	.align 2, 0
_080D75A8: .4byte gUnknown_83FD497
_080D75AC: .4byte gUnknown_83FD488
_080D75B0:
	ldr r0, _080D75C8 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D75E0
	movs r0, 0x40
	ands r1, r0
	cmp r1, 0
	beq _080D75D0
	ldr r7, _080D75CC @ =gUnknown_83FD44E
	b _080D77DC
	.align 2, 0
_080D75C8: .4byte gBattleTypeFlags
_080D75CC: .4byte gUnknown_83FD44E
_080D75D0:
	ldr r0, _080D75E4 @ =gTrainerBattleOpponent_A
	ldrh r1, [r0]
	movs r0, 0xC0
	lsls r0, 4
	ldr r7, _080D75E8 @ =gUnknown_83FD43E
	cmp r1, r0
	beq _080D75E0
	b _080D77DC
_080D75E0:
	ldr r7, _080D75EC @ =gUnknown_83FD3E4
	b _080D77DC
	.align 2, 0
_080D75E4: .4byte gTrainerBattleOpponent_A
_080D75E8: .4byte gUnknown_83FD43E
_080D75EC: .4byte gUnknown_83FD3E4
_080D75F0:
	mov r0, r9
	bl sub_80D86C8
	ldr r0, _080D761C @ =gUnknown_2039A34
	ldr r2, [r0]
	ldrh r1, [r2]
	movs r0, 0xB1
	lsls r0, 1
	cmp r1, r0
	bls _080D762C
	ldr r0, _080D7620 @ =gBattleTextBuff2
	ldr r2, _080D7624 @ =gUnknown_83FEA28
	ldr r1, _080D7628 @ =gBattleStruct
	ldr r1, [r1]
	adds r1, 0x8E
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	b _080D763C
	.align 2, 0
_080D761C: .4byte gUnknown_2039A34
_080D7620: .4byte gBattleTextBuff2
_080D7624: .4byte gUnknown_83FEA28
_080D7628: .4byte gBattleStruct
_080D762C:
	ldr r0, _080D7648 @ =gBattleTextBuff2
	ldrh r2, [r2]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _080D764C @ =gUnknown_8247094
	adds r1, r2
	bl StringCopy
_080D763C:
	ldr r0, _080D7648 @ =gBattleTextBuff2
	bl sub_80D8720
	ldr r7, _080D7650 @ =gUnknown_83FD57B
	b _080D77DC
	.align 2, 0
_080D7648: .4byte gBattleTextBuff2
_080D764C: .4byte gUnknown_8247094
_080D7650: .4byte gUnknown_83FD57B
_080D7654:
	ldr r4, _080D7694 @ =gBattleTextBuff1
	ldrb r1, [r4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080D76D4
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r4]
	mov r1, r12
	ldrb r0, [r1]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080D7682
	ldrb r1, [r4]
	cmp r1, 0x3
	beq _080D7682
	movs r0, 0x3
	eors r0, r1
	strb r0, [r4]
_080D7682:
	ldr r0, _080D7694 @ =gBattleTextBuff1
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080D769C
	ldr r7, _080D7698 @ =gUnknown_83FCC8A
	b _080D77DC
	.align 2, 0
_080D7694: .4byte gBattleTextBuff1
_080D7698: .4byte gUnknown_83FCC8A
_080D769C:
	ldr r0, _080D76AC @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080D76B4
	ldr r7, _080D76B0 @ =gUnknown_83FCD9F
	b _080D77DC
	.align 2, 0
_080D76AC: .4byte gBattleTypeFlags
_080D76B0: .4byte gUnknown_83FCD9F
_080D76B4:
	ldr r0, _080D76C8 @ =gTrainerBattleOpponent_A
	ldrh r1, [r0]
	movs r0, 0xC0
	lsls r0, 4
	ldr r7, _080D76CC @ =gUnknown_83FCD92
	cmp r1, r0
	beq _080D76C4
	b _080D77DC
_080D76C4:
	ldr r7, _080D76D0 @ =gUnknown_83FE9D4
	b _080D77DC
	.align 2, 0
_080D76C8: .4byte gTrainerBattleOpponent_A
_080D76CC: .4byte gUnknown_83FCD92
_080D76D0: .4byte gUnknown_83FE9D4
_080D76D4:
	mov r1, r12
	ldrb r0, [r1]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080D76F0
	ldrb r1, [r4]
	cmp r1, 0x3
	beq _080D76F0
	movs r0, 0x3
	eors r0, r1
	strb r0, [r4]
_080D76F0:
	ldr r0, _080D7710 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080D7738
	ldr r0, _080D7714 @ =gBattleTextBuff1
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080D7728
	cmp r0, 0x2
	bgt _080D7718
	cmp r0, 0x1
	beq _080D771E
	b _080D77DC
	.align 2, 0
_080D7710: .4byte gBattleTypeFlags
_080D7714: .4byte gBattleTextBuff1
_080D7718:
	cmp r0, 0x3
	beq _080D7730
	b _080D77DC
_080D771E:
	ldr r7, _080D7724 @ =gUnknown_83FCCF8
	b _080D77DC
	.align 2, 0
_080D7724: .4byte gUnknown_83FCCF8
_080D7728:
	ldr r7, _080D772C @ =gUnknown_83FCD27
	b _080D77DC
	.align 2, 0
_080D772C: .4byte gUnknown_83FCD27
_080D7730:
	ldr r7, _080D7734 @ =gUnknown_83FCD66
	b _080D77DC
	.align 2, 0
_080D7734: .4byte gUnknown_83FCD66
_080D7738:
	ldr r0, _080D7758 @ =gTrainerBattleOpponent_A
	ldrh r1, [r0]
	movs r0, 0xC0
	lsls r0, 4
	cmp r1, r0
	bne _080D7780
	ldr r0, _080D775C @ =gBattleTextBuff1
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080D7770
	cmp r0, 0x2
	bgt _080D7760
	cmp r0, 0x1
	beq _080D7766
	b _080D77DC
	.align 2, 0
_080D7758: .4byte gTrainerBattleOpponent_A
_080D775C: .4byte gBattleTextBuff1
_080D7760:
	cmp r0, 0x3
	beq _080D7778
	b _080D77DC
_080D7766:
	ldr r7, _080D776C @ =gUnknown_83FD1C7
	b _080D77DC
	.align 2, 0
_080D776C: .4byte gUnknown_83FD1C7
_080D7770:
	ldr r7, _080D7774 @ =gUnknown_83FE9E4
	b _080D77DC
	.align 2, 0
_080D7774: .4byte gUnknown_83FE9E4
_080D7778:
	ldr r7, _080D777C @ =gUnknown_83FE9FF
	b _080D77DC
	.align 2, 0
_080D777C: .4byte gUnknown_83FE9FF
_080D7780:
	ldr r0, _080D7794 @ =gBattleTextBuff1
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080D77A8
	cmp r0, 0x2
	bgt _080D7798
	cmp r0, 0x1
	beq _080D779E
	b _080D77DC
	.align 2, 0
_080D7794: .4byte gBattleTextBuff1
_080D7798:
	cmp r0, 0x3
	beq _080D77B0
	b _080D77DC
_080D779E:
	ldr r7, _080D77A4 @ =gUnknown_83FCCE4
	b _080D77DC
	.align 2, 0
_080D77A4: .4byte gUnknown_83FCCE4
_080D77A8:
	ldr r7, _080D77AC @ =gUnknown_83FCD0F
	b _080D77DC
	.align 2, 0
_080D77AC: .4byte gUnknown_83FCD0F
_080D77B0:
	ldr r7, _080D77B4 @ =gUnknown_83FCD41
	b _080D77DC
	.align 2, 0
_080D77B4: .4byte gUnknown_83FCD41
_080D77B8:
	ldr r0, _080D77C8 @ =0x00000181
	cmp r6, r0
	bls _080D77D0
	ldr r1, _080D77CC @ =gDisplayedStringBattle
	movs r0, 0xFF
	strb r0, [r1]
	b _080D77E2
	.align 2, 0
_080D77C8: .4byte 0x00000181
_080D77CC: .4byte gDisplayedStringBattle
_080D77D0:
	ldr r1, _080D77F0 @ =gUnknown_83FDF3C
	adds r0, r6, 0
	subs r0, 0xC
	lsls r0, 2
	adds r0, r1
	ldr r7, [r0]
_080D77DC:
	adds r0, r7, 0
	bl BattleStringExpandPlaceholdersToDisplayedString
_080D77E2:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D77F0: .4byte gUnknown_83FDF3C
	thumb_func_end sub_80D7274

	thumb_func_start BattleStringExpandPlaceholdersToDisplayedString
BattleStringExpandPlaceholdersToDisplayedString: @ 80D77F4
	push {lr}
	ldr r1, _080D7800 @ =gDisplayedStringBattle
	bl BattleStringExpandPlaceholders
	pop {r1}
	bx r1
	.align 2, 0
_080D7800: .4byte gDisplayedStringBattle
	thumb_func_end BattleStringExpandPlaceholdersToDisplayedString

	thumb_func_start TryGetStatusString
TryGetStatusString: @ 80D7804
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _080D781C @ =gUnknown_83FEB5C
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	mov r2, sp
	movs r3, 0
	b _080D782C
	.align 2, 0
_080D781C: .4byte gUnknown_83FEB5C
_080D7820:
	strb r1, [r2]
	adds r4, 0x1
	adds r2, 0x1
	adds r3, 0x1
	cmp r3, 0x7
	bhi _080D7834
_080D782C:
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _080D7820
_080D7834:
	ldr r5, [sp]
	ldr r4, [sp, 0x4]
	movs r3, 0
	ldr r2, _080D7850 @ =gUnknown_82500CC
_080D783C:
	ldr r1, [r2]
	ldr r0, [r1]
	cmp r5, r0
	bne _080D7854
	ldr r0, [r1, 0x4]
	cmp r4, r0
	bne _080D7854
	ldr r0, [r2, 0x4]
	b _080D785E
	.align 2, 0
_080D7850: .4byte gUnknown_82500CC
_080D7854:
	adds r2, 0x8
	adds r3, 0x1
	cmp r3, 0x6
	bls _080D783C
	movs r0, 0
_080D785E:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end TryGetStatusString

	thumb_func_start BattleStringExpandPlaceholders
BattleStringExpandPlaceholders: @ 80D7868
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x20
	mov r9, r0
	mov r8, r1
	movs r6, 0
	movs r4, 0
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r7, r0, 24
	mov r0, r9
	ldrb r1, [r0]
	bl _080D83F0
_080D788A:
	cmp r1, 0xFD
	beq _080D7892
	bl _080D83E0
_080D7892:
	movs r1, 0x1
	add r9, r1
	mov r2, r9
	ldrb r0, [r2]
	cmp r0, 0x30
	bls _080D78A2
	bl _080D8382
_080D78A2:
	lsls r0, 2
	ldr r1, _080D78AC @ =_080D78B0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D78AC: .4byte _080D78B0
	.align 2, 0
_080D78B0:
	.4byte _080D7974
	.4byte _080D79A2
	.4byte _080D79DE
	.4byte _080D79E8
	.4byte _080D79F4
	.4byte _080D7A00
	.4byte _080D7A24
	.4byte _080D7A48
	.4byte _080D7A6C
	.4byte _080D7A90
	.4byte _080D7ABC
	.4byte _080D7AEC
	.4byte _080D7B1C
	.4byte _080D7B4C
	.4byte _080D7BE0
	.4byte _080D7C4C
	.4byte _080D7CC0
	.4byte _080D7D34
	.4byte _080D7DA8
	.4byte _080D7E1C
	.4byte _080D7E90
	.4byte _080D7EA8
	.4byte _080D7EE4
	.4byte _080D7FB0
	.4byte _080D7FB8
	.4byte _080D7FC8
	.4byte _080D7FD8
	.4byte _080D7FE8
	.4byte _080D8008
	.4byte _080D80A4
	.4byte _080D8162
	.4byte _080D8174
	.4byte _080D8188
	.4byte _080D819C
	.4byte _080D81C0
	.4byte _080D81DC
	.4byte _080D81E8
	.4byte _080D8214
	.4byte _080D8260
	.4byte _080D82F8
	.4byte _080D8340
	.4byte _080D8348
	.4byte _080D8318
	.4byte _080D8320
	.4byte _080D8368
	.4byte _080D8370
	.4byte _080D8240
	.4byte _080D8250
	.4byte _080D79B8
_080D7974:
	ldr r5, _080D7984 @ =gBattleTextBuff1
	ldrb r0, [r5]
	cmp r0, 0xFD
	bne _080D798C
	ldr r4, _080D7988 @ =gStringVar1
	adds r0, r5, 0
	b _080D79C4
	.align 2, 0
_080D7984: .4byte gBattleTextBuff1
_080D7988: .4byte gStringVar1
_080D798C:
	adds r0, r5, 0
	bl TryGetStatusString
	adds r4, r0, 0
	cmp r4, 0
	beq _080D799C
	bl _080D8382
_080D799C:
	adds r4, r5, 0
	bl _080D8382
_080D79A2:
	ldr r1, _080D79B0 @ =gBattleTextBuff2
	ldrb r0, [r1]
	cmp r0, 0xFD
	bne _080D79D8
	ldr r4, _080D79B4 @ =gStringVar2
	b _080D79C2
	.align 2, 0
_080D79B0: .4byte gBattleTextBuff2
_080D79B4: .4byte gStringVar2
_080D79B8:
	ldr r1, _080D79D0 @ =gUnknown_2022AD8
	ldrb r0, [r1]
	cmp r0, 0xFD
	bne _080D79D8
	ldr r4, _080D79D4 @ =gStringVar3
_080D79C2:
	adds r0, r1, 0
_080D79C4:
	adds r1, r4, 0
	bl ExpandBattleTextBuffPlaceholders
	bl _080D8382
	.align 2, 0
_080D79D0: .4byte gUnknown_2022AD8
_080D79D4: .4byte gStringVar3
_080D79D8:
	adds r4, r1, 0
	bl _080D8382
_080D79DE:
	ldr r4, _080D79E4 @ =gStringVar1
	bl _080D8382
	.align 2, 0
_080D79E4: .4byte gStringVar1
_080D79E8:
	ldr r4, _080D79F0 @ =gStringVar2
	bl _080D8382
	.align 2, 0
_080D79F0: .4byte gStringVar2
_080D79F4:
	ldr r4, _080D79FC @ =gStringVar3
	bl _080D8382
	.align 2, 0
_080D79FC: .4byte gStringVar3
_080D7A00:
	movs r0, 0
	bl GetBattlerAtPosition
	ldr r1, _080D7A1C @ =gBattlerPartyIndexes
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080D7A20 @ =gPlayerParty
	adds r0, r1
	bl _080D82AA
	.align 2, 0
_080D7A1C: .4byte gBattlerPartyIndexes
_080D7A20: .4byte gPlayerParty
_080D7A24:
	movs r0, 0x1
	bl GetBattlerAtPosition
	ldr r1, _080D7A40 @ =gBattlerPartyIndexes
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080D7A44 @ =gEnemyParty
	adds r0, r1
	bl _080D82AA
	.align 2, 0
_080D7A40: .4byte gBattlerPartyIndexes
_080D7A44: .4byte gEnemyParty
_080D7A48:
	movs r0, 0x2
	bl GetBattlerAtPosition
	ldr r1, _080D7A64 @ =gBattlerPartyIndexes
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080D7A68 @ =gPlayerParty
	adds r0, r1
	bl _080D82AA
	.align 2, 0
_080D7A64: .4byte gBattlerPartyIndexes
_080D7A68: .4byte gPlayerParty
_080D7A6C:
	movs r0, 0x3
	bl GetBattlerAtPosition
	ldr r1, _080D7A88 @ =gBattlerPartyIndexes
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080D7A8C @ =gEnemyParty
	adds r0, r1
	bl _080D82AA
	.align 2, 0
_080D7A88: .4byte gBattlerPartyIndexes
_080D7A8C: .4byte gEnemyParty
_080D7A90:
	ldr r2, _080D7AB0 @ =gBattlerPartyIndexes
	ldr r1, _080D7AB4 @ =gLinkPlayers
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x18]
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080D7AB8 @ =gPlayerParty
	adds r0, r1
	bl _080D82AA
	.align 2, 0
_080D7AB0: .4byte gBattlerPartyIndexes
_080D7AB4: .4byte gLinkPlayers
_080D7AB8: .4byte gPlayerParty
_080D7ABC:
	ldr r2, _080D7AE0 @ =gBattlerPartyIndexes
	ldr r1, _080D7AE4 @ =gLinkPlayers
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x18]
	movs r0, 0x1
	eors r0, r1
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080D7AE8 @ =gEnemyParty
	adds r0, r1
	bl _080D82AA
	.align 2, 0
_080D7AE0: .4byte gBattlerPartyIndexes
_080D7AE4: .4byte gLinkPlayers
_080D7AE8: .4byte gEnemyParty
_080D7AEC:
	ldr r2, _080D7B10 @ =gBattlerPartyIndexes
	ldr r1, _080D7B14 @ =gLinkPlayers
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x18]
	movs r0, 0x2
	eors r0, r1
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080D7B18 @ =gPlayerParty
	adds r0, r1
	bl _080D82AA
	.align 2, 0
_080D7B10: .4byte gBattlerPartyIndexes
_080D7B14: .4byte gLinkPlayers
_080D7B18: .4byte gPlayerParty
_080D7B1C:
	ldr r2, _080D7B40 @ =gBattlerPartyIndexes
	ldr r1, _080D7B44 @ =gLinkPlayers
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x18]
	movs r0, 0x3
	eors r0, r1
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080D7B48 @ =gEnemyParty
	adds r0, r1
	b _080D82AA
	.align 2, 0
_080D7B40: .4byte gBattlerPartyIndexes
_080D7B44: .4byte gLinkPlayers
_080D7B48: .4byte gEnemyParty
_080D7B4C:
	ldr r4, _080D7B70 @ =sBattler_AI
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	adds r2, r4, 0
	cmp r0, 0
	beq _080D7BC0
	ldr r0, _080D7B74 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x8
	ands r1, r0
	ldr r4, _080D7B78 @ =gUnknown_83FD555
	cmp r1, 0
	beq _080D7B8A
	ldr r4, _080D7B7C @ =gUnknown_83FD55B
	b _080D7B8A
	.align 2, 0
_080D7B70: .4byte sBattler_AI
_080D7B74: .4byte gBattleTypeFlags
_080D7B78: .4byte gUnknown_83FD555
_080D7B7C: .4byte gUnknown_83FD55B
_080D7B80:
	mov r3, r8
	adds r0, r3, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
_080D7B8A:
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _080D7B80
	ldrb r0, [r2]
	bl GetBattlerPosition
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	bl GetBattlerAtPosition
	ldr r1, _080D7BB8 @ =gBattlerPartyIndexes
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080D7BBC @ =gEnemyParty
	adds r0, r1
	b _080D82AA
	.align 2, 0
_080D7BB8: .4byte gBattlerPartyIndexes
_080D7BBC: .4byte gEnemyParty
_080D7BC0:
	ldrb r0, [r2]
	bl GetBattlerPosition
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	bl GetBattlerAtPosition
	ldr r1, _080D7BDC @ =gBattlerPartyIndexes
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	b _080D82D4
	.align 2, 0
_080D7BDC: .4byte gBattlerPartyIndexes
_080D7BE0:
	ldr r4, _080D7C14 @ =sBattler_AI
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080D7C20
	ldrb r0, [r4]
	bl GetBattlerPosition
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	bl GetBattlerAtPosition
	ldr r1, _080D7C18 @ =gBattlerPartyIndexes
	lsls r0, 24
	lsrs r0, 23
	adds r0, 0x4
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080D7C1C @ =gPlayerParty
	adds r0, r1
	b _080D82AA
	.align 2, 0
_080D7C14: .4byte sBattler_AI
_080D7C18: .4byte gBattlerPartyIndexes
_080D7C1C: .4byte gPlayerParty
_080D7C20:
	ldrb r0, [r4]
	bl GetBattlerPosition
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	bl GetBattlerAtPosition
	ldr r1, _080D7C44 @ =gBattlerPartyIndexes
	lsls r0, 24
	lsrs r0, 23
	adds r0, 0x4
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080D7C48 @ =gEnemyParty
	b _080D82DA
	.align 2, 0
_080D7C44: .4byte gBattlerPartyIndexes
_080D7C48: .4byte gEnemyParty
_080D7C4C:
	ldr r5, _080D7C98 @ =sBattler_AI
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080D7CB0
	ldr r0, _080D7C9C @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x8
	ands r1, r0
	ldr r4, _080D7CA0 @ =gUnknown_83FD555
	cmp r1, 0
	beq _080D7C6A
	ldr r4, _080D7CA4 @ =gUnknown_83FD55B
_080D7C6A:
	ldrb r1, [r4]
	adds r0, r1, 0
	ldr r3, _080D7CA8 @ =gBattlerPartyIndexes
	ldr r2, _080D7CAC @ =gEnemyParty
	mov r12, r2
	adds r2, r5, 0
	cmp r0, 0xFF
	beq _080D7C8C
_080D7C7A:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _080D7C7A
_080D7C8C:
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r1, [r0]
	b _080D82A4
	.align 2, 0
_080D7C98: .4byte sBattler_AI
_080D7C9C: .4byte gBattleTypeFlags
_080D7CA0: .4byte gUnknown_83FD555
_080D7CA4: .4byte gUnknown_83FD55B
_080D7CA8: .4byte gBattlerPartyIndexes
_080D7CAC: .4byte gEnemyParty
_080D7CB0:
	ldr r1, _080D7CBC @ =gBattlerPartyIndexes
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _080D82D4
	.align 2, 0
_080D7CBC: .4byte gBattlerPartyIndexes
_080D7CC0:
	ldr r5, _080D7D0C @ =gBattlerTarget
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080D7D24
	ldr r0, _080D7D10 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x8
	ands r1, r0
	ldr r4, _080D7D14 @ =gUnknown_83FD555
	cmp r1, 0
	beq _080D7CDE
	ldr r4, _080D7D18 @ =gUnknown_83FD55B
_080D7CDE:
	ldrb r1, [r4]
	adds r0, r1, 0
	ldr r3, _080D7D1C @ =gBattlerPartyIndexes
	ldr r2, _080D7D20 @ =gEnemyParty
	mov r12, r2
	adds r2, r5, 0
	cmp r0, 0xFF
	beq _080D7D00
_080D7CEE:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _080D7CEE
_080D7D00:
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r1, [r0]
	b _080D82A4
	.align 2, 0
_080D7D0C: .4byte gBattlerTarget
_080D7D10: .4byte gBattleTypeFlags
_080D7D14: .4byte gUnknown_83FD555
_080D7D18: .4byte gUnknown_83FD55B
_080D7D1C: .4byte gBattlerPartyIndexes
_080D7D20: .4byte gEnemyParty
_080D7D24:
	ldr r1, _080D7D30 @ =gBattlerPartyIndexes
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _080D82D4
	.align 2, 0
_080D7D30: .4byte gBattlerPartyIndexes
_080D7D34:
	ldr r5, _080D7D80 @ =gUnknown_2023D6E
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080D7D98
	ldr r0, _080D7D84 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x8
	ands r1, r0
	ldr r4, _080D7D88 @ =gUnknown_83FD555
	cmp r1, 0
	beq _080D7D52
	ldr r4, _080D7D8C @ =gUnknown_83FD55B
_080D7D52:
	ldrb r1, [r4]
	adds r0, r1, 0
	ldr r3, _080D7D90 @ =gBattlerPartyIndexes
	ldr r2, _080D7D94 @ =gEnemyParty
	mov r12, r2
	adds r2, r5, 0
	cmp r0, 0xFF
	beq _080D7D74
_080D7D62:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _080D7D62
_080D7D74:
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r1, [r0]
	b _080D82A4
	.align 2, 0
_080D7D80: .4byte gUnknown_2023D6E
_080D7D84: .4byte gBattleTypeFlags
_080D7D88: .4byte gUnknown_83FD555
_080D7D8C: .4byte gUnknown_83FD55B
_080D7D90: .4byte gBattlerPartyIndexes
_080D7D94: .4byte gEnemyParty
_080D7D98:
	ldr r1, _080D7DA4 @ =gBattlerPartyIndexes
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _080D82D4
	.align 2, 0
_080D7DA4: .4byte gBattlerPartyIndexes
_080D7DA8:
	ldr r5, _080D7DF4 @ =gActiveBattler
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080D7E0C
	ldr r0, _080D7DF8 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x8
	ands r1, r0
	ldr r4, _080D7DFC @ =gUnknown_83FD555
	cmp r1, 0
	beq _080D7DC6
	ldr r4, _080D7E00 @ =gUnknown_83FD55B
_080D7DC6:
	ldrb r1, [r4]
	adds r0, r1, 0
	ldr r3, _080D7E04 @ =gBattlerPartyIndexes
	ldr r2, _080D7E08 @ =gEnemyParty
	mov r12, r2
	adds r2, r5, 0
	cmp r0, 0xFF
	beq _080D7DE8
_080D7DD6:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _080D7DD6
_080D7DE8:
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r1, [r0]
	b _080D82A4
	.align 2, 0
_080D7DF4: .4byte gActiveBattler
_080D7DF8: .4byte gBattleTypeFlags
_080D7DFC: .4byte gUnknown_83FD555
_080D7E00: .4byte gUnknown_83FD55B
_080D7E04: .4byte gBattlerPartyIndexes
_080D7E08: .4byte gEnemyParty
_080D7E0C:
	ldr r1, _080D7E18 @ =gBattlerPartyIndexes
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _080D82D4
	.align 2, 0
_080D7E18: .4byte gBattlerPartyIndexes
_080D7E1C:
	ldr r5, _080D7E68 @ =gBattleScripting
	ldrb r0, [r5, 0x17]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080D7E80
	ldr r0, _080D7E6C @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x8
	ands r1, r0
	ldr r4, _080D7E70 @ =gUnknown_83FD555
	cmp r1, 0
	beq _080D7E3A
	ldr r4, _080D7E74 @ =gUnknown_83FD55B
_080D7E3A:
	ldrb r1, [r4]
	adds r0, r1, 0
	ldr r3, _080D7E78 @ =gBattlerPartyIndexes
	ldr r2, _080D7E7C @ =gEnemyParty
	mov r12, r2
	adds r2, r5, 0
	cmp r0, 0xFF
	beq _080D7E5C
_080D7E4A:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _080D7E4A
_080D7E5C:
	ldrb r0, [r2, 0x17]
	lsls r0, 1
	adds r0, r3
	ldrh r1, [r0]
	b _080D82A4
	.align 2, 0
_080D7E68: .4byte gBattleScripting
_080D7E6C: .4byte gBattleTypeFlags
_080D7E70: .4byte gUnknown_83FD555
_080D7E74: .4byte gUnknown_83FD55B
_080D7E78: .4byte gBattlerPartyIndexes
_080D7E7C: .4byte gEnemyParty
_080D7E80:
	ldr r1, _080D7E8C @ =gBattlerPartyIndexes
	ldrb r0, [r5, 0x17]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _080D82D4
	.align 2, 0
_080D7E8C: .4byte gBattlerPartyIndexes
_080D7E90:
	ldr r0, _080D7EA4 @ =gUnknown_2039A34
	ldr r2, [r0]
	ldrh r1, [r2]
	movs r0, 0xB1
	lsls r0, 1
	cmp r1, r0
	bhi _080D7EB6
	ldrh r1, [r2]
	b _080D7ED6
	.align 2, 0
_080D7EA4: .4byte gUnknown_2039A34
_080D7EA8:
	ldr r0, _080D7EC8 @ =gUnknown_2039A34
	ldr r2, [r0]
	ldrh r1, [r2, 0x2]
	movs r0, 0xB1
	lsls r0, 1
	cmp r1, r0
	bls _080D7ED4
_080D7EB6:
	ldr r0, _080D7ECC @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x8E
	ldrb r0, [r0]
	lsls r0, 2
	ldr r1, _080D7ED0 @ =gUnknown_83FEA28
	adds r4, r0, r1
	b _080D8382
	.align 2, 0
_080D7EC8: .4byte gUnknown_2039A34
_080D7ECC: .4byte gBattleStruct
_080D7ED0: .4byte gUnknown_83FEA28
_080D7ED4:
	ldrh r1, [r2, 0x2]
_080D7ED6:
	movs r0, 0xD
	muls r1, r0
	ldr r0, _080D7EE0 @ =gUnknown_8247094
	adds r4, r1, r0
	b _080D8382
	.align 2, 0
_080D7EE0: .4byte gUnknown_8247094
_080D7EE4:
	ldr r0, _080D7F1C @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D7F9C
	ldr r2, _080D7F20 @ =gUnknown_2023D68
	ldrh r0, [r2]
	cmp r0, 0xAF
	bne _080D7F98
	movs r0, 0x40
	ands r1, r0
	cmp r1, 0
	bne _080D7F44
	ldr r0, _080D7F24 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xB5
	ldrb r0, [r0]
	cmp r0, 0
	beq _080D7F2C
	ldr r2, _080D7F28 @ =gPotentialItemEffectBattler
	ldrb r1, [r2]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080D7F38
	b _080D7F90
	.align 2, 0
_080D7F1C: .4byte gBattleTypeFlags
_080D7F20: .4byte gUnknown_2023D68
_080D7F24: .4byte gBattleStruct
_080D7F28: .4byte gPotentialItemEffectBattler
_080D7F2C:
	ldr r2, _080D7F40 @ =gPotentialItemEffectBattler
	ldrb r1, [r2]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080D7F90
_080D7F38:
	ldrb r0, [r2]
	lsls r1, r0, 3
	subs r1, r0
	b _080D7F64
	.align 2, 0
_080D7F40: .4byte gPotentialItemEffectBattler
_080D7F44:
	ldr r2, _080D7F7C @ =gLinkPlayers
	ldr r0, _080D7F80 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xB5
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _080D7F84 @ =gPotentialItemEffectBattler
	ldrb r2, [r1]
	ldrh r0, [r0, 0x18]
	cmp r0, r2
	bne _080D7F90
	lsls r1, r2, 3
	subs r1, r2
_080D7F64:
	lsls r1, 2
	ldr r0, _080D7F88 @ =gEnigmaBerries
	adds r1, r0
	mov r0, sp
	bl StringCopy
	ldr r1, _080D7F8C @ =gUnknown_83FD8AF
	mov r0, sp
	bl StringAppend
	mov r4, sp
	b _080D8382
	.align 2, 0
_080D7F7C: .4byte gLinkPlayers
_080D7F80: .4byte gBattleStruct
_080D7F84: .4byte gPotentialItemEffectBattler
_080D7F88: .4byte gEnigmaBerries
_080D7F8C: .4byte gUnknown_83FD8AF
_080D7F90:
	ldr r4, _080D7F94 @ =gUnknown_83FD8A2
	b _080D8382
	.align 2, 0
_080D7F94: .4byte gUnknown_83FD8A2
_080D7F98:
	ldrh r0, [r2]
	b _080D7FA0
_080D7F9C:
	ldr r0, _080D7FAC @ =gUnknown_2023D68
	ldrh r0, [r0]
_080D7FA0:
	mov r1, sp
	bl sub_8099E90
	mov r4, sp
	b _080D8382
	.align 2, 0
_080D7FAC: .4byte gUnknown_2023D68
_080D7FB0:
	ldr r0, _080D7FB4 @ =gLastUsedAbility
	b _080D7FF0
	.align 2, 0
_080D7FB4: .4byte gLastUsedAbility
_080D7FB8:
	ldr r1, _080D7FC0 @ =gUnknown_2039A30
	ldr r0, _080D7FC4 @ =sBattler_AI
	b _080D7FEC
	.align 2, 0
_080D7FC0: .4byte gUnknown_2039A30
_080D7FC4: .4byte sBattler_AI
_080D7FC8:
	ldr r1, _080D7FD0 @ =gUnknown_2039A30
	ldr r0, _080D7FD4 @ =gBattlerTarget
	b _080D7FEC
	.align 2, 0
_080D7FD0: .4byte gUnknown_2039A30
_080D7FD4: .4byte gBattlerTarget
_080D7FD8:
	ldr r1, _080D7FE0 @ =gUnknown_2039A30
	ldr r0, _080D7FE4 @ =gBattleScripting
	ldrb r0, [r0, 0x17]
	b _080D7FEE
	.align 2, 0
_080D7FE0: .4byte gUnknown_2039A30
_080D7FE4: .4byte gBattleScripting
_080D7FE8:
	ldr r1, _080D7FFC @ =gUnknown_2039A30
	ldr r0, _080D8000 @ =gUnknown_2023D6E
_080D7FEC:
	ldrb r0, [r0]
_080D7FEE:
	adds r0, r1
_080D7FF0:
	ldrb r1, [r0]
	movs r0, 0xD
	muls r1, r0
	ldr r0, _080D8004 @ =gUnknown_824FC40
	adds r4, r1, r0
	b _080D8382
	.align 2, 0
_080D7FFC: .4byte gUnknown_2039A30
_080D8000: .4byte gUnknown_2023D6E
_080D8004: .4byte gUnknown_824FC40
_080D8008:
	ldr r3, _080D8020 @ =gTrainerBattleOpponent_A
	ldrh r1, [r3]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _080D8024
	bl GetSecretBaseTrainerNameIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xD
	b _080D8094
	.align 2, 0
_080D8020: .4byte gTrainerBattleOpponent_A
_080D8024:
	movs r0, 0xC0
	lsls r0, 4
	cmp r1, r0
	bne _080D8038
	bl sub_80447F0
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xD
	b _080D8094
_080D8038:
	ldr r0, _080D8054 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080D8058
	bl sub_80E60E4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xD
	b _080D8094
	.align 2, 0
_080D8054: .4byte gBattleTypeFlags
_080D8058:
	movs r0, 0x80
	lsls r0, 12
	ands r0, r1
	cmp r0, 0
	beq _080D806E
	bl sub_815DA10
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xD
	b _080D8094
_080D806E:
	movs r0, 0x80
	lsls r0, 4
	ands r1, r0
	cmp r1, 0
	beq _080D8084
	bl GetEreaderTrainerClassId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xD
	b _080D8094
_080D8084:
	ldr r2, _080D809C @ =gTrainers
	ldrh r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r1, [r0, 0x1]
	movs r0, 0xD
_080D8094:
	muls r1, r0
	ldr r0, _080D80A0 @ =gUnknown_823E558
	adds r4, r1, r0
	b _080D8382
	.align 2, 0
_080D809C: .4byte gTrainers
_080D80A0: .4byte gUnknown_823E558
_080D80A4:
	ldr r0, _080D80E8 @ =gTrainerBattleOpponent_A
	ldrh r2, [r0]
	movs r1, 0x80
	lsls r1, 3
	adds r5, r0, 0
	cmp r2, r1
	bne _080D80D6
	movs r2, 0
	ldr r0, _080D80EC @ =gBattleResources
	ldr r3, [r0]
_080D80B8:
	mov r1, sp
	adds r0, r1, r2
	ldr r1, [r3]
	adds r1, 0x2
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x6
	ble _080D80B8
	mov r3, sp
	adds r1, r3, r2
	movs r0, 0xFF
	strb r0, [r1]
	mov r4, sp
_080D80D6:
	ldrh r1, [r5]
	movs r0, 0xC0
	lsls r0, 4
	cmp r1, r0
	bne _080D80F0
	movs r1, 0x1
	adds r0, r7, 0
	eors r0, r1
	b _080D81C8
	.align 2, 0
_080D80E8: .4byte gTrainerBattleOpponent_A
_080D80EC: .4byte gBattleResources
_080D80F0:
	ldr r0, _080D8108 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080D810C
	mov r0, sp
	bl sub_80E6150
	b _080D8382
	.align 2, 0
_080D8108: .4byte gBattleTypeFlags
_080D810C:
	movs r0, 0x80
	lsls r0, 12
	ands r0, r1
	cmp r0, 0
	beq _080D8120
	mov r0, sp
	bl sub_815DA28
	mov r4, sp
	b _080D8382
_080D8120:
	movs r0, 0x80
	lsls r0, 4
	ands r1, r0
	cmp r1, 0
	beq _080D8134
	mov r0, sp
	bl sub_80E7460
	mov r4, sp
	b _080D8382
_080D8134:
	ldr r2, _080D8158 @ =gTrainers
	ldrh r0, [r5]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r0, r1, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0x51
	beq _080D814E
	cmp r0, 0x59
	beq _080D814E
	cmp r0, 0x5A
	bne _080D815C
_080D814E:
	movs r0, 0x6
	bl GetExpandedPlaceholder
	adds r4, r0, 0
	b _080D8382
	.align 2, 0
_080D8158: .4byte gTrainers
_080D815C:
	adds r0, r2, 0x4
	adds r4, r1, r0
	b _080D8382
_080D8162:
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	ldr r1, _080D8170 @ =gUnknown_2022744
	adds r4, r0, r1
	b _080D8382
	.align 2, 0
_080D8170: .4byte gUnknown_2022744
_080D8174:
	ldr r4, _080D8184 @ =gLinkPlayers
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x18]
	movs r0, 0x2
	b _080D81AA
	.align 2, 0
_080D8184: .4byte gLinkPlayers
_080D8188:
	ldr r4, _080D8198 @ =gLinkPlayers
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x18]
	movs r0, 0x1
	b _080D81AA
	.align 2, 0
_080D8198: .4byte gLinkPlayers
_080D819C:
	ldr r4, _080D81BC @ =gLinkPlayers
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x18]
	movs r0, 0x3
_080D81AA:
	eors r0, r1
	bl GetBankMultiplayerId
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r4, 0x8
	adds r4, r1, r4
	b _080D8382
	.align 2, 0
_080D81BC: .4byte gLinkPlayers
_080D81C0:
	ldr r0, _080D81D4 @ =gBattleScripting
	ldrb r0, [r0, 0x17]
	bl GetBankMultiplayerId
_080D81C8:
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, _080D81D8 @ =gUnknown_2022744
	adds r4, r1, r0
	b _080D8382
	.align 2, 0
_080D81D4: .4byte gBattleScripting
_080D81D8: .4byte gUnknown_2022744
_080D81DC:
	ldr r0, _080D81E4 @ =gSaveBlock2Ptr
	ldr r4, [r0]
	b _080D8382
	.align 2, 0
_080D81E4: .4byte gSaveBlock2Ptr
_080D81E8:
	ldr r0, _080D8204 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 12
	ands r0, r1
	cmp r0, 0
	beq _080D820C
	ldr r4, _080D8208 @ =gStringVar4
	adds r0, r4, 0
	movs r1, 0
	bl sub_815DC40
	b _080D8382
	.align 2, 0
_080D8204: .4byte gBattleTypeFlags
_080D8208: .4byte gStringVar4
_080D820C:
	bl sub_80806EC
	adds r4, r0, 0
	b _080D8382
_080D8214:
	ldr r0, _080D8230 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 12
	ands r0, r1
	cmp r0, 0
	beq _080D8238
	ldr r4, _080D8234 @ =gStringVar4
	adds r0, r4, 0
	movs r1, 0
	bl sub_815DBF4
	b _080D8382
	.align 2, 0
_080D8230: .4byte gBattleTypeFlags
_080D8234: .4byte gStringVar4
_080D8238:
	bl sub_8080710
	adds r4, r0, 0
	b _080D8382
_080D8240:
	ldr r4, _080D824C @ =gStringVar4
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_815DC40
	b _080D8382
	.align 2, 0
_080D824C: .4byte gStringVar4
_080D8250:
	ldr r4, _080D825C @ =gStringVar4
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_815DBF4
	b _080D8382
	.align 2, 0
_080D825C: .4byte gStringVar4
_080D8260:
	ldr r0, _080D82B4 @ =gBattleScripting
	ldrb r0, [r0, 0x17]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080D82CC
	ldr r0, _080D82B8 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x8
	ands r1, r0
	ldr r4, _080D82BC @ =gUnknown_83FD555
	cmp r1, 0
	beq _080D827E
	ldr r4, _080D82C0 @ =gUnknown_83FD55B
_080D827E:
	ldrb r1, [r4]
	adds r0, r1, 0
	ldr r5, _080D82C4 @ =gEnemyParty
	mov r12, r5
	ldr r2, _080D82C8 @ =gBattleStruct
	cmp r0, 0xFF
	beq _080D829E
_080D828C:
	mov r3, r8
	adds r0, r3, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _080D828C
_080D829E:
	ldr r0, [r2]
	adds r0, 0x52
	ldrb r1, [r0]
_080D82A4:
	movs r0, 0x64
	muls r0, r1
	add r0, r12
_080D82AA:
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	b _080D82E4
	.align 2, 0
_080D82B4: .4byte gBattleScripting
_080D82B8: .4byte gBattleTypeFlags
_080D82BC: .4byte gUnknown_83FD555
_080D82C0: .4byte gUnknown_83FD55B
_080D82C4: .4byte gEnemyParty
_080D82C8: .4byte gBattleStruct
_080D82CC:
	ldr r0, _080D82F0 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x52
	ldrb r1, [r0]
_080D82D4:
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080D82F4 @ =gPlayerParty
_080D82DA:
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
_080D82E4:
	mov r0, sp
	bl StringGetEnd10
	mov r4, sp
	b _080D8382
	.align 2, 0
_080D82F0: .4byte gBattleStruct
_080D82F4: .4byte gPlayerParty
_080D82F8:
	ldr r0, _080D830C @ =0x00000834
	bl FlagGet
	lsls r0, 24
	ldr r4, _080D8310 @ =gUnknown_83FD81A
	cmp r0, 0
	beq _080D8382
	ldr r4, _080D8314 @ =gUnknown_83FD824
	b _080D8382
	.align 2, 0
_080D830C: .4byte 0x00000834
_080D8310: .4byte gUnknown_83FD81A
_080D8314: .4byte gUnknown_83FD824
_080D8318:
	ldr r0, _080D831C @ =sBattler_AI
	b _080D8322
	.align 2, 0
_080D831C: .4byte sBattler_AI
_080D8320:
	ldr r0, _080D8334 @ =gBattlerTarget
_080D8322:
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	ldr r4, _080D8338 @ =gUnknown_83FD569
	cmp r0, 0
	bne _080D8382
	ldr r4, _080D833C @ =gUnknown_83FD56D
	b _080D8382
	.align 2, 0
_080D8334: .4byte gBattlerTarget
_080D8338: .4byte gUnknown_83FD569
_080D833C: .4byte gUnknown_83FD56D
_080D8340:
	ldr r0, _080D8344 @ =sBattler_AI
	b _080D834A
	.align 2, 0
_080D8344: .4byte sBattler_AI
_080D8348:
	ldr r0, _080D835C @ =gBattlerTarget
_080D834A:
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	ldr r4, _080D8360 @ =gUnknown_83FD560
	cmp r0, 0
	bne _080D8382
	ldr r4, _080D8364 @ =gUnknown_83FD564
	b _080D8382
	.align 2, 0
_080D835C: .4byte gBattlerTarget
_080D8360: .4byte gUnknown_83FD560
_080D8364: .4byte gUnknown_83FD564
_080D8368:
	ldr r0, _080D836C @ =sBattler_AI
	b _080D8372
	.align 2, 0
_080D836C: .4byte sBattler_AI
_080D8370:
	ldr r0, _080D83D4 @ =gBattlerTarget
_080D8372:
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	ldr r4, _080D83D8 @ =gUnknown_83FD572
	cmp r0, 0
	bne _080D8382
	ldr r4, _080D83DC @ =gUnknown_83FD576
_080D8382:
	ldrb r1, [r4]
	adds r0, r1, 0
	mov r5, r9
	ldrb r2, [r5]
	mov r3, r9
	adds r3, 0x1
	cmp r0, 0xFF
	beq _080D83A4
_080D8392:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _080D8392
_080D83A4:
	adds r0, r2, 0
	subs r0, 0x24
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080D83BC
	lsls r0, r2, 24
	lsrs r0, 24
	cmp r0, 0x2E
	beq _080D83BC
	cmp r0, 0x2F
	bne _080D83EC
_080D83BC:
	mov r0, r8
	adds r1, r0, r6
	movs r0, 0xFC
	strb r0, [r1]
	adds r6, 0x1
	mov r2, r8
	adds r1, r2, r6
	movs r0, 0x9
	strb r0, [r1]
	adds r6, 0x1
	b _080D83EC
	.align 2, 0
_080D83D4: .4byte gBattlerTarget
_080D83D8: .4byte gUnknown_83FD572
_080D83DC: .4byte gUnknown_83FD576
_080D83E0:
	mov r3, r8
	adds r0, r3, r6
	strb r1, [r0]
	adds r6, 0x1
	mov r3, r9
	adds r3, 0x1
_080D83EC:
	mov r9, r3
	ldrb r1, [r3]
_080D83F0:
	adds r0, r1, 0
	cmp r0, 0xFF
	beq _080D83FA
	bl _080D788A
_080D83FA:
	mov r5, r8
	adds r1, r5, r6
	mov r2, r9
	ldrb r0, [r2]
	strb r0, [r1]
	adds r6, 0x1
	adds r0, r6, 0
	add sp, 0x20
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end BattleStringExpandPlaceholders

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
	ldr r0, _080D8494 @ =gUnknown_83FDF3C
	subs r1, 0xC
	lsls r1, 2
	adds r1, r0
	ldr r1, [r1]
	b _080D868E
	.align 2, 0
_080D8494: .4byte gUnknown_83FDF3C
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
	ldr r0, _080D8500 @ =gUnknown_8247094
	adds r1, r0
	b _080D868E
	.align 2, 0
_080D8500: .4byte gUnknown_8247094
_080D8504:
	adds r0, r5, r7
	ldrb r0, [r0, 0x1]
	lsls r1, r0, 3
	subs r1, r0
	ldr r0, _080D8510 @ =gUnknown_824F1A0
	b _080D8616
	.align 2, 0
_080D8510: .4byte gUnknown_824F1A0
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
	ldr r1, _080D8554 @ =gUnknown_83FD55B
	adds r0, r6, 0
	bl StringAppend
	b _080D8560
	.align 2, 0
_080D8550: .4byte gBattleTypeFlags
_080D8554: .4byte gUnknown_83FD55B
_080D8558:
	ldr r1, _080D8584 @ =gUnknown_83FD555
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
_080D8584: .4byte gUnknown_83FD555
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
	ldr r0, _080D8624 @ =gUnknown_824FC40
_080D8616:
	adds r1, r0
_080D8618:
	adds r0, r6, 0
	bl StringAppend
	adds r5, 0x2
	b _080D86B0
	.align 2, 0
_080D8624: .4byte gUnknown_824FC40
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
	ldr r1, _080D8688 @ =gUnknown_83FD8AF
	b _080D868E
	.align 2, 0
_080D8674: .4byte gBattleTypeFlags
_080D8678: .4byte gLinkPlayers
_080D867C: .4byte gBattleStruct
_080D8680: .4byte gPotentialItemEffectBattler
_080D8684: .4byte gEnigmaBerries
_080D8688: .4byte gUnknown_83FD8AF
_080D868C:
	ldr r1, _080D8698 @ =gUnknown_83FD8A2
_080D868E:
	adds r0, r6, 0
	bl StringAppend
	b _080D86AE
	.align 2, 0
_080D8698: .4byte gUnknown_83FD8A2
_080D869C:
	adds r0, r2, 0
	adds r1, r6, 0
	bl sub_8099E90
	b _080D86AE
_080D86A6:
	adds r0, r2, 0
	adds r1, r6, 0
	bl sub_8099E90
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

	thumb_func_start sub_80D86C8
sub_80D86C8: @ 80D86C8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r2, 0
	ldr r5, _080D86FC @ =gUnknown_2039A34
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
_080D86FC: .4byte gUnknown_2039A34
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
	thumb_func_end sub_80D86C8

	thumb_func_start sub_80D8720
sub_80D8720: @ 80D8720
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
	ldr r5, _080D8764 @ =gUnknown_2039A34
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
_080D8764: .4byte gUnknown_2039A34
_080D8768: .4byte _080D876C
	.align 2, 0
_080D876C:
	.4byte _080D8780
	.4byte _080D8788
	.4byte _080D8790
	.4byte _080D8798
	.4byte _080D87A8
_080D8780:
	ldr r1, _080D8784 @ =gUnknown_83FD586
	b _080D879A
	.align 2, 0
_080D8784: .4byte gUnknown_83FD586
_080D8788:
	ldr r1, _080D878C @ =gUnknown_83FD588
	b _080D879A
	.align 2, 0
_080D878C: .4byte gUnknown_83FD588
_080D8790:
	ldr r1, _080D8794 @ =gUnknown_83FD58A
	b _080D879A
	.align 2, 0
_080D8794: .4byte gUnknown_83FD58A
_080D8798:
	ldr r1, _080D87A4 @ =gUnknown_83FD58C
_080D879A:
	adds r0, r3, 0
	bl StringCopy
	b _080D87B0
	.align 2, 0
_080D87A4: .4byte gUnknown_83FD58C
_080D87A8:
	ldr r1, _080D87B8 @ =gUnknown_83FD58E
	adds r0, r3, 0
	bl StringCopy
_080D87B0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D87B8: .4byte gUnknown_83FD58E
	thumb_func_end sub_80D8720

	thumb_func_start sub_80D87BC
sub_80D87BC: @ 80D87BC
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
	bl sub_80CBE00
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
	bl sub_80F78A8
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
	thumb_func_end sub_80D87BC

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
	ldr r0, _080D8A3C @ =gUnknown_2022BC8
	adds r1, r0
	ldr r4, _080D8A40 @ =gUnknown_8D2FBB4
	ldr r0, _080D8A44 @ =gUnknown_2023FFC
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
_080D8A3C: .4byte gUnknown_2022BC8
_080D8A40: .4byte gUnknown_8D2FBB4
_080D8A44: .4byte gUnknown_2023FFC
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
