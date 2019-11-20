	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start ShowPokemonSummaryScreen
ShowPokemonSummaryScreen: @ 81344F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r8, r0
	adds r7, r3, 0
	ldr r0, [sp, 0x20]
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r5, _0813453C @ =gUnknown_203B140
	ldr r0, _08134540 @ =0x00003308
	bl AllocZeroed
	str r0, [r5]
	ldr r4, _08134544 @ =gUnknown_203B144
	movs r0, 0x28
	bl AllocZeroed
	str r0, [r4]
	ldr r5, [r5]
	cmp r5, 0
	bne _08134548
	adds r0, r7, 0
	bl SetMainCallback2
	b _08134702
	.align 2, 0
_0813453C: .4byte gUnknown_203B140
_08134540: .4byte 0x00003308
_08134544: .4byte gUnknown_203B144
_08134548:
	ldr r0, _08134574 @ =gUnknown_203B16C
	strb r6, [r0]
	ldr r0, _08134578 @ =gUnknown_203B16D
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0813457C @ =gUnknown_203B16E
	strb r1, [r0]
	ldr r1, _08134580 @ =0x000032f8
	adds r0, r5, r1
	str r7, [r0]
	ldr r2, _08134584 @ =0x000032f4
	adds r0, r5, r2
	mov r3, r8
	str r3, [r0]
	ldr r0, _08134588 @ =gEnemyParty
	cmp r8, r0
	bne _08134590
	ldr r0, _0813458C @ =0x00003024
	adds r1, r5, r0
	movs r0, 0x1
	b _08134596
	.align 2, 0
_08134574: .4byte gUnknown_203B16C
_08134578: .4byte gUnknown_203B16D
_0813457C: .4byte gUnknown_203B16E
_08134580: .4byte 0x000032f8
_08134584: .4byte 0x000032f4
_08134588: .4byte gEnemyParty
_0813458C: .4byte 0x00003024
_08134590:
	ldr r2, _081345C0 @ =0x00003024
	adds r1, r5, r2
	movs r0, 0
_08134596:
	str r0, [r1]
	ldr r4, _081345C4 @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r3, _081345C8 @ =0x00003210
	adds r0, r3
	movs r5, 0
	mov r1, r9
	strb r1, [r0]
	ldr r0, [r4]
	ldr r1, _081345CC @ =0x00003208
	adds r0, r1
	mov r2, r10
	strb r2, [r0]
	ldr r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	bgt _081345D0
	cmp r0, 0x2
	bge _08134634
	b _081345D4
	.align 2, 0
_081345C0: .4byte 0x00003024
_081345C4: .4byte gUnknown_203B140
_081345C8: .4byte 0x00003210
_081345CC: .4byte 0x00003208
_081345D0:
	cmp r0, 0x5
	beq _08134604
_081345D4:
	movs r0, 0x6
	bl HelpSystem_SetSomeVariable2
	ldr r2, _081345F8 @ =gUnknown_203B140
	ldr r0, [r2]
	ldr r3, _081345FC @ =0x00003214
	adds r0, r3
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	adds r3, 0x8
	adds r0, r3
	strb r1, [r0]
	ldr r0, [r2]
	ldr r2, _08134600 @ =0x00003234
	adds r0, r2
	b _08134654
	.align 2, 0
_081345F8: .4byte gUnknown_203B140
_081345FC: .4byte 0x00003214
_08134600: .4byte 0x00003234
_08134604:
	movs r0, 0x6
	bl HelpSystem_SetSomeVariable2
	ldr r0, [r4]
	ldr r3, _08134628 @ =0x00003214
	adds r0, r3
	strb r5, [r0]
	ldr r0, [r4]
	ldr r1, _0813462C @ =0x0000321c
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r4]
	ldr r2, _08134630 @ =0x00003234
	adds r0, r2
	strb r5, [r0]
	b _08134656
	.align 2, 0
_08134628: .4byte 0x00003214
_0813462C: .4byte 0x0000321c
_08134630: .4byte 0x00003234
_08134634:
	movs r0, 0x8
	bl HelpSystem_SetSomeVariable2
	ldr r0, [r4]
	ldr r3, _08134710 @ =0x00003214
	adds r0, r3
	movs r1, 0x3
	strb r1, [r0]
	ldr r0, [r4]
	ldr r1, _08134714 @ =0x0000321c
	adds r0, r1
	strb r5, [r0]
	ldr r0, [r4]
	ldr r2, _08134718 @ =0x00003234
	adds r0, r2
	movs r1, 0x1
_08134654:
	strb r1, [r0]
_08134656:
	ldr r5, _0813471C @ =gUnknown_203B140
	ldr r0, [r5]
	ldr r3, _08134720 @ =0x00003270
	adds r0, r3
	movs r2, 0
	strb r2, [r0]
	ldr r0, [r5]
	ldr r1, _08134724 @ =0x00003274
	adds r0, r1
	strb r2, [r0]
	ldr r0, [r5]
	adds r3, 0x8
	adds r0, r3
	strb r2, [r0]
	ldr r0, [r5]
	adds r1, 0x8
	adds r0, r1
	strb r2, [r0]
	ldr r0, [r5]
	subs r3, 0x40
	adds r0, r3
	strb r2, [r0]
	ldr r0, [r5]
	subs r1, 0x40
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	ldr r0, [r5]
	adds r3, 0x8
	adds r0, r3
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r5]
	adds r3, 0x4
	adds r0, r3
	strb r2, [r0]
	ldr r0, [r5]
	subs r3, 0x1C
	adds r0, r3
	strb r2, [r0]
	ldr r0, [r5]
	ldr r2, _08134728 @ =0x0000322c
	adds r0, r2
	strb r1, [r0]
	ldr r0, [r5]
	ldr r4, _0813472C @ =0x00003290
	adds r0, r4
	bl sub_8138B8C
	ldr r0, [r5]
	adds r0, r4
	movs r1, 0x2D
	bl GetMonData
	ldr r1, [r5]
	movs r3, 0xC8
	lsls r3, 6
	adds r1, r3
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r4
	movs r1, 0x4
	bl GetMonData
	ldr r1, [r5]
	ldr r2, _08134730 @ =0x00003204
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r2, r0, r2
	ldrb r1, [r2]
	cmp r1, 0x1
	bne _081346F0
	movs r2, 0xC8
	lsls r2, 6
	adds r0, r2
	strb r1, [r0]
_081346F0:
	ldr r0, [r5]
	movs r3, 0xCC
	lsls r3, 6
	adds r0, r3
	movs r1, 0xFF
	strb r1, [r0]
	ldr r0, _08134734 @ =sub_8135C34
	bl SetMainCallback2
_08134702:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08134710: .4byte 0x00003214
_08134714: .4byte 0x0000321c
_08134718: .4byte 0x00003234
_0813471C: .4byte gUnknown_203B140
_08134720: .4byte 0x00003270
_08134724: .4byte 0x00003274
_08134728: .4byte 0x0000322c
_0813472C: .4byte 0x00003290
_08134730: .4byte 0x00003204
_08134734: .4byte sub_8135C34
	thumb_func_end ShowPokemonSummaryScreen

	thumb_func_start ShowSelectMovePokemonSummaryScreen
ShowSelectMovePokemonSummaryScreen: @ 8134738
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, [sp, 0x10]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r5, 16
	lsrs r5, 16
	movs r4, 0x2
	str r4, [sp]
	bl ShowPokemonSummaryScreen
	ldr r0, _08134764 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _08134768 @ =0x00003260
	adds r0, r1
	strh r5, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08134764: .4byte gUnknown_203B140
_08134768: .4byte 0x00003260
	thumb_func_end ShowSelectMovePokemonSummaryScreen

	thumb_func_start sub_813476C
sub_813476C: @ 813476C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08134790 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r3, _08134794 @ =0x0000301c
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0813479C
	ldr r3, _08134798 @ =0x00003224
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	beq _0813479C
	movs r0, 0x1
	b _0813479E
	.align 2, 0
_08134790: .4byte gUnknown_203B140
_08134794: .4byte 0x0000301c
_08134798: .4byte 0x00003224
_0813479C:
	movs r0, 0
_0813479E:
	pop {r1}
	bx r1
	thumb_func_end sub_813476C

	thumb_func_start sub_81347A4
sub_81347A4: @ 81347A4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081347D4 @ =gUnknown_203B140
	ldr r1, [r0]
	movs r2, 0xC8
	lsls r2, 6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08134830
	movs r0, 0xCC
	lsls r0, 6
	adds r2, r1, r0
	ldrb r1, [r2]
	adds r0, r1, 0
	cmp r0, 0xFF
	beq _081347D8
	cmp r0, r4
	bne _081347D8
	movs r0, 0xFF
	strb r0, [r2]
_081347D0:
	movs r0, 0x1
	b _08134832
	.align 2, 0
_081347D4: .4byte gUnknown_203B140
_081347D8:
	adds r0, r4, 0
	bl sub_813476C
	lsls r0, 24
	cmp r0, 0
	bne _08134830
	cmp r4, 0
	beq _08134810
	cmp r4, 0x1
	bne _08134830
	ldr r0, _08134808 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _081347D0
	ldr r0, _0813480C @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _08134830
	movs r0, 0x80
	lsls r0, 1
	b _0813482A
	.align 2, 0
_08134808: .4byte gMain
_0813480C: .4byte gSaveBlock2Ptr
_08134810:
	ldr r0, _08134838 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _081347D0
	ldr r0, _0813483C @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _08134830
	movs r0, 0x80
	lsls r0, 2
_0813482A:
	ands r0, r1
	cmp r0, 0
	bne _081347D0
_08134830:
	movs r0, 0
_08134832:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08134838: .4byte gMain
_0813483C: .4byte gSaveBlock2Ptr
	thumb_func_end sub_81347A4

	thumb_func_start sub_8134840
sub_8134840: @ 8134840
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _0813486C @ =gUnknown_203B140
	ldr r0, [r1]
	ldr r2, _08134870 @ =0x00003270
	adds r0, r2
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x5
	bls _08134860
	b _08134B88
_08134860:
	lsls r0, 2
	ldr r1, _08134874 @ =_08134878
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813486C: .4byte gUnknown_203B140
_08134870: .4byte 0x00003270
_08134874: .4byte _08134878
	.align 2, 0
_08134878:
	.4byte _08134890
	.4byte _081348AC
	.4byte _081348E4
	.4byte _08134ADC
	.4byte _08134B38
	.4byte _08134B60
_08134890:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _081348A8 @ =gUnknown_203B140
	ldr r0, [r0]
	b _081348D6
	.align 2, 0
_081348A8: .4byte gUnknown_203B140
_081348AC:
	ldr r0, _081348C8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081348D4
	bl sub_813B784
	ldr r0, _081348CC @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r2, _081348D0 @ =0x00003270
	adds r0, r2
	b _08134AF6
	.align 2, 0
_081348C8: .4byte gPaletteFade
_081348CC: .4byte gUnknown_203B140
_081348D0: .4byte 0x00003270
_081348D4:
	ldr r0, [r4]
_081348D6:
	ldr r1, _081348E0 @ =0x00003270
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	b _08134B9A
	.align 2, 0
_081348E0: .4byte 0x00003270
_081348E4:
	bl sub_80BF72C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081348F2
	b _08134B9A
_081348F2:
	bl sub_800B270
	cmp r0, 0x1
	bne _081348FC
	b _08134B9A
_081348FC:
	ldr r0, _08134940 @ =sub_813B3F0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0
	beq _0813490C
	b _08134B9A
_0813490C:
	ldr r5, _08134944 @ =gUnknown_203B140
	ldr r0, [r5]
	ldr r6, _08134948 @ =0x00003214
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _081349F8
	movs r0, 0x1
	bl sub_81347A4
	adds r4, r0, 0
	cmp r4, 0x1
	bne _0813498C
	ldr r0, _0813494C @ =sub_8134BAC
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _08134950
	ldr r0, [r5]
	movs r2, 0xCC
	lsls r2, 6
	adds r0, r2
	strb r4, [r0]
	b _08134B9A
	.align 2, 0
_08134940: .4byte sub_813B3F0
_08134944: .4byte gUnknown_203B140
_08134948: .4byte 0x00003214
_0813494C: .4byte sub_8134BAC
_08134950:
	ldr r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _0813495C
	b _08134B9A
_0813495C:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl HideBg
	ldr r0, [r5]
	ldr r1, _08134988 @ =0x00003224
	adds r0, r1
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	bl sub_8138414
	ldr r1, [r5]
	adds r1, r6
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r5]
	b _08134AA8
	.align 2, 0
_08134988: .4byte 0x00003224
_0813498C:
	movs r0, 0
	bl sub_81347A4
	cmp r0, 0x1
	bne _081349F8
	ldr r0, _081349B0 @ =sub_8134BAC
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _081349B4
	ldr r0, [r5]
	movs r1, 0xCC
	lsls r1, 6
	adds r0, r1
	strb r7, [r0]
	b _08134B9A
	.align 2, 0
_081349B0: .4byte sub_8134BAC
_081349B4:
	ldr r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0
	bne _081349C0
	b _08134B9A
_081349C0:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl HideBg
	ldr r0, [r5]
	ldr r2, _081349F0 @ =0x00003224
	adds r0, r2
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	bl sub_8138414
	ldr r1, [r5]
	adds r1, r6
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	ldr r0, [r5]
	ldr r1, _081349F4 @ =0x00003270
	adds r0, r1
	b _08134AAC
	.align 2, 0
_081349F0: .4byte 0x00003224
_081349F4: .4byte 0x00003270
_081349F8:
	ldr r0, _08134A2C @ =sub_8134BAC
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _08134A12
	ldr r0, _08134A30 @ =sub_813B3F0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08134A12
	b _08134B9A
_08134A12:
	ldr r0, _08134A34 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08134A38
	movs r1, 0x1
	negs r1, r1
	mov r0, r8
	bl sub_813B120
	b _08134B9A
	.align 2, 0
_08134A2C: .4byte sub_8134BAC
_08134A30: .4byte sub_813B3F0
_08134A34: .4byte gMain
_08134A38:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08134A4A
	mov r0, r8
	movs r1, 0x1
	bl sub_813B120
	b _08134B9A
_08134A4A:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08134ABC
	ldr r4, _08134A70 @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r5, _08134A74 @ =0x00003214
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0
	bne _08134A7C
	movs r0, 0x5
	bl PlaySE
	ldr r0, [r4]
	ldr r2, _08134A78 @ =0x00003270
	adds r0, r2
	b _08134ACC
	.align 2, 0
_08134A70: .4byte gUnknown_203B140
_08134A74: .4byte 0x00003214
_08134A78: .4byte 0x00003270
_08134A7C:
	cmp r0, 0x2
	beq _08134A82
	b _08134B9A
_08134A82:
	movs r0, 0x5
	bl PlaySE
	ldr r0, [r4]
	ldr r1, _08134AB4 @ =0x00003224
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8138414
	ldr r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r4]
_08134AA8:
	ldr r2, _08134AB8 @ =0x00003270
	adds r0, r2
_08134AAC:
	movs r1, 0x3
	strb r1, [r0]
	b _08134B9A
	.align 2, 0
_08134AB4: .4byte 0x00003224
_08134AB8: .4byte 0x00003270
_08134ABC:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08134B9A
	ldr r0, _08134AD4 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _08134AD8 @ =0x00003270
	adds r0, r1
_08134ACC:
	movs r1, 0x4
	strb r1, [r0]
	b _08134B9A
	.align 2, 0
_08134AD4: .4byte gUnknown_203B140
_08134AD8: .4byte 0x00003270
_08134ADC:
	ldr r3, [r4]
	ldr r2, _08134AFC @ =0x00003214
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _08134B08
	ldr r0, _08134B00 @ =sub_8134BAC
	movs r1, 0
	bl CreateTask
	ldr r0, [r4]
	ldr r1, _08134B04 @ =0x00003270
	adds r0, r1
_08134AF6:
	movs r1, 0x2
	strb r1, [r0]
	b _08134B9A
	.align 2, 0
_08134AFC: .4byte 0x00003214
_08134B00: .4byte sub_8134BAC
_08134B04: .4byte 0x00003270
_08134B08:
	ldr r2, _08134B28 @ =gTasks
	ldr r1, _08134B2C @ =0x00003018
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _08134B30 @ =sub_8134E84
	str r1, [r0]
	ldr r2, _08134B34 @ =0x00003270
	adds r1, r3, r2
	movs r0, 0x2
	strb r0, [r1]
	b _08134B9A
	.align 2, 0
_08134B28: .4byte gTasks
_08134B2C: .4byte 0x00003018
_08134B30: .4byte sub_8134E84
_08134B34: .4byte 0x00003270
_08134B38:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08134B58 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _08134B5C @ =0x00003270
	adds r0, r1
	movs r1, 0x5
	strb r1, [r0]
	b _08134B9A
	.align 2, 0
_08134B58: .4byte gUnknown_203B140
_08134B5C: .4byte 0x00003270
_08134B60:
	bl sub_8058244
	cmp r0, 0x1
	beq _08134B9A
	bl sub_800B270
	cmp r0, 0x1
	beq _08134B9A
	ldr r0, _08134B80 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r2, _08134B84 @ =0x00003270
	adds r0, r2
	movs r1, 0x6
	strb r1, [r0]
	b _08134B9A
	.align 2, 0
_08134B80: .4byte gUnknown_203B140
_08134B84: .4byte 0x00003270
_08134B88:
	ldr r0, _08134BA8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08134B9A
	mov r0, r8
	bl sub_8137E64
_08134B9A:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08134BA8: .4byte gPaletteFade
	thumb_func_end sub_8134840

	thumb_func_start sub_8134BAC
sub_8134BAC: @ 8134BAC
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r6, _08134BD4 @ =gTasks+0x8
	adds r7, r0, r6
	movs r1, 0
	ldrsh r0, [r7, r1]
	cmp r0, 0x9
	bls _08134BCA
	b _08134E18
_08134BCA:
	lsls r0, 2
	ldr r1, _08134BD8 @ =_08134BDC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08134BD4: .4byte gTasks+0x8
_08134BD8: .4byte _08134BDC
	.align 2, 0
_08134BDC:
	.4byte _08134C04
	.4byte _08134C48
	.4byte _08134CD4
	.4byte _08134CF8
	.4byte _08134D2C
	.4byte _08134D4C
	.4byte _08134D68
	.4byte _08134D88
	.4byte _08134DB0
	.4byte _08134E00
_08134C04:
	bl sub_8135638
	bl sub_81356EC
	ldr r4, _08134C38 @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r2, _08134C3C @ =0x00003234
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r4]
	ldr r3, _08134C40 @ =0x0000301c
	adds r0, r3
	strb r1, [r0]
	ldr r0, [r4]
	ldr r5, _08134C44 @ =0x00003214
	adds r0, r5
	ldrb r0, [r0]
	bl sub_813B750
	ldr r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8138280
	b _08134E74
	.align 2, 0
_08134C38: .4byte gUnknown_203B140
_08134C3C: .4byte 0x00003234
_08134C40: .4byte 0x0000301c
_08134C44: .4byte 0x00003214
_08134C48:
	ldr r0, _08134CC8 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r2, _08134CCC @ =0x00003214
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _08134C7E
	cmp r0, 0x2
	bne _08134C64
	ldr r3, _08134CD0 @ =0x00003224
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	beq _08134C7E
_08134C64:
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
_08134C7E:
	movs r4, 0x1E
	str r4, [sp]
	movs r5, 0x2
	str r5, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r6, 0xF
	str r6, [sp]
	str r5, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r6, [sp]
	str r5, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	b _08134E74
	.align 2, 0
_08134CC8: .4byte gUnknown_203B140
_08134CCC: .4byte 0x00003214
_08134CD0: .4byte 0x00003224
_08134CD4:
	bl sub_8135AA4
	bl sub_8135B90
	bl sub_8138538
	ldr r0, _08134CF0 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _08134CF4 @ =0x00003214
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8137D28
	b _08134E74
	.align 2, 0
_08134CF0: .4byte gUnknown_203B140
_08134CF4: .4byte 0x00003214
_08134CF8:
	ldr r4, _08134D20 @ =gUnknown_203B140
	ldr r0, [r4]
	movs r2, 0xC0
	lsls r2, 6
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r3, _08134D24 @ =0x00003001
	adds r0, r3
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r1, _08134D28 @ =0x00003002
	adds r0, r1
	b _08134DE2
	.align 2, 0
_08134D20: .4byte gUnknown_203B140
_08134D24: .4byte 0x00003001
_08134D28: .4byte 0x00003002
_08134D2C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	beq _08134D38
	b _08134E7A
_08134D38:
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	b _08134E74
_08134D4C:
	bl sub_8135514
	ldr r0, _08134D60 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r2, _08134D64 @ =0x00003244
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0]
	b _08134E74
	.align 2, 0
_08134D60: .4byte gUnknown_203B140
_08134D64: .4byte 0x00003244
_08134D68:
	ldr r0, _08134D80 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r3, _08134D84 @ =0x00003224
	adds r0, r3
	ldrb r0, [r0]
	bl sub_81357A0
	lsls r0, 24
	cmp r0, 0
	bne _08134D7E
	b _08134E7A
_08134D7E:
	b _08134E74
	.align 2, 0
_08134D80: .4byte gUnknown_203B140
_08134D84: .4byte 0x00003224
_08134D88:
	bl sub_8136F4C
	ldr r0, _08134DA8 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _08134DAC @ =0x00003214
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _08134D9E
	bl sub_81374E8
_08134D9E:
	bl sub_8137BD0
	bl sub_8138A38
	b _08134E74
	.align 2, 0
_08134DA8: .4byte gUnknown_203B140
_08134DAC: .4byte 0x00003214
_08134DB0:
	ldr r4, _08134DEC @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r2, _08134DF0 @ =0x00003003
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r3, _08134DF4 @ =0x00003004
	adds r0, r3
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r1, _08134DF8 @ =0x00003005
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, _08134DFC @ =0x00003006
	adds r0, r2
_08134DE2:
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	b _08134E74
	.align 2, 0
_08134DEC: .4byte gUnknown_203B140
_08134DF0: .4byte 0x00003003
_08134DF4: .4byte 0x00003004
_08134DF8: .4byte 0x00003005
_08134DFC: .4byte 0x00003006
_08134E00:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08134E7A
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl ShowBg
	b _08134E74
_08134E18:
	bl sub_8138440
	ldr r5, _08134E5C @ =gUnknown_203B140
	ldr r1, [r5]
	ldr r3, _08134E60 @ =0x00003214
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _08134E40
	adds r2, r6, 0
	subs r2, 0x8
	ldr r3, _08134E64 @ =0x00003018
	adds r0, r1, r3
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _08134E68 @ =sub_8138CD8
	str r1, [r0]
_08134E40:
	adds r0, r4, 0
	bl DestroyTask
	movs r0, 0
	strh r0, [r7]
	ldr r1, [r5]
	ldr r2, _08134E6C @ =0x00003234
	adds r1, r2
	strb r0, [r1]
	ldr r1, [r5]
	ldr r3, _08134E70 @ =0x0000301c
	adds r1, r3
	strb r0, [r1]
	b _08134E7A
	.align 2, 0
_08134E5C: .4byte gUnknown_203B140
_08134E60: .4byte 0x00003214
_08134E64: .4byte 0x00003018
_08134E68: .4byte sub_8138CD8
_08134E6C: .4byte 0x00003234
_08134E70: .4byte 0x0000301c
_08134E74:
	ldrh r0, [r7]
	adds r0, 0x1
	strh r0, [r7]
_08134E7A:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8134BAC

	thumb_func_start sub_8134E84
sub_8134E84: @ 8134E84
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r4, _08134EA4 @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r1, _08134EA8 @ =0x00003284
	adds r0, r1
	ldrb r0, [r0]
	adds r5, r4, 0
	cmp r0, 0xB
	bls _08134E9A
	b _08135132
_08134E9A:
	lsls r0, 2
	ldr r1, _08134EAC @ =_08134EB0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08134EA4: .4byte gUnknown_203B140
_08134EA8: .4byte 0x00003284
_08134EAC: .4byte _08134EB0
	.align 2, 0
_08134EB0:
	.4byte _08134EE0
	.4byte _08134F14
	.4byte _08134FA0
	.4byte _08134FC8
	.4byte _08135010
	.4byte _08135034
	.4byte _08135054
	.4byte _08135080
	.4byte _081350AC
	.4byte _081350D4
	.4byte _081350E4
	.4byte _08135114
_08134EE0:
	ldr r1, _08134F04 @ =gUnknown_203B140
	ldr r0, [r1]
	ldr r2, _08134F08 @ =0x00003234
	adds r0, r2
	movs r2, 0x1
	strb r2, [r0]
	ldr r0, [r1]
	ldr r3, _08134F0C @ =0x0000301c
	adds r0, r3
	strb r2, [r0]
	ldr r0, [r1]
	ldr r1, _08134F10 @ =0x00003214
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8138280
	b _08135180
	.align 2, 0
_08134F04: .4byte gUnknown_203B140
_08134F08: .4byte 0x00003234
_08134F0C: .4byte 0x0000301c
_08134F10: .4byte 0x00003214
_08134F14:
	ldr r0, _08134F94 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r2, _08134F98 @ =0x00003214
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _08134F4A
	cmp r0, 0x2
	bne _08134F30
	ldr r3, _08134F9C @ =0x00003224
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	beq _08134F4A
_08134F30:
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
_08134F4A:
	movs r4, 0x1E
	str r4, [sp]
	movs r5, 0x2
	str r5, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r6, 0xF
	str r6, [sp]
	str r5, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r6, [sp]
	str r5, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	b _08135180
	.align 2, 0
_08134F94: .4byte gUnknown_203B140
_08134F98: .4byte 0x00003214
_08134F9C: .4byte 0x00003224
_08134FA0:
	bl sub_8135638
	ldr r0, _08134FC0 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _08134FC4 @ =0x00003214
	adds r0, r1
	ldrb r0, [r0]
	bl sub_813B750
	bl sub_8135B90
	bl sub_8138538
	bl sub_8135AA4
	b _08135180
	.align 2, 0
_08134FC0: .4byte gUnknown_203B140
_08134FC4: .4byte 0x00003214
_08134FC8:
	ldr r0, _08134FF0 @ =gUnknown_8419C39
	bl sub_8136DA4
	ldr r0, _08134FF4 @ =gMain
	ldr r2, _08134FF8 @ =0x00000439
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08135004
	ldr r0, _08134FFC @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08135004
	ldr r0, _08135000 @ =gUnknown_8419C92
	bl sub_8136DF0
	b _08135180
	.align 2, 0
_08134FF0: .4byte gUnknown_8419C39
_08134FF4: .4byte gMain
_08134FF8: .4byte 0x00000439
_08134FFC: .4byte gReceivedRemoteLinkPlayers
_08135000: .4byte gUnknown_8419C92
_08135004:
	ldr r0, _0813500C @ =gUnknown_8419CA2
	bl sub_8136DF0
	b _08135180
	.align 2, 0
_0813500C: .4byte gUnknown_8419CA2
_08135010:
	ldr r4, _0813502C @ =gUnknown_203B140
	ldr r0, [r4]
	movs r3, 0xC0
	lsls r3, 6
	adds r0, r3
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r1, _08135030 @ =0x00003001
	adds r0, r1
	b _081350FE
	.align 2, 0
_0813502C: .4byte gUnknown_203B140
_08135030: .4byte 0x00003001
_08135034:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	beq _08135040
	b _0813518E
_08135040:
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	b _08135180
_08135054:
	bl sub_8136F4C
	bl sub_8137BD0
	ldr r4, _08135074 @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r2, _08135078 @ =0x00003003
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r3, _0813507C @ =0x00003005
	adds r0, r3
	b _081350FE
	.align 2, 0
_08135074: .4byte gUnknown_203B140
_08135078: .4byte 0x00003003
_0813507C: .4byte 0x00003005
_08135080:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	beq _0813508C
	b _0813518E
_0813508C:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	bl sub_8135514
	ldr r0, _081350A4 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _081350A8 @ =0x00003244
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	b _08135180
	.align 2, 0
_081350A4: .4byte gUnknown_203B140
_081350A8: .4byte 0x00003244
_081350AC:
	ldr r0, [r5]
	ldr r2, _081350CC @ =0x00003224
	adds r0, r2
	ldrb r0, [r0]
	bl sub_81357A0
	lsls r0, 24
	cmp r0, 0
	beq _0813518E
	bl sub_81374E8
	ldr r0, [r5]
	ldr r3, _081350D0 @ =0x00003004
	adds r0, r3
	b _081350FE
	.align 2, 0
_081350CC: .4byte 0x00003224
_081350D0: .4byte 0x00003004
_081350D4:
	bl sub_8138A38
	ldr r0, _081350E0 @ =gUnknown_8419C45
	bl sub_8136E50
	b _08135180
	.align 2, 0
_081350E0: .4byte gUnknown_8419C45
_081350E4:
	bl sub_81356EC
	ldr r4, _08135108 @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r1, _0813510C @ =0x00003006
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, _08135110 @ =0x00003002
	adds r0, r2
_081350FE:
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	b _08135180
	.align 2, 0
_08135108: .4byte gUnknown_203B140
_0813510C: .4byte 0x00003006
_08135110: .4byte 0x00003002
_08135114:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0813518E
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	b _08135180
_08135132:
	bl sub_8138440
	ldr r3, _08135168 @ =gTasks
	ldr r2, [r4]
	ldr r1, _0813516C @ =0x00003018
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	ldr r1, _08135170 @ =sub_8138CD8
	str r1, [r0]
	ldr r3, _08135174 @ =0x00003284
	adds r2, r3
	movs r1, 0
	strb r1, [r2]
	ldr r0, [r4]
	ldr r2, _08135178 @ =0x00003234
	adds r0, r2
	strb r1, [r0]
	ldr r0, [r4]
	ldr r3, _0813517C @ =0x0000301c
	adds r0, r3
	strb r1, [r0]
	b _0813518E
	.align 2, 0
_08135168: .4byte gTasks
_0813516C: .4byte 0x00003018
_08135170: .4byte sub_8138CD8
_08135174: .4byte 0x00003284
_08135178: .4byte 0x00003234
_0813517C: .4byte 0x0000301c
_08135180:
	ldr r0, _08135198 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r0, _0813519C @ =0x00003284
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0813518E:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08135198: .4byte gUnknown_203B140
_0813519C: .4byte 0x00003284
	thumb_func_end sub_8134E84

	thumb_func_start sub_81351A0
sub_81351A0: @ 81351A0
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r4, _081351C0 @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r1, _081351C4 @ =0x00003284
	adds r0, r1
	ldrb r0, [r0]
	adds r2, r4, 0
	cmp r0, 0xA
	bls _081351B6
	b _08135400
_081351B6:
	lsls r0, 2
	ldr r1, _081351C8 @ =_081351CC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081351C0: .4byte gUnknown_203B140
_081351C4: .4byte 0x00003284
_081351C8: .4byte _081351CC
	.align 2, 0
_081351CC:
	.4byte _081351F8
	.4byte _0813522C
	.4byte _081352B8
	.4byte _081352BE
	.4byte _08135310
	.4byte _08135328
	.4byte _08135354
	.4byte _0813544C
	.4byte _08135388
	.4byte _081353AC
	.4byte _081353EC
_081351F8:
	ldr r1, _0813521C @ =gUnknown_203B140
	ldr r0, [r1]
	ldr r2, _08135220 @ =0x00003234
	adds r0, r2
	movs r2, 0x1
	strb r2, [r0]
	ldr r0, [r1]
	ldr r3, _08135224 @ =0x0000301c
	adds r0, r3
	strb r2, [r0]
	ldr r0, [r1]
	ldr r1, _08135228 @ =0x00003214
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8138280
	b _0813544C
	.align 2, 0
_0813521C: .4byte gUnknown_203B140
_08135220: .4byte 0x00003234
_08135224: .4byte 0x0000301c
_08135228: .4byte 0x00003214
_0813522C:
	ldr r0, _081352AC @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r2, _081352B0 @ =0x00003214
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _08135262
	cmp r0, 0x2
	bne _08135248
	ldr r3, _081352B4 @ =0x00003224
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	beq _08135262
_08135248:
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
_08135262:
	movs r4, 0x1E
	str r4, [sp]
	movs r5, 0x2
	str r5, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r6, 0xF
	str r6, [sp]
	str r5, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r6, [sp]
	str r5, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	b _0813544C
	.align 2, 0
_081352AC: .4byte gUnknown_203B140
_081352B0: .4byte 0x00003214
_081352B4: .4byte 0x00003224
_081352B8:
	bl sub_8135AA4
	b _0813544C
_081352BE:
	bl sub_8136F4C
	bl sub_81374E8
	bl sub_8137BD0
	ldr r4, _08135300 @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r1, _08135304 @ =0x00003003
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, _08135308 @ =0x00003004
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r3, _0813530C @ =0x00003005
	adds r0, r3
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	b _0813544C
	.align 2, 0
_08135300: .4byte gUnknown_203B140
_08135304: .4byte 0x00003003
_08135308: .4byte 0x00003004
_0813530C: .4byte 0x00003005
_08135310:
	ldr r0, _08135320 @ =gUnknown_8419C39
	bl sub_8136DA4
	ldr r0, _08135324 @ =gUnknown_8419C82
	bl sub_8136DF0
	b _0813544C
	.align 2, 0
_08135320: .4byte gUnknown_8419C39
_08135324: .4byte gUnknown_8419C82
_08135328:
	ldr r4, _0813534C @ =gUnknown_203B140
	ldr r0, [r4]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, _08135350 @ =0x00003001
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	b _081353D0
	.align 2, 0
_0813534C: .4byte gUnknown_203B140
_08135350: .4byte 0x00003001
_08135354:
	bl sub_8135514
	ldr r4, _0813537C @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r3, _08135380 @ =0x00003244
	adds r0, r3
	movs r1, 0x1
	strb r1, [r0]
	bl sub_8135638
	ldr r0, [r4]
	ldr r1, _08135384 @ =0x00003214
	adds r0, r1
	ldrb r0, [r0]
	bl sub_813B750
	bl sub_8138A38
	b _0813544C
	.align 2, 0
_0813537C: .4byte gUnknown_203B140
_08135380: .4byte 0x00003244
_08135384: .4byte 0x00003214
_08135388:
	ldr r0, [r2]
	ldr r2, _081353A4 @ =0x00003224
	adds r0, r2
	ldrb r0, [r0]
	bl sub_81357A0
	lsls r0, 24
	cmp r0, 0
	beq _0813545A
	ldr r0, _081353A8 @ =gUnknown_8419C45
	bl sub_8136E50
	b _0813544C
	.align 2, 0
_081353A4: .4byte 0x00003224
_081353A8: .4byte gUnknown_8419C45
_081353AC:
	ldr r4, _081353E0 @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r3, _081353E4 @ =0x00003006
	adds r0, r3
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r1, _081353E8 @ =0x00003002
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
_081353D0:
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	b _0813544C
	.align 2, 0
_081353E0: .4byte gUnknown_203B140
_081353E4: .4byte 0x00003006
_081353E8: .4byte 0x00003002
_081353EC:
	bl sub_8135B90
	bl sub_8138538
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	bl sub_81356EC
	b _0813544C
_08135400:
	bl sub_8138440
	ldr r3, _08135434 @ =gTasks
	ldr r2, [r4]
	ldr r1, _08135438 @ =0x00003018
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	ldr r1, _0813543C @ =sub_8134840
	str r1, [r0]
	ldr r3, _08135440 @ =0x00003284
	adds r2, r3
	movs r1, 0
	strb r1, [r2]
	ldr r0, [r4]
	ldr r2, _08135444 @ =0x00003234
	adds r0, r2
	strb r1, [r0]
	ldr r0, [r4]
	ldr r3, _08135448 @ =0x0000301c
	adds r0, r3
	strb r1, [r0]
	b _0813545A
	.align 2, 0
_08135434: .4byte gTasks
_08135438: .4byte 0x00003018
_0813543C: .4byte sub_8134840
_08135440: .4byte 0x00003284
_08135444: .4byte 0x00003234
_08135448: .4byte 0x0000301c
_0813544C:
	ldr r0, _08135464 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r0, _08135468 @ =0x00003284
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0813545A:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08135464: .4byte gUnknown_203B140
_08135468: .4byte 0x00003284
	thumb_func_end sub_81351A0

	thumb_func_start sub_813546C
sub_813546C: @ 813546C
	push {r4-r6,lr}
	movs r4, 0
	ldr r6, _081354BC @ =gUnknown_203B160
_08135472:
	ldr r1, [r6]
	lsls r5, r4, 1
	adds r0, r1, 0
	adds r0, 0x2C
	adds r0, r5
	lsls r2, r4, 3
	mov r12, r2
	movs r2, 0xC6
	lsls r2, 1
	add r2, r12
	strh r2, [r0]
	lsls r3, r4, 2
	adds r1, r3
	ldr r0, [r1]
	strh r2, [r0, 0x20]
	cmp r4, 0x8
	bhi _081354AC
	ldr r0, _081354C0 @ =gUnknown_203B15C
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x28
	adds r0, r5
	movs r2, 0xCE
	lsls r2, 1
	add r2, r12
	strh r2, [r0]
	adds r1, r3
	ldr r0, [r1]
	strh r2, [r0, 0x20]
_081354AC:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xA
	bls _08135472
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081354BC: .4byte gUnknown_203B160
_081354C0: .4byte gUnknown_203B15C
	thumb_func_end sub_813546C

	thumb_func_start sub_81354C4
sub_81354C4: @ 81354C4
	push {r4-r7,lr}
	movs r5, 0
	ldr r7, _0813550C @ =gUnknown_203B160
_081354CA:
	ldr r1, [r7]
	lsls r6, r5, 1
	adds r0, r1, 0
	adds r0, 0x2C
	adds r0, r6
	lsls r4, r5, 3
	adds r2, r4, 0
	adds r2, 0x9C
	strh r2, [r0]
	lsls r3, r5, 2
	adds r1, r3
	ldr r0, [r1]
	strh r2, [r0, 0x20]
	cmp r5, 0x8
	bhi _081354FC
	ldr r0, _08135510 @ =gUnknown_203B15C
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x28
	adds r0, r6
	adds r2, 0x10
	strh r2, [r0]
	adds r1, r3
	ldr r0, [r1]
	strh r2, [r0, 0x20]
_081354FC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xA
	bls _081354CA
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813550C: .4byte gUnknown_203B160
_08135510: .4byte gUnknown_203B15C
	thumb_func_end sub_81354C4

	thumb_func_start sub_8135514
sub_8135514: @ 8135514
	push {r4-r6,lr}
	movs r4, 0x1
	ldr r6, _0813553C @ =gUnknown_203B140
	ldr r1, [r6]
	ldr r2, _08135540 @ =0x00003224
	adds r0, r1, r2
	ldrb r3, [r0]
	cmp r3, 0x1
	bne _08135528
	movs r4, 0xFF
_08135528:
	ldr r0, _08135544 @ =0x00003214
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, 0x3
	bne _0813554C
	ldr r2, _08135548 @ =0x0000324c
	adds r1, r2
	movs r0, 0xF0
	strh r0, [r1]
	b _08135632
	.align 2, 0
_0813553C: .4byte gUnknown_203B140
_08135540: .4byte 0x00003224
_08135544: .4byte 0x00003214
_08135548: .4byte 0x0000324c
_0813554C:
	lsls r0, r4, 24
	asrs r0, 24
	ldrb r2, [r2]
	adds r0, r2
	cmp r0, 0x3
	bne _08135580
	movs r0, 0
	movs r1, 0
	bl sub_81358DC
	ldr r0, [r6]
	ldr r1, _0813557C @ =0x0000324c
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	movs r0, 0x14
	bl SetGpuReg
	movs r0, 0x18
	movs r1, 0
	bl SetGpuReg
	b _08135632
	.align 2, 0
_0813557C: .4byte 0x0000324c
_08135580:
	cmp r3, 0x1
	bne _081355B4
	ldr r2, _081355B0 @ =0x0000324c
	adds r1, r2
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x10
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x14
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x18
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1
	movs r1, 0x1
	bl sub_81358DC
	b _081355FC
	.align 2, 0
_081355B0: .4byte 0x0000324c
_081355B4:
	movs r0, 0xA
	bl GetGpuReg
	movs r4, 0x3
	adds r5, r4, 0
	ands r5, r0
	movs r0, 0xC
	bl GetGpuReg
	ands r4, r0
	ldr r0, [r6]
	ldr r1, _081355E0 @ =0x0000324c
	adds r0, r1
	movs r1, 0xF0
	strh r1, [r0]
	cmp r5, r4
	bls _081355E4
	movs r0, 0x14
	bl SetGpuReg
	b _081355EC
	.align 2, 0
_081355E0: .4byte 0x0000324c
_081355E4:
	movs r0, 0x18
	movs r1, 0xF0
	bl SetGpuReg
_081355EC:
	movs r0, 0x10
	movs r1, 0xF0
	bl SetGpuReg
	movs r0, 0x1
	movs r1, 0
	bl sub_81358DC
_081355FC:
	ldr r0, _0813561C @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r2, _08135620 @ =0x00003214
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0813562A
	adds r2, 0x10
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08135624
	bl sub_81354C4
	b _08135632
	.align 2, 0
_0813561C: .4byte gUnknown_203B140
_08135620: .4byte 0x00003214
_08135624:
	bl sub_813546C
	b _08135632
_0813562A:
	cmp r0, 0x2
	bne _08135632
	bl sub_81354C4
_08135632:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8135514

	thumb_func_start sub_8135638
sub_8135638: @ 8135638
	push {lr}
	ldr r0, _08135654 @ =gUnknown_203B140
	ldr r2, [r0]
	ldr r3, _08135658 @ =0x00003224
	adds r1, r2, r3
	ldrb r1, [r1]
	adds r3, r0, 0
	cmp r1, 0x1
	bne _08135660
	ldr r1, _0813565C @ =0x00003214
	adds r0, r2, r1
	ldrb r0, [r0]
	subs r0, 0x1
	b _08135668
	.align 2, 0
_08135654: .4byte gUnknown_203B140
_08135658: .4byte 0x00003224
_0813565C: .4byte 0x00003214
_08135660:
	ldr r1, _08135680 @ =0x00003214
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r0, 0x1
_08135668:
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08135684
	cmp r0, 0x1
	ble _081356E6
	cmp r0, 0x2
	beq _08135692
	cmp r0, 0x3
	beq _081356C8
	b _081356E6
	.align 2, 0
_08135680: .4byte 0x00003214
_08135684:
	movs r0, 0x1
	bl sub_813A838
	movs r0, 0x1
	bl sub_813AB70
	b _081356E6
_08135692:
	ldr r0, [r3]
	ldr r3, _081356C4 @ =0x00003224
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081356E6
	movs r0, 0x1
	bl sub_8139C44
	movs r0, 0x1
	bl sub_813B084
	movs r0, 0x1
	bl sub_8139D54
	movs r0, 0x1
	bl sub_813A3B8
	movs r0, 0x1
	bl sub_813ACF8
	movs r0, 0x1
	bl sub_813AEB0
	b _081356E6
	.align 2, 0
_081356C4: .4byte 0x00003224
_081356C8:
	movs r0, 0x1
	bl sub_813A0E8
	movs r0, 0x1
	bl sub_8139EE4
	movs r0, 0x1
	bl sub_813A3B8
	movs r0, 0x1
	bl sub_813ACF8
	movs r0, 0x1
	bl sub_813AEB0
_081356E6:
	pop {r0}
	bx r0
	thumb_func_end sub_8135638

	thumb_func_start sub_81356EC
sub_81356EC: @ 81356EC
	push {lr}
	ldr r0, _08135708 @ =gUnknown_203B140
	ldr r2, [r0]
	ldr r3, _0813570C @ =0x00003224
	adds r1, r2, r3
	ldrb r1, [r1]
	adds r3, r0, 0
	cmp r1, 0x1
	bne _08135714
	ldr r1, _08135710 @ =0x00003214
	adds r0, r2, r1
	ldrb r0, [r0]
	subs r0, 0x1
	b _0813571C
	.align 2, 0
_08135708: .4byte gUnknown_203B140
_0813570C: .4byte 0x00003224
_08135710: .4byte 0x00003214
_08135714:
	ldr r1, _08135730 @ =0x00003214
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r0, 0x1
_0813571C:
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0813579A
	cmp r0, 0x1
	bgt _08135734
	cmp r0, 0
	beq _0813574A
	b _0813579A
	.align 2, 0
_08135730: .4byte 0x00003214
_08135734:
	cmp r0, 0x2
	beq _0813573E
	cmp r0, 0x3
	beq _08135776
	b _0813579A
_0813573E:
	ldr r0, [r3]
	ldr r3, _08135758 @ =0x00003224
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _0813575C
_0813574A:
	movs r0, 0
	bl sub_813A838
	movs r0, 0
	bl sub_813AB70
	b _0813579A
	.align 2, 0
_08135758: .4byte 0x00003224
_0813575C:
	movs r0, 0
	bl sub_813A0E8
	movs r0, 0
	bl sub_813ACF8
	movs r0, 0
	bl sub_8139EE4
	movs r0, 0
	bl sub_813AEB0
	b _0813579A
_08135776:
	movs r0, 0
	bl sub_8139C44
	movs r0, 0
	bl sub_813B084
	movs r0, 0
	bl sub_813A3B8
	movs r0, 0
	bl sub_8139D54
	movs r0, 0
	bl sub_813ACF8
	movs r0, 0
	bl sub_813AEB0
_0813579A:
	pop {r0}
	bx r0
	thumb_func_end sub_81356EC

	thumb_func_start sub_81357A0
sub_81357A0: @ 81357A0
	push {r4-r6,lr}
	movs r3, 0x1
	ldr r0, _081357EC @ =gUnknown_203B140
	ldr r2, [r0]
	ldr r4, _081357F0 @ =0x00003224
	adds r1, r2, r4
	ldrb r1, [r1]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _081357B6
	movs r3, 0xFF
_081357B6:
	ldr r1, _081357F4 @ =0x00003214
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _08135800
	ldr r4, _081357F8 @ =0x0000324c
	adds r1, r2, r4
	movs r4, 0
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bgt _08135800
	movs r4, 0
	movs r0, 0
	strh r0, [r1]
	ldr r0, _081357FC @ =0x00003238
	adds r2, r0
	ldrb r0, [r2]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r2]
	movs r0, 0
	movs r1, 0
	bl sub_81358DC
	ldr r0, [r5]
	b _0813587E
	.align 2, 0
_081357EC: .4byte gUnknown_203B140
_081357F0: .4byte 0x00003224
_081357F4: .4byte 0x00003214
_081357F8: .4byte 0x0000324c
_081357FC: .4byte 0x00003238
_08135800:
	ldr r2, [r5]
	ldr r4, _0813583C @ =0x00003214
	adds r1, r2, r4
	lsls r0, r3, 24
	asrs r0, 24
	ldrb r1, [r1]
	adds r0, r1
	cmp r0, 0x3
	bne _08135848
	ldr r0, _08135840 @ =0x0000324c
	adds r1, r2, r0
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0xEF
	ble _08135848
	movs r3, 0
	movs r0, 0xF0
	strh r0, [r1]
	adds r4, 0x24
	adds r2, r4
	ldrb r0, [r2]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r2]
	ldr r0, [r5]
	ldr r1, _08135844 @ =0x00003244
	adds r0, r1
	strb r3, [r0]
	movs r0, 0x1
	b _081358D6
	.align 2, 0
_0813583C: .4byte 0x00003214
_08135840: .4byte 0x0000324c
_08135844: .4byte 0x00003244
_08135848:
	adds r6, r5, 0
	ldr r2, [r6]
	ldr r3, _08135888 @ =0x00003224
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08135898
	ldr r4, _0813588C @ =0x0000324c
	adds r1, r2, r4
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0xEF
	ble _081358D4
	movs r4, 0
	movs r0, 0xF0
	strh r0, [r1]
	ldr r0, _08135890 @ =0x00003238
	adds r2, r0
	ldrb r0, [r2]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r2]
	movs r0, 0
	movs r1, 0
	bl sub_81358DC
	ldr r0, [r6]
_0813587E:
	ldr r1, _08135894 @ =0x00003244
	adds r0, r1
	strb r4, [r0]
	movs r0, 0x1
	b _081358D6
	.align 2, 0
_08135888: .4byte 0x00003224
_0813588C: .4byte 0x0000324c
_08135890: .4byte 0x00003238
_08135894: .4byte 0x00003244
_08135898:
	ldr r3, _081358C8 @ =0x0000324c
	adds r0, r2, r3
	movs r4, 0
	ldrsh r0, [r0, r4]
	cmp r0, 0
	bgt _081358D4
	ldr r0, _081358CC @ =0x00003238
	adds r2, r0
	ldrb r0, [r2]
	movs r1, 0x1
	eors r0, r1
	movs r3, 0
	strb r0, [r2]
	ldr r0, [r5]
	ldr r2, _081358C8 @ =0x0000324c
	adds r1, r0, r2
	movs r2, 0
	strh r3, [r1]
	ldr r3, _081358D0 @ =0x00003244
	adds r0, r3
	strb r2, [r0]
	movs r0, 0x1
	b _081358D6
	.align 2, 0
_081358C8: .4byte 0x0000324c
_081358CC: .4byte 0x00003238
_081358D0: .4byte 0x00003244
_081358D4:
	movs r0, 0
_081358D6:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_81357A0

	thumb_func_start sub_81358DC
sub_81358DC: @ 81358DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	movs r0, 0x8
	bl GetGpuReg
	movs r4, 0x3
	mov r8, r4
	mov r1, r8
	ands r1, r0
	mov r8, r1
	movs r0, 0xA
	bl GetGpuReg
	adds r5, r4, 0
	ands r5, r0
	movs r0, 0xC
	bl GetGpuReg
	adds r6, r4, 0
	ands r6, r0
	ldr r0, _08135938 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r2, _0813593C @ =0x00003224
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08135970
	cmp r7, 0
	bne _0813594E
	movs r0, 0
	mov r8, r0
	mov r1, r9
	cmp r1, 0
	bne _08135940
	cmp r5, r6
	bhi _0813594A
	b _08135944
	.align 2, 0
_08135938: .4byte gUnknown_203B140
_0813593C: .4byte 0x00003224
_08135940:
	cmp r5, r6
	bls _0813594A
_08135944:
	movs r5, 0x2
	movs r6, 0x1
	b _0813594E
_0813594A:
	movs r5, 0x1
	movs r6, 0x2
_0813594E:
	cmp r7, 0x1
	bne _08135970
	movs r2, 0x1
	mov r8, r2
	mov r0, r9
	cmp r0, 0
	bne _08135962
	cmp r5, r6
	bhi _0813596C
	b _08135966
_08135962:
	cmp r5, r6
	bls _0813596C
_08135966:
	movs r5, 0x2
	movs r6, 0
	b _08135970
_0813596C:
	movs r5, 0
	movs r6, 0x2
_08135970:
	ldr r0, _0813598C @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _08135990 @ =0x00003224
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08135998
	movs r2, 0
	mov r8, r2
	cmp r5, r6
	bls _08135994
	movs r5, 0x1
	movs r6, 0x2
	b _08135998
	.align 2, 0
_0813598C: .4byte gUnknown_203B140
_08135990: .4byte 0x00003224
_08135994:
	movs r5, 0x2
	movs r6, 0x1
_08135998:
	movs r4, 0
	mov r0, r8
	lsls r0, 2
	mov r9, r0
	movs r7, 0xD
	negs r7, r7
	lsls r1, r5, 2
	mov r12, r1
	ldr r2, _081359D8 @ =gUnknown_203B160
	mov r10, r2
_081359AC:
	ldr r0, _081359DC @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r2, _081359E0 @ =0x00003214
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081359E4
	adds r2, 0x10
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081359E4
	mov r1, r10
	ldr r0, [r1]
	lsls r3, r4, 2
	adds r0, r3
	ldr r2, [r0]
	ldrb r1, [r2, 0x5]
	adds r0, r7, 0
	ands r0, r1
	mov r1, r9
	b _081359F6
	.align 2, 0
_081359D8: .4byte gUnknown_203B160
_081359DC: .4byte gUnknown_203B140
_081359E0: .4byte 0x00003214
_081359E4:
	mov r2, r10
	ldr r0, [r2]
	lsls r3, r4, 2
	adds r0, r3
	ldr r2, [r0]
	ldrb r1, [r2, 0x5]
	adds r0, r7, 0
	ands r0, r1
	mov r1, r12
_081359F6:
	orrs r0, r1
	strb r0, [r2, 0x5]
	cmp r4, 0x8
	bhi _08135A48
	ldr r2, _08135A28 @ =gUnknown_203B140
	ldr r1, [r2]
	ldr r2, _08135A2C @ =0x00003214
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08135A34
	adds r2, 0x10
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08135A34
	ldr r0, _08135A30 @ =gUnknown_203B15C
	ldr r0, [r0]
	adds r0, r3
	ldr r2, [r0]
	ldrb r1, [r2, 0x5]
	adds r0, r7, 0
	ands r0, r1
	mov r1, r9
	b _08135A44
	.align 2, 0
_08135A28: .4byte gUnknown_203B140
_08135A2C: .4byte 0x00003214
_08135A30: .4byte gUnknown_203B15C
_08135A34:
	ldr r0, _08135A9C @ =gUnknown_203B15C
	ldr r0, [r0]
	adds r0, r3
	ldr r2, [r0]
	ldrb r1, [r2, 0x5]
	adds r0, r7, 0
	ands r0, r1
	mov r1, r12
_08135A44:
	orrs r0, r1
	strb r0, [r2, 0x5]
_08135A48:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xA
	bls _081359AC
	movs r0, 0x8
	bl GetGpuReg
	ldr r4, _08135AA0 @ =0x0000fffc
	adds r1, r4, 0
	ands r1, r0
	mov r2, r8
	orrs r1, r2
	movs r0, 0x8
	bl SetGpuReg
	movs r0, 0xA
	bl GetGpuReg
	adds r1, r4, 0
	ands r1, r0
	orrs r1, r5
	movs r0, 0xA
	bl SetGpuReg
	movs r0, 0xC
	bl GetGpuReg
	ands r4, r0
	orrs r4, r6
	movs r0, 0xC
	adds r1, r4, 0
	bl SetGpuReg
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08135A9C: .4byte gUnknown_203B15C
_08135AA0: .4byte 0x0000fffc
	thumb_func_end sub_81358DC

	thumb_func_start sub_8135AA4
sub_8135AA4: @ 8135AA4
	push {lr}
	ldr r0, _08135AC0 @ =gUnknown_203B140
	ldr r2, [r0]
	ldr r3, _08135AC4 @ =0x00003224
	adds r1, r2, r3
	ldrb r1, [r1]
	adds r3, r0, 0
	cmp r1, 0x1
	bne _08135ACC
	ldr r1, _08135AC8 @ =0x00003214
	adds r0, r2, r1
	ldrb r0, [r0]
	subs r0, 0x1
	b _08135AD4
	.align 2, 0
_08135AC0: .4byte gUnknown_203B140
_08135AC4: .4byte 0x00003224
_08135AC8: .4byte 0x00003214
_08135ACC:
	ldr r1, _08135AE8 @ =0x00003214
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r0, 0x1
_08135AD4:
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08135B00
	cmp r0, 0x1
	bgt _08135AEC
	cmp r0, 0
	beq _08135AF6
	b _08135B82
	.align 2, 0
_08135AE8: .4byte 0x00003214
_08135AEC:
	cmp r0, 0x2
	beq _08135B38
	cmp r0, 0x3
	beq _08135B70
	b _08135B82
_08135AF6:
	ldr r0, [r3]
	movs r2, 0xC9
	lsls r2, 6
	adds r0, r2
	b _08135B5E
_08135B00:
	ldr r1, [r3]
	ldr r3, _08135B18 @ =0x00003224
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08135B24
	ldr r2, _08135B1C @ =0x0000323c
	adds r0, r1, r2
	ldrb r0, [r0]
	ldr r1, _08135B20 @ =gUnknown_8E9B950
	b _08135B62
	.align 2, 0
_08135B18: .4byte 0x00003224
_08135B1C: .4byte 0x0000323c
_08135B20: .4byte gUnknown_8E9B950
_08135B24:
	ldr r3, _08135B30 @ =0x0000323c
	adds r0, r1, r3
	ldrb r0, [r0]
	ldr r1, _08135B34 @ =gUnknown_8E9B598
	b _08135B62
	.align 2, 0
_08135B30: .4byte 0x0000323c
_08135B34: .4byte gUnknown_8E9B598
_08135B38:
	ldr r1, [r3]
	ldr r2, _08135B50 @ =0x00003224
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08135B58
	movs r3, 0xC9
	lsls r3, 6
	adds r0, r1, r3
	ldrb r0, [r0]
	ldr r1, _08135B54 @ =gUnknown_8E9BA9C
	b _08135B62
	.align 2, 0
_08135B50: .4byte 0x00003224
_08135B54: .4byte gUnknown_8E9BA9C
_08135B58:
	movs r2, 0xC9
	lsls r2, 6
	adds r0, r1, r2
_08135B5E:
	ldrb r0, [r0]
	ldr r1, _08135B6C @ =gUnknown_8E9B750
_08135B62:
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	b _08135B82
	.align 2, 0
_08135B6C: .4byte gUnknown_8E9B750
_08135B70:
	ldr r0, [r3]
	ldr r3, _08135B88 @ =0x0000323c
	adds r0, r3
	ldrb r0, [r0]
	ldr r1, _08135B8C @ =gUnknown_8E9B950
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
_08135B82:
	pop {r0}
	bx r0
	.align 2, 0
_08135B88: .4byte 0x0000323c
_08135B8C: .4byte gUnknown_8E9B950
	thumb_func_end sub_8135AA4

	thumb_func_start sub_8135B90
sub_8135B90: @ 8135B90
	push {lr}
	ldr r0, _08135BAC @ =gUnknown_203B140
	ldr r2, [r0]
	ldr r3, _08135BB0 @ =0x00003224
	adds r1, r2, r3
	ldrb r1, [r1]
	adds r3, r0, 0
	cmp r1, 0x1
	bne _08135BB8
	ldr r1, _08135BB4 @ =0x00003214
	adds r0, r2, r1
	ldrb r0, [r0]
	subs r0, 0x1
	b _08135BC0
	.align 2, 0
_08135BAC: .4byte gUnknown_203B140
_08135BB0: .4byte 0x00003224
_08135BB4: .4byte 0x00003214
_08135BB8:
	ldr r1, _08135BD4 @ =0x00003214
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r0, 0x1
_08135BC0:
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08135C2C
	cmp r0, 0x1
	bgt _08135BD8
	cmp r0, 0
	beq _08135BE2
	b _08135C2C
	.align 2, 0
_08135BD4: .4byte 0x00003214
_08135BD8:
	cmp r0, 0x2
	beq _08135BF4
	cmp r0, 0x3
	beq _08135C20
	b _08135C2C
_08135BE2:
	ldr r0, [r3]
	movs r3, 0xC9
	lsls r3, 6
	adds r0, r3
	ldrb r0, [r0]
	ldr r1, _08135BF0 @ =gUnknown_8E9B750
	b _08135C10
	.align 2, 0
_08135BF0: .4byte gUnknown_8E9B750
_08135BF4:
	ldr r0, [r3]
	ldr r1, _08135C04 @ =0x00003224
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08135C0C
	ldr r1, _08135C08 @ =gUnknown_8463C80
	b _08135C0E
	.align 2, 0
_08135C04: .4byte 0x00003224
_08135C08: .4byte gUnknown_8463C80
_08135C0C:
	ldr r1, _08135C1C @ =gUnknown_8463B88
_08135C0E:
	movs r0, 0x3
_08135C10:
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	b _08135C2C
	.align 2, 0
_08135C1C: .4byte gUnknown_8463B88
_08135C20:
	ldr r1, _08135C30 @ =gUnknown_8463B88
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
_08135C2C:
	pop {r0}
	bx r0
	.align 2, 0
_08135C30: .4byte gUnknown_8463B88
	thumb_func_end sub_8135B90

	thumb_func_start sub_8135C34
sub_8135C34: @ 8135C34
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08135C54 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _08135C58 @ =0x00003274
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xF
	bls _08135C48
	b _08135EF6
_08135C48:
	lsls r0, 2
	ldr r1, _08135C5C @ =_08135C60
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08135C54: .4byte gUnknown_203B140
_08135C58: .4byte 0x00003274
_08135C5C: .4byte _08135C60
	.align 2, 0
_08135C60:
	.4byte _08135CA0
	.4byte _08135CA6
	.4byte _08135CAC
	.4byte _08135CB2
	.4byte _08135CB8
	.4byte _08135CBE
	.4byte _08135CC4
	.4byte _08135CD2
	.4byte _08135CD8
	.4byte _08135CDE
	.4byte _08135CE8
	.4byte _08135D30
	.4byte _08135DC4
	.4byte _08135DEC
	.4byte _08135E80
	.4byte _08135E9A
_08135CA0:
	bl sub_81381AC
	b _08135F00
_08135CA6:
	bl sub_8136BC4
	b _08135F00
_08135CAC:
	bl sub_8136BAC
	b _08135F00
_08135CB2:
	bl sub_8135F20
	b _08135CC8
_08135CB8:
	bl sub_8136AEC
	b _08135CC8
_08135CBE:
	bl sub_81381D0
	b _08135F00
_08135CC4:
	bl sub_8136040
_08135CC8:
	lsls r0, 24
	cmp r0, 0
	bne _08135CD0
	b _08135F0E
_08135CD0:
	b _08135F00
_08135CD2:
	bl sub_8136F4C
	b _08135F00
_08135CD8:
	bl sub_81374E8
	b _08135F00
_08135CDE:
	bl sub_8137BD0
	bl sub_8138A38
	b _08135F00
_08135CE8:
	ldr r0, _08135D0C @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r2, _08135D10 @ =0x00003208
	adds r0, r2
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08135D18
	ldr r1, _08135D14 @ =gUnknown_8463C80
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	b _08135D24
	.align 2, 0
_08135D0C: .4byte gUnknown_203B140
_08135D10: .4byte 0x00003208
_08135D14: .4byte gUnknown_8463C80
_08135D18:
	ldr r1, _08135D2C @ =gUnknown_8463B88
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
_08135D24:
	bl sub_8138538
	b _08135F00
	.align 2, 0
_08135D2C: .4byte gUnknown_8463B88
_08135D30:
	ldr r4, _08135D4C @ =gUnknown_203B140
	ldr r1, [r4]
	movs r2, 0xC8
	lsls r2, 6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _08135D54
	adds r2, 0x3C
	adds r0, r1, r2
	ldrb r0, [r0]
	ldr r1, _08135D50 @ =gUnknown_8E9BBCC
	b _08135DAC
	.align 2, 0
_08135D4C: .4byte gUnknown_203B140
_08135D50: .4byte gUnknown_8E9BBCC
_08135D54:
	ldr r2, _08135D84 @ =0x00003208
	adds r0, r1, r2
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08135D90
	adds r2, 0x34
	adds r0, r1, r2
	ldrb r0, [r0]
	ldr r1, _08135D88 @ =gUnknown_8E9B950
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r0, [r4]
	movs r1, 0xC9
	lsls r1, 6
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, _08135D8C @ =gUnknown_8E9BA9C
	b _08135DAC
	.align 2, 0
_08135D84: .4byte 0x00003208
_08135D88: .4byte gUnknown_8E9B950
_08135D8C: .4byte gUnknown_8E9BA9C
_08135D90:
	ldr r2, _08135DB8 @ =0x0000323c
	adds r0, r1, r2
	ldrb r0, [r0]
	ldr r1, _08135DBC @ =gUnknown_8E9B598
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r0, [r4]
	movs r1, 0xC9
	lsls r1, 6
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, _08135DC0 @ =gUnknown_8E9B750
_08135DAC:
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	b _08135F00
	.align 2, 0
_08135DB8: .4byte 0x0000323c
_08135DBC: .4byte gUnknown_8E9B598
_08135DC0: .4byte gUnknown_8E9B750
_08135DC4:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	ldr r0, _08135DE4 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r2, _08135DE8 @ =0x00003214
	adds r0, r2
	ldrb r0, [r0]
	bl sub_8137D28
	bl sub_8137E28
	b _08135F00
	.align 2, 0
_08135DE4: .4byte gUnknown_203B140
_08135DE8: .4byte 0x00003214
_08135DEC:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r4, _08135E64 @ =gUnknown_203B140
	ldr r0, [r4]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, _08135E68 @ =0x00003001
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r1, _08135E6C @ =0x00003002
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, _08135E70 @ =0x00003006
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r1, _08135E74 @ =0x00003003
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, _08135E78 @ =0x00003004
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r1, _08135E7C @ =0x00003005
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	b _08135F00
	.align 2, 0
_08135E64: .4byte gUnknown_203B140
_08135E68: .4byte 0x00003001
_08135E6C: .4byte 0x00003002
_08135E70: .4byte 0x00003006
_08135E74: .4byte 0x00003003
_08135E78: .4byte 0x00003004
_08135E7C: .4byte 0x00003005
_08135E80:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	b _08135F00
_08135E9A:
	ldr r0, _08135EBC @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r2, _08135EC0 @ =0x00003208
	adds r0, r2
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08135EC4
	movs r0, 0
	bl sub_8139EE4
	movs r0, 0
	bl sub_813A0E8
	b _08135EE2
	.align 2, 0
_08135EBC: .4byte gUnknown_203B140
_08135EC0: .4byte 0x00003208
_08135EC4:
	movs r0, 0
	bl sub_8139C44
	movs r0, 0
	bl sub_813B084
	movs r0, 0
	bl sub_8139D54
	movs r0, 0
	bl sub_813A838
	movs r0, 0
	bl sub_813AB70
_08135EE2:
	movs r0, 0
	bl sub_813A3B8
	movs r0, 0
	bl sub_813ACF8
	movs r0, 0
	bl sub_813AEB0
	b _08135F00
_08135EF6:
	bl sub_81381C0
	bl sub_8136D54
	b _08135F0E
_08135F00:
	ldr r0, _08135F18 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r0, _08135F1C @ =0x00003274
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08135F0E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08135F18: .4byte gUnknown_203B140
_08135F1C: .4byte 0x00003274
	thumb_func_end sub_8135C34

	thumb_func_start sub_8135F20
sub_8135F20: @ 8135F20
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _08135F3C @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _08135F40 @ =0x00003278
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x6
	bhi _0813600E
	lsls r0, 2
	ldr r1, _08135F44 @ =_08135F48
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08135F3C: .4byte gUnknown_203B140
_08135F40: .4byte 0x00003278
_08135F44: .4byte _08135F48
	.align 2, 0
_08135F48:
	.4byte _08135F64
	.4byte _08135FCC
	.4byte _08135FE4
	.4byte _08135FEA
	.4byte _08136000
	.4byte _08136020
	.4byte _08136020
_08135F64:
	ldr r4, _08135FA8 @ =gUnknown_8E9B310
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xA0
	bl LoadPalette
	ldr r5, _08135FAC @ =gUnknown_203B140
	ldr r0, [r5]
	ldr r1, _08135FB0 @ =0x00003290
	adds r0, r1
	bl IsMonShiny
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08135FB4
	ldr r0, [r5]
	movs r1, 0xC8
	lsls r1, 6
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08135FB4
	adds r0, r4, 0
	adds r0, 0xC0
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r4, 0
	adds r0, 0xA0
	movs r1, 0x10
	b _08135FD8
	.align 2, 0
_08135FA8: .4byte gUnknown_8E9B310
_08135FAC: .4byte gUnknown_203B140
_08135FB0: .4byte 0x00003290
_08135FB4:
	ldr r4, _08135FC8 @ =gUnknown_8E9B310
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	adds r4, 0x20
	adds r0, r4, 0
	movs r1, 0x10
	b _08135FD8
	.align 2, 0
_08135FC8: .4byte gUnknown_8E9B310
_08135FCC:
	movs r0, 0x60
	movs r1, 0x1
	bl sub_8107D38
	ldr r0, _08135FE0 @ =gUnknown_84636C0
	movs r1, 0x70
_08135FD8:
	movs r2, 0x20
	bl LoadPalette
	b _08136020
	.align 2, 0
_08135FE0: .4byte gUnknown_84636C0
_08135FE4:
	bl ResetTempTileDataBuffers
	b _08136020
_08135FEA:
	ldr r1, _08135FFC @ =gUnknown_8E9A460
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	b _08136020
	.align 2, 0
_08135FFC: .4byte gUnknown_8E9A460
_08136000:
	bl FreeTempTileDataBuffersIfPossible
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08136020
	b _0813602E
_0813600E:
	ldr r0, _0813601C @ =gUnknown_8463700
	movs r1, 0x80
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0x1
	b _08136030
	.align 2, 0
_0813601C: .4byte gUnknown_8463700
_08136020:
	ldr r0, _08136038 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r0, _0813603C @ =0x00003278
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0813602E:
	movs r0, 0
_08136030:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08136038: .4byte gUnknown_203B140
_0813603C: .4byte 0x00003278
	thumb_func_end sub_8135F20

	thumb_func_start sub_8136040
sub_8136040: @ 8136040
	push {r4-r6,lr}
	ldr r1, _08136060 @ =gUnknown_203B140
	ldr r2, [r1]
	movs r6, 0xCA
	lsls r6, 6
	adds r0, r2, r6
	ldrb r4, [r0]
	adds r5, r1, 0
	cmp r4, 0x1
	beq _08136084
	cmp r4, 0x1
	bgt _08136064
	cmp r4, 0
	beq _0813606A
	b _081360A8
	.align 2, 0
_08136060: .4byte gUnknown_203B140
_08136064:
	cmp r4, 0x2
	beq _08136096
	b _081360A8
_0813606A:
	bl sub_81360D4
	ldr r1, [r5]
	movs r2, 0xC8
	lsls r2, 6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _081360B8
	adds r0, r1, r6
	strb r4, [r0]
	movs r0, 0x1
	b _081360CA
_08136084:
	movs r1, 0xC8
	lsls r1, 6
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _081360B8
	bl sub_8136350
	b _081360B8
_08136096:
	movs r1, 0xC8
	lsls r1, 6
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _081360B8
	bl sub_81367B0
	b _081360B8
_081360A8:
	ldr r0, [r5]
	movs r2, 0xCA
	lsls r2, 6
	adds r0, r2
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _081360CA
_081360B8:
	ldr r0, _081360D0 @ =gUnknown_203B140
	ldr r1, [r0]
	movs r0, 0xCA
	lsls r0, 6
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
_081360CA:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081360D0: .4byte gUnknown_203B140
	thumb_func_end sub_8136040

	thumb_func_start sub_81360D4
sub_81360D4: @ 81360D4
	push {r4-r7,lr}
	sub sp, 0x14
	ldr r5, _08136108 @ =gUnknown_203B140
	ldr r0, [r5]
	ldr r1, _0813610C @ =0x00003290
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl SpeciesToPokedexNum
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _08136110 @ =0x0000ffff
	cmp r4, r0
	bne _0813611C
	ldr r0, [r5]
	ldr r2, _08136114 @ =0x00003064
	adds r0, r2
	ldr r1, _08136118 @ =gUnknown_8416202
	bl StringCopy
	b _0813612C
	.align 2, 0
_08136108: .4byte gUnknown_203B140
_0813610C: .4byte 0x00003290
_08136110: .4byte 0x0000ffff
_08136114: .4byte 0x00003064
_08136118: .4byte gUnknown_8416202
_0813611C:
	ldr r0, [r5]
	ldr r3, _08136154 @ =0x00003064
	adds r0, r3
	adds r1, r4, 0
	movs r2, 0x2
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
_0813612C:
	ldr r0, _08136158 @ =gUnknown_203B144
	ldr r1, [r0]
	movs r0, 0
	strh r0, [r1]
	ldr r6, _0813615C @ =gUnknown_203B140
	ldr r2, [r6]
	movs r1, 0xC8
	lsls r1, 6
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08136168
	ldr r3, _08136160 @ =0x00003290
	adds r0, r2, r3
	ldr r1, _08136164 @ =0x00003028
	adds r2, r1
	movs r1, 0x2
	bl GetMonData
	b _08136342
	.align 2, 0
_08136154: .4byte 0x00003064
_08136158: .4byte gUnknown_203B144
_0813615C: .4byte gUnknown_203B140
_08136160: .4byte 0x00003290
_08136164: .4byte 0x00003028
_08136168:
	ldr r5, _081361F0 @ =0x00003290
	adds r0, r2, r5
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, [r6]
	ldr r2, _081361F4 @ =0x00003028
	adds r0, r2
	adds r1, r4, 0
	bl GetSpeciesName
	ldr r1, [r6]
	ldr r2, _081361F8 @ =gBaseStats
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x6]
	ldr r3, _081361FC @ =0x00003220
	adds r1, r3
	strb r2, [r1]
	ldr r1, [r6]
	ldrb r0, [r0, 0x7]
	ldr r2, _08136200 @ =0x00003221
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r5
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, [r6]
	ldr r4, _08136204 @ =0x00003034
	adds r0, r4
	mov r1, sp
	movs r2, 0xA
	bl StringCopyN_Multibyte
	ldr r0, [r6]
	adds r0, r4
	bl StringGetEnd10
	ldr r0, [r6]
	adds r0, r5
	bl GetMonGender
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, [r6]
	adds r0, r5
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r7, 0xFE
	bne _08136210
	ldr r0, [r6]
	ldr r3, _08136208 @ =0x00003084
	adds r0, r3
	ldr r1, _0813620C @ =gUnknown_8416221
	bl StringCopy
	b _08136238
	.align 2, 0
_081361F0: .4byte 0x00003290
_081361F4: .4byte 0x00003028
_081361F8: .4byte gBaseStats
_081361FC: .4byte 0x00003220
_08136200: .4byte 0x00003221
_08136204: .4byte 0x00003034
_08136208: .4byte 0x00003084
_0813620C: .4byte gUnknown_8416221
_08136210:
	cmp r7, 0
	bne _0813622C
	ldr r0, [r6]
	ldr r1, _08136224 @ =0x00003084
	adds r0, r1
	ldr r1, _08136228 @ =gUnknown_841621F
	bl StringCopy
	b _08136238
	.align 2, 0
_08136224: .4byte 0x00003084
_08136228: .4byte gUnknown_841621F
_0813622C:
	ldr r0, [r6]
	ldr r2, _08136308 @ =0x00003084
	adds r0, r2
	ldr r1, _0813630C @ =gString_Dummy
	bl StringCopy
_08136238:
	cmp r4, 0x20
	beq _08136240
	cmp r4, 0x1D
	bne _08136264
_08136240:
	ldr r5, _08136310 @ =gUnknown_203B140
	ldr r0, [r5]
	ldr r3, _08136314 @ =0x00003034
	adds r0, r3
	movs r1, 0xB
	muls r1, r4
	ldr r2, _08136318 @ =gSpeciesNames
	adds r1, r2
	bl StringCompare
	cmp r0, 0
	bne _08136264
	ldr r0, [r5]
	ldr r1, _08136308 @ =0x00003084
	adds r0, r1
	ldr r1, _0813630C @ =gString_Dummy
	bl StringCopy
_08136264:
	ldr r6, _08136310 @ =gUnknown_203B140
	ldr r0, [r6]
	ldr r5, _0813631C @ =0x00003290
	adds r0, r5
	movs r1, 0x7
	mov r2, sp
	bl GetMonData
	ldr r0, [r6]
	movs r4, 0xC1
	lsls r4, 6
	adds r0, r4
	mov r1, sp
	movs r2, 0x7
	bl StringCopyN_Multibyte
	ldr r0, [r6]
	adds r4, r0, r4
	adds r0, r5
	movs r1, 0x3
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ConvertInternationalString
	ldr r0, [r6]
	adds r0, r5
	movs r1, 0x1
	bl GetMonData
	ldr r1, _08136320 @ =0x0000ffff
	ands r1, r0
	ldr r0, [r6]
	ldr r2, _08136324 @ =0x0000306c
	adds r0, r2
	movs r2, 0x2
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r0, r5
	movs r1, 0x38
	bl GetMonData
	adds r1, r0, 0
	mov r0, sp
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	ldr r4, _08136328 @ =0x00003088
	adds r0, r4
	ldr r1, _0813632C @ =gText_Lv
	bl StringCopy
	ldr r0, [r6]
	adds r0, r4
	mov r1, sp
	movs r2, 0x4
	bl StringAppendN
	ldr r0, [r6]
	adds r0, r5
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _08136338
	ldr r0, [r6]
	ldr r3, _08136330 @ =0x00003074
	adds r0, r3
	ldr r1, _08136334 @ =gUnknown_84161EF
	bl StringCopy
	b _08136342
	.align 2, 0
_08136308: .4byte 0x00003084
_0813630C: .4byte gString_Dummy
_08136310: .4byte gUnknown_203B140
_08136314: .4byte 0x00003034
_08136318: .4byte gSpeciesNames
_0813631C: .4byte 0x00003290
_08136320: .4byte 0x0000ffff
_08136324: .4byte 0x0000306c
_08136328: .4byte 0x00003088
_0813632C: .4byte gText_Lv
_08136330: .4byte 0x00003074
_08136334: .4byte gUnknown_84161EF
_08136338:
	ldr r1, [r6]
	ldr r2, _0813634C @ =0x00003074
	adds r1, r2
	bl CopyItemName
_08136342:
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813634C: .4byte 0x00003074
	thumb_func_end sub_81360D4

	thumb_func_start sub_8136350
sub_8136350: @ 8136350
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	ldr r6, _081364F8 @ =gUnknown_203B140
	ldr r0, [r6]
	ldr r7, _081364FC @ =0x00003290
	adds r0, r7
	movs r1, 0x39
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [r6]
	ldr r4, _08136500 @ =0x00003090
	adds r0, r4
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r0, r4
	ldr r1, _08136504 @ =gUnknown_841620C
	bl StringAppend
	ldr r0, [r6]
	adds r0, r7
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r0, sp
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r0, r4
	mov r1, sp
	bl StringAppend
	ldr r0, [r6]
	adds r0, r4
	bl StringLength
	ldr r1, _08136508 @ =gUnknown_203B144
	mov r8, r1
	ldr r2, [r1]
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	movs r0, 0x3F
	subs r0, r1
	strh r0, [r2, 0x2]
	ldr r2, [r6]
	ldr r1, _0813650C @ =0x000032f8
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, _08136510 @ =sub_804CF14
	cmp r1, r0
	beq _081363DA
	b _08136518
_081363DA:
	ldr r1, _08136514 @ =0x00003024
	adds r0, r2, r1
	ldr r0, [r0]
	cmp r0, 0x1
	beq _081363E6
	b _08136518
_081363E6:
	adds r0, r2, r7
	movs r1, 0x54
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, [r6]
	adds r4, 0xC
	adds r0, r4
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r0, r4
	bl StringLength
	mov r1, r8
	ldr r2, [r1]
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	movs r5, 0x1B
	subs r1, r5, r1
	strh r1, [r2, 0x4]
	ldr r0, [r6]
	adds r0, r7
	movs r1, 0x55
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, [r6]
	adds r4, 0x5
	adds r0, r4
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r0, r4
	bl StringLength
	mov r1, r8
	ldr r2, [r1]
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	subs r1, r5, r1
	strh r1, [r2, 0x6]
	ldr r0, [r6]
	adds r0, r7
	movs r1, 0x57
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, [r6]
	adds r4, 0x5
	adds r0, r4
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r0, r4
	bl StringLength
	mov r1, r8
	ldr r2, [r1]
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	subs r1, r5, r1
	strh r1, [r2, 0x8]
	ldr r0, [r6]
	adds r0, r7
	movs r1, 0x58
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, [r6]
	adds r4, 0x5
	adds r0, r4
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r0, r4
	bl StringLength
	mov r1, r8
	ldr r2, [r1]
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	subs r1, r5, r1
	strh r1, [r2, 0xA]
	ldr r0, [r6]
	adds r0, r7
	movs r1, 0x56
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, [r6]
	adds r4, 0x5
	adds r0, r4
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r0, r4
	bl StringLength
	mov r1, r8
	ldr r2, [r1]
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	subs r5, r1
	strh r5, [r2, 0xC]
	b _08136630
	.align 2, 0
_081364F8: .4byte gUnknown_203B140
_081364FC: .4byte 0x00003290
_08136500: .4byte 0x00003090
_08136504: .4byte gUnknown_841620C
_08136508: .4byte gUnknown_203B144
_0813650C: .4byte 0x000032f8
_08136510: .4byte sub_804CF14
_08136514: .4byte 0x00003024
_08136518:
	ldr r4, _0813677C @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r2, _08136780 @ =0x00003290
	mov r9, r2
	add r0, r9
	movs r1, 0x3B
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, [r4]
	ldr r5, _08136784 @ =0x0000309c
	adds r0, r5
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, [r4]
	adds r0, r5
	bl StringLength
	ldr r1, _08136788 @ =gUnknown_203B144
	mov r8, r1
	ldr r2, [r1]
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	movs r6, 0x1B
	subs r1, r6, r1
	strh r1, [r2, 0x4]
	ldr r0, [r4]
	add r0, r9
	movs r1, 0x3C
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, [r4]
	adds r5, 0x5
	adds r0, r5
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, [r4]
	adds r0, r5
	bl StringLength
	mov r1, r8
	ldr r2, [r1]
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	subs r1, r6, r1
	strh r1, [r2, 0x6]
	ldr r0, [r4]
	add r0, r9
	movs r1, 0x3E
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, [r4]
	adds r5, 0x5
	adds r0, r5
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, [r4]
	adds r0, r5
	bl StringLength
	mov r1, r8
	ldr r2, [r1]
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	subs r1, r6, r1
	strh r1, [r2, 0x8]
	ldr r0, [r4]
	add r0, r9
	movs r1, 0x3F
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, [r4]
	adds r5, 0x5
	adds r0, r5
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, [r4]
	adds r0, r5
	bl StringLength
	mov r1, r8
	ldr r2, [r1]
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	subs r1, r6, r1
	strh r1, [r2, 0xA]
	ldr r0, [r4]
	add r0, r9
	movs r1, 0x3D
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, [r4]
	adds r5, 0x5
	adds r0, r5
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, [r4]
	adds r0, r5
	bl StringLength
	mov r1, r8
	ldr r2, [r1]
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	subs r6, r1
	strh r6, [r2, 0xC]
_08136630:
	ldr r6, _0813677C @ =gUnknown_203B140
	ldr r0, [r6]
	ldr r2, _08136780 @ =0x00003290
	mov r8, r2
	add r0, r8
	movs r1, 0x19
	bl GetMonData
	adds r7, r0, 0
	ldr r0, [r6]
	ldr r4, _0813678C @ =0x000031a4
	adds r0, r4
	adds r1, r7, 0
	movs r2, 0
	movs r3, 0x7
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r0, r4
	bl StringLength
	ldr r1, _08136788 @ =gUnknown_203B144
	mov r10, r1
	ldr r2, [r1]
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	movs r0, 0x3F
	mov r9, r0
	mov r0, r9
	subs r1, r0, r1
	strh r1, [r2, 0xE]
	ldr r0, [r6]
	add r0, r8
	movs r1, 0x38
	bl GetMonData
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0
	cmp r5, 0x63
	bhi _081366B8
	ldr r0, [r6]
	ldr r1, _08136780 @ =0x00003290
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _08136790 @ =gExperienceTables
	adds r2, r5, 0x1
	lsls r2, 2
	ldr r3, _08136794 @ =gBaseStats
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r1, [r1, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r1
	adds r2, r0
	adds r2, r4
	ldr r0, [r2]
	subs r1, r0, r7
_081366B8:
	ldr r0, [r6]
	ldr r4, _08136798 @ =0x000031b0
	adds r0, r4
	movs r2, 0
	movs r3, 0x7
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r0, r4
	bl StringLength
	mov r1, r10
	ldr r2, [r1]
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	mov r0, r9
	subs r1, r0, r1
	strh r1, [r2, 0x10]
	ldr r0, [r6]
	add r0, r8
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, [r6]
	add r0, r8
	movs r1, 0x2E
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetAbilityBySpecies
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, [r6]
	ldr r1, _0813679C @ =0x000031bc
	adds r0, r1
	movs r1, 0xD
	muls r1, r4
	ldr r2, _081367A0 @ =gAbilityNames
	adds r1, r2
	bl StringCopy
	ldr r0, [r6]
	ldr r2, _081367A4 @ =0x000031cc
	adds r0, r2
	ldr r1, _081367A8 @ =gAbilityDescriptionPointers
	lsls r4, 2
	adds r4, r1
	ldr r1, [r4]
	bl StringCopy
	ldr r0, [r6]
	add r0, r8
	movs r1, 0x37
	bl GetMonData
	bl sub_8138C5C
	ldr r1, [r6]
	ldr r4, _081367AC @ =0x0000326c
	adds r1, r4
	strb r0, [r1]
	ldr r1, [r6]
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0813676A
	mov r2, r8
	adds r0, r1, r2
	movs r1, 0
	bl CheckPartyPokerus
	lsls r0, 24
	cmp r0, 0
	beq _0813676A
	ldr r0, [r6]
	adds r0, r4
	movs r1, 0x6
	strb r1, [r0]
_0813676A:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813677C: .4byte gUnknown_203B140
_08136780: .4byte 0x00003290
_08136784: .4byte 0x0000309c
_08136788: .4byte gUnknown_203B144
_0813678C: .4byte 0x000031a4
_08136790: .4byte gExperienceTables
_08136794: .4byte gBaseStats
_08136798: .4byte 0x000031b0
_0813679C: .4byte 0x000031bc
_081367A0: .4byte gAbilityNames
_081367A4: .4byte 0x000031cc
_081367A8: .4byte gAbilityDescriptionPointers
_081367AC: .4byte 0x0000326c
	thumb_func_end sub_8136350

	thumb_func_start sub_81367B0
sub_81367B0: @ 81367B0
	push {r4,lr}
	movs r4, 0
_081367B4:
	adds r0, r4, 0
	bl sub_81367E8
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _081367B4
	ldr r0, _081367E0 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _081367E4 @ =0x00003208
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _081367D8
	movs r0, 0x4
	bl sub_81367E8
_081367D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081367E0: .4byte gUnknown_203B140
_081367E4: .4byte 0x00003208
	thumb_func_end sub_81367B0

	thumb_func_start sub_81367E8
sub_81367E8: @ 81367E8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x3
	bhi _08136812
	ldr r4, _08136884 @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r1, _08136888 @ =0x00003290
	adds r0, r1
	adds r1, r7, 0
	bl sub_8138BEC
	ldr r1, [r4]
	lsls r2, r7, 1
	ldr r3, _0813688C @ =0x00003258
	adds r1, r3
	adds r1, r2
	strh r0, [r1]
_08136812:
	ldr r6, _08136884 @ =gUnknown_203B140
	ldr r2, [r6]
	lsls r0, r7, 1
	ldr r4, _0813688C @ =0x00003258
	mov r8, r4
	adds r1, r2, r4
	adds r1, r0
	ldrh r1, [r1]
	mov r9, r0
	cmp r1, 0
	bne _081368B0
	movs r0, 0xD
	muls r0, r7
	ldr r1, _08136890 @ =0x00003128
	adds r0, r1
	adds r0, r2, r0
	ldr r1, _08136894 @ =gUnknown_841620E
	bl StringCopy
	movs r0, 0xB
	adds r1, r7, 0
	muls r1, r0
	ldr r2, _08136898 @ =0x000030b8
	adds r1, r2
	ldr r0, [r6]
	adds r0, r1
	ldr r1, _0813689C @ =gUnknown_8416210
	bl StringCopy
	lsls r4, r7, 2
	adds r4, r7
	ldr r3, _081368A0 @ =0x0000316c
	adds r1, r4, r3
	ldr r0, [r6]
	adds r0, r1
	ldr r5, _081368A4 @ =gText_ThreeHyphens
	adds r1, r5, 0
	bl StringCopy
	ldr r0, _081368A8 @ =0x00003188
	adds r4, r0
	ldr r0, [r6]
	adds r0, r4
	adds r1, r5, 0
	bl StringCopy
	ldr r0, _081368AC @ =gUnknown_203B144
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x12
	add r0, r9
	movs r2, 0xFF
	strh r2, [r0]
	adds r1, 0x1C
	add r1, r9
	strh r2, [r1]
	b _08136ADA
	.align 2, 0
_08136884: .4byte gUnknown_203B140
_08136888: .4byte 0x00003290
_0813688C: .4byte 0x00003258
_08136890: .4byte 0x00003128
_08136894: .4byte gUnknown_841620E
_08136898: .4byte 0x000030b8
_0813689C: .4byte gUnknown_8416210
_081368A0: .4byte 0x0000316c
_081368A4: .4byte gText_ThreeHyphens
_081368A8: .4byte 0x00003188
_081368AC: .4byte gUnknown_203B144
_081368B0:
	ldr r3, _08136948 @ =0x00003264
	adds r1, r2, r3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r6]
	ldr r1, _0813694C @ =0x0000324e
	adds r4, r0, r1
	add r4, r9
	ldr r5, _08136950 @ =gBattleMoves
	ldr r2, _08136954 @ =0x00003258
	adds r3, r0, r2
	add r3, r9
	ldrh r2, [r3]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	ldrb r1, [r1, 0x2]
	strh r1, [r4]
	movs r2, 0xD
	adds r1, r7, 0
	muls r1, r2
	ldr r4, _08136958 @ =0x00003128
	adds r1, r4
	adds r0, r1
	ldrh r1, [r3]
	muls r1, r2
	ldr r2, _0813695C @ =gMoveNames
	adds r1, r2
	bl StringCopy
	cmp r7, 0x3
	bls _0813696C
	ldr r1, [r6]
	ldr r2, _08136960 @ =0x00003208
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0813696C
	movs r0, 0xB
	adds r4, r7, 0
	muls r4, r0
	ldr r3, _08136964 @ =0x000030b8
	adds r0, r4, r3
	adds r0, r1, r0
	add r1, r8
	add r1, r9
	ldrh r2, [r1]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	ldrb r1, [r1, 0x4]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _08136968 @ =0x000030f0
	adds r4, r0
	ldr r0, [r6]
	adds r4, r0, r4
	add r0, r8
	add r0, r9
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x4]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	b _081369D0
	.align 2, 0
_08136948: .4byte 0x00003264
_0813694C: .4byte 0x0000324e
_08136950: .4byte gBattleMoves
_08136954: .4byte 0x00003258
_08136958: .4byte 0x00003128
_0813695C: .4byte gMoveNames
_08136960: .4byte 0x00003208
_08136964: .4byte 0x000030b8
_08136968: .4byte 0x000030f0
_0813696C:
	ldr r1, _08136A4C @ =gUnknown_203B140
	mov r8, r1
	movs r0, 0xB
	adds r5, r7, 0
	muls r5, r0
	ldr r2, _08136A50 @ =0x000030b8
	adds r4, r5, r2
	ldr r0, [r1]
	adds r4, r0, r4
	ldr r6, _08136A54 @ =0x00003290
	adds r0, r6
	adds r1, r7, 0
	bl sub_8138C24
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r3, _08136A58 @ =0x000030f0
	adds r5, r3
	mov r4, r8
	ldr r0, [r4]
	adds r5, r0, r5
	ldr r2, _08136A5C @ =0x00003258
	adds r1, r0, r2
	add r1, r9
	ldrh r4, [r1]
	adds r0, r6
	movs r1, 0x15
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	adds r2, r7, 0
	bl CalculatePPWithBonus
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
_081369D0:
	ldr r6, _08136A4C @ =gUnknown_203B140
	movs r0, 0xB
	adds r5, r7, 0
	muls r5, r0
	ldr r3, _08136A50 @ =0x000030b8
	adds r1, r5, r3
	ldr r0, [r6]
	adds r0, r1
	bl StringLength
	ldr r4, _08136A60 @ =gUnknown_203B144
	mov r8, r4
	ldr r2, [r4]
	adds r2, 0x12
	add r2, r9
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	movs r4, 0xC
	subs r1, r4, r1
	strh r1, [r2]
	ldr r0, _08136A58 @ =0x000030f0
	adds r5, r0
	ldr r0, [r6]
	adds r0, r5
	bl StringLength
	mov r1, r8
	ldr r2, [r1]
	adds r2, 0x1C
	add r2, r9
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	subs r4, r1
	strh r4, [r2]
	ldr r2, _08136A64 @ =gBattleMoves
	ldr r6, [r6]
	ldr r3, _08136A5C @ =0x00003258
	adds r0, r6, r3
	add r0, r9
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrb r0, [r1, 0x1]
	cmp r0, 0x1
	bhi _08136A70
	lsls r4, r7, 2
	adds r0, r4, r7
	ldr r1, _08136A68 @ =0x0000316c
	adds r0, r1
	adds r0, r6, r0
	ldr r1, _08136A6C @ =gText_ThreeHyphens
	bl StringCopy
	b _08136A84
	.align 2, 0
_08136A4C: .4byte gUnknown_203B140
_08136A50: .4byte 0x000030b8
_08136A54: .4byte 0x00003290
_08136A58: .4byte 0x000030f0
_08136A5C: .4byte 0x00003258
_08136A60: .4byte gUnknown_203B144
_08136A64: .4byte gBattleMoves
_08136A68: .4byte 0x0000316c
_08136A6C: .4byte gText_ThreeHyphens
_08136A70:
	lsls r4, r7, 2
	adds r0, r4, r7
	ldr r2, _08136AB0 @ =0x0000316c
	adds r0, r2
	adds r0, r6, r0
	ldrb r1, [r1, 0x1]
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
_08136A84:
	ldr r2, _08136AB4 @ =gBattleMoves
	ldr r0, _08136AB8 @ =gUnknown_203B140
	ldr r3, [r0]
	ldr r1, _08136ABC @ =0x00003258
	adds r0, r3, r1
	add r0, r9
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrb r0, [r1, 0x3]
	cmp r0, 0
	bne _08136AC8
	adds r0, r4, r7
	ldr r2, _08136AC0 @ =0x00003188
	adds r0, r2
	adds r0, r3, r0
	ldr r1, _08136AC4 @ =gText_ThreeHyphens
	bl StringCopy
	b _08136ADA
	.align 2, 0
_08136AB0: .4byte 0x0000316c
_08136AB4: .4byte gBattleMoves
_08136AB8: .4byte gUnknown_203B140
_08136ABC: .4byte 0x00003258
_08136AC0: .4byte 0x00003188
_08136AC4: .4byte gText_ThreeHyphens
_08136AC8:
	adds r0, r4, r7
	ldr r4, _08136AE8 @ =0x00003188
	adds r0, r4
	adds r0, r3, r0
	ldrb r1, [r1, 0x3]
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
_08136ADA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08136AE8: .4byte 0x00003188
	thumb_func_end sub_81367E8

	thumb_func_start sub_8136AEC
sub_8136AEC: @ 8136AEC
	push {lr}
	ldr r0, _08136B08 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _08136B0C @ =0x0000327c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x8
	bhi _08136B86
	lsls r0, 2
	ldr r1, _08136B10 @ =_08136B14
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08136B08: .4byte gUnknown_203B140
_08136B0C: .4byte 0x0000327c
_08136B10: .4byte _08136B14
	.align 2, 0
_08136B14:
	.4byte _08136B38
	.4byte _08136B42
	.4byte _08136B4C
	.4byte _08136B52
	.4byte _08136B5C
	.4byte _08136B66
	.4byte _08136B70
	.4byte _08136B7A
	.4byte _08136B80
_08136B38:
	movs r0, 0xA0
	movs r1, 0xA0
	bl sub_813ADA8
	b _08136B8E
_08136B42:
	movs r0, 0x96
	movs r1, 0x96
	bl sub_813ABAC
	b _08136B8E
_08136B4C:
	bl sub_813AFFC
	b _08136B8E
_08136B52:
	movs r0, 0x64
	movs r1, 0x64
	bl sub_8139F64
	b _08136B8E
_08136B5C:
	movs r0, 0x6E
	movs r1, 0x6E
	bl sub_813A254
	b _08136B8E
_08136B66:
	movs r0, 0x78
	movs r1, 0x78
	bl sub_813A45C
	b _08136B8E
_08136B70:
	movs r0, 0x82
	movs r1, 0x82
	bl sub_813A874
	b _08136B8E
_08136B7A:
	bl sub_8139CB0
	b _08136B8E
_08136B80:
	bl sub_8139DBC
	b _08136B8E
_08136B86:
	bl sub_813995C
	movs r0, 0x1
	b _08136B9E
_08136B8E:
	ldr r0, _08136BA4 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r0, _08136BA8 @ =0x0000327c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
_08136B9E:
	pop {r1}
	bx r1
	.align 2, 0
_08136BA4: .4byte gUnknown_203B140
_08136BA8: .4byte 0x0000327c
	thumb_func_end sub_8136AEC

	thumb_func_start sub_8136BAC
sub_8136BAC: @ 8136BAC
	push {lr}
	bl ResetSpriteData
	bl ResetPaletteFade
	bl FreeAllSpritePalettes
	bl ScanlineEffect_Stop
	pop {r0}
	bx r0
	thumb_func_end sub_8136BAC

	thumb_func_start sub_8136BC4
sub_8136BC4: @ 8136BC4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r0, sp, 0x4
	mov r8, r0
	mov r2, sp
	movs r6, 0
	ldr r1, _08136D38 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08136D3C @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_08136BEA:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _08136BEA
	strh r6, [r2]
	mov r2, sp
	str r2, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r2, _08136D38 @ =0x040000d4
	mov r1, r8
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xA0
	lsls r1, 19
	mov r0, sp
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08136D40 @ =gUnknown_8463EFC
	movs r0, 0
	movs r2, 0x4
	bl InitBgsFromTemplates
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
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
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	bl DeactivateAllTextPrinters
	ldr r1, _08136D44 @ =0x00005040
	movs r0, 0
	bl SetGpuReg
	ldr r4, _08136D48 @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r2, _08136D4C @ =0x00003214
	adds r0, r2
	ldrb r0, [r0]
	bl sub_813B750
	movs r1, 0xF8
	lsls r1, 5
	movs r0, 0x48
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0xF
	bl SetGpuReg
	ldr r1, _08136D50 @ =0x00002087
	movs r0, 0x46
	bl SetGpuReg
	movs r1, 0xBC
	lsls r1, 2
	movs r0, 0x42
	bl SetGpuReg
	ldr r1, [r4]
	movs r0, 0x1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	movs r0, 0x80
	lsls r0, 5
	adds r1, r0
	movs r0, 0x2
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	movs r2, 0x80
	lsls r2, 6
	adds r1, r2
	movs r0, 0x3
	bl SetBgTilemapBuffer
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08136D38: .4byte 0x040000d4
_08136D3C: .4byte 0x81000800
_08136D40: .4byte gUnknown_8463EFC
_08136D44: .4byte 0x00005040
_08136D48: .4byte gUnknown_203B140
_08136D4C: .4byte 0x00003214
_08136D50: .4byte 0x00002087
	thumb_func_end sub_8136BC4

	thumb_func_start sub_8136D54
sub_8136D54: @ 8136D54
	push {r4,lr}
	ldr r4, _08136D70 @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r1, _08136D74 @ =0x00003208
	adds r0, r1
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08136D7C
	ldr r0, _08136D78 @ =sub_81393D4
	b _08136D7E
	.align 2, 0
_08136D70: .4byte gUnknown_203B140
_08136D74: .4byte 0x00003208
_08136D78: .4byte sub_81393D4
_08136D7C:
	ldr r0, _08136D98 @ =sub_8134840
_08136D7E:
	movs r1, 0
	bl CreateTask
	ldr r1, [r4]
	ldr r2, _08136D9C @ =0x00003018
	adds r1, r2
	strb r0, [r1]
	ldr r0, _08136DA0 @ =sub_8137EE8
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08136D98: .4byte sub_8134840
_08136D9C: .4byte 0x00003018
_08136DA0: .4byte sub_8137EE8
	thumb_func_end sub_8136D54

	thumb_func_start sub_8136DA4
sub_8136DA4: @ 8136DA4
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	ldr r5, _08136DE8 @ =gUnknown_203B140
	ldr r0, [r5]
	movs r4, 0xC0
	lsls r4, 6
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	ldr r1, _08136DEC @ =gUnknown_8463FA7
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x4
	movs r3, 0x1
	bl AddTextPrinterParameterized3
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl PutWindowTilemap
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08136DE8: .4byte gUnknown_203B140
_08136DEC: .4byte gUnknown_8463FA7
	thumb_func_end sub_8136DA4

	thumb_func_start sub_8136DF0
sub_8136DF0: @ 8136DF0
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	ldr r5, _08136E44 @ =gUnknown_203B140
	ldr r0, [r5]
	ldr r4, _08136E48 @ =0x00003001
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0
	adds r1, r6, 0
	movs r2, 0
	bl GetStringWidth
	ldr r1, [r5]
	adds r1, r4
	ldrb r1, [r1]
	movs r2, 0x54
	subs r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _08136E4C @ =gUnknown_8463FA7
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r1, 0
	movs r1, 0
	movs r3, 0
	bl AddTextPrinterParameterized3
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl PutWindowTilemap
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08136E44: .4byte gUnknown_203B140
_08136E48: .4byte 0x00003001
_08136E4C: .4byte gUnknown_8463FA7
	thumb_func_end sub_8136DF0

	thumb_func_start sub_8136E50
sub_8136E50: @ 8136E50
	push {r4-r7,lr}
	sub sp, 0xC
	ldr r6, _08136EEC @ =gUnknown_203B140
	ldr r0, [r6]
	ldr r7, _08136EF0 @ =0x00003002
	adds r0, r7
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r2, [r6]
	movs r1, 0xC8
	lsls r1, 6
	adds r0, r2, r1
	ldrb r5, [r0]
	cmp r5, 0
	bne _08136F28
	ldr r3, _08136EF4 @ =0x00003214
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _08136E9A
	adds r0, r2, r7
	ldrb r0, [r0]
	ldr r1, _08136EF8 @ =gUnknown_8463FA7
	str r1, [sp]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0x4]
	ldr r3, _08136EFC @ =0x00003088
	adds r1, r2, r3
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x4
	movs r3, 0x2
	bl AddTextPrinterParameterized3
_08136E9A:
	ldr r2, [r6]
	adds r0, r2, r7
	ldrb r0, [r0]
	ldr r4, _08136EF8 @ =gUnknown_8463FA7
	str r4, [sp]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0x4]
	ldr r1, _08136F00 @ =0x00003034
	adds r2, r1
	str r2, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x28
	movs r3, 0x2
	bl AddTextPrinterParameterized3
	ldr r0, [r6]
	ldr r3, _08136F04 @ =0x00003290
	adds r0, r3
	bl GetMonGender
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFE
	bne _08136F0C
	ldr r2, [r6]
	adds r0, r2, r7
	ldrb r0, [r0]
	adds r1, r4, 0x6
	str r1, [sp]
	str r5, [sp, 0x4]
	ldr r1, _08136F08 @ =0x00003084
	adds r2, r1
	str r2, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x69
	movs r3, 0x2
	bl AddTextPrinterParameterized3
	b _08136F28
	.align 2, 0
_08136EEC: .4byte gUnknown_203B140
_08136EF0: .4byte 0x00003002
_08136EF4: .4byte 0x00003214
_08136EF8: .4byte gUnknown_8463FA7
_08136EFC: .4byte 0x00003088
_08136F00: .4byte 0x00003034
_08136F04: .4byte 0x00003290
_08136F08: .4byte 0x00003084
_08136F0C:
	ldr r2, [r6]
	adds r0, r2, r7
	ldrb r0, [r0]
	adds r1, r4, 0x3
	str r1, [sp]
	str r5, [sp, 0x4]
	ldr r3, _08136F40 @ =0x00003084
	adds r2, r3
	str r2, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x69
	movs r3, 0x2
	bl AddTextPrinterParameterized3
_08136F28:
	ldr r0, _08136F44 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _08136F48 @ =0x00003002
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08136F40: .4byte 0x00003084
_08136F44: .4byte gUnknown_203B140
_08136F48: .4byte 0x00003002
	thumb_func_end sub_8136E50

	thumb_func_start sub_8136F4C
sub_8136F4C: @ 8136F4C
	push {r4,lr}
	ldr r4, _08136F74 @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r1, _08136F78 @ =0x00003003
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r0, [r4]
	ldr r1, _08136F7C @ =0x00003214
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08136F90
	cmp r0, 0x1
	bgt _08136F80
	cmp r0, 0
	beq _08136F8A
	b _08136F94
	.align 2, 0
_08136F74: .4byte gUnknown_203B140
_08136F78: .4byte 0x00003003
_08136F7C: .4byte 0x00003214
_08136F80:
	cmp r0, 0x3
	bgt _08136F94
	bl sub_8137270
	b _08136F94
_08136F8A:
	bl sub_8136FB0
	b _08136F94
_08136F90:
	bl sub_81370EC
_08136F94:
	ldr r0, _08136FA8 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _08136FAC @ =0x00003003
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08136FA8: .4byte gUnknown_203B140
_08136FAC: .4byte 0x00003003
	thumb_func_end sub_8136F4C

	thumb_func_start sub_8136FB0
sub_8136FB0: @ 8136FB0
	push {r4-r7,lr}
	sub sp, 0xC
	ldr r6, _08137060 @ =gUnknown_203B140
	ldr r1, [r6]
	ldr r2, _08137064 @ =0x00003003
	adds r0, r1, r2
	ldrb r0, [r0]
	ldr r5, _08137068 @ =gUnknown_8463FA4
	str r5, [sp]
	movs r4, 0x1
	negs r4, r4
	str r4, [sp, 0x4]
	ldr r7, _0813706C @ =0x00003028
	adds r1, r7
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x2F
	movs r3, 0x13
	bl AddTextPrinterParameterized3
	ldr r3, [r6]
	movs r1, 0xC8
	lsls r1, 6
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08137074
	ldr r2, _08137064 @ =0x00003003
	adds r0, r3, r2
	ldrb r0, [r0]
	ldr r1, _08137070 @ =gUnknown_203B144
	ldr r1, [r1]
	ldrb r2, [r1]
	adds r2, 0x2F
	lsls r2, 24
	lsrs r2, 24
	str r5, [sp]
	str r4, [sp, 0x4]
	adds r7, 0x3C
	adds r1, r3, r7
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x5
	bl AddTextPrinterParameterized3
	ldr r1, [r6]
	ldr r2, _08137064 @ =0x00003003
	adds r0, r1, r2
	ldrb r0, [r0]
	str r5, [sp]
	str r4, [sp, 0x4]
	subs r7, 0x24
	adds r1, r7
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x2F
	movs r3, 0x31
	bl AddTextPrinterParameterized3
	ldr r1, [r6]
	ldr r2, _08137064 @ =0x00003003
	adds r0, r1, r2
	ldrb r0, [r0]
	str r5, [sp]
	str r4, [sp, 0x4]
	adds r7, 0x2C
	adds r1, r7
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x2F
	movs r3, 0x40
	bl AddTextPrinterParameterized3
	ldr r1, [r6]
	ldr r2, _08137064 @ =0x00003003
	adds r0, r1, r2
	ldrb r0, [r0]
	str r5, [sp]
	str r4, [sp, 0x4]
	adds r7, 0x8
	adds r1, r7
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x2F
	movs r3, 0x4F
	bl AddTextPrinterParameterized3
	b _081370CA
	.align 2, 0
_08137060: .4byte gUnknown_203B140
_08137064: .4byte 0x00003003
_08137068: .4byte gUnknown_8463FA4
_0813706C: .4byte 0x00003028
_08137070: .4byte gUnknown_203B144
_08137074:
	ldr r1, _081370D4 @ =0x00003290
	adds r0, r3, r1
	movs r1, 0x20
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0x3
	cmp r0, 0x5
	bls _08137096
	movs r3, 0x2
	cmp r0, 0xA
	bls _08137096
	movs r3, 0
	cmp r0, 0x28
	bhi _08137096
	movs r3, 0x1
_08137096:
	ldr r0, _081370D8 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r2, _081370DC @ =0x00003204
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _081370A6
	movs r3, 0
_081370A6:
	ldr r7, _081370E0 @ =0x00003003
	adds r0, r1, r7
	ldrb r0, [r0]
	ldr r1, _081370E4 @ =gUnknown_8463FA4
	str r1, [sp]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0x4]
	ldr r2, _081370E8 @ =gUnknown_8463EC4
	lsls r1, r3, 2
	adds r1, r2
	ldr r1, [r1]
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x7
	movs r3, 0x2D
	bl AddTextPrinterParameterized3
_081370CA:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081370D4: .4byte 0x00003290
_081370D8: .4byte gUnknown_203B140
_081370DC: .4byte 0x00003204
_081370E0: .4byte 0x00003003
_081370E4: .4byte gUnknown_8463FA4
_081370E8: .4byte gUnknown_8463EC4
	thumb_func_end sub_8136FB0

	thumb_func_start sub_81370EC
sub_81370EC: @ 81370EC
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0xC
	ldr r0, _08137240 @ =gUnknown_203B140
	mov r9, r0
	ldr r3, [r0]
	ldr r4, _08137244 @ =0x00003003
	adds r0, r3, r4
	ldrb r0, [r0]
	ldr r1, _08137248 @ =gUnknown_203B144
	mov r8, r1
	ldr r1, [r1]
	ldrb r2, [r1, 0x2]
	adds r2, 0xE
	lsls r2, 24
	lsrs r2, 24
	ldr r6, _0813724C @ =gUnknown_8463FA4
	str r6, [sp]
	movs r5, 0x1
	negs r5, r5
	str r5, [sp, 0x4]
	ldr r1, _08137250 @ =0x00003090
	adds r3, r1
	str r3, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x4
	bl AddTextPrinterParameterized3
	mov r2, r9
	ldr r3, [r2]
	adds r0, r3, r4
	ldrb r0, [r0]
	mov r2, r8
	ldr r1, [r2]
	ldrb r2, [r1, 0x4]
	adds r2, 0x32
	lsls r2, 24
	lsrs r2, 24
	str r6, [sp]
	str r5, [sp, 0x4]
	ldr r1, _08137254 @ =0x0000309c
	adds r3, r1
	str r3, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x16
	bl AddTextPrinterParameterized3
	mov r2, r9
	ldr r3, [r2]
	adds r0, r3, r4
	ldrb r0, [r0]
	mov r2, r8
	ldr r1, [r2]
	ldrb r2, [r1, 0x6]
	adds r2, 0x32
	lsls r2, 24
	lsrs r2, 24
	str r6, [sp]
	str r5, [sp, 0x4]
	ldr r1, _08137258 @ =0x000030a1
	adds r3, r1
	str r3, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x23
	bl AddTextPrinterParameterized3
	mov r2, r9
	ldr r3, [r2]
	adds r0, r3, r4
	ldrb r0, [r0]
	mov r2, r8
	ldr r1, [r2]
	ldrb r2, [r1, 0x8]
	adds r2, 0x32
	lsls r2, 24
	lsrs r2, 24
	str r6, [sp]
	str r5, [sp, 0x4]
	ldr r1, _0813725C @ =0x000030a6
	adds r3, r1
	str r3, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x30
	bl AddTextPrinterParameterized3
	mov r2, r9
	ldr r3, [r2]
	adds r0, r3, r4
	ldrb r0, [r0]
	mov r2, r8
	ldr r1, [r2]
	ldrb r2, [r1, 0xA]
	adds r2, 0x32
	lsls r2, 24
	lsrs r2, 24
	str r6, [sp]
	str r5, [sp, 0x4]
	ldr r1, _08137260 @ =0x000030ab
	adds r3, r1
	str r3, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x3D
	bl AddTextPrinterParameterized3
	mov r2, r9
	ldr r3, [r2]
	adds r0, r3, r4
	ldrb r0, [r0]
	mov r2, r8
	ldr r1, [r2]
	ldrb r2, [r1, 0xC]
	adds r2, 0x32
	lsls r2, 24
	lsrs r2, 24
	str r6, [sp]
	str r5, [sp, 0x4]
	ldr r1, _08137264 @ =0x000030b0
	adds r3, r1
	str r3, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x4A
	bl AddTextPrinterParameterized3
	mov r2, r9
	ldr r3, [r2]
	adds r0, r3, r4
	ldrb r0, [r0]
	mov r2, r8
	ldr r1, [r2]
	ldrb r2, [r1, 0xE]
	adds r2, 0xF
	lsls r2, 24
	lsrs r2, 24
	str r6, [sp]
	str r5, [sp, 0x4]
	ldr r1, _08137268 @ =0x000031a4
	adds r3, r1
	str r3, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x57
	bl AddTextPrinterParameterized3
	mov r2, r9
	ldr r3, [r2]
	adds r4, r3, r4
	ldrb r0, [r4]
	mov r2, r8
	ldr r1, [r2]
	ldrb r2, [r1, 0x10]
	adds r2, 0xF
	lsls r2, 24
	lsrs r2, 24
	str r6, [sp]
	str r5, [sp, 0x4]
	ldr r1, _0813726C @ =0x000031b0
	adds r3, r1
	str r3, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x64
	bl AddTextPrinterParameterized3
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08137240: .4byte gUnknown_203B140
_08137244: .4byte 0x00003003
_08137248: .4byte gUnknown_203B144
_0813724C: .4byte gUnknown_8463FA4
_08137250: .4byte 0x00003090
_08137254: .4byte 0x0000309c
_08137258: .4byte 0x000030a1
_0813725C: .4byte 0x000030a6
_08137260: .4byte 0x000030ab
_08137264: .4byte 0x000030b0
_08137268: .4byte 0x000031a4
_0813726C: .4byte 0x000031b0
	thumb_func_end sub_81370EC

	thumb_func_start sub_8137270
sub_8137270: @ 8137270
	push {r4,lr}
	sub sp, 0xC
	movs r4, 0
_08137276:
	adds r0, r4, 0
	bl sub_81372E4
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08137276
	ldr r0, _081372A8 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r2, _081372AC @ =0x00003214
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _081372CE
	subs r2, 0xC
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _081372B0
	movs r0, 0x4
	bl sub_81372E4
	b _081372CE
	.align 2, 0
_081372A8: .4byte gUnknown_203B140
_081372AC: .4byte 0x00003214
_081372B0:
	ldr r2, _081372D8 @ =0x00003003
	adds r0, r1, r2
	ldrb r0, [r0]
	ldr r1, _081372DC @ =gUnknown_8463EF0
	str r1, [sp]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0x4]
	ldr r1, _081372E0 @ =gFameCheckerText_Cancel
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x3
	movs r3, 0x75
	bl AddTextPrinterParameterized3
_081372CE:
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081372D8: .4byte 0x00003003
_081372DC: .4byte gUnknown_8463EF0
_081372E0: .4byte gFameCheckerText_Cancel
	thumb_func_end sub_8137270

	thumb_func_start sub_81372E4
sub_81372E4: @ 81372E4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0
	mov r9, r0
	ldr r1, _0813739C @ =gUnknown_203B140
	mov r10, r1
	ldr r0, [r1]
	ldr r5, _081373A0 @ =0x00003290
	adds r0, r5
	adds r1, r7, 0
	bl sub_8138C24
	lsls r0, 24
	lsrs r6, r0, 24
	mov r2, r10
	ldr r0, [r2]
	lsls r3, r7, 1
	str r3, [sp, 0xC]
	ldr r2, _081373A4 @ =0x00003258
	adds r1, r0, r2
	adds r1, r3
	ldrh r4, [r1]
	adds r0, r5
	movs r1, 0x15
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	adds r2, r7, 0
	bl CalculatePPWithBonus
	lsls r0, 24
	mov r8, r0
	lsrs r5, r0, 24
	cmp r7, 0x4
	bne _0813733E
	adds r6, r5, 0
_0813733E:
	mov r3, r10
	ldr r2, [r3]
	ldr r1, _081373A8 @ =0x00003003
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r4, r7, 3
	subs r3, r4, r7
	lsls r3, 26
	movs r1, 0xA0
	lsls r1, 19
	adds r3, r1
	lsrs r3, 24
	mov r12, r3
	ldr r1, _081373AC @ =gUnknown_8463EF0
	str r1, [sp]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0x4]
	movs r1, 0xD
	muls r1, r7
	ldr r3, _081373B0 @ =0x00003128
	adds r1, r3
	adds r2, r1
	str r2, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x3
	mov r3, r12
	bl AddTextPrinterParameterized3
	mov r1, r10
	ldr r0, [r1]
	ldr r2, _081373A4 @ =0x00003258
	adds r0, r2
	ldr r3, [sp, 0xC]
	adds r0, r3
	ldrh r0, [r0]
	adds r1, r4, 0
	cmp r0, 0
	beq _081373EA
	cmp r6, r5
	beq _081373EA
	cmp r6, 0
	bne _081373B4
	movs r5, 0x3
	mov r9, r5
	b _081373EA
	.align 2, 0
_0813739C: .4byte gUnknown_203B140
_081373A0: .4byte 0x00003290
_081373A4: .4byte 0x00003258
_081373A8: .4byte 0x00003003
_081373AC: .4byte gUnknown_8463EF0
_081373B0: .4byte 0x00003128
_081373B4:
	cmp r5, 0x3
	bne _081373C6
	cmp r6, 0x2
	beq _081373D8
	cmp r6, 0x1
	bne _081373EA
	movs r2, 0x1
	mov r9, r2
	b _081373EA
_081373C6:
	cmp r5, 0x2
	bne _081373D0
	cmp r6, 0x1
	bne _081373EA
	b _081373E6
_081373D0:
	mov r5, r8
	lsrs r0, r5, 26
	cmp r6, r0
	bhi _081373DE
_081373D8:
	movs r0, 0x2
	mov r9, r0
	b _081373EA
_081373DE:
	mov r2, r8
	lsrs r0, r2, 25
	cmp r6, r0
	bhi _081373EA
_081373E6:
	movs r3, 0x1
	mov r9, r3
_081373EA:
	ldr r5, _081374C4 @ =gUnknown_203B140
	mov r10, r5
	ldr r0, [r5]
	ldr r4, _081374C8 @ =0x00003003
	adds r0, r4
	ldrb r0, [r0]
	subs r1, r7
	lsls r1, 26
	movs r2, 0x80
	lsls r2, 21
	adds r1, r2
	lsrs r1, 24
	mov r8, r1
	mov r3, r9
	lsls r1, r3, 1
	add r1, r9
	ldr r2, _081374CC @ =gUnknown_8463EF0
	adds r6, r1, r2
	str r6, [sp]
	movs r5, 0x1
	negs r5, r5
	mov r9, r5
	str r5, [sp, 0x4]
	ldr r1, _081374D0 @ =gUnknown_8416238
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x24
	mov r3, r8
	bl AddTextPrinterParameterized3
	mov r0, r10
	ldr r3, [r0]
	adds r4, r3, r4
	ldrb r0, [r4]
	ldr r2, _081374D4 @ =gUnknown_203B144
	ldr r1, [r2]
	lsls r5, r7, 1
	adds r1, 0x12
	adds r1, r5
	ldrb r2, [r1]
	adds r2, 0x2E
	lsls r2, 24
	lsrs r2, 24
	str r6, [sp]
	mov r1, r9
	str r1, [sp, 0x4]
	movs r1, 0xB
	adds r4, r7, 0
	muls r4, r1
	ldr r7, _081374D8 @ =0x000030b8
	adds r1, r4, r7
	adds r3, r1
	str r3, [sp, 0x8]
	movs r1, 0x2
	mov r3, r8
	bl AddTextPrinterParameterized3
	mov r0, r10
	ldr r1, [r0]
	ldr r2, _081374DC @ =0x00003258
	adds r0, r1, r2
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, 0
	beq _081374B4
	ldr r3, _081374C8 @ =0x00003003
	adds r0, r1, r3
	ldrb r0, [r0]
	str r6, [sp]
	mov r7, r9
	str r7, [sp, 0x4]
	ldr r1, _081374E0 @ =gUnknown_841620C
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x3A
	mov r3, r8
	bl AddTextPrinterParameterized3
	mov r0, r10
	ldr r3, [r0]
	ldr r1, _081374C8 @ =0x00003003
	adds r0, r3, r1
	ldrb r0, [r0]
	ldr r2, _081374D4 @ =gUnknown_203B144
	ldr r1, [r2]
	adds r1, 0x1C
	adds r1, r5
	ldrb r2, [r1]
	adds r2, 0x40
	lsls r2, 24
	lsrs r2, 24
	str r6, [sp]
	str r7, [sp, 0x4]
	ldr r5, _081374E4 @ =0x000030f0
	adds r1, r4, r5
	adds r3, r1
	str r3, [sp, 0x8]
	movs r1, 0x2
	mov r3, r8
	bl AddTextPrinterParameterized3
_081374B4:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081374C4: .4byte gUnknown_203B140
_081374C8: .4byte 0x00003003
_081374CC: .4byte gUnknown_8463EF0
_081374D0: .4byte gUnknown_8416238
_081374D4: .4byte gUnknown_203B144
_081374D8: .4byte 0x000030b8
_081374DC: .4byte 0x00003258
_081374E0: .4byte gUnknown_841620C
_081374E4: .4byte 0x000030f0
	thumb_func_end sub_81372E4

	thumb_func_start sub_81374E8
sub_81374E8: @ 81374E8
	push {r4,lr}
	ldr r4, _08137510 @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r1, _08137514 @ =0x00003004
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r0, [r4]
	ldr r1, _08137518 @ =0x00003214
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0813752C
	cmp r0, 0x1
	bgt _0813751C
	cmp r0, 0
	beq _08137526
	b _08137536
	.align 2, 0
_08137510: .4byte gUnknown_203B140
_08137514: .4byte 0x00003004
_08137518: .4byte 0x00003214
_0813751C:
	cmp r0, 0x2
	beq _08137536
	cmp r0, 0x3
	beq _08137532
	b _08137536
_08137526:
	bl sub_8137554
	b _08137536
_0813752C:
	bl sub_8137A90
	b _08137536
_08137532:
	bl sub_8137AF8
_08137536:
	ldr r0, _0813754C @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _08137550 @ =0x00003004
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813754C: .4byte gUnknown_203B140
_08137550: .4byte 0x00003004
	thumb_func_end sub_81374E8

	thumb_func_start sub_8137554
sub_8137554: @ 8137554
	push {lr}
	ldr r0, _0813756C @ =gUnknown_203B140
	ldr r0, [r0]
	movs r1, 0xC8
	lsls r1, 6
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08137570
	bl sub_8137944
	b _08137574
	.align 2, 0
_0813756C: .4byte gUnknown_203B140
_08137570:
	bl sub_8137970
_08137574:
	pop {r0}
	bx r0
	thumb_func_end sub_8137554

	thumb_func_start sub_8137578
sub_8137578: @ 8137578
	push {r4-r7,lr}
	sub sp, 0xD4
	bl DynamicPlaceholderTextUtil_Reset
	ldr r7, _081375E8 @ =gUnknown_203B140
	ldr r0, [r7]
	ldr r4, _081375EC @ =0x00003290
	adds r0, r4
	bl GetNature
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _081375F0 @ =gUnknown_8463E60
	lsls r0, r6, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r0, [r7]
	adds r0, r4
	movs r1, 0x24
	bl GetMonData
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _081375B2
	movs r1, 0x5
_081375B2:
	add r0, sp, 0x14
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r0, 0x1
	add r1, sp, 0x14
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r0, [r7]
	adds r0, r4
	movs r1, 0x23
	bl GetMonData
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_813B838
	cmp r0, 0x1
	bne _081375F4
	add r4, sp, 0x1C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80C4E08
	b _08137626
	.align 2, 0
_081375E8: .4byte gUnknown_203B140
_081375EC: .4byte 0x00003290
_081375F0: .4byte gUnknown_8463E60
_081375F4:
	ldr r0, [r7]
	ldr r1, _08137614 @ =0x00003024
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0x1
	beq _08137608
	bl sub_8138B4C
	cmp r0, 0x1
	bne _0813761C
_08137608:
	add r4, sp, 0x1C
	ldr r1, _08137618 @ =gUnknown_8419C13
	adds r0, r4, 0
	bl StringCopy
	b _08137626
	.align 2, 0
_08137614: .4byte 0x00003024
_08137618: .4byte gUnknown_8419C13
_0813761C:
	add r4, sp, 0x1C
	ldr r1, _08137660 @ =gUnknown_8419C0B
	adds r0, r4, 0
	bl StringCopy
_08137626:
	adds r1, r4, 0
	movs r0, 0x2
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r4, _08137664 @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r1, _08137668 @ =0x00003290
	adds r0, r1
	movs r1, 0x24
	bl GetMonData
	cmp r0, 0
	bne _0813769C
	ldr r0, [r4]
	ldr r1, _08137668 @ =0x00003290
	adds r0, r1
	movs r1, 0x50
	bl GetMonData
	cmp r0, 0x1
	bne _0813767C
	adds r0, r6, 0
	bl sub_813B7E0
	cmp r0, 0
	beq _08137670
	add r4, sp, 0x3C
	ldr r1, _0813766C @ =gUnknown_841996D
	b _081376CE
	.align 2, 0
_08137660: .4byte gUnknown_8419C0B
_08137664: .4byte gUnknown_203B140
_08137668: .4byte 0x00003290
_0813766C: .4byte gUnknown_841996D
_08137670:
	add r4, sp, 0x3C
	ldr r1, _08137678 @ =gUnknown_841992F
	b _081376CE
	.align 2, 0
_08137678: .4byte gUnknown_841992F
_0813767C:
	adds r0, r6, 0
	bl sub_813B7E0
	cmp r0, 0
	beq _08137690
	add r4, sp, 0x3C
	ldr r1, _0813768C @ =gUnknown_84198D5
	b _081376CE
	.align 2, 0
_0813768C: .4byte gUnknown_84198D5
_08137690:
	add r4, sp, 0x3C
	ldr r1, _08137698 @ =gUnknown_84198B4
	b _081376CE
	.align 2, 0
_08137698: .4byte gUnknown_84198B4
_0813769C:
	cmp r5, 0xFF
	bne _081376C0
	adds r0, r6, 0
	bl sub_813B7E0
	cmp r0, 0
	beq _081376B4
	add r4, sp, 0x3C
	ldr r1, _081376B0 @ =gUnknown_84197ED
	b _081376CE
	.align 2, 0
_081376B0: .4byte gUnknown_84197ED
_081376B4:
	add r4, sp, 0x3C
	ldr r1, _081376BC @ =gUnknown_84197B8
	b _081376CE
	.align 2, 0
_081376BC: .4byte gUnknown_84197B8
_081376C0:
	adds r0, r6, 0
	bl sub_813B7E0
	cmp r0, 0
	beq _081376DC
	add r4, sp, 0x3C
	ldr r1, _081376D8 @ =gUnknown_8419841
_081376CE:
	adds r0, r4, 0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	b _081376E6
	.align 2, 0
_081376D8: .4byte gUnknown_8419841
_081376DC:
	add r4, sp, 0x3C
	ldr r1, _08137714 @ =gUnknown_8419822
	adds r0, r4, 0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
_081376E6:
	ldr r0, _08137718 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _0813771C @ =0x00003004
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	ldr r1, _08137720 @ =gUnknown_8463FA4
	str r1, [sp, 0x8]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x3
	bl AddTextPrinterParameterized4
	add sp, 0xD4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08137714: .4byte gUnknown_8419822
_08137718: .4byte gUnknown_203B140
_0813771C: .4byte 0x00003004
_08137720: .4byte gUnknown_8463FA4
	thumb_func_end sub_8137578

	thumb_func_start sub_8137724
sub_8137724: @ 8137724
	push {r4-r6,lr}
	sub sp, 0xD4
	bl DynamicPlaceholderTextUtil_Reset
	ldr r5, _081377A0 @ =gUnknown_203B140
	ldr r0, [r5]
	ldr r4, _081377A4 @ =0x00003290
	adds r0, r4
	bl GetNature
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _081377A8 @ =gUnknown_8463E60
	lsls r0, r6, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r0, [r5]
	adds r0, r4
	movs r1, 0x24
	bl GetMonData
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0813775E
	movs r1, 0x5
_0813775E:
	add r0, sp, 0x14
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r0, 0x1
	add r1, sp, 0x14
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r0, [r5]
	adds r0, r4
	movs r1, 0x23
	bl GetMonData
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_813B838
	cmp r0, 0
	beq _08137790
	bl sub_813B7F8
	cmp r0, 0
	bne _08137830
_08137790:
	bl sub_8138B4C
	cmp r0, 0x1
	bne _081377AC
	bl sub_8137578
	b _0813792C
	.align 2, 0
_081377A0: .4byte gUnknown_203B140
_081377A4: .4byte 0x00003290
_081377A8: .4byte gUnknown_8463E60
_081377AC:
	cmp r5, 0xFF
	bne _081377D0
	adds r0, r6, 0
	bl sub_813B7E0
	cmp r0, 0
	beq _081377C4
	add r4, sp, 0x3C
	ldr r1, _081377C0 @ =gUnknown_84197ED
	b _081377DE
	.align 2, 0
_081377C0: .4byte gUnknown_84197ED
_081377C4:
	add r4, sp, 0x3C
	ldr r1, _081377CC @ =gUnknown_84197B8
	b _081377DE
	.align 2, 0
_081377CC: .4byte gUnknown_84197B8
_081377D0:
	adds r0, r6, 0
	bl sub_813B7E0
	cmp r0, 0
	beq _081377EC
	add r4, sp, 0x3C
	ldr r1, _081377E8 @ =gUnknown_841979D
_081377DE:
	adds r0, r4, 0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	b _081377F6
	.align 2, 0
_081377E8: .4byte gUnknown_841979D
_081377EC:
	add r4, sp, 0x3C
	ldr r1, _08137820 @ =gUnknown_8419782
	adds r0, r4, 0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
_081377F6:
	ldr r0, _08137824 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _08137828 @ =0x00003004
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	ldr r1, _0813782C @ =gUnknown_8463FA4
	str r1, [sp, 0x8]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x3
	bl AddTextPrinterParameterized4
	b _0813792C
	.align 2, 0
_08137820: .4byte gUnknown_8419782
_08137824: .4byte gUnknown_203B140
_08137828: .4byte 0x00003004
_0813782C: .4byte gUnknown_8463FA4
_08137830:
	adds r0, r5, 0
	bl sub_813B838
	cmp r0, 0x1
	bne _08137846
	add r4, sp, 0x1C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80C4E08
	b _08137850
_08137846:
	add r4, sp, 0x1C
	ldr r1, _0813788C @ =gUnknown_8419C0B
	adds r0, r4, 0
	bl StringCopy
_08137850:
	adds r1, r4, 0
	movs r0, 0x2
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r4, _08137890 @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r1, _08137894 @ =0x00003290
	adds r0, r1
	movs r1, 0x24
	bl GetMonData
	cmp r0, 0
	bne _081378BC
	ldr r0, [r4]
	ldr r1, _08137894 @ =0x00003290
	adds r0, r1
	movs r1, 0x50
	bl GetMonData
	cmp r0, 0x1
	bne _081378A8
	adds r0, r6, 0
	bl sub_813B7E0
	cmp r0, 0
	beq _0813789C
	add r4, sp, 0x3C
	ldr r1, _08137898 @ =gUnknown_84199F4
	b _081378EE
	.align 2, 0
_0813788C: .4byte gUnknown_8419C0B
_08137890: .4byte gUnknown_203B140
_08137894: .4byte 0x00003290
_08137898: .4byte gUnknown_84199F4
_0813789C:
	add r4, sp, 0x3C
	ldr r1, _081378A4 @ =gUnknown_84199AB
	b _081378EE
	.align 2, 0
_081378A4: .4byte gUnknown_84199AB
_081378A8:
	adds r0, r6, 0
	bl sub_813B7E0
	cmp r0, 0
	bne _081378EA
	add r4, sp, 0x3C
	ldr r1, _081378B8 @ =gUnknown_8419860
	b _081378EE
	.align 2, 0
_081378B8: .4byte gUnknown_8419860
_081378BC:
	cmp r5, 0xFF
	bne _081378E0
	adds r0, r6, 0
	bl sub_813B7E0
	cmp r0, 0
	beq _081378D4
	add r4, sp, 0x3C
	ldr r1, _081378D0 @ =gUnknown_84197ED
	b _081378EE
	.align 2, 0
_081378D0: .4byte gUnknown_84197ED
_081378D4:
	add r4, sp, 0x3C
	ldr r1, _081378DC @ =gUnknown_84197B8
	b _081378EE
	.align 2, 0
_081378DC: .4byte gUnknown_84197B8
_081378E0:
	adds r0, r6, 0
	bl sub_813B7E0
	cmp r0, 0
	beq _081378FC
_081378EA:
	add r4, sp, 0x3C
	ldr r1, _081378F8 @ =gUnknown_841988A
_081378EE:
	adds r0, r4, 0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	b _08137906
	.align 2, 0
_081378F8: .4byte gUnknown_841988A
_081378FC:
	add r4, sp, 0x3C
	ldr r1, _08137934 @ =gUnknown_8419860
	adds r0, r4, 0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
_08137906:
	ldr r0, _08137938 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _0813793C @ =0x00003004
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	ldr r1, _08137940 @ =gUnknown_8463FA4
	str r1, [sp, 0x8]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x3
	bl AddTextPrinterParameterized4
_0813792C:
	add sp, 0xD4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08137934: .4byte gUnknown_8419860
_08137938: .4byte gUnknown_203B140
_0813793C: .4byte 0x00003004
_08137940: .4byte gUnknown_8463FA4
	thumb_func_end sub_8137724

	thumb_func_start sub_8137944
sub_8137944: @ 8137944
	push {lr}
	ldr r0, _08137960 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _08137964 @ =0x00003290
	adds r0, r1
	bl sub_813847C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08137968
	bl sub_8137578
	b _0813796C
	.align 2, 0
_08137960: .4byte gUnknown_203B140
_08137964: .4byte 0x00003290
_08137968:
	bl sub_8137724
_0813796C:
	pop {r0}
	bx r0
	thumb_func_end sub_8137944

	thumb_func_start sub_8137970
sub_8137970: @ 8137970
	push {r4-r7,lr}
	sub sp, 0x14
	movs r5, 0
	ldr r7, _081379C4 @ =gUnknown_203B140
	ldr r0, [r7]
	ldr r6, _081379C8 @ =0x00003290
	adds r0, r6
	movs r1, 0x23
	bl GetMonData
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, [r7]
	ldr r1, _081379CC @ =0x000032f4
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, _081379D0 @ =gEnemyParty
	cmp r1, r0
	beq _081379E4
	cmp r4, 0xFF
	beq _081379F4
	adds r0, r2, r6
	movs r1, 0x50
	bl GetMonData
	cmp r0, 0x1
	beq _081379F4
	ldr r0, [r7]
	adds r0, r6
	movs r1, 0x25
	bl GetMonData
	lsls r0, 24
	movs r2, 0xFC
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x1
	bls _081379D4
	movs r5, 0x1
	b _081379DE
	.align 2, 0
_081379C4: .4byte gUnknown_203B140
_081379C8: .4byte 0x00003290
_081379CC: .4byte 0x000032f4
_081379D0: .4byte gEnemyParty
_081379D4:
	cmp r4, 0xFD
	bne _081379DA
	movs r5, 0x2
_081379DA:
	cmp r5, 0
	beq _08137A1E
_081379DE:
	cmp r5, 0x2
	bne _08137A36
	b _08137A1E
_081379E4:
	cmp r4, 0xFF
	beq _081379F4
	adds r0, r2, r6
	movs r1, 0x50
	bl GetMonData
	cmp r0, 0x1
	bne _081379F8
_081379F4:
	movs r5, 0x4
	b _08137A36
_081379F8:
	ldr r0, [r7]
	adds r0, r6
	movs r1, 0x25
	bl GetMonData
	lsls r0, 24
	movs r2, 0xFC
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x1
	bls _08137A18
	cmp r4, 0xFD
	bne _08137A1E
	movs r5, 0x5
	b _08137A1E
_08137A18:
	cmp r4, 0xFD
	bne _08137A1E
	movs r5, 0x2
_08137A1E:
	ldr r0, _08137A78 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _08137A7C @ =0x00003290
	adds r0, r1
	bl sub_813847C
	lsls r0, 24
	cmp r0, 0
	bne _08137A36
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08137A36:
	ldr r0, _08137A78 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r2, _08137A80 @ =0x00003204
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _08137A46
	movs r5, 0
_08137A46:
	ldr r2, _08137A84 @ =0x00003004
	adds r0, r1, r2
	ldrb r0, [r0]
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	ldr r1, _08137A88 @ =gUnknown_8463FA4
	str r1, [sp, 0x8]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0xC]
	ldr r2, _08137A8C @ =gUnknown_8463ED4
	lsls r1, r5, 2
	adds r1, r2
	ldr r1, [r1]
	str r1, [sp, 0x10]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x3
	bl AddTextPrinterParameterized4
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08137A78: .4byte gUnknown_203B140
_08137A7C: .4byte 0x00003290
_08137A80: .4byte 0x00003204
_08137A84: .4byte 0x00003004
_08137A88: .4byte gUnknown_8463FA4
_08137A8C: .4byte gUnknown_8463ED4
	thumb_func_end sub_8137970

	thumb_func_start sub_8137A90
sub_8137A90: @ 8137A90
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	ldr r0, _08137AE4 @ =gUnknown_203B140
	mov r8, r0
	ldr r0, [r0]
	ldr r6, _08137AE8 @ =0x00003004
	adds r0, r6
	ldrb r0, [r0]
	ldr r5, _08137AEC @ =gUnknown_8463FA4
	str r5, [sp]
	movs r4, 0x1
	negs r4, r4
	str r4, [sp, 0x4]
	ldr r1, _08137AF0 @ =gUnknown_8419C4D
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x1A
	movs r3, 0x7
	bl AddTextPrinterParameterized3
	mov r1, r8
	ldr r0, [r1]
	adds r0, r6
	ldrb r0, [r0]
	str r5, [sp]
	str r4, [sp, 0x4]
	ldr r1, _08137AF4 @ =gUnknown_8419C59
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x1A
	movs r3, 0x14
	bl AddTextPrinterParameterized3
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08137AE4: .4byte gUnknown_203B140
_08137AE8: .4byte 0x00003004
_08137AEC: .4byte gUnknown_8463FA4
_08137AF0: .4byte gUnknown_8419C4D
_08137AF4: .4byte gUnknown_8419C59
	thumb_func_end sub_8137A90

	thumb_func_start sub_8137AF8
sub_8137AF8: @ 8137AF8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	ldr r0, _08137BAC @ =gUnknown_203B16D
	mov r8, r0
	ldrb r1, [r0]
	cmp r1, 0x4
	bhi _08137B9E
	ldr r7, _08137BB0 @ =gUnknown_203B140
	ldr r3, [r7]
	ldr r2, _08137BB4 @ =0x00003208
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08137B1C
	cmp r1, 0x4
	beq _08137B9E
_08137B1C:
	ldr r4, _08137BB8 @ =0x00003004
	adds r0, r3, r4
	ldrb r0, [r0]
	ldr r6, _08137BBC @ =gUnknown_8463FA4
	str r6, [sp]
	movs r5, 0x1
	negs r5, r5
	str r5, [sp, 0x4]
	mov r1, r8
	ldrb r2, [r1]
	lsls r1, r2, 2
	adds r1, r2
	ldr r2, _08137BC0 @ =0x0000316c
	adds r1, r2
	adds r1, r3, r1
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x39
	movs r3, 0x1
	bl AddTextPrinterParameterized3
	ldr r3, [r7]
	adds r0, r3, r4
	ldrb r0, [r0]
	str r6, [sp]
	str r5, [sp, 0x4]
	mov r1, r8
	ldrb r2, [r1]
	lsls r1, r2, 2
	adds r1, r2
	ldr r2, _08137BC4 @ =0x00003188
	adds r1, r2
	adds r3, r1
	str r3, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x39
	movs r3, 0xF
	bl AddTextPrinterParameterized3
	ldr r2, [r7]
	adds r4, r2, r4
	ldrb r0, [r4]
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	str r6, [sp, 0x8]
	str r5, [sp, 0xC]
	ldr r3, _08137BC8 @ =gMoveDescriptionPointers
	mov r4, r8
	ldrb r1, [r4]
	lsls r1, 1
	ldr r4, _08137BCC @ =0x00003258
	adds r2, r4
	adds r2, r1
	ldrh r1, [r2]
	subs r1, 0x1
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	str r1, [sp, 0x10]
	movs r1, 0x2
	movs r2, 0x7
	movs r3, 0x2A
	bl AddTextPrinterParameterized4
_08137B9E:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08137BAC: .4byte gUnknown_203B16D
_08137BB0: .4byte gUnknown_203B140
_08137BB4: .4byte 0x00003208
_08137BB8: .4byte 0x00003004
_08137BBC: .4byte gUnknown_8463FA4
_08137BC0: .4byte 0x0000316c
_08137BC4: .4byte 0x00003188
_08137BC8: .4byte gMoveDescriptionPointers
_08137BCC: .4byte 0x00003258
	thumb_func_end sub_8137AF8

	thumb_func_start sub_8137BD0
sub_8137BD0: @ 8137BD0
	push {lr}
	ldr r0, _08137BE8 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _08137BEC @ =0x00003214
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08137BF0
	bl sub_8137C18
	b _08137BFC
	.align 2, 0
_08137BE8: .4byte gUnknown_203B140
_08137BEC: .4byte 0x00003214
_08137BF0:
	cmp r0, 0x1
	ble _08137BFC
	cmp r0, 0x3
	bgt _08137BFC
	bl sub_8137C90
_08137BFC:
	ldr r0, _08137C10 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _08137C14 @ =0x00003005
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	pop {r0}
	bx r0
	.align 2, 0
_08137C10: .4byte gUnknown_203B140
_08137C14: .4byte 0x00003005
	thumb_func_end sub_8137BD0

	thumb_func_start sub_8137C18
sub_8137C18: @ 8137C18
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	ldr r5, _08137C7C @ =gUnknown_203B140
	ldr r0, [r5]
	ldr r4, _08137C80 @ =0x00003005
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r1, [r5]
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _08137C84 @ =gUnknown_8463FA4
	mov r8, r2
	str r2, [sp]
	movs r6, 0x1
	negs r6, r6
	str r6, [sp, 0x4]
	ldr r2, _08137C88 @ =0x000031bc
	adds r1, r2
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x42
	movs r3, 0x1
	bl AddTextPrinterParameterized3
	ldr r1, [r5]
	adds r4, r1, r4
	ldrb r0, [r4]
	mov r2, r8
	str r2, [sp]
	str r6, [sp, 0x4]
	ldr r2, _08137C8C @ =0x000031cc
	adds r1, r2
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x2
	movs r3, 0xF
	bl AddTextPrinterParameterized3
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08137C7C: .4byte gUnknown_203B140
_08137C80: .4byte 0x00003005
_08137C84: .4byte gUnknown_8463FA4
_08137C88: .4byte 0x000031bc
_08137C8C: .4byte 0x000031cc
	thumb_func_end sub_8137C18

	thumb_func_start sub_8137C90
sub_8137C90: @ 8137C90
	push {r4,r5,lr}
	ldr r0, _08137D14 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _08137D18 @ =0x00003005
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r4, 0
_08137CA4:
	ldr r5, _08137D14 @ =gUnknown_203B140
	ldr r1, [r5]
	lsls r2, r4, 1
	ldr r3, _08137D1C @ =0x00003258
	adds r0, r1, r3
	adds r0, r2
	ldrh r0, [r0]
	cmp r0, 0
	beq _08137CDE
	ldr r3, _08137D18 @ =0x00003005
	adds r0, r1, r3
	ldrb r0, [r0]
	ldr r3, _08137D20 @ =0x0000324e
	adds r1, r3
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	lsls r3, r4, 3
	subs r3, r4
	lsls r3, 18
	movs r2, 0xA0
	lsls r2, 11
	adds r3, r2
	lsrs r3, 16
	movs r2, 0x3
	bl BlitMoveInfoIcon
_08137CDE:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08137CA4
	ldr r1, [r5]
	ldr r3, _08137D24 @ =0x00003208
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08137D0E
	ldr r2, _08137D18 @ =0x00003005
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r3, 0x4E
	adds r1, r3
	ldrb r1, [r1]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x3
	movs r3, 0x75
	bl BlitMoveInfoIcon
_08137D0E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08137D14: .4byte gUnknown_203B140
_08137D18: .4byte 0x00003005
_08137D1C: .4byte 0x00003258
_08137D20: .4byte 0x0000324e
_08137D24: .4byte 0x00003208
	thumb_func_end sub_8137C90

	thumb_func_start sub_8137D28
sub_8137D28: @ 8137D28
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bhi _08137E16
	lsls r0, 2
	ldr r1, _08137D3C @ =_08137D40
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08137D3C: .4byte _08137D40
	.align 2, 0
_08137D40:
	.4byte _08137D58
	.4byte _08137D8C
	.4byte _08137DA4
	.4byte _08137DBC
	.4byte _08137E16
	.4byte _08137E04
_08137D58:
	ldr r0, _08137D78 @ =gUnknown_8419C1D
	bl sub_8136DA4
	ldr r0, _08137D7C @ =gUnknown_203B140
	ldr r0, [r0]
	movs r1, 0xC8
	lsls r1, 6
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08137D84
	ldr r0, _08137D80 @ =gUnknown_8419C62
	bl sub_8136DF0
	b _08137DF2
	.align 2, 0
_08137D78: .4byte gUnknown_8419C1D
_08137D7C: .4byte gUnknown_203B140
_08137D80: .4byte gUnknown_8419C62
_08137D84:
	ldr r0, _08137D88 @ =gUnknown_8419C72
	b _08137DEE
	.align 2, 0
_08137D88: .4byte gUnknown_8419C72
_08137D8C:
	ldr r0, _08137D9C @ =gUnknown_8419C2A
	bl sub_8136DA4
	ldr r0, _08137DA0 @ =gUnknown_8419C7B
	bl sub_8136DF0
	b _08137DF2
	.align 2, 0
_08137D9C: .4byte gUnknown_8419C2A
_08137DA0: .4byte gUnknown_8419C7B
_08137DA4:
	ldr r0, _08137DB4 @ =gUnknown_8419C39
	bl sub_8136DA4
	ldr r0, _08137DB8 @ =gUnknown_8419C82
	bl sub_8136DF0
	b _08137DF2
	.align 2, 0
_08137DB4: .4byte gUnknown_8419C39
_08137DB8: .4byte gUnknown_8419C82
_08137DBC:
	ldr r0, _08137DDC @ =gUnknown_8419C39
	bl sub_8136DA4
	ldr r0, _08137DE0 @ =gMain
	ldr r1, _08137DE4 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08137DEC
	ldr r0, _08137DE8 @ =gUnknown_8419C92
	bl sub_8136DF0
	b _08137DF2
	.align 2, 0
_08137DDC: .4byte gUnknown_8419C39
_08137DE0: .4byte gMain
_08137DE4: .4byte 0x00000439
_08137DE8: .4byte gUnknown_8419C92
_08137DEC:
	ldr r0, _08137DFC @ =gUnknown_8419CA2
_08137DEE:
	bl sub_8136DF0
_08137DF2:
	ldr r0, _08137E00 @ =gUnknown_8419C45
	bl sub_8136E50
	b _08137E16
	.align 2, 0
_08137DFC: .4byte gUnknown_8419CA2
_08137E00: .4byte gUnknown_8419C45
_08137E04:
	ldr r0, _08137E1C @ =gUnknown_8419C39
	bl sub_8136DA4
	ldr r0, _08137E20 @ =gUnknown_8419CA9
	bl sub_8136DF0
	ldr r0, _08137E24 @ =gUnknown_8419C45
	bl sub_8136E50
_08137E16:
	pop {r0}
	bx r0
	.align 2, 0
_08137E1C: .4byte gUnknown_8419C39
_08137E20: .4byte gUnknown_8419CA9
_08137E24: .4byte gUnknown_8419C45
	thumb_func_end sub_8137D28

	thumb_func_start sub_8137E28
sub_8137E28: @ 8137E28
	push {r4,lr}
	ldr r4, _08137E58 @ =gUnknown_203B140
	ldr r0, [r4]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	ldr r1, _08137E5C @ =0x00003001
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	ldr r1, _08137E60 @ =0x00003002
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08137E58: .4byte gUnknown_203B140
_08137E5C: .4byte 0x00003001
_08137E60: .4byte 0x00003002
	thumb_func_end sub_8137E28

	thumb_func_start sub_8137E64
sub_8137E64: @ 8137E64
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_813AF90
	bl FreeAllSpritePalettes
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08137E82
	bl StopCryAndClearCrySongs
_08137E82:
	ldr r4, _08137ED4 @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r1, _08137ED8 @ =0x00003214
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8138414
	bl FreeAllWindowBuffers
	adds r0, r5, 0
	bl DestroyTask
	ldr r0, [r4]
	ldr r1, _08137EDC @ =0x000032f8
	adds r0, r1
	ldr r0, [r0]
	bl SetMainCallback2
	bl sub_8138B20
	ldr r1, _08137EE0 @ =gUnknown_203B16C
	strb r0, [r1]
	ldr r0, [r4]
	cmp r0, 0
	beq _08137EBC
	bl Free
	movs r0, 0
	str r0, [r4]
_08137EBC:
	ldr r4, _08137EE4 @ =gUnknown_203B144
	ldr r0, [r4]
	cmp r0, 0
	beq _08137ECC
	bl Free
	movs r0, 0
	str r0, [r4]
_08137ECC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08137ED4: .4byte gUnknown_203B140
_08137ED8: .4byte 0x00003214
_08137EDC: .4byte 0x000032f8
_08137EE0: .4byte gUnknown_203B16C
_08137EE4: .4byte gUnknown_203B144
	thumb_func_end sub_8137E64

	thumb_func_start sub_8137EE8
sub_8137EE8: @ 8137EE8
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8137EE8

	thumb_func_start sub_8137F00
sub_8137F00: @ 8137F00
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, _08137F60 @ =gUnknown_203B160
_08137F06:
	ldr r3, [r6]
	lsls r4, r5, 1
	adds r0, r3, 0
	adds r0, 0x2C
	adds r1, r0, r4
	ldrh r2, [r1]
	cmp r2, 0xEF
	bhi _08137F28
	adds r0, r2, 0
	adds r0, 0x3C
	strh r0, [r1]
	lsls r0, r5, 2
	adds r0, r3, r0
	ldr r1, [r0]
	adds r0, r2, 0
	adds r0, 0x78
	strh r0, [r1, 0x20]
_08137F28:
	cmp r5, 0x8
	bhi _08137F4E
	ldr r0, _08137F64 @ =gUnknown_203B15C
	ldr r3, [r0]
	adds r0, r3, 0
	adds r0, 0x28
	adds r1, r0, r4
	ldrh r2, [r1]
	cmp r2, 0xEF
	bhi _08137F4E
	adds r0, r2, 0
	adds r0, 0x3C
	strh r0, [r1]
	lsls r0, r5, 2
	adds r0, r3, r0
	ldr r1, [r0]
	adds r0, r2, 0
	adds r0, 0x78
	strh r0, [r1, 0x20]
_08137F4E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xA
	bls _08137F06
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08137F60: .4byte gUnknown_203B160
_08137F64: .4byte gUnknown_203B15C
	thumb_func_end sub_8137F00

	thumb_func_start sub_8137F68
sub_8137F68: @ 8137F68
	push {r4-r7,lr}
	movs r5, 0
	ldr r0, _08137FEC @ =gUnknown_203B160
	mov r12, r0
_08137F70:
	mov r1, r12
	ldr r0, [r1]
	lsls r1, r5, 1
	adds r0, 0x2C
	adds r3, r0, r1
	ldrh r4, [r3]
	lsls r0, r5, 3
	adds r2, r0, 0
	adds r2, 0x9C
	adds r6, r1, 0
	adds r7, r0, 0
	cmp r4, r2
	ble _08137FAA
	adds r0, r4, 0
	subs r0, 0x3C
	strh r0, [r3]
	ldrh r0, [r3]
	cmp r0, r2
	bge _08137F98
	strh r2, [r3]
_08137F98:
	mov r0, r12
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r0, r1, r0
	ldr r2, [r0]
	adds r1, 0x2C
	adds r1, r6
	ldrh r0, [r1]
	strh r0, [r2, 0x20]
_08137FAA:
	cmp r5, 0x8
	bhi _08137FDC
	ldr r1, _08137FF0 @ =gUnknown_203B15C
	ldr r0, [r1]
	adds r0, 0x28
	adds r2, r0, r6
	ldrh r0, [r2]
	adds r3, r7, 0
	adds r3, 0xAC
	cmp r0, r3
	ble _08137FDC
	subs r0, 0x3C
	strh r0, [r2]
	ldrh r0, [r2]
	cmp r0, r3
	bge _08137FCC
	strh r3, [r2]
_08137FCC:
	ldr r1, [r1]
	lsls r0, r5, 2
	adds r0, r1, r0
	ldr r2, [r0]
	adds r1, 0x28
	adds r1, r6
	ldrh r0, [r1]
	strh r0, [r2, 0x20]
_08137FDC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xA
	bls _08137F70
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08137FEC: .4byte gUnknown_203B160
_08137FF0: .4byte gUnknown_203B15C
	thumb_func_end sub_8137F68

	thumb_func_start sub_8137FF4
sub_8137FF4: @ 8137FF4
	push {r4,r5,lr}
	ldr r4, _08138038 @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r3, _0813803C @ =0x0000324c
	adds r1, r0, r3
	ldrh r2, [r1]
	movs r5, 0
	ldrsh r0, [r1, r5]
	cmp r0, 0xEF
	bgt _08138054
	adds r0, r2, 0
	adds r0, 0x3C
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF0
	ble _0813801A
	movs r0, 0xF0
	strh r0, [r1]
_0813801A:
	ldr r1, [r4]
	ldr r2, _08138040 @ =0x00003238
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08138044
	adds r0, r1, r3
	ldrh r1, [r0]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x18
	bl SetGpuReg
	b _08138054
	.align 2, 0
_08138038: .4byte gUnknown_203B140
_0813803C: .4byte 0x0000324c
_08138040: .4byte 0x00003238
_08138044:
	adds r0, r1, r3
	ldrh r1, [r0]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x14
	bl SetGpuReg
_08138054:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8137FF4

	thumb_func_start sub_813805C
sub_813805C: @ 813805C
	push {r4,r5,lr}
	ldr r4, _081380A0 @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r3, _081380A4 @ =0x0000324c
	adds r1, r0, r3
	ldrh r2, [r1]
	movs r5, 0
	ldrsh r0, [r1, r5]
	cmp r0, 0x3B
	ble _081380DC
	adds r0, r2, 0
	subs r0, 0x3C
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bge _08138080
	movs r0, 0
	strh r0, [r1]
_08138080:
	ldr r1, [r4]
	ldr r2, _081380A8 @ =0x00003238
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _081380AC
	adds r0, r1, r3
	ldrh r1, [r0]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x14
	bl SetGpuReg
	b _081380BC
	.align 2, 0
_081380A0: .4byte gUnknown_203B140
_081380A4: .4byte 0x0000324c
_081380A8: .4byte 0x00003238
_081380AC:
	adds r0, r1, r3
	ldrh r1, [r0]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x18
	bl SetGpuReg
_081380BC:
	ldr r0, _081380E4 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r5, _081380E8 @ =0x00003214
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _081380DC
	ldr r2, _081380EC @ =0x0000324c
	adds r0, r1, r2
	ldrh r1, [r0]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x10
	bl SetGpuReg
_081380DC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081380E4: .4byte gUnknown_203B140
_081380E8: .4byte 0x00003214
_081380EC: .4byte 0x0000324c
	thumb_func_end sub_813805C

	thumb_func_start sub_81380F0
sub_81380F0: @ 81380F0
	push {lr}
	ldr r0, _08138110 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r2, _08138114 @ =0x00003224
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08138118
	subs r2, 0x10
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _08138122
	bl sub_8137FF4
	b _08138130
	.align 2, 0
_08138110: .4byte gUnknown_203B140
_08138114: .4byte 0x00003224
_08138118:
	ldr r2, _08138128 @ =0x00003214
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _0813812C
_08138122:
	bl sub_813805C
	b _08138130
	.align 2, 0
_08138128: .4byte 0x00003214
_0813812C:
	bl sub_8137FF4
_08138130:
	pop {r0}
	bx r0
	thumb_func_end sub_81380F0

	thumb_func_start sub_8138134
sub_8138134: @ 8138134
	push {lr}
	ldr r0, _08138174 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r2, _08138178 @ =0x00003214
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08138152
	adds r2, 0x10
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08138152
	bl sub_8137F68
_08138152:
	ldr r0, _08138174 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r2, _08138178 @ =0x00003214
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0813816E
	adds r2, 0x10
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0813816E
	bl sub_8137F00
_0813816E:
	pop {r0}
	bx r0
	.align 2, 0
_08138174: .4byte gUnknown_203B140
_08138178: .4byte 0x00003214
	thumb_func_end sub_8138134

	thumb_func_start sub_813817C
sub_813817C: @ 813817C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r0, _081381A4 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _081381A8 @ =0x00003244
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _081381A0
	bl sub_81380F0
	bl sub_8138134
_081381A0:
	pop {r0}
	bx r0
	.align 2, 0
_081381A4: .4byte gUnknown_203B140
_081381A8: .4byte 0x00003244
	thumb_func_end sub_813817C

	thumb_func_start sub_81381AC
sub_81381AC: @ 81381AC
	push {lr}
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	pop {r0}
	bx r0
	thumb_func_end sub_81381AC

	thumb_func_start sub_81381C0
sub_81381C0: @ 81381C0
	push {lr}
	ldr r0, _081381CC @ =sub_813817C
	bl SetVBlankCallback
	pop {r0}
	bx r0
	.align 2, 0
_081381CC: .4byte sub_813817C
	thumb_func_end sub_81381C0

	thumb_func_start sub_81381D0
sub_81381D0: @ 81381D0
	push {r4,r5,lr}
	ldr r0, _08138218 @ =gUnknown_8463F9C
	bl InitWindows
	movs r4, 0
_081381DA:
	lsls r0, r4, 3
	ldr r1, _0813821C @ =gUnknown_8463F0C
	adds r0, r1
	bl AddWindow
	ldr r2, _08138220 @ =gUnknown_203B140
	ldr r1, [r2]
	movs r3, 0xC0
	lsls r3, 6
	adds r1, r3
	adds r1, r4
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _081381DA
	movs r4, 0
	adds r5, r2, 0
_08138200:
	ldr r0, [r5]
	ldr r1, _08138224 @ =0x00003214
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08138254
	cmp r0, 0x1
	bgt _08138228
	cmp r0, 0
	beq _08138238
	b _08138268
	.align 2, 0
_08138218: .4byte gUnknown_8463F9C
_0813821C: .4byte gUnknown_8463F0C
_08138220: .4byte gUnknown_203B140
_08138224: .4byte 0x00003214
_08138228:
	cmp r0, 0x3
	bgt _08138268
	lsls r0, r4, 3
	ldr r1, _08138234 @ =gUnknown_8463F7C
	b _08138258
	.align 2, 0
_08138234: .4byte gUnknown_8463F7C
_08138238:
	lsls r0, r4, 3
	ldr r1, _0813824C @ =gUnknown_8463F3C
	adds r0, r1
	bl AddWindow
	ldr r1, [r5]
	adds r1, r4
	ldr r3, _08138250 @ =0x00003003
	adds r1, r3
	b _08138266
	.align 2, 0
_0813824C: .4byte gUnknown_8463F3C
_08138250: .4byte 0x00003003
_08138254:
	lsls r0, r4, 3
	ldr r1, _08138278 @ =gUnknown_8463F5C
_08138258:
	adds r0, r1
	bl AddWindow
	ldr r1, [r5]
	adds r1, r4
	ldr r2, _0813827C @ =0x00003003
	adds r1, r2
_08138266:
	strb r0, [r1]
_08138268:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08138200
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08138278: .4byte gUnknown_8463F5C
_0813827C: .4byte 0x00003003
	thumb_func_end sub_81381D0

	thumb_func_start sub_8138280
sub_8138280: @ 8138280
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0xA
	bl GetGpuReg
	movs r4, 0x3
	adds r5, r4, 0
	ands r5, r0
	movs r0, 0xC
	bl GetGpuReg
	adds r3, r4, 0
	ands r3, r0
	movs r4, 0
	ldr r2, _08138314 @ =gUnknown_203B140
	movs r0, 0xC0
	lsls r0, 6
	mov r12, r0
	movs r7, 0xFF
	mov r8, r2
_081382AE:
	ldr r0, [r2]
	add r0, r12
	adds r0, r4
	ldrb r1, [r0]
	orrs r1, r7
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	bls _081382AE
	mov r2, r8
	ldr r1, [r2]
	ldr r4, _08138318 @ =0x00003224
	adds r0, r1, r4
	ldrb r2, [r0]
	cmp r2, 0x1
	bne _081382DC
	subs r4, 0x10
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _081382EA
_081382DC:
	cmp r2, 0
	bne _08138354
	ldr r2, _0813831C @ =0x00003214
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08138354
_081382EA:
	cmp r3, r5
	bls _08138324
	movs r4, 0
_081382F0:
	lsls r0, r4, 3
	ldr r1, _08138320 @ =gUnknown_8463F24
	adds r0, r1
	bl AddWindow
	ldr r1, _08138314 @ =gUnknown_203B140
	ldr r1, [r1]
	movs r2, 0xC0
	lsls r2, 6
	adds r1, r2
	adds r1, r4
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _081382F0
	b _081383AC
	.align 2, 0
_08138314: .4byte gUnknown_203B140
_08138318: .4byte 0x00003224
_0813831C: .4byte 0x00003214
_08138320: .4byte gUnknown_8463F24
_08138324:
	movs r4, 0
_08138326:
	lsls r0, r4, 3
	ldr r1, _0813834C @ =gUnknown_8463F0C
	adds r0, r1
	bl AddWindow
	ldr r1, _08138350 @ =gUnknown_203B140
	ldr r1, [r1]
	movs r2, 0xC0
	lsls r2, 6
	adds r1, r2
	adds r1, r4
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _08138326
	b _081383AC
	.align 2, 0
_0813834C: .4byte gUnknown_8463F0C
_08138350: .4byte gUnknown_203B140
_08138354:
	cmp r3, r5
	bls _08138388
	movs r4, 0
_0813835A:
	lsls r0, r4, 3
	ldr r1, _08138380 @ =gUnknown_8463F0C
	adds r0, r1
	bl AddWindow
	ldr r1, _08138384 @ =gUnknown_203B140
	ldr r1, [r1]
	movs r2, 0xC0
	lsls r2, 6
	adds r1, r2
	adds r1, r4
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0813835A
	b _081383AC
	.align 2, 0
_08138380: .4byte gUnknown_8463F0C
_08138384: .4byte gUnknown_203B140
_08138388:
	movs r4, 0
_0813838A:
	lsls r0, r4, 3
	ldr r1, _081383C0 @ =gUnknown_8463F24
	adds r0, r1
	bl AddWindow
	ldr r1, _081383C4 @ =gUnknown_203B140
	ldr r1, [r1]
	movs r2, 0xC0
	lsls r2, 6
	adds r1, r2
	adds r1, r4
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0813838A
_081383AC:
	movs r4, 0
	ldr r5, _081383C4 @ =gUnknown_203B140
_081383B0:
	cmp r6, 0x1
	beq _081383E4
	cmp r6, 0x1
	bgt _081383C8
	cmp r6, 0
	beq _081383D8
	b _081383E4
	.align 2, 0
_081383C0: .4byte gUnknown_8463F24
_081383C4: .4byte gUnknown_203B140
_081383C8:
	cmp r6, 0x3
	bgt _081383E4
	lsls r0, r4, 3
	ldr r1, _081383D4 @ =gUnknown_8463F7C
	b _081383E8
	.align 2, 0
_081383D4: .4byte gUnknown_8463F7C
_081383D8:
	lsls r0, r4, 3
	ldr r1, _081383E0 @ =gUnknown_8463F3C
	b _081383E8
	.align 2, 0
_081383E0: .4byte gUnknown_8463F3C
_081383E4:
	lsls r0, r4, 3
	ldr r1, _0813840C @ =gUnknown_8463F5C
_081383E8:
	adds r0, r1
	bl AddWindow
	ldr r1, [r5]
	adds r1, r4
	ldr r2, _08138410 @ =0x00003003
	adds r1, r2
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _081383B0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813840C: .4byte gUnknown_8463F5C
_08138410: .4byte 0x00003003
	thumb_func_end sub_8138280

	thumb_func_start sub_8138414
sub_8138414: @ 8138414
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _0813843C @ =gUnknown_203B140
_0813841A:
	ldr r0, [r5]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	adds r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	bls _0813841A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813843C: .4byte gUnknown_203B140
	thumb_func_end sub_8138414

	thumb_func_start sub_8138440
sub_8138440: @ 8138440
	push {lr}
	ldr r0, _0813845C @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _08138460 @ =0x00003214
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08138470
	cmp r0, 0x1
	bgt _08138464
	cmp r0, 0
	beq _0813846C
	b _08138476
	.align 2, 0
_0813845C: .4byte gUnknown_203B140
_08138460: .4byte 0x00003214
_08138464:
	cmp r0, 0x3
	bgt _08138476
	movs r0, 0x8
	b _08138472
_0813846C:
	movs r0, 0x6
	b _08138472
_08138470:
	movs r0, 0x7
_08138472:
	bl HelpSystem_SetSomeVariable2
_08138476:
	pop {r0}
	bx r0
	thumb_func_end sub_8138440

	thumb_func_start sub_813847C
sub_813847C: @ 813847C
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r5, _081384BC @ =gUnknown_203B140
	ldr r0, [r5]
	ldr r1, _081384C0 @ =0x000032f4
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _081384C4 @ =gEnemyParty
	cmp r1, r0
	bne _081384D0
	bl GetMultiplayerId
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081384C8 @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r2, 0x4
	adds r0, r1, r0
	ldrh r4, [r0]
	ldr r0, [r5]
	ldr r3, _081384CC @ =0x0000304c
	adds r0, r3
	adds r2, 0x8
	adds r1, r2
	bl StringCopy
	b _081384E8
	.align 2, 0
_081384BC: .4byte gUnknown_203B140
_081384C0: .4byte 0x000032f4
_081384C4: .4byte gEnemyParty
_081384C8: .4byte gLinkPlayers
_081384CC: .4byte 0x0000304c
_081384D0:
	bl GetPlayerTrainerId
	adds r4, r0, 0
	ldr r0, _0813851C @ =0x0000ffff
	ands r4, r0
	ldr r0, [r5]
	ldr r1, _08138520 @ =0x0000304c
	adds r0, r1
	ldr r1, _08138524 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	bl StringCopy
_081384E8:
	adds r0, r6, 0
	movs r1, 0x1
	bl GetMonData
	ldr r1, _0813851C @ =0x0000ffff
	ands r1, r0
	cmp r4, r1
	bne _08138518
	ldr r4, _08138528 @ =gUnknown_203B140
	ldr r2, [r4]
	ldr r5, _0813852C @ =0x00003058
	adds r2, r5
	adds r0, r6, 0
	movs r1, 0x7
	bl GetMonData
	ldr r1, [r4]
	ldr r2, _08138520 @ =0x0000304c
	adds r0, r1, r2
	adds r1, r5
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	beq _08138530
_08138518:
	movs r0, 0
	b _08138532
	.align 2, 0
_0813851C: .4byte 0x0000ffff
_08138520: .4byte 0x0000304c
_08138524: .4byte gSaveBlock2Ptr
_08138528: .4byte gUnknown_203B140
_0813852C: .4byte 0x00003058
_08138530:
	movs r0, 0x1
_08138532:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_813847C

	thumb_func_start sub_8138538
sub_8138538: @ 8138538
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	ldr r0, _08138560 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r2, _08138564 @ =0x00003214
	adds r0, r1, r2
	ldrb r7, [r0]
	cmp r7, 0x1
	bne _08138554
	b _081386EC
_08138554:
	cmp r7, 0x1
	bgt _08138568
	cmp r7, 0
	beq _08138576
	b _08138A16
	.align 2, 0
_08138560: .4byte gUnknown_203B140
_08138564: .4byte 0x00003214
_08138568:
	cmp r7, 0x2
	bne _0813856E
	b _081387E0
_0813856E:
	cmp r7, 0x3
	bne _08138574
	b _081388E0
_08138574:
	b _08138A16
_08138576:
	movs r2, 0xC8
	lsls r2, 6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08138678
	movs r1, 0xB5
	lsls r1, 1
	movs r4, 0x1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0xD
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r1, 0xBD
	lsls r1, 1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0xD
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	ldr r1, _08138660 @ =0x00000169
	str r4, [sp]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0xE
	movs r3, 0
	bl FillBgTilemapBufferRect
	ldr r1, _08138664 @ =0x00000179
	str r4, [sp]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0xE
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	ldr r6, _08138668 @ =0x0000016b
	str r4, [sp]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r0, 0x3
	adds r1, r6, 0
	movs r2, 0xF
	movs r3, 0
	bl FillBgTilemapBufferRect
	ldr r5, _0813866C @ =0x0000017b
	str r4, [sp]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r0, 0x3
	adds r1, r5, 0
	movs r2, 0xF
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	ldr r1, _08138670 @ =0x0000016d
	str r4, [sp]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0x10
	movs r3, 0
	bl FillBgTilemapBufferRect
	ldr r1, _08138674 @ =0x0000017d
	str r4, [sp]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0x10
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r0, 0x3
	adds r1, r6, 0
	movs r2, 0x11
	movs r3, 0
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r0, 0x3
	adds r1, r5, 0
	movs r2, 0x11
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	movs r1, 0xB7
	lsls r1, 1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0x12
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r1, 0xBF
	lsls r1, 1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	b _081388CC
	.align 2, 0
_08138660: .4byte 0x00000169
_08138664: .4byte 0x00000179
_08138668: .4byte 0x0000016b
_0813866C: .4byte 0x0000017b
_08138670: .4byte 0x0000016d
_08138674: .4byte 0x0000017d
_08138678:
	movs r1, 0xB5
	lsls r1, 1
	movs r4, 0x1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0xD
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r1, 0xBD
	lsls r1, 1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0xD
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	ldr r1, _081386E0 @ =0x00000189
	str r4, [sp]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0xE
	movs r3, 0
	bl FillBgTilemapBufferRect
	ldr r1, _081386E4 @ =0x00000199
	str r4, [sp]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0xE
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	ldr r1, _081386E8 @ =0x0000015b
	movs r0, 0x4
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0xF
	movs r3, 0
	bl FillBgTilemapBufferRect
	b _08138A16
	.align 2, 0
_081386E0: .4byte 0x00000189
_081386E4: .4byte 0x00000199
_081386E8: .4byte 0x0000015b
_081386EC:
	movs r1, 0xC5
	lsls r1, 1
	str r7, [sp]
	str r7, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0xD
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r1, 0xCD
	lsls r1, 1
	str r7, [sp]
	str r7, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0xD
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	movs r1, 0xAD
	lsls r1, 1
	str r7, [sp]
	str r7, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0xE
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r1, 0xB6
	lsls r1, 1
	str r7, [sp]
	str r7, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0xE
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	movs r1, 0xB5
	lsls r1, 1
	str r7, [sp]
	str r7, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0xF
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r1, 0xBD
	lsls r1, 1
	str r7, [sp]
	str r7, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0xF
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	ldr r1, _081387D0 @ =0x00000169
	str r7, [sp]
	str r7, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0x10
	movs r3, 0
	bl FillBgTilemapBufferRect
	ldr r1, _081387D4 @ =0x00000179
	str r7, [sp]
	str r7, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0x10
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	ldr r1, _081387D8 @ =0x0000016b
	str r7, [sp]
	str r7, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0x11
	movs r3, 0
	bl FillBgTilemapBufferRect
	ldr r1, _081387DC @ =0x0000017b
	str r7, [sp]
	str r7, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0x11
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	movs r1, 0xB7
	lsls r1, 1
	str r7, [sp]
	str r7, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0x12
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r1, 0xBF
	lsls r1, 1
	str r7, [sp]
	str r7, [sp, 0x4]
	str r4, [sp, 0x8]
	b _081388CC
	.align 2, 0
_081387D0: .4byte 0x00000169
_081387D4: .4byte 0x00000179
_081387D8: .4byte 0x0000016b
_081387DC: .4byte 0x0000017b
_081387E0:
	movs r0, 0xC5
	lsls r0, 1
	mov r10, r0
	movs r4, 0x1
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r5, 0
	str r5, [sp, 0x8]
	movs r0, 0x3
	mov r1, r10
	movs r2, 0xD
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r2, 0xCD
	lsls r2, 1
	mov r9, r2
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x3
	mov r1, r9
	movs r2, 0xD
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	movs r0, 0xAD
	lsls r0, 1
	mov r8, r0
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x3
	mov r1, r8
	movs r2, 0xE
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r6, 0xB6
	lsls r6, 1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x3
	adds r1, r6, 0
	movs r2, 0xE
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x3
	mov r1, r10
	movs r2, 0xF
	movs r3, 0
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x3
	mov r1, r9
	movs r2, 0xF
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x3
	mov r1, r8
	movs r2, 0x10
	movs r3, 0
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x3
	adds r1, r6, 0
	movs r2, 0x10
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	movs r1, 0xB5
	lsls r1, 1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0x11
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r1, 0xBD
	lsls r1, 1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0x11
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	ldr r1, _081388D8 @ =0x00000189
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0x12
	movs r3, 0
	bl FillBgTilemapBufferRect
	ldr r1, _081388DC @ =0x00000199
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
_081388CC:
	movs r0, 0x3
	movs r2, 0x12
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	b _08138A16
	.align 2, 0
_081388D8: .4byte 0x00000189
_081388DC: .4byte 0x00000199
_081388E0:
	ldr r2, _0813891C @ =0x00003208
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08138920
	movs r1, 0xAD
	lsls r1, 1
	movs r6, 0x4
	str r6, [sp]
	movs r5, 0x1
	str r5, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0xD
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r1, 0xB6
	lsls r1, 1
	str r6, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0xD
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	b _081389CA
	.align 2, 0
_0813891C: .4byte 0x00003208
_08138920:
	movs r0, 0xC5
	lsls r0, 1
	mov r10, r0
	movs r4, 0x1
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r5, 0
	str r5, [sp, 0x8]
	movs r0, 0x3
	mov r1, r10
	movs r2, 0xD
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r2, 0xCD
	lsls r2, 1
	mov r9, r2
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x3
	mov r1, r9
	movs r2, 0xD
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	movs r0, 0xAD
	lsls r0, 1
	mov r8, r0
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x3
	mov r1, r8
	movs r2, 0xE
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r6, 0xB6
	lsls r6, 1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x3
	adds r1, r6, 0
	movs r2, 0xE
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x3
	mov r1, r10
	movs r2, 0xF
	movs r3, 0
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x3
	mov r1, r9
	movs r2, 0xF
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x3
	mov r1, r8
	movs r2, 0x10
	movs r3, 0
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x3
	adds r1, r6, 0
	movs r2, 0x10
	movs r3, 0x1
	bl FillBgTilemapBufferRect
_081389CA:
	ldr r1, _08138A28 @ =0x0000018b
	movs r4, 0x1
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r5, 0
	str r5, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0x11
	movs r3, 0
	bl FillBgTilemapBufferRect
	ldr r1, _08138A2C @ =0x0000019b
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0x11
	movs r3, 0x1
	bl FillBgTilemapBufferRect
	ldr r1, _08138A30 @ =0x00000189
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0x12
	movs r3, 0
	bl FillBgTilemapBufferRect
	ldr r1, _08138A34 @ =0x00000199
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x3
	movs r2, 0x12
	movs r3, 0x1
	bl FillBgTilemapBufferRect
_08138A16:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08138A28: .4byte 0x0000018b
_08138A2C: .4byte 0x0000019b
_08138A30: .4byte 0x00000189
_08138A34: .4byte 0x00000199
	thumb_func_end sub_8138538

	thumb_func_start sub_8138A38
sub_8138A38: @ 8138A38
	push {r4-r6,lr}
	ldr r6, _08138A54 @ =gUnknown_203B140
	ldr r1, [r6]
	ldr r2, _08138A58 @ =0x00003214
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x2
	bgt _08138A5C
	cmp r0, 0x1
	bge _08138B0E
	cmp r0, 0
	beq _08138A62
	b _08138B0E
	.align 2, 0
_08138A54: .4byte gUnknown_203B140
_08138A58: .4byte 0x00003214
_08138A5C:
	cmp r0, 0x3
	beq _08138ABC
	b _08138B0E
_08138A62:
	movs r3, 0xC8
	lsls r3, 6
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _08138B0E
	ldr r2, _08138AB0 @ =0x00003003
	adds r0, r1, r2
	ldrb r0, [r0]
	ldr r4, _08138AB4 @ =0x00003220
	adds r1, r4
	ldrb r1, [r1]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x2F
	movs r3, 0x23
	bl BlitMoveInfoIcon
	ldr r1, [r6]
	adds r4, r1, r4
	ldr r3, _08138AB8 @ =0x00003221
	adds r0, r1, r3
	ldrb r2, [r0]
	ldrb r0, [r4]
	cmp r0, r2
	beq _08138B0E
	ldr r3, _08138AB0 @ =0x00003003
	adds r0, r1, r3
	ldrb r0, [r0]
	adds r1, r2, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x53
	movs r3, 0x23
	bl BlitMoveInfoIcon
	b _08138B0E
	.align 2, 0
_08138AB0: .4byte 0x00003003
_08138AB4: .4byte 0x00003220
_08138AB8: .4byte 0x00003221
_08138ABC:
	ldr r5, _08138B14 @ =0x00003006
	adds r0, r1, r5
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r1, [r6]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r4, _08138B18 @ =0x00003220
	adds r1, r4
	ldrb r1, [r1]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	movs r3, 0x3
	bl BlitMoveInfoIcon
	ldr r2, [r6]
	adds r4, r2, r4
	ldr r1, _08138B1C @ =0x00003221
	adds r0, r2, r1
	ldrb r1, [r0]
	ldrb r0, [r4]
	cmp r0, r1
	beq _08138B04
	adds r0, r2, r5
	ldrb r0, [r0]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x24
	movs r3, 0x3
	bl BlitMoveInfoIcon
_08138B04:
	ldr r0, [r6]
	adds r0, r5
	ldrb r0, [r0]
	bl PutWindowTilemap
_08138B0E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08138B14: .4byte 0x00003006
_08138B18: .4byte 0x00003220
_08138B1C: .4byte 0x00003221
	thumb_func_end sub_8138A38

	thumb_func_start sub_8138B20
sub_8138B20: @ 8138B20
	ldr r0, _08138B28 @ =gUnknown_203B16C
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08138B28: .4byte gUnknown_203B16C
	thumb_func_end sub_8138B20

	thumb_func_start GetMoveSlotToReplace
GetMoveSlotToReplace: @ 8138B2C
	ldr r0, _08138B34 @ =gUnknown_203B16E
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08138B34: .4byte gUnknown_203B16E
	thumb_func_end GetMoveSlotToReplace

	thumb_func_start sub_8138B38
sub_8138B38: @ 8138B38
	ldr r1, _08138B44 @ =gUnknown_203B140
	ldr r1, [r1]
	ldr r2, _08138B48 @ =0x00003208
	adds r1, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_08138B44: .4byte gUnknown_203B140
_08138B48: .4byte 0x00003208
	thumb_func_end sub_8138B38

	thumb_func_start sub_8138B4C
sub_8138B4C: @ 8138B4C
	push {lr}
	bl IsUpdateLinkStateCBActive
	cmp r0, 0
	bne _08138B84
	bl IsMultiBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08138B84
	ldr r0, _08138B7C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08138B84
	ldr r0, _08138B80 @ =gUnknown_203B16C
	ldrb r0, [r0]
	cmp r0, 0x3
	bhi _08138B76
	cmp r0, 0x1
	bne _08138B84
_08138B76:
	movs r0, 0x1
	b _08138B86
	.align 2, 0
_08138B7C: .4byte gReceivedRemoteLinkPlayers
_08138B80: .4byte gUnknown_203B16C
_08138B84:
	movs r0, 0
_08138B86:
	pop {r1}
	bx r1
	thumb_func_end sub_8138B4C

	thumb_func_start sub_8138B8C
sub_8138B8C: @ 8138B8C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08138BBC @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r2, _08138BC0 @ =0x0000321c
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08138BC4
	adds r2, 0xD8
	adds r0, r1, r2
	ldr r4, [r0]
	bl sub_8138B20
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	adds r1, r4
	adds r0, r5, 0
	movs r2, 0x64
	bl memcpy
	b _08138BE2
	.align 2, 0
_08138BBC: .4byte gUnknown_203B140
_08138BC0: .4byte 0x0000321c
_08138BC4:
	ldr r2, _08138BE8 @ =0x000032f4
	adds r0, r1, r2
	ldr r4, [r0]
	bl sub_8138B20
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 4
	adds r4, r1
	adds r0, r4, 0
	adds r1, r5, 0
	bl BoxMonToMon
_08138BE2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08138BE8: .4byte 0x000032f4
	thumb_func_end sub_8138B8C

	thumb_func_start sub_8138BEC
sub_8138BEC: @ 8138BEC
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0x1
	beq _08138C0C
	cmp r1, 0x1
	bgt _08138C02
	cmp r1, 0
	beq _08138C08
	b _08138C14
_08138C02:
	cmp r2, 0x2
	beq _08138C10
	b _08138C14
_08138C08:
	movs r1, 0xD
	b _08138C16
_08138C0C:
	movs r1, 0xE
	b _08138C16
_08138C10:
	movs r1, 0xF
	b _08138C16
_08138C14:
	movs r1, 0x10
_08138C16:
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_8138BEC

	thumb_func_start sub_8138C24
sub_8138C24: @ 8138C24
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0x1
	beq _08138C44
	cmp r1, 0x1
	bgt _08138C3A
	cmp r1, 0
	beq _08138C40
	b _08138C4C
_08138C3A:
	cmp r2, 0x2
	beq _08138C48
	b _08138C4C
_08138C40:
	movs r1, 0x11
	b _08138C4E
_08138C44:
	movs r1, 0x12
	b _08138C4E
_08138C48:
	movs r1, 0x13
	b _08138C4E
_08138C4C:
	movs r1, 0x14
_08138C4E:
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_8138C24

	thumb_func_start sub_8138C5C
sub_8138C5C: @ 8138C5C
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _08138C78 @ =gUnknown_203B140
	ldr r0, [r6]
	ldr r5, _08138C7C @ =0x00003290
	adds r0, r5
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _08138C80
	movs r0, 0x7
	b _08138CD2
	.align 2, 0
_08138C78: .4byte gUnknown_203B140
_08138C7C: .4byte 0x00003290
_08138C80:
	movs r0, 0x88
	ands r0, r4
	cmp r0, 0
	beq _08138C8C
	movs r0, 0x1
	b _08138CD2
_08138C8C:
	movs r0, 0x40
	ands r0, r4
	cmp r0, 0
	beq _08138C98
	movs r0, 0x2
	b _08138CD2
_08138C98:
	movs r0, 0x7
	ands r0, r4
	cmp r0, 0
	beq _08138CA4
	movs r0, 0x3
	b _08138CD2
_08138CA4:
	movs r0, 0x20
	ands r0, r4
	cmp r0, 0
	beq _08138CB0
	movs r0, 0x4
	b _08138CD2
_08138CB0:
	movs r0, 0x10
	ands r0, r4
	cmp r0, 0
	beq _08138CBC
	movs r0, 0x5
	b _08138CD2
_08138CBC:
	ldr r0, [r6]
	adds r0, r5
	movs r1, 0
	bl CheckPartyPokerus
	lsls r0, 24
	cmp r0, 0
	bne _08138CD0
	movs r0, 0
	b _08138CD2
_08138CD0:
	movs r0, 0x6
_08138CD2:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8138C5C

	thumb_func_start sub_8138CD8
sub_8138CD8: @ 8138CD8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r6, _08138CFC @ =gUnknown_203B140
	ldr r0, [r6]
	ldr r7, _08138D00 @ =0x00003288
	adds r3, r0, r7
	ldrb r1, [r3]
	cmp r1, 0x1
	bne _08138CF0
	b _08138FE8
_08138CF0:
	cmp r1, 0x1
	bgt _08138D04
	cmp r1, 0
	beq _08138D12
	b _08139094
	.align 2, 0
_08138CFC: .4byte gUnknown_203B140
_08138D00: .4byte 0x00003288
_08138D04:
	cmp r1, 0x2
	bne _08138D0A
	b _08139010
_08138D0A:
	cmp r1, 0x3
	bne _08138D10
	b _08139034
_08138D10:
	b _08139094
_08138D12:
	bl sub_80BF72C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08138D20
	b _08139094
_08138D20:
	bl sub_800B270
	cmp r0, 0x1
	bne _08138D2A
	b _08139094
_08138D2A:
	ldr r0, _08138D78 @ =gMain
	mov r9, r0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08138DD0
	ldr r4, _08138D7C @ =gUnknown_203B16D
	ldrb r0, [r4]
	cmp r0, 0
	beq _08138D84
	ldr r0, [r6]
	adds r0, r7
	movs r1, 0x2
	strb r1, [r0]
	movs r0, 0x5
	bl PlaySE
	ldrb r4, [r4]
	cmp r4, 0
	bne _08138D5A
	b _08139094
_08138D5A:
	ldr r0, [r6]
	ldr r2, _08138D80 @ =0x00003258
	adds r1, r0, r2
_08138D60:
	subs r4, 0x1
	lsls r0, r4, 1
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, 0
	beq _08138D6E
	b _08139024
_08138D6E:
	lsls r0, r4, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08138D60
	b _08139094
	.align 2, 0
_08138D78: .4byte gMain
_08138D7C: .4byte gUnknown_203B16D
_08138D80: .4byte 0x00003258
_08138D84:
	movs r0, 0x4
	strb r0, [r4]
	ldr r0, [r6]
	adds r0, r7
	movs r1, 0x2
	strb r1, [r0]
	movs r0, 0x5
	bl PlaySE
	ldr r1, [r6]
	ldr r3, _08138DC8 @ =0x00003268
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08138DA4
	b _08139094
_08138DA4:
	ldrb r4, [r4]
	cmp r4, 0
	bne _08138DAC
	b _08139094
_08138DAC:
	ldr r6, _08138DCC @ =0x00003258
	adds r1, r6
_08138DB0:
	subs r4, 0x1
	lsls r0, r4, 1
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, 0
	beq _08138DBE
	b _08139024
_08138DBE:
	lsls r0, r4, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08138DB0
	b _08139094
	.align 2, 0
_08138DC8: .4byte 0x00003268
_08138DCC: .4byte 0x00003258
_08138DD0:
	movs r0, 0x80
	ands r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _08138E80
	ldr r3, _08138E0C @ =gUnknown_203B16D
	ldrb r0, [r3]
	mov r12, r3
	cmp r0, 0x3
	bhi _08138E68
	movs r5, 0x4
	ldr r0, [r6]
	adds r0, r7
	movs r4, 0x2
	strb r4, [r0]
	ldr r1, [r6]
	ldr r6, _08138E10 @ =0x00003268
	adds r0, r1, r6
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08138E16
	ldrb r0, [r3]
	cmp r0, 0x3
	bne _08138E14
	strb r2, [r3]
	adds r0, r1, r7
	strb r4, [r0]
	b _08138E78
	.align 2, 0
_08138E0C: .4byte gUnknown_203B16D
_08138E10: .4byte 0x00003268
_08138E14:
	movs r5, 0x3
_08138E16:
	mov r0, r12
	ldrb r4, [r0]
	ldr r2, _08138E58 @ =gUnknown_203B140
	cmp r4, r5
	bcs _08138E3C
	ldr r0, [r2]
	ldr r3, _08138E5C @ =0x00003258
	adds r1, r0, r3
_08138E26:
	adds r4, 0x1
	lsls r0, r4, 1
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, 0
	beq _08138E34
	b _08139024
_08138E34:
	lsls r0, r4, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _08138E26
_08138E3C:
	ldr r0, [r2]
	ldr r6, _08138E60 @ =0x00003268
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0
	bne _08138E4A
	b _08139024
_08138E4A:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08138E64 @ =gUnknown_203B16D
	movs r0, 0
	strb r0, [r1]
	b _08139094
	.align 2, 0
_08138E58: .4byte gUnknown_203B140
_08138E5C: .4byte 0x00003258
_08138E60: .4byte 0x00003268
_08138E64: .4byte gUnknown_203B16D
_08138E68:
	cmp r0, 0x4
	beq _08138E6E
	b _08139094
_08138E6E:
	strb r2, [r3]
	ldr r0, [r6]
	adds r0, r7
	movs r1, 0x2
	strb r1, [r0]
_08138E78:
	movs r0, 0x5
	bl PlaySE
	b _08139094
_08138E80:
	movs r0, 0x1
	mov r8, r0
	movs r5, 0x1
	ands r5, r1
	cmp r5, 0
	beq _08138F6C
	movs r0, 0x5
	bl PlaySE
	ldr r3, _08138EB8 @ =gUnknown_203B16D
	ldrb r5, [r3]
	cmp r5, 0x4
	bne _08138EC8
	strb r4, [r3]
	ldr r0, _08138EBC @ =gUnknown_203B16E
	strb r4, [r0]
	ldr r0, [r6]
	ldr r1, _08138EC0 @ =0x00003268
	adds r0, r1
	strb r4, [r0]
	movs r0, 0x1
	bl sub_813A0E8
	ldr r0, [r6]
	ldr r2, _08138EC4 @ =0x00003224
	adds r0, r2
	strb r4, [r0]
	b _08138FB8
	.align 2, 0
_08138EB8: .4byte gUnknown_203B16D
_08138EBC: .4byte gUnknown_203B16E
_08138EC0: .4byte 0x00003268
_08138EC4: .4byte 0x00003224
_08138EC8:
	ldr r1, [r6]
	ldr r0, _08138F04 @ =0x00003268
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, 0x1
	beq _08138F18
	ldr r3, _08138F08 @ =0x00003024
	adds r0, r1, r3
	ldr r0, [r0]
	cmp r0, 0
	beq _08138EE0
	b _08139094
_08138EE0:
	ldr r0, _08138F0C @ =0x00000439
	add r0, r9
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08138EF0
	b _08139094
_08138EF0:
	ldr r0, _08138F10 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _08138EFA
	b _08139094
_08138EFA:
	ldr r0, _08138F14 @ =gUnknown_203B16E
	strb r5, [r0]
	mov r6, r8
	strb r6, [r2]
	b _08139094
	.align 2, 0
_08138F04: .4byte 0x00003268
_08138F08: .4byte 0x00003024
_08138F0C: .4byte 0x00000439
_08138F10: .4byte gReceivedRemoteLinkPlayers
_08138F14: .4byte gUnknown_203B16E
_08138F18:
	strb r4, [r2]
	ldr r1, _08138F38 @ =gUnknown_203B16E
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08138F26
	b _08139094
_08138F26:
	ldr r0, [r6]
	ldr r1, _08138F3C @ =0x0000321c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08138F40
	bl sub_81390B0
	b _08138F44
	.align 2, 0
_08138F38: .4byte gUnknown_203B16E
_08138F3C: .4byte 0x0000321c
_08138F40:
	bl sub_81391EC
_08138F44:
	ldr r4, _08138F60 @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r2, _08138F64 @ =0x00003290
	adds r0, r2
	bl sub_8139328
	bl sub_81367B0
	ldr r0, [r4]
	ldr r3, _08138F68 @ =0x00003288
	adds r0, r3
	movs r1, 0x2
	b _08139092
	.align 2, 0
_08138F60: .4byte gUnknown_203B140
_08138F64: .4byte 0x00003290
_08138F68: .4byte 0x00003288
_08138F6C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08138F76
	b _08139094
_08138F76:
	ldr r0, [r6]
	ldr r1, _08138F90 @ =0x00003268
	adds r2, r0, r1
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _08138F9C
	ldr r0, _08138F94 @ =gUnknown_203B16E
	ldr r1, _08138F98 @ =gUnknown_203B16D
	ldrb r1, [r1]
	strb r1, [r0]
	strb r5, [r2]
	b _08139094
	.align 2, 0
_08138F90: .4byte 0x00003268
_08138F94: .4byte gUnknown_203B16E
_08138F98: .4byte gUnknown_203B16D
_08138F9C:
	ldr r1, _08138FD8 @ =gUnknown_203B16D
	ldrb r0, [r1]
	cmp r0, 0x4
	bne _08138FAA
	strb r5, [r1]
	ldr r0, _08138FDC @ =gUnknown_203B16E
	strb r5, [r0]
_08138FAA:
	movs r0, 0x1
	bl sub_813A0E8
	ldr r0, [r6]
	ldr r2, _08138FE0 @ =0x00003224
	adds r0, r2
	strb r5, [r0]
_08138FB8:
	ldr r0, [r6]
	ldr r4, _08138FE4 @ =0x00003214
	adds r0, r4
	ldrb r0, [r0]
	bl sub_8138414
	ldr r1, [r6]
	adds r1, r4
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r7
	mov r3, r8
	strb r3, [r0]
	b _08139094
	.align 2, 0
_08138FD8: .4byte gUnknown_203B16D
_08138FDC: .4byte gUnknown_203B16E
_08138FE0: .4byte 0x00003224
_08138FE4: .4byte 0x00003214
_08138FE8:
	ldr r2, _08139004 @ =gTasks
	ldr r6, _08139008 @ =0x00003018
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _0813900C @ =sub_81351A0
	str r1, [r0]
	movs r0, 0
	strb r0, [r3]
	b _08139094
	.align 2, 0
_08139004: .4byte gTasks
_08139008: .4byte 0x00003018
_0813900C: .4byte sub_81351A0
_08139010:
	bl sub_8136F4C
	bl sub_81374E8
	bl sub_8137BD0
	ldr r0, [r6]
	adds r0, r7
	movs r1, 0x3
	b _08139092
_08139024:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08139030 @ =gUnknown_203B16D
	strb r4, [r0]
	b _08139094
	.align 2, 0
_08139030: .4byte gUnknown_203B16D
_08139034:
	bl sub_80BF72C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08139094
	bl sub_800B270
	cmp r0, 0x1
	beq _08139094
	ldr r0, [r6]
	ldr r1, _081390A0 @ =0x00003003
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r6]
	ldr r2, _081390A4 @ =0x00003004
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r6]
	ldr r3, _081390A8 @ =0x00003005
	adds r0, r3
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r6]
	ldr r1, _081390AC @ =0x00003006
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	ldr r0, [r6]
	adds r0, r7
	movs r1, 0
_08139092:
	strb r1, [r0]
_08139094:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081390A0: .4byte 0x00003003
_081390A4: .4byte 0x00003004
_081390A8: .4byte 0x00003005
_081390AC: .4byte 0x00003006
	thumb_func_end sub_8138CD8

	thumb_func_start sub_81390B0
sub_81390B0: @ 81390B0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	ldr r0, _081391D8 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _081391DC @ =0x000032f4
	adds r0, r1
	ldr r6, [r0]
	bl sub_8138B20
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	adds r6, r0
	ldr r3, _081391E0 @ =gUnknown_203B16D
	ldrb r1, [r3]
	adds r1, 0xD
	adds r0, r6, 0
	bl GetMonData
	mov r1, sp
	adds r1, 0x2
	str r1, [sp, 0x8]
	strh r0, [r1]
	ldr r3, _081391E4 @ =gUnknown_203B16E
	mov r8, r3
	ldrb r1, [r3]
	adds r1, 0xD
	adds r0, r6, 0
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	ldr r0, _081391E0 @ =gUnknown_203B16D
	ldrb r1, [r0]
	adds r1, 0x11
	adds r0, r6, 0
	bl GetMonData
	movs r1, 0x5
	add r1, sp
	mov r10, r1
	strb r0, [r1]
	mov r3, r8
	ldrb r1, [r3]
	adds r1, 0x11
	adds r0, r6, 0
	bl GetMonData
	add r7, sp, 0x4
	strb r0, [r7]
	adds r0, r6, 0
	movs r1, 0x15
	bl GetMonData
	mov r4, sp
	adds r4, 0x6
	strb r0, [r4]
	ldr r5, _081391E8 @ =gPPUpGetMask
	ldr r0, _081391E0 @ =gUnknown_203B16D
	ldrb r1, [r0]
	adds r0, r1, r5
	ldrb r0, [r0]
	mov r9, r0
	ldrb r3, [r4]
	adds r2, r3, 0
	mov r0, r9
	ands r2, r0
	lsls r1, 1
	asrs r2, r1
	lsls r2, 24
	lsrs r2, 24
	mov r1, r8
	ldrb r0, [r1]
	adds r1, r0, r5
	ldrb r1, [r1]
	ands r1, r3
	lsls r0, 1
	asrs r1, r0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r9
	bics r3, r0
	strb r3, [r4]
	mov r3, r8
	ldrb r0, [r3]
	adds r0, r5
	ldrb r3, [r0]
	ldrb r0, [r4]
	bics r0, r3
	strb r0, [r4]
	mov r3, r8
	ldrb r0, [r3]
	lsls r0, 1
	lsls r2, r0
	ldr r3, _081391E0 @ =gUnknown_203B16D
	ldrb r0, [r3]
	lsls r0, 1
	lsls r1, r0
	adds r2, r1
	ldrb r0, [r4]
	orrs r0, r2
	strb r0, [r4]
	ldrb r1, [r3]
	adds r1, 0xD
	adds r0, r6, 0
	mov r2, sp
	bl SetMonData
	mov r0, r8
	ldrb r1, [r0]
	adds r1, 0xD
	adds r0, r6, 0
	ldr r2, [sp, 0x8]
	bl SetMonData
	ldr r3, _081391E0 @ =gUnknown_203B16D
	ldrb r1, [r3]
	adds r1, 0x11
	adds r0, r6, 0
	adds r2, r7, 0
	bl SetMonData
	mov r0, r8
	ldrb r1, [r0]
	adds r1, 0x11
	adds r0, r6, 0
	mov r2, r10
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x15
	adds r2, r4, 0
	bl SetMonData
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081391D8: .4byte gUnknown_203B140
_081391DC: .4byte 0x000032f4
_081391E0: .4byte gUnknown_203B16D
_081391E4: .4byte gUnknown_203B16E
_081391E8: .4byte gPPUpGetMask
	thumb_func_end sub_81390B0

	thumb_func_start sub_81391EC
sub_81391EC: @ 81391EC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	ldr r0, _08139314 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _08139318 @ =0x000032f4
	adds r0, r1
	ldr r6, [r0]
	bl sub_8138B20
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 4
	adds r6, r1
	ldr r3, _0813931C @ =gUnknown_203B16D
	ldrb r1, [r3]
	adds r1, 0xD
	adds r0, r6, 0
	bl GetBoxMonData
	mov r1, sp
	adds r1, 0x2
	str r1, [sp, 0x8]
	strh r0, [r1]
	ldr r3, _08139320 @ =gUnknown_203B16E
	mov r8, r3
	ldrb r1, [r3]
	adds r1, 0xD
	adds r0, r6, 0
	bl GetBoxMonData
	mov r1, sp
	strh r0, [r1]
	ldr r0, _0813931C @ =gUnknown_203B16D
	ldrb r1, [r0]
	adds r1, 0x11
	adds r0, r6, 0
	bl GetBoxMonData
	movs r1, 0x5
	add r1, sp
	mov r10, r1
	strb r0, [r1]
	mov r3, r8
	ldrb r1, [r3]
	adds r1, 0x11
	adds r0, r6, 0
	bl GetBoxMonData
	add r7, sp, 0x4
	strb r0, [r7]
	adds r0, r6, 0
	movs r1, 0x15
	bl GetBoxMonData
	mov r4, sp
	adds r4, 0x6
	strb r0, [r4]
	ldr r5, _08139324 @ =gPPUpGetMask
	ldr r0, _0813931C @ =gUnknown_203B16D
	ldrb r1, [r0]
	adds r0, r1, r5
	ldrb r0, [r0]
	mov r9, r0
	ldrb r3, [r4]
	adds r2, r3, 0
	mov r0, r9
	ands r2, r0
	lsls r1, 1
	asrs r2, r1
	lsls r2, 24
	lsrs r2, 24
	mov r1, r8
	ldrb r0, [r1]
	adds r1, r0, r5
	ldrb r1, [r1]
	ands r1, r3
	lsls r0, 1
	asrs r1, r0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r9
	bics r3, r0
	strb r3, [r4]
	mov r3, r8
	ldrb r0, [r3]
	adds r0, r5
	ldrb r3, [r0]
	ldrb r0, [r4]
	bics r0, r3
	strb r0, [r4]
	mov r3, r8
	ldrb r0, [r3]
	lsls r0, 1
	lsls r2, r0
	ldr r3, _0813931C @ =gUnknown_203B16D
	ldrb r0, [r3]
	lsls r0, 1
	lsls r1, r0
	adds r2, r1
	ldrb r0, [r4]
	orrs r0, r2
	strb r0, [r4]
	ldrb r1, [r3]
	adds r1, 0xD
	adds r0, r6, 0
	mov r2, sp
	bl SetBoxMonData
	mov r0, r8
	ldrb r1, [r0]
	adds r1, 0xD
	adds r0, r6, 0
	ldr r2, [sp, 0x8]
	bl SetBoxMonData
	ldr r3, _0813931C @ =gUnknown_203B16D
	ldrb r1, [r3]
	adds r1, 0x11
	adds r0, r6, 0
	adds r2, r7, 0
	bl SetBoxMonData
	mov r0, r8
	ldrb r1, [r0]
	adds r1, 0x11
	adds r0, r6, 0
	mov r2, r10
	bl SetBoxMonData
	adds r0, r6, 0
	movs r1, 0x15
	adds r2, r4, 0
	bl SetBoxMonData
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08139314: .4byte gUnknown_203B140
_08139318: .4byte 0x000032f4
_0813931C: .4byte gUnknown_203B16D
_08139320: .4byte gUnknown_203B16E
_08139324: .4byte gPPUpGetMask
	thumb_func_end sub_81391EC

	thumb_func_start sub_8139328
sub_8139328: @ 8139328
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08139358 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r2, _0813935C @ =0x0000321c
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08139360
	adds r2, 0xD8
	adds r0, r1, r2
	ldr r4, [r0]
	bl sub_8138B20
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	adds r1, r4
	adds r0, r5, 0
	movs r2, 0x64
	bl memcpy
	b _0813937E
	.align 2, 0
_08139358: .4byte gUnknown_203B140
_0813935C: .4byte 0x0000321c
_08139360:
	ldr r2, _08139384 @ =0x000032f4
	adds r0, r1, r2
	ldr r4, [r0]
	bl sub_8138B20
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 4
	adds r4, r1
	adds r0, r4, 0
	adds r1, r5, 0
	bl BoxMonToMon
_0813937E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08139384: .4byte 0x000032f4
	thumb_func_end sub_8139328

	thumb_func_start sub_8139388
sub_8139388: @ 8139388
	push {r4,lr}
	ldr r4, _081393BC @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r1, _081393C0 @ =0x00003290
	adds r0, r1
	ldr r1, _081393C4 @ =gUnknown_203B16D
	ldrb r1, [r1]
	bl sub_8138BEC
	lsls r0, 16
	lsrs r0, 16
	bl sub_8125A90
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
_081393BC: .4byte gUnknown_203B140
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
	ldr r1, _081393F8 @ =gUnknown_203B140
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
_081393F8: .4byte gUnknown_203B140
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
	ldr r0, _0813943C @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r4, _08139440 @ =0x00003288
	adds r1, r4
	b _08139728
	.align 2, 0
_0813943C: .4byte gUnknown_203B140
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
	ldr r0, _08139464 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r0, _08139468 @ =0x00003288
	adds r1, r0
	b _08139728
	.align 2, 0
_08139460: .4byte gPaletteFade
_08139464: .4byte gUnknown_203B140
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
	ldr r0, _081395B0 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r3, _081395B4 @ =0x00003288
	adds r0, r3
	b _081395F0
	.align 2, 0
_081395A4: .4byte gUnknown_203B16D
_081395A8: .4byte gUnknown_203B16E
_081395AC: .4byte gSpecialVar_0x8005
_081395B0: .4byte gUnknown_203B140
_081395B4: .4byte 0x00003288
_081395B8:
	movs r0, 0x1A
	bl PlaySE
	ldr r0, _081395CC @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r4, _081395D0 @ =0x00003288
	adds r0, r4
	movs r1, 0x5
	strb r1, [r0]
	b _0813975A
	.align 2, 0
_081395CC: .4byte gUnknown_203B140
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
	ldr r0, _08139620 @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r2, _08139624 @ =0x00003288
	adds r0, r2
	movs r1, 0x4
	strb r1, [r0]
	b _0813975A
	.align 2, 0
_08139620: .4byte gUnknown_203B140
_08139624: .4byte 0x00003288
_08139628:
	bl sub_80BF72C
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
	ldr r4, _08139690 @ =gUnknown_203B140
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
_08139690: .4byte gUnknown_203B140
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
	ldr r0, _08139730 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r2, _08139734 @ =0x00003288
	adds r1, r2
_08139728:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0813975A
	.align 2, 0
_08139730: .4byte gUnknown_203B140
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
	ldr r0, _081397A4 @ =gUnknown_203B140
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
_081397A4: .4byte gUnknown_203B140
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
	ldr r5, _081398C0 @ =gUnknown_203B140
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
_081398C0: .4byte gUnknown_203B140
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
	ldr r5, _081399D0 @ =gUnknown_203B140
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
	ldr r0, _081399DC @ =sub_804CF14
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
_081399D0: .4byte gUnknown_203B140
_081399D4: .4byte 0x00003290
_081399D8: .4byte 0x000032f8
_081399DC: .4byte sub_804CF14
_081399E0: .4byte 0x00003024
_081399E4: .4byte 0x0000ffff
_081399E8:
	ldr r0, _08139A1C @ =gUnknown_203B16C
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
_08139A1C: .4byte gUnknown_203B16C
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
	ldr r0, _08139AA4 @ =gUnknown_203B140
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
_08139AA4: .4byte gUnknown_203B140
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
	ldr r1, _08139AF4 @ =gUnknown_203B140
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
_08139AF4: .4byte gUnknown_203B140
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
_08139BD8: .double 0.8
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
_08139C04: .double 0.6
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
	ldr r1, _08139C78 @ =gUnknown_203B140
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
_08139C78: .4byte gUnknown_203B140
_08139C7C: .4byte 0x00003010
	thumb_func_end sub_8139C44

	thumb_func_start sub_8139C80
sub_8139C80: @ 8139C80
	push {r4,lr}
	ldr r0, _08139CA4 @ =gUnknown_203B140
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
_08139CA4: .4byte gUnknown_203B140
_08139CA8: .4byte 0x00003010
_08139CAC: .4byte gUnknown_203B170
	thumb_func_end sub_8139C80

	thumb_func_start sub_8139CB0
sub_8139CB0: @ 8139CB0
	push {r4,lr}
	ldr r0, _08139CD4 @ =gUnknown_203B140
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
_08139CD4: .4byte gUnknown_203B140
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
	ldr r1, _08139D40 @ =gUnknown_82606F4
	adds r0, r1
	movs r1, 0x6A
	movs r2, 0x58
	movs r3, 0
	bl CreateSprite
	ldr r2, _08139D44 @ =gUnknown_203B140
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
_08139D40: .4byte gUnknown_82606F4
_08139D44: .4byte gUnknown_203B140
_08139D48: .4byte 0x0000300c
_08139D4C: .4byte gSprites
_08139D50: .4byte SpriteCallbackDummy
	thumb_func_end sub_8139CB0

	thumb_func_start sub_8139D54
sub_8139D54: @ 8139D54
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08139D84 @ =gSprites
	ldr r1, _08139D88 @ =gUnknown_203B140
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
_08139D88: .4byte gUnknown_203B140
_08139D8C: .4byte 0x0000300c
	thumb_func_end sub_8139D54

	thumb_func_start sub_8139D90
sub_8139D90: @ 8139D90
	push {lr}
	ldr r0, _08139DB0 @ =gUnknown_203B140
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
_08139DB0: .4byte gUnknown_203B140
_08139DB4: .4byte 0x0000300c
_08139DB8: .4byte gSprites
	thumb_func_end sub_8139D90

	thumb_func_start sub_8139DBC
sub_8139DBC: @ 8139DBC
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r6, _08139E08 @ =gUnknown_203B140
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
	ldr r0, _08139E14 @ =sub_804CF14
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
_08139E08: .4byte gUnknown_203B140
_08139E0C: .4byte 0x00003290
_08139E10: .4byte 0x000032f8
_08139E14: .4byte sub_804CF14
_08139E18: .4byte 0x00003024
_08139E1C: .4byte SpriteCallbackDummy
_08139E20:
	ldr r1, _08139E28 @ =SpriteCallbackDummy
	movs r0, 0
	b _08139E52
	.align 2, 0
_08139E28: .4byte SpriteCallbackDummy
_08139E2C:
	ldr r0, _08139E48 @ =gUnknown_203B16C
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
_08139E48: .4byte gUnknown_203B16C
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
	ldr r0, _08139EA4 @ =gUnknown_203B140
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
_08139EA4: .4byte gUnknown_203B140
_08139EA8:
	ldr r2, _08139ED8 @ =gSprites
	ldr r0, _08139EDC @ =gUnknown_203B140
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
_08139EDC: .4byte gUnknown_203B140
_08139EE0: .4byte 0x00003014
	thumb_func_end sub_8139DBC

	thumb_func_start sub_8139EE4
sub_8139EE4: @ 8139EE4
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08139F14 @ =gSprites
	ldr r1, _08139F18 @ =gUnknown_203B140
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
_08139F18: .4byte gUnknown_203B140
_08139F1C: .4byte 0x00003014
	thumb_func_end sub_8139EE4

	thumb_func_start sub_8139F20
sub_8139F20: @ 8139F20
	push {r4,lr}
	ldr r4, _08139F54 @ =gUnknown_203B140
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
_08139F54: .4byte gUnknown_203B140
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
	ldr r3, _0813A19C @ =gUnknown_203B140
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
_0813A19C: .4byte gUnknown_203B140
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
	ldr r4, _0813A38C @ =gUnknown_203B140
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
_0813A38C: .4byte gUnknown_203B140
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
	ldr r1, _0813A3EC @ =gUnknown_203B140
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
_0813A3EC: .4byte gUnknown_203B140
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
	ldr r5, _0813A4C4 @ =gUnknown_203B140
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
_0813A4C4: .4byte gUnknown_203B140
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
	ldr r5, _0813A688 @ =gUnknown_203B140
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
_0813A688: .4byte gUnknown_203B140
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
	ldr r6, _0813AAD4 @ =gUnknown_203B140
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
_0813AAD4: .4byte gUnknown_203B140
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
	ldr r4, _0813ACE4 @ =gUnknown_203B140
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
_0813ACE4: .4byte gUnknown_203B140
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
	ldr r4, _0813AD44 @ =gUnknown_203B140
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
_0813AD44: .4byte gUnknown_203B140
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
	ldr r0, _0813AD8C @ =gUnknown_203B140
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
_0813AD8C: .4byte gUnknown_203B140
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
	ldr r4, _0813AEF8 @ =gUnknown_203B140
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
_0813AEF8: .4byte gUnknown_203B140
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
	ldr r0, _0813AF34 @ =gUnknown_203B140
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
_0813AF34: .4byte gUnknown_203B140
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
	ldr r4, _0813AF7C @ =gUnknown_203B140
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
_0813AF7C: .4byte gUnknown_203B140
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
	ldr r5, _0813B058 @ =gUnknown_203B140
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
_0813B058: .4byte gUnknown_203B140
_0813B05C: .4byte 0x00003290
_0813B060: .4byte 0x000032fc
_0813B064: .4byte gUnknown_84636E0
	thumb_func_end sub_813AFFC

	thumb_func_start sub_813B068
sub_813B068: @ 813B068
	push {lr}
	ldr r0, _0813B07C @ =gUnknown_203B140
	ldr r0, [r0]
	ldr r1, _0813B080 @ =0x000032fc
	adds r0, r1
	ldr r0, [r0]
	bl DestroySpriteAndFreeResources
	pop {r0}
	bx r0
	.align 2, 0
_0813B07C: .4byte gUnknown_203B140
_0813B080: .4byte 0x000032fc
	thumb_func_end sub_813B068

	thumb_func_start sub_813B084
sub_813B084: @ 813B084
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0813B0B0 @ =gUnknown_203B140
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
_0813B0B0: .4byte gUnknown_203B140
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
	ldr r4, _0813B114 @ =gUnknown_203B140
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
_0813B114: .4byte gUnknown_203B140
_0813B118: .4byte 0x00003290
_0813B11C: .4byte 0x000032fc
	thumb_func_end sub_813B0E4

	thumb_func_start sub_813B120
sub_813B120: @ 813B120
	push {r4-r6,lr}
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r1, _0813B154 @ =gUnknown_203B140
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
_0813B154: .4byte gUnknown_203B140
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
	bl sub_8138B20
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, [r6]
	ldr r3, _0813B194 @ =0x00003210
	adds r0, r3
	ldrb r2, [r0]
	adds r3, r5, 0
	adds r0, r4, 0
	bl sub_808BDE8
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
	ldr r0, _0813B1FC @ =gUnknown_203B16C
	strb r2, [r0]
	ldr r0, _0813B200 @ =sub_813B3F0
	movs r1, 0
	bl CreateTask
	ldr r0, _0813B204 @ =gUnknown_203B140
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
_0813B1FC: .4byte gUnknown_203B16C
_0813B200: .4byte sub_813B3F0
_0813B204: .4byte gUnknown_203B140
_0813B208: .4byte 0x0000328c
	thumb_func_end sub_813B120

	thumb_func_start sub_813B20C
sub_813B20C: @ 813B20C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _0813B258 @ =gUnknown_203B140
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
	ldr r6, _0813B264 @ =gUnknown_203B16C
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
_0813B258: .4byte gUnknown_203B140
_0813B25C: .4byte 0x000032f4
_0813B260: .4byte 0x00003214
_0813B264: .4byte gUnknown_203B16C
_0813B268: .4byte 0x00003210
_0813B26C:
	lsls r5, r4, 24
_0813B26E:
	lsls r0, r6, 24
	asrs r0, 24
	asrs r1, r5, 24
	adds r0, r1
	lsls r0, 24
	ldr r4, _0813B29C @ =gUnknown_203B16C
	lsrs r6, r0, 24
	asrs r0, 24
	ldrb r3, [r4]
	adds r1, r0, r3
	cmp r1, 0
	blt _0813B294
	ldr r0, _0813B2A0 @ =gUnknown_203B140
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
_0813B29C: .4byte gUnknown_203B16C
_0813B2A0: .4byte gUnknown_203B140
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
	ldr r0, _0813B2F4 @ =gUnknown_203B140
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
_0813B2F4: .4byte gUnknown_203B140
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
	bl sub_8138B20
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
	ldr r1, _0813B414 @ =gUnknown_203B140
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
_0813B414: .4byte gUnknown_203B140
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
	ldr r0, _0813B470 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r0, _0813B474 @ =0x0000328c
	adds r1, r0
	b _0813B72C
	.align 2, 0
_0813B468: .4byte gUnknown_203B16D
_0813B46C: .4byte gUnknown_203B16E
_0813B470: .4byte gUnknown_203B140
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
	ldr r4, _0813B52C @ =gUnknown_203B140
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
_0813B52C: .4byte gUnknown_203B140
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
	ldr r0, _0813B560 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r4, _0813B564 @ =0x0000328c
	adds r1, r4
	b _0813B72C
	.align 2, 0
_0813B55C: .4byte gUnknown_8E9B310
_0813B560: .4byte gUnknown_203B140
_0813B564: .4byte 0x0000328c
_0813B568:
	ldr r4, _0813B5A8 @ =gUnknown_203B140
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
_0813B5A8: .4byte gUnknown_203B140
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
	ldr r0, _0813B5F4 @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r0, _0813B5F8 @ =0x0000328c
	adds r1, r0
	b _0813B72C
	.align 2, 0
_0813B5E8: .4byte 0x0000323c
_0813B5EC: .4byte gUnknown_8E9B598
_0813B5F0: .4byte gUnknown_8E9B750
_0813B5F4: .4byte gUnknown_203B140
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
	ldr r0, _0813B64C @ =gUnknown_203B140
	ldr r1, [r0]
	ldr r4, _0813B650 @ =0x0000328c
	adds r1, r4
	b _0813B72C
	.align 2, 0
_0813B64C: .4byte gUnknown_203B140
_0813B650: .4byte 0x0000328c
_0813B654:
	bl sub_8138A38
	bl sub_8138538
	ldr r4, _0813B670 @ =gUnknown_203B140
	ldr r0, [r4]
	ldr r1, _0813B674 @ =0x00003214
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8137D28
	ldr r1, [r4]
	b _0813B728
	.align 2, 0
_0813B670: .4byte gUnknown_203B140
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
	bl sub_8058244
	cmp r0, 0
	bne _0813B746
	bl sub_800B270
	cmp r0, 0
	bne _0813B746
	bl sub_813AFC4
	bl sub_813B784
_0813B724:
	ldr r0, _0813B734 @ =gUnknown_203B140
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
_0813B734: .4byte gUnknown_203B140
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
	ldr r4, _0813B7BC @ =gUnknown_203B140
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
_0813B7BC: .4byte gUnknown_203B140
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
	ldr r0, _0813B828 @ =gUnknown_203B140
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
_0813B828: .4byte gUnknown_203B140
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
