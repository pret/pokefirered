	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_813D614
sub_813D614: @ 813D614
	push {r4,lr}
	sub sp, 0x10
	ldr r4, _0813D648 @ =gUnknown_203F36C
	ldr r1, [r4]
	movs r0, 0x1
	strh r0, [r1, 0x4]
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x6E
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	adds r1, 0x4
	str r1, [sp, 0xC]
	movs r0, 0x2
	movs r1, 0xD4
	movs r2, 0x78
	movs r3, 0x98
	bl AddScrollIndicatorArrowPairParameterized
	ldr r1, [r4]
	strb r0, [r1, 0x6]
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813D648: .4byte gUnknown_203F36C
	thumb_func_end sub_813D614

	thumb_func_start sub_813D64C
sub_813D64C: @ 813D64C
	push {r4,lr}
	sub sp, 0x10
	ldr r4, _0813D680 @ =gUnknown_203F36C
	ldr r1, [r4]
	movs r0, 0x1
	strh r0, [r1, 0x4]
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x6E
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	adds r1, 0x4
	str r1, [sp, 0xC]
	movs r0, 0x2
	movs r1, 0x98
	movs r2, 0x48
	movs r3, 0x68
	bl AddScrollIndicatorArrowPairParameterized
	ldr r1, [r4]
	strb r0, [r1, 0x6]
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813D680: .4byte gUnknown_203F36C
	thumb_func_end sub_813D64C

	thumb_func_start sub_813D684
sub_813D684: @ 813D684
	push {r4,lr}
	ldr r4, _0813D6A0 @ =gUnknown_203F36C
	ldr r1, [r4]
	ldrb r0, [r1, 0x6]
	cmp r0, 0xFF
	beq _0813D69A
	bl RemoveScrollIndicatorArrowPair
	ldr r1, [r4]
	movs r0, 0xFF
	strb r0, [r1, 0x6]
_0813D69A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813D6A0: .4byte gUnknown_203F36C
	thumb_func_end sub_813D684

	thumb_func_start sub_813D6A4
sub_813D6A4: @ 813D6A4
	push {r4,lr}
	sub sp, 0x14
	ldr r4, _0813D6E0 @ =gUnknown_841670A
	movs r0, 0x1
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	movs r3, 0x48
	subs r3, r0
	lsrs r3, 1
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	str r0, [sp, 0x10]
	movs r0, 0x2
	movs r1, 0x1
	adds r2, r4, 0
	bl sub_813E9A0
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813D6E0: .4byte gUnknown_841670A
	thumb_func_end sub_813D6A4

	thumb_func_start sub_813D6E4
sub_813D6E4: @ 813D6E4
	ldr r1, _0813D6F0 @ =gUnknown_203F370
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r0, [r1, 0xA]
	bx lr
	.align 2, 0
_0813D6F0: .4byte gUnknown_203F370
	thumb_func_end sub_813D6E4

	thumb_func_start sub_813D6F4
sub_813D6F4: @ 813D6F4
	push {r4,lr}
	ldr r0, _0813D70C @ =gUnknown_203F370
	ldrb r1, [r0, 0x4]
	adds r4, r0, 0
	cmp r1, 0x5
	beq _0813D714
	ldr r0, _0813D710 @ =gUnknown_203F36C
	ldr r1, [r0]
	ldrb r1, [r1, 0x7]
	adds r2, r1, 0x1
	adds r1, r0, 0
	b _0813D71A
	.align 2, 0
_0813D70C: .4byte gUnknown_203F370
_0813D710: .4byte gUnknown_203F36C
_0813D714:
	ldr r1, _0813D744 @ =gUnknown_203F36C
	ldr r0, [r1]
	ldrb r2, [r0, 0x7]
_0813D71A:
	ldrh r0, [r4, 0xA]
	cmp r0, 0
	beq _0813D72E
	ldr r1, [r1]
	ldrb r1, [r1, 0x8]
	adds r0, r1
	cmp r0, r2
	ble _0813D72E
	subs r0, r2, r1
	strh r0, [r4, 0xA]
_0813D72E:
	adds r3, r4, 0
	ldrh r0, [r3, 0xA]
	ldrh r1, [r3, 0x8]
	adds r0, r1
	cmp r0, r2
	blt _0813D74C
	cmp r2, 0x1
	bhi _0813D748
	movs r0, 0
	strh r0, [r3, 0x8]
	b _0813D74C
	.align 2, 0
_0813D744: .4byte gUnknown_203F36C
_0813D748:
	subs r0, r2, 0x1
	strh r0, [r4, 0x8]
_0813D74C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813D6F4

	thumb_func_start sub_813D754
sub_813D754: @ 813D754
	push {r4-r6,lr}
	ldr r0, _0813D770 @ =gUnknown_203F370
	ldrb r1, [r0, 0x4]
	adds r5, r0, 0
	cmp r1, 0x5
	beq _0813D778
	ldr r1, _0813D774 @ =gUnknown_203F36C
	ldr r0, [r1]
	ldrb r0, [r0, 0x7]
	adds r0, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	b _0813D77E
	.align 2, 0
_0813D770: .4byte gUnknown_203F370
_0813D774: .4byte gUnknown_203F36C
_0813D778:
	ldr r1, _0813D7C8 @ =gUnknown_203F36C
	ldr r0, [r1]
	ldrb r4, [r0, 0x7]
_0813D77E:
	adds r6, r1, 0
	ldrh r0, [r5, 0x8]
	cmp r0, 0x4
	bls _0813D7C2
	movs r3, 0
	subs r0, 0x4
	cmp r3, r0
	bgt _0813D7C2
	ldrh r0, [r5, 0xA]
	ldr r1, [r6]
	ldrb r1, [r1, 0x8]
	adds r0, r1
	cmp r0, r4
	beq _0813D7C2
	adds r2, r5, 0
_0813D79C:
	ldrh r0, [r2, 0x8]
	subs r0, 0x1
	strh r0, [r2, 0x8]
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	ldrh r0, [r2, 0x8]
	subs r0, 0x4
	cmp r3, r0
	bgt _0813D7C2
	ldrh r0, [r5, 0xA]
	ldr r1, [r6]
	ldrb r1, [r1, 0x8]
	adds r0, r1
	cmp r0, r4
	bne _0813D79C
_0813D7C2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813D7C8: .4byte gUnknown_203F36C
	thumb_func_end sub_813D754

	thumb_func_start sub_813D7CC
sub_813D7CC: @ 813D7CC
	push {lr}
	ldr r0, _0813D7FC @ =gUnknown_203F36C
	ldr r0, [r0]
	cmp r0, 0
	beq _0813D7DA
	bl Free
_0813D7DA:
	ldr r0, _0813D800 @ =gUnknown_203F37C
	ldr r0, [r0]
	cmp r0, 0
	beq _0813D7E6
	bl Free
_0813D7E6:
	ldr r0, _0813D804 @ =gUnknown_203F380
	ldr r0, [r0]
	cmp r0, 0
	beq _0813D7F2
	bl Free
_0813D7F2:
	bl FreeAllWindowBuffers
	pop {r0}
	bx r0
	.align 2, 0
_0813D7FC: .4byte gUnknown_203F36C
_0813D800: .4byte gUnknown_203F37C
_0813D804: .4byte gUnknown_203F380
	thumb_func_end sub_813D7CC

	thumb_func_start BerryPouch_StartFadeToExitCallback
BerryPouch_StartFadeToExitCallback: @ 813D808
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x2
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0813D83C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813D840 @ =sub_813D844
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813D83C: .4byte gTasks
_0813D840: .4byte sub_813D844
	thumb_func_end BerryPouch_StartFadeToExitCallback

	thumb_func_start sub_813D844
sub_813D844: @ 813D844
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0813D87C @ =gTasks+0x8
	adds r2, r0, r1
	ldr r0, _0813D880 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0813D8A4
	ldrb r0, [r2]
	ldr r4, _0813D884 @ =gUnknown_203F37A
	subs r2, r4, 0x2
	adds r1, r4, 0
	bl DestroyListMenuTask
	ldr r0, _0813D888 @ =gUnknown_203F36C
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, 0
	beq _0813D88C
	bl SetMainCallback2
	b _0813D896
	.align 2, 0
_0813D87C: .4byte gTasks+0x8
_0813D880: .4byte gPaletteFade
_0813D884: .4byte gUnknown_203F37A
_0813D888: .4byte gUnknown_203F36C
_0813D88C:
	adds r0, r4, 0
	subs r0, 0xA
	ldr r0, [r0]
	bl SetMainCallback2
_0813D896:
	bl sub_813D684
	bl sub_813D7CC
	adds r0, r5, 0
	bl DestroyTask
_0813D8A4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813D844

	thumb_func_start sub_813D8AC
sub_813D8AC: @ 813D8AC
	push {r4,lr}
	ldr r4, _0813D904 @ =gBagPockets + 0x20
	adds r0, r4, 0
	bl SortAndCompactBagPocket
	ldr r3, _0813D908 @ =gUnknown_203F36C
	ldr r1, [r3]
	movs r0, 0
	strb r0, [r1, 0x7]
	movs r2, 0
	ldrb r0, [r4, 0x4]
	cmp r2, r0
	bcs _0813D8EE
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813D8EE
_0813D8CE:
	ldr r0, [r3]
	ldrb r1, [r0, 0x7]
	adds r1, 0x1
	strb r1, [r0, 0x7]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrb r0, [r4, 0x4]
	cmp r2, r0
	bcs _0813D8EE
	ldr r0, [r4]
	lsls r1, r2, 2
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	bne _0813D8CE
_0813D8EE:
	ldr r0, _0813D90C @ =gUnknown_203F370
	ldrb r0, [r0, 0x4]
	cmp r0, 0x5
	beq _0813D910
	ldr r0, _0813D908 @ =gUnknown_203F36C
	ldr r1, [r0]
	ldrb r1, [r1, 0x7]
	adds r2, r1, 0x1
	adds r1, r0, 0
	b _0813D916
	.align 2, 0
_0813D904: .4byte gBagPockets + 0x20
_0813D908: .4byte gUnknown_203F36C
_0813D90C: .4byte gUnknown_203F370
_0813D910:
	ldr r1, _0813D924 @ =gUnknown_203F36C
	ldr r0, [r1]
	ldrb r2, [r0, 0x7]
_0813D916:
	cmp r2, 0x7
	bls _0813D928
	ldr r1, [r1]
	movs r0, 0x7
	strb r0, [r1, 0x8]
	b _0813D92C
	.align 2, 0
_0813D924: .4byte gUnknown_203F36C
_0813D928:
	ldr r0, [r1]
	strb r2, [r0, 0x8]
_0813D92C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813D8AC

	thumb_func_start BerryPouch_SetExitCallback
BerryPouch_SetExitCallback: @ 813D934
	ldr r1, _0813D93C @ =gUnknown_203F36C
	ldr r1, [r1]
	str r0, [r1]
	bx lr
	.align 2, 0
_0813D93C: .4byte gUnknown_203F36C
	thumb_func_end BerryPouch_SetExitCallback

	thumb_func_start sub_813D940
sub_813D940: @ 813D940
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x14
	adds r6, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _0813D9E8 @ =gTasks+0x8
	adds r4, r0
	movs r0, 0x8
	bl sub_813EA08
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	ldr r1, _0813D9EC @ =gStringVar1
	mov r10, r1
	bl sub_813D39C
	ldr r0, _0813D9F0 @ =gStringVar4
	mov r9, r0
	adds r1, r6, 0
	bl StringExpandPlaceholders
	movs r0, 0x2
	str r0, [sp]
	movs r6, 0x1
	str r6, [sp, 0x4]
	str r0, [sp, 0x8]
	movs r1, 0
	mov r8, r1
	str r1, [sp, 0xC]
	str r6, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0x2
	mov r2, r9
	movs r3, 0
	bl sub_813E9A0
	movs r0, 0
	bl sub_813EA08
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r0, r10
	movs r1, 0x1
	movs r2, 0x2
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r1, _0813D9F4 @ =gText_TimesStrVar1
	mov r0, r9
	bl StringExpandPlaceholders
	movs r0, 0xA
	str r0, [sp]
	str r6, [sp, 0x4]
	mov r0, r8
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	str r6, [sp, 0x10]
	adds r0, r4, 0
	movs r1, 0
	mov r2, r9
	movs r3, 0x4
	bl sub_813E9A0
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813D9E8: .4byte gTasks+0x8
_0813D9EC: .4byte gStringVar1
_0813D9F0: .4byte gStringVar4
_0813D9F4: .4byte gText_TimesStrVar1
	thumb_func_end sub_813D940

	thumb_func_start sub_813D9F8
sub_813D9F8: @ 813D9F8
	push {r4-r6,lr}
	sub sp, 0x14
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	bl sub_813EB10
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	adds r0, r6, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, _0813DA5C @ =gStringVar1
	lsls r4, 16
	asrs r4, 16
	adds r1, r4, 0
	movs r2, 0x2
	adds r3, r5, 0
	bl ConvertIntToDecimalStringN
	ldr r4, _0813DA60 @ =gStringVar4
	ldr r1, _0813DA64 @ =gText_TimesStrVar1
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0xA
	str r0, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	adds r0, r6, 0
	movs r1, 0
	adds r2, r4, 0
	movs r3, 0x4
	bl sub_813E9A0
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813DA5C: .4byte gStringVar1
_0813DA60: .4byte gStringVar4
_0813DA64: .4byte gText_TimesStrVar1
	thumb_func_end sub_813D9F8

	thumb_func_start sub_813DA68
sub_813DA68: @ 813DA68
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _0813DAD8 @ =gTasks+0x8
	adds r7, r0, r1
	ldr r0, _0813DADC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0
	beq _0813DA90
	b _0813DB9E
_0813DA90:
	bl sub_80BF72C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813DA9E
	b _0813DB9E
_0813DA9E:
	ldrb r0, [r7]
	bl ListMenu_ProcessInput
	adds r5, r0, 0
	ldrb r0, [r7]
	ldr r4, _0813DAE0 @ =gUnknown_203F37A
	subs r2, r4, 0x2
	adds r1, r4, 0
	bl ListMenuGetScrollAndRow
	ldr r0, _0813DAE4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0813DAEC
	adds r0, r4, 0
	subs r0, 0xA
	ldrb r0, [r0, 0x5]
	cmp r0, 0x1
	bne _0813DAEC
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0813DAE8 @ =gSpecialVar_ItemId
	mov r1, r8
	strh r1, [r0]
	b _0813DB48
	.align 2, 0
_0813DAD8: .4byte gTasks+0x8
_0813DADC: .4byte gPaletteFade
_0813DAE0: .4byte gUnknown_203F37A
_0813DAE4: .4byte gMain
_0813DAE8: .4byte gSpecialVar_ItemId
_0813DAEC:
	movs r0, 0x2
	negs r0, r0
	cmp r5, r0
	beq _0813DAFC
	adds r0, 0x1
	cmp r5, r0
	bne _0813DB10
	b _0813DB9E
_0813DAFC:
	ldr r0, _0813DB0C @ =gUnknown_203F370
	ldrb r0, [r0, 0x4]
	cmp r0, 0x5
	beq _0813DB9E
	movs r0, 0x5
	bl PlaySE
	b _0813DB42
	.align 2, 0
_0813DB0C: .4byte gUnknown_203F370
_0813DB10:
	movs r0, 0x5
	bl PlaySE
	ldr r3, _0813DB30 @ =gUnknown_203F370
	mov r8, r3
	ldrb r0, [r3, 0x4]
	cmp r0, 0x5
	bne _0813DB38
	lsls r1, r5, 16
	lsrs r1, 16
	movs r0, 0x5
	bl BagGetItemIdByPocketPosition
	ldr r1, _0813DB34 @ =gSpecialVar_ItemId
	b _0813DB46
	.align 2, 0
_0813DB30: .4byte gUnknown_203F370
_0813DB34: .4byte gSpecialVar_ItemId
_0813DB38:
	ldr r0, _0813DB50 @ =gUnknown_203F36C
	ldr r0, [r0]
	ldrb r0, [r0, 0x7]
	cmp r5, r0
	bne _0813DB58
_0813DB42:
	ldr r1, _0813DB54 @ =gSpecialVar_ItemId
	movs r0, 0
_0813DB46:
	strh r0, [r1]
_0813DB48:
	adds r0, r6, 0
	bl BerryPouch_StartFadeToExitCallback
	b _0813DB9E
	.align 2, 0
_0813DB50: .4byte gUnknown_203F36C
_0813DB54: .4byte gSpecialVar_ItemId
_0813DB58:
	bl sub_813D684
	movs r0, 0x1
	bl sub_813D594
	ldrb r0, [r7]
	movs r1, 0x2
	bl sub_813D4B0
	strh r5, [r7, 0x2]
	lsls r4, r5, 16
	lsrs r4, 16
	movs r0, 0x5
	adds r1, r4, 0
	bl BagGetQuantityByPocketPosition
	strh r0, [r7, 0x4]
	movs r0, 0x5
	adds r1, r4, 0
	bl BagGetItemIdByPocketPosition
	ldr r1, _0813DBA8 @ =gSpecialVar_ItemId
	strh r0, [r1]
	ldr r0, _0813DBAC @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r2, _0813DBB0 @ =gUnknown_8464358
	mov r3, r8
	ldrb r0, [r3, 0x4]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	str r0, [r1]
_0813DB9E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813DBA8: .4byte gSpecialVar_ItemId
_0813DBAC: .4byte gTasks
_0813DBB0: .4byte gUnknown_8464358
	thumb_func_end sub_813DA68

	thumb_func_start sub_813DBB4
sub_813DBB4: @ 813DBB4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_813D594
	bl sub_813D5BC
	ldr r1, _0813DBDC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813DBE0 @ =sub_813DA68
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813DBDC: .4byte gTasks
_0813DBE0: .4byte sub_813DA68
	thumb_func_end sub_813DBB4

	thumb_func_start sub_813DBE4
sub_813DBE4: @ 813DBE4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0813DC10 @ =gTasks+0x8
	adds r7, r1, r0
	ldr r0, _0813DC14 @ =gUnknown_203F370
	ldrb r0, [r0, 0x4]
	cmp r0, 0x4
	bne _0813DC24
	ldr r1, _0813DC18 @ =gUnknown_203F384
	ldr r0, _0813DC1C @ =gUnknown_84643B0
	str r0, [r1]
	ldr r1, _0813DC20 @ =gUnknown_203F388
	movs r0, 0x3
	b _0813DC86
	.align 2, 0
_0813DC10: .4byte gTasks+0x8
_0813DC14: .4byte gUnknown_203F370
_0813DC18: .4byte gUnknown_203F384
_0813DC1C: .4byte gUnknown_84643B0
_0813DC20: .4byte gUnknown_203F388
_0813DC24:
	bl MenuHelpers_LinkSomething
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0813DC38
	bl InUnionRoom
	cmp r0, 0x1
	bne _0813DC7C
_0813DC38:
	ldr r0, _0813DC54 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	bl sub_80BF6A8
	lsls r0, 24
	cmp r0, 0
	bne _0813DC64
	ldr r1, _0813DC58 @ =gUnknown_203F384
	ldr r0, _0813DC5C @ =gUnknown_84643AC
	str r0, [r1]
	ldr r1, _0813DC60 @ =gUnknown_203F388
	movs r0, 0x1
	b _0813DC86
	.align 2, 0
_0813DC54: .4byte gSpecialVar_ItemId
_0813DC58: .4byte gUnknown_203F384
_0813DC5C: .4byte gUnknown_84643AC
_0813DC60: .4byte gUnknown_203F388
_0813DC64:
	ldr r1, _0813DC70 @ =gUnknown_203F384
	ldr r0, _0813DC74 @ =gUnknown_84643A8
	str r0, [r1]
	ldr r1, _0813DC78 @ =gUnknown_203F388
	movs r0, 0x2
	b _0813DC86
	.align 2, 0
_0813DC70: .4byte gUnknown_203F384
_0813DC74: .4byte gUnknown_84643A8
_0813DC78: .4byte gUnknown_203F388
_0813DC7C:
	ldr r1, _0813DD58 @ =gUnknown_203F384
	ldr r0, _0813DD5C @ =gUnknown_84643A4
	str r0, [r1]
	ldr r1, _0813DD60 @ =gUnknown_203F388
	movs r0, 0x4
_0813DC86:
	strb r0, [r1]
	mov r8, r1
	mov r1, r8
	ldrb r0, [r1]
	adds r0, 0x9
	lsls r0, 24
	lsrs r0, 24
	bl sub_813EA08
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	movs r0, 0x2
	movs r1, 0
	bl GetMenuCursorDimensionByFont
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x2
	movs r1, 0x2
	bl GetFontAttribute
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	str r4, [sp]
	str r0, [sp, 0x4]
	mov r1, r8
	ldrb r0, [r1]
	str r0, [sp, 0x8]
	ldr r0, _0813DD64 @ =gUnknown_846437C
	str r0, [sp, 0xC]
	ldr r0, _0813DD58 @ =gUnknown_203F384
	ldr r0, [r0]
	str r0, [sp, 0x10]
	adds r0, r6, 0
	movs r1, 0x2
	adds r2, r5, 0
	movs r3, 0x2
	bl AddItemMenuActionTextPrinters
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	mov r1, r8
	ldrb r0, [r1]
	str r0, [sp, 0x4]
	movs r0, 0
	mov r8, r0
	str r0, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl Menu_InitCursor
	movs r0, 0x6
	bl sub_813EA08
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	ldr r1, _0813DD68 @ =gStringVar1
	bl sub_813D39C
	ldr r5, _0813DD6C @ =gStringVar4
	ldr r1, _0813DD70 @ =gOtherText_StrVar1
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0x2
	str r0, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	str r0, [sp, 0x8]
	mov r0, r8
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	adds r0, r4, 0
	movs r1, 0x2
	adds r2, r5, 0
	movs r3, 0
	bl sub_813E9A0
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813DD58: .4byte gUnknown_203F384
_0813DD5C: .4byte gUnknown_84643A4
_0813DD60: .4byte gUnknown_203F388
_0813DD64: .4byte gUnknown_846437C
_0813DD68: .4byte gStringVar1
_0813DD6C: .4byte gStringVar4
_0813DD70: .4byte gOtherText_StrVar1
	thumb_func_end sub_813DBE4

	thumb_func_start sub_813DD74
sub_813DD74: @ 813DD74
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_813DBE4
	ldr r1, _0813DD98 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813DD9C @ =sub_813DDA0
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813DD98: .4byte gTasks
_0813DD9C: .4byte sub_813DDA0
	thumb_func_end sub_813DD74

	thumb_func_start sub_813DDA0
sub_813DDA0: @ 813DDA0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	bl sub_80BF72C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0813DDFE
	bl Menu_ProcessInputNoWrapAround
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _0813DDFE
	adds r0, 0x1
	cmp r4, r0
	bne _0813DDE0
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0813DDDC @ =gUnknown_846437C
	ldr r1, [r0, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	b _0813DDFE
	.align 2, 0
_0813DDDC: .4byte gUnknown_846437C
_0813DDE0:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0813DE04 @ =gUnknown_846437C
	ldr r0, _0813DE08 @ =gUnknown_203F384
	ldr r0, [r0]
	adds r0, r4
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r6, 0
	bl _call_via_r1
_0813DDFE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813DE04: .4byte gUnknown_846437C
_0813DE08: .4byte gUnknown_203F384
	thumb_func_end sub_813DDA0

	thumb_func_start sub_813DE0C
sub_813DE0C: @ 813DE0C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0813DE5C @ =gUnknown_203F388
	ldrb r0, [r0]
	adds r0, 0x9
	lsls r0, 24
	lsrs r0, 24
	bl sub_813EA98
	movs r0, 0x6
	bl sub_813EA98
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r0, _0813DE60 @ =gUnknown_203F370
	ldrb r0, [r0, 0x4]
	cmp r0, 0x4
	bne _0813DE78
	ldr r4, _0813DE64 @ =gSpecialVar_ItemId
	ldrh r0, [r4]
	bl ItemId_GetBattleFunc
	cmp r0, 0
	bne _0813DE68
	adds r0, r5, 0
	bl FieldUseFunc_OakStopsYou
	b _0813DEB0
	.align 2, 0
_0813DE5C: .4byte gUnknown_203F388
_0813DE60: .4byte gUnknown_203F370
_0813DE64: .4byte gSpecialVar_ItemId
_0813DE68:
	ldrh r0, [r4]
	bl ItemId_GetBattleFunc
	adds r1, r0, 0
	adds r0, r5, 0
	bl _call_via_r1
	b _0813DEB0
_0813DE78:
	bl CalculatePlayerPartyCount
	lsls r0, 24
	cmp r0, 0
	bne _0813DEA0
	ldr r0, _0813DE9C @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	bl ItemId_GetType
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813DEA0
	adds r0, r5, 0
	bl sub_813E274
	b _0813DEB0
	.align 2, 0
_0813DE9C: .4byte gSpecialVar_ItemId
_0813DEA0:
	ldr r0, _0813DEB8 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	bl ItemId_GetFieldFunc
	adds r1, r0, 0
	adds r0, r5, 0
	bl _call_via_r1
_0813DEB0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813DEB8: .4byte gSpecialVar_ItemId
	thumb_func_end sub_813DE0C

	thumb_func_start sub_813DEBC
sub_813DEBC: @ 813DEBC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r7, r0, 3
	ldr r0, _0813DF24 @ =gTasks+0x8
	mov r8, r0
	adds r5, r7, r0
	ldr r4, _0813DF28 @ =gUnknown_203F388
	ldrb r0, [r4]
	adds r0, 0x9
	lsls r0, 24
	lsrs r0, 24
	bl sub_813EB10
	lsls r0, 24
	lsrs r0, 24
	bl ClearWindowTilemap
	movs r0, 0x6
	bl sub_813EB10
	lsls r0, 24
	lsrs r0, 24
	bl ClearWindowTilemap
	ldrb r0, [r4]
	adds r0, 0x9
	lsls r0, 24
	lsrs r0, 24
	bl sub_813EA98
	movs r0, 0x6
	bl sub_813EA98
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	strh r0, [r5, 0x10]
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _0813DF2C
	adds r0, r6, 0
	bl sub_813DF54
	b _0813DF42
	.align 2, 0
_0813DF24: .4byte gTasks+0x8
_0813DF28: .4byte gUnknown_203F388
_0813DF2C:
	ldr r1, _0813DF4C @ =gUnknown_84163DB
	adds r0, r6, 0
	bl sub_813D940
	bl sub_813D614
	mov r0, r8
	subs r0, 0x8
	adds r0, r7, r0
	ldr r1, _0813DF50 @ =sub_813E010
	str r1, [r0]
_0813DF42:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813DF4C: .4byte gUnknown_84163DB
_0813DF50: .4byte sub_813E010
	thumb_func_end sub_813DEBC

	thumb_func_start sub_813DF54
sub_813DF54: @ 813DF54
	push {r4,r5,lr}
	sub sp, 0x14
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	ldr r0, _0813DFB4 @ =gTasks+0x8
	adds r1, r0
	ldr r0, _0813DFB8 @ =gStringVar2
	movs r2, 0x10
	ldrsh r1, [r1, r2]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r5, _0813DFBC @ =gStringVar4
	ldr r1, _0813DFC0 @ =gUnknown_8416409
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0x7
	bl sub_813EA08
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	str r1, [sp]
	movs r2, 0x1
	str r2, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0
	str r1, [sp, 0xC]
	str r2, [sp, 0x10]
	movs r1, 0x2
	adds r2, r5, 0
	movs r3, 0
	bl sub_813E9A0
	ldr r1, _0813DFC4 @ =gUnknown_846436C
	adds r0, r4, 0
	bl sub_813EB7C
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813DFB4: .4byte gTasks+0x8
_0813DFB8: .4byte gStringVar2
_0813DFBC: .4byte gStringVar4
_0813DFC0: .4byte gUnknown_8416409
_0813DFC4: .4byte gUnknown_846436C
	thumb_func_end sub_813DF54

	thumb_func_start sub_813DFC8
sub_813DFC8: @ 813DFC8
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _0813E00C @ =gTasks+0x8
	adds r4, r0
	movs r0, 0x7
	bl sub_813EA98
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_813D4B0
	adds r0, r5, 0
	bl sub_813DBB4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813E00C: .4byte gTasks+0x8
	thumb_func_end sub_813DFC8

	thumb_func_start sub_813E010
sub_813E010: @ 813E010
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0813E044 @ =gTasks+0x8
	adds r4, r0, r1
	adds r0, r4, 0
	adds r0, 0x10
	ldrh r1, [r4, 0x4]
	bl AdjustQuantityAccordingToDPadInput
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813E048
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	movs r0, 0
	movs r2, 0x3
	bl sub_813D9F8
	b _0813E0D4
	.align 2, 0
_0813E044: .4byte gTasks+0x8
_0813E048:
	ldr r0, _0813E08C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813E090
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x8
	bl sub_813EB10
	lsls r0, 24
	lsrs r0, 24
	bl ClearWindowTilemap
	movs r0, 0x8
	bl sub_813EA98
	movs r0, 0
	bl sub_813EA98
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	bl sub_813D684
	adds r0, r5, 0
	bl sub_813DF54
	b _0813E0D4
	.align 2, 0
_0813E08C: .4byte gMain
_0813E090:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0813E0D4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x8
	bl sub_813EA98
	movs r0, 0
	bl sub_813EA98
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_813D4B0
	bl sub_813D684
	adds r0, r6, 0
	bl sub_813DBB4
_0813E0D4:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_813E010

	thumb_func_start sub_813E0DC
sub_813E0DC: @ 813E0DC
	push {r4-r6,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r6, _0813E14C @ =gTasks+0x8
	adds r5, r4, r6
	movs r0, 0x7
	bl sub_813EA98
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	ldr r1, _0813E150 @ =gStringVar1
	bl sub_813D39C
	ldr r0, _0813E154 @ =gStringVar2
	movs r2, 0x10
	ldrsh r1, [r5, r2]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r5, _0813E158 @ =gStringVar4
	ldr r1, _0813E15C @ =gUnknown_84163F4
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0x9
	bl sub_813EA08
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	str r1, [sp]
	movs r2, 0x1
	str r2, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0
	str r1, [sp, 0xC]
	str r2, [sp, 0x10]
	movs r1, 0x2
	adds r2, r5, 0
	movs r3, 0
	bl sub_813E9A0
	subs r6, 0x8
	adds r4, r6
	ldr r0, _0813E160 @ =sub_813E164
	str r0, [r4]
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813E14C: .4byte gTasks+0x8
_0813E150: .4byte gStringVar1
_0813E154: .4byte gStringVar2
_0813E158: .4byte gStringVar4
_0813E15C: .4byte gUnknown_84163F4
_0813E160: .4byte sub_813E164
	thumb_func_end sub_813E0DC

	thumb_func_start sub_813E164
sub_813E164: @ 813E164
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _0813E1EC @ =gTasks+0x8
	adds r5, r0, r1
	ldr r0, _0813E1F0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0813E18A
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0813E1E4
_0813E18A:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0813E1F4 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	ldrh r1, [r5, 0x10]
	bl RemoveBagItem
	movs r0, 0x9
	bl sub_813EA98
	ldrb r0, [r5]
	ldr r4, _0813E1F8 @ =gUnknown_203F37A
	subs r2, r4, 0x2
	adds r1, r4, 0
	bl DestroyListMenuTask
	bl sub_813D8AC
	bl sub_813D6F4
	bl sub_813D204
	ldr r0, _0813E1FC @ =gMultiuseListMenuTemplate
	subs r4, 0xA
	ldrh r1, [r4, 0xA]
	ldrh r2, [r4, 0x8]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_813D4B0
	adds r0, r6, 0
	bl sub_813DBB4
_0813E1E4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813E1EC: .4byte gTasks+0x8
_0813E1F0: .4byte gMain
_0813E1F4: .4byte gSpecialVar_ItemId
_0813E1F8: .4byte gUnknown_203F37A
_0813E1FC: .4byte gMultiuseListMenuTemplate
	thumb_func_end sub_813E164

	thumb_func_start sub_813E200
sub_813E200: @ 813E200
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813E244 @ =gUnknown_203F388
	ldrb r0, [r0]
	adds r0, 0x9
	lsls r0, 24
	lsrs r0, 24
	bl sub_813EA98
	movs r0, 0x6
	bl sub_813EA98
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	bl CalculatePlayerPartyCount
	lsls r0, 24
	cmp r0, 0
	bne _0813E248
	adds r0, r4, 0
	bl sub_813E274
	b _0813E25E
	.align 2, 0
_0813E244: .4byte gUnknown_203F388
_0813E248:
	ldr r0, _0813E264 @ =gUnknown_203F36C
	ldr r1, [r0]
	ldr r0, _0813E268 @ =sub_8126EDC
	str r0, [r1]
	ldr r1, _0813E26C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813E270 @ =BerryPouch_StartFadeToExitCallback
	str r1, [r0]
_0813E25E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813E264: .4byte gUnknown_203F36C
_0813E268: .4byte sub_8126EDC
_0813E26C: .4byte gTasks
_0813E270: .4byte BerryPouch_StartFadeToExitCallback
	thumb_func_end sub_813E200

	thumb_func_start sub_813E274
sub_813E274: @ 813E274
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0813E288 @ =gText_ThereIsNoPokemon
	ldr r3, _0813E28C @ =sub_813E290
	movs r1, 0x2
	bl DisplayItemMessageInBerryPouch
	pop {r0}
	bx r0
	.align 2, 0
_0813E288: .4byte gText_ThereIsNoPokemon
_0813E28C: .4byte sub_813E290
	thumb_func_end sub_813E274

	thumb_func_start sub_813E290
sub_813E290: @ 813E290
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813E2B4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813E2AE
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_813E2B8
_0813E2AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813E2B4: .4byte gMain
	thumb_func_end sub_813E290

	thumb_func_start sub_813E2B8
sub_813E2B8: @ 813E2B8
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r5, r6, 2
	adds r5, r6
	lsls r5, 3
	ldr r0, _0813E314 @ =gTasks+0x8
	adds r5, r0
	movs r0, 0x5
	bl sub_813EACC
	ldrb r0, [r5]
	ldr r4, _0813E318 @ =gUnknown_203F37A
	subs r2, r4, 0x2
	adds r1, r4, 0
	bl DestroyListMenuTask
	bl sub_813D8AC
	bl sub_813D6F4
	bl sub_813D204
	ldr r0, _0813E31C @ =gMultiuseListMenuTemplate
	subs r4, 0xA
	ldrh r1, [r4, 0xA]
	ldrh r2, [r4, 0x8]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_813D4B0
	adds r0, r6, 0
	bl sub_813DBB4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813E314: .4byte gTasks+0x8
_0813E318: .4byte gUnknown_203F37A
_0813E31C: .4byte gMultiuseListMenuTemplate
	thumb_func_end sub_813E2B8

	thumb_func_start sub_813E320
sub_813E320: @ 813E320
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0813E374 @ =gUnknown_203F388
	ldrb r0, [r0]
	adds r0, 0x9
	lsls r0, 24
	lsrs r0, 24
	bl sub_813EA98
	movs r0, 0x6
	bl sub_813EA98
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r1, _0813E378 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x8]
	movs r1, 0x1
	bl sub_813D4B0
	adds r0, r4, 0
	bl sub_813DBB4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813E374: .4byte gUnknown_203F388
_0813E378: .4byte gTasks
	thumb_func_end sub_813E320

	thumb_func_start sub_813E37C
sub_813E37C: @ 813E37C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r7, _0813E3C4 @ =gTasks+0x8
	adds r0, r6, r7
	ldrh r1, [r0, 0x2]
	movs r0, 0x5
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_80BF6A8
	lsls r0, 24
	cmp r0, 0
	bne _0813E3D8
	ldr r1, _0813E3C8 @ =gStringVar1
	adds r0, r4, 0
	bl CopyItemName
	ldr r4, _0813E3CC @ =gStringVar4
	ldr r1, _0813E3D0 @ =gUnknown_8416374
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r3, _0813E3D4 @ =sub_813E290
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl DisplayItemMessageInBerryPouch
	b _0813E3EA
	.align 2, 0
_0813E3C4: .4byte gTasks+0x8
_0813E3C8: .4byte gStringVar1
_0813E3CC: .4byte gStringVar4
_0813E3D0: .4byte gUnknown_8416374
_0813E3D4: .4byte sub_813E290
_0813E3D8:
	ldr r0, _0813E3F0 @ =gUnknown_203F36C
	ldr r1, [r0]
	ldr r0, _0813E3F4 @ =c2_8123744
	str r0, [r1]
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0813E3F8 @ =BerryPouch_StartFadeToExitCallback
	str r1, [r0]
_0813E3EA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813E3F0: .4byte gUnknown_203F36C
_0813E3F4: .4byte c2_8123744
_0813E3F8: .4byte BerryPouch_StartFadeToExitCallback
	thumb_func_end sub_813E37C

	thumb_func_start sub_813E3FC
sub_813E3FC: @ 813E3FC
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813E418 @ =gUnknown_203F36C
	ldr r2, [r1]
	ldr r1, _0813E41C @ =sub_808CE60
	str r1, [r2]
	ldr r2, _0813E420 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0813E424 @ =BerryPouch_StartFadeToExitCallback
	str r0, [r1]
	bx lr
	.align 2, 0
_0813E418: .4byte gUnknown_203F36C
_0813E41C: .4byte sub_808CE60
_0813E420: .4byte gTasks
_0813E424: .4byte BerryPouch_StartFadeToExitCallback
	thumb_func_end sub_813E3FC

	thumb_func_start sub_813E428
sub_813E428: @ 813E428
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r5, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0813E470 @ =gTasks+0x8
	adds r4, r0, r1
	ldr r6, _0813E474 @ =gSpecialVar_ItemId
	ldrh r0, [r6]
	bl itemid_get_market_price
	lsls r0, 16
	cmp r0, 0
	bne _0813E488
	ldrh r0, [r6]
	ldr r1, _0813E478 @ =gStringVar1
	bl CopyItemName
	ldr r4, _0813E47C @ =gStringVar4
	ldr r1, _0813E480 @ =gText_OhNoICantBuyThat
	adds r0, r4, 0
	bl StringExpandPlaceholders
	bl sub_80BF8E4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0813E484 @ =sub_813E2B8
	adds r0, r5, 0
	adds r2, r4, 0
	bl DisplayItemMessageInBerryPouch
	b _0813E4CE
	.align 2, 0
_0813E470: .4byte gTasks+0x8
_0813E474: .4byte gSpecialVar_ItemId
_0813E478: .4byte gStringVar1
_0813E47C: .4byte gStringVar4
_0813E480: .4byte gText_OhNoICantBuyThat
_0813E484: .4byte sub_813E2B8
_0813E488:
	movs r0, 0x1
	strh r0, [r4, 0x10]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _0813E4A0
	bl sub_813EBD4
	adds r0, r5, 0
	bl sub_813E4E4
	b _0813E4CE
_0813E4A0:
	cmp r0, 0x63
	ble _0813E4A8
	movs r0, 0x63
	strh r0, [r4, 0x4]
_0813E4A8:
	ldrh r0, [r6]
	ldr r1, _0813E4D4 @ =gStringVar1
	bl CopyItemName
	ldr r4, _0813E4D8 @ =gStringVar4
	ldr r1, _0813E4DC @ =gText_HowManyWouldYouLikeToSell
	adds r0, r4, 0
	bl StringExpandPlaceholders
	bl sub_80BF8E4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0813E4E0 @ =sub_813E5B8
	adds r0, r7, 0
	adds r2, r4, 0
	bl DisplayItemMessageInBerryPouch
_0813E4CE:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813E4D4: .4byte gStringVar1
_0813E4D8: .4byte gStringVar4
_0813E4DC: .4byte gText_HowManyWouldYouLikeToSell
_0813E4E0: .4byte sub_813E5B8
	thumb_func_end sub_813E428

	thumb_func_start sub_813E4E4
sub_813E4E4: @ 813E4E4
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _0813E540 @ =gTasks+0x8
	adds r4, r0
	ldr r6, _0813E544 @ =gStringVar3
	ldrh r1, [r4, 0x2]
	movs r0, 0x5
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r0, 16
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	muls r1, r0
	adds r0, r6, 0
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	ldr r4, _0813E548 @ =gStringVar4
	ldr r1, _0813E54C @ =gText_ICanPayThisMuch_WouldThatBeOkay
	adds r0, r4, 0
	bl StringExpandPlaceholders
	bl sub_80BF8E4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0813E550 @ =sub_813E554
	adds r0, r5, 0
	adds r2, r4, 0
	bl DisplayItemMessageInBerryPouch
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813E540: .4byte gTasks+0x8
_0813E544: .4byte gStringVar3
_0813E548: .4byte gStringVar4
_0813E54C: .4byte gText_ICanPayThisMuch_WouldThatBeOkay
_0813E550: .4byte sub_813E554
	thumb_func_end sub_813E4E4

	thumb_func_start sub_813E554
sub_813E554: @ 813E554
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813E564 @ =gUnknown_8464374
	bl sub_813EBA8
	pop {r0}
	bx r0
	.align 2, 0
_0813E564: .4byte gUnknown_8464374
	thumb_func_end sub_813E554

	thumb_func_start sub_813E568
sub_813E568: @ 813E568
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _0813E5B4 @ =gTasks+0x8
	adds r4, r0
	movs r0, 0x2
	bl sub_813EA98
	movs r0, 0x5
	bl sub_813EACC
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_813D4B0
	adds r0, r5, 0
	bl sub_813DBB4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813E5B4: .4byte gTasks+0x8
	thumb_func_end sub_813E568

	thumb_func_start sub_813E5B8
sub_813E5B8: @ 813E5B8
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	lsls r5, r0, 2
	adds r5, r0
	lsls r5, 3
	ldr r6, _0813E654 @ =gTasks+0x8
	adds r0, r5, r6
	mov r9, r0
	movs r0, 0x1
	bl sub_813EA08
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0813E658 @ =gStringVar1
	movs r1, 0x1
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r2, _0813E65C @ =gStringVar4
	mov r8, r2
	ldr r1, _0813E660 @ =gText_TimesStrVar1
	mov r0, r8
	bl StringExpandPlaceholders
	movs r0, 0xA
	str r0, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r0, 0xFF
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	adds r0, r4, 0
	movs r1, 0
	mov r2, r8
	movs r3, 0x4
	bl sub_813E9A0
	mov r3, r9
	ldrh r1, [r3, 0x2]
	movs r0, 0x5
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r0, 16
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	mov r2, r9
	movs r3, 0x10
	ldrsh r1, [r2, r3]
	muls r0, r1
	bl sub_813E668
	bl sub_813EBD4
	bl sub_813D64C
	subs r6, 0x8
	adds r5, r6
	ldr r0, _0813E664 @ =sub_813E690
	str r0, [r5]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813E654: .4byte gTasks+0x8
_0813E658: .4byte gStringVar1
_0813E65C: .4byte gStringVar4
_0813E660: .4byte gText_TimesStrVar1
_0813E664: .4byte sub_813E690
	thumb_func_end sub_813E5B8

	thumb_func_start sub_813E668
sub_813E668: @ 813E668
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r0, 0x1
	bl sub_813EB10
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	str r1, [sp]
	movs r1, 0x38
	movs r2, 0xA
	adds r3, r4, 0
	bl PrintMoneyAmount
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813E668

	thumb_func_start sub_813E690
sub_813E690: @ 813E690
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0813E6E0 @ =gTasks+0x8
	adds r5, r0, r1
	adds r0, r5, 0
	adds r0, 0x10
	ldrh r1, [r5, 0x4]
	bl AdjustQuantityAccordingToDPadInput
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813E6E4
	movs r0, 0x10
	ldrsh r1, [r5, r0]
	movs r0, 0x1
	movs r2, 0x2
	bl sub_813D9F8
	ldrh r1, [r5, 0x2]
	movs r0, 0x5
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r0, 16
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	movs r2, 0x10
	ldrsh r1, [r5, r2]
	muls r0, r1
	bl sub_813E668
	b _0813E762
	.align 2, 0
_0813E6E0: .4byte gTasks+0x8
_0813E6E4:
	ldr r0, _0813E714 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813E718
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl sub_813EA98
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	bl sub_813D684
	adds r0, r4, 0
	bl sub_813E4E4
	b _0813E762
	.align 2, 0
_0813E714: .4byte gMain
_0813E718:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0813E762
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl sub_813EA98
	movs r0, 0x2
	bl sub_813EA98
	movs r0, 0x5
	bl sub_813EACC
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	bl sub_813D684
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_813D4B0
	adds r0, r6, 0
	bl sub_813DBB4
_0813E762:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_813E690

	thumb_func_start sub_813E768
sub_813E768: @ 813E768
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _0813E7D4 @ =gTasks+0x8
	adds r4, r0
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	ldr r0, _0813E7D8 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	ldr r1, _0813E7DC @ =gStringVar1
	bl CopyItemName
	ldr r6, _0813E7E0 @ =gStringVar3
	ldrh r1, [r4, 0x2]
	movs r0, 0x5
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r0, 16
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	muls r1, r0
	adds r0, r6, 0
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	ldr r4, _0813E7E4 @ =gStringVar4
	ldr r1, _0813E7E8 @ =gText_TurnedOverItemsWorthYen
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r3, _0813E7EC @ =sub_813E7F0
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl DisplayItemMessageInBerryPouch
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813E7D4: .4byte gTasks+0x8
_0813E7D8: .4byte gSpecialVar_ItemId
_0813E7DC: .4byte gStringVar1
_0813E7E0: .4byte gStringVar3
_0813E7E4: .4byte gStringVar4
_0813E7E8: .4byte gText_TurnedOverItemsWorthYen
_0813E7EC: .4byte sub_813E7F0
	thumb_func_end sub_813E768

	thumb_func_start sub_813E7F0
sub_813E7F0: @ 813E7F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r6, r0, 2
	adds r6, r0
	lsls r6, 3
	ldr r0, _0813E8BC @ =gTasks+0x8
	mov r9, r0
	adds r1, r6, 0
	add r1, r9
	mov r8, r1
	movs r0, 0xF8
	bl PlaySE
	ldr r5, _0813E8C0 @ =gSpecialVar_ItemId
	ldrh r0, [r5]
	mov r2, r8
	ldrh r1, [r2, 0x10]
	bl RemoveBagItem
	ldr r7, _0813E8C4 @ =gSaveBlock1Ptr
	ldr r4, [r7]
	movs r3, 0xA4
	lsls r3, 2
	mov r10, r3
	add r4, r10
	ldrh r0, [r5]
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	mov r2, r8
	movs r3, 0x10
	ldrsh r1, [r2, r3]
	muls r1, r0
	adds r0, r4, 0
	bl AddMoney
	ldrh r0, [r5]
	mov r2, r8
	ldrh r1, [r2, 0x10]
	movs r2, 0x2
	bl sub_809C09C
	mov r3, r8
	ldrb r0, [r3]
	ldr r4, _0813E8C8 @ =gUnknown_203F37A
	subs r2, r4, 0x2
	adds r1, r4, 0
	bl DestroyListMenuTask
	bl sub_813D8AC
	bl sub_813D6F4
	bl sub_813D204
	ldr r0, _0813E8CC @ =gMultiuseListMenuTemplate
	subs r4, 0xA
	ldrh r1, [r4, 0xA]
	ldrh r2, [r4, 0x8]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	strh r0, [r1]
	movs r1, 0x2
	bl sub_813D4B0
	movs r0, 0x2
	bl sub_813EB10
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, [r7]
	add r0, r10
	bl GetMoney
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0
	bl PrintMoneyAmountInMoneyBox
	movs r2, 0x8
	negs r2, r2
	add r9, r2
	add r6, r9
	ldr r0, _0813E8D0 @ =sub_813E8D4
	str r0, [r6]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813E8BC: .4byte gTasks+0x8
_0813E8C0: .4byte gSpecialVar_ItemId
_0813E8C4: .4byte gSaveBlock1Ptr
_0813E8C8: .4byte gUnknown_203F37A
_0813E8CC: .4byte gMultiuseListMenuTemplate
_0813E8D0: .4byte sub_813E8D4
	thumb_func_end sub_813E7F0

	thumb_func_start sub_813E8D4
sub_813E8D4: @ 813E8D4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813E90C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0813E8EE
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0813E906
_0813E8EE:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
	bl sub_813EA98
	movs r0, 0x2
	bl PutWindowTilemap
	adds r0, r4, 0
	bl sub_813E2B8
_0813E906:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813E90C: .4byte gMain
	thumb_func_end sub_813E8D4

	thumb_func_start sub_813E910
sub_813E910: @ 813E910
	push {r4,lr}
	ldr r0, _0813E994 @ =gUnknown_84643B8
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xE0
	bl TextWindow_SetUserSelectedFrame
	movs r0, 0
	movs r1, 0x13
	movs r2, 0xD0
	bl TextWindow_LoadResourcesStdFrame0
	movs r0, 0
	movs r1, 0xA
	movs r2, 0xC0
	bl TextWindow_SetStdFrame0_WithPal
	ldr r0, _0813E998 @ =gTMCaseMainWindowPalette
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	movs r4, 0
_0813E946:
	adds r0, r4, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0813E946
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	movs r4, 0
	ldr r3, _0813E99C @ =gUnknown_203F38C
	movs r2, 0xFF
_0813E97C:
	adds r0, r4, r3
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xD
	bls _0813E97C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813E994: .4byte gUnknown_84643B8
_0813E998: .4byte gTMCaseMainWindowPalette
_0813E99C: .4byte gUnknown_203F38C
	thumb_func_end sub_813E910

	thumb_func_start sub_813E9A0
sub_813E9A0: @ 813E9A0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	mov r9, r3
	ldr r3, [sp, 0x30]
	ldr r4, [sp, 0x34]
	ldr r6, [sp, 0x38]
	ldr r5, [sp, 0x3C]
	mov r8, r5
	ldr r5, [sp, 0x40]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r7, r9
	lsls r7, 24
	lsrs r7, 24
	mov r9, r7
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 24
	lsrs r5, 24
	str r4, [sp]
	str r6, [sp, 0x4]
	lsls r4, r5, 1
	adds r4, r5
	ldr r5, _0813EA04 @ =gUnknown_8464448
	adds r4, r5
	str r4, [sp, 0x8]
	mov r4, r8
	lsls r4, 24
	asrs r4, 24
	str r4, [sp, 0xC]
	str r2, [sp, 0x10]
	mov r2, r9
	bl AddTextPrinterParameterized4
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813EA04: .4byte gUnknown_8464448
	thumb_func_end sub_813E9A0

	thumb_func_start sub_813EA08
sub_813EA08: @ 813EA08
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813EA4C @ =gUnknown_203F38C
	adds r5, r4, r0
	ldrb r0, [r5]
	cmp r0, 0xFF
	bne _0813EA6C
	lsls r0, r4, 3
	ldr r1, _0813EA50 @ =gUnknown_84643D8
	adds r0, r1
	bl AddWindow
	strb r0, [r5]
	cmp r4, 0x2
	beq _0813EA38
	cmp r4, 0x6
	beq _0813EA38
	cmp r4, 0x7
	beq _0813EA38
	cmp r4, 0x8
	beq _0813EA38
	cmp r4, 0x9
	bne _0813EA54
_0813EA38:
	ldr r0, _0813EA4C @ =gUnknown_203F38C
	adds r0, r4, r0
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0xC
	bl DrawStdFrameWithCustomTileAndPalette
	b _0813EA60
	.align 2, 0
_0813EA4C: .4byte gUnknown_203F38C
_0813EA50: .4byte gUnknown_84643D8
_0813EA54:
	ldrb r0, [r5]
	movs r1, 0
	movs r2, 0x1
	movs r3, 0xE
	bl DrawStdFrameWithCustomTileAndPalette
_0813EA60:
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	ldr r0, _0813EA74 @ =gUnknown_203F38C
	adds r0, r4, r0
	ldrb r0, [r0]
_0813EA6C:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0813EA74: .4byte gUnknown_203F38C
	thumb_func_end sub_813EA08

	thumb_func_start sub_813EA78
sub_813EA78: @ 813EA78
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813EA94 @ =gUnknown_203F38C
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0x1
	movs r3, 0xE
	bl DrawStdFrameWithCustomTileAndPalette
	pop {r0}
	bx r0
	.align 2, 0
_0813EA94: .4byte gUnknown_203F38C
	thumb_func_end sub_813EA78

	thumb_func_start sub_813EA98
sub_813EA98: @ 813EA98
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0813EAC8 @ =gUnknown_203F38C
	adds r4, r0
	ldrb r0, [r4]
	movs r1, 0
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	movs r0, 0xFF
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813EAC8: .4byte gUnknown_203F38C
	thumb_func_end sub_813EA98

	thumb_func_start sub_813EACC
sub_813EACC: @ 813EACC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813EB0C @ =gUnknown_203F38C
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _0813EB04
	movs r1, 0
	bl ClearDialogWindowAndFrameToTransparent
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	movs r0, 0xFF
	strb r0, [r4]
_0813EB04:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813EB0C: .4byte gUnknown_203F38C
	thumb_func_end sub_813EACC

	thumb_func_start sub_813EB10
sub_813EB10: @ 813EB10
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813EB1C @ =gUnknown_203F38C
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0813EB1C: .4byte gUnknown_203F38C
	thumb_func_end sub_813EB10

	thumb_func_start DisplayItemMessageInBerryPouch
DisplayItemMessageInBerryPouch: @ 813EB20
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r7, r2, 0
	mov r8, r3
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r4, _0813EB74 @ =gUnknown_203F38C
	ldrb r0, [r4, 0x5]
	cmp r0, 0xFF
	bne _0813EB44
	ldr r0, _0813EB78 @ =gUnknown_8464400
	bl AddWindow
	strb r0, [r4, 0x5]
_0813EB44:
	bl GetTextSpeedSetting
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4, 0x5]
	str r5, [sp]
	str r0, [sp, 0x4]
	str r7, [sp, 0x8]
	mov r0, r8
	str r0, [sp, 0xC]
	adds r0, r6, 0
	movs r2, 0x13
	movs r3, 0xD
	bl DisplayMessageAndContinueTask
	movs r0, 0x2
	bl ScheduleBgCopyTilemapToVram
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813EB74: .4byte gUnknown_203F38C
_0813EB78: .4byte gUnknown_8464400
	thumb_func_end DisplayItemMessageInBerryPouch

	thumb_func_start sub_813EB7C
sub_813EB7C: @ 813EB7C
	push {lr}
	sub sp, 0x10
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813EBA4 @ =gUnknown_84643F0
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x1
	str r2, [sp, 0x4]
	movs r2, 0xE
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	movs r2, 0x2
	movs r3, 0
	bl CreateYesNoMenuWithCallbacks
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_0813EBA4: .4byte gUnknown_84643F0
	thumb_func_end sub_813EB7C

	thumb_func_start sub_813EBA8
sub_813EBA8: @ 813EBA8
	push {lr}
	sub sp, 0x10
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813EBD0 @ =gUnknown_84643F8
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x1
	str r2, [sp, 0x4]
	movs r2, 0xE
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	movs r2, 0x2
	movs r3, 0
	bl CreateYesNoMenuWithCallbacks
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_0813EBD0: .4byte gUnknown_84643F8
	thumb_func_end sub_813EBA8

	thumb_func_start sub_813EBD4
sub_813EBD4: @ 813EBD4
	push {r4,lr}
	movs r0, 0x2
	bl sub_813EA08
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0813EC04 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	bl GetMoney
	adds r3, r0, 0
	adds r0, r4, 0
	movs r1, 0xA
	movs r2, 0xC
	bl PrintMoneyAmountInMoneyBoxWithBorder
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813EC04: .4byte gSaveBlock1Ptr
	thumb_func_end sub_813EBD4

	thumb_func_start sub_813EC08
sub_813EC08: @ 813EC08
	push {lr}
	ldr r0, _0813EC20 @ =gUnknown_84644B8
	movs r1, 0x28
	movs r2, 0x4C
	movs r3, 0
	bl CreateSprite
	ldr r1, _0813EC24 @ =gUnknown_203F39C
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0813EC20: .4byte gUnknown_84644B8
_0813EC24: .4byte gUnknown_203F39C
	thumb_func_end sub_813EC08

	thumb_func_start sub_813EC28
sub_813EC28: @ 813EC28
	push {r4,lr}
	ldr r0, _0813EC58 @ =gUnknown_203F39C
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0813EC5C @ =gSprites
	adds r4, r0, r1
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0813EC52
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r0, _0813EC60 @ =sub_813EC64
	str r0, [r4, 0x1C]
_0813EC52:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813EC58: .4byte gUnknown_203F39C
_0813EC5C: .4byte gSprites
_0813EC60: .4byte sub_813EC64
	thumb_func_end sub_813EC28

	thumb_func_start sub_813EC64
sub_813EC64: @ 813EC64
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0813EC80
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	ldr r0, _0813EC88 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_0813EC80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813EC88: .4byte SpriteCallbackDummy
	thumb_func_end sub_813EC64

	.align 2, 0 @ Don't pad with nop.
