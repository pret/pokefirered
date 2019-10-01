	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80A6E48
sub_80A6E48: @ 80A6E48
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_8074FCC
	ldr r5, _080A6E8C @ =gBattleAnimArgs
	movs r0, 0
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl sub_8074FF8
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0xA]
	strh r0, [r4, 0x34]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x36]
	ldr r1, _080A6E90 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r1, _080A6E94 @ =sub_8074BE4
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6E8C: .4byte gBattleAnimArgs
_080A6E90: .4byte move_anim_8074EE0
_080A6E94: .4byte sub_8074BE4
	thumb_func_end sub_80A6E48

	thumb_func_start sub_80A6E98
sub_80A6E98: @ 80A6E98
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080A6EAC @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A6EB4
	ldr r0, _080A6EB0 @ =gBattleAnimAttacker
	b _080A6EB6
	.align 2, 0
_080A6EAC: .4byte gBattleAnimArgs
_080A6EB0: .4byte gBattleAnimAttacker
_080A6EB4:
	ldr r0, _080A6ED0 @ =gBattleAnimTarget
_080A6EB6:
	ldrb r0, [r0]
	adds r1, r4, 0
	bl sub_80A6B0C
	movs r0, 0
	strh r0, [r4, 0x2E]
	strh r0, [r4, 0x30]
	ldr r0, _080A6ED4 @ =sub_80A6ED8
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6ED0: .4byte gBattleAnimTarget
_080A6ED4: .4byte sub_80A6ED8
	thumb_func_end sub_80A6E98

	thumb_func_start sub_80A6ED8
sub_80A6ED8: @ 80A6ED8
	push {lr}
	adds r1, r0, 0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	beq _080A6F0A
	cmp r0, 0x1
	bgt _080A6EEE
	cmp r0, 0
	beq _080A6EF4
	b _080A6F38
_080A6EEE:
	cmp r0, 0x2
	beq _080A6F24
	b _080A6F38
_080A6EF4:
	ldrh r0, [r1, 0x26]
	subs r0, 0x3
	strh r0, [r1, 0x26]
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _080A6F38
	b _080A6F1C
_080A6F0A:
	ldrh r0, [r1, 0x26]
	adds r0, 0x3
	strh r0, [r1, 0x26]
	ldrh r0, [r1, 0x30]
	subs r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080A6F38
_080A6F1C:
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	b _080A6F38
_080A6F24:
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x40
	bne _080A6F38
	adds r0, r1, 0
	bl DestroyAnimSprite
_080A6F38:
	pop {r0}
	bx r0
	thumb_func_end sub_80A6ED8

	thumb_func_start sub_80A6F3C
sub_80A6F3C: @ 80A6F3C
	push {r4,lr}
	adds r4, r0, 0
	ldr r3, _080A6F88 @ =gSprites
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r4, 0x30]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	strh r1, [r0, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4, 0x30]
	movs r0, 0x2E
	ldrsh r2, [r4, r0]
	cmp r2, 0
	bne _080A6F7A
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r2, [r0, 0x24]
	adds r0, r4, 0
	bl move_anim_8074EE0
_080A6F7A:
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6F88: .4byte gSprites
	thumb_func_end sub_80A6F3C

	thumb_func_start sub_80A6F8C
sub_80A6F8C: @ 80A6F8C
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r4, _080A6FD4 @ =gBattleAnimAttacker
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
	ldr r1, _080A6FD8 @ =gBattlerSpriteIds
	ldr r0, _080A6FDC @ =gBattleAnimTarget
	ldrb r0, [r0]
	adds r0, r1
	ldrb r6, [r0]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A6FE4
	ldr r0, _080A6FE0 @ =gBattleAnimArgs
	ldrh r1, [r5, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r5, 0x20]
	adds r1, r0, 0
	b _080A6FEE
	.align 2, 0
_080A6FD4: .4byte gBattleAnimAttacker
_080A6FD8: .4byte gBattlerSpriteIds
_080A6FDC: .4byte gBattleAnimTarget
_080A6FE0: .4byte gBattleAnimArgs
_080A6FE4:
	ldr r1, _080A7018 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r5, 0x20]
	adds r0, r2
	strh r0, [r5, 0x20]
_080A6FEE:
	ldrh r0, [r1, 0x2]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x30]
	strh r6, [r5, 0x32]
	ldr r0, _080A701C @ =sub_80A6F3C
	str r0, [r5, 0x1C]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A7018: .4byte gBattleAnimArgs
_080A701C: .4byte sub_80A6F3C
	thumb_func_end sub_80A6F8C

	thumb_func_start sub_80A7020
sub_80A7020: @ 80A7020
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r1, _080A704C @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x38]
	ldr r0, _080A7050 @ =sub_8074C44
	str r0, [r4, 0x1C]
	ldr r1, _080A7054 @ =sub_80A7058
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A704C: .4byte gBattleAnimArgs
_080A7050: .4byte sub_8074C44
_080A7054: .4byte sub_80A7058
	thumb_func_end sub_80A7020

	thumb_func_start sub_80A7058
sub_80A7058: @ 80A7058
	push {lr}
	ldrh r1, [r0, 0x30]
	strh r1, [r0, 0x2E]
	ldrh r1, [r0, 0x20]
	strh r1, [r0, 0x32]
	ldrh r1, [r0, 0x22]
	adds r1, 0xF
	strh r1, [r0, 0x36]
	ldr r1, _080A7078 @ =StartAnimLinearTranslation
	str r1, [r0, 0x1C]
	ldr r1, _080A707C @ =sub_80A7080
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_080A7078: .4byte StartAnimLinearTranslation
_080A707C: .4byte sub_80A7080
	thumb_func_end sub_80A7058

	thumb_func_start sub_80A7080
sub_80A7080: @ 80A7080
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x38]
	movs r3, 0x38
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080A7096
	adds r0, r1, 0
	bl DestroyAnimSprite
	b _080A709A
_080A7096:
	subs r0, r2, 0x1
	strh r0, [r1, 0x38]
_080A709A:
	pop {r0}
	bx r0
	thumb_func_end sub_80A7080

	thumb_func_start sub_80A70A0
sub_80A70A0: @ 80A70A0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080A70CC @ =gBattlerSpriteIds
	ldr r0, _080A70D0 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl PrepareBattlerSpriteForRotScale
	ldr r1, _080A70D4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A70D8 @ =sub_80A70DC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A70CC: .4byte gBattlerSpriteIds
_080A70D0: .4byte gBattleAnimAttacker
_080A70D4: .4byte gTasks
_080A70D8: .4byte sub_80A70DC
	thumb_func_end sub_80A70A0

	thumb_func_start sub_80A70DC
sub_80A70DC: @ 80A70DC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080A710C @ =gBattlerSpriteIds
	ldr r0, _080A7110 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	adds r1, r0, r1
	ldrb r4, [r1]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080A7118
	ldr r1, _080A7114 @ =gTasks
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x8]
	negs r0, r0
	lsls r0, 16
	lsrs r3, r0, 16
	adds r6, r2, 0
	b _080A7126
	.align 2, 0
_080A710C: .4byte gBattlerSpriteIds
_080A7110: .4byte gBattleAnimAttacker
_080A7114: .4byte gTasks
_080A7118:
	ldr r2, _080A7158 @ =gTasks
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r0, 3
	adds r0, r2
	ldrh r3, [r0, 0x8]
	adds r6, r1, 0
_080A7126:
	movs r2, 0x80
	lsls r2, 1
	adds r0, r4, 0
	adds r1, r2, 0
	bl SetSpriteRotScale
	ldr r1, _080A7158 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080A7160
	ldrh r0, [r1, 0x8]
	adds r0, 0xB0
	strh r0, [r1, 0x8]
	ldr r1, _080A715C @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x26]
	adds r1, 0x1
	b _080A718A
	.align 2, 0
_080A7158: .4byte gTasks
_080A715C: .4byte gSprites
_080A7160:
	cmp r0, 0x1
	bne _080A7176
	ldrh r0, [r1, 0xE]
	adds r0, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	bne _080A71D0
	movs r0, 0x2
	b _080A71CE
_080A7176:
	ldrh r0, [r1, 0x8]
	subs r0, 0xB0
	strh r0, [r1, 0x8]
	ldr r1, _080A71C4 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x26]
	subs r1, 0x1
_080A718A:
	strh r1, [r0, 0x26]
	adds r0, r4, 0
	bl sub_80759DC
	ldr r0, _080A71C8 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	movs r3, 0x8
	ldrsh r2, [r1, r3]
	movs r0, 0xF2
	lsls r0, 4
	cmp r2, r0
	beq _080A71AA
	cmp r2, 0
	bne _080A71D0
_080A71AA:
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0x2
	bne _080A71CC
	adds r0, r4, 0
	bl ResetSpriteRotScale
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	b _080A71D0
	.align 2, 0
_080A71C4: .4byte gSprites
_080A71C8: .4byte gTasks
_080A71CC:
	adds r0, r2, 0x1
_080A71CE:
	strh r0, [r1, 0xA]
_080A71D0:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A70DC

	thumb_func_start sub_80A71D8
sub_80A71D8: @ 80A71D8
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_8074FCC
	ldr r0, _080A71FC @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A7204
	ldr r0, _080A7200 @ =gBattleAnimArgs
	ldrh r1, [r4, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r4, 0x20]
	adds r5, r0, 0
	b _080A7210
	.align 2, 0
_080A71FC: .4byte gBattleAnimAttacker
_080A7200: .4byte gBattleAnimArgs
_080A7204:
	ldr r1, _080A7244 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	adds r5, r1, 0
_080A7210:
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _080A7248 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A724C
	adds r3, r4, 0
	adds r3, 0x3F
	ldrb r0, [r3]
	movs r1, 0x1
	adds r2, r0, 0
	orrs r2, r1
	strb r2, [r3]
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080A7260
	movs r0, 0x2
	orrs r2, r0
	strb r2, [r3]
	b _080A7260
	.align 2, 0
_080A7244: .4byte gBattleAnimArgs
_080A7248: .4byte gBattleAnimAttacker
_080A724C:
	movs r2, 0x4
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080A7260
	adds r2, r4, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
_080A7260:
	ldr r0, _080A7274 @ =sub_8074F6C
	str r0, [r4, 0x1C]
	ldr r1, _080A7278 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7274: .4byte sub_8074F6C
_080A7278: .4byte DestroyAnimSprite
	thumb_func_end sub_80A71D8

	thumb_func_start sub_80A727C
sub_80A727C: @ 80A727C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_8075160
	ldr r0, _080A7298 @ =sub_8074F50
	str r0, [r4, 0x1C]
	ldr r1, _080A729C @ =sub_80A72A0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7298: .4byte sub_8074F50
_080A729C: .4byte sub_80A72A0
	thumb_func_end sub_80A727C

	thumb_func_start sub_80A72A0
sub_80A72A0: @ 80A72A0
	push {lr}
	movs r1, 0x6
	strh r1, [r0, 0x2E]
	ldrh r1, [r0, 0x20]
	strh r1, [r0, 0x32]
	ldrh r1, [r0, 0x22]
	subs r1, 0x20
	strh r1, [r0, 0x36]
	ldr r1, _080A72C0 @ =StartAnimLinearTranslation
	str r1, [r0, 0x1C]
	ldr r1, _080A72C4 @ =DestroyAnimSprite
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_080A72C0: .4byte StartAnimLinearTranslation
_080A72C4: .4byte DestroyAnimSprite
	thumb_func_end sub_80A72A0

	thumb_func_start sub_80A72C8
sub_80A72C8: @ 80A72C8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080A72EC
	ldr r1, _080A72E8 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
	b _080A730E
	.align 2, 0
_080A72E8: .4byte gBattleAnimArgs
_080A72EC:
	ldr r0, _080A73B4 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A730E
	ldr r1, _080A73B8 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
	ldrh r0, [r1, 0x6]
	negs r0, r0
	strh r0, [r1, 0x6]
_080A730E:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r4, _080A73BC @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	ldr r6, _080A73B8 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r6, 0x4]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r6, 0x6]
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	adds r7, r0, 0
	ldrh r1, [r5, 0x20]
	mov r2, r8
	lsls r0, r2, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r5, 0x22]
	lsls r1, r7, 16
	asrs r1, 16
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	bl sub_8075B30
	lsls r0, 16
	movs r1, 0xF0
	lsls r1, 24
	adds r0, r1
	lsrs r4, r0, 16
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080A7380
	ldr r2, _080A73C0 @ =0xffffa000
	adds r0, r4, r2
	lsls r0, 16
	lsrs r4, r0, 16
_080A7380:
	movs r3, 0x80
	lsls r3, 1
	str r4, [sp]
	adds r0, r5, 0
	movs r1, 0
	adds r2, r3, 0
	bl sub_8075A1C
	ldrh r0, [r6, 0x8]
	strh r0, [r5, 0x2E]
	mov r0, r8
	strh r0, [r5, 0x32]
	strh r7, [r5, 0x36]
	ldr r0, _080A73C4 @ =StartAnimLinearTranslation
	str r0, [r5, 0x1C]
	ldr r1, _080A73C8 @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A73B4: .4byte gBattleAnimAttacker
_080A73B8: .4byte gBattleAnimArgs
_080A73BC: .4byte gBattleAnimTarget
_080A73C0: .4byte 0xffffa000
_080A73C4: .4byte StartAnimLinearTranslation
_080A73C8: .4byte DestroyAnimSprite
	thumb_func_end sub_80A72C8

	thumb_func_start sub_80A73CC
sub_80A73CC: @ 80A73CC
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	subs r1, r0, 0x1
	strh r1, [r3, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bgt _080A73F6
	ldr r2, _080A73FC @ =gTasks
	movs r0, 0x3C
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0xA]
	subs r1, 0x1
	strh r1, [r0, 0xA]
	adds r0, r3, 0
	bl DestroySprite
_080A73F6:
	pop {r0}
	bx r0
	.align 2, 0
_080A73FC: .4byte gTasks
	thumb_func_end sub_80A73CC

	thumb_func_start sub_80A7400
sub_80A7400: @ 80A7400
	push {r4,lr}
	adds r2, r0, 0
	movs r0, 0x3C
	ldrsh r1, [r2, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _080A7430 @ =gTasks
	adds r4, r0, r1
	movs r3, 0x2E
	ldrsh r1, [r2, r3]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	ble _080A7434
	ldrh r0, [r2, 0x34]
	ldrh r1, [r2, 0x38]
	adds r0, r1
	strh r0, [r2, 0x38]
	ldrh r0, [r2, 0x36]
	ldrh r3, [r2, 0x3A]
	adds r0, r3
	b _080A7442
	.align 2, 0
_080A7430: .4byte gTasks
_080A7434:
	ldrh r0, [r2, 0x38]
	ldrh r1, [r2, 0x34]
	subs r0, r1
	strh r0, [r2, 0x38]
	ldrh r0, [r2, 0x3A]
	ldrh r1, [r2, 0x36]
	subs r0, r1
_080A7442:
	strh r0, [r2, 0x3A]
	ldrh r0, [r2, 0x38]
	ldrh r1, [r2, 0x30]
	adds r3, r0, r1
	strh r3, [r2, 0x30]
	ldrh r0, [r2, 0x3A]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	ldrh r1, [r4, 0x16]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A7466
	lsls r0, r3, 16
	lsrs r0, 24
	negs r0, r0
	b _080A746A
_080A7466:
	lsls r0, r3, 16
	lsrs r0, 24
_080A746A:
	strh r0, [r2, 0x24]
	ldrh r1, [r4, 0x18]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A747E
	ldrh r0, [r2, 0x32]
	lsrs r0, 8
	negs r0, r0
	b _080A7482
_080A747E:
	ldrh r0, [r2, 0x32]
	lsrs r0, 8
_080A7482:
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x2E]
	subs r1, r0, 0x1
	strh r1, [r2, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bgt _080A7498
	movs r0, 0x1E
	strh r0, [r2, 0x2E]
	ldr r0, _080A74A0 @ =sub_80A73CC
	str r0, [r2, 0x1C]
_080A7498:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A74A0: .4byte sub_80A73CC
	thumb_func_end sub_80A7400

	thumb_func_start sub_80A74A4
sub_80A74A4: @ 80A74A4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	movs r0, 0x3C
	ldrsh r1, [r7, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _080A74E8 @ =gTasks
	adds r6, r0, r1
	ldrh r2, [r6, 0x16]
	movs r1, 0x2
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	ldrh r3, [r7, 0x30]
	adds r2, r0, r3
	strh r2, [r7, 0x30]
	ldrh r0, [r6, 0x18]
	ands r1, r0
	ldrh r0, [r7, 0x32]
	adds r1, r0
	strh r1, [r7, 0x32]
	ldrh r1, [r6, 0x16]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A74EC
	lsls r0, r2, 16
	lsrs r0, 24
	negs r0, r0
	b _080A74F0
	.align 2, 0
_080A74E8: .4byte gTasks
_080A74EC:
	lsls r0, r2, 16
	lsrs r0, 24
_080A74F0:
	strh r0, [r7, 0x24]
	ldrh r1, [r6, 0x18]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A7504
	ldrh r0, [r7, 0x32]
	lsrs r0, 8
	negs r0, r0
	b _080A7508
_080A7504:
	ldrh r0, [r7, 0x32]
	lsrs r0, 8
_080A7508:
	strh r0, [r7, 0x26]
	ldrh r0, [r7, 0x2E]
	subs r1, r0, 0x1
	strh r1, [r7, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bgt _080A75D4
	movs r4, 0
	movs r0, 0x8
	strh r0, [r7, 0x2E]
	movs r0, 0x4
	strh r0, [r6, 0x12]
	movs r0, 0x80
	lsls r0, 5
	bl sub_80D8B90
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r7, 0x24]
	ldrh r1, [r7, 0x20]
	adds r2, r0, r1
	strh r2, [r7, 0x20]
	ldrh r0, [r7, 0x26]
	ldrh r3, [r7, 0x22]
	adds r0, r3
	strh r0, [r7, 0x22]
	strh r4, [r7, 0x26]
	strh r4, [r7, 0x24]
	ldrh r3, [r6, 0x1E]
	movs r0, 0x1E
	ldrsh r1, [r6, r0]
	lsls r0, r2, 16
	asrs r0, 16
	cmp r1, r0
	blt _080A7552
	subs r0, r3, r2
	b _080A7554
_080A7552:
	subs r0, r2, r3
_080A7554:
	lsls r0, 24
	lsrs r4, r0, 16
	ldrh r3, [r6, 0x20]
	movs r0, 0x20
	ldrsh r1, [r6, r0]
	ldrh r2, [r7, 0x22]
	movs r6, 0x22
	ldrsh r0, [r7, r6]
	cmp r1, r0
	blt _080A756C
	subs r0, r3, r2
	b _080A756E
_080A756C:
	subs r0, r2, r3
_080A756E:
	lsls r0, 24
	lsrs r0, 16
	mov r8, r0
	movs r0, 0
	strh r0, [r7, 0x32]
	strh r0, [r7, 0x30]
	strh r0, [r7, 0x3A]
	strh r0, [r7, 0x38]
	lsls r0, r4, 16
	asrs r0, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r5, 0
	bl sub_80D8AA0
	adds r4, r0, 0
	lsls r4, 16
	asrs r4, 16
	movs r6, 0xE0
	lsls r6, 1
	adds r0, r6, 0
	bl sub_80D8B90
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl sub_80D8AA0
	strh r0, [r7, 0x34]
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	adds r1, r5, 0
	bl sub_80D8AA0
	adds r4, r0, 0
	lsls r4, 16
	asrs r4, 16
	adds r0, r6, 0
	bl sub_80D8B90
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl sub_80D8AA0
	strh r0, [r7, 0x36]
	ldr r0, _080A75E0 @ =sub_80A7400
	str r0, [r7, 0x1C]
_080A75D4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A75E0: .4byte sub_80A7400
	thumb_func_end sub_80A74A4

	thumb_func_start sub_80A75E4
sub_80A75E4: @ 80A75E4
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080A7608 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0xA
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A7602
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080A7602:
	pop {r0}
	bx r0
	.align 2, 0
_080A7608: .4byte gTasks
	thumb_func_end sub_80A75E4

	thumb_func_start sub_80A760C
sub_80A760C: @ 80A760C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080A7660 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0x8]
	subs r1, r0, 0x1
	strh r1, [r5, 0x8]
	lsls r0, 16
	cmp r0, 0
	bgt _080A76E0
	ldr r0, _080A7664 @ =gUnknown_83E3C28
	movs r2, 0x1A
	ldrsh r1, [r5, r2]
	movs r3, 0x1C
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, 0xC]
	ldrb r4, [r5, 0xA]
	subs r3, r4
	lsls r3, 24
	lsrs r3, 24
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r0, 4
	add r0, r12
	lsls r0, 2
	ldr r1, _080A7668 @ =gSprites
	adds r6, r0, r1
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080A766C
	cmp r0, 0x2
	beq _080A7682
	b _080A7690
	.align 2, 0
_080A7660: .4byte gTasks
_080A7664: .4byte gUnknown_83E3C28
_080A7668: .4byte gSprites
_080A766C:
	ldrb r2, [r6, 0x3]
	lsls r1, r2, 26
	lsrs r1, 27
	movs r0, 0x18
	orrs r1, r0
	lsls r1, 1
	subs r0, 0x57
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, 0x3]
	b _080A7690
_080A7682:
	ldrb r0, [r6, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	orrs r1, r0
	strb r1, [r6, 0x3]
_080A7690:
	ldr r3, _080A76E8 @ =gTasks
	lsls r2, r7, 2
	adds r2, r7
	lsls r2, 3
	adds r4, r2, r3
	ldrh r0, [r4, 0x12]
	ldrh r1, [r4, 0x14]
	subs r0, r1
	strh r0, [r6, 0x2E]
	strh r7, [r6, 0x3C]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	adds r0, 0xD
	lsls r0, 1
	adds r0, r2
	adds r3, 0x8
	adds r0, r3
	mov r2, r12
	strh r2, [r0]
	ldrh r0, [r4, 0xE]
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	movs r0, 0x3F
	negs r0, r0
	bl BattleAnimAdjustPanning
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x93
	bl PlaySE12WithPanning
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	cmp r0, 0x2
	ble _080A76E0
	ldr r0, _080A76EC @ =sub_80A75E4
	str r0, [r4]
_080A76E0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A76E8: .4byte gTasks
_080A76EC: .4byte sub_80A75E4
	thumb_func_end sub_80A760C

	thumb_func_start sub_80A76F0
sub_80A76F0: @ 80A76F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0
	mov r9, r0
	movs r5, 0
	mov r0, sp
	mov r1, r9
	strh r1, [r0]
	mov r4, sp
	adds r4, 0x2
	strh r1, [r4]
	bl IsContest
	lsls r0, 24
	mov r10, r4
	cmp r0, 0
	beq _080A775C
	ldr r1, _080A774C @ =gTasks
	lsls r2, r7, 2
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0x2
	strh r1, [r0, 0x10]
	ldr r3, _080A7750 @ =gBattleAnimArgs
	ldrh r0, [r3]
	negs r0, r0
	strh r0, [r3]
	ldrh r1, [r3, 0x4]
	movs r0, 0x1
	ands r0, r1
	mov r8, r2
	cmp r0, 0
	beq _080A7754
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strh r0, [r3, 0x4]
	b _080A77B6
	.align 2, 0
_080A774C: .4byte gTasks
_080A7750: .4byte gBattleAnimArgs
_080A7754:
	movs r0, 0x1
	orrs r0, r1
	strh r0, [r3, 0x4]
	b _080A77B6
_080A775C:
	ldr r1, _080A77A0 @ =gBattlerPositions
	ldr r0, _080A77A4 @ =gBattleAnimTarget
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	lsls r2, r7, 2
	mov r8, r2
	cmp r0, 0
	bne _080A77B6
	ldr r1, _080A77A8 @ =gTasks
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	strh r3, [r0, 0x10]
	ldr r2, _080A77AC @ =gBattleAnimArgs
	ldrh r0, [r2]
	negs r0, r0
	strh r0, [r2]
	ldrh r0, [r2, 0x2]
	negs r0, r0
	strh r0, [r2, 0x2]
	ldrh r1, [r2, 0x4]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080A77B0
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	b _080A77B4
	.align 2, 0
_080A77A0: .4byte gBattlerPositions
_080A77A4: .4byte gBattleAnimTarget
_080A77A8: .4byte gTasks
_080A77AC: .4byte gBattleAnimArgs
_080A77B0:
	movs r0, 0x1
	orrs r0, r1
_080A77B4:
	strh r0, [r2, 0x4]
_080A77B6:
	ldr r5, _080A7810 @ =gBattleAnimAttacker
	ldrb r0, [r5]
	movs r1, 0
	bl GetBattlerSpriteCoord
	ldr r1, _080A7814 @ =gTasks
	mov r3, r8
	adds r4, r3, r7
	lsls r4, 3
	adds r4, r1
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1A]
	adds r6, r0, 0
	ldrb r0, [r5]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1C]
	mov r9, r0
	ldr r0, _080A7818 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A7820
	ldr r4, _080A781C @ =gBattleAnimTarget
	ldrb r1, [r4]
	movs r0, 0x2
	eors r0, r1
	bl IsBattlerSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080A7820
	ldrb r0, [r4]
	movs r1, 0
	mov r2, sp
	mov r3, r10
	bl sub_8076D9C
	b _080A7842
	.align 2, 0
_080A7810: .4byte gBattleAnimAttacker
_080A7814: .4byte gTasks
_080A7818: .4byte gBattleTypeFlags
_080A781C: .4byte gBattleAnimTarget
_080A7820:
	mov r5, sp
	ldr r4, _080A787C @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	ldrb r0, [r4]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	mov r1, r10
	strh r0, [r1]
_080A7842:
	mov r4, sp
	ldr r0, _080A7880 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	mov r2, sp
	ldr r3, _080A7884 @ =gBattleAnimArgs
	ldrh r0, [r3]
	ldrh r2, [r2]
	adds r0, r2
	strh r0, [r1, 0x1E]
	strh r0, [r4]
	ldrh r0, [r3, 0x2]
	mov r3, r10
	ldrh r3, [r3]
	adds r0, r3
	strh r0, [r1, 0x20]
	mov r1, r10
	strh r0, [r1]
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r0, [r0, r3]
	adds r1, r6, 0
	cmp r0, r1
	blt _080A7888
	subs r0, r2, r1
	b _080A788A
	.align 2, 0
_080A787C: .4byte gBattleAnimTarget
_080A7880: .4byte gTasks
_080A7884: .4byte gBattleAnimArgs
_080A7888:
	subs r0, r1, r2
_080A788A:
	lsls r0, 16
	lsrs r0, 16
	lsls r4, r0, 16
	asrs r4, 16
	ldr r5, _080A7900 @ =gBattleAnimArgs
	ldrh r1, [r5, 0x4]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	lsls r0, 16
	asrs r0, 16
	bl sub_80D8B90
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl sub_80D8AA0
	ldr r2, _080A7904 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r6, r1, r2
	strh r0, [r6, 0x12]
	movs r1, 0x12
	ldrsh r0, [r6, r1]
	movs r1, 0x80
	bl sub_80D8AA0
	strh r0, [r6, 0x14]
	ldrh r0, [r5, 0x4]
	strh r0, [r6, 0x16]
	mov r2, r10
	ldrh r1, [r2]
	movs r3, 0
	ldrsh r0, [r2, r3]
	mov r4, r9
	cmp r0, r4
	blt _080A7908
	subs r4, r1, r4
	lsls r4, 16
	asrs r4, 16
	movs r1, 0x12
	ldrsh r0, [r6, r1]
	bl sub_80D8B90
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl sub_80D8AA0
	movs r1, 0x2
	negs r1, r1
	ands r1, r0
	strh r1, [r6, 0x18]
	b _080A7928
	.align 2, 0
_080A7900: .4byte gBattleAnimArgs
_080A7904: .4byte gTasks
_080A7908:
	subs r4, r1
	lsls r4, 16
	asrs r4, 16
	movs r2, 0x12
	ldrsh r0, [r6, r2]
	bl sub_80D8B90
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl sub_80D8AA0
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r6, 0x18]
_080A7928:
	ldr r1, _080A7968 @ =gTasks
	mov r3, r8
	adds r0, r3, r7
	lsls r0, 3
	adds r5, r0, r1
	ldr r4, _080A796C @ =gBattleAnimArgs
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0xE]
	ldrh r1, [r4, 0x8]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080A7978
	movs r0, 0x80
	eors r0, r1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3F
	ble _080A79A0
	ldr r0, _080A7970 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSpriteSubpriority
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A7974 @ =0x0000ffc0
	adds r1, r2, 0
	ldrh r4, [r4, 0x8]
	adds r1, r4
	adds r0, r1
	b _080A79B0
	.align 2, 0
_080A7968: .4byte gTasks
_080A796C: .4byte gBattleAnimArgs
_080A7970: .4byte gBattleAnimTarget
_080A7974: .4byte 0x0000ffc0
_080A7978:
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x3F
	ble _080A79A0
	ldr r0, _080A7998 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSpriteSubpriority
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080A799C @ =0x0000ffc0
	adds r1, r3, 0
	ldrh r4, [r4, 0x8]
	adds r1, r4
	adds r0, r1
	b _080A79B0
	.align 2, 0
_080A7998: .4byte gBattleAnimTarget
_080A799C: .4byte 0x0000ffc0
_080A79A0:
	ldr r0, _080A79DC @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSpriteSubpriority
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x8]
	subs r0, r1
_080A79B0:
	strh r0, [r5, 0xC]
	ldr r0, _080A79E0 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0x2
	bgt _080A79C8
	movs r0, 0x3
	strh r0, [r1, 0xC]
_080A79C8:
	ldr r0, _080A79E4 @ =sub_80A760C
	str r0, [r1]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A79DC: .4byte gBattleAnimTarget
_080A79E0: .4byte gTasks
_080A79E4: .4byte sub_80A760C
	thumb_func_end sub_80A76F0

	thumb_func_start sub_80A79E8
sub_80A79E8: @ 80A79E8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_8075160
	ldr r0, _080A7A10 @ =gUnknown_83E3D18
	ldrh r0, [r0, 0x2]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	strh r0, [r4, 0x2E]
	ldr r0, _080A7A14 @ =sub_80A7A18
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7A10: .4byte gUnknown_83E3D18
_080A7A14: .4byte sub_80A7A18
	thumb_func_end sub_80A79E8

	thumb_func_start sub_80A7A18
sub_80A7A18: @ 80A7A18
	push {r4-r7,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080A7A7C
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r5, [r4, 0x2E]
	ldr r1, _080A7A84 @ =gPlttBufferFaded
	adds r0, r5, 0
	adds r0, 0x8
	lsls r0, 1
	adds r0, r1
	ldrh r7, [r0]
	adds r6, r1, 0
	adds r1, r5, 0
	adds r1, 0x9
	lsls r0, r5, 1
	adds r0, r6
	adds r2, r0, 0
	adds r2, 0x10
	movs r3, 0x7
	lsls r1, 1
	adds r1, r6
_080A7A50:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, 0x2
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080A7A50
	adds r0, r5, 0
	adds r0, 0xF
	lsls r0, 1
	adds r0, r6
	strh r7, [r0]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x18
	bne _080A7A7C
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A7A7C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A7A84: .4byte gPlttBufferFaded
	thumb_func_end sub_80A7A18

	thumb_func_start sub_80A7A88
sub_80A7A88: @ 80A7A88
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r4, _080A7B28 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	ldr r4, _080A7B2C @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4, 0x6]
	adds r0, r1
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, _080A7B30 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A7ACC
	ldrh r0, [r4, 0x4]
	negs r0, r0
	strh r0, [r4, 0x4]
_080A7ACC:
	lsls r0, r6, 16
	asrs r0, 16
	ldrh r1, [r4, 0x4]
	adds r0, r1
	lsls r0, 16
	ldrh r1, [r5, 0x20]
	lsrs r6, r0, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r5, 0x22]
	lsls r1, r7, 16
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
	adds r0, r5, 0
	movs r1, 0
	adds r2, r3, 0
	bl sub_8075A1C
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x2E]
	strh r6, [r5, 0x32]
	strh r7, [r5, 0x36]
	ldr r0, _080A7B34 @ =sub_80756A4
	str r0, [r5, 0x1C]
	ldr r1, _080A7B38 @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A7B28: .4byte gBattleAnimTarget
_080A7B2C: .4byte gBattleAnimArgs
_080A7B30: .4byte gBattleAnimAttacker
_080A7B34: .4byte sub_80756A4
_080A7B38: .4byte DestroyAnimSprite
	thumb_func_end sub_80A7A88

	thumb_func_start sub_80A7B3C
sub_80A7B3C: @ 80A7B3C
	ldr r1, _080A7B4C @ =0x0000fff0
	strh r1, [r0, 0x32]
	ldrh r1, [r0, 0x22]
	adds r1, 0x8
	strh r1, [r0, 0x22]
	ldr r1, _080A7B50 @ =sub_80A7B54
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080A7B4C: .4byte 0x0000fff0
_080A7B50: .4byte sub_80A7B54
	thumb_func_end sub_80A7B3C

	thumb_func_start sub_80A7B54
sub_80A7B54: @ 80A7B54
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x80
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	ldr r0, _080A7BC0 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080A7B78
	ldrh r0, [r4, 0x24]
	negs r0, r0
	strh r0, [r4, 0x24]
_080A7B78:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x5
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7E
	ble _080A7BB8
	movs r0, 0
	strh r0, [r4, 0x30]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080A7BB8
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A7BB8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7BC0: .4byte gBattleAnimAttacker
	thumb_func_end sub_80A7B54

	thumb_func_start sub_80A7BC4
sub_80A7BC4: @ 80A7BC4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	ldr r5, _080A7C10 @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	ldr r0, _080A7C14 @ =StartAnimLinearTranslation
	str r0, [r4, 0x1C]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080A7C18 @ =sub_80A7C1C
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C10: .4byte gBattleAnimTarget
_080A7C14: .4byte StartAnimLinearTranslation
_080A7C18: .4byte sub_80A7C1C
	thumb_func_end sub_80A7BC4

	thumb_func_start sub_80A7C1C
sub_80A7C1C: @ 80A7C1C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x3F
	bl BattleAnimAdjustPanning
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x9F
	bl PlaySE12WithPanning
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x26]
	strh r1, [r4, 0x24]
	movs r2, 0
	movs r1, 0x7
	adds r0, r4, 0
	adds r0, 0x3C
_080A7C50:
	strh r2, [r0]
	subs r0, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _080A7C50
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x7
	ands r0, r1
	ldr r2, _080A7C98 @ =0x0000fff4
	adds r1, r2, 0
	subs r1, r0
	strh r1, [r4, 0x3A]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA0
	bl __umodsi3
	adds r0, 0xA0
	strh r0, [r4, 0x3C]
	ldr r0, _080A7C9C @ =sub_80A7CA0
	str r0, [r4, 0x1C]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C98: .4byte 0x0000fff4
_080A7C9C: .4byte sub_80A7CA0
	thumb_func_end sub_80A7C1C

	thumb_func_start sub_80A7CA0
sub_80A7CA0: @ 80A7CA0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x3C]
	ldrh r2, [r4, 0x2E]
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r2, r0, 24
	strh r2, [r4, 0x24]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A7CBE
	negs r0, r2
	strh r0, [r4, 0x24]
_080A7CBE:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x3A
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x8
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7E
	ble _080A7CFE
	movs r0, 0
	strh r0, [r4, 0x30]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080A7CFE
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A7CFE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7CA0

	thumb_func_start sub_80A7D04
sub_80A7D04: @ 80A7D04
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_8075160
	ldr r0, _080A7D54 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080A7D22
	ldrh r0, [r4, 0x22]
	adds r0, 0x10
	strh r0, [r4, 0x22]
_080A7D22:
	ldr r1, _080A7D58 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x32]
	ldrh r0, [r1, 0xC]
	strh r0, [r4, 0x34]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x36]
	ldr r0, _080A7D5C @ =sub_8074A80
	str r0, [r4, 0x1C]
	ldr r1, _080A7D60 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7D54: .4byte gBattleAnimAttacker
_080A7D58: .4byte gBattleAnimArgs
_080A7D5C: .4byte sub_8074A80
_080A7D60: .4byte DestroyAnimSprite
	thumb_func_end sub_80A7D04

	thumb_func_start sub_80A7D64
sub_80A7D64: @ 80A7D64
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	movs r7, 0x20
	ldr r4, _080A7DE0 @ =0x0000ffe0
	movs r0, 0x10
	mov r8, r0
	ldr r6, _080A7DE4 @ =0x0000fff0
	ldr r0, _080A7DE8 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080A7D90
	adds r7, r4, 0
	movs r4, 0x20
	mov r8, r6
	movs r6, 0x10
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080A7D90:
	lsls r0, r7, 16
	asrs r0, 16
	ldrh r1, [r5, 0x20]
	adds r0, r1
	strh r0, [r5, 0x20]
	lsls r0, r4, 16
	asrs r0, 16
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	movs r0, 0x6
	strh r0, [r5, 0x2E]
	ldr r4, _080A7DEC @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	add r0, r8
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	adds r0, r6
	strh r0, [r5, 0x36]
	ldr r0, _080A7DF0 @ =StartAnimLinearTranslation
	str r0, [r5, 0x1C]
	ldr r1, _080A7DF4 @ =sub_80A7DF8
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A7DE0: .4byte 0x0000ffe0
_080A7DE4: .4byte 0x0000fff0
_080A7DE8: .4byte gBattleAnimArgs
_080A7DEC: .4byte gBattleAnimTarget
_080A7DF0: .4byte StartAnimLinearTranslation
_080A7DF4: .4byte sub_80A7DF8
	thumb_func_end sub_80A7D64

	thumb_func_start sub_80A7DF8
sub_80A7DF8: @ 80A7DF8
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080A7E0E
	adds r0, r2, 0
	bl DestroyAnimSprite
_080A7E0E:
	pop {r0}
	bx r0
	thumb_func_end sub_80A7DF8

	thumb_func_start sub_80A7E14
sub_80A7E14: @ 80A7E14
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	movs r0, 0x20
	mov r8, r0
	ldr r4, _080A7EA8 @ =0x0000ffe0
	movs r2, 0x10
	mov r9, r2
	ldr r6, _080A7EAC @ =0x0000fff0
	ldr r7, _080A7EB0 @ =gBattleAnimArgs
	ldrh r1, [r7]
	movs r2, 0
	ldrsh r0, [r7, r2]
	cmp r0, 0
	beq _080A7E48
	mov r8, r4
	movs r4, 0x20
	mov r9, r6
	movs r6, 0x10
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
_080A7E48:
	mov r0, r8
	lsls r1, r0, 16
	asrs r1, 16
	ldrh r2, [r5, 0x20]
	adds r1, r2
	strh r1, [r5, 0x20]
	lsls r0, r4, 16
	asrs r0, 16
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	movs r0, 0x6
	strh r0, [r5, 0x2E]
	strh r1, [r5, 0x30]
	ldr r4, _080A7EB4 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	add r0, r9
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	adds r0, r6
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldrh r0, [r7]
	strh r0, [r5, 0x38]
	ldrh r0, [r5, 0x2E]
	strh r0, [r5, 0x3A]
	ldr r0, _080A7EB8 @ =sub_80A7EBC
	str r0, [r5, 0x1C]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A7EA8: .4byte 0x0000ffe0
_080A7EAC: .4byte 0x0000fff0
_080A7EB0: .4byte gBattleAnimArgs
_080A7EB4: .4byte gBattleAnimTarget
_080A7EB8: .4byte sub_80A7EBC
	thumb_func_end sub_80A7E14

	thumb_func_start sub_80A7EBC
sub_80A7EBC: @ 80A7EBC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	beq _080A7F20
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080A7F20
	adds r0, r4, 0
	movs r1, 0
	bl SeekSpriteAnim
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	movs r2, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	movs r0, 0x2
	strh r0, [r4, 0x24]
	ldr r0, _080A7F28 @ =0x0000fffe
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	eors r0, r1
	strh r0, [r4, 0x32]
	strh r2, [r4, 0x36]
	strh r2, [r4, 0x34]
	ldr r0, _080A7F2C @ =sub_80A7F30
	str r0, [r4, 0x1C]
_080A7F20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7F28: .4byte 0x0000fffe
_080A7F2C: .4byte sub_80A7F30
	thumb_func_end sub_80A7EBC

	thumb_func_start sub_80A7F30
sub_80A7F30: @ 80A7F30
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080A7F48
	ldrh r0, [r4, 0x24]
	negs r0, r0
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x26]
	negs r0, r0
	strh r0, [r4, 0x26]
_080A7F48:
	ldrh r0, [r4, 0x34]
	movs r1, 0x1
	eors r0, r1
	movs r1, 0
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _080A7F8A
	strh r1, [r4, 0x26]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x36]
	strh r1, [r4, 0x34]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x38]
	movs r1, 0x1
	eors r1, r0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _080A7F90 @ =sub_80A7F94
	str r0, [r4, 0x1C]
_080A7F8A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7F90: .4byte sub_80A7F94
	thumb_func_end sub_80A7F30

	thumb_func_start sub_80A7F94
sub_80A7F94: @ 80A7F94
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	beq _080A7FA8
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A7FA8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7F94

	thumb_func_start sub_80A7FB0
sub_80A7FB0: @ 80A7FB0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x1
	bl GetAnimBattlerSpriteId
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl PrepareBattlerSpriteForRotScale
	adds r0, r4, 0
	movs r1, 0xD0
	movs r2, 0xD0
	movs r3, 0
	bl SetSpriteRotScale
	ldr r1, _080A8008 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	movs r1, 0
	bl sub_8075B48
	ldr r1, _080A800C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x50
	strh r1, [r0, 0x8]
	ldr r1, _080A8010 @ =sub_80A8014
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8008: .4byte gSprites
_080A800C: .4byte gTasks
_080A8010: .4byte sub_80A8014
	thumb_func_end sub_80A7FB0

	thumb_func_start sub_80A8014
sub_80A8014: @ 80A8014
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080A806C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	subs r1, 0x1
	strh r1, [r0, 0x8]
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080A8064
	movs r0, 0x1
	bl GetAnimBattlerSpriteId
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl ResetSpriteRotScale
	ldr r1, _080A8070 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	movs r1, 0x1
	bl sub_8075B48
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080A8064:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A806C: .4byte gTasks
_080A8070: .4byte gSprites
	thumb_func_end sub_80A8014

	thumb_func_start sub_80A8074
sub_80A8074: @ 80A8074
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080A80C0 @ =gTasks
	adds r4, r0
	movs r0, 0
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0x8]
	movs r1, 0
	bl PrepareBattlerSpriteForRotScale
	strh r5, [r4, 0xA]
	strh r5, [r4, 0xC]
	strh r5, [r4, 0xE]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0x10]
	strh r5, [r4, 0x12]
	strh r5, [r4, 0x14]
	ldr r0, _080A80C4 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSpriteSubpriority
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x16]
	ldr r0, _080A80C8 @ =sub_80A80CC
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A80C0: .4byte gTasks
_080A80C4: .4byte gBattleAnimAttacker
_080A80C8: .4byte sub_80A80CC
	thumb_func_end sub_80A8074

	thumb_func_start sub_80A80CC
sub_80A80CC: @ 80A80CC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080A80F0 @ =gTasks
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bls _080A80E6
	b _080A81F6
_080A80E6:
	lsls r0, 2
	ldr r1, _080A80F4 @ =_080A80F8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A80F0: .4byte gTasks
_080A80F4: .4byte _080A80F8
	.align 2, 0
_080A80F8:
	.4byte _080A8110
	.4byte _080A8158
	.4byte _080A818E
	.4byte _080A8194
	.4byte _080A81A4
	.4byte _080A81D8
_080A8110:
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080A8120
	cmp r0, 0x3
	beq _080A8120
	cmp r0, 0x6
	bne _080A8128
_080A8120:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80A8200
_080A8128:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x10]
	adds r0, 0x28
	strh r0, [r4, 0x10]
	ldrb r0, [r4, 0x8]
	movs r1, 0x10
	ldrsh r2, [r4, r1]
	adds r1, r2, 0
	movs r3, 0
	bl SetSpriteRotScale
	ldrb r0, [r4, 0x8]
	bl sub_8076440
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0x20
	bne _080A81F6
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	b _080A81D0
_080A8158:
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080A81F6
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	cmp r1, 0x3
	bne _080A816E
	strh r0, [r4, 0xC]
	strh r1, [r4, 0xA]
	b _080A81F6
_080A816E:
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xE]
	movs r2, 0x80
	lsls r2, 1
	strh r2, [r4, 0x10]
	ldrb r0, [r4, 0x8]
	adds r1, r2, 0
	movs r3, 0
	bl SetSpriteRotScale
	ldrb r0, [r4, 0x8]
	bl sub_8076440
	movs r0, 0x2
	strh r0, [r4, 0xA]
	b _080A81F6
_080A818E:
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080A81F6
_080A8194:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x20
	ble _080A81F6
	b _080A81CC
_080A81A4:
	ldrh r0, [r4, 0xC]
	adds r0, 0x2
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x10]
	subs r0, 0x50
	strh r0, [r4, 0x10]
	ldrb r0, [r4, 0x8]
	movs r1, 0x10
	ldrsh r2, [r4, r1]
	adds r1, r2, 0
	movs r3, 0
	bl SetSpriteRotScale
	ldrb r0, [r4, 0x8]
	bl sub_8076440
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0x20
	bne _080A81F6
_080A81CC:
	movs r0, 0
	strh r0, [r4, 0xC]
_080A81D0:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _080A81F6
_080A81D8:
	ldrb r0, [r4, 0x8]
	bl ResetSpriteRotScale
	ldr r2, _080A81FC @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x26]
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080A81F6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A81FC: .4byte gSprites
	thumb_func_end sub_80A80CC

	thumb_func_start sub_80A8200
sub_80A8200: @ 80A8200
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	movs r0, 0
	bl CloneBattlerSpriteWithBlend
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r0, 16
	asrs r4, r0, 16
	cmp r4, 0
	blt _080A82DA
	bl AllocOamMatrix
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xFF
	bne _080A8244
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _080A8240 @ =gSprites
	adds r0, r1
	bl obj_delete_but_dont_free_vram
	b _080A82DA
	.align 2, 0
_080A8240: .4byte gSprites
_080A8244:
	ldr r5, _080A82E8 @ =gSprites
	lsls r3, r4, 4
	adds r3, r4
	lsls r3, 2
	adds r4, r3, r5
	ldrb r1, [r4, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1F
	ands r6, r0
	lsls r2, r6, 1
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x3]
	ldrb r0, [r7, 0x16]
	ldrb r1, [r7, 0xE]
	subs r0, r1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrh r0, [r7, 0xE]
	adds r0, 0x1
	strh r0, [r7, 0xE]
	ldrh r0, [r7, 0x14]
	adds r0, 0x1
	strh r0, [r7, 0x14]
	movs r0, 0x10
	strh r0, [r4, 0x2E]
	mov r0, r9
	strh r0, [r4, 0x30]
	movs r0, 0x6
	strh r0, [r4, 0x32]
	adds r5, 0x1C
	adds r3, r5
	ldr r0, _080A82EC @ =sub_80A82F0
	str r0, [r3]
	mov r1, r8
	lsls r0, r1, 24
	lsrs r0, 24
	movs r1, 0x10
	ldrsh r2, [r7, r1]
	adds r1, r2, 0
	movs r3, 0
	bl SetSpriteRotScale
	ldrb r0, [r4, 0x1]
	movs r3, 0x4
	negs r3, r3
	ands r3, r0
	movs r0, 0x1
	orrs r3, r0
	strb r3, [r4, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r4, 0
	bl CalcCenterToCornerVec
_080A82DA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A82E8: .4byte gSprites
_080A82EC: .4byte sub_80A82F0
	thumb_func_end sub_80A8200

	thumb_func_start sub_80A82F0
sub_80A82F0: @ 80A82F0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _080A832E
	ldr r3, _080A8334 @ =gTasks
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x30
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
	bl obj_delete_but_dont_free_vram
_080A832E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8334: .4byte gTasks
	thumb_func_end sub_80A82F0

	thumb_func_start sub_80A8338
sub_80A8338: @ 80A8338
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080A835C @ =gTasks
	adds r4, r0, r1
	ldr r5, _080A8360 @ =gBattleAnimArgs
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080A8364
	adds r0, r2, 0
	bl DestroyAnimVisualTask
	b _080A838A
	.align 2, 0
_080A835C: .4byte gTasks
_080A8360: .4byte gBattleAnimArgs
_080A8364:
	ldrb r0, [r5]
	bl GetAnimBattlerSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	strh r1, [r4, 0x8]
	strh r2, [r4, 0xA]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0xC]
	strh r2, [r4, 0xE]
	strh r2, [r4, 0x10]
	ldr r2, _080A8390 @ =gUnknown_83E3E60
	adds r0, r4, 0
	bl sub_80762D0
	ldr r0, _080A8394 @ =sub_80A8398
	str r0, [r4]
_080A838A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8390: .4byte gUnknown_83E3E60
_080A8394: .4byte sub_80A8398
	thumb_func_end sub_80A8338

	thumb_func_start sub_80A8398
sub_80A8398: @ 80A8398
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080A83BC @ =gTasks
	adds r4, r0, r1
	movs r0, 0xA
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _080A8400
	cmp r5, 0x1
	bgt _080A83C0
	cmp r5, 0
	beq _080A83CA
	b _080A84A8
	.align 2, 0
_080A83BC: .4byte gTasks
_080A83C0:
	cmp r5, 0x2
	beq _080A8434
	cmp r5, 0x3
	beq _080A8464
	b _080A84A8
_080A83CA:
	adds r0, r4, 0
	bl sub_8076308
	ldrh r2, [r4, 0x10]
	adds r2, 0x3
	strh r2, [r4, 0x10]
	ldr r3, _080A83FC @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x26]
	adds r1, r2
	strh r1, [r0, 0x26]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080A84A8
	strh r5, [r4, 0xE]
	b _080A845C
	.align 2, 0
_080A83FC: .4byte gSprites
_080A8400:
	adds r0, r4, 0
	bl sub_8076308
	ldr r2, _080A8430 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x10]
	ldrh r2, [r0, 0x26]
	adds r1, r2
	strh r1, [r0, 0x26]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080A84A8
	movs r0, 0
	strh r0, [r4, 0xE]
	b _080A845C
	.align 2, 0
_080A8430: .4byte gSprites
_080A8434:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080A845C
	ldr r2, _080A8458 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x2
	strh r1, [r0, 0x26]
	ldrh r0, [r4, 0x10]
	subs r0, 0x2
	strh r0, [r4, 0x10]
	b _080A84A8
	.align 2, 0
_080A8458: .4byte gSprites
_080A845C:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _080A84A8
_080A8464:
	adds r0, r4, 0
	bl sub_8076308
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080A84A8
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _080A849C
	ldr r2, _080A8498 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x26]
	adds r0, r6, 0
	bl DestroyAnimVisualTask
	b _080A84A8
	.align 2, 0
_080A8498: .4byte gSprites
_080A849C:
	ldrb r1, [r4, 0x8]
	ldr r2, _080A84B0 @ =gUnknown_83E3E60
	adds r0, r4, 0
	bl sub_80762D0
	strh r5, [r4, 0xA]
_080A84A8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A84B0: .4byte gUnknown_83E3E60
	thumb_func_end sub_80A8398

	thumb_func_start sub_80A84B4
sub_80A84B4: @ 80A84B4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080A84E4 @ =gTasks
	adds r4, r0
	movs r0, 0
	bl GetAnimBattlerSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080A84E8 @ =gUnknown_83E3E80
	adds r0, r4, 0
	bl sub_80762D0
	ldr r0, _080A84EC @ =sub_80A84F0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A84E4: .4byte gTasks
_080A84E8: .4byte gUnknown_83E3E80
_080A84EC: .4byte sub_80A84F0
	thumb_func_end sub_80A84B4

	thumb_func_start sub_80A84F0
sub_80A84F0: @ 80A84F0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080A8518 @ =gTasks
	adds r0, r1
	bl sub_8076308
	lsls r0, 24
	cmp r0, 0
	bne _080A8510
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080A8510:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8518: .4byte gTasks
	thumb_func_end sub_80A84F0

	thumb_func_start sub_80A851C
sub_80A851C: @ 80A851C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080A854C @ =gBattleAnimAttacker
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080A8550
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
	ldrb r0, [r5]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x20
	strh r0, [r4, 0x20]
	movs r0, 0x40
	b _080A856A
	.align 2, 0
_080A854C: .4byte gBattleAnimAttacker
_080A8550:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldrb r0, [r5]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x20
	strh r0, [r4, 0x20]
	ldr r0, _080A859C @ =0x0000ffc0
_080A856A:
	strh r0, [r4, 0x30]
	ldr r0, _080A85A0 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	strh r0, [r4, 0x22]
	movs r0, 0x34
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x32]
	strh r1, [r4, 0x34]
	strh r1, [r4, 0x36]
	ldr r1, _080A85A4 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080A85A8 @ =sub_8074D00
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A859C: .4byte 0x0000ffc0
_080A85A0: .4byte gBattleAnimAttacker
_080A85A4: .4byte DestroyAnimSprite
_080A85A8: .4byte sub_8074D00
	thumb_func_end sub_80A851C

	thumb_func_start sub_80A85AC
sub_80A85AC: @ 80A85AC
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _080A85C0 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A85C8
	ldr r0, _080A85C4 @ =gBattleAnimAttacker
	b _080A85CA
	.align 2, 0
_080A85C0: .4byte gBattleAnimArgs
_080A85C4: .4byte gBattleAnimAttacker
_080A85C8:
	ldr r0, _080A8628 @ =gBattleAnimTarget
_080A85CA:
	ldrb r5, [r0]
	adds r0, r5, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A85E4
	ldr r1, _080A862C @ =gBattleAnimArgs
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080A85E4:
	adds r0, r5, 0
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	ldr r4, _080A862C @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r6, 0x20]
	adds r0, r5, 0
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x4]
	adds r0, r4
	strh r0, [r6, 0x22]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	bgt _080A8616
	movs r0, 0x8
	strh r0, [r6, 0x22]
_080A8616:
	ldr r1, _080A8630 @ =move_anim_8074EE0
	adds r0, r6, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080A8634 @ =sub_8074F50
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A8628: .4byte gBattleAnimTarget
_080A862C: .4byte gBattleAnimArgs
_080A8630: .4byte move_anim_8074EE0
_080A8634: .4byte sub_8074F50
	thumb_func_end sub_80A85AC

	thumb_func_start sub_80A8638
sub_80A8638: @ 80A8638
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080A866C @ =gTasks
	adds r4, r0
	movs r0, 0
	bl GetAnimBattlerSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	strh r1, [r4, 0x8]
	strh r0, [r4, 0xA]
	ldr r2, _080A8670 @ =gUnknown_83E3F1C
	adds r0, r4, 0
	bl sub_80762D0
	ldr r0, _080A8674 @ =sub_80A8678
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A866C: .4byte gTasks
_080A8670: .4byte gUnknown_83E3F1C
_080A8674: .4byte sub_80A8678
	thumb_func_end sub_80A8638

	thumb_func_start sub_80A8678
sub_80A8678: @ 80A8678
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080A86A0 @ =gTasks
	adds r0, r1
	bl sub_8076308
	lsls r0, 24
	cmp r0, 0
	bne _080A8698
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080A8698:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A86A0: .4byte gTasks
	thumb_func_end sub_80A8678

	thumb_func_start sub_80A86A4
sub_80A86A4: @ 80A86A4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080A8718 @ =gTasks
	adds r4, r1, r0
	movs r0, 0
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	strh r0, [r4, 0x8]
	strh r2, [r4, 0xA]
	movs r0, 0x4
	strh r0, [r4, 0xC]
	movs r0, 0x7
	strh r0, [r4, 0xE]
	movs r0, 0x3
	strh r0, [r4, 0x10]
	ldr r3, _080A871C @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x20]
	strh r0, [r4, 0x12]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x22]
	strh r0, [r4, 0x14]
	strh r2, [r4, 0x16]
	strh r2, [r4, 0x18]
	movs r0, 0x2
	strh r0, [r4, 0x1A]
	ldr r0, _080A8720 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A870E
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4, 0xC]
_080A870E:
	ldr r0, _080A8724 @ =sub_80A8728
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8718: .4byte gTasks
_080A871C: .4byte gSprites
_080A8720: .4byte gBattleAnimAttacker
_080A8724: .4byte sub_80A8728
	thumb_func_end sub_80A86A4

	thumb_func_start sub_80A8728
sub_80A8728: @ 80A8728
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080A8770 @ =gTasks
	adds r3, r0, r1
	ldrh r0, [r3, 0x16]
	adds r0, 0x1
	strh r0, [r3, 0x16]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080A878E
	movs r0, 0
	strh r0, [r3, 0x16]
	ldrh r0, [r3, 0x18]
	adds r0, 0x1
	strh r0, [r3, 0x18]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A8778
	ldr r2, _080A8774 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x1A]
	ldrh r2, [r0, 0x22]
	adds r1, r2
	b _080A878C
	.align 2, 0
_080A8770: .4byte gTasks
_080A8774: .4byte gSprites
_080A8778:
	ldr r2, _080A87A0 @ =gSprites
	movs r5, 0x8
	ldrsh r1, [r3, r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	ldrh r2, [r3, 0x1A]
	subs r1, r2
_080A878C:
	strh r1, [r0, 0x22]
_080A878E:
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	beq _080A87DC
	cmp r0, 0x1
	bgt _080A87A4
	cmp r0, 0
	beq _080A87AA
	b _080A886C
	.align 2, 0
_080A87A0: .4byte gSprites
_080A87A4:
	cmp r0, 0x2
	beq _080A880C
	b _080A886C
_080A87AA:
	ldr r2, _080A87D8 @ =gSprites
	movs r5, 0x8
	ldrsh r1, [r3, r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0xC]
	ldrh r2, [r0, 0x20]
	adds r1, r2
	strh r1, [r0, 0x20]
	ldrh r0, [r3, 0xE]
	subs r0, 0x1
	strh r0, [r3, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _080A886C
	movs r0, 0xE
	strh r0, [r3, 0xE]
	movs r0, 0x1
	strh r0, [r3, 0xA]
	b _080A886C
	.align 2, 0
_080A87D8: .4byte gSprites
_080A87DC:
	ldr r2, _080A8808 @ =gSprites
	movs r5, 0x8
	ldrsh r1, [r3, r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x20]
	ldrh r2, [r3, 0xC]
	subs r1, r2
	strh r1, [r0, 0x20]
	ldrh r0, [r3, 0xE]
	subs r0, 0x1
	strh r0, [r3, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _080A886C
	movs r0, 0x7
	strh r0, [r3, 0xE]
	movs r0, 0x2
	strh r0, [r3, 0xA]
	b _080A886C
	.align 2, 0
_080A8808: .4byte gSprites
_080A880C:
	ldr r2, _080A8844 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0xC]
	ldrh r5, [r0, 0x20]
	adds r1, r5
	strh r1, [r0, 0x20]
	ldrh r0, [r3, 0xE]
	subs r0, 0x1
	strh r0, [r3, 0xE]
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	bne _080A886C
	ldrh r0, [r3, 0x10]
	subs r0, 0x1
	strh r0, [r3, 0x10]
	lsls r0, 16
	cmp r0, 0
	beq _080A8848
	movs r0, 0x7
	strh r0, [r3, 0xE]
	strh r1, [r3, 0xA]
	b _080A886C
	.align 2, 0
_080A8844: .4byte gSprites
_080A8848:
	ldrh r1, [r3, 0x18]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A8866
	movs r0, 0x8
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	ldrh r2, [r3, 0x1A]
	subs r1, r2
	strh r1, [r0, 0x22]
_080A8866:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080A886C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A8728

	thumb_func_start sub_80A8874
sub_80A8874: @ 80A8874
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080A88C4 @ =gTasks
	adds r5, r1, r0
	ldr r4, _080A88C8 @ =gBattleAnimTarget
	ldrb r0, [r4]
	bl sub_807492C
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x20
	movs r1, 0
	strh r0, [r5, 0x8]
	movs r0, 0x4
	strh r0, [r5, 0xA]
	strh r1, [r5, 0xC]
	strh r1, [r5, 0xE]
	strh r1, [r5, 0x10]
	strh r1, [r5, 0x12]
	ldrb r0, [r4]
	bl sub_8076B2C
	strh r0, [r5, 0x26]
	ldrb r0, [r4]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A88D4
	ldr r0, _080A88CC @ =gBattle_BG1_X
	ldrh r0, [r0]
	strh r0, [r5, 0x14]
	ldr r0, _080A88D0 @ =0x04000014
	b _080A88DC
	.align 2, 0
_080A88C4: .4byte gTasks
_080A88C8: .4byte gBattleAnimTarget
_080A88CC: .4byte gBattle_BG1_X
_080A88D0: .4byte 0x04000014
_080A88D4:
	ldr r0, _080A8940 @ =gBattle_BG2_X
	ldrh r0, [r0]
	strh r0, [r5, 0x14]
	ldr r0, _080A8944 @ =0x04000018
_080A88DC:
	str r0, [sp]
	ldrh r0, [r5, 0x8]
	adds r1, r0, 0
	subs r1, 0x40
	lsls r2, r1, 16
	lsls r0, 16
	cmp r2, r0
	bgt _080A891A
	ldr r4, _080A8948 @ =gScanlineEffectRegBuffers
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r4, r0
_080A88F4:
	asrs r3, r2, 16
	cmp r3, 0
	blt _080A890C
	lsls r1, r3, 1
	adds r2, r1, r4
	ldrh r0, [r5, 0x14]
	adds r0, 0xF0
	strh r0, [r2]
	adds r1, r6
	ldrh r0, [r5, 0x14]
	adds r0, 0xF0
	strh r0, [r1]
_080A890C:
	adds r0, r3, 0x1
	lsls r2, r0, 16
	asrs r1, r2, 16
	movs r3, 0x8
	ldrsh r0, [r5, r3]
	cmp r1, r0
	ble _080A88F4
_080A891A:
	ldr r0, _080A894C @ =0xa2600001
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
	ldr r0, _080A8950 @ =sub_80A8954
	str r0, [r5]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A8940: .4byte gBattle_BG2_X
_080A8944: .4byte 0x04000018
_080A8948: .4byte gScanlineEffectRegBuffers
_080A894C: .4byte 0xa2600001
_080A8950: .4byte sub_80A8954
	thumb_func_end sub_80A8874

	thumb_func_start sub_80A8954
sub_80A8954: @ 80A8954
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080A8974 @ =gTasks
	adds r3, r0, r1
	movs r1, 0x10
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _080A8978
	cmp r0, 0x1
	beq _080A898E
	b _080A8A0E
	.align 2, 0
_080A8974: .4byte gTasks
_080A8978:
	ldrh r0, [r3, 0x12]
	adds r0, 0x1
	strh r0, [r3, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080A8A0E
	ldrh r0, [r3, 0x10]
	adds r0, 0x1
	strh r0, [r3, 0x10]
	b _080A8A0E
_080A898E:
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080A8A0E
	movs r0, 0
	strh r0, [r3, 0xA]
	ldrh r1, [r3, 0xE]
	movs r0, 0x3
	ands r0, r1
	strh r0, [r3, 0xC]
	ldrh r0, [r3, 0x8]
	subs r0, r1
	strh r0, [r3, 0x12]
	movs r2, 0xC
	ldrsh r1, [r3, r2]
	cmp r1, 0x1
	beq _080A89C4
	cmp r1, 0x1
	ble _080A89CC
	cmp r1, 0x2
	beq _080A89C8
	cmp r1, 0x3
	beq _080A89C8
	b _080A89CC
_080A89C4:
	subs r0, 0x2
	b _080A89CA
_080A89C8:
	adds r0, 0x1
_080A89CA:
	strh r0, [r3, 0x12]
_080A89CC:
	movs r1, 0x12
	ldrsh r0, [r3, r1]
	cmp r0, 0
	blt _080A89F0
	ldr r2, _080A8A14 @ =gScanlineEffectRegBuffers
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r3, 0x14]
	strh r1, [r0]
	movs r1, 0x12
	ldrsh r0, [r3, r1]
	lsls r0, 1
	movs r1, 0xF0
	lsls r1, 3
	adds r2, r1
	adds r0, r2
	ldrh r1, [r3, 0x14]
	strh r1, [r0]
_080A89F0:
	ldrh r0, [r3, 0xE]
	adds r0, 0x1
	strh r0, [r3, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x26
	ldrsh r1, [r3, r2]
	cmp r0, r1
	blt _080A8A0E
	ldr r1, _080A8A18 @ =gScanlineEffect
	movs r0, 0x3
	strb r0, [r1, 0x15]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080A8A0E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8A14: .4byte gScanlineEffectRegBuffers
_080A8A18: .4byte gScanlineEffect
	thumb_func_end sub_80A8954

	thumb_func_start sub_80A8A1C
sub_80A8A1C: @ 80A8A1C
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _080A8A70 @ =gBattleAnimTarget
	ldrb r0, [r6]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x10
	movs r5, 0
	strh r0, [r4, 0x20]
	ldrb r0, [r6]
	bl sub_807492C
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	strh r0, [r4, 0x22]
	strh r5, [r4, 0x2E]
	strh r5, [r4, 0x30]
	strh r5, [r4, 0x32]
	movs r0, 0x10
	strh r0, [r4, 0x34]
	strh r5, [r4, 0x36]
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8076B2C
	adds r0, 0x2
	strh r0, [r4, 0x38]
	movs r0, 0x3F
	bl BattleAnimAdjustPanning
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x3A]
	ldr r0, _080A8A74 @ =sub_80A8A78
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A8A70: .4byte gBattleAnimTarget
_080A8A74: .4byte sub_80A8A78
	thumb_func_end sub_80A8A1C

	thumb_func_start sub_80A8A78
sub_80A8A78: @ 80A8A78
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _080A8ADC
	cmp r1, 0x1
	bgt _080A8A8E
	cmp r1, 0
	beq _080A8A94
	b _080A8BBC
_080A8A8E:
	cmp r1, 0x2
	beq _080A8B6E
	b _080A8BBC
_080A8A94:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080A8ABE
	strh r1, [r4, 0x32]
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsrs r1, r2, 2
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080A8ABE:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080A8BBC
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r2]
	b _080A8B66
_080A8ADC:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080A8B22
	ldrh r2, [r4, 0x32]
	movs r3, 0x32
	ldrsh r1, [r4, r3]
	movs r3, 0x38
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _080A8B22
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	subs r0, 0x1
	strh r0, [r4, 0x22]
	adds r0, r2, 0x1
	strh r0, [r4, 0x32]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _080A8B22
	ldrh r1, [r4, 0x3A]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xC6
	bl PlaySE12WithPanning
_080A8B22:
	ldrh r0, [r4, 0x34]
	ldrh r2, [r4, 0x36]
	adds r1, r0, r2
	strh r1, [r4, 0x36]
	lsls r0, r1, 16
	asrs r2, r0, 16
	cmp r2, 0x1F
	ble _080A8B36
	movs r0, 0x40
	b _080A8B44
_080A8B36:
	movs r0, 0x20
	negs r0, r0
	cmp r2, r0
	bgt _080A8B50
	movs r2, 0x40
	negs r2, r2
	adds r0, r2, 0
_080A8B44:
	subs r0, r1
	strh r0, [r4, 0x36]
	movs r3, 0x34
	ldrsh r0, [r4, r3]
	negs r0, r0
	strh r0, [r4, 0x34]
_080A8B50:
	ldrh r0, [r4, 0x36]
	movs r2, 0
	strh r0, [r4, 0x24]
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	movs r3, 0x32
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _080A8BBC
	strh r2, [r4, 0x30]
	strh r2, [r4, 0x32]
_080A8B66:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080A8BBC
_080A8B6E:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080A8B9A
	movs r0, 0
	strh r0, [r4, 0x32]
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsrs r1, r2, 2
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080A8B9A:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080A8BBC
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A8BBC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A8A78

	thumb_func_start sub_80A8BC4
sub_80A8BC4: @ 80A8BC4
	push {r4-r7,lr}
	sub sp, 0x4
	adds r6, r0, 0
	movs r5, 0
	mov r0, sp
	strh r5, [r0]
	mov r1, sp
	adds r1, 0x2
	strh r5, [r1]
	ldr r0, _080A8BE8 @ =gBattleAnimArgs
	movs r3, 0x4
	ldrsh r2, [r0, r3]
	adds r7, r1, 0
	adds r1, r0, 0
	cmp r2, 0
	bne _080A8BF0
	ldr r0, _080A8BEC @ =gBattleAnimAttacker
	b _080A8BF2
	.align 2, 0
_080A8BE8: .4byte gBattleAnimArgs
_080A8BEC: .4byte gBattleAnimAttacker
_080A8BF0:
	ldr r0, _080A8C2C @ =gBattleAnimTarget
_080A8BF2:
	ldrb r5, [r0]
	ldrb r1, [r1, 0x6]
	movs r0, 0x1
	adds r4, r0, 0
	eors r4, r1
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _080A8C6A
	movs r1, 0x2
	adds r0, r5, 0
	eors r0, r1
	bl IsBattlerSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080A8C6A
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, sp
	adds r3, r7, 0
	bl sub_8076D9C
	cmp r4, 0
	bne _080A8C30
	adds r0, r5, 0
	movs r1, 0
	b _080A8C34
	.align 2, 0
_080A8C2C: .4byte gBattleAnimTarget
_080A8C30:
	adds r0, r5, 0
	movs r1, 0x2
_080A8C34:
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r5, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A8C60
	ldr r2, _080A8C5C @ =gBattleAnimArgs
	mov r0, sp
	ldrh r1, [r0]
	subs r1, r4
	ldrh r0, [r2]
	subs r1, r0
	subs r0, r1
	strh r0, [r2]
	b _080A8C6A
	.align 2, 0
_080A8C5C: .4byte gBattleAnimArgs
_080A8C60:
	ldr r1, _080A8C7C @ =gBattleAnimArgs
	mov r0, sp
	ldrh r0, [r0]
	subs r0, r4
	strh r0, [r1]
_080A8C6A:
	ldr r1, _080A8C80 @ =sub_8075D9C
	str r1, [r6, 0x1C]
	adds r0, r6, 0
	bl _call_via_r1
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8C7C: .4byte gBattleAnimArgs
_080A8C80: .4byte sub_8075D9C
	thumb_func_end sub_80A8BC4

	thumb_func_start sub_80A8C84
sub_80A8C84: @ 80A8C84
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	beq _080A8C9E
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A8C9E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A8C84

	thumb_func_start sub_80A8CA4
sub_80A8CA4: @ 80A8CA4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r5, r0, 0
	movs r6, 0
	mov r0, sp
	strh r6, [r0]
	mov r1, sp
	adds r1, 0x2
	strh r6, [r1]
	ldr r0, _080A8CD0 @ =gBattleAnimArgs
	movs r2, 0xA
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _080A8CDC
	ldr r0, _080A8CD4 @ =gBattleAnimAttacker
	ldrb r7, [r0]
	ldr r0, _080A8CD8 @ =gBattleAnimTarget
	b _080A8CE2
	.align 2, 0
_080A8CD0: .4byte gBattleAnimArgs
_080A8CD4: .4byte gBattleAnimAttacker
_080A8CD8: .4byte gBattleAnimTarget
_080A8CDC:
	ldr r0, _080A8CFC @ =gBattleAnimTarget
	ldrb r7, [r0]
	ldr r0, _080A8D00 @ =gBattleAnimAttacker
_080A8CE2:
	ldrb r0, [r0]
	mov r8, r0
	ldr r0, _080A8D04 @ =gBattleAnimArgs
	movs r3, 0xC
	ldrsh r0, [r0, r3]
	cmp r0, 0
	bne _080A8D08
	movs r0, 0
	mov r10, r0
	movs r1, 0x1
	str r1, [sp, 0x4]
	b _080A8D10
	.align 2, 0
_080A8CFC: .4byte gBattleAnimTarget
_080A8D00: .4byte gBattleAnimAttacker
_080A8D04: .4byte gBattleAnimArgs
_080A8D08:
	movs r2, 0x2
	mov r10, r2
	movs r3, 0x3
	str r3, [sp, 0x4]
_080A8D10:
	adds r0, r7, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A8D6C
	adds r0, r7, 0
	mov r1, r10
	bl GetBattlerSpriteCoord
	lsls r0, 24
	ldr r1, _080A8D50 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	movs r0, 0x2
	mov r4, r8
	eors r4, r0
	adds r0, r4, 0
	bl IsBattlerSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080A8D5C
	ldr r2, _080A8D54 @ =gSprites
	ldr r0, _080A8D58 @ =gBattlerSpriteIds
	adds r0, r4, r0
	b _080A8DEA
	.align 2, 0
_080A8D50: .4byte gBattleAnimArgs
_080A8D54: .4byte gSprites
_080A8D58: .4byte gBattlerSpriteIds
_080A8D5C:
	ldr r2, _080A8D64 @ =gSprites
	ldr r0, _080A8D68 @ =gBattlerSpriteIds
	add r0, r8
	b _080A8DEA
	.align 2, 0
_080A8D64: .4byte gSprites
_080A8D68: .4byte gBattlerSpriteIds
_080A8D6C:
	adds r0, r7, 0
	mov r1, r10
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080A8DD4 @ =gBattleAnimArgs
	ldrh r1, [r1]
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080A8DE4
	movs r0, 0x2
	adds r4, r7, 0
	eors r4, r0
	adds r0, r4, 0
	bl IsBattlerSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080A8DE4
	ldr r3, _080A8DD8 @ =gSprites
	ldr r2, _080A8DDC @ =gBattlerSpriteIds
	adds r0, r7, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r6, r0, r3
	adds r2, r4, r2
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r3
	movs r0, 0x20
	ldrsh r1, [r6, r0]
	movs r3, 0x20
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _080A8DE0
	adds r0, r2, 0
	adds r0, 0x43
	ldrb r0, [r0]
	adds r0, 0x1
	b _080A8DFA
	.align 2, 0
_080A8DD4: .4byte gBattleAnimArgs
_080A8DD8: .4byte gSprites
_080A8DDC: .4byte gBattlerSpriteIds
_080A8DE0:
	adds r0, r6, 0
	b _080A8DF4
_080A8DE4:
	ldr r2, _080A8E40 @ =gSprites
	ldr r0, _080A8E44 @ =gBattlerSpriteIds
	adds r0, r7, r0
_080A8DEA:
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
_080A8DF4:
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
_080A8DFA:
	adds r1, r5, 0
	adds r1, 0x43
	strb r0, [r1]
	adds r0, r7, 0
	ldr r1, [sp, 0x4]
	bl GetBattlerSpriteCoord
	lsls r0, 24
	ldr r4, _080A8E48 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080A8E4C
	movs r1, 0x2
	mov r0, r8
	eors r0, r1
	bl IsBattlerSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080A8E4C
	ldrb r1, [r4, 0xC]
	mov r0, r8
	mov r2, sp
	mov r3, sp
	adds r3, 0x2
	bl sub_8076D9C
	b _080A8E6C
	.align 2, 0
_080A8E40: .4byte gSprites
_080A8E44: .4byte gBattlerSpriteIds
_080A8E48: .4byte gBattleAnimArgs
_080A8E4C:
	mov r4, sp
	mov r0, r8
	mov r1, r10
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	mov r0, r8
	ldr r1, [sp, 0x4]
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	mov r2, sp
	strh r0, [r2, 0x2]
_080A8E6C:
	mov r0, r8
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A8E90
	mov r3, sp
	mov r2, sp
	ldr r1, _080A8E8C @ =gBattleAnimArgs
	ldrh r0, [r1, 0x6]
	ldrh r2, [r2]
	adds r0, r2
	strh r0, [r3]
	adds r2, r1, 0
	b _080A8E9E
	.align 2, 0
_080A8E8C: .4byte gBattleAnimArgs
_080A8E90:
	mov r3, sp
	mov r0, sp
	ldr r2, _080A8EE0 @ =gBattleAnimArgs
	ldrh r0, [r0]
	ldrh r1, [r2, 0x6]
	subs r0, r1
	strh r0, [r3]
_080A8E9E:
	ldrh r1, [r2, 0x8]
	mov r3, sp
	ldrh r3, [r3, 0x2]
	adds r1, r3
	mov r0, sp
	strh r1, [r0, 0x2]
	mov r3, r9
	strh r3, [r5, 0x30]
	strh r3, [r5, 0x20]
	strh r6, [r5, 0x34]
	strh r6, [r5, 0x22]
	ldrh r0, [r0]
	strh r0, [r5, 0x32]
	strh r1, [r5, 0x36]
	ldrh r0, [r2]
	strh r0, [r5, 0x2E]
	adds r0, r5, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r1, _080A8EE4 @ =sub_80A8C84
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8EE0: .4byte gBattleAnimArgs
_080A8EE4: .4byte sub_80A8C84
	thumb_func_end sub_80A8CA4

	thumb_func_start sub_80A8EE8
sub_80A8EE8: @ 80A8EE8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080A8F28 @ =0x000027db
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080A8F0E
	lsls r0, 20
	ldr r1, _080A8F2C @ =0x01010000
	adds r0, r1
	lsrs r0, 16
	ldr r1, _080A8F30 @ =gBattleAnimArgs
	ldrb r2, [r1, 0xA]
	ldrh r3, [r1, 0x8]
	movs r1, 0xF
	bl BlendPalette
_080A8F0E:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r1, _080A8F34 @ =sub_8075D9C
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8F28: .4byte 0x000027db
_080A8F2C: .4byte 0x01010000
_080A8F30: .4byte gBattleAnimArgs
_080A8F34: .4byte sub_8075D9C
	thumb_func_end sub_80A8EE8

	thumb_func_start sub_80A8F38
sub_80A8F38: @ 80A8F38
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_8075160
	ldr r0, _080A8F6C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	movs r1, 0xA0
	cmp r0, 0
	beq _080A8F54
	ldr r1, _080A8F70 @ =0x0000ff60
_080A8F54:
	movs r0, 0xE0
	lsls r0, 2
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	ldr r0, _080A8F74 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x3C]
	ldr r0, _080A8F78 @ =sub_80A8F7C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8F6C: .4byte gBattleAnimAttacker
_080A8F70: .4byte 0x0000ff60
_080A8F74: .4byte gBattleAnimArgs
_080A8F78: .4byte sub_80A8F7C
	thumb_func_end sub_80A8F38

	thumb_func_start sub_80A8F7C
sub_80A8F7C: @ 80A8F7C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x2E]
	lsls r0, r2, 16
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	subs r1, r0
	movs r5, 0
	strh r1, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	subs r2, 0x20
	strh r2, [r4, 0x2E]
	ldr r0, _080A8FE8 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	movs r1, 0xA0
	cmp r0, 0
	beq _080A8FAC
	ldr r1, _080A8FEC @ =0x0000ff60
_080A8FAC:
	lsls r0, r1, 16
	asrs r0, 16
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x26]
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080A8FE0
	ldrh r2, [r4, 0x22]
	adds r0, r1, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	strh r5, [r4, 0x26]
	strh r5, [r4, 0x24]
	strh r5, [r4, 0x2E]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r0, _080A8FF0 @ =sub_80A8FF4
	str r0, [r4, 0x1C]
_080A8FE0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8FE8: .4byte gBattleAnimAttacker
_080A8FEC: .4byte 0x0000ff60
_080A8FF0: .4byte sub_80A8FF4
	thumb_func_end sub_80A8F7C

	thumb_func_start sub_80A8FF4
sub_80A8FF4: @ 80A8FF4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r1, r0, 0x1
	strh r1, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080A9012
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	ldr r0, _080A9018 @ =sub_80A901C
	str r0, [r4, 0x1C]
_080A9012:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9018: .4byte sub_80A901C
	thumb_func_end sub_80A8FF4

	thumb_func_start sub_80A901C
sub_80A901C: @ 80A901C
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080A9082
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	movs r0, 0
	strh r0, [r4, 0x2E]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080A9068
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x10
	ldr r3, _080A905C @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080A9060 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	ldr r0, _080A9064 @ =sub_80A9094
	b _080A9080
	.align 2, 0
_080A905C: .4byte 0x000003ff
_080A9060: .4byte 0xfffffc00
_080A9064: .4byte sub_80A9094
_080A9068:
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x20
	ldr r3, _080A9088 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080A908C @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	ldr r0, _080A9090 @ =sub_80A911C
_080A9080:
	str r0, [r4, 0x1C]
_080A9082:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9088: .4byte 0x000003ff
_080A908C: .4byte 0xfffffc00
_080A9090: .4byte sub_80A911C
	thumb_func_end sub_80A901C

	thumb_func_start sub_80A9094
sub_80A9094: @ 80A9094
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x26]
	subs r0, 0x2
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bne _080A90CA
	movs r0, 0x10
	strh r0, [r4, 0x2E]
	movs r0, 0
	strh r0, [r4, 0x30]
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	ldrh r1, [r4, 0x2E]
	movs r0, 0x52
	bl SetGpuReg
	ldr r0, _080A90D0 @ =sub_80A90D4
	str r0, [r4, 0x1C]
_080A90CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A90D0: .4byte sub_80A90D4
	thumb_func_end sub_80A9094

	thumb_func_start sub_80A90D4
sub_80A90D4: @ 80A90D4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	adds r1, r0, 0x1
	strh r1, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x3
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _080A9112
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
	bne _080A9112
	ldr r0, _080A9118 @ =sub_80A911C
	str r0, [r4, 0x1C]
_080A9112:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9118: .4byte sub_80A911C
	thumb_func_end sub_80A90D4

	thumb_func_start sub_80A911C
sub_80A911C: @ 80A911C
	push {lr}
	adds r3, r0, 0
	ldr r0, _080A9144 @ =gBattleAnimArgs
	ldrh r1, [r0, 0xE]
	ldr r0, _080A9148 @ =0x0000ffff
	cmp r1, r0
	bne _080A9154
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r1, 0x3C
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080A9150
	ldr r0, _080A914C @ =sub_80A915C
	b _080A9152
	.align 2, 0
_080A9144: .4byte gBattleAnimArgs
_080A9148: .4byte 0x0000ffff
_080A914C: .4byte sub_80A915C
_080A9150:
	ldr r0, _080A9158 @ =DestroyAnimSprite
_080A9152:
	str r0, [r3, 0x1C]
_080A9154:
	pop {r0}
	bx r0
	.align 2, 0
_080A9158: .4byte DestroyAnimSprite
	thumb_func_end sub_80A911C

	thumb_func_start sub_80A915C
sub_80A915C: @ 80A915C
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
	thumb_func_end sub_80A915C

	thumb_func_start sub_80A917C
sub_80A917C: @ 80A917C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080A91AC @ =gTasks
	adds r4, r0
	movs r0, 0
	bl GetAnimBattlerSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r4, 0x8]
	ldr r2, _080A91B0 @ =gUnknown_83E4128
	adds r0, r4, 0
	bl sub_80762D0
	ldr r0, _080A91B4 @ =sub_80A91B8
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A91AC: .4byte gTasks
_080A91B0: .4byte gUnknown_83E4128
_080A91B4: .4byte sub_80A91B8
	thumb_func_end sub_80A917C

	thumb_func_start sub_80A91B8
sub_80A91B8: @ 80A91B8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080A9208 @ =gTasks
	adds r4, r0, r1
	adds r0, r4, 0
	bl sub_8076308
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	bne _080A9202
	ldr r2, _080A920C @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r3, [r0, 0x26]
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080A9202:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A9208: .4byte gTasks
_080A920C: .4byte gSprites
	thumb_func_end sub_80A91B8

	thumb_func_start sub_80A9210
sub_80A9210: @ 80A9210
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080A9244 @ =gTasks
	adds r4, r1, r0
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xE]
	movs r0, 0x3
	strh r0, [r4, 0x20]
	ldr r0, _080A9248 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080A9250
	ldr r0, _080A924C @ =0x0000ffff
	strh r0, [r4, 0x22]
	movs r0, 0x8
	b _080A9256
	.align 2, 0
_080A9244: .4byte gTasks
_080A9248: .4byte gBattleAnimTarget
_080A924C: .4byte 0x0000ffff
_080A9250:
	movs r0, 0x1
	strh r0, [r4, 0x22]
	ldr r0, _080A9270 @ =0x0000fff8
_080A9256:
	strh r0, [r4, 0x24]
	movs r0, 0x1
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldr r0, _080A9274 @ =sub_80A9278
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9270: .4byte 0x0000fff8
_080A9274: .4byte sub_80A9278
	thumb_func_end sub_80A9210

	thumb_func_start sub_80A9278
sub_80A9278: @ 80A9278
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080A929C @ =gTasks
	adds r3, r0, r1
	movs r0, 0x8
	ldrsh r4, [r3, r0]
	cmp r4, 0x1
	beq _080A92CC
	cmp r4, 0x1
	bgt _080A92A0
	cmp r4, 0
	beq _080A92AA
	b _080A9392
	.align 2, 0
_080A929C: .4byte gTasks
_080A92A0:
	cmp r4, 0x2
	beq _080A9348
	cmp r4, 0x3
	beq _080A9362
	b _080A9392
_080A92AA:
	ldr r2, _080A92C8 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x24]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	strh r1, [r0, 0x24]
	strh r4, [r3, 0xA]
	strh r4, [r3, 0xC]
	strh r4, [r3, 0xE]
	b _080A935A
	.align 2, 0
_080A92C8: .4byte gSprites
_080A92CC:
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080A9392
	movs r0, 0
	strh r0, [r3, 0xA]
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	ands r0, r4
	lsls r0, 16
	cmp r0, 0
	beq _080A9304
	ldr r2, _080A9300 @ =gSprites
	movs r4, 0x26
	ldrsh r1, [r3, r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x24]
	adds r1, 0x6
	b _080A9316
	.align 2, 0
_080A9300: .4byte gSprites
_080A9304:
	ldr r2, _080A9344 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x24]
	subs r1, 0x6
_080A9316:
	strh r1, [r0, 0x24]
	ldrh r0, [r3, 0xE]
	adds r0, 0x1
	strh r0, [r3, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080A9392
	ldrh r1, [r3, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A935A
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x24]
	subs r0, 0x6
	strh r0, [r1, 0x24]
	b _080A935A
	.align 2, 0
_080A9344: .4byte gSprites
_080A9348:
	ldrh r0, [r3, 0x20]
	subs r0, 0x1
	strh r0, [r3, 0x20]
	lsls r0, 16
	cmp r0, 0
	beq _080A935A
	movs r0, 0
	strh r0, [r3, 0x8]
	b _080A9392
_080A935A:
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	b _080A9392
_080A9362:
	ldr r2, _080A9398 @ =gSprites
	movs r4, 0x26
	ldrsh r1, [r3, r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x22]
	ldrh r4, [r0, 0x24]
	adds r1, r4
	strh r1, [r0, 0x24]
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x24
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A9392
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080A9392:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A9398: .4byte gSprites
	thumb_func_end sub_80A9278

	thumb_func_start sub_80A939C
sub_80A939C: @ 80A939C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080A93D8 @ =gTasks
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xE]
	movs r0, 0x1
	strh r0, [r4, 0x10]
	movs r0, 0xE
	strh r0, [r4, 0x22]
	movs r0, 0x2
	strh r0, [r4, 0x24]
	movs r0, 0
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldr r0, _080A93DC @ =sub_80A93E0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A93D8: .4byte gTasks
_080A93DC: .4byte sub_80A93E0
	thumb_func_end sub_80A939C

	thumb_func_start sub_80A93E0
sub_80A93E0: @ 80A93E0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080A9434 @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	cmp r2, 0
	bne _080A94A6
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x10
	ldrsh r1, [r4, r3]
	cmp r0, r1
	ble _080A94A6
	strh r2, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A943C
	ldr r3, _080A9438 @ =gSprites
	movs r6, 0x26
	ldrsh r1, [r4, r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	b _080A9452
	.align 2, 0
_080A9434: .4byte gTasks
_080A9438: .4byte gSprites
_080A943C:
	ldr r3, _080A9484 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
_080A9452:
	strb r1, [r0]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r6, 0x22
	ldrsh r1, [r4, r6]
	cmp r0, r1
	blt _080A94A6
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	movs r6, 0x24
	ldrsh r1, [r4, r6]
	cmp r0, r1
	bge _080A9488
	strh r2, [r4, 0xA]
	strh r2, [r4, 0xC]
	strh r2, [r4, 0xE]
	b _080A94A6
	.align 2, 0
_080A9484: .4byte gSprites
_080A9488:
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080A94A6:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A93E0

	thumb_func_start sub_80A94AC
sub_80A94AC: @ 80A94AC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080A94FC @ =gTasks
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x8]
	movs r1, 0x4
	strh r1, [r4, 0xA]
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xE]
	strh r0, [r4, 0x10]
	strh r0, [r4, 0x12]
	strh r0, [r4, 0x14]
	strh r0, [r4, 0x16]
	strh r0, [r4, 0x18]
	strh r0, [r4, 0x22]
	ldr r5, _080A9500 @ =gBattleAnimAttacker
	ldrb r0, [r5]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x24]
	ldrb r0, [r5]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldr r0, _080A9504 @ =sub_80A9508
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A94FC: .4byte gTasks
_080A9500: .4byte gBattleAnimAttacker
_080A9504: .4byte sub_80A9508
	thumb_func_end sub_80A94AC

	thumb_func_start sub_80A9508
sub_80A9508: @ 80A9508
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080A952C @ =gTasks
	adds r4, r0, r1
	movs r0, 0x18
	ldrsh r2, [r4, r0]
	cmp r2, 0x1
	beq _080A9574
	cmp r2, 0x1
	bgt _080A9530
	cmp r2, 0
	beq _080A9536
	b _080A9590
	.align 2, 0
_080A952C: .4byte gTasks
_080A9530:
	cmp r2, 0x2
	beq _080A958C
	b _080A9590
_080A9536:
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080A9590
	strh r2, [r4, 0x10]
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	movs r1, 0x1
	ands r0, r1
	strh r0, [r4, 0x12]
	ldrh r0, [r4, 0x14]
	adds r0, 0x1
	strh r0, [r4, 0x14]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080A9590
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080A956E
	strh r2, [r4, 0x14]
	movs r0, 0x1
	strh r0, [r4, 0x18]
	b _080A9590
_080A956E:
	movs r0, 0x2
	strh r0, [r4, 0x18]
	b _080A9590
_080A9574:
	movs r1, 0
	strh r1, [r4, 0x12]
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080A9590
	strh r2, [r4, 0x16]
	strh r1, [r4, 0x18]
	b _080A9590
_080A958C:
	movs r0, 0x1
	strh r0, [r4, 0x12]
_080A9590:
	movs r2, 0x8
	ldrsh r5, [r4, r2]
	cmp r5, 0
	beq _080A959E
	cmp r5, 0x1
	beq _080A9634
	b _080A9642
_080A959E:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080A9642
	strh r5, [r4, 0xA]
	ldr r0, _080A9628 @ =gUnknown_83E4154
	movs r3, 0x24
	ldrsh r1, [r4, r3]
	movs r3, 0x26
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080A9642
	ldr r0, _080A962C @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	strh r6, [r1, 0x2E]
	movs r0, 0xD
	strh r0, [r1, 0x30]
	ldr r2, _080A9630 @ =gUnknown_83E416C
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	lsls r0, 1
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r1, 0x24]
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	lsls r0, 1
	adds r2, 0x1
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r1, 0x26]
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080A9642
	strh r5, [r4, 0xC]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080A9642
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080A9642
	.align 2, 0
_080A9628: .4byte gUnknown_83E4154
_080A962C: .4byte gSprites
_080A9630: .4byte gUnknown_83E416C
_080A9634:
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080A9642
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080A9642:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A9508

	thumb_func_start sub_80A9648
sub_80A9648: @ 80A9648
	push {r4,lr}
	adds r3, r0, 0
	ldr r4, _080A96B0 @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	movs r2, 0x1
	ldrb r1, [r0, 0x12]
	ands r1, r2
	lsls r1, 2
	mov r0, r12
	ldrb r2, [r0]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	adds r0, r3, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080A96AA
	movs r0, 0x30
	ldrsh r1, [r3, r0]
	lsls r1, 1
	movs r0, 0x2E
	ldrsh r2, [r3, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x8
	adds r1, r0
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r3, 0
	bl DestroySprite
_080A96AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A96B0: .4byte gTasks
	thumb_func_end sub_80A9648

	thumb_func_start sub_80A96B4
sub_80A96B4: @ 80A96B4
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080A9750 @ =0x000027de
	bl IndexOfSpritePaletteTag
	mov r1, sp
	strb r0, [r1]
	movs r4, 0x1
	ldr r0, _080A9754 @ =0x00002710
	adds r5, r0, 0
_080A96CC:
	subs r0, r5, r4
	lsls r0, 16
	lsrs r0, 16
	bl AllocSpritePalette
	mov r2, sp
	adds r1, r2, r4
	strb r0, [r1]
	adds r4, 0x1
	cmp r4, 0x2
	ble _080A96CC
	movs r0, 0x80
	lsls r0, 6
	bl AllocZeroed
	adds r1, r0, 0
	ldr r0, _080A9758 @ =gMonSpritesGfxPtr
	ldr r0, [r0]
	movs r2, 0xBE
	lsls r2, 1
	adds r0, r2
	str r1, [r0]
	ldr r0, _080A975C @ =gFile_graphics_battle_anims_sprites_206_palette
	bl LZDecompressWram
	movs r4, 0
_080A9700:
	ldr r5, _080A9758 @ =gMonSpritesGfxPtr
	ldr r0, [r5]
	movs r1, 0xBE
	lsls r1, 1
	adds r0, r1
	lsls r1, r4, 6
	ldr r0, [r0]
	adds r0, r1
	mov r2, sp
	adds r1, r2, r4
	ldrb r1, [r1]
	lsls r1, 20
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadPalette
	adds r4, 0x1
	cmp r4, 0x2
	ble _080A9700
	ldr r0, [r5]
	movs r4, 0xBE
	lsls r4, 1
	adds r0, r4
	ldr r0, [r0]
	bl Free
	ldr r0, [r5]
	adds r0, r4
	movs r1, 0
	str r1, [r0]
	adds r0, r6, 0
	bl DestroyAnimVisualTask
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A9750: .4byte 0x000027de
_080A9754: .4byte 0x00002710
_080A9758: .4byte gMonSpritesGfxPtr
_080A975C: .4byte gFile_graphics_battle_anims_sprites_206_palette
	thumb_func_end sub_80A96B4

	thumb_func_start sub_80A9760
sub_80A9760: @ 80A9760
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _080A9784 @ =gUnknown_83E41C8
	movs r4, 0x2
_080A976A:
	ldrh r0, [r5]
	bl FreeSpritePaletteByTag
	adds r5, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080A976A
	adds r0, r6, 0
	bl DestroyAnimVisualTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A9784: .4byte gUnknown_83E41C8
	thumb_func_end sub_80A9760

	thumb_func_start sub_80A9788
sub_80A9788: @ 80A9788
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsls r2, 24
	lsrs r3, r2, 24
	movs r0, 0x1
	ands r3, r0
	negs r0, r3
	orrs r0, r3
	asrs r0, 31
	movs r3, 0x20
	ands r0, r3
	ldrh r4, [r5, 0x4]
	lsls r3, r4, 22
	lsrs r3, 22
	lsrs r1, 22
	adds r0, r1
	adds r3, r0
	ldr r1, _080A97DC @ =0x000003ff
	adds r0, r1, 0
	ands r3, r0
	ldr r0, _080A97E0 @ =0xfffffc00
	ands r0, r4
	orrs r0, r3
	strh r0, [r5, 0x4]
	ldr r0, _080A97E4 @ =gUnknown_83E41C8
	lsrs r2, 25
	lsls r2, 1
	adds r2, r0
	ldrh r0, [r2]
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	ldrb r2, [r5, 0x5]
	movs r1, 0xF
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A97DC: .4byte 0x000003ff
_080A97E0: .4byte 0xfffffc00
_080A97E4: .4byte gUnknown_83E41C8
	thumb_func_end sub_80A9788

	thumb_func_start sub_80A97E8
sub_80A97E8: @ 80A97E8
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0
	bl sub_8075160
	ldr r6, _080A9850 @ =gBattleAnimAttacker
	ldrb r0, [r6]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A9808
	ldr r1, _080A9854 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080A9808:
	ldr r4, _080A9854 @ =gBattleAnimArgs
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x2E]
	ldrb r0, [r6]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrb r0, [r6]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x6]
	adds r0, r1
	strh r0, [r5, 0x36]
	ldr r0, _080A9858 @ =StartAnimLinearTranslation
	str r0, [r5, 0x1C]
	ldr r1, _080A985C @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	ldrb r1, [r4, 0xA]
	ldrb r2, [r4, 0xC]
	adds r0, r5, 0
	bl sub_80A9788
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A9850: .4byte gBattleAnimAttacker
_080A9854: .4byte gBattleAnimArgs
_080A9858: .4byte StartAnimLinearTranslation
_080A985C: .4byte DestroyAnimSprite
	thumb_func_end sub_80A97E8

	thumb_func_start sub_80A9860
sub_80A9860: @ 80A9860
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080A987A
	adds r0, r4, 0
	movs r1, 0
	bl sub_8075160
_080A987A:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x8
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r2, [r4, 0x32]
	lsls r0, r2, 16
	asrs r0, 24
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x7
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	subs r2, 0x80
	strh r2, [r4, 0x32]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x3C
	bne _080A98AA
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A98AA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A9860

	thumb_func_start sub_80A98B0
sub_80A98B0: @ 80A98B0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	bl IsContest
	lsls r0, 24
	movs r6, 0xF0
	cmp r0, 0
	beq _080A98C4
	movs r6, 0x98
_080A98C4:
	movs r5, 0
	ldr r1, _080A9918 @ =gBattle_WIN0H
	strh r6, [r1]
	ldr r4, _080A991C @ =gBattle_WIN0V
	movs r0, 0xA0
	strh r0, [r4]
	ldrh r1, [r1]
	movs r0, 0x40
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, 0x44
	bl SetGpuReg
	ldr r1, _080A9920 @ =0x00003f1f
	movs r0, 0x48
	bl SetGpuReg
	ldr r1, _080A9924 @ =0x00003f3f
	movs r0, 0x4A
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0xC8
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0x10
	bl SetGpuReg
	ldr r1, _080A9928 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x8]
	strh r6, [r0, 0xA]
	ldr r1, _080A992C @ =sub_80A9930
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9918: .4byte gBattle_WIN0H
_080A991C: .4byte gBattle_WIN0V
_080A9920: .4byte 0x00003f1f
_080A9924: .4byte 0x00003f3f
_080A9928: .4byte gTasks
_080A992C: .4byte sub_80A9930
	thumb_func_end sub_80A98B0

	thumb_func_start sub_80A9930
sub_80A9930: @ 80A9930
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A9964 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrh r0, [r3, 0x8]
	adds r4, r0, 0
	adds r4, 0xD
	strh r4, [r3, 0x8]
	ldrh r0, [r3, 0xA]
	adds r2, r0, 0
	subs r2, 0xD
	strh r2, [r3, 0xA]
	lsls r1, r4, 16
	lsls r0, r2, 16
	cmp r1, r0
	blt _080A9970
	ldr r0, _080A9968 @ =gBattle_WIN0H
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080A996C @ =sub_80A9984
	str r0, [r3]
	b _080A9978
	.align 2, 0
_080A9964: .4byte gTasks
_080A9968: .4byte gBattle_WIN0H
_080A996C: .4byte sub_80A9984
_080A9970:
	ldr r1, _080A9980 @ =gBattle_WIN0H
	lsls r0, r4, 8
	orrs r2, r0
	strh r2, [r1]
_080A9978:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9980: .4byte gBattle_WIN0H
	thumb_func_end sub_80A9930

	thumb_func_start sub_80A9984
sub_80A9984: @ 80A9984
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080A99D0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r1
	ldrh r0, [r1, 0x1C]
	adds r0, 0x1
	movs r4, 0
	strh r0, [r1, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _080A99D8
	movs r0, 0x88
	strh r0, [r1, 0x1E]
	movs r0, 0x50
	movs r1, 0x88
	bl SetGpuReg
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8075BE8
	ldr r2, _080A99D4 @ =0x00007fff
	movs r1, 0x10
	bl BlendPalettes
	b _080A9A0C
	.align 2, 0
_080A99D0: .4byte gTasks
_080A99D4: .4byte 0x00007fff
_080A99D8:
	cmp r0, 0x4
	ble _080A9A0C
	ldr r0, _080A9A14 @ =gBattle_WIN0H
	strh r4, [r0]
	ldr r0, _080A9A18 @ =gBattle_WIN0V
	strh r4, [r0]
	ldr r4, _080A9A1C @ =0x00003f3f
	movs r0, 0x48
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x4A
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080A9A0C:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A9A14: .4byte gBattle_WIN0H
_080A9A18: .4byte gBattle_WIN0V
_080A9A1C: .4byte 0x00003f3f
	thumb_func_end sub_80A9984

	thumb_func_start sub_80A9A20
sub_80A9A20: @ 80A9A20
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	movs r0, 0x1
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080A9A70 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080A9A7C
	movs r0, 0x1
	bl GetAnimBattlerSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080A9A74 @ =gUnknown_83E4200
	adds r0, r5, 0
	bl sub_80762D0
	ldr r1, _080A9A78 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	movs r1, 0x4
	strh r1, [r0, 0x24]
	b _080A9AA4
	.align 2, 0
_080A9A70: .4byte gTasks
_080A9A74: .4byte gUnknown_83E4200
_080A9A78: .4byte gSprites
_080A9A7C:
	ldr r1, _080A9AAC @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r4, r0, r1
	ldrh r0, [r4, 0x24]
	negs r0, r0
	strh r0, [r4, 0x24]
	adds r0, r5, 0
	bl sub_8076308
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080A9AA4
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080A9AA4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A9AAC: .4byte gSprites
	thumb_func_end sub_80A9A20

	thumb_func_start sub_80A9AB0
sub_80A9AB0: @ 80A9AB0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	movs r0, 0
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080A9B00 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080A9B0C
	movs r0, 0
	bl GetAnimBattlerSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080A9B04 @ =gUnknown_83E4200
	adds r0, r5, 0
	bl sub_80762D0
	ldr r1, _080A9B08 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	movs r1, 0x4
	strh r1, [r0, 0x24]
	b _080A9B34
	.align 2, 0
_080A9B00: .4byte gTasks
_080A9B04: .4byte gUnknown_83E4200
_080A9B08: .4byte gSprites
_080A9B0C:
	ldr r1, _080A9B3C @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r4, r0, r1
	ldrh r0, [r4, 0x24]
	negs r0, r0
	strh r0, [r4, 0x24]
	adds r0, r5, 0
	bl sub_8076308
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080A9B34
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080A9B34:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A9B3C: .4byte gSprites
	thumb_func_end sub_80A9AB0

	thumb_func_start sub_80A9B40
sub_80A9B40: @ 80A9B40
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	movs r0, 0x5F
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldr r5, _080A9B84 @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldrb r0, [r5]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r0, _080A9B88 @ =sub_80A9B8C
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A9B84: .4byte gBattleAnimTarget
_080A9B88: .4byte sub_80A9B8C
	thumb_func_end sub_80A9B40

	thumb_func_start sub_80A9B8C
sub_80A9B8C: @ 80A9B8C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	bne _080A9BB6
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xE
	bl Sin
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	b _080A9BBC
_080A9BB6:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A9BBC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A9B8C

	thumb_func_start sub_80A9BC4
sub_80A9BC4: @ 80A9BC4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080A9BE8
	ldr r1, _080A9BE4 @ =gBattleAnimArgs
	ldrh r0, [r1]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x32]
	adds r0, r2, 0x1
	strh r0, [r4, 0x2E]
	b _080A9C44
	.align 2, 0
_080A9BE4: .4byte gBattleAnimArgs
_080A9BE8:
	ldrh r0, [r4, 0x30]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x34]
	adds r0, 0x3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x34]
	cmp r0, 0x64
	ble _080A9C36
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	lsrs r0, r1, 31
	adds r0, r1, r0
	asrs r0, 1
	lsls r0, 1
	subs r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080A9C36:
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x78
	ble _080A9C44
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A9C44:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A9BC4

	thumb_func_start sub_80A9C4C
sub_80A9C4C: @ 80A9C4C
	push {lr}
	ldr r2, _080A9C70 @ =gBattleAnimArgs
	ldrh r1, [r2]
	strh r1, [r0, 0x20]
	movs r1, 0xA0
	strh r1, [r0, 0x22]
	ldrh r1, [r2, 0x4]
	strh r1, [r0, 0x2E]
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0x30]
	ldr r1, _080A9C74 @ =sub_8074C44
	str r1, [r0, 0x1C]
	ldr r1, _080A9C78 @ =sub_80A9C7C
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_080A9C70: .4byte gBattleAnimArgs
_080A9C74: .4byte sub_8074C44
_080A9C78: .4byte sub_80A9C7C
	thumb_func_end sub_80A9C4C

	thumb_func_start sub_80A9C7C
sub_80A9C7C: @ 80A9C7C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	lsls r0, 16
	lsrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x26]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	movs r1, 0x4
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x34]
	adds r0, 0x3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x26]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	lsls r0, 16
	asrs r5, r0, 16
	cmp r5, 0x48
	bgt _080A9CE2
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	lsrs r0, r1, 31
	adds r0, r1, r0
	asrs r0, 1
	lsls r0, 1
	subs r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	cmp r5, 0x40
	bgt _080A9CE2
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A9CE2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A9C7C

	thumb_func_start sub_80A9CE8
sub_80A9CE8: @ 80A9CE8
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080A9DA0 @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x3
	bl SetAnimBgAttribute
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl SetAnimBgAttribute
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080A9D2A
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0x1
	bl SetAnimBgAttribute
_080A9D2A:
	ldr r0, _080A9DA4 @ =gBattle_BG1_X
	movs r1, 0
	strh r1, [r0]
	ldr r4, _080A9DA8 @ =gBattle_BG1_Y
	strh r1, [r4]
	movs r0, 0x14
	movs r1, 0
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, 0x16
	bl SetGpuReg
	mov r0, sp
	bl sub_80752A0
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080A9DAC @ =gFile_graphics_battle_anims_backgrounds_attract_tilemap
	bl sub_807543C
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080A9DB0 @ =gFile_graphics_battle_anims_backgrounds_attract_sheet
	mov r2, sp
	ldrh r2, [r2, 0xA]
	bl AnimLoadCompressedBgGfx
	ldr r0, _080A9DB4 @ =gFile_graphics_battle_anims_backgrounds_attract_palette
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080A9D88
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80730C0
_080A9D88:
	ldr r0, _080A9DB8 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080A9DBC @ =sub_80A9DC0
	str r0, [r1]
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A9DA0: .4byte 0x00003f42
_080A9DA4: .4byte gBattle_BG1_X
_080A9DA8: .4byte gBattle_BG1_Y
_080A9DAC: .4byte gFile_graphics_battle_anims_backgrounds_attract_tilemap
_080A9DB0: .4byte gFile_graphics_battle_anims_backgrounds_attract_sheet
_080A9DB4: .4byte gFile_graphics_battle_anims_backgrounds_attract_palette
_080A9DB8: .4byte gTasks
_080A9DBC: .4byte sub_80A9DC0
	thumb_func_end sub_80A9CE8

	thumb_func_start sub_80A9DC0
sub_80A9DC0: @ 80A9DC0
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080A9DE8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x20
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x4
	bls _080A9DDE
	b _080A9F08
_080A9DDE:
	lsls r0, 2
	ldr r1, _080A9DEC @ =_080A9DF0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A9DE8: .4byte gTasks
_080A9DEC: .4byte _080A9DF0
	.align 2, 0
_080A9DF0:
	.4byte _080A9E04
	.4byte _080A9E48
	.4byte _080A9E6A
	.4byte _080A9EAE
	.4byte _080A9ED4
_080A9E04:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r4, r0, r2
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080A9F08
	strh r5, [r4, 0x1C]
	ldrh r1, [r4, 0x1E]
	adds r1, 0x1
	strh r1, [r4, 0x1E]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _080A9F08
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	strh r5, [r4, 0x1E]
	b _080A9F08
_080A9E48:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r2
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	strh r0, [r1, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8D
	bne _080A9F08
	movs r0, 0x10
	strh r0, [r1, 0x1E]
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	b _080A9F08
_080A9E6A:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r4, r0, r2
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080A9F08
	movs r0, 0
	strh r0, [r4, 0x1C]
	ldrh r1, [r4, 0x1E]
	subs r1, 0x1
	strh r1, [r4, 0x1E]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r2, 0x1E
	ldrsh r1, [r4, r2]
	cmp r1, 0
	bne _080A9F08
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	strh r1, [r4, 0x1E]
	b _080A9F08
_080A9EAE:
	mov r0, sp
	bl sub_80752A0
	mov r0, sp
	ldrb r0, [r0, 0x9]
	bl sub_8075358
	ldr r1, _080A9ED0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x20]
	adds r1, 0x1
	strh r1, [r0, 0x20]
	b _080A9F08
	.align 2, 0
_080A9ED0: .4byte gTasks
_080A9ED4:
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080A9EE8
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0
	bl SetAnimBgAttribute
_080A9EE8:
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x1
	bl SetAnimBgAttribute
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080A9F08:
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A9DC0

	thumb_func_start sub_80A9F10
sub_80A9F10: @ 80A9F10
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080A9F88 @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x1
	bl SetAnimBgAttribute
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl SetAnimBgAttribute
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080A9F52
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0x1
	bl SetAnimBgAttribute
_080A9F52:
	ldr r0, _080A9F8C @ =gBattle_BG1_X
	movs r1, 0
	strh r1, [r0]
	ldr r4, _080A9F90 @ =gBattle_BG1_Y
	strh r1, [r4]
	movs r0, 0x14
	movs r1, 0
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, 0x16
	bl SetGpuReg
	mov r0, sp
	bl sub_80752A0
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080A9F98
	ldr r0, _080A9F94 @ =gFile_graphics_battle_anims_backgrounds_scary_face_contest_tilemap
	ldr r1, [sp, 0x4]
	bl LZDecompressVram
	b _080A9FC6
	.align 2, 0
_080A9F88: .4byte 0x00003f42
_080A9F8C: .4byte gBattle_BG1_X
_080A9F90: .4byte gBattle_BG1_Y
_080A9F94: .4byte gFile_graphics_battle_anims_backgrounds_scary_face_contest_tilemap
_080A9F98:
	ldr r0, _080A9FB4 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A9FBC
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080A9FB8 @ =gFile_graphics_battle_anims_backgrounds_scary_face_player_tilemap
	bl sub_807543C
	b _080A9FC6
	.align 2, 0
_080A9FB4: .4byte gBattleAnimTarget
_080A9FB8: .4byte gFile_graphics_battle_anims_backgrounds_scary_face_player_tilemap
_080A9FBC:
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080AA010 @ =gFile_graphics_battle_anims_backgrounds_scary_face_opponent_tilemap
	bl sub_807543C
_080A9FC6:
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080AA014 @ =gFile_graphics_battle_anims_backgrounds_scary_face_sheet
	mov r2, sp
	ldrh r2, [r2, 0xA]
	bl AnimLoadCompressedBgGfx
	ldr r0, _080AA018 @ =gFile_graphics_battle_anims_backgrounds_scary_face_palette
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080A9FFA
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80730C0
_080A9FFA:
	ldr r0, _080AA01C @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080AA020 @ =sub_80AA024
	str r0, [r1]
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA010: .4byte gFile_graphics_battle_anims_backgrounds_scary_face_opponent_tilemap
_080AA014: .4byte gFile_graphics_battle_anims_backgrounds_scary_face_sheet
_080AA018: .4byte gFile_graphics_battle_anims_backgrounds_scary_face_palette
_080AA01C: .4byte gTasks
_080AA020: .4byte sub_80AA024
	thumb_func_end sub_80A9F10

	thumb_func_start sub_80AA024
sub_80AA024: @ 80AA024
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080AA04C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x20
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x4
	bls _080AA042
	b _080AA168
_080AA042:
	lsls r0, 2
	ldr r1, _080AA050 @ =_080AA054
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AA04C: .4byte gTasks
_080AA050: .4byte _080AA054
	.align 2, 0
_080AA054:
	.4byte _080AA068
	.4byte _080AA0AC
	.4byte _080AA0CE
	.4byte _080AA112
	.4byte _080AA134
_080AA068:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r4, r0, r2
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080AA168
	strh r5, [r4, 0x1C]
	ldrh r1, [r4, 0x1E]
	adds r1, 0x1
	strh r1, [r4, 0x1E]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0xE
	bne _080AA168
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	strh r5, [r4, 0x1E]
	b _080AA168
_080AA0AC:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r2
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	strh r0, [r1, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _080AA168
	movs r0, 0xE
	strh r0, [r1, 0x1E]
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	b _080AA168
_080AA0CE:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r4, r0, r2
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080AA168
	movs r0, 0
	strh r0, [r4, 0x1C]
	ldrh r1, [r4, 0x1E]
	subs r1, 0x1
	strh r1, [r4, 0x1E]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r2, 0x1E
	ldrsh r1, [r4, r2]
	cmp r1, 0
	bne _080AA168
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	strh r1, [r4, 0x1E]
	b _080AA168
_080AA112:
	mov r0, sp
	bl sub_80752A0
	movs r0, 0x1
	bl sub_8075358
	movs r0, 0x2
	bl sub_8075358
	ldr r0, _080AA170 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
_080AA134:
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080AA148
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0
	bl SetAnimBgAttribute
_080AA148:
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x1
	bl SetAnimBgAttribute
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080AA168:
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA170: .4byte gTasks
	thumb_func_end sub_80AA024

	thumb_func_start sub_80AA174
sub_80AA174: @ 80AA174
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080AA1C8 @ =gBattleAnimAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080AA1CC @ =gBattleAnimArgs
	ldrh r0, [r1]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x30]
	ldrb r0, [r5]
	bl GetBattlerSpriteSubpriority
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x3C]
	ldr r1, _080AA1D0 @ =sub_80AA1D4
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA1C8: .4byte gBattleAnimAttacker
_080AA1CC: .4byte gBattleAnimArgs
_080AA1D0: .4byte sub_80AA1D4
	thumb_func_end sub_80AA174

	thumb_func_start sub_80AA1D4
sub_80AA1D4: @ 80AA1D4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7F
	bhi _080AA1EA
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	b _080AA1EE
_080AA1EA:
	ldrh r0, [r4, 0x3C]
	subs r0, 0x1
_080AA1EE:
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	bl Sin
	strh r0, [r4, 0x24]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	ldrh r1, [r4, 0x34]
	lsls r1, 16
	asrs r1, 24
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x9
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r3, 0x38
	ldrsh r2, [r4, r3]
	cmp r2, 0
	beq _080AA260
	cmp r2, 0x1
	bne _080AA290
	ldr r1, _080AA258 @ =0xfffffc00
	adds r0, r1, 0
	ldrh r2, [r4, 0x32]
	adds r0, r2
	strh r0, [r4, 0x32]
	ldr r3, _080AA25C @ =0xffffff00
	adds r0, r3, 0
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080AA290
	movs r0, 0x2
	strh r0, [r4, 0x38]
	b _080AA2A0
	.align 2, 0
_080AA258: .4byte 0xfffffc00
_080AA25C: .4byte 0xffffff00
_080AA260:
	movs r3, 0x80
	lsls r3, 3
	adds r0, r3, 0
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	movs r3, 0x80
	lsls r3, 1
	adds r0, r3, 0
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x2E
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _080AA290
	strh r2, [r4, 0x36]
	movs r0, 0x1
	strh r0, [r4, 0x38]
_080AA290:
	ldr r0, _080AA2A8 @ =gBattleAnimArgs
	ldrh r1, [r0, 0xE]
	ldr r0, _080AA2AC @ =0x0000ffff
	cmp r1, r0
	bne _080AA2A0
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AA2A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA2A8: .4byte gBattleAnimArgs
_080AA2AC: .4byte 0x0000ffff
	thumb_func_end sub_80AA1D4

	thumb_func_start sub_80AA2B0
sub_80AA2B0: @ 80AA2B0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080AA2F8 @ =gBattleAnimAttacker
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
	ldr r4, _080AA2FC @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl Sin
	strh r0, [r5, 0x2E]
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0x7
	bl Cos
	strh r0, [r5, 0x30]
	ldr r0, _080AA300 @ =sub_80AA304
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA2F8: .4byte gBattleAnimAttacker
_080AA2FC: .4byte gBattleAnimArgs
_080AA300: .4byte sub_80AA304
	thumb_func_end sub_80AA2B0

	thumb_func_start sub_80AA304
sub_80AA304: @ 80AA304
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x30]
	ldrh r3, [r2, 0x26]
	adds r0, r3
	strh r0, [r2, 0x26]
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	movs r3, 0x24
	ldrsh r1, [r2, r3]
	adds r0, r1
	adds r0, 0x10
	movs r1, 0x88
	lsls r1, 1
	cmp r0, r1
	bhi _080AA342
	movs r0, 0x22
	ldrsh r1, [r2, r0]
	movs r3, 0x26
	ldrsh r0, [r2, r3]
	adds r1, r0
	cmp r1, 0xA0
	bgt _080AA342
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _080AA348
_080AA342:
	adds r0, r2, 0
	bl DestroyAnimSprite
_080AA348:
	pop {r0}
	bx r0
	thumb_func_end sub_80AA304

	thumb_func_start sub_80AA34C
sub_80AA34C: @ 80AA34C
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x30]
	ldrh r3, [r2, 0x26]
	adds r0, r3
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x34]
	adds r1, r0, 0x1
	strh r1, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x32
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _080AA378
	adds r0, r2, 0
	bl DestroyAnimSprite
_080AA378:
	pop {r0}
	bx r0
	thumb_func_end sub_80AA34C

	thumb_func_start sub_80AA37C
sub_80AA37C: @ 80AA37C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080AA3C8 @ =gBattleAnimAttacker
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
	ldr r4, _080AA3CC @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl Sin
	strh r0, [r5, 0x2E]
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0x7
	bl Cos
	strh r0, [r5, 0x30]
	ldrh r0, [r4, 0x2]
	strh r0, [r5, 0x32]
	ldr r0, _080AA3D0 @ =sub_80AA34C
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA3C8: .4byte gBattleAnimAttacker
_080AA3CC: .4byte gBattleAnimArgs
_080AA3D0: .4byte sub_80AA34C
	thumb_func_end sub_80AA37C

	thumb_func_start sub_80AA3D4
sub_80AA3D4: @ 80AA3D4
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080AA3EA
	adds r0, r2, 0
	bl DestroyAnimSprite
_080AA3EA:
	pop {r0}
	bx r0
	thumb_func_end sub_80AA3D4

	thumb_func_start sub_80AA3F0
sub_80AA3F0: @ 80AA3F0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _080AA404 @ =sub_80AA3D4
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA404: .4byte sub_80AA3D4
	thumb_func_end sub_80AA3F0

	thumb_func_start sub_80AA408
sub_80AA408: @ 80AA408
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080AA426
	ldr r0, _080AA498 @ =gBattleAnimArgs
	ldrh r1, [r0]
	ldrh r2, [r4, 0x20]
	adds r1, r2
	strh r1, [r4, 0x20]
	ldrh r0, [r0, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
_080AA426:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r5, r0, 1
	movs r0, 0xFF
	ands r5, r0
	adds r0, r5, 0
	movs r1, 0x50
	bl Sin
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x4F
	bgt _080AA46A
	adds r0, r5, 0
	movs r1, 0x50
	bl Cos
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	lsrs r2, r1, 31
	adds r1, r2
	asrs r1, 1
	lsls r0, 16
	asrs r0, 24
	adds r1, r0
	strh r1, [r4, 0x26]
_080AA46A:
	movs r0, 0x2E
	ldrsh r2, [r4, r0]
	cmp r2, 0x5A
	ble _080AA488
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	ldrh r0, [r4, 0x24]
	subs r0, r1
	strh r0, [r4, 0x24]
_080AA488:
	cmp r2, 0x64
	ble _080AA492
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AA492:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA498: .4byte gBattleAnimArgs
	thumb_func_end sub_80AA408

	thumb_func_start sub_80AA49C
sub_80AA49C: @ 80AA49C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	movs r1, 0x5
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x34]
	adds r0, 0x3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x34]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0x14
	ble _080AA4F2
	adds r1, r0, 0
	lsrs r0, r1, 31
	adds r0, r1, r0
	asrs r0, 1
	lsls r0, 1
	subs r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080AA4F2:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0x1E
	ble _080AA500
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AA500:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AA49C

	thumb_func_start sub_80AA508
sub_80AA508: @ 80AA508
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080AA52C
	ldr r1, _080AA528 @ =gBattleAnimArgs
	ldrh r0, [r1]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x32]
	adds r0, r2, 0x1
	strh r0, [r4, 0x2E]
	b _080AA580
	.align 2, 0
_080AA528: .4byte gBattleAnimArgs
_080AA52C:
	ldrh r0, [r4, 0x30]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	movs r5, 0
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl Sin
	adds r2, r0, 0
	strh r2, [r4, 0x26]
	ldrh r0, [r4, 0x34]
	adds r0, 0x3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x34]
	cmp r0, 0x46
	ble _080AA580
	ldr r0, _080AA588 @ =sub_80AA49C
	str r0, [r4, 0x1C]
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r1, [r4, 0x22]
	adds r0, r2, r1
	strh r0, [r4, 0x22]
	strh r5, [r4, 0x24]
	strh r5, [r4, 0x26]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xB4
	bl __umodsi3
	strh r0, [r4, 0x34]
_080AA580:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA588: .4byte sub_80AA49C
	thumb_func_end sub_80AA508

	thumb_func_start sub_80AA58C
sub_80AA58C: @ 80AA58C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080AA5C6
	ldr r1, _080AA688 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
	ldr r0, _080AA68C @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSpriteSubpriority
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	movs r0, 0x1
	strh r0, [r4, 0x32]
_080AA5C6:
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r0, r2
	strh r0, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsls r1, r0, 2
	adds r0, r1, 0
	cmp r1, 0
	bge _080AA5DC
	adds r0, 0xFF
_080AA5DC:
	asrs r0, 8
	lsls r0, 8
	subs r0, r1, r0
	strh r0, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	bge _080AA5EE
	movs r0, 0
	strh r0, [r4, 0x30]
_080AA5EE:
	movs r0, 0x30
	ldrsh r2, [r4, r0]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _080AA5FC
	adds r0, 0x3
_080AA5FC:
	asrs r0, 2
	movs r1, 0x1E
	subs r1, r0
	adds r0, r2, 0
	bl Cos
	strh r0, [r4, 0x24]
	movs r0, 0x30
	ldrsh r2, [r4, r0]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _080AA618
	adds r0, 0x7
_080AA618:
	asrs r0, 3
	movs r1, 0xA
	subs r1, r0
	adds r0, r2, 0
	bl Sin
	strh r0, [r4, 0x26]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0x80
	ble _080AA63C
	ldrh r1, [r4, 0x32]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080AA63C
	ldr r0, _080AA690 @ =0x0000ffff
	strh r0, [r4, 0x32]
_080AA63C:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080AA650
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bge _080AA650
	movs r0, 0x1
	strh r0, [r4, 0x32]
_080AA650:
	ldrh r0, [r4, 0x34]
	adds r1, r0, 0x1
	strh r1, [r4, 0x34]
	subs r0, 0x9
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x46
	bls _080AA694
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsrs r0, r1, 31
	adds r0, r1, r0
	asrs r0, 1
	lsls r0, 1
	subs r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _080AA6A2
	.align 2, 0
_080AA688: .4byte gBattleAnimArgs
_080AA68C: .4byte gBattleAnimTarget
_080AA690: .4byte 0x0000ffff
_080AA694:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080AA6A2:
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x5A
	ble _080AA6B0
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AA6B0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AA58C

	thumb_func_start sub_80AA6B8
sub_80AA6B8: @ 80AA6B8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080AA6EC
	ldr r1, _080AA6E8 @ =gBattleAnimArgs
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
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080AA700
	.align 2, 0
_080AA6E8: .4byte gBattleAnimArgs
_080AA6EC:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080AA700
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AA700:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AA6B8

	thumb_func_start sub_80AA708
sub_80AA708: @ 80AA708
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r1, _080AA720 @ =gBattleAnimArgs
	movs r2, 0x4
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080AA724
	adds r0, r5, 0
	bl DestroyAnimSprite
	b _080AA788
	.align 2, 0
_080AA720: .4byte gBattleAnimArgs
_080AA724:
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080AA734
	ldr r4, _080AA730 @ =gBattleAnimAttacker
	b _080AA736
	.align 2, 0
_080AA730: .4byte gBattleAnimAttacker
_080AA734:
	ldr r4, _080AA764 @ =gBattleAnimTarget
_080AA736:
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
	ldr r0, _080AA768 @ =gBattleAnimArgs
	movs r2, 0x2
	ldrsh r1, [r0, r2]
	adds r2, r0, 0
	cmp r1, 0
	bne _080AA76C
	ldrh r0, [r5, 0x20]
	adds r0, 0x20
	b _080AA770
	.align 2, 0
_080AA764: .4byte gBattleAnimTarget
_080AA768: .4byte gBattleAnimArgs
_080AA76C:
	ldrh r0, [r5, 0x20]
	subs r0, 0x20
_080AA770:
	strh r0, [r5, 0x20]
	ldrh r0, [r2, 0x4]
	strh r0, [r5, 0x2E]
	ldrh r1, [r2, 0x2]
	strh r1, [r5, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r0, _080AA790 @ =sub_80AA794
	str r0, [r5, 0x1C]
_080AA788:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA790: .4byte sub_80AA794
	thumb_func_end sub_80AA708

	thumb_func_start sub_80AA794
sub_80AA794: @ 80AA794
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080AA7C4
	ldrh r0, [r2, 0x2E]
	subs r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	cmp r0, 0
	beq _080AA7BE
	ldrh r1, [r2, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r2, 0
	bl StartSpriteAnim
	b _080AA7C4
_080AA7BE:
	adds r0, r2, 0
	bl DestroyAnimSprite
_080AA7C4:
	pop {r0}
	bx r0
	thumb_func_end sub_80AA794

	thumb_func_start sub_80AA7C8
sub_80AA7C8: @ 80AA7C8
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080AA7FC @ =gBattleAnimArgs
	ldrb r0, [r0]
	bl GetAnimBattlerSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _080AA800 @ =gTasks
	adds r4, r0
	ldr r2, _080AA804 @ =gUnknown_83E4410
	adds r0, r4, 0
	bl sub_80762D0
	ldr r0, _080AA808 @ =sub_80AA80C
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA7FC: .4byte gBattleAnimArgs
_080AA800: .4byte gTasks
_080AA804: .4byte gUnknown_83E4410
_080AA808: .4byte sub_80AA80C
	thumb_func_end sub_80AA7C8

	thumb_func_start sub_80AA80C
sub_80AA80C: @ 80AA80C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080AA834 @ =gTasks
	adds r0, r1
	bl sub_8076308
	lsls r0, 24
	cmp r0, 0
	bne _080AA82C
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080AA82C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA834: .4byte gTasks
	thumb_func_end sub_80AA80C

	thumb_func_start sub_80AA838
sub_80AA838: @ 80AA838
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r0, _080AA84C @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080AA854
	ldr r0, _080AA850 @ =gBattleAnimAttacker
	b _080AA856
	.align 2, 0
_080AA84C: .4byte gBattleAnimArgs
_080AA850: .4byte gBattleAnimAttacker
_080AA854:
	ldr r0, _080AA8EC @ =gBattleAnimTarget
_080AA856:
	ldrb r6, [r0]
	adds r0, r6, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080AA870
	ldr r1, _080AA8F0 @ =gBattleAnimArgs
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080AA870:
	adds r0, r6, 0
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	ldr r7, _080AA8F0 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r3, [r7, 0x2]
	adds r0, r3
	movs r4, 0
	strh r0, [r5, 0x20]
	adds r0, r6, 0
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r7, 0x4]
	adds r0, r1
	strh r0, [r5, 0x22]
	strh r4, [r5, 0x2E]
	ldrh r1, [r5, 0x20]
	lsls r1, 3
	strh r1, [r5, 0x30]
	lsls r0, 3
	strh r0, [r5, 0x32]
	movs r2, 0x2
	ldrsh r0, [r7, r2]
	lsls r0, 3
	cmp r0, 0
	bge _080AA8B0
	adds r0, 0x7
_080AA8B0:
	asrs r0, 3
	strh r0, [r5, 0x34]
	movs r3, 0x4
	ldrsh r0, [r7, r3]
	lsls r0, 3
	cmp r0, 0
	bge _080AA8C0
	adds r0, 0x7
_080AA8C0:
	asrs r0, 3
	strh r0, [r5, 0x36]
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	movs r3, 0x6
	ldrsh r0, [r7, r3]
	lsls r0, 4
	adds r1, r0
	ldr r3, _080AA8F4 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080AA8F8 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldr r0, _080AA8FC @ =sub_80AA900
	str r0, [r5, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AA8EC: .4byte gBattleAnimTarget
_080AA8F0: .4byte gBattleAnimArgs
_080AA8F4: .4byte 0x000003ff
_080AA8F8: .4byte 0xfffffc00
_080AA8FC: .4byte sub_80AA900
	thumb_func_end sub_80AA838

	thumb_func_start sub_80AA900
sub_80AA900: @ 80AA900
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x34]
	ldrh r1, [r2, 0x30]
	adds r0, r1
	strh r0, [r2, 0x30]
	ldrh r1, [r2, 0x36]
	ldrh r3, [r2, 0x32]
	adds r1, r3
	strh r1, [r2, 0x32]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r1, 19
	strh r1, [r2, 0x22]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080AA934
	adds r0, r2, 0
	bl DestroyAnimSprite
_080AA934:
	pop {r0}
	bx r0
	thumb_func_end sub_80AA900

	thumb_func_start sub_80AA938
sub_80AA938: @ 80AA938
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080AA95A
	ldr r0, _080AA994 @ =gBattleAnimArgs
	ldrh r1, [r0]
	movs r0, 0x78
	subs r0, r1
	strh r0, [r4, 0x30]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080AA95A:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080AA978
	ldrb r0, [r4, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	movs r1, 0
	bl sub_8075B48
_080AA978:
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	adds r0, 0x50
	cmp r1, r0
	bne _080AA98C
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AA98C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA994: .4byte gBattleAnimArgs
	thumb_func_end sub_80AA938

	thumb_func_start sub_80AA998
sub_80AA998: @ 80AA998
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080AA9C6
	movs r5, 0x78
	strh r5, [r6, 0x20]
	ldr r4, _080AAA48 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r0, [r4, r2]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	subs r0, 0xF
	strh r0, [r6, 0x22]
	ldrb r1, [r4, 0x2]
	adds r0, r6, 0
	bl StartSpriteAnim
	strh r5, [r6, 0x38]
	ldrh r0, [r4, 0x4]
	strh r0, [r6, 0x34]
_080AA9C6:
	ldrh r0, [r6, 0x2E]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r6, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r6, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r6, 0x30]
	movs r2, 0x2E
	ldrsh r0, [r6, r2]
	lsls r4, r0, 1
	adds r4, r0
	ldrh r0, [r6, 0x34]
	adds r4, r0
	movs r2, 0xFF
	ldrh r0, [r6, 0x3A]
	adds r0, 0xA
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r6, 0x3A]
	ands r4, r2
	adds r0, r4, 0
	movs r1, 0x64
	bl Cos
	strh r0, [r6, 0x24]
	adds r0, r4, 0
	movs r1, 0xA
	bl Sin
	adds r4, r0, 0
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	movs r1, 0x4
	bl Cos
	ldrh r2, [r6, 0x30]
	adds r4, r2
	adds r0, r4
	strh r0, [r6, 0x26]
	movs r0, 0x2E
	ldrsh r1, [r6, r0]
	movs r2, 0x38
	ldrsh r0, [r6, r2]
	cmp r1, r0
	ble _080AAA42
	ldr r0, _080AAA4C @ =sub_80AAA50
	str r0, [r6, 0x1C]
	strh r5, [r6, 0x2E]
	adds r0, r6, 0
	bl SetSpritePrimaryCoordsFromSecondaryCoords
	movs r0, 0x5
	strh r0, [r6, 0x32]
	strh r5, [r6, 0x36]
	strh r5, [r6, 0x34]
	adds r0, r6, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080AAA42:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AAA48: .4byte gBattleAnimArgs
_080AAA4C: .4byte sub_80AAA50
	thumb_func_end sub_80AA998

	thumb_func_start sub_80AAA50
sub_80AAA50: @ 80AAA50
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	ble _080AAA6A
	movs r0, 0
	strh r0, [r1, 0x2E]
	ldr r0, _080AAA70 @ =sub_80AAA74
	str r0, [r1, 0x1C]
_080AAA6A:
	pop {r0}
	bx r0
	.align 2, 0
_080AAA70: .4byte sub_80AAA74
	thumb_func_end sub_80AAA50

	thumb_func_start sub_80AAA74
sub_80AAA74: @ 80AAA74
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x32]
	ldrh r2, [r4, 0x34]
	adds r0, r1, r2
	strh r0, [r4, 0x34]
	strh r0, [r4, 0x26]
	adds r1, 0x1
	strh r1, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x30
	ble _080AAA9E
	lsls r0, r1, 16
	cmp r0, 0
	ble _080AAA9E
	ldrh r0, [r4, 0x36]
	subs r1, r0, 0x5
	strh r1, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x36]
_080AAA9E:
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	ble _080AAAD0
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	lsrs r0, r1, 31
	adds r0, r1, r0
	asrs r0, 1
	lsls r0, 1
	subs r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AAAD0:
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bne _080AAADE
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AAADE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AAA74

	thumb_func_start sub_80AAAE4
sub_80AAAE4: @ 80AAAE4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080AAB28 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AAB30
	ldr r4, _080AAB2C @ =gBattleAnimAttacker
	ldrb r1, [r4]
	movs r0, 0x2
	eors r0, r1
	bl IsBattlerSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080AAB30
	ldrb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x20
	adds r3, r5, 0
	adds r3, 0x22
	movs r1, 0
	bl sub_8076D9C
	ldrh r0, [r5, 0x22]
	adds r0, 0x28
	strh r0, [r5, 0x22]
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	b _080AAB50
	.align 2, 0
_080AAB28: .4byte gBattleTypeFlags
_080AAB2C: .4byte gBattleAnimAttacker
_080AAB30:
	ldr r4, _080AAB70 @ =gBattleAnimAttacker
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
	adds r0, 0x28
	strh r0, [r5, 0x22]
_080AAB50:
	movs r0, 0xD
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	subs r0, 0x48
	strh r0, [r5, 0x36]
	ldr r0, _080AAB74 @ =StartAnimLinearTranslation
	str r0, [r5, 0x1C]
	ldr r1, _080AAB78 @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AAB70: .4byte gBattleAnimAttacker
_080AAB74: .4byte StartAnimLinearTranslation
_080AAB78: .4byte DestroyAnimSprite
	thumb_func_end sub_80AAAE4

	thumb_func_start sub_80AAB7C
sub_80AAB7C: @ 80AAB7C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080AAB98 @ =gBattleAnimArgs
	ldr r1, _080AAB9C @ =gAnimDisableStructPtr
	ldr r1, [r1]
	ldrb r2, [r1, 0x10]
	movs r1, 0x1
	ands r1, r2
	strh r1, [r3, 0xE]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080AAB98: .4byte gBattleAnimArgs
_080AAB9C: .4byte gAnimDisableStructPtr
	thumb_func_end sub_80AAB7C

	thumb_func_start update_fury_cutter_counter_copy
update_fury_cutter_counter_copy: @ 80AABA0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080AABB8 @ =gBattleAnimArgs
	ldr r1, _080AABBC @ =gAnimDisableStructPtr
	ldr r1, [r1]
	ldrb r1, [r1, 0x10]
	strh r1, [r2, 0xE]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080AABB8: .4byte gBattleAnimArgs
_080AABBC: .4byte gAnimDisableStructPtr
	thumb_func_end update_fury_cutter_counter_copy

	.align 2, 0 @ Don't pad with nop.
