	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80B725C
sub_80B725C: @ 80B725C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080B72A4 @ =gBattleAnimAttacker
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
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B72AC
	ldr r2, _080B72A8 @ =gBattleAnimArgs
	ldrh r0, [r5, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r5, 0x20]
	ldrh r0, [r2, 0x6]
	negs r0, r0
	strh r0, [r2, 0x6]
	ldrh r0, [r2, 0x8]
	negs r0, r0
	strh r0, [r2, 0x8]
	adds r1, r2, 0
	b _080B72B6
	.align 2, 0
_080B72A4: .4byte gBattleAnimAttacker
_080B72A8: .4byte gBattleAnimArgs
_080B72AC:
	ldr r1, _080B72EC @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r5, 0x20]
	adds r0, r2
	strh r0, [r5, 0x20]
_080B72B6:
	ldrh r0, [r1, 0x2]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x34]
	ldrh r0, [r1, 0xA]
	strh r0, [r5, 0x38]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080B72F0 @ =move_anim_8074EE0
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080B72F4 @ =sub_8074E70
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B72EC: .4byte gBattleAnimArgs
_080B72F0: .4byte move_anim_8074EE0
_080B72F4: .4byte sub_8074E70
	thumb_func_end sub_80B725C

	thumb_func_start sub_80B72F8
sub_80B72F8: @ 80B72F8
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_8074FCC
	ldr r4, _080B7350 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	ldr r0, _080B7354 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B735C
	ldr r2, _080B7358 @ =gBattleAnimArgs
	ldrh r0, [r5, 0x20]
	ldrh r1, [r2, 0x2]
	subs r0, r1
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x22]
	adds r1, r0
	strh r1, [r5, 0x22]
	ldrh r0, [r5, 0x32]
	ldrh r1, [r2, 0x4]
	subs r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r2, 0x6]
	ldrh r1, [r5, 0x36]
	adds r0, r1
	strh r0, [r5, 0x36]
	b _080B7386
	.align 2, 0
_080B7350: .4byte gBattleAnimTarget
_080B7354: .4byte gBattleAnimAttacker
_080B7358: .4byte gBattleAnimArgs
_080B735C:
	ldr r1, _080B73A0 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r5, 0x20]
	adds r0, r2
	strh r0, [r5, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	ldrh r0, [r1, 0x4]
	ldrh r2, [r5, 0x32]
	adds r0, r2
	strh r0, [r5, 0x32]
	ldrh r0, [r1, 0x6]
	ldrh r1, [r5, 0x36]
	adds r0, r1
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080B7386:
	ldr r0, _080B73A0 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x8]
	strh r0, [r5, 0x2E]
	ldr r0, _080B73A4 @ =sub_8075590
	str r0, [r5, 0x1C]
	ldr r1, _080B73A8 @ =move_anim_8074EE0
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B73A0: .4byte gBattleAnimArgs
_080B73A4: .4byte sub_8075590
_080B73A8: .4byte move_anim_8074EE0
	thumb_func_end sub_80B72F8

	thumb_func_start sub_80B73AC
sub_80B73AC: @ 80B73AC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080B73C0 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B73C8
	ldr r4, _080B73C4 @ =gBattleAnimAttacker
	b _080B73CA
	.align 2, 0
_080B73C0: .4byte gBattleAnimArgs
_080B73C4: .4byte gBattleAnimAttacker
_080B73C8:
	ldr r4, _080B740C @ =gBattleAnimTarget
_080B73CA:
	ldrb r0, [r4]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r4, _080B7410 @ =gBattleAnimArgs
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	adds r0, r5, 0
	bl sub_8074FF8
	ldrh r0, [r4, 0x4]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	ldr r0, _080B7414 @ =sub_8074F6C
	str r0, [r5, 0x1C]
	ldr r1, _080B7418 @ =move_anim_8074EE0
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B740C: .4byte gBattleAnimTarget
_080B7410: .4byte gBattleAnimArgs
_080B7414: .4byte sub_8074F6C
_080B7418: .4byte move_anim_8074EE0
	thumb_func_end sub_80B73AC

	thumb_func_start sub_80B741C
sub_80B741C: @ 80B741C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080B7444 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B7436
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080B7436:
	adds r0, r4, 0
	bl sub_80B72F8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7444: .4byte gBattleAnimAttacker
	thumb_func_end sub_80B741C

	thumb_func_start sub_80B7448
sub_80B7448: @ 80B7448
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r4, _080B749C @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r6, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x22]
	strh r5, [r6, 0x36]
	movs r0, 0x1
	strh r0, [r6, 0x38]
	ldr r0, _080B74A0 @ =gBattleAnimArgs
	ldrh r0, [r0]
	strh r0, [r6, 0x3A]
	ldr r4, _080B74A4 @ =gBattlerAttacker
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8076B2C
	lsls r7, r0, 16
	lsrs r5, r7, 16
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8076B2C
	lsls r1, r0, 16
	lsrs r0, r1, 16
	cmp r5, r0
	bls _080B74A8
	lsrs r0, r7, 17
	b _080B74AA
	.align 2, 0
_080B749C: .4byte gBattleAnimAttacker
_080B74A0: .4byte gBattleAnimArgs
_080B74A4: .4byte gBattlerAttacker
_080B74A8:
	lsrs r0, r1, 17
_080B74AA:
	strh r0, [r6, 0x3C]
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	movs r2, 0x3C
	ldrsh r1, [r6, r2]
	bl Cos
	strh r0, [r6, 0x24]
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	movs r2, 0x3C
	ldrsh r1, [r6, r2]
	bl Sin
	strh r0, [r6, 0x26]
	ldr r0, _080B74D4 @ =sub_80B74D8
	str r0, [r6, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B74D4: .4byte sub_80B74D8
	thumb_func_end sub_80B7448

	thumb_func_start sub_80B74D8
sub_80B74D8: @ 80B74D8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r5, [r4, r0]
	cmp r5, 0
	beq _080B74EA
	cmp r5, 0x1
	beq _080B7556
	b _080B75DA
_080B74EA:
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x38]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3A]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080B753C
	strh r5, [r4, 0x36]
	ldrh r1, [r4, 0x38]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080B753C
	adds r0, r1, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _080B753C
	movs r0, 0x10
	strh r0, [r4, 0x38]
_080B753C:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _080B75DA
	movs r0, 0
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080B75DA
_080B7556:
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x38]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x3C]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0x95
	bgt _080B757E
	adds r0, r1, 0
	adds r0, 0x8
	strh r0, [r4, 0x3C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x95
	ble _080B757E
	movs r0, 0x96
	strh r0, [r4, 0x3C]
_080B757E:
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080B75C6
	movs r0, 0
	strh r0, [r4, 0x36]
	ldrh r1, [r4, 0x38]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080B75C6
	adds r0, r1, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _080B75C6
	movs r0, 0x10
	strh r0, [r4, 0x38]
_080B75C6:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080B75DA
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B75DA:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80B74D8

	thumb_func_start sub_80B75E0
sub_80B75E0: @ 80B75E0
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B760C @ =gTasks
	adds r4, r1, r0
	ldr r0, _080B7610 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B761C
	ldr r0, _080B7614 @ =0x04000014
	str r0, [sp]
	ldr r0, _080B7618 @ =gBattle_BG1_X
	b _080B7622
	.align 2, 0
_080B760C: .4byte gTasks
_080B7610: .4byte gBattleAnimAttacker
_080B7614: .4byte 0x04000014
_080B7618: .4byte gBattle_BG1_X
_080B761C:
	ldr r0, _080B7698 @ =0x04000018
	str r0, [sp]
	ldr r0, _080B769C @ =gBattle_BG2_X
_080B7622:
	ldrh r0, [r0]
	strh r0, [r4, 0xC]
	ldr r0, _080B76A0 @ =0xa2600001
	str r0, [sp, 0x4]
	mov r1, sp
	movs r5, 0
	movs r0, 0x1
	strb r0, [r1, 0x8]
	mov r0, sp
	strb r5, [r0, 0x9]
	ldr r0, _080B76A4 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_807492C
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	subs r1, 0x20
	strh r1, [r4, 0xE]
	adds r0, 0x20
	strh r0, [r4, 0x10]
	cmp r1, 0
	bge _080B7652
	strh r5, [r4, 0xE]
_080B7652:
	ldrh r3, [r4, 0xE]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bgt _080B7680
	ldr r5, _080B76A8 @ =gScanlineEffectRegBuffers
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
_080B7664:
	lsls r1, r3, 1
	adds r2, r1, r5
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r1, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	ble _080B7664
_080B7680:
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl ScanlineEffect_SetParams
	ldr r0, _080B76AC @ =sub_80B76B0
	str r0, [r4]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7698: .4byte 0x04000018
_080B769C: .4byte gBattle_BG2_X
_080B76A0: .4byte 0xa2600001
_080B76A4: .4byte gBattleAnimAttacker
_080B76A8: .4byte gScanlineEffectRegBuffers
_080B76AC: .4byte sub_80B76B0
	thumb_func_end sub_80B75E0

	thumb_func_start sub_80B76B0
sub_80B76B0: @ 80B76B0
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _080B76D4 @ =gTasks
	adds r2, r0, r1
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	cmp r0, 0x4
	bhi _080B7766
	lsls r0, 2
	ldr r1, _080B76D8 @ =_080B76DC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B76D4: .4byte gTasks
_080B76D8: .4byte _080B76DC
	.align 2, 0
_080B76DC:
	.4byte _080B76F0
	.4byte _080B7712
	.4byte _080B7722
	.4byte _080B774E
	.4byte _080B7760
_080B76F0:
	ldrh r0, [r2, 0x16]
	adds r0, 0x1
	strh r0, [r2, 0x16]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B7746
	movs r0, 0
	strh r0, [r2, 0x16]
	ldrh r0, [r2, 0x14]
	adds r0, 0x1
	strh r0, [r2, 0x14]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080B7746
	b _080B7740
_080B7712:
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _080B7746
	b _080B7740
_080B7722:
	ldrh r0, [r2, 0x16]
	adds r0, 0x1
	strh r0, [r2, 0x16]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B7746
	movs r0, 0
	strh r0, [r2, 0x16]
	ldrh r0, [r2, 0x14]
	subs r0, 0x1
	strh r0, [r2, 0x14]
	lsls r0, 16
	cmp r0, 0
	bne _080B7746
_080B7740:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
_080B7746:
	adds r0, r2, 0
	bl sub_80B776C
	b _080B7766
_080B774E:
	ldr r1, _080B775C @ =gScanlineEffect
	movs r0, 0x3
	strb r0, [r1, 0x15]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080B7766
	.align 2, 0
_080B775C: .4byte gScanlineEffect
_080B7760:
	adds r0, r3, 0
	bl DestroyAnimVisualTask
_080B7766:
	pop {r0}
	bx r0
	thumb_func_end sub_80B76B0

	thumb_func_start sub_80B776C
sub_80B776C: @ 80B776C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	ldrh r3, [r5, 0x12]
	ldrh r4, [r5, 0xE]
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r4, r0
	bgt _080B77C2
	ldr r7, _080B77D8 @ =gScanlineEffectRegBuffers
	mov r12, r7
	ldr r0, _080B77DC @ =gSineTable
	mov r8, r0
	ldr r6, _080B77E0 @ =gScanlineEffect
_080B778A:
	lsls r2, r4, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r12
	lsls r0, r3, 1
	add r0, r8
	movs r7, 0
	ldrsh r1, [r0, r7]
	movs r7, 0x14
	ldrsh r0, [r5, r7]
	muls r0, r1
	asrs r0, 7
	ldrh r1, [r5, 0xC]
	adds r0, r1
	strh r0, [r2]
	adds r3, 0x8
	movs r0, 0xFF
	ands r3, r0
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	movs r7, 0x10
	ldrsh r0, [r5, r7]
	cmp r4, r0
	ble _080B778A
_080B77C2:
	ldrh r0, [r5, 0x12]
	adds r0, 0x9
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x12]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B77D8: .4byte gScanlineEffectRegBuffers
_080B77DC: .4byte gSineTable
_080B77E0: .4byte gScanlineEffect
	thumb_func_end sub_80B776C

	thumb_func_start sub_80B77E4
sub_80B77E4: @ 80B77E4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	ldr r5, _080B7884 @ =gBattleAnimArgs
	movs r0, 0x4
	ldrsh r1, [r5, r0]
	lsls r0, r1, 1
	adds r0, r1
	movs r1, 0x5
	bl __divsi3
	adds r6, r0, 0
	ldr r1, _080B7888 @ =gBattleAnimAttacker
	mov r8, r1
	ldrb r0, [r1]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	mov r2, r8
	ldrb r0, [r2]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r3, [r5, 0x8]
	adds r0, r3
	strh r0, [r4, 0x22]
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	movs r2, 0x4
	ldrsh r1, [r5, r2]
	bl Cos
	strh r0, [r4, 0x30]
	movs r3, 0x2
	ldrsh r0, [r5, r3]
	lsls r6, 16
	asrs r6, 16
	adds r1, r6, 0
	bl Sin
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x30]
	ldrh r2, [r5]
	adds r3, r2, 0
	muls r3, r1
	adds r1, r3, 0
	ldrh r3, [r4, 0x20]
	adds r1, r3
	strh r1, [r4, 0x20]
	adds r1, r2, 0
	muls r1, r0
	adds r0, r1, 0
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x34]
	ldr r0, _080B788C @ =sub_80B7894
	str r0, [r4, 0x1C]
	adds r4, 0x2E
	ldr r2, _080B7890 @ =gUnknown_20399A4
	movs r1, 0x6
_080B786C:
	ldrh r0, [r4]
	strh r0, [r2]
	adds r4, 0x2
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _080B786C
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7884: .4byte gBattleAnimArgs
_080B7888: .4byte gBattleAnimAttacker
_080B788C: .4byte sub_80B7894
_080B7890: .4byte gUnknown_20399A4
	thumb_func_end sub_80B77E4

	thumb_func_start sub_80B7894
sub_80B7894: @ 80B7894
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x36]
	adds r0, r1
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x38]
	adds r0, r2
	strh r0, [r4, 0x38]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r4, 0x24]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _080B78D8
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B78D8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B7894

	.align 2, 0 @ Don't pad with nop.
