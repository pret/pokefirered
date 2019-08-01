	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start BattleScriptExecute
BattleScriptExecute: @ 801BBE4
	ldr r1, _0801BC10 @ =gBattlescriptCurrInstr
	str r0, [r1]
	ldr r0, _0801BC14 @ =gBattleResources
	ldr r0, [r0]
	ldr r2, [r0, 0xC]
	adds r3, r2, 0
	adds r3, 0x20
	ldrb r0, [r3]
	adds r1, r0, 0x1
	strb r1, [r3]
	lsls r0, 24
	lsrs r0, 22
	adds r2, r0
	ldr r1, _0801BC18 @ =gBattleMainFunc
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, _0801BC1C @ =RunBattleScriptCommands_PopCallbacksStack
	str r0, [r1]
	ldr r1, _0801BC20 @ =gUnknown_2023BE3
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0801BC10: .4byte gBattlescriptCurrInstr
_0801BC14: .4byte gBattleResources
_0801BC18: .4byte gBattleMainFunc
_0801BC1C: .4byte RunBattleScriptCommands_PopCallbacksStack
_0801BC20: .4byte gUnknown_2023BE3
	thumb_func_end BattleScriptExecute

	thumb_func_start BattleScriptPushCursorAndCallback
BattleScriptPushCursorAndCallback: @ 801BC24
	push {r4,lr}
	adds r4, r0, 0
	bl BattleScriptPushCursor
	ldr r0, _0801BC58 @ =gBattlescriptCurrInstr
	str r4, [r0]
	ldr r0, _0801BC5C @ =gBattleResources
	ldr r0, [r0]
	ldr r2, [r0, 0xC]
	adds r3, r2, 0
	adds r3, 0x20
	ldrb r0, [r3]
	adds r1, r0, 0x1
	strb r1, [r3]
	lsls r0, 24
	lsrs r0, 22
	adds r2, r0
	ldr r1, _0801BC60 @ =gBattleMainFunc
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, _0801BC64 @ =sub_8015C74
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801BC58: .4byte gBattlescriptCurrInstr
_0801BC5C: .4byte gBattleResources
_0801BC60: .4byte gBattleMainFunc
_0801BC64: .4byte sub_8015C74
	thumb_func_end BattleScriptPushCursorAndCallback

	thumb_func_start ItemBattleEffects
ItemBattleEffects: @ 801BC68
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	movs r0, 0
	mov r10, r0
	movs r1, 0
	str r1, [sp, 0xC]
	add r0, sp, 0x4
	strb r1, [r0]
	ldr r4, _0801BCB4 @ =gLastUsedItem
	ldr r1, _0801BCB8 @ =gBattleMons
	movs r0, 0x58
	muls r0, r7
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	strh r0, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _0801BCC0
	ldr r1, _0801BCBC @ =gEnigmaBerries
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrb r5, [r0, 0x7]
	ldrb r0, [r0, 0x1A]
	b _0801BCD4
	.align 2, 0
_0801BCB4: .4byte gLastUsedItem
_0801BCB8: .4byte gBattleMons
_0801BCBC: .4byte gEnigmaBerries
_0801BCC0:
	ldrh r0, [r4]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r4]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r0, 24
_0801BCD4:
	mov r9, r0
	ldr r1, _0801BCFC @ =gBattleMons
	ldr r0, _0801BD00 @ =gBattlerAttacker
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	str r0, [sp, 0x14]
	cmp r0, 0xAF
	bne _0801BD08
	ldr r1, _0801BD04 @ =gEnigmaBerries
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r3, [r0, 0x7]
	mov r8, r3
	ldrb r0, [r0, 0x1A]
	b _0801BD1E
	.align 2, 0
_0801BCFC: .4byte gBattleMons
_0801BD00: .4byte gBattlerAttacker
_0801BD04: .4byte gEnigmaBerries
_0801BD08:
	ldr r0, [sp, 0x14]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, [sp, 0x14]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r0, 24
_0801BD1E:
	str r0, [sp, 0x10]
	ldr r2, _0801BD54 @ =gBattleMons
	ldr r0, _0801BD58 @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r4, [r0, 0x2E]
	cmp r4, 0xAF
	beq _0801BD3E
	adds r0, r4, 0
	bl ItemId_GetHoldEffect
	adds r0, r4, 0
	bl ItemId_GetHoldEffectParam
_0801BD3E:
	ldr r0, [sp, 0x8]
	cmp r0, 0x4
	bls _0801BD48
	bl _0801CFA6
_0801BD48:
	lsls r0, 2
	ldr r1, _0801BD5C @ =_0801BD60
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801BD54: .4byte gBattleMons
_0801BD58: .4byte gBattlerTarget
_0801BD5C: .4byte _0801BD60
	.align 2, 0
_0801BD60:
	.4byte _0801BD74
	.4byte _0801BE04
	.4byte _0801CFA6
	.4byte _0801C9FC
	.4byte _0801CE4C
_0801BD74:
	cmp r5, 0x17
	beq _0801BD94
	cmp r5, 0x20
	beq _0801BD80
	bl _0801CFA6
_0801BD80:
	ldr r0, _0801BD90 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x4A
	movs r1, 0x2
	strb r1, [r0]
	bl _0801CFA6
	.align 2, 0
_0801BD90: .4byte gBattleStruct
_0801BD94:
	ldr r1, _0801BDEC @ =gBattleMons
	mov r8, r1
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x18
	adds r1, r0
	movs r2, 0x6
	movs r3, 0x7
	mov r10, r3
_0801BDAA:
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0x5
	bgt _0801BDB8
	strb r2, [r1]
	movs r5, 0x5
	str r5, [sp, 0xC]
_0801BDB8:
	adds r1, 0x1
	movs r0, 0x1
	negs r0, r0
	add r10, r0
	mov r3, r10
	cmp r3, 0
	bge _0801BDAA
	ldr r5, [sp, 0xC]
	cmp r5, 0
	bne _0801BDD0
	bl _0801CFA6
_0801BDD0:
	ldr r0, _0801BDF0 @ =gBattleScripting
	strb r7, [r0, 0x17]
	ldr r0, _0801BDF4 @ =gPotentialItemEffectBattler
	strb r7, [r0]
	ldr r1, _0801BDF8 @ =gActiveBattler
	ldr r0, _0801BDFC @ =gBattlerAttacker
	strb r7, [r0]
	strb r7, [r1]
	ldr r0, _0801BE00 @ =BattleScript_WhiteHerbEnd2
	bl BattleScriptExecute
	bl _0801CFA6
	.align 2, 0
_0801BDEC: .4byte gBattleMons
_0801BDF0: .4byte gBattleScripting
_0801BDF4: .4byte gPotentialItemEffectBattler
_0801BDF8: .4byte gActiveBattler
_0801BDFC: .4byte gBattlerAttacker
_0801BE00: .4byte BattleScript_WhiteHerbEnd2
_0801BE04:
	ldr r1, _0801BE2C @ =gBattleMons
	movs r0, 0x58
	muls r0, r7
	adds r0, r1
	ldrh r0, [r0, 0x28]
	mov r8, r1
	cmp r0, 0
	bne _0801BE18
	bl _0801CFA6
_0801BE18:
	subs r0, r5, 0x1
	cmp r0, 0x2A
	bls _0801BE22
	bl _0801C952
_0801BE22:
	lsls r0, 2
	ldr r1, _0801BE30 @ =_0801BE34
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801BE2C: .4byte gBattleMons
_0801BE30: .4byte _0801BE34
	.align 2, 0
_0801BE34:
	.4byte _0801BEE0
	.4byte _0801C6C0
	.4byte _0801C784
	.4byte _0801C6F0
	.4byte _0801C724
	.4byte _0801C754
	.4byte _0801BF2C
	.4byte _0801C7C0
	.4byte _0801C7F0
	.4byte _0801C0F8
	.4byte _0801C178
	.4byte _0801C1F4
	.4byte _0801C288
	.4byte _0801C31C
	.4byte _0801C3B0
	.4byte _0801C418
	.4byte _0801C46C
	.4byte _0801C4C0
	.4byte _0801C528
	.4byte _0801C58C
	.4byte _0801C5D8
	.4byte _0801C952
	.4byte _0801C02C
	.4byte _0801C952
	.4byte _0801C952
	.4byte _0801C952
	.4byte _0801C952
	.4byte _0801C91C
	.4byte _0801C952
	.4byte _0801C952
	.4byte _0801C952
	.4byte _0801C952
	.4byte _0801C952
	.4byte _0801C952
	.4byte _0801C952
	.4byte _0801C952
	.4byte _0801C952
	.4byte _0801C952
	.4byte _0801C952
	.4byte _0801C952
	.4byte _0801C952
	.4byte _0801C952
	.4byte _0801C098
_0801BEE0:
	movs r0, 0x58
	muls r0, r7
	mov r1, r8
	adds r2, r0, r1
	ldrh r0, [r2, 0x2C]
	ldrh r1, [r2, 0x28]
	lsrs r0, 1
	cmp r1, r0
	bls _0801BEF6
	bl _0801C952
_0801BEF6:
	cmp r6, 0
	beq _0801BEFE
	bl _0801C952
_0801BEFE:
	ldr r4, _0801BF24 @ =gBattleMoveDamage
	mov r3, r9
	str r3, [r4]
	ldrh r3, [r2, 0x28]
	mov r5, r9
	adds r0, r3, r5
	ldrh r1, [r2, 0x2C]
	cmp r0, r1
	ble _0801BF14
	subs r0, r1, r3
	str r0, [r4]
_0801BF14:
	ldr r0, [r4]
	negs r0, r0
	str r0, [r4]
	ldr r0, _0801BF28 @ =BattleScript_ItemHealHP_RemoveItem
	bl BattleScriptExecute
	b _0801C27E
	.align 2, 0
_0801BF24: .4byte gBattleMoveDamage
_0801BF28: .4byte BattleScript_ItemHealHP_RemoveItem
_0801BF2C:
	cmp r6, 0
	beq _0801BF34
	bl _0801C952
_0801BF34:
	adds r0, r7, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _0801BF58
	ldr r1, _0801BF50 @ =gBattlerPartyIndexes
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0801BF54 @ =gPlayerParty
	b _0801BF66
	.align 2, 0
_0801BF50: .4byte gBattlerPartyIndexes
_0801BF54: .4byte gPlayerParty
_0801BF58:
	ldr r1, _0801BFD4 @ =gBattlerPartyIndexes
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0801BFD8 @ =gEnemyParty
_0801BF66:
	adds r4, r1, r0
	movs r1, 0
	mov r10, r1
	add r5, sp, 0x4
_0801BF6E:
	mov r1, r10
	adds r1, 0xD
	adds r0, r4, 0
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	mov r1, r10
	adds r1, 0x11
	adds r0, r4, 0
	bl GetMonData
	strb r0, [r5]
	adds r0, r4, 0
	movs r1, 0x15
	bl GetMonData
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r6, 0
	beq _0801BF9E
	ldrb r0, [r5]
	cmp r0, 0
	beq _0801BFA8
_0801BF9E:
	movs r2, 0x1
	add r10, r2
	mov r3, r10
	cmp r3, 0x3
	ble _0801BF6E
_0801BFA8:
	mov r5, r10
	cmp r5, 0x4
	bne _0801BFB2
	bl _0801C952
_0801BFB2:
	lsls r2, r5, 24
	lsrs r2, 24
	adds r0, r6, 0
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r2, r0, 24
	add r0, sp, 0x4
	ldrb r0, [r0]
	mov r3, r9
	adds r1, r0, r3
	cmp r1, r2
	ble _0801BFDC
	add r0, sp, 0x4
	strb r2, [r0]
	b _0801BFE0
	.align 2, 0
_0801BFD4: .4byte gBattlerPartyIndexes
_0801BFD8: .4byte gEnemyParty
_0801BFDC:
	add r0, sp, 0x4
	strb r1, [r0]
_0801BFE0:
	ldr r1, _0801C020 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	strb r6, [r1, 0x2]
	lsrs r0, r6, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r0, _0801C024 @ =BattleScript_BerryPPHealEnd2
	bl BattleScriptExecute
	mov r1, r10
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	add r5, sp, 0x4
	str r5, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl BtlController_EmitSetMonData
	ldr r0, _0801C028 @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBattlerForControllerExec
	movs r0, 0x3
	str r0, [sp, 0xC]
	bl _0801C95A
	.align 2, 0
_0801C020: .4byte gBattleTextBuff1
_0801C024: .4byte BattleScript_BerryPPHealEnd2
_0801C028: .4byte gActiveBattler
_0801C02C:
	ldr r0, _0801C080 @ =gBattleMons
	movs r1, 0x58
	muls r1, r7
	adds r0, 0x18
	adds r1, r0
	movs r2, 0x6
	movs r3, 0x7
	mov r10, r3
_0801C03C:
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0x5
	bgt _0801C04A
	strb r2, [r1]
	movs r5, 0x5
	str r5, [sp, 0xC]
_0801C04A:
	adds r1, 0x1
	movs r0, 0x1
	negs r0, r0
	add r10, r0
	mov r3, r10
	cmp r3, 0
	bge _0801C03C
	movs r5, 0x8
	mov r10, r5
	ldr r0, [sp, 0xC]
	cmp r0, 0
	bne _0801C066
	bl _0801CFA6
_0801C066:
	ldr r0, _0801C084 @ =gBattleScripting
	strb r7, [r0, 0x17]
	ldr r0, _0801C088 @ =gPotentialItemEffectBattler
	strb r7, [r0]
	ldr r1, _0801C08C @ =gActiveBattler
	ldr r0, _0801C090 @ =gBattlerAttacker
	strb r7, [r0]
	strb r7, [r1]
	ldr r0, _0801C094 @ =BattleScript_WhiteHerbEnd2
	bl BattleScriptExecute
	bl _0801C952
	.align 2, 0
_0801C080: .4byte gBattleMons
_0801C084: .4byte gBattleScripting
_0801C088: .4byte gPotentialItemEffectBattler
_0801C08C: .4byte gActiveBattler
_0801C090: .4byte gBattlerAttacker
_0801C094: .4byte BattleScript_WhiteHerbEnd2
_0801C098:
	movs r0, 0x58
	muls r0, r7
	mov r2, r8
	adds r1, r0, r2
	ldrh r0, [r1, 0x28]
	ldrh r3, [r1, 0x2C]
	cmp r0, r3
	bcc _0801C0AC
	bl _0801C952
_0801C0AC:
	cmp r6, 0
	beq _0801C0B4
	bl _0801C952
_0801C0B4:
	ldr r3, _0801C0F0 @ =gBattleMoveDamage
	ldrh r0, [r1, 0x2C]
	lsrs r0, 4
	str r0, [r3]
	cmp r0, 0
	bne _0801C0C4
	movs r0, 0x1
	str r0, [r3]
_0801C0C4:
	ldrh r2, [r1, 0x28]
	ldr r0, [r3]
	adds r0, r2, r0
	ldrh r1, [r1, 0x2C]
	cmp r0, r1
	ble _0801C0D4
	subs r0, r1, r2
	str r0, [r3]
_0801C0D4:
	ldr r0, [r3]
	negs r0, r0
	str r0, [r3]
	ldr r0, _0801C0F4 @ =BattleScript_ItemHealHP_End2
	bl BattleScriptExecute
	movs r0, 0x4
	str r0, [sp, 0xC]
	adds r0, r7, 0
	adds r1, r5, 0
	bl sub_80C7208
	bl _0801C952
	.align 2, 0
_0801C0F0: .4byte gBattleMoveDamage
_0801C0F4: .4byte BattleScript_ItemHealHP_End2
_0801C0F8:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	str r1, [sp, 0x18]
	adds r4, r1, 0
	add r4, r8
	ldrh r0, [r4, 0x2C]
	ldrh r1, [r4, 0x28]
	lsrs r0, 1
	cmp r1, r0
	bls _0801C112
	bl _0801C952
_0801C112:
	cmp r6, 0
	beq _0801C11A
	bl _0801C952
_0801C11A:
	ldr r1, _0801C170 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x8
	strb r0, [r1, 0x1]
	strb r6, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r5, _0801C174 @ =gBattleMoveDamage
	ldrh r0, [r4, 0x2C]
	mov r1, r9
	bl __divsi3
	str r0, [r5]
	cmp r0, 0
	bne _0801C13E
	movs r0, 0x1
	str r0, [r5]
_0801C13E:
	ldrh r2, [r4, 0x28]
	ldr r0, [r5]
	adds r0, r2, r0
	ldrh r1, [r4, 0x2C]
	cmp r0, r1
	ble _0801C14E
	subs r0, r1, r2
	str r0, [r5]
_0801C14E:
	ldr r0, [r5]
	negs r0, r0
	str r0, [r5]
	mov r0, r8
	adds r0, 0x48
	ldr r2, [sp, 0x18]
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0
	bl GetFlavorRelationByPersonality
	lsls r0, 24
	cmp r0, 0
	bge _0801C16C
	b _0801C2F8
_0801C16C:
	b _0801C30C
	.align 2, 0
_0801C170: .4byte gBattleTextBuff1
_0801C174: .4byte gBattleMoveDamage
_0801C178:
	movs r0, 0x58
	adds r5, r7, 0
	muls r5, r0
	str r5, [sp, 0x1C]
	add r5, r8
	ldrh r0, [r5, 0x2C]
	ldrh r1, [r5, 0x28]
	lsrs r0, 1
	cmp r1, r0
	bls _0801C190
	bl _0801C952
_0801C190:
	cmp r6, 0
	beq _0801C198
	bl _0801C952
_0801C198:
	ldr r1, _0801C1EC @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x8
	strb r0, [r1, 0x1]
	movs r6, 0x1
	strb r6, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r4, _0801C1F0 @ =gBattleMoveDamage
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _0801C1BC
	str r6, [r4]
_0801C1BC:
	ldrh r2, [r5, 0x28]
	ldr r0, [r4]
	adds r0, r2, r0
	ldrh r1, [r5, 0x2C]
	cmp r0, r1
	ble _0801C1CC
	subs r0, r1, r2
	str r0, [r4]
_0801C1CC:
	ldr r0, [r4]
	negs r0, r0
	str r0, [r4]
	mov r0, r8
	adds r0, 0x48
	ldr r1, [sp, 0x1C]
	adds r0, r1, r0
	ldr r0, [r0]
	movs r1, 0x1
	bl GetFlavorRelationByPersonality
	lsls r0, 24
	cmp r0, 0
	bge _0801C1EA
	b _0801C38A
_0801C1EA:
	b _0801C3A0
	.align 2, 0
_0801C1EC: .4byte gBattleTextBuff1
_0801C1F0: .4byte gBattleMoveDamage
_0801C1F4:
	movs r0, 0x58
	adds r3, r7, 0
	muls r3, r0
	str r3, [sp, 0x20]
	adds r5, r3, 0
	add r5, r8
	ldrh r0, [r5, 0x2C]
	ldrh r1, [r5, 0x28]
	lsrs r0, 1
	cmp r1, r0
	bls _0801C20C
	b _0801C952
_0801C20C:
	cmp r6, 0
	beq _0801C212
	b _0801C952
_0801C212:
	ldr r1, _0801C26C @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x8
	strb r0, [r1, 0x1]
	movs r0, 0x2
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r4, _0801C270 @ =gBattleMoveDamage
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _0801C238
	movs r0, 0x1
	str r0, [r4]
_0801C238:
	ldrh r2, [r5, 0x28]
	ldr r0, [r4]
	adds r0, r2, r0
	ldrh r1, [r5, 0x2C]
	cmp r0, r1
	ble _0801C248
	subs r0, r1, r2
	str r0, [r4]
_0801C248:
	ldr r0, [r4]
	negs r0, r0
	str r0, [r4]
	mov r0, r8
	adds r0, 0x48
	ldr r5, [sp, 0x20]
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, 0x2
	bl GetFlavorRelationByPersonality
	lsls r0, 24
	cmp r0, 0
	bge _0801C278
	ldr r0, _0801C274 @ =BattleScript_BerryConfuseHealEnd2
	bl BattleScriptExecute
	b _0801C27E
	.align 2, 0
_0801C26C: .4byte gBattleTextBuff1
_0801C270: .4byte gBattleMoveDamage
_0801C274: .4byte BattleScript_BerryConfuseHealEnd2
_0801C278:
	ldr r0, _0801C284 @ =BattleScript_ItemHealHP_RemoveItem
	bl BattleScriptExecute
_0801C27E:
	movs r0, 0x4
	str r0, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C284: .4byte BattleScript_ItemHealHP_RemoveItem
_0801C288:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	str r1, [sp, 0x24]
	adds r5, r1, 0
	add r5, r8
	ldrh r0, [r5, 0x2C]
	ldrh r1, [r5, 0x28]
	lsrs r0, 1
	cmp r1, r0
	bls _0801C2A0
	b _0801C952
_0801C2A0:
	cmp r6, 0
	beq _0801C2A6
	b _0801C952
_0801C2A6:
	ldr r1, _0801C300 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x8
	strb r0, [r1, 0x1]
	movs r0, 0x3
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r4, _0801C304 @ =gBattleMoveDamage
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _0801C2CC
	movs r0, 0x1
	str r0, [r4]
_0801C2CC:
	ldrh r2, [r5, 0x28]
	ldr r0, [r4]
	adds r0, r2, r0
	ldrh r1, [r5, 0x2C]
	cmp r0, r1
	ble _0801C2DC
	subs r0, r1, r2
	str r0, [r4]
_0801C2DC:
	ldr r0, [r4]
	negs r0, r0
	str r0, [r4]
	mov r0, r8
	adds r0, 0x48
	ldr r2, [sp, 0x24]
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x3
	bl GetFlavorRelationByPersonality
	lsls r0, 24
	cmp r0, 0
	bge _0801C30C
_0801C2F8:
	ldr r0, _0801C308 @ =BattleScript_BerryConfuseHealEnd2
	bl BattleScriptExecute
	b _0801C312
	.align 2, 0
_0801C300: .4byte gBattleTextBuff1
_0801C304: .4byte gBattleMoveDamage
_0801C308: .4byte BattleScript_BerryConfuseHealEnd2
_0801C30C:
	ldr r0, _0801C318 @ =BattleScript_ItemHealHP_RemoveItem
	bl BattleScriptExecute
_0801C312:
	movs r3, 0x4
	str r3, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C318: .4byte BattleScript_ItemHealHP_RemoveItem
_0801C31C:
	movs r0, 0x58
	adds r5, r7, 0
	muls r5, r0
	str r5, [sp, 0x28]
	add r5, r8
	ldrh r0, [r5, 0x2C]
	ldrh r1, [r5, 0x28]
	lsrs r0, 1
	cmp r1, r0
	bls _0801C332
	b _0801C952
_0801C332:
	cmp r6, 0
	beq _0801C338
	b _0801C952
_0801C338:
	ldr r1, _0801C394 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x8
	strb r0, [r1, 0x1]
	movs r0, 0x4
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r4, _0801C398 @ =gBattleMoveDamage
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _0801C35E
	movs r0, 0x1
	str r0, [r4]
_0801C35E:
	ldrh r2, [r5, 0x28]
	ldr r0, [r4]
	adds r0, r2, r0
	ldrh r1, [r5, 0x2C]
	cmp r0, r1
	ble _0801C36E
	subs r0, r1, r2
	str r0, [r4]
_0801C36E:
	ldr r0, [r4]
	negs r0, r0
	str r0, [r4]
	mov r0, r8
	adds r0, 0x48
	ldr r1, [sp, 0x28]
	adds r0, r1, r0
	ldr r0, [r0]
	movs r1, 0x4
	bl GetFlavorRelationByPersonality
	lsls r0, 24
	cmp r0, 0
	bge _0801C3A0
_0801C38A:
	ldr r0, _0801C39C @ =BattleScript_BerryConfuseHealEnd2
	bl BattleScriptExecute
	b _0801C3A6
	.align 2, 0
_0801C394: .4byte gBattleTextBuff1
_0801C398: .4byte gBattleMoveDamage
_0801C39C: .4byte BattleScript_BerryConfuseHealEnd2
_0801C3A0:
	ldr r0, _0801C3AC @ =BattleScript_ItemHealHP_RemoveItem
	bl BattleScriptExecute
_0801C3A6:
	movs r2, 0x4
	str r2, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C3AC: .4byte BattleScript_ItemHealHP_RemoveItem
_0801C3B0:
	movs r0, 0x58
	muls r0, r7
	mov r3, r8
	adds r5, r0, r3
	ldrh r4, [r5, 0x28]
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	cmp r4, r0
	ble _0801C3C8
	b _0801C952
_0801C3C8:
	cmp r6, 0
	beq _0801C3CE
	b _0801C952
_0801C3CE:
	movs r0, 0x19
	ldrsb r0, [r5, r0]
	cmp r0, 0xB
	ble _0801C3D8
	b _0801C952
_0801C3D8:
	ldr r1, _0801C408 @ =gBattleTextBuff1
	movs r2, 0xFD
	strb r2, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	movs r0, 0x1
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r1, _0801C40C @ =gBattleTextBuff2
	strb r2, [r1]
	strb r6, [r1, 0x1]
	movs r0, 0xD2
	strb r0, [r1, 0x2]
	strb r6, [r1, 0x3]
	subs r0, 0xD3
	strb r0, [r1, 0x4]
	ldr r0, _0801C410 @ =gEffectBattler
	strb r7, [r0]
	ldr r1, _0801C414 @ =gBattleScripting
	movs r0, 0x11
	strb r0, [r1, 0x1A]
	movs r0, 0xF
	b _0801C56C
	.align 2, 0
_0801C408: .4byte gBattleTextBuff1
_0801C40C: .4byte gBattleTextBuff2
_0801C410: .4byte gEffectBattler
_0801C414: .4byte gBattleScripting
_0801C418:
	movs r0, 0x58
	muls r0, r7
	mov r1, r8
	adds r5, r0, r1
	ldrh r4, [r5, 0x28]
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	cmp r4, r0
	ble _0801C430
	b _0801C952
_0801C430:
	cmp r6, 0
	beq _0801C436
	b _0801C952
_0801C436:
	movs r0, 0x1A
	ldrsb r0, [r5, r0]
	cmp r0, 0xB
	ble _0801C440
	b _0801C952
_0801C440:
	ldr r1, _0801C460 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	movs r0, 0x2
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r0, _0801C464 @ =gEffectBattler
	strb r7, [r0]
	ldr r1, _0801C468 @ =gBattleScripting
	movs r0, 0x12
	strb r0, [r1, 0x1A]
	movs r0, 0x10
	b _0801C506
	.align 2, 0
_0801C460: .4byte gBattleTextBuff1
_0801C464: .4byte gEffectBattler
_0801C468: .4byte gBattleScripting
_0801C46C:
	movs r0, 0x58
	muls r0, r7
	mov r3, r8
	adds r5, r0, r3
	ldrh r4, [r5, 0x28]
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	cmp r4, r0
	ble _0801C484
	b _0801C952
_0801C484:
	cmp r6, 0
	beq _0801C48A
	b _0801C952
_0801C48A:
	movs r0, 0x1B
	ldrsb r0, [r5, r0]
	cmp r0, 0xB
	ble _0801C494
	b _0801C952
_0801C494:
	ldr r1, _0801C4B4 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	movs r0, 0x3
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r0, _0801C4B8 @ =gEffectBattler
	strb r7, [r0]
	ldr r1, _0801C4BC @ =gBattleScripting
	movs r0, 0x13
	strb r0, [r1, 0x1A]
	movs r0, 0x11
	b _0801C56C
	.align 2, 0
_0801C4B4: .4byte gBattleTextBuff1
_0801C4B8: .4byte gEffectBattler
_0801C4BC: .4byte gBattleScripting
_0801C4C0:
	movs r0, 0x58
	muls r0, r7
	mov r1, r8
	adds r5, r0, r1
	ldrh r4, [r5, 0x28]
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	cmp r4, r0
	ble _0801C4D8
	b _0801C952
_0801C4D8:
	cmp r6, 0
	beq _0801C4DE
	b _0801C952
_0801C4DE:
	movs r0, 0x1C
	ldrsb r0, [r5, r0]
	cmp r0, 0xB
	ble _0801C4E8
	b _0801C952
_0801C4E8:
	ldr r1, _0801C518 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	movs r0, 0x4
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r0, _0801C51C @ =gEffectBattler
	strb r7, [r0]
	ldr r1, _0801C520 @ =gBattleScripting
	movs r0, 0x14
	strb r0, [r1, 0x1A]
	movs r0, 0x12
_0801C506:
	strb r0, [r1, 0x10]
	strb r6, [r1, 0x11]
	ldr r0, _0801C524 @ =BattleScript_BerryStatRaiseEnd2
	bl BattleScriptExecute
	movs r2, 0x5
	str r2, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C518: .4byte gBattleTextBuff1
_0801C51C: .4byte gEffectBattler
_0801C520: .4byte gBattleScripting
_0801C524: .4byte BattleScript_BerryStatRaiseEnd2
_0801C528:
	movs r0, 0x58
	muls r0, r7
	mov r3, r8
	adds r5, r0, r3
	ldrh r4, [r5, 0x28]
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	cmp r4, r0
	ble _0801C540
	b _0801C952
_0801C540:
	cmp r6, 0
	beq _0801C546
	b _0801C952
_0801C546:
	movs r0, 0x1D
	ldrsb r0, [r5, r0]
	cmp r0, 0xB
	ble _0801C550
	b _0801C952
_0801C550:
	ldr r1, _0801C57C @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r0, _0801C580 @ =gEffectBattler
	strb r7, [r0]
	ldr r1, _0801C584 @ =gBattleScripting
	movs r0, 0x15
	strb r0, [r1, 0x1A]
	movs r0, 0x13
_0801C56C:
	strb r0, [r1, 0x10]
	strb r6, [r1, 0x11]
	ldr r0, _0801C588 @ =BattleScript_BerryStatRaiseEnd2
	bl BattleScriptExecute
	movs r5, 0x5
	str r5, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C57C: .4byte gBattleTextBuff1
_0801C580: .4byte gEffectBattler
_0801C584: .4byte gBattleScripting
_0801C588: .4byte BattleScript_BerryStatRaiseEnd2
_0801C58C:
	movs r0, 0x58
	adds r5, r7, 0
	muls r5, r0
	mov r1, r8
	adds r0, r5, r1
	ldrh r4, [r0, 0x28]
	ldrh r0, [r0, 0x2C]
	mov r1, r9
	bl __divsi3
	cmp r4, r0
	ble _0801C5A6
	b _0801C952
_0801C5A6:
	cmp r6, 0
	beq _0801C5AC
	b _0801C952
_0801C5AC:
	mov r0, r8
	adds r0, 0x50
	adds r1, r5, r0
	ldr r2, [r1]
	movs r3, 0x80
	lsls r3, 13
	adds r0, r2, 0
	ands r0, r3
	cmp r0, 0
	beq _0801C5C2
	b _0801C952
_0801C5C2:
	orrs r2, r3
	str r2, [r1]
	ldr r0, _0801C5D4 @ =BattleScript_BerryFocusEnergyEnd2
	bl BattleScriptExecute
	movs r2, 0x2
	str r2, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C5D4: .4byte BattleScript_BerryFocusEnergyEnd2
_0801C5D8:
	cmp r6, 0
	beq _0801C5DE
	b _0801C952
_0801C5DE:
	movs r0, 0x58
	adds r5, r7, 0
	muls r5, r0
	mov r3, r8
	adds r0, r5, r3
	ldrh r4, [r0, 0x28]
	ldrh r0, [r0, 0x2C]
	mov r1, r9
	bl __divsi3
	cmp r4, r0
	ble _0801C5F8
	b _0801C952
_0801C5F8:
	movs r0, 0
	mov r10, r0
	adds r0, r5, 0x1
	mov r1, r8
	adds r1, 0x18
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xB
	ble _0801C628
	mov r0, r8
	adds r0, 0x19
	adds r1, r5, r0
_0801C614:
	adds r1, 0x1
	movs r2, 0x1
	add r10, r2
	mov r3, r10
	cmp r3, 0x4
	bgt _0801C628
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0xB
	bgt _0801C614
_0801C628:
	mov r5, r10
	cmp r5, 0x5
	bne _0801C630
	b _0801C952
_0801C630:
	movs r0, 0x58
	muls r0, r7
	adds r4, r0, 0x1
	ldr r5, _0801C6A8 @ =gUnknown_2023BFC
_0801C638:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	adds r0, r4
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xC
	beq _0801C638
	ldr r1, _0801C6AC @ =gBattleTextBuff1
	movs r2, 0
	movs r3, 0xFD
	strb r3, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	mov r0, r10
	adds r0, 0x1
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r0, _0801C6B0 @ =gBattleTextBuff2
	strb r3, [r0]
	strb r2, [r0, 0x1]
	movs r1, 0xD1
	strb r1, [r0, 0x2]
	strb r2, [r0, 0x3]
	strb r2, [r0, 0x4]
	movs r1, 0xD2
	strb r1, [r0, 0x5]
	strb r2, [r0, 0x6]
	subs r1, 0xD3
	strb r1, [r0, 0x7]
	ldr r0, _0801C6B4 @ =gEffectBattler
	strb r7, [r0]
	ldr r1, _0801C6B8 @ =gBattleScripting
	mov r0, r10
	adds r0, 0x21
	strb r0, [r1, 0x1A]
	adds r0, 0x6
	strb r0, [r1, 0x10]
	strb r2, [r1, 0x11]
	ldr r0, _0801C6BC @ =BattleScript_BerryStatRaiseEnd2
	bl BattleScriptExecute
	movs r0, 0x5
	str r0, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C6A8: .4byte gUnknown_2023BFC
_0801C6AC: .4byte gBattleTextBuff1
_0801C6B0: .4byte gBattleTextBuff2
_0801C6B4: .4byte gEffectBattler
_0801C6B8: .4byte gBattleScripting
_0801C6BC: .4byte BattleScript_BerryStatRaiseEnd2
_0801C6C0:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x4C
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	bne _0801C6D8
	b _0801C952
_0801C6D8:
	movs r0, 0x41
	negs r0, r0
	ands r2, r0
	str r2, [r1]
	ldr r0, _0801C6EC @ =BattleScript_BerryCurePrlzEnd2
	bl BattleScriptExecute
	movs r1, 0x1
	str r1, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C6EC: .4byte BattleScript_BerryCurePrlzEnd2
_0801C6F0:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x4C
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x88
	ands r0, r2
	cmp r0, 0
	bne _0801C708
	b _0801C952
_0801C708:
	ldr r0, _0801C71C @ =0xfffff077
	ands r2, r0
	str r2, [r1]
	ldr r0, _0801C720 @ =BattleScript_BerryCurePsnEnd2
	bl BattleScriptExecute
	movs r2, 0x1
	str r2, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C71C: .4byte 0xfffff077
_0801C720: .4byte BattleScript_BerryCurePsnEnd2
_0801C724:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x4C
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	bne _0801C73C
	b _0801C952
_0801C73C:
	movs r0, 0x11
	negs r0, r0
	ands r2, r0
	str r2, [r1]
	ldr r0, _0801C750 @ =BattleScript_BerryCureBrnEnd2
	bl BattleScriptExecute
	movs r3, 0x1
	str r3, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C750: .4byte BattleScript_BerryCureBrnEnd2
_0801C754:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x4C
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	bne _0801C76C
	b _0801C952
_0801C76C:
	movs r0, 0x21
	negs r0, r0
	ands r2, r0
	str r2, [r1]
	ldr r0, _0801C780 @ =BattleScript_BerryCureFrzEnd2
	bl BattleScriptExecute
	movs r5, 0x1
	str r5, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C780: .4byte BattleScript_BerryCureFrzEnd2
_0801C784:
	movs r0, 0x58
	adds r3, r7, 0
	muls r3, r0
	mov r0, r8
	adds r0, 0x4C
	adds r2, r3, r0
	ldr r1, [r2]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801C79C
	b _0801C952
_0801C79C:
	movs r0, 0x8
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	mov r1, r8
	adds r1, 0x50
	adds r1, r3, r1
	ldr r0, [r1]
	ldr r2, _0801C7B8 @ =0xf7ffffff
	ands r0, r2
	str r0, [r1]
	ldr r0, _0801C7BC @ =BattleScript_BerryCureSlpEnd2
	b _0801C906
	.align 2, 0
_0801C7B8: .4byte 0xf7ffffff
_0801C7BC: .4byte BattleScript_BerryCureSlpEnd2
_0801C7C0:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x50
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x7
	ands r0, r2
	cmp r0, 0
	bne _0801C7D8
	b _0801C952
_0801C7D8:
	movs r0, 0x8
	negs r0, r0
	ands r2, r0
	str r2, [r1]
	ldr r0, _0801C7EC @ =BattleScript_BerryCureConfusionEnd2
	bl BattleScriptExecute
	movs r1, 0x2
	str r1, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C7EC: .4byte BattleScript_BerryCureConfusionEnd2
_0801C7F0:
	movs r0, 0x58
	adds r5, r7, 0
	muls r5, r0
	mov r0, r8
	adds r0, 0x4C
	adds r4, r5, r0
	ldr r2, [r4]
	ldrb r0, [r4]
	cmp r0, 0
	bne _0801C816
	mov r0, r8
	adds r0, 0x50
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801C816
	b _0801C952
_0801C816:
	movs r3, 0
	mov r10, r3
	movs r0, 0x88
	ands r2, r0
	cmp r2, 0
	beq _0801C82E
	ldr r0, _0801C8BC @ =gBattleTextBuff1
	ldr r1, _0801C8C0 @ =gStatusConditionString_PoisonJpn
	bl StringCopy
	movs r0, 0x1
	mov r10, r0
_0801C82E:
	ldr r0, [r4]
	movs r1, 0x7
	mov r9, r1
	ands r0, r1
	mov r6, r8
	adds r6, 0x50
	cmp r0, 0
	beq _0801C854
	adds r2, r5, r6
	ldr r0, [r2]
	ldr r1, _0801C8C4 @ =0xf7ffffff
	ands r0, r1
	str r0, [r2]
	ldr r0, _0801C8BC @ =gBattleTextBuff1
	ldr r1, _0801C8C8 @ =gStatusConditionString_SleepJpn
	bl StringCopy
	movs r2, 0x1
	add r10, r2
_0801C854:
	ldr r0, [r4]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0801C86A
	ldr r0, _0801C8BC @ =gBattleTextBuff1
	ldr r1, _0801C8CC @ =gStatusConditionString_ParalysisJpn
	bl StringCopy
	movs r3, 0x1
	add r10, r3
_0801C86A:
	ldr r0, [r4]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0801C880
	ldr r0, _0801C8BC @ =gBattleTextBuff1
	ldr r1, _0801C8D0 @ =gStatusConditionString_BurnJpn
	bl StringCopy
	movs r0, 0x1
	add r10, r0
_0801C880:
	ldr r0, [r4]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0801C896
	ldr r0, _0801C8BC @ =gBattleTextBuff1
	ldr r1, _0801C8D4 @ =gStatusConditionString_IceJpn
	bl StringCopy
	movs r1, 0x1
	add r10, r1
_0801C896:
	adds r0, r5, r6
	ldr r0, [r0]
	mov r2, r9
	ands r0, r2
	cmp r0, 0
	beq _0801C8AE
	ldr r0, _0801C8BC @ =gBattleTextBuff1
	ldr r1, _0801C8D8 @ =gStatusConditionString_ConfusionJpn
	bl StringCopy
	movs r3, 0x1
	add r10, r3
_0801C8AE:
	mov r5, r10
	cmp r5, 0x1
	bgt _0801C8E0
	ldr r1, _0801C8DC @ =gBattleCommunication
	movs r0, 0
	b _0801C8E4
	.align 2, 0
_0801C8BC: .4byte gBattleTextBuff1
_0801C8C0: .4byte gStatusConditionString_PoisonJpn
_0801C8C4: .4byte 0xf7ffffff
_0801C8C8: .4byte gStatusConditionString_SleepJpn
_0801C8CC: .4byte gStatusConditionString_ParalysisJpn
_0801C8D0: .4byte gStatusConditionString_BurnJpn
_0801C8D4: .4byte gStatusConditionString_IceJpn
_0801C8D8: .4byte gStatusConditionString_ConfusionJpn
_0801C8DC: .4byte gBattleCommunication
_0801C8E0:
	ldr r1, _0801C910 @ =gBattleCommunication
	movs r0, 0x1
_0801C8E4:
	strb r0, [r1, 0x5]
	ldr r2, _0801C914 @ =gBattleMons
	movs r0, 0x58
	adds r3, r7, 0
	muls r3, r0
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r3, r0
	movs r1, 0
	str r1, [r0]
	adds r2, 0x50
	adds r3, r2
	ldr r0, [r3]
	subs r1, 0x8
	ands r0, r1
	str r0, [r3]
	ldr r0, _0801C918 @ =BattleScript_BerryCureChosenStatusEnd2
_0801C906:
	bl BattleScriptExecute
	movs r0, 0x1
	str r0, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C910: .4byte gBattleCommunication
_0801C914: .4byte gBattleMons
_0801C918: .4byte BattleScript_BerryCureChosenStatusEnd2
_0801C91C:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x50
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r2
	cmp r0, 0
	beq _0801C952
	ldr r0, _0801C978 @ =0xfff0ffff
	ands r2, r0
	str r2, [r1]
	ldr r0, _0801C97C @ =gBattleTextBuff1
	ldr r1, _0801C980 @ =gStatusConditionString_LoveJpn
	bl StringCopy
	ldr r0, _0801C984 @ =BattleScript_BerryCureChosenStatusEnd2
	bl BattleScriptExecute
	ldr r1, _0801C988 @ =gBattleCommunication
	movs r0, 0
	strb r0, [r1, 0x5]
	movs r1, 0x2
	str r1, [sp, 0xC]
_0801C952:
	ldr r2, [sp, 0xC]
	cmp r2, 0
	bne _0801C95A
	b _0801CFA6
_0801C95A:
	ldr r0, _0801C98C @ =gBattleScripting
	strb r7, [r0, 0x17]
	ldr r0, _0801C990 @ =gPotentialItemEffectBattler
	strb r7, [r0]
	ldr r4, _0801C994 @ =gActiveBattler
	ldr r0, _0801C998 @ =gBattlerAttacker
	strb r7, [r0]
	strb r7, [r4]
	ldr r3, [sp, 0xC]
	cmp r3, 0x1
	beq _0801C99C
	cmp r3, 0x3
	beq _0801C9A2
	b _0801CFA6
	.align 2, 0
_0801C978: .4byte 0xfff0ffff
_0801C97C: .4byte gBattleTextBuff1
_0801C980: .4byte gStatusConditionString_LoveJpn
_0801C984: .4byte BattleScript_BerryCureChosenStatusEnd2
_0801C988: .4byte gBattleCommunication
_0801C98C: .4byte gBattleScripting
_0801C990: .4byte gPotentialItemEffectBattler
_0801C994: .4byte gActiveBattler
_0801C998: .4byte gBattlerAttacker
_0801C99C:
	movs r0, 0x58
	muls r0, r7
	b _0801CE08
_0801C9A2:
	ldr r4, _0801C9F0 @ =gBattleMons
	movs r0, 0x58
	adds r3, r7, 0
	muls r3, r0
	adds r0, r4, 0
	adds r0, 0x50
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	beq _0801C9BE
	b _0801CFA6
_0801C9BE:
	ldr r1, _0801C9F4 @ =gDisableStructs
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _0801C9F8 @ =gBitTable
	mov r5, r10
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0801C9DE
	b _0801CFA6
_0801C9DE:
	adds r1, r5, r3
	adds r0, r4, 0
	adds r0, 0x24
	adds r1, r0
	add r0, sp, 0x4
	ldrb r0, [r0]
	strb r0, [r1]
	b _0801CFA6
	.align 2, 0
_0801C9F0: .4byte gBattleMons
_0801C9F4: .4byte gDisableStructs
_0801C9F8: .4byte gBitTable
_0801C9FC:
	movs r7, 0
	ldr r0, _0801CA2C @ =gBattlersCount
	ldrb r0, [r0]
	cmp r7, r0
	bcc _0801CA08
	b _0801CFA6
_0801CA08:
	ldr r4, _0801CA30 @ =gLastUsedItem
	ldr r1, _0801CA34 @ =gBattleMons
	movs r0, 0x58
	muls r0, r7
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	strh r0, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _0801CA3C
	ldr r1, _0801CA38 @ =gEnigmaBerries
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrb r5, [r0, 0x7]
	b _0801CA4C
	.align 2, 0
_0801CA2C: .4byte gBattlersCount
_0801CA30: .4byte gLastUsedItem
_0801CA34: .4byte gBattleMons
_0801CA38: .4byte gEnigmaBerries
_0801CA3C:
	ldrh r0, [r4]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r4]
	bl ItemId_GetHoldEffectParam
_0801CA4C:
	subs r0, r5, 0x2
	cmp r0, 0x1A
	bls _0801CA54
	b _0801CDF0
_0801CA54:
	lsls r0, 2
	ldr r1, _0801CA60 @ =_0801CA64
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801CA60: .4byte _0801CA64
	.align 2, 0
_0801CA64:
	.4byte _0801CAD0
	.4byte _0801CBC0
	.4byte _0801CB0C
	.4byte _0801CB48
	.4byte _0801CB84
	.4byte _0801CDF0
	.4byte _0801CC08
	.4byte _0801CC9C
	.4byte _0801CDF0
	.4byte _0801CDF0
	.4byte _0801CDF0
	.4byte _0801CDF0
	.4byte _0801CDF0
	.4byte _0801CDF0
	.4byte _0801CDF0
	.4byte _0801CDF0
	.4byte _0801CDF0
	.4byte _0801CDF0
	.4byte _0801CDF0
	.4byte _0801CDF0
	.4byte _0801CDF0
	.4byte _0801CD90
	.4byte _0801CDF0
	.4byte _0801CDF0
	.4byte _0801CDF0
	.4byte _0801CDF0
	.4byte _0801CC44
_0801CAD0:
	ldr r1, _0801CB00 @ =gBattleMons
	movs r0, 0x58
	muls r0, r7
	adds r1, 0x4C
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0801CAE6
	b _0801CDF0
_0801CAE6:
	movs r0, 0x41
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	bl BattleScriptPushCursor
	ldr r1, _0801CB04 @ =gBattlescriptCurrInstr
	ldr r0, _0801CB08 @ =BattleScript_BerryCureParRet
	str r0, [r1]
	movs r0, 0x1
	str r0, [sp, 0xC]
	b _0801CDF6
	.align 2, 0
_0801CB00: .4byte gBattleMons
_0801CB04: .4byte gBattlescriptCurrInstr
_0801CB08: .4byte BattleScript_BerryCureParRet
_0801CB0C:
	ldr r1, _0801CB38 @ =gBattleMons
	movs r0, 0x58
	muls r0, r7
	adds r1, 0x4C
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	bne _0801CB22
	b _0801CDF0
_0801CB22:
	ldr r0, _0801CB3C @ =0xfffff077
	ands r1, r0
	str r1, [r2]
	bl BattleScriptPushCursor
	ldr r1, _0801CB40 @ =gBattlescriptCurrInstr
	ldr r0, _0801CB44 @ =BattleScript_BerryCurePsnRet
	str r0, [r1]
	movs r1, 0x1
	str r1, [sp, 0xC]
	b _0801CDF6
	.align 2, 0
_0801CB38: .4byte gBattleMons
_0801CB3C: .4byte 0xfffff077
_0801CB40: .4byte gBattlescriptCurrInstr
_0801CB44: .4byte BattleScript_BerryCurePsnRet
_0801CB48:
	ldr r1, _0801CB78 @ =gBattleMons
	movs r0, 0x58
	muls r0, r7
	adds r1, 0x4C
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0801CB5E
	b _0801CDF0
_0801CB5E:
	movs r0, 0x11
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	bl BattleScriptPushCursor
	ldr r1, _0801CB7C @ =gBattlescriptCurrInstr
	ldr r0, _0801CB80 @ =BattleScript_BerryCureBrnRet
	str r0, [r1]
	movs r2, 0x1
	str r2, [sp, 0xC]
	b _0801CDF6
	.align 2, 0
_0801CB78: .4byte gBattleMons
_0801CB7C: .4byte gBattlescriptCurrInstr
_0801CB80: .4byte BattleScript_BerryCureBrnRet
_0801CB84:
	ldr r1, _0801CBB4 @ =gBattleMons
	movs r0, 0x58
	muls r0, r7
	adds r1, 0x4C
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0801CB9A
	b _0801CDF0
_0801CB9A:
	movs r0, 0x21
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	bl BattleScriptPushCursor
	ldr r1, _0801CBB8 @ =gBattlescriptCurrInstr
	ldr r0, _0801CBBC @ =BattleScript_BerryCureFrzRet
	str r0, [r1]
	movs r3, 0x1
	str r3, [sp, 0xC]
	b _0801CDF6
	.align 2, 0
_0801CBB4: .4byte gBattleMons
_0801CBB8: .4byte gBattlescriptCurrInstr
_0801CBBC: .4byte BattleScript_BerryCureFrzRet
_0801CBC0:
	ldr r2, _0801CBF8 @ =gBattleMons
	movs r0, 0x58
	adds r4, r7, 0
	muls r4, r0
	adds r0, r2, 0
	adds r0, 0x4C
	adds r3, r4, r0
	ldr r1, [r3]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801CBDA
	b _0801CDF0
_0801CBDA:
	movs r0, 0x8
	negs r0, r0
	ands r1, r0
	str r1, [r3]
	adds r2, 0x50
	adds r2, r4, r2
	ldr r0, [r2]
	ldr r1, _0801CBFC @ =0xf7ffffff
	ands r0, r1
	str r0, [r2]
	bl BattleScriptPushCursor
	ldr r1, _0801CC00 @ =gBattlescriptCurrInstr
	ldr r0, _0801CC04 @ =BattleScript_BerryCureSlpRet
	b _0801CD58
	.align 2, 0
_0801CBF8: .4byte gBattleMons
_0801CBFC: .4byte 0xf7ffffff
_0801CC00: .4byte gBattlescriptCurrInstr
_0801CC04: .4byte BattleScript_BerryCureSlpRet
_0801CC08:
	ldr r1, _0801CC38 @ =gBattleMons
	movs r0, 0x58
	muls r0, r7
	adds r1, 0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801CC1E
	b _0801CDF0
_0801CC1E:
	movs r0, 0x8
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	bl BattleScriptPushCursor
	ldr r1, _0801CC3C @ =gBattlescriptCurrInstr
	ldr r0, _0801CC40 @ =BattleScript_BerryCureConfusionRet
	str r0, [r1]
	movs r0, 0x2
	str r0, [sp, 0xC]
	b _0801CDF6
	.align 2, 0
_0801CC38: .4byte gBattleMons
_0801CC3C: .4byte gBattlescriptCurrInstr
_0801CC40: .4byte BattleScript_BerryCureConfusionRet
_0801CC44:
	ldr r1, _0801CC80 @ =gBattleMons
	movs r0, 0x58
	muls r0, r7
	adds r1, 0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r1
	cmp r0, 0
	bne _0801CC5C
	b _0801CDF0
_0801CC5C:
	ldr r0, _0801CC84 @ =0xfff0ffff
	ands r1, r0
	str r1, [r2]
	ldr r0, _0801CC88 @ =gBattleTextBuff1
	ldr r1, _0801CC8C @ =gStatusConditionString_LoveJpn
	bl StringCopy
	bl BattleScriptPushCursor
	ldr r1, _0801CC90 @ =gBattleCommunication
	movs r0, 0
	strb r0, [r1, 0x5]
	ldr r1, _0801CC94 @ =gBattlescriptCurrInstr
	ldr r0, _0801CC98 @ =BattleScript_BerryCureChosenStatusRet
	str r0, [r1]
	movs r1, 0x2
	str r1, [sp, 0xC]
	b _0801CDF6
	.align 2, 0
_0801CC80: .4byte gBattleMons
_0801CC84: .4byte 0xfff0ffff
_0801CC88: .4byte gBattleTextBuff1
_0801CC8C: .4byte gStatusConditionString_LoveJpn
_0801CC90: .4byte gBattleCommunication
_0801CC94: .4byte gBattlescriptCurrInstr
_0801CC98: .4byte BattleScript_BerryCureChosenStatusRet
_0801CC9C:
	ldr r4, _0801CD60 @ =gBattleMons
	movs r0, 0x58
	adds r5, r7, 0
	muls r5, r0
	adds r0, r4, 0
	adds r0, 0x4C
	adds r6, r5, r0
	ldr r2, [r6]
	ldrb r0, [r6]
	cmp r0, 0
	bne _0801CCC4
	adds r0, r4, 0
	adds r0, 0x50
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801CCC4
	b _0801CDF0
_0801CCC4:
	movs r0, 0x88
	ands r2, r0
	cmp r2, 0
	beq _0801CCD4
	ldr r0, _0801CD64 @ =gBattleTextBuff1
	ldr r1, _0801CD68 @ =gStatusConditionString_PoisonJpn
	bl StringCopy
_0801CCD4:
	ldr r0, [r6]
	movs r2, 0x7
	mov r8, r2
	ands r0, r2
	adds r4, 0x50
	cmp r0, 0
	beq _0801CCF4
	adds r2, r5, r4
	ldr r0, [r2]
	ldr r1, _0801CD6C @ =0xf7ffffff
	ands r0, r1
	str r0, [r2]
	ldr r0, _0801CD64 @ =gBattleTextBuff1
	ldr r1, _0801CD70 @ =gStatusConditionString_SleepJpn
	bl StringCopy
_0801CCF4:
	ldr r0, [r6]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0801CD06
	ldr r0, _0801CD64 @ =gBattleTextBuff1
	ldr r1, _0801CD74 @ =gStatusConditionString_ParalysisJpn
	bl StringCopy
_0801CD06:
	ldr r0, [r6]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0801CD18
	ldr r0, _0801CD64 @ =gBattleTextBuff1
	ldr r1, _0801CD78 @ =gStatusConditionString_BurnJpn
	bl StringCopy
_0801CD18:
	ldr r0, [r6]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0801CD2A
	ldr r0, _0801CD64 @ =gBattleTextBuff1
	ldr r1, _0801CD7C @ =gStatusConditionString_IceJpn
	bl StringCopy
_0801CD2A:
	adds r5, r4
	ldr r0, [r5]
	mov r3, r8
	ands r0, r3
	cmp r0, 0
	beq _0801CD3E
	ldr r0, _0801CD64 @ =gBattleTextBuff1
	ldr r1, _0801CD80 @ =gStatusConditionString_ConfusionJpn
	bl StringCopy
_0801CD3E:
	movs r4, 0
	str r4, [r6]
	ldr r0, [r5]
	movs r1, 0x8
	negs r1, r1
	ands r0, r1
	str r0, [r5]
	bl BattleScriptPushCursor
	ldr r0, _0801CD84 @ =gBattleCommunication
	strb r4, [r0, 0x5]
	ldr r1, _0801CD88 @ =gBattlescriptCurrInstr
	ldr r0, _0801CD8C @ =BattleScript_BerryCureChosenStatusRet
_0801CD58:
	str r0, [r1]
	movs r5, 0x1
	str r5, [sp, 0xC]
	b _0801CDF6
	.align 2, 0
_0801CD60: .4byte gBattleMons
_0801CD64: .4byte gBattleTextBuff1
_0801CD68: .4byte gStatusConditionString_PoisonJpn
_0801CD6C: .4byte 0xf7ffffff
_0801CD70: .4byte gStatusConditionString_SleepJpn
_0801CD74: .4byte gStatusConditionString_ParalysisJpn
_0801CD78: .4byte gStatusConditionString_BurnJpn
_0801CD7C: .4byte gStatusConditionString_IceJpn
_0801CD80: .4byte gStatusConditionString_ConfusionJpn
_0801CD84: .4byte gBattleCommunication
_0801CD88: .4byte gBattlescriptCurrInstr
_0801CD8C: .4byte BattleScript_BerryCureChosenStatusRet
_0801CD90:
	ldr r0, _0801CDDC @ =gBattleMons
	mov r8, r0
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x18
	adds r1, r0
	movs r2, 0x6
	movs r3, 0x7
	mov r10, r3
_0801CDA6:
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0x5
	bgt _0801CDB4
	strb r2, [r1]
	movs r5, 0x5
	str r5, [sp, 0xC]
_0801CDB4:
	adds r1, 0x1
	movs r0, 0x1
	negs r0, r0
	add r10, r0
	mov r3, r10
	cmp r3, 0
	bge _0801CDA6
	ldr r5, [sp, 0xC]
	cmp r5, 0
	beq _0801CE34
	ldr r0, _0801CDE0 @ =gBattleScripting
	strb r7, [r0, 0x17]
	ldr r0, _0801CDE4 @ =gPotentialItemEffectBattler
	strb r7, [r0]
	bl BattleScriptPushCursor
	ldr r1, _0801CDE8 @ =gBattlescriptCurrInstr
	ldr r0, _0801CDEC @ =BattleScript_WhiteHerbRet
	str r0, [r1]
	b _0801CFA6
	.align 2, 0
_0801CDDC: .4byte gBattleMons
_0801CDE0: .4byte gBattleScripting
_0801CDE4: .4byte gPotentialItemEffectBattler
_0801CDE8: .4byte gBattlescriptCurrInstr
_0801CDEC: .4byte BattleScript_WhiteHerbRet
_0801CDF0:
	ldr r0, [sp, 0xC]
	cmp r0, 0
	beq _0801CE34
_0801CDF6:
	ldr r0, _0801CE24 @ =gBattleScripting
	strb r7, [r0, 0x17]
	ldr r0, _0801CE28 @ =gPotentialItemEffectBattler
	strb r7, [r0]
	ldr r4, _0801CE2C @ =gActiveBattler
	strb r7, [r4]
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
_0801CE08:
	ldr r1, _0801CE30 @ =gUnknown_2023C30
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl BtlController_EmitSetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	b _0801CFA6
	.align 2, 0
_0801CE24: .4byte gBattleScripting
_0801CE28: .4byte gPotentialItemEffectBattler
_0801CE2C: .4byte gActiveBattler
_0801CE30: .4byte gUnknown_2023C30
_0801CE34:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0801CE48 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r7, r0
	bcs _0801CE44
	b _0801CA08
_0801CE44:
	b _0801CFA6
	.align 2, 0
_0801CE48: .4byte gBattlersCount
_0801CE4C:
	ldr r7, _0801CE64 @ =gBattleMoveDamage
	ldr r0, [r7]
	cmp r0, 0
	bne _0801CE56
	b _0801CFA6
_0801CE56:
	mov r1, r8
	cmp r1, 0x1E
	beq _0801CE68
	cmp r1, 0x3E
	beq _0801CF10
	b _0801CFA6
	.align 2, 0
_0801CE64: .4byte gBattleMoveDamage
_0801CE68:
	ldr r0, _0801CEF4 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0801CE76
	b _0801CFA6
_0801CE76:
	ldr r2, _0801CEF8 @ =gSpecialStatuses
	ldr r4, _0801CEFC @ =gBattlerTarget
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801CE9C
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801CE9C
	b _0801CFA6
_0801CE9C:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r9
	bcs _0801CFA6
	ldr r2, _0801CF00 @ =gBattleMoves
	ldr r0, _0801CF04 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x8]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0801CFA6
	ldr r2, _0801CF08 @ =gBattleMons
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0801CFA6
	ldr r1, _0801CF0C @ =gBattleCommunication
	movs r0, 0x8
	strb r0, [r1, 0x3]
	bl BattleScriptPushCursor
	movs r0, 0
	movs r1, 0
	bl SetMoveEffect
	bl BattleScriptPop
	b _0801CFA6
	.align 2, 0
_0801CEF4: .4byte gMoveResultFlags
_0801CEF8: .4byte gSpecialStatuses
_0801CEFC: .4byte gBattlerTarget
_0801CF00: .4byte gBattleMoves
_0801CF04: .4byte gCurrentMove
_0801CF08: .4byte gBattleMons
_0801CF0C: .4byte gBattleCommunication
_0801CF10:
	ldr r0, _0801CFB8 @ =gMoveResultFlags
	ldrb r0, [r0]
	movs r5, 0x29
	ands r5, r0
	cmp r5, 0
	bne _0801CFA6
	ldr r1, _0801CFBC @ =gSpecialStatuses
	ldr r4, _0801CFC0 @ =gBattlerTarget
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 2
	adds r6, r1, 0x4
	adds r0, r6
	ldr r1, [r0]
	cmp r1, 0
	beq _0801CFA6
	ldr r0, _0801CFC4 @ =0x0000ffff
	cmp r1, r0
	beq _0801CFA6
	ldr r0, _0801CFC8 @ =gBattlerAttacker
	ldrb r3, [r0]
	cmp r3, r2
	beq _0801CFA6
	ldr r2, _0801CFCC @ =gBattleMons
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r1, [r0, 0x28]
	ldrh r0, [r0, 0x2C]
	cmp r1, r0
	beq _0801CFA6
	cmp r1, 0
	beq _0801CFA6
	ldr r0, _0801CFD0 @ =gLastUsedItem
	mov r2, sp
	ldrh r2, [r2, 0x14]
	strh r2, [r0]
	ldr r0, _0801CFD4 @ =gPotentialItemEffectBattler
	strb r3, [r0]
	ldr r0, _0801CFD8 @ =gBattleScripting
	strb r3, [r0, 0x17]
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ldr r1, [sp, 0x10]
	bl __divsi3
	negs r0, r0
	str r0, [r7]
	ldrb r1, [r4]
	cmp r0, 0
	bne _0801CF88
	movs r0, 0x1
	negs r0, r0
	str r0, [r7]
_0801CF88:
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	str r5, [r0]
	bl BattleScriptPushCursor
	ldr r1, _0801CFDC @ =gBattlescriptCurrInstr
	ldr r0, _0801CFE0 @ =BattleScript_ItemHealHP_Ret
	str r0, [r1]
	ldr r0, [sp, 0xC]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
_0801CFA6:
	ldr r0, [sp, 0xC]
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801CFB8: .4byte gMoveResultFlags
_0801CFBC: .4byte gSpecialStatuses
_0801CFC0: .4byte gBattlerTarget
_0801CFC4: .4byte 0x0000ffff
_0801CFC8: .4byte gBattlerAttacker
_0801CFCC: .4byte gBattleMons
_0801CFD0: .4byte gLastUsedItem
_0801CFD4: .4byte gPotentialItemEffectBattler
_0801CFD8: .4byte gBattleScripting
_0801CFDC: .4byte gBattlescriptCurrInstr
_0801CFE0: .4byte BattleScript_ItemHealHP_Ret
	thumb_func_end ItemBattleEffects

	thumb_func_start ClearFuryCutterDestinyBondGrudge
ClearFuryCutterDestinyBondGrudge: @ 801CFE4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0801D01C @ =gDisableStructs
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	movs r2, 0
	strb r2, [r1, 0x10]
	ldr r1, _0801D020 @ =gBattleMons
	movs r2, 0x58
	adds r3, r0, 0
	muls r3, r2
	adds r1, 0x50
	adds r3, r1
	ldr r1, [r3]
	ldr r2, _0801D024 @ =0xfdffffff
	ands r1, r2
	str r1, [r3]
	ldr r1, _0801D028 @ =gStatuses3
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r2, _0801D02C @ =0xffffbfff
	ands r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_0801D01C: .4byte gDisableStructs
_0801D020: .4byte gBattleMons
_0801D024: .4byte 0xfdffffff
_0801D028: .4byte gStatuses3
_0801D02C: .4byte 0xffffbfff
	thumb_func_end ClearFuryCutterDestinyBondGrudge

	thumb_func_start HandleAction_RunBattleScript
HandleAction_RunBattleScript: @ 801D030
	push {lr}
	ldr r0, _0801D050 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	bne _0801D04C
	ldr r1, _0801D054 @ =gUnknown_825011C
	ldr r0, _0801D058 @ =gBattlescriptCurrInstr
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_0801D04C:
	pop {r0}
	bx r0
	.align 2, 0
_0801D050: .4byte gBattleControllerExecFlags
_0801D054: .4byte gUnknown_825011C
_0801D058: .4byte gBattlescriptCurrInstr
	thumb_func_end HandleAction_RunBattleScript

	thumb_func_start GetMoveTarget
GetMoveTarget: @ 801D05C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r1, 24
	lsrs r0, r1, 24
	movs r5, 0
	cmp r0, 0
	beq _0801D07A
	subs r0, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	b _0801D086
_0801D07A:
	ldr r1, _0801D098 @ =gBattleMoves
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	adds r0, r1
	ldrb r6, [r0, 0x6]
_0801D086:
	cmp r6, 0x40
	bls _0801D08C
	b _0801D39C
_0801D08C:
	lsls r0, r6, 2
	ldr r1, _0801D09C @ =_0801D0A0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801D098: .4byte gBattleMoves
_0801D09C: .4byte _0801D0A0
	.align 2, 0
_0801D0A0:
	.4byte _0801D1A4
	.4byte _0801D2A4
	.4byte _0801D398
	.4byte _0801D39C
	.4byte _0801D2BC
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D2A4
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D398
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D2A4
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D39C
	.4byte _0801D2A4
_0801D1A4:
	ldr r0, _0801D284 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0801D288 @ =gSideTimers
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r2, r0, r1
	ldrb r0, [r2, 0x8]
	cmp r0, 0
	beq _0801D1D6
	ldr r1, _0801D28C @ =gBattleMons
	ldrb r4, [r2, 0x9]
	movs r0, 0x58
	muls r0, r4
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0801D1D6
	b _0801D2EC
_0801D1D6:
	ldr r0, _0801D284 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r7, 1
	mov r8, r0
_0801D1E6:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0801D290 @ =gBattlersCount
	ldrb r1, [r1]
	bl __modsi3
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _0801D284 @ =gBattlerAttacker
	ldrb r3, [r6]
	cmp r5, r3
	beq _0801D1E6
	adds r0, r5, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	beq _0801D1E6
	ldr r0, _0801D294 @ =gAbsentBattlerFlags
	ldrb r2, [r0]
	ldr r1, _0801D298 @ =gBitTable
	lsls r0, r5, 2
	adds r0, r1
	ldr r0, [r0]
	ands r2, r0
	cmp r2, 0
	bne _0801D1E6
	ldr r0, _0801D29C @ =gBattleMoves
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x2]
	cmp r0, 0xD
	beq _0801D234
	b _0801D39C
_0801D234:
	ldrb r1, [r6]
	str r2, [sp]
	movs r0, 0x10
	movs r2, 0x1F
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	bne _0801D24A
	b _0801D39C
_0801D24A:
	ldr r2, _0801D28C @ =gBattleMons
	movs r1, 0x58
	adds r0, r5, 0
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1F
	bne _0801D25E
	b _0801D39C
_0801D25E:
	movs r4, 0x2
	eors r5, r4
	adds r0, r5, 0
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r1, [r0]
	adds r0, r5, 0
	bl RecordAbilityBattle
	ldr r1, _0801D2A0 @ =gSpecialStatuses
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	orrs r1, r4
	strb r1, [r0]
	b _0801D39C
	.align 2, 0
_0801D284: .4byte gBattlerAttacker
_0801D288: .4byte gSideTimers
_0801D28C: .4byte gBattleMons
_0801D290: .4byte gBattlersCount
_0801D294: .4byte gAbsentBattlerFlags
_0801D298: .4byte gBitTable
_0801D29C: .4byte gBattleMoves
_0801D2A0: .4byte gSpecialStatuses
_0801D2A4:
	ldr r0, _0801D2B8 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerPosition
	adds r1, r0, 0
	movs r2, 0x1
	movs r0, 0x1
	ands r0, r1
	eors r0, r2
	b _0801D34E
	.align 2, 0
_0801D2B8: .4byte gBattlerAttacker
_0801D2BC:
	ldr r0, _0801D2F0 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0801D2F4 @ =gSideTimers
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r2, r0, r1
	ldrb r0, [r2, 0x8]
	cmp r0, 0
	beq _0801D2FC
	ldr r1, _0801D2F8 @ =gBattleMons
	ldrb r4, [r2, 0x9]
	movs r0, 0x58
	muls r0, r4
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0801D2FC
_0801D2EC:
	adds r5, r4, 0
	b _0801D39C
	.align 2, 0
_0801D2F0: .4byte gBattlerAttacker
_0801D2F4: .4byte gSideTimers
_0801D2F8: .4byte gBattleMons
_0801D2FC:
	ldr r0, _0801D330 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r4, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0801D378
	movs r0, 0x4
	ands r6, r0
	cmp r6, 0
	beq _0801D378
	ldr r0, _0801D334 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _0801D33C
	bl Random
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _0801D338
	movs r0, 0x1
	b _0801D34E
	.align 2, 0
_0801D330: .4byte gBattleTypeFlags
_0801D334: .4byte gBattlerAttacker
_0801D338:
	movs r0, 0x3
	b _0801D34E
_0801D33C:
	bl Random
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _0801D34C
	movs r0, 0
	b _0801D34E
_0801D34C:
	movs r0, 0x2
_0801D34E:
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0801D370 @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldr r2, _0801D374 @ =gBitTable
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0801D39C
	movs r0, 0x2
	eors r5, r0
	b _0801D39C
	.align 2, 0
_0801D370: .4byte gAbsentBattlerFlags
_0801D374: .4byte gBitTable
_0801D378:
	ldr r0, _0801D394 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerPosition
	adds r1, r0, 0
	movs r2, 0x1
	movs r0, 0x1
	ands r0, r1
	eors r0, r2
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r5, r0, 24
	b _0801D39C
	.align 2, 0
_0801D394: .4byte gBattlerAttacker
_0801D398:
	ldr r0, _0801D3B8 @ =gBattlerAttacker
	ldrb r5, [r0]
_0801D39C:
	ldr r0, _0801D3B8 @ =gBattlerAttacker
	ldrb r0, [r0]
	ldr r1, _0801D3BC @ =gBattleStruct
	ldr r1, [r1]
	adds r0, r1
	strb r5, [r0, 0xC]
	adds r0, r5, 0
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801D3B8: .4byte gBattlerAttacker
_0801D3BC: .4byte gBattleStruct
	thumb_func_end GetMoveTarget

	thumb_func_start HasObedientBitSet
HasObedientBitSet: @ 801D3C0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0801D406
	ldr r0, _0801D40C @ =gBattlerPartyIndexes
	lsls r4, 1
	adds r5, r4, r0
	ldrh r0, [r5]
	movs r7, 0x64
	muls r0, r7
	ldr r6, _0801D410 @ =gPlayerParty
	adds r0, r6
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	movs r1, 0xCD
	lsls r1, 1
	cmp r0, r1
	beq _0801D414
	ldrh r0, [r5]
	muls r0, r7
	adds r0, r6
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0x97
	beq _0801D414
_0801D406:
	movs r0, 0x1
	b _0801D42A
	.align 2, 0
_0801D40C: .4byte gBattlerPartyIndexes
_0801D410: .4byte gPlayerParty
_0801D414:
	ldr r0, _0801D430 @ =gBattlerPartyIndexes
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0801D434 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x50
	movs r2, 0
	bl GetMonData
_0801D42A:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801D430: .4byte gBattlerPartyIndexes
_0801D434: .4byte gPlayerParty
	thumb_func_end HasObedientBitSet

	thumb_func_start IsMonDisobedient
IsMonDisobedient: @ 801D438
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	movs r6, 0
	ldr r0, _0801D4F8 @ =gBattleTypeFlags
	ldr r0, [r0]
	ldr r1, _0801D4FC @ =0x00010002
	ands r0, r1
	cmp r0, 0
	bne _0801D4F4
	ldr r4, _0801D500 @ =gBattlerAttacker
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0801D4F4
	ldrb r0, [r4]
	bl HasObedientBitSet
	cmp r0, 0
	beq _0801D4BE
	ldr r2, _0801D504 @ =gBattleMons
	ldrb r1, [r4]
	movs r0, 0x58
	muls r1, r0
	adds r0, r2, 0
	adds r0, 0x54
	adds r0, r1, r0
	ldr r0, [r0]
	adds r2, 0x3C
	adds r1, r2
	bl IsOtherTrainer
	lsls r0, 24
	cmp r0, 0
	beq _0801D4F4
	ldr r0, _0801D508 @ =0x00000827
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _0801D4F4
	movs r6, 0xA
	ldr r0, _0801D50C @ =0x00000821
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0801D4A2
	movs r6, 0x1E
_0801D4A2:
	ldr r0, _0801D510 @ =0x00000823
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0801D4B0
	movs r6, 0x32
_0801D4B0:
	ldr r0, _0801D514 @ =0x00000825
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0801D4BE
	movs r6, 0x46
_0801D4BE:
	ldr r5, _0801D504 @ =gBattleMons
	ldr r0, _0801D500 @ =gBattlerAttacker
	mov r8, r0
	ldrb r0, [r0]
	movs r7, 0x58
	muls r0, r7
	adds r0, r5
	adds r0, 0x2A
	ldrb r0, [r0]
	cmp r0, r6
	bls _0801D4F4
	bl Random
	movs r1, 0xFF
	ands r1, r0
	mov r2, r8
	ldrb r0, [r2]
	adds r2, r0, 0
	muls r2, r7
	adds r0, r2, r5
	adds r0, 0x2A
	ldrb r0, [r0]
	adds r0, r6
	muls r0, r1
	asrs r4, r0, 8
	cmp r4, r6
	bge _0801D518
_0801D4F4:
	movs r0, 0
	b _0801D738
	.align 2, 0
_0801D4F8: .4byte gBattleTypeFlags
_0801D4FC: .4byte 0x00010002
_0801D500: .4byte gBattlerAttacker
_0801D504: .4byte gBattleMons
_0801D508: .4byte 0x00000827
_0801D50C: .4byte 0x00000821
_0801D510: .4byte 0x00000823
_0801D514: .4byte 0x00000825
_0801D518:
	ldr r3, _0801D554 @ =gCurrentMove
	ldrh r0, [r3]
	cmp r0, 0x63
	bne _0801D52E
	adds r0, r5, 0
	adds r0, 0x50
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r2, _0801D558 @ =0xff7fffff
	ands r1, r2
	str r1, [r0]
_0801D52E:
	mov r1, r8
	ldrb r0, [r1]
	muls r0, r7
	adds r1, r5, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _0801D564
	ldrh r0, [r3]
	cmp r0, 0xAD
	beq _0801D54E
	cmp r0, 0xD6
	bne _0801D564
_0801D54E:
	ldr r1, _0801D55C @ =gBattlescriptCurrInstr
	ldr r0, _0801D560 @ =BattleScript_IgnoresWhileAsleep
	b _0801D6E2
	.align 2, 0
_0801D554: .4byte gCurrentMove
_0801D558: .4byte 0xff7fffff
_0801D55C: .4byte gBattlescriptCurrInstr
_0801D560: .4byte BattleScript_IgnoresWhileAsleep
_0801D564:
	bl Random
	movs r1, 0xFF
	ands r1, r0
	ldr r2, _0801D608 @ =gBattleMons
	ldr r0, _0801D60C @ =gBattlerAttacker
	ldrb r3, [r0]
	movs r0, 0x58
	muls r0, r3
	adds r0, r2
	adds r0, 0x2A
	ldrb r0, [r0]
	adds r0, r6
	muls r0, r1
	asrs r4, r0, 8
	cmp r4, r6
	bge _0801D634
	ldr r0, _0801D610 @ =gCurrentMove
	ldrh r1, [r0]
	movs r0, 0x84
	lsls r0, 1
	cmp r1, r0
	beq _0801D634
	ldr r6, _0801D614 @ =gBitTable
	ldr r5, _0801D618 @ =gUnknown_2023D48
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0]
	adds r0, r3, 0
	movs r2, 0xFF
	bl CheckMoveLimitations
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bne _0801D5B0
	b _0801D6D2
_0801D5B0:
	ldr r2, _0801D61C @ =gUnknown_2023D49
	mov r8, r2
	movs r7, 0x3
_0801D5B6:
	bl Random
	ands r0, r7
	mov r1, r8
	strb r0, [r1]
	strb r0, [r5]
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ands r0, r4
	cmp r0, 0
	bne _0801D5B6
	ldr r4, _0801D620 @ =gUnknown_2023D4E
	ldr r3, _0801D608 @ =gBattleMons
	ldr r0, _0801D618 @ =gUnknown_2023D48
	ldrb r0, [r0]
	lsls r0, 1
	ldr r1, _0801D60C @ =gBattlerAttacker
	ldrb r2, [r1]
	movs r1, 0x58
	muls r1, r2
	adds r0, r1
	adds r3, 0xC
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r4]
	ldr r1, _0801D624 @ =gBattlescriptCurrInstr
	ldr r0, _0801D628 @ =BattleScript_IgnoresAndUsesRandomMove
	str r0, [r1]
	ldrh r0, [r4]
	movs r1, 0
	bl GetMoveTarget
	ldr r1, _0801D62C @ =gBattlerTarget
	strb r0, [r1]
	ldr r2, _0801D630 @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 14
	b _0801D732
	.align 2, 0
_0801D608: .4byte gBattleMons
_0801D60C: .4byte gBattlerAttacker
_0801D610: .4byte gCurrentMove
_0801D614: .4byte gBitTable
_0801D618: .4byte gUnknown_2023D48
_0801D61C: .4byte gUnknown_2023D49
_0801D620: .4byte gUnknown_2023D4E
_0801D624: .4byte gBattlescriptCurrInstr
_0801D628: .4byte BattleScript_IgnoresAndUsesRandomMove
_0801D62C: .4byte gBattlerTarget
_0801D630: .4byte gHitMarker
_0801D634:
	ldr r5, _0801D6B8 @ =gBattleMons
	ldr r2, _0801D6BC @ =gBattlerAttacker
	mov r8, r2
	ldrb r0, [r2]
	movs r7, 0x58
	muls r0, r7
	adds r0, r5
	adds r0, 0x2A
	ldrb r0, [r0]
	subs r0, r6
	lsls r0, 24
	lsrs r6, r0, 24
	bl Random
	movs r2, 0xFF
	adds r4, r2, 0
	ands r4, r0
	cmp r4, r6
	bge _0801D6CC
	mov r1, r8
	ldrb r0, [r1]
	adds r1, r0, 0
	muls r1, r7
	adds r0, r5, 0
	adds r0, 0x4C
	adds r0, r1, r0
	ldr r0, [r0]
	ands r0, r2
	cmp r0, 0
	bne _0801D6CC
	adds r0, r1, r5
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x48
	beq _0801D6CC
	cmp r0, 0xF
	beq _0801D6CC
	movs r2, 0
	ldr r0, _0801D6C0 @ =gBattlersCount
	ldrb r3, [r0]
	adds r7, r0, 0
	cmp r2, r3
	bge _0801D6AA
	ldr r0, [r5, 0x50]
	movs r1, 0x70
	ands r0, r1
	cmp r0, 0
	bne _0801D6AA
	adds r1, r5, 0
	adds r1, 0x50
	movs r5, 0x70
_0801D69A:
	adds r1, 0x58
	adds r2, 0x1
	cmp r2, r3
	bge _0801D6AA
	ldr r0, [r1]
	ands r0, r5
	cmp r0, 0
	beq _0801D69A
_0801D6AA:
	ldrb r7, [r7]
	cmp r2, r7
	bne _0801D6CC
	ldr r1, _0801D6C4 @ =gBattlescriptCurrInstr
	ldr r0, _0801D6C8 @ =BattleScript_IgnoresAndFallsAsleep
	b _0801D6E2
	.align 2, 0
_0801D6B8: .4byte gBattleMons
_0801D6BC: .4byte gBattlerAttacker
_0801D6C0: .4byte gBattlersCount
_0801D6C4: .4byte gBattlescriptCurrInstr
_0801D6C8: .4byte BattleScript_IgnoresAndFallsAsleep
_0801D6CC:
	subs r4, r6
	cmp r4, r6
	blt _0801D6F4
_0801D6D2:
	bl Random
	ldr r2, _0801D6E8 @ =gBattleCommunication
	movs r1, 0x3
	ands r1, r0
	strb r1, [r2, 0x5]
	ldr r1, _0801D6EC @ =gBattlescriptCurrInstr
	ldr r0, _0801D6F0 @ =BattleScript_MoveUsedLoafingAround
_0801D6E2:
	str r0, [r1]
	movs r0, 0x1
	b _0801D738
	.align 2, 0
_0801D6E8: .4byte gBattleCommunication
_0801D6EC: .4byte gBattlescriptCurrInstr
_0801D6F0: .4byte BattleScript_MoveUsedLoafingAround
_0801D6F4:
	ldr r4, _0801D744 @ =gBattlerAttacker
	ldrb r1, [r4]
	movs r0, 0x58
	muls r1, r0
	ldr r0, _0801D748 @ =gBattleMons
	adds r1, r0
	movs r0, 0x28
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldrb r0, [r4]
	str r0, [sp, 0x8]
	ldrb r0, [r4]
	str r0, [sp, 0xC]
	adds r0, r1, 0
	movs r2, 0x1
	movs r3, 0
	bl CalculateBaseDamage
	ldr r1, _0801D74C @ =gBattleMoveDamage
	str r0, [r1]
	ldr r1, _0801D750 @ =gBattlerTarget
	ldrb r0, [r4]
	strb r0, [r1]
	ldr r1, _0801D754 @ =gBattlescriptCurrInstr
	ldr r0, _0801D758 @ =BattleScript_IgnoresAndHitsItself
	str r0, [r1]
	ldr r2, _0801D75C @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
_0801D732:
	orrs r0, r1
	str r0, [r2]
	movs r0, 0x2
_0801D738:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801D744: .4byte gBattlerAttacker
_0801D748: .4byte gBattleMons
_0801D74C: .4byte gBattleMoveDamage
_0801D750: .4byte gBattlerTarget
_0801D754: .4byte gBattlescriptCurrInstr
_0801D758: .4byte BattleScript_IgnoresAndHitsItself
_0801D75C: .4byte gHitMarker
	thumb_func_end IsMonDisobedient

	.align 2, 0 @ Don't pad with nop.
