	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

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
