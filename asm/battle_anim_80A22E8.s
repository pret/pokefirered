	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

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

	thumb_func_start sub_80AF108
sub_80AF108: @ 80AF108
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x7
	ldr r3, _080AF210 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080AF214 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldr r4, _080AF218 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r4, _080AF21C @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r0, [r4]
	movs r1, 0x3
	str r3, [sp]
	bl sub_8074480
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080AF220 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x2E]
	ldrh r0, [r1]
	ldr r3, [sp]
	adds r0, r3
	strh r0, [r5, 0x30]
	ldrh r0, [r1, 0x4]
	mov r4, r9
	adds r0, r4, r0
	strh r0, [r5, 0x32]
	ldrh r0, [r1, 0x2]
	adds r0, r6
	strh r0, [r5, 0x34]
	ldrh r0, [r1, 0x6]
	mov r7, r8
	adds r0, r7, r0
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_8074C80
	adds r4, 0x20
	movs r0, 0x98
	lsls r0, 1
	mov r12, r0
	ldr r3, [sp]
	cmp r4, r12
	bhi _080AF1E2
	adds r0, r7, 0
	adds r0, 0x20
	ldrh r1, [r5, 0x30]
	ldrh r2, [r5, 0x32]
	cmp r0, 0xE0
	bhi _080AF1E2
	adds r4, r1, 0
	mov r10, r12
_080AF1AE:
	mov r7, r9
	lsls r1, r7, 16
	asrs r1, 16
	adds r1, r4
	lsls r1, 16
	mov r7, r8
	lsls r0, r7, 16
	asrs r0, 16
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsrs r0, r1, 16
	mov r9, r0
	movs r7, 0x80
	lsls r7, 14
	adds r1, r7
	lsrs r1, 16
	cmp r1, r10
	bhi _080AF1E2
	mov r1, r8
	lsls r0, r1, 16
	adds r0, r7
	lsrs r0, 16
	cmp r0, 0xE0
	bls _080AF1AE
_080AF1E2:
	ldrh r0, [r5, 0x30]
	negs r7, r0
	strh r7, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	negs r4, r0
	strh r4, [r5, 0x32]
	lsls r0, r3, 16
	movs r1, 0x80
	lsls r1, 14
	adds r0, r1
	lsrs r0, 16
	movs r2, 0x98
	lsls r2, 1
	mov r12, r2
	ldr r1, _080AF220 @ =gBattleAnimArgs
	mov r10, r1
	cmp r0, r12
	bhi _080AF24E
	lsls r1, r6, 16
	movs r2, 0x80
	lsls r2, 14
	adds r0, r1, r2
	b _080AF246
	.align 2, 0
_080AF210: .4byte 0x000003ff
_080AF214: .4byte 0xfffffc00
_080AF218: .4byte gBattleAnimTarget
_080AF21C: .4byte gBattleAnimAttacker
_080AF220: .4byte gBattleAnimArgs
_080AF224:
	lsls r1, r3, 16
	asrs r1, 16
	adds r1, r7
	lsls r1, 16
	asrs r0, r2, 16
	adds r0, r4
	lsls r0, 16
	lsrs r6, r0, 16
	lsrs r3, r1, 16
	movs r0, 0x80
	lsls r0, 14
	adds r1, r0
	lsrs r1, 16
	cmp r1, r12
	bhi _080AF24E
	lsls r1, r6, 16
	adds r0, r1, r0
_080AF246:
	lsrs r0, 16
	adds r2, r1, 0
	cmp r0, 0xE0
	bls _080AF224
_080AF24E:
	strh r3, [r5, 0x20]
	strh r6, [r5, 0x22]
	mov r1, r10
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x2E]
	strh r3, [r5, 0x30]
	mov r2, r9
	strh r2, [r5, 0x32]
	strh r6, [r5, 0x34]
	mov r3, r8
	strh r3, [r5, 0x36]
	adds r0, r5, 0
	bl sub_8074C80
	mov r7, r10
	ldrh r0, [r7, 0xA]
	strh r0, [r5, 0x34]
	ldrh r0, [r7, 0xC]
	strh r0, [r5, 0x36]
	ldr r0, _080AF288 @ =sub_80AF28C
	str r0, [r5, 0x1C]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF288: .4byte sub_80AF28C
	thumb_func_end sub_80AF108

	thumb_func_start sub_80AF28C
sub_80AF28C: @ 80AF28C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080AF2E4
	ldrh r1, [r4, 0x30]
	ldrh r2, [r4, 0x38]
	adds r1, r2
	strh r1, [r4, 0x38]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x3A]
	adds r0, r2
	strh r0, [r4, 0x3A]
	strh r1, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x36]
	ldrh r2, [r4, 0x3C]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3C]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	b _080AF2EA
_080AF2E4:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AF2EA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AF28C

	thumb_func_start sub_80AF2F0
sub_80AF2F0: @ 80AF2F0
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080AF324 @ =gBattleAnimArgs
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
	ldr r1, _080AF328 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r1, _080AF32C @ =sub_8074AE0
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AF324: .4byte gBattleAnimArgs
_080AF328: .4byte DestroyAnimSprite
_080AF32C: .4byte sub_8074AE0
	thumb_func_end sub_80AF2F0

	thumb_func_start sub_80AF330
sub_80AF330: @ 80AF330
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _080AF364 @ =gBattleAnimTarget
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldr r0, _080AF368 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AF370
	ldr r0, _080AF36C @ =gBattleAnimArgs
	ldrh r1, [r4, 0x32]
	ldrh r0, [r0, 0x4]
	subs r1, r0
	strh r1, [r4, 0x32]
	b _080AF37A
	.align 2, 0
_080AF364: .4byte gBattleAnimTarget
_080AF368: .4byte gBattleAnimAttacker
_080AF36C: .4byte gBattleAnimArgs
_080AF370:
	ldr r0, _080AF3A8 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
_080AF37A:
	ldr r0, _080AF3AC @ =gBattleAnimTarget
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	ldr r1, _080AF3A8 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r2, [r1, 0x6]
	adds r0, r2
	strh r0, [r4, 0x36]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x2E]
	ldr r1, _080AF3B0 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080AF3B4 @ =sub_8075590
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AF3A8: .4byte gBattleAnimArgs
_080AF3AC: .4byte gBattleAnimTarget
_080AF3B0: .4byte DestroyAnimSprite
_080AF3B4: .4byte sub_8075590
	thumb_func_end sub_80AF330

	thumb_func_start sub_80AF3B8
sub_80AF3B8: @ 80AF3B8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080AF3D0 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080AF3D4
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8075114
	b _080AF40A
	.align 2, 0
_080AF3D0: .4byte gBattleAnimArgs
_080AF3D4:
	ldr r0, _080AF41C @ =gBattleAnimTarget
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0x1
	bl sub_8076D9C
	ldr r0, _080AF420 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AF3FA
	ldrh r0, [r5]
	negs r0, r0
	strh r0, [r5]
_080AF3FA:
	ldrh r0, [r5]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
_080AF40A:
	ldr r1, _080AF424 @ =sub_80AF42C
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080AF428 @ =sub_8074F50
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AF41C: .4byte gBattleAnimTarget
_080AF420: .4byte gBattleAnimAttacker
_080AF424: .4byte sub_80AF42C
_080AF428: .4byte sub_8074F50
	thumb_func_end sub_80AF3B8

	thumb_func_start sub_80AF42C
sub_80AF42C: @ 80AF42C
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
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _080AF462
	adds r0, r3, 0
	bl move_anim_8074EE0
_080AF462:
	pop {r0}
	bx r0
	thumb_func_end sub_80AF42C

	thumb_func_start sub_80AF468
sub_80AF468: @ 80AF468
	push {r4-r7,lr}
	sub sp, 0x10
	adds r5, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r6, _080AF4B0 @ =gBattleAnimArgs
	ldrh r0, [r6, 0x8]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	movs r1, 0xA
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080AF4B8
	ldr r4, _080AF4B4 @ =gBattleAnimTarget
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
	ldrh r6, [r6, 0x6]
	adds r0, r6
	strh r0, [r5, 0x36]
	b _080AF4CA
	.align 2, 0
_080AF4B0: .4byte gBattleAnimArgs
_080AF4B4: .4byte gBattleAnimTarget
_080AF4B8:
	ldr r0, _080AF4E4 @ =gBattleAnimTarget
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x32
	adds r3, r5, 0
	adds r3, 0x36
	movs r1, 0x1
	bl sub_8076D9C
_080AF4CA:
	ldr r0, _080AF4E8 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AF4F0
	ldr r0, _080AF4EC @ =gBattleAnimArgs
	ldrh r1, [r5, 0x32]
	ldrh r0, [r0, 0x4]
	subs r1, r0
	strh r1, [r5, 0x32]
	b _080AF4FA
	.align 2, 0
_080AF4E4: .4byte gBattleAnimTarget
_080AF4E8: .4byte gBattleAnimAttacker
_080AF4EC: .4byte gBattleAnimArgs
_080AF4F0:
	ldr r0, _080AF598 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	ldrh r2, [r5, 0x32]
	adds r0, r2
	strh r0, [r5, 0x32]
_080AF4FA:
	adds r7, r5, 0
	adds r7, 0x2E
	adds r2, r7, 0
	mov r1, sp
	movs r4, 0x7
_080AF504:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080AF504
	adds r0, r5, 0
	bl sub_8075804
	ldrh r0, [r5, 0x30]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	eors r0, r1
	strh r0, [r5, 0x32]
_080AF526:
	movs r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r5, 0
	bl sub_807578C
	movs r0, 0x20
	ldrsh r1, [r5, r0]
	movs r2, 0x24
	ldrsh r0, [r5, r2]
	adds r1, r0
	adds r1, 0x10
	movs r0, 0x88
	lsls r0, 1
	cmp r1, r0
	bhi _080AF55A
	movs r0, 0x22
	ldrsh r1, [r5, r0]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	adds r1, r0
	cmp r1, 0xA0
	bgt _080AF55A
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _080AF526
_080AF55A:
	ldrh r0, [r5, 0x24]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r1, [r5, 0x26]
	strh r1, [r5, 0x24]
	ldr r6, _080AF59C @ =sub_8075830
	ldr r1, _080AF5A0 @ =sub_80AF5A4
	mov r3, sp
	adds r2, r7, 0
	movs r4, 0x7
_080AF57A:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, 0x2
	adds r2, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080AF57A
	str r6, [r5, 0x1C]
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF598: .4byte gBattleAnimArgs
_080AF59C: .4byte sub_8075830
_080AF5A0: .4byte sub_80AF5A4
	thumb_func_end sub_80AF468

	thumb_func_start sub_80AF5A4
sub_80AF5A4: @ 80AF5A4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	movs r5, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r5, [r4, 0x26]
	strh r5, [r4, 0x24]
	movs r0, 0x80
	strh r0, [r4, 0x2E]
	ldr r0, _080AF600 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	ldr r1, _080AF604 @ =0x0000ffec
	cmp r0, 0
	beq _080AF5D4
	movs r1, 0x14
_080AF5D4:
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	lsls r1, 16
	asrs r1, 16
	bl Sin
	strh r0, [r4, 0x34]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0xF
	bl Cos
	strh r0, [r4, 0x36]
	strh r5, [r4, 0x38]
	ldr r1, _080AF608 @ =sub_80AF60C
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AF600: .4byte gBattleAnimAttacker
_080AF604: .4byte 0x0000ffec
_080AF608: .4byte sub_80AF60C
	thumb_func_end sub_80AF5A4

	thumb_func_start sub_80AF60C
sub_80AF60C: @ 80AF60C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080AF660 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	ldr r1, _080AF664 @ =0x0000ffec
	cmp r0, 0
	beq _080AF622
	movs r1, 0x14
_080AF622:
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	cmp r0, 0x1F
	bgt _080AF668
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	lsls r1, 16
	asrs r1, 16
	bl Sin
	ldrh r1, [r4, 0x34]
	subs r0, r1
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0xF
	bl Cos
	ldrh r1, [r4, 0x36]
	subs r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x10
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	b _080AF686
	.align 2, 0
_080AF660: .4byte gBattleAnimAttacker
_080AF664: .4byte 0x0000ffec
_080AF668:
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x26]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x36]
	strh r1, [r4, 0x34]
	ldr r0, _080AF68C @ =sub_80AF690
	str r0, [r4, 0x1C]
_080AF686:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AF68C: .4byte sub_80AF690
	thumb_func_end sub_80AF60C

	thumb_func_start sub_80AF690
sub_80AF690: @ 80AF690
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_807578C
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	adds r0, r1
	adds r0, 0x10
	movs r1, 0x88
	lsls r1, 1
	cmp r0, r1
	bhi _080AF6CC
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r1, r0, r1
	movs r0, 0x80
	lsls r0, 1
	cmp r1, r0
	bgt _080AF6CC
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _080AF6D2
_080AF6CC:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AF6D2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AF690

	thumb_func_start sub_80AF6D8
sub_80AF6D8: @ 80AF6D8
	push {r4-r7,lr}
	sub sp, 0x10
	adds r5, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r1, _080AF71C @ =gBattleAnimArgs
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080AF724
	ldr r4, _080AF720 @ =gBattleAnimTarget
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
	b _080AF736
	.align 2, 0
_080AF71C: .4byte gBattleAnimArgs
_080AF720: .4byte gBattleAnimTarget
_080AF724:
	ldr r0, _080AF754 @ =gBattleAnimTarget
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x32
	adds r3, r5, 0
	adds r3, 0x36
	movs r1, 0x1
	bl sub_8076D9C
_080AF736:
	ldr r0, _080AF758 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AF760
	ldr r0, _080AF75C @ =gBattleAnimArgs
	ldrh r1, [r5, 0x32]
	ldrh r2, [r0, 0x4]
	subs r1, r2
	strh r1, [r5, 0x32]
	adds r1, r0, 0
	b _080AF76A
	.align 2, 0
_080AF754: .4byte gBattleAnimTarget
_080AF758: .4byte gBattleAnimAttacker
_080AF75C: .4byte gBattleAnimArgs
_080AF760:
	ldr r1, _080AF814 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	ldrh r2, [r5, 0x32]
	adds r0, r2
	strh r0, [r5, 0x32]
_080AF76A:
	ldrh r0, [r1, 0x6]
	ldrh r1, [r5, 0x36]
	adds r0, r1
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_8075804
	adds r7, r5, 0
	adds r7, 0x2E
	adds r2, r7, 0
	mov r1, sp
	movs r4, 0x7
_080AF782:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080AF782
	ldrh r0, [r5, 0x30]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	eors r0, r1
	strh r0, [r5, 0x32]
_080AF79E:
	movs r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r5, 0
	bl sub_807578C
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	movs r2, 0x24
	ldrsh r0, [r5, r2]
	adds r1, r0
	adds r1, 0x10
	movs r0, 0x88
	lsls r0, 1
	cmp r1, r0
	bhi _080AF7D2
	movs r0, 0x22
	ldrsh r1, [r5, r0]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	adds r1, r0
	cmp r1, 0xA0
	bgt _080AF7D2
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _080AF79E
_080AF7D2:
	ldrh r0, [r5, 0x24]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r1, [r5, 0x26]
	strh r1, [r5, 0x24]
	ldr r1, _080AF814 @ =gBattleAnimArgs
	ldr r6, _080AF818 @ =sub_80AF81C
	mov r3, sp
	adds r2, r7, 0
	movs r4, 0x7
_080AF7F2:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, 0x2
	adds r2, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080AF7F2
	ldrh r0, [r1, 0xA]
	strh r0, [r5, 0x38]
	ldrh r0, [r1, 0xC]
	strh r0, [r5, 0x3A]
	str r6, [r5, 0x1C]
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF814: .4byte gBattleAnimArgs
_080AF818: .4byte sub_80AF81C
	thumb_func_end sub_80AF6D8

	thumb_func_start sub_80AF81C
sub_80AF81C: @ 80AF81C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_807578C
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080AF830
	movs r0, 0x1
	strh r0, [r4, 0x2E]
_080AF830:
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	ldrh r2, [r4, 0x3C]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3C]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080AF886
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	adds r0, r1
	adds r0, 0x10
	movs r1, 0x88
	lsls r1, 1
	cmp r0, r1
	bhi _080AF880
	movs r0, 0x22
	ldrsh r1, [r4, r0]
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	adds r1, r0
	cmp r1, 0xA0
	bgt _080AF880
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _080AF886
_080AF880:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AF886:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AF81C

	thumb_func_start sub_80AF88C
sub_80AF88C: @ 80AF88C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080AF8F8
	ldr r5, _080AF8AC @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080AF8B0
	adds r0, r4, 0
	movs r1, 0
	bl sub_8075114
	b _080AF8E6
	.align 2, 0
_080AF8AC: .4byte gBattleAnimArgs
_080AF8B0:
	ldr r0, _080AF8F0 @ =gBattleAnimTarget
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0
	bl sub_8076D9C
	ldr r0, _080AF8F4 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AF8D6
	ldrh r0, [r5]
	negs r0, r0
	strh r0, [r5]
_080AF8D6:
	ldrh r0, [r5]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
_080AF8E6:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080AF90C
	.align 2, 0
_080AF8F0: .4byte gBattleAnimTarget
_080AF8F4: .4byte gBattleAnimAttacker
_080AF8F8:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080AF90C
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AF90C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80AF88C

	thumb_func_start sub_80AF914
sub_80AF914: @ 80AF914
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080AF934 @ =gBattleAnimArgs
	movs r1, 0x8
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080AF984
	movs r1, 0xA
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080AF938
	adds r0, r5, 0
	movs r1, 0
	bl sub_8075160
	b _080AF976
	.align 2, 0
_080AF934: .4byte gBattleAnimArgs
_080AF938:
	ldr r4, _080AF960 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x20
	adds r3, r5, 0
	adds r3, 0x22
	movs r1, 0
	bl sub_8076D9C
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AF964
	ldrh r0, [r5, 0x20]
	ldrh r1, [r6]
	subs r0, r1
	b _080AF96A
	.align 2, 0
_080AF960: .4byte gBattleAnimAttacker
_080AF964:
	ldrh r0, [r6]
	ldrh r1, [r5, 0x20]
	adds r0, r1
_080AF96A:
	strh r0, [r5, 0x20]
	ldr r0, _080AF97C @ =gBattleAnimArgs
	ldrh r0, [r0, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
_080AF976:
	ldr r0, _080AF980 @ =gBattleAnimAttacker
	b _080AF9D4
	.align 2, 0
_080AF97C: .4byte gBattleAnimArgs
_080AF980: .4byte gBattleAnimAttacker
_080AF984:
	movs r1, 0xA
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080AF996
	adds r0, r5, 0
	movs r1, 0
	bl sub_8075114
	b _080AF9D2
_080AF996:
	ldr r4, _080AF9BC @ =gBattleAnimTarget
	ldrb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x20
	adds r3, r5, 0
	adds r3, 0x22
	movs r1, 0
	bl sub_8076D9C
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AF9C0
	ldrh r0, [r5, 0x20]
	ldrh r1, [r6]
	subs r0, r1
	b _080AF9C6
	.align 2, 0
_080AF9BC: .4byte gBattleAnimTarget
_080AF9C0:
	ldrh r0, [r6]
	ldrh r1, [r5, 0x20]
	adds r0, r1
_080AF9C6:
	strh r0, [r5, 0x20]
	ldr r0, _080AF9F0 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
_080AF9D2:
	ldr r0, _080AF9F4 @ =gBattleAnimTarget
_080AF9D4:
	ldrb r0, [r0]
	strh r0, [r5, 0x3C]
	ldr r0, _080AF9F0 @ =gBattleAnimArgs
	movs r1, 0xA
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080AF9EC
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	bne _080AF9F8
_080AF9EC:
	movs r0, 0x20
	b _080AF9FA
	.align 2, 0
_080AF9F0: .4byte gBattleAnimArgs
_080AF9F4: .4byte gBattleAnimTarget
_080AF9F8:
	movs r0, 0x40
_080AF9FA:
	strh r0, [r5, 0x3A]
	ldr r0, _080AFA40 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080AFA10
	ldrh r0, [r5, 0x22]
	adds r0, 0x8
	strh r0, [r5, 0x22]
_080AFA10:
	ldr r1, _080AFA44 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	ldrh r1, [r1, 0x4]
	adds r0, r1
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl obj_translate_based_on_private_1_2_3_4
	movs r0, 0x40
	strh r0, [r5, 0x38]
	ldr r1, _080AFA48 @ =sub_80AFA4C
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AFA40: .4byte gBattleAnimTarget
_080AFA44: .4byte gBattleAnimArgs
_080AFA48: .4byte sub_80AFA4C
	thumb_func_end sub_80AF914

	thumb_func_start sub_80AFA4C
sub_80AFA4C: @ 80AFA4C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	bne _080AFAD6
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x3A
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	movs r1, 0x6
	negs r1, r1
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7F
	bhi _080AFAA8
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
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
	b _080AFACA
_080AFAA8:
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
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
_080AFACA:
	ldrh r0, [r4, 0x38]
	adds r0, 0x3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	b _080AFADC
_080AFAD6:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AFADC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AFA4C

	thumb_func_start sub_80AFAE4
sub_80AFAE4: @ 80AFAE4
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080AFBA0 @ =0x00003f42
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
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080AFB26
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0x1
	bl SetAnimBgAttribute
_080AFB26:
	ldr r0, _080AFBA4 @ =gBattle_BG1_X
	movs r1, 0
	strh r1, [r0]
	ldr r4, _080AFBA8 @ =gBattle_BG1_Y
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
	ldr r1, _080AFBAC @ =gUnknown_83C3540
	movs r2, 0x80
	lsls r2, 4
	mov r3, sp
	ldrh r3, [r3, 0xA]
	bl LoadBgTiles
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080AFBB0 @ =gFile_graphics_battle_anims_backgrounds_fog_tilemap
	bl sub_807543C
	ldr r0, _080AFBB4 @ =gUnknown_83C2CE0
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadPalette
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080AFB88
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80730C0
_080AFB88:
	ldr r0, _080AFBB8 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080AFBBC @ =sub_80AFBC0
	str r0, [r1]
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AFBA0: .4byte 0x00003f42
_080AFBA4: .4byte gBattle_BG1_X
_080AFBA8: .4byte gBattle_BG1_Y
_080AFBAC: .4byte gUnknown_83C3540
_080AFBB0: .4byte gFile_graphics_battle_anims_backgrounds_fog_tilemap
_080AFBB4: .4byte gUnknown_83C2CE0
_080AFBB8: .4byte gTasks
_080AFBBC: .4byte sub_80AFBC0
	thumb_func_end sub_80AFAE4

	thumb_func_start sub_80AFBC0
sub_80AFBC0: @ 80AFBC0
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080AFBF4 @ =gBattle_BG1_X
	ldr r2, _080AFBF8 @ =0x0000ffff
	adds r0, r2, 0
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	ldr r1, _080AFBFC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x20
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x4
	bls _080AFBEA
	b _080AFD36
_080AFBEA:
	lsls r0, 2
	ldr r1, _080AFC00 @ =_080AFC04
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AFBF4: .4byte gBattle_BG1_X
_080AFBF8: .4byte 0x0000ffff
_080AFBFC: .4byte gTasks
_080AFC00: .4byte _080AFC04
	.align 2, 0
_080AFC04:
	.4byte _080AFC18
	.4byte _080AFC70
	.4byte _080AFC92
	.4byte _080AFCD6
	.4byte _080AFCF8
_080AFC18:
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
	beq _080AFC32
	b _080AFD36
_080AFC32:
	strh r5, [r4, 0x1C]
	ldrh r0, [r4, 0x1A]
	adds r0, 0x1
	strh r0, [r4, 0x1A]
	ldr r1, _080AFC6C @ =gUnknown_83E64D4
	movs r2, 0x1A
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r1, [r0]
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
	cmp r0, 0x9
	bne _080AFD36
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	strh r5, [r4, 0x1E]
	b _080AFD36
	.align 2, 0
_080AFC6C: .4byte gUnknown_83E64D4
_080AFC70:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r2
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	strh r0, [r1, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x51
	bne _080AFD36
	movs r0, 0x9
	strh r0, [r1, 0x1E]
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	b _080AFD36
_080AFC92:
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
	bne _080AFD36
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
	bne _080AFD36
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	strh r1, [r4, 0x1E]
	b _080AFD36
_080AFCD6:
	mov r0, sp
	bl sub_80752A0
	movs r0, 0x1
	bl sub_8075358
	movs r0, 0x2
	bl sub_8075358
	ldr r0, _080AFD40 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
_080AFCF8:
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080AFD0C
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0
	bl SetAnimBgAttribute
_080AFD0C:
	ldr r0, _080AFD44 @ =gBattle_BG1_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080AFD48 @ =gBattle_BG1_Y
	strh r1, [r0]
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
_080AFD36:
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AFD40: .4byte gTasks
_080AFD44: .4byte gBattle_BG1_X
_080AFD48: .4byte gBattle_BG1_Y
	thumb_func_end sub_80AFBC0

	thumb_func_start sub_80AFD4C
sub_80AFD4C: @ 80AFD4C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080AFD78 @ =gBattleAnimAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r0, _080AFD7C @ =sub_8075DF4
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AFD78: .4byte gBattleAnimAttacker
_080AFD7C: .4byte sub_8075DF4
	thumb_func_end sub_80AFD4C

	thumb_func_start sub_80AFD80
sub_80AFD80: @ 80AFD80
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080AFE40 @ =0x00003f42
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
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080AFDC2
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0x1
	bl SetAnimBgAttribute
_080AFDC2:
	ldr r0, _080AFE44 @ =gBattle_BG1_X
	movs r1, 0
	strh r1, [r0]
	ldr r4, _080AFE48 @ =gBattle_BG1_Y
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
	ldr r1, _080AFE4C @ =gUnknown_83C3540
	movs r2, 0x80
	lsls r2, 4
	mov r3, sp
	ldrh r3, [r3, 0xA]
	bl LoadBgTiles
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080AFE50 @ =gFile_graphics_battle_anims_backgrounds_fog_tilemap
	bl sub_807543C
	ldr r0, _080AFE54 @ =gUnknown_83C2CE0
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadPalette
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080AFE24
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80730C0
_080AFE24:
	ldr r1, _080AFE58 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080AFE5C @ =0x0000ffff
	strh r1, [r0, 0x26]
	ldr r1, _080AFE60 @ =sub_80AFE64
	str r1, [r0]
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AFE40: .4byte 0x00003f42
_080AFE44: .4byte gBattle_BG1_X
_080AFE48: .4byte gBattle_BG1_Y
_080AFE4C: .4byte gUnknown_83C3540
_080AFE50: .4byte gFile_graphics_battle_anims_backgrounds_fog_tilemap
_080AFE54: .4byte gUnknown_83C2CE0
_080AFE58: .4byte gTasks
_080AFE5C: .4byte 0x0000ffff
_080AFE60: .4byte sub_80AFE64
	thumb_func_end sub_80AFD80

	thumb_func_start sub_80AFE64
sub_80AFE64: @ 80AFE64
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _080AFE94 @ =gBattle_BG1_X
	ldr r3, _080AFE98 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r3
	ldrh r0, [r1, 0x26]
	ldrh r5, [r2]
	adds r0, r5
	strh r0, [r2]
	movs r2, 0x20
	ldrsh r0, [r1, r2]
	cmp r0, 0x4
	bls _080AFE8A
	b _080AFFBE
_080AFE8A:
	lsls r0, 2
	ldr r1, _080AFE9C @ =_080AFEA0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AFE94: .4byte gBattle_BG1_X
_080AFE98: .4byte gTasks
_080AFE9C: .4byte _080AFEA0
	.align 2, 0
_080AFEA0:
	.4byte _080AFEB4
	.4byte _080AFEF8
	.4byte _080AFF1A
	.4byte _080AFF5E
	.4byte _080AFF80
_080AFEB4:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r4, r0, r3
	ldrh r0, [r4, 0x1A]
	adds r0, 0x1
	strh r0, [r4, 0x1A]
	ldr r1, _080AFEF4 @ =gUnknown_83E6500
	movs r5, 0x1A
	ldrsh r0, [r4, r5]
	adds r0, r1
	ldrb r1, [r0]
	strh r1, [r4, 0x1E]
	movs r0, 0x11
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bne _080AFFBE
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	movs r0, 0
	strh r0, [r4, 0x1E]
	b _080AFFBE
	.align 2, 0
_080AFEF4: .4byte gUnknown_83E6500
_080AFEF8:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r3
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	strh r0, [r1, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x51
	bne _080AFFBE
	movs r0, 0x5
	strh r0, [r1, 0x1E]
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	b _080AFFBE
_080AFF1A:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r4, r0, r3
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080AFFBE
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
	bne _080AFFBE
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	strh r1, [r4, 0x1E]
	b _080AFFBE
_080AFF5E:
	mov r0, sp
	bl sub_80752A0
	movs r0, 0x1
	bl sub_8075358
	movs r0, 0x2
	bl sub_8075358
	ldr r0, _080AFFC8 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
_080AFF80:
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080AFF94
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0
	bl SetAnimBgAttribute
_080AFF94:
	ldr r0, _080AFFCC @ =gBattle_BG1_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080AFFD0 @ =gBattle_BG1_Y
	strh r1, [r0]
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
_080AFFBE:
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AFFC8: .4byte gTasks
_080AFFCC: .4byte gBattle_BG1_X
_080AFFD0: .4byte gBattle_BG1_Y
	thumb_func_end sub_80AFE64

	thumb_func_start sub_80AFFD4
sub_80AFFD4: @ 80AFFD4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	ldr r6, _080B00BC @ =gBattleAnimArgs
	ldrh r0, [r6]
	strh r0, [r5, 0x2E]
	ldr r0, _080B00C0 @ =gBattleAnimAttacker
	mov r8, r0
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8074480
	adds r4, r0, 0
	ldr r7, _080B00C4 @ =gBattleAnimTarget
	ldrb r0, [r7]
	movs r1, 0x2
	bl sub_8074480
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bcs _080B0008
	movs r0, 0x80
	lsls r0, 8
	strh r0, [r5, 0x3C]
_080B0008:
	ldr r3, _080B00C8 @ =gUnknown_2023BD6
	ldrb r0, [r7]
	adds r0, r3
	ldrb r1, [r0]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080B0068
	ldrh r0, [r6, 0x2]
	negs r0, r0
	strh r0, [r6, 0x2]
	ldrh r0, [r6, 0x6]
	negs r0, r0
	strh r0, [r6, 0x6]
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080B0064
	mov r1, r8
	ldrb r0, [r1]
	adds r0, r3
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080B0064
	movs r0, 0x1
	bl GetAnimBankSpriteId
	ldr r2, _080B00CC @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0x1
	adds r1, r5, 0
	adds r1, 0x43
	strb r0, [r1]
_080B0064:
	movs r0, 0x1
	strh r0, [r5, 0x3A]
_080B0068:
	ldr r4, _080B00C0 @ =gBattleAnimAttacker
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
	ldr r6, _080B00BC @ =gBattleAnimArgs
	movs r1, 0xE
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _080B00D0
	ldrh r0, [r6, 0x2]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	strh r0, [r5, 0x30]
	ldr r4, _080B00C4 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x6]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r6, 0x4]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	b _080B00F8
	.align 2, 0
_080B00BC: .4byte gBattleAnimArgs
_080B00C0: .4byte gBattleAnimAttacker
_080B00C4: .4byte gBattleAnimTarget
_080B00C8: .4byte gUnknown_2023BD6
_080B00CC: .4byte gSprites
_080B00D0:
	ldrh r0, [r6, 0x2]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	strh r0, [r5, 0x30]
	ldr r4, _080B0140 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x6]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r6, 0x4]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x1
_080B00F8:
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x8]
	adds r0, r6
	strh r0, [r5, 0x36]
	ldrb r0, [r4]
	bl sub_8076884
	lsls r0, 24
	lsrs r0, 16
	ldrh r1, [r5, 0x3C]
	orrs r0, r1
	strh r0, [r5, 0x3C]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080B012C
	movs r0, 0x1
	strh r0, [r5, 0x3A]
	adds r1, r5, 0
	adds r1, 0x43
	movs r0, 0x80
	strb r0, [r1]
_080B012C:
	adds r0, r5, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r0, _080B0144 @ =sub_80B0148
	str r0, [r5, 0x1C]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0140: .4byte gBattleAnimTarget
_080B0144: .4byte sub_80B0148
	thumb_func_end sub_80AFFD4

	thumb_func_start sub_80B0148
sub_80B0148: @ 80B0148
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x3C]
	movs r5, 0xFF
	movs r1, 0xFF
	ands r1, r0
	cmp r1, 0x1
	beq _080B0230
	cmp r1, 0x1
	bgt _080B0162
	cmp r1, 0
	beq _080B016A
	b _080B0380
_080B0162:
	cmp r1, 0x2
	bne _080B0168
	b _080B0344
_080B0168:
	b _080B0380
_080B016A:
	adds r0, r4, 0
	bl sub_80755E0
	ldr r1, _080B0194 @ =gSineTable
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	asrs r0, 4
	ldrh r2, [r4, 0x24]
	adds r0, r2
	strh r0, [r4, 0x24]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080B0198
	ldrh r0, [r4, 0x38]
	subs r0, 0x8
	b _080B019C
	.align 2, 0
_080B0194: .4byte gSineTable
_080B0198:
	ldrh r0, [r4, 0x38]
	adds r0, 0x8
_080B019C:
	ands r0, r5
	strh r0, [r4, 0x38]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080B01AA
	b _080B0380
_080B01AA:
	movs r5, 0x50
	strh r5, [r4, 0x2E]
	ldr r6, _080B01F8 @ =gBattleAnimTarget
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x26]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, 0x1D
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080B0200
	ldr r1, _080B01FC @ =gUnknown_2023BD6
	ldrb r0, [r6]
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B0200
	movs r0, 0xCC
	strh r0, [r4, 0x38]
	b _080B0202
	.align 2, 0
_080B01F8: .4byte gBattleAnimTarget
_080B01FC: .4byte gUnknown_2023BD6
_080B0200:
	strh r5, [r4, 0x38]
_080B0202:
	movs r0, 0
	strh r0, [r4, 0x26]
	ldr r1, _080B022C @ =gSineTable
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	asrs r0, 3
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x38]
	adds r0, 0x2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	b _080B0380
	.align 2, 0
_080B022C: .4byte gSineTable
_080B0230:
	adds r0, r4, 0
	bl sub_80755E0
	ldr r1, _080B028C @ =gSineTable
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	asrs r0, 3
	ldrh r2, [r4, 0x24]
	adds r0, r2
	strh r0, [r4, 0x24]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	adds r0, 0x40
	lsls r0, 1
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	lsls r0, r1, 1
	adds r0, r1
	negs r0, r0
	asrs r0, 8
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080B02AE
	ldrh r1, [r4, 0x38]
	adds r0, r1, 0
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	adds r3, r1, 0
	cmp r0, 0x7F
	bhi _080B0290
	ldrh r1, [r4, 0x3C]
	lsls r1, 16
	asrs r1, 24
	b _080B0298
	.align 2, 0
_080B028C: .4byte gSineTable
_080B0290:
	ldrh r1, [r4, 0x3C]
	lsls r1, 16
	asrs r1, 24
	adds r1, 0x1
_080B0298:
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	adds r0, r3, 0x4
	b _080B02CE
_080B02AE:
	ldrh r0, [r4, 0x38]
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7F
	bhi _080B02C2
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x80
	b _080B02C8
_080B02C2:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x8C
_080B02C8:
	strb r0, [r1]
	ldrh r0, [r4, 0x38]
	subs r0, 0x4
_080B02CE:
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bgt _080B0380
	movs r5, 0
	movs r0, 0xC0
	lsls r0, 2
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, 0x4
	strh r0, [r4, 0x36]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080B0328
	ldr r1, _080B0320 @ =gUnknown_2023BD6
	ldr r0, _080B0324 @ =gBattleAnimTarget
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B0328
	movs r0, 0x80
	lsls r0, 1
	b _080B032A
	.align 2, 0
_080B0320: .4byte gUnknown_2023BD6
_080B0324: .4byte gBattleAnimTarget
_080B0328:
	ldr r0, _080B0340 @ =0x0000fff0
_080B032A:
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x3C]
	strh r1, [r4, 0x26]
	strh r1, [r4, 0x24]
	adds r0, r4, 0
	bl sub_8075678
	b _080B0380
	.align 2, 0
_080B0340: .4byte 0x0000fff0
_080B0344:
	adds r0, r4, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	beq _080B0380
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B0372
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
_080B0372:
	adds r0, r4, 0
	bl DestroySprite
	ldr r1, _080B0388 @ =gUnknown_2037EE2
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_080B0380:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B0388: .4byte gUnknown_2037EE2
	thumb_func_end sub_80B0148

	thumb_func_start sub_80B038C
sub_80B038C: @ 80B038C
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B03A0 @ =gTasks
	adds r1, r0
	ldr r0, _080B03A4 @ =sub_80B03A8
	str r0, [r1]
	bx lr
	.align 2, 0
_080B03A0: .4byte gTasks
_080B03A4: .4byte sub_80B03A8
	thumb_func_end sub_80B038C

	thumb_func_start sub_80B03A8
sub_80B03A8: @ 80B03A8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080B03CC @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _080B03EC
	cmp r5, 0x1
	bgt _080B03D0
	cmp r5, 0
	beq _080B03D6
	b _080B0450
	.align 2, 0
_080B03CC: .4byte gTasks
_080B03D0:
	cmp r5, 0x2
	beq _080B0442
	b _080B0450
_080B03D6:
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080B0450
	strh r5, [r4, 0x10]
	strh r5, [r4, 0x12]
	strh r5, [r4, 0xC]
	b _080B0428
_080B03EC:
	ldrh r1, [r4, 0x12]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _080B043C
	ldrb r0, [r4, 0xE]
	ldrb r1, [r4, 0xC]
	movs r3, 0x1
	bl sub_80B0458
	lsls r0, 24
	cmp r0, 0
	beq _080B040C
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
_080B040C:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080B0438
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _080B0430
_080B0428:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B0450
_080B0430:
	ldrh r0, [r4, 0x8]
	subs r0, 0x1
	strh r0, [r4, 0x8]
	b _080B0450
_080B0438:
	strh r5, [r4, 0x12]
	b _080B0450
_080B043C:
	subs r0, r1, 0x1
	strh r0, [r4, 0x12]
	b _080B0450
_080B0442:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B0450
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080B0450:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80B03A8

	thumb_func_start sub_80B0458
sub_80B0458: @ 80B0458
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp]
	lsls r3, 24
	lsrs r3, 24
	mov r10, r3
	movs r1, 0
	str r1, [sp, 0x4]
	ldr r1, _080B04D0 @ =gUnknown_83E652C
	lsrs r0, 22
	adds r4, r0, r1
	ldrb r0, [r4, 0x3]
	lsls r0, 24
	asrs r0, 28
	mov r8, r0
	cmp r0, 0x2
	beq _080B0544
	ldrh r0, [r4, 0x2]
	lsls r0, 20
	lsrs r0, 24
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080B0544
	movs r0, 0x1
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r6, r0, 24
	mov r1, r8
	cmp r1, 0
	beq _080B04D4
	cmp r1, 0x1
	beq _080B050A
	b _080B0556
	.align 2, 0
_080B04D0: .4byte gUnknown_83E652C
_080B04D4:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8076B2C
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x6
	bl __divsi3
	lsls r1, r7, 16
	asrs r1, 16
	subs r1, r0
	lsls r1, 16
	lsrs r7, r1, 16
	adds r0, r5, 0
	movs r1, 0
	bl sub_8076B2C
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x6
	bl __divsi3
	lsls r1, r6, 16
	asrs r1, 16
	subs r1, r0
	b _080B053E
_080B050A:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8076B2C
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x6
	bl __divsi3
	lsls r1, r7, 16
	asrs r1, 16
	adds r1, r0
	lsls r1, 16
	lsrs r7, r1, 16
	adds r0, r5, 0
	movs r1, 0
	bl sub_8076B2C
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x6
	bl __divsi3
	lsls r1, r6, 16
	asrs r1, 16
	adds r1, r0
_080B053E:
	lsls r1, 16
	lsrs r6, r1, 16
	b _080B0556
_080B0544:
	ldrh r0, [r4]
	lsls r0, 22
	asrs r0, 6
	lsrs r7, r0, 16
	ldr r0, [r4]
	lsls r0, 12
	asrs r0, 22
	lsls r0, 16
	lsrs r6, r0, 16
_080B0556:
	lsls r0, r6, 16
	asrs r0, 16
	adds r0, 0x8
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	lsls r1, r7, 16
	asrs r1, 16
	subs r1, r0
	ldr r0, _080B05B0 @ =gUnknown_83E65A4
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x8
	negs r2, r2
	movs r3, 0x12
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _080B05B8
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	ldr r0, _080B05B4 @ =gSprites
	adds r4, r0
	adds r0, r4, 0
	mov r1, r9
	bl StartSpriteAffineAnim
	mov r0, sp
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	strh r7, [r4, 0x34]
	strh r6, [r4, 0x36]
	mov r1, r9
	strh r1, [r4, 0x38]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x3A]
	mov r1, r10
	strh r1, [r4, 0x3C]
	movs r0, 0x1
	b _080B05BA
	.align 2, 0
_080B05B0: .4byte gUnknown_83E65A4
_080B05B4: .4byte gSprites
_080B05B8:
	movs r0, 0
_080B05BA:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80B0458

	thumb_func_start sub_80B05CC
sub_80B05CC: @ 80B05CC
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	adds r0, 0x4
	strh r0, [r4, 0x20]
	ldrh r1, [r4, 0x22]
	adds r2, r1, 0
	adds r2, 0x8
	strh r2, [r4, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x34
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bge _080B05F6
	lsls r0, r2, 16
	asrs r0, 16
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _080B06A6
_080B05F6:
	movs r3, 0x2E
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	bne _080B0678
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B0678
	ldr r0, _080B066C @ =gUnknown_83E63E0
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	movs r3, 0x36
	ldrsh r2, [r4, r3]
	adds r3, r4, 0
	adds r3, 0x43
	ldrb r3, [r3]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x2E]
	cmp r0, 0x40
	beq _080B065A
	ldr r2, _080B0670 @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r2, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080B0674 @ =sub_80B06B0
	str r1, [r0]
	movs r3, 0x2E
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x3A]
	strh r1, [r0, 0x3A]
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x3C]
	strh r1, [r0, 0x3C]
_080B065A:
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	b _080B06A6
	.align 2, 0
_080B066C: .4byte gUnknown_83E63E0
_080B0670: .4byte gSprites
_080B0674: .4byte sub_80B06B0
_080B0678:
	ldr r3, _080B06AC @ =gTasks
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
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
_080B06A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B06AC: .4byte gTasks
	thumb_func_end sub_80B05CC

	thumb_func_start sub_80B06B0
sub_80B06B0: @ 80B06B0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _080B06F0
	ldr r3, _080B06F8 @ =gTasks
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
_080B06F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B06F8: .4byte gTasks
	thumb_func_end sub_80B06B0

	thumb_func_start unc_080B06FC
unc_080B06FC: @ 80B06FC
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _080B077C @ =gUnknown_2037EE4
	ldr r0, [r0]
	ldrb r1, [r0, 0x11]
	lsrs r0, r1, 4
	lsls r1, 28
	lsrs r1, 28
	subs r0, r1
	subs r0, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _080B071A
	movs r1, 0x4
_080B071A:
	adds r0, r5, 0
	bl StartSpriteAffineAnim
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r6, _080B0780 @ =gBattleAnimArgs
	ldrh r0, [r6, 0x8]
	strh r0, [r5, 0x2E]
	ldr r0, _080B0784 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B0742
	ldrh r0, [r6, 0x4]
	negs r0, r0
	strh r0, [r6, 0x4]
_080B0742:
	ldr r4, _080B0788 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x4]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x6]
	adds r0, r1
	strh r0, [r5, 0x36]
	ldrh r0, [r6, 0xA]
	strh r0, [r5, 0x38]
	adds r0, r5, 0
	bl sub_8075068
	ldr r0, _080B078C @ =sub_80B0790
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B077C: .4byte gUnknown_2037EE4
_080B0780: .4byte gBattleAnimArgs
_080B0784: .4byte gBattleAnimAttacker
_080B0788: .4byte gBattleAnimTarget
_080B078C: .4byte sub_80B0790
	thumb_func_end unc_080B06FC

	thumb_func_start sub_80B0790
sub_80B0790: @ 80B0790
	push {r4,lr}
	adds r4, r0, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080B07B2
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _080B07B8 @ =sub_8074F6C
	str r0, [r4, 0x1C]
	ldr r1, _080B07BC @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
_080B07B2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B07B8: .4byte sub_8074F6C
_080B07BC: .4byte DestroyAnimSprite
	thumb_func_end sub_80B0790

	thumb_func_start sub_80B07C0
sub_80B07C0: @ 80B07C0
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x8
	ldr r3, _080B0814 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080B0818 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8075114
	bl Random
	movs r5, 0xFF
	ands r5, r0
	movs r0, 0x80
	lsls r0, 1
	adds r6, r0, 0
	orrs r5, r6
	bl Random
	ldr r1, _080B081C @ =0x000001ff
	ands r1, r0
	adds r0, r1, 0
	cmp r0, 0xFF
	ble _080B0806
	subs r0, r6, r0
	lsls r0, 16
	lsrs r1, r0, 16
_080B0806:
	strh r5, [r4, 0x30]
	strh r1, [r4, 0x32]
	ldr r0, _080B0820 @ =sub_80B0824
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B0814: .4byte 0x000003ff
_080B0818: .4byte 0xfffffc00
_080B081C: .4byte 0x000001ff
_080B0820: .4byte sub_80B0824
	thumb_func_end sub_80B07C0

	thumb_func_start sub_80B0824
sub_80B0824: @ 80B0824
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x34]
	adds r3, r0, r1
	strh r3, [r2, 0x34]
	ldrh r1, [r2, 0x32]
	ldrh r4, [r2, 0x36]
	adds r1, r4
	strh r1, [r2, 0x36]
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080B0848
	lsls r0, r3, 16
	asrs r0, 24
	negs r0, r0
	b _080B084C
_080B0848:
	lsls r0, r3, 16
	asrs r0, 24
_080B084C:
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _080B086A
	adds r0, r2, 0
	bl DestroyAnimSprite
_080B086A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B0824

	thumb_func_start sub_80B0870
sub_80B0870: @ 80B0870
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B0898 @ =gBattleAnimArgs
	ldrb r3, [r1]
	lsls r3, 1
	adds r3, r1
	ldr r1, _080B089C @ =gUnknown_2037EE4
	ldr r1, [r1]
	ldrb r1, [r1, 0x11]
	lsrs r2, r1, 4
	lsls r1, 28
	lsrs r1, 28
	subs r2, r1
	subs r2, 0x1
	strh r2, [r3]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080B0898: .4byte gBattleAnimArgs
_080B089C: .4byte gUnknown_2037EE4
	thumb_func_end sub_80B0870

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
	ldr r0, _080B147C @ =gUnknown_2037F16
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
_080B147C: .4byte gUnknown_2037F16
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

	thumb_func_start sub_80B1620
sub_80B1620: @ 80B1620
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080B1674 @ =gBattleAnimArgs
	movs r1, 0x6
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B1636
	adds r0, r5, 0
	movs r1, 0x2
	bl StartSpriteAnim
_080B1636:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8075160
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x2E]
	ldr r4, _080B1678 @ =gBattleAnimTarget
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
	ldr r0, _080B167C @ =0x0000ffe2
	strh r0, [r5, 0x38]
	adds r0, r5, 0
	bl sub_8075068
	ldr r0, _080B1680 @ =sub_80B1684
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1674: .4byte gBattleAnimArgs
_080B1678: .4byte gBattleAnimTarget
_080B167C: .4byte 0x0000ffe2
_080B1680: .4byte sub_80B1684
	thumb_func_end sub_80B1620

	thumb_func_start sub_80B1684
sub_80B1684: @ 80B1684
	push {r4,lr}
	adds r4, r0, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080B1698
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B1698:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B1684

	thumb_func_start sub_80B16A0
sub_80B16A0: @ 80B16A0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r5, _080B1714 @ =gBattleAnimArgs
	movs r1, 0x6
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080B16B8
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
_080B16B8:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _080B1718 @ =gBattleAnimTarget
	ldrb r0, [r0]
	mov r6, sp
	adds r6, 0x2
	movs r1, 0x1
	mov r2, sp
	adds r3, r6, 0
	bl sub_8076D9C
	ldr r0, _080B171C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B16E6
	ldrh r0, [r5, 0x8]
	negs r0, r0
	strh r0, [r5, 0x8]
_080B16E6:
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	mov r1, sp
	ldrh r0, [r5, 0x8]
	ldrh r1, [r1]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0xA]
	ldrh r6, [r6]
	adds r0, r6
	strh r0, [r4, 0x36]
	ldr r0, _080B1720 @ =0x0000ffe2
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_8075068
	ldr r0, _080B1724 @ =sub_80B1728
	str r0, [r4, 0x1C]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B1714: .4byte gBattleAnimArgs
_080B1718: .4byte gBattleAnimTarget
_080B171C: .4byte gBattleAnimAttacker
_080B1720: .4byte 0x0000ffe2
_080B1724: .4byte sub_80B1728
	thumb_func_end sub_80B16A0

	thumb_func_start sub_80B1728
sub_80B1728: @ 80B1728
	push {r4,lr}
	adds r4, r0, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080B173C
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B173C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B1728

	thumb_func_start sub_80B1744
sub_80B1744: @ 80B1744
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080B1790 @ =gBattleAnimArgs
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r1, [r5]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldrh r1, [r5, 0x2]
	adds r0, r1
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_80754B8
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x4
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r4, 0x38]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r2, 0x4
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r4, 0x3A]
	ldr r0, _080B1794 @ =sub_80B1798
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1790: .4byte gBattleAnimArgs
_080B1794: .4byte sub_80B1798
	thumb_func_end sub_80B1744

	thumb_func_start sub_80B1798
sub_80B1798: @ 80B1798
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8074D00
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x38]
	subs r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	ldrh r1, [r4, 0x3A]
	subs r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B17BE
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B17BE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B1798

	thumb_func_start sub_80B17C4
sub_80B17C4: @ 80B17C4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080B1824 @ =gBattleAnimTarget
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0x1
	bl sub_8076D9C
	ldr r0, _080B1828 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B17F0
	ldr r1, _080B182C @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080B17F0:
	ldr r0, _080B182C @ =gBattleAnimArgs
	ldrh r2, [r0]
	ldrh r1, [r4, 0x20]
	adds r2, r1
	strh r2, [r4, 0x20]
	ldrh r1, [r0, 0x2]
	ldrh r3, [r4, 0x22]
	adds r1, r3
	strh r1, [r4, 0x22]
	ldrh r3, [r0, 0x8]
	strh r3, [r4, 0x2E]
	ldrh r0, [r0, 0x4]
	adds r2, r0
	strh r2, [r4, 0x32]
	adds r1, r3
	strh r1, [r4, 0x36]
	ldr r0, _080B1830 @ =sub_8075590
	str r0, [r4, 0x1C]
	ldr r1, _080B1834 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1824: .4byte gBattleAnimTarget
_080B1828: .4byte gBattleAnimAttacker
_080B182C: .4byte gBattleAnimArgs
_080B1830: .4byte sub_8075590
_080B1834: .4byte DestroyAnimSprite
	thumb_func_end sub_80B17C4

	thumb_func_start sub_80B1838
sub_80B1838: @ 80B1838
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080B1850 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080B1854
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8075114
	b _080B188A
	.align 2, 0
_080B1850: .4byte gBattleAnimArgs
_080B1854:
	ldr r0, _080B1894 @ =gBattleAnimTarget
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0x1
	bl sub_8076D9C
	ldr r0, _080B1898 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B187A
	ldrh r0, [r5]
	negs r0, r0
	strh r0, [r5]
_080B187A:
	ldrh r0, [r5]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
_080B188A:
	ldr r0, _080B189C @ =sub_80B18A0
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1894: .4byte gBattleAnimTarget
_080B1898: .4byte gBattleAnimAttacker
_080B189C: .4byte sub_80B18A0
	thumb_func_end sub_80B1838

	thumb_func_start sub_80B18A0
sub_80B18A0: @ 80B18A0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0xB
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x4
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r0, 0x30
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080B18DC
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B18DC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B18A0

	thumb_func_start sub_80B18E4
sub_80B18E4: @ 80B18E4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_8075114
	ldrh r0, [r4, 0x22]
	adds r0, 0x14
	strh r0, [r4, 0x22]
	movs r0, 0xBF
	strh r0, [r4, 0x30]
	ldr r1, _080B1908 @ =sub_80B190C
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1908: .4byte sub_80B190C
	thumb_func_end sub_80B18E4

	thumb_func_start sub_80B190C
sub_80B190C: @ 80B190C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x20
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x8
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x5
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x47
	bne _080B1946
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B1946:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B190C

	thumb_func_start sub_80B194C
sub_80B194C: @ 80B194C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B197C @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldr r1, _080B1980 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x8]
	ldrh r0, [r1]
	strh r0, [r4, 0xA]
	ldr r0, _080B1984 @ =0x00002719
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xC]
	ldr r0, _080B1988 @ =sub_80B198C
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B197C: .4byte gTasks
_080B1980: .4byte gBattleAnimArgs
_080B1984: .4byte 0x00002719
_080B1988: .4byte sub_80B198C
	thumb_func_end sub_80B194C

	thumb_func_start sub_80B198C
sub_80B198C: @ 80B198C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _080B1A0C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r4, 0xA
	ldrsh r1, [r3, r4]
	adds r7, r2, 0
	cmp r0, r1
	bne _080B19EA
	movs r0, 0
	strh r0, [r3, 0x1C]
	ldrb r0, [r3, 0xC]
	ldr r2, _080B1A10 @ =gPlttBufferFaded
	lsls r0, 4
	movs r3, 0x84
	lsls r3, 1
	adds r1, r0, r3
	lsls r1, 1
	adds r1, r2
	ldrh r6, [r1]
	movs r4, 0x7
	mov r12, r0
	ldr r0, _080B1A14 @ =0x00000107
	add r0, r12
	lsls r0, 1
	adds r3, r0, r2
_080B19D2:
	ldrh r0, [r3]
	strh r0, [r1]
	subs r3, 0x2
	subs r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bgt _080B19D2
	ldr r0, _080B1A18 @ =0x00000101
	add r0, r12
	lsls r0, 1
	adds r0, r2
	strh r6, [r0]
_080B19EA:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r7
	ldrh r1, [r0, 0x8]
	subs r1, 0x1
	strh r1, [r0, 0x8]
	lsls r1, 16
	cmp r1, 0
	bne _080B1A04
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080B1A04:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1A0C: .4byte gTasks
_080B1A10: .4byte gPlttBufferFaded
_080B1A14: .4byte 0x00000107
_080B1A18: .4byte 0x00000101
	thumb_func_end sub_80B198C

	thumb_func_start sub_80B1A1C
sub_80B1A1C: @ 80B1A1C
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _080B1A88 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B1A3C
	ldr r1, _080B1A8C @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080B1A3C:
	ldr r4, _080B1A8C @ =gBattleAnimArgs
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldrh r0, [r6, 0x20]
	strh r0, [r6, 0x30]
	ldr r5, _080B1A90 @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrh r0, [r6, 0x22]
	strh r0, [r6, 0x34]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x6]
	adds r0, r4
	strh r0, [r6, 0x36]
	adds r0, r6, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r0, _080B1A94 @ =sub_8074F50
	str r0, [r6, 0x1C]
	ldr r1, _080B1A98 @ =sub_80B1A9C
	adds r0, r6, 0
	bl StoreSpriteCallbackInData6
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B1A88: .4byte gBattleAnimAttacker
_080B1A8C: .4byte gBattleAnimArgs
_080B1A90: .4byte gBattleAnimTarget
_080B1A94: .4byte sub_8074F50
_080B1A98: .4byte sub_80B1A9C
	thumb_func_end sub_80B1A1C

	thumb_func_start sub_80B1A9C
sub_80B1A9C: @ 80B1A9C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	beq _080B1AB0
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B1AB0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B1A9C

	thumb_func_start sub_80B1AB8
sub_80B1AB8: @ 80B1AB8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080B1B54 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B1AE4
	ldr r1, _080B1B58 @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
	ldrh r0, [r1, 0x6]
	negs r0, r0
	strh r0, [r1, 0x6]
_080B1AE4:
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080B1AFC
	ldr r0, _080B1B58 @ =gBattleAnimArgs
	ldrh r1, [r0, 0x2]
	negs r1, r1
	strh r1, [r0, 0x2]
	ldrh r1, [r0, 0x6]
	negs r1, r1
	strh r1, [r0, 0x6]
_080B1AFC:
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
	ldr r2, _080B1B58 @ =gBattleAnimArgs
	ldrh r1, [r2]
	ldrh r3, [r5, 0x20]
	adds r1, r3
	strh r1, [r5, 0x20]
	lsrs r0, 24
	ldrh r1, [r2, 0x2]
	adds r0, r1
	strh r0, [r5, 0x22]
	ldrh r0, [r2, 0x8]
	strh r0, [r5, 0x2E]
	movs r3, 0xC
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _080B1B60
	ldr r4, _080B1B5C @ =gBattleAnimTarget
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
	b _080B1B72
	.align 2, 0
_080B1B54: .4byte gBattleAnimAttacker
_080B1B58: .4byte gBattleAnimArgs
_080B1B5C: .4byte gBattleAnimTarget
_080B1B60:
	ldr r0, _080B1BA0 @ =gBattleAnimTarget
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x32
	adds r3, r5, 0
	adds r3, 0x36
	movs r1, 0x1
	bl sub_8076D9C
_080B1B72:
	ldr r4, _080B1BA4 @ =gBattleAnimArgs
	ldrh r0, [r4, 0x4]
	ldrh r1, [r5, 0x32]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r4, 0x6]
	ldrh r3, [r5, 0x36]
	adds r0, r3
	strh r0, [r5, 0x36]
	ldr r0, _080B1BA8 @ =sub_8075590
	str r0, [r5, 0x1C]
	ldr r1, _080B1BAC @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	ldrb r1, [r4, 0xA]
	adds r0, r5, 0
	bl SeekSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1BA0: .4byte gBattleAnimTarget
_080B1BA4: .4byte gBattleAnimArgs
_080B1BA8: .4byte sub_8075590
_080B1BAC: .4byte DestroyAnimSprite
	thumb_func_end sub_80B1AB8

	thumb_func_start sub_80B1BB0
sub_80B1BB0: @ 80B1BB0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r1, _080B1BEC @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldr r0, _080B1BF0 @ =sub_80B1BF8
	str r0, [r4, 0x1C]
	movs r0, 0
	bl GetAnimBankSpriteId
	ldr r2, _080B1BF4 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1BEC: .4byte gBattleAnimArgs
_080B1BF0: .4byte sub_80B1BF8
_080B1BF4: .4byte gSprites
	thumb_func_end sub_80B1BB0

	thumb_func_start sub_80B1BF8
sub_80B1BF8: @ 80B1BF8
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _080B1C0C
	subs r0, r1, 0x1
	strh r0, [r2, 0x2E]
	b _080B1C1E
_080B1C0C:
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r2, 0x26]
	subs r1, r0
	strh r1, [r2, 0x26]
_080B1C1E:
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _080B1C36
	adds r0, r2, 0
	bl DestroyAnimSprite
_080B1C36:
	pop {r0}
	bx r0
	thumb_func_end sub_80B1BF8

	thumb_func_start sub_80B1C3C
sub_80B1C3C: @ 80B1C3C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080B1C64 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B1C6C
	movs r0, 0x88
	lsls r0, 1
	strh r0, [r5, 0x20]
	ldr r0, _080B1C68 @ =0x0000ffe0
	strh r0, [r5, 0x22]
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	b _080B1C72
	.align 2, 0
_080B1C64: .4byte gBattleAnimAttacker
_080B1C68: .4byte 0x0000ffe0
_080B1C6C:
	ldr r0, _080B1CB0 @ =0x0000ffe0
	strh r0, [r5, 0x20]
	strh r0, [r5, 0x22]
_080B1C72:
	ldr r0, _080B1CB4 @ =gBattleAnimArgs
	ldrh r0, [r0]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldr r4, _080B1CB8 @ =gBattleAnimTarget
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
	ldr r0, _080B1CBC @ =sub_80B1CC0
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1CB0: .4byte 0x0000ffe0
_080B1CB4: .4byte gBattleAnimArgs
_080B1CB8: .4byte gBattleAnimTarget
_080B1CBC: .4byte sub_80B1CC0
	thumb_func_end sub_80B1C3C

	thumb_func_start sub_80B1CC0
sub_80B1CC0: @ 80B1CC0
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_80755E0
	ldrh r1, [r4, 0x34]
	lsrs r0, r1, 8
	cmp r0, 0xC8
	bls _080B1CE8
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	movs r0, 0
	strh r0, [r4, 0x24]
	movs r0, 0xFF
	ands r0, r1
	strh r0, [r4, 0x34]
_080B1CE8:
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	adds r0, r1
	adds r0, 0x20
	movs r1, 0x98
	lsls r1, 1
	cmp r0, r1
	bhi _080B1D0A
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	cmp r0, 0xA0
	ble _080B1D30
_080B1D0A:
	movs r0, 0
	bl GetAnimBankSpriteId
	ldr r2, _080B1D38 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B1D30:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1D38: .4byte gSprites
	thumb_func_end sub_80B1CC0

	thumb_func_start sub_80B1D3C
sub_80B1D3C: @ 80B1D3C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	subs r1, r0, 0x1
	strh r1, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bgt _080B1D7C
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B1D6E
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
_080B1D6E:
	adds r0, r4, 0
	bl DestroySprite
	ldr r1, _080B1D84 @ =gUnknown_2037EE2
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_080B1D7C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1D84: .4byte gUnknown_2037EE2
	thumb_func_end sub_80B1D3C

	thumb_func_start sub_80B1D88
sub_80B1D88: @ 80B1D88
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r5, r7, 0
	adds r5, 0x2E
	ldr r0, _080B1DA8 @ =gBattleAnimArgs
	ldrh r1, [r0, 0xE]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080B1DB0
	ldr r0, _080B1DAC @ =gBattleAnimAttacker
	b _080B1DB2
	.align 2, 0
_080B1DA8: .4byte gBattleAnimArgs
_080B1DAC: .4byte gBattleAnimAttacker
_080B1DB0:
	ldr r0, _080B1E5C @ =gBattleAnimTarget
_080B1DB2:
	ldrb r6, [r0]
	adds r0, r6, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B1DC8
	ldr r1, _080B1E60 @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080B1DC8:
	adds r0, r6, 0
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	ldr r4, _080B1E60 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r7, 0x20]
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	ldrh r1, [r4, 0x2]
	lsrs r0, 24
	adds r1, r0, r1
	strh r1, [r7, 0x22]
	lsls r1, 8
	strh r1, [r5, 0x8]
	ldrh r1, [r4, 0xC]
	adds r0, r1
	lsls r0, 1
	ldrh r2, [r5, 0xE]
	movs r1, 0x1
	ands r1, r2
	orrs r1, r0
	strh r1, [r5, 0xE]
	ldrb r0, [r5]
	movs r2, 0x4
	mov r8, r2
	mov r1, r8
	orrs r0, r1
	strb r0, [r5]
	ldrh r0, [r4, 0x4]
	ldrb r1, [r4, 0x4]
	strh r1, [r5, 0x2]
	lsls r0, 16
	lsrs r0, 24
	strh r0, [r5, 0xA]
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x4]
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x6]
	ldrh r0, [r4, 0xA]
	strh r0, [r5, 0xC]
	subs r1, 0x40
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0x7F
	bhi _080B1EBE
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080B1E64
	adds r0, r6, 0
	bl sub_8076884
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r7, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, 0x5]
	b _080B1E7C
	.align 2, 0
_080B1E5C: .4byte gBattleAnimTarget
_080B1E60: .4byte gBattleAnimArgs
_080B1E64:
	adds r0, r6, 0
	bl sub_8076884
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, 0x5]
_080B1E7C:
	ldrb r1, [r5, 0xE]
	movs r4, 0x2
	negs r4, r4
	adds r0, r4, 0
	ands r0, r1
	strb r0, [r5, 0xE]
	movs r2, 0x4
	ldrsh r0, [r5, r2]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	bne _080B1F1E
	adds r3, r7, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r0, r2, 31
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	adds r0, r4, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r7, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	b _080B1F16
_080B1EBE:
	adds r0, r6, 0
	bl sub_8076884
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, 0x5]
	ldrb r0, [r5, 0xE]
	movs r4, 0x1
	orrs r0, r4
	strb r0, [r5, 0xE]
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080B1F1E
	adds r3, r7, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	ands r1, r4
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r7, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	mov r2, r8
	orrs r0, r2
_080B1F16:
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
_080B1F1E:
	ldrh r1, [r5, 0x2]
	lsrs r1, 6
	lsls r1, 4
	ldrb r2, [r5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	ldr r3, _080B1F88 @ =gSineTable
	ldrh r0, [r5, 0x2]
	lsls r0, 1
	adds r0, r3
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldrb r0, [r5, 0xC]
	muls r0, r1
	asrs r0, 8
	strh r0, [r7, 0x24]
	ldrb r2, [r7, 0x3]
	lsls r2, 26
	lsrs r2, 27
	movs r1, 0x24
	ldrsh r0, [r7, r1]
	negs r0, r0
	asrs r0, 1
	ldrb r5, [r5, 0xA]
	adds r0, r5
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r3
	ldrh r4, [r1]
	ldr r1, _080B1F8C @ =gOamMatrices
	lsls r2, 3
	adds r2, r1
	adds r0, 0x40
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r2, 0x6]
	strh r0, [r2]
	strh r4, [r2, 0x2]
	lsls r0, r4, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r2, 0x4]
	ldr r0, _080B1F90 @ =sub_80B1F94
	str r0, [r7, 0x1C]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1F88: .4byte gSineTable
_080B1F8C: .4byte gOamMatrices
_080B1F90: .4byte sub_80B1F94
	thumb_func_end sub_80B1D88

	thumb_func_start sub_80B1F94
sub_80B1F94: @ 80B1F94
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	movs r6, 0
	adds r4, r5, 0
	adds r4, 0x2E
	ldrb r2, [r4]
	movs r7, 0x1
	movs r0, 0x1
	mov r9, r0
	ands r0, r2
	cmp r0, 0
	beq _080B1FCE
	ldrb r0, [r4, 0x1]
	adds r1, r0, 0
	adds r1, 0xFF
	strb r1, [r4, 0x1]
	lsls r0, 24
	cmp r0, 0
	beq _080B1FC2
	b _080B24AA
_080B1FC2:
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r4]
	strb r6, [r4, 0x1]
	b _080B24AA
_080B1FCE:
	ldrh r0, [r4, 0x2]
	lsrs r1, r0, 6
	mov r12, r0
	cmp r1, 0x1
	bne _080B1FDA
	b _080B20FE
_080B1FDA:
	cmp r1, 0x1
	bgt _080B1FE4
	cmp r1, 0
	beq _080B1FF2
	b _080B23F0
_080B1FE4:
	cmp r1, 0x2
	bne _080B1FEA
	b _080B21F2
_080B1FEA:
	cmp r1, 0x3
	bne _080B1FF0
	b _080B22E6
_080B1FF0:
	b _080B23F0
_080B1FF2:
	lsls r1, r2, 24
	lsrs r0, r1, 28
	cmp r0, 0x1
	bne _080B2006
	movs r0, 0x8
	orrs r0, r2
	orrs r0, r7
	strb r0, [r4]
	strb r6, [r4, 0x1]
	b _080B20F4
_080B2006:
	lsrs r0, r1, 28
	cmp r0, 0x3
	bne _080B2028
	lsls r0, r2, 30
	lsrs r0, 31
	movs r1, 0x1
	eors r0, r1
	ands r0, r7
	lsls r0, 1
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	orrs r1, r7
	strb r1, [r4]
	strb r6, [r4, 0x1]
	b _080B20F4
_080B2028:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _080B20F4
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r6, 0x1
	eors r1, r6
	ands r1, r7
	movs r0, 0x2
	negs r0, r0
	mov r8, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r5, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	ldrb r1, [r4]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080B20E6
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080B20B6
	ldrb r1, [r4, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080B209C
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080B20D4
_080B209C:
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080B20D4
_080B20B6:
	ldrb r1, [r4, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080B20CA
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0xC
	b _080B20D2
_080B20CA:
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0xC
_080B20D2:
	strb r0, [r1]
_080B20D4:
	ldrb r2, [r4, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r6
	ands r0, r7
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0xE]
_080B20E6:
	ldrb r1, [r4]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrh r1, [r4, 0x2]
	mov r12, r1
_080B20F4:
	ldrb r1, [r4]
	movs r0, 0xF
	ands r0, r1
	strb r0, [r4]
	b _080B23F0
_080B20FE:
	lsls r1, r2, 24
	lsrs r0, r1, 28
	cmp r0, 0
	bne _080B210C
	movs r0, 0x8
	orrs r0, r2
	b _080B2114
_080B210C:
	lsrs r0, r1, 28
	cmp r0, 0x2
	bne _080B211C
	adds r0, r2, 0
_080B2114:
	orrs r0, r7
	strb r0, [r4]
	strb r6, [r4, 0x1]
	b _080B21E8
_080B211C:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _080B21E8
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r6, 0x1
	eors r1, r6
	ands r1, r7
	movs r0, 0x2
	negs r0, r0
	mov r8, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r5, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	ldrb r1, [r4]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080B21DA
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080B21AA
	ldrb r1, [r4, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080B2190
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080B21C8
_080B2190:
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080B21C8
_080B21AA:
	ldrb r1, [r4, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080B21BE
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0xC
	b _080B21C6
_080B21BE:
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0xC
_080B21C6:
	strb r0, [r1]
_080B21C8:
	ldrb r2, [r4, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r6
	ands r0, r7
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0xE]
_080B21DA:
	ldrb r1, [r4]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrh r1, [r4, 0x2]
	mov r12, r1
_080B21E8:
	ldrb r0, [r4]
	movs r1, 0xF
	ands r1, r0
	movs r0, 0x10
	b _080B23EC
_080B21F2:
	lsls r1, r2, 24
	lsrs r0, r1, 28
	cmp r0, 0x3
	bne _080B2200
	movs r0, 0x8
	orrs r0, r2
	b _080B2208
_080B2200:
	lsrs r0, r1, 28
	cmp r0, 0x1
	bne _080B2210
	adds r0, r2, 0
_080B2208:
	orrs r0, r7
	strb r0, [r4]
	strb r6, [r4, 0x1]
	b _080B22DC
_080B2210:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _080B22DC
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r6, 0x1
	eors r1, r6
	ands r1, r7
	movs r0, 0x2
	negs r0, r0
	mov r8, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r5, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	ldrb r1, [r4]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080B22CE
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080B229E
	ldrb r1, [r4, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080B2284
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080B22BC
_080B2284:
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080B22BC
_080B229E:
	ldrb r1, [r4, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080B22B2
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0xC
	b _080B22BA
_080B22B2:
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0xC
_080B22BA:
	strb r0, [r1]
_080B22BC:
	ldrb r2, [r4, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r6
	ands r0, r7
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0xE]
_080B22CE:
	ldrb r1, [r4]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrh r1, [r4, 0x2]
	mov r12, r1
_080B22DC:
	ldrb r0, [r4]
	movs r1, 0xF
	ands r1, r0
	movs r0, 0x20
	b _080B23EC
_080B22E6:
	lsls r1, r2, 24
	lsrs r0, r1, 28
	cmp r0, 0x2
	bne _080B22F6
	movs r0, 0x8
	orrs r0, r2
	strb r0, [r4]
	b _080B23E4
_080B22F6:
	lsrs r0, r1, 28
	cmp r0, 0
	bne _080B2318
	lsls r0, r2, 30
	lsrs r0, 31
	movs r1, 0x1
	eors r0, r1
	ands r0, r7
	lsls r0, 1
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	orrs r1, r7
	strb r1, [r4]
	strb r6, [r4, 0x1]
	b _080B23E4
_080B2318:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _080B23E4
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r6, 0x1
	eors r1, r6
	ands r1, r7
	movs r0, 0x2
	negs r0, r0
	mov r8, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r5, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	ldrb r1, [r4]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080B23D6
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080B23A6
	ldrb r1, [r4, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080B238C
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080B23C4
_080B238C:
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080B23C4
_080B23A6:
	ldrb r1, [r4, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080B23BA
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0xC
	b _080B23C2
_080B23BA:
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0xC
_080B23C2:
	strb r0, [r1]
_080B23C4:
	ldrb r2, [r4, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r6
	ands r0, r7
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0xE]
_080B23D6:
	ldrb r1, [r4]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrh r1, [r4, 0x2]
	mov r12, r1
_080B23E4:
	ldrb r0, [r4]
	movs r1, 0xF
	ands r1, r0
	movs r0, 0x30
_080B23EC:
	orrs r1, r0
	strb r1, [r4]
_080B23F0:
	ldrb r1, [r4]
	lsls r1, 30
	lsrs r1, 31
	adds r0, r4, 0
	adds r0, 0xC
	adds r0, r1
	ldrb r1, [r0]
	ldr r3, _080B2478 @ =gSineTable
	mov r2, r12
	lsls r0, r2, 1
	adds r0, r3
	movs r2, 0
	ldrsh r0, [r0, r2]
	muls r0, r1
	asrs r0, 8
	strh r0, [r5, 0x24]
	ldrb r2, [r5, 0x3]
	lsls r2, 26
	lsrs r2, 27
	movs r1, 0x24
	ldrsh r0, [r5, r1]
	negs r0, r0
	asrs r0, 1
	ldrb r1, [r4, 0xA]
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r3
	ldrh r6, [r1]
	ldr r1, _080B247C @ =gOamMatrices
	lsls r2, 3
	adds r2, r1
	adds r0, 0x40
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r2, 0x6]
	strh r0, [r2]
	strh r6, [r2, 0x2]
	lsls r0, r6, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r2, 0x4]
	ldrh r0, [r4, 0x6]
	ldrh r2, [r4, 0x8]
	adds r0, r2
	strh r0, [r4, 0x8]
	lsls r0, 16
	lsrs r0, 24
	strh r0, [r5, 0x22]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080B2480
	ldrh r0, [r4, 0x4]
	subs r1, 0x1
	ands r1, r0
	ldrh r0, [r4, 0x2]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2]
	b _080B2490
	.align 2, 0
_080B2478: .4byte gSineTable
_080B247C: .4byte gOamMatrices
_080B2480:
	ldrh r0, [r4, 0x4]
	ldr r1, _080B24B8 @ =0x00007fff
	ands r1, r0
	ldrh r2, [r4, 0x2]
	adds r1, r2
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r4, 0x2]
_080B2490:
	movs r0, 0x22
	ldrsh r1, [r5, r0]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	adds r1, r0
	ldrh r0, [r4, 0xE]
	lsrs r0, 1
	cmp r1, r0
	blt _080B24AA
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldr r0, _080B24BC @ =sub_80B1D3C
	str r0, [r5, 0x1C]
_080B24AA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B24B8: .4byte 0x00007fff
_080B24BC: .4byte sub_80B1D3C
	thumb_func_end sub_80B1F94

	thumb_func_start sub_80B24C0
sub_80B24C0: @ 80B24C0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _080B2508 @ =gBattleAnimTarget
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
	ldr r5, _080B250C @ =gBattleAnimAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r0, _080B2510 @ =sub_8075DF4
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B2508: .4byte gBattleAnimTarget
_080B250C: .4byte gBattleAnimAttacker
_080B2510: .4byte sub_8075DF4
	thumb_func_end sub_80B24C0

	thumb_func_start sub_80B2514
sub_80B2514: @ 80B2514
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r5, _080B2554 @ =gBattleAnimArgs
	ldrh r0, [r5]
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x34]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080B25C4
	ldr r0, _080B2558 @ =gUnknown_2023BD6
	ldr r1, _080B255C @ =gBattleAnimTarget
	ldrb r2, [r1]
	adds r0, r2, r0
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B2560
	adds r0, r2, 0
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x6]
	adds r0, r5
	b _080B256E
	.align 2, 0
_080B2554: .4byte gBattleAnimArgs
_080B2558: .4byte gUnknown_2023BD6
_080B255C: .4byte gBattleAnimTarget
_080B2560:
	adds r0, r2, 0
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x28
_080B256E:
	strh r0, [r4, 0x3C]
	ldr r0, _080B259C @ =gBattleAnimArgs
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080B25A4
	ldr r0, _080B25A0 @ =gBattleAnimTarget
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
	b _080B25D8
	.align 2, 0
_080B259C: .4byte gBattleAnimArgs
_080B25A0: .4byte gBattleAnimTarget
_080B25A4:
	ldr r0, _080B25C0 @ =gBattleAnimTarget
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
	b _080B25D8
	.align 2, 0
_080B25C0: .4byte gBattleAnimTarget
_080B25C4:
	ldr r0, _080B267C @ =gBattleAnimTarget
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x6]
	adds r0, r5
	strh r0, [r4, 0x3C]
_080B25D8:
	ldr r5, _080B2680 @ =gSineTable
	ldrh r3, [r4, 0x30]
	movs r1, 0xFF
	ands r1, r3
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	movs r2, 0
	strh r0, [r4, 0x36]
	adds r1, 0x40
	lsls r1, 1
	adds r1, r5
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r4, 0x38]
	strh r2, [r4, 0x3A]
	strh r2, [r4, 0x26]
	strh r2, [r4, 0x24]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r6, r0, 27
	lsls r3, 16
	lsrs r3, 24
	strh r3, [r4, 0x30]
	bl Random
	lsls r0, 16
	asrs r7, r0, 16
	movs r0, 0x80
	lsls r0, 8
	ands r0, r7
	cmp r0, 0
	beq _080B2622
	ldrh r1, [r4, 0x30]
	movs r0, 0xFF
	subs r0, r1
	strh r0, [r4, 0x30]
_080B2622:
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	ldr r3, _080B2684 @ =gOamMatrices
	lsls r2, r6, 3
	adds r2, r3
	adds r1, 0x40
	lsls r1, 1
	adds r1, r5
	ldrh r1, [r1]
	strh r1, [r2, 0x6]
	strh r1, [r2]
	strh r0, [r2, 0x2]
	lsls r0, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r2, 0x4]
	adds r3, r4, 0
	adds r3, 0x3F
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	movs r0, 0x1
	ands r0, r7
	cmp r0, 0
	beq _080B2672
	adds r2, r4, 0
	adds r2, 0x2A
	movs r1, 0x1
	movs r0, 0x1
	strb r0, [r2]
	ldrb r0, [r3]
	orrs r0, r1
	strb r0, [r3]
_080B2672:
	ldr r0, _080B2688 @ =sub_80B268C
	str r0, [r4, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B267C: .4byte gBattleAnimTarget
_080B2680: .4byte gSineTable
_080B2684: .4byte gOamMatrices
_080B2688: .4byte sub_80B268C
	thumb_func_end sub_80B2514

	thumb_func_start sub_80B268C
sub_80B268C: @ 80B268C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r4, r0, 0
	adds r5, r4, 0
	adds r5, 0x2E
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	movs r1, 0
	mov r8, r1
	movs r7, 0
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080B2770
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	muls r0, r1
	asrs r6, r0, 8
	strh r6, [r4, 0x24]
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	muls r0, r1
	asrs r3, r0, 8
	strh r3, [r4, 0x26]
	ldrh r2, [r4, 0x34]
	movs r1, 0xFF
	adds r0, r1, 0
	ands r0, r2
	ldrh r2, [r4, 0x3A]
	adds r0, r2
	strh r0, [r4, 0x3A]
	ldrh r2, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	ands r1, r2
	cmp r0, r1
	blt _080B2770
	ldrh r0, [r4, 0x20]
	adds r0, r6
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x22]
	adds r0, r3
	strh r0, [r4, 0x22]
	strh r7, [r4, 0x24]
	strh r7, [r4, 0x26]
	mov r0, sp
	adds r1, r5, 0
	movs r2, 0x10
	bl memcpy
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x10
	bl memset
	ldrh r0, [r4, 0x22]
	lsls r0, 8
	strh r0, [r5, 0x8]
	mov r0, sp
	ldrh r0, [r0, 0x6]
	lsrs r1, r0, 8
	strh r1, [r5, 0x6]
	strh r7, [r5, 0x2]
	mov r0, sp
	ldrh r0, [r0, 0x2]
	strh r0, [r5, 0xA]
	adds r0, r4, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B2740
	movs r0, 0x8
	ands r1, r0
	cmp r1, 0
	beq _080B2738
	ldr r0, _080B2734 @ =0x00008001
	b _080B274E
	.align 2, 0
_080B2734: .4byte 0x00008001
_080B2738:
	ldr r0, _080B273C @ =0x00008002
	b _080B274E
	.align 2, 0
_080B273C: .4byte 0x00008002
_080B2740:
	movs r0, 0x8
	ands r1, r0
	cmp r1, 0
	beq _080B274C
	movs r0, 0x1
	b _080B274E
_080B274C:
	movs r0, 0x2
_080B274E:
	strh r0, [r5, 0x4]
	mov r0, sp
	ldrh r0, [r0, 0x4]
	lsrs r0, 8
	strb r0, [r5, 0xC]
	subs r0, 0x2
	strb r0, [r5, 0xD]
	mov r0, sp
	ldrh r1, [r0, 0xE]
	lsls r1, 1
	ldrh r2, [r5, 0xE]
	movs r0, 0x1
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0xE]
	ldr r0, _080B277C @ =sub_80B1F94
	str r0, [r4, 0x1C]
_080B2770:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B277C: .4byte sub_80B1F94
	thumb_func_end sub_80B268C

	thumb_func_start sub_80B2780
sub_80B2780: @ 80B2780
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080B2798 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B279C
	adds r0, r5, 0
	movs r1, 0
	bl sub_8075160
	b _080B27A4
	.align 2, 0
_080B2798: .4byte gBattleAnimArgs
_080B279C:
	adds r0, r5, 0
	movs r1, 0
	bl sub_8075114
_080B27A4:
	ldr r4, _080B280C @ =gBattleAnimArgs
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080B27BC
	ldr r0, _080B2810 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B27D2
_080B27BC:
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080B27D8
	ldr r0, _080B2814 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B27D8
_080B27D2:
	ldrh r0, [r5, 0x20]
	adds r0, 0x8
	strh r0, [r5, 0x20]
_080B27D8:
	ldr r4, _080B280C @ =gBattleAnimArgs
	ldrb r1, [r4, 0x8]
	adds r0, r5, 0
	bl SeekSpriteAnim
	ldrh r0, [r5, 0x20]
	subs r0, 0x20
	strh r0, [r5, 0x20]
	ldr r0, _080B2818 @ =0x00000ccc
	strh r0, [r5, 0x30]
	ldrh r1, [r4, 0x8]
	movs r0, 0xC
	adds r2, r0, 0
	muls r2, r1
	adds r0, r2, 0
	ldrh r2, [r5, 0x24]
	adds r0, r2
	strh r0, [r5, 0x24]
	strh r1, [r5, 0x2E]
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x3C]
	ldr r0, _080B281C @ =sub_80B2820
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B280C: .4byte gBattleAnimArgs
_080B2810: .4byte gBattleAnimAttacker
_080B2814: .4byte gBattleAnimTarget
_080B2818: .4byte 0x00000ccc
_080B281C: .4byte sub_80B2820
	thumb_func_end sub_80B2780

	thumb_func_start sub_80B2820
sub_80B2820: @ 80B2820
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x24]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _080B284A
	strh r1, [r4, 0x2E]
	strh r1, [r4, 0x24]
	adds r0, r4, 0
	bl StartSpriteAnim
_080B284A:
	ldrh r0, [r4, 0x3C]
	subs r0, 0x1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080B2862
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B2862:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B2820

	thumb_func_start sub_80B2868
sub_80B2868: @ 80B2868
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r1, _080B2900 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r7, r0, r1
	ldrh r0, [r7, 0x8]
	movs r1, 0x1F
	ands r0, r1
	cmp r0, 0
	bne _080B28E2
	ldr r1, _080B2904 @ =gUnknown_2037EE2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	movs r5, 0xD
	negs r5, r5
	adds r1, r5, 0
	bl Sin
	ldr r4, _080B2908 @ =gBattleAnimArgs
	strh r0, [r4]
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	adds r1, r5, 0
	bl Cos
	strh r0, [r4, 0x2]
	movs r0, 0x1
	strh r0, [r4, 0x4]
	movs r0, 0x3
	strh r0, [r4, 0x6]
	ldr r0, _080B290C @ =gUnknown_83E7C98
	mov r8, r0
	ldr r5, _080B2910 @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	mov r0, r8
	adds r1, r4, 0
	movs r3, 0x3
	bl CreateSpriteAndAnimate
_080B28E2:
	ldrh r0, [r7, 0x8]
	adds r0, 0x8
	strh r0, [r7, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080B28F6
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080B28F6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2900: .4byte gTasks
_080B2904: .4byte gUnknown_2037EE2
_080B2908: .4byte gBattleAnimArgs
_080B290C: .4byte gUnknown_83E7C98
_080B2910: .4byte gBattleAnimTarget
	thumb_func_end sub_80B2868

	thumb_func_start sub_80B2914
sub_80B2914: @ 80B2914
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080B2926
	cmp r0, 0x1
	beq _080B2958
	b _080B296C
_080B2926:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8075160
	movs r0, 0
	bl GetAnimBankSpriteId
	ldr r2, _080B2954 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080B296C
	.align 2, 0
_080B2954: .4byte gSprites
_080B2958:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080B296C
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B296C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B2914

	thumb_func_start sub_80B2974
sub_80B2974: @ 80B2974
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080B29AC
	cmp r0, 0x1
	bgt _080B298A
	cmp r0, 0
	beq _080B2990
	b _080B29FE
_080B298A:
	cmp r0, 0x2
	beq _080B29C0
	b _080B29FE
_080B2990:
	ldr r0, _080B29A8 @ =gBattleAnimTarget
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	negs r0, r0
	subs r0, 0x20
	strh r0, [r4, 0x26]
	b _080B29B8
	.align 2, 0
_080B29A8: .4byte gBattleAnimTarget
_080B29AC:
	ldrh r0, [r4, 0x26]
	adds r0, 0xA
	strh r0, [r4, 0x26]
	lsls r0, 16
	cmp r0, 0
	blt _080B29FE
_080B29B8:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080B29FE
_080B29C0:
	ldrh r0, [r4, 0x26]
	subs r0, 0xA
	strh r0, [r4, 0x26]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _080B29FE
	movs r0, 0
	bl GetAnimBankSpriteId
	ldr r2, _080B2A04 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B29FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2A04: .4byte gSprites
	thumb_func_end sub_80B2974

	thumb_func_start sub_80B2A08
sub_80B2A08: @ 80B2A08
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r1, _080B2A44 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldr r0, _080B2A48 @ =sub_80B2A50
	str r0, [r4, 0x1C]
	movs r0, 0
	bl GetAnimBankSpriteId
	ldr r2, _080B2A4C @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2A44: .4byte gBattleAnimArgs
_080B2A48: .4byte sub_80B2A50
_080B2A4C: .4byte gSprites
	thumb_func_end sub_80B2A08

	thumb_func_start sub_80B2A50
sub_80B2A50: @ 80B2A50
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _080B2A64
	subs r0, r1, 0x1
	strh r0, [r2, 0x2E]
	b _080B2AA8
_080B2A64:
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	ble _080B2A8A
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r2, 0x26]
	subs r1, r0
	strh r1, [r2, 0x26]
	b _080B2AA8
_080B2A8A:
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x34]
	adds r1, r0, 0x1
	strh r1, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080B2AA8
	ldr r0, _080B2AAC @ =sub_80B2AB0
	str r0, [r2, 0x1C]
_080B2AA8:
	pop {r0}
	bx r0
	.align 2, 0
_080B2AAC: .4byte sub_80B2AB0
	thumb_func_end sub_80B2A50

	thumb_func_start sub_80B2AB0
sub_80B2AB0: @ 80B2AB0
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r2, 0x26]
	adds r0, r1
	strh r0, [r2, 0x26]
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	ble _080B2AE0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
_080B2AE0:
	movs r1, 0x26
	ldrsh r0, [r2, r1]
	cmp r0, 0
	ble _080B2AEE
	adds r0, r2, 0
	bl DestroyAnimSprite
_080B2AEE:
	pop {r0}
	bx r0
	thumb_func_end sub_80B2AB0

	thumb_func_start sub_80B2AF4
sub_80B2AF4: @ 80B2AF4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080B2B08
	cmp r0, 0x1
	beq _080B2B60
	b _080B2BCC
_080B2B08:
	ldr r0, _080B2B18 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _080B2B20
	ldr r4, _080B2B1C @ =gBattleAnimAttacker
	b _080B2B22
	.align 2, 0
_080B2B18: .4byte gBattleAnimArgs
_080B2B1C: .4byte gBattleAnimAttacker
_080B2B20:
	ldr r4, _080B2B5C @ =gBattleAnimTarget
_080B2B22:
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
	movs r0, 0
	movs r3, 0x80
	lsls r3, 2
	strh r3, [r5, 0x30]
	movs r2, 0x80
	lsls r2, 1
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0
	bl sub_8075A1C
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080B2BCC
	.align 2, 0
_080B2B5C: .4byte gBattleAnimTarget
_080B2B60:
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	cmp r0, 0xB
	bgt _080B2B6E
	ldrh r0, [r5, 0x30]
	subs r0, 0x28
	b _080B2B72
_080B2B6E:
	ldrh r0, [r5, 0x30]
	adds r0, 0x28
_080B2B72:
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r5, 0x32]
	movs r2, 0x80
	lsls r2, 1
	movs r0, 0x30
	ldrsh r3, [r5, r0]
	str r1, [sp]
	adds r0, r5, 0
	bl sub_8075A1C
	ldrb r1, [r5, 0x3]
	lsls r1, 26
	lsrs r1, 27
	movs r0, 0xF4
	lsls r0, 6
	ldr r2, _080B2BD4 @ =gOamMatrices
	lsls r1, 3
	adds r1, r2
	movs r2, 0x6
	ldrsh r1, [r1, r2]
	bl __divsi3
	adds r1, r0, 0x1
	cmp r1, 0x80
	ble _080B2BAC
	movs r1, 0x80
_080B2BAC:
	movs r0, 0x40
	subs r0, r1
	lsrs r1, r0, 31
	adds r0, r1
	asrs r1, r0, 1
	strh r1, [r5, 0x26]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	cmp r0, 0x18
	bne _080B2BCC
	adds r0, r5, 0
	bl sub_8075AD8
	adds r0, r5, 0
	bl DestroyAnimSprite
_080B2BCC:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B2BD4: .4byte gOamMatrices
	thumb_func_end sub_80B2AF4

	thumb_func_start sub_80B2BD8
sub_80B2BD8: @ 80B2BD8
	push {r4,r5,lr}
	adds r5, r0, 0
	bl Random
	ldr r4, _080B2BFC @ =0x000001ff
	ands r4, r0
	bl Random
	movs r1, 0x7F
	ands r1, r0
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080B2C00
	movs r2, 0xB8
	lsls r2, 2
	adds r0, r4, r2
	b _080B2C08
	.align 2, 0
_080B2BFC: .4byte 0x000001ff
_080B2C00:
	movs r2, 0xB8
	lsls r2, 2
	adds r0, r2, 0
	subs r0, r4
_080B2C08:
	strh r0, [r5, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B2C1C
	movs r2, 0xE0
	lsls r2, 2
	adds r0, r2, 0
	adds r0, r1, r0
	b _080B2C24
_080B2C1C:
	movs r2, 0xE0
	lsls r2, 2
	adds r0, r2, 0
	subs r0, r1
_080B2C24:
	strh r0, [r5, 0x30]
	ldr r2, _080B2C4C @ =gBattleAnimArgs
	ldrh r0, [r2]
	strh r0, [r5, 0x32]
	lsls r0, 16
	cmp r0, 0
	beq _080B2C40
	ldrb r0, [r5, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	orrs r1, r0
	strb r1, [r5, 0x3]
_080B2C40:
	movs r1, 0x2
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080B2C54
	ldr r4, _080B2C50 @ =gBattleAnimAttacker
	b _080B2C56
	.align 2, 0
_080B2C4C: .4byte gBattleAnimArgs
_080B2C50: .4byte gBattleAnimAttacker
_080B2C54:
	ldr r4, _080B2C80 @ =gBattleAnimTarget
_080B2C56:
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
	adds r0, 0x20
	strh r0, [r5, 0x22]
	ldr r0, _080B2C84 @ =sub_80B2C88
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B2C80: .4byte gBattleAnimTarget
_080B2C84: .4byte sub_80B2C88
	thumb_func_end sub_80B2BD8

	thumb_func_start sub_80B2C88
sub_80B2C88: @ 80B2C88
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B2CA0
	ldrh r3, [r4, 0x2E]
	lsls r0, r3, 16
	asrs r0, 24
	ldrh r1, [r4, 0x24]
	adds r0, r1
	b _080B2CAA
_080B2CA0:
	ldrh r3, [r4, 0x2E]
	lsls r1, r3, 16
	asrs r1, 24
	ldrh r0, [r4, 0x24]
	subs r0, r1
_080B2CAA:
	strh r0, [r4, 0x24]
	ldrh r2, [r4, 0x30]
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r4, 0x26]
	subs r0, r1
	strh r0, [r4, 0x26]
	strh r3, [r4, 0x2E]
	adds r0, r2, 0
	subs r0, 0x20
	strh r0, [r4, 0x30]
	lsls r0, r3, 16
	cmp r0, 0
	bge _080B2CCA
	movs r0, 0
	strh r0, [r4, 0x2E]
_080B2CCA:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _080B2CDE
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B2CDE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B2C88

	thumb_func_start sub_80B2CE4
sub_80B2CE4: @ 80B2CE4
	movs r1, 0
	strh r1, [r0, 0x3A]
	movs r1, 0x40
	strh r1, [r0, 0x3C]
	ldr r1, _080B2CF4 @ =sub_80B2CF8
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080B2CF4: .4byte sub_80B2CF8
	thumb_func_end sub_80B2CE4

	thumb_func_start sub_80B2CF8
sub_80B2CF8: @ 80B2CF8
	push {lr}
	adds r3, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	cmp r1, 0
	beq _080B2D0A
	cmp r1, 0x1
	beq _080B2D58
	b _080B2D5E
_080B2D0A:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080B2D5E
	strh r1, [r3, 0x30]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	ldrb r2, [r1]
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
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080B2D5E
	ldrb r1, [r1]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080B2D5E
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	b _080B2D5E
_080B2D58:
	adds r0, r3, 0
	bl DestroyAnimSprite
_080B2D5E:
	pop {r0}
	bx r0
	thumb_func_end sub_80B2CF8

	thumb_func_start sub_80B2D64
sub_80B2D64: @ 80B2D64
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r8, r0
	ldrh r4, [r0, 0x20]
	ldrh r5, [r0, 0x22]
	ldr r6, _080B2E18 @ =gBattleAnimAttacker
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	strh r0, [r1, 0x20]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8074480
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	mov r2, r8
	strh r6, [r2, 0x22]
	ldrh r0, [r2, 0x20]
	mov r9, r0
	mov r1, r9
	lsls r0, r1, 4
	strh r0, [r2, 0x36]
	lsls r0, r6, 4
	strh r0, [r2, 0x38]
	lsls r4, 16
	asrs r4, 16
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	subs r0, r4, r0
	lsls r0, 4
	movs r1, 0xC
	bl __divsi3
	mov r2, r8
	strh r0, [r2, 0x3A]
	lsls r5, 16
	asrs r5, 16
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	subs r0, r5, r0
	lsls r0, 4
	movs r1, 0xC
	bl __divsi3
	mov r2, r8
	strh r0, [r2, 0x3C]
	mov r0, r9
	subs r4, r0
	lsls r4, 16
	asrs r4, 16
	subs r5, r6
	lsls r5, 16
	asrs r5, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8075B30
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 24
	adds r0, r1
	lsrs r0, 16
	movs r3, 0x80
	lsls r3, 1
	str r0, [sp]
	mov r0, r8
	movs r1, 0x1
	adds r2, r3, 0
	bl sub_8075A1C
	ldr r0, _080B2E1C @ =sub_80B2E20
	mov r2, r8
	str r0, [r2, 0x1C]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B2E18: .4byte gBattleAnimAttacker
_080B2E1C: .4byte sub_80B2E20
	thumb_func_end sub_80B2D64

	thumb_func_start sub_80B2E20
sub_80B2E20: @ 80B2E20
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x3A]
	ldrh r1, [r2, 0x36]
	adds r0, r1
	strh r0, [r2, 0x36]
	ldrh r1, [r2, 0x3C]
	ldrh r3, [r2, 0x38]
	adds r1, r3
	strh r1, [r2, 0x38]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r3, r1, 20
	strh r3, [r2, 0x22]
	adds r0, 0x2D
	lsls r0, 16
	movs r1, 0xA5
	lsls r1, 17
	cmp r0, r1
	bhi _080B2E5A
	adds r1, r3, 0
	cmp r1, 0x9D
	bgt _080B2E5A
	movs r0, 0x2D
	negs r0, r0
	cmp r1, r0
	bge _080B2E60
_080B2E5A:
	adds r0, r2, 0
	bl move_anim_8074EE0
_080B2E60:
	pop {r0}
	bx r0
	thumb_func_end sub_80B2E20

	thumb_func_start sub_80B2E64
sub_80B2E64: @ 80B2E64
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080B2E94 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B2E9C
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B2E98 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	b _080B2EBA
	.align 2, 0
_080B2E94: .4byte gBattleAnimArgs
_080B2E98: .4byte gSprites
_080B2E9C:
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B2EC8 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
_080B2EBA:
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2EC8: .4byte gSprites
	thumb_func_end sub_80B2E64

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
	ldr r0, _080B3160 @ =gUnknown_2023D44
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
	ldr r0, _080B3160 @ =gUnknown_2023D44
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
_080B3160: .4byte gUnknown_2023D44
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

	thumb_func_start sub_80B4634
sub_80B4634: @ 80B4634
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080B46A0 @ =gBattleAnimArgs
	movs r1, 0x6
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _080B4654
	ldr r0, _080B46A4 @ =gBattleAnimTarget
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x20
	adds r3, r5, 0
	adds r3, 0x22
	movs r1, 0
	bl sub_8076D9C
_080B4654:
	ldrh r0, [r6]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	movs r4, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x22]
	adds r0, 0xE
	strh r0, [r5, 0x22]
	ldrb r1, [r6, 0x2]
	adds r0, r5, 0
	bl StartSpriteAnim
	adds r0, r5, 0
	bl AnimateSprite
	strh r4, [r5, 0x2E]
	strh r4, [r5, 0x30]
	movs r0, 0x4
	strh r0, [r5, 0x32]
	movs r0, 0x10
	strh r0, [r5, 0x34]
	ldr r0, _080B46A8 @ =0x0000ffba
	strh r0, [r5, 0x36]
	ldrh r0, [r6, 0x4]
	strh r0, [r5, 0x38]
	ldr r1, _080B46AC @ =sub_80B46B4
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	ldr r1, _080B46B0 @ =sub_8074BE4
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B46A0: .4byte gBattleAnimArgs
_080B46A4: .4byte gBattleAnimTarget
_080B46A8: .4byte 0x0000ffba
_080B46AC: .4byte sub_80B46B4
_080B46B0: .4byte sub_8074BE4
	thumb_func_end sub_80B4634

	thumb_func_start sub_80B46B4
sub_80B46B4: @ 80B46B4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x38]
	ldrh r2, [r4, 0x20]
	adds r0, r1, r2
	strh r0, [r4, 0x20]
	movs r0, 0xC0
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	movs r0, 0x4
	strh r0, [r4, 0x32]
	movs r0, 0x20
	strh r0, [r4, 0x34]
	ldr r0, _080B46EC @ =0x0000ffe8
	strh r0, [r4, 0x36]
	ldr r1, _080B46F0 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r1, _080B46F4 @ =sub_8074BE4
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B46EC: .4byte 0x0000ffe8
_080B46F0: .4byte move_anim_8074EE0
_080B46F4: .4byte sub_8074BE4
	thumb_func_end sub_80B46B4

	thumb_func_start sub_80B46F8
sub_80B46F8: @ 80B46F8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080B4720 @ =gBattleAnimArgs
	ldrb r1, [r4, 0xA]
	bl StartSpriteAnim
	adds r0, r5, 0
	bl AnimateSprite
	ldr r0, _080B4724 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B4728
	ldrh r0, [r5, 0x20]
	ldrh r1, [r4]
	subs r0, r1
	b _080B472E
	.align 2, 0
_080B4720: .4byte gBattleAnimArgs
_080B4724: .4byte gBattleAnimAttacker
_080B4728:
	ldrh r0, [r4]
	ldrh r1, [r5, 0x20]
	adds r0, r1
_080B472E:
	strh r0, [r5, 0x20]
	ldr r3, _080B4770 @ =gBattleAnimArgs
	ldrh r2, [r3, 0x2]
	ldrh r0, [r5, 0x22]
	adds r2, r0
	movs r4, 0
	strh r2, [r5, 0x22]
	ldrh r0, [r3, 0x8]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldrh r1, [r3, 0x4]
	adds r0, r1
	strh r0, [r5, 0x32]
	strh r2, [r5, 0x34]
	ldrh r0, [r3, 0x6]
	adds r2, r0
	strh r2, [r5, 0x36]
	adds r0, r5, 0
	bl sub_80754B8
	strh r4, [r5, 0x34]
	strh r4, [r5, 0x36]
	ldr r0, _080B4774 @ =sub_8074D00
	str r0, [r5, 0x1C]
	ldr r1, _080B4778 @ =move_anim_8074EE0
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B4770: .4byte gBattleAnimArgs
_080B4774: .4byte sub_8074D00
_080B4778: .4byte move_anim_8074EE0
	thumb_func_end sub_80B46F8

	thumb_func_start sub_80B477C
sub_80B477C: @ 80B477C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080B4794 @ =gBattleAnimArgs
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B4798
	adds r0, r4, 0
	movs r1, 0
	bl sub_8075160
	b _080B47A0
	.align 2, 0
_080B4794: .4byte gBattleAnimArgs
_080B4798:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8075114
_080B47A0:
	ldr r1, _080B47BC @ =gBattleAnimArgs
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x32]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x34]
	ldr r0, _080B47C0 @ =sub_80B47C4
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B47BC: .4byte gBattleAnimArgs
_080B47C0: .4byte sub_80B47C4
	thumb_func_end sub_80B477C

	thumb_func_start sub_80B47C4
sub_80B47C4: @ 80B47C4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x36]
	adds r0, r1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x26]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x32]
	ldrh r1, [r4, 0x38]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080B480A
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B480A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B47C4

	thumb_func_start do_boulder_dust
do_boulder_dust: @ 80B4810
	push {r4-r6,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	ldr r1, _080B48E4 @ =0x00003f42
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
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080B4854
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0x1
	bl SetAnimBgAttribute
_080B4854:
	ldr r0, _080B48E8 @ =gBattle_BG1_X
	strh r5, [r0]
	ldr r4, _080B48EC @ =gBattle_BG1_Y
	strh r5, [r4]
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
	ldr r1, _080B48F0 @ =gFile_graphics_battle_anims_backgrounds_sandstorm_brew_tilemap
	bl sub_807543C
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080B48F4 @ =gFile_graphics_battle_anims_backgrounds_sandstorm_brew_sheet
	mov r2, sp
	ldrh r2, [r2, 0xA]
	bl sub_80753B4
	ldr r0, _080B48F8 @ =gFile_graphics_battle_anims_sprites_261_palette
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080B48B0
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80730C0
_080B48B0:
	ldr r0, _080B48FC @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080B48CA
	ldr r0, _080B4900 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B48CA
	movs r5, 0x1
_080B48CA:
	ldr r0, _080B4904 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	strh r5, [r1, 0x8]
	ldr r0, _080B4908 @ =sub_80B490C
	str r0, [r1]
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B48E4: .4byte 0x00003f42
_080B48E8: .4byte gBattle_BG1_X
_080B48EC: .4byte gBattle_BG1_Y
_080B48F0: .4byte gFile_graphics_battle_anims_backgrounds_sandstorm_brew_tilemap
_080B48F4: .4byte gFile_graphics_battle_anims_backgrounds_sandstorm_brew_sheet
_080B48F8: .4byte gFile_graphics_battle_anims_sprites_261_palette
_080B48FC: .4byte gBattleAnimArgs
_080B4900: .4byte gBattleAnimAttacker
_080B4904: .4byte gTasks
_080B4908: .4byte sub_80B490C
	thumb_func_end do_boulder_dust

	thumb_func_start sub_80B490C
sub_80B490C: @ 80B490C
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080B4934 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0
	bne _080B4940
	ldr r1, _080B4938 @ =gBattle_BG1_X
	ldr r3, _080B493C @ =0x0000fffa
	adds r0, r3, 0
	ldrh r3, [r1]
	adds r0, r3
	b _080B4946
	.align 2, 0
_080B4934: .4byte gTasks
_080B4938: .4byte gBattle_BG1_X
_080B493C: .4byte 0x0000fffa
_080B4940:
	ldr r1, _080B4974 @ =gBattle_BG1_X
	ldrh r0, [r1]
	adds r0, 0x6
_080B4946:
	strh r0, [r1]
	ldr r1, _080B4978 @ =gBattle_BG1_Y
	ldr r3, _080B497C @ =0x0000ffff
	adds r0, r3, 0
	ldrh r3, [r1]
	adds r0, r3
	strh r0, [r1]
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r0, 3
	adds r0, r2
	movs r3, 0x20
	ldrsh r0, [r0, r3]
	adds r4, r1, 0
	cmp r0, 0x4
	bls _080B4968
	b _080B4A96
_080B4968:
	lsls r0, 2
	ldr r1, _080B4980 @ =_080B4984
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B4974: .4byte gBattle_BG1_X
_080B4978: .4byte gBattle_BG1_Y
_080B497C: .4byte 0x0000ffff
_080B4980: .4byte _080B4984
	.align 2, 0
_080B4984:
	.4byte _080B4998
	.4byte _080B49DA
	.4byte _080B49F4
	.4byte _080B4A36
	.4byte _080B4A58
_080B4998:
	adds r0, r4, r5
	lsls r0, 3
	adds r4, r0, r2
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080B4A96
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
	cmp r0, 0x7
	bne _080B4A96
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	strh r5, [r4, 0x1E]
	b _080B4A96
_080B49DA:
	adds r0, r4, r5
	lsls r0, 3
	adds r1, r0, r2
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	strh r0, [r1, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x65
	bne _080B4A96
	movs r0, 0x7
	strh r0, [r1, 0x1E]
	b _080B4A4C
_080B49F4:
	adds r0, r4, r5
	lsls r0, 3
	adds r4, r0, r2
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080B4A96
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
	bne _080B4A96
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	strh r1, [r4, 0x1E]
	b _080B4A96
_080B4A36:
	mov r0, sp
	bl sub_80752A0
	mov r0, sp
	ldrb r0, [r0, 0x9]
	bl sub_8075358
	ldr r0, _080B4A54 @ =gTasks
	adds r1, r4, r5
	lsls r1, 3
	adds r1, r0
_080B4A4C:
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	b _080B4A96
	.align 2, 0
_080B4A54: .4byte gTasks
_080B4A58:
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080B4A6C
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0
	bl SetAnimBgAttribute
_080B4A6C:
	ldr r0, _080B4AA0 @ =gBattle_BG1_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080B4AA4 @ =gBattle_BG1_Y
	strh r1, [r0]
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
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080B4A96:
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B4AA0: .4byte gBattle_BG1_X
_080B4AA4: .4byte gBattle_BG1_Y
	thumb_func_end sub_80B490C

	thumb_func_start sub_80B4AA8
sub_80B4AA8: @ 80B4AA8
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080B4B24
	ldr r4, _080B4AEC @ =gBattleAnimArgs
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080B4AF4
	ldr r0, _080B4AF0 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B4AF4
	movs r0, 0x98
	lsls r0, 1
	strh r0, [r5, 0x20]
	ldrh r0, [r4, 0x2]
	negs r0, r0
	strh r0, [r4, 0x2]
	movs r0, 0x1
	strh r0, [r5, 0x38]
	ldrb r1, [r5, 0x3]
	subs r0, 0x40
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r5, 0x3]
	b _080B4AF8
	.align 2, 0
_080B4AEC: .4byte gBattleAnimArgs
_080B4AF0: .4byte gBattleAnimAttacker
_080B4AF4:
	ldr r0, _080B4B18 @ =0x0000ffc0
	strh r0, [r5, 0x20]
_080B4AF8:
	ldr r4, _080B4B1C @ =gBattleAnimArgs
	ldrh r0, [r4]
	strh r0, [r5, 0x22]
	ldr r1, _080B4B20 @ =gUnknown_83E7470
	adds r0, r5, 0
	bl SetSubspriteTables
	ldrh r0, [r4, 0x2]
	strh r0, [r5, 0x30]
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080B4B80
	.align 2, 0
_080B4B18: .4byte 0x0000ffc0
_080B4B1C: .4byte gBattleAnimArgs
_080B4B20: .4byte gUnknown_83E7470
_080B4B24:
	ldrh r1, [r5, 0x30]
	ldrh r3, [r5, 0x34]
	adds r1, r3
	ldrh r2, [r5, 0x32]
	ldrh r0, [r5, 0x36]
	adds r2, r0
	lsls r0, r1, 16
	asrs r0, 24
	ldrh r3, [r5, 0x24]
	adds r0, r3
	strh r0, [r5, 0x24]
	lsls r0, r2, 16
	asrs r0, 24
	ldrh r3, [r5, 0x26]
	adds r0, r3
	strh r0, [r5, 0x26]
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r5, 0x34]
	ands r2, r0
	strh r2, [r5, 0x36]
	movs r1, 0x38
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080B4B6A
	movs r2, 0x20
	ldrsh r0, [r5, r2]
	movs r3, 0x24
	ldrsh r1, [r5, r3]
	adds r0, r1
	movs r1, 0x88
	lsls r1, 1
	cmp r0, r1
	ble _080B4B80
	b _080B4B7C
_080B4B6A:
	movs r1, 0x20
	ldrsh r0, [r5, r1]
	movs r2, 0x24
	ldrsh r1, [r5, r2]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _080B4B80
_080B4B7C:
	ldr r0, _080B4B88 @ =DestroyAnimSprite
	str r0, [r5, 0x1C]
_080B4B80:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B4B88: .4byte DestroyAnimSprite
	thumb_func_end sub_80B4AA8

	thumb_func_start sub_80B4B8C
sub_80B4B8C: @ 80B4B8C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080B4BC4 @ =gBattleAnimArgs
	ldrb r1, [r5, 0x8]
	bl StartSpriteAnim
	adds r0, r4, 0
	movs r1, 0
	bl sub_8075160
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0x4]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x36]
	ldr r0, _080B4BC8 @ =sub_8075590
	str r0, [r4, 0x1C]
	ldr r1, _080B4BCC @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B4BC4: .4byte gBattleAnimArgs
_080B4BC8: .4byte sub_8075590
_080B4BCC: .4byte DestroyAnimSprite
	thumb_func_end sub_80B4B8C

	thumb_func_start sub_80B4BD0
sub_80B4BD0: @ 80B4BD0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B4C50 @ =gTasks
	adds r6, r1, r0
	ldr r5, _080B4C54 @ =gBattleAnimAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 8
	movs r1, 0xC0
	lsls r1, 13
	adds r0, r1
	lsrs r7, r0, 16
	ldr r4, _080B4C58 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 8
	movs r2, 0xC0
	lsls r2, 13
	adds r0, r2
	lsrs r0, 16
	mov r8, r0
	ldrb r1, [r5]
	movs r0, 0x2
	eors r0, r1
	ldrb r4, [r4]
	cmp r0, r4
	bne _080B4C40
	mov r8, r7
_080B4C40:
	bl sub_80B4FB8
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bne _080B4C5C
	movs r0, 0x20
	b _080B4C62
	.align 2, 0
_080B4C50: .4byte gTasks
_080B4C54: .4byte gBattleAnimAttacker
_080B4C58: .4byte gBattleAnimTarget
_080B4C5C:
	lsls r1, r5, 3
	movs r0, 0x30
	subs r0, r1
_080B4C62:
	strh r0, [r6, 0x18]
	movs r4, 0
	strh r4, [r6, 0x8]
	strh r4, [r6, 0x1E]
	strh r4, [r6, 0x1A]
	movs r0, 0x1
	strh r0, [r6, 0x20]
	movs r1, 0x18
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bge _080B4C7A
	adds r0, 0x7
_080B4C7A:
	asrs r0, 3
	subs r0, 0x1
	strh r0, [r6, 0x1C]
	mov r2, r9
	lsls r0, r2, 3
	strh r0, [r6, 0xC]
	lsls r0, r7, 3
	strh r0, [r6, 0xE]
	mov r1, r10
	subs r0, r1, r2
	lsls r0, 3
	movs r2, 0x18
	ldrsh r1, [r6, r2]
	bl __divsi3
	strh r0, [r6, 0x10]
	mov r1, r8
	subs r0, r1, r7
	lsls r0, 3
	movs r2, 0x18
	ldrsh r1, [r6, r2]
	bl __divsi3
	strh r0, [r6, 0x12]
	strh r4, [r6, 0x14]
	strh r4, [r6, 0x16]
	movs r0, 0x40
	negs r0, r0
	bl sub_8073A44
	adds r4, r0, 0
	lsls r4, 24
	asrs r4, 8
	lsrs r4, 16
	movs r0, 0x3F
	bl sub_8073A44
	lsls r0, 24
	strh r4, [r6, 0x22]
	asrs r0, 24
	lsls r4, 16
	asrs r4, 16
	subs r0, r4
	movs r2, 0x18
	ldrsh r1, [r6, r2]
	bl __divsi3
	strh r0, [r6, 0x24]
	strh r5, [r6, 0xA]
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x26]
	ldr r0, _080B4CFC @ =sub_80B4D00
	str r0, [r6]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4CFC: .4byte sub_80B4D00
	thumb_func_end sub_80B4BD0

	thumb_func_start sub_80B4D00
sub_80B4D00: @ 80B4D00
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080B4D24 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080B4D1A
	b _080B4E68
_080B4D1A:
	lsls r0, 2
	ldr r1, _080B4D28 @ =_080B4D2C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B4D24: .4byte gTasks
_080B4D28: .4byte _080B4D2C
	.align 2, 0
_080B4D2C:
	.4byte _080B4D40
	.4byte _080B4DA4
	.4byte _080B4DAC
	.4byte _080B4E08
	.4byte _080B4E5A
_080B4D40:
	ldrh r2, [r4, 0x14]
	ldrh r0, [r4, 0x10]
	subs r2, r0
	strh r2, [r4, 0x14]
	ldrh r0, [r4, 0x16]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0x16]
	ldr r3, _080B4DA0 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	lsls r2, 16
	asrs r2, 19
	strh r2, [r0, 0x24]
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r0, [r4, 0x16]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r1, 0x26]
	ldrh r0, [r4, 0x1A]
	adds r0, 0x1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _080B4D90
	movs r0, 0x14
	strh r0, [r4, 0x1E]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080B4D90:
	ldrh r1, [r4, 0x22]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x9B
	bl PlaySE12WithPanning
	b _080B4E68
	.align 2, 0
_080B4DA0: .4byte gSprites
_080B4DA4:
	ldrh r0, [r4, 0x1E]
	subs r0, 0x1
	strh r0, [r4, 0x1E]
	b _080B4E4C
_080B4DAC:
	ldrh r0, [r4, 0x1A]
	subs r0, 0x1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	beq _080B4DCC
	ldrh r0, [r4, 0x10]
	ldrh r2, [r4, 0x14]
	adds r0, r2
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0x12]
	ldrh r1, [r4, 0x16]
	adds r0, r1
	strh r0, [r4, 0x16]
	b _080B4DD6
_080B4DCC:
	strh r0, [r4, 0x14]
	strh r0, [r4, 0x16]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080B4DD6:
	ldr r2, _080B4E04 @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r4, 0x14]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r1, 0x24]
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r4, 0x16]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r1, 0x26]
	b _080B4E68
	.align 2, 0
_080B4E04: .4byte gSprites
_080B4E08:
	ldrh r0, [r4, 0x10]
	ldrh r2, [r4, 0xC]
	adds r0, r2
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x12]
	ldrh r1, [r4, 0xE]
	adds r0, r1
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0x1A]
	adds r0, 0x1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x1C
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _080B4E46
	movs r0, 0
	strh r0, [r4, 0x1A]
	adds r0, r4, 0
	bl sub_80B4E70
	ldrh r1, [r4, 0x24]
	ldrh r0, [r4, 0x22]
	adds r1, r0
	strh r1, [r4, 0x22]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xA8
	bl PlaySE12WithPanning
_080B4E46:
	ldrh r0, [r4, 0x18]
	subs r0, 0x1
	strh r0, [r4, 0x18]
_080B4E4C:
	lsls r0, 16
	cmp r0, 0
	bne _080B4E68
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B4E68
_080B4E5A:
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B4E68
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080B4E68:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B4D00

	thumb_func_start sub_80B4E70
sub_80B4E70: @ 80B4E70
	push {r4-r7,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bhi _080B4F60
	lsls r0, 2
	ldr r1, _080B4E8C @ =_080B4E90
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B4E8C: .4byte _080B4E90
	.align 2, 0
_080B4E90:
	.4byte _080B4EA4
	.4byte _080B4EB0
	.4byte _080B4EB0
	.4byte _080B4EBC
	.4byte _080B4EC8
_080B4EA4:
	ldr r3, _080B4EAC @ =gUnknown_83E74D8
	movs r5, 0
	b _080B4ECC
	.align 2, 0
_080B4EAC: .4byte gUnknown_83E74D8
_080B4EB0:
	ldr r3, _080B4EB8 @ =gUnknown_83E74F0
	movs r5, 0x50
	b _080B4ECC
	.align 2, 0
_080B4EB8: .4byte gUnknown_83E74F0
_080B4EBC:
	ldr r3, _080B4EC4 @ =gUnknown_83E74F0
	movs r5, 0x40
	b _080B4ECC
	.align 2, 0
_080B4EC4: .4byte gUnknown_83E74F0
_080B4EC8:
	ldr r3, _080B4F68 @ =gUnknown_83E74F0
	movs r5, 0x30
_080B4ECC:
	ldrh r1, [r4, 0xC]
	lsls r1, 16
	asrs r1, 19
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r4, 0xE]
	lsls r2, 16
	asrs r2, 19
	lsls r2, 16
	movs r6, 0x20
	ldrsh r0, [r4, r6]
	lsls r0, 2
	adds r1, r0
	lsls r1, 16
	lsrs r6, r1, 16
	asrs r1, 16
	lsrs r7, r2, 16
	asrs r2, 16
	adds r0, r3, 0
	movs r3, 0x23
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080B4F58
	ldr r1, _080B4F6C @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0x12
	strh r1, [r0, 0x2E]
	movs r2, 0x20
	ldrsh r1, [r4, r2]
	lsls r2, r1, 2
	adds r2, r1
	lsls r2, 2
	adds r2, r6, r2
	movs r6, 0xA
	ldrsh r3, [r4, r6]
	lsls r1, r3, 1
	adds r1, r3
	adds r2, r1
	strh r2, [r0, 0x32]
	strh r7, [r0, 0x36]
	movs r1, 0xA
	ldrsh r2, [r4, r1]
	lsls r2, 1
	movs r3, 0x10
	negs r3, r3
	adds r1, r3, 0
	subs r1, r2
	strh r1, [r0, 0x38]
	ldrh r3, [r0, 0x4]
	lsls r2, r3, 22
	lsrs r2, 22
	adds r2, r5
	ldr r5, _080B4F70 @ =0x000003ff
	adds r1, r5, 0
	ands r2, r1
	ldr r1, _080B4F74 @ =0xfffffc00
	ands r1, r3
	orrs r1, r2
	strh r1, [r0, 0x4]
	bl sub_8075068
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
_080B4F58:
	movs r6, 0x20
	ldrsh r0, [r4, r6]
	negs r0, r0
	strh r0, [r4, 0x20]
_080B4F60:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4F68: .4byte gUnknown_83E74F0
_080B4F6C: .4byte gSprites
_080B4F70: .4byte 0x000003ff
_080B4F74: .4byte 0xfffffc00
	thumb_func_end sub_80B4E70

	thumb_func_start sub_80B4F78
sub_80B4F78: @ 80B4F78
	push {r4,lr}
	adds r4, r0, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080B4FAA
	ldr r0, _080B4FB0 @ =sub_80B4D00
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080B4FA4
	ldr r0, _080B4FB4 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1E]
	subs r0, 0x1
	strh r0, [r1, 0x1E]
_080B4FA4:
	adds r0, r4, 0
	bl DestroySprite
_080B4FAA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4FB0: .4byte sub_80B4D00
_080B4FB4: .4byte gTasks
	thumb_func_end sub_80B4F78

	thumb_func_start sub_80B4FB8
sub_80B4FB8: @ 80B4FB8
	push {lr}
	ldr r0, _080B4FE0 @ =gUnknown_2037EE4
	ldr r0, [r0]
	ldrb r1, [r0, 0x11]
	lsrs r0, r1, 4
	lsls r1, 28
	lsrs r1, 28
	subs r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFF
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B4FDA
	movs r1, 0x1
_080B4FDA:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080B4FE0: .4byte gUnknown_2037EE4
	thumb_func_end sub_80B4FB8

	thumb_func_start sub_80B4FE4
sub_80B4FE4: @ 80B4FE4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080B501C @ =gBattleAnimArgs
	ldrb r1, [r5, 0x8]
	bl StartSpriteAnim
	ldrh r0, [r5]
	strh r0, [r4, 0x24]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x34]
	ldrh r1, [r5, 0x4]
	subs r0, r1
	strh r0, [r4, 0x34]
	movs r0, 0x3
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x30]
	ldr r0, _080B5020 @ =sub_80B5024
	str r0, [r4, 0x1C]
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B501C: .4byte gBattleAnimArgs
_080B5020: .4byte sub_80B5024
	thumb_func_end sub_80B4FE4

	thumb_func_start sub_80B5024
sub_80B5024: @ 80B5024
	push {lr}
	adds r2, r0, 0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r3]
	ldrh r1, [r2, 0x34]
	movs r3, 0x34
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _080B505C
	ldrh r3, [r2, 0x32]
	adds r0, r1, r3
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x2E]
	adds r1, r0
	strh r1, [r2, 0x34]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r1, 16
	cmp r1, 0
	ble _080B506E
	movs r0, 0
	strh r0, [r2, 0x34]
	b _080B506E
_080B505C:
	ldrh r0, [r2, 0x30]
	subs r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080B506E
	adds r0, r2, 0
	bl DestroyAnimSprite
_080B506E:
	pop {r0}
	bx r0
	thumb_func_end sub_80B5024

	thumb_func_start sub_80B5074
sub_80B5074: @ 80B5074
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080B509C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B5090
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080B5090:
	adds r0, r4, 0
	bl sub_8075DF4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B509C: .4byte gBattleAnimAttacker
	thumb_func_end sub_80B5074

	thumb_func_start sub_80B50A0
sub_80B50A0: @ 80B50A0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080B50EC @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B50F0 @ =gBattleAnimArgs
	ldrh r3, [r2]
	ldrh r5, [r4, 0x20]
	adds r1, r3, r5
	strh r1, [r4, 0x20]
	ldrh r1, [r2, 0x2]
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r3, [r4, 0x30]
	strh r1, [r4, 0x32]
	ldrh r0, [r2, 0x4]
	strh r0, [r4, 0x38]
	ldrb r1, [r2, 0x6]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _080B50F4 @ =sub_80B50F8
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B50EC: .4byte gBattleAnimTarget
_080B50F0: .4byte gBattleAnimArgs
_080B50F4: .4byte sub_80B50F8
	thumb_func_end sub_80B50A0

	thumb_func_start sub_80B50F8
sub_80B50F8: @ 80B50F8
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x8
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	movs r1, 0x28
	bl __divsi3
	ldrh r1, [r4, 0x24]
	adds r1, r0
	strh r1, [r4, 0x24]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x26]
	subs r1, r0
	strh r1, [r4, 0x26]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x8C
	ble _080B5142
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B5142:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B50F8

	thumb_func_start sub_80B5148
sub_80B5148: @ 80B5148
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080B5180 @ =gUnknown_2037EE8
	ldr r0, [r2]
	cmp r0, 0x20
	bgt _080B515C
	ldr r1, _080B5184 @ =gBattleAnimArgs
	movs r0, 0
	strh r0, [r1, 0xE]
_080B515C:
	ldr r2, [r2]
	adds r0, r2, 0
	subs r0, 0x21
	cmp r0, 0x20
	bhi _080B516C
	ldr r1, _080B5184 @ =gBattleAnimArgs
	movs r0, 0x1
	strh r0, [r1, 0xE]
_080B516C:
	cmp r2, 0x41
	ble _080B5176
	ldr r1, _080B5184 @ =gBattleAnimArgs
	movs r0, 0x2
	strh r0, [r1, 0xE]
_080B5176:
	adds r0, r3, 0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080B5180: .4byte gUnknown_2037EE8
_080B5184: .4byte gBattleAnimArgs
	thumb_func_end sub_80B5148

	thumb_func_start sub_80B5188
sub_80B5188: @ 80B5188
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080B51E4 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080B51AA
	movs r0, 0
	bl sub_8075458
	movs r0, 0xC8
	strh r0, [r5, 0xA]
_080B51AA:
	ldr r4, _080B51E8 @ =gBattle_BG3_Y
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	movs r1, 0xA
	bl __divsi3
	ldrh r1, [r4]
	adds r1, r0
	strh r1, [r4]
	ldrh r0, [r5, 0xA]
	subs r0, 0x3
	strh r0, [r5, 0xA]
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x78
	bne _080B51D6
	movs r0, 0x1
	bl sub_8075458
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080B51D6:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B51E4: .4byte gTasks
_080B51E8: .4byte gBattle_BG3_Y
	thumb_func_end sub_80B5188

	thumb_func_start sub_80B51EC
sub_80B51EC: @ 80B51EC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080B5258 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B5218
	movs r0, 0
	bl sub_8075458
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldr r0, _080B525C @ =gBattle_BG3_Y
	ldrh r0, [r0]
	strh r0, [r4, 0xC]
_080B5218:
	ldrh r0, [r4, 0xA]
	adds r0, 0x50
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0xA]
	ldr r6, _080B525C @ =gBattle_BG3_Y
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	movs r0, 0x4
	bl Cos
	ldrh r4, [r4, 0xC]
	adds r0, r4
	strh r0, [r6]
	ldr r0, _080B5260 @ =gBattleAnimArgs
	movs r2, 0xE
	ldrsh r1, [r0, r2]
	ldr r0, _080B5264 @ =0x00000fff
	cmp r1, r0
	bne _080B5250
	movs r0, 0
	strh r0, [r6]
	movs r0, 0x1
	bl sub_8075458
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080B5250:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5258: .4byte gTasks
_080B525C: .4byte gBattle_BG3_Y
_080B5260: .4byte gBattleAnimArgs
_080B5264: .4byte 0x00000fff
	thumb_func_end sub_80B51EC

	thumb_func_start sub_80B5268
sub_80B5268: @ 80B5268
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _080B52C4 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldr r5, _080B52C8 @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_8075678
	ldr r0, _080B52CC @ =sub_80B52D0
	str r0, [r4, 0x1C]
	movs r0, 0x10
	strh r0, [r4, 0x3A]
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	ldrh r1, [r4, 0x3A]
	movs r0, 0x52
	bl SetGpuReg
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B52C4: .4byte gBattleAnimArgs
_080B52C8: .4byte gBattleAnimTarget
_080B52CC: .4byte sub_80B52D0
	thumb_func_end sub_80B5268

	thumb_func_start sub_80B52D0
sub_80B52D0: @ 80B52D0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80B53C0
	adds r0, r4, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	beq _080B52F0
	ldr r0, _080B52EC @ =sub_80B5344
	str r0, [r4, 0x1C]
	b _080B533A
	.align 2, 0
_080B52EC: .4byte sub_80B5344
_080B52F0:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xF
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r2, [r4, 0x38]
	adds r0, r2, 0x5
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x38]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0
	beq _080B5328
	cmp r2, 0xC4
	ble _080B533A
_080B5328:
	lsls r0, 16
	cmp r0, 0
	ble _080B533A
	ldr r0, _080B5340 @ =gUnknown_2037F24
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0xBD
	bl PlaySE12WithPanning
_080B533A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5340: .4byte gUnknown_2037F24
	thumb_func_end sub_80B52D0

	thumb_func_start sub_80B5344
sub_80B5344: @ 80B5344
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_80755E0
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xF
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r2, [r4, 0x38]
	adds r0, r2, 0x5
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x38]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0
	beq _080B538A
	cmp r2, 0xC4
	ble _080B5396
_080B538A:
	lsls r0, 16
	cmp r0, 0
	ble _080B5396
	movs r0, 0xBD
	bl PlaySE
_080B5396:
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B53B4
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080B53B0 @ =sub_8074F88
	str r0, [r4, 0x1C]
	b _080B53BA
	.align 2, 0
_080B53B0: .4byte sub_8074F88
_080B53B4:
	adds r0, r4, 0
	bl sub_80B53C0
_080B53BA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B5344

	thumb_func_start sub_80B53C0
sub_80B53C0: @ 80B53C0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x3A]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0xFF
	ble _080B53E4
	adds r0, r2, 0x1
	strh r0, [r4, 0x3A]
	lsls r0, 16
	ldr r1, _080B53E0 @ =0x010d0000
	cmp r0, r1
	bne _080B544A
	movs r0, 0
	b _080B5448
	.align 2, 0
_080B53E0: .4byte 0x010d0000
_080B53E4:
	ldrh r1, [r4, 0x3C]
	adds r3, r1, 0x1
	strh r3, [r4, 0x3C]
	movs r0, 0xFF
	ands r0, r1
	cmp r0, 0
	bne _080B544A
	ldr r1, _080B5408 @ =0xffffff00
	ands r1, r3
	strh r1, [r4, 0x3C]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080B540C
	adds r0, r2, 0x1
	b _080B540E
	.align 2, 0
_080B5408: .4byte 0xffffff00
_080B540C:
	subs r0, r2, 0x1
_080B540E:
	strh r0, [r4, 0x3A]
	ldrh r0, [r4, 0x3A]
	movs r1, 0x10
	subs r1, r0
	lsls r1, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080B5430
	cmp r0, 0x10
	bne _080B543C
_080B5430:
	ldrh r0, [r4, 0x3C]
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	eors r0, r1
	strh r0, [r4, 0x3C]
_080B543C:
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B544A
	movs r0, 0x80
	lsls r0, 1
_080B5448:
	strh r0, [r4, 0x3A]
_080B544A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B53C0

	thumb_func_start sub_80B5450
sub_80B5450: @ 80B5450
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075114
	ldr r1, _080B546C @ =sub_80B5470
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B546C: .4byte sub_80B5470
	thumb_func_end sub_80B5450

	thumb_func_start sub_80B5470
sub_80B5470: @ 80B5470
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x20
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x8
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x41
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x82
	bhi _080B54A4
	ldrb r0, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x8
	b _080B54AE
_080B54A4:
	ldrb r0, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
_080B54AE:
	orrs r1, r0
	strb r1, [r4, 0x5]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x13
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x32]
	adds r0, 0x50
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3D
	bne _080B54E0
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B54E0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B5470

	thumb_func_start sub_80B54E8
sub_80B54E8: @ 80B54E8
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0
	bl GetAnimBankSpriteId
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80758E0
	adds r0, r4, 0
	movs r1, 0x80
	movs r2, 0x80
	movs r3, 0
	bl obj_id_set_rotscale
	ldr r1, _080B5560 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r1, _080B5564 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0x80
	strh r1, [r0, 0x8]
	ldr r1, _080B5568 @ =gBattleAnimArgs
	ldrh r1, [r1]
	strh r1, [r0, 0xA]
	strh r2, [r0, 0xC]
	movs r1, 0x10
	strh r1, [r0, 0xE]
	ldr r1, _080B556C @ =sub_80B5570
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5560: .4byte gSprites
_080B5564: .4byte gTasks
_080B5568: .4byte gBattleAnimArgs
_080B556C: .4byte sub_80B5570
	thumb_func_end sub_80B54E8

	thumb_func_start sub_80B5570
sub_80B5570: @ 80B5570
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B55C0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080B55B8
	movs r0, 0
	strh r0, [r4, 0x1C]
	ldrh r1, [r4, 0xC]
	adds r1, 0x1
	strh r1, [r4, 0xC]
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x9
	bne _080B55B8
	ldr r0, _080B55C4 @ =sub_80B55C8
	str r0, [r4]
_080B55B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B55C0: .4byte gTasks
_080B55C4: .4byte sub_80B55C8
	thumb_func_end sub_80B5570

	thumb_func_start sub_80B55C8
sub_80B55C8: @ 80B55C8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080B55EC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080B55F0
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
	b _080B5634
	.align 2, 0
_080B55EC: .4byte gTasks
_080B55F0:
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r1, r0, 24
	ldrh r0, [r4, 0x8]
	adds r0, 0x8
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xFF
	bgt _080B5618
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	adds r0, r1, 0
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	b _080B5634
_080B5618:
	adds r0, r1, 0
	bl sub_8075980
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
_080B5634:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80B55C8

	thumb_func_start sub_80B563C
sub_80B563C: @ 80B563C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r5, [r4, 0x20]
	ldrh r6, [r4, 0x22]
	ldr r0, _080B56D8 @ =gBattleAnimAttacker
	mov r8, r0
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	mov r9, r1
	strh r0, [r4, 0x20]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	mov r1, r9
	strh r1, [r4, 0x2E]
	ldr r2, _080B56DC @ =gBattleAnimArgs
	ldrh r1, [r2]
	strh r1, [r4, 0x30]
	ldrh r1, [r2, 0x2]
	strh r1, [r4, 0x32]
	ldrh r1, [r2, 0x4]
	strh r1, [r4, 0x34]
	ldrh r1, [r4, 0x20]
	lsls r1, 4
	strh r1, [r4, 0x36]
	lsls r0, 4
	strh r0, [r4, 0x38]
	lsls r5, 16
	asrs r5, 16
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	subs r5, r0
	lsls r5, 4
	movs r0, 0
	ldrsh r1, [r2, r0]
	lsls r1, 1
	adds r0, r5, 0
	str r2, [sp]
	bl __divsi3
	strh r0, [r4, 0x3A]
	lsls r6, 16
	asrs r6, 16
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	subs r6, r0
	lsls r6, 4
	ldr r2, [sp]
	movs r0, 0
	ldrsh r1, [r2, r0]
	lsls r1, 1
	adds r0, r6, 0
	bl __divsi3
	strh r0, [r4, 0x3C]
	ldr r0, _080B56E0 @ =sub_80B56E4
	str r0, [r4, 0x1C]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B56D8: .4byte gBattleAnimAttacker
_080B56DC: .4byte gBattleAnimArgs
_080B56E0: .4byte sub_80B56E4
	thumb_func_end sub_80B563C

	thumb_func_start sub_80B56E4
sub_80B56E4: @ 80B56E4
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080B572E
	cmp r0, 0x1
	bgt _080B56FA
	cmp r0, 0
	beq _080B5704
	b _080B57F2
_080B56FA:
	cmp r0, 0x2
	beq _080B5798
	cmp r0, 0x3
	beq _080B57EC
	b _080B57F2
_080B5704:
	ldrh r0, [r5, 0x3A]
	ldrh r2, [r5, 0x36]
	adds r0, r2
	strh r0, [r5, 0x36]
	ldrh r1, [r5, 0x3C]
	ldrh r2, [r5, 0x38]
	adds r1, r2
	strh r1, [r5, 0x38]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r5, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r5, 0x22]
	ldrh r0, [r5, 0x30]
	subs r0, 0x1
	strh r0, [r5, 0x30]
	lsls r0, 16
	cmp r0, 0
	bgt _080B57F2
	b _080B57DE
_080B572E:
	ldrh r0, [r5, 0x32]
	subs r0, 0x1
	strh r0, [r5, 0x32]
	lsls r0, 16
	cmp r0, 0
	bgt _080B57F2
	ldr r4, _080B5794 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x30]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x20]
	lsls r0, 4
	strh r0, [r5, 0x36]
	ldrh r0, [r5, 0x22]
	lsls r0, 4
	strh r0, [r5, 0x38]
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	subs r0, r1
	lsls r0, 4
	movs r2, 0x34
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r5, 0x3A]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	movs r2, 0x22
	ldrsh r1, [r5, r2]
	subs r0, r1
	lsls r0, 4
	movs r2, 0x34
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r5, 0x3C]
	b _080B57DE
	.align 2, 0
_080B5794: .4byte gBattleAnimTarget
_080B5798:
	ldrh r0, [r5, 0x3A]
	ldrh r1, [r5, 0x36]
	adds r0, r1
	strh r0, [r5, 0x36]
	ldrh r1, [r5, 0x3C]
	ldrh r2, [r5, 0x38]
	adds r1, r2
	strh r1, [r5, 0x38]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r5, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r5, 0x22]
	ldrh r0, [r5, 0x34]
	subs r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	cmp r0, 0
	bgt _080B57F2
	ldr r4, _080B57E8 @ =gBattleAnimTarget
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
_080B57DE:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080B57F2
	.align 2, 0
_080B57E8: .4byte gBattleAnimTarget
_080B57EC:
	adds r0, r5, 0
	bl move_anim_8074EE0
_080B57F2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80B56E4

	thumb_func_start sub_80B57F8
sub_80B57F8: @ 80B57F8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075114
	ldr r0, _080B580C @ =sub_80B5810
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B580C: .4byte sub_80B5810
	thumb_func_end sub_80B57F8

	thumb_func_start sub_80B5810
sub_80B5810: @ 80B5810
	push {r4-r6,lr}
	adds r3, r0, 0
	movs r5, 0
	movs r6, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080B58A6
	adds r1, r3, 0
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x4
	ands r0, r2
	adds r4, r1, 0
	cmp r0, 0
	bne _080B583A
	movs r0, 0x4
	orrs r0, r2
	strb r0, [r4]
_080B583A:
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _080B584A
	cmp r0, 0x1
	beq _080B5854
	movs r6, 0x1
	b _080B585E
_080B584A:
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0x2
	bne _080B585E
	b _080B5862
_080B5854:
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0x4
	bne _080B585E
	movs r5, 0x1
_080B585E:
	cmp r5, 0
	beq _080B5894
_080B5862:
	ldrb r2, [r4]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r3, 0x32]
	strh r1, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _080B58A6
	strh r1, [r3, 0x32]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	b _080B58A6
_080B5894:
	cmp r6, 0
	beq _080B58A0
	adds r0, r3, 0
	bl DestroyAnimSprite
	b _080B58A6
_080B58A0:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
_080B58A6:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80B5810

	thumb_func_start sub_80B58AC
sub_80B58AC: @ 80B58AC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080B58D8 @ =gTasks
	adds r5, r0, r1
	movs r0, 0x1
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	movs r6, 0
	movs r1, 0
	strh r0, [r5, 0x8]
	lsls r0, 16
	cmp r0, 0
	bge _080B58DC
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _080B59B8
	.align 2, 0
_080B58D8: .4byte gTasks
_080B58DC:
	strh r1, [r5, 0xA]
	movs r0, 0xF
	strh r0, [r5, 0xC]
	movs r0, 0x2
	strh r0, [r5, 0xE]
	strh r1, [r5, 0x10]
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	ldrh r1, [r5, 0xE]
	lsls r1, 8
	ldrh r0, [r5, 0xC]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	ldr r4, _080B5944 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x50
	strh r1, [r0, 0x2E]
	ldr r0, _080B5948 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B5950
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080B594C @ =0x0000ff70
	strh r1, [r0, 0x30]
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x70
	b _080B596E
	.align 2, 0
_080B5944: .4byte gSprites
_080B5948: .4byte gBattleAnimTarget
_080B594C: .4byte 0x0000ff70
_080B5950:
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x90
	strh r1, [r0, 0x30]
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080B59C0 @ =0x0000ff90
_080B596E:
	strh r1, [r0, 0x32]
	ldr r4, _080B59C4 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r2, 0
	strh r2, [r0, 0x34]
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r2, [r0, 0x36]
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080B59C8 @ =SpriteCallbackDummy
	bl StoreSpriteCallbackInData6
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _080B59CC @ =sub_8074D00
	str r1, [r0]
	ldr r0, _080B59D0 @ =sub_80B59D4
	str r0, [r5]
_080B59B8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B59C0: .4byte 0x0000ff90
_080B59C4: .4byte gSprites
_080B59C8: .4byte SpriteCallbackDummy
_080B59CC: .4byte sub_8074D00
_080B59D0: .4byte sub_80B59D4
	thumb_func_end sub_80B58AC

	thumb_func_start sub_80B59D4
sub_80B59D4: @ 80B59D4
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080B59F8 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080B5A78
	cmp r0, 0x1
	bgt _080B59FC
	cmp r0, 0
	beq _080B5A02
	b _080B5AA4
	.align 2, 0
_080B59F8: .4byte gTasks
_080B59FC:
	cmp r0, 0x2
	beq _080B5A9E
	b _080B5AA4
_080B5A02:
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	movs r0, 0x3
	ands r0, r1
	strh r0, [r4, 0x12]
	cmp r0, 0x1
	bne _080B5A20
	ldrh r1, [r4, 0xC]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080B5A20
	subs r0, r1, 0x1
	strh r0, [r4, 0xC]
_080B5A20:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	bne _080B5A36
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080B5A36
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
_080B5A36:
	ldrh r1, [r4, 0xE]
	lsls r1, 8
	ldrh r0, [r4, 0xC]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	ldr r1, [r4, 0xC]
	movs r0, 0x80
	lsls r0, 13
	cmp r1, r0
	bne _080B5AA4
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x50
	ble _080B5AA4
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B5A74 @ =gSprites
	adds r0, r1
	bl obj_delete_but_dont_free_vram
	movs r0, 0x1
	strh r0, [r4, 0x10]
	b _080B5AA4
	.align 2, 0
_080B5A74: .4byte gSprites
_080B5A78:
	ldrh r0, [r4, 0x14]
	adds r0, 0x1
	strh r0, [r4, 0x14]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B5AA4
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	b _080B5AA4
_080B5A9E:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080B5AA4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B59D4

	thumb_func_start sub_80B5AAC
sub_80B5AAC: @ 80B5AAC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r2, _080B5ACC @ =gTasks
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x26]
	ldr r2, _080B5AD0 @ =sub_80B5AD4
	str r2, [r1]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_080B5ACC: .4byte gTasks
_080B5AD0: .4byte sub_80B5AD4
	thumb_func_end sub_80B5AAC

	thumb_func_start sub_80B5AD4
sub_80B5AD4: @ 80B5AD4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080B5B0C @ =gTasks
	adds r5, r0, r1
	ldr r0, _080B5B10 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r6, r0, 24
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	cmp r0, 0x4
	bls _080B5B00
	b _080B5D22
_080B5B00:
	lsls r0, 2
	ldr r1, _080B5B14 @ =_080B5B18
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B5B0C: .4byte gTasks
_080B5B10: .4byte gBattleAnimTarget
_080B5B14: .4byte _080B5B18
	.align 2, 0
_080B5B18:
	.4byte _080B5B2C
	.4byte _080B5C2C
	.4byte _080B5C70
	.4byte _080B5CD8
	.4byte _080B5D04
_080B5B2C:
	ldr r7, _080B5B64 @ =0x00002771
	adds r0, r7, 0
	bl AllocSpritePalette
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	mov r8, r2
	strh r0, [r5, 0x24]
	cmp r0, 0xFF
	beq _080B5B5A
	cmp r0, 0xF
	beq _080B5B5A
	movs r0, 0x1
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	strh r0, [r5, 0x8]
	lsls r0, 16
	cmp r0, 0
	bge _080B5B68
	adds r0, r7, 0
	bl FreeSpritePaletteByTag
_080B5B5A:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _080B5D28
	.align 2, 0
_080B5B64: .4byte 0x00002771
_080B5B68:
	ldr r4, _080B5C14 @ =gSprites
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r2, [r5, 0x24]
	lsls r2, 4
	ldrb r3, [r1, 0x5]
	movs r0, 0xF
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
	movs r2, 0x8
	ldrsh r0, [r5, r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	ldr r0, _080B5C18 @ =gUnknown_2024018
	ldr r1, [r0]
	ldr r0, _080B5C1C @ =gBattleAnimTarget
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r1, 31
	adds r2, 0x3E
	lsrs r1, 31
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	mov r2, r8
	strh r2, [r5, 0xA]
	strh r2, [r5, 0xC]
	movs r0, 0x10
	strh r0, [r5, 0xE]
	movs r0, 0x1
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	movs r0, 0x22
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	lsls r0, 4
	strh r0, [r5, 0x10]
	cmp r6, 0x1
	bne _080B5C20
	movs r1, 0x80
	lsls r1, 2
	b _080B5C24
	.align 2, 0
_080B5C14: .4byte gSprites
_080B5C18: .4byte gUnknown_2024018
_080B5C1C: .4byte gBattleAnimTarget
_080B5C20:
	movs r1, 0x80
	lsls r1, 3
_080B5C24:
	movs r0, 0
	bl ClearGpuRegBits
	b _080B5D22
_080B5C2C:
	movs r1, 0x24
	ldrsh r0, [r5, r1]
	adds r0, 0x10
	lsls r0, 4
	strh r0, [r5, 0x24]
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	lsls r0, 1
	ldr r1, _080B5C60 @ =gPlttBufferUnfaded
	adds r0, r1
	movs r2, 0x24
	ldrsh r1, [r5, r2]
	lsls r1, 1
	ldr r2, _080B5C64 @ =gPlttBufferFaded
	adds r1, r2
	ldr r2, _080B5C68 @ =0x04000008
	bl CpuSet
	ldrh r0, [r5, 0x10]
	ldr r3, _080B5C6C @ =0x00003c0d
	movs r1, 0x10
	movs r2, 0xA
	bl BlendPalette
	b _080B5D22
	.align 2, 0
_080B5C60: .4byte gPlttBufferUnfaded
_080B5C64: .4byte gPlttBufferFaded
_080B5C68: .4byte 0x04000008
_080B5C6C: .4byte 0x00003c0d
_080B5C70:
	ldr r2, _080B5CAC @ =gSprites
	movs r0, 0x22
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	subs r1, 0x20
	lsls r1, 16
	lsrs r2, r1, 16
	cmp r1, 0
	bge _080B5C90
	movs r2, 0
_080B5C90:
	cmp r6, 0x1
	bne _080B5CB0
	lsls r0, r2, 24
	lsrs r0, 24
	adds r1, r2, 0
	adds r1, 0x40
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	str r2, [sp]
	movs r2, 0x4
	str r2, [sp, 0x4]
	str r6, [sp, 0x8]
	b _080B5CC8
	.align 2, 0
_080B5CAC: .4byte gSprites
_080B5CB0:
	lsls r0, r2, 24
	lsrs r0, 24
	adds r1, r2, 0
	adds r1, 0x40
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	str r2, [sp]
	movs r2, 0x8
	str r2, [sp, 0x4]
	movs r2, 0x1
	str r2, [sp, 0x8]
_080B5CC8:
	movs r2, 0x2
	movs r3, 0x6
	bl ScanlineEffect_InitWave
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x1C]
	b _080B5D22
_080B5CD8:
	cmp r6, 0x1
	bne _080B5CEC
	ldr r1, _080B5CE8 @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	b _080B5CF4
	.align 2, 0
_080B5CE8: .4byte 0x00003f42
_080B5CEC:
	ldr r1, _080B5D00 @ =0x00003f44
	movs r0, 0x50
	bl SetGpuReg
_080B5CF4:
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	b _080B5D22
	.align 2, 0
_080B5D00: .4byte 0x00003f44
_080B5D04:
	cmp r6, 0x1
	bne _080B5D14
	movs r1, 0x80
	lsls r1, 2
	movs r0, 0
	bl SetGpuRegBits
	b _080B5D1E
_080B5D14:
	movs r1, 0x80
	lsls r1, 3
	movs r0, 0
	bl SetGpuRegBits
_080B5D1E:
	ldr r0, _080B5D34 @ =sub_80B5D38
	str r0, [r5]
_080B5D22:
	ldrh r0, [r5, 0x26]
	adds r0, 0x1
	strh r0, [r5, 0x26]
_080B5D28:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5D34: .4byte sub_80B5D38
	thumb_func_end sub_80B5AD4

	thumb_func_start sub_80B5D38
sub_80B5D38: @ 80B5D38
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080B5DC0 @ =gTasks
	adds r4, r0, r1
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	movs r0, 0x1
	ands r0, r1
	strh r0, [r4, 0x12]
	cmp r0, 0
	bne _080B5D70
	ldr r1, _080B5DC4 @ =gSineTable
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x12
	bl __divsi3
	strh r0, [r4, 0xC]
_080B5D70:
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0x1
	bne _080B5D92
	ldr r1, _080B5DC4 @ =gSineTable
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x12
	bl __divsi3
	movs r1, 0x10
	subs r1, r0
	strh r1, [r4, 0xE]
_080B5D92:
	ldrh r1, [r4, 0xE]
	lsls r1, 8
	ldrh r0, [r4, 0xC]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0x80
	bne _080B5DBA
	movs r0, 0
	strh r0, [r4, 0x26]
	ldr r1, _080B5DC8 @ =sub_80B5DCC
	str r1, [r4]
	adds r0, r5, 0
	bl _call_via_r1
_080B5DBA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5DC0: .4byte gTasks
_080B5DC4: .4byte gSineTable
_080B5DC8: .4byte sub_80B5DCC
	thumb_func_end sub_80B5D38

	thumb_func_start sub_80B5DCC
sub_80B5DCC: @ 80B5DCC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080B5DFC @ =gTasks
	adds r4, r0, r1
	ldr r0, _080B5E00 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r6, r0, 24
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080B5E38
	cmp r0, 0x1
	bgt _080B5E04
	cmp r0, 0
	beq _080B5E0A
	b _080B5EB4
	.align 2, 0
_080B5DFC: .4byte gTasks
_080B5E00: .4byte gBattleAnimTarget
_080B5E04:
	cmp r0, 0x2
	beq _080B5E4C
	b _080B5EB4
_080B5E0A:
	ldr r1, _080B5E28 @ =gScanlineEffect
	movs r0, 0x3
	strb r0, [r1, 0x15]
	movs r0, 0x1
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x24]
	cmp r6, 0x1
	bne _080B5E2C
	movs r1, 0x80
	lsls r1, 2
	b _080B5E30
	.align 2, 0
_080B5E28: .4byte gScanlineEffect
_080B5E2C:
	movs r1, 0x80
	lsls r1, 3
_080B5E30:
	movs r0, 0
	bl ClearGpuRegBits
	b _080B5EB4
_080B5E38:
	ldrh r0, [r4, 0x10]
	ldr r3, _080B5E48 @ =0x00003c0d
	movs r1, 0x10
	movs r2, 0
	bl BlendPalette
	b _080B5EB4
	.align 2, 0
_080B5E48: .4byte 0x00003c0d
_080B5E4C:
	ldr r3, _080B5E9C @ =gSprites
	movs r0, 0x24
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
	bl obj_delete_but_dont_free_vram
	ldr r0, _080B5EA0 @ =0x00002771
	bl FreeSpritePaletteByTag
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	cmp r6, 0x1
	bne _080B5EA4
	movs r1, 0x80
	lsls r1, 2
	movs r0, 0
	bl SetGpuRegBits
	b _080B5EAE
	.align 2, 0
_080B5E9C: .4byte gSprites
_080B5EA0: .4byte 0x00002771
_080B5EA4:
	movs r1, 0x80
	lsls r1, 3
	movs r0, 0
	bl SetGpuRegBits
_080B5EAE:
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080B5EB4:
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80B5DCC

	thumb_func_start sub_80B5EC0
sub_80B5EC0: @ 80B5EC0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r0, 0
	ldr r0, _080B5EFC @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B5F08
	ldr r4, _080B5F00 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 8
	movs r2, 0xE0
	lsls r2, 13
	adds r0, r2
	lsrs r5, r0, 16
	ldr r4, _080B5F04 @ =gBattleAnimTarget
	b _080B5F2C
	.align 2, 0
_080B5EFC: .4byte gBattleAnimArgs
_080B5F00: .4byte gBattleAnimAttacker
_080B5F04: .4byte gBattleAnimTarget
_080B5F08:
	ldr r4, _080B5FD0 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 8
	movs r2, 0xE0
	lsls r2, 13
	adds r0, r2
	lsrs r5, r0, 16
	ldr r4, _080B5FD4 @ =gBattleAnimAttacker
_080B5F2C:
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 8
	movs r1, 0xE0
	lsls r1, 13
	adds r0, r1
	lsrs r0, 16
	mov r9, r0
	mov r8, r5
	mov r2, r9
	subs r4, r2, r5
	lsls r4, 16
	lsrs r4, 16
	lsls r0, r6, 4
	strh r0, [r7, 0x2E]
	lsls r0, r5, 4
	strh r0, [r7, 0x30]
	mov r1, r10
	subs r0, r1, r6
	lsls r0, 4
	ldr r5, _080B5FD8 @ =gBattleAnimArgs
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r7, 0x32]
	lsls r4, 16
	asrs r4, 12
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl __divsi3
	strh r0, [r7, 0x34]
	ldrh r0, [r5, 0x2]
	strh r0, [r7, 0x36]
	mov r1, r10
	strh r1, [r7, 0x38]
	mov r2, r9
	strh r2, [r7, 0x3A]
	movs r1, 0x36
	ldrsh r0, [r7, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r7, 0x3C]
	ldrb r1, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r7, 0x5]
	strh r6, [r7, 0x20]
	mov r2, r8
	strh r2, [r7, 0x22]
	ldr r0, _080B5FDC @ =sub_80B5FE0
	str r0, [r7, 0x1C]
	adds r2, r7, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5FD0: .4byte gBattleAnimTarget
_080B5FD4: .4byte gBattleAnimAttacker
_080B5FD8: .4byte gBattleAnimArgs
_080B5FDC: .4byte sub_80B5FE0
	thumb_func_end sub_80B5EC0

	thumb_func_start sub_80B5FE0
sub_80B5FE0: @ 80B5FE0
	push {r4,lr}
	adds r2, r0, 0
	ldrh r3, [r2, 0x36]
	movs r1, 0x36
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _080B6018
	ldrh r0, [r2, 0x32]
	ldrh r4, [r2, 0x2E]
	adds r0, r4
	strh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x34]
	ldrh r4, [r2, 0x30]
	adds r1, r4
	strh r1, [r2, 0x30]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r2, 0x22]
	subs r0, r3, 0x1
	strh r0, [r2, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bne _080B6018
	strh r0, [r2, 0x2E]
_080B6018:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B5FE0

	thumb_func_start sub_80B6020
sub_80B6020: @ 80B6020
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B6170 @ =gTasks
	adds r1, r0
	str r1, [sp]
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0
	ldr r1, [sp]
	strh r0, [r1, 0x12]
	strh r0, [r1, 0x14]
	strh r0, [r1, 0x16]
	strh r0, [r1, 0x18]
	movs r0, 0x10
	strh r0, [r1, 0x1A]
	ldr r2, _080B6174 @ =gBattleAnimArgs
	ldrh r0, [r2]
	strh r0, [r1, 0x1C]
	ldr r4, _080B6178 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8076B2C
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080B6090
	b _080B618C
_080B6090:
	movs r4, 0
_080B6092:
	lsls r1, r4, 16
	asrs r3, r1, 16
	ldr r0, _080B6178 @ =gBattleAnimAttacker
	ldrb r2, [r0]
	str r1, [sp, 0x10]
	cmp r3, r2
	beq _080B615E
	movs r0, 0x2
	eors r2, r0
	cmp r3, r2
	beq _080B615E
	lsls r0, r4, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080B615E
	ldr r6, [sp, 0x4]
	ldr r3, [sp, 0x8]
	lsls r0, r3, 16
	asrs r7, r0, 16
	ldr r0, _080B617C @ =gUnknown_83E7668
	adds r1, r6, 0
	adds r2, r7, 0
	movs r3, 0x37
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x40
	beq _080B615E
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_8076B2C
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	mov r0, r8
	lsls r5, r0, 4
	add r5, r8
	lsls r5, 2
	ldr r1, _080B6180 @ =gSprites
	adds r4, r5, r1
	lsls r0, r6, 4
	strh r0, [r4, 0x2E]
	lsls r0, r7, 4
	strh r0, [r4, 0x30]
	mov r2, r10
	subs r0, r2, r6
	lsls r0, 4
	ldr r3, _080B6174 @ =gBattleAnimArgs
	movs r2, 0x2
	ldrsh r1, [r3, r2]
	bl __divsi3
	strh r0, [r4, 0x32]
	mov r3, r9
	lsls r0, r3, 16
	asrs r0, 16
	subs r0, r7
	lsls r0, 4
	ldr r2, _080B6174 @ =gBattleAnimArgs
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	bl __divsi3
	strh r0, [r4, 0x34]
	ldr r1, _080B6174 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x36]
	mov r2, r10
	strh r2, [r4, 0x38]
	mov r3, r9
	strh r3, [r4, 0x3A]
	ldr r0, _080B6184 @ =gSprites + 0x1C
	adds r5, r0
	ldr r0, _080B6188 @ =sub_80B5FE0
	str r0, [r5]
	ldr r2, [sp]
	movs r3, 0x20
	ldrsh r1, [r2, r3]
	adds r1, 0xD
	lsls r1, 1
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1
	mov r1, r8
	strh r1, [r0]
	ldrh r0, [r2, 0x20]
	adds r0, 0x1
	strh r0, [r2, 0x20]
_080B615E:
	ldr r2, [sp, 0x10]
	movs r3, 0x80
	lsls r3, 9
	adds r0, r2, r3
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080B6092
	b _080B6210
	.align 2, 0
_080B6170: .4byte gTasks
_080B6174: .4byte gBattleAnimArgs
_080B6178: .4byte gBattleAnimAttacker
_080B617C: .4byte gUnknown_83E7668
_080B6180: .4byte gSprites
_080B6184: .4byte gSprites + 0x1C
_080B6188: .4byte sub_80B5FE0
_080B618C:
	ldr r0, _080B6228 @ =gUnknown_83E7668
	ldr r7, [sp, 0x4]
	ldr r2, [sp, 0x8]
	lsls r1, r2, 16
	asrs r1, 16
	str r1, [sp, 0xC]
	adds r1, r7, 0
	ldr r2, [sp, 0xC]
	movs r3, 0x37
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x40
	beq _080B6210
	movs r3, 0x30
	mov r10, r3
	movs r0, 0x28
	mov r9, r0
	ldr r6, _080B622C @ =gSprites
	mov r1, r8
	lsls r5, r1, 4
	add r5, r8
	lsls r5, 2
	adds r4, r5, r6
	lsls r0, r7, 4
	strh r0, [r4, 0x2E]
	ldr r2, [sp, 0xC]
	lsls r0, r2, 4
	strh r0, [r4, 0x30]
	subs r0, r3, r7
	lsls r0, 4
	ldr r3, _080B6230 @ =gBattleAnimArgs
	movs r2, 0x2
	ldrsh r1, [r3, r2]
	bl __divsi3
	strh r0, [r4, 0x32]
	mov r3, r9
	ldr r1, [sp, 0xC]
	subs r0, r3, r1
	lsls r0, 4
	ldr r2, _080B6230 @ =gBattleAnimArgs
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	bl __divsi3
	strh r0, [r4, 0x34]
	ldr r1, _080B6230 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x36]
	mov r2, r10
	strh r2, [r4, 0x38]
	mov r3, r9
	strh r3, [r4, 0x3A]
	adds r6, 0x1C
	adds r5, r6
	ldr r0, _080B6234 @ =sub_80B5FE0
	str r0, [r5]
	mov r1, r8
	ldr r0, [sp]
	strh r1, [r0, 0x22]
	movs r0, 0x1
	ldr r2, [sp]
	strh r0, [r2, 0x20]
_080B6210:
	ldr r0, _080B6238 @ =sub_80B623C
	ldr r3, [sp]
	str r0, [r3]
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6228: .4byte gUnknown_83E7668
_080B622C: .4byte gSprites
_080B6230: .4byte gBattleAnimArgs
_080B6234: .4byte sub_80B5FE0
_080B6238: .4byte sub_80B623C
	thumb_func_end sub_80B6020

	thumb_func_start sub_80B623C
sub_80B623C: @ 80B623C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080B6260 @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _080B62F2
	cmp r1, 0x1
	bgt _080B6264
	cmp r1, 0
	beq _080B6272
	b _080B63AE
	.align 2, 0
_080B6260: .4byte gTasks
_080B6264:
	cmp r1, 0x2
	bne _080B626A
	b _080B6384
_080B626A:
	cmp r1, 0x3
	bne _080B6270
	b _080B6398
_080B6270:
	b _080B63AE
_080B6272:
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080B62D8
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B62D8
	strh r1, [r4, 0x12]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B62A8
	ldrh r1, [r4, 0x18]
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080B62B6
	adds r0, r1, 0x1
	strh r0, [r4, 0x18]
	b _080B62B6
_080B62A8:
	ldrh r1, [r4, 0x1A]
	movs r2, 0x1A
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080B62B6
	subs r0, r1, 0x1
	strh r0, [r4, 0x1A]
_080B62B6:
	ldrh r1, [r4, 0x1A]
	lsls r1, 8
	ldrh r0, [r4, 0x18]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	cmp r0, 0x17
	ble _080B62D8
	movs r0, 0
	strh r0, [r4, 0x16]
	movs r0, 0x1
	strh r0, [r4, 0x14]
_080B62D8:
	ldrh r1, [r4, 0x1C]
	movs r2, 0x1C
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080B62E8
	subs r0, r1, 0x1
	strh r0, [r4, 0x1C]
	b _080B63AE
_080B62E8:
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080B63AE
	b _080B6390
_080B62F2:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B63AE
	movs r0, 0
	strh r0, [r4, 0x12]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
	ands r0, r1
	lsls r0, 16
	cmp r0, 0
	beq _080B6322
	ldrh r1, [r4, 0x18]
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080B6330
	subs r0, r1, 0x1
	strh r0, [r4, 0x18]
	b _080B6330
_080B6322:
	ldrh r1, [r4, 0x1A]
	movs r2, 0x1A
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080B6330
	adds r0, r1, 0x1
	strh r0, [r4, 0x1A]
_080B6330:
	ldrh r1, [r4, 0x1A]
	lsls r1, 8
	ldrh r0, [r4, 0x18]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	ldr r1, [r4, 0x18]
	movs r0, 0x80
	lsls r0, 13
	cmp r1, r0
	bne _080B63AE
	movs r5, 0
	b _080B6374
_080B6350:
	adds r1, r5, 0
	adds r1, 0xD
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x8
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B6380 @ =gSprites
	adds r0, r1
	bl DestroySprite
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_080B6374:
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	cmp r5, r0
	blt _080B6350
	b _080B6390
	.align 2, 0
_080B6380: .4byte gSprites
_080B6384:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	cmp r0, 0
	ble _080B63AE
_080B6390:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B63AE
_080B6398:
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080B63AE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80B623C

	thumb_func_start sub_80B63B4
sub_80B63B4: @ 80B63B4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080B6400 @ =gUnknown_2022984
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080B6404 @ =gUnknown_2022986
	strh r1, [r0]
	ldr r1, _080B6408 @ =0x00003f3f
	movs r0, 0x48
	bl SetGpuReg
	ldr r1, _080B640C @ =0x00003f1f
	movs r0, 0x4A
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0xC8
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0x10
	bl SetGpuReg
	ldr r0, _080B6410 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B63FC
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080B6414
_080B63FC:
	movs r6, 0x28
	b _080B6416
	.align 2, 0
_080B6400: .4byte gUnknown_2022984
_080B6404: .4byte gUnknown_2022986
_080B6408: .4byte 0x00003f3f
_080B640C: .4byte 0x00003f1f
_080B6410: .4byte gBattleAnimAttacker
_080B6414:
	movs r6, 0xC8
_080B6416:
	ldr r1, _080B6454 @ =gUnknown_2022984
	lsls r3, r6, 16
	asrs r2, r3, 16
	lsls r0, r2, 8
	orrs r0, r2
	strh r0, [r1]
	ldr r1, _080B6458 @ =gUnknown_2022986
	movs r5, 0x28
	ldr r0, _080B645C @ =0x00002828
	strh r0, [r1]
	lsrs r3, 16
	movs r1, 0xF0
	subs r1, r2
	movs r4, 0x48
	ldr r2, _080B6460 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r2
	strh r3, [r0, 0xA]
	strh r1, [r0, 0xC]
	strh r5, [r0, 0xE]
	strh r4, [r0, 0x10]
	strh r6, [r0, 0x12]
	strh r5, [r0, 0x14]
	ldr r1, _080B6464 @ =sub_80B6468
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6454: .4byte gUnknown_2022984
_080B6458: .4byte gUnknown_2022986
_080B645C: .4byte 0x00002828
_080B6460: .4byte gTasks
_080B6464: .4byte sub_80B6468
	thumb_func_end sub_80B63B4

	thumb_func_start sub_80B6468
sub_80B6468: @ 80B6468
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B6588 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r1, [r4, 0x8]
	adds r0, r1, 0x1
	strh r0, [r4, 0x8]
	ldrh r5, [r4, 0xA]
	ldrh r7, [r4, 0xC]
	ldrh r0, [r4, 0xE]
	mov r10, r0
	ldrh r2, [r4, 0x10]
	str r2, [sp, 0xC]
	ldrh r0, [r4, 0x12]
	ldrh r2, [r4, 0x14]
	mov r8, r2
	lsls r1, 16
	asrs r6, r1, 16
	cmp r6, 0xF
	ble _080B64A4
	b _080B6594
_080B64A4:
	lsls r0, 16
	asrs r0, 16
	bl __floatsidf
	str r0, [sp, 0x10]
	str r1, [sp, 0x14]
	lsls r0, r5, 16
	asrs r0, 16
	bl __floatsidf
	ldr r2, _080B658C @ =0x3fb00000
	ldr r3, _080B6590 @ =0x00000000
	bl __muldf3
	adds r5, r1, 0
	adds r4, r0, 0
	adds r0, r6, 0
	bl __floatsidf
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	adds r1, r5, 0
	adds r0, r4, 0
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	bl __muldf3
	adds r3, r1, 0
	adds r2, r0, 0
	ldr r0, [sp, 0x10]
	ldr r1, [sp, 0x14]
	bl __subdf3
	bl __fixunsdfsi
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	lsls r0, r7, 16
	asrs r0, 16
	bl __floatsidf
	ldr r2, _080B658C @ =0x3fb00000
	ldr r3, _080B6590 @ =0x00000000
	bl __muldf3
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	bl __muldf3
	adds r3, r1, 0
	adds r2, r0, 0
	ldr r0, [sp, 0x10]
	ldr r1, [sp, 0x14]
	bl __adddf3
	bl __fixunsdfsi
	lsls r0, 16
	lsrs r7, r0, 16
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	bl __floatsidf
	adds r5, r1, 0
	adds r4, r0, 0
	mov r2, r10
	lsls r0, r2, 16
	asrs r0, 16
	bl __floatsidf
	ldr r2, _080B658C @ =0x3fb00000
	ldr r3, _080B6590 @ =0x00000000
	bl __muldf3
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	bl __muldf3
	adds r3, r1, 0
	adds r2, r0, 0
	adds r1, r5, 0
	adds r0, r4, 0
	bl __subdf3
	bl __fixunsdfsi
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r1, [sp, 0xC]
	lsls r0, r1, 16
	asrs r0, 16
	bl __floatsidf
	ldr r2, _080B658C @ =0x3fb00000
	ldr r3, _080B6590 @ =0x00000000
	bl __muldf3
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	bl __muldf3
	adds r3, r1, 0
	adds r2, r0, 0
	adds r1, r5, 0
	adds r0, r4, 0
	bl __adddf3
	bl __fixunsdfsi
	lsls r0, 16
	lsrs r5, r0, 16
	b _080B65C2
	.align 2, 0
_080B6588: .4byte gTasks
_080B658C: .4byte 0x3fb00000
_080B6590: .4byte 0x00000000
_080B6594:
	movs r2, 0
	mov r9, r2
	movs r7, 0xF0
	movs r6, 0
	movs r5, 0x70
	str r6, [sp]
	str r6, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r3, 0
	bl sub_8075BE8
	lsls r0, 16
	lsrs r0, 16
	str r6, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080B65E4 @ =sub_80B65F0
	str r0, [r4]
_080B65C2:
	ldr r1, _080B65E8 @ =gUnknown_2022984
	mov r2, r9
	lsls r0, r2, 8
	orrs r7, r0
	strh r7, [r1]
	ldr r1, _080B65EC @ =gUnknown_2022986
	lsls r0, r6, 8
	orrs r5, r0
	strh r5, [r1]
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B65E4: .4byte sub_80B65F0
_080B65E8: .4byte gUnknown_2022984
_080B65EC: .4byte gUnknown_2022986
	thumb_func_end sub_80B6468

	thumb_func_start sub_80B65F0
sub_80B65F0: @ 80B65F0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080B663C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080B6636
	ldr r0, _080B6640 @ =gUnknown_2022984
	strh r1, [r0]
	ldr r0, _080B6644 @ =gUnknown_2022986
	strh r1, [r0]
	ldr r4, _080B6648 @ =0x00003f3f
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
_080B6636:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B663C: .4byte gPaletteFade
_080B6640: .4byte gUnknown_2022984
_080B6644: .4byte gUnknown_2022986
_080B6648: .4byte 0x00003f3f
	thumb_func_end sub_80B65F0

	thumb_func_start sub_80B664C
sub_80B664C: @ 80B664C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _080B6678 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B6680
	movs r2, 0x18
	ldr r3, _080B667C @ =0x0000fffe
	ldrb r0, [r4, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	orrs r1, r0
	strb r1, [r4, 0x3]
	b _080B6684
	.align 2, 0
_080B6678: .4byte gBattleAnimAttacker
_080B667C: .4byte 0x0000fffe
_080B6680:
	ldr r2, _080B66A0 @ =0x0000ffe8
	movs r3, 0x2
_080B6684:
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	strh r3, [r4, 0x30]
	movs r0, 0x3C
	strh r0, [r4, 0x2E]
	ldr r0, _080B66A4 @ =sub_80B66A8
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B66A0: .4byte 0x0000ffe8
_080B66A4: .4byte sub_80B66A8
	thumb_func_end sub_80B664C

	thumb_func_start sub_80B66A8
sub_80B66A8: @ 80B66A8
	push {r4,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _080B66BA
	subs r0, r1, 0x1
	b _080B671E
_080B66BA:
	ldrh r0, [r3, 0x30]
	ldrh r4, [r3, 0x24]
	adds r1, r0, r4
	strh r1, [r3, 0x24]
	adds r0, r1, 0x7
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xE
	bls _080B6720
	ldrh r0, [r3, 0x20]
	adds r0, r1
	strh r0, [r3, 0x20]
	movs r0, 0
	strh r0, [r3, 0x24]
	ldrh r2, [r3, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x8
	ldr r4, _080B670C @ =0x000003ff
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _080B6710 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080B671C
	movs r0, 0x1E
	strh r0, [r3, 0x2E]
	ldr r0, _080B6714 @ =sub_8074C44
	str r0, [r3, 0x1C]
	ldr r1, _080B6718 @ =sub_80B6728
	adds r0, r3, 0
	bl StoreSpriteCallbackInData6
	b _080B6720
	.align 2, 0
_080B670C: .4byte 0x000003ff
_080B6710: .4byte 0xfffffc00
_080B6714: .4byte sub_8074C44
_080B6718: .4byte sub_80B6728
_080B671C:
	movs r0, 0x28
_080B671E:
	strh r0, [r3, 0x2E]
_080B6720:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B66A8

	thumb_func_start sub_80B6728
sub_80B6728: @ 80B6728
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r5, [r4, r0]
	cmp r5, 0
	bne _080B6752
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0x10
	bl SetGpuReg
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	strh r5, [r4, 0x30]
	strh r5, [r4, 0x32]
	b _080B6796
_080B6752:
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0x1
	bgt _080B6762
	adds r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _080B6796
_080B6762:
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	movs r1, 0x10
	subs r1, r0
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _080B6796
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080B679C @ =sub_80B67A0
	str r0, [r4, 0x1C]
_080B6796:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B679C: .4byte sub_80B67A0
	thumb_func_end sub_80B6728

	thumb_func_start sub_80B67A0
sub_80B67A0: @ 80B67A0
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	ldr r0, _080B67CC @ =gUnknown_2022984
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080B67D0 @ =gUnknown_2022986
	strh r1, [r0]
	adds r0, r4, 0
	bl DestroyAnimSprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B67CC: .4byte gUnknown_2022984
_080B67D0: .4byte gUnknown_2022986
	thumb_func_end sub_80B67A0

	thumb_func_start sub_80B67D4
sub_80B67D4: @ 80B67D4
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	movs r1, 0xC
	bl Sin
	strh r0, [r5, 0x24]
	ldr r0, _080B683C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B67F8
	ldrh r0, [r5, 0x24]
	negs r0, r0
	strh r0, [r5, 0x24]
_080B67F8:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x6
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x2E]
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1, 0
	ldrh r1, [r5, 0x30]
	adds r0, r1
	strh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080B6844
	ldr r0, _080B6840 @ =0x0000050b
	strh r0, [r5, 0x3A]
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	ldrh r1, [r5, 0x3A]
	movs r0, 0x52
	bl SetGpuReg
	b _080B689C
	.align 2, 0
_080B683C: .4byte gBattleAnimAttacker
_080B6840: .4byte 0x0000050b
_080B6844:
	cmp r0, 0x1E
	ble _080B689C
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	ldrh r1, [r5, 0x3A]
	lsls r0, r1, 16
	asrs r0, 24
	lsls r0, 16
	movs r6, 0xFF
	ands r6, r1
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r7, r0, 16
	cmp r7, 0x10
	bls _080B6868
	movs r7, 0x10
_080B6868:
	subs r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r0, 0
	bge _080B6874
	movs r6, 0
_080B6874:
	lsls r4, r7, 8
	orrs r4, r6
	lsls r1, r4, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	strh r4, [r5, 0x3A]
	cmp r7, 0x10
	bne _080B689C
	cmp r6, 0
	bne _080B689C
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080B68A4 @ =sub_80B68A8
	str r0, [r5, 0x1C]
_080B689C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B68A4: .4byte sub_80B68A8
	thumb_func_end sub_80B67D4

	thumb_func_start sub_80B68A8
sub_80B68A8: @ 80B68A8
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
	thumb_func_end sub_80B68A8

	thumb_func_start sub_80B68C8
sub_80B68C8: @ 80B68C8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080B6960 @ =gTasks
	adds r4, r0
	movs r6, 0
	strh r6, [r4, 0x8]
	movs r0, 0x10
	mov r8, r0
	mov r0, r8
	strh r0, [r4, 0xA]
	ldr r5, _080B6964 @ =gBattleAnimAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1A]
	ldrb r0, [r5]
	bl sub_807492C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1C]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8076B2C
	lsls r0, 16
	asrs r1, r0, 16
	lsrs r0, 31
	adds r1, r0
	asrs r1, 1
	adds r1, 0x8
	strh r1, [r4, 0x1E]
	strh r6, [r4, 0x16]
	ldrb r0, [r5]
	bl sub_8076884
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x12]
	ldrb r0, [r5]
	bl sub_807685C
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x2
	strh r0, [r4, 0x14]
	strh r6, [r4, 0xE]
	mov r0, r8
	strh r0, [r4, 0x10]
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	strh r6, [r4, 0x18]
	ldr r0, _080B6968 @ =sub_80B696C
	str r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6960: .4byte gTasks
_080B6964: .4byte gBattleAnimAttacker
_080B6968: .4byte sub_80B696C
	thumb_func_end sub_80B68C8

	thumb_func_start sub_80B696C
sub_80B696C: @ 80B696C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _080B6990 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bls _080B6986
	b _080B6AF2
_080B6986:
	lsls r0, 2
	ldr r1, _080B6994 @ =_080B6998
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B6990: .4byte gTasks
_080B6994: .4byte _080B6998
	.align 2, 0
_080B6998:
	.4byte _080B69B0
	.4byte _080B6A20
	.4byte _080B6A62
	.4byte _080B6A76
	.4byte _080B6ACC
	.4byte _080B6ADC
_080B69B0:
	movs r6, 0
_080B69B2:
	movs r2, 0x1A
	ldrsh r1, [r4, r2]
	movs r0, 0x1C
	ldrsh r2, [r4, r0]
	ldrb r3, [r4, 0x14]
	ldr r0, _080B6A14 @ =gUnknown_83E76E0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080B6A06
	ldr r1, _080B6A18 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r0, r1
	strh r7, [r5, 0x2E]
	ldr r0, _080B6A1C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	movs r1, 0
	lsls r0, 24
	cmp r0, 0
	bne _080B69E8
	movs r1, 0x1
_080B69E8:
	strh r1, [r5, 0x30]
	movs r0, 0x2A
	muls r0, r6
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r4, 0x1E]
	strh r0, [r5, 0x34]
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 1
	strh r0, [r5, 0x38]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
_080B6A06:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _080B69B2
	b _080B6AD4
	.align 2, 0
_080B6A14: .4byte gUnknown_83E76E0
_080B6A18: .4byte gSprites
_080B6A1C: .4byte gBattleAnimAttacker
_080B6A20:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B6A3E
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0xD
	bgt _080B6A4C
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _080B6A4C
_080B6A3E:
	ldrh r1, [r4, 0x10]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0x4
	ble _080B6A4C
	subs r0, r1, 0x1
	strh r0, [r4, 0x10]
_080B6A4C:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, 0xE]
	ldrh r1, [r4, 0x10]
	cmp r0, 0xE
	bne _080B6ABC
	cmp r1, 0x4
	bne _080B6ABC
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080B6AB6
_080B6A62:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	ble _080B6AF2
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080B6AD4
_080B6A76:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B6A94
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080B6AA2
	subs r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _080B6AA2
_080B6A94:
	ldrh r1, [r4, 0x10]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080B6AA2
	adds r0, r1, 0x1
	strh r0, [r4, 0x10]
_080B6AA2:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, 0xE]
	ldrh r1, [r4, 0x10]
	cmp r0, 0
	bne _080B6ABC
	cmp r1, 0x10
	bne _080B6ABC
	movs r0, 0x1
	strh r0, [r4, 0x18]
_080B6AB6:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080B6ABC:
	lsls r1, 8
	orrs r1, r2
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	b _080B6AF2
_080B6ACC:
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080B6AF2
_080B6AD4:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B6AF2
_080B6ADC:
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r7, 0
	bl DestroyAnimVisualTask
_080B6AF2:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B696C

	thumb_func_start sub_80B6AF8
sub_80B6AF8: @ 80B6AF8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B6B0A
	ldrh r0, [r4, 0x32]
	adds r0, 0x2
	b _080B6B0E
_080B6B0A:
	ldrh r0, [r4, 0x32]
	subs r0, 0x2
_080B6B0E:
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x32]
	movs r0, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x32]
	subs r0, 0x41
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7E
	bhi _080B6B50
	ldr r2, _080B6B4C @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x12]
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	b _080B6B64
	.align 2, 0
_080B6B4C: .4byte gTasks
_080B6B50:
	ldr r2, _080B6BB8 @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x3
	ldrb r1, [r0, 0x12]
	ands r1, r2
_080B6B64:
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	lsls r0, 3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3A]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	movs r1, 0x7
	bl Sin
	strh r0, [r4, 0x26]
	ldr r2, _080B6BB8 @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r1, r0, r2
	movs r2, 0x18
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080B6BB2
	ldrh r0, [r1, 0x16]
	subs r0, 0x1
	strh r0, [r1, 0x16]
	adds r0, r4, 0
	bl DestroySprite
_080B6BB2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B6BB8: .4byte gTasks
	thumb_func_end sub_80B6AF8

	thumb_func_start sub_80B6BBC
sub_80B6BBC: @ 80B6BBC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r2, _080B6BDC @ =gTasks
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x26]
	ldr r2, _080B6BE0 @ =sub_80B6BE4
	str r2, [r1]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_080B6BDC: .4byte gTasks
_080B6BE0: .4byte sub_80B6BE4
	thumb_func_end sub_80B6BBC

	thumb_func_start sub_80B6BE4
sub_80B6BE4: @ 80B6BE4
	push {r4-r6,lr}
	sub sp, 0x1C
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B6C18 @ =gTasks
	adds r6, r1, r0
	ldr r0, _080B6C1C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r4, r0, 24
	movs r1, 0x26
	ldrsh r0, [r6, r1]
	cmp r0, 0x7
	bls _080B6C0C
	b _080B6F1E
_080B6C0C:
	lsls r0, 2
	ldr r1, _080B6C20 @ =_080B6C24
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B6C18: .4byte gTasks
_080B6C1C: .4byte gBattleAnimAttacker
_080B6C20: .4byte _080B6C24
	.align 2, 0
_080B6C24:
	.4byte _080B6C44
	.4byte _080B6CCC
	.4byte _080B6D28
	.4byte _080B6D8C
	.4byte _080B6E04
	.4byte _080B6E6C
	.4byte _080B6E82
	.4byte _080B6EEC
_080B6C44:
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x2
	bl SetAnimBgAttribute
	movs r0, 0x2
	movs r1, 0x4
	movs r2, 0x1
	bl SetAnimBgAttribute
	movs r0, 0
	strh r0, [r6, 0xA]
	strh r0, [r6, 0xC]
	movs r0, 0x10
	strh r0, [r6, 0xE]
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x10]
	ldr r3, _080B6CC8 @ =gSprites
	movs r2, 0x10
	ldrsh r1, [r6, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x5]
	lsls r0, 28
	lsrs r0, 30
	strh r0, [r6, 0x12]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	lsls r0, 4
	strh r0, [r6, 0x14]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0, 0x1]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x1]
	movs r0, 0x10
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	movs r0, 0x80
	strh r0, [r6, 0x16]
	b _080B6F1E
	.align 2, 0
_080B6CC8: .4byte gSprites
_080B6CCC:
	ldrh r0, [r6, 0xA]
	adds r0, 0x1
	strh r0, [r6, 0xA]
	movs r5, 0x1
	ands r5, r0
	cmp r5, 0
	beq _080B6CDC
	b _080B6F24
_080B6CDC:
	ldrh r0, [r6, 0x14]
	ldrb r2, [r6, 0xC]
	ldr r4, _080B6D08 @ =0x000066e0
	movs r1, 0x10
	adds r3, r4, 0
	bl BlendPalette
	ldrh r0, [r6, 0x16]
	ldrb r2, [r6, 0xC]
	movs r1, 0x10
	adds r3, r4, 0
	bl BlendPalette
	ldrh r1, [r6, 0xC]
	movs r2, 0xC
	ldrsh r0, [r6, r2]
	cmp r0, 0xB
	bgt _080B6D0C
	adds r0, r1, 0x1
	strh r0, [r6, 0xC]
	b _080B6F24
	.align 2, 0
_080B6D08: .4byte 0x000066e0
_080B6D0C:
	strh r5, [r6, 0xA]
	strh r5, [r6, 0xC]
	ldr r1, _080B6D24 @ =0x00003f44
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	b _080B6F1E
	.align 2, 0
_080B6D24: .4byte 0x00003f44
_080B6D28:
	movs r0, 0x2
	movs r1, 0x3
	movs r2, 0x1
	bl SetAnimBgAttribute
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl SetAnimBgAttribute
	ldr r0, _080B6D7C @ =gBattle_BG2_X
	movs r1, 0
	strh r1, [r0]
	ldr r4, _080B6D80 @ =gBattle_BG2_Y
	strh r1, [r4]
	movs r0, 0x18
	movs r1, 0
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, 0x1A
	bl SetGpuReg
	add r0, sp, 0xC
	movs r1, 0x2
	bl sub_80752C8
	add r0, sp, 0xC
	ldrb r0, [r0, 0x9]
	ldr r1, _080B6D84 @ =gFile_graphics_battle_anims_backgrounds_scary_face_sheet
	add r2, sp, 0xC
	ldrh r2, [r2, 0xA]
	bl sub_80753B4
	ldr r0, _080B6D88 @ =gFile_graphics_battle_anims_backgrounds_scary_face_palette
	add r1, sp, 0xC
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	b _080B6F1E
	.align 2, 0
_080B6D7C: .4byte gBattle_BG2_X
_080B6D80: .4byte gBattle_BG2_Y
_080B6D84: .4byte gFile_graphics_battle_anims_backgrounds_scary_face_sheet
_080B6D88: .4byte gFile_graphics_battle_anims_backgrounds_scary_face_palette
_080B6D8C:
	add r0, sp, 0xC
	movs r1, 0x2
	bl sub_80752C8
	movs r0, 0x80
	lsls r0, 6
	bl AllocZeroed
	adds r1, r0, 0
	ldr r5, _080B6DFC @ =gMonSpritesGfxPtr
	ldr r0, [r5]
	movs r4, 0xBE
	lsls r4, 1
	adds r0, r4
	str r1, [r0]
	ldr r0, _080B6E00 @ =gFile_graphics_battle_anims_backgrounds_scary_face_player_tilemap
	bl LZDecompressWram
	add r0, sp, 0xC
	ldrb r0, [r0, 0x8]
	ldr r1, [r5]
	adds r1, r4
	ldr r1, [r1]
	movs r2, 0x80
	lsls r2, 1
	movs r3, 0
	bl sub_80730C0
	add r0, sp, 0xC
	ldrb r0, [r0, 0x9]
	ldr r1, [r5]
	adds r1, r4
	ldr r1, [r1]
	movs r2, 0x20
	str r2, [sp]
	str r2, [sp, 0x4]
	movs r2, 0x11
	str r2, [sp, 0x8]
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBufferRect_ChangePalette
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	ldr r0, [r5]
	adds r0, r4
	ldr r0, [r0]
	bl Free
	ldr r0, [r5]
	adds r0, r4
	movs r1, 0
	str r1, [r0]
	b _080B6F1E
	.align 2, 0
_080B6DFC: .4byte gMonSpritesGfxPtr
_080B6E00: .4byte gFile_graphics_battle_anims_backgrounds_scary_face_player_tilemap
_080B6E04:
	ldrh r0, [r6, 0xA]
	adds r0, 0x1
	strh r0, [r6, 0xA]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B6E14
	b _080B6F24
_080B6E14:
	ldrh r1, [r6, 0xC]
	adds r1, 0x1
	strh r1, [r6, 0xC]
	ldrh r0, [r6, 0xE]
	subs r0, 0x1
	strh r0, [r6, 0xE]
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0xE
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080B6F24
	strh r0, [r6, 0xA]
	strh r0, [r6, 0xC]
	movs r0, 0x10
	strh r0, [r6, 0xE]
	ldr r1, _080B6E68 @ =0x00003f42
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
	movs r0, 0x2
	movs r1, 0x4
	movs r2, 0x2
	bl SetAnimBgAttribute
	b _080B6F1E
	.align 2, 0
_080B6E68: .4byte 0x00003f42
_080B6E6C:
	cmp r4, 0x1
	bne _080B6E76
	movs r1, 0x80
	lsls r1, 2
	b _080B6E7A
_080B6E76:
	movs r1, 0x80
	lsls r1, 3
_080B6E7A:
	movs r0, 0
	bl ClearGpuRegBits
	b _080B6F1E
_080B6E82:
	ldr r2, _080B6EC0 @ =gSprites
	movs r0, 0x10
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	subs r1, 0x20
	lsls r1, 16
	lsrs r2, r1, 16
	cmp r1, 0
	bge _080B6EA2
	movs r2, 0
_080B6EA2:
	cmp r4, 0x1
	bne _080B6EC4
	lsls r0, r2, 24
	lsrs r0, 24
	adds r1, r2, 0
	adds r1, 0x40
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	str r2, [sp]
	movs r2, 0x4
	str r2, [sp, 0x4]
	str r4, [sp, 0x8]
	b _080B6EDE
	.align 2, 0
_080B6EC0: .4byte gSprites
_080B6EC4:
	lsls r0, r2, 24
	lsrs r0, 24
	adds r1, r2, 0
	adds r1, 0x40
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	str r2, [sp]
	movs r2, 0x8
	str r2, [sp, 0x4]
	movs r2, 0x1
	str r2, [sp, 0x8]
	movs r2, 0x4
_080B6EDE:
	movs r3, 0x8
	bl ScanlineEffect_InitWave
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x1C]
	b _080B6F1E
_080B6EEC:
	ldrh r0, [r6, 0x16]
	ldr r3, _080B6F08 @ =0x000077ff
	movs r1, 0x10
	movs r2, 0xC
	bl BlendPalette
	cmp r4, 0x1
	bne _080B6F0C
	movs r1, 0x80
	lsls r1, 2
	movs r0, 0
	bl SetGpuRegBits
	b _080B6F16
	.align 2, 0
_080B6F08: .4byte 0x000077ff
_080B6F0C:
	movs r1, 0x80
	lsls r1, 3
	movs r0, 0
	bl SetGpuRegBits
_080B6F16:
	ldr r0, _080B6F2C @ =sub_80B6F30
	str r0, [r6]
	movs r0, 0
	strh r0, [r6, 0x26]
_080B6F1E:
	ldrh r0, [r6, 0x26]
	adds r0, 0x1
	strh r0, [r6, 0x26]
_080B6F24:
	add sp, 0x1C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6F2C: .4byte sub_80B6F30
	thumb_func_end sub_80B6BE4

	thumb_func_start sub_80B6F30
sub_80B6F30: @ 80B6F30
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080B6FB8 @ =gTasks
	adds r4, r0, r1
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	movs r0, 0x1
	ands r0, r1
	strh r0, [r4, 0x18]
	cmp r0, 0
	bne _080B6F68
	ldr r1, _080B6FBC @ =gSineTable
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x12
	bl __divsi3
	strh r0, [r4, 0xC]
_080B6F68:
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	cmp r0, 0x1
	bne _080B6F8A
	ldr r1, _080B6FBC @ =gSineTable
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x12
	bl __divsi3
	movs r1, 0x10
	subs r1, r0
	strh r1, [r4, 0xE]
_080B6F8A:
	ldrh r1, [r4, 0xE]
	lsls r1, 8
	ldrh r0, [r4, 0xC]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0x80
	bne _080B6FB2
	movs r0, 0
	strh r0, [r4, 0x26]
	ldr r1, _080B6FC0 @ =sub_80B6FC4
	str r1, [r4]
	adds r0, r5, 0
	bl _call_via_r1
_080B6FB2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6FB8: .4byte gTasks
_080B6FBC: .4byte gSineTable
_080B6FC0: .4byte sub_80B6FC4
	thumb_func_end sub_80B6F30

	thumb_func_start sub_80B6FC4
sub_80B6FC4: @ 80B6FC4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _080B6FE8 @ =gTasks
	adds r6, r0, r1
	movs r1, 0x26
	ldrsh r0, [r6, r1]
	cmp r0, 0x5
	bls _080B6FDE
	b _080B7148
_080B6FDE:
	lsls r0, 2
	ldr r1, _080B6FEC @ =_080B6FF0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B6FE8: .4byte gTasks
_080B6FEC: .4byte _080B6FF0
	.align 2, 0
_080B6FF0:
	.4byte _080B7008
	.4byte _080B7024
	.4byte _080B7044
	.4byte _080B707C
	.4byte _080B709C
	.4byte _080B70E8
_080B7008:
	ldr r1, _080B701C @ =gScanlineEffect
	movs r0, 0x3
	strb r0, [r1, 0x15]
	ldrh r0, [r6, 0x16]
	ldr r3, _080B7020 @ =0x000066e0
	movs r1, 0x10
	movs r2, 0xC
	bl BlendPalette
	b _080B7148
	.align 2, 0
_080B701C: .4byte gScanlineEffect
_080B7020: .4byte 0x000066e0
_080B7024:
	ldr r1, _080B7040 @ =0x00003f44
	movs r0, 0x50
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0x10
	bl SetGpuReg
	movs r1, 0
	movs r0, 0x10
	strh r0, [r6, 0xC]
	strh r1, [r6, 0xE]
	b _080B7148
	.align 2, 0
_080B7040: .4byte 0x00003f44
_080B7044:
	ldrh r1, [r6, 0xC]
	subs r1, 0x1
	strh r1, [r6, 0xC]
	ldrh r0, [r6, 0xE]
	adds r0, 0x1
	strh r0, [r6, 0xE]
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r2, 0xE
	ldrsh r0, [r6, r2]
	cmp r0, 0xF
	ble _080B714E
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x2
	bl SetAnimBgAttribute
	movs r0, 0x2
	movs r1, 0x4
	movs r2, 0x2
	bl SetAnimBgAttribute
	b _080B7148
_080B707C:
	movs r0, 0x2
	bl sub_8075358
	movs r0, 0
	movs r1, 0x90
	movs r2, 0x20
	bl FillPalette
	movs r0, 0x2
	movs r1, 0x3
	movs r2, 0
	bl SetAnimBgAttribute
	movs r0, 0xC
	strh r0, [r6, 0xA]
	b _080B7148
_080B709C:
	ldrh r0, [r6, 0x14]
	ldrb r2, [r6, 0xA]
	ldr r4, _080B70C8 @ =0x000066e0
	movs r1, 0x10
	adds r3, r4, 0
	bl BlendPalette
	ldrh r0, [r6, 0x16]
	ldrb r2, [r6, 0xA]
	movs r1, 0x10
	adds r3, r4, 0
	bl BlendPalette
	ldrh r0, [r6, 0xA]
	movs r2, 0xA
	ldrsh r1, [r6, r2]
	cmp r1, 0
	beq _080B70CC
	subs r0, 0x1
	strh r0, [r6, 0xA]
	b _080B714E
	.align 2, 0
_080B70C8: .4byte 0x000066e0
_080B70CC:
	strh r1, [r6, 0xA]
	ldr r1, _080B70E4 @ =0x00003f44
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	b _080B7148
	.align 2, 0
_080B70E4: .4byte 0x00003f44
_080B70E8:
	ldr r5, _080B7154 @ =gSprites
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	movs r0, 0x3
	ldrb r2, [r6, 0x12]
	ands r2, r0
	lsls r2, 2
	ldrb r4, [r1, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r0, r3, 0
	ands r0, r4
	orrs r0, r2
	strb r0, [r1, 0x5]
	movs r2, 0x10
	ldrsh r1, [r6, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	ands r3, r1
	strb r3, [r0, 0x1]
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x1
	bl SetAnimBgAttribute
	movs r0, 0x2
	movs r1, 0x4
	movs r2, 0x1
	bl SetAnimBgAttribute
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r7, 0
	bl DestroyAnimVisualTask
_080B7148:
	ldrh r0, [r6, 0x26]
	adds r0, 0x1
	strh r0, [r6, 0x26]
_080B714E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7154: .4byte gSprites
	thumb_func_end sub_80B6FC4

	thumb_func_start sub_80B7158
sub_80B7158: @ 80B7158
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r3]
	ldr r2, _080B719C @ =gUnknown_2023D44
	ldr r1, _080B71A0 @ =gBattleAnimAttacker
	ldrb r1, [r1]
	adds r1, r2
	ldrb r1, [r1]
	strh r1, [r0, 0x38]
	movs r1, 0x80
	strh r1, [r0, 0x2E]
	movs r1, 0xA
	strh r1, [r0, 0x30]
	ldr r2, _080B71A4 @ =gBattleAnimArgs
	ldrh r1, [r2]
	strh r1, [r0, 0x32]
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0x34]
	ldr r1, _080B71A8 @ =sub_80B71B0
	str r1, [r0, 0x1C]
	ldr r2, _080B71AC @ =gSprites
	movs r3, 0x38
	ldrsh r1, [r0, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	adds r1, 0x8
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_080B719C: .4byte gUnknown_2023D44
_080B71A0: .4byte gBattleAnimAttacker
_080B71A4: .4byte gBattleAnimArgs
_080B71A8: .4byte sub_80B71B0
_080B71AC: .4byte gSprites
	thumb_func_end sub_80B7158

	thumb_func_start sub_80B71B0
sub_80B71B0: @ 80B71B0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x34]
	movs r1, 0x34
	ldrsh r3, [r5, r1]
	cmp r3, 0
	beq _080B7218
	subs r0, 0x1
	strh r0, [r5, 0x34]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	bl Sin
	ldr r4, _080B7210 @ =gSprites
	movs r1, 0x38
	ldrsh r2, [r5, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r0, [r1, 0x24]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	bl Cos
	movs r1, 0x38
	ldrsh r2, [r5, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r0, [r1, 0x26]
	ldrh r0, [r5, 0x32]
	ldrh r2, [r5, 0x2E]
	adds r1, r0, r2
	strh r1, [r5, 0x2E]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080B724C
	ldr r2, _080B7214 @ =0xffffff00
	adds r0, r1, r2
	strh r0, [r5, 0x2E]
	b _080B724C
	.align 2, 0
_080B7210: .4byte gSprites
_080B7214: .4byte 0xffffff00
_080B7218:
	ldr r2, _080B7254 @ =gSprites
	movs r0, 0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r3, [r0, 0x24]
	movs r0, 0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r3, [r0, 0x26]
	movs r0, 0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	subs r1, 0x8
	strh r1, [r0, 0x22]
	ldr r0, _080B7258 @ =move_anim_8074EE0
	str r0, [r5, 0x1C]
_080B724C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7254: .4byte gSprites
_080B7258: .4byte move_anim_8074EE0
	thumb_func_end sub_80B71B0

	thumb_func_start sub_80B725C
sub_80B725C: @ 80B725C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080B72A4 @ =gBattleAnimAttacker
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
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r6, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x22]
	strh r5, [r6, 0x36]
	movs r0, 0x1
	strh r0, [r6, 0x38]
	ldr r0, _080B74A0 @ =gBattleAnimArgs
	ldrh r0, [r0]
	strh r0, [r6, 0x3A]
	ldr r4, _080B74A4 @ =sBattler_AI
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
_080B74A4: .4byte sBattler_AI
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
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	mov r2, r8
	ldrb r0, [r2]
	movs r1, 0x3
	bl sub_8074480
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
	ldr r1, _080B79C8 @ =gUnknown_2023D44
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
_080B79C8: .4byte gUnknown_2023D44
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
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x30]
	ldr r5, _080B7B3C @ =gBattleAnimAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x34]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	movs r0, 0x7E
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_80754B8
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
	bl sub_8074480
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
	bl sub_8074480
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
	bl sub_8073788
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
	bl sub_8073788
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
	bl sub_8073788
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
	bl sub_8074480
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
	bl sub_8074480
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
	ldr r0, _080B8660 @ =gUnknown_2023D44
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
	bl sub_8072DF0
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
_080B8660: .4byte gUnknown_2023D44
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
	bl sub_8072DF0
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
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080B8750
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0x1
	bl SetAnimBgAttribute
_080B8750:
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _080B87CA
	bl sub_8073788
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
	bl sub_8072DF0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B87CA
	ldr r3, _080B8808 @ =gSprites
	ldr r1, _080B880C @ =gUnknown_2023D44
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
_080B880C: .4byte gUnknown_2023D44
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
	ldr r2, _080B89F4 @ =gUnknown_2023D44
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
_080B89F4: .4byte gUnknown_2023D44
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
	bl sub_8073788
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
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080B8B04
	ldr r0, _080B8B00 @ =gUnknown_2023D44
	adds r0, r4, r0
	ldrb r2, [r0]
	b _080B8B06
	.align 2, 0
_080B8B00: .4byte gUnknown_2023D44
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
	ldr r2, _080B8B64 @ =gUnknown_2037F16
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
_080B8B64: .4byte gUnknown_2037F16
_080B8B68: .4byte gBattleAnimArgs
	thumb_func_end sub_80B8B38

	thumb_func_start sub_80B8B6C
sub_80B8B6C: @ 80B8B6C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080B8BC4 @ =gBattleAnimAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	ldr r5, _080B8BC8 @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	ldr r0, _080B8BCC @ =0x0000ffd8
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_8075068
	ldr r0, _080B8BD0 @ =sub_80B8BD4
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8BC4: .4byte gBattleAnimAttacker
_080B8BC8: .4byte gBattleAnimTarget
_080B8BCC: .4byte 0x0000ffd8
_080B8BD0: .4byte sub_80B8BD4
	thumb_func_end sub_80B8B6C

	thumb_func_start sub_80B8BD4
sub_80B8BD4: @ 80B8BD4
	push {r4,r5,lr}
	adds r5, r0, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080B8C28
	ldrh r0, [r5, 0x24]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r1, [r5, 0x26]
	strh r1, [r5, 0x24]
	movs r0, 0x14
	strh r0, [r5, 0x2E]
	ldr r4, _080B8C30 @ =gBattleAnimAttacker
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
	movs r0, 0x28
	strh r0, [r5, 0x38]
	adds r0, r5, 0
	bl sub_8075068
	ldr r0, _080B8C34 @ =sub_80B8C38
	str r0, [r5, 0x1C]
_080B8C28:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8C30: .4byte gBattleAnimAttacker
_080B8C34: .4byte sub_80B8C38
	thumb_func_end sub_80B8BD4

	thumb_func_start sub_80B8C38
sub_80B8C38: @ 80B8C38
	push {r4,lr}
	adds r4, r0, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080B8C4C
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B8C4C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B8C38

	thumb_func_start sub_80B8C54
sub_80B8C54: @ 80B8C54
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_8075114
	ldr r0, _080B8CB4 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B8C74
	ldr r1, _080B8CB8 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080B8C74:
	ldr r4, _080B8CB8 @ =gBattleAnimArgs
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldr r5, _080B8CBC @ =gBattleAnimTarget
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
	ldr r0, _080B8CC0 @ =sub_8075590
	str r0, [r6, 0x1C]
	ldr r1, _080B8CC4 @ =DestroyAnimSprite
	adds r0, r6, 0
	bl StoreSpriteCallbackInData6
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8CB4: .4byte gBattleAnimAttacker
_080B8CB8: .4byte gBattleAnimArgs
_080B8CBC: .4byte gBattleAnimTarget
_080B8CC0: .4byte sub_8075590
_080B8CC4: .4byte DestroyAnimSprite
	thumb_func_end sub_80B8C54

	thumb_func_start sub_80B8CC8
sub_80B8CC8: @ 80B8CC8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r4, _080B8D48 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074844
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074844
	lsls r0, 24
	lsrs r7, r0, 24
	bl Random
	movs r4, 0x1F
	adds r5, r4, 0
	ands r5, r0
	bl Random
	ands r4, r0
	adds r1, r5, 0
	cmp r1, 0x10
	ble _080B8D10
	movs r0, 0x10
	subs r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
_080B8D10:
	lsls r0, r4, 16
	asrs r1, r0, 16
	cmp r1, 0x10
	ble _080B8D20
	movs r0, 0x10
	subs r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
_080B8D20:
	ldr r0, _080B8D4C @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r6, 0x2E]
	mov r1, r8
	adds r0, r1, r5
	strh r0, [r6, 0x32]
	adds r0, r7, r4
	strh r0, [r6, 0x36]
	ldr r0, _080B8D50 @ =sub_8075590
	str r0, [r6, 0x1C]
	ldr r1, _080B8D54 @ =move_anim_8074EE0
	adds r0, r6, 0
	bl StoreSpriteCallbackInData6
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8D48: .4byte gBattleAnimTarget
_080B8D4C: .4byte gBattleAnimArgs
_080B8D50: .4byte sub_8075590
_080B8D54: .4byte move_anim_8074EE0
	thumb_func_end sub_80B8CC8

	thumb_func_start sub_80B8D58
sub_80B8D58: @ 80B8D58
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x1
	ldr r3, _080B8DB8 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080B8DBC @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldr r6, _080B8DC0 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080B8DCC
	ldr r4, _080B8DC4 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r6, 0x2]
	adds r0, r2
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r3, [r6, 0x4]
	adds r0, r3
	strh r0, [r5, 0x22]
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	ble _080B8DB2
	movs r1, 0x1
_080B8DB2:
	strh r1, [r5, 0x2E]
	ldr r0, _080B8DC8 @ =sub_80B8DE8
	b _080B8DDA
	.align 2, 0
_080B8DB8: .4byte 0x000003ff
_080B8DBC: .4byte 0xfffffc00
_080B8DC0: .4byte gBattleAnimArgs
_080B8DC4: .4byte gBattleAnimAttacker
_080B8DC8: .4byte sub_80B8DE8
_080B8DCC:
	ldrh r0, [r6, 0x2]
	strh r0, [r5, 0x20]
	ldrh r0, [r6, 0x4]
	strh r0, [r5, 0x22]
	negs r0, r0
	strh r0, [r5, 0x26]
	ldr r0, _080B8DE4 @ =sub_80B8E24
_080B8DDA:
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8DE4: .4byte sub_80B8E24
	thumb_func_end sub_80B8D58

	thumb_func_start sub_80B8DE8
sub_80B8DE8: @ 80B8DE8
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B8E06
	movs r0, 0
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
_080B8E06:
	ldrh r0, [r2, 0x22]
	subs r0, 0x4
	strh r0, [r2, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x4
	negs r1, r1
	cmp r0, r1
	bge _080B8E1E
	adds r0, r2, 0
	bl DestroyAnimSprite
_080B8E1E:
	pop {r0}
	bx r0
	thumb_func_end sub_80B8DE8

	thumb_func_start sub_80B8E24
sub_80B8E24: @ 80B8E24
	push {lr}
	adds r3, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	cmp r1, 0
	beq _080B8E36
	cmp r1, 0x1
	beq _080B8E4C
	b _080B8E8E
_080B8E36:
	ldrh r0, [r3, 0x26]
	adds r0, 0x4
	strh r0, [r3, 0x26]
	lsls r0, 16
	cmp r0, 0
	blt _080B8E8E
	strh r1, [r3, 0x26]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	b _080B8E8E
_080B8E4C:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	cmp r0, 0
	ble _080B8E8E
	movs r0, 0
	strh r0, [r3, 0x30]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	ldrb r2, [r1]
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
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _080B8E8E
	adds r0, r3, 0
	bl DestroyAnimSprite
_080B8E8E:
	pop {r0}
	bx r0
	thumb_func_end sub_80B8E24

	thumb_func_start sub_80B8E94
sub_80B8E94: @ 80B8E94
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080B8EB4 @ =gTasks
	adds r1, r0, r1
	ldr r0, _080B8EB8 @ =gBattleAnimArgs
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r0, 0
	bne _080B8EC0
	ldr r0, _080B8EBC @ =sub_80B8ED4
	b _080B8EC2
	.align 2, 0
_080B8EB4: .4byte gTasks
_080B8EB8: .4byte gBattleAnimArgs
_080B8EBC: .4byte sub_80B8ED4
_080B8EC0:
	ldr r0, _080B8ED0 @ =sub_80B908C
_080B8EC2:
	str r0, [r1]
	ldr r1, [r1]
	adds r0, r2, 0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080B8ED0: .4byte sub_80B908C
	thumb_func_end sub_80B8E94

	thumb_func_start sub_80B8ED4
sub_80B8ED4: @ 80B8ED4
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080B8EF8 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080B8EEE
	b _080B9082
_080B8EEE:
	lsls r0, 2
	ldr r1, _080B8EFC @ =_080B8F00
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B8EF8: .4byte gTasks
_080B8EFC: .4byte _080B8F00
	.align 2, 0
_080B8F00:
	.4byte _080B8F14
	.4byte _080B8F9C
	.4byte _080B8FAC
	.4byte _080B9050
	.4byte _080B9064
_080B8F14:
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1C]
	ldr r0, _080B8F3C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1E]
	cmp r0, 0x1
	bne _080B8F48
	ldr r0, _080B8F40 @ =gBattle_BG1_X
	ldrh r0, [r0]
	strh r0, [r4, 0x20]
	ldr r0, _080B8F44 @ =gBattle_BG1_Y
	b _080B8F50
	.align 2, 0
_080B8F3C: .4byte gBattleAnimAttacker
_080B8F40: .4byte gBattle_BG1_X
_080B8F44: .4byte gBattle_BG1_Y
_080B8F48:
	ldr r0, _080B8F8C @ =gBattle_BG2_X
	ldrh r0, [r0]
	strh r0, [r4, 0x20]
	ldr r0, _080B8F90 @ =gBattle_BG2_Y
_080B8F50:
	ldrh r0, [r0]
	strh r0, [r4, 0x22]
	ldr r0, _080B8F94 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_807492C
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	subs r1, 0x20
	strh r1, [r4, 0x24]
	adds r0, 0x20
	strh r0, [r4, 0x26]
	cmp r1, 0
	bge _080B8F72
	movs r0, 0
	strh r0, [r4, 0x24]
_080B8F72:
	ldr r2, _080B8F98 @ =gSprites
	movs r3, 0x1C
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _080B9056
	.align 2, 0
_080B8F8C: .4byte gBattle_BG2_X
_080B8F90: .4byte gBattle_BG2_Y
_080B8F94: .4byte gBattleAnimAttacker
_080B8F98: .4byte gSprites
_080B8F9C:
	ldrb r0, [r4, 0x1E]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	movs r3, 0x26
	ldrsh r2, [r4, r3]
	bl sub_80B92B8
	b _080B9056
_080B8FAC:
	ldrh r0, [r4, 0xC]
	adds r0, 0x6
	movs r1, 0x7F
	ands r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080B8FCE
	movs r0, 0
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
_080B8FCE:
	ldr r1, _080B8FF0 @ =gSineTable
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 20
	ldrh r3, [r4, 0xE]
	adds r2, r0, r3
	strh r2, [r4, 0x12]
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080B8FF8
	ldr r1, _080B8FF4 @ =gBattle_BG1_Y
	b _080B8FFA
	.align 2, 0
_080B8FF0: .4byte gSineTable
_080B8FF4: .4byte gBattle_BG1_Y
_080B8FF8:
	ldr r1, _080B901C @ =gBattle_BG2_Y
_080B8FFA:
	ldrh r0, [r4, 0x22]
	subs r0, r2
	strh r0, [r1]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0x3F
	ble _080B9082
	ldrh r0, [r4, 0x24]
	movs r1, 0x78
	subs r2, r1, r0
	strh r2, [r4, 0x12]
	movs r3, 0x1E
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	bne _080B9024
	ldr r1, _080B9020 @ =gBattle_BG1_Y
	b _080B9026
	.align 2, 0
_080B901C: .4byte gBattle_BG2_Y
_080B9020: .4byte gBattle_BG1_Y
_080B9024:
	ldr r1, _080B9048 @ =gBattle_BG2_Y
_080B9026:
	ldrh r0, [r4, 0x22]
	subs r0, r2
	strh r0, [r1]
	ldr r2, _080B904C @ =gSprites
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r2, [r1, 0x20]
	movs r3, 0x88
	lsls r3, 1
	adds r0, r3, 0
	subs r0, r2
	strh r0, [r1, 0x24]
	b _080B9056
	.align 2, 0
_080B9048: .4byte gBattle_BG2_Y
_080B904C: .4byte gSprites
_080B9050:
	ldr r1, _080B9060 @ =gScanlineEffect
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080B9056:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B9082
	.align 2, 0
_080B9060: .4byte gScanlineEffect
_080B9064:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
	ldr r2, _080B9088 @ =gSprites
	movs r0, 0x1C
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
_080B9082:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9088: .4byte gSprites
	thumb_func_end sub_80B8ED4

	thumb_func_start sub_80B908C
sub_80B908C: @ 80B908C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B90CC @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r3]
	movs r4, 0
	strh r4, [r1, 0x24]
	strh r4, [r1, 0x26]
	ldr r0, _080B90D0 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B90D8
	ldr r0, _080B90D4 @ =gBattle_BG1_Y
	b _080B90DA
	.align 2, 0
_080B90CC: .4byte gSprites
_080B90D0: .4byte gBattleAnimAttacker
_080B90D4: .4byte gBattle_BG1_Y
_080B90D8:
	ldr r0, _080B90E8 @ =gBattle_BG2_Y
_080B90DA:
	strh r4, [r0]
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B90E8: .4byte gBattle_BG2_Y
	thumb_func_end sub_80B908C

	thumb_func_start sub_80B90EC
sub_80B90EC: @ 80B90EC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080B910C @ =gTasks
	adds r1, r0, r1
	ldr r0, _080B9110 @ =gBattleAnimArgs
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r0, 0
	bne _080B9118
	ldr r0, _080B9114 @ =sub_80B912C
	b _080B911A
	.align 2, 0
_080B910C: .4byte gTasks
_080B9110: .4byte gBattleAnimArgs
_080B9114: .4byte sub_80B912C
_080B9118:
	ldr r0, _080B9128 @ =sub_80B91B0
_080B911A:
	str r0, [r1]
	ldr r1, [r1]
	adds r0, r2, 0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080B9128: .4byte sub_80B91B0
	thumb_func_end sub_80B90EC

	thumb_func_start sub_80B912C
sub_80B912C: @ 80B912C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080B914C @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r5, [r4, r0]
	cmp r5, 0
	beq _080B9150
	cmp r5, 0x1
	beq _080B91A4
	b _080B91AA
	.align 2, 0
_080B914C: .4byte gTasks
_080B9150:
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1C]
	ldr r3, _080B91A0 @ =gSprites
	movs r0, 0x1C
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
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r5, [r0, 0x24]
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r2, [r1, 0x22]
	movs r0, 0xA0
	subs r0, r2
	strh r0, [r1, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B91AA
	.align 2, 0
_080B91A0: .4byte gSprites
_080B91A4:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080B91AA:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80B912C

	thumb_func_start sub_80B91B0
sub_80B91B0: @ 80B91B0
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080B91D4 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bhi _080B92B2
	lsls r0, 2
	ldr r1, _080B91D8 @ =_080B91DC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B91D4: .4byte gTasks
_080B91D8: .4byte _080B91DC
	.align 2, 0
_080B91DC:
	.4byte _080B91F0
	.4byte _080B9244
	.4byte _080B9252
	.4byte _080B926C
	.4byte _080B92AC
_080B91F0:
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1C]
	ldr r0, _080B9214 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1E]
	cmp r0, 0x1
	bne _080B921C
	ldr r0, _080B9218 @ =gBattle_BG1_X
	b _080B921E
	.align 2, 0
_080B9214: .4byte gBattleAnimAttacker
_080B9218: .4byte gBattle_BG1_X
_080B921C:
	ldr r0, _080B923C @ =gBattle_BG2_X
_080B921E:
	ldrh r0, [r0]
	strh r0, [r4, 0x20]
	ldr r0, _080B9240 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_807492C
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	subs r1, 0x20
	strh r1, [r4, 0x24]
	adds r0, 0x20
	strh r0, [r4, 0x26]
	b _080B929A
	.align 2, 0
_080B923C: .4byte gBattle_BG2_X
_080B9240: .4byte gBattleAnimAttacker
_080B9244:
	ldrb r0, [r4, 0x1E]
	movs r1, 0x26
	ldrsh r2, [r4, r1]
	movs r1, 0
	bl sub_80B92B8
	b _080B929A
_080B9252:
	ldr r2, _080B9268 @ =gSprites
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x60
	strh r1, [r0, 0x26]
	b _080B929A
	.align 2, 0
_080B9268: .4byte gSprites
_080B926C:
	ldr r2, _080B92A4 @ =gSprites
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x8
	strh r1, [r0, 0x26]
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x26
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B92B2
	ldr r1, _080B92A8 @ =gScanlineEffect
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080B929A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B92B2
	.align 2, 0
_080B92A4: .4byte gSprites
_080B92A8: .4byte gScanlineEffect
_080B92AC:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080B92B2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B91B0

	thumb_func_start sub_80B92B8
sub_80B92B8: @ 80B92B8
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r4, r2, 16
	cmp r0, 0x1
	bne _080B92DC
	ldr r0, _080B92D4 @ =gBattle_BG1_X
	ldrh r3, [r0]
	ldr r0, _080B92D8 @ =0x04000014
	b _080B92E2
	.align 2, 0
_080B92D4: .4byte gBattle_BG1_X
_080B92D8: .4byte 0x04000014
_080B92DC:
	ldr r0, _080B9368 @ =gBattle_BG2_X
	ldrh r3, [r0]
	ldr r0, _080B936C @ =0x04000018
_080B92E2:
	str r0, [sp]
	lsls r0, r1, 16
	cmp r0, 0
	bge _080B92EC
	movs r1, 0
_080B92EC:
	lsls r2, r1, 16
	lsls r0, r4, 16
	asrs r4, r0, 16
	cmp r2, r0
	bge _080B9318
	ldr r5, _080B9370 @ =gScanlineEffectRegBuffers
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
_080B92FE:
	asrs r2, 16
	lsls r1, r2, 1
	adds r0, r1, r5
	strh r3, [r0]
	adds r1, r6
	strh r3, [r1]
	adds r2, 0x1
	lsls r2, 16
	lsrs r1, r2, 16
	lsls r2, r1, 16
	asrs r0, r2, 16
	cmp r0, r4
	blt _080B92FE
_080B9318:
	lsls r1, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	bgt _080B9346
	ldr r4, _080B9370 @ =gScanlineEffectRegBuffers
	lsls r0, r3, 16
	asrs r0, 16
	adds r3, r0, 0
	adds r3, 0xF0
	movs r0, 0xF0
	lsls r0, 3
	adds r5, r4, r0
_080B9330:
	asrs r2, r1, 16
	lsls r1, r2, 1
	adds r0, r1, r4
	strh r3, [r0]
	adds r1, r5
	strh r3, [r1]
	adds r2, 0x1
	lsls r1, r2, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	ble _080B9330
_080B9346:
	ldr r0, _080B9374 @ =0xa2600001
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
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9368: .4byte gBattle_BG2_X
_080B936C: .4byte 0x04000018
_080B9370: .4byte gScanlineEffectRegBuffers
_080B9374: .4byte 0xa2600001
	thumb_func_end sub_80B92B8

	thumb_func_start sub_80B9378
sub_80B9378: @ 80B9378
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r0, _080B938C @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r7, r0, 0
	cmp r1, 0
	bne _080B9394
	ldr r0, _080B9390 @ =gBattleAnimAttacker
	b _080B9396
	.align 2, 0
_080B938C: .4byte gBattleAnimArgs
_080B9390: .4byte gBattleAnimAttacker
_080B9394:
	ldr r0, _080B93F8 @ =gBattleAnimTarget
_080B9396:
	ldrb r4, [r0]
	movs r6, 0x18
	adds r1, r7, 0
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	bne _080B93B2
	negs r0, r6
	lsls r0, 16
	lsrs r6, r0, 16
	movs r2, 0x4
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1, 0x4]
_080B93B2:
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, r6
	strh r0, [r5, 0x20]
	adds r0, r4, 0
	bl sub_807492C
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1E
	strh r0, [r5, 0x22]
	ldrh r1, [r7, 0xA]
	strh r1, [r5, 0x2E]
	ldrh r1, [r7, 0x4]
	ldrh r2, [r5, 0x20]
	adds r1, r2
	strh r1, [r5, 0x32]
	ldrh r1, [r7, 0x6]
	adds r0, r1
	strh r0, [r5, 0x36]
	ldrh r0, [r7, 0x8]
	strh r0, [r5, 0x38]
	adds r0, r5, 0
	bl sub_8075068
	ldr r0, _080B93FC @ =sub_80B9400
	str r0, [r5, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B93F8: .4byte gBattleAnimTarget
_080B93FC: .4byte sub_80B9400
	thumb_func_end sub_80B9378

	thumb_func_start sub_80B9400
sub_80B9400: @ 80B9400
	push {r4,lr}
	adds r4, r0, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080B9414
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B9414:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B9400

	thumb_func_start sub_80B941C
sub_80B941C: @ 80B941C
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _080B9430 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B9438
	ldr r0, _080B9434 @ =gBattleAnimAttacker
	b _080B943A
	.align 2, 0
_080B9430: .4byte gBattleAnimArgs
_080B9434: .4byte gBattleAnimAttacker
_080B9438:
	ldr r0, _080B9498 @ =gBattleAnimTarget
_080B943A:
	ldrb r5, [r0]
	adds r0, r5, 0
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B949C @ =0x0000fff0
	adds r0, r2
	ldr r4, _080B94A0 @ =gBattleAnimArgs
	movs r3, 0x2
	ldrsh r1, [r4, r3]
	lsls r1, 5
	adds r0, r1
	strh r0, [r6, 0x20]
	adds r0, r5, 0
	bl sub_807492C
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x20
	strh r0, [r6, 0x22]
	ldrh r2, [r6, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	movs r3, 0x2
	ldrsh r0, [r4, r3]
	lsls r0, 3
	adds r1, r0
	ldr r3, _080B94A4 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080B94A8 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r6, 0x4]
	ldr r1, _080B94AC @ =DestroyAnimSprite
	adds r0, r6, 0
	bl StoreSpriteCallbackInData6
	ldrh r0, [r4, 0x4]
	strh r0, [r6, 0x2E]
	ldr r0, _080B94B0 @ =sub_8074C44
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9498: .4byte gBattleAnimTarget
_080B949C: .4byte 0x0000fff0
_080B94A0: .4byte gBattleAnimArgs
_080B94A4: .4byte 0x000003ff
_080B94A8: .4byte 0xfffffc00
_080B94AC: .4byte DestroyAnimSprite
_080B94B0: .4byte sub_8074C44
	thumb_func_end sub_80B941C

	thumb_func_start sub_80B94B4
sub_80B94B4: @ 80B94B4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080B94D8 @ =gTasks
	adds r4, r0, r1
	ldr r0, _080B94DC @ =gBattleAnimArgs
	ldrh r2, [r0, 0x2]
	movs r3, 0x2
	ldrsh r1, [r0, r3]
	adds r6, r0, 0
	cmp r1, 0
	beq _080B94E0
	adds r0, r2, 0x3
	b _080B94EC
	.align 2, 0
_080B94D8: .4byte gTasks
_080B94DC: .4byte gBattleAnimArgs
_080B94E0:
	ldr r0, _080B950C @ =gUnknown_2037EEC
	ldrh r0, [r0]
	movs r1, 0xA
	bl __udivsi3
	adds r0, 0x3
_080B94EC:
	strh r0, [r4, 0x26]
	strh r0, [r4, 0x24]
	adds r1, r6, 0
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0xE]
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0x4
	beq _080B9518
	cmp r0, 0x5
	bne _080B9558
	ldr r0, _080B9510 @ =gBattle_BG3_X
	ldrh r0, [r0]
	strh r0, [r4, 0x22]
	ldr r0, _080B9514 @ =sub_80B9584
	b _080B9576
	.align 2, 0
_080B950C: .4byte gUnknown_2037EEC
_080B9510: .4byte gBattle_BG3_X
_080B9514: .4byte sub_80B9584
_080B9518:
	movs r0, 0
	strh r0, [r4, 0x22]
	movs r5, 0
_080B951E:
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080B9548
	movs r3, 0x22
	ldrsh r0, [r4, r3]
	adds r0, 0x9
	lsls r0, 1
	adds r1, r4, 0
	adds r1, 0x8
	adds r1, r0
	ldr r0, _080B9554 @ =gUnknown_2023D44
	adds r0, r5, r0
	ldrb r0, [r0]
	strh r0, [r1]
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
_080B9548:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _080B951E
	b _080B9574
	.align 2, 0
_080B9554: .4byte gUnknown_2023D44
_080B9558:
	ldrb r0, [r6]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1A]
	cmp r0, 0xFF
	bne _080B9570
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	b _080B9578
_080B9570:
	movs r0, 0x1
	strh r0, [r4, 0x22]
_080B9574:
	ldr r0, _080B9580 @ =sub_80B967C
_080B9576:
	str r0, [r4]
_080B9578:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9580: .4byte sub_80B967C
	thumb_func_end sub_80B94B4

	thumb_func_start sub_80B9584
sub_80B9584: @ 80B9584
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080B95A8 @ =gTasks
	adds r3, r0, r1
	movs r0, 0x8
	ldrsh r1, [r3, r0]
	cmp r1, 0x1
	beq _080B9608
	cmp r1, 0x1
	bgt _080B95AC
	cmp r1, 0
	beq _080B95B2
	b _080B9674
	.align 2, 0
_080B95A8: .4byte gTasks
_080B95AC:
	cmp r1, 0x2
	beq _080B9668
	b _080B9674
_080B95B2:
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B9674
	strh r1, [r3, 0xA]
	ldrh r1, [r3, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080B95DC
	ldr r1, _080B95D8 @ =gBattle_BG3_X
	ldrh r0, [r3, 0x26]
	ldrh r2, [r3, 0x22]
	adds r0, r2
	strh r0, [r1]
	b _080B95E6
	.align 2, 0
_080B95D8: .4byte gBattle_BG3_X
_080B95DC:
	ldr r0, _080B9604 @ =gBattle_BG3_X
	ldrh r1, [r3, 0x22]
	ldrh r2, [r3, 0x26]
	subs r1, r2
	strh r1, [r0]
_080B95E6:
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xE
	ldrsh r1, [r3, r2]
	cmp r0, r1
	bne _080B9674
	movs r0, 0
	strh r0, [r3, 0xC]
	ldrh r0, [r3, 0x24]
	subs r0, 0x1
	strh r0, [r3, 0x24]
	b _080B965C
	.align 2, 0
_080B9604: .4byte gBattle_BG3_X
_080B9608:
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B9674
	movs r0, 0
	strh r0, [r3, 0xA]
	ldrh r0, [r3, 0xC]
	ands r1, r0
	cmp r1, 0
	bne _080B9634
	ldr r1, _080B9630 @ =gBattle_BG3_X
	ldrh r0, [r3, 0x24]
	ldrh r2, [r3, 0x22]
	adds r0, r2
	strh r0, [r1]
	b _080B963E
	.align 2, 0
_080B9630: .4byte gBattle_BG3_X
_080B9634:
	ldr r0, _080B9664 @ =gBattle_BG3_X
	ldrh r1, [r3, 0x22]
	ldrh r2, [r3, 0x24]
	subs r1, r2
	strh r1, [r0]
_080B963E:
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080B9674
	movs r0, 0
	strh r0, [r3, 0xC]
	ldrh r0, [r3, 0x24]
	subs r0, 0x1
	strh r0, [r3, 0x24]
	lsls r0, 16
	cmp r0, 0
	bne _080B9674
_080B965C:
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	b _080B9674
	.align 2, 0
_080B9664: .4byte gBattle_BG3_X
_080B9668:
	ldr r1, _080B9678 @ =gBattle_BG3_X
	ldrh r0, [r3, 0x22]
	strh r0, [r1]
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080B9674:
	pop {r0}
	bx r0
	.align 2, 0
_080B9678: .4byte gBattle_BG3_X
	thumb_func_end sub_80B9584

	thumb_func_start sub_80B967C
sub_80B967C: @ 80B967C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _080B96A0 @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _080B96DC
	cmp r5, 0x1
	bgt _080B96A4
	cmp r5, 0
	beq _080B96AA
	b _080B9756
	.align 2, 0
_080B96A0: .4byte gTasks
_080B96A4:
	cmp r5, 0x2
	beq _080B9718
	b _080B9756
_080B96AA:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B9756
	strh r5, [r4, 0xA]
	adds r0, r4, 0
	bl sub_80B9760
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080B9756
	strh r5, [r4, 0xC]
	ldrh r0, [r4, 0x24]
	subs r0, 0x1
	strh r0, [r4, 0x24]
	b _080B9710
_080B96DC:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B9756
	strh r5, [r4, 0xA]
	adds r0, r4, 0
	bl sub_80B9760
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080B9756
	strh r5, [r4, 0xC]
	ldrh r0, [r4, 0x24]
	subs r0, 0x1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	bne _080B9756
_080B9710:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B9756
_080B9718:
	movs r2, 0
	movs r7, 0x22
	ldrsh r0, [r4, r7]
	cmp r2, r0
	bge _080B9750
	ldr r0, _080B975C @ =gSprites
	mov r12, r0
	adds r5, r4, 0
	adds r5, 0x8
	movs r6, 0
_080B972C:
	adds r0, r2, 0
	adds r0, 0x9
	lsls r0, 1
	adds r0, r5, r0
	movs r7, 0
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r12
	strh r6, [r0, 0x24]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	cmp r2, r0
	blt _080B972C
_080B9750:
	adds r0, r3, 0
	bl DestroyAnimVisualTask
_080B9756:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B975C: .4byte gSprites
	thumb_func_end sub_80B967C

	thumb_func_start sub_80B9760
sub_80B9760: @ 80B9760
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0xC]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _080B9788
	movs r0, 0x24
	ldrsh r1, [r3, r0]
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	ldrh r2, [r3, 0x24]
	adds r0, r4, 0
	ands r0, r2
	adds r1, r0
	lsls r1, 16
	lsrs r4, r1, 16
	b _080B9798
_080B9788:
	movs r1, 0x24
	ldrsh r0, [r3, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	negs r0, r0
	lsls r0, 16
	lsrs r4, r0, 16
_080B9798:
	movs r2, 0
	movs r7, 0x22
	ldrsh r0, [r3, r7]
	cmp r2, r0
	bge _080B97CC
	ldr r6, _080B97D4 @ =gSprites
	adds r5, r3, 0
	adds r5, 0x8
_080B97A8:
	adds r0, r2, 0
	adds r0, 0x9
	lsls r0, 1
	adds r0, r5, r0
	movs r7, 0
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r4, [r0, 0x24]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0x22
	ldrsh r0, [r3, r1]
	cmp r2, r0
	blt _080B97A8
_080B97CC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B97D4: .4byte gSprites
	thumb_func_end sub_80B9760

	thumb_func_start sub_80B97D8
sub_80B97D8: @ 80B97D8
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r3, _080B97F8 @ =gBattleAnimArgs
	movs r2, 0
	ldr r0, _080B97FC @ =gUnknown_2037EEC
	ldrh r0, [r0]
	cmp r0, 0x63
	bls _080B97EC
	movs r2, 0x1
_080B97EC:
	strh r2, [r3, 0x1E]
	adds r0, r1, 0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080B97F8: .4byte gBattleAnimArgs
_080B97FC: .4byte gUnknown_2037EEC
	thumb_func_end sub_80B97D8

	thumb_func_start sub_80B9800
sub_80B9800: @ 80B9800
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _080B9818 @ =gBattleAnimArgs
	ldrh r1, [r2]
	movs r0, 0x1
	ands r0, r1
	adds r6, r2, 0
	cmp r0, 0
	beq _080B9820
	ldr r0, _080B981C @ =gBattleAnimTarget
	b _080B9822
	.align 2, 0
_080B9818: .4byte gBattleAnimArgs
_080B981C: .4byte gBattleAnimTarget
_080B9820:
	ldr r0, _080B9890 @ =gBattleAnimAttacker
_080B9822:
	ldrb r0, [r0]
	adds r5, r0, 0
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0x1
	ble _080B9832
	movs r0, 0x2
	eors r5, r0
_080B9832:
	ldr r0, _080B9894 @ =sub_80B98A8
	ldrb r1, [r6, 0x2]
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080B9898 @ =gTasks
	adds r4, r0
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x20
	subs r1, r0
	ldr r2, _080B989C @ =0x000001ff
	adds r0, r2, 0
	ands r1, r0
	strh r1, [r4, 0xA]
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x40
	subs r1, r0
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r4, 0xC]
	ldr r2, _080B98A0 @ =gBattle_BG3_X
	ldrh r0, [r4, 0xA]
	strh r0, [r2]
	ldr r0, _080B98A4 @ =gBattle_BG3_Y
	strh r1, [r0]
	ldrh r0, [r6, 0x4]
	strh r0, [r4, 0xE]
	adds r0, r7, 0
	bl DestroyAnimVisualTask
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9890: .4byte gBattleAnimAttacker
_080B9894: .4byte sub_80B98A8
_080B9898: .4byte gTasks
_080B989C: .4byte 0x000001ff
_080B98A0: .4byte gBattle_BG3_X
_080B98A4: .4byte gBattle_BG3_Y
	thumb_func_end sub_80B9800

	thumb_func_start sub_80B98A8
sub_80B98A8: @ 80B98A8
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _080B98D8 @ =gTasks
	adds r2, r0, r1
	ldr r0, _080B98DC @ =gBattleAnimArgs
	movs r4, 0xE
	ldrsh r1, [r0, r4]
	movs r4, 0xE
	ldrsh r0, [r2, r4]
	cmp r1, r0
	bne _080B98E8
	ldr r0, _080B98E0 @ =gBattle_BG3_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080B98E4 @ =gBattle_BG3_Y
	strh r1, [r0]
	adds r0, r3, 0
	bl DestroyTask
	b _080B98F4
	.align 2, 0
_080B98D8: .4byte gTasks
_080B98DC: .4byte gBattleAnimArgs
_080B98E0: .4byte gBattle_BG3_X
_080B98E4: .4byte gBattle_BG3_Y
_080B98E8:
	ldr r1, _080B98FC @ =gBattle_BG3_X
	ldrh r0, [r2, 0xA]
	strh r0, [r1]
	ldr r1, _080B9900 @ =gBattle_BG3_Y
	ldrh r0, [r2, 0xC]
	strh r0, [r1]
_080B98F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B98FC: .4byte gBattle_BG3_X
_080B9900: .4byte gBattle_BG3_Y
	thumb_func_end sub_80B98A8

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
	bl sub_80B9A14
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

	thumb_func_start sub_80B9A14
sub_80B9A14: @ 80B9A14
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
	thumb_func_end sub_80B9A14

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
	bl sub_80B9A14
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
	bl sub_80B9A14
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
	bl sub_80B9A14
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
	ldr r1, _080B9BD4 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r1, _080B9BD8 @ =sub_8074AE0
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9BD0: .4byte gBattleAnimArgs
_080B9BD4: .4byte move_anim_8074EE0
_080B9BD8: .4byte sub_8074AE0
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
	bl sub_80B9A14
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
	ldr r0, _080BA278 @ =gUnknown_3004FF0
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
_080BA278: .4byte gUnknown_3004FF0
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
	ldr r6, _080BA3C8 @ =gUnknown_2023D44
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
_080BA3C8: .4byte gUnknown_2023D44
	thumb_func_end sub_80BA320

	thumb_func_start sub_80BA3CC
sub_80BA3CC: @ 80BA3CC
	push {r4-r6,lr}
	ldr r6, _080BA440 @ =gSprites
	ldr r4, _080BA444 @ =gUnknown_2023D44
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
_080BA444: .4byte gUnknown_2023D44
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
	bl sub_8075160
	b _080BA58C
	.align 2, 0
_080BA580: .4byte gBattleAnimArgs
_080BA584:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8075114
_080BA58C:
	ldr r0, _080BA5A0 @ =sub_8074F50
	str r0, [r5, 0x1C]
	ldr r1, _080BA5A4 @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA5A0: .4byte sub_8074F50
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
	bl sub_8075160
	b _080BA5D4
	.align 2, 0
_080BA5C8: .4byte gBattleAnimArgs
_080BA5CC:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8075114
_080BA5D4:
	ldr r0, _080BA5EC @ =gBattleAnimArgs
	ldrh r0, [r0, 0x8]
	strh r0, [r5, 0x2E]
	ldr r0, _080BA5F0 @ =sub_8074F50
	str r0, [r5, 0x1C]
	ldr r1, _080BA5F4 @ =sub_80B1D3C
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA5EC: .4byte gBattleAnimArgs
_080BA5F0: .4byte sub_8074F50
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
	bl sub_8073788
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
	bl sub_8075160
	b _080BA674
	.align 2, 0
_080BA668: .4byte gBattleAnimArgs
_080BA66C:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8075114
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
	ldr r1, _080BA6C0 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080BA6C4 @ =sub_8074F50
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA6B8: .4byte 0x0000ffe8
_080BA6BC: .4byte 0x0000fff4
_080BA6C0: .4byte move_anim_8074EE0
_080BA6C4: .4byte sub_8074F50
	thumb_func_end sub_80BA630

	thumb_func_start sub_80BA6C8
sub_80BA6C8: @ 80BA6C8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080BA728 @ =gBattleAnimArgs
	ldrb r0, [r5]
	bl GetAnimBankSpriteId
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
	ldr r1, _080BA730 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080BA734 @ =sub_8074F50
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA728: .4byte gBattleAnimArgs
_080BA72C: .4byte gSprites
_080BA730: .4byte move_anim_8074EE0
_080BA734: .4byte sub_8074F50
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
	bl sub_8075160
	b _080BA75C
	.align 2, 0
_080BA750: .4byte gBattleAnimArgs
_080BA754:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8075114
_080BA75C:
	ldr r0, _080BA774 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x6]
	strh r0, [r4, 0x2E]
	ldr r1, _080BA778 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080BA77C @ =sub_8074C44
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA774: .4byte gBattleAnimArgs
_080BA778: .4byte DestroyAnimSprite
_080BA77C: .4byte sub_8074C44
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
	bl sub_8075160
	b _080BA7AC
	.align 2, 0
_080BA7A0: .4byte gBattleAnimArgs
_080BA7A4:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8075114
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

	thumb_func_start sub_80BA7F8
sub_80BA7F8: @ 80BA7F8
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _080BA838 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r4, r1]
	bl sub_80B9A14
	adds r6, r0, 0
	ldrh r3, [r4]
	lsls r3, 16
	asrs r0, r3, 23
	movs r4, 0x1
	ands r0, r4
	asrs r1, r3, 24
	ands r1, r4
	asrs r2, r3, 25
	ands r2, r4
	asrs r3, 26
	ands r3, r4
	bl sub_8075CB8
	orrs r6, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_80BAA4C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BA838: .4byte gBattleAnimArgs
	thumb_func_end sub_80BA7F8

	thumb_func_start sub_80BA83C
sub_80BA83C: @ 80BA83C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1, 0x1]
	movs r0, 0x1
	bl sub_80B9A14
	adds r5, r0, 0
	ldr r0, _080BA868 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x7
	bhi _080BA8E6
	lsls r0, 2
	ldr r1, _080BA86C @ =_080BA870
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BA868: .4byte gBattleAnimArgs
_080BA86C: .4byte _080BA870
	.align 2, 0
_080BA870:
	.4byte _080BA892
	.4byte _080BA89E
	.4byte _080BA890
	.4byte _080BA89C
	.4byte _080BA8AC
	.4byte _080BA8C4
	.4byte _080BA8CC
	.4byte _080BA8D8
_080BA890:
	movs r5, 0
_080BA892:
	mov r0, sp
	ldr r1, _080BA898 @ =gBattleAnimAttacker
	b _080BA8A2
	.align 2, 0
_080BA898: .4byte gBattleAnimAttacker
_080BA89C:
	movs r5, 0
_080BA89E:
	mov r0, sp
	ldr r1, _080BA8A8 @ =gBattleAnimTarget
_080BA8A2:
	ldrb r1, [r1]
	strb r1, [r0]
	b _080BA8E6
	.align 2, 0
_080BA8A8: .4byte gBattleAnimTarget
_080BA8AC:
	mov r1, sp
	ldr r0, _080BA8BC @ =gBattleAnimAttacker
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080BA8C0 @ =gBattleAnimTarget
	ldrb r0, [r0]
	strb r0, [r1, 0x1]
	b _080BA8E6
	.align 2, 0
_080BA8BC: .4byte gBattleAnimAttacker
_080BA8C0: .4byte gBattleAnimTarget
_080BA8C4:
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1]
	b _080BA8E6
_080BA8CC:
	movs r5, 0
	mov r2, sp
	ldr r0, _080BA8D4 @ =gBattleAnimAttacker
	b _080BA8DE
	.align 2, 0
_080BA8D4: .4byte gBattleAnimAttacker
_080BA8D8:
	movs r5, 0
	mov r2, sp
	ldr r0, _080BA930 @ =gBattleAnimTarget
_080BA8DE:
	ldrb r0, [r0]
	movs r1, 0x2
	eors r0, r1
	strb r0, [r2]
_080BA8E6:
	movs r4, 0
	mov r6, sp
_080BA8EA:
	ldrb r0, [r6]
	cmp r4, r0
	beq _080BA914
	ldrb r0, [r6, 0x1]
	cmp r4, r0
	beq _080BA914
	adds r0, r4, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080BA914
	adds r0, r4, 0
	bl sub_8075D80
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r0
	orrs r5, r1
_080BA914:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080BA8EA
	adds r0, r7, 0
	adds r1, r5, 0
	bl sub_80BAA4C
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA930: .4byte gBattleAnimTarget
	thumb_func_end sub_80BA83C

	thumb_func_start sub_80BA934
sub_80BA934: @ 80BA934
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080BA958 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	bl sub_80B9A14
	adds r2, r0, 0
	ldr r0, _080BA95C @ =gUnknown_2022B50
	ldrb r0, [r0]
	cmp r0, 0x9
	bhi _080BAA0A
	lsls r0, 2
	ldr r1, _080BA960 @ =_080BA964
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BA958: .4byte gBattleAnimArgs
_080BA95C: .4byte gUnknown_2022B50
_080BA960: .4byte _080BA964
	.align 2, 0
_080BA964:
	.4byte _080BA98C
	.4byte _080BA99C
	.4byte _080BA9A8
	.4byte _080BA9B8
	.4byte _080BA9C4
	.4byte _080BA9D4
	.4byte _080BA9E4
	.4byte _080BA9F4
	.4byte _080BAA04
	.4byte _080BAA04
_080BA98C:
	ldr r1, _080BA994 @ =gBattleAnimArgs
	ldr r0, _080BA998 @ =0x00000b0c
	b _080BAA08
	.align 2, 0
_080BA994: .4byte gBattleAnimArgs
_080BA998: .4byte 0x00000b0c
_080BA99C:
	ldr r1, _080BA9A4 @ =gBattleAnimArgs
	movs r0, 0x9E
	lsls r0, 4
	b _080BAA08
	.align 2, 0
_080BA9A4: .4byte gBattleAnimArgs
_080BA9A8:
	ldr r1, _080BA9B0 @ =gBattleAnimArgs
	ldr r0, _080BA9B4 @ =0x00002f1e
	b _080BAA08
	.align 2, 0
_080BA9B0: .4byte gBattleAnimArgs
_080BA9B4: .4byte 0x00002f1e
_080BA9B8:
	ldr r1, _080BA9C0 @ =gBattleAnimArgs
	movs r0, 0x90
	lsls r0, 7
	b _080BAA08
	.align 2, 0
_080BA9C0: .4byte gBattleAnimArgs
_080BA9C4:
	ldr r1, _080BA9CC @ =gBattleAnimArgs
	ldr r0, _080BA9D0 @ =0x00007ecb
	b _080BAA08
	.align 2, 0
_080BA9CC: .4byte gBattleAnimArgs
_080BA9D0: .4byte 0x00007ecb
_080BA9D4:
	ldr r1, _080BA9DC @ =gBattleAnimArgs
	ldr r0, _080BA9E0 @ =0x00007ecb
	b _080BAA08
	.align 2, 0
_080BA9DC: .4byte gBattleAnimArgs
_080BA9E0: .4byte 0x00007ecb
_080BA9E4:
	ldr r1, _080BA9EC @ =gBattleAnimArgs
	ldr r0, _080BA9F0 @ =0x00002a16
	b _080BAA08
	.align 2, 0
_080BA9EC: .4byte gBattleAnimArgs
_080BA9F0: .4byte 0x00002a16
_080BA9F4:
	ldr r1, _080BA9FC @ =gBattleAnimArgs
	ldr r0, _080BAA00 @ =0x00000d2e
	b _080BAA08
	.align 2, 0
_080BA9FC: .4byte gBattleAnimArgs
_080BAA00: .4byte 0x00000d2e
_080BAA04:
	ldr r1, _080BAA18 @ =gBattleAnimArgs
	ldr r0, _080BAA1C @ =0x00007fff
_080BAA08:
	strh r0, [r1, 0x8]
_080BAA0A:
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80BAA4C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BAA18: .4byte gBattleAnimArgs
_080BAA1C: .4byte 0x00007fff
	thumb_func_end sub_80BA934

	thumb_func_start sub_80BAA20
sub_80BAA20: @ 80BAA20
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080BAA48 @ =gBattleAnimArgs
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r1, 0x1
	lsls r1, r0
	adds r0, r4, 0
	bl sub_80BAA4C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BAA48: .4byte gBattleAnimArgs
	thumb_func_end sub_80BAA20

	thumb_func_start sub_80BAA4C
sub_80BAA4C: @ 80BAA4C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080BAA84 @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	strh r1, [r2, 0x8]
	lsrs r1, 16
	strh r1, [r2, 0xA]
	ldr r3, _080BAA88 @ =gBattleAnimArgs
	ldrh r1, [r3, 0x2]
	strh r1, [r2, 0xC]
	ldrh r1, [r3, 0x4]
	strh r1, [r2, 0xE]
	ldrh r1, [r3, 0x6]
	strh r1, [r2, 0x10]
	ldrh r1, [r3, 0x8]
	strh r1, [r2, 0x12]
	ldrh r1, [r3, 0x4]
	strh r1, [r2, 0x1C]
	ldr r1, _080BAA8C @ =sub_80BAA90
	str r1, [r2]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080BAA84: .4byte gTasks
_080BAA88: .4byte gBattleAnimArgs
_080BAA8C: .4byte sub_80BAA90
	thumb_func_end sub_80BAA4C

	thumb_func_start sub_80BAA90
sub_80BAA90: @ 80BAA90
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	ldr r2, _080BAB10 @ =gTasks
	lsls r5, r7, 2
	adds r0, r5, r7
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x1A]
	mov r8, r0
	movs r4, 0x1A
	ldrsh r1, [r3, r4]
	movs r4, 0xC
	ldrsh r0, [r3, r4]
	mov r9, r2
	cmp r1, r0
	bne _080BAB26
	strh r6, [r3, 0x1A]
	movs r0, 0x8
	ldrsh r4, [r3, r0]
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	lsls r0, 16
	orrs r4, r0
	mov r8, r5
	cmp r4, 0
	beq _080BAAF2
	adds r5, r3, 0
_080BAAD0:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080BAAE4
	ldrb r2, [r5, 0x1C]
	ldrh r3, [r5, 0x12]
	adds r0, r6, 0
	movs r1, 0x10
	bl BlendPalette
_080BAAE4:
	adds r0, r6, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r6, r0, 16
	lsrs r4, 1
	cmp r4, 0
	bne _080BAAD0
_080BAAF2:
	mov r4, r8
	adds r0, r4, r7
	lsls r0, 3
	mov r1, r9
	adds r2, r0, r1
	ldrh r0, [r2, 0x1C]
	movs r4, 0x1C
	ldrsh r3, [r2, r4]
	movs r4, 0x10
	ldrsh r1, [r2, r4]
	cmp r3, r1
	bge _080BAB14
	adds r0, 0x1
	strh r0, [r2, 0x1C]
	b _080BAB2C
	.align 2, 0
_080BAB10: .4byte gTasks
_080BAB14:
	cmp r3, r1
	ble _080BAB1E
	subs r0, 0x1
	strh r0, [r2, 0x1C]
	b _080BAB2C
_080BAB1E:
	adds r0, r7, 0
	bl DestroyAnimVisualTask
	b _080BAB2C
_080BAB26:
	mov r0, r8
	adds r0, 0x1
	strh r0, [r3, 0x1A]
_080BAB2C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BAA90

	thumb_func_start sub_80BAB38
sub_80BAB38: @ 80BAB38
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _080BAB6C @ =gBattleAnimArgs
	ldrb r0, [r4]
	ldrb r1, [r4, 0x2]
	ldrb r2, [r4, 0x4]
	ldrb r3, [r4, 0x6]
	ldrb r4, [r4, 0x8]
	str r4, [sp]
	bl BeginHardwarePaletteFade
	ldr r1, _080BAB70 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BAB74 @ =sub_80BAB78
	str r1, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BAB6C: .4byte gBattleAnimArgs
_080BAB70: .4byte gTasks
_080BAB74: .4byte sub_80BAB78
	thumb_func_end sub_80BAB38

	thumb_func_start sub_80BAB78
sub_80BAB78: @ 80BAB78
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080BAB94 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080BAB90
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080BAB90:
	pop {r0}
	bx r0
	.align 2, 0
_080BAB94: .4byte gPaletteFade
	thumb_func_end sub_80BAB78

	thumb_func_start sub_80BAB98
sub_80BAB98: @ 80BAB98
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080BABC4 @ =gTasks
	adds r1, r0
	ldr r2, _080BABC8 @ =gBattleAnimArgs
	ldrh r0, [r2]
	movs r3, 0
	strh r0, [r1, 0x8]
	strh r3, [r1, 0xA]
	ldrh r0, [r2, 0x2]
	strh r0, [r1, 0xC]
	ldrh r0, [r2, 0x4]
	strh r0, [r1, 0xE]
	ldrh r0, [r2, 0x6]
	strh r0, [r1, 0x10]
	strh r3, [r1, 0x12]
	ldr r0, _080BABCC @ =sub_80BABD0
	str r0, [r1]
	bx lr
	.align 2, 0
_080BABC4: .4byte gTasks
_080BABC8: .4byte gBattleAnimArgs
_080BABCC: .4byte sub_80BABD0
	thumb_func_end sub_80BAB98

	thumb_func_start sub_80BABD0
sub_80BABD0: @ 80BABD0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r2, r5, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080BABFC @ =gTasks
	adds r4, r0, r1
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080BAC94
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080BAC00
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
	b _080BACA2
	.align 2, 0
_080BABFC: .4byte gTasks
_080BAC00:
	ldrb r0, [r4, 0x8]
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	blt _080BAC7E
	ldr r6, _080BAC8C @ =gSprites
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r3, r1, r6
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	movs r2, 0x2
	cmp r0, 0
	beq _080BAC28
	movs r2, 0x1
_080BAC28:
	lsls r2, 2
	ldrb r1, [r3, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, 0x5]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r4, 0xE]
	strh r1, [r0, 0x2E]
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r5, [r0, 0x30]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x5
	strh r1, [r0, 0x32]
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r6, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080BAC90 @ =sub_80BACA8
	str r1, [r0]
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
_080BAC7E:
	ldrh r0, [r4, 0x10]
	subs r0, 0x1
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0xC]
	strh r0, [r4, 0xA]
	b _080BACA2
	.align 2, 0
_080BAC8C: .4byte gSprites
_080BAC90: .4byte sub_80BACA8
_080BAC94:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080BACA2
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080BACA2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BABD0

	thumb_func_start sub_80BACA8
sub_80BACA8: @ 80BACA8
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080BACBC
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	b _080BACE0
_080BACBC:
	ldr r3, _080BACE8 @ =gTasks
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
	adds r0, r4, 0
	bl obj_delete_but_dont_free_vram
_080BACE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BACE8: .4byte gTasks
	thumb_func_end sub_80BACA8

	thumb_func_start sub_80BACEC
sub_80BACEC: @ 80BACEC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r7, 0
	ldr r0, _080BAE20 @ =gUnknown_2022984
	strh r7, [r0]
	ldr r0, _080BAE24 @ =gUnknown_2022986
	strh r7, [r0]
	ldr r1, _080BAE28 @ =0x00003f3f
	movs r0, 0x48
	bl SetGpuReg
	ldr r1, _080BAE2C @ =0x00003f3d
	movs r0, 0x4A
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 8
	movs r0, 0
	bl SetGpuRegBits
	ldr r1, _080BAE30 @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	ldr r1, _080BAE34 @ =0x00000c08
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0xA
	bl GetGpuReg
	add r4, sp, 0x10
	strh r0, [r4]
	ldrb r1, [r4]
	movs r0, 0x4
	negs r0, r0
	mov r8, r0
	ands r0, r1
	strb r0, [r4]
	mov r2, sp
	adds r2, 0x11
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2]
	ldrh r1, [r4]
	movs r0, 0xA
	bl SetGpuReg
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080BAD7A
	ldrb r1, [r4]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	ldrh r1, [r4]
	movs r0, 0xA
	bl SetGpuReg
_080BAD7A:
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _080BADFE
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080BADFE
	ldr r5, _080BAE38 @ =gBattleAnimAttacker
	ldrb r0, [r5]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080BADAA
	ldrb r0, [r5]
	bl GetBattlerPosition
	lsls r0, 24
	cmp r0, 0
	bne _080BADFE
_080BADAA:
	ldrb r0, [r5]
	movs r6, 0x2
	eors r0, r6
	bl sub_8072DF0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BADFE
	ldr r3, _080BAE3C @ =gSprites
	ldr r1, _080BAE40 @ =gUnknown_2023D44
	ldrb r0, [r5]
	eors r0, r6
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
	ldrb r1, [r4]
	mov r0, r8
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4]
	ldrh r1, [r4]
	movs r0, 0xA
	bl SetGpuReg
	movs r7, 0x1
_080BADFE:
	ldr r4, _080BAE38 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080BAE4C
	ldr r1, _080BAE44 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BAE48 @ =gEnemyParty
	b _080BAE5C
	.align 2, 0
_080BAE20: .4byte gUnknown_2022984
_080BAE24: .4byte gUnknown_2022986
_080BAE28: .4byte 0x00003f3f
_080BAE2C: .4byte 0x00003f3d
_080BAE30: .4byte 0x00003f42
_080BAE34: .4byte 0x00000c08
_080BAE38: .4byte gBattleAnimAttacker
_080BAE3C: .4byte gSprites
_080BAE40: .4byte gUnknown_2023D44
_080BAE44: .4byte gBattlerPartyIndexes
_080BAE48: .4byte gEnemyParty
_080BAE4C:
	ldr r1, _080BAF0C @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BAF10 @ =gPlayerParty
_080BAE5C:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r0, _080BAF14 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8076E34
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, sp
	bl sub_80752A0
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080BAF18 @ =gFile_graphics_battle_anims_masks_curse_tilemap
	bl sub_807543C
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080BAEAC
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80730C0
_080BAEAC:
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080BAF1C @ =gFile_graphics_battle_anims_masks_curse_sheet
	mov r2, sp
	ldrh r2, [r2, 0xA]
	bl sub_80753B4
	ldr r0, _080BAF20 @ =gUnknown_83E7CC8
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	adds r1, 0x1
	movs r2, 0x2
	bl LoadPalette
	ldr r2, _080BAF24 @ =gBattle_BG1_X
	ldr r0, _080BAF28 @ =gSprites
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x20]
	negs r0, r0
	adds r0, 0x20
	strh r0, [r2]
	ldr r2, _080BAF2C @ =gBattle_BG1_Y
	ldrh r0, [r1, 0x22]
	negs r0, r0
	adds r0, 0x20
	strh r0, [r2]
	ldr r1, _080BAF30 @ =gTasks
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x8]
	strh r7, [r0, 0x14]
	ldr r1, _080BAF34 @ =sub_80BAF38
	str r1, [r0]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BAF0C: .4byte gBattlerPartyIndexes
_080BAF10: .4byte gPlayerParty
_080BAF14: .4byte gBattleAnimAttacker
_080BAF18: .4byte gFile_graphics_battle_anims_masks_curse_tilemap
_080BAF1C: .4byte gFile_graphics_battle_anims_masks_curse_sheet
_080BAF20: .4byte gUnknown_83E7CC8
_080BAF24: .4byte gBattle_BG1_X
_080BAF28: .4byte gSprites
_080BAF2C: .4byte gBattle_BG1_Y
_080BAF30: .4byte gTasks
_080BAF34: .4byte sub_80BAF38
	thumb_func_end sub_80BACEC

	thumb_func_start sub_80BAF38
sub_80BAF38: @ 80BAF38
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r1, _080BB068 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0x1C]
	adds r0, 0x4
	movs r1, 0
	mov r8, r1
	strh r0, [r5, 0x1C]
	ldr r7, _080BB06C @ =gBattle_BG1_Y
	ldrh r2, [r7]
	subs r1, r2, 0x4
	strh r1, [r7]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x40
	bne _080BB05A
	mov r0, r8
	strh r0, [r5, 0x1C]
	adds r0, r2, 0
	adds r0, 0x3C
	strh r0, [r7]
	ldrh r0, [r5, 0x1E]
	adds r0, 0x1
	strh r0, [r5, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080BB05A
	movs r0, 0
	bl sub_8073128
	ldr r0, _080BB070 @ =gUnknown_2022984
	mov r1, r8
	strh r1, [r0]
	ldr r0, _080BB074 @ =gUnknown_2022986
	strh r1, [r0]
	ldr r4, _080BB078 @ =0x00003f3f
	movs r0, 0x48
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x4A
	adds r1, r4, 0
	bl SetGpuReg
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080BAFCA
	movs r0, 0xA
	bl GetGpuReg
	add r1, sp, 0x10
	strh r0, [r1]
	ldrb r2, [r1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldrh r1, [r1]
	movs r0, 0xA
	bl SetGpuReg
_080BAFCA:
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
	movs r0, 0
	bl GetAnimBankSpriteId
	ldr r4, _080BB07C @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	mov r0, sp
	bl sub_80752A0
	mov r0, sp
	ldrb r0, [r0, 0x9]
	bl sub_8075358
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080BB050
	ldr r2, _080BB080 @ =gUnknown_2023D44
	ldr r0, _080BB084 @ =gBattleAnimAttacker
	ldrb r1, [r0]
	movs r0, 0x2
	eors r0, r1
	adds r0, r2
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
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
_080BB050:
	mov r2, r8
	strh r2, [r7]
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080BB05A:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB068: .4byte gTasks
_080BB06C: .4byte gBattle_BG1_Y
_080BB070: .4byte gUnknown_2022984
_080BB074: .4byte gUnknown_2022986
_080BB078: .4byte 0x00003f3f
_080BB07C: .4byte gSprites
_080BB080: .4byte gUnknown_2023D44
_080BB084: .4byte gBattleAnimAttacker
	thumb_func_end sub_80BAF38

	thumb_func_start sub_80BB088
sub_80BB088: @ 80BB088
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080BB0C8 @ =gUnknown_20399B4
	movs r0, 0x18
	bl AllocZeroed
	str r0, [r4]
	movs r2, 0
	ldr r3, _080BB0CC @ =gBattleAnimArgs
_080BB09C:
	ldr r1, [r4]
	lsls r0, r2, 1
	adds r1, 0x4
	adds r1, r0
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _080BB09C
	ldr r0, _080BB0D0 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080BB0D4 @ =sub_80BB0D8
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BB0C8: .4byte gUnknown_20399B4
_080BB0CC: .4byte gBattleAnimArgs
_080BB0D0: .4byte gTasks
_080BB0D4: .4byte sub_80BB0D8
	thumb_func_end sub_80BB088

	thumb_func_start sub_80BB0D8
sub_80BB0D8: @ 80BB0D8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080BB0F0 @ =gUnknown_20399B4
	ldr r1, [r0]
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080BB0F8
	ldr r0, _080BB0F4 @ =gBattleAnimAttacker
	b _080BB0FA
	.align 2, 0
_080BB0F0: .4byte gUnknown_20399B4
_080BB0F4: .4byte gBattleAnimAttacker
_080BB0F8:
	ldr r0, _080BB230 @ =gBattleAnimTarget
_080BB0FA:
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r4, _080BB234 @ =gUnknown_20399B4
	ldr r2, [r4]
	ldrb r0, [r2]
	movs r1, 0x2
	eors r0, r1
	strb r0, [r2, 0x1]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080BB12A
	ldr r1, [r4]
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080BB130
	ldrb r0, [r1, 0x1]
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	bne _080BB130
_080BB12A:
	ldr r1, [r4]
	movs r0, 0
	strh r0, [r1, 0xA]
_080BB130:
	ldr r0, _080BB238 @ =gUnknown_2022984
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080BB23C @ =gUnknown_2022986
	strh r1, [r0]
	ldr r1, _080BB240 @ =0x00003f3f
	movs r0, 0x48
	bl SetGpuReg
	ldr r1, _080BB244 @ =0x00003f3d
	movs r0, 0x4A
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 8
	movs r0, 0
	bl SetGpuRegBits
	ldr r1, _080BB248 @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
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
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080BB18E
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0x1
	bl SetAnimBgAttribute
_080BB18E:
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _080BB20A
	ldr r4, _080BB234 @ =gUnknown_20399B4
	ldr r1, [r4]
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080BB20A
	ldrb r0, [r1]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080BB1C0
	ldr r0, [r4]
	ldrb r0, [r0]
	bl GetBattlerPosition
	lsls r0, 24
	cmp r0, 0
	bne _080BB20A
_080BB1C0:
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8072DF0
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bne _080BB20A
	ldr r3, _080BB24C @ =gSprites
	ldr r1, _080BB250 @ =gUnknown_2023D44
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
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
	ldr r0, [r4]
	strb r5, [r0, 0x2]
_080BB20A:
	ldr r4, _080BB234 @ =gUnknown_20399B4
	ldr r0, [r4]
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080BB25C
	ldr r1, _080BB254 @ =gBattlerPartyIndexes
	ldr r0, [r4]
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BB258 @ =gEnemyParty
	b _080BB26E
	.align 2, 0
_080BB230: .4byte gBattleAnimTarget
_080BB234: .4byte gUnknown_20399B4
_080BB238: .4byte gUnknown_2022984
_080BB23C: .4byte gUnknown_2022986
_080BB240: .4byte 0x00003f3f
_080BB244: .4byte 0x00003f3d
_080BB248: .4byte 0x00003f42
_080BB24C: .4byte gSprites
_080BB250: .4byte gUnknown_2023D44
_080BB254: .4byte gBattlerPartyIndexes
_080BB258: .4byte gEnemyParty
_080BB25C:
	ldr r1, _080BB290 @ =gBattlerPartyIndexes
	ldr r0, [r4]
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BB294 @ =gPlayerParty
_080BB26E:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	ldr r1, [r4]
	strh r0, [r1, 0x14]
	ldr r0, _080BB298 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _080BB29C @ =sub_80BB2A0
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB290: .4byte gBattlerPartyIndexes
_080BB294: .4byte gPlayerParty
_080BB298: .4byte gTasks
_080BB29C: .4byte sub_80BB2A0
	thumb_func_end sub_80BB0D8

	thumb_func_start sub_80BB2A0
sub_80BB2A0: @ 80BB2A0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0
	mov r8, r0
	ldr r6, _080BB300 @ =gUnknown_2023D44
	ldr r4, _080BB304 @ =gUnknown_20399B4
	ldr r2, [r4]
	ldrb r0, [r2]
	adds r1, r0, r6
	ldrb r1, [r1]
	ldrh r2, [r2, 0x14]
	bl sub_8076E34
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, [r4]
	movs r1, 0xA
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _080BB2E2
	ldrb r0, [r2, 0x1]
	adds r1, r0, r6
	ldrb r1, [r1]
	ldrh r2, [r2, 0x14]
	bl sub_8076E34
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
_080BB2E2:
	mov r0, sp
	bl sub_80752A0
	ldr r0, [r4]
	movs r4, 0x4
	ldrsh r0, [r0, r4]
	cmp r0, 0
	bne _080BB30C
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080BB308 @ =gFile_graphics_battle_anims_masks_stat_tilemap_1_tilemap
	bl sub_807543C
	b _080BB316
	.align 2, 0
_080BB300: .4byte gUnknown_2023D44
_080BB304: .4byte gUnknown_20399B4
_080BB308: .4byte gFile_graphics_battle_anims_masks_stat_tilemap_1_tilemap
_080BB30C:
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080BB354 @ =gFile_graphics_battle_anims_masks_stat_tilemap_2_tilemap
	bl sub_807543C
_080BB316:
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080BB32E
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80730C0
_080BB32E:
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080BB358 @ =gFile_graphics_battle_anims_masks_stat_sheet
	mov r2, sp
	ldrh r2, [r2, 0xA]
	bl sub_80753B4
	ldr r0, _080BB35C @ =gUnknown_20399B4
	ldr r0, [r0]
	movs r1, 0x6
	ldrsh r0, [r0, r1]
	cmp r0, 0x6
	bhi _080BB3C4
	lsls r0, 2
	ldr r1, _080BB360 @ =_080BB364
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BB354: .4byte gFile_graphics_battle_anims_masks_stat_tilemap_2_tilemap
_080BB358: .4byte gFile_graphics_battle_anims_masks_stat_sheet
_080BB35C: .4byte gUnknown_20399B4
_080BB360: .4byte _080BB364
	.align 2, 0
_080BB364:
	.4byte _080BB380
	.4byte _080BB388
	.4byte _080BB390
	.4byte _080BB398
	.4byte _080BB3A0
	.4byte _080BB3A8
	.4byte _080BB3B0
_080BB380:
	ldr r0, _080BB384 @ =gFile_graphics_battle_anims_masks_stat2_palette
	b _080BB3B2
	.align 2, 0
_080BB384: .4byte gFile_graphics_battle_anims_masks_stat2_palette
_080BB388:
	ldr r0, _080BB38C @ =gFile_graphics_battle_anims_masks_stat1_palette
	b _080BB3B2
	.align 2, 0
_080BB38C: .4byte gFile_graphics_battle_anims_masks_stat1_palette
_080BB390:
	ldr r0, _080BB394 @ =gFile_graphics_battle_anims_masks_stat3_palette
	b _080BB3B2
	.align 2, 0
_080BB394: .4byte gFile_graphics_battle_anims_masks_stat3_palette
_080BB398:
	ldr r0, _080BB39C @ =gFile_graphics_battle_anims_masks_stat4_palette
	b _080BB3B2
	.align 2, 0
_080BB39C: .4byte gFile_graphics_battle_anims_masks_stat4_palette
_080BB3A0:
	ldr r0, _080BB3A4 @ =gFile_graphics_battle_anims_masks_stat6_palette
	b _080BB3B2
	.align 2, 0
_080BB3A4: .4byte gFile_graphics_battle_anims_masks_stat6_palette
_080BB3A8:
	ldr r0, _080BB3AC @ =gFile_graphics_battle_anims_masks_stat7_palette
	b _080BB3B2
	.align 2, 0
_080BB3AC: .4byte gFile_graphics_battle_anims_masks_stat7_palette
_080BB3B0:
	ldr r0, _080BB3C0 @ =gFile_graphics_battle_anims_masks_stat8_palette
_080BB3B2:
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	b _080BB3D2
	.align 2, 0
_080BB3C0: .4byte gFile_graphics_battle_anims_masks_stat8_palette
_080BB3C4:
	ldr r0, _080BB3FC @ =gFile_graphics_battle_anims_masks_stat5_palette
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
_080BB3D2:
	ldr r3, _080BB400 @ =gBattle_BG1_X
	movs r2, 0
	strh r2, [r3]
	ldr r0, _080BB404 @ =gBattle_BG1_Y
	strh r2, [r0]
	ldr r1, _080BB408 @ =gUnknown_20399B4
	ldr r0, [r1]
	movs r4, 0x4
	ldrsh r0, [r0, r4]
	adds r4, r1, 0
	cmp r0, 0x1
	bne _080BB414
	movs r0, 0x40
	strh r0, [r3]
	ldr r2, _080BB40C @ =gTasks
	lsls r3, r5, 2
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r2
	ldr r1, _080BB410 @ =0x0000fffd
	b _080BB420
	.align 2, 0
_080BB3FC: .4byte gFile_graphics_battle_anims_masks_stat5_palette
_080BB400: .4byte gBattle_BG1_X
_080BB404: .4byte gBattle_BG1_Y
_080BB408: .4byte gUnknown_20399B4
_080BB40C: .4byte gTasks
_080BB410: .4byte 0x0000fffd
_080BB414:
	ldr r2, _080BB43C @ =gTasks
	lsls r3, r5, 2
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r2
	movs r1, 0x3
_080BB420:
	strh r1, [r0, 0xA]
	ldr r0, [r4]
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080BB440
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r2
	movs r1, 0xA
	strh r1, [r0, 0x10]
	movs r1, 0x14
	b _080BB44C
	.align 2, 0
_080BB43C: .4byte gTasks
_080BB440:
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r2
	movs r1, 0xD
	strh r1, [r0, 0x10]
	movs r1, 0x1E
_080BB44C:
	strh r1, [r0, 0x12]
	adds r1, r3, r5
	lsls r1, 3
	adds r1, r2
	strh r7, [r1, 0x8]
	ldr r3, [r4]
	ldrh r0, [r3, 0xA]
	strh r0, [r1, 0xC]
	mov r4, r8
	strh r4, [r1, 0xE]
	ldrb r0, [r3, 0x2]
	strh r0, [r1, 0x14]
	ldr r2, _080BB490 @ =gUnknown_2023D44
	ldrb r0, [r3, 0x1]
	adds r0, r2
	ldrb r0, [r0]
	strh r0, [r1, 0x16]
	ldr r0, _080BB494 @ =sub_80BB4B8
	str r0, [r1]
	movs r1, 0x4
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080BB498
	movs r0, 0x40
	negs r0, r0
	bl sub_8073B08
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xE8
	bl PlaySE12WithPanning
	b _080BB4AC
	.align 2, 0
_080BB490: .4byte gUnknown_2023D44
_080BB494: .4byte sub_80BB4B8
_080BB498:
	movs r0, 0x40
	negs r0, r0
	bl sub_8073B08
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xEE
	bl PlaySE12WithPanning
_080BB4AC:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB2A0

	thumb_func_start sub_80BB4B8
sub_80BB4B8: @ 80BB4B8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _080BB4E4 @ =gBattle_BG1_Y
	ldr r1, _080BB4E8 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0xA]
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
	movs r0, 0x26
	ldrsh r2, [r5, r0]
	cmp r2, 0x1
	beq _080BB52E
	cmp r2, 0x1
	bgt _080BB4EC
	cmp r2, 0
	beq _080BB4F6
	b _080BB644
	.align 2, 0
_080BB4E4: .4byte gBattle_BG1_Y
_080BB4E8: .4byte gTasks
_080BB4EC:
	cmp r2, 0x2
	beq _080BB544
	cmp r2, 0x3
	beq _080BB582
	b _080BB644
_080BB4F6:
	ldrh r0, [r5, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r5, 0x1E]
	lsls r0, 16
	cmp r0, 0
	bgt _080BB504
	b _080BB644
_080BB504:
	strh r2, [r5, 0x1E]
	ldrh r1, [r5, 0x20]
	adds r1, 0x1
	strh r1, [r5, 0x20]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	cmp r1, r0
	beq _080BB52C
	b _080BB644
_080BB52C:
	b _080BB57A
_080BB52E:
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	cmp r0, r1
	beq _080BB542
	b _080BB644
_080BB542:
	b _080BB57A
_080BB544:
	ldrh r0, [r5, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r5, 0x1E]
	lsls r0, 16
	cmp r0, 0
	ble _080BB644
	movs r0, 0
	strh r0, [r5, 0x1E]
	ldrh r1, [r5, 0x20]
	subs r1, 0x1
	strh r1, [r5, 0x20]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0x20
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080BB644
	movs r0, 0
	bl sub_8073128
_080BB57A:
	ldrh r0, [r5, 0x26]
	adds r0, 0x1
	strh r0, [r5, 0x26]
	b _080BB644
_080BB582:
	ldr r0, _080BB64C @ =gUnknown_2022984
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080BB650 @ =gUnknown_2022986
	strh r1, [r0]
	ldr r4, _080BB654 @ =0x00003f3f
	movs r0, 0x48
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x4A
	adds r1, r4, 0
	bl SetGpuReg
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080BB5B2
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0
	bl SetAnimBgAttribute
_080BB5B2:
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
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080BB658 @ =gSprites
	adds r0, r4
	bl DestroySprite
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080BB606
	movs r2, 0xE
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
_080BB606:
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080BB632
	movs r2, 0x16
	ldrsh r0, [r5, r2]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
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
_080BB632:
	ldr r4, _080BB65C @ =gUnknown_20399B4
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080BB644:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB64C: .4byte gUnknown_2022984
_080BB650: .4byte gUnknown_2022986
_080BB654: .4byte 0x00003f3f
_080BB658: .4byte gSprites
_080BB65C: .4byte gUnknown_20399B4
	thumb_func_end sub_80BB4B8

	thumb_func_start sub_80BB660
sub_80BB660: @ 80BB660
	push {r4-r6,lr}
	sub sp, 0xC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x1
	bl sub_8075CB8
	adds r6, r0, 0
	movs r1, 0
	bl sub_80BB790
	ldr r0, _080BB6C0 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	lsrs r0, r6, 16
	movs r5, 0
	strh r0, [r4, 0x24]
	str r5, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8075BE8
	adds r6, r0, 0
	ldr r1, _080BB6C4 @ =0x0000ffff
	ands r6, r1
	adds r0, r6, 0
	bl sub_80BB790
	strh r6, [r4, 0x26]
	strh r5, [r4, 0x8]
	strh r5, [r4, 0xA]
	ldr r0, _080BB6C8 @ =sub_80BB6CC
	str r0, [r4]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB6C0: .4byte gTasks
_080BB6C4: .4byte 0x0000ffff
_080BB6C8: .4byte sub_80BB6CC
	thumb_func_end sub_80BB660

	thumb_func_start sub_80BB6CC
sub_80BB6CC: @ 80BB6CC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080BB6F0 @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _080BB710
	cmp r1, 0x1
	bgt _080BB6F4
	cmp r1, 0
	beq _080BB6FA
	b _080BB78A
	.align 2, 0
_080BB6F0: .4byte gTasks
_080BB6F4:
	cmp r1, 0x2
	beq _080BB784
	b _080BB78A
_080BB6FA:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _080BB78A
	strh r1, [r4, 0xA]
	movs r0, 0x10
	strh r0, [r4, 0xC]
	b _080BB778
_080BB710:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080BB78A
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	movs r5, 0
	movs r6, 0x1
_080BB72C:
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	asrs r0, r5
	ands r0, r6
	cmp r0, 0
	beq _080BB746
	lsls r0, r5, 20
	lsrs r0, 16
	ldrb r2, [r4, 0xC]
	movs r1, 0x10
	ldr r3, _080BB780 @ =0x0000ffff
	bl BlendPalette
_080BB746:
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	asrs r0, r5
	ands r0, r6
	cmp r0, 0
	beq _080BB766
	lsls r0, r5, 20
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	ldrb r2, [r4, 0xC]
	movs r1, 0x10
	movs r3, 0
	bl BlendPalette
_080BB766:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xF
	bls _080BB72C
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080BB78A
_080BB778:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080BB78A
	.align 2, 0
_080BB780: .4byte 0x0000ffff
_080BB784:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080BB78A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB6CC

	thumb_func_start sub_80BB790
sub_80BB790: @ 80BB790
	push {r4-r6,lr}
	adds r3, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	movs r2, 0
_080BB79A:
	movs r0, 0x1
	ands r0, r3
	lsrs r4, r3, 1
	adds r5, r2, 0x1
	cmp r0, 0
	beq _080BB7C6
	lsls r0, r2, 20
	lsrs r2, r0, 16
	adds r0, r2, 0
	adds r0, 0x10
	cmp r2, r0
	bge _080BB7C6
	ldr r1, _080BB7D8 @ =gPlttBufferFaded
	adds r3, r0, 0
_080BB7B6:
	lsls r0, r2, 1
	adds r0, r1
	strh r6, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r3
	blt _080BB7B6
_080BB7C6:
	adds r3, r4, 0
	lsls r0, r5, 16
	lsrs r2, r0, 16
	cmp r2, 0x1F
	bls _080BB79A
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB7D8: .4byte gPlttBufferFaded
	thumb_func_end sub_80BB790

	thumb_func_start sub_80BB7DC
sub_80BB7DC: @ 80BB7DC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	movs r2, 0
	ldr r0, _080BB824 @ =gBattleAnimAttacker
	ldrb r3, [r0]
	movs r5, 0x1
_080BB7EC:
	cmp r3, r2
	beq _080BB7FA
	adds r1, r2, 0
	adds r1, 0x10
	adds r0, r5, 0
	lsls r0, r1
	orrs r4, r0
_080BB7FA:
	adds r2, 0x1
	cmp r2, 0x3
	bls _080BB7EC
	movs r2, 0x5
	ldr r0, _080BB828 @ =gBattleAnimArgs
	adds r1, r0, 0
	adds r1, 0x8
_080BB808:
	ldrh r0, [r1]
	strh r0, [r1, 0x2]
	subs r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bne _080BB808
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_80BAA4C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB824: .4byte gBattleAnimAttacker
_080BB828: .4byte gBattleAnimArgs
	thumb_func_end sub_80BB7DC

	thumb_func_start sub_80BB82C
sub_80BB82C: @ 80BB82C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0
	bl sub_8075458
	ldr r0, _080BB894 @ =sub_80BB8A4
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080BB898 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080BB868
	ldr r0, _080BB89C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080BB868
	ldrh r0, [r4]
	negs r0, r0
	strh r0, [r4]
	ldrh r0, [r4, 0x2]
	negs r0, r0
	strh r0, [r4, 0x2]
_080BB868:
	ldr r0, _080BB8A0 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r2, _080BB898 @ =gBattleAnimArgs
	ldrh r0, [r2]
	strh r0, [r1, 0xA]
	ldrh r0, [r2, 0x2]
	strh r0, [r1, 0xC]
	ldrh r0, [r2, 0x6]
	strh r0, [r1, 0xE]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	adds r0, r6, 0
	bl DestroyAnimVisualTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB894: .4byte sub_80BB8A4
_080BB898: .4byte gBattleAnimArgs
_080BB89C: .4byte gBattleAnimAttacker
_080BB8A0: .4byte gTasks
	thumb_func_end sub_80BB82C

	thumb_func_start sub_80BB8A4
sub_80BB8A4: @ 80BB8A4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080BB910 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r3, [r1, 0xA]
	ldrh r0, [r1, 0x1C]
	adds r3, r0
	movs r4, 0
	mov r12, r4
	strh r3, [r1, 0x1C]
	ldrh r2, [r1, 0xC]
	ldrh r7, [r1, 0x1E]
	adds r2, r7
	strh r2, [r1, 0x1E]
	ldr r6, _080BB914 @ =gBattle_BG3_X
	lsls r0, r3, 16
	asrs r0, 24
	ldrh r4, [r6]
	adds r0, r4
	strh r0, [r6]
	ldr r4, _080BB918 @ =gBattle_BG3_Y
	lsls r0, r2, 16
	asrs r0, 24
	ldrh r7, [r4]
	adds r0, r7
	strh r0, [r4]
	movs r0, 0xFF
	ands r3, r0
	strh r3, [r1, 0x1C]
	ands r2, r0
	strh r2, [r1, 0x1E]
	ldr r0, _080BB91C @ =gBattleAnimArgs
	movs r3, 0xE
	ldrsh r2, [r0, r3]
	movs r7, 0xE
	ldrsh r0, [r1, r7]
	cmp r2, r0
	bne _080BB90A
	mov r0, r12
	strh r0, [r6]
	strh r0, [r4]
	movs r0, 0x1
	bl sub_8075458
	adds r0, r5, 0
	bl DestroyTask
_080BB90A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB910: .4byte gTasks
_080BB914: .4byte gBattle_BG3_X
_080BB918: .4byte gBattle_BG3_Y
_080BB91C: .4byte gBattleAnimArgs
	thumb_func_end sub_80BB8A4

	thumb_func_start sub_80BB920
sub_80BB920: @ 80BB920
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080BB944 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	ldr r1, _080BB948 @ =gBattleAnimArgs
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0xE]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BB944: .4byte gBattleAnimAttacker
_080BB948: .4byte gBattleAnimArgs
	thumb_func_end sub_80BB920

	thumb_func_start sub_80BB94C
sub_80BB94C: @ 80BB94C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080BB970 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	ldr r1, _080BB974 @ =gBattleAnimArgs
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0xE]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BB970: .4byte gBattleAnimTarget
_080BB974: .4byte gBattleAnimArgs
	thumb_func_end sub_80BB94C

	thumb_func_start sub_80BB978
sub_80BB978: @ 80BB978
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r5, _080BB9A4 @ =gBattleAnimArgs
	movs r4, 0
	ldr r0, _080BB9A8 @ =gBattleAnimAttacker
	ldrb r2, [r0]
	movs r0, 0x2
	ldr r1, _080BB9AC @ =gBattleAnimTarget
	eors r0, r2
	ldrb r1, [r1]
	cmp r0, r1
	bne _080BB994
	movs r4, 0x1
_080BB994:
	strh r4, [r5, 0xE]
	adds r0, r3, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BB9A4: .4byte gBattleAnimArgs
_080BB9A8: .4byte gBattleAnimAttacker
_080BB9AC: .4byte gBattleAnimTarget
	thumb_func_end sub_80BB978

	thumb_func_start sub_80BB9B0
sub_80BB9B0: @ 80BB9B0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r6, _080BBA10 @ =gSprites
_080BB9BA:
	ldr r0, _080BBA14 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	cmp r4, r0
	beq _080BB9F8
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080BB9F8
	ldr r0, _080BBA18 @ =gUnknown_2023D44
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r6
	ldr r1, _080BBA1C @ =gBattleAnimArgs
	adds r2, 0x3E
	movs r0, 0x1
	ldrb r3, [r1]
	ands r3, r0
	lsls r3, 2
	ldrb r0, [r2]
	movs r7, 0x5
	negs r7, r7
	adds r1, r7, 0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
_080BB9F8:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _080BB9BA
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBA10: .4byte gSprites
_080BBA14: .4byte gBattleAnimAttacker
_080BBA18: .4byte gUnknown_2023D44
_080BBA1C: .4byte gBattleAnimArgs
	thumb_func_end sub_80BB9B0

	thumb_func_start sub_80BBA20
sub_80BBA20: @ 80BBA20
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	ldr r1, [sp, 0x44]
	ldr r4, [sp, 0x48]
	ldr r5, [sp, 0x4C]
	ldr r6, [sp, 0x50]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp, 0x14]
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x18]
	lsls r5, 24
	lsrs r5, 24
	str r5, [sp, 0x1C]
	lsls r6, 24
	lsrs r6, 24
	mov r10, r6
	movs r0, 0
	str r0, [sp, 0x20]
	movs r0, 0x2
	adds r6, r7, 0
	eors r6, r0
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080BBA82
	mov r1, r8
	cmp r1, 0
	beq _080BBA86
	adds r0, r6, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	bne _080BBA86
_080BBA82:
	movs r2, 0
	mov r8, r2
_080BBA86:
	ldr r0, _080BBB20 @ =gUnknown_2022984
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080BBB24 @ =gUnknown_2022986
	strh r1, [r0]
	ldr r1, _080BBB28 @ =0x00003f3f
	movs r0, 0x48
	bl SetGpuReg
	ldr r1, _080BBB2C @ =0x00003f3d
	movs r0, 0x4A
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 8
	movs r0, 0
	bl SetGpuRegBits
	ldr r1, _080BBB30 @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0xA
	bl GetGpuReg
	add r4, sp, 0x10
	strh r0, [r4]
	ldrb r1, [r4]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	mov r2, sp
	adds r2, 0x11
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r2]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r2]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080BBAFC
	ldrb r0, [r4]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4]
_080BBAFC:
	ldrh r1, [r4]
	movs r0, 0xA
	bl SetGpuReg
	adds r0, r7, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080BBB3C
	ldr r1, _080BBB34 @ =gBattlerPartyIndexes
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BBB38 @ =gEnemyParty
	b _080BBB4A
	.align 2, 0
_080BBB20: .4byte gUnknown_2022984
_080BBB24: .4byte gUnknown_2022986
_080BBB28: .4byte 0x00003f3f
_080BBB2C: .4byte 0x00003f3d
_080BBB30: .4byte 0x00003f42
_080BBB34: .4byte gBattlerPartyIndexes
_080BBB38: .4byte gEnemyParty
_080BBB3C:
	ldr r1, _080BBC10 @ =gBattlerPartyIndexes
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BBC14 @ =gPlayerParty
_080BBB4A:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r5, _080BBC18 @ =gUnknown_2023D44
	adds r0, r7, r5
	ldrb r1, [r0]
	adds r0, r7, 0
	adds r2, r4, 0
	bl sub_8076E34
	lsls r0, 24
	lsrs r7, r0, 24
	mov r0, r8
	cmp r0, 0
	beq _080BBB80
	adds r0, r6, r5
	ldrb r1, [r0]
	adds r0, r6, 0
	adds r2, r4, 0
	bl sub_8076E34
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x20]
_080BBB80:
	mov r0, sp
	bl sub_80752A0
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, [sp, 0x58]
	bl sub_807543C
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080BBBA8
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80730C0
_080BBBA8:
	mov r0, sp
	ldrb r0, [r0, 0x9]
	mov r1, sp
	ldrh r2, [r1, 0xA]
	ldr r1, [sp, 0x54]
	bl sub_80753B4
	mov r0, sp
	ldrb r1, [r0, 0x8]
	lsls r1, 4
	ldr r0, [sp, 0x5C]
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r0, _080BBC1C @ =gBattle_BG1_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080BBC20 @ =gBattle_BG1_Y
	strh r1, [r0]
	ldr r1, _080BBC24 @ =gTasks
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	mov r1, sp
	ldrh r1, [r1, 0x14]
	strh r1, [r0, 0xA]
	mov r2, sp
	ldrh r2, [r2, 0x18]
	strh r2, [r0, 0x10]
	mov r1, r10
	strh r1, [r0, 0x12]
	mov r2, sp
	ldrh r2, [r2, 0x1C]
	strh r2, [r0, 0x14]
	strh r7, [r0, 0x8]
	mov r1, r8
	strh r1, [r0, 0xC]
	mov r2, sp
	ldrh r2, [r2, 0x20]
	strh r2, [r0, 0xE]
	ldr r1, _080BBC28 @ =sub_80BBC2C
	str r1, [r0]
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBC10: .4byte gBattlerPartyIndexes
_080BBC14: .4byte gPlayerParty
_080BBC18: .4byte gUnknown_2023D44
_080BBC1C: .4byte gBattle_BG1_X
_080BBC20: .4byte gBattle_BG1_Y
_080BBC24: .4byte gTasks
_080BBC28: .4byte sub_80BBC2C
	thumb_func_end sub_80BBA20

	thumb_func_start sub_80BBC2C
sub_80BBC2C: @ 80BBC2C
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080BBC68 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r3, r0, r1
	movs r0, 0xA
	ldrsh r2, [r3, r0]
	adds r5, r1, 0
	cmp r2, 0
	bge _080BBC4A
	negs r2, r2
_080BBC4A:
	ldrh r0, [r3, 0x22]
	adds r4, r0, r2
	strh r4, [r3, 0x22]
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bge _080BBC70
	ldr r2, _080BBC6C @ =gBattle_BG1_Y
	lsls r1, r4, 16
	asrs r1, 24
	ldrh r0, [r2]
	subs r0, r1
	strh r0, [r2]
	b _080BBC7C
	.align 2, 0
_080BBC68: .4byte gTasks
_080BBC6C: .4byte gBattle_BG1_Y
_080BBC70:
	ldr r1, _080BBCA0 @ =gBattle_BG1_Y
	lsls r0, r4, 16
	asrs r0, 24
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
_080BBC7C:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r5
	ldrh r1, [r5, 0x22]
	movs r0, 0xFF
	ands r0, r1
	movs r2, 0
	strh r0, [r5, 0x22]
	movs r3, 0x26
	ldrsh r0, [r5, r3]
	cmp r0, 0x1
	beq _080BBCE6
	cmp r0, 0x1
	bgt _080BBCA4
	cmp r0, 0
	beq _080BBCAA
	b _080BBDD8
	.align 2, 0
_080BBCA0: .4byte gBattle_BG1_Y
_080BBCA4:
	cmp r0, 0x2
	beq _080BBD00
	b _080BBDD8
_080BBCAA:
	ldrh r0, [r5, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r5, 0x1E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x14
	ldrsh r1, [r5, r3]
	cmp r0, r1
	bge _080BBCBE
	b _080BBDD8
_080BBCBE:
	strh r2, [r5, 0x1E]
	ldrh r1, [r5, 0x20]
	adds r1, 0x1
	strh r1, [r5, 0x20]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0x20
	ldrsh r1, [r5, r0]
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _080BBDD8
	b _080BBCF8
_080BBCE6:
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x12
	ldrsh r1, [r5, r3]
	cmp r0, r1
	bne _080BBDD8
_080BBCF8:
	ldrh r0, [r5, 0x26]
	adds r0, 0x1
	strh r0, [r5, 0x26]
	b _080BBDD8
_080BBD00:
	ldrh r0, [r5, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r5, 0x1E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x14
	ldrsh r1, [r5, r3]
	cmp r0, r1
	blt _080BBDD8
	strh r2, [r5, 0x1E]
	ldrh r1, [r5, 0x20]
	subs r1, 0x1
	strh r1, [r5, 0x20]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0x20
	ldrsh r4, [r5, r0]
	cmp r4, 0
	bne _080BBDD8
	movs r0, 0
	bl sub_8073128
	ldr r0, _080BBDE0 @ =gUnknown_2022984
	strh r4, [r0]
	ldr r0, _080BBDE4 @ =gUnknown_2022986
	strh r4, [r0]
	ldr r4, _080BBDE8 @ =0x00003f3f
	movs r0, 0x48
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x4A
	adds r1, r4, 0
	bl SetGpuReg
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080BBD7E
	movs r0, 0xA
	bl GetGpuReg
	mov r1, sp
	strh r0, [r1]
	mov r2, sp
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	mov r0, sp
	ldrh r1, [r0]
	movs r0, 0xA
	bl SetGpuReg
_080BBD7E:
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
	movs r3, 0x8
	ldrsh r1, [r5, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080BBDEC @ =gSprites
	adds r0, r4
	bl DestroySprite
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080BBDD2
	movs r2, 0xE
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
_080BBDD2:
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080BBDD8:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BBDE0: .4byte gUnknown_2022984
_080BBDE4: .4byte gUnknown_2022986
_080BBDE8: .4byte 0x00003f3f
_080BBDEC: .4byte gSprites
	thumb_func_end sub_80BBC2C

	thumb_func_start sub_80BBDF0
sub_80BBDF0: @ 80BBDF0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BBE08 @ =gBattleAnimArgs
	ldr r1, _080BBE0C @ =gUnknown_2022B50
	ldrb r1, [r1]
	strh r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080BBE08: .4byte gBattleAnimArgs
_080BBE0C: .4byte gUnknown_2022B50
	thumb_func_end sub_80BBDF0

	thumb_func_start sub_80BBE10
sub_80BBE10: @ 80BBE10
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x80
	lsls r0, 6
	bl AllocZeroed
	ldr r1, _080BBE38 @ =gMonSpritesGfxPtr
	ldr r1, [r1]
	movs r2, 0xBE
	lsls r2, 1
	adds r1, r2
	str r0, [r1]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBE38: .4byte gMonSpritesGfxPtr
	thumb_func_end sub_80BBE10

	thumb_func_start sub_80BBE3C
sub_80BBE3C: @ 80BBE3C
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r6, _080BBE68 @ =gMonSpritesGfxPtr
	ldr r0, [r6]
	movs r5, 0xBE
	lsls r5, 1
	adds r0, r5
	ldr r0, [r0]
	bl Free
	ldr r0, [r6]
	adds r0, r5
	movs r1, 0
	str r1, [r0]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BBE68: .4byte gMonSpritesGfxPtr
	thumb_func_end sub_80BBE3C

	thumb_func_start sub_80BBE6C
sub_80BBE6C: @ 80BBE6C
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _080BBEAC @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080BBEB0
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8075BE8
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080BBEC8
	movs r2, 0x1
_080BBE9E:
	lsrs r1, 1
	adds r4, 0x1
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _080BBE9E
	b _080BBEC8
	.align 2, 0
_080BBEAC: .4byte gBattleAnimArgs
_080BBEB0:
	cmp r0, 0x1
	bne _080BBEBC
	ldr r0, _080BBEB8 @ =gBattleAnimAttacker
	b _080BBEC2
	.align 2, 0
_080BBEB8: .4byte gBattleAnimAttacker
_080BBEBC:
	cmp r0, 0x2
	bne _080BBEC8
	ldr r0, _080BBEF8 @ =gBattleAnimTarget
_080BBEC2:
	ldrb r0, [r0]
	adds r4, r0, 0
	adds r4, 0x10
_080BBEC8:
	ldr r0, _080BBEFC @ =gMonSpritesGfxPtr
	ldr r1, [r0]
	ldr r0, _080BBF00 @ =gBattleAnimArgs
	movs r2, 0x2
	ldrsh r0, [r0, r2]
	movs r2, 0xBE
	lsls r2, 1
	adds r1, r2
	ldr r1, [r1]
	lsls r0, 5
	adds r0, r1
	lsls r1, r4, 5
	ldr r2, _080BBF04 @ =gPlttBufferUnfaded
	adds r1, r2
	movs r2, 0x20
	bl memcpy
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BBEF8: .4byte gBattleAnimTarget
_080BBEFC: .4byte gMonSpritesGfxPtr
_080BBF00: .4byte gBattleAnimArgs
_080BBF04: .4byte gPlttBufferUnfaded
	thumb_func_end sub_80BBE6C

	thumb_func_start sub_80BBF08
sub_80BBF08: @ 80BBF08
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _080BBF48 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080BBF4C
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8075BE8
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080BBF64
	movs r2, 0x1
_080BBF3A:
	lsrs r1, 1
	adds r4, 0x1
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _080BBF3A
	b _080BBF64
	.align 2, 0
_080BBF48: .4byte gBattleAnimArgs
_080BBF4C:
	cmp r0, 0x1
	bne _080BBF58
	ldr r0, _080BBF54 @ =gBattleAnimAttacker
	b _080BBF5E
	.align 2, 0
_080BBF54: .4byte gBattleAnimAttacker
_080BBF58:
	cmp r0, 0x2
	bne _080BBF64
	ldr r0, _080BBF94 @ =gBattleAnimTarget
_080BBF5E:
	ldrb r0, [r0]
	adds r4, r0, 0
	adds r4, 0x10
_080BBF64:
	lsls r0, r4, 5
	ldr r1, _080BBF98 @ =gPlttBufferUnfaded
	adds r0, r1
	ldr r1, _080BBF9C @ =gMonSpritesGfxPtr
	ldr r2, [r1]
	ldr r1, _080BBFA0 @ =gBattleAnimArgs
	movs r3, 0x2
	ldrsh r1, [r1, r3]
	movs r3, 0xBE
	lsls r3, 1
	adds r2, r3
	ldr r2, [r2]
	lsls r1, 5
	adds r1, r2
	movs r2, 0x20
	bl memcpy
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BBF94: .4byte gBattleAnimTarget
_080BBF98: .4byte gPlttBufferUnfaded
_080BBF9C: .4byte gMonSpritesGfxPtr
_080BBFA0: .4byte gBattleAnimArgs
	thumb_func_end sub_80BBF08

	thumb_func_start sub_80BBFA4
sub_80BBFA4: @ 80BBFA4
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _080BBFE4 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080BBFE8
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8075BE8
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080BC000
	movs r2, 0x1
_080BBFD6:
	lsrs r1, 1
	adds r4, 0x1
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _080BBFD6
	b _080BC000
	.align 2, 0
_080BBFE4: .4byte gBattleAnimArgs
_080BBFE8:
	cmp r0, 0x1
	bne _080BBFF4
	ldr r0, _080BBFF0 @ =gBattleAnimAttacker
	b _080BBFFA
	.align 2, 0
_080BBFF0: .4byte gBattleAnimAttacker
_080BBFF4:
	cmp r0, 0x2
	bne _080BC000
	ldr r0, _080BC020 @ =gBattleAnimTarget
_080BBFFA:
	ldrb r0, [r0]
	adds r4, r0, 0
	adds r4, 0x10
_080BC000:
	lsls r1, r4, 5
	ldr r0, _080BC024 @ =gPlttBufferUnfaded
	adds r0, r1, r0
	ldr r2, _080BC028 @ =gPlttBufferFaded
	adds r1, r2
	movs r2, 0x20
	bl memcpy
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC020: .4byte gBattleAnimTarget
_080BC024: .4byte gPlttBufferUnfaded
_080BC028: .4byte gPlttBufferFaded
	thumb_func_end sub_80BBFA4

	thumb_func_start sub_80BC02C
sub_80BC02C: @ 80BC02C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8073788
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _080BC04C
	ldr r1, _080BC048 @ =gBattleAnimArgs
	movs r0, 0x1
	strh r0, [r1, 0xE]
	b _080BC050
	.align 2, 0
_080BC048: .4byte gBattleAnimArgs
_080BC04C:
	ldr r0, _080BC05C @ =gBattleAnimArgs
	strh r1, [r0, 0xE]
_080BC050:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC05C: .4byte gBattleAnimArgs
	thumb_func_end sub_80BC02C

	thumb_func_start sub_80BC060
sub_80BC060: @ 80BC060
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BC080 @ =gBattleAnimAttacker
	ldr r1, _080BC084 @ =gBattlerTarget
	ldrb r1, [r1]
	strb r1, [r2]
	ldr r2, _080BC088 @ =gBattleAnimTarget
	ldr r1, _080BC08C @ =gUnknown_2023D6E
	ldrb r1, [r1]
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080BC080: .4byte gBattleAnimAttacker
_080BC084: .4byte gBattlerTarget
_080BC088: .4byte gBattleAnimTarget
_080BC08C: .4byte gUnknown_2023D6E
	thumb_func_end sub_80BC060

	thumb_func_start sub_80BC090
sub_80BC090: @ 80BC090
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080BC0B8 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	adds r4, r0, 0
	ldr r0, _080BC0BC @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080BC0C4
	ldr r1, _080BC0C0 @ =gBattleAnimArgs
	movs r0, 0x1
	b _080BC0C8
	.align 2, 0
_080BC0B8: .4byte gBattleAnimAttacker
_080BC0BC: .4byte gBattleAnimTarget
_080BC0C0: .4byte gBattleAnimArgs
_080BC0C4:
	ldr r1, _080BC0D8 @ =gBattleAnimArgs
	movs r0, 0
_080BC0C8:
	strh r0, [r1, 0xE]
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC0D8: .4byte gBattleAnimArgs
	thumb_func_end sub_80BC090

	thumb_func_start sub_80BC0DC
sub_80BC0DC: @ 80BC0DC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BC0F4 @ =gBattleAnimTarget
	ldr r1, _080BC0F8 @ =gBattlerTarget
	ldrb r1, [r1]
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080BC0F4: .4byte gBattleAnimTarget
_080BC0F8: .4byte gBattlerTarget
	thumb_func_end sub_80BC0DC

	thumb_func_start sub_80BC0FC
sub_80BC0FC: @ 80BC0FC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BC11C @ =gBattleAnimAttacker
	ldr r1, _080BC120 @ =sBattler_AI
	ldrb r1, [r1]
	strb r1, [r2]
	ldr r2, _080BC124 @ =gBattleAnimTarget
	ldr r1, _080BC128 @ =gUnknown_2023D6E
	ldrb r1, [r1]
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080BC11C: .4byte gBattleAnimAttacker
_080BC120: .4byte sBattler_AI
_080BC124: .4byte gBattleAnimTarget
_080BC128: .4byte gUnknown_2023D6E
	thumb_func_end sub_80BC0FC

	thumb_func_start sub_80BC12C
sub_80BC12C: @ 80BC12C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080BC144
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _080BC180
_080BC144:
	ldr r0, _080BC188 @ =gTasks
	lsls r3, r4, 2
	adds r3, r4
	lsls r3, 3
	adds r3, r0
	ldr r0, _080BC18C @ =gUnknown_2024018
	ldr r4, [r0]
	ldr r2, _080BC190 @ =gBattleAnimAttacker
	ldrb r0, [r2]
	ldr r1, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	strh r0, [r3, 0x8]
	ldrb r1, [r2]
	ldr r0, [r4]
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _080BC194 @ =sub_80BC19C
	str r0, [r3]
	ldr r1, _080BC198 @ =gUnknown_2037EE2
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_080BC180:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC188: .4byte gTasks
_080BC18C: .4byte gUnknown_2024018
_080BC190: .4byte gBattleAnimAttacker
_080BC194: .4byte sub_80BC19C
_080BC198: .4byte gUnknown_2037EE2
	thumb_func_end sub_80BC12C

	thumb_func_start sub_80BC19C
sub_80BC19C: @ 80BC19C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080BC1E8 @ =gBattleAnimArgs
	movs r2, 0xE
	ldrsh r1, [r0, r2]
	movs r0, 0x80
	lsls r0, 5
	cmp r1, r0
	bne _080BC1E0
	ldr r0, _080BC1EC @ =gUnknown_2024018
	ldr r1, [r0]
	ldr r0, _080BC1F0 @ =gBattleAnimAttacker
	ldrb r3, [r0]
	ldr r0, [r1]
	lsls r3, 2
	adds r3, r0
	ldr r1, _080BC1F4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x8]
	movs r1, 0x1
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	adds r0, r4, 0
	bl DestroyTask
_080BC1E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC1E8: .4byte gBattleAnimArgs
_080BC1EC: .4byte gUnknown_2024018
_080BC1F0: .4byte gBattleAnimAttacker
_080BC1F4: .4byte gTasks
	thumb_func_end sub_80BC19C

	thumb_func_start SetAnimBgAttribute
SetAnimBgAttribute: @ 80BC1F8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r6, 0x3
	bls _080BC20C
	b _080BC2FE
_080BC20C:
	ldr r0, _080BC228 @ =gUnknown_83E7CCA
	adds r0, r6, r0
	ldrb r0, [r0]
	bl GetGpuReg
	ldr r1, _080BC22C @ =gUnknown_20399B8
	strh r0, [r1]
	cmp r5, 0x6
	bhi _080BC2F0
	lsls r0, r5, 2
	ldr r1, _080BC230 @ =_080BC234
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BC228: .4byte gUnknown_83E7CCA
_080BC22C: .4byte gUnknown_20399B8
_080BC230: .4byte _080BC234
	.align 2, 0
_080BC234:
	.4byte _080BC250
	.4byte _080BC264
	.4byte _080BC27C
	.4byte _080BC294
	.4byte _080BC2AC
	.4byte _080BC2C8
	.4byte _080BC2DC
_080BC250:
	ldr r2, _080BC260 @ =gUnknown_20399B8
	lsls r3, r4, 6
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, 0x1]
	b _080BC2F0
	.align 2, 0
_080BC260: .4byte gUnknown_20399B8
_080BC264:
	ldr r3, _080BC278 @ =gUnknown_20399B8
	movs r0, 0x1
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 5
	ldrb r2, [r3, 0x1]
	movs r0, 0x21
	negs r0, r0
	b _080BC2EA
	.align 2, 0
_080BC278: .4byte gUnknown_20399B8
_080BC27C:
	ldr r3, _080BC290 @ =gUnknown_20399B8
	movs r0, 0x1
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 6
	ldrb r2, [r3]
	movs r0, 0x41
	negs r0, r0
	b _080BC2BA
	.align 2, 0
_080BC290: .4byte gUnknown_20399B8
_080BC294:
	ldr r3, _080BC2A8 @ =gUnknown_20399B8
	movs r0, 0x3
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0xD
	negs r0, r0
	b _080BC2BA
	.align 2, 0
_080BC2A8: .4byte gUnknown_20399B8
_080BC2AC:
	ldr r3, _080BC2C4 @ =gUnknown_20399B8
	movs r0, 0x3
	adds r1, r4, 0
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x4
	negs r0, r0
_080BC2BA:
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _080BC2F0
	.align 2, 0
_080BC2C4: .4byte gUnknown_20399B8
_080BC2C8:
	ldr r2, _080BC2D8 @ =gUnknown_20399B8
	lsls r3, r4, 7
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	b _080BC2F0
	.align 2, 0
_080BC2D8: .4byte gUnknown_20399B8
_080BC2DC:
	ldr r3, _080BC304 @ =gUnknown_20399B8
	movs r0, 0x1F
	adds r1, r4, 0
	ands r1, r0
	ldrb r2, [r3, 0x1]
	movs r0, 0x20
	negs r0, r0
_080BC2EA:
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x1]
_080BC2F0:
	ldr r0, _080BC308 @ =gUnknown_83E7CCA
	adds r0, r6, r0
	ldrb r0, [r0]
	ldr r1, _080BC304 @ =gUnknown_20399B8
	ldrh r1, [r1]
	bl SetGpuReg
_080BC2FE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BC304: .4byte gUnknown_20399B8
_080BC308: .4byte gUnknown_83E7CCA
	thumb_func_end SetAnimBgAttribute

	thumb_func_start sub_80BC30C
sub_80BC30C: @ 80BC30C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r2, 0x3
	bhi _080BC394
	ldr r0, _080BC338 @ =gUnknown_83E7CCE
	adds r0, r2, r0
	ldrb r0, [r0]
	bl GetGpuReg
	mov r1, sp
	strh r0, [r1]
	cmp r4, 0x6
	bhi _080BC394
	lsls r0, r4, 2
	ldr r1, _080BC33C @ =_080BC340
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BC338: .4byte gUnknown_83E7CCE
_080BC33C: .4byte _080BC340
	.align 2, 0
_080BC340:
	.4byte _080BC35C
	.4byte _080BC364
	.4byte _080BC36C
	.4byte _080BC374
	.4byte _080BC37C
	.4byte _080BC384
	.4byte _080BC38C
_080BC35C:
	ldr r0, [sp]
	lsls r0, 16
	lsrs r0, 30
	b _080BC396
_080BC364:
	ldr r0, [sp]
	lsls r0, 18
	lsrs r0, 31
	b _080BC396
_080BC36C:
	ldr r0, [sp]
	lsls r0, 25
	lsrs r0, 31
	b _080BC396
_080BC374:
	ldr r0, [sp]
	lsls r0, 28
	lsrs r0, 30
	b _080BC396
_080BC37C:
	ldr r0, [sp]
	lsls r0, 30
	lsrs r0, 30
	b _080BC396
_080BC384:
	ldr r0, [sp]
	lsls r0, 24
	lsrs r0, 31
	b _080BC396
_080BC38C:
	ldr r0, [sp]
	lsls r0, 19
	lsrs r0, 27
	b _080BC396
_080BC394:
	movs r0, 0
_080BC396:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BC30C

	thumb_func_start sub_80BC3A0
sub_80BC3A0: @ 80BC3A0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080BC3B8 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BC3C0
	ldr r0, _080BC3BC @ =sub_80BCC4C
	b _080BC3E8
	.align 2, 0
_080BC3B8: .4byte gBattleTypeFlags
_080BC3BC: .4byte sub_80BCC4C
_080BC3C0:
	movs r0, 0x80
	lsls r0, 5
	ands r1, r0
	cmp r1, 0
	beq _080BC3E0
	ldr r0, _080BC3D8 @ =gGameVersion
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080BC3E0
	movs r4, 0x3
	ldr r0, _080BC3DC @ =task00_battle_intro_80BC6C8
	b _080BC3E8
	.align 2, 0
_080BC3D8: .4byte gGameVersion
_080BC3DC: .4byte task00_battle_intro_80BC6C8
_080BC3E0:
	ldr r1, _080BC414 @ =gUnknown_83E7CD4
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
_080BC3E8:
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080BC418 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r4, [r1, 0xA]
	strh r0, [r1, 0xC]
	strh r0, [r1, 0xE]
	strh r0, [r1, 0x10]
	strh r0, [r1, 0x12]
	strh r0, [r1, 0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC414: .4byte gUnknown_83E7CD4
_080BC418: .4byte gTasks
	thumb_func_end sub_80BC3A0

	thumb_func_start sub_80BC41C
sub_80BC41C: @ 80BC41C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	ldr r0, _080BC468 @ =gBattle_BG1_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080BC46C @ =gBattle_BG1_Y
	strh r1, [r0]
	ldr r0, _080BC470 @ =gBattle_BG2_X
	strh r1, [r0]
	ldr r0, _080BC474 @ =gBattle_BG2_Y
	strh r1, [r0]
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldr r4, _080BC478 @ =0x00003f3f
	movs r0, 0x48
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x4A
	adds r1, r4, 0
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC468: .4byte gBattle_BG1_X
_080BC46C: .4byte gBattle_BG1_Y
_080BC470: .4byte gBattle_BG2_X
_080BC474: .4byte gBattle_BG2_Y
_080BC478: .4byte 0x00003f3f
	thumb_func_end sub_80BC41C

	thumb_func_start task_battle_intro_80BC47C
task_battle_intro_80BC47C: @ 80BC47C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080BC4B4 @ =gBattle_BG1_X
	ldrh r0, [r1]
	adds r0, 0x6
	strh r0, [r1]
	ldr r1, _080BC4B8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	mov r8, r1
	cmp r0, 0x4
	bls _080BC4A8
	b _080BC6BA
_080BC4A8:
	lsls r0, 2
	ldr r1, _080BC4BC @ =_080BC4C0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BC4B4: .4byte gBattle_BG1_X
_080BC4B8: .4byte gTasks
_080BC4BC: .4byte _080BC4C0
	.align 2, 0
_080BC4C0:
	.4byte _080BC4D4
	.4byte _080BC504
	.4byte _080BC52C
	.4byte _080BC574
	.4byte _080BC6B4
_080BC4D4:
	ldr r0, _080BC4EC @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BC4F0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	add r0, r8
	movs r1, 0x10
	b _080BC4FA
	.align 2, 0
_080BC4EC: .4byte gBattleTypeFlags
_080BC4F0:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	add r0, r8
	movs r1, 0x1
_080BC4FA:
	strh r1, [r0, 0xC]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080BC6BA
_080BC504:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	mov r3, r8
	adds r1, r0, r3
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080BC51C
	b _080BC6BA
_080BC51C:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	b _080BC6BA
_080BC52C:
	ldr r1, _080BC568 @ =gUnknown_2022986
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080BC544
	b _080BC6BA
_080BC544:
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	add r1, r8
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	ldr r2, _080BC56C @ =gUnknown_2023F4C
	ldrh r1, [r2]
	ldr r0, _080BC570 @ =0x0000fffe
	ands r0, r1
	strh r0, [r2]
	b _080BC6BA
	.align 2, 0
_080BC568: .4byte gUnknown_2022986
_080BC56C: .4byte gUnknown_2023F4C
_080BC570: .4byte 0x0000fffe
_080BC574:
	lsls r0, r4, 2
	adds r1, r0, r4
	lsls r1, 3
	mov r5, r8
	adds r2, r1, r5
	ldrh r3, [r2, 0xE]
	movs r5, 0xE
	ldrsh r1, [r2, r5]
	mov r12, r0
	cmp r1, 0
	beq _080BC590
	subs r0, r3, 0x1
	strh r0, [r2, 0xE]
	b _080BC5BE
_080BC590:
	movs r1, 0xA
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	bne _080BC5B0
	ldr r2, _080BC5A8 @ =gBattle_BG1_Y
	ldrh r1, [r2]
	ldr r0, _080BC5AC @ =0x0000ffb0
	cmp r1, r0
	beq _080BC5BE
	subs r0, r1, 0x2
	b _080BC5BC
	.align 2, 0
_080BC5A8: .4byte gBattle_BG1_Y
_080BC5AC: .4byte 0x0000ffb0
_080BC5B0:
	ldr r2, _080BC690 @ =gBattle_BG1_Y
	ldrh r1, [r2]
	ldr r0, _080BC694 @ =0x0000ffc8
	cmp r1, r0
	beq _080BC5BE
	subs r0, r1, 0x1
_080BC5BC:
	strh r0, [r2]
_080BC5BE:
	ldr r2, _080BC698 @ =gUnknown_2022986
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080BC5D2
	ldr r3, _080BC69C @ =0xfffffc04
	adds r0, r1, r3
	strh r0, [r2]
_080BC5D2:
	mov r5, r12
	adds r0, r5, r4
	lsls r0, 3
	mov r2, r8
	adds r1, r0, r2
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080BC5EA
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080BC5EA:
	movs r3, 0
	ldr r5, _080BC6A0 @ =gScanlineEffect
	mov r9, r5
	ldr r7, _080BC6A4 @ =gScanlineEffectRegBuffers
	mov r6, r9
	adds r5, r1, 0
_080BC5F6:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r5, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080BC5F6
	cmp r3, 0x9F
	bgt _080BC63A
	ldr r7, _080BC6A4 @ =gScanlineEffectRegBuffers
	ldr r6, _080BC6A0 @ =gScanlineEffect
	ldr r1, _080BC6A8 @ =gTasks
	mov r2, r12
	adds r0, r2, r4
	lsls r0, 3
	adds r5, r0, r1
_080BC620:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r5, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080BC620
_080BC63A:
	mov r3, r12
	adds r0, r3, r4
	lsls r0, 3
	mov r5, r8
	adds r1, r0, r5
	movs r0, 0xC
	ldrsh r2, [r1, r0]
	cmp r2, 0
	bne _080BC6BA
	movs r0, 0x3
	mov r3, r9
	strb r0, [r3, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r2, [sp]
	ldr r1, _080BC6AC @ =0x0600e000
	ldr r2, _080BC6B0 @ =0x05000200
	mov r0, sp
	bl CpuSet
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r1, 0x9C
	lsls r1, 8
	movs r0, 0xA
	bl SetGpuReg
	movs r1, 0xBC
	lsls r1, 7
	movs r0, 0xC
	bl SetGpuReg
	b _080BC6BA
	.align 2, 0
_080BC690: .4byte gBattle_BG1_Y
_080BC694: .4byte 0x0000ffc8
_080BC698: .4byte gUnknown_2022986
_080BC69C: .4byte 0xfffffc04
_080BC6A0: .4byte gScanlineEffect
_080BC6A4: .4byte gScanlineEffectRegBuffers
_080BC6A8: .4byte gTasks
_080BC6AC: .4byte 0x0600e000
_080BC6B0: .4byte 0x05000200
_080BC6B4:
	adds r0, r4, 0
	bl sub_80BC41C
_080BC6BA:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end task_battle_intro_80BC47C

	thumb_func_start task00_battle_intro_80BC6C8
task00_battle_intro_80BC6C8: @ 80BC6C8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080BC6F4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0xA
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x3
	beq _080BC708
	cmp r0, 0x3
	bgt _080BC6F8
	cmp r0, 0x2
	beq _080BC6FC
	b _080BC710
	.align 2, 0
_080BC6F4: .4byte gTasks
_080BC6F8:
	cmp r0, 0x4
	bne _080BC710
_080BC6FC:
	ldr r1, _080BC704 @ =gBattle_BG1_X
	ldrh r0, [r1]
	adds r0, 0x8
	b _080BC70E
	.align 2, 0
_080BC704: .4byte gBattle_BG1_X
_080BC708:
	ldr r1, _080BC74C @ =gBattle_BG1_X
	ldrh r0, [r1]
	adds r0, 0x6
_080BC70E:
	strh r0, [r1]
_080BC710:
	lsls r0, r5, 2
	adds r1, r0, r5
	lsls r1, 3
	adds r4, r1, r2
	movs r3, 0xA
	ldrsh r1, [r4, r3]
	adds r6, r0, 0
	cmp r1, 0x4
	bne _080BC774
	ldr r7, _080BC750 @ =gBattle_BG1_Y
	ldrh r0, [r4, 0x14]
	bl Cos2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080BC736
	ldr r1, _080BC754 @ =0x000001ff
	adds r0, r1
_080BC736:
	asrs r0, 9
	subs r0, 0x8
	strh r0, [r7]
	ldrh r1, [r4, 0x14]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0xB3
	bgt _080BC758
	adds r0, r1, 0x4
	b _080BC75A
	.align 2, 0
_080BC74C: .4byte gBattle_BG1_X
_080BC750: .4byte gBattle_BG1_Y
_080BC754: .4byte 0x000001ff
_080BC758:
	adds r0, r1, 0x6
_080BC75A:
	strh r0, [r4, 0x14]
	ldr r2, _080BC790 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r3, r0, r2
	movs r0, 0x14
	ldrsh r1, [r3, r0]
	movs r0, 0xB4
	lsls r0, 1
	cmp r1, r0
	bne _080BC774
	movs r0, 0
	strh r0, [r3, 0x14]
_080BC774:
	adds r0, r6, r5
	lsls r0, 3
	adds r0, r2
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	bls _080BC784
	b _080BC9AA
_080BC784:
	lsls r0, 2
	ldr r1, _080BC794 @ =_080BC798
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BC790: .4byte gTasks
_080BC794: .4byte _080BC798
	.align 2, 0
_080BC798:
	.4byte _080BC7AC
	.4byte _080BC7DC
	.4byte _080BC808
	.4byte _080BC858
	.4byte _080BC9A4
_080BC7AC:
	ldr r1, _080BC7C8 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x10
	strh r3, [r2, 0x10]
	ldr r0, _080BC7CC @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BC7D0
	strh r3, [r2, 0xC]
	b _080BC7D4
	.align 2, 0
_080BC7C8: .4byte gTasks
_080BC7CC: .4byte gBattleTypeFlags
_080BC7D0:
	movs r0, 0x1
	strh r0, [r2, 0xC]
_080BC7D4:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080BC9AA
_080BC7DC:
	ldr r0, _080BC804 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080BC7F2
	b _080BC9AA
_080BC7F2:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	b _080BC9AA
	.align 2, 0
_080BC804: .4byte gTasks
_080BC808:
	ldr r1, _080BC848 @ =gUnknown_2022986
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080BC820
	b _080BC9AA
_080BC820:
	ldr r0, _080BC84C @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	movs r0, 0x1
	strh r0, [r1, 0x12]
	ldr r2, _080BC850 @ =gUnknown_2023F4C
	ldrh r1, [r2]
	ldr r0, _080BC854 @ =0x0000fffe
	ands r0, r1
	strh r0, [r2]
	b _080BC9AA
	.align 2, 0
_080BC848: .4byte gUnknown_2022986
_080BC84C: .4byte gTasks
_080BC850: .4byte gUnknown_2023F4C
_080BC854: .4byte 0x0000fffe
_080BC858:
	ldr r0, _080BC890 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xE]
	movs r3, 0xE
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080BC898
	subs r0, r2, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _080BC8B8
	ldr r1, _080BC894 @ =0x00001842
	movs r0, 0x50
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0xF
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	b _080BC8B8
	.align 2, 0
_080BC890: .4byte gTasks
_080BC894: .4byte 0x00001842
_080BC898:
	ldrh r2, [r1, 0x10]
	movs r0, 0x1F
	ands r0, r2
	cmp r0, 0
	beq _080BC8B8
	ldrh r0, [r1, 0x12]
	subs r0, 0x1
	strh r0, [r1, 0x12]
	lsls r0, 16
	cmp r0, 0
	bne _080BC8B8
	adds r0, r2, 0
	adds r0, 0xFF
	strh r0, [r1, 0x10]
	movs r0, 0x4
	strh r0, [r1, 0x12]
_080BC8B8:
	ldr r2, _080BC988 @ =gUnknown_2022986
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080BC8CC
	ldr r3, _080BC98C @ =0xfffffc04
	adds r0, r1, r3
	strh r0, [r2]
_080BC8CC:
	ldr r0, _080BC990 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080BC8E2
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080BC8E2:
	movs r3, 0
	ldr r0, _080BC994 @ =gScanlineEffect
	mov r8, r0
	ldr r2, _080BC998 @ =gScanlineEffectRegBuffers
	mov r12, r2
	mov r7, r8
	adds r4, r1, 0
_080BC8F0:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r12
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080BC8F0
	cmp r3, 0x9F
	bgt _080BC934
	ldr r0, _080BC998 @ =gScanlineEffectRegBuffers
	mov r12, r0
	ldr r7, _080BC994 @ =gScanlineEffect
	ldr r1, _080BC990 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r4, r0, r1
_080BC91A:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r12
	ldrh r0, [r4, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080BC91A
_080BC934:
	ldr r1, _080BC990 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0xC
	ldrsh r2, [r1, r3]
	cmp r2, 0
	bne _080BC9AA
	movs r0, 0x3
	mov r3, r8
	strb r0, [r3, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r2, [sp]
	ldr r1, _080BC99C @ =0x0600e000
	ldr r2, _080BC9A0 @ =0x05000200
	mov r0, sp
	bl CpuSet
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r1, 0x9C
	lsls r1, 8
	movs r0, 0xA
	bl SetGpuReg
	movs r1, 0xBC
	lsls r1, 7
	movs r0, 0xC
	bl SetGpuReg
	b _080BC9AA
	.align 2, 0
_080BC988: .4byte gUnknown_2022986
_080BC98C: .4byte 0xfffffc04
_080BC990: .4byte gTasks
_080BC994: .4byte gScanlineEffect
_080BC998: .4byte gScanlineEffectRegBuffers
_080BC99C: .4byte 0x0600e000
_080BC9A0: .4byte 0x05000200
_080BC9A4:
	adds r0, r5, 0
	bl sub_80BC41C
_080BC9AA:
	ldr r0, _080BC9D0 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0x4
	beq _080BC9C2
	ldrh r1, [r1, 0x10]
	movs r0, 0x52
	bl SetGpuReg
_080BC9C2:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BC9D0: .4byte gTasks
	thumb_func_end task00_battle_intro_80BC6C8

	thumb_func_start task_battle_intro_anim
task_battle_intro_anim: @ 80BC9D4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080BCA08 @ =gBattle_BG1_X
	ldrh r0, [r1]
	adds r0, 0x8
	strh r0, [r1]
	ldr r1, _080BCA0C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x4
	bls _080BC9FE
	b _080BCC22
_080BC9FE:
	lsls r0, 2
	ldr r1, _080BCA10 @ =_080BCA14
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BCA08: .4byte gBattle_BG1_X
_080BCA0C: .4byte gTasks
_080BCA10: .4byte _080BCA14
	.align 2, 0
_080BCA14:
	.4byte _080BCA28
	.4byte _080BCA7C
	.4byte _080BCAA8
	.4byte _080BCAF8
	.4byte _080BCC1C
_080BCA28:
	ldr r1, _080BCA60 @ =0x00001842
	movs r0, 0x50
	bl SetGpuReg
	ldr r4, _080BCA64 @ =0x00000808
	movs r0, 0x52
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldr r1, _080BCA68 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r2, r0, r1
	strh r4, [r2, 0x10]
	ldr r0, _080BCA6C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BCA70
	movs r0, 0x10
	b _080BCA72
	.align 2, 0
_080BCA60: .4byte 0x00001842
_080BCA64: .4byte 0x00000808
_080BCA68: .4byte gTasks
_080BCA6C: .4byte gBattleTypeFlags
_080BCA70:
	movs r0, 0x1
_080BCA72:
	strh r0, [r2, 0xC]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080BCC22
_080BCA7C:
	ldr r0, _080BCAA4 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080BCA94
	b _080BCC22
_080BCA94:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	b _080BCC22
	.align 2, 0
_080BCAA4: .4byte gTasks
_080BCAA8:
	ldr r1, _080BCAE8 @ =gUnknown_2022986
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080BCAC0
	b _080BCC22
_080BCAC0:
	ldr r0, _080BCAEC @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	movs r0, 0x1
	strh r0, [r1, 0x12]
	ldr r2, _080BCAF0 @ =gUnknown_2023F4C
	ldrh r1, [r2]
	ldr r0, _080BCAF4 @ =0x0000fffe
	ands r0, r1
	strh r0, [r2]
	b _080BCC22
	.align 2, 0
_080BCAE8: .4byte gUnknown_2022986
_080BCAEC: .4byte gTasks
_080BCAF0: .4byte gUnknown_2023F4C
_080BCAF4: .4byte 0x0000fffe
_080BCAF8:
	lsls r0, r5, 2
	adds r1, r0, r5
	lsls r1, 3
	adds r2, r1, r4
	ldrh r3, [r2, 0xE]
	movs r6, 0xE
	ldrsh r1, [r2, r6]
	mov r12, r0
	cmp r1, 0
	beq _080BCB12
	subs r0, r3, 0x1
	strh r0, [r2, 0xE]
	b _080BCB32
_080BCB12:
	ldrh r1, [r2, 0x10]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	beq _080BCB32
	ldrh r0, [r2, 0x12]
	subs r0, 0x1
	strh r0, [r2, 0x12]
	lsls r0, 16
	cmp r0, 0
	bne _080BCB32
	adds r0, r1, 0
	adds r0, 0xFF
	strh r0, [r2, 0x10]
	movs r0, 0x6
	strh r0, [r2, 0x12]
_080BCB32:
	ldr r2, _080BCC00 @ =gUnknown_2022986
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080BCB46
	ldr r3, _080BCC04 @ =0xfffffc04
	adds r0, r1, r3
	strh r0, [r2]
_080BCB46:
	mov r6, r12
	adds r0, r6, r5
	lsls r0, 3
	adds r1, r0, r4
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080BCB5C
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080BCB5C:
	movs r3, 0
	ldr r6, _080BCC08 @ =gScanlineEffect
	mov r8, r6
	ldr r7, _080BCC0C @ =gScanlineEffectRegBuffers
	adds r4, r1, 0
_080BCB66:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080BCB66
	cmp r3, 0x9F
	bgt _080BCBAA
	ldr r7, _080BCC0C @ =gScanlineEffectRegBuffers
	ldr r6, _080BCC08 @ =gScanlineEffect
	ldr r1, _080BCC10 @ =gTasks
	mov r2, r12
	adds r0, r2, r5
	lsls r0, 3
	adds r4, r0, r1
_080BCB90:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r4, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080BCB90
_080BCBAA:
	ldr r1, _080BCC10 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0xC
	ldrsh r2, [r1, r3]
	cmp r2, 0
	bne _080BCC22
	movs r0, 0x3
	mov r6, r8
	strb r0, [r6, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r2, [sp]
	ldr r1, _080BCC14 @ =0x0600e000
	ldr r2, _080BCC18 @ =0x05000200
	mov r0, sp
	bl CpuSet
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r1, 0x9C
	lsls r1, 8
	movs r0, 0xA
	bl SetGpuReg
	movs r1, 0xBC
	lsls r1, 7
	movs r0, 0xC
	bl SetGpuReg
	b _080BCC22
	.align 2, 0
_080BCC00: .4byte gUnknown_2022986
_080BCC04: .4byte 0xfffffc04
_080BCC08: .4byte gScanlineEffect
_080BCC0C: .4byte gScanlineEffectRegBuffers
_080BCC10: .4byte gTasks
_080BCC14: .4byte 0x0600e000
_080BCC18: .4byte 0x05000200
_080BCC1C:
	adds r0, r5, 0
	bl sub_80BC41C
_080BCC22:
	ldr r0, _080BCC48 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0x4
	beq _080BCC3C
	ldrh r1, [r1, 0x10]
	movs r0, 0x52
	bl SetGpuReg
_080BCC3C:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCC48: .4byte gTasks
	thumb_func_end task_battle_intro_anim

	thumb_func_start sub_80BCC4C
sub_80BCC4C: @ 80BCC4C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080BCC98 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r7, r0, r1
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	cmp r0, 0x1
	ble _080BCCC2
	movs r2, 0x10
	ldrsh r0, [r7, r2]
	cmp r0, 0
	bne _080BCCC2
	ldr r2, _080BCC9C @ =gBattle_BG1_X
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	bne _080BCC8A
	cmp r1, 0x4F
	bhi _080BCCA4
_080BCC8A:
	adds r0, r1, 0x3
	strh r0, [r2]
	ldr r1, _080BCCA0 @ =gBattle_BG2_X
	ldrh r0, [r1]
	subs r0, 0x3
	strh r0, [r1]
	b _080BCCC2
	.align 2, 0
_080BCC98: .4byte gTasks
_080BCC9C: .4byte gBattle_BG1_X
_080BCCA0: .4byte gBattle_BG2_X
_080BCCA4:
	str r5, [sp]
	ldr r1, _080BCCE4 @ =0x0600e000
	ldr r4, _080BCCE8 @ =0x05000200
	mov r0, sp
	adds r2, r4, 0
	bl CpuSet
	str r5, [sp, 0x4]
	add r0, sp, 0x4
	ldr r1, _080BCCEC @ =0x0600f000
	adds r2, r4, 0
	bl CpuSet
	movs r0, 0x1
	strh r0, [r7, 0x10]
_080BCCC2:
	ldr r0, _080BCCF0 @ =gTasks
	lsls r2, r6, 2
	adds r1, r2, r6
	lsls r1, 3
	adds r1, r0
	movs r3, 0x8
	ldrsh r1, [r1, r3]
	mov r9, r0
	adds r5, r2, 0
	cmp r1, 0x4
	bls _080BCCDA
	b _080BCEE6
_080BCCDA:
	lsls r0, r1, 2
	ldr r1, _080BCCF4 @ =_080BCCF8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BCCE4: .4byte 0x0600e000
_080BCCE8: .4byte 0x05000200
_080BCCEC: .4byte 0x0600f000
_080BCCF0: .4byte gTasks
_080BCCF4: .4byte _080BCCF8
	.align 2, 0
_080BCCF8:
	.4byte _080BCD0C
	.4byte _080BCD1E
	.4byte _080BCDC4
	.4byte _080BCE08
	.4byte _080BCEE0
_080BCD0C:
	adds r0, r5, r6
	lsls r0, 3
	add r0, r9
	movs r1, 0x20
	strh r1, [r0, 0xC]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080BCEE6
_080BCD1E:
	adds r0, r5, r6
	lsls r0, 3
	mov r2, r9
	adds r1, r0, r2
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080BCD34
	b _080BCEE6
_080BCD34:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r4, _080BCDB4 @ =gSprites
	ldr r5, _080BCDB8 @ =gBattleStruct
	ldr r0, [r5]
	adds r0, 0x7D
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r3, [r1, 0x1]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	movs r3, 0x8
	mov r9, r3
	mov r3, r9
	orrs r0, r3
	strb r0, [r1, 0x1]
	ldr r3, [r5]
	adds r0, r3, 0
	adds r0, 0x7D
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	movs r1, 0x1C
	adds r1, r4
	mov r8, r1
	add r0, r8
	ldr r6, _080BCDBC @ =sub_801182C
	str r6, [r0]
	adds r3, 0x7E
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x1]
	ands r2, r1
	mov r3, r9
	orrs r2, r3
	strb r2, [r0, 0x1]
	ldr r0, [r5]
	adds r0, 0x7E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	str r6, [r0]
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	ldr r1, _080BCDC0 @ =0x00003f06
	movs r0, 0x4A
	bl SetGpuReg
	b _080BCEE6
	.align 2, 0
_080BCDB4: .4byte gSprites
_080BCDB8: .4byte gBattleStruct
_080BCDBC: .4byte sub_801182C
_080BCDC0: .4byte 0x00003f06
_080BCDC4:
	ldr r1, _080BCDFC @ =gUnknown_2022986
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080BCDDC
	b _080BCEE6
_080BCDDC:
	adds r1, r5, r6
	lsls r1, 3
	add r1, r9
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	ldr r2, _080BCE00 @ =gUnknown_2023F4C
	ldrh r1, [r2]
	ldr r0, _080BCE04 @ =0x0000fffe
	ands r0, r1
	strh r0, [r2]
	b _080BCEE6
	.align 2, 0
_080BCDFC: .4byte gUnknown_2022986
_080BCE00: .4byte gUnknown_2023F4C
_080BCE04: .4byte 0x0000fffe
_080BCE08:
	ldr r2, _080BCECC @ =gUnknown_2022986
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080BCE1C
	ldr r3, _080BCED0 @ =0xfffffc04
	adds r0, r1, r3
	strh r0, [r2]
_080BCE1C:
	adds r0, r5, r6
	lsls r0, 3
	mov r2, r9
	adds r1, r0, r2
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080BCE32
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080BCE32:
	movs r3, 0
	ldr r0, _080BCED4 @ =gScanlineEffect
	mov r12, r0
	ldr r2, _080BCED8 @ =gScanlineEffectRegBuffers
	mov r8, r2
	mov r7, r12
	adds r4, r1, 0
_080BCE40:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r8
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080BCE40
	cmp r3, 0x9F
	bgt _080BCE84
	ldr r0, _080BCED8 @ =gScanlineEffectRegBuffers
	mov r8, r0
	ldr r7, _080BCED4 @ =gScanlineEffect
	ldr r1, _080BCEDC @ =gTasks
	adds r0, r5, r6
	lsls r0, 3
	adds r4, r0, r1
_080BCE6A:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r8
	ldrh r0, [r4, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080BCE6A
_080BCE84:
	adds r0, r5, r6
	lsls r0, 3
	mov r2, r9
	adds r1, r0, r2
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080BCEE6
	movs r0, 0x3
	mov r2, r12
	strb r0, [r2, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r1, 0x9C
	lsls r1, 8
	movs r0, 0xA
	bl SetGpuReg
	movs r1, 0xBC
	lsls r1, 7
	movs r0, 0xC
	bl SetGpuReg
	b _080BCEE6
	.align 2, 0
_080BCECC: .4byte gUnknown_2022986
_080BCED0: .4byte 0xfffffc04
_080BCED4: .4byte gScanlineEffect
_080BCED8: .4byte gScanlineEffectRegBuffers
_080BCEDC: .4byte gTasks
_080BCEE0:
	adds r0, r6, 0
	bl sub_80BC41C
_080BCEE6:
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BCC4C

	thumb_func_start sub_80BCEF4
sub_80BCEF4: @ 80BCEF4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	str r0, [sp]
	adds r6, r2, 0
	adds r4, r3, 0
	ldr r0, [sp, 0x24]
	ldr r7, [sp, 0x28]
	ldr r2, [sp, 0x2C]
	mov r9, r2
	ldr r5, [sp, 0x30]
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080BCFC4 @ =gMonSpritesGfxPtr
	ldr r2, [r1]
	lsls r4, 2
	adds r2, 0x4
	adds r2, r4
	ldr r1, _080BCFC8 @ =gBattleMonForms
	adds r0, r1
	ldrb r1, [r0]
	lsls r1, 11
	ldr r0, [r2]
	adds r0, r1
	movs r2, 0x80
	lsls r2, 3
	adds r1, r7, 0
	bl CpuSet
	ldr r1, [sp]
	lsls r0, r1, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 5
	adds r1, r7, 0
	adds r3, r5, 0
	bl LoadBgTiles
	adds r0, r6, 0
	adds r0, 0x8
	cmp r6, r0
	bge _080BCFA0
	mov r12, r0
	mov r2, r8
	lsls r7, r2, 1
_080BCF72:
	mov r1, r8
	adds r2, r1, 0
	adds r2, 0x8
	adds r4, r6, 0x1
	cmp r1, r2
	bge _080BCF9A
	mov r0, r10
	lsls r3, r0, 12
	lsls r0, r6, 6
	add r0, r9
	adds r6, r7, r0
	subs r1, r2, r1
_080BCF8A:
	adds r0, r5, 0
	orrs r0, r3
	strh r0, [r6]
	adds r5, 0x1
	adds r6, 0x2
	subs r1, 0x1
	cmp r1, 0
	bne _080BCF8A
_080BCF9A:
	adds r6, r4, 0
	cmp r6, r12
	blt _080BCF72
_080BCFA0:
	ldr r1, [sp]
	lsls r0, r1, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 4
	mov r1, r9
	movs r3, 0
	bl LoadBgTilemap
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCFC4: .4byte gMonSpritesGfxPtr
_080BCFC8: .4byte gBattleMonForms
	thumb_func_end sub_80BCEF4

	thumb_func_start sub_80BCFCC
sub_80BCFCC: @ 80BCFCC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r4, [sp, 0x24]
	ldr r5, [sp, 0x28]
	mov r8, r5
	ldr r5, [sp, 0x2C]
	ldr r6, [sp, 0x30]
	mov r9, r6
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r1, 24
	lsls r2, 24
	lsls r3, 24
	lsls r4, 24
	lsrs r4, 24
	mov r10, r4
	mov r7, r8
	lsls r7, 16
	lsrs r6, r7, 16
	lsls r5, 24
	lsrs r5, 24
	mov r0, r9
	lsls r0, 24
	mov r9, r0
	ldr r4, _080BD090 @ =0x040000d4
	ldr r0, _080BD094 @ =gMonSpritesGfxPtr
	ldr r0, [r0]
	lsrs r2, 22
	adds r0, 0x4
	adds r0, r2
	lsrs r3, 13
	ldr r0, [r0]
	adds r0, r3
	str r0, [r4]
	movs r0, 0xC0
	lsls r0, 19
	adds r6, r0
	str r6, [r4, 0x4]
	ldr r0, _080BD098 @ =0x80000400
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r2, r7, 0
	lsrs r2, 21
	mov r6, r9
	lsrs r6, 15
	subs r4, r2, r6
	lsrs r0, r1, 24
	adds r1, r0, 0
	adds r1, 0x8
	cmp r0, r1
	bge _080BD080
	mov r9, r1
	mov r7, r12
	lsls r7, 1
	mov r8, r7
	lsls r5, 11
	str r5, [sp]
_080BD048:
	mov r2, r12
	adds r3, r2, 0
	adds r3, 0x8
	adds r5, r0, 0x1
	cmp r2, r3
	bge _080BD07A
	mov r1, r10
	lsls r6, r1, 12
	lsls r0, 6
	movs r7, 0xC0
	lsls r7, 19
	adds r0, r7
	ldr r1, [sp]
	adds r0, r1, r0
	mov r7, r8
	adds r1, r7, r0
	subs r2, r3, r2
_080BD06A:
	adds r0, r4, 0
	orrs r0, r6
	strh r0, [r1]
	adds r4, 0x1
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bne _080BD06A
_080BD07A:
	adds r0, r5, 0
	cmp r0, r9
	blt _080BD048
_080BD080:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD090: .4byte 0x040000d4
_080BD094: .4byte gMonSpritesGfxPtr
_080BD098: .4byte 0x80000400
	thumb_func_end sub_80BCFCC

	.align 2, 0 @ Don't pad with nop.
