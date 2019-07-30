	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start unc_080B08A0
unc_080B08A0: @ 80B08A0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080B08D0 @ =gBattleAnimArgs
	movs r0, 0
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl sub_8074FF8
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	movs r0, 0xF
	strh r0, [r4, 0x2E]
	ldr r0, _080B08D4 @ =sub_8074C44
	str r0, [r4, 0x1C]
	ldr r1, _080B08D8 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B08D0: .4byte gBattleAnimArgs
_080B08D4: .4byte sub_8074C44
_080B08D8: .4byte DestroyAnimSprite
	thumb_func_end unc_080B08A0

	thumb_func_start sub_80B08DC
sub_80B08DC: @ 80B08DC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080B0920 @ =gBattleAnimArgs
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080B0904
	ldr r0, _080B0924 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B0904
	ldrh r0, [r4, 0x2]
	negs r0, r0
	strh r0, [r4, 0x2]
	ldrh r0, [r4, 0x6]
	negs r0, r0
	strh r0, [r4, 0x6]
_080B0904:
	ldr r4, _080B0920 @ =gBattleAnimArgs
	ldrb r1, [r4, 0xC]
	adds r0, r5, 0
	bl StartSpriteAnim
	movs r0, 0
	strh r0, [r4, 0xC]
	adds r0, r5, 0
	bl sub_8075F0C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B0920: .4byte gBattleAnimArgs
_080B0924: .4byte gBattleAnimAttacker
	thumb_func_end sub_80B08DC

	thumb_func_start sub_80B0928
sub_80B0928: @ 80B0928
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080B0944
	ldr r0, _080B0950 @ =gBattleAnimArgs
	ldrh r1, [r0, 0x2]
	negs r1, r1
	strh r1, [r0, 0x2]
	ldrh r1, [r0, 0x6]
	negs r1, r1
	strh r1, [r0, 0x6]
_080B0944:
	adds r0, r4, 0
	bl sub_80B08DC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0950: .4byte gBattleAnimArgs
	thumb_func_end sub_80B0928

	thumb_func_start sub_80B0954
sub_80B0954: @ 80B0954
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080B0974 @ =gBattleAnimArgs
	ldrb r1, [r4, 0x8]
	bl StartSpriteAnim
	movs r1, 0x6
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B0978
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8075160
	b _080B0980
	.align 2, 0
_080B0974: .4byte gBattleAnimArgs
_080B0978:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8075114
_080B0980:
	ldr r0, _080B0998 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r5, 0x2E]
	ldr r0, _080B099C @ =sub_8074C44
	str r0, [r5, 0x1C]
	ldr r1, _080B09A0 @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B0998: .4byte gBattleAnimArgs
_080B099C: .4byte sub_8074C44
_080B09A0: .4byte DestroyAnimSprite
	thumb_func_end sub_80B0954

	thumb_func_start sub_80B09A4
sub_80B09A4: @ 80B09A4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	ldr r0, _080B09C0 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r9, r0
	cmp r1, 0
	bne _080B09C8
	ldr r0, _080B09C4 @ =gBattleAnimAttacker
	b _080B09CA
	.align 2, 0
_080B09C0: .4byte gBattleAnimArgs
_080B09C4: .4byte gBattleAnimAttacker
_080B09C8:
	ldr r0, _080B0B10 @ =gBattleAnimTarget
_080B09CA:
	ldrb r0, [r0]
	mov r8, r0
	mov r4, r9
	movs r3, 0x4
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bge _080B09E8
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x5
	bl __umodsi3
	strh r0, [r4, 0x4]
_080B09E8:
	ldrb r1, [r4, 0x4]
	adds r0, r5, 0
	bl StartSpriteAnim
	mov r0, r8
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	mov r0, r8
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	mov r0, r8
	movs r1, 0x1
	bl sub_8076B2C
	lsls r0, 16
	asrs r1, r0, 16
	lsrs r0, 31
	adds r1, r0
	lsls r1, 15
	lsrs r6, r1, 16
	mov r0, r8
	movs r1, 0
	bl sub_8076B2C
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080B0A32
	adds r0, 0x3
_080B0A32:
	lsls r4, r0, 14
	lsrs r4, 16
	bl Random
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r6, 16
	asrs r1, 16
	bl __modsi3
	lsls r0, 16
	lsrs r6, r0, 16
	bl Random
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 16
	asrs r4, 16
	adds r1, r4, 0
	bl __modsi3
	lsls r0, 16
	lsrs r4, r0, 16
	bl Random
	movs r7, 0x1
	adds r1, r7, 0
	ands r1, r0
	cmp r1, 0
	beq _080B0A74
	lsls r0, r6, 16
	negs r0, r0
	lsrs r6, r0, 16
_080B0A74:
	bl Random
	adds r1, r7, 0
	ands r1, r0
	cmp r1, 0
	beq _080B0A86
	lsls r0, r4, 16
	negs r0, r0
	lsrs r4, r0, 16
_080B0A86:
	ldr r0, _080B0B14 @ =gUnknown_2023BD6
	add r0, r8
	ldrb r1, [r0]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	bne _080B0A9C
	lsls r0, r4, 16
	ldr r1, _080B0B18 @ =0xfff00000
	adds r0, r1
	lsrs r4, r0, 16
_080B0A9C:
	lsls r0, r6, 16
	asrs r0, 16
	ldrh r2, [r5, 0x20]
	adds r0, r2
	strh r0, [r5, 0x20]
	lsls r0, r4, 16
	asrs r0, 16
	ldrh r3, [r5, 0x22]
	adds r0, r3
	strh r0, [r5, 0x22]
	mov r1, r9
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x2E]
	ldr r0, _080B0B1C @ =gUnknown_83E7C08
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	movs r3, 0x22
	ldrsh r2, [r5, r3]
	adds r3, r5, 0
	adds r3, 0x43
	ldrb r3, [r3]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x3C]
	cmp r0, 0x40
	beq _080B0B00
	movs r0, 0x3C
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080B0B20 @ =gSprites
	adds r0, r4
	movs r1, 0
	bl StartSpriteAffineAnim
	movs r2, 0x3C
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _080B0B24 @ =SpriteCallbackDummy
	str r1, [r0]
_080B0B00:
	ldr r0, _080B0B28 @ =sub_80B0B2C
	str r0, [r5, 0x1C]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0B10: .4byte gBattleAnimTarget
_080B0B14: .4byte gUnknown_2023BD6
_080B0B18: .4byte 0xfff00000
_080B0B1C: .4byte gUnknown_83E7C08
_080B0B20: .4byte gSprites
_080B0B24: .4byte SpriteCallbackDummy
_080B0B28: .4byte sub_80B0B2C
	thumb_func_end sub_80B09A4

	thumb_func_start sub_80B0B2C
sub_80B0B2C: @ 80B0B2C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _080B0B74
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0x40
	beq _080B0B68
	ldr r4, _080B0B70 @ =gSprites
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	movs r0, 0x3C
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
_080B0B68:
	adds r0, r5, 0
	bl DestroyAnimSprite
	b _080B0B78
	.align 2, 0
_080B0B70: .4byte gSprites
_080B0B74:
	subs r0, r1, 0x1
	strh r0, [r5, 0x2E]
_080B0B78:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80B0B2C

	thumb_func_start sub_80B0B80
sub_80B0B80: @ 80B0B80
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075114
	movs r0, 0x1E
	strh r0, [r4, 0x2E]
	ldr r0, _080B0BA0 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B0BA4
	ldrh r0, [r4, 0x20]
	subs r0, 0x14
	strh r0, [r4, 0x32]
	b _080B0BB6
	.align 2, 0
_080B0BA0: .4byte gBattleAnimArgs
_080B0BA4:
	ldrh r0, [r4, 0x20]
	adds r0, 0x14
	strh r0, [r4, 0x32]
	adds r2, r4, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_080B0BB6:
	ldrh r0, [r4, 0x22]
	subs r0, 0x14
	strh r0, [r4, 0x36]
	ldr r0, _080B0BD0 @ =sub_8075590
	str r0, [r4, 0x1C]
	ldr r1, _080B0BD4 @ =sub_80B0BD8
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0BD0: .4byte sub_8075590
_080B0BD4: .4byte sub_80B0BD8
	thumb_func_end sub_80B0B80

	thumb_func_start sub_80B0BD8
sub_80B0BD8: @ 80B0BD8
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x38]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r5, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	bne _080B0C18
	ldrh r2, [r5, 0x20]
	ldrh r4, [r5, 0x24]
	subs r0, r2, r4
	strh r0, [r5, 0x32]
	ldrh r1, [r5, 0x22]
	ldrh r3, [r5, 0x26]
	subs r0, r1, r3
	strh r0, [r5, 0x36]
	movs r0, 0x8
	strh r0, [r5, 0x2E]
	adds r2, r4
	strh r2, [r5, 0x20]
	adds r1, r3
	strh r1, [r5, 0x22]
	strh r6, [r5, 0x26]
	strh r6, [r5, 0x24]
	ldr r0, _080B0C20 @ =sub_8075590
	str r0, [r5, 0x1C]
	ldr r1, _080B0C24 @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
_080B0C18:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B0C20: .4byte sub_8075590
_080B0C24: .4byte DestroyAnimSprite
	thumb_func_end sub_80B0BD8

	thumb_func_start sub_80B0C28
sub_80B0C28: @ 80B0C28
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _080B0CA4 @ =gBattleAnimAttacker
	ldrb r1, [r0]
	movs r0, 0x2
	ldr r2, _080B0CA8 @ =gBattleAnimTarget
	eors r0, r1
	ldrb r1, [r2]
	cmp r0, r1
	bne _080B0C54
	ldrb r0, [r2]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080B0C54
	ldr r1, _080B0CAC @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1]
_080B0C54:
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_8075114
	ldr r0, _080B0CA4 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B0C72
	ldr r1, _080B0CAC @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080B0C72:
	ldr r4, _080B0CAC @ =gBattleAnimArgs
	ldrh r0, [r4, 0x6]
	movs r5, 0
	strh r0, [r6, 0x2E]
	ldrh r0, [r6, 0x20]
	strh r0, [r6, 0x30]
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrh r0, [r6, 0x22]
	strh r0, [r6, 0x34]
	strh r0, [r6, 0x36]
	adds r0, r6, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldrh r0, [r4, 0xA]
	strh r0, [r6, 0x38]
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x3A]
	strh r5, [r6, 0x3C]
	ldr r0, _080B0CB0 @ =sub_80B0CB4
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B0CA4: .4byte gBattleAnimAttacker
_080B0CA8: .4byte gBattleAnimTarget
_080B0CAC: .4byte gBattleAnimArgs
_080B0CB0: .4byte sub_80B0CB4
	thumb_func_end sub_80B0C28

	thumb_func_start sub_80B0CB4
sub_80B0CB4: @ 80B0CB4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	bne _080B0CE0
	ldrh r0, [r4, 0x3C]
	lsls r0, 16
	asrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	ldrh r2, [r4, 0x3C]
	adds r0, r2
	strh r0, [r4, 0x3C]
	b _080B0CE6
_080B0CE0:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B0CE6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B0CB4

	thumb_func_start sub_80B0CEC
sub_80B0CEC: @ 80B0CEC
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075114
	ldr r5, _080B0D18 @ =gBattleAnimArgs
	ldrb r1, [r5, 0x4]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldr r0, _080B0D1C @ =sub_8074C44
	str r0, [r4, 0x1C]
	ldr r1, _080B0D20 @ =sub_80B0D24
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B0D18: .4byte gBattleAnimArgs
_080B0D1C: .4byte sub_8074C44
_080B0D20: .4byte sub_80B0D24
	thumb_func_end sub_80B0CEC

	thumb_func_start sub_80B0D24
sub_80B0D24: @ 80B0D24
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	ldr r0, _080B0D50 @ =sub_8074C44
	str r0, [r4, 0x1C]
	ldr r1, _080B0D54 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0D50: .4byte sub_8074C44
_080B0D54: .4byte DestroyAnimSprite
	thumb_func_end sub_80B0D24

	thumb_func_start sub_80B0D58
sub_80B0D58: @ 80B0D58
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075114
	ldr r0, _080B0D74 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldr r0, _080B0D78 @ =sub_80B0D7C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0D74: .4byte gBattleAnimArgs
_080B0D78: .4byte sub_80B0D7C
	thumb_func_end sub_80B0D58

	thumb_func_start sub_80B0D7C
sub_80B0D7C: @ 80B0D7C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x2E]
	subs r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080B0DC0
	movs r0, 0x6
	strh r0, [r5, 0x2E]
	ldr r4, _080B0DC8 @ =gBattleAnimTarget
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
	ldr r0, _080B0DCC @ =sub_8075590
	str r0, [r5, 0x1C]
	ldr r1, _080B0DD0 @ =sub_80B0DD4
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
_080B0DC0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B0DC8: .4byte gBattleAnimTarget
_080B0DCC: .4byte sub_8075590
_080B0DD0: .4byte sub_80B0DD4
	thumb_func_end sub_80B0D7C

	thumb_func_start sub_80B0DD4
sub_80B0DD4: @ 80B0DD4
	push {lr}
	movs r1, 0xF
	strh r1, [r0, 0x2E]
	ldr r1, _080B0DE8 @ =sub_8074C44
	str r1, [r0, 0x1C]
	ldr r1, _080B0DEC @ =DestroyAnimSprite
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_080B0DE8: .4byte sub_8074C44
_080B0DEC: .4byte DestroyAnimSprite
	thumb_func_end sub_80B0DD4

	thumb_func_start sub_80B0DF0
sub_80B0DF0: @ 80B0DF0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B0E1C
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8075114
	ldr r1, _080B0E18 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080B0E78
	.align 2, 0
_080B0E18: .4byte gBattleAnimArgs
_080B0E1C:
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
	ble _080B0E6A
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
_080B0E6A:
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x78
	ble _080B0E78
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B0E78:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B0DF0

	thumb_func_start sub_80B0E80
sub_80B0E80: @ 80B0E80
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080B0E94 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B0E9C
	ldr r4, _080B0E98 @ =gBattleAnimAttacker
	b _080B0E9E
	.align 2, 0
_080B0E94: .4byte gBattleAnimArgs
_080B0E98: .4byte gBattleAnimAttacker
_080B0E9C:
	ldr r4, _080B0EE4 @ =gBattleAnimTarget
_080B0E9E:
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
	ldr r1, _080B0EE8 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	ldrh r2, [r5, 0x20]
	adds r0, r2
	movs r2, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r1, 0x4]
	ldrh r3, [r5, 0x22]
	adds r0, r3
	strh r0, [r5, 0x22]
	strh r2, [r5, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x32]
	strh r2, [r5, 0x34]
	ldr r0, _080B0EEC @ =sub_80B0EF0
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B0EE4: .4byte gBattleAnimTarget
_080B0EE8: .4byte gBattleAnimArgs
_080B0EEC: .4byte sub_80B0EF0
	thumb_func_end sub_80B0E80

	thumb_func_start sub_80B0EF0
sub_80B0EF0: @ 80B0EF0
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	cmp r2, 0
	beq _080B0F02
	cmp r2, 0x1
	beq _080B0F26
	b _080B0F60
_080B0F02:
	ldrh r0, [r1, 0x30]
	subs r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080B0F60
	movs r2, 0x32
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080B0F1E
	adds r0, r1, 0
	bl DestroyAnimSprite
	b _080B0F60
_080B0F1E:
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	b _080B0F60
_080B0F26:
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B0F4E
	movs r0, 0
	strh r0, [r1, 0x30]
	ldrh r0, [r1, 0x34]
	adds r0, 0x1
	strh r0, [r1, 0x34]
	ands r0, r2
	lsls r0, 16
	cmp r0, 0
	beq _080B0F4A
	movs r0, 0x2
	b _080B0F4C
_080B0F4A:
	ldr r0, _080B0F64 @ =0x0000fffe
_080B0F4C:
	strh r0, [r1, 0x24]
_080B0F4E:
	ldrh r0, [r1, 0x32]
	subs r0, 0x1
	strh r0, [r1, 0x32]
	lsls r0, 16
	cmp r0, 0
	bne _080B0F60
	adds r0, r1, 0
	bl DestroyAnimSprite
_080B0F60:
	pop {r0}
	bx r0
	.align 2, 0
_080B0F64: .4byte 0x0000fffe
	thumb_func_end sub_80B0EF0

	thumb_func_start sub_80B0F68
sub_80B0F68: @ 80B0F68
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080B0F8C @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080B0F94
	ldr r4, _080B0F90 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r6, 0x4]
	adds r0, r2
	b _080B0FA6
	.align 2, 0
_080B0F8C: .4byte gBattleAnimArgs
_080B0F90: .4byte gBattleAnimAttacker
_080B0F94:
	ldr r4, _080B0FF0 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x4]
	adds r0, r1
_080B0FA6:
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x6]
	adds r0, r6
	strh r0, [r5, 0x22]
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	ldr r3, _080B0FF4 @ =gBattleAnimArgs
	movs r4, 0x2
	ldrsh r0, [r3, r4]
	lsls r0, 4
	adds r1, r0
	ldr r4, _080B0FF8 @ =0x000003ff
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _080B0FFC @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	movs r1, 0
	movs r0, 0
	strh r0, [r5, 0x2E]
	movs r2, 0x2
	ldrsh r0, [r3, r2]
	cmp r0, 0x1
	beq _080B1014
	cmp r0, 0x1
	bgt _080B1000
	cmp r0, 0
	beq _080B100A
	b _080B103A
	.align 2, 0
_080B0FF0: .4byte gBattleAnimTarget
_080B0FF4: .4byte gBattleAnimArgs
_080B0FF8: .4byte 0x000003ff
_080B0FFC: .4byte 0xfffffc00
_080B1000:
	cmp r0, 0x2
	beq _080B1024
	cmp r0, 0x3
	beq _080B1034
	b _080B103A
_080B100A:
	ldr r0, _080B1010 @ =0x0000fffd
	b _080B1034
	.align 2, 0
_080B1010: .4byte 0x0000fffd
_080B1014:
	movs r0, 0x3
	strh r0, [r5, 0x3A]
	ldr r0, _080B1020 @ =0x0000fffd
	strh r0, [r5, 0x3C]
	b _080B1042
	.align 2, 0
_080B1020: .4byte 0x0000fffd
_080B1024:
	ldr r0, _080B1030 @ =0x0000fffd
	strh r0, [r5, 0x3A]
	movs r0, 0x3
	strh r0, [r5, 0x3C]
	b _080B1042
	.align 2, 0
_080B1030: .4byte 0x0000fffd
_080B1034:
	strh r0, [r5, 0x3A]
	strh r0, [r5, 0x3C]
	b _080B1042
_080B103A:
	adds r0, r5, 0
	bl DestroyAnimSprite
	b _080B1046
_080B1042:
	ldr r0, _080B104C @ =sub_80B1050
	str r0, [r5, 0x1C]
_080B1046:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B104C: .4byte sub_80B1050
	thumb_func_end sub_80B0F68

	thumb_func_start sub_80B1050
sub_80B1050: @ 80B1050
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x3A]
	ldrh r2, [r1, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r1, 0x3C]
	ldrh r2, [r1, 0x22]
	adds r0, r2
	strh r0, [r1, 0x22]
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x28
	ble _080B1078
	adds r0, r1, 0
	bl DestroyAnimSprite
_080B1078:
	pop {r0}
	bx r0
	thumb_func_end sub_80B1050

	thumb_func_start sub_80B107C
sub_80B107C: @ 80B107C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080B10C8 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B10D8
	ldr r4, _080B10CC @ =sBattler_AI
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
	ldr r0, _080B10D0 @ =gBattleAnimAttacker
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
	ldr r0, _080B10D4 @ =gBattleAnimTarget
	b _080B10F4
	.align 2, 0
_080B10C8: .4byte gBattleAnimArgs
_080B10CC: .4byte sBattler_AI
_080B10D0: .4byte gBattleAnimAttacker
_080B10D4: .4byte gBattleAnimTarget
_080B10D8:
	ldr r0, _080B1110 @ =gBattleAnimTarget
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
	ldr r0, _080B1114 @ =gBattleAnimAttacker
_080B10F4:
	ldrb r0, [r0]
	strh r0, [r5, 0x3C]
	movs r0, 0
	strh r0, [r5, 0x2E]
	movs r0, 0xC
	strh r0, [r5, 0x30]
	movs r0, 0x8
	strh r0, [r5, 0x32]
	ldr r0, _080B1118 @ =sub_80B111C
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1110: .4byte gBattleAnimTarget
_080B1114: .4byte gBattleAnimAttacker
_080B1118: .4byte sub_80B111C
	thumb_func_end sub_80B107C

	thumb_func_start sub_80B111C
sub_80B111C: @ 80B111C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB4
	bne _080B1178
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x10
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r1, _080B1180 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080B1184 @ =sub_807563C
	str r0, [r4, 0x1C]
_080B1178:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1180: .4byte move_anim_8074EE0
_080B1184: .4byte sub_807563C
	thumb_func_end sub_80B111C

	thumb_func_start sub_80B1188
sub_80B1188: @ 80B1188
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080B11D4 @ =gBattleAnimArgs
	ldrh r0, [r4]
	strh r0, [r5, 0x20]
	movs r2, 0x78
	strh r2, [r5, 0x22]
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x2E]
	adds r0, r5, 0
	adds r0, 0x36
	adds r1, r5, 0
	adds r1, 0x38
	lsls r2, 8
	bl sub_80765C0
	ldrh r0, [r4, 0x2]
	strh r0, [r5, 0x3A]
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	movs r3, 0x4
	ldrsh r0, [r4, r3]
	lsls r0, 2
	adds r1, r0
	ldr r3, _080B11D8 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080B11DC @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldr r0, _080B11E0 @ =sub_80B11E4
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B11D4: .4byte gBattleAnimArgs
_080B11D8: .4byte 0x000003ff
_080B11DC: .4byte 0xfffffc00
_080B11E0: .4byte sub_80B11E4
	thumb_func_end sub_80B1188

	thumb_func_start sub_80B11E4
sub_80B11E4: @ 80B11E4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r7, r1]
	cmp r0, 0
	beq _080B1236
	movs r2, 0x36
	ldrsh r0, [r7, r2]
	movs r2, 0x38
	ldrsh r1, [r7, r2]
	bl sub_80765C8
	adds r4, r0, 0
	movs r1, 0x3A
	ldrsh r0, [r7, r1]
	subs r4, r0
	adds r0, r7, 0
	adds r0, 0x36
	adds r1, r7, 0
	adds r1, 0x38
	adds r2, r4, 0
	bl sub_80765C0
	asrs r4, 8
	strh r4, [r7, 0x22]
	lsls r4, 16
	asrs r4, 16
	movs r0, 0x8
	negs r0, r0
	cmp r4, r0
	bge _080B122E
	adds r0, r7, 0
	bl DestroyAnimSprite
	b _080B128C
_080B122E:
	ldrh r0, [r7, 0x2E]
	subs r0, 0x1
	strh r0, [r7, 0x2E]
	b _080B128C
_080B1236:
	ldr r4, _080B1298 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r2, _080B129C @ =gBattleAnimTarget
	mov r8, r2
	ldrb r0, [r2]
	movs r1, 0x2
	bl sub_8074480
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	subs r4, r6
	strh r4, [r7, 0x2E]
	lsrs r0, 24
	subs r0, r5
	strh r0, [r7, 0x30]
	ldrh r0, [r7, 0x20]
	lsls r0, 4
	strh r0, [r7, 0x32]
	ldrh r0, [r7, 0x22]
	lsls r0, 4
	strh r0, [r7, 0x34]
	ldr r0, _080B12A0 @ =sub_80B12A4
	str r0, [r7, 0x1C]
_080B128C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1298: .4byte gBattleAnimAttacker
_080B129C: .4byte gBattleAnimTarget
_080B12A0: .4byte sub_80B12A4
	thumb_func_end sub_80B11E4

	thumb_func_start sub_80B12A4
sub_80B12A4: @ 80B12A4
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	ldrh r1, [r2, 0x30]
	ldrh r3, [r2, 0x34]
	adds r1, r3
	strh r1, [r2, 0x34]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r3, r1, 20
	strh r3, [r2, 0x22]
	adds r0, 0x8
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bhi _080B12DE
	adds r1, r3, 0
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	blt _080B12DE
	cmp r1, 0x78
	ble _080B12E4
_080B12DE:
	adds r0, r2, 0
	bl DestroyAnimSprite
_080B12E4:
	pop {r0}
	bx r0
	thumb_func_end sub_80B12A4

	thumb_func_start sub_80B12E8
sub_80B12E8: @ 80B12E8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080B131C @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B132C
	ldr r4, _080B1320 @ =sBattler_AI
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
	ldr r0, _080B1324 @ =gBattleAnimTarget
	ldrb r4, [r0]
	ldr r0, _080B1328 @ =gBattleAnimAttacker
	b _080B1332
	.align 2, 0
_080B131C: .4byte gBattleAnimArgs
_080B1320: .4byte sBattler_AI
_080B1324: .4byte gBattleAnimTarget
_080B1328: .4byte gBattleAnimAttacker
_080B132C:
	ldr r0, _080B1364 @ =gBattleAnimAttacker
	ldrb r4, [r0]
	ldr r0, _080B1368 @ =gBattleAnimTarget
_080B1332:
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
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080B136C
	ldrb r2, [r5, 0x3]
	lsls r1, r2, 26
	lsrs r1, 27
	movs r0, 0x8
	orrs r1, r0
	lsls r1, 1
	subs r0, 0x47
	b _080B1386
	.align 2, 0
_080B1364: .4byte gBattleAnimAttacker
_080B1368: .4byte gBattleAnimTarget
_080B136C:
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B138C
	ldrb r2, [r5, 0x3]
	lsls r1, r2, 26
	lsrs r1, 27
	movs r0, 0x18
	orrs r1, r0
	lsls r1, 1
	subs r0, 0x57
_080B1386:
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x3]
_080B138C:
	movs r0, 0x10
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r1, _080B13CC @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080B13D0 @ =sub_807563C
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B13CC: .4byte DestroyAnimSprite
_080B13D0: .4byte sub_807563C
	thumb_func_end sub_80B12E8

	thumb_func_start sub_80B13D4
sub_80B13D4: @ 80B13D4
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080B13EA
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B13EA:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B13D4

	thumb_func_start sub_80B13F8
sub_80B13F8: @ 80B13F8
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r4, _080B1474 @ =gBattleAnimTarget
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
	ldr r1, _080B1478 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x30]
	ldrh r0, [r1]
	strh r0, [r5, 0x32]
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x34]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x36]
	ldr r0, _080B147C @ =gAnimMoveTurn
	ldrb r6, [r0]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B1442
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_080B1442:
	movs r0, 0x1
	ands r6, r0
	cmp r6, 0
	beq _080B1456
	ldrh r0, [r5, 0x32]
	negs r0, r0
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
_080B1456:
	ldrh r1, [r5, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	ldrh r0, [r5, 0x32]
	strh r0, [r5, 0x24]
	ldrh r0, [r5, 0x34]
	strh r0, [r5, 0x26]
	ldr r0, _080B1480 @ =sub_80B13D4
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B1474: .4byte gBattleAnimTarget
_080B1478: .4byte gBattleAnimArgs
_080B147C: .4byte gAnimMoveTurn
_080B1480: .4byte sub_80B13D4
	thumb_func_end sub_80B13F8

	thumb_func_start sub_80B1484
sub_80B1484: @ 80B1484
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080B149C @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B14A0
	adds r0, r4, 0
	movs r1, 0
	bl sub_8075160
	b _080B14A8
	.align 2, 0
_080B149C: .4byte gBattleAnimArgs
_080B14A0:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8075114
_080B14A8:
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080B14BC
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	b _080B14D2
_080B14BC:
	ldr r0, _080B14E4 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B14D2
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080B14D2:
	ldr r0, _080B14E8 @ =sub_8074F6C
	str r0, [r4, 0x1C]
	ldr r1, _080B14EC @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B14E4: .4byte gBattleAnimAttacker
_080B14E8: .4byte sub_8074F6C
_080B14EC: .4byte DestroyAnimSprite
	thumb_func_end sub_80B1484

	thumb_func_start sub_80B14F0
sub_80B14F0: @ 80B14F0
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080B152A
	ldrh r0, [r4, 0x30]
	adds r0, 0x28
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x2
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x28
	ble _080B152A
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B152A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B14F0

	thumb_func_start sub_80B1530
sub_80B1530: @ 80B1530
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080B1560 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080B1568
	cmp r0, 0x1
	bgt _080B1582
	cmp r0, 0
	bne _080B1582
	movs r0, 0
	bl sub_8075458
	ldr r0, _080B1564 @ =gBattleAnimArgs
	ldrh r0, [r0]
	strh r0, [r4, 0x18]
	b _080B157A
	.align 2, 0
_080B1560: .4byte gTasks
_080B1564: .4byte gBattleAnimArgs
_080B1568:
	ldrh r0, [r4, 0x18]
	subs r0, 0x1
	strh r0, [r4, 0x18]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080B158E
_080B157A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B158E
_080B1582:
	movs r2, 0xA0
	lsls r2, 3
	adds r0, r2, 0
	ldrh r1, [r4, 0x1A]
	adds r0, r1
	strh r0, [r4, 0x1A]
_080B158E:
	movs r2, 0xB0
	lsls r2, 4
	adds r0, r2, 0
	ldrh r1, [r4, 0x1C]
	adds r0, r1
	strh r0, [r4, 0x1C]
	ldr r0, _080B15BC @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B15C4
	ldr r1, _080B15C0 @ =gBattle_BG3_X
	ldrh r0, [r4, 0x1A]
	lsls r0, 16
	asrs r0, 24
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	adds r7, r1, 0
	b _080B15D4
	.align 2, 0
_080B15BC: .4byte gBattleAnimTarget
_080B15C0: .4byte gBattle_BG3_X
_080B15C4:
	ldr r2, _080B1614 @ =gBattle_BG3_X
	ldrh r1, [r4, 0x1A]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r2]
	subs r0, r1
	strh r0, [r2]
	adds r7, r2, 0
_080B15D4:
	ldr r3, _080B1618 @ =gBattle_BG3_Y
	ldrh r2, [r4, 0x1C]
	lsls r0, r2, 16
	asrs r0, 24
	ldrh r1, [r3]
	adds r0, r1
	strh r0, [r3]
	movs r0, 0xFF
	ldrb r1, [r4, 0x1A]
	movs r5, 0
	strh r1, [r4, 0x1A]
	ands r0, r2
	strh r0, [r4, 0x1C]
	ldr r0, _080B161C @ =gBattleAnimArgs
	movs r2, 0xE
	ldrsh r1, [r0, r2]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080B160C
	strh r5, [r7]
	strh r5, [r3]
	movs r0, 0x1
	bl sub_8075458
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080B160C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1614: .4byte gBattle_BG3_X
_080B1618: .4byte gBattle_BG3_Y
_080B161C: .4byte gBattleAnimArgs
	thumb_func_end sub_80B1530

	.align 2, 0 @ Don't pad with nop.
