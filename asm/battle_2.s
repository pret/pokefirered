	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start HandleEndTurn_FinishBattle
HandleEndTurn_FinishBattle: @ 8015910
	push {r4-r7,lr}
	ldr r0, _08015974 @ =gCurrentActionFuncId
	ldrb r0, [r0]
	subs r0, 0xB
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08015A04
	ldr r0, _08015978 @ =gBattleTypeFlags
	ldr r1, [r0]
	ldr r0, _0801597C @ =0x00080b92
	ands r1, r0
	cmp r1, 0
	bne _080159BC
	ldr r2, _08015980 @ =gActiveBattler
	strb r1, [r2]
	ldr r0, _08015984 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r1, r0
	bcs _080159BC
	adds r4, r2, 0
	ldr r6, _08015988 @ =gBattleMons
	movs r5, 0x58
	adds r7, r6, 0
	adds r7, 0x30
_08015942:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080159AA
	ldr r2, _0801598C @ =gBattleResults
	ldrh r0, [r2, 0x6]
	cmp r0, 0
	bne _08015990
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r2, 0x6]
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r7
	adds r0, r2, 0
	adds r0, 0x8
	bl StringCopy
	b _080159AA
	.align 2, 0
_08015974: .4byte gCurrentActionFuncId
_08015978: .4byte gBattleTypeFlags
_0801597C: .4byte 0x00080b92
_08015980: .4byte gActiveBattler
_08015984: .4byte gBattlersCount
_08015988: .4byte gBattleMons
_0801598C: .4byte gBattleResults
_08015990:
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r2, 0x26]
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r7
	adds r0, r2, 0
	adds r0, 0x14
	bl StringCopy
_080159AA:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _080159EC @ =gBattlersCount
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08015942
_080159BC:
	bl sub_812BFDC
	ldr r0, _080159F0 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080159D0
	bl sub_810CB90
_080159D0:
	movs r0, 0x3
	bl BeginFastPaletteFade
	movs r0, 0x5
	bl FadeOutMapMusic
	ldr r1, _080159F4 @ =gBattleMainFunc
	ldr r0, _080159F8 @ =FreeResetData_ReturnToOvOrDoEvolutions
	str r0, [r1]
	ldr r1, _080159FC @ =gUnknown_300537C
	ldr r0, _08015A00 @ =BattleMainCB2
	str r0, [r1]
	b _08015A1E
	.align 2, 0
_080159EC: .4byte gBattlersCount
_080159F0: .4byte gBattleTypeFlags
_080159F4: .4byte gBattleMainFunc
_080159F8: .4byte FreeResetData_ReturnToOvOrDoEvolutions
_080159FC: .4byte gUnknown_300537C
_08015A00: .4byte BattleMainCB2
_08015A04:
	ldr r0, _08015A24 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	bne _08015A1E
	ldr r1, _08015A28 @ =gBattleScriptingCommandsTable
	ldr r0, _08015A2C @ =gBattlescriptCurrInstr
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_08015A1E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015A24: .4byte gBattleControllerExecFlags
_08015A28: .4byte gBattleScriptingCommandsTable
_08015A2C: .4byte gBattlescriptCurrInstr
	thumb_func_end HandleEndTurn_FinishBattle

	thumb_func_start FreeResetData_ReturnToOvOrDoEvolutions
FreeResetData_ReturnToOvOrDoEvolutions: @ 8015A30
	push {lr}
	ldr r0, _08015A58 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08015A8E
	bl ResetSpriteData
	ldr r0, _08015A5C @ =gLeveledUpInBattle
	ldrb r0, [r0]
	cmp r0, 0
	beq _08015A52
	ldr r0, _08015A60 @ =gBattleOutcome
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08015A6C
_08015A52:
	ldr r1, _08015A64 @ =gBattleMainFunc
	ldr r0, _08015A68 @ =ReturnFromBattleToOverworld
	b _08015A70
	.align 2, 0
_08015A58: .4byte gPaletteFade
_08015A5C: .4byte gLeveledUpInBattle
_08015A60: .4byte gBattleOutcome
_08015A64: .4byte gBattleMainFunc
_08015A68: .4byte ReturnFromBattleToOverworld
_08015A6C:
	ldr r1, _08015A94 @ =gBattleMainFunc
	ldr r0, _08015A98 @ =TryEvolvePokemon
_08015A70:
	str r0, [r1]
	bl FreeAllWindowBuffers
	ldr r0, _08015A9C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08015A8E
	bl FreeMonSpritesGfx
	bl FreeBattleSpritesData
	bl FreeBattleResources
_08015A8E:
	pop {r0}
	bx r0
	.align 2, 0
_08015A94: .4byte gBattleMainFunc
_08015A98: .4byte TryEvolvePokemon
_08015A9C: .4byte gBattleTypeFlags
	thumb_func_end FreeResetData_ReturnToOvOrDoEvolutions

	thumb_func_start TryEvolvePokemon
TryEvolvePokemon: @ 8015AA0
	push {r4,r5,lr}
	ldr r0, _08015AF4 @ =gLeveledUpInBattle
	ldrb r1, [r0]
	adds r3, r0, 0
	cmp r1, 0
	beq _08015B16
_08015AAC:
	movs r5, 0
_08015AAE:
	ldrb r2, [r3]
	ldr r0, _08015AF8 @ =gBitTable
	lsls r1, r5, 2
	adds r1, r0
	ldr r1, [r1]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _08015B08
	bics r2, r1
	strb r2, [r3]
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08015AFC @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08015B08
	ldr r0, _08015B00 @ =gBattleMainFunc
	ldr r1, _08015B04 @ =WaitForEvoSceneToFinish
	str r1, [r0]
	lsls r3, r5, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r2, 0
	movs r2, 0x81
	bl EvolutionScene
	b _08015B1C
	.align 2, 0
_08015AF4: .4byte gLeveledUpInBattle
_08015AF8: .4byte gBitTable
_08015AFC: .4byte gPlayerParty
_08015B00: .4byte gBattleMainFunc
_08015B04: .4byte WaitForEvoSceneToFinish
_08015B08:
	adds r5, 0x1
	ldr r3, _08015B24 @ =gLeveledUpInBattle
	cmp r5, 0x5
	ble _08015AAE
	ldrb r0, [r3]
	cmp r0, 0
	bne _08015AAC
_08015B16:
	ldr r1, _08015B28 @ =gBattleMainFunc
	ldr r0, _08015B2C @ =ReturnFromBattleToOverworld
	str r0, [r1]
_08015B1C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015B24: .4byte gLeveledUpInBattle
_08015B28: .4byte gBattleMainFunc
_08015B2C: .4byte ReturnFromBattleToOverworld
	thumb_func_end TryEvolvePokemon

	thumb_func_start WaitForEvoSceneToFinish
WaitForEvoSceneToFinish: @ 8015B30
	push {lr}
	ldr r0, _08015B48 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _08015B4C @ =BattleMainCB2
	cmp r1, r0
	bne _08015B42
	ldr r1, _08015B50 @ =gBattleMainFunc
	ldr r0, _08015B54 @ =TryEvolvePokemon
	str r0, [r1]
_08015B42:
	pop {r0}
	bx r0
	.align 2, 0
_08015B48: .4byte gMain
_08015B4C: .4byte BattleMainCB2
_08015B50: .4byte gBattleMainFunc
_08015B54: .4byte TryEvolvePokemon
	thumb_func_end WaitForEvoSceneToFinish

	thumb_func_start ReturnFromBattleToOverworld
ReturnFromBattleToOverworld: @ 8015B58
	push {r4-r6,lr}
	ldr r6, _08015BDC @ =gBattleTypeFlags
	ldr r0, [r6]
	movs r5, 0x2
	ands r0, r5
	cmp r0, 0
	bne _08015B74
	ldr r4, _08015BE0 @ =gPlayerParty
	adds r0, r4, 0
	bl sub_8043A68
	adds r0, r4, 0
	bl sub_8043B40
_08015B74:
	ldr r4, [r6]
	adds r0, r4, 0
	ands r0, r5
	cmp r0, 0
	beq _08015B86
	ldr r0, _08015BE4 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08015BD4
_08015B86:
	ldr r1, _08015BE8 @ =gSpecialVar_Result
	ldr r5, _08015BEC @ =gBattleOutcome
	ldrb r0, [r5]
	strh r0, [r1]
	ldr r3, _08015BF0 @ =gMain
	ldr r0, _08015BF4 @ =0x00000439
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08015BF8 @ =gPreBattleCallback1
	ldr r0, [r0]
	str r0, [r3]
	movs r0, 0x80
	lsls r0, 3
	ands r4, r0
	cmp r4, 0
	beq _08015BC6
	ldr r0, _08015BFC @ =gEnemyParty
	bl UpdateRoamerHPStatus
	ldrb r1, [r5]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08015BC2
	cmp r1, 0x7
	bne _08015BC6
_08015BC2:
	bl SetRoamerInactive
_08015BC6:
	movs r0, 0x53
	bl m4aSongNumStop
	ldr r0, _08015BF0 @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_08015BD4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015BDC: .4byte gBattleTypeFlags
_08015BE0: .4byte gPlayerParty
_08015BE4: .4byte gReceivedRemoteLinkPlayers
_08015BE8: .4byte gSpecialVar_Result
_08015BEC: .4byte gBattleOutcome
_08015BF0: .4byte gMain
_08015BF4: .4byte 0x00000439
_08015BF8: .4byte gPreBattleCallback1
_08015BFC: .4byte gEnemyParty
	thumb_func_end ReturnFromBattleToOverworld

	thumb_func_start RunBattleScriptCommands_PopCallbacksStack
RunBattleScriptCommands_PopCallbacksStack: @ 8015C00
	push {lr}
	ldr r0, _08015C3C @ =gCurrentActionFuncId
	ldrb r0, [r0]
	subs r0, 0xB
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08015C48
	ldr r3, _08015C40 @ =gBattleResources
	ldr r0, [r3]
	ldr r0, [r0, 0xC]
	adds r1, r0, 0
	adds r1, 0x20
	ldrb r0, [r1]
	cmp r0, 0
	beq _08015C24
	subs r0, 0x1
	strb r0, [r1]
_08015C24:
	ldr r2, _08015C44 @ =gBattleMainFunc
	ldr r0, [r3]
	ldr r1, [r0, 0xC]
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	lsls r0, 2
	adds r1, r0
	ldr r0, [r1]
	str r0, [r2]
	b _08015C62
	.align 2, 0
_08015C3C: .4byte gCurrentActionFuncId
_08015C40: .4byte gBattleResources
_08015C44: .4byte gBattleMainFunc
_08015C48:
	ldr r0, _08015C68 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	bne _08015C62
	ldr r1, _08015C6C @ =gBattleScriptingCommandsTable
	ldr r0, _08015C70 @ =gBattlescriptCurrInstr
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_08015C62:
	pop {r0}
	bx r0
	.align 2, 0
_08015C68: .4byte gBattleControllerExecFlags
_08015C6C: .4byte gBattleScriptingCommandsTable
_08015C70: .4byte gBattlescriptCurrInstr
	thumb_func_end RunBattleScriptCommands_PopCallbacksStack

	thumb_func_start RunBattleScriptCommands
RunBattleScriptCommands: @ 8015C74
	push {lr}
	ldr r0, _08015C94 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	bne _08015C90
	ldr r1, _08015C98 @ =gBattleScriptingCommandsTable
	ldr r0, _08015C9C @ =gBattlescriptCurrInstr
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_08015C90:
	pop {r0}
	bx r0
	.align 2, 0
_08015C94: .4byte gBattleControllerExecFlags
_08015C98: .4byte gBattleScriptingCommandsTable
_08015C9C: .4byte gBattlescriptCurrInstr
	thumb_func_end RunBattleScriptCommands

	thumb_func_start HandleAction_UseMove
HandleAction_UseMove: @ 8015CA0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0x4
	str r0, [sp]
	ldr r6, _08015CE0 @ =gBattlerAttacker
	ldr r1, _08015CE4 @ =gBattlerByTurnOrder
	ldr r0, _08015CE8 @ =gCurrentTurnActionNumber
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r6]
	ldr r1, _08015CEC @ =gBattleStruct
	ldr r3, [r1]
	adds r0, r3, 0
	adds r0, 0x91
	ldrb r2, [r0]
	ldr r1, _08015CF0 @ =gBitTable
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ands r2, r0
	cmp r2, 0
	beq _08015CF8
	ldr r1, _08015CF4 @ =gCurrentActionFuncId
	movs r0, 0xC
	b _0801634C
	.align 2, 0
_08015CE0: .4byte gBattlerAttacker
_08015CE4: .4byte gBattlerByTurnOrder
_08015CE8: .4byte gCurrentTurnActionNumber
_08015CEC: .4byte gBattleStruct
_08015CF0: .4byte gBitTable
_08015CF4: .4byte gCurrentActionFuncId
_08015CF8:
	ldr r1, _08015D6C @ =gCritMultiplier
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _08015D70 @ =gBattleScripting
	movs r0, 0x1
	strb r0, [r1, 0xE]
	adds r0, r3, 0
	adds r0, 0xB7
	strb r2, [r0]
	ldr r0, _08015D74 @ =gMoveResultFlags
	strb r2, [r0]
	ldr r0, _08015D78 @ =gMultiHitCounter
	strb r2, [r0]
	ldr r0, _08015D7C @ =gBattleCommunication
	strb r2, [r0, 0x6]
	ldr r2, _08015D80 @ =gCurrMovePos
	ldr r3, _08015D84 @ =gChosenMovePos
	mov r9, r3
	ldrb r0, [r6]
	ldr r4, _08015D88 @ =gBattleStruct
	ldr r1, [r4]
	adds r0, r1
	adds r0, 0x80
	ldrb r0, [r0]
	strb r0, [r3]
	strb r0, [r2]
	ldr r1, _08015D8C @ =gProtectStructs
	ldrb r4, [r6]
	lsls r0, r4, 4
	adds r3, r0, r1
	ldrb r1, [r3]
	lsls r0, r1, 29
	mov r8, r2
	cmp r0, 0
	bge _08015D9C
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldr r2, _08015D90 @ =gCurrentMove
	ldr r1, _08015D94 @ =gChosenMove
	movs r0, 0xA5
	strh r0, [r1]
	strh r0, [r2]
	ldr r2, _08015D98 @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 4
	orrs r0, r1
	str r0, [r2]
	movs r0, 0xA5
	movs r1, 0
	bl GetMoveTarget
	ldrb r1, [r6]
	ldr r3, _08015D88 @ =gBattleStruct
	ldr r2, [r3]
	b _08015EF6
	.align 2, 0
_08015D6C: .4byte gCritMultiplier
_08015D70: .4byte gBattleScripting
_08015D74: .4byte gMoveResultFlags
_08015D78: .4byte gMultiHitCounter
_08015D7C: .4byte gBattleCommunication
_08015D80: .4byte gCurrMovePos
_08015D84: .4byte gChosenMovePos
_08015D88: .4byte gBattleStruct
_08015D8C: .4byte gProtectStructs
_08015D90: .4byte gCurrentMove
_08015D94: .4byte gChosenMove
_08015D98: .4byte gHitMarker
_08015D9C:
	ldr r0, _08015DD4 @ =gBattleMons
	movs r1, 0x58
	adds r5, r4, 0
	muls r5, r1
	adds r1, r0, 0
	adds r1, 0x50
	adds r1, r5, r1
	ldr r2, [r1]
	movs r1, 0x80
	lsls r1, 5
	ands r1, r2
	mov r10, r0
	cmp r1, 0
	bne _08015DC2
	movs r7, 0x80
	lsls r7, 15
	ands r7, r2
	cmp r7, 0
	beq _08015DE4
_08015DC2:
	ldr r3, _08015DD8 @ =gCurrentMove
	ldr r2, _08015DDC @ =gChosenMove
	ldr r1, _08015DE0 @ =gLockedMoves
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	strh r0, [r3]
	b _08015F18
	.align 2, 0
_08015DD4: .4byte gBattleMons
_08015DD8: .4byte gCurrentMove
_08015DDC: .4byte gChosenMove
_08015DE0: .4byte gLockedMoves
_08015DE4:
	ldr r3, _08015E38 @ =gDisableStructs
	mov r12, r3
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	add r0, r12
	ldrh r4, [r0, 0x6]
	adds r2, r4, 0
	cmp r2, 0
	beq _08015EBC
	ldrb r3, [r0, 0xC]
	lsls r0, r3, 1
	adds r0, r5
	mov r5, r10
	adds r5, 0xC
	adds r0, r5
	ldrh r1, [r0]
	cmp r2, r1
	bne _08015E48
	ldr r2, _08015E3C @ =gCurrentMove
	ldr r0, _08015E40 @ =gChosenMove
	strh r4, [r0]
	strh r4, [r2]
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r12
	ldrb r0, [r0, 0xC]
	mov r4, r9
	strb r0, [r4]
	mov r1, r8
	strb r0, [r1]
	ldrh r0, [r2]
	movs r1, 0
	bl GetMoveTarget
	ldrb r1, [r6]
	ldr r3, _08015E44 @ =gBattleStruct
	ldr r2, [r3]
	b _08015EF6
	.align 2, 0
_08015E38: .4byte gDisableStructs
_08015E3C: .4byte gCurrentMove
_08015E40: .4byte gChosenMove
_08015E44: .4byte gBattleStruct
_08015E48:
	cmp r2, 0
	beq _08015EBC
	cmp r2, r1
	beq _08015EBC
	mov r4, r9
	strb r3, [r4]
	mov r0, r8
	strb r3, [r0]
	ldr r3, _08015EB0 @ =gCurrentMove
	ldr r2, _08015EB4 @ =gChosenMove
	ldrb r0, [r0]
	lsls r0, 1
	ldrb r1, [r6]
	movs r4, 0x58
	muls r1, r4
	adds r0, r1
	adds r0, r5
	ldrh r0, [r0]
	strh r0, [r2]
	strh r0, [r3]
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r12
	movs r2, 0
	strh r7, [r0, 0x6]
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r12
	strb r2, [r0, 0xC]
	ldrb r0, [r6]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	add r1, r12
	ldrb r2, [r1, 0xE]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0xE]
	ldrh r0, [r3]
	movs r1, 0
	bl GetMoveTarget
	ldrb r1, [r6]
	ldr r3, _08015EB8 @ =gBattleStruct
	ldr r2, [r3]
	b _08015EF6
	.align 2, 0
_08015EB0: .4byte gCurrentMove
_08015EB4: .4byte gChosenMove
_08015EB8: .4byte gBattleStruct
_08015EBC:
	mov r4, r8
	ldrb r0, [r4]
	lsls r0, 1
	ldr r4, _08015EFC @ =gBattlerAttacker
	ldrb r2, [r4]
	movs r1, 0x58
	muls r1, r2
	adds r0, r1
	mov r1, r10
	adds r1, 0xC
	adds r0, r1
	ldr r1, _08015F00 @ =gChosenMoveByBattler
	lsls r2, 1
	adds r2, r1
	ldrh r3, [r0]
	ldrh r2, [r2]
	cmp r3, r2
	beq _08015F10
	ldr r1, _08015F04 @ =gCurrentMove
	ldr r0, _08015F08 @ =gChosenMove
	strh r3, [r0]
	strh r3, [r1]
	ldrh r0, [r1]
	movs r1, 0
	bl GetMoveTarget
	ldrb r1, [r4]
	ldr r2, _08015F0C @ =gBattleStruct
	ldr r2, [r2]
_08015EF6:
	adds r1, r2
	strb r0, [r1, 0xC]
	b _08015F18
	.align 2, 0
_08015EFC: .4byte gBattlerAttacker
_08015F00: .4byte gChosenMoveByBattler
_08015F04: .4byte gCurrentMove
_08015F08: .4byte gChosenMove
_08015F0C: .4byte gBattleStruct
_08015F10:
	ldr r1, _08015F30 @ =gCurrentMove
	ldr r0, _08015F34 @ =gChosenMove
	strh r3, [r0]
	strh r3, [r1]
_08015F18:
	ldr r0, _08015F38 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08015F40
	ldr r0, _08015F3C @ =gBattleResults
	ldr r1, _08015F30 @ =gCurrentMove
	ldrh r1, [r1]
	strh r1, [r0, 0x22]
	b _08015F48
	.align 2, 0
_08015F30: .4byte gCurrentMove
_08015F34: .4byte gChosenMove
_08015F38: .4byte gBattlerAttacker
_08015F3C: .4byte gBattleResults
_08015F40:
	ldr r0, _08015FAC @ =gBattleResults
	ldr r1, _08015FB0 @ =gCurrentMove
	ldrh r1, [r1]
	strh r1, [r0, 0x24]
_08015F48:
	ldr r4, _08015FB4 @ =gBattlerAttacker
	ldrb r0, [r4]
	bl GetBattlerSide
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08015FB8 @ =gSideTimers
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r5, r0, r1
	ldrb r0, [r5, 0x8]
	adds r3, r4, 0
	cmp r0, 0
	beq _08015FC8
	ldr r2, _08015FBC @ =gBattleMoves
	ldr r0, _08015FB0 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x6]
	cmp r0, 0
	bne _08015FC8
	ldrb r0, [r3]
	bl GetBattlerSide
	adds r4, r0, 0
	ldrb r0, [r5, 0x9]
	bl GetBattlerSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _08015FC8
	ldr r1, _08015FC0 @ =gBattleMons
	ldrb r2, [r5, 0x9]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08015FC8
	ldr r0, _08015FC4 @ =gBattlerTarget
	strb r2, [r0]
	b _0801632C
	.align 2, 0
_08015FAC: .4byte gBattleResults
_08015FB0: .4byte gCurrentMove
_08015FB4: .4byte gBattlerAttacker
_08015FB8: .4byte gSideTimers
_08015FBC: .4byte gBattleMoves
_08015FC0: .4byte gBattleMons
_08015FC4: .4byte gBattlerTarget
_08015FC8:
	ldr r2, _080160E4 @ =gBattleTypeFlags
	ldr r1, [r2]
	movs r0, 0x1
	ands r1, r0
	ldr r3, _080160E8 @ =gBattlerAttacker
	adds r7, r2, 0
	cmp r1, 0
	bne _08015FDA
	b _080162A0
_08015FDA:
	ldr r1, _080160EC @ =gSideTimers
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r5, [r0, 0x8]
	cmp r5, 0
	beq _08015FEC
	b _080161F8
_08015FEC:
	ldr r2, _080160F0 @ =gBattleMoves
	ldr r0, _080160F4 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08016008
	ldrb r0, [r4, 0x6]
	cmp r0, 0x10
	bne _08016008
	b _080161F8
_08016008:
	ldr r3, _080160F8 @ =gBattleMons
	ldr r2, _080160E8 @ =gBattlerAttacker
	ldrb r6, [r2]
	ldr r0, _080160FC @ =gBattleStruct
	ldr r0, [r0]
	adds r0, r6, r0
	ldrb r1, [r0, 0xC]
	movs r0, 0x58
	muls r0, r1
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	adds r3, r2, 0
	cmp r0, 0x1F
	bne _08016028
	b _080161F8
_08016028:
	ldrb r0, [r4, 0x2]
	cmp r0, 0xD
	beq _08016030
	b _080161F8
_08016030:
	adds r0, r6, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08016100 @ =gActiveBattler
	strb r5, [r1]
	ldr r0, _08016104 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080160A8
	adds r4, r1, 0
_08016048:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	beq _08016096
	ldr r0, _080160E8 @ =gBattlerAttacker
	ldrb r1, [r0]
	ldr r0, _080160FC @ =gBattleStruct
	ldr r0, [r0]
	adds r1, r0
	ldrb r0, [r1, 0xC]
	ldrb r1, [r4]
	cmp r0, r1
	beq _08016096
	ldr r1, _080160F8 @ =gBattleMons
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1F
	bne _08016096
	adds r0, r2, 0
	bl GetBattlerTurnOrderNum
	lsls r0, 24
	lsrs r0, 24
	ldr r3, [sp]
	cmp r0, r3
	bcs _08016096
	ldrb r0, [r4]
	bl GetBattlerTurnOrderNum
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
_08016096:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08016104 @ =gBattlersCount
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08016048
_080160A8:
	ldr r4, [sp]
	cmp r4, 0x4
	beq _080160B0
	b _080161AA
_080160B0:
	ldr r2, _080160F0 @ =gBattleMoves
	ldr r0, _08016108 @ =gChosenMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x6]
	ands r4, r0
	cmp r4, 0
	beq _08016130
	ldr r0, _080160E8 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08016110
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _0801610C
	movs r0, 0x1
	b _08016122
	.align 2, 0
_080160E4: .4byte gBattleTypeFlags
_080160E8: .4byte gBattlerAttacker
_080160EC: .4byte gSideTimers
_080160F0: .4byte gBattleMoves
_080160F4: .4byte gCurrentMove
_080160F8: .4byte gBattleMons
_080160FC: .4byte gBattleStruct
_08016100: .4byte gActiveBattler
_08016104: .4byte gBattlersCount
_08016108: .4byte gChosenMove
_0801610C:
	movs r0, 0x3
	b _08016122
_08016110:
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08016120
	movs r0, 0
	b _08016122
_08016120:
	movs r0, 0x2
_08016122:
	bl GetBattlerAtPosition
	ldr r1, _0801612C @ =gBattlerTarget
	strb r0, [r1]
	b _08016140
	.align 2, 0
_0801612C: .4byte gBattlerTarget
_08016130:
	ldr r2, _08016178 @ =gBattlerTarget
	ldr r0, _0801617C @ =gBattlerAttacker
	ldrb r0, [r0]
	ldr r1, _08016180 @ =gBattleStruct
	ldr r1, [r1]
	adds r0, r1
	ldrb r0, [r0, 0xC]
	strb r0, [r2]
_08016140:
	ldr r7, _08016184 @ =gAbsentBattlerFlags
	ldrb r0, [r7]
	ldr r1, _08016188 @ =gBitTable
	mov r8, r1
	ldr r5, _08016178 @ =gBattlerTarget
	ldrb r1, [r5]
	lsls r1, 2
	add r1, r8
	ldr r1, [r1]
	ands r0, r1
	cmp r0, 0
	bne _0801615A
	b _0801632C
_0801615A:
	ldr r6, _0801617C @ =gBattlerAttacker
	ldrb r0, [r6]
	bl GetBattlerSide
	adds r4, r0, 0
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _0801618C
	ldrb r0, [r5]
	b _0801631A
	.align 2, 0
_08016178: .4byte gBattlerTarget
_0801617C: .4byte gBattlerAttacker
_08016180: .4byte gBattleStruct
_08016184: .4byte gAbsentBattlerFlags
_08016188: .4byte gBitTable
_0801618C:
	ldrb r0, [r6]
	bl GetBattlerPosition
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerAtPosition
	strb r0, [r5]
	ldrb r1, [r7]
	ldrb r2, [r5]
	lsls r0, r2, 2
	add r0, r8
	b _08016310
_080161AA:
	ldr r4, _080161E4 @ =gActiveBattler
	ldr r0, _080161E8 @ =gBattlerByTurnOrder
	ldr r3, [sp]
	adds r0, r3, r0
	ldrb r0, [r0]
	strb r0, [r4]
	ldrb r0, [r4]
	ldr r2, _080161EC @ =gBattleMons
	movs r1, 0x58
	muls r1, r0
	adds r1, r2
	adds r1, 0x20
	ldrb r1, [r1]
	bl RecordAbilityBattle
	ldr r2, _080161F0 @ =gSpecialStatuses
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
	ldr r1, _080161F4 @ =gBattlerTarget
	ldrb r0, [r4]
	strb r0, [r1]
	b _0801632C
	.align 2, 0
_080161E4: .4byte gActiveBattler
_080161E8: .4byte gBattlerByTurnOrder
_080161EC: .4byte gBattleMons
_080161F0: .4byte gSpecialStatuses
_080161F4: .4byte gBattlerTarget
_080161F8:
	ldr r0, [r7]
	movs r4, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080162A0
	ldr r2, _08016238 @ =gBattleMoves
	ldr r0, _0801623C @ =gChosenMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x6]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080162A0
	ldrb r0, [r3]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08016244
	bl Random
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _08016240
	movs r0, 0x1
	b _08016256
	.align 2, 0
_08016238: .4byte gBattleMoves
_0801623C: .4byte gChosenMove
_08016240:
	movs r0, 0x3
	b _08016256
_08016244:
	bl Random
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _08016254
	movs r0, 0
	b _08016256
_08016254:
	movs r0, 0x2
_08016256:
	bl GetBattlerAtPosition
	ldr r1, _08016290 @ =gBattlerTarget
	strb r0, [r1]
	ldr r0, _08016294 @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldr r2, _08016298 @ =gBitTable
	ldr r5, _08016290 @ =gBattlerTarget
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0801632C
	ldr r0, _0801629C @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	adds r4, r0, 0
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _0801632C
	ldrb r0, [r5]
	b _0801631A
	.align 2, 0
_08016290: .4byte gBattlerTarget
_08016294: .4byte gAbsentBattlerFlags
_08016298: .4byte gBitTable
_0801629C: .4byte gBattlerAttacker
_080162A0:
	ldr r5, _080162E4 @ =gBattlerTarget
	adds r2, r3, 0
	ldrb r0, [r2]
	ldr r1, _080162E8 @ =gBattleStruct
	ldr r1, [r1]
	adds r0, r1
	ldrb r0, [r0, 0xC]
	strb r0, [r5]
	ldr r6, _080162EC @ =gAbsentBattlerFlags
	ldrb r1, [r6]
	ldr r7, _080162F0 @ =gBitTable
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r7
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0801632C
	ldrb r0, [r2]
	str r3, [sp, 0x4]
	bl GetBattlerSide
	adds r4, r0, 0
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r4, 24
	lsls r0, 24
	ldr r3, [sp, 0x4]
	cmp r4, r0
	beq _080162F4
	ldrb r0, [r5]
	b _0801631A
	.align 2, 0
_080162E4: .4byte gBattlerTarget
_080162E8: .4byte gBattleStruct
_080162EC: .4byte gAbsentBattlerFlags
_080162F0: .4byte gBitTable
_080162F4:
	ldrb r0, [r3]
	bl GetBattlerPosition
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerAtPosition
	strb r0, [r5]
	ldrb r1, [r6]
	ldrb r2, [r5]
	lsls r0, r2, 2
	adds r0, r7
_08016310:
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0801632C
	adds r0, r2, 0
_0801631A:
	bl GetBattlerPosition
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerAtPosition
	strb r0, [r5]
_0801632C:
	ldr r4, _08016360 @ =gBattlescriptCurrInstr
	ldr r3, _08016364 @ =gBattleScriptsForMoveEffects
	ldr r2, _08016368 @ =gBattleMoves
	ldr r0, _0801636C @ =gCurrentMove
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
	ldr r1, _08016370 @ =gCurrentActionFuncId
	movs r0, 0xA
_0801634C:
	strb r0, [r1]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016360: .4byte gBattlescriptCurrInstr
_08016364: .4byte gBattleScriptsForMoveEffects
_08016368: .4byte gBattleMoves
_0801636C: .4byte gCurrentMove
_08016370: .4byte gCurrentActionFuncId
	thumb_func_end HandleAction_UseMove

	thumb_func_start HandleAction_Switch
HandleAction_Switch: @ 8016374
	push {r4,lr}
	ldr r3, _080163E0 @ =gBattlerAttacker
	ldr r1, _080163E4 @ =gBattlerByTurnOrder
	ldr r0, _080163E8 @ =gCurrentTurnActionNumber
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r3]
	ldr r0, _080163EC @ =gBattle_BG0_X
	movs r2, 0
	strh r2, [r0]
	ldr r0, _080163F0 @ =gBattle_BG0_Y
	strh r2, [r0]
	ldr r1, _080163F4 @ =gActionSelectionCursor
	ldrb r0, [r3]
	adds r0, r1
	strb r2, [r0]
	ldr r1, _080163F8 @ =gMoveSelectionCursor
	ldrb r0, [r3]
	adds r0, r1
	strb r2, [r0]
	ldr r2, _080163FC @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r2]
	movs r0, 0x7
	strb r0, [r2, 0x1]
	ldrb r4, [r3]
	strb r4, [r2, 0x2]
	ldrb r0, [r3]
	ldr r1, _08016400 @ =gBattleStruct
	ldr r1, [r1]
	adds r0, r1
	adds r0, 0x58
	ldrb r0, [r0]
	strb r0, [r2, 0x3]
	movs r0, 0xFF
	strb r0, [r2, 0x4]
	ldr r0, _08016404 @ =gBattleScripting
	strb r4, [r0, 0x17]
	ldr r1, _08016408 @ =gBattlescriptCurrInstr
	ldr r0, _0801640C @ =gUnknown_81D894D
	str r0, [r1]
	ldr r1, _08016410 @ =gCurrentActionFuncId
	movs r0, 0xA
	strb r0, [r1]
	ldr r1, _08016414 @ =gBattleResults
	ldrb r0, [r1, 0x2]
	cmp r0, 0xFE
	bhi _080163DA
	adds r0, 0x1
	strb r0, [r1, 0x2]
_080163DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080163E0: .4byte gBattlerAttacker
_080163E4: .4byte gBattlerByTurnOrder
_080163E8: .4byte gCurrentTurnActionNumber
_080163EC: .4byte gBattle_BG0_X
_080163F0: .4byte gBattle_BG0_Y
_080163F4: .4byte gActionSelectionCursor
_080163F8: .4byte gMoveSelectionCursor
_080163FC: .4byte gBattleTextBuff1
_08016400: .4byte gBattleStruct
_08016404: .4byte gBattleScripting
_08016408: .4byte gBattlescriptCurrInstr
_0801640C: .4byte gUnknown_81D894D
_08016410: .4byte gCurrentActionFuncId
_08016414: .4byte gBattleResults
	thumb_func_end HandleAction_Switch

	thumb_func_start HandleAction_UseItem
HandleAction_UseItem: @ 8016418
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, _08016474 @ =gBattlerAttacker
	ldr r2, _08016478 @ =gBattlerTarget
	ldr r1, _0801647C @ =gBattlerByTurnOrder
	ldr r0, _08016480 @ =gCurrentTurnActionNumber
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	strb r0, [r4]
	ldr r0, _08016484 @ =gBattle_BG0_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08016488 @ =gBattle_BG0_Y
	strh r1, [r0]
	ldrb r0, [r4]
	bl ClearFuryCutterDestinyBondGrudge
	ldr r5, _0801648C @ =gLastUsedItem
	ldr r2, _08016490 @ =gBattleBufferB
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r0, [r1]
	lsls r0, 8
	orrs r3, r0
	strh r3, [r5]
	adds r1, r3, 0
	cmp r1, 0xC
	bhi _0801649C
	ldr r2, _08016494 @ =gBattlescriptCurrInstr
	ldr r1, _08016498 @ =gBattlescriptsForBallThrow
	ldrh r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	b _080164FC
	.align 2, 0
_08016474: .4byte gBattlerAttacker
_08016478: .4byte gBattlerTarget
_0801647C: .4byte gBattlerByTurnOrder
_08016480: .4byte gCurrentTurnActionNumber
_08016484: .4byte gBattle_BG0_X
_08016488: .4byte gBattle_BG0_Y
_0801648C: .4byte gLastUsedItem
_08016490: .4byte gBattleBufferB
_08016494: .4byte gBattlescriptCurrInstr
_08016498: .4byte gBattlescriptsForBallThrow
_0801649C:
	adds r0, r3, 0
	subs r0, 0x50
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080164C4
	ldr r0, _080164B8 @ =gBattlescriptCurrInstr
	ldr r1, _080164BC @ =gUnknown_81D99FC
	ldr r1, [r1]
	str r1, [r0]
	ldr r1, _080164C0 @ =gCurrentActionFuncId
	mov r10, r1
	b _0801671E
	.align 2, 0
_080164B8: .4byte gBattlescriptCurrInstr
_080164BC: .4byte gUnknown_81D99FC
_080164C0: .4byte gCurrentActionFuncId
_080164C4:
	movs r0, 0xAF
	lsls r0, 1
	cmp r1, r0
	bne _080164E8
	ldr r0, _080164DC @ =gBattlescriptCurrInstr
	ldr r1, _080164E0 @ =gUnknown_81D99FC
	ldr r1, [r1, 0x4]
	str r1, [r0]
	ldr r2, _080164E4 @ =gCurrentActionFuncId
	mov r10, r2
	b _0801671E
	.align 2, 0
_080164DC: .4byte gBattlescriptCurrInstr
_080164E0: .4byte gUnknown_81D99FC
_080164E4: .4byte gCurrentActionFuncId
_080164E8:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08016510
	ldr r0, _08016504 @ =gBattlescriptCurrInstr
	ldr r1, _08016508 @ =gUnknown_81D99E4
	ldr r1, [r1]
	str r1, [r0]
_080164FC:
	ldr r0, _0801650C @ =gCurrentActionFuncId
	mov r10, r0
	b _0801671E
	.align 2, 0
_08016504: .4byte gBattlescriptCurrInstr
_08016508: .4byte gUnknown_81D99E4
_0801650C: .4byte gCurrentActionFuncId
_08016510:
	ldr r3, _08016548 @ =gBattleScripting
	ldrb r0, [r4]
	strb r0, [r3, 0x17]
	lsls r0, 24
	lsrs r0, 25
	ldr r2, _0801654C @ =gBattleStruct
	ldr r1, [r2]
	adds r0, r1
	adds r0, 0xC4
	ldrb r0, [r0]
	subs r0, 0x1
	mov r8, r4
	ldr r1, _08016550 @ =gBattlescriptCurrInstr
	mov r9, r1
	ldr r6, _08016554 @ =gUnknown_81D99E4
	mov r12, r3
	adds r7, r2, 0
	ldr r2, _08016558 @ =gCurrentActionFuncId
	mov r10, r2
	cmp r0, 0x4
	bls _0801653C
	b _08016706
_0801653C:
	lsls r0, 2
	ldr r1, _0801655C @ =_08016560
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08016548: .4byte gBattleScripting
_0801654C: .4byte gBattleStruct
_08016550: .4byte gBattlescriptCurrInstr
_08016554: .4byte gUnknown_81D99E4
_08016558: .4byte gCurrentActionFuncId
_0801655C: .4byte _08016560
	.align 2, 0
_08016560:
	.4byte _08016706
	.4byte _08016706
	.4byte _08016574
	.4byte _08016608
	.4byte _080166D8
_08016574:
	ldr r5, _080165AC @ =gBattleCommunication
	movs r0, 0
	strb r0, [r5, 0x5]
	ldr r2, _080165B0 @ =gBattlerAttacker
	ldrb r0, [r2]
	lsrs r0, 1
	ldr r1, [r7]
	adds r0, r1
	adds r0, 0xC6
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	mov r8, r2
	cmp r0, 0
	beq _080165C0
	movs r0, 0x3E
	ands r0, r1
	ldr r1, _080165B4 @ =gBattlescriptCurrInstr
	mov r9, r1
	ldr r6, _080165B8 @ =gUnknown_81D99E4
	ldr r2, _080165BC @ =gCurrentActionFuncId
	mov r10, r2
	cmp r0, 0
	bne _080165A6
	b _08016706
_080165A6:
	movs r0, 0x5
	strb r0, [r5, 0x5]
	b _08016706
	.align 2, 0
_080165AC: .4byte gBattleCommunication
_080165B0: .4byte gBattlerAttacker
_080165B4: .4byte gBattlescriptCurrInstr
_080165B8: .4byte gUnknown_81D99E4
_080165BC: .4byte gCurrentActionFuncId
_080165C0:
	ldr r0, _080165FC @ =gBattlescriptCurrInstr
	mov r9, r0
	ldr r6, _08016600 @ =gUnknown_81D99E4
	ldr r1, _08016604 @ =gCurrentActionFuncId
	mov r10, r1
	mov r4, r8
	adds r3, r7, 0
	adds r2, r5, 0
_080165D0:
	ldrb r1, [r4]
	lsrs r1, 1
	ldr r0, [r3]
	adds r1, r0
	adds r1, 0xC6
	ldrb r0, [r1]
	lsrs r0, 1
	strb r0, [r1]
	ldrb r0, [r2, 0x5]
	adds r0, 0x1
	strb r0, [r2, 0x5]
	ldrb r0, [r4]
	lsrs r0, 1
	ldr r1, [r3]
	adds r0, r1
	adds r0, 0xC6
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080165D0
	b _08016706
	.align 2, 0
_080165FC: .4byte gBattlescriptCurrInstr
_08016600: .4byte gUnknown_81D99E4
_08016604: .4byte gCurrentActionFuncId
_08016608:
	ldr r3, _0801663C @ =gBattleCommunication
	movs r0, 0x4
	strb r0, [r3, 0x5]
	ldr r2, _08016640 @ =gBattlerAttacker
	ldrb r0, [r2]
	lsrs r0, 1
	ldr r1, [r7]
	adds r0, r1
	adds r6, r0, 0
	adds r6, 0xC6
	ldrb r1, [r6]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r8, r2
	cmp r5, 0
	beq _08016650
	movs r0, 0x5
	strb r0, [r3, 0x5]
	ldr r2, _08016644 @ =gBattlescriptCurrInstr
	mov r9, r2
	ldr r6, _08016648 @ =gUnknown_81D99E4
	ldr r0, _0801664C @ =gCurrentActionFuncId
	mov r10, r0
	b _08016706
	.align 2, 0
_0801663C: .4byte gBattleCommunication
_08016640: .4byte gBattlerAttacker
_08016644: .4byte gBattlescriptCurrInstr
_08016648: .4byte gUnknown_81D99E4
_0801664C: .4byte gCurrentActionFuncId
_08016650:
	ldr r3, _080166C4 @ =gBattleTextBuff1
	movs r4, 0xFD
	strb r4, [r3]
	movs r0, 0x5
	strb r0, [r3, 0x1]
	movs r2, 0x1
	strb r2, [r3, 0x2]
	movs r0, 0xFF
	strb r0, [r3, 0x3]
	ldr r1, _080166C8 @ =gBattleTextBuff2
	strb r4, [r1]
	strb r5, [r1, 0x1]
	movs r0, 0xD2
	strb r0, [r1, 0x2]
	strb r5, [r1, 0x3]
	subs r0, 0xD3
	strb r0, [r1, 0x4]
	ldrb r0, [r6]
	ands r2, r0
	ldr r1, _080166CC @ =gBattlescriptCurrInstr
	mov r9, r1
	ldr r6, _080166D0 @ =gUnknown_81D99E4
	ldr r0, _080166D4 @ =gCurrentActionFuncId
	mov r10, r0
	cmp r2, 0
	bne _080166B4
	mov r5, r8
	adds r4, r7, 0
	adds r2, r3, 0
_0801668A:
	ldrb r1, [r5]
	lsrs r1, 1
	ldr r0, [r4]
	adds r1, r0
	adds r1, 0xC6
	ldrb r0, [r1]
	lsrs r0, 1
	strb r0, [r1]
	ldrb r0, [r2, 0x2]
	adds r0, 0x1
	strb r0, [r2, 0x2]
	ldrb r0, [r5]
	lsrs r0, 1
	ldr r1, [r4]
	adds r0, r1
	adds r0, 0xC6
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0801668A
_080166B4:
	ldrb r0, [r3, 0x2]
	adds r0, 0xE
	movs r1, 0
	mov r2, r12
	strb r0, [r2, 0x10]
	strb r1, [r2, 0x11]
	b _08016706
	.align 2, 0
_080166C4: .4byte gBattleTextBuff1
_080166C8: .4byte gBattleTextBuff2
_080166CC: .4byte gBattlescriptCurrInstr
_080166D0: .4byte gUnknown_81D99E4
_080166D4: .4byte gCurrentActionFuncId
_080166D8:
	ldr r0, _080166EC @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080166F4
	ldr r1, _080166F0 @ =gBattleCommunication
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _080166F8
	.align 2, 0
_080166EC: .4byte gBattleTypeFlags
_080166F0: .4byte gBattleCommunication
_080166F4:
	ldr r0, _08016734 @ =gBattleCommunication
	strb r1, [r0, 0x5]
_080166F8:
	ldr r0, _08016738 @ =gBattlerAttacker
	mov r8, r0
	ldr r1, _0801673C @ =gBattlescriptCurrInstr
	mov r9, r1
	ldr r6, _08016740 @ =gUnknown_81D99E4
	ldr r2, _08016744 @ =gCurrentActionFuncId
	mov r10, r2
_08016706:
	mov r1, r8
	ldrb r0, [r1]
	lsrs r0, 1
	ldr r1, [r7]
	adds r0, r1
	adds r0, 0xC4
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	mov r2, r9
	str r0, [r2]
_0801671E:
	movs r0, 0xA
	mov r1, r10
	strb r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016734: .4byte gBattleCommunication
_08016738: .4byte gBattlerAttacker
_0801673C: .4byte gBattlescriptCurrInstr
_08016740: .4byte gUnknown_81D99E4
_08016744: .4byte gCurrentActionFuncId
	thumb_func_end HandleAction_UseItem

	thumb_func_start TryRunFromBattle
TryRunFromBattle: @ 8016748
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r6, 0
	ldr r1, _0801676C @ =gBattleMons
	movs r0, 0x58
	muls r0, r4
	adds r1, r0, r1
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _08016774
	ldr r1, _08016770 @ =gEnigmaBerries
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x7]
	b _0801677E
	.align 2, 0
_0801676C: .4byte gBattleMons
_08016770: .4byte gEnigmaBerries
_08016774:
	ldrh r0, [r1, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r1, r0, 24
_0801677E:
	ldr r0, _080167AC @ =gPotentialItemEffectBattler
	strb r4, [r0]
	cmp r1, 0x25
	bne _080167BC
	ldr r2, _080167B0 @ =gLastUsedItem
	ldr r1, _080167B4 @ =gBattleMons
	movs r0, 0x58
	muls r0, r4
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	strh r0, [r2]
	ldr r0, _080167B8 @ =gProtectStructs
	lsls r2, r4, 4
	adds r2, r0
	ldrb r1, [r2, 0x1]
	movs r0, 0x19
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r2, 0x1]
	b _08016816
	.align 2, 0
_080167AC: .4byte gPotentialItemEffectBattler
_080167B0: .4byte gLastUsedItem
_080167B4: .4byte gBattleMons
_080167B8: .4byte gProtectStructs
_080167BC:
	ldr r7, _080167EC @ =gBattleMons
	movs r2, 0x58
	adds r0, r4, 0
	muls r0, r2
	adds r5, r0, r7
	adds r0, r5, 0
	adds r0, 0x20
	ldrb r1, [r0]
	cmp r1, 0x32
	bne _080167F8
	ldr r0, _080167F0 @ =gLastUsedAbility
	strb r1, [r0]
	ldr r0, _080167F4 @ =gProtectStructs
	lsls r2, r4, 4
	adds r2, r0
	ldrb r1, [r2, 0x1]
	movs r0, 0x19
	negs r0, r0
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r2, 0x1]
	b _08016816
	.align 2, 0
_080167EC: .4byte gBattleMons
_080167F0: .4byte gLastUsedAbility
_080167F4: .4byte gProtectStructs
_080167F8:
	ldr r0, _08016820 @ =gBattleTypeFlags
	ldr r3, [r0]
	movs r0, 0xA0
	lsls r0, 8
	ands r0, r3
	movs r1, 0x80
	lsls r1, 8
	cmp r0, r1
	bne _08016824
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _0801687A
_08016816:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	b _0801687A
	.align 2, 0
_08016820: .4byte gBattleTypeFlags
_08016824:
	movs r0, 0x1
	ands r3, r0
	cmp r3, 0
	bne _0801686E
	movs r1, 0x1
	adds r0, r4, 0
	eors r0, r1
	muls r0, r2
	adds r2, r0, r7
	ldrh r0, [r5, 0x6]
	ldrh r1, [r2, 0x6]
	cmp r0, r1
	bcs _08016868
	lsls r0, 7
	ldrh r1, [r2, 0x6]
	bl __divsi3
	adds r4, r0, 0
	ldr r0, _08016894 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x6C
	ldrb r1, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 1
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	movs r1, 0xFF
	ands r1, r0
	cmp r4, r1
	bls _0801686E
_08016868:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0801686E:
	ldr r0, _08016894 @ =gBattleStruct
	ldr r1, [r0]
	adds r1, 0x6C
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0801687A:
	cmp r6, 0
	beq _0801688C
	ldr r1, _08016898 @ =gCurrentTurnActionNumber
	ldr r0, _0801689C @ =gBattlersCount
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _080168A0 @ =gBattleOutcome
	movs r0, 0x4
	strb r0, [r1]
_0801688C:
	adds r0, r6, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08016894: .4byte gBattleStruct
_08016898: .4byte gCurrentTurnActionNumber
_0801689C: .4byte gBattlersCount
_080168A0: .4byte gBattleOutcome
	thumb_func_end TryRunFromBattle

	thumb_func_start HandleAction_Run
HandleAction_Run: @ 80168A4
	push {r4-r6,lr}
	ldr r4, _080168F4 @ =gBattlerAttacker
	ldr r1, _080168F8 @ =gBattlerByTurnOrder
	ldr r5, _080168FC @ =gCurrentTurnActionNumber
	ldrb r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r0, _08016900 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0801694C
	ldr r0, _08016904 @ =gBattlersCount
	ldrb r1, [r0]
	strb r1, [r5]
	ldr r2, _08016908 @ =gActiveBattler
	movs r0, 0
	strb r0, [r2]
	lsls r1, 24
	cmp r1, 0
	beq _08016938
	adds r4, r2, 0
	ldr r6, _0801690C @ =gChosenActionByBattler
	ldr r5, _08016910 @ =gBattleOutcome
_080168D8:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08016914
	ldrb r0, [r4]
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _08016926
	ldrb r0, [r5]
	movs r1, 0x2
	b _08016922
	.align 2, 0
_080168F4: .4byte gBattlerAttacker
_080168F8: .4byte gBattlerByTurnOrder
_080168FC: .4byte gCurrentTurnActionNumber
_08016900: .4byte gBattleTypeFlags
_08016904: .4byte gBattlersCount
_08016908: .4byte gActiveBattler
_0801690C: .4byte gChosenActionByBattler
_08016910: .4byte gBattleOutcome
_08016914:
	ldrb r0, [r4]
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _08016926
	ldrb r0, [r5]
	movs r1, 0x1
_08016922:
	orrs r0, r1
	strb r0, [r5]
_08016926:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08016944 @ =gBattlersCount
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _080168D8
_08016938:
	ldr r0, _08016948 @ =gBattleOutcome
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	b _080169D8
	.align 2, 0
_08016944: .4byte gBattlersCount
_08016948: .4byte gBattleOutcome
_0801694C:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _0801698C
	ldrb r0, [r4]
	bl TryRunFromBattle
	lsls r0, 24
	cmp r0, 0
	bne _080169D8
	ldrb r0, [r4]
	bl ClearFuryCutterDestinyBondGrudge
	ldr r1, _0801697C @ =gBattleCommunication
	movs r0, 0x3
	strb r0, [r1, 0x5]
	ldr r1, _08016980 @ =gBattlescriptCurrInstr
	ldr r0, _08016984 @ =gUnknown_81D893A
	str r0, [r1]
	ldr r1, _08016988 @ =gCurrentActionFuncId
	movs r0, 0xA
	b _080169D6
	.align 2, 0
_0801697C: .4byte gBattleCommunication
_08016980: .4byte gBattlescriptCurrInstr
_08016984: .4byte gUnknown_81D893A
_08016988: .4byte gCurrentActionFuncId
_0801698C:
	ldr r1, _080169B4 @ =gBattleMons
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080169B8 @ =0x0400e000
	ands r0, r1
	cmp r0, 0
	beq _080169CC
	ldr r1, _080169BC @ =gBattleCommunication
	movs r0, 0x4
	strb r0, [r1, 0x5]
	ldr r1, _080169C0 @ =gBattlescriptCurrInstr
	ldr r0, _080169C4 @ =gUnknown_81D893A
	str r0, [r1]
	ldr r1, _080169C8 @ =gCurrentActionFuncId
	movs r0, 0xA
	b _080169D6
	.align 2, 0
_080169B4: .4byte gBattleMons
_080169B8: .4byte 0x0400e000
_080169BC: .4byte gBattleCommunication
_080169C0: .4byte gBattlescriptCurrInstr
_080169C4: .4byte gUnknown_81D893A
_080169C8: .4byte gCurrentActionFuncId
_080169CC:
	ldr r0, _080169E0 @ =gBattlersCount
	ldrb r0, [r0]
	strb r0, [r5]
	ldr r1, _080169E4 @ =gBattleOutcome
	movs r0, 0x6
_080169D6:
	strb r0, [r1]
_080169D8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080169E0: .4byte gBattlersCount
_080169E4: .4byte gBattleOutcome
	thumb_func_end HandleAction_Run

	thumb_func_start HandleAction_WatchesCarefully
HandleAction_WatchesCarefully: @ 80169E8
	push {r4,r5,lr}
	ldr r2, _08016A44 @ =gBattlerAttacker
	ldr r1, _08016A48 @ =gBattlerByTurnOrder
	ldr r0, _08016A4C @ =gCurrentTurnActionNumber
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _08016A50 @ =gBattle_BG0_X
	movs r5, 0
	strh r5, [r0]
	ldr r0, _08016A54 @ =gBattle_BG0_Y
	strh r5, [r0]
	ldr r4, _08016A58 @ =gBattleStruct
	ldr r1, [r4]
	adds r2, r1, 0
	adds r2, 0x79
	ldrb r0, [r2]
	cmp r0, 0
	beq _08016A74
	subs r0, 0x1
	strb r0, [r2]
	ldr r0, [r4]
	adds r0, 0x79
	ldrb r0, [r0]
	cmp r0, 0
	bne _08016A68
	ldr r0, _08016A5C @ =gEnemyParty
	movs r1, 0xB
	bl GetMonData
	ldr r4, [r4]
	adds r4, 0x7C
	ldr r2, _08016A60 @ =gBaseStats
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x8]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08016A64 @ =0x000004fb
	bl __divsi3
	strb r0, [r4]
	b _08016A98
	.align 2, 0
_08016A44: .4byte gBattlerAttacker
_08016A48: .4byte gBattlerByTurnOrder
_08016A4C: .4byte gCurrentTurnActionNumber
_08016A50: .4byte gBattle_BG0_X
_08016A54: .4byte gBattle_BG0_Y
_08016A58: .4byte gBattleStruct
_08016A5C: .4byte gEnemyParty
_08016A60: .4byte gBaseStats
_08016A64: .4byte 0x000004fb
_08016A68:
	ldr r1, _08016A70 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08016A9C
	.align 2, 0
_08016A70: .4byte gBattleCommunication
_08016A74:
	adds r1, 0x7A
	ldrb r0, [r1]
	cmp r0, 0
	beq _08016A98
	subs r0, 0x1
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x7A
	ldrb r0, [r0]
	cmp r0, 0
	beq _08016A98
	ldr r1, _08016A94 @ =gBattleCommunication
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _08016A9C
	.align 2, 0
_08016A94: .4byte gBattleCommunication
_08016A98:
	ldr r0, _08016AB0 @ =gBattleCommunication
	strb r5, [r0, 0x5]
_08016A9C:
	ldr r1, _08016AB4 @ =gBattlescriptCurrInstr
	ldr r0, _08016AB8 @ =gBattlescriptsForSafariActions
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _08016ABC @ =gCurrentActionFuncId
	movs r0, 0xA
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08016AB0: .4byte gBattleCommunication
_08016AB4: .4byte gBattlescriptCurrInstr
_08016AB8: .4byte gBattlescriptsForSafariActions
_08016ABC: .4byte gCurrentActionFuncId
	thumb_func_end HandleAction_WatchesCarefully

	thumb_func_start HandleAction_SafariZoneBallThrow
HandleAction_SafariZoneBallThrow: @ 8016AC0
	ldr r2, _08016AF8 @ =gBattlerAttacker
	ldr r1, _08016AFC @ =gBattlerByTurnOrder
	ldr r0, _08016B00 @ =gCurrentTurnActionNumber
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _08016B04 @ =gBattle_BG0_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08016B08 @ =gBattle_BG0_Y
	strh r1, [r0]
	ldr r1, _08016B0C @ =gNumSafariBalls
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	ldr r1, _08016B10 @ =gLastUsedItem
	movs r0, 0x5
	strh r0, [r1]
	ldr r1, _08016B14 @ =gBattlescriptCurrInstr
	ldr r0, _08016B18 @ =gBattlescriptsForBallThrow
	ldr r0, [r0, 0x14]
	str r0, [r1]
	ldr r1, _08016B1C @ =gCurrentActionFuncId
	movs r0, 0xA
	strb r0, [r1]
	bx lr
	.align 2, 0
_08016AF8: .4byte gBattlerAttacker
_08016AFC: .4byte gBattlerByTurnOrder
_08016B00: .4byte gCurrentTurnActionNumber
_08016B04: .4byte gBattle_BG0_X
_08016B08: .4byte gBattle_BG0_Y
_08016B0C: .4byte gNumSafariBalls
_08016B10: .4byte gLastUsedItem
_08016B14: .4byte gBattlescriptCurrInstr
_08016B18: .4byte gBattlescriptsForBallThrow
_08016B1C: .4byte gCurrentActionFuncId
	thumb_func_end HandleAction_SafariZoneBallThrow

	thumb_func_start HandleAction_ThrowPokeblock
HandleAction_ThrowPokeblock: @ 8016B20
	push {r4-r7,lr}
	ldr r2, _08016B9C @ =gBattlerAttacker
	ldr r1, _08016BA0 @ =gBattlerByTurnOrder
	ldr r0, _08016BA4 @ =gCurrentTurnActionNumber
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _08016BA8 @ =gBattle_BG0_X
	movs r7, 0
	strh r7, [r0]
	ldr r0, _08016BAC @ =gBattle_BG0_Y
	strh r7, [r0]
	bl Random
	ldr r6, _08016BB0 @ =gBattleStruct
	ldr r5, [r6]
	adds r5, 0x7A
	ldrb r4, [r5]
	adds r4, 0x2
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x5
	bl __umodsi3
	adds r0, r4
	strb r0, [r5]
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0x7A
	ldrb r0, [r1]
	cmp r0, 0x6
	bls _08016B66
	movs r0, 0x6
	strb r0, [r1]
_08016B66:
	ldr r0, [r6]
	adds r0, 0x79
	strb r7, [r0]
	ldr r1, [r6]
	adds r1, 0x7C
	ldrb r0, [r1]
	lsrs r0, 1
	strb r0, [r1]
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0x7C
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _08016B86
	movs r0, 0x3
	strb r0, [r1]
_08016B86:
	ldr r1, _08016BB4 @ =gBattlescriptCurrInstr
	ldr r0, _08016BB8 @ =gBattlescriptsForSafariActions
	ldr r0, [r0, 0x8]
	str r0, [r1]
	ldr r1, _08016BBC @ =gCurrentActionFuncId
	movs r0, 0xA
	strb r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016B9C: .4byte gBattlerAttacker
_08016BA0: .4byte gBattlerByTurnOrder
_08016BA4: .4byte gCurrentTurnActionNumber
_08016BA8: .4byte gBattle_BG0_X
_08016BAC: .4byte gBattle_BG0_Y
_08016BB0: .4byte gBattleStruct
_08016BB4: .4byte gBattlescriptCurrInstr
_08016BB8: .4byte gBattlescriptsForSafariActions
_08016BBC: .4byte gCurrentActionFuncId
	thumb_func_end HandleAction_ThrowPokeblock

	thumb_func_start HandleAction_GoNear
HandleAction_GoNear: @ 8016BC0
	push {r4-r7,lr}
	ldr r2, _08016C3C @ =gBattlerAttacker
	ldr r1, _08016C40 @ =gBattlerByTurnOrder
	ldr r0, _08016C44 @ =gCurrentTurnActionNumber
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _08016C48 @ =gBattle_BG0_X
	movs r7, 0
	strh r7, [r0]
	ldr r0, _08016C4C @ =gBattle_BG0_Y
	strh r7, [r0]
	bl Random
	ldr r6, _08016C50 @ =gBattleStruct
	ldr r5, [r6]
	adds r5, 0x79
	ldrb r4, [r5]
	adds r4, 0x2
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x5
	bl __umodsi3
	adds r0, r4
	strb r0, [r5]
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0x79
	ldrb r0, [r1]
	cmp r0, 0x6
	bls _08016C06
	movs r0, 0x6
	strb r0, [r1]
_08016C06:
	ldr r0, [r6]
	adds r0, 0x7A
	strb r7, [r0]
	ldr r1, [r6]
	adds r1, 0x7C
	ldrb r0, [r1]
	lsls r0, 1
	strb r0, [r1]
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0x7C
	ldrb r0, [r1]
	cmp r0, 0x14
	bls _08016C26
	movs r0, 0x14
	strb r0, [r1]
_08016C26:
	ldr r1, _08016C54 @ =gBattlescriptCurrInstr
	ldr r0, _08016C58 @ =gBattlescriptsForSafariActions
	ldr r0, [r0, 0x4]
	str r0, [r1]
	ldr r1, _08016C5C @ =gCurrentActionFuncId
	movs r0, 0xA
	strb r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016C3C: .4byte gBattlerAttacker
_08016C40: .4byte gBattlerByTurnOrder
_08016C44: .4byte gCurrentTurnActionNumber
_08016C48: .4byte gBattle_BG0_X
_08016C4C: .4byte gBattle_BG0_Y
_08016C50: .4byte gBattleStruct
_08016C54: .4byte gBattlescriptCurrInstr
_08016C58: .4byte gBattlescriptsForSafariActions
_08016C5C: .4byte gCurrentActionFuncId
	thumb_func_end HandleAction_GoNear

	thumb_func_start HandleAction_SafariZoneRun
HandleAction_SafariZoneRun: @ 8016C60
	push {r4,lr}
	ldr r2, _08016C88 @ =gBattlerAttacker
	ldr r1, _08016C8C @ =gBattlerByTurnOrder
	ldr r4, _08016C90 @ =gCurrentTurnActionNumber
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0x11
	bl PlaySE
	ldr r0, _08016C94 @ =gBattlersCount
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r1, _08016C98 @ =gBattleOutcome
	movs r0, 0x4
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08016C88: .4byte gBattlerAttacker
_08016C8C: .4byte gBattlerByTurnOrder
_08016C90: .4byte gCurrentTurnActionNumber
_08016C94: .4byte gBattlersCount
_08016C98: .4byte gBattleOutcome
	thumb_func_end HandleAction_SafariZoneRun

	thumb_func_start HandleAction_OldManBallThrow
HandleAction_OldManBallThrow: @ 8016C9C
	ldr r3, _08016CE8 @ =gBattlerAttacker
	ldr r1, _08016CEC @ =gBattlerByTurnOrder
	ldr r0, _08016CF0 @ =gCurrentTurnActionNumber
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	strb r2, [r3]
	ldr r0, _08016CF4 @ =gBattle_BG0_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08016CF8 @ =gBattle_BG0_Y
	strh r1, [r0]
	ldr r1, _08016CFC @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x7
	strb r0, [r1, 0x1]
	strb r2, [r1, 0x2]
	ldr r2, _08016D00 @ =gBattlerPartyIndexes
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _08016D04 @ =gBattlescriptCurrInstr
	ldr r0, _08016D08 @ =gBattlescriptsForSafariActions
	ldr r0, [r0, 0xC]
	str r0, [r1]
	ldr r1, _08016D0C @ =gCurrentActionFuncId
	movs r0, 0xA
	strb r0, [r1]
	ldr r1, _08016D10 @ =gActionsByTurnOrder
	movs r0, 0xC
	strb r0, [r1, 0x1]
	bx lr
	.align 2, 0
_08016CE8: .4byte gBattlerAttacker
_08016CEC: .4byte gBattlerByTurnOrder
_08016CF0: .4byte gCurrentTurnActionNumber
_08016CF4: .4byte gBattle_BG0_X
_08016CF8: .4byte gBattle_BG0_Y
_08016CFC: .4byte gBattleTextBuff1
_08016D00: .4byte gBattlerPartyIndexes
_08016D04: .4byte gBattlescriptCurrInstr
_08016D08: .4byte gBattlescriptsForSafariActions
_08016D0C: .4byte gCurrentActionFuncId
_08016D10: .4byte gActionsByTurnOrder
	thumb_func_end HandleAction_OldManBallThrow

	thumb_func_start HandleAction_TryFinish
HandleAction_TryFinish: @ 8016D14
	push {lr}
	bl HandleFaintedMonActions
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08016D30
	ldr r0, _08016D34 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x4D
	strb r1, [r0]
	ldr r1, _08016D38 @ =gCurrentActionFuncId
	movs r0, 0xC
	strb r0, [r1]
_08016D30:
	pop {r0}
	bx r0
	.align 2, 0
_08016D34: .4byte gBattleStruct
_08016D38: .4byte gCurrentActionFuncId
	thumb_func_end HandleAction_TryFinish

	thumb_func_start HandleAction_NothingIsFainted
HandleAction_NothingIsFainted: @ 8016D3C
	ldr r1, _08016D5C @ =gCurrentTurnActionNumber
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r3, _08016D60 @ =gCurrentActionFuncId
	ldr r2, _08016D64 @ =gActionsByTurnOrder
	ldrb r0, [r1]
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	ldr r2, _08016D68 @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _08016D6C @ =0xf1e892af
	ands r0, r1
	str r0, [r2]
	bx lr
	.align 2, 0
_08016D5C: .4byte gCurrentTurnActionNumber
_08016D60: .4byte gCurrentActionFuncId
_08016D64: .4byte gActionsByTurnOrder
_08016D68: .4byte gHitMarker
_08016D6C: .4byte 0xf1e892af
	thumb_func_end HandleAction_NothingIsFainted

	thumb_func_start HandleAction_ActionFinished
HandleAction_ActionFinished: @ 8016D70
	push {r4,r5,lr}
	ldr r1, _08016DE4 @ =gCurrentTurnActionNumber
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r3, _08016DE8 @ =gCurrentActionFuncId
	ldr r2, _08016DEC @ =gActionsByTurnOrder
	ldrb r0, [r1]
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	bl SpecialStatusesClear
	ldr r2, _08016DF0 @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _08016DF4 @ =0xf1e892af
	ands r0, r1
	str r0, [r2]
	ldr r0, _08016DF8 @ =gCurrentMove
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08016DFC @ =gBattleMoveDamage
	movs r4, 0
	str r4, [r0]
	ldr r0, _08016E00 @ =gMoveResultFlags
	strb r1, [r0]
	ldr r5, _08016E04 @ =gBattleScripting
	strb r1, [r5, 0x18]
	strb r1, [r5, 0x19]
	ldr r2, _08016E08 @ =gLastLandedMoves
	ldr r3, _08016E0C @ =gBattlerAttacker
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	strh r4, [r0]
	ldr r2, _08016E10 @ =gLastHitByType
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	strh r4, [r0]
	ldr r0, _08016E14 @ =gBattleStruct
	ldr r0, [r0]
	strb r1, [r0, 0x13]
	ldr r0, _08016E18 @ =gDynamicBasePower
	strh r4, [r0]
	strb r1, [r5, 0x14]
	ldr r0, _08016E1C @ =gBattleCommunication
	strb r1, [r0, 0x3]
	strb r1, [r0, 0x4]
	strb r1, [r5, 0x16]
	ldr r0, _08016E20 @ =gBattleResources
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	adds r0, 0x20
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08016DE4: .4byte gCurrentTurnActionNumber
_08016DE8: .4byte gCurrentActionFuncId
_08016DEC: .4byte gActionsByTurnOrder
_08016DF0: .4byte gHitMarker
_08016DF4: .4byte 0xf1e892af
_08016DF8: .4byte gCurrentMove
_08016DFC: .4byte gBattleMoveDamage
_08016E00: .4byte gMoveResultFlags
_08016E04: .4byte gBattleScripting
_08016E08: .4byte gLastLandedMoves
_08016E0C: .4byte gBattlerAttacker
_08016E10: .4byte gLastHitByType
_08016E14: .4byte gBattleStruct
_08016E18: .4byte gDynamicBasePower
_08016E1C: .4byte gBattleCommunication
_08016E20: .4byte gBattleResources
	thumb_func_end HandleAction_ActionFinished

	.align 2, 0 @ Don't pad with nop.
