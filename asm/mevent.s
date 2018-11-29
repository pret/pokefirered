	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8144254
sub_8144254: @ 8144254sub_81441F0
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _08144280 @ =gSaveBlock1Ptr
	ldr r0, [r6]
	ldr r1, _08144284 @ =0x000032e4
	adds r0, r1
	ldrb r4, [r0, 0x9]
	adds r0, r5, 0
	bl sub_81441F0
	cmp r0, 0
	beq _081442BE
	ldr r0, [r6]
	ldr r1, _08144288 @ =0x00003434
	adds r0, r1
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_81441AC
	cmp r0, 0
	beq _08144298
	b _081442BE
	.align 2, 0
_08144280: .4byte gSaveBlock1Ptr
_08144284: .4byte 0x000032e4
_08144288: .4byte 0x00003434
_0814428C:
	ldrh r0, [r5, 0x2]
	strh r0, [r1]
	ldrh r0, [r5]
	strh r0, [r2]
	movs r0, 0x1
	b _081442C0
_08144298:
	movs r3, 0
	cmp r3, r4
	bge _081442BE
	ldr r0, [r6]
	ldr r6, _081442C8 @ =0x0000343c
	adds r2, r0, r6
	adds r6, 0xE
	adds r1, r0, r6
_081442A8:
	ldrh r0, [r2, 0xE]
	cmp r0, 0
	bne _081442B4
	ldrh r0, [r2]
	cmp r0, 0
	beq _0814428C
_081442B4:
	adds r2, 0x2
	adds r1, 0x2
	adds r3, 0x1
	cmp r3, r4
	blt _081442A8
_081442BE:
	movs r0, 0
_081442C0:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081442C8: .4byte 0x0000343c
	thumb_func_end sub_8144254

	thumb_func_start sub_81442CC
sub_81442CC: @ 81442CC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r4, r0, 0
	movs r0, 0
	str r0, [sp]
	ldr r2, _08144328 @ =0x05000019
	mov r0, sp
	adds r1, r4, 0
	bl CpuSet
	ldr r0, _0814432C @ =0x00000101
	str r0, [r4]
	movs r0, 0x1
	strh r0, [r4, 0x4]
	str r0, [r4, 0x8]
	strh r0, [r4, 0xC]
	str r0, [r4, 0x10]
	bl sub_8143FC8
	cmp r0, 0
	beq _08144330
	bl sav1_get_mevent_buffer_1
	ldrh r0, [r0]
	strh r0, [r4, 0x14]
	bl sav1_get_mevent_buffer_2
	adds r1, r4, 0
	adds r1, 0x20
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	bl sav1_get_mevent_buffer_1
	ldrb r1, [r0, 0x9]
	adds r0, r4, 0
	adds r0, 0x44
	strb r1, [r0]
	b _08144332
	.align 2, 0
_08144328: .4byte 0x05000019
_0814432C: .4byte 0x00000101
_08144330:
	strh r0, [r4, 0x14]
_08144332:
	adds r5, r4, 0
	adds r5, 0x4C
	ldr r0, _081443BC @ =gSaveBlock2Ptr
	mov r8, r0
	adds r6, r4, 0
	adds r6, 0x45
	adds r7, r4, 0
	adds r7, 0x50
	movs r1, 0x5C
	adds r1, r4
	mov r9, r1
	movs r2, 0x60
	adds r2, r4
	mov r10, r2
	ldr r0, _081443C0 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r3, _081443C4 @ =0x00003458
	adds r2, r0, r3
	adds r1, r4, 0
	adds r1, 0x16
	movs r3, 0x3
_0814435C:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _0814435C
	mov r0, r8
	ldr r1, [r0]
	adds r1, 0xA
	adds r0, r5, 0
	bl CopyUnalignedWord
	mov r2, r8
	ldr r1, [r2]
	adds r0, r6, 0
	bl StringCopy
	ldr r0, _081443C0 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r3, _081443C8 @ =0x00002ca0
	adds r2, r0, r3
	adds r1, r7, 0
	movs r3, 0x5
_0814438C:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _0814438C
	ldr r1, _081443CC @ =RomHeaderGameCode
	mov r0, r9
	movs r2, 0x4
	bl memcpy
	ldr r0, _081443D0 @ =RomHeaderSoftwareVersion
	ldrb r0, [r0]
	mov r5, r10
	strb r0, [r5]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081443BC: .4byte gSaveBlock2Ptr
_081443C0: .4byte gSaveBlock1Ptr
_081443C4: .4byte 0x00003458
_081443C8: .4byte 0x00002ca0
_081443CC: .4byte RomHeaderGameCode
_081443D0: .4byte RomHeaderSoftwareVersion
	thumb_func_end sub_81442CC

	thumb_func_start sub_81443D4
sub_81443D4: @ 81443D4
	push {lr}
	adds r2, r0, 0
	ldr r1, [r2]
	ldr r0, _0814440C @ =0x00000101
	cmp r1, r0
	bne _08144410
	ldrh r1, [r2, 0x4]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08144410
	ldr r0, [r2, 0x8]
	ands r0, r3
	cmp r0, 0
	beq _08144410
	ldrh r1, [r2, 0xC]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08144410
	ldr r0, [r2, 0x10]
	movs r1, 0xF
	ands r0, r1
	cmp r0, 0
	beq _08144410
	movs r0, 0x1
	b _08144412
	.align 2, 0
_0814440C: .4byte 0x00000101
_08144410:
	movs r0, 0
_08144412:
	pop {r1}
	bx r1
	thumb_func_end sub_81443D4

	thumb_func_start sub_8144418
sub_8144418: @ 8144418
	push {lr}
	ldrh r1, [r1, 0x14]
	cmp r1, 0
	bne _08144424
	movs r0, 0
	b _08144430
_08144424:
	ldrh r0, [r0]
	cmp r0, r1
	beq _0814442E
	movs r0, 0x2
	b _08144430
_0814442E:
	movs r0, 0x1
_08144430:
	pop {r1}
	bx r1
	thumb_func_end sub_8144418

	thumb_func_start sub_8144434
sub_8144434: @ 8144434
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r4, 0
	adds r5, 0x20
	adds r4, 0x44
	ldrb r1, [r4]
	adds r0, r5, 0
	bl sub_8144184
	ldrb r2, [r4]
	subs r4, r2, r0
	cmp r4, 0
	bne _08144454
	movs r0, 0x1
	b _0814446E
_08144454:
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_81441AC
	cmp r0, 0
	beq _08144464
	movs r0, 0x3
	b _0814446E
_08144464:
	cmp r4, 0x1
	beq _0814446C
	movs r0, 0x2
	b _0814446E
_0814446C:
	movs r0, 0x4
_0814446E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8144434

	thumb_func_start sub_8144474
sub_8144474: @ 8144474
	push {r4,lr}
	movs r3, 0
	adds r2, r0, 0
	adds r2, 0x16
_0814447C:
	ldrh r0, [r2]
	ldrh r4, [r1]
	cmp r0, r4
	beq _08144488
	movs r0, 0
	b _08144494
_08144488:
	adds r1, 0x2
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	ble _0814447C
	movs r0, 0x1
_08144494:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8144474

	thumb_func_start sub_814449C
sub_814449C: @ 814449C
	push {lr}
	adds r2, r0, 0
	adds r2, 0x20
	adds r0, 0x44
	ldrb r1, [r0]
	adds r0, r2, 0
	bl sub_8144184
	pop {r1}
	bx r1
	thumb_func_end sub_814449C

	thumb_func_start sub_81444B0
sub_81444B0: @ 81444B0
	push {lr}
	adds r2, r0, 0
	cmp r1, 0x4
	bhi _081444FC
	lsls r0, r1, 2
	ldr r1, _081444C4 @ =_081444C8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081444C4: .4byte _081444C8
	.align 2, 0
_081444C8:
	.4byte _081444DC
	.4byte _081444E0
	.4byte _081444E4
	.4byte _081444E8
	.4byte _081444F4
_081444DC:
	ldrh r0, [r2, 0x20]
	b _0814450A
_081444E0:
	ldrh r0, [r2, 0x22]
	b _0814450A
_081444E4:
	ldrh r0, [r2, 0x24]
	b _0814450A
_081444E8:
	adds r0, r2, 0
	bl sub_814449C
	lsls r0, 16
	lsrs r0, 16
	b _0814450A
_081444F4:
	adds r0, r2, 0
	adds r0, 0x44
	ldrb r0, [r0]
	b _0814450A
_081444FC:
	ldr r0, _08144510 @ =gUnknown_8466F28	"C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent.c"
	ldr r1, _08144514 @ =0x00000339
	ldr r2, _08144518 @ =gUnknown_8466F5C	"0"
	movs r3, 0x1
	bl AGBAssert
	movs r0, 0
_0814450A:
	pop {r1}
	bx r1
	.align 2, 0
_08144510: .4byte gUnknown_8466F28
_08144514: .4byte 0x00000339
_08144518: .4byte gUnknown_8466F5C
	thumb_func_end sub_81444B0

	thumb_func_start sub_814451C
sub_814451C: @ 814451C
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _08144544 @ =gSaveBlock1Ptr
	ldr r0, [r2]
	ldr r1, _08144548 @ =0x000032e4
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x3
	ands r0, r1
	adds r3, r2, 0
	cmp r0, 0x2
	bne _081445B6
	movs r2, 0
	cmp r4, 0x4
	bhi _08144582
	lsls r0, r4, 2
	ldr r1, _0814454C @ =_08144550
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08144544: .4byte gSaveBlock1Ptr
_08144548: .4byte 0x000032e4
_0814454C: .4byte _08144550
	.align 2, 0
_08144550:
	.4byte _08144564
	.4byte _08144570
	.4byte _0814457C
	.4byte _08144582
	.4byte _08144582
_08144564:
	ldr r0, [r3]
	ldr r1, _0814456C @ =0x00003434
	b _08144580
	.align 2, 0
_0814456C: .4byte 0x00003434
_08144570:
	ldr r0, [r3]
	ldr r1, _08144578 @ =0x00003436
	b _08144580
	.align 2, 0
_08144578: .4byte 0x00003436
_0814457C:
	ldr r0, [r3]
	ldr r1, _08144598 @ =0x00003438
_08144580:
	adds r2, r0, r1
_08144582:
	cmp r2, 0
	bne _081445A4
	ldr r0, _0814459C @ =gUnknown_8466F28	"C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent.c"
	movs r1, 0xD9
	lsls r1, 2
	ldr r2, _081445A0 @ =gUnknown_8466F5C	"0"
	movs r3, 0x1
	bl AGBAssert
	b _081445B6
	.align 2, 0
_08144598: .4byte 0x00003438
_0814459C: .4byte gUnknown_8466F28
_081445A0: .4byte gUnknown_8466F5C
_081445A4:
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _081445BC @ =0x000003e7
	cmp r0, r1
	bls _081445B6
	strh r1, [r2]
_081445B6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081445BC: .4byte 0x000003e7
	thumb_func_end sub_814451C

	thumb_func_start sub_81445C0
sub_81445C0: @ 81445C0
	push {lr}
	cmp r0, 0x4
	bhi _081446A4
	lsls r0, 2
	ldr r1, _081445D0 @ =_081445D4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081445D0: .4byte _081445D4
	.align 2, 0
_081445D4:
	.4byte _081445E8
	.4byte _08144610
	.4byte _08144638
	.4byte _08144660
	.4byte _08144684
_081445E8:
	ldr r0, _08144604 @ =gSaveBlock1Ptr
	ldr r2, [r0]
	ldr r1, _08144608 @ =0x000032e4
	adds r0, r2, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x2
	bne _081446A4
	ldr r1, _0814460C @ =0x00003434
	adds r0, r2, r1
	ldrh r0, [r0]
	b _081446B2
	.align 2, 0
_08144604: .4byte gSaveBlock1Ptr
_08144608: .4byte 0x000032e4
_0814460C: .4byte 0x00003434
_08144610:
	ldr r0, _0814462C @ =gSaveBlock1Ptr
	ldr r2, [r0]
	ldr r1, _08144630 @ =0x000032e4
	adds r0, r2, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x2
	bne _081446A4
	ldr r1, _08144634 @ =0x00003434
	adds r0, r2, r1
	ldrh r0, [r0, 0x2]
	b _081446B2
	.align 2, 0
_0814462C: .4byte gSaveBlock1Ptr
_08144630: .4byte 0x000032e4
_08144634: .4byte 0x00003434
_08144638:
	ldr r0, _08144654 @ =gSaveBlock1Ptr
	ldr r2, [r0]
	ldr r1, _08144658 @ =0x000032e4
	adds r0, r2, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x2
	bne _081446A4
	ldr r1, _0814465C @ =0x00003434
	adds r0, r2, r1
	ldrh r0, [r0, 0x4]
	b _081446B2
	.align 2, 0
_08144654: .4byte gSaveBlock1Ptr
_08144658: .4byte 0x000032e4
_0814465C: .4byte 0x00003434
_08144660:
	ldr r0, _0814467C @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _08144680 @ =0x000032e4
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _081446A4
	bl sub_8144218
	lsls r0, 16
	lsrs r0, 16
	b _081446B2
	.align 2, 0
_0814467C: .4byte gSaveBlock1Ptr
_08144680: .4byte 0x000032e4
_08144684:
	ldr r0, _0814469C @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _081446A0 @ =0x000032e4
	adds r2, r0, r1
	ldrb r1, [r2, 0x8]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _081446A4
	ldrb r0, [r2, 0x9]
	b _081446B2
	.align 2, 0
_0814469C: .4byte gSaveBlock1Ptr
_081446A0: .4byte 0x000032e4
_081446A4:
	ldr r0, _081446B8 @ =gUnknown_8466F28	"C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent.c"
	ldr r1, _081446BC @ =0x00000391
	ldr r2, _081446C0 @ =gUnknown_8466F5C	"0"
	movs r3, 0x1
	bl AGBAssert
	movs r0, 0
_081446B2:
	pop {r1}
	bx r1
	.align 2, 0
_081446B8: .4byte gUnknown_8466F28
_081446BC: .4byte 0x00000391
_081446C0: .4byte gUnknown_8466F5C
	thumb_func_end sub_81445C0

	thumb_func_start sub_81446C4
sub_81446C4: @ 81446C4
	ldr r1, _081446CC @ =gUnknown_203F3BC
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_081446CC: .4byte gUnknown_203F3BC
	thumb_func_end sub_81446C4

	thumb_func_start sub_81446D0
sub_81446D0: @ 81446D0
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r0, 16
	adds r4, r0, 0
	ldr r5, _08144700 @ =gUnknown_203F3BC
	movs r0, 0
	str r0, [r5]
	cmp r4, 0
	beq _0814470E
	bl sub_8143FC8
	cmp r0, 0
	beq _0814470C
	ldr r0, _08144704 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _08144708 @ =0x000032e4
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r4
	bne _0814470C
	movs r0, 0x1
	str r0, [r5]
	b _0814470E
	.align 2, 0
_08144700: .4byte gUnknown_203F3BC
_08144704: .4byte gSaveBlock1Ptr
_08144708: .4byte 0x000032e4
_0814470C:
	movs r0, 0
_0814470E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_81446D0

	thumb_func_start sub_8144714
sub_8144714: @ 8144714
	push {lr}
	adds r2, r0, 0
	ldr r0, _08144738 @ =gUnknown_203F3BC
	ldr r0, [r0]
	cmp r0, 0
	beq _08144782
	cmp r2, 0x1
	beq _08144758
	cmp r2, 0x1
	bcc _08144744
	cmp r2, 0x2
	bne _08144774
	ldr r0, _0814473C @ =gSaveBlock1Ptr
	ldr r2, [r0]
	ldr r0, _08144740 @ =0x00003478
	adds r2, r0
	movs r0, 0x2
	b _08144762
	.align 2, 0
_08144738: .4byte gUnknown_203F3BC
_0814473C: .4byte gSaveBlock1Ptr
_08144740: .4byte 0x00003478
_08144744:
	ldr r0, _08144750 @ =gSaveBlock1Ptr
	ldr r2, [r0]
	ldr r0, _08144754 @ =0x00003464
	adds r2, r0
	movs r0, 0
	b _08144762
	.align 2, 0
_08144750: .4byte gSaveBlock1Ptr
_08144754: .4byte 0x00003464
_08144758:
	ldr r0, _0814476C @ =gSaveBlock1Ptr
	ldr r2, [r0]
	ldr r0, _08144770 @ =0x00003464
	adds r2, r0
	movs r0, 0x1
_08144762:
	movs r3, 0x5
	bl sub_8144824
	b _08144782
	.align 2, 0
_0814476C: .4byte gSaveBlock1Ptr
_08144770: .4byte 0x00003464
_08144774:
	ldr r0, _08144788 @ =gUnknown_8466F28	"C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/mevent.c"
	movs r1, 0xF7
	lsls r1, 2
	ldr r2, _0814478C @ =gUnknown_8466F5C	"0"
	movs r3, 0x1
	bl AGBAssert
_08144782:
	pop {r0}
	bx r0
	.align 2, 0
_08144788: .4byte gUnknown_8466F28
_0814478C: .4byte gUnknown_8466F5C
	thumb_func_end sub_8144714

	thumb_func_start sub_8144790
sub_8144790: @ 8144790
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r0, _081447B0 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r0, _081447B4 @ =0x00003464
	adds r1, r0
	ldr r2, _081447B8 @ =0x0500000a
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_081447B0: .4byte gSaveBlock1Ptr
_081447B4: .4byte 0x00003464
_081447B8: .4byte 0x0500000a
	thumb_func_end sub_8144790

	thumb_func_start sub_81447BC
sub_81447BC: @ 81447BC
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r1, 0
	cmp r1, r2
	bge _081447DE
	ldr r0, [r4]
	cmp r0, r5
	beq _081447DE
	adds r3, r4, 0
_081447D0:
	adds r3, 0x4
	adds r1, 0x1
	cmp r1, r2
	bge _081447DE
	ldr r0, [r3]
	cmp r0, r5
	bne _081447D0
_081447DE:
	cmp r1, r2
	bne _08144800
	subs r3, r1, 0x1
	cmp r3, 0
	ble _081447FA
	lsls r0, r3, 2
	subs r0, 0x4
	adds r2, r0, r4
_081447EE:
	ldr r0, [r2]
	str r0, [r2, 0x4]
	subs r2, 0x4
	subs r3, 0x1
	cmp r3, 0
	bgt _081447EE
_081447FA:
	str r5, [r4]
	movs r0, 0x1
	b _0814481C
_08144800:
	adds r3, r1, 0
	cmp r3, 0
	ble _08144818
	lsls r0, r3, 2
	subs r0, 0x4
	adds r2, r0, r4
_0814480C:
	ldr r0, [r2]
	str r0, [r2, 0x4]
	subs r2, 0x4
	subs r3, 0x1
	cmp r3, 0
	bgt _0814480C
_08144818:
	str r5, [r4]
	movs r0, 0
_0814481C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_81447BC

	thumb_func_start sub_8144824
sub_8144824: @ 8144824
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	adds r1, r2, 0
	adds r2, r3, 0
	bl sub_81447BC
	cmp r0, 0
	beq _0814483C
	adds r0, r4, 0
	bl sub_814451C
_0814483C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8144824

	.align 2, 0 @ Don't pad with nop.
