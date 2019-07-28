	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80B78E0
sub_80B78E0: @ 80B78E0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080B791C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080B7920 @ =gBattleAnimArgs
	ldrh r1, [r1]
	strh r1, [r0, 0x8]
	ldr r1, _080B7924 @ =gBattleAnimAttacker
	ldrb r4, [r1]
	movs r1, 0x10
	strh r1, [r0, 0xA]
	movs r0, 0x52
	bl SetGpuReg
	adds r0, r4, 0
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B792C
	ldr r1, _080B7928 @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	b _080B7934
	.align 2, 0
_080B791C: .4byte gTasks
_080B7920: .4byte gBattleAnimArgs
_080B7924: .4byte gBattleAnimAttacker
_080B7928: .4byte 0x00003f42
_080B792C:
	ldr r1, _080B7948 @ =0x00003f44
	movs r0, 0x50
	bl SetGpuReg
_080B7934:
	ldr r0, _080B794C @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080B7950 @ =sub_80B7954
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7948: .4byte 0x00003f44
_080B794C: .4byte gTasks
_080B7950: .4byte sub_80B7954
	thumb_func_end sub_80B78E0

	thumb_func_start sub_80B7954
sub_80B7954: @ 80B7954
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080B79C0 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r6, r0, r1
	ldrh r0, [r6, 0xA]
	lsrs r4, r0, 8
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xC
	ldrsh r0, [r6, r2]
	ldrb r2, [r6, 0x8]
	cmp r0, r2
	bne _080B79D0
	adds r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	subs r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r4, 8
	orrs r1, r0
	movs r5, 0
	strh r1, [r6, 0xA]
	ldrh r1, [r6, 0xA]
	movs r0, 0x52
	bl SetGpuReg
	strh r5, [r6, 0xC]
	cmp r4, 0x10
	bne _080B79D6
	ldr r2, _080B79C4 @ =gSprites
	ldr r1, _080B79C8 @ =gBattlerSpriteIds
	ldr r0, _080B79CC @ =gBattleAnimAttacker
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r7, 0
	bl DestroyAnimVisualTask
	b _080B79D6
	.align 2, 0
_080B79C0: .4byte gTasks
_080B79C4: .4byte gSprites
_080B79C8: .4byte gBattlerSpriteIds
_080B79CC: .4byte gBattleAnimAttacker
_080B79D0:
	ldrh r0, [r6, 0xC]
	adds r0, 0x1
	strh r0, [r6, 0xC]
_080B79D6:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B7954

	thumb_func_start sub_80B79DC
sub_80B79DC: @ 80B79DC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B7A08 @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r1
	ldr r0, _080B7A0C @ =gBattleAnimArgs
	ldrh r0, [r0]
	strh r0, [r2, 0x8]
	movs r1, 0x80
	lsls r1, 5
	strh r1, [r2, 0xA]
	ldr r0, _080B7A10 @ =sub_80B7A14
	str r0, [r2]
	movs r0, 0x52
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_080B7A08: .4byte gTasks
_080B7A0C: .4byte gBattleAnimArgs
_080B7A10: .4byte sub_80B7A14
	thumb_func_end sub_80B79DC

	thumb_func_start sub_80B7A14
sub_80B7A14: @ 80B7A14
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080B7A70 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r6, r0, r1
	ldrh r0, [r6, 0xA]
	lsrs r4, r0, 8
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xC
	ldrsh r0, [r6, r2]
	ldrb r2, [r6, 0x8]
	cmp r0, r2
	bne _080B7A74
	subs r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r4, 8
	orrs r1, r0
	movs r5, 0
	strh r1, [r6, 0xA]
	ldrh r1, [r6, 0xA]
	movs r0, 0x52
	bl SetGpuReg
	strh r5, [r6, 0xC]
	cmp r4, 0
	bne _080B7A7A
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r7, 0
	bl DestroyAnimVisualTask
	b _080B7A7A
	.align 2, 0
_080B7A70: .4byte gTasks
_080B7A74:
	ldrh r0, [r6, 0xC]
	adds r0, 0x1
	strh r0, [r6, 0xC]
_080B7A7A:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B7A14

	thumb_func_start sub_80B7A80
sub_80B7A80: @ 80B7A80
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	ldr r0, _080B7AAC @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B7AB4
	ldr r1, _080B7AB0 @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	b _080B7ABC
	.align 2, 0
_080B7AAC: .4byte gBattleAnimAttacker
_080B7AB0: .4byte 0x00003f42
_080B7AB4:
	ldr r1, _080B7AC8 @ =0x00003f44
	movs r0, 0x50
	bl SetGpuReg
_080B7ABC:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7AC8: .4byte 0x00003f44
	thumb_func_end sub_80B7A80

	thumb_func_start sub_80B7ACC
sub_80B7ACC: @ 80B7ACC
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _080B7B38 @ =gBattleAnimTarget
	ldrb r0, [r6]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x30]
	ldr r5, _080B7B3C @ =gBattleAnimAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r6]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x34]
	ldrb r0, [r5]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	movs r0, 0x7E
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl InitSpriteDataForLinearTranslation
	ldrh r0, [r4, 0x30]
	negs r0, r0
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x32]
	negs r0, r0
	strh r0, [r4, 0x36]
	ldr r0, _080B7B40 @ =0x0000ffd8
	strh r0, [r4, 0x3A]
	ldr r1, _080B7B44 @ =sub_80B7B48
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7B38: .4byte gBattleAnimTarget
_080B7B3C: .4byte gBattleAnimAttacker
_080B7B40: .4byte 0x0000ffd8
_080B7B44: .4byte sub_80B7B48
	thumb_func_end sub_80B7ACC

	thumb_func_start sub_80B7B48
sub_80B7B48: @ 80B7B48
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r5, [r4, 0x30]
	ldrh r0, [r4, 0x34]
	adds r2, r5, r0
	strh r2, [r4, 0x34]
	ldrh r3, [r4, 0x32]
	ldrh r6, [r4, 0x36]
	adds r1, r3, r6
	strh r1, [r4, 0x36]
	lsls r0, r2, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	lsls r0, r1, 16
	asrs r0, 24
	strh r0, [r4, 0x26]
	movs r6, 0x3C
	ldrsh r0, [r4, r6]
	cmp r0, 0
	bne _080B7B8A
	adds r0, r2, r5
	strh r0, [r4, 0x34]
	adds r1, r3
	strh r1, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	lsls r1, 16
	asrs r1, 24
	strh r1, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
_080B7B8A:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x3A
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r6, [r4, 0x26]
	adds r0, r6
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	adds r0, 0x3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	cmp r0, 0x7F
	ble _080B7BBA
	movs r0, 0
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x3A]
	adds r0, 0x14
	strh r0, [r4, 0x3A]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
_080B7BBA:
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _080B7BCC
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B7BCC:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80B7B48

	thumb_func_start sub_80B7BD4
sub_80B7BD4: @ 80B7BD4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080B7C08 @ =gBattleAnimArgs
	ldrh r0, [r5]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrb r1, [r5, 0x4]
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0xA]
	strh r0, [r4, 0x32]
	ldr r0, _080B7C0C @ =sub_80B7C10
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7C08: .4byte gBattleAnimArgs
_080B7C0C: .4byte sub_80B7C10
	thumb_func_end sub_80B7BD4

	thumb_func_start sub_80B7C10
sub_80B7C10: @ 80B7C10
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x36]
	adds r0, r1
	strh r0, [r2, 0x36]
	ldrh r1, [r2, 0x30]
	ldrh r3, [r2, 0x38]
	adds r1, r3
	strh r1, [r2, 0x38]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r2, 0x24]
	lsls r1, 16
	asrs r1, 24
	strh r1, [r2, 0x26]
	ldrh r0, [r2, 0x34]
	adds r0, 0x1
	strh r0, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x32
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bne _080B7C46
	ldr r0, _080B7C4C @ =sub_80B7C50
	str r0, [r2, 0x1C]
_080B7C46:
	pop {r0}
	bx r0
	.align 2, 0
_080B7C4C: .4byte sub_80B7C50
	thumb_func_end sub_80B7C10

	thumb_func_start sub_80B7C50
sub_80B7C50: @ 80B7C50
	push {lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x36]
	ldrh r0, [r3, 0x2E]
	subs r1, r0
	strh r1, [r3, 0x36]
	ldrh r0, [r3, 0x38]
	ldrh r2, [r3, 0x30]
	subs r0, r2
	strh r0, [r3, 0x38]
	lsls r1, 16
	asrs r1, 24
	strh r1, [r3, 0x24]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r3, 0x26]
	ldrh r0, [r3, 0x34]
	subs r0, 0x1
	strh r0, [r3, 0x34]
	lsls r0, 16
	cmp r0, 0
	bne _080B7C82
	adds r0, r3, 0
	bl move_anim_8074EE0
_080B7C82:
	pop {r0}
	bx r0
	thumb_func_end sub_80B7C50

	thumb_func_start sub_80B7C88
sub_80B7C88: @ 80B7C88
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r0, _080B7C9C @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r3, r0, 0
	cmp r1, 0
	bne _080B7CA4
	ldr r0, _080B7CA0 @ =gBattleAnimAttacker
	b _080B7CA6
	.align 2, 0
_080B7C9C: .4byte gBattleAnimArgs
_080B7CA0: .4byte gBattleAnimAttacker
_080B7CA4:
	ldr r0, _080B7CD4 @ =gBattleAnimTarget
_080B7CA6:
	ldrb r5, [r0]
	movs r6, 0x14
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x4
	ldr r7, _080B7CD8 @ =0x000003ff
	adds r0, r7, 0
	ands r1, r0
	ldr r0, _080B7CDC @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	movs r1, 0x2
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	beq _080B7D04
	cmp r0, 0x1
	bgt _080B7CE0
	cmp r0, 0
	beq _080B7CEA
	b _080B7D58
	.align 2, 0
_080B7CD4: .4byte gBattleAnimTarget
_080B7CD8: .4byte 0x000003ff
_080B7CDC: .4byte 0xfffffc00
_080B7CE0:
	cmp r0, 0x2
	beq _080B7D1E
	cmp r0, 0x3
	beq _080B7D36
	b _080B7D58
_080B7CEA:
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_8076B2C
	subs r0, 0x8
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8076B2C
	adds r0, 0x8
	strh r0, [r4, 0x22]
	b _080B7D58
_080B7D04:
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_8076B2C
	subs r0, 0xE
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8076B2C
	adds r0, 0x10
	strh r0, [r4, 0x22]
	b _080B7D58
_080B7D1E:
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_8076B2C
	adds r0, 0x8
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8076B2C
	adds r0, 0x8
	b _080B7D4C
_080B7D36:
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_8076B2C
	adds r0, 0xE
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8076B2C
	adds r0, 0x10
_080B7D4C:
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	movs r6, 0xEC
_080B7D58:
	movs r0, 0x20
	strh r0, [r4, 0x2E]
	lsls r0, r6, 24
	asrs r0, 24
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	adds r0, 0xC
	strh r0, [r4, 0x36]
	ldr r0, _080B7D80 @ =0x0000fff4
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_8075068
	ldr r0, _080B7D84 @ =sub_80B7D88
	str r0, [r4, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7D80: .4byte 0x0000fff4
_080B7D84: .4byte sub_80B7D88
	thumb_func_end sub_80B7C88

	thumb_func_start sub_80B7D88
sub_80B7D88: @ 80B7D88
	push {r4,lr}
	adds r4, r0, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080B7D9C
	adds r0, r4, 0
	bl move_anim_8074EE0
_080B7D9C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B7D88

	thumb_func_start sub_80B7DA4
sub_80B7DA4: @ 80B7DA4
	push {r4-r7,lr}
	sub sp, 0x1C
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B7E08 @ =gTasks
	adds r5, r1, r0
	ldr r4, _080B7E0C @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1F
	movs r6, 0
	strh r0, [r5, 0x16]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8076B2C
	subs r0, 0x7
	strh r0, [r5, 0x14]
	ldrh r1, [r5, 0x16]
	strh r1, [r5, 0x12]
	strh r0, [r5, 0x10]
	subs r1, r0
	lsls r1, 8
	strh r1, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	subs r1, 0x20
	strh r1, [r5, 0x24]
	adds r0, 0x20
	strh r0, [r5, 0x26]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B7E14
	ldr r0, _080B7E10 @ =0x0000fff4
	b _080B7E16
	.align 2, 0
_080B7E08: .4byte gTasks
_080B7E0C: .4byte gBattleAnimAttacker
_080B7E10: .4byte 0x0000fff4
_080B7E14:
	ldr r0, _080B7E60 @ =0x0000ffc0
_080B7E16:
	strh r0, [r5, 0x18]
	ldr r0, _080B7E64 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xE]
	cmp r0, 0x1
	bne _080B7E78
	add r4, sp, 0xC
	adds r0, r4, 0
	bl sub_80752A0
	ldr r0, _080B7E68 @ =gBattle_BG1_Y
	ldrh r0, [r0]
	strh r0, [r5, 0x1C]
	ldr r1, _080B7E6C @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	ldrb r1, [r4, 0x8]
	lsls r1, 4
	movs r0, 0
	movs r2, 0x20
	bl FillPalette
	ldr r0, _080B7E70 @ =0x04000016
	str r0, [sp]
	movs r7, 0x2
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080B7EA8
	ldr r1, _080B7E74 @ =gBattle_BG2_X
	b _080B7EA2
	.align 2, 0
_080B7E60: .4byte 0x0000ffc0
_080B7E64: .4byte gBattleAnimAttacker
_080B7E68: .4byte gBattle_BG1_Y
_080B7E6C: .4byte 0x00003f42
_080B7E70: .4byte 0x04000016
_080B7E74: .4byte gBattle_BG2_X
_080B7E78:
	ldr r0, _080B7F30 @ =gBattle_BG2_Y
	ldrh r0, [r0]
	strh r0, [r5, 0x1C]
	ldr r1, _080B7F34 @ =0x00003f44
	movs r0, 0x50
	bl SetGpuReg
	movs r0, 0
	movs r1, 0x90
	movs r2, 0x20
	bl FillPalette
	ldr r0, _080B7F38 @ =0x0400001a
	str r0, [sp]
	movs r7, 0x4
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080B7EA8
	ldr r1, _080B7F3C @ =gBattle_BG1_X
_080B7EA2:
	ldrh r0, [r1]
	adds r0, 0xF0
	strh r0, [r1]
_080B7EA8:
	ldr r0, _080B7F40 @ =0xa2600001
	str r0, [sp, 0x4]
	mov r2, sp
	movs r1, 0
	movs r0, 0x1
	strb r0, [r2, 0x8]
	mov r0, sp
	strb r1, [r0, 0x9]
	strh r1, [r5, 0x1E]
	movs r0, 0x10
	strh r0, [r5, 0x20]
	strh r1, [r5, 0x8]
	strh r1, [r5, 0xA]
	strh r1, [r5, 0xC]
	movs r0, 0x3
	bl sub_80B856C
	movs r3, 0
	ldr r4, _080B7F44 @ =gScanlineEffectRegBuffers
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r4, r0
_080B7ED4:
	lsls r1, r3, 1
	adds r2, r1, r4
	ldrh r0, [r5, 0x1C]
	strh r0, [r2]
	adds r1, r6
	ldrh r0, [r5, 0x1C]
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x6F
	bls _080B7ED4
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl ScanlineEffect_SetParams
	movs r0, 0x3F
	eors r7, r0
	movs r1, 0xFC
	lsls r1, 6
	adds r0, r1, 0
	orrs r7, r0
	movs r0, 0x4A
	adds r1, r7, 0
	bl SetGpuReg
	ldr r1, _080B7F48 @ =0x00003f3f
	movs r0, 0x48
	bl SetGpuReg
	ldr r2, _080B7F4C @ =gUnknown_2022984
	ldrh r0, [r5, 0x24]
	lsls r0, 8
	ldrh r1, [r5, 0x26]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080B7F50 @ =gUnknown_2022986
	movs r0, 0xA0
	strh r0, [r1]
	ldr r0, _080B7F54 @ =sub_80B7F58
	str r0, [r5]
	add sp, 0x1C
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7F30: .4byte gBattle_BG2_Y
_080B7F34: .4byte 0x00003f44
_080B7F38: .4byte 0x0400001a
_080B7F3C: .4byte gBattle_BG1_X
_080B7F40: .4byte 0xa2600001
_080B7F44: .4byte gScanlineEffectRegBuffers
_080B7F48: .4byte 0x00003f3f
_080B7F4C: .4byte gUnknown_2022984
_080B7F50: .4byte gUnknown_2022986
_080B7F54: .4byte sub_80B7F58
	thumb_func_end sub_80B7DA4

	thumb_func_start sub_80B7F58
sub_80B7F58: @ 80B7F58
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080B7F7C @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080B7F72
	b _080B806A
_080B7F72:
	lsls r0, 2
	ldr r1, _080B7F80 @ =_080B7F84
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B7F7C: .4byte gTasks
_080B7F80: .4byte _080B7F84
	.align 2, 0
_080B7F84:
	.4byte _080B7F98
	.4byte _080B7FFA
	.4byte _080B8014
	.4byte _080B8050
	.4byte _080B8064
_080B7F98:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B806A
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B7FC8
	ldrh r1, [r4, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r4, r2]
	cmp r0, 0xC
	beq _080B7FD6
	adds r0, r1, 0x1
	strh r0, [r4, 0x1E]
	b _080B7FD6
_080B7FC8:
	ldrh r1, [r4, 0x20]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x8
	beq _080B7FD6
	subs r0, r1, 0x1
	strh r0, [r4, 0x20]
_080B7FD6:
	ldrh r1, [r4, 0x20]
	lsls r1, 8
	ldrh r0, [r4, 0x1E]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0xC
	bne _080B806A
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x8
	bne _080B806A
	b _080B8056
_080B7FFA:
	ldrh r0, [r4, 0x10]
	subs r0, 0x8
	strh r0, [r4, 0x10]
	adds r0, r4, 0
	bl sub_80B843C
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bge _080B806A
	b _080B8056
_080B8014:
	ldrh r0, [r4, 0x10]
	subs r0, 0x8
	strh r0, [r4, 0x10]
	adds r0, r4, 0
	bl sub_80B843C
	ldrh r1, [r4, 0x24]
	adds r1, 0x4
	strh r1, [r4, 0x24]
	ldrh r0, [r4, 0x26]
	subs r2, r0, 0x4
	strh r2, [r4, 0x26]
	lsls r1, 16
	lsls r0, r2, 16
	cmp r1, r0
	blt _080B8036
	strh r2, [r4, 0x24]
_080B8036:
	ldr r3, _080B804C @ =gUnknown_2022984
	ldrh r2, [r4, 0x24]
	lsls r0, r2, 8
	ldrh r1, [r4, 0x26]
	orrs r0, r1
	strh r0, [r3]
	lsls r2, 16
	lsls r1, 16
	cmp r2, r1
	bne _080B806A
	b _080B8056
	.align 2, 0
_080B804C: .4byte gUnknown_2022984
_080B8050:
	ldr r1, _080B8060 @ =gScanlineEffect
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080B8056:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B806A
	.align 2, 0
_080B8060: .4byte gScanlineEffect
_080B8064:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080B806A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B7F58

	thumb_func_start sub_80B8070
sub_80B8070: @ 80B8070
	push {r4-r7,lr}
	sub sp, 0x1C
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080B8098 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x4
	bls _080B808C
	b _080B829E
_080B808C:
	lsls r0, 2
	ldr r1, _080B809C @ =_080B80A0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B8098: .4byte gTasks
_080B809C: .4byte _080B80A0
	.align 2, 0
_080B80A0:
	.4byte _080B80B4
	.4byte _080B8138
	.4byte _080B817C
	.4byte _080B81E8
	.4byte _080B8250
_080B80B4:
	bl IsContest
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B80F0
	ldr r0, _080B80E4 @ =gUnknown_2022984
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080B80E8 @ =gUnknown_2022986
	strh r1, [r0]
	ldr r4, _080B80EC @ =0x00003f3f
	movs r0, 0x48
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x4A
	adds r1, r4, 0
	bl SetGpuReg
	adds r0, r6, 0
	bl DestroyAnimVisualTask
	b _080B829E
	.align 2, 0
_080B80E4: .4byte gUnknown_2022984
_080B80E8: .4byte gUnknown_2022986
_080B80EC: .4byte 0x00003f3f
_080B80F0:
	ldr r0, _080B8110 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xE]
	cmp r0, 0x1
	bne _080B811C
	ldr r1, _080B8114 @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	ldr r1, _080B8118 @ =gBattle_BG2_X
	b _080B8126
	.align 2, 0
_080B8110: .4byte gBattleAnimTarget
_080B8114: .4byte 0x00003f42
_080B8118: .4byte gBattle_BG2_X
_080B811C:
	ldr r1, _080B8130 @ =0x00003f44
	movs r0, 0x50
	bl SetGpuReg
	ldr r1, _080B8134 @ =gBattle_BG1_X
_080B8126:
	ldrh r0, [r1]
	adds r0, 0xF0
	strh r0, [r1]
	b _080B823C
	.align 2, 0
_080B8130: .4byte 0x00003f44
_080B8134: .4byte gBattle_BG1_X
_080B8138:
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080B8160
	mov r0, sp
	bl sub_80752A0
	ldr r0, _080B815C @ =gBattle_BG1_Y
	ldrh r0, [r0]
	strh r0, [r5, 0x1C]
	mov r0, sp
	ldrb r1, [r0, 0x8]
	lsls r1, 4
	movs r0, 0
	movs r2, 0x20
	bl FillPalette
	b _080B8170
	.align 2, 0
_080B815C: .4byte gBattle_BG1_Y
_080B8160:
	ldr r0, _080B8178 @ =gBattle_BG2_Y
	ldrh r0, [r0]
	strh r0, [r5, 0x1C]
	movs r0, 0
	movs r1, 0x90
	movs r2, 0x20
	bl FillPalette
_080B8170:
	movs r0, 0x3
	bl sub_80B856C
	b _080B823C
	.align 2, 0
_080B8178: .4byte gBattle_BG2_Y
_080B817C:
	ldr r4, _080B81C8 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1F
	movs r6, 0
	strh r0, [r5, 0x16]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8076B2C
	subs r0, 0x7
	strh r0, [r5, 0x14]
	ldrh r1, [r5, 0x16]
	subs r1, r0
	lsls r1, 8
	strh r1, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	subs r1, r0, 0x4
	strh r1, [r5, 0x24]
	adds r0, 0x4
	strh r0, [r5, 0x26]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B81D0
	ldr r0, _080B81CC @ =0x0000fff4
	b _080B81D2
	.align 2, 0
_080B81C8: .4byte gBattleAnimTarget
_080B81CC: .4byte 0x0000fff4
_080B81D0:
	ldr r0, _080B81E4 @ =0x0000ffc0
_080B81D2:
	strh r0, [r5, 0x18]
	ldrh r0, [r5, 0x18]
	strh r0, [r5, 0x10]
	strh r0, [r5, 0x12]
	movs r0, 0xC
	strh r0, [r5, 0x1E]
	movs r0, 0x8
	strh r0, [r5, 0x20]
	b _080B823C
	.align 2, 0
_080B81E4: .4byte 0x0000ffc0
_080B81E8:
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080B81F8
	ldr r0, _080B81F4 @ =0x04000016
	b _080B81FA
	.align 2, 0
_080B81F4: .4byte 0x04000016
_080B81F8:
	ldr r0, _080B8244 @ =0x0400001a
_080B81FA:
	str r0, [sp, 0x10]
	movs r3, 0
	add r4, sp, 0x10
	ldr r6, _080B8248 @ =gScanlineEffectRegBuffers
	movs r0, 0xF0
	lsls r0, 3
	adds r7, r6, r0
_080B8208:
	lsls r1, r3, 1
	adds r2, r1, r6
	ldrh r0, [r5, 0x1C]
	adds r0, 0x9F
	subs r0, r3
	strh r0, [r2]
	adds r1, r7
	ldrh r0, [r5, 0x1C]
	adds r0, 0x9F
	subs r0, r3
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x6F
	bls _080B8208
	ldr r1, _080B824C @ =0xa2600001
	str r1, [r4, 0x4]
	movs r2, 0
	movs r0, 0x1
	strb r0, [r4, 0x8]
	strb r2, [r4, 0x9]
	ldr r0, [sp, 0x10]
	ldr r2, [r4, 0x8]
	bl ScanlineEffect_SetParams
_080B823C:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080B829E
	.align 2, 0
_080B8244: .4byte 0x0400001a
_080B8248: .4byte gScanlineEffectRegBuffers
_080B824C: .4byte 0xa2600001
_080B8250:
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080B8268
	ldr r1, _080B8264 @ =0x00003f3d
	movs r0, 0x4A
	bl SetGpuReg
	b _080B8270
	.align 2, 0
_080B8264: .4byte 0x00003f3d
_080B8268:
	ldr r1, _080B82A8 @ =0x00003f3b
	movs r0, 0x4A
	bl SetGpuReg
_080B8270:
	ldr r1, _080B82AC @ =0x00003f3f
	movs r0, 0x48
	bl SetGpuReg
	ldr r2, _080B82B0 @ =gUnknown_2022984
	ldrh r0, [r5, 0x24]
	lsls r0, 8
	ldrh r1, [r5, 0x26]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080B82B4 @ =gUnknown_2022986
	movs r0, 0xA0
	strh r0, [r1]
	movs r0, 0
	strh r0, [r5, 0x8]
	strh r0, [r5, 0xA]
	strh r0, [r5, 0xC]
	ldr r1, _080B82B8 @ =0x0000080c
	movs r0, 0x52
	bl SetGpuReg
	ldr r0, _080B82BC @ =sub_80B82C0
	str r0, [r5]
_080B829E:
	add sp, 0x1C
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B82A8: .4byte 0x00003f3b
_080B82AC: .4byte 0x00003f3f
_080B82B0: .4byte gUnknown_2022984
_080B82B4: .4byte gUnknown_2022986
_080B82B8: .4byte 0x0000080c
_080B82BC: .4byte sub_80B82C0
	thumb_func_end sub_80B8070

	thumb_func_start sub_80B82C0
sub_80B82C0: @ 80B82C0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080B82E4 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080B82DA
	b _080B842A
_080B82DA:
	lsls r0, 2
	ldr r1, _080B82E8 @ =_080B82EC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B82E4: .4byte gTasks
_080B82E8: .4byte _080B82EC
	.align 2, 0
_080B82EC:
	.4byte _080B8300
	.4byte _080B832C
	.4byte _080B8394
	.4byte _080B83F6
	.4byte _080B8408
_080B8300:
	ldrh r0, [r4, 0x12]
	adds r0, 0x8
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r4, 0x16]
	movs r3, 0x16
	ldrsh r1, [r4, r3]
	cmp r0, r1
	blt _080B8316
	strh r2, [r4, 0x12]
_080B8316:
	adds r0, r4, 0
	bl sub_80B843C
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r1, r0
	beq _080B832A
	b _080B842A
_080B832A:
	b _080B83FC
_080B832C:
	movs r3, 0x26
	ldrsh r0, [r4, r3]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	subs r0, r1
	cmp r0, 0x3F
	bgt _080B8348
	ldrh r0, [r4, 0x24]
	subs r0, 0x4
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x26]
	adds r0, 0x4
	strh r0, [r4, 0x26]
	b _080B834C
_080B8348:
	movs r0, 0x1
	strh r0, [r4, 0xA]
_080B834C:
	ldr r2, _080B8390 @ =gUnknown_2022984
	ldrh r0, [r4, 0x24]
	lsls r0, 8
	ldrh r1, [r4, 0x26]
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r4, 0x10]
	adds r0, 0x8
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r4, 0x14]
	movs r3, 0x14
	ldrsh r1, [r4, r3]
	cmp r0, r1
	blt _080B836E
	strh r2, [r4, 0x10]
_080B836E:
	adds r0, r4, 0
	bl sub_80B843C
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080B842A
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080B842A
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080B83FC
	.align 2, 0
_080B8390: .4byte gUnknown_2022984
_080B8394:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B842A
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B83C4
	ldrh r1, [r4, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080B83D2
	subs r0, r1, 0x1
	strh r0, [r4, 0x1E]
	b _080B83D2
_080B83C4:
	ldrh r1, [r4, 0x20]
	movs r3, 0x20
	ldrsh r0, [r4, r3]
	cmp r0, 0xF
	bgt _080B83D2
	adds r0, r1, 0x1
	strh r0, [r4, 0x20]
_080B83D2:
	ldrh r1, [r4, 0x20]
	lsls r1, 8
	ldrh r0, [r4, 0x1E]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B842A
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x10
	bne _080B842A
	b _080B83FC
_080B83F6:
	ldr r1, _080B8404 @ =gScanlineEffect
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080B83FC:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B842A
	.align 2, 0
_080B8404: .4byte gScanlineEffect
_080B8408:
	ldr r0, _080B8430 @ =gUnknown_2022984
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080B8434 @ =gUnknown_2022986
	strh r1, [r0]
	ldr r4, _080B8438 @ =0x00003f3f
	movs r0, 0x48
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x4A
	adds r1, r4, 0
	bl SetGpuReg
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080B842A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8430: .4byte gUnknown_2022984
_080B8434: .4byte gUnknown_2022986
_080B8438: .4byte 0x00003f3f
	thumb_func_end sub_80B82C0

	thumb_func_start sub_80B843C
sub_80B843C: @ 80B843C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldrh r0, [r6, 0x12]
	ldrh r4, [r6, 0x10]
	subs r0, r4
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	beq _080B8530
	movs r2, 0x22
	ldrsh r0, [r6, r2]
	bl __divsi3
	mov r8, r0
	movs r3, 0x14
	ldrsh r0, [r6, r3]
	lsls r5, r0, 8
	lsls r0, r4, 16
	movs r4, 0
	cmp r0, 0
	ble _080B849C
	ldr r0, _080B8528 @ =gScanlineEffectRegBuffers
	mov r12, r0
	ldr r7, _080B852C @ =gScanlineEffect
_080B8470:
	lsls r2, r4, 16
	asrs r2, 16
	lsls r3, r2, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r3, r0
	add r3, r12
	adds r1, r2, 0
	subs r1, 0x9F
	ldrh r0, [r6, 0x1C]
	subs r0, r1
	strh r0, [r3]
	adds r2, 0x1
	lsls r2, 16
	lsrs r4, r2, 16
	asrs r2, 16
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	cmp r2, r0
	blt _080B8470
_080B849C:
	ldrh r4, [r6, 0x10]
	lsls r3, r4, 16
	asrs r1, r3, 16
	movs r2, 0x12
	ldrsh r0, [r6, r2]
	cmp r1, r0
	bgt _080B84E6
	ldr r0, _080B8528 @ =gScanlineEffectRegBuffers
	mov r12, r0
	ldr r7, _080B852C @ =gScanlineEffect
_080B84B0:
	asrs r4, r3, 16
	cmp r4, 0
	blt _080B84D2
	asrs r1, r5, 8
	subs r1, r4
	lsls r3, r4, 1
	ldrb r2, [r7, 0x14]
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 7
	adds r3, r0
	add r3, r12
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r6, 0x1C]
	adds r1, r2
	strh r1, [r3]
_080B84D2:
	add r5, r8
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r3, r4, 16
	asrs r1, r3, 16
	movs r2, 0x12
	ldrsh r0, [r6, r2]
	cmp r1, r0
	ble _080B84B0
_080B84E6:
	movs r3, 0x1C
	ldrsh r0, [r6, r3]
	adds r0, 0x9F
	lsls r2, r4, 16
	asrs r1, r2, 16
	subs r5, r0, r1
	movs r3, 0x16
	ldrsh r0, [r6, r3]
	cmp r1, r0
	bge _080B855E
	ldr r7, _080B8528 @ =gScanlineEffectRegBuffers
	ldr r4, _080B852C @ =gScanlineEffect
_080B84FE:
	asrs r3, r2, 16
	cmp r3, 0
	blt _080B8516
	lsls r2, r3, 1
	ldrb r1, [r4, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	strh r5, [r2]
	subs r5, 0x1
_080B8516:
	adds r0, r3, 0x1
	lsls r2, r0, 16
	asrs r1, r2, 16
	movs r3, 0x16
	ldrsh r0, [r6, r3]
	cmp r1, r0
	blt _080B84FE
	b _080B855E
	.align 2, 0
_080B8528: .4byte gScanlineEffectRegBuffers
_080B852C: .4byte gScanlineEffect
_080B8530:
	movs r1, 0x1C
	ldrsh r0, [r6, r1]
	adds r5, r0, 0
	adds r5, 0x9F
	movs r4, 0
	ldr r3, _080B8568 @ =gScanlineEffectRegBuffers
	movs r2, 0xF0
	lsls r2, 3
	adds r6, r3, r2
_080B8542:
	lsls r0, r4, 16
	asrs r0, 16
	lsls r2, r0, 1
	adds r1, r2, r3
	strh r5, [r1]
	adds r2, r6
	strh r5, [r2]
	subs r5, 0x1
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x6F
	ble _080B8542
_080B855E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8568: .4byte gScanlineEffectRegBuffers
	thumb_func_end sub_80B843C

	thumb_func_start sub_80B856C
sub_80B856C: @ 80B856C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0
	ldr r7, _080B85B4 @ =gSprites
	movs r1, 0x3
	ands r0, r1
	lsls r5, r0, 2
	movs r0, 0xD
	negs r0, r0
	adds r6, r0, 0
_080B8582:
	lsls r0, r4, 24
	lsrs r0, 24
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080B85A2
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	ldrb r0, [r1, 0x5]
	ands r0, r6
	orrs r0, r5
	strb r0, [r1, 0x5]
_080B85A2:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _080B8582
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B85B4: .4byte gSprites
	thumb_func_end sub_80B856C

	thumb_func_start sub_80B85B8
sub_80B85B8: @ 80B85B8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r6, _080B8658 @ =gBattleAnimAttacker
	ldrb r0, [r6]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	eors r0, r1
	negs r1, r0
	orrs r1, r0
	lsrs r4, r1, 31
	ldrb r0, [r6]
	adds r1, r4, 0
	bl sub_8072E48
	ldr r0, _080B865C @ =gSprites
	mov r9, r0
	ldr r0, _080B8660 @ =gBattlerSpriteIds
	mov r8, r0
	ldrb r0, [r6]
	add r0, r8
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r9
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r7, 0x5
	negs r7, r7
	adds r0, r7, 0
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r6]
	movs r5, 0x2
	eors r0, r5
	bl IsBattlerSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080B8642
	ldrb r0, [r6]
	eors r0, r5
	movs r1, 0x1
	eors r4, r1
	adds r1, r4, 0
	bl sub_8072E48
	ldrb r0, [r6]
	eors r0, r5
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	adds r0, 0x3E
	ldrb r2, [r0]
	adds r1, r7, 0
	ands r1, r2
	strb r1, [r0]
_080B8642:
	mov r0, r10
	bl DestroyAnimVisualTask
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8658: .4byte gBattleAnimAttacker
_080B865C: .4byte gSprites
_080B8660: .4byte gBattlerSpriteIds
	thumb_func_end sub_80B85B8

	thumb_func_start sub_80B8664
sub_80B8664: @ 80B8664
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r4, _080B86AC @ =gBattleAnimAttacker
	ldrb r0, [r4]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	eors r0, r1
	negs r1, r0
	orrs r1, r0
	lsrs r5, r1, 31
	adds r0, r5, 0
	bl sub_8073128
	ldrb r1, [r4]
	movs r0, 0x2
	eors r0, r1
	bl IsBattlerSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080B86A0
	movs r0, 0x1
	eors r5, r0
	adds r0, r5, 0
	bl sub_8073128
_080B86A0:
	adds r0, r6, 0
	bl DestroyAnimVisualTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B86AC: .4byte gBattleAnimAttacker
	thumb_func_end sub_80B8664

	thumb_func_start sub_80B86B0
sub_80B86B0: @ 80B86B0
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080B86E0 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrb r1, [r1, 0x4]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _080B86E4 @ =sub_8074F6C
	str r0, [r4, 0x1C]
	ldr r1, _080B86E8 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B86E0: .4byte gBattleAnimArgs
_080B86E4: .4byte sub_8074F6C
_080B86E8: .4byte DestroyAnimSprite
	thumb_func_end sub_80B86B0

	thumb_func_start sub_80B86EC
sub_80B86EC: @ 80B86EC
	push {r4-r7,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	ldr r0, _080B87EC @ =gUnknown_2022984
	strh r6, [r0]
	ldr r0, _080B87F0 @ =gUnknown_2022986
	strh r6, [r0]
	ldr r1, _080B87F4 @ =0x00003f3f
	movs r0, 0x48
	bl SetGpuReg
	ldr r1, _080B87F8 @ =0x00003f3d
	movs r0, 0x4A
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 8
	movs r0, 0
	bl SetGpuRegBits
	ldr r1, _080B87FC @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	ldr r1, _080B8800 @ =0x00000c08
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0
	bl SetAnimBgAttribute
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl SetAnimBgAttribute
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080B8750
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0x1
	bl SetAnimBgAttribute
_080B8750:
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _080B87CA
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080B87CA
	ldr r4, _080B8804 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080B8780
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, 24
	cmp r0, 0
	bne _080B87CA
_080B8780:
	ldrb r0, [r4]
	movs r5, 0x2
	eors r0, r5
	bl IsBattlerSpriteVisible
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B87CA
	ldr r3, _080B8808 @ =gSprites
	ldr r1, _080B880C @ =gBattlerSpriteIds
	ldrb r0, [r4]
	eors r0, r5
	adds r0, r1
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrb r3, [r2, 0x5]
	lsls r1, r3, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x1
	bl SetAnimBgAttribute
	movs r6, 0x1
_080B87CA:
	ldr r4, _080B8804 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B8818
	ldr r1, _080B8810 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080B8814 @ =gEnemyParty
	b _080B8828
	.align 2, 0
_080B87EC: .4byte gUnknown_2022984
_080B87F0: .4byte gUnknown_2022986
_080B87F4: .4byte 0x00003f3f
_080B87F8: .4byte 0x00003f3d
_080B87FC: .4byte 0x00003f42
_080B8800: .4byte 0x00000c08
_080B8804: .4byte gBattleAnimAttacker
_080B8808: .4byte gSprites
_080B880C: .4byte gBattlerSpriteIds
_080B8810: .4byte gBattlerPartyIndexes
_080B8814: .4byte gEnemyParty
_080B8818:
	ldr r1, _080B88B8 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080B88BC @ =gPlayerParty
_080B8828:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	movs r0, 0
	bl GetAnimBankSpriteId
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080B88C0 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8076E34
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, sp
	bl sub_80752A0
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080B88C4 @ =gFile_graphics_battle_anims_masks_metal_shine_tilemap
	bl sub_807543C
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080B88C8 @ =gFile_graphics_battle_anims_masks_metal_shine_sheet
	mov r2, sp
	ldrh r2, [r2, 0xA]
	bl sub_80753B4
	ldr r0, _080B88CC @ =gFile_graphics_battle_anims_masks_metal_shine_palette
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r2, _080B88D0 @ =gBattle_BG1_X
	ldr r0, _080B88D4 @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x20]
	negs r0, r0
	adds r0, 0x60
	strh r0, [r2]
	ldr r2, _080B88D8 @ =gBattle_BG1_Y
	ldrh r0, [r1, 0x22]
	negs r0, r0
	adds r0, 0x20
	strh r0, [r2]
	ldrb r0, [r1, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	adds r1, r0, 0
	ldr r2, _080B88DC @ =gBattleAnimArgs
	movs r3, 0x2
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _080B88E0
	adds r0, r1, 0
	movs r1, 0
	bl sub_8075B48
	b _080B88EC
	.align 2, 0
_080B88B8: .4byte gBattlerPartyIndexes
_080B88BC: .4byte gPlayerParty
_080B88C0: .4byte gBattleAnimAttacker
_080B88C4: .4byte gFile_graphics_battle_anims_masks_metal_shine_tilemap
_080B88C8: .4byte gFile_graphics_battle_anims_masks_metal_shine_sheet
_080B88CC: .4byte gFile_graphics_battle_anims_masks_metal_shine_palette
_080B88D0: .4byte gBattle_BG1_X
_080B88D4: .4byte gSprites
_080B88D8: .4byte gBattle_BG1_Y
_080B88DC: .4byte gBattleAnimArgs
_080B88E0:
	lsls r0, r1, 4
	ldrh r3, [r2, 0x4]
	movs r1, 0x10
	movs r2, 0xB
	bl BlendPalette
_080B88EC:
	ldr r1, _080B8914 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x8]
	ldr r2, _080B8918 @ =gBattleAnimArgs
	ldrh r1, [r2]
	strh r1, [r0, 0xA]
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0xC]
	ldrh r1, [r2, 0x4]
	strh r1, [r0, 0xE]
	strh r6, [r0, 0x14]
	ldr r1, _080B891C @ =sub_80B8920
	str r1, [r0]
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8914: .4byte gTasks
_080B8918: .4byte gBattleAnimArgs
_080B891C: .4byte sub_80B8920
	thumb_func_end sub_80B86EC

	thumb_func_start sub_80B8920
sub_80B8920: @ 80B8920
	push {r4-r6,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r1, _080B89E8 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x1C]
	adds r0, 0x4
	movs r5, 0
	strh r0, [r4, 0x1C]
	ldr r2, _080B89EC @ =gBattle_BG1_X
	ldrh r3, [r2]
	subs r1, r3, 0x4
	strh r1, [r2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x80
	beq _080B894E
	b _080B8A5E
_080B894E:
	strh r5, [r4, 0x1C]
	adds r0, r3, 0
	adds r0, 0x7C
	strh r0, [r2]
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080B89FC
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080B89F0 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r0, [r1, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	adds r1, r0, 0
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080B8990
	adds r0, r1, 0
	movs r1, 0x1
	bl sub_8075B48
_080B8990:
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	mov r0, sp
	bl sub_80752A0
	mov r0, sp
	ldrb r0, [r0, 0x9]
	bl sub_8075358
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080B8A5E
	ldr r2, _080B89F4 @ =gBattlerSpriteIds
	ldr r0, _080B89F8 @ =gBattleAnimAttacker
	ldrb r1, [r0]
	movs r0, 0x2
	eors r0, r1
	adds r0, r2
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	ldrb r3, [r2, 0x5]
	lsls r1, r3, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	b _080B8A5E
	.align 2, 0
_080B89E8: .4byte gTasks
_080B89EC: .4byte gBattle_BG1_X
_080B89F0: .4byte gSprites
_080B89F4: .4byte gBattlerSpriteIds
_080B89F8: .4byte gBattleAnimAttacker
_080B89FC:
	cmp r0, 0x3
	bne _080B8A5E
	ldr r0, _080B8A68 @ =gUnknown_2022984
	strh r5, [r0]
	ldr r0, _080B8A6C @ =gUnknown_2022986
	strh r5, [r0]
	ldr r4, _080B8A70 @ =0x00003f3f
	movs r0, 0x48
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x4A
	adds r1, r4, 0
	bl SetGpuReg
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080B8A2E
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0
	bl SetAnimBgAttribute
_080B8A2E:
	movs r0, 0
	bl GetGpuReg
	adds r1, r0, 0
	movs r2, 0x80
	lsls r2, 8
	adds r0, r2, 0
	eors r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080B8A5E:
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8A68: .4byte gUnknown_2022984
_080B8A6C: .4byte gUnknown_2022986
_080B8A70: .4byte 0x00003f3f
	thumb_func_end sub_80B8920

	thumb_func_start sub_80B8A74
sub_80B8A74: @ 80B8A74
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _080B8A94 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r2, r0, 0
	cmp r1, 0x7
	bhi _080B8AD8
	lsls r0, r1, 2
	ldr r1, _080B8A98 @ =_080B8A9C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B8A94: .4byte gBattleAnimArgs
_080B8A98: .4byte _080B8A9C
	.align 2, 0
_080B8A9C:
	.4byte _080B8ABC
	.4byte _080B8ABC
	.4byte _080B8ABC
	.4byte _080B8ABC
	.4byte _080B8AC8
	.4byte _080B8ACC
	.4byte _080B8AD0
	.4byte _080B8AD4
_080B8ABC:
	ldrb r0, [r2]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r2, r0, 24
	b _080B8ADA
_080B8AC8:
	movs r4, 0
	b _080B8AE0
_080B8ACC:
	movs r4, 0x2
	b _080B8AE0
_080B8AD0:
	movs r4, 0x1
	b _080B8AE0
_080B8AD4:
	movs r4, 0x3
	b _080B8AE0
_080B8AD8:
	movs r2, 0xFF
_080B8ADA:
	movs r0, 0
	cmp r0, 0
	beq _080B8B06
_080B8AE0:
	adds r0, r4, 0
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl IsBattlerSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080B8B04
	ldr r0, _080B8B00 @ =gBattlerSpriteIds
	adds r0, r4, r0
	ldrb r2, [r0]
	b _080B8B06
	.align 2, 0
_080B8B00: .4byte gBattlerSpriteIds
_080B8B04:
	movs r2, 0xFF
_080B8B06:
	cmp r2, 0xFF
	beq _080B8B22
	ldr r1, _080B8B30 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	ldr r1, _080B8B34 @ =gBattleAnimArgs
	ldrb r1, [r1, 0x2]
	bl sub_8075B48
_080B8B22:
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8B30: .4byte gSprites
_080B8B34: .4byte gBattleAnimArgs
	thumb_func_end sub_80B8A74

	thumb_func_start sub_80B8B38
sub_80B8B38: @ 80B8B38
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080B8B64 @ =gAnimMoveTurn
	ldrb r0, [r2]
	cmp r0, 0x1
	bhi _080B8B4C
	ldr r1, _080B8B68 @ =gBattleAnimArgs
	movs r0, 0
	strh r0, [r1, 0xE]
_080B8B4C:
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _080B8B58
	ldr r1, _080B8B68 @ =gBattleAnimArgs
	movs r0, 0x1
	strh r0, [r1, 0xE]
_080B8B58:
	adds r0, r3, 0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080B8B64: .4byte gAnimMoveTurn
_080B8B68: .4byte gBattleAnimArgs
	thumb_func_end sub_80B8B38

	.align 2, 0 @ Don't pad with nop.
