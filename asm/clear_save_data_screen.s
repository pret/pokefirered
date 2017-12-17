	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F5574
sub_80F5574: @ 80F5574
	push {lr}
	bl sub_8077578
	bl sub_8006B5C
	bl sub_8006BA8
	bl sub_80704D0
	pop {r0}
	bx r0
	thumb_func_end sub_80F5574

	thumb_func_start sub_80F558C
sub_80F558C: @ 80F558C
	push {lr}
	bl sub_8007320
	bl sub_8007610
	bl sub_8070474
	pop {r0}
	bx r0
	thumb_func_end sub_80F558C

	thumb_func_start sub_80F55A0
sub_80F55A0: @ 80F55A0
	push {r4,lr}
	ldr r4, _080F55D0 @ =gUnknown_203AB54
	movs r0, 0x4
	bl sub_8002BB0
	str r0, [r4]
	movs r1, 0
	strb r1, [r0, 0x1]
	ldr r0, [r4]
	strb r1, [r0]
	ldr r0, [r4]
	strb r1, [r0, 0x2]
	bl sub_80F580C
	ldr r0, _080F55D4 @ =sub_80F55DC
	movs r1, 0
	bl sub_807741C
	ldr r0, _080F55D8 @ =sub_80F5574
	bl sub_8000544
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F55D0: .4byte gUnknown_203AB54
_080F55D4: .4byte sub_80F55DC
_080F55D8: .4byte sub_80F5574
	thumb_func_end sub_80F55A0

	thumb_func_start sub_80F55DC
sub_80F55DC: @ 80F55DC
	push {r4,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080F55F8 @ =gUnknown_203AB54
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x5
	bhi _080F56C0
	lsls r0, 2
	ldr r1, _080F55FC @ =_080F5600
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F55F8: .4byte gUnknown_203AB54
_080F55FC: .4byte _080F5600
	.align 2, 0
_080F5600:
	.4byte _080F5618
	.4byte _080F562A
	.4byte _080F5644
	.4byte _080F564A
	.4byte _080F5660
	.4byte _080F569C
_080F5618:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl sub_8070588
	b _080F56E2
_080F562A:
	ldr r0, _080F5640 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080F56EC
	movs r0, 0
	bl sub_80006F4
	b _080F56E2
	.align 2, 0
_080F5640: .4byte gUnknown_2037AB8
_080F5644:
	bl sub_80F5820
	b _080F56E2
_080F564A:
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xF0
	bl sub_814FF2C
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0xF0
	bl sub_814FF2C
	b _080F56E2
_080F5660:
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0xF
	bl sub_810F2E8
	movs r0, 0x1
	str r0, [sp]
	str r0, [sp, 0x4]
	ldr r0, _080F5694 @ =gUnknown_841EE80
	str r0, [sp, 0x8]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r0, _080F5698 @ =gUnknown_841B69E
	str r0, [sp, 0x10]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x3
	bl sub_812E5A4
	movs r0, 0x1
	movs r1, 0x2
	bl sub_8003F20
	b _080F56E2
	.align 2, 0
_080F5694: .4byte gUnknown_841EE80
_080F5698: .4byte gUnknown_841B69E
_080F569C:
	ldr r0, _080F56BC @ =gUnknown_841EE68
	movs r2, 0x1
	str r2, [sp]
	movs r1, 0xF
	str r1, [sp, 0x4]
	str r2, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl sub_810FF60
	movs r0, 0
	bl sub_80020BC
	b _080F56E2
	.align 2, 0
_080F56BC: .4byte gUnknown_841EE68
_080F56C0:
	ldr r0, _080F56F4 @ =0x0000ffff
	str r0, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl sub_8070588
	ldr r0, _080F56F8 @ =sub_80F558C
	bl sub_80006F4
	ldr r1, _080F56FC @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080F5700 @ =sub_80F5708
	str r1, [r0]
_080F56E2:
	ldr r0, _080F5704 @ =gUnknown_203AB54
	ldr r1, [r0]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
_080F56EC:
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F56F4: .4byte 0x0000ffff
_080F56F8: .4byte sub_80F558C
_080F56FC: .4byte gUnknown_3005090
_080F5700: .4byte sub_80F5708
_080F5704: .4byte gUnknown_203AB54
	thumb_func_end sub_80F55DC

	thumb_func_start sub_80F5708
sub_80F5708: @ 80F5708
	push {r4,r5,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r5, _080F5740 @ =gUnknown_203AB54
	ldr r0, [r5]
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F578C
	bl sub_81100C8
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _080F5736
	cmp r4, r0
	ble _080F5792
	cmp r4, 0
	beq _080F5744
	cmp r4, 0x1
	bne _080F5792
_080F5736:
	movs r0, 0x5
	bl sub_80722CC
	b _080F577A
	.align 2, 0
_080F5740: .4byte gUnknown_203AB54
_080F5744:
	movs r0, 0x5
	bl sub_80722CC
	movs r0, 0x1
	movs r1, 0x11
	bl sub_800445C
	movs r0, 0x1
	str r0, [sp]
	str r0, [sp, 0x4]
	ldr r0, _080F5784 @ =gUnknown_841EE80
	str r0, [sp, 0x8]
	str r4, [sp, 0xC]
	ldr r0, _080F5788 @ =gUnknown_841B6B9
	str r0, [sp, 0x10]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x3
	bl sub_812E5A4
	movs r0, 0x1
	movs r1, 0x3
	bl sub_8003F20
	bl sub_80D972C
_080F577A:
	ldr r1, [r5]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080F5792
	.align 2, 0
_080F5784: .4byte gUnknown_841EE80
_080F5788: .4byte gUnknown_841B6B9
_080F578C:
	adds r0, r1, 0
	bl sub_80F579C
_080F5792:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80F5708

	thumb_func_start sub_80F579C
sub_80F579C: @ 80F579C
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _080F57B4 @ =gUnknown_203AB54
	ldr r0, [r5]
	ldrb r0, [r0, 0x2]
	cmp r0, 0
	beq _080F57B8
	cmp r0, 0x1
	beq _080F57D4
	b _080F57FE
	.align 2, 0
_080F57B4: .4byte gUnknown_203AB54
_080F57B8:
	ldr r0, _080F57D0 @ =0x0000ffff
	str r0, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl sub_8070588
	ldr r1, [r5]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
	b _080F57FE
	.align 2, 0
_080F57D0: .4byte 0x0000ffff
_080F57D4:
	ldr r0, _080F5808 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080F57FE
	bl sub_81100E8
	adds r0, r6, 0
	bl sub_8077508
	bl sub_8003ECC
	ldr r0, [r5]
	bl sub_8002BC4
	str r4, [r5]
	bl sub_80008D8
_080F57FE:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F5808: .4byte gUnknown_2037AB8
	thumb_func_end sub_80F579C

	thumb_func_start sub_80F580C
sub_80F580C: @ 80F580C
	push {lr}
	bl sub_8006B10
	bl sub_8070528
	bl sub_80773BC
	pop {r0}
	bx r0
	thumb_func_end sub_80F580C

	thumb_func_start sub_80F5820
sub_80F5820: @ 80F5820
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
	ldr r1, _080F593C @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _080F5940 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_080F5846:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _080F5846
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
	ldr r2, _080F593C @ =0x040000d4
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
	bl sub_8000A38
	movs r0, 0x54
	movs r1, 0
	bl sub_8000A38
	movs r0, 0
	bl sub_8001618
	ldr r1, _080F5944 @ =gUnknown_841EE64
	movs r0, 0
	movs r2, 0x1
	bl sub_8001658
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_8001B90
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_8001D08
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl sub_8001B90
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl sub_8001D08
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl sub_8001B90
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl sub_8001D08
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl sub_8001B90
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl sub_8001D08
	ldr r0, _080F5948 @ =gUnknown_841EE68
	bl sub_8003B24
	bl sub_8002C28
	movs r1, 0x82
	lsls r1, 5
	movs r0, 0
	bl sub_8000A38
	movs r0, 0
	bl sub_80019BC
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F593C: .4byte 0x040000d4
_080F5940: .4byte 0x81000800
_080F5944: .4byte gUnknown_841EE64
_080F5948: .4byte gUnknown_841EE68
	thumb_func_end sub_80F5820

	thumb_func_start nullsub_85
nullsub_85: @ 80F594C
	bx lr
	thumb_func_end nullsub_85

	.align 2, 0 @ Don't pad with nop.
