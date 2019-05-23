	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80AC90C
sub_80AC90C: @ 80AC90C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080AC940 @ =gBattleAnimArgs
	ldrh r0, [r0]
	strh r0, [r4, 0x2E]
	movs r0, 0x3C
	strh r0, [r4, 0x30]
	movs r0, 0x9
	strh r0, [r4, 0x32]
	movs r0, 0x1E
	strh r0, [r4, 0x34]
	movs r0, 0xFE
	lsls r0, 8
	strh r0, [r4, 0x36]
	ldr r1, _080AC944 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r1, _080AC948 @ =sub_8074AE0
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AC940: .4byte gBattleAnimArgs
_080AC944: .4byte DestroyAnimSprite
_080AC948: .4byte sub_8074AE0
	thumb_func_end sub_80AC90C

	thumb_func_start sub_80AC94C
sub_80AC94C: @ 80AC94C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080AC984 @ =gBattleAnimArgs
	movs r0, 0
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl sub_8074FF8
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x32]
	ldr r0, _080AC988 @ =sub_8074D00
	str r0, [r4, 0x1C]
	ldr r1, _080AC98C @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AC984: .4byte gBattleAnimArgs
_080AC988: .4byte sub_8074D00
_080AC98C: .4byte DestroyAnimSprite
	thumb_func_end sub_80AC94C

	thumb_func_start sub_80AC990
sub_80AC990: @ 80AC990
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8074FCC
	ldr r0, _080AC9C4 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AC9CC
	ldr r2, _080AC9C8 @ =gBattleAnimArgs
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r2, 0x8]
	negs r0, r0
	strh r0, [r4, 0x32]
	adds r1, r2, 0
	b _080AC9E2
	.align 2, 0
_080AC9C4: .4byte gBattleAnimAttacker
_080AC9C8: .4byte gBattleAnimArgs
_080AC9CC:
	ldr r1, _080AC9F8 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x32]
_080AC9E2:
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x36]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x34]
	ldr r0, _080AC9FC @ =sub_80ACA6C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AC9F8: .4byte gBattleAnimArgs
_080AC9FC: .4byte sub_80ACA6C
	thumb_func_end sub_80AC990

	thumb_func_start sub_80ACA00
sub_80ACA00: @ 80ACA00
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080ACA2C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080ACA34
	ldr r2, _080ACA30 @ =gBattleAnimArgs
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r2, 0x8]
	strh r0, [r4, 0x32]
	adds r1, r2, 0
	b _080ACA4C
	.align 2, 0
_080ACA2C: .4byte gBattleAnimAttacker
_080ACA30: .4byte gBattleAnimArgs
_080ACA34:
	ldr r1, _080ACA64 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x8]
	negs r0, r0
	strh r0, [r4, 0x32]
_080ACA4C:
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x36]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x34]
	ldr r0, _080ACA68 @ =sub_80ACA6C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACA64: .4byte gBattleAnimArgs
_080ACA68: .4byte sub_80ACA6C
	thumb_func_end sub_80ACA00

	thumb_func_start sub_80ACA6C
sub_80ACA6C: @ 80ACA6C
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x36
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bge _080ACA92
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x34]
	ldrh r3, [r2, 0x26]
	adds r0, r3
	strh r0, [r2, 0x26]
_080ACA92:
	movs r0, 0x2E
	ldrsh r1, [r2, r0]
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne _080ACAA4
	adds r0, r2, 0
	bl move_anim_8074EE0
_080ACAA4:
	pop {r0}
	bx r0
	thumb_func_end sub_80ACA6C

	thumb_func_start sub_80ACAA8
sub_80ACAA8: @ 80ACAA8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8074FCC
	ldr r0, _080ACACC @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080ACAD4
	ldr r0, _080ACAD0 @ =gBattleAnimArgs
	ldrh r1, [r4, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r4, 0x20]
	b _080ACAE6
	.align 2, 0
_080ACACC: .4byte gBattleAnimAttacker
_080ACAD0: .4byte gBattleAnimArgs
_080ACAD4:
	ldr r0, _080ACB14 @ =gBattleAnimArgs
	ldrh r1, [r0]
	ldrh r2, [r4, 0x20]
	adds r1, r2
	strh r1, [r4, 0x20]
	adds r2, r4, 0
	adds r2, 0x43
	movs r1, 0x8
	strb r1, [r2]
_080ACAE6:
	adds r2, r0, 0
	ldrh r0, [r2, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x22]
	ldrh r0, [r2, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r2, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r2, 0x8]
	strh r0, [r4, 0x32]
	ldrh r0, [r2, 0xA]
	strh r0, [r4, 0x34]
	ldrh r0, [r2, 0xC]
	strh r0, [r4, 0x36]
	strh r1, [r4, 0x38]
	ldr r0, _080ACB18 @ =sub_80ACB1C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACB14: .4byte gBattleAnimArgs
_080ACB18: .4byte sub_80ACB1C
	thumb_func_end sub_80ACAA8

	thumb_func_start sub_80ACB1C
sub_80ACB1C: @ 80ACB1C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080ACBA4
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	ldr r0, _080ACB88 @ =0x00002710
	cmp r1, r0
	ble _080ACB3A
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1
	strb r0, [r1]
_080ACB3A:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x38]
	lsls r1, 16
	asrs r1, 24
	ldrh r2, [r4, 0x30]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x38]
	lsls r1, 16
	asrs r1, 24
	ldrh r2, [r4, 0x30]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	ldrh r0, [r4, 0x36]
	ldrh r2, [r4, 0x38]
	adds r0, r2
	strh r0, [r4, 0x38]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080ACB90
	ldr r2, _080ACB8C @ =0xffffff00
	b _080ACB98
	.align 2, 0
_080ACB88: .4byte 0x00002710
_080ACB8C: .4byte 0xffffff00
_080ACB90:
	cmp r0, 0
	bge _080ACB9C
	movs r2, 0x80
	lsls r2, 1
_080ACB98:
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
_080ACB9C:
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _080ACBAA
_080ACBA4:
	adds r0, r4, 0
	bl move_anim_8074EE0
_080ACBAA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80ACB1C

	thumb_func_start sub_80ACBB0
sub_80ACBB0: @ 80ACBB0
	push {lr}
	movs r1, 0
	strh r1, [r0, 0x20]
	strh r1, [r0, 0x22]
	movs r1, 0x3C
	strh r1, [r0, 0x2E]
	movs r1, 0x8C
	strh r1, [r0, 0x32]
	movs r1, 0x50
	strh r1, [r0, 0x36]
	ldr r1, _080ACBD4 @ =sub_8075590
	str r1, [r0, 0x1C]
	ldr r1, _080ACBD8 @ =DestroyAnimSprite
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_080ACBD4: .4byte sub_8075590
_080ACBD8: .4byte DestroyAnimSprite
	thumb_func_end sub_80ACBB0

	thumb_func_start sub_80ACBDC
sub_80ACBDC: @ 80ACBDC
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r5, _080ACC34 @ =gBattleAnimAttacker
	ldrb r0, [r5]
	bl GetBattlerSide
	adds r4, r0, 0
	ldr r0, _080ACC38 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080ACC22
	movs r0, 0x2
	bl GetBattlerAtPosition
	ldrb r1, [r5]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	beq _080ACC1A
	movs r0, 0x3
	bl GetBattlerAtPosition
	ldrb r1, [r5]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	bne _080ACC22
_080ACC1A:
	ldr r1, _080ACC3C @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080ACC22:
	ldr r1, _080ACC40 @ =sub_8075F0C
	str r1, [r6, 0x1C]
	adds r0, r6, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ACC34: .4byte gBattleAnimAttacker
_080ACC38: .4byte gBattleAnimTarget
_080ACC3C: .4byte gBattleAnimArgs
_080ACC40: .4byte sub_8075F0C
	thumb_func_end sub_80ACBDC

	thumb_func_start sub_80ACC44
sub_80ACC44: @ 80ACC44
	ldr r2, _080ACC58 @ =gBattleAnimArgs
	ldrh r1, [r2]
	negs r1, r1
	strh r1, [r2]
	ldrh r1, [r2, 0x4]
	negs r1, r1
	strh r1, [r2, 0x4]
	ldr r1, _080ACC5C @ =sub_8075F0C
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080ACC58: .4byte gBattleAnimArgs
_080ACC5C: .4byte sub_8075F0C
	thumb_func_end sub_80ACC44

	thumb_func_start sub_80ACC60
sub_80ACC60: @ 80ACC60
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _080ACC80 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	movs r1, 0
	strh r0, [r4, 0x3C]
	strh r1, [r4, 0x2E]
	ldr r0, _080ACC84 @ =sub_80ACC88
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACC80: .4byte gBattleAnimArgs
_080ACC84: .4byte sub_80ACC88
	thumb_func_end sub_80ACC60

	thumb_func_start sub_80ACC88
sub_80ACC88: @ 80ACC88
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80ACD7C
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x12
	bne _080ACCD2
	movs r0, 0x19
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldr r4, _080ACCD8 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r0, _080ACCDC @ =sub_80ACCE0
	str r0, [r5, 0x1C]
_080ACCD2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ACCD8: .4byte gBattleAnimTarget
_080ACCDC: .4byte sub_80ACCE0
	thumb_func_end sub_80ACC88

	thumb_func_start sub_80ACCE0
sub_80ACCE0: @ 80ACCE0
	push {r4-r6,lr}
	adds r6, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	beq _080ACD28
	movs r4, 0
	strh r4, [r6, 0x2E]
	ldr r5, _080ACD20 @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x22]
	strh r4, [r6, 0x26]
	strh r4, [r6, 0x24]
	ldr r1, _080ACD24 @ =sub_80ACD58
	str r1, [r6, 0x1C]
	adds r0, r6, 0
	bl _call_via_r1
	b _080ACD52
	.align 2, 0
_080ACD20: .4byte gBattleAnimTarget
_080ACD24: .4byte sub_80ACD58
_080ACD28:
	movs r1, 0x3C
	ldrsh r0, [r6, r1]
	movs r1, 0x1C
	bl Sin
	ldrh r1, [r6, 0x24]
	adds r0, r1
	strh r0, [r6, 0x24]
	movs r1, 0x3C
	ldrsh r0, [r6, r1]
	movs r1, 0x1C
	bl Cos
	ldrh r1, [r6, 0x26]
	adds r0, r1
	strh r0, [r6, 0x26]
	ldrh r0, [r6, 0x3C]
	adds r0, 0x14
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r6, 0x3C]
_080ACD52:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80ACCE0

	thumb_func_start sub_80ACD58
sub_80ACD58: @ 80ACD58
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80ACD7C
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _080ACD74
	adds r0, r4, 0
	bl DestroyAnimSprite
_080ACD74:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80ACD58

	thumb_func_start sub_80ACD7C
sub_80ACD7C: @ 80ACD7C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r1, 0x1C
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r1, 0x1C
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x14
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3C]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80ACD7C

	thumb_func_start sub_80ACDA8
sub_80ACDA8: @ 80ACDA8
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080ACDDC @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x32]
	ldr r1, _080ACDE0 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080ACDE4 @ =sub_8074CD0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACDDC: .4byte gBattleAnimArgs
_080ACDE0: .4byte DestroyAnimSprite
_080ACDE4: .4byte sub_8074CD0
	thumb_func_end sub_80ACDA8

	thumb_func_start sub_80ACDE8
sub_80ACDE8: @ 80ACDE8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r1, _080ACE1C @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x2E]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080ACE20 @ =sub_8074C44
	str r0, [r4, 0x1C]
	ldr r1, _080ACE24 @ =sub_80ACE28
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACE1C: .4byte gBattleAnimArgs
_080ACE20: .4byte sub_8074C44
_080ACE24: .4byte sub_80ACE28
	thumb_func_end sub_80ACDE8

	thumb_func_start sub_80ACE28
sub_80ACE28: @ 80ACE28
	push {lr}
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r3]
	ldrh r1, [r0, 0x30]
	movs r2, 0
	strh r1, [r0, 0x2E]
	strh r2, [r0, 0x30]
	ldr r1, _080ACE4C @ =sub_80ACE50
	str r1, [r0, 0x1C]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080ACE4C: .4byte sub_80ACE50
	thumb_func_end sub_80ACE28

	thumb_func_start sub_80ACE50
sub_80ACE50: @ 80ACE50
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0xA
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	adds r0, 0xD0
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080ACE9C
	adds r0, r4, 0
	bl DestroyAnimSprite
_080ACE9C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80ACE50

	thumb_func_start sub_80ACEA4
sub_80ACEA4: @ 80ACEA4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080ACF04 @ =gTasks
	adds r4, r0
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0x26]
	strh r5, [r4, 0x8]
	strh r5, [r4, 0xA]
	strh r5, [r4, 0xC]
	strh r5, [r4, 0xE]
	ldr r2, _080ACF08 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x22]
	strh r0, [r4, 0x10]
	ldr r0, _080ACF0C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x12]
	strh r5, [r4, 0x14]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_80758E0
	ldr r0, _080ACF10 @ =sub_80ACF14
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ACF04: .4byte gTasks
_080ACF08: .4byte gSprites
_080ACF0C: .4byte gBattleAnimAttacker
_080ACF10: .4byte sub_80ACF14
	thumb_func_end sub_80ACEA4

	thumb_func_start sub_80ACF14
sub_80ACF14: @ 80ACF14
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080ACF3C @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	bls _080ACF30
	b _080AD1EE
_080ACF30:
	lsls r0, 2
	ldr r1, _080ACF40 @ =_080ACF44
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080ACF3C: .4byte gTasks
_080ACF40: .4byte _080ACF44
	.align 2, 0
_080ACF44:
	.4byte _080ACF60
	.4byte _080ACF86
	.4byte _080AD038
	.4byte _080AD098
	.4byte _080AD0B6
	.4byte _080AD18C
	.4byte _080AD1E0
_080ACF60:
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0x80
	lsls r3, 1
	movs r0, 0xE0
	str r0, [sp]
	movs r0, 0x80
	lsls r0, 2
	str r0, [sp, 0x4]
	movs r0, 0x20
	str r0, [sp, 0x8]
	adds r0, r4, 0
	adds r2, r3, 0
	bl sub_80765D4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080ACF86:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080ACFCE
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080ACFBC
	ldr r2, _080ACFB8 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3
	b _080ACFCC
	.align 2, 0
_080ACFB8: .4byte gSprites
_080ACFBC:
	ldr r2, _080AD030 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _080AD034 @ =0x0000fffd
_080ACFCC:
	strh r1, [r0, 0x24]
_080ACFCE:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080ACFFC
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080ACFFC
	movs r0, 0
	strh r0, [r4, 0xE]
	ldr r2, _080AD030 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	adds r1, 0x1
	strh r1, [r0, 0x22]
_080ACFFC:
	adds r0, r4, 0
	bl sub_8076640
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _080AD00C
	b _080AD1EE
_080AD00C:
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8076440
	ldr r2, _080AD030 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x24]
	strh r5, [r4, 0xA]
	strh r5, [r4, 0xC]
	strh r5, [r4, 0xE]
	b _080AD1D4
	.align 2, 0
_080AD030: .4byte gSprites
_080AD034: .4byte 0x0000fffd
_080AD038:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bgt _080AD048
	b _080AD1EE
_080AD048:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080AD072
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0x80
	lsls r3, 2
	movs r0, 0xC0
	lsls r0, 1
	str r0, [sp]
	movs r0, 0xF0
	str r0, [sp, 0x4]
	movs r0, 0x6
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r2, 0xE0
	bl sub_80765D4
	b _080AD092
_080AD072:
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0x80
	lsls r3, 2
	movs r0, 0xC0
	lsls r0, 1
	str r0, [sp]
	movs r0, 0xC0
	str r0, [sp, 0x4]
	movs r0, 0x6
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r2, 0xE0
	bl sub_80765D4
_080AD092:
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080AD1D4
_080AD098:
	adds r0, r4, 0
	bl sub_8076640
	lsls r0, 24
	cmp r0, 0
	beq _080AD0A6
	b _080AD1EE
_080AD0A6:
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	adds r1, r5, 0
	movs r2, 0x6
	bl sub_80AD1F8
	b _080AD1D4
_080AD0B6:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080AD104
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AD0F0
	ldr r2, _080AD0EC @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	b _080AD102
	.align 2, 0
_080AD0EC: .4byte gSprites
_080AD0F0:
	ldr r2, _080AD13C @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
_080AD102:
	strh r1, [r0, 0x26]
_080AD104:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x18
	ble _080AD1EE
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080AD140
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0xC0
	lsls r2, 1
	movs r0, 0x80
	lsls r0, 1
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x8
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r3, 0xF0
	bl sub_80765D4
	b _080AD15E
	.align 2, 0
_080AD13C: .4byte gSprites
_080AD140:
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0xC0
	lsls r2, 1
	movs r0, 0x80
	lsls r0, 1
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x8
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r3, 0xC0
	bl sub_80765D4
_080AD15E:
	ldrh r1, [r4, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AD17C
	ldr r2, _080AD188 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	strh r1, [r0, 0x26]
_080AD17C:
	movs r0, 0
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xE]
	b _080AD1D4
	.align 2, 0
_080AD188: .4byte gSprites
_080AD18C:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080AD1A8
	ldr r2, _080AD1DC @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	subs r1, 0x1
	strh r1, [r0, 0x22]
_080AD1A8:
	adds r0, r4, 0
	bl sub_8076640
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080AD1EE
	ldr r2, _080AD1DC @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x10]
	strh r1, [r0, 0x22]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8075980
	strh r5, [r4, 0xC]
_080AD1D4:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080AD1EE
	.align 2, 0
_080AD1DC: .4byte gSprites
_080AD1E0:
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080AD1EE
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080AD1EE:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80ACF14

	thumb_func_start sub_80AD1F8
sub_80AD1F8: @ 80AD1F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	adds r0, r4, 0
	bl sub_80AD374
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	ldr r1, _080AD248 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r4, [r0, 0x20]
	ldr r0, _080AD24C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080AD250
	adds r0, r4, 0
	subs r0, 0xC
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0x1
	b _080AD25A
	.align 2, 0
_080AD248: .4byte gSprites
_080AD24C: .4byte gBattleAnimAttacker
_080AD250:
	adds r0, r4, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0xFF
_080AD25A:
	movs r6, 0
	movs r5, 0
	lsls r4, 16
	str r4, [sp, 0x8]
	mov r1, r9
	lsls r1, 16
	str r1, [sp, 0x4]
	ldr r2, _080AD314 @ =gUnknown_83E5E44
	mov r9, r2
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r3, r8
	lsls r3, 1
	mov r10, r3
_080AD278:
	ldr r0, _080AD318 @ =gUnknown_83E5E2C
	ldr r2, [sp, 0x8]
	asrs r1, r2, 16
	ldr r3, [sp, 0x4]
	asrs r2, r3, 16
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080AD2FA
	ldr r1, _080AD31C @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r4, r0, r1
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	lsls r0, r5, 2
	adds r0, 0x40
	adds r1, r0
	ldr r3, _080AD320 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r3, _080AD324 @ =0xfffffc00
	adds r0, r3, 0
	ands r2, r0
	orrs r2, r1
	strh r2, [r4, 0x4]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x4
	bls _080AD2C2
	movs r5, 0
_080AD2C2:
	lsls r2, r6, 2
	mov r1, r9
	adds r0, r2, r1
	ldrh r0, [r0]
	ldr r3, [sp]
	adds r1, r0, 0
	muls r1, r3
	lsls r1, 16
	asrs r1, 16
	ldr r0, _080AD328 @ =gUnknown_83E5E46
	adds r2, r0
	movs r3, 0
	ldrsh r2, [r2, r3]
	adds r0, r4, 0
	bl sub_80AD3C8
	strh r7, [r4, 0x3A]
	mov r0, r8
	strh r0, [r4, 0x3C]
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	add r0, r10
	ldr r1, _080AD32C @ =gTasks+0x8
	adds r0, r1
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
_080AD2FA:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x6
	bls _080AD278
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AD314: .4byte gUnknown_83E5E44
_080AD318: .4byte gUnknown_83E5E2C
_080AD31C: .4byte gSprites
_080AD320: .4byte 0x000003ff
_080AD324: .4byte 0xfffffc00
_080AD328: .4byte gUnknown_83E5E46
_080AD32C: .4byte gTasks+0x8
	thumb_func_end sub_80AD1F8

	thumb_func_start sub_80AD330
sub_80AD330: @ 80AD330
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80AD3E4
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080AD36A
	ldr r3, _080AD370 @ =gTasks
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
_080AD36A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD370: .4byte gTasks
	thumb_func_end sub_80AD330

	thumb_func_start sub_80AD374
sub_80AD374: @ 80AD374
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080AD3AC @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r2, [r1, 0x26]
	ldrh r0, [r1, 0x22]
	adds r2, r0
	adds r1, 0x29
	movs r0, 0
	ldrsb r0, [r1, r0]
	adds r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _080AD3B0 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080AD3B4
	lsls r0, r4, 16
	movs r1, 0x94
	lsls r1, 15
	b _080AD3BA
	.align 2, 0
_080AD3AC: .4byte gSprites
_080AD3B0: .4byte gBattleAnimAttacker
_080AD3B4:
	lsls r0, r4, 16
	movs r1, 0xB0
	lsls r1, 14
_080AD3BA:
	adds r0, r1
	lsrs r4, r0, 16
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80AD374

	thumb_func_start sub_80AD3C8
sub_80AD3C8: @ 80AD3C8
	movs r3, 0
	strh r3, [r0, 0x2E]
	strh r3, [r0, 0x30]
	ldrh r3, [r0, 0x20]
	lsls r3, 3
	strh r3, [r0, 0x32]
	ldrh r3, [r0, 0x22]
	lsls r3, 3
	strh r3, [r0, 0x34]
	lsls r1, 3
	strh r1, [r0, 0x36]
	lsls r2, 3
	strh r2, [r0, 0x38]
	bx lr
	thumb_func_end sub_80AD3C8

	thumb_func_start sub_80AD3E4
sub_80AD3E4: @ 80AD3E4
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080AD40E
	movs r0, 0
	strh r0, [r2, 0x2E]
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x30]
	adds r1, r0, 0
	muls r1, r0
	adds r0, r1, 0
	ldrh r3, [r2, 0x34]
	adds r0, r3
	strh r0, [r2, 0x34]
_080AD40E:
	ldrh r0, [r2, 0x36]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r2, 0x20]
	ldrh r1, [r2, 0x38]
	ldrh r3, [r2, 0x34]
	adds r1, r3
	strh r1, [r2, 0x34]
	lsls r1, 16
	asrs r3, r1, 19
	strh r3, [r2, 0x22]
	adds r0, 0x8
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bhi _080AD444
	adds r1, r3, 0
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	blt _080AD444
	cmp r1, 0x78
	ble _080AD450
_080AD444:
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080AD450:
	pop {r0}
	bx r0
	thumb_func_end sub_80AD3E4

	thumb_func_start sub_80AD454
sub_80AD454: @ 80AD454
	push {r4,r5,lr}
	ldr r3, _080AD498 @ =gBattleAnimArgs
	ldrh r1, [r3]
	movs r2, 0
	strh r1, [r0, 0x20]
	ldrh r1, [r3, 0x2]
	strh r1, [r0, 0x22]
	strh r2, [r0, 0x2E]
	strh r2, [r0, 0x30]
	strh r2, [r0, 0x32]
	ldrh r1, [r3, 0x4]
	strh r1, [r0, 0x3A]
	ldrh r1, [r3, 0x6]
	strh r1, [r0, 0x3C]
	ldrh r4, [r0, 0x4]
	lsls r2, r4, 22
	lsrs r2, 22
	movs r5, 0x8
	ldrsh r1, [r3, r5]
	lsls r1, 4
	adds r2, r1
	ldr r3, _080AD49C @ =0x000003ff
	adds r1, r3, 0
	ands r2, r1
	ldr r1, _080AD4A0 @ =0xfffffc00
	ands r1, r4
	orrs r1, r2
	strh r1, [r0, 0x4]
	ldr r1, _080AD4A4 @ =sub_80AD4A8
	str r1, [r0, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AD498: .4byte gBattleAnimArgs
_080AD49C: .4byte 0x000003ff
_080AD4A0: .4byte 0xfffffc00
_080AD4A4: .4byte sub_80AD4A8
	thumb_func_end sub_80AD454

	thumb_func_start sub_80AD4A8
sub_80AD4A8: @ 80AD4A8
	push {r4,lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	beq _080AD4DA
	cmp r0, 0x1
	bgt _080AD4BE
	cmp r0, 0
	beq _080AD4C4
	b _080AD538
_080AD4BE:
	cmp r0, 0x2
	beq _080AD4F8
	b _080AD538
_080AD4C4:
	ldrh r1, [r2, 0x3A]
	movs r3, 0x3A
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _080AD4D4
	subs r0, r1, 0x1
	strh r0, [r2, 0x3A]
	b _080AD538
_080AD4D4:
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
_080AD4DA:
	ldrh r0, [r2, 0x22]
	adds r0, 0x8
	strh r0, [r2, 0x22]
	lsls r0, 16
	asrs r0, 16
	ldrh r3, [r2, 0x3C]
	movs r4, 0x3C
	ldrsh r1, [r2, r4]
	cmp r0, r1
	blt _080AD538
	strh r3, [r2, 0x22]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	b _080AD538
_080AD4F8:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080AD524
	movs r0, 0
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x32]
	adds r0, 0x1
	strh r0, [r2, 0x32]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AD520
	ldr r0, _080AD51C @ =0x0000fffd
	b _080AD522
	.align 2, 0
_080AD51C: .4byte 0x0000fffd
_080AD520:
	movs r0, 0x3
_080AD522:
	strh r0, [r2, 0x26]
_080AD524:
	ldrh r0, [r2, 0x34]
	adds r0, 0x1
	strh r0, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080AD538
	adds r0, r2, 0
	bl DestroyAnimSprite
_080AD538:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AD4A8

	thumb_func_start sub_80AD540
sub_80AD540: @ 80AD540
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080AD5B4
	cmp r0, 0x1
	bgt _080AD556
	cmp r0, 0
	beq _080AD55C
	b _080AD682
_080AD556:
	cmp r0, 0x2
	beq _080AD612
	b _080AD682
_080AD55C:
	adds r0, r5, 0
	movs r1, 0
	bl sub_8075160
	ldr r4, _080AD584 @ =gBattleAnimArgs
	ldrb r1, [r4, 0x4]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x3C]
	ldr r0, _080AD588 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AD58C
	movs r0, 0x4
	b _080AD58E
	.align 2, 0
_080AD584: .4byte gBattleAnimArgs
_080AD588: .4byte gBattleAnimAttacker
_080AD58C:
	ldr r0, _080AD5AC @ =0x0000fffc
_080AD58E:
	strh r0, [r5, 0x36]
	ldr r0, _080AD5B0 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl sub_8076884
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080AD60A
	.align 2, 0
_080AD5AC: .4byte 0x0000fffc
_080AD5B0: .4byte gBattleAnimTarget
_080AD5B4:
	ldrh r0, [r5, 0x30]
	adds r0, 0xC0
	strh r0, [r5, 0x30]
	ldr r0, _080AD5D4 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AD5D8
	ldrh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	b _080AD5DE
	.align 2, 0
_080AD5D4: .4byte gBattleAnimAttacker
_080AD5D8:
	ldrh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 24
_080AD5DE:
	strh r0, [r5, 0x26]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, 0x24]
	ldrh r0, [r5, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080AD682
	movs r0, 0
	strh r0, [r5, 0x34]
_080AD60A:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080AD682
_080AD612:
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	bl Sin
	adds r2, r0, 0
	movs r3, 0
	strh r2, [r5, 0x24]
	ldrh r0, [r5, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _080AD682
	ldrh r0, [r5, 0x20]
	adds r1, r2, r0
	strh r1, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r3, [r5, 0x26]
	strh r3, [r5, 0x24]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r5, 0x2E]
	strh r1, [r5, 0x30]
	ldr r4, _080AD688 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_8075678
	ldr r0, _080AD68C @ =sub_80AD690
	str r0, [r5, 0x1C]
_080AD682:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AD688: .4byte gBattleAnimTarget
_080AD68C: .4byte sub_80AD690
	thumb_func_end sub_80AD540

	thumb_func_start sub_80AD690
sub_80AD690: @ 80AD690
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	bne _080AD6E8
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x10
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	ldrh r2, [r4, 0x38]
	adds r0, r2, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x38]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0
	beq _080AD6C6
	cmp r2, 0xC4
	ble _080AD6EE
_080AD6C6:
	lsls r0, 16
	cmp r0, 0
	ble _080AD6EE
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080AD6EE
	ldr r0, _080AD6E4 @ =gUnknown_2037F24
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x89
	bl PlaySE12WithPanning
	b _080AD6EE
	.align 2, 0
_080AD6E4: .4byte gUnknown_2037F24
_080AD6E8:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AD6EE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AD690

	thumb_func_start sub_80AD6F4
sub_80AD6F4: @ 80AD6F4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080AD70C
	ldr r0, _080AD778 @ =gBattleAnimArgs
	ldrh r0, [r0]
	strh r0, [r4, 0x30]
	adds r0, r1, 0x1
	strh r0, [r4, 0x2E]
_080AD70C:
	movs r0, 0xC0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r4, 0x34]
	adds r1, r2
	strh r1, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	adds r0, 0xA0
	strh r0, [r4, 0x36]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	lsls r1, 16
	asrs r1, 24
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x36]
	lsls r1, 16
	asrs r1, 24
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x7
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080AD7A8
	ldrh r0, [r4, 0x30]
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x83
	bls _080AD780
	ldr r0, _080AD77C @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl sub_8076884
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	b _080AD7C4
	.align 2, 0
_080AD778: .4byte gBattleAnimArgs
_080AD77C: .4byte gBattleAnimTarget
_080AD780:
	ldr r0, _080AD7A4 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl sub_8076884
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
	b _080AD7C4
	.align 2, 0
_080AD7A4: .4byte gBattleAnimTarget
_080AD7A8:
	ldrh r0, [r4, 0x30]
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x83
	bls _080AD7BC
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1D
	b _080AD7C2
_080AD7BC:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1F
_080AD7C2:
	strb r0, [r1]
_080AD7C4:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080AD7EC
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
_080AD7EC:
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0x1E
	bne _080AD7FA
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AD7FA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AD6F4

	thumb_func_start sub_80AD800
sub_80AD800: @ 80AD800
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080AD860 @ =gTasks
	adds r4, r1, r0
	ldr r0, _080AD864 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _080AD826
	movs r1, 0x1
_080AD826:
	strh r1, [r4, 0x20]
	ldr r0, _080AD868 @ =gBattleAnimTarget
	ldrb r1, [r0]
	movs r0, 0x2
	eors r0, r1
	bl sub_8072DF0
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	strh r0, [r4, 0x22]
	movs r0, 0x1
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x24]
	movs r0, 0x3
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldr r0, _080AD86C @ =sub_80AD870
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD860: .4byte gTasks
_080AD864: .4byte gBattleAnimAttacker
_080AD868: .4byte gBattleAnimTarget
_080AD86C: .4byte sub_80AD870
	thumb_func_end sub_80AD800

	thumb_func_start sub_80AD870
sub_80AD870: @ 80AD870
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080AD894 @ =gTasks
	adds r2, r0, r1
	movs r0, 0x8
	ldrsh r3, [r2, r0]
	cmp r3, 0x1
	beq _080AD938
	cmp r3, 0x1
	bgt _080AD898
	cmp r3, 0
	beq _080AD8A6
	b _080ADA98
	.align 2, 0
_080AD894: .4byte gTasks
_080AD898:
	cmp r3, 0x2
	bne _080AD89E
	b _080AD9C0
_080AD89E:
	cmp r3, 0x3
	bne _080AD8A4
	b _080ADA54
_080AD8A4:
	b _080ADA98
_080AD8A6:
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	lsls r0, 1
	ldrh r5, [r2, 0x1C]
	adds r0, r5
	strh r0, [r2, 0x1C]
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080AD8D8
	strh r3, [r2, 0xA]
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AD8D4
	movs r0, 0x2
	b _080AD8D6
_080AD8D4:
	ldr r0, _080AD930 @ =0x0000fffe
_080AD8D6:
	strh r0, [r2, 0x1E]
_080AD8D8:
	movs r1, 0
	strh r1, [r2, 0xE]
	movs r7, 0x22
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bge _080AD91A
	ldr r4, _080AD934 @ =gSprites
	adds r3, r2, 0
	adds r3, 0x8
_080AD8EA:
	movs r1, 0xE
	ldrsh r0, [r2, r1]
	adds r0, 0xE
	lsls r0, 1
	adds r0, r3, r0
	movs r5, 0
	ldrsh r0, [r0, r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r2, 0x1E]
	ldrh r7, [r2, 0x1C]
	adds r0, r7
	strh r0, [r1, 0x24]
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r5, 0x22
	ldrsh r1, [r2, r5]
	cmp r0, r1
	blt _080AD8EA
_080AD91A:
	ldrh r0, [r2, 0x1A]
	adds r0, 0x1
	strh r0, [r2, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	beq _080AD92A
	b _080ADA98
_080AD92A:
	movs r0, 0
	strh r0, [r2, 0x1A]
	b _080ADA44
	.align 2, 0
_080AD930: .4byte 0x0000fffe
_080AD934: .4byte gSprites
_080AD938:
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080AD960
	movs r0, 0
	strh r0, [r2, 0xA]
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	ands r0, r3
	lsls r0, 16
	cmp r0, 0
	beq _080AD95C
	movs r0, 0x2
	b _080AD95E
_080AD95C:
	ldr r0, _080AD9B8 @ =0x0000fffe
_080AD95E:
	strh r0, [r2, 0x1E]
_080AD960:
	movs r1, 0
	strh r1, [r2, 0xE]
	movs r7, 0x22
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bge _080AD9A2
	ldr r4, _080AD9BC @ =gSprites
	adds r3, r2, 0
	adds r3, 0x8
_080AD972:
	movs r1, 0xE
	ldrsh r0, [r2, r1]
	adds r0, 0xE
	lsls r0, 1
	adds r0, r3, r0
	movs r5, 0
	ldrsh r0, [r0, r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r2, 0x1E]
	ldrh r7, [r2, 0x1C]
	adds r0, r7
	strh r0, [r1, 0x24]
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r5, 0x22
	ldrsh r1, [r2, r5]
	cmp r0, r1
	blt _080AD972
_080AD9A2:
	ldrh r0, [r2, 0x1A]
	adds r0, 0x1
	strh r0, [r2, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x60
	bne _080ADA98
	movs r0, 0
	strh r0, [r2, 0x1A]
	b _080ADA44
	.align 2, 0
_080AD9B8: .4byte 0x0000fffe
_080AD9BC: .4byte gSprites
_080AD9C0:
	movs r7, 0x20
	ldrsh r1, [r2, r7]
	lsls r1, 1
	ldrh r0, [r2, 0x1C]
	subs r0, r1
	strh r0, [r2, 0x1C]
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080AD9F4
	movs r0, 0
	strh r0, [r2, 0xA]
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AD9F0
	strh r3, [r2, 0x1E]
	b _080AD9F4
_080AD9F0:
	ldr r0, _080ADA4C @ =0x0000fffe
	strh r0, [r2, 0x1E]
_080AD9F4:
	movs r1, 0
	strh r1, [r2, 0xE]
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _080ADA36
	ldr r4, _080ADA50 @ =gSprites
	adds r3, r2, 0
	adds r3, 0x8
_080ADA06:
	movs r5, 0xE
	ldrsh r0, [r2, r5]
	adds r0, 0xE
	lsls r0, 1
	adds r0, r3, r0
	movs r7, 0
	ldrsh r0, [r0, r7]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r2, 0x1E]
	ldrh r5, [r2, 0x1C]
	adds r0, r5
	strh r0, [r1, 0x24]
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r7, 0x22
	ldrsh r1, [r2, r7]
	cmp r0, r1
	blt _080ADA06
_080ADA36:
	ldrh r0, [r2, 0x1A]
	adds r0, 0x1
	strh r0, [r2, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	bne _080ADA98
_080ADA44:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080ADA98
	.align 2, 0
_080ADA4C: .4byte 0x0000fffe
_080ADA50: .4byte gSprites
_080ADA54:
	movs r1, 0
	strh r1, [r2, 0xE]
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _080ADA92
	ldr r6, _080ADAA0 @ =gSprites
	adds r3, r2, 0
	adds r3, 0x8
	movs r5, 0
_080ADA68:
	movs r7, 0xE
	ldrsh r0, [r2, r7]
	adds r0, 0xE
	lsls r0, 1
	adds r0, r3, r0
	movs r7, 0
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r5, [r0, 0x24]
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r7, 0x22
	ldrsh r1, [r2, r7]
	cmp r0, r1
	blt _080ADA68
_080ADA92:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080ADA98:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADAA0: .4byte gSprites
	thumb_func_end sub_80AD870

	thumb_func_start sub_80ADAA4
sub_80ADAA4: @ 80ADAA4
	push {r4,lr}
	sub sp, 0x10
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r0, sp
	bl sub_80752A0
	mov r0, sp
	ldrb r0, [r0, 0x8]
	lsls r0, 4
	ldr r1, _080ADAD4 @ =gBattleAnimArgs
	ldrb r2, [r1]
	ldrh r3, [r1, 0x2]
	movs r1, 0x10
	bl BlendPalette
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADAD4: .4byte gBattleAnimArgs
	thumb_func_end sub_80ADAA4

	thumb_func_start sub_80ADAD8
sub_80ADAD8: @ 80ADAD8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080ADB30 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	mov r9, r1
	ldr r4, _080ADB34 @ =gBattleAnimArgs
	mov r8, r4
	cmp r0, 0
	bne _080ADB0E
	ldrh r0, [r4]
	strh r0, [r2, 0xA]
	ldrh r0, [r4, 0x2]
	strh r0, [r2, 0xC]
	ldrh r0, [r4, 0x4]
	strh r0, [r2, 0xE]
	ldrh r0, [r4, 0x6]
	strh r0, [r2, 0x10]
_080ADB0E:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	ldr r1, _080ADB38 @ =gUnknown_2023D44
	ldr r0, _080ADB3C @ =gBattleAnimTarget
	ldrb r0, [r0]
	adds r0, r1
	ldrb r6, [r0]
	movs r5, 0x10
	ldrsh r0, [r2, r5]
	cmp r0, 0
	bne _080ADB44
	ldr r4, _080ADB40 @ =gUnknown_83E5EFC
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	b _080ADB4A
	.align 2, 0
_080ADB30: .4byte gTasks
_080ADB34: .4byte gBattleAnimArgs
_080ADB38: .4byte gUnknown_2023D44
_080ADB3C: .4byte gBattleAnimTarget
_080ADB40: .4byte gUnknown_83E5EFC
_080ADB44:
	ldr r4, _080ADB90 @ =gUnknown_83E5F0C
	movs r3, 0x8
	ldrsh r0, [r2, r3]
_080ADB4A:
	movs r1, 0xA
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	adds r0, r4
	ldrb r5, [r0]
	lsls r0, r7, 2
	adds r1, r0, r7
	lsls r1, 3
	add r1, r9
	movs r4, 0xE
	ldrsh r1, [r1, r4]
	mov r12, r0
	cmp r1, 0x1
	bne _080ADB98
	ldr r2, _080ADB94 @ =gSprites
	lsls r3, r6, 4
	adds r0, r3, r6
	lsls r0, 2
	adds r0, r2
	mov r10, r0
	mov r0, r8
	movs r4, 0x2
	ldrsh r1, [r0, r4]
	lsls r0, r5, 24
	asrs r0, 24
	muls r0, r1
	cmp r0, 0
	bge _080ADB88
	negs r0, r0
_080ADB88:
	mov r5, r10
	strh r0, [r5, 0x26]
	b _080ADBB2
	.align 2, 0
_080ADB90: .4byte gUnknown_83E5F0C
_080ADB94: .4byte gSprites
_080ADB98:
	ldr r3, _080ADBE8 @ =gSprites
	lsls r4, r6, 4
	adds r2, r4, r6
	lsls r2, 2
	adds r2, r3
	lsls r0, r5, 24
	asrs r0, 24
	mov r5, r8
	ldrh r1, [r5, 0x2]
	muls r0, r1
	strh r0, [r2, 0x24]
	adds r2, r3, 0
	adds r3, r4, 0
_080ADBB2:
	mov r1, r12
	adds r0, r1, r7
	lsls r0, 3
	add r0, r9
	movs r4, 0x8
	ldrsh r1, [r0, r4]
	movs r5, 0xA
	ldrsh r0, [r0, r5]
	cmp r1, r0
	bne _080ADBD8
	adds r0, r3, r6
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x24]
	strh r1, [r0, 0x26]
	adds r0, r7, 0
	bl DestroyAnimVisualTask
_080ADBD8:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADBE8: .4byte gSprites
	thumb_func_end sub_80ADAD8

	.align 2, 0 @ Don't pad with nop.
