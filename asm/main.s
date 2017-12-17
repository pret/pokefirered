	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start AgbMain
AgbMain: @ 80003A4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r0, 0xFF
	bl RegisterRamReset
	movs r1, 0xA0
	lsls r1, 19
	ldr r2, _08000458 @ =0x00007fff
	adds r0, r2, 0
	strh r0, [r1]
	bl sub_8000968
	ldr r1, _0800045C @ =0x04000204
	ldr r2, _08000460 @ =0x00004014
	adds r0, r2, 0
	strh r0, [r1]
	bl sub_80005C0
	bl sub_8000688
	bl m4aSoundInit
	bl sub_8000598
	bl sub_80F86C4
	bl sub_804BFE4
	bl sub_80004C4
	bl sub_8071938
	bl sub_8000BFC
	bl sub_8001028
	ldr r0, _08000464 @ =gHeap
	movs r1, 0xE0
	lsls r1, 9
	bl sub_8002B80
	bl sub_80F79C8
	ldr r0, _08000468 @ =gUnknown_3003530
	movs r4, 0
	strb r4, [r0]
	ldr r0, _0800046C @ =gUnknown_3005ECC
	strb r4, [r0]
	bl sub_80F50F4
	bl AGBPrintInit
	ldr r0, _08000470 @ =gUnknown_30030E4
	strb r4, [r0]
	ldr r7, _08000474 @ =gUnknown_30030F0
	movs r1, 0
	mov r8, r1
	adds r6, r0, 0
_0800041A:
	bl sub_80005E8
	ldr r0, _08000468 @ =gUnknown_3003530
	ldrb r0, [r0]
	cmp r0, 0
	bne _08000444
	ldrh r1, [r7, 0x28]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08000444
	movs r0, 0xE
	ands r0, r1
	cmp r0, 0xE
	bne _08000444
	bl rfu_REQ_stopMode
	bl rfu_waitREQComplete
	bl sub_80008D8
_08000444:
	bl sub_80582E0
	cmp r0, 0x1
	bne _08000478
	strb r0, [r6]
	bl sub_80004B0
	movs r0, 0
	strb r0, [r6]
	b _0800049E
	.align 2, 0
_08000458: .4byte 0x00007fff
_0800045C: .4byte 0x04000204
_08000460: .4byte 0x00004014
_08000464: .4byte gHeap
_08000468: .4byte gUnknown_3003530
_0800046C: .4byte gUnknown_3005ECC
_08000470: .4byte gUnknown_30030E4
_08000474: .4byte gUnknown_30030F0
_08000478:
	ldr r5, _080004AC @ =gUnknown_30030E4
	movs r0, 0
	strb r0, [r5]
	bl sub_80004B0
	bl sub_8058274
	adds r4, r0, 0
	cmp r4, 0x1
	bne _0800049E
	movs r0, 0
	strh r0, [r7, 0x2E]
	bl sub_8007350
	strb r4, [r5]
	bl sub_80004B0
	mov r2, r8
	strb r2, [r5]
_0800049E:
	bl sub_805486C
	bl sub_807194C
	bl sub_8000890
	b _0800041A
	.align 2, 0
_080004AC: .4byte gUnknown_30030E4
	thumb_func_end AgbMain

	thumb_func_start sub_80004B0
sub_80004B0: @ 80004B0
	push {lr}
	bl sub_800B178
	lsls r0, 24
	cmp r0, 0
	bne _080004C0
	bl sub_8000510
_080004C0:
	pop {r0}
	bx r0
	thumb_func_end sub_80004B0

	thumb_func_start sub_80004C4
sub_80004C4: @ 80004C4
	push {r4,lr}
	ldr r0, _080004F4 @ =gUnknown_30030F0
	movs r4, 0
	str r4, [r0, 0x20]
	str r4, [r0, 0x24]
	str r4, [r0]
	ldr r0, _080004F8 @ =sub_80EC820
	bl sub_8000544
	ldr r0, _080004FC @ =gUnknown_300500C
	ldr r1, _08000500 @ =gUnknown_2024588
	str r1, [r0]
	ldr r2, _08000504 @ =gUnknown_3005008
	ldr r0, _08000508 @ =gUnknown_202552C
	str r0, [r2]
	movs r0, 0xF2
	lsls r0, 4
	adds r1, r0
	str r4, [r1]
	ldr r0, _0800050C @ =gUnknown_3005E88
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080004F4: .4byte gUnknown_30030F0
_080004F8: .4byte sub_80EC820
_080004FC: .4byte gUnknown_300500C
_08000500: .4byte gUnknown_2024588
_08000504: .4byte gUnknown_3005008
_08000508: .4byte gUnknown_202552C
_0800050C: .4byte gUnknown_3005E88
	thumb_func_end sub_80004C4

	thumb_func_start sub_8000510
sub_8000510: @ 8000510
	push {r4,lr}
	bl sub_80F5118
	cmp r0, 0
	bne _0800053A
	bl sub_813B870
	lsls r0, 24
	cmp r0, 0
	bne _0800053A
	ldr r4, _08000540 @ =gUnknown_30030F0
	ldr r0, [r4]
	cmp r0, 0
	beq _08000530
	bl _call_via_r0
_08000530:
	ldr r0, [r4, 0x4]
	cmp r0, 0
	beq _0800053A
	bl _call_via_r0
_0800053A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08000540: .4byte gUnknown_30030F0
	thumb_func_end sub_8000510

	thumb_func_start sub_8000544
sub_8000544: @ 8000544
	ldr r1, _08000554 @ =gUnknown_30030F0
	str r0, [r1, 0x4]
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08000554: .4byte gUnknown_30030F0
	thumb_func_end sub_8000544

	thumb_func_start sub_8000558
sub_8000558: @ 8000558
	ldr r1, _08000560 @ =0x04000106
	movs r0, 0x80
	strh r0, [r1]
	bx lr
	.align 2, 0
_08000560: .4byte 0x04000106
	thumb_func_end sub_8000558

	thumb_func_start sub_8000564
sub_8000564: @ 8000564
	push {r4,lr}
	ldr r0, _08000580 @ =0x04000104
	ldrh r4, [r0]
	adds r0, r4, 0
	bl sub_8044EE8
	ldr r1, _08000584 @ =0x04000106
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08000588 @ =gUnknown_2020000
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08000580: .4byte 0x04000104
_08000584: .4byte 0x04000106
_08000588: .4byte gUnknown_2020000
	thumb_func_end sub_8000564

	thumb_func_start sub_800058C
sub_800058C: @ 800058C
	ldr r0, _08000594 @ =gUnknown_2020000
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08000594: .4byte gUnknown_2020000
	thumb_func_end sub_800058C

	thumb_func_start sub_8000598
sub_8000598: @ 8000598
	push {lr}
	movs r0, 0x4
	bl sub_8000AC4
	movs r1, 0xFF
	ands r1, r0
	movs r2, 0x96
	lsls r2, 8
	adds r0, r2, 0
	orrs r1, r0
	movs r0, 0x20
	orrs r1, r0
	movs r0, 0x4
	bl sub_8000A38
	movs r0, 0x4
	bl sub_8000B68
	pop {r0}
	bx r0
	thumb_func_end sub_8000598

	thumb_func_start sub_80005C0
sub_80005C0: @ 80005C0
	ldr r1, _080005DC @ =gUnknown_300352C
	movs r0, 0x5
	strh r0, [r1]
	ldr r1, _080005E0 @ =gUnknown_30030E0
	movs r0, 0x28
	strh r0, [r1]
	ldr r1, _080005E4 @ =gUnknown_30030F0
	movs r0, 0
	strh r0, [r1, 0x2C]
	strh r0, [r1, 0x2E]
	strh r0, [r1, 0x30]
	strh r0, [r1, 0x28]
	strh r0, [r1, 0x2A]
	bx lr
	.align 2, 0
_080005DC: .4byte gUnknown_300352C
_080005E0: .4byte gUnknown_30030E0
_080005E4: .4byte gUnknown_30030F0
	thumb_func_end sub_80005C0

	thumb_func_start sub_80005E8
sub_80005E8: @ 80005E8
	push {lr}
	ldr r0, _08000624 @ =0x04000130
	ldrh r1, [r0]
	ldr r2, _08000628 @ =0x000003ff
	adds r0, r2, 0
	adds r3, r0, 0
	eors r3, r1
	ldr r1, _0800062C @ =gUnknown_30030F0
	ldrh r2, [r1, 0x28]
	adds r0, r3, 0
	bics r0, r2
	strh r0, [r1, 0x2A]
	strh r0, [r1, 0x2E]
	strh r0, [r1, 0x30]
	adds r2, r1, 0
	cmp r3, 0
	beq _08000634
	ldrh r0, [r2, 0x2C]
	cmp r0, r3
	bne _08000634
	ldrh r0, [r2, 0x32]
	subs r0, 0x1
	strh r0, [r2, 0x32]
	lsls r0, 16
	cmp r0, 0
	bne _0800063A
	strh r3, [r2, 0x30]
	ldr r0, _08000630 @ =gUnknown_300352C
	b _08000636
	.align 2, 0
_08000624: .4byte 0x04000130
_08000628: .4byte 0x000003ff
_0800062C: .4byte gUnknown_30030F0
_08000630: .4byte gUnknown_300352C
_08000634:
	ldr r0, _08000680 @ =gUnknown_30030E0
_08000636:
	ldrh r0, [r0]
	strh r0, [r2, 0x32]
_0800063A:
	strh r3, [r2, 0x28]
	strh r3, [r2, 0x2C]
	ldr r0, _08000684 @ =gUnknown_300500C
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	cmp r0, 0x2
	bne _0800066C
	ldrh r1, [r2, 0x2E]
	movs r3, 0x80
	lsls r3, 2
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0800065C
	movs r0, 0x1
	orrs r0, r1
	strh r0, [r2, 0x2E]
_0800065C:
	ldrh r1, [r2, 0x2C]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0800066C
	movs r0, 0x1
	orrs r0, r1
	strh r0, [r2, 0x2C]
_0800066C:
	ldrh r1, [r2, 0x2E]
	ldrh r0, [r2, 0x36]
	ands r0, r1
	cmp r0, 0
	beq _0800067A
	movs r0, 0x1
	strh r0, [r2, 0x34]
_0800067A:
	pop {r0}
	bx r0
	.align 2, 0
_08000680: .4byte gUnknown_30030E0
_08000684: .4byte gUnknown_300500C
	thumb_func_end sub_80005E8

	thumb_func_start sub_8000688
sub_8000688: @ 8000688
	push {r4,r5,lr}
	ldr r5, _080006D4 @ =IntrMain
	ldr r4, _080006D8 @ =gUnknown_3003580
	ldr r3, _080006DC @ =gUnknown_81E9F28
	ldr r2, _080006E0 @ =gIntrTable
	movs r1, 0xD
_08000694:
	ldm r3!, {r0}
	stm r2!, {r0}
	subs r1, 0x1
	cmp r1, 0
	bge _08000694
	ldr r0, _080006E4 @ =0x040000d4
	str r5, [r0]
	str r4, [r0, 0x4]
	ldr r1, _080006E8 @ =0x84000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _080006EC @ =INTR_VECTOR
	str r4, [r0]
	movs r0, 0
	bl sub_80006F4
	movs r0, 0
	bl sub_8000700
	movs r0, 0
	bl sub_8000718
	ldr r1, _080006F0 @ =0x04000208
	movs r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
	bl sub_8000B68
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080006D4: .4byte IntrMain
_080006D8: .4byte gUnknown_3003580
_080006DC: .4byte gUnknown_81E9F28
_080006E0: .4byte gIntrTable
_080006E4: .4byte 0x040000d4
_080006E8: .4byte 0x84000200
_080006EC: .4byte INTR_VECTOR
_080006F0: .4byte 0x04000208
	thumb_func_end sub_8000688

	thumb_func_start sub_80006F4
sub_80006F4: @ 80006F4
	ldr r1, _080006FC @ =gUnknown_30030F0
	str r0, [r1, 0xC]
	bx lr
	.align 2, 0
_080006FC: .4byte gUnknown_30030F0
	thumb_func_end sub_80006F4

	thumb_func_start sub_8000700
sub_8000700: @ 8000700
	ldr r1, _08000708 @ =gUnknown_30030F0
	str r0, [r1, 0x10]
	bx lr
	.align 2, 0
_08000708: .4byte gUnknown_30030F0
	thumb_func_end sub_8000700

	thumb_func_start sub_800070C
sub_800070C: @ 800070C
	ldr r1, _08000714 @ =gUnknown_30030F0
	str r0, [r1, 0x14]
	bx lr
	.align 2, 0
_08000714: .4byte gUnknown_30030F0
	thumb_func_end sub_800070C

	thumb_func_start sub_8000718
sub_8000718: @ 8000718
	ldr r1, _08000720 @ =gUnknown_30030F0
	str r0, [r1, 0x18]
	bx lr
	.align 2, 0
_08000720: .4byte gUnknown_30030F0
	thumb_func_end sub_8000718

	thumb_func_start sub_8000724
sub_8000724: @ 8000724
	push {r4,r5,lr}
	ldr r0, _08000734 @ =gUnknown_3003F3C
	ldrb r0, [r0]
	cmp r0, 0
	beq _08000738
	bl sub_80FBA38
	b _08000744
	.align 2, 0
_08000734: .4byte gUnknown_3003F3C
_08000738:
	ldr r0, _080007A8 @ =gUnknown_300357C
	ldrb r0, [r0]
	cmp r0, 0
	bne _08000744
	bl sub_800B718
_08000744:
	ldr r5, _080007AC @ =gUnknown_30030F0
	ldr r1, [r5, 0x20]
	cmp r1, 0
	beq _08000752
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_08000752:
	ldr r0, [r5, 0xC]
	cmp r0, 0
	beq _0800075C
	bl _call_via_r0
_0800075C:
	ldr r0, [r5, 0x24]
	adds r0, 0x1
	str r0, [r5, 0x24]
	bl sub_8000A04
	bl sub_8000C34
	ldr r1, _080007B0 @ =gUnknown_3003D88
	ldr r0, _080007B4 @ =gSoundInfo
	ldrb r0, [r0, 0x4]
	strb r0, [r1]
	ldr r1, _080007B8 @ =gUnknown_3003D84
	ldr r4, _080007BC @ =0x04000006
	ldrh r0, [r4]
	strb r0, [r1]
	bl m4aSoundMain
	ldr r1, _080007C0 @ =gUnknown_3003578
	ldrh r0, [r4]
	strb r0, [r1]
	bl sub_800DD28
	bl sub_8044EC8
	bl sub_80FCF34
	ldr r2, _080007C4 @ =INTR_CHECK
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r5, 0x1C]
	ldrh r2, [r5, 0x1C]
	orrs r1, r0
	strh r1, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080007A8: .4byte gUnknown_300357C
_080007AC: .4byte gUnknown_30030F0
_080007B0: .4byte gUnknown_3003D88
_080007B4: .4byte gSoundInfo
_080007B8: .4byte gUnknown_3003D84
_080007BC: .4byte 0x04000006
_080007C0: .4byte gUnknown_3003578
_080007C4: .4byte INTR_CHECK
	thumb_func_end sub_8000724

	thumb_func_start sub_80007C8
sub_80007C8: @ 80007C8
	push {lr}
	ldr r0, _080007D8 @ =gUnknown_81E9F60
	ldr r1, [r0]
	movs r0, 0x2
	bl SetFlashTimerIntr
	pop {r0}
	bx r0
	.align 2, 0
_080007D8: .4byte gUnknown_81E9F60
	thumb_func_end sub_80007C8

	thumb_func_start sub_80007DC
sub_80007DC: @ 80007DC
	push {r4,lr}
	ldr r4, _08000804 @ =gUnknown_30030F0
	ldr r0, [r4, 0x10]
	cmp r0, 0
	beq _080007EA
	bl _call_via_r0
_080007EA:
	ldr r2, _08000808 @ =INTR_CHECK
	ldrh r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r4, 0x1C]
	ldrh r2, [r4, 0x1C]
	orrs r1, r0
	strh r1, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08000804: .4byte gUnknown_30030F0
_08000808: .4byte INTR_CHECK
	thumb_func_end sub_80007DC

	thumb_func_start sub_800080C
sub_800080C: @ 800080C
	push {lr}
	ldr r1, _08000834 @ =gUnknown_3003D80
	ldr r0, _08000838 @ =0x04000006
	ldrh r0, [r0]
	strb r0, [r1]
	bl m4aSoundVSync
	ldr r2, _0800083C @ =INTR_CHECK
	ldrh r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08000840 @ =gUnknown_30030F0
	ldrh r2, [r0, 0x1C]
	ldrh r3, [r0, 0x1C]
	orrs r1, r2
	strh r1, [r0, 0x1C]
	pop {r0}
	bx r0
	.align 2, 0
_08000834: .4byte gUnknown_3003D80
_08000838: .4byte 0x04000006
_0800083C: .4byte INTR_CHECK
_08000840: .4byte gUnknown_30030F0
	thumb_func_end sub_800080C

	thumb_func_start sub_8000844
sub_8000844: @ 8000844
	push {r4,lr}
	ldr r4, _0800086C @ =gUnknown_30030F0
	ldr r0, [r4, 0x18]
	cmp r0, 0
	beq _08000852
	bl _call_via_r0
_08000852:
	ldr r2, _08000870 @ =INTR_CHECK
	ldrh r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r4, 0x1C]
	ldrh r2, [r4, 0x1C]
	orrs r1, r0
	strh r1, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800086C: .4byte gUnknown_30030F0
_08000870: .4byte INTR_CHECK
	thumb_func_end sub_8000844

	thumb_func_start sub_8000874
sub_8000874: @ 8000874
	ldr r0, _08000880 @ =gIntrTable
	ldr r1, _08000884 @ =sub_8000844
	str r1, [r0, 0x4]
	ldr r1, _08000888 @ =sub_800B788
	str r1, [r0, 0x8]
	bx lr
	.align 2, 0
_08000880: .4byte gIntrTable
_08000884: .4byte sub_8000844
_08000888: .4byte sub_800B788
	thumb_func_end sub_8000874

	thumb_func_start nullsub_4
nullsub_4: @ 800088C
	bx lr
	thumb_func_end nullsub_4

	thumb_func_start sub_8000890
sub_8000890: @ 8000890
	push {lr}
	ldr r2, _080008B8 @ =gUnknown_30030F0
	ldrh r1, [r2, 0x1C]
	ldr r0, _080008BC @ =0x0000fffe
	ands r0, r1
	ldrh r1, [r2, 0x1C]
	strh r0, [r2, 0x1C]
	ldrh r1, [r2, 0x1C]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080008B4
	movs r3, 0x1
_080008AA:
	ldrh r1, [r2, 0x1C]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080008AA
_080008B4:
	pop {r0}
	bx r0
	.align 2, 0
_080008B8: .4byte gUnknown_30030F0
_080008BC: .4byte 0x0000fffe
	thumb_func_end sub_8000890

	thumb_func_start sub_80008C0
sub_80008C0: @ 80008C0
	ldr r1, _080008C8 @ =gUnknown_30030F0
	str r0, [r1, 0x20]
	bx lr
	.align 2, 0
_080008C8: .4byte gUnknown_30030F0
	thumb_func_end sub_80008C0

	thumb_func_start sub_80008CC
sub_80008CC: @ 80008CC
	ldr r1, _080008D4 @ =gUnknown_30030F0
	movs r0, 0
	str r0, [r1, 0x20]
	bx lr
	.align 2, 0
_080008D4: .4byte gUnknown_30030F0
	thumb_func_end sub_80008CC

	thumb_func_start sub_80008D8
sub_80008D8: @ 80008D8
	push {r4,lr}
	ldr r1, _08000930 @ =0x04000208
	movs r0, 0
	strh r0, [r1]
	bl m4aSoundVSyncOff
	bl sub_8087E64
	ldr r1, _08000934 @ =0x040000bc
	ldrh r2, [r1, 0xA]
	ldr r3, _08000938 @ =0x0000c5ff
	adds r0, r3, 0
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r4, [r1, 0xA]
	ldr r2, _0800093C @ =0x00007fff
	adds r0, r2, 0
	ands r0, r4
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	adds r1, 0xC
	ldrh r4, [r1, 0xA]
	adds r0, r3, 0
	ands r0, r4
	strh r0, [r1, 0xA]
	ldrh r4, [r1, 0xA]
	adds r0, r2, 0
	ands r0, r4
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	ldr r0, _08000940 @ =0x040000d4
	ldrh r1, [r0, 0xA]
	ands r3, r1
	strh r3, [r0, 0xA]
	ldrh r1, [r0, 0xA]
	ands r2, r1
	strh r2, [r0, 0xA]
	ldrh r0, [r0, 0xA]
	movs r0, 0xDF
	bl SoftReset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08000930: .4byte 0x04000208
_08000934: .4byte 0x040000bc
_08000938: .4byte 0x0000c5ff
_0800093C: .4byte 0x00007fff
_08000940: .4byte 0x040000d4
	thumb_func_end sub_80008D8

	thumb_func_start sub_8000944
sub_8000944: @ 8000944
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08000960 @ =gPokemonCrySongs
	ldr r2, _08000964 @ =0x01000034
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08000960: .4byte gPokemonCrySongs
_08000964: .4byte 0x01000034
	thumb_func_end sub_8000944

	.align 2, 0 @ Don't pad with nop.
