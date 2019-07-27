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
	bl IsContest
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
	bl IsContest
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
	bl IsContest
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
	bl IsContest
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
	bl IsContest
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
	bl IsContest
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
	bl IsContest
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
	bl IsContest
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
	bl IsContest
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
	bl IsContest
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
	bl IsBattlerSpriteVisible
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
	ldr r0, _080B077C @ =gAnimDisableStructPtr
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
_080B077C: .4byte gAnimDisableStructPtr
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
	ldr r1, _080B089C @ =gAnimDisableStructPtr
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
_080B089C: .4byte gAnimDisableStructPtr
	thumb_func_end sub_80B0870

	.align 2, 0 @ Don't pad with nop.
