	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

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
