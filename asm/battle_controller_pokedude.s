	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8159998
sub_8159998: @ 8159998
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r1, _08159A38 @ =gUnknown_84790D8
	ldr r0, _08159A3C @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x96
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r7, [r0]
	ldr r0, _08159A40 @ =gUnknown_3005EE0
	mov r8, r0
	ldr r6, _08159A44 @ =gActiveBattler
	ldrb r2, [r6]
	lsls r0, r2, 2
	add r0, r8
	ldr r1, [r0]
	ldrb r0, [r1, 0x1]
	lsls r0, 3
	adds r0, r7
	adds r3, r0, r2
	ldrb r0, [r3, 0x4]
	ldrb r4, [r1, 0x2]
	cmp r0, r4
	bne _08159A48
	adds r0, r2, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _081599DE
	movs r0, 0x5
	bl PlaySE
_081599DE:
	ldrb r0, [r6]
	lsls r0, 2
	add r0, r8
	ldr r0, [r0]
	movs r4, 0
	strb r4, [r0, 0x2]
	ldrb r1, [r6]
	lsls r0, r1, 2
	add r0, r8
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	lsls r0, 3
	adds r0, r7
	adds r0, r1
	ldrb r2, [r0]
	movs r0, 0x1
	eors r1, r0
	lsls r1, 8
	orrs r2, r1
	movs r0, 0x1
	movs r1, 0xA
	bl BtlController_EmitTwoReturnValues
	bl PokedudeBufferExecCompleted
	ldrb r0, [r6]
	lsls r0, 2
	add r0, r8
	ldr r1, [r0]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	ldrb r1, [r6]
	lsls r0, r1, 2
	add r0, r8
	ldr r2, [r0]
	ldrb r0, [r2, 0x1]
	lsls r0, 3
	adds r0, r7
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08159AA0
	strb r4, [r2, 0x1]
	b _08159AA0
	.align 2, 0
_08159A38: .4byte gUnknown_84790D8
_08159A3C: .4byte gBattleStruct
_08159A40: .4byte gUnknown_3005EE0
_08159A44: .4byte gActiveBattler
_08159A48:
	ldr r5, _08159AAC @ =gMoveSelectionCursor
	adds r1, r2, r5
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08159A8E
	ldrb r0, [r3, 0x4]
	lsrs r0, 1
	cmp r0, r4
	bne _08159A8E
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r6]
	adds r0, r5
	ldrb r0, [r0]
	bl MoveSelectionDestroyCursorAt
	ldrb r1, [r6]
	adds r2, r1, r5
	lsls r0, r1, 2
	add r0, r8
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	lsls r0, 3
	adds r0, r7
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0
	bl MoveSelectionCreateCursorAt
_08159A8E:
	ldr r1, _08159AB0 @ =gUnknown_3005EE0
	ldr r0, _08159AB4 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
_08159AA0:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08159AAC: .4byte gMoveSelectionCursor
_08159AB0: .4byte gUnknown_3005EE0
_08159AB4: .4byte gActiveBattler
	thumb_func_end sub_8159998

	thumb_func_start sub_8159AB8
sub_8159AB8: @ 8159AB8
	push {r4-r7,lr}
	ldr r1, _08159B54 @ =gUnknown_8479198
	ldr r4, _08159B58 @ =gBattleStruct
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x96
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r6, [r0]
	ldr r3, _08159B5C @ =gActiveBattler
	ldrb r5, [r3]
	lsls r1, r5, 9
	ldr r0, _08159B60 @ =gBattleBufferA + 2
	adds r7, r1, r0
	mov r12, r7
	subs r0, 0x2
	adds r1, r0
	adds r2, 0x97
	ldrb r0, [r2]
	lsls r0, 3
	adds r0, r6
	ldrb r1, [r1]
	adds r7, r4, 0
	adds r4, r3, 0
	ldrb r2, [r0]
	cmp r1, r2
	bne _08159B70
	ldrb r2, [r0, 0x1]
	cmp r5, r2
	bne _08159B70
	cmp r1, 0x10
	bne _08159B04
	ldrh r0, [r0, 0x2]
	mov r1, r12
	ldrh r1, [r1]
	cmp r0, r1
	bne _08159B70
_08159B04:
	ldr r0, [r7]
	adds r3, r0, 0
	adds r3, 0x97
	ldrb r1, [r3]
	lsls r0, r1, 3
	adds r0, r6
	ldr r2, [r0, 0x4]
	cmp r2, 0
	beq _08159B6C
	ldr r1, _08159B64 @ =gBattlerControllerFuncs
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	str r2, [r0]
	ldr r2, _08159B68 @ =gUnknown_3005EE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r2
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x2]
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r2
	ldr r1, [r0]
	ldr r0, [r7]
	adds r0, 0x97
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r6
	ldrh r0, [r0, 0x2]
	strb r0, [r1, 0x3]
	ldr r1, [r7]
	adds r1, 0x97
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0x1
	b _08159B72
	.align 2, 0
_08159B54: .4byte gUnknown_8479198
_08159B58: .4byte gBattleStruct
_08159B5C: .4byte gActiveBattler
_08159B60: .4byte gBattleBufferA + 2
_08159B64: .4byte gBattlerControllerFuncs
_08159B68: .4byte gUnknown_3005EE0
_08159B6C:
	adds r0, r1, 0x1
	strb r0, [r3]
_08159B70:
	movs r0, 0
_08159B72:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8159AB8

	thumb_func_start sub_8159B78
sub_8159B78: @ 8159B78
	ldr r1, _08159B98 @ =gUnknown_3005EE0
	ldr r2, _08159B9C @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x2]
	ldr r1, _08159BA0 @ =gBattlerControllerFuncs
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08159BA4 @ =PokedudeBufferRunCommand
	str r1, [r0]
	bx lr
	.align 2, 0
_08159B98: .4byte gUnknown_3005EE0
_08159B9C: .4byte gActiveBattler
_08159BA0: .4byte gBattlerControllerFuncs
_08159BA4: .4byte PokedudeBufferRunCommand
	thumb_func_end sub_8159B78

	thumb_func_start sub_8159BA8
sub_8159BA8: @ 8159BA8
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r1, _08159BD0 @ =gUnknown_3005EE0
	ldr r2, _08159BD4 @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, 0x2]
	adds r5, r1, 0
	adds r4, r2, 0
	cmp r0, 0x4
	bls _08159BC4
	b _08159CEE
_08159BC4:
	lsls r0, 2
	ldr r1, _08159BD8 @ =_08159BDC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08159BD0: .4byte gUnknown_3005EE0
_08159BD4: .4byte gActiveBattler
_08159BD8: .4byte _08159BDC
	.align 2, 0
_08159BDC:
	.4byte _08159BF0
	.4byte _08159C14
	.4byte _08159C44
	.4byte _08159C64
	.4byte _08159CB4
_08159BF0:
	ldr r0, _08159C10 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08159CEE
	movs r0, 0x81
	negs r0, r0
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x8
	b _08159C90
	.align 2, 0
_08159C10: .4byte gPaletteFade
_08159C14:
	ldr r0, _08159C3C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08159CEE
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	ldr r0, _08159C40 @ =gBattle_BG0_Y
	ldrh r0, [r0]
	strb r0, [r1, 0x4]
	bl sub_80EB30C
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r5
	b _08159C9E
	.align 2, 0
_08159C3C: .4byte gPaletteFade
_08159C40: .4byte gBattle_BG0_Y
_08159C44:
	ldr r1, _08159C5C @ =gBattle_BG0_Y
	movs r0, 0
	strh r0, [r1]
	bl sub_8159EF0
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _08159C60 @ =gDisplayedStringBattle
	movs r1, 0x18
	bl BattlePutTextOnWindow
	b _08159C94
	.align 2, 0
_08159C5C: .4byte gBattle_BG0_Y
_08159C60: .4byte gDisplayedStringBattle
_08159C64:
	movs r0, 0x18
	bl IsTextPrinterActive
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	bne _08159CEE
	ldr r0, _08159CA8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08159CEE
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x81
	negs r0, r0
	str r4, [sp]
	movs r1, 0x4
	movs r2, 0x8
	movs r3, 0
_08159C90:
	bl BeginNormalPaletteFade
_08159C94:
	ldr r1, _08159CAC @ =gUnknown_3005EE0
	ldr r0, _08159CB0 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
_08159C9E:
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
	b _08159CEE
	.align 2, 0
_08159CA8: .4byte gMain
_08159CAC: .4byte gUnknown_3005EE0
_08159CB0: .4byte gActiveBattler
_08159CB4:
	ldr r0, _08159CF8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08159CEE
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	cmp r0, 0xD
	bne _08159CD8
	bl BattleStopLowHpSound
	ldr r0, _08159CFC @ =0x00000137
	bl PlayBGM
_08159CD8:
	ldr r1, _08159D00 @ =gBattle_BG0_Y
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	strh r0, [r1]
	bl sub_80EB524
	bl sub_8159B78
_08159CEE:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08159CF8: .4byte gPaletteFade
_08159CFC: .4byte 0x00000137
_08159D00: .4byte gBattle_BG0_Y
	thumb_func_end sub_8159BA8

	thumb_func_start sub_8159D04
sub_8159D04: @ 8159D04
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r1, _08159D28 @ =gUnknown_3005EE0
	ldr r2, _08159D2C @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, 0x2]
	adds r3, r1, 0
	cmp r0, 0x6
	bls _08159D1E
	b _08159EDE
_08159D1E:
	lsls r0, 2
	ldr r1, _08159D30 @ =_08159D34
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08159D28: .4byte gUnknown_3005EE0
_08159D2C: .4byte gActiveBattler
_08159D30: .4byte _08159D34
	.align 2, 0
_08159D34:
	.4byte _08159D50
	.4byte _08159D98
	.4byte _08159DDC
	.4byte _08159DF4
	.4byte _08159E0C
	.4byte _08159E64
	.4byte _08159EA4
_08159D50:
	ldr r0, _08159D90 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _08159D62
	b _08159EDE
_08159D62:
	ldr r0, _08159D94 @ =gBattleStruct
	ldr r4, [r0]
	adds r5, r4, 0
	adds r5, 0x95
	adds r4, 0x94
	movs r0, 0
	bl GetBattlerAtPosition
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80EEFC8
	movs r0, 0x81
	negs r0, r0
	str r6, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x8
	b _08159E80
	.align 2, 0
_08159D90: .4byte gPaletteFade
_08159D94: .4byte gBattleStruct
_08159D98:
	ldr r0, _08159DD0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _08159DAA
	b _08159EDE
_08159DAA:
	ldr r2, _08159DD4 @ =gBitTable
	ldr r0, _08159DD8 @ =gBattleStruct
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x95
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	adds r0, 0x94
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	orrs r1, r0
	lsls r0, r1, 16
	str r3, [sp]
	b _08159E7A
	.align 2, 0
_08159DD0: .4byte gPaletteFade
_08159DD4: .4byte gBitTable
_08159DD8: .4byte gBattleStruct
_08159DDC:
	ldr r0, _08159DF0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08159DEA
	b _08159EDE
_08159DEA:
	bl sub_80EB30C
	b _08159E84
	.align 2, 0
_08159DF0: .4byte gPaletteFade
_08159DF4:
	bl sub_8159EF0
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _08159E08 @ =gDisplayedStringBattle
	movs r1, 0x18
	bl BattlePutTextOnWindow
	b _08159E84
	.align 2, 0
_08159E08: .4byte gDisplayedStringBattle
_08159E0C:
	movs r0, 0x18
	bl IsTextPrinterActive
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	bne _08159EDE
	ldr r0, _08159E58 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08159EDE
	movs r0, 0x5
	bl PlaySE
	ldr r2, _08159E5C @ =gBitTable
	ldr r0, _08159E60 @ =gBattleStruct
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x95
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	adds r0, 0x94
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	orrs r1, r0
	lsls r0, r1, 16
	str r4, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x8
	b _08159E80
	.align 2, 0
_08159E58: .4byte gMain
_08159E5C: .4byte gBitTable
_08159E60: .4byte gBattleStruct
_08159E64:
	ldr r0, _08159E98 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08159EDE
	movs r0, 0x81
	negs r0, r0
	str r1, [sp]
_08159E7A:
	movs r1, 0x4
	movs r2, 0x8
	movs r3, 0
_08159E80:
	bl BeginNormalPaletteFade
_08159E84:
	ldr r1, _08159E9C @ =gUnknown_3005EE0
	ldr r0, _08159EA0 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
	b _08159EDE
	.align 2, 0
_08159E98: .4byte gPaletteFade
_08159E9C: .4byte gUnknown_3005EE0
_08159EA0: .4byte gActiveBattler
_08159EA4:
	ldr r0, _08159EE8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08159EDE
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	cmp r0, 0xD
	bne _08159EC8
	bl BattleStopLowHpSound
	ldr r0, _08159EEC @ =0x00000137
	bl PlayBGM
_08159EC8:
	movs r0, 0
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	bl sub_80EF0E0
	bl sub_80EB524
	bl sub_8159B78
_08159EDE:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08159EE8: .4byte gPaletteFade
_08159EEC: .4byte 0x00000137
	thumb_func_end sub_8159D04

	thumb_func_start sub_8159EF0
sub_8159EF0: @ 8159EF0
	push {lr}
	ldr r0, _08159F10 @ =gBattleStruct
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x96
	ldrb r1, [r1]
	cmp r1, 0x1
	beq _08159F18
	cmp r1, 0x1
	ble _08159F0C
	cmp r1, 0x2
	beq _08159F20
	cmp r1, 0x3
	beq _08159F28
_08159F0C:
	ldr r1, _08159F14 @ =gUnknown_84791A8
	b _08159F2A
	.align 2, 0
_08159F10: .4byte gBattleStruct
_08159F14: .4byte gUnknown_84791A8
_08159F18:
	ldr r1, _08159F1C @ =gUnknown_84791B8
	b _08159F2A
	.align 2, 0
_08159F1C: .4byte gUnknown_84791B8
_08159F20:
	ldr r1, _08159F24 @ =gUnknown_84791CC
	b _08159F2A
	.align 2, 0
_08159F24: .4byte gUnknown_84791CC
_08159F28:
	ldr r1, _08159F3C @ =gUnknown_84791E8
_08159F2A:
	adds r0, 0x97
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08159F3C: .4byte gUnknown_84791E8
	thumb_func_end sub_8159EF0

	.align 2, 0 @ Don't pad with nop.
