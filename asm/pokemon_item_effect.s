	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start ExecuteTableBasedItemEffect_
ExecuteTableBasedItemEffect_: @ 80413C0
	push {r4,lr}
	sub sp, 0x4
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	movs r4, 0
	str r4, [sp]
	bl sub_80413E4
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ExecuteTableBasedItemEffect_

	thumb_func_start sub_80413E4
sub_80413E4: @ 80413E4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x3C
	mov r8, r0
	ldr r0, [sp, 0x5C]
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x8]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0xC]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x10]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x14]
	movs r0, 0x1
	str r0, [sp, 0x1C]
	movs r1, 0x6
	str r1, [sp, 0x24]
	movs r2, 0
	str r2, [sp, 0x2C]
	movs r3, 0x4
	str r3, [sp, 0x34]
	mov r0, r8
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _08041474
	ldr r0, _08041450 @ =gUnknown_30030F0
	ldr r4, _08041454 @ =0x00000439
	adds r0, r4
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08041460
	ldr r2, _08041458 @ =gUnknown_2023F54
	ldr r0, _0804145C @ =gUnknown_2024004
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x7]
	b _0804147C
	.align 2, 0
_08041450: .4byte gUnknown_30030F0
_08041454: .4byte 0x00000439
_08041458: .4byte gUnknown_2023F54
_0804145C: .4byte gUnknown_2024004
_08041460:
	ldr r0, _0804146C @ =gUnknown_3005008
	ldr r0, [r0]
	ldr r5, _08041470 @ =0x0000311a
	adds r0, r5
	ldrb r0, [r0]
	b _0804147C
	.align 2, 0
_0804146C: .4byte gUnknown_3005008
_08041470: .4byte 0x0000311a
_08041474:
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r0, 24
_0804147C:
	str r0, [sp, 0x30]
	ldr r1, _080414D8 @ =gUnknown_2023D6F
	ldr r0, _080414DC @ =gUnknown_2024004
	ldrb r2, [r0]
	strb r2, [r1]
	ldr r0, _080414E0 @ =gUnknown_30030F0
	ldr r1, _080414E4 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _0804151C
	ldr r0, _080414E8 @ =gUnknown_2023BC4
	strb r2, [r0]
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	negs r1, r0
	orrs r1, r0
	lsrs r1, 31
	str r1, [sp, 0x18]
	ldr r0, _080414EC @ =gUnknown_2023BCC
	ldr r4, [sp, 0x8]
	subs r4, 0xD
	ldrb r0, [r0]
	cmp r1, r0
	bge _08041528
	ldr r2, _080414F0 @ =gUnknown_2023BCE
	lsls r0, r1, 1
	adds r0, r2
	ldrh r3, [r0]
	ldr r5, [sp, 0xC]
	lsls r0, r5, 16
	lsrs r1, r0, 16
	adds r5, r0, 0
	cmp r3, r1
	bne _080414F4
	ldr r0, [sp, 0x18]
	str r0, [sp, 0x34]
	b _08041528
	.align 2, 0
_080414D8: .4byte gUnknown_2023D6F
_080414DC: .4byte gUnknown_2024004
_080414E0: .4byte gUnknown_30030F0
_080414E4: .4byte 0x00000439
_080414E8: .4byte gUnknown_2023BC4
_080414EC: .4byte gUnknown_2023BCC
_080414F0: .4byte gUnknown_2023BCE
_080414F4:
	ldr r1, [sp, 0x18]
	adds r1, 0x2
	str r1, [sp, 0x18]
	ldr r0, _08041518 @ =gUnknown_2023BCC
	ldrb r0, [r0]
	cmp r1, r0
	bge _08041528
	lsls r0, r1, 1
	adds r0, r2
	ldrh r1, [r0]
	lsrs r0, r5, 16
	cmp r1, r0
	bne _080414F4
	ldr r2, [sp, 0x18]
	lsls r0, r2, 24
	lsrs r0, 24
	str r0, [sp, 0x34]
	b _08041528
	.align 2, 0
_08041518: .4byte gUnknown_2023BCC
_0804151C:
	ldr r0, _08041544 @ =gUnknown_2023BC4
	strb r1, [r0]
	movs r3, 0x4
	str r3, [sp, 0x34]
	ldr r4, [sp, 0x8]
	subs r4, 0xD
_08041528:
	lsls r0, r4, 16
	lsrs r0, 16
	cmp r0, 0xA5
	bhi _080415A8
	ldr r1, _08041548 @ =gUnknown_82528BC
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	bne _0804154C
	ldr r4, [sp, 0x8]
	cmp r4, 0xAF
	beq _08041552
	b _080415A8
	.align 2, 0
_08041544: .4byte gUnknown_2023BC4
_08041548: .4byte gUnknown_82528BC
_0804154C:
	ldr r5, [sp, 0x8]
	cmp r5, 0xAF
	bne _080415AE
_08041552:
	ldr r0, _08041574 @ =gUnknown_30030F0
	ldr r1, _08041578 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08041584
	ldr r0, _0804157C @ =gUnknown_2023BC4
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _08041580 @ =gUnknown_2023F5C
	adds r0, r1
	b _080415AE
	.align 2, 0
_08041574: .4byte gUnknown_30030F0
_08041578: .4byte 0x00000439
_0804157C: .4byte gUnknown_2023BC4
_08041580: .4byte gUnknown_2023F5C
_08041584:
	ldr r0, _08041590 @ =gUnknown_3005008
	ldr r0, [r0]
	ldr r2, _08041594 @ =0x00003108
	adds r2, r0, r2
	str r2, [sp, 0x20]
	b _080415B0
	.align 2, 0
_08041590: .4byte gUnknown_3005008
_08041594: .4byte 0x00003108
_08041598:
	mov r0, r8
	movs r2, 0
	ldr r3, [sp, 0xC]
	bl BeginEvolutionScene
	movs r0, 0
	bl _08042394
_080415A8:
	movs r0, 0x1
	bl _08042394
_080415AE:
	str r0, [sp, 0x20]
_080415B0:
	movs r3, 0
	str r3, [sp, 0x18]
_080415B4:
	ldr r4, [sp, 0x18]
	cmp r4, 0x5
	bls _080415BE
	bl _08042384
_080415BE:
	lsls r0, r4, 2
	ldr r1, _080415C8 @ =_080415CC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080415C8: .4byte _080415CC
	.align 2, 0
_080415CC:
	.4byte _080415E4
	.4byte _080416B0
	.4byte _08041744
	.4byte _080417D8
	.4byte _080419B8
	.4byte _08042056
_080415E4:
	ldr r5, [sp, 0x20]
	ldr r0, [sp, 0x18]
	adds r2, r5, r0
	ldrb r1, [r2]
	movs r0, 0x80
	ands r0, r1
	adds r6, r2, 0
	cmp r0, 0
	beq _0804162C
	ldr r0, _0804169C @ =gUnknown_30030F0
	ldr r1, _080416A0 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0804162C
	ldr r2, [sp, 0x34]
	cmp r2, 0x4
	beq _0804162C
	ldr r1, _080416A4 @ =gUnknown_2023BE4
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r1
	cmp r0, 0
	beq _0804162C
	ldr r0, _080416A8 @ =0xfff0ffff
	ands r1, r0
	str r1, [r2]
	movs r3, 0
	str r3, [sp, 0x1C]
_0804162C:
	ldrb r1, [r6]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0
	beq _0804165A
	ldr r1, _080416A4 @ =gUnknown_2023BE4
	ldr r0, _080416AC @ =gUnknown_2023BC4
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r3, 0x80
	lsls r3, 13
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	bne _0804165A
	orrs r1, r3
	str r1, [r2]
	movs r4, 0
	str r4, [sp, 0x1C]
_0804165A:
	ldrb r0, [r6]
	movs r3, 0xF
	ands r3, r0
	cmp r3, 0
	bne _08041668
	bl _08042384
_08041668:
	ldr r6, _080416A4 @ =gUnknown_2023BE4
	ldr r5, _080416AC @ =gUnknown_2023BC4
	ldrb r0, [r5]
	movs r4, 0x58
	muls r0, r4
	adds r1, r0, r6
	ldrb r2, [r1, 0x19]
	movs r0, 0x19
	ldrsb r0, [r1, r0]
	cmp r0, 0xB
	ble _08041682
	bl _08042384
_08041682:
	adds r0, r2, r3
	strb r0, [r1, 0x19]
	ldrb r0, [r5]
	muls r0, r4
	adds r1, r0, r6
	movs r0, 0x19
	ldrsb r0, [r1, r0]
	cmp r0, 0xC
	bgt _08041696
	b _0804198A
_08041696:
	movs r0, 0xC
	strb r0, [r1, 0x19]
	b _0804198A
	.align 2, 0
_0804169C: .4byte gUnknown_30030F0
_080416A0: .4byte 0x00000439
_080416A4: .4byte gUnknown_2023BE4
_080416A8: .4byte 0xfff0ffff
_080416AC: .4byte gUnknown_2023BC4
_080416B0:
	ldr r0, [sp, 0x20]
	ldr r1, [sp, 0x18]
	adds r2, r0, r1
	ldrb r1, [r2]
	movs r0, 0xF0
	ands r0, r1
	lsls r3, r0, 24
	adds r6, r2, 0
	cmp r3, 0
	beq _080416F6
	ldr r7, _0804173C @ =gUnknown_2023BE4
	ldr r5, _08041740 @ =gUnknown_2023BC4
	ldrb r0, [r5]
	movs r4, 0x58
	muls r0, r4
	adds r1, r0, r7
	ldrb r2, [r1, 0x1A]
	movs r0, 0x1A
	ldrsb r0, [r1, r0]
	cmp r0, 0xB
	bgt _080416F6
	lsrs r0, r3, 28
	adds r0, r2, r0
	strb r0, [r1, 0x1A]
	ldrb r0, [r5]
	muls r0, r4
	adds r1, r0, r7
	movs r0, 0x1A
	ldrsb r0, [r1, r0]
	cmp r0, 0xC
	ble _080416F2
	movs r0, 0xC
	strb r0, [r1, 0x1A]
_080416F2:
	movs r2, 0
	str r2, [sp, 0x1C]
_080416F6:
	ldrb r0, [r6]
	movs r3, 0xF
	ands r3, r0
	cmp r3, 0
	bne _08041704
	bl _08042384
_08041704:
	ldr r6, _0804173C @ =gUnknown_2023BE4
	ldr r5, _08041740 @ =gUnknown_2023BC4
	ldrb r0, [r5]
	movs r4, 0x58
	muls r0, r4
	adds r1, r0, r6
	ldrb r2, [r1, 0x1B]
	movs r0, 0x1B
	ldrsb r0, [r1, r0]
	cmp r0, 0xB
	ble _0804171E
	bl _08042384
_0804171E:
	adds r0, r2, r3
	strb r0, [r1, 0x1B]
	ldrb r0, [r5]
	muls r0, r4
	adds r1, r0, r6
	movs r0, 0x1B
	ldrsb r0, [r1, r0]
	cmp r0, 0xC
	ble _08041734
	movs r0, 0xC
	strb r0, [r1, 0x1B]
_08041734:
	movs r3, 0
	str r3, [sp, 0x1C]
	bl _08042384
	.align 2, 0
_0804173C: .4byte gUnknown_2023BE4
_08041740: .4byte gUnknown_2023BC4
_08041744:
	ldr r4, [sp, 0x20]
	ldr r5, [sp, 0x18]
	adds r2, r4, r5
	ldrb r1, [r2]
	movs r0, 0xF0
	ands r0, r1
	lsls r3, r0, 24
	adds r6, r2, 0
	cmp r3, 0
	beq _0804178A
	ldr r7, _080417D0 @ =gUnknown_2023BE4
	ldr r5, _080417D4 @ =gUnknown_2023BC4
	ldrb r0, [r5]
	movs r4, 0x58
	muls r0, r4
	adds r1, r0, r7
	ldrb r2, [r1, 0x1E]
	movs r0, 0x1E
	ldrsb r0, [r1, r0]
	cmp r0, 0xB
	bgt _0804178A
	lsrs r0, r3, 28
	adds r0, r2, r0
	strb r0, [r1, 0x1E]
	ldrb r0, [r5]
	muls r0, r4
	adds r1, r0, r7
	movs r0, 0x1E
	ldrsb r0, [r1, r0]
	cmp r0, 0xC
	ble _08041786
	movs r0, 0xC
	strb r0, [r1, 0x1E]
_08041786:
	movs r0, 0
	str r0, [sp, 0x1C]
_0804178A:
	ldrb r0, [r6]
	movs r3, 0xF
	ands r3, r0
	cmp r3, 0
	bne _08041798
	bl _08042384
_08041798:
	ldr r6, _080417D0 @ =gUnknown_2023BE4
	ldr r5, _080417D4 @ =gUnknown_2023BC4
	ldrb r0, [r5]
	movs r4, 0x58
	muls r0, r4
	adds r1, r0, r6
	ldrb r2, [r1, 0x1C]
	movs r0, 0x1C
	ldrsb r0, [r1, r0]
	cmp r0, 0xB
	ble _080417B2
	bl _08042384
_080417B2:
	adds r0, r2, r3
	strb r0, [r1, 0x1C]
	ldrb r0, [r5]
	muls r0, r4
	adds r1, r0, r6
	movs r0, 0x1C
	ldrsb r0, [r1, r0]
	cmp r0, 0xC
	ble _080417C8
	movs r0, 0xC
	strb r0, [r1, 0x1C]
_080417C8:
	movs r1, 0
	str r1, [sp, 0x1C]
	bl _08042384
	.align 2, 0
_080417D0: .4byte gUnknown_2023BE4
_080417D4: .4byte gUnknown_2023BC4
_080417D8:
	ldr r3, [sp, 0x20]
	ldr r4, [sp, 0x18]
	adds r2, r3, r4
	ldrb r1, [r2]
	movs r0, 0x80
	ands r0, r1
	adds r6, r2, 0
	cmp r0, 0
	beq _08041820
	ldr r5, _08041994 @ =gUnknown_2023DE4
	ldr r4, _08041998 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	bne _08041820
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	movs r0, 0x5
	strb r0, [r1, 0x4]
	movs r5, 0
	str r5, [sp, 0x1C]
_08041820:
	ldrb r1, [r6]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08041882
	mov r0, r8
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	cmp r0, 0x64
	beq _08041882
	ldr r5, _0804199C @ =gUnknown_8253AE4
	mov r0, r8
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	adds r4, 0x1
	lsls r4, 2
	ldr r2, _080419A0 @ =gUnknown_8254784
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r1
	adds r4, r0
	adds r4, r5
	ldr r0, [r4]
	str r0, [sp]
	mov r0, r8
	movs r1, 0x19
	mov r2, sp
	bl sub_804037C
	mov r0, r8
	bl CalculateMonStats
	movs r0, 0
	str r0, [sp, 0x1C]
_08041882:
	ldrb r1, [r6]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080418BE
	mov r0, r8
	ldr r1, [sp, 0xC]
	movs r2, 0x7
	ldr r3, [sp, 0x34]
	bl sub_80423A4
	lsls r0, 24
	cmp r0, 0
	bne _080418BE
	ldr r1, [sp, 0x34]
	cmp r1, 0x4
	beq _080418BA
	ldr r1, _080419A4 @ =gUnknown_2023BE4
	movs r0, 0x58
	ldr r3, [sp, 0x34]
	adds r2, r3, 0
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	ldr r1, _080419A8 @ =0xf7ffffff
	ands r0, r1
	str r0, [r2]
_080418BA:
	movs r4, 0
	str r4, [sp, 0x1C]
_080418BE:
	ldrb r1, [r6]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080418DE
	ldr r2, _080419AC @ =0x00000f88
	mov r0, r8
	ldr r1, [sp, 0xC]
	ldr r3, [sp, 0x34]
	bl sub_80423A4
	lsls r0, 24
	cmp r0, 0
	bne _080418DE
	movs r5, 0
	str r5, [sp, 0x1C]
_080418DE:
	ldrb r1, [r6]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080418FE
	mov r0, r8
	ldr r1, [sp, 0xC]
	movs r2, 0x10
	ldr r3, [sp, 0x34]
	bl sub_80423A4
	lsls r0, 24
	cmp r0, 0
	bne _080418FE
	movs r0, 0
	str r0, [sp, 0x1C]
_080418FE:
	ldrb r1, [r6]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0804191E
	mov r0, r8
	ldr r1, [sp, 0xC]
	movs r2, 0x20
	ldr r3, [sp, 0x34]
	bl sub_80423A4
	lsls r0, 24
	cmp r0, 0
	bne _0804191E
	movs r1, 0
	str r1, [sp, 0x1C]
_0804191E:
	ldrb r1, [r6]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0804193E
	mov r0, r8
	ldr r1, [sp, 0xC]
	movs r2, 0x40
	ldr r3, [sp, 0x34]
	bl sub_80423A4
	lsls r0, 24
	cmp r0, 0
	bne _0804193E
	movs r2, 0
	str r2, [sp, 0x1C]
_0804193E:
	ldrb r1, [r6]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0804194C
	bl _08042384
_0804194C:
	ldr r0, _080419B0 @ =gUnknown_30030F0
	ldr r3, _080419B4 @ =0x00000439
	adds r0, r3
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08041960
	bl _08042384
_08041960:
	ldr r4, [sp, 0x34]
	cmp r4, 0x4
	bne _0804196A
	bl _08042384
_0804196A:
	ldr r1, _080419A4 @ =gUnknown_2023BE4
	movs r0, 0x58
	muls r0, r4
	adds r1, 0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08041982
	bl _08042384
_08041982:
	movs r0, 0x8
	negs r0, r0
	ands r1, r0
	str r1, [r2]
_0804198A:
	movs r5, 0
	str r5, [sp, 0x1C]
	bl _08042384
	.align 2, 0
_08041994: .4byte gUnknown_2023DE4
_08041998: .4byte gUnknown_2023BC4
_0804199C: .4byte gUnknown_8253AE4
_080419A0: .4byte gUnknown_8254784
_080419A4: .4byte gUnknown_2023BE4
_080419A8: .4byte 0xf7ffffff
_080419AC: .4byte 0x00000f88
_080419B0: .4byte gUnknown_30030F0
_080419B4: .4byte 0x00000439
_080419B8:
	ldr r1, [sp, 0x20]
	ldr r2, [sp, 0x18]
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r10, r0
	movs r0, 0x20
	mov r3, r10
	ands r0, r3
	cmp r0, 0
	beq _08041A90
	movs r0, 0xDF
	ands r3, r0
	mov r10, r3
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	ldr r1, _08041ABC @ =gUnknown_825DEA1
	ldr r4, [sp, 0x10]
	adds r1, r4, r1
	ldrb r1, [r1]
	ands r0, r1
	lsls r1, r4, 1
	lsrs r0, r1
	str r0, [sp]
	adds r5, r4, 0
	adds r5, 0xD
	mov r0, r8
	adds r1, r5, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	ldr r2, [sp, 0x10]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x28]
	ldr r0, [sp]
	cmp r0, 0x2
	bhi _08041A90
	ldr r0, [sp, 0x28]
	cmp r0, 0x4
	bls _08041A90
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	ldr r1, _08041AC0 @ =gUnknown_825DEA9
	ldr r2, [sp, 0x10]
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r0, r1
	str r0, [sp]
	mov r0, r8
	movs r1, 0x15
	mov r2, sp
	bl sub_804037C
	mov r0, r8
	adds r1, r5, 0
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [sp]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, [sp, 0x10]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	ldr r3, [sp, 0x28]
	subs r0, r3
	str r0, [sp]
	ldr r4, [sp, 0x10]
	adds r4, 0x11
	mov r0, r8
	adds r1, r4, 0
	movs r2, 0
	bl GetMonData
	ldr r1, [sp]
	adds r0, r1
	str r0, [sp]
	mov r0, r8
	adds r1, r4, 0
	mov r2, sp
	bl sub_804037C
	movs r4, 0
	str r4, [sp, 0x1C]
_08041A90:
	movs r5, 0
	str r5, [sp, 0x28]
	mov r0, r10
	cmp r0, 0
	bne _08041A9E
	bl _08042384
_08041A9E:
	movs r0, 0x1
	mov r1, r10
	ands r0, r1
	cmp r0, 0
	bne _08041AAA
	b _08042042
_08041AAA:
	ldr r2, [sp, 0x28]
	cmp r2, 0x7
	bls _08041AB2
	b _08042042
_08041AB2:
	lsls r0, r2, 2
	ldr r1, _08041AC4 @ =_08041AC8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08041ABC: .4byte gUnknown_825DEA1
_08041AC0: .4byte gUnknown_825DEA9
_08041AC4: .4byte _08041AC8
	.align 2, 0
_08041AC8:
	.4byte _08041AE8
	.4byte _08041AE8
	.4byte _08041B70
	.4byte _08041D94
	.4byte _08042042
	.4byte _08042042
	.4byte _08042042
	.4byte _0804202C
_08041AE8:
	mov r0, r8
	bl sub_8043A40
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _08041B28 @ =0x000001fd
	cmp r5, r0
	bls _08041AFA
	b _080415A8
_08041AFA:
	ldr r0, _08041B2C @ =gUnknown_825DFEA
	ldr r3, [sp, 0x28]
	adds r0, r3, r0
	ldrb r1, [r0]
	mov r0, r8
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	str r1, [sp]
	cmp r1, 0x63
	bls _08041B14
	b _08042042
_08041B14:
	ldr r4, [sp, 0x20]
	ldr r2, [sp, 0x24]
	adds r0, r4, r2
	ldrb r0, [r0]
	adds r1, r0
	cmp r1, 0x64
	bls _08041B30
	adds r0, 0x64
	subs r4, r0, r1
	b _08041B32
	.align 2, 0
_08041B28: .4byte 0x000001fd
_08041B2C: .4byte gUnknown_825DFEA
_08041B30:
	adds r4, r0, 0
_08041B32:
	adds r1, r5, r4
	movs r0, 0xFF
	lsls r0, 1
	cmp r1, r0
	bls _08041B40
	adds r0, r4, r0
	subs r4, r0, r1
_08041B40:
	ldr r0, [sp]
	adds r0, r4
	str r0, [sp]
	ldr r0, _08041B6C @ =gUnknown_825DFEA
	ldr r3, [sp, 0x28]
	adds r0, r3, r0
	ldrb r1, [r0]
	mov r0, r8
	mov r2, sp
	bl sub_804037C
	mov r0, r8
	bl CalculateMonStats
	ldr r0, [sp, 0x24]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x24]
	movs r4, 0
	str r4, [sp, 0x1C]
	b _08042042
	.align 2, 0
_08041B6C: .4byte gUnknown_825DFEA
_08041B70:
	movs r0, 0x10
	mov r5, r10
	ands r0, r5
	cmp r0, 0
	beq _08041C30
	mov r0, r8
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _08041B90
	ldr r0, [sp, 0x24]
	adds r0, 0x1
	lsls r0, 24
	b _08041ED6
_08041B90:
	ldr r0, _08041BD8 @ =gUnknown_30030F0
	ldr r1, _08041BDC @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r4, 0x2
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08041C46
	ldr r2, [sp, 0x34]
	cmp r2, 0x4
	beq _08041BF0
	ldr r2, _08041BE0 @ =gUnknown_2023D70
	ldr r1, _08041BE4 @ =gUnknown_825E45C
	ldr r3, [sp, 0x34]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r0]
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	ldr r1, _08041BE8 @ =gUnknown_2023BCE
	lsls r0, r3, 1
	adds r0, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, [sp, 0x34]
	bl CopyPlayerPartyMonToBattleData
	ldr r0, _08041BEC @ =gUnknown_2023BC4
	ldrb r0, [r0]
	b _08041C08
	.align 2, 0
_08041BD8: .4byte gUnknown_30030F0
_08041BDC: .4byte 0x00000439
_08041BE0: .4byte gUnknown_2023D70
_08041BE4: .4byte gUnknown_825E45C
_08041BE8: .4byte gUnknown_2023BCE
_08041BEC: .4byte gUnknown_2023BC4
_08041BF0:
	ldr r3, _08041C20 @ =gUnknown_2023D70
	ldr r1, _08041C24 @ =gUnknown_825E45C
	ldr r2, _08041C28 @ =gUnknown_2023BC4
	ldrb r0, [r2]
	eors r0, r4
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldrb r0, [r3]
	bics r0, r1
	strb r0, [r3]
	ldrb r0, [r2]
_08041C08:
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08041C46
	ldr r1, _08041C2C @ =gUnknown_3004F90
	ldrb r0, [r1, 0x4]
	cmp r0, 0xFE
	bhi _08041C46
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _08041C46
	.align 2, 0
_08041C20: .4byte gUnknown_2023D70
_08041C24: .4byte gUnknown_825E45C
_08041C28: .4byte gUnknown_2023BC4
_08041C2C: .4byte gUnknown_3004F90
_08041C30:
	mov r0, r8
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _08041C46
	ldr r0, [sp, 0x24]
	adds r0, 0x1
	lsls r0, 24
	b _08041ED6
_08041C46:
	ldr r1, [sp, 0x24]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x24]
	ldr r4, [sp, 0x20]
	adds r1, r4, r1
	ldrb r1, [r1]
	str r1, [sp]
	adds r0, r1, 0
	cmp r0, 0xFE
	beq _08041C88
	cmp r0, 0xFE
	bhi _08041C68
	cmp r0, 0xFD
	beq _08041C9E
	b _08041CA6
_08041C68:
	cmp r1, 0xFF
	bne _08041CA6
	mov r0, r8
	movs r1, 0x3A
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	subs r4, r0
	str r4, [sp]
	b _08041CA6
_08041C88:
	mov r0, r8
	movs r1, 0x3A
	movs r2, 0
	bl GetMonData
	lsrs r0, 1
	str r0, [sp]
	cmp r0, 0
	bne _08041CA6
	movs r0, 0x1
	b _08041CA4
_08041C9E:
	ldr r0, _08041D60 @ =gUnknown_2023FC4
	adds r0, 0x23
	ldrb r0, [r0]
_08041CA4:
	str r0, [sp]
_08041CA6:
	mov r0, r8
	movs r1, 0x3A
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	cmp r4, r0
	beq _08041D84
	ldr r5, [sp, 0x14]
	cmp r5, 0
	bne _08041D78
	mov r0, r8
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	ldr r1, [sp]
	adds r0, r1
	str r0, [sp]
	mov r0, r8
	movs r1, 0x3A
	movs r2, 0
	bl GetMonData
	ldr r1, [sp]
	cmp r1, r0
	bls _08041CF2
	mov r0, r8
	movs r1, 0x3A
	movs r2, 0
	bl GetMonData
	str r0, [sp]
_08041CF2:
	mov r0, r8
	movs r1, 0x39
	mov r2, sp
	bl sub_804037C
	ldr r0, _08041D64 @ =gUnknown_30030F0
	ldr r1, _08041D68 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08041D80
	ldr r2, [sp, 0x34]
	cmp r2, 0x4
	beq _08041D80
	ldr r1, _08041D6C @ =gUnknown_2023BE4
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldr r1, [sp]
	strh r1, [r0, 0x28]
	movs r0, 0x10
	mov r3, r10
	ands r0, r3
	cmp r0, 0
	bne _08041D80
	ldr r4, _08041D70 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08041D80
	ldr r1, _08041D74 @ =gUnknown_3004F90
	ldrb r0, [r1, 0x3]
	cmp r0, 0xFE
	bhi _08041D42
	adds r0, 0x1
	strb r0, [r1, 0x3]
_08041D42:
	ldrb r5, [r4]
	add r0, sp, 0x34
	ldrb r0, [r0]
	strb r0, [r4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl EmitGetMonData
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	strb r5, [r4]
	b _08041D80
	.align 2, 0
_08041D60: .4byte gUnknown_2023FC4
_08041D64: .4byte gUnknown_30030F0
_08041D68: .4byte 0x00000439
_08041D6C: .4byte gUnknown_2023BE4
_08041D70: .4byte gUnknown_2023BC4
_08041D74: .4byte gUnknown_3004F90
_08041D78:
	ldr r1, _08041D90 @ =gUnknown_2023D50
	ldr r0, [sp]
	negs r0, r0
	str r0, [r1]
_08041D80:
	movs r1, 0
	str r1, [sp, 0x1C]
_08041D84:
	movs r0, 0xEF
	mov r2, r10
	ands r2, r0
	mov r10, r2
	b _08042042
	.align 2, 0
_08041D90: .4byte gUnknown_2023D50
_08041D94:
	movs r7, 0x2
	mov r0, r10
	ands r0, r7
	cmp r0, 0
	beq _08041DA0
	b _08041EF0
_08041DA0:
	movs r5, 0
	ldr r3, [sp, 0x24]
	adds r3, 0x1
	str r3, [sp, 0x38]
_08041DA8:
	movs r4, 0x11
	adds r4, r5
	mov r9, r4
	mov r0, r8
	mov r1, r9
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	adds r7, r5, 0
	adds r7, 0xD
	mov r0, r8
	adds r1, r7, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r5, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	adds r2, r6, 0
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp]
	cmp r1, r0
	beq _08041ECA
	ldr r2, [sp, 0x20]
	ldr r3, [sp, 0x24]
	adds r0, r2, r3
	ldrb r0, [r0]
	adds r0, r1, r0
	str r0, [sp]
	mov r0, r8
	adds r1, r7, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	adds r2, r6, 0
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp]
	cmp r1, r0
	bls _08041E60
	mov r0, r8
	adds r1, r7, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	adds r2, r6, 0
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
_08041E60:
	mov r0, r8
	mov r1, r9
	mov r2, sp
	bl sub_804037C
	ldr r0, _08041EDC @ =gUnknown_30030F0
	ldr r4, _08041EE0 @ =0x00000439
	adds r0, r4
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08041EC6
	ldr r0, [sp, 0x34]
	cmp r0, 0x4
	beq _08041EC6
	ldr r4, _08041EE4 @ =gUnknown_2023BE4
	movs r0, 0x58
	ldr r1, [sp, 0x34]
	adds r3, r1, 0
	muls r3, r0
	adds r0, r4, 0
	adds r0, 0x50
	adds r0, r3, r0
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 14
	ands r1, r0
	cmp r1, 0
	bne _08041EC6
	ldr r1, _08041EE8 @ =gUnknown_2023E0C
	ldr r2, [sp, 0x34]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _08041EEC @ =gUnknown_825E45C
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08041EC6
	adds r0, r5, r3
	adds r1, r4, 0
	adds r1, 0x24
	adds r0, r1
	ldr r1, [sp]
	strb r1, [r0]
_08041EC6:
	movs r3, 0
	str r3, [sp, 0x1C]
_08041ECA:
	adds r5, 0x1
	cmp r5, 0x3
	bgt _08041ED2
	b _08041DA8
_08041ED2:
	ldr r4, [sp, 0x38]
	lsls r0, r4, 24
_08041ED6:
	lsrs r0, 24
	str r0, [sp, 0x24]
	b _08042042
	.align 2, 0
_08041EDC: .4byte gUnknown_30030F0
_08041EE0: .4byte 0x00000439
_08041EE4: .4byte gUnknown_2023BE4
_08041EE8: .4byte gUnknown_2023E0C
_08041EEC: .4byte gUnknown_825E45C
_08041EF0:
	ldr r6, [sp, 0x10]
	adds r6, 0x11
	mov r0, r8
	adds r1, r6, 0
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	ldr r5, [sp, 0x10]
	adds r5, 0xD
	mov r0, r8
	adds r1, r5, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	ldr r2, [sp, 0x10]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [sp]
	cmp r2, r0
	bne _08041F38
	b _08042042
_08041F38:
	ldr r1, [sp, 0x24]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x24]
	ldr r0, [sp, 0x20]
	adds r1, r0, r1
	ldrb r0, [r1]
	adds r0, r2, r0
	str r0, [sp]
	mov r0, r8
	adds r1, r5, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	ldr r2, [sp, 0x10]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp]
	cmp r1, r0
	bls _08041FAC
	mov r0, r8
	adds r1, r5, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	ldr r2, [sp, 0x10]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
_08041FAC:
	mov r0, r8
	adds r1, r6, 0
	mov r2, sp
	bl sub_804037C
	ldr r0, _08042018 @ =gUnknown_30030F0
	ldr r1, _0804201C @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _08042010
	ldr r2, [sp, 0x34]
	cmp r2, 0x4
	beq _08042010
	ldr r4, _08042020 @ =gUnknown_2023BE4
	movs r0, 0x58
	adds r3, r2, 0
	muls r3, r0
	adds r0, r4, 0
	adds r0, 0x50
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _08042010
	ldr r1, _08042024 @ =gUnknown_2023E0C
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _08042028 @ =gUnknown_825E45C
	ldr r5, [sp, 0x10]
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08042010
	adds r0, r5, r3
	adds r1, r4, 0
	adds r1, 0x24
	adds r0, r1
	ldr r1, [sp]
	strb r1, [r0]
_08042010:
	movs r0, 0
	str r0, [sp, 0x1C]
	b _08042042
	.align 2, 0
_08042018: .4byte gUnknown_30030F0
_0804201C: .4byte 0x00000439
_08042020: .4byte gUnknown_2023BE4
_08042024: .4byte gUnknown_2023E0C
_08042028: .4byte gUnknown_825E45C
_0804202C:
	mov r0, r8
	movs r1, 0x2
	ldr r2, [sp, 0x8]
	bl sub_8042EC4
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _08042042
	bl _08041598
_08042042:
	ldr r1, [sp, 0x28]
	adds r1, 0x1
	str r1, [sp, 0x28]
	mov r2, r10
	lsrs r2, 1
	mov r10, r2
	cmp r2, 0
	beq _08042054
	b _08041A9E
_08042054:
	b _08042384
_08042056:
	ldr r3, [sp, 0x20]
	ldr r4, [sp, 0x18]
	adds r0, r3, r4
	ldrb r0, [r0]
	mov r10, r0
	movs r5, 0
	str r5, [sp, 0x28]
	cmp r0, 0
	bne _0804206A
	b _08042384
_0804206A:
	movs r0, 0x1
	mov r1, r10
	ands r0, r1
	cmp r0, 0
	bne _08042076
	b _08042372
_08042076:
	ldr r2, [sp, 0x28]
	cmp r2, 0x7
	bls _0804207E
	b _08042372
_0804207E:
	lsls r0, r2, 2
	ldr r1, _08042088 @ =_0804208C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08042088: .4byte _0804208C
	.align 2, 0
_0804208C:
	.4byte _080420AC
	.4byte _080420AC
	.4byte _080420AC
	.4byte _080420AC
	.4byte _08042130
	.4byte _08042204
	.4byte _0804225E
	.4byte _080422B4
_080420AC:
	mov r0, r8
	bl sub_8043A40
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _080420F4 @ =0x000001fd
	cmp r5, r0
	bls _080420C0
	bl _080415A8
_080420C0:
	ldr r0, _080420F8 @ =gUnknown_825DFEA
	ldr r4, [sp, 0x28]
	adds r4, 0x2
	adds r0, r4, r0
	ldrb r1, [r0]
	mov r0, r8
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	str r1, [sp]
	adds r2, r4, 0
	cmp r1, 0x63
	bls _080420DE
	b _08042372
_080420DE:
	ldr r3, [sp, 0x20]
	ldr r4, [sp, 0x24]
	adds r0, r3, r4
	ldrb r0, [r0]
	adds r1, r0
	cmp r1, 0x64
	bls _080420FC
	adds r0, 0x64
	subs r4, r0, r1
	b _080420FE
	.align 2, 0
_080420F4: .4byte 0x000001fd
_080420F8: .4byte gUnknown_825DFEA
_080420FC:
	adds r4, r0, 0
_080420FE:
	adds r1, r5, r4
	movs r0, 0xFF
	lsls r0, 1
	cmp r1, r0
	bls _0804210C
	adds r0, r4, r0
	subs r4, r0, r1
_0804210C:
	ldr r0, [sp]
	adds r0, r4
	str r0, [sp]
	ldr r0, _0804212C @ =gUnknown_825DFEA
	adds r0, r2, r0
	ldrb r1, [r0]
	mov r0, r8
	mov r2, sp
	bl sub_804037C
	mov r0, r8
	bl CalculateMonStats
	movs r5, 0
	str r5, [sp, 0x1C]
	b _08042368
	.align 2, 0
_0804212C: .4byte gUnknown_825DFEA
_08042130:
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	ldr r1, _080421F8 @ =gUnknown_825DEA1
	ldr r2, [sp, 0x10]
	adds r1, r2, r1
	ldrb r1, [r1]
	ands r0, r1
	lsls r1, r2, 1
	lsrs r0, r1
	str r0, [sp]
	cmp r0, 0x2
	bls _08042150
	b _08042372
_08042150:
	adds r5, r2, 0
	adds r5, 0xD
	mov r0, r8
	adds r1, r5, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	ldr r2, [sp, 0x10]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	ldr r1, _080421FC @ =gUnknown_825DEA5
	ldr r3, [sp, 0x10]
	adds r1, r3, r1
	ldrb r2, [r1]
	ands r2, r0
	str r2, [sp]
	ldr r0, _08042200 @ =gUnknown_825DEA9
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	adds r2, r0
	str r2, [sp]
	mov r0, r8
	movs r1, 0x15
	mov r2, sp
	bl sub_804037C
	mov r0, r8
	adds r1, r5, 0
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [sp]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, [sp, 0x10]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	subs r0, r4
	str r0, [sp]
	ldr r4, [sp, 0x10]
	adds r4, 0x11
	mov r0, r8
	adds r1, r4, 0
	movs r2, 0
	bl GetMonData
	ldr r1, [sp]
	adds r0, r1
	str r0, [sp]
	mov r0, r8
	adds r1, r4, 0
	mov r2, sp
	bl sub_804037C
	movs r4, 0
	str r4, [sp, 0x1C]
	b _08042372
	.align 2, 0
_080421F8: .4byte gUnknown_825DEA1
_080421FC: .4byte gUnknown_825DEA5
_08042200: .4byte gUnknown_825DEA9
_08042204:
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	cmp r0, 0x63
	bls _08042214
	b _08042368
_08042214:
	ldr r5, [sp, 0x1C]
	cmp r5, 0
	beq _0804221C
	b _08042368
_0804221C:
	ldr r0, [sp, 0x2C]
	cmp r0, 0
	beq _08042224
	b _08042368
_08042224:
	ldr r1, [sp, 0x20]
	ldr r2, [sp, 0x24]
	adds r0, r1, r2
	ldrb r0, [r0]
	str r0, [sp, 0x2C]
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	str r5, [sp, 0x4]
	ldr r3, [sp, 0x2C]
	lsls r4, r3, 24
	asrs r1, r4, 24
	cmp r1, 0
	ble _08042308
	ldr r0, [sp, 0x30]
	cmp r0, 0x1B
	bne _08042308
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r0, r5, r0
	str r0, [sp, 0x4]
	adds r2, r4, 0
	b _08042314
_0804225E:
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	cmp r0, 0x63
	bls _08042368
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	cmp r0, 0xC7
	bhi _08042368
	ldr r2, [sp, 0x1C]
	cmp r2, 0
	bne _08042368
	ldr r3, [sp, 0x2C]
	cmp r3, 0
	bne _08042368
	ldr r4, [sp, 0x20]
	ldr r5, [sp, 0x24]
	adds r0, r4, r5
	ldrb r0, [r0]
	str r0, [sp, 0x2C]
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	str r4, [sp, 0x4]
	ldr r0, [sp, 0x2C]
	lsls r5, r0, 24
	asrs r1, r5, 24
	cmp r1, 0
	ble _080422AE
	ldr r2, [sp, 0x30]
	cmp r2, 0x1B
	beq _080422F6
_080422AE:
	ldr r3, [sp, 0x2C]
	lsls r2, r3, 24
	b _0804230C
_080422B4:
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	cmp r0, 0xC7
	bls _08042368
	ldr r4, [sp, 0x1C]
	cmp r4, 0
	bne _08042368
	ldr r5, [sp, 0x2C]
	cmp r5, 0
	bne _08042368
	ldr r1, [sp, 0x20]
	ldr r2, [sp, 0x24]
	adds r0, r1, r2
	ldrb r0, [r0]
	str r0, [sp, 0x2C]
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	str r4, [sp, 0x4]
	ldr r3, [sp, 0x2C]
	lsls r5, r3, 24
	asrs r1, r5, 24
	cmp r1, 0
	ble _08042308
	ldr r0, [sp, 0x30]
	cmp r0, 0x1B
	bne _08042308
_080422F6:
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r0, r4, r0
	str r0, [sp, 0x4]
	adds r2, r5, 0
	b _08042314
_08042308:
	ldr r1, [sp, 0x2C]
	lsls r2, r1, 24
_0804230C:
	asrs r1, r2, 24
	ldr r0, [sp, 0x4]
	adds r0, r1
	str r0, [sp, 0x4]
_08042314:
	cmp r2, 0
	ble _0804234A
	mov r0, r8
	movs r1, 0x26
	movs r2, 0
	bl GetMonData
	cmp r0, 0xB
	bne _0804232C
	ldr r0, [sp, 0x4]
	adds r0, 0x1
	str r0, [sp, 0x4]
_0804232C:
	mov r0, r8
	movs r1, 0x23
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	bl sav1_map_get_name
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _0804234A
	ldr r0, [sp, 0x4]
	adds r0, 0x1
	str r0, [sp, 0x4]
_0804234A:
	ldr r0, [sp, 0x4]
	cmp r0, 0
	bge _08042354
	movs r0, 0
	str r0, [sp, 0x4]
_08042354:
	ldr r0, [sp, 0x4]
	cmp r0, 0xFF
	ble _0804235E
	movs r0, 0xFF
	str r0, [sp, 0x4]
_0804235E:
	add r2, sp, 0x4
	mov r0, r8
	movs r1, 0x20
	bl sub_804037C
_08042368:
	ldr r0, [sp, 0x24]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x24]
_08042372:
	ldr r2, [sp, 0x28]
	adds r2, 0x1
	str r2, [sp, 0x28]
	mov r3, r10
	lsrs r3, 1
	mov r10, r3
	cmp r3, 0
	beq _08042384
	b _0804206A
_08042384:
	ldr r4, [sp, 0x18]
	adds r4, 0x1
	str r4, [sp, 0x18]
	cmp r4, 0x5
	bgt _08042392
	bl _080415B4
_08042392:
	ldr r0, [sp, 0x1C]
_08042394:
	add sp, 0x3C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80413E4

	.align 2, 0 @ Don't pad with nop.
