	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8139388
sub_8139388: @ 8139388
	push {r4,lr}
	ldr r4, _081393BC @ =gMonSummaryScreen
	ldr r0, [r4]
	ldr r1, _081393C0 @ =0x00003290
	adds r0, r1
	ldr r1, _081393C4 @ =gUnknown_203B16D
	ldrb r1, [r1]
	bl sub_8138BEC
	lsls r0, 16
	lsrs r0, 16
	bl IsMoveHm
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081393CC
	ldr r0, [r4]
	ldr r1, _081393C8 @ =0x00003208
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _081393CC
	movs r0, 0
	b _081393CE
	.align 2, 0
_081393BC: .4byte gMonSummaryScreen
_081393C0: .4byte 0x00003290
_081393C4: .4byte gUnknown_203B16D
_081393C8: .4byte 0x00003208
_081393CC:
	movs r0, 0x1
_081393CE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8139388

	thumb_func_start sub_81393D4
sub_81393D4: @ 81393D4
	push {r4,r5,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _081393F8 @ =gMonSummaryScreen
	ldr r0, [r1]
	ldr r3, _081393FC @ =0x00003288
	adds r0, r3
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0x6
	bls _081393EE
	b _08139748
_081393EE:
	lsls r0, 2
	ldr r1, _08139400 @ =_08139404
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081393F8: .4byte gMonSummaryScreen
_081393FC: .4byte 0x00003288
_08139400: .4byte _08139404
	.align 2, 0
_08139404:
	.4byte _08139420
	.4byte _08139444
	.4byte _0813946C
	.4byte _08139604
	.4byte _08139628
	.4byte _081396A8
	.4byte _08139710
_08139420:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _0813943C @ =gMonSummaryScreen
	ldr r1, [r0]
	ldr r4, _08139440 @ =0x00003288
	adds r1, r4
	b _08139728
	.align 2, 0
_0813943C: .4byte gMonSummaryScreen
_08139440: .4byte 0x00003288
_08139444:
	ldr r0, _08139460 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08139452
	b _0813975A
_08139452:
	bl sub_813B784
	ldr r0, _08139464 @ =gMonSummaryScreen
	ldr r1, [r0]
	ldr r0, _08139468 @ =0x00003288
	adds r1, r0
	b _08139728
	.align 2, 0
_08139460: .4byte gPaletteFade
_08139464: .4byte gMonSummaryScreen
_08139468: .4byte 0x00003288
_0813946C:
	ldr r0, _081394BC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _081394DC
	ldr r4, _081394C0 @ =gUnknown_203B16D
	ldrb r0, [r4]
	cmp r0, 0
	beq _081394CC
	ldr r0, [r5]
	ldr r1, _081394C4 @ =0x00003288
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0]
	movs r0, 0x5
	bl PlaySE
	ldrb r4, [r4]
	cmp r4, 0
	bne _0813949C
	b _0813975A
_0813949C:
	ldr r0, [r5]
	ldr r2, _081394C8 @ =0x00003258
	adds r1, r0, r2
_081394A2:
	subs r4, 0x1
	lsls r0, r4, 1
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, 0
	beq _081394B0
	b _08139738
_081394B0:
	lsls r0, r4, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _081394A2
	b _0813975A
	.align 2, 0
_081394BC: .4byte gMain
_081394C0: .4byte gUnknown_203B16D
_081394C4: .4byte 0x00003288
_081394C8: .4byte 0x00003258
_081394CC:
	movs r0, 0x4
	strb r0, [r4]
	ldr r0, [r5]
	ldr r3, _081394D8 @ =0x00003288
	adds r0, r3
	b _08139556
	.align 2, 0
_081394D8: .4byte 0x00003288
_081394DC:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08139568
	ldr r3, _08139538 @ =gUnknown_203B16D
	ldrb r0, [r3]
	cmp r0, 0x3
	bhi _08139548
	movs r2, 0x4
	ldr r0, [r5]
	ldr r4, _0813953C @ =0x00003288
	adds r0, r4
	movs r1, 0x3
	strb r1, [r0]
	ldr r1, [r5]
	subs r4, 0x20
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08139506
	movs r2, 0x3
_08139506:
	ldrb r4, [r3]
	cmp r4, r2
	bcs _08139526
	ldr r0, _08139540 @ =0x00003258
	adds r1, r0
_08139510:
	adds r4, 0x1
	lsls r0, r4, 1
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813951E
	b _08139738
_0813951E:
	lsls r0, r4, 24
	lsrs r4, r0, 24
	cmp r4, r2
	bcc _08139510
_08139526:
	ldr r0, [r5]
	ldr r1, _08139544 @ =0x00003268
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08139534
	b _0813975A
_08139534:
	b _08139738
	.align 2, 0
_08139538: .4byte gUnknown_203B16D
_0813953C: .4byte 0x00003288
_08139540: .4byte 0x00003258
_08139544: .4byte 0x00003268
_08139548:
	cmp r0, 0x4
	beq _0813954E
	b _0813975A
_0813954E:
	strb r2, [r3]
	ldr r0, [r5]
	ldr r2, _08139564 @ =0x00003288
	adds r0, r2
_08139556:
	movs r1, 0x3
	strb r1, [r0]
	movs r0, 0x5
	bl PlaySE
	b _0813975A
	.align 2, 0
_08139564: .4byte 0x00003288
_08139568:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081395D4
	bl sub_8139388
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08139584
	ldr r0, _081395A4 @ =gUnknown_203B16D
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _081395B8
_08139584:
	movs r0, 0x5
	bl PlaySE
	ldr r2, _081395A8 @ =gUnknown_203B16E
	ldr r0, _081395A4 @ =gUnknown_203B16D
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r1, _081395AC @ =gSpecialVar_0x8005
	ldrb r0, [r2]
	strh r0, [r1]
	ldr r0, _081395B0 @ =gMonSummaryScreen
	ldr r0, [r0]
	ldr r3, _081395B4 @ =0x00003288
	adds r0, r3
	b _081395F0
	.align 2, 0
_081395A4: .4byte gUnknown_203B16D
_081395A8: .4byte gUnknown_203B16E
_081395AC: .4byte gSpecialVar_0x8005
_081395B0: .4byte gMonSummaryScreen
_081395B4: .4byte 0x00003288
_081395B8:
	movs r0, 0x1A
	bl PlaySE
	ldr r0, _081395CC @ =gMonSummaryScreen
	ldr r0, [r0]
	ldr r4, _081395D0 @ =0x00003288
	adds r0, r4
	movs r1, 0x5
	strb r1, [r0]
	b _0813975A
	.align 2, 0
_081395CC: .4byte gMonSummaryScreen
_081395D0: .4byte 0x00003288
_081395D4:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _081395DE
	b _0813975A
_081395DE:
	ldr r1, _081395F8 @ =gUnknown_203B16E
	movs r0, 0x4
	strb r0, [r1]
	ldr r1, _081395FC @ =gSpecialVar_0x8005
	movs r0, 0x4
	strh r0, [r1]
	ldr r0, [r5]
	ldr r1, _08139600 @ =0x00003288
	adds r0, r1
_081395F0:
	movs r1, 0x6
	strb r1, [r0]
	b _0813975A
	.align 2, 0
_081395F8: .4byte gUnknown_203B16E
_081395FC: .4byte gSpecialVar_0x8005
_08139600: .4byte 0x00003288
_08139604:
	bl sub_8136F4C
	bl sub_81374E8
	bl sub_8137BD0
	ldr r0, _08139620 @ =gMonSummaryScreen
	ldr r0, [r0]
	ldr r2, _08139624 @ =0x00003288
	adds r0, r2
	movs r1, 0x4
	strb r1, [r0]
	b _0813975A
	.align 2, 0
_08139620: .4byte gMonSummaryScreen
_08139624: .4byte 0x00003288
_08139628:
	bl MenuHelpers_CallLinkSomething
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08139636
	b _0813975A
_08139636:
	bl sub_800B270
	cmp r0, 0x1
	bne _08139640
	b _0813975A
_08139640:
	ldr r4, _08139690 @ =gMonSummaryScreen
	ldr r0, [r4]
	ldr r3, _08139694 @ =0x00003003
	adds r0, r3
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r1, _08139698 @ =0x00003004
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, _0813969C @ =0x00003005
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r3, _081396A0 @ =0x00003006
	adds r0, r3
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	ldr r0, [r4]
	ldr r4, _081396A4 @ =0x00003288
	adds r0, r4
	b _081396F8
	.align 2, 0
_08139690: .4byte gMonSummaryScreen
_08139694: .4byte 0x00003003
_08139698: .4byte 0x00003004
_0813969C: .4byte 0x00003005
_081396A0: .4byte 0x00003006
_081396A4: .4byte 0x00003288
_081396A8:
	ldr r0, [r5]
	ldr r4, _08139700 @ =0x00003004
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	ldr r1, _08139704 @ =gUnknown_8463FA4
	str r1, [sp, 0x8]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0xC]
	ldr r1, _08139708 @ =gUnknown_8419CB9
	str r1, [sp, 0x10]
	movs r1, 0x2
	movs r2, 0x7
	movs r3, 0x2A
	bl AddTextPrinterParameterized4
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	ldr r0, [r5]
	ldr r1, _0813970C @ =0x00003288
	adds r0, r1
_081396F8:
	movs r1, 0x2
	strb r1, [r0]
	b _0813975A
	.align 2, 0
_08139700: .4byte 0x00003004
_08139704: .4byte gUnknown_8463FA4
_08139708: .4byte gUnknown_8419CB9
_0813970C: .4byte 0x00003288
_08139710:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08139730 @ =gMonSummaryScreen
	ldr r1, [r0]
	ldr r2, _08139734 @ =0x00003288
	adds r1, r2
_08139728:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0813975A
	.align 2, 0
_08139730: .4byte gMonSummaryScreen
_08139734: .4byte 0x00003288
_08139738:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08139744 @ =gUnknown_203B16D
	strb r4, [r0]
	b _0813975A
	.align 2, 0
_08139744: .4byte gUnknown_203B16D
_08139748:
	ldr r0, _08139764 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0813975A
	adds r0, r2, 0
	bl sub_8137E64
_0813975A:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08139764: .4byte gPaletteFade
	thumb_func_end sub_81393D4

	thumb_func_start sub_8139768
sub_8139768: @ 8139768
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r0, _081397A4 @ =gMonSummaryScreen
	ldr r1, [r0]
	ldr r2, _081397A8 @ =0x00003020
	adds r1, r2
	ldrb r1, [r1]
	adds r6, r0, 0
	cmp r1, 0x1
	bhi _08139858
	ldr r3, _081397AC @ =gUnknown_203B170
	ldr r2, [r3]
	ldrb r0, [r2, 0x4]
	adds r1, r0, 0x1
	strb r1, [r2, 0x4]
	lsls r0, 24
	lsrs r0, 24
	adds r5, r3, 0
	cmp r0, 0x1
	bls _08139858
	ldr r3, [r5]
	ldrb r0, [r3, 0x8]
	cmp r0, 0x1
	beq _081397D8
	cmp r0, 0x1
	bgt _081397B0
	cmp r0, 0
	beq _081397B6
	b _0813981C
	.align 2, 0
_081397A4: .4byte gMonSummaryScreen
_081397A8: .4byte 0x00003020
_081397AC: .4byte gUnknown_203B170
_081397B0:
	cmp r0, 0x2
	beq _081397FC
	b _0813981C
_081397B6:
	ldr r2, _081397D4 @ =gUnknown_8463FBE
	ldrb r0, [r3]
	adds r1, r0, 0x1
	strb r1, [r3]
	lsls r0, 24
	lsrs r0, 24
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	movs r1, 0x3
	b _0813983A
	.align 2, 0
_081397D4: .4byte gUnknown_8463FBE
_081397D8:
	ldr r2, _081397F8 @ =gUnknown_8463FC1
	ldrb r0, [r3]
	adds r1, r0, 0x1
	strb r1, [r3]
	lsls r0, 24
	lsrs r0, 24
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	movs r1, 0x5
	b _0813983A
	.align 2, 0
_081397F8: .4byte gUnknown_8463FC1
_081397FC:
	ldr r2, _08139818 @ =gUnknown_8463FC6
	ldrb r0, [r3]
	adds r1, r0, 0x1
	strb r1, [r3]
	lsls r0, 24
	lsrs r0, 24
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r4, 0x22]
	adds r0, r1
	b _08139836
	.align 2, 0
_08139818: .4byte gUnknown_8463FC6
_0813981C:
	ldr r3, _08139860 @ =gUnknown_8463FCD
	ldr r2, [r5]
	ldrb r0, [r2]
	adds r1, r0, 0x1
	strb r1, [r2]
	lsls r0, 24
	lsrs r0, 24
	adds r0, r3
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r2, [r4, 0x22]
	adds r0, r2
_08139836:
	strh r0, [r4, 0x22]
	movs r1, 0x7
_0813983A:
	ldr r2, [r5]
	ldrb r0, [r2]
	cmp r0, r1
	bcc _08139852
	movs r0, 0
	strb r0, [r2]
	ldr r1, [r6]
	ldr r0, _08139864 @ =0x00003020
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08139852:
	ldr r1, [r5]
	movs r0, 0
	strb r0, [r1, 0x4]
_08139858:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08139860: .4byte gUnknown_8463FCD
_08139864: .4byte 0x00003020
	thumb_func_end sub_8139768

	thumb_func_start sub_8139868
sub_8139868: @ 8139868
	push {r4-r6,lr}
	adds r3, r0, 0
	ldr r5, _081398C0 @ =gMonSummaryScreen
	ldr r0, [r5]
	ldr r6, _081398C4 @ =0x00003020
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x1
	bhi _0813994C
	ldr r4, _081398C8 @ =gUnknown_203B170
	ldr r2, [r4]
	ldrb r0, [r2, 0x8]
	cmp r0, 0x1
	beq _081398D0
	cmp r0, 0x1
	ble _0813988C
	cmp r0, 0x2
	beq _08139908
_0813988C:
	ldrb r0, [r2, 0x4]
	adds r1, r0, 0x1
	strb r1, [r2, 0x4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x77
	bls _0813994C
	ldr r2, _081398CC @ =gUnknown_8463FD4
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r2, [r3, 0x20]
	adds r0, r2
	movs r2, 0
	strh r0, [r3, 0x20]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA
	bls _0813994C
	b _0813993A
	.align 2, 0
_081398C0: .4byte gMonSummaryScreen
_081398C4: .4byte 0x00003020
_081398C8: .4byte gUnknown_203B170
_081398CC: .4byte gUnknown_8463FD4
_081398D0:
	ldrb r0, [r2, 0x4]
	adds r1, r0, 0x1
	strb r1, [r2, 0x4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x59
	bls _0813994C
	ldr r2, _08139904 @ =gUnknown_8463FDF
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r2, [r3, 0x20]
	adds r0, r2
	movs r2, 0
	strh r0, [r3, 0x20]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA
	bls _0813994C
	b _0813993A
	.align 2, 0
_08139904: .4byte gUnknown_8463FDF
_08139908:
	ldrb r0, [r2, 0x4]
	adds r1, r0, 0x1
	strb r1, [r2, 0x4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	bls _0813994C
	ldr r2, _08139954 @ =gUnknown_8463FEA
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r2, [r3, 0x20]
	adds r0, r2
	movs r2, 0
	strh r0, [r3, 0x20]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE
	bls _0813994C
_0813993A:
	ldr r0, [r4]
	strb r2, [r0]
	ldr r0, [r4]
	strb r2, [r0, 0x4]
	ldr r1, [r5]
	adds r1, r6
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0813994C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08139954: .4byte gUnknown_8463FEA
	thumb_func_end sub_8139868

	thumb_func_start nullsub_96
nullsub_96: @ 8139958
	bx lr
	thumb_func_end nullsub_96

	thumb_func_start sub_813995C
sub_813995C: @ 813995C
	push {r4-r7,lr}
	sub sp, 0x14
	ldr r4, _081399CC @ =gUnknown_203B170
	movs r0, 0xC
	bl AllocZeroed
	str r0, [r4]
	ldr r5, _081399D0 @ =gMonSummaryScreen
	ldr r0, [r5]
	ldr r4, _081399D4 @ =0x00003290
	adds r0, r4
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, [r5]
	adds r0, r4
	movs r1, 0
	bl GetMonData
	adds r6, r0, 0
	ldr r0, [r5]
	adds r0, r4
	movs r1, 0x1
	bl GetMonData
	adds r4, r0, 0
	ldr r5, [r5]
	ldr r1, _081399D8 @ =0x000032f8
	adds r0, r5, r1
	ldr r1, [r0]
	ldr r0, _081399DC @ =CB2_ReturnToTradeMenuFromSummary
	cmp r1, r0
	bne _081399E8
	ldr r1, _081399E0 @ =0x00003024
	adds r0, r5, r1
	ldr r5, [r0]
	cmp r5, 0x1
	bne _08139A24
	movs r0, 0x3C
	str r0, [sp]
	movs r0, 0x41
	str r0, [sp, 0x4]
	movs r0, 0xC
	str r0, [sp, 0x8]
	ldr r0, _081399E4 @ =0x0000ffff
	str r0, [sp, 0xC]
	str r5, [sp, 0x10]
	adds r0, r7, 0
	adds r1, r4, 0
	adds r2, r6, 0
	movs r3, 0x1
	bl CreateMonPicSprite
	b _08139A40
	.align 2, 0
_081399CC: .4byte gUnknown_203B170
_081399D0: .4byte gMonSummaryScreen
_081399D4: .4byte 0x00003290
_081399D8: .4byte 0x000032f8
_081399DC: .4byte CB2_ReturnToTradeMenuFromSummary
_081399E0: .4byte 0x00003024
_081399E4: .4byte 0x0000ffff
_081399E8:
	ldr r0, _08139A1C @ =gLastViewedMonIndex
	ldrb r1, [r0]
	movs r0, 0x3
	bl sub_804455C
	lsls r0, 24
	cmp r0, 0
	beq _08139A24
	movs r0, 0x3C
	str r0, [sp]
	movs r0, 0x41
	str r0, [sp, 0x4]
	movs r0, 0xC
	str r0, [sp, 0x8]
	ldr r0, _08139A20 @ =0x0000ffff
	str r0, [sp, 0xC]
	movs r0, 0x1
	str r0, [sp, 0x10]
	adds r0, r7, 0
	adds r1, r4, 0
	adds r2, r6, 0
	movs r3, 0x1
	bl CreateMonPicSprite
	b _08139A40
	.align 2, 0
_08139A1C: .4byte gLastViewedMonIndex
_08139A20: .4byte 0x0000ffff
_08139A24:
	movs r0, 0x3C
	str r0, [sp]
	movs r0, 0x41
	str r0, [sp, 0x4]
	movs r0, 0xC
	str r0, [sp, 0x8]
	ldr r0, _08139A70 @ =0x0000ffff
	str r0, [sp, 0xC]
	adds r0, r7, 0
	adds r1, r4, 0
	adds r2, r6, 0
	movs r3, 0x1
	bl CreateMonPicSprite_HandleDeoxys
_08139A40:
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	ldr r1, _08139A74 @ =gSprites
	adds r4, r0, r1
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r7, 0
	bl IsPokeSpriteNotFlipped
	lsls r0, 24
	cmp r0, 0
	bne _08139A78
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	b _08139A86
	.align 2, 0
_08139A70: .4byte 0x0000ffff
_08139A74: .4byte gSprites
_08139A78:
	adds r2, r4, 0
	adds r2, 0x3F
	ldrb r1, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_08139A86:
	ldr r0, _08139AA4 @ =gMonSummaryScreen
	ldr r0, [r0]
	ldr r1, _08139AA8 @ =0x00003010
	adds r0, r1
	strb r5, [r0]
	movs r0, 0x1
	bl sub_8139C44
	adds r0, r5, 0
	bl sub_8139AAC
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08139AA4: .4byte gMonSummaryScreen
_08139AA8: .4byte 0x00003010
	thumb_func_end sub_813995C

	thumb_func_start sub_8139AAC
sub_8139AAC: @ 8139AAC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r1, _08139AF4 @ =gMonSummaryScreen
	ldr r0, [r1]
	ldr r2, _08139AF8 @ =0x00003020
	adds r0, r2
	movs r6, 0
	strb r6, [r0]
	ldr r2, [r1]
	movs r3, 0xC8
	lsls r3, 6
	adds r0, r2, r3
	ldrb r4, [r0]
	adds r7, r1, 0
	cmp r4, 0x1
	bne _08139B3C
	ldr r1, _08139AFC @ =0x00003290
	adds r0, r2, r1
	movs r1, 0x20
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x5
	bhi _08139B04
	ldr r0, _08139B00 @ =gUnknown_203B170
	ldr r1, [r0]
	movs r0, 0x2
	strb r0, [r1, 0x8]
	b _08139B1E
	.align 2, 0
_08139AF4: .4byte gMonSummaryScreen
_08139AF8: .4byte 0x00003020
_08139AFC: .4byte 0x00003290
_08139B00: .4byte gUnknown_203B170
_08139B04:
	cmp r0, 0xA
	bhi _08139B14
	ldr r0, _08139B10 @ =gUnknown_203B170
	ldr r0, [r0]
	strb r4, [r0, 0x8]
	b _08139B1E
	.align 2, 0
_08139B10: .4byte gUnknown_203B170
_08139B14:
	cmp r1, 0x28
	bhi _08139B1E
	ldr r0, _08139B30 @ =gUnknown_203B170
	ldr r0, [r0]
	strb r6, [r0, 0x8]
_08139B1E:
	ldr r0, _08139B34 @ =gSprites
	mov r2, r8
	lsls r1, r2, 4
	add r1, r8
	lsls r1, 2
	adds r0, 0x1C
	adds r1, r0
	ldr r0, _08139B38 @ =sub_8139868
	b _08139C28
	.align 2, 0
_08139B30: .4byte gUnknown_203B170
_08139B34: .4byte gSprites
_08139B38: .4byte sub_8139868
_08139B3C:
	ldr r3, _08139B60 @ =0x0000326c
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0
	beq _08139B6C
	cmp r0, 0x6
	beq _08139B6C
	cmp r0, 0x7
	beq _08139C2A
	ldr r0, _08139B64 @ =gSprites
	mov r2, r8
	lsls r1, r2, 4
	add r1, r8
	lsls r1, 2
	adds r0, 0x1C
	adds r1, r0
	ldr r0, _08139B68 @ =nullsub_96
	b _08139C28
	.align 2, 0
_08139B60: .4byte 0x0000326c
_08139B64: .4byte gSprites
_08139B68: .4byte nullsub_96
_08139B6C:
	ldr r0, [r7]
	ldr r4, _08139B98 @ =0x00003290
	adds r0, r4
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, [r7]
	adds r0, r4
	movs r1, 0x3A
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r6, r0
	bne _08139BA0
	ldr r0, _08139B9C @ =gUnknown_203B170
	ldr r1, [r0]
	movs r0, 0x3
	b _08139C16
	.align 2, 0
_08139B98: .4byte 0x00003290
_08139B9C: .4byte gUnknown_203B170
_08139BA0:
	bl __floatsidf
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r3, _08139BD8+4 @ =0x9999999a
	ldr r2, _08139BD8 @ =0x3fe99999
	bl __muldf3
	adds r5, r1, 0
	adds r4, r0, 0
	adds r0, r6, 0
	bl __floatsidf
	adds r7, r1, 0
	adds r6, r0, 0
	adds r1, r5, 0
	adds r0, r4, 0
	adds r3, r7, 0
	adds r2, r6, 0
	bl __ledf2
	cmp r0, 0
	bgt _08139BE4
	ldr r0, _08139BE0 @ =gUnknown_203B170
	ldr r1, [r0]
	movs r0, 0x2
	b _08139C16
	.align 2, 0
@ _08139BD8: .double 0.8
_08139BD8: .4byte 0x3fe99999
_08139BDC: .4byte 0x9999999a
_08139BE0: .4byte gUnknown_203B170
_08139BE4:
	ldr r3, _08139C04+4 @ =0x33333333
	ldr r2, _08139C04 @ =0x3fe33333
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	bl __muldf3
	adds r3, r7, 0
	adds r2, r6, 0
	bl __ledf2
	cmp r0, 0
	bgt _08139C10
	ldr r0, _08139C0C @ =gUnknown_203B170
	ldr r1, [r0]
	movs r0, 0x1
	b _08139C16
	.align 2, 0
@ _08139C04: .double 0.6
_08139C04: .4byte 0x3fe33333
_08139C08: .4byte 0x33333333
_08139C0C: .4byte gUnknown_203B170
_08139C10:
	ldr r0, _08139C38 @ =gUnknown_203B170
	ldr r1, [r0]
	movs r0, 0
_08139C16:
	strb r0, [r1, 0x8]
	ldr r0, _08139C3C @ =gSprites
	mov r3, r8
	lsls r1, r3, 4
	add r1, r8
	lsls r1, 2
	adds r0, 0x1C
	adds r1, r0
	ldr r0, _08139C40 @ =sub_8139768
_08139C28:
	str r0, [r1]
_08139C2A:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08139C38: .4byte gUnknown_203B170
_08139C3C: .4byte gSprites
_08139C40: .4byte sub_8139768
	thumb_func_end sub_8139AAC

	thumb_func_start sub_8139C44
sub_8139C44: @ 8139C44
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08139C74 @ =gSprites
	ldr r1, _08139C78 @ =gMonSummaryScreen
	ldr r1, [r1]
	ldr r2, _08139C7C @ =0x00003010
	adds r1, r2
	ldrb r1, [r1]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	adds r2, 0x3E
	movs r1, 0x1
	ands r0, r1
	lsls r0, 2
	ldrb r3, [r2]
	movs r1, 0x5
	negs r1, r1
	ands r1, r3
	orrs r1, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_08139C74: .4byte gSprites
_08139C78: .4byte gMonSummaryScreen
_08139C7C: .4byte 0x00003010
	thumb_func_end sub_8139C44

	thumb_func_start sub_8139C80
sub_8139C80: @ 8139C80
	push {r4,lr}
	ldr r0, _08139CA4 @ =gMonSummaryScreen
	ldr r0, [r0]
	ldr r1, _08139CA8 @ =0x00003010
	adds r0, r1
	ldrb r0, [r0]
	bl FreeAndDestroyMonPicSprite
	ldr r4, _08139CAC @ =gUnknown_203B170
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08139CA4: .4byte gMonSummaryScreen
_08139CA8: .4byte 0x00003010
_08139CAC: .4byte gUnknown_203B170
	thumb_func_end sub_8139C80

	thumb_func_start sub_8139CB0
sub_8139CB0: @ 8139CB0
	push {r4,lr}
	ldr r0, _08139CD4 @ =gMonSummaryScreen
	ldr r1, [r0]
	movs r2, 0xC8
	lsls r2, 6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08139CD8
	adds r2, 0x90
	adds r0, r1, r2
	movs r1, 0x26
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	b _08139CDA
	.align 2, 0
_08139CD4: .4byte gMonSummaryScreen
_08139CD8:
	movs r0, 0
_08139CDA:
	bl ItemIdToBallId
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl LoadBallGfx
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	ldr r1, _08139D40 @ =gBallSpriteTemplates
	adds r0, r1
	movs r1, 0x6A
	movs r2, 0x58
	movs r3, 0
	bl CreateSprite
	ldr r2, _08139D44 @ =gMonSummaryScreen
	ldr r1, [r2]
	ldr r3, _08139D48 @ =0x0000300c
	adds r1, r3
	strb r0, [r1]
	ldr r4, _08139D4C @ =gSprites
	ldr r2, [r2]
	adds r2, r3
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08139D50 @ =SpriteCallbackDummy
	str r1, [r0]
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x5]
	movs r0, 0x1
	bl sub_8139D54
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08139D40: .4byte gBallSpriteTemplates
_08139D44: .4byte gMonSummaryScreen
_08139D48: .4byte 0x0000300c
_08139D4C: .4byte gSprites
_08139D50: .4byte SpriteCallbackDummy
	thumb_func_end sub_8139CB0

	thumb_func_start sub_8139D54
sub_8139D54: @ 8139D54
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08139D84 @ =gSprites
	ldr r1, _08139D88 @ =gMonSummaryScreen
	ldr r1, [r1]
	ldr r2, _08139D8C @ =0x0000300c
	adds r1, r2
	ldrb r1, [r1]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	adds r2, 0x3E
	movs r1, 0x1
	ands r0, r1
	lsls r0, 2
	ldrb r3, [r2]
	movs r1, 0x5
	negs r1, r1
	ands r1, r3
	orrs r1, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_08139D84: .4byte gSprites
_08139D88: .4byte gMonSummaryScreen
_08139D8C: .4byte 0x0000300c
	thumb_func_end sub_8139D54

	thumb_func_start sub_8139D90
sub_8139D90: @ 8139D90
	push {lr}
	ldr r0, _08139DB0 @ =gMonSummaryScreen
	ldr r0, [r0]
	ldr r1, _08139DB4 @ =0x0000300c
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08139DB8 @ =gSprites
	adds r0, r1
	bl DestroySpriteAndFreeResources2
	pop {r0}
	bx r0
	.align 2, 0
_08139DB0: .4byte gMonSummaryScreen
_08139DB4: .4byte 0x0000300c
_08139DB8: .4byte gSprites
	thumb_func_end sub_8139D90

	thumb_func_start sub_8139DBC
sub_8139DBC: @ 8139DBC
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r6, _08139E08 @ =gMonSummaryScreen
	ldr r0, [r6]
	ldr r4, _08139E0C @ =0x00003290
	adds r0, r4
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, [r6]
	adds r0, r4
	movs r1, 0
	bl GetMonData
	adds r4, r0, 0
	adds r0, r5, 0
	bl SafeLoadMonIconPalette
	ldr r2, [r6]
	ldr r1, _08139E10 @ =0x000032f8
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, _08139E14 @ =CB2_ReturnToTradeMenuFromSummary
	cmp r1, r0
	bne _08139E2C
	ldr r1, _08139E18 @ =0x00003024
	adds r0, r2, r1
	ldr r0, [r0]
	cmp r0, 0x1
	bne _08139E20
	ldr r1, _08139E1C @ =SpriteCallbackDummy
	movs r0, 0
	str r0, [sp]
	str r4, [sp, 0x4]
	b _08139E58
	.align 2, 0
_08139E08: .4byte gMonSummaryScreen
_08139E0C: .4byte 0x00003290
_08139E10: .4byte 0x000032f8
_08139E14: .4byte CB2_ReturnToTradeMenuFromSummary
_08139E18: .4byte 0x00003024
_08139E1C: .4byte SpriteCallbackDummy
_08139E20:
	ldr r1, _08139E28 @ =SpriteCallbackDummy
	movs r0, 0
	b _08139E52
	.align 2, 0
_08139E28: .4byte SpriteCallbackDummy
_08139E2C:
	ldr r0, _08139E48 @ =gLastViewedMonIndex
	ldrb r1, [r0]
	movs r0, 0x3
	bl sub_804455C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08139E50
	ldr r1, _08139E4C @ =SpriteCallbackDummy
	movs r0, 0
	str r0, [sp]
	str r4, [sp, 0x4]
	b _08139E58
	.align 2, 0
_08139E48: .4byte gLastViewedMonIndex
_08139E4C: .4byte SpriteCallbackDummy
_08139E50:
	ldr r1, _08139E98 @ =SpriteCallbackDummy
_08139E52:
	str r0, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x1
_08139E58:
	str r0, [sp, 0x8]
	adds r0, r5, 0
	movs r2, 0x18
	movs r3, 0x20
	bl CreateMonIcon
	ldr r1, [r6]
	ldr r2, _08139E9C @ =0x00003014
	adds r1, r2
	strb r0, [r1]
	adds r0, r5, 0
	bl IsPokeSpriteNotFlipped
	lsls r0, 24
	cmp r0, 0
	bne _08139EA8
	ldr r2, _08139EA0 @ =gSprites
	ldr r0, _08139EA4 @ =gMonSummaryScreen
	ldr r0, [r0]
	ldr r1, _08139E9C @ =0x00003014
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	b _08139EC6
	.align 2, 0
_08139E98: .4byte SpriteCallbackDummy
_08139E9C: .4byte 0x00003014
_08139EA0: .4byte gSprites
_08139EA4: .4byte gMonSummaryScreen
_08139EA8:
	ldr r2, _08139ED8 @ =gSprites
	ldr r0, _08139EDC @ =gMonSummaryScreen
	ldr r0, [r0]
	ldr r1, _08139EE0 @ =0x00003014
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3F
	ldrb r2, [r0]
	movs r1, 0x2
	negs r1, r1
	ands r1, r2
_08139EC6:
	strb r1, [r0]
	movs r0, 0x1
	bl sub_8139EE4
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08139ED8: .4byte gSprites
_08139EDC: .4byte gMonSummaryScreen
_08139EE0: .4byte 0x00003014
	thumb_func_end sub_8139DBC

	thumb_func_start sub_8139EE4
sub_8139EE4: @ 8139EE4
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08139F14 @ =gSprites
	ldr r1, _08139F18 @ =gMonSummaryScreen
	ldr r1, [r1]
	ldr r2, _08139F1C @ =0x00003014
	adds r1, r2
	ldrb r1, [r1]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	adds r2, 0x3E
	movs r1, 0x1
	ands r0, r1
	lsls r0, 2
	ldrb r3, [r2]
	movs r1, 0x5
	negs r1, r1
	ands r1, r3
	orrs r1, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_08139F14: .4byte gSprites
_08139F18: .4byte gMonSummaryScreen
_08139F1C: .4byte 0x00003014
	thumb_func_end sub_8139EE4

	thumb_func_start sub_8139F20
sub_8139F20: @ 8139F20
	push {r4,lr}
	ldr r4, _08139F54 @ =gMonSummaryScreen
	ldr r0, [r4]
	ldr r1, _08139F58 @ =0x00003290
	adds r0, r1
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl SafeFreeMonIconPalette
	ldr r0, [r4]
	ldr r1, _08139F5C @ =0x00003014
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08139F60 @ =gSprites
	adds r0, r1
	bl DestroyMonIcon
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08139F54: .4byte gMonSummaryScreen
_08139F58: .4byte 0x00003290
_08139F5C: .4byte 0x00003014
_08139F60: .4byte gSprites
	thumb_func_end sub_8139F20

	thumb_func_start sub_8139F64
sub_8139F64: @ 8139F64
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x30]
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	movs r6, 0x80
	lsls r6, 4
	adds r0, r6, 0
	bl AllocZeroed
	str r0, [sp, 0x18]
	adds r0, r6, 0
	bl AllocZeroed
	add r5, sp, 0x18
	str r0, [r5, 0x4]
	movs r0, 0xC
	bl AllocZeroed
	ldr r4, _0813A0BC @ =gUnknown_203B148
	str r0, [r4]
	movs r0, 0xC
	bl AllocZeroed
	str r0, [r4, 0x4]
	movs r0, 0xC
	bl AllocZeroed
	str r0, [r4, 0x8]
	movs r0, 0xC
	bl AllocZeroed
	str r0, [r4, 0xC]
	ldr r0, _0813A0C0 @ =gUnknown_8463740
	ldr r1, [sp, 0x18]
	bl LZ77UnCompWram
	ldr r0, _0813A0C4 @ =gUnknown_846386C
	ldr r1, [r5, 0x4]
	bl LZ77UnCompWram
	movs r7, 0
	add r0, sp, 0x20
	mov r8, r0
	add r6, sp, 0x28
_08139FCC:
	movs r4, 0x1
	ands r4, r7
	lsls r0, r4, 2
	add r0, sp
	adds r0, 0x18
	ldr r0, [r0]
	str r0, [sp, 0x20]
	ldr r1, [sp, 0x30]
	adds r5, r1, r7
	lsls r0, r5, 16
	movs r1, 0x80
	lsls r1, 4
	orrs r0, r1
	mov r1, r8
	str r0, [r1, 0x4]
	ldr r0, _0813A0C8 @ =gUnknown_8463720
	str r0, [sp, 0x28]
	ldr r1, _0813A0CC @ =0xffff0000
	ldr r0, [r6, 0x4]
	ands r0, r1
	mov r1, r9
	orrs r0, r1
	str r0, [r6, 0x4]
	mov r0, sp
	movs r1, 0
	mov r10, r1
	strh r5, [r0]
	mov r1, r9
	strh r1, [r0, 0x2]
	ldr r0, _0813A0D0 @ =gUnknown_846398C
	str r0, [sp, 0x4]
	ldr r0, _0813A0D4 @ =gUnknown_84639A4
	str r0, [sp, 0x8]
	mov r0, r10
	str r0, [sp, 0xC]
	ldr r0, _0813A0D8 @ =gDummySpriteAffineAnimTable
	str r0, [sp, 0x10]
	ldr r0, _0813A0DC @ =sub_813A124
	str r0, [sp, 0x14]
	mov r0, r8
	bl LoadSpriteSheet
	adds r0, r6, 0
	bl LoadSpritePalette
	lsls r1, r4, 6
	adds r1, 0x98
	ldr r0, _0813A0E0 @ =gUnknown_203B16D
	ldrb r0, [r0]
	lsls r2, r0, 3
	subs r2, r0
	lsls r2, 18
	movs r0, 0x88
	lsls r0, 14
	adds r2, r0
	asrs r2, 16
	mov r0, sp
	adds r3, r4, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0813A0BC @ =gUnknown_203B148
	lsls r1, r7, 2
	adds r3, r1, r2
	ldr r2, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0813A0E4 @ =gSprites
	adds r1, r0
	str r1, [r2]
	strh r7, [r2, 0x4]
	ldr r0, [r3]
	strh r5, [r0, 0x6]
	ldr r0, [r3]
	mov r1, r9
	strh r1, [r0, 0x8]
	ldr r0, [r3]
	ldr r0, [r0]
	adds r0, 0x43
	strb r7, [r0]
	cmp r7, 0x1
	bls _0813A07E
	ldr r0, [r3]
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
_0813A07E:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x3
	bls _08139FCC
	movs r0, 0x1
	bl sub_813A0E8
	ldr r0, [sp, 0x18]
	cmp r0, 0
	beq _0813A09C
	bl Free
	mov r0, r10
	str r0, [sp, 0x18]
_0813A09C:
	ldr r0, [sp, 0x1C]
	cmp r0, 0
	beq _0813A0AA
	bl Free
	mov r1, r10
	str r1, [sp, 0x1C]
_0813A0AA:
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813A0BC: .4byte gUnknown_203B148
_0813A0C0: .4byte gUnknown_8463740
_0813A0C4: .4byte gUnknown_846386C
_0813A0C8: .4byte gUnknown_8463720
_0813A0CC: .4byte 0xffff0000
_0813A0D0: .4byte gUnknown_846398C
_0813A0D4: .4byte gUnknown_84639A4
_0813A0D8: .4byte gDummySpriteAffineAnimTable
_0813A0DC: .4byte sub_813A124
_0813A0E0: .4byte gUnknown_203B16D
_0813A0E4: .4byte gSprites
	thumb_func_end sub_8139F64

	thumb_func_start sub_813A0E8
sub_813A0E8: @ 813A0E8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	ldr r6, _0813A120 @ =gUnknown_203B148
	movs r1, 0x1
	ands r0, r1
	lsls r4, r0, 2
	movs r5, 0x5
	negs r5, r5
_0813A0FC:
	lsls r0, r3, 2
	adds r0, r6
	ldr r0, [r0]
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _0813A0FC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813A120: .4byte gUnknown_203B148
	thumb_func_end sub_813A0E8

	thumb_func_start sub_813A124
sub_813A124: @ 813A124
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r6, 0
	ldr r3, _0813A19C @ =gMonSummaryScreen
	ldr r4, _0813A1A0 @ =gUnknown_203B148
_0813A132:
	ldr r0, [r3]
	ldr r1, _0813A1A4 @ =0x00003268
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0813A142
	cmp r6, 0x1
	bhi _0813A158
_0813A142:
	lsls r0, r6, 2
	adds r0, r4
	ldr r0, [r0]
	ldr r2, [r0]
	ldr r0, _0813A1A8 @ =gUnknown_203B16D
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, 0x22
	strh r0, [r2, 0x22]
_0813A158:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _0813A132
	ldr r1, [r3]
	ldr r2, _0813A1A4 @ =0x00003268
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0813A1AC
	subs r2, 0x54
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _0813A20E
	ldr r4, _0813A1A0 @ =gUnknown_203B148
	ldr r0, [r4]
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	ldr r0, [r4, 0x4]
	ldr r0, [r0]
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	b _0813A20E
	.align 2, 0
_0813A19C: .4byte gMonSummaryScreen
_0813A1A0: .4byte gUnknown_203B148
_0813A1A4: .4byte 0x00003268
_0813A1A8: .4byte gUnknown_203B16D
_0813A1AC:
	movs r6, 0
	ldr r0, _0813A1F0 @ =gUnknown_203B148
	mov r9, r0
	mov r8, r6
	movs r7, 0x4
	movs r1, 0x5
	negs r1, r1
	mov r12, r1
_0813A1BC:
	lsls r0, r6, 2
	add r0, r9
	ldr r0, [r0]
	ldr r3, [r0]
	ldrh r0, [r3, 0x2E]
	adds r1, r0, 0x1
	strh r1, [r3, 0x2E]
	adds r4, r3, 0
	adds r4, 0x3E
	ldrb r2, [r4]
	movs r0, 0x4
	ands r0, r2
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _0813A1F4
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _0813A204
	mov r0, r12
	ands r0, r2
	strb r0, [r4]
	mov r2, r8
	strh r2, [r3, 0x2E]
	b _0813A204
	.align 2, 0
_0813A1F0: .4byte gUnknown_203B148
_0813A1F4:
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _0813A204
	adds r0, r2, 0
	orrs r0, r7
	strb r0, [r4]
	strh r5, [r3, 0x2E]
_0813A204:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x1
	bls _0813A1BC
_0813A20E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_813A124

	thumb_func_start sub_813A21C
sub_813A21C: @ 813A21C
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, _0813A250 @ =gUnknown_203B148
_0813A222:
	lsls r0, r5, 2
	adds r4, r0, r6
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, 0
	beq _0813A232
	bl DestroySpriteAndFreeResources
_0813A232:
	ldr r0, [r4]
	cmp r0, 0
	beq _0813A240
	bl Free
	movs r0, 0
	str r0, [r4]
_0813A240:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _0813A222
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813A250: .4byte gUnknown_203B148
	thumb_func_end sub_813A21C

	thumb_func_start sub_813A254
sub_813A254: @ 813A254
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x28
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r0, _0813A310 @ =gUnknown_203B158
	mov r8, r0
	movs r0, 0x8
	bl AllocZeroed
	mov r1, r8
	str r0, [r1]
	movs r4, 0x80
	lsls r4, 3
	adds r0, r4, 0
	bl AllocZeroed
	adds r5, r0, 0
	ldr r0, _0813A314 @ =gUnknown_8E9BF48
	adds r1, r5, 0
	bl LZ77UnCompWram
	mov r1, r8
	ldr r0, [r1]
	cmp r0, 0
	beq _0813A2F0
	str r5, [sp, 0x18]
	add r0, sp, 0x18
	lsls r1, r7, 16
	orrs r1, r4
	str r1, [r0, 0x4]
	ldr r1, _0813A318 @ =gUnknown_8E9BF28
	str r1, [sp, 0x20]
	ldr r2, _0813A31C @ =0xffff0000
	add r4, sp, 0x20
	ldr r1, [r4, 0x4]
	ands r1, r2
	orrs r1, r6
	str r1, [r4, 0x4]
	mov r1, sp
	movs r2, 0
	strh r7, [r1]
	strh r6, [r1, 0x2]
	ldr r1, _0813A320 @ =gUnknown_84639AC
	str r1, [sp, 0x4]
	ldr r1, _0813A324 @ =gUnknown_84639F4
	str r1, [sp, 0x8]
	str r2, [sp, 0xC]
	ldr r1, _0813A328 @ =gDummySpriteAffineAnimTable
	str r1, [sp, 0x10]
	ldr r1, _0813A32C @ =SpriteCallbackDummy
	str r1, [sp, 0x14]
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl LoadSpritePalette
	mov r0, sp
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0813A330 @ =gSprites
	adds r1, r0
	str r1, [r2]
	strh r7, [r2, 0x4]
	strh r6, [r2, 0x6]
_0813A2F0:
	movs r0, 0x1
	bl sub_813A3B8
	bl sub_813A35C
	cmp r5, 0
	beq _0813A304
	adds r0, r5, 0
	bl Free
_0813A304:
	add sp, 0x28
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813A310: .4byte gUnknown_203B158
_0813A314: .4byte gUnknown_8E9BF48
_0813A318: .4byte gUnknown_8E9BF28
_0813A31C: .4byte 0xffff0000
_0813A320: .4byte gUnknown_84639AC
_0813A324: .4byte gUnknown_84639F4
_0813A328: .4byte gDummySpriteAffineAnimTable
_0813A32C: .4byte SpriteCallbackDummy
_0813A330: .4byte gSprites
	thumb_func_end sub_813A254

	thumb_func_start sub_813A334
sub_813A334: @ 813A334
	push {r4,lr}
	ldr r4, _0813A358 @ =gUnknown_203B158
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, 0
	beq _0813A344
	bl DestroySpriteAndFreeResources
_0813A344:
	ldr r0, [r4]
	cmp r0, 0
	beq _0813A352
	bl Free
	movs r0, 0
	str r0, [r4]
_0813A352:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813A358: .4byte gUnknown_203B158
	thumb_func_end sub_813A334

	thumb_func_start sub_813A35C
sub_813A35C: @ 813A35C
	push {r4,lr}
	ldr r4, _0813A38C @ =gMonSummaryScreen
	ldr r0, [r4]
	ldr r1, _0813A390 @ =0x00003290
	adds r0, r1
	movs r1, 0x37
	bl GetMonData
	bl sub_8138C5C
	ldr r1, [r4]
	ldr r2, _0813A394 @ =0x0000326c
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	cmp r1, 0
	bne _0813A398
	movs r0, 0x1
	bl sub_813A3B8
	b _0813A3AE
	.align 2, 0
_0813A38C: .4byte gMonSummaryScreen
_0813A390: .4byte 0x00003290
_0813A394: .4byte 0x0000326c
_0813A398:
	ldr r0, _0813A3B4 @ =gUnknown_203B158
	ldr r0, [r0]
	ldr r0, [r0]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	movs r0, 0
	bl sub_813A3B8
_0813A3AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813A3B4: .4byte gUnknown_203B158
	thumb_func_end sub_813A35C

	thumb_func_start sub_813A3B8
sub_813A3B8: @ 813A3B8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _0813A3EC @ =gMonSummaryScreen
	ldr r2, [r1]
	ldr r4, _0813A3F0 @ =0x0000326c
	adds r0, r2, r4
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0
	beq _0813A3DA
	movs r1, 0xC8
	lsls r1, 6
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0813A3F8
_0813A3DA:
	ldr r3, _0813A3F4 @ =gUnknown_203B158
	ldr r0, [r3]
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	b _0813A416
	.align 2, 0
_0813A3EC: .4byte gMonSummaryScreen
_0813A3F0: .4byte 0x0000326c
_0813A3F4: .4byte gUnknown_203B158
_0813A3F8:
	ldr r4, _0813A438 @ =gUnknown_203B158
	ldr r0, [r4]
	ldr r2, [r0]
	adds r2, 0x3E
	movs r0, 0x1
	adds r1, r3, 0
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	adds r3, r4, 0
_0813A416:
	ldr r0, [r5]
	ldr r4, _0813A43C @ =0x00003214
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _0813A440
	ldr r1, [r3]
	ldr r2, [r1]
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	cmp r0, 0x2D
	beq _0813A456
	movs r0, 0x10
	strh r0, [r2, 0x20]
	ldr r1, [r1]
	movs r0, 0x2D
	b _0813A454
	.align 2, 0
_0813A438: .4byte gUnknown_203B158
_0813A43C: .4byte 0x00003214
_0813A440:
	ldr r1, [r3]
	ldr r2, [r1]
	movs r4, 0x22
	ldrsh r0, [r2, r4]
	cmp r0, 0x26
	beq _0813A456
	movs r0, 0x10
	strh r0, [r2, 0x20]
	ldr r1, [r1]
	movs r0, 0x26
_0813A454:
	strh r0, [r1, 0x22]
_0813A456:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813A3B8

	thumb_func_start sub_813A45C
sub_813A45C: @ 813A45C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x40
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	lsls r1, 16
	lsrs r7, r1, 16
	movs r0, 0
	str r0, [sp, 0x38]
	ldr r4, _0813A4BC @ =gUnknown_203B15C
	movs r0, 0x40
	bl AllocZeroed
	str r0, [r4]
	movs r0, 0xC0
	lsls r0, 1
	bl AllocZeroed
	mov r9, r0
	ldr r0, _0813A4C0 @ =gUnknown_8E9B4B8
	mov r1, r9
	bl LZ77UnCompWram
	ldr r5, _0813A4C4 @ =gMonSummaryScreen
	ldr r0, [r5]
	ldr r4, _0813A4C8 @ =0x00003290
	adds r0, r4
	movs r1, 0x39
	bl GetMonData
	adds r6, r0, 0
	ldr r0, [r5]
	adds r0, r4
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsrs r0, r1, 2
	cmp r0, r6
	bls _0813A4CC
	movs r1, 0x2
	str r1, [sp, 0x38]
	b _0813A4D6
	.align 2, 0
_0813A4BC: .4byte gUnknown_203B15C
_0813A4C0: .4byte gUnknown_8E9B4B8
_0813A4C4: .4byte gMonSummaryScreen
_0813A4C8: .4byte 0x00003290
_0813A4CC:
	lsrs r0, r1, 1
	cmp r0, r6
	bls _0813A4D6
	movs r2, 0x1
	str r2, [sp, 0x38]
_0813A4D6:
	mov r3, r9
	cmp r3, 0
	beq _0813A540
	str r3, [sp, 0x18]
	movs r2, 0xC0
	lsls r2, 1
	add r0, sp, 0x18
	mov r6, r10
	lsls r1, r6, 16
	orrs r1, r2
	str r1, [r0, 0x4]
	ldr r3, _0813A600 @ =gUnknown_8463FFC
	ldr r1, [r3]
	str r1, [sp, 0x20]
	ldr r6, _0813A604 @ =0xffff0000
	add r1, sp, 0x20
	mov r8, r1
	ldr r1, [r1, 0x4]
	ands r1, r6
	orrs r1, r7
	mov r2, r8
	str r1, [r2, 0x4]
	ldr r1, [r3, 0x4]
	str r1, [sp, 0x28]
	adds r2, r7, 0x1
	lsls r2, 16
	lsrs r2, 16
	add r5, sp, 0x28
	ldr r1, [r5, 0x4]
	ands r1, r6
	orrs r1, r2
	str r1, [r5, 0x4]
	ldr r1, [r3, 0x8]
	str r1, [sp, 0x30]
	adds r2, r7, 0x2
	lsls r2, 16
	lsrs r2, 16
	add r4, sp, 0x30
	ldr r1, [r4, 0x4]
	ands r1, r6
	orrs r1, r2
	str r1, [r4, 0x4]
	bl LoadSpriteSheet
	mov r0, r8
	bl LoadSpritePalette
	adds r0, r5, 0
	bl LoadSpritePalette
	adds r0, r4, 0
	bl LoadSpritePalette
_0813A540:
	movs r4, 0
	ldr r3, [sp, 0x38]
	adds r3, r7, r3
	str r3, [sp, 0x3C]
	mov r8, r4
	ldr r5, _0813A608 @ =gUnknown_203B15C
_0813A54C:
	mov r0, sp
	mov r6, r10
	strh r6, [r0]
	ldrh r1, [r0, 0x3C]
	strh r1, [r0, 0x2]
	ldr r0, _0813A60C @ =gUnknown_8463A14
	str r0, [sp, 0x4]
	ldr r0, _0813A610 @ =gUnknown_8463A7C
	str r0, [sp, 0x8]
	mov r2, r8
	str r2, [sp, 0xC]
	ldr r0, _0813A614 @ =gDummySpriteAffineAnimTable
	str r0, [sp, 0x10]
	ldr r0, _0813A618 @ =SpriteCallbackDummy
	str r0, [sp, 0x14]
	ldr r1, [r5]
	lsls r0, r4, 1
	adds r1, 0x28
	adds r1, r0
	lsls r0, r4, 3
	adds r0, 0xAC
	strh r0, [r1]
	movs r3, 0
	ldrsh r1, [r1, r3]
	mov r0, sp
	movs r2, 0x24
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [r5]
	lsls r3, r4, 2
	adds r2, r3
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0813A61C @ =gSprites
	adds r1, r0
	str r1, [r2]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r6, 0x5
	negs r6, r6
	adds r2, r6, 0
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r3
	ldr r2, [r0]
	ldrb r1, [r2, 0x5]
	subs r6, 0x8
	adds r0, r6, 0
	ands r1, r0
	movs r0, 0x8
	orrs r1, r0
	strb r1, [r2, 0x5]
	ldr r0, [r5]
	mov r1, r10
	strh r1, [r0, 0x3C]
	strh r7, [r0, 0x3E]
	adds r0, r3
	ldr r0, [r0]
	movs r1, 0x8
	bl StartSpriteAnim
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x8
	bls _0813A54C
	bl sub_813A620
	movs r0, 0x1
	bl sub_813A838
	mov r2, r9
	cmp r2, 0
	beq _0813A5F0
	mov r0, r9
	bl Free
_0813A5F0:
	add sp, 0x40
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813A600: .4byte gUnknown_8463FFC
_0813A604: .4byte 0xffff0000
_0813A608: .4byte gUnknown_203B15C
_0813A60C: .4byte gUnknown_8463A14
_0813A610: .4byte gUnknown_8463A7C
_0813A614: .4byte gDummySpriteAffineAnimTable
_0813A618: .4byte SpriteCallbackDummy
_0813A61C: .4byte gSprites
	thumb_func_end sub_813A45C

	thumb_func_start sub_813A620
sub_813A620: @ 813A620
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	mov r10, r0
	ldr r5, _0813A688 @ =gMonSummaryScreen
	ldr r1, [r5]
	movs r2, 0xC8
	lsls r2, 6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0813A642
	b _0813A7EA
_0813A642:
	ldr r4, _0813A68C @ =0x00003290
	adds r0, r1, r4
	movs r1, 0x39
	bl GetMonData
	mov r9, r0
	ldr r0, [r5]
	adds r0, r4
	movs r1, 0x3A
	bl GetMonData
	adds r4, r0, 0
	movs r1, 0x5
	bl __udivsi3
	cmp r0, r9
	bcs _0813A666
	lsrs r0, r4, 1
_0813A666:
	mov r3, r9
	lsls r0, r3, 16
	asrs r0, 16
	lsls r1, r4, 16
	asrs r1, 16
	bl GetHPBarLevel
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _0813A690
	cmp r0, 0x2
	bgt _0813A684
	cmp r0, 0x1
	beq _0813A694
_0813A684:
	movs r6, 0
	b _0813A696
	.align 2, 0
_0813A688: .4byte gMonSummaryScreen
_0813A68C: .4byte 0x00003290
_0813A690:
	movs r6, 0x1
	b _0813A696
_0813A694:
	movs r6, 0x2
_0813A696:
	movs r0, 0
	mov r8, r0
_0813A69A:
	movs r0, 0x78
	bl IndexOfSpritePaletteTag
	ldr r5, _0813A6FC @ =gUnknown_203B15C
	ldr r1, [r5]
	mov r3, r8
	lsls r2, r3, 2
	adds r1, r2
	ldr r3, [r1]
	lsls r0, 24
	lsrs r0, 24
	adds r0, r6
	lsls r0, 4
	ldrb r2, [r3, 0x5]
	movs r1, 0xF
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x5]
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x8
	bls _0813A69A
	cmp r9, r4
	bne _0813A700
	movs r0, 0x2
	mov r8, r0
	cmp r0, 0x7
	bls _0813A6DA
	b _0813A7CA
_0813A6DA:
	adds r4, r5, 0
_0813A6DC:
	ldr r0, [r4]
	mov r2, r8
	lsls r1, r2, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x8
	bl StartSpriteAnim
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x7
	bls _0813A6DC
	b _0813A7CA
	.align 2, 0
_0813A6FC: .4byte gUnknown_203B15C
_0813A700:
	lsls r0, r4, 2
	movs r1, 0x6
	bl __udivsi3
	adds r6, r0, 0
	movs r7, 0
	mov r3, r9
	lsls r0, r3, 2
	adds r4, r0, 0
	movs r5, 0
	b _0813A724
_0813A716:
	subs r4, r6
	sbcs r5, r7
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
_0813A724:
	cmp r5, r7
	bgt _0813A716
	cmp r5, r7
	bne _0813A730
	cmp r4, r6
	bhi _0813A716
_0813A730:
	mov r0, r10
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	movs r0, 0x2
	mov r8, r0
	lsrs r1, r4, 31
	str r1, [sp, 0x4]
	lsls r2, r5, 1
	str r2, [sp]
	cmp r8, r10
	bcs _0813A76E
	ldr r3, _0813A7A8 @ =gUnknown_203B15C
	mov r9, r3
_0813A74E:
	mov r1, r9
	ldr r0, [r1]
	mov r2, r8
	lsls r1, r2, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x8
	bl StartSpriteAnim
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r8, r10
	bcc _0813A74E
_0813A76E:
	ldr r3, [sp, 0x4]
	ldr r0, [sp]
	orrs r3, r0
	lsls r2, r4, 1
	adds r2, r4
	adcs r3, r5
	lsrs r5, r2, 31
	lsls r4, r3, 1
	adds r1, r5, 0
	orrs r1, r4
	lsls r0, r2, 1
	adds r3, r7, 0
	adds r2, r6, 0
	bl __divdi3
	adds r2, r1, 0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r4, _0813A7A8 @ =gUnknown_203B15C
	ldr r0, [r4]
	mov r2, r10
	lsls r3, r2, 2
	adds r0, r3
	ldr r0, [r0]
	bl StartSpriteAnim
	mov r0, r10
	b _0813A7BE
	.align 2, 0
_0813A7A8: .4byte gUnknown_203B15C
_0813A7AC:
	ldr r0, [r4]
	mov r3, r8
	lsls r1, r3, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
	mov r0, r8
_0813A7BE:
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x7
	bls _0813A7AC
_0813A7CA:
	ldr r4, _0813A7FC @ =gUnknown_203B15C
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, 0x9
	bl StartSpriteAnim
	ldr r0, [r4]
	ldr r0, [r0, 0x4]
	movs r1, 0xA
	bl StartSpriteAnim
	ldr r0, [r4]
	ldr r0, [r0, 0x20]
	movs r1, 0xB
	bl StartSpriteAnim
_0813A7EA:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813A7FC: .4byte gUnknown_203B15C
	thumb_func_end sub_813A620

	thumb_func_start sub_813A800
sub_813A800: @ 813A800
	push {r4,r5,lr}
	movs r4, 0
_0813A804:
	ldr r5, _0813A834 @ =gUnknown_203B15C
	ldr r0, [r5]
	lsls r1, r4, 2
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _0813A816
	bl DestroySpriteAndFreeResources
_0813A816:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x8
	bls _0813A804
	ldr r0, [r5]
	cmp r0, 0
	beq _0813A82E
	bl Free
	movs r0, 0
	str r0, [r5]
_0813A82E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813A834: .4byte gUnknown_203B15C
	thumb_func_end sub_813A800

	thumb_func_start sub_813A838
sub_813A838: @ 813A838
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	ldr r6, _0813A870 @ =gUnknown_203B15C
	movs r1, 0x1
	ands r0, r1
	lsls r4, r0, 2
	movs r5, 0x5
	negs r5, r5
_0813A84C:
	ldr r0, [r6]
	lsls r1, r3, 2
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x8
	bls _0813A84C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813A870: .4byte gUnknown_203B15C
	thumb_func_end sub_813A838

	thumb_func_start sub_813A874
sub_813A874: @ 813A874
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x28
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r0, _0813A970 @ =gUnknown_203B160
	mov r8, r0
	movs r0, 0x48
	bl AllocZeroed
	mov r1, r8
	str r0, [r1]
	movs r4, 0xC0
	lsls r4, 1
	adds r0, r4, 0
	bl AllocZeroed
	adds r5, r0, 0
	ldr r0, _0813A974 @ =gUnknown_8E9B3F0
	adds r1, r5, 0
	bl LZ77UnCompWram
	cmp r5, 0
	beq _0813A8D0
	str r5, [sp, 0x18]
	add r0, sp, 0x18
	lsls r1, r7, 16
	orrs r1, r4
	str r1, [r0, 0x4]
	ldr r1, _0813A978 @ =gUnknown_8E9B578
	str r1, [sp, 0x20]
	ldr r2, _0813A97C @ =0xffff0000
	add r4, sp, 0x20
	ldr r1, [r4, 0x4]
	ands r1, r2
	orrs r1, r6
	str r1, [r4, 0x4]
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl LoadSpritePalette
_0813A8D0:
	movs r4, 0
	mov r9, r4
_0813A8D4:
	mov r0, sp
	strh r7, [r0]
	strh r6, [r0, 0x2]
	ldr r0, _0813A980 @ =gUnknown_8463A14
	str r0, [sp, 0x4]
	ldr r0, _0813A984 @ =gUnknown_8463A7C
	str r0, [sp, 0x8]
	mov r3, r9
	str r3, [sp, 0xC]
	ldr r0, _0813A988 @ =gDummySpriteAffineAnimTable
	str r0, [sp, 0x10]
	ldr r0, _0813A98C @ =SpriteCallbackDummy
	str r0, [sp, 0x14]
	mov r0, r8
	ldr r1, [r0]
	lsls r0, r4, 1
	adds r1, 0x2C
	adds r1, r0
	lsls r0, r4, 3
	adds r0, 0x9C
	strh r0, [r1]
	movs r3, 0
	ldrsh r1, [r1, r3]
	mov r0, sp
	movs r2, 0x84
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r4, 2
	adds r2, r1
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0813A990 @ =gSprites
	adds r1, r0
	str r1, [r2]
	ldrb r2, [r1, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r0, r3, 0
	ands r2, r0
	movs r0, 0x8
	orrs r2, r0
	strb r2, [r1, 0x5]
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, 0
	adds r1, 0x42
	strh r7, [r1]
	adds r0, 0x44
	strh r6, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xA
	bls _0813A8D4
	bl sub_813A994
	movs r0, 0x1
	bl sub_813AB70
	cmp r5, 0
	beq _0813A960
	adds r0, r5, 0
	bl Free
_0813A960:
	add sp, 0x28
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813A970: .4byte gUnknown_203B160
_0813A974: .4byte gUnknown_8E9B3F0
_0813A978: .4byte gUnknown_8E9B578
_0813A97C: .4byte 0xffff0000
_0813A980: .4byte gUnknown_8463A14
_0813A984: .4byte gUnknown_8463A7C
_0813A988: .4byte gDummySpriteAffineAnimTable
_0813A98C: .4byte SpriteCallbackDummy
_0813A990: .4byte gSprites
	thumb_func_end sub_813A874

	thumb_func_start sub_813A994
sub_813A994: @ 813A994
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r7, 0
	ldr r6, _0813AAD4 @ =gMonSummaryScreen
	ldr r1, [r6]
	movs r2, 0xC8
	lsls r2, 6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0813A9B4
	b _0813AB24
_0813A9B4:
	ldr r4, _0813AAD8 @ =0x00003290
	adds r0, r1, r4
	movs r1, 0x19
	bl GetMonData
	mov r8, r0
	ldr r0, [r6]
	adds r0, r4
	movs r1, 0x38
	bl GetMonData
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, [r6]
	adds r0, r4
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r5, 0x63
	bls _0813A9E2
	b _0813AAE8
_0813A9E2:
	ldr r3, _0813AADC @ =gExperienceTables
	adds r1, r5, 0x1
	lsls r1, 2
	ldr r2, _0813AAE0 @ =gBaseStats
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r2, r0
	adds r1, r2
	adds r1, r3
	lsls r0, r5, 2
	adds r0, r2
	adds r0, r3
	ldr r1, [r1]
	ldr r0, [r0]
	subs r1, r0
	mov r10, r1
	mov r1, r8
	subs r1, r0
	mov r9, r1
	mov r2, r10
	lsls r0, r2, 2
	lsrs r0, 3
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r0, r1, 2
	adds r4, r0, 0
	movs r5, 0
	ldr r1, [sp, 0x4]
	cmp r5, r1
	ble _0813AA3E
_0813AA2A:
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	subs r4, r0
	sbcs r5, r1
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r5, r1
	bgt _0813AA2A
	ldr r1, [sp, 0x4]
_0813AA3E:
	cmp r5, r1
	bne _0813AA48
	ldr r2, [sp]
	cmp r4, r2
	bhi _0813AA2A
_0813AA48:
	adds r0, r7, 0x2
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0x2
	cmp r6, r7
	bcs _0813AA72
	ldr r0, _0813AAE4 @ =gUnknown_203B160
	mov r8, r0
_0813AA58:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x8
	bl StartSpriteAnim
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r7
	bcc _0813AA58
_0813AA72:
	cmp r7, 0x9
	bls _0813AA86
	cmp r10, r9
	beq _0813AB24
	ldr r0, _0813AAE4 @ =gUnknown_203B160
	ldr r0, [r0]
	ldr r0, [r0, 0x24]
	movs r1, 0x7
	bl StartSpriteAnim
_0813AA86:
	lsrs r3, r4, 29
	lsls r2, r5, 3
	adds r1, r3, 0
	orrs r1, r2
	lsls r0, r4, 3
	ldr r2, [sp]
	ldr r3, [sp, 0x4]
	bl __divdi3
	adds r2, r1, 0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r4, _0813AAE4 @ =gUnknown_203B160
	ldr r0, [r4]
	lsls r3, r7, 2
	adds r0, r3
	ldr r0, [r0]
	bl StartSpriteAnim
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x9
	bhi _0813AB04
_0813AAB8:
	ldr r0, [r4]
	lsls r1, r6, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x9
	bls _0813AAB8
	b _0813AB04
	.align 2, 0
_0813AAD4: .4byte gMonSummaryScreen
_0813AAD8: .4byte 0x00003290
_0813AADC: .4byte gExperienceTables
_0813AAE0: .4byte gBaseStats
_0813AAE4: .4byte gUnknown_203B160
_0813AAE8:
	movs r6, 0x2
	ldr r4, _0813AB34 @ =gUnknown_203B160
_0813AAEC:
	ldr r0, [r4]
	lsls r1, r6, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x9
	bls _0813AAEC
_0813AB04:
	ldr r4, _0813AB34 @ =gUnknown_203B160
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, 0x9
	bl StartSpriteAnim
	ldr r0, [r4]
	ldr r0, [r0, 0x4]
	movs r1, 0xA
	bl StartSpriteAnim
	ldr r0, [r4]
	ldr r0, [r0, 0x28]
	movs r1, 0xB
	bl StartSpriteAnim
_0813AB24:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813AB34: .4byte gUnknown_203B160
	thumb_func_end sub_813A994

	thumb_func_start sub_813AB38
sub_813AB38: @ 813AB38
	push {r4,r5,lr}
	movs r4, 0
_0813AB3C:
	ldr r5, _0813AB6C @ =gUnknown_203B160
	ldr r0, [r5]
	lsls r1, r4, 2
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _0813AB4E
	bl DestroySpriteAndFreeResources
_0813AB4E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xA
	bls _0813AB3C
	ldr r0, [r5]
	cmp r0, 0
	beq _0813AB66
	bl Free
	movs r0, 0
	str r0, [r5]
_0813AB66:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813AB6C: .4byte gUnknown_203B160
	thumb_func_end sub_813AB38

	thumb_func_start sub_813AB70
sub_813AB70: @ 813AB70
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	ldr r6, _0813ABA8 @ =gUnknown_203B160
	movs r1, 0x1
	ands r0, r1
	lsls r4, r0, 2
	movs r5, 0x5
	negs r5, r5
_0813AB84:
	ldr r0, [r6]
	lsls r1, r3, 2
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xA
	bls _0813AB84
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813ABA8: .4byte gUnknown_203B160
	thumb_func_end sub_813AB70

	thumb_func_start sub_813ABAC
sub_813ABAC: @ 813ABAC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x28
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r0, _0813AC68 @ =gUnknown_203B164
	mov r8, r0
	movs r0, 0x8
	bl AllocZeroed
	mov r1, r8
	str r0, [r1]
	movs r0, 0x20
	bl AllocZeroed
	adds r5, r0, 0
	ldr r0, _0813AC6C @ =gUnknown_8463B20
	adds r1, r5, 0
	bl LZ77UnCompWram
	mov r1, r8
	ldr r0, [r1]
	cmp r0, 0
	beq _0813AC46
	str r5, [sp, 0x18]
	movs r2, 0x20
	add r0, sp, 0x18
	lsls r1, r7, 16
	orrs r1, r2
	str r1, [r0, 0x4]
	ldr r1, _0813AC70 @ =gUnknown_8463B00
	str r1, [sp, 0x20]
	ldr r2, _0813AC74 @ =0xffff0000
	add r4, sp, 0x20
	ldr r1, [r4, 0x4]
	ands r1, r2
	orrs r1, r6
	str r1, [r4, 0x4]
	mov r1, sp
	movs r2, 0
	strh r7, [r1]
	strh r6, [r1, 0x2]
	ldr r1, _0813AC78 @ =gUnknown_8463AEC
	str r1, [sp, 0x4]
	ldr r1, _0813AC7C @ =gUnknown_8463AFC
	str r1, [sp, 0x8]
	str r2, [sp, 0xC]
	ldr r1, _0813AC80 @ =gDummySpriteAffineAnimTable
	str r1, [sp, 0x10]
	ldr r1, _0813AC84 @ =SpriteCallbackDummy
	str r1, [sp, 0x14]
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl LoadSpritePalette
	mov r0, sp
	movs r1, 0x72
	movs r2, 0x5C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0813AC88 @ =gSprites
	adds r1, r0
	str r1, [r2]
	strh r7, [r2, 0x4]
	strh r6, [r2, 0x6]
_0813AC46:
	movs r0, 0x1
	bl sub_813ACF8
	bl sub_813ACB4
	cmp r5, 0
	beq _0813AC5A
	adds r0, r5, 0
	bl Free
_0813AC5A:
	add sp, 0x28
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813AC68: .4byte gUnknown_203B164
_0813AC6C: .4byte gUnknown_8463B20
_0813AC70: .4byte gUnknown_8463B00
_0813AC74: .4byte 0xffff0000
_0813AC78: .4byte gUnknown_8463AEC
_0813AC7C: .4byte gUnknown_8463AFC
_0813AC80: .4byte gDummySpriteAffineAnimTable
_0813AC84: .4byte SpriteCallbackDummy
_0813AC88: .4byte gSprites
	thumb_func_end sub_813ABAC

	thumb_func_start sub_813AC8C
sub_813AC8C: @ 813AC8C
	push {r4,lr}
	ldr r4, _0813ACB0 @ =gUnknown_203B164
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, 0
	beq _0813AC9C
	bl DestroySpriteAndFreeResources
_0813AC9C:
	ldr r0, [r4]
	cmp r0, 0
	beq _0813ACAA
	bl Free
	movs r0, 0
	str r0, [r4]
_0813ACAA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813ACB0: .4byte gUnknown_203B164
	thumb_func_end sub_813AC8C

	thumb_func_start sub_813ACB4
sub_813ACB4: @ 813ACB4
	push {r4,lr}
	ldr r4, _0813ACE4 @ =gMonSummaryScreen
	ldr r0, [r4]
	ldr r1, _0813ACE8 @ =0x00003290
	adds r0, r1
	movs r1, 0
	bl CheckPartyPokerus
	lsls r0, 24
	cmp r0, 0
	bne _0813ACEC
	ldr r0, [r4]
	ldr r1, _0813ACE8 @ =0x00003290
	adds r0, r1
	movs r1, 0
	bl CheckPartyHasHadPokerus
	lsls r0, 24
	cmp r0, 0
	beq _0813ACEC
	movs r0, 0
	bl sub_813ACF8
	b _0813ACF2
	.align 2, 0
_0813ACE4: .4byte gMonSummaryScreen
_0813ACE8: .4byte 0x00003290
_0813ACEC:
	movs r0, 0x1
	bl sub_813ACF8
_0813ACF2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813ACB4

	thumb_func_start sub_813ACF8
sub_813ACF8: @ 813ACF8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0813AD44 @ =gMonSummaryScreen
	ldr r0, [r4]
	ldr r1, _0813AD48 @ =0x00003290
	adds r0, r1
	movs r1, 0
	bl CheckPartyPokerus
	lsls r0, 24
	cmp r0, 0
	bne _0813AD50
	ldr r0, [r4]
	ldr r1, _0813AD48 @ =0x00003290
	adds r0, r1
	movs r1, 0
	bl CheckPartyHasHadPokerus
	lsls r0, 24
	cmp r0, 0
	beq _0813AD50
	ldr r0, _0813AD4C @ =gUnknown_203B164
	ldr r0, [r0]
	ldr r2, [r0]
	adds r2, 0x3E
	movs r0, 0x1
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	b _0813ADA2
	.align 2, 0
_0813AD44: .4byte gMonSummaryScreen
_0813AD48: .4byte 0x00003290
_0813AD4C: .4byte gUnknown_203B164
_0813AD50:
	ldr r2, _0813AD88 @ =gUnknown_203B164
	ldr r0, [r2]
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1]
	ldr r0, _0813AD8C @ =gMonSummaryScreen
	ldr r0, [r0]
	ldr r1, _0813AD90 @ =0x00003214
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _0813AD94
	ldr r0, [r2]
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r2, [r2]
	ldr r1, [r2]
	movs r0, 0x10
	strh r0, [r1, 0x20]
	ldr r1, [r2]
	movs r0, 0x2C
	b _0813ADA0
	.align 2, 0
_0813AD88: .4byte gUnknown_203B164
_0813AD8C: .4byte gMonSummaryScreen
_0813AD90: .4byte 0x00003214
_0813AD94:
	ldr r2, [r2]
	ldr r1, [r2]
	movs r0, 0x72
	strh r0, [r1, 0x20]
	ldr r1, [r2]
	movs r0, 0x5C
_0813ADA0:
	strh r0, [r1, 0x22]
_0813ADA2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813ACF8

	thumb_func_start sub_813ADA8
sub_813ADA8: @ 813ADA8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x28
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r0, _0813AE64 @ =gUnknown_203B168
	mov r8, r0
	movs r0, 0x8
	bl AllocZeroed
	mov r1, r8
	str r0, [r1]
	movs r0, 0x40
	bl AllocZeroed
	adds r5, r0, 0
	ldr r0, _0813AE68 @ =gUnknown_8463B64
	adds r1, r5, 0
	bl LZ77UnCompWram
	mov r1, r8
	ldr r0, [r1]
	cmp r0, 0
	beq _0813AE42
	str r5, [sp, 0x18]
	movs r2, 0x40
	add r0, sp, 0x18
	lsls r1, r7, 16
	orrs r1, r2
	str r1, [r0, 0x4]
	ldr r1, _0813AE6C @ =gUnknown_8463B44
	str r1, [sp, 0x20]
	ldr r2, _0813AE70 @ =0xffff0000
	add r4, sp, 0x20
	ldr r1, [r4, 0x4]
	ands r1, r2
	orrs r1, r6
	str r1, [r4, 0x4]
	mov r1, sp
	movs r2, 0
	strh r7, [r1]
	strh r6, [r1, 0x2]
	ldr r1, _0813AE74 @ =gUnknown_8463B30
	str r1, [sp, 0x4]
	ldr r1, _0813AE78 @ =gUnknown_8463B40
	str r1, [sp, 0x8]
	str r2, [sp, 0xC]
	ldr r1, _0813AE7C @ =gDummySpriteAffineAnimTable
	str r1, [sp, 0x10]
	ldr r1, _0813AE80 @ =SpriteCallbackDummy
	str r1, [sp, 0x14]
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl LoadSpritePalette
	mov r0, sp
	movs r1, 0x6A
	movs r2, 0x28
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0813AE84 @ =gSprites
	adds r1, r0
	str r1, [r2]
	strh r7, [r2, 0x4]
	strh r6, [r2, 0x6]
_0813AE42:
	movs r0, 0x1
	bl sub_813AEB0
	bl sub_813AF50
	cmp r5, 0
	beq _0813AE56
	adds r0, r5, 0
	bl Free
_0813AE56:
	add sp, 0x28
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813AE64: .4byte gUnknown_203B168
_0813AE68: .4byte gUnknown_8463B64
_0813AE6C: .4byte gUnknown_8463B44
_0813AE70: .4byte 0xffff0000
_0813AE74: .4byte gUnknown_8463B30
_0813AE78: .4byte gUnknown_8463B40
_0813AE7C: .4byte gDummySpriteAffineAnimTable
_0813AE80: .4byte SpriteCallbackDummy
_0813AE84: .4byte gSprites
	thumb_func_end sub_813ADA8

	thumb_func_start sub_813AE88
sub_813AE88: @ 813AE88
	push {r4,lr}
	ldr r4, _0813AEAC @ =gUnknown_203B168
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, 0
	beq _0813AE98
	bl DestroySpriteAndFreeResources
_0813AE98:
	ldr r0, [r4]
	cmp r0, 0
	beq _0813AEA6
	bl Free
	movs r0, 0
	str r0, [r4]
_0813AEA6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813AEAC: .4byte gUnknown_203B168
	thumb_func_end sub_813AE88

	thumb_func_start sub_813AEB0
sub_813AEB0: @ 813AEB0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0813AEF8 @ =gMonSummaryScreen
	ldr r0, [r4]
	ldr r1, _0813AEFC @ =0x00003290
	adds r0, r1
	bl IsMonShiny
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813AF04
	ldr r0, [r4]
	movs r1, 0xC8
	lsls r1, 6
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0813AF04
	ldr r4, _0813AF00 @ =gUnknown_203B168
	ldr r0, [r4]
	ldr r2, [r0]
	adds r2, 0x3E
	movs r0, 0x1
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	adds r3, r4, 0
	b _0813AF14
	.align 2, 0
_0813AEF8: .4byte gMonSummaryScreen
_0813AEFC: .4byte 0x00003290
_0813AF00: .4byte gUnknown_203B168
_0813AF04:
	ldr r3, _0813AF30 @ =gUnknown_203B168
	ldr r0, [r3]
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
_0813AF14:
	ldr r0, _0813AF34 @ =gMonSummaryScreen
	ldr r0, [r0]
	ldr r1, _0813AF38 @ =0x00003214
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _0813AF3C
	ldr r2, [r3]
	ldr r1, [r2]
	movs r0, 0x8
	strh r0, [r1, 0x20]
	ldr r1, [r2]
	movs r0, 0x18
	b _0813AF48
	.align 2, 0
_0813AF30: .4byte gUnknown_203B168
_0813AF34: .4byte gMonSummaryScreen
_0813AF38: .4byte 0x00003214
_0813AF3C:
	ldr r2, [r3]
	ldr r1, [r2]
	movs r0, 0x6A
	strh r0, [r1, 0x20]
	ldr r1, [r2]
	movs r0, 0x28
_0813AF48:
	strh r0, [r1, 0x22]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813AEB0

	thumb_func_start sub_813AF50
sub_813AF50: @ 813AF50
	push {r4,lr}
	ldr r4, _0813AF7C @ =gMonSummaryScreen
	ldr r0, [r4]
	ldr r1, _0813AF80 @ =0x00003290
	adds r0, r1
	bl IsMonShiny
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813AF84
	ldr r0, [r4]
	movs r1, 0xC8
	lsls r1, 6
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0813AF84
	movs r0, 0
	bl sub_813AEB0
	b _0813AF8A
	.align 2, 0
_0813AF7C: .4byte gMonSummaryScreen
_0813AF80: .4byte 0x00003290
_0813AF84:
	movs r0, 0x1
	bl sub_813AEB0
_0813AF8A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813AF50

	thumb_func_start sub_813AF90
sub_813AF90: @ 813AF90
	push {lr}
	bl sub_813A21C
	bl sub_813A800
	bl sub_813AB38
	bl sub_8139C80
	bl sub_8139F20
	bl sub_8139D90
	bl sub_813B068
	bl sub_813A334
	bl sub_813AC8C
	bl sub_813AE88
	bl ResetSpriteData
	pop {r0}
	bx r0
	thumb_func_end sub_813AF90

	thumb_func_start sub_813AFC4
sub_813AFC4: @ 813AFC4
	push {lr}
	bl sub_8139CB0
	movs r0, 0
	bl sub_8139D54
	bl sub_8139DBC
	bl sub_813995C
	movs r0, 0
	bl sub_8139C44
	bl sub_813A620
	bl sub_813A994
	bl sub_813B0E4
	bl sub_813A35C
	bl sub_813ACB4
	bl sub_813AF50
	pop {r0}
	bx r0
	thumb_func_end sub_813AFC4

	thumb_func_start sub_813AFFC
sub_813AFFC: @ 813AFFC
	push {r4-r6,lr}
	ldr r5, _0813B058 @ =gMonSummaryScreen
	ldr r0, [r5]
	ldr r1, _0813B05C @ =0x00003290
	adds r0, r1
	movs r1, 0x8
	bl GetMonData
	adds r6, r0, 0
	ldr r0, [r5]
	ldr r4, _0813B060 @ =0x000032fc
	adds r0, r4
	ldr r0, [r0]
	bl DestroySpriteAndFreeResources
	ldr r2, _0813B064 @ =gUnknown_84636E0
	movs r0, 0x8C
	movs r1, 0x8C
	bl CreateMonMarkingSprite_SelectCombo
	adds r2, r0, 0
	ldr r0, [r5]
	adds r0, r4
	str r2, [r0]
	cmp r2, 0
	beq _0813B04A
	lsls r1, r6, 24
	lsrs r1, 24
	adds r0, r2, 0
	bl StartSpriteAnim
	ldr r0, [r5]
	adds r0, r4
	ldr r2, [r0]
	movs r1, 0x14
	strh r1, [r2, 0x20]
	ldr r1, [r0]
	movs r0, 0x5B
	strh r0, [r1, 0x22]
_0813B04A:
	movs r0, 0x1
	bl sub_813B084
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813B058: .4byte gMonSummaryScreen
_0813B05C: .4byte 0x00003290
_0813B060: .4byte 0x000032fc
_0813B064: .4byte gUnknown_84636E0
	thumb_func_end sub_813AFFC

	thumb_func_start sub_813B068
sub_813B068: @ 813B068
	push {lr}
	ldr r0, _0813B07C @ =gMonSummaryScreen
	ldr r0, [r0]
	ldr r1, _0813B080 @ =0x000032fc
	adds r0, r1
	ldr r0, [r0]
	bl DestroySpriteAndFreeResources
	pop {r0}
	bx r0
	.align 2, 0
_0813B07C: .4byte gMonSummaryScreen
_0813B080: .4byte 0x000032fc
	thumb_func_end sub_813B068

	thumb_func_start sub_813B084
sub_813B084: @ 813B084
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0813B0B0 @ =gMonSummaryScreen
	ldr r0, [r4]
	ldr r1, _0813B0B4 @ =0x00003290
	adds r0, r1
	movs r1, 0x8
	bl GetMonData
	cmp r0, 0
	bne _0813B0BC
	ldr r0, [r4]
	ldr r1, _0813B0B8 @ =0x000032fc
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	b _0813B0DA
	.align 2, 0
_0813B0B0: .4byte gMonSummaryScreen
_0813B0B4: .4byte 0x00003290
_0813B0B8: .4byte 0x000032fc
_0813B0BC:
	ldr r0, [r4]
	ldr r1, _0813B0E0 @ =0x000032fc
	adds r0, r1
	ldr r2, [r0]
	adds r2, 0x3E
	movs r0, 0x1
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_0813B0DA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813B0E0: .4byte 0x000032fc
	thumb_func_end sub_813B084

	thumb_func_start sub_813B0E4
sub_813B0E4: @ 813B0E4
	push {r4,lr}
	ldr r4, _0813B114 @ =gMonSummaryScreen
	ldr r0, [r4]
	ldr r1, _0813B118 @ =0x00003290
	adds r0, r1
	movs r1, 0x8
	bl GetMonData
	adds r1, r0, 0
	ldr r0, [r4]
	ldr r2, _0813B11C @ =0x000032fc
	adds r0, r2
	ldr r0, [r0]
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	movs r0, 0
	bl sub_813B084
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B114: .4byte gMonSummaryScreen
_0813B118: .4byte 0x00003290
_0813B11C: .4byte 0x000032fc
	thumb_func_end sub_813B0E4

	thumb_func_start sub_813B120
sub_813B120: @ 813B120
	push {r4-r6,lr}
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r1, _0813B154 @ =gMonSummaryScreen
	ldr r2, [r1]
	ldr r3, _0813B158 @ =0x0000321c
	adds r0, r2, r3
	ldrb r3, [r0]
	adds r6, r1, 0
	cmp r3, 0x1
	bne _0813B198
	ldr r1, _0813B15C @ =0x00003214
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0813B160
	lsls r1, r5, 24
	asrs r1, 24
	movs r5, 0x2
	eors r1, r3
	negs r0, r1
	orrs r0, r1
	asrs r0, 31
	ands r5, r0
	b _0813B16C
	.align 2, 0
_0813B154: .4byte gMonSummaryScreen
_0813B158: .4byte 0x0000321c
_0813B15C: .4byte 0x00003214
_0813B160:
	lsls r0, r5, 24
	asrs r0, 24
	movs r5, 0x3
	cmp r0, 0x1
	bne _0813B16C
	movs r5, 0x1
_0813B16C:
	ldr r0, [r6]
	ldr r2, _0813B190 @ =0x000032f4
	adds r0, r2
	ldr r4, [r0]
	bl GetLastViewedMonIndex
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, [r6]
	ldr r3, _0813B194 @ =0x00003210
	adds r0, r3
	ldrb r2, [r0]
	adds r3, r5, 0
	adds r0, r4, 0
	bl SeekToNextMonInBox
	b _0813B1CC
	.align 2, 0
_0813B190: .4byte 0x000032f4
_0813B194: .4byte 0x00003210
_0813B198:
	bl IsUpdateLinkStateCBActive
	cmp r0, 0
	bne _0813B1C4
	ldr r0, _0813B1C0 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0813B1C4
	bl IsMultiBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813B1C4
	lsls r0, r5, 24
	asrs r0, 24
	bl sub_813B38C
	b _0813B1CC
	.align 2, 0
_0813B1C0: .4byte gReceivedRemoteLinkPlayers
_0813B1C4:
	lsls r0, r5, 24
	asrs r0, 24
	bl sub_813B20C
_0813B1CC:
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _0813B1F4
	ldr r0, _0813B1FC @ =gLastViewedMonIndex
	strb r2, [r0]
	ldr r0, _0813B200 @ =sub_813B3F0
	movs r1, 0
	bl CreateTask
	ldr r0, _0813B204 @ =gMonSummaryScreen
	ldr r0, [r0]
	ldr r1, _0813B208 @ =0x0000328c
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0813B1F4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813B1FC: .4byte gLastViewedMonIndex
_0813B200: .4byte sub_813B3F0
_0813B204: .4byte gMonSummaryScreen
_0813B208: .4byte 0x0000328c
	thumb_func_end sub_813B120

	thumb_func_start sub_813B20C
sub_813B20C: @ 813B20C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _0813B258 @ =gMonSummaryScreen
	ldr r0, [r2]
	ldr r3, _0813B25C @ =0x000032f4
	adds r1, r0, r3
	ldr r7, [r1]
	movs r6, 0
	ldr r1, _0813B260 @ =0x00003214
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0813B26C
	lsls r0, r4, 24
	asrs r3, r0, 24
	movs r1, 0x1
	negs r1, r1
	adds r5, r0, 0
	ldr r6, _0813B264 @ =gLastViewedMonIndex
	cmp r3, r1
	bne _0813B23E
	ldrb r0, [r6]
	cmp r0, 0
	beq _0813B294
_0813B23E:
	asrs r0, r5, 24
	cmp r0, 0x1
	bne _0813B252
	ldr r0, [r2]
	ldr r2, _0813B268 @ =0x00003210
	adds r0, r2
	ldrb r1, [r6]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _0813B294
_0813B252:
	ldrb r0, [r6]
	adds r0, r4
	b _0813B2BC
	.align 2, 0
_0813B258: .4byte gMonSummaryScreen
_0813B25C: .4byte 0x000032f4
_0813B260: .4byte 0x00003214
_0813B264: .4byte gLastViewedMonIndex
_0813B268: .4byte 0x00003210
_0813B26C:
	lsls r5, r4, 24
_0813B26E:
	lsls r0, r6, 24
	asrs r0, 24
	asrs r1, r5, 24
	adds r0, r1
	lsls r0, 24
	ldr r4, _0813B29C @ =gLastViewedMonIndex
	lsrs r6, r0, 24
	asrs r0, 24
	ldrb r3, [r4]
	adds r1, r0, r3
	cmp r1, 0
	blt _0813B294
	ldr r0, _0813B2A0 @ =gMonSummaryScreen
	ldr r0, [r0]
	ldr r2, _0813B2A4 @ =0x00003210
	adds r0, r2
	ldrb r0, [r0]
	cmp r1, r0
	ble _0813B2A8
_0813B294:
	movs r0, 0x1
	negs r0, r0
	b _0813B2C0
	.align 2, 0
_0813B29C: .4byte gLastViewedMonIndex
_0813B2A0: .4byte gMonSummaryScreen
_0813B2A4: .4byte 0x00003210
_0813B2A8:
	movs r0, 0x64
	muls r0, r1
	adds r0, r7, r0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0813B26E
	ldrb r0, [r4]
	adds r0, r6
_0813B2BC:
	lsls r0, 24
	asrs r0, 24
_0813B2C0:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_813B20C

	thumb_func_start sub_813B2C8
sub_813B2C8: @ 813B2C8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0813B2FC
	ldr r0, _0813B2F4 @ =gMonSummaryScreen
	ldr r0, [r0]
	ldr r1, _0813B2F8 @ =0x00003214
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0813B2F0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0813B2FC
_0813B2F0:
	movs r0, 0x1
	b _0813B2FE
	.align 2, 0
_0813B2F4: .4byte gMonSummaryScreen
_0813B2F8: .4byte 0x00003214
_0813B2FC:
	movs r0, 0
_0813B2FE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_813B2C8

	thumb_func_start sub_813B304
sub_813B304: @ 813B304
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
_0813B30A:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	beq _0813B33C
	ldr r0, _0813B334 @ =gUnknown_8463FB8
	adds r5, r4, r0
	ldrb r1, [r5]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0813B338 @ =gPlayerParty
	adds r0, r1
	bl sub_813B2C8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813B30A
	movs r0, 0
	ldrsb r0, [r5, r0]
	b _0813B340
	.align 2, 0
_0813B334: .4byte gUnknown_8463FB8
_0813B338: .4byte gPlayerParty
_0813B33C:
	movs r0, 0x1
	negs r0, r0
_0813B340:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_813B304

	thumb_func_start sub_813B348
sub_813B348: @ 813B348
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
_0813B34E:
	cmp r4, 0
	beq _0813B380
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813B378 @ =gUnknown_8463FB8
	adds r5, r4, r0
	ldrb r1, [r5]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0813B37C @ =gPlayerParty
	adds r0, r1
	bl sub_813B2C8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813B34E
	movs r0, 0
	ldrsb r0, [r5, r0]
	b _0813B384
	.align 2, 0
_0813B378: .4byte gUnknown_8463FB8
_0813B37C: .4byte gPlayerParty
_0813B380:
	movs r0, 0x1
	negs r0, r0
_0813B384:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_813B348

	thumb_func_start sub_813B38C
sub_813B38C: @ 813B38C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	movs r5, 0
	b _0813B39E
_0813B398:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0813B39E:
	cmp r5, 0x5
	bhi _0813B3B6
	ldr r4, _0813B3D4 @ =gUnknown_8463FB8
	adds r4, r5, r4
	bl GetLastViewedMonIndex
	ldrb r1, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	bne _0813B398
	adds r6, r5, 0
_0813B3B6:
	lsls r0, r7, 24
	asrs r1, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0813B3C6
	cmp r6, 0
	beq _0813B3CE
_0813B3C6:
	cmp r1, 0x1
	bne _0813B3D8
	cmp r6, 0x5
	bne _0813B3E0
_0813B3CE:
	movs r0, 0x1
	negs r0, r0
	b _0813B3EA
	.align 2, 0
_0813B3D4: .4byte gUnknown_8463FB8
_0813B3D8:
	adds r0, r6, 0
	bl sub_813B348
	b _0813B3E6
_0813B3E0:
	adds r0, r6, 0
	bl sub_813B304
_0813B3E6:
	lsls r0, 24
	asrs r0, 24
_0813B3EA:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_813B38C

	thumb_func_start sub_813B3F0
sub_813B3F0: @ 813B3F0
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _0813B414 @ =gMonSummaryScreen
	ldr r0, [r1]
	ldr r4, _0813B418 @ =0x0000328c
	adds r2, r0, r4
	ldrb r0, [r2]
	adds r5, r1, 0
	cmp r0, 0xB
	bls _0813B40A
	b _0813B73C
_0813B40A:
	lsls r0, 2
	ldr r1, _0813B41C @ =_0813B420
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813B414: .4byte gMonSummaryScreen
_0813B418: .4byte 0x0000328c
_0813B41C: .4byte _0813B420
	.align 2, 0
_0813B420:
	.4byte _0813B450
	.4byte _0813B478
	.4byte _0813B486
	.4byte _0813B4DC
	.4byte _0813B568
	.4byte _0813B5FC
	.4byte _0813B602
	.4byte _0813B620
	.4byte _0813B636
	.4byte _0813B654
	.4byte _0813B678
	.4byte _0813B70C
_0813B450:
	bl StopCryAndClearCrySongs
	ldr r0, _0813B468 @ =gUnknown_203B16D
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0813B46C @ =gUnknown_203B16E
	strb r1, [r0]
	ldr r0, _0813B470 @ =gMonSummaryScreen
	ldr r1, [r0]
	ldr r0, _0813B474 @ =0x0000328c
	adds r1, r0
	b _0813B72C
	.align 2, 0
_0813B468: .4byte gUnknown_203B16D
_0813B46C: .4byte gUnknown_203B16E
_0813B470: .4byte gMonSummaryScreen
_0813B474: .4byte 0x0000328c
_0813B478:
	bl sub_8139C80
	bl sub_8139F20
	bl sub_8139D90
	b _0813B724
_0813B486:
	ldr r0, [r5]
	ldr r4, _0813B4D0 @ =0x00003290
	adds r0, r4
	bl sub_8138B8C
	ldr r0, [r5]
	adds r0, r4
	movs r1, 0x2D
	bl GetMonData
	ldr r1, [r5]
	movs r2, 0xC8
	lsls r2, 6
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r4
	movs r1, 0x4
	bl GetMonData
	ldr r1, [r5]
	ldr r2, _0813B4D4 @ =0x00003204
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r2, r0, r2
	ldrb r1, [r2]
	cmp r1, 0x1
	bne _0813B4C6
	subs r4, 0x90
	adds r0, r4
	strb r1, [r0]
_0813B4C6:
	ldr r1, [r5]
	ldr r0, _0813B4D8 @ =0x0000328c
	adds r1, r0
	b _0813B72C
	.align 2, 0
_0813B4D0: .4byte 0x00003290
_0813B4D4: .4byte 0x00003204
_0813B4D8: .4byte 0x0000328c
_0813B4DC:
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	ldr r4, _0813B52C @ =gMonSummaryScreen
	ldr r0, [r4]
	ldr r1, _0813B530 @ =0x00003290
	adds r0, r1
	bl IsMonShiny
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813B538
	ldr r0, [r4]
	movs r2, 0xC8
	lsls r2, 6
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0813B538
	ldr r4, _0813B534 @ =gUnknown_8E9B3D0
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	subs r4, 0x20
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	b _0813B550
	.align 2, 0
_0813B52C: .4byte gMonSummaryScreen
_0813B530: .4byte 0x00003290
_0813B534: .4byte gUnknown_8E9B3D0
_0813B538:
	ldr r4, _0813B55C @ =gUnknown_8E9B310
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	adds r4, 0x20
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
_0813B550:
	ldr r0, _0813B560 @ =gMonSummaryScreen
	ldr r1, [r0]
	ldr r4, _0813B564 @ =0x0000328c
	adds r1, r4
	b _0813B72C
	.align 2, 0
_0813B55C: .4byte gUnknown_8E9B310
_0813B560: .4byte gMonSummaryScreen
_0813B564: .4byte 0x0000328c
_0813B568:
	ldr r4, _0813B5A8 @ =gMonSummaryScreen
	ldr r1, [r4]
	ldr r2, _0813B5AC @ =0x00003214
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0813B5DC
	subs r2, 0x14
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0813B5B8
	adds r2, 0x3C
	adds r0, r1, r2
	ldrb r0, [r0]
	ldr r1, _0813B5B0 @ =gUnknown_8E9BBCC
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r0, [r4]
	movs r4, 0xC9
	lsls r4, 6
	adds r0, r4
	ldrb r0, [r0]
	ldr r1, _0813B5B4 @ =gUnknown_8E9B750
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	b _0813B5DC
	.align 2, 0
_0813B5A8: .4byte gMonSummaryScreen
_0813B5AC: .4byte 0x00003214
_0813B5B0: .4byte gUnknown_8E9BBCC
_0813B5B4: .4byte gUnknown_8E9B750
_0813B5B8:
	ldr r2, _0813B5E8 @ =0x0000323c
	adds r0, r1, r2
	ldrb r0, [r0]
	ldr r1, _0813B5EC @ =gUnknown_8E9B598
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r0, [r4]
	movs r4, 0xC9
	lsls r4, 6
	adds r0, r4
	ldrb r0, [r0]
	ldr r1, _0813B5F0 @ =gUnknown_8E9B750
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
_0813B5DC:
	ldr r0, _0813B5F4 @ =gMonSummaryScreen
	ldr r1, [r0]
	ldr r0, _0813B5F8 @ =0x0000328c
	adds r1, r0
	b _0813B72C
	.align 2, 0
_0813B5E8: .4byte 0x0000323c
_0813B5EC: .4byte gUnknown_8E9B598
_0813B5F0: .4byte gUnknown_8E9B750
_0813B5F4: .4byte gMonSummaryScreen
_0813B5F8: .4byte 0x0000328c
_0813B5FC:
	bl sub_81360D4
	b _0813B724
_0813B602:
	ldr r0, [r5]
	movs r4, 0xC8
	lsls r4, 6
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0813B614
	bl sub_8136350
_0813B614:
	ldr r1, [r5]
	ldr r0, _0813B61C @ =0x0000328c
	adds r1, r0
	b _0813B72C
	.align 2, 0
_0813B61C: .4byte 0x0000328c
_0813B620:
	ldr r0, [r5]
	movs r1, 0xC8
	lsls r1, 6
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0813B632
	bl sub_81367B0
_0813B632:
	ldr r1, [r5]
	b _0813B728
_0813B636:
	bl sub_8136F4C
	bl sub_81374E8
	bl sub_8137BD0
	ldr r0, _0813B64C @ =gMonSummaryScreen
	ldr r1, [r0]
	ldr r4, _0813B650 @ =0x0000328c
	adds r1, r4
	b _0813B72C
	.align 2, 0
_0813B64C: .4byte gMonSummaryScreen
_0813B650: .4byte 0x0000328c
_0813B654:
	bl sub_8138A38
	bl sub_8138538
	ldr r4, _0813B670 @ =gMonSummaryScreen
	ldr r0, [r4]
	ldr r1, _0813B674 @ =0x00003214
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8137D28
	ldr r1, [r4]
	b _0813B728
	.align 2, 0
_0813B670: .4byte gMonSummaryScreen
_0813B674: .4byte 0x00003214
_0813B678:
	ldr r0, [r5]
	movs r4, 0xC0
	lsls r4, 6
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r5]
	ldr r1, _0813B6F8 @ =0x00003001
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r5]
	ldr r2, _0813B6FC @ =0x00003002
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r5]
	adds r4, 0x6
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r5]
	ldr r1, _0813B700 @ =0x00003003
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r5]
	ldr r2, _0813B704 @ =0x00003004
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r5]
	subs r4, 0x1
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	ldr r1, [r5]
	ldr r0, _0813B708 @ =0x0000328c
	adds r1, r0
	b _0813B72C
	.align 2, 0
_0813B6F8: .4byte 0x00003001
_0813B6FC: .4byte 0x00003002
_0813B700: .4byte 0x00003003
_0813B704: .4byte 0x00003004
_0813B708: .4byte 0x0000328c
_0813B70C:
	bl Overworld_LinkRecvQueueLengthMoreThan2
	cmp r0, 0
	bne _0813B746
	bl sub_800B270
	cmp r0, 0
	bne _0813B746
	bl sub_813AFC4
	bl sub_813B784
_0813B724:
	ldr r0, _0813B734 @ =gMonSummaryScreen
	ldr r1, [r0]
_0813B728:
	ldr r2, _0813B738 @ =0x0000328c
	adds r1, r2
_0813B72C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0813B746
	.align 2, 0
_0813B734: .4byte gMonSummaryScreen
_0813B738: .4byte 0x0000328c
_0813B73C:
	movs r0, 0
	strb r0, [r2]
	adds r0, r3, 0
	bl DestroyTask
_0813B746:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813B3F0

	thumb_func_start sub_813B750
sub_813B750: @ 813B750
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0x80
	lsls r5, 7
	movs r0, 0
	adds r1, r5, 0
	bl ClearGpuRegBits
	cmp r4, 0x2
	bgt _0813B77E
	cmp r4, 0
	blt _0813B77E
	movs r0, 0
	bl GetGpuReg
	adds r1, r5, 0
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0
	bl SetGpuReg
_0813B77E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813B750

	thumb_func_start sub_813B784
sub_813B784: @ 813B784
	push {r4,r5,lr}
	ldr r4, _0813B7BC @ =gMonSummaryScreen
	ldr r0, [r4]
	ldr r5, _0813B7C0 @ =0x00003290
	adds r0, r5
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0813B7DA
	ldr r0, [r4]
	adds r0, r5
	bl ShouldPlayNormalPokeCry
	cmp r0, 0x1
	bne _0813B7C4
	ldr r0, [r4]
	adds r0, r5
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	movs r2, 0
	bl PlayCry3
	b _0813B7DA
	.align 2, 0
_0813B7BC: .4byte gMonSummaryScreen
_0813B7C0: .4byte 0x00003290
_0813B7C4:
	ldr r0, [r4]
	adds r0, r5
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	movs r2, 0xB
	bl PlayCry3
_0813B7DA:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813B784

	thumb_func_start sub_813B7E0
sub_813B7E0: @ 813B7E0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	beq _0813B7EE
	cmp r0, 0x15
	bne _0813B7F2
_0813B7EE:
	movs r0, 0x1
	b _0813B7F4
_0813B7F2:
	movs r0, 0
_0813B7F4:
	pop {r1}
	bx r1
	thumb_func_end sub_813B7E0

	thumb_func_start sub_813B7F8
sub_813B7F8: @ 813B7F8
	push {lr}
	ldr r0, _0813B828 @ =gMonSummaryScreen
	ldr r0, [r0]
	ldr r1, _0813B82C @ =0x00003290
	adds r0, r1
	movs r1, 0x25
	bl GetMonData
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFC
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x1
	bls _0813B824
	cmp r1, 0x2
	beq _0813B824
	cmp r1, 0x1
	beq _0813B824
	cmp r1, 0x3
	bne _0813B830
_0813B824:
	movs r0, 0x1
	b _0813B832
	.align 2, 0
_0813B828: .4byte gMonSummaryScreen
_0813B82C: .4byte 0x00003290
_0813B830:
	movs r0, 0
_0813B832:
	pop {r1}
	bx r1
	thumb_func_end sub_813B7F8

	thumb_func_start sub_813B838
sub_813B838: @ 813B838
	push {lr}
	lsls r0, 24
	movs r1, 0xA8
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x6C
	bls _0813B84C
	movs r0, 0
	b _0813B84E
_0813B84C:
	movs r0, 0x1
_0813B84E:
	pop {r1}
	bx r1
	thumb_func_end sub_813B838

	thumb_func_start sub_813B854
sub_813B854: @ 813B854
	push {lr}
	sub sp, 0x4
	ldr r3, _0813B86C @ =CB2_ReturnToField
	movs r0, 0
	str r0, [sp]
	movs r1, 0
	movs r2, 0
	bl ShowPokemonSummaryScreen
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0813B86C: .4byte CB2_ReturnToField
	thumb_func_end sub_813B854

	.align 2, 0 @ Don't pad with nop.
