	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

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
