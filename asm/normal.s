	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80B9904
sub_80B9904: @ 80B9904
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080B993C @ =gBattleAnimArgs
	ldrh r0, [r5]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	ldr r0, _080B9940 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _080B9944
	ldrh r0, [r5, 0x6]
	negs r0, r0
	strh r0, [r4, 0x30]
	movs r0, 0x1
	strh r0, [r4, 0x36]
	b _080B9952
	.align 2, 0
_080B993C: .4byte gBattleAnimArgs
_080B9940: .4byte gBattleAnimAttacker
_080B9944:
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x30]
	strh r1, [r4, 0x36]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080B9952:
	ldr r0, _080B9968 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x8]
	strh r0, [r4, 0x34]
	ldr r1, _080B996C @ =sub_80B9970
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B9968: .4byte gBattleAnimArgs
_080B996C: .4byte sub_80B9970
	thumb_func_end sub_80B9904

	thumb_func_start sub_80B9970
sub_80B9970: @ 80B9970
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x1E
	bl Cos
	strh r0, [r4, 0x24]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r1, 0xA
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	cmp r0, 0x7F
	bhi _080B99A2
	ldrb r0, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4, 0x5]
	b _080B99AA
_080B99A2:
	ldrb r0, [r4, 0x5]
	movs r1, 0xC
	orrs r0, r1
	strb r0, [r4, 0x5]
_080B99AA:
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x2E]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080B99CE
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B99CE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B9970

	thumb_func_start sub_80B99D4
sub_80B99D4: @ 80B99D4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r4, _080B9A0C @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r4, r1]
	bl UnpackSelectedBattleAnimPalettes
	movs r1, 0x2
	ldrsb r1, [r4, r1]
	ldrb r2, [r4, 0x4]
	ldrb r3, [r4, 0x6]
	ldrh r4, [r4, 0x8]
	str r4, [sp]
	bl BeginNormalPaletteFade
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080B9A10 @ =sub_80B9A5C
	str r0, [r5, 0x1C]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B9A0C: .4byte gBattleAnimArgs
_080B9A10: .4byte sub_80B9A5C
	thumb_func_end sub_80B99D4

	thumb_func_start UnpackSelectedBattleAnimPalettes
UnpackSelectedBattleAnimPalettes: @ 80B9A14
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	lsls r0, 16
	lsrs r0, 16
	movs r4, 0x1
	mov r8, r0
	mov r1, r8
	ands r1, r4
	mov r8, r1
	lsls r0, 16
	asrs r1, r0, 17
	ands r1, r4
	asrs r2, r0, 18
	ands r2, r4
	asrs r3, r0, 19
	ands r3, r4
	asrs r6, r0, 20
	ands r6, r4
	asrs r5, r0, 21
	ands r5, r4
	asrs r0, 22
	ands r0, r4
	str r6, [sp]
	str r5, [sp, 0x4]
	str r0, [sp, 0x8]
	mov r0, r8
	bl sub_8075BE8
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end UnpackSelectedBattleAnimPalettes

	thumb_func_start sub_80B9A5C
sub_80B9A5C: @ 80B9A5C
	push {lr}
	adds r2, r0, 0
	ldr r0, _080B9A78 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B9A72
	adds r0, r2, 0
	bl DestroyAnimSprite
_080B9A72:
	pop {r0}
	bx r0
	.align 2, 0
_080B9A78: .4byte gPaletteFade
	thumb_func_end sub_80B9A5C

	thumb_func_start sub_80B9A7C
sub_80B9A7C: @ 80B9A7C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080B9AC8 @ =gBattleAnimArgs
	ldrh r0, [r4, 0x2]
	strh r0, [r5, 0x2E]
	strh r0, [r5, 0x30]
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x32]
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x34]
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x36]
	ldrh r0, [r4, 0xA]
	strh r0, [r5, 0x38]
	ldrh r0, [r4, 0xC]
	strh r0, [r5, 0x3A]
	ldrh r0, [r4]
	strh r0, [r5, 0x3C]
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	bl UnpackSelectedBattleAnimPalettes
	ldrb r1, [r4, 0x8]
	ldrh r2, [r4, 0x6]
	bl BlendPalettes
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080B9ACC @ =sub_80B9AD0
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B9AC8: .4byte gBattleAnimArgs
_080B9ACC: .4byte sub_80B9AD0
	thumb_func_end sub_80B9A7C

	thumb_func_start sub_80B9AD0
sub_80B9AD0: @ 80B9AD0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080B9AE4
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	b _080B9B54
_080B9AE4:
	ldr r0, _080B9B00 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B9B54
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B9B08
	ldr r0, _080B9B04 @ =sub_80B9B5C
	str r0, [r4, 0x1C]
	b _080B9B54
	.align 2, 0
_080B9B00: .4byte gPaletteFade
_080B9B04: .4byte sub_80B9B5C
_080B9B08:
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	bl UnpackSelectedBattleAnimPalettes
	adds r3, r0, 0
	ldrh r1, [r4, 0x30]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080B9B2E
	ldrh r1, [r4, 0x36]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x34]
	adds r0, r3, 0
	bl BlendPalettes
	b _080B9B3C
_080B9B2E:
	ldrh r1, [r4, 0x3A]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x38]
	adds r0, r3, 0
	bl BlendPalettes
_080B9B3C:
	ldrh r0, [r4, 0x30]
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	eors r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x32]
	subs r0, 0x1
	strh r0, [r4, 0x32]
_080B9B54:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B9AD0

	thumb_func_start sub_80B9B5C
sub_80B9B5C: @ 80B9B5C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080B9B88 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B9B82
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	bl UnpackSelectedBattleAnimPalettes
	movs r1, 0
	movs r2, 0
	bl BlendPalettes
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B9B82:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9B88: .4byte gPaletteFade
	thumb_func_end sub_80B9B5C

	thumb_func_start sub_80B9B8C
sub_80B9B8C: @ 80B9B8C
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080B9BD0 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	movs r2, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r2, [r4, 0x2E]
	movs r0, 0xA
	strh r0, [r4, 0x30]
	movs r0, 0x8
	strh r0, [r4, 0x32]
	movs r0, 0x28
	strh r0, [r4, 0x34]
	movs r0, 0x70
	strh r0, [r4, 0x36]
	strh r2, [r4, 0x38]
	ldr r1, _080B9BD4 @ =DestroySpriteAndMatrix
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r1, _080B9BD8 @ =TranslateSpriteInGrowingCircleOverDuration
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9BD0: .4byte gBattleAnimArgs
_080B9BD4: .4byte DestroySpriteAndMatrix
_080B9BD8: .4byte TranslateSpriteInGrowingCircleOverDuration
	thumb_func_end sub_80B9B8C

	thumb_func_start sub_80B9BDC
sub_80B9BDC: @ 80B9BDC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B9C20 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldr r3, _080B9C24 @ =gBattleAnimArgs
	ldrh r1, [r3]
	movs r5, 0
	strh r1, [r4, 0x8]
	ldrh r1, [r3, 0x2]
	strh r1, [r4, 0xA]
	ldrh r1, [r3, 0x4]
	strh r1, [r4, 0xC]
	ldrh r1, [r3, 0x6]
	strh r1, [r4, 0xE]
	ldrh r2, [r3, 0x8]
	strh r2, [r4, 0x10]
	ldrh r1, [r3, 0xA]
	strh r1, [r4, 0x12]
	strh r5, [r4, 0x18]
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0
	bl sub_80B9C2C
	ldr r0, _080B9C28 @ =sub_80B9C7C
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B9C20: .4byte gTasks
_080B9C24: .4byte gBattleAnimArgs
_080B9C28: .4byte sub_80B9C7C
	thumb_func_end sub_80B9BDC

	thumb_func_start sub_80B9C2C
sub_80B9C2C: @ 80B9C2C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r1, _080B9C78 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	bl UnpackSelectedBattleAnimPalettes
	movs r1, 0xA
	ldrsb r1, [r4, r1]
	ldrh r2, [r4, 0x12]
	str r2, [sp]
	adds r2, r5, 0
	adds r3, r6, 0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x18]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x18]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9C78: .4byte gTasks
	thumb_func_end sub_80B9C2C

	thumb_func_start sub_80B9C7C
sub_80B9C7C: @ 80B9C7C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	ldr r0, _080B9CB4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B9CDE
	ldr r1, _080B9CB8 @ =gTasks
	lsls r2, r3, 2
	adds r0, r2, r3
	lsls r0, 3
	adds r3, r0, r1
	movs r5, 0xC
	ldrsh r0, [r3, r5]
	adds r6, r1, 0
	adds r5, r2, 0
	cmp r0, 0
	ble _080B9CD8
	movs r1, 0x18
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080B9CBC
	ldrb r1, [r3, 0xE]
	ldrb r2, [r3, 0x10]
	b _080B9CC0
	.align 2, 0
_080B9CB4: .4byte gPaletteFade
_080B9CB8: .4byte gTasks
_080B9CBC:
	ldrb r1, [r3, 0x10]
	ldrb r2, [r3, 0xE]
_080B9CC0:
	adds r0, r5, r4
	lsls r0, 3
	adds r0, r6
	movs r3, 0xC
	ldrsh r0, [r0, r3]
	cmp r0, 0x1
	bne _080B9CD0
	movs r2, 0
_080B9CD0:
	adds r0, r4, 0
	bl sub_80B9C2C
	b _080B9CDE
_080B9CD8:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080B9CDE:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80B9C7C

	thumb_func_start sub_80B9CE4
sub_80B9CE4: @ 80B9CE4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	ldr r3, _080B9D88 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r3
	ldr r2, _080B9D8C @ =gBattleAnimArgs
	ldrh r1, [r2]
	strh r1, [r0, 0x8]
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0xA]
	ldrh r1, [r2, 0x4]
	strh r1, [r0, 0xC]
	ldrh r1, [r2, 0x6]
	strh r1, [r0, 0xE]
	ldrh r1, [r2, 0x8]
	strh r1, [r0, 0x10]
	ldrh r1, [r2, 0xA]
	strh r1, [r0, 0x12]
	strh r5, [r0, 0x18]
	movs r4, 0
	ldr r0, _080B9D90 @ =gBattlersCount
	ldrb r1, [r0]
	mov r9, r3
	mov r8, r2
	cmp r5, r1
	bge _080B9D4C
	ldr r0, _080B9D94 @ =gBattleAnimAttacker
	ldrb r3, [r0]
	ldr r7, _080B9D98 @ =gBattleAnimTarget
	movs r0, 0x1
	mov r12, r0
	adds r2, r1, 0
_080B9D32:
	cmp r4, r3
	beq _080B9D46
	ldrb r1, [r7]
	cmp r4, r1
	beq _080B9D46
	adds r1, r4, 0
	adds r1, 0x10
	mov r0, r12
	lsls r0, r1
	orrs r5, r0
_080B9D46:
	adds r4, 0x1
	cmp r4, r2
	blt _080B9D32
_080B9D4C:
	mov r2, r8
	movs r1, 0
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	bne _080B9D5A
	movs r0, 0xE
	orrs r5, r0
_080B9D5A:
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	add r4, r9
	lsrs r0, r5, 16
	strh r0, [r4, 0x1A]
	movs r0, 0xFF
	ands r5, r0
	strh r5, [r4, 0x1C]
	ldrb r2, [r4, 0x10]
	adds r0, r6, 0
	movs r1, 0
	bl sub_80B9DA0
	ldr r0, _080B9D9C @ =sub_80B9DF0
	str r0, [r4]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9D88: .4byte gTasks
_080B9D8C: .4byte gBattleAnimArgs
_080B9D90: .4byte gBattlersCount
_080B9D94: .4byte gBattleAnimAttacker
_080B9D98: .4byte gBattleAnimTarget
_080B9D9C: .4byte sub_80B9DF0
	thumb_func_end sub_80B9CE4

	thumb_func_start sub_80B9DA0
sub_80B9DA0: @ 80B9DA0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r1, 0
	adds r3, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r1, _080B9DEC @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldrh r0, [r4, 0x1A]
	lsls r0, 16
	ldrh r1, [r4, 0x1C]
	orrs r0, r1
	movs r1, 0xA
	ldrsb r1, [r4, r1]
	ldrh r2, [r4, 0x12]
	str r2, [sp]
	adds r2, r5, 0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x18]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x18]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B9DEC: .4byte gTasks
	thumb_func_end sub_80B9DA0

	thumb_func_start sub_80B9DF0
sub_80B9DF0: @ 80B9DF0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	ldr r0, _080B9E28 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B9E52
	ldr r1, _080B9E2C @ =gTasks
	lsls r2, r3, 2
	adds r0, r2, r3
	lsls r0, 3
	adds r3, r0, r1
	movs r5, 0xC
	ldrsh r0, [r3, r5]
	adds r6, r1, 0
	adds r5, r2, 0
	cmp r0, 0
	ble _080B9E4C
	movs r1, 0x18
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080B9E30
	ldrb r1, [r3, 0xE]
	ldrb r2, [r3, 0x10]
	b _080B9E34
	.align 2, 0
_080B9E28: .4byte gPaletteFade
_080B9E2C: .4byte gTasks
_080B9E30:
	ldrb r1, [r3, 0x10]
	ldrb r2, [r3, 0xE]
_080B9E34:
	adds r0, r5, r4
	lsls r0, 3
	adds r0, r6
	movs r3, 0xC
	ldrsh r0, [r0, r3]
	cmp r0, 0x1
	bne _080B9E44
	movs r2, 0
_080B9E44:
	adds r0, r4, 0
	bl sub_80B9DA0
	b _080B9E52
_080B9E4C:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080B9E52:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80B9DF0

	thumb_func_start sub_80B9E58
sub_80B9E58: @ 80B9E58
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B9E9C @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldr r3, _080B9EA0 @ =gBattleAnimArgs
	ldrh r1, [r3]
	movs r5, 0
	strh r1, [r4, 0x8]
	ldrh r1, [r3, 0x2]
	strh r1, [r4, 0xA]
	ldrh r1, [r3, 0x4]
	strh r1, [r4, 0xC]
	ldrh r1, [r3, 0x6]
	strh r1, [r4, 0xE]
	ldrh r2, [r3, 0x8]
	strh r2, [r4, 0x10]
	ldrh r1, [r3, 0xA]
	strh r1, [r4, 0x12]
	strh r5, [r4, 0x18]
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0
	bl sub_80B9EA8
	ldr r0, _080B9EA4 @ =sub_80B9F04
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B9E9C: .4byte gTasks
_080B9EA0: .4byte gBattleAnimArgs
_080B9EA4: .4byte sub_80B9F04
	thumb_func_end sub_80B9E58

	thumb_func_start sub_80B9EA8
sub_80B9EA8: @ 80B9EA8
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r1, _080B9F00 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldrh r0, [r4, 0x8]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r2, 0x1
	lsls r2, r0
	movs r1, 0xA
	ldrsb r1, [r4, r1]
	ldrh r0, [r4, 0x12]
	str r0, [sp]
	adds r0, r2, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x18]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x18]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9F00: .4byte gTasks
	thumb_func_end sub_80B9EA8

	thumb_func_start sub_80B9F04
sub_80B9F04: @ 80B9F04
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	ldr r0, _080B9F3C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B9F66
	ldr r1, _080B9F40 @ =gTasks
	lsls r2, r3, 2
	adds r0, r2, r3
	lsls r0, 3
	adds r3, r0, r1
	movs r5, 0xC
	ldrsh r0, [r3, r5]
	adds r6, r1, 0
	adds r5, r2, 0
	cmp r0, 0
	ble _080B9F60
	movs r1, 0x18
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080B9F44
	ldrb r1, [r3, 0xE]
	ldrb r2, [r3, 0x10]
	b _080B9F48
	.align 2, 0
_080B9F3C: .4byte gPaletteFade
_080B9F40: .4byte gTasks
_080B9F44:
	ldrb r1, [r3, 0x10]
	ldrb r2, [r3, 0xE]
_080B9F48:
	adds r0, r5, r4
	lsls r0, 3
	adds r0, r6
	movs r3, 0xC
	ldrsh r0, [r0, r3]
	cmp r0, 0x1
	bne _080B9F58
	movs r2, 0
_080B9F58:
	adds r0, r4, 0
	bl sub_80B9EA8
	b _080B9F66
_080B9F60:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080B9F66:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80B9F04

	thumb_func_start sub_80B9F6C
sub_80B9F6C: @ 80B9F6C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B9FCC @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldr r5, _080B9FD0 @ =gBattleAnimArgs
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x8]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0xA]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0xC]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0xE]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x10]
	ldrh r0, [r5, 0xA]
	strh r0, [r4, 0x12]
	ldrh r0, [r5, 0xC]
	strh r0, [r4, 0x14]
	ldrh r0, [r5]
	strh r0, [r4, 0x16]
	ldrh r0, [r5]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r1, 0x1
	lsls r1, r0
	ldrb r3, [r5, 0x8]
	ldrh r0, [r5, 0x6]
	str r0, [sp]
	adds r0, r1, 0
	movs r1, 0
	adds r2, r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080B9FD4 @ =sub_80B9FD8
	str r0, [r4]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B9FCC: .4byte gTasks
_080B9FD0: .4byte gBattleAnimArgs
_080B9FD4: .4byte sub_80B9FD8
	thumb_func_end sub_80B9F6C

	thumb_func_start sub_80B9FD8
sub_80B9FD8: @ 80B9FD8
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080B9FFC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0x8]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080BA000
	subs r0, r1, 0x1
	strh r0, [r4, 0x8]
	b _080BA084
	.align 2, 0
_080B9FFC: .4byte gTasks
_080BA000:
	ldr r0, _080BA01C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080BA084
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _080BA024
	ldr r0, _080BA020 @ =sub_80BA090
	str r0, [r4]
	b _080BA084
	.align 2, 0
_080BA01C: .4byte gPaletteFade
_080BA020: .4byte sub_80BA090
_080BA024:
	ldrh r0, [r4, 0x16]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r2, 0x1
	lsls r2, r0
	ldrh r1, [r4, 0xA]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080BA052
	ldrb r3, [r4, 0x10]
	ldrh r0, [r4, 0xE]
	str r0, [sp]
	adds r0, r2, 0
	movs r1, 0
	adds r2, r3, 0
	bl BeginNormalPaletteFade
	b _080BA062
_080BA052:
	ldrb r3, [r4, 0x14]
	ldrh r0, [r4, 0x12]
	str r0, [sp]
	adds r0, r2, 0
	movs r1, 0
	adds r2, r3, 0
	bl BeginNormalPaletteFade
_080BA062:
	ldr r0, _080BA08C @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xA]
	movs r3, 0x80
	lsls r3, 1
	adds r2, r3, 0
	eors r0, r2
	strh r0, [r1, 0xA]
	movs r2, 0xFF
	ands r0, r2
	strh r0, [r1, 0x8]
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
_080BA084:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA08C: .4byte gTasks
	thumb_func_end sub_80B9FD8

	thumb_func_start sub_80BA090
sub_80BA090: @ 80BA090
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080BA0E0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080BA0D6
	ldr r1, _080BA0E4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x16]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r1, 0x1
	lsls r1, r0
	str r5, [sp]
	adds r0, r1, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl BeginNormalPaletteFade
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080BA0D6:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA0E0: .4byte gPaletteFade
_080BA0E4: .4byte gTasks
	thumb_func_end sub_80BA090

	thumb_func_start sub_80BA0E8
sub_80BA0E8: @ 80BA0E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r2, 0
	ldr r0, _080BA160 @ =gBattleAnimAttacker
	ldrb r6, [r0]
	ldr r0, _080BA164 @ =gBattleAnimTarget
	ldrb r7, [r0]
	ldr r4, _080BA168 @ =gBattleAnimArgs
	ldrh r1, [r4]
	movs r5, 0x80
	lsls r5, 1
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080BA122
	str r2, [sp]
	str r2, [sp, 0x4]
	str r2, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r3, 0
	bl sub_8075BE8
	adds r2, r0, 0
_080BA122:
	ldrh r1, [r4, 0x2]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080BA134
	movs r0, 0x80
	lsls r0, 9
	lsls r0, r6
	orrs r2, r0
_080BA134:
	ldrh r1, [r4, 0x4]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080BA146
	movs r0, 0x80
	lsls r0, 9
	lsls r0, r7
	orrs r2, r0
_080BA146:
	adds r0, r2, 0
	bl InvertPlttBuffer
	mov r0, r8
	bl DestroyAnimVisualTask
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA160: .4byte gBattleAnimAttacker
_080BA164: .4byte gBattleAnimTarget
_080BA168: .4byte gBattleAnimArgs
	thumb_func_end sub_80BA0E8

	thumb_func_start sub_80BA16C
sub_80BA16C: @ 80BA16C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r5, 0
	ldr r1, _080BA260 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080BA1AE
	ldr r1, _080BA264 @ =gBattleAnimArgs
	ldrh r0, [r1]
	strh r0, [r4, 0xC]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0xE]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x10]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0xA]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x12]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x14]
	ldrh r0, [r1, 0xC]
	strh r0, [r4, 0x16]
_080BA1AE:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldr r0, _080BA268 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	mov r9, r0
	ldr r0, _080BA26C @ =gBattleAnimTarget
	ldrb r0, [r0]
	mov r10, r0
	ldrh r1, [r4, 0xC]
	movs r7, 0x80
	lsls r7, 1
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _080BA1D0
	ldr r5, _080BA270 @ =0x0000ffff
_080BA1D0:
	movs r6, 0x1
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	beq _080BA200
	ldr r2, _080BA274 @ =gSprites
	ldr r0, _080BA278 @ =gHealthboxSpriteIds
	add r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x14
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, 0x2]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r1, r6, 0
	lsls r1, r0
	lsls r1, 16
	orrs r5, r1
_080BA200:
	ldrh r1, [r4, 0xE]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _080BA214
	adds r0, r6, 0
	mov r2, r9
	lsls r0, r2
	lsls r0, 16
	orrs r5, r0
_080BA214:
	ldrh r1, [r4, 0x10]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _080BA228
	adds r0, r6, 0
	mov r1, r10
	lsls r0, r1
	lsls r0, 16
	orrs r5, r0
_080BA228:
	movs r1, 0x12
	ldrsb r1, [r4, r1]
	movs r2, 0x14
	ldrsb r2, [r4, r2]
	movs r3, 0x16
	ldrsb r3, [r4, r3]
	adds r0, r5, 0
	bl TintPlttBuffer
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080BA252
	adds r0, r5, 0
	bl UnfadePlttBuffer
	mov r0, r8
	bl DestroyAnimVisualTask
_080BA252:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA260: .4byte gTasks
_080BA264: .4byte gBattleAnimArgs
_080BA268: .4byte gBattleAnimAttacker
_080BA26C: .4byte gBattleAnimTarget
_080BA270: .4byte 0x0000ffff
_080BA274: .4byte gSprites
_080BA278: .4byte gHealthboxSpriteIds
	thumb_func_end sub_80BA16C

	thumb_func_start sub_80BA27C
sub_80BA27C: @ 80BA27C
	push {r4,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080BA2B0 @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x30]
	strh r0, [r4, 0x32]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x34]
	movs r2, 0x6
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	beq _080BA2C4
	cmp r0, 0x1
	bgt _080BA2B4
	cmp r0, 0
	beq _080BA2BA
	b _080BA2DC
	.align 2, 0
_080BA2B0: .4byte gBattleAnimArgs
_080BA2B4:
	cmp r0, 0x2
	beq _080BA2CC
	b _080BA2DC
_080BA2BA:
	ldr r1, _080BA2C0 @ =gBattle_BG3_X
	b _080BA2CE
	.align 2, 0
_080BA2C0: .4byte gBattle_BG3_X
_080BA2C4:
	ldr r1, _080BA2C8 @ =gBattle_BG3_Y
	b _080BA2CE
	.align 2, 0
_080BA2C8: .4byte gBattle_BG3_Y
_080BA2CC:
	ldr r1, _080BA2D8 @ =gSpriteCoordOffsetX
_080BA2CE:
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	b _080BA2E4
	.align 2, 0
_080BA2D8: .4byte gSpriteCoordOffsetX
_080BA2DC:
	ldr r1, _080BA314 @ =gSpriteCoordOffsetY
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
_080BA2E4:
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	lsls r0, 16
	orrs r1, r0
	ldrh r0, [r1]
	strh r0, [r4, 0x36]
	ldr r0, _080BA318 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x6]
	strh r0, [r4, 0x38]
	subs r0, 0x2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080BA308
	bl sub_80BA3CC
_080BA308:
	ldr r0, _080BA31C @ =sub_80BA320
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA314: .4byte gSpriteCoordOffsetY
_080BA318: .4byte gBattleAnimArgs
_080BA31C: .4byte sub_80BA320
	thumb_func_end sub_80BA27C

	thumb_func_start sub_80BA320
sub_80BA320: @ 80BA320
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x34]
	movs r2, 0x34
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _080BA362
	subs r0, r1, 0x1
	strh r0, [r3, 0x34]
	ldrh r1, [r3, 0x30]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _080BA342
	subs r0, r1, 0x1
	strh r0, [r3, 0x30]
	b _080BA3BA
_080BA342:
	ldrh r0, [r3, 0x32]
	strh r0, [r3, 0x30]
	movs r0, 0x3A
	ldrsh r1, [r3, r0]
	movs r2, 0x3C
	ldrsh r0, [r3, r2]
	lsls r0, 16
	orrs r1, r0
	ldrh r0, [r3, 0x2E]
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	ldrh r0, [r3, 0x2E]
	negs r0, r0
	strh r0, [r3, 0x2E]
	b _080BA3BA
_080BA362:
	movs r0, 0x3A
	ldrsh r1, [r3, r0]
	movs r2, 0x3C
	ldrsh r0, [r3, r2]
	lsls r0, 16
	orrs r1, r0
	ldrh r0, [r3, 0x36]
	strh r0, [r1]
	ldrh r0, [r3, 0x38]
	subs r0, 0x2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080BA3B4
	movs r4, 0
	ldr r5, _080BA3C0 @ =gBattlersCount
	ldrb r0, [r5]
	cmp r4, r0
	bcs _080BA3B4
	ldr r2, _080BA3C4 @ =gSprites
	mov r12, r2
	ldr r6, _080BA3C8 @ =gBattlerSpriteIds
	movs r7, 0x3
	negs r7, r7
_080BA392:
	adds r0, r4, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r12
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r7, 0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r5]
	cmp r4, r0
	bcc _080BA392
_080BA3B4:
	adds r0, r3, 0
	bl DestroyAnimSprite
_080BA3BA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA3C0: .4byte gBattlersCount
_080BA3C4: .4byte gSprites
_080BA3C8: .4byte gBattlerSpriteIds
	thumb_func_end sub_80BA320

	thumb_func_start sub_80BA3CC
sub_80BA3CC: @ 80BA3CC
	push {r4-r6,lr}
	ldr r6, _080BA440 @ =gSprites
	ldr r4, _080BA444 @ =gBattlerSpriteIds
	ldr r5, _080BA448 @ =gBattleAnimAttacker
	ldrb r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x3
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	ldr r3, _080BA44C @ =gBattleAnimTarget
	ldrb r0, [r3]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	ldr r0, _080BA450 @ =gBattleAnimArgs
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0x2
	bne _080BA454
	ldrb r0, [r5]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r3]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	b _080BA470
	.align 2, 0
_080BA440: .4byte gSprites
_080BA444: .4byte gBattlerSpriteIds
_080BA448: .4byte gBattleAnimAttacker
_080BA44C: .4byte gBattleAnimTarget
_080BA450: .4byte gBattleAnimArgs
_080BA454:
	cmp r0, 0
	bne _080BA45C
	ldrb r0, [r5]
	b _080BA45E
_080BA45C:
	ldrb r0, [r3]
_080BA45E:
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x2
_080BA470:
	orrs r1, r2
	strb r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BA3CC

	thumb_func_start sub_80BA47C
sub_80BA47C: @ 80BA47C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080BA4BC @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r1
	ldr r3, _080BA4C0 @ =gBattleAnimArgs
	ldrh r1, [r3]
	strh r1, [r2, 0x8]
	ldrh r1, [r3, 0x2]
	strh r1, [r2, 0xA]
	ldrh r1, [r3, 0x4]
	strh r1, [r2, 0xC]
	ldrh r1, [r3, 0x6]
	strh r1, [r2, 0xE]
	ldrh r1, [r3, 0x6]
	strh r1, [r2, 0x18]
	ldr r4, _080BA4C4 @ =gBattle_BG3_X
	ldrh r1, [r3]
	strh r1, [r4]
	ldr r4, _080BA4C8 @ =gBattle_BG3_Y
	ldrh r1, [r3, 0x2]
	strh r1, [r4]
	ldr r1, _080BA4CC @ =sub_80BA4D0
	str r1, [r2]
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA4BC: .4byte gTasks
_080BA4C0: .4byte gBattleAnimArgs
_080BA4C4: .4byte gBattle_BG3_X
_080BA4C8: .4byte gBattle_BG3_Y
_080BA4CC: .4byte sub_80BA4D0
	thumb_func_end sub_80BA47C

	thumb_func_start sub_80BA4D0
sub_80BA4D0: @ 80BA4D0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080BA500 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r1
	ldrh r2, [r3, 0xE]
	movs r4, 0xE
	ldrsh r0, [r3, r4]
	mov r12, r1
	cmp r0, 0
	bne _080BA556
	ldr r0, _080BA504 @ =gBattle_BG3_X
	ldrh r2, [r0]
	movs r7, 0x8
	ldrsh r1, [r3, r7]
	adds r6, r0, 0
	cmp r2, r1
	bne _080BA508
	ldrh r0, [r3, 0x8]
	negs r0, r0
	b _080BA50A
	.align 2, 0
_080BA500: .4byte gTasks
_080BA504: .4byte gBattle_BG3_X
_080BA508:
	ldrh r0, [r3, 0x8]
_080BA50A:
	strh r0, [r6]
	ldr r2, _080BA528 @ =gBattle_BG3_Y
	ldrh r3, [r2]
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r0, 3
	mov r7, r12
	adds r4, r0, r7
	movs r7, 0xA
	ldrsh r0, [r4, r7]
	cmn r3, r0
	bne _080BA52C
	movs r0, 0
	b _080BA530
	.align 2, 0
_080BA528: .4byte gBattle_BG3_Y
_080BA52C:
	ldrh r0, [r4, 0xA]
	negs r0, r0
_080BA530:
	strh r0, [r2]
	adds r0, r1, r5
	lsls r0, 3
	add r0, r12
	ldrh r1, [r0, 0x18]
	strh r1, [r0, 0xE]
	ldrh r1, [r0, 0xC]
	subs r1, 0x1
	strh r1, [r0, 0xC]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0
	bne _080BA55A
	strh r1, [r6]
	strh r1, [r2]
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	b _080BA55A
_080BA556:
	subs r0, r2, 0x1
	strh r0, [r3, 0xE]
_080BA55A:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BA4D0

	thumb_func_start sub_80BA560
sub_80BA560: @ 80BA560
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080BA580 @ =gBattleAnimArgs
	ldrb r1, [r4, 0x6]
	bl StartSpriteAffineAnim
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080BA584
	adds r0, r5, 0
	movs r1, 0x1
	bl InitSpritePosToAnimAttacker
	b _080BA58C
	.align 2, 0
_080BA580: .4byte gBattleAnimArgs
_080BA584:
	adds r0, r5, 0
	movs r1, 0x1
	bl InitSpritePosToAnimTarget
_080BA58C:
	ldr r0, _080BA5A0 @ =RunStoredCallbackWhenAffineAnimEnds
	str r0, [r5, 0x1C]
	ldr r1, _080BA5A4 @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA5A0: .4byte RunStoredCallbackWhenAffineAnimEnds
_080BA5A4: .4byte DestroyAnimSprite
	thumb_func_end sub_80BA560

	thumb_func_start sub_80BA5A8
sub_80BA5A8: @ 80BA5A8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080BA5C8 @ =gBattleAnimArgs
	ldrb r1, [r4, 0x6]
	bl StartSpriteAffineAnim
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080BA5CC
	adds r0, r5, 0
	movs r1, 0x1
	bl InitSpritePosToAnimAttacker
	b _080BA5D4
	.align 2, 0
_080BA5C8: .4byte gBattleAnimArgs
_080BA5CC:
	adds r0, r5, 0
	movs r1, 0x1
	bl InitSpritePosToAnimTarget
_080BA5D4:
	ldr r0, _080BA5EC @ =gBattleAnimArgs
	ldrh r0, [r0, 0x8]
	strh r0, [r5, 0x2E]
	ldr r0, _080BA5F0 @ =RunStoredCallbackWhenAffineAnimEnds
	str r0, [r5, 0x1C]
	ldr r1, _080BA5F4 @ =sub_80B1D3C
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA5EC: .4byte gBattleAnimArgs
_080BA5F0: .4byte RunStoredCallbackWhenAffineAnimEnds
_080BA5F4: .4byte sub_80B1D3C
	thumb_func_end sub_80BA5A8

	thumb_func_start sub_80BA5F8
sub_80BA5F8: @ 80BA5F8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080BA628 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080BA61C
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080BA61C
	ldr r1, _080BA62C @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080BA61C:
	adds r0, r4, 0
	bl sub_80BA560
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA628: .4byte gBattleAnimAttacker
_080BA62C: .4byte gBattleAnimArgs
	thumb_func_end sub_80BA5F8

	thumb_func_start sub_80BA630
sub_80BA630: @ 80BA630
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080BA668 @ =gBattleAnimArgs
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080BA64C
	bl Random
	movs r1, 0x3
	ands r1, r0
	strh r1, [r5, 0x2]
_080BA64C:
	ldrb r1, [r5, 0x2]
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080BA66C
	adds r0, r4, 0
	movs r1, 0
	bl InitSpritePosToAnimAttacker
	b _080BA674
	.align 2, 0
_080BA668: .4byte gBattleAnimArgs
_080BA66C:
	adds r0, r4, 0
	movs r1, 0
	bl InitSpritePosToAnimTarget
_080BA674:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x30
	bl __umodsi3
	ldr r1, _080BA6B8 @ =0x0000ffe8
	adds r0, r1
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x18
	bl __umodsi3
	ldr r1, _080BA6BC @ =0x0000fff4
	adds r0, r1
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldr r1, _080BA6C0 @ =DestroySpriteAndMatrix
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080BA6C4 @ =RunStoredCallbackWhenAffineAnimEnds
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA6B8: .4byte 0x0000ffe8
_080BA6BC: .4byte 0x0000fff4
_080BA6C0: .4byte DestroySpriteAndMatrix
_080BA6C4: .4byte RunStoredCallbackWhenAffineAnimEnds
	thumb_func_end sub_80BA630

	thumb_func_start sub_80BA6C8
sub_80BA6C8: @ 80BA6C8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080BA728 @ =gBattleAnimArgs
	ldrb r0, [r5]
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x2E]
	ldr r2, _080BA72C @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x24]
	ldrh r0, [r0, 0x20]
	adds r1, r0
	strh r1, [r4, 0x20]
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	strh r1, [r4, 0x22]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x24]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x26]
	ldrb r1, [r5, 0x6]
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	ldr r1, _080BA730 @ =DestroySpriteAndMatrix
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080BA734 @ =RunStoredCallbackWhenAffineAnimEnds
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA728: .4byte gBattleAnimArgs
_080BA72C: .4byte gSprites
_080BA730: .4byte DestroySpriteAndMatrix
_080BA734: .4byte RunStoredCallbackWhenAffineAnimEnds
	thumb_func_end sub_80BA6C8

	thumb_func_start sub_80BA738
sub_80BA738: @ 80BA738
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080BA750 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080BA754
	adds r0, r4, 0
	movs r1, 0x1
	bl InitSpritePosToAnimAttacker
	b _080BA75C
	.align 2, 0
_080BA750: .4byte gBattleAnimArgs
_080BA754:
	adds r0, r4, 0
	movs r1, 0x1
	bl InitSpritePosToAnimTarget
_080BA75C:
	ldr r0, _080BA774 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x6]
	strh r0, [r4, 0x2E]
	ldr r1, _080BA778 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080BA77C @ =WaitAnimForDuration
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA774: .4byte gBattleAnimArgs
_080BA778: .4byte DestroyAnimSprite
_080BA77C: .4byte WaitAnimForDuration
	thumb_func_end sub_80BA738

	thumb_func_start sub_80BA780
sub_80BA780: @ 80BA780
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080BA7A0 @ =gBattleAnimArgs
	ldrb r1, [r4, 0x6]
	bl StartSpriteAffineAnim
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080BA7A4
	adds r0, r5, 0
	movs r1, 0x1
	bl InitSpritePosToAnimAttacker
	b _080BA7AC
	.align 2, 0
_080BA7A0: .4byte gBattleAnimArgs
_080BA7A4:
	adds r0, r5, 0
	movs r1, 0x1
	bl InitSpritePosToAnimTarget
_080BA7AC:
	ldr r0, _080BA7B8 @ =sub_80BA7BC
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA7B8: .4byte sub_80BA7BC
	thumb_func_end sub_80BA780

	thumb_func_start sub_80BA7BC
sub_80BA7BC: @ 80BA7BC
	push {lr}
	adds r3, r0, 0
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
	ldrh r0, [r3, 0x2E]
	adds r1, r0, 0x1
	strh r1, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080BA7F2
	adds r0, r3, 0
	bl DestroyAnimSprite
_080BA7F2:
	pop {r0}
	bx r0
	thumb_func_end sub_80BA7BC

	.align 2, 0 @ Don't pad with nop.
