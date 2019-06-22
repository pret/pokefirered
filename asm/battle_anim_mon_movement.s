	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_809949C
sub_809949C: @ 809949C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _08099520 @ =gBattleAnimArgs
	movs r0, 0x6
	ldrsh r1, [r5, r0]
	movs r0, 0x80
	lsls r0, 8
	bl __divsi3
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, _08099524 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080994CE
	ldrh r0, [r5, 0x2]
	negs r0, r0
	strh r0, [r5, 0x2]
	ldrh r0, [r5, 0xA]
	negs r0, r0
	strh r0, [r5, 0xA]
_080994CE:
	ldrb r0, [r5]
	bl GetAnimBankSpriteId
	ldr r1, _08099528 @ =gTasks
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r1
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x8]
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	lsls r0, 8
	movs r2, 0x6
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r4, 0xA]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0xC]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0xE]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x10]
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	lsls r0, 8
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r4, 0x12]
	ldrh r0, [r5, 0xC]
	strh r0, [r4, 0x14]
	strh r7, [r4, 0x16]
	ldr r0, _0809952C @ =sub_8099530
	str r0, [r4]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099520: .4byte gBattleAnimArgs
_08099524: .4byte gBattleAnimAttacker
_08099528: .4byte gTasks
_0809952C: .4byte sub_8099530
	thumb_func_end sub_809949C

	thumb_func_start sub_8099530
sub_8099530: @ 8099530
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08099588 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r5, r1, r2
	ldrb r1, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	ldrh r2, [r5, 0x1E]
	adds r0, r2
	strh r0, [r5, 0x1E]
	ldr r2, _0809958C @ =gSprites
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r2
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	ldrh r0, [r5, 0x1C]
	lsrs r0, 8
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0x16]
	ldrh r1, [r5, 0x1C]
	adds r0, r1
	strh r0, [r5, 0x1C]
	ldrh r0, [r5, 0xE]
	subs r0, 0x1
	strh r0, [r5, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _08099580
	ldr r0, _08099590 @ =sub_8099594
	str r0, [r5]
_08099580:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08099588: .4byte gTasks
_0809958C: .4byte gSprites
_08099590: .4byte sub_8099594
	thumb_func_end sub_8099530

	thumb_func_start sub_8099594
sub_8099594: @ 8099594
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080995B8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0x10]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080995BC
	subs r0, r1, 0x1
	strh r0, [r4, 0x10]
	b _080995F0
	.align 2, 0
_080995B8: .4byte gTasks
_080995BC:
	ldrb r0, [r4, 0x8]
	ldrh r2, [r4, 0x12]
	ldrh r1, [r4, 0x20]
	adds r2, r1
	strh r2, [r4, 0x20]
	ldr r3, _080995F8 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	lsls r2, 16
	asrs r2, 24
	ldrh r0, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 24
	adds r2, r0
	strh r2, [r1, 0x24]
	ldrh r0, [r4, 0x14]
	subs r0, 0x1
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	bne _080995F0
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080995F0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080995F8: .4byte gSprites
	thumb_func_end sub_8099594

	thumb_func_start sub_80995FC
sub_80995FC: @ 80995FC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08099620 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0x2
	beq _0809962A
	cmp r0, 0x2
	bgt _08099624
	cmp r0, 0
	blt _0809965C
	ldrb r0, [r1]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r2, r0, 24
	b _08099664
	.align 2, 0
_08099620: .4byte gBattleAnimArgs
_08099624:
	cmp r0, 0x3
	beq _08099634
	b _0809965C
_0809962A:
	ldr r5, _08099630 @ =gBattleAnimAttacker
	b _08099636
	.align 2, 0
_08099630: .4byte gBattleAnimAttacker
_08099634:
	ldr r5, _08099654 @ =gBattleAnimTarget
_08099636:
	ldrb r0, [r5]
	movs r4, 0x2
	eors r0, r4
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _0809965C
	ldr r1, _08099658 @ =gBattlerSpriteIds
	ldrb r0, [r5]
	eors r0, r4
	adds r0, r1
	ldrb r2, [r0]
	b _08099664
	.align 2, 0
_08099654: .4byte gBattleAnimTarget
_08099658: .4byte gBattlerSpriteIds
_0809965C:
	adds r0, r6, 0
	bl DestroyAnimVisualTask
	b _080996A4
_08099664:
	ldr r1, _08099684 @ =gTasks
	lsls r4, r6, 2
	adds r0, r4, r6
	lsls r0, 3
	adds r5, r0, r1
	strh r2, [r5, 0x8]
	ldr r0, _08099688 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08099690
	ldr r0, _0809968C @ =gBattleAnimArgs
	ldrh r0, [r0, 0x2]
	b _08099696
	.align 2, 0
_08099684: .4byte gTasks
_08099688: .4byte gBattleAnimTarget
_0809968C: .4byte gBattleAnimArgs
_08099690:
	ldr r0, _080996AC @ =gBattleAnimArgs
	ldrh r0, [r0, 0x2]
	negs r0, r0
_08099696:
	strh r0, [r5, 0xA]
	ldr r0, _080996B0 @ =gTasks
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _080996B4 @ =sub_80996B8
	str r0, [r1]
_080996A4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080996AC: .4byte gBattleAnimArgs
_080996B0: .4byte gTasks
_080996B4: .4byte sub_80996B8
	thumb_func_end sub_80995FC

	thumb_func_start sub_80996B8
sub_80996B8: @ 80996B8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080996FC @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r2, [r1, 0x8]
	ldr r3, _08099700 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r1, 0xA]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	strh r1, [r0, 0x24]
	movs r2, 0x24
	ldrsh r1, [r0, r2]
	movs r2, 0x20
	ldrsh r0, [r0, r2]
	adds r1, r0
	adds r1, 0x20
	movs r0, 0x98
	lsls r0, 1
	cmp r1, r0
	bls _080996F6
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080996F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080996FC: .4byte gTasks
_08099700: .4byte gSprites
	thumb_func_end sub_80996B8

	thumb_func_start sub_8099704
sub_8099704: @ 8099704
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _08099754 @ =gBattleAnimAttacker
	ldrb r0, [r6]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08099720
	ldr r1, _08099758 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
_08099720:
	ldr r4, _08099758 @ =gBattleAnimArgs
	ldrb r0, [r4, 0x8]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0809975C @ =gTasks
	lsls r3, r5, 2
	adds r1, r3, r5
	lsls r1, 3
	adds r2, r1, r2
	ldrh r1, [r4]
	strh r1, [r2, 0x8]
	ldrh r1, [r4, 0x2]
	strh r1, [r2, 0xA]
	ldrh r1, [r4, 0x4]
	strh r1, [r2, 0xC]
	ldrh r1, [r4, 0x6]
	strh r1, [r2, 0xE]
	strh r0, [r2, 0x10]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08099760
	ldrb r0, [r6]
	b _08099764
	.align 2, 0
_08099754: .4byte gBattleAnimAttacker
_08099758: .4byte gBattleAnimArgs
_0809975C: .4byte gTasks
_08099760:
	ldr r0, _0809977C @ =gBattleAnimTarget
	ldrb r0, [r0]
_08099764:
	strh r0, [r2, 0x12]
	ldr r1, _08099780 @ =gTasks
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x20]
	ldr r1, _08099784 @ =sub_8099788
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809977C: .4byte gBattleAnimTarget
_08099780: .4byte gTasks
_08099784: .4byte sub_8099788
	thumb_func_end sub_8099704

	thumb_func_start sub_8099788
sub_8099788: @ 8099788
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080997D8 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	ldrb r7, [r4, 0x10]
	ldrh r0, [r4, 0xC]
	ldrh r1, [r4, 0x1C]
	adds r0, r1
	lsls r1, r0, 16
	strh r0, [r4, 0x1C]
	lsrs r1, 24
	mov r8, r1
	mov r0, r8
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	bl Sin
	lsls r0, 16
	lsrs r5, r0, 16
	mov r9, r5
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080997E0
	ldr r0, _080997DC @ =gSprites
	lsls r2, r7, 4
	adds r1, r2, r7
	lsls r1, 2
	adds r1, r0
	strh r5, [r1, 0x24]
	mov r9, r0
	adds r4, r2, 0
	b _08099826
	.align 2, 0
_080997D8: .4byte gTasks
_080997DC: .4byte gSprites
_080997E0:
	ldrb r0, [r4, 0x12]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08099808
	ldr r1, _08099804 @ =gSprites
	lsls r2, r7, 4
	adds r0, r2, r7
	lsls r0, 2
	adds r3, r0, r1
	lsls r0, r5, 16
	asrs r0, 16
	mov r9, r1
	adds r4, r2, 0
	cmp r0, 0
	bge _08099824
	b _08099822
	.align 2, 0
_08099804: .4byte gSprites
_08099808:
	ldr r1, _080998A8 @ =gSprites
	lsls r2, r7, 4
	adds r0, r2, r7
	lsls r0, 2
	adds r3, r0, r1
	mov r4, r9
	lsls r0, r4, 16
	asrs r0, 16
	mov r9, r1
	adds r4, r2, 0
	cmp r0, 0
	bge _08099822
	negs r0, r0
_08099822:
	negs r0, r0
_08099824:
	strh r0, [r3, 0x26]
_08099826:
	mov r5, r8
	cmp r5, 0x7F
	bls _08099848
	ldr r1, _080998AC @ =gTasks
	lsls r2, r6, 2
	adds r0, r2, r6
	lsls r0, 3
	adds r3, r0, r1
	movs r5, 0x1E
	ldrsh r0, [r3, r5]
	adds r5, r1, 0
	cmp r0, 0
	bne _08099848
	movs r1, 0x20
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	beq _0809986A
_08099848:
	mov r2, r8
	cmp r2, 0x7E
	bhi _0809989C
	ldr r1, _080998AC @ =gTasks
	lsls r2, r6, 2
	adds r0, r2, r6
	lsls r0, 3
	adds r3, r0, r1
	movs r5, 0x1E
	ldrsh r0, [r3, r5]
	adds r5, r1, 0
	cmp r0, 0x1
	bne _0809989C
	movs r1, 0x20
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _0809989C
_0809986A:
	adds r1, r2, r6
	lsls r1, 3
	adds r1, r5
	ldrh r0, [r1, 0x1E]
	movs r2, 0x1
	eors r0, r2
	strh r0, [r1, 0x1E]
	ldrh r0, [r1, 0x20]
	eors r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r1, 0xE]
	subs r0, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	asrs r3, r0, 16
	cmp r3, 0
	bne _0809989C
	adds r0, r4, r7
	lsls r0, 2
	add r0, r9
	strh r3, [r0, 0x24]
	strh r3, [r0, 0x26]
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_0809989C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080998A8: .4byte gSprites
_080998AC: .4byte gTasks
	thumb_func_end sub_8099788

	thumb_func_start sub_80998B0
sub_80998B0: @ 80998B0
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r6, _080998FC @ =gBattleAnimArgs
	ldrb r0, [r6, 0x6]
	bl GetAnimBankSpriteId
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldrb r1, [r6, 0x8]
	adds r0, r5, 0
	bl sub_80758E0
	ldr r1, _08099900 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r6]
	strh r1, [r0, 0x8]
	ldrh r1, [r6, 0x2]
	strh r1, [r0, 0xA]
	ldrh r1, [r6, 0x4]
	strh r1, [r0, 0xC]
	ldrh r1, [r6, 0x4]
	strh r1, [r0, 0xE]
	strh r5, [r0, 0x10]
	movs r1, 0x80
	lsls r1, 1
	strh r1, [r0, 0x1C]
	strh r1, [r0, 0x1E]
	ldr r1, _08099904 @ =sub_8099908
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080998FC: .4byte gBattleAnimArgs
_08099900: .4byte gTasks
_08099904: .4byte sub_8099908
	thumb_func_end sub_80998B0

	thumb_func_start sub_8099908
sub_8099908: @ 8099908
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _08099968 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x8]
	ldrh r1, [r4, 0x1C]
	adds r0, r1
	strh r0, [r4, 0x1C]
	ldrh r0, [r4, 0xA]
	ldrh r3, [r4, 0x1E]
	adds r0, r3
	strh r0, [r4, 0x1E]
	ldrb r0, [r4, 0x10]
	adds r6, r0, 0
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	movs r3, 0x1E
	ldrsh r2, [r4, r3]
	adds r0, r6, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	bne _08099978
	ldrh r2, [r4, 0xE]
	movs r3, 0xE
	ldrsh r0, [r4, r3]
	cmp r0, 0
	ble _0809996C
	ldrh r0, [r4, 0x8]
	negs r0, r0
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xA]
	negs r0, r0
	strh r0, [r4, 0xA]
	strh r2, [r4, 0xC]
	strh r1, [r4, 0xE]
	b _08099978
	.align 2, 0
_08099968: .4byte gTasks
_0809996C:
	adds r0, r6, 0
	bl sub_8075980
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_08099978:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8099908

	thumb_func_start sub_8099980
sub_8099980: @ 8099980
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, _080999BC @ =gBattleAnimArgs
	ldrb r0, [r4, 0x4]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r1, 0
	bl sub_80758E0
	ldr r1, _080999C0 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2, 0xA]
	ldrh r0, [r4]
	strh r0, [r2, 0xC]
	movs r3, 0x6
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	beq _080999C4
	strh r1, [r2, 0xE]
	b _080999D0
	.align 2, 0
_080999BC: .4byte gBattleAnimArgs
_080999C0: .4byte gTasks
_080999C4:
	ldrh r0, [r4]
	ldrh r1, [r4, 0x2]
	adds r3, r0, 0
	muls r3, r1
	adds r0, r3, 0
	strh r0, [r2, 0xE]
_080999D0:
	ldr r1, _080999FC @ =gTasks
	lsls r4, r7, 2
	adds r0, r4, r7
	lsls r0, 3
	adds r5, r0, r1
	ldr r6, _08099A00 @ =gBattleAnimArgs
	ldrh r0, [r6, 0x2]
	strh r0, [r5, 0x10]
	mov r0, r8
	strh r0, [r5, 0x12]
	ldrh r0, [r6, 0x6]
	strh r0, [r5, 0x14]
	bl sub_8073788
	lsls r0, 24
	mov r8, r4
	cmp r0, 0
	beq _08099A04
	movs r0, 0x1
	strh r0, [r5, 0x16]
	b _08099A28
	.align 2, 0
_080999FC: .4byte gTasks
_08099A00: .4byte gBattleAnimArgs
_08099A04:
	movs r1, 0x4
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _08099A14
	ldr r0, _08099A10 @ =gBattleAnimAttacker
	b _08099A16
	.align 2, 0
_08099A10: .4byte gBattleAnimAttacker
_08099A14:
	ldr r0, _08099A6C @ =gBattleAnimTarget
_08099A16:
	ldrb r0, [r0]
	bl GetBattlerSide
	movs r1, 0
	lsls r0, 24
	cmp r0, 0
	bne _08099A26
	movs r1, 0x1
_08099A26:
	strh r1, [r5, 0x16]
_08099A28:
	ldr r0, _08099A70 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r4, r1, r0
	movs r3, 0x16
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _08099A54
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _08099A54
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4, 0xE]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	negs r0, r0
	strh r0, [r4, 0x10]
_08099A54:
	ldr r0, _08099A70 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _08099A74 @ =sub_8099B54
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099A6C: .4byte gBattleAnimTarget
_08099A70: .4byte gTasks
_08099A74: .4byte sub_8099B54
	thumb_func_end sub_8099980

	thumb_func_start sub_8099A78
sub_8099A78: @ 8099A78
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _08099AB4 @ =gBattleAnimArgs
	ldrb r0, [r4, 0x4]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r1, 0
	bl sub_80758E0
	ldr r1, _08099AB8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xA]
	ldrh r1, [r4]
	strh r1, [r0, 0xC]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08099AC0
	ldr r0, _08099ABC @ =gBattleAnimAttacker
	b _08099AC2
	.align 2, 0
_08099AB4: .4byte gBattleAnimArgs
_08099AB8: .4byte gTasks
_08099ABC: .4byte gBattleAnimAttacker
_08099AC0:
	ldr r0, _08099AF0 @ =gBattleAnimTarget
_08099AC2:
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08099AD4
	ldrh r0, [r4, 0x2]
	negs r0, r0
	strh r0, [r4, 0x2]
_08099AD4:
	ldr r0, _08099AF4 @ =gBattleAnimArgs
	movs r2, 0x6
	ldrsh r1, [r0, r2]
	adds r6, r0, 0
	cmp r1, 0x1
	beq _08099AFC
	ldr r2, _08099AF8 @ =gTasks
	lsls r3, r5, 2
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0xE]
	b _08099B16
	.align 2, 0
_08099AF0: .4byte gBattleAnimTarget
_08099AF4: .4byte gBattleAnimArgs
_08099AF8: .4byte gTasks
_08099AFC:
	ldr r3, _08099B4C @ =gTasks
	lsls r4, r5, 2
	adds r0, r4, r5
	lsls r0, 3
	adds r0, r3
	ldrh r2, [r6]
	ldrh r1, [r6, 0x2]
	adds r7, r2, 0
	muls r7, r1
	adds r1, r7, 0
	strh r1, [r0, 0xE]
	adds r2, r3, 0
	adds r3, r4, 0
_08099B16:
	adds r1, r3, r5
	lsls r1, 3
	adds r1, r2
	ldrh r0, [r6, 0x2]
	strh r0, [r1, 0x10]
	mov r0, r8
	strh r0, [r1, 0x12]
	ldrh r0, [r6, 0x6]
	strh r0, [r1, 0x14]
	movs r0, 0x1
	strh r0, [r1, 0x16]
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1, 0xE]
	movs r7, 0x10
	ldrsh r0, [r1, r7]
	negs r0, r0
	strh r0, [r1, 0x10]
	ldr r0, _08099B50 @ =sub_8099B54
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099B4C: .4byte gTasks
_08099B50: .4byte sub_8099B54
	thumb_func_end sub_8099A78

	thumb_func_start sub_8099B54
sub_8099B54: @ 8099B54
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08099BAC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x10]
	ldrh r1, [r4, 0xE]
	adds r0, r1
	strh r0, [r4, 0xE]
	ldrb r0, [r4, 0x12]
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0xE]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08099B88
	ldrb r0, [r4, 0x12]
	bl sub_80759DC
_08099B88:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _08099BCE
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08099BB0
	cmp r0, 0x1
	ble _08099BB6
	cmp r0, 0x2
	beq _08099BBE
	b _08099BB6
	.align 2, 0
_08099BAC: .4byte gTasks
_08099BB0:
	ldrb r0, [r4, 0x12]
	bl sub_8075980
_08099BB6:
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	b _08099BCE
_08099BBE:
	movs r0, 0
	strh r0, [r4, 0xA]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	negs r0, r0
	strh r0, [r4, 0x10]
	movs r0, 0x1
	strh r0, [r4, 0x14]
_08099BCE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8099B54

	thumb_func_start sub_8099BD4
sub_8099BD4: @ 8099BD4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08099C00 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r8, r0
	cmp r1, 0
	bne _08099C0C
	ldr r4, _08099C04 @ =gTasks
	lsls r5, r7, 2
	adds r0, r5, r7
	lsls r0, 3
	adds r6, r0, r4
	ldr r0, _08099C08 @ =gUnknown_2037EEC
	ldrh r0, [r0]
	movs r1, 0xC
	bl __udivsi3
	b _08099C20
	.align 2, 0
_08099C00: .4byte gBattleAnimArgs
_08099C04: .4byte gTasks
_08099C08: .4byte gUnknown_2037EEC
_08099C0C:
	ldr r4, _08099CA8 @ =gTasks
	lsls r5, r7, 2
	adds r0, r5, r7
	lsls r0, 3
	adds r6, r0, r4
	ldr r0, _08099CAC @ =gUnknown_2037EE8
	ldr r0, [r0]
	movs r1, 0xC
	bl __divsi3
_08099C20:
	strh r0, [r6, 0x26]
	lsls r0, 16
	adds r1, r4, 0
	cmp r0, 0
	bgt _08099C2E
	movs r0, 0x1
	strh r0, [r6, 0x26]
_08099C2E:
	movs r2, 0x26
	ldrsh r0, [r6, r2]
	cmp r0, 0x10
	ble _08099C3A
	movs r0, 0x10
	strh r0, [r6, 0x26]
_08099C3A:
	adds r4, r5, r7
	lsls r4, 3
	adds r4, r1
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	movs r5, 0
	strh r1, [r4, 0x24]
	ldrh r2, [r4, 0x26]
	movs r0, 0x1
	ands r0, r2
	adds r1, r0
	strh r1, [r4, 0x22]
	strh r5, [r4, 0x20]
	mov r1, r8
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x1C]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x1E]
	movs r0, 0x1
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x16]
	ldr r2, _08099CB0 @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x24]
	strh r0, [r4, 0x18]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x26]
	strh r0, [r4, 0x1A]
	strh r5, [r4, 0x8]
	mov r1, r8
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0xA]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0xC]
	ldr r0, _08099CB4 @ =sub_8099CB8
	str r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099CA8: .4byte gTasks
_08099CAC: .4byte gUnknown_2037EE8
_08099CB0: .4byte gSprites
_08099CB4: .4byte sub_8099CB8
	thumb_func_end sub_8099BD4

	thumb_func_start sub_8099CB8
sub_8099CB8: @ 8099CB8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08099D0C @ =gTasks
	adds r3, r0, r1
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xA
	ldrsh r1, [r3, r2]
	cmp r0, r1
	ble _08099D96
	movs r0, 0
	strh r0, [r3, 0x8]
	ldrh r0, [r3, 0x20]
	adds r1, r0, 0x1
	movs r0, 0x1
	ands r1, r0
	strh r1, [r3, 0x20]
	movs r2, 0x1C
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _08099D2A
	cmp r1, 0
	beq _08099D14
	ldr r2, _08099D10 @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x22]
	ldrh r2, [r3, 0x18]
	adds r1, r2
	b _08099D28
	.align 2, 0
_08099D0C: .4byte gTasks
_08099D10: .4byte gSprites
_08099D14:
	ldr r2, _08099D50 @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x18]
	ldrh r2, [r3, 0x24]
	subs r1, r2
_08099D28:
	strh r1, [r0, 0x24]
_08099D2A:
	movs r1, 0x1E
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _08099D64
	movs r2, 0x20
	ldrsh r4, [r3, r2]
	cmp r4, 0
	beq _08099D54
	ldr r2, _08099D50 @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x26]
	strh r1, [r0, 0x26]
	b _08099D64
	.align 2, 0
_08099D50: .4byte gSprites
_08099D54:
	ldr r2, _08099D9C @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x26]
_08099D64:
	ldrh r0, [r3, 0xC]
	subs r0, 0x1
	strh r0, [r3, 0xC]
	lsls r0, 16
	asrs r4, r0, 16
	cmp r4, 0
	bne _08099D96
	ldr r2, _08099D9C @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x24]
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x26]
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_08099D96:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08099D9C: .4byte gSprites
	thumb_func_end sub_8099CB8

	.align 2, 0 @ Don't pad with nop.
