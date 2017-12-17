	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start ShouldSwitchIfPerishSong
ShouldSwitchIfPerishSong: @ 8039188
	push {lr}
	ldr r1, _080391D4 @ =gUnknown_2023DFC
	ldr r0, _080391D8 @ =gUnknown_2023BC4
	ldrb r2, [r0]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080391E4
	ldr r0, _080391DC @ =gUnknown_2023E0C
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xF]
	lsls r0, 28
	cmp r0, 0
	bne _080391E4
	adds r0, r2, 0
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 25
	ldr r1, _080391E0 @ =gUnknown_2023FE8
	ldr r1, [r1]
	adds r0, r1
	adds r0, 0x92
	movs r1, 0x6
	strb r1, [r0]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0
	bl EmitTwoReturnValues
	movs r0, 0x1
	b _080391E6
	.align 2, 0
_080391D4: .4byte gUnknown_2023DFC
_080391D8: .4byte gUnknown_2023BC4
_080391DC: .4byte gUnknown_2023E0C
_080391E0: .4byte gUnknown_2023FE8
_080391E4:
	movs r0, 0
_080391E6:
	pop {r1}
	bx r1
	thumb_func_end ShouldSwitchIfPerishSong

	thumb_func_start sub_80391EC
sub_80391EC: @ 80391EC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _08039204 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08039234
	b _0803935C
	.align 2, 0
_08039204: .4byte gUnknown_2022B4C
_08039208:
	ldr r0, _0803922C @ =gUnknown_2023BC4
	ldrb r0, [r0]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 25
	ldr r1, _08039230 @ =gUnknown_2023FE8
	ldr r1, [r1]
	adds r0, r1
	adds r0, 0x92
	strb r6, [r0]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0
	bl EmitTwoReturnValues
	movs r0, 0x1
	b _0803935E
	.align 2, 0
_0803922C: .4byte gUnknown_2023BC4
_08039230: .4byte gUnknown_2023FE8
_08039234:
	ldr r4, _0803936C @ =gUnknown_2023BE4
	movs r0, 0
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x58
	muls r0, r1
	adds r0, r4
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x19
	beq _08039250
	b _0803935C
_08039250:
	movs r0, 0
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r2, r0, 24
	movs r6, 0
	adds r7, r4, 0
	movs r5, 0x58
	adds r0, r2, 0
	muls r0, r5
	adds r4, r0, r7
	movs r0, 0x20
	adds r0, r4
	mov r8, r0
_0803926C:
	lsls r1, r6, 1
	ldr r0, _08039370 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	muls r0, r5
	adds r1, r0
	adds r0, r7, 0
	adds r0, 0xC
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _08039298
	ldrh r1, [r4]
	mov r3, r8
	ldrb r2, [r3]
	bl AI_TypeCalc
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0x2
	ands r1, r0
	cmp r1, 0
	bne _0803935C
_08039298:
	adds r6, 0x1
	cmp r6, 0x3
	ble _0803926C
	movs r6, 0
	ldr r0, _08039374 @ =gUnknown_202402C
	mov r9, r0
_080392A4:
	movs r0, 0x64
	adds r5, r6, 0
	muls r5, r0
	mov r3, r9
	adds r4, r5, r3
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08039356
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _08039356
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _08039356
	ldr r1, _08039378 @ =gUnknown_2023BCE
	ldr r0, _08039370 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	beq _08039356
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	adds r0, r4, 0
	movs r1, 0x2E
	bl GetMonData
	movs r0, 0
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r2, r0, 24
	movs r4, 0
	mov r8, r5
	ldr r1, _0803936C @ =gUnknown_2023BE4
	movs r0, 0x58
	muls r0, r2
	adds r5, r0, r1
	adds r7, r5, 0
	adds r7, 0x20
_08039310:
	adds r1, r4, 0
	adds r1, 0xD
	mov r0, r8
	add r0, r9
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _08039350
	ldrh r1, [r5]
	ldrb r2, [r7]
	bl AI_TypeCalc
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0x2
	ands r1, r0
	cmp r1, 0
	beq _08039350
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _08039350
	b _08039208
_08039350:
	adds r4, 0x1
	cmp r4, 0x3
	ble _08039310
_08039356:
	adds r6, 0x1
	cmp r6, 0x5
	ble _080392A4
_0803935C:
	movs r0, 0
_0803935E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803936C: .4byte gUnknown_2023BE4
_08039370: .4byte gUnknown_2023BC4
_08039374: .4byte gUnknown_202402C
_08039378: .4byte gUnknown_2023BCE
	thumb_func_end sub_80391EC

	thumb_func_start sub_803937C
sub_803937C: @ 803937C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0x1
	bl sub_8039698
	lsls r0, 24
	cmp r0, 0
	beq _080393A8
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	beq _080393A8
	b _08039588
_080393A8:
	ldr r1, _08039410 @ =gUnknown_2023DA0
	ldr r5, _08039414 @ =gUnknown_2023BC4
	ldrb r3, [r5]
	lsls r0, r3, 1
	adds r4, r0, r1
	ldrh r1, [r4]
	cmp r1, 0
	bne _080393BA
	b _08039588
_080393BA:
	ldr r0, _08039418 @ =0x0000ffff
	cmp r1, r0
	bne _080393C2
	b _08039588
_080393C2:
	ldr r2, _0803941C @ =gUnknown_8250C04
	ldrh r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _080393D6
	b _08039588
_080393D6:
	ldr r0, _08039420 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08039442
	mov r8, r3
	mov r0, r8
	bl GetBankIdentity
	movs r4, 0x2
	eors r0, r4
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByIdentity
	ldr r1, _08039424 @ =gUnknown_2023D70
	ldrb r1, [r1]
	ldr r2, _08039428 @ =gUnknown_825E45C
	lsls r0, 24
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0803942C
	ldrb r7, [r5]
	b _08039446
	.align 2, 0
_08039410: .4byte gUnknown_2023DA0
_08039414: .4byte gUnknown_2023BC4
_08039418: .4byte 0x0000ffff
_0803941C: .4byte gUnknown_8250C04
_08039420: .4byte gUnknown_2022B4C
_08039424: .4byte gUnknown_2023D70
_08039428: .4byte gUnknown_825E45C
_0803942C:
	ldrb r0, [r5]
	bl GetBankIdentity
	eors r0, r4
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r7, r0, 24
	b _08039446
_08039442:
	adds r7, r3, 0
	mov r8, r7
_08039446:
	ldr r3, _08039468 @ =gUnknown_8250C04
	ldr r1, _0803946C @ =gUnknown_2023DA0
	ldr r2, _08039470 @ =gUnknown_2023BC4
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x2]
	adds r1, r2, 0
	cmp r0, 0xA
	bne _08039474
	movs r0, 0x12
	b _08039486
	.align 2, 0
_08039468: .4byte gUnknown_8250C04
_0803946C: .4byte gUnknown_2023DA0
_08039470: .4byte gUnknown_2023BC4
_08039474:
	cmp r0, 0xB
	bne _0803947E
	movs r2, 0xB
	mov r10, r2
	b _08039488
_0803947E:
	cmp r0, 0xD
	beq _08039484
	b _08039588
_08039484:
	movs r0, 0xA
_08039486:
	mov r10, r0
_08039488:
	ldr r2, _0803949C @ =gUnknown_2023BE4
	ldrb r1, [r1]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, r10
	bne _080394CC
	b _08039588
	.align 2, 0
_0803949C: .4byte gUnknown_2023BE4
_080394A0:
	ldr r0, _080394C4 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 25
	ldr r1, _080394C8 @ =gUnknown_2023FE8
	ldr r1, [r1]
	adds r0, r1
	adds r0, 0x92
	strb r6, [r0]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0
	bl EmitTwoReturnValues
	movs r0, 0x1
	b _0803958A
	.align 2, 0
_080394C4: .4byte gUnknown_2023BC4
_080394C8: .4byte gUnknown_2023FE8
_080394CC:
	movs r6, 0
	ldr r2, _08039558 @ =gUnknown_8254784
	mov r9, r2
_080394D2:
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _0803955C @ =gUnknown_202402C
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08039582
	adds r0, r5, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _08039582
	adds r0, r5, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _08039582
	ldr r1, _08039560 @ =gUnknown_2023BCE
	mov r2, r8
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	beq _08039582
	lsls r0, r7, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	beq _08039582
	ldr r0, _08039564 @ =gUnknown_2023FE8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r0, 0x5C
	ldrb r0, [r0]
	cmp r6, r0
	beq _08039582
	adds r0, r7, r1
	adds r0, 0x5C
	ldrb r0, [r0]
	cmp r6, r0
	beq _08039582
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r5, 0
	movs r1, 0x2E
	bl GetMonData
	cmp r0, 0
	beq _08039568
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	add r0, r9
	ldrb r0, [r0, 0x17]
	b _08039572
	.align 2, 0
_08039558: .4byte gUnknown_8254784
_0803955C: .4byte gUnknown_202402C
_08039560: .4byte gUnknown_2023BCE
_08039564: .4byte gUnknown_2023FE8
_08039568:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	add r0, r9
	ldrb r0, [r0, 0x16]
_08039572:
	cmp r10, r0
	bne _08039582
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	bne _080394A0
_08039582:
	adds r6, 0x1
	cmp r6, 0x5
	ble _080394D2
_08039588:
	movs r0, 0
_0803958A:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_803937C

	thumb_func_start sub_8039598
sub_8039598: @ 8039598
	push {r4,r5,lr}
	ldr r3, _080395F0 @ =gUnknown_2023BE4
	ldr r5, _080395F4 @ =gUnknown_2023BC4
	ldrb r4, [r5]
	movs r0, 0x58
	adds r2, r4, 0
	muls r2, r0
	adds r0, r3, 0
	adds r0, 0x4C
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _08039660
	adds r1, r2, r3
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1E
	bne _08039660
	ldrh r0, [r1, 0x2C]
	ldrh r1, [r1, 0x28]
	lsrs r0, 1
	cmp r1, r0
	bcc _08039660
	ldr r1, _080395F8 @ =gUnknown_2023DA0
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	cmp r1, 0
	beq _080395DE
	ldr r0, _080395FC @ =0x0000ffff
	cmp r1, r0
	bne _08039600
_080395DE:
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08039600
	ldrb r0, [r5]
	b _08039668
	.align 2, 0
_080395F0: .4byte gUnknown_2023BE4
_080395F4: .4byte gUnknown_2023BC4
_080395F8: .4byte gUnknown_2023DA0
_080395FC: .4byte 0x0000ffff
_08039600:
	ldr r2, _0803962C @ =gUnknown_8250C04
	ldr r1, _08039630 @ =gUnknown_2023DA0
	ldr r4, _08039634 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _08039638
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08039638
	ldrb r0, [r4]
	b _08039668
	.align 2, 0
_0803962C: .4byte gUnknown_8250C04
_08039630: .4byte gUnknown_2023DA0
_08039634: .4byte gUnknown_2023BC4
_08039638:
	movs r0, 0x8
	movs r1, 0x1
	bl sub_8039828
	lsls r0, 24
	cmp r0, 0
	bne _08039686
	movs r0, 0x4
	movs r1, 0x1
	bl sub_8039828
	lsls r0, 24
	cmp r0, 0
	bne _08039686
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	bne _08039664
_08039660:
	movs r0, 0
	b _08039688
_08039664:
	ldr r0, _08039690 @ =gUnknown_2023BC4
	ldrb r0, [r0]
_08039668:
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 25
	ldr r1, _08039694 @ =gUnknown_2023FE8
	ldr r1, [r1]
	adds r0, r1
	adds r0, 0x92
	movs r1, 0x6
	strb r1, [r0]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0
	bl EmitTwoReturnValues
_08039686:
	movs r0, 0x1
_08039688:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08039690: .4byte gUnknown_2023BC4
_08039694: .4byte gUnknown_2023FE8
	thumb_func_end sub_8039598

	thumb_func_start sub_8039698
sub_8039698: @ 8039698
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r0, 0
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _08039730 @ =gUnknown_2023D70
	ldrb r1, [r0]
	ldr r2, _08039734 @ =gUnknown_825E45C
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08039720
	movs r4, 0
	ldr r6, _08039738 @ =gUnknown_2023BE4
	movs r7, 0x58
	adds r0, r3, 0
	muls r0, r7
	adds r5, r0, r6
	movs r0, 0x20
	adds r0, r5
	mov r9, r0
_080396D4:
	lsls r1, r4, 1
	ldr r0, _0803973C @ =gUnknown_2023BC4
	ldrb r0, [r0]
	muls r0, r7
	adds r1, r0
	adds r0, r6, 0
	adds r0, 0xC
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _0803971A
	ldrh r1, [r5]
	mov r3, r9
	ldrb r2, [r3]
	bl AI_TypeCalc
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0x2
	ands r1, r0
	cmp r1, 0
	beq _0803971A
	mov r0, r8
	cmp r0, 0
	bne _08039744
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	bne _08039744
_0803971A:
	adds r4, 0x1
	cmp r4, 0x3
	ble _080396D4
_08039720:
	ldr r0, _08039740 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08039748
	b _080397C2
	.align 2, 0
_08039730: .4byte gUnknown_2023D70
_08039734: .4byte gUnknown_825E45C
_08039738: .4byte gUnknown_2023BE4
_0803973C: .4byte gUnknown_2023BC4
_08039740: .4byte gUnknown_2022B4C
_08039744:
	movs r0, 0x1
	b _080397C4
_08039748:
	movs r0, 0x2
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _080397D0 @ =gUnknown_2023D70
	ldrb r1, [r0]
	ldr r2, _080397D4 @ =gUnknown_825E45C
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080397C2
	movs r4, 0
	ldr r6, _080397D8 @ =gUnknown_2023BE4
	movs r7, 0x58
	adds r0, r3, 0
	muls r0, r7
	adds r5, r0, r6
	movs r3, 0x20
	adds r3, r5
	mov r9, r3
_08039776:
	lsls r1, r4, 1
	ldr r0, _080397DC @ =gUnknown_2023BC4
	ldrb r0, [r0]
	muls r0, r7
	adds r1, r0
	adds r0, r6, 0
	adds r0, 0xC
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _080397BC
	ldrh r1, [r5]
	mov r3, r9
	ldrb r2, [r3]
	bl AI_TypeCalc
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0x2
	ands r1, r0
	cmp r1, 0
	beq _080397BC
	mov r0, r8
	cmp r0, 0
	bne _08039744
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	bne _08039744
_080397BC:
	adds r4, 0x1
	cmp r4, 0x3
	ble _08039776
_080397C2:
	movs r0, 0
_080397C4:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080397D0: .4byte gUnknown_2023D70
_080397D4: .4byte gUnknown_825E45C
_080397D8: .4byte gUnknown_2023BE4
_080397DC: .4byte gUnknown_2023BC4
	thumb_func_end sub_8039698

	thumb_func_start sub_80397E0
sub_80397E0: @ 80397E0
	push {r4,lr}
	movs r4, 0
	ldr r1, _08039820 @ =gUnknown_2023BE4
	ldr r0, _08039824 @ =gUnknown_2023BC4
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x18
	adds r2, r0, r1
	movs r3, 0x7
_080397F4:
	ldrb r1, [r2]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, 0x6
	ble _0803980A
	subs r1, 0x6
	lsls r0, r4, 24
	asrs r0, 24
	adds r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
_0803980A:
	adds r2, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _080397F4
	movs r0, 0
	cmp r4, 0x3
	bls _0803981A
	movs r0, 0x1
_0803981A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08039820: .4byte gUnknown_2023BE4
_08039824: .4byte gUnknown_2023BC4
	thumb_func_end sub_80397E0

	thumb_func_start sub_8039828
sub_8039828: @ 8039828
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x4]
	ldr r1, _080398B4 @ =gUnknown_2023DA0
	ldr r5, _080398B8 @ =gUnknown_2023BC4
	ldrb r3, [r5]
	lsls r0, r3, 1
	adds r4, r0, r1
	ldrh r1, [r4]
	cmp r1, 0
	bne _08039852
	b _08039A54
_08039852:
	ldr r0, _080398BC @ =0x0000ffff
	cmp r1, r0
	bne _0803985A
	b _08039A54
_0803985A:
	ldr r0, _080398C0 @ =gUnknown_2023DC0
	adds r0, r3, r0
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08039866
	b _08039A54
_08039866:
	ldr r2, _080398C4 @ =gUnknown_8250C04
	ldrh r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _0803987A
	b _08039A54
_0803987A:
	ldr r0, _080398C8 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08039918
	mov r9, r3
	mov r0, r9
	bl GetBankIdentity
	movs r4, 0x2
	eors r0, r4
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByIdentity
	ldr r1, _080398CC @ =gUnknown_2023D70
	ldrb r1, [r1]
	ldr r2, _080398D0 @ =gUnknown_825E45C
	lsls r0, 24
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _080398D4
	ldrb r5, [r5]
	mov r10, r5
	b _0803991C
	.align 2, 0
_080398B4: .4byte gUnknown_2023DA0
_080398B8: .4byte gUnknown_2023BC4
_080398BC: .4byte 0x0000ffff
_080398C0: .4byte gUnknown_2023DC0
_080398C4: .4byte gUnknown_8250C04
_080398C8: .4byte gUnknown_2022B4C
_080398CC: .4byte gUnknown_2023D70
_080398D0: .4byte gUnknown_825E45C
_080398D4:
	ldrb r0, [r5]
	bl GetBankIdentity
	eors r0, r4
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	b _0803991C
_080398EC:
	ldr r0, _08039910 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 25
	ldr r1, _08039914 @ =gUnknown_2023FE8
	ldr r1, [r1]
	adds r0, r1
	adds r0, 0x92
	strb r7, [r0]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0
	bl EmitTwoReturnValues
	movs r0, 0x1
	b _08039A56
	.align 2, 0
_08039910: .4byte gUnknown_2023BC4
_08039914: .4byte gUnknown_2023FE8
_08039918:
	mov r9, r3
	mov r10, r9
_0803991C:
	movs r7, 0
_0803991E:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _080399B0 @ =gUnknown_202402C
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _08039936
	b _08039A4C
_08039936:
	adds r0, r5, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	bne _08039944
	b _08039A4C
_08039944:
	adds r0, r5, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _08039A4C
	ldr r1, _080399B4 @ =gUnknown_2023BCE
	mov r2, r9
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r7, r0
	beq _08039A4C
	mov r2, r10
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r7, r0
	beq _08039A4C
	ldr r0, _080399B8 @ =gUnknown_2023FE8
	ldr r1, [r0]
	mov r2, r9
	adds r0, r2, r1
	adds r0, 0x5C
	ldrb r0, [r0]
	cmp r7, r0
	beq _08039A4C
	mov r2, r10
	adds r0, r2, r1
	adds r0, 0x5C
	ldrb r0, [r0]
	cmp r7, r0
	beq _08039A4C
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r5, 0
	movs r1, 0x2E
	bl GetMonData
	cmp r0, 0
	beq _080399C0
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	ldr r1, _080399BC @ =gUnknown_8254784
	adds r0, r1
	ldrb r2, [r0, 0x17]
	b _080399CC
	.align 2, 0
_080399B0: .4byte gUnknown_202402C
_080399B4: .4byte gUnknown_2023BCE
_080399B8: .4byte gUnknown_2023FE8
_080399BC: .4byte gUnknown_8254784
_080399C0:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	ldr r2, _08039A68 @ =gUnknown_8254784
	adds r0, r2
	ldrb r2, [r0, 0x16]
_080399CC:
	ldr r1, _08039A6C @ =gUnknown_2023DA0
	ldr r5, _08039A70 @ =gUnknown_2023BC4
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	adds r1, r4, 0
	bl AI_TypeCalc
	ldr r1, [sp]
	ands r1, r0
	cmp r1, 0
	beq _08039A4C
	ldr r1, _08039A74 @ =gUnknown_2023DC0
	ldrb r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	mov r9, r0
	movs r4, 0
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	mov r8, r1
	ldr r1, _08039A78 @ =gUnknown_2023BE4
	movs r0, 0x58
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	adds r5, r0, r1
	adds r6, r5, 0
	adds r6, 0x20
_08039A0A:
	ldr r0, _08039A7C @ =gUnknown_202402C
	adds r1, r4, 0
	adds r1, 0xD
	add r0, r8
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _08039A46
	ldrh r1, [r5]
	ldrb r2, [r6]
	bl AI_TypeCalc
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0x2
	ands r1, r0
	cmp r1, 0
	beq _08039A46
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [sp, 0x4]
	bl __modsi3
	cmp r0, 0
	bne _08039A46
	b _080398EC
_08039A46:
	adds r4, 0x1
	cmp r4, 0x3
	ble _08039A0A
_08039A4C:
	adds r7, 0x1
	cmp r7, 0x5
	bgt _08039A54
	b _0803991E
_08039A54:
	movs r0, 0
_08039A56:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08039A68: .4byte gUnknown_8254784
_08039A6C: .4byte gUnknown_2023DA0
_08039A70: .4byte gUnknown_2023BC4
_08039A74: .4byte gUnknown_2023DC0
_08039A78: .4byte gUnknown_2023BE4
_08039A7C: .4byte gUnknown_202402C
	thumb_func_end sub_8039828

	thumb_func_start sub_8039A80
sub_8039A80: @ 8039A80
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r6, _08039B5C @ =gUnknown_2023BE4
	ldr r4, _08039B60 @ =gUnknown_2023BC4
	ldrb r2, [r4]
	movs r5, 0x58
	adds r0, r2, 0
	muls r0, r5
	adds r1, r6, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08039B64 @ =0x0400e000
	ands r0, r1
	cmp r0, 0
	beq _08039AA6
	b _08039C74
_08039AA6:
	ldr r0, _08039B68 @ =gUnknown_2023DFC
	lsls r1, r2, 2
	adds r1, r0
	ldr r1, [r1]
	movs r0, 0x80
	lsls r0, 3
	ands r1, r0
	cmp r1, 0
	beq _08039ABA
	b _08039C74
_08039ABA:
	str r1, [sp]
	movs r0, 0xC
	adds r1, r2, 0
	movs r2, 0x17
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08039AD2
	b _08039C74
_08039AD2:
	ldrb r1, [r4]
	str r0, [sp]
	movs r0, 0xC
	movs r2, 0x47
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08039AEA
	b _08039C74
_08039AEA:
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0x2A
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	cmp r0, 0
	beq _08039B1C
	ldrb r0, [r4]
	muls r0, r5
	adds r1, r0, r6
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x8
	bne _08039B10
	b _08039C74
_08039B10:
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x8
	bne _08039B1C
	b _08039C74
_08039B1C:
	movs r0, 0
	mov r8, r0
	ldr r0, _08039B6C @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08039B8E
	ldr r4, _08039B60 @ =gUnknown_2023BC4
	ldrb r7, [r4]
	adds r0, r7, 0
	bl GetBankIdentity
	movs r5, 0x2
	eors r0, r5
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByIdentity
	ldr r1, _08039B70 @ =gUnknown_2023D70
	ldrb r1, [r1]
	ldr r2, _08039B74 @ =gUnknown_825E45C
	lsls r0, 24
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08039B78
	ldrb r6, [r4]
	b _08039B94
	.align 2, 0
_08039B5C: .4byte gUnknown_2023BE4
_08039B60: .4byte gUnknown_2023BC4
_08039B64: .4byte 0x0400e000
_08039B68: .4byte gUnknown_2023DFC
_08039B6C: .4byte gUnknown_2022B4C
_08039B70: .4byte gUnknown_2023D70
_08039B74: .4byte gUnknown_825E45C
_08039B78:
	ldrb r0, [r4]
	bl GetBankIdentity
	eors r0, r5
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r6, r0, 24
	b _08039B94
_08039B8E:
	ldr r0, _08039C64 @ =gUnknown_2023BC4
	ldrb r6, [r0]
	adds r7, r6, 0
_08039B94:
	movs r5, 0
_08039B96:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08039C68 @ =gUnknown_202402C
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08039BFA
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _08039BFA
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _08039BFA
	ldr r1, _08039C6C @ =gUnknown_2023BCE
	lsls r0, r7, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r5, r0
	beq _08039BFA
	lsls r0, r6, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r5, r0
	beq _08039BFA
	ldr r0, _08039C70 @ =gUnknown_2023FE8
	ldr r1, [r0]
	adds r0, r7, r1
	adds r0, 0x5C
	ldrb r0, [r0]
	cmp r5, r0
	beq _08039BFA
	adds r0, r6, r1
	adds r0, 0x5C
	ldrb r0, [r0]
	cmp r5, r0
	beq _08039BFA
	movs r0, 0x1
	add r8, r0
_08039BFA:
	adds r5, 0x1
	cmp r5, 0x5
	ble _08039B96
	mov r0, r8
	cmp r0, 0
	beq _08039C74
	bl ShouldSwitchIfPerishSong
	lsls r0, 24
	cmp r0, 0
	bne _08039C60
	bl sub_80391EC
	lsls r0, 24
	cmp r0, 0
	bne _08039C60
	bl sub_803937C
	lsls r0, 24
	cmp r0, 0
	bne _08039C60
	bl sub_8039598
	lsls r0, 24
	cmp r0, 0
	bne _08039C60
	movs r0, 0
	bl sub_8039698
	lsls r0, 24
	cmp r0, 0
	bne _08039C74
	bl sub_80397E0
	lsls r0, 24
	cmp r0, 0
	bne _08039C74
	movs r0, 0x8
	movs r1, 0x2
	bl sub_8039828
	lsls r0, 24
	cmp r0, 0
	bne _08039C60
	movs r0, 0x4
	movs r1, 0x3
	bl sub_8039828
	lsls r0, 24
	cmp r0, 0
	beq _08039C74
_08039C60:
	movs r0, 0x1
	b _08039C76
	.align 2, 0
_08039C64: .4byte gUnknown_2023BC4
_08039C68: .4byte gUnknown_202402C
_08039C6C: .4byte gUnknown_2023BCE
_08039C70: .4byte gUnknown_2023FE8
_08039C74:
	movs r0, 0
_08039C76:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8039A80

	thumb_func_start sub_8039C84
sub_8039C84: @ 8039C84
	push {r4-r6,lr}
	ldr r5, _08039CDC @ =gUnknown_2022B4C
	ldr r0, [r5]
	movs r1, 0x8
	ands r0, r1
	cmp r0, 0
	bne _08039C94
	b _08039D96
_08039C94:
	bl sub_8039A80
	lsls r0, 24
	cmp r0, 0
	beq _08039D8C
	ldr r0, _08039CE0 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 25
	ldr r1, _08039CE4 @ =gUnknown_2023FE8
	ldr r1, [r1]
	adds r0, r1
	adds r0, 0x92
	ldrb r0, [r0]
	cmp r0, 0x6
	bne _08039D5A
	bl sub_8039E3C
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	bne _08039D44
	ldr r0, [r5]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08039CE8
	movs r0, 0x1
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	b _08039CFC
	.align 2, 0
_08039CDC: .4byte gUnknown_2022B4C
_08039CE0: .4byte gUnknown_2023BC4
_08039CE4: .4byte gUnknown_2023FE8
_08039CE8:
	movs r0, 0x1
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0x3
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r5, r0, 24
_08039CFC:
	movs r4, 0
_08039CFE:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _08039D7C @ =gUnknown_202402C
	adds r0, r1
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08039D3E
	ldr r1, _08039D80 @ =gUnknown_2023BCE
	lsls r0, r6, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	beq _08039D3E
	lsls r0, r5, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	beq _08039D3E
	ldr r0, _08039D84 @ =gUnknown_2023FE8
	ldr r1, [r0]
	adds r0, r6, r1
	adds r0, 0x5C
	ldrb r0, [r0]
	cmp r4, r0
	beq _08039D3E
	adds r0, r5, r1
	adds r0, 0x5C
	ldrb r0, [r0]
	cmp r4, r0
	bne _08039D44
_08039D3E:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08039CFE
_08039D44:
	ldr r0, _08039D88 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 25
	ldr r1, _08039D84 @ =gUnknown_2023FE8
	ldr r1, [r1]
	adds r0, r1
	adds r0, 0x92
	strb r4, [r0]
_08039D5A:
	ldr r4, _08039D88 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	bl GetBankIdentity
	ldrb r2, [r4]
	ldr r1, _08039D84 @ =gUnknown_2023FE8
	ldr r1, [r1]
	adds r2, r1
	adds r2, 0x5C
	lsls r0, 24
	lsrs r0, 25
	adds r0, r1
	adds r0, 0x92
	ldrb r0, [r0]
	strb r0, [r2]
	b _08039DA8
	.align 2, 0
_08039D7C: .4byte gUnknown_202402C
_08039D80: .4byte gUnknown_2023BCE
_08039D84: .4byte gUnknown_2023FE8
_08039D88: .4byte gUnknown_2023BC4
_08039D8C:
	bl sub_803A1F4
	lsls r0, 24
	cmp r0, 0
	bne _08039DA8
_08039D96:
	ldr r0, _08039DB0 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	movs r2, 0x1
	eors r2, r0
	lsls r2, 8
	movs r0, 0x1
	movs r1, 0
	bl EmitTwoReturnValues
_08039DA8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08039DB0: .4byte gUnknown_2023BC4
	thumb_func_end sub_8039C84

	thumb_func_start sub_8039DB4
sub_8039DB4: @ 8039DB4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r6, r3, 0
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	movs r7, 0
	ldr r0, _08039E38 @ =gUnknown_824F050
	mov r10, r0
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _08039E26
	mov r5, r10
_08039DE2:
	ldrb r0, [r5]
	cmp r0, 0xFE
	beq _08039E18
	ldr r1, [sp]
	cmp r0, r1
	bne _08039E18
	ldrb r4, [r5, 0x1]
	cmp r4, r9
	bne _08039E02
	ldrb r1, [r6]
	ldrb r0, [r5, 0x2]
	muls r0, r1
	movs r1, 0xA
	bl __divsi3
	strb r0, [r6]
_08039E02:
	cmp r4, r8
	bne _08039E18
	cmp r9, r8
	beq _08039E18
	ldrb r1, [r6]
	ldrb r0, [r5, 0x2]
	muls r0, r1
	movs r1, 0xA
	bl __divsi3
	strb r0, [r6]
_08039E18:
	adds r5, 0x3
	adds r7, 0x3
	mov r1, r10
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08039DE2
_08039E26:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039E38: .4byte gUnknown_824F050
	thumb_func_end sub_8039DB4

	thumb_func_start sub_8039E3C
sub_8039E3C: @ 8039E3C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	ldr r4, _08039E98 @ =gUnknown_2023BC4
	ldrb r2, [r4]
	ldr r0, _08039E9C @ =gUnknown_2023FE8
	ldr r0, [r0]
	adds r0, r2, r0
	adds r1, r0, 0
	adds r1, 0x5C
	ldrb r0, [r1]
	cmp r0, 0x6
	beq _08039E5E
	b _0803A160
_08039E5E:
	ldr r0, _08039EA0 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08039EF8
	str r2, [sp, 0xC]
	adds r0, r2, 0
	bl GetBankIdentity
	movs r5, 0x2
	eors r0, r5
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByIdentity
	ldr r1, _08039EA4 @ =gUnknown_2023D70
	ldrb r1, [r1]
	ldr r2, _08039EA8 @ =gUnknown_825E45C
	lsls r0, 24
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08039EAC
	ldrb r4, [r4]
	str r4, [sp, 0x10]
	b _08039EC2
	.align 2, 0
_08039E98: .4byte gUnknown_2023BC4
_08039E9C: .4byte gUnknown_2023FE8
_08039EA0: .4byte gUnknown_2022B4C
_08039EA4: .4byte gUnknown_2023D70
_08039EA8: .4byte gUnknown_825E45C
_08039EAC:
	ldrb r0, [r4]
	bl GetBankIdentity
	eors r0, r5
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x10]
_08039EC2:
	bl Random
	movs r3, 0x2
	ands r0, r3
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _08039EF0 @ =gUnknown_2023D70
	ldrb r1, [r0]
	ldr r2, _08039EF4 @ =gUnknown_825E45C
	mov r4, r10
	lsls r0, r4, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08039F0A
	eors r4, r3
	lsls r0, r4, 24
	lsrs r0, 24
	mov r10, r0
	b _08039F0A
	.align 2, 0
_08039EF0: .4byte gUnknown_2023D70
_08039EF4: .4byte gUnknown_825E45C
_08039EF8:
	movs r0, 0
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldrb r4, [r4]
	str r4, [sp, 0x10]
	str r4, [sp, 0xC]
_08039F0A:
	movs r0, 0
	mov r9, r0
	mov r1, sp
	str r1, [sp, 0x14]
_08039F12:
	movs r2, 0
	str r2, [sp, 0x4]
	movs r4, 0x6
	str r4, [sp, 0x8]
	movs r7, 0
	ldr r0, _08039FD8 @ =gUnknown_825E45C
	mov r8, r0
_08039F20:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _08039FDC @ =gUnknown_202402C
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	beq _08039FF0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08039FF0
	mov r1, r8
	ldr r0, [r1]
	mov r2, r9
	ands r0, r2
	cmp r0, 0
	bne _08039FF0
	ldr r1, _08039FE0 @ =gUnknown_2023BCE
	ldr r4, [sp, 0xC]
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r7
	beq _08039FF0
	ldr r2, [sp, 0x10]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r7
	beq _08039FF0
	ldr r0, _08039FE4 @ =gUnknown_2023FE8
	ldr r1, [r0]
	adds r0, r4, r1
	adds r0, 0x5C
	ldrb r0, [r0]
	cmp r7, r0
	beq _08039FF0
	adds r0, r2, r1
	adds r0, 0x5C
	ldrb r0, [r0]
	cmp r7, r0
	beq _08039FF0
	ldr r1, _08039FE8 @ =gUnknown_8254784
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r5, [r0, 0x6]
	ldrb r6, [r0, 0x7]
	movs r0, 0xA
	ldr r4, [sp, 0x14]
	strb r0, [r4]
	movs r0, 0x58
	mov r4, r10
	muls r4, r0
	ldr r0, _08039FEC @ =gUnknown_2023BE4
	adds r4, r0
	adds r0, r4, 0
	adds r0, 0x21
	ldrb r0, [r0]
	adds r1, r5, 0
	adds r2, r6, 0
	mov r3, sp
	bl sub_8039DB4
	adds r4, 0x22
	ldrb r0, [r4]
	adds r1, r5, 0
	adds r2, r6, 0
	mov r3, sp
	bl sub_8039DB4
	ldr r2, [sp, 0x4]
	ldr r1, [sp, 0x14]
	ldrb r1, [r1]
	cmp r2, r1
	bcs _08039FFE
	ldr r2, [sp, 0x14]
	ldrb r2, [r2]
	str r2, [sp, 0x4]
	lsls r0, r7, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	b _08039FFE
	.align 2, 0
_08039FD8: .4byte gUnknown_825E45C
_08039FDC: .4byte gUnknown_202402C
_08039FE0: .4byte gUnknown_2023BCE
_08039FE4: .4byte gUnknown_2023FE8
_08039FE8: .4byte gUnknown_8254784
_08039FEC: .4byte gUnknown_2023BE4
_08039FF0:
	mov r4, r8
	ldr r0, [r4]
	mov r1, r9
	orrs r1, r0
	lsls r0, r1, 24
	lsrs r0, 24
	mov r9, r0
_08039FFE:
	movs r2, 0x4
	add r8, r2
	adds r7, 0x1
	cmp r7, 0x5
	ble _08039F20
	ldr r4, [sp, 0x8]
	cmp r4, 0x6
	beq _0803A06C
	movs r7, 0
	movs r0, 0x64
	adds r5, r4, 0
	muls r5, r0
	ldr r6, _0803A060 @ =gUnknown_202402C
_0803A018:
	adds r1, r7, 0
	adds r1, 0xD
	adds r0, r5, r6
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _0803A03E
	ldr r0, _0803A064 @ =gUnknown_2023BC4
	ldrb r1, [r0]
	adds r0, r4, 0
	mov r2, r10
	bl TypeCalc
	movs r1, 0x2
	ands r1, r0
	cmp r1, 0
	bne _0803A044
_0803A03E:
	adds r7, 0x1
	cmp r7, 0x3
	ble _0803A018
_0803A044:
	cmp r7, 0x4
	beq _0803A04A
	b _0803A15E
_0803A04A:
	ldr r1, [sp, 0x8]
	lsls r0, r1, 2
	ldr r2, _0803A068 @ =gUnknown_825E45C
	adds r0, r2
	ldr r0, [r0]
	mov r4, r9
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r0, 24
	b _0803A06E
	.align 2, 0
_0803A060: .4byte gUnknown_202402C
_0803A064: .4byte gUnknown_2023BC4
_0803A068: .4byte gUnknown_825E45C
_0803A06C:
	movs r0, 0x3F
_0803A06E:
	mov r9, r0
	mov r1, r9
	cmp r1, 0x3F
	beq _0803A078
	b _08039F12
_0803A078:
	ldr r0, _0803A170 @ =gUnknown_2023F50
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0803A174 @ =gUnknown_2023FE8
	ldr r0, [r0]
	strb r1, [r0, 0x13]
	ldr r0, _0803A178 @ =gUnknown_2023FC4
	movs r2, 0x1
	strb r2, [r0, 0xE]
	ldr r0, _0803A17C @ =gUnknown_2023DCC
	strb r1, [r0]
	ldr r0, _0803A180 @ =gUnknown_2023D71
	strb r2, [r0]
	movs r2, 0
	str r2, [sp, 0x4]
	movs r4, 0x6
	str r4, [sp, 0x8]
	movs r7, 0
_0803A09C:
	movs r0, 0x64
	adds r6, r7, 0
	muls r6, r0
	ldr r0, _0803A184 @ =gUnknown_202402C
	adds r4, r6, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	adds r1, r7, 0x1
	str r1, [sp, 0x18]
	cmp r0, 0
	beq _0803A158
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0803A158
	ldr r1, _0803A188 @ =gUnknown_2023BCE
	ldr r2, [sp, 0xC]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r7
	beq _0803A158
	ldr r4, [sp, 0x10]
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r7
	beq _0803A158
	ldr r0, _0803A174 @ =gUnknown_2023FE8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r0, 0x5C
	ldrb r0, [r0]
	cmp r7, r0
	beq _0803A158
	adds r0, r4, r1
	adds r0, 0x5C
	ldrb r0, [r0]
	cmp r7, r0
	beq _0803A158
	movs r5, 0
	mov r9, r6
	ldr r0, _0803A18C @ =gUnknown_2023D50
	mov r8, r0
	ldr r6, _0803A190 @ =gUnknown_2023BC4
_0803A100:
	adds r1, r5, 0
	adds r1, 0xD
	ldr r0, _0803A184 @ =gUnknown_202402C
	add r0, r9
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0
	mov r1, r8
	str r0, [r1]
	cmp r4, 0
	beq _0803A13C
	ldr r0, _0803A194 @ =gUnknown_8250C04
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0x1
	beq _0803A13C
	ldrb r0, [r6]
	mov r1, r10
	bl AI_CalcDmg
	ldrb r1, [r6]
	adds r0, r4, 0
	mov r2, r10
	bl TypeCalc
_0803A13C:
	mov r2, r8
	ldr r0, [r2]
	ldr r4, [sp, 0x4]
	cmp r4, r0
	bge _0803A152
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	lsls r0, r7, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
_0803A152:
	adds r5, 0x1
	cmp r5, 0x3
	ble _0803A100
_0803A158:
	ldr r7, [sp, 0x18]
	cmp r7, 0x5
	ble _0803A09C
_0803A15E:
	ldr r0, [sp, 0x8]
_0803A160:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803A170: .4byte gUnknown_2023F50
_0803A174: .4byte gUnknown_2023FE8
_0803A178: .4byte gUnknown_2023FC4
_0803A17C: .4byte gUnknown_2023DCC
_0803A180: .4byte gUnknown_2023D71
_0803A184: .4byte gUnknown_202402C
_0803A188: .4byte gUnknown_2023BCE
_0803A18C: .4byte gUnknown_2023D50
_0803A190: .4byte gUnknown_2023BC4
_0803A194: .4byte gUnknown_8250C04
	thumb_func_end sub_8039E3C

	thumb_func_start sub_803A198
sub_803A198: @ 803A198
	push {r4,lr}
	adds r2, r1, 0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bne _0803A1A8
	movs r0, 0x1
	b _0803A1EE
_0803A1A8:
	ldrb r1, [r2, 0x4]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0803A1B6
	movs r0, 0x2
	b _0803A1EE
_0803A1B6:
	ldrb r4, [r2, 0x3]
	movs r3, 0x3F
	adds r0, r3, 0
	ands r0, r4
	cmp r0, 0
	beq _0803A1C6
	movs r0, 0x3
	b _0803A1EE
_0803A1C6:
	ldrb r1, [r2]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _0803A1DC
	ldrb r0, [r2, 0x1]
	cmp r0, 0
	bne _0803A1DC
	ldrb r0, [r2, 0x2]
	cmp r0, 0
	beq _0803A1E0
_0803A1DC:
	movs r0, 0x4
	b _0803A1EE
_0803A1E0:
	movs r0, 0x80
	ands r0, r4
	cmp r0, 0
	bne _0803A1EC
	movs r0, 0x6
	b _0803A1EE
_0803A1EC:
	movs r0, 0x5
_0803A1EE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_803A198

	thumb_func_start sub_803A1F4
sub_803A1F4: @ 803A1F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r0, 0
	mov r10, r0
	movs r7, 0
	movs r1, 0
	mov r8, r1
_0803A20A:
	movs r0, 0x64
	mov r1, r8
	muls r1, r0
	ldr r0, _0803A2A8 @ =gUnknown_202402C
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0803A246
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _0803A246
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0803A246
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
_0803A246:
	movs r2, 0x1
	add r8, r2
	mov r0, r8
	cmp r0, 0x5
	ble _0803A20A
	movs r1, 0
	mov r8, r1
_0803A254:
	ldr r1, _0803A2AC @ =gUnknown_2023FF4
	mov r2, r8
	cmp r2, 0
	beq _0803A26E
	ldr r0, [r1]
	ldr r0, [r0, 0x18]
	adds r0, 0x2C
	ldrb r0, [r0]
	subs r0, r2
	adds r0, 0x1
	cmp r10, r0
	ble _0803A26E
	b _0803A644
_0803A26E:
	ldr r0, [r1]
	ldr r0, [r0, 0x18]
	mov r2, r8
	lsls r1, r2, 1
	adds r0, 0x24
	adds r0, r1
	ldrh r0, [r0]
	mov r9, r0
	str r1, [sp]
	cmp r0, 0
	bne _0803A286
	b _0803A644
_0803A286:
	ldr r1, _0803A2B0 @ =gUnknown_82528BC
	subs r0, 0xD
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	cmp r1, 0
	bne _0803A296
	b _0803A644
_0803A296:
	mov r0, r9
	cmp r0, 0xAF
	bne _0803A2BC
	ldr r0, _0803A2B4 @ =gUnknown_3005008
	ldr r0, [r0]
	ldr r1, _0803A2B8 @ =0x00003108
	adds r5, r0, r1
	b _0803A2BE
	.align 2, 0
_0803A2A8: .4byte gUnknown_202402C
_0803A2AC: .4byte gUnknown_2023FF4
_0803A2B0: .4byte gUnknown_82528BC
_0803A2B4: .4byte gUnknown_3005008
_0803A2B8: .4byte 0x00003108
_0803A2BC:
	adds r5, r1, 0
_0803A2BE:
	mov r2, r9
	lsls r0, r2, 24
	lsrs r0, 24
	adds r1, r5, 0
	bl sub_803A198
	ldr r4, _0803A2F8 @ =gUnknown_2023BC4
	ldrb r1, [r4]
	lsrs r1, 1
	ldr r3, _0803A2FC @ =gUnknown_2023FE8
	ldr r2, [r3]
	adds r1, r2
	adds r1, 0xC4
	strb r0, [r1]
	ldrb r0, [r4]
	lsrs r0, 1
	ldr r1, [r3]
	adds r0, r1
	adds r0, 0xC4
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r0, 0x5
	bls _0803A2EE
	b _0803A5F8
_0803A2EE:
	lsls r0, 2
	ldr r1, _0803A300 @ =_0803A304
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803A2F8: .4byte gUnknown_2023BC4
_0803A2FC: .4byte gUnknown_2023FE8
_0803A300: .4byte _0803A304
	.align 2, 0
_0803A304:
	.4byte _0803A31C
	.4byte _0803A348
	.4byte _0803A390
	.4byte _0803A4E8
	.4byte _0803A5C8
	.4byte _0803A650
_0803A31C:
	ldr r2, _0803A340 @ =gUnknown_2023BE4
	ldr r0, _0803A344 @ =gUnknown_2023BC4
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r1, [r0, 0x2C]
	ldrh r0, [r0, 0x28]
	lsrs r1, 2
	cmp r0, r1
	bcc _0803A334
	b _0803A5F8
_0803A334:
	cmp r0, 0
	bne _0803A33A
	b _0803A5F8
_0803A33A:
	movs r7, 0x1
	b _0803A5FC
	.align 2, 0
_0803A340: .4byte gUnknown_2023BE4
_0803A344: .4byte gUnknown_2023BC4
_0803A348:
	mov r0, r9
	movs r1, 0x4
	movs r2, 0x4
	bl GetItemEffectParamOffset
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0803A35C
	b _0803A5F8
_0803A35C:
	ldr r2, _0803A388 @ =gUnknown_2023BE4
	ldr r0, _0803A38C @ =gUnknown_2023BC4
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r1, r0, r2
	ldrh r2, [r1, 0x28]
	cmp r2, 0
	bne _0803A370
	b _0803A5F8
_0803A370:
	ldrh r3, [r1, 0x2C]
	lsrs r0, r3, 2
	cmp r2, r0
	bcc _0803A33A
	adds r0, r2, 0
	subs r0, r3, r0
	adds r1, r5, r4
	ldrb r1, [r1]
	cmp r0, r1
	bgt _0803A386
	b _0803A5F8
_0803A386:
	b _0803A33A
	.align 2, 0
_0803A388: .4byte gUnknown_2023BE4
_0803A38C: .4byte gUnknown_2023BC4
_0803A390:
	ldr r3, _0803A4DC @ =gUnknown_2023BC4
	ldrb r0, [r3]
	lsrs r0, 1
	ldr r2, _0803A4E0 @ =gUnknown_2023FE8
	ldr r1, [r2]
	adds r0, r1
	adds r0, 0xC6
	movs r1, 0
	strb r1, [r0]
	ldrb r1, [r5, 0x3]
	movs r6, 0x20
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0803A3D4
	ldr r1, _0803A4E4 @ =gUnknown_2023BE4
	ldrb r4, [r3]
	movs r0, 0x58
	muls r0, r4
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _0803A3D4
	lsrs r1, r4, 1
	ldr r0, [r2]
	adds r1, r0
	adds r1, 0xC6
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	movs r7, 0x1
_0803A3D4:
	ldrb r1, [r5, 0x3]
	movs r6, 0x10
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0803A40E
	ldr r1, _0803A4E4 @ =gUnknown_2023BE4
	ldrb r4, [r3]
	movs r0, 0x58
	muls r0, r4
	adds r1, 0x4C
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _0803A3FE
	movs r0, 0x80
	ands r1, r0
	cmp r1, 0
	beq _0803A40E
_0803A3FE:
	lsrs r1, r4, 1
	ldr r0, [r2]
	adds r1, r0
	adds r1, 0xC6
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	movs r7, 0x1
_0803A40E:
	ldrb r1, [r5, 0x3]
	movs r6, 0x8
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0803A440
	ldr r1, _0803A4E4 @ =gUnknown_2023BE4
	ldrb r4, [r3]
	movs r0, 0x58
	muls r0, r4
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0803A440
	lsrs r1, r4, 1
	ldr r0, [r2]
	adds r1, r0
	adds r1, 0xC6
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	movs r7, 0x1
_0803A440:
	ldrb r1, [r5, 0x3]
	movs r6, 0x4
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0803A472
	ldr r1, _0803A4E4 @ =gUnknown_2023BE4
	ldrb r4, [r3]
	movs r0, 0x58
	muls r0, r4
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0803A472
	lsrs r1, r4, 1
	ldr r0, [r2]
	adds r1, r0
	adds r1, 0xC6
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	movs r7, 0x1
_0803A472:
	ldrb r1, [r5, 0x3]
	movs r6, 0x2
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803A4A4
	ldr r1, _0803A4E4 @ =gUnknown_2023BE4
	ldrb r4, [r3]
	movs r0, 0x58
	muls r0, r4
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0803A4A4
	lsrs r1, r4, 1
	ldr r0, [r2]
	adds r1, r0
	adds r1, 0xC6
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	movs r7, 0x1
_0803A4A4:
	ldrb r1, [r5, 0x3]
	movs r4, 0x1
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0803A4B2
	b _0803A5F8
_0803A4B2:
	ldr r1, _0803A4E4 @ =gUnknown_2023BE4
	ldrb r3, [r3]
	movs r0, 0x58
	muls r0, r3
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0803A4CA
	b _0803A5F8
_0803A4CA:
	lsrs r1, r3, 1
	ldr r0, [r2]
	adds r1, r0
	adds r1, 0xC6
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	b _0803A33A
	.align 2, 0
_0803A4DC: .4byte gUnknown_2023BC4
_0803A4E0: .4byte gUnknown_2023FE8
_0803A4E4: .4byte gUnknown_2023BE4
_0803A4E8:
	ldr r4, _0803A5BC @ =gUnknown_2023BC4
	ldrb r0, [r4]
	lsrs r0, 1
	ldr r3, _0803A5C0 @ =gUnknown_2023FE8
	ldr r1, [r3]
	adds r0, r1
	adds r0, 0xC6
	movs r1, 0
	strb r1, [r0]
	ldr r1, _0803A5C4 @ =gUnknown_2023E0C
	ldrb r2, [r4]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x16]
	cmp r0, 0
	beq _0803A5F8
	ldrb r1, [r5]
	movs r6, 0xF
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	beq _0803A528
	lsrs r2, 1
	ldr r0, [r3]
	adds r2, r0
	adds r2, 0xC6
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_0803A528:
	ldrb r1, [r5, 0x1]
	movs r7, 0xF0
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _0803A546
	ldrb r0, [r4]
	lsrs r0, 1
	ldr r1, [r3]
	adds r0, r1
	adds r0, 0xC6
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
_0803A546:
	ldrb r1, [r5, 0x1]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	beq _0803A562
	ldrb r0, [r4]
	lsrs r0, 1
	ldr r1, [r3]
	adds r0, r1
	adds r0, 0xC6
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_0803A562:
	ldrb r1, [r5, 0x2]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	beq _0803A57E
	ldrb r0, [r4]
	lsrs r0, 1
	ldr r1, [r3]
	adds r0, r1
	adds r0, 0xC6
	ldrb r1, [r0]
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0]
_0803A57E:
	ldrb r1, [r5, 0x2]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _0803A59A
	ldrb r0, [r4]
	lsrs r0, 1
	ldr r1, [r3]
	adds r0, r1
	adds r0, 0xC6
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
_0803A59A:
	ldrb r1, [r5]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0
	bne _0803A5A6
	b _0803A33A
_0803A5A6:
	ldrb r0, [r4]
	lsrs r0, 1
	ldr r1, [r3]
	adds r0, r1
	adds r0, 0xC6
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	b _0803A33A
	.align 2, 0
_0803A5BC: .4byte gUnknown_2023BC4
_0803A5C0: .4byte gUnknown_2023FE8
_0803A5C4: .4byte gUnknown_2023E0C
_0803A5C8:
	ldr r4, _0803A630 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _0803A634 @ =gUnknown_2023E0C
	ldrb r1, [r4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x16]
	cmp r0, 0
	beq _0803A5F8
	ldr r0, _0803A638 @ =gUnknown_2023DE4
	lsls r1, r3, 1
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	bne _0803A5F8
	b _0803A33A
_0803A5F8:
	cmp r7, 0
	beq _0803A644
_0803A5FC:
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl EmitTwoReturnValues
	ldr r0, _0803A630 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsrs r0, 1
	ldr r1, _0803A63C @ =gUnknown_2023FE8
	ldr r1, [r1]
	lsls r0, 1
	adds r0, r1
	adds r0, 0xC0
	mov r1, r9
	strb r1, [r0]
	ldr r0, _0803A640 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x18]
	adds r0, 0x24
	ldr r2, [sp]
	adds r0, r2
	movs r1, 0
	strh r1, [r0]
	adds r0, r7, 0
	b _0803A652
	.align 2, 0
_0803A630: .4byte gUnknown_2023BC4
_0803A634: .4byte gUnknown_2023E0C
_0803A638: .4byte gUnknown_2023DE4
_0803A63C: .4byte gUnknown_2023FE8
_0803A640: .4byte gUnknown_2023FF4
_0803A644:
	movs r0, 0x1
	add r8, r0
	mov r1, r8
	cmp r1, 0x3
	bgt _0803A650
	b _0803A254
_0803A650:
	movs r0, 0
_0803A652:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_803A1F4

	.align 2, 0 @ Don't pad with nop.
