	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80B3FAC
sub_80B3FAC: @ 80B3FAC
	push {r4-r6,lr}
	adds r6, r0, 0
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080B3FD8
	adds r0, r6, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	ldr r0, _080B3FD4 @ =gBattleAnimArgs
	ldrh r1, [r0, 0x4]
	negs r1, r1
	strh r1, [r0, 0x4]
	ldrh r1, [r0]
	negs r1, r1
	strh r1, [r0]
	b _080B4008
	.align 2, 0
_080B3FD4: .4byte gBattleAnimArgs
_080B3FD8:
	ldr r0, _080B406C @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B4008
	adds r0, r6, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r1, _080B4070 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
	ldrh r0, [r1, 0x6]
	negs r0, r0
	strh r0, [r1, 0x6]
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080B4008:
	ldr r5, _080B406C @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074844
	lsls r0, 24
	ldr r4, _080B4070 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074844
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r6, 0x22]
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x6]
	adds r0, r4
	strh r0, [r6, 0x36]
	ldr r0, _080B4074 @ =sub_8075590
	str r0, [r6, 0x1C]
	ldr r1, _080B4078 @ =DestroyAnimSprite
	adds r0, r6, 0
	bl StoreSpriteCallbackInData6
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B406C: .4byte gBattleAnimTarget
_080B4070: .4byte gBattleAnimArgs
_080B4074: .4byte sub_8075590
_080B4078: .4byte DestroyAnimSprite
	thumb_func_end sub_80B3FAC

	thumb_func_start sub_80B407C
sub_80B407C: @ 80B407C
	push {r4-r6,lr}
	adds r6, r0, 0
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080B40A0
	ldr r1, _080B409C @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
	adds r0, r6, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	b _080B40BC
	.align 2, 0
_080B409C: .4byte gBattleAnimArgs
_080B40A0:
	ldr r0, _080B4118 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B40BC
	ldr r0, _080B411C @ =gBattleAnimArgs
	ldrh r1, [r0, 0x2]
	negs r1, r1
	strh r1, [r0, 0x2]
	ldrh r1, [r0]
	negs r1, r1
	strh r1, [r0]
_080B40BC:
	ldr r5, _080B4118 @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074844
	lsls r0, 24
	ldr r4, _080B411C @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074844
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r6, 0x22]
	ldrh r0, [r4, 0x4]
	strh r0, [r6, 0x2E]
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x36]
	ldr r0, _080B4120 @ =sub_8075590
	str r0, [r6, 0x1C]
	ldr r1, _080B4124 @ =DestroyAnimSprite
	adds r0, r6, 0
	bl StoreSpriteCallbackInData6
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B4118: .4byte gBattleAnimTarget
_080B411C: .4byte gBattleAnimArgs
_080B4120: .4byte sub_8075590
_080B4124: .4byte DestroyAnimSprite
	thumb_func_end sub_80B407C

	thumb_func_start sub_80B4128
sub_80B4128: @ 80B4128
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080B4144
	ldr r0, _080B4184 @ =gBattleAnimArgs
	movs r2, 0x4
	ldrsh r1, [r0, r2]
	lsrs r2, r1, 31
	adds r1, r2
	asrs r1, 1
	strh r1, [r0, 0x4]
_080B4144:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r1, _080B4184 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080B418C
	ldr r4, _080B4188 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	b _080B419E
	.align 2, 0
_080B4184: .4byte gBattleAnimArgs
_080B4188: .4byte gBattleAnimTarget
_080B418C:
	ldr r0, _080B41B4 @ =gBattleAnimTarget
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x32
	adds r3, r5, 0
	adds r3, 0x36
	movs r1, 0x1
	bl sub_8076D9C
_080B419E:
	adds r0, r5, 0
	bl sub_8075678
	ldr r0, _080B41B8 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x6]
	strh r0, [r5, 0x38]
	ldr r0, _080B41BC @ =sub_80B41C0
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B41B4: .4byte gBattleAnimTarget
_080B41B8: .4byte gBattleAnimArgs
_080B41BC: .4byte sub_80B41C0
	thumb_func_end sub_80B4128

	thumb_func_start sub_80B41C0
sub_80B41C0: @ 80B41C0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	beq _080B41D6
	adds r0, r4, 0
	bl DestroyAnimSprite
	b _080B41F2
_080B41D6:
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x3A]
	adds r0, 0xD
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3A]
_080B41F2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B41C0

	thumb_func_start sub_80B41F8
sub_80B41F8: @ 80B41F8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080B4228 @ =gBattleAnimTarget
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0
	bl sub_8076D9C
	ldr r0, _080B422C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B4234
	ldr r0, _080B4230 @ =gBattleAnimArgs
	ldrh r1, [r4, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r4, 0x20]
	b _080B4240
	.align 2, 0
_080B4228: .4byte gBattleAnimTarget
_080B422C: .4byte gBattleAnimAttacker
_080B4230: .4byte gBattleAnimArgs
_080B4234:
	ldr r1, _080B4268 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	adds r0, r1, 0
_080B4240:
	ldrh r0, [r0, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _080B426C @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B425C
	ldrh r0, [r4, 0x22]
	adds r0, 0x8
	strh r0, [r4, 0x22]
_080B425C:
	ldr r0, _080B4270 @ =sub_80B4274
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4268: .4byte gBattleAnimArgs
_080B426C: .4byte gBattleAnimTarget
_080B4270: .4byte sub_80B4274
	thumb_func_end sub_80B41F8

	thumb_func_start sub_80B4274
sub_80B4274: @ 80B4274
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080B42A8
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
_080B42A8:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _080B42BC
	adds r0, r3, 0
	bl DestroyAnimSprite
_080B42BC:
	pop {r0}
	bx r0
	thumb_func_end sub_80B4274

	thumb_func_start sub_80B42C0
sub_80B42C0: @ 80B42C0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0x10
	bl SetGpuReg
	movs r0, 0x10
	strh r0, [r4, 0x2E]
	ldr r0, _080B42E4 @ =sub_80B42E8
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B42E4: .4byte sub_80B42E8
	thumb_func_end sub_80B42C0

	thumb_func_start sub_80B42E8
sub_80B42E8: @ 80B42E8
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x32]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0x13
	bgt _080B42FC
	adds r0, r1, 0x1
	strh r0, [r4, 0x32]
	b _080B433A
_080B42FC:
	ldrh r1, [r4, 0x30]
	adds r0, r1, 0x1
	strh r0, [r4, 0x30]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B433A
	ldrh r1, [r4, 0x2E]
	subs r1, 0x1
	strh r1, [r4, 0x2E]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B433A
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080B4340 @ =sub_80B4344
	str r0, [r4, 0x1C]
_080B433A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4340: .4byte sub_80B4344
	thumb_func_end sub_80B42E8

	thumb_func_start sub_80B4344
sub_80B4344: @ 80B4344
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r4, 0
	bl DestroyAnimSprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B4344

	thumb_func_start sub_80B4364
sub_80B4364: @ 80B4364
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080B4384
	ldr r1, _080B4380 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
	b _080B43A6
	.align 2, 0
_080B4380: .4byte gBattleAnimArgs
_080B4384:
	ldr r0, _080B4480 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B43A6
	ldr r1, _080B4484 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
	ldrh r0, [r1, 0x6]
	negs r0, r0
	strh r0, [r1, 0x6]
_080B43A6:
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080B43F6
	ldr r0, _080B4480 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	adds r4, r0, 0
	ldr r5, _080B4488 @ =gBattleAnimTarget
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080B43F6
	ldrb r0, [r5]
	bl GetBattlerPosition
	lsls r0, 24
	cmp r0, 0
	beq _080B43E4
	ldrb r0, [r5]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B43F6
_080B43E4:
	ldr r0, _080B4484 @ =gBattleAnimArgs
	movs r2, 0x4
	ldrsh r1, [r0, r2]
	negs r1, r1
	strh r1, [r0, 0x4]
	movs r2, 0
	ldrsh r1, [r0, r2]
	negs r1, r1
	strh r1, [r0]
_080B43F6:
	adds r0, r7, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r5, _080B4488 @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	adds r4, r0, 0
	lsls r4, 24
	ldr r6, _080B4484 @ =gBattleAnimArgs
	lsrs r4, 24
	ldrh r0, [r6, 0x4]
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r6, 0x6]
	adds r1, r2
	lsls r1, 16
	ldrh r2, [r7, 0x20]
	lsls r0, r4, 16
	asrs r0, 16
	subs r0, r2
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r7, 0x22]
	lsrs r5, r1, 16
	asrs r1, 16
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	bl sub_8075B30
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 24
	adds r0, r1
	lsrs r0, 16
	movs r3, 0x80
	lsls r3, 1
	str r0, [sp]
	adds r0, r7, 0
	movs r1, 0
	adds r2, r3, 0
	bl sub_8075A1C
	ldrh r0, [r6, 0x8]
	strh r0, [r7, 0x2E]
	strh r4, [r7, 0x32]
	strh r5, [r7, 0x36]
	ldr r0, _080B448C @ =sub_8075590
	str r0, [r7, 0x1C]
	ldr r1, _080B4490 @ =DestroyAnimSprite
	adds r0, r7, 0
	bl StoreSpriteCallbackInData6
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4480: .4byte gBattleAnimAttacker
_080B4484: .4byte gBattleAnimArgs
_080B4488: .4byte gBattleAnimTarget
_080B448C: .4byte sub_8075590
_080B4490: .4byte DestroyAnimSprite
	thumb_func_end sub_80B4364

	thumb_func_start sub_80B4494
sub_80B4494: @ 80B4494
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _080B4500 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B44B4
	ldr r1, _080B4504 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080B44B4:
	ldr r4, _080B4504 @ =gBattleAnimArgs
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldr r5, _080B4508 @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x6]
	adds r0, r1
	strh r0, [r6, 0x36]
	ldrh r0, [r4, 0xA]
	strh r0, [r6, 0x38]
	adds r0, r6, 0
	bl sub_8075068
	ldr r0, _080B450C @ =sub_80B4510
	str r0, [r6, 0x1C]
	adds r2, r6, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B4500: .4byte gBattleAnimAttacker
_080B4504: .4byte gBattleAnimArgs
_080B4508: .4byte gBattleAnimTarget
_080B450C: .4byte sub_80B4510
	thumb_func_end sub_80B4494

	thumb_func_start sub_80B4510
sub_80B4510: @ 80B4510
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r2]
	adds r0, r4, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080B453C
	adds r0, r4, 0
	bl DestroyAnimSprite
	b _080B45CC
_080B453C:
	movs r0, 0x2E
	adds r0, r4
	mov r8, r0
	ldrh r7, [r4, 0x20]
	ldrh r5, [r4, 0x24]
	ldrh r1, [r4, 0x22]
	mov r12, r1
	ldrh r6, [r4, 0x26]
	mov r2, r8
	add r1, sp, 0x4
	movs r3, 0x7
_080B4552:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080B4552
	adds r0, r7, r5
	lsls r0, 16
	lsrs r5, r0, 16
	mov r2, r12
	adds r0, r2, r6
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	bne _080B45CC
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	lsls r1, r5, 16
	asrs r1, 16
	subs r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r1, r2
	lsls r2, r6, 16
	asrs r2, 16
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	bl sub_8075B30
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 24
	adds r0, r1
	lsrs r0, 16
	movs r3, 0x80
	lsls r3, 1
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0
	adds r2, r3, 0
	bl sub_8075A1C
	add r2, sp, 0x4
	mov r1, r8
	movs r3, 0x7
_080B45BE:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080B45BE
_080B45CC:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B4510

	thumb_func_start sub_80B45D8
sub_80B45D8: @ 80B45D8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080B45EC @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B45F4
	ldr r4, _080B45F0 @ =gBattleAnimAttacker
	b _080B45F6
	.align 2, 0
_080B45EC: .4byte gBattleAnimArgs
_080B45F0: .4byte gBattleAnimAttacker
_080B45F4:
	ldr r4, _080B4628 @ =gBattleAnimTarget
_080B45F6:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x12
	strh r0, [r5, 0x22]
	ldr r1, _080B462C @ =move_anim_8074EE0
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080B4630 @ =sub_8074F50
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B4628: .4byte gBattleAnimTarget
_080B462C: .4byte move_anim_8074EE0
_080B4630: .4byte sub_8074F50
	thumb_func_end sub_80B45D8

	.align 2, 0 @ Don't pad with nop.
