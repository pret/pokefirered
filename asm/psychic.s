	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80B2ECC
sub_80B2ECC: @ 80B2ECC
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r0, _080B2F84 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B2EE8
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080B2EFE
_080B2EE8:
	ldrb r1, [r6, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r6, 0x5]
	adds r1, r6, 0
	adds r1, 0x43
	movs r0, 0xC8
	strb r0, [r1]
_080B2EFE:
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080B2F5A
	movs r0, 0x1
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	adds r0, r4, 0
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	eors r0, r1
	negs r1, r0
	orrs r1, r0
	lsrs r5, r1, 31
	adds r0, r4, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080B2F3C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8072E48
_080B2F3C:
	movs r0, 0x2
	adds r4, r0, 0
	eors r4, r7
	adds r0, r4, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080B2F5A
	movs r0, 0x1
	eors r5, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8072E48
_080B2F5A:
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080B2F90
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _080B2F90
	ldr r0, _080B2F84 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B2F88
	movs r0, 0x48
	strh r0, [r6, 0x20]
	movs r0, 0x50
	b _080B2FCA
	.align 2, 0
_080B2F84: .4byte gBattleAnimAttacker
_080B2F88:
	movs r0, 0xB0
	strh r0, [r6, 0x20]
	movs r0, 0x28
	b _080B2FCA
_080B2F90:
	ldr r5, _080B3000 @ =gBattleAnimAttacker
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B2FA6
	ldr r1, _080B3004 @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080B2FA6:
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	ldr r4, _080B3004 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x2]
	adds r0, r4
_080B2FCA:
	strh r0, [r6, 0x22]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080B2FDC
	ldrh r0, [r6, 0x22]
	adds r0, 0x9
	strh r0, [r6, 0x22]
_080B2FDC:
	ldr r0, _080B3004 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	strh r0, [r6, 0x2E]
	ldr r1, _080B3008 @ =sub_80B300C
	str r1, [r6, 0x1C]
	adds r0, r6, 0
	bl _call_via_r1
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3000: .4byte gBattleAnimAttacker
_080B3004: .4byte gBattleAnimArgs
_080B3008: .4byte sub_80B300C
	thumb_func_end sub_80B2ECC

	thumb_func_start sub_80B300C
sub_80B300C: @ 80B300C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x34]
	movs r1, 0x10
	subs r1, r0
	lsls r1, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	ldrh r1, [r4, 0x34]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r0, 0xD
	bne _080B3038
	ldr r0, _080B3034 @ =sub_80B3044
	str r0, [r4, 0x1C]
	b _080B303C
	.align 2, 0
_080B3034: .4byte sub_80B3044
_080B3038:
	adds r0, r1, 0x1
	strh r0, [r4, 0x34]
_080B303C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B300C

	thumb_func_start sub_80B3044
sub_80B3044: @ 80B3044
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080B30A2
	movs r0, 0
	strh r0, [r3, 0x30]
	ldrh r4, [r3, 0x2E]
	ldr r1, _080B30A8 @ =gPlttBufferFaded
	adds r0, r4, 0
	adds r0, 0x8
	lsls r0, 1
	adds r0, r1
	ldrh r7, [r0]
	movs r5, 0x8
	adds r6, r1, 0
	adds r1, r4, 0x7
	lsls r0, r4, 1
	adds r0, r6
	adds r2, r0, 0
	adds r2, 0x10
	lsls r1, 1
	adds r1, r6
_080B307A:
	ldrh r0, [r1]
	strh r0, [r2]
	subs r1, 0x2
	subs r2, 0x2
	subs r5, 0x1
	cmp r5, 0
	bgt _080B307A
	adds r0, r4, 0x1
	lsls r0, 1
	adds r0, r6
	strh r7, [r0]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	bne _080B30A2
	ldr r0, _080B30AC @ =sub_80B30B0
	str r0, [r3, 0x1C]
_080B30A2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B30A8: .4byte gPlttBufferFaded
_080B30AC: .4byte sub_80B30B0
	thumb_func_end sub_80B3044

	thumb_func_start sub_80B30B0
sub_80B30B0: @ 80B30B0
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x34]
	movs r1, 0x10
	subs r1, r0
	lsls r1, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	ldrh r0, [r5, 0x34]
	subs r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080B3156
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080B3146
	movs r0, 0x1
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	adds r0, r4, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080B3118
	ldr r2, _080B315C @ =gSprites
	ldr r0, _080B3160 @ =gBattlerSpriteIds
	adds r0, r4, r0
	ldrb r1, [r0]
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
_080B3118:
	movs r0, 0x2
	adds r4, r0, 0
	eors r4, r6
	adds r0, r4, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080B3146
	ldr r2, _080B315C @ =gSprites
	ldr r0, _080B3160 @ =gBattlerSpriteIds
	adds r0, r4, r0
	ldrb r1, [r0]
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
_080B3146:
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080B3164 @ =sub_80B3168
	str r0, [r5, 0x1C]
_080B3156:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B315C: .4byte gSprites
_080B3160: .4byte gBattlerSpriteIds
_080B3164: .4byte sub_80B3168
	thumb_func_end sub_80B30B0

	thumb_func_start sub_80B3168
sub_80B3168: @ 80B3168
	push {r4-r6,lr}
	adds r6, r0, 0
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080B31C0
	movs r0, 0x1
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	eors r0, r1
	negs r1, r0
	orrs r1, r0
	lsrs r5, r1, 31
	adds r0, r4, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080B31A6
	adds r0, r5, 0
	bl sub_8073128
_080B31A6:
	movs r0, 0x2
	eors r4, r0
	adds r0, r4, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080B31C0
	movs r0, 0x1
	eors r5, r0
	adds r0, r5, 0
	bl sub_8073128
_080B31C0:
	ldr r0, _080B31CC @ =DestroyAnimSprite
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B31CC: .4byte DestroyAnimSprite
	thumb_func_end sub_80B3168

	thumb_func_start sub_80B31D0
sub_80B31D0: @ 80B31D0
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B325C
	ldr r5, _080B321C @ =gBattleAnimArgs
	movs r1, 0x6
	ldrsh r0, [r5, r1]
	movs r6, 0
	cmp r0, 0
	bne _080B31EA
	movs r6, 0x1
_080B31EA:
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080B3232
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _080B3232
	ldr r0, _080B3220 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B3224
	ldrh r0, [r5]
	movs r1, 0x48
	subs r1, r0
	strh r1, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	adds r0, 0x50
	strh r0, [r4, 0x22]
	b _080B3254
	.align 2, 0
_080B321C: .4byte gBattleAnimArgs
_080B3220: .4byte gBattleAnimAttacker
_080B3224:
	ldrh r0, [r5]
	adds r0, 0xB0
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	adds r0, 0x28
	strh r0, [r4, 0x22]
	b _080B3254
_080B3232:
	ldr r0, _080B3248 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B324C
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8075160
	b _080B3254
	.align 2, 0
_080B3248: .4byte gBattleAnimArgs
_080B324C:
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8075114
_080B3254:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080B3270
_080B325C:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0
	beq _080B3270
	adds r0, r4, 0
	bl move_anim_8074EE0
_080B3270:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80B31D0

	thumb_func_start sub_80B3278
sub_80B3278: @ 80B3278
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080B32C0 @ =gBattleAnimAttacker
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
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B32C8
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldrh r0, [r5, 0x20]
	subs r0, 0x28
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x22]
	adds r0, 0xA
	strh r0, [r5, 0x22]
	ldr r0, _080B32C4 @ =0x0000ffff
	b _080B32D6
	.align 2, 0
_080B32C0: .4byte gBattleAnimAttacker
_080B32C4: .4byte 0x0000ffff
_080B32C8:
	ldrh r0, [r5, 0x20]
	adds r0, 0x28
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x22]
	subs r0, 0xA
	strh r0, [r5, 0x22]
	movs r0, 0x1
_080B32D6:
	strh r0, [r5, 0x30]
	ldr r1, _080B32EC @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080B32F0 @ =sub_8074F6C
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B32EC: .4byte DestroyAnimSprite
_080B32F0: .4byte sub_8074F6C
	thumb_func_end sub_80B3278

	thumb_func_start sub_80B32F4
sub_80B32F4: @ 80B32F4
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r6, _080B3378 @ =gBattleAnimAttacker
	ldrb r0, [r6]
	movs r1, 0x1
	bl sub_8076B2C
	lsls r0, 16
	asrs r1, r0, 16
	lsrs r0, 31
	adds r1, r0
	lsls r1, 15
	lsrs r4, r1, 16
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8076B2C
	lsls r0, 16
	asrs r1, r0, 16
	lsrs r0, 31
	adds r1, r0
	asrs r1, 1
	negs r1, r1
	lsls r1, 16
	lsrs r7, r1, 16
	ldrb r0, [r6]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B333A
	lsls r0, r4, 16
	negs r0, r0
	lsrs r4, r0, 16
_080B333A:
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	strh r0, [r5, 0x20]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, r7
	strh r0, [r5, 0x22]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bgt _080B3366
	movs r0, 0x10
	strh r0, [r5, 0x22]
_080B3366:
	ldr r1, _080B337C @ =sub_80B3384
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080B3380 @ =sub_8074F6C
	str r0, [r5, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3378: .4byte gBattleAnimAttacker
_080B337C: .4byte sub_80B3384
_080B3380: .4byte sub_8074F6C
	thumb_func_end sub_80B32F4

	thumb_func_start sub_80B3384
sub_80B3384: @ 80B3384
	push {r4,lr}
	adds r4, r0, 0
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _080B33B0 @ =gUnknown_83E6FF0
	str r0, [r4, 0x10]
	movs r0, 0
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	ldr r0, _080B33B4 @ =sub_80B33B8
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B33B0: .4byte gUnknown_83E6FF0
_080B33B4: .4byte sub_80B33B8
	thumb_func_end sub_80B3384

	thumb_func_start sub_80B33B8
sub_80B33B8: @ 80B33B8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080B33CA
	cmp r0, 0x1
	beq _080B33F8
	b _080B3410
_080B33CA:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080B3410
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x12
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080B3410
_080B33F8:
	ldrh r0, [r4, 0x30]
	subs r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080B3410
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B3410:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B33B8

	thumb_func_start sub_80B3418
sub_80B3418: @ 80B3418
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080B3448 @ =gTasks
	adds r4, r0
	movs r0, 0
	bl GetAnimBankSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r4, 0x8]
	ldr r2, _080B344C @ =gUnknown_83E700C
	adds r0, r4, 0
	bl sub_80762D0
	ldr r0, _080B3450 @ =sub_80B3454
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3448: .4byte gTasks
_080B344C: .4byte gUnknown_83E700C
_080B3450: .4byte sub_80B3454
	thumb_func_end sub_80B3418

	thumb_func_start sub_80B3454
sub_80B3454: @ 80B3454
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080B347C @ =gTasks
	adds r0, r1
	bl sub_8076308
	lsls r0, 24
	cmp r0, 0
	bne _080B3474
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080B3474:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B347C: .4byte gTasks
	thumb_func_end sub_80B3454

	thumb_func_start sub_80B3480
sub_80B3480: @ 80B3480
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B34CC @ =gTasks
	adds r4, r1, r0
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	strh r1, [r4, 0xC]
	ldr r0, _080B34D0 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	movs r1, 0x8
	cmp r0, 0
	beq _080B34B4
	movs r1, 0x4
_080B34B4:
	strh r1, [r4, 0xE]
	ldrb r1, [r4, 0x8]
	ldr r2, _080B34D4 @ =gUnknown_83E702C
	adds r0, r4, 0
	bl sub_80762D0
	ldr r0, _080B34D8 @ =sub_80B34DC
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B34CC: .4byte gTasks
_080B34D0: .4byte gBattleAnimAttacker
_080B34D4: .4byte gUnknown_83E702C
_080B34D8: .4byte sub_80B34DC
	thumb_func_end sub_80B3480

	thumb_func_start sub_80B34DC
sub_80B34DC: @ 80B34DC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080B34FC @ =gTasks
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080B3500
	cmp r0, 0x1
	beq _080B351C
	b _080B357A
	.align 2, 0
_080B34FC: .4byte gTasks
_080B3500:
	adds r0, r4, 0
	bl sub_8076308
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080B357A
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _080B357A
_080B351C:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080B3544
	ldr r2, _080B3540 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x8
	strh r1, [r0, 0x26]
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	b _080B357A
	.align 2, 0
_080B3540: .4byte gSprites
_080B3544:
	ldr r3, _080B3580 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0x88
	lsls r1, 1
	strh r1, [r0, 0x20]
	ldrb r0, [r4, 0x8]
	bl sub_8075980
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080B357A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B3580: .4byte gSprites
	thumb_func_end sub_80B34DC

	thumb_func_start sub_80B3584
sub_80B3584: @ 80B3584
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B360C @ =gTasks
	adds r5, r1, r0
	movs r1, 0
	movs r0, 0x10
	strh r0, [r5, 0xE]
	strh r1, [r5, 0x10]
	ldr r4, _080B3610 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x24]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8076B2C
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8076B2C
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, 0
	cmp r0, r6
	bcs _080B35EE
	adds r1, r6, 0
_080B35EE:
	strh r1, [r5, 0x20]
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0x10
	bl SetGpuReg
	ldr r0, _080B3614 @ =sub_80B3618
	str r0, [r5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B360C: .4byte gTasks
_080B3610: .4byte gBattleAnimAttacker
_080B3614: .4byte sub_80B3618
	thumb_func_end sub_80B3584

	thumb_func_start sub_80B3618
sub_80B3618: @ 80B3618
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080B363C @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _080B3718
	cmp r1, 0x1
	bgt _080B3640
	cmp r1, 0
	beq _080B364E
	b _080B379E
	.align 2, 0
_080B363C: .4byte gTasks
_080B3640:
	cmp r1, 0x2
	bne _080B3646
	b _080B377A
_080B3646:
	cmp r1, 0x3
	bne _080B364C
	b _080B3788
_080B364C:
	b _080B379E
_080B364E:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bgt _080B365E
	b _080B379E
_080B365E:
	strh r1, [r4, 0xA]
	ldr r0, _080B369C @ =gUnknown_83E7044
	movs r2, 0x22
	ldrsh r1, [r4, r2]
	movs r3, 0x24
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	adds r1, 0x8
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x8
	adds r0, r1
	strh r2, [r0]
	cmp r2, 0x40
	beq _080B3702
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080B36BC
	cmp r0, 0x1
	bgt _080B36A0
	cmp r0, 0
	beq _080B36AA
	b _080B3702
	.align 2, 0
_080B369C: .4byte gUnknown_83E7044
_080B36A0:
	cmp r0, 0x2
	beq _080B36D4
	cmp r0, 0x3
	beq _080B36EC
	b _080B3702
_080B36AA:
	ldr r0, _080B36B8 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r4, 0x20]
	b _080B36FA
	.align 2, 0
_080B36B8: .4byte gSprites
_080B36BC:
	ldr r0, _080B36D0 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r4, 0x20]
	negs r0, r0
	strh r0, [r1, 0x24]
	ldrh r0, [r4, 0x20]
	b _080B3700
	.align 2, 0
_080B36D0: .4byte gSprites
_080B36D4:
	ldr r1, _080B36E8 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r4, 0x20]
	strh r1, [r0, 0x24]
	ldrh r1, [r4, 0x20]
	strh r1, [r0, 0x26]
	b _080B3702
	.align 2, 0
_080B36E8: .4byte gSprites
_080B36EC:
	ldr r0, _080B3714 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r4, 0x20]
	negs r0, r0
_080B36FA:
	strh r0, [r1, 0x24]
	ldrh r0, [r4, 0x20]
	negs r0, r0
_080B3700:
	strh r0, [r1, 0x26]
_080B3702:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _080B379E
	b _080B377A
	.align 2, 0
_080B3714: .4byte gSprites
_080B3718:
	ldrh r0, [r4, 0xA]
	ands r1, r0
	cmp r1, 0
	beq _080B3728
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	b _080B372E
_080B3728:
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
_080B372E:
	ldrh r1, [r4, 0x10]
	lsls r1, 8
	ldrh r0, [r4, 0xE]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x20
	bne _080B379E
	movs r5, 0x8
	adds r6, r4, 0
	adds r6, 0x8
_080B3754:
	lsls r0, r5, 1
	adds r1, r6, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0x40
	beq _080B3770
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B3784 @ =gSprites
	adds r0, r1
	bl DestroySprite
_080B3770:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xC
	bls _080B3754
_080B377A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B379E
	.align 2, 0
_080B3784: .4byte gSprites
_080B3788:
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080B379E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80B3618

	thumb_func_start sub_80B37A4
sub_80B37A4: @ 80B37A4
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	subs r0, 0xA
	cmp r1, r0
	ble _080B37CE
	ldrh r0, [r4, 0x30]
	movs r1, 0x1
	ands r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080B37CE:
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080B37E0
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B37E0:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B37A4

	thumb_func_start sub_80B37EC
sub_80B37EC: @ 80B37EC
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080B3828 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080B3818
	ldr r4, _080B382C @ =gBattleAnimAttacker
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
	strh r0, [r5, 0x22]
_080B3818:
	ldrh r0, [r6, 0x2]
	strh r0, [r5, 0x2E]
	ldr r0, _080B3830 @ =sub_80B37A4
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3828: .4byte gBattleAnimArgs
_080B382C: .4byte gBattleAnimAttacker
_080B3830: .4byte sub_80B37A4
	thumb_func_end sub_80B37EC

	thumb_func_start sub_80B3834
sub_80B3834: @ 80B3834
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B3890 @ =gTasks
	adds r5, r1, r0
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080B38D8
	ldr r0, _080B3894 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _080B38A4
	ldr r0, _080B3898 @ =0x0000fff6
	strh r0, [r5, 0x1C]
	ldr r4, _080B389C @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x5
	bl sub_8076B2C
	subs r0, 0x8
	strh r0, [r5, 0x1E]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8076B2C
	adds r0, 0x8
	strh r0, [r5, 0x20]
	ldr r4, _080B38A0 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0x5
	bl sub_8076B2C
	subs r0, 0x8
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8076B2C
	adds r0, 0x8
	b _080B3962
	.align 2, 0
_080B3890: .4byte gTasks
_080B3894: .4byte gBattleAnimArgs
_080B3898: .4byte 0x0000fff6
_080B389C: .4byte gBattleAnimTarget
_080B38A0: .4byte gBattleAnimAttacker
_080B38A4:
	movs r0, 0xA
	strh r0, [r5, 0x1C]
	ldr r4, _080B38D0 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0x4
	bl sub_8076B2C
	adds r0, 0x8
	strh r0, [r5, 0x1E]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8076B2C
	subs r0, 0x8
	strh r0, [r5, 0x20]
	ldr r4, _080B38D4 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x4
	bl sub_8076B2C
	adds r0, 0x8
	b _080B3956
	.align 2, 0
_080B38D0: .4byte gBattleAnimAttacker
_080B38D4: .4byte gBattleAnimTarget
_080B38D8:
	ldr r0, _080B391C @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _080B392C
	ldr r0, _080B3920 @ =0x0000fff6
	strh r0, [r5, 0x1C]
	ldr r4, _080B3924 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x4
	bl sub_8076B2C
	adds r0, 0x8
	strh r0, [r5, 0x1E]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8076B2C
	adds r0, 0x8
	strh r0, [r5, 0x20]
	ldr r4, _080B3928 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0x4
	bl sub_8076B2C
	adds r0, 0x8
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8076B2C
	adds r0, 0x8
	b _080B3962
	.align 2, 0
_080B391C: .4byte gBattleAnimArgs
_080B3920: .4byte 0x0000fff6
_080B3924: .4byte gBattleAnimTarget
_080B3928: .4byte gBattleAnimAttacker
_080B392C:
	movs r0, 0xA
	strh r0, [r5, 0x1C]
	ldr r4, _080B3974 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0x5
	bl sub_8076B2C
	subs r0, 0x8
	strh r0, [r5, 0x1E]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8076B2C
	subs r0, 0x8
	strh r0, [r5, 0x20]
	ldr r4, _080B3978 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x5
	bl sub_8076B2C
	subs r0, 0x8
_080B3956:
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8076B2C
	subs r0, 0x8
_080B3962:
	strh r0, [r5, 0x24]
	movs r0, 0x6
	strh r0, [r5, 0xA]
	ldr r0, _080B397C @ =sub_80B3980
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B3974: .4byte gBattleAnimAttacker
_080B3978: .4byte gBattleAnimTarget
_080B397C: .4byte sub_80B3980
	thumb_func_end sub_80B3834

	thumb_func_start sub_80B3980
sub_80B3980: @ 80B3980
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080B39A0 @ =gTasks
	adds r5, r0, r1
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	cmp r1, 0
	beq _080B39A4
	cmp r1, 0x1
	beq _080B3A18
	b _080B3A2C
	.align 2, 0
_080B39A0: .4byte gTasks
_080B39A4:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _080B3A2C
	strh r1, [r5, 0xA]
	ldr r0, _080B3A10 @ =gUnknown_83E7114
	movs r2, 0x1E
	ldrsh r1, [r5, r2]
	movs r3, 0x20
	ldrsh r2, [r5, r3]
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080B39F8
	ldr r0, _080B3A14 @ =gSprites
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r0
	movs r0, 0x10
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x22]
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0x24]
	strh r0, [r4, 0x36]
	ldrh r0, [r5, 0x1C]
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_8075068
	ldrb r0, [r5, 0xC]
	movs r1, 0x3
	ands r1, r0
	adds r0, r4, 0
	bl StartSpriteAffineAnim
_080B39F8:
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bne _080B3A2C
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080B3A2C
	.align 2, 0
_080B3A10: .4byte gUnknown_83E7114
_080B3A14: .4byte gSprites
_080B3A18:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x11
	ble _080B3A2C
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080B3A2C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80B3980

	thumb_func_start sub_80B3A34
sub_80B3A34: @ 80B3A34
	push {r4,lr}
	adds r4, r0, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080B3A52
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_080B3A52:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B3A34

	thumb_func_start sub_80B3A58
sub_80B3A58: @ 80B3A58
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B3A90 @ =gTasks
	adds r4, r1, r0
	ldr r0, _080B3A94 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl sub_807492C
	lsls r0, 24
	lsrs r1, r0, 24
	adds r0, r1, 0
	subs r0, 0x20
	strh r0, [r4, 0x24]
	ldr r0, _080B3A98 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0x1
	beq _080B3AAE
	cmp r0, 0x1
	bgt _080B3A9C
	cmp r0, 0
	beq _080B3AA2
	b _080B3ACA
	.align 2, 0
_080B3A90: .4byte gTasks
_080B3A94: .4byte gBattleAnimTarget
_080B3A98: .4byte gBattleAnimArgs
_080B3A9C:
	cmp r0, 0x2
	beq _080B3ABA
	b _080B3ACA
_080B3AA2:
	movs r0, 0x2
	strh r0, [r4, 0x1E]
	movs r0, 0x5
	strh r0, [r4, 0x20]
	movs r0, 0x40
	b _080B3AC2
_080B3AAE:
	movs r0, 0x2
	strh r0, [r4, 0x1E]
	movs r0, 0x5
	strh r0, [r4, 0x20]
	movs r0, 0xC0
	b _080B3AC2
_080B3ABA:
	movs r0, 0x4
	strh r0, [r4, 0x1E]
	strh r0, [r4, 0x20]
	movs r0, 0
_080B3AC2:
	strh r0, [r4, 0x22]
	adds r0, r1, 0
	adds r0, 0x20
	strh r0, [r4, 0x26]
_080B3ACA:
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _080B3AD6
	movs r0, 0
	strh r0, [r4, 0x24]
_080B3AD6:
	ldr r0, _080B3AF0 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B3AFC
	ldr r0, _080B3AF4 @ =gBattle_BG1_X
	ldrh r0, [r0]
	strh r0, [r4, 0x1C]
	ldr r0, _080B3AF8 @ =0x04000014
	b _080B3B04
	.align 2, 0
_080B3AF0: .4byte gBattleAnimTarget
_080B3AF4: .4byte gBattle_BG1_X
_080B3AF8: .4byte 0x04000014
_080B3AFC:
	ldr r0, _080B3B64 @ =gBattle_BG2_X
	ldrh r0, [r0]
	strh r0, [r4, 0x1C]
	ldr r0, _080B3B68 @ =0x04000018
_080B3B04:
	str r0, [sp]
	ldrh r1, [r4, 0x24]
	lsls r3, r1, 16
	asrs r1, r3, 16
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	adds r0, 0x40
	cmp r1, r0
	bgt _080B3B3E
	ldr r5, _080B3B6C @ =gScanlineEffectRegBuffers
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
_080B3B1E:
	asrs r3, 16
	lsls r1, r3, 1
	adds r2, r1, r5
	ldrh r0, [r4, 0x1C]
	strh r0, [r2]
	adds r1, r6
	ldrh r0, [r4, 0x1C]
	strh r0, [r1]
	adds r3, 0x1
	lsls r3, 16
	asrs r1, r3, 16
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	adds r0, 0x40
	cmp r1, r0
	ble _080B3B1E
_080B3B3E:
	ldr r0, _080B3B70 @ =0xa2600001
	str r0, [sp, 0x4]
	mov r1, sp
	movs r2, 0
	movs r0, 0x1
	strb r0, [r1, 0x8]
	mov r0, sp
	strb r2, [r0, 0x9]
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl ScanlineEffect_SetParams
	ldr r0, _080B3B74 @ =sub_80B3B78
	str r0, [r4]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3B64: .4byte gBattle_BG2_X
_080B3B68: .4byte 0x04000018
_080B3B6C: .4byte gScanlineEffectRegBuffers
_080B3B70: .4byte 0xa2600001
_080B3B74: .4byte sub_80B3B78
	thumb_func_end sub_80B3A58

	thumb_func_start sub_80B3B78
sub_80B3B78: @ 80B3B78
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080B3BA0 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080B3C52
	cmp r0, 0x1
	bgt _080B3BA4
	cmp r0, 0
	beq _080B3BAA
	b _080B3C6A
	.align 2, 0
_080B3BA0: .4byte gTasks
_080B3BA4:
	cmp r0, 0x2
	beq _080B3C64
	b _080B3C6A
_080B3BAA:
	ldrh r3, [r5, 0x22]
	ldrh r4, [r5, 0x24]
	movs r2, 0x24
	ldrsh r1, [r5, r2]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bgt _080B3C42
	ldr r0, _080B3BF4 @ =gSineTable
	mov r9, r0
	movs r7, 0x3
	ldr r1, _080B3BF8 @ =gScanlineEffectRegBuffers
	mov r12, r1
	movs r2, 0xF0
	lsls r2, 3
	add r2, r12
	mov r8, r2
_080B3BCC:
	lsls r2, r3, 16
	asrs r0, r2, 15
	add r0, r9
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r3, 0x20
	ldrsh r1, [r5, r3]
	asrs r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r3, r0, 16
	adds r6, r2, 0
	cmp r3, 0
	ble _080B3BFC
	ldrh r1, [r5, 0xA]
	adds r0, r7, 0
	ands r0, r1
	adds r0, r3, r0
	b _080B3C08
	.align 2, 0
_080B3BF4: .4byte gSineTable
_080B3BF8: .4byte gScanlineEffectRegBuffers
_080B3BFC:
	cmp r3, 0
	bge _080B3C0C
	ldrh r1, [r5, 0xA]
	adds r0, r7, 0
	ands r0, r1
	subs r0, r3, r0
_080B3C08:
	lsls r0, 16
	lsrs r1, r0, 16
_080B3C0C:
	lsls r2, r4, 16
	asrs r2, 16
	lsls r3, r2, 1
	mov r0, r12
	adds r4, r3, r0
	ldrh r0, [r5, 0x1C]
	lsls r1, 16
	asrs r1, 16
	adds r0, r1, r0
	strh r0, [r4]
	add r3, r8
	ldrh r0, [r5, 0x1C]
	adds r1, r0
	strh r1, [r3]
	asrs r0, r6, 16
	ldrh r1, [r5, 0x1E]
	adds r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	adds r2, 0x1
	lsls r2, 16
	lsrs r4, r2, 16
	asrs r2, 16
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	cmp r2, r0
	ble _080B3BCC
_080B3C42:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x17
	ble _080B3C6A
	b _080B3C58
_080B3C52:
	ldr r1, _080B3C60 @ =gScanlineEffect
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080B3C58:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080B3C6A
	.align 2, 0
_080B3C60: .4byte gScanlineEffect
_080B3C64:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080B3C6A:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B3B78

	thumb_func_start sub_80B3C78
sub_80B3C78: @ 80B3C78
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	mov r8, r4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080B3CAC @ =gTasks
	adds r7, r0, r1
	bl AllocOamMatrix
	lsls r0, 24
	lsrs r5, r0, 24
	mov r10, r5
	adds r6, r5, 0
	cmp r6, 0xFF
	bne _080B3CB0
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _080B3D5A
	.align 2, 0
_080B3CAC: .4byte gTasks
_080B3CB0:
	ldr r1, _080B3CD4 @ =gBattleAnimArgs
	ldrb r0, [r1]
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	lsls r0, 16
	lsrs r1, r0, 16
	mov r9, r1
	asrs r0, 16
	cmp r0, 0
	bge _080B3CD8
	adds r0, r5, 0
	bl FreeOamMatrix
	mov r0, r8
	bl DestroyAnimVisualTask
	b _080B3D5A
	.align 2, 0
_080B3CD4: .4byte gBattleAnimArgs
_080B3CD8:
	ldr r2, _080B3D68 @ =gSprites
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r0, r2, 0
	adds r0, 0x1C
	adds r0, r4, r0
	ldr r1, _080B3D6C @ =SpriteCallbackDummy
	str r1, [r0]
	adds r4, r2
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x1F
	ands r6, r0
	lsls r2, r6, 1
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x3]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r1, r9
	lsls r0, r1, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrb r3, [r4, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r4, 0
	bl CalcCenterToCornerVec
	ldr r1, _080B3D70 @ =gBattleAnimArgs
	ldrb r0, [r1]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x22]
	mov r0, r10
	strh r0, [r7, 0x24]
	mov r1, r9
	strh r1, [r7, 0x26]
	ldr r0, _080B3D74 @ =sub_80B3D78
	str r0, [r7]
_080B3D5A:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3D68: .4byte gSprites
_080B3D6C: .4byte SpriteCallbackDummy
_080B3D70: .4byte gBattleAnimArgs
_080B3D74: .4byte sub_80B3D78
	thumb_func_end sub_80B3C78

	thumb_func_start sub_80B3D78
sub_80B3D78: @ 80B3D78
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080B3D9C @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080B3DFC
	cmp r0, 0x1
	bgt _080B3DA0
	cmp r0, 0
	beq _080B3DAA
	b _080B3E7C
	.align 2, 0
_080B3D9C: .4byte gTasks
_080B3DA0:
	cmp r0, 0x2
	beq _080B3E4C
	cmp r0, 0x3
	beq _080B3E6C
	b _080B3E7C
_080B3DAA:
	ldrh r0, [r4, 0xA]
	adds r0, 0x4
	strh r0, [r4, 0xA]
	ldr r1, _080B3DF8 @ =gSineTable
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	lsls r1, 16
	asrs r1, 17
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	subs r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	lsls r1, 24
	lsrs r1, 24
	bl sub_8076494
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0x30
	bne _080B3E7C
	b _080B3E5E
	.align 2, 0
_080B3DF8: .4byte gSineTable
_080B3DFC:
	ldrh r0, [r4, 0xA]
	subs r0, 0x4
	strh r0, [r4, 0xA]
	ldr r1, _080B3E48 @ =gSineTable
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	lsls r1, 16
	asrs r1, 17
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	subs r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	lsls r1, 24
	lsrs r1, 24
	bl sub_8076494
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080B3E7C
	b _080B3E5E
	.align 2, 0
_080B3E48: .4byte gSineTable
_080B3E4C:
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B3E68 @ =gSprites
	adds r0, r1
	bl obj_delete_but_dont_free_vram
_080B3E5E:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B3E7C
	.align 2, 0
_080B3E68: .4byte gSprites
_080B3E6C:
	ldrh r0, [r4, 0x24]
	lsls r0, 24
	lsrs r0, 24
	bl FreeOamMatrix
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080B3E7C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80B3D78

	thumb_func_start sub_80B3E84
sub_80B3E84: @ 80B3E84
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080B3EFC
	cmp r0, 0x1
	bgt _080B3E9A
	cmp r0, 0
	beq _080B3EA4
	b _080B3FA4
_080B3E9A:
	cmp r0, 0x2
	beq _080B3F2E
	cmp r0, 0x3
	beq _080B3F8E
	b _080B3FA4
_080B3EA4:
	ldr r4, _080B3EF8 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080B3ED2
	ldrh r0, [r5, 0x22]
	adds r0, 0xC
	strh r0, [r5, 0x22]
_080B3ED2:
	movs r0, 0x8
	strh r0, [r5, 0x30]
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	ldrh r0, [r5, 0x30]
	movs r1, 0x10
	subs r1, r0
	lsls r1, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	b _080B3F26
	.align 2, 0
_080B3EF8: .4byte gBattleAnimAttacker
_080B3EFC:
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080B3FA4
	movs r0, 0x40
	negs r0, r0
	bl sub_8073A44
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xC4
	bl PlaySE12WithPanning
	adds r0, r5, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
_080B3F26:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080B3FA4
_080B3F2E:
	ldrh r0, [r5, 0x32]
	adds r1, r0, 0x1
	strh r1, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B3F72
	movs r0, 0
	strh r0, [r5, 0x32]
	ldrh r1, [r5, 0x30]
	subs r1, 0x1
	strh r1, [r5, 0x30]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080B3F72
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080B3F72:
	movs r0, 0xE0
	lsls r0, 2
	adds r2, r0, 0
	ldrh r1, [r5, 0x34]
	adds r2, r1
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r5, 0x26]
	subs r0, r1
	strh r0, [r5, 0x26]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r5, 0x34]
	b _080B3FA4
_080B3F8E:
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r5, 0
	bl DestroyAnimSprite
_080B3FA4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80B3E84

	.align 2, 0 @ Don't pad with nop.
