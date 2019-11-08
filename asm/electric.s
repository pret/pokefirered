	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80ADBEC
sub_80ADBEC: @ 80ADBEC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080ADC0C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080ADC14
	ldr r0, _080ADC10 @ =gBattleAnimArgs
	ldrh r1, [r4, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r4, 0x20]
	b _080ADC20
	.align 2, 0
_080ADC0C: .4byte gBattleAnimAttacker
_080ADC10: .4byte gBattleAnimArgs
_080ADC14:
	ldr r1, _080ADC34 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	adds r0, r1, 0
_080ADC20:
	ldrh r0, [r0, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _080ADC38 @ =sub_80ADC3C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADC34: .4byte gBattleAnimArgs
_080ADC38: .4byte sub_80ADC3C
	thumb_func_end sub_80ADBEC

	thumb_func_start sub_80ADC3C
sub_80ADC3C: @ 80ADC3C
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080ADC52
	adds r0, r2, 0
	bl DestroyAnimSprite
_080ADC52:
	pop {r0}
	bx r0
	thumb_func_end sub_80ADC3C

	thumb_func_start sub_80ADC58
sub_80ADC58: @ 80ADC58
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080ADC78 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080ADC80
	ldr r0, _080ADC7C @ =gBattleAnimArgs
	ldrh r1, [r4, 0x20]
	ldrh r0, [r0]
	subs r1, r0
	strh r1, [r4, 0x20]
	b _080ADC8A
	.align 2, 0
_080ADC78: .4byte gBattleAnimAttacker
_080ADC7C: .4byte gBattleAnimArgs
_080ADC80:
	ldr r0, _080ADC94 @ =gBattleAnimArgs
	ldrh r0, [r0]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
_080ADC8A:
	ldr r0, _080ADC98 @ =sub_80ADC9C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADC94: .4byte gBattleAnimArgs
_080ADC98: .4byte sub_80ADC9C
	thumb_func_end sub_80ADC58

	thumb_func_start sub_80ADC9C
sub_80ADC9C: @ 80ADC9C
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080ADCB2
	adds r0, r2, 0
	bl DestroySpriteAndMatrix
_080ADCB2:
	pop {r0}
	bx r0
	thumb_func_end sub_80ADC9C

	thumb_func_start sub_80ADCB8
sub_80ADCB8: @ 80ADCB8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080ADCFC @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r0, _080ADD00 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080ADD08
	ldr r2, _080ADD04 @ =gBattleAnimArgs
	ldrh r0, [r5, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x22]
	ldrh r1, [r2, 0x2]
	subs r0, r1
	strh r0, [r5, 0x22]
	b _080ADD1C
	.align 2, 0
_080ADCFC: .4byte gBattleAnimTarget
_080ADD00: .4byte gBattleAnimAttacker
_080ADD04: .4byte gBattleAnimArgs
_080ADD08:
	ldr r0, _080ADD40 @ =gBattleAnimArgs
	ldrh r1, [r0]
	ldrh r2, [r5, 0x20]
	adds r1, r2
	strh r1, [r5, 0x20]
	ldrh r1, [r0, 0x2]
	ldrh r2, [r5, 0x22]
	adds r1, r2
	strh r1, [r5, 0x22]
	adds r2, r0, 0
_080ADD1C:
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldrh r0, [r2, 0x4]
	strh r0, [r5, 0x30]
	ldrh r0, [r2, 0x6]
	strh r0, [r5, 0x32]
	ldrh r0, [r2, 0x8]
	strh r0, [r5, 0x34]
	ldr r1, _080ADD44 @ =DestroySpriteAndMatrix
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080ADD48 @ =TranslateSpriteInCircleOverDuration
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ADD40: .4byte gBattleAnimArgs
_080ADD44: .4byte DestroySpriteAndMatrix
_080ADD48: .4byte TranslateSpriteInCircleOverDuration
	thumb_func_end sub_80ADCB8

	thumb_func_start sub_80ADD4C
sub_80ADD4C: @ 80ADD4C
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r0, _080ADD64 @ =gBattleAnimArgs
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	beq _080ADDC4
	cmp r0, 0x1
	bgt _080ADD68
	cmp r0, 0
	beq _080ADD72
	b _080ADDC4
	.align 2, 0
_080ADD64: .4byte gBattleAnimArgs
_080ADD68:
	cmp r0, 0x2
	beq _080ADD7C
	cmp r0, 0x3
	beq _080ADDA0
	b _080ADDC4
_080ADD72:
	ldr r0, _080ADD78 @ =gBattleAnimAttacker
	b _080ADDC6
	.align 2, 0
_080ADD78: .4byte gBattleAnimAttacker
_080ADD7C:
	ldr r4, _080ADD94 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r6, 0x2
	eors r0, r6
	bl IsBattlerSpriteVisible
	lsls r0, 24
	cmp r0, 0
	bne _080ADD98
	ldrb r4, [r4]
	b _080ADDC8
	.align 2, 0
_080ADD94: .4byte gBattleAnimAttacker
_080ADD98:
	ldrb r0, [r4]
	adds r4, r6, 0
	eors r4, r0
	b _080ADDC8
_080ADDA0:
	ldr r0, _080ADDBC @ =gBattleAnimAttacker
	ldrb r0, [r0]
	movs r4, 0x2
	eors r0, r4
	bl IsBattlerSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080ADDC4
	ldr r0, _080ADDC0 @ =gBattleAnimTarget
	ldrb r0, [r0]
	eors r4, r0
	b _080ADDC8
	.align 2, 0
_080ADDBC: .4byte gBattleAnimAttacker
_080ADDC0: .4byte gBattleAnimTarget
_080ADDC4:
	ldr r0, _080ADDE8 @ =gBattleAnimTarget
_080ADDC6:
	ldrb r4, [r0]
_080ADDC8:
	ldr r0, _080ADDEC @ =gBattleAnimArgs
	movs r2, 0xA
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _080ADDF0
	adds r0, r4, 0
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	adds r0, r4, 0
	movs r1, 0x1
	b _080ADE02
	.align 2, 0
_080ADDE8: .4byte gBattleAnimTarget
_080ADDEC: .4byte gBattleAnimArgs
_080ADDF0:
	adds r0, r4, 0
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	adds r0, r4, 0
	movs r1, 0x3
_080ADE02:
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r7, _080ADEA0 @ =gSineTable
	ldr r6, _080ADEA4 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r6, r1]
	lsls r0, 1
	adds r0, r7
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r2, 0x2
	ldrsh r0, [r6, r2]
	muls r0, r1
	asrs r0, 8
	strh r0, [r5, 0x24]
	movs r1, 0
	ldrsh r0, [r6, r1]
	adds r0, 0x40
	lsls r0, 1
	adds r0, r7
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r2, 0x2
	ldrsh r0, [r6, r2]
	muls r0, r1
	asrs r0, 8
	strh r0, [r5, 0x26]
	ldrh r1, [r6, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080ADE66
	adds r0, r4, 0
	bl GetBattlerSpriteBGPriority
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r5, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x5]
_080ADE66:
	ldrb r2, [r5, 0x3]
	lsls r2, 26
	lsrs r2, 27
	movs r0, 0x4
	ldrsh r1, [r6, r0]
	lsls r0, r1, 1
	adds r0, r7
	ldrh r0, [r0]
	ldr r3, _080ADEA8 @ =gOamMatrices
	lsls r2, 3
	adds r2, r3
	adds r1, 0x40
	lsls r1, 1
	adds r1, r7
	ldrh r1, [r1]
	strh r1, [r2, 0x6]
	strh r1, [r2]
	strh r0, [r2, 0x2]
	lsls r0, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r2, 0x4]
	ldrh r0, [r6, 0x6]
	strh r0, [r5, 0x2E]
	ldr r0, _080ADEAC @ =sub_80B1D3C
	str r0, [r5, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADEA0: .4byte gSineTable
_080ADEA4: .4byte gBattleAnimArgs
_080ADEA8: .4byte gOamMatrices
_080ADEAC: .4byte sub_80B1D3C
	thumb_func_end sub_80ADD4C

	thumb_func_start sub_80ADEB0
sub_80ADEB0: @ 80ADEB0
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl InitSpritePosToAnimAttacker
	ldr r5, _080ADF24 @ =gBattleAnimArgs
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldr r6, _080ADF28 @ =gBattleAnimTarget
	ldrb r0, [r6]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldrb r0, [r6]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl InitAnimLinearTranslation
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x38]
	ldrh r0, [r5, 0xA]
	strh r0, [r4, 0x3A]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x3C]
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	lsls r0, 2
	adds r1, r0
	ldr r3, _080ADF2C @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080ADF30 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	ldr r1, _080ADF34 @ =sub_80ADF38
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ADF24: .4byte gBattleAnimArgs
_080ADF28: .4byte gBattleAnimTarget
_080ADF2C: .4byte 0x000003ff
_080ADF30: .4byte 0xfffffc00
_080ADF34: .4byte sub_80ADF38
	thumb_func_end sub_80ADEB0

	thumb_func_start sub_80ADF38
sub_80ADF38: @ 80ADF38
	push {r4,lr}
	adds r4, r0, 0
	bl AnimTranslateLinear
	lsls r0, 24
	cmp r0, 0
	bne _080ADFA2
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	ldrh r2, [r4, 0x3C]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3C]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _080ADFA8
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _080ADFA8
_080ADFA2:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080ADFA8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80ADF38

	thumb_func_start sub_80ADFB0
sub_80ADFB0: @ 80ADFB0
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x38]
	subs r0, 0x1
	strh r0, [r3, 0x38]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080ADFE8
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x36]
	strh r0, [r3, 0x38]
_080ADFE8:
	ldrh r0, [r3, 0x34]
	subs r1, r0, 0x1
	strh r1, [r3, 0x34]
	lsls r0, 16
	cmp r0, 0
	bgt _080ADFFA
	adds r0, r3, 0
	bl DestroyAnimSprite
_080ADFFA:
	pop {r0}
	bx r0
	thumb_func_end sub_80ADFB0

	thumb_func_start sub_80AE000
sub_80AE000: @ 80AE000
	push {r4-r6,lr}
	adds r6, r0, 0
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080AE01C
	ldr r0, _080AE060 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080AE024
_080AE01C:
	ldr r1, _080AE064 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080AE024:
	ldr r5, _080AE060 @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	ldr r4, _080AE064 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x22]
	ldrh r0, [r4]
	strh r0, [r6, 0x34]
	ldrh r0, [r4, 0x6]
	strh r0, [r6, 0x36]
	strh r0, [r6, 0x38]
	ldr r0, _080AE068 @ =sub_80ADFB0
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AE060: .4byte gBattleAnimTarget
_080AE064: .4byte gBattleAnimArgs
_080AE068: .4byte sub_80ADFB0
	thumb_func_end sub_80AE000

	thumb_func_start sub_80AE06C
sub_80AE06C: @ 80AE06C
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r1, _080AE088 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x2E]
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080AE090
	ldr r0, _080AE08C @ =gBattleAnimTarget
	b _080AE092
	.align 2, 0
_080AE088: .4byte gBattleAnimArgs
_080AE08C: .4byte gBattleAnimTarget
_080AE090:
	ldr r0, _080AE118 @ =gBattleAnimAttacker
_080AE092:
	ldrb r6, [r0]
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080AE0AA
	adds r0, r6, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080AE0B2
_080AE0AA:
	ldr r1, _080AE11C @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080AE0B2:
	adds r0, r6, 0
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	ldr r4, _080AE11C @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r3, [r4]
	adds r0, r3
	strh r0, [r5, 0x20]
	adds r0, r6, 0
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r5, 0x22]
	ldrh r1, [r4, 0xE]
	ldr r0, _080AE120 @ =0x00007fff
	ands r0, r1
	strh r0, [r5, 0x36]
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x38]
	ldrh r0, [r4, 0xA]
	strh r0, [r5, 0x3A]
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x3C]
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	lsls r0, 2
	adds r1, r0
	ldr r3, _080AE124 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080AE128 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldr r1, _080AE12C @ =sub_80AE130
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AE118: .4byte gBattleAnimAttacker
_080AE11C: .4byte gBattleAnimArgs
_080AE120: .4byte 0x00007fff
_080AE124: .4byte 0x000003ff
_080AE128: .4byte 0xfffffc00
_080AE12C: .4byte sub_80AE130
	thumb_func_end sub_80AE06C

	thumb_func_start sub_80AE130
sub_80AE130: @ 80AE130
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x3C]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3C]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, 0
	bne _080AE186
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080AE186:
	ldrh r0, [r4, 0x2E]
	subs r1, r0, 0x1
	strh r1, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bgt _080AE198
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AE198:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AE130

	thumb_func_start sub_80AE1A0
sub_80AE1A0: @ 80AE1A0
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0
	bl InitSpritePosToAnimTarget
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	ldr r3, _080AE1DC @ =gBattleAnimArgs
	movs r5, 0x6
	ldrsh r0, [r3, r5]
	lsls r0, 2
	adds r1, r0
	ldr r5, _080AE1E0 @ =0x000003ff
	adds r0, r5, 0
	ands r1, r0
	ldr r0, _080AE1E4 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	movs r1, 0x6
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	bne _080AE1E8
	ldrb r0, [r4, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	b _080AE1F6
	.align 2, 0
_080AE1DC: .4byte gBattleAnimArgs
_080AE1E0: .4byte 0x000003ff
_080AE1E4: .4byte 0xfffffc00
_080AE1E8:
	cmp r0, 0x2
	bne _080AE1FA
	ldrb r0, [r4, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x20
_080AE1F6:
	orrs r1, r0
	strb r1, [r4, 0x3]
_080AE1FA:
	ldr r0, _080AE214 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldr r0, _080AE218 @ =WaitAnimForDuration
	str r0, [r4, 0x1C]
	ldr r1, _080AE21C @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AE214: .4byte gBattleAnimArgs
_080AE218: .4byte WaitAnimForDuration
_080AE21C: .4byte DestroyAnimSprite
	thumb_func_end sub_80AE1A0

	thumb_func_start sub_80AE220
sub_80AE220: @ 80AE220
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _080AE268 @ =gBattleAnimTarget
	ldrb r0, [r6]
	movs r1, 0
	bl GetBattlerSpriteCoord
	ldr r1, _080AE26C @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r1
	lsls r0, 24
	ldr r5, _080AE270 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r5]
	adds r0, r1
	strh r0, [r4, 0x8]
	ldrb r0, [r6]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x2]
	adds r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0xC]
	ldr r0, _080AE274 @ =sub_80AE278
	str r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AE268: .4byte gBattleAnimTarget
_080AE26C: .4byte gTasks
_080AE270: .4byte gBattleAnimArgs
_080AE274: .4byte sub_80AE278
	thumb_func_end sub_80AE220

	thumb_func_start sub_80AE278
sub_80AE278: @ 80AE278
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r5, 0
	movs r7, 0
	ldr r1, _080AE2B8 @ =gTasks
	lsls r0, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	ldrb r2, [r0, 0xC]
	str r2, [sp]
	ldrh r4, [r0, 0x8]
	ldrh r6, [r0, 0xA]
	movs r3, 0xC
	ldrsh r0, [r0, r3]
	mov r10, r1
	cmp r0, 0
	bne _080AE2BC
	movs r0, 0
	mov r8, r0
	movs r2, 0x1
	movs r1, 0x10
	mov r12, r1
	b _080AE2C6
	.align 2, 0
_080AE2B8: .4byte gTasks
_080AE2BC:
	movs r2, 0x10
	mov r12, r2
	movs r3, 0x8
	mov r8, r3
	movs r2, 0x4
_080AE2C6:
	mov r0, r9
	lsls r1, r0, 2
	adds r0, r1, r0
	lsls r0, 3
	add r0, r10
	movs r3, 0x1C
	ldrsh r0, [r0, r3]
	mov r10, r1
	cmp r0, 0xA
	bhi _080AE3BC
	lsls r0, 2
	ldr r1, _080AE2E4 @ =_080AE2E8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AE2E4: .4byte _080AE2E8
	.align 2, 0
_080AE2E8:
	.4byte _080AE314
	.4byte _080AE3BC
	.4byte _080AE328
	.4byte _080AE3BC
	.4byte _080AE348
	.4byte _080AE3BC
	.4byte _080AE35E
	.4byte _080AE3BC
	.4byte _080AE380
	.4byte _080AE3BC
	.4byte _080AE3B4
_080AE314:
	ldr r0, _080AE324 @ =gUnknown_83E60A0
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	mov r4, r12
	lsls r3, r4, 16
	b _080AE396
	.align 2, 0
_080AE324: .4byte gUnknown_83E60A0
_080AE328:
	mov r0, r12
	lsls r3, r0, 17
	mov r1, r8
	adds r0, r1, r2
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _080AE344 @ =gUnknown_83E60A0
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	b _080AE396
	.align 2, 0
_080AE344: .4byte gUnknown_83E60A0
_080AE348:
	mov r3, r12
	lsls r0, r3, 16
	asrs r0, 16
	lsls r3, r0, 1
	adds r3, r0
	lsls r0, r2, 1
	add r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	b _080AE38A
_080AE35E:
	mov r0, r12
	lsls r3, r0, 18
	lsls r0, r2, 1
	adds r0, r2
	add r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _080AE37C @ =gUnknown_83E60A0
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	b _080AE396
	.align 2, 0
_080AE37C: .4byte gUnknown_83E60A0
_080AE380:
	mov r1, r12
	lsls r0, r1, 16
	asrs r0, 16
	lsls r3, r0, 2
	adds r3, r0
_080AE38A:
	ldr r0, _080AE3B0 @ =gUnknown_83E60A0
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	lsls r3, 16
_080AE396:
	asrs r3, 16
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	b _080AE3BC
	.align 2, 0
_080AE3B0: .4byte gUnknown_83E60A0
_080AE3B4:
	mov r0, r9
	bl DestroyAnimVisualTask
	b _080AE400
_080AE3BC:
	cmp r7, 0
	beq _080AE3F0
	ldr r4, _080AE410 @ =gSprites
	lsls r3, r5, 4
	adds r3, r5
	lsls r3, 2
	adds r0, r3, r4
	ldrh r5, [r0, 0x4]
	lsls r2, r5, 22
	lsrs r2, 22
	add r2, r8
	ldr r6, _080AE414 @ =0x000003ff
	adds r1, r6, 0
	ands r2, r1
	ldr r1, _080AE418 @ =0xfffffc00
	ands r1, r5
	orrs r1, r2
	strh r1, [r0, 0x4]
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r0, 0x2E]
	adds r4, 0x1C
	adds r3, r4
	ldr r1, [r3]
	bl _call_via_r1
_080AE3F0:
	ldr r0, _080AE41C @ =gTasks
	mov r1, r10
	add r1, r9
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1C]
	adds r0, 0x1
	strh r0, [r1, 0x1C]
_080AE400:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE410: .4byte gSprites
_080AE414: .4byte 0x000003ff
_080AE418: .4byte 0xfffffc00
_080AE41C: .4byte gTasks
	thumb_func_end sub_80AE278

	thumb_func_start sub_80AE420
sub_80AE420: @ 80AE420
	push {lr}
	adds r3, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080AE442
	ldrb r1, [r3, 0x1]
	movs r2, 0x3F
	adds r0, r2, 0
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r3, 0x1]
	ldrb r0, [r3, 0x3]
	ands r2, r0
	strb r2, [r3, 0x3]
	b _080AE456
_080AE442:
	ldrb r2, [r3, 0x1]
	movs r1, 0x3F
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3, 0x1]
	ldrb r0, [r3, 0x3]
	ands r1, r0
	movs r0, 0x40
	orrs r1, r0
	strb r1, [r3, 0x3]
_080AE456:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bne _080AE46A
	adds r0, r3, 0
	bl DestroySprite
_080AE46A:
	pop {r0}
	bx r0
	thumb_func_end sub_80AE420

	thumb_func_start sub_80AE470
sub_80AE470: @ 80AE470
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r0, _080AE4D8 @ =gBattleAnimArgs
	ldrh r1, [r0]
	ldrh r2, [r4, 0x20]
	adds r1, r2
	strh r1, [r4, 0x20]
	ldrh r0, [r0, 0x2]
	ldrh r3, [r4, 0x22]
	adds r0, r3
	strh r0, [r4, 0x22]
	ldr r0, _080AE4DC @ =gUnknown_83E60B8
	adds r1, 0x20
	lsls r1, 16
	asrs r1, 16
	movs r7, 0x22
	ldrsh r2, [r4, r7]
	adds r3, r4, 0
	adds r3, 0x43
	ldrb r3, [r3]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080AE4E0 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r6, r2, r3
	ldrh r5, [r6, 0x4]
	lsls r1, r5, 22
	lsrs r1, 22
	adds r1, 0x8
	ldr r7, _080AE4E4 @ =0x000003ff
	adds r0, r7, 0
	ands r1, r0
	ldr r0, _080AE4E8 @ =0xfffffc00
	ands r0, r5
	orrs r0, r1
	strh r0, [r6, 0x4]
	ldr r1, _080AE4EC @ =gAnimVisualTaskCount
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	adds r3, 0x1C
	adds r2, r3
	ldr r0, _080AE4F0 @ =sub_80AE4F4
	str r0, [r2]
	str r0, [r4, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE4D8: .4byte gBattleAnimArgs
_080AE4DC: .4byte gUnknown_83E60B8
_080AE4E0: .4byte gSprites
_080AE4E4: .4byte 0x000003ff
_080AE4E8: .4byte 0xfffffc00
_080AE4EC: .4byte gAnimVisualTaskCount
_080AE4F0: .4byte sub_80AE4F4
	thumb_func_end sub_80AE470

	thumb_func_start sub_80AE4F4
sub_80AE4F4: @ 80AE4F4
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080AE528
	movs r0, 0
	strh r0, [r3, 0x2E]
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
_080AE528:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _080AE53C
	adds r0, r3, 0
	bl DestroyAnimSprite
_080AE53C:
	pop {r0}
	bx r0
	thumb_func_end sub_80AE4F4

	thumb_func_start sub_80AE540
sub_80AE540: @ 80AE540
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080AE560 @ =gTasks
	adds r5, r1, r0
	ldr r0, _080AE564 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080AE56C
	ldr r4, _080AE568 @ =gBattleAnimAttacker
	b _080AE56E
	.align 2, 0
_080AE560: .4byte gTasks
_080AE564: .4byte gBattleAnimArgs
_080AE568: .4byte gBattleAnimAttacker
_080AE56C:
	ldr r4, _080AE5B0 @ =gBattleAnimTarget
_080AE56E:
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x24]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x26]
	ldr r2, _080AE5B4 @ =gBattleAnimArgs
	ldrh r0, [r2, 0x2]
	movs r1, 0
	strh r0, [r5, 0x14]
	strh r1, [r5, 0x16]
	strh r1, [r5, 0x18]
	strh r1, [r5, 0x1A]
	strh r1, [r5, 0x1C]
	ldrh r0, [r2, 0x6]
	strh r0, [r5, 0x1E]
	strh r1, [r5, 0x20]
	ldrh r0, [r2, 0x4]
	strh r0, [r5, 0x22]
	ldr r0, _080AE5B8 @ =sub_80AE5BC
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AE5B0: .4byte gBattleAnimTarget
_080AE5B4: .4byte gBattleAnimArgs
_080AE5B8: .4byte sub_80AE5BC
	thumb_func_end sub_80AE540

	thumb_func_start sub_80AE5BC
sub_80AE5BC: @ 80AE5BC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	adds r2, r6, 0
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080AE6A4 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080AE6BC
	ldrh r0, [r5, 0x20]
	adds r0, 0x1
	movs r7, 0
	strh r0, [r5, 0x20]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x22
	ldrsh r1, [r5, r2]
	cmp r0, r1
	ble _080AE6CA
	strh r7, [r5, 0x20]
	ldr r0, _080AE6A8 @ =gUnknown_83E6120
	movs r3, 0x24
	ldrsh r1, [r5, r3]
	movs r3, 0x26
	ldrsh r2, [r5, r3]
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080AE6CA
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080AE6AC @ =gSprites
	adds r4, r0
	ldr r1, _080AE6B0 @ =gUnknown_83E60D0
	movs r2, 0x1A
	ldrsh r0, [r5, r2]
	lsls r0, 1
	adds r0, r1
	movs r3, 0
	ldrsb r3, [r0, r3]
	ldrh r0, [r4, 0x20]
	adds r3, r0
	strh r3, [r4, 0x20]
	movs r2, 0x1A
	ldrsh r0, [r5, r2]
	lsls r0, 1
	adds r1, 0x1
	adds r0, r1
	movs r2, 0
	ldrsb r2, [r0, r2]
	ldrh r0, [r4, 0x22]
	adds r2, r0
	strh r2, [r4, 0x22]
	movs r1, 0x18
	ldrsh r0, [r5, r1]
	lsls r1, r0, 2
	adds r1, r0
	movs r0, 0x28
	subs r0, r1
	strh r0, [r4, 0x2E]
	strh r3, [r4, 0x30]
	ldrh r0, [r5, 0x24]
	strh r0, [r4, 0x32]
	strh r2, [r4, 0x34]
	ldrh r0, [r5, 0x26]
	strh r0, [r4, 0x36]
	strh r6, [r4, 0x38]
	adds r0, r4, 0
	bl InitAnimLinearTranslation
	ldr r1, _080AE6B4 @ =sub_80AE704
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080AE6B8 @ =RunStoredCallbackWhenAnimEnds
	str r0, [r4, 0x1C]
	ldrh r0, [r5, 0x1A]
	adds r0, 0x1
	strh r0, [r5, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _080AE674
	strh r7, [r5, 0x1A]
_080AE674:
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x1E
	ldrsh r1, [r5, r2]
	cmp r0, r1
	blt _080AE696
	strh r7, [r5, 0x1C]
	ldrh r1, [r5, 0x18]
	movs r3, 0x18
	ldrsh r0, [r5, r3]
	cmp r0, 0x5
	bgt _080AE696
	adds r0, r1, 0x1
	strh r0, [r5, 0x18]
_080AE696:
	ldrh r0, [r5, 0x16]
	adds r0, 0x1
	strh r0, [r5, 0x16]
	ldrh r0, [r5, 0x14]
	subs r0, 0x1
	strh r0, [r5, 0x14]
	b _080AE6CA
	.align 2, 0
_080AE6A4: .4byte gTasks
_080AE6A8: .4byte gUnknown_83E6120
_080AE6AC: .4byte gSprites
_080AE6B0: .4byte gUnknown_83E60D0
_080AE6B4: .4byte sub_80AE704
_080AE6B8: .4byte RunStoredCallbackWhenAnimEnds
_080AE6BC:
	movs r1, 0x16
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080AE6CA
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080AE6CA:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80AE5BC

	thumb_func_start sub_80AE6D0
sub_80AE6D0: @ 80AE6D0
	push {r4,lr}
	adds r4, r0, 0
	bl AnimTranslateLinear
	lsls r0, 24
	cmp r0, 0
	beq _080AE6F8
	ldr r2, _080AE700 @ =gTasks
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x16]
	subs r1, 0x1
	strh r1, [r0, 0x16]
	adds r0, r4, 0
	bl DestroySprite
_080AE6F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE700: .4byte gTasks
	thumb_func_end sub_80AE6D0

	thumb_func_start sub_80AE704
sub_80AE704: @ 80AE704
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _080AE718 @ =sub_80AE6D0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE718: .4byte sub_80AE6D0
	thumb_func_end sub_80AE704

	thumb_func_start sub_80AE71C
sub_80AE71C: @ 80AE71C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080AE730 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080AE738
	ldr r4, _080AE734 @ =gBattleAnimAttacker
	b _080AE73A
	.align 2, 0
_080AE730: .4byte gBattleAnimArgs
_080AE734: .4byte gBattleAnimAttacker
_080AE738:
	ldr r4, _080AE768 @ =gBattleAnimTarget
_080AE73A:
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r1, _080AE76C @ =DestroySpriteAndMatrix
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080AE770 @ =RunStoredCallbackWhenAffineAnimEnds
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AE768: .4byte gBattleAnimTarget
_080AE76C: .4byte DestroySpriteAndMatrix
_080AE770: .4byte RunStoredCallbackWhenAffineAnimEnds
	thumb_func_end sub_80AE71C

	thumb_func_start sub_80AE774
sub_80AE774: @ 80AE774
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080AE788 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080AE790
	ldr r4, _080AE78C @ =gBattleAnimAttacker
	b _080AE792
	.align 2, 0
_080AE788: .4byte gBattleAnimArgs
_080AE78C: .4byte gBattleAnimAttacker
_080AE790:
	ldr r4, _080AE7CC @ =gBattleAnimTarget
_080AE792:
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r1, _080AE7D0 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x24]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x26]
	ldr r1, _080AE7D4 @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080AE7D8 @ =RunStoredCallbackWhenAnimEnds
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AE7CC: .4byte gBattleAnimTarget
_080AE7D0: .4byte gBattleAnimArgs
_080AE7D4: .4byte DestroyAnimSprite
_080AE7D8: .4byte RunStoredCallbackWhenAnimEnds
	thumb_func_end sub_80AE774

	thumb_func_start sub_80AE7DC
sub_80AE7DC: @ 80AE7DC
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r4, _080AE834 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	movs r0, 0
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x3A]
	movs r0, 0x10
	strh r0, [r5, 0x3C]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080AE82A
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	negs r0, r0
	strh r0, [r5, 0x3C]
_080AE82A:
	ldr r0, _080AE838 @ =sub_80AE83C
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AE834: .4byte gBattleAnimAttacker
_080AE838: .4byte sub_80AE83C
	thumb_func_end sub_80AE7DC

	thumb_func_start sub_80AE83C
sub_80AE83C: @ 80AE83C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080AE84E
	cmp r0, 0x1
	beq _080AE864
	b _080AE894
_080AE84E:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x28
	ble _080AE894
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080AE894
_080AE864:
	ldrh r2, [r4, 0x3C]
	ldrh r1, [r4, 0x20]
	adds r0, r2, r1
	strh r0, [r4, 0x20]
	ldr r3, _080AE89C @ =gSprites
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x24]
	adds r2, r1
	strh r2, [r0, 0x24]
	ldrh r0, [r4, 0x20]
	adds r0, 0x50
	lsls r0, 16
	movs r1, 0xC8
	lsls r1, 17
	cmp r0, r1
	bls _080AE894
	adds r0, r4, 0
	bl DestroySpriteAndMatrix
_080AE894:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE89C: .4byte gSprites
	thumb_func_end sub_80AE83C

	thumb_func_start sub_80AE8A0
sub_80AE8A0: @ 80AE8A0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _080AE8C4 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080AE934
	cmp r0, 0x1
	bgt _080AE8C8
	cmp r0, 0
	beq _080AE8D4
	b _080AEA04
	.align 2, 0
_080AE8C4: .4byte gTasks
_080AE8C8:
	cmp r0, 0x2
	beq _080AE990
	cmp r0, 0x3
	bne _080AE8D2
	b _080AE9E4
_080AE8D2:
	b _080AEA04
_080AE8D4:
	movs r0, 0
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	strh r0, [r5, 0x26]
	ldr r4, _080AE908 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x24]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080AE910
	ldr r0, _080AE90C @ =0x0000ffe0
	strh r0, [r5, 0x24]
	movs r0, 0x2
	b _080AE916
	.align 2, 0
_080AE908: .4byte gBattleAnimAttacker
_080AE90C: .4byte 0x0000ffe0
_080AE910:
	movs r0, 0x20
	strh r0, [r5, 0x24]
	ldr r0, _080AE92C @ =0x0000fffe
_080AE916:
	strh r0, [r5, 0x22]
	ldr r2, _080AE930 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r5, 0x24]
	strh r1, [r0, 0x24]
	b _080AE9D6
	.align 2, 0
_080AE92C: .4byte 0x0000fffe
_080AE930: .4byte gSprites
_080AE934:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080AEA04
	movs r0, 0
	strh r0, [r5, 0xA]
	ldr r4, _080AE98C @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	adds r2, 0x3E
	ldrb r3, [r2]
	lsls r0, r3, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrh r1, [r5, 0x24]
	movs r2, 0x24
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080AE9D6
	ldrh r2, [r5, 0x22]
	adds r2, r1, r2
	strh r2, [r5, 0x24]
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r2, [r0, 0x24]
	b _080AEA04
	.align 2, 0
_080AE98C: .4byte gSprites
_080AE990:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080AEA04
	movs r0, 0
	strh r0, [r5, 0xA]
	ldr r1, _080AE9E0 @ =gSprites
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	adds r2, 0x3E
	ldrb r3, [r2]
	lsls r0, r3, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bne _080AEA04
_080AE9D6:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080AEA04
	.align 2, 0
_080AE9E0: .4byte gSprites
_080AE9E4:
	ldr r2, _080AEA0C @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	adds r0, r3, 0
	bl DestroyAnimVisualTask
_080AEA04:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AEA0C: .4byte gSprites
	thumb_func_end sub_80AE8A0

	thumb_func_start sub_80AEA10
sub_80AEA10: @ 80AEA10
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080AEA34 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080AEA2A
	b _080AEB50
_080AEA2A:
	cmp r0, 0x1
	bgt _080AEA38
	cmp r0, 0
	beq _080AEA40
	b _080AEB92
	.align 2, 0
_080AEA34: .4byte gTasks
_080AEA38:
	cmp r0, 0x2
	bne _080AEA3E
	b _080AEB84
_080AEA3E:
	b _080AEB92
_080AEA40:
	ldr r4, _080AEA80 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _080AEA56
	movs r1, 0x1
_080AEA56:
	movs r6, 0
	strh r1, [r5, 0xA]
	ldr r0, _080AEA84 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r2, [r0, r1]
	adds r3, r0, 0
	cmp r2, 0
	beq _080AEA8C
	cmp r2, 0x4
	beq _080AEAB4
	ldrh r1, [r3]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AEAEC
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r5, 0xE]
	ldr r0, _080AEA88 @ =0x0000fff0
	b _080AEAF4
	.align 2, 0
_080AEA80: .4byte gBattleAnimAttacker
_080AEA84: .4byte gBattleAnimArgs
_080AEA88: .4byte 0x0000fff0
_080AEA8C:
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xE]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x12]
	movs r2, 0xA
	ldrsh r0, [r5, r2]
	lsls r0, 7
	adds r0, 0x78
	strh r0, [r5, 0x10]
	b _080AEB2A
_080AEAB4:
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r1, 7
	movs r0, 0x78
	subs r0, r1
	strh r0, [r5, 0xE]
	ldr r4, _080AEAE8 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x12]
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0xA
	ldrsh r1, [r5, r2]
	lsls r1, 5
	subs r0, r1
	strh r0, [r5, 0x10]
	b _080AEB2A
	.align 2, 0
_080AEAE8: .4byte gBattleAnimTarget
_080AEAEC:
	ldr r0, _080AEB10 @ =0x0000fff0
	strh r0, [r5, 0xE]
	movs r0, 0x80
	lsls r0, 1
_080AEAF4:
	strh r0, [r5, 0x10]
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080AEB14
	movs r2, 0
	ldrsh r0, [r3, r2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 1
	movs r0, 0x50
	subs r0, r1
	strh r0, [r5, 0x12]
	b _080AEB2A
	.align 2, 0
_080AEB10: .4byte 0x0000fff0
_080AEB14:
	movs r0, 0
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	adds r0, 0x28
	strh r0, [r5, 0x12]
	ldrh r1, [r5, 0xE]
	ldrh r0, [r5, 0x10]
	strh r0, [r5, 0xE]
	strh r1, [r5, 0x10]
_080AEB2A:
	movs r2, 0xE
	ldrsh r1, [r5, r2]
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bge _080AEB40
	movs r1, 0
	movs r0, 0x1
	strh r0, [r5, 0xA]
	strh r1, [r5, 0x14]
	b _080AEB7C
_080AEB40:
	ldr r0, _080AEB4C @ =0x0000ffff
	strh r0, [r5, 0xA]
	movs r0, 0x3
	strh r0, [r5, 0x14]
	b _080AEB7C
	.align 2, 0
_080AEB4C: .4byte 0x0000ffff
_080AEB50:
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	cmp r0, 0
	ble _080AEB92
	movs r0, 0
	strh r0, [r5, 0xC]
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80AEB98
	lsls r0, 24
	cmp r0, 0
	bne _080AEB7C
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80AEB98
	lsls r0, 24
	cmp r0, 0
	beq _080AEB92
_080AEB7C:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080AEB92
_080AEB84:
	movs r1, 0x16
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080AEB92
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080AEB92:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80AEA10

	thumb_func_start sub_80AEB98
sub_80AEB98: @ 80AEB98
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _080AEC24 @ =gUnknown_83E6278
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	movs r3, 0x12
	ldrsh r2, [r4, r3]
	movs r3, 0x23
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080AEBCE
	ldr r1, _080AEC28 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	strh r5, [r0, 0x3A]
	movs r1, 0x7
	strh r1, [r0, 0x3C]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
_080AEBCE:
	ldrh r1, [r4, 0xA]
	ldrh r5, [r4, 0x14]
	adds r0, r1, r5
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	bge _080AEBE0
	movs r0, 0x3
	strh r0, [r4, 0x14]
_080AEBE0:
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	ble _080AEBEC
	movs r0, 0
	strh r0, [r4, 0x14]
_080AEBEC:
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	lsls r0, 4
	ldrh r5, [r4, 0xE]
	adds r2, r0, r5
	strh r2, [r4, 0xE]
	lsls r0, r1, 16
	asrs r3, r0, 16
	cmp r3, 0x1
	bne _080AEC0C
	lsls r0, r2, 16
	asrs r0, 16
	movs r5, 0x10
	ldrsh r1, [r4, r5]
	cmp r0, r1
	bge _080AEC20
_080AEC0C:
	movs r0, 0x1
	negs r0, r0
	cmp r3, r0
	bne _080AEC2C
	lsls r0, r2, 16
	asrs r0, 16
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bgt _080AEC2C
_080AEC20:
	movs r0, 0x1
	b _080AEC2E
	.align 2, 0
_080AEC24: .4byte gUnknown_83E6278
_080AEC28: .4byte gSprites
_080AEC2C:
	movs r0, 0
_080AEC2E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80AEB98

	thumb_func_start sub_80AEC34
sub_80AEC34: @ 80AEC34
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080AEC74
	ldr r3, _080AEC7C @ =gTasks
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x3A
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_080AEC74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AEC7C: .4byte gTasks
	thumb_func_end sub_80AEC34

	thumb_func_start sub_80AEC80
sub_80AEC80: @ 80AEC80
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080AEC92
	cmp r0, 0x1
	beq _080AECC4
	b _080AECD8
_080AEC92:
	ldr r4, _080AECC0 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	adds r0, r5, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080AECD8
	.align 2, 0
_080AECC0: .4byte gBattleAnimAttacker
_080AECC4:
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080AECD8
	adds r0, r5, 0
	bl DestroySpriteAndMatrix
_080AECD8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80AEC80

	thumb_func_start sub_80AECE0
sub_80AECE0: @ 80AECE0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080AED04 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x4
	bls _080AECFA
	b _080AEE6C
_080AECFA:
	lsls r0, 2
	ldr r1, _080AED08 @ =_080AED0C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AED04: .4byte gTasks
_080AED08: .4byte _080AED0C
	.align 2, 0
_080AED0C:
	.4byte _080AED20
	.4byte _080AEDB0
	.4byte _080AEDEC
	.4byte _080AEE48
	.4byte _080AEE58
_080AED20:
	ldr r4, _080AEDA4 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x14]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x16]
	movs r0, 0x4
	strh r0, [r5, 0x18]
	ldr r0, _080AEDA8 @ =gBattleAnimTarget
	ldrb r0, [r0]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x1C]
	movs r2, 0x1C
	ldrsh r0, [r5, r2]
	movs r2, 0x14
	ldrsh r1, [r5, r2]
	subs r0, r1
	movs r1, 0x5
	bl __divsi3
	strh r0, [r5, 0x1A]
	movs r0, 0x7
	strh r0, [r5, 0x10]
	ldr r0, _080AEDAC @ =0x0000ffff
	strh r0, [r5, 0x12]
	movs r0, 0xC
	strh r0, [r5, 0x1E]
	subs r0, 0x4C
	bl BattleAnimAdjustPanning
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0x20]
	movs r0, 0x3F
	bl BattleAnimAdjustPanning
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0x22]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x24]
	movs r1, 0x22
	ldrsh r0, [r5, r1]
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	subs r0, r1
	movs r1, 0x3
	bl __divsi3
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	b _080AEE6A
	.align 2, 0
_080AEDA4: .4byte gBattleAnimAttacker
_080AEDA8: .4byte gBattleAnimTarget
_080AEDAC: .4byte 0x0000ffff
_080AEDB0:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	cmp r0, 0
	ble _080AEDE0
	movs r0, 0
	strh r0, [r5, 0xA]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80AEE74
	lsls r0, 24
	cmp r0, 0
	beq _080AEDE0
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	cmp r0, 0x5
	bne _080AEDDA
	movs r0, 0x3
	b _080AEDDE
_080AEDDA:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
_080AEDDE:
	strh r0, [r5, 0x8]
_080AEDE0:
	ldrh r1, [r5, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080AEE6C
	b _080AEE62
_080AEDEC:
	ldrh r1, [r5, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080AEDFA
	subs r0, r1, 0x1
	strh r0, [r5, 0x1E]
_080AEDFA:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080AEE6C
	strh r3, [r5, 0xA]
	ldrh r1, [r5, 0xC]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080AEE26
	movs r0, 0x4
	strh r0, [r5, 0x16]
	movs r0, 0x44
	strh r0, [r5, 0x18]
	strh r3, [r5, 0x10]
	strh r2, [r5, 0x12]
	b _080AEE36
_080AEE26:
	movs r0, 0x44
	strh r0, [r5, 0x16]
	movs r0, 0x4
	strh r0, [r5, 0x18]
	movs r0, 0x7
	strh r0, [r5, 0x10]
	ldr r0, _080AEE44 @ =0x0000ffff
	strh r0, [r5, 0x12]
_080AEE36:
	movs r1, 0x1E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080AEE68
	movs r0, 0x4
	b _080AEE6A
	.align 2, 0
_080AEE44: .4byte 0x0000ffff
_080AEE48:
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080AEE6C
	adds r0, r2, 0
	bl DestroyAnimVisualTask
	b _080AEE6C
_080AEE58:
	ldrh r1, [r5, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080AEE68
_080AEE62:
	subs r0, r1, 0x1
	strh r0, [r5, 0x1E]
	b _080AEE6C
_080AEE68:
	movs r0, 0x1
_080AEE6A:
	strh r0, [r5, 0x8]
_080AEE6C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80AECE0

	thumb_func_start sub_80AEE74
sub_80AEE74: @ 80AEE74
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _080AEF3C @ =gUnknown_83E62A8
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	movs r3, 0x16
	ldrsh r2, [r4, r3]
	movs r3, 0x23
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080AEEE0
	ldr r1, _080AEF40 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r1
	ldrh r2, [r3, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	ldrh r6, [r4, 0x10]
	adds r1, r6
	ldr r6, _080AEF44 @ =0x000003ff
	adds r0, r6, 0
	ands r1, r0
	ldr r0, _080AEF48 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	ldrh r0, [r4, 0x12]
	ldrh r1, [r4, 0x10]
	adds r0, r1
	strh r0, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bge _080AEEC8
	movs r0, 0x7
	strh r0, [r4, 0x10]
_080AEEC8:
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0x7
	ble _080AEED4
	movs r0, 0
	strh r0, [r4, 0x10]
_080AEED4:
	strh r5, [r3, 0x3A]
	movs r0, 0x3
	strh r0, [r3, 0x3C]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
_080AEEE0:
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _080AEF02
	movs r5, 0x12
	ldrsh r0, [r4, r5]
	cmp r0, 0
	ble _080AEF02
	ldrh r1, [r4, 0x26]
	ldrh r6, [r4, 0x24]
	adds r1, r6
	strh r1, [r4, 0x24]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x6F
	bl PlaySE12WithPanning
_080AEF02:
	movs r0, 0x12
	ldrsh r3, [r4, r0]
	ldrh r2, [r4, 0x16]
	cmp r3, 0
	bge _080AEF18
	lsls r0, r2, 16
	asrs r0, 16
	movs r5, 0x18
	ldrsh r1, [r4, r5]
	cmp r0, r1
	ble _080AEF28
_080AEF18:
	cmp r3, 0
	ble _080AEF4C
	lsls r0, r2, 16
	asrs r0, 16
	movs r6, 0x18
	ldrsh r1, [r4, r6]
	cmp r0, r1
	blt _080AEF4C
_080AEF28:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x1A]
	ldrh r1, [r4, 0x14]
	adds r0, r1
	strh r0, [r4, 0x14]
	movs r0, 0x1
	b _080AEF58
	.align 2, 0
_080AEF3C: .4byte gUnknown_83E62A8
_080AEF40: .4byte gSprites
_080AEF44: .4byte 0x000003ff
_080AEF48: .4byte 0xfffffc00
_080AEF4C:
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	lsls r0, 3
	adds r0, r2, r0
	strh r0, [r4, 0x16]
	movs r0, 0
_080AEF58:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80AEE74

	thumb_func_start sub_80AEF60
sub_80AEF60: @ 80AEF60
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080AEF96
	ldr r3, _080AEF9C @ =gTasks
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x3A
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r4, 0
	bl DestroySprite
_080AEF96:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AEF9C: .4byte gTasks
	thumb_func_end sub_80AEF60

	thumb_func_start sub_80AEFA0
sub_80AEFA0: @ 80AEFA0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080AEFC4 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080AF01C
	cmp r0, 0x1
	bgt _080AEFC8
	cmp r0, 0
	beq _080AEFCE
	b _080AF052
	.align 2, 0
_080AEFC4: .4byte gTasks
_080AEFC8:
	cmp r0, 0x2
	beq _080AF044
	b _080AF052
_080AEFCE:
	ldr r0, _080AF018 @ =gBattleAnimTarget
	ldrb r0, [r0]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x20
	strh r0, [r5, 0x26]
	strh r0, [r5, 0x24]
	cmp r0, 0x10
	ble _080AEFF8
	adds r2, r0, 0
_080AEFE8:
	adds r1, r2, 0
	subs r1, 0x20
	adds r2, r1, 0
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x10
	bgt _080AEFE8
	strh r1, [r5, 0x24]
_080AEFF8:
	ldr r4, _080AF018 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	bl GetBattlerSpriteSubpriority
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x2
	strh r0, [r5, 0x20]
	b _080AF03C
	.align 2, 0
_080AF018: .4byte gBattleAnimTarget
_080AF01C:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080AF052
	movs r0, 0
	strh r0, [r5, 0xA]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80AF058
	lsls r0, 24
	cmp r0, 0
	beq _080AF052
_080AF03C:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080AF052
_080AF044:
	movs r1, 0x1C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080AF052
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080AF052:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80AEFA0

	thumb_func_start sub_80AF058
sub_80AF058: @ 80AF058
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _080AF0B4 @ =gUnknown_83E5F38
	movs r2, 0x22
	ldrsh r1, [r4, r2]
	movs r3, 0x24
	ldrsh r2, [r4, r3]
	ldrh r3, [r4, 0x20]
	lsls r3, 24
	lsrs r3, 24
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080AF09C
	ldr r3, _080AF0B8 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x1C
	adds r1, r0, r1
	ldr r2, _080AF0BC @ =sub_80AF0C8
	str r2, [r1]
	adds r0, r3
	strh r5, [r0, 0x3A]
	movs r1, 0xA
	strh r1, [r0, 0x3C]
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
_080AF09C:
	ldrh r2, [r4, 0x24]
	movs r0, 0x24
	ldrsh r1, [r4, r0]
	movs r3, 0x26
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _080AF0C0
	adds r0, r2, 0
	adds r0, 0x20
	strh r0, [r4, 0x24]
	movs r0, 0
	b _080AF0C2
	.align 2, 0
_080AF0B4: .4byte gUnknown_83E5F38
_080AF0B8: .4byte gSprites
_080AF0BC: .4byte sub_80AF0C8
_080AF0C0:
	movs r0, 0x1
_080AF0C2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80AF058

	thumb_func_start sub_80AF0C8
sub_80AF0C8: @ 80AF0C8
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080AF0FC
	ldr r3, _080AF104 @ =gTasks
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x3A
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r4, 0
	bl DestroySprite
_080AF0FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AF104: .4byte gTasks
	thumb_func_end sub_80AF0C8

	.align 2, 0 @ Don't pad with nop.
