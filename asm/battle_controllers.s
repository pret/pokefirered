	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_800D230
sub_800D230: @ 800D230
	push {lr}
	ldr r0, _0800D268 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0800D262
	ldr r0, _0800D26C @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800D24A
	bl sub_800B1F4
_0800D24A:
	ldr r0, _0800D270 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800D256
	bl sub_8009804
_0800D256:
	ldr r0, _0800D274 @ =sub_8081A90
	movs r1, 0
	bl CreateTask
	bl CreateTasksForSendRecvLinkBuffers
_0800D262:
	pop {r0}
	bx r0
	.align 2, 0
_0800D268: .4byte gBattleTypeFlags
_0800D26C: .4byte gWirelessCommType
_0800D270: .4byte gReceivedRemoteLinkPlayers
_0800D274: .4byte sub_8081A90
	thumb_func_end sub_800D230

	thumb_func_start sub_800D278
sub_800D278: @ 800D278
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r1, _0800D2E4 @ =gUnknown_3004F84
	ldr r0, _0800D2E8 @ =nullsub_12
	str r0, [r1]
	movs r2, 0
	ldr r0, _0800D2EC @ =nullsub_13
	mov r8, r0
	movs r3, 0
	ldr r1, _0800D2F0 @ =gBattlerControllerFuncs
	mov r12, r1
	ldr r7, _0800D2F4 @ =gBattlerPositions
	movs r6, 0xFF
	ldr r5, _0800D2F8 @ =gActionSelectionCursor
	ldr r4, _0800D2FC @ =gUnknown_2023FFC
_0800D298:
	mov r0, r8
	mov r1, r12
	adds r1, 0x4
	mov r12, r1
	subs r1, 0x4
	stm r1!, {r0}
	adds r1, r2, r7
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	adds r0, r2, r5
	strb r3, [r0]
	adds r0, r2, r4
	strb r3, [r0]
	adds r2, 0x1
	cmp r2, 0x3
	ble _0800D298
	bl sub_800D230
	ldr r0, _0800D300 @ =gBattleControllerExecFlags
	movs r4, 0
	str r4, [r0]
	bl ClearBattleAnimationVars
	bl ClearBattleMonForms
	bl BattleAI_HandleItemUseBeforeAISetup
	ldr r0, _0800D304 @ =gUnknown_2022B54
	str r4, [r0]
	ldr r0, _0800D308 @ =gUnknown_2023DDC
	strb r4, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800D2E4: .4byte gUnknown_3004F84
_0800D2E8: .4byte nullsub_12
_0800D2EC: .4byte nullsub_13
_0800D2F0: .4byte gBattlerControllerFuncs
_0800D2F4: .4byte gBattlerPositions
_0800D2F8: .4byte gActionSelectionCursor
_0800D2FC: .4byte gUnknown_2023FFC
_0800D300: .4byte gBattleControllerExecFlags
_0800D304: .4byte gUnknown_2022B54
_0800D308: .4byte gUnknown_2023DDC
	thumb_func_end sub_800D278

	thumb_func_start sub_800D30C
sub_800D30C: @ 800D30C
	push {r4,r5,lr}
	ldr r0, _0800D320 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0800D324
	bl sub_800D494
	b _0800D328
	.align 2, 0
_0800D320: .4byte gBattleTypeFlags
_0800D324:
	bl sub_800D364
_0800D328:
	bl sub_800D768
	ldr r0, _0800D35C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0800D356
	movs r4, 0
	ldr r0, _0800D360 @ =gBattlersCount
	ldrb r1, [r0]
	cmp r4, r1
	bge _0800D356
	adds r5, r0, 0
_0800D344:
	lsls r0, r4, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8127DA8
	adds r4, 0x1
	ldrb r0, [r5]
	cmp r4, r0
	blt _0800D344
_0800D356:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D35C: .4byte gBattleTypeFlags
_0800D360: .4byte gBattlersCount
	thumb_func_end sub_800D30C

	thumb_func_start sub_800D364
sub_800D364: @ 800D364
	push {r4,lr}
	ldr r0, _0800D398 @ =gBattleTypeFlags
	ldr r2, [r0]
	movs r4, 0x1
	adds r3, r2, 0
	ands r3, r4
	cmp r3, 0
	bne _0800D414
	ldr r1, _0800D39C @ =gUnknown_3004F84
	ldr r0, _0800D3A0 @ =sub_80123C0
	str r0, [r1]
	movs r0, 0x80
	lsls r0, 9
	ands r0, r2
	cmp r0, 0
	beq _0800D3B4
	ldr r2, _0800D3A4 @ =gBattlerControllerFuncs
	ldr r1, _0800D3A8 @ =sub_81560A4
	str r1, [r2]
	ldr r0, _0800D3AC @ =gBattlerPositions
	strb r3, [r0]
	str r1, [r2, 0x4]
	strb r4, [r0, 0x1]
	ldr r1, _0800D3B0 @ =gBattlersCount
	movs r0, 0x2
	b _0800D478
	.align 2, 0
_0800D398: .4byte gBattleTypeFlags
_0800D39C: .4byte gUnknown_3004F84
_0800D3A0: .4byte sub_80123C0
_0800D3A4: .4byte gBattlerControllerFuncs
_0800D3A8: .4byte sub_81560A4
_0800D3AC: .4byte gBattlerPositions
_0800D3B0: .4byte gBattlersCount
_0800D3B4:
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _0800D3CC
	ldr r1, _0800D3C4 @ =gBattlerControllerFuncs
	ldr r0, _0800D3C8 @ =SetControllerToSafari
	b _0800D3E8
	.align 2, 0
_0800D3C4: .4byte gBattlerControllerFuncs
_0800D3C8: .4byte SetControllerToSafari
_0800D3CC:
	movs r0, 0x84
	lsls r0, 2
	ands r2, r0
	cmp r2, 0
	beq _0800D3E4
	ldr r1, _0800D3DC @ =gBattlerControllerFuncs
	ldr r0, _0800D3E0 @ =sub_80E75B0
	b _0800D3E8
	.align 2, 0
_0800D3DC: .4byte gBattlerControllerFuncs
_0800D3E0: .4byte sub_80E75B0
_0800D3E4:
	ldr r1, _0800D400 @ =gBattlerControllerFuncs
	ldr r0, _0800D404 @ =SetBankFuncToPlayerBufferRunCommand
_0800D3E8:
	str r0, [r1]
	adds r2, r1, 0
	ldr r1, _0800D408 @ =gBattlerPositions
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0800D40C @ =sub_8035A7C
	str r0, [r2, 0x4]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	ldr r1, _0800D410 @ =gBattlersCount
	movs r0, 0x2
	b _0800D478
	.align 2, 0
_0800D400: .4byte gBattlerControllerFuncs
_0800D404: .4byte SetBankFuncToPlayerBufferRunCommand
_0800D408: .4byte gBattlerPositions
_0800D40C: .4byte sub_8035A7C
_0800D410: .4byte gBattlersCount
_0800D414:
	ldr r1, _0800D444 @ =gUnknown_3004F84
	ldr r0, _0800D448 @ =sub_80123C0
	str r0, [r1]
	movs r3, 0x80
	lsls r3, 9
	ands r3, r2
	cmp r3, 0
	beq _0800D458
	ldr r3, _0800D44C @ =gBattlerControllerFuncs
	ldr r1, _0800D450 @ =sub_81560A4
	str r1, [r3]
	ldr r2, _0800D454 @ =gBattlerPositions
	movs r0, 0
	strb r0, [r2]
	str r1, [r3, 0x4]
	strb r4, [r2, 0x1]
	str r1, [r3, 0x8]
	movs r0, 0x2
	strb r0, [r2, 0x2]
	str r1, [r3, 0xC]
	movs r0, 0x3
	strb r0, [r2, 0x3]
	b _0800D474
	.align 2, 0
_0800D444: .4byte gUnknown_3004F84
_0800D448: .4byte sub_80123C0
_0800D44C: .4byte gBattlerControllerFuncs
_0800D450: .4byte sub_81560A4
_0800D454: .4byte gBattlerPositions
_0800D458:
	ldr r2, _0800D480 @ =gBattlerControllerFuncs
	ldr r0, _0800D484 @ =SetBankFuncToPlayerBufferRunCommand
	str r0, [r2]
	ldr r1, _0800D488 @ =gBattlerPositions
	strb r3, [r1]
	ldr r3, _0800D48C @ =sub_8035A7C
	str r3, [r2, 0x4]
	strb r4, [r1, 0x1]
	str r0, [r2, 0x8]
	movs r0, 0x2
	strb r0, [r1, 0x2]
	str r3, [r2, 0xC]
	movs r0, 0x3
	strb r0, [r1, 0x3]
_0800D474:
	ldr r1, _0800D490 @ =gBattlersCount
	movs r0, 0x4
_0800D478:
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D480: .4byte gBattlerControllerFuncs
_0800D484: .4byte SetBankFuncToPlayerBufferRunCommand
_0800D488: .4byte gBattlerPositions
_0800D48C: .4byte sub_8035A7C
_0800D490: .4byte gBattlersCount
	thumb_func_end sub_800D364

	thumb_func_start sub_800D494
sub_800D494: @ 800D494
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, _0800D4D0 @ =gBattleTypeFlags
	ldr r0, [r4]
	movs r5, 0x1
	adds r3, r0, 0
	ands r3, r5
	cmp r3, 0
	bne _0800D51C
	movs r4, 0x4
	ands r4, r0
	cmp r4, 0
	beq _0800D4F0
	ldr r1, _0800D4D4 @ =gUnknown_3004F84
	ldr r0, _0800D4D8 @ =sub_80123C0
	str r0, [r1]
	ldr r2, _0800D4DC @ =gBattlerControllerFuncs
	ldr r0, _0800D4E0 @ =SetBankFuncToPlayerBufferRunCommand
	str r0, [r2]
	ldr r1, _0800D4E4 @ =gBattlerPositions
	strb r3, [r1]
	ldr r0, _0800D4E8 @ =sub_803A668
	str r0, [r2, 0x4]
	strb r5, [r1, 0x1]
	ldr r1, _0800D4EC @ =gBattlersCount
	movs r0, 0x2
	b _0800D752
	.align 2, 0
_0800D4D0: .4byte gBattleTypeFlags
_0800D4D4: .4byte gUnknown_3004F84
_0800D4D8: .4byte sub_80123C0
_0800D4DC: .4byte gBattlerControllerFuncs
_0800D4E0: .4byte SetBankFuncToPlayerBufferRunCommand
_0800D4E4: .4byte gBattlerPositions
_0800D4E8: .4byte sub_803A668
_0800D4EC: .4byte gBattlersCount
_0800D4F0:
	ldr r2, _0800D508 @ =gBattlerControllerFuncs
	ldr r0, _0800D50C @ =SetBankFuncToPlayerBufferRunCommand
	str r0, [r2, 0x4]
	ldr r1, _0800D510 @ =gBattlerPositions
	strb r4, [r1, 0x1]
	ldr r0, _0800D514 @ =sub_803A668
	str r0, [r2]
	strb r5, [r1]
	ldr r1, _0800D518 @ =gBattlersCount
	movs r0, 0x2
	b _0800D752
	.align 2, 0
_0800D508: .4byte gBattlerControllerFuncs
_0800D50C: .4byte SetBankFuncToPlayerBufferRunCommand
_0800D510: .4byte gBattlerPositions
_0800D514: .4byte sub_803A668
_0800D518: .4byte gBattlersCount
_0800D51C:
	movs r5, 0x41
	ands r5, r0
	cmp r5, 0x1
	bne _0800D5A4
	movs r6, 0x4
	adds r3, r6, 0
	ands r3, r0
	cmp r3, 0
	beq _0800D56C
	ldr r1, _0800D554 @ =gUnknown_3004F84
	ldr r0, _0800D558 @ =sub_80123C0
	str r0, [r1]
	ldr r2, _0800D55C @ =gBattlerControllerFuncs
	ldr r4, _0800D560 @ =SetBankFuncToPlayerBufferRunCommand
	str r4, [r2]
	ldr r1, _0800D564 @ =gBattlerPositions
	movs r0, 0
	strb r0, [r1]
	ldr r3, _0800D568 @ =sub_803A668
	str r3, [r2, 0x4]
	strb r5, [r1, 0x1]
	str r4, [r2, 0x8]
	movs r0, 0x2
	strb r0, [r1, 0x2]
	str r3, [r2, 0xC]
	movs r0, 0x3
	strb r0, [r1, 0x3]
	b _0800D588
	.align 2, 0
_0800D554: .4byte gUnknown_3004F84
_0800D558: .4byte sub_80123C0
_0800D55C: .4byte gBattlerControllerFuncs
_0800D560: .4byte SetBankFuncToPlayerBufferRunCommand
_0800D564: .4byte gBattlerPositions
_0800D568: .4byte sub_803A668
_0800D56C:
	ldr r2, _0800D590 @ =gBattlerControllerFuncs
	ldr r0, _0800D594 @ =SetBankFuncToPlayerBufferRunCommand
	str r0, [r2, 0x4]
	ldr r1, _0800D598 @ =gBattlerPositions
	strb r3, [r1, 0x1]
	ldr r3, _0800D59C @ =sub_803A668
	str r3, [r2]
	strb r5, [r1]
	str r0, [r2, 0xC]
	movs r0, 0x2
	strb r0, [r1, 0x3]
	str r3, [r2, 0x8]
	movs r0, 0x3
	strb r0, [r1, 0x2]
_0800D588:
	ldr r0, _0800D5A0 @ =gBattlersCount
	strb r6, [r0]
	b _0800D754
	.align 2, 0
_0800D590: .4byte gBattlerControllerFuncs
_0800D594: .4byte SetBankFuncToPlayerBufferRunCommand
_0800D598: .4byte gBattlerPositions
_0800D59C: .4byte sub_803A668
_0800D5A0: .4byte gBattlersCount
_0800D5A4:
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, [r4]
	movs r1, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0800D5BC
	ldr r1, _0800D5E4 @ =gUnknown_3004F84
	ldr r0, _0800D5E8 @ =sub_80123C0
	str r0, [r1]
_0800D5BC:
	movs r0, 0
	mov r10, r0
	ldr r1, _0800D5EC @ =gLinkPlayers
	mov r12, r1
	ldr r7, _0800D5F0 @ =gBattlerPositions
	mov r8, r0
	ldr r6, _0800D5F4 @ =gBattlerPartyIndexes
	movs r4, 0
	movs r2, 0x3
	mov r9, r2
_0800D5D0:
	mov r1, r12
	adds r0, r4, r1
	ldrh r0, [r0, 0x18]
	cmp r0, 0x2
	bgt _0800D5F8
	cmp r0, 0x1
	bge _0800D610
	cmp r0, 0
	beq _0800D5FC
	b _0800D61A
	.align 2, 0
_0800D5E4: .4byte gUnknown_3004F84
_0800D5E8: .4byte sub_80123C0
_0800D5EC: .4byte gLinkPlayers
_0800D5F0: .4byte gBattlerPositions
_0800D5F4: .4byte gBattlerPartyIndexes
_0800D5F8:
	cmp r0, 0x3
	bne _0800D61A
_0800D5FC:
	ldr r0, _0800D60C @ =gLinkPlayers
	adds r0, r4, r0
	ldrb r0, [r0, 0x18]
	movs r1, 0
	bl sub_8127DA8
	b _0800D61A
	.align 2, 0
_0800D60C: .4byte gLinkPlayers
_0800D610:
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl sub_8127DA8
_0800D61A:
	cmp r10, r5
	bne _0800D66A
	ldr r0, _0800D640 @ =gLinkPlayers
	adds r3, r4, r0
	ldrh r1, [r3, 0x18]
	lsls r1, 2
	ldr r2, _0800D644 @ =gBattlerControllerFuncs
	adds r1, r2
	ldr r2, _0800D648 @ =SetBankFuncToPlayerBufferRunCommand
	str r2, [r1]
	ldrh r1, [r3, 0x18]
	mov r12, r0
	cmp r1, 0x2
	bgt _0800D64C
	cmp r1, 0x1
	bge _0800D660
	cmp r1, 0
	beq _0800D650
	b _0800D740
	.align 2, 0
_0800D640: .4byte gLinkPlayers
_0800D644: .4byte gBattlerControllerFuncs
_0800D648: .4byte SetBankFuncToPlayerBufferRunCommand
_0800D64C:
	cmp r1, 0x3
	bne _0800D740
_0800D650:
	mov r1, r12
	adds r0, r4, r1
	ldrh r1, [r0, 0x18]
	adds r1, r7
	mov r2, r8
	strb r2, [r1]
	ldrh r0, [r0, 0x18]
	b _0800D726
_0800D660:
	adds r1, r7
	movs r0, 0x2
	strb r0, [r1]
	ldrh r0, [r3, 0x18]
	b _0800D738
_0800D66A:
	ldr r2, _0800D690 @ =gLinkPlayers
	adds r0, r4, r2
	ldrh r1, [r0, 0x18]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	mov r12, r2
	cmp r0, 0
	bne _0800D694
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	add r0, r12
	ldrh r1, [r0, 0x18]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0800D6A6
	b _0800D6EC
	.align 2, 0
_0800D690: .4byte gLinkPlayers
_0800D694:
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	add r0, r12
	ldrh r1, [r0, 0x18]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0800D6EC
_0800D6A6:
	mov r0, r12
	adds r2, r4, r0
	ldrh r0, [r2, 0x18]
	lsls r0, 2
	ldr r1, _0800D6C8 @ =gBattlerControllerFuncs
	adds r0, r1
	ldr r1, _0800D6CC @ =sub_80D4204
	str r1, [r0]
	ldrh r1, [r2, 0x18]
	cmp r1, 0x2
	bgt _0800D6D0
	cmp r1, 0x1
	bge _0800D6E4
	cmp r1, 0
	beq _0800D6D4
	b _0800D740
	.align 2, 0
_0800D6C8: .4byte gBattlerControllerFuncs
_0800D6CC: .4byte sub_80D4204
_0800D6D0:
	cmp r1, 0x3
	bne _0800D740
_0800D6D4:
	mov r2, r12
	adds r0, r4, r2
	ldrh r1, [r0, 0x18]
	adds r1, r7
	mov r2, r8
	strb r2, [r1]
	ldrh r0, [r0, 0x18]
	b _0800D726
_0800D6E4:
	adds r1, r7
	movs r0, 0x2
	strb r0, [r1]
	b _0800D736
_0800D6EC:
	mov r0, r12
	adds r2, r4, r0
	ldrh r0, [r2, 0x18]
	lsls r0, 2
	ldr r1, _0800D70C @ =gBattlerControllerFuncs
	adds r0, r1
	ldr r1, _0800D710 @ =sub_803A668
	str r1, [r0]
	ldrh r0, [r2, 0x18]
	cmp r0, 0x2
	bgt _0800D714
	cmp r0, 0x1
	bge _0800D730
	cmp r0, 0
	beq _0800D718
	b _0800D740
	.align 2, 0
_0800D70C: .4byte gBattlerControllerFuncs
_0800D710: .4byte sub_803A668
_0800D714:
	cmp r0, 0x3
	bne _0800D740
_0800D718:
	mov r0, r12
	adds r2, r4, r0
	ldrh r0, [r2, 0x18]
	adds r0, r7
	movs r1, 0x1
	strb r1, [r0]
	ldrh r0, [r2, 0x18]
_0800D726:
	lsls r0, 1
	adds r0, r6
	mov r1, r8
	strh r1, [r0]
	b _0800D740
_0800D730:
	adds r0, r7
	mov r1, r9
	strb r1, [r0]
_0800D736:
	ldrh r0, [r2, 0x18]
_0800D738:
	lsls r0, 1
	adds r0, r6
	mov r2, r9
	strh r2, [r0]
_0800D740:
	adds r4, 0x1C
	movs r0, 0x1
	add r10, r0
	mov r1, r10
	cmp r1, 0x3
	bgt _0800D74E
	b _0800D5D0
_0800D74E:
	ldr r1, _0800D764 @ =gBattlersCount
	movs r0, 0x4
_0800D752:
	strb r0, [r1]
_0800D754:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800D764: .4byte gBattlersCount
	thumb_func_end sub_800D494

	thumb_func_start sub_800D768
sub_800D768: @ 800D768
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _0800D788 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0800D780
	b _0800D89C
_0800D780:
	movs r0, 0
	mov r8, r0
	b _0800D892
	.align 2, 0
_0800D788: .4byte gBattleTypeFlags
_0800D78C:
	movs r5, 0
	movs r0, 0x1
	add r0, r8
	mov r10, r0
	ldr r0, _0800D7B8 @ =gBattlerPositions
	add r0, r8
	mov r9, r0
	mov r0, r8
	lsls r6, r0, 1
	movs r7, 0
_0800D7A0:
	mov r0, r8
	cmp r0, 0x1
	bgt _0800D808
	mov r0, r9
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0800D7C0
	ldr r0, _0800D7BC @ =gPlayerParty
	b _0800D7C2
	.align 2, 0
_0800D7B8: .4byte gBattlerPositions
_0800D7BC: .4byte gPlayerParty
_0800D7C0:
	ldr r0, _0800D800 @ =gEnemyParty
_0800D7C2:
	adds r4, r7, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0800D888
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _0800D888
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0800D888
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0800D888
	ldr r0, _0800D804 @ =gBattlerPartyIndexes
	adds r0, r6, r0
	strh r5, [r0]
	b _0800D890
	.align 2, 0
_0800D800: .4byte gEnemyParty
_0800D804: .4byte gBattlerPartyIndexes
_0800D808:
	mov r0, r9
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0800D830
	ldr r0, _0800D82C @ =gPlayerParty
	adds r4, r7, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0800D888
	adds r0, r4, 0
	movs r1, 0xB
	b _0800D844
	.align 2, 0
_0800D82C: .4byte gPlayerParty
_0800D830:
	ldr r0, _0800D880 @ =gEnemyParty
	adds r4, r7, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0800D888
	adds r0, r4, 0
	movs r1, 0x41
_0800D844:
	bl GetMonData
	cmp r0, 0
	beq _0800D888
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0800D888
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0800D888
	ldr r1, _0800D884 @ =gBattlerPartyIndexes
	mov r0, r8
	subs r0, 0x2
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r5
	beq _0800D888
	adds r0, r6, r1
	strh r5, [r0]
	b _0800D890
	.align 2, 0
_0800D880: .4byte gEnemyParty
_0800D884: .4byte gBattlerPartyIndexes
_0800D888:
	adds r7, 0x64
	adds r5, 0x1
	cmp r5, 0x5
	ble _0800D7A0
_0800D890:
	mov r8, r10
_0800D892:
	ldr r0, _0800D8AC @ =gBattlersCount
	ldrb r0, [r0]
	cmp r8, r0
	bge _0800D89C
	b _0800D78C
_0800D89C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800D8AC: .4byte gBattlersCount
	thumb_func_end sub_800D768

	thumb_func_start PrepareBufferDataTransfer
PrepareBufferDataTransfer: @ 800D8B0
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r3, r0, 24
	adds r5, r3, 0
	lsls r2, 16
	lsrs r2, 16
	ldr r0, _0800D8D8 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0800D8DC
	adds r0, r3, 0
	adds r1, r2, 0
	adds r2, r4, 0
	bl PrepareBufferDataTransferLink
	b _0800D92E
	.align 2, 0
_0800D8D8: .4byte gBattleTypeFlags
_0800D8DC:
	cmp r5, 0
	beq _0800D8E6
	cmp r5, 0x1
	beq _0800D910
	b _0800D92E
_0800D8E6:
	movs r3, 0
	cmp r3, r2
	bge _0800D92E
	ldr r6, _0800D908 @ =gBattleBufferA
	ldr r5, _0800D90C @ =gActiveBattler
_0800D8F0:
	ldrb r0, [r5]
	lsls r0, 9
	adds r0, r3, r0
	adds r0, r6
	ldrb r1, [r4]
	strb r1, [r0]
	adds r4, 0x1
	adds r3, 0x1
	cmp r3, r2
	blt _0800D8F0
	b _0800D92E
	.align 2, 0
_0800D908: .4byte gBattleBufferA
_0800D90C: .4byte gActiveBattler
_0800D910:
	movs r3, 0
	cmp r3, r2
	bge _0800D92E
	ldr r6, _0800D934 @ =gUnknown_20233C4
	ldr r5, _0800D938 @ =gActiveBattler
_0800D91A:
	ldrb r0, [r5]
	lsls r0, 9
	adds r0, r3, r0
	adds r0, r6
	ldrb r1, [r4]
	strb r1, [r0]
	adds r4, 0x1
	adds r3, 0x1
	cmp r3, r2
	blt _0800D91A
_0800D92E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800D934: .4byte gUnknown_20233C4
_0800D938: .4byte gActiveBattler
	thumb_func_end PrepareBufferDataTransfer

	thumb_func_start CreateTasksForSendRecvLinkBuffers
CreateTasksForSendRecvLinkBuffers: @ 800D93C
	push {r4-r6,lr}
	ldr r0, _0800D9D4 @ =sub_800DB6C
	movs r1, 0
	bl CreateTask
	ldr r2, _0800D9D8 @ =gUnknown_202286C
	strb r0, [r2]
	ldr r5, _0800D9DC @ =gTasks
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r6, 0
	movs r4, 0
	strh r4, [r0, 0x1E]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x20]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x22]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x24]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x26]
	ldr r0, _0800D9E0 @ =Task_HandleCopyReceivedLinkBuffersData
	movs r1, 0
	bl CreateTask
	ldr r2, _0800D9E4 @ =gUnknown_202286D
	strb r0, [r2]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x20]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x22]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x24]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x26]
	ldr r0, _0800D9E8 @ =gUnknown_202286E
	strb r6, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800D9D4: .4byte sub_800DB6C
_0800D9D8: .4byte gUnknown_202286C
_0800D9DC: .4byte gTasks
_0800D9E0: .4byte Task_HandleCopyReceivedLinkBuffersData
_0800D9E4: .4byte gUnknown_202286D
_0800D9E8: .4byte gUnknown_202286E
	thumb_func_end CreateTasksForSendRecvLinkBuffers

	thumb_func_start PrepareBufferDataTransferLink
PrepareBufferDataTransferLink: @ 800D9EC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r2
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r1, 16
	mov r12, r1
	movs r1, 0x3
	mov r0, r12
	bics r0, r1
	adds r0, 0x4
	mov r8, r0
	ldr r2, _0800DB4C @ =gTasks
	ldr r3, _0800DB50 @ =gUnknown_202286C
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r4, r0, r2
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	add r0, r8
	adds r0, 0x9
	movs r1, 0x80
	lsls r1, 5
	adds r5, r2, 0
	cmp r0, r1
	ble _0800DA3E
	ldrh r0, [r4, 0x24]
	movs r2, 0
	strh r0, [r4, 0x20]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r2, [r0, 0x24]
_0800DA3E:
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r2, 0x24
	ldrsh r1, [r0, r2]
	ldr r4, _0800DB54 @ =gUnknown_2023FEC
	ldr r0, [r4]
	adds r0, r1
	strb r6, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r7, 0x24
	ldrsh r1, [r0, r7]
	ldr r0, [r4]
	adds r1, r0
	ldr r0, _0800DB58 @ =gActiveBattler
	ldrb r0, [r0]
	strb r0, [r1, 0x1]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r2, 0x24
	ldrsh r1, [r0, r2]
	ldr r0, [r4]
	adds r1, r0
	ldr r0, _0800DB5C @ =sBattler_AI
	ldrb r0, [r0]
	strb r0, [r1, 0x2]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r7, 0x24
	ldrsh r1, [r0, r7]
	ldr r0, [r4]
	adds r1, r0
	ldr r0, _0800DB60 @ =gBattlerTarget
	ldrb r0, [r0]
	strb r0, [r1, 0x3]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r1, 0x24
	ldrsh r0, [r0, r1]
	ldr r1, [r4]
	adds r0, r1
	mov r2, r8
	strb r2, [r0, 0x4]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r7, 0x24
	ldrsh r1, [r0, r7]
	ldr r0, [r4]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	mov r2, r8
	ands r0, r2
	asrs r0, 8
	strb r0, [r1, 0x5]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r7, 0x24
	ldrsh r1, [r0, r7]
	ldr r0, [r4]
	adds r1, r0
	ldr r0, _0800DB64 @ =gAbsentBattlerFlags
	ldrb r0, [r0]
	strb r0, [r1, 0x6]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r2, 0x24
	ldrsh r1, [r0, r2]
	ldr r0, [r4]
	adds r1, r0
	ldr r0, _0800DB68 @ =gUnknown_2023D6E
	ldrb r0, [r0]
	strb r0, [r1, 0x7]
	movs r2, 0
	cmp r2, r12
	bge _0800DB2C
	mov r10, r5
	adds r6, r3, 0
_0800DB0A:
	ldrb r1, [r6]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	add r0, r10
	movs r7, 0x24
	ldrsh r1, [r0, r7]
	ldr r0, [r4]
	adds r1, r2, r1
	adds r1, r0
	mov r7, r9
	adds r0, r7, r2
	ldrb r0, [r0]
	strb r0, [r1, 0x8]
	adds r2, 0x1
	cmp r2, r12
	blt _0800DB0A
_0800DB2C:
	ldrb r0, [r3]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r5
	ldrh r0, [r1, 0x24]
	add r0, r8
	adds r0, 0x8
	strh r0, [r1, 0x24]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800DB4C: .4byte gTasks
_0800DB50: .4byte gUnknown_202286C
_0800DB54: .4byte gUnknown_2023FEC
_0800DB58: .4byte gActiveBattler
_0800DB5C: .4byte sBattler_AI
_0800DB60: .4byte gBattlerTarget
_0800DB64: .4byte gAbsentBattlerFlags
_0800DB68: .4byte gUnknown_2023D6E
	thumb_func_end PrepareBufferDataTransferLink

	thumb_func_start sub_800DB6C
sub_800DB6C: @ 800DB6C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0800DB94 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x1E
	ldrsh r0, [r0, r2]
	adds r7, r1, 0
	cmp r0, 0x5
	bls _0800DB88
	b _0800DD20
_0800DB88:
	lsls r0, 2
	ldr r1, _0800DB98 @ =_0800DB9C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800DB94: .4byte gTasks
_0800DB98: .4byte _0800DB9C
	.align 2, 0
_0800DB9C:
	.4byte _0800DBB4
	.4byte _0800DBC8
	.4byte _0800DBF4
	.4byte _0800DC50
	.4byte _0800DCC6
	.4byte _0800DD04
_0800DBB4:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r7
	movs r1, 0x64
	strh r1, [r0, 0x1C]
	ldrh r1, [r0, 0x1E]
	adds r1, 0x1
	strh r1, [r0, 0x1E]
	b _0800DD20
_0800DBC8:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r7
	ldrh r0, [r1, 0x1C]
	subs r0, 0x1
	strh r0, [r1, 0x1C]
	lsls r0, 16
	cmp r0, 0
	beq _0800DBDE
	b _0800DD20
_0800DBDE:
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	strh r0, [r1, 0x1E]
	ldr r0, _0800DBF0 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800DBEE
	b _0800DD20
_0800DBEE:
	b _0800DD1C
	.align 2, 0
_0800DBF0: .4byte gReceivedRemoteLinkPlayers
_0800DBF4:
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0800DC10 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0800DC14
	cmp r2, 0x3
	bgt _0800DC1A
	b _0800DD20
	.align 2, 0
_0800DC10: .4byte gBattleTypeFlags
_0800DC14:
	cmp r2, 0x1
	bgt _0800DC1A
	b _0800DD20
_0800DC1A:
	bl sub_800AA48
	lsls r0, 24
	cmp r0, 0
	beq _0800DC3C
	bl sub_800A5BC
	ldr r0, _0800DC38 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	b _0800DD1E
	.align 2, 0
_0800DC38: .4byte gTasks
_0800DC3C:
	ldr r0, _0800DC4C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	b _0800DD1E
	.align 2, 0
_0800DC4C: .4byte gTasks
_0800DC50:
	lsls r1, r4, 2
	adds r0, r1, r4
	lsls r0, 3
	adds r2, r0, r7
	movs r3, 0x26
	ldrsh r5, [r2, r3]
	movs r0, 0x24
	ldrsh r6, [r2, r0]
	mov r12, r6
	cmp r5, r12
	beq _0800DD20
	ldrh r0, [r2, 0x22]
	movs r6, 0x22
	ldrsh r3, [r2, r6]
	cmp r3, 0
	bne _0800DCC0
	cmp r5, r12
	ble _0800DC80
	movs r6, 0x20
	ldrsh r0, [r2, r6]
	cmp r5, r0
	bne _0800DC80
	strh r3, [r2, 0x20]
	strh r3, [r2, 0x26]
_0800DC80:
	adds r4, r1, r4
	lsls r4, 3
	adds r4, r7
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	ldr r5, _0800DCBC @ =gUnknown_2023FEC
	ldr r0, [r5]
	adds r1, r0
	ldrb r0, [r1, 0x4]
	ldrb r1, [r1, 0x5]
	lsls r1, 8
	orrs r0, r1
	adds r0, 0x8
	lsls r0, 16
	lsrs r6, r0, 16
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x26
	ldrsh r2, [r4, r1]
	ldr r1, [r5]
	adds r1, r2
	adds r2, r6, 0
	bl SendBlock
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	b _0800DD20
	.align 2, 0
_0800DCBC: .4byte gUnknown_2023FEC
_0800DCC0:
	subs r0, 0x1
	strh r0, [r2, 0x22]
	b _0800DD20
_0800DCC6:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0800DD20
	ldr r0, _0800DCFC @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r3, 0x26
	ldrsh r2, [r1, r3]
	ldr r0, _0800DD00 @ =gUnknown_2023FEC
	ldr r0, [r0]
	adds r2, r0
	ldrb r0, [r2, 0x4]
	ldrb r2, [r2, 0x5]
	lsls r2, 8
	movs r3, 0x5
	strh r3, [r1, 0x22]
	orrs r0, r2
	ldrh r6, [r1, 0x26]
	adds r0, r6
	adds r0, 0x8
	strh r0, [r1, 0x26]
	b _0800DD1C
	.align 2, 0
_0800DCFC: .4byte gTasks
_0800DD00: .4byte gUnknown_2023FEC
_0800DD04:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r7
	ldrh r0, [r1, 0x22]
	subs r0, 0x1
	strh r0, [r1, 0x22]
	lsls r0, 16
	cmp r0, 0
	bne _0800DD20
	movs r0, 0x5
	strh r0, [r1, 0x22]
_0800DD1C:
	movs r0, 0x3
_0800DD1E:
	strh r0, [r1, 0x1E]
_0800DD20:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_800DB6C

	thumb_func_start sub_800DD28
sub_800DD28: @ 800DD28
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _0800DD5C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800DE28
	ldr r0, _0800DD60 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0800DE28
	ldr r0, _0800DD64 @ =gLinkPlayers
	ldr r1, [r0, 0x14]
	ldr r0, _0800DD68 @ =0x00002211
	cmp r1, r0
	bne _0800DE28
	bl sub_80FBB4C
	movs r4, 0
	ldr r0, _0800DD6C @ =gBlockRecvBuffer
	mov r10, r0
	b _0800DE1C
	.align 2, 0
_0800DD5C: .4byte gReceivedRemoteLinkPlayers
_0800DD60: .4byte gBattleTypeFlags
_0800DD64: .4byte gLinkPlayers
_0800DD68: .4byte 0x00002211
_0800DD6C: .4byte gBlockRecvBuffer
_0800DD70:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0800DE38 @ =gBitTable
	lsls r1, r4, 2
	adds r1, r2
	ldr r1, [r1]
	ands r0, r1
	adds r1, r4, 0x1
	mov r9, r1
	cmp r0, 0
	beq _0800DE16
	adds r0, r4, 0
	bl ResetBlockReceivedFlag
	lsls r0, r4, 8
	mov r4, r10
	adds r3, r0, r4
	ldr r1, _0800DE3C @ =gBlockRecvBuffer + 4
	adds r0, r1
	ldrh r6, [r0]
	ldr r7, _0800DE40 @ =gTasks
	ldr r4, _0800DE44 @ =gUnknown_202286D
	mov r12, r4
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r2, r0, r7
	movs r0, 0x24
	ldrsh r1, [r2, r0]
	adds r0, r6, 0
	adds r0, 0x9
	adds r1, r0
	movs r0, 0x80
	lsls r0, 5
	cmp r1, r0
	ble _0800DDD0
	ldrh r0, [r2, 0x24]
	strh r0, [r2, 0x20]
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r7
	movs r1, 0
	strh r1, [r0, 0x24]
_0800DDD0:
	ldr r2, _0800DE48 @ =gUnknown_2023FF0
	mov r4, r12
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r7
	movs r4, 0x24
	ldrsh r1, [r0, r4]
	ldr r0, [r2]
	adds r5, r0, r1
	adds r4, r3, 0
	movs r2, 0
	adds r3, r6, 0
	adds r3, 0x8
	mov r8, r7
	mov r7, r12
	cmp r2, r3
	bge _0800DE04
_0800DDF6:
	adds r0, r5, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, r3
	blt _0800DDF6
_0800DE04:
	ldrb r0, [r7]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	add r1, r8
	ldrh r0, [r1, 0x24]
	adds r0, r6, r0
	adds r0, 0x8
	strh r0, [r1, 0x24]
_0800DE16:
	mov r1, r9
	lsls r0, r1, 24
	lsrs r4, r0, 24
_0800DE1C:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _0800DD70
_0800DE28:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800DE38: .4byte gBitTable
_0800DE3C: .4byte gBlockRecvBuffer + 4
_0800DE40: .4byte gTasks
_0800DE44: .4byte gUnknown_202286D
_0800DE48: .4byte gUnknown_2023FF0
	thumb_func_end sub_800DD28

	thumb_func_start Task_HandleCopyReceivedLinkBuffersData
Task_HandleCopyReceivedLinkBuffersData: @ 800DE4C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _0800DEB4 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r3, r0, r1
	movs r0, 0x26
	ldrsh r2, [r3, r0]
	movs r4, 0x24
	ldrsh r0, [r3, r4]
	cmp r2, r0
	bne _0800DE70
	b _0800DF8C
_0800DE70:
	cmp r2, r0
	ble _0800DE82
	movs r4, 0x20
	ldrsh r0, [r3, r4]
	cmp r2, r0
	bne _0800DE82
	movs r0, 0
	strh r0, [r3, 0x20]
	strh r0, [r3, 0x26]
_0800DE82:
	lsls r2, r7, 2
	adds r0, r2, r7
	lsls r0, 3
	adds r5, r0, r1
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	ldr r3, _0800DEB8 @ =gUnknown_2023FF0
	mov r8, r3
	ldr r0, [r3]
	adds r3, r1, r0
	ldrb r4, [r3, 0x1]
	ldrb r6, [r3, 0x4]
	ldrb r0, [r3, 0x5]
	lsls r0, 8
	orrs r6, r0
	ldrb r0, [r3]
	mov r9, r2
	cmp r0, 0x1
	beq _0800DF4C
	cmp r0, 0x1
	bgt _0800DEBC
	cmp r0, 0
	beq _0800DEC2
	b _0800DF7A
	.align 2, 0
_0800DEB4: .4byte gTasks
_0800DEB8: .4byte gUnknown_2023FF0
_0800DEBC:
	cmp r0, 0x2
	beq _0800DF64
	b _0800DF7A
_0800DEC2:
	ldr r2, _0800DF2C @ =gBattleControllerExecFlags
	ldr r1, _0800DF30 @ =gBitTable
	lsls r0, r4, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0800DF8C
	lsls r0, r4, 9
	ldr r1, _0800DF34 @ =gBattleBufferA
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x8
	adds r2, r6, 0
	bl memcpy
	adds r0, r4, 0
	bl sub_8017298
	ldr r0, _0800DF38 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0800DF7A
	ldr r2, _0800DF3C @ =sBattler_AI
	movs r4, 0x26
	ldrsh r0, [r5, r4]
	mov r3, r8
	ldr r1, [r3]
	adds r0, r1
	ldrb r0, [r0, 0x2]
	strb r0, [r2]
	ldr r2, _0800DF40 @ =gBattlerTarget
	movs r4, 0x26
	ldrsh r0, [r5, r4]
	adds r0, r1
	ldrb r0, [r0, 0x3]
	strb r0, [r2]
	ldr r2, _0800DF44 @ =gAbsentBattlerFlags
	movs r3, 0x26
	ldrsh r0, [r5, r3]
	adds r0, r1
	ldrb r0, [r0, 0x6]
	strb r0, [r2]
	ldr r2, _0800DF48 @ =gUnknown_2023D6E
	movs r4, 0x26
	ldrsh r0, [r5, r4]
	adds r0, r1
	ldrb r0, [r0, 0x7]
	strb r0, [r2]
	b _0800DF7A
	.align 2, 0
_0800DF2C: .4byte gBattleControllerExecFlags
_0800DF30: .4byte gBitTable
_0800DF34: .4byte gBattleBufferA
_0800DF38: .4byte gBattleTypeFlags
_0800DF3C: .4byte sBattler_AI
_0800DF40: .4byte gBattlerTarget
_0800DF44: .4byte gAbsentBattlerFlags
_0800DF48: .4byte gUnknown_2023D6E
_0800DF4C:
	lsls r0, r4, 9
	ldr r1, _0800DF60 @ =gUnknown_20233C4
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x8
	adds r2, r6, 0
	bl memcpy
	b _0800DF7A
	.align 2, 0
_0800DF60: .4byte gUnknown_20233C4
_0800DF64:
	ldrb r2, [r3, 0x8]
	ldr r3, _0800DF98 @ =gBattleControllerExecFlags
	ldr r1, _0800DF9C @ =gBitTable
	lsls r0, r4, 2
	adds r0, r1
	lsls r2, 2
	ldr r1, [r0]
	lsls r1, r2
	ldr r0, [r3]
	bics r0, r1
	str r0, [r3]
_0800DF7A:
	ldr r0, _0800DFA0 @ =gTasks
	mov r2, r9
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, r6, r0
	adds r0, 0x8
	strh r0, [r1, 0x26]
_0800DF8C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800DF98: .4byte gBattleControllerExecFlags
_0800DF9C: .4byte gBitTable
_0800DFA0: .4byte gTasks
	thumb_func_end Task_HandleCopyReceivedLinkBuffersData

	thumb_func_start BtlController_EmitGetMonData
BtlController_EmitGetMonData: @ 800DFA4
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800DFC4 @ =gUnknown_2022874
	movs r3, 0
	strb r3, [r1]
	strb r4, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r3, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800DFC4: .4byte gUnknown_2022874
	thumb_func_end BtlController_EmitGetMonData

	thumb_func_start EmitGetRawMonData
EmitGetRawMonData: @ 800DFC8
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800DFEC @ =gUnknown_2022874
	movs r4, 0
	movs r3, 0x1
	strb r3, [r1]
	strb r5, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r4, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800DFEC: .4byte gUnknown_2022874
	thumb_func_end EmitGetRawMonData

	thumb_func_start EmitSetMonData
EmitSetMonData: @ 800DFF0
	push {r4-r6,lr}
	ldr r4, [sp, 0x10]
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r3, 24
	lsrs r5, r3, 24
	ldr r0, _0800E02C @ =gUnknown_2022874
	movs r3, 0x2
	strb r3, [r0]
	strb r1, [r0, 0x1]
	strb r2, [r0, 0x2]
	adds r1, r0, 0
	cmp r5, 0
	beq _0800E01E
	adds r3, r1, 0x3
	adds r2, r5, 0
_0800E010:
	ldrb r0, [r4]
	strb r0, [r3]
	adds r4, 0x1
	adds r3, 0x1
	subs r2, 0x1
	cmp r2, 0
	bne _0800E010
_0800E01E:
	adds r2, r5, 0x3
	adds r0, r6, 0
	bl PrepareBufferDataTransfer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800E02C: .4byte gUnknown_2022874
	thumb_func_end EmitSetMonData

	thumb_func_start EmitSetRawMonData
EmitSetRawMonData: @ 800E030
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r2, 24
	lsrs r4, r2, 24
	ldr r0, _0800E06C @ =gUnknown_2022874
	movs r2, 0x3
	strb r2, [r0]
	strb r1, [r0, 0x1]
	strb r4, [r0, 0x2]
	adds r5, r0, 0
	cmp r4, 0
	beq _0800E05C
	adds r1, r5, 0x3
	adds r2, r4, 0
_0800E04E:
	ldrb r0, [r3]
	strb r0, [r1]
	adds r3, 0x1
	adds r1, 0x1
	subs r2, 0x1
	cmp r2, 0
	bne _0800E04E
_0800E05C:
	adds r2, r4, 0x3
	adds r0, r6, 0
	adds r1, r5, 0
	bl PrepareBufferDataTransfer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800E06C: .4byte gUnknown_2022874
	thumb_func_end EmitSetRawMonData

	thumb_func_start EmitLoadMonSprite
EmitLoadMonSprite: @ 800E070
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800E08C @ =gUnknown_2022874
	movs r2, 0x4
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800E08C: .4byte gUnknown_2022874
	thumb_func_end EmitLoadMonSprite

	thumb_func_start EmitSwitchInAnim
EmitSwitchInAnim: @ 800E090
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800E0B0 @ =gUnknown_2022874
	movs r3, 0x5
	strb r3, [r1]
	strb r4, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r3, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800E0B0: .4byte gUnknown_2022874
	thumb_func_end EmitSwitchInAnim

	thumb_func_start EmitReturnMonToBall
EmitReturnMonToBall: @ 800E0B4
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800E0D0 @ =gUnknown_2022874
	movs r2, 0x6
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800E0D0: .4byte gUnknown_2022874
	thumb_func_end EmitReturnMonToBall

	thumb_func_start EmitDrawTrainerPic
EmitDrawTrainerPic: @ 800E0D4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800E0F0 @ =gUnknown_2022874
	movs r2, 0x7
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800E0F0: .4byte gUnknown_2022874
	thumb_func_end EmitDrawTrainerPic

	thumb_func_start EmitTrainerSlide
EmitTrainerSlide: @ 800E0F4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800E110 @ =gUnknown_2022874
	movs r2, 0x8
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800E110: .4byte gUnknown_2022874
	thumb_func_end EmitTrainerSlide

	thumb_func_start EmitTrainerSlideBack
EmitTrainerSlideBack: @ 800E114
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800E130 @ =gUnknown_2022874
	movs r2, 0x9
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800E130: .4byte gUnknown_2022874
	thumb_func_end EmitTrainerSlideBack

	thumb_func_start EmitFaintAnimation
EmitFaintAnimation: @ 800E134
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800E150 @ =gUnknown_2022874
	movs r2, 0xA
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800E150: .4byte gUnknown_2022874
	thumb_func_end EmitFaintAnimation

	thumb_func_start EmitPaletteFade
EmitPaletteFade: @ 800E154
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800E170 @ =gUnknown_2022874
	movs r2, 0xB
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800E170: .4byte gUnknown_2022874
	thumb_func_end EmitPaletteFade

	thumb_func_start EmitSuccessBallThrowAnim
EmitSuccessBallThrowAnim: @ 800E174
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800E190 @ =gUnknown_2022874
	movs r2, 0xC
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800E190: .4byte gUnknown_2022874
	thumb_func_end EmitSuccessBallThrowAnim

	thumb_func_start EmitBallThrowAnim
EmitBallThrowAnim: @ 800E194
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800E1B0 @ =gUnknown_2022874
	movs r2, 0xD
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800E1B0: .4byte gUnknown_2022874
	thumb_func_end EmitBallThrowAnim

	thumb_func_start EmitPause
EmitPause: @ 800E1B4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r1, _0800E1F8 @ =gUnknown_2022874
	movs r0, 0xE
	strb r0, [r1]
	strb r4, [r1, 0x1]
	lsls r0, r4, 1
	adds r0, r4
	adds r5, r1, 0
	cmp r0, 0
	beq _0800E1E2
	adds r1, r5, 0x2
	adds r3, r0, 0
_0800E1D4:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r1, 0x1
	subs r3, 0x1
	cmp r3, 0
	bne _0800E1D4
_0800E1E2:
	lsls r2, r4, 1
	adds r2, r4
	adds r2, 0x2
	adds r0, r6, 0
	adds r1, r5, 0
	bl PrepareBufferDataTransfer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800E1F8: .4byte gUnknown_2022874
	thumb_func_end EmitPause

	thumb_func_start EmitMoveAnimation
EmitMoveAnimation: @ 800E1FC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r4, [sp, 0x1C]
	ldr r5, [sp, 0x20]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r1, 16
	lsls r3, 16
	lsrs r3, 16
	ldr r7, _0800E290 @ =gUnknown_2022874
	movs r0, 0
	mov r12, r0
	movs r0, 0xF
	strb r0, [r7]
	strb r1, [r7, 0x1]
	lsrs r1, 8
	strb r1, [r7, 0x2]
	strb r2, [r7, 0x3]
	strb r3, [r7, 0x4]
	movs r6, 0xFF
	lsls r6, 8
	lsrs r3, 8
	strb r3, [r7, 0x5]
	strb r4, [r7, 0x6]
	adds r0, r4, 0
	ands r0, r6
	asrs r0, 8
	strb r0, [r7, 0x7]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r4
	asrs r0, 16
	strb r0, [r7, 0x8]
	lsrs r4, 24
	strb r4, [r7, 0x9]
	strb r5, [r7, 0xA]
	ldr r0, _0800E294 @ =gUnknown_2023D72
	ldrb r0, [r0]
	strb r0, [r7, 0xB]
	mov r0, r12
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0800E29C
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	bne _0800E29C
	ldr r0, _0800E298 @ =gBattleWeather
	ldrh r0, [r0]
	strb r0, [r7, 0xC]
	ands r6, r0
	lsrs r0, r6, 8
	strb r0, [r7, 0xD]
	adds r4, r7, 0
	b _0800E2A6
	.align 2, 0
_0800E290: .4byte gUnknown_2022874
_0800E294: .4byte gUnknown_2023D72
_0800E298: .4byte gBattleWeather
_0800E29C:
	ldr r0, _0800E2D0 @ =gUnknown_2022874
	movs r1, 0
	strb r1, [r0, 0xC]
	strb r1, [r0, 0xD]
	adds r4, r0, 0
_0800E2A6:
	movs r0, 0
	strb r0, [r4, 0xE]
	strb r0, [r4, 0xF]
	adds r0, r4, 0
	adds r0, 0x10
	ldr r1, [sp, 0x24]
	movs r2, 0x1C
	bl memcpy
	mov r0, r8
	adds r1, r4, 0
	movs r2, 0x2C
	bl PrepareBufferDataTransfer
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E2D0: .4byte gUnknown_2022874
	thumb_func_end EmitMoveAnimation

	thumb_func_start EmitPrintString
EmitPrintString: @ 800E2D4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _0800E3B4 @ =gUnknown_2022874
	movs r0, 0x10
	strb r0, [r2]
	ldr r0, _0800E3B8 @ =gBattleOutcome
	ldrb r0, [r0]
	strb r0, [r2, 0x1]
	strb r1, [r2, 0x2]
	lsrs r1, 8
	strb r1, [r2, 0x3]
	adds r0, r2, 0x4
	mov r12, r0
	ldr r4, _0800E3BC @ =gCurrentMove
	ldrh r0, [r4]
	strh r0, [r2, 0x4]
	ldr r0, _0800E3C0 @ =gUnknown_2023D4C
	ldrh r0, [r0]
	mov r1, r12
	strh r0, [r1, 0x2]
	ldr r0, _0800E3C4 @ =gUnknown_2023D68
	ldrh r0, [r0]
	strh r0, [r1, 0x4]
	ldr r0, _0800E3C8 @ =gLastUsedAbility
	ldrb r0, [r0]
	strb r0, [r1, 0x6]
	ldr r0, _0800E3CC @ =gBattleScripting
	ldrb r0, [r0, 0x17]
	strb r0, [r1, 0x7]
	ldr r0, _0800E3D0 @ =gBattleStruct
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x52
	ldrb r1, [r1]
	mov r3, r12
	strb r1, [r3, 0x8]
	adds r0, 0xAD
	ldrb r0, [r0]
	strb r0, [r3, 0x9]
	ldr r0, _0800E3D4 @ =gPotentialItemEffectBattler
	ldrb r0, [r0]
	strb r0, [r3, 0xA]
	ldr r3, _0800E3D8 @ =gBattleMoves
	ldrh r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x2]
	mov r7, r12
	strb r0, [r7, 0xB]
	movs r3, 0
	mov r9, r2
	ldr r0, _0800E3DC @ =gUnknown_2022AD8
	mov r8, r0
	adds r2, 0x10
	ldr r0, _0800E3E0 @ =gBattleMons
	adds r4, r0, 0
	adds r4, 0x20
_0800E35A:
	adds r1, r2, r3
	ldrb r0, [r4]
	strb r0, [r1]
	adds r4, 0x58
	adds r3, 0x1
	cmp r3, 0x3
	ble _0800E35A
	movs r3, 0
	mov r5, r12
	adds r5, 0x10
	mov r4, r12
	adds r4, 0x20
	ldr r6, _0800E3E4 @ =gBattleTextBuff2
	mov r2, r12
	adds r2, 0x30
_0800E378:
	adds r1, r5, r3
	ldr r7, _0800E3E8 @ =gBattleTextBuff1
	adds r0, r3, r7
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r4, r3
	adds r0, r3, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r2, r3
	mov r7, r8
	adds r0, r3, r7
	ldrb r0, [r0]
	strb r0, [r1]
	adds r3, 0x1
	cmp r3, 0xF
	ble _0800E378
	mov r0, r10
	mov r1, r9
	movs r2, 0x44
	bl PrepareBufferDataTransfer
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E3B4: .4byte gUnknown_2022874
_0800E3B8: .4byte gBattleOutcome
_0800E3BC: .4byte gCurrentMove
_0800E3C0: .4byte gUnknown_2023D4C
_0800E3C4: .4byte gUnknown_2023D68
_0800E3C8: .4byte gLastUsedAbility
_0800E3CC: .4byte gBattleScripting
_0800E3D0: .4byte gBattleStruct
_0800E3D4: .4byte gPotentialItemEffectBattler
_0800E3D8: .4byte gBattleMoves
_0800E3DC: .4byte gUnknown_2022AD8
_0800E3E0: .4byte gBattleMons
_0800E3E4: .4byte gBattleTextBuff2
_0800E3E8: .4byte gBattleTextBuff1
	thumb_func_end EmitPrintString

	thumb_func_start EmitPrintSelectionString
EmitPrintSelectionString: @ 800E3EC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _0800E4A8 @ =gUnknown_2022874
	movs r0, 0x11
	strb r0, [r2]
	strb r0, [r2, 0x1]
	strb r1, [r2, 0x2]
	lsrs r1, 8
	strb r1, [r2, 0x3]
	adds r0, r2, 0x4
	mov r12, r0
	ldr r0, _0800E4AC @ =gCurrentMove
	ldrh r0, [r0]
	strh r0, [r2, 0x4]
	ldr r0, _0800E4B0 @ =gUnknown_2023D4C
	ldrh r0, [r0]
	mov r1, r12
	strh r0, [r1, 0x2]
	ldr r0, _0800E4B4 @ =gUnknown_2023D68
	ldrh r0, [r0]
	strh r0, [r1, 0x4]
	ldr r0, _0800E4B8 @ =gLastUsedAbility
	ldrb r0, [r0]
	strb r0, [r1, 0x6]
	ldr r0, _0800E4BC @ =gBattleScripting
	ldrb r0, [r0, 0x17]
	strb r0, [r1, 0x7]
	ldr r0, _0800E4C0 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x52
	ldrb r0, [r0]
	strb r0, [r1, 0x8]
	movs r3, 0
	mov r9, r2
	ldr r7, _0800E4C4 @ =gUnknown_2022AD8
	mov r8, r7
	mov r4, r9
	adds r4, 0x10
	ldr r0, _0800E4C8 @ =gBattleMons
	adds r2, r0, 0
	adds r2, 0x20
_0800E44E:
	adds r1, r4, r3
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x58
	adds r3, 0x1
	cmp r3, 0x3
	ble _0800E44E
	movs r3, 0
	mov r5, r12
	adds r5, 0x10
	mov r4, r12
	adds r4, 0x20
	ldr r6, _0800E4CC @ =gBattleTextBuff2
	mov r2, r12
	adds r2, 0x30
_0800E46C:
	adds r1, r5, r3
	ldr r7, _0800E4D0 @ =gBattleTextBuff1
	adds r0, r3, r7
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r4, r3
	adds r0, r3, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r2, r3
	mov r7, r8
	adds r0, r3, r7
	ldrb r0, [r0]
	strb r0, [r1]
	adds r3, 0x1
	cmp r3, 0xF
	ble _0800E46C
	mov r0, r10
	mov r1, r9
	movs r2, 0x44
	bl PrepareBufferDataTransfer
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E4A8: .4byte gUnknown_2022874
_0800E4AC: .4byte gCurrentMove
_0800E4B0: .4byte gUnknown_2023D4C
_0800E4B4: .4byte gUnknown_2023D68
_0800E4B8: .4byte gLastUsedAbility
_0800E4BC: .4byte gBattleScripting
_0800E4C0: .4byte gBattleStruct
_0800E4C4: .4byte gUnknown_2022AD8
_0800E4C8: .4byte gBattleMons
_0800E4CC: .4byte gBattleTextBuff2
_0800E4D0: .4byte gBattleTextBuff1
	thumb_func_end EmitPrintSelectionString

	thumb_func_start EmitChooseAction
EmitChooseAction: @ 800E4D4
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	ldr r1, _0800E4FC @ =gUnknown_2022874
	movs r3, 0x12
	strb r3, [r1]
	strb r4, [r1, 0x1]
	strb r2, [r1, 0x2]
	lsrs r2, 8
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800E4FC: .4byte gUnknown_2022874
	thumb_func_end EmitChooseAction

	thumb_func_start Emitcmd19
Emitcmd19: @ 800E500
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800E51C @ =gUnknown_2022874
	movs r2, 0x13
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800E51C: .4byte gUnknown_2022874
	thumb_func_end Emitcmd19

	thumb_func_start EmitChooseMove
EmitChooseMove: @ 800E520
	push {r4-r6,lr}
	adds r5, r3, 0
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r3, _0800E558 @ =gUnknown_2022874
	movs r4, 0
	movs r0, 0x14
	strb r0, [r3]
	strb r1, [r3, 0x1]
	strb r2, [r3, 0x2]
	strb r4, [r3, 0x3]
	movs r2, 0
	adds r1, r3, 0
	adds r4, r1, 0x4
_0800E53C:
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r4]
	adds r4, 0x1
	adds r2, 0x1
	cmp r2, 0x13
	bls _0800E53C
	adds r0, r6, 0
	movs r2, 0x18
	bl PrepareBufferDataTransfer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800E558: .4byte gUnknown_2022874
	thumb_func_end EmitChooseMove

	thumb_func_start EmitChooseItem
EmitChooseItem: @ 800E55C
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0800E58C @ =gUnknown_2022874
	movs r0, 0x15
	strb r0, [r1]
	movs r2, 0
	adds r3, r1, 0x1
_0800E56E:
	adds r0, r4, r2
	ldrb r0, [r0]
	strb r0, [r3]
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, 0x2
	ble _0800E56E
	adds r0, r5, 0
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800E58C: .4byte gUnknown_2022874
	thumb_func_end EmitChooseItem

	thumb_func_start EmitChoosePokemon
EmitChoosePokemon: @ 800E590
	push {r4-r6,lr}
	ldr r6, [sp, 0x10]
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0800E5C8 @ =gUnknown_2022874
	movs r0, 0x16
	strb r0, [r4]
	strb r1, [r4, 0x1]
	strb r2, [r4, 0x2]
	strb r3, [r4, 0x3]
	movs r2, 0
	adds r1, r4, 0
	adds r3, r1, 0x4
_0800E5AA:
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r3]
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, 0x2
	ble _0800E5AA
	adds r0, r5, 0
	movs r2, 0x8
	bl PrepareBufferDataTransfer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800E5C8: .4byte gUnknown_2022874
	thumb_func_end EmitChoosePokemon

	thumb_func_start EmitCmd23
EmitCmd23: @ 800E5CC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800E5E8 @ =gUnknown_2022874
	movs r2, 0x17
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800E5E8: .4byte gUnknown_2022874
	thumb_func_end EmitCmd23

	thumb_func_start EmitHealthBarUpdate
EmitHealthBarUpdate: @ 800E5EC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _0800E620 @ =gUnknown_2022874
	movs r4, 0
	movs r2, 0x18
	strb r2, [r3]
	strb r4, [r3, 0x1]
	strb r1, [r3, 0x2]
	lsls r1, 16
	asrs r1, 16
	movs r2, 0xFF
	lsls r2, 8
	ands r1, r2
	asrs r1, 8
	strb r1, [r3, 0x3]
	adds r1, r3, 0
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800E620: .4byte gUnknown_2022874
	thumb_func_end EmitHealthBarUpdate

	thumb_func_start EmitExpUpdate
EmitExpUpdate: @ 800E624
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	ldr r1, _0800E654 @ =gUnknown_2022874
	movs r3, 0x19
	strb r3, [r1]
	strb r4, [r1, 0x1]
	strb r2, [r1, 0x2]
	lsls r2, 16
	asrs r2, 16
	movs r3, 0xFF
	lsls r3, 8
	ands r2, r3
	asrs r2, 8
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800E654: .4byte gUnknown_2022874
	thumb_func_end EmitExpUpdate

	thumb_func_start EmitStatusIconUpdate
EmitStatusIconUpdate: @ 800E658
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800E6A8 @ =gUnknown_2022874
	movs r3, 0x1A
	strb r3, [r1]
	strb r4, [r1, 0x1]
	movs r6, 0xFF
	lsls r6, 8
	adds r3, r4, 0
	ands r3, r6
	lsrs r3, 8
	strb r3, [r1, 0x2]
	movs r5, 0xFF
	lsls r5, 16
	adds r3, r4, 0
	ands r3, r5
	lsrs r3, 16
	strb r3, [r1, 0x3]
	lsrs r4, 24
	strb r4, [r1, 0x4]
	strb r2, [r1, 0x5]
	adds r3, r2, 0
	ands r3, r6
	lsrs r3, 8
	strb r3, [r1, 0x6]
	adds r3, r2, 0
	ands r3, r5
	lsrs r3, 16
	strb r3, [r1, 0x7]
	lsrs r2, 24
	strb r2, [r1, 0x8]
	movs r2, 0x9
	bl PrepareBufferDataTransfer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800E6A8: .4byte gUnknown_2022874
	thumb_func_end EmitStatusIconUpdate

	thumb_func_start EmitStatusAnimation
EmitStatusAnimation: @ 800E6AC
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800E6E4 @ =gUnknown_2022874
	movs r3, 0x1B
	strb r3, [r1]
	strb r4, [r1, 0x1]
	strb r2, [r1, 0x2]
	movs r3, 0xFF
	lsls r3, 8
	ands r3, r2
	lsrs r3, 8
	strb r3, [r1, 0x3]
	movs r3, 0xFF
	lsls r3, 16
	ands r3, r2
	lsrs r3, 16
	strb r3, [r1, 0x4]
	lsrs r2, 24
	strb r2, [r1, 0x5]
	movs r2, 0x6
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800E6E4: .4byte gUnknown_2022874
	thumb_func_end EmitStatusAnimation

	thumb_func_start EmitStatusXor
EmitStatusXor: @ 800E6E8
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800E704 @ =gUnknown_2022874
	movs r2, 0x1C
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800E704: .4byte gUnknown_2022874
	thumb_func_end EmitStatusXor

	thumb_func_start EmitDataTransfer
EmitDataTransfer: @ 800E708
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	ldr r1, _0800E74C @ =gUnknown_2022874
	movs r0, 0x1D
	strb r0, [r1]
	strb r0, [r1, 0x1]
	strb r4, [r1, 0x2]
	lsrs r0, r4, 8
	strb r0, [r1, 0x3]
	adds r5, r1, 0
	cmp r4, 0
	beq _0800E738
	adds r1, r5, 0x4
	adds r3, r4, 0
_0800E72A:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r1, 0x1
	subs r3, 0x1
	cmp r3, 0
	bne _0800E72A
_0800E738:
	adds r2, r4, 0x4
	lsls r2, 16
	lsrs r2, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl PrepareBufferDataTransfer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800E74C: .4byte gUnknown_2022874
	thumb_func_end EmitDataTransfer

	thumb_func_start EmitDMA3Transfer
EmitDMA3Transfer: @ 800E750
	push {r4-r6,lr}
	adds r4, r3, 0
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r2, 16
	lsrs r5, r2, 16
	ldr r2, _0800E7B4 @ =gUnknown_2022874
	movs r0, 0x1E
	strb r0, [r2]
	strb r1, [r2, 0x1]
	movs r3, 0xFF
	lsls r3, 8
	adds r0, r1, 0
	ands r0, r3
	lsrs r0, 8
	strb r0, [r2, 0x2]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r2, 0x3]
	lsrs r1, 24
	strb r1, [r2, 0x4]
	strb r5, [r2, 0x5]
	adds r0, r5, 0
	ands r0, r3
	lsrs r0, 8
	strb r0, [r2, 0x6]
	adds r1, r2, 0
	cmp r5, 0
	beq _0800E7A0
	adds r3, r1, 0x7
	adds r2, r5, 0
_0800E792:
	ldrb r0, [r4]
	strb r0, [r3]
	adds r4, 0x1
	adds r3, 0x1
	subs r2, 0x1
	cmp r2, 0
	bne _0800E792
_0800E7A0:
	adds r2, r5, 0x7
	lsls r2, 16
	lsrs r2, 16
	adds r0, r6, 0
	bl PrepareBufferDataTransfer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800E7B4: .4byte gUnknown_2022874
	thumb_func_end EmitDMA3Transfer

	thumb_func_start EmitPlayBGM
EmitPlayBGM: @ 800E7B8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	ldr r1, _0800E7FC @ =gUnknown_2022874
	movs r0, 0x1F
	strb r0, [r1]
	strb r4, [r1, 0x1]
	lsrs r0, r4, 8
	strb r0, [r1, 0x2]
	adds r5, r1, 0
	cmp r4, 0
	beq _0800E7E6
	adds r1, r5, 0x3
	adds r3, r4, 0
_0800E7D8:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r1, 0x1
	subs r3, 0x1
	cmp r3, 0
	bne _0800E7D8
_0800E7E6:
	adds r2, r4, 0x3
	lsls r2, 16
	lsrs r2, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl PrepareBufferDataTransfer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800E7FC: .4byte gUnknown_2022874
	thumb_func_end EmitPlayBGM

	thumb_func_start EmitCmd32
EmitCmd32: @ 800E800
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	ldr r1, _0800E844 @ =gUnknown_2022874
	movs r0, 0x20
	strb r0, [r1]
	strb r4, [r1, 0x1]
	lsrs r0, r4, 8
	strb r0, [r1, 0x2]
	adds r5, r1, 0
	cmp r4, 0
	beq _0800E82E
	adds r1, r5, 0x3
	adds r3, r4, 0
_0800E820:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r1, 0x1
	subs r3, 0x1
	cmp r3, 0
	bne _0800E820
_0800E82E:
	adds r2, r4, 0x3
	lsls r2, 16
	lsrs r2, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl PrepareBufferDataTransfer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800E844: .4byte gUnknown_2022874
	thumb_func_end EmitCmd32

	thumb_func_start EmitTwoReturnValues
EmitTwoReturnValues: @ 800E848
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	ldr r1, _0800E870 @ =gUnknown_2022874
	movs r3, 0x21
	strb r3, [r1]
	strb r4, [r1, 0x1]
	strb r2, [r1, 0x2]
	lsrs r2, 8
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800E870: .4byte gUnknown_2022874
	thumb_func_end EmitTwoReturnValues

	thumb_func_start EmitChosenMonReturnValue
EmitChosenMonReturnValue: @ 800E874
	push {r4,r5,lr}
	adds r4, r2, 0
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _0800E8A8 @ =gUnknown_2022874
	movs r0, 0x22
	strb r0, [r2]
	strb r1, [r2, 0x1]
	movs r3, 0
	adds r1, r2, 0x2
_0800E888:
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, 0x1
	adds r3, 0x1
	cmp r3, 0x2
	ble _0800E888
	adds r0, r5, 0
	adds r1, r2, 0
	movs r2, 0x5
	bl PrepareBufferDataTransfer
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800E8A8: .4byte gUnknown_2022874
	thumb_func_end EmitChosenMonReturnValue

	thumb_func_start EmitOneReturnValue
EmitOneReturnValue: @ 800E8AC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _0800E8D4 @ =gUnknown_2022874
	movs r4, 0
	movs r2, 0x23
	strb r2, [r3]
	strb r1, [r3, 0x1]
	lsrs r1, 8
	strb r1, [r3, 0x2]
	strb r4, [r3, 0x3]
	adds r1, r3, 0
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800E8D4: .4byte gUnknown_2022874
	thumb_func_end EmitOneReturnValue

	thumb_func_start EmitOneReturnValue_Duplicate
EmitOneReturnValue_Duplicate: @ 800E8D8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _0800E900 @ =gUnknown_2022874
	movs r4, 0
	movs r2, 0x24
	strb r2, [r3]
	strb r1, [r3, 0x1]
	lsrs r1, 8
	strb r1, [r3, 0x2]
	strb r4, [r3, 0x3]
	adds r1, r3, 0
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800E900: .4byte gUnknown_2022874
	thumb_func_end EmitOneReturnValue_Duplicate

	thumb_func_start EmitCmd37
EmitCmd37: @ 800E904
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800E920 @ =gUnknown_2022874
	movs r2, 0x25
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800E920: .4byte gUnknown_2022874
	thumb_func_end EmitCmd37

	thumb_func_start EmitCmd38
EmitCmd38: @ 800E924
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800E940 @ =gUnknown_2022874
	movs r2, 0x26
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800E940: .4byte gUnknown_2022874
	thumb_func_end EmitCmd38

	thumb_func_start EmitCmd39
EmitCmd39: @ 800E944
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800E960 @ =gUnknown_2022874
	movs r2, 0x27
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800E960: .4byte gUnknown_2022874
	thumb_func_end EmitCmd39

	thumb_func_start EmitCmd40
EmitCmd40: @ 800E964
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800E980 @ =gUnknown_2022874
	movs r2, 0x28
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800E980: .4byte gUnknown_2022874
	thumb_func_end EmitCmd40

	thumb_func_start EmitHitAnimation
EmitHitAnimation: @ 800E984
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800E9A0 @ =gUnknown_2022874
	movs r2, 0x29
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800E9A0: .4byte gUnknown_2022874
	thumb_func_end EmitHitAnimation

	thumb_func_start EmitCmd42
EmitCmd42: @ 800E9A4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800E9C0 @ =gUnknown_2022874
	movs r2, 0x2A
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800E9C0: .4byte gUnknown_2022874
	thumb_func_end EmitCmd42

	thumb_func_start EmitPlaySE
EmitPlaySE: @ 800E9C4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _0800E9EC @ =gUnknown_2022874
	movs r4, 0
	movs r2, 0x2B
	strb r2, [r3]
	strb r1, [r3, 0x1]
	lsrs r1, 8
	strb r1, [r3, 0x2]
	strb r4, [r3, 0x3]
	adds r1, r3, 0
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800E9EC: .4byte gUnknown_2022874
	thumb_func_end EmitPlaySE

	thumb_func_start Emitcmd44
Emitcmd44: @ 800E9F0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _0800EA18 @ =gUnknown_2022874
	movs r4, 0
	movs r2, 0x2C
	strb r2, [r3]
	strb r1, [r3, 0x1]
	lsrs r1, 8
	strb r1, [r3, 0x2]
	strb r4, [r3, 0x3]
	adds r1, r3, 0
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EA18: .4byte gUnknown_2022874
	thumb_func_end Emitcmd44

	thumb_func_start EmitFaintingCry
EmitFaintingCry: @ 800EA1C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800EA38 @ =gUnknown_2022874
	movs r2, 0x2D
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800EA38: .4byte gUnknown_2022874
	thumb_func_end EmitFaintingCry

	thumb_func_start EmitIntroSlide
EmitIntroSlide: @ 800EA3C
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800EA58 @ =gUnknown_2022874
	movs r2, 0x2E
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800EA58: .4byte gUnknown_2022874
	thumb_func_end EmitIntroSlide

	thumb_func_start EmitIntroTrainerBallThrow
EmitIntroTrainerBallThrow: @ 800EA5C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800EA78 @ =gUnknown_2022874
	movs r2, 0x2F
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800EA78: .4byte gUnknown_2022874
	thumb_func_end EmitIntroTrainerBallThrow

	thumb_func_start EmitDrawPartyStatusSummary
EmitDrawPartyStatusSummary: @ 800EA7C
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r1, _0800EAC0 @ =gUnknown_2022874
	movs r3, 0x30
	strb r3, [r1]
	movs r0, 0x7F
	ands r0, r2
	strb r0, [r1, 0x1]
	movs r0, 0x80
	ands r0, r2
	lsls r0, 24
	lsrs r0, 31
	strb r0, [r1, 0x2]
	strb r3, [r1, 0x3]
	movs r2, 0
	adds r3, r1, 0x4
_0800EAA4:
	adds r0, r4, r2
	ldrb r0, [r0]
	strb r0, [r3]
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, 0x2F
	ble _0800EAA4
	adds r0, r5, 0
	movs r2, 0x34
	bl PrepareBufferDataTransfer
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EAC0: .4byte gUnknown_2022874
	thumb_func_end EmitDrawPartyStatusSummary

	thumb_func_start EmitCmd49
EmitCmd49: @ 800EAC4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800EAE0 @ =gUnknown_2022874
	movs r2, 0x31
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800EAE0: .4byte gUnknown_2022874
	thumb_func_end EmitCmd49

	thumb_func_start EmitCmd50
EmitCmd50: @ 800EAE4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800EB00 @ =gUnknown_2022874
	movs r2, 0x32
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800EB00: .4byte gUnknown_2022874
	thumb_func_end EmitCmd50

	thumb_func_start EmitSpriteInvisibility
EmitSpriteInvisibility: @ 800EB04
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800EB24 @ =gUnknown_2022874
	movs r2, 0x33
	strb r2, [r1]
	strb r3, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800EB24: .4byte gUnknown_2022874
	thumb_func_end EmitSpriteInvisibility

	thumb_func_start EmitBattleAnimation
EmitBattleAnimation: @ 800EB28
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	ldr r1, _0800EB50 @ =gUnknown_2022874
	movs r3, 0x34
	strb r3, [r1]
	strb r4, [r1, 0x1]
	strb r2, [r1, 0x2]
	lsrs r2, 8
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EB50: .4byte gUnknown_2022874
	thumb_func_end EmitBattleAnimation

	thumb_func_start EmitLinkStandbyMsg
EmitLinkStandbyMsg: @ 800EB54
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800EB70 @ =gUnknown_2022874
	movs r2, 0x35
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800EB70: .4byte gUnknown_2022874
	thumb_func_end EmitLinkStandbyMsg

	thumb_func_start EmitResetActionMoveSelection
EmitResetActionMoveSelection: @ 800EB74
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800EB90 @ =gUnknown_2022874
	movs r2, 0x36
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800EB90: .4byte gUnknown_2022874
	thumb_func_end EmitResetActionMoveSelection

	thumb_func_start EmitCmd55
EmitCmd55: @ 800EB94
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800EBB0 @ =gUnknown_2022874
	movs r2, 0x37
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0800EBB0: .4byte gUnknown_2022874
	thumb_func_end EmitCmd55

	.align 2, 0 @ Don't pad with nop.
