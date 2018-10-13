	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8074480
sub_8074480: @ 8074480
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r4, 0x4
	bhi _08074500
	lsls r0, r4, 2
	ldr r1, _08074498 @ =_0807449C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08074498: .4byte _0807449C
	.align 2, 0
_0807449C:
	.4byte _080744B0
	.4byte _080744D8
	.4byte _080744B0
	.4byte _08074500
	.4byte _08074500
_080744B0:
	ldr r4, _080744D0 @ =gUnknown_83AE01C
	adds r0, r5, 0
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 22
	ldr r1, _080744D4 @ =gBattleTypeFlags
	ldr r1, [r1]
	movs r2, 0x1
	ands r1, r2
	lsls r1, 4
	adds r0, r1
	adds r0, r4
	ldrb r0, [r0]
	b _08074588
	.align 2, 0
_080744D0: .4byte gUnknown_83AE01C
_080744D4: .4byte gBattleTypeFlags
_080744D8:
	ldr r4, _080744F8 @ =gUnknown_83AE01C
	adds r0, r5, 0
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 22
	ldr r1, _080744FC @ =gBattleTypeFlags
	ldr r1, [r1]
	movs r2, 0x1
	ands r1, r2
	lsls r1, 4
	adds r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x1]
	b _08074588
	.align 2, 0
_080744F8: .4byte gUnknown_83AE01C
_080744FC: .4byte gBattleTypeFlags
_08074500:
	adds r0, r5, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08074538
	ldr r0, _0807452C @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08074570
	ldr r1, _08074530 @ =gBattlerPartyIndexes
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08074534 @ =gEnemyParty
	b _08074556
	.align 2, 0
_0807452C: .4byte gUnknown_2024018
_08074530: .4byte gBattlerPartyIndexes
_08074534: .4byte gEnemyParty
_08074538:
	ldr r0, _08074564 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08074570
	ldr r1, _08074568 @ =gBattlerPartyIndexes
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0807456C @ =gPlayerParty
_08074556:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	b _08074572
	.align 2, 0
_08074564: .4byte gUnknown_2024018
_08074568: .4byte gBattlerPartyIndexes
_0807456C: .4byte gPlayerParty
_08074570:
	ldrh r1, [r1, 0x2]
_08074572:
	cmp r4, 0x3
	bne _0807457C
	adds r0, r5, 0
	movs r2, 0x1
	b _08074580
_0807457C:
	adds r0, r5, 0
	movs r2, 0
_08074580:
	bl sub_80747AC
	lsls r0, 24
	lsrs r0, 24
_08074588:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8074480

	thumb_func_start sub_8074590
sub_8074590: @ 8074590
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	lsls r1, 16
	lsrs r4, r1, 16
	adds r7, r4, 0
	adds r0, r5, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08074674
	cmp r4, 0xC9
	bne _08074638
	ldr r0, _080745D8 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0]
	lsls r1, r5, 2
	adds r0, r1, r0
	ldrh r0, [r0, 0x2]
	cmp r0, 0
	bne _080745E4
	ldr r1, _080745DC @ =gBattlerPartyIndexes
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080745E0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0
	bl GetMonData
	adds r2, r0, 0
	b _080745EA
	.align 2, 0
_080745D8: .4byte gUnknown_2024018
_080745DC: .4byte gBattlerPartyIndexes
_080745E0: .4byte gPlayerParty
_080745E4:
	ldr r0, _08074620 @ =gUnknown_2024008
	adds r0, r1, r0
	ldr r2, [r0]
_080745EA:
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _08074624
	adds r0, r7, 0
	b _0807462E
	.align 2, 0
_08074620: .4byte gUnknown_2024008
_08074624:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_0807462E:
	ldr r1, _08074634 @ =gUnknown_8235E6C
	lsls r0, 2
	b _0807473C
	.align 2, 0
_08074634: .4byte gUnknown_8235E6C
_08074638:
	ldr r0, _0807464C @ =0x00000181
	cmp r4, r0
	bne _08074658
	ldr r0, _08074650 @ =gUnknown_83AE050
	ldr r1, _08074654 @ =gBattleMonForms
	adds r1, r5, r1
	ldrb r1, [r1]
	adds r1, r0
	ldrb r0, [r1]
	b _08074740
	.align 2, 0
_0807464C: .4byte 0x00000181
_08074650: .4byte gUnknown_83AE050
_08074654: .4byte gBattleMonForms
_08074658:
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bls _08074668
	ldr r0, _08074664 @ =gUnknown_8235E6C
	b _0807473E
	.align 2, 0
_08074664: .4byte gUnknown_8235E6C
_08074668:
	ldr r1, _08074670 @ =gUnknown_8235E6C
	lsls r0, r4, 2
	b _0807473C
	.align 2, 0
_08074670: .4byte gUnknown_8235E6C
_08074674:
	cmp r4, 0xC9
	bne _08074704
	ldr r0, _080746A4 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0]
	lsls r1, r5, 2
	adds r0, r1, r0
	ldrh r0, [r0, 0x2]
	cmp r0, 0
	bne _080746B0
	ldr r1, _080746A8 @ =gBattlerPartyIndexes
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080746AC @ =gEnemyParty
	adds r0, r1
	movs r1, 0
	bl GetMonData
	adds r2, r0, 0
	b _080746B6
	.align 2, 0
_080746A4: .4byte gUnknown_2024018
_080746A8: .4byte gBattlerPartyIndexes
_080746AC: .4byte gEnemyParty
_080746B0:
	ldr r0, _080746EC @ =gUnknown_2024008
	adds r0, r1, r0
	ldr r2, [r0]
_080746B6:
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _080746F0
	adds r0, r7, 0
	b _080746FA
	.align 2, 0
_080746EC: .4byte gUnknown_2024008
_080746F0:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_080746FA:
	ldr r1, _08074700 @ =gUnknown_82349CC
	lsls r0, 2
	b _0807473C
	.align 2, 0
_08074700: .4byte gUnknown_82349CC
_08074704:
	ldr r0, _0807471C @ =0x00000181
	cmp r4, r0
	bne _08074728
	ldr r0, _08074720 @ =gUnknown_83AE03C
	ldr r1, _08074724 @ =gBattleMonForms
	adds r1, r6, r1
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	b _08074740
	.align 2, 0
_0807471C: .4byte 0x00000181
_08074720: .4byte gUnknown_83AE03C
_08074724: .4byte gBattleMonForms
_08074728:
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bls _08074738
	ldr r0, _08074734 @ =gUnknown_82349CC
	b _0807473E
	.align 2, 0
_08074734: .4byte gUnknown_82349CC
_08074738:
	ldr r1, _08074748 @ =gUnknown_82349CC
	lsls r0, r7, 2
_0807473C:
	adds r0, r1
_0807473E:
	ldrb r0, [r0, 0x1]
_08074740:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08074748: .4byte gUnknown_82349CC
	thumb_func_end sub_8074590

	thumb_func_start sub_807474C
sub_807474C: @ 807474C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	adds r7, r4, 0
	movs r5, 0
	adds r0, r6, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0807479E
	ldr r0, _0807477C @ =0x00000181
	cmp r4, r0
	bne _08074788
	ldr r0, _08074780 @ =gUnknown_83AE04C
	ldr r1, _08074784 @ =gBattleMonForms
	adds r1, r6, r1
	ldrb r1, [r1]
	adds r1, r0
	ldrb r5, [r1]
	b _0807479E
	.align 2, 0
_0807477C: .4byte 0x00000181
_08074780: .4byte gUnknown_83AE04C
_08074784: .4byte gBattleMonForms
_08074788:
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bls _08074798
	ldr r0, _08074794 @ =gUnknown_823A004
	b _0807479C
	.align 2, 0
_08074794: .4byte gUnknown_823A004
_08074798:
	ldr r0, _080747A8 @ =gUnknown_823A004
	adds r0, r7, r0
_0807479C:
	ldrb r5, [r0]
_0807479E:
	adds r0, r5, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080747A8: .4byte gUnknown_823A004
	thumb_func_end sub_807474C

	thumb_func_start sub_80747AC
sub_80747AC: @ 80747AC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	lsrs r7, r2, 24
	adds r0, r6, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080747D4
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_8074590
	lsls r0, 24
	lsrs r5, r0, 24
	b _080747F2
_080747D4:
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_8074590
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_807474C
	lsls r0, 24
	lsrs r0, 24
	subs r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
_080747F2:
	adds r0, r6, 0
	bl GetBattlerPosition
	ldr r3, _0807483C @ =gUnknown_83AE01C
	lsls r0, 24
	lsrs r0, 22
	ldr r1, _08074840 @ =gBattleTypeFlags
	ldr r1, [r1]
	movs r2, 0x1
	ands r1, r2
	lsls r1, 4
	adds r0, r1
	adds r0, r3
	ldrb r0, [r0, 0x1]
	adds r0, r5
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r7, 0
	beq _08074832
	adds r0, r6, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _0807482C
	adds r0, r4, 0
	adds r0, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
_0807482C:
	cmp r4, 0x68
	bls _08074832
	movs r4, 0x68
_08074832:
	adds r0, r4, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807483C: .4byte gUnknown_83AE01C
_08074840: .4byte gBattleTypeFlags
	thumb_func_end sub_80747AC

	thumb_func_start sub_8074844
sub_8074844: @ 8074844
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	movs r0, 0xFD
	lsls r0, 24
	adds r1, r0
	lsrs r1, 24
	cmp r1, 0x1
	bhi _08074896
	ldr r0, _08074874 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r2, 2
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _0807487C
	ldr r1, _08074878 @ =gUnknown_2037F1C
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	b _0807487E
	.align 2, 0
_08074874: .4byte gUnknown_2024018
_08074878: .4byte gUnknown_2037F1C
_0807487C:
	ldrh r1, [r1, 0x2]
_0807487E:
	cmp r3, 0x3
	bne _0807488C
	adds r0, r2, 0
	movs r2, 0x1
	bl sub_80747AC
	b _0807489E
_0807488C:
	adds r0, r2, 0
	movs r2, 0
	bl sub_80747AC
	b _0807489E
_08074896:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_8074480
_0807489E:
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8074844

	thumb_func_start GetBankSpriteDefault_Y
GetBankSpriteDefault_Y: @ 80748A8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x4
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetBankSpriteDefault_Y

	thumb_func_start GetSubstituteSpriteDefault_Y
GetSubstituteSpriteDefault_Y: @ 80748BC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080748E0
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 8
	movs r1, 0x80
	lsls r1, 13
	b _080748F0
_080748E0:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 8
	movs r1, 0x88
	lsls r1, 13
_080748F0:
	adds r0, r1
	lsrs r0, 16
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetSubstituteSpriteDefault_Y

	thumb_func_start sub_8074900
sub_8074900: @ 8074900
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0807491A
	adds r0, r4, 0
	movs r1, 0x1
	b _0807491E
_0807491A:
	adds r0, r4, 0
	movs r1, 0x4
_0807491E:
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8074900

	thumb_func_start sub_807492C
sub_807492C: @ 807492C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08074978
	ldr r0, _0807496C @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _080749B0
	ldr r1, _08074970 @ =gBattlerPartyIndexes
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08074974 @ =gEnemyParty
	b _08074996
	.align 2, 0
_0807496C: .4byte gUnknown_2024018
_08074970: .4byte gBattlerPartyIndexes
_08074974: .4byte gEnemyParty
_08074978:
	ldr r0, _080749A4 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _080749B0
	ldr r1, _080749A8 @ =gBattlerPartyIndexes
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080749AC @ =gPlayerParty
_08074996:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	b _080749B2
	.align 2, 0
_080749A4: .4byte gUnknown_2024018
_080749A8: .4byte gBattlerPartyIndexes
_080749AC: .4byte gPlayerParty
_080749B0:
	ldrh r4, [r1, 0x2]
_080749B2:
	adds r0, r5, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080749CC
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_807474C
	subs r0, r6, r0
	lsls r0, 24
	lsrs r6, r0, 24
_080749CC:
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_807492C

	thumb_func_start GetAnimBankSpriteId
GetAnimBankSpriteId: @ 80749D4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0
	bne _080749FC
	ldr r4, _080749F4 @ =gUnknown_2037F1A
	ldrb r0, [r4]
	bl sub_8075224
	lsls r0, 24
	cmp r0, 0
	beq _08074A4A
	ldr r1, _080749F8 @ =gUnknown_2023D44
	ldrb r0, [r4]
	b _08074A5A
	.align 2, 0
_080749F4: .4byte gUnknown_2037F1A
_080749F8: .4byte gUnknown_2023D44
_080749FC:
	cmp r0, 0x1
	bne _08074A1C
	ldr r4, _08074A14 @ =gUnknown_2037F1B
	ldrb r0, [r4]
	bl sub_8075224
	lsls r0, 24
	cmp r0, 0
	beq _08074A4A
	ldr r1, _08074A18 @ =gUnknown_2023D44
	ldrb r0, [r4]
	b _08074A5A
	.align 2, 0
_08074A14: .4byte gUnknown_2037F1B
_08074A18: .4byte gUnknown_2023D44
_08074A1C:
	cmp r1, 0x2
	bne _08074A38
	ldr r5, _08074A34 @ =gUnknown_2037F1A
	ldrb r0, [r5]
	movs r4, 0x2
	eors r0, r4
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _08074A4A
	b _08074A54
	.align 2, 0
_08074A34: .4byte gUnknown_2037F1A
_08074A38:
	ldr r5, _08074A50 @ =gUnknown_2037F1B
	ldrb r0, [r5]
	movs r4, 0x2
	eors r0, r4
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	bne _08074A54
_08074A4A:
	movs r0, 0xFF
	b _08074A5E
	.align 2, 0
_08074A50: .4byte gUnknown_2037F1B
_08074A54:
	ldr r1, _08074A64 @ =gUnknown_2023D44
	ldrb r0, [r5]
	eors r0, r4
_08074A5A:
	adds r0, r1
	ldrb r0, [r0]
_08074A5E:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08074A64: .4byte gUnknown_2023D44
	thumb_func_end GetAnimBankSpriteId

	thumb_func_start StoreSpriteCallbackInData6
StoreSpriteCallbackInData6: @ 8074A68
	strh r1, [r0, 0x3A]
	lsrs r1, 16
	strh r1, [r0, 0x3C]
	bx lr
	thumb_func_end StoreSpriteCallbackInData6

	thumb_func_start SetCallbackToStoredInData
SetCallbackToStoredInData: @ 8074A70
	ldrh r2, [r0, 0x3A]
	movs r3, 0x3C
	ldrsh r1, [r0, r3]
	lsls r1, 16
	orrs r2, r1
	str r2, [r0, 0x1C]
	bx lr
	thumb_func_end SetCallbackToStoredInData

	thumb_func_start sub_8074A80
sub_8074A80: @ 8074A80
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08074AD4
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _08074AC0
	ldr r2, _08074ABC @ =0xffffff00
	b _08074AC8
	.align 2, 0
_08074ABC: .4byte 0xffffff00
_08074AC0:
	cmp r0, 0
	bge _08074ACC
	movs r2, 0x80
	lsls r2, 1
_08074AC8:
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
_08074ACC:
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _08074ADA
_08074AD4:
	adds r0, r4, 0
	bl SetCallbackToStoredInData
_08074ADA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8074A80

	thumb_func_start sub_8074AE0
sub_8074AE0: @ 8074AE0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08074B50
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	ldrh r1, [r4, 0x38]
	lsls r1, 16
	asrs r1, 24
	ldrh r2, [r4, 0x30]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x38]
	lsls r1, 16
	asrs r1, 24
	ldrh r2, [r4, 0x30]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	ldrh r0, [r4, 0x36]
	ldrh r2, [r4, 0x38]
	adds r0, r2
	strh r0, [r4, 0x38]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _08074B3C
	ldr r2, _08074B38 @ =0xffffff00
	b _08074B44
	.align 2, 0
_08074B38: .4byte 0xffffff00
_08074B3C:
	cmp r0, 0
	bge _08074B48
	movs r2, 0x80
	lsls r2, 1
_08074B44:
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
_08074B48:
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _08074B56
_08074B50:
	adds r0, r4, 0
	bl SetCallbackToStoredInData
_08074B56:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8074AE0

	thumb_func_start sub_8074B5C
sub_8074B5C: @ 8074B5C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08074BD8
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	ldrh r0, [r4, 0x38]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _08074BA4
	ldr r2, _08074BA0 @ =0xffffff00
	b _08074BAC
	.align 2, 0
_08074BA0: .4byte 0xffffff00
_08074BA4:
	cmp r0, 0
	bge _08074BB0
	movs r2, 0x80
	lsls r2, 1
_08074BAC:
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
_08074BB0:
	ldrh r1, [r4, 0x36]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	cmp r0, 0xFF
	ble _08074BC4
	ldr r2, _08074BC0 @ =0xffffff00
	b _08074BCC
	.align 2, 0
_08074BC0: .4byte 0xffffff00
_08074BC4:
	cmp r0, 0
	bge _08074BD0
	movs r2, 0x80
	lsls r2, 1
_08074BCC:
	adds r0, r1, r2
	strh r0, [r4, 0x36]
_08074BD0:
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _08074BDE
_08074BD8:
	adds r0, r4, 0
	bl SetCallbackToStoredInData
_08074BDE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8074B5C

	thumb_func_start sub_8074BE4
sub_8074BE4: @ 8074BE4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08074C38
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _08074C24
	ldr r2, _08074C20 @ =0xffffff00
	b _08074C2C
	.align 2, 0
_08074C20: .4byte 0xffffff00
_08074C24:
	cmp r0, 0
	bge _08074C30
	movs r2, 0x80
	lsls r2, 1
_08074C2C:
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
_08074C30:
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _08074C3E
_08074C38:
	adds r0, r4, 0
	bl SetCallbackToStoredInData
_08074C3E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8074BE4

	thumb_func_start sub_8074C44
sub_8074C44: @ 8074C44
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _08074C58
	subs r0, r2, 0x1
	strh r0, [r1, 0x2E]
	b _08074C5E
_08074C58:
	adds r0, r1, 0
	bl SetCallbackToStoredInData
_08074C5E:
	pop {r0}
	bx r0
	thumb_func_end sub_8074C44

	thumb_func_start sub_8074C64
sub_8074C64: @ 8074C64
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8074C80
	ldr r1, _08074C7C @ =sub_8074CD0
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074C7C: .4byte sub_8074CD0
	thumb_func_end sub_8074C64

	thumb_func_start sub_8074C80
sub_8074C80: @ 8074C80
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _08074C96
	ldrh r0, [r4, 0x2E]
	negs r0, r0
	strh r0, [r4, 0x2E]
_08074C96:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	subs r0, r1
	ldrh r5, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl __divsi3
	cmp r0, 0
	bge _08074CB0
	negs r0, r0
_08074CB0:
	strh r0, [r4, 0x2E]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	subs r0, r1
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, 0x32]
	strh r5, [r4, 0x30]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8074C80

	thumb_func_start sub_8074CD0
sub_8074CD0: @ 8074CD0
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _08074CF4
	subs r0, r2, 0x1
	strh r0, [r1, 0x2E]
	ldrh r0, [r1, 0x30]
	ldrh r2, [r1, 0x24]
	adds r0, r2
	strh r0, [r1, 0x24]
	ldrh r0, [r1, 0x32]
	ldrh r3, [r1, 0x26]
	adds r0, r3
	strh r0, [r1, 0x26]
	b _08074CFA
_08074CF4:
	adds r0, r1, 0
	bl SetCallbackToStoredInData
_08074CFA:
	pop {r0}
	bx r0
	thumb_func_end sub_8074CD0

	thumb_func_start sub_8074D00
sub_8074D00: @ 8074D00
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _08074D30
	subs r0, r1, 0x1
	strh r0, [r2, 0x2E]
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x34]
	adds r0, r1
	strh r0, [r2, 0x34]
	ldrh r1, [r2, 0x32]
	ldrh r3, [r2, 0x36]
	adds r1, r3
	strh r1, [r2, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r2, 0x24]
	lsls r1, 16
	asrs r1, 24
	strh r1, [r2, 0x26]
	b _08074D36
_08074D30:
	adds r0, r2, 0
	bl SetCallbackToStoredInData
_08074D36:
	pop {r0}
	bx r0
	thumb_func_end sub_8074D00

	thumb_func_start sub_8074D3C
sub_8074D3C: @ 8074D3C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _08074D6C
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldrh r1, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r1, r2
	strh r1, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	lsls r1, 16
	asrs r1, 24
	strh r1, [r4, 0x26]
	b _08074D72
_08074D6C:
	adds r0, r4, 0
	bl SetCallbackToStoredInData
_08074D72:
	adds r0, r4, 0
	bl UpdateMonIconFrame
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8074D3C

	thumb_func_start sub_8074D80
sub_8074D80: @ 8074D80
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x26]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldr r5, _08074DBC @ =gUnknown_2037F1B
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	ldr r0, _08074DC0 @ =sub_8074C64
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074DBC: .4byte gUnknown_2037F1B
_08074DC0: .4byte sub_8074C64
	thumb_func_end sub_8074D80

	thumb_func_start sub_8074DC4
sub_8074DC4: @ 8074DC4
	push {r4,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _08074E08
	subs r0, r1, 0x1
	strh r0, [r3, 0x2E]
	ldr r2, _08074E04 @ =gSprites
	movs r4, 0x34
	ldrsh r1, [r3, r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x30]
	ldrh r4, [r0, 0x24]
	adds r1, r4
	strh r1, [r0, 0x24]
	movs r0, 0x34
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x32]
	ldrh r2, [r0, 0x26]
	adds r1, r2
	strh r1, [r0, 0x26]
	b _08074E0E
	.align 2, 0
_08074E04: .4byte gSprites
_08074E08:
	adds r0, r3, 0
	bl SetCallbackToStoredInData
_08074E0E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8074DC4

	thumb_func_start sub_8074E14
sub_8074E14: @ 8074E14
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _08074E64
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x30]
	ldrh r0, [r4, 0x34]
	adds r1, r0
	strh r1, [r4, 0x34]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	ldr r3, _08074E60 @ =gSprites
	movs r0, 0x38
	ldrsh r2, [r4, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	lsls r1, 16
	asrs r1, 24
	strh r1, [r0, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r1, 0x26]
	b _08074E6A
	.align 2, 0
_08074E60: .4byte gSprites
_08074E64:
	adds r0, r4, 0
	bl SetCallbackToStoredInData
_08074E6A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8074E14

	thumb_func_start sub_8074E70
sub_8074E70: @ 8074E70
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _08074ED2
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x32]
	lsls r0, r1, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r1, r0
	strh r1, [r4, 0x32]
	ldrh r1, [r4, 0x36]
	lsls r0, r1, 16
	asrs r0, 24
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x34]
	adds r1, r0
	strh r1, [r4, 0x36]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, 0
	bne _08074ED8
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08074ED8
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _08074ED8
_08074ED2:
	adds r0, r4, 0
	bl SetCallbackToStoredInData
_08074ED8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8074E70

	thumb_func_start move_anim_8074EE0
move_anim_8074EE0: @ 8074EE0
	push {r4,lr}
	adds r4, r0, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroyAnimSprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end move_anim_8074EE0

	thumb_func_start sub_8074EF4
sub_8074EF4: @ 8074EF4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x26]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldr r5, _08074F30 @ =gUnknown_2037F1A
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	ldr r0, _08074F34 @ =sub_8074C64
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074F30: .4byte gUnknown_2037F1A
_08074F34: .4byte sub_8074C64
	thumb_func_end sub_8074EF4

	thumb_func_start sub_8074F38
sub_8074F38: @ 8074F38
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x38]
	bl ResetPaletteStructByUid
	adds r0, r4, 0
	bl move_anim_8074EE0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8074F38

	thumb_func_start sub_8074F50
sub_8074F50: @ 8074F50
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08074F66
	adds r0, r2, 0
	bl SetCallbackToStoredInData
_08074F66:
	pop {r0}
	bx r0
	thumb_func_end sub_8074F50

	thumb_func_start sub_8074F6C
sub_8074F6C: @ 8074F6C
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08074F82
	adds r0, r2, 0
	bl SetCallbackToStoredInData
_08074F82:
	pop {r0}
	bx r0
	thumb_func_end sub_8074F6C

	thumb_func_start sub_8074F88
sub_8074F88: @ 8074F88
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r4, 0
	bl DestroyAnimSprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8074F88

	thumb_func_start sub_8074FA8
sub_8074FA8: @ 8074FA8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8074FA8

	thumb_func_start sub_8074FCC
sub_8074FCC: @ 8074FCC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _08074FF4 @ =gUnknown_2037F1A
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074FF4: .4byte gUnknown_2037F1A
	thumb_func_end sub_8074FCC

	thumb_func_start sub_8074FF8
sub_8074FF8: @ 8074FF8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	mov r8, r5
	ldr r7, _08075030 @ =gUnknown_2037F1A
	ldrb r0, [r7]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08075034 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bhi _08075044
	cmp r6, r0
	bcs _08075038
	lsls r0, r5, 16
	b _08075054
	.align 2, 0
_08075030: .4byte gUnknown_2037F1A
_08075034: .4byte gUnknown_2037F1B
_08075038:
	ldrb r0, [r7]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08075050
_08075044:
	ldrh r1, [r4, 0x20]
	lsls r0, r5, 16
	asrs r0, 16
	subs r1, r0
	strh r1, [r4, 0x20]
	b _0807505C
_08075050:
	mov r1, r8
	lsls r0, r1, 16
_08075054:
	asrs r0, 16
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
_0807505C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8074FF8

	thumb_func_start sub_8075068
sub_8075068: @ 8075068
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	movs r5, 0
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r0, 0x80
	lsls r0, 8
	bl __divsi3
	strh r0, [r4, 0x3A]
	strh r5, [r4, 0x3C]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8075068

	thumb_func_start AnimateBallThrow
AnimateBallThrow: @ 8075094
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	bne _080750C0
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x3C]
	adds r0, r1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	movs r0, 0
	b _080750C2
_080750C0:
	movs r0, 0x1
_080750C2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end AnimateBallThrow

	thumb_func_start sub_80750C8
sub_80750C8: @ 80750C8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	bne _080750F4
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x3C]
	adds r0, r1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r0, 0
	b _080750F6
_080750F4:
	movs r0, 0x1
_080750F6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80750C8

	thumb_func_start oamt_add_pos2_onto_pos1
oamt_add_pos2_onto_pos1: @ 80750FC
	ldrh r1, [r0, 0x24]
	ldrh r2, [r0, 0x20]
	adds r1, r2
	movs r2, 0
	strh r1, [r0, 0x20]
	ldrh r1, [r0, 0x26]
	ldrh r3, [r0, 0x22]
	adds r1, r3
	strh r1, [r0, 0x22]
	strh r2, [r0, 0x24]
	strh r2, [r0, 0x26]
	bx lr
	thumb_func_end oamt_add_pos2_onto_pos1

	thumb_func_start sub_8075114
sub_8075114: @ 8075114
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	cmp r1, 0
	bne _0807513C
	ldr r4, _08075158 @ =gUnknown_2037F1B
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074844
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8074844
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
_0807513C:
	ldr r4, _0807515C @ =gUnknown_2037F02
	movs r0, 0
	ldrsh r1, [r4, r0]
	adds r0, r5, 0
	bl sub_8074FF8
	ldrh r0, [r4, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075158: .4byte gUnknown_2037F1B
_0807515C: .4byte gUnknown_2037F02
	thumb_func_end sub_8075114

	thumb_func_start sub_8075160
sub_8075160: @ 8075160
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	cmp r1, 0
	bne _08075184
	ldr r4, _08075180 @ =gUnknown_2037F1A
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074844
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	b _08075198
	.align 2, 0
_08075180: .4byte gUnknown_2037F1A
_08075184:
	ldr r4, _080751BC @ =gUnknown_2037F1A
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074844
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
_08075198:
	bl sub_8074844
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r4, _080751C0 @ =gUnknown_2037F02
	movs r0, 0
	ldrsh r1, [r4, r0]
	adds r0, r5, 0
	bl sub_8074FF8
	ldrh r0, [r4, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080751BC: .4byte gUnknown_2037F1A
_080751C0: .4byte gUnknown_2037F02
	thumb_func_end sub_8075160

	thumb_func_start GetBattlerSide
GetBattlerSide: @ 80751C4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080751D4 @ =gUnknown_2023BD6
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_080751D4: .4byte gUnknown_2023BD6
	thumb_func_end GetBattlerSide

	thumb_func_start GetBattlerPosition
GetBattlerPosition: @ 80751D8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080751E4 @ =gUnknown_2023BD6
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080751E4: .4byte gUnknown_2023BD6
	thumb_func_end GetBattlerPosition

	thumb_func_start GetBattlerAtPosition
GetBattlerAtPosition: @ 80751E8
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r1, 0
	ldr r0, _0807521C @ =gBattlersCount
	ldrb r2, [r0]
	cmp r1, r2
	bcs _08075212
	ldr r4, _08075220 @ =gUnknown_2023BD6
	ldrb r0, [r4]
	cmp r0, r3
	beq _08075212
_08075200:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r2
	bcs _08075212
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _08075200
_08075212:
	adds r0, r1, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807521C: .4byte gBattlersCount
_08075220: .4byte gUnknown_2023BD6
	thumb_func_end GetBattlerAtPosition

	thumb_func_start sub_8075224
sub_8075224: @ 8075224
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	ldr r0, _08075254 @ =gUnknown_2023BD6
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _08075288
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08075260
	ldr r1, _08075258 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0807525C @ =gEnemyParty
	b _0807526E
	.align 2, 0
_08075254: .4byte gUnknown_2023BD6
_08075258: .4byte gBattlerPartyIndexes
_0807525C: .4byte gEnemyParty
_08075260:
	ldr r1, _08075280 @ =gBattlerPartyIndexes
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08075284 @ =gPlayerParty
_0807526E:
	adds r0, r1
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08075288
	movs r0, 0x1
	b _0807528A
	.align 2, 0
_08075280: .4byte gBattlerPartyIndexes
_08075284: .4byte gPlayerParty
_08075288:
	movs r0, 0
_0807528A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8075224

	thumb_func_start sub_8075290
sub_8075290: @ 8075290
	ldr r0, _0807529C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_0807529C: .4byte gBattleTypeFlags
	thumb_func_end sub_8075290

	thumb_func_start sub_80752A0
sub_80752A0: @ 80752A0
	ldr r1, _080752C0 @ =gUnknown_2022BB8
	ldr r1, [r1]
	str r1, [r0]
	ldr r1, _080752C4 @ =gUnknown_2022BBC
	ldr r1, [r1]
	str r1, [r0, 0x4]
	movs r2, 0
	movs r1, 0x8
	strb r1, [r0, 0x8]
	movs r1, 0x1
	strb r1, [r0, 0x9]
	movs r1, 0x80
	lsls r1, 2
	strh r1, [r0, 0xA]
	strh r2, [r0, 0xC]
	bx lr
	.align 2, 0
_080752C0: .4byte gUnknown_2022BB8
_080752C4: .4byte gUnknown_2022BBC
	thumb_func_end sub_80752A0

	thumb_func_start sub_80752C8
sub_80752C8: @ 80752C8
	push {lr}
	adds r2, r0, 0
	cmp r1, 0x1
	bne _080752D6
	bl sub_80752A0
	b _080752F4
_080752D6:
	ldr r0, _080752F8 @ =gUnknown_2022BB8
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, _080752FC @ =gUnknown_2022BBC
	ldr r0, [r0]
	str r0, [r2, 0x4]
	movs r1, 0
	movs r0, 0x9
	strb r0, [r2, 0x8]
	movs r0, 0x2
	strb r0, [r2, 0x9]
	movs r0, 0xC0
	lsls r0, 2
	strh r0, [r2, 0xA]
	strh r1, [r2, 0xC]
_080752F4:
	pop {r0}
	bx r0
	.align 2, 0
_080752F8: .4byte gUnknown_2022BB8
_080752FC: .4byte gUnknown_2022BBC
	thumb_func_end sub_80752C8

	thumb_func_start sub_8075300
sub_8075300: @ 8075300
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08075334 @ =gUnknown_2022BB8
	ldr r0, [r0]
	str r0, [r4]
	ldr r0, _08075338 @ =gUnknown_2022BBC
	ldr r0, [r0]
	str r0, [r4, 0x4]
	ldr r0, _0807533C @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1
	bne _08075340
	movs r0, 0
	movs r1, 0x8
	strb r1, [r4, 0x8]
	strb r2, [r4, 0x9]
	movs r1, 0x80
	lsls r1, 2
	strh r1, [r4, 0xA]
	strh r0, [r4, 0xC]
	b _08075352
	.align 2, 0
_08075334: .4byte gUnknown_2022BB8
_08075338: .4byte gUnknown_2022BBC
_0807533C: .4byte gUnknown_2037F1A
_08075340:
	movs r1, 0
	movs r0, 0x9
	strb r0, [r4, 0x8]
	movs r0, 0x2
	strb r0, [r4, 0x9]
	movs r0, 0xC0
	lsls r0, 2
	strh r0, [r4, 0xA]
	strh r1, [r4, 0xC]
_08075352:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8075300

	thumb_func_start sub_8075358
sub_8075358: @ 8075358
	push {r4,lr}
	sub sp, 0x20
	adds r4, r0, 0
	add r0, sp, 0xC
	adds r1, r4, 0
	bl sub_80752C8
	movs r0, 0
	str r0, [sp, 0x1C]
	add r0, sp, 0x1C
	ldr r1, [sp, 0xC]
	ldr r2, _080753B0 @ =0x05000800
	bl CpuSet
	lsls r4, 24
	lsrs r4, 24
	ldr r1, [sp, 0xC]
	movs r2, 0x80
	lsls r2, 6
	add r0, sp, 0xC
	ldrh r3, [r0, 0xA]
	adds r0, r4, 0
	bl LoadBgTiles
	movs r0, 0x20
	str r0, [sp]
	movs r0, 0x40
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	adds r0, r4, 0
	bl CopyBgTilemapBufferToVram
	add sp, 0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080753B0: .4byte 0x05000800
	thumb_func_end sub_8075358

	thumb_func_start sub_80753B4
sub_80753B4: @ 80753B4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r5, r0, 0
	mov r8, r1
	adds r6, r2, 0
	movs r0, 0
	str r0, [sp]
	ldr r4, _080753FC @ =gUnknown_2022BB8
	ldr r1, [r4]
	ldr r2, _08075400 @ =0x05000800
	mov r0, sp
	bl CpuSet
	ldr r1, [r4]
	mov r0, r8
	bl LZDecompressWram
	lsls r5, 24
	lsrs r5, 24
	ldr r1, [r4]
	movs r2, 0x80
	lsls r2, 6
	lsls r6, 16
	lsrs r6, 16
	adds r0, r5, 0
	adds r3, r6, 0
	bl LoadBgTiles
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080753FC: .4byte gUnknown_2022BB8
_08075400: .4byte 0x05000800
	thumb_func_end sub_80753B4

	thumb_func_start sub_8075404
sub_8075404: @ 8075404
	push {r4,r5,lr}
	sub sp, 0xC
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x20
	str r0, [sp]
	movs r0, 0x40
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8075404

	thumb_func_start sub_807543C
sub_807543C: @ 807543C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8075404
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl CopyBgTilemapBufferToVram
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807543C

	thumb_func_start sub_8075454
sub_8075454: @ 8075454
	movs r0, 0x2
	bx lr
	thumb_func_end sub_8075454

	thumb_func_start sub_8075458
sub_8075458: @ 8075458
	push {lr}
	lsls r0, 24
	cmp r0, 0
	bne _08075476
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl SetAnimBgAttribute
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0x1
	bl SetAnimBgAttribute
	b _0807548A
_08075476:
	movs r0, 0x3
	movs r1, 0
	movs r2, 0x1
	bl SetAnimBgAttribute
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0
	bl SetAnimBgAttribute
_0807548A:
	pop {r0}
	bx r0
	thumb_func_end sub_8075458

	thumb_func_start sub_8075490
sub_8075490: @ 8075490
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl sub_80754B8
	ldr r1, _080754B4 @ =sub_8074D3C
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080754B4: .4byte sub_8074D3C
	thumb_func_end sub_8075490

	thumb_func_start sub_80754B8
sub_80754B8: @ 80754B8
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x32]
	ldrh r1, [r5, 0x30]
	subs r0, r1
	ldrh r4, [r5, 0x36]
	ldrh r1, [r5, 0x34]
	subs r4, r1
	lsls r4, 24
	lsrs r4, 16
	lsls r0, 24
	asrs r0, 16
	movs r2, 0x2E
	ldrsh r1, [r5, r2]
	bl __divsi3
	movs r6, 0
	strh r0, [r5, 0x30]
	lsls r4, 16
	asrs r4, 16
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl __divsi3
	strh r0, [r5, 0x32]
	strh r6, [r5, 0x36]
	strh r6, [r5, 0x34]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80754B8

	thumb_func_start obj_translate_based_on_private_1_2_3_4
obj_translate_based_on_private_1_2_3_4: @ 80754F8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	movs r0, 0x32
	ldrsh r1, [r7, r0]
	movs r2, 0x30
	ldrsh r0, [r7, r2]
	subs r1, r0
	movs r3, 0x36
	ldrsh r2, [r7, r3]
	movs r3, 0x34
	ldrsh r0, [r7, r3]
	subs r2, r0
	lsrs r0, r1, 31
	mov r8, r0
	lsrs r3, r2, 31
	mov r9, r3
	cmp r1, 0
	bge _08075524
	negs r1, r1
_08075524:
	lsls r0, r1, 24
	lsrs r6, r0, 16
	adds r0, r2, 0
	cmp r0, 0
	bge _08075530
	negs r0, r0
_08075530:
	lsls r0, 24
	lsrs r5, r0, 16
	movs r0, 0x2E
	ldrsh r4, [r7, r0]
	adds r0, r6, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r5, r0, 16
	mov r2, r8
	cmp r2, 0
	beq _0807555C
	movs r0, 0x1
	orrs r6, r0
	b _08075560
_0807555C:
	ldr r0, _0807556C @ =0x0000fffe
	ands r6, r0
_08075560:
	mov r3, r9
	cmp r3, 0
	beq _08075570
	movs r0, 0x1
	orrs r5, r0
	b _08075574
	.align 2, 0
_0807556C: .4byte 0x0000fffe
_08075570:
	ldr r0, _0807558C @ =0x0000fffe
	ands r5, r0
_08075574:
	movs r0, 0
	strh r6, [r7, 0x30]
	strh r5, [r7, 0x32]
	strh r0, [r7, 0x36]
	strh r0, [r7, 0x34]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807558C: .4byte 0x0000fffe
	thumb_func_end obj_translate_based_on_private_1_2_3_4

	thumb_func_start sub_8075590
sub_8075590: @ 8075590
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r1, _080755B4 @ =sub_807563C
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080755B4: .4byte sub_807563C
	thumb_func_end sub_8075590

	thumb_func_start sub_80755B8
sub_80755B8: @ 80755B8
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r1, _080755DC @ =sub_8075658
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080755DC: .4byte sub_8075658
	thumb_func_end sub_80755B8

	thumb_func_start sub_80755E0
sub_80755E0: @ 80755E0
	push {r4-r6,lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080755F0
	movs r0, 0x1
	b _08075634
_080755F0:
	ldrh r1, [r2, 0x30]
	ldrh r4, [r2, 0x32]
	ldrh r6, [r2, 0x34]
	ldrh r5, [r2, 0x36]
	adds r0, r6, r1
	lsls r3, r0, 16
	lsrs r6, r3, 16
	adds r0, r5, r4
	lsls r0, 16
	lsrs r5, r0, 16
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08075612
	lsrs r0, r3, 24
	negs r0, r0
	b _08075614
_08075612:
	lsrs r0, r3, 24
_08075614:
	strh r0, [r2, 0x24]
	movs r0, 0x1
	ands r4, r0
	cmp r4, 0
	beq _08075624
	lsrs r0, r5, 8
	negs r0, r0
	b _08075626
_08075624:
	lsrs r0, r5, 8
_08075626:
	strh r0, [r2, 0x26]
	strh r6, [r2, 0x34]
	strh r5, [r2, 0x36]
	ldrh r0, [r2, 0x2E]
	subs r0, 0x1
	strh r0, [r2, 0x2E]
	movs r0, 0
_08075634:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80755E0

	thumb_func_start sub_807563C
sub_807563C: @ 807563C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	beq _08075650
	adds r0, r4, 0
	bl SetCallbackToStoredInData
_08075650:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807563C

	thumb_func_start sub_8075658
sub_8075658: @ 8075658
	push {r4,lr}
	adds r4, r0, 0
	bl sub_801236C
	adds r0, r4, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	beq _08075672
	adds r0, r4, 0
	bl SetCallbackToStoredInData
_08075672:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8075658

	thumb_func_start sub_8075678
sub_8075678: @ 8075678
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	subs r0, r1, r0
	cmp r0, 0
	bge _0807568C
	negs r0, r0
_0807568C:
	lsls r0, 8
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8075678

	thumb_func_start sub_80756A4
sub_80756A4: @ 80756A4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl sub_8075678
	ldr r1, _080756C8 @ =sub_807563C
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080756C8: .4byte sub_807563C
	thumb_func_end sub_80756A4

	thumb_func_start sub_80756CC
sub_80756CC: @ 80756CC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	movs r0, 0x32
	ldrsh r1, [r7, r0]
	movs r2, 0x30
	ldrsh r0, [r7, r2]
	subs r1, r0
	movs r3, 0x36
	ldrsh r2, [r7, r3]
	movs r3, 0x34
	ldrsh r0, [r7, r3]
	subs r2, r0
	lsrs r0, r1, 31
	mov r8, r0
	lsrs r3, r2, 31
	mov r9, r3
	cmp r1, 0
	bge _080756F8
	negs r1, r1
_080756F8:
	lsls r0, r1, 20
	lsrs r6, r0, 16
	adds r0, r2, 0
	cmp r0, 0
	bge _08075704
	negs r0, r0
_08075704:
	lsls r0, 20
	lsrs r5, r0, 16
	movs r0, 0x2E
	ldrsh r4, [r7, r0]
	adds r0, r6, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r5, r0, 16
	mov r2, r8
	cmp r2, 0
	beq _08075730
	movs r0, 0x1
	orrs r6, r0
	b _08075734
_08075730:
	ldr r0, _08075740 @ =0x0000fffe
	ands r6, r0
_08075734:
	mov r3, r9
	cmp r3, 0
	beq _08075744
	movs r0, 0x1
	orrs r5, r0
	b _08075748
	.align 2, 0
_08075740: .4byte 0x0000fffe
_08075744:
	ldr r0, _08075760 @ =0x0000fffe
	ands r5, r0
_08075748:
	movs r0, 0
	strh r6, [r7, 0x30]
	strh r5, [r7, 0x32]
	strh r0, [r7, 0x36]
	strh r0, [r7, 0x34]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075760: .4byte 0x0000fffe
	thumb_func_end sub_80756CC

	thumb_func_start sub_8075764
sub_8075764: @ 8075764
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl sub_80756CC
	ldr r1, _08075788 @ =sub_80757E8
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075788: .4byte sub_80757E8
	thumb_func_end sub_8075764

	thumb_func_start sub_807578C
sub_807578C: @ 807578C
	push {r4-r6,lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _0807579C
	movs r0, 0x1
	b _080757E0
_0807579C:
	ldrh r1, [r2, 0x30]
	ldrh r4, [r2, 0x32]
	ldrh r6, [r2, 0x34]
	ldrh r5, [r2, 0x36]
	adds r0, r6, r1
	lsls r3, r0, 16
	lsrs r6, r3, 16
	adds r0, r5, r4
	lsls r0, 16
	lsrs r5, r0, 16
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080757BE
	lsrs r0, r3, 20
	negs r0, r0
	b _080757C0
_080757BE:
	lsrs r0, r3, 20
_080757C0:
	strh r0, [r2, 0x24]
	movs r0, 0x1
	ands r4, r0
	cmp r4, 0
	beq _080757D0
	lsrs r0, r5, 4
	negs r0, r0
	b _080757D2
_080757D0:
	lsrs r0, r5, 4
_080757D2:
	strh r0, [r2, 0x26]
	strh r6, [r2, 0x34]
	strh r5, [r2, 0x36]
	ldrh r0, [r2, 0x2E]
	subs r0, 0x1
	strh r0, [r2, 0x2E]
	movs r0, 0
_080757E0:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_807578C

	thumb_func_start sub_80757E8
sub_80757E8: @ 80757E8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_807578C
	lsls r0, 24
	cmp r0, 0
	beq _080757FC
	adds r0, r4, 0
	bl SetCallbackToStoredInData
_080757FC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80757E8

	thumb_func_start sub_8075804
sub_8075804: @ 8075804
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	subs r0, r1, r0
	cmp r0, 0
	bge _08075818
	negs r0, r0
_08075818:
	lsls r0, 4
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_80756CC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8075804

	thumb_func_start sub_8075830
sub_8075830: @ 8075830
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl sub_8075804
	ldr r1, _08075854 @ =sub_80757E8
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075854: .4byte sub_80757E8
	thumb_func_end sub_8075830

	thumb_func_start obj_id_set_rotscale
obj_id_set_rotscale: @ 8075858
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsls r3, 16
	lsrs r3, 16
	ldr r5, _080758D0 @ =0xffff0000
	lsls r2, 16
	lsrs r1, 16
	orrs r1, r2
	str r1, [sp]
	ldr r0, [sp, 0x4]
	ands r0, r5
	orrs r0, r3
	str r0, [sp, 0x4]
	bl sub_80758DC
	lsls r0, 24
	cmp r0, 0
	beq _08075894
	mov r0, sp
	ldrh r0, [r0]
	negs r0, r0
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [sp]
	ands r1, r5
	orrs r1, r0
	str r1, [sp]
_08075894:
	ldr r1, _080758D4 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x3]
	lsls r4, 26
	lsrs r4, 27
	add r5, sp, 0x8
	mov r0, sp
	adds r1, r5, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ObjAffineSet
	ldr r0, _080758D8 @ =gOamMatrices
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r5]
	strh r0, [r4]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x2]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x4]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x6]
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080758D0: .4byte 0xffff0000
_080758D4: .4byte gSprites
_080758D8: .4byte gOamMatrices
	thumb_func_end obj_id_set_rotscale

	thumb_func_start sub_80758DC
sub_80758DC: @ 80758DC
	movs r0, 0
	bx lr
	thumb_func_end sub_80758DC

	thumb_func_start sub_80758E0
sub_80758E0: @ 80758E0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r2, _08075978 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r4, r1, r2
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _08075914
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_08075914:
	movs r7, 0x3
	ands r5, r7
	lsls r2, r5, 2
	ldrb r1, [r4, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x1]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	cmp r0, 0
	bne _0807595C
	ldr r0, _0807597C @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x6]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x3]
_0807595C:
	ldrb r3, [r4, 0x1]
	orrs r3, r7
	strb r3, [r4, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r4, 0
	bl CalcCenterToCornerVec
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075978: .4byte gSprites
_0807597C: .4byte gUnknown_2024018
	thumb_func_end sub_80758E0

	thumb_func_start sub_8075980
sub_8075980: @ 8075980
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r2, 0x80
	lsls r2, 1
	adds r0, r4, 0
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldr r1, _080759D8 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r2
	movs r2, 0x1
	orrs r1, r2
	movs r2, 0xD
	negs r2, r2
	ands r1, r2
	strb r1, [r0, 0x1]
	adds r3, r0, 0
	adds r3, 0x2C
	ldrb r2, [r3]
	movs r1, 0x7F
	ands r1, r2
	strb r1, [r3]
	ldrb r3, [r0, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r0, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	bl CalcCenterToCornerVec
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080759D8: .4byte gSprites
	thumb_func_end sub_8075980

	thumb_func_start sub_80759DC
sub_80759DC: @ 80759DC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08075A14 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r2, r1, r2
	ldrb r0, [r2, 0x3]
	lsls r0, 26
	lsrs r0, 27
	ldr r1, _08075A18 @ =gOamMatrices
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x4]
	movs r3, 0x4
	ldrsh r0, [r0, r3]
	cmp r0, 0
	bge _08075A08
	negs r0, r0
	lsls r0, 16
	lsrs r1, r0, 16
_08075A08:
	lsls r0, r1, 16
	asrs r0, 19
	strh r0, [r2, 0x26]
	pop {r0}
	bx r0
	.align 2, 0
_08075A14: .4byte gSprites
_08075A18: .4byte gOamMatrices
	thumb_func_end sub_80759DC

	thumb_func_start sub_8075A1C
sub_8075A1C: @ 8075A1C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r4, r0, 0
	ldr r0, [sp, 0x28]
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 16
	lsrs r5, r2, 16
	lsls r3, 16
	lsrs r7, r3, 16
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08075AC2
	adds r0, r4, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	cmp r6, 0
	beq _08075A6A
	ldrb r3, [r4, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r4, 0
	bl CalcCenterToCornerVec
_08075A6A:
	ldr r6, _08075AD0 @ =0xffff0000
	lsls r0, r7, 16
	orrs r5, r0
	str r5, [sp]
	ldr r0, [sp, 0x4]
	ands r0, r6
	mov r1, r8
	orrs r0, r1
	str r0, [sp, 0x4]
	bl sub_80758DC
	lsls r0, 24
	cmp r0, 0
	beq _08075A98
	mov r0, sp
	ldrh r0, [r0]
	negs r0, r0
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [sp]
	ands r1, r6
	orrs r1, r0
	str r1, [sp]
_08075A98:
	ldrb r4, [r4, 0x3]
	lsls r4, 26
	lsrs r4, 27
	add r5, sp, 0x8
	mov r0, sp
	adds r1, r5, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ObjAffineSet
	ldr r0, _08075AD4 @ =gOamMatrices
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r5]
	strh r0, [r4]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x2]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x4]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x6]
_08075AC2:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075AD0: .4byte 0xffff0000
_08075AD4: .4byte gOamMatrices
	thumb_func_end sub_8075A1C

	thumb_func_start sub_8075AD8
sub_8075AD8: @ 8075AD8
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r3, 0x80
	lsls r3, 1
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x1
	adds r2, r3, 0
	bl sub_8075A1C
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrb r3, [r4, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r4, 0
	bl CalcCenterToCornerVec
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8075AD8

	thumb_func_start ArcTan2_
ArcTan2_: @ 8075B18
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl ArcTan2
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end ArcTan2_

	thumb_func_start sub_8075B30
sub_8075B30: @ 8075B30
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl ArcTan2_
	lsls r0, 16
	negs r0, r0
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_8075B30

	thumb_func_start sub_8075B48
sub_8075B48: @ 8075B48
	push {r4-r7,lr}
	lsls r1, 24
	lsls r0, 20
	lsrs r0, 16
	cmp r1, 0
	bne _08075BC4
	ldr r2, _08075BB8 @ =gPlttBufferUnfaded
	ldr r1, _08075BBC @ =gPlttBufferFaded
	lsls r0, 1
	adds r4, r0, r1
	adds r5, r0, r2
	movs r6, 0xF
_08075B60:
	ldr r0, [r5]
	lsls r2, r0, 27
	lsrs r2, 27
	lsls r1, r0, 22
	lsrs r1, 27
	adds r2, r1
	lsls r0, 17
	lsrs r0, 27
	adds r0, r2
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1F
	ands r0, r1
	ldrb r1, [r4]
	movs r3, 0x20
	negs r3, r3
	adds r2, r3, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4]
	lsls r3, r0, 5
	ldrh r1, [r4]
	ldr r7, _08075BC0 @ =0xfffffc1f
	adds r2, r7, 0
	ands r1, r2
	orrs r1, r3
	strh r1, [r4]
	lsls r0, 2
	ldrb r1, [r4, 0x1]
	movs r3, 0x7D
	negs r3, r3
	adds r2, r3, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x1]
	adds r4, 0x2
	adds r5, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _08075B60
	b _08075BD4
	.align 2, 0
_08075BB8: .4byte gPlttBufferUnfaded
_08075BBC: .4byte gPlttBufferFaded
_08075BC0: .4byte 0xfffffc1f
_08075BC4:
	lsls r1, r0, 1
	ldr r0, _08075BDC @ =gPlttBufferUnfaded
	adds r0, r1, r0
	ldr r2, _08075BE0 @ =gPlttBufferFaded
	adds r1, r2
	ldr r2, _08075BE4 @ =0x04000008
	bl CpuSet
_08075BD4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075BDC: .4byte gPlttBufferUnfaded
_08075BE0: .4byte gPlttBufferFaded
_08075BE4: .4byte 0x04000008
	thumb_func_end sub_8075B48

	thumb_func_start sub_8075BE8
sub_8075BE8: @ 8075BE8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r4, [sp, 0x1C]
	ldr r5, [sp, 0x20]
	ldr r6, [sp, 0x24]
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r7, r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r8, r5
	lsls r6, 24
	lsrs r6, 24
	mov r9, r6
	movs r4, 0
	cmp r0, 0
	beq _08075C1C
	movs r4, 0xE
_08075C1C:
	cmp r1, 0
	beq _08075C2E
	ldr r0, _08075CB0 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_08075C2E:
	cmp r2, 0
	beq _08075C40
	ldr r0, _08075CB4 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_08075C40:
	cmp r3, 0
	beq _08075C64
	ldr r6, _08075CB0 @ =gUnknown_2037F1A
	ldrb r0, [r6]
	movs r5, 0x2
	eors r0, r5
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _08075C64
	ldrb r0, [r6]
	eors r0, r5
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_08075C64:
	cmp r7, 0
	beq _08075C88
	ldr r6, _08075CB4 @ =gUnknown_2037F1B
	ldrb r0, [r6]
	movs r5, 0x2
	eors r0, r5
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _08075C88
	ldrb r0, [r6]
	eors r0, r5
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_08075C88:
	mov r0, r8
	cmp r0, 0
	beq _08075C94
	movs r0, 0x80
	lsls r0, 1
	orrs r4, r0
_08075C94:
	mov r0, r9
	cmp r0, 0
	beq _08075CA0
	movs r0, 0x80
	lsls r0, 2
	orrs r4, r0
_08075CA0:
	adds r0, r4, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08075CB0: .4byte gUnknown_2037F1A
_08075CB4: .4byte gUnknown_2037F1B
	thumb_func_end sub_8075BE8

	thumb_func_start sub_8075CB8
sub_8075CB8: @ 8075CB8
	push {r4-r7,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r7, r3, 24
	movs r4, 0
	cmp r0, 0
	beq _08075CF2
	movs r0, 0
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _08075CF2
	movs r0, 0
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r4, 0x1
	lsls r4, r0
_08075CF2:
	cmp r5, 0
	beq _08075D1E
	movs r0, 0x2
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _08075D1E
	movs r0, 0x2
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_08075D1E:
	cmp r6, 0
	beq _08075D4A
	movs r0, 0x1
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _08075D4A
	movs r0, 0x1
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_08075D4A:
	cmp r7, 0
	beq _08075D76
	movs r0, 0x3
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _08075D76
	movs r0, 0x3
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_08075D76:
	adds r0, r4, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8075CB8

	thumb_func_start sub_8075D80
sub_8075D80: @ 8075D80
	lsls r0, 24
	lsrs r0, 24
	bx lr
	thumb_func_end sub_8075D80

	thumb_func_start sub_8075D88
sub_8075D88: @ 8075D88
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8075D88

	thumb_func_start sub_8075D9C
sub_8075D9C: @ 8075D9C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08075DDA
	ldr r2, _08075DC8 @ =gUnknown_2037F02
	movs r3, 0x6
	ldrsh r0, [r2, r3]
	movs r1, 0
	cmp r0, 0
	bne _08075DB6
	movs r1, 0x1
_08075DB6:
	movs r3, 0x4
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _08075DCC
	adds r0, r4, 0
	bl sub_8075160
	b _08075DD2
	.align 2, 0
_08075DC8: .4byte gUnknown_2037F02
_08075DCC:
	adds r0, r4, 0
	bl sub_8075114
_08075DD2:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _08075DEE
_08075DDA:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0
	beq _08075DEE
	adds r0, r4, 0
	bl move_anim_8074EE0
_08075DEE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8075D9C

	thumb_func_start sub_8075DF4
sub_8075DF4: @ 8075DF4
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r6, _08075E6C @ =gUnknown_2037F02
	movs r1, 0xA
	ldrsh r0, [r6, r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0
	cmp r0, 0
	bne _08075E0C
	movs r1, 0x1
_08075E0C:
	ldrb r0, [r6, 0xA]
	movs r7, 0x1
	cmp r0, 0
	bne _08075E16
	movs r7, 0x3
_08075E16:
	adds r0, r5, 0
	bl sub_8075160
	ldr r0, _08075E70 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08075E30
	ldrh r0, [r6, 0x4]
	negs r0, r0
	strh r0, [r6, 0x4]
_08075E30:
	ldrh r0, [r6, 0x8]
	strh r0, [r5, 0x2E]
	ldr r4, _08075E74 @ =gUnknown_2037F1B
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x4]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	adds r1, r7, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x6]
	adds r0, r6
	strh r0, [r5, 0x36]
	ldr r0, _08075E78 @ =sub_8075590
	str r0, [r5, 0x1C]
	ldr r1, _08075E7C @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075E6C: .4byte gUnknown_2037F02
_08075E70: .4byte gUnknown_2037F1A
_08075E74: .4byte gUnknown_2037F1B
_08075E78: .4byte sub_8075590
_08075E7C: .4byte DestroyAnimSprite
	thumb_func_end sub_8075DF4

	thumb_func_start sub_8075E80
sub_8075E80: @ 8075E80
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _08075EE0 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08075EA0
	ldr r1, _08075EE4 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_08075EA0:
	ldr r4, _08075EE4 @ =gUnknown_2037F02
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldr r5, _08075EE8 @ =gUnknown_2037F1B
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x6]
	adds r0, r1
	strh r0, [r6, 0x36]
	ldrh r0, [r4, 0xA]
	strh r0, [r6, 0x38]
	adds r0, r6, 0
	bl sub_8075068
	ldr r0, _08075EEC @ =sub_8075EF0
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08075EE0: .4byte gUnknown_2037F1A
_08075EE4: .4byte gUnknown_2037F02
_08075EE8: .4byte gUnknown_2037F1B
_08075EEC: .4byte sub_8075EF0
	thumb_func_end sub_8075E80

	thumb_func_start sub_8075EF0
sub_8075EF0: @ 8075EF0
	push {r4,lr}
	adds r4, r0, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _08075F04
	adds r0, r4, 0
	bl DestroyAnimSprite
_08075F04:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8075EF0

	thumb_func_start sub_8075F0C
sub_8075F0C: @ 8075F0C
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r0, _08075F20 @ =gUnknown_2037F02
	movs r2, 0xC
	ldrsh r1, [r0, r2]
	cmp r1, 0
	bne _08075F24
	movs r4, 0x1
	movs r7, 0x3
	b _08075F28
	.align 2, 0
_08075F20: .4byte gUnknown_2037F02
_08075F24:
	movs r4, 0
	movs r7, 0x1
_08075F28:
	movs r1, 0xA
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08075F40
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8075160
	ldr r0, _08075F3C @ =gUnknown_2037F1A
	b _08075F4A
	.align 2, 0
_08075F3C: .4byte gUnknown_2037F1A
_08075F40:
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8075114
	ldr r0, _08075FA8 @ =gUnknown_2037F1B
_08075F4A:
	ldrb r6, [r0]
	ldr r0, _08075FAC @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08075F62
	ldr r1, _08075FB0 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_08075F62:
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8075114
	ldr r4, _08075FB0 @ =gUnknown_2037F02
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x2E]
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r4, 0x4]
	adds r0, r2
	strh r0, [r5, 0x32]
	adds r0, r6, 0
	adds r1, r7, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x6]
	adds r0, r4
	strh r0, [r5, 0x36]
	ldr r0, _08075FB4 @ =sub_8075590
	str r0, [r5, 0x1C]
	ldr r1, _08075FB8 @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075FA8: .4byte gUnknown_2037F1B
_08075FAC: .4byte gUnknown_2037F1A
_08075FB0: .4byte gUnknown_2037F02
_08075FB4: .4byte sub_8075590
_08075FB8: .4byte DestroyAnimSprite
	thumb_func_end sub_8075F0C

	thumb_func_start duplicate_obj_of_side_rel2move_in_transparent_mode
duplicate_obj_of_side_rel2move_in_transparent_mode: @ 8075FBC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _08076026
	movs r6, 0
	ldr r2, _08076018 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r1, r0, 2
_08075FD8:
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r4, r0, r2
	adds r5, r4, 0
	adds r5, 0x3E
	ldrb r0, [r5]
	lsls r0, 31
	cmp r0, 0
	bne _0807601C
	adds r0, r4, 0
	adds r1, r2
	movs r2, 0x44
	bl memcpy
	ldrb r1, [r4, 0x1]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4, 0x1]
	ldrb r0, [r5]
	adds r2, 0x8
	adds r1, r2, 0
	ands r0, r1
	strb r0, [r5]
	lsls r0, r6, 16
	asrs r0, 16
	b _0807602A
	.align 2, 0
_08076018: .4byte gSprites
_0807601C:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x3F
	bls _08075FD8
_08076026:
	movs r0, 0x1
	negs r0, r0
_0807602A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end duplicate_obj_of_side_rel2move_in_transparent_mode

	thumb_func_start obj_delete_but_dont_free_vram
obj_delete_but_dont_free_vram: @ 8076030
	push {lr}
	adds r3, r0, 0
	adds r3, 0x3F
	ldrb r1, [r3]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r3]
	bl DestroySprite
	pop {r0}
	bx r0
	thumb_func_end obj_delete_but_dont_free_vram

	thumb_func_start sub_8076048
sub_8076048: @ 8076048
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	movs r3, 0
	ldr r2, _080760C0 @ =gUnknown_2037F02
	movs r0, 0x4
	ldrsh r1, [r2, r0]
	movs r4, 0
	ldrsh r0, [r2, r4]
	cmp r1, r0
	ble _08076062
	movs r3, 0x1
_08076062:
	cmp r1, r0
	bge _08076068
	ldr r3, _080760C4 @ =0x0000ffff
_08076068:
	movs r0, 0x6
	ldrsh r1, [r2, r0]
	movs r4, 0x2
	ldrsh r0, [r2, r4]
	cmp r1, r0
	ble _08076076
	movs r6, 0x1
_08076076:
	cmp r1, r0
	bge _0807607C
	ldr r6, _080760C4 @ =0x0000ffff
_0807607C:
	ldr r0, _080760C8 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	movs r1, 0
	strh r1, [r4, 0x8]
	ldrh r0, [r2, 0x8]
	strh r0, [r4, 0xA]
	strh r1, [r4, 0xC]
	ldrh r0, [r2]
	strh r0, [r4, 0xE]
	ldrh r0, [r2, 0x2]
	strh r0, [r4, 0x10]
	strh r3, [r4, 0x12]
	strh r6, [r4, 0x14]
	ldrh r0, [r2, 0x4]
	strh r0, [r4, 0x16]
	ldrh r0, [r2, 0x6]
	strh r0, [r4, 0x18]
	ldrh r1, [r2, 0x2]
	lsls r1, 8
	ldrh r0, [r2]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	ldr r0, _080760CC @ =sub_80760D0
	str r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080760C0: .4byte gUnknown_2037F02
_080760C4: .4byte 0x0000ffff
_080760C8: .4byte gTasks
_080760CC: .4byte sub_80760D0
	thumb_func_end sub_8076048

	thumb_func_start sub_80760D0
sub_80760D0: @ 80760D0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807611C @ =gTasks
	adds r4, r0, r1
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08076164
	movs r0, 0
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08076120
	ldrh r2, [r4, 0xE]
	movs r3, 0xE
	ldrsh r1, [r4, r3]
	movs r3, 0x16
	ldrsh r0, [r4, r3]
	cmp r1, r0
	beq _08076134
	ldrh r0, [r4, 0x12]
	adds r0, r2, r0
	strh r0, [r4, 0xE]
	b _08076134
	.align 2, 0
_0807611C: .4byte gTasks
_08076120:
	ldrh r2, [r4, 0x10]
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	movs r3, 0x18
	ldrsh r0, [r4, r3]
	cmp r1, r0
	beq _08076134
	ldrh r0, [r4, 0x14]
	adds r0, r2, r0
	strh r0, [r4, 0x10]
_08076134:
	ldrh r1, [r4, 0x10]
	lsls r1, 8
	ldrh r0, [r4, 0xE]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08076164
	movs r3, 0x10
	ldrsh r1, [r4, r3]
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08076164
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_08076164:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80760D0

	thumb_func_start sub_807616C
sub_807616C: @ 807616C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0807618C @ =gUnknown_2037F02
	ldrb r0, [r0]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xFF
	bne _08076190
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _080761B6
	.align 2, 0
_0807618C: .4byte gUnknown_2037F02
_08076190:
	ldr r1, _080761BC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r2, _080761C0 @ =gSprites
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	lsls r1, 4
	ldr r3, _080761C4 @ =0x00000101
	adds r2, r3, 0
	adds r1, r2
	strh r1, [r0, 0x8]
	bl sub_80761C8
_080761B6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080761BC: .4byte gTasks
_080761C0: .4byte gSprites
_080761C4: .4byte 0x00000101
	thumb_func_end sub_807616C

	thumb_func_start sub_80761C8
sub_80761C8: @ 80761C8
	ldr r3, _080761E8 @ =gUnknown_2037F02
	ldrh r1, [r3, 0x2]
	movs r2, 0
	strh r1, [r0, 0xA]
	strh r2, [r0, 0xC]
	ldrh r1, [r3, 0x4]
	strh r1, [r0, 0xE]
	strh r2, [r0, 0x10]
	ldrh r1, [r3, 0x6]
	strh r1, [r0, 0x12]
	strh r2, [r0, 0x14]
	ldrh r1, [r3, 0x8]
	strh r1, [r0, 0x16]
	ldr r1, _080761EC @ =sub_80761F0
	str r1, [r0]
	bx lr
	.align 2, 0
_080761E8: .4byte gUnknown_2037F02
_080761EC: .4byte sub_80761F0
	thumb_func_end sub_80761C8

	thumb_func_start sub_80761F0
sub_80761F0: @ 80761F0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08076248 @ =gTasks
	adds r4, r0, r1
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _08076280
	movs r0, 0
	strh r0, [r4, 0x10]
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0807624C
	ldrh r2, [r4, 0xC]
	adds r2, 0x1
	strh r2, [r4, 0xC]
	ldrh r0, [r4, 0x8]
	lsls r2, 24
	lsrs r2, 24
	ldrh r3, [r4, 0xA]
	movs r1, 0xF
	bl BlendPalette
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08076280
	movs r0, 0x1
	strh r0, [r4, 0x14]
	b _08076280
	.align 2, 0
_08076248: .4byte gTasks
_0807624C:
	ldrh r2, [r4, 0xC]
	subs r2, 0x1
	strh r2, [r4, 0xC]
	ldrh r0, [r4, 0x8]
	lsls r2, 24
	lsrs r2, 24
	ldrh r3, [r4, 0xA]
	movs r1, 0xF
	bl BlendPalette
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	cmp r1, 0
	bne _08076280
	ldrh r0, [r4, 0x16]
	subs r0, 0x1
	strh r0, [r4, 0x16]
	lsls r0, 16
	cmp r0, 0
	beq _0807627A
	strh r1, [r4, 0x10]
	strh r1, [r4, 0x14]
	b _08076280
_0807627A:
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_08076280:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80761F0

	thumb_func_start sub_8076288
sub_8076288: @ 8076288
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080762A8 @ =gUnknown_2037F02
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	bne _080762AC
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _080762C2
	.align 2, 0
_080762A8: .4byte gUnknown_2037F02
_080762AC:
	ldr r1, _080762C8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	lsls r1, r2, 4
	ldr r2, _080762CC @ =0x00000101
	adds r1, r2
	strh r1, [r0, 0x8]
	bl sub_80761C8
_080762C2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080762C8: .4byte gTasks
_080762CC: .4byte 0x00000101
	thumb_func_end sub_8076288

	thumb_func_start sub_80762D0
sub_80762D0: @ 80762D0
	push {r4,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0
	strh r1, [r3, 0x16]
	strh r1, [r3, 0x18]
	strh r1, [r3, 0x1A]
	strh r4, [r3, 0x26]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r3, 0x1C]
	strh r0, [r3, 0x1E]
	strh r1, [r3, 0x20]
	adds r0, r3, 0
	adds r0, 0x22
	adds r3, 0x24
	adds r1, r3, 0
	bl sub_80765C0
	adds r0, r4, 0
	movs r1, 0
	bl sub_80758E0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80762D0

	thumb_func_start sub_8076308
sub_8076308: @ 8076308
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r5, _080763A8 @ =gUnknown_2037F28
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	bl sub_80765C8
	movs r3, 0x16
	ldrsh r1, [r4, r3]
	lsls r1, 3
	adds r1, r0, r1
	str r1, [r5]
	movs r6, 0
	ldrsh r2, [r1, r6]
	ldr r0, _080763AC @ =0x00007ffe
	cmp r2, r0
	beq _080763B0
	cmp r2, r0
	bgt _08076410
	subs r0, 0x1
	cmp r2, r0
	beq _080763B6
	ldrb r0, [r1, 0x5]
	cmp r0, 0
	bne _08076356
	ldrh r0, [r1]
	strh r0, [r4, 0x1C]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x1E]
	ldrb r0, [r1, 0x4]
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
	adds r0, r1, 0
	adds r0, 0x8
	str r0, [r5]
_08076356:
	ldr r1, [r5]
	ldrh r0, [r1]
	ldrh r2, [r4, 0x1C]
	adds r0, r2
	strh r0, [r4, 0x1C]
	ldrh r0, [r1, 0x2]
	ldrh r3, [r4, 0x1E]
	adds r0, r3
	strh r0, [r4, 0x1E]
	ldrh r0, [r4, 0x20]
	ldrb r1, [r1, 0x4]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0x1C
	ldrsh r1, [r4, r6]
	movs r3, 0x1E
	ldrsh r2, [r4, r3]
	ldrh r3, [r4, 0x20]
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8076440
	ldrh r0, [r4, 0x18]
	adds r0, 0x1
	strh r0, [r4, 0x18]
	lsls r0, 16
	asrs r0, 16
	ldr r1, [r5]
	ldrb r1, [r1, 0x5]
	cmp r0, r1
	blt _08076436
	movs r0, 0
	strh r0, [r4, 0x18]
	b _08076408
	.align 2, 0
_080763A8: .4byte gUnknown_2037F28
_080763AC: .4byte 0x00007ffe
_080763B0:
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x16]
	b _08076436
_080763B6:
	ldrh r2, [r1, 0x2]
	movs r6, 0x2
	ldrsh r0, [r1, r6]
	cmp r0, 0
	beq _08076408
	ldrh r1, [r4, 0x1A]
	movs r3, 0x1A
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080763D6
	subs r0, r1, 0x1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	cmp r0, 0
	bne _080763D8
	b _08076408
_080763D6:
	strh r2, [r4, 0x1A]
_080763D8:
	movs r6, 0x16
	ldrsh r0, [r4, r6]
	cmp r0, 0
	beq _08076436
	ldr r3, _08076400 @ =gUnknown_2037F28
	ldr r5, _08076404 @ =0x00007ffd
_080763E4:
	ldrh r2, [r4, 0x16]
	subs r1, r2, 0x1
	strh r1, [r4, 0x16]
	ldr r0, [r3]
	subs r0, 0x8
	str r0, [r3]
	movs r6, 0
	ldrsh r0, [r0, r6]
	cmp r0, r5
	beq _08076434
	lsls r0, r1, 16
	cmp r0, 0
	bne _080763E4
	b _08076436
	.align 2, 0
_08076400: .4byte gUnknown_2037F28
_08076404: .4byte 0x00007ffd
_08076408:
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
	b _08076436
_08076410:
	ldr r2, _08076430 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x26]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8075980
	movs r0, 0
	b _08076438
	.align 2, 0
_08076430: .4byte gSprites
_08076434:
	strh r2, [r4, 0x16]
_08076436:
	movs r0, 0x1
_08076438:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8076308

	thumb_func_start sub_8076440
sub_8076440: @ 8076440
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_80764EC
	lsls r0, 16
	lsrs r0, 15
	movs r1, 0x40
	subs r5, r1, r0
	ldr r1, _0807648C @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r4, r0, r1
	ldrb r1, [r4, 0x3]
	lsls r1, 26
	lsrs r1, 27
	lsls r0, r5, 8
	ldr r2, _08076490 @ =gOamMatrices
	lsls r1, 3
	adds r1, r2
	movs r2, 0x6
	ldrsh r1, [r1, r2]
	bl __divsi3
	cmp r0, 0x80
	ble _0807647C
	movs r0, 0x80
_0807647C:
	subs r0, r5, r0
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x26]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807648C: .4byte gSprites
_08076490: .4byte gOamMatrices
	thumb_func_end sub_8076440

	thumb_func_start sub_8076494
sub_8076494: @ 8076494
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 24
	lsrs r0, 24
	bl sub_80764EC
	lsls r0, 16
	lsrs r0, 15
	movs r1, 0x40
	subs r5, r1, r0
	ldr r1, _080764E4 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r4, r0, r1
	ldrb r1, [r4, 0x3]
	lsls r1, 26
	lsrs r1, 27
	lsls r0, r5, 8
	ldr r2, _080764E8 @ =gOamMatrices
	lsls r1, 3
	adds r1, r2
	movs r2, 0x6
	ldrsh r1, [r1, r2]
	bl __divsi3
	cmp r0, 0x80
	ble _080764D4
	movs r0, 0x80
_080764D4:
	subs r0, r5, r0
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x26]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080764E4: .4byte gSprites
_080764E8: .4byte gOamMatrices
	thumb_func_end sub_8076494

	thumb_func_start sub_80764EC
sub_80764EC: @ 80764EC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08076548 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r1, _0807654C @ =gUnknown_2023D44
	ldr r6, _08076550 @ =gBattlerPartyIndexes
_08076508:
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, r2
	bne _080765AC
	lsls r0, r4, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08076568
	ldr r0, _08076554 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _0807655C
	lsls r0, r4, 1
	adds r0, r6
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08076558 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	b _0807655E
	.align 2, 0
_08076548: .4byte gSprites
_0807654C: .4byte gUnknown_2023D44
_08076550: .4byte gBattlerPartyIndexes
_08076554: .4byte gUnknown_2024018
_08076558: .4byte gPlayerParty
_0807655C:
	ldrh r1, [r1, 0x2]
_0807655E:
	ldr r0, _08076564 @ =gUnknown_8235E6C
	b _080765A0
	.align 2, 0
_08076564: .4byte gUnknown_8235E6C
_08076568:
	ldr r0, _08076594 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _0807659C
	lsls r0, r4, 1
	adds r0, r6
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08076598 @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	b _0807659E
	.align 2, 0
_08076594: .4byte gUnknown_2024018
_08076598: .4byte gEnemyParty
_0807659C:
	ldrh r1, [r1, 0x2]
_0807659E:
	ldr r0, _080765A8 @ =gUnknown_82349CC
_080765A0:
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	b _080765B8
	.align 2, 0
_080765A8: .4byte gUnknown_82349CC
_080765AC:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _08076508
	movs r0, 0x40
_080765B8:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80764EC

	thumb_func_start sub_80765C0
sub_80765C0: @ 80765C0
	strh r2, [r0]
	asrs r2, 16
	strh r2, [r1]
	bx lr
	thumb_func_end sub_80765C0

	thumb_func_start sub_80765C8
sub_80765C8: @ 80765C8
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	orrs r0, r1
	bx lr
	thumb_func_end sub_80765C8

	thumb_func_start sub_80765D4
sub_80765D4: @ 80765D4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r5, r3, 0
	ldr r0, [sp, 0x14]
	ldr r4, [sp, 0x18]
	ldr r6, [sp, 0x1C]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r6, 16
	lsrs r6, 16
	mov r3, r8
	strh r6, [r3, 0x18]
	strh r1, [r3, 0x26]
	strh r2, [r3, 0x1A]
	strh r5, [r3, 0x1C]
	strh r0, [r3, 0x22]
	strh r4, [r3, 0x24]
	lsls r0, 16
	asrs r0, 16
	lsls r2, 16
	asrs r2, 16
	subs r0, r2
	adds r1, r6, 0
	bl __divsi3
	mov r1, r8
	strh r0, [r1, 0x1E]
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	subs r4, r5
	adds r0, r4, 0
	adds r1, r6, 0
	bl __divsi3
	mov r3, r8
	strh r0, [r3, 0x20]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80765D4

	thumb_func_start sub_8076640
sub_8076640: @ 8076640
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x18]
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _08076652
	movs r0, 0
	b _080766AE
_08076652:
	subs r0, r1, 0x1
	strh r0, [r4, 0x18]
	lsls r0, 16
	cmp r0, 0
	beq _0807666C
	ldrh r0, [r4, 0x1E]
	ldrh r3, [r4, 0x1A]
	adds r0, r3
	strh r0, [r4, 0x1A]
	ldrh r0, [r4, 0x20]
	ldrh r1, [r4, 0x1C]
	adds r0, r1
	b _08076672
_0807666C:
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x1A]
	ldrh r0, [r4, 0x24]
_08076672:
	strh r0, [r4, 0x1C]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x1A
	ldrsh r1, [r4, r2]
	movs r3, 0x1C
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl obj_id_set_rotscale
	movs r0, 0x18
	ldrsh r3, [r4, r0]
	cmp r3, 0
	beq _0807669C
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8076440
	b _080766AC
_0807669C:
	ldr r2, _080766B4 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r3, [r0, 0x26]
_080766AC:
	ldrb r0, [r4, 0x18]
_080766AE:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080766B4: .4byte gSprites
	thumb_func_end sub_8076640

	thumb_func_start sub_80766B8
sub_80766B8: @ 80766B8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080766E4 @ =gUnknown_2037EFE
	ldrb r0, [r0]
	movs r1, 0
	cmp r0, 0x1E
	bls _080766D6
	movs r1, 0x1
	cmp r0, 0x64
	bls _080766D6
	movs r1, 0x3
	cmp r0, 0xC8
	bhi _080766D6
	movs r1, 0x2
_080766D6:
	ldr r0, _080766E8 @ =gUnknown_2037F02
	strh r1, [r0, 0xE]
	adds r0, r2, 0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080766E4: .4byte gUnknown_2037EFE
_080766E8: .4byte gUnknown_2037F02
	thumb_func_end sub_80766B8

	thumb_func_start sub_80766EC
sub_80766EC: @ 80766EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	ldr r6, _080767E0 @ =gUnknown_2037F1B
	ldrb r0, [r6]
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _0807672C
	ldr r2, _080767E4 @ =gSprites
	ldr r1, _080767E8 @ =gUnknown_2023D44
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x3
	adds r2, r4, 0
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
_0807672C:
	ldr r0, _080767EC @ =gUnknown_2037F1A
	mov r8, r0
	ldrb r0, [r0]
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _08076764
	ldr r2, _080767E4 @ =gSprites
	ldr r1, _080767E8 @ =gUnknown_2023D44
	mov r3, r8
	ldrb r0, [r3]
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x3
	adds r2, r4, 0
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
_08076764:
	ldrb r0, [r6]
	movs r5, 0x2
	eors r0, r5
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _0807679C
	ldr r2, _080767E4 @ =gSprites
	ldr r1, _080767E8 @ =gUnknown_2023D44
	ldrb r0, [r6]
	eors r0, r5
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x3
	adds r2, r4, 0
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
_0807679C:
	mov r1, r8
	ldrb r0, [r1]
	eors r0, r5
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080767D4
	ldr r2, _080767E4 @ =gSprites
	ldr r1, _080767E8 @ =gUnknown_2023D44
	mov r3, r8
	ldrb r0, [r3]
	eors r0, r5
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x3
	ands r7, r0
	lsls r3, r7, 2
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
_080767D4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080767E0: .4byte gUnknown_2037F1B
_080767E4: .4byte gSprites
_080767E8: .4byte gUnknown_2023D44
_080767EC: .4byte gUnknown_2037F1A
	thumb_func_end sub_80766EC

	thumb_func_start sub_80767F0
sub_80767F0: @ 80767F0
	push {r4-r6,lr}
	movs r5, 0
	ldr r0, _08076850 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	bge _0807684A
	ldr r6, _08076854 @ =gSprites
_080767FE:
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _08076840
	adds r0, r4, 0
	bl sub_807685C
	ldr r3, _08076858 @ =gUnknown_2023D44
	adds r3, r5, r3
	ldrb r2, [r3]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r6
	adds r1, 0x43
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r2, [r0, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r2, r1
	movs r1, 0x8
	orrs r2, r1
	strb r2, [r0, 0x5]
_08076840:
	adds r5, 0x1
	ldr r0, _08076850 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _080767FE
_0807684A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076850: .4byte gBattlersCount
_08076854: .4byte gSprites
_08076858: .4byte gUnknown_2023D44
	thumb_func_end sub_80767F0

	thumb_func_start sub_807685C
sub_807685C: @ 807685C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1E
	cmp r0, 0
	beq _0807687E
	movs r1, 0x14
	cmp r0, 0x2
	beq _0807687E
	movs r1, 0x32
	cmp r0, 0x1
	bne _0807687E
	movs r1, 0x28
_0807687E:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_807685C

	thumb_func_start sub_8076884
sub_8076884: @ 8076884
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0807689A
	cmp r0, 0x3
	bne _0807689E
_0807689A:
	movs r0, 0x2
	b _080768A0
_0807689E:
	movs r0, 0x1
_080768A0:
	movs r1, 0x4
	bl sub_80BC30C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8076884

	thumb_func_start sub_80768B0
sub_80768B0: @ 80768B0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080768C6
	cmp r0, 0x3
	bne _080768CA
_080768C6:
	movs r0, 0x2
	b _080768CC
_080768CA:
	movs r0, 0x1
_080768CC:
	pop {r1}
	bx r1
	thumb_func_end sub_80768B0

	thumb_func_start sub_80768D0
sub_80768D0: @ 80768D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	ldr r4, [sp, 0x30]
	ldr r5, [sp, 0x34]
	ldr r6, [sp, 0x38]
	mov r8, r6
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 16
	lsrs r3, 16
	mov r10, r3
	lsls r4, 16
	lsrs r4, 16
	str r4, [sp, 0x4]
	lsls r5, 24
	lsrs r5, 24
	str r5, [sp, 0x8]
	lsls r0, r7, 3
	ldr r1, _080769B0 @ =gUnknown_83AE084
	adds r0, r1
	bl LoadSpriteSheet
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0xC]
	ldr r1, _080769B4 @ =gUnknown_83AE054
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x2]
	bl AllocSpritePalette
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080769B8 @ =gMonSpritesGfxPtr
	ldr r0, [r4]
	cmp r0, 0
	beq _0807694E
	movs r1, 0xBE
	lsls r1, 1
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	bne _0807694E
	movs r0, 0x80
	lsls r0, 6
	bl AllocZeroed
	ldr r1, [r4]
	movs r2, 0xBE
	lsls r2, 1
	adds r1, r2
	str r0, [r1]
_0807694E:
	mov r3, r9
	cmp r3, 0
	bne _080769EC
	adds r0, r6, 0
	ldr r1, [sp, 0x3C]
	mov r2, r8
	bl GetFrontSpritePalFromSpeciesAndPersonality
	lsls r1, r5, 20
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r3, [sp, 0x44]
	cmp r3, 0x1
	beq _0807699A
	ldr r0, [sp, 0x40]
	lsls r1, r0, 24
	lsrs r1, 24
	movs r0, 0x5
	bl sub_804455C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0807699A
	ldr r0, _080769BC @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [sp, 0x40]
	lsls r0, r2, 2
	adds r0, r1
	ldrh r0, [r0, 0x2]
	cmp r0, 0
	beq _080769C4
_0807699A:
	lsls r0, r6, 3
	ldr r1, _080769C0 @ =gUnknown_82350AC
	adds r0, r1
	ldr r1, _080769B8 @ =gMonSpritesGfxPtr
	ldr r1, [r1]
	movs r3, 0xBE
	lsls r3, 1
	adds r1, r3
	ldr r1, [r1]
	movs r2, 0x1
	b _08076A46
	.align 2, 0
_080769B0: .4byte gUnknown_83AE084
_080769B4: .4byte gUnknown_83AE054
_080769B8: .4byte gMonSpritesGfxPtr
_080769BC: .4byte gUnknown_2024018
_080769C0: .4byte gUnknown_82350AC
_080769C4:
	lsls r0, r6, 3
	ldr r1, _080769E4 @ =gUnknown_82350AC
	adds r0, r1
	ldr r1, _080769E8 @ =gMonSpritesGfxPtr
	ldr r1, [r1]
	movs r2, 0xBE
	lsls r2, 1
	adds r1, r2
	ldr r1, [r1]
	movs r2, 0x1
	str r2, [sp]
	adds r2, r6, 0
	mov r3, r8
	bl sub_800ECF0
	b _08076A7C
	.align 2, 0
_080769E4: .4byte gUnknown_82350AC
_080769E8: .4byte gMonSpritesGfxPtr
_080769EC:
	adds r0, r6, 0
	ldr r1, [sp, 0x3C]
	mov r2, r8
	bl GetFrontSpritePalFromSpeciesAndPersonality
	lsls r1, r5, 20
	movs r3, 0x80
	lsls r3, 17
	adds r1, r3
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r0, [sp, 0x44]
	cmp r0, 0x1
	beq _08076A32
	ldr r2, [sp, 0x40]
	lsls r1, r2, 24
	lsrs r1, 24
	movs r0, 0x5
	bl sub_804455C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08076A32
	ldr r0, _08076A54 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r3, [sp, 0x40]
	lsls r0, r3, 2
	adds r0, r1
	ldrh r2, [r0, 0x2]
	cmp r2, 0
	beq _08076A60
_08076A32:
	lsls r0, r6, 3
	ldr r1, _08076A58 @ =gUnknown_823654C
	adds r0, r1
	ldr r1, _08076A5C @ =gMonSpritesGfxPtr
	ldr r1, [r1]
	movs r2, 0xBE
	lsls r2, 1
	adds r1, r2
	ldr r1, [r1]
	movs r2, 0
_08076A46:
	str r2, [sp]
	adds r2, r6, 0
	mov r3, r8
	bl LoadSpecialPokePic_DontHandleDeoxys
	b _08076A7C
	.align 2, 0
_08076A54: .4byte gUnknown_2024018
_08076A58: .4byte gUnknown_823654C
_08076A5C: .4byte gMonSpritesGfxPtr
_08076A60:
	lsls r0, r6, 3
	ldr r1, _08076AC8 @ =gUnknown_823654C
	adds r0, r1
	ldr r1, _08076ACC @ =gMonSpritesGfxPtr
	ldr r1, [r1]
	movs r3, 0xBE
	lsls r3, 1
	adds r1, r3
	ldr r1, [r1]
	str r2, [sp]
	adds r2, r6, 0
	mov r3, r8
	bl sub_800ECF0
_08076A7C:
	ldr r5, _08076ACC @ =gMonSpritesGfxPtr
	ldr r0, [r5]
	movs r4, 0xBE
	lsls r4, 1
	adds r0, r4
	ldr r0, [r0]
	ldr r2, [sp, 0xC]
	lsls r1, r2, 5
	ldr r3, _08076AD0 @ =0x06010000
	adds r1, r3
	movs r2, 0x80
	lsls r2, 4
	movs r3, 0x1
	bl RequestDma3Copy
	ldr r0, [r5]
	adds r0, r4
	ldr r0, [r0]
	bl Free
	ldr r0, [r5]
	adds r0, r4
	movs r1, 0
	str r1, [r0]
	mov r0, r9
	cmp r0, 0
	bne _08076ADC
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 3
	ldr r1, _08076AD4 @ =gUnknown_83AE054
	adds r0, r1
	mov r2, r10
	lsls r1, r2, 16
	asrs r1, 16
	ldr r3, _08076AD8 @ =gUnknown_82349CC
	b _08076AEE
	.align 2, 0
_08076AC8: .4byte gUnknown_823654C
_08076ACC: .4byte gMonSpritesGfxPtr
_08076AD0: .4byte 0x06010000
_08076AD4: .4byte gUnknown_83AE054
_08076AD8: .4byte gUnknown_82349CC
_08076ADC:
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 3
	ldr r1, _08076B18 @ =gUnknown_83AE054
	adds r0, r1
	mov r2, r10
	lsls r1, r2, 16
	asrs r1, 16
	ldr r3, _08076B1C @ =gUnknown_8235E6C
_08076AEE:
	lsls r2, r6, 2
	adds r2, r3
	ldrb r2, [r2, 0x1]
	ldr r3, [sp, 0x4]
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	ldr r3, [sp, 0x8]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08076B18: .4byte gUnknown_83AE054
_08076B1C: .4byte gUnknown_8235E6C
	thumb_func_end sub_80768D0

	thumb_func_start sub_8076B20
sub_8076B20: @ 8076B20
	push {lr}
	bl DestroySpriteAndFreeResources
	pop {r0}
	bx r0
	thumb_func_end sub_8076B20

	thumb_func_start sub_8076B2C
sub_8076B2C: @ 8076B2C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08076C08
	ldr r0, _08076B88 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0]
	mov r1, r8
	lsls r2, r1, 2
	adds r1, r2, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08076B94
	ldr r0, _08076B8C @ =gBattlerPartyIndexes
	mov r1, r8
	lsls r4, r1, 1
	adds r4, r0
	ldrh r0, [r4]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _08076B90 @ =gPlayerParty
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	ldrh r0, [r4]
	muls r0, r6
	adds r0, r5
	movs r1, 0
	bl GetMonData
	adds r2, r0, 0
	b _08076B9C
	.align 2, 0
_08076B88: .4byte gUnknown_2024018
_08076B8C: .4byte gBattlerPartyIndexes
_08076B90: .4byte gPlayerParty
_08076B94:
	ldrh r7, [r1, 0x2]
	ldr r0, _08076BD4 @ =gUnknown_2024008
	adds r0, r2, r0
	ldr r2, [r0]
_08076B9C:
	cmp r7, 0xC9
	bne _08076BEC
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _08076BD8
	movs r0, 0xC9
	b _08076BE2
	.align 2, 0
_08076BD4: .4byte gUnknown_2024008
_08076BD8:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_08076BE2:
	lsls r1, r0, 2
	ldr r0, _08076BE8 @ =gUnknown_8235E6C
	b _08076CDC
	.align 2, 0
_08076BE8: .4byte gUnknown_8235E6C
_08076BEC:
	movs r0, 0xCE
	lsls r0, 1
	cmp r7, r0
	bls _08076BFC
	ldr r4, _08076BF8 @ =gUnknown_8235E6C
	b _08076CDE
	.align 2, 0
_08076BF8: .4byte gUnknown_8235E6C
_08076BFC:
	lsls r1, r7, 2
	ldr r0, _08076C04 @ =gUnknown_8235E6C
	b _08076CDC
	.align 2, 0
_08076C04: .4byte gUnknown_8235E6C
_08076C08:
	ldr r0, _08076C48 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0]
	mov r1, r8
	lsls r2, r1, 2
	adds r1, r2, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08076C54
	ldr r0, _08076C4C @ =gBattlerPartyIndexes
	mov r1, r8
	lsls r4, r1, 1
	adds r4, r0
	ldrh r0, [r4]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _08076C50 @ =gEnemyParty
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	ldrh r0, [r4]
	muls r0, r6
	adds r0, r5
	movs r1, 0
	bl GetMonData
	adds r2, r0, 0
	b _08076C5C
	.align 2, 0
_08076C48: .4byte gUnknown_2024018
_08076C4C: .4byte gBattlerPartyIndexes
_08076C50: .4byte gEnemyParty
_08076C54:
	ldrh r7, [r1, 0x2]
	ldr r0, _08076C94 @ =gUnknown_2024008
	adds r0, r2, r0
	ldr r2, [r0]
_08076C5C:
	cmp r7, 0xC9
	bne _08076CA6
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _08076C98
	movs r0, 0xC9
	b _08076CA2
	.align 2, 0
_08076C94: .4byte gUnknown_2024008
_08076C98:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_08076CA2:
	lsls r1, r0, 2
	b _08076CDA
_08076CA6:
	ldr r0, _08076CBC @ =0x00000181
	cmp r7, r0
	bne _08076CC8
	ldr r0, _08076CC0 @ =gBattleMonForms
	add r0, r8
	ldrb r0, [r0]
	lsls r0, 2
	ldr r1, _08076CC4 @ =gUnknown_83AE03C
	adds r4, r0, r1
	b _08076CDE
	.align 2, 0
_08076CBC: .4byte 0x00000181
_08076CC0: .4byte gBattleMonForms
_08076CC4: .4byte gUnknown_83AE03C
_08076CC8:
	movs r0, 0xCE
	lsls r0, 1
	cmp r7, r0
	bls _08076CD8
	ldr r4, _08076CD4 @ =gUnknown_82349CC
	b _08076CDE
	.align 2, 0
_08076CD4: .4byte gUnknown_82349CC
_08076CD8:
	lsls r1, r7, 2
_08076CDA:
	ldr r0, _08076CF0 @ =gUnknown_82349CC
_08076CDC:
	adds r4, r1, r0
_08076CDE:
	mov r0, r9
	cmp r0, 0x6
	bhi _08076D8E
	lsls r0, 2
	ldr r1, _08076CF4 @ =_08076CF8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08076CF0: .4byte gUnknown_82349CC
_08076CF4: .4byte _08076CF8
	.align 2, 0
_08076CF8:
	.4byte _08076D14
	.4byte _08076D1E
	.4byte _08076D4A
	.4byte _08076D62
	.4byte _08076D26
	.4byte _08076D38
	.4byte _08076D7A
_08076D14:
	ldrb r1, [r4]
	movs r0, 0xF
	ands r0, r1
	lsls r0, 3
	b _08076D90
_08076D1E:
	ldrb r0, [r4]
	lsrs r0, 4
	lsls r0, 3
	b _08076D90
_08076D26:
	mov r0, r8
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4]
	lsrs r1, 4
	b _08076D5C
_08076D38:
	mov r0, r8
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4]
	lsrs r1, 4
	b _08076D74
_08076D4A:
	mov r0, r8
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrb r2, [r4]
	movs r1, 0xF
	ands r1, r2
_08076D5C:
	lsls r1, 2
	subs r0, r1
	b _08076D90
_08076D62:
	mov r0, r8
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrb r2, [r4]
	movs r1, 0xF
	ands r1, r2
_08076D74:
	lsls r1, 2
	adds r0, r1
	b _08076D90
_08076D7A:
	mov r0, r8
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1F
	ldrb r1, [r4, 0x1]
	subs r0, r1
	b _08076D90
_08076D8E:
	movs r0, 0
_08076D90:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8076B2C

	thumb_func_start sub_8076D9C
sub_8076D9C: @ 8076D9C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r2
	mov r10, r3
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	cmp r1, 0
	bne _08076DBA
	movs r5, 0
	movs r6, 0x1
	b _08076DBE
_08076DBA:
	movs r5, 0x2
	movs r6, 0x3
_08076DBE:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r7, r0, 24
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _08076E06
	movs r0, 0x2
	eors r4, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r3, r0, 24
	mov r0, r8
	lsls r1, r0, 16
	lsls r2, r7, 16
	b _08076E12
_08076E06:
	mov r0, r8
	lsls r1, r0, 16
	lsrs r5, r1, 16
	lsls r0, r7, 16
	lsrs r3, r0, 16
	adds r2, r0, 0
_08076E12:
	asrs r0, r1, 16
	adds r0, r5
	asrs r0, 1
	mov r1, r9
	strh r0, [r1]
	asrs r0, r2, 16
	adds r0, r3
	asrs r0, 1
	mov r1, r10
	strh r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8076D9C

	thumb_func_start sub_8076E34
sub_8076E34: @ 8076E34
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x4
	lsls r6, r1, 24
	lsrs r6, 24
	ldr r0, _08076ECC @ =SpriteCallbackDummy
	mov r10, r0
	bl CreateInvisibleSpriteWithCallback
	mov r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _08076ED0 @ =gSprites
	mov r9, r0
	mov r0, r8
	lsls r3, r0, 4
	add r3, r8
	lsls r3, 2
	mov r0, r9
	adds r5, r3, r0
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	add r4, r9
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x44
	str r3, [sp]
	bl memcpy
	adds r2, r5, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldrb r2, [r5, 0x5]
	movs r1, 0xD
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r5, 0x5]
	ldrb r0, [r5, 0x1]
	ands r1, r0
	movs r0, 0x8
	orrs r1, r0
	strb r1, [r5, 0x1]
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 22
	ldrh r2, [r5, 0x4]
	ldr r0, _08076ED4 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	movs r0, 0x1C
	add r9, r0
	ldr r3, [sp]
	add r3, r9
	mov r0, r10
	str r0, [r3]
	mov r0, r8
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08076ECC: .4byte SpriteCallbackDummy
_08076ED0: .4byte gSprites
_08076ED4: .4byte 0xfffffc00
	thumb_func_end sub_8076E34

	thumb_func_start sub_8076ED8
sub_8076ED8: @ 8076ED8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8074FCC
	ldr r0, _08076F10 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08076F18
	ldr r2, _08076F14 @ =gUnknown_2037F02
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x6]
	negs r0, r0
	strh r0, [r2, 0x6]
	adds r3, r4, 0
	adds r3, 0x3F
	ldrb r0, [r3]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r3]
	adds r1, r2, 0
	b _08076F22
	.align 2, 0
_08076F10: .4byte gUnknown_2037F1A
_08076F14: .4byte gUnknown_2037F02
_08076F18:
	ldr r1, _08076F4C @ =gUnknown_2037F02
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
_08076F22:
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x34]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x38]
	ldr r1, _08076F50 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _08076F54 @ =sub_8074E70
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076F4C: .4byte gUnknown_2037F02
_08076F50: .4byte move_anim_8074EE0
_08076F54: .4byte sub_8074E70
	thumb_func_end sub_8076ED8

	thumb_func_start sub_8076F58
sub_8076F58: @ 8076F58
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08076F80 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08076F88
	ldr r2, _08076F84 @ =gUnknown_2037F02
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	movs r1, 0x6
	ldrsh r0, [r2, r1]
	negs r0, r0
	strh r0, [r2, 0x6]
	adds r1, r2, 0
	b _08076F92
	.align 2, 0
_08076F80: .4byte gUnknown_2037F1A
_08076F84: .4byte gUnknown_2037F02
_08076F88:
	ldr r1, _08076FC4 @ =gUnknown_2037F02
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
_08076F92:
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x34]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x38]
	ldrb r1, [r1, 0xC]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r1, _08076FC8 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _08076FCC @ =sub_8074E70
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076FC4: .4byte gUnknown_2037F02
_08076FC8: .4byte move_anim_8074EE0
_08076FCC: .4byte sub_8074E70
	thumb_func_end sub_8076F58

	thumb_func_start sub_8076FD0
sub_8076FD0: @ 8076FD0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8074FCC
	ldr r0, _08076FF4 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08076FFC
	ldr r0, _08076FF8 @ =gUnknown_2037F02
	ldrh r1, [r4, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r4, 0x20]
	b _08077008
	.align 2, 0
_08076FF4: .4byte gUnknown_2037F1A
_08076FF8: .4byte gUnknown_2037F02
_08076FFC:
	ldr r1, _08077024 @ =gUnknown_2037F02
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	adds r0, r1, 0
_08077008:
	ldrh r0, [r0, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _08077028 @ =sub_8074F6C
	str r0, [r4, 0x1C]
	ldr r1, _0807702C @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077024: .4byte gUnknown_2037F02
_08077028: .4byte sub_8074F6C
_0807702C: .4byte DestroyAnimSprite
	thumb_func_end sub_8076FD0

	thumb_func_start sub_8077030
sub_8077030: @ 8077030
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080770C4 @ =gTasks
	adds r5, r1, r0
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	strh r0, [r5, 0x8]
	ldr r7, _080770C8 @ =gUnknown_2037F1A
	ldrb r0, [r7]
	bl GetBattlerSide
	lsls r0, 24
	movs r1, 0x8
	cmp r0, 0
	beq _08077064
	movs r0, 0x8
	negs r0, r0
	adds r1, r0, 0
_08077064:
	strh r1, [r5, 0xA]
	strh r6, [r5, 0xC]
	strh r6, [r5, 0xE]
	ldr r4, _080770CC @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x24]
	ldrh r2, [r5, 0x8]
	subs r1, r2
	strh r1, [r0, 0x24]
	ldr r0, _080770D0 @ =0x00002771
	bl AllocSpritePalette
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x10]
	strh r6, [r5, 0x12]
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	adds r0, 0x10
	lsls r0, 20
	lsrs r6, r0, 16
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	lsls r4, r0, 4
	ldrb r0, [r7]
	bl sub_807685C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x14]
	cmp r0, 0x14
	beq _080770C0
	cmp r0, 0x28
	bne _080770D4
_080770C0:
	movs r0, 0x2
	b _080770D6
	.align 2, 0
_080770C4: .4byte gTasks
_080770C8: .4byte gUnknown_2037F1A
_080770CC: .4byte gSprites
_080770D0: .4byte 0x00002771
_080770D4:
	movs r0, 0x3
_080770D6:
	strh r0, [r5, 0x14]
	lsls r0, r4, 1
	ldr r1, _08077104 @ =gPlttBufferUnfaded
	adds r0, r1
	lsls r1, r6, 1
	ldr r2, _08077108 @ =gPlttBufferFaded
	adds r1, r2
	ldr r2, _0807710C @ =0x04000008
	bl CpuSet
	ldr r0, _08077110 @ =gUnknown_2037F02
	ldrb r2, [r0, 0x2]
	ldrh r3, [r0]
	adds r0, r6, 0
	movs r1, 0x10
	bl BlendPalette
	ldr r0, _08077114 @ =sub_8077118
	str r0, [r5]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077104: .4byte gPlttBufferUnfaded
_08077108: .4byte gPlttBufferFaded
_0807710C: .4byte 0x04000008
_08077110: .4byte gUnknown_2037F02
_08077114: .4byte sub_8077118
	thumb_func_end sub_8077030

	thumb_func_start sub_8077118
sub_8077118: @ 8077118
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807713C @ =gTasks
	adds r4, r0, r1
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0807717C
	cmp r0, 0x1
	bgt _08077140
	cmp r0, 0
	beq _08077146
	b _080771D8
	.align 2, 0
_0807713C: .4byte gTasks
_08077140:
	cmp r0, 0x2
	beq _080771C4
	b _080771D8
_08077146:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80771E4
	ldr r2, _08077178 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0xA]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	strh r1, [r0, 0x24]
	ldrh r1, [r4, 0xE]
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _080771D8
	strh r1, [r4, 0xE]
	b _080771B6
	.align 2, 0
_08077178: .4byte gSprites
_0807717C:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80771E4
	ldr r3, _080771C0 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x24]
	ldrh r2, [r4, 0xA]
	subs r1, r2
	strh r1, [r0, 0x24]
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bne _080771D8
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	strh r2, [r1, 0x24]
_080771B6:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	b _080771D8
	.align 2, 0
_080771C0: .4byte gSprites
_080771C4:
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080771D8
	ldr r0, _080771E0 @ =0x00002771
	bl FreeSpritePaletteByTag
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080771D8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080771E0: .4byte 0x00002771
	thumb_func_end sub_8077118

	thumb_func_start sub_80771E4
sub_80771E4: @ 80771E4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	movs r0, 0
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	lsls r0, 16
	lsrs r7, r0, 16
	asrs r0, 16
	cmp r0, 0
	blt _08077254
	ldr r5, _08077260 @ =gSprites
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r3, r4, r5
	movs r0, 0x3
	ldrb r1, [r6, 0x14]
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldrb r1, [r6, 0x10]
	lsls r1, 4
	movs r2, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x5]
	movs r0, 0x8
	strh r0, [r3, 0x2E]
	mov r0, r8
	strh r0, [r3, 0x30]
	strh r7, [r3, 0x32]
	movs r0, 0x8
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r0, [r0, 0x24]
	strh r0, [r3, 0x24]
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _08077264 @ =sub_8077268
	str r0, [r4]
	ldrh r0, [r6, 0x12]
	adds r0, 0x1
	strh r0, [r6, 0x12]
_08077254:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077260: .4byte gSprites
_08077264: .4byte sub_8077268
	thumb_func_end sub_80771E4

	thumb_func_start sub_8077268
sub_8077268: @ 8077268
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	subs r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _08077292
	ldr r2, _08077298 @ =gTasks
	movs r0, 0x30
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x12]
	subs r1, 0x1
	strh r1, [r0, 0x12]
	adds r0, r3, 0
	bl obj_delete_but_dont_free_vram
_08077292:
	pop {r0}
	bx r0
	.align 2, 0
_08077298: .4byte gTasks
	thumb_func_end sub_8077268

	thumb_func_start sub_807729C
sub_807729C: @ 807729C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080772D0 @ =gUnknown_2037F1A
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080772D4
	movs r0, 0x5
	b _080772D6
	.align 2, 0
_080772D0: .4byte gUnknown_2037F1A
_080772D4:
	ldr r0, _080772E8 @ =0x0000fff6
_080772D6:
	strh r0, [r5, 0x2E]
	ldr r0, _080772EC @ =0x0000ffd8
	strh r0, [r5, 0x30]
	ldr r0, _080772F0 @ =sub_80772F4
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080772E8: .4byte 0x0000fff6
_080772EC: .4byte 0x0000ffd8
_080772F0: .4byte sub_80772F4
	thumb_func_end sub_807729C

	thumb_func_start sub_80772F4
sub_80772F4: @ 80772F4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r5, [r4, 0x30]
	ldrh r2, [r4, 0x34]
	adds r0, r5, r2
	strh r0, [r4, 0x34]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r4, 0x24]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r4, 0x26]
	lsls r0, r5, 16
	asrs r0, 16
	movs r1, 0x14
	negs r1, r1
	cmp r0, r1
	bge _08077330
	adds r0, r5, 0x1
	strh r0, [r4, 0x30]
_08077330:
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _08077348
	adds r0, r4, 0
	bl DestroyAnimSprite
_08077348:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80772F4

	thumb_func_start sub_8077350
sub_8077350: @ 8077350
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _08077388 @ =gUnknown_2037F02
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x8]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0xA]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x36]
	ldr r0, _0807738C @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08077390
	ldrh r0, [r5, 0x8]
	adds r0, 0x1E
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0xA]
	subs r0, 0x14
	b _0807739E
	.align 2, 0
_08077388: .4byte gUnknown_2037F02
_0807738C: .4byte gUnknown_2037F1B
_08077390:
	ldrh r0, [r5, 0x8]
	subs r0, 0x1E
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0xA]
	subs r0, 0x50
_0807739E:
	strh r0, [r4, 0x22]
	ldr r0, _080773B4 @ =sub_8075590
	str r0, [r4, 0x1C]
	ldr r1, _080773B8 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080773B4: .4byte sub_8075590
_080773B8: .4byte DestroyAnimSprite
	thumb_func_end sub_8077350

	.align 2, 0 @ Don't pad with nop.
