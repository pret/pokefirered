	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8016E24
sub_8016E24: @ 8016E24
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	cmp r0, 0xC
	bhi _08016EC2
	lsls r0, 2
	ldr r1, _08016E3C @ =_08016E40
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08016E3C: .4byte _08016E40
	.align 2, 0
_08016E40:
	.4byte _08016E74
	.4byte _08016E80
	.4byte _08016E8C
	.4byte _08016EA8
	.4byte _08016EC2
	.4byte _08016EA8
	.4byte _08016EC2
	.4byte _08016E98
	.4byte _08016EC2
	.4byte _08016EC2
	.4byte _08016E9C
	.4byte _08016EB4
	.4byte _08016EB8
_08016E74:
	ldr r0, _08016E7C @ =gBattlerTarget
	ldrb r2, [r0]
	b _08016EC2
	.align 2, 0
_08016E7C: .4byte gBattlerTarget
_08016E80:
	ldr r0, _08016E88 @ =sBattler_AI
	ldrb r2, [r0]
	b _08016EC2
	.align 2, 0
_08016E88: .4byte sBattler_AI
_08016E8C:
	ldr r0, _08016E94 @ =gUnknown_2023D6E
	ldrb r2, [r0]
	b _08016EC2
	.align 2, 0
_08016E94: .4byte gUnknown_2023D6E
_08016E98:
	movs r2, 0
	b _08016EC2
_08016E9C:
	ldr r0, _08016EA4 @ =gBattleScripting
	ldrb r2, [r0, 0x17]
	b _08016EC2
	.align 2, 0
_08016EA4: .4byte gBattleScripting
_08016EA8:
	ldr r0, _08016EB0 @ =gUnknown_2023D6D
	ldrb r2, [r0]
	b _08016EC2
	.align 2, 0
_08016EB0: .4byte gUnknown_2023D6D
_08016EB4:
	movs r0, 0
	b _08016EBA
_08016EB8:
	movs r0, 0x1
_08016EBA:
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r2, r0, 24
_08016EC2:
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8016E24

	thumb_func_start PressurePPLose
PressurePPLose: @ 8016EC8
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 16
	lsrs r2, 16
	ldr r1, _08016EF8 @ =gBattleMons
	movs r4, 0x58
	muls r0, r4
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	mov r12, r1
	cmp r0, 0x2E
	bne _08016F7A
	movs r3, 0
	adds r0, r5, 0
	muls r0, r4
	adds r1, 0xC
	adds r1, r0, r1
	b _08016F04
	.align 2, 0
_08016EF8: .4byte gBattleMons
_08016EFC:
	adds r1, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	bgt _08016F0A
_08016F04:
	ldrh r0, [r1]
	cmp r0, r2
	bne _08016EFC
_08016F0A:
	cmp r3, 0x4
	beq _08016F7A
	movs r7, 0x58
	adds r2, r5, 0
	muls r2, r7
	adds r0, r3, r2
	mov r6, r12
	adds r6, 0x24
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, 0
	beq _08016F26
	subs r0, 0x1
	strb r0, [r1]
_08016F26:
	mov r0, r12
	adds r0, 0x50
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _08016F7A
	ldr r1, _08016F84 @ =gDisableStructs
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _08016F88 @ =gBitTable
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08016F7A
	ldr r4, _08016F8C @ =gActiveBattler
	strb r5, [r4]
	adds r1, r3, 0
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r4]
	muls r0, r7
	adds r0, r6
	adds r0, r3
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl EmitSetMonData
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_08016F7A:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016F84: .4byte gDisableStructs
_08016F88: .4byte gBitTable
_08016F8C: .4byte gActiveBattler
	thumb_func_end PressurePPLose

	thumb_func_start PressurePPLoseOnUsingImprision
PressurePPLoseOnUsingImprision: @ 8016F90
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x4
	mov r8, r0
	adds r0, r5, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r4, 0
	ldr r0, _080170B0 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r4, r0
	bge _08017038
	ldr r1, _080170B4 @ =gBattleMons
	movs r0, 0x58
	adds r7, r5, 0
	muls r7, r0
	adds r1, 0xC
	mov r10, r1
_08016FC6:
	lsls r0, r4, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	adds r6, r4, 0x1
	cmp r9, r0
	beq _0801702E
	ldr r0, _080170B4 @ =gBattleMons
	movs r3, 0x58
	adds r1, r4, 0
	muls r1, r3
	adds r1, r0
	adds r1, 0x20
	ldrb r1, [r1]
	adds r4, r0, 0
	cmp r1, 0x2E
	bne _0801702E
	movs r2, 0
	adds r0, r5, 0
	muls r0, r3
	adds r1, r4, 0
	adds r1, 0xC
	adds r0, r1
	ldrh r0, [r0]
	movs r1, 0x8F
	lsls r1, 1
	cmp r0, r1
	beq _08017016
	adds r3, r1, 0
	mov r0, r10
	adds r1, r7, r0
_08017008:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0x3
	bgt _08017016
	ldrh r0, [r1]
	cmp r0, r3
	bne _08017008
_08017016:
	cmp r2, 0x4
	beq _0801702E
	mov r8, r2
	adds r1, r2, r7
	adds r0, r4, 0
	adds r0, 0x24
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _0801702E
	subs r0, 0x1
	strb r0, [r1]
_0801702E:
	adds r4, r6, 0
	ldr r0, _080170B0 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r4, r0
	blt _08016FC6
_08017038:
	mov r1, r8
	cmp r1, 0x4
	beq _080170A0
	ldr r6, _080170B4 @ =gBattleMons
	movs r3, 0x58
	adds r0, r5, 0
	muls r0, r3
	adds r1, r6, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _080170A0
	ldr r1, _080170B8 @ =gDisableStructs
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _080170BC @ =gBitTable
	mov r4, r8
	lsls r0, r4, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080170A0
	ldr r4, _080170C0 @ =gActiveBattler
	strb r5, [r4]
	mov r1, r8
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r4]
	muls r0, r3
	adds r2, r6, 0
	adds r2, 0x24
	adds r0, r2
	add r0, r8
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl EmitSetMonData
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_080170A0:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080170B0: .4byte gBattlersCount
_080170B4: .4byte gBattleMons
_080170B8: .4byte gDisableStructs
_080170BC: .4byte gBitTable
_080170C0: .4byte gActiveBattler
	thumb_func_end PressurePPLoseOnUsingImprision

	thumb_func_start PressurePPLoseOnUsingPerishSong
PressurePPLoseOnUsingPerishSong: @ 80170C4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r3, r0, 24
	movs r6, 0x4
	movs r1, 0
	ldr r0, _080171BC @ =gBattlersCount
	mov r8, r0
	ldrb r0, [r0]
	cmp r1, r0
	bge _08017146
	ldr r7, _080171C0 @ =gBattleMons
	movs r2, 0x58
	mov r12, r2
	mov r5, r12
	muls r5, r3
	adds r0, r7, 0
	adds r0, 0xC
	adds r2, r5, r0
	mov r10, r2
	mov r9, r5
_080170F6:
	mov r0, r12
	muls r0, r1
	adds r0, r7
	adds r0, 0x20
	ldrb r0, [r0]
	adds r4, r1, 0x1
	cmp r0, 0x2E
	bne _0801713C
	cmp r1, r3
	beq _0801713C
	movs r2, 0
	mov r1, r10
	ldrh r0, [r1]
	cmp r0, 0xC3
	beq _08017126
	ldr r1, _080171C4 @ =gUnknown_2023BF0
	add r1, r9
_08017118:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0x3
	bgt _08017126
	ldrh r0, [r1]
	cmp r0, 0xC3
	bne _08017118
_08017126:
	cmp r2, 0x4
	beq _0801713C
	adds r6, r2, 0
	adds r0, r6, r5
	ldr r2, _080171C8 @ =gUnknown_2023C08
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _0801713C
	subs r0, 0x1
	strb r0, [r1]
_0801713C:
	adds r1, r4, 0
	mov r0, r8
	ldrb r0, [r0]
	cmp r1, r0
	blt _080170F6
_08017146:
	cmp r6, 0x4
	beq _080171AA
	ldr r7, _080171C0 @ =gBattleMons
	movs r5, 0x58
	adds r0, r3, 0
	muls r0, r5
	adds r1, r7, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _080171AA
	ldr r1, _080171CC @ =gDisableStructs
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _080171D0 @ =gBitTable
	lsls r0, r6, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080171AA
	ldr r4, _080171D4 @ =gActiveBattler
	strb r3, [r4]
	adds r1, r6, 0
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r4]
	muls r0, r5
	adds r2, r7, 0
	adds r2, 0x24
	adds r0, r2
	adds r0, r6
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl EmitSetMonData
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_080171AA:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080171BC: .4byte gBattlersCount
_080171C0: .4byte gBattleMons
_080171C4: .4byte gUnknown_2023BF0
_080171C8: .4byte gUnknown_2023C08
_080171CC: .4byte gDisableStructs
_080171D0: .4byte gBitTable
_080171D4: .4byte gActiveBattler
	thumb_func_end PressurePPLoseOnUsingPerishSong

	thumb_func_start MarkAllBufferBanksForExecution
MarkAllBufferBanksForExecution: @ 80171D8
	push {r4,r5,lr}
	ldr r0, _08017208 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08017218
	movs r2, 0
	ldr r4, _0801720C @ =gBattlersCount
	ldrb r0, [r4]
	cmp r2, r0
	bge _08017236
	ldr r3, _08017210 @ =gUnknown_2023BC8
	ldr r5, _08017214 @ =gBitTable
_080171F4:
	ldm r5!, {r1}
	lsls r1, 28
	ldr r0, [r3]
	orrs r0, r1
	str r0, [r3]
	adds r2, 0x1
	ldrb r0, [r4]
	cmp r2, r0
	blt _080171F4
	b _08017236
	.align 2, 0
_08017208: .4byte gBattleTypeFlags
_0801720C: .4byte gBattlersCount
_08017210: .4byte gUnknown_2023BC8
_08017214: .4byte gBitTable
_08017218:
	movs r2, 0
	ldr r4, _0801723C @ =gBattlersCount
	ldrb r0, [r4]
	cmp r2, r0
	bge _08017236
	ldr r3, _08017240 @ =gUnknown_2023BC8
	ldr r5, _08017244 @ =gBitTable
_08017226:
	ldr r0, [r3]
	ldm r5!, {r1}
	orrs r0, r1
	str r0, [r3]
	adds r2, 0x1
	ldrb r0, [r4]
	cmp r2, r0
	blt _08017226
_08017236:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801723C: .4byte gBattlersCount
_08017240: .4byte gUnknown_2023BC8
_08017244: .4byte gBitTable
	thumb_func_end MarkAllBufferBanksForExecution

	thumb_func_start MarkBufferBankForExecution
MarkBufferBankForExecution: @ 8017248
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _08017270 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0801727C
	ldr r2, _08017274 @ =gUnknown_2023BC8
	ldr r1, _08017278 @ =gBitTable
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	b _0801728C
	.align 2, 0
_08017270: .4byte gBattleTypeFlags
_08017274: .4byte gUnknown_2023BC8
_08017278: .4byte gBitTable
_0801727C:
	ldr r2, _08017290 @ =gUnknown_2023BC8
	ldr r1, _08017294 @ =gBitTable
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r2]
_0801728C:
	pop {r0}
	bx r0
	.align 2, 0
_08017290: .4byte gUnknown_2023BC8
_08017294: .4byte gBitTable
	thumb_func_end MarkBufferBankForExecution

	thumb_func_start sub_8017298
sub_8017298: @ 8017298
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r4, 0
	ldr r5, _080172AC @ =gUnknown_2023BC8
	ldr r1, _080172B0 @ =gBitTable
	lsls r0, r7, 2
	adds r6, r0, r1
	b _080172C2
	.align 2, 0
_080172AC: .4byte gUnknown_2023BC8
_080172B0: .4byte gBitTable
_080172B4:
	lsls r0, r4, 2
	ldr r1, [r6]
	lsls r1, r0
	ldr r0, [r5]
	orrs r0, r1
	str r0, [r5]
	adds r4, 0x1
_080172C2:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	blt _080172B4
	ldr r2, _080172E4 @ =gUnknown_2023BC8
	movs r1, 0x80
	lsls r1, 21
	lsls r1, r7
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080172E4: .4byte gUnknown_2023BC8
	thumb_func_end sub_8017298

	thumb_func_start CancelMultiTurnMoves
CancelMultiTurnMoves: @ 80172E8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08017338 @ =gBattleMons
	movs r2, 0x58
	adds r3, r0, 0
	muls r3, r2
	adds r1, 0x50
	adds r3, r1
	ldr r1, [r3]
	ldr r2, _0801733C @ =0xffffefff
	ands r1, r2
	ldr r2, _08017340 @ =0xfffff3ff
	ands r1, r2
	movs r2, 0x71
	negs r2, r2
	ands r1, r2
	ldr r2, _08017344 @ =0xfffffcff
	ands r1, r2
	str r1, [r3]
	ldr r1, _08017348 @ =gStatuses3
	lsls r2, r0, 2
	adds r2, r1
	ldr r1, [r2]
	ldr r3, _0801734C @ =0xfffbff3f
	ands r1, r3
	str r1, [r2]
	ldr r2, _08017350 @ =gDisableStructs
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x11]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x11]
	movs r0, 0
	strb r0, [r1, 0x10]
	bx lr
	.align 2, 0
_08017338: .4byte gBattleMons
_0801733C: .4byte 0xffffefff
_08017340: .4byte 0xfffff3ff
_08017344: .4byte 0xfffffcff
_08017348: .4byte gStatuses3
_0801734C: .4byte 0xfffbff3f
_08017350: .4byte gDisableStructs
	thumb_func_end CancelMultiTurnMoves

	thumb_func_start WasUnableToUseMove
WasUnableToUseMove: @ 8017354
	push {lr}
	lsls r0, 24
	ldr r1, _080173A0 @ =gUnknown_2023E8C
	lsrs r0, 20
	adds r1, r0, r1
	ldrb r0, [r1]
	lsrs r0, 7
	cmp r0, 0
	bne _0801739A
	ldrb r2, [r1, 0x1]
	lsls r0, r2, 30
	cmp r0, 0
	blt _0801739A
	lsls r0, r2, 26
	cmp r0, 0
	blt _0801739A
	lsls r0, r2, 25
	cmp r0, 0
	blt _0801739A
	lsrs r0, r2, 7
	cmp r0, 0
	bne _0801739A
	ldrb r1, [r1, 0x2]
	lsls r0, r1, 31
	cmp r0, 0
	bne _0801739A
	lsls r0, r1, 30
	cmp r0, 0
	blt _0801739A
	lsls r0, r1, 29
	cmp r0, 0
	blt _0801739A
	lsls r0, r2, 31
	cmp r0, 0
	beq _080173A4
_0801739A:
	movs r0, 0x1
	b _080173A6
	.align 2, 0
_080173A0: .4byte gUnknown_2023E8C
_080173A4:
	movs r0, 0
_080173A6:
	pop {r1}
	bx r1
	thumb_func_end WasUnableToUseMove

	thumb_func_start PrepareStringBattle
PrepareStringBattle: @ 80173AC
	push {r4,lr}
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	ldr r4, _080173CC @ =gActiveBattler
	strb r1, [r4]
	movs r0, 0
	adds r1, r2, 0
	bl EmitPrintString
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080173CC: .4byte gActiveBattler
	thumb_func_end PrepareStringBattle

	thumb_func_start ResetSentPokesToOpponentValue
ResetSentPokesToOpponentValue: @ 80173D0
	push {r4-r6,lr}
	movs r3, 0
	ldr r0, _08017424 @ =gUnknown_2023F4E
	strb r3, [r0]
	strb r3, [r0, 0x1]
	movs r1, 0
	ldr r0, _08017428 @ =gBattlersCount
	ldrb r2, [r0]
	adds r6, r0, 0
	cmp r1, r2
	bge _080173FE
	ldr r5, _0801742C @ =gBitTable
	adds r4, r2, 0
	ldr r2, _08017430 @ =gBattlerPartyIndexes
_080173EC:
	ldrh r0, [r2]
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	orrs r3, r0
	adds r2, 0x4
	adds r1, 0x2
	cmp r1, r4
	blt _080173EC
_080173FE:
	movs r1, 0x1
	adds r2, r6, 0
	ldrb r0, [r2]
	cmp r1, r0
	bge _0801741E
	ldr r5, _08017424 @ =gUnknown_2023F4E
	movs r4, 0x2
_0801740C:
	adds r0, r1, 0
	ands r0, r4
	asrs r0, 1
	adds r0, r5
	strb r3, [r0]
	adds r1, 0x2
	ldrb r0, [r2]
	cmp r1, r0
	blt _0801740C
_0801741E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08017424: .4byte gUnknown_2023F4E
_08017428: .4byte gBattlersCount
_0801742C: .4byte gBitTable
_08017430: .4byte gBattlerPartyIndexes
	thumb_func_end ResetSentPokesToOpponentValue

	thumb_func_start sub_8017434
sub_8017434: @ 8017434
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	adds r0, r5, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08017498
	movs r0, 0x2
	ands r0, r5
	lsls r0, 24
	lsrs r0, 25
	mov r12, r0
	ldr r1, _080174A4 @ =gUnknown_2023F4E
	adds r0, r1
	strb r4, [r0]
	adds r5, r4, 0
	ldr r0, _080174A8 @ =gBattlersCount
	ldrb r2, [r0]
	mov r8, r1
	cmp r4, r2
	bge _08017492
	ldr r0, _080174AC @ =gAbsentBattlerFlags
	ldrb r7, [r0]
	ldr r1, _080174B0 @ =gBitTable
	adds r6, r2, 0
	ldr r3, _080174B4 @ =gBattlerPartyIndexes
	adds r2, r1, 0
_08017476:
	ldr r0, [r2]
	ands r0, r7
	cmp r0, 0
	bne _08017488
	ldrh r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	orrs r4, r0
_08017488:
	adds r3, 0x4
	adds r2, 0x8
	adds r5, 0x2
	cmp r5, r6
	blt _08017476
_08017492:
	mov r0, r12
	add r0, r8
	strb r4, [r0]
_08017498:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080174A4: .4byte gUnknown_2023F4E
_080174A8: .4byte gBattlersCount
_080174AC: .4byte gAbsentBattlerFlags
_080174B0: .4byte gBitTable
_080174B4: .4byte gBattlerPartyIndexes
	thumb_func_end sub_8017434

	thumb_func_start sub_80174B8
sub_80174B8: @ 80174B8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080174D4
	adds r0, r4, 0
	bl sub_8017434
	b _0801750A
_080174D4:
	movs r3, 0x1
	ldr r5, _08017510 @ =gBattlersCount
	ldrb r0, [r5]
	cmp r3, r0
	bge _0801750A
	ldr r0, _08017514 @ =gUnknown_2023F4E
	mov r12, r0
	movs r7, 0x2
	ldr r6, _08017518 @ =gBitTable
	ldr r1, _0801751C @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r4, r0, r1
_080174EC:
	adds r2, r3, 0
	ands r2, r7
	asrs r2, 1
	add r2, r12
	ldrh r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r3, 0x1
	ldrb r0, [r5]
	cmp r3, r0
	blt _080174EC
_0801750A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017510: .4byte gBattlersCount
_08017514: .4byte gUnknown_2023F4E
_08017518: .4byte gBitTable
_0801751C: .4byte gBattlerPartyIndexes
	thumb_func_end sub_80174B8

	thumb_func_start BattleScriptPush
BattleScriptPush: @ 8017520
	push {r4,lr}
	ldr r1, _08017540 @ =gBattleResources
	ldr r1, [r1]
	ldr r3, [r1, 0x8]
	adds r4, r3, 0
	adds r4, 0x20
	ldrb r1, [r4]
	adds r2, r1, 0x1
	strb r2, [r4]
	lsls r1, 24
	lsrs r1, 22
	adds r3, r1
	str r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08017540: .4byte gBattleResources
	thumb_func_end BattleScriptPush

	thumb_func_start BattleScriptPushCursor
BattleScriptPushCursor: @ 8017544
	ldr r0, _08017564 @ =gBattleResources
	ldr r0, [r0]
	ldr r2, [r0, 0x8]
	adds r3, r2, 0
	adds r3, 0x20
	ldrb r0, [r3]
	adds r1, r0, 0x1
	strb r1, [r3]
	lsls r0, 24
	lsrs r0, 22
	adds r2, r0
	ldr r0, _08017568 @ =gUnknown_2023D74
	ldr r0, [r0]
	str r0, [r2]
	bx lr
	.align 2, 0
_08017564: .4byte gBattleResources
_08017568: .4byte gUnknown_2023D74
	thumb_func_end BattleScriptPushCursor

	thumb_func_start BattleScriptPop
BattleScriptPop: @ 801756C
	ldr r3, _0801758C @ =gUnknown_2023D74
	ldr r0, _08017590 @ =gBattleResources
	ldr r0, [r0]
	ldr r1, [r0, 0x8]
	adds r2, r1, 0
	adds r2, 0x20
	ldrb r0, [r2]
	subs r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 22
	adds r1, r0
	ldr r0, [r1]
	str r0, [r3]
	bx lr
	.align 2, 0
_0801758C: .4byte gUnknown_2023D74
_08017590: .4byte gBattleResources
	thumb_func_end BattleScriptPop

	thumb_func_start sub_8017594
sub_8017594: @ 8017594
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0
	ldr r2, _080176AC @ =gBattleMons
	ldr r1, _080176B0 @ =gUnknown_20233C4
	ldr r5, _080176B4 @ =gActiveBattler
	ldrb r3, [r5]
	lsls r0, r3, 9
	adds r1, 0x2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	movs r1, 0x58
	muls r1, r3
	adds r0, r1
	adds r2, 0xC
	adds r0, r2
	ldrh r4, [r0]
	ldr r1, _080176B8 @ =gBattleStruct
	lsls r0, r3, 1
	adds r0, 0xC8
	ldr r1, [r1]
	adds r1, r0
	mov r8, r1
	ldr r1, _080176BC @ =gDisableStructs
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x4]
	cmp r0, r4
	bne _080175F0
	cmp r4, 0
	beq _080175F0
	ldr r0, _080176C0 @ =gBattleScripting
	strb r3, [r0, 0x17]
	ldr r0, _080176C4 @ =gCurrentMove
	strh r4, [r0]
	ldr r1, _080176C8 @ =gUnknown_2023D80
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080176CC @ =gUnknown_81D8C5A
	str r1, [r0]
	movs r6, 0x1
_080175F0:
	ldr r1, _080176D0 @ =gLastUsedMove
	ldr r5, _080176B4 @ =gActiveBattler
	ldrb r2, [r5]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	bne _0801762C
	cmp r4, 0xA5
	beq _0801762C
	ldr r1, _080176AC @ =gBattleMons
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	bge _0801762C
	adds r0, r2, 0
	bl CancelMultiTurnMoves
	ldr r1, _080176C8 @ =gUnknown_2023D80
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080176D4 @ =gUnknown_81D8EB7
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0801762C:
	ldr r2, _080176BC @ =gDisableStructs
	ldr r3, _080176B4 @ =gActiveBattler
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x13]
	lsls r0, 28
	cmp r0, 0
	beq _08017668
	ldr r0, _080176D8 @ =gBattleMoves
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _08017668
	ldr r0, _080176C4 @ =gCurrentMove
	strh r4, [r0]
	ldr r1, _080176C8 @ =gUnknown_2023D80
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080176DC @ =gUnknown_81D8EC6
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08017668:
	ldr r5, _080176B4 @ =gActiveBattler
	ldrb r0, [r5]
	adds r1, r4, 0
	bl GetImprisonedMovesCount
	lsls r0, 24
	cmp r0, 0
	beq _0801768E
	ldr r0, _080176C4 @ =gCurrentMove
	strh r4, [r0]
	ldr r1, _080176C8 @ =gUnknown_2023D80
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080176E0 @ =gUnknown_81D8F9F
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0801768E:
	ldr r1, _080176AC @ =gBattleMons
	ldrb r2, [r5]
	movs r0, 0x58
	muls r0, r2
	adds r1, r0, r1
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _080176E8
	ldr r1, _080176E4 @ =gEnigmaBerries
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r3, [r0, 0x7]
	b _080176F2
	.align 2, 0
_080176AC: .4byte gBattleMons
_080176B0: .4byte gUnknown_20233C4
_080176B4: .4byte gActiveBattler
_080176B8: .4byte gBattleStruct
_080176BC: .4byte gDisableStructs
_080176C0: .4byte gBattleScripting
_080176C4: .4byte gCurrentMove
_080176C8: .4byte gUnknown_2023D80
_080176CC: .4byte gUnknown_81D8C5A
_080176D0: .4byte gLastUsedMove
_080176D4: .4byte gUnknown_81D8EB7
_080176D8: .4byte gBattleMoves
_080176DC: .4byte gUnknown_81D8EC6
_080176E0: .4byte gUnknown_81D8F9F
_080176E4: .4byte gEnigmaBerries
_080176E8:
	ldrh r0, [r1, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r3, r0, 24
_080176F2:
	ldr r2, _08017774 @ =gPotentialItemEffectBattler
	ldr r1, _08017778 @ =gActiveBattler
	ldrb r0, [r1]
	strb r0, [r2]
	ldr r7, _0801777C @ =gBattleMons
	adds r5, r1, 0
	cmp r3, 0x1D
	bne _0801773A
	mov r0, r8
	ldrh r1, [r0]
	adds r2, r1, 0
	cmp r2, 0
	beq _0801773A
	ldr r0, _08017780 @ =0x0000ffff
	cmp r2, r0
	beq _0801773A
	cmp r2, r4
	beq _0801773A
	ldr r0, _08017784 @ =gCurrentMove
	strh r1, [r0]
	ldr r2, _08017788 @ =gUnknown_2023D68
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	adds r0, r7
	ldrh r0, [r0, 0x2E]
	strh r0, [r2]
	ldr r1, _0801778C @ =gUnknown_2023D80
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08017790 @ =gUnknown_81D963D
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0801773A:
	ldr r0, _08017794 @ =gUnknown_20233C4
	ldrb r2, [r5]
	lsls r1, r2, 9
	adds r0, 0x2
	adds r1, r0
	movs r0, 0x58
	muls r0, r2
	ldrb r1, [r1]
	adds r0, r1
	adds r1, r7, 0
	adds r1, 0x24
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08017768
	ldr r1, _0801778C @ =gUnknown_2023D80
	lsls r0, r2, 2
	adds r0, r1
	ldr r1, _08017798 @ =gUnknown_81D8EA4
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08017768:
	adds r0, r6, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08017774: .4byte gPotentialItemEffectBattler
_08017778: .4byte gActiveBattler
_0801777C: .4byte gBattleMons
_08017780: .4byte 0x0000ffff
_08017784: .4byte gCurrentMove
_08017788: .4byte gUnknown_2023D68
_0801778C: .4byte gUnknown_2023D80
_08017790: .4byte gUnknown_81D963D
_08017794: .4byte gUnknown_20233C4
_08017798: .4byte gUnknown_81D8EA4
	thumb_func_end sub_8017594

	thumb_func_start CheckMoveLimitations
CheckMoveLimitations: @ 801779C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r3, r2, 24
	ldr r1, _080177E0 @ =gBattleStruct
	lsls r0, r7, 1
	adds r0, 0xC8
	ldr r1, [r1]
	adds r1, r0
	str r1, [sp, 0x4]
	ldr r1, _080177E4 @ =gBattleMons
	movs r0, 0x58
	muls r0, r7
	adds r1, r0, r1
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _080177EC
	ldr r2, _080177E8 @ =gEnigmaBerries
	lsls r1, r7, 3
	subs r0, r1, r7
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x7]
	str r0, [sp]
	b _080177FE
	.align 2, 0
_080177E0: .4byte gBattleStruct
_080177E4: .4byte gBattleMons
_080177E8: .4byte gEnigmaBerries
_080177EC:
	ldrh r0, [r1, 0x2E]
	str r3, [sp, 0x14]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r1, r7, 3
	ldr r3, [sp, 0x14]
_080177FE:
	ldr r0, _08017978 @ =gPotentialItemEffectBattler
	strb r7, [r0]
	movs r0, 0
	mov r9, r0
	lsls r2, r7, 1
	str r2, [sp, 0xC]
	ldr r5, _0801797C @ =gDisableStructs
	mov r12, r5
	ldr r0, _08017980 @ =gBattleMons
	movs r2, 0x58
	adds r6, r7, 0
	muls r6, r2
	str r6, [sp, 0x8]
	ldr r2, _08017984 @ =gUnknown_2023BF0
	adds r5, r6, r2
	movs r6, 0
	str r6, [sp, 0x10]
	mov r10, r0
	subs r0, r1, r7
	lsls r0, 2
	mov r8, r0
	ldr r6, _08017988 @ =gBitTable
_0801782A:
	ldrh r0, [r5]
	cmp r0, 0
	bne _08017840
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _08017840
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08017840:
	ldr r0, [sp, 0x8]
	add r0, r9
	mov r1, r10
	adds r1, 0x24
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08017860
	movs r0, 0x2
	ands r0, r3
	cmp r0, 0
	beq _08017860
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08017860:
	mov r1, r8
	add r1, r12
	ldrh r0, [r5]
	ldrh r1, [r1, 0x4]
	cmp r0, r1
	bne _0801787C
	movs r0, 0x4
	ands r0, r3
	cmp r0, 0
	beq _0801787C
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_0801787C:
	movs r0, 0x58
	adds r2, r7, 0
	muls r2, r0
	ldr r1, [sp, 0x10]
	adds r0, r1, r2
	ldr r1, _08017984 @ =gUnknown_2023BF0
	adds r0, r1
	mov r12, r0
	ldr r1, _0801798C @ =gLastUsedMove
	ldr r0, [sp, 0xC]
	adds r1, r0, r1
	str r1, [sp, 0x18]
	mov r1, r12
	ldrh r1, [r1]
	mov r12, r1
	ldr r0, [sp, 0x18]
	ldrh r0, [r0]
	cmp r12, r0
	bne _080178BE
	movs r0, 0x8
	ands r0, r3
	cmp r0, 0
	beq _080178BE
	mov r0, r10
	adds r0, 0x50
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	bge _080178BE
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_080178BE:
	ldr r0, _0801797C @ =gDisableStructs
	add r0, r8
	ldrb r0, [r0, 0x13]
	lsls r0, 28
	cmp r0, 0
	beq _080178EC
	movs r0, 0x10
	ands r0, r3
	cmp r0, 0
	beq _080178EC
	ldr r2, _08017990 @ =gBattleMoves
	ldrh r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _080178EC
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_080178EC:
	ldrh r1, [r5]
	adds r0, r7, 0
	str r3, [sp, 0x14]
	bl GetImprisonedMovesCount
	lsls r0, 24
	ldr r3, [sp, 0x14]
	cmp r0, 0
	beq _0801790E
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	beq _0801790E
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_0801790E:
	ldr r1, _0801797C @ =gDisableStructs
	mov r0, r8
	adds r2, r0, r1
	ldrb r0, [r2, 0xE]
	lsls r0, 28
	mov r12, r1
	cmp r0, 0
	beq _0801792E
	ldrh r0, [r2, 0x6]
	ldrh r1, [r5]
	cmp r0, r1
	beq _0801792E
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_0801792E:
	ldr r2, [sp]
	cmp r2, 0x1D
	bne _08017950
	ldr r0, [sp, 0x4]
	ldrh r1, [r0]
	cmp r1, 0
	beq _08017950
	ldr r0, _08017994 @ =0x0000ffff
	cmp r1, r0
	beq _08017950
	ldrh r2, [r5]
	cmp r1, r2
	beq _08017950
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08017950:
	adds r6, 0x4
	adds r5, 0x2
	ldr r0, [sp, 0x10]
	adds r0, 0x2
	str r0, [sp, 0x10]
	movs r1, 0x1
	add r9, r1
	mov r2, r9
	cmp r2, 0x3
	bgt _08017966
	b _0801782A
_08017966:
	adds r0, r4, 0
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08017978: .4byte gPotentialItemEffectBattler
_0801797C: .4byte gDisableStructs
_08017980: .4byte gBattleMons
_08017984: .4byte gUnknown_2023BF0
_08017988: .4byte gBitTable
_0801798C: .4byte gLastUsedMove
_08017990: .4byte gBattleMoves
_08017994: .4byte 0x0000ffff
	thumb_func_end CheckMoveLimitations

	thumb_func_start sub_8017998
sub_8017998: @ 8017998
	push {r4-r6,lr}
	ldr r5, _08017A04 @ =gActiveBattler
	ldrb r0, [r5]
	movs r1, 0
	movs r2, 0xFF
	bl CheckMoveLimitations
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xF
	bne _08017A40
	ldr r0, _08017A08 @ =gUnknown_2023E8C
	ldrb r1, [r5]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _08017A0C @ =gUnknown_2023D80
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08017A10 @ =gUnknown_81D8EA0
	str r1, [r0]
	ldr r0, _08017A14 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08017A1C
	ldrb r0, [r5]
	bl GetBattlerPosition
	adds r4, r0, 0
	bl Random
	movs r1, 0x1
	eors r4, r1
	movs r1, 0x2
	ands r1, r0
	orrs r4, r1
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl GetBattlerAtPosition
	ldr r2, _08017A18 @ =gUnknown_20233C4
	ldrb r1, [r5]
	lsls r1, 9
	adds r2, 0x3
	adds r1, r2
	b _08017A50
	.align 2, 0
_08017A04: .4byte gActiveBattler
_08017A08: .4byte gUnknown_2023E8C
_08017A0C: .4byte gUnknown_2023D80
_08017A10: .4byte gUnknown_81D8EA0
_08017A14: .4byte gBattleTypeFlags
_08017A18: .4byte gUnknown_20233C4
_08017A1C:
	ldrb r0, [r5]
	bl GetBattlerPosition
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerAtPosition
	ldr r2, _08017A3C @ =gUnknown_20233C4
	ldrb r1, [r5]
	lsls r1, 9
	adds r2, 0x3
	adds r1, r2
	b _08017A50
	.align 2, 0
_08017A3C: .4byte gUnknown_20233C4
_08017A40:
	ldr r0, _08017A60 @ =gUnknown_2023E8C
	ldrb r1, [r5]
	lsls r1, 4
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
_08017A50:
	strb r0, [r1]
	movs r0, 0
	cmp r6, 0xF
	bne _08017A5A
	movs r0, 0x1
_08017A5A:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08017A60: .4byte gUnknown_2023E8C
	thumb_func_end sub_8017998

	thumb_func_start GetImprisonedMovesCount
GetImprisonedMovesCount: @ 8017A64
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	movs r6, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r4, 0
	ldr r0, _08017AF8 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r6, r0
	bge _08017AE8
	ldr r7, _08017AFC @ =gUnknown_2023BF0
	mov r8, r7
_08017A8E:
	lsls r0, r4, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	adds r3, r4, 0x1
	cmp r9, r0
	beq _08017ADE
	ldr r1, _08017B00 @ =gStatuses3
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 6
	ands r0, r1
	cmp r0, 0
	beq _08017ADE
	movs r2, 0
	movs r0, 0x58
	adds r1, r4, 0
	muls r1, r0
	adds r0, r1, r7
	ldrh r0, [r0]
	cmp r5, r0
	beq _08017AD4
	mov r4, r8
	adds r0, r1, r4
_08017AC6:
	adds r0, 0x2
	adds r2, 0x1
	cmp r2, 0x3
	bgt _08017ADE
	ldrh r1, [r0]
	cmp r5, r1
	bne _08017AC6
_08017AD4:
	cmp r2, 0x3
	bgt _08017ADE
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08017ADE:
	adds r4, r3, 0
	ldr r0, _08017AF8 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r4, r0
	blt _08017A8E
_08017AE8:
	adds r0, r6, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08017AF8: .4byte gBattlersCount
_08017AFC: .4byte gUnknown_2023BF0
_08017B00: .4byte gStatuses3
	thumb_func_end GetImprisonedMovesCount

	thumb_func_start UpdateTurnCounters
UpdateTurnCounters: @ 8017B04
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0
	mov r9, r0
	ldr r1, _08017BA8 @ =sBattler_AI
	mov r2, r9
	strb r2, [r1]
	ldr r0, _08017BAC @ =gBattlersCount
	ldrb r4, [r0]
	adds r6, r1, 0
	mov r10, r0
	ldr r7, _08017BB0 @ =gBattlerTarget
	ldr r3, _08017BB4 @ =gBattleStruct
	mov r12, r3
	cmp r9, r4
	bcs _08017B58
	ldr r2, _08017BB8 @ =gAbsentBattlerFlags
	ldrb r1, [r2]
	ldr r5, _08017BBC @ =gBitTable
	ldr r0, [r5]
	ands r1, r0
	cmp r1, 0
	beq _08017B58
	adds r3, r6, 0
_08017B3A:
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r4
	bcs _08017B58
	ldrb r0, [r2]
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r5
	ldr r1, [r1]
	ands r0, r1
	cmp r0, 0
	bne _08017B3A
_08017B58:
	movs r0, 0
	strb r0, [r7]
	mov r0, r10
	ldrb r4, [r0]
	cmp r4, 0
	beq _08017B92
	ldr r2, _08017BB8 @ =gAbsentBattlerFlags
	ldrb r1, [r2]
	ldr r5, _08017BBC @ =gBitTable
	ldr r0, [r5]
	ands r1, r0
	cmp r1, 0
	beq _08017B92
	adds r3, r7, 0
_08017B74:
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r4
	bcs _08017B92
	ldrb r0, [r2]
	ldrb r1, [r7]
	lsls r1, 2
	adds r1, r5
	ldr r1, [r1]
	ands r0, r1
	cmp r0, 0
	bne _08017B74
_08017B92:
	mov r1, r12
	ldr r0, [r1]
	ldrb r0, [r0, 0x3]
	cmp r0, 0xA
	bls _08017B9E
	b _0801822A
_08017B9E:
	lsls r0, 2
	ldr r1, _08017BC0 @ =_08017BC4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08017BA8: .4byte sBattler_AI
_08017BAC: .4byte gBattlersCount
_08017BB0: .4byte gBattlerTarget
_08017BB4: .4byte gBattleStruct
_08017BB8: .4byte gAbsentBattlerFlags
_08017BBC: .4byte gBitTable
_08017BC0: .4byte _08017BC4
	.align 2, 0
_08017BC4:
	.4byte _08017BF0
	.4byte _08017C76
	.4byte _08017D3C
	.4byte _08017E08
	.4byte _08017EE4
	.4byte _08017F9C
	.4byte _08018050
	.4byte _080180D4
	.4byte _08018144
	.4byte _0801819C
	.4byte _08018220
_08017BF0:
	movs r5, 0
	ldr r1, _08017C10 @ =gBattlersCount
	mov r10, r1
	ldrb r2, [r1]
	cmp r5, r2
	bge _08017C0A
	ldr r2, _08017C14 @ =gUnknown_2023BDE
_08017BFE:
	adds r0, r5, r2
	strb r5, [r0]
	adds r5, 0x1
	ldrb r3, [r1]
	cmp r5, r3
	blt _08017BFE
_08017C0A:
	movs r5, 0
	b _08017C58
	.align 2, 0
_08017C10: .4byte gBattlersCount
_08017C14: .4byte gUnknown_2023BDE
_08017C18:
	adds r4, r5, 0x1
	adds r6, r4, 0
	ldrb r1, [r1]
	cmp r6, r1
	bge _08017C56
	ldr r7, _08017D14 @ =gUnknown_2023BDE
	ldr r0, _08017D18 @ =gBattlersCount
	mov r10, r0
	lsls r1, r5, 24
	mov r8, r1
_08017C2C:
	adds r0, r5, r7
	ldrb r0, [r0]
	adds r1, r4, r7
	ldrb r1, [r1]
	movs r2, 0
	bl GetWhoStrikesFirst
	lsls r0, 24
	cmp r0, 0
	beq _08017C4C
	lsls r1, r4, 24
	lsrs r1, 24
	mov r2, r8
	lsrs r0, r2, 24
	bl SwapTurnOrder
_08017C4C:
	adds r4, 0x1
	ldr r0, _08017D18 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r4, r0
	blt _08017C2C
_08017C56:
	adds r5, r6, 0
_08017C58:
	mov r1, r10
	ldrb r0, [r1]
	subs r0, 0x1
	cmp r5, r0
	blt _08017C18
	ldr r2, _08017D1C @ =gBattleStruct
	ldr r1, [r2]
	ldrb r0, [r1, 0x3]
	adds r0, 0x1
	strb r0, [r1, 0x3]
	ldr r0, [r2]
	adds r0, 0xDB
	movs r1, 0
	strb r1, [r0]
	mov r12, r2
_08017C76:
	mov r1, r12
	ldr r0, [r1]
	adds r0, 0xDB
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _08017C84
	b _08017F60
_08017C84:
	ldr r3, _08017D20 @ =gActiveBattler
	mov r8, r3
	movs r7, 0
	ldr r6, _08017D24 @ =sBattler_AI
	ldr r5, _08017D28 @ =gBattleTextBuff1
_08017C8E:
	ldr r0, [r1]
	adds r0, 0xDB
	ldrb r4, [r0]
	ldr r2, _08017D2C @ =gSideTimers
	lsls r1, r4, 1
	adds r0, r1, r4
	lsls r0, 2
	adds r2, r0, r2
	ldrb r0, [r2, 0x1]
	strb r0, [r6]
	mov r3, r8
	strb r0, [r3]
	ldr r0, _08017D30 @ =gSideAffecting
	adds r3, r1, r0
	ldrh r1, [r3]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08017CF0
	ldrb r0, [r2]
	subs r0, 0x1
	strb r0, [r2]
	movs r4, 0xFF
	lsls r0, 24
	cmp r0, 0
	bne _08017CF0
	ldrh r0, [r3]
	ldr r2, _08017D34 @ =0x0000fffe
	adds r1, r2, 0
	ands r0, r1
	strh r0, [r3]
	ldr r0, _08017D38 @ =gUnknown_81D8B32
	bl BattleScriptExecute
	movs r0, 0xFD
	strb r0, [r5]
	movs r0, 0x2
	strb r0, [r5, 0x1]
	movs r0, 0x73
	strb r0, [r5, 0x2]
	strb r7, [r5, 0x3]
	ldrb r0, [r5, 0x4]
	orrs r0, r4
	strb r0, [r5, 0x4]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08017CF0:
	ldr r2, _08017D1C @ =gBattleStruct
	ldr r1, [r2]
	adds r1, 0xDB
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r12, r2
	mov r3, r9
	cmp r3, 0
	beq _08017D06
	b _08018232
_08017D06:
	mov r1, r12
	ldr r0, [r1]
	adds r0, 0xDB
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _08017C8E
	b _08017F60
	.align 2, 0
_08017D14: .4byte gUnknown_2023BDE
_08017D18: .4byte gBattlersCount
_08017D1C: .4byte gBattleStruct
_08017D20: .4byte gActiveBattler
_08017D24: .4byte sBattler_AI
_08017D28: .4byte gBattleTextBuff1
_08017D2C: .4byte gSideTimers
_08017D30: .4byte gSideAffecting
_08017D34: .4byte 0x0000fffe
_08017D38: .4byte gUnknown_81D8B32
_08017D3C:
	mov r1, r12
	ldr r0, [r1]
	adds r0, 0xDB
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _08017D4A
	b _08017EA4
_08017D4A:
	movs r0, 0x2
	mov r10, r0
	movs r2, 0
	mov r8, r2
	ldr r7, _08017DE4 @ =sBattler_AI
	ldr r5, _08017DE8 @ =gBattleTextBuff1
_08017D56:
	ldr r0, [r1]
	adds r0, 0xDB
	ldrb r4, [r0]
	ldr r2, _08017DEC @ =gSideTimers
	lsls r1, r4, 1
	adds r0, r1, r4
	lsls r0, 2
	adds r2, r0, r2
	ldrb r0, [r2, 0x3]
	strb r0, [r7]
	ldr r3, _08017DF0 @ =gActiveBattler
	strb r0, [r3]
	ldr r0, _08017DF4 @ =gSideAffecting
	adds r3, r1, r0
	ldrh r1, [r3]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08017DBE
	ldrb r0, [r2, 0x2]
	subs r0, 0x1
	strb r0, [r2, 0x2]
	movs r6, 0xFF
	lsls r0, 24
	cmp r0, 0
	bne _08017DBE
	ldrh r0, [r3]
	ldr r2, _08017DF8 @ =0x0000fffd
	adds r1, r2, 0
	ands r0, r1
	strh r0, [r3]
	ldr r0, _08017DFC @ =gUnknown_81D8B32
	bl BattleScriptExecute
	ldr r0, _08017E00 @ =gUnknown_2023E82
	strb r4, [r0, 0x5]
	movs r0, 0xFD
	strb r0, [r5]
	mov r3, r10
	strb r3, [r5, 0x1]
	movs r0, 0x71
	strb r0, [r5, 0x2]
	mov r0, r8
	strb r0, [r5, 0x3]
	ldrb r0, [r5, 0x4]
	orrs r0, r6
	strb r0, [r5, 0x4]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08017DBE:
	ldr r2, _08017E04 @ =gBattleStruct
	ldr r1, [r2]
	adds r1, 0xDB
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r12, r2
	mov r1, r9
	cmp r1, 0
	beq _08017DD4
	b _08018232
_08017DD4:
	mov r1, r12
	ldr r0, [r1]
	adds r0, 0xDB
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _08017D56
	b _08017EA4
	.align 2, 0
_08017DE4: .4byte sBattler_AI
_08017DE8: .4byte gBattleTextBuff1
_08017DEC: .4byte gSideTimers
_08017DF0: .4byte gActiveBattler
_08017DF4: .4byte gSideAffecting
_08017DF8: .4byte 0x0000fffd
_08017DFC: .4byte gUnknown_81D8B32
_08017E00: .4byte gUnknown_2023E82
_08017E04: .4byte gBattleStruct
_08017E08:
	mov r1, r12
	ldr r0, [r1]
	adds r0, 0xDB
	ldrb r0, [r0]
	cmp r0, 0x1
	bhi _08017EA4
	ldr r0, _08017EC0 @ =gActiveBattler
	mov r10, r0
	movs r2, 0
	mov r8, r2
	ldr r7, _08017EC4 @ =sBattler_AI
	ldr r5, _08017EC8 @ =gBattleTextBuff1
_08017E20:
	ldr r0, [r1]
	adds r0, 0xDB
	ldrb r4, [r0]
	ldr r1, _08017ECC @ =gSideTimers
	lsls r3, r4, 1
	adds r0, r3, r4
	lsls r0, 2
	adds r1, r0, r1
	ldrb r0, [r1, 0x5]
	strb r0, [r7]
	mov r2, r10
	strb r0, [r2]
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _08017E82
	subs r0, 0x1
	strb r0, [r1, 0x4]
	movs r6, 0xFF
	lsls r0, 24
	cmp r0, 0
	bne _08017E82
	ldr r2, _08017ED0 @ =gSideAffecting
	adds r2, r3, r2
	ldrh r0, [r2]
	ldr r3, _08017ED4 @ =0x0000feff
	adds r1, r3, 0
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08017ED8 @ =gUnknown_81D8B32
	bl BattleScriptExecute
	ldr r0, _08017EDC @ =gUnknown_2023E82
	strb r4, [r0, 0x5]
	movs r0, 0xFD
	strb r0, [r5]
	movs r0, 0x2
	strb r0, [r5, 0x1]
	movs r0, 0x36
	strb r0, [r5, 0x2]
	mov r0, r8
	strb r0, [r5, 0x3]
	ldrb r0, [r5, 0x4]
	orrs r0, r6
	strb r0, [r5, 0x4]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08017E82:
	ldr r2, _08017EE0 @ =gBattleStruct
	ldr r1, [r2]
	adds r1, 0xDB
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r12, r2
	mov r1, r9
	cmp r1, 0
	beq _08017E98
	b _08018232
_08017E98:
	mov r1, r12
	ldr r0, [r1]
	adds r0, 0xDB
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _08017E20
_08017EA4:
	mov r2, r9
	cmp r2, 0
	beq _08017EAC
	b _08018232
_08017EAC:
	mov r3, r12
	ldr r0, [r3]
	ldrb r1, [r0, 0x3]
	adds r1, 0x1
	strb r1, [r0, 0x3]
	ldr r0, [r3]
	adds r0, 0xDB
	strb r2, [r0]
	b _0801822A
	.align 2, 0
_08017EC0: .4byte gActiveBattler
_08017EC4: .4byte sBattler_AI
_08017EC8: .4byte gBattleTextBuff1
_08017ECC: .4byte gSideTimers
_08017ED0: .4byte gSideAffecting
_08017ED4: .4byte 0x0000feff
_08017ED8: .4byte gUnknown_81D8B32
_08017EDC: .4byte gUnknown_2023E82
_08017EE0: .4byte gBattleStruct
_08017EE4:
	mov r1, r12
	ldr r0, [r1]
	adds r0, 0xDB
	ldrb r0, [r0]
	cmp r0, 0x1
	bhi _08017F60
	ldr r6, _08017F80 @ =gActiveBattler
	ldr r5, _08017F84 @ =sBattler_AI
_08017EF4:
	ldr r0, [r1]
	adds r0, 0xDB
	ldrb r4, [r0]
	ldr r2, _08017F88 @ =gSideTimers
	lsls r1, r4, 1
	adds r0, r1, r4
	lsls r0, 2
	adds r2, r0, r2
	ldrb r0, [r2, 0x7]
	strb r0, [r5]
	strb r0, [r6]
	ldr r0, _08017F8C @ =gSideAffecting
	adds r3, r1, r0
	ldrh r1, [r3]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08017F3E
	ldrb r0, [r2, 0x6]
	subs r0, 0x1
	strb r0, [r2, 0x6]
	lsls r0, 24
	cmp r0, 0
	bne _08017F3E
	ldrh r0, [r3]
	ldr r2, _08017F90 @ =0x0000ffdf
	adds r1, r2, 0
	ands r0, r1
	strh r0, [r3]
	ldr r0, _08017F94 @ =gUnknown_81D8B43
	bl BattleScriptExecute
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08017F3E:
	ldr r2, _08017F98 @ =gBattleStruct
	ldr r1, [r2]
	adds r1, 0xDB
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r12, r2
	mov r3, r9
	cmp r3, 0
	beq _08017F54
	b _08018232
_08017F54:
	mov r1, r12
	ldr r0, [r1]
	adds r0, 0xDB
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _08017EF4
_08017F60:
	mov r0, r9
	cmp r0, 0
	beq _08017F68
	b _08018232
_08017F68:
	mov r1, r12
	ldr r0, [r1]
	ldrb r1, [r0, 0x3]
	adds r1, 0x1
	strb r1, [r0, 0x3]
	mov r2, r12
	ldr r0, [r2]
	adds r0, 0xDB
	mov r3, r9
	strb r3, [r0]
	b _0801822A
	.align 2, 0
_08017F80: .4byte gActiveBattler
_08017F84: .4byte sBattler_AI
_08017F88: .4byte gSideTimers
_08017F8C: .4byte gSideAffecting
_08017F90: .4byte 0x0000ffdf
_08017F94: .4byte gUnknown_81D8B43
_08017F98: .4byte gBattleStruct
_08017F9C:
	mov r2, r12
	ldr r0, [r2]
	adds r0, 0xDB
	ldr r1, _08018030 @ =gBattlersCount
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bcs _0801801C
	ldr r4, _08018034 @ =gActiveBattler
	ldr r5, _08018038 @ =gUnknown_2023BDE
_08017FB0:
	ldr r0, [r2]
	adds r0, 0xDB
	ldrb r0, [r0]
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r0, _0801803C @ =gUnknown_2023F20
	adds r0, 0x20
	ldrb r2, [r4]
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _08017FF8
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _08017FF8
	ldr r1, _08018040 @ =gBattleMons
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08017FF8
	ldr r0, _08018044 @ =gBattlerTarget
	strb r2, [r0]
	ldr r0, _08018048 @ =gUnknown_81D8ED5
	bl BattleScriptExecute
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08017FF8:
	ldr r2, _0801804C @ =gBattleStruct
	ldr r1, [r2]
	adds r1, 0xDB
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r12, r2
	mov r3, r9
	cmp r3, 0
	beq _0801800E
	b _08018232
_0801800E:
	ldr r0, [r2]
	adds r0, 0xDB
	ldr r1, _08018030 @ =gBattlersCount
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08017FB0
_0801801C:
	mov r0, r9
	cmp r0, 0
	beq _08018024
	b _08018232
_08018024:
	mov r2, r12
	ldr r1, [r2]
	ldrb r0, [r1, 0x3]
	adds r0, 0x1
	strb r0, [r1, 0x3]
	b _0801822A
	.align 2, 0
_08018030: .4byte gBattlersCount
_08018034: .4byte gActiveBattler
_08018038: .4byte gUnknown_2023BDE
_0801803C: .4byte gUnknown_2023F20
_08018040: .4byte gBattleMons
_08018044: .4byte gBattlerTarget
_08018048: .4byte gUnknown_81D8ED5
_0801804C: .4byte gBattleStruct
_08018050:
	ldr r3, _08018088 @ =gBattleWeather
	ldrh r2, [r3]
	movs r0, 0x7
	ands r0, r2
	cmp r0, 0
	bne _0801805E
	b _080181FC
_0801805E:
	movs r0, 0x4
	ands r0, r2
	cmp r0, 0
	bne _080180AA
	ldr r1, _0801808C @ =gUnknown_2023F20
	adds r1, 0x28
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _0801809C
	ldr r0, _08018090 @ =0x0000fffe
	ands r0, r2
	ldr r1, _08018094 @ =0x0000fffd
	ands r0, r1
	strh r0, [r3]
	ldr r1, _08018098 @ =gUnknown_2023E82
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _080180C8
	.align 2, 0
_08018088: .4byte gBattleWeather
_0801808C: .4byte gUnknown_2023F20
_08018090: .4byte 0x0000fffe
_08018094: .4byte 0x0000fffd
_08018098: .4byte gUnknown_2023E82
_0801809C:
	movs r0, 0x2
	ands r0, r2
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _080180B6
	b _080180C4
_080180AA:
	movs r0, 0x2
	ands r0, r2
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _080180C4
_080180B6:
	ldr r1, _080180C0 @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _080180C8
	.align 2, 0
_080180C0: .4byte gUnknown_2023E82
_080180C4:
	ldr r0, _080180CC @ =gUnknown_2023E82
	strb r1, [r0, 0x5]
_080180C8:
	ldr r0, _080180D0 @ =gUnknown_81D8A64
	b _080181EE
	.align 2, 0
_080180CC: .4byte gUnknown_2023E82
_080180D0: .4byte gUnknown_81D8A64
_080180D4:
	ldr r3, _08018108 @ =gBattleWeather
	ldrh r2, [r3]
	movs r0, 0x18
	ands r0, r2
	cmp r0, 0
	bne _080180E2
	b _080181FC
_080180E2:
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	bne _0801811C
	ldr r1, _0801810C @ =gUnknown_2023F20
	adds r1, 0x28
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _0801811C
	ldr r0, _08018110 @ =0x0000fff7
	ands r0, r2
	strh r0, [r3]
	ldr r1, _08018114 @ =gUnknown_2023D74
	ldr r0, _08018118 @ =gUnknown_81D8B01
	b _08018120
	.align 2, 0
_08018108: .4byte gBattleWeather
_0801810C: .4byte gUnknown_2023F20
_08018110: .4byte 0x0000fff7
_08018114: .4byte gUnknown_2023D74
_08018118: .4byte gUnknown_81D8B01
_0801811C:
	ldr r1, _08018134 @ =gUnknown_2023D74
	ldr r0, _08018138 @ =gUnknown_81D8A7F
_08018120:
	str r0, [r1]
	adds r3, r1, 0
	ldr r1, _0801813C @ =gBattleScripting
	movs r2, 0
	movs r0, 0xC
	strb r0, [r1, 0x10]
	ldr r0, _08018140 @ =gUnknown_2023E82
	strb r2, [r0, 0x5]
	b _080181EC
	.align 2, 0
_08018134: .4byte gUnknown_2023D74
_08018138: .4byte gUnknown_81D8A7F
_0801813C: .4byte gBattleScripting
_08018140: .4byte gUnknown_2023E82
_08018144:
	ldr r3, _08018174 @ =gBattleWeather
	ldrh r2, [r3]
	movs r0, 0x60
	ands r0, r2
	cmp r0, 0
	beq _080181FC
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	bne _08018188
	ldr r1, _08018178 @ =gUnknown_2023F20
	adds r1, 0x28
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _08018188
	ldr r0, _0801817C @ =0x0000ffdf
	ands r0, r2
	strh r0, [r3]
	ldr r1, _08018180 @ =gUnknown_2023D74
	ldr r0, _08018184 @ =gUnknown_81D8B18
	b _0801818C
	.align 2, 0
_08018174: .4byte gBattleWeather
_08018178: .4byte gUnknown_2023F20
_0801817C: .4byte 0x0000ffdf
_08018180: .4byte gUnknown_2023D74
_08018184: .4byte gUnknown_81D8B18
_08018188:
	ldr r1, _08018194 @ =gUnknown_2023D74
	ldr r0, _08018198 @ =gUnknown_81D8B0A
_0801818C:
	str r0, [r1]
	adds r3, r1, 0
	b _080181EC
	.align 2, 0
_08018194: .4byte gUnknown_2023D74
_08018198: .4byte gUnknown_81D8B0A
_0801819C:
	ldr r3, _080181C4 @ =gBattleWeather
	ldrh r2, [r3]
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _080181FC
	ldr r1, _080181C8 @ =gUnknown_2023F20
	adds r1, 0x28
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _080181D8
	ldr r0, _080181CC @ =0x0000ff7f
	ands r0, r2
	strh r0, [r3]
	ldr r1, _080181D0 @ =gUnknown_2023D74
	ldr r0, _080181D4 @ =gUnknown_81D8B01
	b _080181DC
	.align 2, 0
_080181C4: .4byte gBattleWeather
_080181C8: .4byte gUnknown_2023F20
_080181CC: .4byte 0x0000ff7f
_080181D0: .4byte gUnknown_2023D74
_080181D4: .4byte gUnknown_81D8B01
_080181D8:
	ldr r1, _0801820C @ =gUnknown_2023D74
	ldr r0, _08018210 @ =gUnknown_81D8A7F
_080181DC:
	str r0, [r1]
	adds r3, r1, 0
	ldr r1, _08018214 @ =gBattleScripting
	movs r0, 0xD
	strb r0, [r1, 0x10]
	ldr r1, _08018218 @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x5]
_080181EC:
	ldr r0, [r3]
_080181EE:
	bl BattleScriptExecute
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080181FC:
	ldr r2, _0801821C @ =gBattleStruct
	ldr r1, [r2]
	ldrb r0, [r1, 0x3]
	adds r0, 0x1
	strb r0, [r1, 0x3]
	mov r12, r2
	b _0801822A
	.align 2, 0
_0801820C: .4byte gUnknown_2023D74
_08018210: .4byte gUnknown_81D8A7F
_08018214: .4byte gBattleScripting
_08018218: .4byte gUnknown_2023E82
_0801821C: .4byte gBattleStruct
_08018220:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0801822A:
	mov r3, r9
	cmp r3, 0
	bne _08018232
	b _08017B92
_08018232:
	ldr r0, _08018250 @ =gUnknown_3004F84
	ldr r1, [r0]
	ldr r0, _08018254 @ =sub_8013BD4
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08018250: .4byte gUnknown_3004F84
_08018254: .4byte sub_8013BD4
	thumb_func_end UpdateTurnCounters

	thumb_func_start TurnBasedEffects
TurnBasedEffects: @ 8018258
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	mov r9, r0
	ldr r2, _0801828C @ =gUnknown_2023DD0
	ldr r0, [r2]
	ldr r1, _08018290 @ =0x01000020
	orrs r0, r1
	str r0, [r2]
	ldr r5, _08018294 @ =gBattleStruct
	ldr r2, [r5]
	ldr r0, _08018298 @ =gBattlersCount
	ldrb r1, [r2, 0x1]
	adds r7, r5, 0
	mov r8, r0
	ldrb r3, [r0]
	cmp r1, r3
	bcc _08018288
	bl _08018C6C
_08018288:
	bl _08018C62
	.align 2, 0
_0801828C: .4byte gUnknown_2023DD0
_08018290: .4byte 0x01000020
_08018294: .4byte gBattleStruct
_08018298: .4byte gBattlersCount
_0801829C:
	ldr r3, _080182D0 @ =gActiveBattler
	ldr r4, _080182D4 @ =sBattler_AI
	ldr r1, _080182D8 @ =gUnknown_2023BDE
	ldr r5, [r5]
	ldrb r0, [r5, 0x1]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r4]
	strb r0, [r3]
	ldr r0, _080182DC @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldr r2, _080182E0 @ =gBitTable
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	adds r6, r3, 0
	cmp r1, 0
	beq _080182E4
	ldrb r0, [r5, 0x1]
	adds r0, 0x1
	strb r0, [r5, 0x1]
	bl _08018C50
	.align 2, 0
_080182D0: .4byte gActiveBattler
_080182D4: .4byte sBattler_AI
_080182D8: .4byte gUnknown_2023BDE
_080182DC: .4byte gAbsentBattlerFlags
_080182E0: .4byte gBitTable
_080182E4:
	ldrb r0, [r5]
	cmp r0, 0x13
	bls _080182EE
	bl _08018C46
_080182EE:
	lsls r0, 2
	ldr r1, _080182F8 @ =_080182FC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080182F8: .4byte _080182FC
	.align 2, 0
_080182FC:
	.4byte _0801834C
	.4byte _080183AC
	.4byte _080183CA
	.4byte _080183FA
	.4byte _08018478
	.4byte _080184C0
	.4byte _08018540
	.4byte _08018588
	.4byte _080185EC
	.4byte _08018634
	.4byte _08018794
	.4byte _080188B0
	.4byte _08018958
	.4byte _08018A1C
	.4byte _08018AD0
	.4byte _08018AF0
	.4byte _08018B3C
	.4byte _08018B6C
	.4byte _080183E2
	.4byte _08018C38
_0801834C:
	ldr r1, _0801839C @ =gStatuses3
	ldrb r3, [r6]
	lsls r0, r3, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 3
	ands r0, r1
	cmp r0, 0
	bne _08018364
	bl _08018C12
_08018364:
	ldr r0, _080183A0 @ =gBattleMons
	movs r1, 0x58
	muls r1, r3
	adds r0, r1, r0
	ldrh r2, [r0, 0x28]
	ldrh r5, [r0, 0x2C]
	cmp r2, r5
	bne _08018378
	bl _08018C12
_08018378:
	cmp r2, 0
	bne _08018380
	bl _08018C12
_08018380:
	ldr r1, _080183A4 @ =gBattleMoveDamage
	ldrh r0, [r0, 0x2C]
	lsrs r0, 4
	str r0, [r1]
	cmp r0, 0
	bne _08018390
	movs r0, 0x1
	str r0, [r1]
_08018390:
	ldr r0, [r1]
	negs r0, r0
	str r0, [r1]
	ldr r0, _080183A8 @ =gUnknown_81D8F0C
	bl _08018C04
	.align 2, 0
_0801839C: .4byte gStatuses3
_080183A0: .4byte gBattleMons
_080183A4: .4byte gBattleMoveDamage
_080183A8: .4byte gUnknown_81D8F0C
_080183AC:
	ldrb r1, [r6]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	bne _080183C6
	bl _08018C12
_080183C6:
	bl _08018C08
_080183CA:
	ldrb r1, [r6]
	movs r0, 0x1
	movs r2, 0
	bl sub_801BC68
	lsls r0, 24
	cmp r0, 0
	bne _080183DE
	bl _08018C12
_080183DE:
	bl _08018C08
_080183E2:
	ldrb r1, [r6]
	movs r0, 0x1
	movs r2, 0x1
	bl sub_801BC68
	lsls r0, 24
	cmp r0, 0
	bne _080183F6
	bl _08018C12
_080183F6:
	bl _08018C08
_080183FA:
	ldr r0, _08018460 @ =gStatuses3
	ldrb r2, [r6]
	lsls r1, r2, 2
	adds r1, r0
	ldr r1, [r1]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _08018410
	bl _08018C12
_08018410:
	ldr r3, _08018464 @ =gBattleMons
	movs r5, 0x3
	ands r5, r1
	movs r1, 0x58
	adds r0, r5, 0
	muls r0, r1
	adds r0, r3
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _08018428
	bl _08018C12
_08018428:
	adds r0, r2, 0
	muls r0, r1
	adds r0, r3
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _08018438
	bl _08018C12
_08018438:
	ldr r0, _08018468 @ =gBattlerTarget
	strb r5, [r0]
	ldr r2, _0801846C @ =gBattleMoveDamage
	ldrb r0, [r6]
	muls r0, r1
	adds r0, r3
	ldrh r0, [r0, 0x2C]
	lsrs r0, 3
	str r0, [r2]
	cmp r0, 0
	bne _08018452
	movs r0, 0x1
	str r0, [r2]
_08018452:
	ldr r1, _08018470 @ =gBattleScripting
	strb r5, [r1, 0x10]
	ldrb r0, [r4]
	strb r0, [r1, 0x11]
	ldr r0, _08018474 @ =gUnknown_81D8B4D
	b _08018C04
	.align 2, 0
_08018460: .4byte gStatuses3
_08018464: .4byte gBattleMons
_08018468: .4byte gBattlerTarget
_0801846C: .4byte gBattleMoveDamage
_08018470: .4byte gBattleScripting
_08018474: .4byte gUnknown_81D8B4D
_08018478:
	ldr r2, _080184B4 @ =gBattleMons
	ldrb r1, [r6]
	movs r0, 0x58
	adds r3, r1, 0
	muls r3, r0
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x8
	ands r0, r1
	cmp r0, 0
	bne _08018494
	b _08018C12
_08018494:
	adds r1, r3, r2
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	bne _0801849E
	b _08018C12
_0801849E:
	ldr r2, _080184B8 @ =gBattleMoveDamage
	ldrh r0, [r1, 0x2C]
	lsrs r0, 3
	str r0, [r2]
	cmp r0, 0
	bne _080184AE
	movs r0, 0x1
	str r0, [r2]
_080184AE:
	ldr r0, _080184BC @ =gUnknown_81D9053
	b _08018C04
	.align 2, 0
_080184B4: .4byte gBattleMons
_080184B8: .4byte gBattleMoveDamage
_080184BC: .4byte gUnknown_81D9053
_080184C0:
	ldr r4, _08018534 @ =gBattleMons
	ldrb r0, [r6]
	movs r7, 0x58
	mov r8, r7
	mov r2, r8
	muls r2, r0
	adds r3, r4, 0
	adds r3, 0x4C
	adds r0, r2, r3
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080184DE
	b _08018C12
_080184DE:
	adds r1, r2, r4
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	bne _080184E8
	b _08018C12
_080184E8:
	ldr r5, _08018538 @ =gBattleMoveDamage
	ldrh r0, [r1, 0x2C]
	lsrs r0, 4
	str r0, [r5]
	cmp r0, 0
	bne _080184F8
	movs r0, 0x1
	str r0, [r5]
_080184F8:
	ldrb r0, [r6]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r2, r0, r3
	ldr r1, [r2]
	movs r4, 0xF0
	lsls r4, 4
	adds r0, r1, 0
	ands r0, r4
	cmp r0, r4
	beq _08018518
	movs r7, 0x80
	lsls r7, 1
	adds r0, r1, r7
	str r0, [r2]
_08018518:
	ldrb r0, [r6]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r3
	ldr r0, [r0]
	ands r0, r4
	lsrs r0, 8
	ldr r1, [r5]
	muls r0, r1
	str r0, [r5]
	ldr r0, _0801853C @ =gUnknown_81D9053
	b _08018C04
	.align 2, 0
_08018534: .4byte gBattleMons
_08018538: .4byte gBattleMoveDamage
_0801853C: .4byte gUnknown_81D9053
_08018540:
	ldr r2, _0801857C @ =gBattleMons
	ldrb r1, [r6]
	movs r0, 0x58
	adds r3, r1, 0
	muls r3, r0
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0801855C
	b _08018C12
_0801855C:
	adds r1, r3, r2
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	bne _08018566
	b _08018C12
_08018566:
	ldr r2, _08018580 @ =gBattleMoveDamage
	ldrh r0, [r1, 0x2C]
	lsrs r0, 3
	str r0, [r2]
	cmp r0, 0
	bne _08018576
	movs r0, 0x1
	str r0, [r2]
_08018576:
	ldr r0, _08018584 @ =gUnknown_81D9075
	b _08018C04
	.align 2, 0
_0801857C: .4byte gBattleMons
_08018580: .4byte gBattleMoveDamage
_08018584: .4byte gUnknown_81D9075
_08018588:
	ldr r4, _080185D4 @ =gBattleMons
	ldrb r1, [r6]
	movs r0, 0x58
	muls r1, r0
	adds r0, r4, 0
	adds r0, 0x50
	adds r5, r1, r0
	ldr r2, [r5]
	movs r0, 0x80
	lsls r0, 20
	ands r0, r2
	cmp r0, 0
	bne _080185A4
	b _08018C12
_080185A4:
	adds r3, r1, r4
	ldrh r0, [r3, 0x28]
	cmp r0, 0
	bne _080185AE
	b _08018C12
_080185AE:
	adds r0, r4, 0
	adds r0, 0x4C
	adds r0, r1, r0
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _080185E0
	ldr r1, _080185D8 @ =gBattleMoveDamage
	ldrh r0, [r3, 0x2C]
	lsrs r0, 2
	str r0, [r1]
	cmp r0, 0
	bne _080185CE
	movs r0, 0x1
	str r0, [r1]
_080185CE:
	ldr r0, _080185DC @ =gUnknown_81D9155
	b _08018C04
	.align 2, 0
_080185D4: .4byte gBattleMons
_080185D8: .4byte gBattleMoveDamage
_080185DC: .4byte gUnknown_81D9155
_080185E0:
	ldr r0, _080185E8 @ =0xf7ffffff
	ands r2, r0
	str r2, [r5]
	b _08018C12
	.align 2, 0
_080185E8: .4byte 0xf7ffffff
_080185EC:
	ldr r2, _08018628 @ =gBattleMons
	ldrb r1, [r6]
	movs r0, 0x58
	adds r3, r1, 0
	muls r3, r0
	adds r0, r2, 0
	adds r0, 0x50
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 21
	ands r0, r1
	cmp r0, 0
	bne _0801860A
	b _08018C12
_0801860A:
	adds r1, r3, r2
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	bne _08018614
	b _08018C12
_08018614:
	ldr r2, _0801862C @ =gBattleMoveDamage
	ldrh r0, [r1, 0x2C]
	lsrs r0, 2
	str r0, [r2]
	cmp r0, 0
	bne _08018624
	movs r0, 0x1
	str r0, [r2]
_08018624:
	ldr r0, _08018630 @ =gUnknown_81D9166
	b _08018C04
	.align 2, 0
_08018628: .4byte gBattleMons
_0801862C: .4byte gBattleMoveDamage
_08018630: .4byte gUnknown_81D9166
_08018634:
	ldr r3, _080186D4 @ =gBattleMons
	mov r8, r3
	ldrb r0, [r6]
	movs r3, 0x58
	adds r1, r0, 0
	muls r1, r3
	movs r5, 0x50
	add r5, r8
	mov r10, r5
	adds r4, r1, r5
	ldr r2, [r4]
	movs r5, 0xE0
	lsls r5, 8
	adds r0, r2, 0
	ands r0, r5
	cmp r0, 0
	bne _08018658
	b _08018C12
_08018658:
	mov r7, r8
	adds r0, r1, r7
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _08018664
	b _08018C12
_08018664:
	ldr r1, _080186D8 @ =0xffffe000
	adds r0, r2, r1
	str r0, [r4]
	ldrb r4, [r6]
	adds r0, r4, 0
	muls r0, r3
	add r0, r10
	ldr r0, [r0]
	ands r0, r5
	cmp r0, 0
	beq _080186F4
	ldr r1, _080186DC @ =gBattleScripting
	ldr r0, _080186E0 @ =gBattleStruct
	ldr r2, [r0]
	lsls r0, r4, 1
	adds r0, r2
	ldrb r0, [r0, 0x4]
	strb r0, [r1, 0x10]
	ldrb r0, [r6]
	lsls r0, 1
	adds r0, r2
	ldrb r0, [r0, 0x5]
	strb r0, [r1, 0x11]
	ldr r1, _080186E4 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	ldrb r0, [r6]
	lsls r0, 1
	adds r0, r2
	ldrb r0, [r0, 0x4]
	strb r0, [r1, 0x2]
	ldrb r0, [r6]
	lsls r0, 1
	adds r0, r2
	ldrb r0, [r0, 0x5]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _080186E8 @ =gUnknown_2023D74
	ldr r0, _080186EC @ =gUnknown_81D9124
	str r0, [r1]
	ldr r2, _080186F0 @ =gBattleMoveDamage
	ldrb r0, [r6]
	muls r0, r3
	add r0, r8
	ldrh r0, [r0, 0x2C]
	lsrs r0, 4
	str r0, [r2]
	cmp r0, 0
	bne _08018720
	movs r0, 0x1
	str r0, [r2]
	b _08018720
	.align 2, 0
_080186D4: .4byte gBattleMons
_080186D8: .4byte 0xffffe000
_080186DC: .4byte gBattleScripting
_080186E0: .4byte gBattleStruct
_080186E4: .4byte gBattleTextBuff1
_080186E8: .4byte gUnknown_2023D74
_080186EC: .4byte gUnknown_81D9124
_080186F0: .4byte gBattleMoveDamage
_080186F4:
	ldr r2, _08018724 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r2]
	movs r0, 0x2
	strb r0, [r2, 0x1]
	ldrb r1, [r6]
	ldr r0, _08018728 @ =gBattleStruct
	ldr r3, [r0]
	lsls r1, 1
	adds r1, r3
	ldrb r0, [r1, 0x4]
	strb r0, [r2, 0x2]
	ldrb r0, [r6]
	lsls r0, 1
	adds r0, r3
	ldrb r0, [r0, 0x5]
	strb r0, [r2, 0x3]
	movs r0, 0xFF
	strb r0, [r2, 0x4]
	ldr r1, _0801872C @ =gUnknown_2023D74
	ldr r0, _08018730 @ =gUnknown_81D9136
	str r0, [r1]
_08018720:
	ldr r0, [r1]
	b _08018C04
	.align 2, 0
_08018724: .4byte gBattleTextBuff1
_08018728: .4byte gBattleStruct
_0801872C: .4byte gUnknown_2023D74
_08018730: .4byte gUnknown_81D9136
_08018734:
	movs r0, 0x8
	negs r0, r0
	ands r3, r0
	str r3, [r2]
	ldrb r0, [r6]
	mov r2, r8
	muls r2, r0
	mov r0, r10
	adds r0, 0x50
	adds r2, r0
	ldr r0, [r2]
	ldr r1, _08018784 @ =0xf7ffffff
	ands r0, r1
	str r0, [r2]
	ldr r1, _08018788 @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x5]
	ldr r0, _0801878C @ =gUnknown_81D904A
	bl BattleScriptExecute
	ldr r4, _08018790 @ =gActiveBattler
	ldrb r0, [r6]
	strb r0, [r4]
	ldrb r0, [r4]
	mov r3, r8
	muls r3, r0
	adds r0, r3, 0
	add r0, r9
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl EmitSetMonData
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	b _080187FC
	.align 2, 0
_08018784: .4byte 0xf7ffffff
_08018788: .4byte gUnknown_2023E82
_0801878C: .4byte gUnknown_81D904A
_08018790: .4byte gActiveBattler
_08018794:
	ldr r2, _08018810 @ =gBattleMons
	ldrb r1, [r6]
	movs r0, 0x58
	muls r0, r1
	adds r1, r2, 0
	adds r1, 0x50
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x70
	ands r1, r0
	adds r7, r2, 0
	cmp r1, 0
	beq _0801889E
	movs r0, 0
	strb r0, [r4]
	mov r5, r8
	ldrb r0, [r5]
	cmp r0, 0
	beq _080187FC
	mov r10, r7
	adds r6, r4, 0
	movs r1, 0x58
	mov r8, r1
	movs r3, 0x4C
	adds r3, r7
	mov r9, r3
	str r0, [sp, 0x4]
	movs r5, 0x7
	mov r12, r5
_080187CE:
	ldrb r4, [r6]
	mov r1, r8
	muls r1, r4
	mov r0, r9
	adds r2, r1, r0
	ldr r3, [r2]
	adds r0, r3, 0
	mov r5, r12
	ands r0, r5
	cmp r0, 0
	beq _080187EE
	adds r0, r1, r7
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x2B
	bne _08018734
_080187EE:
	adds r0, r4, 0x1
	strb r0, [r6]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp, 0x4]
	cmp r0, r1
	bcc _080187CE
_080187FC:
	ldr r2, _08018814 @ =sBattler_AI
	ldr r1, _08018818 @ =gBattlersCount
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0801881C
	movs r3, 0x2
	mov r9, r3
	b _08018C4C
	.align 2, 0
_08018810: .4byte gBattleMons
_08018814: .4byte sBattler_AI
_08018818: .4byte gBattlersCount
_0801881C:
	ldr r5, _08018854 @ =gActiveBattler
	ldrb r0, [r5]
	strb r0, [r2]
	ldr r2, _08018858 @ =gBattleMons
	ldrb r0, [r5]
	movs r7, 0x58
	adds r1, r0, 0
	muls r1, r7
	adds r6, r2, 0
	adds r6, 0x50
	adds r1, r6
	ldr r0, [r1]
	subs r0, 0x10
	str r0, [r1]
	ldrb r0, [r5]
	bl WasUnableToUseMove
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _08018860
	ldrb r0, [r5]
	bl CancelMultiTurnMoves
	ldr r1, _0801885C @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08018894
	.align 2, 0
_08018854: .4byte gActiveBattler
_08018858: .4byte gBattleMons
_0801885C: .4byte gUnknown_2023E82
_08018860:
	ldrb r3, [r5]
	adds r0, r3, 0
	muls r0, r7
	adds r2, r0, r6
	ldr r0, [r2]
	movs r1, 0x70
	ands r0, r1
	cmp r0, 0
	beq _08018888
	ldr r0, _08018884 @ =gUnknown_2023E82
	strb r4, [r0, 0x5]
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 5
	orrs r0, r1
	str r0, [r2]
	b _08018894
	.align 2, 0
_08018884: .4byte gUnknown_2023E82
_08018888:
	ldr r1, _080188A8 @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x5]
	adds r0, r3, 0
	bl CancelMultiTurnMoves
_08018894:
	ldr r0, _080188AC @ =gUnknown_81D90BC
	bl BattleScriptExecute
	movs r5, 0x1
	mov r9, r5
_0801889E:
	mov r7, r9
	cmp r7, 0x2
	bne _080188A6
	b _08018C46
_080188A6:
	b _08018C12
	.align 2, 0
_080188A8: .4byte gUnknown_2023E82
_080188AC: .4byte gUnknown_81D90BC
_080188B0:
	ldr r1, _080188E8 @ =gBattleMons
	ldrb r0, [r6]
	movs r7, 0x58
	muls r0, r7
	adds r5, r1, 0
	adds r5, 0x50
	adds r2, r0, r5
	ldr r1, [r2]
	movs r4, 0xC0
	lsls r4, 4
	adds r0, r1, 0
	ands r0, r4
	cmp r0, 0
	bne _080188CE
	b _08018C12
_080188CE:
	ldr r3, _080188EC @ =0xfffffc00
	adds r0, r1, r3
	str r0, [r2]
	ldrb r0, [r6]
	bl WasUnableToUseMove
	lsls r0, 24
	cmp r0, 0
	beq _080188F0
	ldrb r0, [r6]
	bl CancelMultiTurnMoves
	b _08018C12
	.align 2, 0
_080188E8: .4byte gBattleMons
_080188EC: .4byte 0xfffffc00
_080188F0:
	ldrb r0, [r6]
	muls r0, r7
	adds r2, r0, r5
	ldr r1, [r2]
	adds r0, r1, 0
	ands r0, r4
	cmp r0, 0
	beq _08018902
	b _08018C12
_08018902:
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	bne _0801890E
	b _08018C12
_0801890E:
	ldr r0, _0801894C @ =0xffffefff
	ands r1, r0
	str r1, [r2]
	ldrb r0, [r6]
	muls r0, r7
	adds r0, r5
	ldr r0, [r0]
	movs r4, 0x7
	ands r0, r4
	cmp r0, 0
	beq _08018926
	b _08018C12
_08018926:
	ldr r1, _08018950 @ =gUnknown_2023E82
	movs r0, 0x47
	strb r0, [r1, 0x3]
	movs r0, 0x1
	movs r1, 0
	bl sub_801FF20
	ldrb r0, [r6]
	muls r0, r7
	adds r0, r5
	ldr r0, [r0]
	ands r0, r4
	cmp r0, 0
	bne _08018944
	b _08018C08
_08018944:
	ldr r0, _08018954 @ =gUnknown_81D90C5
	bl BattleScriptExecute
	b _08018C08
	.align 2, 0
_0801894C: .4byte 0xffffefff
_08018950: .4byte gUnknown_2023E82
_08018954: .4byte gUnknown_81D90C5
_08018958:
	ldr r0, _080189D8 @ =gDisableStructs
	ldrb r3, [r6]
	lsls r1, r3, 3
	subs r1, r3
	lsls r1, 2
	adds r5, r1, r0
	ldrb r1, [r5, 0xB]
	lsls r1, 28
	adds r7, r0, 0
	cmp r1, 0
	bne _08018970
	b _08018C12
_08018970:
	movs r4, 0
	ldr r2, _080189DC @ =gBattleMons
	movs r0, 0x58
	adds r1, r3, 0
	muls r1, r0
	adds r2, 0xC
	adds r1, r2
	ldrh r0, [r5, 0x4]
	ldrh r1, [r1]
	cmp r0, r1
	beq _080189AE
	mov r12, r7
	mov r8, r2
	adds r5, r6, 0
	movs r3, 0x58
_0801898E:
	adds r4, 0x1
	cmp r4, 0x3
	bgt _080189AE
	ldrb r2, [r5]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	add r1, r12
	lsls r0, r4, 1
	muls r2, r3
	adds r0, r2
	add r0, r8
	ldrh r1, [r1, 0x4]
	ldrh r0, [r0]
	cmp r1, r0
	bne _0801898E
_080189AE:
	cmp r4, 0x4
	bne _080189E0
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r7
	movs r1, 0
	strh r1, [r0, 0x4]
	ldrb r0, [r6]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r7
	ldrb r2, [r1, 0xB]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0xB]
	b _08018C12
	.align 2, 0
_080189D8: .4byte gDisableStructs
_080189DC: .4byte gBattleMons
_080189E0:
	ldrb r0, [r6]
	lsls r2, r0, 3
	subs r2, r0
	lsls r2, 2
	adds r2, r7
	ldrb r3, [r2, 0xB]
	lsls r1, r3, 28
	lsrs r1, 28
	subs r1, 0x1
	movs r0, 0xF
	ands r1, r0
	movs r0, 0x10
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0xB]
	adds r2, r1, 0
	cmp r2, 0
	beq _08018A08
	b _08018C12
_08018A08:
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r7
	strh r2, [r0, 0x4]
	ldr r0, _08018A18 @ =gUnknown_81D8C5E
	b _08018C04
	.align 2, 0
_08018A18: .4byte gUnknown_81D8C5E
_08018A1C:
	ldr r3, _08018A68 @ =gDisableStructs
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r2, r0, r3
	ldrb r5, [r2, 0xE]
	lsls r4, r5, 28
	cmp r4, 0
	bne _08018A32
	b _08018C12
_08018A32:
	ldr r7, _08018A6C @ =gBattleMons
	mov r8, r7
	ldrb r0, [r2, 0xC]
	lsls r0, 1
	movs r7, 0x58
	muls r1, r7
	adds r0, r1
	mov r1, r8
	adds r1, 0xC
	adds r0, r1
	ldrh r0, [r0]
	ldrh r1, [r2, 0x6]
	cmp r0, r1
	beq _08018A70
	movs r0, 0
	strh r0, [r2, 0x6]
	ldrb r0, [r6]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r1, 0xE]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0xE]
	b _08018C12
	.align 2, 0
_08018A68: .4byte gDisableStructs
_08018A6C: .4byte gBattleMons
_08018A70:
	lsrs r1, r4, 28
	subs r1, 0x1
	movs r0, 0xF
	ands r1, r0
	movs r4, 0x10
	negs r4, r4
	adds r0, r4, 0
	ands r0, r5
	orrs r0, r1
	strb r0, [r2, 0xE]
	cmp r1, 0
	beq _08018AA6
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	muls r1, r7
	ldrb r0, [r0, 0xC]
	adds r1, r0
	mov r0, r8
	adds r0, 0x24
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _08018AA6
	b _08018C12
_08018AA6:
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x6]
	ldrb r0, [r6]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r1, 0xE]
	adds r0, r4, 0
	ands r0, r2
	strb r0, [r1, 0xE]
	ldr r0, _08018ACC @ =gUnknown_81D8C65
	b _08018C04
	.align 2, 0
_08018ACC: .4byte gUnknown_81D8C65
_08018AD0:
	ldr r0, _08018AEC @ =gStatuses3
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x18
	ands r0, r2
	cmp r0, 0
	beq _08018AE8
	adds r0, r2, 0
	subs r0, 0x8
	str r0, [r1]
_08018AE8:
	ldr r1, [r7]
	b _08018C16
	.align 2, 0
_08018AEC: .4byte gStatuses3
_08018AF0:
	ldr r2, _08018B30 @ =gDisableStructs
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r3, r0, r2
	ldrb r2, [r3, 0x12]
	lsls r1, r2, 28
	cmp r1, 0
	beq _08018B2A
	lsrs r1, 28
	subs r1, 0x1
	movs r0, 0xF
	ands r1, r0
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x12]
	cmp r1, 0
	bne _08018B2A
	ldr r0, _08018B34 @ =gStatuses3
	ldrb r2, [r6]
	lsls r2, 2
	adds r2, r0
	ldr r0, [r2]
	ldr r1, _08018B38 @ =0xfffffdff
	ands r0, r1
	str r0, [r2]
_08018B2A:
	ldr r1, [r7]
	b _08018C16
	.align 2, 0
_08018B30: .4byte gDisableStructs
_08018B34: .4byte gStatuses3
_08018B38: .4byte 0xfffffdff
_08018B3C:
	ldr r2, _08018B68 @ =gDisableStructs
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r3, r0, r2
	ldrb r2, [r3, 0x13]
	lsls r1, r2, 28
	cmp r1, 0
	beq _08018B62
	lsrs r1, 28
	subs r1, 0x1
	movs r0, 0xF
	ands r1, r0
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x13]
_08018B62:
	ldr r1, [r7]
	b _08018C16
	.align 2, 0
_08018B68: .4byte gDisableStructs
_08018B6C:
	ldr r4, _08018C20 @ =gStatuses3
	ldrb r0, [r6]
	lsls r0, 2
	adds r2, r0, r4
	ldr r1, [r2]
	movs r3, 0xC0
	lsls r3, 5
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	beq _08018C12
	ldr r5, _08018C24 @ =0xfffff800
	adds r0, r1, r5
	str r0, [r2]
	ldrb r2, [r6]
	lsls r0, r2, 2
	adds r0, r4
	ldr r0, [r0]
	ands r0, r3
	cmp r0, 0
	bne _08018C12
	ldr r3, _08018C28 @ =gBattleMons
	movs r5, 0x58
	adds r1, r2, 0
	muls r1, r5
	adds r4, r3, 0
	adds r4, 0x4C
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _08018C12
	adds r0, r1, r3
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x48
	beq _08018C12
	cmp r0, 0xF
	beq _08018C12
	adds r0, r2, 0
	bl UproarWakeUpCheck
	lsls r0, 24
	cmp r0, 0
	bne _08018C12
	ldrb r0, [r6]
	bl CancelMultiTurnMoves
	bl Random
	ldrb r1, [r6]
	adds r2, r1, 0
	muls r2, r5
	adds r2, r4
	movs r1, 0x3
	ands r1, r0
	adds r1, 0x2
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl EmitSetMonData
	ldrb r0, [r6]
	bl MarkBufferBankForExecution
	ldr r1, _08018C2C @ =gUnknown_2023D6E
	ldrb r0, [r6]
	strb r0, [r1]
	ldr r0, _08018C30 @ =gUnknown_81D91C7
_08018C04:
	bl BattleScriptExecute
_08018C08:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08018C12:
	ldr r0, _08018C34 @ =gBattleStruct
	ldr r1, [r0]
_08018C16:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08018C46
	.align 2, 0
_08018C20: .4byte gStatuses3
_08018C24: .4byte 0xfffff800
_08018C28: .4byte gBattleMons
_08018C2C: .4byte gUnknown_2023D6E
_08018C30: .4byte gUnknown_81D91C7
_08018C34: .4byte gBattleStruct
_08018C38:
	ldr r1, [r7]
	movs r0, 0
	strb r0, [r1]
	ldr r1, [r7]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
_08018C46:
	mov r7, r9
	cmp r7, 0
	beq _08018C50
_08018C4C:
	mov r0, r9
	b _08018C78
_08018C50:
	ldr r5, _08018C88 @ =gBattleStruct
	ldr r2, [r5]
	ldr r0, _08018C8C @ =gBattlersCount
	ldrb r1, [r2, 0x1]
	adds r7, r5, 0
	mov r8, r0
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08018C6C
_08018C62:
	ldrb r0, [r2]
	cmp r0, 0x13
	bhi _08018C6C
	bl _0801829C
_08018C6C:
	ldr r0, _08018C90 @ =gUnknown_2023DD0
	ldr r1, [r0]
	ldr r2, _08018C94 @ =0xfeffffdf
	ands r1, r2
	str r1, [r0]
	movs r0, 0
_08018C78:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08018C88: .4byte gBattleStruct
_08018C8C: .4byte gBattlersCount
_08018C90: .4byte gUnknown_2023DD0
_08018C94: .4byte 0xfeffffdf
	thumb_func_end TurnBasedEffects

	thumb_func_start sub_8018C98
sub_8018C98: @ 8018C98
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r2, _08018CC8 @ =gUnknown_2023DD0
	ldr r0, [r2]
	ldr r1, _08018CCC @ =0x01000020
	orrs r0, r1
	str r0, [r2]
	ldr r1, _08018CD0 @ =gBattleStruct
	ldr r3, [r1]
	movs r4, 0xC0
	lsls r4, 1
	adds r0, r3, r4
	ldrb r0, [r0]
	adds r7, r1, 0
	cmp r0, 0
	beq _08018CD4
	cmp r0, 0x1
	bne _08018CC4
	b _08018E2C
_08018CC4:
	b _08018F68
	.align 2, 0
_08018CC8: .4byte gUnknown_2023DD0
_08018CCC: .4byte 0x01000020
_08018CD0: .4byte gBattleStruct
_08018CD4:
	ldr r2, _08018D20 @ =0x00000181
	adds r0, r3, r2
	ldr r1, _08018D24 @ =gBattlersCount
	ldrb r0, [r0]
	mov r8, r1
	ldrb r6, [r1]
	cmp r0, r6
	bcc _08018CE6
	b _08018E16
_08018CE6:
	ldr r4, _08018D28 @ =gActiveBattler
	ldr r5, _08018D2C @ =gBattleTextBuff1
	ldr r6, _08018D30 @ =gUnknown_2023F20
	movs r0, 0x8
	adds r0, r6
	mov r10, r0
	movs r1, 0x18
	adds r1, r6
	mov r12, r1
	ldr r3, _08018D34 @ =gBattlerTarget
	mov r9, r3
_08018CFC:
	ldr r0, [r7]
	adds r3, r0, r2
	ldrb r0, [r3]
	strb r0, [r4]
	ldr r0, _08018D38 @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldr r2, _08018D3C @ =gBitTable
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08018D40
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	b _08018E04
	.align 2, 0
_08018D20: .4byte 0x00000181
_08018D24: .4byte gBattlersCount
_08018D28: .4byte gActiveBattler
_08018D2C: .4byte gBattleTextBuff1
_08018D30: .4byte gUnknown_2023F20
_08018D34: .4byte gBattlerTarget
_08018D38: .4byte gAbsentBattlerFlags
_08018D3C: .4byte gBitTable
_08018D40:
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	ldr r1, _08018D80 @ =gUnknown_2023F20
	ldrb r0, [r4]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	beq _08018E04
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	bne _08018E04
	ldr r1, _08018D84 @ =gBattleMons
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08018E04
	lsls r0, r2, 1
	add r0, r12
	ldrh r0, [r0]
	cmp r0, 0xF8
	bne _08018D8C
	ldr r0, _08018D88 @ =gUnknown_2023E82
	strb r3, [r0, 0x5]
	b _08018D92
	.align 2, 0
_08018D80: .4byte gUnknown_2023F20
_08018D84: .4byte gBattleMons
_08018D88: .4byte gUnknown_2023E82
_08018D8C:
	ldr r1, _08018DEC @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x5]
_08018D92:
	movs r0, 0xFD
	strb r0, [r5]
	movs r0, 0x2
	strb r0, [r5, 0x1]
	ldrb r0, [r4]
	lsls r0, 1
	add r0, r12
	ldrh r0, [r0]
	strb r0, [r5, 0x2]
	ldrb r0, [r4]
	lsls r0, 1
	add r0, r12
	ldrh r0, [r0]
	lsrs r0, 8
	strb r0, [r5, 0x3]
	movs r0, 0xFF
	strb r0, [r5, 0x4]
	ldrb r0, [r4]
	mov r1, r9
	strb r0, [r1]
	ldr r1, _08018DF0 @ =sBattler_AI
	adds r0, r6, 0x4
	ldrb r2, [r4]
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08018DF4 @ =gBattleMoveDamage
	ldrb r0, [r4]
	lsls r0, 2
	add r0, r10
	ldr r0, [r0]
	str r0, [r1]
	ldr r2, _08018DF8 @ =gUnknown_2023ECC
	mov r3, r9
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, 0x4
	adds r0, r2
	ldr r1, _08018DFC @ =0x0000ffff
	str r1, [r0]
	ldr r0, _08018E00 @ =gUnknown_81D8E12
	b _08018F44
	.align 2, 0
_08018DEC: .4byte gUnknown_2023E82
_08018DF0: .4byte sBattler_AI
_08018DF4: .4byte gBattleMoveDamage
_08018DF8: .4byte gUnknown_2023ECC
_08018DFC: .4byte 0x0000ffff
_08018E00: .4byte gUnknown_81D8E12
_08018E04:
	ldr r0, [r7]
	ldr r2, _08018E7C @ =0x00000181
	adds r0, r2
	ldrb r0, [r0]
	mov r1, r8
	ldrb r1, [r1]
	cmp r0, r1
	bcs _08018E16
	b _08018CFC
_08018E16:
	ldr r0, [r7]
	movs r2, 0xC0
	lsls r2, 1
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r7]
	ldr r3, _08018E7C @ =0x00000181
	adds r1, r0, r3
	movs r0, 0
	strb r0, [r1]
_08018E2C:
	adds r3, r7, 0
	ldr r0, [r3]
	ldr r2, _08018E7C @ =0x00000181
	adds r0, r2
	ldr r1, _08018E80 @ =gBattlersCount
	ldrb r0, [r0]
	mov r8, r1
	ldrb r4, [r1]
	cmp r0, r4
	bcc _08018E42
	b _08018F68
_08018E42:
	ldr r5, _08018E84 @ =gActiveBattler
	ldr r4, _08018E88 @ =gBattleTextBuff1
	ldr r6, _08018E8C @ =gDisableStructs
	mov r12, r6
	ldr r0, _08018E90 @ =sBattler_AI
	mov r9, r0
_08018E4E:
	ldr r1, _08018E94 @ =gUnknown_2023BDE
	ldr r0, [r3]
	adds r3, r0, r2
	ldrb r0, [r3]
	adds r0, r1
	ldrb r0, [r0]
	mov r1, r9
	strb r0, [r1]
	strb r0, [r5]
	ldr r0, _08018E98 @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldr r2, _08018E9C @ =gBitTable
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08018EA0
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	b _08018F54
	.align 2, 0
_08018E7C: .4byte 0x00000181
_08018E80: .4byte gBattlersCount
_08018E84: .4byte gActiveBattler
_08018E88: .4byte gBattleTextBuff1
_08018E8C: .4byte gDisableStructs
_08018E90: .4byte sBattler_AI
_08018E94: .4byte gUnknown_2023BDE
_08018E98: .4byte gAbsentBattlerFlags
_08018E9C: .4byte gBitTable
_08018EA0:
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	ldr r6, _08018F14 @ =gStatuses3
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08018F54
	movs r0, 0xFD
	strb r0, [r4]
	movs r0, 0x1
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
	strb r0, [r4, 0x3]
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r12
	ldrb r0, [r0, 0xF]
	lsls r0, 28
	lsrs r0, 28
	strb r0, [r4, 0x4]
	movs r0, 0xFF
	strb r0, [r4, 0x5]
	ldrb r2, [r5]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	mov r3, r12
	adds r4, r0, r3
	ldrb r3, [r4, 0xF]
	lsls r1, r3, 28
	cmp r1, 0
	bne _08018F28
	lsls r2, 2
	adds r2, r6
	ldr r0, [r2]
	movs r1, 0x21
	negs r1, r1
	ands r0, r1
	str r0, [r2]
	ldr r3, _08018F18 @ =gBattleMoveDamage
	ldr r2, _08018F1C @ =gBattleMons
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x28]
	str r0, [r3]
	ldr r1, _08018F20 @ =gUnknown_2023D74
	ldr r0, _08018F24 @ =gUnknown_81D8D33
	b _08018F40
	.align 2, 0
_08018F14: .4byte gStatuses3
_08018F18: .4byte gBattleMoveDamage
_08018F1C: .4byte gBattleMons
_08018F20: .4byte gUnknown_2023D74
_08018F24: .4byte gUnknown_81D8D33
_08018F28:
	lsrs r1, 28
	subs r1, 0x1
	movs r0, 0xF
	ands r1, r0
	movs r6, 0x10
	negs r6, r6
	adds r0, r6, 0
	ands r0, r3
	orrs r0, r1
	strb r0, [r4, 0xF]
	ldr r1, _08018F4C @ =gUnknown_2023D74
	ldr r0, _08018F50 @ =gUnknown_81D8D4E
_08018F40:
	str r0, [r1]
	ldr r0, [r1]
_08018F44:
	bl BattleScriptExecute
	movs r0, 0x1
	b _08018F74
	.align 2, 0
_08018F4C: .4byte gUnknown_2023D74
_08018F50: .4byte gUnknown_81D8D4E
_08018F54:
	adds r3, r7, 0
	ldr r0, [r3]
	ldr r2, _08018F84 @ =0x00000181
	adds r0, r2
	ldrb r0, [r0]
	mov r1, r8
	ldrb r1, [r1]
	cmp r0, r1
	bcs _08018F68
	b _08018E4E
_08018F68:
	ldr r2, _08018F88 @ =gUnknown_2023DD0
	ldr r0, [r2]
	ldr r1, _08018F8C @ =0xfeffffdf
	ands r0, r1
	str r0, [r2]
	movs r0, 0
_08018F74:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08018F84: .4byte 0x00000181
_08018F88: .4byte gUnknown_2023DD0
_08018F8C: .4byte 0xfeffffdf
	thumb_func_end sub_8018C98

	thumb_func_start HandleFaintedMonActions
HandleFaintedMonActions: @ 8018F90
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r0, _08018FA8 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08018FD8
	b _08019272
	.align 2, 0
_08018FA8: .4byte gBattleTypeFlags
_08018FAC:
	ldr r0, _08018FBC @ =gUnknown_81D8694
	bl BattleScriptExecute
	ldr r0, [r5]
	adds r0, 0x4D
	movs r1, 0x2
	b _08018FCC
	.align 2, 0
_08018FBC: .4byte gUnknown_81D8694
_08018FC0:
	ldr r0, _08018FD4 @ =gUnknown_81D869D
	bl BattleScriptExecute
	ldr r0, [r5]
	adds r0, 0x4D
	movs r1, 0x5
_08018FCC:
	strb r1, [r0]
_08018FCE:
	movs r0, 0x1
	b _08019274
	.align 2, 0
_08018FD4: .4byte gUnknown_81D869D
_08018FD8:
	ldr r0, _08018FF4 @ =gBattleStruct
	mov r8, r0
_08018FDC:
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0x4D
	ldrb r0, [r0]
	cmp r0, 0x7
	bls _08018FEA
	b _08019264
_08018FEA:
	lsls r0, 2
	ldr r1, _08018FF8 @ =_08018FFC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08018FF4: .4byte gBattleStruct
_08018FF8: .4byte _08018FFC
	.align 2, 0
_08018FFC:
	.4byte _0801901C
	.4byte _0801906E
	.4byte _08019108
	.4byte _0801914A
	.4byte _0801915E
	.4byte _080191C8
	.4byte _080191FC
	.4byte _08019264
_0801901C:
	mov r4, r8
	ldr r0, [r4]
	adds r0, 0x4E
	movs r1, 0
	strb r1, [r0]
	ldr r1, [r4]
	adds r1, 0x4D
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r5, 0
	ldr r0, _080190E8 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	bge _0801906E
	ldr r6, _080190EC @ =gAbsentBattlerFlags
_0801903C:
	ldrb r0, [r6]
	ldr r2, _080190F0 @ =gBitTable
	lsls r1, r5, 2
	adds r1, r2
	ldr r4, [r1]
	ands r0, r4
	cmp r0, 0
	beq _08019064
	lsls r0, r5, 24
	lsrs r0, 24
	movs r1, 0x6
	movs r2, 0x6
	bl sub_8019C10
	lsls r0, 24
	cmp r0, 0
	bne _08019064
	ldrb r0, [r6]
	bics r0, r4
	strb r0, [r6]
_08019064:
	adds r5, 0x1
	ldr r0, _080190E8 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _0801903C
_0801906E:
	ldr r0, _080190F4 @ =gBattleStruct
	mov r8, r0
	ldr r1, _080190F8 @ =gUnknown_2023D6D
	mov r12, r1
	ldr r2, _080190FC @ =gBattlerTarget
	mov r5, r8
	ldr r7, _08019100 @ =gBattleMons
	ldr r6, _08019104 @ =gBattlerPartyIndexes
_0801907E:
	ldr r3, [r5]
	adds r1, r3, 0
	adds r1, 0x4E
	ldrb r0, [r1]
	strb r0, [r2]
	mov r4, r12
	strb r0, [r4]
	ldrb r4, [r1]
	movs r0, 0x58
	muls r0, r4
	adds r0, r7
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _080190C6
	adds r0, r3, 0
	adds r0, 0xDF
	ldrb r1, [r0]
	ldr r3, _080190F0 @ =gBitTable
	lsls r0, r4, 1
	adds r0, r6
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080190C6
	ldr r0, _080190EC @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	lsls r0, r4, 2
	adds r0, r3
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080190C6
	b _08018FAC
_080190C6:
	ldr r0, [r5]
	adds r0, 0x4E
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	ldr r0, _080190E8 @ =gBattlersCount
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r0]
	cmp r1, r0
	bne _0801907E
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0x4D
	movs r1, 0x3
	strb r1, [r0]
	b _08019264
	.align 2, 0
_080190E8: .4byte gBattlersCount
_080190EC: .4byte gAbsentBattlerFlags
_080190F0: .4byte gBitTable
_080190F4: .4byte gBattleStruct
_080190F8: .4byte gUnknown_2023D6D
_080190FC: .4byte gBattlerTarget
_08019100: .4byte gBattleMons
_08019104: .4byte gBattlerPartyIndexes
_08019108:
	ldr r0, _08019134 @ =gUnknown_2023D6D
	ldrb r0, [r0]
	bl sub_8017434
	ldr r2, _08019138 @ =gBattleStruct
	ldr r1, [r2]
	adds r1, 0x4E
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, _0801913C @ =gBattlersCount
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _08019140
	ldr r0, [r2]
	adds r0, 0x4D
	movs r1, 0x3
	strb r1, [r0]
	b _08019262
	.align 2, 0
_08019134: .4byte gUnknown_2023D6D
_08019138: .4byte gBattleStruct
_0801913C: .4byte gBattlersCount
_08019140:
	ldr r0, [r2]
	adds r0, 0x4D
	movs r1, 0x1
	strb r1, [r0]
	b _08019262
_0801914A:
	mov r4, r8
	ldr r0, [r4]
	adds r0, 0x4E
	movs r1, 0
	strb r1, [r0]
	ldr r1, [r4]
	adds r1, 0x4D
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0801915E:
	ldr r0, _080191AC @ =gUnknown_2023D6D
	mov r12, r0
	ldr r7, _080191B0 @ =gBattlerTarget
	ldr r5, _080191B4 @ =gBattleStruct
	ldr r2, _080191B8 @ =gBattleMons
	ldr r6, _080191BC @ =gBitTable
_0801916A:
	ldr r0, [r5]
	adds r4, r0, 0
	adds r4, 0x4E
	ldrb r0, [r4]
	strb r0, [r7]
	mov r1, r12
	strb r0, [r1]
	ldrb r3, [r4]
	movs r0, 0x58
	muls r0, r3
	adds r0, r2
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _08019198
	ldr r0, _080191C0 @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	lsls r0, r3, 2
	adds r0, r6
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08019198
	b _08018FC0
_08019198:
	adds r0, r3, 0x1
	strb r0, [r4]
	ldr r1, _080191C4 @ =gBattlersCount
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _0801916A
	b _080191E0
	.align 2, 0
_080191AC: .4byte gUnknown_2023D6D
_080191B0: .4byte gBattlerTarget
_080191B4: .4byte gBattleStruct
_080191B8: .4byte gBattleMons
_080191BC: .4byte gBitTable
_080191C0: .4byte gAbsentBattlerFlags
_080191C4: .4byte gBattlersCount
_080191C8:
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0x4E
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	ldr r0, _080191EC @ =gBattlersCount
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r0]
	cmp r1, r0
	bne _080191F0
_080191E0:
	mov r4, r8
	ldr r0, [r4]
	adds r0, 0x4D
	movs r1, 0x6
	strb r1, [r0]
	b _08019264
	.align 2, 0
_080191EC: .4byte gBattlersCount
_080191F0:
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0x4D
	movs r1, 0x4
	strb r1, [r0]
	b _08019264
_080191FC:
	movs r0, 0
	str r0, [sp]
	movs r0, 0x9
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08019216
	b _08018FCE
_08019216:
	str r0, [sp]
	movs r0, 0xB
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	beq _0801922C
	b _08018FCE
_0801922C:
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x1
	bl sub_801BC68
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08019240
	b _08018FCE
_08019240:
	str r0, [sp]
	movs r0, 0x6
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	beq _08019256
	b _08018FCE
_08019256:
	ldr r2, _08019280 @ =gBattleStruct
	ldr r1, [r2]
	adds r1, 0x4D
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08019262:
	mov r8, r2
_08019264:
	mov r4, r8
	ldr r0, [r4]
	adds r0, 0x4D
	ldrb r0, [r0]
	cmp r0, 0x7
	beq _08019272
	b _08018FDC
_08019272:
	movs r0, 0
_08019274:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08019280: .4byte gBattleStruct
	thumb_func_end HandleFaintedMonActions

	thumb_func_start TryClearRageStatuses
TryClearRageStatuses: @ 8019284
	push {r4-r6,lr}
	movs r3, 0
	ldr r0, _080192C4 @ =gBattlersCount
	adds r5, r0, 0
	ldrb r0, [r5]
	cmp r3, r0
	bge _080192BC
	ldr r4, _080192C8 @ =gUnknown_2023DC4
	movs r6, 0x80
	lsls r6, 16
	ldr r2, _080192CC @ =gUnknown_2023C34
_0801929A:
	ldr r1, [r2]
	adds r0, r1, 0
	ands r0, r6
	cmp r0, 0
	beq _080192B0
	ldrh r0, [r4]
	cmp r0, 0x63
	beq _080192B0
	ldr r0, _080192D0 @ =0xff7fffff
	ands r1, r0
	str r1, [r2]
_080192B0:
	adds r4, 0x2
	adds r2, 0x58
	adds r3, 0x1
	ldrb r0, [r5]
	cmp r3, r0
	blt _0801929A
_080192BC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080192C4: .4byte gBattlersCount
_080192C8: .4byte gUnknown_2023DC4
_080192CC: .4byte gUnknown_2023C34
_080192D0: .4byte 0xff7fffff
	thumb_func_end TryClearRageStatuses

	thumb_func_start sub_80192D4
sub_80192D4: @ 80192D4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	movs r0, 0
	mov r9, r0
	ldr r1, _080192F0 @ =gUnknown_2023FC8
	mov r10, r1
	ldr r2, _080192F4 @ =gBattleStruct
	mov r8, r2
	b _08019302
	.align 2, 0
_080192F0: .4byte gUnknown_2023FC8
_080192F4: .4byte gBattleStruct
_080192F8:
	mov r4, r9
	cmp r4, 0
	beq _08019302
	bl _08019BA8
_08019302:
	mov r7, r8
	ldr r0, [r7]
	adds r0, 0xB7
	ldrb r0, [r0]
	cmp r0, 0xF
	bls _08019312
	bl _08019B98
_08019312:
	lsls r0, 2
	ldr r1, _0801931C @ =_08019320
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801931C: .4byte _08019320
	.align 2, 0
_08019320:
	.4byte _08019360
	.4byte _080193A4
	.4byte _080194E0
	.4byte _08019598
	.4byte _0801960C
	.4byte _08019678
	.4byte _080196E0
	.4byte _08019754
	.4byte _080197B8
	.4byte _08019814
	.4byte _080198F8
	.4byte _08019974
	.4byte _080199C8
	.4byte _08019A60
	.4byte _08019B40
	.4byte _08019B98
_08019360:
	ldr r1, _08019390 @ =gBattleMons
	ldr r3, _08019394 @ =sBattler_AI
	ldrb r2, [r3]
	movs r0, 0x58
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	ldr r1, _08019398 @ =0xfdffffff
	ands r0, r1
	str r0, [r2]
	ldr r0, _0801939C @ =gStatuses3
	ldrb r2, [r3]
	lsls r2, 2
	adds r2, r0
	ldr r0, [r2]
	ldr r1, _080193A0 @ =0xffffbfff
	ands r0, r1
	str r0, [r2]
	mov r0, r8
	ldr r1, [r0]
	bl _08019B90
	.align 2, 0
_08019390: .4byte gBattleMons
_08019394: .4byte sBattler_AI
_08019398: .4byte 0xfdffffff
_0801939C: .4byte gStatuses3
_080193A0: .4byte 0xffffbfff
_080193A4:
	ldr r7, _0801940C @ =gBattleMons
	ldr r4, _08019410 @ =sBattler_AI
	ldrb r1, [r4]
	movs r5, 0x58
	adds r0, r1, 0
	muls r0, r5
	adds r6, r7, 0
	adds r6, 0x4C
	adds r0, r6
	ldr r0, [r0]
	movs r2, 0x7
	mov r8, r2
	ands r0, r2
	cmp r0, 0
	bne _080193C4
	b _08019946
_080193C4:
	adds r0, r1, 0
	bl UproarWakeUpCheck
	lsls r0, 24
	cmp r0, 0
	beq _08019424
	ldrb r0, [r4]
	adds r2, r0, 0
	muls r2, r5
	adds r2, r6
	ldr r0, [r2]
	movs r1, 0x8
	negs r1, r1
	ands r0, r1
	str r0, [r2]
	ldrb r0, [r4]
	adds r2, r0, 0
	muls r2, r5
	adds r0, r7, 0
	adds r0, 0x50
	adds r2, r0
	ldr r0, [r2]
	ldr r1, _08019414 @ =0xf7ffffff
	ands r0, r1
	str r0, [r2]
	bl BattleScriptPushCursor
	ldr r1, _08019418 @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x5]
	ldr r1, _0801941C @ =gUnknown_2023D74
	ldr r0, _08019420 @ =gUnknown_81D9036
	str r0, [r1]
	movs r4, 0x2
	mov r9, r4
	b _08019946
	.align 2, 0
_0801940C: .4byte gBattleMons
_08019410: .4byte sBattler_AI
_08019414: .4byte 0xf7ffffff
_08019418: .4byte gUnknown_2023E82
_0801941C: .4byte gUnknown_2023D74
_08019420: .4byte gUnknown_81D9036
_08019424:
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r5
	adds r0, r1, r7
	adds r0, 0x20
	ldrb r0, [r0]
	movs r3, 0x1
	cmp r0, 0x30
	bne _08019438
	movs r3, 0x2
_08019438:
	adds r2, r1, r6
	ldr r1, [r2]
	adds r0, r1, 0
	mov r7, r8
	ands r0, r7
	cmp r0, r3
	bcs _08019450
	movs r0, 0x8
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	b _08019454
_08019450:
	subs r0, r1, r3
	str r0, [r2]
_08019454:
	ldr r2, _08019498 @ =gBattleMons
	ldr r0, _0801949C @ =sBattler_AI
	ldrb r1, [r0]
	movs r0, 0x58
	muls r1, r0
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r1, r0
	ldr r4, [r0]
	movs r0, 0x7
	ands r4, r0
	cmp r4, 0
	beq _080194B0
	ldr r0, _080194A0 @ =gCurrentMove
	ldrh r0, [r0]
	cmp r0, 0xAD
	bne _08019478
	b _08019946
_08019478:
	cmp r0, 0xD6
	bne _0801947E
	b _08019946
_0801947E:
	ldr r1, _080194A4 @ =gUnknown_2023D74
	ldr r0, _080194A8 @ =gUnknown_81D9029
	str r0, [r1]
	ldr r2, _080194AC @ =gUnknown_2023DD0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
	movs r0, 0x2
	mov r9, r0
	b _08019946
	.align 2, 0
_08019498: .4byte gBattleMons
_0801949C: .4byte sBattler_AI
_080194A0: .4byte gCurrentMove
_080194A4: .4byte gUnknown_2023D74
_080194A8: .4byte gUnknown_81D9029
_080194AC: .4byte gUnknown_2023DD0
_080194B0:
	adds r2, 0x50
	adds r2, r1, r2
	ldr r0, [r2]
	ldr r1, _080194D0 @ =0xf7ffffff
	ands r0, r1
	str r0, [r2]
	bl BattleScriptPushCursor
	ldr r0, _080194D4 @ =gUnknown_2023E82
	strb r4, [r0, 0x5]
	ldr r1, _080194D8 @ =gUnknown_2023D74
	ldr r0, _080194DC @ =gUnknown_81D9036
	str r0, [r1]
	movs r1, 0x2
	mov r9, r1
	b _08019946
	.align 2, 0
_080194D0: .4byte 0xf7ffffff
_080194D4: .4byte gUnknown_2023E82
_080194D8: .4byte gUnknown_2023D74
_080194DC: .4byte gUnknown_81D9036
_080194E0:
	ldr r1, _0801953C @ =gBattleMons
	ldr r7, _08019540 @ =sBattler_AI
	ldrb r0, [r7]
	movs r6, 0x58
	muls r0, r6
	adds r5, r1, 0
	adds r5, 0x4C
	adds r0, r5
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08019580
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _08019558
	ldr r2, _08019544 @ =gBattleMoves
	ldr r0, _08019548 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x7D
	bne _08019526
	b _08019946
_08019526:
	ldr r1, _0801954C @ =gUnknown_2023D74
	ldr r0, _08019550 @ =gUnknown_81D9080
	str r0, [r1]
	ldr r2, _08019554 @ =gUnknown_2023DD0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 2
	orrs r0, r1
	str r0, [r2]
	b _08019578
	.align 2, 0
_0801953C: .4byte gBattleMons
_08019540: .4byte sBattler_AI
_08019544: .4byte gBattleMoves
_08019548: .4byte gCurrentMove
_0801954C: .4byte gUnknown_2023D74
_08019550: .4byte gUnknown_81D9080
_08019554: .4byte gUnknown_2023DD0
_08019558:
	ldrb r0, [r7]
	adds r2, r0, 0
	muls r2, r6
	adds r2, r5
	ldr r0, [r2]
	movs r1, 0x21
	negs r1, r1
	ands r0, r1
	str r0, [r2]
	bl BattleScriptPushCursor
	ldr r1, _08019588 @ =gUnknown_2023D74
	ldr r0, _0801958C @ =gUnknown_81D908D
	str r0, [r1]
	ldr r0, _08019590 @ =gUnknown_2023E82
	strb r4, [r0, 0x5]
_08019578:
	movs r2, 0x2
	mov r9, r2
	ldr r4, _08019594 @ =gBattleStruct
	mov r8, r4
_08019580:
	mov r7, r8
	ldr r1, [r7]
	b _08019B90
	.align 2, 0
_08019588: .4byte gUnknown_2023D74
_0801958C: .4byte gUnknown_81D908D
_08019590: .4byte gUnknown_2023E82
_08019594: .4byte gBattleStruct
_08019598:
	ldr r1, _080195EC @ =gBattleMons
	ldr r0, _080195F0 @ =sBattler_AI
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x36
	beq _080195AE
	b _08019946
_080195AE:
	ldr r0, _080195F4 @ =gDisableStructs
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x18]
	lsls r0, 31
	cmp r0, 0
	bne _080195C2
	b _08019946
_080195C2:
	adds r0, r2, 0
	bl CancelMultiTurnMoves
	ldr r2, _080195F8 @ =gUnknown_2023DD0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
	ldr r1, _080195FC @ =gUnknown_2023E82
	movs r0, 0
	strb r0, [r1, 0x5]
	ldr r1, _08019600 @ =gUnknown_2023D74
	ldr r0, _08019604 @ =gUnknown_81D94F2
	str r0, [r1]
	ldr r2, _08019608 @ =gMoveResultFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	b _080197F4
	.align 2, 0
_080195EC: .4byte gBattleMons
_080195F0: .4byte sBattler_AI
_080195F4: .4byte gDisableStructs
_080195F8: .4byte gUnknown_2023DD0
_080195FC: .4byte gUnknown_2023E82
_08019600: .4byte gUnknown_2023D74
_08019604: .4byte gUnknown_81D94F2
_08019608: .4byte gMoveResultFlags
_0801960C:
	ldr r1, _0801965C @ =gBattleMons
	ldr r3, _08019660 @ =sBattler_AI
	ldrb r2, [r3]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x80
	lsls r0, 15
	ands r0, r1
	cmp r0, 0
	bne _08019628
	b _08019946
_08019628:
	ldr r0, _08019664 @ =0xffbfffff
	ands r1, r0
	str r1, [r2]
	ldr r2, _08019668 @ =gDisableStructs
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strb r1, [r0, 0x19]
	ldrb r0, [r3]
	bl CancelMultiTurnMoves
	ldr r1, _0801966C @ =gUnknown_2023D74
	ldr r0, _08019670 @ =gUnknown_81D7342
	str r0, [r1]
	ldr r2, _08019674 @ =gUnknown_2023DD0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
	movs r1, 0x1
	mov r9, r1
	b _08019946
	.align 2, 0
_0801965C: .4byte gBattleMons
_08019660: .4byte sBattler_AI
_08019664: .4byte 0xffbfffff
_08019668: .4byte gDisableStructs
_0801966C: .4byte gUnknown_2023D74
_08019670: .4byte gUnknown_81D7342
_08019674: .4byte gUnknown_2023DD0
_08019678:
	ldr r1, _080196C8 @ =gBattleMons
	ldr r3, _080196CC @ =sBattler_AI
	ldrb r2, [r3]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _08019692
	b _08019946
_08019692:
	movs r0, 0x9
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	ldr r0, _080196D0 @ =gUnknown_2023E8C
	ldrb r2, [r3]
	lsls r2, 4
	adds r2, r0
	ldrb r0, [r2, 0x2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x2]
	ldrb r0, [r3]
	bl CancelMultiTurnMoves
	ldr r1, _080196D4 @ =gUnknown_2023D74
	ldr r0, _080196D8 @ =gUnknown_81D90B1
	str r0, [r1]
	ldr r2, _080196DC @ =gUnknown_2023DD0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
	movs r2, 0x1
	mov r9, r2
	b _08019946
	.align 2, 0
_080196C8: .4byte gBattleMons
_080196CC: .4byte sBattler_AI
_080196D0: .4byte gUnknown_2023E8C
_080196D4: .4byte gUnknown_2023D74
_080196D8: .4byte gUnknown_81D90B1
_080196DC: .4byte gUnknown_2023DD0
_080196E0:
	ldr r0, _08019734 @ =gDisableStructs
	ldr r3, _08019738 @ =sBattler_AI
	ldrb r2, [r3]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r0
	ldr r0, _0801973C @ =gCurrentMove
	ldrh r1, [r1, 0x4]
	ldrh r0, [r0]
	cmp r1, r0
	beq _080196FA
	b _08019946
_080196FA:
	cmp r1, 0
	bne _08019700
	b _08019946
_08019700:
	ldr r0, _08019740 @ =gUnknown_2023E8C
	lsls r2, 4
	adds r2, r0
	ldrb r0, [r2, 0x1]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldr r1, _08019744 @ =gBattleScripting
	ldrb r0, [r3]
	strb r0, [r1, 0x17]
	ldrb r0, [r3]
	bl CancelMultiTurnMoves
	ldr r1, _08019748 @ =gUnknown_2023D74
	ldr r0, _0801974C @ =gUnknown_81D8C4F
	str r0, [r1]
	ldr r2, _08019750 @ =gUnknown_2023DD0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
	movs r4, 0x1
	mov r9, r4
	b _08019946
	.align 2, 0
_08019734: .4byte gDisableStructs
_08019738: .4byte sBattler_AI
_0801973C: .4byte gCurrentMove
_08019740: .4byte gUnknown_2023E8C
_08019744: .4byte gBattleScripting
_08019748: .4byte gUnknown_2023D74
_0801974C: .4byte gUnknown_81D8C4F
_08019750: .4byte gUnknown_2023DD0
_08019754:
	ldr r0, _0801979C @ =gDisableStructs
	ldr r4, _080197A0 @ =sBattler_AI
	ldrb r3, [r4]
	lsls r1, r3, 3
	subs r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x13]
	lsls r0, 28
	cmp r0, 0
	bne _0801976C
	b _08019946
_0801976C:
	ldr r2, _080197A4 @ =gBattleMoves
	ldr r0, _080197A8 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _08019782
	b _08019946
_08019782:
	ldr r0, _080197AC @ =gUnknown_2023E8C
	lsls r2, r3, 4
	adds r2, r0
	ldrb r0, [r2, 0x2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x2]
	ldrb r0, [r4]
	bl CancelMultiTurnMoves
	ldr r1, _080197B0 @ =gUnknown_2023D74
	ldr r0, _080197B4 @ =gUnknown_81D8ECA
	b _08019934
	.align 2, 0
_0801979C: .4byte gDisableStructs
_080197A0: .4byte sBattler_AI
_080197A4: .4byte gBattleMoves
_080197A8: .4byte gCurrentMove
_080197AC: .4byte gUnknown_2023E8C
_080197B0: .4byte gUnknown_2023D74
_080197B4: .4byte gUnknown_81D8ECA
_080197B8:
	ldr r4, _080197FC @ =sBattler_AI
	ldrb r0, [r4]
	ldr r1, _08019800 @ =gCurrentMove
	ldrh r1, [r1]
	bl GetImprisonedMovesCount
	lsls r0, 24
	cmp r0, 0
	bne _080197CC
	b _08019946
_080197CC:
	ldr r0, _08019804 @ =gUnknown_2023E8C
	ldrb r2, [r4]
	lsls r2, 4
	adds r2, r0
	ldrb r0, [r2, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r4]
	bl CancelMultiTurnMoves
	ldr r1, _08019808 @ =gUnknown_2023D74
	ldr r0, _0801980C @ =gUnknown_81D8F94
	str r0, [r1]
	ldr r2, _08019810 @ =gUnknown_2023DD0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
_080197F4:
	movs r0, 0x1
	mov r9, r0
	b _08019946
	.align 2, 0
_080197FC: .4byte sBattler_AI
_08019800: .4byte gCurrentMove
_08019804: .4byte gUnknown_2023E8C
_08019808: .4byte gUnknown_2023D74
_0801980C: .4byte gUnknown_81D8F94
_08019810: .4byte gUnknown_2023DD0
_08019814:
	ldr r7, _0801985C @ =gBattleMons
	ldr r5, _08019860 @ =sBattler_AI
	ldrb r0, [r5]
	movs r6, 0x58
	muls r0, r6
	adds r4, r7, 0
	adds r4, 0x50
	adds r2, r0, r4
	ldr r1, [r2]
	movs r3, 0x7
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	beq _080198E6
	subs r0, r1, 0x1
	str r0, [r2]
	ldrb r0, [r5]
	muls r0, r6
	adds r0, r4
	ldr r0, [r0]
	ands r0, r3
	cmp r0, 0
	beq _080198D4
	bl Random
	movs r1, 0x1
	movs r2, 0x1
	ands r2, r0
	cmp r2, 0
	beq _08019868
	ldr r1, _08019864 @ =gUnknown_2023E82
	movs r0, 0
	strb r0, [r1, 0x5]
	bl BattleScriptPushCursor
	b _080198B2
	.align 2, 0
_0801985C: .4byte gBattleMons
_08019860: .4byte sBattler_AI
_08019864: .4byte gUnknown_2023E82
_08019868:
	ldr r0, _080198B8 @ =gUnknown_2023E82
	movs r4, 0x1
	strb r1, [r0, 0x5]
	ldr r1, _080198BC @ =gBattlerTarget
	ldrb r0, [r5]
	strb r0, [r1]
	ldrb r0, [r5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r7
	movs r0, 0x28
	str r0, [sp]
	str r2, [sp, 0x4]
	ldrb r0, [r5]
	str r0, [sp, 0x8]
	ldrb r0, [r5]
	str r0, [sp, 0xC]
	adds r0, r1, 0
	movs r2, 0x1
	movs r3, 0
	bl CalculateBaseDamage
	ldr r1, _080198C0 @ =gBattleMoveDamage
	str r0, [r1]
	ldr r0, _080198C4 @ =gUnknown_2023E8C
	ldrb r1, [r5]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	orrs r0, r4
	strb r0, [r1, 0x1]
	ldr r2, _080198C8 @ =gUnknown_2023DD0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
_080198B2:
	ldr r1, _080198CC @ =gUnknown_2023D74
	ldr r0, _080198D0 @ =gUnknown_81D90D3
	b _080198DC
	.align 2, 0
_080198B8: .4byte gUnknown_2023E82
_080198BC: .4byte gBattlerTarget
_080198C0: .4byte gBattleMoveDamage
_080198C4: .4byte gUnknown_2023E8C
_080198C8: .4byte gUnknown_2023DD0
_080198CC: .4byte gUnknown_2023D74
_080198D0: .4byte gUnknown_81D90D3
_080198D4:
	bl BattleScriptPushCursor
	ldr r1, _080198EC @ =gUnknown_2023D74
	ldr r0, _080198F0 @ =gUnknown_81D9116
_080198DC:
	str r0, [r1]
	movs r1, 0x1
	mov r9, r1
	ldr r2, _080198F4 @ =gBattleStruct
	mov r8, r2
_080198E6:
	mov r4, r8
	ldr r1, [r4]
	b _08019B90
	.align 2, 0
_080198EC: .4byte gUnknown_2023D74
_080198F0: .4byte gUnknown_81D9116
_080198F4: .4byte gBattleStruct
_080198F8:
	ldr r1, _08019958 @ =gBattleMons
	ldr r4, _0801995C @ =sBattler_AI
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08019946
	bl Random
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	cmp r1, 0
	bne _08019946
	ldr r0, _08019960 @ =gUnknown_2023E8C
	ldrb r2, [r4]
	lsls r2, 4
	adds r2, r0
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08019964 @ =gUnknown_2023D74
	ldr r0, _08019968 @ =gUnknown_81D90A1
_08019934:
	str r0, [r1]
	ldr r2, _0801996C @ =gUnknown_2023DD0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
	movs r7, 0x1
	mov r9, r7
_08019946:
	ldr r2, _08019970 @ =gBattleStruct
	ldr r1, [r2]
	adds r1, 0xB7
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r8, r2
	b _08019B98
	.align 2, 0
_08019958: .4byte gBattleMons
_0801995C: .4byte sBattler_AI
_08019960: .4byte gUnknown_2023E8C
_08019964: .4byte gUnknown_2023D74
_08019968: .4byte gUnknown_81D90A1
_0801996C: .4byte gUnknown_2023DD0
_08019970: .4byte gBattleStruct
_08019974:
	ldr r0, _0801999C @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0xA0
	lsls r0, 8
	ands r1, r0
	movs r0, 0x80
	lsls r0, 8
	cmp r1, r0
	beq _08019988
	b _08019B8C
_08019988:
	ldr r0, _080199A0 @ =sBattler_AI
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080199AC
	ldr r1, _080199A4 @ =gUnknown_2023D74
	ldr r0, _080199A8 @ =gUnknown_81D9180
	b _080199B0
	.align 2, 0
_0801999C: .4byte gBattleTypeFlags
_080199A0: .4byte sBattler_AI
_080199A4: .4byte gUnknown_2023D74
_080199A8: .4byte gUnknown_81D9180
_080199AC:
	ldr r1, _080199BC @ =gUnknown_2023D74
	ldr r0, _080199C0 @ =gUnknown_81D9192
_080199B0:
	str r0, [r1]
	ldr r1, _080199C4 @ =gUnknown_2023E82
	movs r0, 0
	strb r0, [r1, 0x5]
	movs r0, 0x1
	b _08019B86
	.align 2, 0
_080199BC: .4byte gUnknown_2023D74
_080199C0: .4byte gUnknown_81D9192
_080199C4: .4byte gUnknown_2023E82
_080199C8:
	ldr r1, _08019A00 @ =gBattleMons
	ldr r4, _08019A04 @ =sBattler_AI
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0xF0
	lsls r0, 12
	ands r1, r0
	cmp r1, 0
	beq _08019A42
	lsrs r0, r1, 16
	bl CountTrailingZeroBits
	ldr r1, _08019A08 @ =gBattleScripting
	strb r0, [r1, 0x17]
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08019A0C
	bl BattleScriptPushCursor
	b _08019A34
	.align 2, 0
_08019A00: .4byte gBattleMons
_08019A04: .4byte sBattler_AI
_08019A08: .4byte gBattleScripting
_08019A0C:
	ldr r0, _08019A48 @ =gUnknown_81D914A
	bl BattleScriptPush
	ldr r2, _08019A4C @ =gUnknown_2023DD0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
	ldr r0, _08019A50 @ =gUnknown_2023E8C
	ldrb r2, [r4]
	lsls r2, 4
	adds r2, r0
	ldrb r0, [r2, 0x1]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r4]
	bl CancelMultiTurnMoves
_08019A34:
	ldr r1, _08019A54 @ =gUnknown_2023D74
	ldr r0, _08019A58 @ =gUnknown_81D913D
	str r0, [r1]
	movs r4, 0x1
	mov r9, r4
	ldr r7, _08019A5C @ =gBattleStruct
	mov r8, r7
_08019A42:
	mov r0, r8
	ldr r1, [r0]
	b _08019B90
	.align 2, 0
_08019A48: .4byte gUnknown_81D914A
_08019A4C: .4byte gUnknown_2023DD0
_08019A50: .4byte gUnknown_2023E8C
_08019A54: .4byte gUnknown_2023D74
_08019A58: .4byte gUnknown_81D913D
_08019A5C: .4byte gBattleStruct
_08019A60:
	ldr r1, _08019A98 @ =gBattleMons
	ldr r6, _08019A9C @ =sBattler_AI
	ldrb r0, [r6]
	movs r5, 0x58
	muls r0, r5
	adds r1, 0x50
	adds r3, r0, r1
	ldr r2, [r3]
	movs r4, 0xC0
	lsls r4, 2
	adds r0, r2, 0
	ands r0, r4
	cmp r0, 0
	beq _08019B32
	ldr r7, _08019AA0 @ =0xffffff00
	adds r0, r2, r7
	str r0, [r3]
	ldrb r2, [r6]
	adds r0, r2, 0
	muls r0, r5
	adds r0, r1
	ldr r0, [r0]
	ands r0, r4
	cmp r0, 0
	beq _08019AAC
	ldr r1, _08019AA4 @ =gUnknown_2023D74
	ldr r0, _08019AA8 @ =gUnknown_81D8BA9
	b _08019B2C
	.align 2, 0
_08019A98: .4byte gBattleMons
_08019A9C: .4byte sBattler_AI
_08019AA0: .4byte 0xffffff00
_08019AA4: .4byte gUnknown_2023D74
_08019AA8: .4byte gUnknown_81D8BA9
_08019AAC:
	ldr r3, _08019B04 @ =gUnknown_2023D58
	lsls r0, r2, 2
	adds r0, r3
	ldr r0, [r0]
	cmp r0, 0
	beq _08019B28
	ldr r1, _08019B08 @ =gCurrentMove
	movs r0, 0x75
	strh r0, [r1]
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	lsls r0, 1
	mov r1, r10
	str r0, [r1]
	ldr r4, _08019B0C @ =gBattlerTarget
	ldr r1, _08019B10 @ =gUnknown_2023DD8
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r0, _08019B14 @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldr r2, _08019B18 @ =gBitTable
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08019AF6
	movs r0, 0x75
	movs r1, 0x1
	bl GetMoveTarget
	strb r0, [r4]
_08019AF6:
	ldr r1, _08019B1C @ =gUnknown_2023D74
	ldr r0, _08019B20 @ =gUnknown_81D8BB4
	str r0, [r1]
	ldr r2, _08019B24 @ =gBattleStruct
	mov r8, r2
	b _08019B2E
	.align 2, 0
_08019B04: .4byte gUnknown_2023D58
_08019B08: .4byte gCurrentMove
_08019B0C: .4byte gBattlerTarget
_08019B10: .4byte gUnknown_2023DD8
_08019B14: .4byte gAbsentBattlerFlags
_08019B18: .4byte gBitTable
_08019B1C: .4byte gUnknown_2023D74
_08019B20: .4byte gUnknown_81D8BB4
_08019B24: .4byte gBattleStruct
_08019B28:
	ldr r1, _08019B38 @ =gUnknown_2023D74
	ldr r0, _08019B3C @ =gUnknown_81D8BFC
_08019B2C:
	str r0, [r1]
_08019B2E:
	movs r4, 0x1
	mov r9, r4
_08019B32:
	mov r7, r8
	ldr r1, [r7]
	b _08019B90
	.align 2, 0
_08019B38: .4byte gUnknown_2023D74
_08019B3C: .4byte gUnknown_81D8BFC
_08019B40:
	ldr r1, _08019BE8 @ =gBattleMons
	ldr r0, _08019BEC @ =sBattler_AI
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x4C
	adds r4, r0, r1
	ldr r3, [r4]
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	beq _08019B8C
	ldr r2, _08019BF0 @ =gBattleMoves
	ldr r0, _08019BF4 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x7D
	bne _08019B84
	movs r0, 0x21
	negs r0, r0
	ands r3, r0
	str r3, [r4]
	bl BattleScriptPushCursor
	ldr r1, _08019BF8 @ =gUnknown_2023D74
	ldr r0, _08019BFC @ =gUnknown_81D908D
	str r0, [r1]
	ldr r1, _08019C00 @ =gUnknown_2023E82
	movs r0, 0x1
	strb r0, [r1, 0x5]
_08019B84:
	movs r0, 0x2
_08019B86:
	mov r9, r0
	ldr r1, _08019C04 @ =gBattleStruct
	mov r8, r1
_08019B8C:
	mov r2, r8
	ldr r1, [r2]
_08019B90:
	adds r1, 0xB7
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08019B98:
	mov r4, r8
	ldr r0, [r4]
	adds r0, 0xB7
	ldrb r0, [r0]
	cmp r0, 0xF
	beq _08019BA8
	bl _080192F8
_08019BA8:
	mov r7, r9
	cmp r7, 0x2
	bne _08019BD4
	ldr r4, _08019C08 @ =gActiveBattler
	ldr r0, _08019BEC @ =sBattler_AI
	ldrb r0, [r0]
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	ldr r1, _08019C0C @ =gUnknown_2023C30
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl EmitSetMonData
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_08019BD4:
	mov r0, r9
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08019BE8: .4byte gBattleMons
_08019BEC: .4byte sBattler_AI
_08019BF0: .4byte gBattleMoves
_08019BF4: .4byte gCurrentMove
_08019BF8: .4byte gUnknown_2023D74
_08019BFC: .4byte gUnknown_81D908D
_08019C00: .4byte gUnknown_2023E82
_08019C04: .4byte gBattleStruct
_08019C08: .4byte gActiveBattler
_08019C0C: .4byte gUnknown_2023C30
	thumb_func_end sub_80192D4

	thumb_func_start sub_8019C10
sub_8019C10: @ 8019C10
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r3, r4, 0
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	ldr r0, _08019C3C @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08019C40
	movs r0, 0
	b _08019D90
	.align 2, 0
_08019C3C: .4byte gBattleTypeFlags
_08019C40:
	movs r0, 0x40
	ands r1, r0
	cmp r1, 0
	beq _08019CCC
	adds r0, r4, 0
	bl GetBankMultiplayerId
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	ldr r1, _08019CC4 @ =gEnemyParty
	mov r8, r1
	cmp r0, 0
	bne _08019C66
	ldr r0, _08019CC8 @ =gPlayerParty
	mov r8, r0
_08019C66:
	adds r0, r7, 0
	bl GetLinkTrainerFlankId
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 1
	adds r5, r0, r6
	adds r0, r5, 0x3
	cmp r5, r0
	bge _08019CB2
	adds r7, r0, 0
_08019C7C:
	movs r0, 0x64
	muls r0, r5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08019CAC
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _08019CAC
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	bne _08019CB2
_08019CAC:
	adds r5, 0x1
	cmp r5, r7
	blt _08019C7C
_08019CB2:
	movs r1, 0
	lsls r0, r6, 1
	adds r0, r6
	adds r0, 0x3
	cmp r5, r0
	bne _08019CC0
	movs r1, 0x1
_08019CC0:
	adds r0, r1, 0
	b _08019D90
	.align 2, 0
_08019CC4: .4byte gEnemyParty
_08019CC8: .4byte gPlayerParty
_08019CCC:
	adds r0, r3, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08019CF8
	movs r0, 0x1
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0x3
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08019CF4 @ =gEnemyParty
	mov r8, r0
	b _08019D10
	.align 2, 0
_08019CF4: .4byte gEnemyParty
_08019CF8:
	movs r0, 0
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0x2
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08019DA0 @ =gPlayerParty
	mov r8, r1
_08019D10:
	mov r0, r10
	cmp r0, 0x6
	bne _08019D20
	ldr r1, _08019DA4 @ =gBattlerPartyIndexes
	lsls r0, r7, 1
	adds r0, r1
	ldrb r0, [r0]
	mov r10, r0
_08019D20:
	mov r1, r9
	cmp r1, 0x6
	bne _08019D30
	ldr r1, _08019DA4 @ =gBattlerPartyIndexes
	lsls r0, r6, 1
	adds r0, r1
	ldrb r0, [r0]
	mov r9, r0
_08019D30:
	movs r5, 0
_08019D32:
	movs r0, 0x64
	muls r0, r5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08019D82
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _08019D82
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _08019D82
	cmp r5, r10
	beq _08019D82
	cmp r5, r9
	beq _08019D82
	ldr r0, _08019DA8 @ =gBattleStruct
	ldr r1, [r0]
	adds r0, r7, r1
	adds r0, 0x5C
	ldrb r0, [r0]
	cmp r5, r0
	beq _08019D82
	adds r0, r6, r1
	adds r0, 0x5C
	ldrb r0, [r0]
	cmp r5, r0
	bne _08019D88
_08019D82:
	adds r5, 0x1
	cmp r5, 0x5
	ble _08019D32
_08019D88:
	movs r0, 0
	cmp r5, 0x6
	bne _08019D90
	movs r0, 0x1
_08019D90:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08019DA0: .4byte gPlayerParty
_08019DA4: .4byte gBattlerPartyIndexes
_08019DA8: .4byte gBattleStruct
	thumb_func_end sub_8019C10

	thumb_func_start sub_8019DAC
sub_8019DAC: @ 8019DAC
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	ldr r1, _08019E1C @ =gBattleMons
	movs r0, 0x58
	muls r0, r6
	adds r4, r0, r1
	ldrh r1, [r4]
	ldr r0, _08019E20 @ =0x00000181
	cmp r1, r0
	bne _08019E50
	adds r0, r4, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x3B
	bne _08019E50
	ldrh r0, [r4, 0x28]
	cmp r0, 0
	beq _08019E50
	str r5, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	bne _08019DFE
	str r5, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	beq _08019E24
_08019DFE:
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0
	beq _08019E24
	adds r1, r4, 0
	adds r1, 0x22
	ldrb r0, [r1]
	cmp r0, 0
	beq _08019E24
	strb r5, [r2]
	strb r5, [r1]
	movs r0, 0x1
	b _08019F08
	.align 2, 0
_08019E1C: .4byte gBattleMons
_08019E20: .4byte 0x00000181
_08019E24:
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
	bne _08019E50
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	beq _08019E54
_08019E50:
	movs r0, 0
	b _08019F08
_08019E54:
	ldr r1, _08019F10 @ =gBattleWeather
	ldrh r0, [r1]
	movs r2, 0xE7
	ands r2, r0
	adds r4, r1, 0
	cmp r2, 0
	bne _08019E82
	ldr r1, _08019F14 @ =gBattleMons
	movs r0, 0x58
	muls r0, r6
	adds r1, r0, r1
	adds r3, r1, 0
	adds r3, 0x21
	ldrb r0, [r3]
	cmp r0, 0
	beq _08019E82
	adds r1, 0x22
	ldrb r0, [r1]
	cmp r0, 0
	beq _08019E82
	strb r2, [r3]
	strb r2, [r1]
	movs r5, 0x1
_08019E82:
	ldrh r1, [r4]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _08019EAE
	ldr r1, _08019F14 @ =gBattleMons
	movs r0, 0x58
	muls r0, r6
	adds r1, r0, r1
	adds r2, r1, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0xA
	beq _08019EAE
	adds r1, 0x22
	ldrb r0, [r1]
	cmp r0, 0xA
	beq _08019EAE
	movs r0, 0xA
	strb r0, [r2]
	strb r0, [r1]
	movs r5, 0x2
_08019EAE:
	ldrh r1, [r4]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _08019EDA
	ldr r1, _08019F14 @ =gBattleMons
	movs r0, 0x58
	muls r0, r6
	adds r1, r0, r1
	adds r2, r1, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0xB
	beq _08019EDA
	adds r1, 0x22
	ldrb r0, [r1]
	cmp r0, 0xB
	beq _08019EDA
	movs r0, 0xB
	strb r0, [r2]
	strb r0, [r1]
	movs r5, 0x3
_08019EDA:
	ldrh r1, [r4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08019F06
	ldr r1, _08019F14 @ =gBattleMons
	movs r0, 0x58
	muls r0, r6
	adds r1, r0, r1
	adds r2, r1, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0xF
	beq _08019F06
	adds r1, 0x22
	ldrb r0, [r1]
	cmp r0, 0xF
	beq _08019F06
	movs r0, 0xF
	strb r0, [r2]
	strb r0, [r1]
	movs r5, 0x4
_08019F06:
	adds r0, r5, 0
_08019F08:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08019F10: .4byte gBattleWeather
_08019F14: .4byte gBattleMons
	thumb_func_end sub_8019DAC

	thumb_func_start AbilityBattleEffects
AbilityBattleEffects: @ 8019F18
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	ldr r4, [sp, 0x48]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0
	mov r9, r0
	ldr r5, _08019F74 @ =sBattler_AI
	ldr r1, _08019F78 @ =gBattlersCount
	ldrb r0, [r5]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08019F54
	mov r1, r10
	strb r1, [r5]
_08019F54:
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08019F84
	ldr r1, _08019F7C @ =gBattlerPartyIndexes
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08019F80 @ =gPlayerParty
	b _08019F94
	.align 2, 0
_08019F74: .4byte sBattler_AI
_08019F78: .4byte gBattlersCount
_08019F7C: .4byte gBattlerPartyIndexes
_08019F80: .4byte gPlayerParty
_08019F84:
	ldr r1, _08019FC4 @ =gBattlerPartyIndexes
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08019FC8 @ =gEnemyParty
_08019F94:
	adds r6, r1, r0
	ldr r5, _08019FCC @ =gBattlerTarget
	ldr r1, _08019FD0 @ =gBattlersCount
	ldrb r0, [r5]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08019FA6
	mov r2, r10
	strb r2, [r5]
_08019FA6:
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08019FD8
	ldr r1, _08019FC4 @ =gBattlerPartyIndexes
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08019FD4 @ =gPlayerParty
	b _08019FE8
	.align 2, 0
_08019FC4: .4byte gBattlerPartyIndexes
_08019FC8: .4byte gEnemyParty
_08019FCC: .4byte gBattlerTarget
_08019FD0: .4byte gBattlersCount
_08019FD4: .4byte gPlayerParty
_08019FD8:
	ldr r1, _0801A038 @ =gBattlerPartyIndexes
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0801A03C @ =gEnemyParty
_08019FE8:
	adds r5, r1, r0
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x14]
	ldr r0, _0801A040 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0801A02A
	bl _0801BBC6
_0801A02A:
	mov r3, r8
	cmp r3, 0
	beq _0801A048
	ldr r0, _0801A044 @ =gLastUsedAbility
	strb r3, [r0]
	mov r8, r0
	b _0801A05E
	.align 2, 0
_0801A038: .4byte gBattlerPartyIndexes
_0801A03C: .4byte gEnemyParty
_0801A040: .4byte gBattleTypeFlags
_0801A044: .4byte gLastUsedAbility
_0801A048:
	ldr r2, _0801A078 @ =gLastUsedAbility
	ldr r1, _0801A07C @ =gBattleMons
	movs r0, 0x58
	mov r3, r10
	muls r3, r0
	adds r0, r3, 0
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r2]
	mov r8, r2
_0801A05E:
	cmp r4, 0
	bne _0801A066
	ldr r0, _0801A080 @ =gCurrentMove
	ldrh r4, [r0]
_0801A066:
	ldr r1, _0801A084 @ =gBattleStruct
	ldr r0, [r1]
	ldrb r0, [r0, 0x13]
	adds r6, r1, 0
	cmp r0, 0
	beq _0801A088
	movs r5, 0x3F
	ands r5, r0
	b _0801A094
	.align 2, 0
_0801A078: .4byte gLastUsedAbility
_0801A07C: .4byte gBattleMons
_0801A080: .4byte gCurrentMove
_0801A084: .4byte gBattleStruct
_0801A088:
	ldr r1, _0801A0D0 @ =gBattleMoves
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r5, [r0, 0x2]
_0801A094:
	ldr r0, _0801A0D4 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0xA0
	lsls r1, 8
	ands r0, r1
	movs r1, 0x80
	lsls r1, 8
	cmp r0, r1
	bne _0801A0BA
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, 0x16
	bne _0801A0B2
	bl _0801BBC6
_0801A0B2:
	cmp r0, 0x24
	bne _0801A0BA
	bl _0801BBC6
_0801A0BA:
	ldr r2, [sp, 0x4]
	cmp r2, 0x13
	bls _0801A0C4
	bl _0801BBAA
_0801A0C4:
	lsls r0, r2, 2
	ldr r1, _0801A0D8 @ =_0801A0DC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801A0D0: .4byte gBattleMoves
_0801A0D4: .4byte gBattleTypeFlags
_0801A0D8: .4byte _0801A0DC
	.align 2, 0
_0801A0DC:
	.4byte _0801A12C
	.4byte _0801A3E0
	.4byte _0801A600
	.4byte _0801A698
	.4byte _0801A8B8
	.4byte _0801B010
	.4byte _0801B374
	.4byte _0801B3C8
	.4byte _0801B450
	.4byte _0801B4D4
	.4byte _0801B6FC
	.4byte _0801B518
	.4byte _0801B740
	.4byte _0801B79C
	.4byte _0801B7F8
	.4byte _0801B90C
	.4byte _0801B9A8
	.4byte _0801BA04
	.4byte _0801BB78
	.4byte _0801B8B4
_0801A12C:
	ldr r2, _0801A160 @ =sBattler_AI
	ldr r0, _0801A164 @ =gBattlersCount
	ldrb r1, [r2]
	adds r3, r0, 0
	ldrb r4, [r3]
	cmp r1, r4
	bcc _0801A13E
	mov r0, r10
	strb r0, [r2]
_0801A13E:
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, 0x2D
	bne _0801A148
	b _0801A2AC
_0801A148:
	cmp r0, 0x2D
	bgt _0801A178
	cmp r0, 0xD
	bne _0801A152
	b _0801A3A8
_0801A152:
	cmp r0, 0xD
	bgt _0801A168
	cmp r0, 0x2
	bne _0801A15C
	b _0801A27C
_0801A15C:
	bl _0801BBAA
	.align 2, 0
_0801A160: .4byte sBattler_AI
_0801A164: .4byte gBattlersCount
_0801A168:
	cmp r0, 0x16
	bne _0801A16E
	b _0801A30C
_0801A16E:
	cmp r0, 0x24
	bne _0801A174
	b _0801A36C
_0801A174:
	bl _0801BBAA
_0801A178:
	cmp r0, 0x46
	bne _0801A17E
	b _0801A2DC
_0801A17E:
	cmp r0, 0x46
	bgt _0801A18C
	cmp r0, 0x3B
	bne _0801A188
	b _0801A340
_0801A188:
	bl _0801BBAA
_0801A18C:
	cmp r0, 0x4D
	bne _0801A192
	b _0801A3A8
_0801A192:
	cmp r0, 0xFF
	beq _0801A19A
	bl _0801BBAA
_0801A19A:
	bl weather_get_current
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x3
	cmp r0, 0xA
	bhi _0801A250
	lsls r0, 2
	ldr r1, _0801A1B4 @ =_0801A1B8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801A1B4: .4byte _0801A1B8
	.align 2, 0
_0801A1B8:
	.4byte _0801A1E4
	.4byte _0801A250
	.4byte _0801A1E4
	.4byte _0801A250
	.4byte _0801A250
	.4byte _0801A208
	.4byte _0801A250
	.4byte _0801A250
	.4byte _0801A250
	.4byte _0801A22C
	.4byte _0801A1E4
_0801A1E4:
	ldr r2, _0801A200 @ =gBattleWeather
	ldrh r1, [r2]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801A250
	movs r0, 0x5
	strh r0, [r2]
	ldr r1, _0801A204 @ =gBattleScripting
	movs r0, 0xA
	strb r0, [r1, 0x10]
	mov r2, r10
	strb r2, [r1, 0x17]
	b _0801A246
	.align 2, 0
_0801A200: .4byte gBattleWeather
_0801A204: .4byte gBattleScripting
_0801A208:
	ldr r3, _0801A224 @ =gBattleWeather
	ldrh r1, [r3]
	movs r2, 0x18
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0801A250
	strh r2, [r3]
	ldr r1, _0801A228 @ =gBattleScripting
	movs r0, 0xC
	strb r0, [r1, 0x10]
	mov r3, r10
	strb r3, [r1, 0x17]
	b _0801A246
	.align 2, 0
_0801A224: .4byte gBattleWeather
_0801A228: .4byte gBattleScripting
_0801A22C:
	ldr r3, _0801A26C @ =gBattleWeather
	ldrh r1, [r3]
	movs r2, 0x60
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0801A250
	strh r2, [r3]
	ldr r1, _0801A270 @ =gBattleScripting
	movs r0, 0xB
	strb r0, [r1, 0x10]
	mov r4, r10
	strb r4, [r1, 0x17]
_0801A246:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0801A250:
	mov r0, r9
	cmp r0, 0
	bne _0801A25A
	bl _0801BBC6
_0801A25A:
	bl weather_get_current
	ldr r1, _0801A274 @ =gUnknown_2023E82
	strb r0, [r1, 0x5]
	ldr r0, _0801A278 @ =gUnknown_81D8B1F
	bl BattleScriptPushCursorAndCallback
	bl _0801BBAA
	.align 2, 0
_0801A26C: .4byte gBattleWeather
_0801A270: .4byte gBattleScripting
_0801A274: .4byte gUnknown_2023E82
_0801A278: .4byte gUnknown_81D8B1F
_0801A27C:
	ldr r2, _0801A2A0 @ =gBattleWeather
	ldrh r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0801A28C
	bl _0801BBAA
_0801A28C:
	movs r0, 0x5
	strh r0, [r2]
	ldr r0, _0801A2A4 @ =gUnknown_81D927F
	bl BattleScriptPushCursorAndCallback
	ldr r0, _0801A2A8 @ =gBattleScripting
	mov r1, r10
	strb r1, [r0, 0x17]
	bl _0801BB5A
	.align 2, 0
_0801A2A0: .4byte gBattleWeather
_0801A2A4: .4byte gUnknown_81D927F
_0801A2A8: .4byte gBattleScripting
_0801A2AC:
	ldr r2, _0801A2D0 @ =gBattleWeather
	ldrh r1, [r2]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0801A2BC
	bl _0801BBAA
_0801A2BC:
	movs r0, 0x18
	strh r0, [r2]
	ldr r0, _0801A2D4 @ =gUnknown_81D92BF
	bl BattleScriptPushCursorAndCallback
	ldr r0, _0801A2D8 @ =gBattleScripting
	mov r2, r10
	strb r2, [r0, 0x17]
	bl _0801BB5A
	.align 2, 0
_0801A2D0: .4byte gBattleWeather
_0801A2D4: .4byte gUnknown_81D92BF
_0801A2D8: .4byte gBattleScripting
_0801A2DC:
	ldr r2, _0801A300 @ =gBattleWeather
	ldrh r1, [r2]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0801A2EC
	bl _0801BBAA
_0801A2EC:
	movs r0, 0x60
	strh r0, [r2]
	ldr r0, _0801A304 @ =gUnknown_81D9379
	bl BattleScriptPushCursorAndCallback
	ldr r0, _0801A308 @ =gBattleScripting
	mov r3, r10
	strb r3, [r0, 0x17]
	bl _0801BB5A
	.align 2, 0
_0801A300: .4byte gBattleWeather
_0801A304: .4byte gUnknown_81D9379
_0801A308: .4byte gBattleScripting
_0801A30C:
	ldr r0, _0801A338 @ =gUnknown_2023ECC
	mov r4, r10
	lsls r2, r4, 2
	adds r1, r2, r4
	lsls r1, 2
	adds r3, r1, r0
	ldrb r0, [r3]
	lsls r0, 28
	cmp r0, 0
	bge _0801A324
	bl _0801BBAA
_0801A324:
	ldr r1, _0801A33C @ =gStatuses3
	adds r1, r2, r1
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 12
	orrs r0, r2
	str r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x8
	b _0801A396
	.align 2, 0
_0801A338: .4byte gUnknown_2023ECC
_0801A33C: .4byte gStatuses3
_0801A340:
	mov r0, r10
	bl sub_8019DAC
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	cmp r0, 0
	bne _0801A354
	bl _0801BBC6
_0801A354:
	ldr r0, _0801A364 @ =gUnknown_81D92F8
	bl BattleScriptPushCursorAndCallback
	ldr r0, _0801A368 @ =gBattleScripting
	mov r1, r10
	strb r1, [r0, 0x17]
	bl _0801BA6A
	.align 2, 0
_0801A364: .4byte gUnknown_81D92F8
_0801A368: .4byte gBattleScripting
_0801A36C:
	ldr r0, _0801A3A0 @ =gUnknown_2023ECC
	mov r3, r10
	lsls r2, r3, 2
	adds r1, r2, r3
	lsls r1, 2
	adds r3, r1, r0
	ldrb r0, [r3]
	lsls r0, 27
	cmp r0, 0
	bge _0801A384
	bl _0801BBAA
_0801A384:
	ldr r1, _0801A3A4 @ =gStatuses3
	adds r1, r2, r1
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 13
	orrs r0, r2
	str r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x10
_0801A396:
	orrs r0, r1
	strb r0, [r3]
	bl _0801BBAA
	.align 2, 0
_0801A3A0: .4byte gUnknown_2023ECC
_0801A3A4: .4byte gStatuses3
_0801A3A8:
	movs r4, 0
	ldrb r3, [r3]
	cmp r4, r3
	bcc _0801A3B4
	bl _0801BBAA
_0801A3B4:
	adds r0, r4, 0
	bl sub_8019DAC
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	cmp r0, 0
	beq _0801A3C8
	bl _0801BA60
_0801A3C8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0801A3DC @ =gBattlersCount
	ldrb r0, [r0]
	cmp r4, r0
	bcc _0801A3B4
	bl _0801BBAA
	.align 2, 0
_0801A3DC: .4byte gBattlersCount
_0801A3E0:
	ldr r7, _0801A410 @ =gBattleMons
	movs r0, 0x58
	mov r6, r10
	muls r6, r0
	adds r4, r6, r7
	ldrh r0, [r4, 0x28]
	cmp r0, 0
	bne _0801A3F4
	bl _0801BBAA
_0801A3F4:
	ldr r0, _0801A414 @ =sBattler_AI
	mov r1, r10
	strb r1, [r0]
	mov r2, r8
	ldrb r5, [r2]
	cmp r5, 0x2C
	beq _0801A426
	cmp r5, 0x2C
	bgt _0801A418
	cmp r5, 0x3
	bne _0801A40C
	b _0801A58C
_0801A40C:
	bl _0801BBAA
	.align 2, 0
_0801A410: .4byte gBattleMons
_0801A414: .4byte sBattler_AI
_0801A418:
	cmp r5, 0x36
	bne _0801A41E
	b _0801A5D8
_0801A41E:
	cmp r5, 0x3D
	beq _0801A4A8
	bl _0801BBAA
_0801A426:
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
	beq _0801A442
	bl _0801BBAA
_0801A442:
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	beq _0801A45A
	bl _0801BBAA
_0801A45A:
	ldr r0, _0801A49C @ =gBattleWeather
	ldrh r1, [r0]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801A46A
	bl _0801BBAA
_0801A46A:
	ldrh r0, [r4, 0x2C]
	ldrh r3, [r4, 0x28]
	cmp r0, r3
	bhi _0801A476
	bl _0801BBAA
_0801A476:
	mov r0, r8
	strb r5, [r0]
	ldr r0, _0801A4A0 @ =gUnknown_81D92AB
	bl BattleScriptPushCursorAndCallback
	ldr r1, _0801A4A4 @ =gBattleMoveDamage
	ldrh r0, [r4, 0x2C]
	lsrs r0, 4
	str r0, [r1]
	cmp r0, 0
	bne _0801A490
	movs r0, 0x1
	str r0, [r1]
_0801A490:
	ldr r0, [r1]
	negs r0, r0
	str r0, [r1]
	bl _0801BB5A
	.align 2, 0
_0801A49C: .4byte gBattleWeather
_0801A4A0: .4byte gUnknown_81D92AB
_0801A4A4: .4byte gBattleMoveDamage
_0801A4A8:
	adds r0, r7, 0
	adds r0, 0x4C
	adds r5, r6, r0
	ldrb r0, [r5]
	cmp r0, 0
	bne _0801A4B8
	bl _0801BBAA
_0801A4B8:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _0801A4D2
	bl _0801BBAA
_0801A4D2:
	ldr r0, [r5]
	movs r1, 0x88
	ands r0, r1
	cmp r0, 0
	beq _0801A4E4
	ldr r0, _0801A564 @ =gBattleTextBuff1
	ldr r1, _0801A568 @ =gUnknown_8250094
	bl StringCopy
_0801A4E4:
	ldr r0, [r5]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _0801A4F6
	ldr r0, _0801A564 @ =gBattleTextBuff1
	ldr r1, _0801A56C @ =gUnknown_825009C
	bl StringCopy
_0801A4F6:
	ldr r0, [r5]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0801A508
	ldr r0, _0801A564 @ =gBattleTextBuff1
	ldr r1, _0801A570 @ =gUnknown_82500A4
	bl StringCopy
_0801A508:
	ldr r0, [r5]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0801A51A
	ldr r0, _0801A564 @ =gBattleTextBuff1
	ldr r1, _0801A574 @ =gUnknown_82500AC
	bl StringCopy
_0801A51A:
	ldr r0, [r5]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0801A52C
	ldr r0, _0801A564 @ =gBattleTextBuff1
	ldr r1, _0801A578 @ =gUnknown_82500B4
	bl StringCopy
_0801A52C:
	str r4, [r5]
	adds r1, r7, 0
	adds r1, 0x50
	adds r1, r6, r1
	ldr r0, [r1]
	ldr r2, _0801A57C @ =0xf7ffffff
	ands r0, r2
	str r0, [r1]
	ldr r0, _0801A580 @ =gBattleScripting
	ldr r4, _0801A584 @ =gActiveBattler
	mov r1, r10
	strb r1, [r4]
	strb r1, [r0, 0x17]
	ldr r0, _0801A588 @ =gUnknown_81D92D3
	bl BattleScriptPushCursorAndCallback
	str r5, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl EmitSetMonData
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	bl _0801BB5A
	.align 2, 0
_0801A564: .4byte gBattleTextBuff1
_0801A568: .4byte gUnknown_8250094
_0801A56C: .4byte gUnknown_825009C
_0801A570: .4byte gUnknown_82500A4
_0801A574: .4byte gUnknown_82500AC
_0801A578: .4byte gUnknown_82500B4
_0801A57C: .4byte 0xf7ffffff
_0801A580: .4byte gBattleScripting
_0801A584: .4byte gActiveBattler
_0801A588: .4byte gUnknown_81D92D3
_0801A58C:
	ldrb r2, [r4, 0x1B]
	movs r0, 0x1B
	ldrsb r0, [r4, r0]
	cmp r0, 0xB
	ble _0801A59A
	bl _0801BBAA
_0801A59A:
	ldr r0, _0801A5CC @ =gDisableStructs
	mov r3, r10
	lsls r1, r3, 3
	subs r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x16]
	cmp r0, 0x2
	bne _0801A5B0
	bl _0801BBAA
_0801A5B0:
	adds r0, r2, 0x1
	movs r1, 0
	strb r0, [r4, 0x1B]
	ldr r4, _0801A5D0 @ =gBattleScripting
	movs r0, 0x11
	strb r0, [r4, 0x10]
	strb r1, [r4, 0x11]
	ldr r0, _0801A5D4 @ =gUnknown_81D9293
	bl BattleScriptPushCursorAndCallback
	mov r0, r10
	strb r0, [r4, 0x17]
	bl _0801BB5A
	.align 2, 0
_0801A5CC: .4byte gDisableStructs
_0801A5D0: .4byte gBattleScripting
_0801A5D4: .4byte gUnknown_81D9293
_0801A5D8:
	ldr r2, _0801A5FC @ =gDisableStructs
	ldrb r0, [r0]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r3, [r1, 0x18]
	lsls r0, r3, 31
	lsrs r0, 31
	movs r2, 0x1
	eors r2, r0
	movs r0, 0x2
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x18]
	bl _0801BBAA
	.align 2, 0
_0801A5FC: .4byte gDisableStructs
_0801A600:
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, 0x2B
	beq _0801A60C
	bl _0801BBAA
_0801A60C:
	movs r5, 0
	ldr r0, _0801A67C @ =gUnknown_8250104
	ldrh r2, [r0]
	ldr r3, _0801A680 @ =0x0000ffff
	adds r1, r0, 0
	cmp r2, r3
	bne _0801A61E
	bl _0801BBAA
_0801A61E:
	cmp r2, r4
	beq _0801A636
	adds r2, r1, 0
_0801A624:
	adds r2, 0x2
	adds r5, 0x1
	ldrh r0, [r2]
	cmp r0, r3
	bne _0801A632
	bl _0801BBAA
_0801A632:
	cmp r0, r4
	bne _0801A624
_0801A636:
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _0801A680 @ =0x0000ffff
	cmp r1, r0
	bne _0801A646
	bl _0801BBAA
_0801A646:
	ldr r1, _0801A684 @ =gBattleMons
	ldr r0, _0801A688 @ =sBattler_AI
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
	beq _0801A66C
	ldr r0, _0801A68C @ =gUnknown_2023DD0
	ldr r1, [r0]
	movs r2, 0x80
	lsls r2, 4
	orrs r1, r2
	str r1, [r0]
_0801A66C:
	ldr r1, _0801A690 @ =gUnknown_2023D74
	ldr r0, _0801A694 @ =gUnknown_81D946E
	str r0, [r1]
	movs r2, 0x1
	mov r9, r2
	bl _0801BBB0
	.align 2, 0
_0801A67C: .4byte gUnknown_8250104
_0801A680: .4byte 0x0000ffff
_0801A684: .4byte gBattleMons
_0801A688: .4byte sBattler_AI
_0801A68C: .4byte gUnknown_2023DD0
_0801A690: .4byte gUnknown_2023D74
_0801A694: .4byte gUnknown_81D946E
_0801A698:
	cmp r4, 0
	bne _0801A6A0
	bl _0801BBAA
_0801A6A0:
	mov r3, r8
	ldrb r0, [r3]
	cmp r0, 0xB
	beq _0801A710
	cmp r0, 0xB
	bgt _0801A6B2
	cmp r0, 0xA
	beq _0801A6B8
	b _0801A832
_0801A6B2:
	cmp r0, 0x12
	beq _0801A768
	b _0801A832
_0801A6B8:
	cmp r5, 0xD
	beq _0801A6BE
	b _0801A832
_0801A6BE:
	ldr r0, _0801A6E8 @ =gBattleMoves
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _0801A6D0
	b _0801A832
_0801A6D0:
	ldr r1, _0801A6EC @ =gUnknown_2023E8C
	ldr r0, _0801A6F0 @ =sBattler_AI
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	lsls r0, 28
	cmp r0, 0
	bge _0801A6FC
	ldr r1, _0801A6F4 @ =gUnknown_2023D74
	ldr r0, _0801A6F8 @ =gUnknown_81D93BE
	b _0801A700
	.align 2, 0
_0801A6E8: .4byte gBattleMoves
_0801A6EC: .4byte gUnknown_2023E8C
_0801A6F0: .4byte sBattler_AI
_0801A6F4: .4byte gUnknown_2023D74
_0801A6F8: .4byte gUnknown_81D93BE
_0801A6FC:
	ldr r1, _0801A708 @ =gUnknown_2023D74
	ldr r0, _0801A70C @ =gUnknown_81D93BD
_0801A700:
	str r0, [r1]
	movs r4, 0x1
	mov r9, r4
	b _0801A832
	.align 2, 0
_0801A708: .4byte gUnknown_2023D74
_0801A70C: .4byte gUnknown_81D93BD
_0801A710:
	cmp r5, 0xB
	beq _0801A716
	b _0801A832
_0801A716:
	ldr r0, _0801A740 @ =gBattleMoves
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _0801A728
	b _0801A832
_0801A728:
	ldr r1, _0801A744 @ =gUnknown_2023E8C
	ldr r0, _0801A748 @ =sBattler_AI
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	lsls r0, 28
	cmp r0, 0
	bge _0801A754
	ldr r1, _0801A74C @ =gUnknown_2023D74
	ldr r0, _0801A750 @ =gUnknown_81D93BE
	b _0801A758
	.align 2, 0
_0801A740: .4byte gBattleMoves
_0801A744: .4byte gUnknown_2023E8C
_0801A748: .4byte sBattler_AI
_0801A74C: .4byte gUnknown_2023D74
_0801A750: .4byte gUnknown_81D93BE
_0801A754:
	ldr r1, _0801A760 @ =gUnknown_2023D74
	ldr r0, _0801A764 @ =gUnknown_81D93BD
_0801A758:
	str r0, [r1]
	movs r0, 0x1
	b _0801A830
	.align 2, 0
_0801A760: .4byte gUnknown_2023D74
_0801A764: .4byte gUnknown_81D93BD
_0801A768:
	cmp r5, 0xA
	bne _0801A832
	ldr r1, _0801A7B8 @ =gBattleMons
	movs r0, 0x58
	mov r2, r10
	muls r2, r0
	adds r0, r2, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0801A832
	ldr r2, _0801A7BC @ =gBattleResources
	ldr r0, [r2]
	ldr r0, [r0, 0x4]
	mov r3, r10
	lsls r1, r3, 2
	adds r0, r1
	ldr r3, [r0]
	movs r4, 0x1
	ands r3, r4
	adds r5, r1, 0
	cmp r3, 0
	bne _0801A7F8
	ldr r0, _0801A7C0 @ =gUnknown_2023E82
	strb r3, [r0, 0x5]
	ldr r1, _0801A7C4 @ =gUnknown_2023E8C
	ldr r0, _0801A7C8 @ =sBattler_AI
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	lsls r0, 28
	cmp r0, 0
	bge _0801A7D4
	ldr r1, _0801A7CC @ =gUnknown_2023D74
	ldr r0, _0801A7D0 @ =gUnknown_81D93F7
	b _0801A7D8
	.align 2, 0
_0801A7B8: .4byte gBattleMons
_0801A7BC: .4byte gBattleResources
_0801A7C0: .4byte gUnknown_2023E82
_0801A7C4: .4byte gUnknown_2023E8C
_0801A7C8: .4byte sBattler_AI
_0801A7CC: .4byte gUnknown_2023D74
_0801A7D0: .4byte gUnknown_81D93F7
_0801A7D4:
	ldr r1, _0801A7F0 @ =gUnknown_2023D74
	ldr r0, _0801A7F4 @ =gUnknown_81D93F6
_0801A7D8:
	str r0, [r1]
	ldr r0, [r2]
	ldr r1, [r0, 0x4]
	adds r1, r5
	ldr r0, [r1]
	movs r2, 0x1
	orrs r0, r2
	str r0, [r1]
	movs r4, 0x2
	mov r9, r4
	b _0801A832
	.align 2, 0
_0801A7F0: .4byte gUnknown_2023D74
_0801A7F4: .4byte gUnknown_81D93F6
_0801A7F8:
	ldr r0, _0801A814 @ =gUnknown_2023E82
	strb r4, [r0, 0x5]
	ldr r1, _0801A818 @ =gUnknown_2023E8C
	ldr r0, _0801A81C @ =sBattler_AI
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	lsls r0, 28
	cmp r0, 0
	bge _0801A828
	ldr r1, _0801A820 @ =gUnknown_2023D74
	ldr r0, _0801A824 @ =gUnknown_81D93F7
	b _0801A82C
	.align 2, 0
_0801A814: .4byte gUnknown_2023E82
_0801A818: .4byte gUnknown_2023E8C
_0801A81C: .4byte sBattler_AI
_0801A820: .4byte gUnknown_2023D74
_0801A824: .4byte gUnknown_81D93F7
_0801A828:
	ldr r1, _0801A86C @ =gUnknown_2023D74
	ldr r0, _0801A870 @ =gUnknown_81D93F6
_0801A82C:
	str r0, [r1]
	movs r0, 0x2
_0801A830:
	mov r9, r0
_0801A832:
	mov r1, r9
	cmp r1, 0x1
	beq _0801A83C
	bl _0801BBAA
_0801A83C:
	ldr r1, _0801A874 @ =gBattleMons
	movs r0, 0x58
	mov r2, r10
	muls r2, r0
	adds r0, r2, 0
	adds r1, r0, r1
	ldrh r0, [r1, 0x2C]
	ldrh r3, [r1, 0x28]
	cmp r0, r3
	bne _0801A898
	ldr r1, _0801A878 @ =gUnknown_2023E8C
	ldr r0, _0801A87C @ =sBattler_AI
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	lsls r0, 28
	cmp r0, 0
	bge _0801A884
	ldr r1, _0801A86C @ =gUnknown_2023D74
	ldr r0, _0801A880 @ =gUnknown_81D93E1
	str r0, [r1]
	bl _0801BBAA
	.align 2, 0
_0801A86C: .4byte gUnknown_2023D74
_0801A870: .4byte gUnknown_81D93F6
_0801A874: .4byte gBattleMons
_0801A878: .4byte gUnknown_2023E8C
_0801A87C: .4byte sBattler_AI
_0801A880: .4byte gUnknown_81D93E1
_0801A884:
	ldr r1, _0801A890 @ =gUnknown_2023D74
	ldr r0, _0801A894 @ =gUnknown_81D93E0
	str r0, [r1]
	bl _0801BBAA
	.align 2, 0
_0801A890: .4byte gUnknown_2023D74
_0801A894: .4byte gUnknown_81D93E0
_0801A898:
	ldr r2, _0801A8B4 @ =gBattleMoveDamage
	ldrh r0, [r1, 0x2C]
	lsrs r0, 2
	str r0, [r2]
	cmp r0, 0
	bne _0801A8A8
	mov r4, r9
	str r4, [r2]
_0801A8A8:
	ldr r0, [r2]
	negs r0, r0
	str r0, [r2]
	bl _0801BBAA
	.align 2, 0
_0801A8B4: .4byte gBattleMoveDamage
_0801A8B8:
	mov r1, r8
	ldrb r0, [r1]
	subs r0, 0x9
	cmp r0, 0x2F
	bls _0801A8C6
	bl _0801BBAA
_0801A8C6:
	lsls r0, 2
	ldr r1, _0801A8D0 @ =_0801A8D4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801A8D0: .4byte _0801A8D4
	.align 2, 0
_0801A8D4:
	.4byte _0801ACF0
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801A994
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801AA5C
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801AB1C
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801AC14
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801ADCC
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801BBAA
	.4byte _0801AEA8
_0801A994:
	ldr r0, _0801AA3C @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0801A9A4
	bl _0801BBAA
_0801A9A4:
	cmp r4, 0xA5
	bne _0801A9AC
	bl _0801BBAA
_0801A9AC:
	ldr r0, _0801AA40 @ =gBattleMoves
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _0801A9C0
	bl _0801BBAA
_0801A9C0:
	ldr r2, _0801AA44 @ =gUnknown_2023ECC
	ldr r0, _0801AA48 @ =gBattlerTarget
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801A9E8
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801A9E8
	bl _0801BBAA
_0801A9E8:
	ldr r1, _0801AA4C @ =gBattleMons
	movs r0, 0x58
	mov r2, r10
	muls r2, r0
	adds r0, r2, 0
	adds r1, r0, r1
	adds r3, r1, 0
	adds r3, 0x21
	ldrb r0, [r3]
	cmp r0, r5
	bne _0801AA02
	bl _0801BBAA
_0801AA02:
	adds r2, r1, 0
	adds r2, 0x22
	ldrb r0, [r2]
	cmp r0, r5
	bne _0801AA10
	bl _0801BBAA
_0801AA10:
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	bne _0801AA1A
	bl _0801BBAA
_0801AA1A:
	strb r5, [r3]
	strb r5, [r2]
	ldr r1, _0801AA50 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x3
	strb r0, [r1, 0x1]
	strb r5, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	bl BattleScriptPushCursor
	ldr r1, _0801AA54 @ =gUnknown_2023D74
	ldr r0, _0801AA58 @ =gUnknown_81D949C
	str r0, [r1]
	bl _0801BB5A
	.align 2, 0
_0801AA3C: .4byte gMoveResultFlags
_0801AA40: .4byte gBattleMoves
_0801AA44: .4byte gUnknown_2023ECC
_0801AA48: .4byte gBattlerTarget
_0801AA4C: .4byte gBattleMons
_0801AA50: .4byte gBattleTextBuff1
_0801AA54: .4byte gUnknown_2023D74
_0801AA58: .4byte gUnknown_81D949C
_0801AA5C:
	ldr r0, _0801AAF4 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0801AA6C
	bl _0801BBAA
_0801AA6C:
	ldr r1, _0801AAF8 @ =gBattleMons
	ldr r0, _0801AAFC @ =sBattler_AI
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r3, r0, r1
	ldrh r0, [r3, 0x28]
	cmp r0, 0
	bne _0801AA82
	bl _0801BBAA
_0801AA82:
	ldr r0, _0801AB00 @ =gUnknown_2023E8C
	lsls r1, r2, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 31
	cmp r0, 0
	beq _0801AA94
	bl _0801BBAA
_0801AA94:
	ldr r2, _0801AB04 @ =gUnknown_2023ECC
	ldr r0, _0801AB08 @ =gBattlerTarget
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801AABC
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801AABC
	bl _0801BBAA
_0801AABC:
	ldr r1, _0801AB0C @ =gBattleMoves
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0801AAD6
	bl _0801BBAA
_0801AAD6:
	ldr r1, _0801AB10 @ =gBattleMoveDamage
	ldrh r0, [r3, 0x2C]
	lsrs r0, 4
	str r0, [r1]
	cmp r0, 0
	bne _0801AAE4
	str r2, [r1]
_0801AAE4:
	bl BattleScriptPushCursor
	ldr r1, _0801AB14 @ =gUnknown_2023D74
	ldr r0, _0801AB18 @ =gUnknown_81D94A3
	str r0, [r1]
	bl _0801BB5A
	.align 2, 0
_0801AAF4: .4byte gMoveResultFlags
_0801AAF8: .4byte gBattleMons
_0801AAFC: .4byte sBattler_AI
_0801AB00: .4byte gUnknown_2023E8C
_0801AB04: .4byte gUnknown_2023ECC
_0801AB08: .4byte gBattlerTarget
_0801AB0C: .4byte gBattleMoves
_0801AB10: .4byte gBattleMoveDamage
_0801AB14: .4byte gUnknown_2023D74
_0801AB18: .4byte gUnknown_81D94A3
_0801AB1C:
	ldr r0, _0801ABE8 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0801AB2C
	bl _0801BBAA
_0801AB2C:
	ldr r1, _0801ABEC @ =gBattleMons
	ldr r0, _0801ABF0 @ =sBattler_AI
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _0801AB42
	bl _0801BBAA
_0801AB42:
	ldr r0, _0801ABF4 @ =gUnknown_2023E8C
	lsls r1, r2, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 31
	cmp r0, 0
	beq _0801AB54
	bl _0801BBAA
_0801AB54:
	ldr r2, _0801ABF8 @ =gUnknown_2023ECC
	ldr r0, _0801ABFC @ =gBattlerTarget
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801AB7C
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801AB7C
	bl _0801BBAA
_0801AB7C:
	ldr r1, _0801AC00 @ =gBattleMoves
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0801AB94
	bl _0801BBAA
_0801AB94:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	beq _0801ABAC
	bl _0801BBAA
_0801ABAC:
	ldr r5, _0801AC04 @ =gUnknown_2023E82
	movs r4, 0x3
_0801ABB0:
	bl Random
	ands r0, r4
	strb r0, [r5, 0x3]
	cmp r0, 0
	beq _0801ABB0
	ldr r1, _0801AC04 @ =gUnknown_2023E82
	ldrb r0, [r1, 0x3]
	cmp r0, 0x3
	bne _0801ABC8
	adds r0, 0x2
	strb r0, [r1, 0x3]
_0801ABC8:
	ldrb r0, [r1, 0x3]
	adds r0, 0x40
	strb r0, [r1, 0x3]
	bl BattleScriptPushCursor
	ldr r1, _0801AC08 @ =gUnknown_2023D74
	ldr r0, _0801AC0C @ =gUnknown_81D94CB
	str r0, [r1]
	ldr r2, _0801AC10 @ =gUnknown_2023DD0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 6
	orrs r0, r1
	str r0, [r2]
	bl _0801BB5A
	.align 2, 0
_0801ABE8: .4byte gMoveResultFlags
_0801ABEC: .4byte gBattleMons
_0801ABF0: .4byte sBattler_AI
_0801ABF4: .4byte gUnknown_2023E8C
_0801ABF8: .4byte gUnknown_2023ECC
_0801ABFC: .4byte gBattlerTarget
_0801AC00: .4byte gBattleMoves
_0801AC04: .4byte gUnknown_2023E82
_0801AC08: .4byte gUnknown_2023D74
_0801AC0C: .4byte gUnknown_81D94CB
_0801AC10: .4byte gUnknown_2023DD0
_0801AC14:
	ldr r0, _0801ACC4 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0801AC24
	bl _0801BBAA
_0801AC24:
	ldr r1, _0801ACC8 @ =gBattleMons
	ldr r0, _0801ACCC @ =sBattler_AI
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _0801AC3A
	bl _0801BBAA
_0801AC3A:
	ldr r0, _0801ACD0 @ =gUnknown_2023E8C
	lsls r1, r2, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 31
	cmp r0, 0
	beq _0801AC4C
	bl _0801BBAA
_0801AC4C:
	ldr r2, _0801ACD4 @ =gUnknown_2023ECC
	ldr r0, _0801ACD8 @ =gBattlerTarget
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801AC74
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801AC74
	bl _0801BBAA
_0801AC74:
	ldr r1, _0801ACDC @ =gBattleMoves
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0801AC8C
	bl _0801BBAA
_0801AC8C:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	beq _0801ACA4
	bl _0801BBAA
_0801ACA4:
	ldr r1, _0801ACE0 @ =gUnknown_2023E82
	movs r0, 0x42
	strb r0, [r1, 0x3]
	bl BattleScriptPushCursor
	ldr r1, _0801ACE4 @ =gUnknown_2023D74
	ldr r0, _0801ACE8 @ =gUnknown_81D94CB
	str r0, [r1]
	ldr r2, _0801ACEC @ =gUnknown_2023DD0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 6
	orrs r0, r1
	str r0, [r2]
	bl _0801BB5A
	.align 2, 0
_0801ACC4: .4byte gMoveResultFlags
_0801ACC8: .4byte gBattleMons
_0801ACCC: .4byte sBattler_AI
_0801ACD0: .4byte gUnknown_2023E8C
_0801ACD4: .4byte gUnknown_2023ECC
_0801ACD8: .4byte gBattlerTarget
_0801ACDC: .4byte gBattleMoves
_0801ACE0: .4byte gUnknown_2023E82
_0801ACE4: .4byte gUnknown_2023D74
_0801ACE8: .4byte gUnknown_81D94CB
_0801ACEC: .4byte gUnknown_2023DD0
_0801ACF0:
	ldr r0, _0801ADA0 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0801AD00
	bl _0801BBAA
_0801AD00:
	ldr r1, _0801ADA4 @ =gBattleMons
	ldr r0, _0801ADA8 @ =sBattler_AI
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _0801AD16
	bl _0801BBAA
_0801AD16:
	ldr r0, _0801ADAC @ =gUnknown_2023E8C
	lsls r1, r2, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 31
	cmp r0, 0
	beq _0801AD28
	bl _0801BBAA
_0801AD28:
	ldr r2, _0801ADB0 @ =gUnknown_2023ECC
	ldr r0, _0801ADB4 @ =gBattlerTarget
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801AD50
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801AD50
	bl _0801BBAA
_0801AD50:
	ldr r1, _0801ADB8 @ =gBattleMoves
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0801AD68
	bl _0801BBAA
_0801AD68:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	beq _0801AD80
	bl _0801BBAA
_0801AD80:
	ldr r1, _0801ADBC @ =gUnknown_2023E82
	movs r0, 0x45
	strb r0, [r1, 0x3]
	bl BattleScriptPushCursor
	ldr r1, _0801ADC0 @ =gUnknown_2023D74
	ldr r0, _0801ADC4 @ =gUnknown_81D94CB
	str r0, [r1]
	ldr r2, _0801ADC8 @ =gUnknown_2023DD0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 6
	orrs r0, r1
	str r0, [r2]
	bl _0801BB5A
	.align 2, 0
_0801ADA0: .4byte gMoveResultFlags
_0801ADA4: .4byte gBattleMons
_0801ADA8: .4byte sBattler_AI
_0801ADAC: .4byte gUnknown_2023E8C
_0801ADB0: .4byte gUnknown_2023ECC
_0801ADB4: .4byte gBattlerTarget
_0801ADB8: .4byte gBattleMoves
_0801ADBC: .4byte gUnknown_2023E82
_0801ADC0: .4byte gUnknown_2023D74
_0801ADC4: .4byte gUnknown_81D94CB
_0801ADC8: .4byte gUnknown_2023DD0
_0801ADCC:
	ldr r0, _0801AE7C @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0801ADDC
	bl _0801BBAA
_0801ADDC:
	ldr r1, _0801AE80 @ =gBattleMons
	ldr r0, _0801AE84 @ =sBattler_AI
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _0801ADF2
	bl _0801BBAA
_0801ADF2:
	ldr r0, _0801AE88 @ =gUnknown_2023E8C
	lsls r1, r2, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 31
	cmp r0, 0
	beq _0801AE04
	bl _0801BBAA
_0801AE04:
	ldr r1, _0801AE8C @ =gBattleMoves
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0801AE1C
	bl _0801BBAA
_0801AE1C:
	ldr r2, _0801AE90 @ =gUnknown_2023ECC
	ldr r0, _0801AE94 @ =gBattlerTarget
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801AE44
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801AE44
	bl _0801BBAA
_0801AE44:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	beq _0801AE5C
	bl _0801BBAA
_0801AE5C:
	ldr r1, _0801AE98 @ =gUnknown_2023E82
	movs r0, 0x43
	strb r0, [r1, 0x3]
	bl BattleScriptPushCursor
	ldr r1, _0801AE9C @ =gUnknown_2023D74
	ldr r0, _0801AEA0 @ =gUnknown_81D94CB
	str r0, [r1]
	ldr r2, _0801AEA4 @ =gUnknown_2023DD0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 6
	orrs r0, r1
	str r0, [r2]
	bl _0801BB5A
	.align 2, 0
_0801AE7C: .4byte gMoveResultFlags
_0801AE80: .4byte gBattleMons
_0801AE84: .4byte sBattler_AI
_0801AE88: .4byte gUnknown_2023E8C
_0801AE8C: .4byte gBattleMoves
_0801AE90: .4byte gUnknown_2023ECC
_0801AE94: .4byte gBattlerTarget
_0801AE98: .4byte gUnknown_2023E82
_0801AE9C: .4byte gUnknown_2023D74
_0801AEA0: .4byte gUnknown_81D94CB
_0801AEA4: .4byte gUnknown_2023DD0
_0801AEA8:
	ldr r0, _0801AFE8 @ =gMoveResultFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0801AEB8
	bl _0801BBAA
_0801AEB8:
	ldr r5, _0801AFEC @ =gBattleMons
	ldr r7, _0801AFF0 @ =sBattler_AI
	ldrb r1, [r7]
	movs r6, 0x58
	adds r0, r1, 0
	muls r0, r6
	adds r0, r5
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _0801AED0
	bl _0801BBAA
_0801AED0:
	ldr r0, _0801AFF4 @ =gUnknown_2023E8C
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 31
	cmp r0, 0
	beq _0801AEE2
	bl _0801BBAA
_0801AEE2:
	ldr r1, _0801AFF8 @ =gBattleMoves
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0801AEFA
	bl _0801BBAA
_0801AEFA:
	ldr r3, _0801AFFC @ =gUnknown_2023ECC
	ldr r4, _0801B000 @ =gBattlerTarget
	mov r8, r4
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r2, r0, 2
	adds r0, r3, 0
	adds r0, 0x8
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801AF24
	adds r0, r3, 0
	adds r0, 0xC
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801AF24
	bl _0801BBAA
_0801AF24:
	adds r0, r1, 0
	muls r0, r6
	adds r0, r5
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _0801AF34
	bl _0801BBAA
_0801AF34:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	beq _0801AF4C
	bl _0801BBAA
_0801AF4C:
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0xC
	bne _0801AF5E
	bl _0801BBAA
_0801AF5E:
	ldr r0, [sp, 0x8]
	ldr r1, [sp, 0x10]
	bl GetGenderFromSpeciesAndPersonality
	adds r4, r0, 0
	ldr r0, [sp, 0xC]
	ldr r1, [sp, 0x14]
	bl GetGenderFromSpeciesAndPersonality
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _0801AF7C
	bl _0801BBAA
_0801AF7C:
	ldrb r0, [r7]
	muls r0, r6
	adds r4, r5, 0
	adds r4, 0x50
	adds r0, r4
	ldr r0, [r0]
	movs r1, 0xF0
	lsls r1, 12
	ands r0, r1
	cmp r0, 0
	beq _0801AF96
	bl _0801BBAA
_0801AF96:
	ldr r0, [sp, 0x8]
	ldr r1, [sp, 0x10]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0801AFAA
	bl _0801BBAA
_0801AFAA:
	ldr r0, [sp, 0xC]
	ldr r1, [sp, 0x14]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0801AFBE
	bl _0801BBAA
_0801AFBE:
	ldrb r0, [r7]
	adds r2, r0, 0
	muls r2, r6
	adds r2, r4
	ldr r1, _0801B004 @ =gBitTable
	mov r3, r8
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r1, 16
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	bl BattleScriptPushCursor
	ldr r1, _0801B008 @ =gUnknown_2023D74
	ldr r0, _0801B00C @ =gUnknown_81D94BE
	str r0, [r1]
	bl _0801BB5A
	.align 2, 0
_0801AFE8: .4byte gMoveResultFlags
_0801AFEC: .4byte gBattleMons
_0801AFF0: .4byte sBattler_AI
_0801AFF4: .4byte gUnknown_2023E8C
_0801AFF8: .4byte gBattleMoves
_0801AFFC: .4byte gUnknown_2023ECC
_0801B000: .4byte gBattlerTarget
_0801B004: .4byte gBitTable
_0801B008: .4byte gUnknown_2023D74
_0801B00C: .4byte gUnknown_81D94BE
_0801B010:
	movs r4, 0
	mov r10, r4
	ldr r0, _0801B044 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r10, r0
	bcc _0801B020
	bl _0801BBAA
_0801B020:
	ldr r1, _0801B048 @ =gBattleMons
	movs r0, 0x58
	mov r2, r10
	muls r2, r0
	adds r0, r2, 0
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	subs r0, 0x7
	adds r2, r1, 0
	cmp r0, 0x41
	bls _0801B03A
	b _0801B29E
_0801B03A:
	lsls r0, 2
	ldr r1, _0801B04C @ =_0801B050
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801B044: .4byte gBattlersCount
_0801B048: .4byte gBattleMons
_0801B04C: .4byte _0801B050
	.align 2, 0
_0801B050:
	.4byte _0801B1B4
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B278
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B1DC
	.4byte _0801B29E
	.4byte _0801B158
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B184
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B248
	.4byte _0801B218
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B29E
	.4byte _0801B1DC
_0801B158:
	movs r0, 0x58
	mov r3, r10
	muls r3, r0
	adds r0, r3, 0
	adds r1, r2, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _0801B178 @ =0x00000f88
	ands r0, r1
	cmp r0, 0
	bne _0801B172
	b _0801B29E
_0801B172:
	ldr r0, _0801B17C @ =gBattleTextBuff1
	ldr r1, _0801B180 @ =gUnknown_8250094
	b _0801B264
	.align 2, 0
_0801B178: .4byte 0x00000f88
_0801B17C: .4byte gBattleTextBuff1
_0801B180: .4byte gUnknown_8250094
_0801B184:
	movs r0, 0x58
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	adds r1, r2, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801B19E
	b _0801B29E
_0801B19E:
	ldr r0, _0801B1AC @ =gBattleTextBuff1
	ldr r1, _0801B1B0 @ =gUnknown_82500BC
	bl StringCopy
	movs r2, 0x2
	mov r9, r2
	b _0801B2A4
	.align 2, 0
_0801B1AC: .4byte gBattleTextBuff1
_0801B1B0: .4byte gUnknown_82500BC
_0801B1B4:
	movs r0, 0x58
	mov r3, r10
	muls r3, r0
	adds r0, r3, 0
	adds r1, r2, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0801B29E
	ldr r0, _0801B1D4 @ =gBattleTextBuff1
	ldr r1, _0801B1D8 @ =gUnknown_82500A4
	b _0801B264
	.align 2, 0
_0801B1D4: .4byte gBattleTextBuff1
_0801B1D8: .4byte gUnknown_82500A4
_0801B1DC:
	movs r0, 0x58
	mov r3, r10
	muls r3, r0
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _0801B29E
	adds r2, 0x50
	adds r2, r3, r2
	ldr r0, [r2]
	ldr r1, _0801B20C @ =0xf7ffffff
	ands r0, r1
	str r0, [r2]
	ldr r0, _0801B210 @ =gBattleTextBuff1
	ldr r1, _0801B214 @ =gUnknown_825009C
	bl StringCopy
	movs r0, 0x1
	mov r9, r0
	b _0801B2A4
	.align 2, 0
_0801B20C: .4byte 0xf7ffffff
_0801B210: .4byte gBattleTextBuff1
_0801B214: .4byte gUnknown_825009C
_0801B218:
	movs r0, 0x58
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	adds r1, r2, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0801B29E
	ldr r0, _0801B240 @ =gBattleTextBuff1
	ldr r1, _0801B244 @ =gUnknown_82500AC
	bl StringCopy
	movs r2, 0x1
	mov r9, r2
	b _0801B2A4
	.align 2, 0
_0801B240: .4byte gBattleTextBuff1
_0801B244: .4byte gUnknown_82500AC
_0801B248:
	movs r0, 0x58
	mov r3, r10
	muls r3, r0
	adds r0, r3, 0
	adds r1, r2, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0801B29E
	ldr r0, _0801B270 @ =gBattleTextBuff1
	ldr r1, _0801B274 @ =gUnknown_82500B4
_0801B264:
	bl StringCopy
	movs r4, 0x1
	mov r9, r4
	b _0801B2A4
	.align 2, 0
_0801B270: .4byte gBattleTextBuff1
_0801B274: .4byte gUnknown_82500B4
_0801B278:
	movs r0, 0x58
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	adds r1, r2, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0xF0
	lsls r1, 12
	ands r0, r1
	cmp r0, 0
	beq _0801B29E
	ldr r0, _0801B2B4 @ =gBattleTextBuff1
	ldr r1, _0801B2B8 @ =gUnknown_82500C4
	bl StringCopy
	movs r2, 0x3
	mov r9, r2
_0801B29E:
	mov r3, r9
	cmp r3, 0
	beq _0801B358
_0801B2A4:
	mov r4, r9
	cmp r4, 0x2
	beq _0801B2D8
	cmp r4, 0x2
	bgt _0801B2BC
	cmp r4, 0x1
	beq _0801B2C4
	b _0801B304
	.align 2, 0
_0801B2B4: .4byte gBattleTextBuff1
_0801B2B8: .4byte gUnknown_82500C4
_0801B2BC:
	mov r0, r9
	cmp r0, 0x3
	beq _0801B2F0
	b _0801B304
_0801B2C4:
	ldr r1, _0801B2D4 @ =gBattleMons
	movs r0, 0x58
	mov r2, r10
	muls r2, r0
	adds r1, 0x4C
	adds r2, r1
	movs r0, 0
	b _0801B302
	.align 2, 0
_0801B2D4: .4byte gBattleMons
_0801B2D8:
	ldr r1, _0801B2EC @ =gBattleMons
	movs r0, 0x58
	mov r2, r10
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	movs r1, 0x8
	negs r1, r1
	b _0801B300
	.align 2, 0
_0801B2EC: .4byte gBattleMons
_0801B2F0:
	ldr r1, _0801B33C @ =gBattleMons
	movs r0, 0x58
	mov r2, r10
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	ldr r1, _0801B340 @ =0xfff0ffff
_0801B300:
	ands r0, r1
_0801B302:
	str r0, [r2]
_0801B304:
	bl BattleScriptPushCursor
	ldr r1, _0801B344 @ =gUnknown_2023D74
	ldr r0, _0801B348 @ =gUnknown_81D94D1
	str r0, [r1]
	ldr r0, _0801B34C @ =gBattleScripting
	mov r1, r10
	strb r1, [r0, 0x17]
	ldr r4, _0801B350 @ =gActiveBattler
	strb r1, [r4]
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	ldr r1, _0801B354 @ =gUnknown_2023C30
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl EmitSetMonData
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	bl _0801BBC6
	.align 2, 0
_0801B33C: .4byte gBattleMons
_0801B340: .4byte 0xfff0ffff
_0801B344: .4byte gUnknown_2023D74
_0801B348: .4byte gUnknown_81D94D1
_0801B34C: .4byte gBattleScripting
_0801B350: .4byte gActiveBattler
_0801B354: .4byte gUnknown_2023C30
_0801B358:
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _0801B370 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r10, r0
	bcs _0801B36C
	b _0801B020
_0801B36C:
	bl _0801BBAA
	.align 2, 0
_0801B370: .4byte gBattlersCount
_0801B374:
	movs r2, 0
	mov r10, r2
	ldr r0, _0801B3C0 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r10, r0
	bcc _0801B384
	bl _0801BBAA
_0801B384:
	ldr r4, _0801B3C4 @ =gBattleMons
_0801B386:
	movs r0, 0x58
	mov r3, r10
	muls r3, r0
	adds r0, r3, 0
	adds r0, r4
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x3B
	bne _0801B3AA
	mov r0, r10
	bl sub_8019DAC
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	cmp r0, 0
	beq _0801B3AA
	b _0801BA84
_0801B3AA:
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _0801B3C0 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r10, r0
	bcc _0801B386
	bl _0801BBAA
	.align 2, 0
_0801B3C0: .4byte gBattlersCount
_0801B3C4: .4byte gBattleMons
_0801B3C8:
	mov r4, r8
	ldrb r0, [r4]
	cmp r0, 0x1C
	beq _0801B3D4
	bl _0801BBAA
_0801B3D4:
	ldr r4, _0801B434 @ =gUnknown_2023DD0
	ldr r1, [r4]
	movs r0, 0x80
	lsls r0, 7
	ands r0, r1
	cmp r0, 0
	bne _0801B3E6
	bl _0801BBAA
_0801B3E6:
	ldr r0, _0801B438 @ =0xffffbfff
	ands r1, r0
	str r1, [r4]
	ldr r1, [r6]
	adds r1, 0xB4
	ldrb r2, [r1]
	movs r0, 0x3F
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0xB4
	ldrb r0, [r1]
	cmp r0, 0x6
	bne _0801B408
	movs r0, 0x2
	strb r0, [r1]
_0801B408:
	ldr r1, _0801B43C @ =gUnknown_2023E82
	ldr r0, [r6]
	adds r0, 0xB4
	ldrb r0, [r0]
	adds r0, 0x40
	strb r0, [r1, 0x3]
	ldr r1, _0801B440 @ =gBattleScripting
	ldr r0, _0801B444 @ =gBattlerTarget
	ldrb r0, [r0]
	strb r0, [r1, 0x17]
	bl BattleScriptPushCursor
	ldr r1, _0801B448 @ =gUnknown_2023D74
	ldr r0, _0801B44C @ =gUnknown_81D94CE
	str r0, [r1]
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 6
	orrs r0, r1
	str r0, [r4]
	b _0801BB5A
	.align 2, 0
_0801B434: .4byte gUnknown_2023DD0
_0801B438: .4byte 0xffffbfff
_0801B43C: .4byte gUnknown_2023E82
_0801B440: .4byte gBattleScripting
_0801B444: .4byte gBattlerTarget
_0801B448: .4byte gUnknown_2023D74
_0801B44C: .4byte gUnknown_81D94CE
_0801B450:
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, 0x1C
	beq _0801B45A
	b _0801BBAA
_0801B45A:
	ldr r4, _0801B4B8 @ =gUnknown_2023DD0
	ldr r1, [r4]
	movs r0, 0x80
	lsls r0, 7
	ands r0, r1
	cmp r0, 0
	bne _0801B46A
	b _0801BBAA
_0801B46A:
	ldr r0, _0801B4BC @ =0xffffbfff
	ands r1, r0
	str r1, [r4]
	adds r3, r6, 0
	ldr r1, [r3]
	adds r1, 0xB4
	ldrb r2, [r1]
	movs r0, 0x3F
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	adds r1, r0, 0
	adds r1, 0xB4
	ldrb r0, [r1]
	cmp r0, 0x6
	bne _0801B48E
	movs r0, 0x2
	strb r0, [r1]
_0801B48E:
	ldr r1, _0801B4C0 @ =gUnknown_2023E82
	ldr r0, [r6]
	adds r0, 0xB4
	ldrb r0, [r0]
	strb r0, [r1, 0x3]
	ldr r1, _0801B4C4 @ =gBattleScripting
	ldr r0, _0801B4C8 @ =sBattler_AI
	ldrb r0, [r0]
	strb r0, [r1, 0x17]
	bl BattleScriptPushCursor
	ldr r1, _0801B4CC @ =gUnknown_2023D74
	ldr r0, _0801B4D0 @ =gUnknown_81D94CE
	str r0, [r1]
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 6
	orrs r0, r1
	str r0, [r4]
	b _0801BB5A
	.align 2, 0
_0801B4B8: .4byte gUnknown_2023DD0
_0801B4BC: .4byte 0xffffbfff
_0801B4C0: .4byte gUnknown_2023E82
_0801B4C4: .4byte gBattleScripting
_0801B4C8: .4byte sBattler_AI
_0801B4CC: .4byte gUnknown_2023D74
_0801B4D0: .4byte gUnknown_81D94CE
_0801B4D4:
	movs r5, 0
	ldr r0, _0801B50C @ =gBattlersCount
	ldrb r1, [r0]
	cmp r5, r1
	blt _0801B4E0
	b _0801BBAA
_0801B4E0:
	ldr r0, _0801B510 @ =gBattleMons
	adds r4, r1, 0
	ldr r2, _0801B514 @ =gStatuses3
	adds r3, r0, 0
	adds r3, 0x20
	movs r6, 0x80
	lsls r6, 12
_0801B4EE:
	ldrb r1, [r3]
	cmp r1, 0x16
	bne _0801B4FE
	ldr r0, [r2]
	ands r0, r6
	cmp r0, 0
	beq _0801B4FE
	b _0801BAAC
_0801B4FE:
	adds r2, 0x4
	adds r3, 0x58
	adds r5, 0x1
	cmp r5, r4
	blt _0801B4EE
	b _0801BBAA
	.align 2, 0
_0801B50C: .4byte gBattlersCount
_0801B510: .4byte gBattleMons
_0801B514: .4byte gStatuses3
_0801B518:
	movs r5, 0
	ldr r0, _0801B5F4 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _0801B524
	b _0801BBAA
_0801B524:
	ldr r2, _0801B5F8 @ =gActiveBattler
	mov r8, r2
	ldr r3, _0801B5FC @ =gBattleMons
	adds r3, 0x20
	str r3, [sp, 0x1C]
	movs r4, 0
	str r4, [sp, 0x20]
_0801B532:
	ldr r1, [sp, 0x1C]
	ldrb r0, [r1]
	cmp r0, 0x24
	beq _0801B53C
	b _0801B6D6
_0801B53C:
	ldr r0, _0801B600 @ =gStatuses3
	ldr r2, [sp, 0x20]
	adds r0, r2, r0
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 13
	ands r1, r0
	str r2, [sp, 0x18]
	cmp r1, 0
	bne _0801B552
	b _0801B6D6
_0801B552:
	lsls r0, r5, 24
	lsrs r0, 24
	bl GetBattlerPosition
	movs r1, 0x1
	adds r6, r0, 0
	eors r6, r1
	ands r6, r1
	adds r0, r6, 0
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0x2
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0801B604 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r2, 0x1
	ands r0, r2
	cmp r0, 0
	bne _0801B584
	b _0801B69C
_0801B584:
	movs r3, 0x58
	adds r0, r4, 0
	muls r0, r3
	ldr r3, _0801B5FC @ =gBattleMons
	adds r1, r0, r3
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0
	beq _0801B658
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _0801B60C
	movs r1, 0x58
	adds r0, r7, 0
	muls r0, r1
	adds r1, r0, r3
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0
	beq _0801B60C
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _0801B60C
	str r2, [sp, 0x24]
	bl Random
	ldr r2, [sp, 0x24]
	adds r1, r2, 0
	ands r1, r0
	lsls r1, 1
	orrs r6, r1
	adds r0, r6, 0
	bl GetBattlerAtPosition
	mov r2, r8
	strb r0, [r2]
	ldrb r0, [r2]
	movs r3, 0x58
	muls r0, r3
	ldr r4, _0801B5FC @ =gBattleMons
	adds r0, r4
	adds r0, 0x20
	ldrb r0, [r0]
	ldr r1, [sp, 0x1C]
	strb r0, [r1]
	ldrb r0, [r2]
	muls r0, r3
	adds r0, r4
	adds r0, 0x20
	ldrb r0, [r0]
	ldr r2, _0801B608 @ =gLastUsedAbility
	strb r0, [r2]
	b _0801B6C4
	.align 2, 0
_0801B5F4: .4byte gBattlersCount
_0801B5F8: .4byte gActiveBattler
_0801B5FC: .4byte gBattleMons
_0801B600: .4byte gStatuses3
_0801B604: .4byte gBattleTypeFlags
_0801B608: .4byte gLastUsedAbility
_0801B60C:
	ldr r3, _0801B650 @ =gBattleMons
	movs r2, 0x58
	adds r0, r4, 0
	muls r0, r2
	adds r1, r0, r3
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0
	beq _0801B658
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _0801B658
	mov r0, r8
	strb r4, [r0]
	adds r1, r5, 0
	muls r1, r2
	adds r1, r3
	ldrb r0, [r0]
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	adds r1, 0x20
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	ldr r2, _0801B654 @ =gLastUsedAbility
	strb r0, [r2]
	b _0801B6C4
	.align 2, 0
_0801B650: .4byte gBattleMons
_0801B654: .4byte gLastUsedAbility
_0801B658:
	ldr r3, _0801B698 @ =gBattleMons
	movs r2, 0x58
	adds r0, r7, 0
	muls r0, r2
	adds r1, r0, r3
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0
	beq _0801B6CE
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _0801B6CE
	mov r4, r8
	strb r7, [r4]
	adds r1, r5, 0
	muls r1, r2
	adds r1, r3
	ldrb r0, [r4]
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	adds r1, 0x20
	strb r0, [r1]
	ldrb r0, [r4]
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	b _0801B6C0
	.align 2, 0
_0801B698: .4byte gBattleMons
_0801B69C:
	mov r2, r8
	strb r4, [r2]
	movs r3, 0x58
	adds r0, r4, 0
	muls r0, r3
	ldr r4, _0801B6F0 @ =gBattleMons
	adds r0, r4
	adds r2, r0, 0
	adds r2, 0x20
	ldrb r1, [r2]
	cmp r1, 0
	beq _0801B6CE
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0801B6CE
	ldr r0, [sp, 0x1C]
	strb r1, [r0]
	ldrb r0, [r2]
_0801B6C0:
	ldr r1, _0801B6F4 @ =gLastUsedAbility
	strb r0, [r1]
_0801B6C4:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0801B6CE:
	mov r2, r9
	cmp r2, 0
	beq _0801B6D6
	b _0801BAC8
_0801B6D6:
	ldr r3, [sp, 0x1C]
	adds r3, 0x58
	str r3, [sp, 0x1C]
	ldr r4, [sp, 0x20]
	adds r4, 0x4
	str r4, [sp, 0x20]
	adds r5, 0x1
	ldr r0, _0801B6F8 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	bge _0801B6EE
	b _0801B532
_0801B6EE:
	b _0801BBAA
	.align 2, 0
_0801B6F0: .4byte gBattleMons
_0801B6F4: .4byte gLastUsedAbility
_0801B6F8: .4byte gBattlersCount
_0801B6FC:
	movs r5, 0
	ldr r0, _0801B734 @ =gBattlersCount
	ldrb r1, [r0]
	cmp r5, r1
	blt _0801B708
	b _0801BBAA
_0801B708:
	ldr r0, _0801B738 @ =gBattleMons
	adds r4, r1, 0
	ldr r2, _0801B73C @ =gStatuses3
	adds r3, r0, 0
	adds r3, 0x20
	movs r6, 0x80
	lsls r6, 12
_0801B716:
	ldrb r1, [r3]
	cmp r1, 0x16
	bne _0801B726
	ldr r0, [r2]
	ands r0, r6
	cmp r0, 0
	beq _0801B726
	b _0801BB3C
_0801B726:
	adds r2, 0x4
	adds r3, 0x58
	adds r5, 0x1
	cmp r5, r4
	blt _0801B716
	b _0801BBAA
	.align 2, 0
_0801B734: .4byte gBattlersCount
_0801B738: .4byte gBattleMons
_0801B73C: .4byte gStatuses3
_0801B740:
	mov r0, r10
	bl GetBattlerSide
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	ldr r0, _0801B790 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _0801B756
	b _0801BBAA
_0801B756:
	ldr r0, _0801B794 @ =gBattleMons
	mov r8, r0
_0801B75A:
	lsls r0, r5, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	adds r4, r5, 0x1
	cmp r0, r6
	beq _0801B784
	movs r0, 0x58
	muls r0, r5
	add r0, r8
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, r7
	bne _0801B784
	ldr r0, _0801B798 @ =gLastUsedAbility
	strb r7, [r0]
	lsls r0, r4, 24
	lsrs r0, 24
	mov r9, r0
_0801B784:
	adds r5, r4, 0
	ldr r0, _0801B790 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _0801B75A
	b _0801BBAA
	.align 2, 0
_0801B790: .4byte gBattlersCount
_0801B794: .4byte gBattleMons
_0801B798: .4byte gLastUsedAbility
_0801B79C:
	mov r0, r10
	bl GetBattlerSide
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	ldr r0, _0801B7EC @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _0801B7B2
	b _0801BBAA
_0801B7B2:
	ldr r1, _0801B7F0 @ =gBattleMons
	mov r8, r1
_0801B7B6:
	lsls r0, r5, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	adds r4, r5, 0x1
	cmp r0, r6
	bne _0801B7E0
	movs r0, 0x58
	muls r0, r5
	add r0, r8
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, r7
	bne _0801B7E0
	ldr r0, _0801B7F4 @ =gLastUsedAbility
	strb r7, [r0]
	lsls r0, r4, 24
	lsrs r0, 24
	mov r9, r0
_0801B7E0:
	adds r5, r4, 0
	ldr r0, _0801B7EC @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _0801B7B6
	b _0801BBAA
	.align 2, 0
_0801B7EC: .4byte gBattlersCount
_0801B7F0: .4byte gBattleMons
_0801B7F4: .4byte gLastUsedAbility
_0801B7F8:
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, 0xFD
	beq _0801B820
	cmp r0, 0xFE
	beq _0801B858
	movs r5, 0
	ldr r0, _0801B818 @ =gBattlersCount
	adds r3, r0, 0
	ldrb r4, [r3]
	cmp r5, r4
	blt _0801B812
	b _0801BBAA
_0801B812:
	ldr r2, _0801B81C @ =gBattleMons
	b _0801B890
	.align 2, 0
_0801B818: .4byte gBattlersCount
_0801B81C: .4byte gBattleMons
_0801B820:
	movs r5, 0
	ldr r0, _0801B850 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _0801B82C
	b _0801BBAA
_0801B82C:
	ldr r3, _0801B854 @ =gStatuses3
	movs r2, 0x80
	lsls r2, 9
	adds r1, r0, 0
_0801B834:
	lsls r0, r5, 2
	adds r0, r3
	ldr r0, [r0]
	ands r0, r2
	adds r4, r5, 0x1
	cmp r0, 0
	beq _0801B848
	lsls r0, r4, 24
	lsrs r0, 24
	mov r9, r0
_0801B848:
	adds r5, r4, 0
	cmp r5, r1
	blt _0801B834
	b _0801BBAA
	.align 2, 0
_0801B850: .4byte gBattlersCount
_0801B854: .4byte gStatuses3
_0801B858:
	movs r5, 0
	ldr r0, _0801B888 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _0801B864
	b _0801BBAA
_0801B864:
	ldr r3, _0801B88C @ =gStatuses3
	movs r2, 0x80
	lsls r2, 10
	adds r1, r0, 0
_0801B86C:
	lsls r0, r5, 2
	adds r0, r3
	ldr r0, [r0]
	ands r0, r2
	adds r4, r5, 0x1
	cmp r0, 0
	beq _0801B880
	lsls r0, r4, 24
	lsrs r0, 24
	mov r9, r0
_0801B880:
	adds r5, r4, 0
	cmp r5, r1
	blt _0801B86C
	b _0801BBAA
	.align 2, 0
_0801B888: .4byte gBattlersCount
_0801B88C: .4byte gStatuses3
_0801B890:
	movs r0, 0x58
	muls r0, r5
	adds r0, r2
	adds r0, 0x20
	ldrb r0, [r0]
	adds r4, r5, 0x1
	cmp r0, r7
	bne _0801B8AA
	mov r0, r8
	strb r7, [r0]
	lsls r0, r4, 24
	lsrs r0, 24
	mov r9, r0
_0801B8AA:
	adds r5, r4, 0
	ldrb r1, [r3]
	cmp r5, r1
	blt _0801B890
	b _0801BBAA
_0801B8B4:
	movs r5, 0
	ldr r0, _0801B8F0 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _0801B8C0
	b _0801BBAA
_0801B8C0:
	ldr r6, _0801B8F4 @ =gBattleMons
	adds r2, r0, 0
	movs r3, 0x58
_0801B8C6:
	adds r0, r5, 0
	muls r0, r3
	adds r1, r0, r6
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	adds r4, r5, 0x1
	cmp r0, r7
	bne _0801B8E8
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _0801B8E8
	mov r0, r8
	strb r7, [r0]
	lsls r0, r4, 24
	lsrs r0, 24
	mov r9, r0
_0801B8E8:
	adds r5, r4, 0
	cmp r5, r2
	blt _0801B8C6
	b _0801BBAA
	.align 2, 0
_0801B8F0: .4byte gBattlersCount
_0801B8F4: .4byte gBattleMons
_0801B8F8:
	ldr r0, _0801B908 @ =gLastUsedAbility
	strb r7, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	b _0801B94A
	.align 2, 0
_0801B908: .4byte gLastUsedAbility
_0801B90C:
	mov r0, r10
	bl GetBattlerSide
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	ldr r0, _0801B99C @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	bge _0801B94A
	ldr r4, _0801B9A0 @ =gBattleMons
_0801B922:
	lsls r0, r5, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r6
	beq _0801B940
	movs r0, 0x58
	muls r0, r5
	adds r0, r4
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, r7
	beq _0801B8F8
_0801B940:
	adds r5, 0x1
	ldr r0, _0801B99C @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _0801B922
_0801B94A:
	mov r1, r9
	cmp r1, 0
	beq _0801B952
	b _0801BBB0
_0801B952:
	movs r5, 0
	ldr r0, _0801B99C @ =gBattlersCount
	ldrb r0, [r0]
	cmp r9, r0
	blt _0801B95E
	b _0801BBAA
_0801B95E:
	ldr r2, _0801B9A0 @ =gBattleMons
	mov r8, r2
_0801B962:
	movs r0, 0x58
	muls r0, r5
	add r0, r8
	adds r0, 0x20
	ldrb r0, [r0]
	adds r4, r5, 0x1
	cmp r0, r7
	bne _0801B990
	lsls r0, r5, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r6
	bne _0801B990
	cmp r5, r10
	beq _0801B990
	ldr r0, _0801B9A4 @ =gLastUsedAbility
	strb r7, [r0]
	lsls r0, r4, 24
	lsrs r0, 24
	mov r9, r0
_0801B990:
	adds r5, r4, 0
	ldr r0, _0801B99C @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _0801B962
	b _0801BBAA
	.align 2, 0
_0801B99C: .4byte gBattlersCount
_0801B9A0: .4byte gBattleMons
_0801B9A4: .4byte gLastUsedAbility
_0801B9A8:
	mov r0, r10
	bl GetBattlerSide
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	ldr r0, _0801B9F8 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _0801B9BE
	b _0801BBAA
_0801B9BE:
	ldr r4, _0801B9FC @ =gBattleMons
_0801B9C0:
	lsls r0, r5, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r6
	beq _0801B9EC
	movs r0, 0x58
	muls r0, r5
	adds r0, r4
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, r7
	bne _0801B9EC
	ldr r0, _0801BA00 @ =gLastUsedAbility
	strb r7, [r0]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0801B9EC:
	adds r5, 0x1
	ldr r0, _0801B9F8 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _0801B9C0
	b _0801BBAA
	.align 2, 0
_0801B9F8: .4byte gBattlersCount
_0801B9FC: .4byte gBattleMons
_0801BA00: .4byte gLastUsedAbility
_0801BA04:
	mov r0, r10
	bl GetBattlerSide
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	ldr r0, _0801BA54 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _0801BA1A
	b _0801BBAA
_0801BA1A:
	ldr r4, _0801BA58 @ =gBattleMons
_0801BA1C:
	lsls r0, r5, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r6
	bne _0801BA48
	movs r0, 0x58
	muls r0, r5
	adds r0, r4
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, r7
	bne _0801BA48
	ldr r0, _0801BA5C @ =gLastUsedAbility
	strb r7, [r0]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0801BA48:
	adds r5, 0x1
	ldr r0, _0801BA54 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _0801BA1C
	b _0801BBAA
	.align 2, 0
_0801BA54: .4byte gBattlersCount
_0801BA58: .4byte gBattleMons
_0801BA5C: .4byte gLastUsedAbility
_0801BA60:
	ldr r0, _0801BA78 @ =gUnknown_81D92F8
	bl BattleScriptPushCursorAndCallback
	ldr r0, _0801BA7C @ =gBattleScripting
	strb r4, [r0, 0x17]
_0801BA6A:
	ldr r0, _0801BA80 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x7F
	mov r1, r9
	subs r1, 0x1
	strb r1, [r0]
	b _0801BBAA
	.align 2, 0
_0801BA78: .4byte gUnknown_81D92F8
_0801BA7C: .4byte gBattleScripting
_0801BA80: .4byte gBattleStruct
_0801BA84:
	ldr r0, _0801BAA0 @ =gUnknown_81D92F8
	bl BattleScriptPushCursorAndCallback
	ldr r0, _0801BAA4 @ =gBattleScripting
	mov r3, r10
	strb r3, [r0, 0x17]
	ldr r0, _0801BAA8 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x7F
	mov r1, r9
	subs r1, 0x1
	strb r1, [r0]
	b _0801BBC6
	.align 2, 0
_0801BAA0: .4byte gUnknown_81D92F8
_0801BAA4: .4byte gBattleScripting
_0801BAA8: .4byte gBattleStruct
_0801BAAC:
	mov r4, r8
	strb r1, [r4]
	ldr r0, [r2]
	ldr r1, _0801BAC0 @ =0xfff7ffff
	ands r0, r1
	str r0, [r2]
	ldr r0, _0801BAC4 @ =gUnknown_81D9307
	bl BattleScriptPushCursorAndCallback
	b _0801BB52
	.align 2, 0
_0801BAC0: .4byte 0xfff7ffff
_0801BAC4: .4byte gUnknown_81D9307
_0801BAC8:
	ldr r0, _0801BB18 @ =gUnknown_81D92A1
	bl BattleScriptPushCursorAndCallback
	ldr r1, _0801BB1C @ =gStatuses3
	ldr r0, [sp, 0x18]
	adds r1, r0, r1
	ldr r0, [r1]
	ldr r2, _0801BB20 @ =0xffefffff
	ands r0, r2
	str r0, [r1]
	ldr r0, _0801BB24 @ =gBattleScripting
	strb r5, [r0, 0x17]
	ldr r1, _0801BB28 @ =gBattleTextBuff1
	movs r4, 0xFD
	strb r4, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x1]
	ldr r2, _0801BB2C @ =gActiveBattler
	ldrb r0, [r2]
	strb r0, [r1, 0x2]
	ldr r3, _0801BB30 @ =gBattlerPartyIndexes
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _0801BB34 @ =gBattleTextBuff2
	strb r4, [r1]
	movs r0, 0x9
	strb r0, [r1, 0x1]
	ldr r0, _0801BB38 @ =gLastUsedAbility
	ldrb r0, [r0]
	strb r0, [r1, 0x2]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r1, 0x3]
	b _0801BBAA
	.align 2, 0
_0801BB18: .4byte gUnknown_81D92A1
_0801BB1C: .4byte gStatuses3
_0801BB20: .4byte 0xffefffff
_0801BB24: .4byte gBattleScripting
_0801BB28: .4byte gBattleTextBuff1
_0801BB2C: .4byte gActiveBattler
_0801BB30: .4byte gBattlerPartyIndexes
_0801BB34: .4byte gBattleTextBuff2
_0801BB38: .4byte gLastUsedAbility
_0801BB3C:
	mov r3, r8
	strb r1, [r3]
	ldr r0, [r2]
	ldr r1, _0801BB68 @ =0xfff7ffff
	ands r0, r1
	str r0, [r2]
	bl BattleScriptPushCursor
	ldr r1, _0801BB6C @ =gUnknown_2023D74
	ldr r0, _0801BB70 @ =gUnknown_81D9310
	str r0, [r1]
_0801BB52:
	ldr r0, _0801BB74 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xD8
	strb r5, [r0]
_0801BB5A:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	b _0801BBAA
	.align 2, 0
_0801BB68: .4byte 0xfff7ffff
_0801BB6C: .4byte gUnknown_2023D74
_0801BB70: .4byte gUnknown_81D9310
_0801BB74: .4byte gBattleStruct
_0801BB78:
	movs r5, 0
	ldr r0, _0801BBD8 @ =gBattlersCount
	ldrb r1, [r0]
	cmp r5, r1
	bge _0801BBAA
	ldr r0, _0801BBDC @ =gBattleMons
	adds r2, r1, 0
	adds r1, r0, 0
	adds r1, 0x20
	ldr r3, _0801BBE0 @ =gLastUsedAbility
_0801BB8C:
	ldrb r0, [r1]
	cmp r0, r7
	bne _0801BBA2
	cmp r5, r10
	beq _0801BBA2
	strb r7, [r3]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0801BBA2:
	adds r1, 0x58
	adds r5, 0x1
	cmp r5, r2
	blt _0801BB8C
_0801BBAA:
	mov r4, r9
	cmp r4, 0
	beq _0801BBC6
_0801BBB0:
	ldr r0, [sp, 0x4]
	cmp r0, 0xB
	bhi _0801BBC6
	ldr r1, _0801BBE0 @ =gLastUsedAbility
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _0801BBC6
	adds r1, r0, 0
	mov r0, r10
	bl sub_80C71D0
_0801BBC6:
	mov r0, r9
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801BBD8: .4byte gBattlersCount
_0801BBDC: .4byte gBattleMons
_0801BBE0: .4byte gLastUsedAbility
	thumb_func_end AbilityBattleEffects

	thumb_func_start BattleScriptExecute
BattleScriptExecute: @ 801BBE4
	ldr r1, _0801BC10 @ =gUnknown_2023D74
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
	ldr r1, _0801BC18 @ =gUnknown_3004F84
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, _0801BC1C @ =RunBattleScriptCommands_PopCallbacksStack
	str r0, [r1]
	ldr r1, _0801BC20 @ =gUnknown_2023BE3
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0801BC10: .4byte gUnknown_2023D74
_0801BC14: .4byte gBattleResources
_0801BC18: .4byte gUnknown_3004F84
_0801BC1C: .4byte RunBattleScriptCommands_PopCallbacksStack
_0801BC20: .4byte gUnknown_2023BE3
	thumb_func_end BattleScriptExecute

	thumb_func_start BattleScriptPushCursorAndCallback
BattleScriptPushCursorAndCallback: @ 801BC24
	push {r4,lr}
	adds r4, r0, 0
	bl BattleScriptPushCursor
	ldr r0, _0801BC58 @ =gUnknown_2023D74
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
	ldr r1, _0801BC60 @ =gUnknown_3004F84
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, _0801BC64 @ =sub_8015C74
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801BC58: .4byte gUnknown_2023D74
_0801BC5C: .4byte gBattleResources
_0801BC60: .4byte gUnknown_3004F84
_0801BC64: .4byte sub_8015C74
	thumb_func_end BattleScriptPushCursorAndCallback

	thumb_func_start sub_801BC68
sub_801BC68: @ 801BC68
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
	ldr r4, _0801BCB4 @ =gUnknown_2023D68
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
_0801BCB4: .4byte gUnknown_2023D68
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
	ldr r0, _0801BD00 @ =sBattler_AI
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
_0801BD00: .4byte sBattler_AI
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
	ldr r0, _0801BDFC @ =sBattler_AI
	strb r7, [r0]
	strb r7, [r1]
	ldr r0, _0801BE00 @ =gUnknown_81D95D9
	bl BattleScriptExecute
	bl _0801CFA6
	.align 2, 0
_0801BDEC: .4byte gBattleMons
_0801BDF0: .4byte gBattleScripting
_0801BDF4: .4byte gPotentialItemEffectBattler
_0801BDF8: .4byte gActiveBattler
_0801BDFC: .4byte sBattler_AI
_0801BE00: .4byte gUnknown_81D95D9
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
	ldr r0, _0801BF28 @ =gUnknown_81D95EF
	bl BattleScriptExecute
	b _0801C27E
	.align 2, 0
_0801BF24: .4byte gBattleMoveDamage
_0801BF28: .4byte gUnknown_81D95EF
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
	ldr r0, _0801C024 @ =gUnknown_81D960C
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
	bl EmitSetMonData
	ldr r0, _0801C028 @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBufferBankForExecution
	movs r0, 0x3
	str r0, [sp, 0xC]
	bl _0801C95A
	.align 2, 0
_0801C020: .4byte gBattleTextBuff1
_0801C024: .4byte gUnknown_81D960C
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
	ldr r0, _0801C090 @ =sBattler_AI
	strb r7, [r0]
	strb r7, [r1]
	ldr r0, _0801C094 @ =gUnknown_81D95D9
	bl BattleScriptExecute
	bl _0801C952
	.align 2, 0
_0801C080: .4byte gBattleMons
_0801C084: .4byte gBattleScripting
_0801C088: .4byte gPotentialItemEffectBattler
_0801C08C: .4byte gActiveBattler
_0801C090: .4byte sBattler_AI
_0801C094: .4byte gUnknown_81D95D9
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
	ldr r0, _0801C0F4 @ =gUnknown_81D961C
	bl BattleScriptExecute
	movs r0, 0x4
	str r0, [sp, 0xC]
	adds r0, r7, 0
	adds r1, r5, 0
	bl sub_80C7208
	bl _0801C952
	.align 2, 0
_0801C0F0: .4byte gBattleMoveDamage
_0801C0F4: .4byte gUnknown_81D961C
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
	ldr r0, _0801C274 @ =gUnknown_81D964F
	bl BattleScriptExecute
	b _0801C27E
	.align 2, 0
_0801C26C: .4byte gBattleTextBuff1
_0801C270: .4byte gBattleMoveDamage
_0801C274: .4byte gUnknown_81D964F
_0801C278:
	ldr r0, _0801C284 @ =gUnknown_81D95EF
	bl BattleScriptExecute
_0801C27E:
	movs r0, 0x4
	str r0, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C284: .4byte gUnknown_81D95EF
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
	ldr r0, _0801C308 @ =gUnknown_81D964F
	bl BattleScriptExecute
	b _0801C312
	.align 2, 0
_0801C300: .4byte gBattleTextBuff1
_0801C304: .4byte gBattleMoveDamage
_0801C308: .4byte gUnknown_81D964F
_0801C30C:
	ldr r0, _0801C318 @ =gUnknown_81D95EF
	bl BattleScriptExecute
_0801C312:
	movs r3, 0x4
	str r3, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C318: .4byte gUnknown_81D95EF
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
	ldr r0, _0801C39C @ =gUnknown_81D964F
	bl BattleScriptExecute
	b _0801C3A6
	.align 2, 0
_0801C394: .4byte gBattleTextBuff1
_0801C398: .4byte gBattleMoveDamage
_0801C39C: .4byte gUnknown_81D964F
_0801C3A0:
	ldr r0, _0801C3AC @ =gUnknown_81D95EF
	bl BattleScriptExecute
_0801C3A6:
	movs r2, 0x4
	str r2, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C3AC: .4byte gUnknown_81D95EF
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
	ldr r0, _0801C410 @ =gUnknown_2023D6E
	strb r7, [r0]
	ldr r1, _0801C414 @ =gBattleScripting
	movs r0, 0x11
	strb r0, [r1, 0x1A]
	movs r0, 0xF
	b _0801C56C
	.align 2, 0
_0801C408: .4byte gBattleTextBuff1
_0801C40C: .4byte gBattleTextBuff2
_0801C410: .4byte gUnknown_2023D6E
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
	ldr r0, _0801C464 @ =gUnknown_2023D6E
	strb r7, [r0]
	ldr r1, _0801C468 @ =gBattleScripting
	movs r0, 0x12
	strb r0, [r1, 0x1A]
	movs r0, 0x10
	b _0801C506
	.align 2, 0
_0801C460: .4byte gBattleTextBuff1
_0801C464: .4byte gUnknown_2023D6E
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
	ldr r0, _0801C4B8 @ =gUnknown_2023D6E
	strb r7, [r0]
	ldr r1, _0801C4BC @ =gBattleScripting
	movs r0, 0x13
	strb r0, [r1, 0x1A]
	movs r0, 0x11
	b _0801C56C
	.align 2, 0
_0801C4B4: .4byte gBattleTextBuff1
_0801C4B8: .4byte gUnknown_2023D6E
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
	ldr r0, _0801C51C @ =gUnknown_2023D6E
	strb r7, [r0]
	ldr r1, _0801C520 @ =gBattleScripting
	movs r0, 0x14
	strb r0, [r1, 0x1A]
	movs r0, 0x12
_0801C506:
	strb r0, [r1, 0x10]
	strb r6, [r1, 0x11]
	ldr r0, _0801C524 @ =gUnknown_81D9679
	bl BattleScriptExecute
	movs r2, 0x5
	str r2, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C518: .4byte gBattleTextBuff1
_0801C51C: .4byte gUnknown_2023D6E
_0801C520: .4byte gBattleScripting
_0801C524: .4byte gUnknown_81D9679
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
	ldr r0, _0801C580 @ =gUnknown_2023D6E
	strb r7, [r0]
	ldr r1, _0801C584 @ =gBattleScripting
	movs r0, 0x15
	strb r0, [r1, 0x1A]
	movs r0, 0x13
_0801C56C:
	strb r0, [r1, 0x10]
	strb r6, [r1, 0x11]
	ldr r0, _0801C588 @ =gUnknown_81D9679
	bl BattleScriptExecute
	movs r5, 0x5
	str r5, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C57C: .4byte gBattleTextBuff1
_0801C580: .4byte gUnknown_2023D6E
_0801C584: .4byte gBattleScripting
_0801C588: .4byte gUnknown_81D9679
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
	ldr r0, _0801C5D4 @ =gUnknown_81D9694
	bl BattleScriptExecute
	movs r2, 0x2
	str r2, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C5D4: .4byte gUnknown_81D9694
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
	ldr r0, _0801C6B4 @ =gUnknown_2023D6E
	strb r7, [r0]
	ldr r1, _0801C6B8 @ =gBattleScripting
	mov r0, r10
	adds r0, 0x21
	strb r0, [r1, 0x1A]
	adds r0, 0x6
	strb r0, [r1, 0x10]
	strb r2, [r1, 0x11]
	ldr r0, _0801C6BC @ =gUnknown_81D9679
	bl BattleScriptExecute
	movs r0, 0x5
	str r0, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C6A8: .4byte gUnknown_2023BFC
_0801C6AC: .4byte gBattleTextBuff1
_0801C6B0: .4byte gBattleTextBuff2
_0801C6B4: .4byte gUnknown_2023D6E
_0801C6B8: .4byte gBattleScripting
_0801C6BC: .4byte gUnknown_81D9679
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
	ldr r0, _0801C6EC @ =gUnknown_81D9531
	bl BattleScriptExecute
	movs r1, 0x1
	str r1, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C6EC: .4byte gUnknown_81D9531
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
	ldr r0, _0801C720 @ =gUnknown_81D9549
	bl BattleScriptExecute
	movs r2, 0x1
	str r2, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C71C: .4byte 0xfffff077
_0801C720: .4byte gUnknown_81D9549
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
	ldr r0, _0801C750 @ =gUnknown_81D9561
	bl BattleScriptExecute
	movs r3, 0x1
	str r3, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C750: .4byte gUnknown_81D9561
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
	ldr r0, _0801C780 @ =gUnknown_81D9579
	bl BattleScriptExecute
	movs r5, 0x1
	str r5, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C780: .4byte gUnknown_81D9579
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
	ldr r0, _0801C7BC @ =gUnknown_81D9591
	b _0801C906
	.align 2, 0
_0801C7B8: .4byte 0xf7ffffff
_0801C7BC: .4byte gUnknown_81D9591
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
	ldr r0, _0801C7EC @ =gUnknown_81D95A9
	bl BattleScriptExecute
	movs r1, 0x2
	str r1, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C7EC: .4byte gUnknown_81D95A9
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
	ldr r1, _0801C8C0 @ =gUnknown_8250094
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
	ldr r1, _0801C8C8 @ =gUnknown_825009C
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
	ldr r1, _0801C8CC @ =gUnknown_82500A4
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
	ldr r1, _0801C8D0 @ =gUnknown_82500AC
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
	ldr r1, _0801C8D4 @ =gUnknown_82500B4
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
	ldr r1, _0801C8D8 @ =gUnknown_82500BC
	bl StringCopy
	movs r3, 0x1
	add r10, r3
_0801C8AE:
	mov r5, r10
	cmp r5, 0x1
	bgt _0801C8E0
	ldr r1, _0801C8DC @ =gUnknown_2023E82
	movs r0, 0
	b _0801C8E4
	.align 2, 0
_0801C8BC: .4byte gBattleTextBuff1
_0801C8C0: .4byte gUnknown_8250094
_0801C8C4: .4byte 0xf7ffffff
_0801C8C8: .4byte gUnknown_825009C
_0801C8CC: .4byte gUnknown_82500A4
_0801C8D0: .4byte gUnknown_82500AC
_0801C8D4: .4byte gUnknown_82500B4
_0801C8D8: .4byte gUnknown_82500BC
_0801C8DC: .4byte gUnknown_2023E82
_0801C8E0:
	ldr r1, _0801C910 @ =gUnknown_2023E82
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
	ldr r0, _0801C918 @ =gUnknown_81D95BF
_0801C906:
	bl BattleScriptExecute
	movs r0, 0x1
	str r0, [sp, 0xC]
	b _0801C95A
	.align 2, 0
_0801C910: .4byte gUnknown_2023E82
_0801C914: .4byte gBattleMons
_0801C918: .4byte gUnknown_81D95BF
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
	ldr r1, _0801C980 @ =gUnknown_82500C4
	bl StringCopy
	ldr r0, _0801C984 @ =gUnknown_81D95BF
	bl BattleScriptExecute
	ldr r1, _0801C988 @ =gUnknown_2023E82
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
	ldr r0, _0801C998 @ =sBattler_AI
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
_0801C980: .4byte gUnknown_82500C4
_0801C984: .4byte gUnknown_81D95BF
_0801C988: .4byte gUnknown_2023E82
_0801C98C: .4byte gBattleScripting
_0801C990: .4byte gPotentialItemEffectBattler
_0801C994: .4byte gActiveBattler
_0801C998: .4byte sBattler_AI
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
	ldr r4, _0801CA30 @ =gUnknown_2023D68
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
_0801CA30: .4byte gUnknown_2023D68
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
	ldr r1, _0801CB04 @ =gUnknown_2023D74
	ldr r0, _0801CB08 @ =gUnknown_81D9537
	str r0, [r1]
	movs r0, 0x1
	str r0, [sp, 0xC]
	b _0801CDF6
	.align 2, 0
_0801CB00: .4byte gBattleMons
_0801CB04: .4byte gUnknown_2023D74
_0801CB08: .4byte gUnknown_81D9537
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
	ldr r1, _0801CB40 @ =gUnknown_2023D74
	ldr r0, _0801CB44 @ =gUnknown_81D954F
	str r0, [r1]
	movs r1, 0x1
	str r1, [sp, 0xC]
	b _0801CDF6
	.align 2, 0
_0801CB38: .4byte gBattleMons
_0801CB3C: .4byte 0xfffff077
_0801CB40: .4byte gUnknown_2023D74
_0801CB44: .4byte gUnknown_81D954F
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
	ldr r1, _0801CB7C @ =gUnknown_2023D74
	ldr r0, _0801CB80 @ =gUnknown_81D9567
	str r0, [r1]
	movs r2, 0x1
	str r2, [sp, 0xC]
	b _0801CDF6
	.align 2, 0
_0801CB78: .4byte gBattleMons
_0801CB7C: .4byte gUnknown_2023D74
_0801CB80: .4byte gUnknown_81D9567
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
	ldr r1, _0801CBB8 @ =gUnknown_2023D74
	ldr r0, _0801CBBC @ =gUnknown_81D957F
	str r0, [r1]
	movs r3, 0x1
	str r3, [sp, 0xC]
	b _0801CDF6
	.align 2, 0
_0801CBB4: .4byte gBattleMons
_0801CBB8: .4byte gUnknown_2023D74
_0801CBBC: .4byte gUnknown_81D957F
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
	ldr r1, _0801CC00 @ =gUnknown_2023D74
	ldr r0, _0801CC04 @ =gUnknown_81D9597
	b _0801CD58
	.align 2, 0
_0801CBF8: .4byte gBattleMons
_0801CBFC: .4byte 0xf7ffffff
_0801CC00: .4byte gUnknown_2023D74
_0801CC04: .4byte gUnknown_81D9597
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
	ldr r1, _0801CC3C @ =gUnknown_2023D74
	ldr r0, _0801CC40 @ =gUnknown_81D95AF
	str r0, [r1]
	movs r0, 0x2
	str r0, [sp, 0xC]
	b _0801CDF6
	.align 2, 0
_0801CC38: .4byte gBattleMons
_0801CC3C: .4byte gUnknown_2023D74
_0801CC40: .4byte gUnknown_81D95AF
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
	ldr r1, _0801CC8C @ =gUnknown_82500C4
	bl StringCopy
	bl BattleScriptPushCursor
	ldr r1, _0801CC90 @ =gUnknown_2023E82
	movs r0, 0
	strb r0, [r1, 0x5]
	ldr r1, _0801CC94 @ =gUnknown_2023D74
	ldr r0, _0801CC98 @ =gUnknown_81D95C5
	str r0, [r1]
	movs r1, 0x2
	str r1, [sp, 0xC]
	b _0801CDF6
	.align 2, 0
_0801CC80: .4byte gBattleMons
_0801CC84: .4byte 0xfff0ffff
_0801CC88: .4byte gBattleTextBuff1
_0801CC8C: .4byte gUnknown_82500C4
_0801CC90: .4byte gUnknown_2023E82
_0801CC94: .4byte gUnknown_2023D74
_0801CC98: .4byte gUnknown_81D95C5
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
	ldr r1, _0801CD68 @ =gUnknown_8250094
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
	ldr r1, _0801CD70 @ =gUnknown_825009C
	bl StringCopy
_0801CCF4:
	ldr r0, [r6]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0801CD06
	ldr r0, _0801CD64 @ =gBattleTextBuff1
	ldr r1, _0801CD74 @ =gUnknown_82500A4
	bl StringCopy
_0801CD06:
	ldr r0, [r6]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0801CD18
	ldr r0, _0801CD64 @ =gBattleTextBuff1
	ldr r1, _0801CD78 @ =gUnknown_82500AC
	bl StringCopy
_0801CD18:
	ldr r0, [r6]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0801CD2A
	ldr r0, _0801CD64 @ =gBattleTextBuff1
	ldr r1, _0801CD7C @ =gUnknown_82500B4
	bl StringCopy
_0801CD2A:
	adds r5, r4
	ldr r0, [r5]
	mov r3, r8
	ands r0, r3
	cmp r0, 0
	beq _0801CD3E
	ldr r0, _0801CD64 @ =gBattleTextBuff1
	ldr r1, _0801CD80 @ =gUnknown_82500BC
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
	ldr r0, _0801CD84 @ =gUnknown_2023E82
	strb r4, [r0, 0x5]
	ldr r1, _0801CD88 @ =gUnknown_2023D74
	ldr r0, _0801CD8C @ =gUnknown_81D95C5
_0801CD58:
	str r0, [r1]
	movs r5, 0x1
	str r5, [sp, 0xC]
	b _0801CDF6
	.align 2, 0
_0801CD60: .4byte gBattleMons
_0801CD64: .4byte gBattleTextBuff1
_0801CD68: .4byte gUnknown_8250094
_0801CD6C: .4byte 0xf7ffffff
_0801CD70: .4byte gUnknown_825009C
_0801CD74: .4byte gUnknown_82500A4
_0801CD78: .4byte gUnknown_82500AC
_0801CD7C: .4byte gUnknown_82500B4
_0801CD80: .4byte gUnknown_82500BC
_0801CD84: .4byte gUnknown_2023E82
_0801CD88: .4byte gUnknown_2023D74
_0801CD8C: .4byte gUnknown_81D95C5
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
	ldr r1, _0801CDE8 @ =gUnknown_2023D74
	ldr r0, _0801CDEC @ =gUnknown_81D95DF
	str r0, [r1]
	b _0801CFA6
	.align 2, 0
_0801CDDC: .4byte gBattleMons
_0801CDE0: .4byte gBattleScripting
_0801CDE4: .4byte gPotentialItemEffectBattler
_0801CDE8: .4byte gUnknown_2023D74
_0801CDEC: .4byte gUnknown_81D95DF
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
	bl EmitSetMonData
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
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
	ldr r2, _0801CEF8 @ =gUnknown_2023ECC
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
	ldr r1, _0801CF0C @ =gUnknown_2023E82
	movs r0, 0x8
	strb r0, [r1, 0x3]
	bl BattleScriptPushCursor
	movs r0, 0
	movs r1, 0
	bl sub_801FF20
	bl BattleScriptPop
	b _0801CFA6
	.align 2, 0
_0801CEF4: .4byte gMoveResultFlags
_0801CEF8: .4byte gUnknown_2023ECC
_0801CEFC: .4byte gBattlerTarget
_0801CF00: .4byte gBattleMoves
_0801CF04: .4byte gCurrentMove
_0801CF08: .4byte gBattleMons
_0801CF0C: .4byte gUnknown_2023E82
_0801CF10:
	ldr r0, _0801CFB8 @ =gMoveResultFlags
	ldrb r0, [r0]
	movs r5, 0x29
	ands r5, r0
	cmp r5, 0
	bne _0801CFA6
	ldr r1, _0801CFBC @ =gUnknown_2023ECC
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
	ldr r0, _0801CFC8 @ =sBattler_AI
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
	ldr r0, _0801CFD0 @ =gUnknown_2023D68
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
	ldr r1, _0801CFDC @ =gUnknown_2023D74
	ldr r0, _0801CFE0 @ =gUnknown_81D9622
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
_0801CFBC: .4byte gUnknown_2023ECC
_0801CFC0: .4byte gBattlerTarget
_0801CFC4: .4byte 0x0000ffff
_0801CFC8: .4byte sBattler_AI
_0801CFCC: .4byte gBattleMons
_0801CFD0: .4byte gUnknown_2023D68
_0801CFD4: .4byte gPotentialItemEffectBattler
_0801CFD8: .4byte gBattleScripting
_0801CFDC: .4byte gUnknown_2023D74
_0801CFE0: .4byte gUnknown_81D9622
	thumb_func_end sub_801BC68

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

	thumb_func_start sub_801D030
sub_801D030: @ 801D030
	push {lr}
	ldr r0, _0801D050 @ =gUnknown_2023BC8
	ldr r0, [r0]
	cmp r0, 0
	bne _0801D04C
	ldr r1, _0801D054 @ =gUnknown_825011C
	ldr r0, _0801D058 @ =gUnknown_2023D74
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
_0801D050: .4byte gUnknown_2023BC8
_0801D054: .4byte gUnknown_825011C
_0801D058: .4byte gUnknown_2023D74
	thumb_func_end sub_801D030

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
	ldr r0, _0801D284 @ =sBattler_AI
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
	ldr r0, _0801D284 @ =sBattler_AI
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
	ldr r6, _0801D284 @ =sBattler_AI
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
	bl sub_80C71D0
	ldr r1, _0801D2A0 @ =gUnknown_2023ECC
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	orrs r1, r4
	strb r1, [r0]
	b _0801D39C
	.align 2, 0
_0801D284: .4byte sBattler_AI
_0801D288: .4byte gSideTimers
_0801D28C: .4byte gBattleMons
_0801D290: .4byte gBattlersCount
_0801D294: .4byte gAbsentBattlerFlags
_0801D298: .4byte gBitTable
_0801D29C: .4byte gBattleMoves
_0801D2A0: .4byte gUnknown_2023ECC
_0801D2A4:
	ldr r0, _0801D2B8 @ =sBattler_AI
	ldrb r0, [r0]
	bl GetBattlerPosition
	adds r1, r0, 0
	movs r2, 0x1
	movs r0, 0x1
	ands r0, r1
	eors r0, r2
	b _0801D34E
	.align 2, 0
_0801D2B8: .4byte sBattler_AI
_0801D2BC:
	ldr r0, _0801D2F0 @ =sBattler_AI
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
_0801D2F0: .4byte sBattler_AI
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
	ldr r0, _0801D334 @ =sBattler_AI
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
_0801D334: .4byte sBattler_AI
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
	ldr r0, _0801D394 @ =sBattler_AI
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
_0801D394: .4byte sBattler_AI
_0801D398:
	ldr r0, _0801D3B8 @ =sBattler_AI
	ldrb r5, [r0]
_0801D39C:
	ldr r0, _0801D3B8 @ =sBattler_AI
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
_0801D3B8: .4byte sBattler_AI
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

	thumb_func_start sub_801D438
sub_801D438: @ 801D438
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
	ldr r4, _0801D500 @ =sBattler_AI
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
	ldr r0, _0801D500 @ =sBattler_AI
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
_0801D500: .4byte sBattler_AI
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
	ldr r1, _0801D55C @ =gUnknown_2023D74
	ldr r0, _0801D560 @ =gUnknown_81D94DA
	b _0801D6E2
	.align 2, 0
_0801D554: .4byte gCurrentMove
_0801D558: .4byte 0xff7fffff
_0801D55C: .4byte gUnknown_2023D74
_0801D560: .4byte gUnknown_81D94DA
_0801D564:
	bl Random
	movs r1, 0xFF
	ands r1, r0
	ldr r2, _0801D608 @ =gBattleMons
	ldr r0, _0801D60C @ =sBattler_AI
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
	ldr r1, _0801D60C @ =sBattler_AI
	ldrb r2, [r1]
	movs r1, 0x58
	muls r1, r2
	adds r0, r1
	adds r3, 0xC
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r4]
	ldr r1, _0801D624 @ =gUnknown_2023D74
	ldr r0, _0801D628 @ =gUnknown_81D94EA
	str r0, [r1]
	ldrh r0, [r4]
	movs r1, 0
	bl GetMoveTarget
	ldr r1, _0801D62C @ =gBattlerTarget
	strb r0, [r1]
	ldr r2, _0801D630 @ =gUnknown_2023DD0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 14
	b _0801D732
	.align 2, 0
_0801D608: .4byte gBattleMons
_0801D60C: .4byte sBattler_AI
_0801D610: .4byte gCurrentMove
_0801D614: .4byte gBitTable
_0801D618: .4byte gUnknown_2023D48
_0801D61C: .4byte gUnknown_2023D49
_0801D620: .4byte gUnknown_2023D4E
_0801D624: .4byte gUnknown_2023D74
_0801D628: .4byte gUnknown_81D94EA
_0801D62C: .4byte gBattlerTarget
_0801D630: .4byte gUnknown_2023DD0
_0801D634:
	ldr r5, _0801D6B8 @ =gBattleMons
	ldr r2, _0801D6BC @ =sBattler_AI
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
	ldr r1, _0801D6C4 @ =gUnknown_2023D74
	ldr r0, _0801D6C8 @ =gUnknown_81D9504
	b _0801D6E2
	.align 2, 0
_0801D6B8: .4byte gBattleMons
_0801D6BC: .4byte sBattler_AI
_0801D6C0: .4byte gBattlersCount
_0801D6C4: .4byte gUnknown_2023D74
_0801D6C8: .4byte gUnknown_81D9504
_0801D6CC:
	subs r4, r6
	cmp r4, r6
	blt _0801D6F4
_0801D6D2:
	bl Random
	ldr r2, _0801D6E8 @ =gUnknown_2023E82
	movs r1, 0x3
	ands r1, r0
	strb r1, [r2, 0x5]
	ldr r1, _0801D6EC @ =gUnknown_2023D74
	ldr r0, _0801D6F0 @ =gUnknown_81D94F2
_0801D6E2:
	str r0, [r1]
	movs r0, 0x1
	b _0801D738
	.align 2, 0
_0801D6E8: .4byte gUnknown_2023E82
_0801D6EC: .4byte gUnknown_2023D74
_0801D6F0: .4byte gUnknown_81D94F2
_0801D6F4:
	ldr r4, _0801D744 @ =sBattler_AI
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
	ldr r1, _0801D754 @ =gUnknown_2023D74
	ldr r0, _0801D758 @ =gUnknown_81D951B
	str r0, [r1]
	ldr r2, _0801D75C @ =gUnknown_2023DD0
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
_0801D744: .4byte sBattler_AI
_0801D748: .4byte gBattleMons
_0801D74C: .4byte gBattleMoveDamage
_0801D750: .4byte gBattlerTarget
_0801D754: .4byte gUnknown_2023D74
_0801D758: .4byte gUnknown_81D951B
_0801D75C: .4byte gUnknown_2023DD0
	thumb_func_end sub_801D438

	.align 2, 0 @ Don't pad with nop.
