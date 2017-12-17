	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start Font0Func
Font0Func: @ 800537C
	push {lr}
	adds r2, r0, 0
	adds r3, r2, 0
	adds r3, 0x14
	ldrb r1, [r3, 0x1]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080053A0
	ldrb r1, [r2, 0x14]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x14]
	ldrb r0, [r3, 0x1]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r3, 0x1]
_080053A0:
	adds r0, r2, 0
	bl sub_8005790
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end Font0Func

	thumb_func_start Font1Func
Font1Func: @ 80053B0
	push {lr}
	adds r2, r0, 0
	adds r3, r2, 0
	adds r3, 0x14
	ldrb r1, [r3, 0x1]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080053D8
	ldrb r1, [r2, 0x14]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x14]
	ldrb r0, [r3, 0x1]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r3, 0x1]
_080053D8:
	adds r0, r2, 0
	bl sub_8005790
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end Font1Func

	thumb_func_start Font2Func
Font2Func: @ 80053E8
	push {lr}
	adds r2, r0, 0
	adds r3, r2, 0
	adds r3, 0x14
	ldrb r1, [r3, 0x1]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08005410
	ldrb r1, [r2, 0x14]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2, 0x14]
	ldrb r0, [r3, 0x1]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r3, 0x1]
_08005410:
	adds r0, r2, 0
	bl sub_8005790
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end Font2Func

	thumb_func_start Font3Func
Font3Func: @ 8005420
	push {lr}
	adds r2, r0, 0
	adds r3, r2, 0
	adds r3, 0x14
	ldrb r1, [r3, 0x1]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08005448
	ldrb r1, [r2, 0x14]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r2, 0x14]
	ldrb r0, [r3, 0x1]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r3, 0x1]
_08005448:
	adds r0, r2, 0
	bl sub_8005790
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end Font3Func

	thumb_func_start Font4Func
Font4Func: @ 8005458
	push {lr}
	adds r2, r0, 0
	adds r3, r2, 0
	adds r3, 0x14
	ldrb r1, [r3, 0x1]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08005480
	ldrb r1, [r2, 0x14]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x14]
	ldrb r0, [r3, 0x1]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r3, 0x1]
_08005480:
	adds r0, r2, 0
	bl sub_8005790
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end Font4Func

	thumb_func_start Font5Func
Font5Func: @ 8005490
	push {lr}
	adds r2, r0, 0
	adds r3, r2, 0
	adds r3, 0x14
	ldrb r1, [r3, 0x1]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080054B8
	ldrb r1, [r2, 0x14]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x5
	orrs r0, r1
	strb r0, [r2, 0x14]
	ldrb r0, [r3, 0x1]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r3, 0x1]
_080054B8:
	adds r0, r2, 0
	bl sub_8005790
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end Font5Func

	thumb_func_start TextPrinterInitDownArrowCounters
TextPrinterInitDownArrowCounters: @ 80054C8
	push {lr}
	adds r2, r0, 0
	adds r2, 0x14
	ldr r0, _080054E0 @ =gUnknown_3003E50
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080054E4
	movs r0, 0
	strb r0, [r2, 0x2]
	b _080054F4
	.align 2, 0
_080054E0: .4byte gUnknown_3003E50
_080054E4:
	ldrb r0, [r2, 0x1]
	movs r1, 0x61
	negs r1, r1
	ands r1, r0
	movs r0, 0x20
	negs r0, r0
	ands r1, r0
	strb r1, [r2, 0x1]
_080054F4:
	pop {r0}
	bx r0
	thumb_func_end TextPrinterInitDownArrowCounters

	thumb_func_start TextPrinterDrawDownArrow
TextPrinterDrawDownArrow: @ 80054F8
	push {r4-r7,lr}
	sub sp, 0x18
	adds r5, r0, 0
	adds r6, r5, 0
	adds r6, 0x14
	ldr r7, _0800552C @ =gUnknown_3003E50
	ldrb r1, [r7]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _080055C2
	ldrb r2, [r6, 0x1]
	movs r0, 0x1F
	ands r0, r2
	cmp r0, 0
	beq _08005530
	ldr r0, [r5, 0x14]
	lsls r0, 19
	lsrs r0, 27
	subs r0, 0x1
	movs r1, 0x1F
	ands r0, r1
	movs r1, 0x20
	negs r1, r1
	b _080055BC
	.align 2, 0
_0800552C: .4byte gUnknown_3003E50
_08005530:
	ldrb r0, [r5, 0x4]
	ldrb r2, [r5, 0xD]
	lsls r2, 28
	lsrs r1, r2, 4
	orrs r1, r2
	lsrs r1, 24
	ldrb r2, [r5, 0x8]
	ldrb r3, [r5, 0x9]
	movs r4, 0xA
	str r4, [sp]
	movs r4, 0xC
	str r4, [sp, 0x4]
	bl FillWindowPixelRect
	ldr r0, [r7]
	lsls r0, 30
	lsrs r0, 31
	cmp r0, 0
	beq _0800555A
	cmp r0, 0x1
	beq _08005564
_0800555A:
	ldr r3, _08005560 @ =gUnknown_81EA14C
	b _08005566
	.align 2, 0
_08005560: .4byte gUnknown_81EA14C
_08005564:
	ldr r3, _080055CC @ =gUnknown_81EA24C
_08005566:
	ldrb r0, [r5, 0x4]
	ldr r2, _080055D0 @ =gUnknown_81EA64C
	ldr r1, [r6]
	lsls r1, 17
	lsrs r1, 30
	adds r1, r2
	ldrb r2, [r1]
	movs r1, 0x80
	str r1, [sp]
	movs r1, 0x10
	str r1, [sp, 0x4]
	ldrb r1, [r5, 0x8]
	str r1, [sp, 0x8]
	ldrb r1, [r5, 0x9]
	str r1, [sp, 0xC]
	movs r1, 0xA
	str r1, [sp, 0x10]
	movs r1, 0xC
	str r1, [sp, 0x14]
	adds r1, r3, 0
	movs r3, 0
	bl BlitBitmapRectToWindow
	ldrb r0, [r5, 0x4]
	movs r1, 0x2
	bl CopyWindowToVram
	ldrb r0, [r6, 0x1]
	movs r1, 0x20
	negs r1, r1
	ands r1, r0
	movs r0, 0x8
	orrs r1, r0
	strb r1, [r6, 0x1]
	ldr r0, [r6]
	lsls r0, 17
	lsrs r0, 30
	adds r0, 0x1
	movs r2, 0x3
	ands r0, r2
	lsls r0, 5
	movs r2, 0x61
	negs r2, r2
_080055BC:
	ands r1, r2
	orrs r1, r0
	strb r1, [r6, 0x1]
_080055C2:
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080055CC: .4byte gUnknown_81EA24C
_080055D0: .4byte gUnknown_81EA64C
	thumb_func_end TextPrinterDrawDownArrow

	thumb_func_start sub_80055D4
sub_80055D4: @ 80055D4
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldrb r0, [r5, 0x4]
	ldrb r2, [r5, 0xD]
	lsls r2, 28
	lsrs r1, r2, 4
	orrs r1, r2
	lsrs r1, 24
	ldrb r2, [r5, 0x8]
	ldrb r3, [r5, 0x9]
	movs r4, 0xA
	str r4, [sp]
	movs r4, 0xC
	str r4, [sp, 0x4]
	bl FillWindowPixelRect
	ldrb r0, [r5, 0x4]
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80055D4

	thumb_func_start sub_8005608
sub_8005608: @ 8005608
	push {lr}
	adds r1, r0, 0
	adds r1, 0x14
	ldr r0, _08005628 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	movs r2, 0x78
	cmp r0, 0x2
	bne _0800561A
	movs r2, 0x32
_0800561A:
	ldrb r0, [r1, 0x2]
	cmp r0, r2
	beq _0800562C
	adds r0, 0x1
	strb r0, [r1, 0x2]
	movs r0, 0
	b _0800562E
	.align 2, 0
_08005628: .4byte gUnknown_203ADFA
_0800562C:
	movs r0, 0x1
_0800562E:
	pop {r1}
	bx r1
	thumb_func_end sub_8005608

	thumb_func_start TextPrinterWaitWithDownArrow
TextPrinterWaitWithDownArrow: @ 8005634
	push {r4,lr}
	adds r2, r0, 0
	movs r4, 0
	ldr r0, _08005654 @ =gUnknown_3003E50
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08005658
	adds r0, r2, 0
	bl sub_8005608
	lsls r0, 24
	lsrs r4, r0, 24
	b _08005672
	.align 2, 0
_08005654: .4byte gUnknown_3003E50
_08005658:
	adds r0, r2, 0
	bl TextPrinterDrawDownArrow
	ldr r0, _0800567C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08005672
	movs r4, 0x1
	movs r0, 0x5
	bl sub_80722CC
_08005672:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800567C: .4byte gMain
	thumb_func_end TextPrinterWaitWithDownArrow

	thumb_func_start TextPrinterWait
TextPrinterWait: @ 8005680
	push {r4,lr}
	adds r2, r0, 0
	movs r4, 0
	ldr r0, _080056A0 @ =gUnknown_3003E50
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080056A4
	adds r0, r2, 0
	bl sub_8005608
	lsls r0, 24
	lsrs r4, r0, 24
	b _080056B8
	.align 2, 0
_080056A0: .4byte gUnknown_3003E50
_080056A4:
	ldr r0, _080056C0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _080056B8
	movs r4, 0x1
	movs r0, 0x5
	bl sub_80722CC
_080056B8:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080056C0: .4byte gMain
	thumb_func_end TextPrinterWait

	thumb_func_start DrawDownArrow
DrawDownArrow: @ 80056C4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x18
	ldr r4, [sp, 0x34]
	ldr r5, [sp, 0x38]
	mov r8, r5
	ldr r5, [sp, 0x3C]
	mov r9, r5
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r6, r2, 16
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, 0
	beq _080056FA
	subs r0, 0x1
	strb r0, [r1]
	b _08005778
_080056FA:
	lsls r1, r3, 4
	orrs r1, r3
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0xA
	str r0, [sp]
	movs r0, 0xC
	str r0, [sp, 0x4]
	adds r0, r5, 0
	adds r2, r7, 0
	adds r3, r6, 0
	bl FillWindowPixelRect
	cmp r4, 0
	bne _08005778
	ldr r0, _0800572C @ =gUnknown_3003E50
	ldr r0, [r0]
	lsls r0, 30
	lsrs r0, 31
	cmp r0, 0
	beq _08005728
	cmp r0, 0x1
	beq _08005734
_08005728:
	ldr r3, _08005730 @ =gUnknown_81EA14C
	b _08005736
	.align 2, 0
_0800572C: .4byte gUnknown_3003E50
_08005730: .4byte gUnknown_81EA14C
_08005734:
	ldr r3, _08005788 @ =gUnknown_81EA24C
_08005736:
	ldr r2, _0800578C @ =gUnknown_81EA64C
	mov r0, r9
	ldrb r1, [r0]
	movs r0, 0x3
	ands r0, r1
	adds r0, r2
	ldrb r2, [r0]
	movs r0, 0x80
	str r0, [sp]
	movs r0, 0x10
	str r0, [sp, 0x4]
	str r7, [sp, 0x8]
	str r6, [sp, 0xC]
	movs r0, 0xA
	str r0, [sp, 0x10]
	movs r0, 0xC
	str r0, [sp, 0x14]
	adds r0, r5, 0
	adds r1, r3, 0
	movs r3, 0
	bl BlitBitmapRectToWindow
	adds r0, r5, 0
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x8
	mov r1, r8
	strb r0, [r1]
	mov r5, r9
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
_08005778:
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005788: .4byte gUnknown_81EA24C
_0800578C: .4byte gUnknown_81EA64C
	thumb_func_end DrawDownArrow

	thumb_func_start sub_8005790
sub_8005790: @ 8005790
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r6, 0
	adds r4, 0x14
	ldrb r0, [r6, 0x1C]
	cmp r0, 0x6
	bls _080057A0
	b _08005D68
_080057A0:
	lsls r0, 2
	ldr r1, _080057AC @ =_080057B0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080057AC: .4byte _080057B0
	.align 2, 0
_080057B0:
	.4byte _080057CC
	.4byte _08005C58
	.4byte _08005C6C
	.4byte _08005C98
	.4byte _08005CD0
	.4byte _08005D44
	.4byte _08005D56
_080057CC:
	ldr r2, _08005820 @ =gMain
	ldrh r1, [r2, 0x2C]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _080057E6
	ldrb r1, [r4]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080057E6
	movs r0, 0
	strb r0, [r6, 0x1E]
_080057E6:
	ldrb r1, [r6, 0x1E]
	cmp r1, 0
	beq _08005828
	ldrb r0, [r6, 0x1D]
	cmp r0, 0
	beq _08005828
	subs r0, r1, 0x1
	strb r0, [r6, 0x1E]
	ldr r0, _08005824 @ =gUnknown_3003E50
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08005804
	b _08005B30
_08005804:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08005810
	b _08005B30
_08005810:
	ldrb r0, [r4]
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0
	strb r0, [r6, 0x1E]
	b _08005B30
	.align 2, 0
_08005820: .4byte gMain
_08005824: .4byte gUnknown_3003E50
_08005828:
	ldr r2, _08005838 @ =gUnknown_3003E50
	ldrb r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0800583C
	movs r0, 0x1
	b _0800583E
	.align 2, 0
_08005838: .4byte gUnknown_3003E50
_0800583C:
	ldrb r0, [r6, 0x1D]
_0800583E:
	strb r0, [r6, 0x1E]
	ldr r0, [r6]
	ldrb r3, [r0]
	adds r0, 0x1
	str r0, [r6]
	adds r0, r3, 0
	subs r0, 0xF8
	cmp r0, 0x7
	bls _08005852
	b _08005B6C
_08005852:
	lsls r0, 2
	ldr r1, _0800585C @ =_08005860
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800585C: .4byte _08005860
	.align 2, 0
_08005860:
	.4byte _08005B46
	.4byte _08005B34
	.4byte _08005B26
	.4byte _08005B22
	.4byte _080058AC
	.4byte _080058A8
	.4byte _08005880
	.4byte _08005D68
_08005880:
	ldrb r0, [r6, 0x6]
	strb r0, [r6, 0x8]
	ldrb r1, [r6, 0x5]
	ldr r0, _080058A4 @ =gUnknown_3003D90
	ldr r2, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r6, 0xB]
	ldrb r0, [r0, 0x5]
	adds r1, r0
	ldrb r0, [r6, 0x9]
	adds r0, r1
	strb r0, [r6, 0x9]
_0800589E:
	movs r0, 0x2
	b _08005D6A
	.align 2, 0
_080058A4: .4byte gUnknown_3003D90
_080058A8:
	ldr r0, [r6]
	b _08005B0A
_080058AC:
	ldr r0, [r6]
	ldrb r3, [r0]
	adds r0, 0x1
	str r0, [r6]
	subs r0, r3, 0x1
	cmp r0, 0x17
	bls _080058BC
	b _08005B6C
_080058BC:
	lsls r0, 2
	ldr r1, _080058C8 @ =_080058CC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080058C8: .4byte _080058CC
	.align 2, 0
_080058CC:
	.4byte _0800592C
	.4byte _0800594E
	.4byte _08005972
	.4byte _0800598C
	.4byte _080059D8
	.4byte _080059DC
	.4byte _0800589E
	.4byte _080059F4
	.4byte _08005A04
	.4byte _08005A1A
	.4byte _08005A1E
	.4byte _08005A66
	.4byte _08005A70
	.4byte _08005A78
	.4byte _08005A84
	.4byte _08005A4C
	.4byte _08005AB0
	.4byte _08005ACC
	.4byte _08005ADC
	.4byte _08005B00
	.4byte _08005B10
	.4byte _08005B18
	.4byte _08005A96
	.4byte _08005AA4
_0800592C:
	ldr r2, [r6]
	ldrb r1, [r2]
	lsls r1, 4
	ldrb r3, [r6, 0xC]
	movs r0, 0xF
	ands r0, r3
	orrs r0, r1
	strb r0, [r6, 0xC]
	adds r2, 0x1
	str r2, [r6]
	lsls r0, 24
	lsrs r0, 28
	ldrb r2, [r6, 0xD]
	lsls r1, r2, 28
	lsrs r1, 28
	lsrs r2, 4
	b _080059D2
_0800594E:
	ldr r1, [r6]
	ldrb r2, [r1]
	movs r0, 0xF
	ands r0, r2
	ldrb r3, [r6, 0xD]
	movs r2, 0x10
	negs r2, r2
	ands r2, r3
	orrs r2, r0
	strb r2, [r6, 0xD]
	adds r1, 0x1
	str r1, [r6]
	ldrb r0, [r6, 0xC]
	lsrs r0, 4
	lsls r1, r2, 28
	lsrs r1, 28
	lsrs r2, 4
	b _080059D2
_08005972:
	ldr r1, [r6]
	ldrb r0, [r1]
	lsls r0, 4
	ldrb r3, [r6, 0xD]
	movs r2, 0xF
	ands r2, r3
	orrs r2, r0
	strb r2, [r6, 0xD]
	adds r1, 0x1
	str r1, [r6]
	ldrb r0, [r6, 0xC]
	lsrs r0, 4
	b _080059CA
_0800598C:
	ldr r3, [r6]
	ldrb r1, [r3]
	lsls r1, 4
	ldrb r4, [r6, 0xC]
	movs r2, 0xF
	adds r0, r2, 0
	ands r0, r4
	orrs r0, r1
	strb r0, [r6, 0xC]
	adds r5, r3, 0x1
	str r5, [r6]
	ldrb r3, [r3, 0x1]
	adds r1, r2, 0
	ands r1, r3
	ldrb r4, [r6, 0xD]
	movs r3, 0x10
	negs r3, r3
	ands r3, r4
	orrs r3, r1
	strb r3, [r6, 0xD]
	adds r4, r5, 0x1
	str r4, [r6]
	ldrb r1, [r5, 0x1]
	lsls r1, 4
	ands r2, r3
	orrs r2, r1
	strb r2, [r6, 0xD]
	adds r4, 0x1
	str r4, [r6]
	lsls r0, 24
	lsrs r0, 28
_080059CA:
	lsls r1, r2, 28
	lsrs r1, 28
	lsls r2, 24
	lsrs r2, 28
_080059D2:
	bl sub_8002EA8
	b _0800589E
_080059D8:
	ldr r0, [r6]
	b _08005B0A
_080059DC:
	ldr r0, [r6]
	ldrb r0, [r0]
	movs r1, 0xF
	ands r1, r0
	ldrb r2, [r4]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	ldr r0, [r6]
	b _08005B0A
_080059F4:
	ldr r0, [r6]
	ldrb r1, [r0]
	strb r1, [r6, 0x1E]
	adds r0, 0x1
	str r0, [r6]
	movs r0, 0x6
	strb r0, [r6, 0x1C]
	b _0800589E
_08005A04:
	movs r0, 0x1
	strb r0, [r6, 0x1C]
	ldrb r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _08005A14
	b _08005B30
_08005A14:
	movs r0, 0
	strb r0, [r4, 0x2]
	b _08005B30
_08005A1A:
	movs r0, 0x5
	b _08005D52
_08005A1E:
	ldr r0, [r6]
	ldrb r3, [r0]
	adds r1, r0, 0x1
	str r1, [r6]
	ldrb r0, [r0, 0x1]
	lsls r0, 8
	orrs r3, r0
	adds r1, 0x1
	str r1, [r6]
	ldr r0, _08005A48 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08005A40
	b _0800589E
_08005A40:
	adds r0, r3, 0
	bl PlayBGM
	b _0800589E
	.align 2, 0
_08005A48: .4byte gUnknown_203ADFA
_08005A4C:
	ldr r0, [r6]
	ldrb r3, [r0]
	adds r1, r0, 0x1
	str r1, [r6]
	ldrb r0, [r0, 0x1]
	lsls r0, 8
	orrs r3, r0
	adds r1, 0x1
	str r1, [r6]
	adds r0, r3, 0
	bl sub_80722CC
	b _0800589E
_08005A66:
	ldr r1, [r6]
	adds r0, r1, 0x1
	str r0, [r6]
	ldrb r3, [r1, 0x1]
	b _08005B6C
_08005A70:
	ldr r1, [r6]
	ldrb r0, [r1]
	ldrb r2, [r6, 0x6]
	b _08005AD2
_08005A78:
	ldr r1, [r6]
	ldrb r0, [r1]
	ldrb r3, [r6, 0x7]
	adds r0, r3
	strb r0, [r6, 0x9]
	b _08005AD6
_08005A84:
	ldrb r0, [r6, 0x4]
	ldrb r2, [r6, 0xD]
	lsls r2, 28
	lsrs r1, r2, 4
	orrs r1, r2
	lsrs r1, 24
	bl FillWindowPixelBuffer
	b _0800589E
_08005A96:
	ldr r0, _08005AA0 @ =gMPlay_BGM
	bl m4aMPlayStop
	b _0800589E
	.align 2, 0
_08005AA0: .4byte gMPlay_BGM
_08005AA4:
	ldr r0, _08005AAC @ =gMPlay_BGM
	bl m4aMPlayContinue
	b _0800589E
	.align 2, 0
_08005AAC: .4byte gMPlay_BGM
_08005AB0:
	ldr r0, [r6]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r6]
	cmp r4, 0
	bgt _08005ABE
	b _0800589E
_08005ABE:
	adds r0, r6, 0
	adds r1, r4, 0
	bl nullsub_5
	ldrb r0, [r6, 0x8]
	adds r0, r4
	b _08005C4E
_08005ACC:
	ldr r1, [r6]
	ldrb r0, [r6, 0x6]
	ldrb r2, [r1]
_08005AD2:
	adds r0, r2
	strb r0, [r6, 0x8]
_08005AD6:
	adds r1, 0x1
	str r1, [r6]
	b _0800589E
_08005ADC:
	ldr r0, [r6]
	ldrb r2, [r0]
	ldrb r1, [r6, 0x6]
	adds r2, r1
	adds r0, 0x1
	str r0, [r6]
	ldrb r0, [r6, 0x8]
	subs r4, r2, r0
	cmp r4, 0
	bgt _08005AF2
	b _0800589E
_08005AF2:
	adds r0, r6, 0
	adds r1, r4, 0
	bl nullsub_5
	ldrb r0, [r6, 0x8]
	adds r0, r4
	b _08005C4E
_08005B00:
	ldr r0, [r6]
	ldrb r2, [r0]
	adds r1, r6, 0
	adds r1, 0x20
	strb r2, [r1]
_08005B0A:
	adds r0, 0x1
	str r0, [r6]
	b _0800589E
_08005B10:
	adds r1, r6, 0
	adds r1, 0x21
	movs r0, 0x1
	b _08005B1E
_08005B18:
	adds r1, r6, 0
	adds r1, 0x21
	movs r0, 0
_08005B1E:
	strb r0, [r1]
	b _0800589E
_08005B22:
	movs r0, 0x2
	b _08005B28
_08005B26:
	movs r0, 0x3
_08005B28:
	strb r0, [r6, 0x1C]
	adds r0, r6, 0
	bl TextPrinterInitDownArrowCounters
_08005B30:
	movs r0, 0x3
	b _08005D6A
_08005B34:
	ldr r0, [r6]
	ldrb r3, [r0]
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	orrs r3, r1
	adds r0, 0x1
	str r0, [r6]
	b _08005B6C
_08005B46:
	ldr r0, [r6]
	ldrb r3, [r0]
	adds r0, 0x1
	str r0, [r6]
	ldrb r0, [r6, 0x4]
	adds r1, r3, 0
	ldrb r2, [r6, 0x8]
	ldrb r3, [r6, 0x9]
	bl DrawKeypadIcon
	ldr r1, _08005B68 @ =gUnknown_3003DA0
	adds r1, 0x80
	strb r0, [r1]
	ldrb r3, [r6, 0xA]
	adds r0, r3
	b _08005C4A
	.align 2, 0
_08005B68: .4byte gUnknown_3003DA0
_08005B6C:
	ldr r0, [r4]
	lsls r0, 28
	lsrs r0, 28
	cmp r0, 0x5
	bhi _08005BEE
	lsls r0, 2
	ldr r1, _08005B80 @ =_08005B84
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08005B80: .4byte _08005B84
	.align 2, 0
_08005B84:
	.4byte _08005B9C
	.4byte _08005BAA
	.4byte _08005BB8
	.4byte _08005BC6
	.4byte _08005BD4
	.4byte _08005BE2
_08005B9C:
	adds r0, r6, 0
	adds r0, 0x21
	ldrb r1, [r0]
	adds r0, r3, 0
	bl sub_8006448
	b _08005BEE
_08005BAA:
	adds r0, r6, 0
	adds r0, 0x21
	ldrb r1, [r0]
	adds r0, r3, 0
	bl sub_80064F0
	b _08005BEE
_08005BB8:
	adds r0, r6, 0
	adds r0, 0x21
	ldrb r1, [r0]
	adds r0, r3, 0
	bl sub_80065B8
	b _08005BEE
_08005BC6:
	adds r0, r6, 0
	adds r0, 0x21
	ldrb r1, [r0]
	adds r0, r3, 0
	bl sub_8006724
	b _08005BEE
_08005BD4:
	adds r0, r6, 0
	adds r0, 0x21
	ldrb r1, [r0]
	adds r0, r3, 0
	bl sub_80067EC
	b _08005BEE
_08005BE2:
	adds r0, r6, 0
	adds r0, 0x21
	ldrb r1, [r0]
	adds r0, r3, 0
	bl sub_8006958
_08005BEE:
	adds r0, r6, 0
	bl sub_8003014
	adds r2, r6, 0
	adds r2, 0x20
	ldrb r0, [r2]
	cmp r0, 0
	beq _08005C28
	ldr r1, _08005C24 @ =gUnknown_3003DA0
	adds r1, 0x80
	ldrb r0, [r1]
	ldrb r3, [r6, 0x8]
	adds r0, r3
	strb r0, [r6, 0x8]
	ldrb r2, [r2]
	ldrb r0, [r1]
	subs r4, r2, r0
	cmp r4, 0
	ble _08005C50
	adds r0, r6, 0
	adds r1, r4, 0
	bl nullsub_5
	ldrb r0, [r6, 0x8]
	adds r0, r4
	b _08005C4E
	.align 2, 0
_08005C24: .4byte gUnknown_3003DA0
_08005C28:
	adds r0, r6, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0
	beq _08005C44
	ldr r0, _08005C40 @ =gUnknown_3003DA0
	adds r0, 0x80
	ldrb r1, [r6, 0xA]
	ldrb r0, [r0]
	adds r1, r0
	ldrb r0, [r6, 0x8]
	b _08005C4C
	.align 2, 0
_08005C40: .4byte gUnknown_3003DA0
_08005C44:
	ldr r0, _08005C54 @ =gUnknown_3003DA0
	adds r0, 0x80
	ldrb r0, [r0]
_08005C4A:
	ldrb r1, [r6, 0x8]
_08005C4C:
	adds r0, r1
_08005C4E:
	strb r0, [r6, 0x8]
_08005C50:
	movs r0, 0
	b _08005D6A
	.align 2, 0
_08005C54: .4byte gUnknown_3003DA0
_08005C58:
	adds r0, r6, 0
	bl TextPrinterWait
	lsls r0, 16
	cmp r0, 0
	bne _08005C66
	b _08005B30
_08005C66:
	movs r0, 0
	strb r0, [r6, 0x1C]
	b _08005B30
_08005C6C:
	adds r0, r6, 0
	bl TextPrinterWaitWithDownArrow
	lsls r0, 16
	cmp r0, 0
	bne _08005C7A
	b _08005B30
_08005C7A:
	ldrb r0, [r6, 0x4]
	ldrb r2, [r6, 0xD]
	lsls r2, 28
	lsrs r1, r2, 4
	orrs r1, r2
	lsrs r1, 24
	bl FillWindowPixelBuffer
	ldrb r0, [r6, 0x6]
	movs r1, 0
	strb r0, [r6, 0x8]
	ldrb r0, [r6, 0x7]
	strb r0, [r6, 0x9]
	strb r1, [r6, 0x1C]
	b _08005B30
_08005C98:
	adds r0, r6, 0
	bl TextPrinterWaitWithDownArrow
	lsls r0, 16
	cmp r0, 0
	bne _08005CA6
	b _08005B30
_08005CA6:
	adds r0, r6, 0
	bl sub_80055D4
	ldrb r1, [r6, 0x5]
	ldr r0, _08005CCC @ =gUnknown_3003D90
	ldr r2, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r6, 0xB]
	ldrb r0, [r0, 0x5]
	adds r1, r0
	strb r1, [r6, 0x1F]
	ldrb r0, [r6, 0x6]
	strb r0, [r6, 0x8]
	movs r0, 0x4
	strb r0, [r6, 0x1C]
	b _08005B30
	.align 2, 0
_08005CCC: .4byte gUnknown_3003D90
_08005CD0:
	ldrb r2, [r6, 0x1F]
	cmp r2, 0
	beq _08005D40
	ldr r4, _08005D04 @ =gUnknown_81EA650
	ldr r5, _08005D08 @ =gSaveBlock2Ptr
	ldr r0, [r5]
	ldrb r0, [r0, 0x14]
	lsls r1, r0, 29
	lsrs r0, r1, 29
	adds r0, r4
	ldrb r0, [r0]
	cmp r2, r0
	bcs _08005D0C
	ldrb r0, [r6, 0x4]
	ldrb r1, [r6, 0xD]
	lsls r1, 28
	lsrs r3, r1, 4
	orrs r3, r1
	lsrs r3, 24
	movs r1, 0
	bl ScrollWindow
	movs r0, 0
	strb r0, [r6, 0x1F]
	b _08005D36
	.align 2, 0
_08005D04: .4byte gUnknown_81EA650
_08005D08: .4byte gSaveBlock2Ptr
_08005D0C:
	ldrb r0, [r6, 0x4]
	lsrs r1, 29
	adds r1, r4
	ldrb r2, [r1]
	ldrb r1, [r6, 0xD]
	lsls r1, 28
	lsrs r3, r1, 4
	orrs r3, r1
	lsrs r3, 24
	movs r1, 0
	bl ScrollWindow
	ldr r0, [r5]
	ldrb r0, [r0, 0x14]
	lsls r0, 29
	lsrs r0, 29
	adds r0, r4
	ldrb r1, [r6, 0x1F]
	ldrb r0, [r0]
	subs r1, r0
	strb r1, [r6, 0x1F]
_08005D36:
	ldrb r0, [r6, 0x4]
	movs r1, 0x2
	bl CopyWindowToVram
	b _08005B30
_08005D40:
	strb r2, [r6, 0x1C]
	b _08005B30
_08005D44:
	bl IsSEPlaying
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08005D52
	b _08005B30
_08005D52:
	strb r0, [r6, 0x1C]
	b _08005B30
_08005D56:
	ldrb r0, [r6, 0x1E]
	adds r1, r0, 0
	cmp r1, 0
	beq _08005D64
	subs r0, 0x1
	strb r0, [r6, 0x1E]
	b _08005B30
_08005D64:
	strb r1, [r6, 0x1C]
	b _08005B30
_08005D68:
	movs r0, 0x1
_08005D6A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8005790

	thumb_func_start GetStringWidthFixedWidthFont
GetStringWidthFixedWidthFont: @ 8005D70
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	movs r2, 0
	mov r1, sp
	adds r1, 0x7
_08005D88:
	strb r2, [r1]
	subs r1, 0x1
	cmp r1, sp
	bge _08005D88
	movs r5, 0
	movs r6, 0
	adds r4, r0, 0
	movs r2, 0
_08005D98:
	adds r0, r4, r2
	ldrb r3, [r0]
	adds r2, 0x1
	adds r0, r3, 0
	subs r0, 0xF7
	cmp r0, 0x8
	bhi _08005E66
	lsls r0, 2
	ldr r1, _08005DB0 @ =_08005DB4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08005DB0: .4byte _08005DB4
	.align 2, 0
_08005DB4:
	.4byte _08005E60
	.4byte _08005E64
	.4byte _08005E64
	.4byte _08005E6C
	.4byte _08005E6C
	.4byte _08005DE8
	.4byte _08005E60
	.4byte _08005DD8
	.4byte _08005DD8
_08005DD8:
	mov r1, sp
	adds r0, r1, r6
	strb r5, [r0]
	movs r5, 0
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	b _08005E6C
_08005DE8:
	adds r0, r4, r2
	ldrb r0, [r0]
	adds r2, 0x1
	subs r0, 0x1
	cmp r0, 0x15
	bhi _08005E6C
	lsls r0, 2
	ldr r1, _08005E00 @ =_08005E04
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08005E00: .4byte _08005E04
	.align 2, 0
_08005E04:
	.4byte _08005E60
	.4byte _08005E60
	.4byte _08005E60
	.4byte _08005E5C
	.4byte _08005E60
	.4byte _08005E60
	.4byte _08005E6C
	.4byte _08005E60
	.4byte _08005E6C
	.4byte _08005E6C
	.4byte _08005E5E
	.4byte _08005E60
	.4byte _08005E60
	.4byte _08005E60
	.4byte _08005E6C
	.4byte _08005E5E
	.4byte _08005E60
	.4byte _08005E60
	.4byte _08005E60
	.4byte _08005E60
	.4byte _08005E6C
	.4byte _08005E6C
_08005E5C:
	adds r2, 0x1
_08005E5E:
	adds r2, 0x1
_08005E60:
	adds r2, 0x1
	b _08005E6C
_08005E64:
	adds r2, 0x1
_08005E66:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08005E6C:
	cmp r3, 0xFF
	bne _08005D98
	movs r5, 0
	movs r2, 0
_08005E74:
	mov r1, sp
	adds r0, r1, r2
	ldrb r1, [r0]
	cmp r5, r1
	bcs _08005E80
	ldrb r5, [r0]
_08005E80:
	adds r2, 0x1
	cmp r2, 0x7
	ble _08005E74
	adds r0, r7, 0
	movs r1, 0
	bl GetFontAttribute
	add r0, r8
	lsls r0, 24
	lsrs r0, 24
	muls r0, r5
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetStringWidthFixedWidthFont

	thumb_func_start GetFontWidthFunc
GetFontWidthFunc: @ 8005EA4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r3, 0
	ldr r0, _08005EBC @ =gUnknown_81EA654
	adds r2, r0, 0x4
	adds r1, r0, 0
_08005EB2:
	ldr r0, [r1]
	cmp r4, r0
	bne _08005EC0
	ldr r0, [r2]
	b _08005ECC
	.align 2, 0
_08005EBC: .4byte gUnknown_81EA654
_08005EC0:
	adds r2, 0x8
	adds r1, 0x8
	adds r3, 0x1
	cmp r3, 0x6
	bls _08005EB2
	movs r0, 0
_08005ECC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetFontWidthFunc

	thumb_func_start sub_8005ED4
sub_8005ED4: @ 8005ED4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r2, 16
	lsrs r5, r2, 16
	movs r0, 0
	mov r9, r0
	movs r7, 0
	ldr r0, [sp]
	bl GetFontWidthFunc
	mov r8, r0
	cmp r0, 0
	bne _08005F02
_08005EFE:
	movs r0, 0
	b _08006112
_08005F02:
	lsls r0, r5, 16
	asrs r2, r0, 16
	movs r1, 0x1
	negs r1, r1
	str r0, [sp, 0x8]
	cmp r2, r1
	bne _08005F20
	ldr r0, [sp]
	movs r1, 0x2
	bl GetFontAttribute
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	b _08005F22
_08005F20:
	mov r10, r2
_08005F22:
	movs r1, 0
	str r1, [sp, 0x4]
	movs r5, 0
	movs r6, 0
	b _080060FE
_08005F2C:
	ldrb r1, [r4]
	adds r0, r1, 0
	subs r0, 0xF7
	cmp r0, 0x7
	bls _08005F38
	b _080060E0
_08005F38:
	lsls r0, 2
	ldr r1, _08005F44 @ =_08005F48
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08005F44: .4byte _08005F48
	.align 2, 0
_08005F48:
	.4byte _08005F9E
	.4byte _080060AE
	.4byte _080060AE
	.4byte _080060FC
	.4byte _080060FC
	.4byte _08005FDE
	.4byte _08005F74
	.4byte _08005F68
_08005F68:
	ldr r2, [sp, 0x4]
	cmp r5, r2
	bls _08005F70
	str r5, [sp, 0x4]
_08005F70:
	movs r5, 0
	b _080060FC
_08005F74:
	adds r4, 0x1
	ldrb r0, [r4]
	cmp r0, 0x3
	beq _08005F94
	cmp r0, 0x3
	bgt _08005F86
	cmp r0, 0x2
	beq _08005F8C
	b _08005EFE
_08005F86:
	cmp r0, 0x4
	beq _08005F9C
	b _08005EFE
_08005F8C:
	ldr r6, _08005F90 @ =gUnknown_2021CD0
	b _08005F9E
	.align 2, 0
_08005F90: .4byte gUnknown_2021CD0
_08005F94:
	ldr r6, _08005F98 @ =gUnknown_2021CF0
	b _08005F9E
	.align 2, 0
_08005F98: .4byte gUnknown_2021CF0
_08005F9C:
	ldr r6, _08005FB0 @ =gUnknown_2021D04
_08005F9E:
	cmp r6, 0
	bne _08005FD4
	adds r4, 0x1
	ldrb r0, [r4]
	bl UnkTextUtil_GetPtrI
	adds r6, r0, 0
	b _08005FD4
	.align 2, 0
_08005FB0: .4byte gUnknown_2021D04
_08005FB4:
	ldrb r0, [r6]
	adds r6, 0x1
	mov r1, r9
	bl _call_via_r8
	cmp r7, 0
	ble _08005FCA
	cmp r0, r7
	bge _08005FD2
	adds r0, r7, 0
	b _08005FD2
_08005FCA:
	mov r1, r9
	cmp r1, 0
	beq _08005FD2
	add r0, r10
_08005FD2:
	adds r5, r0
_08005FD4:
	ldrb r0, [r6]
	cmp r0, 0xFF
	bne _08005FB4
	movs r6, 0
	b _080060FC
_08005FDE:
	adds r4, 0x1
	ldrb r0, [r4]
	subs r0, 0x1
	cmp r0, 0x15
	bls _08005FEA
	b _080060FC
_08005FEA:
	lsls r0, 2
	ldr r1, _08005FF4 @ =_08005FF8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08005FF4: .4byte _08005FF8
	.align 2, 0
_08005FF8:
	.4byte _08006054
	.4byte _08006054
	.4byte _08006054
	.4byte _08006050
	.4byte _08006054
	.4byte _08006058
	.4byte _080060FC
	.4byte _08006054
	.4byte _080060FC
	.4byte _080060FC
	.4byte _08006052
	.4byte _08006054
	.4byte _08006054
	.4byte _08006054
	.4byte _080060FC
	.4byte _08006052
	.4byte _08006084
	.4byte _0800608A
	.4byte _08006090
	.4byte _0800609C
	.4byte _080060A2
	.4byte _080060A8
_08006050:
	adds r4, 0x1
_08006052:
	adds r4, 0x1
_08006054:
	adds r4, 0x1
	b _080060FC
_08006058:
	adds r4, 0x1
	ldrb r0, [r4]
	bl GetFontWidthFunc
	mov r8, r0
	cmp r0, 0
	bne _08006068
	b _08005EFE
_08006068:
	ldr r2, [sp, 0x8]
	asrs r1, r2, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080060FC
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetFontAttribute
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	b _080060FC
_08006084:
	adds r4, 0x1
	ldrb r0, [r4]
	b _080060FA
_0800608A:
	adds r4, 0x1
	ldrb r5, [r4]
	b _080060FC
_08006090:
	adds r4, 0x1
	ldrb r0, [r4]
	cmp r0, r5
	bls _080060FC
	adds r5, r0, 0
	b _080060FC
_0800609C:
	adds r4, 0x1
	ldrb r7, [r4]
	b _080060FC
_080060A2:
	movs r0, 0x1
	mov r9, r0
	b _080060FC
_080060A8:
	movs r1, 0
	mov r9, r1
	b _080060FC
_080060AE:
	ldrb r0, [r4]
	cmp r0, 0xF9
	bne _080060C8
	adds r4, 0x1
	ldrb r0, [r4]
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	orrs r0, r1
	mov r1, r9
	bl _call_via_r8
	b _080060D4
_080060C8:
	adds r4, 0x1
	ldrb r0, [r4]
	bl GetKeypadIconWidth
	lsls r0, 24
	lsrs r0, 24
_080060D4:
	cmp r7, 0
	ble _080060F2
_080060D8:
	cmp r0, r7
	bge _080060FA
	adds r0, r7, 0
	b _080060FA
_080060E0:
	adds r0, r1, 0
	mov r1, r9
	bl _call_via_r8
	cmp r7, 0
	bgt _080060D8
	ldr r2, [sp]
	cmp r2, 0x6
	beq _080060FA
_080060F2:
	mov r1, r9
	cmp r1, 0
	beq _080060FA
	add r0, r10
_080060FA:
	adds r5, r0
_080060FC:
	adds r4, 0x1
_080060FE:
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _08006106
	b _08005F2C
_08006106:
	ldr r2, [sp, 0x4]
	cmp r5, r2
	bhi _08006110
	adds r0, r2, 0
	b _08006112
_08006110:
	adds r0, r5, 0
_08006112:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8005ED4

	thumb_func_start sub_8006124
sub_8006124: @ 8006124
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	mov r9, r0
	adds r4, r2, 0
	mov r5, sp
	adds r5, 0x1
	mov r6, sp
	adds r6, 0x2
	mov r0, sp
	adds r1, r5, 0
	adds r2, r6, 0
	bl SaveTextColors
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r0, 0x3
	mov r10, r0
	movs r0, 0x1
	movs r2, 0x3
	bl sub_8002EA8
	mov r8, r4
	movs r7, 0
_0800615E:
	mov r1, r8
	adds r0, r1, r7
	ldrb r6, [r0]
	adds r7, 0x1
	adds r0, r6, 0
	subs r0, 0xF7
	cmp r0, 0x8
	bhi _0800625A
	lsls r0, 2
	ldr r1, _08006178 @ =_0800617C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08006178: .4byte _0800617C
	.align 2, 0
_0800617C:
	.4byte _08006256
	.4byte _08006256
	.4byte _08006256
	.4byte _08006280
	.4byte _08006280
	.4byte _080061A0
	.4byte _08006256
	.4byte _08006280
	.4byte _08006280
_080061A0:
	mov r1, r8
	adds r0, r1, r7
	ldrb r0, [r0]
	adds r7, 0x1
	subs r0, 0x1
	cmp r0, 0x15
	bhi _08006280
	lsls r0, 2
	ldr r1, _080061B8 @ =_080061BC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080061B8: .4byte _080061BC
	.align 2, 0
_080061BC:
	.4byte _08006228
	.4byte _08006234
	.4byte _0800623E
	.4byte _08006214
	.4byte _08006256
	.4byte _08006256
	.4byte _08006280
	.4byte _08006256
	.4byte _08006280
	.4byte _08006280
	.4byte _08006254
	.4byte _08006256
	.4byte _08006256
	.4byte _08006256
	.4byte _08006280
	.4byte _08006254
	.4byte _08006256
	.4byte _08006256
	.4byte _08006256
	.4byte _08006256
	.4byte _08006280
	.4byte _08006280
_08006214:
	mov r1, r8
	adds r0, r1, r7
	ldrb r0, [r0]
	str r0, [sp, 0x4]
	adds r7, 0x1
	adds r0, r1, r7
	ldrb r0, [r0]
	str r0, [sp, 0x8]
	adds r7, 0x1
	b _08006240
_08006228:
	mov r1, r8
	adds r0, r1, r7
	ldrb r0, [r0]
	str r0, [sp, 0x4]
	adds r7, 0x1
	b _0800624A
_08006234:
	mov r1, r8
	adds r0, r1, r7
	ldrb r0, [r0]
	str r0, [sp, 0x8]
	b _08006246
_0800623E:
	mov r1, r8
_08006240:
	adds r0, r1, r7
	ldrb r0, [r0]
	mov r10, r0
_08006246:
	adds r7, 0x1
	ldr r0, [sp, 0x4]
_0800624A:
	ldr r1, [sp, 0x8]
	mov r2, r10
	bl sub_8002EA8
	b _08006280
_08006254:
	adds r7, 0x1
_08006256:
	adds r7, 0x1
	b _08006280
_0800625A:
	adds r0, r6, 0
	bl DecompressGlyphFont9
	ldr r4, _080062A8 @ =gUnknown_3003DA0
	ldr r5, _080062AC @ =0x04000008
	adds r0, r4, 0
	mov r1, r9
	adds r2, r5, 0
	bl CpuSet
	adds r4, 0x40
	mov r1, r9
	adds r1, 0x20
	adds r0, r4, 0
	adds r2, r5, 0
	bl CpuSet
	movs r0, 0x40
	add r9, r0
_08006280:
	cmp r6, 0xFF
	beq _08006286
	b _0800615E
_08006286:
	mov r0, sp
	mov r1, sp
	adds r1, 0x1
	mov r2, sp
	adds r2, 0x2
	bl RestoreTextColors
	movs r0, 0x1
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080062A8: .4byte gUnknown_3003DA0
_080062AC: .4byte 0x04000008
	thumb_func_end sub_8006124

	thumb_func_start sub_80062B0
sub_80062B0: @ 80062B0
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	movs r3, 0x2E
	ldrsh r2, [r1, r3]
	cmp r2, 0
	beq _080062C4
	subs r0, 0x1
	strh r0, [r1, 0x2E]
	b _080062FA
_080062C4:
	movs r0, 0x8
	strh r0, [r1, 0x2E]
	movs r3, 0x30
	ldrsh r0, [r1, r3]
	cmp r0, 0x1
	beq _080062E8
	cmp r0, 0x1
	bgt _080062DA
	cmp r0, 0
	beq _080062E4
	b _080062F4
_080062DA:
	cmp r0, 0x2
	beq _080062E8
	cmp r0, 0x3
	beq _080062EC
	b _080062F4
_080062E4:
	strh r2, [r1, 0x26]
	b _080062F4
_080062E8:
	strh r0, [r1, 0x26]
	b _080062F4
_080062EC:
	movs r0, 0x1
	strh r0, [r1, 0x26]
	strh r2, [r1, 0x30]
	b _080062FA
_080062F4:
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
_080062FA:
	pop {r0}
	bx r0
	thumb_func_end sub_80062B0

	thumb_func_start sub_8006300
sub_8006300: @ 8006300
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	ldr r1, [sp, 0x14]
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 24
	lsrs r6, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	movs r1, 0x1
	ands r0, r1
	lsls r0, 3
	ldr r1, _08006388 @ =gUnknown_81EA68C
	adds r0, r1
	bl LoadSpriteSheet
	ldr r0, _0800638C @ =gUnknown_81EA6A4
	bl LoadSpritePalette
	ldr r0, _08006390 @ =gUnknown_81EA6B4
	adds r4, 0x3
	lsls r4, 16
	asrs r4, 16
	adds r5, 0x4
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	mov r3, r8
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08006394 @ =gUnknown_202063C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	movs r1, 0x3
	ands r6, r1
	lsls r6, 2
	ldrb r3, [r2, 0x5]
	subs r1, 0x10
	ands r1, r3
	orrs r1, r6
	strb r1, [r2, 0x5]
	ldrb r3, [r2, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r3
	strb r1, [r2, 0x3]
	movs r1, 0x8
	strh r1, [r2, 0x2E]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08006388: .4byte gUnknown_81EA68C
_0800638C: .4byte gUnknown_81EA6A4
_08006390: .4byte gUnknown_81EA6B4
_08006394: .4byte gUnknown_202063C
	thumb_func_end sub_8006300

	thumb_func_start sub_8006398
sub_8006398: @ 8006398
	push {r4,lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080063C4 @ =gUnknown_202063C
	adds r0, r1
	bl DestroySprite
	movs r4, 0x80
	lsls r4, 8
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080063C4: .4byte gUnknown_202063C
	thumb_func_end sub_8006398

	thumb_func_start DrawKeypadIcon
DrawKeypadIcon: @ 80063C8
	push {r4,r5,lr}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	ldr r4, _08006410 @ =gUnknown_81EA6CC
	lsrs r1, 22
	adds r1, r4
	ldrh r5, [r1]
	lsls r5, 5
	ldr r4, _08006414 @ =gUnknown_81EA700
	adds r5, r4
	movs r4, 0x80
	str r4, [sp]
	str r4, [sp, 0x4]
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	ldrb r4, [r1, 0x2]
	str r4, [sp, 0x10]
	ldrb r1, [r1, 0x3]
	str r1, [sp, 0x14]
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0
	bl BlitBitmapRectToWindow
	adds r0, r4, 0
	add sp, 0x18
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08006410: .4byte gUnknown_81EA6CC
_08006414: .4byte gUnknown_81EA700
	thumb_func_end DrawKeypadIcon

	thumb_func_start GetKeypadIconTileOffset
GetKeypadIconTileOffset: @ 8006418
	lsls r0, 24
	ldr r1, _08006424 @ =gUnknown_81EA6CC
	lsrs r0, 22
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08006424: .4byte gUnknown_81EA6CC
	thumb_func_end GetKeypadIconTileOffset

	thumb_func_start GetKeypadIconWidth
GetKeypadIconWidth: @ 8006428
	lsls r0, 24
	ldr r1, _08006434 @ =gUnknown_81EA6CC
	lsrs r0, 22
	adds r0, r1
	ldrb r0, [r0, 0x2]
	bx lr
	.align 2, 0
_08006434: .4byte gUnknown_81EA6CC
	thumb_func_end GetKeypadIconWidth

	thumb_func_start GetKeypadIconHeight
GetKeypadIconHeight: @ 8006438
	lsls r0, 24
	ldr r1, _08006444 @ =gUnknown_81EA6CC
	lsrs r0, 22
	adds r0, r1
	ldrb r0, [r0, 0x3]
	bx lr
	.align 2, 0
_08006444: .4byte gUnknown_81EA6CC
	thumb_func_end GetKeypadIconHeight

	thumb_func_start sub_8006448
sub_8006448: @ 8006448
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r1, 0x1
	bne _08006490
	lsrs r2, r0, 20
	lsls r2, 9
	movs r0, 0xF
	ands r0, r6
	lsls r0, 4
	ldr r1, _08006488 @ =gUnknown_81EF100
	adds r0, r1
	adds r5, r2, r0
	ldr r4, _0800648C @ =gUnknown_3003DA0
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8002F8C
	movs r1, 0x80
	lsls r1, 1
	adds r0, r5, r1
	adds r1, r4, 0
	adds r1, 0x40
	bl sub_8002F8C
	adds r1, r4, 0
	adds r1, 0x80
	movs r0, 0x8
	strb r0, [r1]
	adds r4, 0x81
	movs r0, 0xC
	b _080064BC
	.align 2, 0
_08006488: .4byte gUnknown_81EF100
_0800648C: .4byte gUnknown_3003DA0
_08006490:
	lsls r1, r6, 5
	ldr r0, _080064C4 @ =gUnknown_81EAF00
	adds r5, r1, r0
	ldr r4, _080064C8 @ =gUnknown_3003DA0
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8002F8C
	adds r0, r5, 0
	adds r0, 0x10
	adds r1, r4, 0
	adds r1, 0x40
	bl sub_8002F8C
	ldr r0, _080064CC @ =gUnknown_81EEF00
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r4, 0
	adds r0, 0x80
	strb r1, [r0]
	adds r4, 0x81
	movs r0, 0xD
_080064BC:
	strb r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080064C4: .4byte gUnknown_81EAF00
_080064C8: .4byte gUnknown_3003DA0
_080064CC: .4byte gUnknown_81EEF00
	thumb_func_end sub_8006448

	thumb_func_start sub_80064D0
sub_80064D0: @ 80064D0
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r1, 0x1
	beq _080064E8
	ldr r0, _080064E4 @ =gUnknown_81EEF00
	adds r0, r2, r0
	ldrb r0, [r0]
	b _080064EA
	.align 2, 0
_080064E4: .4byte gUnknown_81EEF00
_080064E8:
	movs r0, 0x8
_080064EA:
	pop {r1}
	bx r1
	thumb_func_end sub_80064D0

	thumb_func_start sub_80064F0
sub_80064F0: @ 80064F0
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r1, 0x1
	bne _0800653C
	lsrs r2, r0, 20
	lsls r2, 9
	movs r0, 0xF
	ands r0, r6
	lsls r0, 4
	ldr r1, _08006534 @ =gUnknown_81FB300
	adds r0, r1
	adds r5, r2, r0
	ldr r4, _08006538 @ =gUnknown_3003DA0
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8002F8C
	movs r1, 0x80
	lsls r1, 1
	adds r0, r5, r1
	adds r1, r4, 0
	adds r1, 0x40
	bl sub_8002F8C
	adds r1, r4, 0
	adds r1, 0x80
	movs r0, 0x8
	strb r0, [r1]
	adds r4, 0x81
	movs r0, 0x10
	strb r0, [r4]
	b _08006584
	.align 2, 0
_08006534: .4byte gUnknown_81FB300
_08006538: .4byte gUnknown_3003DA0
_0800653C:
	lsls r1, r6, 6
	ldr r0, _0800658C @ =gUnknown_81F3100
	adds r5, r1, r0
	ldr r4, _08006590 @ =gUnknown_3003DA0
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8002F8C
	adds r0, r5, 0
	adds r0, 0x10
	adds r1, r4, 0
	adds r1, 0x20
	bl sub_8002F8C
	adds r0, r5, 0
	adds r0, 0x20
	adds r1, r4, 0
	adds r1, 0x40
	bl sub_8002F8C
	adds r0, r5, 0
	adds r0, 0x30
	adds r1, r4, 0
	adds r1, 0x60
	bl sub_8002F8C
	ldr r0, _08006594 @ =gUnknown_81FB100
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r4, 0
	adds r0, 0x80
	strb r1, [r0]
	adds r1, r4, 0
	adds r1, 0x81
	movs r0, 0xE
	strb r0, [r1]
_08006584:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800658C: .4byte gUnknown_81F3100
_08006590: .4byte gUnknown_3003DA0
_08006594: .4byte gUnknown_81FB100
	thumb_func_end sub_80064F0

	thumb_func_start sub_8006598
sub_8006598: @ 8006598
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r1, 0x1
	beq _080065B0
	ldr r0, _080065AC @ =gUnknown_81FB100
	adds r0, r2, r0
	ldrb r0, [r0]
	b _080065B2
	.align 2, 0
_080065AC: .4byte gUnknown_81FB100
_080065B0:
	movs r0, 0x8
_080065B2:
	pop {r1}
	bx r1
	thumb_func_end sub_8006598

	thumb_func_start sub_80065B8
sub_80065B8: @ 80065B8
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r1, 0x1
	bne _0800665C
	cmp r6, 0
	bne _080065F8
	movs r0, 0x2
	bl sub_8002FCC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	ldr r3, _080065F4 @ =gUnknown_3003DA0
	lsls r2, r0, 4
	orrs r2, r0
	adds r7, r3, 0
	adds r7, 0x80
	movs r6, 0xA
	adds r5, r3, 0
	adds r5, 0x81
	movs r4, 0xC
_080065E4:
	adds r0, r1, r3
	strb r2, [r0]
	strb r6, [r7]
	strb r4, [r5]
	adds r1, 0x1
	cmp r1, 0x7F
	ble _080065E4
	b _080066E4
	.align 2, 0
_080065F4: .4byte gUnknown_3003DA0
_080065F8:
	lsrs r2, r0, 19
	lsls r2, 9
	movs r0, 0x7
	ands r0, r6
	lsls r0, 5
	ldr r1, _08006650 @ =gUnknown_8207500
	adds r0, r1
	adds r4, r2, r0
	ldr r5, _08006654 @ =gUnknown_3003DA0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8002F8C
	adds r0, r4, 0
	adds r0, 0x10
	adds r1, r5, 0
	adds r1, 0x20
	bl sub_8002F8C
	movs r1, 0x80
	lsls r1, 1
	adds r0, r4, r1
	adds r1, r5, 0
	adds r1, 0x40
	bl sub_8002F8C
	movs r1, 0x88
	lsls r1, 1
	adds r0, r4, r1
	adds r1, r5, 0
	adds r1, 0x60
	bl sub_8002F8C
	ldr r0, _08006658 @ =gUnknown_820F500
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r5, 0
	adds r0, 0x80
	strb r1, [r0]
	adds r1, r5, 0
	adds r1, 0x81
	movs r0, 0xC
	b _080066E2
	.align 2, 0
_08006650: .4byte gUnknown_8207500
_08006654: .4byte gUnknown_3003DA0
_08006658: .4byte gUnknown_820F500
_0800665C:
	cmp r6, 0
	bne _0800669C
	movs r0, 0x2
	bl sub_8002FCC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	ldr r3, _08006694 @ =gUnknown_3003DA0
	lsls r2, r0, 4
	orrs r2, r0
	ldr r0, _08006698 @ =gUnknown_8207300
	ldrb r4, [r0]
	movs r0, 0x81
	adds r0, r3
	mov r12, r0
	adds r6, r3, 0
	adds r6, 0x80
	movs r5, 0xE
_08006682:
	adds r0, r1, r3
	strb r2, [r0]
	strb r4, [r6]
	mov r0, r12
	strb r5, [r0]
	adds r1, 0x1
	cmp r1, 0x7F
	ble _08006682
	b _080066E4
	.align 2, 0
_08006694: .4byte gUnknown_3003DA0
_08006698: .4byte gUnknown_8207300
_0800669C:
	lsls r1, r6, 6
	ldr r0, _080066EC @ =gUnknown_81FF300
	adds r4, r1, r0
	ldr r5, _080066F0 @ =gUnknown_3003DA0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8002F8C
	adds r0, r4, 0
	adds r0, 0x10
	adds r1, r5, 0
	adds r1, 0x20
	bl sub_8002F8C
	adds r0, r4, 0
	adds r0, 0x20
	adds r1, r5, 0
	adds r1, 0x40
	bl sub_8002F8C
	adds r0, r4, 0
	adds r0, 0x30
	adds r1, r5, 0
	adds r1, 0x60
	bl sub_8002F8C
	ldr r0, _080066F4 @ =gUnknown_8207300
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r5, 0
	adds r0, 0x80
	strb r1, [r0]
	adds r1, r5, 0
	adds r1, 0x81
	movs r0, 0xE
_080066E2:
	strb r0, [r1]
_080066E4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080066EC: .4byte gUnknown_81FF300
_080066F0: .4byte gUnknown_3003DA0
_080066F4: .4byte gUnknown_8207300
	thumb_func_end sub_80065B8

	thumb_func_start sub_80066F8
sub_80066F8: @ 80066F8
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r1, 0x1
	bne _08006714
	cmp r2, 0
	bne _0800670A
	movs r0, 0xA
	b _0800671A
_0800670A:
	ldr r0, _08006710 @ =gUnknown_820F500
	b _08006716
	.align 2, 0
_08006710: .4byte gUnknown_820F500
_08006714:
	ldr r0, _08006720 @ =gUnknown_8207300
_08006716:
	adds r0, r2, r0
	ldrb r0, [r0]
_0800671A:
	pop {r1}
	bx r1
	.align 2, 0
_08006720: .4byte gUnknown_8207300
	thumb_func_end sub_80066F8

	thumb_func_start sub_8006724
sub_8006724: @ 8006724
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r1, 0x1
	bne _080067C0
	cmp r3, 0
	bne _08006764
	movs r0, 0x2
	bl sub_8002FCC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	ldr r3, _08006760 @ =gUnknown_3003DA0
	lsls r2, r0, 4
	orrs r2, r0
	adds r7, r3, 0
	adds r7, 0x80
	movs r6, 0xA
	adds r5, r3, 0
	adds r5, 0x81
	movs r4, 0xC
_08006750:
	adds r0, r1, r3
	strb r2, [r0]
	strb r6, [r7]
	strb r4, [r5]
	adds r1, 0x1
	cmp r1, 0x7F
	ble _08006750
	b _080067C6
	.align 2, 0
_08006760: .4byte gUnknown_3003DA0
_08006764:
	lsrs r2, r0, 19
	lsls r2, 9
	movs r0, 0x7
	ands r0, r3
	lsls r0, 5
	ldr r1, _080067B8 @ =gUnknown_8207500
	adds r0, r1
	adds r5, r2, r0
	ldr r4, _080067BC @ =gUnknown_3003DA0
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8002F8C
	adds r0, r5, 0
	adds r0, 0x10
	adds r1, r4, 0
	adds r1, 0x20
	bl sub_8002F8C
	movs r1, 0x80
	lsls r1, 1
	adds r0, r5, r1
	adds r1, r4, 0
	adds r1, 0x40
	bl sub_8002F8C
	movs r1, 0x88
	lsls r1, 1
	adds r0, r5, r1
	adds r1, r4, 0
	adds r1, 0x60
	bl sub_8002F8C
	adds r1, r4, 0
	adds r1, 0x80
	movs r0, 0xA
	strb r0, [r1]
	adds r1, 0x1
	movs r0, 0xC
	strb r0, [r1]
	b _080067C6
	.align 2, 0
_080067B8: .4byte gUnknown_8207500
_080067BC: .4byte gUnknown_3003DA0
_080067C0:
	adds r0, r3, 0
	bl sub_80065B8
_080067C6:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8006724

	thumb_func_start sub_80067CC
sub_80067CC: @ 80067CC
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r1, 0x1
	beq _080067E4
	ldr r0, _080067E0 @ =gUnknown_8207300
	adds r0, r2, r0
	ldrb r0, [r0]
	b _080067E6
	.align 2, 0
_080067E0: .4byte gUnknown_8207300
_080067E4:
	movs r0, 0xA
_080067E6:
	pop {r1}
	bx r1
	thumb_func_end sub_80067CC

	thumb_func_start sub_80067EC
sub_80067EC: @ 80067EC
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r1, 0x1
	bne _08006890
	cmp r6, 0
	bne _0800682C
	movs r0, 0x2
	bl sub_8002FCC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	ldr r3, _08006828 @ =gUnknown_3003DA0
	lsls r2, r0, 4
	orrs r2, r0
	adds r7, r3, 0
	adds r7, 0x80
	movs r6, 0xA
	adds r5, r3, 0
	adds r5, 0x81
	movs r4, 0xC
_08006818:
	adds r0, r1, r3
	strb r2, [r0]
	strb r6, [r7]
	strb r4, [r5]
	adds r1, 0x1
	cmp r1, 0x7F
	ble _08006818
	b _08006918
	.align 2, 0
_08006828: .4byte gUnknown_3003DA0
_0800682C:
	lsrs r2, r0, 19
	lsls r2, 9
	movs r0, 0x7
	ands r0, r6
	lsls r0, 5
	ldr r1, _08006884 @ =gUnknown_8217818
	adds r0, r1
	adds r4, r2, r0
	ldr r5, _08006888 @ =gUnknown_3003DA0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8002F8C
	adds r0, r4, 0
	adds r0, 0x10
	adds r1, r5, 0
	adds r1, 0x20
	bl sub_8002F8C
	movs r1, 0x80
	lsls r1, 1
	adds r0, r4, r1
	adds r1, r5, 0
	adds r1, 0x40
	bl sub_8002F8C
	movs r1, 0x88
	lsls r1, 1
	adds r0, r4, r1
	adds r1, r5, 0
	adds r1, 0x60
	bl sub_8002F8C
	ldr r0, _0800688C @ =gUnknown_821F818
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r5, 0
	adds r0, 0x80
	strb r1, [r0]
	adds r1, r5, 0
	adds r1, 0x81
	movs r0, 0xC
	b _08006916
	.align 2, 0
_08006884: .4byte gUnknown_8217818
_08006888: .4byte gUnknown_3003DA0
_0800688C: .4byte gUnknown_821F818
_08006890:
	cmp r6, 0
	bne _080068D0
	movs r0, 0x2
	bl sub_8002FCC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	ldr r3, _080068C8 @ =gUnknown_3003DA0
	lsls r2, r0, 4
	orrs r2, r0
	ldr r0, _080068CC @ =gUnknown_8217618
	ldrb r4, [r0]
	movs r0, 0x81
	adds r0, r3
	mov r12, r0
	adds r6, r3, 0
	adds r6, 0x80
	movs r5, 0xE
_080068B6:
	adds r0, r1, r3
	strb r2, [r0]
	strb r4, [r6]
	mov r0, r12
	strb r5, [r0]
	adds r1, 0x1
	cmp r1, 0x7F
	ble _080068B6
	b _08006918
	.align 2, 0
_080068C8: .4byte gUnknown_3003DA0
_080068CC: .4byte gUnknown_8217618
_080068D0:
	lsls r1, r6, 6
	ldr r0, _08006920 @ =gUnknown_820F618
	adds r4, r1, r0
	ldr r5, _08006924 @ =gUnknown_3003DA0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8002F8C
	adds r0, r4, 0
	adds r0, 0x10
	adds r1, r5, 0
	adds r1, 0x20
	bl sub_8002F8C
	adds r0, r4, 0
	adds r0, 0x20
	adds r1, r5, 0
	adds r1, 0x40
	bl sub_8002F8C
	adds r0, r4, 0
	adds r0, 0x30
	adds r1, r5, 0
	adds r1, 0x60
	bl sub_8002F8C
	ldr r0, _08006928 @ =gUnknown_8217618
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r5, 0
	adds r0, 0x80
	strb r1, [r0]
	adds r1, r5, 0
	adds r1, 0x81
	movs r0, 0xE
_08006916:
	strb r0, [r1]
_08006918:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006920: .4byte gUnknown_820F618
_08006924: .4byte gUnknown_3003DA0
_08006928: .4byte gUnknown_8217618
	thumb_func_end sub_80067EC

	thumb_func_start sub_800692C
sub_800692C: @ 800692C
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r1, 0x1
	bne _08006948
	cmp r2, 0
	bne _0800693E
	movs r0, 0xA
	b _0800694E
_0800693E:
	ldr r0, _08006944 @ =gUnknown_821F818
	b _0800694A
	.align 2, 0
_08006944: .4byte gUnknown_821F818
_08006948:
	ldr r0, _08006954 @ =gUnknown_8217618
_0800694A:
	adds r0, r2, r0
	ldrb r0, [r0]
_0800694E:
	pop {r1}
	bx r1
	.align 2, 0
_08006954: .4byte gUnknown_8217618
	thumb_func_end sub_800692C

	thumb_func_start sub_8006958
sub_8006958: @ 8006958
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r1, 0x1
	bne _080069FC
	cmp r6, 0
	bne _08006998
	movs r0, 0x2
	bl sub_8002FCC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	ldr r3, _08006994 @ =gUnknown_3003DA0
	lsls r2, r0, 4
	orrs r2, r0
	adds r7, r3, 0
	adds r7, 0x80
	movs r6, 0xA
	adds r5, r3, 0
	adds r5, 0x81
	movs r4, 0xC
_08006984:
	adds r0, r1, r3
	strb r2, [r0]
	strb r6, [r7]
	strb r4, [r5]
	adds r1, 0x1
	cmp r1, 0x7F
	ble _08006984
	b _08006A84
	.align 2, 0
_08006994: .4byte gUnknown_3003DA0
_08006998:
	lsrs r2, r0, 19
	lsls r2, 9
	movs r0, 0x7
	ands r0, r6
	lsls r0, 5
	ldr r1, _080069F0 @ =gUnknown_8227B30
	adds r0, r1
	adds r4, r2, r0
	ldr r5, _080069F4 @ =gUnknown_3003DA0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8002F8C
	adds r0, r4, 0
	adds r0, 0x10
	adds r1, r5, 0
	adds r1, 0x20
	bl sub_8002F8C
	movs r1, 0x80
	lsls r1, 1
	adds r0, r4, r1
	adds r1, r5, 0
	adds r1, 0x40
	bl sub_8002F8C
	movs r1, 0x88
	lsls r1, 1
	adds r0, r4, r1
	adds r1, r5, 0
	adds r1, 0x60
	bl sub_8002F8C
	ldr r0, _080069F8 @ =gUnknown_822FB30
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r5, 0
	adds r0, 0x80
	strb r1, [r0]
	adds r1, r5, 0
	adds r1, 0x81
	movs r0, 0xC
	b _08006A82
	.align 2, 0
_080069F0: .4byte gUnknown_8227B30
_080069F4: .4byte gUnknown_3003DA0
_080069F8: .4byte gUnknown_822FB30
_080069FC:
	cmp r6, 0
	bne _08006A3C
	movs r0, 0x2
	bl sub_8002FCC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	ldr r3, _08006A34 @ =gUnknown_3003DA0
	lsls r2, r0, 4
	orrs r2, r0
	ldr r0, _08006A38 @ =gUnknown_8227930
	ldrb r4, [r0]
	movs r0, 0x81
	adds r0, r3
	mov r12, r0
	adds r6, r3, 0
	adds r6, 0x80
	movs r5, 0xE
_08006A22:
	adds r0, r1, r3
	strb r2, [r0]
	strb r4, [r6]
	mov r0, r12
	strb r5, [r0]
	adds r1, 0x1
	cmp r1, 0x7F
	ble _08006A22
	b _08006A84
	.align 2, 0
_08006A34: .4byte gUnknown_3003DA0
_08006A38: .4byte gUnknown_8227930
_08006A3C:
	lsls r1, r6, 6
	ldr r0, _08006A8C @ =gUnknown_821F930
	adds r4, r1, r0
	ldr r5, _08006A90 @ =gUnknown_3003DA0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8002F8C
	adds r0, r4, 0
	adds r0, 0x10
	adds r1, r5, 0
	adds r1, 0x20
	bl sub_8002F8C
	adds r0, r4, 0
	adds r0, 0x20
	adds r1, r5, 0
	adds r1, 0x40
	bl sub_8002F8C
	adds r0, r4, 0
	adds r0, 0x30
	adds r1, r5, 0
	adds r1, 0x60
	bl sub_8002F8C
	ldr r0, _08006A94 @ =gUnknown_8227930
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r5, 0
	adds r0, 0x80
	strb r1, [r0]
	adds r1, r5, 0
	adds r1, 0x81
	movs r0, 0xE
_08006A82:
	strb r0, [r1]
_08006A84:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006A8C: .4byte gUnknown_821F930
_08006A90: .4byte gUnknown_3003DA0
_08006A94: .4byte gUnknown_8227930
	thumb_func_end sub_8006958

	thumb_func_start sub_8006A98
sub_8006A98: @ 8006A98
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r1, 0x1
	bne _08006AB4
	cmp r2, 0
	bne _08006AAA
	movs r0, 0xA
	b _08006ABA
_08006AAA:
	ldr r0, _08006AB0 @ =gUnknown_822FB30
	b _08006AB6
	.align 2, 0
_08006AB0: .4byte gUnknown_822FB30
_08006AB4:
	ldr r0, _08006AC0 @ =gUnknown_8227930
_08006AB6:
	adds r0, r2, r0
	ldrb r0, [r0]
_08006ABA:
	pop {r1}
	bx r1
	.align 2, 0
_08006AC0: .4byte gUnknown_8227930
	thumb_func_end sub_8006A98

	thumb_func_start DecompressGlyphFont9
DecompressGlyphFont9: @ 8006AC4
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 20
	lsls r4, 9
	movs r1, 0xF0
	lsls r1, 12
	ands r1, r0
	lsrs r1, 12
	ldr r0, _08006B08 @ =gUnknown_822FC48
	adds r1, r0
	adds r4, r1
	ldr r5, _08006B0C @ =gUnknown_3003DA0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8002F8C
	movs r0, 0x80
	lsls r0, 1
	adds r4, r0
	adds r1, r5, 0
	adds r1, 0x40
	adds r0, r4, 0
	bl sub_8002F8C
	adds r1, r5, 0
	adds r1, 0x80
	movs r0, 0x8
	strb r0, [r1]
	adds r5, 0x81
	movs r0, 0xC
	strb r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08006B08: .4byte gUnknown_822FC48
_08006B0C: .4byte gUnknown_3003DA0
	thumb_func_end DecompressGlyphFont9

	.align 2, 0 @ Don't pad with nop.
