	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_815C27C
sub_815C27C: @ 815C27C
	push {r4-r7,lr}
	sub sp, 0x4
	adds r6, r0, 0
	adds r5, r1, 0
	bl sub_815C8C8
	movs r7, 0x2
	ldr r4, _0815C2BC @ =gUnknown_3003F84
_0815C28C:
	bl sub_815C898
	ldr r0, _0815C2C0 @ =gUnknown_3002062
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0815C29E
	strb r7, [r4]
_0815C29E:
	movs r0, 0x1
	adds r1, r6, 0
	adds r2, r5, 0
	movs r3, 0
	bl sub_815C498
	adds r1, r0, 0
	ldr r0, _0815C2C4 @ =gUnknown_3002064
	strh r1, [r0]
	movs r0, 0x13
	ands r0, r1
	cmp r0, 0x10
	bne _0815C2C8
	movs r4, 0
	b _0815C2EA
	.align 2, 0
_0815C2BC: .4byte gUnknown_3003F84
_0815C2C0: .4byte gUnknown_3002062
_0815C2C4: .4byte gUnknown_3002064
_0815C2C8:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0815C2D4
	movs r4, 0x1
	b _0815C2EA
_0815C2D4:
	movs r0, 0x4
	ands r0, r1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0815C2E8
	strb r0, [r4]
	bl VBlankIntrWait
	b _0815C28C
_0815C2E8:
	movs r4, 0x2
_0815C2EA:
	movs r0, 0
	str r0, [sp]
	ldr r1, _0815C308 @ =gUnknown_3002048
	ldr r2, _0815C30C @ =0x05000006
	mov r0, sp
	bl CpuSet
	bl sub_815C91C
	adds r0, r4, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0815C308: .4byte gUnknown_3002048
_0815C30C: .4byte 0x05000006
	thumb_func_end sub_815C27C

	thumb_func_start sub_815C310
sub_815C310: @ 815C310
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	bl sub_815C8C8
	movs r6, 0x2
	ldr r4, _0815C350 @ =gUnknown_3003F84
_0815C31E:
	bl sub_815C898
	ldr r0, _0815C354 @ =gUnknown_3002062
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0815C330
	strb r6, [r4]
_0815C330:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	adds r3, r5, 0
	bl sub_815C498
	adds r1, r0, 0
	ldr r0, _0815C358 @ =gUnknown_3002064
	strh r1, [r0]
	movs r0, 0x13
	ands r0, r1
	cmp r0, 0x10
	bne _0815C35C
	movs r4, 0
	b _0815C37E
	.align 2, 0
_0815C350: .4byte gUnknown_3003F84
_0815C354: .4byte gUnknown_3002062
_0815C358: .4byte gUnknown_3002064
_0815C35C:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0815C368
	movs r4, 0x1
	b _0815C37E
_0815C368:
	movs r0, 0x4
	ands r0, r1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0815C37C
	strb r0, [r4]
	bl VBlankIntrWait
	b _0815C31E
_0815C37C:
	movs r4, 0x2
_0815C37E:
	movs r0, 0
	str r0, [sp]
	ldr r1, _0815C39C @ =gUnknown_3002048
	ldr r2, _0815C3A0 @ =0x05000006
	mov r0, sp
	bl CpuSet
	bl sub_815C91C
	adds r0, r4, 0
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0815C39C: .4byte gUnknown_3002048
_0815C3A0: .4byte 0x05000006
	thumb_func_end sub_815C310

	thumb_func_start sub_815C3A4
sub_815C3A4: @ 815C3A4
	push {r4,lr}
	ldr r4, _0815C3D0 @ =0x04000208
	movs r3, 0
	strh r3, [r4]
	ldr r2, _0815C3D4 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0815C3D8 @ =0x0000ff3f
	ands r0, r1
	strh r0, [r2]
	movs r0, 0x1
	strh r0, [r4]
	ldr r0, _0815C3DC @ =0x04000128
	strh r3, [r0]
	subs r0, 0x1A
	strh r3, [r0]
	ldr r1, _0815C3E0 @ =0x04000202
	movs r0, 0xC0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815C3D0: .4byte 0x04000208
_0815C3D4: .4byte 0x04000200
_0815C3D8: .4byte 0x0000ff3f
_0815C3DC: .4byte 0x04000128
_0815C3E0: .4byte 0x04000202
	thumb_func_end sub_815C3A4

	thumb_func_start sub_815C3E4
sub_815C3E4: @ 815C3E4
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r5, _0815C43C @ =0x04000208
	movs r4, 0
	strh r4, [r5]
	ldr r3, _0815C440 @ =0x04000200
	ldrh r1, [r3]
	ldr r0, _0815C444 @ =0x0000ff3f
	ands r0, r1
	strh r0, [r3]
	movs r6, 0x1
	strh r6, [r5]
	ldr r0, _0815C448 @ =0x04000134
	strh r4, [r0]
	ldr r2, _0815C44C @ =0x04000128
	movs r1, 0x80
	lsls r1, 6
	adds r0, r1, 0
	strh r0, [r2]
	ldrh r0, [r2]
	ldr r7, _0815C450 @ =0x00004003
	adds r1, r7, 0
	orrs r0, r1
	strh r0, [r2]
	strh r4, [r5]
	ldrh r0, [r3]
	movs r1, 0x80
	orrs r0, r1
	strh r0, [r3]
	strh r6, [r5]
	ldr r1, _0815C454 @ =gUnknown_3002048
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _0815C432
	str r0, [sp]
	ldr r2, _0815C458 @ =0x05000006
	mov r0, sp
	bl CpuSet
_0815C432:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815C43C: .4byte 0x04000208
_0815C440: .4byte 0x04000200
_0815C444: .4byte 0x0000ff3f
_0815C448: .4byte 0x04000134
_0815C44C: .4byte 0x04000128
_0815C450: .4byte 0x00004003
_0815C454: .4byte gUnknown_3002048
_0815C458: .4byte 0x05000006
	thumb_func_end sub_815C3E4

	thumb_func_start sub_815C45C
sub_815C45C: @ 815C45C
	ldr r0, _0815C484 @ =0x04000134
	movs r3, 0
	strh r3, [r0]
	ldr r2, _0815C488 @ =0x04000128
	movs r1, 0xA0
	lsls r1, 7
	adds r0, r1, 0
	strh r0, [r2]
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0815C48C @ =gUnknown_3003F84
	strb r3, [r0]
	ldr r0, _0815C490 @ =gUnknown_3002066
	strh r3, [r0]
	ldr r1, _0815C494 @ =gUnknown_3002068
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_0815C484: .4byte 0x04000134
_0815C488: .4byte 0x04000128
_0815C48C: .4byte gUnknown_3003F84
_0815C490: .4byte gUnknown_3002066
_0815C494: .4byte gUnknown_3002068
	thumb_func_end sub_815C45C

	thumb_func_start sub_815C498
sub_815C498: @ 815C498
	push {r4-r6,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0815C4B8 @ =gUnknown_3002048
	ldrb r0, [r0, 0x1]
	cmp r0, 0x6
	bls _0815C4AE
	b _0815C5F4
_0815C4AE:
	lsls r0, 2
	ldr r1, _0815C4BC @ =_0815C4C0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0815C4B8: .4byte gUnknown_3002048
_0815C4BC: .4byte _0815C4C0
	.align 2, 0
_0815C4C0:
	.4byte _0815C4DC
	.4byte _0815C4F0
	.4byte _0815C510
	.4byte _0815C524
	.4byte _0815C59C
	.4byte _0815C5AC
	.4byte _0815C5E4
_0815C4DC:
	bl sub_815C3E4
	ldr r1, _0815C4EC @ =gUnknown_3002048
	movs r0, 0x1
	strb r0, [r1, 0x2]
	strb r0, [r1, 0x1]
	b _0815C5F4
	.align 2, 0
_0815C4EC: .4byte gUnknown_3002048
_0815C4F0:
	adds r0, r2, 0
	bl sub_815C610
	lsls r0, 16
	cmp r0, 0
	beq _0815C500
	bl sub_815C864
_0815C500:
	ldr r0, _0815C50C @ =gUnknown_3003F84
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _0815C50A
	b _0815C5F4
_0815C50A:
	b _0815C52C
	.align 2, 0
_0815C50C: .4byte gUnknown_3003F84
_0815C510:
	bl sub_815C45C
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_815C644
	ldr r1, _0815C538 @ =gUnknown_3002048
	movs r0, 0x3
	strb r0, [r1, 0x1]
_0815C524:
	ldr r0, _0815C53C @ =gUnknown_3003F84
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0815C540
_0815C52C:
	ldr r1, _0815C538 @ =gUnknown_3002048
	strb r0, [r1, 0x4]
	movs r0, 0x6
	strb r0, [r1, 0x1]
	b _0815C5F4
	.align 2, 0
_0815C538: .4byte gUnknown_3002048
_0815C53C: .4byte gUnknown_3003F84
_0815C540:
	ldr r2, _0815C580 @ =gUnknown_3002066
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	ldr r1, _0815C584 @ =gUnknown_3002068
	ldr r0, [r1]
	adds r3, r0, 0x1
	str r3, [r1]
	ldr r1, _0815C588 @ =gUnknown_3002048
	ldrb r0, [r1]
	cmp r0, 0
	bne _0815C564
	cmp r3, 0x3C
	bls _0815C564
	movs r0, 0x1
	strb r0, [r1, 0x4]
	movs r0, 0x6
	strb r0, [r1, 0x1]
_0815C564:
	ldr r4, _0815C588 @ =gUnknown_3002048
	ldrb r0, [r4, 0x2]
	cmp r0, 0x2
	beq _0815C5F4
	ldrb r0, [r4]
	cmp r0, 0
	beq _0815C58C
	ldrh r0, [r2]
	cmp r0, 0x2
	bls _0815C58C
	bl sub_815C864
	movs r0, 0x2
	b _0815C5F2
	.align 2, 0
_0815C580: .4byte gUnknown_3002066
_0815C584: .4byte gUnknown_3002068
_0815C588: .4byte gUnknown_3002048
_0815C58C:
	bl sub_815C864
	ldr r1, _0815C598 @ =gUnknown_3002048
	movs r0, 0x2
	strb r0, [r1, 0x2]
	b _0815C5F4
	.align 2, 0
_0815C598: .4byte gUnknown_3002048
_0815C59C:
	bl sub_815C3E4
	ldr r1, _0815C5A8 @ =gUnknown_3002048
	movs r0, 0x5
	strb r0, [r1, 0x1]
	b _0815C5F4
	.align 2, 0
_0815C5A8: .4byte gUnknown_3002048
_0815C5AC:
	ldr r0, _0815C5DC @ =gUnknown_3002048
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0815C5C0
	ldr r0, _0815C5E0 @ =gUnknown_3002066
	ldrh r0, [r0]
	cmp r0, 0x2
	bls _0815C5C0
	bl sub_815C864
_0815C5C0:
	ldr r1, _0815C5E0 @ =gUnknown_3002066
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3C
	bls _0815C5F4
	ldr r0, _0815C5DC @ =gUnknown_3002048
	movs r1, 0x1
	strb r1, [r0, 0x4]
	movs r1, 0x6
	strb r1, [r0, 0x1]
	b _0815C5F4
	.align 2, 0
_0815C5DC: .4byte gUnknown_3002048
_0815C5E0: .4byte gUnknown_3002066
_0815C5E4:
	ldr r4, _0815C60C @ =gUnknown_3002048
	ldrb r0, [r4, 0x2]
	cmp r0, 0
	beq _0815C5F4
	bl sub_815C3A4
	movs r0, 0
_0815C5F2:
	strb r0, [r4, 0x2]
_0815C5F4:
	ldr r2, _0815C60C @ =gUnknown_3002048
	ldrb r0, [r2, 0x2]
	ldrb r1, [r2, 0x4]
	lsls r1, 2
	orrs r0, r1
	ldrb r1, [r2, 0x3]
	lsls r1, 4
	orrs r0, r1
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0815C60C: .4byte gUnknown_3002048
	thumb_func_end sub_815C498

	thumb_func_start sub_815C610
sub_815C610: @ 815C610
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0815C62C @ =0x04000128
	ldr r0, [r0]
	movs r1, 0xC
	ands r0, r1
	cmp r0, 0x8
	bne _0815C634
	cmp r2, 0
	beq _0815C634
	ldr r1, _0815C630 @ =gUnknown_3002048
	movs r0, 0x1
	b _0815C638
	.align 2, 0
_0815C62C: .4byte 0x04000128
_0815C630: .4byte gUnknown_3002048
_0815C634:
	ldr r1, _0815C640 @ =gUnknown_3002048
	movs r0, 0
_0815C638:
	strb r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_0815C640: .4byte gUnknown_3002048
	thumb_func_end sub_815C610

	thumb_func_start sub_815C644
sub_815C644: @ 815C644
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r3, _0815C670 @ =gUnknown_3002048
	ldrb r0, [r3]
	cmp r0, 0
	beq _0815C67C
	ldr r2, _0815C674 @ =0x04000128
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	str r5, [r3, 0x8]
	ldr r0, _0815C678 @ =0x04000120
	str r4, [r0]
	lsrs r0, r4, 2
	adds r0, 0x1
	str r0, [r3, 0x10]
	bl sub_815C690
	b _0815C684
	.align 2, 0
_0815C670: .4byte gUnknown_3002048
_0815C674: .4byte 0x04000128
_0815C678: .4byte 0x04000120
_0815C67C:
	ldr r1, _0815C68C @ =0x04000128
	ldrh r0, [r1]
	strh r0, [r1]
	str r2, [r3, 0x8]
_0815C684:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815C68C: .4byte 0x04000128
	thumb_func_end sub_815C644

	thumb_func_start sub_815C690
sub_815C690: @ 815C690
	ldr r1, _0815C6B4 @ =0x0400010c
	ldr r2, _0815C6B8 @ =0x0000fda7
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0815C6BC @ =0x0400010e
	movs r2, 0x40
	strh r2, [r0]
	ldr r3, _0815C6C0 @ =0x04000208
	movs r0, 0
	strh r0, [r3]
	adds r1, 0xF4
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r0, 0x1
	strh r0, [r3]
	bx lr
	.align 2, 0
_0815C6B4: .4byte 0x0400010c
_0815C6B8: .4byte 0x0000fda7
_0815C6BC: .4byte 0x0400010e
_0815C6C0: .4byte 0x04000208
	thumb_func_end sub_815C690

	thumb_func_start sub_815C6C4
sub_815C6C4: @ 815C6C4
	push {lr}
	bl sub_815C874
	bl sub_815C864
	pop {r0}
	bx r0
	thumb_func_end sub_815C6C4

	thumb_func_start sub_815C6D4
sub_815C6D4: @ 815C6D4
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r2, _0815C6EC @ =gUnknown_3002048
	ldrb r0, [r2, 0x1]
	adds r3, r2, 0
	cmp r0, 0x3
	beq _0815C75C
	cmp r0, 0x3
	bgt _0815C6F0
	cmp r0, 0x1
	beq _0815C6F8
	b _0815C852
	.align 2, 0
_0815C6EC: .4byte gUnknown_3002048
_0815C6F0:
	cmp r0, 0x5
	bne _0815C6F6
	b _0815C824
_0815C6F6:
	b _0815C852
_0815C6F8:
	ldr r1, _0815C728 @ =0x0400012a
	ldr r2, _0815C72C @ =0x0000ccd0
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0815C730 @ =0x04000120
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r4, 0
	ldr r6, _0815C72C @ =0x0000ccd0
	ldr r5, _0815C734 @ =0x0000ffff
_0815C714:
	lsls r0, r1, 1
	add r0, sp
	ldrh r0, [r0]
	cmp r0, r6
	bne _0815C738
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	b _0815C742
	.align 2, 0
_0815C728: .4byte 0x0400012a
_0815C72C: .4byte 0x0000ccd0
_0815C730: .4byte 0x04000120
_0815C734: .4byte 0x0000ffff
_0815C738:
	cmp r0, r5
	beq _0815C742
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_0815C742:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3
	bls _0815C714
	cmp r2, 0x2
	beq _0815C752
	b _0815C852
_0815C752:
	cmp r4, 0
	beq _0815C758
	b _0815C852
_0815C758:
	strb r2, [r3, 0x1]
	b _0815C852
_0815C75C:
	ldr r0, _0815C798 @ =0x04000120
	ldr r4, [r0]
	ldr r0, [r2, 0xC]
	cmp r0, 0
	bne _0815C772
	ldrb r0, [r2]
	cmp r0, 0
	bne _0815C772
	lsrs r0, r4, 2
	adds r0, 0x1
	str r0, [r2, 0x10]
_0815C772:
	ldrb r0, [r3]
	cmp r0, 0x1
	bne _0815C7A8
	ldr r1, [r3, 0xC]
	ldr r0, [r3, 0x10]
	cmp r1, r0
	bge _0815C79C
	ldr r2, _0815C798 @ =0x04000120
	ldr r0, [r3, 0x8]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, [r3, 0x14]
	ldr r1, [r1]
	adds r0, r1
	str r0, [r3, 0x14]
	b _0815C7E2
	.align 2, 0
_0815C798: .4byte 0x04000120
_0815C79C:
	ldr r1, _0815C7A4 @ =0x04000120
	ldr r0, [r3, 0x14]
	b _0815C7E0
	.align 2, 0
_0815C7A4: .4byte 0x04000120
_0815C7A8:
	ldr r1, [r3, 0xC]
	cmp r1, 0
	ble _0815C7C8
	ldr r0, [r3, 0x10]
	adds r0, 0x1
	cmp r1, r0
	bge _0815C7C8
	ldr r0, [r3, 0x8]
	lsls r1, 2
	adds r1, r0
	subs r1, 0x4
	str r4, [r1]
	ldr r0, [r3, 0x14]
	adds r0, r4
	str r0, [r3, 0x14]
	b _0815C7DC
_0815C7C8:
	ldr r0, [r3, 0xC]
	cmp r0, 0
	beq _0815C7DC
	ldr r0, [r3, 0x14]
	cmp r0, r4
	bne _0815C7D8
	movs r0, 0x1
	b _0815C7DA
_0815C7D8:
	movs r0, 0x2
_0815C7DA:
	strb r0, [r3, 0x3]
_0815C7DC:
	ldr r1, _0815C804 @ =gUnknown_3002068
	movs r0, 0
_0815C7E0:
	str r0, [r1]
_0815C7E2:
	ldr r1, [r3, 0xC]
	adds r1, 0x1
	str r1, [r3, 0xC]
	ldr r0, [r3, 0x10]
	adds r0, 0x2
	cmp r1, r0
	bge _0815C812
	ldrb r0, [r3]
	cmp r0, 0
	beq _0815C80C
	ldr r0, _0815C808 @ =0x0400010e
	ldrh r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strh r1, [r0]
	b _0815C852
	.align 2, 0
_0815C804: .4byte gUnknown_3002068
_0815C808: .4byte 0x0400010e
_0815C80C:
	bl sub_815C864
	b _0815C852
_0815C812:
	movs r0, 0
	movs r1, 0x4
	strb r1, [r3, 0x1]
	ldr r1, _0815C820 @ =gUnknown_3002066
	strh r0, [r1]
	b _0815C852
	.align 2, 0
_0815C820: .4byte gUnknown_3002066
_0815C824:
	ldrb r3, [r2]
	cmp r3, 0
	bne _0815C830
	ldr r1, _0815C85C @ =0x0400012a
	ldrb r0, [r2, 0x3]
	strh r0, [r1]
_0815C830:
	ldr r0, _0815C860 @ =0x04000120
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	mov r0, sp
	ldrh r1, [r0, 0x2]
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0815C852
	cmp r3, 0x1
	bne _0815C84E
	strb r1, [r2, 0x3]
_0815C84E:
	movs r0, 0x6
	strb r0, [r2, 0x1]
_0815C852:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815C85C: .4byte 0x0400012a
_0815C860: .4byte 0x04000120
	thumb_func_end sub_815C6D4

	thumb_func_start sub_815C864
sub_815C864: @ 815C864
	ldr r0, _0815C870 @ =0x04000128
	ldrh r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_0815C870: .4byte 0x04000128
	thumb_func_end sub_815C864

	thumb_func_start sub_815C874
sub_815C874: @ 815C874
	ldr r2, _0815C888 @ =0x0400010e
	ldrh r1, [r2]
	ldr r0, _0815C88C @ =0x0000ff7f
	ands r0, r1
	strh r0, [r2]
	ldr r1, _0815C890 @ =0x0400010c
	ldr r2, _0815C894 @ =0x0000fda7
	adds r0, r2, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_0815C888: .4byte 0x0400010e
_0815C88C: .4byte 0x0000ff7f
_0815C890: .4byte 0x0400010c
_0815C894: .4byte 0x0000fda7
	thumb_func_end sub_815C874

	thumb_func_start sub_815C898
sub_815C898: @ 815C898
	push {r4,lr}
	ldr r0, _0815C8B8 @ =0x04000130
	ldrh r0, [r0]
	ldr r2, _0815C8BC @ =0x000003ff
	adds r1, r2, 0
	eors r1, r0
	ldr r4, _0815C8C0 @ =gUnknown_3002062
	ldr r3, _0815C8C4 @ =gUnknown_3002060
	ldrh r2, [r3]
	adds r0, r1, 0
	bics r0, r2
	strh r0, [r4]
	strh r1, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815C8B8: .4byte 0x04000130
_0815C8BC: .4byte 0x000003ff
_0815C8C0: .4byte gUnknown_3002062
_0815C8C4: .4byte gUnknown_3002060
	thumb_func_end sub_815C898

	thumb_func_start sub_815C8C8
sub_815C8C8: @ 815C8C8
	ldr r1, _0815C8F4 @ =gUnknown_300206C
	ldr r0, _0815C8F8 @ =0x04000208
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0815C8FC @ =gUnknown_300206E
	ldr r0, _0815C900 @ =0x04000200
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0815C904 @ =gUnknown_3002070
	ldr r0, _0815C908 @ =0x0400010e
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0815C90C @ =gUnknown_3002072
	ldr r0, _0815C910 @ =0x04000128
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0815C914 @ =gUnknown_3002074
	ldr r0, _0815C918 @ =0x04000134
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0815C8F4: .4byte gUnknown_300206C
_0815C8F8: .4byte 0x04000208
_0815C8FC: .4byte gUnknown_300206E
_0815C900: .4byte 0x04000200
_0815C904: .4byte gUnknown_3002070
_0815C908: .4byte 0x0400010e
_0815C90C: .4byte gUnknown_3002072
_0815C910: .4byte 0x04000128
_0815C914: .4byte gUnknown_3002074
_0815C918: .4byte 0x04000134
	thumb_func_end sub_815C8C8

	thumb_func_start sub_815C91C
sub_815C91C: @ 815C91C
	ldr r1, _0815C948 @ =0x04000208
	ldr r0, _0815C94C @ =gUnknown_300206C
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, 0x8
	ldr r0, _0815C950 @ =gUnknown_300206E
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, 0xF2
	ldr r0, _0815C954 @ =gUnknown_3002070
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x1A
	ldr r0, _0815C958 @ =gUnknown_3002072
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0xC
	ldr r0, _0815C95C @ =gUnknown_3002074
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0815C948: .4byte 0x04000208
_0815C94C: .4byte gUnknown_300206C
_0815C950: .4byte gUnknown_300206E
_0815C954: .4byte gUnknown_3002070
_0815C958: .4byte gUnknown_3002072
_0815C95C: .4byte gUnknown_3002074
	thumb_func_end sub_815C91C

	thumb_func_start sub_815C960
sub_815C960: @ 815C960
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r1, _0815C978 @ =gUnknown_3002048
	ldr r2, _0815C97C @ =0x05000006
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0815C978: .4byte gUnknown_3002048
_0815C97C: .4byte 0x05000006
	thumb_func_end sub_815C960

	.align 2, 0 @ Don't pad with nop.
