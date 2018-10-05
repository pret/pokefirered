	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start atk00_attackcanceler
atk00_attackcanceler: @ 801D760
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	ldr r0, _0801D77C @ =gUnknown_2023E8A
	ldrb r0, [r0]
	cmp r0, 0
	beq _0801D784
	ldr r1, _0801D780 @ =gUnknown_2023BE3
	movs r0, 0xC
	strb r0, [r1]
	b _0801DAFC
	.align 2, 0
_0801D77C: .4byte gUnknown_2023E8A
_0801D780: .4byte gUnknown_2023BE3
_0801D784:
	ldr r2, _0801D7B4 @ =gBattleMons
	ldr r0, _0801D7B8 @ =sBattler_AI
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _0801D7C8
	ldr r2, _0801D7BC @ =gUnknown_2023DD0
	ldr r1, [r2]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	bne _0801D7C8
	movs r0, 0x80
	lsls r0, 12
	orrs r1, r0
	str r1, [r2]
	ldr r1, _0801D7C0 @ =gUnknown_2023D74
	ldr r0, _0801D7C4 @ =gUnknown_81D694E
	b _0801DAFA
	.align 2, 0
_0801D7B4: .4byte gBattleMons
_0801D7B8: .4byte sBattler_AI
_0801D7BC: .4byte gUnknown_2023DD0
_0801D7C0: .4byte gUnknown_2023D74
_0801D7C4: .4byte gUnknown_81D694E
_0801D7C8:
	bl sub_80192D4
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _0801D7D6
	b _0801DAFC
_0801D7D6:
	ldr r0, _0801D844 @ =gBattlerTarget
	ldrb r1, [r0]
	str r2, [sp]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	cmp r0, 0
	beq _0801D7EE
	b _0801DAFC
_0801D7EE:
	ldr r4, _0801D848 @ =gBattleMons
	ldr r0, _0801D84C @ =gUnknown_2023D48
	ldrb r1, [r0]
	ldr r3, _0801D850 @ =sBattler_AI
	ldrb r2, [r3]
	movs r0, 0x58
	muls r2, r0
	adds r1, r2
	adds r0, r4, 0
	adds r0, 0x24
	adds r1, r0
	ldrb r0, [r1]
	ldr r5, _0801D854 @ =gUnknown_2023DD0
	cmp r0, 0
	bne _0801D86C
	ldr r0, _0801D858 @ =gCurrentMove
	ldrh r0, [r0]
	cmp r0, 0xA5
	beq _0801D86C
	ldr r0, [r5]
	ldr r1, _0801D85C @ =0x00800200
	ands r0, r1
	cmp r0, 0
	bne _0801D86C
	adds r0, r4, 0
	adds r0, 0x50
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 5
	ands r0, r1
	cmp r0, 0
	bne _0801D86C
	ldr r1, _0801D860 @ =gUnknown_2023D74
	ldr r0, _0801D864 @ =gUnknown_81D8EA8
	str r0, [r1]
	ldr r2, _0801D868 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	b _0801DAFC
	.align 2, 0
_0801D844: .4byte gBattlerTarget
_0801D848: .4byte gBattleMons
_0801D84C: .4byte gUnknown_2023D48
_0801D850: .4byte sBattler_AI
_0801D854: .4byte gUnknown_2023DD0
_0801D858: .4byte gCurrentMove
_0801D85C: .4byte 0x00800200
_0801D860: .4byte gUnknown_2023D74
_0801D864: .4byte gUnknown_81D8EA8
_0801D868: .4byte gMoveResultFlags
_0801D86C:
	ldr r0, [r5]
	ldr r1, _0801D8B0 @ =0xff7fffff
	ands r0, r1
	str r0, [r5]
	movs r6, 0x80
	lsls r6, 18
	ands r0, r6
	cmp r0, 0
	bne _0801D8C4
	ldrb r1, [r3]
	movs r0, 0x58
	muls r0, r1
	adds r1, r4, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 5
	ands r0, r1
	cmp r0, 0
	bne _0801D8C4
	bl sub_801D438
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _0801D8C4
	cmp r2, 0x2
	bne _0801D8B4
	ldr r0, [r5]
	orrs r0, r6
	str r0, [r5]
	b _0801DAFC
	.align 2, 0
_0801D8B0: .4byte 0xff7fffff
_0801D8B4:
	ldr r0, _0801D8C0 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	b _0801DAFC
	.align 2, 0
_0801D8C0: .4byte gMoveResultFlags
_0801D8C4:
	ldr r2, _0801D928 @ =gUnknown_2023DD0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 18
	orrs r0, r1
	str r0, [r2]
	ldr r2, _0801D92C @ =gUnknown_2023E8C
	ldr r1, _0801D930 @ =gBattlerTarget
	ldrb r3, [r1]
	lsls r0, r3, 4
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 27
	mov r8, r1
	mov r9, r2
	cmp r0, 0
	bge _0801D94C
	ldr r2, _0801D934 @ =gBattleMoves
	ldr r0, _0801D938 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x8]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0801D94C
	ldr r0, _0801D93C @ =sBattler_AI
	ldrb r0, [r0]
	ldr r2, _0801D940 @ =0x00000115
	adds r1, r3, 0
	bl PressurePPLose
	mov r0, r8
	ldrb r1, [r0]
	lsls r1, 4
	add r1, r9
	ldrb r2, [r1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	bl BattleScriptPushCursor
	ldr r1, _0801D944 @ =gUnknown_2023D74
	ldr r0, _0801D948 @ =gUnknown_81D8FAA
	b _0801DAFA
	.align 2, 0
_0801D928: .4byte gUnknown_2023DD0
_0801D92C: .4byte gUnknown_2023E8C
_0801D930: .4byte gBattlerTarget
_0801D934: .4byte gBattleMoves
_0801D938: .4byte gCurrentMove
_0801D93C: .4byte sBattler_AI
_0801D940: .4byte 0x00000115
_0801D944: .4byte gUnknown_2023D74
_0801D948: .4byte gUnknown_81D8FAA
_0801D94C:
	movs r2, 0
	ldr r0, _0801D9C8 @ =gUnknown_2023BCC
	ldrb r0, [r0]
	cmp r2, r0
	bge _0801D98E
	ldr r6, _0801D9CC @ =gUnknown_2023E8C
	ldr r1, _0801D9D0 @ =gBattleMoves
	mov r12, r1
	adds r5, r0, 0
	ldr r7, _0801D9D4 @ =gUnknown_2023BDE
_0801D960:
	adds r4, r2, r7
	ldrb r3, [r4]
	lsls r0, r3, 4
	adds r0, r6
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _0801D988
	ldr r0, _0801D9D8 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	add r0, r12
	ldrb r1, [r0, 0x8]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0801D988
	b _0801DAB4
_0801D988:
	adds r2, 0x1
	cmp r2, r5
	blt _0801D960
_0801D98E:
	ldr r0, _0801D9DC @ =gUnknown_2023ECC
	mov r1, r8
	ldrb r2, [r1]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r3, [r1]
	lsls r0, r3, 30
	cmp r0, 0
	bge _0801D9EC
	movs r0, 0x3
	negs r0, r0
	ands r0, r3
	strb r0, [r1]
	ldr r4, _0801D9E0 @ =gUnknown_2023D6A
	movs r0, 0x1F
	strb r0, [r4]
	bl BattleScriptPushCursor
	ldr r1, _0801D9E4 @ =gUnknown_2023D74
	ldr r0, _0801D9E8 @ =gUnknown_81D938D
	str r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	ldrb r1, [r4]
	bl sub_80C71D0
	b _0801DAFC
	.align 2, 0
_0801D9C8: .4byte gUnknown_2023BCC
_0801D9CC: .4byte gUnknown_2023E8C
_0801D9D0: .4byte gBattleMoves
_0801D9D4: .4byte gUnknown_2023BDE
_0801D9D8: .4byte gCurrentMove
_0801D9DC: .4byte gUnknown_2023ECC
_0801D9E0: .4byte gUnknown_2023D6A
_0801D9E4: .4byte gUnknown_2023D74
_0801D9E8: .4byte gUnknown_81D938D
_0801D9EC:
	lsls r0, r2, 4
	add r0, r9
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	bne _0801D9FA
	b _0801DAF4
_0801D9FA:
	ldr r1, _0801DA90 @ =gBattleMoves
	ldr r2, _0801DA94 @ =gCurrentMove
	ldrh r3, [r2]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x2
	ands r0, r1
	adds r4, r2, 0
	cmp r0, 0
	beq _0801DAF4
	cmp r3, 0xAE
	bne _0801DA38
	ldr r2, _0801DA98 @ =gBattleMons
	ldr r0, _0801DA9C @ =sBattler_AI
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x7
	beq _0801DA38
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x7
	bne _0801DAF4
_0801DA38:
	ldrh r0, [r4]
	bl IsTwoTurnsMove
	lsls r0, 24
	cmp r0, 0
	beq _0801DA5E
	ldr r1, _0801DA98 @ =gBattleMons
	ldr r0, _0801DA9C @ =sBattler_AI
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
	beq _0801DAF4
_0801DA5E:
	ldr r0, _0801DA9C @ =sBattler_AI
	ldrb r0, [r0]
	bl CancelMultiTurnMoves
	ldr r2, _0801DAA0 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0801DAA4 @ =gUnknown_2023DA0
	ldr r3, _0801DAA8 @ =gBattlerTarget
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r1
	movs r2, 0
	strh r2, [r0]
	ldr r1, _0801DAAC @ =gUnknown_2023DA8
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r1
	strh r2, [r0]
	ldr r1, _0801DAB0 @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x6]
	b _0801DAF4
	.align 2, 0
_0801DA90: .4byte gBattleMoves
_0801DA94: .4byte gCurrentMove
_0801DA98: .4byte gBattleMons
_0801DA9C: .4byte sBattler_AI
_0801DAA0: .4byte gMoveResultFlags
_0801DAA4: .4byte gUnknown_2023DA0
_0801DAA8: .4byte gBattlerTarget
_0801DAAC: .4byte gUnknown_2023DA8
_0801DAB0: .4byte gUnknown_2023E82
_0801DAB4:
	ldr r0, _0801DAE0 @ =sBattler_AI
	ldrb r0, [r0]
	ldr r2, _0801DAE4 @ =0x00000121
	adds r1, r3, 0
	bl PressurePPLose
	ldrb r1, [r4]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r1, _0801DAE8 @ =gBattleScripting
	ldrb r0, [r4]
	strb r0, [r1, 0x17]
	bl BattleScriptPushCursor
	ldr r1, _0801DAEC @ =gUnknown_2023D74
	ldr r0, _0801DAF0 @ =gUnknown_81D8FC2
	b _0801DAFA
	.align 2, 0
_0801DAE0: .4byte sBattler_AI
_0801DAE4: .4byte 0x00000121
_0801DAE8: .4byte gBattleScripting
_0801DAEC: .4byte gUnknown_2023D74
_0801DAF0: .4byte gUnknown_81D8FC2
_0801DAF4:
	ldr r1, _0801DB0C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
_0801DAFA:
	str r0, [r1]
_0801DAFC:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801DB0C: .4byte gUnknown_2023D74
	thumb_func_end atk00_attackcanceler

	thumb_func_start JumpIfMoveFailed
JumpIfMoveFailed: @ 801DB10
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r1, _0801DB5C @ =gUnknown_2023D74
	ldr r5, [r1]
	adds r4, r5, r0
	ldr r0, _0801DB60 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0801DB70
	ldr r1, _0801DB64 @ =gUnknown_2023DA0
	ldr r3, _0801DB68 @ =gBattlerTarget
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r1
	movs r2, 0
	strh r2, [r0]
	ldr r1, _0801DB6C @ =gUnknown_2023DA8
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r1
	strh r2, [r0]
	ldrb r4, [r5, 0x1]
	ldrb r0, [r5, 0x2]
	lsls r0, 8
	orrs r4, r0
	ldrb r0, [r5, 0x3]
	lsls r0, 16
	orrs r4, r0
	ldrb r0, [r5, 0x4]
	lsls r0, 24
	orrs r4, r0
	b _0801DB8A
	.align 2, 0
_0801DB5C: .4byte gUnknown_2023D74
_0801DB60: .4byte gMoveResultFlags
_0801DB64: .4byte gUnknown_2023DA0
_0801DB68: .4byte gBattlerTarget
_0801DB6C: .4byte gUnknown_2023DA8
_0801DB70:
	bl TrySetDestinyBondToHappen
	ldr r0, _0801DB98 @ =gBattlerTarget
	ldrb r1, [r0]
	str r6, [sp]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	cmp r0, 0
	bne _0801DB8E
_0801DB8A:
	ldr r0, _0801DB9C @ =gUnknown_2023D74
	str r4, [r0]
_0801DB8E:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801DB98: .4byte gBattlerTarget
_0801DB9C: .4byte gUnknown_2023D74
	thumb_func_end JumpIfMoveFailed

	thumb_func_start atk40_jumpifaffectedbyprotect
atk40_jumpifaffectedbyprotect: @ 801DBA0
	push {lr}
	ldr r1, _0801DBE8 @ =gUnknown_2023E8C
	ldr r0, _0801DBEC @ =gBattlerTarget
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _0801DC00
	ldr r2, _0801DBF0 @ =gBattleMoves
	ldr r0, _0801DBF4 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x8]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0801DC00
	ldr r2, _0801DBF8 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x5
	movs r1, 0
	bl JumpIfMoveFailed
	ldr r1, _0801DBFC @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x6]
	b _0801DC08
	.align 2, 0
_0801DBE8: .4byte gUnknown_2023E8C
_0801DBEC: .4byte gBattlerTarget
_0801DBF0: .4byte gBattleMoves
_0801DBF4: .4byte gCurrentMove
_0801DBF8: .4byte gMoveResultFlags
_0801DBFC: .4byte gUnknown_2023E82
_0801DC00:
	ldr r1, _0801DC0C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0801DC08:
	pop {r0}
	bx r0
	.align 2, 0
_0801DC0C: .4byte gUnknown_2023D74
	thumb_func_end atk40_jumpifaffectedbyprotect

	thumb_func_start JumpIfMoveAffectedByProtect
JumpIfMoveAffectedByProtect: @ 801DC10
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r4, 0
	ldr r1, _0801DC64 @ =gUnknown_2023E8C
	ldr r0, _0801DC68 @ =gBattlerTarget
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _0801DC5C
	ldr r2, _0801DC6C @ =gBattleMoves
	ldr r0, _0801DC70 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x8]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0801DC5C
	ldr r2, _0801DC74 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x7
	adds r1, r3, 0
	bl JumpIfMoveFailed
	ldr r1, _0801DC78 @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x6]
	movs r4, 0x1
_0801DC5C:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801DC64: .4byte gUnknown_2023E8C
_0801DC68: .4byte gBattlerTarget
_0801DC6C: .4byte gBattleMoves
_0801DC70: .4byte gCurrentMove
_0801DC74: .4byte gMoveResultFlags
_0801DC78: .4byte gUnknown_2023E82
	thumb_func_end JumpIfMoveAffectedByProtect

	thumb_func_start AccuracyCalcHelper
AccuracyCalcHelper: @ 801DC7C
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r2, _0801DCDC @ =gStatuses3
	ldr r3, _0801DCE0 @ =gBattlerTarget
	ldrb r4, [r3]
	lsls r0, r4, 2
	adds r0, r2
	ldr r1, [r0]
	movs r0, 0x18
	ands r1, r0
	adds r6, r2, 0
	cmp r1, 0
	beq _0801DCAE
	ldr r1, _0801DCE4 @ =gDisableStructs
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r1
	ldr r1, _0801DCE8 @ =sBattler_AI
	ldrb r0, [r0, 0x15]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0801DD98
_0801DCAE:
	ldr r0, _0801DCEC @ =gUnknown_2023DD0
	ldr r1, [r0]
	movs r2, 0x80
	lsls r2, 9
	ands r1, r2
	adds r2, r0, 0
	cmp r1, 0
	bne _0801DCF4
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0801DCF4
_0801DCCE:
	ldr r0, _0801DCF0 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	b _0801DD98
	.align 2, 0
_0801DCDC: .4byte gStatuses3
_0801DCE0: .4byte gBattlerTarget
_0801DCE4: .4byte gDisableStructs
_0801DCE8: .4byte sBattler_AI
_0801DCEC: .4byte gUnknown_2023DD0
_0801DCF0: .4byte gMoveResultFlags
_0801DCF4:
	ldr r0, [r2]
	ldr r1, _0801DDA4 @ =0xfffeffff
	ands r0, r1
	str r0, [r2]
	movs r1, 0x80
	lsls r1, 10
	ands r0, r1
	cmp r0, 0
	bne _0801DD16
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0801DCCE
_0801DD16:
	ldr r0, [r2]
	ldr r1, _0801DDA8 @ =0xfffdffff
	ands r0, r1
	str r0, [r2]
	movs r1, 0x80
	lsls r1, 11
	ands r0, r1
	cmp r0, 0
	bne _0801DD36
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ands r0, r1
	cmp r0, 0
	bne _0801DCCE
_0801DD36:
	ldr r0, [r2]
	ldr r1, _0801DDAC @ =0xfffbffff
	ands r0, r1
	str r0, [r2]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r5, 1
	cmp r0, 0
	bne _0801DD86
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	cmp r0, 0
	bne _0801DD86
	ldr r0, _0801DDB0 @ =gBattleWeather
	ldrh r1, [r0]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _0801DD86
	ldr r0, _0801DDB4 @ =gBattleMoves
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x98
	beq _0801DD98
_0801DD86:
	ldr r1, _0801DDB4 @ =gBattleMoves
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x11
	beq _0801DD98
	cmp r0, 0x4E
	bne _0801DDB8
_0801DD98:
	movs r0, 0x7
	adds r1, r5, 0
	bl JumpIfMoveFailed
	movs r0, 0x1
	b _0801DDBA
	.align 2, 0
_0801DDA4: .4byte 0xfffeffff
_0801DDA8: .4byte 0xfffdffff
_0801DDAC: .4byte 0xfffbffff
_0801DDB0: .4byte gBattleWeather
_0801DDB4: .4byte gBattleMoves
_0801DDB8:
	movs r0, 0
_0801DDBA:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end AccuracyCalcHelper

	thumb_func_start sub_801DDC4
sub_801DDC4: @ 801DDC4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r0, _0801DE60 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r6, [r0, 0x5]
	ldrb r0, [r0, 0x6]
	lsls r0, 8
	orrs r6, r0
	ldr r0, _0801DE64 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0801DE48
	movs r0, 0x1
	bl sub_80EB2E0
	lsls r0, 24
	cmp r0, 0
	bne _0801DE12
	ldr r0, _0801DE68 @ =gBattleMoves
	lsls r1, r6, 1
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	beq _0801DE12
	ldr r0, _0801DE6C @ =sBattler_AI
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _0801DE56
_0801DE12:
	ldr r0, _0801DE64 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0801DE48
	movs r0, 0x2
	bl sub_80EB2E0
	lsls r0, 24
	cmp r0, 0
	bne _0801DE48
	ldr r0, _0801DE68 @ =gBattleMoves
	lsls r1, r6, 1
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _0801DE48
	ldr r0, _0801DE6C @ =sBattler_AI
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _0801DE56
_0801DE48:
	ldr r0, _0801DE64 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 9
	ands r0, r1
	cmp r0, 0
	beq _0801DE70
_0801DE56:
	movs r0, 0x7
	adds r1, r6, 0
	bl JumpIfMoveFailed
	b _0801E1C2
	.align 2, 0
_0801DE60: .4byte gUnknown_2023D74
_0801DE64: .4byte gBattleTypeFlags
_0801DE68: .4byte gBattleMoves
_0801DE6C: .4byte sBattler_AI
_0801DE70:
	adds r0, r6, 0x2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0801DF0C
	ldr r2, _0801DED4 @ =gStatuses3
	ldr r3, _0801DED8 @ =gBattlerTarget
	ldrb r4, [r3]
	lsls r0, r4, 2
	adds r0, r2
	ldr r1, [r0]
	movs r0, 0x18
	ands r1, r0
	cmp r1, 0
	beq _0801DEA8
	ldr r0, _0801DEDC @ =0x0000ffff
	cmp r6, r0
	bne _0801DEA8
	ldr r1, _0801DEE0 @ =gDisableStructs
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r1
	ldr r1, _0801DEE4 @ =sBattler_AI
	ldrb r0, [r0, 0x15]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0801DEFE
_0801DEA8:
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ldr r1, _0801DEE8 @ =0x000400c0
	ands r0, r1
	cmp r0, 0
	beq _0801DEF0
	ldr r3, _0801DEEC @ =gUnknown_2023D74
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
	b _0801E1C2
	.align 2, 0
_0801DED4: .4byte gStatuses3
_0801DED8: .4byte gBattlerTarget
_0801DEDC: .4byte 0x0000ffff
_0801DEE0: .4byte gDisableStructs
_0801DEE4: .4byte sBattler_AI
_0801DEE8: .4byte 0x000400c0
_0801DEEC: .4byte gUnknown_2023D74
_0801DEF0:
	movs r0, 0
	bl JumpIfMoveAffectedByProtect
	lsls r0, 24
	cmp r0, 0
	beq _0801DEFE
	b _0801E1C2
_0801DEFE:
	ldr r1, _0801DF08 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x7
	str r0, [r1]
	b _0801E1C2
	.align 2, 0
_0801DF08: .4byte gUnknown_2023D74
_0801DF0C:
	cmp r6, 0
	bne _0801DF14
	ldr r0, _0801DF2C @ =gCurrentMove
	ldrh r6, [r0]
_0801DF14:
	ldr r0, _0801DF30 @ =gBattleStruct
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	cmp r0, 0
	beq _0801DF34
	movs r1, 0x3F
	mov r10, r1
	mov r2, r10
	ands r2, r0
	mov r10, r2
	b _0801DF42
	.align 2, 0
_0801DF2C: .4byte gCurrentMove
_0801DF30: .4byte gBattleStruct
_0801DF34:
	ldr r1, _0801DF88 @ =gBattleMoves
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x2]
	mov r10, r0
_0801DF42:
	adds r0, r6, 0
	bl JumpIfMoveAffectedByProtect
	lsls r0, 24
	cmp r0, 0
	beq _0801DF50
	b _0801E1C2
_0801DF50:
	adds r0, r6, 0
	bl AccuracyCalcHelper
	lsls r0, 24
	cmp r0, 0
	beq _0801DF5E
	b _0801E1C2
_0801DF5E:
	ldr r3, _0801DF8C @ =gBattleMons
	ldr r0, _0801DF90 @ =gBattlerTarget
	ldrb r0, [r0]
	movs r2, 0x58
	adds r4, r0, 0
	muls r4, r2
	adds r0, r3, 0
	adds r0, 0x50
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 22
	ands r0, r1
	cmp r0, 0
	beq _0801DF98
	ldr r0, _0801DF94 @ =sBattler_AI
	ldrb r0, [r0]
	muls r0, r2
	adds r0, r3
	ldrb r5, [r0, 0x1E]
	b _0801DFAE
	.align 2, 0
_0801DF88: .4byte gBattleMoves
_0801DF8C: .4byte gBattleMons
_0801DF90: .4byte gBattlerTarget
_0801DF94: .4byte sBattler_AI
_0801DF98:
	ldr r0, _0801E0FC @ =sBattler_AI
	ldrb r0, [r0]
	muls r0, r2
	adds r0, r3
	ldrb r0, [r0, 0x1E]
	adds r0, 0x6
	adds r1, r4, r3
	ldrb r1, [r1, 0x1F]
	subs r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
_0801DFAE:
	lsls r0, r5, 24
	cmp r0, 0
	bge _0801DFB6
	movs r5, 0
_0801DFB6:
	lsls r0, r5, 24
	asrs r0, 24
	cmp r0, 0xC
	ble _0801DFC0
	movs r5, 0xC
_0801DFC0:
	ldr r1, _0801E100 @ =gBattleMoves
	lsls r4, r6, 1
	adds r0, r4, r6
	lsls r0, 2
	adds r7, r0, r1
	ldrb r3, [r7, 0x3]
	mov r8, r3
	movs r0, 0
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	lsrs r0, 24
	str r4, [sp, 0x4]
	cmp r0, 0
	bne _0801E012
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	cmp r0, 0
	bne _0801E012
	ldr r0, _0801E104 @ =gBattleWeather
	ldrh r1, [r0]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _0801E012
	ldrb r0, [r7]
	cmp r0, 0x98
	bne _0801E012
	movs r0, 0x32
	mov r8, r0
_0801E012:
	ldr r1, _0801E108 @ =gUnknown_82504FC
	lsls r0, r5, 24
	asrs r0, 22
	adds r0, r1
	ldrb r1, [r0]
	mov r4, r8
	muls r4, r1
	ldrb r1, [r0, 0x1]
	adds r0, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r7, _0801E10C @ =gBattleMons
	ldr r0, _0801E0FC @ =sBattler_AI
	ldrb r0, [r0]
	movs r5, 0x58
	muls r0, r5
	adds r0, r7
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0xE
	bne _0801E050
	lsls r0, r4, 6
	adds r0, r4
	lsls r0, 1
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r4, r0, 16
_0801E050:
	movs r0, 0
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0801E0A8
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	cmp r0, 0
	bne _0801E0A8
	ldr r0, _0801E110 @ =gBattlerTarget
	ldrb r0, [r0]
	muls r0, r5
	adds r0, r7
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x8
	bne _0801E0A8
	ldr r0, _0801E104 @ =gBattleWeather
	ldrh r1, [r0]
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	beq _0801E0A8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r4, r0, 16
_0801E0A8:
	ldr r2, _0801E10C @ =gBattleMons
	ldr r0, _0801E0FC @ =sBattler_AI
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r0, [r0]
	mov r9, r2
	cmp r0, 0x37
	bne _0801E0D4
	mov r1, r10
	cmp r1, 0x8
	bhi _0801E0D4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r4, r0, 16
_0801E0D4:
	ldr r2, _0801E110 @ =gBattlerTarget
	mov r8, r2
	ldrb r2, [r2]
	movs r7, 0x58
	adds r0, r2, 0
	muls r0, r7
	mov r3, r9
	adds r1, r0, r3
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _0801E118
	ldr r1, _0801E114 @ =gUnknown_2023F54
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r5, [r0, 0x7]
	ldrb r2, [r0, 0x1A]
	b _0801E134
	.align 2, 0
_0801E0FC: .4byte sBattler_AI
_0801E100: .4byte gBattleMoves
_0801E104: .4byte gBattleWeather
_0801E108: .4byte gUnknown_82504FC
_0801E10C: .4byte gBattleMons
_0801E110: .4byte gBattlerTarget
_0801E114: .4byte gUnknown_2023F54
_0801E118:
	ldrh r0, [r1, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r5, r0, 24
	mov r1, r8
	ldrb r0, [r1]
	muls r0, r7
	add r0, r9
	ldrh r0, [r0, 0x2E]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r2, r0, 24
_0801E134:
	ldr r0, _0801E198 @ =gUnknown_2023D6F
	ldr r1, _0801E19C @ =gBattlerTarget
	ldrb r1, [r1]
	strb r1, [r0]
	cmp r5, 0x16
	bne _0801E150
	movs r0, 0x64
	subs r0, r2
	muls r0, r4
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r4, r0, 16
_0801E150:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	adds r0, 0x1
	cmp r0, r4
	ble _0801E1BA
	ldr r2, _0801E1A0 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0801E1A4 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0801E1B0
	ldr r1, _0801E1A8 @ =gBattleMoves
	ldr r2, [sp, 0x4]
	adds r0, r2, r6
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x6]
	cmp r0, 0x8
	beq _0801E192
	cmp r0, 0x20
	bne _0801E1B0
_0801E192:
	ldr r1, _0801E1AC @ =gUnknown_2023E82
	movs r0, 0x2
	b _0801E1B4
	.align 2, 0
_0801E198: .4byte gUnknown_2023D6F
_0801E19C: .4byte gBattlerTarget
_0801E1A0: .4byte gMoveResultFlags
_0801E1A4: .4byte gBattleTypeFlags
_0801E1A8: .4byte gBattleMoves
_0801E1AC: .4byte gUnknown_2023E82
_0801E1B0:
	ldr r1, _0801E1D4 @ =gUnknown_2023E82
	movs r0, 0
_0801E1B4:
	strb r0, [r1, 0x6]
	bl CheckWonderGuardAndLevitate
_0801E1BA:
	movs r0, 0x7
	adds r1, r6, 0
	bl JumpIfMoveFailed
_0801E1C2:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E1D4: .4byte gUnknown_2023E82
	thumb_func_end sub_801DDC4

	thumb_func_start atk02_attackstring
atk02_attackstring: @ 801E1D8
	push {r4,r5,lr}
	ldr r0, _0801E218 @ =gUnknown_2023BC8
	ldr r5, [r0]
	cmp r5, 0
	bne _0801E210
	ldr r4, _0801E21C @ =gUnknown_2023DD0
	ldr r0, [r4]
	movs r1, 0xC0
	lsls r1, 3
	ands r0, r1
	cmp r0, 0
	bne _0801E204
	ldr r0, _0801E220 @ =sBattler_AI
	ldrb r1, [r0]
	movs r0, 0x4
	bl PrepareStringBattle
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 3
	orrs r0, r1
	str r0, [r4]
_0801E204:
	ldr r0, _0801E224 @ =gUnknown_2023D74
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	ldr r0, _0801E228 @ =gUnknown_2023E82
	strb r5, [r0, 0x7]
_0801E210:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801E218: .4byte gUnknown_2023BC8
_0801E21C: .4byte gUnknown_2023DD0
_0801E220: .4byte sBattler_AI
_0801E224: .4byte gUnknown_2023D74
_0801E228: .4byte gUnknown_2023E82
	thumb_func_end atk02_attackstring

	thumb_func_start atk03_ppreduce
atk03_ppreduce: @ 801E22C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r6, 0x1
	ldr r0, _0801E27C @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	beq _0801E244
	b _0801E3DE
_0801E244:
	ldr r1, _0801E280 @ =gUnknown_2023ECC
	ldr r2, _0801E284 @ =sBattler_AI
	ldrb r3, [r2]
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 26
	lsrs r4, r0, 31
	mov r9, r2
	cmp r4, 0
	bne _0801E2E6
	ldr r2, _0801E288 @ =gBattleMoves
	ldr r0, _0801E28C @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x6]
	cmp r0, 0x20
	beq _0801E296
	cmp r0, 0x20
	bgt _0801E290
	cmp r0, 0x8
	beq _0801E2AC
	b _0801E2C6
	.align 2, 0
_0801E27C: .4byte gUnknown_2023BC8
_0801E280: .4byte gUnknown_2023ECC
_0801E284: .4byte sBattler_AI
_0801E288: .4byte gBattleMoves
_0801E28C: .4byte gCurrentMove
_0801E290:
	cmp r0, 0x40
	beq _0801E2AC
	b _0801E2C6
_0801E296:
	str r4, [sp]
	movs r0, 0x12
	adds r1, r3, 0
	movs r2, 0x2E
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0x1
	b _0801E2E6
_0801E2AC:
	mov r0, r9
	ldrb r1, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x10
	movs r2, 0x2E
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0
	b _0801E2E6
_0801E2C6:
	ldr r1, _0801E348 @ =gBattlerTarget
	mov r2, r9
	ldrb r0, [r2]
	ldrb r7, [r1]
	cmp r0, r7
	beq _0801E2E6
	ldr r2, _0801E34C @ =gBattleMons
	ldrb r1, [r1]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x2E
	bne _0801E2E6
	adds r6, 0x1
_0801E2E6:
	ldr r0, _0801E350 @ =gUnknown_2023DD0
	ldr r4, [r0]
	movs r0, 0xA0
	lsls r0, 4
	ands r4, r0
	cmp r4, 0
	bne _0801E3CC
	ldr r2, _0801E34C @ =gBattleMons
	ldr r3, _0801E354 @ =gUnknown_2023D48
	ldr r1, _0801E358 @ =sBattler_AI
	ldrb r5, [r1]
	movs r0, 0x58
	mov r8, r0
	mov r0, r8
	muls r0, r5
	ldrb r7, [r3]
	adds r0, r7
	movs r7, 0x24
	adds r7, r2
	mov r12, r7
	add r0, r12
	ldrb r0, [r0]
	mov r9, r1
	mov r10, r2
	adds r7, r3, 0
	cmp r0, 0
	beq _0801E3CC
	ldr r0, _0801E35C @ =gUnknown_2023E8C
	lsls r1, r5, 4
	adds r1, r0
	ldrb r0, [r1, 0x2]
	movs r2, 0x8
	orrs r0, r2
	strb r0, [r1, 0x2]
	mov r1, r9
	ldrb r0, [r1]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	ldrb r1, [r7]
	adds r0, r1
	mov r1, r12
	adds r2, r0, r1
	ldrb r0, [r2]
	cmp r0, r6
	ble _0801E360
	subs r0, r6
	strb r0, [r2]
	b _0801E362
	.align 2, 0
_0801E348: .4byte gBattlerTarget
_0801E34C: .4byte gBattleMons
_0801E350: .4byte gUnknown_2023DD0
_0801E354: .4byte gUnknown_2023D48
_0801E358: .4byte sBattler_AI
_0801E35C: .4byte gUnknown_2023E8C
_0801E360:
	strb r4, [r2]
_0801E362:
	mov r2, r9
	ldrb r3, [r2]
	movs r4, 0x58
	adds r0, r3, 0
	muls r0, r4
	mov r1, r10
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _0801E3CC
	ldr r1, _0801E3F0 @ =gDisableStructs
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _0801E3F4 @ =gBitTable
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0801E3CC
	ldr r0, _0801E3F8 @ =gActiveBattler
	strb r3, [r0]
	ldrb r1, [r7]
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	mov r2, r9
	ldrb r0, [r2]
	muls r0, r4
	mov r2, r10
	adds r2, 0x24
	adds r0, r2
	ldrb r7, [r7]
	adds r0, r7
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl EmitSetMonData
	mov r7, r9
	ldrb r0, [r7]
	bl MarkBufferBankForExecution
_0801E3CC:
	ldr r2, _0801E3FC @ =gUnknown_2023DD0
	ldr r0, [r2]
	ldr r1, _0801E400 @ =0xfffff7ff
	ands r0, r1
	str r0, [r2]
	ldr r1, _0801E404 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_0801E3DE:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E3F0: .4byte gDisableStructs
_0801E3F4: .4byte gBitTable
_0801E3F8: .4byte gActiveBattler
_0801E3FC: .4byte gUnknown_2023DD0
_0801E400: .4byte 0xfffff7ff
_0801E404: .4byte gUnknown_2023D74
	thumb_func_end atk03_ppreduce

	thumb_func_start sub_801E408
sub_801E408: @ 801E408
	push {r4-r7,lr}
	ldr r1, _0801E42C @ =gBattleMons
	ldr r0, _0801E430 @ =sBattler_AI
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	cmp r0, 0xAF
	bne _0801E438
	ldr r1, _0801E434 @ =gUnknown_2023F54
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r6, [r0, 0x7]
	b _0801E440
	.align 2, 0
_0801E42C: .4byte gBattleMons
_0801E430: .4byte sBattler_AI
_0801E434: .4byte gUnknown_2023F54
_0801E438:
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r6, r0, 24
_0801E440:
	ldr r1, _0801E4CC @ =gUnknown_2023D6F
	ldr r3, _0801E4D0 @ =sBattler_AI
	ldrb r0, [r3]
	strb r0, [r1]
	ldr r4, _0801E4D4 @ =gBattleMons
	ldrb r1, [r3]
	movs r0, 0x58
	adds r7, r1, 0
	muls r7, r0
	adds r0, r4, 0
	adds r0, 0x50
	adds r0, r7, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 13
	ands r0, r1
	negs r0, r0
	asrs r5, r0, 31
	movs r0, 0x2
	ands r5, r0
	ldr r2, _0801E4D8 @ =gBattleMoves
	ldr r0, _0801E4DC @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	mov r12, r3
	cmp r1, 0x2B
	bne _0801E480
	adds r5, 0x1
_0801E480:
	adds r0, r5, 0
	cmp r1, 0x4B
	bne _0801E488
	adds r0, 0x1
_0801E488:
	cmp r1, 0xC8
	bne _0801E48E
	adds r0, 0x1
_0801E48E:
	adds r2, r0, 0
	cmp r1, 0xD1
	bne _0801E496
	adds r2, 0x1
_0801E496:
	movs r1, 0
	cmp r6, 0x3F
	bne _0801E4A6
	adds r0, r7, r4
	ldrh r0, [r0]
	cmp r0, 0x71
	bne _0801E4A6
	movs r1, 0x1
_0801E4A6:
	lsls r5, r1, 1
	movs r3, 0
	cmp r6, 0x42
	bne _0801E4C0
	mov r0, r12
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, 0x53
	bne _0801E4C0
	movs r3, 0x1
_0801E4C0:
	lsls r1, r3, 1
	cmp r6, 0x29
	bne _0801E4E0
	adds r0, r5, 0x1
	adds r0, r2, r0
	b _0801E4E2
	.align 2, 0
_0801E4CC: .4byte gUnknown_2023D6F
_0801E4D0: .4byte sBattler_AI
_0801E4D4: .4byte gBattleMons
_0801E4D8: .4byte gBattleMoves
_0801E4DC: .4byte gCurrentMove
_0801E4E0:
	adds r0, r2, r5
_0801E4E2:
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	adds r5, r0, 0
	cmp r5, 0x4
	bls _0801E4F0
	movs r5, 0x4
_0801E4F0:
	ldr r0, _0801E56C @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r4
	adds r0, 0x20
	ldrb r4, [r0]
	cmp r4, 0x4
	beq _0801E580
	cmp r4, 0x4B
	beq _0801E580
	ldr r1, _0801E570 @ =gStatuses3
	mov r2, r12
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	bne _0801E580
	ldr r4, _0801E574 @ =gBattleTypeFlags
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 2
	ands r0, r1
	cmp r0, 0
	bne _0801E580
	bl Random
	ldr r2, _0801E578 @ =gUnknown_8250530
	lsls r1, r5, 1
	adds r1, r2
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r1]
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	bne _0801E580
	ldr r0, [r4]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0801E55A
	movs r0, 0x1
	bl sub_80EB2E0
	lsls r0, 24
	cmp r0, 0
	beq _0801E580
_0801E55A:
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 9
	ands r0, r1
	cmp r0, 0
	bne _0801E580
	ldr r1, _0801E57C @ =gCritMultiplier
	movs r0, 0x2
	b _0801E584
	.align 2, 0
_0801E56C: .4byte gBattlerTarget
_0801E570: .4byte gStatuses3
_0801E574: .4byte gBattleTypeFlags
_0801E578: .4byte gUnknown_8250530
_0801E57C: .4byte gCritMultiplier
_0801E580:
	ldr r1, _0801E594 @ =gCritMultiplier
	movs r0, 0x1
_0801E584:
	strb r0, [r1]
	ldr r1, _0801E598 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E594: .4byte gCritMultiplier
_0801E598: .4byte gUnknown_2023D74
	thumb_func_end sub_801E408

	thumb_func_start atk05_damagecalc
atk05_damagecalc: @ 801E59C
	push {r4-r7,lr}
	sub sp, 0x10
	ldr r4, _0801E654 @ =gSideAffecting
	ldr r5, _0801E658 @ =gBattlerTarget
	ldrb r0, [r5]
	bl GetBankIdentity
	movs r1, 0x1
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	ldrh r3, [r1]
	ldr r6, _0801E65C @ =sBattler_AI
	ldrb r0, [r6]
	movs r4, 0x58
	muls r0, r4
	ldr r2, _0801E660 @ =gBattleMons
	adds r0, r2
	ldrb r1, [r5]
	muls r1, r4
	adds r1, r2
	ldr r7, _0801E664 @ =gCurrentMove
	ldrh r2, [r7]
	ldr r4, _0801E668 @ =gDynamicBasePower
	ldrh r4, [r4]
	str r4, [sp]
	ldr r4, _0801E66C @ =gBattleStruct
	ldr r4, [r4]
	ldrb r4, [r4, 0x13]
	str r4, [sp, 0x4]
	ldrb r4, [r6]
	str r4, [sp, 0x8]
	ldrb r4, [r5]
	str r4, [sp, 0xC]
	bl sub_803ECEC
	ldr r4, _0801E670 @ =gBattleMoveDamage
	ldr r1, _0801E674 @ =gCritMultiplier
	ldrb r1, [r1]
	muls r1, r0
	ldr r0, _0801E678 @ =gBattleScripting
	ldrb r0, [r0, 0xE]
	adds r3, r1, 0
	muls r3, r0
	str r3, [r4]
	ldr r1, _0801E67C @ =gStatuses3
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 2
	ands r0, r1
	cmp r0, 0
	beq _0801E620
	ldr r2, _0801E680 @ =gBattleMoves
	ldrh r1, [r7]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	cmp r0, 0xD
	bne _0801E620
	lsls r0, r3, 1
	str r0, [r4]
_0801E620:
	ldr r1, _0801E684 @ =gUnknown_2023E8C
	ldr r0, _0801E65C @ =sBattler_AI
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 28
	cmp r0, 0
	bge _0801E642
	ldr r4, _0801E670 @ =gBattleMoveDamage
	ldr r1, [r4]
	lsls r0, r1, 4
	subs r0, r1
	movs r1, 0xA
	bl __divsi3
	str r0, [r4]
_0801E642:
	ldr r1, _0801E688 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E654: .4byte gSideAffecting
_0801E658: .4byte gBattlerTarget
_0801E65C: .4byte sBattler_AI
_0801E660: .4byte gBattleMons
_0801E664: .4byte gCurrentMove
_0801E668: .4byte gDynamicBasePower
_0801E66C: .4byte gBattleStruct
_0801E670: .4byte gBattleMoveDamage
_0801E674: .4byte gCritMultiplier
_0801E678: .4byte gBattleScripting
_0801E67C: .4byte gStatuses3
_0801E680: .4byte gBattleMoves
_0801E684: .4byte gUnknown_2023E8C
_0801E688: .4byte gUnknown_2023D74
	thumb_func_end atk05_damagecalc

	thumb_func_start AI_CalcDmg
AI_CalcDmg: @ 801E68C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r5, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _0801E744 @ =gSideAffecting
	adds r0, r5, 0
	bl GetBankIdentity
	movs r1, 0x1
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	ldrh r3, [r1]
	movs r1, 0x58
	adds r0, r7, 0
	muls r0, r1
	ldr r2, _0801E748 @ =gBattleMons
	adds r0, r2
	muls r1, r5
	adds r1, r2
	ldr r2, _0801E74C @ =gCurrentMove
	mov r8, r2
	ldrh r2, [r2]
	ldr r6, _0801E750 @ =gDynamicBasePower
	ldrh r4, [r6]
	str r4, [sp]
	ldr r4, _0801E754 @ =gBattleStruct
	ldr r4, [r4]
	ldrb r4, [r4, 0x13]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	str r5, [sp, 0xC]
	bl sub_803ECEC
	ldr r4, _0801E758 @ =gBattleMoveDamage
	movs r1, 0
	strh r1, [r6]
	ldr r1, _0801E75C @ =gCritMultiplier
	ldrb r1, [r1]
	muls r1, r0
	ldr r0, _0801E760 @ =gBattleScripting
	ldrb r0, [r0, 0xE]
	adds r3, r1, 0
	muls r3, r0
	str r3, [r4]
	ldr r1, _0801E764 @ =gStatuses3
	lsls r0, r7, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 2
	ands r0, r1
	cmp r0, 0
	beq _0801E71A
	ldr r2, _0801E768 @ =gBattleMoves
	mov r0, r8
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	cmp r0, 0xD
	bne _0801E71A
	lsls r0, r3, 1
	str r0, [r4]
_0801E71A:
	ldr r0, _0801E76C @ =gUnknown_2023E8C
	lsls r1, r7, 4
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 28
	cmp r0, 0
	bge _0801E738
	ldr r4, _0801E758 @ =gBattleMoveDamage
	ldr r1, [r4]
	lsls r0, r1, 4
	subs r0, r1
	movs r1, 0xA
	bl __divsi3
	str r0, [r4]
_0801E738:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E744: .4byte gSideAffecting
_0801E748: .4byte gBattleMons
_0801E74C: .4byte gCurrentMove
_0801E750: .4byte gDynamicBasePower
_0801E754: .4byte gBattleStruct
_0801E758: .4byte gBattleMoveDamage
_0801E75C: .4byte gCritMultiplier
_0801E760: .4byte gBattleScripting
_0801E764: .4byte gStatuses3
_0801E768: .4byte gBattleMoves
_0801E76C: .4byte gUnknown_2023E8C
	thumb_func_end AI_CalcDmg

	thumb_func_start ModulateDmgByType
ModulateDmgByType: @ 801E770
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _0801E7A0 @ =gBattleMoveDamage
	ldr r0, [r5]
	muls r0, r4
	movs r1, 0xA
	bl __divsi3
	str r0, [r5]
	cmp r0, 0
	bne _0801E790
	cmp r4, 0
	beq _0801E790
	movs r0, 0x1
	str r0, [r5]
_0801E790:
	cmp r4, 0x5
	beq _0801E7C0
	cmp r4, 0x5
	bgt _0801E7A4
	cmp r4, 0
	beq _0801E7AA
	b _0801E842
	.align 2, 0
_0801E7A0: .4byte gBattleMoveDamage
_0801E7A4:
	cmp r4, 0x14
	beq _0801E800
	b _0801E842
_0801E7AA:
	ldr r2, _0801E7BC @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	movs r1, 0xFB
	ands r0, r1
	movs r1, 0xFD
	ands r0, r1
	b _0801E840
	.align 2, 0
_0801E7BC: .4byte gMoveResultFlags
_0801E7C0:
	ldr r2, _0801E7F0 @ =gBattleMoves
	ldr r0, _0801E7F4 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _0801E842
	ldr r2, _0801E7F8 @ =gMoveResultFlags
	ldrb r1, [r2]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _0801E842
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0801E7FC
	movs r0, 0xFD
	ands r0, r1
	b _0801E840
	.align 2, 0
_0801E7F0: .4byte gBattleMoves
_0801E7F4: .4byte gCurrentMove
_0801E7F8: .4byte gMoveResultFlags
_0801E7FC:
	movs r0, 0x4
	b _0801E83E
_0801E800:
	ldr r2, _0801E830 @ =gBattleMoves
	ldr r0, _0801E834 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _0801E842
	ldr r2, _0801E838 @ =gMoveResultFlags
	ldrb r1, [r2]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _0801E842
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0801E83C
	movs r0, 0xFB
	ands r0, r1
	b _0801E840
	.align 2, 0
_0801E830: .4byte gBattleMoves
_0801E834: .4byte gCurrentMove
_0801E838: .4byte gMoveResultFlags
_0801E83C:
	movs r0, 0x2
_0801E83E:
	orrs r0, r1
_0801E840:
	strb r0, [r2]
_0801E842:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ModulateDmgByType

	thumb_func_start atk06_typecalc
atk06_typecalc: @ 801E848
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r3, 0
	ldr r1, _0801E870 @ =gCurrentMove
	ldrh r0, [r1]
	cmp r0, 0xA5
	bne _0801E85C
	b _0801EA70
_0801E85C:
	ldr r0, _0801E874 @ =gBattleStruct
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	cmp r0, 0
	beq _0801E878
	movs r1, 0x3F
	mov r8, r1
	ands r1, r0
	mov r8, r1
	b _0801E888
	.align 2, 0
_0801E870: .4byte gCurrentMove
_0801E874: .4byte gBattleStruct
_0801E878:
	ldr r2, _0801E910 @ =gBattleMoves
	ldrh r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	mov r8, r0
_0801E888:
	ldr r2, _0801E914 @ =gBattleMons
	ldr r0, _0801E918 @ =sBattler_AI
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	adds r5, r2, 0
	cmp r0, r8
	beq _0801E8AA
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, r8
	bne _0801E8C0
_0801E8AA:
	ldr r4, _0801E91C @ =gBattleMoveDamage
	ldr r1, [r4]
	lsls r0, r1, 4
	subs r0, r1
	str r0, [r4]
	movs r1, 0xA
	str r3, [sp, 0x4]
	bl __divsi3
	str r0, [r4]
	ldr r3, [sp, 0x4]
_0801E8C0:
	ldr r2, _0801E920 @ =gBattlerTarget
	ldrb r1, [r2]
	movs r0, 0x58
	muls r0, r1
	adds r0, r5
	adds r0, 0x20
	ldrb r0, [r0]
	adds r4, r2, 0
	cmp r0, 0x1A
	bne _0801E938
	mov r1, r8
	cmp r1, 0x4
	bne _0801E938
	ldr r3, _0801E924 @ =gUnknown_2023D6A
	strb r0, [r3]
	ldr r2, _0801E928 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x9
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0801E92C @ =gUnknown_2023DA0
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	movs r2, 0
	strh r2, [r0]
	ldr r1, _0801E930 @ =gUnknown_2023DA8
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	strh r2, [r0]
	ldr r0, _0801E934 @ =gUnknown_2023E82
	mov r1, r8
	strb r1, [r0, 0x6]
	ldrb r0, [r4]
	ldrb r1, [r3]
	bl sub_80C71D0
	b _0801E9D4
	.align 2, 0
_0801E910: .4byte gBattleMoves
_0801E914: .4byte gBattleMons
_0801E918: .4byte sBattler_AI
_0801E91C: .4byte gBattleMoveDamage
_0801E920: .4byte gBattlerTarget
_0801E924: .4byte gUnknown_2023D6A
_0801E928: .4byte gMoveResultFlags
_0801E92C: .4byte gUnknown_2023DA0
_0801E930: .4byte gUnknown_2023DA8
_0801E934: .4byte gUnknown_2023E82
_0801E938:
	ldr r1, _0801E944 @ =gUnknown_824F050
	adds r0, r3, r1
	ldrb r0, [r0]
	adds r2, r1, 0
	b _0801E9B4
	.align 2, 0
_0801E944: .4byte gUnknown_824F050
_0801E948:
	adds r3, 0x3
	b _0801E9B0
_0801E94C:
	ldr r5, _0801EA84 @ =gUnknown_824F050
	adds r0, r3, r5
	ldrb r0, [r0]
	cmp r0, r8
	bne _0801E9A8
	adds r1, r3, 0x1
	adds r1, r5
	ldr r2, _0801EA88 @ =gBattleMons
	ldr r7, _0801EA8C @ =gBattlerTarget
	ldrb r0, [r7]
	movs r6, 0x58
	muls r0, r6
	adds r0, r2
	adds r0, 0x21
	ldrb r4, [r1]
	ldrb r0, [r0]
	cmp r4, r0
	bne _0801E982
	adds r0, r3, 0x2
	adds r0, r5
	ldrb r0, [r0]
	str r2, [sp]
	str r3, [sp, 0x4]
	bl ModulateDmgByType
	ldr r3, [sp, 0x4]
	ldr r2, [sp]
_0801E982:
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r2
	adds r1, r0, 0
	adds r1, 0x22
	ldrb r1, [r1]
	cmp r4, r1
	bne _0801E9A8
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, r4
	beq _0801E9A8
	adds r0, r3, 0x2
	adds r0, r5
	ldrb r0, [r0]
	str r3, [sp, 0x4]
	bl ModulateDmgByType
	ldr r3, [sp, 0x4]
_0801E9A8:
	adds r3, 0x3
	ldr r5, _0801EA88 @ =gBattleMons
	ldr r4, _0801EA8C @ =gBattlerTarget
	ldr r2, _0801EA84 @ =gUnknown_824F050
_0801E9B0:
	adds r0, r3, r2
	ldrb r0, [r0]
_0801E9B4:
	cmp r0, 0xFF
	beq _0801E9D4
	cmp r0, 0xFE
	bne _0801E94C
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	adds r1, r5, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 22
	ands r0, r1
	cmp r0, 0
	beq _0801E948
_0801E9D4:
	ldr r2, _0801EA88 @ =gBattleMons
	ldr r5, _0801EA8C @ =gBattlerTarget
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r6, [r0]
	cmp r6, 0x19
	bne _0801EA52
	ldr r0, _0801EA90 @ =sBattler_AI
	ldrb r0, [r0]
	ldr r7, _0801EA94 @ =gCurrentMove
	ldrh r1, [r7]
	bl AttacksThisTurn
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0801EA52
	ldr r1, _0801EA98 @ =gMoveResultFlags
	mov r8, r1
	ldrb r4, [r1]
	ands r0, r4
	cmp r0, 0
	beq _0801EA10
	movs r0, 0x6
	ands r0, r4
	cmp r0, 0x6
	bne _0801EA52
_0801EA10:
	ldr r2, _0801EA9C @ =gBattleMoves
	ldrh r1, [r7]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _0801EA52
	ldr r3, _0801EAA0 @ =gUnknown_2023D6A
	strb r6, [r3]
	movs r0, 0x1
	orrs r0, r4
	mov r1, r8
	strb r0, [r1]
	ldr r1, _0801EAA4 @ =gUnknown_2023DA0
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	movs r2, 0
	strh r2, [r0]
	ldr r1, _0801EAA8 @ =gUnknown_2023DA8
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	strh r2, [r0]
	ldr r1, _0801EAAC @ =gUnknown_2023E82
	movs r0, 0x3
	strb r0, [r1, 0x6]
	ldrb r0, [r5]
	ldrb r1, [r3]
	bl sub_80C71D0
_0801EA52:
	ldr r0, _0801EA98 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0801EA70
	ldr r2, _0801EAB0 @ =gUnknown_2023E8C
	ldr r0, _0801EA90 @ =sBattler_AI
	ldrb r1, [r0]
	lsls r1, 4
	adds r1, r2
	ldrb r0, [r1, 0x1]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1, 0x1]
_0801EA70:
	ldr r1, _0801EAB4 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801EA84: .4byte gUnknown_824F050
_0801EA88: .4byte gBattleMons
_0801EA8C: .4byte gBattlerTarget
_0801EA90: .4byte sBattler_AI
_0801EA94: .4byte gCurrentMove
_0801EA98: .4byte gMoveResultFlags
_0801EA9C: .4byte gBattleMoves
_0801EAA0: .4byte gUnknown_2023D6A
_0801EAA4: .4byte gUnknown_2023DA0
_0801EAA8: .4byte gUnknown_2023DA8
_0801EAAC: .4byte gUnknown_2023E82
_0801EAB0: .4byte gUnknown_2023E8C
_0801EAB4: .4byte gUnknown_2023D74
	thumb_func_end atk06_typecalc

	thumb_func_start CheckWonderGuardAndLevitate
CheckWonderGuardAndLevitate: @ 801EAB8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r6, 0
	movs r5, 0
	ldr r0, _0801EAF8 @ =gCurrentMove
	ldrh r1, [r0]
	mov r9, r0
	cmp r1, 0xA5
	bne _0801EAD0
	b _0801ED18
_0801EAD0:
	ldr r2, _0801EAFC @ =gBattleMoves
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _0801EAE2
	b _0801ED18
_0801EAE2:
	ldr r0, _0801EB00 @ =gBattleStruct
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	cmp r0, 0
	beq _0801EB04
	movs r1, 0x3F
	mov r12, r1
	mov r2, r12
	ands r2, r0
	mov r12, r2
	b _0801EB08
	.align 2, 0
_0801EAF8: .4byte gCurrentMove
_0801EAFC: .4byte gBattleMoves
_0801EB00: .4byte gBattleStruct
_0801EB04:
	ldrb r1, [r1, 0x2]
	mov r12, r1
_0801EB08:
	ldr r2, _0801EB3C @ =gBattleMons
	ldr r3, _0801EB40 @ =gBattlerTarget
	ldrb r1, [r3]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r1, [r0]
	adds r7, r2, 0
	mov r8, r3
	cmp r1, 0x1A
	bne _0801EB4C
	mov r0, r12
	cmp r0, 0x4
	bne _0801EB4C
	ldr r0, _0801EB44 @ =gUnknown_2023D6A
	strb r1, [r0]
	ldr r0, _0801EB48 @ =gUnknown_2023E82
	mov r1, r12
	strb r1, [r0, 0x6]
	ldrb r0, [r3]
	movs r1, 0x1A
	bl sub_80C71D0
	b _0801ED18
	.align 2, 0
_0801EB3C: .4byte gBattleMons
_0801EB40: .4byte gBattlerTarget
_0801EB44: .4byte gUnknown_2023D6A
_0801EB48: .4byte gUnknown_2023E82
_0801EB4C:
	ldr r1, _0801EB58 @ =gUnknown_824F050
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r4, r1, 0
	b _0801EC9E
	.align 2, 0
_0801EB58: .4byte gUnknown_824F050
_0801EB5C:
	adds r0, r5, r4
	ldrb r0, [r0]
	cmp r0, r12
	beq _0801EB66
	b _0801EC98
_0801EB66:
	adds r2, r5, 0x1
	adds r3, r2, r4
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r7
	adds r0, 0x21
	ldrb r1, [r3]
	adds r3, r2, 0
	ldrb r0, [r0]
	cmp r1, r0
	bne _0801EBA6
	adds r0, r5, 0x2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0801EBA6
	ldr r2, _0801ED24 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0801ED28 @ =gUnknown_2023E8C
	ldr r0, _0801ED2C @ =sBattler_AI
	ldrb r2, [r0]
	lsls r2, 4
	adds r2, r1
	ldrb r0, [r2, 0x1]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2, 0x1]
_0801EBA6:
	adds r2, r3, r4
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r7
	adds r1, r0, 0
	adds r1, 0x22
	ldrb r2, [r2]
	ldrb r1, [r1]
	cmp r2, r1
	bne _0801EBEC
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, r2
	beq _0801EBEC
	adds r0, r5, 0x2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0801EBEC
	ldr r2, _0801ED24 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0801ED28 @ =gUnknown_2023E8C
	ldr r0, _0801ED2C @ =sBattler_AI
	ldrb r2, [r0]
	lsls r2, 4
	adds r2, r1
	ldrb r0, [r2, 0x1]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2, 0x1]
_0801EBEC:
	adds r2, r3, r4
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r7
	adds r0, 0x21
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0801EC10
	adds r0, r5, 0x2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x14
	bne _0801EC10
	movs r0, 0x1
	orrs r6, r0
_0801EC10:
	adds r2, r3, r4
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r7
	adds r1, r0, 0
	adds r1, 0x22
	ldrb r2, [r2]
	ldrb r1, [r1]
	cmp r2, r1
	bne _0801EC3E
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, r2
	beq _0801EC3E
	adds r0, r5, 0x2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x14
	bne _0801EC3E
	movs r0, 0x1
	orrs r6, r0
_0801EC3E:
	adds r2, r3, r4
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r7
	adds r0, 0x21
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0801EC66
	adds r0, r5, 0x2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x5
	bne _0801EC66
	movs r0, 0x2
	orrs r6, r0
	lsls r0, r6, 24
	lsrs r6, r0, 24
_0801EC66:
	adds r2, r3, r4
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r7
	adds r1, r0, 0
	adds r1, 0x22
	ldrb r2, [r2]
	ldrb r1, [r1]
	cmp r2, r1
	bne _0801EC98
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, r2
	beq _0801EC98
	adds r0, r5, 0x2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x5
	bne _0801EC98
	movs r0, 0x2
	orrs r6, r0
	lsls r0, r6, 24
	lsrs r6, r0, 24
_0801EC98:
	adds r5, 0x3
	adds r0, r5, r4
	ldrb r0, [r0]
_0801EC9E:
	cmp r0, 0xFF
	beq _0801ECC2
	cmp r0, 0xFE
	beq _0801ECA8
	b _0801EB5C
_0801ECA8:
	mov r2, r8
	ldrb r1, [r2]
	movs r0, 0x58
	muls r0, r1
	adds r1, r7, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 22
	ands r0, r1
	cmp r0, 0
	beq _0801EC98
_0801ECC2:
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r7
	adds r0, 0x20
	ldrb r4, [r0]
	cmp r4, 0x19
	bne _0801ED18
	ldr r0, _0801ED2C @ =sBattler_AI
	ldrb r0, [r0]
	mov r2, r9
	ldrh r1, [r2]
	bl AttacksThisTurn
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0801ED18
	movs r0, 0x3
	ands r6, r0
	cmp r6, 0x1
	beq _0801ED18
	ldr r2, _0801ED30 @ =gBattleMoves
	mov r0, r9
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _0801ED18
	ldr r0, _0801ED34 @ =gUnknown_2023D6A
	strb r4, [r0]
	ldr r1, _0801ED38 @ =gUnknown_2023E82
	movs r0, 0x3
	strb r0, [r1, 0x6]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x19
	bl sub_80C71D0
_0801ED18:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801ED24: .4byte gMoveResultFlags
_0801ED28: .4byte gUnknown_2023E8C
_0801ED2C: .4byte sBattler_AI
_0801ED30: .4byte gBattleMoves
_0801ED34: .4byte gUnknown_2023D6A
_0801ED38: .4byte gUnknown_2023E82
	thumb_func_end CheckWonderGuardAndLevitate

	thumb_func_start ModulateDmgByType2
ModulateDmgByType2: @ 801ED3C
	push {r4-r7,lr}
	adds r6, r2, 0
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r7, _0801ED70 @ =gBattleMoveDamage
	ldr r0, [r7]
	muls r0, r4
	movs r1, 0xA
	bl __divsi3
	str r0, [r7]
	cmp r0, 0
	bne _0801ED62
	cmp r4, 0
	beq _0801ED62
	movs r0, 0x1
	str r0, [r7]
_0801ED62:
	cmp r4, 0x5
	beq _0801ED8A
	cmp r4, 0x5
	bgt _0801ED74
	cmp r4, 0
	beq _0801ED7A
	b _0801EDEE
	.align 2, 0
_0801ED70: .4byte gBattleMoveDamage
_0801ED74:
	cmp r4, 0x14
	beq _0801EDBC
	b _0801EDEE
_0801ED7A:
	ldrb r0, [r6]
	movs r1, 0x8
	orrs r0, r1
	movs r1, 0xFB
	ands r0, r1
	movs r1, 0xFD
	ands r0, r1
	b _0801EDEC
_0801ED8A:
	ldr r0, _0801EDB4 @ =gBattleMoves
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	beq _0801EDEE
	ldrb r1, [r6]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _0801EDEE
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0801EDB8
	movs r0, 0xFD
	ands r0, r1
	b _0801EDEC
	.align 2, 0
_0801EDB4: .4byte gBattleMoves
_0801EDB8:
	movs r0, 0x4
	b _0801EDEA
_0801EDBC:
	ldr r0, _0801EDE4 @ =gBattleMoves
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	beq _0801EDEE
	ldrb r1, [r6]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _0801EDEE
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0801EDE8
	movs r0, 0xFB
	ands r0, r1
	b _0801EDEC
	.align 2, 0
_0801EDE4: .4byte gBattleMoves
_0801EDE8:
	movs r0, 0x2
_0801EDEA:
	orrs r0, r1
_0801EDEC:
	strb r0, [r6]
_0801EDEE:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ModulateDmgByType2

	thumb_func_start TypeCalc
TypeCalc: @ 801EDF4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x4]
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	movs r0, 0
	mov r8, r0
	mov r0, sp
	mov r1, r8
	strb r1, [r0]
	mov r2, r10
	cmp r2, 0xA5
	bne _0801EE26
	movs r0, 0
	b _0801EFAE
_0801EE26:
	ldr r1, _0801EE94 @ =gBattleMoves
	mov r3, r10
	lsls r2, r3, 1
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x2]
	str r0, [sp, 0x8]
	ldr r1, _0801EE98 @ =gBattleMons
	movs r0, 0x58
	ldr r3, [sp, 0x4]
	muls r0, r3
	adds r3, r0, r1
	adds r0, r3, 0
	adds r0, 0x21
	ldrb r0, [r0]
	str r2, [sp, 0xC]
	adds r5, r1, 0
	ldr r1, [sp, 0x8]
	cmp r0, r1
	beq _0801EE5A
	adds r0, r3, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, r1
	bne _0801EE6C
_0801EE5A:
	ldr r4, _0801EE9C @ =gBattleMoveDamage
	ldr r1, [r4]
	lsls r0, r1, 4
	subs r0, r1
	str r0, [r4]
	movs r1, 0xA
	bl __divsi3
	str r0, [r4]
_0801EE6C:
	movs r0, 0x58
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	adds r0, r5
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1A
	bne _0801EEA0
	ldr r3, [sp, 0x8]
	cmp r3, 0x4
	bne _0801EEA0
	movs r1, 0x9
	mov r0, sp
	ldrb r0, [r0]
	orrs r0, r1
	mov r1, sp
	strb r0, [r1]
	b _0801EF50
	.align 2, 0
_0801EE94: .4byte gBattleMoves
_0801EE98: .4byte gBattleMons
_0801EE9C: .4byte gBattleMoveDamage
_0801EEA0:
	ldr r1, _0801EEBC @ =gUnknown_824F050
	mov r2, r8
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0xFF
	beq _0801EF50
	cmp r0, 0xFE
	bne _0801EEC6
	movs r0, 0x58
	mov r3, r9
	muls r3, r0
	adds r0, r3, 0
	b _0801EF3E
	.align 2, 0
_0801EEBC: .4byte gUnknown_824F050
_0801EEC0:
	movs r0, 0x3
	add r8, r0
	b _0801EF28
_0801EEC6:
	ldr r7, _0801EFC0 @ =gUnknown_824F050
	mov r1, r8
	adds r0, r1, r7
	ldrb r0, [r0]
	ldr r2, [sp, 0x8]
	cmp r0, r2
	bne _0801EF20
	adds r1, 0x1
	adds r1, r7
	ldr r2, _0801EFC4 @ =gBattleMons
	movs r0, 0x58
	mov r3, r9
	muls r3, r0
	adds r0, r3, 0
	adds r5, r0, r2
	adds r6, r5, 0
	adds r6, 0x21
	ldrb r4, [r1]
	ldrb r0, [r6]
	cmp r4, r0
	bne _0801EF00
	mov r0, r8
	adds r0, 0x2
	adds r0, r7
	ldrb r0, [r0]
	mov r1, r10
	mov r2, sp
	bl ModulateDmgByType2
_0801EF00:
	adds r0, r5, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r4, r0
	bne _0801EF20
	ldrb r0, [r6]
	cmp r0, r4
	beq _0801EF20
	mov r0, r8
	adds r0, 0x2
	adds r0, r7
	ldrb r0, [r0]
	mov r1, r10
	mov r2, sp
	bl ModulateDmgByType2
_0801EF20:
	movs r1, 0x3
	add r8, r1
	ldr r5, _0801EFC4 @ =gBattleMons
	ldr r2, _0801EFC0 @ =gUnknown_824F050
_0801EF28:
	mov r3, r8
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _0801EF50
	cmp r0, 0xFE
	bne _0801EEC6
	movs r0, 0x58
	mov r1, r9
	muls r1, r0
	adds r0, r1, 0
_0801EF3E:
	adds r1, r5, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 22
	ands r0, r1
	cmp r0, 0
	beq _0801EEC0
_0801EF50:
	movs r0, 0x58
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	adds r0, r5
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x19
	bne _0801EFAA
	mov r0, sp
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0801EFAA
	ldr r0, [sp, 0x4]
	mov r1, r10
	bl AttacksThisTurn
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bne _0801EFAA
	mov r0, sp
	ldrb r3, [r0]
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	beq _0801EF92
	movs r0, 0x6
	ands r0, r3
	cmp r0, 0x6
	bne _0801EFAA
_0801EF92:
	ldr r0, _0801EFC8 @ =gBattleMoves
	ldr r1, [sp, 0xC]
	add r1, r10
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	beq _0801EFAA
	mov r0, sp
	movs r1, 0x1
	orrs r1, r3
	strb r1, [r0]
_0801EFAA:
	mov r0, sp
	ldrb r0, [r0]
_0801EFAE:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801EFC0: .4byte gUnknown_824F050
_0801EFC4: .4byte gBattleMons
_0801EFC8: .4byte gBattleMoves
	thumb_func_end TypeCalc

	thumb_func_start AI_TypeCalc
AI_TypeCalc: @ 801EFCC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x4]
	movs r7, 0
	mov r0, sp
	strb r7, [r0]
	ldr r2, _0801F008 @ =gBaseStats
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x6]
	mov r9, r1
	ldrb r0, [r0, 0x7]
	mov r8, r0
	cmp r6, 0xA5
	bne _0801F00C
	movs r0, 0
	b _0801F0B0
	.align 2, 0
_0801F008: .4byte gBaseStats
_0801F00C:
	ldr r2, _0801F030 @ =gBattleMoves
	lsls r1, r6, 1
	adds r0, r1, r6
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	mov r10, r0
	str r1, [sp, 0x8]
	ldr r3, [sp, 0x4]
	cmp r3, 0x1A
	bne _0801F034
	cmp r0, 0x4
	bne _0801F034
	movs r1, 0x9
	mov r0, sp
	strb r1, [r0]
	b _0801F07A
	.align 2, 0
_0801F030: .4byte gBattleMoves
_0801F034:
	ldr r0, _0801F0C0 @ =gUnknown_824F050
	adds r1, r7, r0
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _0801F07A
	adds r4, r1, 0
_0801F040:
	ldrb r0, [r4]
	cmp r0, 0xFE
	beq _0801F06C
	cmp r0, r10
	bne _0801F06C
	ldrb r5, [r4, 0x1]
	cmp r5, r9
	bne _0801F05A
	ldrb r0, [r4, 0x2]
	adds r1, r6, 0
	mov r2, sp
	bl ModulateDmgByType2
_0801F05A:
	cmp r5, r8
	bne _0801F06C
	cmp r9, r8
	beq _0801F06C
	ldrb r0, [r4, 0x2]
	adds r1, r6, 0
	mov r2, sp
	bl ModulateDmgByType2
_0801F06C:
	adds r4, 0x3
	adds r7, 0x3
	ldr r1, _0801F0C0 @ =gUnknown_824F050
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _0801F040
_0801F07A:
	ldr r3, [sp, 0x4]
	cmp r3, 0x19
	bne _0801F0AC
	mov r0, sp
	ldrb r2, [r0]
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _0801F094
	movs r0, 0x6
	ands r0, r2
	cmp r0, 0x6
	bne _0801F0AC
_0801F094:
	ldr r0, _0801F0C4 @ =gBattleMoves
	ldr r3, [sp, 0x8]
	adds r1, r3, r6
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	beq _0801F0AC
	mov r0, sp
	movs r1, 0x8
	orrs r1, r2
	strb r1, [r0]
_0801F0AC:
	mov r0, sp
	ldrb r0, [r0]
_0801F0B0:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801F0C0: .4byte gUnknown_824F050
_0801F0C4: .4byte gBattleMoves
	thumb_func_end AI_TypeCalc

	thumb_func_start Unused_ApplyRandomDmgMultiplier
Unused_ApplyRandomDmgMultiplier: @ 801F0C8
	push {r4,lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	ands r0, r1
	movs r1, 0x64
	subs r1, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r4, _0801F100 @ =gBattleMoveDamage
	ldr r0, [r4]
	cmp r0, 0
	beq _0801F0FA
	muls r0, r1
	str r0, [r4]
	movs r1, 0x64
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _0801F0FA
	movs r0, 0x1
	str r0, [r4]
_0801F0FA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F100: .4byte gBattleMoveDamage
	thumb_func_end Unused_ApplyRandomDmgMultiplier

	thumb_func_start atk07_adjustnormaldamage
atk07_adjustnormaldamage: @ 801F104
	push {r4-r7,lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	ands r0, r1
	movs r1, 0x64
	subs r1, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r4, _0801F15C @ =gBattleMoveDamage
	ldr r0, [r4]
	cmp r0, 0
	beq _0801F136
	muls r0, r1
	str r0, [r4]
	movs r1, 0x64
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _0801F136
	movs r0, 0x1
	str r0, [r4]
_0801F136:
	ldr r7, _0801F160 @ =gBattleMons
	ldr r6, _0801F164 @ =gBattlerTarget
	ldrb r2, [r6]
	movs r5, 0x58
	adds r0, r2, 0
	muls r0, r5
	adds r1, r0, r7
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _0801F16C
	ldr r1, _0801F168 @ =gUnknown_2023F54
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x7]
	ldrb r6, [r0, 0x1A]
	b _0801F186
	.align 2, 0
_0801F15C: .4byte gBattleMoveDamage
_0801F160: .4byte gBattleMons
_0801F164: .4byte gBattlerTarget
_0801F168: .4byte gUnknown_2023F54
_0801F16C:
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
_0801F186:
	ldr r1, _0801F248 @ =gUnknown_2023D6F
	ldr r5, _0801F24C @ =gBattlerTarget
	ldrb r0, [r5]
	strb r0, [r1]
	cmp r4, 0x27
	bne _0801F1C4
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r6
	bcs _0801F1C4
	ldrb r0, [r5]
	movs r1, 0x27
	bl sub_80C7208
	ldr r2, _0801F250 @ =gUnknown_2023ECC
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
_0801F1C4:
	ldr r2, _0801F254 @ =gBattleMons
	ldr r3, _0801F24C @ =gBattlerTarget
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
	bne _0801F294
	ldr r2, _0801F258 @ =gBattleMoves
	ldr r0, _0801F25C @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x65
	beq _0801F216
	ldr r0, _0801F260 @ =gUnknown_2023E8C
	lsls r1, r4, 4
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 30
	cmp r0, 0
	blt _0801F216
	ldr r0, _0801F250 @ =gUnknown_2023ECC
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	lsrs r0, 7
	cmp r0, 0
	beq _0801F294
_0801F216:
	ldrb r0, [r3]
	movs r4, 0x58
	muls r0, r4
	adds r0, r5
	ldrh r1, [r0, 0x28]
	ldr r2, _0801F264 @ =gBattleMoveDamage
	ldr r0, [r2]
	cmp r1, r0
	bgt _0801F294
	subs r0, r1, 0x1
	str r0, [r2]
	ldr r1, _0801F260 @ =gUnknown_2023E8C
	ldrb r3, [r3]
	lsls r0, r3, 4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 30
	cmp r0, 0
	bge _0801F26C
	ldr r0, _0801F268 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	b _0801F294
	.align 2, 0
_0801F248: .4byte gUnknown_2023D6F
_0801F24C: .4byte gBattlerTarget
_0801F250: .4byte gUnknown_2023ECC
_0801F254: .4byte gBattleMons
_0801F258: .4byte gBattleMoves
_0801F25C: .4byte gCurrentMove
_0801F260: .4byte gUnknown_2023E8C
_0801F264: .4byte gBattleMoveDamage
_0801F268: .4byte gMoveResultFlags
_0801F26C:
	ldr r0, _0801F2A4 @ =gUnknown_2023ECC
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	lsrs r0, 7
	cmp r0, 0
	beq _0801F294
	ldr r2, _0801F2A8 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0801F2AC @ =gUnknown_2023D68
	adds r0, r3, 0
	muls r0, r4
	adds r0, r5
	ldrh r0, [r0, 0x2E]
	strh r0, [r1]
_0801F294:
	ldr r1, _0801F2B0 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F2A4: .4byte gUnknown_2023ECC
_0801F2A8: .4byte gMoveResultFlags
_0801F2AC: .4byte gUnknown_2023D68
_0801F2B0: .4byte gUnknown_2023D74
	thumb_func_end atk07_adjustnormaldamage

	thumb_func_start atk08_adjustnormaldamage2
atk08_adjustnormaldamage2: @ 801F2B4
	push {r4-r7,lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	ands r0, r1
	movs r1, 0x64
	subs r1, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r4, _0801F30C @ =gBattleMoveDamage
	ldr r0, [r4]
	cmp r0, 0
	beq _0801F2E6
	muls r0, r1
	str r0, [r4]
	movs r1, 0x64
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _0801F2E6
	movs r0, 0x1
	str r0, [r4]
_0801F2E6:
	ldr r7, _0801F310 @ =gBattleMons
	ldr r6, _0801F314 @ =gBattlerTarget
	ldrb r2, [r6]
	movs r5, 0x58
	adds r0, r2, 0
	muls r0, r5
	adds r1, r0, r7
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _0801F31C
	ldr r1, _0801F318 @ =gUnknown_2023F54
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x7]
	ldrb r6, [r0, 0x1A]
	b _0801F336
	.align 2, 0
_0801F30C: .4byte gBattleMoveDamage
_0801F310: .4byte gBattleMons
_0801F314: .4byte gBattlerTarget
_0801F318: .4byte gUnknown_2023F54
_0801F31C:
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
_0801F336:
	ldr r1, _0801F3DC @ =gUnknown_2023D6F
	ldr r5, _0801F3E0 @ =gBattlerTarget
	ldrb r0, [r5]
	strb r0, [r1]
	cmp r4, 0x27
	bne _0801F374
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r6
	bcs _0801F374
	ldrb r0, [r5]
	movs r1, 0x27
	bl sub_80C7208
	ldr r2, _0801F3E4 @ =gUnknown_2023ECC
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
_0801F374:
	ldr r4, _0801F3E8 @ =gBattleMons
	ldr r6, _0801F3E0 @ =gBattlerTarget
	ldrb r2, [r6]
	movs r7, 0x58
	adds r3, r2, 0
	muls r3, r7
	adds r0, r4, 0
	adds r0, 0x50
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 17
	ands r0, r1
	cmp r0, 0
	bne _0801F420
	ldr r5, _0801F3EC @ =gUnknown_2023E8C
	lsls r0, r2, 4
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 30
	cmp r0, 0
	blt _0801F3B2
	ldr r0, _0801F3E4 @ =gUnknown_2023ECC
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	lsrs r0, 7
	cmp r0, 0
	beq _0801F420
_0801F3B2:
	adds r0, r3, r4
	ldrh r1, [r0, 0x28]
	ldr r2, _0801F3F0 @ =gBattleMoveDamage
	ldr r0, [r2]
	cmp r1, r0
	bgt _0801F420
	subs r0, r1, 0x1
	str r0, [r2]
	ldrb r3, [r6]
	lsls r0, r3, 4
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 30
	cmp r0, 0
	bge _0801F3F8
	ldr r0, _0801F3F4 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	b _0801F420
	.align 2, 0
_0801F3DC: .4byte gUnknown_2023D6F
_0801F3E0: .4byte gBattlerTarget
_0801F3E4: .4byte gUnknown_2023ECC
_0801F3E8: .4byte gBattleMons
_0801F3EC: .4byte gUnknown_2023E8C
_0801F3F0: .4byte gBattleMoveDamage
_0801F3F4: .4byte gMoveResultFlags
_0801F3F8:
	ldr r0, _0801F430 @ =gUnknown_2023ECC
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	lsrs r0, 7
	cmp r0, 0
	beq _0801F420
	ldr r2, _0801F434 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0801F438 @ =gUnknown_2023D68
	adds r0, r3, 0
	muls r0, r7
	adds r0, r4
	ldrh r0, [r0, 0x2E]
	strh r0, [r1]
_0801F420:
	ldr r1, _0801F43C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F430: .4byte gUnknown_2023ECC
_0801F434: .4byte gMoveResultFlags
_0801F438: .4byte gUnknown_2023D68
_0801F43C: .4byte gUnknown_2023D74
	thumb_func_end atk08_adjustnormaldamage2

	thumb_func_start atk09_attackanimation
atk09_attackanimation: @ 801F440
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	ldr r0, _0801F488 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	beq _0801F452
	b _0801F572
_0801F452:
	ldr r0, _0801F48C @ =gUnknown_2023DD0
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	ldr r3, _0801F490 @ =gCurrentMove
	cmp r0, 0
	beq _0801F4A0
	ldrh r0, [r3]
	cmp r0, 0x90
	beq _0801F4A0
	cmp r0, 0xA4
	beq _0801F4A0
	ldr r4, _0801F494 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r0, _0801F498 @ =gUnknown_81D89F1
	str r0, [r4]
	ldr r1, _0801F49C @ =gBattleScripting
	ldrb r0, [r1, 0x18]
	adds r0, 0x1
	strb r0, [r1, 0x18]
	ldrb r0, [r1, 0x19]
	adds r0, 0x1
	strb r0, [r1, 0x19]
	b _0801F572
	.align 2, 0
_0801F488: .4byte gUnknown_2023BC8
_0801F48C: .4byte gUnknown_2023DD0
_0801F490: .4byte gCurrentMove
_0801F494: .4byte gUnknown_2023D74
_0801F498: .4byte gUnknown_81D89F1
_0801F49C: .4byte gBattleScripting
_0801F4A0:
	ldr r2, _0801F53C @ =gBattleMoves
	ldrh r1, [r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x6]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _0801F4C6
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0801F4C6
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0801F4CE
_0801F4C6:
	ldr r0, _0801F540 @ =gBattleScripting
	ldrb r0, [r0, 0x19]
	cmp r0, 0
	bne _0801F530
_0801F4CE:
	ldr r0, _0801F544 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _0801F564
	ldr r1, _0801F548 @ =gActiveBattler
	ldr r0, _0801F54C @ =sBattler_AI
	mov r8, r0
	ldrb r0, [r0]
	strb r0, [r1]
	ldrh r1, [r3]
	ldr r6, _0801F540 @ =gBattleScripting
	ldrb r2, [r6, 0x18]
	ldr r0, _0801F550 @ =gUnknown_2024020
	ldrh r3, [r0]
	ldr r0, _0801F554 @ =gBattleMoveDamage
	ldr r0, [r0]
	str r0, [sp]
	ldr r5, _0801F558 @ =gBattleMons
	mov r0, r8
	ldrb r4, [r0]
	movs r0, 0x58
	muls r0, r4
	adds r0, r5
	adds r0, 0x2B
	ldrb r0, [r0]
	str r0, [sp, 0x4]
	mov r0, r8
	ldrb r4, [r0]
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	ldr r4, _0801F55C @ =gDisableStructs
	adds r0, r4
	str r0, [sp, 0x8]
	movs r0, 0
	bl EmitMoveAnimation
	ldrb r0, [r6, 0x18]
	adds r0, 0x1
	strb r0, [r6, 0x18]
	ldrb r0, [r6, 0x19]
	adds r0, 0x1
	strb r0, [r6, 0x19]
	mov r1, r8
	ldrb r0, [r1]
	bl MarkBufferBankForExecution
_0801F530:
	ldr r1, _0801F560 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	b _0801F572
	.align 2, 0
_0801F53C: .4byte gBattleMoves
_0801F540: .4byte gBattleScripting
_0801F544: .4byte gMoveResultFlags
_0801F548: .4byte gActiveBattler
_0801F54C: .4byte sBattler_AI
_0801F550: .4byte gUnknown_2024020
_0801F554: .4byte gBattleMoveDamage
_0801F558: .4byte gBattleMons
_0801F55C: .4byte gDisableStructs
_0801F560: .4byte gUnknown_2023D74
_0801F564:
	ldr r4, _0801F580 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r0, _0801F584 @ =gUnknown_81D89F1
	str r0, [r4]
_0801F572:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F580: .4byte gUnknown_2023D74
_0801F584: .4byte gUnknown_81D89F1
	thumb_func_end atk09_attackanimation

	thumb_func_start sub_801F588
sub_801F588: @ 801F588
	push {lr}
	ldr r0, _0801F5A0 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	bne _0801F59A
	ldr r1, _0801F5A4 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_0801F59A:
	pop {r0}
	bx r0
	.align 2, 0
_0801F5A0: .4byte gUnknown_2023BC8
_0801F5A4: .4byte gUnknown_2023D74
	thumb_func_end sub_801F588

	thumb_func_start atk0B_healthbarupdate
atk0B_healthbarupdate: @ 801F5A8
	push {r4,lr}
	ldr r0, _0801F60C @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	bne _0801F66A
	ldr r0, _0801F610 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _0801F662
	ldr r0, _0801F614 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r2, _0801F618 @ =gActiveBattler
	strb r0, [r2]
	ldr r1, _0801F61C @ =gBattleMons
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
	beq _0801F628
	ldr r0, _0801F620 @ =gDisableStructs
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	cmp r0, 0
	beq _0801F628
	ldr r0, _0801F624 @ =gUnknown_2023DD0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 1
	ands r0, r1
	cmp r0, 0
	bne _0801F628
	movs r0, 0x80
	adds r1, r2, 0
	bl PrepareStringBattle
	b _0801F662
	.align 2, 0
_0801F60C: .4byte gUnknown_2023BC8
_0801F610: .4byte gMoveResultFlags
_0801F614: .4byte gUnknown_2023D74
_0801F618: .4byte gActiveBattler
_0801F61C: .4byte gBattleMons
_0801F620: .4byte gDisableStructs
_0801F624: .4byte gUnknown_2023DD0
_0801F628:
	ldr r0, _0801F670 @ =gBattleMoveDamage
	ldr r0, [r0]
	ldr r1, _0801F674 @ =0x00002710
	cmp r0, r1
	bgt _0801F636
	lsls r0, 16
	lsrs r1, r0, 16
_0801F636:
	movs r0, 0
	bl EmitHealthBarUpdate
	ldr r4, _0801F678 @ =gActiveBattler
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _0801F662
	ldr r0, _0801F670 @ =gBattleMoveDamage
	ldr r0, [r0]
	cmp r0, 0
	ble _0801F662
	ldr r0, _0801F67C @ =gBattleResults
	ldrb r1, [r0, 0x5]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x5]
_0801F662:
	ldr r1, _0801F680 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
_0801F66A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F670: .4byte gBattleMoveDamage
_0801F674: .4byte 0x00002710
_0801F678: .4byte gActiveBattler
_0801F67C: .4byte gBattleResults
_0801F680: .4byte gUnknown_2023D74
	thumb_func_end atk0B_healthbarupdate

	thumb_func_start atk0C_datahpupdate
atk0C_datahpupdate: @ 801F684
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r0, _0801F6AC @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	beq _0801F692
	b _0801FA62
_0801F692:
	ldr r0, _0801F6B0 @ =gBattleStruct
	ldr r0, [r0]
	ldrb r1, [r0, 0x13]
	cmp r1, 0
	beq _0801F6B4
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0801F6B4
	movs r6, 0x3F
	ands r6, r1
	b _0801F6C4
	.align 2, 0
_0801F6AC: .4byte gUnknown_2023BC8
_0801F6B0: .4byte gBattleStruct
_0801F6B4:
	ldr r2, _0801F750 @ =gBattleMoves
	ldr r0, _0801F754 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r6, [r0, 0x2]
_0801F6C4:
	ldr r0, _0801F758 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0801F6D2
	b _0801FA34
_0801F6D2:
	ldr r0, _0801F75C @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r7, _0801F760 @ =gActiveBattler
	strb r0, [r7]
	ldr r1, _0801F764 @ =gBattleMons
	ldrb r2, [r7]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 17
	ands r0, r1
	cmp r0, 0
	beq _0801F7E8
	ldr r0, _0801F768 @ =gDisableStructs
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r4, r1, r0
	ldrb r1, [r4, 0xA]
	mov r12, r0
	cmp r1, 0
	beq _0801F7E8
	ldr r0, _0801F76C @ =gUnknown_2023DD0
	ldr r3, [r0]
	movs r0, 0x80
	lsls r0, 1
	ands r3, r0
	cmp r3, 0
	bne _0801F7E8
	adds r5, r1, 0
	ldr r6, _0801F770 @ =gBattleMoveDamage
	ldr r4, [r6]
	cmp r5, r4
	blt _0801F77C
	ldr r0, _0801F774 @ =gUnknown_2023ECC
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 2
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	cmp r0, 0
	bne _0801F736
	str r4, [r1]
_0801F736:
	ldrb r0, [r7]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	add r1, r12
	ldr r2, [r6]
	ldrb r0, [r1, 0xA]
	subs r0, r2
	strb r0, [r1, 0xA]
	ldr r1, _0801F778 @ =gUnknown_2023D54
	ldr r0, [r6]
	str r0, [r1]
	b _0801F7AC
	.align 2, 0
_0801F750: .4byte gBattleMoves
_0801F754: .4byte gCurrentMove
_0801F758: .4byte gMoveResultFlags
_0801F75C: .4byte gUnknown_2023D74
_0801F760: .4byte gActiveBattler
_0801F764: .4byte gBattleMons
_0801F768: .4byte gDisableStructs
_0801F76C: .4byte gUnknown_2023DD0
_0801F770: .4byte gBattleMoveDamage
_0801F774: .4byte gUnknown_2023ECC
_0801F778: .4byte gUnknown_2023D54
_0801F77C:
	ldr r0, _0801F7D4 @ =gUnknown_2023ECC
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 2
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	cmp r0, 0
	bne _0801F790
	str r5, [r1]
_0801F790:
	ldr r2, _0801F7D8 @ =gUnknown_2023D54
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r12
	ldrb r0, [r0, 0xA]
	str r0, [r2]
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r12
	strb r3, [r0, 0xA]
_0801F7AC:
	ldr r0, _0801F7DC @ =gActiveBattler
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r12
	ldrb r0, [r0, 0xA]
	cmp r0, 0
	beq _0801F7C0
	b _0801FA5A
_0801F7C0:
	ldr r4, _0801F7E0 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	bl BattleScriptPushCursor
	ldr r0, _0801F7E4 @ =gUnknown_81D9526
	str r0, [r4]
	b _0801FA62
	.align 2, 0
_0801F7D4: .4byte gUnknown_2023ECC
_0801F7D8: .4byte gUnknown_2023D54
_0801F7DC: .4byte gActiveBattler
_0801F7E0: .4byte gUnknown_2023D74
_0801F7E4: .4byte gUnknown_81D9526
_0801F7E8:
	ldr r0, _0801F828 @ =gUnknown_2023DD0
	ldr r2, [r0]
	ldr r1, _0801F82C @ =0xfffffeff
	ands r2, r1
	str r2, [r0]
	ldr r1, _0801F830 @ =gBattleMoveDamage
	ldr r5, [r1]
	mov r12, r0
	adds r7, r1, 0
	cmp r5, 0
	bge _0801F83C
	ldr r4, _0801F834 @ =gBattleMons
	ldr r2, _0801F838 @ =gActiveBattler
	ldrb r0, [r2]
	movs r3, 0x58
	adds r1, r0, 0
	muls r1, r3
	adds r1, r4
	ldrh r0, [r1, 0x28]
	subs r0, r5
	strh r0, [r1, 0x28]
	ldrb r0, [r2]
	muls r0, r3
	adds r1, r0, r4
	ldrh r3, [r1, 0x2C]
	ldrh r0, [r1, 0x28]
	adds r5, r2, 0
	cmp r0, r3
	bhi _0801F824
	b _0801F9FA
_0801F824:
	strh r3, [r1, 0x28]
	b _0801F9FA
	.align 2, 0
_0801F828: .4byte gUnknown_2023DD0
_0801F82C: .4byte 0xfffffeff
_0801F830: .4byte gBattleMoveDamage
_0801F834: .4byte gBattleMons
_0801F838: .4byte gActiveBattler
_0801F83C:
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _0801F858
	movs r0, 0x21
	negs r0, r0
	ands r2, r0
	mov r0, r12
	str r2, [r0]
	ldr r5, _0801F854 @ =gActiveBattler
	b _0801F8A0
	.align 2, 0
_0801F854: .4byte gActiveBattler
_0801F858:
	ldr r0, _0801F880 @ =gUnknown_2023D58
	ldr r2, _0801F884 @ =gActiveBattler
	ldrb r1, [r2]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	adds r0, r5
	str r0, [r1]
	ldr r0, _0801F888 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	adds r5, r2, 0
	cmp r0, 0
	bne _0801F894
	ldr r1, _0801F88C @ =gUnknown_2023DD8
	ldrb r0, [r5]
	adds r0, r1
	ldr r1, _0801F890 @ =sBattler_AI
	b _0801F89C
	.align 2, 0
_0801F880: .4byte gUnknown_2023D58
_0801F884: .4byte gActiveBattler
_0801F888: .4byte gUnknown_2023D74
_0801F88C: .4byte gUnknown_2023DD8
_0801F890: .4byte sBattler_AI
_0801F894:
	ldr r1, _0801F8C0 @ =gUnknown_2023DD8
	ldrb r0, [r5]
	adds r0, r1
	ldr r1, _0801F8C4 @ =gBattlerTarget
_0801F89C:
	ldrb r1, [r1]
	strb r1, [r0]
_0801F8A0:
	ldr r4, _0801F8C8 @ =gBattleMons
	ldrb r0, [r5]
	movs r3, 0x58
	muls r0, r3
	adds r2, r0, r4
	ldrh r0, [r2, 0x28]
	ldr r1, [r7]
	cmp r0, r1
	ble _0801F8D0
	subs r0, r1
	strh r0, [r2, 0x28]
	ldr r0, _0801F8CC @ =gUnknown_2023D54
	str r1, [r0]
	adds r7, r0, 0
	b _0801F8E0
	.align 2, 0
_0801F8C0: .4byte gUnknown_2023DD8
_0801F8C4: .4byte gBattlerTarget
_0801F8C8: .4byte gBattleMons
_0801F8CC: .4byte gUnknown_2023D54
_0801F8D0:
	ldr r2, _0801F954 @ =gUnknown_2023D54
	str r0, [r2]
	ldrb r0, [r5]
	muls r0, r3
	adds r0, r4
	movs r1, 0
	strh r1, [r0, 0x28]
	adds r7, r2, 0
_0801F8E0:
	ldr r2, _0801F958 @ =gUnknown_2023ECC
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r1, r2, 0x4
	adds r3, r0, r1
	ldr r0, [r3]
	adds r4, r2, 0
	cmp r0, 0
	bne _0801F908
	mov r1, r12
	ldr r0, [r1]
	movs r1, 0x80
	lsls r1, 13
	ands r0, r1
	cmp r0, 0
	bne _0801F908
	ldr r0, [r7]
	str r0, [r3]
_0801F908:
	cmp r6, 0x8
	bhi _0801F990
	mov r1, r12
	ldr r0, [r1]
	movs r1, 0x80
	lsls r1, 13
	ands r0, r1
	cmp r0, 0
	bne _0801F98C
	ldr r0, _0801F95C @ =gCurrentMove
	ldrh r0, [r0]
	cmp r0, 0xDC
	beq _0801F98C
	ldr r3, _0801F960 @ =gUnknown_2023E8C
	ldrb r0, [r5]
	lsls r0, 4
	adds r1, r3, 0x4
	adds r0, r1
	ldr r2, [r7]
	str r2, [r0]
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x8
	adds r0, r1
	str r2, [r0]
	ldr r0, _0801F964 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _0801F96C
	ldrb r0, [r5]
	lsls r0, 4
	adds r0, r3
	ldr r2, _0801F968 @ =sBattler_AI
	b _0801F974
	.align 2, 0
_0801F954: .4byte gUnknown_2023D54
_0801F958: .4byte gUnknown_2023ECC
_0801F95C: .4byte gCurrentMove
_0801F960: .4byte gUnknown_2023E8C
_0801F964: .4byte gUnknown_2023D74
_0801F968: .4byte sBattler_AI
_0801F96C:
	ldrb r0, [r5]
	lsls r0, 4
	adds r0, r3
	ldr r2, _0801F988 @ =gBattlerTarget
_0801F974:
	ldrb r1, [r2]
	strb r1, [r0, 0xC]
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r2]
	strb r1, [r0, 0x10]
	b _0801F9FA
	.align 2, 0
_0801F988: .4byte gBattlerTarget
_0801F98C:
	cmp r6, 0x8
	bls _0801F9FA
_0801F990:
	mov r1, r12
	ldr r0, [r1]
	movs r1, 0x80
	lsls r1, 13
	ands r0, r1
	cmp r0, 0
	bne _0801F9FA
	ldr r3, _0801F9D4 @ =gUnknown_2023E8C
	ldrb r0, [r5]
	lsls r0, 4
	adds r1, r3, 0
	adds r1, 0x8
	adds r0, r1
	ldr r2, [r7]
	str r2, [r0]
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0xC
	adds r0, r1
	str r2, [r0]
	ldr r0, _0801F9D8 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _0801F9E0
	ldrb r0, [r5]
	lsls r0, 4
	adds r0, r3
	ldr r2, _0801F9DC @ =sBattler_AI
	b _0801F9E8
	.align 2, 0
_0801F9D4: .4byte gUnknown_2023E8C
_0801F9D8: .4byte gUnknown_2023D74
_0801F9DC: .4byte sBattler_AI
_0801F9E0:
	ldrb r0, [r5]
	lsls r0, 4
	adds r0, r3
	ldr r2, _0801FA28 @ =gBattlerTarget
_0801F9E8:
	ldrb r1, [r2]
	strb r1, [r0, 0xD]
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r2]
	strb r1, [r0, 0x11]
_0801F9FA:
	mov r1, r12
	ldr r0, [r1]
	ldr r1, _0801FA2C @ =0xffefffff
	ands r0, r1
	mov r1, r12
	str r0, [r1]
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	ldr r1, _0801FA30 @ =gUnknown_2023C0C
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x2A
	movs r2, 0
	movs r3, 0x2
	bl EmitSetMonData
	ldrb r0, [r5]
	bl MarkBufferBankForExecution
	b _0801FA5A
	.align 2, 0
_0801FA28: .4byte gBattlerTarget
_0801FA2C: .4byte 0xffefffff
_0801FA30: .4byte gUnknown_2023C0C
_0801FA34:
	ldr r0, _0801FA6C @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r1, _0801FA70 @ =gActiveBattler
	strb r0, [r1]
	ldr r2, _0801FA74 @ =gUnknown_2023ECC
	ldrb r1, [r1]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, 0x4
	adds r1, r0, r2
	ldr r0, [r1]
	cmp r0, 0
	bne _0801FA5A
	ldr r0, _0801FA78 @ =0x0000ffff
	str r0, [r1]
_0801FA5A:
	ldr r1, _0801FA6C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
_0801FA62:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FA6C: .4byte gUnknown_2023D74
_0801FA70: .4byte gActiveBattler
_0801FA74: .4byte gUnknown_2023ECC
_0801FA78: .4byte 0x0000ffff
	thumb_func_end atk0C_datahpupdate

	thumb_func_start atk0D_critmessage
atk0D_critmessage: @ 801FA7C
	push {lr}
	ldr r0, _0801FAB8 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	bne _0801FAB2
	ldr r0, _0801FABC @ =gCritMultiplier
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0801FAAA
	ldr r0, _0801FAC0 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _0801FAAA
	ldr r0, _0801FAC4 @ =sBattler_AI
	ldrb r1, [r0]
	movs r0, 0xD9
	bl PrepareStringBattle
	ldr r1, _0801FAC8 @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x7]
_0801FAAA:
	ldr r1, _0801FACC @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_0801FAB2:
	pop {r0}
	bx r0
	.align 2, 0
_0801FAB8: .4byte gUnknown_2023BC8
_0801FABC: .4byte gCritMultiplier
_0801FAC0: .4byte gMoveResultFlags
_0801FAC4: .4byte sBattler_AI
_0801FAC8: .4byte gUnknown_2023E82
_0801FACC: .4byte gUnknown_2023D74
	thumb_func_end atk0D_critmessage

	thumb_func_start atk0E_effectivenesssound
atk0E_effectivenesssound: @ 801FAD0
	push {r4,lr}
	ldr r0, _0801FB08 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	bne _0801FB90
	ldr r4, _0801FB0C @ =gActiveBattler
	ldr r0, _0801FB10 @ =gBattlerTarget
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r1, _0801FB14 @ =gMoveResultFlags
	ldrb r2, [r1]
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	bne _0801FB88
	movs r0, 0xFE
	ands r0, r2
	cmp r0, 0x10
	beq _0801FB42
	cmp r0, 0x10
	bgt _0801FB1E
	cmp r0, 0x4
	beq _0801FB32
	cmp r0, 0x4
	bgt _0801FB18
	cmp r0, 0x2
	beq _0801FB2C
	b _0801FB42
	.align 2, 0
_0801FB08: .4byte gUnknown_2023BC8
_0801FB0C: .4byte gActiveBattler
_0801FB10: .4byte gBattlerTarget
_0801FB14: .4byte gMoveResultFlags
_0801FB18:
	cmp r0, 0x8
	beq _0801FB88
	b _0801FB42
_0801FB1E:
	cmp r0, 0x40
	beq _0801FB42
	cmp r0, 0x40
	bgt _0801FB42
	cmp r0, 0x20
	beq _0801FB88
	b _0801FB42
_0801FB2C:
	movs r0, 0
	movs r1, 0xE
	b _0801FB36
_0801FB32:
	movs r0, 0
	movs r1, 0xC
_0801FB36:
	bl EmitPlaySE
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	b _0801FB88
_0801FB42:
	ldrb r1, [r1]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0801FB52
	movs r0, 0
	movs r1, 0xE
	b _0801FB5E
_0801FB52:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0801FB70
	movs r0, 0
	movs r1, 0xC
_0801FB5E:
	bl EmitPlaySE
	ldr r0, _0801FB6C @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBufferBankForExecution
	b _0801FB88
	.align 2, 0
_0801FB6C: .4byte gActiveBattler
_0801FB70:
	movs r0, 0x28
	ands r0, r1
	cmp r0, 0
	bne _0801FB88
	movs r0, 0
	movs r1, 0xD
	bl EmitPlaySE
	ldr r0, _0801FB98 @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBufferBankForExecution
_0801FB88:
	ldr r1, _0801FB9C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_0801FB90:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801FB98: .4byte gActiveBattler
_0801FB9C: .4byte gUnknown_2023D74
	thumb_func_end atk0E_effectivenesssound

	thumb_func_start atk0F_resultmessage
atk0F_resultmessage: @ 801FBA0
	push {r4-r7,lr}
	movs r3, 0
	ldr r0, _0801FBDC @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	beq _0801FBAE
	b _0801FD40
_0801FBAE:
	ldr r1, _0801FBE0 @ =gMoveResultFlags
	ldrb r2, [r1]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r2
	adds r6, r1, 0
	ldr r7, _0801FBE4 @ =gUnknown_2023E82
	cmp r0, 0
	beq _0801FBEC
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _0801FBCE
	ldrb r0, [r7, 0x6]
	cmp r0, 0x2
	bls _0801FBEC
_0801FBCE:
	ldr r1, _0801FBE8 @ =gUnknown_83FE514
	ldrb r0, [r7, 0x6]
	lsls r0, 1
	adds r0, r1
	ldrh r3, [r0]
	strb r4, [r7, 0x7]
	b _0801FD2A
	.align 2, 0
_0801FBDC: .4byte gUnknown_2023BC8
_0801FBE0: .4byte gMoveResultFlags
_0801FBE4: .4byte gUnknown_2023E82
_0801FBE8: .4byte gUnknown_83FE514
_0801FBEC:
	movs r0, 0x1
	strb r0, [r7, 0x7]
	ldrb r5, [r6]
	movs r0, 0xFE
	ands r0, r5
	cmp r0, 0x10
	beq _0801FC30
	cmp r0, 0x10
	bgt _0801FC12
	cmp r0, 0x4
	beq _0801FC2C
	cmp r0, 0x4
	bgt _0801FC0C
	cmp r0, 0x2
	beq _0801FC28
	b _0801FC78
_0801FC0C:
	cmp r0, 0x8
	beq _0801FC84
	b _0801FC78
_0801FC12:
	cmp r0, 0x40
	beq _0801FC34
	cmp r0, 0x40
	bgt _0801FC22
	cmp r0, 0x20
	bne _0801FC20
	b _0801FD24
_0801FC20:
	b _0801FC78
_0801FC22:
	cmp r0, 0x80
	beq _0801FC38
	b _0801FC78
_0801FC28:
	movs r3, 0xDE
	b _0801FD2E
_0801FC2C:
	movs r3, 0xDD
	b _0801FD2E
_0801FC30:
	movs r3, 0xDA
	b _0801FD2E
_0801FC34:
	movs r3, 0x99
	b _0801FD2E
_0801FC38:
	ldr r4, _0801FC60 @ =gUnknown_2023D68
	ldr r2, _0801FC64 @ =gBattleMons
	ldr r3, _0801FC68 @ =gBattlerTarget
	ldrb r1, [r3]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x2E]
	strh r0, [r4]
	ldr r1, _0801FC6C @ =gUnknown_2023D6F
	ldrb r0, [r3]
	strb r0, [r1]
	movs r0, 0x3F
	ands r0, r5
	strb r0, [r6]
	bl BattleScriptPushCursor
	ldr r1, _0801FC70 @ =gUnknown_2023D74
	ldr r0, _0801FC74 @ =gUnknown_81D9641
	b _0801FD3E
	.align 2, 0
_0801FC60: .4byte gUnknown_2023D68
_0801FC64: .4byte gBattleMons
_0801FC68: .4byte gBattlerTarget
_0801FC6C: .4byte gUnknown_2023D6F
_0801FC70: .4byte gUnknown_2023D74
_0801FC74: .4byte gUnknown_81D9641
_0801FC78:
	adds r2, r6, 0
	ldrb r5, [r2]
	movs r0, 0x8
	ands r0, r5
	cmp r0, 0
	beq _0801FC88
_0801FC84:
	movs r3, 0x1B
	b _0801FD2E
_0801FC88:
	movs r0, 0x10
	ands r0, r5
	cmp r0, 0
	beq _0801FCB0
	movs r0, 0xEF
	ands r0, r5
	movs r1, 0xFD
	ands r0, r1
	movs r1, 0xFB
	ands r0, r1
	strb r0, [r2]
	bl BattleScriptPushCursor
	ldr r1, _0801FCA8 @ =gUnknown_2023D74
	ldr r0, _0801FCAC @ =gUnknown_81D8FE4
	b _0801FD3E
	.align 2, 0
_0801FCA8: .4byte gUnknown_2023D74
_0801FCAC: .4byte gUnknown_81D8FE4
_0801FCB0:
	movs r0, 0x40
	ands r0, r5
	cmp r0, 0
	beq _0801FCD0
	movs r0, 0x3F
	ands r0, r5
	strb r0, [r2]
	bl BattleScriptPushCursor
	ldr r1, _0801FCC8 @ =gUnknown_2023D74
	ldr r0, _0801FCCC @ =gUnknown_81D8FDD
	b _0801FD3E
	.align 2, 0
_0801FCC8: .4byte gUnknown_2023D74
_0801FCCC: .4byte gUnknown_81D8FDD
_0801FCD0:
	movs r0, 0x80
	ands r0, r5
	cmp r0, 0
	beq _0801FD18
	ldr r4, _0801FD00 @ =gUnknown_2023D68
	ldr r2, _0801FD04 @ =gBattleMons
	ldr r3, _0801FD08 @ =gBattlerTarget
	ldrb r1, [r3]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x2E]
	strh r0, [r4]
	ldr r1, _0801FD0C @ =gUnknown_2023D6F
	ldrb r0, [r3]
	strb r0, [r1]
	movs r0, 0x3F
	ands r0, r5
	strb r0, [r6]
	bl BattleScriptPushCursor
	ldr r1, _0801FD10 @ =gUnknown_2023D74
	ldr r0, _0801FD14 @ =gUnknown_81D9641
	b _0801FD3E
	.align 2, 0
_0801FD00: .4byte gUnknown_2023D68
_0801FD04: .4byte gBattleMons
_0801FD08: .4byte gBattlerTarget
_0801FD0C: .4byte gUnknown_2023D6F
_0801FD10: .4byte gUnknown_2023D74
_0801FD14: .4byte gUnknown_81D9641
_0801FD18:
	movs r0, 0x20
	ands r0, r5
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0801FD28
_0801FD24:
	movs r3, 0xE5
	b _0801FD2E
_0801FD28:
	strb r0, [r7, 0x7]
_0801FD2A:
	cmp r3, 0
	beq _0801FD38
_0801FD2E:
	adds r0, r3, 0
	ldr r1, _0801FD48 @ =sBattler_AI
	ldrb r1, [r1]
	bl PrepareStringBattle
_0801FD38:
	ldr r1, _0801FD4C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
_0801FD3E:
	str r0, [r1]
_0801FD40:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FD48: .4byte sBattler_AI
_0801FD4C: .4byte gUnknown_2023D74
	thumb_func_end atk0F_resultmessage

	thumb_func_start atk10_printstring
atk10_printstring: @ 801FD50
	push {r4,lr}
	ldr r0, _0801FD80 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	bne _0801FD7A
	ldr r4, _0801FD84 @ =gUnknown_2023D74
	ldr r1, [r4]
	ldrb r0, [r1, 0x1]
	ldrb r1, [r1, 0x2]
	lsls r1, 8
	orrs r0, r1
	ldr r1, _0801FD88 @ =sBattler_AI
	ldrb r1, [r1]
	bl PrepareStringBattle
	ldr r0, [r4]
	adds r0, 0x3
	str r0, [r4]
	ldr r1, _0801FD8C @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x7]
_0801FD7A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801FD80: .4byte gUnknown_2023BC8
_0801FD84: .4byte gUnknown_2023D74
_0801FD88: .4byte sBattler_AI
_0801FD8C: .4byte gUnknown_2023E82
	thumb_func_end atk10_printstring

	thumb_func_start atk11_printselectionstring
atk11_printselectionstring: @ 801FD90
	push {r4,r5,lr}
	ldr r5, _0801FDC4 @ =gActiveBattler
	ldr r0, _0801FDC8 @ =sBattler_AI
	ldrb r0, [r0]
	strb r0, [r5]
	ldr r4, _0801FDCC @ =gUnknown_2023D74
	ldr r0, [r4]
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r1, r0
	movs r0, 0
	bl EmitPrintSelectionString
	ldrb r0, [r5]
	bl MarkBufferBankForExecution
	ldr r0, [r4]
	adds r0, 0x3
	str r0, [r4]
	ldr r1, _0801FDD0 @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x7]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FDC4: .4byte gActiveBattler
_0801FDC8: .4byte sBattler_AI
_0801FDCC: .4byte gUnknown_2023D74
_0801FDD0: .4byte gUnknown_2023E82
	thumb_func_end atk11_printselectionstring

	thumb_func_start atk12_waitmessage
atk12_waitmessage: @ 801FDD4
	push {r4-r6,lr}
	ldr r0, _0801FDF0 @ =gUnknown_2023BC8
	ldr r4, [r0]
	cmp r4, 0
	bne _0801FE22
	ldr r6, _0801FDF4 @ =gUnknown_2023E82
	ldrb r0, [r6, 0x7]
	cmp r0, 0
	bne _0801FDFC
	ldr r1, _0801FDF8 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x3
	str r0, [r1]
	b _0801FE22
	.align 2, 0
_0801FDF0: .4byte gUnknown_2023BC8
_0801FDF4: .4byte gUnknown_2023E82
_0801FDF8: .4byte gUnknown_2023D74
_0801FDFC:
	ldr r5, _0801FE28 @ =gUnknown_2023D74
	ldr r2, [r5]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldr r3, _0801FE2C @ =gUnknown_2023E7C
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r1
	bcc _0801FE22
	movs r1, 0
	strh r4, [r3]
	adds r0, r2, 0x3
	str r0, [r5]
	strb r1, [r6, 0x7]
_0801FE22:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801FE28: .4byte gUnknown_2023D74
_0801FE2C: .4byte gUnknown_2023E7C
	thumb_func_end atk12_waitmessage

	thumb_func_start atk13_printfromtable
atk13_printfromtable: @ 801FE30
	push {r4,r5,lr}
	ldr r0, _0801FE74 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	bne _0801FE6E
	ldr r4, _0801FE78 @ =gUnknown_2023D74
	ldr r2, [r4]
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
	ldr r5, _0801FE7C @ =gUnknown_2023E82
	ldrb r0, [r5, 0x5]
	lsls r0, 1
	adds r1, r0
	ldrh r0, [r1]
	ldr r1, _0801FE80 @ =sBattler_AI
	ldrb r1, [r1]
	bl PrepareStringBattle
	ldr r0, [r4]
	adds r0, 0x5
	str r0, [r4]
	movs r0, 0x1
	strb r0, [r5, 0x7]
_0801FE6E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FE74: .4byte gUnknown_2023BC8
_0801FE78: .4byte gUnknown_2023D74
_0801FE7C: .4byte gUnknown_2023E82
_0801FE80: .4byte sBattler_AI
	thumb_func_end atk13_printfromtable

	thumb_func_start atk14_printselectionstringfromtable
atk14_printselectionstringfromtable: @ 801FE84
	push {r4-r6,lr}
	ldr r0, _0801FED4 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	bne _0801FECE
	ldr r5, _0801FED8 @ =gUnknown_2023D74
	ldr r2, [r5]
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
	ldr r6, _0801FEDC @ =gUnknown_2023E82
	ldrb r0, [r6, 0x5]
	lsls r0, 1
	adds r1, r0
	ldr r4, _0801FEE0 @ =gActiveBattler
	ldr r0, _0801FEE4 @ =sBattler_AI
	ldrb r0, [r0]
	strb r0, [r4]
	ldrh r1, [r1]
	movs r0, 0
	bl EmitPrintSelectionString
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	ldr r0, [r5]
	adds r0, 0x5
	str r0, [r5]
	movs r0, 0x1
	strb r0, [r6, 0x7]
_0801FECE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801FED4: .4byte gUnknown_2023BC8
_0801FED8: .4byte gUnknown_2023D74
_0801FEDC: .4byte gUnknown_2023E82
_0801FEE0: .4byte gActiveBattler
_0801FEE4: .4byte sBattler_AI
	thumb_func_end atk14_printselectionstringfromtable

	thumb_func_start BankGetTurnOrder
BankGetTurnOrder: @ 801FEE8
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	ldr r0, _0801FF18 @ =gUnknown_2023BCC
	ldrb r3, [r0]
	cmp r1, r3
	bge _0801FF0E
	ldr r4, _0801FF1C @ =gUnknown_2023BDE
	ldrb r0, [r4]
	cmp r0, r2
	beq _0801FF0E
_0801FF00:
	adds r1, 0x1
	cmp r1, r3
	bge _0801FF0E
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r2
	bne _0801FF00
_0801FF0E:
	lsls r0, r1, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801FF18: .4byte gUnknown_2023BCC
_0801FF1C: .4byte gUnknown_2023BDE
	thumb_func_end BankGetTurnOrder

	thumb_func_start sub_801FF20
sub_801FF20: @ 801FF20
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	movs r0, 0
	mov r10, r0
	movs r7, 0
	movs r1, 0x1
	str r1, [sp, 0x4]
	ldr r1, _0801FF64 @ =gUnknown_2023E82
	ldrb r3, [r1, 0x3]
	movs r0, 0x40
	ands r0, r3
	adds r6, r1, 0
	cmp r0, 0
	beq _0801FF78
	ldr r2, _0801FF68 @ =gUnknown_2023D6E
	ldr r0, _0801FF6C @ =sBattler_AI
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0xBF
	ands r0, r3
	strb r0, [r6, 0x3]
	movs r7, 0x40
	ldr r1, _0801FF70 @ =gBattleScripting
	ldr r0, _0801FF74 @ =gBattlerTarget
	b _0801FF84
	.align 2, 0
_0801FF64: .4byte gUnknown_2023E82
_0801FF68: .4byte gUnknown_2023D6E
_0801FF6C: .4byte sBattler_AI
_0801FF70: .4byte gBattleScripting
_0801FF74: .4byte gBattlerTarget
_0801FF78:
	ldr r2, _08020094 @ =gUnknown_2023D6E
	ldr r0, _08020098 @ =gBattlerTarget
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r1, _0802009C @ =gBattleScripting
	ldr r0, _080200A0 @ =sBattler_AI
_0801FF84:
	ldrb r0, [r0]
	strb r0, [r1, 0x17]
	mov r9, r2
	ldr r0, _080200A4 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 9
	ands r0, r1
	cmp r0, 0
	beq _0801FFB2
	ldrb r0, [r6, 0x3]
	cmp r0, 0x1
	beq _0801FFB2
	mov r2, r9
	ldrb r0, [r2]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0801FFB2
	bl _080210EC
_0801FFB2:
	ldr r3, _080200A8 @ =gBattleMons
	ldr r2, _08020094 @ =gUnknown_2023D6E
	ldrb r1, [r2]
	movs r0, 0x58
	muls r0, r1
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	mov r9, r2
	cmp r0, 0x13
	bne _0801FFE6
	ldr r0, _080200AC @ =gUnknown_2023DD0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 6
	ands r0, r1
	cmp r0, 0
	bne _0801FFE6
	cmp r4, 0
	bne _0801FFE6
	ldr r0, _080200B0 @ =gUnknown_2023E82
	ldrb r0, [r0, 0x3]
	cmp r0, 0x9
	bhi _0801FFE6
	bl _080210EC
_0801FFE6:
	mov r3, r9
	ldrb r0, [r3]
	bl GetBankIdentity
	ldr r2, _080200B4 @ =gSideAffecting
	movs r1, 0x1
	ands r1, r0
	lsls r1, 1
	adds r1, r2
	ldrh r1, [r1]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08020020
	ldr r0, _080200AC @ =gUnknown_2023DD0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 6
	ands r0, r1
	cmp r0, 0
	bne _08020020
	cmp r4, 0
	bne _08020020
	ldr r0, _080200B0 @ =gUnknown_2023E82
	ldrb r0, [r0, 0x3]
	cmp r0, 0x7
	bhi _08020020
	bl _080210EC
_08020020:
	ldr r3, _080200A8 @ =gBattleMons
	ldr r2, _08020094 @ =gUnknown_2023D6E
	ldrb r1, [r2]
	movs r0, 0x58
	muls r0, r1
	adds r0, r3
	ldrh r0, [r0, 0x28]
	mov r9, r2
	mov r8, r3
	cmp r0, 0
	bne _08020046
	ldr r0, _080200B0 @ =gUnknown_2023E82
	ldrb r0, [r0, 0x3]
	cmp r0, 0xB
	beq _08020046
	cmp r0, 0x1F
	beq _08020046
	bl _080210EC
_08020046:
	mov r0, r9
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	mov r1, r8
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 17
	ands r0, r1
	cmp r0, 0
	beq _08020068
	cmp r7, 0x40
	beq _08020068
	bl _080210EC
_08020068:
	ldr r0, _080200B0 @ =gUnknown_2023E82
	ldrb r1, [r0, 0x3]
	adds r6, r0, 0
	cmp r1, 0x6
	bls _08020074
	b _080206A2
_08020074:
	ldr r1, _080200B8 @ =gUnknown_825053C
	ldrb r0, [r6, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0x10
	bne _08020084
	b _08020270
_08020084:
	cmp r0, 0x10
	bhi _080200BC
	cmp r0, 0x7
	beq _080200D6
	cmp r0, 0x8
	bne _08020092
	b _0802018C
_08020092:
	b _08020570
	.align 2, 0
_08020094: .4byte gUnknown_2023D6E
_08020098: .4byte gBattlerTarget
_0802009C: .4byte gBattleScripting
_080200A0: .4byte sBattler_AI
_080200A4: .4byte gBattleTypeFlags
_080200A8: .4byte gBattleMons
_080200AC: .4byte gUnknown_2023DD0
_080200B0: .4byte gUnknown_2023E82
_080200B4: .4byte gSideAffecting
_080200B8: .4byte gUnknown_825053C
_080200BC:
	cmp r0, 0x40
	bne _080200C2
	b _080203E4
_080200C2:
	cmp r0, 0x40
	bhi _080200CE
	cmp r0, 0x20
	bne _080200CC
	b _08020346
_080200CC:
	b _08020570
_080200CE:
	cmp r0, 0x80
	bne _080200D4
	b _08020440
_080200D4:
	b _08020570
_080200D6:
	mov r2, r9
	ldrb r1, [r2]
	movs r0, 0x58
	muls r0, r1
	add r0, r8
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x2B
	beq _08020138
	ldr r0, _08020130 @ =gActiveBattler
	movs r1, 0
	strb r1, [r0]
	ldr r1, _08020134 @ =gUnknown_2023BCC
	ldrb r3, [r1]
	adds r7, r0, 0
	mov r12, r1
	cmp r3, 0
	beq _08020144
	mov r4, r8
	ldr r0, [r4, 0x50]
	movs r1, 0x70
	ands r0, r1
	cmp r0, 0
	bne _08020144
	adds r1, r7, 0
	mov r6, r8
	adds r6, 0x50
	movs r5, 0x58
	movs r4, 0x70
_08020110:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r3
	bcs _08020144
	ldrb r0, [r7]
	muls r0, r5
	adds r0, r6
	ldr r0, [r0]
	ands r0, r4
	cmp r0, 0
	beq _08020110
	b _08020144
	.align 2, 0
_08020130: .4byte gActiveBattler
_08020134: .4byte gUnknown_2023BCC
_08020138:
	ldr r0, _08020184 @ =gActiveBattler
	ldr r2, _08020188 @ =gUnknown_2023BCC
	ldrb r1, [r2]
	strb r1, [r0]
	adds r7, r0, 0
	mov r12, r2
_08020144:
	mov r0, r9
	ldrb r2, [r0]
	movs r0, 0x58
	adds r1, r2, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x4C
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0802015C
	b _08020570
_0802015C:
	ldrb r0, [r7]
	mov r3, r12
	ldrb r3, [r3]
	cmp r0, r3
	beq _08020168
	b _08020570
_08020168:
	mov r4, r8
	adds r0, r1, r4
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x48
	bne _08020176
	b _08020570
_08020176:
	cmp r0, 0xF
	bne _0802017C
	b _08020570
_0802017C:
	adds r0, r2, 0
	bl CancelMultiTurnMoves
	b _08020560
	.align 2, 0
_08020184: .4byte gActiveBattler
_08020188: .4byte gUnknown_2023BCC
_0802018C:
	mov r2, r9
	ldrb r1, [r2]
	movs r0, 0x58
	muls r0, r1
	add r0, r8
	adds r0, 0x20
	ldrb r1, [r0]
	cmp r1, 0x11
	bne _080201E4
	cmp r4, 0x1
	beq _080201A6
	cmp r5, 0x80
	bne _080201E4
_080201A6:
	ldr r0, _080201D4 @ =gUnknown_2023D6A
	strb r1, [r0]
	mov r3, r9
	ldrb r0, [r3]
	movs r1, 0x11
	bl sub_80C71D0
	ldr r4, _080201D8 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r0, _080201DC @ =gUnknown_81D9438
_080201C0:
	str r0, [r4]
	ldr r2, _080201E0 @ =gUnknown_2023DD0
	ldr r1, [r2]
	movs r0, 0x80
	lsls r0, 6
	ands r0, r1
	cmp r0, 0
	beq _080201D2
	b _08020484
_080201D2:
	b _080204A8
	.align 2, 0
_080201D4: .4byte gUnknown_2023D6A
_080201D8: .4byte gUnknown_2023D74
_080201DC: .4byte gUnknown_81D9438
_080201E0: .4byte gUnknown_2023DD0
_080201E4:
	mov r1, r9
	ldrb r0, [r1]
	movs r1, 0x58
	muls r0, r1
	add r0, r8
	adds r1, r0, 0
	adds r1, 0x21
	ldrb r1, [r1]
	cmp r1, 0x3
	beq _08020208
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _08020208
	cmp r1, 0x8
	beq _08020208
	cmp r0, 0x8
	bne _08020222
_08020208:
	ldr r0, _0802026C @ =gUnknown_2023DD0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 6
	ands r0, r1
	cmp r0, 0
	beq _08020222
	cmp r4, 0x1
	bne _0802021C
	b _080204E8
_0802021C:
	cmp r5, 0x80
	bne _08020222
	b _080204E8
_08020222:
	mov r2, r9
	ldrb r1, [r2]
	movs r0, 0x58
	muls r1, r0
	mov r4, r8
	adds r3, r1, r4
	adds r0, r3, 0
	adds r0, 0x21
	ldrb r4, [r0]
	cmp r4, 0x3
	bne _0802023A
	b _08020570
_0802023A:
	adds r0, 0x1
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _08020244
	b _08020570
_08020244:
	cmp r4, 0x8
	bne _0802024A
	b _08020570
_0802024A:
	cmp r0, 0x8
	bne _08020250
	b _08020570
_08020250:
	mov r0, r8
	adds r0, 0x4C
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0802025E
	b _08020570
_0802025E:
	adds r0, r3, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x11
	bne _0802026A
	b _08020570
_0802026A:
	b _08020560
	.align 2, 0
_0802026C: .4byte gUnknown_2023DD0
_08020270:
	mov r2, r9
	ldrb r1, [r2]
	movs r0, 0x58
	muls r0, r1
	add r0, r8
	adds r0, 0x20
	ldrb r1, [r0]
	cmp r1, 0x29
	bne _080202B4
	cmp r4, 0x1
	beq _0802028A
	cmp r5, 0x80
	bne _080202B4
_0802028A:
	ldr r0, _080202A8 @ =gUnknown_2023D6A
	strb r1, [r0]
	mov r3, r9
	ldrb r0, [r3]
	movs r1, 0x29
	bl sub_80C71D0
	ldr r4, _080202AC @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r0, _080202B0 @ =gUnknown_81D9420
	b _080201C0
	.align 2, 0
_080202A8: .4byte gUnknown_2023D6A
_080202AC: .4byte gUnknown_2023D74
_080202B0: .4byte gUnknown_81D9420
_080202B4:
	mov r0, r9
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	mov r2, r8
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0xA
	beq _080202D4
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0xA
	bne _08020304
_080202D4:
	ldr r0, _080202F8 @ =gUnknown_2023DD0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 6
	ands r0, r1
	cmp r0, 0
	beq _08020304
	cmp r4, 0x1
	beq _080202EA
	cmp r5, 0x80
	bne _08020304
_080202EA:
	ldr r4, _080202FC @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r0, _08020300 @ =gUnknown_81D9420
	b _080204F4
	.align 2, 0
_080202F8: .4byte gUnknown_2023DD0
_080202FC: .4byte gUnknown_2023D74
_08020300: .4byte gUnknown_81D9420
_08020304:
	mov r3, r9
	ldrb r0, [r3]
	movs r1, 0x58
	adds r2, r0, 0
	muls r2, r1
	mov r4, r8
	adds r1, r2, r4
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0xA
	bne _0802031E
	b _08020570
_0802031E:
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0xA
	bne _0802032A
	b _08020570
_0802032A:
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x29
	bne _08020336
	b _08020570
_08020336:
	mov r0, r8
	adds r0, 0x4C
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _08020344
	b _08020570
_08020344:
	b _08020560
_08020346:
	movs r0, 0
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _08020382
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	cmp r0, 0
	bne _08020382
	ldr r0, _080203D8 @ =gBattleWeather
	ldrh r1, [r0]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _08020382
	movs r1, 0
	str r1, [sp, 0x4]
_08020382:
	ldr r4, _080203DC @ =gBattleMons
	ldr r0, _080203E0 @ =gUnknown_2023D6E
	ldrb r3, [r0]
	movs r0, 0x58
	adds r2, r3, 0
	muls r2, r0
	adds r1, r2, r4
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0xF
	bne _0802039C
	b _08020570
_0802039C:
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0xF
	bne _080203A8
	b _08020570
_080203A8:
	adds r0, r4, 0
	adds r0, 0x4C
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _080203B6
	b _08020570
_080203B6:
	ldr r2, [sp, 0x4]
	cmp r2, 0
	bne _080203BE
	b _08020570
_080203BE:
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x28
	bne _080203CA
	b _08020570
_080203CA:
	adds r0, r3, 0
	bl CancelMultiTurnMoves
	movs r3, 0x1
	mov r10, r3
	b _08020570
	.align 2, 0
_080203D8: .4byte gBattleWeather
_080203DC: .4byte gBattleMons
_080203E0: .4byte gUnknown_2023D6E
_080203E4:
	mov r0, r9
	ldrb r1, [r0]
	movs r0, 0x58
	muls r1, r0
	mov r2, r8
	adds r0, r1, r2
	adds r0, 0x20
	ldrb r2, [r0]
	cmp r2, 0x7
	bne _0802042C
	cmp r4, 0x1
	beq _08020402
	cmp r5, 0x80
	beq _08020402
	b _08020570
_08020402:
	ldr r0, _08020420 @ =gUnknown_2023D6A
	strb r2, [r0]
	mov r3, r9
	ldrb r0, [r3]
	movs r1, 0x7
	bl sub_80C71D0
	ldr r4, _08020424 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r0, _08020428 @ =gUnknown_81D942C
	b _080201C0
	.align 2, 0
_08020420: .4byte gUnknown_2023D6A
_08020424: .4byte gUnknown_2023D74
_08020428: .4byte gUnknown_81D942C
_0802042C:
	mov r0, r8
	adds r0, 0x4C
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0802043A
	b _08020570
_0802043A:
	movs r4, 0x1
	mov r10, r4
	b _08020570
_08020440:
	mov r0, r9
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	add r0, r8
	adds r0, 0x20
	ldrb r1, [r0]
	cmp r1, 0x11
	bne _080204AE
	cmp r4, 0x1
	beq _0802045A
	cmp r5, 0x80
	bne _080204AE
_0802045A:
	ldr r0, _08020494 @ =gUnknown_2023D6A
	strb r1, [r0]
	mov r1, r9
	ldrb r0, [r1]
	movs r1, 0x11
	bl sub_80C71D0
	ldr r4, _08020498 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r0, _0802049C @ =gUnknown_81D9438
	str r0, [r4]
	ldr r2, _080204A0 @ =gUnknown_2023DD0
	ldr r1, [r2]
	movs r0, 0x80
	lsls r0, 6
	ands r0, r1
	cmp r0, 0
	beq _080204A8
_08020484:
	movs r0, 0x1
	strb r0, [r6, 0x5]
	ldr r0, _080204A4 @ =0xffffdfff
	ands r1, r0
	str r1, [r2]
	bl _0802110A
	.align 2, 0
_08020494: .4byte gUnknown_2023D6A
_08020498: .4byte gUnknown_2023D74
_0802049C: .4byte gUnknown_81D9438
_080204A0: .4byte gUnknown_2023DD0
_080204A4: .4byte 0xffffdfff
_080204A8:
	strb r0, [r6, 0x5]
	bl _0802110A
_080204AE:
	mov r2, r9
	ldrb r0, [r2]
	movs r1, 0x58
	muls r0, r1
	add r0, r8
	adds r1, r0, 0
	adds r1, 0x21
	ldrb r1, [r1]
	cmp r1, 0x3
	beq _080204D2
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _080204D2
	cmp r1, 0x8
	beq _080204D2
	cmp r0, 0x8
	bne _08020510
_080204D2:
	ldr r0, _08020500 @ =gUnknown_2023DD0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 6
	ands r0, r1
	cmp r0, 0
	beq _08020510
	cmp r4, 0x1
	beq _080204E8
	cmp r5, 0x80
	bne _08020510
_080204E8:
	ldr r4, _08020504 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r0, _08020508 @ =gUnknown_81D9438
_080204F4:
	str r0, [r4]
	ldr r1, _0802050C @ =gUnknown_2023E82
	movs r0, 0x2
	strb r0, [r1, 0x5]
	bl _0802110A
	.align 2, 0
_08020500: .4byte gUnknown_2023DD0
_08020504: .4byte gUnknown_2023D74
_08020508: .4byte gUnknown_81D9438
_0802050C: .4byte gUnknown_2023E82
_08020510:
	mov r3, r9
	ldrb r0, [r3]
	movs r6, 0x58
	muls r0, r6
	mov r2, r8
	adds r2, 0x4C
	adds r5, r0, r2
	ldr r4, [r5]
	cmp r4, 0
	bne _08020570
	mov r3, r8
	adds r1, r0, r3
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r3, [r0]
	cmp r3, 0x3
	beq _08020566
	adds r0, 0x1
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _08020566
	cmp r3, 0x8
	beq _08020566
	cmp r0, 0x8
	beq _08020566
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x11
	beq _08020570
	mov r4, r9
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x9
	negs r2, r2
	ands r0, r2
	str r0, [r1]
_08020560:
	movs r0, 0x1
	mov r10, r0
	b _08020570
_08020566:
	ldr r0, _080205B4 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0]
_08020570:
	mov r1, r10
	cmp r1, 0x1
	beq _08020578
	b _08020694
_08020578:
	ldr r0, _080205B8 @ =gUnknown_2023D74
	ldr r0, [r0]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r1, _080205BC @ =gUnknown_825053C
	ldr r0, _080205C0 @ =gUnknown_2023E82
	ldrb r0, [r0, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r3, [r0]
	cmp r3, 0x7
	bne _080205CC
	bl Random
	ldr r2, _080205C4 @ =gBattleMons
	ldr r1, _080205C8 @ =gUnknown_2023D6E
	ldrb r3, [r1]
	movs r1, 0x58
	muls r3, r1
	adds r2, 0x4C
	adds r3, r2
	movs r1, 0x3
	ands r1, r0
	adds r1, 0x2
	ldr r0, [r3]
	orrs r0, r1
	str r0, [r3]
	b _080205E0
	.align 2, 0
_080205B4: .4byte gMoveResultFlags
_080205B8: .4byte gUnknown_2023D74
_080205BC: .4byte gUnknown_825053C
_080205C0: .4byte gUnknown_2023E82
_080205C4: .4byte gBattleMons
_080205C8: .4byte gUnknown_2023D6E
_080205CC:
	ldr r2, _08020630 @ =gBattleMons
	ldr r0, _08020634 @ =gUnknown_2023D6E
	ldrb r1, [r0]
	movs r0, 0x58
	muls r1, r0
	adds r2, 0x4C
	adds r1, r2
	ldr r0, [r1]
	orrs r0, r3
	str r0, [r1]
_080205E0:
	ldr r2, _08020638 @ =gUnknown_2023D74
	ldr r1, _0802063C @ =gUnknown_825062C
	ldr r5, _08020640 @ =gUnknown_2023E82
	ldrb r0, [r5, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	ldr r4, _08020644 @ =gActiveBattler
	ldr r1, _08020634 @ =gUnknown_2023D6E
	ldrb r0, [r1]
	strb r0, [r4]
	ldrb r1, [r1]
	movs r0, 0x58
	muls r0, r1
	ldr r1, _08020648 @ =gUnknown_2023C30
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl EmitSetMonData
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	ldr r2, _0802064C @ =gUnknown_2023DD0
	ldr r1, [r2]
	movs r0, 0x80
	lsls r0, 6
	ands r0, r1
	cmp r0, 0
	beq _08020654
	movs r0, 0x1
	strb r0, [r5, 0x5]
	ldr r0, _08020650 @ =0xffffdfff
	ands r1, r0
	str r1, [r2]
	b _08020656
	.align 2, 0
_08020630: .4byte gBattleMons
_08020634: .4byte gUnknown_2023D6E
_08020638: .4byte gUnknown_2023D74
_0802063C: .4byte gUnknown_825062C
_08020640: .4byte gUnknown_2023E82
_08020644: .4byte gActiveBattler
_08020648: .4byte gUnknown_2023C30
_0802064C: .4byte gUnknown_2023DD0
_08020650: .4byte 0xffffdfff
_08020654:
	strb r0, [r5, 0x5]
_08020656:
	ldr r0, _08020688 @ =gUnknown_2023E82
	ldrb r2, [r0, 0x3]
	adds r6, r0, 0
	cmp r2, 0x2
	beq _08020670
	cmp r2, 0x6
	beq _08020670
	cmp r2, 0x5
	beq _08020670
	cmp r2, 0x3
	beq _08020670
	bl _0802110A
_08020670:
	ldr r0, _0802068C @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xB4
	ldrb r1, [r6, 0x3]
	strb r1, [r0]
	ldr r2, _08020690 @ =gUnknown_2023DD0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 7
	bl _08021008
	.align 2, 0
_08020688: .4byte gUnknown_2023E82
_0802068C: .4byte gBattleStruct
_08020690: .4byte gUnknown_2023DD0
_08020694:
	mov r2, r10
	cmp r2, 0
	beq _0802069E
	bl _0802110A
_0802069E:
	bl _080210EC
_080206A2:
	mov r3, r9
	ldrb r1, [r3]
	movs r0, 0x58
	muls r1, r0
	mov r0, r8
	adds r0, 0x50
	adds r1, r0
	ldr r2, _080206DC @ =gUnknown_825053C
	ldrb r3, [r6, 0x3]
	lsls r0, r3, 2
	adds r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _080206C6
	bl _080210EC
_080206C6:
	subs r0, r3, 0x7
	cmp r0, 0x34
	bls _080206D0
	bl _0802110A
_080206D0:
	lsls r0, 2
	ldr r1, _080206E0 @ =_080206E4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080206DC: .4byte gUnknown_825053C
_080206E0: .4byte _080206E4
	.align 2, 0
_080206E4:
	.4byte _080207B8
	.4byte _0802082C
	.4byte _080209A0
	.4byte _080208B8
	.4byte _08020934
	.4byte _080209D8
	.4byte _08020A20
	.4byte _08020AEC
	.4byte _08020B30
	.4byte _08020B30
	.4byte _08020B30
	.4byte _08020B30
	.4byte _08020B30
	.4byte _08020B30
	.4byte _08020B30
	.4byte _08020B74
	.4byte _08020B74
	.4byte _08020B74
	.4byte _08020B74
	.4byte _08020B74
	.4byte _08020B74
	.4byte _08020B74
	.4byte _08020C40
	.4byte _08020C88
	.4byte _08020CA8
	.4byte _08020E78
	.4byte _08020EB4
	.4byte _08020ED0
	.4byte _08020EE8
	.4byte _08020F00
	.4byte _08020F60
	.4byte _08020F78
	.4byte _08020BB8
	.4byte _08020BB8
	.4byte _08020BB8
	.4byte _08020BB8
	.4byte _08020BB8
	.4byte _08020BB8
	.4byte _08020BB8
	.4byte _08020BFC
	.4byte _08020BFC
	.4byte _08020BFC
	.4byte _08020BFC
	.4byte _08020BFC
	.4byte _08020BFC
	.4byte _08020BFC
	.4byte _08020FBC
	.4byte _08021018
	.4byte _0802110A
	.4byte _0802110A
	.4byte _0802110A
	.4byte _0802110A
	.4byte _080210FC
_080207B8:
	mov r4, r9
	ldrb r0, [r4]
	movs r5, 0x58
	adds r1, r0, 0
	muls r1, r5
	mov r2, r8
	adds r0, r1, r2
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x14
	bne _080207D2
	bl _080210EC
_080207D2:
	mov r4, r8
	adds r4, 0x50
	adds r0, r1, r4
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _080207E6
	bl _080210EC
_080207E6:
	bl Random
	mov r3, r9
	ldrb r1, [r3]
	adds r2, r1, 0
	muls r2, r5
	adds r2, r4
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r1, 16
	adds r1, 0x2
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r4, _08020820 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r1, _08020824 @ =gUnknown_825062C
	ldr r0, _08020828 @ =gUnknown_2023E82
	ldrb r0, [r0, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _08021108
	.align 2, 0
_08020820: .4byte gUnknown_2023D74
_08020824: .4byte gUnknown_825062C
_08020828: .4byte gUnknown_2023E82
_0802082C:
	mov r0, r9
	ldrb r2, [r0]
	movs r6, 0x58
	adds r0, r2, 0
	muls r0, r6
	add r0, r8
	adds r0, 0x20
	ldrb r1, [r0]
	cmp r1, 0x27
	bne _08020870
	cmp r4, 0x1
	beq _0802084C
	cmp r5, 0x80
	beq _0802084C
	bl _080210EC
_0802084C:
	ldr r0, _08020864 @ =gUnknown_2023D6A
	strb r1, [r0]
	mov r1, r9
	ldrb r0, [r1]
	movs r1, 0x27
	bl sub_80C71D0
	ldr r1, _08020868 @ =gUnknown_2023D74
	ldr r0, _0802086C @ =gUnknown_81D9452
	str r0, [r1]
	bl _0802110A
	.align 2, 0
_08020864: .4byte gUnknown_2023D6A
_08020868: .4byte gUnknown_2023D74
_0802086C: .4byte gUnknown_81D9452
_08020870:
	adds r0, r2, 0
	bl BankGetTurnOrder
	ldr r1, _080208AC @ =gUnknown_2023BE2
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bhi _08020886
	bl _080210EC
_08020886:
	mov r2, r9
	ldrb r0, [r2]
	adds r2, r0, 0
	muls r2, r6
	mov r0, r8
	adds r0, 0x50
	adds r2, r0
	ldr r1, _080208B0 @ =gUnknown_825053C
	ldr r0, _080208B4 @ =gUnknown_2023E82
	ldrb r0, [r0, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r2]
	bl _080210EC
	.align 2, 0
_080208AC: .4byte gUnknown_2023BE2
_080208B0: .4byte gUnknown_825053C
_080208B4: .4byte gUnknown_2023E82
_080208B8:
	mov r3, r9
	ldrb r0, [r3]
	movs r5, 0x58
	muls r0, r5
	mov r4, r8
	adds r4, 0x50
	adds r2, r0, r4
	ldr r1, [r2]
	movs r0, 0x70
	ands r0, r1
	cmp r0, 0
	beq _080208D4
	bl _080210EC
_080208D4:
	movs r0, 0x80
	lsls r0, 5
	orrs r1, r0
	str r1, [r2]
	ldr r1, _08020920 @ =gUnknown_2023DB8
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r1
	ldr r1, _08020924 @ =gCurrentMove
	ldrh r1, [r1]
	strh r1, [r0]
	bl Random
	mov r2, r9
	ldrb r1, [r2]
	adds r2, r1, 0
	muls r2, r5
	adds r2, r4
	movs r1, 0x3
	ands r1, r0
	adds r1, 0x2
	lsls r1, 4
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r4, _08020928 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r1, _0802092C @ =gUnknown_825062C
	ldr r0, _08020930 @ =gUnknown_2023E82
	ldrb r0, [r0, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _08021108
	.align 2, 0
_08020920: .4byte gUnknown_2023DB8
_08020924: .4byte gCurrentMove
_08020928: .4byte gUnknown_2023D74
_0802092C: .4byte gUnknown_825062C
_08020930: .4byte gUnknown_2023E82
_08020934:
	ldr r5, _08020984 @ =sBattler_AI
	ldrb r0, [r5]
	bl GetBankIdentity
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	bne _0802096C
	ldr r4, _08020988 @ =gUnknown_2023E7E
	ldrh r3, [r4]
	ldr r2, _0802098C @ =gBattleMons
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x2A
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	adds r0, r3, r0
	strh r0, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r3, r0
	bls _0802096C
	ldr r3, _08020990 @ =0x0000ffff
	adds r0, r3, 0
	strh r0, [r4]
_0802096C:
	ldr r4, _08020994 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r1, _08020998 @ =gUnknown_825062C
	ldr r0, _0802099C @ =gUnknown_2023E82
	ldrb r0, [r0, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	b _08021108
	.align 2, 0
_08020984: .4byte sBattler_AI
_08020988: .4byte gUnknown_2023E7E
_0802098C: .4byte gBattleMons
_08020990: .4byte 0x0000ffff
_08020994: .4byte gUnknown_2023D74
_08020998: .4byte gUnknown_825062C
_0802099C: .4byte gUnknown_2023E82
_080209A0:
	mov r4, r9
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	mov r1, r8
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _080209B6
	b _080210EC
_080209B6:
	bl Random
	ldr r4, _080209D4 @ =gUnknown_2023E82
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	adds r0, 0x3
	strb r0, [r4, 0x3]
	movs r0, 0
	movs r1, 0
	bl sub_801FF20
	b _0802110A
	.align 2, 0
_080209D4: .4byte gUnknown_2023E82
_080209D8:
	mov r0, r9
	ldrb r1, [r0]
	movs r0, 0x58
	adds r2, r1, 0
	muls r2, r0
	mov r0, r8
	adds r0, 0x50
	adds r2, r0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 5
	orrs r0, r1
	str r0, [r2]
	ldr r1, _08020A14 @ =gUnknown_2023DB8
	mov r2, r9
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r1
	ldr r1, _08020A18 @ =gCurrentMove
	ldrh r1, [r1]
	strh r1, [r0]
	ldr r0, _08020A1C @ =gUnknown_2023E8C
	ldrb r1, [r2]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1, 0x1]
	b _080210EC
	.align 2, 0
_08020A14: .4byte gUnknown_2023DB8
_08020A18: .4byte gCurrentMove
_08020A1C: .4byte gUnknown_2023E8C
_08020A20:
	mov r3, r9
	ldrb r0, [r3]
	movs r6, 0x58
	muls r0, r6
	mov r4, r8
	adds r4, 0x50
	adds r0, r4
	ldr r5, [r0]
	movs r0, 0xE0
	lsls r0, 8
	ands r5, r0
	cmp r5, 0
	beq _08020A3C
	b _080210EC
_08020A3C:
	bl Random
	mov r2, r9
	ldrb r1, [r2]
	adds r2, r1, 0
	muls r2, r6
	adds r2, r4
	movs r1, 0x3
	ands r1, r0
	adds r1, 0x3
	lsls r1, 13
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	mov r3, r9
	ldrb r1, [r3]
	ldr r2, _08020AD0 @ =gBattleStruct
	ldr r0, [r2]
	lsls r1, 1
	adds r1, r0
	ldr r6, _08020AD4 @ =gCurrentMove
	ldrh r0, [r6]
	strb r0, [r1, 0x4]
	ldrb r1, [r3]
	ldr r0, [r2]
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r6]
	lsrs r0, 8
	strb r0, [r1, 0x5]
	ldrb r1, [r3]
	ldr r0, [r2]
	adds r1, r0
	ldr r0, _08020AD8 @ =sBattler_AI
	ldrb r0, [r0]
	strb r0, [r1, 0x14]
	ldr r4, _08020ADC @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r1, _08020AE0 @ =gUnknown_825062C
	ldr r2, _08020AE4 @ =gUnknown_2023E82
	ldrb r0, [r2, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [r4]
	strb r5, [r2, 0x5]
	ldr r3, _08020AE8 @ =gUnknown_83FE664
	ldrh r0, [r3]
	ldrh r4, [r6]
	cmp r0, r4
	bne _08020AAA
	b _0802110A
_08020AAA:
	adds r1, r2, 0
	adds r2, r6, 0
_08020AAE:
	ldrb r0, [r1, 0x5]
	adds r0, 0x1
	strb r0, [r1, 0x5]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _08020ABE
	b _0802110A
_08020ABE:
	ldrb r0, [r1, 0x5]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	ldrh r4, [r2]
	cmp r0, r4
	bne _08020AAE
	b _0802110A
	.align 2, 0
_08020AD0: .4byte gBattleStruct
_08020AD4: .4byte gCurrentMove
_08020AD8: .4byte sBattler_AI
_08020ADC: .4byte gUnknown_2023D74
_08020AE0: .4byte gUnknown_825062C
_08020AE4: .4byte gUnknown_2023E82
_08020AE8: .4byte gUnknown_83FE664
_08020AEC:
	ldr r1, _08020B1C @ =gBattleMoveDamage
	ldr r0, _08020B20 @ =gUnknown_2023D54
	ldr r0, [r0]
	cmp r0, 0
	bge _08020AF8
	adds r0, 0x3
_08020AF8:
	asrs r0, 2
	str r0, [r1]
	cmp r0, 0
	bne _08020B04
	movs r0, 0x1
	str r0, [r1]
_08020B04:
	ldr r4, _08020B24 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r1, _08020B28 @ =gUnknown_825062C
	ldr r0, _08020B2C @ =gUnknown_2023E82
	ldrb r0, [r0, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	b _08021108
	.align 2, 0
_08020B1C: .4byte gBattleMoveDamage
_08020B20: .4byte gUnknown_2023D54
_08020B24: .4byte gUnknown_2023D74
_08020B28: .4byte gUnknown_825062C
_08020B2C: .4byte gUnknown_2023E82
_08020B30:
	ldrb r1, [r6, 0x3]
	adds r1, 0xF2
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x10
	adds r2, r7, 0
	movs r3, 0
	bl ChangeStatBuffs
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _08020B4C
	b _080210EC
_08020B4C:
	ldr r2, _08020B68 @ =gBattleScripting
	ldrb r1, [r6, 0x3]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2, 0x10]
	strb r3, [r2, 0x11]
	ldr r4, _08020B6C @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r0, _08020B70 @ =gUnknown_81D6BD1
	b _08021108
	.align 2, 0
_08020B68: .4byte gBattleScripting
_08020B6C: .4byte gUnknown_2023D74
_08020B70: .4byte gUnknown_81D6BD1
_08020B74:
	movs r0, 0x70
	negs r0, r0
	ldrb r1, [r6, 0x3]
	adds r1, 0xEB
	lsls r1, 24
	lsrs r1, 24
	adds r2, r7, 0
	movs r3, 0
	bl ChangeStatBuffs
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _08020B92
	b _080210EC
_08020B92:
	ldr r2, _08020BAC @ =gBattleScripting
	ldrb r1, [r6, 0x3]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2, 0x10]
	strb r3, [r2, 0x11]
	ldr r4, _08020BB0 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r0, _08020BB4 @ =gUnknown_81D6C62
	b _08021108
	.align 2, 0
_08020BAC: .4byte gBattleScripting
_08020BB0: .4byte gUnknown_2023D74
_08020BB4: .4byte gUnknown_81D6C62
_08020BB8:
	ldrb r1, [r6, 0x3]
	adds r1, 0xDA
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x20
	adds r2, r7, 0
	movs r3, 0
	bl ChangeStatBuffs
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _08020BD4
	b _080210EC
_08020BD4:
	ldr r2, _08020BF0 @ =gBattleScripting
	ldrb r1, [r6, 0x3]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2, 0x10]
	strb r3, [r2, 0x11]
	ldr r4, _08020BF4 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r0, _08020BF8 @ =gUnknown_81D6BD1
	b _08021108
	.align 2, 0
_08020BF0: .4byte gBattleScripting
_08020BF4: .4byte gUnknown_2023D74
_08020BF8: .4byte gUnknown_81D6BD1
_08020BFC:
	movs r0, 0x60
	negs r0, r0
	ldrb r1, [r6, 0x3]
	adds r1, 0xD3
	lsls r1, 24
	lsrs r1, 24
	adds r2, r7, 0
	movs r3, 0
	bl ChangeStatBuffs
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _08020C1A
	b _080210EC
_08020C1A:
	ldr r2, _08020C34 @ =gBattleScripting
	ldrb r1, [r6, 0x3]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2, 0x10]
	strb r3, [r2, 0x11]
	ldr r4, _08020C38 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r0, _08020C3C @ =gUnknown_81D6C62
	b _08021108
	.align 2, 0
_08020C34: .4byte gBattleScripting
_08020C38: .4byte gUnknown_2023D74
_08020C3C: .4byte gUnknown_81D6C62
_08020C40:
	mov r0, r9
	ldrb r1, [r0]
	movs r0, 0x58
	adds r2, r1, 0
	muls r2, r0
	mov r0, r8
	adds r0, 0x50
	adds r2, r0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 15
	orrs r0, r1
	str r0, [r2]
	ldr r2, _08020C7C @ =gDisableStructs
	mov r3, r9
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2
	strb r1, [r0, 0x19]
	ldr r1, _08020C80 @ =gUnknown_2023DB8
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r1
	ldr r1, _08020C84 @ =gCurrentMove
	ldrh r1, [r1]
	strh r1, [r0]
	b _080210EC
	.align 2, 0
_08020C7C: .4byte gDisableStructs
_08020C80: .4byte gUnknown_2023DB8
_08020C84: .4byte gCurrentMove
_08020C88:
	ldr r0, _08020CA4 @ =sBattler_AI
	ldrb r1, [r0]
	movs r0, 0x58
	adds r2, r1, 0
	muls r2, r0
	mov r0, r8
	adds r0, 0x50
	adds r2, r0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 16
_08020C9E:
	orrs r0, r1
	str r0, [r2]
	b _080210EC
	.align 2, 0
_08020CA4: .4byte sBattler_AI
_08020CA8:
	ldr r5, _08020D64 @ =gBattleTypeFlags
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 12
	ands r0, r1
	cmp r0, 0
	beq _08020CB8
	b _080210EC
_08020CB8:
	ldr r4, _08020D68 @ =sBattler_AI
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08020CEA
	ldr r0, [r5]
	ldr r1, _08020D6C @ =0x00000902
	ands r0, r1
	cmp r0, 0
	bne _08020D26
	ldr r0, _08020D70 @ =gTrainerBattleOpponent_A
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _08020CEA
	b _080210EC
_08020CEA:
	ldr r0, _08020D64 @ =gBattleTypeFlags
	ldr r0, [r0]
	ldr r1, _08020D6C @ =0x00000902
	ands r0, r1
	cmp r0, 0
	bne _08020D26
	ldr r0, _08020D70 @ =gTrainerBattleOpponent_A
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _08020D26
	ldr r0, _08020D74 @ =gUnknown_2023F20
	adds r0, 0x29
	adds r0, r6, r0
	ldrb r1, [r0]
	ldr r3, _08020D78 @ =gBitTable
	ldr r2, _08020D7C @ =gBattlerPartyIndexes
	ldr r0, _08020D68 @ =sBattler_AI
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08020D26
	b _080210EC
_08020D26:
	ldr r2, _08020D80 @ =gBattleMons
	ldr r1, _08020D84 @ =gBattlerTarget
	ldrb r0, [r1]
	movs r3, 0x58
	muls r0, r3
	adds r4, r0, r2
	ldrh r0, [r4, 0x2E]
	adds r7, r1, 0
	mov r8, r2
	cmp r0, 0
	beq _08020D94
	adds r0, r4, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x3C
	bne _08020D94
	ldr r1, _08020D88 @ =gUnknown_2023D74
	ldr r0, _08020D8C @ =gUnknown_81D948E
	str r0, [r1]
	ldr r1, _08020D90 @ =gUnknown_2023D6A
	ldrb r0, [r7]
	muls r0, r3
	add r0, r8
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	ldrb r1, [r1]
	bl sub_80C71D0
	b _0802110A
	.align 2, 0
_08020D64: .4byte gBattleTypeFlags
_08020D68: .4byte sBattler_AI
_08020D6C: .4byte 0x00000902
_08020D70: .4byte gTrainerBattleOpponent_A
_08020D74: .4byte gUnknown_2023F20
_08020D78: .4byte gBitTable
_08020D7C: .4byte gBattlerPartyIndexes
_08020D80: .4byte gBattleMons
_08020D84: .4byte gBattlerTarget
_08020D88: .4byte gUnknown_2023D74
_08020D8C: .4byte gUnknown_81D948E
_08020D90: .4byte gUnknown_2023D6A
_08020D94:
	ldr r4, _08020E60 @ =sBattler_AI
	mov r10, r4
	ldrb r2, [r4]
	movs r0, 0x58
	mov r9, r0
	mov r0, r9
	muls r0, r2
	add r0, r8
	ldrh r4, [r0, 0x2E]
	cmp r4, 0
	beq _08020DAC
	b _080210EC
_08020DAC:
	ldrb r0, [r7]
	mov r1, r9
	muls r1, r0
	adds r0, r1, 0
	add r0, r8
	ldrh r3, [r0, 0x2E]
	adds r1, r3, 0
	cmp r1, 0xAF
	bne _08020DC0
	b _080210EC
_08020DC0:
	adds r0, r3, 0
	subs r0, 0x79
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xB
	bhi _08020DCE
	b _080210EC
_08020DCE:
	cmp r1, 0
	bne _08020DD4
	b _080210EC
_08020DD4:
	ldr r5, _08020E64 @ =gBattleStruct
	lsls r0, r2, 1
	adds r0, 0xD0
	ldr r1, [r5]
	adds r1, r0
	ldr r2, _08020E68 @ =gUnknown_2023D68
	strh r3, [r1]
	strh r3, [r2]
	ldrb r0, [r7]
	mov r3, r9
	muls r3, r0
	adds r0, r3, 0
	add r0, r8
	movs r6, 0
	strh r4, [r0, 0x2E]
	ldr r4, _08020E6C @ =gActiveBattler
	mov r1, r10
	ldrb r0, [r1]
	strb r0, [r4]
	str r2, [sp]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl EmitSetMonData
	mov r2, r10
	ldrb r0, [r2]
	bl MarkBufferBankForExecution
	ldrb r0, [r7]
	strb r0, [r4]
	ldrb r0, [r7]
	mov r3, r9
	muls r3, r0
	adds r0, r3, 0
	mov r1, r8
	adds r1, 0x2E
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl EmitSetMonData
	ldrb r0, [r7]
	bl MarkBufferBankForExecution
	ldr r4, _08020E70 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r0, _08020E74 @ =gUnknown_81D9271
	str r0, [r4]
	ldrb r0, [r7]
	ldr r1, [r5]
	lsls r0, 1
	adds r0, r1
	adds r0, 0xC8
	strb r6, [r0]
	ldrb r0, [r7]
	ldr r1, [r5]
	lsls r0, 1
	adds r0, r1
	adds r0, 0xC9
	strb r6, [r0]
	b _0802110A
	.align 2, 0
_08020E60: .4byte sBattler_AI
_08020E64: .4byte gBattleStruct
_08020E68: .4byte gUnknown_2023D68
_08020E6C: .4byte gActiveBattler
_08020E70: .4byte gUnknown_2023D74
_08020E74: .4byte gUnknown_81D9271
_08020E78:
	ldr r3, _08020EA8 @ =gBattlerTarget
	ldrb r1, [r3]
	movs r0, 0x58
	adds r2, r1, 0
	muls r2, r0
	mov r0, r8
	adds r0, 0x50
	adds r2, r0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 19
	orrs r0, r1
	str r0, [r2]
	ldr r2, _08020EAC @ =gDisableStructs
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _08020EB0 @ =sBattler_AI
	ldrb r1, [r1]
	strb r1, [r0, 0x14]
	b _080210EC
	.align 2, 0
_08020EA8: .4byte gBattlerTarget
_08020EAC: .4byte gDisableStructs
_08020EB0: .4byte sBattler_AI
_08020EB4:
	ldr r0, _08020ECC @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0x58
	adds r2, r1, 0
	muls r2, r0
	mov r0, r8
	adds r0, 0x50
	adds r2, r0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 20
	b _08020C9E
	.align 2, 0
_08020ECC: .4byte gBattlerTarget
_08020ED0:
	ldr r4, _08020EE0 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r0, _08020EE4 @ =gUnknown_81D8D55
	b _08021108
	.align 2, 0
_08020EE0: .4byte gUnknown_2023D74
_08020EE4: .4byte gUnknown_81D8D55
_08020EE8:
	ldr r4, _08020EF8 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r0, _08020EFC @ =gUnknown_81D8DF1
	b _08021108
	.align 2, 0
_08020EF8: .4byte gUnknown_2023D74
_08020EFC: .4byte gUnknown_81D8DF1
_08020F00:
	ldr r6, _08020F50 @ =gBattlerTarget
	ldrb r0, [r6]
	movs r2, 0x58
	muls r0, r2
	mov r1, r8
	adds r1, 0x4C
	adds r5, r0, r1
	ldr r4, [r5]
	movs r0, 0x40
	ands r0, r4
	cmp r0, 0
	bne _08020F1A
	b _080210EC
_08020F1A:
	movs r0, 0x41
	negs r0, r0
	ands r4, r0
	str r4, [r5]
	ldr r4, _08020F54 @ =gActiveBattler
	ldrb r0, [r6]
	strb r0, [r4]
	ldrb r0, [r4]
	muls r0, r2
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl EmitSetMonData
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	ldr r4, _08020F58 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r0, _08020F5C @ =gUnknown_81D9177
	b _08021108
	.align 2, 0
_08020F50: .4byte gBattlerTarget
_08020F54: .4byte gActiveBattler
_08020F58: .4byte gUnknown_2023D74
_08020F5C: .4byte gUnknown_81D9177
_08020F60:
	ldr r4, _08020F70 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r0, _08020F74 @ =gUnknown_81D8F35
	b _08021108
	.align 2, 0
_08020F70: .4byte gUnknown_2023D74
_08020F74: .4byte gUnknown_81D8F35
_08020F78:
	ldr r4, _08020FA8 @ =gBattleMoveDamage
	ldr r0, _08020FAC @ =gUnknown_2023D54
	ldr r0, [r0]
	movs r1, 0x3
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _08020F8E
	movs r0, 0x1
	str r0, [r4]
_08020F8E:
	ldr r4, _08020FB0 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r1, _08020FB4 @ =gUnknown_825062C
	ldr r0, _08020FB8 @ =gUnknown_2023E82
	ldrb r0, [r0, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	b _08021108
	.align 2, 0
_08020FA8: .4byte gBattleMoveDamage
_08020FAC: .4byte gUnknown_2023D54
_08020FB0: .4byte gUnknown_2023D74
_08020FB4: .4byte gUnknown_825062C
_08020FB8: .4byte gUnknown_2023E82
_08020FBC:
	mov r4, r9
	ldrb r0, [r4]
	movs r5, 0x58
	muls r0, r5
	mov r4, r8
	adds r4, 0x50
	adds r2, r0, r4
	ldr r1, [r2]
	movs r0, 0xC0
	lsls r0, 4
	ands r0, r1
	cmp r0, 0
	beq _08020FD8
	b _080210EC
_08020FD8:
	movs r0, 0x80
	lsls r0, 5
	orrs r1, r0
	str r1, [r2]
	ldr r1, _08021010 @ =gUnknown_2023DB8
	mov r2, r9
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r1
	ldr r1, _08021014 @ =gCurrentMove
	ldrh r1, [r1]
	strh r1, [r0]
	bl Random
	mov r3, r9
	ldrb r1, [r3]
	adds r2, r1, 0
	muls r2, r5
	adds r2, r4
	movs r1, 0x1
	ands r1, r0
	adds r1, 0x2
	lsls r1, 10
	ldr r0, [r2]
_08021008:
	orrs r0, r1
	str r0, [r2]
	b _0802110A
	.align 2, 0
_08021010: .4byte gUnknown_2023DB8
_08021014: .4byte gCurrentMove
_08021018:
	mov r5, r9
	ldrb r3, [r5]
	movs r4, 0x58
	adds r0, r3, 0
	muls r0, r4
	mov r2, r8
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r2, [r0]
	cmp r2, 0x3C
	bne _08021058
	ldrh r0, [r1, 0x2E]
	cmp r0, 0
	beq _080210EC
	ldr r0, _0802104C @ =gUnknown_2023D6A
	strb r2, [r0]
	ldr r1, _08021050 @ =gUnknown_2023D74
	ldr r0, _08021054 @ =gUnknown_81D948E
	str r0, [r1]
	ldrb r0, [r5]
	movs r1, 0x3C
	bl sub_80C71D0
	b _0802110A
	.align 2, 0
_0802104C: .4byte gUnknown_2023D6A
_08021050: .4byte gUnknown_2023D74
_08021054: .4byte gUnknown_81D948E
_08021058:
	ldrh r0, [r1, 0x2E]
	cmp r0, 0
	beq _080210EC
	adds r0, r3, 0
	bl GetBankSide
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080210D0 @ =gUnknown_2023D68
	mov r3, r9
	ldrb r0, [r3]
	muls r0, r4
	add r0, r8
	ldrh r0, [r0, 0x2E]
	strh r0, [r1]
	ldrb r0, [r3]
	muls r0, r4
	add r0, r8
	movs r5, 0
	movs r1, 0
	strh r1, [r0, 0x2E]
	ldr r2, _080210D4 @ =gUnknown_2023F20
	adds r2, 0x29
	adds r2, r6, r2
	ldr r3, _080210D8 @ =gBitTable
	ldr r1, _080210DC @ =gBattlerPartyIndexes
	mov r4, r9
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r4, _080210E0 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r0, _080210E4 @ =gUnknown_81D8F86
	str r0, [r4]
	mov r1, r9
	ldrb r0, [r1]
	ldr r2, _080210E8 @ =gBattleStruct
	ldr r1, [r2]
	lsls r0, 1
	adds r0, r1
	adds r0, 0xC8
	strb r5, [r0]
	mov r3, r9
	ldrb r0, [r3]
	ldr r1, [r2]
	lsls r0, 1
	adds r0, r1
	adds r0, 0xC9
	strb r5, [r0]
	b _0802110A
	.align 2, 0
_080210D0: .4byte gUnknown_2023D68
_080210D4: .4byte gUnknown_2023F20
_080210D8: .4byte gBitTable
_080210DC: .4byte gBattlerPartyIndexes
_080210E0: .4byte gUnknown_2023D74
_080210E4: .4byte gUnknown_81D8F86
_080210E8: .4byte gBattleStruct
_080210EC:
	ldr r1, _080210F8 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	b _0802110A
	.align 2, 0
_080210F8: .4byte gUnknown_2023D74
_080210FC:
	ldr r4, _0802111C @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r0, _08021120 @ =gUnknown_81D8FEB
_08021108:
	str r0, [r4]
_0802110A:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802111C: .4byte gUnknown_2023D74
_08021120: .4byte gUnknown_81D8FEB
	thumb_func_end sub_801FF20

	thumb_func_start atk15_seteffectwithchance
atk15_seteffectwithchance: @ 8021124
	push {r4,lr}
	ldr r2, _08021150 @ =gBattleMons
	ldr r0, _08021154 @ =sBattler_AI
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x20
	bne _08021160
	ldr r2, _08021158 @ =gBattleMoves
	ldr r0, _0802115C @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 1
	b _08021170
	.align 2, 0
_08021150: .4byte gBattleMons
_08021154: .4byte sBattler_AI
_08021158: .4byte gBattleMoves
_0802115C: .4byte gCurrentMove
_08021160:
	ldr r2, _08021190 @ =gBattleMoves
	ldr r0, _08021194 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r4, [r0, 0x5]
_08021170:
	ldr r3, _08021198 @ =gUnknown_2023E82
	ldrb r2, [r3, 0x3]
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _080211A0
	ldr r0, _0802119C @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _080211A0
	movs r0, 0x7F
	ands r0, r2
	strb r0, [r3, 0x3]
	b _080211CE
	.align 2, 0
_08021190: .4byte gBattleMoves
_08021194: .4byte gCurrentMove
_08021198: .4byte gUnknown_2023E82
_0802119C: .4byte gMoveResultFlags
_080211A0:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r4
	bhi _080211EA
	ldr r0, _080211D8 @ =gUnknown_2023E82
	ldrb r0, [r0, 0x3]
	cmp r0, 0
	beq _080211EA
	ldr r0, _080211DC @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _080211EA
	cmp r4, 0x63
	bls _080211E0
_080211CE:
	movs r0, 0
	movs r1, 0x80
	bl sub_801FF20
	b _080211F2
	.align 2, 0
_080211D8: .4byte gUnknown_2023E82
_080211DC: .4byte gMoveResultFlags
_080211E0:
	movs r0, 0
	movs r1, 0
	bl sub_801FF20
	b _080211F2
_080211EA:
	ldr r1, _08021204 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_080211F2:
	ldr r0, _08021208 @ =gUnknown_2023E82
	movs r1, 0
	strb r1, [r0, 0x3]
	ldr r0, _0802120C @ =gBattleScripting
	strb r1, [r0, 0x16]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08021204: .4byte gUnknown_2023D74
_08021208: .4byte gUnknown_2023E82
_0802120C: .4byte gBattleScripting
	thumb_func_end atk15_seteffectwithchance

	thumb_func_start atk16_seteffectprimary
atk16_seteffectprimary: @ 8021210
	push {lr}
	movs r0, 0x1
	movs r1, 0
	bl sub_801FF20
	pop {r0}
	bx r0
	thumb_func_end atk16_seteffectprimary

	thumb_func_start atk17_seteffectsecondary
atk17_seteffectsecondary: @ 8021220
	push {lr}
	movs r0, 0
	movs r1, 0
	bl sub_801FF20
	pop {r0}
	bx r0
	thumb_func_end atk17_seteffectsecondary

	thumb_func_start atk18_clearstatusfromeffect
atk18_clearstatusfromeffect: @ 8021230
	push {lr}
	ldr r0, _08021254 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r2, _08021258 @ =gActiveBattler
	strb r0, [r2]
	ldr r3, _0802125C @ =gUnknown_2023E82
	ldrb r0, [r3, 0x3]
	cmp r0, 0x6
	bhi _08021264
	ldr r1, _08021260 @ =gBattleMons
	ldrb r2, [r2]
	movs r0, 0x58
	muls r2, r0
	adds r1, 0x4C
	b _0802126E
	.align 2, 0
_08021254: .4byte gUnknown_2023D74
_08021258: .4byte gActiveBattler
_0802125C: .4byte gUnknown_2023E82
_08021260: .4byte gBattleMons
_08021264:
	ldr r1, _08021298 @ =gBattleMons
	ldrb r2, [r2]
	movs r0, 0x58
	muls r2, r0
	adds r1, 0x50
_0802126E:
	adds r2, r1
	ldr r1, _0802129C @ =gUnknown_825053C
	ldrb r0, [r3, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	ldr r0, _080212A0 @ =gUnknown_2023E82
	movs r2, 0
	strb r2, [r0, 0x3]
	ldr r1, _080212A4 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	ldr r0, _080212A8 @ =gBattleScripting
	strb r2, [r0, 0x16]
	pop {r0}
	bx r0
	.align 2, 0
_08021298: .4byte gBattleMons
_0802129C: .4byte gUnknown_825053C
_080212A0: .4byte gUnknown_2023E82
_080212A4: .4byte gUnknown_2023D74
_080212A8: .4byte gBattleScripting
	thumb_func_end atk18_clearstatusfromeffect

	thumb_func_start atk19_tryfaintmon
atk19_tryfaintmon: @ 80212AC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	ldr r0, _08021318 @ =gUnknown_2023D74
	ldr r2, [r0]
	ldrb r1, [r2, 0x2]
	adds r6, r0, 0
	cmp r1, 0
	beq _08021330
	ldrb r0, [r2, 0x1]
	bl sub_8016E24
	ldr r5, _0802131C @ =gActiveBattler
	strb r0, [r5]
	ldr r2, _08021320 @ =gUnknown_2023DD0
	ldr r1, _08021324 @ =gBitTable
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	ands r0, r1
	cmp r0, 0
	bne _080212E4
	b _0802158C
_080212E4:
	ldr r1, [r6]
	ldrb r4, [r1, 0x3]
	ldrb r0, [r1, 0x4]
	lsls r0, 8
	orrs r4, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 16
	orrs r4, r0
	ldrb r0, [r1, 0x6]
	lsls r0, 24
	orrs r4, r0
	bl BattleScriptPop
	str r4, [r6]
	ldrb r0, [r5]
	bl GetBankSide
	ldr r1, _08021328 @ =gSideAffecting
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r2, [r0]
	ldr r1, _0802132C @ =0x0000fdff
	ands r1, r2
	strh r1, [r0]
	b _08021592
	.align 2, 0
_08021318: .4byte gUnknown_2023D74
_0802131C: .4byte gActiveBattler
_08021320: .4byte gUnknown_2023DD0
_08021324: .4byte gBitTable
_08021328: .4byte gSideAffecting
_0802132C: .4byte 0x0000fdff
_08021330:
	ldrb r0, [r2, 0x1]
	cmp r0, 0x1
	bne _08021358
	ldr r1, _08021348 @ =gActiveBattler
	ldr r0, _0802134C @ =sBattler_AI
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08021350 @ =gBattlerTarget
	ldrb r0, [r0]
	mov r9, r0
	ldr r4, _08021354 @ =gUnknown_81D8674
	b _08021368
	.align 2, 0
_08021348: .4byte gActiveBattler
_0802134C: .4byte sBattler_AI
_08021350: .4byte gBattlerTarget
_08021354: .4byte gUnknown_81D8674
_08021358:
	ldr r1, _080213D0 @ =gActiveBattler
	ldr r0, _080213D4 @ =gBattlerTarget
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080213D8 @ =sBattler_AI
	ldrb r0, [r0]
	mov r9, r0
	ldr r4, _080213DC @ =gUnknown_81D8684
_08021368:
	mov r8, r1
	ldr r0, _080213E0 @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldr r2, _080213E4 @ =gBitTable
	mov r7, r8
	ldrb r3, [r7]
	lsls r0, r3, 2
	adds r0, r2
	ldr r2, [r0]
	ands r1, r2
	cmp r1, 0
	beq _08021382
	b _0802158C
_08021382:
	ldr r1, _080213E8 @ =gBattleMons
	movs r0, 0x58
	muls r0, r3
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08021392
	b _0802158C
_08021392:
	ldr r5, _080213EC @ =gUnknown_2023DD0
	lsls r1, r2, 28
	ldr r0, [r5]
	orrs r0, r1
	str r0, [r5]
	ldr r0, [r6]
	adds r0, 0x7
	bl BattleScriptPush
	str r4, [r6]
	ldrb r0, [r7]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080213F4
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 15
	orrs r0, r1
	str r0, [r5]
	ldr r1, _080213F0 @ =gBattleResults
	ldrb r0, [r1]
	cmp r0, 0xFE
	bhi _080213C8
	adds r0, 0x1
	strb r0, [r1]
_080213C8:
	ldrb r0, [r7]
	bl sub_802E228
	b _0802142C
	.align 2, 0
_080213D0: .4byte gActiveBattler
_080213D4: .4byte gBattlerTarget
_080213D8: .4byte sBattler_AI
_080213DC: .4byte gUnknown_81D8684
_080213E0: .4byte gAbsentBattlerFlags
_080213E4: .4byte gBitTable
_080213E8: .4byte gBattleMons
_080213EC: .4byte gUnknown_2023DD0
_080213F0: .4byte gBattleResults
_080213F4:
	ldr r4, _0802154C @ =gBattleResults
	ldrb r0, [r4, 0x1]
	cmp r0, 0xFE
	bhi _08021400
	adds r0, 0x1
	strb r0, [r4, 0x1]
_08021400:
	ldr r1, _08021550 @ =gBattlerPartyIndexes
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08021554 @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	strh r0, [r4, 0x20]
	ldr r0, _08021558 @ =gBattleStruct
	ldr r0, [r0]
	movs r3, 0xC1
	lsls r3, 1
	adds r1, r0, r3
	ldr r0, _0802155C @ =sBattler_AI
	ldrb r0, [r0]
	strb r0, [r1]
_0802142C:
	ldr r2, _08021560 @ =gUnknown_2023DD0
	ldr r1, [r2]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0802146A
	ldr r6, _08021564 @ =gBattleMons
	ldr r0, _0802155C @ =sBattler_AI
	ldrb r0, [r0]
	movs r5, 0x58
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0802146A
	movs r0, 0x41
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	ldr r4, _08021568 @ =gUnknown_2023D74
	ldr r0, [r4]
	bl BattleScriptPush
	ldr r1, _0802156C @ =gBattleMoveDamage
	mov r0, r9
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0, 0x28]
	str r0, [r1]
	ldr r0, _08021570 @ =gUnknown_81D8C6C
	str r0, [r4]
_0802146A:
	ldr r1, _08021574 @ =gStatuses3
	ldr r6, _08021578 @ =gBattlerTarget
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 7
	ands r0, r1
	cmp r0, 0
	bne _08021482
	b _08021592
_08021482:
	ldr r0, _08021560 @ =gUnknown_2023DD0
	ldr r5, [r0]
	movs r0, 0x80
	lsls r0, 17
	ands r5, r0
	cmp r5, 0
	beq _08021492
	b _08021592
_08021492:
	ldr r0, _0802155C @ =sBattler_AI
	mov r8, r0
	ldrb r0, [r0]
	bl GetBankSide
	adds r4, r0, 0
	ldrb r0, [r6]
	bl GetBankSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _08021592
	ldr r1, _08021564 @ =gBattleMons
	mov r9, r1
	mov r2, r8
	ldrb r1, [r2]
	movs r7, 0x58
	adds r2, r1, 0
	muls r2, r7
	mov r3, r9
	adds r0, r2, r3
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08021592
	ldr r0, _0802157C @ =gCurrentMove
	ldrh r0, [r0]
	cmp r0, 0xA5
	beq _08021592
	ldr r0, _08021558 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, r1, r0
	adds r0, 0x80
	ldrb r4, [r0]
	adds r0, r4, r2
	mov r6, r9
	adds r6, 0x24
	adds r0, r6
	strb r5, [r0]
	ldr r5, _08021568 @ =gUnknown_2023D74
	ldr r0, [r5]
	bl BattleScriptPush
	ldr r0, _08021580 @ =gUnknown_81D8FA3
	str r0, [r5]
	ldr r5, _08021584 @ =gActiveBattler
	mov r1, r8
	ldrb r0, [r1]
	strb r0, [r5]
	adds r1, r4, 0
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r5]
	muls r0, r7
	adds r0, r6
	adds r0, r4
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl EmitSetMonData
	ldrb r0, [r5]
	bl MarkBufferBankForExecution
	ldr r1, _08021588 @ =gUnknown_2022AB8
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	lsls r4, 1
	mov r2, r8
	ldrb r0, [r2]
	muls r0, r7
	adds r0, r4, r0
	mov r2, r9
	adds r2, 0xC
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1, 0x2]
	mov r3, r8
	ldrb r0, [r3]
	muls r0, r7
	adds r4, r0
	adds r4, r2
	ldrh r0, [r4]
	lsrs r0, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	b _08021592
	.align 2, 0
_0802154C: .4byte gBattleResults
_08021550: .4byte gBattlerPartyIndexes
_08021554: .4byte gEnemyParty
_08021558: .4byte gBattleStruct
_0802155C: .4byte sBattler_AI
_08021560: .4byte gUnknown_2023DD0
_08021564: .4byte gBattleMons
_08021568: .4byte gUnknown_2023D74
_0802156C: .4byte gBattleMoveDamage
_08021570: .4byte gUnknown_81D8C6C
_08021574: .4byte gStatuses3
_08021578: .4byte gBattlerTarget
_0802157C: .4byte gCurrentMove
_08021580: .4byte gUnknown_81D8FA3
_08021584: .4byte gActiveBattler
_08021588: .4byte gUnknown_2022AB8
_0802158C:
	ldr r0, [r6]
	adds r0, 0x7
	str r0, [r6]
_08021592:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end atk19_tryfaintmon

	thumb_func_start atk1A_faint_animation
atk1A_faint_animation: @ 80215A0
	push {r4,r5,lr}
	ldr r0, _080215D0 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	bne _080215CA
	ldr r5, _080215D4 @ =gUnknown_2023D74
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r4, _080215D8 @ =gActiveBattler
	strb r0, [r4]
	movs r0, 0
	bl EmitFaintAnimation
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
_080215CA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080215D0: .4byte gUnknown_2023BC8
_080215D4: .4byte gUnknown_2023D74
_080215D8: .4byte gActiveBattler
	thumb_func_end atk1A_faint_animation

	thumb_func_start atk1B_faint_effects_clear
atk1B_faint_effects_clear: @ 80215DC
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, _08021630 @ =gUnknown_2023BC8
	ldr r6, [r0]
	cmp r6, 0
	bne _08021628
	ldr r5, _08021634 @ =gUnknown_2023D74
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r4, _08021638 @ =gActiveBattler
	strb r0, [r4]
	ldr r1, _0802163C @ =gBattleMons
	ldrb r0, [r4]
	movs r2, 0x58
	muls r0, r2
	adds r1, 0x4C
	adds r0, r1
	str r6, [r0]
	ldrb r0, [r4]
	muls r0, r2
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl EmitSetMonData
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	bl sub_8012BC8
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
_08021628:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021630: .4byte gUnknown_2023BC8
_08021634: .4byte gUnknown_2023D74
_08021638: .4byte gActiveBattler
_0802163C: .4byte gBattleMons
	thumb_func_end atk1B_faint_effects_clear

	thumb_func_start atk1C_jumpifstatus
atk1C_jumpifstatus: @ 8021640
	push {r4,r5,lr}
	ldr r5, _0802169C @ =gUnknown_2023D74
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [r5]
	ldrb r4, [r2, 0x2]
	ldrb r1, [r2, 0x3]
	lsls r1, 8
	adds r4, r1
	ldrb r1, [r2, 0x4]
	lsls r1, 16
	adds r4, r1
	ldrb r1, [r2, 0x5]
	lsls r1, 24
	adds r4, r1
	ldrb r3, [r2, 0x6]
	ldrb r1, [r2, 0x7]
	lsls r1, 8
	adds r3, r1
	ldrb r1, [r2, 0x8]
	lsls r1, 16
	adds r3, r1
	ldrb r1, [r2, 0x9]
	lsls r1, 24
	adds r3, r1
	ldr r2, _080216A0 @ =gBattleMons
	movs r1, 0x58
	muls r1, r0
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r1, r0
	ldr r0, [r0]
	ands r0, r4
	cmp r0, 0
	beq _080216A4
	adds r0, r1, r2
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _080216A4
	str r3, [r5]
	b _080216AC
	.align 2, 0
_0802169C: .4byte gUnknown_2023D74
_080216A0: .4byte gBattleMons
_080216A4:
	ldr r1, _080216B4 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0xA
	str r0, [r1]
_080216AC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080216B4: .4byte gUnknown_2023D74
	thumb_func_end atk1C_jumpifstatus

	thumb_func_start atk1D_jumpifstatus2
atk1D_jumpifstatus2: @ 80216B8
	push {r4,r5,lr}
	ldr r5, _08021714 @ =gUnknown_2023D74
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [r5]
	ldrb r4, [r2, 0x2]
	ldrb r1, [r2, 0x3]
	lsls r1, 8
	adds r4, r1
	ldrb r1, [r2, 0x4]
	lsls r1, 16
	adds r4, r1
	ldrb r1, [r2, 0x5]
	lsls r1, 24
	adds r4, r1
	ldrb r3, [r2, 0x6]
	ldrb r1, [r2, 0x7]
	lsls r1, 8
	adds r3, r1
	ldrb r1, [r2, 0x8]
	lsls r1, 16
	adds r3, r1
	ldrb r1, [r2, 0x9]
	lsls r1, 24
	adds r3, r1
	ldr r2, _08021718 @ =gBattleMons
	movs r1, 0x58
	muls r1, r0
	adds r0, r2, 0
	adds r0, 0x50
	adds r0, r1, r0
	ldr r0, [r0]
	ands r0, r4
	cmp r0, 0
	beq _0802171C
	adds r0, r1, r2
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0802171C
	str r3, [r5]
	b _08021724
	.align 2, 0
_08021714: .4byte gUnknown_2023D74
_08021718: .4byte gBattleMons
_0802171C:
	ldr r1, _0802172C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0xA
	str r0, [r1]
_08021724:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802172C: .4byte gUnknown_2023D74
	thumb_func_end atk1D_jumpifstatus2

	thumb_func_start atk1E_jumpifability
atk1E_jumpifability: @ 8021730
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r6, _08021784 @ =gUnknown_2023D74
	ldr r2, [r6]
	ldrb r5, [r2, 0x2]
	mov r8, r5
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	adds r7, r1, r0
	ldrb r0, [r2, 0x1]
	cmp r0, 0x8
	bne _08021790
	ldr r0, _08021788 @ =sBattler_AI
	ldrb r1, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0xD
	adds r2, r5, 0
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _08021804
	ldr r1, _0802178C @ =gUnknown_2023D6A
	strb r5, [r1]
	str r7, [r6]
	subs r4, 0x1
	lsls r0, r4, 24
	lsrs r0, 24
	ldrb r1, [r1]
	b _080217EC
	.align 2, 0
_08021784: .4byte gUnknown_2023D74
_08021788: .4byte sBattler_AI
_0802178C: .4byte gUnknown_2023D6A
_08021790:
	cmp r0, 0x9
	bne _080217C8
	ldr r0, _080217C0 @ =sBattler_AI
	ldrb r1, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0xC
	adds r2, r5, 0
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _08021804
	ldr r1, _080217C4 @ =gUnknown_2023D6A
	strb r5, [r1]
	str r7, [r6]
	subs r4, 0x1
	lsls r0, r4, 24
	lsrs r0, 24
	ldrb r1, [r1]
	b _080217EC
	.align 2, 0
_080217C0: .4byte sBattler_AI
_080217C4: .4byte gUnknown_2023D6A
_080217C8:
	ldrb r0, [r2, 0x1]
	bl sub_8016E24
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080217F8 @ =gBattleMons
	movs r0, 0x58
	muls r0, r4
	adds r0, r1
	adds r0, 0x20
	ldrb r1, [r0]
	cmp r1, r8
	bne _08021804
	ldr r0, _080217FC @ =gUnknown_2023D6A
	strb r1, [r0]
	str r7, [r6]
	ldrb r1, [r0]
	adds r0, r4, 0
_080217EC:
	bl sub_80C71D0
	ldr r0, _08021800 @ =gBattleScripting
	strb r4, [r0, 0x15]
	b _0802180A
	.align 2, 0
_080217F8: .4byte gBattleMons
_080217FC: .4byte gUnknown_2023D6A
_08021800: .4byte gBattleScripting
_08021804:
	ldr r0, [r6]
	adds r0, 0x7
	str r0, [r6]
_0802180A:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end atk1E_jumpifability

	thumb_func_start atk1F_jumpifsideaffecting
atk1F_jumpifsideaffecting: @ 8021818
	push {r4-r6,lr}
	ldr r0, _08021830 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r4, [r0, 0x1]
	cmp r4, 0x1
	bne _08021838
	ldr r0, _08021834 @ =sBattler_AI
	ldrb r0, [r0]
	bl GetBankIdentity
	b _08021842
	.align 2, 0
_08021830: .4byte gUnknown_2023D74
_08021834: .4byte sBattler_AI
_08021838:
	ldr r0, _08021878 @ =gBattlerTarget
	ldrb r0, [r0]
	bl GetBankIdentity
	movs r4, 0x1
_08021842:
	ands r4, r0
	ldr r6, _0802187C @ =gUnknown_2023D74
	ldr r3, [r6]
	ldrb r2, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r2, r0
	ldrb r1, [r3, 0x4]
	ldrb r0, [r3, 0x5]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0x7]
	lsls r0, 24
	adds r5, r1, r0
	ldr r1, _08021880 @ =gSideAffecting
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	ands r2, r0
	cmp r2, 0
	beq _08021884
	str r5, [r6]
	b _0802188A
	.align 2, 0
_08021878: .4byte gBattlerTarget
_0802187C: .4byte gUnknown_2023D74
_08021880: .4byte gSideAffecting
_08021884:
	adds r0, r3, 0
	adds r0, 0x8
	str r0, [r6]
_0802188A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end atk1F_jumpifsideaffecting

	thumb_func_start atk20_jumpifstat
atk20_jumpifstat: @ 8021890
	push {r4,r5,lr}
	movs r5, 0
	ldr r4, _080218C4 @ =gUnknown_2023D74
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080218C8 @ =gBattleMons
	ldr r3, [r4]
	movs r1, 0x58
	muls r0, r1
	ldrb r1, [r3, 0x3]
	adds r0, r1
	adds r2, 0x18
	adds r0, r2
	ldrb r2, [r0]
	ldrb r0, [r3, 0x2]
	cmp r0, 0x5
	bhi _0802194E
	lsls r0, 2
	ldr r1, _080218CC @ =_080218D0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080218C4: .4byte gUnknown_2023D74
_080218C8: .4byte gBattleMons
_080218CC: .4byte _080218D0
	.align 2, 0
_080218D0:
	.4byte _080218E8
	.4byte _080218F8
	.4byte _08021908
	.4byte _08021918
	.4byte _08021928
	.4byte _0802193C
_080218E8:
	ldr r0, _080218F4 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	cmp r2, r0
	bne _0802194E
	b _08021948
	.align 2, 0
_080218F4: .4byte gUnknown_2023D74
_080218F8:
	ldr r0, _08021904 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	cmp r2, r0
	beq _0802194E
	b _08021948
	.align 2, 0
_08021904: .4byte gUnknown_2023D74
_08021908:
	ldr r0, _08021914 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	cmp r2, r0
	bls _0802194E
	b _08021948
	.align 2, 0
_08021914: .4byte gUnknown_2023D74
_08021918:
	ldr r0, _08021924 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	cmp r2, r0
	bcs _0802194E
	b _08021948
	.align 2, 0
_08021924: .4byte gUnknown_2023D74
_08021928:
	ldr r0, _08021938 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	ands r2, r0
	cmp r2, 0
	beq _0802194E
	b _08021948
	.align 2, 0
_08021938: .4byte gUnknown_2023D74
_0802193C:
	ldr r0, _08021970 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	ands r2, r0
	cmp r2, 0
	bne _0802194E
_08021948:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0802194E:
	cmp r5, 0
	beq _08021974
	ldr r3, _08021970 @ =gUnknown_2023D74
	ldr r2, [r3]
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	adds r1, r0
	str r1, [r3]
	b _0802197C
	.align 2, 0
_08021970: .4byte gUnknown_2023D74
_08021974:
	ldr r1, _08021984 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x9
	str r0, [r1]
_0802197C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08021984: .4byte gUnknown_2023D74
	thumb_func_end atk20_jumpifstat

	thumb_func_start atk21_jumpifstatus3condition
atk21_jumpifstatus3condition: @ 8021988
	push {r4-r6,lr}
	ldr r4, _080219DC @ =gUnknown_2023D74
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r5, _080219E0 @ =gActiveBattler
	strb r0, [r5]
	ldr r2, [r4]
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	adds r6, r1, r0
	ldrb r1, [r2, 0x7]
	ldrb r0, [r2, 0x8]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x9]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0xA]
	lsls r0, 24
	adds r3, r1, r0
	ldrb r0, [r2, 0x6]
	cmp r0, 0
	beq _080219E8
	ldr r0, _080219E4 @ =gStatuses3
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	ands r0, r6
	cmp r0, 0
	bne _08021A00
	b _080219F8
	.align 2, 0
_080219DC: .4byte gUnknown_2023D74
_080219E0: .4byte gActiveBattler
_080219E4: .4byte gStatuses3
_080219E8:
	ldr r0, _080219FC @ =gStatuses3
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	ands r0, r6
	cmp r0, 0
	beq _08021A00
_080219F8:
	str r3, [r4]
	b _08021A06
	.align 2, 0
_080219FC: .4byte gStatuses3
_08021A00:
	adds r0, r2, 0
	adds r0, 0xB
	str r0, [r4]
_08021A06:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end atk21_jumpifstatus3condition

	thumb_func_start atk22_jumpiftype
atk22_jumpiftype: @ 8021A0C
	push {r4-r6,lr}
	ldr r4, _08021A54 @ =gUnknown_2023D74
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	lsls r0, 24
	lsrs r0, 24
	ldr r3, [r4]
	ldrb r5, [r3, 0x2]
	ldrb r2, [r3, 0x3]
	ldrb r1, [r3, 0x4]
	lsls r1, 8
	adds r2, r1
	ldrb r1, [r3, 0x5]
	lsls r1, 16
	adds r2, r1
	ldrb r1, [r3, 0x6]
	lsls r1, 24
	adds r6, r2, r1
	ldr r2, _08021A58 @ =gBattleMons
	movs r1, 0x58
	muls r0, r1
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, r5
	beq _08021A50
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, r5
	bne _08021A5C
_08021A50:
	str r6, [r4]
	b _08021A60
	.align 2, 0
_08021A54: .4byte gUnknown_2023D74
_08021A58: .4byte gBattleMons
_08021A5C:
	adds r0, r3, 0x7
	str r0, [r4]
_08021A60:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end atk22_jumpiftype

	thumb_func_start sub_8021A68
sub_8021A68: @ 8021A68
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r6, 0
	ldr r0, _08021AB0 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x50
	mov r9, r0
	ldr r0, _08021AB4 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r1, _08021AB8 @ =gUnknown_2023D6D
	strb r0, [r1]
	ldr r2, _08021ABC @ =gUnknown_2023F4E
	movs r1, 0x2
	ands r1, r0
	lsls r1, 24
	lsrs r1, 25
	adds r1, r2
	ldrb r1, [r1]
	mov r8, r1
	ldr r0, _08021AC0 @ =gBattleScripting
	ldrb r0, [r0, 0x1C]
	cmp r0, 0x6
	bls _08021AA4
	bl _080223DA
_08021AA4:
	lsls r0, 2
	ldr r1, _08021AC4 @ =_08021AC8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08021AB0: .4byte gBattleStruct
_08021AB4: .4byte gUnknown_2023D74
_08021AB8: .4byte gUnknown_2023D6D
_08021ABC: .4byte gUnknown_2023F4E
_08021AC0: .4byte gBattleScripting
_08021AC4: .4byte _08021AC8
	.align 2, 0
_08021AC8:
	.4byte _08021AE4
	.4byte _08021B50
	.4byte _08021C6A
	.4byte _08021F78
	.4byte _0802207C
	.4byte _08022368
	.4byte _080223B0
_08021AE4:
	ldr r4, _08021B34 @ =gUnknown_2023D6D
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08021AF8
	bl _080223A4
_08021AF8:
	ldr r0, _08021B38 @ =gBattleTypeFlags
	ldr r0, [r0]
	ldr r1, _08021B3C @ =0x00080982
	ands r0, r1
	cmp r0, 0
	beq _08021B08
	bl _080223A4
_08021B08:
	ldr r1, _08021B40 @ =gBattleScripting
	ldrb r0, [r1, 0x1C]
	adds r0, 0x1
	strb r0, [r1, 0x1C]
	ldr r0, _08021B44 @ =gBattleStruct
	ldr r2, [r0]
	adds r2, 0xDF
	ldr r3, _08021B48 @ =gBitTable
	ldr r1, _08021B4C @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	bl _080223DA
	.align 2, 0
_08021B34: .4byte gUnknown_2023D6D
_08021B38: .4byte gBattleTypeFlags
_08021B3C: .4byte 0x00080982
_08021B40: .4byte gBattleScripting
_08021B44: .4byte gBattleStruct
_08021B48: .4byte gBitTable
_08021B4C: .4byte gBattlerPartyIndexes
_08021B50:
	movs r5, 0
	movs r7, 0
_08021B54:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _08021BA4 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08021BC2
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08021BC2
	ldr r0, _08021BA8 @ =gBitTable
	lsls r1, r7, 2
	adds r1, r0
	ldr r0, [r1]
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08021B88
	adds r5, 0x1
_08021B88:
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _08021BB4
	ldr r0, _08021BAC @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r2, _08021BB0 @ =0x0000311a
	adds r0, r2
	ldrb r4, [r0]
	b _08021BBC
	.align 2, 0
_08021BA4: .4byte gPlayerParty
_08021BA8: .4byte gBitTable
_08021BAC: .4byte gSaveBlock1Ptr
_08021BB0: .4byte 0x0000311a
_08021BB4:
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r4, r0, 24
_08021BBC:
	cmp r4, 0x19
	bne _08021BC2
	adds r6, 0x1
_08021BC2:
	adds r7, 0x1
	cmp r7, 0x5
	ble _08021B54
	ldr r3, _08021C28 @ =gBaseStats
	ldr r2, _08021C2C @ =gBattleMons
	ldr r0, _08021C30 @ =gUnknown_2023D6D
	ldrb r1, [r0]
	movs r0, 0x58
	muls r1, r0
	adds r1, r2
	ldrh r2, [r1]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0, 0x9]
	adds r1, 0x2A
	ldrb r0, [r1]
	muls r0, r2
	movs r1, 0x7
	bl __divsi3
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r6, 0
	beq _08021C38
	lsrs r4, r0, 17
	adds r0, r4, 0
	adds r1, r5, 0
	bl __divsi3
	mov r1, r9
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _08021C0E
	movs r0, 0x1
	strh r0, [r1]
_08021C0E:
	ldr r5, _08021C34 @ =gUnknown_2023F52
	adds r0, r4, 0
	adds r1, r6, 0
	bl __divsi3
	strh r0, [r5]
	lsls r0, 16
	cmp r0, 0
	bne _08021C52
	movs r0, 0x1
	strh r0, [r5]
	b _08021C52
	.align 2, 0
_08021C28: .4byte gBaseStats
_08021C2C: .4byte gBattleMons
_08021C30: .4byte gUnknown_2023D6D
_08021C34: .4byte gUnknown_2023F52
_08021C38:
	adds r0, r1, 0
	adds r1, r5, 0
	bl __divsi3
	mov r2, r9
	strh r0, [r2]
	lsls r0, 16
	cmp r0, 0
	bne _08021C4E
	movs r0, 0x1
	strh r0, [r2]
_08021C4E:
	ldr r0, _08021C9C @ =gUnknown_2023F52
	strh r6, [r0]
_08021C52:
	ldr r1, _08021CA0 @ =gBattleScripting
	ldrb r0, [r1, 0x1C]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1, 0x1C]
	ldr r1, _08021CA4 @ =gBattleStruct
	ldr r0, [r1]
	strb r2, [r0, 0x10]
	ldr r0, [r1]
	adds r0, 0x53
	mov r4, r8
	strb r4, [r0]
_08021C6A:
	ldr r0, _08021CA8 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	beq _08021C74
	b _080223DA
_08021C74:
	ldr r0, _08021CA4 @ =gBattleStruct
	ldr r0, [r0]
	ldrb r1, [r0, 0x10]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08021CAC @ =gPlayerParty
	adds r0, r1
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _08021CB8
	ldr r0, _08021CB0 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _08021CB4 @ =0x0000311a
	adds r0, r1
	ldrb r4, [r0]
	b _08021CC0
	.align 2, 0
_08021C9C: .4byte gUnknown_2023F52
_08021CA0: .4byte gBattleScripting
_08021CA4: .4byte gBattleStruct
_08021CA8: .4byte gUnknown_2023BC8
_08021CAC: .4byte gPlayerParty
_08021CB0: .4byte gSaveBlock1Ptr
_08021CB4: .4byte 0x0000311a
_08021CB8:
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r4, r0, 24
_08021CC0:
	ldr r5, _08021CE0 @ =gBattleStruct
	cmp r4, 0x19
	beq _08021CE8
	ldr r0, [r5]
	adds r1, r0, 0
	adds r1, 0x53
	ldrb r0, [r1]
	movs r2, 0x1
	ands r2, r0
	cmp r2, 0
	bne _08021CE8
	lsrs r0, 1
	strb r0, [r1]
	ldr r1, _08021CE4 @ =gBattleScripting
	b _08021D0C
	.align 2, 0
_08021CE0: .4byte gBattleStruct
_08021CE4: .4byte gBattleScripting
_08021CE8:
	ldr r0, [r5]
	ldrb r1, [r0, 0x10]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08021D18 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x64
	bne _08021D24
	ldr r1, [r5]
	adds r1, 0x53
	ldrb r0, [r1]
	lsrs r0, 1
	strb r0, [r1]
	ldr r1, _08021D1C @ =gBattleScripting
	movs r2, 0
_08021D0C:
	movs r0, 0x5
	strb r0, [r1, 0x1C]
	ldr r0, _08021D20 @ =gBattleMoveDamage
	str r2, [r0]
	b _080223DA
	.align 2, 0
_08021D18: .4byte gPlayerParty
_08021D1C: .4byte gBattleScripting
_08021D20: .4byte gBattleMoveDamage
_08021D24:
	ldr r0, _08021D88 @ =gBattleTypeFlags
	ldr r0, [r0]
	ldr r1, _08021D8C @ =0x00010008
	ands r0, r1
	cmp r0, 0
	bne _08021D52
	ldr r0, _08021D90 @ =gBattleMons
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08021D52
	ldr r0, [r5]
	ldrb r0, [r0, 0x12]
	cmp r0, 0
	bne _08021D52
	bl BattleStopLowHpSound
	ldr r0, _08021D94 @ =0x00000137
	bl PlayBGM
	ldr r1, [r5]
	ldrb r0, [r1, 0x12]
	adds r0, 0x1
	strb r0, [r1, 0x12]
_08021D52:
	ldr r5, _08021D98 @ =gBattleStruct
	ldr r0, [r5]
	ldrb r1, [r0, 0x10]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08021D9C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _08021D6C
	b _08021F4C
_08021D6C:
	ldr r0, [r5]
	adds r0, 0x53
	ldrb r0, [r0]
	movs r3, 0x1
	ands r3, r0
	cmp r3, 0
	beq _08021DA4
	ldr r1, _08021DA0 @ =gBattleMoveDamage
	mov r2, r9
	ldrh r0, [r2]
	str r0, [r1]
	mov r9, r1
	b _08021DAA
	.align 2, 0
_08021D88: .4byte gBattleTypeFlags
_08021D8C: .4byte 0x00010008
_08021D90: .4byte gBattleMons
_08021D94: .4byte 0x00000137
_08021D98: .4byte gBattleStruct
_08021D9C: .4byte gPlayerParty
_08021DA0: .4byte gBattleMoveDamage
_08021DA4:
	ldr r0, _08021E28 @ =gBattleMoveDamage
	str r3, [r0]
	mov r9, r0
_08021DAA:
	cmp r4, 0x19
	bne _08021DBA
	ldr r0, _08021E2C @ =gUnknown_2023F52
	ldrh r1, [r0]
	mov r2, r9
	ldr r0, [r2]
	adds r0, r1
	str r0, [r2]
_08021DBA:
	cmp r4, 0x28
	bne _08021DCE
	mov r4, r9
	ldr r1, [r4]
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	str r0, [r4]
_08021DCE:
	ldr r5, _08021E30 @ =gBattleTypeFlags
	ldr r0, [r5]
	movs r1, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08021DEA
	ldr r4, _08021E28 @ =gBattleMoveDamage
	ldr r1, [r4]
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	str r0, [r4]
_08021DEA:
	ldr r0, _08021E34 @ =gBattleStruct
	ldr r0, [r0]
	ldrb r1, [r0, 0x10]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08021E38 @ =gPlayerParty
	adds r0, r1
	bl IsTradedMon
	lsls r0, 24
	cmp r0, 0
	beq _08021E3C
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 9
	ands r0, r1
	cmp r0, 0
	bne _08021E3C
	ldr r4, _08021E28 @ =gBattleMoveDamage
	ldr r1, [r4]
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	str r0, [r4]
	movs r7, 0xA5
	lsls r7, 1
	mov r9, r4
	b _08021E42
	.align 2, 0
_08021E28: .4byte gBattleMoveDamage
_08021E2C: .4byte gUnknown_2023F52
_08021E30: .4byte gBattleTypeFlags
_08021E34: .4byte gBattleStruct
_08021E38: .4byte gPlayerParty
_08021E3C:
	ldr r7, _08021E78 @ =0x00000149
	ldr r0, _08021E7C @ =gBattleMoveDamage
	mov r9, r0
_08021E42:
	ldr r0, _08021E80 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08021EAE
	ldr r0, _08021E84 @ =gBattlerPartyIndexes
	ldr r1, _08021E88 @ =gBattleStruct
	ldr r4, [r1]
	ldrh r0, [r0, 0x4]
	adds r5, r1, 0
	ldr r3, _08021E8C @ =gBitTable
	ldr r2, _08021E90 @ =gAbsentBattlerFlags
	ldrb r1, [r4, 0x10]
	cmp r0, r1
	bne _08021E94
	ldrb r1, [r2]
	ldr r0, [r3, 0x8]
	ands r1, r0
	cmp r1, 0
	bne _08021E94
	adds r1, r4, 0
	adds r1, 0x8F
	movs r0, 0x2
	strb r0, [r1]
	b _08021EB6
	.align 2, 0
_08021E78: .4byte 0x00000149
_08021E7C: .4byte gBattleMoveDamage
_08021E80: .4byte gBattleTypeFlags
_08021E84: .4byte gBattlerPartyIndexes
_08021E88: .4byte gBattleStruct
_08021E8C: .4byte gBitTable
_08021E90: .4byte gAbsentBattlerFlags
_08021E94:
	ldrb r2, [r2]
	ldr r0, [r3]
	ands r2, r0
	cmp r2, 0
	bne _08021EA6
	ldr r0, [r5]
	adds r0, 0x8F
	strb r2, [r0]
	b _08021EB6
_08021EA6:
	ldr r0, [r5]
	adds r0, 0x8F
	movs r1, 0x2
	b _08021EB4
_08021EAE:
	ldr r0, _08021F5C @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x8F
_08021EB4:
	strb r1, [r0]
_08021EB6:
	ldr r1, _08021F60 @ =gUnknown_2022AB8
	movs r2, 0
	mov r12, r2
	movs r3, 0xFD
	strb r3, [r1]
	movs r5, 0x4
	strb r5, [r1, 0x1]
	ldr r6, _08021F5C @ =gBattleStruct
	ldr r2, [r6]
	movs r4, 0x8F
	adds r4, r2
	mov r8, r4
	ldrb r0, [r4]
	strb r0, [r1, 0x2]
	ldrb r0, [r2, 0x10]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _08021F64 @ =gUnknown_2022AC8
	strb r3, [r1]
	mov r0, r12
	strb r0, [r1, 0x1]
	strb r7, [r1, 0x2]
	movs r4, 0xFF
	lsls r4, 8
	ands r7, r4
	asrs r0, r7, 8
	strb r0, [r1, 0x3]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r1, 0x4]
	ldr r1, _08021F68 @ =gUnknown_2022AD8
	strb r3, [r1]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	strb r5, [r1, 0x2]
	movs r0, 0x5
	strb r0, [r1, 0x3]
	mov r0, r9
	ldr r2, [r0]
	strb r2, [r1, 0x4]
	adds r0, r2, 0
	ands r0, r4
	asrs r0, 8
	strb r0, [r1, 0x5]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r2
	asrs r0, 16
	strb r0, [r1, 0x6]
	lsrs r2, 24
	strb r2, [r1, 0x7]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r1, 0x8]
	mov r2, r8
	ldrb r1, [r2]
	movs r0, 0xD
	bl PrepareStringBattle
	ldr r0, [r6]
	ldrb r1, [r0, 0x10]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08021F6C @ =gPlayerParty
	adds r0, r1
	ldr r3, _08021F70 @ =gBattleMons
	ldr r1, _08021F74 @ =gUnknown_2023D6D
	ldrb r2, [r1]
	movs r1, 0x58
	muls r1, r2
	adds r1, r3
	ldrh r1, [r1]
	bl MonGainEVs
_08021F4C:
	ldr r0, _08021F5C @ =gBattleStruct
	ldr r1, [r0]
	adds r1, 0x53
	ldrb r0, [r1]
	lsrs r0, 1
	strb r0, [r1]
	b _08022052
	.align 2, 0
_08021F5C: .4byte gBattleStruct
_08021F60: .4byte gUnknown_2022AB8
_08021F64: .4byte gUnknown_2022AC8
_08021F68: .4byte gUnknown_2022AD8
_08021F6C: .4byte gPlayerParty
_08021F70: .4byte gBattleMons
_08021F74: .4byte gUnknown_2023D6D
_08021F78:
	ldr r0, _0802205C @ =gUnknown_2023BC8
	ldr r2, [r0]
	cmp r2, 0
	beq _08021F82
	b _080223DA
_08021F82:
	ldr r1, _08022060 @ =gUnknown_20233C4
	ldr r7, _08022064 @ =gBattleStruct
	ldr r0, [r7]
	adds r0, 0x8F
	ldrb r0, [r0]
	lsls r0, 9
	adds r0, r1
	strb r2, [r0]
	ldr r0, [r7]
	ldrb r0, [r0, 0x10]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _08022068 @ =gPlayerParty
	adds r0, r5
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08022052
	ldr r0, [r7]
	ldrb r0, [r0, 0x10]
	muls r0, r6
	adds r0, r5
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x64
	beq _08022052
	ldr r0, [r7]
	ldrb r0, [r0, 0x10]
	muls r0, r6
	adds r0, r5
	movs r1, 0x3A
	bl GetMonData
	ldr r4, _0802206C @ =gBattleResources
	ldr r1, [r4]
	ldr r1, [r1, 0x10]
	strh r0, [r1]
	ldr r0, [r7]
	ldrb r0, [r0, 0x10]
	muls r0, r6
	adds r0, r5
	movs r1, 0x3B
	bl GetMonData
	ldr r1, [r4]
	ldr r1, [r1, 0x10]
	strh r0, [r1, 0x2]
	ldr r0, [r7]
	ldrb r0, [r0, 0x10]
	muls r0, r6
	adds r0, r5
	movs r1, 0x3C
	bl GetMonData
	ldr r1, [r4]
	ldr r1, [r1, 0x10]
	strh r0, [r1, 0x4]
	ldr r0, [r7]
	ldrb r0, [r0, 0x10]
	muls r0, r6
	adds r0, r5
	movs r1, 0x3D
	bl GetMonData
	ldr r1, [r4]
	ldr r1, [r1, 0x10]
	strh r0, [r1, 0x6]
	ldr r0, [r7]
	ldrb r0, [r0, 0x10]
	muls r0, r6
	adds r0, r5
	movs r1, 0x3E
	bl GetMonData
	ldr r1, [r4]
	ldr r1, [r1, 0x10]
	strh r0, [r1, 0x8]
	ldr r0, [r7]
	ldrb r0, [r0, 0x10]
	muls r0, r6
	adds r0, r5
	movs r1, 0x3F
	bl GetMonData
	ldr r1, [r4]
	ldr r1, [r1, 0x10]
	strh r0, [r1, 0xA]
	ldr r4, _08022070 @ =gActiveBattler
	ldr r1, [r7]
	adds r0, r1, 0
	adds r0, 0x8F
	ldrb r0, [r0]
	strb r0, [r4]
	ldrb r1, [r1, 0x10]
	ldr r0, _08022074 @ =gBattleMoveDamage
	ldrh r2, [r0]
	movs r0, 0
	bl EmitExpUpdate
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_08022052:
	ldr r1, _08022078 @ =gBattleScripting
	ldrb r0, [r1, 0x1C]
	adds r0, 0x1
	strb r0, [r1, 0x1C]
	b _080223DA
	.align 2, 0
_0802205C: .4byte gUnknown_2023BC8
_08022060: .4byte gUnknown_20233C4
_08022064: .4byte gBattleStruct
_08022068: .4byte gPlayerParty
_0802206C: .4byte gBattleResources
_08022070: .4byte gActiveBattler
_08022074: .4byte gBattleMoveDamage
_08022078: .4byte gBattleScripting
_0802207C:
	ldr r0, _08022314 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	beq _08022086
	b _080223DA
_08022086:
	ldr r1, _08022318 @ =gActiveBattler
	ldr r0, _0802231C @ =gBattleStruct
	ldr r4, [r0]
	adds r0, r4, 0
	adds r0, 0x8F
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r3, _08022320 @ =gUnknown_20233C4
	ldrb r2, [r1]
	lsls r1, r2, 9
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0x21
	beq _080220A4
	b _08022350
_080220A4:
	adds r0, r3, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0xB
	beq _080220B0
	b _08022350
_080220B0:
	ldr r0, _08022324 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080220DA
	ldr r0, _08022328 @ =gBattlerPartyIndexes
	lsls r1, r2, 1
	adds r1, r0
	ldrh r0, [r1]
	ldrb r4, [r4, 0x10]
	cmp r0, r4
	bne _080220DA
	adds r1, r0, 0
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802232C @ =gPlayerParty
	adds r0, r1
	adds r1, r2, 0
	bl HandleLowHpMusicChange
_080220DA:
	ldr r1, _08022330 @ =gUnknown_2022AB8
	movs r3, 0xFD
	strb r3, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x1]
	ldr r6, _08022318 @ =gActiveBattler
	ldrb r0, [r6]
	strb r0, [r1, 0x2]
	ldr r4, _0802231C @ =gBattleStruct
	mov r9, r4
	ldr r2, [r4]
	ldrb r0, [r2, 0x10]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r4, _08022334 @ =gUnknown_2022AC8
	strb r3, [r4]
	movs r0, 0x1
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
	movs r0, 0x3
	strb r0, [r4, 0x3]
	ldrb r0, [r2, 0x10]
	movs r1, 0x64
	mov r8, r1
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	ldr r7, _0802232C @ =gPlayerParty
	adds r0, r7
	movs r1, 0x38
	bl GetMonData
	strb r0, [r4, 0x4]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r4, 0x5]
	bl BattleScriptPushCursor
	ldr r2, _08022338 @ =gUnknown_3004FD4
	ldr r1, _0802233C @ =gBitTable
	mov r4, r9
	ldr r5, [r4]
	ldrb r0, [r5, 0x10]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08022340 @ =gUnknown_2023D74
	ldr r0, _08022344 @ =gUnknown_81D89F5
	str r0, [r1]
	ldr r4, _08022348 @ =gBattleMoveDamage
	ldr r2, _08022320 @ =gUnknown_20233C4
	ldrb r1, [r6]
	lsls r1, 9
	adds r0, r2, 0x2
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r2, 0x3
	adds r1, r2
	ldrb r0, [r1]
	lsls r0, 8
	orrs r3, r0
	str r3, [r4]
	ldrb r0, [r5, 0x10]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r7
	movs r1, 0
	bl sub_80436F8
	ldr r1, _08022328 @ =gBattlerPartyIndexes
	mov r2, r9
	ldr r0, [r2]
	ldrb r2, [r0, 0x10]
	ldrh r0, [r1]
	cmp r0, r2
	bne _08022246
	ldr r4, _0802234C @ =gBattleMons
	ldrh r0, [r4, 0x28]
	cmp r0, 0
	beq _08022246
	mov r0, r8
	muls r0, r2
	adds r0, r7
	movs r1, 0x38
	bl GetMonData
	adds r1, r4, 0
	adds r1, 0x2A
	strb r0, [r1]
	mov r1, r9
	ldr r0, [r1]
	ldrb r0, [r0, 0x10]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	adds r0, r7
	movs r1, 0x39
	bl GetMonData
	strh r0, [r4, 0x28]
	mov r1, r9
	ldr r0, [r1]
	ldrb r0, [r0, 0x10]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	adds r0, r7
	movs r1, 0x3A
	bl GetMonData
	strh r0, [r4, 0x2C]
	mov r1, r9
	ldr r0, [r1]
	ldrb r0, [r0, 0x10]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	adds r0, r7
	movs r1, 0x3B
	bl GetMonData
	strh r0, [r4, 0x2]
	mov r1, r9
	ldr r0, [r1]
	ldrb r0, [r0, 0x10]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	adds r0, r7
	movs r1, 0x3C
	bl GetMonData
	strh r0, [r4, 0x4]
	mov r1, r9
	ldr r0, [r1]
	ldrb r0, [r0, 0x10]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	adds r0, r7
	movs r1, 0x3D
	bl GetMonData
	strh r0, [r4, 0x6]
	mov r1, r9
	ldr r0, [r1]
	ldrb r0, [r0, 0x10]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	adds r0, r7
	movs r1, 0x3D
	bl GetMonData
	strh r0, [r4, 0x6]
	mov r1, r9
	ldr r0, [r1]
	ldrb r0, [r0, 0x10]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	adds r0, r7
	movs r1, 0x3E
	bl GetMonData
	strh r0, [r4, 0x8]
	mov r1, r9
	ldr r0, [r1]
	ldrb r0, [r0, 0x10]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	adds r0, r7
	movs r1, 0x3F
	bl GetMonData
	strh r0, [r4, 0xA]
_08022246:
	ldr r0, _08022328 @ =gBattlerPartyIndexes
	ldr r7, _0802231C @ =gBattleStruct
	ldr r1, [r7]
	ldrb r2, [r1, 0x10]
	ldrh r0, [r0, 0x4]
	cmp r0, r2
	beq _08022256
	b _08022356
_08022256:
	ldr r6, _0802234C @ =gBattleMons
	movs r4, 0xD8
	adds r4, r6
	mov r8, r4
	ldrh r0, [r4]
	cmp r0, 0
	beq _08022356
	ldr r0, _08022324 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08022356
	movs r5, 0x64
	adds r0, r2, 0
	muls r0, r5
	ldr r4, _0802232C @ =gPlayerParty
	adds r0, r4
	movs r1, 0x38
	bl GetMonData
	adds r1, r6, 0
	adds r1, 0xDA
	strb r0, [r1]
	ldr r0, [r7]
	ldrb r0, [r0, 0x10]
	muls r0, r5
	adds r0, r4
	movs r1, 0x39
	bl GetMonData
	mov r1, r8
	strh r0, [r1]
	ldr r0, [r7]
	ldrb r0, [r0, 0x10]
	muls r0, r5
	adds r0, r4
	movs r1, 0x3A
	bl GetMonData
	adds r1, r6, 0
	adds r1, 0xDC
	strh r0, [r1]
	ldr r0, [r7]
	ldrb r0, [r0, 0x10]
	muls r0, r5
	adds r0, r4
	movs r1, 0x3B
	bl GetMonData
	adds r1, r6, 0
	adds r1, 0xB2
	strh r0, [r1]
	ldr r0, [r7]
	ldrb r0, [r0, 0x10]
	muls r0, r5
	adds r0, r4
	movs r1, 0x3C
	bl GetMonData
	adds r1, r6, 0
	adds r1, 0xB4
	strh r0, [r1]
	ldr r0, [r7]
	ldrb r0, [r0, 0x10]
	muls r0, r5
	adds r0, r4
	movs r1, 0x3D
	bl GetMonData
	movs r2, 0xB6
	adds r2, r6
	mov r8, r2
	strh r0, [r2]
	ldr r0, [r7]
	ldrb r0, [r0, 0x10]
	muls r0, r5
	adds r0, r4
	movs r1, 0x3D
	bl GetMonData
	mov r1, r8
	strh r0, [r1]
	ldr r0, [r7]
	ldrb r0, [r0, 0x10]
	muls r0, r5
	adds r0, r4
	movs r1, 0x3E
	bl GetMonData
	adds r1, r6, 0
	adds r1, 0xB8
	strh r0, [r1]
	b _08022356
	.align 2, 0
_08022314: .4byte gUnknown_2023BC8
_08022318: .4byte gActiveBattler
_0802231C: .4byte gBattleStruct
_08022320: .4byte gUnknown_20233C4
_08022324: .4byte gBattleTypeFlags
_08022328: .4byte gBattlerPartyIndexes
_0802232C: .4byte gPlayerParty
_08022330: .4byte gUnknown_2022AB8
_08022334: .4byte gUnknown_2022AC8
_08022338: .4byte gUnknown_3004FD4
_0802233C: .4byte gBitTable
_08022340: .4byte gUnknown_2023D74
_08022344: .4byte gUnknown_81D89F5
_08022348: .4byte gBattleMoveDamage
_0802234C: .4byte gBattleMons
_08022350:
	ldr r1, _08022360 @ =gBattleMoveDamage
	movs r0, 0
	str r0, [r1]
_08022356:
	ldr r1, _08022364 @ =gBattleScripting
	movs r0, 0x5
	strb r0, [r1, 0x1C]
	b _080223DA
	.align 2, 0
_08022360: .4byte gBattleMoveDamage
_08022364: .4byte gBattleScripting
_08022368:
	ldr r0, _08022378 @ =gBattleMoveDamage
	ldr r0, [r0]
	cmp r0, 0
	beq _08022380
	ldr r1, _0802237C @ =gBattleScripting
	movs r0, 0x3
	strb r0, [r1, 0x1C]
	b _080223DA
	.align 2, 0
_08022378: .4byte gBattleMoveDamage
_0802237C: .4byte gBattleScripting
_08022380:
	ldr r2, _0802239C @ =gBattleStruct
	ldr r1, [r2]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	ldr r0, [r2]
	ldrb r0, [r0, 0x10]
	cmp r0, 0x5
	bhi _080223A4
	ldr r1, _080223A0 @ =gBattleScripting
	movs r0, 0x2
	strb r0, [r1, 0x1C]
	b _080223DA
	.align 2, 0
_0802239C: .4byte gBattleStruct
_080223A0: .4byte gBattleScripting
_080223A4:
	ldr r1, _080223AC @ =gBattleScripting
	movs r0, 0x6
	strb r0, [r1, 0x1C]
	b _080223DA
	.align 2, 0
_080223AC: .4byte gBattleScripting
_080223B0:
	ldr r0, _080223E8 @ =gUnknown_2023BC8
	ldr r5, [r0]
	cmp r5, 0
	bne _080223DA
	ldr r4, _080223EC @ =gBattleMons
	ldr r2, _080223F0 @ =gUnknown_2023D6D
	ldrb r0, [r2]
	movs r1, 0x58
	muls r0, r1
	adds r0, r4
	movs r3, 0
	strh r5, [r0, 0x2E]
	ldrb r0, [r2]
	muls r0, r1
	adds r0, r4
	adds r0, 0x20
	strb r3, [r0]
	ldr r1, _080223F4 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
_080223DA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080223E8: .4byte gUnknown_2023BC8
_080223EC: .4byte gBattleMons
_080223F0: .4byte gUnknown_2023D6D
_080223F4: .4byte gUnknown_2023D74
	thumb_func_end sub_8021A68

	thumb_func_start sub_80223F8
sub_80223F8: @ 80223F8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0
	ldr r0, _08022534 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	beq _0802240A
	b _0802258A
_0802240A:
	movs r5, 0
_0802240C:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08022538 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0802243C
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0802243C
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	adds r0, r6, r0
	lsls r0, 16
	lsrs r6, r0, 16
_0802243C:
	adds r5, 0x1
	cmp r5, 0x5
	ble _0802240C
	cmp r6, 0
	bne _08022450
	ldr r0, _0802253C @ =gUnknown_2023E8A
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
_08022450:
	movs r6, 0
	movs r5, 0
_08022454:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08022540 @ =gEnemyParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08022484
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08022484
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	adds r0, r6, r0
	lsls r0, 16
	lsrs r6, r0, 16
_08022484:
	adds r5, 0x1
	cmp r5, 0x5
	ble _08022454
	ldr r2, _0802253C @ =gUnknown_2023E8A
	cmp r6, 0
	bne _08022498
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_08022498:
	ldrb r0, [r2]
	cmp r0, 0
	bne _08022582
	ldr r0, _08022544 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r2, 0x2
	ands r1, r2
	mov r8, r0
	cmp r1, 0
	beq _08022582
	movs r3, 0
	movs r5, 0
	ldr r0, _08022548 @ =gUnknown_2023BCC
	ldrb r1, [r0]
	mov r12, r0
	ldr r7, _0802254C @ =gUnknown_2023D74
	cmp r3, r1
	bge _080224E4
	ldr r0, _08022550 @ =gUnknown_2023DD0
	movs r6, 0x80
	lsls r6, 21
	ldr r4, [r0]
	adds r2, r1, 0
	ldr r1, _08022554 @ =gUnknown_2023ECC
_080224C8:
	adds r0, r6, 0
	lsls r0, r5
	ands r0, r4
	cmp r0, 0
	beq _080224DC
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _080224DC
	adds r3, 0x1
_080224DC:
	adds r1, 0x28
	adds r5, 0x2
	cmp r5, r2
	blt _080224C8
_080224E4:
	movs r2, 0
	movs r5, 0x1
	mov r0, r12
	ldrb r1, [r0]
	cmp r5, r1
	bge _0802251E
	ldr r0, _08022550 @ =gUnknown_2023DD0
	movs r4, 0x80
	lsls r4, 21
	mov r12, r4
	ldr r6, [r0]
	ldr r0, _08022554 @ =gUnknown_2023ECC
	adds r4, r1, 0
	adds r1, r0, 0
	adds r1, 0x14
_08022502:
	mov r0, r12
	lsls r0, r5
	ands r0, r6
	cmp r0, 0
	beq _08022516
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _08022516
	adds r2, 0x1
_08022516:
	adds r1, 0x28
	adds r5, 0x2
	cmp r5, r4
	blt _08022502
_0802251E:
	mov r1, r8
	ldr r0, [r1]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08022558
	adds r0, r2, r3
	cmp r0, 0x1
	bgt _08022560
	b _0802257A
	.align 2, 0
_08022534: .4byte gUnknown_2023BC8
_08022538: .4byte gPlayerParty
_0802253C: .4byte gUnknown_2023E8A
_08022540: .4byte gEnemyParty
_08022544: .4byte gBattleTypeFlags
_08022548: .4byte gUnknown_2023BCC
_0802254C: .4byte gUnknown_2023D74
_08022550: .4byte gUnknown_2023DD0
_08022554: .4byte gUnknown_2023ECC
_08022558:
	cmp r2, 0
	beq _0802257A
	cmp r3, 0
	beq _0802257A
_08022560:
	ldr r2, [r7]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	adds r1, r0
	str r1, [r7]
	b _0802258A
_0802257A:
	ldr r0, [r7]
	adds r0, 0x5
	str r0, [r7]
	b _0802258A
_08022582:
	ldr r1, _08022594 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802258A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022594: .4byte gUnknown_2023D74
	thumb_func_end sub_80223F8

	thumb_func_start MoveValuesCleanUp
MoveValuesCleanUp: @ 8022598
	ldr r1, _080225C0 @ =gMoveResultFlags
	movs r0, 0
	strb r0, [r1]
	ldr r0, _080225C4 @ =gBattleScripting
	movs r2, 0
	movs r1, 0x1
	strb r1, [r0, 0xE]
	ldr r0, _080225C8 @ =gCritMultiplier
	strb r1, [r0]
	ldr r0, _080225CC @ =gUnknown_2023E82
	strb r2, [r0, 0x3]
	strb r2, [r0, 0x6]
	ldr r2, _080225D0 @ =gUnknown_2023DD0
	ldr r0, [r2]
	subs r1, 0x42
	ands r0, r1
	ldr r1, _080225D4 @ =0xffffbfff
	ands r0, r1
	str r0, [r2]
	bx lr
	.align 2, 0
_080225C0: .4byte gMoveResultFlags
_080225C4: .4byte gBattleScripting
_080225C8: .4byte gCritMultiplier
_080225CC: .4byte gUnknown_2023E82
_080225D0: .4byte gUnknown_2023DD0
_080225D4: .4byte 0xffffbfff
	thumb_func_end MoveValuesCleanUp

	thumb_func_start atk25_movevaluescleanup
atk25_movevaluescleanup: @ 80225D8
	push {lr}
	bl MoveValuesCleanUp
	ldr r1, _080225EC @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080225EC: .4byte gUnknown_2023D74
	thumb_func_end atk25_movevaluescleanup

	thumb_func_start atk26_setmultihit
atk26_setmultihit: @ 80225F0
	ldr r3, _08022600 @ =gUnknown_2023D72
	ldr r2, _08022604 @ =gUnknown_2023D74
	ldr r0, [r2]
	ldrb r1, [r0, 0x1]
	strb r1, [r3]
	adds r0, 0x2
	str r0, [r2]
	bx lr
	.align 2, 0
_08022600: .4byte gUnknown_2023D72
_08022604: .4byte gUnknown_2023D74
	thumb_func_end atk26_setmultihit

	thumb_func_start atk27_decrementmultihit
atk27_decrementmultihit: @ 8022608
	push {lr}
	ldr r1, _08022624 @ =gUnknown_2023D72
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _0802262C
	ldr r1, _08022628 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08022646
	.align 2, 0
_08022624: .4byte gUnknown_2023D72
_08022628: .4byte gUnknown_2023D74
_0802262C:
	ldr r3, _0802264C @ =gUnknown_2023D74
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	adds r1, r0
	str r1, [r3]
_08022646:
	pop {r0}
	bx r0
	.align 2, 0
_0802264C: .4byte gUnknown_2023D74
	thumb_func_end atk27_decrementmultihit

	thumb_func_start atk28_goto
atk28_goto: @ 8022650
	ldr r3, _0802266C @ =gUnknown_2023D74
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	adds r1, r0
	str r1, [r3]
	bx lr
	.align 2, 0
_0802266C: .4byte gUnknown_2023D74
	thumb_func_end atk28_goto

	thumb_func_start atk29_jumpifbyte
atk29_jumpifbyte: @ 8022670
	push {r4-r6,lr}
	ldr r3, _080226B4 @ =gUnknown_2023D74
	ldr r1, [r3]
	ldrb r6, [r1, 0x1]
	ldrb r2, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 24
	adds r5, r2, r0
	ldrb r4, [r1, 0x6]
	ldrb r2, [r1, 0x7]
	ldrb r0, [r1, 0x8]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0x9]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0xA]
	lsls r0, 24
	adds r2, r0
	adds r1, 0xB
	str r1, [r3]
	cmp r6, 0x5
	bhi _08022708
	lsls r0, r6, 2
	ldr r1, _080226B8 @ =_080226BC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080226B4: .4byte gUnknown_2023D74
_080226B8: .4byte _080226BC
	.align 2, 0
_080226BC:
	.4byte _080226D4
	.4byte _080226DC
	.4byte _080226E4
	.4byte _080226EC
	.4byte _080226F4
	.4byte _080226FE
_080226D4:
	ldrb r0, [r5]
	cmp r0, r4
	bne _08022708
	b _08022706
_080226DC:
	ldrb r0, [r5]
	cmp r0, r4
	beq _08022708
	b _08022706
_080226E4:
	ldrb r0, [r5]
	cmp r0, r4
	bls _08022708
	b _08022706
_080226EC:
	ldrb r0, [r5]
	cmp r0, r4
	bcs _08022708
	b _08022706
_080226F4:
	ldrb r0, [r5]
	ands r4, r0
	cmp r4, 0
	beq _08022708
	b _08022706
_080226FE:
	ldrb r0, [r5]
	ands r4, r0
	cmp r4, 0
	bne _08022708
_08022706:
	str r2, [r3]
_08022708:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end atk29_jumpifbyte

	thumb_func_start atk2A_jumpifhalfword
atk2A_jumpifhalfword: @ 8022710
	push {r4-r6,lr}
	ldr r3, _0802275C @ =gUnknown_2023D74
	ldr r1, [r3]
	ldrb r6, [r1, 0x1]
	ldrb r2, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 24
	adds r5, r2, r0
	ldrb r4, [r1, 0x6]
	ldrb r0, [r1, 0x7]
	lsls r0, 8
	orrs r4, r0
	ldrb r2, [r1, 0x8]
	ldrb r0, [r1, 0x9]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0xA]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0xB]
	lsls r0, 24
	adds r2, r0
	adds r1, 0xC
	str r1, [r3]
	cmp r6, 0x5
	bhi _080227B0
	lsls r0, r6, 2
	ldr r1, _08022760 @ =_08022764
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802275C: .4byte gUnknown_2023D74
_08022760: .4byte _08022764
	.align 2, 0
_08022764:
	.4byte _0802277C
	.4byte _08022784
	.4byte _0802278C
	.4byte _08022794
	.4byte _0802279C
	.4byte _080227A6
_0802277C:
	ldrh r0, [r5]
	cmp r0, r4
	bne _080227B0
	b _080227AE
_08022784:
	ldrh r0, [r5]
	cmp r0, r4
	beq _080227B0
	b _080227AE
_0802278C:
	ldrh r0, [r5]
	cmp r0, r4
	bls _080227B0
	b _080227AE
_08022794:
	ldrh r0, [r5]
	cmp r0, r4
	bcs _080227B0
	b _080227AE
_0802279C:
	ldrh r0, [r5]
	ands r4, r0
	cmp r4, 0
	beq _080227B0
	b _080227AE
_080227A6:
	ldrh r0, [r5]
	ands r4, r0
	cmp r4, 0
	bne _080227B0
_080227AE:
	str r2, [r3]
_080227B0:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end atk2A_jumpifhalfword

	thumb_func_start atk2B_jumpifword
atk2B_jumpifword: @ 80227B8
	push {r4-r6,lr}
	ldr r3, _08022810 @ =gUnknown_2023D74
	ldr r1, [r3]
	ldrb r6, [r1, 0x1]
	ldrb r2, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 24
	adds r5, r2, r0
	ldrb r4, [r1, 0x6]
	ldrb r0, [r1, 0x7]
	lsls r0, 8
	orrs r4, r0
	ldrb r0, [r1, 0x8]
	lsls r0, 16
	orrs r4, r0
	ldrb r0, [r1, 0x9]
	lsls r0, 24
	orrs r4, r0
	ldrb r2, [r1, 0xA]
	ldrb r0, [r1, 0xB]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0xC]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0xD]
	lsls r0, 24
	adds r2, r0
	adds r1, 0xE
	str r1, [r3]
	cmp r6, 0x5
	bhi _08022864
	lsls r0, r6, 2
	ldr r1, _08022814 @ =_08022818
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08022810: .4byte gUnknown_2023D74
_08022814: .4byte _08022818
	.align 2, 0
_08022818:
	.4byte _08022830
	.4byte _08022838
	.4byte _08022840
	.4byte _08022848
	.4byte _08022850
	.4byte _0802285A
_08022830:
	ldr r0, [r5]
	cmp r0, r4
	bne _08022864
	b _08022862
_08022838:
	ldr r0, [r5]
	cmp r0, r4
	beq _08022864
	b _08022862
_08022840:
	ldr r0, [r5]
	cmp r0, r4
	bls _08022864
	b _08022862
_08022848:
	ldr r0, [r5]
	cmp r0, r4
	bcs _08022864
	b _08022862
_08022850:
	ldr r0, [r5]
	ands r0, r4
	cmp r0, 0
	beq _08022864
	b _08022862
_0802285A:
	ldr r0, [r5]
	ands r0, r4
	cmp r0, 0
	bne _08022864
_08022862:
	str r2, [r3]
_08022864:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end atk2B_jumpifword

	thumb_func_start atk2C_jumpifarrayequal
atk2C_jumpifarrayequal: @ 802286C
	push {r4-r7,lr}
	ldr r2, _080228C4 @ =gUnknown_2023D74
	ldr r3, [r2]
	ldrb r1, [r3, 0x1]
	ldrb r0, [r3, 0x2]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 24
	adds r5, r1, r0
	ldrb r1, [r3, 0x5]
	ldrb r0, [r3, 0x6]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0x7]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0x8]
	lsls r0, 24
	adds r4, r1, r0
	ldrb r6, [r3, 0x9]
	ldrb r1, [r3, 0xA]
	ldrb r0, [r3, 0xB]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0xC]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0xD]
	lsls r0, 24
	adds r1, r0
	mov r12, r1
	movs r1, 0
	cmp r1, r6
	bcs _080228E4
	ldrb r0, [r5]
	ldrb r7, [r4]
	cmp r0, r7
	beq _080228C8
	adds r0, r3, 0
	b _080228E0
	.align 2, 0
_080228C4: .4byte gUnknown_2023D74
_080228C8:
	adds r5, 0x1
	adds r4, 0x1
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r6
	bcs _080228E4
	ldrb r0, [r5]
	ldrb r3, [r4]
	cmp r0, r3
	beq _080228C8
	ldr r0, [r2]
_080228E0:
	adds r0, 0xE
	str r0, [r2]
_080228E4:
	cmp r1, r6
	bne _080228EC
	mov r7, r12
	str r7, [r2]
_080228EC:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end atk2C_jumpifarrayequal

	thumb_func_start atk2D_jumpifarraynotequal
atk2D_jumpifarraynotequal: @ 80228F4
	push {r4-r7,lr}
	movs r7, 0
	ldr r3, _08022968 @ =gUnknown_2023D74
	ldr r1, [r3]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	adds r5, r2, r0
	ldrb r2, [r1, 0x5]
	ldrb r0, [r1, 0x6]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0x7]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0x8]
	lsls r0, 24
	adds r4, r2, r0
	ldrb r6, [r1, 0x9]
	ldrb r2, [r1, 0xA]
	ldrb r0, [r1, 0xB]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0xC]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0xD]
	lsls r0, 24
	adds r2, r0
	mov r12, r2
	movs r1, 0
	cmp r7, r6
	bcs _0802295E
_08022942:
	ldrb r0, [r5]
	ldrb r2, [r4]
	cmp r0, r2
	bne _08022950
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_08022950:
	adds r5, 0x1
	adds r4, 0x1
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r6
	bcc _08022942
_0802295E:
	cmp r7, r6
	beq _0802296C
	mov r0, r12
	b _08022970
	.align 2, 0
_08022968: .4byte gUnknown_2023D74
_0802296C:
	ldr r0, [r3]
	adds r0, 0xE
_08022970:
	str r0, [r3]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end atk2D_jumpifarraynotequal

	thumb_func_start atk2E_setbyte
atk2E_setbyte: @ 8022978
	ldr r3, _0802299C @ =gUnknown_2023D74
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	adds r1, r0
	ldrb r0, [r2, 0x5]
	strb r0, [r1]
	ldr r0, [r3]
	adds r0, 0x6
	str r0, [r3]
	bx lr
	.align 2, 0
_0802299C: .4byte gUnknown_2023D74
	thumb_func_end atk2E_setbyte

	thumb_func_start atk2F_addbyte
atk2F_addbyte: @ 80229A0
	ldr r3, _080229C8 @ =gUnknown_2023D74
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	adds r1, r0
	ldrb r0, [r2, 0x5]
	ldrb r2, [r1]
	adds r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	adds r0, 0x6
	str r0, [r3]
	bx lr
	.align 2, 0
_080229C8: .4byte gUnknown_2023D74
	thumb_func_end atk2F_addbyte

	thumb_func_start atk30_subbyte
atk30_subbyte: @ 80229CC
	ldr r3, _080229F4 @ =gUnknown_2023D74
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	adds r1, r0
	ldrb r0, [r1]
	ldrb r2, [r2, 0x5]
	subs r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	adds r0, 0x6
	str r0, [r3]
	bx lr
	.align 2, 0
_080229F4: .4byte gUnknown_2023D74
	thumb_func_end atk30_subbyte

	thumb_func_start atk31_copyarray
atk31_copyarray: @ 80229F8
	push {r4-r6,lr}
	ldr r3, _08022A48 @ =gUnknown_2023D74
	ldr r1, [r3]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	adds r6, r2, r0
	ldrb r2, [r1, 0x5]
	ldrb r0, [r1, 0x6]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0x7]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0x8]
	lsls r0, 24
	adds r5, r2, r0
	ldrb r4, [r1, 0x9]
	movs r2, 0
	cmp r2, r4
	bge _08022A3C
_08022A2E:
	adds r0, r6, r2
	adds r1, r5, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, r4
	blt _08022A2E
_08022A3C:
	ldr r0, [r3]
	adds r0, 0xA
	str r0, [r3]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08022A48: .4byte gUnknown_2023D74
	thumb_func_end atk31_copyarray

	thumb_func_start atk32_copyarraywithindex
atk32_copyarraywithindex: @ 8022A4C
	push {r4-r7,lr}
	ldr r3, _08022AB4 @ =gUnknown_2023D74
	ldr r1, [r3]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	adds r7, r2, r0
	ldrb r2, [r1, 0x5]
	ldrb r0, [r1, 0x6]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0x7]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0x8]
	lsls r0, 24
	adds r6, r2, r0
	ldrb r2, [r1, 0x9]
	ldrb r0, [r1, 0xA]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0xB]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0xC]
	lsls r0, 24
	adds r5, r2, r0
	ldrb r4, [r1, 0xD]
	movs r2, 0
	cmp r2, r4
	bge _08022AA8
_08022A96:
	adds r0, r7, r2
	ldrb r1, [r5]
	adds r1, r2, r1
	adds r1, r6, r1
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, r4
	blt _08022A96
_08022AA8:
	ldr r0, [r3]
	adds r0, 0xE
	str r0, [r3]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022AB4: .4byte gUnknown_2023D74
	thumb_func_end atk32_copyarraywithindex

	thumb_func_start atk33_orbyte
atk33_orbyte: @ 8022AB8
	ldr r3, _08022AE0 @ =gUnknown_2023D74
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	adds r1, r0
	ldrb r0, [r1]
	ldrb r2, [r2, 0x5]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	adds r0, 0x6
	str r0, [r3]
	bx lr
	.align 2, 0
_08022AE0: .4byte gUnknown_2023D74
	thumb_func_end atk33_orbyte

	thumb_func_start atk34_orhalfword
atk34_orhalfword: @ 8022AE4
	push {r4,lr}
	ldr r4, _08022B18 @ =gUnknown_2023D74
	ldr r3, [r4]
	ldrb r2, [r3, 0x1]
	ldrb r0, [r3, 0x2]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 24
	adds r2, r0
	ldrb r1, [r3, 0x5]
	ldrb r0, [r3, 0x6]
	lsls r0, 8
	orrs r1, r0
	ldrh r0, [r2]
	orrs r1, r0
	strh r1, [r2]
	ldr r0, [r4]
	adds r0, 0x7
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08022B18: .4byte gUnknown_2023D74
	thumb_func_end atk34_orhalfword

	thumb_func_start atk35_orword
atk35_orword: @ 8022B1C
	push {r4,lr}
	ldr r4, _08022B5C @ =gUnknown_2023D74
	ldr r2, [r4]
	ldrb r3, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	adds r3, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	adds r3, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	adds r3, r0
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	adds r1, r0
	ldr r0, [r3]
	orrs r0, r1
	str r0, [r3]
	ldr r0, [r4]
	adds r0, 0x9
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08022B5C: .4byte gUnknown_2023D74
	thumb_func_end atk35_orword

	thumb_func_start atk36_bicbyte
atk36_bicbyte: @ 8022B60
	ldr r3, _08022B88 @ =gUnknown_2023D74
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	adds r1, r0
	ldrb r2, [r2, 0x5]
	ldrb r0, [r1]
	bics r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	adds r0, 0x6
	str r0, [r3]
	bx lr
	.align 2, 0
_08022B88: .4byte gUnknown_2023D74
	thumb_func_end atk36_bicbyte

	thumb_func_start atk37_bichalfword
atk37_bichalfword: @ 8022B8C
	push {r4,lr}
	ldr r4, _08022BC0 @ =gUnknown_2023D74
	ldr r3, [r4]
	ldrb r1, [r3, 0x1]
	ldrb r0, [r3, 0x2]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 24
	adds r1, r0
	ldrb r2, [r3, 0x5]
	ldrb r0, [r3, 0x6]
	lsls r0, 8
	orrs r2, r0
	ldrh r0, [r1]
	bics r0, r2
	strh r0, [r1]
	ldr r0, [r4]
	adds r0, 0x7
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08022BC0: .4byte gUnknown_2023D74
	thumb_func_end atk37_bichalfword

	thumb_func_start atk38_bicword
atk38_bicword: @ 8022BC4
	push {r4,lr}
	ldr r4, _08022C04 @ =gUnknown_2023D74
	ldr r2, [r4]
	ldrb r3, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	adds r3, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	adds r3, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	adds r3, r0
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	adds r1, r0
	ldr r0, [r3]
	bics r0, r1
	str r0, [r3]
	ldr r0, [r4]
	adds r0, 0x9
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08022C04: .4byte gUnknown_2023D74
	thumb_func_end atk38_bicword

	thumb_func_start atk39_pause
atk39_pause: @ 8022C08
	push {r4,r5,lr}
	ldr r0, _08022C3C @ =gUnknown_2023BC8
	ldr r4, [r0]
	cmp r4, 0
	bne _08022C34
	ldr r5, _08022C40 @ =gUnknown_2023D74
	ldr r2, [r5]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldr r3, _08022C44 @ =gUnknown_2023E7C
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r1
	bcc _08022C34
	strh r4, [r3]
	adds r0, r2, 0x3
	str r0, [r5]
_08022C34:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08022C3C: .4byte gUnknown_2023BC8
_08022C40: .4byte gUnknown_2023D74
_08022C44: .4byte gUnknown_2023E7C
	thumb_func_end atk39_pause

	thumb_func_start sub_8022C48
sub_8022C48: @ 8022C48
	push {lr}
	ldr r0, _08022C60 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	bne _08022C5A
	ldr r1, _08022C64 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_08022C5A:
	pop {r0}
	bx r0
	.align 2, 0
_08022C60: .4byte gUnknown_2023BC8
_08022C64: .4byte gUnknown_2023D74
	thumb_func_end sub_8022C48

	thumb_func_start atk3B_healthbar_update
atk3B_healthbar_update: @ 8022C68
	push {lr}
	ldr r0, _08022C7C @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _08022C88
	ldr r0, _08022C80 @ =gActiveBattler
	ldr r1, _08022C84 @ =gBattlerTarget
	b _08022C8C
	.align 2, 0
_08022C7C: .4byte gUnknown_2023D74
_08022C80: .4byte gActiveBattler
_08022C84: .4byte gBattlerTarget
_08022C88:
	ldr r0, _08022CB0 @ =gActiveBattler
	ldr r1, _08022CB4 @ =sBattler_AI
_08022C8C:
	ldrb r1, [r1]
	strb r1, [r0]
	ldr r0, _08022CB8 @ =gBattleMoveDamage
	ldrh r1, [r0]
	movs r0, 0
	bl EmitHealthBarUpdate
	ldr r0, _08022CB0 @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBufferBankForExecution
	ldr r1, _08022CBC @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08022CB0: .4byte gActiveBattler
_08022CB4: .4byte sBattler_AI
_08022CB8: .4byte gBattleMoveDamage
_08022CBC: .4byte gUnknown_2023D74
	thumb_func_end atk3B_healthbar_update

	thumb_func_start atk3C_return
atk3C_return: @ 8022CC0
	push {lr}
	bl BattleScriptPop
	pop {r0}
	bx r0
	thumb_func_end atk3C_return

	thumb_func_start atk3D_end
atk3D_end: @ 8022CCC
	ldr r0, _08022CE0 @ =gMoveResultFlags
	movs r1, 0
	strb r1, [r0]
	ldr r0, _08022CE4 @ =gActiveBattler
	strb r1, [r0]
	ldr r1, _08022CE8 @ =gUnknown_2023BE3
	movs r0, 0xB
	strb r0, [r1]
	bx lr
	.align 2, 0
_08022CE0: .4byte gMoveResultFlags
_08022CE4: .4byte gActiveBattler
_08022CE8: .4byte gUnknown_2023BE3
	thumb_func_end atk3D_end

	thumb_func_start atk3E_end2
atk3E_end2: @ 8022CEC
	ldr r1, _08022CFC @ =gActiveBattler
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08022D00 @ =gUnknown_2023BE3
	movs r0, 0xB
	strb r0, [r1]
	bx lr
	.align 2, 0
_08022CFC: .4byte gActiveBattler
_08022D00: .4byte gUnknown_2023BE3
	thumb_func_end atk3E_end2

	thumb_func_start atk3F_end3
atk3F_end3: @ 8022D04
	push {lr}
	bl BattleScriptPop
	ldr r3, _08022D38 @ =gBattleResources
	ldr r0, [r3]
	ldr r0, [r0, 0xC]
	adds r1, r0, 0
	adds r1, 0x20
	ldrb r0, [r1]
	cmp r0, 0
	beq _08022D1E
	subs r0, 0x1
	strb r0, [r1]
_08022D1E:
	ldr r2, _08022D3C @ =gUnknown_3004F84
	ldr r0, [r3]
	ldr r1, [r0, 0xC]
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	lsls r0, 2
	adds r1, r0
	ldr r0, [r1]
	str r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08022D38: .4byte gBattleResources
_08022D3C: .4byte gUnknown_3004F84
	thumb_func_end atk3F_end3

	thumb_func_start atk41_call
atk41_call: @ 8022D40
	push {r4,lr}
	ldr r4, _08022D6C @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x5
	bl BattleScriptPush
	ldr r2, [r4]
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
	str r1, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08022D6C: .4byte gUnknown_2023D74
	thumb_func_end atk41_call

	thumb_func_start atk42_jumpiftype2
atk42_jumpiftype2: @ 8022D70
	push {r4,lr}
	ldr r4, _08022DB8 @ =gUnknown_2023D74
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	lsls r0, 24
	lsrs r0, 24
	ldr r3, [r4]
	ldr r2, _08022DBC @ =gBattleMons
	movs r1, 0x58
	muls r0, r1
	adds r0, r2
	adds r1, r0, 0
	adds r1, 0x21
	ldrb r2, [r3, 0x2]
	ldrb r1, [r1]
	cmp r2, r1
	beq _08022D9E
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r2, r0
	bne _08022DC0
_08022D9E:
	ldrb r1, [r3, 0x3]
	ldrb r0, [r3, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08022DC4
	.align 2, 0
_08022DB8: .4byte gUnknown_2023D74
_08022DBC: .4byte gBattleMons
_08022DC0:
	adds r0, r3, 0x7
	str r0, [r4]
_08022DC4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end atk42_jumpiftype2

	thumb_func_start atk43_jumpifabilitypresent
atk43_jumpifabilitypresent: @ 8022DCC
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08022E04 @ =gUnknown_2023D74
	ldr r0, [r4]
	ldrb r2, [r0, 0x1]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	cmp r0, 0
	beq _08022E08
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
	b _08022E0E
	.align 2, 0
_08022E04: .4byte gUnknown_2023D74
_08022E08:
	ldr r0, [r4]
	adds r0, 0x6
	str r0, [r4]
_08022E0E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end atk43_jumpifabilitypresent

	thumb_func_start atk44_endselectionscript
atk44_endselectionscript: @ 8022E18
	ldr r0, _08022E2C @ =sBattler_AI
	ldrb r0, [r0]
	ldr r1, _08022E30 @ =gBattleStruct
	ldr r1, [r1]
	adds r0, r1
	adds r0, 0x54
	movs r1, 0x1
	strb r1, [r0]
	bx lr
	.align 2, 0
_08022E2C: .4byte sBattler_AI
_08022E30: .4byte gBattleStruct
	thumb_func_end atk44_endselectionscript

	thumb_func_start sub_8022E34
sub_8022E34: @ 8022E34
	push {r4-r6,lr}
	ldr r4, _08022E84 @ =gUnknown_2023D74
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r6, _08022E88 @ =gActiveBattler
	strb r0, [r6]
	ldr r2, [r4]
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	adds r3, r1, r0
	ldrb r5, [r2, 0x2]
	adds r0, r5, 0
	cmp r0, 0x1
	beq _08022E6E
	cmp r0, 0x11
	beq _08022E6E
	cmp r0, 0x2
	beq _08022E6E
	cmp r0, 0x19
	bne _08022E8C
_08022E6E:
	ldr r4, _08022E84 @ =gUnknown_2023D74
	ldr r0, [r4]
	ldrb r1, [r0, 0x2]
	ldrh r2, [r3]
	movs r0, 0
	bl EmitBattleAnimation
	ldr r0, _08022E88 @ =gActiveBattler
	ldrb r0, [r0]
	b _08022EE4
	.align 2, 0
_08022E84: .4byte gUnknown_2023D74
_08022E88: .4byte gActiveBattler
_08022E8C:
	ldr r0, _08022EA4 @ =gUnknown_2023DD0
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08022EAC
	adds r0, r2, 0x7
	bl BattleScriptPush
	ldr r0, _08022EA8 @ =gUnknown_81D89F1
	b _08022EEC
	.align 2, 0
_08022EA4: .4byte gUnknown_2023DD0
_08022EA8: .4byte gUnknown_81D89F1
_08022EAC:
	adds r0, r5, 0
	subs r0, 0xA
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _08022ED8
	ldr r1, _08022ED0 @ =gStatuses3
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08022ED4 @ =0x000400c0
	ands r0, r1
	cmp r0, 0
	beq _08022ED8
	adds r0, r2, 0x7
	b _08022EEC
	.align 2, 0
_08022ED0: .4byte gStatuses3
_08022ED4: .4byte 0x000400c0
_08022ED8:
	ldrb r1, [r2, 0x2]
	ldrh r2, [r3]
	movs r0, 0
	bl EmitBattleAnimation
	ldrb r0, [r6]
_08022EE4:
	bl MarkBufferBankForExecution
	ldr r0, [r4]
	adds r0, 0x7
_08022EEC:
	str r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8022E34

	thumb_func_start atk46_playanimation2
atk46_playanimation2: @ 8022EF4
	push {r4-r7,lr}
	ldr r6, _08022F5C @ =gUnknown_2023D74
	ldr r0, [r6]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r7, _08022F60 @ =gActiveBattler
	strb r0, [r7]
	ldr r2, [r6]
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	adds r3, r1, r0
	ldrb r1, [r2, 0x6]
	ldrb r0, [r2, 0x7]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x9]
	lsls r0, 24
	adds r4, r1, r0
	ldrb r5, [r3]
	adds r0, r5, 0
	cmp r0, 0x1
	beq _08022F3E
	cmp r0, 0x11
	beq _08022F3E
	cmp r0, 0x2
	bne _08022F64
_08022F3E:
	ldrb r1, [r3]
	ldrh r2, [r4]
	movs r0, 0
	bl EmitBattleAnimation
	ldr r0, _08022F60 @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBufferBankForExecution
	ldr r1, _08022F5C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0xA
	str r0, [r1]
	b _08022FBA
	.align 2, 0
_08022F5C: .4byte gUnknown_2023D74
_08022F60: .4byte gActiveBattler
_08022F64:
	ldr r0, _08022F74 @ =gUnknown_2023DD0
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08022F78
	adds r0, r2, 0
	b _08022FB6
	.align 2, 0
_08022F74: .4byte gUnknown_2023DD0
_08022F78:
	adds r0, r5, 0
	subs r0, 0xA
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _08022FA4
	ldr r1, _08022F9C @ =gStatuses3
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08022FA0 @ =0x000400c0
	ands r0, r1
	cmp r0, 0
	beq _08022FA4
	adds r0, r2, 0
	b _08022FB6
	.align 2, 0
_08022F9C: .4byte gStatuses3
_08022FA0: .4byte 0x000400c0
_08022FA4:
	ldrb r1, [r3]
	ldrh r2, [r4]
	movs r0, 0
	bl EmitBattleAnimation
	ldrb r0, [r7]
	bl MarkBufferBankForExecution
	ldr r0, [r6]
_08022FB6:
	adds r0, 0xA
	str r0, [r6]
_08022FBA:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end atk46_playanimation2

	thumb_func_start atk47_setgraphicalstatchangevalues
atk47_setgraphicalstatchangevalues: @ 8022FC0
	push {r4,lr}
	movs r3, 0
	ldr r1, _08022FDC @ =gBattleScripting
	ldrb r0, [r1, 0x1A]
	movs r2, 0xF0
	ands r2, r0
	adds r4, r1, 0
	cmp r2, 0x20
	beq _08022FEE
	cmp r2, 0x20
	bgt _08022FE0
	cmp r2, 0x10
	beq _08022FEA
	b _08022FF8
	.align 2, 0
_08022FDC: .4byte gBattleScripting
_08022FE0:
	cmp r2, 0x90
	beq _08022FF2
	cmp r2, 0xA0
	beq _08022FF6
	b _08022FF8
_08022FEA:
	movs r3, 0xF
	b _08022FF8
_08022FEE:
	movs r3, 0x27
	b _08022FF8
_08022FF2:
	movs r3, 0x16
	b _08022FF8
_08022FF6:
	movs r3, 0x2E
_08022FF8:
	ldrb r1, [r4, 0x1A]
	movs r0, 0xF
	ands r0, r1
	adds r0, r3, r0
	subs r0, 0x1
	movs r1, 0
	strb r0, [r4, 0x10]
	strb r1, [r4, 0x11]
	ldr r1, _08023018 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023018: .4byte gUnknown_2023D74
	thumb_func_end atk47_setgraphicalstatchangevalues

	thumb_func_start atk48_playstatchangeanimation
atk48_playstatchangeanimation: @ 802301C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r7, 0
	movs r0, 0
	mov r8, r0
	movs r3, 0
	ldr r5, _08023090 @ =gUnknown_2023D74
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	str r3, [sp]
	bl sub_8016E24
	ldr r2, _08023094 @ =gActiveBattler
	strb r0, [r2]
	ldr r0, [r5]
	ldrb r4, [r0, 0x2]
	ldrb r1, [r0, 0x3]
	movs r0, 0x1
	ands r0, r1
	ldr r3, [sp]
	cmp r0, 0
	beq _08023130
	movs r0, 0x2
	ands r0, r1
	movs r1, 0x15
	cmp r0, 0
	beq _0802305C
	movs r1, 0x2D
_0802305C:
	cmp r4, 0
	beq _08023104
	movs r0, 0x1
	mov r10, r0
	ldr r0, _08023098 @ =gUnknown_2023BFC
	mov r9, r0
	lsls r5, r1, 16
_0802306A:
	adds r0, r4, 0
	mov r1, r10
	ands r0, r1
	cmp r0, 0
	beq _080230F6
	ldr r0, _08023090 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r1, [r0, 0x3]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0802309C
	ldr r0, _08023094 @ =gActiveBattler
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r7, r0
	b _080230E4
	.align 2, 0
_08023090: .4byte gUnknown_2023D74
_08023094: .4byte gActiveBattler
_08023098: .4byte gUnknown_2023BFC
_0802309C:
	ldr r6, _08023120 @ =gActiveBattler
	ldrb r0, [r6]
	str r3, [sp]
	bl GetBankIdentity
	mov r1, r10
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08023124 @ =gUnknown_2023DE4
	adds r0, r1
	ldrb r0, [r0, 0x4]
	ldr r3, [sp]
	cmp r0, 0
	bne _080230F6
	ldr r0, _08023128 @ =gBattleMons
	ldrb r2, [r6]
	movs r1, 0x58
	muls r2, r1
	adds r0, r2, r0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1D
	beq _080230F6
	cmp r0, 0x49
	beq _080230F6
	cmp r0, 0x33
	bne _080230DA
	cmp r7, 0x6
	beq _080230F6
_080230DA:
	cmp r0, 0x34
	bne _080230E2
	cmp r7, 0x1
	beq _080230F6
_080230E2:
	adds r0, r7, r2
_080230E4:
	add r0, r9
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	ble _080230F6
	lsrs r0, r5, 16
	mov r8, r0
	adds r3, 0x1
_080230F6:
	lsrs r4, 1
	movs r1, 0x80
	lsls r1, 9
	adds r5, r1
	adds r7, 0x1
	cmp r4, 0
	bne _0802306A
_08023104:
	ldr r0, _0802312C @ =gUnknown_2023D74
	mov r9, r0
	cmp r3, 0x1
	ble _08023192
	ldr r0, [r0]
	ldrb r1, [r0, 0x3]
	movs r0, 0x2
	ands r0, r1
	movs r1, 0x39
	mov r8, r1
	cmp r0, 0
	beq _08023192
	movs r0, 0x3A
	b _08023190
	.align 2, 0
_08023120: .4byte gActiveBattler
_08023124: .4byte gUnknown_2023DE4
_08023128: .4byte gBattleMons
_0802312C: .4byte gUnknown_2023D74
_08023130:
	movs r0, 0x2
	ands r0, r1
	movs r1, 0xE
	cmp r0, 0
	beq _0802313C
	movs r1, 0x26
_0802313C:
	mov r9, r5
	cmp r4, 0
	beq _08023178
	ldr r6, _080231AC @ =gUnknown_2023BFC
	adds r5, r2, 0
	lsls r2, r1, 16
_08023148:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0802316A
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	adds r0, r7, r0
	adds r0, r6
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xB
	bgt _0802316A
	lsrs r1, r2, 16
	mov r8, r1
	adds r3, 0x1
_0802316A:
	lsrs r4, 1
	movs r0, 0x80
	lsls r0, 9
	adds r2, r0
	adds r7, 0x1
	cmp r4, 0
	bne _08023148
_08023178:
	cmp r3, 0x1
	ble _08023192
	mov r1, r9
	ldr r0, [r1]
	ldrb r1, [r0, 0x3]
	movs r0, 0x2
	ands r0, r1
	movs r1, 0x37
	mov r8, r1
	cmp r0, 0
	beq _08023192
	movs r0, 0x38
_08023190:
	mov r8, r0
_08023192:
	mov r1, r9
	ldr r2, [r1]
	ldrb r1, [r2, 0x3]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080231B0
	cmp r3, 0x1
	bgt _080231B0
	adds r0, r2, 0x4
	mov r1, r9
	b _080231FE
	.align 2, 0
_080231AC: .4byte gUnknown_2023BFC
_080231B0:
	cmp r3, 0
	beq _080231F8
	ldr r4, _080231EC @ =gBattleScripting
	ldrb r0, [r4, 0x1B]
	cmp r0, 0
	bne _080231F8
	movs r0, 0
	movs r1, 0x1
	mov r2, r8
	str r3, [sp]
	bl EmitBattleAnimation
	ldr r0, _080231F0 @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBufferBankForExecution
	ldr r0, _080231F4 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r1, [r0, 0x3]
	movs r0, 0x4
	ands r0, r1
	ldr r3, [sp]
	cmp r0, 0
	beq _080231E8
	cmp r3, 0x1
	ble _080231E8
	movs r0, 0x1
	strb r0, [r4, 0x1B]
_080231E8:
	ldr r1, _080231F4 @ =gUnknown_2023D74
	b _080231FA
	.align 2, 0
_080231EC: .4byte gBattleScripting
_080231F0: .4byte gActiveBattler
_080231F4: .4byte gUnknown_2023D74
_080231F8:
	mov r1, r9
_080231FA:
	ldr r0, [r1]
	adds r0, 0x4
_080231FE:
	str r0, [r1]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end atk48_playstatchangeanimation

	thumb_func_start atk49_moveend
atk49_moveend: @ 8023210
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	movs r0, 0
	mov r10, r0
	ldr r2, _08023260 @ =gUnknown_2023D4C
	ldrh r1, [r2]
	ldr r0, _08023264 @ =0x0000ffff
	movs r3, 0
	str r3, [sp, 0x18]
	cmp r1, r0
	beq _08023232
	ldrh r2, [r2]
	str r2, [sp, 0x18]
_08023232:
	ldr r0, _08023268 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r4, [r0, 0x1]
	str r4, [sp, 0x10]
	ldrb r0, [r0, 0x2]
	str r0, [sp, 0x14]
	ldr r1, _0802326C @ =gBattleMons
	ldr r0, _08023270 @ =sBattler_AI
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, r0, r1
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _08023278
	ldr r1, _08023274 @ =gUnknown_2023F54
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x7]
	b _08023282
	.align 2, 0
_08023260: .4byte gUnknown_2023D4C
_08023264: .4byte 0x0000ffff
_08023268: .4byte gUnknown_2023D74
_0802326C: .4byte gBattleMons
_08023270: .4byte sBattler_AI
_08023274: .4byte gUnknown_2023F54
_08023278:
	ldrh r0, [r1, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r0, 24
_08023282:
	str r0, [sp, 0x8]
	ldr r1, _080232A4 @ =gBattleStruct
	ldr r0, _080232A8 @ =sBattler_AI
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, 0xC8
	ldr r1, [r1]
	adds r0, r1, r0
	str r0, [sp, 0xC]
	ldrb r0, [r1, 0x13]
	cmp r0, 0
	beq _08023334
	movs r5, 0x3F
	ands r5, r0
	str r5, [sp, 0x4]
	b _08023346
	.align 2, 0
_080232A4: .4byte gBattleStruct
_080232A8: .4byte sBattler_AI
_080232AC:
	ldr r4, _080232C0 @ =gActiveBattler
	strb r2, [r4]
	movs r0, 0
	movs r1, 0x1
	bl EmitSpriteInvisibility
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	b _0802379E
	.align 2, 0
_080232C0: .4byte gActiveBattler
_080232C4:
	ldr r4, _080232E8 @ =gActiveBattler
	strb r2, [r4]
	movs r0, 0
	movs r1, 0
	bl EmitSpriteInvisibility
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r5
	ldr r0, [r1]
	ldr r2, _080232EC @ =0xfffbff3f
	ands r0, r2
	str r0, [r1]
	b _0802379E
	.align 2, 0
_080232E8: .4byte gActiveBattler
_080232EC: .4byte 0xfffbff3f
_080232F0:
	strb r2, [r7]
	ldr r0, [r5]
	orrs r0, r6
	str r0, [r5]
	ldr r0, _08023324 @ =gBattleScripting
	strb r4, [r0, 0x14]
	bl MoveValuesCleanUp
	ldr r2, _08023328 @ =gUnknown_81D65A8
	mov r0, r8
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	bl BattleScriptPush
	ldr r1, _0802332C @ =gUnknown_2023D74
	ldr r0, _08023330 @ =gUnknown_81D96A8
	bl _08023BFC
	.align 2, 0
_08023324: .4byte gBattleScripting
_08023328: .4byte gUnknown_81D65A8
_0802332C: .4byte gUnknown_2023D74
_08023330: .4byte gUnknown_81D96A8
_08023334:
	ldr r2, _0802334C @ =gBattleMoves
	ldr r0, _08023350 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	str r0, [sp, 0x4]
_08023346:
	ldr r1, _08023354 @ =gBattleScripting
	mov r12, r1
	b _08023362
	.align 2, 0
_0802334C: .4byte gBattleMoves
_08023350: .4byte gCurrentMove
_08023354: .4byte gBattleScripting
_08023358:
	mov r2, r10
	cmp r2, 0
	beq _08023362
	bl _08023BE8
_08023362:
	mov r3, r12
	ldrb r0, [r3, 0x14]
	cmp r0, 0x11
	bls _0802336E
	bl _08023BB4
_0802336E:
	lsls r0, 2
	ldr r1, _08023378 @ =_0802337C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08023378: .4byte _0802337C
	.align 2, 0
_0802337C:
	.4byte _080233C4
	.4byte _080234A0
	.4byte _0802355C
	.4byte _08023580
	.4byte _08023598
	.4byte _080235C0
	.4byte _080235E4
	.4byte _0802368C
	.4byte _08023702
	.4byte _08023738
	.4byte _080237D8
	.4byte _080236CC
	.4byte _080236EC
	.4byte _0802381C
	.4byte _08023860
	.4byte _08023A40
	.4byte _08023B28
	.4byte _08023BB4
_080233C4:
	ldr r6, _0802347C @ =gBattleMons
	ldr r5, _08023480 @ =gBattlerTarget
	ldrb r3, [r5]
	movs r7, 0x58
	adds r2, r3, 0
	muls r2, r7
	adds r0, r6, 0
	adds r0, 0x50
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 16
	ands r0, r1
	cmp r0, 0
	bne _080233E4
	b _080237C8
_080233E4:
	adds r0, r2, r6
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _080233EE
	b _080237C8
_080233EE:
	ldr r0, _08023484 @ =sBattler_AI
	ldrb r1, [r0]
	cmp r1, r3
	bne _080233F8
	b _080237C8
_080233F8:
	adds r0, r1, 0
	bl GetBankSide
	adds r4, r0, 0
	ldrb r0, [r5]
	bl GetBankSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _08023410
	b _080237C8
_08023410:
	ldr r0, _08023488 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0802341E
	b _080237C8
_0802341E:
	ldr r2, _0802348C @ =gUnknown_2023ECC
	ldrb r3, [r5]
	lsls r0, r3, 2
	adds r0, r3
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _08023442
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _08023442
	b _080237C8
_08023442:
	ldr r2, _08023490 @ =gBattleMoves
	ldr r0, _08023494 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _08023458
	b _080237C8
_08023458:
	adds r0, r3, 0
	muls r0, r7
	adds r1, r0, r6
	ldrb r2, [r1, 0x19]
	movs r0, 0x19
	ldrsb r0, [r1, r0]
	cmp r0, 0xB
	ble _0802346A
	b _080237C8
_0802346A:
	adds r0, r2, 0x1
	strb r0, [r1, 0x19]
	bl BattleScriptPushCursor
	ldr r1, _08023498 @ =gUnknown_2023D74
	ldr r0, _0802349C @ =gUnknown_81D8C48
	str r0, [r1]
	b _080236FC
	.align 2, 0
_0802347C: .4byte gBattleMons
_08023480: .4byte gBattlerTarget
_08023484: .4byte sBattler_AI
_08023488: .4byte gMoveResultFlags
_0802348C: .4byte gUnknown_2023ECC
_08023490: .4byte gBattleMoves
_08023494: .4byte gCurrentMove
_08023498: .4byte gUnknown_2023D74
_0802349C: .4byte gUnknown_81D8C48
_080234A0:
	ldr r4, _0802353C @ =gBattleMons
	ldr r6, _08023540 @ =gBattlerTarget
	ldrb r2, [r6]
	movs r5, 0x58
	mov r12, r5
	mov r1, r12
	muls r1, r2
	adds r7, r4, 0
	adds r7, 0x4C
	adds r5, r1, r7
	ldr r3, [r5]
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	bne _080234C0
	b _080237C8
_080234C0:
	adds r0, r1, r4
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _080234CA
	b _080237C8
_080234CA:
	ldr r0, _08023544 @ =sBattler_AI
	ldrb r0, [r0]
	cmp r0, r2
	bne _080234D4
	b _080237C8
_080234D4:
	ldr r0, _08023548 @ =gUnknown_2023ECC
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 2
	adds r0, 0xC
	adds r1, r0
	ldr r0, [r1]
	cmp r0, 0
	bne _080234E8
	b _080237C8
_080234E8:
	ldr r0, _0802354C @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _080234F6
	b _080237C8
_080234F6:
	ldr r0, [sp, 0x4]
	cmp r0, 0xA
	beq _080234FE
	b _080237C8
_080234FE:
	movs r0, 0x21
	negs r0, r0
	ands r3, r0
	str r3, [r5]
	ldr r4, _08023550 @ =gActiveBattler
	ldrb r0, [r6]
	strb r0, [r4]
	ldrb r0, [r6]
	mov r1, r12
	muls r1, r0
	adds r0, r1, 0
	adds r0, r7
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl EmitSetMonData
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	bl BattleScriptPushCursor
	ldr r1, _08023554 @ =gUnknown_2023D74
	ldr r0, _08023558 @ =gUnknown_81D9098
	str r0, [r1]
	movs r2, 0x1
	mov r10, r2
	b _080237C8
	.align 2, 0
_0802353C: .4byte gBattleMons
_08023540: .4byte gBattlerTarget
_08023544: .4byte sBattler_AI
_08023548: .4byte gUnknown_2023ECC
_0802354C: .4byte gMoveResultFlags
_08023550: .4byte gActiveBattler
_08023554: .4byte gUnknown_2023D74
_08023558: .4byte gUnknown_81D9098
_0802355C:
	ldr r0, _0802357C @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x7
	movs r2, 0
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	cmp r0, 0
	bne _08023576
	b _080237C8
_08023576:
	movs r3, 0x1
	mov r10, r3
	b _080237C8
	.align 2, 0
_0802357C: .4byte gBattlerTarget
_08023580:
	ldr r0, _08023594 @ =gBattlerTarget
	ldrb r1, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x4
	movs r2, 0
	movs r3, 0
	bl sub_8019F18
	b _080236F6
	.align 2, 0
_08023594: .4byte gBattlerTarget
_08023598:
	movs r0, 0
	str r0, [sp]
	movs r0, 0x5
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	cmp r0, 0
	bne _080235B0
	b _080237C8
_080235B0:
	movs r5, 0x1
	mov r10, r5
	ldr r0, _080235BC @ =gBattleScripting
	mov r12, r0
	b _08023BB4
	.align 2, 0
_080235BC: .4byte gBattleScripting
_080235C0:
	ldr r0, _080235E0 @ =sBattler_AI
	ldrb r1, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x8
	movs r2, 0
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	cmp r0, 0
	bne _080235DA
	b _080237C8
_080235DA:
	movs r1, 0x1
	mov r10, r1
	b _080237C8
	.align 2, 0
_080235E0: .4byte sBattler_AI
_080235E4:
	ldr r0, _08023674 @ =gUnknown_2023DD0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 18
	ands r0, r1
	cmp r0, 0
	beq _08023628
	ldr r2, [sp, 0x8]
	cmp r2, 0x1D
	bne _08023628
	ldr r0, _08023678 @ =gUnknown_2023D4C
	ldrh r2, [r0]
	adds r3, r0, 0
	cmp r2, 0xA5
	beq _08023628
	ldr r4, [sp, 0xC]
	ldrh r1, [r4]
	cmp r1, 0
	beq _08023610
	ldr r0, _0802367C @ =0x0000ffff
	cmp r1, r0
	bne _08023628
_08023610:
	cmp r2, 0xE2
	bne _08023622
	ldr r0, _08023680 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _08023622
	b _08023AFA
_08023622:
	ldrh r0, [r3]
	ldr r1, [sp, 0xC]
	strh r0, [r1]
_08023628:
	movs r4, 0
	ldr r2, _08023684 @ =gBattleMons
	ldr r3, _08023688 @ =sBattler_AI
	ldrb r1, [r3]
	movs r0, 0x58
	muls r0, r1
	adds r2, 0xC
	adds r0, r2
	ldrh r0, [r0]
	ldr r5, [sp, 0xC]
	ldrh r1, [r5]
	mov r9, r3
	cmp r0, r1
	beq _08023660
	mov r6, r9
	movs r3, 0x58
	adds r5, r1, 0
_0802364A:
	adds r4, 0x1
	cmp r4, 0x3
	bgt _08023660
	lsls r0, r4, 1
	ldrb r1, [r6]
	muls r1, r3
	adds r0, r1
	adds r0, r2
	ldrh r0, [r0]
	cmp r0, r5
	bne _0802364A
_08023660:
	cmp r4, 0x4
	bne _0802366A
	movs r0, 0
	ldr r1, [sp, 0xC]
	strh r0, [r1]
_0802366A:
	mov r2, r12
	ldrb r0, [r2, 0x14]
	adds r0, 0x1
	strb r0, [r2, 0x14]
	b _08023BB4
	.align 2, 0
_08023674: .4byte gUnknown_2023DD0
_08023678: .4byte gUnknown_2023D4C
_0802367C: .4byte 0x0000ffff
_08023680: .4byte gMoveResultFlags
_08023684: .4byte gBattleMons
_08023688: .4byte sBattler_AI
_0802368C:
	movs r4, 0
	ldr r0, _080236C0 @ =gUnknown_2023BCC
	ldrb r3, [r0]
	cmp r4, r3
	blt _08023698
	b _08023846
_08023698:
	ldr r7, _080236C4 @ =gBattleStruct
	movs r6, 0
	movs r3, 0xD0
	adds r5, r0, 0
	ldr r2, _080236C8 @ =gBattleMons
_080236A2:
	ldr r0, [r7]
	adds r0, r3
	ldrh r1, [r0]
	cmp r1, 0
	beq _080236B0
	strh r1, [r2, 0x2E]
	strh r6, [r0]
_080236B0:
	adds r3, 0x2
	adds r2, 0x58
	adds r4, 0x1
	ldrb r0, [r5]
	cmp r4, r0
	blt _080236A2
	b _08023846
	.align 2, 0
_080236C0: .4byte gUnknown_2023BCC
_080236C4: .4byte gBattleStruct
_080236C8: .4byte gBattleMons
_080236CC:
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl sub_801BC68
	lsls r0, 24
	cmp r0, 0
	beq _080237C8
	movs r2, 0x1
	mov r10, r2
	ldr r3, _080236E8 @ =gBattleScripting
	mov r12, r3
	b _08023BB4
	.align 2, 0
_080236E8: .4byte gBattleScripting
_080236EC:
	movs r0, 0x4
	movs r1, 0
	movs r2, 0
	bl sub_801BC68
_080236F6:
	lsls r0, 24
	cmp r0, 0
	beq _080237C8
_080236FC:
	movs r4, 0x1
	mov r10, r4
	b _080237C8
_08023702:
	ldr r1, _08023728 @ =gStatuses3
	ldr r0, _0802372C @ =sBattler_AI
	ldrb r2, [r0]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08023730 @ =0x000400c0
	ands r0, r1
	cmp r0, 0
	bne _08023718
	b _08023AFA
_08023718:
	ldr r0, _08023734 @ =gUnknown_2023DD0
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08023726
	b _080232AC
_08023726:
	b _08023AFA
	.align 2, 0
_08023728: .4byte gStatuses3
_0802372C: .4byte sBattler_AI
_08023730: .4byte 0x000400c0
_08023734: .4byte gUnknown_2023DD0
_08023738:
	ldr r0, _080237A8 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _08023764
	ldr r1, _080237AC @ =gStatuses3
	ldr r0, _080237B0 @ =sBattler_AI
	ldrb r2, [r0]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080237B4 @ =0x000400c0
	ands r0, r1
	cmp r0, 0
	beq _08023764
	adds r0, r2, 0
	bl WasUnableToUseMove
	lsls r0, 24
	cmp r0, 0
	beq _080237C8
_08023764:
	ldr r4, _080237B8 @ =gActiveBattler
	ldr r5, _080237B0 @ =sBattler_AI
	ldrb r0, [r5]
	strb r0, [r4]
	movs r0, 0
	movs r1, 0
	bl EmitSpriteInvisibility
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	ldr r0, _080237AC @ =gStatuses3
	ldrb r2, [r5]
	lsls r2, 2
	adds r2, r0
	ldr r0, [r2]
	ldr r1, _080237BC @ =0xfffbff3f
	ands r0, r1
	str r0, [r2]
	ldr r2, _080237C0 @ =gUnknown_2023ECC
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_0802379E:
	ldr r1, _080237C4 @ =gBattleScripting
	ldrb r0, [r1, 0x14]
	adds r0, 0x1
	strb r0, [r1, 0x14]
	b _08023BFE
	.align 2, 0
_080237A8: .4byte gMoveResultFlags
_080237AC: .4byte gStatuses3
_080237B0: .4byte sBattler_AI
_080237B4: .4byte 0x000400c0
_080237B8: .4byte gActiveBattler
_080237BC: .4byte 0xfffbff3f
_080237C0: .4byte gUnknown_2023ECC
_080237C4: .4byte gBattleScripting
_080237C8:
	ldr r1, _080237D4 @ =gBattleScripting
	ldrb r0, [r1, 0x14]
	adds r0, 0x1
	strb r0, [r1, 0x14]
	mov r12, r1
	b _08023BB4
	.align 2, 0
_080237D4: .4byte gBattleScripting
_080237D8:
	ldr r0, _08023808 @ =gUnknown_2023ECC
	ldr r6, _0802380C @ =gBattlerTarget
	ldrb r2, [r6]
	lsls r3, r2, 2
	adds r1, r3, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 29
	cmp r0, 0
	blt _08023846
	ldr r0, _08023810 @ =gUnknown_2023BCC
	ldrb r0, [r0]
	cmp r2, r0
	bcs _08023846
	ldr r5, _08023814 @ =gStatuses3
	adds r0, r3, r5
	ldr r0, [r0]
	ldr r1, _08023818 @ =0x000400c0
	ands r0, r1
	cmp r0, 0
	bne _08023806
	b _080232C4
_08023806:
	b _08023846
	.align 2, 0
_08023808: .4byte gUnknown_2023ECC
_0802380C: .4byte gBattlerTarget
_08023810: .4byte gUnknown_2023BCC
_08023814: .4byte gStatuses3
_08023818: .4byte 0x000400c0
_0802381C:
	movs r4, 0
	ldr r0, _08023850 @ =gUnknown_2023BCC
	ldrb r2, [r0]
	cmp r4, r2
	bge _08023846
	ldr r2, _08023854 @ =gDisableStructs
	ldr r5, _08023858 @ =0xfeffffff
	adds r3, r0, 0
	ldr r1, _0802385C @ =gUnknown_2023C34
_0802382E:
	ldrb r0, [r2, 0xA]
	cmp r0, 0
	bne _0802383A
	ldr r0, [r1]
	ands r0, r5
	str r0, [r1]
_0802383A:
	adds r2, 0x1C
	adds r1, 0x58
	adds r4, 0x1
	ldrb r0, [r3]
	cmp r4, r0
	blt _0802382E
_08023846:
	mov r1, r12
	ldrb r0, [r1, 0x14]
	adds r0, 0x1
	strb r0, [r1, 0x14]
	b _08023BB4
	.align 2, 0
_08023850: .4byte gUnknown_2023BCC
_08023854: .4byte gDisableStructs
_08023858: .4byte 0xfeffffff
_0802385C: .4byte gUnknown_2023C34
_08023860:
	ldr r1, _08023914 @ =gUnknown_2023DD0
	ldr r3, [r1]
	movs r0, 0x80
	lsls r0, 5
	ands r0, r3
	ldr r2, _08023918 @ =sBattler_AI
	mov r9, r2
	adds r5, r1, 0
	cmp r0, 0
	beq _0802388A
	ldr r0, _0802391C @ =gActiveBattler
	ldrb r2, [r2]
	strb r2, [r0]
	ldr r1, _08023920 @ =gBattlerTarget
	ldrb r0, [r1]
	mov r4, r9
	strb r0, [r4]
	strb r2, [r1]
	ldr r0, _08023924 @ =0xffffefff
	ands r3, r0
	str r3, [r5]
_0802388A:
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 3
	ands r0, r1
	cmp r0, 0
	beq _080238A6
	ldr r0, _08023928 @ =gUnknown_2023D90
	mov r2, r9
	ldrb r1, [r2]
	lsls r1, 1
	adds r1, r0
	ldr r0, _0802392C @ =gUnknown_2023D4C
	ldrh r0, [r0]
	strh r0, [r1]
_080238A6:
	ldr r0, _08023930 @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldr r2, _08023934 @ =gBitTable
	mov r3, r9
	ldrb r4, [r3]
	lsls r0, r4, 2
	adds r0, r2
	ldr r3, [r0]
	ands r1, r3
	adds r6, r2, 0
	cmp r1, 0
	beq _080238C0
	b _08023A2C
_080238C0:
	ldr r0, _08023938 @ =gBattleStruct
	ldr r1, [r0]
	adds r1, 0x91
	ldrb r1, [r1]
	ands r1, r3
	adds r7, r0, 0
	cmp r1, 0
	beq _080238D2
	b _08023A2C
_080238D2:
	ldr r0, _0802393C @ =gBattleMoves
	ldr r2, [sp, 0x18]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r1, [r1]
	mov r8, r0
	cmp r1, 0x7F
	bne _080238E8
	b _08023A2C
_080238E8:
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 18
	ands r0, r1
	cmp r0, 0
	beq _0802394C
	ldr r0, _08023940 @ =gLastUsedMove
	lsls r1, r4, 1
	adds r1, r0
	ldr r0, _0802392C @ =gUnknown_2023D4C
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, _08023944 @ =gUnknown_2023DB0
	mov r3, r9
	ldrb r1, [r3]
	lsls r1, 1
	adds r1, r0
	ldr r0, _08023948 @ =gCurrentMove
	ldrh r0, [r0]
	strh r0, [r1]
	b _08023966
	.align 2, 0
_08023914: .4byte gUnknown_2023DD0
_08023918: .4byte sBattler_AI
_0802391C: .4byte gActiveBattler
_08023920: .4byte gBattlerTarget
_08023924: .4byte 0xffffefff
_08023928: .4byte gUnknown_2023D90
_0802392C: .4byte gUnknown_2023D4C
_08023930: .4byte gAbsentBattlerFlags
_08023934: .4byte gBitTable
_08023938: .4byte gBattleStruct
_0802393C: .4byte gBattleMoves
_08023940: .4byte gLastUsedMove
_08023944: .4byte gUnknown_2023DB0
_08023948: .4byte gCurrentMove
_0802394C:
	ldr r1, _080239B4 @ =gLastUsedMove
	lsls r0, r4, 1
	adds r0, r1
	ldr r1, _080239B8 @ =0x0000ffff
	strh r1, [r0]
	ldr r1, _080239BC @ =gUnknown_2023DB0
	mov r4, r9
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	movs r1, 0x1
	negs r1, r1
	strh r1, [r0]
_08023966:
	ldr r2, _080239C0 @ =gBattlerTarget
	ldrb r3, [r2]
	lsls r0, r3, 2
	adds r0, r6
	ldr r0, [r0]
	lsls r0, 28
	ldr r1, [r5]
	ands r1, r0
	cmp r1, 0
	bne _08023984
	ldr r0, _080239C4 @ =gUnknown_2023DC0
	adds r0, r3, r0
	mov r3, r9
	ldrb r1, [r3]
	strb r1, [r0]
_08023984:
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 18
	ands r0, r1
	cmp r0, 0
	beq _08023A20
	ldr r0, _080239C8 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _08023A20
	ldr r0, _080239CC @ =gUnknown_2023D4C
	ldrh r3, [r0]
	ldr r0, _080239B8 @ =0x0000ffff
	cmp r3, r0
	bne _080239D4
	ldr r1, _080239D0 @ =gUnknown_2023DA0
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r1
	strh r3, [r0]
	b _08023A2C
	.align 2, 0
_080239B4: .4byte gLastUsedMove
_080239B8: .4byte 0x0000ffff
_080239BC: .4byte gUnknown_2023DB0
_080239C0: .4byte gBattlerTarget
_080239C4: .4byte gUnknown_2023DC0
_080239C8: .4byte gMoveResultFlags
_080239CC: .4byte gUnknown_2023D4C
_080239D0: .4byte gUnknown_2023DA0
_080239D4:
	ldr r0, _080239F8 @ =gUnknown_2023DA0
	ldrb r1, [r2]
	lsls r1, 1
	adds r1, r0
	ldr r4, _080239FC @ =gCurrentMove
	ldrh r0, [r4]
	strh r0, [r1]
	ldr r0, [r7]
	ldrb r3, [r0, 0x13]
	cmp r3, 0
	beq _08023A04
	ldr r0, _08023A00 @ =gUnknown_2023DA8
	ldrb r1, [r2]
	lsls r1, 1
	adds r1, r0
	movs r0, 0x3F
	ands r0, r3
	b _08023A2A
	.align 2, 0
_080239F8: .4byte gUnknown_2023DA0
_080239FC: .4byte gCurrentMove
_08023A00: .4byte gUnknown_2023DA8
_08023A04:
	ldr r0, _08023A1C @ =gUnknown_2023DA8
	ldrb r2, [r2]
	lsls r2, 1
	adds r2, r0
	ldrh r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	add r0, r8
	ldrb r0, [r0, 0x2]
	strh r0, [r2]
	b _08023A2C
	.align 2, 0
_08023A1C: .4byte gUnknown_2023DA8
_08023A20:
	ldr r0, _08023A38 @ =gUnknown_2023DA0
	ldrb r1, [r2]
	lsls r1, 1
	adds r1, r0
	ldr r0, _08023A3C @ =0x0000ffff
_08023A2A:
	strh r0, [r1]
_08023A2C:
	mov r4, r12
	ldrb r0, [r4, 0x14]
	adds r0, 0x1
	strb r0, [r4, 0x14]
	b _08023BB4
	.align 2, 0
_08023A38: .4byte gUnknown_2023DA0
_08023A3C: .4byte 0x0000ffff
_08023A40:
	ldr r0, _08023B04 @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldr r7, _08023B08 @ =gBitTable
	ldr r2, _08023B0C @ =sBattler_AI
	ldrb r3, [r2]
	lsls r0, r3, 2
	adds r0, r7
	ldr r4, [r0]
	ands r1, r4
	mov r9, r2
	cmp r1, 0
	bne _08023AFA
	ldr r6, _08023B10 @ =gBattleStruct
	ldr r5, [r6]
	adds r0, r5, 0
	adds r0, 0x91
	ldrb r0, [r0]
	ands r0, r4
	cmp r0, 0
	bne _08023AFA
	ldr r1, _08023B14 @ =gBattleMoves
	ldr r2, [sp, 0x18]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08023AFA
	ldr r0, _08023B18 @ =gUnknown_2023DD0
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 18
	ands r0, r1
	cmp r0, 0
	beq _08023AFA
	ldr r4, _08023B1C @ =gBattlerTarget
	ldrb r0, [r4]
	cmp r3, r0
	beq _08023AFA
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r0, r7
	ldr r0, [r0]
	lsls r0, 28
	ands r1, r0
	cmp r1, 0
	bne _08023AFA
	ldr r0, _08023B20 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _08023AFA
	lsls r1, r2, 1
	adds r1, r5
	adds r1, 0x98
	ldr r3, _08023B24 @ =gUnknown_2023D4C
	ldrh r0, [r3]
	strb r0, [r1]
	ldrb r1, [r4]
	ldr r0, [r6]
	lsls r1, 1
	adds r1, r0
	adds r1, 0x99
	ldrh r0, [r3]
	lsrs r0, 8
	strb r0, [r1]
	ldrb r0, [r4]
	mov r2, r9
	ldrb r1, [r2]
	ldr r2, [r6]
	lsls r0, 3
	lsls r1, 1
	adds r0, r1
	adds r0, r2
	adds r0, 0xE0
	ldrh r1, [r3]
	strb r1, [r0]
	ldrb r1, [r4]
	mov r4, r9
	ldrb r0, [r4]
	ldr r2, [r6]
	lsls r1, 3
	lsls r0, 1
	adds r1, r0
	adds r1, r2
	adds r1, 0xE1
	ldrh r0, [r3]
	lsrs r0, 8
	strb r0, [r1]
_08023AFA:
	mov r5, r12
	ldrb r0, [r5, 0x14]
	adds r0, 0x1
	strb r0, [r5, 0x14]
	b _08023BB4
	.align 2, 0
_08023B04: .4byte gAbsentBattlerFlags
_08023B08: .4byte gBitTable
_08023B0C: .4byte sBattler_AI
_08023B10: .4byte gBattleStruct
_08023B14: .4byte gBattleMoves
_08023B18: .4byte gUnknown_2023DD0
_08023B1C: .4byte gBattlerTarget
_08023B20: .4byte gMoveResultFlags
_08023B24: .4byte gUnknown_2023D4C
_08023B28:
	ldr r5, _08023C10 @ =gUnknown_2023DD0
	ldr r2, [r5]
	movs r0, 0x80
	lsls r0, 12
	ands r0, r2
	cmp r0, 0
	bne _08023BAC
	ldr r0, _08023C14 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08023BAC
	ldr r1, _08023C18 @ =gUnknown_2023E8C
	ldr r0, _08023C1C @ =sBattler_AI
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	cmp r0, 0
	blt _08023BAC
	ldr r0, _08023C20 @ =gBattleMoves
	mov r9, r0
	ldr r1, _08023C24 @ =gCurrentMove
	mov r8, r1
	ldrh r0, [r1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	add r1, r9
	ldrb r0, [r1, 0x6]
	cmp r0, 0x8
	bne _08023BAC
	movs r6, 0x80
	lsls r6, 2
	adds r4, r6, 0
	ands r4, r2
	cmp r4, 0
	bne _08023BAC
	ldr r7, _08023C28 @ =gBattlerTarget
	ldrb r0, [r7]
	bl GetBankIdentity
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08023C2C @ =gBattleMons
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08023BA2
	bl _080232F0
_08023BA2:
	ldr r0, [r5]
	orrs r0, r6
	str r0, [r5]
	ldr r2, _08023C30 @ =gBattleScripting
	mov r12, r2
_08023BAC:
	mov r3, r12
	ldrb r0, [r3, 0x14]
	adds r0, 0x1
	strb r0, [r3, 0x14]
_08023BB4:
	ldr r4, [sp, 0x10]
	cmp r4, 0x1
	bne _08023BC6
	mov r5, r10
	cmp r5, 0
	bne _08023BC6
	movs r0, 0x11
	mov r1, r12
	strb r0, [r1, 0x14]
_08023BC6:
	ldr r2, [sp, 0x10]
	cmp r2, 0x2
	bne _08023BDC
	ldr r4, [sp, 0x14]
	mov r3, r12
	ldrb r3, [r3, 0x14]
	cmp r4, r3
	bne _08023BDC
	movs r0, 0x11
	mov r4, r12
	strb r0, [r4, 0x14]
_08023BDC:
	mov r5, r12
	ldrb r0, [r5, 0x14]
	cmp r0, 0x11
	beq _08023BE8
	bl _08023358
_08023BE8:
	mov r1, r12
	ldrb r0, [r1, 0x14]
	cmp r0, 0x11
	bne _08023BFE
	mov r2, r10
	cmp r2, 0
	bne _08023BFE
	ldr r1, _08023C34 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x3
_08023BFC:
	str r0, [r1]
_08023BFE:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023C10: .4byte gUnknown_2023DD0
_08023C14: .4byte gBattleTypeFlags
_08023C18: .4byte gUnknown_2023E8C
_08023C1C: .4byte sBattler_AI
_08023C20: .4byte gBattleMoves
_08023C24: .4byte gCurrentMove
_08023C28: .4byte gBattlerTarget
_08023C2C: .4byte gBattleMons
_08023C30: .4byte gBattleScripting
_08023C34: .4byte gUnknown_2023D74
	thumb_func_end atk49_moveend

	thumb_func_start atk4A_typecalc2
atk4A_typecalc2: @ 8023C38
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r4, 0
	movs r5, 0
	ldr r2, _08023C9C @ =gBattleMoves
	ldr r0, _08023CA0 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	mov r8, r0
	ldr r2, _08023CA4 @ =gBattleMons
	ldr r3, _08023CA8 @ =gBattlerTarget
	ldrb r1, [r3]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r0, [r0]
	mov r12, r2
	adds r7, r3, 0
	cmp r0, 0x1A
	bne _08023CCC
	mov r1, r8
	cmp r1, 0x4
	bne _08023CCC
	ldr r3, _08023CAC @ =gUnknown_2023D6A
	strb r0, [r3]
	ldr r2, _08023CB0 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x9
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08023CB4 @ =gUnknown_2023DA0
	ldrb r0, [r7]
	lsls r0, 1
	adds r0, r1
	strh r4, [r0]
	ldr r0, _08023CB8 @ =gUnknown_2023E82
	mov r2, r8
	strb r2, [r0, 0x6]
	ldrb r0, [r7]
	ldrb r1, [r3]
	bl sub_80C71D0
	b _08023DAE
	.align 2, 0
_08023C9C: .4byte gBattleMoves
_08023CA0: .4byte gCurrentMove
_08023CA4: .4byte gBattleMons
_08023CA8: .4byte gBattlerTarget
_08023CAC: .4byte gUnknown_2023D6A
_08023CB0: .4byte gMoveResultFlags
_08023CB4: .4byte gUnknown_2023DA0
_08023CB8: .4byte gUnknown_2023E82
_08023CBC:
	ldr r0, _08023CC8 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0]
	b _08023DAE
	.align 2, 0
_08023CC8: .4byte gMoveResultFlags
_08023CCC:
	ldr r1, _08023CD8 @ =gUnknown_824F050
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r6, r1, 0
	b _08023D8E
	.align 2, 0
_08023CD8: .4byte gUnknown_824F050
_08023CDC:
	adds r0, r5, r6
	ldrb r0, [r0]
	cmp r0, r8
	bne _08023D88
	adds r2, r5, 0x1
	adds r3, r2, r6
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	add r0, r12
	adds r0, 0x21
	ldrb r1, [r3]
	adds r3, r2, 0
	ldrb r0, [r0]
	cmp r1, r0
	bne _08023D1A
	adds r0, r5, 0x2
	adds r0, r6
	ldrb r1, [r0]
	cmp r1, 0
	beq _08023CBC
	cmp r1, 0x5
	bne _08023D0E
	movs r0, 0x4
	orrs r4, r0
_08023D0E:
	cmp r1, 0x14
	bne _08023D1A
	movs r0, 0x2
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08023D1A:
	adds r2, r3, r6
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	add r0, r12
	adds r1, r0, 0
	adds r1, 0x22
	ldrb r2, [r2]
	ldrb r1, [r1]
	cmp r2, r1
	bne _08023D88
	adds r0, 0x21
	ldrb r1, [r0]
	cmp r1, r2
	beq _08023D42
	adds r0, r5, 0x2
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0
	beq _08023CBC
_08023D42:
	cmp r1, r2
	beq _08023D58
	adds r0, r5, 0x2
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x5
	bne _08023D58
	movs r0, 0x4
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08023D58:
	adds r2, r3, r6
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	add r0, r12
	adds r1, r0, 0
	adds r1, 0x22
	ldrb r2, [r2]
	ldrb r1, [r1]
	cmp r2, r1
	bne _08023D88
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, r2
	beq _08023D88
	adds r0, r5, 0x2
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x14
	bne _08023D88
	movs r0, 0x2
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08023D88:
	adds r5, 0x3
	adds r0, r5, r6
	ldrb r0, [r0]
_08023D8E:
	cmp r0, 0xFF
	beq _08023DAE
	cmp r0, 0xFE
	bne _08023CDC
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	mov r1, r12
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 22
	ands r0, r1
	cmp r0, 0
	beq _08023D88
_08023DAE:
	ldr r2, _08023E5C @ =gBattleMons
	ldr r0, _08023E60 @ =gBattlerTarget
	mov r8, r0
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r6, [r0]
	cmp r6, 0x19
	bne _08023E2A
	movs r5, 0x29
	ands r5, r4
	cmp r5, 0
	bne _08023E2A
	ldr r0, _08023E64 @ =sBattler_AI
	ldrb r0, [r0]
	ldr r7, _08023E68 @ =gCurrentMove
	ldrh r1, [r7]
	bl AttacksThisTurn
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bne _08023E2A
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08023DF0
	movs r0, 0x6
	ands r4, r0
	cmp r4, 0x6
	bne _08023E2A
_08023DF0:
	ldr r2, _08023E6C @ =gBattleMoves
	ldrh r1, [r7]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _08023E2A
	ldr r3, _08023E70 @ =gUnknown_2023D6A
	strb r6, [r3]
	ldr r2, _08023E74 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08023E78 @ =gUnknown_2023DA0
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r1
	strh r5, [r0]
	ldr r1, _08023E7C @ =gUnknown_2023E82
	movs r0, 0x3
	strb r0, [r1, 0x6]
	ldrb r0, [r2]
	ldrb r1, [r3]
	bl sub_80C71D0
_08023E2A:
	ldr r0, _08023E74 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08023E48
	ldr r2, _08023E80 @ =gUnknown_2023E8C
	ldr r0, _08023E64 @ =sBattler_AI
	ldrb r1, [r0]
	lsls r1, 4
	adds r1, r2
	ldrb r0, [r1, 0x1]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1, 0x1]
_08023E48:
	ldr r1, _08023E84 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023E5C: .4byte gBattleMons
_08023E60: .4byte gBattlerTarget
_08023E64: .4byte sBattler_AI
_08023E68: .4byte gCurrentMove
_08023E6C: .4byte gBattleMoves
_08023E70: .4byte gUnknown_2023D6A
_08023E74: .4byte gMoveResultFlags
_08023E78: .4byte gUnknown_2023DA0
_08023E7C: .4byte gUnknown_2023E82
_08023E80: .4byte gUnknown_2023E8C
_08023E84: .4byte gUnknown_2023D74
	thumb_func_end atk4A_typecalc2

	thumb_func_start atk4B_returnatktoball
atk4B_returnatktoball: @ 8023E88
	push {r4,lr}
	ldr r4, _08023EC4 @ =gActiveBattler
	ldr r0, _08023EC8 @ =sBattler_AI
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r2, _08023ECC @ =gUnknown_2023DD0
	ldr r1, _08023ED0 @ =gBitTable
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	ands r0, r1
	cmp r0, 0
	bne _08023EB6
	movs r0, 0
	movs r1, 0
	bl EmitReturnMonToBall
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_08023EB6:
	ldr r1, _08023ED4 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023EC4: .4byte gActiveBattler
_08023EC8: .4byte sBattler_AI
_08023ECC: .4byte gUnknown_2023DD0
_08023ED0: .4byte gBitTable
_08023ED4: .4byte gUnknown_2023D74
	thumb_func_end atk4B_returnatktoball

	thumb_func_start atk4C_getswitchedmondata
atk4C_getswitchedmondata: @ 8023ED8
	push {r4,r5,lr}
	ldr r0, _08023F30 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	bne _08023F28
	ldr r5, _08023F34 @ =gUnknown_2023D74
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r4, _08023F38 @ =gActiveBattler
	strb r0, [r4]
	ldr r3, _08023F3C @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r2, r0, 1
	adds r2, r3
	ldr r1, _08023F40 @ =gBattleStruct
	ldr r1, [r1]
	adds r0, r1
	adds r0, 0x5C
	ldrb r0, [r0]
	strh r0, [r2]
	ldr r1, _08023F44 @ =gBitTable
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0]
	movs r0, 0
	movs r1, 0
	bl EmitGetMonData
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
_08023F28:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023F30: .4byte gUnknown_2023BC8
_08023F34: .4byte gUnknown_2023D74
_08023F38: .4byte gActiveBattler
_08023F3C: .4byte gBattlerPartyIndexes
_08023F40: .4byte gBattleStruct
_08023F44: .4byte gBitTable
	thumb_func_end atk4C_getswitchedmondata

	thumb_func_start sub_8023F48
sub_8023F48: @ 8023F48
	push {r4-r7,lr}
	sub sp, 0x58
	ldr r0, _080240A0 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	beq _08023F56
	b _08024098
_08023F56:
	ldr r0, _080240A4 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r4, _080240A8 @ =gActiveBattler
	strb r0, [r4]
	ldr r6, _080240AC @ =gBattleMons
	ldrb r0, [r4]
	movs r5, 0x58
	adds r1, r0, 0
	muls r1, r5
	adds r1, r6
	mov r0, sp
	movs r2, 0x58
	bl memcpy
	ldrb r0, [r4]
	muls r0, r5
	adds r3, r0, r6
	movs r2, 0
	ldr r5, _080240B0 @ =gUnknown_20233C4
	adds r7, r4, 0
_08023F84:
	adds r0, r3, r2
	ldrb r1, [r4]
	lsls r1, 9
	adds r1, 0x4
	adds r1, r2, r1
	adds r1, r5
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x57
	bls _08023F84
	ldr r4, _080240AC @ =gBattleMons
	ldrb r0, [r7]
	movs r6, 0x58
	adds r2, r0, 0
	muls r2, r6
	adds r2, r4
	ldr r3, _080240B4 @ =gBaseStats
	ldrh r1, [r2]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x6]
	adds r2, 0x21
	strb r0, [r2]
	ldrb r0, [r7]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r4
	ldrh r2, [r1]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x7]
	adds r1, 0x22
	strb r0, [r1]
	ldrb r0, [r7]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r4
	ldrh r0, [r1]
	ldrb r1, [r1, 0x17]
	lsrs r1, 7
	bl GetAbilityBySpecies
	ldrb r1, [r7]
	muls r1, r6
	adds r1, r4
	adds r1, 0x20
	strb r0, [r1]
	ldrb r0, [r7]
	bl GetBankSide
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080240B8 @ =gUnknown_2023F20
	adds r0, 0x29
	adds r0, r2, r0
	ldrb r1, [r0]
	ldr r3, _080240BC @ =gBitTable
	ldr r2, _080240C0 @ =gBattlerPartyIndexes
	ldrb r5, [r7]
	lsls r0, r5, 1
	adds r0, r2
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	ands r1, r0
	mov r12, r4
	cmp r1, 0
	beq _08024022
	adds r0, r5, 0
	muls r0, r6
	add r0, r12
	movs r1, 0
	strh r1, [r0, 0x2E]
_08024022:
	ldr r2, _080240C4 @ =gBattleMoves
	ldr r0, _080240C8 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x7F
	bne _08024068
	movs r2, 0
	adds r4, r7, 0
	movs r6, 0x58
	mov r5, r12
	adds r5, 0x18
	add r3, sp, 0x18
_08024042:
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r2, r1
	adds r1, r5
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, 0x1
	cmp r2, 0x7
	ble _08024042
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	mov r1, r12
	adds r1, 0x50
	adds r0, r1
	ldr r1, [sp, 0x50]
	str r1, [r0]
_08024068:
	bl sub_8012760
	ldr r0, _080240CC @ =gBattleScripting
	ldr r3, _080240A8 @ =gActiveBattler
	ldrb r2, [r3]
	strb r2, [r0, 0x17]
	ldr r1, _080240D0 @ =gUnknown_2022AB8
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x7
	strb r0, [r1, 0x1]
	strb r2, [r1, 0x2]
	ldr r2, _080240C0 @ =gBattlerPartyIndexes
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _080240A4 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
_08024098:
	add sp, 0x58
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080240A0: .4byte gUnknown_2023BC8
_080240A4: .4byte gUnknown_2023D74
_080240A8: .4byte gActiveBattler
_080240AC: .4byte gBattleMons
_080240B0: .4byte gUnknown_20233C4
_080240B4: .4byte gBaseStats
_080240B8: .4byte gUnknown_2023F20
_080240BC: .4byte gBitTable
_080240C0: .4byte gBattlerPartyIndexes
_080240C4: .4byte gBattleMoves
_080240C8: .4byte gCurrentMove
_080240CC: .4byte gBattleScripting
_080240D0: .4byte gUnknown_2022AB8
	thumb_func_end sub_8023F48

	thumb_func_start sub_80240D4
sub_80240D4: @ 80240D4
	push {r4-r6,lr}
	ldr r0, _08024168 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	bne _08024160
	ldr r0, _0802416C @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r6, _08024170 @ =gActiveBattler
	strb r0, [r6]
	ldrb r0, [r6]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0802412A
	ldr r0, _08024174 @ =gBattleTypeFlags
	ldr r0, [r0]
	ldr r1, _08024178 @ =0x0001aa02
	ands r0, r1
	cmp r0, 0
	bne _0802412A
	ldr r4, _0802417C @ =gBattleMons
	ldrb r0, [r6]
	movs r5, 0x58
	muls r0, r5
	adds r0, r4
	ldrh r0, [r0]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r6]
	muls r1, r5
	adds r4, 0x48
	adds r1, r4
	ldr r2, [r1]
	movs r1, 0x2
	bl sub_8044898
_0802412A:
	ldr r2, _08024180 @ =gAbsentBattlerFlags
	ldr r1, _08024184 @ =gBitTable
	ldr r5, _08024170 @ =gActiveBattler
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	ldr r1, _08024188 @ =gBattlerPartyIndexes
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrb r1, [r0]
	ldr r4, _0802416C @ =gUnknown_2023D74
	ldr r0, [r4]
	ldrb r2, [r0, 0x2]
	movs r0, 0
	bl EmitSwitchInAnim
	ldrb r0, [r5]
	bl MarkBufferBankForExecution
	ldr r0, [r4]
	adds r0, 0x3
	str r0, [r4]
_08024160:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024168: .4byte gUnknown_2023BC8
_0802416C: .4byte gUnknown_2023D74
_08024170: .4byte gActiveBattler
_08024174: .4byte gBattleTypeFlags
_08024178: .4byte 0x0001aa02
_0802417C: .4byte gBattleMons
_08024180: .4byte gAbsentBattlerFlags
_08024184: .4byte gBitTable
_08024188: .4byte gBattlerPartyIndexes
	thumb_func_end sub_80240D4

	thumb_func_start sub_802418C
sub_802418C: @ 802418C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r4, _080241F0 @ =gUnknown_2023D74
	ldr r0, [r4]
	ldrb r1, [r0, 0x1]
	movs r0, 0x7F
	ands r0, r1
	bl sub_8016E24
	ldr r3, _080241F4 @ =gActiveBattler
	strb r0, [r3]
	ldr r2, [r4]
	ldrb r1, [r2, 0x1]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08024204
	ldr r1, _080241F8 @ =gBattleMons
	ldrb r3, [r3]
	movs r0, 0x58
	muls r0, r3
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080241FC @ =0x0400e000
	ands r0, r1
	cmp r0, 0
	bne _080241D8
	ldr r1, _08024200 @ =gStatuses3
	lsls r0, r3, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 3
	ands r0, r1
	cmp r0, 0
	beq _08024204
_080241D8:
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
	b _08024388
	.align 2, 0
_080241F0: .4byte gUnknown_2023D74
_080241F4: .4byte gActiveBattler
_080241F8: .4byte gBattleMons
_080241FC: .4byte 0x0400e000
_08024200: .4byte gStatuses3
_08024204:
	ldr r5, _08024290 @ =gBattleTypeFlags
	ldr r0, [r5]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080242A4
	ldr r4, _08024294 @ =gActiveBattler
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08024298 @ =gPlayerParty
	mov r8, r1
	cmp r0, 0x1
	bne _08024228
	ldr r0, _0802429C @ =gEnemyParty
	mov r8, r0
_08024228:
	movs r5, 0
	ldrb r0, [r4]
	bl GetBankMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043620
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _08024242
	movs r5, 0x3
_08024242:
	adds r6, r5, 0x3
	cmp r5, r6
	bge _0802428A
	ldr r7, _080242A0 @ =gBattlerPartyIndexes
_0802424A:
	movs r0, 0x64
	muls r0, r5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08024284
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08024284
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08024284
	ldr r0, _08024294 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	cmp r0, r5
	bne _0802428A
_08024284:
	adds r5, 0x1
	cmp r5, r6
	blt _0802424A
_0802428A:
	cmp r5, r6
	beq _08024358
	b _08024380
	.align 2, 0
_08024290: .4byte gBattleTypeFlags
_08024294: .4byte gActiveBattler
_08024298: .4byte gPlayerParty
_0802429C: .4byte gEnemyParty
_080242A0: .4byte gBattlerPartyIndexes
_080242A4:
	ldr r0, _080242D4 @ =gActiveBattler
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _080242E4
	movs r0, 0x1
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, [r5]
	ands r0, r4
	cmp r0, 0
	beq _080242D8
	movs r0, 0x3
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r6, r0, 24
	b _080242DA
	.align 2, 0
_080242D4: .4byte gActiveBattler
_080242D8:
	adds r6, r7, 0
_080242DA:
	ldr r0, _080242E0 @ =gEnemyParty
	mov r8, r0
	b _0802430A
	.align 2, 0
_080242E0: .4byte gEnemyParty
_080242E4:
	movs r0, 0
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, [r5]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08024304
	movs r0, 0x2
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r6, r0, 24
	b _08024306
_08024304:
	adds r6, r7, 0
_08024306:
	ldr r1, _08024374 @ =gPlayerParty
	mov r8, r1
_0802430A:
	movs r5, 0
_0802430C:
	movs r0, 0x64
	muls r0, r5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0802434E
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0802434E
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0802434E
	ldr r1, _08024378 @ =gBattlerPartyIndexes
	lsls r0, r7, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r5, r0
	beq _0802434E
	lsls r0, r6, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r5, r0
	bne _08024354
_0802434E:
	adds r5, 0x1
	cmp r5, 0x5
	ble _0802430C
_08024354:
	cmp r5, 0x6
	bne _08024380
_08024358:
	ldr r3, _0802437C @ =gUnknown_2023D74
	ldr r2, [r3]
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
	str r1, [r3]
	b _08024388
	.align 2, 0
_08024374: .4byte gPlayerParty
_08024378: .4byte gBattlerPartyIndexes
_0802437C: .4byte gUnknown_2023D74
_08024380:
	ldr r1, _08024394 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x6
	str r0, [r1]
_08024388:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024394: .4byte gUnknown_2023D74
	thumb_func_end sub_802418C

	thumb_func_start sub_8024398
sub_8024398: @ 8024398
	push {r4,r5,lr}
	sub sp, 0x4
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r4, _080243E0 @ =gActiveBattler
	ldrb r0, [r4]
	ldr r5, _080243E4 @ =gBattleStruct
	ldr r1, [r5]
	adds r1, r0, r1
	adds r1, 0x58
	ldr r3, _080243E8 @ =gBattlerPartyIndexes
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r0
	adds r1, 0x60
	ldr r0, [r5]
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x1
	movs r3, 0
	bl EmitChoosePokemon
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080243E0: .4byte gActiveBattler
_080243E4: .4byte gBattleStruct
_080243E8: .4byte gBattlerPartyIndexes
	thumb_func_end sub_8024398

	thumb_func_start sub_80243EC
sub_80243EC: @ 80243EC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r7, 0
	movs r0, 0
	mov r9, r0
	ldr r6, _08024498 @ =gUnknown_2023D74
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
	ldr r0, _080244A4 @ =gUnknown_2023BCC
	ldrb r0, [r0]
	cmp r7, r0
	bcc _0802443C
	b _080248A6
_0802443C:
	ldr r7, _080244A8 @ =gUnknown_2023DD0
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
	bl sub_8019C10
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
	bl EmitLinkStandbyMsg
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	b _080244F6
	.align 2, 0
_08024498: .4byte gUnknown_2023D74
_0802449C: .4byte gBattleTypeFlags
_080244A0: .4byte gActiveBattler
_080244A4: .4byte gUnknown_2023BCC
_080244A8: .4byte gUnknown_2023DD0
_080244AC: .4byte gBitTable
_080244B0: .4byte gAbsentBattlerFlags
_080244B4:
	ldr r5, _080244E4 @ =gUnknown_2023ECC
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
_080244E4: .4byte gUnknown_2023ECC
_080244E8:
	movs r0, 0
	movs r1, 0x2
	bl EmitLinkStandbyMsg
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_080244F6:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _0802450C @ =gUnknown_2023BCC
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08024446
	b _080248A6
	.align 2, 0
_0802450C: .4byte gUnknown_2023BCC
_08024510:
	ands r0, r1
	cmp r0, 0
	bne _08024518
	b _080248A6
_08024518:
	ldr r0, _08024570 @ =gUnknown_2023DD0
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
	bl sub_8019C10
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
	bl EmitCmd42
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	b _080245CE
	.align 2, 0
_08024570: .4byte gUnknown_2023DD0
_08024574: .4byte gBitTable
_08024578: .4byte gActiveBattler
_0802457C: .4byte gAbsentBattlerFlags
_08024580:
	ldr r6, _080245B4 @ =gUnknown_2023ECC
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
_080245B4: .4byte gUnknown_2023ECC
_080245B8: .4byte gBattleStruct
_080245BC:
	movs r0, 0
	movs r1, 0x2
	bl EmitLinkStandbyMsg
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
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
	bl sub_8019C10
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
	ldr r2, _08024634 @ =gUnknown_2023DD0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	movs r0, 0
	bl EmitCmd42
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	b _0802468C
	.align 2, 0
_08024628: .4byte gBitTable
_0802462C: .4byte gActiveBattler
_08024630: .4byte gAbsentBattlerFlags
_08024634: .4byte gUnknown_2023DD0
_08024638:
	ldr r6, _0802466C @ =gUnknown_2023ECC
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
_0802466C: .4byte gUnknown_2023ECC
_08024670: .4byte gBattleStruct
_08024674:
	movs r0, 0x1
	mov r1, r9
	ands r0, r1
	cmp r0, 0
	bne _0802468C
	movs r0, 0
	movs r1, 0x2
	bl EmitLinkStandbyMsg
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
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
	bl sub_8019C10
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
	ldr r2, _080246E8 @ =gUnknown_2023DD0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	movs r0, 0
	bl EmitCmd42
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	b _0802473E
	.align 2, 0
_080246DC: .4byte gBitTable
_080246E0: .4byte gActiveBattler
_080246E4: .4byte gAbsentBattlerFlags
_080246E8: .4byte gUnknown_2023DD0
_080246EC:
	ldr r6, _08024720 @ =gUnknown_2023ECC
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
_08024720: .4byte gUnknown_2023ECC
_08024724: .4byte gBattleStruct
_08024728:
	movs r0, 0
	movs r1, 0x2
	bl EmitLinkStandbyMsg
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
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
	bl sub_8019C10
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
	ldr r2, _080247A4 @ =gUnknown_2023DD0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	movs r0, 0
	bl EmitCmd42
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	b _080247FC
	.align 2, 0
_08024798: .4byte gBitTable
_0802479C: .4byte gActiveBattler
_080247A0: .4byte gAbsentBattlerFlags
_080247A4: .4byte gUnknown_2023DD0
_080247A8:
	ldr r6, _080247DC @ =gUnknown_2023ECC
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
_080247DC: .4byte gUnknown_2023ECC
_080247E0: .4byte gBattleStruct
_080247E4:
	movs r0, 0x2
	mov r1, r9
	ands r1, r0
	cmp r1, 0
	bne _080247FC
	movs r0, 0
	movs r1, 0x2
	bl EmitLinkStandbyMsg
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_080247FC:
	ldr r1, _0802482C @ =gUnknown_2023ECC
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
_0802482C: .4byte gUnknown_2023ECC
_08024830: .4byte gAbsentBattlerFlags
_08024834: .4byte gBitTable
_08024838: .4byte gActiveBattler
_0802483C:
	ldr r0, _08024880 @ =gActiveBattler
	strb r1, [r0]
_08024840:
	movs r0, 0
	movs r1, 0x2
	bl EmitLinkStandbyMsg
	ldr r0, _08024880 @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBufferBankForExecution
_08024850:
	ldr r1, _08024884 @ =gUnknown_2023ECC
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
_08024884: .4byte gUnknown_2023ECC
_08024888: .4byte gAbsentBattlerFlags
_0802488C: .4byte gBitTable
_08024890:
	ldr r1, _080248B0 @ =gActiveBattler
	movs r0, 0x1
_08024894:
	strb r0, [r1]
	movs r0, 0
	movs r1, 0x2
	bl EmitLinkStandbyMsg
	ldr r0, _080248B0 @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBufferBankForExecution
_080248A6:
	ldr r1, _080248B4 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x6
	str r0, [r1]
	b _08024C2E
	.align 2, 0
_080248B0: .4byte gActiveBattler
_080248B4: .4byte gUnknown_2023D74
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
	ldr r7, _08024938 @ =gUnknown_2023DD0
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
	ldr r0, _08024944 @ =gUnknown_20233C4
	ldrb r1, [r0, 0x1]
	movs r0, 0x2
	movs r2, 0x6
	bl sub_8019C10
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
	bl EmitCmd42
	ldrb r0, [r6]
	bl MarkBufferBankForExecution
	b _0802497E
	.align 2, 0
_08024934: .4byte gBattleTypeFlags
_08024938: .4byte gUnknown_2023DD0
_0802493C: .4byte gBitTable
_08024940: .4byte gActiveBattler
_08024944: .4byte gUnknown_20233C4
_08024948: .4byte gAbsentBattlerFlags
_0802494C:
	ldr r4, _080249DC @ =gUnknown_2023ECC
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
	ldr r0, _080249EC @ =gUnknown_20233C4
	ldr r2, _080249F0 @ =0x00000201
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x3
	movs r2, 0x6
	bl sub_8019C10
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
	ldr r2, _080249F8 @ =gUnknown_2023DD0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r4
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	movs r0, 0
	bl EmitCmd42
	ldrb r0, [r5]
	bl MarkBufferBankForExecution
	b _08024A2E
	.align 2, 0
_080249DC: .4byte gUnknown_2023ECC
_080249E0: .4byte gBattleStruct
_080249E4: .4byte gBitTable
_080249E8: .4byte gActiveBattler
_080249EC: .4byte gUnknown_20233C4
_080249F0: .4byte 0x00000201
_080249F4: .4byte gAbsentBattlerFlags
_080249F8: .4byte gUnknown_2023DD0
_080249FC:
	ldr r4, _08024A3C @ =gUnknown_2023ECC
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
	ldr r1, _08024A44 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x6
	str r0, [r1]
	mov r12, r1
	b _08024A4C
	.align 2, 0
_08024A3C: .4byte gUnknown_2023ECC
_08024A40: .4byte gBattleStruct
_08024A44: .4byte gUnknown_2023D74
_08024A48:
	adds r0, r2, 0x6
	str r0, [r6]
_08024A4C:
	ldr r0, _08024A9C @ =gUnknown_2023DD0
	ldr r0, [r0]
	lsrs r5, r0, 28
	ldr r1, _08024AA0 @ =gUnknown_2023D6D
	movs r0, 0
	strb r0, [r1]
	ldr r4, _08024AA4 @ =gBitTable
	ldr r2, [r4]
	ands r2, r5
	ldr r6, _08024AA8 @ =gUnknown_2023BCC
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
_08024A9C: .4byte gUnknown_2023DD0
_08024AA0: .4byte gUnknown_2023D6D
_08024AA4: .4byte gBitTable
_08024AA8: .4byte gUnknown_2023BCC
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
	bl sub_8016E24
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08024AE0 @ =gUnknown_2023ECC
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
_08024AE0: .4byte gUnknown_2023ECC
_08024AE4:
	adds r0, r7, 0
	movs r1, 0x6
	movs r2, 0x6
	bl sub_8019C10
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
	ldr r3, _08024B30 @ =gUnknown_2023DD0
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
_08024B30: .4byte gUnknown_2023DD0
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
	bl EmitChoosePokemon
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	ldr r0, [r6]
	adds r0, 0x6
	str r0, [r6]
	ldrb r0, [r4]
	bl GetBankIdentity
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
	ldr r0, _08024BEC @ =gUnknown_2023BCC
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
	bl EmitLinkStandbyMsg
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_08024BC4:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08024BEC @ =gUnknown_2023BCC
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
_08024BEC: .4byte gUnknown_2023BCC
_08024BF0:
	adds r0, r7, 0
	bl GetBankIdentity
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByIdentity
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
	bl EmitLinkStandbyMsg
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
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
	thumb_func_end sub_80243EC

	thumb_func_start sub_8024C48
sub_8024C48: @ 8024C48
	push {r4-r7,lr}
	ldr r0, _08024C74 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	beq _08024C54
	b _08024E16
_08024C54:
	ldr r4, _08024C78 @ =gUnknown_2023D74
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
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
_08024C74: .4byte gUnknown_2023BC8
_08024C78: .4byte gUnknown_2023D74
_08024C7C: .4byte gActiveBattler
_08024C80:
	cmp r0, 0x2
	beq _08024CE0
	b _08024E0E
_08024C86:
	movs r3, 0
	ldr r0, _08024CB8 @ =gUnknown_2023BCC
	ldrb r1, [r0]
	cmp r3, r1
	blt _08024C92
	b _08024E0E
_08024C92:
	ldr r6, _08024CBC @ =gBattleStruct
	ldr r2, _08024CC0 @ =gUnknown_20233C4
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
_08024CB8: .4byte gUnknown_2023BCC
_08024CBC: .4byte gBattleStruct
_08024CC0: .4byte gUnknown_20233C4
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
	ldr r1, _08024DAC @ =gUnknown_2023E82
	ldr r4, _08024DB0 @ =gUnknown_20233C4
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
_08024DAC: .4byte gUnknown_2023E82
_08024DB0: .4byte gUnknown_20233C4
_08024DB4: .4byte gBattleStruct
_08024DB8: .4byte gBattleTypeFlags
_08024DBC:
	ldrb r0, [r7]
	bl sub_8013F6C
_08024DC2:
	ldr r1, _08024E1C @ =gUnknown_2022AB8
	movs r5, 0xFD
	strb r5, [r1]
	movs r0, 0x6
	strb r0, [r1, 0x1]
	ldr r4, _08024E20 @ =gBattleMons
	ldr r3, _08024E24 @ =sBattler_AI
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
	ldr r2, _08024E28 @ =gUnknown_2022AC8
	strb r5, [r2]
	movs r0, 0x7
	strb r0, [r2, 0x1]
	ldr r3, _08024E2C @ =gActiveBattler
	ldrb r0, [r3]
	strb r0, [r2, 0x2]
	ldr r1, _08024E30 @ =gUnknown_20233C4
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
	ldr r1, _08024E34 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x3
	str r0, [r1]
_08024E16:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024E1C: .4byte gUnknown_2022AB8
_08024E20: .4byte gBattleMons
_08024E24: .4byte sBattler_AI
_08024E28: .4byte gUnknown_2022AC8
_08024E2C: .4byte gActiveBattler
_08024E30: .4byte gUnknown_20233C4
_08024E34: .4byte gUnknown_2023D74
	thumb_func_end sub_8024C48

	thumb_func_start sub_8024E38
sub_8024E38: @ 8024E38
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	ldr r6, _08024F40 @ =gUnknown_2023D74
	ldr r0, [r6]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r4, _08024F44 @ =gActiveBattler
	strb r0, [r4]
	ldrb r0, [r4]
	bl sub_80174B8
	ldr r2, _08024F48 @ =gUnknown_2023DD0
	ldr r1, _08024F4C @ =gBitTable
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	ldr r2, _08024F50 @ =gUnknown_2023ECC
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
	bl GetBankSide
	ldr r5, _08024F54 @ =gSideAffecting
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
	bl GetBankSide
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
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 23
	adds r0, r5
	ldrh r2, [r0]
	mov r1, r8
	orrs r1, r2
	strh r1, [r0]
	ldrb r0, [r4]
	bl GetBankSide
	ldr r2, _08024F5C @ =gUnknown_2023DE4
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
	ldr r0, _08024F68 @ =gUnknown_81D8CBE
	str r0, [r6]
	b _080250C6
	.align 2, 0
_08024F40: .4byte gUnknown_2023D74
_08024F44: .4byte gActiveBattler
_08024F48: .4byte gUnknown_2023DD0
_08024F4C: .4byte gBitTable
_08024F50: .4byte gUnknown_2023ECC
_08024F54: .4byte gSideAffecting
_08024F58: .4byte gBattleMons
_08024F5C: .4byte gUnknown_2023DE4
_08024F60: .4byte gBattleMoveDamage
_08024F64: .4byte gBattleScripting
_08024F68: .4byte gUnknown_81D8CBE
_08024F6C:
	cmp r0, 0x1
	bne _08024F7C
	ldr r0, _08024F78 @ =gUnknown_81D8C87
	str r0, [r6]
	b _080250C6
	.align 2, 0
_08024F78: .4byte gUnknown_81D8C87
_08024F7C:
	ldr r0, _08024F84 @ =gUnknown_81D8CF5
	str r0, [r6]
	b _080250C6
	.align 2, 0
_08024F84: .4byte gUnknown_81D8CF5
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
	bl sub_8019F18
	lsls r0, 24
	cmp r0, 0
	beq _08024FC4
	b _080250C6
_08024FC4:
	ldrb r1, [r5]
	movs r0, 0
	movs r2, 0
	bl sub_801BC68
	lsls r0, 24
	cmp r0, 0
	bne _080250C6
	ldrb r0, [r5]
	bl GetBankSide
	ldr r1, _08025070 @ =gSideAffecting
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r2, [r0]
	ldr r1, _08025074 @ =0x0000fdff
	ands r1, r2
	strh r1, [r0]
	movs r4, 0
	ldr r0, _08025078 @ =gUnknown_2023BCC
	ldrb r3, [r0]
	cmp r4, r3
	bge _08025012
	ldr r6, _0802507C @ =gUnknown_2023BDE
	ldr r3, _08025080 @ =gUnknown_2023BDA
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
	ldr r0, _08025078 @ =gUnknown_2023BCC
	ldrb r0, [r0]
	cmp r4, r0
	bge _08025046
	ldr r6, _08025084 @ =gBattleStruct
	ldr r5, _08025064 @ =gBattleMons
_08025020:
	lsls r0, r4, 24
	lsrs r0, 24
	bl GetBankSide
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
	ldr r0, _08025078 @ =gUnknown_2023BCC
	ldrb r0, [r0]
	cmp r4, r0
	blt _08025020
_08025046:
	ldr r0, _08025088 @ =gUnknown_2023D74
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r5, r0, 0
	cmp r1, 0x5
	bne _080250C0
	ldr r0, _0802508C @ =gUnknown_2023DD0
	ldr r0, [r0]
	lsrs r4, r0, 28
	ldr r1, _08025090 @ =gUnknown_2023D6D
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r2, _08025094 @ =gBitTable
	b _080250A6
	.align 2, 0
_08025064: .4byte gBattleMons
_08025068: .4byte gActiveBattler
_0802506C: .4byte gDisableStructs
_08025070: .4byte gSideAffecting
_08025074: .4byte 0x0000fdff
_08025078: .4byte gUnknown_2023BCC
_0802507C: .4byte gUnknown_2023BDE
_08025080: .4byte gUnknown_2023BDA
_08025084: .4byte gBattleStruct
_08025088: .4byte gUnknown_2023D74
_0802508C: .4byte gUnknown_2023DD0
_08025090: .4byte gUnknown_2023D6D
_08025094: .4byte gBitTable
_08025098:
	ldr r0, _080250D4 @ =gUnknown_2023BCC
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
_080250D4: .4byte gUnknown_2023BCC
_080250D8: .4byte gAbsentBattlerFlags
	thumb_func_end sub_8024E38

	thumb_func_start atk53_trainer_slide
atk53_trainer_slide: @ 80250DC
	push {lr}
	ldr r0, _080250EC @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _080250F0
	movs r0, 0
	b _080250F2
	.align 2, 0
_080250EC: .4byte gUnknown_2023D74
_080250F0:
	movs r0, 0x1
_080250F2:
	bl GetBankByIdentity
	ldr r1, _08025114 @ =gActiveBattler
	strb r0, [r1]
	movs r0, 0
	bl EmitTrainerSlide
	ldr r0, _08025114 @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBufferBankForExecution
	ldr r1, _08025118 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08025114: .4byte gActiveBattler
_08025118: .4byte gUnknown_2023D74
	thumb_func_end atk53_trainer_slide

	thumb_func_start atk54_playse
atk54_playse: @ 802511C
	push {r4,r5,lr}
	ldr r5, _0802514C @ =gActiveBattler
	ldr r0, _08025150 @ =sBattler_AI
	ldrb r0, [r0]
	strb r0, [r5]
	ldr r4, _08025154 @ =gUnknown_2023D74
	ldr r0, [r4]
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r1, r0
	movs r0, 0
	bl EmitPlaySE
	ldrb r0, [r5]
	bl MarkBufferBankForExecution
	ldr r0, [r4]
	adds r0, 0x3
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802514C: .4byte gActiveBattler
_08025150: .4byte sBattler_AI
_08025154: .4byte gUnknown_2023D74
	thumb_func_end atk54_playse

	thumb_func_start atk55_play_sound
atk55_play_sound: @ 8025158
	push {r4,r5,lr}
	ldr r5, _08025188 @ =gActiveBattler
	ldr r0, _0802518C @ =sBattler_AI
	ldrb r0, [r0]
	strb r0, [r5]
	ldr r4, _08025190 @ =gUnknown_2023D74
	ldr r0, [r4]
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r1, r0
	movs r0, 0
	bl Emitcmd44
	ldrb r0, [r5]
	bl MarkBufferBankForExecution
	ldr r0, [r4]
	adds r0, 0x3
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025188: .4byte gActiveBattler
_0802518C: .4byte sBattler_AI
_08025190: .4byte gUnknown_2023D74
	thumb_func_end atk55_play_sound

	thumb_func_start atk56_playfaintcry
atk56_playfaintcry: @ 8025194
	push {r4,r5,lr}
	ldr r5, _080251BC @ =gUnknown_2023D74
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r4, _080251C0 @ =gActiveBattler
	strb r0, [r4]
	movs r0, 0
	bl EmitFaintingCry
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080251BC: .4byte gUnknown_2023D74
_080251C0: .4byte gActiveBattler
	thumb_func_end atk56_playfaintcry

	thumb_func_start atk57
atk57: @ 80251C4
	push {r4,lr}
	movs r0, 0
	bl GetBankByIdentity
	ldr r4, _080251F0 @ =gActiveBattler
	strb r0, [r4]
	ldr r0, _080251F4 @ =gUnknown_2023E8A
	ldrb r1, [r0]
	movs r0, 0
	bl EmitCmd55
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	ldr r1, _080251F8 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080251F0: .4byte gActiveBattler
_080251F4: .4byte gUnknown_2023E8A
_080251F8: .4byte gUnknown_2023D74
	thumb_func_end atk57

	thumb_func_start atk58_returntoball
atk58_returntoball: @ 80251FC
	push {r4,r5,lr}
	ldr r5, _08025228 @ =gUnknown_2023D74
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r4, _0802522C @ =gActiveBattler
	strb r0, [r4]
	movs r0, 0
	movs r1, 0x1
	bl EmitReturnMonToBall
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025228: .4byte gUnknown_2023D74
_0802522C: .4byte gActiveBattler
	thumb_func_end atk58_returntoball

	thumb_func_start atk59_handlelearnnewmove
atk59_handlelearnnewmove: @ 8025230
	push {r4-r7,lr}
	ldr r0, _080252A4 @ =gUnknown_2023D74
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
	ldr r0, _080252A4 @ =gUnknown_2023D74
	str r4, [r0]
	b _0802535C
	.align 2, 0
_080252A4: .4byte gUnknown_2023D74
_080252A8: .4byte gBattleStruct
_080252AC: .4byte gPlayerParty
_080252B0: .4byte 0x0000fffe
_080252B4:
	ldr r0, _080252C4 @ =0x0000ffff
	cmp r5, r0
	bne _080252CC
	ldr r1, _080252C8 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0xA
	str r0, [r1]
	b _0802535C
	.align 2, 0
_080252C4: .4byte 0x0000ffff
_080252C8: .4byte gUnknown_2023D74
_080252CC:
	movs r0, 0
	bl GetBankByIdentity
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
	bl GetBankByIdentity
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
	ldr r0, _08025378 @ =gUnknown_2023D74
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
_08025378: .4byte gUnknown_2023D74
	thumb_func_end atk59_handlelearnnewmove

	thumb_func_start sub_802537C
sub_802537C: @ 802537C
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
	bl sub_802DB7C
	ldr r0, _080253F0 @ =gUnknown_83FE791
	movs r1, 0xE
	bl sub_80D87BC
	ldr r1, _080253F4 @ =gBattleScripting
	ldrb r0, [r1, 0x1F]
	adds r0, 0x1
	strb r0, [r1, 0x1F]
	ldr r0, _080253F8 @ =gUnknown_2023E82
	strb r4, [r0, 0x1]
	bl sub_802DCB8
	b _080256D0
	.align 2, 0
_080253F0: .4byte gUnknown_83FE791
_080253F4: .4byte gBattleScripting
_080253F8: .4byte gUnknown_2023E82
_080253FC:
	ldr r0, _08025484 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08025422
	ldr r4, _08025488 @ =gUnknown_2023E82
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _08025422
	movs r0, 0x5
	bl PlaySE
	bl sub_802DCF8
	movs r0, 0
	strb r0, [r4, 0x1]
	bl sub_802DCB8
_08025422:
	ldr r0, _08025484 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08025448
	ldr r4, _08025488 @ =gUnknown_2023E82
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08025448
	movs r0, 0x5
	bl PlaySE
	bl sub_802DCF8
	movs r0, 0x1
	strb r0, [r4, 0x1]
	bl sub_802DCB8
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
	ldr r0, _08025488 @ =gUnknown_2023E82
	ldrb r4, [r0, 0x1]
	cmp r4, 0
	bne _0802549C
	str r5, [sp]
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl sub_802DB7C
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
_08025488: .4byte gUnknown_2023E82
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
	ldr r0, _080254E4 @ =gUnknown_2037AB8
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
	ldr r2, _080254F0 @ =gUnknown_2024029
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080254F4 @ =sub_8077764
	ldr r4, _080254F8 @ =gUnknown_2024022
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
_080254E4: .4byte gUnknown_2037AB8
_080254E8: .4byte gPlayerParty
_080254EC: .4byte gBattleStruct
_080254F0: .4byte gUnknown_2024029
_080254F4: .4byte sub_8077764
_080254F8: .4byte gUnknown_2024022
_080254FC: .4byte gBattleScripting
_08025500:
	ldr r0, _0802552C @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802550E
	b _080256D0
_0802550E:
	ldr r0, _08025530 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _08025534 @ =sub_8011100
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
_0802552C: .4byte gUnknown_2037AB8
_08025530: .4byte gMain
_08025534: .4byte sub_8011100
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
	ldr r3, _08025680 @ =gUnknown_2023D74
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
	ldr r1, _08025684 @ =gUnknown_2022AC8
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
	ldr r7, _08025688 @ =gUnknown_2024022
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
	ldr r0, _08025688 @ =gUnknown_2024022
	ldrh r1, [r0]
	adds r0, r4, 0
	adds r2, r5, 0
	bl SetBattleMonMoveSlot
	b _080256D0
	.align 2, 0
_08025680: .4byte gUnknown_2023D74
_08025684: .4byte gUnknown_2022AC8
_08025688: .4byte gUnknown_2024022
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
	bl sub_802DB7C
	ldr r1, _080256C0 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _080256D0
	.align 2, 0
_080256C0: .4byte gUnknown_2023D74
_080256C4:
	ldr r0, _080256DC @ =gUnknown_2023BC8
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
_080256DC: .4byte gUnknown_2023BC8
	thumb_func_end sub_802537C

	thumb_func_start sub_80256E0
sub_80256E0: @ 80256E0
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
	bl sub_802DB7C
	ldr r0, _08025720 @ =gUnknown_83FE791
	movs r1, 0xE
	bl sub_80D87BC
	ldrb r0, [r5, 0x1F]
	adds r0, 0x1
	strb r0, [r5, 0x1F]
	ldr r0, _08025724 @ =gUnknown_2023E82
	strb r4, [r0, 0x1]
	bl sub_802DCB8
	b _0802580E
	.align 2, 0
_08025720: .4byte gUnknown_83FE791
_08025724: .4byte gUnknown_2023E82
_08025728:
	ldr r0, _080257AC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0802574E
	ldr r4, _080257B0 @ =gUnknown_2023E82
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _0802574E
	movs r0, 0x5
	bl PlaySE
	bl sub_802DCF8
	movs r0, 0
	strb r0, [r4, 0x1]
	bl sub_802DCB8
_0802574E:
	ldr r0, _080257AC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08025774
	ldr r4, _080257B0 @ =gUnknown_2023E82
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08025774
	movs r0, 0x5
	bl PlaySE
	bl sub_802DCF8
	movs r0, 0x1
	strb r0, [r4, 0x1]
	bl sub_802DCB8
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
	ldr r0, _080257B0 @ =gUnknown_2023E82
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _080257B8
	ldr r3, _080257B4 @ =gUnknown_2023D74
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
_080257B0: .4byte gUnknown_2023E82
_080257B4: .4byte gUnknown_2023D74
_080257B8:
	ldr r1, _080257D4 @ =gUnknown_2023D74
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
	bl sub_802DB7C
	b _0802580E
	.align 2, 0
_080257D4: .4byte gUnknown_2023D74
_080257D8:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802580E
	movs r0, 0x5
	bl PlaySE
	ldr r3, _08025818 @ =gUnknown_2023D74
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
	bl sub_802DB7C
_0802580E:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025818: .4byte gUnknown_2023D74
	thumb_func_end sub_80256E0

	thumb_func_start sub_802581C
sub_802581C: @ 802581C
	push {r4,lr}
	ldr r4, _08025888 @ =gUnknown_2023D74
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r2, _0802588C @ =gActiveBattler
	strb r0, [r2]
	ldr r0, _08025890 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _080258A0
	ldr r0, _08025894 @ =gUnknown_2023DD0
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
	bl EmitHitAnimation
	ldr r0, _0802588C @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBufferBankForExecution
	ldr r1, _08025888 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	b _080258A6
	.align 2, 0
_08025888: .4byte gUnknown_2023D74
_0802588C: .4byte gActiveBattler
_08025890: .4byte gMoveResultFlags
_08025894: .4byte gUnknown_2023DD0
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
	thumb_func_end sub_802581C

	thumb_func_start sub_80258AC
sub_80258AC: @ 80258AC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0
	movs r5, 0
	ldr r0, _080258F0 @ =gUnknown_2023E8A
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
_080258F0: .4byte gUnknown_2023E8A
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
	ldr r0, _080259CC @ =gUnknown_824F220
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
_080259CC: .4byte gUnknown_824F220
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
	ldr r1, _08025A40 @ =gUnknown_2022AB8
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
	ldr r1, _08025A44 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08025A62
	.align 2, 0
_08025A40: .4byte gUnknown_2022AB8
_08025A44: .4byte gUnknown_2023D74
_08025A48:
	ldr r3, _08025A6C @ =gUnknown_2023D74
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
_08025A6C: .4byte gUnknown_2023D74
	thumb_func_end sub_80258AC

	thumb_func_start atk5E
atk5E: @ 8025A70
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r4, _08025A94 @ =gUnknown_2023D74
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r6, _08025A98 @ =gActiveBattler
	strb r0, [r6]
	ldr r5, _08025A9C @ =gUnknown_2023E82
	ldrb r0, [r5]
	mov r8, r4
	cmp r0, 0
	beq _08025AA0
	cmp r0, 0x1
	beq _08025AB8
	b _08025B0C
	.align 2, 0
_08025A94: .4byte gUnknown_2023D74
_08025A98: .4byte gActiveBattler
_08025A9C: .4byte gUnknown_2023E82
_08025AA0:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl EmitGetMonData
	ldrb r0, [r6]
	bl MarkBufferBankForExecution
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _08025B0C
_08025AB8:
	ldr r0, _08025B18 @ =gUnknown_2023BC8
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
_08025B18: .4byte gUnknown_2023BC8
_08025B1C: .4byte gUnknown_20233C8
_08025B20: .4byte gUnknown_2023C08
	thumb_func_end atk5E

	thumb_func_start atk5F
atk5F: @ 8025B24
	push {lr}
	ldr r0, _08025B4C @ =gActiveBattler
	ldr r2, _08025B50 @ =sBattler_AI
	ldrb r3, [r2]
	strb r3, [r0]
	ldr r1, _08025B54 @ =gBattlerTarget
	ldrb r0, [r1]
	strb r0, [r2]
	strb r3, [r1]
	ldr r2, _08025B58 @ =gUnknown_2023DD0
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
_08025B50: .4byte sBattler_AI
_08025B54: .4byte gBattlerTarget
_08025B58: .4byte gUnknown_2023DD0
_08025B5C: .4byte 0xffffefff
_08025B60:
	orrs r1, r3
_08025B62:
	str r1, [r2]
	ldr r1, _08025B70 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08025B70: .4byte gUnknown_2023D74
	thumb_func_end atk5F

	thumb_func_start atk60_incrementgamestat
atk60_incrementgamestat: @ 8025B74
	push {lr}
	ldr r0, _08025B9C @ =sBattler_AI
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08025B8E
	ldr r0, _08025BA0 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl IncrementGameStat
_08025B8E:
	ldr r1, _08025BA0 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08025B9C: .4byte sBattler_AI
_08025BA0: .4byte gUnknown_2023D74
	thumb_func_end atk60_incrementgamestat

	thumb_func_start atk61_drawpartystatussummary
atk61_drawpartystatussummary: @ 8025BA4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x30
	ldr r0, _08025C08 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	bne _08025C58
	ldr r0, _08025C0C @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r1, _08025C10 @ =gActiveBattler
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetBankSide
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
_08025C08: .4byte gUnknown_2023BC8
_08025C0C: .4byte gUnknown_2023D74
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
	bl EmitDrawPartyStatusSummary
	ldr r0, _08025C64 @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBufferBankForExecution
	ldr r1, _08025C68 @ =gUnknown_2023D74
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
_08025C68: .4byte gUnknown_2023D74
	thumb_func_end atk61_drawpartystatussummary

	thumb_func_start atk62
atk62: @ 8025C6C
	push {r4,r5,lr}
	ldr r5, _08025C94 @ =gUnknown_2023D74
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r4, _08025C98 @ =gActiveBattler
	strb r0, [r4]
	movs r0, 0
	bl EmitCmd49
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025C94: .4byte gUnknown_2023D74
_08025C98: .4byte gActiveBattler
	thumb_func_end atk62

	thumb_func_start atk63_jumptorandomattack
atk63_jumptorandomattack: @ 8025C9C
	push {r4,lr}
	ldr r0, _08025CB4 @ =gUnknown_2023D74
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0
	beq _08025CC0
	ldr r0, _08025CB8 @ =gCurrentMove
	ldr r1, _08025CBC @ =gUnknown_2023D4E
	ldrh r1, [r1]
	strh r1, [r0]
	b _08025CCE
	.align 2, 0
_08025CB4: .4byte gUnknown_2023D74
_08025CB8: .4byte gCurrentMove
_08025CBC: .4byte gUnknown_2023D4E
_08025CC0:
	ldr r2, _08025CEC @ =gUnknown_2023D4C
	ldr r1, _08025CF0 @ =gCurrentMove
	ldr r0, _08025CF4 @ =gUnknown_2023D4E
	ldrh r0, [r0]
	strh r0, [r1]
	strh r0, [r2]
	adds r0, r1, 0
_08025CCE:
	ldr r3, _08025CF8 @ =gUnknown_81D65A8
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
_08025CEC: .4byte gUnknown_2023D4C
_08025CF0: .4byte gCurrentMove
_08025CF4: .4byte gUnknown_2023D4E
_08025CF8: .4byte gUnknown_81D65A8
_08025CFC: .4byte gBattleMoves
	thumb_func_end atk63_jumptorandomattack

	thumb_func_start atk64_statusanimation
atk64_statusanimation: @ 8025D00
	push {r4,lr}
	ldr r0, _08025D70 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	bne _08025D68
	ldr r0, _08025D74 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
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
	ldr r0, _08025D88 @ =gUnknown_2023DD0
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
	bl EmitStatusAnimation
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_08025D60:
	ldr r1, _08025D74 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
_08025D68:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08025D70: .4byte gUnknown_2023BC8
_08025D74: .4byte gUnknown_2023D74
_08025D78: .4byte gActiveBattler
_08025D7C: .4byte gStatuses3
_08025D80: .4byte 0x000400c0
_08025D84: .4byte gDisableStructs
_08025D88: .4byte gUnknown_2023DD0
_08025D8C: .4byte gBattleMons
	thumb_func_end atk64_statusanimation

	thumb_func_start atk65_status2animation
atk65_status2animation: @ 8025D90
	push {r4,r5,lr}
	ldr r0, _08025E18 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	bne _08025E10
	ldr r4, _08025E1C @ =gUnknown_2023D74
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
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
	ldr r0, _08025E30 @ =gUnknown_2023DD0
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
	bl EmitStatusAnimation
	ldrb r0, [r5]
	bl MarkBufferBankForExecution
_08025E08:
	ldr r1, _08025E1C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x6
	str r0, [r1]
_08025E10:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025E18: .4byte gUnknown_2023BC8
_08025E1C: .4byte gUnknown_2023D74
_08025E20: .4byte gActiveBattler
_08025E24: .4byte gStatuses3
_08025E28: .4byte 0x000400c0
_08025E2C: .4byte gDisableStructs
_08025E30: .4byte gUnknown_2023DD0
_08025E34: .4byte gBattleMons
	thumb_func_end atk65_status2animation

	thumb_func_start atk66_chosenstatusanimation
atk66_chosenstatusanimation: @ 8025E38
	push {r4,r5,lr}
	ldr r0, _08025EB0 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	bne _08025EAA
	ldr r4, _08025EB4 @ =gUnknown_2023D74
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
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
	ldr r0, _08025EC8 @ =gUnknown_2023DD0
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08025EA2
	ldrb r1, [r4, 0x2]
	movs r0, 0
	bl EmitStatusAnimation
	ldrb r0, [r5]
	bl MarkBufferBankForExecution
_08025EA2:
	ldr r1, _08025EB4 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x7
	str r0, [r1]
_08025EAA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025EB0: .4byte gUnknown_2023BC8
_08025EB4: .4byte gUnknown_2023D74
_08025EB8: .4byte gActiveBattler
_08025EBC: .4byte gStatuses3
_08025EC0: .4byte 0x000400c0
_08025EC4: .4byte gDisableStructs
_08025EC8: .4byte gUnknown_2023DD0
	thumb_func_end atk66_chosenstatusanimation

	thumb_func_start atk67_yesnobox
atk67_yesnobox: @ 8025ECC
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _08025EE0 @ =gUnknown_2023E82
	ldrb r4, [r5]
	cmp r4, 0
	beq _08025EE4
	cmp r4, 0x1
	beq _08025F0C
	b _08025F9A
	.align 2, 0
_08025EE0: .4byte gUnknown_2023E82
_08025EE4:
	str r4, [sp]
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl sub_802DB7C
	ldr r0, _08025F08 @ =gUnknown_83FE791
	movs r1, 0xE
	bl sub_80D87BC
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	strb r4, [r5, 0x1]
	bl sub_802DCB8
	b _08025F9A
	.align 2, 0
_08025F08: .4byte gUnknown_83FE791
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
	bl sub_802DCF8
	movs r0, 0
	strb r0, [r5, 0x1]
	bl sub_802DCB8
_08025F30:
	ldr r0, _08025F6C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08025F56
	ldr r4, _08025F70 @ =gUnknown_2023E82
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08025F56
	movs r0, 0x5
	bl PlaySE
	bl sub_802DCF8
	movs r0, 0x1
	strb r0, [r4, 0x1]
	bl sub_802DCB8
_08025F56:
	ldr r0, _08025F6C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08025F74
	ldr r0, _08025F70 @ =gUnknown_2023E82
	movs r4, 0x1
	strb r4, [r0, 0x1]
	b _08025F7E
	.align 2, 0
_08025F6C: .4byte gMain
_08025F70: .4byte gUnknown_2023E82
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
	bl sub_802DB7C
	ldr r1, _08025FA4 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_08025F9A:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025FA4: .4byte gUnknown_2023D74
	thumb_func_end atk67_yesnobox

	thumb_func_start atk68_cancelallactions
atk68_cancelallactions: @ 8025FA8
	push {r4,r5,lr}
	movs r1, 0
	ldr r2, _08025FD4 @ =gUnknown_2023BCC
	ldr r5, _08025FD8 @ =gUnknown_2023D74
	ldrb r0, [r2]
	cmp r1, r0
	bge _08025FC6
	ldr r4, _08025FDC @ =gUnknown_2023BDA
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
_08025FD4: .4byte gUnknown_2023BCC
_08025FD8: .4byte gUnknown_2023D74
_08025FDC: .4byte gUnknown_2023BDA
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
	ldr r1, _08026010 @ =gUnknown_2023F54
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
_08026010: .4byte gUnknown_2023F54
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
	ldr r1, _080260F0 @ =gUnknown_2023D6F
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
	bl sub_80C7208
	ldr r2, _080260F8 @ =gUnknown_2023ECC
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
	ldr r0, _08026108 @ =gUnknown_2023E8C
	lsls r1, r4, 4
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 30
	cmp r0, 0
	blt _080260BE
	ldr r0, _080260F8 @ =gUnknown_2023ECC
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
	ldr r1, _08026108 @ =gUnknown_2023E8C
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
_080260F0: .4byte gUnknown_2023D6F
_080260F4: .4byte gBattlerTarget
_080260F8: .4byte gUnknown_2023ECC
_080260FC: .4byte gBattleMons
_08026100: .4byte gBattleMoves
_08026104: .4byte gCurrentMove
_08026108: .4byte gUnknown_2023E8C
_0802610C: .4byte gBattleMoveDamage
_08026110: .4byte gMoveResultFlags
_08026114:
	ldr r0, _0802614C @ =gUnknown_2023ECC
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
	ldr r1, _08026154 @ =gUnknown_2023D68
	adds r0, r3, 0
	muls r0, r4
	adds r0, r5
	ldrh r0, [r0, 0x2E]
	strh r0, [r1]
_0802613C:
	ldr r1, _08026158 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802614C: .4byte gUnknown_2023ECC
_08026150: .4byte gMoveResultFlags
_08026154: .4byte gUnknown_2023D68
_08026158: .4byte gUnknown_2023D74
	thumb_func_end atk69_adjustsetdamage

	thumb_func_start atk6A_removeitem
atk6A_removeitem: @ 802615C
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _080261BC @ =gUnknown_2023D74
	ldr r0, [r6]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
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
	bl EmitSetMonData
	ldrb r0, [r5]
	bl MarkBufferBankForExecution
	ldr r0, [r6]
	adds r0, 0x2
	str r0, [r6]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080261BC: .4byte gUnknown_2023D74
_080261C0: .4byte gActiveBattler
_080261C4: .4byte gBattleStruct
_080261C8: .4byte gBattleMons
	thumb_func_end atk6A_removeitem

	thumb_func_start atk6B_atknameinbuff1
atk6B_atknameinbuff1: @ 80261CC
	ldr r1, _080261F8 @ =gUnknown_2022AB8
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x7
	strb r0, [r1, 0x1]
	ldr r2, _080261FC @ =sBattler_AI
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
	ldr r1, _08026204 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_080261F8: .4byte gUnknown_2022AB8
_080261FC: .4byte sBattler_AI
_08026200: .4byte gBattlerPartyIndexes
_08026204: .4byte gUnknown_2023D74
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
	ldr r1, _08026290 @ =gUnknown_202297E
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
_08026290: .4byte gUnknown_202297E
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
	ldr r1, _080262F8 @ =gUnknown_2022978
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080262FC @ =gUnknown_202297A
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
	bl sub_802DB7C
	ldr r1, _08026300 @ =gBattleScripting
	movs r0, 0x4
	strb r0, [r1, 0x1E]
	b _080263F6
	.align 2, 0
_080262F8: .4byte gUnknown_2022978
_080262FC: .4byte gUnknown_202297A
_08026300: .4byte gBattleScripting
_08026304:
	bl sub_8026404
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
	ldr r0, _0802632C @ =gUnknown_202297A
	strh r1, [r0]
	b _0802636E
	.align 2, 0
_0802632C: .4byte gUnknown_202297A
_08026330:
	ldr r0, _0802634C @ =gMain
	ldrh r0, [r0, 0x2E]
	cmp r0, 0
	beq _080263F6
	movs r0, 0x5
	bl PlaySE
	bl sub_8026448
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
	bl sub_802DB7C
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
	ldr r1, _08026400 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_080263F6:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08026400: .4byte gUnknown_2023D74
	thumb_func_end atk6C_drawlvlupbox

	thumb_func_start sub_8026404
sub_8026404: @ 8026404
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
	thumb_func_end sub_8026404

	thumb_func_start sub_8026448
sub_8026448: @ 8026448
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
	thumb_func_end sub_8026448

	thumb_func_start sub_8026480
sub_8026480: @ 8026480
	push {lr}
	ldr r1, _080264C0 @ =gUnknown_202297E
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080264C4 @ =gUnknown_202297C
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
_080264C0: .4byte gUnknown_202297E
_080264C4: .4byte gUnknown_202297C
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
	ldr r4, _080264F0 @ =gUnknown_202297C
	ldrh r1, [r4]
	movs r5, 0x80
	lsls r5, 2
	cmp r1, r5
	bne _080264F4
	movs r0, 0
	b _0802651A
	.align 2, 0
_080264F0: .4byte gUnknown_202297C
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
	ldr r0, _0802665C @ =gUnknown_202297C
	ldrh r1, [r0]
	movs r3, 0xD0
	lsls r3, 1
	adds r2, r0, 0
	cmp r1, r3
	bne _08026660
	movs r0, 0
	b _08026684
	.align 2, 0
_0802665C: .4byte gUnknown_202297C
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
	bl sub_80971CC
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
	ldr r0, _08026748 @ =gUnknown_82507C8
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
	ldr r0, _08026750 @ =gUnknown_202297C
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
_08026748: .4byte gUnknown_82507C8
_0802674C: .4byte gSprites
_08026750: .4byte gUnknown_202297C
	thumb_func_end PutMonIconOnLvlUpBox

	thumb_func_start SpriteCB_MonIconOnLvlUpBox
SpriteCB_MonIconOnLvlUpBox: @ 8026754
	push {r4,lr}
	adds r2, r0, 0
	ldr r0, _08026770 @ =gUnknown_202297C
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
_08026770: .4byte gUnknown_202297C
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
	ldr r1, _080267EC @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080267EC: .4byte gUnknown_2023D74
	thumb_func_end atk6D_resetsentmonsvalue

	thumb_func_start atk6E_setatktoplayer0
atk6E_setatktoplayer0: @ 80267F0
	push {lr}
	movs r0, 0
	bl GetBankByIdentity
	ldr r1, _08026808 @ =sBattler_AI
	strb r0, [r1]
	ldr r1, _0802680C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08026808: .4byte sBattler_AI
_0802680C: .4byte gUnknown_2023D74
	thumb_func_end atk6E_setatktoplayer0

	thumb_func_start atk6F_makevisible
atk6F_makevisible: @ 8026810
	push {r4,r5,lr}
	ldr r5, _0802683C @ =gUnknown_2023D74
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r4, _08026840 @ =gActiveBattler
	strb r0, [r4]
	movs r0, 0
	movs r1, 0
	bl EmitSpriteInvisibility
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802683C: .4byte gUnknown_2023D74
_08026840: .4byte gActiveBattler
	thumb_func_end atk6F_makevisible

	thumb_func_start atk70_recordlastability
atk70_recordlastability: @ 8026844
	push {r4,lr}
	ldr r4, _0802686C @ =gUnknown_2023D74
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	ldr r1, _08026870 @ =gActiveBattler
	strb r0, [r1]
	ldrb r0, [r1]
	ldr r1, _08026874 @ =gUnknown_2023D6A
	ldrb r1, [r1]
	bl sub_80C71D0
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802686C: .4byte gUnknown_2023D74
_08026870: .4byte gActiveBattler
_08026874: .4byte gUnknown_2023D6A
	thumb_func_end atk70_recordlastability

	thumb_func_start BufferMoveToLearnIntoBattleTextBuff2
BufferMoveToLearnIntoBattleTextBuff2: @ 8026878
	ldr r2, _08026898 @ =gUnknown_2022AC8
	movs r0, 0xFD
	strb r0, [r2]
	movs r0, 0x2
	strb r0, [r2, 0x1]
	ldr r0, _0802689C @ =gUnknown_2024022
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
_08026898: .4byte gUnknown_2022AC8
_0802689C: .4byte gUnknown_2024022
	thumb_func_end BufferMoveToLearnIntoBattleTextBuff2

	thumb_func_start atk71_buffermovetolearn
atk71_buffermovetolearn: @ 80268A0
	push {lr}
	bl BufferMoveToLearnIntoBattleTextBuff2
	ldr r1, _080268B4 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080268B4: .4byte gUnknown_2023D74
	thumb_func_end atk71_buffermovetolearn

	thumb_func_start atk72_jumpifplayerran
atk72_jumpifplayerran: @ 80268B8
	push {lr}
	ldr r0, _080268E4 @ =gUnknown_2023D6D
	ldrb r0, [r0]
	bl sub_8016748
	lsls r0, 24
	cmp r0, 0
	beq _080268EC
	ldr r3, _080268E8 @ =gUnknown_2023D74
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
_080268E4: .4byte gUnknown_2023D6D
_080268E8: .4byte gUnknown_2023D74
_080268EC:
	ldr r1, _080268F8 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_080268F4:
	pop {r0}
	bx r0
	.align 2, 0
_080268F8: .4byte gUnknown_2023D74
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
	ldr r0, _08026950 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
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
_08026950: .4byte gUnknown_2023D74
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
	ldr r1, _080269A4 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080269A0: .4byte gBattleStruct
_080269A4: .4byte gUnknown_2023D74
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
	ldr r0, _08026A10 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
	adds r4, r0, 0
	ldr r0, _08026A14 @ =gActiveBattler
	strb r4, [r0]
	movs r0, 0x1
	eors r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl GetBankSide
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
_08026A10: .4byte gUnknown_2023D74
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
	ldr r1, _08026A54 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026A54: .4byte gUnknown_2023D74
	thumb_func_end atk74_hpthresholds2

	thumb_func_start atk75_useitemonopponent
atk75_useitemonopponent: @ 8026A58
	push {lr}
	sub sp, 0x4
	ldr r2, _08026A98 @ =gUnknown_2024004
	ldr r1, _08026A9C @ =sBattler_AI
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
	ldr r1, _08026AA8 @ =gUnknown_2023D68
	ldrh r1, [r1]
	lsls r2, 24
	lsrs r2, 24
	movs r3, 0x1
	str r3, [sp]
	movs r3, 0
	bl sub_80413E4
	ldr r1, _08026AAC @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08026A98: .4byte gUnknown_2024004
_08026A9C: .4byte sBattler_AI
_08026AA0: .4byte gBattlerPartyIndexes
_08026AA4: .4byte gEnemyParty
_08026AA8: .4byte gUnknown_2023D68
_08026AAC: .4byte gUnknown_2023D74
	thumb_func_end atk75_useitemonopponent

	thumb_func_start sub_8026AB0
sub_8026AB0: @ 8026AB0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	ldr r4, _08026ADC @ =gUnknown_2023D74
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
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
_08026ADC: .4byte gUnknown_2023D74
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
	ldr r1, _08026B68 @ =sBattler_AI
	ldr r4, _08026B6C @ =gBattlerTarget
	ldrb r0, [r4]
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetBankSide
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08026B70 @ =gUnknown_2023DE4
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
_08026B68: .4byte sBattler_AI
_08026B6C: .4byte gBattlerTarget
_08026B70: .4byte gUnknown_2023DE4
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
	ldr r1, _08026B98 @ =gUnknown_2023E82
	strb r0, [r1]
	b _08026F4E
	.align 2, 0
_08026B98: .4byte gUnknown_2023E82
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
	ldr r2, _08026BD4 @ =gUnknown_2023DD0
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
	ldr r1, _08026BE0 @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1]
	b _08026F4E
	.align 2, 0
_08026BD4: .4byte gUnknown_2023DD0
_08026BD8: .4byte gBitTable
_08026BDC: .4byte gActiveBattler
_08026BE0: .4byte gUnknown_2023E82
_08026BE4:
	ldr r0, _08026BEC @ =gUnknown_2023E82
	strb r2, [r0]
	b _08026F4E
	.align 2, 0
_08026BEC: .4byte gUnknown_2023E82
_08026BF0:
	ldr r4, _08026C20 @ =gUnknown_2023ECC
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
_08026C20: .4byte gUnknown_2023ECC
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
	ldr r0, _08026CEC @ =gUnknown_2023DD0
	ldr r1, [r0]
	ldr r2, _08026CF0 @ =0xffbfffff
	ands r1, r2
	str r1, [r0]
	b _08026F4E
	.align 2, 0
_08026CE4: .4byte gBattleTypeFlags
_08026CE8: .4byte gBattleMons
_08026CEC: .4byte gUnknown_2023DD0
_08026CF0: .4byte 0xffbfffff
_08026CF4:
	movs r7, 0
	ldr r2, _08026D3C @ =gUnknown_2023E82
	strb r7, [r2, 0x5]
	ldr r1, _08026D40 @ =gActiveBattler
	movs r0, 0x1
	strb r0, [r1]
	mov r8, r1
	ldr r0, _08026D44 @ =gUnknown_2023BCC
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
_08026D3C: .4byte gUnknown_2023E82
_08026D40: .4byte gActiveBattler
_08026D44: .4byte gUnknown_2023BCC
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
	ldr r0, _08026D94 @ =gUnknown_2023BCC
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
	bl EmitReturnMonToBall
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	b _08026F4E
	.align 2, 0
_08026D94: .4byte gUnknown_2023BCC
_08026D98: .4byte gActiveBattler
_08026D9C: .4byte gBattleMons
_08026DA0:
	ldr r0, _08026F28 @ =gUnknown_2023E82
	movs r1, 0
	strb r1, [r0, 0x5]
	mov r8, r1
	movs r7, 0
	ldr r0, _08026F2C @ =gUnknown_2023BCC
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
	bl GetBankByIdentity
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
	bl EmitSetMonData
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	ldr r1, _08026F28 @ =gUnknown_2023E82
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
	bl GetBankByIdentity
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
	bl EmitSetMonData
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	ldr r1, _08026F28 @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08026F4E
	.align 2, 0
_08026F28: .4byte gUnknown_2023E82
_08026F2C: .4byte gUnknown_2023BCC
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
	ldr r1, _08026F64 @ =gUnknown_2023D74
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
_08026F64: .4byte gUnknown_2023D74
	thumb_func_end sub_8026AB0

	thumb_func_start atk77_setprotectlike
atk77_setprotectlike: @ 8026F68
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0x1
	ldr r2, _08027034 @ =gUnknown_2023DB0
	ldr r1, _08027038 @ =sBattler_AI
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
	ldr r0, _08027040 @ =gUnknown_2023BE2
	ldrb r1, [r0]
	ldr r0, _08027044 @ =gUnknown_2023BCC
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	bne _08026FA8
	movs r6, 0
_08026FA8:
	ldr r2, _08027048 @ =gUnknown_82507E0
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
	ldr r0, _08027054 @ =gUnknown_2023E8C
	ldrb r1, [r5]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _08027058 @ =gUnknown_2023E82
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
	ldr r0, _08027054 @ =gUnknown_2023E8C
	ldrb r1, [r5]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _08027058 @ =gUnknown_2023E82
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
_08027034: .4byte gUnknown_2023DB0
_08027038: .4byte sBattler_AI
_0802703C: .4byte gDisableStructs
_08027040: .4byte gUnknown_2023BE2
_08027044: .4byte gUnknown_2023BCC
_08027048: .4byte gUnknown_82507E0
_0802704C: .4byte gBattleMoves
_08027050: .4byte gCurrentMove
_08027054: .4byte gUnknown_2023E8C
_08027058: .4byte gUnknown_2023E82
_0802705C:
	ldr r2, _08027090 @ =gDisableStructs
	ldr r0, _08027094 @ =sBattler_AI
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strb r1, [r0, 0x8]
	ldr r1, _08027098 @ =gUnknown_2023E82
	movs r0, 0x2
	strb r0, [r1, 0x5]
	ldr r2, _0802709C @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_0802707E:
	ldr r1, _080270A0 @ =gUnknown_2023D74
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
_08027094: .4byte sBattler_AI
_08027098: .4byte gUnknown_2023E82
_0802709C: .4byte gMoveResultFlags
_080270A0: .4byte gUnknown_2023D74
	thumb_func_end atk77_setprotectlike

	thumb_func_start atk78_faintifabilitynotdamp
atk78_faintifabilitynotdamp: @ 80270A4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _08027160 @ =gUnknown_2023BC8
	ldr r2, [r0]
	cmp r2, 0
	bne _080271A8
	ldr r1, _08027164 @ =gBattlerTarget
	strb r2, [r1]
	ldr r0, _08027168 @ =gUnknown_2023BCC
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
	ldr r7, _08027174 @ =sBattler_AI
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
	bl EmitHealthBarUpdate
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	ldr r1, _08027180 @ =gUnknown_2023D74
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
_08027160: .4byte gUnknown_2023BC8
_08027164: .4byte gBattlerTarget
_08027168: .4byte gUnknown_2023BCC
_0802716C: .4byte gBattleMons
_08027170: .4byte gActiveBattler
_08027174: .4byte sBattler_AI
_08027178: .4byte gBattleMoveDamage
_0802717C: .4byte 0x00007fff
_08027180: .4byte gUnknown_2023D74
_08027184: .4byte gBitTable
_08027188: .4byte gAbsentBattlerFlags
_0802718C:
	ldr r1, _080271B4 @ =gUnknown_2023D6A
	movs r0, 0x6
	strb r0, [r1]
	ldrb r0, [r5]
	movs r1, 0x58
	muls r1, r0
	adds r1, r6
	adds r1, 0x20
	ldrb r1, [r1]
	bl sub_80C71D0
	ldr r1, _080271B8 @ =gUnknown_2023D74
	ldr r0, _080271BC @ =gUnknown_81D93AF
	str r0, [r1]
_080271A8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080271B4: .4byte gUnknown_2023D6A
_080271B8: .4byte gUnknown_2023D74
_080271BC: .4byte gUnknown_81D93AF
	thumb_func_end atk78_faintifabilitynotdamp

	thumb_func_start atk79_setatkhptozero
atk79_setatkhptozero: @ 80271C0
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0802720C @ =gUnknown_2023BC8
	ldr r3, [r0]
	cmp r3, 0
	bne _08027204
	ldr r4, _08027210 @ =gActiveBattler
	ldr r0, _08027214 @ =sBattler_AI
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
	bl EmitSetMonData
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	ldr r1, _0802721C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_08027204:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802720C: .4byte gUnknown_2023BC8
_08027210: .4byte gActiveBattler
_08027214: .4byte sBattler_AI
_08027218: .4byte gBattleMons
_0802721C: .4byte gUnknown_2023D74
	thumb_func_end atk79_setatkhptozero

	thumb_func_start atk7A_jumpifnexttargetvalid
atk7A_jumpifnexttargetvalid: @ 8027220
	push {r4-r7,lr}
	ldr r3, _08027298 @ =gUnknown_2023D74
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
	ldr r2, _080272A4 @ =sBattler_AI
	lsls r1, 24
	lsrs r1, 24
	adds r3, r0, 0
	ldr r6, _080272A8 @ =gAbsentBattlerFlags
	ldr r5, _080272AC @ =gBitTable
	ldr r0, _080272B0 @ =gUnknown_2023BCC
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
_08027298: .4byte gUnknown_2023D74
_0802729C: .4byte gBattleTypeFlags
_080272A0: .4byte gBattlerTarget
_080272A4: .4byte sBattler_AI
_080272A8: .4byte gAbsentBattlerFlags
_080272AC: .4byte gBitTable
_080272B0: .4byte gUnknown_2023BCC
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
	ldr r4, _08027320 @ =gUnknown_2023D74
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
	ldr r0, _08027328 @ =sBattler_AI
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
_08027320: .4byte gUnknown_2023D74
_08027324: .4byte gBattlerTarget
_08027328: .4byte sBattler_AI
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
	ldr r2, _080273E0 @ =gUnknown_2023BCC
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
	ldr r0, _080273E8 @ =sBattler_AI
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
	ldr r1, _080273E8 @ =sBattler_AI
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
	ldr r2, _080273F0 @ =gUnknown_2023DD0
	ldr r0, [r2]
	ldr r1, _080273F4 @ =0xfffffbff
	ands r0, r1
	str r0, [r2]
	ldr r4, _080273F8 @ =gCurrentMove
	strh r3, [r4]
	b _08027426
	.align 2, 0
_080273E0: .4byte gUnknown_2023BCC
_080273E4: .4byte gBattleStruct
_080273E8: .4byte sBattler_AI
_080273EC: .4byte 0x0000ffff
_080273F0: .4byte gUnknown_2023DD0
_080273F4: .4byte 0xfffffbff
_080273F8: .4byte gCurrentMove
_080273FC:
	mov r0, r8
	cmp r0, 0
	beq _0802746C
	ldr r2, _08027450 @ =gUnknown_2023DD0
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
	ldr r5, _08027460 @ =gUnknown_2023D74
	ldr r3, _08027464 @ =gUnknown_81D65A8
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
_08027450: .4byte gUnknown_2023DD0
_08027454: .4byte 0xfffffbff
_08027458: .4byte gCurrentMove
_0802745C: .4byte gBattlerTarget
_08027460: .4byte gUnknown_2023D74
_08027464: .4byte gUnknown_81D65A8
_08027468: .4byte gBattleMoves
_0802746C:
	ldr r2, _0802749C @ =gUnknown_2023ECC
	ldr r0, _080274A0 @ =sBattler_AI
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
	ldr r1, _080274A4 @ =gUnknown_2023D74
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
_0802749C: .4byte gUnknown_2023ECC
_080274A0: .4byte sBattler_AI
_080274A4: .4byte gUnknown_2023D74
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
	ldr r1, _080274D0 @ =gUnknown_2023E82
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _080274E4
	.align 2, 0
_080274C8: .4byte gBattleWeather
_080274CC: .4byte gMoveResultFlags
_080274D0: .4byte gUnknown_2023E82
_080274D4:
	movs r0, 0x1
	strh r0, [r2]
	ldr r0, _080274F0 @ =gUnknown_2023E82
	strb r1, [r0, 0x5]
	ldr r0, _080274F4 @ =gUnknown_2023F20
	adds r0, 0x28
	movs r1, 0x5
	strb r1, [r0]
_080274E4:
	ldr r1, _080274F8 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080274F0: .4byte gUnknown_2023E82
_080274F4: .4byte gUnknown_2023F20
_080274F8: .4byte gUnknown_2023D74
	thumb_func_end atk7D_setrain

	thumb_func_start atk7E_setreflect
atk7E_setreflect: @ 80274FC
	push {r4-r6,lr}
	ldr r6, _0802752C @ =sBattler_AI
	ldrb r0, [r6]
	bl GetBankIdentity
	ldr r4, _08027530 @ =gSideAffecting
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
	ldr r1, _08027538 @ =gUnknown_2023E82
	movs r0, 0
	b _080275B0
	.align 2, 0
_0802752C: .4byte sBattler_AI
_08027530: .4byte gSideAffecting
_08027534: .4byte gMoveResultFlags
_08027538: .4byte gUnknown_2023E82
_0802753C:
	ldrb r0, [r6]
	bl GetBankIdentity
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	ldrh r0, [r1]
	movs r2, 0x1
	orrs r0, r2
	strh r0, [r1]
	ldrb r0, [r6]
	bl GetBankIdentity
	ldr r4, _080275A0 @ =gUnknown_2023DE4
	adds r1, r5, 0
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x5
	strb r1, [r0]
	ldrb r0, [r6]
	bl GetBankIdentity
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
	bl sub_803F5B4
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bne _080275AC
	ldr r0, _080275A8 @ =gUnknown_2023E82
	strb r1, [r0, 0x5]
	b _080275B2
	.align 2, 0
_080275A0: .4byte gUnknown_2023DE4
_080275A4: .4byte gBattleTypeFlags
_080275A8: .4byte gUnknown_2023E82
_080275AC:
	ldr r1, _080275C0 @ =gUnknown_2023E82
	movs r0, 0x1
_080275B0:
	strb r0, [r1, 0x5]
_080275B2:
	ldr r1, _080275C4 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080275C0: .4byte gUnknown_2023E82
_080275C4: .4byte gUnknown_2023D74
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
	ldr r1, _08027614 @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08027668
	.align 2, 0
_08027608: .4byte gMoveResultFlags
_0802760C: .4byte gStatuses3
_08027610: .4byte gBattlerTarget
_08027614: .4byte gUnknown_2023E82
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
	ldr r1, _08027648 @ =gUnknown_2023E82
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _08027668
	.align 2, 0
_08027644: .4byte gBattleMons
_08027648: .4byte gUnknown_2023E82
_0802764C:
	ldr r0, _0802767C @ =sBattler_AI
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
	ldr r0, _08027680 @ =gUnknown_2023E82
	strb r3, [r0, 0x5]
_08027668:
	ldr r1, _08027684 @ =gUnknown_2023D74
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
_0802767C: .4byte sBattler_AI
_08027680: .4byte gUnknown_2023E82
_08027684: .4byte gUnknown_2023D74
	thumb_func_end atk7F_setseeded

	thumb_func_start atk80_manipulatedamage
atk80_manipulatedamage: @ 8027688
	push {r4,lr}
	ldr r1, _080276A0 @ =gUnknown_2023D74
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
_080276A0: .4byte gUnknown_2023D74
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
	ldr r0, _08027760 @ =gUnknown_2023D74
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
	ldr r0, _0802776C @ =sBattler_AI
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
_08027760: .4byte gUnknown_2023D74
_08027764: .4byte gActiveBattler
_08027768: .4byte gBattlerTarget
_0802776C: .4byte sBattler_AI
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
	ldr r1, _08027790 @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08027798
	.align 2, 0
_08027790: .4byte gUnknown_2023E82
_08027794:
	ldr r0, _080277D0 @ =gUnknown_2023E82
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
	bl EmitSetMonData
	ldrb r0, [r7]
	bl MarkBufferBankForExecution
	ldr r1, _080277D4 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_080277C8:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080277D0: .4byte gUnknown_2023E82
_080277D4: .4byte gUnknown_2023D74
	thumb_func_end atk81_trysetrest

	thumb_func_start atk82_jumpifnotfirstturn
atk82_jumpifnotfirstturn: @ 80277D8
	push {r4,r5,lr}
	ldr r5, _0802780C @ =gUnknown_2023D74
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
	ldr r0, _08027814 @ =sBattler_AI
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
_0802780C: .4byte gUnknown_2023D74
_08027810: .4byte gDisableStructs
_08027814: .4byte sBattler_AI
_08027818:
	str r3, [r5]
_0802781A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end atk82_jumpifnotfirstturn

	thumb_func_start atk83_nop
atk83_nop: @ 8027820
	ldr r1, _0802782C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_0802782C: .4byte gUnknown_2023D74
	thumb_func_end atk83_nop

	thumb_func_start UproarWakeUpCheck
UproarWakeUpCheck: @ 8027830
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r2, 0
	ldr r0, _08027888 @ =gUnknown_2023BCC
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
	ldr r7, _08027894 @ =gUnknown_2023E82
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
_08027888: .4byte gUnknown_2023BCC
_0802788C: .4byte gBattleMons
_08027890: .4byte gBattleScripting
_08027894: .4byte gUnknown_2023E82
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
	ldr r0, _080278B8 @ =gUnknown_2023E82
	strb r3, [r0, 0x5]
	b _080278A4
	.align 2, 0
_080278B8: .4byte gUnknown_2023E82
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
	ldr r5, _080278F8 @ =gUnknown_2023D74
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
_080278F8: .4byte gUnknown_2023D74
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
	ldr r2, _08027934 @ =gUnknown_2023D6A
	strb r0, [r2]
	ldr r1, _08027938 @ =gUnknown_2023E82
	movs r0, 0x2
	strb r0, [r1, 0x5]
	str r4, [r5]
	ldrb r1, [r2]
	adds r0, r3, 0
	bl sub_80C71D0
	b _08027942
	.align 2, 0
_08027930: .4byte gBattleMons
_08027934: .4byte gUnknown_2023D6A
_08027938: .4byte gUnknown_2023E82
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
	ldr r4, _08027974 @ =sBattler_AI
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
	ldr r1, _0802797C @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _080279AA
	.align 2, 0
_08027970: .4byte gDisableStructs
_08027974: .4byte sBattler_AI
_08027978: .4byte gMoveResultFlags
_0802797C: .4byte gUnknown_2023E82
_08027980:
	adds r0, 0x1
	movs r3, 0
	strb r0, [r1, 0x9]
	ldr r2, _080279B8 @ =gUnknown_2022AB8
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
	ldr r0, _080279BC @ =gUnknown_2023E82
	strb r3, [r0, 0x5]
_080279AA:
	ldr r1, _080279C0 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080279B8: .4byte gUnknown_2022AB8
_080279BC: .4byte gUnknown_2023E82
_080279C0: .4byte gUnknown_2023D74
	thumb_func_end atk85_stockpile

	thumb_func_start atk86_stockpiletobasedamage
atk86_stockpiletobasedamage: @ 80279C4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	ldr r3, _080279FC @ =gUnknown_2023D74
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
	ldr r6, _08027A04 @ =sBattler_AI
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
_080279FC: .4byte gUnknown_2023D74
_08027A00: .4byte gDisableStructs
_08027A04: .4byte sBattler_AI
_08027A08:
	ldr r0, _08027AB8 @ =gUnknown_2023E82
	ldrb r0, [r0, 0x6]
	cmp r0, 0x1
	beq _08027A90
	ldr r0, _08027ABC @ =gBattleMoveDamage
	mov r8, r0
	ldr r4, _08027AC0 @ =gSideAffecting
	ldr r5, _08027AC4 @ =gBattlerTarget
	ldrb r0, [r5]
	bl GetBankIdentity
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
	bl sub_803ECEC
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
	ldr r1, _08027AD4 @ =gUnknown_2023E8C
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
	ldr r0, _08027ADC @ =sBattler_AI
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strb r1, [r0, 0x9]
	ldr r1, _08027AE0 @ =gUnknown_2023D74
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
_08027AB8: .4byte gUnknown_2023E82
_08027ABC: .4byte gBattleMoveDamage
_08027AC0: .4byte gSideAffecting
_08027AC4: .4byte gBattlerTarget
_08027AC8: .4byte gBattleMons
_08027ACC: .4byte gCurrentMove
_08027AD0: .4byte gBattleScripting
_08027AD4: .4byte gUnknown_2023E8C
_08027AD8: .4byte gDisableStructs
_08027ADC: .4byte sBattler_AI
_08027AE0: .4byte gUnknown_2023D74
	thumb_func_end atk86_stockpiletobasedamage

	thumb_func_start atk87_stockpiletohpheal
atk87_stockpiletohpheal: @ 8027AE4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r7, _08027B24 @ =gUnknown_2023D74
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
	ldr r6, _08027B2C @ =sBattler_AI
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
	ldr r0, _08027B30 @ =gUnknown_2023E82
	strb r1, [r0, 0x5]
	b _08027BB0
	.align 2, 0
_08027B24: .4byte gUnknown_2023D74
_08027B28: .4byte gDisableStructs
_08027B2C: .4byte sBattler_AI
_08027B30: .4byte gUnknown_2023E82
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
	ldr r1, _08027B60 @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08027BB0
	.align 2, 0
_08027B58: .4byte gBattleMons
_08027B5C: .4byte gBattlerTarget
_08027B60: .4byte gUnknown_2023E82
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
	ldr r0, _08027BF4 @ =gUnknown_2023D54
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
	ldr r1, _08027BF8 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08027BF0: .4byte gBattleMoveDamage
_08027BF4: .4byte gUnknown_2023D54
_08027BF8: .4byte gUnknown_2023D74
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
	ldr r1, _08027C2C @ =sBattler_AI
	b _08027C34
	.align 2, 0
_08027C28: .4byte gActiveBattler
_08027C2C: .4byte sBattler_AI
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
	ldr r1, _08027CDC @ =gUnknown_2022AB8
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
	ldr r4, _08027CE0 @ =gUnknown_2023DE4
	ldr r1, _08027CD4 @ =gActiveBattler
	ldrb r0, [r1]
	bl GetBankIdentity
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
	ldr r4, _08027CE8 @ =gUnknown_2023ECC
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
	ldr r0, _08027CEC @ =gUnknown_2023D74
	mov r4, r8
	str r4, [r0]
	b _08027D48
	.align 2, 0
_08027CD4: .4byte gActiveBattler
_08027CD8: .4byte gBattlerTarget
_08027CDC: .4byte gUnknown_2022AB8
_08027CE0: .4byte gUnknown_2023DE4
_08027CE4: .4byte gCurrentMove
_08027CE8: .4byte gUnknown_2023ECC
_08027CEC: .4byte gUnknown_2023D74
_08027CF0:
	mov r0, r8
	bl BattleScriptPush
	ldr r1, _08027D18 @ =gBattleScripting
	ldr r6, _08027D1C @ =gActiveBattler
	ldrb r0, [r6]
	strb r0, [r1, 0x17]
	ldr r1, _08027D20 @ =gUnknown_2023D74
	ldr r0, _08027D24 @ =gUnknown_81D8C3E
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
_08027D20: .4byte gUnknown_2023D74
_08027D24: .4byte gUnknown_81D8C3E
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
	ldr r1, _08027D50 @ =gUnknown_2023D74
	ldr r0, _08027D54 @ =gUnknown_81D7DF2
	str r0, [r1]
_08027D48:
	movs r0, 0x1
	b _08028060
	.align 2, 0
_08027D4C: .4byte gCurrentMove
_08027D50: .4byte gUnknown_2023D74
_08027D54: .4byte gUnknown_81D7DF2
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
	ldr r4, _08027DAC @ =gUnknown_2023ECC
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _08027DB4
	ldr r0, _08027DB0 @ =gUnknown_2023D74
	mov r1, r8
	str r1, [r0]
	b _08027D48
	.align 2, 0
_08027DA0: .4byte gBattleMons
_08027DA4: .4byte gActiveBattler
_08027DA8: .4byte gCurrentMove
_08027DAC: .4byte gUnknown_2023ECC
_08027DB0: .4byte gUnknown_2023D74
_08027DB4:
	mov r0, r8
	bl BattleScriptPush
	ldr r1, _08027DF8 @ =gBattleScripting
	ldr r2, _08027DFC @ =gActiveBattler
	ldrb r0, [r2]
	strb r0, [r1, 0x17]
	ldr r1, _08027E00 @ =gUnknown_2023D74
	ldr r0, _08027E04 @ =gUnknown_81D9416
	str r0, [r1]
	ldr r1, _08027E08 @ =gUnknown_2023D6A
	ldrb r0, [r2]
	movs r3, 0x58
	muls r0, r3
	add r0, r10
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r2]
	ldrb r1, [r1]
	bl sub_80C71D0
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
_08027E00: .4byte gUnknown_2023D74
_08027E04: .4byte gUnknown_81D9416
_08027E08: .4byte gUnknown_2023D6A
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
	ldr r1, _08027E60 @ =gUnknown_2023D74
	ldr r0, _08027E64 @ =gUnknown_81D947E
	str r0, [r1]
	ldr r1, _08027E68 @ =gUnknown_2023D6A
	ldrb r0, [r3]
	muls r0, r4
	add r0, r10
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r3]
	ldrb r1, [r1]
	bl sub_80C71D0
	b _08027D48
	.align 2, 0
_08027E58: .4byte gActiveBattler
_08027E5C: .4byte gBattleScripting
_08027E60: .4byte gUnknown_2023D74
_08027E64: .4byte gUnknown_81D947E
_08027E68: .4byte gUnknown_2023D6A
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
	ldr r1, _08027EC4 @ =gUnknown_2023D74
	ldr r0, _08027EC8 @ =gUnknown_81D947E
	str r0, [r1]
	ldr r1, _08027ECC @ =gUnknown_2023D6A
	ldrb r0, [r2]
	muls r0, r4
	add r0, r10
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r2]
	ldrb r1, [r1]
	bl sub_80C71D0
	b _08027D48
	.align 2, 0
_08027EBC: .4byte gActiveBattler
_08027EC0: .4byte gBattleScripting
_08027EC4: .4byte gUnknown_2023D74
_08027EC8: .4byte gUnknown_81D947E
_08027ECC: .4byte gUnknown_2023D6A
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
	ldr r3, _08027F60 @ =gUnknown_2022AC8
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
	ldr r3, _08027F68 @ =gUnknown_2023E82
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
_08027F60: .4byte gUnknown_2022AC8
_08027F64: .4byte gBattlerTarget
_08027F68: .4byte gUnknown_2023E82
_08027F6C:
	asrs r6, r0, 28
	movs r0, 0x7
	ands r6, r0
	ldr r3, _08027FCC @ =gUnknown_2022AC8
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
	ldr r1, _08027FD8 @ =gUnknown_2023E82
	movs r0, 0x2
	strb r0, [r1, 0x5]
	mov r8, r1
	b _08027FF0
	.align 2, 0
_08027FCC: .4byte gUnknown_2022AC8
_08027FD0: .4byte gBattleMons
_08027FD4: .4byte gActiveBattler
_08027FD8: .4byte gUnknown_2023E82
_08027FDC:
	movs r1, 0
	ldr r0, _08028070 @ =gBattlerTarget
	ldrb r0, [r0]
	ldr r2, _08028074 @ =gUnknown_2023E82
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
_08028074: .4byte gUnknown_2023E82
_08028078: .4byte gActiveBattler
_0802807C: .4byte gMoveResultFlags
	thumb_func_end ChangeStatBuffs

	thumb_func_start atk89_statbuffchange
atk89_statbuffchange: @ 8028080
	push {r4,r5,lr}
	ldr r5, _080280C4 @ =gUnknown_2023D74
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
_080280C4: .4byte gUnknown_2023D74
_080280C8: .4byte gBattleScripting
	thumb_func_end atk89_statbuffchange

	thumb_func_start atk8A_normalisebuffs
atk8A_normalisebuffs: @ 80280CC
	push {r4-r7,lr}
	movs r2, 0
	ldr r0, _08028114 @ =gUnknown_2023BCC
	ldrb r1, [r0]
	ldr r0, _08028118 @ =gUnknown_2023D74
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
_08028114: .4byte gUnknown_2023BCC
_08028118: .4byte gUnknown_2023D74
_0802811C: .4byte gBattleMons
	thumb_func_end atk8A_normalisebuffs

	thumb_func_start atk8B_setbide
atk8B_setbide: @ 8028120
	push {r4,r5,lr}
	ldr r4, _08028178 @ =gBattleMons
	ldr r3, _0802817C @ =sBattler_AI
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
	ldr r1, _08028180 @ =gUnknown_2023DB8
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r1
	ldr r1, _08028184 @ =gCurrentMove
	ldrh r1, [r1]
	movs r2, 0
	strh r1, [r0]
	ldr r1, _08028188 @ =gUnknown_2023D58
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
	ldr r1, _0802818C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028178: .4byte gBattleMons
_0802817C: .4byte sBattler_AI
_08028180: .4byte gUnknown_2023DB8
_08028184: .4byte gCurrentMove
_08028188: .4byte gUnknown_2023D58
_0802818C: .4byte gUnknown_2023D74
	thumb_func_end atk8B_setbide

	thumb_func_start atk8C_confuseifrepeatingattackends
atk8C_confuseifrepeatingattackends: @ 8028190
	push {lr}
	ldr r1, _080281C0 @ =gBattleMons
	ldr r0, _080281C4 @ =sBattler_AI
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
	ldr r1, _080281C8 @ =gUnknown_2023E82
	movs r0, 0x75
	strb r0, [r1, 0x3]
_080281B2:
	ldr r1, _080281CC @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080281C0: .4byte gBattleMons
_080281C4: .4byte sBattler_AI
_080281C8: .4byte gUnknown_2023E82
_080281CC: .4byte gUnknown_2023D74
	thumb_func_end atk8C_confuseifrepeatingattackends

	thumb_func_start atk8D_setmultihitcounter
atk8D_setmultihitcounter: @ 80281D0
	push {r4,r5,lr}
	ldr r0, _080281E4 @ =gUnknown_2023D74
	ldr r0, [r0]
	ldrb r1, [r0, 0x1]
	cmp r1, 0
	beq _080281EC
	ldr r0, _080281E8 @ =gUnknown_2023D72
	strb r1, [r0]
	b _08028206
	.align 2, 0
_080281E4: .4byte gUnknown_2023D74
_080281E8: .4byte gUnknown_2023D72
_080281EC:
	ldr r4, _08028214 @ =gUnknown_2023D72
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
	ldr r1, _08028218 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028214: .4byte gUnknown_2023D72
_08028218: .4byte gUnknown_2023D74
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
	ldr r1, _08028240 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_0802823C: .4byte gBattleScripting
_08028240: .4byte gUnknown_2023D74
	thumb_func_end atk8E_initmultihitstring

	thumb_func_start TryDoForceSwitchOut
TryDoForceSwitchOut: @ 8028244
	push {r4-r7,lr}
	ldr r6, _08028278 @ =gBattleMons
	ldr r7, _0802827C @ =sBattler_AI
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
_0802827C: .4byte sBattler_AI
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
	ldr r3, _080282D8 @ =gUnknown_2023D74
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
_080282D8: .4byte gUnknown_2023D74
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
	ldr r1, _08028304 @ =gUnknown_2023D74
	ldr r0, _08028308 @ =gUnknown_81D8C10
	str r0, [r1]
	movs r0, 0x1
_080282F6:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080282FC: .4byte gBattleStruct
_08028300: .4byte gBattlerPartyIndexes
_08028304: .4byte gUnknown_2023D74
_08028308: .4byte gUnknown_81D8C10
	thumb_func_end TryDoForceSwitchOut

	thumb_func_start sub_802830C
sub_802830C: @ 802830C
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
	bl GetBankSide
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
	bl GetBankMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043620
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
	ldr r3, _0802843C @ =gUnknown_2023D74
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
_0802843C: .4byte gUnknown_2023D74
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
	bl GetBankMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043620
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
	bl sub_811FA20
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
	thumb_func_end sub_802830C

	thumb_func_start atk90_tryconversiontypechange
atk90_tryconversiontypechange: @ 8028604
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r6, 0
	ldr r2, _08028698 @ =gBattleMons
	ldr r3, _0802869C @ =sBattler_AI
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
	ldr r7, _0802869C @ =sBattler_AI
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
_0802869C: .4byte sBattler_AI
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
	ldr r3, _080286E8 @ =gUnknown_2023D74
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
_080286E8: .4byte gUnknown_2023D74
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
	ldr r3, _0802874C @ =sBattler_AI
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
_0802874C: .4byte sBattler_AI
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
	ldr r1, _080287A0 @ =gUnknown_2022AB8
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x3
	strb r0, [r1, 0x1]
	strb r2, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r1, _080287A4 @ =gUnknown_2023D74
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
_080287A0: .4byte gUnknown_2022AB8
_080287A4: .4byte gUnknown_2023D74
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
	ldr r1, _08028810 @ =gUnknown_2023E7E
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
	ldr r1, _0802881C @ =gUnknown_2022AB8
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
	ldr r4, _08028820 @ =gUnknown_2023D74
	ldr r0, [r4]
	adds r0, 0x1
	bl BattleScriptPush
	ldr r0, _08028824 @ =gUnknown_81D911D
	str r0, [r4]
	b _08028830
	.align 2, 0
_0802880C: .4byte gBattleTypeFlags
_08028810: .4byte gUnknown_2023E7E
_08028814: .4byte gBattleStruct
_08028818: .4byte gSaveBlock1Ptr
_0802881C: .4byte gUnknown_2022AB8
_08028820: .4byte gUnknown_2023D74
_08028824: .4byte gUnknown_81D911D
_08028828:
	ldr r1, _08028838 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_08028830:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028838: .4byte gUnknown_2023D74
	thumb_func_end atk91_givepaydaymoney

	thumb_func_start atk92_setlightscreen
atk92_setlightscreen: @ 802883C
	push {r4-r6,lr}
	ldr r5, _0802886C @ =sBattler_AI
	ldrb r0, [r5]
	bl GetBankIdentity
	ldr r4, _08028870 @ =gSideAffecting
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
	ldr r1, _08028878 @ =gUnknown_2023E82
	movs r0, 0
	b _080288F0
	.align 2, 0
_0802886C: .4byte sBattler_AI
_08028870: .4byte gSideAffecting
_08028874: .4byte gMoveResultFlags
_08028878: .4byte gUnknown_2023E82
_0802887C:
	ldrb r0, [r5]
	bl GetBankIdentity
	adds r1, r6, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	ldrh r0, [r1]
	movs r2, 0x2
	orrs r0, r2
	strh r0, [r1]
	ldrb r0, [r5]
	bl GetBankIdentity
	ldr r4, _080288E0 @ =gUnknown_2023DE4
	adds r1, r6, 0
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x5
	strb r1, [r0, 0x2]
	ldrb r0, [r5]
	bl GetBankIdentity
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
	bl sub_803F5B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080288EC
	ldr r1, _080288E8 @ =gUnknown_2023E82
	movs r0, 0x4
	b _080288F0
	.align 2, 0
_080288E0: .4byte gUnknown_2023DE4
_080288E4: .4byte gBattleTypeFlags
_080288E8: .4byte gUnknown_2023E82
_080288EC:
	ldr r1, _08028900 @ =gUnknown_2023E82
	movs r0, 0x3
_080288F0:
	strb r0, [r1, 0x5]
	ldr r1, _08028904 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08028900: .4byte gUnknown_2023E82
_08028904: .4byte gUnknown_2023D74
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
	ldr r1, _0802893C @ =gUnknown_2023F54
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
_0802893C: .4byte gUnknown_2023F54
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
	ldr r1, _080289D4 @ =gUnknown_2023D6F
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
	bl sub_80C7208
	ldr r2, _080289DC @ =gUnknown_2023ECC
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
	ldr r0, _080289E8 @ =gUnknown_2023D6A
	strb r4, [r0]
	ldr r1, _080289EC @ =gUnknown_2023D74
	ldr r0, _080289F0 @ =gUnknown_81D93A1
	str r0, [r1]
	mov r1, r9
	ldrb r0, [r1]
	movs r1, 0x5
	bl sub_80C71D0
	b _08028C48
	.align 2, 0
_080289D4: .4byte gUnknown_2023D6F
_080289D8: .4byte gBattlerTarget
_080289DC: .4byte gUnknown_2023ECC
_080289E0: .4byte gBattleMons
_080289E4: .4byte gMoveResultFlags
_080289E8: .4byte gUnknown_2023D6A
_080289EC: .4byte gUnknown_2023D74
_080289F0: .4byte gUnknown_81D93A1
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
	ldr r7, _08028A74 @ =sBattler_AI
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
_08028A74: .4byte sBattler_AI
_08028A78:
	ldr r1, _08028B44 @ =gDisableStructs
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldr r1, _08028B48 @ =sBattler_AI
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
	ldr r0, _08028B5C @ =gUnknown_2023E8C
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
_08028B48: .4byte sBattler_AI
_08028B4C: .4byte gBattleMoves
_08028B50: .4byte gCurrentMove
_08028B54: .4byte gBattleMons
_08028B58: .4byte gBattlerTarget
_08028B5C: .4byte gUnknown_2023E8C
_08028B60: .4byte gBattleMoveDamage
_08028B64: .4byte gMoveResultFlags
_08028B68:
	ldr r0, _08028BA4 @ =gUnknown_2023ECC
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
	ldr r1, _08028BB0 @ =gUnknown_2023D68
	mov r2, r9
	ldrb r0, [r2]
	muls r0, r3
	add r0, r8
	ldrh r0, [r0, 0x2E]
	strh r0, [r1]
	b _08028BCA
	.align 2, 0
_08028BA4: .4byte gUnknown_2023ECC
_08028BA8: .4byte gBattleMoveDamage
_08028BAC: .4byte gMoveResultFlags
_08028BB0: .4byte gUnknown_2023D68
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
	ldr r1, _08028BDC @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08028C48
	.align 2, 0
_08028BD4: .4byte gBattleMoveDamage
_08028BD8: .4byte gMoveResultFlags
_08028BDC: .4byte gUnknown_2023D74
_08028BE0:
	ldr r2, _08028C14 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r3, _08028C18 @ =gBattleMons
	ldr r0, _08028C1C @ =sBattler_AI
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
	ldr r1, _08028C24 @ =gUnknown_2023E82
	movs r0, 0
	b _08028C2C
	.align 2, 0
_08028C14: .4byte gMoveResultFlags
_08028C18: .4byte gBattleMons
_08028C1C: .4byte sBattler_AI
_08028C20: .4byte gBattlerTarget
_08028C24: .4byte gUnknown_2023E82
_08028C28:
	ldr r1, _08028C54 @ =gUnknown_2023E82
	movs r0, 0x1
_08028C2C:
	strb r0, [r1, 0x5]
	ldr r3, _08028C58 @ =gUnknown_2023D74
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
_08028C54: .4byte gUnknown_2023E82
_08028C58: .4byte gUnknown_2023D74
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
	ldr r1, _08028C94 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08028C88: .4byte gBattleMoveDamage
_08028C8C: .4byte gBattleMons
_08028C90: .4byte gBattlerTarget
_08028C94: .4byte gUnknown_2023D74
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
	ldr r1, _08028CC0 @ =gUnknown_2023E82
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _08028CD6
	.align 2, 0
_08028CB8: .4byte gBattleWeather
_08028CBC: .4byte gMoveResultFlags
_08028CC0: .4byte gUnknown_2023E82
_08028CC4:
	movs r0, 0x8
	strh r0, [r2]
	ldr r1, _08028CE4 @ =gUnknown_2023E82
	movs r0, 0x3
	strb r0, [r1, 0x5]
	ldr r0, _08028CE8 @ =gUnknown_2023F20
	adds r0, 0x28
	movs r1, 0x5
	strb r1, [r0]
_08028CD6:
	ldr r1, _08028CEC @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08028CE4: .4byte gUnknown_2023E82
_08028CE8: .4byte gUnknown_2023F20
_08028CEC: .4byte gUnknown_2023D74
	thumb_func_end atk95_setsandstorm

	thumb_func_start sub_8028CF0
sub_8028CF0: @ 8028CF0
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
	ldr r0, _08028DC0 @ =sBattler_AI
	ldrb r0, [r0]
	bl GetBankSide
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
	bl sub_8019F18
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
	bl sub_8019F18
	lsls r0, 24
	cmp r0, 0
	beq _08028D48
	b _08028E48
_08028D48:
	ldr r2, _08028DC4 @ =gBattleWeather
	ldrh r1, [r2]
	movs r0, 0x18
	ands r0, r1
	ldr r5, _08028DC0 @ =sBattler_AI
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
_08028DC0: .4byte sBattler_AI
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
	ldr r5, _08028E80 @ =sBattler_AI
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
	ldr r1, _08028E8C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028E7C: .4byte gBattleMoveDamage
_08028E80: .4byte sBattler_AI
_08028E84: .4byte gAbsentBattlerFlags
_08028E88: .4byte gBitTable
_08028E8C: .4byte gUnknown_2023D74
	thumb_func_end sub_8028CF0

	thumb_func_start sub_8028E90
sub_8028E90: @ 8028E90
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, _08028EBC @ =sBattler_AI
	ldrb r0, [r4]
	bl GetBankSide
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
_08028EBC: .4byte sBattler_AI
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
	bl GetBankSide
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
	ldr r1, _08028F88 @ =gUnknown_2023D74
	ldr r0, _08028F8C @ =gUnknown_81D9444
	str r0, [r1]
	ldr r0, _08028F90 @ =gUnknown_2023D6A
	strb r2, [r0]
	ldrb r0, [r5]
	movs r1, 0xC
	bl sub_80C71D0
	b _0802902C
	.align 2, 0
_08028F78: .4byte gBattlerPartyIndexes
_08028F7C: .4byte gEnemyParty
_08028F80: .4byte gBattlerTarget
_08028F84: .4byte gBattleMons
_08028F88: .4byte gUnknown_2023D74
_08028F8C: .4byte gUnknown_81D9444
_08028F90: .4byte gUnknown_2023D6A
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
	ldr r3, _08029004 @ =gUnknown_2023D74
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
_08029004: .4byte gUnknown_2023D74
_08029008:
	ldrb r0, [r5]
	adds r2, r0, 0
	muls r2, r6
	adds r2, r4
	ldr r1, _0802903C @ =gBitTable
	ldr r0, _08029040 @ =sBattler_AI
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r1, 16
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r1, _08029044 @ =gUnknown_2023D74
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
_08029040: .4byte sBattler_AI
_08029044: .4byte gUnknown_2023D74
	thumb_func_end sub_8028E90

	thumb_func_start sub_8029048
sub_8029048: @ 8029048
	push {r4-r7,lr}
	ldr r0, _080290B8 @ =gUnknown_2023BC8
	ldr r1, [r0]
	cmp r1, 0
	beq _08029054
	b _080291C0
_08029054:
	ldr r5, _080290BC @ =gUnknown_2023D74
	ldr r2, [r5]
	ldrb r0, [r2, 0x1]
	cmp r0, 0xD
	bne _080290D4
	ldr r2, _080290C0 @ =gActiveBattler
	strb r1, [r2]
	ldr r0, _080290C4 @ =gUnknown_2023BCC
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
	bl EmitStatusIconUpdate
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_080290A2:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _080290C4 @ =gUnknown_2023BCC
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08029074
	b _08029164
	.align 2, 0
_080290B8: .4byte gUnknown_2023BC8
_080290BC: .4byte gUnknown_2023D74
_080290C0: .4byte gActiveBattler
_080290C4: .4byte gUnknown_2023BCC
_080290C8: .4byte gBitTable
_080290CC: .4byte gBattleMons
_080290D0: .4byte gAbsentBattlerFlags
_080290D4:
	cmp r0, 0x4
	bne _0802918C
	ldr r4, _08029170 @ =gActiveBattler
	ldr r5, _08029174 @ =sBattler_AI
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
	bl EmitStatusIconUpdate
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_08029114:
	ldr r0, _08029184 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08029164
	ldrb r0, [r5]
	bl GetBankIdentity
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByIdentity
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
	bl EmitStatusIconUpdate
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_08029164:
	ldr r1, _08029188 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	b _080291C0
	.align 2, 0
_08029170: .4byte gActiveBattler
_08029174: .4byte sBattler_AI
_08029178: .4byte gAbsentBattlerFlags
_0802917C: .4byte gBitTable
_08029180: .4byte gBattleMons
_08029184: .4byte gBattleTypeFlags
_08029188: .4byte gUnknown_2023D74
_0802918C:
	ldrb r0, [r2, 0x1]
	bl sub_8016E24
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
	bl EmitStatusIconUpdate
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
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
	thumb_func_end sub_8029048

	thumb_func_start atk99_setmist
atk99_setmist: @ 80291D0
	push {r4-r6,lr}
	ldr r6, _08029200 @ =gUnknown_2023DE4
	ldr r4, _08029204 @ =sBattler_AI
	ldrb r0, [r4]
	bl GetBankIdentity
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
	ldr r0, _0802920C @ =gUnknown_2023E82
	strb r5, [r0, 0x5]
	b _0802925E
	.align 2, 0
_08029200: .4byte gUnknown_2023DE4
_08029204: .4byte sBattler_AI
_08029208: .4byte gMoveResultFlags
_0802920C: .4byte gUnknown_2023E82
_08029210:
	ldrb r0, [r4]
	bl GetBankIdentity
	adds r1, r5, 0
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x5
	strb r1, [r0, 0x4]
	ldrb r0, [r4]
	bl GetBankIdentity
	adds r1, r5, 0
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r4]
	strb r1, [r0, 0x5]
	ldrb r0, [r4]
	bl GetBankIdentity
	ldr r2, _0802926C @ =gSideAffecting
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
	ldr r0, _08029270 @ =gUnknown_2023E82
	strb r3, [r0, 0x5]
_0802925E:
	ldr r1, _08029274 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802926C: .4byte gSideAffecting
_08029270: .4byte gUnknown_2023E82
_08029274: .4byte gUnknown_2023D74
	thumb_func_end atk99_setmist

	thumb_func_start atk9A_setfocusenergy
atk9A_setfocusenergy: @ 8029278
	push {lr}
	ldr r1, _080292A8 @ =gBattleMons
	ldr r0, _080292AC @ =sBattler_AI
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
	ldr r1, _080292B4 @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _080292C0
	.align 2, 0
_080292A8: .4byte gBattleMons
_080292AC: .4byte sBattler_AI
_080292B0: .4byte gMoveResultFlags
_080292B4: .4byte gUnknown_2023E82
_080292B8:
	orrs r1, r3
	str r1, [r0]
	ldr r0, _080292CC @ =gUnknown_2023E82
	strb r2, [r0, 0x5]
_080292C0:
	ldr r1, _080292D0 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080292CC: .4byte gUnknown_2023E82
_080292D0: .4byte gUnknown_2023D74
	thumb_func_end atk9A_setfocusenergy

	thumb_func_start atk9B_transformdataexecution
atk9B_transformdataexecution: @ 80292D4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r1, _0802932C @ =gUnknown_2023D4C
	ldr r2, _08029330 @ =0x0000ffff
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08029334 @ =gUnknown_2023D74
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
	ldr r1, _0802934C @ =gUnknown_2023E82
	movs r0, 0x1
	b _08029464
	.align 2, 0
_0802932C: .4byte gUnknown_2023D4C
_08029330: .4byte 0x0000ffff
_08029334: .4byte gUnknown_2023D74
_08029338: .4byte gBattleMons
_0802933C: .4byte gBattlerTarget
_08029340: .4byte gStatuses3
_08029344: .4byte 0x000400c0
_08029348: .4byte gMoveResultFlags
_0802934C: .4byte gUnknown_2023E82
_08029350:
	ldr r3, _08029424 @ =sBattler_AI
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
	ldr r1, _0802942C @ =gUnknown_2022AB8
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
_08029424: .4byte sBattler_AI
_08029428: .4byte gDisableStructs
_0802942C: .4byte gUnknown_2022AB8
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
	bl EmitResetActionMoveSelection
	mov r2, r8
	ldrb r0, [r2]
	bl MarkBufferBankForExecution
	ldr r1, _08029470 @ =gUnknown_2023E82
	movs r0, 0
_08029464:
	strb r0, [r1, 0x5]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08029470: .4byte gUnknown_2023E82
	thumb_func_end atk9B_transformdataexecution

	thumb_func_start atk9C_setsubstitute
atk9C_setsubstitute: @ 8029474
	push {r4-r7,lr}
	ldr r7, _080294A4 @ =gBattleMons
	ldr r6, _080294A8 @ =sBattler_AI
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
	ldr r1, _080294B0 @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08029508
	.align 2, 0
_080294A4: .4byte gBattleMons
_080294A8: .4byte sBattler_AI
_080294AC: .4byte gBattleMoveDamage
_080294B0: .4byte gUnknown_2023E82
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
	ldr r0, _08029524 @ =gUnknown_2023E82
	strb r2, [r0, 0x5]
	ldr r2, _08029528 @ =gUnknown_2023DD0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 1
	orrs r0, r1
	str r0, [r2]
_08029508:
	ldr r1, _0802952C @ =gUnknown_2023D74
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
_08029524: .4byte gUnknown_2023E82
_08029528: .4byte gUnknown_2023DD0
_0802952C: .4byte gUnknown_2023D74
	thumb_func_end atk9C_setsubstitute

	thumb_func_start IsMoveUncopyableByMimic
IsMoveUncopyableByMimic: @ 8029530
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r3, 0
	ldr r0, _08029570 @ =gUnknown_82507E8
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
_08029570: .4byte gUnknown_82507E8
_08029574: .4byte 0x0000fffe
	thumb_func_end IsMoveUncopyableByMimic

	thumb_func_start atk9D_mimicattackcopy
atk9D_mimicattackcopy: @ 8029578
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _080295F0 @ =gUnknown_2023D4C
	ldr r1, _080295F4 @ =0x0000ffff
	adds r7, r1, 0
	strh r7, [r0]
	ldr r5, _080295F8 @ =gLastUsedMove
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
	ldr r2, _08029604 @ =sBattler_AI
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
	ldr r3, _08029608 @ =gUnknown_2023D74
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
_080295F0: .4byte gUnknown_2023D4C
_080295F4: .4byte 0x0000ffff
_080295F8: .4byte gLastUsedMove
_080295FC: .4byte gBattlerTarget
_08029600: .4byte gBattleMons
_08029604: .4byte sBattler_AI
_08029608: .4byte gUnknown_2023D74
_0802960C:
	movs r2, 0
	mov r3, r12
	adds r3, 0xC
	adds r0, r4, r3
	ldrh r0, [r0]
	ldr r4, _0802969C @ =gUnknown_2023D74
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
	ldr r5, _080296A0 @ =gUnknown_2023D48
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
	ldr r2, _080296A4 @ =gLastUsedMove
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
_0802969C: .4byte gUnknown_2023D74
_080296A0: .4byte gUnknown_2023D48
_080296A4: .4byte gLastUsedMove
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
	ldr r1, _0802971C @ =gUnknown_2022AB8
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
_0802971C: .4byte gUnknown_2022AB8
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
	ldr r5, _080297D8 @ =gUnknown_82507E8
	ldr r0, _080297DC @ =gUnknown_2023D74
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
	ldr r2, _080297E8 @ =gUnknown_2023DD0
	ldr r0, [r2]
	ldr r1, _080297EC @ =0xfffffbff
	ands r0, r1
	str r0, [r2]
	ldr r3, _080297F0 @ =gUnknown_81D65A8
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
_080297D8: .4byte gUnknown_82507E8
_080297DC: .4byte gUnknown_2023D74
_080297E0: .4byte 0x000001ff
_080297E4: .4byte 0x0000ffff
_080297E8: .4byte gUnknown_2023DD0
_080297EC: .4byte 0xfffffbff
_080297F0: .4byte gUnknown_81D65A8
_080297F4: .4byte gBattleMoves
_080297F8: .4byte gBattlerTarget
	thumb_func_end atk9E_metronome

	thumb_func_start atk9F_dmgtolevel
atk9F_dmgtolevel: @ 80297FC
	ldr r3, _0802981C @ =gBattleMoveDamage
	ldr r2, _08029820 @ =gBattleMons
	ldr r0, _08029824 @ =sBattler_AI
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x2A
	ldrb r0, [r0]
	str r0, [r3]
	ldr r1, _08029828 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_0802981C: .4byte gBattleMoveDamage
_08029820: .4byte gBattleMons
_08029824: .4byte sBattler_AI
_08029828: .4byte gUnknown_2023D74
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
	ldr r0, _08029878 @ =sBattler_AI
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
	ldr r1, _0802987C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08029870: .4byte gBattleMoveDamage
_08029874: .4byte gBattleMons
_08029878: .4byte sBattler_AI
_0802987C: .4byte gUnknown_2023D74
	thumb_func_end atkA0_psywavedamageeffect

	thumb_func_start atkA1_counterdamagecalculator
atkA1_counterdamagecalculator: @ 8029880
	push {r4-r6,lr}
	ldr r4, _080298F0 @ =sBattler_AI
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _080298F4 @ =gUnknown_2023E8C
	ldrb r0, [r4]
	lsls r0, 4
	adds r0, r5
	ldrb r0, [r0, 0xC]
	bl GetBankSide
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
	ldr r1, _08029900 @ =gUnknown_2023DE4
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
_080298F0: .4byte sBattler_AI
_080298F4: .4byte gUnknown_2023E8C
_080298F8: .4byte gBattleMons
_080298FC: .4byte gBattleMoveDamage
_08029900: .4byte gUnknown_2023DE4
_08029904: .4byte gBattlerTarget
_08029908:
	ldr r2, _08029924 @ =gBattlerTarget
	ldr r1, _08029928 @ =gUnknown_2023E8C
	ldr r0, _0802992C @ =sBattler_AI
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0xC]
	strb r0, [r2]
_08029918:
	ldr r1, _08029930 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08029964
	.align 2, 0
_08029924: .4byte gBattlerTarget
_08029928: .4byte gUnknown_2023E8C
_0802992C: .4byte sBattler_AI
_08029930: .4byte gUnknown_2023D74
_08029934:
	ldr r2, _0802996C @ =gUnknown_2023ECC
	ldr r0, _08029970 @ =sBattler_AI
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
	ldr r3, _08029974 @ =gUnknown_2023D74
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
_0802996C: .4byte gUnknown_2023ECC
_08029970: .4byte sBattler_AI
_08029974: .4byte gUnknown_2023D74
	thumb_func_end atkA1_counterdamagecalculator

	thumb_func_start atkA2_mirrorcoatdamagecalculator
atkA2_mirrorcoatdamagecalculator: @ 8029978
	push {r4-r6,lr}
	ldr r4, _080299E8 @ =sBattler_AI
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _080299EC @ =gUnknown_2023E8C
	ldrb r0, [r4]
	lsls r0, 4
	adds r0, r5
	ldrb r0, [r0, 0xD]
	bl GetBankSide
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
	ldr r1, _080299F8 @ =gUnknown_2023DE4
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
_080299E8: .4byte sBattler_AI
_080299EC: .4byte gUnknown_2023E8C
_080299F0: .4byte gBattleMons
_080299F4: .4byte gBattleMoveDamage
_080299F8: .4byte gUnknown_2023DE4
_080299FC: .4byte gBattlerTarget
_08029A00:
	ldr r2, _08029A1C @ =gBattlerTarget
	ldr r1, _08029A20 @ =gUnknown_2023E8C
	ldr r0, _08029A24 @ =sBattler_AI
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0xD]
	strb r0, [r2]
_08029A10:
	ldr r1, _08029A28 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08029A5C
	.align 2, 0
_08029A1C: .4byte gBattlerTarget
_08029A20: .4byte gUnknown_2023E8C
_08029A24: .4byte sBattler_AI
_08029A28: .4byte gUnknown_2023D74
_08029A2C:
	ldr r2, _08029A64 @ =gUnknown_2023ECC
	ldr r0, _08029A68 @ =sBattler_AI
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
	ldr r3, _08029A6C @ =gUnknown_2023D74
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
_08029A64: .4byte gUnknown_2023ECC
_08029A68: .4byte sBattler_AI
_08029A6C: .4byte gUnknown_2023D74
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
	ldr r5, _08029B78 @ =gLastUsedMove
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
	ldr r1, _08029B80 @ =gUnknown_2022AB8
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
	ldr r1, _08029B84 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08029BA2
	.align 2, 0
_08029B70: .4byte gBattleMons
_08029B74: .4byte gBattlerTarget
_08029B78: .4byte gLastUsedMove
_08029B7C: .4byte gDisableStructs
_08029B80: .4byte gUnknown_2022AB8
_08029B84: .4byte gUnknown_2023D74
_08029B88:
	ldr r3, _08029BB0 @ =gUnknown_2023D74
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
_08029BB0: .4byte gUnknown_2023D74
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
	ldr r2, _08029CB0 @ =gLastUsedMove
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
	ldr r1, _08029CB8 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08029CD6
	.align 2, 0
_08029CA8: .4byte gBattleMons
_08029CAC: .4byte gBattlerTarget
_08029CB0: .4byte gLastUsedMove
_08029CB4: .4byte gDisableStructs
_08029CB8: .4byte gUnknown_2023D74
_08029CBC:
	ldr r3, _08029CE4 @ =gUnknown_2023D74
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
_08029CE4: .4byte gUnknown_2023D74
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
	ldr r5, _08029D70 @ =sBattler_AI
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
	ldr r2, _08029D7C @ =gUnknown_2023ECC
	mov r0, r12
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, 0x4
	adds r0, r2
	ldr r1, _08029D80 @ =0x0000ffff
	str r1, [r0]
	ldr r1, _08029D84 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08029DA2
	.align 2, 0
_08029D68: .4byte gBattleMons
_08029D6C: .4byte gBattlerTarget
_08029D70: .4byte sBattler_AI
_08029D74: .4byte gBattleMoveDamage
_08029D78: .4byte gBattleScripting
_08029D7C: .4byte gUnknown_2023ECC
_08029D80: .4byte 0x0000ffff
_08029D84: .4byte gUnknown_2023D74
_08029D88:
	ldr r3, _08029DA8 @ =gUnknown_2023D74
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
_08029DA8: .4byte gUnknown_2023D74
	thumb_func_end atkA5_painsplitdmgcalc

	thumb_func_start atkA6_settypetorandomresistance
atkA6_settypetorandomresistance: @ 8029DAC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r1, _08029E14 @ =gUnknown_2023DA0
	ldr r4, _08029E18 @ =sBattler_AI
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
	ldr r2, _08029E24 @ =gUnknown_2023DC0
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
	ldr r3, _08029E28 @ =gUnknown_2023D74
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
_08029E14: .4byte gUnknown_2023DA0
_08029E18: .4byte sBattler_AI
_08029E1C: .4byte 0x0000ffff
_08029E20: .4byte gBattleMons
_08029E24: .4byte gUnknown_2023DC0
_08029E28: .4byte gUnknown_2023D74
_08029E2C:
	mov r0, r12
	strb r5, [r0]
	mov r1, r10
	ldrb r0, [r1]
	muls r0, r2
	adds r0, r7
	adds r0, 0x22
	strb r5, [r0]
	ldr r1, _08029E50 @ =gUnknown_2022AB8
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x3
	strb r0, [r1, 0x1]
	strb r5, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r1, _08029E54 @ =gUnknown_2023D74
	b _08029E82
	.align 2, 0
_08029E50: .4byte gUnknown_2022AB8
_08029E54: .4byte gUnknown_2023D74
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
	ldr r1, _08029E90 @ =gUnknown_2022AB8
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
_08029E90: .4byte gUnknown_2022AB8
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
	ldr r6, _08029F90 @ =gUnknown_824F050
	adds r3, r4, r6
	ldr r1, _08029F94 @ =gUnknown_2023DA8
	ldr r2, _08029F98 @ =sBattler_AI
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
	ldr r1, _08029FA4 @ =gUnknown_2023D74
	mov r12, r1
	ldr r3, _08029F90 @ =gUnknown_824F050
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
	ldr r7, _08029F94 @ =gUnknown_2023DA8
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
_08029F90: .4byte gUnknown_824F050
_08029F94: .4byte gUnknown_2023DA8
_08029F98: .4byte sBattler_AI
_08029F9C: .4byte gBattleMons
_08029FA0: .4byte 0x000003e7
_08029FA4: .4byte gUnknown_2023D74
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
	ldr r1, _08029FFC @ =sBattler_AI
	ldrb r1, [r1]
	strb r1, [r0, 0x15]
	ldr r1, _0802A000 @ =gUnknown_2023D74
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
_08029FFC: .4byte sBattler_AI
_0802A000: .4byte gUnknown_2023D74
	thumb_func_end atkA7_setalwayshitflag

	thumb_func_start atkA8_copymovepermanently
atkA8_copymovepermanently: @ 802A004
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	ldr r0, _0802A164 @ =gUnknown_2023D4C
	ldr r1, _0802A168 @ =0x0000ffff
	adds r5, r1, 0
	strh r5, [r0]
	ldr r3, _0802A16C @ =gBattleMons
	ldr r2, _0802A170 @ =sBattler_AI
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
	ldr r0, _0802A174 @ =gUnknown_2023D90
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
	ldr r4, _0802A17C @ =gUnknown_2023D48
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
	bl EmitSetMonData
	ldr r0, _0802A184 @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBufferBankForExecution
	ldr r1, _0802A188 @ =gUnknown_2022AB8
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	ldr r3, _0802A174 @ =gUnknown_2023D90
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
	ldr r1, _0802A18C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802A1AA
	.align 2, 0
_0802A164: .4byte gUnknown_2023D4C
_0802A168: .4byte 0x0000ffff
_0802A16C: .4byte gBattleMons
_0802A170: .4byte sBattler_AI
_0802A174: .4byte gUnknown_2023D90
_0802A178: .4byte gBattlerTarget
_0802A17C: .4byte gUnknown_2023D48
_0802A180: .4byte gBattleMoves
_0802A184: .4byte gActiveBattler
_0802A188: .4byte gUnknown_2022AB8
_0802A18C: .4byte gUnknown_2023D74
_0802A190:
	ldr r3, _0802A1BC @ =gUnknown_2023D74
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
_0802A1BC: .4byte gUnknown_2023D74
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
	ldr r0, _0802A284 @ =gUnknown_2023DD0
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
_0802A284: .4byte gUnknown_2023DD0
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
	ldr r0, _0802A320 @ =sBattler_AI
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
	ldr r0, _0802A320 @ =sBattler_AI
	ldrb r0, [r0]
	adds r1, r6, 0
	movs r2, 0xFD
	bl CheckMoveLimitations
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xF
	bne _0802A330
	ldr r1, _0802A32C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802A394
	.align 2, 0
_0802A320: .4byte sBattler_AI
_0802A324: .4byte gUnknown_2023BF0
_0802A328: .4byte gBitTable
_0802A32C: .4byte gUnknown_2023D74
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
	ldr r4, _0802A3A8 @ =gUnknown_2023D4E
	ldr r2, _0802A3AC @ =gBattleMons
	lsls r1, r5, 1
	ldr r0, _0802A3B0 @ =sBattler_AI
	ldrb r3, [r0]
	movs r0, 0x58
	muls r0, r3
	adds r1, r0
	adds r2, 0xC
	adds r1, r2
	ldrh r0, [r1]
	strh r0, [r4]
	ldr r0, _0802A3B4 @ =gUnknown_2023D48
	strb r5, [r0]
	ldr r2, _0802A3B8 @ =gUnknown_2023DD0
	ldr r0, [r2]
	ldr r1, _0802A3BC @ =0xfffffbff
	ands r0, r1
	str r0, [r2]
	ldrh r0, [r4]
	movs r1, 0
	bl GetMoveTarget
	ldr r1, _0802A3C0 @ =gBattlerTarget
	strb r0, [r1]
	ldr r3, _0802A3C4 @ =gUnknown_2023D74
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
_0802A3A8: .4byte gUnknown_2023D4E
_0802A3AC: .4byte gBattleMons
_0802A3B0: .4byte sBattler_AI
_0802A3B4: .4byte gUnknown_2023D48
_0802A3B8: .4byte gUnknown_2023DD0
_0802A3BC: .4byte 0xfffffbff
_0802A3C0: .4byte gBattlerTarget
_0802A3C4: .4byte gUnknown_2023D74
	thumb_func_end atkA9_trychoosesleeptalkmove

	thumb_func_start atkAA_setdestinybond
atkAA_setdestinybond: @ 802A3C8
	ldr r1, _0802A3EC @ =gBattleMons
	ldr r0, _0802A3F0 @ =sBattler_AI
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
	ldr r1, _0802A3F4 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_0802A3EC: .4byte gBattleMons
_0802A3F0: .4byte sBattler_AI
_0802A3F4: .4byte gUnknown_2023D74
	thumb_func_end atkAA_setdestinybond

	thumb_func_start TrySetDestinyBondToHappen
TrySetDestinyBondToHappen: @ 802A3F8
	push {r4,r5,lr}
	ldr r0, _0802A448 @ =sBattler_AI
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0802A44C @ =gBattlerTarget
	ldrb r0, [r4]
	bl GetBankSide
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
	ldr r2, _0802A454 @ =gUnknown_2023DD0
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
_0802A448: .4byte sBattler_AI
_0802A44C: .4byte gBattlerTarget
_0802A450: .4byte gBattleMons
_0802A454: .4byte gUnknown_2023DD0
	thumb_func_end TrySetDestinyBondToHappen

	thumb_func_start atkAB_trysetdestinybondtohappen
atkAB_trysetdestinybondtohappen: @ 802A458
	push {lr}
	bl TrySetDestinyBondToHappen
	ldr r1, _0802A46C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802A46C: .4byte gUnknown_2023D74
	thumb_func_end atkAB_trysetdestinybondtohappen

	thumb_func_start atkAC_remaininghptopower
atkAC_remaininghptopower: @ 802A470
	push {lr}
	ldr r2, _0802A4C4 @ =gBattleMons
	ldr r0, _0802A4C8 @ =sBattler_AI
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
	ldr r0, _0802A4CC @ =gUnknown_8250810
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
	ldr r1, _0802A4CC @ =gUnknown_8250810
	adds r0, r3, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r2]
	ldr r1, _0802A4D4 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802A4C4: .4byte gBattleMons
_0802A4C8: .4byte sBattler_AI
_0802A4CC: .4byte gUnknown_8250810
_0802A4D0: .4byte gDynamicBasePower
_0802A4D4: .4byte gUnknown_2023D74
	thumb_func_end atkAC_remaininghptopower

	thumb_func_start atkAD_tryspiteppreduce
atkAD_tryspiteppreduce: @ 802A4D8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r4, _0802A658 @ =gLastUsedMove
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
	ldr r1, _0802A668 @ =gUnknown_2022AB8
	movs r5, 0xFD
	strb r5, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	ldr r2, _0802A658 @ =gLastUsedMove
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
	ldr r4, _0802A66C @ =gUnknown_2022AC8
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
	bl EmitSetMonData
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_0802A630:
	ldr r1, _0802A67C @ =gUnknown_2023D74
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
_0802A658: .4byte gLastUsedMove
_0802A65C: .4byte gBattlerTarget
_0802A660: .4byte 0x0000ffff
_0802A664: .4byte gBattleMons
_0802A668: .4byte gUnknown_2022AB8
_0802A66C: .4byte gUnknown_2022AC8
_0802A670: .4byte gActiveBattler
_0802A674: .4byte gDisableStructs
_0802A678: .4byte gBitTable
_0802A67C: .4byte gUnknown_2023D74
_0802A680:
	ldr r3, _0802A6AC @ =gUnknown_2023D74
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
_0802A6AC: .4byte gUnknown_2023D74
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
	ldr r6, _0802A724 @ =gUnknown_2023E82
	mov r0, r8
	strb r0, [r6, 0x5]
	ldr r5, _0802A728 @ =sBattler_AI
	ldrb r0, [r5]
	bl GetBankSide
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
_0802A724: .4byte gUnknown_2023E82
_0802A728: .4byte sBattler_AI
_0802A72C: .4byte gEnemyParty
_0802A730: .4byte gPlayerParty
_0802A734: .4byte gBattleMons
_0802A738: .4byte 0xf7ffffff
_0802A73C:
	ldrb r1, [r1]
	adds r0, r3, 0
	bl sub_80C71D0
	ldrb r0, [r6, 0x5]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r6, 0x5]
_0802A74C:
	ldr r7, _0802A7C0 @ =gActiveBattler
	ldr r0, _0802A7C4 @ =sBattler_AI
	ldrb r0, [r0]
	bl GetBankIdentity
	movs r2, 0x2
	mov r9, r2
	mov r1, r9
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByIdentity
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
_0802A7C4: .4byte sBattler_AI
_0802A7C8: .4byte gBattleScripting
_0802A7CC: .4byte gBattleTypeFlags
_0802A7D0: .4byte gAbsentBattlerFlags
_0802A7D4: .4byte gBitTable
_0802A7D8: .4byte gBattleMons
_0802A7DC: .4byte 0xf7ffffff
_0802A7E0:
	ldrb r1, [r1]
	adds r0, r3, 0
	bl sub_80C71D0
	ldr r1, _0802A838 @ =gUnknown_2023E82
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
	ldr r0, _0802A844 @ =sBattler_AI
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
_0802A838: .4byte gUnknown_2023E82
_0802A83C: .4byte gBattleMons
_0802A840: .4byte gBattlerPartyIndexes
_0802A844: .4byte sBattler_AI
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
	ldr r1, _0802A970 @ =gUnknown_2023E82
	movs r0, 0x4
	strb r0, [r1, 0x5]
	movs r2, 0x3F
	mov r8, r2
	ldr r3, _0802A974 @ =gBattleMons
	ldr r2, _0802A978 @ =sBattler_AI
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
	bl GetBankIdentity
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByIdentity
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
	ldr r0, _0802A978 @ =sBattler_AI
	ldrb r0, [r0]
	strb r0, [r4]
	add r0, sp, 0x4
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r3, 0x4
	bl EmitSetMonData
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_0802A956:
	ldr r1, _0802A990 @ =gUnknown_2023D74
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
_0802A970: .4byte gUnknown_2023E82
_0802A974: .4byte gBattleMons
_0802A978: .4byte sBattler_AI
_0802A97C: .4byte 0xf7ffffff
_0802A980: .4byte gActiveBattler
_0802A984: .4byte gBattleTypeFlags
_0802A988: .4byte gAbsentBattlerFlags
_0802A98C: .4byte gBitTable
_0802A990: .4byte gUnknown_2023D74
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
	ldr r3, _0802A9DC @ =gUnknown_2023D74
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
_0802A9DC: .4byte gUnknown_2023D74
_0802A9E0:
	orrs r2, r3
	str r2, [r1]
	ldr r1, _0802AA0C @ =gBattleMoveDamage
	ldr r0, _0802AA10 @ =sBattler_AI
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
	ldr r1, _0802AA14 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802AA04:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802AA0C: .4byte gBattleMoveDamage
_0802AA10: .4byte sBattler_AI
_0802AA14: .4byte gUnknown_2023D74
	thumb_func_end atkAF_cursetarget

	thumb_func_start atkB0_trysetspikes
atkB0_trysetspikes: @ 802AA18
	push {r4,lr}
	ldr r4, _0802AA6C @ =sBattler_AI
	ldrb r0, [r4]
	bl GetBankSide
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0802AA70 @ =gUnknown_2023DE4
	lsls r2, r0, 1
	adds r0, r2, r0
	lsls r0, 2
	adds r3, r0, r1
	ldrb r0, [r3, 0xA]
	cmp r0, 0x3
	bne _0802AA7C
	ldr r2, _0802AA74 @ =gUnknown_2023ECC
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
	ldr r3, _0802AA78 @ =gUnknown_2023D74
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
_0802AA6C: .4byte sBattler_AI
_0802AA70: .4byte gUnknown_2023DE4
_0802AA74: .4byte gUnknown_2023ECC
_0802AA78: .4byte gUnknown_2023D74
_0802AA7C:
	ldr r1, _0802AA9C @ =gSideAffecting
	adds r1, r2, r1
	ldrh r2, [r1]
	movs r0, 0x10
	orrs r0, r2
	strh r0, [r1]
	ldrb r0, [r3, 0xA]
	adds r0, 0x1
	strb r0, [r3, 0xA]
	ldr r1, _0802AAA0 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802AA96:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802AA9C: .4byte gSideAffecting
_0802AAA0: .4byte gUnknown_2023D74
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
	ldr r1, _0802AAD0 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_0802AAC8: .4byte gBattleMons
_0802AACC: .4byte gBattlerTarget
_0802AAD0: .4byte gUnknown_2023D74
	thumb_func_end atkB1_setforesight

	thumb_func_start atkB2_trysetperishsong
atkB2_trysetperishsong: @ 802AAD4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r6, 0
	movs r3, 0
	ldr r0, _0802AB18 @ =gUnknown_2023BCC
	adds r7, r0, 0
	ldr r0, _0802AB1C @ =sBattler_AI
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
_0802AB18: .4byte gUnknown_2023BCC
_0802AB1C: .4byte sBattler_AI
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
	ldr r0, _0802AB6C @ =gUnknown_2023BCC
	ldrb r0, [r0]
	cmp r6, r0
	bne _0802AB74
	ldr r3, _0802AB70 @ =gUnknown_2023D74
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
_0802AB6C: .4byte gUnknown_2023BCC
_0802AB70: .4byte gUnknown_2023D74
_0802AB74:
	ldr r1, _0802AB88 @ =gUnknown_2023D74
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
_0802AB88: .4byte gUnknown_2023D74
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
	ldr r0, _0802ABB4 @ =sBattler_AI
	ldrb r0, [r0]
	bl CancelMultiTurnMoves
	ldr r1, _0802ABB8 @ =gUnknown_2023D74
	ldr r0, _0802ABBC @ =gUnknown_81D6960
	str r0, [r1]
	b _0802ACD8
	.align 2, 0
_0802ABB0: .4byte gMoveResultFlags
_0802ABB4: .4byte sBattler_AI
_0802ABB8: .4byte gUnknown_2023D74
_0802ABBC: .4byte gUnknown_81D6960
_0802ABC0:
	ldr r2, _0802ACE4 @ =gBattleMons
	ldr r1, _0802ACE8 @ =sBattler_AI
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
	ldr r1, _0802ACF4 @ =gUnknown_2023DB8
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
	ldr r7, _0802AD04 @ =gUnknown_2023D74
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
_0802ACE8: .4byte sBattler_AI
_0802ACEC: .4byte gDisableStructs
_0802ACF0: .4byte gCurrentMove
_0802ACF4: .4byte gUnknown_2023DB8
_0802ACF8: .4byte 0xffffefff
_0802ACFC: .4byte gDynamicBasePower
_0802AD00: .4byte gBattleMoves
_0802AD04: .4byte gUnknown_2023D74
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
	ldr r4, _0802AD60 @ =gUnknown_2023D74
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
_0802AD60: .4byte gUnknown_2023D74
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
	ldr r0, _0802ADA0 @ =sBattler_AI
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strb r1, [r0, 0x10]
	ldr r1, _0802ADA4 @ =gUnknown_2023D74
	ldr r0, _0802ADA8 @ =gUnknown_81D6960
	str r0, [r1]
	b _0802AE04
	.align 2, 0
_0802AD98: .4byte gMoveResultFlags
_0802AD9C: .4byte gDisableStructs
_0802ADA0: .4byte sBattler_AI
_0802ADA4: .4byte gUnknown_2023D74
_0802ADA8: .4byte gUnknown_81D6960
_0802ADAC:
	ldr r5, _0802AE0C @ =gDisableStructs
	ldr r4, _0802AE10 @ =sBattler_AI
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
	ldr r4, _0802AE20 @ =gUnknown_2023D74
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
_0802AE10: .4byte sBattler_AI
_0802AE14: .4byte gDynamicBasePower
_0802AE18: .4byte gBattleMoves
_0802AE1C: .4byte gCurrentMove
_0802AE20: .4byte gUnknown_2023D74
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
	ldr r0, _0802AE60 @ =sBattler_AI
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
_0802AE60: .4byte sBattler_AI
_0802AE64:
	ldr r4, _0802AE98 @ =gDynamicBasePower
	ldr r2, _0802AE9C @ =gBattleMons
	ldr r0, _0802AEA0 @ =sBattler_AI
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
	ldr r1, _0802AEA4 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802AE98: .4byte gDynamicBasePower
_0802AE9C: .4byte gBattleMons
_0802AEA0: .4byte sBattler_AI
_0802AEA4: .4byte gUnknown_2023D74
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
	ldr r1, _0802AF1C @ =gUnknown_2023D74
	ldr r0, _0802AF20 @ =gUnknown_81D6930
	b _0802AF5E
	.align 2, 0
_0802AF10: .4byte gBattleMoveDamage
_0802AF14: .4byte gBattleMons
_0802AF18: .4byte gBattlerTarget
_0802AF1C: .4byte gUnknown_2023D74
_0802AF20: .4byte gUnknown_81D6930
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
	ldr r1, _0802AF48 @ =gUnknown_2023D74
	ldr r0, _0802AF4C @ =gUnknown_81D7DD1
	b _0802AF5E
	.align 2, 0
_0802AF40: .4byte gBattleMons
_0802AF44: .4byte gBattlerTarget
_0802AF48: .4byte gUnknown_2023D74
_0802AF4C: .4byte gUnknown_81D7DD1
_0802AF50:
	ldr r2, _0802AF68 @ =gMoveResultFlags
	ldrb r1, [r2]
	movs r0, 0xF7
	ands r0, r1
	strb r0, [r2]
	ldr r1, _0802AF6C @ =gUnknown_2023D74
	ldr r0, _0802AF70 @ =gUnknown_81D7DB7
_0802AF5E:
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802AF68: .4byte gMoveResultFlags
_0802AF6C: .4byte gUnknown_2023D74
_0802AF70: .4byte gUnknown_81D7DB7
	thumb_func_end atkB7_presentdamagecalculation

	thumb_func_start atkB8_setsafeguard
atkB8_setsafeguard: @ 802AF74
	push {r4-r7,lr}
	ldr r7, _0802AFA8 @ =sBattler_AI
	ldrb r0, [r7]
	bl GetBankIdentity
	ldr r4, _0802AFAC @ =gSideAffecting
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
	ldr r1, _0802AFB4 @ =gUnknown_2023E82
	movs r0, 0
	strb r0, [r1, 0x5]
	b _0802B000
	.align 2, 0
_0802AFA8: .4byte sBattler_AI
_0802AFAC: .4byte gSideAffecting
_0802AFB0: .4byte gMoveResultFlags
_0802AFB4: .4byte gUnknown_2023E82
_0802AFB8:
	ldrb r0, [r7]
	bl GetBankIdentity
	adds r1, r6, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	ldrh r0, [r1]
	movs r2, 0x20
	orrs r0, r2
	strh r0, [r1]
	ldrb r0, [r7]
	bl GetBankIdentity
	ldr r5, _0802B010 @ =gUnknown_2023DE4
	adds r1, r6, 0
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r4, 0x5
	strb r4, [r0, 0x6]
	ldrb r0, [r7]
	bl GetBankIdentity
	adds r1, r6, 0
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r7]
	strb r1, [r0, 0x7]
	ldr r0, _0802B014 @ =gUnknown_2023E82
	strb r4, [r0, 0x5]
_0802B000:
	ldr r1, _0802B018 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B010: .4byte gUnknown_2023DE4
_0802B014: .4byte gUnknown_2023E82
_0802B018: .4byte gUnknown_2023D74
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
	ldr r1, _0802B124 @ =gUnknown_2022AB8
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
	ldr r0, _0802B12C @ =gUnknown_2023BCC
	ldrb r3, [r0]
	adds r6, r1, 0
	ldr r0, _0802B130 @ =gUnknown_2023D74
	mov r8, r0
	cmp r2, r3
	bcs _0802B10C
	adds r4, r6, 0
	ldr r0, _0802B134 @ =sBattler_AI
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
_0802B124: .4byte gUnknown_2022AB8
_0802B128: .4byte gBattlerTarget
_0802B12C: .4byte gUnknown_2023BCC
_0802B130: .4byte gUnknown_2023D74
_0802B134: .4byte sBattler_AI
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
	ldr r0, _0802B164 @ =gUnknown_2023D72
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0802B170
	ldr r0, _0802B168 @ =sBattler_AI
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _0802B16C
	movs r0, 0x1
	b _0802B18A
	.align 2, 0
_0802B164: .4byte gUnknown_2023D72
_0802B168: .4byte sBattler_AI
_0802B16C:
	movs r0, 0
	b _0802B18A
_0802B170:
	ldr r0, _0802B184 @ =sBattler_AI
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _0802B188
	movs r0, 0x3
	b _0802B18A
	.align 2, 0
_0802B184: .4byte sBattler_AI
_0802B188:
	movs r0, 0x2
_0802B18A:
	bl GetBankByIdentity
	ldr r1, _0802B264 @ =gBattlerTarget
	strb r0, [r1]
	ldr r0, _0802B268 @ =gUnknown_2023D7C
	ldr r1, _0802B264 @ =gBattlerTarget
	ldrb r3, [r1]
	adds r0, r3, r0
	ldrb r0, [r0]
	cmp r0, 0
	beq _0802B1A2
	b _0802B2A8
_0802B1A2:
	ldr r5, _0802B26C @ =sBattler_AI
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
	ldr r0, _0802B27C @ =gUnknown_2023DC4
	lsls r1, r3, 1
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0xE4
	bne _0802B2A8
	movs r1, 0
	ldr r0, _0802B280 @ =gUnknown_2023BCC
	ldr r2, _0802B284 @ =gCurrentMove
	mov r8, r2
	ldr r7, _0802B288 @ =gUnknown_2023D48
	mov r10, r7
	ldr r2, _0802B28C @ =gUnknown_2023D49
	mov r9, r2
	ldr r7, _0802B290 @ =gUnknown_2023DD0
	mov r12, r7
	ldrb r2, [r0]
	cmp r1, r2
	bge _0802B22E
	ldr r6, _0802B294 @ =gUnknown_2023BDE
	ldr r5, _0802B264 @ =gBattlerTarget
	ldr r4, _0802B298 @ =gUnknown_2023BDA
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
	ldr r7, _0802B29C @ =gUnknown_2023D74
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
_0802B268: .4byte gUnknown_2023D7C
_0802B26C: .4byte sBattler_AI
_0802B270: .4byte gBattleStruct
_0802B274: .4byte gBattleMons
_0802B278: .4byte gDisableStructs
_0802B27C: .4byte gUnknown_2023DC4
_0802B280: .4byte gUnknown_2023BCC
_0802B284: .4byte gCurrentMove
_0802B288: .4byte gUnknown_2023D48
_0802B28C: .4byte gUnknown_2023D49
_0802B290: .4byte gUnknown_2023DD0
_0802B294: .4byte gUnknown_2023BDE
_0802B298: .4byte gUnknown_2023BDA
_0802B29C: .4byte gUnknown_2023D74
_0802B2A0: .4byte gBattleScripting
_0802B2A4: .4byte 0xfffffbff
_0802B2A8:
	ldr r3, _0802B2D0 @ =gUnknown_2023D74
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
_0802B2D0: .4byte gUnknown_2023D74
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
	ldr r1, _0802B2FC @ =gUnknown_2023E82
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _0802B312
	.align 2, 0
_0802B2F4: .4byte gBattleWeather
_0802B2F8: .4byte gMoveResultFlags
_0802B2FC: .4byte gUnknown_2023E82
_0802B300:
	movs r0, 0x20
	strh r0, [r2]
	ldr r1, _0802B320 @ =gUnknown_2023E82
	movs r0, 0x4
	strb r0, [r1, 0x5]
	ldr r0, _0802B324 @ =gUnknown_2023F20
	adds r0, 0x28
	movs r1, 0x5
	strb r1, [r0]
_0802B312:
	ldr r1, _0802B328 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802B320: .4byte gUnknown_2023E82
_0802B324: .4byte gUnknown_2023F20
_0802B328: .4byte gUnknown_2023D74
	thumb_func_end atkBB_setsunny

	thumb_func_start atkBC_maxattackhalvehp
atkBC_maxattackhalvehp: @ 802B32C
	push {r4,r5,lr}
	ldr r5, _0802B378 @ =gBattleMons
	ldr r4, _0802B37C @ =sBattler_AI
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
	ldr r1, _0802B384 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802B3A2
	.align 2, 0
_0802B378: .4byte gBattleMons
_0802B37C: .4byte sBattler_AI
_0802B380: .4byte gBattleMoveDamage
_0802B384: .4byte gUnknown_2023D74
_0802B388:
	ldr r3, _0802B3A8 @ =gUnknown_2023D74
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
_0802B3A8: .4byte gUnknown_2023D74
	thumb_func_end atkBC_maxattackhalvehp

	thumb_func_start atkBD_copyfoestats
atkBD_copyfoestats: @ 802B3AC
	push {r4-r7,lr}
	movs r2, 0
	ldr r7, _0802B3E4 @ =gUnknown_2023D74
	ldr r6, _0802B3E8 @ =sBattler_AI
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
_0802B3E4: .4byte gUnknown_2023D74
_0802B3E8: .4byte sBattler_AI
_0802B3EC: .4byte gUnknown_2023BFC
_0802B3F0: .4byte gBattlerTarget
	thumb_func_end atkBD_copyfoestats

	thumb_func_start atkBE_rapidspinfree
atkBE_rapidspinfree: @ 802B3F4
	push {r4-r6,lr}
	ldr r1, _0802B464 @ =gBattleMons
	ldr r5, _0802B468 @ =sBattler_AI
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
	ldr r1, _0802B47C @ =gUnknown_2022AB8
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
	ldr r1, _0802B480 @ =gUnknown_2023D74
	ldr r0, _0802B484 @ =gUnknown_81D8DF3
	b _0802B532
	.align 2, 0
_0802B464: .4byte gBattleMons
_0802B468: .4byte sBattler_AI
_0802B46C: .4byte gBattleScripting
_0802B470: .4byte gBattlerTarget
_0802B474: .4byte 0xffff1fff
_0802B478: .4byte gBattleStruct
_0802B47C: .4byte gUnknown_2022AB8
_0802B480: .4byte gUnknown_2023D74
_0802B484: .4byte gUnknown_81D8DF3
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
	ldr r1, _0802B4C0 @ =gUnknown_2023D74
	ldr r0, _0802B4C4 @ =gUnknown_81D8E04
	b _0802B532
	.align 2, 0
_0802B4BC: .4byte gStatuses3
_0802B4C0: .4byte gUnknown_2023D74
_0802B4C4: .4byte gUnknown_81D8E04
_0802B4C8:
	adds r0, r2, 0
	bl GetBankSide
	ldr r4, _0802B518 @ =gSideAffecting
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	ldrh r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0802B52C
	ldrb r0, [r5]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	ldrh r2, [r0]
	ldr r1, _0802B51C @ =0x0000ffef
	ands r1, r2
	movs r4, 0
	strh r1, [r0]
	ldrb r0, [r5]
	bl GetBankSide
	ldr r2, _0802B520 @ =gUnknown_2023DE4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	strb r4, [r1, 0xA]
	bl BattleScriptPushCursor
	ldr r1, _0802B524 @ =gUnknown_2023D74
	ldr r0, _0802B528 @ =gUnknown_81D8E0B
	b _0802B532
	.align 2, 0
_0802B518: .4byte gSideAffecting
_0802B51C: .4byte 0x0000ffef
_0802B520: .4byte gUnknown_2023DE4
_0802B524: .4byte gUnknown_2023D74
_0802B528: .4byte gUnknown_81D8E0B
_0802B52C:
	ldr r1, _0802B53C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
_0802B532:
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802B53C: .4byte gUnknown_2023D74
	thumb_func_end atkBE_rapidspinfree

	thumb_func_start atkBF_setdefensecurlbit
atkBF_setdefensecurlbit: @ 802B540
	ldr r1, _0802B564 @ =gBattleMons
	ldr r0, _0802B568 @ =sBattler_AI
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
	ldr r1, _0802B56C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_0802B564: .4byte gBattleMons
_0802B568: .4byte sBattler_AI
_0802B56C: .4byte gUnknown_2023D74
	thumb_func_end atkBF_setdefensecurlbit

	thumb_func_start atkC0_recoverbasedonsunlight
atkC0_recoverbasedonsunlight: @ 802B570
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r1, _0802B5DC @ =gBattlerTarget
	ldr r5, _0802B5E0 @ =sBattler_AI
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
	bl sub_8019F18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0802B5C2
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	cmp r0, 0
	beq _0802B5F0
_0802B5C2:
	ldr r3, _0802B5EC @ =gBattleMoveDamage
	ldr r2, _0802B5E4 @ =gBattleMons
	ldr r0, _0802B5E0 @ =sBattler_AI
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
_0802B5E0: .4byte sBattler_AI
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
	ldr r1, _0802B64C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802B66A
	.align 2, 0
_0802B648: .4byte gBattleMoveDamage
_0802B64C: .4byte gUnknown_2023D74
_0802B650:
	ldr r3, _0802B674 @ =gUnknown_2023D74
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
_0802B674: .4byte gUnknown_2023D74
	thumb_func_end atkC0_recoverbasedonsunlight

	thumb_func_start sub_802B678
sub_802B678: @ 802B678
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r2, _0802B760 @ =gBattleMons
	ldr r0, _0802B764 @ =sBattler_AI
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
	ldr r1, _0802B770 @ =gUnknown_2023D74
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
_0802B764: .4byte sBattler_AI
_0802B768: .4byte gDynamicBasePower
_0802B76C: .4byte gBattleStruct
_0802B770: .4byte gUnknown_2023D74
	thumb_func_end sub_802B678

	thumb_func_start atkC2_selectfirstvalidtarget
atkC2_selectfirstvalidtarget: @ 802B774
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _0802B7D0 @ =gBattlerTarget
	movs r1, 0
	strb r1, [r0]
	ldr r1, _0802B7D4 @ =gUnknown_2023BCC
	ldrb r1, [r1]
	adds r6, r0, 0
	ldr r0, _0802B7D8 @ =gUnknown_2023D74
	mov r8, r0
	cmp r1, 0
	beq _0802B7BE
	adds r3, r6, 0
	ldr r0, _0802B7DC @ =sBattler_AI
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
_0802B7D4: .4byte gUnknown_2023BCC
_0802B7D8: .4byte gUnknown_2023D74
_0802B7DC: .4byte sBattler_AI
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
	ldr r0, _0802B820 @ =gUnknown_2023F20
	mov r8, r0
	ldr r7, _0802B824 @ =gBattlerTarget
	ldrb r1, [r7]
	adds r0, r1, r0
	ldrb r6, [r0]
	cmp r6, 0
	beq _0802B82C
	ldr r3, _0802B828 @ =gUnknown_2023D74
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
_0802B820: .4byte gUnknown_2023F20
_0802B824: .4byte gBattlerTarget
_0802B828: .4byte gUnknown_2023D74
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
	ldr r5, _0802B8D0 @ =sBattler_AI
	ldrb r1, [r5]
	strb r1, [r0]
	ldrb r0, [r7]
	add r0, r8
	movs r1, 0x3
	strb r1, [r0]
	ldr r4, _0802B8D4 @ =gSideAffecting
	ldrb r0, [r7]
	bl GetBankIdentity
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
	bl sub_803ECEC
	ldrb r1, [r7]
	lsls r1, 2
	mov r2, r8
	adds r2, 0x8
	adds r1, r2
	str r0, [r1]
	ldr r1, _0802B8DC @ =gUnknown_2023E8C
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
	ldr r0, _0802B8E4 @ =gUnknown_2023E82
	mov r1, r10
	strb r1, [r0, 0x5]
	b _0802B8EE
	.align 2, 0
_0802B8CC: .4byte gCurrentMove
_0802B8D0: .4byte sBattler_AI
_0802B8D4: .4byte gSideAffecting
_0802B8D8: .4byte gBattleMons
_0802B8DC: .4byte gUnknown_2023E8C
_0802B8E0: .4byte 0x00000161
_0802B8E4: .4byte gUnknown_2023E82
_0802B8E8:
	ldr r1, _0802B908 @ =gUnknown_2023E82
	movs r0, 0
	strb r0, [r1, 0x5]
_0802B8EE:
	ldr r1, _0802B90C @ =gUnknown_2023D74
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
_0802B908: .4byte gUnknown_2023E82
_0802B90C: .4byte gUnknown_2023D74
	thumb_func_end atkC3_trysetfutureattack

	thumb_func_start atkC4_trydobeatup
atkC4_trydobeatup: @ 802B910
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _0802B954 @ =sBattler_AI
	ldrb r0, [r0]
	bl GetBankSide
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
	ldr r3, _0802B968 @ =gUnknown_2023D74
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
_0802B954: .4byte sBattler_AI
_0802B958: .4byte gEnemyParty
_0802B95C: .4byte gPlayerParty
_0802B960: .4byte gBattleMons
_0802B964: .4byte gBattlerTarget
_0802B968: .4byte gUnknown_2023D74
_0802B96C:
	ldr r6, _0802BAA8 @ =gUnknown_2023E82
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
	ldr r1, _0802BAA8 @ =gUnknown_2023E82
	mov r9, r1
	ldrb r2, [r1]
	cmp r2, 0x5
	bhi _0802BAD4
	ldr r1, _0802BAAC @ =gUnknown_2022AB8
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x1]
	ldr r6, _0802BAB0 @ =sBattler_AI
	ldrb r0, [r6]
	strb r0, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _0802BAB4 @ =gUnknown_2023D74
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
	ldr r1, _0802BAD0 @ =gUnknown_2023E8C
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
_0802BAA8: .4byte gUnknown_2023E82
_0802BAAC: .4byte gUnknown_2022AB8
_0802BAB0: .4byte sBattler_AI
_0802BAB4: .4byte gUnknown_2023D74
_0802BAB8: .4byte gBattleMoveDamage
_0802BABC: .4byte gBaseStats
_0802BAC0: .4byte gBattleMoves
_0802BAC4: .4byte gCurrentMove
_0802BAC8: .4byte gBattleMons
_0802BACC: .4byte gBattlerTarget
_0802BAD0: .4byte gUnknown_2023E8C
_0802BAD4:
	mov r0, r8
	cmp r0, 0
	beq _0802BAF4
	ldr r3, _0802BAF0 @ =gUnknown_2023D74
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
_0802BAF0: .4byte gUnknown_2023D74
_0802BAF4:
	ldr r3, _0802BB1C @ =gUnknown_2023D74
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
_0802BB1C: .4byte gUnknown_2023D74
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
	ldr r0, _0802BB5C @ =sBattler_AI
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x40
	b _0802BB88
	.align 2, 0
_0802BB54: .4byte 0x00000123
_0802BB58: .4byte gStatuses3
_0802BB5C: .4byte sBattler_AI
_0802BB60:
	ldr r2, _0802BB70 @ =gStatuses3
	ldr r0, _0802BB74 @ =sBattler_AI
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x80
	b _0802BB88
	.align 2, 0
_0802BB70: .4byte gStatuses3
_0802BB74: .4byte sBattler_AI
_0802BB78:
	ldr r2, _0802BB98 @ =gStatuses3
	ldr r0, _0802BB9C @ =sBattler_AI
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
	ldr r1, _0802BBA0 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802BB98: .4byte gStatuses3
_0802BB9C: .4byte sBattler_AI
_0802BBA0: .4byte gUnknown_2023D74
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
	ldr r0, _0802BBE4 @ =sBattler_AI
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
_0802BBE4: .4byte sBattler_AI
_0802BBE8:
	ldr r2, _0802BBFC @ =gStatuses3
	ldr r0, _0802BC00 @ =sBattler_AI
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x81
	negs r2, r2
	b _0802BC12
	.align 2, 0
_0802BBFC: .4byte gStatuses3
_0802BC00: .4byte sBattler_AI
_0802BC04:
	ldr r2, _0802BC24 @ =gStatuses3
	ldr r0, _0802BC28 @ =sBattler_AI
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	ldr r2, _0802BC2C @ =0xfffbffff
_0802BC12:
	ands r0, r2
	str r0, [r1]
_0802BC16:
	ldr r1, _0802BC30 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802BC24: .4byte gStatuses3
_0802BC28: .4byte sBattler_AI
_0802BC2C: .4byte 0xfffbffff
_0802BC30: .4byte gUnknown_2023D74
	thumb_func_end atkC6_clearsemiinvulnerablebit

	thumb_func_start atkC7_setminimize
atkC7_setminimize: @ 802BC34
	push {lr}
	ldr r0, _0802BC64 @ =gUnknown_2023DD0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 18
	ands r0, r1
	cmp r0, 0
	beq _0802BC58
	ldr r2, _0802BC68 @ =gStatuses3
	ldr r0, _0802BC6C @ =sBattler_AI
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 1
	orrs r0, r2
	str r0, [r1]
_0802BC58:
	ldr r1, _0802BC70 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802BC64: .4byte gUnknown_2023DD0
_0802BC68: .4byte gStatuses3
_0802BC6C: .4byte sBattler_AI
_0802BC70: .4byte gUnknown_2023D74
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
	ldr r1, _0802BCA0 @ =gUnknown_2023E82
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _0802BCB2
	.align 2, 0
_0802BC98: .4byte gBattleWeather
_0802BC9C: .4byte gMoveResultFlags
_0802BCA0: .4byte gUnknown_2023E82
_0802BCA4:
	strh r2, [r3]
	ldr r0, _0802BCC0 @ =gUnknown_2023E82
	movs r1, 0x5
	strb r1, [r0, 0x5]
	ldr r0, _0802BCC4 @ =gUnknown_2023F20
	adds r0, 0x28
	strb r1, [r0]
_0802BCB2:
	ldr r1, _0802BCC8 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802BCC0: .4byte gUnknown_2023E82
_0802BCC4: .4byte gUnknown_2023F20
_0802BCC8: .4byte gUnknown_2023D74
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
	ldr r0, _0802BD18 @ =gUnknown_2023E82
	ldrb r0, [r0, 0x6]
	cmp r0, 0x1
	beq _0802BD20
	ldr r3, _0802BD1C @ =gUnknown_2023D74
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
_0802BD18: .4byte gUnknown_2023E82
_0802BD1C: .4byte gUnknown_2023D74
_0802BD20:
	ldr r4, _0802BD54 @ =gActiveBattler
	ldr r0, _0802BD58 @ =sBattler_AI
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
	bl EmitHealthBarUpdate
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	ldr r1, _0802BD64 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802BD4C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802BD54: .4byte gActiveBattler
_0802BD58: .4byte sBattler_AI
_0802BD5C: .4byte gBattleMoveDamage
_0802BD60: .4byte 0x00007fff
_0802BD64: .4byte gUnknown_2023D74
	thumb_func_end atkC9_jumpifattackandspecialattackcannotfall

	thumb_func_start atkCA_setforcedtarget
atkCA_setforcedtarget: @ 802BD68
	push {r4,r5,lr}
	ldr r4, _0802BDA8 @ =sBattler_AI
	ldrb r0, [r4]
	bl GetBankSide
	ldr r5, _0802BDAC @ =gUnknown_2023DE4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	movs r0, 0x1
	strb r0, [r1, 0x8]
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r0, [r4]
	strb r0, [r1, 0x9]
	ldr r1, _0802BDB0 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802BDA8: .4byte sBattler_AI
_0802BDAC: .4byte gUnknown_2023DE4
_0802BDB0: .4byte gUnknown_2023D74
	thumb_func_end atkCA_setforcedtarget

	thumb_func_start atkCB_setcharge
atkCB_setcharge: @ 802BDB4
	push {r4,lr}
	ldr r0, _0802BE08 @ =gStatuses3
	ldr r3, _0802BE0C @ =sBattler_AI
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
	ldr r1, _0802BE14 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802BE08: .4byte gStatuses3
_0802BE0C: .4byte sBattler_AI
_0802BE10: .4byte gDisableStructs
_0802BE14: .4byte gUnknown_2023D74
	thumb_func_end atkCB_setcharge

	thumb_func_start atkCC_callterrainattack
atkCC_callterrainattack: @ 802BE18
	push {r4,lr}
	ldr r2, _0802BE68 @ =gUnknown_2023DD0
	ldr r0, [r2]
	ldr r1, _0802BE6C @ =0xfffffbff
	ands r0, r1
	str r0, [r2]
	ldr r4, _0802BE70 @ =gCurrentMove
	ldr r1, _0802BE74 @ =gUnknown_825081C
	ldr r0, _0802BE78 @ =gUnknown_2022B50
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
	ldr r3, _0802BE80 @ =gUnknown_81D65A8
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
	ldr r1, _0802BE88 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802BE68: .4byte gUnknown_2023DD0
_0802BE6C: .4byte 0xfffffbff
_0802BE70: .4byte gCurrentMove
_0802BE74: .4byte gUnknown_825081C
_0802BE78: .4byte gUnknown_2022B50
_0802BE7C: .4byte gBattlerTarget
_0802BE80: .4byte gUnknown_81D65A8
_0802BE84: .4byte gBattleMoves
_0802BE88: .4byte gUnknown_2023D74
	thumb_func_end atkCC_callterrainattack

	thumb_func_start atkCD_cureifburnedparalysedorpoisoned
atkCD_cureifburnedparalysedorpoisoned: @ 802BE8C
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r1, _0802BED8 @ =gBattleMons
	ldr r3, _0802BEDC @ =sBattler_AI
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
	ldr r1, _0802BEE0 @ =gUnknown_2023D74
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
	bl EmitSetMonData
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	b _0802BF02
	.align 2, 0
_0802BED8: .4byte gBattleMons
_0802BEDC: .4byte sBattler_AI
_0802BEE0: .4byte gUnknown_2023D74
_0802BEE4: .4byte gActiveBattler
_0802BEE8:
	ldr r3, _0802BF0C @ =gUnknown_2023D74
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
_0802BF0C: .4byte gUnknown_2023D74
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
	ldr r3, _0802BF50 @ =gUnknown_2023D74
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
_0802BF50: .4byte gUnknown_2023D74
_0802BF54:
	orrs r1, r2
	str r1, [r0]
	ldr r1, _0802BF64 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802BF60:
	pop {r0}
	bx r0
	.align 2, 0
_0802BF64: .4byte gUnknown_2023D74
	thumb_func_end atkCE_settorment

	thumb_func_start atkCF_jumpifnodamage
atkCF_jumpifnodamage: @ 802BF68
	push {lr}
	ldr r2, _0802BF94 @ =gUnknown_2023E8C
	ldr r0, _0802BF98 @ =sBattler_AI
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
	ldr r1, _0802BF9C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802BFBA
	.align 2, 0
_0802BF94: .4byte gUnknown_2023E8C
_0802BF98: .4byte sBattler_AI
_0802BF9C: .4byte gUnknown_2023D74
_0802BFA0:
	ldr r3, _0802BFC0 @ =gUnknown_2023D74
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
_0802BFC0: .4byte gUnknown_2023D74
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
	ldr r1, _0802C010 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802C02E
	.align 2, 0
_0802C008: .4byte gDisableStructs
_0802C00C: .4byte gBattlerTarget
_0802C010: .4byte gUnknown_2023D74
_0802C014:
	ldr r3, _0802C034 @ =gUnknown_2023D74
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
_0802C034: .4byte gUnknown_2023D74
	thumb_func_end atkD0_settaunt

	thumb_func_start atkD1_trysethelpinghand
atkD1_trysethelpinghand: @ 802C038
	push {r4,lr}
	ldr r4, _0802C0A0 @ =sBattler_AI
	ldrb r0, [r4]
	bl GetBankIdentity
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByIdentity
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
	ldr r1, _0802C0B4 @ =gUnknown_2023E8C
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
	ldr r1, _0802C0B8 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802C0D6
	.align 2, 0
_0802C0A0: .4byte sBattler_AI
_0802C0A4: .4byte gBattlerTarget
_0802C0A8: .4byte gBattleTypeFlags
_0802C0AC: .4byte gAbsentBattlerFlags
_0802C0B0: .4byte gBitTable
_0802C0B4: .4byte gUnknown_2023E8C
_0802C0B8: .4byte gUnknown_2023D74
_0802C0BC:
	ldr r3, _0802C0DC @ =gUnknown_2023D74
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
_0802C0DC: .4byte gUnknown_2023D74
	thumb_func_end atkD1_trysethelpinghand

	thumb_func_start sub_802C0E0
sub_802C0E0: @ 802C0E0
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
	ldr r0, _0802C200 @ =sBattler_AI
	ldrb r0, [r0]
	bl GetBankSide
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
	ldr r6, _0802C200 @ =sBattler_AI
	ldrb r0, [r6]
	bl GetBankSide
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r7, _0802C20C @ =gBattlerTarget
	ldrb r0, [r7]
	bl GetBankSide
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
	ldr r0, _0802C210 @ =gUnknown_2023F20
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
	ldr r1, _0802C200 @ =sBattler_AI
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
	ldr r3, _0802C220 @ =gUnknown_2023D74
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
_0802C200: .4byte sBattler_AI
_0802C204: .4byte 0x00000902
_0802C208: .4byte gTrainerBattleOpponent_A
_0802C20C: .4byte gBattlerTarget
_0802C210: .4byte gUnknown_2023F20
_0802C214: .4byte gBitTable
_0802C218: .4byte gBattlerPartyIndexes
_0802C21C: .4byte gBattleMons
_0802C220: .4byte gUnknown_2023D74
_0802C224:
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x3C
	bne _0802C258
	ldr r1, _0802C24C @ =gUnknown_2023D74
	ldr r0, _0802C250 @ =gUnknown_81D948E
	str r0, [r1]
	ldr r1, _0802C254 @ =gUnknown_2023D6A
	ldrb r0, [r7]
	muls r0, r5
	add r0, r8
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	ldrb r1, [r1]
	bl sub_80C71D0
	b _0802C37A
	.align 2, 0
_0802C24C: .4byte gUnknown_2023D74
_0802C250: .4byte gUnknown_81D948E
_0802C254: .4byte gUnknown_2023D6A
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
	ldr r1, _0802C348 @ =sBattler_AI
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
	ldr r3, _0802C348 @ =sBattler_AI
	ldrb r0, [r3]
	strb r0, [r4]
	str r6, [sp]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl EmitSetMonData
	ldr r1, _0802C348 @ =sBattler_AI
	ldrb r0, [r1]
	bl MarkBufferBankForExecution
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
	bl EmitSetMonData
	ldrb r0, [r7]
	bl MarkBufferBankForExecution
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
	ldr r1, _0802C348 @ =sBattler_AI
	ldrb r0, [r1]
	ldr r1, [r2]
	lsls r0, 1
	adds r0, r1
	adds r0, 0xC8
	strb r3, [r0]
	ldr r2, _0802C348 @ =sBattler_AI
	ldrb r0, [r2]
	mov r3, r10
	ldr r1, [r3]
	lsls r0, 1
	adds r0, r1
	adds r0, 0xC9
	movs r1, 0
	strb r1, [r0]
	ldr r1, _0802C350 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	ldr r1, _0802C354 @ =gUnknown_2022AB8
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
	ldr r1, _0802C358 @ =gUnknown_2022AC8
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
	ldr r1, _0802C35C @ =gUnknown_2023E82
	movs r0, 0x2
	b _0802C378
	.align 2, 0
_0802C344: .4byte gBattleStruct
_0802C348: .4byte sBattler_AI
_0802C34C: .4byte gActiveBattler
_0802C350: .4byte gUnknown_2023D74
_0802C354: .4byte gUnknown_2022AB8
_0802C358: .4byte gUnknown_2022AC8
_0802C35C: .4byte gUnknown_2023E82
_0802C360:
	ldrh r0, [r6]
	cmp r0, 0
	beq _0802C374
	ldr r0, _0802C370 @ =gUnknown_2023E82
	movs r1, 0
	strb r1, [r0, 0x5]
	b _0802C37A
	.align 2, 0
_0802C370: .4byte gUnknown_2023E82
_0802C374:
	ldr r1, _0802C38C @ =gUnknown_2023E82
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
_0802C38C: .4byte gUnknown_2023E82
	thumb_func_end sub_802C0E0

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
	ldr r0, _0802C3D8 @ =sBattler_AI
	ldrb r0, [r0]
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	strb r1, [r0]
	ldr r1, _0802C3DC @ =gUnknown_2023D6A
	ldrb r0, [r4]
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0802C3E0 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802C3FE
	.align 2, 0
_0802C3D0: .4byte gBattleMons
_0802C3D4: .4byte gBattlerTarget
_0802C3D8: .4byte sBattler_AI
_0802C3DC: .4byte gUnknown_2023D6A
_0802C3E0: .4byte gUnknown_2023D74
_0802C3E4:
	ldr r3, _0802C404 @ =gUnknown_2023D74
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
_0802C404: .4byte gUnknown_2023D74
	thumb_func_end atkD3_trycopyability

	thumb_func_start atkD4_trywish
atkD4_trywish: @ 802C408
	push {r4-r7,lr}
	ldr r7, _0802C41C @ =gUnknown_2023D74
	ldr r2, [r7]
	ldrb r3, [r2, 0x1]
	cmp r3, 0
	beq _0802C420
	cmp r3, 0x1
	beq _0802C458
	b _0802C4D4
	.align 2, 0
_0802C41C: .4byte gUnknown_2023D74
_0802C420:
	ldr r1, _0802C44C @ =gUnknown_2023F20
	ldr r4, _0802C450 @ =sBattler_AI
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
_0802C44C: .4byte gUnknown_2023F20
_0802C450: .4byte sBattler_AI
_0802C454: .4byte gBattlerPartyIndexes
_0802C458:
	ldr r1, _0802C4BC @ =gUnknown_2022AB8
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x1]
	ldr r4, _0802C4C0 @ =gBattlerTarget
	ldrb r0, [r4]
	strb r0, [r1, 0x2]
	ldr r0, _0802C4C4 @ =gUnknown_2023F20
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
_0802C4BC: .4byte gUnknown_2022AB8
_0802C4C0: .4byte gBattlerTarget
_0802C4C4: .4byte gUnknown_2023F20
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
	ldr r0, _0802C518 @ =sBattler_AI
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
	ldr r3, _0802C51C @ =gUnknown_2023D74
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
_0802C518: .4byte sBattler_AI
_0802C51C: .4byte gUnknown_2023D74
_0802C520:
	orrs r1, r3
	str r1, [r2]
	ldr r1, _0802C530 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802C52C:
	pop {r0}
	bx r0
	.align 2, 0
_0802C530: .4byte gUnknown_2023D74
	thumb_func_end atkD5_trysetroots

	thumb_func_start atkD6_doubledamagedealtifdamaged
atkD6_doubledamagedealtifdamaged: @ 802C534
	push {lr}
	ldr r3, _0802C580 @ =gUnknown_2023E8C
	ldr r0, _0802C584 @ =sBattler_AI
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
	ldr r1, _0802C590 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802C580: .4byte gUnknown_2023E8C
_0802C584: .4byte sBattler_AI
_0802C588: .4byte gBattlerTarget
_0802C58C: .4byte gBattleScripting
_0802C590: .4byte gUnknown_2023D74
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
	ldr r3, _0802C5E4 @ =gUnknown_2023D74
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
_0802C5E4: .4byte gUnknown_2023D74
_0802C5E8:
	movs r0, 0x80
	lsls r0, 5
	orrs r2, r0
	str r2, [r4]
	ldr r1, _0802C600 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802C5F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C600: .4byte gUnknown_2023D74
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
	ldr r0, _0802C648 @ =sBattler_AI
	ldrb r0, [r0]
	muls r0, r1
	adds r1, r0, r2
	ldrh r0, [r3, 0x28]
	ldrh r2, [r1, 0x28]
	cmp r0, r2
	bhi _0802C650
	ldr r3, _0802C64C @ =gUnknown_2023D74
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
_0802C648: .4byte sBattler_AI
_0802C64C: .4byte gUnknown_2023D74
_0802C650:
	ldr r2, _0802C668 @ =gBattleMoveDamage
	ldrh r0, [r3, 0x28]
	ldrh r1, [r1, 0x28]
	subs r0, r1
	str r0, [r2]
	ldr r1, _0802C66C @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802C662:
	pop {r0}
	bx r0
	.align 2, 0
_0802C668: .4byte gBattleMoveDamage
_0802C66C: .4byte gUnknown_2023D74
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
	ldr r0, _0802C6CC @ =sBattler_AI
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
	ldr r1, _0802C6D0 @ =gUnknown_2023D74
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
_0802C6CC: .4byte sBattler_AI
_0802C6D0: .4byte gUnknown_2023D74
	thumb_func_end atkD9_scaledamagebyhealthratio

	thumb_func_start atkDA_tryswapabilities
atkDA_tryswapabilities: @ 802C6D4
	push {r4-r6,lr}
	ldr r5, _0802C738 @ =gBattleMons
	ldr r0, _0802C73C @ =sBattler_AI
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
	ldr r3, _0802C748 @ =gUnknown_2023D74
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
_0802C73C: .4byte sBattler_AI
_0802C740: .4byte gBattlerTarget
_0802C744: .4byte gMoveResultFlags
_0802C748: .4byte gUnknown_2023D74
_0802C74C:
	ldrb r1, [r2]
	strb r3, [r2]
	ldrb r0, [r6]
	muls r0, r4
	adds r0, r5
	adds r0, 0x20
	strb r1, [r0]
	ldr r1, _0802C768 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802C762:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802C768: .4byte gUnknown_2023D74
	thumb_func_end atkDA_tryswapabilities

	thumb_func_start atkDB_tryimprision
atkDB_tryimprision: @ 802C76C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r1, _0802C78C @ =gStatuses3
	ldr r4, _0802C790 @ =sBattler_AI
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
_0802C790: .4byte sBattler_AI
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
	ldr r1, _0802C7B8 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802C836
	.align 2, 0
_0802C7B4: .4byte gStatuses3
_0802C7B8: .4byte gUnknown_2023D74
_0802C7BC:
	adds r0, r2, 0
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrb r0, [r4]
	bl PressurePPLoseOnUsingImprision
	movs r6, 0
	b _0802C82E
_0802C7D2:
	adds r0, r6, 0
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r8, r0
	beq _0802C828
	movs r4, 0
	ldr r7, _0802C864 @ =sBattler_AI
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
	ldr r0, _0802C86C @ =gUnknown_2023BCC
	ldrb r0, [r0]
	cmp r6, r0
	bcc _0802C7D2
_0802C836:
	ldr r0, _0802C86C @ =gUnknown_2023BCC
	ldrb r0, [r0]
	cmp r6, r0
	bne _0802C858
_0802C83E:
	ldr r3, _0802C870 @ =gUnknown_2023D74
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
_0802C864: .4byte sBattler_AI
_0802C868: .4byte gBattleMons
_0802C86C: .4byte gUnknown_2023BCC
_0802C870: .4byte gUnknown_2023D74
	thumb_func_end atkDB_tryimprision

	thumb_func_start atkDC_trysetgrudge
atkDC_trysetgrudge: @ 802C874
	push {lr}
	ldr r1, _0802C8AC @ =gStatuses3
	ldr r0, _0802C8B0 @ =sBattler_AI
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
	ldr r3, _0802C8B4 @ =gUnknown_2023D74
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
_0802C8B0: .4byte sBattler_AI
_0802C8B4: .4byte gUnknown_2023D74
_0802C8B8:
	orrs r1, r3
	str r1, [r2]
	ldr r1, _0802C8C8 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802C8C4:
	pop {r0}
	bx r0
	.align 2, 0
_0802C8C8: .4byte gUnknown_2023D74
	thumb_func_end atkDC_trysetgrudge

	thumb_func_start atkDD_weightdamagecalculation
atkDD_weightdamagecalculation: @ 802C8CC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
	ldr r2, _0802C930 @ =gUnknown_8250830
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
	bl sub_8088E38
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
_0802C930: .4byte gUnknown_8250830
_0802C934: .4byte 0x0000ffff
_0802C938: .4byte gBattleMons
_0802C93C: .4byte gBattlerTarget
_0802C940: .4byte gDynamicBasePower
_0802C944:
	ldr r1, _0802C95C @ =gDynamicBasePower
	movs r0, 0x78
	strh r0, [r1]
_0802C94A:
	ldr r1, _0802C960 @ =gUnknown_2023D74
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
_0802C960: .4byte gUnknown_2023D74
	thumb_func_end atkDD_weightdamagecalculation

	thumb_func_start atkDE_asistattackselect
atkDE_asistattackselect: @ 802C964
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
	ldr r0, _0802CA88 @ =sBattler_AI
	ldrb r0, [r0]
	bl GetBankIdentity
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
	ldr r0, _0802CA88 @ =sBattler_AI
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
	ldr r0, _0802CA9C @ =gUnknown_82507E8
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
	ldr r2, _0802CAA0 @ =gUnknown_2023DD0
	ldr r0, [r2]
	ldr r1, _0802CAA4 @ =0xfffffbff
	ands r0, r1
	str r0, [r2]
	ldr r4, _0802CAA8 @ =gUnknown_2023D4E
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
	ldr r1, _0802CAB0 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802CACE
	.align 2, 0
_0802CA84: .4byte gBattleStruct
_0802CA88: .4byte sBattler_AI
_0802CA8C: .4byte gPlayerParty
_0802CA90: .4byte gEnemyParty
_0802CA94: .4byte gBattlerPartyIndexes
_0802CA98: .4byte 0x0000ffff
_0802CA9C: .4byte gUnknown_82507E8
_0802CAA0: .4byte gUnknown_2023DD0
_0802CAA4: .4byte 0xfffffbff
_0802CAA8: .4byte gUnknown_2023D4E
_0802CAAC: .4byte gBattlerTarget
_0802CAB0: .4byte gUnknown_2023D74
_0802CAB4:
	ldr r3, _0802CAE0 @ =gUnknown_2023D74
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
_0802CAE0: .4byte gUnknown_2023D74
	thumb_func_end atkDE_asistattackselect

	thumb_func_start atkDF_trysetmagiccoat
atkDF_trysetmagiccoat: @ 802CAE4
	push {lr}
	ldr r1, _0802CB2C @ =gBattlerTarget
	ldr r3, _0802CB30 @ =sBattler_AI
	ldrb r0, [r3]
	strb r0, [r1]
	ldr r2, _0802CB34 @ =gUnknown_2023ECC
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _0802CB38 @ =gUnknown_2023BE2
	ldrb r1, [r0]
	ldr r0, _0802CB3C @ =gUnknown_2023BCC
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	bne _0802CB44
	ldr r3, _0802CB40 @ =gUnknown_2023D74
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
_0802CB30: .4byte sBattler_AI
_0802CB34: .4byte gUnknown_2023ECC
_0802CB38: .4byte gUnknown_2023BE2
_0802CB3C: .4byte gUnknown_2023BCC
_0802CB40: .4byte gUnknown_2023D74
_0802CB44:
	ldr r0, _0802CB60 @ =gUnknown_2023E8C
	ldrb r1, [r3]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x10
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _0802CB64 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802CB5C:
	pop {r0}
	bx r0
	.align 2, 0
_0802CB60: .4byte gUnknown_2023E8C
_0802CB64: .4byte gUnknown_2023D74
	thumb_func_end atkDF_trysetmagiccoat

	thumb_func_start atkE0_trysetsnatch
atkE0_trysetsnatch: @ 802CB68
	push {lr}
	ldr r2, _0802CBAC @ =gUnknown_2023ECC
	ldr r3, _0802CBB0 @ =sBattler_AI
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _0802CBB4 @ =gUnknown_2023BE2
	ldrb r1, [r0]
	ldr r0, _0802CBB8 @ =gUnknown_2023BCC
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	bne _0802CBC0
	ldr r3, _0802CBBC @ =gUnknown_2023D74
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
_0802CBAC: .4byte gUnknown_2023ECC
_0802CBB0: .4byte sBattler_AI
_0802CBB4: .4byte gUnknown_2023BE2
_0802CBB8: .4byte gUnknown_2023BCC
_0802CBBC: .4byte gUnknown_2023D74
_0802CBC0:
	ldr r0, _0802CBDC @ =gUnknown_2023E8C
	ldrb r1, [r3]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _0802CBE0 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802CBD6:
	pop {r0}
	bx r0
	.align 2, 0
_0802CBDC: .4byte gUnknown_2023E8C
_0802CBE0: .4byte gUnknown_2023D74
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
	bl GetBankSide
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _0802CC90 @ =gUnknown_2022AB8
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
	ldr r1, _0802CC9C @ =gUnknown_2023BCC
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bcs _0802CC6A
	adds r4, r2, 0
	ldr r6, _0802CCA0 @ =gBitTable
_0802CC2A:
	ldrb r0, [r4]
	bl GetBankSide
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
	ldr r2, _0802CC9C @ =gUnknown_2023BCC
	cmp r1, 0
	beq _0802CC60
_0802CC4C:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _0802CC9C @ =gUnknown_2023BCC
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
	ldr r3, _0802CCA8 @ =gUnknown_2023D74
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
_0802CC90: .4byte gUnknown_2022AB8
_0802CC94: .4byte gBattleMons
_0802CC98: .4byte gBattlerTarget
_0802CC9C: .4byte gUnknown_2023BCC
_0802CCA0: .4byte gBitTable
_0802CCA4: .4byte gAbsentBattlerFlags
_0802CCA8: .4byte gUnknown_2023D74
_0802CCAC:
	ldr r1, _0802CCBC @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802CCB4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802CCBC: .4byte gUnknown_2023D74
	thumb_func_end atkE1_trygetintimidatetarget

	thumb_func_start atkE2_switchoutabilities
atkE2_switchoutabilities: @ 802CCC0
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r5, _0802CD28 @ =gUnknown_2023D74
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
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
	bl EmitSetMonData
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_0802CD1A:
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802CD28: .4byte gUnknown_2023D74
_0802CD2C: .4byte gActiveBattler
_0802CD30: .4byte gBattleMons
_0802CD34: .4byte gBitTable
_0802CD38: .4byte gBattleStruct
	thumb_func_end atkE2_switchoutabilities

	thumb_func_start atkE3_jumpifhasnohp
atkE3_jumpifhasnohp: @ 802CD3C
	push {r4,lr}
	ldr r4, _0802CD78 @ =gUnknown_2023D74
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8016E24
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
_0802CD78: .4byte gUnknown_2023D74
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
	ldr r0, _0802CDA4 @ =gUnknown_2022B50
	ldrb r0, [r0]
	cmp r0, 0x7
	bhi _0802CE2C
	lsls r0, 2
	ldr r1, _0802CDA8 @ =_0802CDAC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802CDA4: .4byte gUnknown_2022B50
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
	ldr r1, _0802CDD4 @ =gUnknown_2023E82
	movs r0, 0x2
	b _0802CE30
	.align 2, 0
_0802CDD4: .4byte gUnknown_2023E82
_0802CDD8:
	ldr r1, _0802CDE0 @ =gUnknown_2023E82
	movs r0, 0x1
	b _0802CE30
	.align 2, 0
_0802CDE0: .4byte gUnknown_2023E82
_0802CDE4:
	ldr r1, _0802CDEC @ =gUnknown_2023E82
	movs r0, 0x1B
	b _0802CE30
	.align 2, 0
_0802CDEC: .4byte gUnknown_2023E82
_0802CDF0:
	ldr r1, _0802CDF8 @ =gUnknown_2023E82
	movs r0, 0x17
	b _0802CE30
	.align 2, 0
_0802CDF8: .4byte gUnknown_2023E82
_0802CDFC:
	ldr r1, _0802CE04 @ =gUnknown_2023E82
	movs r0, 0x16
	b _0802CE30
	.align 2, 0
_0802CE04: .4byte gUnknown_2023E82
_0802CE08:
	ldr r1, _0802CE10 @ =gUnknown_2023E82
	movs r0, 0x18
	b _0802CE30
	.align 2, 0
_0802CE10: .4byte gUnknown_2023E82
_0802CE14:
	ldr r1, _0802CE1C @ =gUnknown_2023E82
	movs r0, 0x7
	b _0802CE30
	.align 2, 0
_0802CE1C: .4byte gUnknown_2023E82
_0802CE20:
	ldr r1, _0802CE28 @ =gUnknown_2023E82
	movs r0, 0x8
	b _0802CE30
	.align 2, 0
_0802CE28: .4byte gUnknown_2023E82
_0802CE2C:
	ldr r1, _0802CE40 @ =gUnknown_2023E82
	movs r0, 0x5
_0802CE30:
	strb r0, [r1, 0x3]
	ldr r1, _0802CE44 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802CE40: .4byte gUnknown_2023E82
_0802CE44: .4byte gUnknown_2023D74
	thumb_func_end atkE4_getsecretpowereffect

	thumb_func_start sub_802CE48
sub_802CE48: @ 802CE48
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
	ldr r1, _0802CEE4 @ =gUnknown_8250848
	b _0802CEF0
	.align 2, 0
_0802CEE4: .4byte gUnknown_8250848
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
	ldr r1, _0802CF28 @ =gUnknown_8250848
	adds r2, r1
	movs r1, 0xC
	bl sub_804037C
_0802CF0A:
	adds r7, r4, 0
	cmp r7, 0x5
	ble _0802CE54
	ldr r1, _0802CF2C @ =gUnknown_2023D74
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
_0802CF28: .4byte gUnknown_8250848
_0802CF2C: .4byte gUnknown_2023D74
	thumb_func_end sub_802CE48

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
	bl EmitBattleAnimation
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	ldr r1, _0802CF94 @ =gUnknown_2023D74
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
_0802CF94: .4byte gUnknown_2023D74
	thumb_func_end atkE6_docastformchangeanimation

	thumb_func_start atkE7_trycastformdatachange
atkE7_trycastformdatachange: @ 802CF98
	push {r4,lr}
	ldr r1, _0802CFC8 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r0, _0802CFCC @ =gBattleScripting
	ldrb r0, [r0, 0x17]
	bl sub_8019DAC
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _0802CFC2
	ldr r0, _0802CFD0 @ =gUnknown_81D92F8
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
_0802CFC8: .4byte gUnknown_2023D74
_0802CFCC: .4byte gBattleScripting
_0802CFD0: .4byte gUnknown_81D92F8
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
	ldr r0, _0802D020 @ =sBattler_AI
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
	ldr r0, _0802D024 @ =gUnknown_2023E82
	strb r4, [r0, 0x5]
	b _0802D050
	.align 2, 0
_0802D014: .4byte gBattleMoves
_0802D018: .4byte gCurrentMove
_0802D01C: .4byte gStatuses3
_0802D020: .4byte sBattler_AI
_0802D024: .4byte gUnknown_2023E82
_0802D028:
	ldr r1, _0802D05C @ =gStatuses3
	ldr r0, _0802D060 @ =sBattler_AI
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
	ldr r1, _0802D064 @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x5]
	movs r4, 0x1
_0802D04C:
	cmp r4, 0
	beq _0802D06C
_0802D050:
	ldr r1, _0802D068 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802D086
	.align 2, 0
_0802D05C: .4byte gStatuses3
_0802D060: .4byte sBattler_AI
_0802D064: .4byte gUnknown_2023E82
_0802D068: .4byte gUnknown_2023D74
_0802D06C:
	ldr r3, _0802D08C @ =gUnknown_2023D74
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
_0802D08C: .4byte gUnknown_2023D74
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
	bl sub_8019F18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0802D130
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8019F18
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
	ldr r1, _0802D144 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0802D140: .4byte gBattleStruct
_0802D144: .4byte gUnknown_2023D74
	thumb_func_end atkE9_setweatherballtype

	thumb_func_start atkEA_tryrecycleitem
atkEA_tryrecycleitem: @ 802D148
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r7, _0802D1B0 @ =gActiveBattler
	ldr r0, _0802D1B4 @ =sBattler_AI
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
	ldr r1, _0802D1C0 @ =gUnknown_2023D68
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
	bl EmitSetMonData
	ldrb r0, [r7]
	bl MarkBufferBankForExecution
	ldr r1, _0802D1C4 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802D1E2
	.align 2, 0
_0802D1B0: .4byte gActiveBattler
_0802D1B4: .4byte sBattler_AI
_0802D1B8: .4byte gBattleStruct
_0802D1BC: .4byte gBattleMons
_0802D1C0: .4byte gUnknown_2023D68
_0802D1C4: .4byte gUnknown_2023D74
_0802D1C8:
	ldr r3, _0802D1EC @ =gUnknown_2023D74
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
_0802D1EC: .4byte gUnknown_2023D74
	thumb_func_end atkEA_tryrecycleitem

	thumb_func_start atkEB_settypetoterrain
atkEB_settypetoterrain: @ 802D1F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _0802D260 @ =gBattleMons
	mov r8, r0
	ldr r7, _0802D264 @ =sBattler_AI
	ldrb r0, [r7]
	movs r6, 0x58
	muls r0, r6
	mov r1, r8
	adds r3, r0, r1
	movs r0, 0x21
	adds r0, r3
	mov r12, r0
	ldr r5, _0802D268 @ =gUnknown_8250888
	ldr r4, _0802D26C @ =gUnknown_2022B50
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
	ldr r1, _0802D270 @ =gUnknown_2022AB8
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
	ldr r1, _0802D274 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802D292
	.align 2, 0
_0802D260: .4byte gBattleMons
_0802D264: .4byte sBattler_AI
_0802D268: .4byte gUnknown_8250888
_0802D26C: .4byte gUnknown_2022B50
_0802D270: .4byte gUnknown_2022AB8
_0802D274: .4byte gUnknown_2023D74
_0802D278:
	ldr r3, _0802D29C @ =gUnknown_2023D74
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
_0802D29C: .4byte gUnknown_2023D74
	thumb_func_end atkEB_settypetoterrain

	thumb_func_start atkEC_pursuitrelated
atkEC_pursuitrelated: @ 802D2A0
	push {r4-r6,lr}
	ldr r5, _0802D314 @ =sBattler_AI
	ldrb r0, [r5]
	bl GetBankIdentity
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByIdentity
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
	ldr r0, _0802D328 @ =gUnknown_2023D7C
	adds r0, r3, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _0802D340
	ldr r1, _0802D32C @ =gUnknown_2023DC4
	lsls r0, r3, 1
	adds r0, r1
	ldrh r2, [r0]
	cmp r2, 0xE4
	bne _0802D340
	ldr r0, _0802D330 @ =gUnknown_2023BDA
	adds r0, r3, r0
	movs r1, 0xB
	strb r1, [r0]
	ldr r0, _0802D334 @ =gCurrentMove
	strh r2, [r0]
	ldr r1, _0802D338 @ =gUnknown_2023D74
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
_0802D314: .4byte sBattler_AI
_0802D318: .4byte gActiveBattler
_0802D31C: .4byte gBattleTypeFlags
_0802D320: .4byte gAbsentBattlerFlags
_0802D324: .4byte gBitTable
_0802D328: .4byte gUnknown_2023D7C
_0802D32C: .4byte gUnknown_2023DC4
_0802D330: .4byte gUnknown_2023BDA
_0802D334: .4byte gCurrentMove
_0802D338: .4byte gUnknown_2023D74
_0802D33C: .4byte gBattleScripting
_0802D340:
	ldr r3, _0802D360 @ =gUnknown_2023D74
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
_0802D360: .4byte gUnknown_2023D74
	thumb_func_end atkEC_pursuitrelated

	thumb_func_start atkEF_snatchsetbanks
atkEF_snatchsetbanks: @ 802D364
	push {r4,lr}
	ldr r1, _0802D388 @ =gUnknown_2023D6E
	ldr r3, _0802D38C @ =sBattler_AI
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
_0802D388: .4byte gUnknown_2023D6E
_0802D38C: .4byte sBattler_AI
_0802D390: .4byte gBattlerTarget
_0802D394: .4byte gBattleScripting
_0802D398:
	ldr r1, _0802D3B0 @ =gBattleScripting
	ldrb r0, [r1, 0x17]
	strb r0, [r2]
_0802D39E:
	ldrb r0, [r4]
	strb r0, [r1, 0x17]
	ldr r1, _0802D3B4 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D3B0: .4byte gBattleScripting
_0802D3B4: .4byte gUnknown_2023D74
	thumb_func_end atkEF_snatchsetbanks

	thumb_func_start atkEE_removelightscreenreflect
atkEE_removelightscreenreflect: @ 802D3B8
	push {r4,lr}
	ldr r0, _0802D400 @ =sBattler_AI
	ldrb r0, [r0]
	bl GetBankSide
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0802D404 @ =gUnknown_2023DE4
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
	ldr r2, _0802D408 @ =gSideAffecting
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
_0802D400: .4byte sBattler_AI
_0802D404: .4byte gUnknown_2023DE4
_0802D408: .4byte gSideAffecting
_0802D40C: .4byte 0x0000fffe
_0802D410: .4byte 0x0000fffd
_0802D414: .4byte gBattleScripting
_0802D418:
	ldr r0, _0802D42C @ =gBattleScripting
	strb r1, [r0, 0x18]
	strb r1, [r0, 0x19]
_0802D41E:
	ldr r1, _0802D430 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D42C: .4byte gBattleScripting
_0802D430: .4byte gUnknown_2023D74
	thumb_func_end atkEE_removelightscreenreflect

	thumb_func_start sub_802D434
sub_802D434: @ 802D434
	push {r4-r6,lr}
	movs r4, 0
	ldr r0, _0802D474 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	beq _0802D442
	b _0802D7EE
_0802D442:
	ldr r5, _0802D478 @ =gActiveBattler
	ldr r0, _0802D47C @ =sBattler_AI
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
	bl EmitBallThrowAnim
	ldrb r0, [r5]
	bl MarkBufferBankForExecution
	ldr r1, _0802D488 @ =gUnknown_2023D74
	ldr r0, _0802D48C @ =gUnknown_81D9AD1
	b _0802D7EC
	.align 2, 0
_0802D474: .4byte gUnknown_2023BC8
_0802D478: .4byte gActiveBattler
_0802D47C: .4byte sBattler_AI
_0802D480: .4byte gBattlerTarget
_0802D484: .4byte gBattleTypeFlags
_0802D488: .4byte gUnknown_2023D74
_0802D48C: .4byte gUnknown_81D9AD1
_0802D490:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0802D4B4
	movs r0, 0
	movs r1, 0x5
	bl EmitBallThrowAnim
	ldrb r0, [r5]
	bl MarkBufferBankForExecution
	ldr r1, _0802D4AC @ =gUnknown_2023D74
	ldr r0, _0802D4B0 @ =gUnknown_81D9AC1
	b _0802D7EC
	.align 2, 0
_0802D4AC: .4byte gUnknown_2023D74
_0802D4B0: .4byte gUnknown_81D9AC1
_0802D4B4:
	movs r0, 0x81
	lsls r0, 9
	ands r1, r0
	cmp r1, 0
	beq _0802D4DC
	movs r0, 0
	movs r1, 0x4
	bl EmitBallThrowAnim
	ldrb r0, [r5]
	bl MarkBufferBankForExecution
	ldr r1, _0802D4D4 @ =gUnknown_2023D74
	ldr r0, _0802D4D8 @ =gUnknown_81D9A88
	b _0802D7EC
	.align 2, 0
_0802D4D4: .4byte gUnknown_2023D74
_0802D4D8: .4byte gUnknown_81D9A88
_0802D4DC:
	ldr r0, _0802D500 @ =gUnknown_2023D68
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
_0802D500: .4byte gUnknown_2023D68
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
	ldr r2, _0802D544 @ =gUnknown_2023D68
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
_0802D544: .4byte gUnknown_2023D68
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
	bl sav1_map_get_light_level
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
	bl sub_8088E74
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
	ldr r1, _0802D694 @ =gUnknown_8250892
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
	ldr r1, _0802D6A0 @ =gUnknown_2023D68
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
_0802D694: .4byte gUnknown_8250892
_0802D698: .4byte gBattleMons
_0802D69C: .4byte gBattlerTarget
_0802D6A0: .4byte gUnknown_2023D68
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
	bl EmitBallThrowAnim
	ldr r0, _0802D704 @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBufferBankForExecution
	ldr r1, _0802D708 @ =gUnknown_2023D74
	ldr r0, _0802D70C @ =gUnknown_81D9A42
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
	ldr r2, _0802D71C @ =gUnknown_2023D68
	movs r1, 0x26
	bl sub_804037C
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	beq _0802D7AE
	b _0802D7D8
	.align 2, 0
_0802D700: .4byte gBattleResults
_0802D704: .4byte gActiveBattler
_0802D708: .4byte gUnknown_2023D74
_0802D70C: .4byte gUnknown_81D9A42
_0802D710: .4byte gBattlerPartyIndexes
_0802D714: .4byte gBattlerTarget
_0802D718: .4byte gEnemyParty
_0802D71C: .4byte gUnknown_2023D68
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
	ldr r5, _0802D7B8 @ =gUnknown_2023D68
	ldrh r0, [r5]
	cmp r0, 0x1
	bne _0802D76C
	movs r4, 0x4
_0802D76C:
	movs r0, 0
	adds r1, r4, 0
	bl EmitBallThrowAnim
	ldr r0, _0802D7BC @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBufferBankForExecution
	cmp r4, 0x4
	bne _0802D7E4
	ldr r1, _0802D7C0 @ =gUnknown_2023D74
	ldr r0, _0802D7C4 @ =gUnknown_81D9A42
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
	bl sub_804037C
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bne _0802D7D8
_0802D7AE:
	ldr r1, _0802D7D4 @ =gUnknown_2023E82
	movs r0, 0
	strb r0, [r1, 0x5]
	b _0802D7EE
	.align 2, 0
_0802D7B8: .4byte gUnknown_2023D68
_0802D7BC: .4byte gActiveBattler
_0802D7C0: .4byte gUnknown_2023D74
_0802D7C4: .4byte gUnknown_81D9A42
_0802D7C8: .4byte gBattlerPartyIndexes
_0802D7CC: .4byte gBattlerTarget
_0802D7D0: .4byte gEnemyParty
_0802D7D4: .4byte gUnknown_2023E82
_0802D7D8:
	ldr r1, _0802D7E0 @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _0802D7EE
	.align 2, 0
_0802D7E0: .4byte gUnknown_2023E82
_0802D7E4:
	ldr r0, _0802D7F4 @ =gUnknown_2023E82
	strb r4, [r0, 0x5]
	ldr r1, _0802D7F8 @ =gUnknown_2023D74
	ldr r0, _0802D7FC @ =gUnknown_81D9A93
_0802D7EC:
	str r0, [r1]
_0802D7EE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D7F4: .4byte gUnknown_2023E82
_0802D7F8: .4byte gUnknown_2023D74
_0802D7FC: .4byte gUnknown_81D9A93
	thumb_func_end sub_802D434

	thumb_func_start sub_802D800
sub_802D800: @ 802D800
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _0802D870 @ =gBattlerPartyIndexes
	mov r9, r0
	ldr r5, _0802D874 @ =sBattler_AI
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
	ldr r0, _0802D87C @ =gUnknown_2023E82
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
_0802D874: .4byte sBattler_AI
_0802D878: .4byte gEnemyParty
_0802D87C: .4byte gUnknown_2023E82
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
	ldr r1, _0802D93C @ =gUnknown_2023E82
	movs r0, 0x2
	strb r0, [r1, 0x5]
_0802D8D6:
	ldr r0, _0802D940 @ =0x00000834
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0802D8EA
	ldr r1, _0802D93C @ =gUnknown_2023E82
	ldrb r0, [r1, 0x5]
	adds r0, 0x1
	strb r0, [r1, 0x5]
_0802D8EA:
	ldr r2, _0802D944 @ =gBattleResults
	ldr r3, _0802D948 @ =gBattleMons
	ldr r0, _0802D94C @ =sBattler_AI
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
	ldr r1, _0802D958 @ =gUnknown_2023D74
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
_0802D93C: .4byte gUnknown_2023E82
_0802D940: .4byte 0x00000834
_0802D944: .4byte gBattleResults
_0802D948: .4byte gBattleMons
_0802D94C: .4byte sBattler_AI
_0802D950: .4byte gBattlerPartyIndexes
_0802D954: .4byte gEnemyParty
_0802D958: .4byte gUnknown_2023D74
	thumb_func_end sub_802D800

	thumb_func_start sub_802D95C
sub_802D95C: @ 802D95C
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
	bl sub_8088E74
	lsls r0, 24
	cmp r0, 0
	beq _0802D9B4
	ldr r3, _0802D9B0 @ =gUnknown_2023D74
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
_0802D9B0: .4byte gUnknown_2023D74
_0802D9B4:
	adds r0, r5, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	adds r2, r4, 0
	bl sub_8044898
	ldr r1, _0802D9D4 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802D9CE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D9D4: .4byte gUnknown_2023D74
	thumb_func_end sub_802D95C

	thumb_func_start sub_802D9D8
sub_802D9D8: @ 802D9D8
	push {r4,r5,lr}
	sub sp, 0x18
	ldr r0, _0802DA00 @ =gEnemyParty
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _0802DA04 @ =gUnknown_2023E82
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
_0802DA04: .4byte gUnknown_2023E82
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
	ldr r0, _0802DA5C @ =gUnknown_2037AB8
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
	ldr r1, _0802DA60 @ =gUnknown_2023E82
	strb r0, [r1, 0x1]
	b _0802DB36
	.align 2, 0
_0802DA5C: .4byte gUnknown_2037AB8
_0802DA60: .4byte gUnknown_2023E82
_0802DA64:
	ldr r0, _0802DAAC @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802DA72
	b _0802DB6C
_0802DA72:
	ldr r0, _0802DAB0 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _0802DAB4 @ =sub_8011100
	cmp r1, r0
	bne _0802DB6C
	ldr r2, _0802DAB8 @ =gTasks
	ldr r4, _0802DABC @ =gUnknown_2023E82
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
	ldr r0, _0802DAC4 @ =sub_80116F4
	bl SetVBlankCallback
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0802DB6C
	.align 2, 0
_0802DAAC: .4byte gUnknown_2037AB8
_0802DAB0: .4byte gMain
_0802DAB4: .4byte sub_8011100
_0802DAB8: .4byte gTasks
_0802DABC: .4byte gUnknown_2023E82
_0802DAC0: .4byte 0x05006000
_0802DAC4: .4byte sub_80116F4
_0802DAC8:
	bl sub_800F34C
	bl LoadBattleTextboxAndBackground
	ldr r1, _0802DADC @ =gUnknown_2022980
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	b _0802DB34
	.align 2, 0
_0802DADC: .4byte gUnknown_2022980
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
	bl sub_810C1CC
	str r4, [sp, 0x14]
	add r0, sp, 0x14
	ldr r1, _0802DB48 @ =gUnknown_20375F8
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
	ldr r1, _0802DB54 @ =gUnknown_2023E82
_0802DB36:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0802DB6C
	.align 2, 0
_0802DB40: .4byte gBattleMons
_0802DB44: .4byte 0x0000ffff
_0802DB48: .4byte gUnknown_20375F8
_0802DB4C: .4byte 0x05000080
_0802DB50: .4byte 0x0001ffff
_0802DB54: .4byte gUnknown_2023E82
_0802DB58:
	ldr r0, _0802DB74 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0802DB6C
	ldr r1, _0802DB78 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_0802DB6C:
	add sp, 0x18
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802DB74: .4byte gUnknown_2037AB8
_0802DB78: .4byte gUnknown_2023D74
	thumb_func_end sub_802D9D8

	thumb_func_start sub_802DB7C
sub_802DB7C: @ 802DB7C
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
	thumb_func_end sub_802DB7C

	thumb_func_start sub_802DCB8
sub_802DCB8: @ 802DCB8
	push {lr}
	sub sp, 0x10
	add r0, sp, 0xC
	movs r2, 0x1
	strh r2, [r0]
	movs r1, 0x2
	strh r1, [r0, 0x2]
	ldr r0, _0802DCF4 @ =gUnknown_2023E82
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
_0802DCF4: .4byte gUnknown_2023E82
	thumb_func_end sub_802DCB8

	thumb_func_start sub_802DCF8
sub_802DCF8: @ 802DCF8
	push {lr}
	sub sp, 0x10
	add r0, sp, 0xC
	movs r1, 0x20
	strh r1, [r0]
	strh r1, [r0, 0x2]
	ldr r0, _0802DD34 @ =gUnknown_2023E82
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
_0802DD34: .4byte gUnknown_2023E82
	thumb_func_end sub_802DCF8

	thumb_func_start sub_802DD38
sub_802DD38: @ 802DD38
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r0, _0802DD5C @ =gUnknown_2023E82
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
_0802DD5C: .4byte gUnknown_2023E82
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
	bl sub_802DB7C
	ldr r0, _0802DDA0 @ =gUnknown_83FE791
	movs r1, 0xE
	bl sub_80D87BC
	ldr r1, _0802DDA4 @ =gUnknown_2023E82
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	strb r4, [r1, 0x1]
	bl sub_802DCB8
	b _0802DFA6
	.align 2, 0
_0802DDA0: .4byte gUnknown_83FE791
_0802DDA4: .4byte gUnknown_2023E82
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
	bl sub_802DCF8
	movs r0, 0
	strb r0, [r4, 0x1]
	bl sub_802DCB8
_0802DDCC:
	ldr r0, _0802DE1C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802DDF2
	ldr r4, _0802DE20 @ =gUnknown_2023E82
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _0802DDF2
	movs r0, 0x5
	bl PlaySE
	bl sub_802DCF8
	movs r0, 0x1
	strb r0, [r4, 0x1]
	bl sub_802DCB8
_0802DDF2:
	ldr r0, _0802DE1C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0802DE24
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0802DE20 @ =gUnknown_2023E82
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
_0802DE20: .4byte gUnknown_2023E82
_0802DE24:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0802DE2E
	b _0802DFA6
_0802DE2E:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0802DE3C @ =gUnknown_2023E82
_0802DE36:
	movs r0, 0x4
	strb r0, [r1]
	b _0802DFA6
	.align 2, 0
_0802DE3C: .4byte gUnknown_2023E82
_0802DE40:
	ldr r0, _0802DEFC @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802DE4E
	b _0802DFA6
_0802DE4E:
	ldr r7, _0802DF00 @ =gBattlerPartyIndexes
	ldr r0, _0802DF04 @ =sBattler_AI
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
	ldr r0, _0802DF10 @ =sub_8011100
	str r0, [sp, 0x4]
	movs r0, 0x2
	adds r2, r6, 0
	adds r3, r5, 0
	bl DoNamingScreen
	ldr r1, _0802DF14 @ =gUnknown_2023E82
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0802DFA6
	.align 2, 0
_0802DEFC: .4byte gUnknown_2037AB8
_0802DF00: .4byte gBattlerPartyIndexes
_0802DF04: .4byte sBattler_AI
_0802DF08: .4byte gEnemyParty
_0802DF0C: .4byte gBattleStruct
_0802DF10: .4byte sub_8011100
_0802DF14: .4byte gUnknown_2023E82
_0802DF18:
	ldr r0, _0802DF54 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _0802DF58 @ =sub_8011100
	cmp r1, r0
	bne _0802DFA6
	ldr r0, _0802DF5C @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0802DFA6
	ldr r2, _0802DF60 @ =gBattlerPartyIndexes
	ldr r0, _0802DF64 @ =sBattler_AI
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
	bl sub_804037C
	b _0802DF8C
	.align 2, 0
_0802DF54: .4byte gMain
_0802DF58: .4byte sub_8011100
_0802DF5C: .4byte gUnknown_2037AB8
_0802DF60: .4byte gBattlerPartyIndexes
_0802DF64: .4byte sBattler_AI
_0802DF68: .4byte gEnemyParty
_0802DF6C: .4byte gBattleStruct
_0802DF70:
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bne _0802DF8C
	ldr r1, _0802DF88 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802DFA6
	.align 2, 0
_0802DF88: .4byte gUnknown_2023D74
_0802DF8C:
	ldr r3, _0802DFB8 @ =gUnknown_2023D74
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
_0802DFB8: .4byte gUnknown_2023D74
	thumb_func_end sub_802DD38

	thumb_func_start atkF4_subattackerhpbydmg
atkF4_subattackerhpbydmg: @ 802DFBC
	ldr r2, _0802DFDC @ =gBattleMons
	ldr r0, _0802DFE0 @ =sBattler_AI
	ldrb r1, [r0]
	movs r0, 0x58
	muls r1, r0
	adds r1, r2
	ldr r0, _0802DFE4 @ =gBattleMoveDamage
	ldr r2, [r0]
	ldrh r0, [r1, 0x28]
	subs r0, r2
	strh r0, [r1, 0x28]
	ldr r1, _0802DFE8 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_0802DFDC: .4byte gBattleMons
_0802DFE0: .4byte sBattler_AI
_0802DFE4: .4byte gBattleMoveDamage
_0802DFE8: .4byte gUnknown_2023D74
	thumb_func_end atkF4_subattackerhpbydmg

	thumb_func_start atkF5_removeattackerstatus1
atkF5_removeattackerstatus1: @ 802DFEC
	ldr r1, _0802E008 @ =gBattleMons
	ldr r0, _0802E00C @ =sBattler_AI
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x4C
	adds r0, r1
	movs r1, 0
	str r1, [r0]
	ldr r1, _0802E010 @ =gUnknown_2023D74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_0802E008: .4byte gBattleMons
_0802E00C: .4byte sBattler_AI
_0802E010: .4byte gUnknown_2023D74
	thumb_func_end atkF5_removeattackerstatus1

	thumb_func_start sub_802E014
sub_802E014: @ 802E014
	ldr r1, _0802E01C @ =gUnknown_2023BE3
	movs r0, 0xC
	strb r0, [r1]
	bx lr
	.align 2, 0
_0802E01C: .4byte gUnknown_2023BE3
	thumb_func_end sub_802E014

	thumb_func_start sub_802E020
sub_802E020: @ 802E020
	ldr r1, _0802E030 @ =gUnknown_2023BE3
	movs r0, 0xC
	strb r0, [r1]
	ldr r1, _0802E034 @ =gUnknown_2023BE2
	ldr r0, _0802E038 @ =gUnknown_2023BCC
	ldrb r0, [r0]
	strb r0, [r1]
	bx lr
	.align 2, 0
_0802E030: .4byte gUnknown_2023BE3
_0802E034: .4byte gUnknown_2023BE2
_0802E038: .4byte gUnknown_2023BCC
	thumb_func_end sub_802E020

	.align 2, 0 @ Don't pad with nop.
