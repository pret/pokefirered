	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80A22E8
sub_80A22E8: @ 80A22E8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080A231C @ =gBattleAnimArgs
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
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x30]
	ldr r0, _080A2320 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A2324
	ldrh r0, [r5, 0x8]
	negs r0, r0
	b _080A2326
	.align 2, 0
_080A231C: .4byte gBattleAnimArgs
_080A2320: .4byte gBattleAnimAttacker
_080A2324:
	ldrh r0, [r5, 0x8]
_080A2326:
	strh r0, [r4, 0x34]
	ldr r0, _080A2338 @ =gBattleAnimArgs
	ldrh r0, [r0, 0xA]
	strh r0, [r4, 0x36]
	ldr r0, _080A233C @ =sub_80A2340
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2338: .4byte gBattleAnimArgs
_080A233C: .4byte sub_80A2340
	thumb_func_end sub_80A22E8

	thumb_func_start sub_80A2340
sub_80A2340: @ 80A2340
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080A237C
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x32]
	lsls r0, r1, 16
	asrs r0, 24
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r1, r0
	strh r1, [r4, 0x32]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x38]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	b _080A2382
_080A237C:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A2382:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A2340

	thumb_func_start sub_80A2388
sub_80A2388: @ 80A2388
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _080A23C8 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldr r5, _080A23CC @ =gBattleAnimAttacker
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
	ldr r0, _080A23D0 @ =sub_8075590
	str r0, [r4, 0x1C]
	ldr r1, _080A23D4 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A23C8: .4byte gBattleAnimArgs
_080A23CC: .4byte gBattleAnimAttacker
_080A23D0: .4byte sub_8075590
_080A23D4: .4byte move_anim_8074EE0
	thumb_func_end sub_80A2388

	thumb_func_start sub_80A23D8
sub_80A23D8: @ 80A23D8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r5, _080A2420 @ =gBattleAnimArgs
	ldrb r1, [r5, 0x6]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	ldr r5, _080A2424 @ =gBattleAnimTarget
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
	ldr r0, _080A2428 @ =sub_8075590
	str r0, [r4, 0x1C]
	ldr r1, _080A242C @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2420: .4byte gBattleAnimArgs
_080A2424: .4byte gBattleAnimTarget
_080A2428: .4byte sub_8075590
_080A242C: .4byte DestroyAnimSprite
	thumb_func_end sub_80A23D8

	thumb_func_start sub_80A2430
sub_80A2430: @ 80A2430
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r6, _080A2480 @ =gBattleAnimArgs
	ldrh r0, [r6, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldr r5, _080A2484 @ =gBattleAnimTarget
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
	bl obj_translate_based_on_private_1_2_3_4
	ldrh r0, [r6, 0x6]
	strh r0, [r4, 0x38]
	ldr r1, _080A2488 @ =sub_80A248C
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A2480: .4byte gBattleAnimArgs
_080A2484: .4byte gBattleAnimTarget
_080A2488: .4byte sub_80A248C
	thumb_func_end sub_80A2430

	thumb_func_start sub_80A248C
sub_80A248C: @ 80A248C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	beq _080A24A2
	adds r0, r4, 0
	bl DestroySprite
	b _080A24F6
_080A24A2:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	ble _080A24BC
	ldr r0, _080A24B8 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl sub_807685C
	adds r0, 0x1
	b _080A24C6
	.align 2, 0
_080A24B8: .4byte gBattleAnimTarget
_080A24BC:
	ldr r0, _080A24FC @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl sub_807685C
	adds r0, 0x6
_080A24C6:
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x5
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xE
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	adds r0, 0xF
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
_080A24F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A24FC: .4byte gBattleAnimTarget
	thumb_func_end sub_80A248C

	thumb_func_start sub_80A2500
sub_80A2500: @ 80A2500
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r1, _080A2570 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0x8]
	subs r0, 0x1
	movs r2, 0
	strh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080A255A
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	movs r0, 0x6
	strh r0, [r5, 0x8]
	ldr r1, _080A2574 @ =gBattleAnimArgs
	movs r0, 0xF
	strh r0, [r1]
	strh r2, [r1, 0x2]
	movs r0, 0x50
	strh r0, [r1, 0x4]
	strh r2, [r1, 0x6]
	ldr r4, _080A2578 @ =gUnknown_83E2A88
	ldr r0, _080A257C @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl sub_807685C
	adds r3, r0, 0
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	bl CreateSpriteAndAnimate
_080A255A:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0xF
	bne _080A2568
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080A2568:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A2570: .4byte gTasks
_080A2574: .4byte gBattleAnimArgs
_080A2578: .4byte gUnknown_83E2A88
_080A257C: .4byte gBattleAnimTarget
	thumb_func_end sub_80A2500

	thumb_func_start sub_80A2580
sub_80A2580: @ 80A2580
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075114
	ldr r6, _080A25C4 @ =gBattleAnimArgs
	ldrh r0, [r6, 0x6]
	strh r0, [r4, 0x2E]
	ldr r5, _080A25C8 @ =gBattleAnimAttacker
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
	ldrh r0, [r6, 0x4]
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_8075068
	ldr r0, _080A25CC @ =sub_80A25D0
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A25C4: .4byte gBattleAnimArgs
_080A25C8: .4byte gBattleAnimAttacker
_080A25CC: .4byte sub_80A25D0
	thumb_func_end sub_80A2580

	thumb_func_start sub_80A25D0
sub_80A25D0: @ 80A25D0
	push {r4,lr}
	adds r4, r0, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080A25E4
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A25E4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A25D0

	thumb_func_start sub_80A25EC
sub_80A25EC: @ 80A25EC
	push {r4,r5,lr}
	adds r5, r0, 0
	bl Random
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x7
	ands r1, r0
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r4, _080A2634 @ =gBattleAnimAttacker
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
	beq _080A2638
	ldrh r0, [r5, 0x20]
	subs r0, 0x14
	b _080A263C
	.align 2, 0
_080A2634: .4byte gBattleAnimAttacker
_080A2638:
	ldrh r0, [r5, 0x20]
	adds r0, 0x14
_080A263C:
	strh r0, [r5, 0x20]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1F
	ands r0, r1
	adds r0, 0x40
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldr r4, _080A269C @ =gBattleAnimTarget
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
	bl sub_8075804
	bl Random
	movs r1, 0xFF
	ands r1, r0
	strh r1, [r5, 0x38]
	adds r0, r5, 0
	adds r0, 0x43
	ldrb r0, [r0]
	strh r0, [r5, 0x3A]
	ldr r1, _080A26A0 @ =sub_80A26A4
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A269C: .4byte gBattleAnimTarget
_080A26A0: .4byte sub_80A26A4
	thumb_func_end sub_80A25EC

	thumb_func_start sub_80A26A4
sub_80A26A4: @ 80A26A4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_807578C
	lsls r0, 24
	cmp r0, 0
	beq _080A26BA
	adds r0, r4, 0
	bl DestroyAnimSprite
	b _080A26EA
_080A26BA:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xC
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0x7E
	bgt _080A26D6
	ldrh r0, [r4, 0x3A]
	b _080A26DA
_080A26D6:
	ldrh r0, [r4, 0x3A]
	adds r0, 0x1
_080A26DA:
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrh r0, [r4, 0x38]
	adds r0, 0x18
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
_080A26EA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A26A4

	thumb_func_start sub_80A26F0
sub_80A26F0: @ 80A26F0
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _080A2750 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A2710
	ldr r1, _080A2754 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080A2710:
	ldr r4, _080A2754 @ =gBattleAnimArgs
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldr r5, _080A2758 @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrb r0, [r5]
	movs r1, 0x1
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
	ldr r0, _080A275C @ =sub_80A2760
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A2750: .4byte gBattleAnimAttacker
_080A2754: .4byte gBattleAnimArgs
_080A2758: .4byte gBattleAnimTarget
_080A275C: .4byte sub_80A2760
	thumb_func_end sub_80A26F0

	thumb_func_start sub_80A2760
sub_80A2760: @ 80A2760
	push {r4,lr}
	adds r4, r0, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080A278A
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	ldr r0, _080A2790 @ =sub_8074C44
	str r0, [r4, 0x1C]
	ldr r1, _080A2794 @ =sub_80A2798
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
_080A278A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2790: .4byte sub_8074C44
_080A2794: .4byte sub_80A2798
	thumb_func_end sub_80A2760

	thumb_func_start sub_80A2798
sub_80A2798: @ 80A2798
	push {r4,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	movs r0, 0x3C
	strh r0, [r4, 0x2E]
	ldr r0, _080A27C8 @ =sub_8074C44
	str r0, [r4, 0x1C]
	ldr r1, _080A27CC @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A27C8: .4byte sub_8074C44
_080A27CC: .4byte DestroyAnimSprite
	thumb_func_end sub_80A2798

	thumb_func_start sub_80A27D0
sub_80A27D0: @ 80A27D0
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075114
	ldr r5, _080A2814 @ =gBattleAnimArgs
	ldrb r1, [r5, 0x8]
	adds r0, r4, 0
	bl StartSpriteAnim
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080A27FA
	ldrb r0, [r4, 0x1]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4, 0x1]
_080A27FA:
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x30]
	ldr r1, _080A2818 @ =sub_80A281C
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2814: .4byte gBattleAnimArgs
_080A2818: .4byte sub_80A281C
	thumb_func_end sub_80A27D0

	thumb_func_start sub_80A281C
sub_80A281C: @ 80A281C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x20
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	negs r1, r1
	bl Cos
	ldrh r1, [r4, 0x32]
	adds r1, 0x18
	strh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7F
	bhi _080A2870
	ldr r0, _080A286C @ =gBattleAnimTarget
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
	b _080A2894
	.align 2, 0
_080A286C: .4byte gBattleAnimTarget
_080A2870:
	ldr r0, _080A28C0 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl sub_8076884
	adds r0, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080A2884
	movs r2, 0x3
_080A2884:
	movs r0, 0x3
	ands r2, r0
	lsls r2, 2
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
_080A2894:
	strb r0, [r4, 0x5]
	ldrh r0, [r4, 0x30]
	adds r0, 0x2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080A28B8
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A28B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A28C0: .4byte gBattleAnimTarget
	thumb_func_end sub_80A281C

	thumb_func_start sub_80A28C4
sub_80A28C4: @ 80A28C4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080A28DE
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	bne _080A28E6
_080A28DE:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _080A2918
_080A28E6:
	ldr r0, _080A2904 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A2908
	movs r0, 0x2
	movs r1, 0x4
	movs r2, 0x3
	bl SetAnimBgAttribute
	b _080A2912
	.align 2, 0
_080A2904: .4byte gBattleAnimTarget
_080A2908:
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x1
	bl SetAnimBgAttribute
_080A2912:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080A2918:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A28C4

	thumb_func_start sub_80A2920
sub_80A2920: @ 80A2920
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_8075160
	ldr r5, _080A2968 @ =gBattleAnimArgs
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldr r0, _080A296C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x4]
	adds r0, r5
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	movs r0, 0x40
	strh r0, [r4, 0x38]
	ldr r1, _080A2970 @ =sub_80A2974
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2968: .4byte gBattleAnimArgs
_080A296C: .4byte gBattleAnimAttacker
_080A2970: .4byte sub_80A2974
	thumb_func_end sub_80A2920

	thumb_func_start sub_80A2974
sub_80A2974: @ 80A2974
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	bne _080A29E0
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x20
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x5
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
	bhi _080A29C0
	ldr r0, _080A29BC @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_807685C
	subs r0, 0x1
	b _080A29CA
	.align 2, 0
_080A29BC: .4byte gBattleAnimAttacker
_080A29C0:
	ldr r0, _080A29DC @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_807685C
	adds r0, 0x1
_080A29CA:
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrh r0, [r4, 0x38]
	adds r0, 0x5
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	b _080A29E6
	.align 2, 0
_080A29DC: .4byte gBattleAnimAttacker
_080A29E0:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A29E6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A2974

	thumb_func_start sub_80A29EC
sub_80A29EC: @ 80A29EC
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r5, _080A2A34 @ =gBattleAnimArgs
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldr r0, _080A2A38 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x4]
	adds r0, r5
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	movs r0, 0x40
	strh r0, [r4, 0x38]
	ldr r1, _080A2A3C @ =sub_80A2A40
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2A34: .4byte gBattleAnimArgs
_080A2A38: .4byte gBattleAnimAttacker
_080A2A3C: .4byte sub_80A2A40
	thumb_func_end sub_80A29EC

	thumb_func_start sub_80A2A40
sub_80A2A40: @ 80A2A40
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	bne _080A2A98
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x8
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	ldrh r1, [r4, 0x38]
	adds r0, r1, 0
	subs r0, 0x3B
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bls _080A2A78
	adds r0, r1, 0
	subs r0, 0xBB
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bhi _080A2A8C
_080A2A78:
	ldrb r2, [r4, 0x3]
	lsls r1, r2, 26
	lsrs r1, 27
	movs r0, 0x8
	eors r1, r0
	lsls r1, 1
	subs r0, 0x47
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x3]
_080A2A8C:
	ldrh r0, [r4, 0x38]
	adds r0, 0x5
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	b _080A2A9E
_080A2A98:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A2A9E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A2A40

	thumb_func_start sub_80A2AA4
sub_80A2AA4: @ 80A2AA4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080A2AE0 @ =gBattleAnimAttacker
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
	ldr r1, _080A2AE4 @ =gBattleAnimArgs
	ldrh r0, [r1]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x32]
	ldr r0, _080A2AE8 @ =sub_80A2AEC
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2AE0: .4byte gBattleAnimAttacker
_080A2AE4: .4byte gBattleAnimArgs
_080A2AE8: .4byte sub_80A2AEC
	thumb_func_end sub_80A2AA4

	thumb_func_start sub_80A2AEC
sub_80A2AEC: @ 80A2AEC
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x32]
	movs r2, 0x32
	ldrsh r3, [r1, r2]
	cmp r3, 0
	bne _080A2B20
	ldrh r0, [r1, 0x30]
	movs r2, 0x1
	ands r2, r0
	cmp r2, 0
	beq _080A2B0E
	movs r0, 0x80
	strh r0, [r1, 0x2E]
	strh r3, [r1, 0x30]
	strh r3, [r1, 0x32]
	b _080A2B14
_080A2B0E:
	strh r2, [r1, 0x2E]
	strh r2, [r1, 0x30]
	strh r2, [r1, 0x32]
_080A2B14:
	ldr r0, _080A2B1C @ =sub_80A2B38
	str r0, [r1, 0x1C]
	b _080A2B34
	.align 2, 0
_080A2B1C: .4byte sub_80A2B38
_080A2B20:
	subs r0, 0x1
	strh r0, [r1, 0x32]
	ldrh r0, [r1, 0x2E]
	ldrh r2, [r1, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r1, 0x30]
	ldrh r2, [r1, 0x22]
	adds r0, r2
	strh r0, [r1, 0x22]
_080A2B34:
	pop {r0}
	bx r0
	thumb_func_end sub_80A2AEC

	thumb_func_start sub_80A2B38
sub_80A2B38: @ 80A2B38
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080A2B58 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A2B5C
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x19
	bl Sin
	negs r0, r0
	b _080A2B66
	.align 2, 0
_080A2B58: .4byte gBattleAnimAttacker
_080A2B5C:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x19
	bl Sin
_080A2B66:
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080A2B86
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
_080A2B86:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x50
	ble _080A2B94
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A2B94:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A2B38

	thumb_func_start sub_80A2B9C
sub_80A2B9C: @ 80A2B9C
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _080A2BF0 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A2BBC
	ldr r1, _080A2BF4 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080A2BBC:
	ldr r6, _080A2BF4 @ =gBattleAnimArgs
	ldrh r0, [r6, 0x8]
	strh r0, [r5, 0x2E]
	movs r1, 0xC
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080A2BFC
	ldr r4, _080A2BF8 @ =gBattleAnimTarget
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
	ldrh r6, [r6, 0x6]
	adds r0, r6
	b _080A2C1C
	.align 2, 0
_080A2BF0: .4byte gBattleAnimAttacker
_080A2BF4: .4byte gBattleAnimArgs
_080A2BF8: .4byte gBattleAnimTarget
_080A2BFC:
	ldr r0, _080A2C48 @ =gBattleAnimTarget
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x32
	adds r3, r5, 0
	adds r3, 0x36
	movs r1, 0x1
	bl sub_8076D9C
	ldrh r0, [r6, 0x4]
	ldrh r1, [r5, 0x32]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r6, 0x6]
	ldrh r1, [r5, 0x36]
	adds r0, r1
_080A2C1C:
	strh r0, [r5, 0x36]
	ldr r0, _080A2C4C @ =gBattleAnimArgs
	ldrh r0, [r0, 0xA]
	strh r0, [r5, 0x38]
	adds r0, r5, 0
	bl sub_8075068
	ldr r0, _080A2C50 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	adds r4, r0, 0
	ldr r0, _080A2C48 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080A2C54
	movs r0, 0x1
	b _080A2C56
	.align 2, 0
_080A2C48: .4byte gBattleAnimTarget
_080A2C4C: .4byte gBattleAnimArgs
_080A2C50: .4byte gBattleAnimAttacker
_080A2C54:
	movs r0, 0
_080A2C56:
	strh r0, [r5, 0x2E]
	ldr r0, _080A2C64 @ =sub_80A2C68
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A2C64: .4byte sub_80A2C68
	thumb_func_end sub_80A2B9C

	thumb_func_start sub_80A2C68
sub_80A2C68: @ 80A2C68
	push {r4-r7,lr}
	adds r6, r0, 0
	movs r7, 0
	ldrh r5, [r6, 0x2E]
	ldrh r4, [r6, 0x3C]
	movs r0, 0x1
	strh r0, [r6, 0x2E]
	adds r0, r6, 0
	bl AnimateBallThrow
	ldrh r0, [r6, 0x3C]
	strh r5, [r6, 0x2E]
	lsls r4, 16
	asrs r4, 16
	cmp r4, 0xC8
	ble _080A2C9A
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x37
	bgt _080A2C9A
	ldrh r0, [r6, 0x6]
	cmp r0, 0
	bne _080A2CA0
	adds r0, 0x1
	strh r0, [r6, 0x6]
_080A2C9A:
	ldrh r0, [r6, 0x6]
	cmp r0, 0
	beq _080A2CD2
_080A2CA0:
	movs r1, 0x2E
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _080A2CD2
	adds r3, r6, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r6, 0x6]
	adds r0, 0x1
	strh r0, [r6, 0x6]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1E
	bne _080A2CD2
	movs r7, 0x1
_080A2CD2:
	movs r2, 0x20
	ldrsh r0, [r6, r2]
	movs r2, 0x24
	ldrsh r1, [r6, r2]
	adds r0, r1
	adds r0, 0x10
	movs r1, 0x88
	lsls r1, 1
	cmp r0, r1
	bhi _080A2CFC
	movs r0, 0x22
	ldrsh r1, [r6, r0]
	movs r2, 0x26
	ldrsh r0, [r6, r2]
	adds r1, r0
	cmp r1, 0xA0
	bgt _080A2CFC
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _080A2CFE
_080A2CFC:
	movs r7, 0x1
_080A2CFE:
	cmp r7, 0
	beq _080A2D08
	adds r0, r6, 0
	bl DestroyAnimSprite
_080A2D08:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A2C68

	thumb_func_start sub_80A2D10
sub_80A2D10: @ 80A2D10
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080A2D3C
	bl sub_8075290
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A2D3C
	ldr r0, _080A2D64 @ =gBattleAnimTarget
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0x1
	bl sub_8076D9C
_080A2D3C:
	ldrh r0, [r4, 0x22]
	adds r0, 0x20
	strh r0, [r4, 0x22]
	ldr r1, _080A2D68 @ =gBattleAnimArgs
	ldrh r0, [r1]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x32]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x34]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x36]
	ldr r0, _080A2D6C @ =sub_80A2D70
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2D64: .4byte gBattleAnimTarget
_080A2D68: .4byte gBattleAnimArgs
_080A2D6C: .4byte sub_80A2D70
	thumb_func_end sub_80A2D10

	thumb_func_start sub_80A2D70
sub_80A2D70: @ 80A2D70
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0xFF
	bne _080A2D86
	ldrh r0, [r4, 0x22]
	subs r0, 0x2
	strh r0, [r4, 0x22]
	b _080A2D94
_080A2D86:
	cmp r0, 0
	ble _080A2D94
	ldrh r0, [r4, 0x22]
	subs r0, 0x2
	strh r0, [r4, 0x22]
	subs r0, r1, 0x2
	strh r0, [r4, 0x30]
_080A2D94:
	ldrh r3, [r4, 0x32]
	ldrh r5, [r4, 0x38]
	adds r2, r3, r5
	strh r2, [r4, 0x38]
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r5, 0x36
	ldrsh r0, [r4, r5]
	cmp r1, r0
	bge _080A2DAC
	adds r0, r2, r3
	strh r0, [r4, 0x38]
_080A2DAC:
	ldrh r1, [r4, 0x38]
	movs r0, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	movs r5, 0x38
	ldrsh r0, [r4, r5]
	movs r1, 0x5
	bl Sin
	strh r0, [r4, 0x26]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	bgt _080A2DEC
	ldr r0, _080A2DE8 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl sub_8076884
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	b _080A2DFA
	.align 2, 0
_080A2DE8: .4byte gBattleAnimTarget
_080A2DEC:
	ldr r0, _080A2E24 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl sub_8076884
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
_080A2DFA:
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _080A2E1E
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A2E1E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2E24: .4byte gBattleAnimTarget
	thumb_func_end sub_80A2D70

	thumb_func_start sub_80A2E28
sub_80A2E28: @ 80A2E28
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0
	bl sub_8075114
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r4, _080A2E5C @ =gBattleAnimArgs
	ldrb r1, [r4, 0x4]
	adds r0, r5, 0
	bl StartSpriteAffineAnim
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x3A]
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x3C]
	ldr r0, _080A2E60 @ =sub_80A2E64
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2E5C: .4byte gBattleAnimArgs
_080A2E60: .4byte sub_80A2E64
	thumb_func_end sub_80A2E28

	thumb_func_start sub_80A2E64
sub_80A2E64: @ 80A2E64
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080A2E94 @ =gBattleAnimArgs
	ldrh r1, [r0, 0xE]
	ldr r0, _080A2E98 @ =0x0000ffff
	cmp r1, r0
	bne _080A2E8E
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x1
	bl GetAnimBankSpriteId
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0x2E]
	ldr r0, _080A2E9C @ =sub_80A2EA0
	str r0, [r4, 0x1C]
_080A2E8E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2E94: .4byte gBattleAnimArgs
_080A2E98: .4byte 0x0000ffff
_080A2E9C: .4byte sub_80A2EA0
	thumb_func_end sub_80A2E64

	thumb_func_start sub_80A2EA0
sub_80A2EA0: @ 80A2EA0
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	bl GetAnimBankSpriteId
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080A2EB8
	ldrh r0, [r4, 0x2E]
	adds r0, 0xB
	b _080A2EBC
_080A2EB8:
	ldrh r0, [r4, 0x2E]
	subs r0, 0xB
_080A2EBC:
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _080A2ED8
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x32]
_080A2ED8:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080A2F06
	ldrh r0, [r4, 0x3C]
	subs r0, 0x1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	cmp r0, 0
	ble _080A2F00
	ldrh r1, [r4, 0x3A]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	b _080A2F06
_080A2F00:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A2F06:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A2EA0

	thumb_func_start sub_80A2F0C
sub_80A2F0C: @ 80A2F0C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080A2F38 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _080A2F3C
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _080A2F62
	.align 2, 0
_080A2F38: .4byte gSprites
_080A2F3C:
	adds r0, r2, 0
	movs r1, 0x1
	bl sub_80758E0
	ldr r1, _080A2F68 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r2, _080A2F6C @ =gBattleAnimArgs
	ldrh r1, [r2]
	strh r1, [r0, 0x8]
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0xA]
	movs r1, 0x80
	lsls r1, 1
	strh r1, [r0, 0x1E]
	ldr r1, _080A2F70 @ =sub_80A2F74
	str r1, [r0]
_080A2F62:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2F68: .4byte gTasks
_080A2F6C: .4byte gBattleAnimArgs
_080A2F70: .4byte sub_80A2F74
	thumb_func_end sub_80A2F0C

	thumb_func_start sub_80A2F74
sub_80A2F74: @ 80A2F74
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r1, _080A2FF4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0x8]
	ldrh r0, [r4, 0x1C]
	adds r1, r0
	strh r1, [r4, 0x1C]
	ldr r2, _080A2FF8 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r5, r0, r2
	lsls r1, 16
	asrs r1, 24
	strh r1, [r5, 0x24]
	ldr r0, _080A2FFC @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A2FBE
	ldrh r0, [r5, 0x24]
	negs r0, r0
	strh r0, [r5, 0x24]
_080A2FBE:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x10
	strh r0, [r4, 0x1E]
	movs r0, 0x1E
	ldrsh r2, [r4, r0]
	adds r0, r6, 0
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	adds r0, r6, 0
	bl sub_8076440
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bne _080A2FEC
	strh r0, [r4, 0x8]
	ldr r0, _080A3000 @ =sub_80A3004
	str r0, [r4]
_080A2FEC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A2FF4: .4byte gTasks
_080A2FF8: .4byte gSprites
_080A2FFC: .4byte gBattleAnimTarget
_080A3000: .4byte sub_80A3004
	thumb_func_end sub_80A2F74

	thumb_func_start sub_80A3004
sub_80A3004: @ 80A3004
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _080A3050 @ =gBattleAnimArgs
	ldrh r1, [r0, 0xE]
	ldr r0, _080A3054 @ =0x0000ffff
	cmp r1, r0
	bne _080A3060
	ldr r0, _080A3058 @ =gTasks
	lsls r2, r3, 2
	adds r1, r2, r3
	lsls r1, 3
	adds r6, r1, r0
	movs r1, 0x8
	ldrsh r5, [r6, r1]
	adds r4, r0, 0
	cmp r5, 0
	bne _080A3074
	movs r0, 0x1
	bl GetAnimBankSpriteId
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8075980
	ldr r1, _080A305C @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	strh r5, [r0, 0x24]
	strh r5, [r0, 0x26]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	b _080A308E
	.align 2, 0
_080A3050: .4byte gBattleAnimArgs
_080A3054: .4byte 0x0000ffff
_080A3058: .4byte gTasks
_080A305C: .4byte gSprites
_080A3060:
	ldr r1, _080A3094 @ =gTasks
	lsls r2, r3, 2
	adds r0, r2, r3
	lsls r0, 3
	adds r0, r1
	movs r4, 0x8
	ldrsh r0, [r0, r4]
	adds r4, r1, 0
	cmp r0, 0
	beq _080A308E
_080A3074:
	adds r1, r2, r3
	lsls r1, 3
	adds r1, r4
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080A308E
	adds r0, r3, 0
	bl DestroyAnimVisualTask
_080A308E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A3094: .4byte gTasks
	thumb_func_end sub_80A3004

	thumb_func_start sub_80A3098
sub_80A3098: @ 80A3098
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080A30AA
	cmp r0, 0x1
	beq _080A3104
	b _080A3156
_080A30AA:
	ldr r6, _080A30FC @ =gBattleAnimTarget
	ldrb r0, [r6]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080A30C2
	ldr r1, _080A3100 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1]
_080A30C2:
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	ldr r4, _080A3100 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrb r0, [r6]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x2]
	adds r0, r4
	strh r0, [r5, 0x22]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080A3156
	.align 2, 0
_080A30FC: .4byte gBattleAnimTarget
_080A3100: .4byte gBattleAnimArgs
_080A3104:
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080A3156
	adds r0, r5, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
	movs r0, 0x19
	strh r0, [r5, 0x2E]
	ldr r4, _080A315C @ =gBattleAnimAttacker
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
	ldr r0, _080A3160 @ =sub_8075764
	str r0, [r5, 0x1C]
	ldr r1, _080A3164 @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
_080A3156:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A315C: .4byte gBattleAnimAttacker
_080A3160: .4byte sub_8075764
_080A3164: .4byte DestroyAnimSprite
	thumb_func_end sub_80A3098

	thumb_func_start sub_80A3168
sub_80A3168: @ 80A3168
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080A31D4
	ldr r4, _080A31E0 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0x2
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
	ldr r4, _080A31E4 @ =gBattleAnimArgs
	ldrh r0, [r4]
	strh r0, [r5, 0x24]
	ldrh r0, [r4, 0x2]
	strh r0, [r5, 0x26]
	ldrb r0, [r4, 0x4]
	adds r0, 0x1E
	adds r1, r5, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrb r1, [r4, 0x6]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	movs r2, 0x22
	ldrsh r0, [r5, r2]
	movs r2, 0x26
	ldrsh r1, [r5, r2]
	adds r0, r1
	cmp r0, 0x78
	ble _080A31D4
	ldrh r0, [r5, 0x22]
	adds r1, r0, 0
	subs r1, 0x78
	ldrh r2, [r5, 0x26]
	adds r0, r2
	adds r1, r0
	strh r1, [r5, 0x22]
_080A31D4:
	ldr r0, _080A31E8 @ =sub_80A32DC
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A31E0: .4byte gBattleAnimAttacker
_080A31E4: .4byte gBattleAnimArgs
_080A31E8: .4byte sub_80A32DC
	thumb_func_end sub_80A3168

	thumb_func_start sub_80A31EC
sub_80A31EC: @ 80A31EC
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x4
	mov r9, r0
	ldr r4, _080A32C8 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	mov r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r6, _080A32CC @ =gBattleAnimTarget
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8074480
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8074480
	adds r2, r0, 0
	lsls r2, 24
	subs r4, r5
	lsls r4, 16
	lsrs r2, 24
	mov r1, r8
	subs r2, r1
	lsls r2, 16
	lsrs r2, 16
	lsrs r3, r4, 16
	mov r10, r3
	asrs r4, 16
	ldr r6, _080A32D0 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r6, r1]
	muls r0, r4
	movs r1, 0x64
	str r2, [sp]
	bl __divsi3
	adds r5, r0
	mov r3, r9
	strh r5, [r3, 0x20]
	ldr r2, [sp]
	lsls r0, r2, 16
	asrs r0, 16
	movs r3, 0
	ldrsh r1, [r6, r3]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	add r8, r0
	mov r1, r8
	mov r0, r9
	strh r1, [r0, 0x22]
	ldrh r0, [r6, 0x2]
	mov r3, r9
	strh r0, [r3, 0x24]
	ldrh r0, [r6, 0x4]
	strh r0, [r3, 0x26]
	ldrb r0, [r6, 0x6]
	adds r0, 0x1E
	mov r1, r9
	adds r1, 0x43
	strb r0, [r1]
	ldrb r1, [r6, 0x8]
	mov r0, r9
	bl StartSpriteAnim
	ldrh r0, [r6, 0xA]
	mov r1, r9
	strh r0, [r1, 0x32]
	ldr r0, _080A32D4 @ =sub_80A32DC
	str r0, [r1, 0x1C]
	ldr r1, _080A32D8 @ =gUnknown_203999C
	mov r3, r9
	ldrh r0, [r3, 0x20]
	strh r0, [r1]
	ldrh r0, [r3, 0x22]
	strh r0, [r1, 0x2]
	mov r0, r10
	strh r0, [r1, 0x4]
	ldr r2, [sp]
	strh r2, [r1, 0x6]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A32C8: .4byte gBattleAnimAttacker
_080A32CC: .4byte gBattleAnimTarget
_080A32D0: .4byte gBattleAnimArgs
_080A32D4: .4byte sub_80A32DC
_080A32D8: .4byte gUnknown_203999C
	thumb_func_end sub_80A31EC

	thumb_func_start sub_80A32DC
sub_80A32DC: @ 80A32DC
	push {lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x2E]
	adds r1, 0x1
	strh r1, [r3, 0x2E]
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x32
	ldrsh r0, [r3, r2]
	subs r0, 0xA
	cmp r1, r0
	ble _080A331C
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsrs r0, r1, 31
	adds r0, r1, r0
	asrs r0, 1
	lsls r0, 1
	subs r1, r0
	movs r2, 0x3E
	adds r2, r3
	mov r12, r2
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
_080A331C:
	movs r2, 0x2E
	ldrsh r1, [r3, r2]
	movs r2, 0x32
	ldrsh r0, [r3, r2]
	cmp r1, r0
	ble _080A332E
	adds r0, r3, 0
	bl DestroyAnimSprite
_080A332E:
	pop {r0}
	bx r0
	thumb_func_end sub_80A32DC

	thumb_func_start sub_80A3334
sub_80A3334: @ 80A3334
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080A3374
	ldr r5, _080A33B0 @ =gBattleAnimAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	ldr r4, _080A33B4 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r2, [r4]
	adds r0, r2
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r6, 0x22]
	ldrh r0, [r4, 0x4]
	strh r0, [r6, 0x30]
	ldrh r0, [r4, 0x6]
	strh r0, [r6, 0x32]
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x34]
_080A3374:
	ldrh r0, [r6, 0x2E]
	adds r0, 0x1
	strh r0, [r6, 0x2E]
	ldrh r1, [r6, 0x30]
	muls r0, r1
	strh r0, [r6, 0x24]
	movs r2, 0x2E
	ldrsh r1, [r6, r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	movs r1, 0xFF
	ands r0, r1
	movs r2, 0x32
	ldrsh r1, [r6, r2]
	bl Sin
	strh r0, [r6, 0x26]
	movs r0, 0x2E
	ldrsh r1, [r6, r0]
	movs r2, 0x34
	ldrsh r0, [r6, r2]
	cmp r1, r0
	ble _080A33AA
	adds r0, r6, 0
	bl DestroyAnimSprite
_080A33AA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A33B0: .4byte gBattleAnimAttacker
_080A33B4: .4byte gBattleAnimArgs
	thumb_func_end sub_80A3334

	thumb_func_start sub_80A33B8
sub_80A33B8: @ 80A33B8
	push {r4,r5,lr}
	movs r2, 0x20
	ldrsh r4, [r0, r2]
	lsls r4, 8
	movs r3, 0x22
	ldrsh r2, [r0, r3]
	orrs r4, r2
	movs r5, 0x3A
	ldrsh r2, [r0, r5]
	lsls r2, 8
	movs r5, 0x3C
	ldrsh r3, [r0, r5]
	orrs r2, r3
	lsls r1, 8
	strh r4, [r0, 0x38]
	strh r2, [r0, 0x3A]
	strh r1, [r0, 0x3C]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A33B8

	thumb_func_start sub_80A33E0
sub_80A33E0: @ 80A33E0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r8, r0
	ldrh r0, [r0, 0x38]
	lsrs r1, r0, 8
	mov r10, r1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	mov r1, r8
	ldrh r0, [r1, 0x3A]
	lsrs r2, r0, 8
	lsls r0, 24
	lsrs r4, r0, 24
	ldrh r1, [r1, 0x3C]
	lsls r0, r1, 16
	asrs r0, 24
	lsls r0, 16
	lsrs r6, r0, 16
	movs r3, 0xFF
	ands r3, r1
	cmp r2, 0
	bne _080A341A
	movs r2, 0x20
	negs r2, r2
	b _080A3422
_080A341A:
	cmp r2, 0xFF
	bne _080A3422
	movs r2, 0x88
	lsls r2, 1
_080A3422:
	mov r0, r9
	subs r4, r0
	lsls r4, 16
	lsrs r4, 16
	mov r1, r10
	subs r0, r2, r1
	lsls r5, r3, 16
	asrs r5, 16
	muls r0, r5
	lsls r1, r6, 16
	asrs r7, r1, 16
	adds r1, r7, 0
	bl __divsi3
	adds r6, r0, 0
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	muls r0, r5
	adds r1, r7, 0
	bl __divsi3
	add r6, r10
	mov r1, r8
	strh r6, [r1, 0x20]
	add r0, r9
	strh r0, [r1, 0x22]
	adds r5, 0x1
	lsls r5, 16
	lsrs r3, r5, 16
	asrs r5, 16
	cmp r5, r7
	beq _080A3474
	lsls r1, r7, 8
	lsls r0, r3, 16
	asrs r0, 16
	orrs r0, r1
	mov r1, r8
	strh r0, [r1, 0x3C]
	movs r0, 0
	b _080A3476
_080A3474:
	movs r0, 0x1
_080A3476:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80A33E0

	thumb_func_start sub_80A3484
sub_80A3484: @ 80A3484
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0xA
	bne _080A3498
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080A3498:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x32
	ble _080A34AC
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A34AC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A3484

	thumb_func_start sub_80A34B4
sub_80A34B4: @ 80A34B4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	lsls r0, 7
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl __divsi3
	ldrh r1, [r4, 0x2E]
	adds r1, r0
	movs r5, 0
	strh r1, [r4, 0x2E]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x7F
	ble _080A34DE
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	strh r5, [r4, 0x2E]
_080A34DE:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x80
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x30
	ldrsh r2, [r4, r1]
	lsls r2, 3
	movs r1, 0x1E
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Sin
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	bl sub_80A33E0
	lsls r0, 24
	cmp r0, 0
	beq _080A350E
	strh r5, [r4, 0x26]
	strh r5, [r4, 0x2E]
	ldr r0, _080A3514 @ =sub_80A3484
	str r0, [r4, 0x1C]
_080A350E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A3514: .4byte sub_80A3484
	thumb_func_end sub_80A34B4

	thumb_func_start sub_80A3518
sub_80A3518: @ 80A3518
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0
	bl sub_8075160
	ldr r4, _080A3560 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080A3564 @ =gBattleAnimAttacker
	ldrb r1, [r0]
	movs r0, 0x2
	eors r0, r1
	ldrb r4, [r4]
	cmp r0, r4
	bne _080A3568
	strh r6, [r5, 0x3A]
	adds r0, r2, 0
	adds r0, 0xA
	strh r0, [r5, 0x3C]
	adds r0, r5, 0
	movs r1, 0x3C
	bl sub_80A33B8
	movs r0, 0x1
	b _080A357A
	.align 2, 0
_080A3560: .4byte gBattleAnimTarget
_080A3564: .4byte gBattleAnimAttacker
_080A3568:
	strh r6, [r5, 0x3A]
	adds r0, r2, 0
	adds r0, 0xA
	strh r0, [r5, 0x3C]
	adds r0, r5, 0
	movs r1, 0x3C
	bl sub_80A33B8
	movs r0, 0x3
_080A357A:
	strh r0, [r5, 0x34]
	movs r0, 0x3C
	strh r0, [r5, 0x36]
	ldr r0, _080A358C @ =sub_80A34B4
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A358C: .4byte sub_80A34B4
	thumb_func_end sub_80A3518

	thumb_func_start sub_80A3590
sub_80A3590: @ 80A3590
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	lsls r0, 7
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl __divsi3
	ldrh r1, [r4, 0x2E]
	adds r1, r0
	movs r5, 0
	strh r1, [r4, 0x2E]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x7F
	ble _080A35BA
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	strh r5, [r4, 0x2E]
_080A35BA:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x80
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x30
	ldrsh r2, [r4, r1]
	lsls r2, 3
	movs r1, 0x1E
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Sin
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	bl sub_80A33E0
	lsls r0, 24
	cmp r0, 0
	beq _080A35EC
	strh r5, [r4, 0x26]
	strh r5, [r4, 0x2E]
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A35EC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A3590

	thumb_func_start sub_80A35F4
sub_80A35F4: @ 80A35F4
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r4, _080A3630 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080A3638
	strh r0, [r5, 0x3A]
	adds r0, r6, 0
	adds r0, 0xA
	strh r0, [r5, 0x3C]
	adds r0, r5, 0
	movs r1, 0x28
	bl sub_80A33B8
	movs r0, 0x3
	strh r0, [r5, 0x34]
	movs r0, 0x3C
	strh r0, [r5, 0x36]
	ldr r0, _080A3634 @ =sub_80A34B4
	b _080A3662
	.align 2, 0
_080A3630: .4byte gBattleAnimTarget
_080A3634: .4byte sub_80A34B4
_080A3638:
	movs r0, 0xFF
	strh r0, [r5, 0x3A]
	adds r0, r6, 0
	adds r0, 0xA
	strh r0, [r5, 0x3C]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080A3650
	movs r0, 0
	strh r0, [r5, 0x3A]
_080A3650:
	adds r0, r5, 0
	movs r1, 0x28
	bl sub_80A33B8
	movs r0, 0x3
	strh r0, [r5, 0x34]
	movs r0, 0x3C
	strh r0, [r5, 0x36]
	ldr r0, _080A366C @ =sub_80A3590
_080A3662:
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A366C: .4byte sub_80A3590
	thumb_func_end sub_80A35F4

	thumb_func_start sub_80A3670
sub_80A3670: @ 80A3670
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080A368A
	adds r0, r4, 0
	movs r1, 0
	bl sub_8075114
	ldr r0, _080A36B0 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x30]
_080A368A:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x30]
	muls r0, r1
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080A36AA
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A36AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A36B0: .4byte gBattleAnimArgs
	thumb_func_end sub_80A3670

	thumb_func_start sub_80A36B4
sub_80A36B4: @ 80A36B4
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0
	bl sub_8075114
	ldr r4, _080A36FC @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080A3700 @ =gBattleAnimTarget
	ldrb r1, [r0]
	movs r0, 0x2
	eors r0, r1
	ldrb r4, [r4]
	cmp r0, r4
	bne _080A3704
	strh r6, [r5, 0x3A]
	adds r0, r2, 0
	adds r0, 0xA
	strh r0, [r5, 0x3C]
	adds r0, r5, 0
	movs r1, 0x3C
	bl sub_80A33B8
	movs r0, 0x1
	b _080A3716
	.align 2, 0
_080A36FC: .4byte gBattleAnimAttacker
_080A3700: .4byte gBattleAnimTarget
_080A3704:
	strh r6, [r5, 0x3A]
	adds r0, r2, 0
	adds r0, 0xA
	strh r0, [r5, 0x3C]
	adds r0, r5, 0
	movs r1, 0x3C
	bl sub_80A33B8
	movs r0, 0x3
_080A3716:
	strh r0, [r5, 0x34]
	movs r0, 0x3C
	strh r0, [r5, 0x36]
	ldr r0, _080A3728 @ =sub_80A372C
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A3728: .4byte sub_80A372C
	thumb_func_end sub_80A36B4

	thumb_func_start sub_80A372C
sub_80A372C: @ 80A372C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	lsls r0, 7
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl __divsi3
	ldrh r1, [r4, 0x2E]
	adds r1, r0
	movs r5, 0
	strh r1, [r4, 0x2E]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x7F
	ble _080A3756
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	strh r5, [r4, 0x2E]
_080A3756:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x80
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x30
	ldrsh r2, [r4, r1]
	lsls r2, 3
	movs r1, 0x1E
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Sin
	strh r0, [r4, 0x26]
	lsls r0, 16
	cmp r0, 0
	bne _080A378A
	movs r0, 0x3F
	bl sub_8073A44
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x76
	bl PlaySE12WithPanning
_080A378A:
	adds r0, r4, 0
	bl sub_80A33E0
	lsls r0, 24
	cmp r0, 0
	beq _080A37B2
	strh r5, [r4, 0x26]
	strh r5, [r4, 0x2E]
	ldr r0, _080A37B8 @ =sub_80A3484
	str r0, [r4, 0x1C]
	movs r0, 0x40
	negs r0, r0
	bl sub_8073A44
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x76
	bl PlaySE12WithPanning
_080A37B2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A37B8: .4byte sub_80A3484
	thumb_func_end sub_80A372C

	thumb_func_start sub_80A37BC
sub_80A37BC: @ 80A37BC
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080A3850
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080A37E4
	ldr r0, _080A37E0 @ =gBattleAnimArgs
	ldrh r1, [r0, 0x2]
	strh r1, [r4, 0x30]
	movs r1, 0x78
	strh r1, [r4, 0x20]
	adds r5, r0, 0
	b _080A3806
	.align 2, 0
_080A37E0: .4byte gBattleAnimArgs
_080A37E4:
	ldr r0, _080A3840 @ =gBattleAnimArgs
	movs r1, 0x2
	ldrsh r3, [r0, r1]
	adds r1, r3, 0
	subs r1, 0x20
	adds r2, r1, 0
	adds r5, r0, 0
	cmp r1, 0
	bge _080A37FA
	adds r2, r3, 0
	adds r2, 0xDF
_080A37FA:
	asrs r0, r2, 8
	lsls r0, 8
	subs r0, r1, r0
	strh r0, [r4, 0x30]
	movs r0, 0x46
	strh r0, [r4, 0x20]
_080A3806:
	ldrh r0, [r5]
	strh r0, [r4, 0x22]
	strh r0, [r4, 0x32]
	movs r0, 0x14
	strh r0, [r4, 0x36]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x3C
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x14
	bl Sin
	strh r0, [r4, 0x26]
	ldr r0, _080A3844 @ =sub_80A3858
	str r0, [r4, 0x1C]
	ldrh r0, [r4, 0x30]
	subs r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xBE
	bhi _080A3848
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1F
	b _080A384E
	.align 2, 0
_080A3840: .4byte gBattleAnimArgs
_080A3844: .4byte sub_80A3858
_080A3848:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1D
_080A384E:
	strb r0, [r1]
_080A3850:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A37BC

	thumb_func_start sub_80A3858
sub_80A3858: @ 80A3858
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080A386A
	cmp r0, 0x1
	beq _080A389A
	b _080A38BA
_080A386A:
	ldrh r5, [r4, 0x32]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x4E
	ble _080A3882
	movs r0, 0x1
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	b _080A38BA
_080A3882:
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl __divsi3
	adds r0, r5, r0
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x36]
	adds r1, 0x3
	strh r1, [r4, 0x36]
	strh r0, [r4, 0x22]
	b _080A38BA
_080A389A:
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080A38BA
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080A38BA
	movs r0, 0
	strh r0, [r4, 0x2E]
	strh r0, [r4, 0x32]
	ldr r0, _080A38C0 @ =sub_80A38C4
	str r0, [r4, 0x1C]
_080A38BA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A38C0: .4byte sub_80A38C4
	thumb_func_end sub_80A3858

	thumb_func_start sub_80A38C4
sub_80A38C4: @ 80A38C4
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r5, _080A3908 @ =gUnknown_83E2F78
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 1
	adds r3, r0, r1
	adds r0, r5, 0x1
	adds r0, r3, r0
	ldrh r2, [r4, 0x32]
	movs r6, 0x32
	ldrsh r1, [r4, r6]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	bne _080A3910
	adds r0, r5, 0x2
	adds r0, r3, r0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x7F
	bne _080A38FC
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080A390C @ =sub_80A397C
	str r0, [r4, 0x1C]
_080A38FC:
	movs r0, 0
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080A3976
	.align 2, 0
_080A3908: .4byte gUnknown_83E2F78
_080A390C: .4byte sub_80A397C
_080A3910:
	adds r0, r2, 0x1
	strh r0, [r4, 0x32]
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 1
	adds r0, r1
	adds r1, r0, r5
	movs r2, 0
	ldrsb r2, [r1, r2]
	adds r1, r5, 0x2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	muls r0, r2
	ldrh r1, [r4, 0x30]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080A395E
	ldrh r0, [r4, 0x30]
	subs r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xBE
	bhi _080A3956
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1F
	b _080A395C
_080A3956:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1D
_080A395C:
	strb r0, [r1]
_080A395E:
	movs r6, 0x30
	ldrsh r0, [r4, r6]
	movs r1, 0x3C
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x14
	bl Sin
	strh r0, [r4, 0x26]
_080A3976:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A38C4

	thumb_func_start sub_80A397C
sub_80A397C: @ 80A397C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x14
	ble _080A398E
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A398E:
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
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A397C

	thumb_func_start sub_80A39C0
sub_80A39C0: @ 80A39C0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080A3B14 @ =gTasks
	adds r5, r0, r1
	ldr r4, _080A3B18 @ =gBattleAnimTarget
	ldrb r0, [r4]
	bl sub_807685C
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	strh r0, [r5, 0x10]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x14]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x16]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8076B2C
	strh r0, [r5, 0x1C]
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8076B2C
	strh r0, [r5, 0x1E]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0x1
	bne _080A3A28
	movs r1, 0x1
_080A3A28:
	strh r1, [r5, 0x12]
	movs r3, 0x12
	ldrsh r0, [r5, r3]
	lsls r0, 6
	movs r1, 0x38
	subs r1, r0
	strh r1, [r5, 0x1A]
	ldrh r0, [r5, 0x16]
	subs r0, r1
	ldrh r1, [r5, 0x14]
	adds r0, r1
	strh r0, [r5, 0x18]
	ldr r0, _080A3B1C @ =gUnknown_83E2FF0
	movs r2, 0x18
	ldrsh r1, [r5, r2]
	movs r3, 0x1A
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, 0x10]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xC]
	cmp r0, 0x40
	bne _080A3A60
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080A3A60:
	ldr r4, _080A3B20 @ =gSprites
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xA
	strh r1, [r0, 0x2E]
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r5, 0x18]
	strh r1, [r0, 0x30]
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	movs r1, 0x1C
	ldrsh r0, [r5, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0xA
	movs r3, 0x12
	ldrsh r1, [r5, r3]
	muls r1, r0
	ldrh r0, [r5, 0x14]
	subs r0, r1
	strh r0, [r2, 0x32]
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r5, 0x1A]
	strh r1, [r0, 0x34]
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	lsrs r2, r0, 31
	adds r0, r2
	asrs r0, 1
	adds r0, 0xA
	movs r3, 0x12
	ldrsh r2, [r5, r3]
	muls r0, r2
	ldrh r2, [r5, 0x16]
	adds r0, r2
	strh r0, [r1, 0x36]
	movs r3, 0xC
	ldrsh r1, [r5, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl sub_80A3F04
	movs r1, 0xC
	ldrsh r2, [r5, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r0, [r1, 0x38]
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl sub_8075068
	ldr r0, _080A3B24 @ =sub_80A3B28
	str r0, [r5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A3B14: .4byte gTasks
_080A3B18: .4byte gBattleAnimTarget
_080A3B1C: .4byte gUnknown_83E2FF0
_080A3B20: .4byte gSprites
_080A3B24: .4byte sub_80A3B28
	thumb_func_end sub_80A39C0

	thumb_func_start sub_80A3B28
sub_80A3B28: @ 80A3B28
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080A3B6C @ =gTasks
	adds r6, r0, r1
	movs r0, 0xC
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080A3B70 @ =gSprites
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r5, [r6, r1]
	cmp r5, 0x7
	bne _080A3B50
	b _080A3D80
_080A3B50:
	cmp r5, 0x7
	bgt _080A3B9E
	cmp r5, 0x3
	bne _080A3B5A
	b _080A3C72
_080A3B5A:
	cmp r5, 0x3
	bgt _080A3B74
	cmp r5, 0x1
	beq _080A3C04
	cmp r5, 0x1
	bgt _080A3C54
	cmp r5, 0
	beq _080A3BE6
	b _080A3EFC
	.align 2, 0
_080A3B6C: .4byte gTasks
_080A3B70: .4byte gSprites
_080A3B74:
	cmp r5, 0x5
	bne _080A3B7A
	b _080A3CE8
_080A3B7A:
	cmp r5, 0x5
	ble _080A3B80
	b _080A3D62
_080A3B80:
	adds r0, r6, 0
	adds r1, r2, 0
	bl sub_80A3F24
	adds r0, r4, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	bne _080A3B96
	b _080A3EFC
_080A3B96:
	movs r0, 0x5
	strh r0, [r6, 0x26]
	movs r0, 0xFF
	b _080A3EFA
_080A3B9E:
	cmp r5, 0xB
	bne _080A3BA4
	b _080A3E64
_080A3BA4:
	cmp r5, 0xB
	bgt _080A3BD2
	cmp r5, 0x9
	bne _080A3BAE
	b _080A3DD2
_080A3BAE:
	cmp r5, 0x9
	ble _080A3BB4
	b _080A3E48
_080A3BB4:
	adds r0, r6, 0
	adds r1, r2, 0
	bl sub_80A3F24
	adds r0, r4, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	bne _080A3BCA
	b _080A3EFC
_080A3BCA:
	movs r0, 0x9
	strh r0, [r6, 0x26]
	movs r0, 0xFF
	b _080A3EFA
_080A3BD2:
	cmp r5, 0xD
	bne _080A3BD8
	b _080A3ED6
_080A3BD8:
	cmp r5, 0xD
	bge _080A3BDE
	b _080A3EB6
_080A3BDE:
	cmp r5, 0xFF
	bne _080A3BE4
	b _080A3EE6
_080A3BE4:
	b _080A3EFC
_080A3BE6:
	adds r0, r6, 0
	adds r1, r2, 0
	bl sub_80A3F24
	adds r0, r4, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	bne _080A3BFC
	b _080A3EFC
_080A3BFC:
	movs r0, 0x1
	strh r0, [r6, 0x26]
	movs r0, 0xFF
	b _080A3EFA
_080A3C04:
	ldrh r2, [r4, 0x24]
	ldrh r3, [r4, 0x20]
	adds r2, r3
	movs r0, 0
	strh r2, [r4, 0x20]
	ldrh r1, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r1, r3
	strh r1, [r4, 0x22]
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	strh r2, [r4, 0x30]
	ldrh r0, [r6, 0x14]
	strh r0, [r4, 0x32]
	strh r1, [r4, 0x34]
	ldrh r0, [r6, 0x16]
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_80A3F04
	strh r0, [r4, 0x38]
	ldrh r0, [r6, 0x10]
	adds r0, 0x2
	strh r0, [r6, 0x10]
	strh r5, [r6, 0xE]
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrb r1, [r6, 0xE]
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl sub_8075068
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	b _080A3EFA
_080A3C54:
	adds r0, r6, 0
	adds r1, r2, 0
	bl sub_80A3F24
	adds r0, r4, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	bne _080A3C6A
	b _080A3EFC
_080A3C6A:
	movs r0, 0x3
	strh r0, [r6, 0x26]
	movs r0, 0xFF
	b _080A3EFA
_080A3C72:
	ldrh r1, [r4, 0x24]
	ldrh r0, [r4, 0x20]
	adds r1, r0
	movs r0, 0
	strh r1, [r4, 0x20]
	ldrh r2, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r2, r3
	strh r2, [r4, 0x22]
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	movs r1, 0x1C
	ldrsh r0, [r6, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0xA
	movs r3, 0x12
	ldrsh r1, [r6, r3]
	muls r1, r0
	ldrh r0, [r6, 0x14]
	subs r0, r1
	strh r0, [r4, 0x32]
	strh r2, [r4, 0x34]
	movs r1, 0x1E
	ldrsh r0, [r6, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0xA
	movs r2, 0x12
	ldrsh r1, [r6, r2]
	muls r1, r0
	ldrh r0, [r6, 0x16]
	subs r0, r1
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_80A3F04
	strh r0, [r4, 0x38]
	movs r0, 0x2
	strh r0, [r6, 0xE]
	ldrh r0, [r6, 0x10]
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrb r1, [r6, 0xE]
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl sub_8075068
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	b _080A3EFA
_080A3CE8:
	ldrh r1, [r4, 0x24]
	ldrh r3, [r4, 0x20]
	adds r1, r3
	movs r0, 0
	strh r1, [r4, 0x20]
	ldrh r2, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r2, r3
	strh r2, [r4, 0x22]
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	movs r1, 0x1C
	ldrsh r0, [r6, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0xA
	movs r3, 0x12
	ldrsh r1, [r6, r3]
	muls r0, r1
	ldrh r1, [r6, 0x14]
	adds r0, r1
	strh r0, [r4, 0x32]
	strh r2, [r4, 0x34]
	movs r2, 0x1E
	ldrsh r0, [r6, r2]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0xA
	movs r3, 0x12
	ldrsh r1, [r6, r3]
	muls r0, r1
	ldrh r1, [r6, 0x16]
	adds r0, r1
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_80A3F04
	strh r0, [r4, 0x38]
	ldrh r1, [r6, 0x10]
	subs r1, 0x2
	strh r1, [r6, 0x10]
	movs r0, 0x3
	strh r0, [r6, 0xE]
	adds r0, r4, 0
	adds r0, 0x43
	strb r1, [r0]
	ldrb r1, [r6, 0xE]
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl sub_8075068
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	b _080A3EFA
_080A3D62:
	adds r0, r6, 0
	adds r1, r2, 0
	bl sub_80A3F24
	adds r0, r4, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	bne _080A3D78
	b _080A3EFC
_080A3D78:
	movs r0, 0x7
	strh r0, [r6, 0x26]
	movs r0, 0xFF
	b _080A3EFA
_080A3D80:
	ldrh r2, [r4, 0x24]
	ldrh r3, [r4, 0x20]
	adds r2, r3
	movs r0, 0
	strh r2, [r4, 0x20]
	ldrh r1, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r1, r3
	strh r1, [r4, 0x22]
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	strh r2, [r4, 0x30]
	ldrh r0, [r6, 0x14]
	strh r0, [r4, 0x32]
	strh r1, [r4, 0x34]
	ldrh r0, [r6, 0x16]
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_80A3F04
	strh r0, [r4, 0x38]
	ldrh r1, [r6, 0x10]
	adds r1, 0x2
	strh r1, [r6, 0x10]
	movs r0, 0x4
	strh r0, [r6, 0xE]
	adds r0, r4, 0
	adds r0, 0x43
	strb r1, [r0]
	ldrb r1, [r6, 0xE]
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl sub_8075068
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	b _080A3EFA
_080A3DD2:
	ldrh r1, [r4, 0x24]
	ldrh r0, [r4, 0x20]
	adds r1, r0
	movs r0, 0
	strh r1, [r4, 0x20]
	ldrh r2, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r2, r3
	strh r2, [r4, 0x22]
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	movs r1, 0x1C
	ldrsh r0, [r6, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0xA
	movs r3, 0x12
	ldrsh r1, [r6, r3]
	muls r1, r0
	ldrh r0, [r6, 0x14]
	subs r0, r1
	strh r0, [r4, 0x32]
	strh r2, [r4, 0x34]
	movs r1, 0x1E
	ldrsh r0, [r6, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0xA
	movs r2, 0x12
	ldrsh r1, [r6, r2]
	muls r0, r1
	ldrh r3, [r6, 0x16]
	adds r0, r3
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_80A3F04
	strh r0, [r4, 0x38]
	movs r0, 0x5
	strh r0, [r6, 0xE]
	ldrh r0, [r6, 0x10]
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrb r1, [r6, 0xE]
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl sub_8075068
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	b _080A3EFA
_080A3E48:
	adds r0, r6, 0
	adds r1, r2, 0
	bl sub_80A3F24
	adds r0, r4, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080A3EFC
	movs r0, 0xB
	strh r0, [r6, 0x26]
	movs r0, 0xFF
	b _080A3EFA
_080A3E64:
	ldrh r2, [r4, 0x24]
	ldrh r0, [r4, 0x20]
	adds r2, r0
	movs r0, 0
	strh r2, [r4, 0x20]
	ldrh r1, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r1, r3
	strh r1, [r4, 0x22]
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	strh r2, [r4, 0x30]
	ldrh r0, [r6, 0x18]
	strh r0, [r4, 0x32]
	strh r1, [r4, 0x34]
	ldrh r0, [r6, 0x1A]
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_80A3F04
	strh r0, [r4, 0x38]
	ldrh r1, [r6, 0x10]
	subs r1, 0x2
	strh r1, [r6, 0x10]
	movs r0, 0x6
	strh r0, [r6, 0xE]
	adds r0, r4, 0
	adds r0, 0x43
	strb r1, [r0]
	ldrb r1, [r6, 0xE]
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl sub_8075068
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	b _080A3EFA
_080A3EB6:
	adds r0, r6, 0
	adds r1, r2, 0
	bl sub_80A3F24
	adds r0, r4, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080A3EFC
	adds r0, r4, 0
	bl DestroySprite
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	b _080A3EFA
_080A3ED6:
	movs r1, 0x20
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080A3EFC
	adds r0, r2, 0
	bl DestroyAnimVisualTask
	b _080A3EFC
_080A3EE6:
	ldrh r0, [r6, 0xA]
	adds r0, 0x1
	strh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080A3EFC
	movs r0, 0
	strh r0, [r6, 0xA]
	ldrh r0, [r6, 0x26]
_080A3EFA:
	strh r0, [r6, 0x8]
_080A3EFC:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A3B28

	thumb_func_start sub_80A3F04
sub_80A3F04: @ 80A3F04
	push {lr}
	movs r2, 0x8
	movs r3, 0x36
	ldrsh r1, [r0, r3]
	movs r3, 0x22
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bge _080A3F1A
	negs r0, r2
	lsls r0, 16
	lsrs r2, r0, 16
_080A3F1A:
	lsls r0, r2, 16
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80A3F04

	thumb_func_start sub_80A3F24
sub_80A3F24: @ 80A3F24
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	ldrh r0, [r6, 0x24]
	adds r0, 0x1
	strh r0, [r6, 0x24]
	lsls r0, 16
	cmp r0, 0
	ble _080A3FBA
	movs r0, 0
	strh r0, [r6, 0x24]
	ldr r0, _080A3FC4 @ =gSprites
	mov r8, r0
	movs r2, 0xC
	ldrsh r1, [r6, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	ldrh r1, [r0, 0x24]
	ldrh r2, [r0, 0x20]
	adds r1, r2
	ldrh r2, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r2, r0
	ldr r0, _080A3FC8 @ =gUnknown_83E2FF0
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	ldrb r3, [r6, 0x10]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080A3FBA
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	mov r0, r8
	adds r4, r5, r0
	strh r7, [r4, 0x3A]
	movs r0, 0xC
	strh r0, [r4, 0x3C]
	ldr r0, _080A3FCC @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	ldrh r2, [r6, 0x22]
	movs r0, 0x1
	ands r0, r2
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x22]
	adds r0, 0x1
	strh r0, [r1, 0x22]
	ldrb r1, [r6, 0xE]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldrh r0, [r6, 0x10]
	adds r4, 0x43
	strb r0, [r4]
	mov r0, r8
	adds r0, 0x1C
	adds r5, r0
	ldr r0, _080A3FD0 @ =sub_80A3FD4
	str r0, [r5]
_080A3FBA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3FC4: .4byte gSprites
_080A3FC8: .4byte gUnknown_83E2FF0
_080A3FCC: .4byte gTasks
_080A3FD0: .4byte sub_80A3FD4
	thumb_func_end sub_80A3F24

	thumb_func_start sub_80A3FD4
sub_80A3FD4: @ 80A3FD4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080A4036
	movs r0, 0
	strh r0, [r4, 0x2E]
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080A4036
	ldr r3, _080A403C @ =gTasks
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
_080A4036:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A403C: .4byte gTasks
	thumb_func_end sub_80A3FD4

	thumb_func_start sub_80A4040
sub_80A4040: @ 80A4040
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r0, _080A4054 @ =gBattleAnimArgs
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A405C
	ldr r0, _080A4058 @ =gBattleAnimAttacker
	b _080A405E
	.align 2, 0
_080A4054: .4byte gBattleAnimArgs
_080A4058: .4byte gBattleAnimAttacker
_080A405C:
	ldr r0, _080A407C @ =gBattleAnimTarget
_080A405E:
	ldrb r6, [r0]
	adds r0, r6, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A4088
	movs r0, 0
	strh r0, [r4, 0x36]
	ldr r1, _080A4080 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x32]
	ldr r0, _080A4084 @ =0x0000fff0
	b _080A4098
	.align 2, 0
_080A407C: .4byte gBattleAnimTarget
_080A4080: .4byte gBattleAnimArgs
_080A4084: .4byte 0x0000fff0
_080A4088:
	movs r0, 0x1
	strh r0, [r4, 0x36]
	ldr r1, _080A40BC @ =gBattleAnimArgs
	ldrh r0, [r1, 0x6]
	negs r0, r0
	strh r0, [r4, 0x32]
	movs r0, 0x80
	lsls r0, 1
_080A4098:
	strh r0, [r4, 0x20]
	adds r7, r1, 0
	adds r5, r7, 0
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x34]
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080A40CE
	cmp r0, 0x1
	bgt _080A40C0
	cmp r0, 0
	beq _080A40CA
	b _080A4138
	.align 2, 0
_080A40BC: .4byte gBattleAnimArgs
_080A40C0:
	cmp r0, 0x2
	beq _080A40D4
	cmp r0, 0x3
	beq _080A4100
	b _080A4138
_080A40CA:
	ldrh r0, [r5]
	b _080A40E4
_080A40CE:
	ldrh r0, [r5]
	strh r0, [r4, 0x22]
	b _080A411A
_080A40D4:
	adds r0, r6, 0
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5]
	adds r0, r5
_080A40E4:
	strh r0, [r4, 0x22]
	adds r0, r6, 0
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
	b _080A4138
_080A4100:
	ldr r0, _080A4144 @ =gBattleAnimTarget
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r7, [r7]
	adds r0, r7
	strh r0, [r4, 0x22]
	movs r0, 0x1
	bl GetAnimBankSpriteId
_080A411A:
	adds r0, r6, 0
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
_080A4138:
	ldr r0, _080A4148 @ =sub_80A414C
	str r0, [r4, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4144: .4byte gBattleAnimTarget
_080A4148: .4byte sub_80A414C
	thumb_func_end sub_80A4040

	thumb_func_start sub_80A414C
sub_80A414C: @ 80A414C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x3C
	ldrsh r3, [r4, r0]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	movs r1, 0x30
	ldrsh r2, [r4, r1]
	ldr r1, _080A41A0 @ =gSineTable
	movs r5, 0x2E
	ldrsh r0, [r4, r5]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	muls r0, r2
	asrs r0, 8
	strh r0, [r4, 0x26]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	muls r0, r3
	strh r0, [r4, 0x24]
	movs r5, 0x34
	ldrsh r0, [r4, r5]
	muls r0, r3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080A41A4
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	movs r5, 0x20
	ldrsh r1, [r4, r5]
	adds r0, r1
	cmp r0, 0xF7
	ble _080A41BC
	b _080A41B6
	.align 2, 0
_080A41A0: .4byte gSineTable
_080A41A4:
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	movs r2, 0x20
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bgt _080A41BC
_080A41B6:
	adds r0, r4, 0
	bl move_anim_8074EE0
_080A41BC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A414C

	thumb_func_start sub_80A41C4
sub_80A41C4: @ 80A41C4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080A41E4 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080A41E8
	cmp r0, 0x1
	beq _080A421C
	b _080A4276
	.align 2, 0
_080A41E4: .4byte gTasks
_080A41E8:
	ldr r0, _080A4214 @ =0x0000274f
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r2, 0x80
	lsls r2, 1
	adds r4, r2, 0
	adds r0, r4
	strh r0, [r5, 0x18]
	ldr r0, _080A4218 @ =0x000027b0
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	adds r0, r4
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080A4276
	.align 2, 0
_080A4214: .4byte 0x0000274f
_080A4218: .4byte 0x000027b0
_080A421C:
	ldrh r0, [r5, 0x1A]
	adds r0, 0x1
	movs r7, 0
	strh r0, [r5, 0x1A]
	lsls r0, 16
	cmp r0, 0
	blt _080A4276
	strh r7, [r5, 0x1A]
	ldrh r0, [r5, 0x18]
	ldrb r2, [r5, 0x1C]
	ldr r4, _080A4290 @ =gUnknown_83E30F0
	movs r3, 0x1E
	ldrsh r1, [r5, r3]
	lsls r1, 1
	adds r1, r4
	ldrh r3, [r1]
	movs r1, 0x10
	bl BlendPalette
	ldrh r0, [r5, 0x20]
	ldrb r2, [r5, 0x1C]
	movs r3, 0x1E
	ldrsh r1, [r5, r3]
	lsls r1, 1
	adds r1, r4
	ldrh r3, [r1]
	movs r1, 0x10
	bl BlendPalette
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x11
	bne _080A4276
	strh r7, [r5, 0x1C]
	ldrh r0, [r5, 0x1E]
	adds r0, 0x1
	strh r0, [r5, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	bne _080A4276
	strh r7, [r5, 0x1E]
_080A4276:
	ldr r0, _080A4294 @ =gBattleAnimArgs
	movs r2, 0xE
	ldrsh r1, [r0, r2]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080A428A
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080A428A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4290: .4byte gUnknown_83E30F0
_080A4294: .4byte gBattleAnimArgs
	thumb_func_end sub_80A41C4

	thumb_func_start sub_80A4298
sub_80A4298: @ 80A4298
	push {r4-r7,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r1, _080A42B0 @ =gBattleAnimArgs
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080A42B4
	adds r0, r6, 0
	bl DestroyAnimSprite
	b _080A438E
	.align 2, 0
_080A42B0: .4byte gBattleAnimArgs
_080A42B4:
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080A42C4
	ldr r4, _080A42C0 @ =gBattleAnimAttacker
	b _080A42C6
	.align 2, 0
_080A42C0: .4byte gBattleAnimAttacker
_080A42C4:
	ldr r4, _080A4300 @ =gBattleAnimTarget
_080A42C6:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080A4304 @ =gBattleAnimArgs
	ldrh r1, [r0, 0x8]
	strh r1, [r6, 0x2E]
	movs r3, 0x2
	ldrsh r1, [r0, r3]
	adds r7, r0, 0
	cmp r1, 0
	bne _080A4308
	ldrh r0, [r7, 0x4]
	adds r0, r5
	strh r0, [r6, 0x20]
	ldrh r0, [r7, 0x6]
	adds r0, r2
	strh r0, [r6, 0x22]
	strh r5, [r6, 0x38]
	strh r2, [r6, 0x3A]
	b _080A4318
	.align 2, 0
_080A4300: .4byte gBattleAnimTarget
_080A4304: .4byte gBattleAnimArgs
_080A4308:
	strh r5, [r6, 0x20]
	strh r2, [r6, 0x22]
	ldrh r0, [r7, 0x4]
	adds r0, r5
	strh r0, [r6, 0x38]
	ldrh r0, [r7, 0x6]
	adds r0, r2
	strh r0, [r6, 0x3A]
_080A4318:
	ldrh r4, [r6, 0x20]
	lsls r0, r4, 4
	strh r0, [r6, 0x30]
	ldrh r5, [r6, 0x22]
	lsls r0, r5, 4
	strh r0, [r6, 0x32]
	movs r1, 0x38
	ldrsh r0, [r6, r1]
	movs r2, 0x20
	ldrsh r1, [r6, r2]
	subs r0, r1
	lsls r0, 4
	movs r3, 0x8
	ldrsh r1, [r7, r3]
	bl __divsi3
	strh r0, [r6, 0x34]
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	movs r2, 0x22
	ldrsh r1, [r6, r2]
	subs r0, r1
	lsls r0, 4
	movs r3, 0x8
	ldrsh r1, [r7, r3]
	bl __divsi3
	strh r0, [r6, 0x36]
	ldrh r0, [r6, 0x38]
	subs r0, r4
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r6, 0x3A]
	subs r1, r5
	lsls r1, 16
	asrs r1, 16
	bl sub_8075B30
	lsls r0, 16
	lsrs r4, r0, 16
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080A437A
	ldr r1, _080A4398 @ =0xffff8000
	adds r0, r4, r1
	lsls r0, 16
	lsrs r4, r0, 16
_080A437A:
	movs r3, 0x80
	lsls r3, 1
	str r4, [sp]
	adds r0, r6, 0
	movs r1, 0
	adds r2, r3, 0
	bl sub_8075A1C
	ldr r0, _080A439C @ =sub_80A43A0
	str r0, [r6, 0x1C]
_080A438E:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4398: .4byte 0xffff8000
_080A439C: .4byte sub_80A43A0
	thumb_func_end sub_80A4298

	thumb_func_start sub_80A43A0
sub_80A43A0: @ 80A43A0
	push {r4,lr}
	adds r2, r0, 0
	ldrh r3, [r2, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _080A43D0
	ldrh r0, [r2, 0x34]
	ldrh r4, [r2, 0x30]
	adds r0, r4
	strh r0, [r2, 0x30]
	ldrh r1, [r2, 0x36]
	ldrh r4, [r2, 0x32]
	adds r1, r4
	strh r1, [r2, 0x32]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r2, 0x22]
	subs r0, r3, 0x1
	strh r0, [r2, 0x2E]
	b _080A43D6
_080A43D0:
	adds r0, r2, 0
	bl move_anim_8074EE0
_080A43D6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A43A0

	thumb_func_start sub_80A43DC
sub_80A43DC: @ 80A43DC
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080A43F2
	adds r0, r2, 0
	bl DestroyAnimSprite
_080A43F2:
	pop {r0}
	bx r0
	thumb_func_end sub_80A43DC

	thumb_func_start sub_80A43F8
sub_80A43F8: @ 80A43F8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080A4418 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A4420
	ldr r2, _080A441C @ =gBattleAnimArgs
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	b _080A442C
	.align 2, 0
_080A4418: .4byte gBattleAnimAttacker
_080A441C: .4byte gBattleAnimArgs
_080A4420:
	ldr r0, _080A4444 @ =gBattleAnimArgs
	ldrh r1, [r0]
	ldrh r2, [r4, 0x20]
	adds r1, r2
	strh r1, [r4, 0x20]
	ldrh r0, [r0, 0x2]
_080A442C:
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _080A4448 @ =sub_8074F6C
	str r0, [r4, 0x1C]
	ldr r1, _080A444C @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4444: .4byte gBattleAnimArgs
_080A4448: .4byte sub_8074F6C
_080A444C: .4byte DestroyAnimSprite
	thumb_func_end sub_80A43F8

	thumb_func_start sub_80A4450
sub_80A4450: @ 80A4450
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080A4488 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080A446A
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080A446A:
	ldr r0, _080A448C @ =sub_80A43DC
	str r0, [r5, 0x1C]
	ldr r4, _080A4490 @ =gBattleAnimArgs
	movs r0, 0
	ldrsh r1, [r4, r0]
	adds r0, r5, 0
	bl sub_8074FF8
	ldrh r0, [r4, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4488: .4byte gBattleAnimAttacker
_080A448C: .4byte sub_80A43DC
_080A4490: .4byte gBattleAnimArgs
	thumb_func_end sub_80A4450

	thumb_func_start sub_80A4494
sub_80A4494: @ 80A4494
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080A44D4 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x34]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x38]
	ldrb r1, [r1, 0xC]
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	ldr r1, _080A44D8 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080A44DC @ =sub_8074E70
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A44D4: .4byte gBattleAnimArgs
_080A44D8: .4byte move_anim_8074EE0
_080A44DC: .4byte sub_8074E70
	thumb_func_end sub_80A4494

	thumb_func_start sub_80A44E0
sub_80A44E0: @ 80A44E0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080A4530 @ =gBattleAnimTarget
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
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080A4514
	ldrh r0, [r5, 0x22]
	adds r0, 0x8
	strh r0, [r5, 0x22]
_080A4514:
	ldr r0, _080A4534 @ =sub_80A46CC
	str r0, [r5, 0x1C]
	ldr r0, _080A4538 @ =gBattleAnimArgs
	movs r2, 0x4
	ldrsh r1, [r0, r2]
	adds r3, r0, 0
	cmp r1, 0
	bne _080A453C
	ldrh r0, [r3]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	strh r0, [r5, 0x20]
	b _080A4550
	.align 2, 0
_080A4530: .4byte gBattleAnimTarget
_080A4534: .4byte sub_80A46CC
_080A4538: .4byte gBattleAnimArgs
_080A453C:
	ldrh r0, [r5, 0x20]
	ldrh r1, [r3]
	subs r0, r1
	strh r0, [r5, 0x20]
	adds r2, r5, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_080A4550:
	ldrh r0, [r3, 0x2]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	ldr r1, _080A4584 @ =0xfffffc00
	adds r0, r1, 0
	ldrh r2, [r5, 0x30]
	adds r1, r0, r2
	strh r1, [r5, 0x30]
	movs r2, 0x80
	lsls r2, 3
	adds r0, r2, 0
	ldrh r2, [r5, 0x32]
	adds r0, r2
	strh r0, [r5, 0x32]
	ldrh r0, [r3, 0x4]
	strh r0, [r5, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080A457E
	negs r0, r1
	strh r0, [r5, 0x30]
_080A457E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4584: .4byte 0xfffffc00
	thumb_func_end sub_80A44E0

	thumb_func_start sub_80A4588
sub_80A4588: @ 80A4588
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldr r0, _080A45A4 @ =gBattleAnimArgs
	movs r1, 0x6
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	beq _080A45A8
	cmp r0, 0x1
	ble _080A4624
	cmp r0, 0x2
	beq _080A45C8
	b _080A4624
	.align 2, 0
_080A45A4: .4byte gBattleAnimArgs
_080A45A8:
	ldr r5, _080A45C4 @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r4, 0x2
	eors r0, r4
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r5]
	eors r4, r0
	adds r0, r4, 0
	b _080A4634
	.align 2, 0
_080A45C4: .4byte gBattleAnimTarget
_080A45C8:
	ldr r5, _080A4620 @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r5]
	movs r2, 0x2
	mov r8, r2
	mov r1, r8
	eors r0, r1
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080A463E
	ldrb r0, [r5]
	mov r2, r8
	eors r0, r2
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, r7
	lsrs r7, r0, 1
	ldrb r0, [r5]
	mov r1, r8
	eors r0, r1
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	lsrs r4, r0, 1
	b _080A463E
	.align 2, 0
_080A4620: .4byte gBattleAnimTarget
_080A4624:
	ldr r4, _080A4670 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r4]
_080A4634:
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r4, r0, 24
_080A463E:
	strh r7, [r6, 0x20]
	strh r4, [r6, 0x22]
	ldr r0, _080A4670 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080A4656
	ldrh r0, [r6, 0x22]
	adds r0, 0x8
	strh r0, [r6, 0x22]
_080A4656:
	ldr r0, _080A4674 @ =sub_80A46CC
	str r0, [r6, 0x1C]
	ldr r0, _080A4678 @ =gBattleAnimArgs
	movs r2, 0x4
	ldrsh r1, [r0, r2]
	adds r3, r0, 0
	cmp r1, 0
	bne _080A467C
	ldrh r0, [r3]
	ldrh r1, [r6, 0x20]
	adds r0, r1
	strh r0, [r6, 0x20]
	b _080A4690
	.align 2, 0
_080A4670: .4byte gBattleAnimTarget
_080A4674: .4byte sub_80A46CC
_080A4678: .4byte gBattleAnimArgs
_080A467C:
	ldrh r0, [r6, 0x20]
	ldrh r1, [r3]
	subs r0, r1
	strh r0, [r6, 0x20]
	adds r2, r6, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_080A4690:
	ldrh r0, [r3, 0x2]
	ldrh r2, [r6, 0x22]
	adds r0, r2
	strh r0, [r6, 0x22]
	ldr r1, _080A46C8 @ =0xfffffc00
	adds r0, r1, 0
	ldrh r2, [r6, 0x30]
	adds r1, r0, r2
	strh r1, [r6, 0x30]
	movs r2, 0x80
	lsls r2, 3
	adds r0, r2, 0
	ldrh r2, [r6, 0x32]
	adds r0, r2
	strh r0, [r6, 0x32]
	ldrh r0, [r3, 0x4]
	strh r0, [r6, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080A46BE
	negs r0, r1
	strh r0, [r6, 0x30]
_080A46BE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A46C8: .4byte 0xfffffc00
	thumb_func_end sub_80A4588

	thumb_func_start sub_80A46CC
sub_80A46CC: @ 80A46CC
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	ldrh r2, [r4, 0x34]
	adds r0, r1, r2
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080A46EE
	adds r0, r1, 0
	adds r0, 0x18
	b _080A46F2
_080A46EE:
	adds r0, r1, 0
	subs r0, 0x18
_080A46F2:
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	subs r0, 0x18
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _080A4728
	ldr r1, _080A4730 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	movs r0, 0x3
	strh r0, [r4, 0x2E]
	ldr r0, _080A4734 @ =sub_8074C44
	str r0, [r4, 0x1C]
_080A4728:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4730: .4byte DestroyAnimSprite
_080A4734: .4byte sub_8074C44
	thumb_func_end sub_80A46CC

	thumb_func_start sub_80A4738
sub_80A4738: @ 80A4738
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0x32]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	cmp r0, 0x1
	ble _080A47DC
	ldrh r1, [r5, 0x34]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A4794
	adds r3, r5, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r1
	strb r0, [r3]
	ldr r4, _080A4790 @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r3, [r0]
	adds r1, r2, 0
	ands r1, r3
	strb r1, [r0]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	b _080A47CA
	.align 2, 0
_080A4790: .4byte gSprites
_080A4794:
	adds r1, r5, 0
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r3, _080A47D8 @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
_080A47CA:
	movs r0, 0
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	b _080A47E0
	.align 2, 0
_080A47D8: .4byte gSprites
_080A47DC:
	adds r0, r1, 0x1
	strh r0, [r5, 0x32]
_080A47E0:
	movs r1, 0x34
	ldrsh r0, [r5, r1]
	cmp r0, 0xA
	bne _080A4810
	movs r2, 0x2E
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080A4818 @ =gSprites
	adds r0, r4
	bl DestroySprite
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	adds r0, r5, 0
	bl DestroyAnimSprite
_080A4810:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4818: .4byte gSprites
	thumb_func_end sub_80A4738

	thumb_func_start sub_80A481C
sub_80A481C: @ 80A481C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080A483C @ =gBattleAnimArgs
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x2E]
	ldr r0, _080A4840 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A4844
	ldrh r0, [r5, 0x20]
	ldrh r1, [r4]
	subs r0, r1
	b _080A484A
	.align 2, 0
_080A483C: .4byte gBattleAnimArgs
_080A4840: .4byte gBattleAnimAttacker
_080A4844:
	ldrh r0, [r4]
	ldrh r1, [r5, 0x20]
	adds r0, r1
_080A484A:
	strh r0, [r5, 0x20]
	ldr r4, _080A4878 @ =gBattleAnimArgs
	ldrb r1, [r4, 0xA]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldrh r0, [r4, 0x6]
	negs r0, r0
	strh r0, [r5, 0x30]
	ldrh r0, [r4, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x34]
	ldr r1, _080A487C @ =sub_80A4880
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4878: .4byte gBattleAnimArgs
_080A487C: .4byte sub_80A4880
	thumb_func_end sub_80A481C

	thumb_func_start sub_80A4880
sub_80A4880: @ 80A4880
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x64
	bl Cos
	strh r0, [r4, 0x24]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r1, 0x14
	bl Sin
	strh r0, [r4, 0x26]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	bgt _080A48AC
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0
	b _080A48B2
_080A48AC:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0xE
_080A48B2:
	strb r0, [r1]
	ldrh r0, [r4, 0x30]
	ldrh r2, [r4, 0x2E]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x38]
	adds r0, 0x82
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080A48E8
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A48E8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A4880

	thumb_func_start sub_80A48F0
sub_80A48F0: @ 80A48F0
	push {r4-r6,lr}
	adds r5, r0, 0
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080A4906
	ldr r1, _080A4964 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	adds r0, 0x8
	strh r0, [r1, 0x2]
_080A4906:
	ldr r6, _080A4968 @ =gBattleAnimAttacker
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8074844
	lsls r0, 24
	ldr r4, _080A4964 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrb r0, [r6]
	movs r1, 0x1
	bl sub_8074844
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x2]
	adds r0, r4
	strh r0, [r5, 0x22]
	ldrb r0, [r6]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A4944
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080A496C
_080A4944:
	ldrb r0, [r6]
	bl sub_8076884
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r5, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x5]
	b _080A4984
	.align 2, 0
_080A4964: .4byte gBattleAnimArgs
_080A4968: .4byte gBattleAnimAttacker
_080A496C:
	ldrb r0, [r6]
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
_080A4984:
	ldr r0, _080A49C8 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r5, 0x2E]
	ldr r0, _080A49CC @ =0x00002828
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	strh r0, [r5, 0x32]
	movs r4, 0x10
	movs r0, 0x10
	strh r0, [r5, 0x3C]
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	ldrh r0, [r5, 0x3C]
	lsls r1, r0, 8
	subs r4, r0
	orrs r1, r4
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	ldr r0, _080A49D0 @ =sub_80A49D4
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A49C8: .4byte gBattleAnimArgs
_080A49CC: .4byte 0x00002828
_080A49D0: .4byte sub_80A49D4
	thumb_func_end sub_80A48F0

	thumb_func_start sub_80A49D4
sub_80A49D4: @ 80A49D4
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x38]
	adds r0, 0x60
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080A4A32
	movs r0, 0
	strh r0, [r4, 0x30]
	ldr r1, _080A4A7C @ =gPlttBufferFaded
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	adds r0, 0x1
	lsls r0, 1
	adds r0, r1
	ldrh r5, [r0]
	movs r2, 0
	adds r6, r1, 0
	adds r3, r6, 0
_080A4A0C:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	adds r2, 0x1
	adds r0, r2
	lsls r1, r0, 1
	adds r1, r3
	adds r0, 0x1
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	cmp r2, 0x5
	ble _080A4A0C
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	adds r0, 0x7
	lsls r0, 1
	adds r0, r6
	strh r5, [r0]
_080A4A32:
	ldrh r2, [r4, 0x3C]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	ble _080A4A6C
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	ble _080A4A80
	ldrh r0, [r4, 0x3A]
	adds r0, 0x1
	strh r0, [r4, 0x3A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080A4A6C
	movs r0, 0
	strh r0, [r4, 0x3A]
	subs r2, 0x1
	strh r2, [r4, 0x3C]
	lsls r1, r2, 8
	movs r0, 0x10
	subs r0, r2
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
_080A4A6C:
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080A4A80
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	b _080A4AC2
	.align 2, 0
_080A4A7C: .4byte gPlttBufferFaded
_080A4A80:
	ldrh r0, [r4, 0x3A]
	adds r0, 0x1
	strh r0, [r4, 0x3A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080A4AC2
	movs r0, 0
	strh r0, [r4, 0x3A]
	ldrh r2, [r4, 0x3C]
	adds r2, 0x1
	strh r2, [r4, 0x3C]
	lsls r1, r2, 8
	movs r0, 0x10
	subs r0, r2
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _080A4AC2
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080A4AC8 @ =sub_8074F88
	str r0, [r4, 0x1C]
_080A4AC2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A4AC8: .4byte sub_8074F88
	thumb_func_end sub_80A49D4

	thumb_func_start sub_80A4ACC
sub_80A4ACC: @ 80A4ACC
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _080A4B2C @ =gBattleAnimTarget
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0x20]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080A4B30 @ =0x0000ffe8
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r5, [r4, 0x2E]
	strh r5, [r4, 0x30]
	strh r5, [r4, 0x32]
	strh r5, [r4, 0x34]
	strh r5, [r4, 0x36]
	strh r5, [r4, 0x3A]
	movs r0, 0x10
	strh r0, [r4, 0x3C]
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	ldrh r1, [r4, 0x3C]
	lsls r1, 8
	ldrh r0, [r4, 0x3A]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	ldr r0, _080A4B34 @ =sub_80A4B38
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A4B2C: .4byte gBattleAnimTarget
_080A4B30: .4byte 0x0000ffe8
_080A4B34: .4byte sub_80A4B38
	thumb_func_end sub_80A4ACC

	thumb_func_start sub_80A4B38
sub_80A4B38: @ 80A4B38
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080A4B46
	b _080A4C90
_080A4B46:
	lsls r0, 2
	ldr r1, _080A4B50 @ =_080A4B54
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A4B50: .4byte _080A4B54
	.align 2, 0
_080A4B54:
	.4byte _080A4B68
	.4byte _080A4BCC
	.4byte _080A4BE8
	.4byte _080A4C66
	.4byte _080A4C7A
_080A4B68:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	cmp r0, 0
	bgt _080A4B76
	b _080A4C90
_080A4B76:
	movs r0, 0
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A4B98
	ldrh r1, [r4, 0x3A]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080A4BA6
	adds r0, r1, 0x1
	strh r0, [r4, 0x3A]
	b _080A4BA6
_080A4B98:
	ldrh r1, [r4, 0x3C]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080A4BA6
	subs r0, r1, 0x1
	strh r0, [r4, 0x3C]
_080A4BA6:
	ldrh r1, [r4, 0x3C]
	lsls r1, 8
	ldrh r0, [r4, 0x3A]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _080A4C90
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080A4C90
	strh r0, [r4, 0x30]
	b _080A4C72
_080A4BCC:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080A4C90
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	b _080A4C72
_080A4BE8:
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0x4
	bl sub_80A4C98
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080A4C0A
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
_080A4C0A:
	ldrh r0, [r4, 0x32]
	adds r1, r0, 0x1
	strh r1, [r4, 0x32]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x1D
	ble _080A4C90
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080A4C30
	ldrh r1, [r4, 0x3A]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080A4C3E
	subs r0, r1, 0x1
	strh r0, [r4, 0x3A]
	b _080A4C3E
_080A4C30:
	ldrh r1, [r4, 0x3C]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080A4C3E
	adds r0, r1, 0x1
	strh r0, [r4, 0x3C]
_080A4C3E:
	ldrh r1, [r4, 0x3C]
	lsls r1, 8
	ldrh r0, [r4, 0x3A]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	cmp r1, 0
	bne _080A4C90
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0x10
	bne _080A4C90
	strh r1, [r4, 0x30]
	strh r1, [r4, 0x32]
	b _080A4C72
_080A4C66:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080A4C72:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080A4C90
_080A4C7A:
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A4C90:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A4B38

	thumb_func_start sub_80A4C98
sub_80A4C98: @ 80A4C98
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0xB
	bgt _080A4CAA
	ldrh r0, [r4, 0x36]
	adds r0, 0x2
	strh r0, [r4, 0x36]
_080A4CAA:
	ldrh r5, [r4, 0x34]
	adds r0, r5, 0
	subs r0, 0x12
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	cmp r0, 0x17
	bhi _080A4CC0
	ldrh r0, [r4, 0x36]
	subs r0, 0x2
	strh r0, [r4, 0x36]
_080A4CC0:
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x2F
	ble _080A4CCE
	ldrh r0, [r4, 0x36]
	adds r0, 0x2
	strh r0, [r4, 0x36]
_080A4CCE:
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r1, 0x9
	bl __divsi3
	strh r0, [r4, 0x24]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r1, 0xE
	bl __divsi3
	strh r0, [r4, 0x26]
	lsls r0, 16
	cmp r0, 0
	bge _080A4CF4
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4, 0x26]
_080A4CF4:
	adds r0, r5, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3B
	ble _080A4D04
	movs r0, 0
	strh r0, [r4, 0x34]
_080A4D04:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A4C98

	thumb_func_start sub_80A4D0C
sub_80A4D0C: @ 80A4D0C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080A4D50 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080A4D20
	adds r0, r4, 0
	bl sub_8074FCC
_080A4D20:
	movs r0, 0
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl sub_8074FF8
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r5, 0xA]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x32]
	ldr r1, _080A4D54 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080A4D58 @ =sub_8074D00
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4D50: .4byte gBattleAnimArgs
_080A4D54: .4byte DestroyAnimSprite
_080A4D58: .4byte sub_8074D00
	thumb_func_end sub_80A4D0C

	thumb_func_start sub_80A4D5C
sub_80A4D5C: @ 80A4D5C
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _080A4D70 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A4D78
	ldr r0, _080A4D74 @ =gBattleAnimAttacker
	b _080A4D7A
	.align 2, 0
_080A4D70: .4byte gBattleAnimArgs
_080A4D74: .4byte gBattleAnimAttacker
_080A4D78:
	ldr r0, _080A4DBC @ =gBattleAnimTarget
_080A4D7A:
	ldrb r6, [r0]
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _080A4DC4
	movs r1, 0x2
	adds r0, r6, 0
	eors r0, r1
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080A4DC4
	ldr r4, _080A4DC0 @ =gBattleAnimArgs
	ldrb r1, [r4, 0xC]
	adds r2, r5, 0
	adds r2, 0x20
	adds r3, r5, 0
	adds r3, 0x22
	adds r0, r6, 0
	bl sub_8076D9C
	movs r2, 0
	ldrsh r1, [r4, r2]
	adds r0, r5, 0
	bl sub_8074FF8
	ldrh r0, [r4, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	b _080A4E14
	.align 2, 0
_080A4DBC: .4byte gBattleAnimTarget
_080A4DC0: .4byte gBattleAnimArgs
_080A4DC4:
	ldr r4, _080A4DE4 @ =gBattleAnimArgs
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080A4DE8
	adds r0, r6, 0
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	adds r0, r6, 0
	movs r1, 0x1
	b _080A4DFA
	.align 2, 0
_080A4DE4: .4byte gBattleAnimArgs
_080A4DE8:
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	adds r0, r6, 0
	movs r1, 0x3
_080A4DFA:
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x2]
	adds r0, r4
	strh r0, [r5, 0x22]
	ldr r0, _080A4E34 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r0, r5, 0
	bl sub_8074FF8
_080A4E14:
	ldr r1, _080A4E34 @ =gBattleAnimArgs
	ldrh r0, [r1, 0xA]
	strh r0, [r5, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x32]
	ldr r1, _080A4E38 @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080A4E3C @ =sub_8074D00
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A4E34: .4byte gBattleAnimArgs
_080A4E38: .4byte DestroyAnimSprite
_080A4E3C: .4byte sub_8074D00
	thumb_func_end sub_80A4D5C

	thumb_func_start sub_80A4E40
sub_80A4E40: @ 80A4E40
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8074FCC
	ldr r0, _080A4E6C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080A4E74
	ldr r0, _080A4E70 @ =gBattleAnimArgs
	ldrh r1, [r0]
	ldrh r2, [r4, 0x20]
	adds r1, r2
	strh r1, [r4, 0x20]
	ldrh r0, [r0, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	b _080A4E8E
	.align 2, 0
_080A4E6C: .4byte gBattleAnimAttacker
_080A4E70: .4byte gBattleAnimArgs
_080A4E74:
	ldr r2, _080A4E98 @ =gBattleAnimArgs
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080A4E8E:
	ldr r0, _080A4E9C @ =sub_80A4EA0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4E98: .4byte gBattleAnimArgs
_080A4E9C: .4byte sub_80A4EA0
	thumb_func_end sub_80A4E40

	thumb_func_start sub_80A4EA0
sub_80A4EA0: @ 80A4EA0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	ble _080A4ED8
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r0, 0x1E
	subs r0, r1
	movs r1, 0x3
	bl __divsi3
	strh r0, [r4, 0x26]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	lsls r0, 18
	asrs r0, 16
	movs r1, 0x3
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
_080A4ED8:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080A4EEC
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A4EEC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A4EA0

	thumb_func_start sub_80A4EF4
sub_80A4EF4: @ 80A4EF4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8074FCC
	ldr r0, _080A4F24 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080A4F2C
	ldr r1, _080A4F28 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	movs r0, 0x1
	strh r0, [r4, 0x34]
	b _080A4F4A
	.align 2, 0
_080A4F24: .4byte gBattleAnimAttacker
_080A4F28: .4byte gBattleAnimArgs
_080A4F2C:
	ldr r2, _080A4F54 @ =gBattleAnimArgs
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldr r0, _080A4F58 @ =0x0000ffff
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080A4F4A:
	ldr r0, _080A4F5C @ =sub_80A4F60
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4F54: .4byte gBattleAnimArgs
_080A4F58: .4byte 0x0000ffff
_080A4F5C: .4byte sub_80A4F60
	thumb_func_end sub_80A4EF4

	thumb_func_start sub_80A4F60
sub_80A4F60: @ 80A4F60
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x28
	bl __divsi3
	negs r0, r0
	strh r0, [r4, 0x26]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r4, 0x24]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	lsls r0, 1
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x30]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _080A4FA4
	adds r0, r4, 0
	bl move_anim_8074EE0
_080A4FA4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A4F60

	thumb_func_start sub_80A4FAC
sub_80A4FAC: @ 80A4FAC
	push {lr}
	ldrh r1, [r0, 0x20]
	subs r1, 0x20
	strh r1, [r0, 0x20]
	ldrh r1, [r0, 0x22]
	subs r1, 0x20
	strh r1, [r0, 0x22]
	movs r1, 0x14
	strh r1, [r0, 0x2E]
	ldr r1, _080A4FCC @ =sub_8074C44
	str r1, [r0, 0x1C]
	ldr r1, _080A4FD0 @ =sub_80A4FD4
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_080A4FCC: .4byte sub_8074C44
_080A4FD0: .4byte sub_80A4FD4
	thumb_func_end sub_80A4FAC

	thumb_func_start sub_80A4FD4
sub_80A4FD4: @ 80A4FD4
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r6, [r5, 0x38]
	movs r1, 0x1
	adds r0, r1, 0
	ands r0, r6
	cmp r0, 0
	beq _080A4FEA
	cmp r0, 0x1
	beq _080A5004
	b _080A506A
_080A4FEA:
	strh r1, [r5, 0x2E]
	ldr r0, _080A4FFC @ =sub_8074C44
	str r0, [r5, 0x1C]
	ldr r1, _080A5000 @ =sub_80A4FD4
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	b _080A506A
	.align 2, 0
_080A4FFC: .4byte sub_8074C44
_080A5000: .4byte sub_80A4FD4
_080A5004:
	ldrh r3, [r5, 0x24]
	ldrh r0, [r5, 0x20]
	adds r3, r0
	movs r0, 0
	strh r3, [r5, 0x20]
	ldrh r4, [r5, 0x26]
	ldrh r1, [r5, 0x22]
	adds r4, r1
	strh r4, [r5, 0x22]
	strh r0, [r5, 0x26]
	strh r0, [r5, 0x24]
	movs r0, 0x8
	strh r0, [r5, 0x2E]
	ldr r2, _080A5078 @ =gUnknown_83E3548
	lsls r0, r6, 16
	asrs r0, 24
	lsls r0, 1
	adds r1, r0, r2
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	adds r3, r1
	strh r3, [r5, 0x32]
	adds r2, 0x1
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r4, r0
	strh r4, [r5, 0x36]
	ldr r0, _080A507C @ =sub_8075590
	str r0, [r5, 0x1C]
	ldr r1, _080A5080 @ =sub_80A5084
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1, 0
	ldrh r1, [r5, 0x38]
	adds r0, r1
	strh r0, [r5, 0x38]
	movs r0, 0x3F
	bl sub_8073A44
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xCB
	bl PlaySE12WithPanning
_080A506A:
	ldrh r0, [r5, 0x38]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r5, 0x38]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A5078: .4byte gUnknown_83E3548
_080A507C: .4byte sub_8075590
_080A5080: .4byte sub_80A5084
	thumb_func_end sub_80A4FD4

	thumb_func_start sub_80A5084
sub_80A5084: @ 80A5084
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x38]
	lsls r0, 16
	asrs r0, 24
	cmp r0, 0x4
	bne _080A50AC
	movs r0, 0xA
	strh r0, [r2, 0x2E]
	ldr r0, _080A50A4 @ =sub_8074C44
	str r0, [r2, 0x1C]
	ldr r1, _080A50A8 @ =sub_80A50B8
	adds r0, r2, 0
	bl StoreSpriteCallbackInData6
	b _080A50B0
	.align 2, 0
_080A50A4: .4byte sub_8074C44
_080A50A8: .4byte sub_80A50B8
_080A50AC:
	ldr r0, _080A50B4 @ =sub_80A4FD4
	str r0, [r2, 0x1C]
_080A50B0:
	pop {r0}
	bx r0
	.align 2, 0
_080A50B4: .4byte sub_80A4FD4
	thumb_func_end sub_80A5084

	thumb_func_start sub_80A50B8
sub_80A50B8: @ 80A50B8
	push {r4-r7,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0x6]
	cmp r1, 0
	bne _080A50E0
	movs r0, 0x3
	strh r0, [r5, 0x2E]
	strh r1, [r5, 0x30]
	strh r1, [r5, 0x32]
	ldr r0, _080A50D8 @ =sub_8074C44
	str r0, [r5, 0x1C]
	ldr r1, _080A50DC @ =sub_80A5174
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	b _080A5160
	.align 2, 0
_080A50D8: .4byte sub_8074C44
_080A50DC: .4byte sub_80A5174
_080A50E0:
	ldrh r0, [r5, 0x6]
	cmp r0, 0x2
	beq _080A5100
	cmp r0, 0x2
	bgt _080A50F0
	cmp r0, 0x1
	beq _080A50F6
	b _080A5114
_080A50F0:
	cmp r0, 0x3
	beq _080A5108
	b _080A5114
_080A50F6:
	ldr r6, _080A50FC @ =0x0000fff8
	adds r7, r6, 0
	b _080A5118
	.align 2, 0
_080A50FC: .4byte 0x0000fff8
_080A5100:
	ldr r7, _080A5104 @ =0x0000fff8
	b _080A5116
	.align 2, 0
_080A5104: .4byte 0x0000fff8
_080A5108:
	movs r7, 0x8
	ldr r6, _080A5110 @ =0x0000fff8
	b _080A5118
	.align 2, 0
_080A5110: .4byte 0x0000fff8
_080A5114:
	movs r7, 0x8
_080A5116:
	movs r6, 0x8
_080A5118:
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
	movs r0, 0x6
	strh r0, [r5, 0x2E]
	ldr r4, _080A5168 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, r7
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, r6
	strh r0, [r5, 0x36]
	ldr r0, _080A516C @ =sub_8075590
	str r0, [r5, 0x1C]
	ldr r1, _080A5170 @ =sub_80A5220
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
_080A5160:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5168: .4byte gBattleAnimTarget
_080A516C: .4byte sub_8075590
_080A5170: .4byte sub_80A5220
	thumb_func_end sub_80A50B8

	thumb_func_start sub_80A5174
sub_80A5174: @ 80A5174
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080A5194
	ldrh r0, [r4, 0x30]
	adds r0, 0x3
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080A51A4
	movs r0, 0x10
	b _080A51A2
_080A5194:
	ldrh r0, [r4, 0x30]
	subs r0, 0x3
	strh r0, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	bge _080A51A4
	movs r0, 0
_080A51A2:
	strh r0, [r4, 0x30]
_080A51A4:
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x1
	bl sub_8075BE8
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080A5200 @ =0x00007fff
	bl BlendPalettes
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	cmp r0, 0x10
	bne _080A520C
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	ldrb r1, [r4, 0x5]
	lsrs r1, 4
	lsls r0, r1, 5
	ldr r2, _080A5204 @ =gPlttBufferUnfaded + 0x210
	adds r0, r2
	lsls r1, 4
	ldr r3, _080A5208 @ =0x00000101
	adds r2, r3, 0
	orrs r1, r2
	movs r2, 0x4
	bl LoadPalette
	movs r0, 0x3F
	bl sub_8073A44
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xB9
	bl PlaySE12WithPanning
	b _080A5214
	.align 2, 0
_080A5200: .4byte 0x00007fff
_080A5204: .4byte gPlttBufferUnfaded + 0x210
_080A5208: .4byte 0x00000101
_080A520C:
	cmp r0, 0
	bne _080A5214
	ldr r0, _080A521C @ =sub_80A5220
	str r0, [r4, 0x1C]
_080A5214:
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A521C: .4byte sub_80A5220
	thumb_func_end sub_80A5174

	thumb_func_start sub_80A5220
sub_80A5220: @ 80A5220
	push {lr}
	adds r2, r0, 0
	ldr r0, _080A523C @ =gBattleAnimArgs
	ldrh r1, [r0, 0xE]
	ldr r0, _080A5240 @ =0x0000ffff
	cmp r1, r0
	bne _080A5238
	movs r0, 0
	strh r0, [r2, 0x30]
	strh r0, [r2, 0x2E]
	ldr r0, _080A5244 @ =sub_80A5248
	str r0, [r2, 0x1C]
_080A5238:
	pop {r0}
	bx r0
	.align 2, 0
_080A523C: .4byte gBattleAnimArgs
_080A5240: .4byte 0x0000ffff
_080A5244: .4byte sub_80A5248
	thumb_func_end sub_80A5220

	thumb_func_start sub_80A5248
sub_80A5248: @ 80A5248
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _080A527C
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080A527C:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	bne _080A5290
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A5290:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5248

	thumb_func_start sub_80A5298
sub_80A5298: @ 80A5298
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _080A52B8 @ =gBattleAnimArgs
	ldrh r0, [r0]
	strh r0, [r3, 0x6]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080A52BC
	ldrh r0, [r3, 0x20]
	subs r0, 0x18
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x22]
	subs r0, 0x18
	strh r0, [r3, 0x22]
	b _080A530E
	.align 2, 0
_080A52B8: .4byte gBattleAnimArgs
_080A52BC:
	cmp r0, 0x2
	bne _080A52D8
	ldrh r0, [r3, 0x20]
	subs r0, 0x18
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x22]
	adds r0, 0x18
	strh r0, [r3, 0x22]
	ldrb r1, [r3, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x20
	b _080A530A
_080A52D8:
	cmp r0, 0x3
	bne _080A52F4
	ldrh r0, [r3, 0x20]
	adds r0, 0x18
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x22]
	subs r0, 0x18
	strh r0, [r3, 0x22]
	ldrb r1, [r3, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x10
	b _080A530A
_080A52F4:
	ldrh r0, [r3, 0x20]
	adds r0, 0x18
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x22]
	adds r0, 0x18
	strh r0, [r3, 0x22]
	ldrb r1, [r3, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x30
_080A530A:
	orrs r0, r1
	strb r0, [r3, 0x3]
_080A530E:
	ldrh r2, [r3, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x10
	ldr r4, _080A5334 @ =0x000003ff
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _080A5338 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	ldr r1, _080A533C @ =sub_80A4FAC
	str r1, [r3, 0x1C]
	adds r0, r3, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5334: .4byte 0x000003ff
_080A5338: .4byte 0xfffffc00
_080A533C: .4byte sub_80A4FAC
	thumb_func_end sub_80A5298

	thumb_func_start sub_80A5340
sub_80A5340: @ 80A5340
	push {lr}
	adds r3, r0, 0
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0
	strh r0, [r3, 0x2E]
	ldr r0, _080A5368 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	beq _080A537C
	cmp r0, 0x1
	bgt _080A536C
	cmp r0, 0
	beq _080A5372
	b _080A538C
	.align 2, 0
_080A5368: .4byte gBattleAnimArgs
_080A536C:
	cmp r0, 0x2
	beq _080A5384
	b _080A538C
_080A5372:
	ldr r0, _080A5378 @ =sub_80A5398
	b _080A538E
	.align 2, 0
_080A5378: .4byte sub_80A5398
_080A537C:
	ldr r0, _080A5380 @ =sub_80A5474
	b _080A538E
	.align 2, 0
_080A5380: .4byte sub_80A5474
_080A5384:
	ldr r0, _080A5388 @ =sub_80A54C4
	b _080A538E
	.align 2, 0
_080A5388: .4byte sub_80A54C4
_080A538C:
	ldr r0, _080A5394 @ =sub_80A5584
_080A538E:
	str r0, [r3, 0x1C]
	pop {r0}
	bx r0
	.align 2, 0
_080A5394: .4byte sub_80A5584
	thumb_func_end sub_80A5340

	thumb_func_start sub_80A5398
sub_80A5398: @ 80A5398
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x6
	strh r0, [r4, 0x2E]
	ldr r5, _080A53D8 @ =gBattleAnimAttacker
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, 24
	movs r2, 0x2
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	beq _080A53B6
	movs r1, 0x2
_080A53B6:
	strh r1, [r4, 0x30]
	movs r0, 0
	strh r0, [r4, 0x32]
	ldr r1, _080A53DC @ =gUnknown_2023D44
	ldrb r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4, 0x34]
	ldr r1, _080A53E0 @ =sub_80A53E8
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080A53E4 @ =sub_8074DC4
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A53D8: .4byte gBattleAnimAttacker
_080A53DC: .4byte gUnknown_2023D44
_080A53E0: .4byte sub_80A53E8
_080A53E4: .4byte sub_8074DC4
	thumb_func_end sub_80A5398

	thumb_func_start sub_80A53E8
sub_80A53E8: @ 80A53E8
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r0, 0x2E
	ldrsh r6, [r5, r0]
	cmp r6, 0
	bne _080A5424
	ldr r1, _080A5464 @ =gUnknown_2023D44
	ldr r4, _080A5468 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r5, 0x34]
	movs r1, 0
	bl sub_80758E0
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x3A]
	ldr r2, _080A546C @ =0xfffffd00
	adds r1, r2, 0
	cmp r0, 0
	beq _080A5420
	movs r0, 0xC0
	lsls r0, 2
	adds r1, r0, 0
_080A5420:
	strh r1, [r5, 0x36]
	strh r6, [r5, 0x38]
_080A5424:
	ldrh r0, [r5, 0x36]
	ldrh r1, [r5, 0x38]
	adds r0, r1
	strh r0, [r5, 0x38]
	ldrh r0, [r5, 0x34]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r5, 0x38]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r5, 0x34]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80759DC
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080A545E
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldr r0, _080A5470 @ =sub_80A5584
	str r0, [r5, 0x1C]
_080A545E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A5464: .4byte gUnknown_2023D44
_080A5468: .4byte gBattleAnimAttacker
_080A546C: .4byte 0xfffffd00
_080A5470: .4byte sub_80A5584
	thumb_func_end sub_80A53E8

	thumb_func_start sub_80A5474
sub_80A5474: @ 80A5474
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x4
	strh r0, [r4, 0x2E]
	ldr r5, _080A54B4 @ =gBattleAnimAttacker
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, 24
	movs r1, 0x3
	cmp r0, 0
	beq _080A5492
	movs r0, 0x3
	negs r0, r0
	adds r1, r0, 0
_080A5492:
	strh r1, [r4, 0x30]
	movs r0, 0
	strh r0, [r4, 0x32]
	ldr r1, _080A54B8 @ =gUnknown_2023D44
	ldrb r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4, 0x34]
	ldr r1, _080A54BC @ =sub_80A5584
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080A54C0 @ =sub_8074DC4
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A54B4: .4byte gBattleAnimAttacker
_080A54B8: .4byte gUnknown_2023D44
_080A54BC: .4byte sub_80A5584
_080A54C0: .4byte sub_8074DC4
	thumb_func_end sub_80A5474

	thumb_func_start sub_80A54C4
sub_80A54C4: @ 80A54C4
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080A54DE
	movs r0, 0
	strh r0, [r1, 0x2E]
	ldr r0, _080A54E4 @ =sub_80A54E8
	str r0, [r1, 0x1C]
_080A54DE:
	pop {r0}
	bx r0
	.align 2, 0
_080A54E4: .4byte sub_80A54E8
	thumb_func_end sub_80A54C4

	thumb_func_start sub_80A54E8
sub_80A54E8: @ 80A54E8
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080A5538
	ldr r1, _080A5524 @ =gUnknown_2023D44
	ldr r4, _080A5528 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x3A]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A552C
	movs r0, 0xFC
	lsls r0, 8
	strh r0, [r5, 0x36]
	movs r0, 0xC0
	lsls r0, 4
	b _080A5536
	.align 2, 0
_080A5524: .4byte gUnknown_2023D44
_080A5528: .4byte gBattleAnimAttacker
_080A552C:
	movs r0, 0x80
	lsls r0, 3
	strh r0, [r5, 0x36]
	movs r0, 0xF4
	lsls r0, 8
_080A5536:
	strh r0, [r5, 0x38]
_080A5538:
	ldrh r0, [r5, 0x36]
	ldrh r1, [r5, 0x38]
	adds r0, r1
	strh r0, [r5, 0x38]
	ldrh r0, [r5, 0x34]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r5, 0x38]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r5, 0x34]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80759DC
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080A5578
	ldrh r0, [r5, 0x34]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8075980
	ldr r0, _080A5580 @ =sub_80A5584
	str r0, [r5, 0x1C]
_080A5578:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A5580: .4byte sub_80A5584
	thumb_func_end sub_80A54E8

	thumb_func_start sub_80A5584
sub_80A5584: @ 80A5584
	push {lr}
	bl DestroyAnimSprite
	pop {r0}
	bx r0
	thumb_func_end sub_80A5584

	thumb_func_start sub_80A5590
sub_80A5590: @ 80A5590
	movs r1, 0
	strh r1, [r0, 0x2E]
	ldr r1, _080A559C @ =sub_80A55A0
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080A559C: .4byte sub_80A55A0
	thumb_func_end sub_80A5590

	thumb_func_start sub_80A55A0
sub_80A55A0: @ 80A55A0
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _080A55FA
	cmp r5, 0x1
	bgt _080A55B6
	cmp r5, 0
	beq _080A55BC
	b _080A568E
_080A55B6:
	cmp r5, 0x2
	beq _080A564C
	b _080A568E
_080A55BC:
	strh r5, [r4, 0x30]
	ldr r1, _080A5640 @ =gUnknown_2023D44
	ldr r2, _080A5644 @ =gBattleAnimAttacker
	ldrb r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4, 0x32]
	ldrb r0, [r2]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x34]
	ldr r2, _080A5648 @ =0xfffffe00
	adds r1, r2, 0
	cmp r0, 0
	beq _080A55E4
	movs r0, 0x80
	lsls r0, 2
	adds r1, r0, 0
_080A55E4:
	strh r1, [r4, 0x36]
	strh r5, [r4, 0x38]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_80758E0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_080A55FA:
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x38]
	adds r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0x38]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80759DC
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080A568E
	movs r0, 0
	strh r0, [r4, 0x30]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	negs r0, r0
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080A568E
	.align 2, 0
_080A5640: .4byte gUnknown_2023D44
_080A5644: .4byte gBattleAnimAttacker
_080A5648: .4byte 0xfffffe00
_080A564C:
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x38]
	adds r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0x38]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80759DC
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080A568E
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8075980
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A568E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A55A0

	thumb_func_start sub_80A5694
sub_80A5694: @ 80A5694
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080A56D8 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	ldr r1, _080A56DC @ =gUnknown_2023D44
	ldr r2, _080A56E0 @ =gBattleAnimAttacker
	ldrb r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	movs r4, 0
	strh r0, [r5, 0x8]
	ldrb r0, [r2]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r2, r0, 24
	strh r2, [r5, 0xA]
	strh r4, [r5, 0xC]
	ldr r0, _080A56E4 @ =gBattleAnimArgs
	movs r3, 0
	ldrsh r1, [r0, r3]
	cmp r1, 0
	beq _080A56E8
	cmp r1, 0x1
	beq _080A5704
	adds r0, r6, 0
	bl DestroyAnimVisualTask
	b _080A5722
	.align 2, 0
_080A56D8: .4byte gTasks
_080A56DC: .4byte gUnknown_2023D44
_080A56E0: .4byte gBattleAnimAttacker
_080A56E4: .4byte gBattleAnimArgs
_080A56E8:
	strh r1, [r5, 0xC]
	movs r0, 0x8
	strh r0, [r5, 0xE]
	strh r1, [r5, 0x10]
	movs r0, 0x3
	strh r0, [r5, 0x12]
	cmp r2, 0
	bne _080A56FC
	negs r0, r0
	strh r0, [r5, 0x12]
_080A56FC:
	ldr r0, _080A5700 @ =sub_80A572C
	b _080A5720
	.align 2, 0
_080A5700: .4byte sub_80A572C
_080A5704:
	movs r0, 0x8
	strh r0, [r5, 0xE]
	movs r0, 0xC0
	lsls r0, 3
	strh r0, [r5, 0x10]
	movs r1, 0xC0
	strh r1, [r5, 0x12]
	cmp r2, 0
	bne _080A571E
	negs r0, r0
	strh r0, [r5, 0x10]
	negs r0, r1
	strh r0, [r5, 0x12]
_080A571E:
	ldr r0, _080A5728 @ =sub_80A58EC
_080A5720:
	str r0, [r5]
_080A5722:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A5728: .4byte sub_80A58EC
	thumb_func_end sub_80A5694

	thumb_func_start sub_80A572C
sub_80A572C: @ 80A572C
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080A5750 @ =gTasks
	adds r4, r0, r1
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080A5746
	b _080A58E6
_080A5746:
	lsls r0, 2
	ldr r1, _080A5754 @ =_080A5758
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A5750: .4byte gTasks
_080A5754: .4byte _080A5758
	.align 2, 0
_080A5758:
	.4byte _080A576C
	.4byte _080A579E
	.4byte _080A57F8
	.4byte _080A5870
	.4byte _080A58B4
_080A576C:
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	cmp r1, 0
	beq _080A577C
	ldrh r2, [r4, 0x12]
	ldrh r3, [r4, 0x10]
	adds r2, r3
	b _080A58C2
_080A577C:
	movs r0, 0x8
	strh r0, [r4, 0xE]
	strh r1, [r4, 0x10]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r1, 0xC0
	cmp r0, 0
	bne _080A5792
	movs r2, 0xC0
	negs r2, r2
	adds r1, r2, 0
_080A5792:
	strh r1, [r4, 0x12]
	ldrb r0, [r4, 0x8]
	movs r1, 0
	bl sub_80758E0
	b _080A58A8
_080A579E:
	movs r3, 0xE
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080A57C4
	ldrh r0, [r4, 0x12]
	ldrh r1, [r4, 0x10]
	adds r0, r1
	strh r0, [r4, 0x10]
	ldrb r0, [r4, 0x8]
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0x10]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrb r0, [r4, 0x8]
	bl sub_80759DC
	b _080A58D4
_080A57C4:
	movs r0, 0x8
	strh r0, [r4, 0xE]
	ldr r2, _080A57F4 @ =gSprites
	movs r3, 0x8
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x24]
	strh r0, [r4, 0x10]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _080A57EA
	movs r1, 0x2
_080A57EA:
	strh r1, [r4, 0x12]
	movs r0, 0x1
	strh r0, [r4, 0x14]
	b _080A58A8
	.align 2, 0
_080A57F4: .4byte gSprites
_080A57F8:
	ldrh r2, [r4, 0xE]
	movs r3, 0xE
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080A5854
	ldrh r1, [r4, 0x14]
	movs r3, 0x14
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080A5812
	subs r0, r1, 0x1
	strh r0, [r4, 0x14]
	b _080A58E6
_080A5812:
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _080A5834
	ldr r2, _080A5830 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x12]
	ldrh r2, [r4, 0x10]
	adds r1, r2
	b _080A5848
	.align 2, 0
_080A5830: .4byte gSprites
_080A5834:
	ldr r2, _080A5850 @ =gSprites
	movs r3, 0x8
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x10]
	ldrh r2, [r4, 0x12]
	subs r1, r2
_080A5848:
	strh r1, [r0, 0x24]
	movs r0, 0x1
	strh r0, [r4, 0x14]
	b _080A58D4
	.align 2, 0
_080A5850: .4byte gSprites
_080A5854:
	ldr r2, _080A586C @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x10]
	strh r1, [r0, 0x24]
	movs r0, 0xC
	strh r0, [r4, 0xE]
	b _080A58A8
	.align 2, 0
_080A586C: .4byte gSprites
_080A5870:
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080A5880
	subs r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _080A58E6
_080A5880:
	movs r0, 0x3
	strh r0, [r4, 0xE]
	ldr r2, _080A58B0 @ =gSprites
	movs r3, 0x8
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x24]
	strh r0, [r4, 0x10]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0x8
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _080A58A6
	movs r1, 0x8
_080A58A6:
	strh r1, [r4, 0x12]
_080A58A8:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	b _080A58E6
	.align 2, 0
_080A58B0: .4byte gSprites
_080A58B4:
	movs r3, 0xE
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080A58E0
	ldrh r2, [r4, 0x12]
	ldrh r0, [r4, 0x10]
	adds r2, r0
_080A58C2:
	strh r2, [r4, 0x10]
	ldr r3, _080A58DC @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r2, [r0, 0x24]
_080A58D4:
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	b _080A58E6
	.align 2, 0
_080A58DC: .4byte gSprites
_080A58E0:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080A58E6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A572C

	thumb_func_start sub_80A58EC
sub_80A58EC: @ 80A58EC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080A5928 @ =gTasks
	adds r4, r0, r1
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080A592C
	ldrh r0, [r4, 0x10]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0x10]
	ldrb r0, [r4, 0x8]
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0x10]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrb r0, [r4, 0x8]
	bl sub_80759DC
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	b _080A5938
	.align 2, 0
_080A5928: .4byte gTasks
_080A592C:
	ldrb r0, [r4, 0x8]
	bl sub_8075980
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080A5938:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A58EC

	thumb_func_start sub_80A5940
sub_80A5940: @ 80A5940
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080A5954 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080A595C
	ldr r4, _080A5958 @ =gBattleAnimAttacker
	b _080A595E
	.align 2, 0
_080A5954: .4byte gBattleAnimArgs
_080A5958: .4byte gBattleAnimAttacker
_080A595C:
	ldr r4, _080A599C @ =gBattleAnimTarget
_080A595E:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x2]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x4]
	adds r0, r6
	strh r0, [r5, 0x22]
	movs r0, 0
	strh r0, [r5, 0x2E]
	strh r0, [r5, 0x30]
	ldr r1, _080A59A0 @ =sub_80A5A8C
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080A59A4 @ =sub_8074F6C
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A599C: .4byte gBattleAnimTarget
_080A59A0: .4byte sub_80A5A8C
_080A59A4: .4byte sub_8074F6C
	thumb_func_end sub_80A5940

	thumb_func_start sub_80A59A8
sub_80A59A8: @ 80A59A8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080A59E0 @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080A59E4 @ =0x0000ffd0
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r1, _080A59E8 @ =sub_80A5A44
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080A59EC @ =sub_8074F6C
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A59E0: .4byte gBattleAnimTarget
_080A59E4: .4byte 0x0000ffd0
_080A59E8: .4byte sub_80A5A44
_080A59EC: .4byte sub_8074F6C
	thumb_func_end sub_80A59A8

	thumb_func_start sub_80A59F0
sub_80A59F0: @ 80A59F0
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r5, _080A5A34 @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080A5A38 @ =gBattleAnimArgs
	ldr r2, _080A5A3C @ =0x0000ffd0
	adds r0, r2
	ldrh r1, [r1]
	adds r0, r1
	movs r6, 0
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	strh r6, [r4, 0x2E]
	strh r6, [r4, 0x30]
	ldr r0, _080A5A40 @ =sub_80A5A8C
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A5A34: .4byte gBattleAnimTarget
_080A5A38: .4byte gBattleAnimArgs
_080A5A3C: .4byte 0x0000ffd0
_080A5A40: .4byte sub_80A5A8C
	thumb_func_end sub_80A59F0

	thumb_func_start sub_80A5A44
sub_80A5A44: @ 80A5A44
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080A5A6E
	movs r0, 0xC
	strh r0, [r4, 0x2E]
	movs r0, 0x8
	strh r0, [r4, 0x30]
	movs r0, 0
	strh r0, [r4, 0x32]
	ldr r1, _080A5A74 @ =sub_80A5A7C
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080A5A78 @ =sub_8074CD0
	str r0, [r4, 0x1C]
_080A5A6E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5A74: .4byte sub_80A5A7C
_080A5A78: .4byte sub_8074CD0
	thumb_func_end sub_80A5A44

	thumb_func_start sub_80A5A7C
sub_80A5A7C: @ 80A5A7C
	movs r1, 0
	strh r1, [r0, 0x2E]
	strh r1, [r0, 0x30]
	ldr r1, _080A5A88 @ =sub_80A5A8C
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080A5A88: .4byte sub_80A5A8C
	thumb_func_end sub_80A5A7C

	thumb_func_start sub_80A5A8C
sub_80A5A8C: @ 80A5A8C
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080A5AD4
	movs r0, 0
	strh r0, [r3, 0x2E]
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsrs r1, r2, 2
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080A5AD4
	adds r0, r3, 0
	bl DestroyAnimSprite
_080A5AD4:
	pop {r0}
	bx r0
	thumb_func_end sub_80A5A8C

	thumb_func_start sub_80A5AD8
sub_80A5AD8: @ 80A5AD8
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080A5AEC @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080A5AF4
	ldr r4, _080A5AF0 @ =gBattleAnimAttacker
	b _080A5AF6
	.align 2, 0
_080A5AEC: .4byte gBattleAnimArgs
_080A5AF0: .4byte gBattleAnimAttacker
_080A5AF4:
	ldr r4, _080A5B30 @ =gBattleAnimTarget
_080A5AF6:
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x2]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x4]
	adds r0, r6
	strh r0, [r5, 0x22]
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldr r0, _080A5B34 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x6]
	strh r0, [r5, 0x30]
	ldr r0, _080A5B38 @ =sub_80A5B3C
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A5B30: .4byte gBattleAnimTarget
_080A5B34: .4byte gBattleAnimArgs
_080A5B38: .4byte sub_80A5B3C
	thumb_func_end sub_80A5AD8

	thumb_func_start sub_80A5B3C
sub_80A5B3C: @ 80A5B3C
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x30
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble _080A5B5C
	movs r0, 0
	strh r0, [r2, 0x2E]
	ldrh r0, [r2, 0x22]
	subs r0, 0x1
	strh r0, [r2, 0x22]
_080A5B5C:
	ldrh r0, [r2, 0x22]
	ldrh r1, [r2, 0x2E]
	subs r0, r1
	strh r0, [r2, 0x22]
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080A5B78
	adds r0, r2, 0
	bl DestroyAnimSprite
_080A5B78:
	pop {r0}
	bx r0
	thumb_func_end sub_80A5B3C

	thumb_func_start sub_80A5B7C
sub_80A5B7C: @ 80A5B7C
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _080A5BC4 @ =gBattleAnimAttacker
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0x20]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0xC
	strh r0, [r4, 0x22]
	strh r5, [r4, 0x2E]
	movs r0, 0x2
	strh r0, [r4, 0x30]
	strh r5, [r4, 0x32]
	strh r5, [r4, 0x34]
	strh r5, [r4, 0x36]
	subs r0, 0x42
	bl sub_8073A44
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x38]
	ldr r0, _080A5BC8 @ =sub_80A5BCC
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A5BC4: .4byte gBattleAnimAttacker
_080A5BC8: .4byte sub_80A5BCC
	thumb_func_end sub_80A5B7C

	thumb_func_start sub_80A5BCC
sub_80A5BCC: @ 80A5BCC
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _080A5C38
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
	movs r1, 0x4
	ands r0, r1
	cmp r0, 0
	bne _080A5C1E
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080A5C1E
	ldrh r1, [r4, 0x38]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xBB
	bl PlaySE12WithPanning
_080A5C1E:
	movs r1, 0
	strh r1, [r4, 0x2E]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080A5C38
	strh r1, [r4, 0x32]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
_080A5C38:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080A5C62
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	ble _080A5C62
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080A5C62
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A5C62:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5BCC

	thumb_func_start sub_80A5C68
sub_80A5C68: @ 80A5C68
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080A5CB2
	ldr r4, _080A5CC8 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	ldr r5, _080A5CCC @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r5]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x2]
	adds r0, r5
	strh r0, [r6, 0x22]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080A5CAC
	ldrh r0, [r6, 0x22]
	adds r0, 0xA
	strh r0, [r6, 0x22]
_080A5CAC:
	ldrh r0, [r6, 0x2E]
	adds r0, 0x1
	strh r0, [r6, 0x2E]
_080A5CB2:
	ldr r0, _080A5CCC @ =gBattleAnimArgs
	ldrh r1, [r0, 0xE]
	ldr r0, _080A5CD0 @ =0x0000ffff
	cmp r1, r0
	bne _080A5CC2
	adds r0, r6, 0
	bl DestroyAnimSprite
_080A5CC2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A5CC8: .4byte gBattleAnimAttacker
_080A5CCC: .4byte gBattleAnimArgs
_080A5CD0: .4byte 0x0000ffff
	thumb_func_end sub_80A5C68

	thumb_func_start sub_80A5CD4
sub_80A5CD4: @ 80A5CD4
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080A5CF4 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080A5D00
	ldr r1, _080A5CF8 @ =gBattleAnimArgs
	ldr r0, _080A5CFC @ =0x0000ffff
	strh r0, [r1, 0xE]
	b _080A5D3E
	.align 2, 0
_080A5CF4: .4byte gTasks
_080A5CF8: .4byte gBattleAnimArgs
_080A5CFC: .4byte 0x0000ffff
_080A5D00:
	cmp r0, 0x2
	bne _080A5D0C
	adds r0, r2, 0
	bl DestroyAnimVisualTask
	b _080A5D44
_080A5D0C:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080A5D44
	movs r0, 0
	strh r0, [r4, 0x8]
	ldrh r2, [r4, 0xA]
	adds r2, 0x1
	strh r2, [r4, 0xA]
	lsls r1, r2, 8
	movs r0, 0x10
	subs r0, r2
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _080A5D44
_080A5D3E:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_080A5D44:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5CD4

	thumb_func_start sub_80A5D4C
sub_80A5D4C: @ 80A5D4C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_8075114
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080A5D74 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldr r0, _080A5D78 @ =sub_80A5D7C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5D74: .4byte gBattleAnimArgs
_080A5D78: .4byte sub_80A5D7C
	thumb_func_end sub_80A5D4C

	thumb_func_start sub_80A5D7C
sub_80A5D7C: @ 80A5D7C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080A5D90
	subs r0, r1, 0x1
	strh r0, [r5, 0x2E]
	b _080A5DCC
_080A5D90:
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x1E
	strh r0, [r5, 0x2E]
	ldr r4, _080A5DD4 @ =gBattleAnimAttacker
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
	ldr r0, _080A5DD8 @ =sub_8075590
	str r0, [r5, 0x1C]
	ldr r1, _080A5DDC @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
_080A5DCC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A5DD4: .4byte gBattleAnimAttacker
_080A5DD8: .4byte sub_8075590
_080A5DDC: .4byte DestroyAnimSprite
	thumb_func_end sub_80A5D7C

	thumb_func_start sub_80A5DE0
sub_80A5DE0: @ 80A5DE0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080A5E30 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080A5E28
	movs r0, 0
	strh r0, [r4, 0x8]
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _080A5E28
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080A5E28:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A5E30: .4byte gTasks
	thumb_func_end sub_80A5DE0

	thumb_func_start sub_80A5E34
sub_80A5E34: @ 80A5E34
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r4, 0
	ldr r0, _080A5E9C @ =gBattlersCount
	ldrb r0, [r0]
	cmp r4, r0
	bcs _080A5E90
	ldr r6, _080A5EA0 @ =gBattleAnimArgs
	ldr r5, _080A5EA4 @ =gUnknown_3004FF0
_080A5E48:
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0x1
	bne _080A5E64
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080A5E64
	adds r0, r4, r5
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
_080A5E64:
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	cmp r0, 0x1
	bne _080A5E82
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A5E82
	adds r0, r4, r5
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
_080A5E82:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A5E9C @ =gBattlersCount
	ldrb r0, [r0]
	cmp r4, r0
	bcc _080A5E48
_080A5E90:
	adds r0, r7, 0
	bl DestroyAnimVisualTask
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5E9C: .4byte gBattlersCount
_080A5EA0: .4byte gBattleAnimArgs
_080A5EA4: .4byte gUnknown_3004FF0
	thumb_func_end sub_80A5E34

	thumb_func_start sub_80A5EA8
sub_80A5EA8: @ 80A5EA8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	b _080A5EC2
_080A5EB2:
	ldr r0, _080A5ED8 @ =gUnknown_3004FF0
	adds r0, r4, r0
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080A5EC2:
	ldr r0, _080A5EDC @ =gBattlersCount
	ldrb r0, [r0]
	cmp r4, r0
	bcc _080A5EB2
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A5ED8: .4byte gUnknown_3004FF0
_080A5EDC: .4byte gBattlersCount
	thumb_func_end sub_80A5EA8

	thumb_func_start sub_80A5EE0
sub_80A5EE0: @ 80A5EE0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080A5EF6
	movs r0, 0x30
	strh r0, [r4, 0x20]
	movs r0, 0x28
	b _080A5EFE
_080A5EF6:
	ldr r0, _080A5F20 @ =gBattleAnimArgs
	ldrh r1, [r0]
	strh r1, [r4, 0x20]
	ldrh r0, [r0, 0x2]
_080A5EFE:
	strh r0, [r4, 0x22]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	movs r1, 0xC0
	orrs r0, r1
	strb r0, [r4, 0x3]
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080A5F24 @ =sub_80A5F28
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5F20: .4byte gBattleAnimArgs
_080A5F24: .4byte sub_80A5F28
	thumb_func_end sub_80A5EE0

	thumb_func_start sub_80A5F28
sub_80A5F28: @ 80A5F28
	push {lr}
	adds r1, r0, 0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080A5F3A
	adds r0, r1, 0
	bl DestroyAnimSprite
_080A5F3A:
	pop {r0}
	bx r0
	thumb_func_end sub_80A5F28

	thumb_func_start sub_80A5F40
sub_80A5F40: @ 80A5F40
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080A5F78 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	ldr r2, _080A5F7C @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r2]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x2E]
	strh r1, [r4, 0x30]
	strh r1, [r4, 0x32]
	strh r1, [r4, 0x34]
	movs r0, 0x1
	strh r0, [r4, 0x36]
	ldr r0, _080A5F80 @ =sub_80A5F84
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5F78: .4byte gBattleAnimAttacker
_080A5F7C: .4byte gBattleAnimArgs
_080A5F80: .4byte sub_80A5F84
	thumb_func_end sub_80A5F40

	thumb_func_start sub_80A5F84
sub_80A5F84: @ 80A5F84
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080A5FAE
	movs r0, 0
	strh r0, [r1, 0x30]
	ldrh r2, [r1, 0x32]
	movs r3, 0x32
	ldrsh r0, [r1, r3]
	cmp r0, 0x77
	bgt _080A5FAE
	ldrh r0, [r1, 0x22]
	adds r0, 0x1
	strh r0, [r1, 0x22]
	adds r0, r2, 0x1
	strh r0, [r1, 0x32]
_080A5FAE:
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080A5FBC
	adds r0, r1, 0
	bl DestroyAnimSprite
_080A5FBC:
	pop {r0}
	bx r0
	thumb_func_end sub_80A5F84

	thumb_func_start sub_80A5FC0
sub_80A5FC0: @ 80A5FC0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r7, r0, 24
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8075BE8
	mov r8, r0
	ldr r0, _080A6090 @ =0x0000ffff
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldr r0, _080A6094 @ =gTasks
	mov r9, r0
	lsls r5, r7, 2
	adds r5, r7
	lsls r5, 3
	adds r6, r5, r0
	strh r4, [r6, 0x8]
	strh r4, [r6, 0xA]
	strh r4, [r6, 0xC]
	strh r1, [r6, 0xE]
	strh r4, [r6, 0x10]
	strh r4, [r6, 0x12]
	strh r4, [r6, 0x14]
	movs r0, 0xD
	strh r0, [r6, 0x16]
	movs r0, 0xE
	strh r0, [r6, 0x18]
	movs r0, 0xF
	strh r0, [r6, 0x1A]
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x1
	bl sub_8075CB8
	mov r10, r0
	mov r1, r8
	orrs r1, r0
	mov r8, r1
	movs r0, 0x8
	add r9, r0
	add r5, r9
	adds r0, r5, 0
	adds r0, 0x1C
	adds r5, 0x1E
	adds r1, r5, 0
	mov r2, r8
	bl sub_80765C0
	ldr r0, _080A6098 @ =0x000027d2
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0x80
	lsls r4, 9
	adds r1, r4, 0
	lsls r1, r0
	mov r0, r10
	orrs r0, r1
	mov r10, r0
	ldr r0, _080A609C @ =0x000027d3
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0
	mov r1, r10
	orrs r4, r1
	ldr r0, _080A60A0 @ =0x00007fbb
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _080A60A4 @ =sub_80A60A8
	str r1, [r6]
	adds r0, r7, 0
	bl _call_via_r1
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6090: .4byte 0x0000ffff
_080A6094: .4byte gTasks
_080A6098: .4byte 0x000027d2
_080A609C: .4byte 0x000027d3
_080A60A0: .4byte 0x00007fbb
_080A60A4: .4byte sub_80A60A8
	thumb_func_end sub_80A5FC0

	thumb_func_start sub_80A60A8
sub_80A60A8: @ 80A60A8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080A60D0 @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _080A6194
	cmp r1, 0x1
	bgt _080A60D4
	cmp r1, 0
	beq _080A60E2
	b _080A6232
	.align 2, 0
_080A60D0: .4byte gTasks
_080A60D4:
	cmp r1, 0x2
	bne _080A60DA
	b _080A61EC
_080A60DA:
	cmp r1, 0x3
	bne _080A60E0
	b _080A6220
_080A60E0:
	b _080A6232
_080A60E2:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bgt _080A60F0
	b _080A6232
_080A60F0:
	strh r1, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bgt _080A613C
	ldrh r0, [r4, 0x16]
	ldrh r1, [r4, 0x10]
	adds r0, r1
	strh r0, [r4, 0x10]
	ldrh r2, [r4, 0x18]
	ldrh r3, [r4, 0x12]
	adds r2, r3
	strh r2, [r4, 0x12]
	ldrh r1, [r4, 0x1A]
	ldrh r5, [r4, 0x14]
	adds r1, r5
	strh r1, [r4, 0x14]
	lsls r0, 16
	asrs r0, 19
	lsls r0, 16
	lsrs r0, 16
	lsls r2, 16
	asrs r2, 19
	lsls r2, 16
	lsls r1, 16
	asrs r1, 19
	lsls r1, 16
	lsrs r2, 11
	orrs r0, r2
	lsrs r1, 6
	orrs r0, r1
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	b _080A6146
_080A613C:
	ldr r7, _080A618C @ =0x00007fbb
	mov r12, r7
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080A6146:
	movs r2, 0x1
	movs r3, 0
	movs r1, 0
_080A614C:
	movs r5, 0xE
	ldrsh r0, [r4, r5]
	ands r0, r2
	lsls r5, r2, 17
	adds r6, r3, 0
	adds r6, 0x10
	adds r1, 0x1
	mov r8, r1
	cmp r0, 0
	beq _080A6178
	movs r1, 0x1
	ldr r2, _080A6190 @ =gPlttBufferFaded
_080A6164:
	adds r0, r3, r1
	lsls r0, 1
	adds r0, r2
	mov r7, r12
	strh r7, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xF
	bls _080A6164
_080A6178:
	lsrs r2, r5, 16
	lsls r0, r6, 16
	lsrs r3, r0, 16
	mov r1, r8
	lsls r0, r1, 16
	lsrs r1, r0, 16
	cmp r1, 0xF
	bls _080A614C
	b _080A6232
	.align 2, 0
_080A618C: .4byte 0x00007fbb
_080A6190: .4byte gPlttBufferFaded
_080A6194:
	ldr r0, _080A61DC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080A6232
	movs r2, 0
	ldr r3, _080A61E0 @ =gSprites
	movs r5, 0x14
	adds r5, r3
	mov r12, r5
	ldr r7, _080A61E4 @ =gUnknown_83E3734
	mov r8, r7
	ldr r6, _080A61E8 @ =gUnknown_83E3764
	movs r5, 0x1
_080A61B2:
	lsls r0, r2, 4
	adds r0, r2
	lsls r1, r0, 2
	mov r7, r12
	adds r0, r1, r7
	ldr r0, [r0]
	cmp r0, r8
	beq _080A61C6
	cmp r0, r6
	bne _080A61CA
_080A61C6:
	adds r0, r1, r3
	strh r5, [r0, 0x2E]
_080A61CA:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3F
	bls _080A61B2
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080A6214
	.align 2, 0
_080A61DC: .4byte gPaletteFade
_080A61E0: .4byte gSprites
_080A61E4: .4byte gUnknown_83E3734
_080A61E8: .4byte gUnknown_83E3764
_080A61EC:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	ble _080A6232
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	bl sub_80765C8
	ldr r1, _080A621C @ =0x00007fbb
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_080A6214:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080A6232
	.align 2, 0
_080A621C: .4byte 0x00007fbb
_080A6220:
	ldr r0, _080A6240 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080A6232
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080A6232:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6240: .4byte gPaletteFade
	thumb_func_end sub_80A60A8

	thumb_func_start sub_80A6244
sub_80A6244: @ 80A6244
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080A62C8 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r6, r1]
	cmp r0, 0x1
	bgt _080A6256
	movs r0, 0x2
	strh r0, [r6, 0x4]
_080A6256:
	movs r1, 0x4
	ldrsh r0, [r6, r1]
	cmp r0, 0x7F
	ble _080A6262
	movs r0, 0x7F
	strh r0, [r6, 0x4]
_080A6262:
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldrh r0, [r6, 0x4]
	strh r0, [r5, 0x30]
	ldr r4, _080A62CC @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x2]
	adds r0, r6
	strh r0, [r5, 0x22]
	ldrh r1, [r5, 0x20]
	strh r1, [r5, 0x3A]
	strh r0, [r5, 0x3C]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080A62D4
	ldrb r1, [r5, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r5, 0x3]
	ldrh r0, [r5, 0x20]
	adds r0, 0x28
	strh r0, [r5, 0x20]
	ldrh r4, [r5, 0x22]
	adds r4, 0x14
	strh r4, [r5, 0x22]
	lsls r0, 7
	strh r0, [r5, 0x32]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	ldr r0, _080A62D0 @ =0xffffec00
	b _080A62FA
	.align 2, 0
_080A62C8: .4byte gBattleAnimArgs
_080A62CC: .4byte gBattleAnimTarget
_080A62D0: .4byte 0xffffec00
_080A62D4:
	ldr r0, _080A6314 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080A631C
	ldrh r0, [r5, 0x20]
	subs r0, 0x28
	strh r0, [r5, 0x20]
	ldrh r4, [r5, 0x22]
	adds r4, 0x14
	strh r4, [r5, 0x22]
	lsls r0, 7
	strh r0, [r5, 0x32]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	movs r0, 0xA0
	lsls r0, 5
_080A62FA:
	bl __divsi3
	strh r0, [r5, 0x34]
	lsls r4, 7
	strh r4, [r5, 0x36]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	ldr r0, _080A6318 @ =0xfffff600
	bl __divsi3
	strh r0, [r5, 0x38]
	b _080A6358
	.align 2, 0
_080A6314: .4byte gBattleAnimAttacker
_080A6318: .4byte 0xfffff600
_080A631C:
	ldrh r0, [r5, 0x20]
	adds r0, 0x28
	strh r0, [r5, 0x20]
	ldrh r4, [r5, 0x22]
	subs r4, 0x14
	strh r4, [r5, 0x22]
	lsls r0, 7
	strh r0, [r5, 0x32]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	ldr r0, _080A6364 @ =0xffffec00
	bl __divsi3
	strh r0, [r5, 0x34]
	lsls r4, 7
	strh r4, [r5, 0x36]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	movs r0, 0xA0
	lsls r0, 4
	bl __divsi3
	strh r0, [r5, 0x38]
	ldrb r1, [r5, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x30
	orrs r0, r1
	strb r0, [r5, 0x3]
_080A6358:
	ldr r0, _080A6368 @ =sub_80A636C
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6364: .4byte 0xffffec00
_080A6368: .4byte sub_80A636C
	thumb_func_end sub_80A6244

	thumb_func_start sub_80A636C
sub_80A636C: @ 80A636C
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x34]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	ldrh r1, [r2, 0x38]
	ldrh r3, [r2, 0x36]
	adds r1, r3
	strh r1, [r2, 0x36]
	lsls r0, 16
	asrs r0, 23
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r1, 23
	strh r1, [r2, 0x22]
	ldrh r0, [r2, 0x30]
	subs r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080A63A2
	ldrh r0, [r2, 0x3A]
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x3C]
	strh r0, [r2, 0x22]
_080A63A2:
	movs r1, 0x30
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080A63B0
	adds r0, r2, 0
	bl DestroyAnimSprite
_080A63B0:
	pop {r0}
	bx r0
	thumb_func_end sub_80A636C

	thumb_func_start sub_80A63B4
sub_80A63B4: @ 80A63B4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	ldr r1, _080A6444 @ =gTasks
	adds r6, r0, r1
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x8]
	ldr r0, _080A6448 @ =0x00002771
	bl AllocSpritePalette
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0xA]
	movs r1, 0xA
	ldrsh r0, [r6, r1]
	lsls r0, 20
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r3, r0, 16
	ldr r2, _080A644C @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	lsls r4, r0, 4
	movs r5, 0x1
	ldr r2, _080A6450 @ =gPlttBufferUnfaded
_080A640C:
	adds r1, r3, r5
	lsls r1, 1
	adds r1, r2
	adds r0, r4, r5
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xF
	bls _080A640C
	adds r0, r3, 0
	movs r1, 0x10
	movs r2, 0xB
	movs r3, 0
	bl BlendPalette
	movs r0, 0
	strh r0, [r6, 0xE]
	movs r5, 0
	ldr r7, _080A644C @ =gSprites
	movs r1, 0x1C
	adds r1, r7
	mov r9, r1
	b _080A6488
	.align 2, 0
_080A6444: .4byte gTasks
_080A6448: .4byte 0x00002771
_080A644C: .4byte gSprites
_080A6450: .4byte gPlttBufferUnfaded
_080A6454:
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r4, r2, r7
	ldrb r1, [r6, 0xA]
	lsls r1, 4
	ldrb r3, [r4, 0x5]
	movs r0, 0xF
	ands r0, r3
	orrs r0, r1
	strb r0, [r4, 0x5]
	movs r0, 0
	strh r0, [r4, 0x2E]
	lsls r0, r5, 7
	strh r0, [r4, 0x30]
	mov r0, r8
	strh r0, [r4, 0x32]
	add r2, r9
	ldr r0, _080A64BC @ =sub_80A653C
	str r0, [r2]
	ldrh r0, [r6, 0xE]
	adds r0, 0x1
	strh r0, [r6, 0xE]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_080A6488:
	cmp r5, 0x1
	bhi _080A649A
	movs r0, 0
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080A6454
_080A649A:
	ldr r0, _080A64C0 @ =sub_80A64E0
	str r0, [r6]
	ldr r0, _080A64C4 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A64C8
	movs r1, 0x80
	lsls r1, 2
	movs r0, 0
	bl ClearGpuRegBits
	b _080A64D2
	.align 2, 0
_080A64BC: .4byte sub_80A653C
_080A64C0: .4byte sub_80A64E0
_080A64C4: .4byte gBattleAnimAttacker
_080A64C8:
	movs r1, 0x80
	lsls r1, 3
	movs r0, 0
	bl ClearGpuRegBits
_080A64D2:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A63B4

	thumb_func_start sub_80A64E0
sub_80A64E0: @ 80A64E0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080A6514 @ =gTasks
	adds r0, r1
	movs r1, 0xE
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A6532
	ldr r0, _080A6518 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A651C
	movs r1, 0x80
	lsls r1, 2
	movs r0, 0
	bl SetGpuRegBits
	b _080A6526
	.align 2, 0
_080A6514: .4byte gTasks
_080A6518: .4byte gBattleAnimAttacker
_080A651C:
	movs r1, 0x80
	lsls r1, 3
	movs r0, 0
	bl SetGpuRegBits
_080A6526:
	ldr r0, _080A6538 @ =0x00002771
	bl FreeSpritePaletteByTag
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080A6532:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6538: .4byte 0x00002771
	thumb_func_end sub_80A64E0

	thumb_func_start sub_80A653C
sub_80A653C: @ 80A653C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080A6558
	movs r0, 0
	strh r0, [r5, 0x34]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
_080A6558:
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x40
	ble _080A6580
	ldr r2, _080A657C @ =gTasks
	movs r0, 0x32
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0xE]
	subs r1, 0x1
	strh r1, [r0, 0xE]
	adds r0, r5, 0
	bl obj_delete_but_dont_free_vram
	b _080A65C2
	.align 2, 0
_080A657C: .4byte gTasks
_080A6580:
	ldr r4, _080A65C8 @ =gSineTable
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	lsls r0, 1
	adds r0, r4
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r1, 0x6
	bl __divsi3
	strh r0, [r5, 0x36]
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	lsls r0, 1
	adds r0, r4
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r1, 0xD
	bl __divsi3
	strh r0, [r5, 0x38]
	ldrh r1, [r5, 0x30]
	adds r1, r0
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r5, 0x30]
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, 0x24]
_080A65C2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A65C8: .4byte gSineTable
	thumb_func_end sub_80A653C

	thumb_func_start sub_80A65CC
sub_80A65CC: @ 80A65CC
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080A65E0 @ =DestroyAnimSprite
	bl StoreSpriteCallbackInData6
	ldr r0, _080A65E4 @ =sub_8074F6C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A65E0: .4byte DestroyAnimSprite
_080A65E4: .4byte sub_8074F6C
	thumb_func_end sub_80A65CC

	thumb_func_start sub_80A65E8
sub_80A65E8: @ 80A65E8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r4, _080A6698 @ =gUnknown_83E3898
	ldrh r0, [r4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xFF
	beq _080A662C
	lsls r0, r3, 20
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r3, r0, 16
	movs r2, 0x1
	ldr r5, _080A669C @ =gPlttBufferFaded
_080A6614:
	adds r1, r3, r2
	lsls r1, 1
	adds r1, r5
	lsls r0, r2, 1
	adds r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x5
	bls _080A6614
_080A662C:
	movs r4, 0x1
	ldr r0, _080A6698 @ =gUnknown_83E3898
	mov r8, r0
_080A6632:
	lsls r0, r4, 1
	adds r0, r4
	lsls r5, r0, 2
	mov r1, r8
	adds r0, r5, r1
	ldrh r0, [r0]
	bl AllocSpritePalette
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, 0x1
	mov r12, r4
	cmp r3, 0xFF
	beq _080A667A
	lsls r0, r3, 20
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r3, r0, 16
	movs r2, 0x1
	ldr r7, _080A669C @ =gPlttBufferFaded
	ldr r6, _080A6698 @ =gUnknown_83E3898
	adds r4, r5, 0
_080A6660:
	adds r1, r3, r2
	lsls r1, 1
	adds r1, r7
	lsls r0, r2, 1
	adds r0, r4
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x5
	bls _080A6660
_080A667A:
	mov r1, r12
	lsls r0, r1, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _080A6632
	mov r0, r9
	bl DestroyAnimVisualTask
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6698: .4byte gUnknown_83E3898
_080A669C: .4byte gPlttBufferFaded
	thumb_func_end sub_80A65E8

	thumb_func_start sub_80A66A0
sub_80A66A0: @ 80A66A0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0x1
	ldr r6, _080A66D0 @ =gUnknown_83E3898
_080A66AA:
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r6
	ldrh r0, [r0]
	bl FreeSpritePaletteByTag
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _080A66AA
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A66D0: .4byte gUnknown_83E3898
	thumb_func_end sub_80A66A0

	thumb_func_start sub_80A66D4
sub_80A66D4: @ 80A66D4
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	bl sub_8074FCC
	ldr r4, _080A672C @ =gBattleAnimArgs
	ldrb r1, [r4]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r2, _080A6730 @ =gUnknown_83E3898
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080A6710
	lsls r2, r0, 4
	ldrb r1, [r5, 0x5]
	movs r0, 0xF
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x5]
_080A6710:
	ldrh r0, [r4, 0x2]
	movs r1, 0
	strh r0, [r5, 0x30]
	strh r1, [r5, 0x32]
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x34]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080A6734
	movs r6, 0x30
	movs r3, 0x28
	b _080A674E
	.align 2, 0
_080A672C: .4byte gBattleAnimArgs
_080A6730: .4byte gUnknown_83E3898
_080A6734:
	ldr r4, _080A6784 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r3, r0, 24
_080A674E:
	ldrh r0, [r5, 0x20]
	lsls r1, r0, 4
	strh r1, [r5, 0x36]
	ldrh r1, [r5, 0x22]
	lsls r2, r1, 4
	strh r2, [r5, 0x38]
	subs r0, r6, r0
	lsls r0, 16
	asrs r0, 16
	subs r1, r3, r1
	lsls r1, 16
	asrs r1, 16
	adds r2, r5, 0
	adds r2, 0x3A
	adds r3, r5, 0
	adds r3, 0x3C
	movs r4, 0x28
	str r4, [sp]
	bl sub_80A678C
	ldr r0, _080A6788 @ =sub_80A67E4
	str r0, [r5, 0x1C]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6784: .4byte gBattleAnimTarget
_080A6788: .4byte sub_80A67E4
	thumb_func_end sub_80A66D4

	thumb_func_start sub_80A678C
sub_80A678C: @ 80A678C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r2, 0
	mov r8, r3
	ldr r2, [sp, 0x18]
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r1, r2, 24
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bge _080A67AE
	lsls r0, r1, 24
	negs r0, r0
	lsrs r1, r0, 24
_080A67AE:
	lsls r5, r2, 8
	lsls r1, 24
	asrs r1, 24
	adds r0, r5, 0
	bl __divsi3
	adds r4, r0, 0
	cmp r4, 0
	bne _080A67C2
	movs r4, 0x1
_080A67C2:
	adds r0, r5, 0
	adds r1, r4, 0
	bl __divsi3
	strh r0, [r7]
	lsls r0, r6, 16
	asrs r0, 8
	adds r1, r4, 0
	bl __divsi3
	mov r1, r8
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A678C

	thumb_func_start sub_80A67E4
sub_80A67E4: @ 80A67E4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0x2E]
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r1, r0, r1
	adds r0, r1, 0
	cmp r1, 0
	bge _080A6800
	adds r0, 0xFF
_080A6800:
	asrs r0, 8
	lsls r0, 8
	subs r0, r1, r0
	ldrh r1, [r4, 0x3A]
	ldrh r2, [r4, 0x36]
	adds r1, r2
	strh r1, [r4, 0x36]
	ldrh r2, [r4, 0x3C]
	ldrh r3, [r4, 0x38]
	adds r2, r3
	strh r2, [r4, 0x38]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r4, 0x20]
	lsls r2, 16
	asrs r2, 20
	strh r2, [r4, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0xF
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	ldrh r0, [r4, 0x20]
	adds r0, 0x10
	lsls r0, 16
	movs r1, 0x88
	lsls r1, 17
	cmp r0, r1
	bhi _080A684E
	lsls r0, r2, 16
	asrs r1, r0, 16
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	blt _080A684E
	cmp r1, 0x80
	ble _080A6856
_080A684E:
	adds r0, r4, 0
	bl move_anim_8074EE0
	b _080A68A6
_080A6856:
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	cmp r1, 0
	beq _080A68A6
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, r1
	ble _080A68A6
	strh r5, [r4, 0x32]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080A687E
	strh r5, [r4, 0x30]
_080A687E:
	ldr r2, _080A68AC @ =gUnknown_83E3898
	movs r3, 0x30
	ldrsh r1, [r4, r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080A68A6
	lsls r2, r0, 4
	ldrb r1, [r4, 0x5]
	movs r0, 0xF
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
_080A68A6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A68AC: .4byte gUnknown_83E3898
	thumb_func_end sub_80A67E4

	thumb_func_start sub_80A68B0
sub_80A68B0: @ 80A68B0
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r7, _080A6934 @ =gBattleAnimAttacker
	ldrb r0, [r7]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A68CE
	ldr r1, _080A6938 @ =gBattleAnimArgs
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080A68CE:
	ldrb r0, [r7]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	ldr r4, _080A6938 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	movs r5, 0
	strh r0, [r6, 0x20]
	ldrb r0, [r7]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r4, 0x4]
	adds r0, r2
	strh r0, [r6, 0x22]
	ldrb r1, [r4]
	adds r0, r6, 0
	bl StartSpriteAnim
	strh r5, [r6, 0x32]
	strh r5, [r6, 0x34]
	ldrh r0, [r6, 0x20]
	lsls r0, 4
	strh r0, [r6, 0x36]
	ldrh r0, [r6, 0x22]
	lsls r0, 4
	strh r0, [r6, 0x38]
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	lsls r0, 4
	movs r1, 0x5
	bl __divsi3
	strh r0, [r6, 0x3A]
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	lsls r0, 7
	movs r1, 0x5
	bl __divsi3
	strh r0, [r6, 0x3C]
	ldr r0, _080A693C @ =sub_80A6940
	str r0, [r6, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6934: .4byte gBattleAnimAttacker
_080A6938: .4byte gBattleAnimArgs
_080A693C: .4byte sub_80A6940
	thumb_func_end sub_80A68B0

	thumb_func_start sub_80A6940
sub_80A6940: @ 80A6940
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x36]
	adds r0, r1
	strh r0, [r4, 0x36]
	ldrh r1, [r4, 0x3C]
	ldrh r2, [r4, 0x38]
	adds r1, r2
	strh r1, [r4, 0x38]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r4, 0x22]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	ble _080A699E
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080A699E
	ldrh r0, [r4, 0x32]
	adds r0, 0x10
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0x12
	bl Cos
	strh r0, [r4, 0x24]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r1, 0x12
	bl Sin
	strh r0, [r4, 0x26]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080A699E
	movs r0, 0x1
	strh r0, [r4, 0x34]
_080A699E:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x30
	bne _080A69B2
	adds r0, r4, 0
	bl move_anim_8074EE0
_080A69B2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A6940

	thumb_func_start sub_80A69B8
sub_80A69B8: @ 80A69B8
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _080A69D8 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _080A69DC
	ldrb r0, [r5, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	orrs r1, r0
	strb r1, [r5, 0x3]
	movs r6, 0x10
	b _080A69DE
	.align 2, 0
_080A69D8: .4byte gBattleAnimArgs
_080A69DC:
	ldr r6, _080A6A18 @ =0x0000fff0
_080A69DE:
	ldr r4, _080A6A1C @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, r6
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x8
	strh r0, [r5, 0x22]
	movs r0, 0x8
	strh r0, [r5, 0x2E]
	ldr r0, _080A6A20 @ =sub_8074C44
	str r0, [r5, 0x1C]
	ldr r1, _080A6A24 @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6A18: .4byte 0x0000fff0
_080A6A1C: .4byte gBattleAnimAttacker
_080A6A20: .4byte sub_8074C44
_080A6A24: .4byte DestroyAnimSprite
	thumb_func_end sub_80A69B8

	thumb_func_start sub_80A6A28
sub_80A6A28: @ 80A6A28
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_8074FCC
	ldrh r0, [r4, 0x22]
	adds r0, 0x8
	strh r0, [r4, 0x22]
	ldr r5, _080A6AA0 @ =gBattleAnimArgs
	ldrb r1, [r5, 0x2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r2, _080A6AA4 @ =gUnknown_83E3898
	movs r0, 0x4
	ldrsh r1, [r5, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080A6A68
	lsls r2, r0, 4
	ldrb r1, [r4, 0x5]
	movs r0, 0xF
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
_080A6A68:
	movs r1, 0
	ldrsh r0, [r5, r1]
	movs r2, 0x20
	cmp r0, 0
	bne _080A6A74
	ldr r2, _080A6AA8 @ =0x0000ffe0
_080A6A74:
	movs r0, 0x28
	strh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x20]
	strh r1, [r4, 0x30]
	lsls r0, r2, 16
	asrs r0, 16
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	subs r0, 0x28
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x38]
	ldr r0, _080A6AAC @ =sub_80A6AB0
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6AA0: .4byte gBattleAnimArgs
_080A6AA4: .4byte gUnknown_83E3898
_080A6AA8: .4byte 0x0000ffe0
_080A6AAC: .4byte sub_80A6AB0
	thumb_func_end sub_80A6A28

	thumb_func_start sub_80A6AB0
sub_80A6AB0: @ 80A6AB0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	bne _080A6B00
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x8
	bl Sin
	lsls r0, 16
	lsrs r1, r0, 16
	ldrh r2, [r4, 0x24]
	movs r3, 0x24
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bge _080A6ADC
	lsls r0, r1, 16
	negs r0, r0
	lsrs r1, r0, 16
_080A6ADC:
	lsls r0, r1, 16
	asrs r0, 16
	adds r0, r2
	strh r0, [r4, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x4
	bl Sin
	ldrh r3, [r4, 0x26]
	adds r0, r3
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	adds r0, 0x8
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	b _080A6B06
_080A6B00:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080A6B06:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A6AB0

	thumb_func_start sub_80A6B0C
sub_80A6B0C: @ 80A6B0C
	push {r4-r6,lr}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080A6B2C
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_8076B2C
	adds r0, 0x8
	b _080A6B36
_080A6B2C:
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_8076B2C
	subs r0, 0x8
_080A6B36:
	strh r0, [r6, 0x20]
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_8074480
	adds r4, r0, 0
	adds r0, r5, 0
	movs r1, 0
	bl sub_8076B2C
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080A6B58
	adds r0, 0x3
_080A6B58:
	asrs r0, 2
	subs r0, r4, r0
	strh r0, [r6, 0x22]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A6B0C

	thumb_func_start sub_80A6B64
sub_80A6B64: @ 80A6B64
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080A6B78 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A6B80
	ldr r0, _080A6B7C @ =gBattleAnimAttacker
	b _080A6B82
	.align 2, 0
_080A6B78: .4byte gBattleAnimArgs
_080A6B7C: .4byte gBattleAnimAttacker
_080A6B80:
	ldr r0, _080A6BC0 @ =gBattleAnimTarget
_080A6B82:
	ldrb r4, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80A6B0C
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	negs r1, r0
	orrs r1, r0
	lsrs r1, 31
	ldr r0, _080A6BC4 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x2]
	strh r0, [r5, 0x2E]
	adds r0, r1, 0x2
	strh r0, [r5, 0x30]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r1, _080A6BC8 @ =sub_80A6BD0
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080A6BCC @ =sub_8074F6C
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6BC0: .4byte gBattleAnimTarget
_080A6BC4: .4byte gBattleAnimArgs
_080A6BC8: .4byte sub_80A6BD0
_080A6BCC: .4byte sub_8074F6C
	thumb_func_end sub_80A6B64

	thumb_func_start sub_80A6BD0
sub_80A6BD0: @ 80A6BD0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _080A6BF8
	ldr r1, _080A6C00 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _080A6C04 @ =sub_8074F6C
	str r0, [r4, 0x1C]
_080A6BF8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6C00: .4byte DestroyAnimSprite
_080A6C04: .4byte sub_8074F6C
	thumb_func_end sub_80A6BD0

	thumb_func_start sub_80A6C08
sub_80A6C08: @ 80A6C08
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080A6C1C @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A6C24
	ldr r0, _080A6C20 @ =gBattleAnimAttacker
	b _080A6C26
	.align 2, 0
_080A6C1C: .4byte gBattleAnimArgs
_080A6C20: .4byte gBattleAnimAttacker
_080A6C24:
	ldr r0, _080A6C44 @ =gBattleAnimTarget
_080A6C26:
	ldrb r0, [r0]
	adds r1, r4, 0
	bl sub_80A6B0C
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r1, _080A6C48 @ =sub_80A6C50
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080A6C4C @ =sub_8074F50
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6C44: .4byte gBattleAnimTarget
_080A6C48: .4byte sub_80A6C50
_080A6C4C: .4byte sub_8074F50
	thumb_func_end sub_80A6C08

	thumb_func_start sub_80A6C50
sub_80A6C50: @ 80A6C50
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080A6C76
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r1, _080A6C7C @ =move_anim_8074EE0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080A6C80 @ =sub_8074F50
	str r0, [r4, 0x1C]
_080A6C76:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6C7C: .4byte move_anim_8074EE0
_080A6C80: .4byte sub_8074F50
	thumb_func_end sub_80A6C50

	thumb_func_start sub_80A6C84
sub_80A6C84: @ 80A6C84
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r0, _080A6C98 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A6CA0
	ldr r0, _080A6C9C @ =gBattleAnimAttacker
	b _080A6CA2
	.align 2, 0
_080A6C98: .4byte gBattleAnimArgs
_080A6C9C: .4byte gBattleAnimAttacker
_080A6CA0:
	ldr r0, _080A6CF4 @ =gBattleAnimTarget
_080A6CA2:
	ldrb r5, [r0]
	adds r0, r5, 0
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8076B2C
	strh r0, [r4, 0x22]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bgt _080A6CCA
	movs r0, 0xA
	strh r0, [r4, 0x22]
_080A6CCA:
	movs r0, 0x1
	strh r0, [r4, 0x2E]
	strh r6, [r4, 0x30]
	adds r1, r4, 0
	adds r1, 0x43
	ldrb r0, [r1]
	strh r0, [r4, 0x32]
	ldrb r0, [r1]
	adds r0, 0x4
	strh r0, [r4, 0x34]
	strh r6, [r4, 0x36]
	ldr r1, _080A6CF8 @ =sub_80A6D00
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080A6CFC @ =sub_8074F50
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6CF4: .4byte gBattleAnimTarget
_080A6CF8: .4byte sub_80A6D00
_080A6CFC: .4byte sub_8074F50
	thumb_func_end sub_80A6C84

	thumb_func_start sub_80A6D00
sub_80A6D00: @ 80A6D00
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x36]
	adds r0, 0x1
	strh r0, [r1, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080A6D16
	ldr r0, _080A6D1C @ =sub_80A6D20
	str r0, [r1, 0x1C]
_080A6D16:
	pop {r0}
	bx r0
	.align 2, 0
_080A6D1C: .4byte sub_80A6D20
	thumb_func_end sub_80A6D00

	thumb_func_start sub_80A6D20
sub_80A6D20: @ 80A6D20
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	adds r1, r0, 0x4
	strh r1, [r2, 0x30]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFE
	ble _080A6D52
	ldrh r0, [r2, 0x2E]
	subs r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bne _080A6D4C
	strh r0, [r2, 0x24]
	ldr r0, _080A6D48 @ =sub_80A6C50
	str r0, [r2, 0x1C]
	b _080A6D88
	.align 2, 0
_080A6D48: .4byte sub_80A6C50
_080A6D4C:
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2, 0x30]
_080A6D52:
	movs r1, 0x30
	ldrsh r0, [r2, r1]
	cmp r0, 0x4F
	ble _080A6D62
	ldrh r0, [r2, 0x34]
	adds r1, r2, 0
	adds r1, 0x43
	strb r0, [r1]
_080A6D62:
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r0, 0x9F
	ble _080A6D72
	ldrh r0, [r2, 0x32]
	adds r1, r2, 0
	adds r1, 0x43
	strb r0, [r1]
_080A6D72:
	ldr r1, _080A6D8C @ =gSineTable
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 19
	asrs r1, r0, 1
	adds r0, r1
	strh r0, [r2, 0x24]
_080A6D88:
	pop {r0}
	bx r0
	.align 2, 0
_080A6D8C: .4byte gSineTable
	thumb_func_end sub_80A6D20

	thumb_func_start sub_80A6D90
sub_80A6D90: @ 80A6D90
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080A6DA4 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A6DAC
	ldr r0, _080A6DA8 @ =gBattleAnimAttacker
	b _080A6DAE
	.align 2, 0
_080A6DA4: .4byte gBattleAnimArgs
_080A6DA8: .4byte gBattleAnimAttacker
_080A6DAC:
	ldr r0, _080A6DD0 @ =gBattleAnimTarget
_080A6DAE:
	ldrb r4, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80A6B0C
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080A6DD4
	adds r0, r5, 0
	movs r1, 0
	bl StartSpriteAnim
	movs r0, 0x2
	b _080A6DDE
	.align 2, 0
_080A6DD0: .4byte gBattleAnimTarget
_080A6DD4:
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
	movs r0, 0x3
_080A6DDE:
	strh r0, [r5, 0x2E]
	ldr r0, _080A6DEC @ =sub_80A6DF0
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6DEC: .4byte sub_80A6DF0
	thumb_func_end sub_80A6D90

	thumb_func_start sub_80A6DF0
sub_80A6DF0: @ 80A6DF0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	ble _080A6E1E
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r1, _080A6E24 @ =sub_80A6E2C
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080A6E28 @ =sub_8074F6C
	str r0, [r4, 0x1C]
_080A6E1E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6E24: .4byte sub_80A6E2C
_080A6E28: .4byte sub_8074F6C
	thumb_func_end sub_80A6DF0

	thumb_func_start sub_80A6E2C
sub_80A6E2C: @ 80A6E2C
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080A6E44
	adds r0, r1, 0
	bl DestroyAnimSprite
_080A6E44:
	pop {r0}
	bx r0
	thumb_func_end sub_80A6E2C

	.align 2, 0 @ Don't pad with nop.
