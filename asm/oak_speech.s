	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_81303B4
sub_81303B4: @ 81303B4
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _081303F8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _0813044C
	ldr r4, _081303FC @ =sOakSpeechResources
	ldr r0, [r4]
	ldrb r0, [r0, 0x10]
	movs r1, 0
	bl sub_8131754
	ldr r0, [r4]
	ldrh r0, [r0, 0x10]
	cmp r0, 0
	bne _08130408
	ldr r0, _08130400 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	ldrb r2, [r1, 0x8]
	str r5, [sp]
	ldr r0, _08130404 @ =sub_8130C64
	str r0, [sp, 0x4]
	movs r0, 0
	movs r3, 0
	bl DoNamingScreen
	b _08130440
	.align 2, 0
_081303F8: .4byte gPaletteFade
_081303FC: .4byte sOakSpeechResources
_08130400: .4byte gSaveBlock2Ptr
_08130404: .4byte sub_8130C64
_08130408:
	ldr r0, _08130454 @ =gTasks
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0x22]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl sub_810F4D8
	ldrh r0, [r4, 0x22]
	lsls r0, 24
	lsrs r0, 24
	bl RemoveWindow
	ldr r0, _08130458 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r0, _0813045C @ =0x00003a4c
	adds r1, r0
	str r5, [sp]
	ldr r0, _08130460 @ =sub_8130C64
	str r0, [sp, 0x4]
	movs r0, 0x4
	movs r2, 0
	movs r3, 0
	bl DoNamingScreen
_08130440:
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_8131168
	bl FreeAllWindowBuffers
_0813044C:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08130454: .4byte gTasks
_08130458: .4byte gSaveBlock1Ptr
_0813045C: .4byte 0x00003a4c
_08130460: .4byte sub_8130C64
	thumb_func_end sub_81303B4

	thumb_func_start sub_8130464
sub_8130464: @ 8130464
	push {r4-r7,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r6, r1, 3
	ldr r7, _081304A0 @ =gTasks+0x8
	adds r5, r6, r7
	ldr r0, _081304A4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08130544
	movs r1, 0x1E
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _08130500
	ldr r0, _081304A8 @ =sOakSpeechResources
	ldr r0, [r0]
	ldrh r0, [r0, 0x10]
	cmp r0, 0
	bne _081304B4
	ldr r0, _081304AC @ =gStringVar4
	ldr r1, _081304B0 @ =gUnknown_81C5E13
	bl StringExpandPlaceholders
	b _081304BC
	.align 2, 0
_081304A0: .4byte gTasks+0x8
_081304A4: .4byte gPaletteFade
_081304A8: .4byte sOakSpeechResources
_081304AC: .4byte gStringVar4
_081304B0: .4byte gUnknown_81C5E13
_081304B4:
	ldr r0, _081304F4 @ =gStringVar4
	ldr r1, _081304F8 @ =gUnknown_81C5EB5
	bl StringExpandPlaceholders
_081304BC:
	movs r0, 0
	movs r1, 0
	bl sub_80F6EE4
	ldr r2, _081304F4 @ =gStringVar4
	ldr r0, _081304FC @ =sOakSpeechResources
	ldr r0, [r0]
	ldrb r3, [r0, 0x1F]
	movs r4, 0
	str r4, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x4
	bl AddTextPrinterParametrized
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	strh r4, [r5, 0x1E]
	movs r0, 0x19
	strh r0, [r5, 0x6]
	b _08130544
	.align 2, 0
_081304F4: .4byte gStringVar4
_081304F8: .4byte gUnknown_81C5EB5
_081304FC: .4byte sOakSpeechResources
_08130500:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _08130544
	ldrh r0, [r5, 0x6]
	movs r1, 0x6
	ldrsh r4, [r5, r1]
	cmp r4, 0
	beq _0813051C
	subs r0, 0x1
	strh r0, [r5, 0x6]
	b _08130544
_0813051C:
	bl sub_80F796C
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0813054C @ =gUnknown_8462ED0
	str r0, [sp]
	movs r0, 0xE
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r1, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl sub_810FF60
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _08130550 @ =sub_8130554
	str r1, [r0]
_08130544:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813054C: .4byte gUnknown_8462ED0
_08130550: .4byte sub_8130554
	thumb_func_end sub_8130464

	thumb_func_start sub_8130554
sub_8130554: @ 8130554
	push {r4-r7,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r4, r0, 24
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r5, r0, 24
	cmp r5, 0
	beq _0813057C
	cmp r5, 0
	bgt _08130576
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	beq _08130604
	b _0813063E
_08130576:
	cmp r5, 0x1
	beq _08130604
	b _0813063E
_0813057C:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _081305B0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r6, r0, r1
	movs r0, 0x28
	strh r0, [r6, 0xE]
	ldr r7, _081305B4 @ =sOakSpeechResources
	ldr r0, [r7]
	ldrh r0, [r0, 0x10]
	cmp r0, 0
	bne _081305BC
	movs r0, 0
	movs r1, 0x1
	bl sub_80F6F54
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_813144C
	ldr r0, _081305B8 @ =sub_8130650
	str r0, [r6]
	b _0813063E
	.align 2, 0
_081305B0: .4byte gTasks
_081305B4: .4byte sOakSpeechResources
_081305B8: .4byte sub_8130650
_081305BC:
	ldr r4, _081305F8 @ =gStringVar4
	ldr r1, _081305FC @ =gUnknown_81C5EC5
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	movs r1, 0
	bl sub_80F6EE4
	ldr r0, [r7]
	ldrb r3, [r0, 0x1F]
	str r5, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x4
	adds r2, r4, 0
	bl AddTextPrinterParametrized
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r0, _08130600 @ =sub_8130694
	str r0, [r6]
	b _0813063E
	.align 2, 0
_081305F8: .4byte gStringVar4
_081305FC: .4byte gUnknown_81C5EC5
_08130600: .4byte sub_8130694
_08130604:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08130624 @ =sOakSpeechResources
	ldr r0, [r0]
	ldrh r0, [r0, 0x10]
	cmp r0, 0
	bne _08130630
	ldr r0, _08130628 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0813062C @ =sub_8130160
	b _0813063C
	.align 2, 0
_08130624: .4byte sOakSpeechResources
_08130628: .4byte gTasks
_0813062C: .4byte sub_8130160
_08130630:
	ldr r0, _08130648 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0813064C @ =sub_8130228
_0813063C:
	str r0, [r1]
_0813063E:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08130648: .4byte gTasks
_0813064C: .4byte sub_8130228
	thumb_func_end sub_8130554

	thumb_func_start sub_8130650
sub_8130650: @ 8130650
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r5, r1, 3
	ldr r6, _0813067C @ =gTasks+0x8
	adds r4, r5, r6
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0813068A
	bl sub_8131310
	ldrh r1, [r4, 0x6]
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08130680
	subs r0, r1, 0x1
	strh r0, [r4, 0x6]
	b _0813068A
	.align 2, 0
_0813067C: .4byte gTasks+0x8
_08130680:
	adds r0, r6, 0
	subs r0, 0x8
	adds r0, r5, r0
	ldr r1, _08130690 @ =sub_81306D4
	str r1, [r0]
_0813068A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08130690: .4byte sub_81306D4
	thumb_func_end sub_8130650

	thumb_func_start sub_8130694
sub_8130694: @ 8130694
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _081306C4
	movs r0, 0
	movs r1, 0x1
	bl sub_80F6F54
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_813144C
	ldr r0, _081306CC @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _081306D0 @ =sub_81307D0
	str r0, [r1]
_081306C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081306CC: .4byte gTasks
_081306D0: .4byte sub_81307D0
	thumb_func_end sub_8130694

	thumb_func_start sub_81306D4
sub_81306D4: @ 81306D4
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	ldr r0, _08130710 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	movs r1, 0
	strh r1, [r4, 0xA]
	ldr r0, _08130714 @ =gSpriteCoordOffsetX
	strh r1, [r0]
	movs r0, 0x2
	bl sub_81311F4
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_81315CC
	ldr r0, _08130718 @ =sub_813071C
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08130710: .4byte gTasks
_08130714: .4byte gSpriteCoordOffsetX
_08130718: .4byte sub_813071C
	thumb_func_end sub_81306D4

	thumb_func_start sub_813071C
sub_813071C: @ 813071C
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08130770 @ =gTasks+0x8
	adds r0, r1
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _081307BC
	movs r0, 0
	movs r1, 0
	bl sub_80F6EE4
	ldr r2, _08130774 @ =gUnknown_81C5E2E
	ldr r4, _08130778 @ =gStringVar4
	cmp r2, r4
	beq _08130780
	adds r0, r4, 0
	adds r1, r2, 0
	bl StringExpandPlaceholders
	ldr r0, _0813077C @ =sOakSpeechResources
	ldr r0, [r0]
	ldrb r3, [r0, 0x1F]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x4
	adds r2, r4, 0
	bl AddTextPrinterParametrized
	b _0813079E
	.align 2, 0
_08130770: .4byte gTasks+0x8
_08130774: .4byte gUnknown_81C5E2E
_08130778: .4byte gStringVar4
_0813077C: .4byte sOakSpeechResources
_08130780:
	ldr r0, _081307C4 @ =sOakSpeechResources
	ldr r0, [r0]
	ldrb r3, [r0, 0x1F]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x4
	bl AddTextPrinterParametrized
_0813079E:
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r0, _081307C4 @ =sOakSpeechResources
	ldr r1, [r0]
	movs r0, 0x1
	strh r0, [r1, 0x10]
	ldr r1, _081307C8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _081307CC @ =sub_81301B0
	str r1, [r0]
_081307BC:
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081307C4: .4byte sOakSpeechResources
_081307C8: .4byte gTasks
_081307CC: .4byte sub_81301B0
	thumb_func_end sub_813071C

	thumb_func_start sub_81307D0
sub_81307D0: @ 81307D0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _081307FC @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08130846
	bl sub_8131310
	ldrh r1, [r4, 0x6]
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08130800
	subs r0, r1, 0x1
	strh r0, [r4, 0x6]
	b _08130846
	.align 2, 0
_081307FC: .4byte gTasks+0x8
_08130800:
	ldr r0, _08130814 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _08130818
	movs r0, 0
	movs r1, 0
	bl sub_81311F4
	b _08130820
	.align 2, 0
_08130814: .4byte gSaveBlock2Ptr
_08130818:
	movs r0, 0x1
	movs r1, 0
	bl sub_81311F4
_08130820:
	ldr r0, _0813084C @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	movs r1, 0
	strh r1, [r4, 0xA]
	ldr r0, _08130850 @ =gSpriteCoordOffsetX
	strh r1, [r0]
	movs r0, 0x2
	movs r2, 0
	bl ChangeBgX
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_81315CC
	ldr r0, _08130854 @ =sub_8130858
	str r0, [r4]
_08130846:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813084C: .4byte gTasks
_08130850: .4byte gSpriteCoordOffsetX
_08130854: .4byte sub_8130858
	thumb_func_end sub_81307D0

	thumb_func_start sub_8130858
sub_8130858: @ 8130858
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081308BC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r5, r1, r2
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _081308B4
	ldr r4, _081308C0 @ =gStringVar4
	ldr r1, _081308C4 @ =gUnknown_81C5EF4
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	movs r1, 0
	bl sub_80F6EE4
	ldr r0, _081308C8 @ =sOakSpeechResources
	ldr r0, [r0]
	ldrb r3, [r0, 0x1F]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x4
	adds r2, r4, 0
	bl AddTextPrinterParametrized
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	movs r0, 0x1E
	strh r0, [r5, 0xE]
	ldr r0, _081308CC @ =sub_81308D0
	str r0, [r5]
_081308B4:
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081308BC: .4byte gTasks
_081308C0: .4byte gStringVar4
_081308C4: .4byte gUnknown_81C5EF4
_081308C8: .4byte sOakSpeechResources
_081308CC: .4byte sub_81308D0
	thumb_func_end sub_8130858

	thumb_func_start sub_81308D0
sub_81308D0: @ 81308D0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _0813090A
	ldr r0, _081308FC @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r4, r1, r0
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08130900
	subs r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _0813090A
	.align 2, 0
_081308FC: .4byte gTasks
_08130900:
	movs r0, 0x4
	bl FadeOutBGM
	ldr r0, _08130910 @ =sub_8130914
	str r0, [r4]
_0813090A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08130910: .4byte sub_8130914
	thumb_func_end sub_81308D0

	thumb_func_start sub_8130914
sub_8130914: @ 8130914
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0813093C @ =sOakSpeechResources
	ldr r1, [r0]
	movs r0, 0
	strh r0, [r1, 0x12]
	adds r0, r4, 0
	bl sub_8130A38
	adds r0, r4, 0
	bl sub_8130ADC
	adds r0, r4, 0
	bl sub_8130940
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813093C: .4byte sOakSpeechResources
	thumb_func_end sub_8130914

	thumb_func_start sub_8130940
sub_8130940: @ 8130940
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r6, _08130978 @ =gTasks+0x8
	adds r5, r4, r6
	movs r0, 0x2
	movs r1, 0x6
	movs r2, 0x1
	bl SetBgAttribute
	movs r1, 0
	strh r1, [r5]
	strh r1, [r5, 0x2]
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r5, 0x4]
	strh r1, [r5, 0x1E]
	subs r6, 0x8
	adds r4, r6
	ldr r0, _0813097C @ =sub_8130980
	str r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08130978: .4byte gTasks+0x8
_0813097C: .4byte sub_8130980
	thumb_func_end sub_8130940

	thumb_func_start sub_8130980
sub_8130980: @ 8130980
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r7, r1, 3
	ldr r0, _08130A2C @ =gTasks+0x8
	mov r8, r0
	adds r5, r7, r0
	ldr r0, _08130A30 @ =sOakSpeechResources
	ldr r1, [r0]
	ldrh r0, [r1, 0x12]
	adds r0, 0x1
	strh r0, [r1, 0x12]
	ldrh r4, [r1, 0x12]
	adds r0, r4, 0
	movs r1, 0x14
	bl __umodsi3
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0
	bne _08130A1E
	cmp r4, 0x28
	bne _081309BE
	movs r0, 0x27
	bl PlaySE
_081309BE:
	ldrh r0, [r5, 0x4]
	adds r1, r0, 0
	subs r1, 0x20
	strh r1, [r5, 0x4]
	subs r0, 0x8
	lsls r0, 16
	asrs r0, 16
	bl sub_80D8B90
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrh r0, [r5, 0x4]
	subs r0, 0x10
	lsls r0, 16
	asrs r0, 16
	bl sub_80D8B90
	movs r1, 0xF0
	lsls r1, 7
	movs r2, 0xA8
	lsls r2, 7
	movs r3, 0x54
	str r3, [sp]
	lsls r4, 16
	asrs r4, 16
	str r4, [sp, 0x4]
	lsls r0, 16
	asrs r0, 16
	str r0, [sp, 0x8]
	str r6, [sp, 0xC]
	movs r0, 0x2
	movs r3, 0x78
	bl SetBgAffine
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0x60
	bgt _08130A1E
	movs r0, 0x1
	strh r0, [r5, 0x1E]
	movs r0, 0x24
	strh r0, [r5]
	mov r0, r8
	subs r0, 0x8
	adds r0, r7, r0
	ldr r1, _08130A34 @ =sub_8130BA8
	str r1, [r0]
_08130A1E:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08130A2C: .4byte gTasks+0x8
_08130A30: .4byte sOakSpeechResources
_08130A34: .4byte sub_8130BA8
	thumb_func_end sub_8130980

	thumb_func_start sub_8130A38
sub_8130A38: @ 8130A38
	push {lr}
	sub sp, 0x4
	ldr r0, _08130A74 @ =sub_8130A80
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08130A78 @ =gTasks+0x8
	adds r1, r0
	movs r0, 0
	strh r0, [r1]
	strh r0, [r1, 0x2]
	strh r0, [r1, 0x4]
	strh r0, [r1, 0x1E]
	ldr r0, _08130A7C @ =0xffff0fcf
	movs r1, 0
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08130A74: .4byte sub_8130A80
_08130A78: .4byte gTasks+0x8
_08130A7C: .4byte 0xffff0fcf
	thumb_func_end sub_8130A38

	thumb_func_start sub_8130A80
sub_8130A80: @ 8130A80
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08130AB8 @ =gTasks+0x8
	adds r2, r0, r1
	ldr r0, _08130ABC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08130AD4
	ldrh r0, [r2, 0x2]
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	cmp r1, 0
	beq _08130AC0
	adds r0, r4, 0
	bl DestroyTask
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8131168
	b _08130AD4
	.align 2, 0
_08130AB8: .4byte gTasks+0x8
_08130ABC: .4byte gPaletteFade
_08130AC0:
	adds r0, 0x1
	strh r0, [r2, 0x2]
	movs r0, 0xF0
	lsls r0, 8
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_08130AD4:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8130A80

	thumb_func_start sub_8130ADC
sub_8130ADC: @ 8130ADC
	push {lr}
	ldr r0, _08130B08 @ =sub_8130B10
	movs r1, 0x2
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08130B0C @ =gTasks+0x8
	adds r1, r0
	movs r2, 0x8
	strh r2, [r1]
	movs r0, 0
	strh r0, [r1, 0x2]
	strh r2, [r1, 0x4]
	strh r0, [r1, 0x1C]
	strh r0, [r1, 0x1E]
	pop {r0}
	bx r0
	.align 2, 0
_08130B08: .4byte sub_8130B10
_08130B0C: .4byte gTasks+0x8
	thumb_func_end sub_8130ADC

	thumb_func_start sub_8130B10
sub_8130B10: @ 8130B10
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08130B30 @ =gTasks+0x8
	adds r4, r0, r1
	ldrh r1, [r4]
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08130B34
	subs r0, r1, 0x1
	strh r0, [r4]
	b _08130B96
	.align 2, 0
_08130B30: .4byte gTasks+0x8
_08130B34:
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bgt _08130B4A
	ldrh r1, [r4, 0x4]
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08130B4A
	subs r0, r1, 0x1
	strh r0, [r4, 0x4]
_08130B4A:
	ldrb r2, [r4, 0x1C]
	ldr r7, _08130B9C @ =0x00007fff
	movs r0, 0x40
	movs r1, 0x20
	adds r3, r7, 0
	bl BlendPalette
	ldrh r1, [r4, 0x1C]
	adds r1, 0x1
	strh r1, [r4, 0x1C]
	ldrh r0, [r4, 0x2]
	subs r0, 0x1
	strh r0, [r4, 0x2]
	ldrh r0, [r4, 0x4]
	strh r0, [r4]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0xE
	ble _08130B96
	movs r2, 0
	ldr r6, _08130BA0 @ =gPlttBufferFaded
	adds r3, r7, 0
	ldr r4, _08130BA4 @ =gPlttBufferUnfaded
_08130B78:
	adds r0, r2, 0
	adds r0, 0x40
	lsls r0, 1
	adds r1, r0, r6
	strh r3, [r1]
	adds r0, r4
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1F
	bls _08130B78
	adds r0, r5, 0
	bl DestroyTask
_08130B96:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08130B9C: .4byte 0x00007fff
_08130BA0: .4byte gPlttBufferFaded
_08130BA4: .4byte gPlttBufferUnfaded
	thumb_func_end sub_8130B10

	thumb_func_start sub_8130BA8
sub_8130BA8: @ 8130BA8
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08130BCC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x8]
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	cmp r1, 0
	beq _08130BD0
	subs r0, 0x1
	strh r0, [r4, 0x8]
	b _08130BE2
	.align 2, 0
_08130BCC: .4byte gTasks
_08130BD0:
	str r1, [sp]
	movs r0, 0x30
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08130BEC @ =sub_8130BF0
	str r0, [r4]
_08130BE2:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08130BEC: .4byte sub_8130BF0
	thumb_func_end sub_8130BA8

	thumb_func_start sub_8130BF0
sub_8130BF0: @ 8130BF0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08130C14 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08130C10
	ldr r0, _08130C18 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _08130C1C @ =sub_8130C20
	str r0, [r1]
_08130C10:
	pop {r0}
	bx r0
	.align 2, 0
_08130C14: .4byte gPaletteFade
_08130C18: .4byte gTasks
_08130C1C: .4byte sub_8130C20
	thumb_func_end sub_8130BF0

	thumb_func_start sub_8130C20
sub_8130C20: @ 8130C20
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl FreeAllWindowBuffers
	bl sub_8044D80
	ldr r5, _08130C58 @ =sOakSpeechResources
	ldr r0, [r5]
	bl Free
	movs r0, 0
	str r0, [r5]
	ldr r2, _08130C5C @ =gTextFlags
	ldrb r1, [r2]
	subs r0, 0x2
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08130C60 @ =CB2_NewGame
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08130C58: .4byte sOakSpeechResources
_08130C5C: .4byte gTextFlags
_08130C60: .4byte CB2_NewGame
	thumb_func_end sub_8130C20

	thumb_func_start sub_8130C64
sub_8130C64: @ 8130C64
	push {r4,r5,lr}
	sub sp, 0x10
	ldr r0, _08130C84 @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x7
	bls _08130C78
	b _08130F10
_08130C78:
	lsls r0, 2
	ldr r1, _08130C88 @ =_08130C8C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08130C84: .4byte gMain
_08130C88: .4byte _08130C8C
	.align 2, 0
_08130C8C:
	.4byte _08130CAC
	.4byte _08130D18
	.4byte _08130D78
	.4byte _08130DB2
	.4byte _08130DD0
	.4byte _08130DE8
	.4byte _08130E38
	.4byte _08130EB8
_08130CAC:
	movs r0, 0
	bl SetVBlankCallback
	add r1, sp, 0x8
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08130D04 @ =0x040000d4
	add r0, sp, 0x8
	str r0, [r1]
	movs r0, 0xC0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _08130D08 @ =0x8100c000
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0
	str r2, [sp, 0xC]
	add r0, sp, 0xC
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _08130D0C @ =0x85000100
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add r0, sp, 0x8
	strh r2, [r0]
	str r0, [r1]
	ldr r0, _08130D10 @ =0x05000002
	str r0, [r1, 0x4]
	ldr r0, _08130D14 @ =0x810001ff
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetPaletteFade
	bl ScanlineEffect_Stop
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl reset_temp_tile_data_buffers
	b _08130F10
	.align 2, 0
_08130D04: .4byte 0x040000d4
_08130D08: .4byte 0x8100c000
_08130D0C: .4byte 0x85000100
_08130D10: .4byte 0x05000002
_08130D14: .4byte 0x810001ff
_08130D18:
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08130D70 @ =gUnknown_8462E58
	movs r0, 0x1
	movs r2, 0x3
	bl InitBgsFromTemplates
	ldr r4, _08130D74 @ =sOakSpeechResources
	ldr r1, [r4]
	movs r0, 0xE1
	lsls r0, 5
	adds r1, r0
	movs r0, 0x1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	movs r0, 0xC1
	lsls r0, 5
	adds r1, r0
	movs r0, 0x2
	bl SetBgTilemapBuffer
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	b _08130F10
	.align 2, 0
_08130D70: .4byte gUnknown_8462E58
_08130D74: .4byte sOakSpeechResources
_08130D78:
	movs r0, 0x40
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	b _08130F10
_08130DB2:
	bl FreeAllWindowBuffers
	bl sub_80F6C6C
	bl sub_80F6C98
	ldr r0, _08130DCC @ =gUnknown_8460568
	movs r1, 0
	movs r2, 0xE0
	bl LoadPalette
	b _08130F10
	.align 2, 0
_08130DCC: .4byte gUnknown_8460568
_08130DD0:
	ldr r1, _08130DE4 @ =gUnknown_8460CA4
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	b _08130F10
	.align 2, 0
_08130DE4: .4byte gUnknown_8460CA4
_08130DE8:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	cmp r0, 0
	beq _08130DF4
	b _08130F1E
_08130DF4:
	movs r5, 0x1E
	str r5, [sp]
	movs r4, 0x14
	str r4, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _08130E34 @ =gUnknown_8460CE8
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	b _08130F10
	.align 2, 0
_08130E34: .4byte gUnknown_8460CE8
_08130E38:
	ldr r0, _08130E5C @ =sub_8130464
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08130E60 @ =sOakSpeechResources
	ldr r0, [r0]
	ldrh r0, [r0, 0x10]
	cmp r0, 0
	bne _08130E72
	ldr r0, _08130E64 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _08130E68
	movs r0, 0
	b _08130E6A
	.align 2, 0
_08130E5C: .4byte sub_8130464
_08130E60: .4byte sOakSpeechResources
_08130E64: .4byte gSaveBlock2Ptr
_08130E68:
	movs r0, 0x1
_08130E6A:
	movs r1, 0
	bl sub_81311F4
	b _08130E7A
_08130E72:
	movs r0, 0x2
	movs r1, 0
	bl sub_81311F4
_08130E7A:
	ldr r0, _08130EA8 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldr r0, _08130EAC @ =0x0000ffc4
	strh r0, [r4, 0xA]
	ldr r1, _08130EB0 @ =gSpriteCoordOffsetX
	ldrh r0, [r1]
	adds r0, 0x3C
	strh r0, [r1]
	ldr r1, _08130EB4 @ =0xffffc400
	movs r0, 0x2
	movs r2, 0
	bl ChangeBgX
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8130FD4
	movs r0, 0x1
	strh r0, [r4, 0x26]
	b _08130F10
	.align 2, 0
_08130EA8: .4byte gTasks
_08130EAC: .4byte 0x0000ffc4
_08130EB0: .4byte gSpriteCoordOffsetX
_08130EB4: .4byte 0xffffc400
_08130EB8:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r1, 0x82
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x1
	bl EnableInterrupts
	ldr r0, _08130F04 @ =sub_812EAFC
	bl SetVBlankCallback
	ldr r2, _08130F08 @ =gTextFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08130F0C @ =sub_812EB10
	bl SetMainCallback2
	b _08130F1E
	.align 2, 0
_08130F04: .4byte sub_812EAFC
_08130F08: .4byte gTextFlags
_08130F0C: .4byte sub_812EB10
_08130F10:
	ldr r1, _08130F28 @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08130F1E:
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08130F28: .4byte gMain
	thumb_func_end sub_8130C64

	thumb_func_start sub_8130F2C
sub_8130F2C: @ 8130F2C
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _08130FA0 @ =gUnknown_8235194
	movs r0, 0
	bl sub_8044E00
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x1D
	bl DecompressPicFromTable
	ldr r0, _08130FA4 @ =gUnknown_82373F4
	bl sub_800F078
	movs r0, 0x1D
	movs r1, 0
	bl sub_803F7D4
	ldr r0, _08130FA8 @ =gMultiuseSpriteTemplate
	movs r1, 0x60
	movs r2, 0x60
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08130FAC @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r1, r2, r1
	ldr r3, _08130FB0 @ =SpriteCallbackDummy
	str r3, [r1]
	adds r2, r4
	ldrb r3, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r2, 0x5]
	adds r2, 0x3E
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	ldr r2, _08130FB4 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r2
	strh r0, [r1, 0x10]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08130FA0: .4byte gUnknown_8235194
_08130FA4: .4byte gUnknown_82373F4
_08130FA8: .4byte gMultiuseSpriteTemplate
_08130FAC: .4byte gSprites
_08130FB0: .4byte SpriteCallbackDummy
_08130FB4: .4byte gTasks
	thumb_func_end sub_8130F2C

	thumb_func_start sub_8130FB8
sub_8130FB8: @ 8130FB8
	ldr r3, _08130FD0 @ =gSprites
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	adds r1, 0x2B
	ldrb r1, [r1]
	strh r1, [r0, 0x26]
	bx lr
	.align 2, 0
_08130FD0: .4byte gSprites
	thumb_func_end sub_8130FB8

	thumb_func_start sub_8130FD4
sub_8130FD4: @ 8130FD4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	movs r4, 0
	cmp r1, 0
	beq _08130FF4
	cmp r1, 0x1
	beq _081310C8
	b _08131146
_08130FF4:
	ldr r4, _081310B0 @ =gUnknown_8462EFC
	adds r0, r4, 0
	bl LoadCompressedObjectPic
	adds r0, r4, 0
	adds r0, 0x8
	bl LoadCompressedObjectPic
	adds r4, 0x10
	adds r0, r4, 0
	bl LoadCompressedObjectPic
	ldr r0, _081310B4 @ =gUnknown_8462F1C
	bl LoadSpritePalette
	ldr r0, _081310B8 @ =gUnknown_846302C
	mov r8, r0
	movs r1, 0x10
	movs r2, 0x11
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r6, _081310BC @ =gSprites
	lsls r1, r7, 4
	adds r1, r7
	lsls r1, 2
	adds r1, r6
	ldrb r2, [r1, 0x5]
	movs r5, 0xD
	negs r5, r5
	adds r0, r5, 0
	ands r0, r2
	strb r0, [r1, 0x5]
	ldr r0, _081310C0 @ =gTasks
	mov r1, r9
	lsls r4, r1, 2
	add r4, r9
	lsls r4, 3
	adds r4, r0
	strh r7, [r4, 0x16]
	mov r0, r8
	adds r0, 0x18
	movs r1, 0x10
	movs r2, 0x9
	movs r3, 0x3
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, r7, 4
	adds r1, r7
	lsls r1, 2
	adds r2, r1, r6
	ldrb r3, [r2, 0x5]
	adds r0, r5, 0
	ands r0, r3
	strb r0, [r2, 0x5]
	ldrh r0, [r4, 0x16]
	strh r0, [r2, 0x2E]
	movs r2, 0x1C
	adds r2, r6
	mov r10, r2
	add r1, r10
	ldr r3, _081310C4 @ =sub_8130FB8
	mov r9, r3
	str r3, [r1]
	strh r7, [r4, 0x18]
	movs r0, 0x30
	add r8, r0
	mov r0, r8
	movs r1, 0x18
	movs r2, 0xD
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	adds r6, r0, r6
	ldrb r1, [r6, 0x5]
	ands r5, r1
	strb r5, [r6, 0x5]
	ldrh r1, [r4, 0x16]
	strh r1, [r6, 0x2E]
	add r0, r10
	mov r1, r9
	str r1, [r0]
	strh r7, [r4, 0x1A]
	b _08131146
	.align 2, 0
_081310B0: .4byte gUnknown_8462EFC
_081310B4: .4byte gUnknown_8462F1C
_081310B8: .4byte gUnknown_846302C
_081310BC: .4byte gSprites
_081310C0: .4byte gTasks
_081310C4: .4byte sub_8130FB8
_081310C8:
	ldr r0, _08131154 @ =gUnknown_8462F14
	bl LoadCompressedObjectPic
	ldr r0, _08131158 @ =gUnknown_8462F24
	bl LoadSpritePalette
	mov r2, r9
	lsls r5, r2, 2
	ldr r3, _0813115C @ =gTasks+0x8
	mov r8, r3
	ldr r6, _08131160 @ =gSprites
_081310DE:
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	ldr r1, _08131164 @ =gUnknown_8462F50
	adds r0, r1
	lsls r1, r4, 21
	movs r2, 0xB0
	lsls r2, 15
	adds r1, r2
	asrs r1, 16
	movs r2, 0x70
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r2, r7, 4
	adds r2, r7
	lsls r2, 2
	adds r2, r6
	ldrb r1, [r2, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r0, r3, 0
	ands r1, r0
	movs r0, 0x8
	orrs r1, r0
	strb r1, [r2, 0x5]
	adds r3, r2, 0
	adds r3, 0x2C
	ldrb r0, [r3]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r3]
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, 0x7
	lsls r1, 1
	mov r2, r9
	adds r0, r5, r2
	lsls r0, 3
	adds r1, r0
	add r1, r8
	strh r7, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _081310DE
_08131146:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08131154: .4byte gUnknown_8462F14
_08131158: .4byte gUnknown_8462F24
_0813115C: .4byte gTasks+0x8
_08131160: .4byte gSprites
_08131164: .4byte gUnknown_8462F50
	thumb_func_end sub_8130FD4

	thumb_func_start sub_8131168
sub_8131168: @ 8131168
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	movs r4, 0
	lsls r1, r0, 2
	adds r1, r0
	lsls r5, r1, 3
	ldr r7, _081311AC @ =gTasks+0x8
_0813117C:
	adds r0, r4, 0x7
	lsls r0, 1
	adds r0, r5
	adds r0, r7
	movs r2, 0
	ldrsh r1, [r0, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081311B0 @ =gSprites
	adds r0, r1
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0813117C
	cmp r6, 0
	beq _081311B4
	cmp r6, 0x1
	beq _081311DC
	b _081311EC
	.align 2, 0
_081311AC: .4byte gTasks+0x8
_081311B0: .4byte gSprites
_081311B4:
	ldr r0, _081311D0 @ =0x00001003
	bl FreeSpriteTilesByTag
	ldr r0, _081311D4 @ =0x00001002
	bl FreeSpriteTilesByTag
	ldr r4, _081311D8 @ =0x00001001
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	b _081311EC
	.align 2, 0
_081311D0: .4byte 0x00001003
_081311D4: .4byte 0x00001002
_081311D8: .4byte 0x00001001
_081311DC:
	movs r4, 0x80
	lsls r4, 5
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
_081311EC:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8131168

	thumb_func_start sub_81311F4
sub_81311F4: @ 81311F4
	push {r4-r6,lr}
	sub sp, 0x24
	lsls r0, 16
	lsrs r0, 16
	adds r2, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	cmp r0, 0x1
	beq _08131230
	cmp r0, 0x1
	bgt _08131210
	cmp r0, 0
	beq _0813121A
	b _081312F6
_08131210:
	cmp r2, 0x2
	beq _08131248
	cmp r2, 0x3
	beq _0813126C
	b _081312F6
_0813121A:
	ldr r0, _08131228 @ =gUnknown_84615FC
	movs r1, 0x40
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _0813122C @ =gUnknown_846163C
	b _08131254
	.align 2, 0
_08131228: .4byte gUnknown_84615FC
_0813122C: .4byte gUnknown_846163C
_08131230:
	ldr r0, _08131240 @ =gUnknown_8460ED4
	movs r1, 0x40
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _08131244 @ =gUnknown_8460F14
	b _08131254
	.align 2, 0
_08131240: .4byte gUnknown_8460ED4
_08131244: .4byte gUnknown_8460F14
_08131248:
	ldr r0, _08131260 @ =gUnknown_84623AC
	movs r1, 0x60
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _08131264 @ =gUnknown_84623EC
_08131254:
	ldr r2, _08131268 @ =0x06000600
	adds r1, r4, r2
	bl LZ77UnCompVram
	b _08131280
	.align 2, 0
_08131260: .4byte gUnknown_84623AC
_08131264: .4byte gUnknown_84623EC
_08131268: .4byte 0x06000600
_0813126C:
	ldr r0, _08131300 @ =gUnknown_8461CD4
	movs r1, 0x60
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _08131304 @ =gUnknown_8461D14
	ldr r2, _08131308 @ =0x06000600
	adds r1, r4, r2
	bl LZ77UnCompVram
_08131280:
	movs r0, 0x60
	bl AllocZeroed
	ldr r2, _0813130C @ =sOakSpeechResources
	ldr r1, [r2]
	str r0, [r1, 0x4]
	movs r1, 0
	lsrs r6, r4, 6
_08131290:
	ldr r0, [r2]
	ldr r0, [r0, 0x4]
	adds r0, r1
	strb r1, [r0]
	adds r1, 0x1
	cmp r1, 0x5F
	bls _08131290
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r5, 0x10
	str r5, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	ldr r4, _0813130C @ =sOakSpeechResources
	ldr r0, [r4]
	ldr r1, [r0, 0x4]
	movs r3, 0x8
	str r3, [sp]
	movs r2, 0xC
	str r2, [sp, 0x4]
	movs r0, 0xB
	str r0, [sp, 0x8]
	movs r0, 0x2
	str r0, [sp, 0xC]
	str r3, [sp, 0x10]
	str r2, [sp, 0x14]
	str r5, [sp, 0x18]
	adds r0, r6, 0
	adds r0, 0x18
	str r0, [sp, 0x1C]
	movs r5, 0
	str r5, [sp, 0x20]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl CopyRectToBgTilemapBufferRect
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	ldr r0, [r4]
	ldr r0, [r0, 0x4]
	bl Free
	ldr r0, [r4]
	str r5, [r0, 0x4]
_081312F6:
	add sp, 0x24
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08131300: .4byte gUnknown_8461CD4
_08131304: .4byte gUnknown_8461D14
_08131308: .4byte 0x06000600
_0813130C: .4byte sOakSpeechResources
	thumb_func_end sub_81311F4

	thumb_func_start sub_8131310
sub_8131310: @ 8131310
	push {lr}
	sub sp, 0xC
	movs r0, 0x8
	str r0, [sp]
	movs r0, 0xC
	str r0, [sp, 0x4]
	movs r0, 0x10
	str r0, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0xB
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	add sp, 0xC
	pop {r0}
	bx r0
	thumb_func_end sub_8131310

	thumb_func_start sub_8131338
sub_8131338: @ 8131338
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r1, _081313A8 @ =gTasks
	lsls r0, r6, 2
	mov r9, r0
	adds r0, r6
	lsls r5, r0, 3
	adds r2, r5, r1
	ldrh r3, [r2, 0xA]
	movs r7, 0xA
	ldrsh r0, [r2, r7]
	mov r8, r1
	cmp r0, 0
	bne _081313B0
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	add r1, r8
	movs r0, 0x1
	strh r0, [r1, 0xC]
	adds r0, r6, 0
	bl DestroyTask
	ldr r6, _081313AC @ =gSprites
	adds r2, r5, 0
	mov r5, r8
	adds r5, 0x8
	movs r3, 0x4
_08131380:
	adds r0, r4, 0x7
	lsls r0, 1
	adds r0, r2
	adds r0, r5
	movs r7, 0
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _08131380
	b _0813143A
	.align 2, 0
_081313A8: .4byte gTasks
_081313AC: .4byte gSprites
_081313B0:
	ldrh r1, [r2, 0x10]
	movs r7, 0x10
	ldrsh r0, [r2, r7]
	cmp r0, 0
	beq _081313C0
	subs r0, r1, 0x1
	strh r0, [r2, 0x10]
	b _0813143A
_081313C0:
	ldrh r0, [r2, 0xE]
	strh r0, [r2, 0x10]
	subs r1, r3, 0x1
	strh r1, [r2, 0xA]
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	lsls r1, 16
	asrs r1, 16
	mov r12, r9
	cmp r1, 0x8
	bne _0813141E
	adds r7, r5, 0
	movs r0, 0x8
	add r0, r8
	mov r10, r0
	movs r5, 0x1
	movs r1, 0x5
	negs r1, r1
	mov r9, r1
_081313E8:
	adds r0, r4, 0x7
	lsls r0, 1
	adds r0, r7
	add r0, r10
	movs r2, 0
	ldrsh r0, [r0, r2]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08131448 @ =gSprites
	adds r2, r0
	adds r2, 0x3E
	ldrb r3, [r2]
	lsls r1, r3, 29
	lsrs r1, 31
	eors r1, r5
	ands r1, r5
	lsls r1, 2
	mov r0, r9
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _081313E8
_0813141E:
	mov r1, r12
	adds r0, r1, r6
	lsls r0, 3
	add r0, r8
	movs r2, 0xC
	ldrsh r1, [r0, r2]
	lsls r1, 8
	ldrh r0, [r0, 0xA]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
_0813143A:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08131448: .4byte gSprites
	thumb_func_end sub_8131338

	thumb_func_start sub_813144C
sub_813144C: @ 813144C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	movs r7, 0
	ldr r1, _081314D0 @ =0x00001244
	movs r0, 0x50
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0x10
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldr r0, _081314D4 @ =gTasks
	mov r8, r0
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r0, r5, r0
	strh r7, [r0, 0xC]
	ldr r0, _081314D8 @ =sub_8131338
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	mov r1, r8
	adds r0, r2, r1
	strh r4, [r0, 0x8]
	movs r1, 0x10
	strh r1, [r0, 0xA]
	strh r7, [r0, 0xC]
	strh r6, [r0, 0xE]
	strh r6, [r0, 0x10]
	mov r3, r8
	adds r3, 0x8
_081314AC:
	adds r0, r7, 0x7
	lsls r0, 1
	adds r1, r0, r2
	adds r1, r3
	adds r0, r5
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x2
	bls _081314AC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081314D0: .4byte 0x00001244
_081314D4: .4byte gTasks
_081314D8: .4byte sub_8131338
	thumb_func_end sub_813144C

	thumb_func_start sub_81314DC
sub_81314DC: @ 81314DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r1, _08131528 @ =gTasks
	lsls r5, r6, 2
	adds r0, r5, r6
	lsls r0, 3
	mov r9, r0
	adds r2, r0, r1
	ldrh r3, [r2, 0xA]
	movs r7, 0xA
	ldrsh r0, [r2, r7]
	mov r12, r1
	cmp r0, 0x10
	bne _08131530
	ldr r0, _0813152C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081315BA
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	add r1, r12
	movs r0, 0x1
	strh r0, [r1, 0xC]
	adds r0, r6, 0
	bl DestroyTask
	b _081315BA
	.align 2, 0
_08131528: .4byte gTasks
_0813152C: .4byte gPaletteFade
_08131530:
	ldrh r1, [r2, 0x10]
	movs r7, 0x10
	ldrsh r0, [r2, r7]
	cmp r0, 0
	beq _08131540
	subs r0, r1, 0x1
	strh r0, [r2, 0x10]
	b _081315BA
_08131540:
	ldrh r0, [r2, 0xE]
	strh r0, [r2, 0x10]
	adds r1, r3, 0x2
	strh r1, [r2, 0xA]
	ldrh r0, [r2, 0xC]
	subs r0, 0x2
	strh r0, [r2, 0xC]
	lsls r1, 16
	asrs r1, 16
	mov r8, r5
	cmp r1, 0x8
	bne _0813159E
	mov r7, r9
	movs r0, 0x8
	add r0, r12
	mov r10, r0
	movs r5, 0x1
	movs r1, 0x5
	negs r1, r1
	mov r9, r1
_08131568:
	adds r0, r4, 0x7
	lsls r0, 1
	adds r0, r7
	add r0, r10
	movs r2, 0
	ldrsh r0, [r0, r2]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _081315C8 @ =gSprites
	adds r2, r0
	adds r2, 0x3E
	ldrb r3, [r2]
	lsls r1, r3, 29
	lsrs r1, 31
	eors r1, r5
	ands r1, r5
	lsls r1, 2
	mov r0, r9
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _08131568
_0813159E:
	mov r1, r8
	adds r0, r1, r6
	lsls r0, 3
	add r0, r12
	movs r2, 0xC
	ldrsh r1, [r0, r2]
	lsls r1, 8
	ldrh r0, [r0, 0xA]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
_081315BA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081315C8: .4byte gSprites
	thumb_func_end sub_81314DC

	thumb_func_start sub_81315CC
sub_81315CC: @ 81315CC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	movs r7, 0
	ldr r1, _08131654 @ =0x00001244
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldr r0, _08131658 @ =gTasks
	mov r8, r0
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r0, r5, r0
	strh r7, [r0, 0xC]
	ldr r0, _0813165C @ =sub_81314DC
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	mov r1, r8
	adds r0, r2, r1
	strh r4, [r0, 0x8]
	strh r7, [r0, 0xA]
	movs r1, 0x10
	strh r1, [r0, 0xC]
	strh r6, [r0, 0xE]
	strh r6, [r0, 0x10]
	mov r3, r8
	adds r3, 0x8
_0813162E:
	adds r0, r7, 0x7
	lsls r0, 1
	adds r1, r0, r2
	adds r1, r3
	adds r0, r5
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x2
	bls _0813162E
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08131654: .4byte 0x00001244
_08131658: .4byte gTasks
_0813165C: .4byte sub_81314DC
	thumb_func_end sub_81315CC

	thumb_func_start sub_8131660
sub_8131660: @ 8131660
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	mov r8, r1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r5, _081316DC @ =gTasks+0x8
	adds r7, r4, r5
	ldr r0, _081316E0 @ =gUnknown_8462ED8
	bl AddWindow
	strh r0, [r7, 0x1A]
	lsls r0, 24
	lsrs r0, 24
	bl PutWindowTilemap
	ldrb r6, [r7, 0x1A]
	bl sub_80F796C
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	adds r0, r6, 0
	movs r1, 0x1
	movs r3, 0xE
	bl SetWindowBorderStyle
	adds r5, r4
	ldrb r0, [r5, 0x1A]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r7, 0x1A]
	ldr r2, _081316E4 @ =gUnknown_81C574F
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x8
	bl AddTextPrinterParameterized
	mov r0, r8
	cmp r0, 0
	bne _081316F4
	ldr r0, _081316E8 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	ldr r6, _081316EC @ =gUnknown_84630D8
	cmp r0, 0
	bne _081316F6
	ldr r6, _081316F0 @ =gUnknown_846308C
	b _081316F6
	.align 2, 0
_081316DC: .4byte gTasks+0x8
_081316E0: .4byte gUnknown_8462ED8
_081316E4: .4byte gUnknown_81C574F
_081316E8: .4byte gSaveBlock2Ptr
_081316EC: .4byte gUnknown_84630D8
_081316F0: .4byte gUnknown_846308C
_081316F4:
	ldr r6, _08131750 @ =gUnknown_8463124
_081316F6:
	movs r4, 0
	movs r5, 0
_081316FA:
	ldrb r0, [r7, 0x1A]
	lsls r1, r4, 2
	adds r1, r6
	ldr r2, [r1]
	adds r4, 0x1
	lsls r1, r4, 4
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x8
	bl AddTextPrinterParameterized
	lsls r4, 24
	lsrs r4, 24
	cmp r4, 0x3
	bls _081316FA
	ldrb r0, [r7, 0x1A]
	movs r1, 0x10
	str r1, [sp]
	movs r1, 0x5
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x1
	bl sub_810F7D8
	ldrb r0, [r7, 0x1A]
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08131750: .4byte gUnknown_8463124
	thumb_func_end sub_8131660

	thumb_func_start sub_8131754
sub_8131754: @ 8131754
	push {r4,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	cmp r0, 0
	bne _081317A0
	ldr r0, _08131770 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _08131778
	ldr r4, _08131774 @ =gUnknown_846308C
	b _0813177A
	.align 2, 0
_08131770: .4byte gSaveBlock2Ptr
_08131774: .4byte gUnknown_846308C
_08131778:
	ldr r4, _08131798 @ =gUnknown_84630D8
_0813177A:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x13
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 14
	adds r0, r4
	ldr r3, [r0]
	ldr r0, _0813179C @ =gSaveBlock2Ptr
	ldr r4, [r0]
	b _081317B0
	.align 2, 0
_08131798: .4byte gUnknown_84630D8
_0813179C: .4byte gSaveBlock2Ptr
_081317A0:
	ldr r1, _081317EC @ =gUnknown_8463124
	lsls r0, r2, 2
	adds r0, r1
	ldr r3, [r0]
	ldr r0, _081317F0 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _081317F4 @ =0x00003a4c
	adds r4, r0, r1
_081317B0:
	movs r2, 0
	ldrb r0, [r3]
	cmp r0, 0xFF
	beq _081317D2
_081317B8:
	adds r1, r4, r2
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x6
	bhi _081317D2
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _081317B8
_081317D2:
	cmp r2, 0x7
	bhi _081317E6
	movs r1, 0xFF
_081317D8:
	adds r0, r4, r2
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _081317D8
_081317E6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081317EC: .4byte gUnknown_8463124
_081317F0: .4byte gSaveBlock1Ptr
_081317F4: .4byte 0x00003a4c
	thumb_func_end sub_8131754

	.align 2, 0 @ Don't pad with nop.
