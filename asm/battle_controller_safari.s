	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start nullsub_79
nullsub_79: @ 80DD534
	bx lr
	thumb_func_end nullsub_79

	thumb_func_start sub_80DD538
sub_80DD538: @ 80DD538
	ldr r1, _080DD548 @ =gUnknown_3004FE0
	ldr r0, _080DD54C @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080DD550 @ =SafariBufferRunCommand
	str r1, [r0]
	bx lr
	.align 2, 0
_080DD548: .4byte gUnknown_3004FE0
_080DD54C: .4byte gUnknown_2023BC4
_080DD550: .4byte SafariBufferRunCommand
	thumb_func_end sub_80DD538

	thumb_func_start SafariBufferRunCommand
SafariBufferRunCommand: @ 80DD554
	push {lr}
	ldr r2, _080DD588 @ =gUnknown_2023BC8
	ldr r1, _080DD58C @ =gUnknown_825E45C
	ldr r0, _080DD590 @ =gUnknown_2023BC4
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _080DD5A0
	ldr r0, _080DD594 @ =gUnknown_2022BC4
	lsls r1, r3, 9
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x38
	bhi _080DD59C
	ldr r0, _080DD598 @ =gUnknown_83FED00
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _080DD5A0
	.align 2, 0
_080DD588: .4byte gUnknown_2023BC8
_080DD58C: .4byte gUnknown_825E45C
_080DD590: .4byte gUnknown_2023BC4
_080DD594: .4byte gUnknown_2022BC4
_080DD598: .4byte gUnknown_83FED00
_080DD59C:
	bl SafariBufferExecCompleted
_080DD5A0:
	pop {r0}
	bx r0
	thumb_func_end SafariBufferRunCommand

	thumb_func_start HandleInputChooseAction_0
HandleInputChooseAction_0: @ 80DD5A4
	push {r4,r5,lr}
	ldr r0, _080DD5D4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080DD612
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080DD5D8 @ =gUnknown_2023FF8
	ldr r0, _080DD5DC @ =gUnknown_2023BC4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080DD5F0
	cmp r0, 0x1
	bgt _080DD5E0
	cmp r0, 0
	beq _080DD5EA
	b _080DD60C
	.align 2, 0
_080DD5D4: .4byte gMain
_080DD5D8: .4byte gUnknown_2023FF8
_080DD5DC: .4byte gUnknown_2023BC4
_080DD5E0:
	cmp r0, 0x2
	beq _080DD5F6
	cmp r0, 0x3
	beq _080DD602
	b _080DD60C
_080DD5EA:
	movs r0, 0x1
	movs r1, 0x5
	b _080DD5FA
_080DD5F0:
	movs r0, 0x1
	movs r1, 0x6
	b _080DD5FA
_080DD5F6:
	movs r0, 0x1
	movs r1, 0x7
_080DD5FA:
	movs r2, 0
	bl EmitTwoReturnValues
	b _080DD60C
_080DD602:
	movs r0, 0x1
	movs r1, 0x8
	movs r2, 0
	bl EmitTwoReturnValues
_080DD60C:
	bl SafariBufferExecCompleted
	b _080DD71A
_080DD612:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080DD650
	ldr r5, _080DD648 @ =gUnknown_2023FF8
	ldr r4, _080DD64C @ =gUnknown_2023BC4
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080DD71A
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl ActionSelectionDestroyCursorAt
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x1
	b _080DD6BE
	.align 2, 0
_080DD648: .4byte gUnknown_2023FF8
_080DD64C: .4byte gUnknown_2023BC4
_080DD650:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080DD68C
	ldr r5, _080DD684 @ =gUnknown_2023FF8
	ldr r4, _080DD688 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080DD71A
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl ActionSelectionDestroyCursorAt
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x1
	b _080DD6BE
	.align 2, 0
_080DD684: .4byte gUnknown_2023FF8
_080DD688: .4byte gUnknown_2023BC4
_080DD68C:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080DD6D8
	ldr r5, _080DD6D0 @ =gUnknown_2023FF8
	ldr r4, _080DD6D4 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080DD71A
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl ActionSelectionDestroyCursorAt
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x2
_080DD6BE:
	eors r0, r2
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0
	bl ActionSelectionCreateCursorAt
	b _080DD71A
	.align 2, 0
_080DD6D0: .4byte gUnknown_2023FF8
_080DD6D4: .4byte gUnknown_2023BC4
_080DD6D8:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080DD71A
	ldr r5, _080DD720 @ =gUnknown_2023FF8
	ldr r4, _080DD724 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080DD71A
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl ActionSelectionDestroyCursorAt
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x2
	eors r0, r2
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0
	bl ActionSelectionCreateCursorAt
_080DD71A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD720: .4byte gUnknown_2023FF8
_080DD724: .4byte gUnknown_2023BC4
	thumb_func_end HandleInputChooseAction_0

	thumb_func_start sub_80DD728
sub_80DD728: @ 80DD728
	push {lr}
	ldr r2, _080DD750 @ =gUnknown_202063C
	ldr r1, _080DD754 @ =gUnknown_2023D44
	ldr r0, _080DD758 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _080DD75C @ =nullsub_8
	cmp r1, r0
	bne _080DD74C
	bl SafariBufferExecCompleted
_080DD74C:
	pop {r0}
	bx r0
	.align 2, 0
_080DD750: .4byte gUnknown_202063C
_080DD754: .4byte gUnknown_2023D44
_080DD758: .4byte gUnknown_2023BC4
_080DD75C: .4byte nullsub_8
	thumb_func_end sub_80DD728

	thumb_func_start CompleteOnInactiveTextPrinter_3
CompleteOnInactiveTextPrinter_3: @ 80DD760
	push {lr}
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _080DD772
	bl SafariBufferExecCompleted
_080DD772:
	pop {r0}
	bx r0
	thumb_func_end CompleteOnInactiveTextPrinter_3

	thumb_func_start sub_80DD778
sub_80DD778: @ 80DD778
	push {lr}
	ldr r2, _080DD7A0 @ =gUnknown_202063C
	ldr r1, _080DD7A4 @ =gUnknown_3004FF0
	ldr r0, _080DD7A8 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _080DD7AC @ =nullsub_8
	cmp r1, r0
	bne _080DD79C
	bl SafariBufferExecCompleted
_080DD79C:
	pop {r0}
	bx r0
	.align 2, 0
_080DD7A0: .4byte gUnknown_202063C
_080DD7A4: .4byte gUnknown_3004FF0
_080DD7A8: .4byte gUnknown_2023BC4
_080DD7AC: .4byte nullsub_8
	thumb_func_end sub_80DD778

	thumb_func_start sub_80DD7B0
sub_80DD7B0: @ 80DD7B0
	push {lr}
	ldr r0, _080DD7E0 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080DD7DA
	ldr r2, _080DD7E4 @ =gMain
	ldr r0, _080DD7E8 @ =0x00000439
	adds r3, r2, r0
	ldrb r1, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _080DD7EC @ =gUnknown_3004F80
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, [r2, 0x8]
	bl SetMainCallback2
_080DD7DA:
	pop {r0}
	bx r0
	.align 2, 0
_080DD7E0: .4byte gUnknown_2037AB8
_080DD7E4: .4byte gMain
_080DD7E8: .4byte 0x00000439
_080DD7EC: .4byte gUnknown_3004F80
	thumb_func_end sub_80DD7B0

	thumb_func_start CompleteOnSpecialAnimDone_0
CompleteOnSpecialAnimDone_0: @ 80DD7F0
	push {lr}
	ldr r0, _080DD820 @ =gUnknown_2024005
	ldrb r0, [r0]
	cmp r0, 0
	beq _080DD816
	ldr r0, _080DD824 @ =gUnknown_2024018
	ldr r2, [r0]
	ldr r0, _080DD828 @ =gUnknown_2023BC4
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080DD81A
_080DD816:
	bl SafariBufferExecCompleted
_080DD81A:
	pop {r0}
	bx r0
	.align 2, 0
_080DD820: .4byte gUnknown_2024005
_080DD824: .4byte gUnknown_2024018
_080DD828: .4byte gUnknown_2023BC4
	thumb_func_end CompleteOnSpecialAnimDone_0

	thumb_func_start sub_80DD82C
sub_80DD82C: @ 80DD82C
	push {lr}
	ldr r0, _080DD84C @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080DD848
	ldr r1, _080DD850 @ =gUnknown_3004FE0
	ldr r0, _080DD854 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080DD858 @ =CompleteWhenChosePokeblock
	str r1, [r0]
_080DD848:
	pop {r0}
	bx r0
	.align 2, 0
_080DD84C: .4byte gUnknown_2037AB8
_080DD850: .4byte gUnknown_3004FE0
_080DD854: .4byte gUnknown_2023BC4
_080DD858: .4byte CompleteWhenChosePokeblock
	thumb_func_end sub_80DD82C

	thumb_func_start CompleteWhenChosePokeblock
CompleteWhenChosePokeblock: @ 80DD85C
	push {lr}
	ldr r0, _080DD888 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _080DD88C @ =sub_8011100
	cmp r1, r0
	bne _080DD882
	ldr r0, _080DD890 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080DD882
	ldr r0, _080DD894 @ =gUnknown_203AD30
	ldrh r1, [r0]
	movs r0, 0x1
	bl EmitOneReturnValue
	bl SafariBufferExecCompleted
_080DD882:
	pop {r0}
	bx r0
	.align 2, 0
_080DD888: .4byte gMain
_080DD88C: .4byte sub_8011100
_080DD890: .4byte gUnknown_2037AB8
_080DD894: .4byte gUnknown_203AD30
	thumb_func_end CompleteWhenChosePokeblock

	thumb_func_start CompleteOnFinishedBattleAnimation_3
CompleteOnFinishedBattleAnimation_3: @ 80DD898
	push {lr}
	ldr r0, _080DD8C0 @ =gUnknown_2024018
	ldr r2, [r0]
	ldr r0, _080DD8C4 @ =gUnknown_2023BC4
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _080DD8BA
	bl SafariBufferExecCompleted
_080DD8BA:
	pop {r0}
	bx r0
	.align 2, 0
_080DD8C0: .4byte gUnknown_2024018
_080DD8C4: .4byte gUnknown_2023BC4
	thumb_func_end CompleteOnFinishedBattleAnimation_3

	thumb_func_start SafariBufferExecCompleted
SafariBufferExecCompleted: @ 80DD8C8
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _080DD908 @ =gUnknown_3004FE0
	ldr r4, _080DD90C @ =gUnknown_2023BC4
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080DD910 @ =SafariBufferRunCommand
	str r1, [r0]
	ldr r0, _080DD914 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080DD91C
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, 0x2
	movs r1, 0x4
	mov r2, sp
	bl PrepareBufferDataTransferLink
	ldr r1, _080DD918 @ =gUnknown_2022BC4
	ldrb r0, [r4]
	lsls r0, 9
	adds r0, r1
	movs r1, 0x38
	strb r1, [r0]
	b _080DD92E
	.align 2, 0
_080DD908: .4byte gUnknown_3004FE0
_080DD90C: .4byte gUnknown_2023BC4
_080DD910: .4byte SafariBufferRunCommand
_080DD914: .4byte gUnknown_2022B4C
_080DD918: .4byte gUnknown_2022BC4
_080DD91C:
	ldr r2, _080DD938 @ =gUnknown_2023BC8
	ldr r1, _080DD93C @ =gUnknown_825E45C
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_080DD92E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DD938: .4byte gUnknown_2023BC8
_080DD93C: .4byte gUnknown_825E45C
	thumb_func_end SafariBufferExecCompleted

	thumb_func_start CompleteOnFinishedStatusAnimation_3
CompleteOnFinishedStatusAnimation_3: @ 80DD940
	push {lr}
	ldr r0, _080DD968 @ =gUnknown_2024018
	ldr r2, [r0]
	ldr r0, _080DD96C @ =gUnknown_2023BC4
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080DD962
	bl SafariBufferExecCompleted
_080DD962:
	pop {r0}
	bx r0
	.align 2, 0
_080DD968: .4byte gUnknown_2024018
_080DD96C: .4byte gUnknown_2023BC4
	thumb_func_end CompleteOnFinishedStatusAnimation_3

	thumb_func_start sub_80DD970
sub_80DD970: @ 80DD970
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DD970

	thumb_func_start sub_80DD97C
sub_80DD97C: @ 80DD97C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DD97C

	thumb_func_start sub_80DD988
sub_80DD988: @ 80DD988
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DD988

	thumb_func_start sub_80DD994
sub_80DD994: @ 80DD994
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DD994

	thumb_func_start sub_80DD9A0
sub_80DD9A0: @ 80DD9A0
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DD9A0

	thumb_func_start sub_80DD9AC
sub_80DD9AC: @ 80DD9AC
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DD9AC

	thumb_func_start sub_80DD9B8
sub_80DD9B8: @ 80DD9B8
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DD9B8

	thumb_func_start SafariHandleDrawTrainerPic
SafariHandleDrawTrainerPic: @ 80DD9C4
	push {r4-r6,lr}
	ldr r4, _080DDA7C @ =gSaveBlock2Ptr
	ldr r0, [r4]
	ldrb r0, [r0, 0x8]
	ldr r5, _080DDA80 @ =gUnknown_2023BC4
	ldrb r1, [r5]
	bl sub_8034750
	ldr r0, [r4]
	ldrb r6, [r0, 0x8]
	ldrb r0, [r5]
	bl GetBankIdentity
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_803F864
	ldr r0, _080DDA84 @ =gUnknown_20244DC
	ldr r2, _080DDA88 @ =gUnknown_8239F8C
	ldr r1, [r4]
	ldrb r1, [r1, 0x8]
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1]
	movs r2, 0x8
	subs r2, r1
	lsls r2, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r2, r1
	asrs r2, 16
	movs r1, 0x50
	movs r3, 0x1E
	bl CreateSprite
	ldr r6, _080DDA8C @ =gUnknown_2023D44
	ldrb r1, [r5]
	adds r1, r6
	strb r0, [r1]
	ldr r4, _080DDA90 @ =gUnknown_202063C
	ldrb r3, [r5]
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xF0
	strh r1, [r0, 0x24]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080DDA94 @ =0x0000fffe
	strh r1, [r0, 0x2E]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _080DDA98 @ =sub_8033EEC
	str r1, [r0]
	ldr r1, _080DDA9C @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080DDAA0 @ =sub_80DD728
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DDA7C: .4byte gSaveBlock2Ptr
_080DDA80: .4byte gUnknown_2023BC4
_080DDA84: .4byte gUnknown_20244DC
_080DDA88: .4byte gUnknown_8239F8C
_080DDA8C: .4byte gUnknown_2023D44
_080DDA90: .4byte gUnknown_202063C
_080DDA94: .4byte 0x0000fffe
_080DDA98: .4byte sub_8033EEC
_080DDA9C: .4byte gUnknown_3004FE0
_080DDAA0: .4byte sub_80DD728
	thumb_func_end SafariHandleDrawTrainerPic

	thumb_func_start sub_80DDAA4
sub_80DDAA4: @ 80DDAA4
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDAA4

	thumb_func_start sub_80DDAB0
sub_80DDAB0: @ 80DDAB0
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDAB0

	thumb_func_start sub_80DDABC
sub_80DDABC: @ 80DDABC
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDABC

	thumb_func_start sub_80DDAC8
sub_80DDAC8: @ 80DDAC8
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDAC8

	thumb_func_start sub_80DDAD4
sub_80DDAD4: @ 80DDAD4
	push {r4,r5,lr}
	ldr r0, _080DDB14 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0, 0x8]
	movs r0, 0x4
	strb r0, [r1, 0x8]
	ldr r1, _080DDB18 @ =gUnknown_2024005
	movs r0, 0x1
	strb r0, [r1]
	ldr r5, _080DDB1C @ =gUnknown_2023BC4
	ldrb r4, [r5]
	movs r0, 0x1
	bl GetBankByIdentity
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x4
	bl InitAndLaunchSpecialAnimation
	ldr r1, _080DDB20 @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080DDB24 @ =CompleteOnSpecialAnimDone_0
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DDB14: .4byte gUnknown_2024018
_080DDB18: .4byte gUnknown_2024005
_080DDB1C: .4byte gUnknown_2023BC4
_080DDB20: .4byte gUnknown_3004FE0
_080DDB24: .4byte CompleteOnSpecialAnimDone_0
	thumb_func_end sub_80DDAD4

	thumb_func_start sub_80DDB28
sub_80DDB28: @ 80DDB28
	push {r4,r5,lr}
	ldr r1, _080DDB70 @ =gUnknown_2022BC4
	ldr r5, _080DDB74 @ =gUnknown_2023BC4
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, _080DDB78 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	strb r1, [r0, 0x8]
	ldr r1, _080DDB7C @ =gUnknown_2024005
	movs r0, 0x1
	strb r0, [r1]
	ldrb r4, [r5]
	movs r0, 0x1
	bl GetBankByIdentity
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x4
	bl InitAndLaunchSpecialAnimation
	ldr r1, _080DDB80 @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080DDB84 @ =CompleteOnSpecialAnimDone_0
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DDB70: .4byte gUnknown_2022BC4
_080DDB74: .4byte gUnknown_2023BC4
_080DDB78: .4byte gUnknown_2024018
_080DDB7C: .4byte gUnknown_2024005
_080DDB80: .4byte gUnknown_3004FE0
_080DDB84: .4byte CompleteOnSpecialAnimDone_0
	thumb_func_end sub_80DDB28

	thumb_func_start sub_80DDB88
sub_80DDB88: @ 80DDB88
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDB88

	thumb_func_start sub_80DDB94
sub_80DDB94: @ 80DDB94
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDB94

	thumb_func_start sub_80DDBA0
sub_80DDBA0: @ 80DDBA0
	push {r4,lr}
	ldr r0, _080DDBD4 @ =gUnknown_2022974
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080DDBD8 @ =gUnknown_2022976
	strh r1, [r0]
	ldr r0, _080DDBDC @ =gUnknown_2023BC4
	ldrb r4, [r0]
	lsls r4, 9
	ldr r0, _080DDBE0 @ =gUnknown_2022BC6
	adds r4, r0
	ldrh r0, [r4]
	bl sub_80D7274
	ldrh r0, [r4]
	bl sub_80D89B0
	lsls r0, 24
	cmp r0, 0
	beq _080DDBE8
	ldr r0, _080DDBE4 @ =gUnknown_202298C
	movs r1, 0x40
	bl sub_80D87BC
	b _080DDBF0
	.align 2, 0
_080DDBD4: .4byte gUnknown_2022974
_080DDBD8: .4byte gUnknown_2022976
_080DDBDC: .4byte gUnknown_2023BC4
_080DDBE0: .4byte gUnknown_2022BC6
_080DDBE4: .4byte gUnknown_202298C
_080DDBE8:
	ldr r0, _080DDC04 @ =gUnknown_202298C
	movs r1, 0
	bl sub_80D87BC
_080DDBF0:
	ldr r1, _080DDC08 @ =gUnknown_3004FE0
	ldr r0, _080DDC0C @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080DDC10 @ =CompleteOnInactiveTextPrinter_3
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DDC04: .4byte gUnknown_202298C
_080DDC08: .4byte gUnknown_3004FE0
_080DDC0C: .4byte gUnknown_2023BC4
_080DDC10: .4byte CompleteOnInactiveTextPrinter_3
	thumb_func_end sub_80DDBA0

	thumb_func_start sub_80DDC14
sub_80DDC14: @ 80DDC14
	push {lr}
	ldr r0, _080DDC2C @ =gUnknown_2023BC4
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080DDC30
	bl sub_80DDBA0
	b _080DDC34
	.align 2, 0
_080DDC2C: .4byte gUnknown_2023BC4
_080DDC30:
	bl SafariBufferExecCompleted
_080DDC34:
	pop {r0}
	bx r0
	thumb_func_end sub_80DDC14

	thumb_func_start sub_80DDC38
sub_80DDC38: @ 80DDC38
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080DDC5E
	ldr r0, _080DDC64 @ =gUnknown_2022974
	strh r1, [r0]
	ldr r1, _080DDC68 @ =gUnknown_2022976
	movs r0, 0xA0
	strh r0, [r1]
	ldr r1, _080DDC6C @ =gUnknown_3004FE0
	ldr r0, _080DDC70 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080DDC74 @ =HandleInputChooseAction_0
	str r1, [r0]
_080DDC5E:
	pop {r0}
	bx r0
	.align 2, 0
_080DDC64: .4byte gUnknown_2022974
_080DDC68: .4byte gUnknown_2022976
_080DDC6C: .4byte gUnknown_3004FE0
_080DDC70: .4byte gUnknown_2023BC4
_080DDC74: .4byte HandleInputChooseAction_0
	thumb_func_end sub_80DDC38

	thumb_func_start sub_80DDC78
sub_80DDC78: @ 80DDC78
	push {r4,lr}
	ldr r1, _080DDCCC @ =gUnknown_3004FE0
	ldr r0, _080DDCD0 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080DDCD4 @ =sub_80DDC38
	str r1, [r0]
	ldr r0, _080DDCD8 @ =gUnknown_83FDA4C
	movs r1, 0
	bl sub_80D87BC
	ldr r0, _080DDCDC @ =gUnknown_83FE747
	movs r1, 0x2
	bl sub_80D87BC
	movs r4, 0
_080DDC9A:
	lsls r0, r4, 24
	lsrs r0, 24
	bl ActionSelectionDestroyCursorAt
	adds r4, 0x1
	cmp r4, 0x3
	ble _080DDC9A
	ldr r1, _080DDCE0 @ =gUnknown_2023FF8
	ldr r0, _080DDCD0 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl ActionSelectionCreateCursorAt
	ldr r0, _080DDCE4 @ =gUnknown_83FE6E6
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _080DDCE8 @ =gUnknown_202298C
	movs r1, 0x1
	bl sub_80D87BC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DDCCC: .4byte gUnknown_3004FE0
_080DDCD0: .4byte gUnknown_2023BC4
_080DDCD4: .4byte sub_80DDC38
_080DDCD8: .4byte gUnknown_83FDA4C
_080DDCDC: .4byte gUnknown_83FE747
_080DDCE0: .4byte gUnknown_2023FF8
_080DDCE4: .4byte gUnknown_83FE6E6
_080DDCE8: .4byte gUnknown_202298C
	thumb_func_end sub_80DDC78

	thumb_func_start sub_80DDCEC
sub_80DDCEC: @ 80DDCEC
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDCEC

	thumb_func_start sub_80DDCF8
sub_80DDCF8: @ 80DDCF8
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDCF8

	thumb_func_start sub_80DDD04
sub_80DDD04: @ 80DDD04
	push {lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _080DDD34 @ =gUnknown_3004FE0
	ldr r2, _080DDD38 @ =gUnknown_2023BC4
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080DDD3C @ =sub_80DD82C
	str r1, [r0]
	ldr r1, _080DDD40 @ =gUnknown_2024004
	ldrb r0, [r2]
	strb r0, [r1]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080DDD34: .4byte gUnknown_3004FE0
_080DDD38: .4byte gUnknown_2023BC4
_080DDD3C: .4byte sub_80DD82C
_080DDD40: .4byte gUnknown_2024004
	thumb_func_end sub_80DDD04

	thumb_func_start sub_80DDD44
sub_80DDD44: @ 80DDD44
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDD44

	thumb_func_start sub_80DDD50
sub_80DDD50: @ 80DDD50
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDD50

	thumb_func_start sub_80DDD5C
sub_80DDD5C: @ 80DDD5C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDD5C

	thumb_func_start sub_80DDD68
sub_80DDD68: @ 80DDD68
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDD68

	thumb_func_start SafariHandleStatusIconUpdate
SafariHandleStatusIconUpdate: @ 80DDD74
	push {lr}
	ldr r0, _080DDDA0 @ =gUnknown_3004FF0
	ldr r1, _080DDDA4 @ =gUnknown_2023BC4
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _080DDDA8 @ =gUnknown_2023BCE
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _080DDDAC @ =gUnknown_2024284
	adds r1, r2
	movs r2, 0xB
	bl UpdateHealthboxAttribute
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_080DDDA0: .4byte gUnknown_3004FF0
_080DDDA4: .4byte gUnknown_2023BC4
_080DDDA8: .4byte gUnknown_2023BCE
_080DDDAC: .4byte gUnknown_2024284
	thumb_func_end SafariHandleStatusIconUpdate

	thumb_func_start sub_80DDDB0
sub_80DDDB0: @ 80DDDB0
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDDB0

	thumb_func_start sub_80DDDBC
sub_80DDDBC: @ 80DDDBC
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDDBC

	thumb_func_start sub_80DDDC8
sub_80DDDC8: @ 80DDDC8
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDDC8

	thumb_func_start sub_80DDDD4
sub_80DDDD4: @ 80DDDD4
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDDD4

	thumb_func_start sub_80DDDE0
sub_80DDDE0: @ 80DDDE0
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDDE0

	thumb_func_start sub_80DDDEC
sub_80DDDEC: @ 80DDDEC
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDDEC

	thumb_func_start sub_80DDDF8
sub_80DDDF8: @ 80DDDF8
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDDF8

	thumb_func_start sub_80DDE04
sub_80DDE04: @ 80DDE04
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDE04

	thumb_func_start sub_80DDE10
sub_80DDE10: @ 80DDE10
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDE10

	thumb_func_start sub_80DDE1C
sub_80DDE1C: @ 80DDE1C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDE1C

	thumb_func_start sub_80DDE28
sub_80DDE28: @ 80DDE28
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDE28

	thumb_func_start sub_80DDE34
sub_80DDE34: @ 80DDE34
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDE34

	thumb_func_start sub_80DDE40
sub_80DDE40: @ 80DDE40
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDE40

	thumb_func_start sub_80DDE4C
sub_80DDE4C: @ 80DDE4C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDE4C

	thumb_func_start sub_80DDE58
sub_80DDE58: @ 80DDE58
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDE58

	thumb_func_start sub_80DDE64
sub_80DDE64: @ 80DDE64
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDE64

	thumb_func_start SafariHandlePlaySE
SafariHandlePlaySE: @ 80DDE70
	push {r4,lr}
	ldr r4, _080DDEAC @ =gUnknown_2023BC4
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	movs r3, 0x3F
	cmp r0, 0
	bne _080DDE84
	movs r3, 0xC0
_080DDE84:
	ldr r2, _080DDEB0 @ =gUnknown_2022BC4
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	lsls r1, r3, 24
	asrs r1, 24
	bl PlaySE12WithPanning
	bl SafariBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DDEAC: .4byte gUnknown_2023BC4
_080DDEB0: .4byte gUnknown_2022BC4
	thumb_func_end SafariHandlePlaySE

	thumb_func_start SafariHandlecmd44
SafariHandlecmd44: @ 80DDEB4
	push {lr}
	ldr r2, _080DDEDC @ =gUnknown_2022BC4
	ldr r0, _080DDEE0 @ =gUnknown_2023BC4
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl PlayFanfare
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_080DDEDC: .4byte gUnknown_2022BC4
_080DDEE0: .4byte gUnknown_2023BC4
	thumb_func_end SafariHandlecmd44

	thumb_func_start SafariHandleFaintingCry
SafariHandleFaintingCry: @ 80DDEE4
	push {lr}
	ldr r1, _080DDF14 @ =gUnknown_2023BCE
	ldr r0, _080DDF18 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080DDF1C @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	bl PlayCry1
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_080DDF14: .4byte gUnknown_2023BCE
_080DDF18: .4byte gUnknown_2023BC4
_080DDF1C: .4byte gUnknown_2024284
	thumb_func_end SafariHandleFaintingCry

	thumb_func_start SafariHandleIntroSlide
SafariHandleIntroSlide: @ 80DDF20
	push {lr}
	ldr r1, _080DDF48 @ =gUnknown_2022BC4
	ldr r0, _080DDF4C @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80BC3A0
	ldr r2, _080DDF50 @ =gUnknown_2023F4C
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_080DDF48: .4byte gUnknown_2022BC4
_080DDF4C: .4byte gUnknown_2023BC4
_080DDF50: .4byte gUnknown_2023F4C
	thumb_func_end SafariHandleIntroSlide

	thumb_func_start SafariHandleIntroTrainerBallThrow
SafariHandleIntroTrainerBallThrow: @ 80DDF54
	push {r4,r5,lr}
	ldr r5, _080DDF98 @ =gUnknown_3004FF0
	ldr r4, _080DDF9C @ =gUnknown_2023BC4
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _080DDFA0 @ =gUnknown_2023BCE
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _080DDFA4 @ =gUnknown_2024284
	adds r1, r2
	movs r2, 0xA
	bl UpdateHealthboxAttribute
	ldrb r0, [r4]
	bl sub_804BD94
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	ldr r1, _080DDFA8 @ =gUnknown_3004FE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080DDFAC @ =sub_80DD778
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DDF98: .4byte gUnknown_3004FF0
_080DDF9C: .4byte gUnknown_2023BC4
_080DDFA0: .4byte gUnknown_2023BCE
_080DDFA4: .4byte gUnknown_2024284
_080DDFA8: .4byte gUnknown_3004FE0
_080DDFAC: .4byte sub_80DD778
	thumb_func_end SafariHandleIntroTrainerBallThrow

	thumb_func_start sub_80DDFB0
sub_80DDFB0: @ 80DDFB0
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDFB0

	thumb_func_start sub_80DDFBC
sub_80DDFBC: @ 80DDFBC
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDFBC

	thumb_func_start sub_80DDFC8
sub_80DDFC8: @ 80DDFC8
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDFC8

	thumb_func_start sub_80DDFD4
sub_80DDFD4: @ 80DDFD4
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DDFD4

	thumb_func_start SafariHandleBattleAnimation
SafariHandleBattleAnimation: @ 80DDFE0
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r5, _080DE018 @ =gUnknown_2022BC4
	ldr r6, _080DE01C @ =gUnknown_2023BC4
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, r5, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r0, r5, 0x2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, 0x3
	adds r1, r5
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	str r4, [sp]
	adds r0, r2, 0
	adds r1, r2, 0
	bl TryHandleLaunchBattleTableAnimation
	lsls r0, 24
	cmp r0, 0
	beq _080DE020
	bl SafariBufferExecCompleted
	b _080DE02C
	.align 2, 0
_080DE018: .4byte gUnknown_2022BC4
_080DE01C: .4byte gUnknown_2023BC4
_080DE020:
	ldr r0, _080DE034 @ =gUnknown_3004FE0
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _080DE038 @ =CompleteOnFinishedBattleAnimation_3
	str r0, [r1]
_080DE02C:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DE034: .4byte gUnknown_3004FE0
_080DE038: .4byte CompleteOnFinishedBattleAnimation_3
	thumb_func_end SafariHandleBattleAnimation

	thumb_func_start sub_80DE03C
sub_80DE03C: @ 80DE03C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DE03C

	thumb_func_start sub_80DE048
sub_80DE048: @ 80DE048
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80DE048

	thumb_func_start SafariHandleCmd55
SafariHandleCmd55: @ 80DE054
	push {r4,lr}
	ldr r2, _080DE098 @ =gUnknown_2023E8A
	ldr r1, _080DE09C @ =gUnknown_2022BC4
	ldr r4, _080DE0A0 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0x5
	bl FadeOutMapMusic
	movs r0, 0x3
	bl BeginFastPaletteFade
	bl SafariBufferExecCompleted
	ldr r0, _080DE0A4 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x6
	ands r0, r1
	cmp r0, 0x2
	bne _080DE090
	ldr r0, _080DE0A8 @ =gUnknown_3004FE0
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _080DE0AC @ =sub_80DD7B0
	str r0, [r1]
_080DE090:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DE098: .4byte gUnknown_2023E8A
_080DE09C: .4byte gUnknown_2022BC4
_080DE0A0: .4byte gUnknown_2023BC4
_080DE0A4: .4byte gUnknown_2022B4C
_080DE0A8: .4byte gUnknown_3004FE0
_080DE0AC: .4byte sub_80DD7B0
	thumb_func_end SafariHandleCmd55

	thumb_func_start nullsub_80
nullsub_80: @ 80DE0B0
	bx lr
	thumb_func_end nullsub_80

	.align 2, 0 @ Don't pad with nop.
