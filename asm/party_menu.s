	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start Task_TryLearningNextMoveAfterText
Task_TryLearningNextMoveAfterText: @ 812628C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081262A4
	adds r0, r4, 0
	bl Task_TryLearningNextMove
_081262A4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_TryLearningNextMoveAfterText

	thumb_func_start dp05_rare_candy
dp05_rare_candy: @ 81262AC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r7, _081262E8 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r7, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _081262EC @ =gPlayerParty
	adds r4, r1, r0
	ldr r0, _081262F0 @ =gSpecialVar_ItemId
	ldrh r5, [r0]
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x64
	beq _081262F4
	ldrb r2, [r7, 0x9]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r3, 0
	bl PokemonUseItemEffects2
	lsls r0, 24
	lsrs r4, r0, 24
	b _081262F6
	.align 2, 0
_081262E8: .4byte gPartyMenu
_081262EC: .4byte gPlayerParty
_081262F0: .4byte gSpecialVar_ItemId
_081262F4:
	movs r4, 0x1
_081262F6:
	movs r0, 0x5
	bl PlaySE
	cmp r4, 0
	beq _08126330
	ldr r1, _08126324 @ =gPartyMenuUseExitCallback
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08126328 @ =gText_WontHaveEffect
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r1, _0812632C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	mov r1, r8
	str r1, [r0]
	b _0812633C
	.align 2, 0
_08126324: .4byte gPartyMenuUseExitCallback
_08126328: .4byte gText_WontHaveEffect
_0812632C: .4byte gTasks
_08126330:
	adds r0, r6, 0
	bl sub_8124DC0
	ldr r1, _08126348 @ =gItemUseCB
	ldr r0, _0812634C @ =ItemUseCB_RareCandy
	str r0, [r1]
_0812633C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126348: .4byte gItemUseCB
_0812634C: .4byte ItemUseCB_RareCandy
	thumb_func_end dp05_rare_candy

	thumb_func_start ItemUseCB_RareCandy
ItemUseCB_RareCandy: @ 8126350
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r6, _08126410 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r6, r1]
	movs r0, 0x64
	adds r4, r1, 0
	muls r4, r0
	ldr r0, _08126414 @ =gPlayerParty
	adds r4, r0
	ldr r0, _08126418 @ =sPartyMenuInternal
	ldr r7, [r0]
	movs r2, 0x86
	lsls r2, 2
	adds r1, r7, r2
	adds r0, r4, 0
	bl GetMonLevelUpWindowStats
	ldrb r0, [r6, 0x9]
	ldr r5, _0812641C @ =gSpecialVar_ItemId
	ldrh r1, [r5]
	movs r2, 0
	bl ExecuteTableBasedItemEffect_
	movs r0, 0x89
	lsls r0, 2
	adds r1, r7, r0
	adds r0, r4, 0
	bl GetMonLevelUpWindowStats
	ldr r1, _08126420 @ =gPartyMenuUseExitCallback
	movs r0, 0x1
	strb r0, [r1]
	ldrh r2, [r5]
	ldr r3, _08126424 @ =0x0000ffff
	movs r0, 0x4
	adds r1, r4, 0
	bl ItemUse_SetQuestLogEvent
	movs r0, 0
	bl PlayFanfareByFanfareNum
	ldrb r0, [r6, 0x9]
	adds r1, r4, 0
	bl UpdateMonDisplayInfoAfterRareCandy
	ldrh r0, [r5]
	movs r1, 0x1
	bl RemoveBagItem
	ldr r1, _08126428 @ =gStringVar1
	adds r0, r4, 0
	bl GetMonNickname
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _0812642C @ =gStringVar2
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r4, _08126430 @ =gStringVar4
	ldr r1, _08126434 @ =gText_PkmnElevatedToLvVar2
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r1, _08126438 @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _0812643C @ =Task_DisplayLevelUpStatsPg1
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126410: .4byte gPartyMenu
_08126414: .4byte gPlayerParty
_08126418: .4byte sPartyMenuInternal
_0812641C: .4byte gSpecialVar_ItemId
_08126420: .4byte gPartyMenuUseExitCallback
_08126424: .4byte 0x0000ffff
_08126428: .4byte gStringVar1
_0812642C: .4byte gStringVar2
_08126430: .4byte gStringVar4
_08126434: .4byte gText_PkmnElevatedToLvVar2
_08126438: .4byte gTasks
_0812643C: .4byte Task_DisplayLevelUpStatsPg1
	thumb_func_end ItemUseCB_RareCandy

	thumb_func_start UpdateMonDisplayInfoAfterRareCandy
UpdateMonDisplayInfoAfterRareCandy: @ 8126440
	push {r4-r7,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r0, 24
	adds r7, r0, 0
	ldr r6, _081264C0 @ =sPartyMenuBoxes
	lsls r4, r7, 4
	ldr r1, [r6]
	adds r1, r4
	adds r0, r5, 0
	bl SetPartyMonAilmentGfx
	ldr r2, _081264C4 @ =gSprites
	ldr r0, [r6]
	adds r3, r4, r0
	ldrb r1, [r3, 0xC]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _0812647C
	adds r0, r5, 0
	adds r1, r3, 0
	movs r2, 0x1
	bl DisplayPartyPokemonLevelCheck
_0812647C:
	ldr r1, [r6]
	adds r1, r4
	adds r0, r5, 0
	movs r2, 0x1
	bl DisplayPartyPokemonHPCheck
	ldr r1, [r6]
	adds r1, r4
	adds r0, r5, 0
	movs r2, 0x1
	bl DisplayPartyPokemonMaxHPCheck
	ldr r1, [r6]
	adds r1, r4
	adds r0, r5, 0
	bl DisplayPartyPokemonHPBarCheck
	ldr r0, [r6]
	adds r0, r4, r0
	ldrb r0, [r0, 0x9]
	adds r1, r5, 0
	bl UpdatePartyMonHPBar
	adds r0, r7, 0
	movs r1, 0x1
	bl AnimatePartySlot
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081264C0: .4byte sPartyMenuBoxes
_081264C4: .4byte gSprites
	thumb_func_end UpdateMonDisplayInfoAfterRareCandy

	thumb_func_start Task_DisplayLevelUpStatsPg1
Task_DisplayLevelUpStatsPg1: @ 81264C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	bl WaitFanfare
	lsls r0, 24
	cmp r0, 0
	beq _08126514
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08126514
	ldr r0, _0812651C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081264FA
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08126514
_081264FA:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl DisplayLevelUpStatsPg1
	ldr r0, _08126520 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08126524 @ =Task_DisplayLevelUpStatsPg2
	str r0, [r1]
_08126514:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812651C: .4byte gMain
_08126520: .4byte gTasks
_08126524: .4byte Task_DisplayLevelUpStatsPg2
	thumb_func_end Task_DisplayLevelUpStatsPg1

	thumb_func_start Task_DisplayLevelUpStatsPg2
Task_DisplayLevelUpStatsPg2: @ 8126528
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08126564 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08126542
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0812655C
_08126542:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl DisplayLevelUpStatsPg2
	ldr r0, _08126568 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812656C @ =Task_TryLearnNewMoves
	str r0, [r1]
_0812655C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08126564: .4byte gMain
_08126568: .4byte gTasks
_0812656C: .4byte Task_TryLearnNewMoves
	thumb_func_end Task_DisplayLevelUpStatsPg2

	thumb_func_start DisplayLevelUpStatsPg1
DisplayLevelUpStatsPg1: @ 8126570
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _081265B8 @ =sPartyMenuInternal
	ldr r5, [r0]
	movs r0, 0x86
	lsls r0, 2
	adds r4, r5, r0
	bl CreateLevelUpStatsWindow
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x18]
	ldrh r0, [r4, 0x18]
	movs r1, 0x89
	lsls r1, 2
	adds r2, r5, r1
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0x3
	str r1, [sp, 0x4]
	adds r1, r4, 0
	movs r3, 0x1
	bl DrawLevelUpWindowPg1
	ldrb r0, [r4, 0x18]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081265B8: .4byte sPartyMenuInternal
	thumb_func_end DisplayLevelUpStatsPg1

	thumb_func_start DisplayLevelUpStatsPg2
DisplayLevelUpStatsPg2: @ 81265BC
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _081265F4 @ =sPartyMenuInternal
	ldr r1, [r0]
	movs r0, 0x86
	lsls r0, 2
	adds r4, r1, r0
	ldrh r0, [r4, 0x18]
	movs r2, 0x89
	lsls r2, 2
	adds r1, r2
	movs r2, 0x3
	str r2, [sp]
	movs r2, 0x1
	movs r3, 0x2
	bl DrawLevelUpWindowPg2
	ldrb r0, [r4, 0x18]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081265F4: .4byte sPartyMenuInternal
	thumb_func_end DisplayLevelUpStatsPg2

	thumb_func_start Task_TryLearnNewMoves
Task_TryLearnNewMoves: @ 81265F8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0
	bl WaitFanfare
	lsls r0, 24
	cmp r0, 0
	beq _0812669A
	ldr r0, _08126650 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r6, 0x1
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	bne _08126620
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0812669A
_08126620:
	bl RemoveLevelUpStatsWindow
	ldr r4, _08126654 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r4, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08126658 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1
	bl MonTryLearningNewMove
	lsls r0, 16
	lsrs r1, r0, 16
	strh r6, [r4, 0x10]
	ldr r0, _0812665C @ =0x0000fffe
	cmp r1, r0
	beq _0812667C
	cmp r1, r0
	bgt _08126660
	cmp r1, 0
	beq _0812666C
	b _08126694
	.align 2, 0
_08126650: .4byte gMain
_08126654: .4byte gPartyMenu
_08126658: .4byte gPlayerParty
_0812665C: .4byte 0x0000fffe
_08126660:
	ldr r0, _08126668 @ =0x0000ffff
	cmp r1, r0
	beq _08126674
	b _08126694
	.align 2, 0
_08126668: .4byte 0x0000ffff
_0812666C:
	adds r0, r5, 0
	bl PartyMenuTryEvolution
	b _0812669A
_08126674:
	adds r0, r5, 0
	bl DisplayMonNeedsToReplaceMove
	b _0812669A
_0812667C:
	ldr r0, _0812668C @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08126690 @ =Task_TryLearningNextMove
	str r0, [r1]
	b _0812669A
	.align 2, 0
_0812668C: .4byte gTasks
_08126690: .4byte Task_TryLearningNextMove
_08126694:
	adds r0, r5, 0
	bl DisplayMonLearnedMove
_0812669A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end Task_TryLearnNewMoves

	thumb_func_start Task_TryLearningNextMove
Task_TryLearningNextMove: @ 81266A0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081266D0 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081266D4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0
	bl MonTryLearningNewMove
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _081266D8 @ =0x0000fffe
	cmp r1, r0
	beq _081266FE
	cmp r1, r0
	bgt _081266DC
	cmp r1, 0
	beq _081266E8
	b _081266F8
	.align 2, 0
_081266D0: .4byte gPartyMenu
_081266D4: .4byte gPlayerParty
_081266D8: .4byte 0x0000fffe
_081266DC:
	ldr r0, _081266E4 @ =0x0000ffff
	cmp r1, r0
	beq _081266F0
	b _081266F8
	.align 2, 0
_081266E4: .4byte 0x0000ffff
_081266E8:
	adds r0, r4, 0
	bl PartyMenuTryEvolution
	b _081266FE
_081266F0:
	adds r0, r4, 0
	bl DisplayMonNeedsToReplaceMove
	b _081266FE
_081266F8:
	adds r0, r4, 0
	bl DisplayMonLearnedMove
_081266FE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_TryLearningNextMove

	thumb_func_start PartyMenuTryEvolution
PartyMenuTryEvolution: @ 8126704
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _08126748 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r6, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0812674C @ =gPlayerParty
	adds r7, r1, r0
	adds r0, r7, 0
	movs r1, 0
	movs r2, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _08126754
	bl FreePartyPointers
	ldr r0, _08126750 @ =gCB2_AfterEvolution
	ldr r1, [r6]
	str r1, [r0]
	ldrb r3, [r6, 0x9]
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0x1
	bl BeginEvolutionScene
	adds r0, r5, 0
	bl DestroyTask
	b _08126762
	.align 2, 0
_08126748: .4byte gPartyMenu
_0812674C: .4byte gPlayerParty
_08126750: .4byte gCB2_AfterEvolution
_08126754:
	ldr r0, _08126768 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812676C @ =Task_ClosePartyMenuAfterText
	str r0, [r1]
_08126762:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126768: .4byte gTasks
_0812676C: .4byte Task_ClosePartyMenuAfterText
	thumb_func_end PartyMenuTryEvolution

	thumb_func_start DisplayMonNeedsToReplaceMove
DisplayMonNeedsToReplaceMove: @ 8126770
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _081267DC @ =gPartyMenu
	mov r8, r0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081267E0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _081267E4 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _081267E8 @ =gStringVar2
	ldr r6, _081267EC @ =gMoveToLearn
	ldrh r2, [r6]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _081267F0 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _081267F4 @ =gStringVar4
	ldr r1, _081267F8 @ =gText_PkmnNeedsToReplaceMove
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldrh r0, [r6]
	mov r1, r8
	strh r0, [r1, 0xE]
	ldr r1, _081267FC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126800 @ =Task_ReplaceMoveYesNo
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081267DC: .4byte gPartyMenu
_081267E0: .4byte gPlayerParty
_081267E4: .4byte gStringVar1
_081267E8: .4byte gStringVar2
_081267EC: .4byte gMoveToLearn
_081267F0: .4byte gMoveNames
_081267F4: .4byte gStringVar4
_081267F8: .4byte gText_PkmnNeedsToReplaceMove
_081267FC: .4byte gTasks
_08126800: .4byte Task_ReplaceMoveYesNo
	thumb_func_end DisplayMonNeedsToReplaceMove

	thumb_func_start DisplayMonLearnedMove
DisplayMonLearnedMove: @ 8126804
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r6, r0, 0
	adds r5, r1, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _08126870 @ =gPartyMenu
	mov r8, r0
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08126874 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08126878 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _0812687C @ =gStringVar2
	movs r1, 0xD
	muls r1, r5
	ldr r2, _08126880 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _08126884 @ =gStringVar4
	ldr r1, _08126888 @ =gText_PkmnLearnedMove3
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	mov r0, r8
	strh r5, [r0, 0xE]
	ldr r1, _0812688C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126890 @ =Task_DoLearnedMoveFanfareAfterText
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08126870: .4byte gPartyMenu
_08126874: .4byte gPlayerParty
_08126878: .4byte gStringVar1
_0812687C: .4byte gStringVar2
_08126880: .4byte gMoveNames
_08126884: .4byte gStringVar4
_08126888: .4byte gText_PkmnLearnedMove3
_0812688C: .4byte gTasks
_08126890: .4byte Task_DoLearnedMoveFanfareAfterText
	thumb_func_end DisplayMonLearnedMove

	thumb_func_start ItemUseCB_SacredAsh
ItemUseCB_SacredAsh: @ 8126894
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081268C8 @ =sPartyMenuInternal
	ldr r2, [r1]
	movs r3, 0x86
	lsls r3, 2
	adds r1, r2, r3
	movs r3, 0
	strh r3, [r1]
	ldr r4, _081268CC @ =0x0000021a
	adds r1, r2, r4
	strh r3, [r1]
	ldr r1, _081268D0 @ =gPartyMenu
	ldrb r1, [r1, 0x9]
	lsls r1, 24
	asrs r1, 24
	movs r3, 0x87
	lsls r3, 2
	adds r2, r3
	strh r1, [r2]
	bl UseSacredAsh
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081268C8: .4byte sPartyMenuInternal
_081268CC: .4byte 0x0000021a
_081268D0: .4byte gPartyMenu
	thumb_func_end ItemUseCB_SacredAsh

	thumb_func_start UseSacredAsh
UseSacredAsh: @ 81268D4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	mov r9, r4
	ldr r6, _08126930 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r6, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08126934 @ =gPlayerParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08126920
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldrb r0, [r6, 0x9]
	ldr r1, _08126938 @ =gSpecialVar_ItemId
	ldrh r1, [r1]
	movs r2, 0
	bl ExecuteTableBasedItemEffect_
	lsls r0, 24
	cmp r0, 0
	beq _08126944
_08126920:
	ldr r0, _0812693C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08126940 @ =Task_SacredAshLoop
	str r0, [r1]
	b _081269EE
	.align 2, 0
_08126930: .4byte gPartyMenu
_08126934: .4byte gPlayerParty
_08126938: .4byte gSpecialVar_ItemId
_0812693C: .4byte gTasks
_08126940: .4byte Task_SacredAshLoop
_08126944:
	movs r0, 0x1
	bl PlaySE
	ldr r7, _08126A00 @ =sPartyMenuInternal
	ldr r0, [r7]
	ldr r1, _08126A04 @ =0x0000021a
	mov r10, r1
	add r0, r10
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _08126960
	ldr r0, _08126A08 @ =gUnknown_203B0D0
	str r5, [r0]
_08126960:
	ldr r4, _08126A0C @ =sPartyMenuBoxes
	movs r0, 0x9
	ldrsb r0, [r6, r0]
	lsls r0, 4
	ldr r1, [r4]
	adds r1, r0
	adds r0, r5, 0
	bl SetPartyMonAilmentGfx
	ldr r2, _08126A10 @ =gSprites
	movs r0, 0x9
	ldrsb r0, [r6, r0]
	ldr r1, [r4]
	lsls r0, 4
	adds r3, r0, r1
	ldrb r1, [r3, 0xC]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _0812699C
	adds r0, r5, 0
	adds r1, r3, 0
	movs r2, 0x1
	bl DisplayPartyPokemonLevelCheck
_0812699C:
	ldr r0, [r7]
	movs r1, 0x87
	lsls r1, 2
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl AnimatePartySlot
	ldrb r0, [r6, 0x9]
	movs r1, 0x1
	bl AnimatePartySlot
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	mov r2, r8
	subs r3, r2
	lsls r3, 16
	asrs r3, 16
	ldrb r1, [r6, 0x9]
	ldr r0, _08126A14 @ =Task_SacredAshDisplayHPRestored
	str r0, [sp]
	mov r0, r9
	movs r2, 0x1
	bl PartyMenuModifyHP
	mov r0, r9
	movs r1, 0
	mov r2, r8
	bl ResetHPTaskData
	ldr r0, [r7]
	movs r2, 0x86
	lsls r2, 2
	adds r1, r0, r2
	movs r2, 0x1
	strh r2, [r1]
	add r0, r10
	strh r2, [r0]
_081269EE:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126A00: .4byte sPartyMenuInternal
_08126A04: .4byte 0x0000021a
_08126A08: .4byte gUnknown_203B0D0
_08126A0C: .4byte sPartyMenuBoxes
_08126A10: .4byte gSprites
_08126A14: .4byte Task_SacredAshDisplayHPRestored
	thumb_func_end UseSacredAsh

	thumb_func_start Task_SacredAshLoop
Task_SacredAshLoop: @ 8126A18
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08126AF6
	ldr r5, _08126A80 @ =sPartyMenuInternal
	ldr r2, [r5]
	movs r0, 0x86
	lsls r0, 2
	adds r1, r2, r0
	movs r3, 0
	ldrsh r0, [r1, r3]
	ldr r3, _08126A84 @ =gPartyMenu
	cmp r0, 0x1
	bne _08126A4E
	movs r0, 0
	strh r0, [r1]
	movs r1, 0x9
	ldrsb r1, [r3, r1]
	movs r6, 0x87
	lsls r6, 2
	adds r0, r2, r6
	strh r1, [r0]
_08126A4E:
	adds r1, r3, 0
	ldrb r0, [r1, 0x9]
	adds r0, 0x1
	strb r0, [r1, 0x9]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x6
	bne _08126AF0
	ldr r0, [r5]
	ldr r1, _08126A88 @ =0x0000021a
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	cmp r1, 0
	bne _08126A94
	ldr r0, _08126A8C @ =gPartyMenuUseExitCallback
	strb r1, [r0]
	ldr r0, _08126A90 @ =gText_WontHaveEffect
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	b _08126ABE
	.align 2, 0
_08126A80: .4byte sPartyMenuInternal
_08126A84: .4byte gPartyMenu
_08126A88: .4byte 0x0000021a
_08126A8C: .4byte gPartyMenuUseExitCallback
_08126A90: .4byte gText_WontHaveEffect
_08126A94:
	ldr r1, _08126AD4 @ =gPartyMenuUseExitCallback
	movs r0, 0x1
	strb r0, [r1]
	ldrb r1, [r3, 0x8]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	beq _08126AB4
	ldr r0, _08126AD8 @ =gUnknown_203B0D0
	ldr r1, [r0]
	ldr r0, _08126ADC @ =gSpecialVar_ItemId
	ldrh r2, [r0]
	ldr r3, _08126AE0 @ =0x0000ffff
	movs r0, 0x4
	bl ItemUse_SetQuestLogEvent
_08126AB4:
	ldr r0, _08126ADC @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	movs r1, 0x1
	bl RemoveBagItem
_08126ABE:
	ldr r1, _08126AE4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126AE8 @ =Task_ClosePartyMenuAfterText
	str r1, [r0]
	ldr r1, _08126AEC @ =gPartyMenu
	movs r0, 0
	strb r0, [r1, 0x9]
	b _08126AF6
	.align 2, 0
_08126AD4: .4byte gPartyMenuUseExitCallback
_08126AD8: .4byte gUnknown_203B0D0
_08126ADC: .4byte gSpecialVar_ItemId
_08126AE0: .4byte 0x0000ffff
_08126AE4: .4byte gTasks
_08126AE8: .4byte Task_ClosePartyMenuAfterText
_08126AEC: .4byte gPartyMenu
_08126AF0:
	adds r0, r4, 0
	bl UseSacredAsh
_08126AF6:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end Task_SacredAshLoop

	thumb_func_start Task_SacredAshDisplayHPRestored
Task_SacredAshDisplayHPRestored: @ 8126AFC
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08126B44 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08126B48 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08126B4C @ =gStringVar1
	bl GetMonNickname
	ldr r4, _08126B50 @ =gStringVar4
	ldr r1, _08126B54 @ =gText_PkmnHPRestoredByVar2
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r1, _08126B58 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126B5C @ =Task_SacredAshLoop
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08126B44: .4byte gPartyMenu
_08126B48: .4byte gPlayerParty
_08126B4C: .4byte gStringVar1
_08126B50: .4byte gStringVar4
_08126B54: .4byte gText_PkmnHPRestoredByVar2
_08126B58: .4byte gTasks
_08126B5C: .4byte Task_SacredAshLoop
	thumb_func_end Task_SacredAshDisplayHPRestored

	thumb_func_start sub_8126B60
sub_8126B60: @ 8126B60
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x5
	bl PlaySE
	ldr r2, _08126BB0 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r2, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08126BB4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08126BB8 @ =gSpecialVar_ItemId
	ldrh r1, [r1]
	ldrb r2, [r2, 0x9]
	movs r3, 0
	bl PokemonUseItemEffects2
	lsls r0, 24
	cmp r0, 0
	beq _08126BC8
	ldr r1, _08126BBC @ =gPartyMenuUseExitCallback
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08126BC0 @ =gText_WontHaveEffect
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r1, _08126BC4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	str r5, [r0]
	b _08126BCE
	.align 2, 0
_08126BB0: .4byte gPartyMenu
_08126BB4: .4byte gPlayerParty
_08126BB8: .4byte gSpecialVar_ItemId
_08126BBC: .4byte gPartyMenuUseExitCallback
_08126BC0: .4byte gText_WontHaveEffect
_08126BC4: .4byte gTasks
_08126BC8:
	adds r0, r4, 0
	bl sub_8124DC0
_08126BCE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8126B60

	thumb_func_start sub_8126BD4
sub_8126BD4: @ 8126BD4
	push {r4,r5,lr}
	ldr r1, _08126C10 @ =gCB2_AfterEvolution
	ldr r4, _08126C14 @ =gPartyMenu
	ldr r0, [r4]
	str r0, [r1]
	ldrb r0, [r4, 0x9]
	ldr r5, _08126C18 @ =gSpecialVar_ItemId
	ldrh r1, [r5]
	movs r2, 0
	bl ExecuteTableBasedItemEffect_
	movs r1, 0x9
	ldrsb r1, [r4, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08126C1C @ =gPlayerParty
	adds r1, r0
	ldrh r2, [r5]
	ldr r3, _08126C20 @ =0x0000ffff
	movs r0, 0x4
	bl ItemUse_SetQuestLogEvent
	ldrh r0, [r5]
	movs r1, 0x1
	bl RemoveBagItem
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08126C10: .4byte gCB2_AfterEvolution
_08126C14: .4byte gPartyMenu
_08126C18: .4byte gSpecialVar_ItemId
_08126C1C: .4byte gPlayerParty
_08126C20: .4byte 0x0000ffff
	thumb_func_end sub_8126BD4

	thumb_func_start sub_8126C24
sub_8126C24: @ 8126C24
	push {lr}
	bl IsNationalPokedexEnabled
	cmp r0, 0
	bne _08126C60
	ldr r0, _08126C54 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08126C58 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08126C5C @ =gSpecialVar_ItemId
	ldrh r2, [r1]
	movs r1, 0x2
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x97
	bls _08126C60
	movs r0, 0
	b _08126C62
	.align 2, 0
_08126C54: .4byte gPartyMenu
_08126C58: .4byte gPlayerParty
_08126C5C: .4byte gSpecialVar_ItemId
_08126C60:
	movs r0, 0x1
_08126C62:
	pop {r1}
	bx r1
	thumb_func_end sub_8126C24

	thumb_func_start GetItemEffectType
GetItemEffectType: @ 8126C68
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, r1, 0
	subs r2, 0xD
	lsls r0, r2, 16
	lsrs r0, 16
	cmp r0, 0xA5
	bls _08126C7C
	b _08126DBC
_08126C7C:
	cmp r1, 0xAF
	bne _08126C94
	ldr r0, _08126C8C @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _08126C90 @ =0x00003108
	adds r4, r0, r1
	b _08126C9C
	.align 2, 0
_08126C8C: .4byte gSaveBlock1Ptr
_08126C90: .4byte 0x00003108
_08126C94:
	ldr r1, _08126CC4 @ =gItemEffectTable
	lsls r0, r2, 2
	adds r0, r1
	ldr r4, [r0]
_08126C9C:
	ldrb r1, [r4]
	movs r5, 0x3F
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _08126CBE
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08126CBE
	ldrb r0, [r4, 0x2]
	cmp r0, 0
	bne _08126CBE
	ldrb r3, [r4, 0x3]
	movs r0, 0x80
	ands r0, r3
	cmp r0, 0
	beq _08126CC8
_08126CBE:
	movs r0, 0
	b _08126DC2
	.align 2, 0
_08126CC4: .4byte gItemEffectTable
_08126CC8:
	movs r2, 0x40
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _08126CD6
	movs r0, 0xA
	b _08126DC2
_08126CD6:
	adds r0, r2, 0
	ands r0, r3
	cmp r0, 0
	beq _08126CE2
	movs r0, 0x1
	b _08126DC2
_08126CE2:
	adds r2, r5, 0
	ands r2, r3
	cmp r2, 0
	bne _08126CF0
	lsrs r0, r1, 7
	cmp r0, 0
	beq _08126D32
_08126CF0:
	cmp r2, 0x20
	bne _08126CF8
	movs r0, 0x4
	b _08126DC2
_08126CF8:
	cmp r2, 0x10
	bne _08126D00
	movs r0, 0x3
	b _08126DC2
_08126D00:
	cmp r2, 0x8
	bne _08126D08
	movs r0, 0x5
	b _08126DC2
_08126D08:
	cmp r2, 0x4
	bne _08126D10
	movs r0, 0x6
	b _08126DC2
_08126D10:
	cmp r2, 0x2
	bne _08126D18
	movs r0, 0x7
	b _08126DC2
_08126D18:
	cmp r2, 0x1
	bne _08126D20
	movs r0, 0x8
	b _08126DC2
_08126D20:
	lsrs r0, r1, 7
	cmp r0, 0
	beq _08126D2E
	cmp r2, 0
	bne _08126D2E
	movs r0, 0x9
	b _08126DC2
_08126D2E:
	movs r0, 0xB
	b _08126DC2
_08126D32:
	ldrb r1, [r4, 0x4]
	movs r0, 0x44
	ands r0, r1
	adds r2, r1, 0
	cmp r0, 0
	beq _08126D42
	movs r0, 0x2
	b _08126DC2
_08126D42:
	movs r5, 0x2
	adds r0, r5, 0
	ands r0, r2
	cmp r0, 0
	beq _08126D50
	movs r0, 0xC
	b _08126DC2
_08126D50:
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r2
	cmp r0, 0
	beq _08126D5E
	movs r0, 0xD
	b _08126DC2
_08126D5E:
	ldrb r1, [r4, 0x5]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08126D6C
	movs r0, 0xE
	b _08126DC2
_08126D6C:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08126D78
	movs r0, 0xF
	b _08126DC2
_08126D78:
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _08126D84
	movs r0, 0x10
	b _08126DC2
_08126D84:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08126D90
	movs r0, 0x11
	b _08126DC2
_08126D90:
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _08126D9C
	movs r0, 0x12
	b _08126DC2
_08126D9C:
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _08126DA8
	movs r0, 0x13
	b _08126DC2
_08126DA8:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08126DB4
	movs r0, 0x14
	b _08126DC2
_08126DB4:
	movs r0, 0x18
	ands r0, r2
	cmp r0, 0
	bne _08126DC0
_08126DBC:
	movs r0, 0x16
	b _08126DC2
_08126DC0:
	movs r0, 0x15
_08126DC2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetItemEffectType

	thumb_func_start TryTutorSelectedMon
TryTutorSelectedMon: @ 8126DC8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08126E4C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08126E98
	ldr r7, _08126E50 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r7, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08126E54 @ =gPlayerParty
	adds r5, r1, r0
	movs r0, 0xE
	adds r0, r7
	mov r8, r0
	ldr r1, _08126E58 @ =gStringVar1
	adds r0, r5, 0
	bl GetMonNickname
	ldr r4, _08126E5C @ =gSpecialVar_0x8005
	ldrb r0, [r4]
	bl GetTutorMove
	strh r0, [r7, 0xE]
	ldr r0, _08126E60 @ =gStringVar2
	movs r1, 0xE
	ldrsh r2, [r7, r1]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _08126E64 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	movs r0, 0x2
	mov r1, r8
	strh r0, [r1, 0x2]
	ldrb r2, [r4]
	adds r0, r5, 0
	movs r1, 0
	bl CanMonLearnTMTutor
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08126E6C
	cmp r0, 0x2
	beq _08126E74
	ldrh r1, [r7, 0xE]
	adds r0, r5, 0
	bl GiveMoveToMon
	lsls r0, 16
	ldr r1, _08126E68 @ =0xffff0000
	cmp r0, r1
	beq _08126E84
	adds r0, r6, 0
	bl Task_LearnedMove
	b _08126E98
	.align 2, 0
_08126E4C: .4byte gPaletteFade
_08126E50: .4byte gPartyMenu
_08126E54: .4byte gPlayerParty
_08126E58: .4byte gStringVar1
_08126E5C: .4byte gSpecialVar_0x8005
_08126E60: .4byte gStringVar2
_08126E64: .4byte gMoveNames
_08126E68: .4byte 0xffff0000
_08126E6C:
	ldr r1, _08126E70 @ =gText_PkmnCantLearnMove
	b _08126E76
	.align 2, 0
_08126E70: .4byte gText_PkmnCantLearnMove
_08126E74:
	ldr r1, _08126E80 @ =gText_PkmnAlreadyKnows
_08126E76:
	adds r0, r6, 0
	bl DisplayLearnMoveMessageAndClose
	b _08126E98
	.align 2, 0
_08126E80: .4byte gText_PkmnAlreadyKnows
_08126E84:
	ldr r0, _08126EA4 @ =gText_PkmnNeedsToReplaceMove
	bl DisplayLearnMoveMessage
	ldr r1, _08126EA8 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126EAC @ =Task_ReplaceMoveYesNo
	str r1, [r0]
_08126E98:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126EA4: .4byte gText_PkmnNeedsToReplaceMove
_08126EA8: .4byte gTasks
_08126EAC: .4byte Task_ReplaceMoveYesNo
	thumb_func_end TryTutorSelectedMon

	thumb_func_start CB2_PartyMenuFromStartMenu
CB2_PartyMenuFromStartMenu: @ 8126EB0
	push {lr}
	sub sp, 0xC
	movs r0, 0
	str r0, [sp]
	ldr r0, _08126ED4 @ =Task_HandleChooseMonInput
	str r0, [sp, 0x4]
	ldr r0, _08126ED8 @ =CB2_ReturnToFieldWithOpenMenu
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl InitPartyMenu
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08126ED4: .4byte Task_HandleChooseMonInput
_08126ED8: .4byte CB2_ReturnToFieldWithOpenMenu
	thumb_func_end CB2_PartyMenuFromStartMenu

	thumb_func_start CB2_ChooseMonToGiveItem
CB2_ChooseMonToGiveItem: @ 8126EDC
	push {lr}
	sub sp, 0xC
	ldr r0, _08126EF8 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	bl GetPocketByItemId
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _08126F00
	cmp r0, 0x5
	beq _08126F08
	ldr r1, _08126EFC @ =CB2_ReturnToBagMenu
	b _08126F0A
	.align 2, 0
_08126EF8: .4byte gSpecialVar_ItemId
_08126EFC: .4byte CB2_ReturnToBagMenu
_08126F00:
	ldr r1, _08126F04 @ =sub_8124DA0
	b _08126F0A
	.align 2, 0
_08126F04: .4byte sub_8124DA0
_08126F08:
	ldr r1, _08126F30 @ =sub_8124DB0
_08126F0A:
	movs r0, 0x6
	str r0, [sp]
	ldr r0, _08126F34 @ =Task_HandleChooseMonInput
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0x5
	movs r3, 0
	bl InitPartyMenu
	ldr r1, _08126F38 @ =gPartyMenu
	ldr r0, _08126F3C @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	strh r0, [r1, 0xC]
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08126F30: .4byte sub_8124DB0
_08126F34: .4byte Task_HandleChooseMonInput
_08126F38: .4byte gPartyMenu
_08126F3C: .4byte gSpecialVar_ItemId
	thumb_func_end CB2_ChooseMonToGiveItem

	thumb_func_start TryGiveItemOrMailToSelectedMon
TryGiveItemOrMailToSelectedMon: @ 8126F40
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	ldr r5, _08126F80 @ =sPartyMenuItemId
	ldr r0, _08126F84 @ =gPartyMenu
	mov r9, r0
	ldrb r0, [r0, 0x9]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r7, _08126F88 @ =gPlayerParty
	adds r0, r7
	movs r1, 0xC
	bl GetMonData
	strh r0, [r5]
	lsls r0, 16
	cmp r0, 0
	bne _08126F8C
	adds r0, r4, 0
	bl GiveItemOrMailToSelectedMon
	b _08126FC4
	.align 2, 0
_08126F80: .4byte sPartyMenuItemId
_08126F84: .4byte gPartyMenu
_08126F88: .4byte gPlayerParty
_08126F8C:
	ldrh r0, [r5]
	bl ItemIsMail
	lsls r0, 24
	cmp r0, 0
	beq _08126FA0
	adds r0, r4, 0
	bl DisplayItemMustBeRemovedFirstMessage
	b _08126FC4
_08126FA0:
	mov r1, r9
	movs r0, 0x9
	ldrsb r0, [r1, r0]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r7
	ldrh r1, [r5]
	movs r2, 0x1
	bl DisplayAlreadyHoldingItemSwitchMessage
	ldr r1, _08126FD0 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08126FD4 @ =Task_SwitchItemsFromBagYesNo
	str r1, [r0]
_08126FC4:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126FD0: .4byte gTasks
_08126FD4: .4byte Task_SwitchItemsFromBagYesNo
	thumb_func_end TryGiveItemOrMailToSelectedMon

	thumb_func_start GiveItemOrMailToSelectedMon
GiveItemOrMailToSelectedMon: @ 8126FD8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _08127004 @ =gPartyMenu
	ldrh r0, [r5, 0xC]
	bl ItemIsMail
	lsls r0, 24
	cmp r0, 0
	beq _08127010
	ldrh r0, [r5, 0xC]
	bl RemoveItemToGiveFromBag
	ldr r0, _08127008 @ =sPartyMenuInternal
	ldr r1, [r0]
	ldr r0, _0812700C @ =CB2_WriteMailToGiveMonFromBag
	str r0, [r1, 0x4]
	adds r0, r4, 0
	bl Task_ClosePartyMenu
	b _08127016
	.align 2, 0
_08127004: .4byte gPartyMenu
_08127008: .4byte sPartyMenuInternal
_0812700C: .4byte CB2_WriteMailToGiveMonFromBag
_08127010:
	adds r0, r4, 0
	bl GiveItemToSelectedMon
_08127016:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GiveItemOrMailToSelectedMon

	thumb_func_start GiveItemToSelectedMon
GiveItemToSelectedMon: @ 812701C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08127084 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08127078
	ldr r4, _08127088 @ =gPartyMenu
	ldrh r5, [r4, 0xC]
	movs r0, 0x9
	ldrsb r0, [r4, r0]
	movs r1, 0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r6, _0812708C @ =gPlayerParty
	adds r0, r6
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x1
	bl DisplayGaveHeldItemMessage
	movs r0, 0x9
	ldrsb r0, [r4, r0]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	adds r1, r5, 0
	bl GiveItemToMon
	adds r0, r5, 0
	bl RemoveItemToGiveFromBag
	ldr r1, _08127090 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _08127094 @ =Task_UpdateHeldItemSpriteAndClosePartyMenu
	str r1, [r0]
_08127078:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08127084: .4byte gPaletteFade
_08127088: .4byte gPartyMenu
_0812708C: .4byte gPlayerParty
_08127090: .4byte gTasks
_08127094: .4byte Task_UpdateHeldItemSpriteAndClosePartyMenu
	thumb_func_end GiveItemToSelectedMon

	thumb_func_start Task_UpdateHeldItemSpriteAndClosePartyMenu
Task_UpdateHeldItemSpriteAndClosePartyMenu: @ 8127098
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _081270D4 @ =gPartyMenu
	ldrb r4, [r0, 0x9]
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081270CC
	lsls r2, r4, 24
	asrs r2, 24
	movs r0, 0x64
	muls r0, r2
	ldr r1, _081270D8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _081270DC @ =sPartyMenuBoxes
	lsls r2, 4
	ldr r1, [r1]
	adds r1, r2
	bl UpdatePartyMonHeldItemSprite
	adds r0, r5, 0
	bl Task_ClosePartyMenu
_081270CC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081270D4: .4byte gPartyMenu
_081270D8: .4byte gPlayerParty
_081270DC: .4byte sPartyMenuBoxes
	thumb_func_end Task_UpdateHeldItemSpriteAndClosePartyMenu

	thumb_func_start CB2_WriteMailToGiveMonFromBag
CB2_WriteMailToGiveMonFromBag: @ 81270E0
	push {r4-r6,lr}
	ldr r4, _08127128 @ =gPartyMenu
	movs r0, 0x9
	ldrsb r0, [r4, r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0812712C @ =gPlayerParty
	adds r0, r5
	ldrh r1, [r4, 0xC]
	bl GiveItemToMon
	movs r0, 0x9
	ldrsb r0, [r4, r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0x40
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08127130 @ =gSaveBlock1Ptr
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	ldr r0, _08127134 @ =0x00002cd0
	adds r2, r0
	ldr r1, [r1]
	adds r1, r2
	ldr r2, _08127138 @ =CB2_ReturnToPartyOrBagMenuFromWritingMail
	movs r0, 0x4
	bl DoEasyChatScreen
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08127128: .4byte gPartyMenu
_0812712C: .4byte gPlayerParty
_08127130: .4byte gSaveBlock1Ptr
_08127134: .4byte 0x00002cd0
_08127138: .4byte CB2_ReturnToPartyOrBagMenuFromWritingMail
	thumb_func_end CB2_WriteMailToGiveMonFromBag

	thumb_func_start CB2_ReturnToPartyOrBagMenuFromWritingMail
CB2_ReturnToPartyOrBagMenuFromWritingMail: @ 812713C
	push {r4-r7,lr}
	sub sp, 0xC
	ldr r6, _0812718C @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r6, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08127190 @ =gPlayerParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, _08127194 @ =gSpecialVar_Result
	ldrh r0, [r0]
	cmp r0, 0
	bne _0812719C
	adds r0, r5, 0
	bl TakeMailFromMon
	ldr r4, _08127198 @ =sPartyMenuItemId
	adds r0, r5, 0
	movs r1, 0xC
	adds r2, r4, 0
	bl SetMonData
	ldrh r0, [r4]
	movs r1, 0x1
	bl RemoveBagItem
	adds r0, r7, 0
	bl ReturnGiveItemToBagOrPC
	ldr r0, [r6]
	bl SetMainCallback2
	b _081271B8
	.align 2, 0
_0812718C: .4byte gPartyMenu
_08127190: .4byte gPlayerParty
_08127194: .4byte gSpecialVar_Result
_08127198: .4byte sPartyMenuItemId
_0812719C:
	ldrb r0, [r6, 0x8]
	lsls r0, 28
	lsrs r0, 28
	ldrb r2, [r6, 0xB]
	movs r1, 0x7F
	str r1, [sp]
	ldr r1, _081271C0 @ =Task_DisplayGaveMailFromBagMessage
	str r1, [sp, 0x4]
	ldr r1, [r6]
	str r1, [sp, 0x8]
	movs r1, 0xFF
	movs r3, 0x1
	bl InitPartyMenu
_081271B8:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081271C0: .4byte Task_DisplayGaveMailFromBagMessage
	thumb_func_end CB2_ReturnToPartyOrBagMenuFromWritingMail

	thumb_func_start Task_DisplayGaveMailFromBagMessage
Task_DisplayGaveMailFromBagMessage: @ 81271C4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081271EC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812721E
	ldr r1, _081271F0 @ =sPartyMenuItemId
	ldrh r0, [r1]
	cmp r0, 0
	beq _081271F8
	ldr r0, _081271F4 @ =gPartyMenu
	ldrh r0, [r0, 0xC]
	ldrh r1, [r1]
	movs r2, 0
	bl DisplaySwitchedHeldItemMessage
	b _08127210
	.align 2, 0
_081271EC: .4byte gPaletteFade
_081271F0: .4byte sPartyMenuItemId
_081271F4: .4byte gPartyMenu
_081271F8:
	ldr r2, _08127224 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r2, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08127228 @ =gPlayerParty
	adds r0, r1
	ldrh r1, [r2, 0xC]
	movs r2, 0
	movs r3, 0x1
	bl DisplayGaveHeldItemMessage
_08127210:
	ldr r0, _0812722C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08127230 @ =Task_UpdateHeldItemSpriteAndClosePartyMenu
	str r0, [r1]
_0812721E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127224: .4byte gPartyMenu
_08127228: .4byte gPlayerParty
_0812722C: .4byte gTasks
_08127230: .4byte Task_UpdateHeldItemSpriteAndClosePartyMenu
	thumb_func_end Task_DisplayGaveMailFromBagMessage

	thumb_func_start Task_SwitchItemsFromBagYesNo
Task_SwitchItemsFromBagYesNo: @ 8127234
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsPartyMenuTextPrinterActive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08127258
	bl PartyMenuDisplayYesNoMenu
	ldr r0, _08127260 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08127264 @ =Task_HandleSwitchItemsFromBagYesNoInput
	str r0, [r1]
_08127258:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127260: .4byte gTasks
_08127264: .4byte Task_HandleSwitchItemsFromBagYesNoInput
	thumb_func_end Task_SwitchItemsFromBagYesNo

	thumb_func_start Task_HandleSwitchItemsFromBagYesNoInput
Task_HandleSwitchItemsFromBagYesNoInput: @ 8127268
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0812728E
	cmp r1, 0
	bgt _08127288
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08127328
	b _0812733C
_08127288:
	cmp r1, 0x1
	beq _0812732E
	b _0812733C
_0812728E:
	ldr r7, _081272C0 @ =gPartyMenu
	ldrh r4, [r7, 0xC]
	adds r0, r4, 0
	bl RemoveItemToGiveFromBag
	ldr r6, _081272C4 @ =sPartyMenuItemId
	ldrh r0, [r6]
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	cmp r0, 0
	bne _081272CC
	adds r0, r4, 0
	bl ReturnGiveItemToBagOrPC
	ldrh r0, [r6]
	bl BufferBagFullCantTakeItemMessage
	ldr r0, _081272C8 @ =gStringVar4
	movs r1, 0
	bl DisplayPartyMenuMessage
	b _0812730C
	.align 2, 0
_081272C0: .4byte gPartyMenu
_081272C4: .4byte sPartyMenuItemId
_081272C8: .4byte gStringVar4
_081272CC:
	adds r0, r4, 0
	bl ItemIsMail
	lsls r0, 24
	cmp r0, 0
	beq _081272F0
	ldr r0, _081272E8 @ =sPartyMenuInternal
	ldr r1, [r0]
	ldr r0, _081272EC @ =CB2_WriteMailToGiveMonFromBag
	str r0, [r1, 0x4]
	adds r0, r5, 0
	bl Task_ClosePartyMenu
	b _0812733C
	.align 2, 0
_081272E8: .4byte sPartyMenuInternal
_081272EC: .4byte CB2_WriteMailToGiveMonFromBag
_081272F0:
	movs r1, 0x9
	ldrsb r1, [r7, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0812731C @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	bl GiveItemToMon
	ldrh r1, [r6]
	adds r0, r4, 0
	movs r2, 0x1
	bl DisplaySwitchedHeldItemMessage
_0812730C:
	ldr r1, _08127320 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08127324 @ =Task_UpdateHeldItemSpriteAndClosePartyMenu
	str r1, [r0]
	b _0812733C
	.align 2, 0
_0812731C: .4byte gPlayerParty
_08127320: .4byte gTasks
_08127324: .4byte Task_UpdateHeldItemSpriteAndClosePartyMenu
_08127328:
	movs r0, 0x5
	bl PlaySE
_0812732E:
	ldr r0, _08127344 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08127348 @ =Task_UpdateHeldItemSpriteAndClosePartyMenu
	str r0, [r1]
_0812733C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08127344: .4byte gTasks
_08127348: .4byte Task_UpdateHeldItemSpriteAndClosePartyMenu
	thumb_func_end Task_HandleSwitchItemsFromBagYesNoInput

	thumb_func_start DisplayItemMustBeRemovedFirstMessage
DisplayItemMustBeRemovedFirstMessage: @ 812734C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08127378 @ =gUnknown_8416BFB
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r1, _0812737C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08127380 @ =Task_UpdateHeldItemSpriteAndClosePartyMenu
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127378: .4byte gUnknown_8416BFB
_0812737C: .4byte gTasks
_08127380: .4byte Task_UpdateHeldItemSpriteAndClosePartyMenu
	thumb_func_end DisplayItemMustBeRemovedFirstMessage

	thumb_func_start RemoveItemToGiveFromBag
RemoveItemToGiveFromBag: @ 8127384
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _0812739C @ =gPartyMenu
	ldrb r0, [r0, 0xB]
	cmp r0, 0x6
	bne _081273A0
	adds r0, r1, 0
	movs r1, 0x1
	bl RemoveItemFromPC
	b _081273A8
	.align 2, 0
_0812739C: .4byte gPartyMenu
_081273A0:
	adds r0, r1, 0
	movs r1, 0x1
	bl RemoveBagItem
_081273A8:
	pop {r0}
	bx r0
	thumb_func_end RemoveItemToGiveFromBag

	thumb_func_start ReturnGiveItemToBagOrPC
ReturnGiveItemToBagOrPC: @ 81273AC
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _081273C4 @ =gPartyMenu
	ldrb r0, [r0, 0xB]
	cmp r0, 0x5
	beq _081273C8
	adds r0, r1, 0
	movs r1, 0x1
	bl AddPCItem
	b _081273D0
	.align 2, 0
_081273C4: .4byte gPartyMenu
_081273C8:
	adds r0, r1, 0
	movs r1, 0x1
	bl AddBagItem
_081273D0:
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end ReturnGiveItemToBagOrPC

	thumb_func_start ChooseMonToGiveMailFromMailbox
ChooseMonToGiveMailFromMailbox: @ 81273D8
	push {lr}
	sub sp, 0xC
	movs r0, 0x6
	str r0, [sp]
	ldr r0, _081273FC @ =Task_HandleChooseMonInput
	str r0, [sp, 0x4]
	ldr r0, _08127400 @ =CB2_PlayerPC_ReturnFromPartyMenu
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0x7
	movs r3, 0
	bl InitPartyMenu
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_081273FC: .4byte Task_HandleChooseMonInput
_08127400: .4byte CB2_PlayerPC_ReturnFromPartyMenu
	thumb_func_end ChooseMonToGiveMailFromMailbox

	thumb_func_start TryGiveMailToSelectedMon
TryGiveMailToSelectedMon: @ 8127404
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08127450 @ =gPartyMenu
	movs r1, 0x9
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08127454 @ =gPlayerParty
	adds r5, r1, r0
	ldr r1, _08127458 @ =gPartyMenuUseExitCallback
	movs r0, 0
	strb r0, [r1]
	ldr r2, _0812745C @ =gSaveBlock1Ptr
	ldr r0, _08127460 @ =gPlayerPcMenuManager
	ldrh r1, [r0]
	adds r1, 0x6
	ldrh r0, [r0, 0x2]
	adds r1, r0
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08127464 @ =0x00002cd0
	adds r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	adds r0, r5, 0
	movs r1, 0xC
	bl GetMonData
	cmp r0, 0
	beq _0812746C
	ldr r0, _08127468 @ =gText_PkmnHoldingItemCantHoldMail
	movs r1, 0x1
	bl DisplayPartyMenuMessage
	b _08127482
	.align 2, 0
_08127450: .4byte gPartyMenu
_08127454: .4byte gPlayerParty
_08127458: .4byte gPartyMenuUseExitCallback
_0812745C: .4byte gSaveBlock1Ptr
_08127460: .4byte gPlayerPcMenuManager
_08127464: .4byte 0x00002cd0
_08127468: .4byte gText_PkmnHoldingItemCantHoldMail
_0812746C:
	adds r0, r5, 0
	adds r1, r4, 0
	bl GiveMailToMon2
	adds r0, r4, 0
	bl ClearMailStruct
	ldr r0, _0812749C @ =gText_MailTransferredFromMailbox
	movs r1, 0x1
	bl DisplayPartyMenuMessage
_08127482:
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r0, _081274A0 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _081274A4 @ =Task_UpdateHeldItemSpriteAndClosePartyMenu
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812749C: .4byte gText_MailTransferredFromMailbox
_081274A0: .4byte gTasks
_081274A4: .4byte Task_UpdateHeldItemSpriteAndClosePartyMenu
	thumb_func_end TryGiveMailToSelectedMon

	thumb_func_start InitChooseHalfPartyForBattle
InitChooseHalfPartyForBattle: @ 81274A8
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ClearSelectedPartyOrder
	movs r0, 0
	str r0, [sp]
	ldr r0, _081274EC @ =Task_HandleChooseMonInput
	str r0, [sp, 0x4]
	ldr r0, _081274F0 @ =gMain
	ldr r0, [r0, 0x8]
	str r0, [sp, 0x8]
	movs r0, 0x4
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl InitPartyMenu
	ldr r1, _081274F4 @ =gPartyMenu
	lsls r4, 6
	ldrb r2, [r1, 0x8]
	movs r0, 0x3F
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, 0x8]
	ldr r0, _081274F8 @ =Task_ValidateChosenHalfParty
	str r0, [r1, 0x4]
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081274EC: .4byte Task_HandleChooseMonInput
_081274F0: .4byte gMain
_081274F4: .4byte gPartyMenu
_081274F8: .4byte Task_ValidateChosenHalfParty
	thumb_func_end InitChooseHalfPartyForBattle

	thumb_func_start ClearSelectedPartyOrder
ClearSelectedPartyOrder: @ 81274FC
	push {lr}
	ldr r0, _0812750C @ =gSelectedOrderFromParty
	movs r1, 0
	movs r2, 0x3
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_0812750C: .4byte gSelectedOrderFromParty
	thumb_func_end ClearSelectedPartyOrder

	thumb_func_start GetPartySlotEntryStatus
GetPartySlotEntryStatus: @ 8127510
	push {r4,lr}
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0812752C @ =gPlayerParty
	adds r0, r1
	bl GetBattleEntryEligibility
	lsls r0, 24
	cmp r0, 0
	bne _08127530
	movs r0, 0x2
	b _08127548
	.align 2, 0
_0812752C: .4byte gPlayerParty
_08127530:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r0, 24
	bl HasPartySlotAlreadyBeenSelected
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08127546
	movs r0, 0
	b _08127548
_08127546:
	movs r0, 0x1
_08127548:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetPartySlotEntryStatus

	thumb_func_start GetBattleEntryEligibility
GetBattleEntryEligibility: @ 8127550
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0812757A
	ldr r0, _08127580 @ =gPartyMenu
	ldrb r0, [r0, 0x8]
	lsrs r1, r0, 6
	cmp r1, 0
	beq _08127584
	cmp r1, 0x1
	beq _08127592
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x1E
	bls _081275E0
_0812757A:
	movs r0, 0
	b _081275E2
	.align 2, 0
_08127580: .4byte gPartyMenu
_08127584:
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _081275E0
	b _0812757A
_08127592:
	ldr r0, _081275E8 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r2, _081275EC @ =0x0000055c
	adds r0, r2
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _081275AE
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x32
	bhi _0812757A
_081275AE:
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r3, _081275F0 @ =gBattleTowerBannedSpecies
	lsls r1, r5, 1
	adds r0, r1, r3
	ldrh r0, [r0]
	ldr r2, _081275F4 @ =0x0000ffff
	cmp r0, r2
	beq _081275E0
_081275C8:
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, r4
	beq _0812757A
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, r5, 1
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _081275C8
_081275E0:
	movs r0, 0x1
_081275E2:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081275E8: .4byte gSaveBlock2Ptr
_081275EC: .4byte 0x0000055c
_081275F0: .4byte gBattleTowerBannedSpecies
_081275F4: .4byte 0x0000ffff
	thumb_func_end GetBattleEntryEligibility

	thumb_func_start CheckBattleEntriesAndGetMessage
CheckBattleEntriesAndGetMessage: @ 81275F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08127618 @ =gPlayerParty
	mov r10, r0
	ldr r0, _0812761C @ =gPartyMenu
	ldrb r0, [r0, 0x8]
	lsrs r0, 6
	cmp r0, 0x1
	beq _08127620
	cmp r0, 0x2
	beq _081276E8
	b _08127700
	.align 2, 0
_08127618: .4byte gPlayerParty
_0812761C: .4byte gPartyMenu
_08127620:
	ldr r1, _0812762C @ =gSelectedOrderFromParty
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	bne _08127630
	movs r0, 0x11
	b _08127702
	.align 2, 0
_0812762C: .4byte gSelectedOrderFromParty
_08127630:
	movs r5, 0
_08127632:
	ldr r2, _081276DC @ =gSelectedOrderFromParty
	adds r4, r2, r5
	ldrb r0, [r4]
	movs r1, 0x64
	muls r0, r1
	subs r0, 0x64
	add r0, r10
	movs r1, 0xB
	bl GetMonData
	ldr r2, _081276E0 @ =sPartyMenuInternal
	ldr r1, [r2]
	ldr r2, _081276E4 @ =0x00000236
	adds r1, r2
	strh r0, [r1]
	ldrb r0, [r4]
	movs r1, 0x64
	muls r0, r1
	subs r0, 0x64
	add r0, r10
	movs r1, 0xC
	bl GetMonData
	ldr r2, _081276E0 @ =sPartyMenuInternal
	ldr r1, [r2]
	movs r2, 0x8D
	lsls r2, 2
	adds r1, r2
	strh r0, [r1]
	adds r1, r5, 0x1
	lsls r0, r1, 24
	lsrs r5, r0, 24
	mov r9, r1
	cmp r5, 0x2
	bhi _081276D0
	ldr r0, _081276E0 @ =sPartyMenuInternal
	mov r8, r0
	movs r7, 0x64
_0812767E:
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _081276E4 @ =0x00000236
	adds r0, r2
	movs r1, 0
	ldrsh r4, [r0, r1]
	ldr r2, _081276DC @ =gSelectedOrderFromParty
	adds r6, r2, r5
	ldrb r0, [r6]
	muls r0, r7
	subs r0, 0x64
	add r0, r10
	movs r1, 0xB
	bl GetMonData
	cmp r4, r0
	beq _081276F8
	mov r1, r8
	ldr r0, [r1]
	movs r2, 0x8D
	lsls r2, 2
	adds r1, r0, r2
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _081276C6
	adds r4, r0, 0
	ldrb r0, [r6]
	muls r0, r7
	subs r0, 0x64
	add r0, r10
	movs r1, 0xC
	bl GetMonData
	cmp r4, r0
	beq _081276FC
_081276C6:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _0812767E
_081276D0:
	mov r1, r9
	lsls r0, r1, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _08127632
	b _08127700
	.align 2, 0
_081276DC: .4byte gSelectedOrderFromParty
_081276E0: .4byte sPartyMenuInternal
_081276E4: .4byte 0x00000236
_081276E8:
	ldr r2, _081276F4 @ =gSelectedOrderFromParty
	ldrb r0, [r2, 0x1]
	cmp r0, 0
	bne _08127700
	movs r0, 0x12
	b _08127702
	.align 2, 0
_081276F4: .4byte gSelectedOrderFromParty
_081276F8:
	movs r0, 0x13
	b _08127702
_081276FC:
	movs r0, 0x14
	b _08127702
_08127700:
	movs r0, 0xFF
_08127702:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckBattleEntriesAndGetMessage

	thumb_func_start HasPartySlotAlreadyBeenSelected
HasPartySlotAlreadyBeenSelected: @ 8127710
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	ldr r3, _08127728 @ =gSelectedOrderFromParty
_0812771A:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _0812772C
	movs r0, 0x1
	b _08127738
	.align 2, 0
_08127728: .4byte gSelectedOrderFromParty
_0812772C:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bls _0812771A
	movs r0, 0
_08127738:
	pop {r1}
	bx r1
	thumb_func_end HasPartySlotAlreadyBeenSelected

	thumb_func_start Task_ValidateChosenHalfParty
Task_ValidateChosenHalfParty: @ 812773C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	bl CheckBattleEntriesAndGetMessage
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	beq _08127768
	movs r0, 0x1A
	bl PlaySE
	adds r0, r4, 0
	bl DisplayPartyMenuStdMessage
	ldr r0, _08127764 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	b _08127796
	.align 2, 0
_08127764: .4byte gTasks
_08127768:
	ldr r0, _08127780 @ =gSelectedOrderFromParty
	ldrb r0, [r0]
	cmp r0, 0
	beq _08127784
	movs r0, 0x5
	bl PlaySE
	adds r0, r5, 0
	bl Task_ClosePartyMenu
	b _0812779E
	.align 2, 0
_08127780: .4byte gSelectedOrderFromParty
_08127784:
	movs r0, 0x1A
	bl PlaySE
	movs r0, 0xE
	bl DisplayPartyMenuStdMessage
	ldr r0, _081277A4 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
_08127796:
	lsls r1, 3
	adds r1, r0
	ldr r0, _081277A8 @ =Task_ContinueChoosingHalfParty
	str r0, [r1]
_0812779E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081277A4: .4byte gTasks
_081277A8: .4byte Task_ContinueChoosingHalfParty
	thumb_func_end Task_ValidateChosenHalfParty

	thumb_func_start Task_ContinueChoosingHalfParty
Task_ContinueChoosingHalfParty: @ 81277AC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081277E8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081277C6
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081277E0
_081277C6:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl DisplayPartyMenuStdMessage
	ldr r0, _081277EC @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _081277F0 @ =Task_HandleChooseMonInput
	str r0, [r1]
_081277E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081277E8: .4byte gMain
_081277EC: .4byte gTasks
_081277F0: .4byte Task_HandleChooseMonInput
	thumb_func_end Task_ContinueChoosingHalfParty

	thumb_func_start ChooseMonForMoveTutor
ChooseMonForMoveTutor: @ 81277F4
	push {lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	str r2, [sp]
	ldr r2, _08127818 @ =Task_HandleChooseMonInput
	str r2, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl InitPartyMenu
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08127818: .4byte Task_HandleChooseMonInput
	thumb_func_end ChooseMonForMoveTutor

	thumb_func_start sub_812781C
sub_812781C: @ 812781C
	push {lr}
	sub sp, 0xC
	ldr r0, _08127844 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	cmp r0, 0xE
	bhi _08127850
	movs r0, 0x4
	str r0, [sp]
	ldr r0, _08127848 @ =Task_HandleChooseMonInput
	str r0, [sp, 0x4]
	ldr r0, _0812784C @ =CB2_ReturnToFieldContinueScriptPlayMapMusic
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0xC
	movs r3, 0
	bl InitPartyMenu
	b _08127870
	.align 2, 0
_08127844: .4byte gSpecialVar_0x8005
_08127848: .4byte Task_HandleChooseMonInput
_0812784C: .4byte CB2_ReturnToFieldContinueScriptPlayMapMusic
_08127850:
	movs r0, 0x7F
	str r0, [sp]
	ldr r0, _08127878 @ =TryTutorSelectedMon
	str r0, [sp, 0x4]
	ldr r0, _0812787C @ =CB2_ReturnToFieldContinueScriptPlayMapMusic
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0xC
	movs r3, 0
	bl InitPartyMenu
	ldr r1, _08127880 @ =gPartyMenu
	ldr r0, _08127884 @ =gSpecialVar_0x8007
	ldrh r0, [r0]
	strb r0, [r1, 0x9]
_08127870:
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08127878: .4byte TryTutorSelectedMon
_0812787C: .4byte CB2_ReturnToFieldContinueScriptPlayMapMusic
_08127880: .4byte gPartyMenu
_08127884: .4byte gSpecialVar_0x8007
	thumb_func_end sub_812781C

	thumb_func_start ChooseMonForWirelessMinigame
ChooseMonForWirelessMinigame: @ 8127888
	push {lr}
	sub sp, 0xC
	movs r0, 0x1
	str r0, [sp]
	ldr r0, _081278AC @ =Task_HandleChooseMonInput
	str r0, [sp, 0x4]
	ldr r0, _081278B0 @ =CB2_ReturnToFieldContinueScriptPlayMapMusic
	str r0, [sp, 0x8]
	movs r0, 0xB
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl InitPartyMenu
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_081278AC: .4byte Task_HandleChooseMonInput
_081278B0: .4byte CB2_ReturnToFieldContinueScriptPlayMapMusic
	thumb_func_end ChooseMonForWirelessMinigame

	thumb_func_start GetPartyLayoutFromBattleType
GetPartyLayoutFromBattleType: @ 81278B4
	push {lr}
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	bne _081278C4
	movs r0, 0
	b _081278D6
_081278C4:
	bl IsMultiBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081278D4
	movs r0, 0x1
	b _081278D6
_081278D4:
	movs r0, 0x2
_081278D6:
	pop {r1}
	bx r1
	thumb_func_end GetPartyLayoutFromBattleType

	thumb_func_start OpenPartyMenuInTutorialBattle
OpenPartyMenuInTutorialBattle: @ 81278DC
	push {r4,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x8
	bl sub_80EB2E0
	lsls r0, 24
	cmp r0, 0
	bne _08127930
	ldr r0, _08127924 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08127930
	bl GetPartyLayoutFromBattleType
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x7F
	str r0, [sp]
	ldr r0, _08127928 @ =sub_8120C3C
	str r0, [sp, 0x4]
	ldr r0, _0812792C @ =SetCB2ToReshowScreenAfterMenu
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r2, r4, 0
	movs r3, 0
	bl InitPartyMenu
	movs r0, 0x8
	bl sub_80EB2F4
	b _08127950
	.align 2, 0
_08127924: .4byte gBattleTypeFlags
_08127928: .4byte sub_8120C3C
_0812792C: .4byte SetCB2ToReshowScreenAfterMenu
_08127930:
	bl GetPartyLayoutFromBattleType
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	str r0, [sp]
	ldr r0, _08127960 @ =Task_HandleChooseMonInput
	str r0, [sp, 0x4]
	ldr r0, _08127964 @ =SetCB2ToReshowScreenAfterMenu
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r2, r4, 0
	movs r3, 0
	bl InitPartyMenu
_08127950:
	bl nullsub_44
	bl UpdatePartyToBattleOrder
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127960: .4byte Task_HandleChooseMonInput
_08127964: .4byte SetCB2ToReshowScreenAfterMenu
	thumb_func_end OpenPartyMenuInTutorialBattle

	thumb_func_start OpenPartyMenuInBattle
OpenPartyMenuInBattle: @ 8127968
	push {lr}
	sub sp, 0xC
	bl GetPartyLayoutFromBattleType
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	str r0, [sp]
	ldr r0, _0812799C @ =sub_8120EBC
	str r0, [sp, 0x4]
	ldr r0, _081279A0 @ =SetCB2ToReshowScreenAfterMenu
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl InitPartyMenu
	bl nullsub_44
	bl UpdatePartyToBattleOrder
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_0812799C: .4byte sub_8120EBC
_081279A0: .4byte SetCB2ToReshowScreenAfterMenu
	thumb_func_end OpenPartyMenuInBattle

	thumb_func_start ChooseMonForInBattleItem
ChooseMonForInBattleItem: @ 81279A4
	push {lr}
	sub sp, 0xC
	bl GetPartyLayoutFromBattleType
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x5
	str r0, [sp]
	ldr r0, _081279D8 @ =sub_8120FCC
	str r0, [sp, 0x4]
	ldr r0, _081279DC @ =sub_8107ECC
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0xE
	movs r3, 0
	bl InitPartyMenu
	bl nullsub_44
	bl UpdatePartyToBattleOrder
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_081279D8: .4byte sub_8120FCC
_081279DC: .4byte sub_8107ECC
	thumb_func_end ChooseMonForInBattleItem

	thumb_func_start sub_81279E0
sub_81279E0: @ 81279E0
	push {r4,lr}
	sub sp, 0xC
	movs r0, 0x8
	bl sub_80EB2E0
	lsls r0, 24
	cmp r0, 0
	bne _08127A30
	ldr r0, _08127A24 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08127A30
	bl GetPartyLayoutFromBattleType
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x7F
	str r0, [sp]
	ldr r0, _08127A28 @ =sub_8120C3C
	str r0, [sp, 0x4]
	ldr r0, _08127A2C @ =sub_8107ECC
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x3
	movs r3, 0
	bl InitPartyMenu
	movs r0, 0x8
	bl sub_80EB2F4
	b _08127A62
	.align 2, 0
_08127A24: .4byte gBattleTypeFlags
_08127A28: .4byte sub_8120C3C
_08127A2C: .4byte sub_8107ECC
_08127A30:
	ldr r0, _08127A74 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	bl GetPocketByItemId
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08127A78 @ =sub_8107ECC
	cmp r0, 0x5
	bne _08127A44
	ldr r4, _08127A7C @ =sub_8124DB0
_08127A44:
	bl GetPartyLayoutFromBattleType
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x5
	str r0, [sp]
	ldr r0, _08127A80 @ =Task_HandleChooseMonInput
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x3
	movs r3, 0
	bl InitPartyMenu
_08127A62:
	bl nullsub_44
	bl UpdatePartyToBattleOrder
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127A74: .4byte gSpecialVar_ItemId
_08127A78: .4byte sub_8107ECC
_08127A7C: .4byte sub_8124DB0
_08127A80: .4byte Task_HandleChooseMonInput
	thumb_func_end sub_81279E0

	thumb_func_start GetPartyMenuActionsTypeInBattle
GetPartyMenuActionsTypeInBattle: @ 8127A84
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08127AA4 @ =gPlayerParty + 100 @ &gPlayerParty[1]
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08127AA0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _08127AA8
_08127AA0:
	movs r0, 0x7
	b _08127ABA
	.align 2, 0
_08127AA4: .4byte gPlayerParty + 100 @ &gPlayerParty[1]
_08127AA8:
	ldr r0, _08127AB4 @ =gPartyMenu
	ldrb r0, [r0, 0xB]
	cmp r0, 0x1
	beq _08127AB8
	movs r0, 0x2
	b _08127ABA
	.align 2, 0
_08127AB4: .4byte gPartyMenu
_08127AB8:
	movs r0, 0x3
_08127ABA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetPartyMenuActionsTypeInBattle

	thumb_func_start TrySwitchInPokemon
TrySwitchInPokemon: @ 8127AC0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	bl GetCursorSelectionMonId
	lsls r0, 24
	lsrs r5, r0, 24
	bl IsMultiBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08127B08
	cmp r5, 0x1
	beq _08127AE6
	cmp r5, 0x4
	beq _08127AE6
	cmp r5, 0x5
	bne _08127B08
_08127AE6:
	ldr r4, _08127AFC @ =gStringVar1
	bl GetTrainerPartnerName
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldr r0, _08127B00 @ =gStringVar4
	ldr r1, _08127B04 @ =gUnknown_8416A98
	b _08127C86
	.align 2, 0
_08127AFC: .4byte gStringVar1
_08127B00: .4byte gStringVar4
_08127B04: .4byte gUnknown_8416A98
_08127B08:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08127B2C @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _08127B3C
	ldr r1, _08127B30 @ =gStringVar1
	adds r0, r4, 0
	bl GetMonNickname
	ldr r0, _08127B34 @ =gStringVar4
	ldr r1, _08127B38 @ =gUnknown_8416A75
	b _08127C86
	.align 2, 0
_08127B2C: .4byte gPlayerParty
_08127B30: .4byte gStringVar1
_08127B34: .4byte gStringVar4
_08127B38: .4byte gUnknown_8416A75
_08127B3C:
	movs r4, 0
	b _08127B68
_08127B40:
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08127B62
	adds r0, r5, 0
	bl GetPartyIdFromBattleSlot
	lsls r0, 24
	ldr r2, _08127B90 @ =gBattlerPartyIndexes
	lsls r1, r4, 1
	adds r1, r2
	lsrs r0, 24
	ldrh r1, [r1]
	cmp r0, r1
	beq _08127C40
_08127B62:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_08127B68:
	ldr r0, _08127B94 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r4, r0
	bcc _08127B40
	movs r7, 0x64
	adds r0, r5, 0
	muls r0, r7
	ldr r1, _08127B98 @ =gPlayerParty
	mov r8, r1
	adds r6, r0, r1
	adds r0, r6, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _08127BA4
	ldr r0, _08127B9C @ =gStringVar4
	ldr r1, _08127BA0 @ =gUnknown_8416ACB
	b _08127C86
	.align 2, 0
_08127B90: .4byte gBattlerPartyIndexes
_08127B94: .4byte gBattlersCount
_08127B98: .4byte gPlayerParty
_08127B9C: .4byte gStringVar4
_08127BA0: .4byte gUnknown_8416ACB
_08127BA4:
	adds r0, r5, 0
	bl GetPartyIdFromBattleSlot
	ldr r1, _08127BC8 @ =gBattleStruct
	ldr r1, [r1]
	adds r1, 0x8B
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _08127BD8
	ldr r1, _08127BCC @ =gStringVar1
	adds r0, r6, 0
	bl GetMonNickname
	ldr r0, _08127BD0 @ =gStringVar4
	ldr r1, _08127BD4 @ =gUnknown_8416A55
	b _08127C86
	.align 2, 0
_08127BC8: .4byte gBattleStruct
_08127BCC: .4byte gStringVar1
_08127BD0: .4byte gStringVar4
_08127BD4: .4byte gUnknown_8416A55
_08127BD8:
	ldr r0, _08127BE8 @ =gPartyMenu
	ldrb r0, [r0, 0xB]
	cmp r0, 0x4
	bne _08127BEC
	bl SetMonPreventsSwitchingString
	b _08127C8A
	.align 2, 0
_08127BE8: .4byte gPartyMenu
_08127BEC:
	cmp r0, 0x2
	beq _08127C64
	adds r0, r5, 0
	bl GetPartyIdFromBattleSlot
	ldr r1, _08127C30 @ =gSelectedMonPartyId
	strb r0, [r1]
	ldr r1, _08127C34 @ =gPartyMenuUseExitCallback
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _08127C38 @ =gBattlerPartyIndexes
	ldr r0, _08127C3C @ =gBattlerInMenuId
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl SwitchPartyMonSlots
	adds r0, r4, 0
	muls r0, r7
	add r0, r8
	adds r1, r6, 0
	bl SwapPartyPokemon
	movs r0, 0x1
	b _08127C8C
	.align 2, 0
_08127C30: .4byte gSelectedMonPartyId
_08127C34: .4byte gPartyMenuUseExitCallback
_08127C38: .4byte gBattlerPartyIndexes
_08127C3C: .4byte gBattlerInMenuId
_08127C40:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08127C54 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08127C58 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _08127C5C @ =gStringVar4
	ldr r1, _08127C60 @ =gUnknown_8416A3A
	b _08127C86
	.align 2, 0
_08127C54: .4byte gPlayerParty
_08127C58: .4byte gStringVar1
_08127C5C: .4byte gStringVar4
_08127C60: .4byte gUnknown_8416A3A
_08127C64:
	ldr r0, _08127C98 @ =gBattlerInMenuId
	ldrb r0, [r0]
	ldr r1, _08127C9C @ =gBattlerPartyIndexes
	lsls r0, 1
	adds r0, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	lsls r0, 24
	lsrs r0, 24
	muls r0, r7
	add r0, r8
	ldr r1, _08127CA0 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _08127CA4 @ =gStringVar4
	ldr r1, _08127CA8 @ =gUnknown_8416A1E
_08127C86:
	bl StringExpandPlaceholders
_08127C8A:
	movs r0, 0
_08127C8C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08127C98: .4byte gBattlerInMenuId
_08127C9C: .4byte gBattlerPartyIndexes
_08127CA0: .4byte gStringVar1
_08127CA4: .4byte gStringVar4
_08127CA8: .4byte gUnknown_8416A1E
	thumb_func_end TrySwitchInPokemon

	thumb_func_start BufferBattlePartyCurrentOrder
BufferBattlePartyCurrentOrder: @ 8127CAC
	push {r4,lr}
	ldr r4, _08127CC8 @ =gBattlePartyCurrentOrder
	bl sub_80435E0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl BufferBattlePartyOrder
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127CC8: .4byte gBattlePartyCurrentOrder
	thumb_func_end BufferBattlePartyCurrentOrder

	thumb_func_start BufferBattlePartyOrder
BufferBattlePartyOrder: @ 8127CCC
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	bl IsMultiBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08127D02
	cmp r4, 0
	beq _08127CF4
	movs r0, 0x30
	strb r0, [r6]
	movs r0, 0x45
	strb r0, [r6, 0x1]
	movs r0, 0x12
	strb r0, [r6, 0x2]
	b _08127D9C
_08127CF4:
	movs r0, 0x3
	strb r0, [r6]
	movs r0, 0x12
	strb r0, [r6, 0x1]
	movs r0, 0x45
	strb r0, [r6, 0x2]
	b _08127D9C
_08127D02:
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	bne _08127D40
	movs r5, 0x1
	movs r0, 0
	bl GetBattlerAtPosition
	mov r2, sp
	ldr r1, _08127D3C @ =gBattlerPartyIndexes
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r0, [r0]
	strb r0, [r2]
	movs r4, 0
	mov r1, sp
_08127D26:
	ldrb r0, [r1]
	cmp r4, r0
	beq _08127D34
	mov r2, sp
	adds r0, r2, r5
	strb r4, [r0]
	adds r5, 0x1
_08127D34:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08127D26
	b _08127D84
	.align 2, 0
_08127D3C: .4byte gBattlerPartyIndexes
_08127D40:
	movs r5, 0x2
	movs r0, 0
	bl GetBattlerAtPosition
	mov r1, sp
	ldr r4, _08127DA4 @ =gBattlerPartyIndexes
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	ldrh r0, [r0]
	strb r0, [r1]
	movs r0, 0x2
	bl GetBattlerAtPosition
	mov r1, sp
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	ldrh r0, [r0]
	strb r0, [r1, 0x1]
	movs r4, 0
_08127D6A:
	ldrb r0, [r1]
	cmp r4, r0
	beq _08127D7E
	ldrb r0, [r1, 0x1]
	cmp r4, r0
	beq _08127D7E
	mov r2, sp
	adds r0, r2, r5
	strb r4, [r0]
	adds r5, 0x1
_08127D7E:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08127D6A
_08127D84:
	movs r4, 0
	mov r3, sp
_08127D88:
	adds r0, r6, r4
	ldrb r1, [r3]
	lsls r1, 4
	ldrb r2, [r3, 0x1]
	orrs r1, r2
	strb r1, [r0]
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	ble _08127D88
_08127D9C:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08127DA4: .4byte gBattlerPartyIndexes
	thumb_func_end BufferBattlePartyOrder

	thumb_func_start BufferBattlePartyCurrentOrderBySide
BufferBattlePartyCurrentOrderBySide: @ 8127DA8
	push {lr}
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08127DC8 @ =gBattleStruct
	lsls r3, r2, 1
	adds r3, r2
	adds r3, 0x60
	ldr r0, [r0]
	adds r0, r3
	bl BufferBattlePartyOrderBySide
	pop {r0}
	bx r0
	.align 2, 0
_08127DC8: .4byte gBattleStruct
	thumb_func_end BufferBattlePartyCurrentOrderBySide

	thumb_func_start BufferBattlePartyOrderBySide
BufferBattlePartyOrderBySide: @ 8127DCC
	push {r4-r7,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r0, r2, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08127DF4
	movs r0, 0
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x2
	b _08127E00
_08127DF4:
	movs r0, 0x1
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x3
_08127E00:
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r6, r0, 24
	bl IsMultiBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08127E34
	cmp r7, 0
	beq _08127E26
	movs r0, 0x30
	strb r0, [r5]
	movs r0, 0x45
	strb r0, [r5, 0x1]
	movs r0, 0x12
	strb r0, [r5, 0x2]
	b _08127EB6
_08127E26:
	movs r0, 0x3
	strb r0, [r5]
	movs r0, 0x12
	strb r0, [r5, 0x1]
	movs r0, 0x45
	strb r0, [r5, 0x2]
	b _08127EB6
_08127E34:
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	bne _08127E6C
	movs r3, 0x1
	mov r2, sp
	ldr r1, _08127E68 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	strb r0, [r2]
	movs r4, 0
	mov r1, sp
_08127E50:
	ldrb r0, [r1]
	cmp r4, r0
	beq _08127E5E
	mov r2, sp
	adds r0, r2, r3
	strb r4, [r0]
	adds r3, 0x1
_08127E5E:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08127E50
	b _08127E9E
	.align 2, 0
_08127E68: .4byte gBattlerPartyIndexes
_08127E6C:
	movs r3, 0x2
	mov r1, sp
	ldr r2, _08127EC0 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1]
	lsls r0, r6, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1, 0x1]
	movs r4, 0
_08127E84:
	ldrb r0, [r1]
	cmp r4, r0
	beq _08127E98
	ldrb r0, [r1, 0x1]
	cmp r4, r0
	beq _08127E98
	mov r2, sp
	adds r0, r2, r3
	strb r4, [r0]
	adds r3, 0x1
_08127E98:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08127E84
_08127E9E:
	movs r4, 0
	mov r3, sp
_08127EA2:
	adds r0, r5, r4
	ldrb r1, [r3]
	lsls r1, 4
	ldrb r2, [r3, 0x1]
	orrs r1, r2
	strb r1, [r0]
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	ble _08127EA2
_08127EB6:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08127EC0: .4byte gBattlerPartyIndexes
	thumb_func_end BufferBattlePartyOrderBySide

	thumb_func_start SwitchPartyOrderLinkMulti
SwitchPartyOrderLinkMulti: @ 8127EC4
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	movs r7, 0
	bl IsMultiBattle
	lsls r0, 24
	cmp r0, 0
	beq _08127F72
	ldr r0, _08127F28 @ =gBattleStruct
	lsls r1, r4, 1
	adds r1, r4
	adds r1, 0x60
	ldr r0, [r0]
	adds r4, r0, r1
	movs r2, 0
	add r6, sp
	mov r12, r6
	movs r6, 0xF
	mov r3, sp
_08127EF6:
	adds r1, r4, r2
	ldrb r0, [r1]
	lsrs r0, 4
	strb r0, [r3]
	adds r3, 0x1
	ldrb r1, [r1]
	adds r0, r6, 0
	ands r0, r1
	strb r0, [r3]
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, 0x2
	ble _08127EF6
	mov r0, r12
	ldrb r3, [r0]
	movs r2, 0
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, r5
	bne _08127F2C
	mov r0, sp
	ldrb r7, [r0]
	strb r3, [r0]
	b _08127F40
	.align 2, 0
_08127F28: .4byte gBattleStruct
_08127F2C:
	adds r2, 0x1
	cmp r2, 0x5
	bgt _08127F40
	mov r0, sp
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, r5
	bne _08127F2C
	adds r7, r0, 0
	strb r3, [r1]
_08127F40:
	cmp r2, 0x6
	beq _08127F72
	mov r0, r12
	strb r7, [r0]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, 4
	mov r1, sp
	ldrb r1, [r1, 0x1]
	orrs r0, r1
	strb r0, [r4]
	mov r0, sp
	ldrb r0, [r0, 0x2]
	lsls r0, 4
	mov r1, sp
	ldrb r1, [r1, 0x3]
	orrs r0, r1
	strb r0, [r4, 0x1]
	mov r0, sp
	ldrb r0, [r0, 0x4]
	lsls r0, 4
	mov r1, sp
	ldrb r1, [r1, 0x5]
	orrs r0, r1
	strb r0, [r4, 0x2]
_08127F72:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end SwitchPartyOrderLinkMulti

	thumb_func_start GetPartyIdFromBattleSlot
GetPartyIdFromBattleSlot: @ 8127F7C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0x1
	ands r1, r2
	lsrs r2, r0, 25
	cmp r1, 0
	beq _08127F9C
	ldr r0, _08127F98 @ =gBattlePartyCurrentOrder
	adds r0, r2, r0
	ldrb r0, [r0]
	movs r1, 0xF
	ands r1, r0
	b _08127FA4
	.align 2, 0
_08127F98: .4byte gBattlePartyCurrentOrder
_08127F9C:
	ldr r0, _08127FAC @ =gBattlePartyCurrentOrder
	adds r0, r2, r0
	ldrb r0, [r0]
	lsrs r1, r0, 4
_08127FA4:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_08127FAC: .4byte gBattlePartyCurrentOrder
	thumb_func_end GetPartyIdFromBattleSlot

	thumb_func_start SetPartyIdAtBattleSlot
SetPartyIdAtBattleSlot: @ 8127FB0
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	movs r1, 0x1
	ands r1, r3
	lsrs r3, r0, 25
	cmp r1, 0
	beq _08127FD8
	ldr r0, _08127FD4 @ =gBattlePartyCurrentOrder
	adds r0, r3, r0
	ldrb r2, [r0]
	movs r1, 0xF0
	ands r1, r2
	orrs r1, r4
	strb r1, [r0]
	b _08127FE8
	.align 2, 0
_08127FD4: .4byte gBattlePartyCurrentOrder
_08127FD8:
	ldr r2, _08127FF0 @ =gBattlePartyCurrentOrder
	adds r2, r3, r2
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	lsls r1, r4, 4
	orrs r0, r1
	strb r0, [r2]
_08127FE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127FF0: .4byte gBattlePartyCurrentOrder
	thumb_func_end SetPartyIdAtBattleSlot

	thumb_func_start SwitchPartyMonSlots
SwitchPartyMonSlots: @ 8127FF4
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	adds r0, r5, 0
	bl GetPartyIdFromBattleSlot
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl GetPartyIdFromBattleSlot
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl SetPartyIdAtBattleSlot
	adds r0, r6, 0
	adds r1, r4, 0
	bl SetPartyIdAtBattleSlot
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end SwitchPartyMonSlots

	thumb_func_start pokemon_order_func
pokemon_order_func: @ 8128030
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r3, 0
	movs r2, 0
	ldr r5, _08128058 @ =gBattlePartyCurrentOrder
_0812803C:
	adds r0, r3, r5
	ldrb r1, [r0]
	lsrs r0, r1, 4
	cmp r0, r4
	beq _08128054
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	movs r0, 0xF
	ands r0, r1
	cmp r0, r4
	bne _0812805C
_08128054:
	adds r0, r2, 0
	b _0812806E
	.align 2, 0
_08128058: .4byte gBattlePartyCurrentOrder
_0812805C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x2
	bls _0812803C
	movs r0, 0
_0812806E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end pokemon_order_func

	thumb_func_start UpdatePartyToBattleOrder
UpdatePartyToBattleOrder: @ 8128074
	push {r4-r6,lr}
	movs r4, 0x96
	lsls r4, 2
	adds r0, r4, 0
	bl Alloc
	adds r5, r0, 0
	ldr r1, _081280C0 @ =gPlayerParty
	adds r2, r4, 0
	bl memcpy
	movs r4, 0
	movs r6, 0x64
_0812808E:
	adds r0, r4, 0
	bl pokemon_order_func
	lsls r0, 24
	lsrs r0, 24
	muls r0, r6
	ldr r1, _081280C0 @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	movs r2, 0x64
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0812808E
	adds r0, r5, 0
	bl Free
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081280C0: .4byte gPlayerParty
	thumb_func_end UpdatePartyToBattleOrder

	thumb_func_start UpdatePartyToFieldOrder
UpdatePartyToFieldOrder: @ 81280C4
	push {r4-r6,lr}
	movs r4, 0x96
	lsls r4, 2
	adds r0, r4, 0
	bl Alloc
	adds r5, r0, 0
	ldr r1, _08128110 @ =gPlayerParty
	adds r2, r4, 0
	bl memcpy
	movs r4, 0
	movs r6, 0x64
_081280DE:
	adds r0, r4, 0
	bl GetPartyIdFromBattleSlot
	lsls r0, 24
	lsrs r0, 24
	muls r0, r6
	ldr r1, _08128110 @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	movs r2, 0x64
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _081280DE
	adds r0, r5, 0
	bl Free
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08128110: .4byte gPlayerParty
	thumb_func_end UpdatePartyToFieldOrder

	thumb_func_start SwitchAliveMonIntoLeadSlot
SwitchAliveMonIntoLeadSlot: @ 8128114
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0x1
	movs r7, 0x64
	ldr r0, _0812816C @ =gPlayerParty
	mov r8, r0
_08128122:
	adds r0, r6, 0
	bl GetPartyIdFromBattleSlot
	lsls r0, 24
	lsrs r0, 24
	muls r0, r7
	mov r1, r8
	adds r5, r0, r1
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08128170
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08128170
	movs r0, 0
	bl GetPartyIdFromBattleSlot
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	adds r1, r6, 0
	bl SwitchPartyMonSlots
	adds r0, r4, 0
	muls r0, r7
	add r0, r8
	adds r1, r5, 0
	bl SwapPartyPokemon
	b _0812817A
	.align 2, 0
_0812816C: .4byte gPlayerParty
_08128170:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x5
	bls _08128122
_0812817A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end SwitchAliveMonIntoLeadSlot

	thumb_func_start CB2_SetUpExitToBattleScreen
CB2_SetUpExitToBattleScreen: @ 8128184
	push {lr}
	bl CB2_SetUpReshowBattleScreenAfterMenu
	ldr r0, _08128194 @ =SetCB2ToReshowScreenAfterMenu
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08128194: .4byte SetCB2ToReshowScreenAfterMenu
	thumb_func_end CB2_SetUpExitToBattleScreen

	thumb_func_start ShowPartyMenuToShowcaseMultiBattleParty
ShowPartyMenuToShowcaseMultiBattleParty: @ 8128198
	push {lr}
	sub sp, 0xC
	movs r0, 0x7F
	str r0, [sp]
	ldr r0, _081281BC @ =Task_InitMultiPartnerPartySlideIn
	str r0, [sp, 0x4]
	ldr r0, _081281C0 @ =gMain
	ldr r0, [r0, 0x8]
	str r0, [sp, 0x8]
	movs r0, 0x5
	movs r1, 0x3
	movs r2, 0
	movs r3, 0
	bl InitPartyMenu
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_081281BC: .4byte Task_InitMultiPartnerPartySlideIn
_081281C0: .4byte gMain
	thumb_func_end ShowPartyMenuToShowcaseMultiBattleParty

	thumb_func_start Task_InitMultiPartnerPartySlideIn
Task_InitMultiPartnerPartySlideIn: @ 81281C4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081281F4 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r1, 0x80
	lsls r1, 1
	strh r1, [r4, 0x8]
	bl SlideMultiPartyMenuBoxSpritesOneStep
	movs r1, 0x80
	lsls r1, 9
	movs r0, 0x2
	movs r2, 0
	bl ChangeBgX
	ldr r0, _081281F8 @ =Task_MultiPartnerPartySlideIn
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081281F4: .4byte gTasks
_081281F8: .4byte Task_MultiPartnerPartySlideIn
	thumb_func_end Task_InitMultiPartnerPartySlideIn

	thumb_func_start Task_MultiPartnerPartySlideIn
Task_MultiPartnerPartySlideIn: @ 81281FC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r6, r5, 2
	adds r0, r6, r5
	lsls r0, 3
	ldr r1, _08128270 @ =gTasks+0x8
	adds r4, r0, r1
	ldr r0, _08128274 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08128268
	ldrh r0, [r4]
	subs r0, 0x8
	strh r0, [r4]
	adds r0, r5, 0
	bl SlideMultiPartyMenuBoxSpritesOneStep
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08128268
	movs r4, 0x3
	ldr r7, _08128278 @ =gMultiPartnerParty
_08128230:
	subs r0, r4, 0x3
	lsls r0, 5
	adds r0, r7
	ldrh r0, [r0]
	cmp r0, 0
	beq _0812824C
	ldr r0, _0812827C @ =sPartyMenuBoxes
	ldr r1, [r0]
	lsls r0, r4, 4
	adds r0, r1
	ldrb r0, [r0, 0x9]
	movs r1, 0
	bl AnimateSelectedPartyIcon
_0812824C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _08128230
	movs r0, 0x71
	bl PlaySE
	ldr r0, _08128280 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08128284 @ =Task_WaitAfterMultiPartnerPartySlideIn
	str r0, [r1]
_08128268:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08128270: .4byte gTasks+0x8
_08128274: .4byte gPaletteFade
_08128278: .4byte gMultiPartnerParty
_0812827C: .4byte sPartyMenuBoxes
_08128280: .4byte gTasks
_08128284: .4byte Task_WaitAfterMultiPartnerPartySlideIn
	thumb_func_end Task_MultiPartnerPartySlideIn

	thumb_func_start Task_WaitAfterMultiPartnerPartySlideIn
Task_WaitAfterMultiPartnerPartySlideIn: @ 8128288
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _081282B4 @ =gTasks+0x8
	adds r0, r1
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	lsls r1, 16
	movs r0, 0x80
	lsls r0, 17
	cmp r1, r0
	bne _081282AE
	adds r0, r2, 0
	bl Task_ClosePartyMenu
_081282AE:
	pop {r0}
	bx r0
	.align 2, 0
_081282B4: .4byte gTasks+0x8
	thumb_func_end Task_WaitAfterMultiPartnerPartySlideIn

	thumb_func_start MoveMultiPartyMenuBoxSprite
MoveMultiPartyMenuBoxSprite: @ 81282B8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 16
	lsrs r3, r1, 16
	cmp r1, 0
	blt _081282D2
	ldr r1, _081282D8 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	strh r3, [r0, 0x24]
_081282D2:
	pop {r0}
	bx r0
	.align 2, 0
_081282D8: .4byte gSprites
	thumb_func_end MoveMultiPartyMenuBoxSprite

	thumb_func_start SlideMultiPartyMenuBoxSpritesOneStep
SlideMultiPartyMenuBoxSpritesOneStep: @ 81282DC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08128364 @ =gTasks+0x8
	adds r5, r1, r0
	movs r6, 0x3
	ldr r7, _08128368 @ =sPartyMenuBoxes
_081282F0:
	ldr r0, _0812836C @ =gMultiPartnerParty
	subs r1, r6, 0x3
	lsls r1, 5
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _08128348
	ldr r0, [r7]
	lsls r4, r6, 4
	adds r0, r4, r0
	ldrb r0, [r0, 0x9]
	ldrh r1, [r5]
	subs r1, 0x8
	lsls r1, 16
	asrs r1, 16
	bl MoveMultiPartyMenuBoxSprite
	ldr r0, [r7]
	adds r0, r4, r0
	ldrb r0, [r0, 0xA]
	ldrh r1, [r5]
	subs r1, 0x8
	lsls r1, 16
	asrs r1, 16
	bl MoveMultiPartyMenuBoxSprite
	ldr r0, [r7]
	adds r0, r4, r0
	ldrb r0, [r0, 0xB]
	ldrh r1, [r5]
	subs r1, 0x8
	lsls r1, 16
	asrs r1, 16
	bl MoveMultiPartyMenuBoxSprite
	ldr r0, [r7]
	adds r4, r0
	ldrb r0, [r4, 0xC]
	ldrh r1, [r5]
	subs r1, 0x8
	lsls r1, 16
	asrs r1, 16
	bl MoveMultiPartyMenuBoxSprite
_08128348:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x5
	bls _081282F0
	movs r1, 0x80
	lsls r1, 4
	movs r0, 0x2
	movs r2, 0x1
	bl ChangeBgX
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08128364: .4byte gTasks+0x8
_08128368: .4byte sPartyMenuBoxes
_0812836C: .4byte gMultiPartnerParty
	thumb_func_end SlideMultiPartyMenuBoxSpritesOneStep

	thumb_func_start ChooseMonForDaycare
ChooseMonForDaycare: @ 8128370
	push {lr}
	sub sp, 0xC
	ldr r1, _08128398 @ =gFieldCallback2
	ldr r0, _0812839C @ =CB2_FadeFromPartyMenu
	str r0, [r1]
	movs r0, 0xF
	str r0, [sp]
	ldr r0, _081283A0 @ =Task_HandleChooseMonInput
	str r0, [sp, 0x4]
	ldr r0, _081283A4 @ =CB2_ReturnToField
	str r0, [sp, 0x8]
	movs r0, 0x6
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl InitPartyMenu
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08128398: .4byte gFieldCallback2
_0812839C: .4byte CB2_FadeFromPartyMenu
_081283A0: .4byte Task_HandleChooseMonInput
_081283A4: .4byte CB2_ReturnToField
	thumb_func_end ChooseMonForDaycare

	thumb_func_start ChoosePartyMonByMenuType
ChoosePartyMonByMenuType: @ 81283A8
	push {lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081283D4 @ =gFieldCallback2
	ldr r1, _081283D8 @ =CB2_FadeFromPartyMenu
	str r1, [r2]
	movs r1, 0
	str r1, [sp]
	ldr r1, _081283DC @ =Task_HandleChooseMonInput
	str r1, [sp, 0x4]
	ldr r1, _081283E0 @ =CB2_ReturnToField
	str r1, [sp, 0x8]
	movs r1, 0
	movs r2, 0xB
	movs r3, 0
	bl InitPartyMenu
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_081283D4: .4byte gFieldCallback2
_081283D8: .4byte CB2_FadeFromPartyMenu
_081283DC: .4byte Task_HandleChooseMonInput
_081283E0: .4byte CB2_ReturnToField
	thumb_func_end ChoosePartyMonByMenuType

	thumb_func_start CB2_FadeFromPartyMenu
CB2_FadeFromPartyMenu: @ 81283E4
	push {lr}
	bl sub_807DC00
	ldr r0, _081283F8 @ =Task_PartyMenuWaitForFade
	movs r1, 0xA
	bl CreateTask
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_081283F8: .4byte Task_PartyMenuWaitForFade
	thumb_func_end CB2_FadeFromPartyMenu

	thumb_func_start Task_PartyMenuWaitForFade
Task_PartyMenuWaitForFade: @ 81283FC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsWeatherNotFadingIn
	lsls r0, 24
	cmp r0, 0
	beq _0812841A
	adds r0, r4, 0
	bl DestroyTask
	bl ScriptContext2_Disable
	bl EnableBothScriptContexts
_0812841A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_PartyMenuWaitForFade

	.align 2, 0 @ Don't pad with nop.
